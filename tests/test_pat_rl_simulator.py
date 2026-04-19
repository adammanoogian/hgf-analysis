"""Unit tests for prl_hgf.env.pat_rl_simulator.

Tests cover:
1. Output shape contract for simulate_patrl_cohort
2. Seed determinism: same master_seed -> identical cohort
3. Different seeds produce different cohorts
4. run_hgf_forward_patrl 2-level shape + finiteness
5. run_hgf_forward_patrl 3-level shape + finiteness
6. Pick_best_cue regression guard (canary imports)
7. run_hgf_forward_patrl returns epsilon2 tuple when return_epsilon2=True
8. run_hgf_forward_patrl default return unchanged (scalar ndarray) when return_epsilon2=False
9. simulate_patrl_cohort has phenotype column
10. simulate_patrl_cohort delta_hr deterministic across same seed
11. Different phenotypes produce different mean delta_hr (phenotype effect survives)
12. simulate_patrl_cohort delta_hr within config bounds
13. epsilon2 coupling contributes non-zero variance vs zero coupling
14. simulate_patrl_cohort model_d uses lam_true (choices differ at lam=0 vs lam=0.5)
"""

from __future__ import annotations

import numpy as np
import pandas as pd

from prl_hgf.env.pat_rl_config import load_pat_rl_config
from prl_hgf.env.pat_rl_sequence import PATRLTrial, generate_session_patrl
from prl_hgf.env.pat_rl_simulator import (
    run_hgf_forward_patrl,
    simulate_patrl_cohort,
)

_N_TRIALS = 192  # from configs/pat_rl.yaml: n_trials: 192


def test_simulate_patrl_cohort_shape_contract() -> None:
    """simulate_patrl_cohort returns (DataFrame, dict, dict) with correct shapes.

    n_participants=3, level=2, 192 trials each -> 576 rows total.
    true_params has 3 keys; trials_by_participant has 3 keys of 192 PATRLTrial.
    """
    config = load_pat_rl_config()
    sim_df, true_params, trials_by_participant = simulate_patrl_cohort(
        n_participants=3,
        level=2,
        master_seed=42,
        config=config,
    )

    assert isinstance(sim_df, pd.DataFrame), (
        f"Expected pd.DataFrame; got {type(sim_df)}"
    )
    assert isinstance(true_params, dict), (
        f"Expected dict; got {type(true_params)}"
    )
    assert isinstance(trials_by_participant, dict), (
        f"Expected dict; got {type(trials_by_participant)}"
    )

    expected_rows = 3 * _N_TRIALS
    assert len(sim_df) == expected_rows, (
        f"Expected {expected_rows} rows in sim_df; got {len(sim_df)}"
    )

    assert len(true_params) == 3, (
        f"Expected 3 participant keys in true_params; got {len(true_params)}"
    )
    assert len(trials_by_participant) == 3, (
        f"Expected 3 participant keys in trials_by_participant; "
        f"got {len(trials_by_participant)}"
    )

    for pid, trials in trials_by_participant.items():
        assert len(trials) == _N_TRIALS, (
            f"Participant {pid}: expected {_N_TRIALS} trials; got {len(trials)}"
        )
        assert all(isinstance(t, PATRLTrial) for t in trials), (
            f"Participant {pid}: not all elements are PATRLTrial"
        )


def test_simulate_patrl_cohort_seed_determinism() -> None:
    """Same master_seed produces bit-for-bit identical cohort on two calls."""
    config = load_pat_rl_config()
    df1, params1, trials1 = simulate_patrl_cohort(
        n_participants=3, level=2, master_seed=42, config=config
    )
    df2, params2, trials2 = simulate_patrl_cohort(
        n_participants=3, level=2, master_seed=42, config=config
    )

    pd.testing.assert_frame_equal(df1, df2, check_exact=True)

    assert params1 == params2, (
        f"true_params differ between calls with same seed.  "
        f"First call: {params1}  Second call: {params2}"
    )

    for pid in trials1:
        t_pairs = zip(trials1[pid], trials2[pid], strict=True)
        for idx, (t_a, t_b) in enumerate(t_pairs):
            a_key = (t_a.state, t_a.reward_mag, t_a.shock_mag, t_a.delta_hr)
            b_key = (t_b.state, t_b.reward_mag, t_b.shock_mag, t_b.delta_hr)
            assert a_key == b_key, (
                f"Participant {pid} trial {idx}: trial fields differ between "
                f"calls with same seed.  Got {a_key} vs {b_key}."
            )


def test_simulate_patrl_cohort_different_seeds_differ() -> None:
    """Different master_seeds produce different cohorts (choice column differs)."""
    config = load_pat_rl_config()
    df_42, _, _ = simulate_patrl_cohort(
        n_participants=3, level=2, master_seed=42, config=config
    )
    df_43, _, _ = simulate_patrl_cohort(
        n_participants=3, level=2, master_seed=43, config=config
    )

    choices_42 = df_42["choice"].to_numpy()
    choices_43 = df_43["choice"].to_numpy()
    assert not np.array_equal(choices_42, choices_43), (
        "choice column is identical for master_seed=42 and master_seed=43; "
        "expected different cohorts when seed changes."
    )


def test_run_hgf_forward_patrl_2level_shape() -> None:
    """run_hgf_forward_patrl (level=2) returns shape (n_trials,) float64, all finite."""
    config = load_pat_rl_config()
    trials = generate_session_patrl(config, seed=0)
    mu2 = run_hgf_forward_patrl(trials, omega_2=-3.0, level=2)

    assert mu2.shape == (_N_TRIALS,), (
        f"Expected shape ({_N_TRIALS},); got {mu2.shape}"
    )
    assert mu2.dtype == np.float64, (
        f"Expected float64; got {mu2.dtype}"
    )
    assert np.all(np.isfinite(mu2)), (
        f"Non-finite values in mu2 trajectory (level=2).  "
        f"n_nonfinite={int(np.sum(~np.isfinite(mu2)))}"
    )


def test_run_hgf_forward_patrl_3level_shape() -> None:
    """run_hgf_forward_patrl (level=3) returns shape (n_trials,) float64, all finite."""
    config = load_pat_rl_config()
    trials = generate_session_patrl(config, seed=0)
    mu2 = run_hgf_forward_patrl(
        trials,
        omega_2=-3.0,
        level=3,
        omega_3=-6.0,
        kappa=1.0,
        mu3_0=1.0,
    )

    assert mu2.shape == (_N_TRIALS,), (
        f"Expected shape ({_N_TRIALS},); got {mu2.shape}"
    )
    assert mu2.dtype == np.float64, (
        f"Expected float64; got {mu2.dtype}"
    )
    assert np.all(np.isfinite(mu2)), (
        f"Non-finite values in mu2 trajectory (level=3).  "
        f"n_nonfinite={int(np.sum(~np.isfinite(mu2)))}"
    )


def test_pick_best_cue_regression_unchanged() -> None:
    """Pick_best_cue modules are importable after Phase 19-01 refactor (canary).

    Verifies that the parallel-stack invariant holds: the Phase 19-01 extraction
    into pat_rl_simulator.py did not accidentally modify pick_best_cue modules.
    """
    from prl_hgf.analysis.bms import compute_subject_waic  # noqa: F401
    from prl_hgf.env.simulator import generate_session  # noqa: F401


# ---------------------------------------------------------------------------
# Phase 20-04 new tests: epsilon2 return, epsilon2-coupled ΔHR, phenotype col
# ---------------------------------------------------------------------------


def test_run_hgf_forward_patrl_returns_epsilon2() -> None:
    """return_epsilon2=True returns (mu2, eps2) tuple; shapes match; all finite.

    Decision 126: pyhgf 0.2.8 exposes
    ``node_trajectories[1]['temp']['value_prediction_error']`` as epsilon2.
    """
    config = load_pat_rl_config()
    trials = generate_session_patrl(config, seed=7)
    result = run_hgf_forward_patrl(trials, omega_2=-3.0, level=2, return_epsilon2=True)

    assert isinstance(result, tuple), (
        f"Expected tuple when return_epsilon2=True; got {type(result)}"
    )
    mu2, eps2 = result
    assert mu2.shape == (_N_TRIALS,), (
        f"mu2 shape: expected ({_N_TRIALS},); got {mu2.shape}"
    )
    assert eps2.shape == mu2.shape, (
        f"epsilon2 shape {eps2.shape} != mu2 shape {mu2.shape}"
    )
    assert np.all(np.isfinite(eps2)), (
        f"epsilon2 contains non-finite values; n_nonfinite={int(np.sum(~np.isfinite(eps2)))}"
    )
    assert np.all(np.isfinite(mu2)), (
        f"mu2 contains non-finite values; n_nonfinite={int(np.sum(~np.isfinite(mu2)))}"
    )


def test_run_hgf_forward_patrl_default_scalar_return_unchanged() -> None:
    """Default (return_epsilon2=False) returns plain np.ndarray, not tuple.

    Backward-compatibility anchor: Phase 18/19 callers expect a bare ndarray.
    """
    config = load_pat_rl_config()
    trials = generate_session_patrl(config, seed=0)
    result = run_hgf_forward_patrl(trials, omega_2=-3.0, level=2)

    assert isinstance(result, np.ndarray), (
        f"Expected np.ndarray when return_epsilon2=False; got {type(result)}"
    )
    assert result.ndim == 1, (
        f"Expected 1-D array; got ndim={result.ndim}"
    )


def test_simulate_patrl_cohort_has_phenotype_column() -> None:
    """sim_df contains a 'phenotype' column with non-empty strings for all rows."""
    config = load_pat_rl_config()
    df, _, _ = simulate_patrl_cohort(
        n_participants=3, level=2, master_seed=42, config=config
    )

    assert "phenotype" in df.columns, (
        f"Expected 'phenotype' column; got columns: {list(df.columns)}"
    )
    assert (df["phenotype"].str.len() > 0).all(), (
        "Expected all phenotype values to be non-empty strings; "
        f"got: {df['phenotype'].unique()}"
    )
    assert set(df["phenotype"].unique()) == {"healthy"}, (
        f"Expected only 'healthy' phenotype by default; got {df['phenotype'].unique()}"
    )


def test_simulate_patrl_cohort_epsilon2_coupled_dhr_deterministic() -> None:
    """Same master_seed produces bit-for-bit identical delta_hr trajectory.

    Verifies that spawning dhr_rng from the per-participant rng preserves
    the seed-determinism guarantee after Phase 20 SC4 changes.
    """
    config = load_pat_rl_config()
    df1, _, _ = simulate_patrl_cohort(
        n_participants=3, level=2, master_seed=99, config=config
    )
    df2, _, _ = simulate_patrl_cohort(
        n_participants=3, level=2, master_seed=99, config=config
    )

    assert df1["delta_hr"].equals(df2["delta_hr"]), (
        "delta_hr differs between two calls with same master_seed=99. "
        "Seed-determinism broken by Phase 20 SC4 changes."
    )


def test_simulate_patrl_cohort_dhr_differs_from_pure_phenotype() -> None:
    """Healthy (dhr_mean=-2) and anxious (dhr_mean=-0.5) phenotypes produce different mean ΔHR.

    Validates that the phenotype-specific Gaussian parameters actually
    propagate into the ΔHR column. After epsilon2 coupling and clipping,
    the healthy cohort should still have lower (more bradycardic) mean ΔHR
    than the anxious cohort.

    Phenotype values from configs/pat_rl.yaml:
      healthy: dhr_mean=-2.0, dhr_sd=0.5
      anxious: dhr_mean=-0.5, dhr_sd=0.8
    """
    config = load_pat_rl_config()
    df_healthy, _, _ = simulate_patrl_cohort(
        n_participants=5, level=2, master_seed=42, config=config,
        phenotype_name="healthy",
    )
    df_anxious, _, _ = simulate_patrl_cohort(
        n_participants=5, level=2, master_seed=42, config=config,
        phenotype_name="anxious",
    )

    mean_dhr_healthy = float(df_healthy["delta_hr"].mean())
    mean_dhr_anxious = float(df_anxious["delta_hr"].mean())

    assert mean_dhr_healthy < mean_dhr_anxious, (
        f"Expected healthy mean ΔHR ({mean_dhr_healthy:.3f}) < anxious mean "
        f"ΔHR ({mean_dhr_anxious:.3f}). Phenotype effect not surviving."
    )


def test_simulate_patrl_cohort_dhr_within_bounds() -> None:
    """All delta_hr values must lie within config.task.delta_hr_stub.bounds after clipping."""
    config = load_pat_rl_config()
    df, _, _ = simulate_patrl_cohort(
        n_participants=5, level=2, master_seed=7, config=config
    )
    lo, hi = config.task.delta_hr_stub.bounds
    assert (df["delta_hr"] >= lo).all(), (
        f"delta_hr below lower bound {lo}: min={df['delta_hr'].min():.3f}"
    )
    assert (df["delta_hr"] <= hi).all(), (
        f"delta_hr above upper bound {hi}: max={df['delta_hr'].max():.3f}"
    )


def test_simulate_patrl_cohort_epsilon2_contributes_nonzero_variance() -> None:
    """epsilon2_coupling_coef=0 vs 0.3 produces different ΔHR std.

    Confirms the ε₂ coupling term actually fires. Patches the healthy
    phenotype in-memory to set coupling to zero and compares ΔHR std
    against the default (0.3).
    """
    import copy
    import dataclasses

    config = load_pat_rl_config()

    # Build a config copy with epsilon2_coupling_coef=0.0 for healthy.
    healthy_zero = dataclasses.replace(
        config.simulation.phenotypes["healthy"],
        epsilon2_coupling_coef=0.0,
    )
    phenotypes_zero = {
        k: (healthy_zero if k == "healthy" else v)
        for k, v in config.simulation.phenotypes.items()
    }
    sim_zero = dataclasses.replace(
        config.simulation,
        phenotypes=phenotypes_zero,
    )
    config_zero = dataclasses.replace(config, simulation=sim_zero)

    df_coupled, _, _ = simulate_patrl_cohort(
        n_participants=5, level=2, master_seed=42, config=config
    )
    df_zero, _, _ = simulate_patrl_cohort(
        n_participants=5, level=2, master_seed=42, config=config_zero
    )

    std_coupled = float(df_coupled["delta_hr"].std())
    std_zero = float(df_zero["delta_hr"].std())

    assert abs(std_coupled - std_zero) > 1e-6, (
        f"ΔHR std with coupling ({std_coupled:.4f}) == std without coupling "
        f"({std_zero:.4f}). epsilon2 coupling appears to have no effect."
    )


def test_simulate_patrl_cohort_model_d_uses_lam_true() -> None:
    """Model D lam_true affects choices and raises ValueError when misused.

    Three sub-checks:
    1. lam_true=0.0 vs lam_true=0.5 produce different choice arrays.
    2. response_model='model_d' + lam_true=None raises ValueError.
    3. response_model='model_a' + lam_true=0.1 raises ValueError.
    """
    import pytest  # noqa: PLC0415

    config = load_pat_rl_config()

    # Sub-check 1: lam_true=0.0 vs lam_true=0.5 should differ.
    df_lam0, _, _ = simulate_patrl_cohort(
        n_participants=5, level=2, master_seed=42, config=config,
        response_model="model_d", lam_true=0.0,
    )
    df_lam05, _, _ = simulate_patrl_cohort(
        n_participants=5, level=2, master_seed=42, config=config,
        response_model="model_d", lam_true=0.5,
    )
    choices_0 = df_lam0["choice"].to_numpy()
    choices_05 = df_lam05["choice"].to_numpy()
    assert not np.array_equal(choices_0, choices_05), (
        "choices are identical for lam_true=0.0 and lam_true=0.5; "
        "expected non-zero lambda to bend belief trajectory and change choices."
    )

    # Sub-check 2: model_d + lam_true=None must raise ValueError.
    try:
        simulate_patrl_cohort(
            n_participants=2, level=2, master_seed=1, config=config,
            response_model="model_d", lam_true=None,
        )
        raise AssertionError("Expected ValueError for model_d + lam_true=None")
    except ValueError as exc:
        assert "model_d" in str(exc).lower() or "lam_true" in str(exc).lower(), (
            f"ValueError message should mention model_d/lam_true; got: {exc}"
        )

    # Sub-check 3: model_a + lam_true=0.1 must raise ValueError (defensive).
    try:
        simulate_patrl_cohort(
            n_participants=2, level=2, master_seed=1, config=config,
            response_model="model_a", lam_true=0.1,
        )
        raise AssertionError("Expected ValueError for model_a + lam_true=0.1")
    except ValueError as exc:
        assert "lam_true" in str(exc).lower() or "model_a" in str(exc).lower(), (
            f"ValueError message should mention lam_true/model_a; got: {exc}"
        )
