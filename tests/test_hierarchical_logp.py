"""Phase 12 validation tests for the batched hierarchical JAX logp Op.

Tests cover three categories:

1. **VALID-01 (bit-exact at P=1 and P=2):** The new
   ``build_logp_ops_batched`` forward pass at ``n_participants=1`` returns
   float64-identical values to the existing ``build_logp_ops_3level`` (and
   ``build_logp_ops_2level``) for matched inputs and parameters.  Tolerance:
   ``atol=1e-12, rtol=0``.

2. **VALID-02 (within-MCSE at P=5):** Fit 5 synthetic participants
   sequentially via the legacy ``fit_batch`` path on CPU and the same 5
   participants batched via ``fit_batch_hierarchical`` on CPU, both with
   matched seeds.  Per-parameter posterior means agree within
   ``3 x max(mcse_legacy, mcse_batched)``.

3. **Layer 2 clamping smoke test:** Drive a single participant's logp into
   the unstable region and confirm the batched logp returns a finite value
   (not NaN).

Run fast tests only::

    pytest tests/test_hierarchical_logp.py -v -k "not slow"

Run slow tests (MCMC)::

    pytest tests/test_hierarchical_logp.py -v -m slow --timeout=900
"""

from __future__ import annotations

import math
import sys
from pathlib import Path

import numpy as np
import pytensor.tensor as pt
import pytest

_root = Path(__file__).resolve().parents[1]
if str(_root) not in sys.path:
    sys.path.insert(0, str(_root))


# ---------------------------------------------------------------------------
# Session-scoped fixture: simulated data for a single participant
# ---------------------------------------------------------------------------


@pytest.fixture(scope="session")
def _simulated_data_session():
    """Build a short simulated session for one participant.

    Returns ``(input_data_arr, observed_arr, choices_arr)`` shaped
    ``(n_trials, 3)``, ``(n_trials, 3)``, ``(n_trials,)`` using ~50
    trials from a 3-level agent simulation with known parameters.
    """
    from prl_hgf.env.simulator import generate_session
    from prl_hgf.env.task_config import load_config
    from prl_hgf.models.hgf_2level import prepare_input_data
    from prl_hgf.models.hgf_3level import build_3level_network
    from prl_hgf.simulation.agent import simulate_agent

    cfg = load_config()
    rng = np.random.default_rng(12345)
    net = build_3level_network(omega_2=-3.0, omega_3=-6.0, kappa=1.0)
    trials = generate_session(cfg, seed=12345)
    result = simulate_agent(net, trials, beta=3.0, zeta=0.5, rng=rng)

    trials_50 = trials[:50]
    choices_50 = result.choices[:50]
    rewards_50 = result.rewards[:50]

    input_data_arr, observed_arr = prepare_input_data(
        trials_50, choices_50, rewards_50
    )
    choices_arr = np.array(choices_50, dtype=int)

    return input_data_arr, observed_arr, choices_arr


# ---------------------------------------------------------------------------
# VALID-01 — bit-exact at P=1
# ---------------------------------------------------------------------------


def test_valid_01_batched_at_p1_bit_exact_3level(_simulated_data_session):
    """VALID-01: batched logp at P=1 equals legacy 3-level logp.

    The new ``build_logp_ops_batched`` with ``n_participants=1`` must return
    a float64-identical value to ``build_logp_ops_3level`` for matched inputs
    and parameters.  Tolerance: ``atol=1e-12, rtol=0``.
    """
    from prl_hgf.fitting.hierarchical import build_logp_ops_batched
    from prl_hgf.fitting.ops import build_logp_ops_3level

    input_data_arr, observed_arr, choices_arr = _simulated_data_session

    # --- Legacy (per-participant) ---
    legacy_op, _ = build_logp_ops_3level(
        input_data_arr, observed_arr, choices_arr
    )
    legacy_val = float(
        legacy_op(
            pt.as_tensor_variable(-3.0),
            pt.as_tensor_variable(-6.0),
            pt.as_tensor_variable(1.0),
            pt.as_tensor_variable(3.0),
            pt.as_tensor_variable(0.5),
        ).eval()
    )

    # --- Batched at P=1 ---
    # Stack into (1, n_trials, 3) and (1, n_trials)
    batched_op, n_p, n_t = build_logp_ops_batched(
        input_data_arr[np.newaxis, ...],
        observed_arr[np.newaxis, ...],
        choices_arr[np.newaxis, ...],
        model_name="hgf_3level",
    )
    batched_val = float(
        batched_op(
            pt.as_tensor_variable(np.array([-3.0])),
            pt.as_tensor_variable(np.array([-6.0])),
            pt.as_tensor_variable(np.array([1.0])),
            pt.as_tensor_variable(np.array([3.0])),
            pt.as_tensor_variable(np.array([0.5])),
        ).eval()
    )

    diff = abs(legacy_val - batched_val)
    assert n_p == 1, f"Expected n_participants=1, got {n_p}"
    np.testing.assert_allclose(
        batched_val,
        legacy_val,
        atol=1e-12,
        rtol=0,
        err_msg=(
            f"VALID-01 3-level FAILED: batched={batched_val}, "
            f"legacy={legacy_val}, diff={diff}"
        ),
    )


def test_valid_01_batched_at_p1_bit_exact_2level(_simulated_data_session):
    """VALID-01: batched logp at P=1 equals legacy 2-level logp.

    Same as 3-level test but for the ``hgf_2level`` model variant.
    Parameters: ``omega_2=-3.0, beta=3.0, zeta=0.5``.
    """
    from prl_hgf.fitting.hierarchical import build_logp_ops_batched
    from prl_hgf.fitting.ops import build_logp_ops_2level

    input_data_arr, observed_arr, choices_arr = _simulated_data_session

    # --- Legacy (per-participant) ---
    legacy_op, _ = build_logp_ops_2level(
        input_data_arr, observed_arr, choices_arr
    )
    legacy_val = float(
        legacy_op(
            pt.as_tensor_variable(-3.0),
            pt.as_tensor_variable(3.0),
            pt.as_tensor_variable(0.5),
        ).eval()
    )

    # --- Batched at P=1 ---
    batched_op, n_p, n_t = build_logp_ops_batched(
        input_data_arr[np.newaxis, ...],
        observed_arr[np.newaxis, ...],
        choices_arr[np.newaxis, ...],
        model_name="hgf_2level",
    )
    batched_val = float(
        batched_op(
            pt.as_tensor_variable(np.array([-3.0])),
            pt.as_tensor_variable(np.array([3.0])),
            pt.as_tensor_variable(np.array([0.5])),
        ).eval()
    )

    diff = abs(legacy_val - batched_val)
    assert n_p == 1, f"Expected n_participants=1, got {n_p}"
    np.testing.assert_allclose(
        batched_val,
        legacy_val,
        atol=1e-12,
        rtol=0,
        err_msg=(
            f"VALID-01 2-level FAILED: batched={batched_val}, "
            f"legacy={legacy_val}, diff={diff}"
        ),
    )


# ---------------------------------------------------------------------------
# VALID-01 — P=2 doubling test
# ---------------------------------------------------------------------------


def test_valid_01_batched_at_p2_doubles_logp(_simulated_data_session):
    """VALID-01 P=2: batched logp with 2 identical participants equals 2x legacy.

    At P=2 with two identical participants and identical parameters, the
    batched logp must equal ``2 * legacy_logp`` within ``atol=1e-12``.  This
    confirms the ``vmap + jnp.sum`` reduction.
    """
    from prl_hgf.fitting.hierarchical import build_logp_ops_batched
    from prl_hgf.fitting.ops import build_logp_ops_3level

    input_data_arr, observed_arr, choices_arr = _simulated_data_session

    # --- Legacy single-participant ---
    legacy_op, _ = build_logp_ops_3level(
        input_data_arr, observed_arr, choices_arr
    )
    legacy_val = float(
        legacy_op(
            pt.as_tensor_variable(-3.0),
            pt.as_tensor_variable(-6.0),
            pt.as_tensor_variable(1.0),
            pt.as_tensor_variable(3.0),
            pt.as_tensor_variable(0.5),
        ).eval()
    )

    # --- Batched at P=2 (two identical participants) ---
    batched_op, n_p, n_t = build_logp_ops_batched(
        np.stack([input_data_arr, input_data_arr], axis=0),
        np.stack([observed_arr, observed_arr], axis=0),
        np.stack([choices_arr, choices_arr], axis=0),
        model_name="hgf_3level",
    )
    batched_val = float(
        batched_op(
            pt.as_tensor_variable(np.array([-3.0, -3.0])),
            pt.as_tensor_variable(np.array([-6.0, -6.0])),
            pt.as_tensor_variable(np.array([1.0, 1.0])),
            pt.as_tensor_variable(np.array([3.0, 3.0])),
            pt.as_tensor_variable(np.array([0.5, 0.5])),
        ).eval()
    )

    expected = 2.0 * legacy_val
    diff = abs(batched_val - expected)
    assert n_p == 2, f"Expected n_participants=2, got {n_p}"
    np.testing.assert_allclose(
        batched_val,
        expected,
        atol=1e-12,
        rtol=0,
        err_msg=(
            f"VALID-01 P=2 doubling FAILED: batched={batched_val}, "
            f"2*legacy={expected}, diff={diff}"
        ),
    )


# ---------------------------------------------------------------------------
# Layer 2 clamping smoke test
# ---------------------------------------------------------------------------


def test_layer_2_clamping_returns_finite_under_unstable_params(
    _simulated_data_session,
):
    """Layer 2 clamping: unstable params produce finite-or-(-inf), never NaN.

    Pushes ``omega_2=-0.1`` (near zero, unstable region where the binary
    HGF scan is known to produce NaN) and asserts the batched logp returns
    a finite value or ``-inf`` — never ``NaN``.
    """
    from prl_hgf.fitting.hierarchical import build_logp_ops_batched

    input_data_arr, observed_arr, choices_arr = _simulated_data_session

    batched_op, _, _ = build_logp_ops_batched(
        input_data_arr[np.newaxis, ...],
        observed_arr[np.newaxis, ...],
        choices_arr[np.newaxis, ...],
        model_name="hgf_3level",
    )

    val = float(
        batched_op(
            pt.as_tensor_variable(np.array([-0.1])),  # unstable omega_2
            pt.as_tensor_variable(np.array([-6.0])),
            pt.as_tensor_variable(np.array([1.0])),
            pt.as_tensor_variable(np.array([3.0])),
            pt.as_tensor_variable(np.array([0.5])),
        ).eval()
    )

    assert not math.isnan(val), (
        f"Layer 2 clamping smoke test FAILED: got NaN. "
        f"Expected finite or -inf at omega_2=-0.1. "
        f"Batched logp returned: {val}"
    )
    assert math.isfinite(val) or val == float("-inf"), (
        f"Layer 2 clamping smoke test: unexpected value {val}. "
        f"Expected finite or -inf."
    )


# ---------------------------------------------------------------------------
# Fixture: 5-participant synthetic DataFrame
# ---------------------------------------------------------------------------


@pytest.fixture(scope="session")
def _five_participant_sim_df():
    """Generate a 5-participant tidy DataFrame from agent simulations.

    Uses the full simulation pipeline (generate_session + simulate_agent)
    to produce realistic trial-level data that will constrain the model
    posteriors.  Fixed seed per participant ensures reproducibility.
    """
    import pandas as pd

    from prl_hgf.env.simulator import generate_session
    from prl_hgf.env.task_config import load_config
    from prl_hgf.models.hgf_2level import build_2level_network
    from prl_hgf.simulation.agent import simulate_agent

    cfg = load_config()
    n_participants = 5
    n_trials_max = 100  # Slice to 100 trials per participant for speed
    base_seed = 77700
    rows = []

    for p_idx in range(n_participants):
        pid = f"P{p_idx + 1:03d}"
        seed = base_seed + p_idx
        rng = np.random.default_rng(seed)
        net = build_2level_network(omega_2=-3.0)
        trials = generate_session(cfg, seed=seed)
        result = simulate_agent(
            net, trials, beta=3.0, zeta=0.5, rng=rng
        )

        # Slice to first n_trials_max trials for speed
        for t_idx in range(min(n_trials_max, len(trials))):
            rows.append(
                {
                    "participant_id": pid,
                    "group": "placebo",
                    "session": "baseline",
                    "trial": t_idx,
                    "cue_chosen": result.choices[t_idx],
                    "reward": result.rewards[t_idx],
                }
            )

    return pd.DataFrame(rows)


# ---------------------------------------------------------------------------
# VALID-02 — statistical equivalence (legacy vs batched, within-MCSE)
# ---------------------------------------------------------------------------


@pytest.mark.slow
def test_valid_02_batched_vs_legacy_within_mcse(_five_participant_sim_df):
    """VALID-02: batched fit and sequential legacy fit agree within 3x MCSE.

    Fits 5 synthetic participants sequentially via the legacy
    ``fit_batch`` path and the same 5 participants batched via
    ``fit_batch_hierarchical``, both using the ``numpyro`` sampler
    (required because the ``pymc`` sampler hits the ``_init_jitter``
    read-only array bug with JAX-backed Ops).

    Per-parameter posterior means must agree within
    ``3 x max(mcse_legacy, mcse_batched)``.

    Uses ``model_name="hgf_2level"`` for speed (3 params: omega_2,
    beta, zeta) with reduced draws: ``n_chains=2, n_draws=500,
    n_tune=500, target_accept=0.9``.
    """
    import arviz as az

    from prl_hgf.fitting.hierarchical import fit_batch_hierarchical
    from prl_hgf.fitting.legacy import fit_batch

    sim_df = _five_participant_sim_df
    model_name = "hgf_2level"
    n_chains = 2
    n_draws = 500
    n_tune = 500
    target_accept = 0.9
    random_seed = 42
    var_names = ["omega_2", "beta", "zeta"]

    # ------------------------------------------------------------------
    # Legacy path: sequential per-participant fits (numpyro sampler)
    # ------------------------------------------------------------------
    legacy_df, legacy_idata_dict = fit_batch(
        sim_df,
        model_name=model_name,
        n_chains=n_chains,
        n_draws=n_draws,
        n_tune=n_tune,
        target_accept=target_accept,
        random_seed=random_seed,
        cores=1,
        return_idata=True,
        sampler="numpyro",
    )

    # ------------------------------------------------------------------
    # Batched path: single-call cohort fit (numpyro sampler)
    # ------------------------------------------------------------------
    batched_idata = fit_batch_hierarchical(
        sim_df,
        model_name=model_name,
        n_chains=n_chains,
        n_draws=n_draws,
        n_tune=n_tune,
        target_accept=target_accept,
        random_seed=random_seed,
        sampler="numpyro",
        progressbar=False,
    )

    # ------------------------------------------------------------------
    # Compare per-participant, per-parameter posterior means
    # ------------------------------------------------------------------
    # The legacy path uses groupby(..., sort=False) so iteration order
    # matches insertion order.  Sorted participant_ids lets us find the
    # correct positional index in the batched posterior.
    participant_ids = sorted(sim_df["participant_id"].unique())

    # Build a positional index for the batched posterior.  The batched
    # path groups by (participant_id, group, session) in insertion order
    # of the DataFrame.  Since our fixture creates participants in
    # sorted order (P001..P005) the positional index equals the sorted
    # index.
    failures = []
    drift_table = []

    for p_idx, pid in enumerate(participant_ids):
        # Legacy idata: keyed by (participant_id, group, session)
        legacy_key = (pid, "placebo", "baseline")
        legacy_idata = legacy_idata_dict[legacy_key]
        assert legacy_idata is not None, (
            f"Legacy fit for {pid} returned None (fit failed)"
        )

        for var in var_names:
            # Legacy posterior: scalar per chain/draw
            legacy_samples = legacy_idata.posterior[var].values.flatten()
            legacy_mean = float(np.mean(legacy_samples))
            legacy_mcse = float(
                az.stats.diagnostics._mc_error(legacy_samples)
            )

            # Batched posterior: index into participant dimension
            # The dim name varies (e.g. "participant" if rename
            # succeeded, or "{var}_dim_0" otherwise).  Use positional
            # indexing on the first non-chain/draw dimension.
            batched_var = batched_idata.posterior[var]
            ppt_dims = [
                d for d in batched_var.dims
                if d not in ("chain", "draw")
            ]
            if ppt_dims:
                batched_samples = (
                    batched_var
                    .isel({ppt_dims[0]: p_idx})
                    .values.flatten()
                )
            else:
                # Scalar variable (should not happen for P=5)
                batched_samples = batched_var.values.flatten()

            batched_mean = float(np.mean(batched_samples))
            batched_mcse = float(
                az.stats.diagnostics._mc_error(batched_samples)
            )

            max_mcse = max(legacy_mcse, batched_mcse)
            diff = abs(legacy_mean - batched_mean)
            threshold = 3.0 * max_mcse

            drift_table.append(
                {
                    "participant": pid,
                    "parameter": var,
                    "legacy_mean": legacy_mean,
                    "batched_mean": batched_mean,
                    "diff": diff,
                    "legacy_mcse": legacy_mcse,
                    "batched_mcse": batched_mcse,
                    "max_mcse": max_mcse,
                    "threshold": threshold,
                    "pass": diff <= threshold,
                }
            )

            if diff > threshold:
                failures.append(
                    f"  {pid}/{var}: legacy={legacy_mean:.6f}, "
                    f"batched={batched_mean:.6f}, diff={diff:.6f}, "
                    f"3*max_mcse={threshold:.6f}"
                )

    # Print drift table for SUMMARY.md documentation
    print("\n--- VALID-02 Drift Table ---")
    for row in drift_table:
        status = "PASS" if row["pass"] else "FAIL"
        print(
            f"  {row['participant']}/{row['parameter']}: "
            f"legacy={row['legacy_mean']:.6f}, "
            f"batched={row['batched_mean']:.6f}, "
            f"diff={row['diff']:.6f}, "
            f"3*max_mcse={row['threshold']:.6f} [{status}]"
        )

    assert not failures, (
        f"VALID-02 FAILED: {len(failures)} parameter(s) exceeded "
        f"3x max(mcse_legacy, mcse_batched):\n"
        + "\n".join(failures)
    )
