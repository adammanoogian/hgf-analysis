"""Phase 25-05 Task 2: NUTS recovery run with prototype vs sequential likelihood.

Runs BlackJAX NUTS on a simulated cohort (P=20, T=420, seed=2505) with one of
two backends, controlled by ``--backend {proto,sequential}``.  The SLURM
driver (``cluster/25_proto_recovery_gpu.slurm``) launches both backends
sequentially, writing chains to::

    .../results/recovery_chains_sequential.nc
    .../results/recovery_chains_proto.nc

Subsequent comparison (Task 3) reads both NetCDF files and produces
``recovery_comparison.json`` + ``RECOVERY_COMPARISON.md``.

BLOCKER: prototype differentiability
------------------------------------
Both ``parallel_scan_likelihood`` and ``sequential_likelihood`` in
``src/prl_hgf/fitting/parallel_scan_proto.py`` currently call
``float(theta["..."])`` inside ``_build_hgf_closures``, which concretizes
JAX-traced parameters during ``jax.grad``.  ``proto_grad_check.py`` will
flag this as ``ConcretizationTypeError`` before NUTS can run.

Fix prerequisite (mirrors ``hierarchical.py::_single_logp_3level``):
    1. Build network ONCE with placeholder defaults.
    2. Inject JAX-traced (omega_2, omega_3, kappa, beta, zeta) via
       shallow-copy + ``node["tonic_volatility"] = omega_2`` pattern at
       per-call evaluation time.
    3. Don't reuse ``_build_hgf_closures(theta)`` per call — capture
       (scan_fn, base_attrs) once at module load.

Until the prototype is refactored, this script raises ``SystemExit`` with a
clear diagnostic at startup.  See ``proto_grad_check.py`` for the exact
error and proposed fix.

Usage
-----
    python .../scratch/proto_recovery_run.py --backend sequential \\
        --seed 2505 --n-participants 20 --num-warmup 1000 --num-samples 1000 \\
        --out .../results/recovery_chains_sequential.nc

    python .../scratch/proto_recovery_run.py --backend proto \\
        --seed 2505 --n-participants 20 --num-warmup 1000 --num-samples 1000 \\
        --out .../results/recovery_chains_proto.nc
"""
from __future__ import annotations

import os

# float64 must be set before jax import (Risk #6 from 25-00b)
os.environ["JAX_ENABLE_X64"] = "1"

import argparse
import json
import sys
import time
from pathlib import Path

import jax
import jax.numpy as jnp
import numpy as np

_PARAM_NAMES: tuple[str, ...] = ("omega_2", "omega_3", "kappa", "beta", "zeta")


# ---------------------------------------------------------------------------
# Argparse
# ---------------------------------------------------------------------------

def _parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--backend",
        choices=["proto", "sequential"],
        required=True,
        help="Likelihood backend: parallel-scan prototype or sequential lax.scan.",
    )
    parser.add_argument("--seed", type=int, default=2505)
    parser.add_argument("--n-participants", type=int, default=20)
    parser.add_argument("--n-trials", type=int, default=420)
    parser.add_argument("--num-warmup", type=int, default=1000)
    parser.add_argument("--num-samples", type=int, default=1000)
    parser.add_argument("--num-chains", type=int, default=4)
    parser.add_argument("--out", type=str, required=True)
    parser.add_argument(
        "--allow-unblocked",
        action="store_true",
        help=(
            "Skip the prototype differentiability blocker check.  Only set "
            "this AFTER `proto_grad_check.py` reports PASS."
        ),
    )
    return parser.parse_args()


# ---------------------------------------------------------------------------
# Differentiability blocker check
# ---------------------------------------------------------------------------

def _check_differentiability_or_exit() -> None:
    """Verify ``jax.grad`` of both prototype likelihoods produces finite output.

    Raises SystemExit with a clear diagnostic if the prototype's
    ``_build_hgf_closures`` still concretizes theta via ``float()``.
    """
    from prl_hgf.fitting.parallel_scan_proto import (
        parallel_scan_likelihood,
        sequential_likelihood,
    )

    n_trials = 32
    rng = np.random.default_rng(2505)
    choices = (np.arange(n_trials) % 3).astype(np.int32)
    rewards = rng.integers(0, 2, size=n_trials).astype(np.int32)

    theta_flat = jnp.array([-3.5, -5.0, 1.0, 2.0, 0.0], dtype=jnp.float64)

    def _loss_seq(t: jax.Array) -> jax.Array:
        theta = {n: t[i] for i, n in enumerate(_PARAM_NAMES)}
        return -sequential_likelihood(theta, choices, rewards)

    def _loss_par(t: jax.Array) -> jax.Array:
        theta = {n: t[i] for i, n in enumerate(_PARAM_NAMES)}
        ll, _ = parallel_scan_likelihood(theta, choices, rewards)
        return -ll

    diagnostics: list[str] = []
    for name, fn in [("sequential", _loss_seq), ("parallel", _loss_par)]:
        try:
            g = jax.grad(fn)(theta_flat)
            if not bool(jnp.all(jnp.isfinite(g))):
                diagnostics.append(
                    f"{name}: jax.grad returned non-finite values: {g}"
                )
        except Exception as exc:  # noqa: BLE001
            diagnostics.append(
                f"{name}: jax.grad raised {type(exc).__name__}: {exc}"
            )

    if diagnostics:
        msg = (
            "BLOCKER: prototype likelihoods are not differentiable wrt theta.\n"
            "  " + "\n  ".join(diagnostics) + "\n\n"
            "Fix prerequisite (mirror src/prl_hgf/fitting/hierarchical.py::"
            "_single_logp_3level):\n"
            "  1. Build network ONCE with placeholder defaults.\n"
            "  2. Inject JAX-traced (omega_2, omega_3, kappa, beta, zeta) via\n"
            "     shallow-copy + node[\"tonic_volatility\"] = omega_2 pattern\n"
            "     at per-call evaluation time.\n"
            "  3. Re-run `proto_grad_check.py` until it reports PASS.\n"
            "Then re-launch this script with --allow-unblocked.\n"
        )
        print(msg, file=sys.stderr)
        raise SystemExit(2)


# ---------------------------------------------------------------------------
# Cohort simulation
# ---------------------------------------------------------------------------

def _simulate_cohort(
    n_participants: int, n_trials: int, seed: int
) -> tuple[np.ndarray, np.ndarray, dict[str, np.ndarray]]:
    """Simulate (choices, rewards, true_params) for a synthetic recovery cohort.

    Uses round-robin cue rotation with a 4-block reversal probability schedule
    (matches the 25-04 numerical agreement test setup).  Each participant
    has an independently sampled (omega_2, omega_3, kappa, beta, zeta) drawn
    from the prior support.

    Parameters
    ----------
    n_participants, n_trials, seed
        See module docstring.

    Returns
    -------
    choices : np.ndarray, shape (P, T), int32
    rewards : np.ndarray, shape (P, T), int32
    true_params : dict[str, np.ndarray], shape (P,) per param
    """
    rng = np.random.default_rng(seed)
    P, T = n_participants, n_trials

    # Reversal-regime reward probability schedule per 25-04
    block_size = T // 4
    p_high = np.r_[
        np.full(block_size, 0.7),
        np.full(block_size, 0.3),
        np.full(block_size, 0.7),
        np.full(T - 3 * block_size, 0.3),
    ]

    choices = np.tile((np.arange(T) % 3).astype(np.int32), (P, 1))
    rewards = (rng.uniform(size=(P, T)) < p_high[None, :]).astype(np.int32)

    true_params = {
        "omega_2": rng.uniform(-6.0, -2.0, size=P),
        "omega_3": rng.uniform(-7.0, -2.5, size=P),
        "kappa": rng.uniform(0.5, 1.5, size=P),
        "beta": rng.uniform(0.5, 4.0, size=P),
        "zeta": rng.uniform(-1.0, 1.0, size=P),
    }
    return choices, rewards, true_params


# ---------------------------------------------------------------------------
# Log-prior + log-posterior builders
# ---------------------------------------------------------------------------

def _log_prior(theta: jax.Array) -> jax.Array:
    """Independent priors matching the 25-05 simulation support.

    Uses TruncatedNormal-style soft constraints via Normal log-pdf with broad
    scales — keeps NUTS HMC well-defined while only weakly informative.  The
    exact prior choice is not the gating concern at this scale; the goal is
    proto-vs-sequential equivalence on identical priors.
    """
    locs = jnp.array([-4.0, -5.0, 1.0, 2.0, 0.0], dtype=jnp.float64)
    scales = jnp.array([2.0, 2.0, 0.5, 1.0, 0.5], dtype=jnp.float64)
    z = (theta - locs) / scales
    return -0.5 * jnp.sum(z * z) - jnp.sum(jnp.log(scales))


def _make_log_posterior(
    backend: str, choices_p: np.ndarray, rewards_p: np.ndarray
):
    """Return log-posterior(theta_flat) closure for one participant.

    Dispatches BEFORE define (per plan Task 2 JAX-tracing-hazard note).
    """
    from prl_hgf.fitting.parallel_scan_proto import (
        parallel_scan_likelihood,
        sequential_likelihood,
    )

    if backend == "proto":
        def log_posterior(theta_flat: jax.Array) -> jax.Array:
            theta = {n: theta_flat[i] for i, n in enumerate(_PARAM_NAMES)}
            log_lik, _diag = parallel_scan_likelihood(theta, choices_p, rewards_p)
            return _log_prior(theta_flat) + log_lik
    elif backend == "sequential":
        def log_posterior(theta_flat: jax.Array) -> jax.Array:
            theta = {n: theta_flat[i] for i, n in enumerate(_PARAM_NAMES)}
            log_lik = sequential_likelihood(theta, choices_p, rewards_p)
            return _log_prior(theta_flat) + log_lik
    else:
        raise ValueError(f"Unknown backend: {backend!r}")

    return log_posterior


# ---------------------------------------------------------------------------
# BlackJAX inference loop
# ---------------------------------------------------------------------------

def _inference_loop(rng_key, kernel, initial_state, num_samples: int):
    """Standard BlackJAX inference loop using lax.scan."""
    @jax.jit
    def one_step(state, rng_key):
        state, info = kernel(rng_key, state)
        return state, (state, info)

    keys = jax.random.split(rng_key, num_samples)
    _, (states, infos) = jax.lax.scan(one_step, initial_state, keys)
    return states, infos


def _run_nuts_for_participant(
    log_posterior,
    rng_key,
    init_position: jax.Array,
    num_warmup: int,
    num_samples: int,
):
    """Run window_adaptation + NUTS sampling for a single participant."""
    import blackjax

    warmup = blackjax.window_adaptation(blackjax.nuts, log_posterior)
    (warmup_state, kernel_params), _ = warmup.run(
        rng_key, init_position, num_steps=num_warmup
    )
    nuts = blackjax.nuts(log_posterior, **kernel_params)
    states, infos = _inference_loop(
        rng_key, nuts.step, warmup_state, num_samples
    )
    return states, infos


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main() -> int:
    args = _parse_args()

    if not args.allow_unblocked:
        _check_differentiability_or_exit()

    out_path = Path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)

    print(
        f"[25-05] backend={args.backend} P={args.n_participants} "
        f"T={args.n_trials} warmup={args.num_warmup} samples={args.num_samples} "
        f"chains={args.num_chains} seed={args.seed}"
    )

    # Simulate cohort
    choices, rewards, true_params = _simulate_cohort(
        args.n_participants, args.n_trials, args.seed
    )

    # Per-participant init position from priors
    rng_init = np.random.default_rng(args.seed + 1)
    init_positions = jnp.array(
        rng_init.normal(
            loc=[-4.0, -5.0, 1.0, 2.0, 0.0],
            scale=[0.5, 0.5, 0.1, 0.5, 0.2],
            size=(args.num_chains, args.n_participants, 5),
        ),
        dtype=jnp.float64,
    )  # (chains, P, 5)

    # Per-participant NUTS — outer loop across participants and chains
    rng_key = jax.random.PRNGKey(args.seed)
    chain_keys = jax.random.split(rng_key, args.num_chains)

    posterior_samples = np.zeros(
        (args.num_chains, args.num_samples, args.n_participants, 5),
        dtype=np.float64,
    )
    diverging = np.zeros(
        (args.num_chains, args.num_samples, args.n_participants), dtype=bool
    )
    log_density = np.zeros(
        (args.num_chains, args.num_samples, args.n_participants),
        dtype=np.float64,
    )

    t0 = time.perf_counter()
    for c in range(args.num_chains):
        for p in range(args.n_participants):
            log_post = _make_log_posterior(args.backend, choices[p], rewards[p])
            states, infos = _run_nuts_for_participant(
                log_post,
                jax.random.fold_in(chain_keys[c], p),
                init_positions[c, p],
                args.num_warmup,
                args.num_samples,
            )
            posterior_samples[c, :, p, :] = np.asarray(states.position)
            diverging[c, :, p] = np.asarray(infos.is_divergent)
            log_density[c, :, p] = np.asarray(states.logdensity)
        print(
            f"  chain {c + 1}/{args.num_chains} done "
            f"({time.perf_counter() - t0:.1f}s elapsed)"
        )
    wall = time.perf_counter() - t0

    # Save chains via ArviZ
    import arviz as az

    posterior = {
        name: posterior_samples[..., i] for i, name in enumerate(_PARAM_NAMES)
    }
    sample_stats = {"diverging": diverging, "lp": log_density}
    constant_data = {"true_" + k: v for k, v in true_params.items()}
    constant_data["choices"] = choices
    constant_data["rewards"] = rewards

    idata = az.from_dict(
        posterior=posterior,
        sample_stats=sample_stats,
        constant_data=constant_data,
    )
    idata.to_netcdf(str(out_path))

    summary = {
        "backend": args.backend,
        "P": args.n_participants,
        "T": args.n_trials,
        "num_warmup": args.num_warmup,
        "num_samples": args.num_samples,
        "num_chains": args.num_chains,
        "wall_seconds": wall,
        "out": str(out_path),
        "n_divergences": int(diverging.sum()),
    }
    print(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
