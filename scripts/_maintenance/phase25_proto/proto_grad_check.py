"""Phase 25-05 Task 1: differentiability check on prototype likelihoods.

Compares ``jax.grad(parallel_scan_likelihood)`` to ``jax.grad(sequential_likelihood)``
at multiple random theta points.  Pass criterion (per 25-05-PLAN.md):

    rel_err = max(|g_par - g_seq| / (|g_seq| + 1e-12)) < 1e-3
    g_par all finite
    over >= 5 random theta points.

Local CPU run; no GPU needed.  Writes per-trial diagnostics to
``results/proto_grad_check.log``.

Known prototype constraint
--------------------------
The prototype likelihoods in ``src/prl_hgf/fitting/parallel_scan_proto.py``
currently call ``float(theta["omega_2"])`` etc. inside ``_build_hgf_closures``.
Concretizing JAX arrays during tracing raises ``ConcretizationTypeError``,
which means ``jax.grad`` cannot flow through ``omega_2``, ``omega_3``,
``kappa`` (and the same float-cast on beta/zeta blocks those too).

This script catches that error explicitly and reports it as the diagnosed
failure mode.  The fix mirrors the production pattern in
``src/prl_hgf/fitting/hierarchical.py::_single_logp_3level`` — build the
network once with placeholder defaults, then inject JAX-traced params via
the shallow-copy + ``node["tonic_volatility"] = omega_2`` pattern.

Usage
-----
    python scripts/_maintenance/phase25_proto/proto_grad_check.py
"""
from __future__ import annotations

import os

# float64 must be set before jax import (Risk #6 from 25-00b)
os.environ["JAX_ENABLE_X64"] = "1"

import json
import sys
import traceback
from pathlib import Path

import jax
import jax.numpy as jnp
import numpy as np

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------
_PROJECT_ROOT = Path(__file__).resolve().parents[3]
_RESULTS_DIR = _PROJECT_ROOT / "logs" / "phase25"
_LOG_PATH = _RESULTS_DIR / "proto_grad_check.log"


# ---------------------------------------------------------------------------
# Theta unflatten: flat (5,) -> dict expected by prototype likelihoods
# ---------------------------------------------------------------------------
_PARAM_NAMES: tuple[str, ...] = ("omega_2", "omega_3", "kappa", "beta", "zeta")


def unflatten(theta_flat: jax.Array) -> dict[str, jax.Array]:
    """Convert flat (5,) array to dict ``{omega_2, omega_3, kappa, beta, zeta}``."""
    return {name: theta_flat[i] for i, name in enumerate(_PARAM_NAMES)}


# ---------------------------------------------------------------------------
# Synthetic single-participant trial sequence (3-cue PRL skeleton)
# ---------------------------------------------------------------------------

def _synthetic_choices_rewards(
    n_trials: int = 60, seed: int = 2505
) -> tuple[np.ndarray, np.ndarray]:
    """Build a deterministic single-participant trial sequence for grad probing.

    Round-robin choices and pseudo-random rewards keep the LL well-defined
    without requiring a full ``simulate_batch`` cohort.

    Parameters
    ----------
    n_trials : int
        Number of trials.
    seed : int
        RNG seed for reward draws.

    Returns
    -------
    choices : np.ndarray, shape (n_trials,), int32
    rewards : np.ndarray, shape (n_trials,), int32
    """
    rng = np.random.default_rng(seed)
    choices = (np.arange(n_trials) % 3).astype(np.int32)
    rewards = rng.integers(0, 2, size=n_trials).astype(np.int32)
    return choices, rewards


# ---------------------------------------------------------------------------
# Loss wrappers (negative log-likelihood; jax.grad-friendly signature)
# ---------------------------------------------------------------------------

def _make_losses(choices: np.ndarray, rewards: np.ndarray):
    """Return (loss_par, loss_seq) closures over fixed (choices, rewards)."""
    from prl_hgf.fitting.parallel_scan_proto import (
        parallel_scan_likelihood,
        sequential_likelihood,
    )

    def loss_par(theta_flat: jax.Array) -> jax.Array:
        theta = unflatten(theta_flat)
        log_lik, _diag = parallel_scan_likelihood(theta, choices, rewards)
        return -log_lik

    def loss_seq(theta_flat: jax.Array) -> jax.Array:
        theta = unflatten(theta_flat)
        return -sequential_likelihood(theta, choices, rewards)

    return loss_par, loss_seq


# ---------------------------------------------------------------------------
# Theta sampling: realistic ranges per CLAUDE.md model parameters table
# ---------------------------------------------------------------------------

def _sample_theta(rng: np.random.Generator) -> jnp.ndarray:
    """Draw a realistic (omega_2, omega_3, kappa, beta, zeta) flat vector.

    Ranges match the simulation prior support (see
    ``configs/prl_analysis.yaml`` and 25-04 numerical agreement test).
    """
    theta_flat = jnp.array(
        [
            float(rng.uniform(-6.0, -2.0)),  # omega_2
            float(rng.uniform(-7.0, -2.5)),  # omega_3
            float(rng.uniform(0.5, 1.5)),    # kappa
            float(rng.uniform(0.5, 4.0)),    # beta
            float(rng.uniform(-1.0, 1.0)),   # zeta
        ],
        dtype=jnp.float64,
    )
    return theta_flat


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main() -> int:
    _RESULTS_DIR.mkdir(parents=True, exist_ok=True)

    # Sanity: x64 active
    if not jax.config.jax_enable_x64:
        print("ERROR: JAX_ENABLE_X64 not active. Aborting.", file=sys.stderr)
        return 2

    choices, rewards = _synthetic_choices_rewards(n_trials=60, seed=2505)
    loss_par, loss_seq = _make_losses(choices, rewards)
    grad_par = jax.grad(loss_par)
    grad_seq = jax.grad(loss_seq)

    rng = np.random.default_rng(seed=2505)
    n_trials_check = 5
    log_lines: list[str] = []
    failures: list[dict] = []
    rel_errs: list[float] = []

    print(
        f"Running differentiability check across {n_trials_check} random "
        f"theta points (T={len(choices)}, params={_PARAM_NAMES})..."
    )

    for trial in range(n_trials_check):
        theta_flat = _sample_theta(rng)
        line_prefix = (
            f"Trial {trial}: theta = "
            f"{[float(x) for x in theta_flat]}"
        )

        try:
            g_par = grad_par(theta_flat)
        except Exception as exc:  # noqa: BLE001
            tb = traceback.format_exc(limit=4)
            log_lines.append(
                f"{line_prefix}\n  PARALLEL grad FAILED: {type(exc).__name__}: {exc}\n"
                f"  Traceback (truncated):\n{tb}"
            )
            failures.append(
                {
                    "trial": trial,
                    "backend": "parallel",
                    "exception": type(exc).__name__,
                    "message": str(exc),
                }
            )
            print(log_lines[-1])
            continue

        try:
            g_seq = grad_seq(theta_flat)
        except Exception as exc:  # noqa: BLE001
            tb = traceback.format_exc(limit=4)
            log_lines.append(
                f"{line_prefix}\n  SEQUENTIAL grad FAILED: {type(exc).__name__}: "
                f"{exc}\n  Traceback (truncated):\n{tb}"
            )
            failures.append(
                {
                    "trial": trial,
                    "backend": "sequential",
                    "exception": type(exc).__name__,
                    "message": str(exc),
                }
            )
            print(log_lines[-1])
            continue

        finite_par = bool(jnp.all(jnp.isfinite(g_par)))
        finite_seq = bool(jnp.all(jnp.isfinite(g_seq)))
        rel_err = float(jnp.max(jnp.abs(g_par - g_seq) / (jnp.abs(g_seq) + 1e-12)))
        rel_errs.append(rel_err)

        log_lines.append(
            f"{line_prefix}\n"
            f"  g_par = {[float(x) for x in g_par]}\n"
            f"  g_seq = {[float(x) for x in g_seq]}\n"
            f"  finite_par={finite_par} finite_seq={finite_seq} "
            f"rel_err={rel_err:.2e}"
        )
        print(log_lines[-1])

        if not finite_par or rel_err >= 1e-3:
            failures.append(
                {
                    "trial": trial,
                    "rel_err": rel_err,
                    "finite_par": finite_par,
                    "finite_seq": finite_seq,
                }
            )

    summary = {
        "n_trials": n_trials_check,
        "n_failures": len(failures),
        "max_rel_err": max(rel_errs) if rel_errs else None,
        "rel_errs": rel_errs,
        "failures": failures,
        "verdict": "PASS" if not failures and rel_errs else "FAIL",
    }

    log_lines.append("")
    log_lines.append(f"SUMMARY: {json.dumps(summary, indent=2)}")
    _LOG_PATH.write_text("\n".join(log_lines) + "\n", encoding="utf-8")

    print()
    print("=" * 60)
    print(f"VERDICT: {summary['verdict']}")
    print(f"Failures: {summary['n_failures']}/{n_trials_check}")
    if summary["max_rel_err"] is not None:
        print(f"Max rel_err (where computed): {summary['max_rel_err']:.2e}")
    print(f"Log written to: {_LOG_PATH}")
    print("=" * 60)

    if summary["verdict"] == "PASS":
        print("All gradient checks pass within rel-err 1e-3. OK.")
        return 0

    print()
    print("DIAGNOSIS HINT")
    print("--------------")
    print(
        "If the failure mode is `ConcretizationTypeError` or `TracerArrayConversionError`,\n"
        "the prototype's `_build_hgf_closures` is calling `float(theta[...])` which\n"
        "concretizes JAX-traced arrays.  Fix: mirror the shallow-copy pattern from\n"
        "`src/prl_hgf/fitting/hierarchical.py::_single_logp_3level` — build the\n"
        "network ONCE with placeholder defaults, then inject JAX-traced theta into\n"
        "a shallow copy of `base_attrs` per call (no per-call `build_3level_network`)."
    )
    return 1


if __name__ == "__main__":
    sys.exit(main())
