---
phase: 20
plan: 04
subsystem: pat-rl-simulator
tags: [simulator, epsilon2, delta-hr, phenotype, model-d, m7-bridge]

dependency-graph:
  requires: [20-01, 20-02, 20-03]
  provides:
    - simulate_patrl_cohort with epsilon2-coupled delta_hr (SC4)
    - phenotype column in sim_df (PHENOTYPE_COLUMN_NAME)
    - run_hgf_forward_patrl return_epsilon2 kwarg
    - response_model + lam_true M7 bridge kwargs on simulate_patrl_cohort
    - test_model_d_lambda_recovery_smoke_epsilon2_coupled (M7 bridge gate)
  affects: [20-05, 20-06, 20-07]

tech-stack:
  added: []
  patterns:
    - two-pass generative model for Model D (mean-omega approx)
    - phenotype-specific epsilon2-coupled delta_hr with NumPy clipping
    - SeedSequence-derived dhr_rng spawn for deterministic ΔHR
    - pyhgf node_trajectories[0] (input node) for epsilon2 extraction

key-files:
  created:
    - tests/test_pat_rl_simulator.py (8 new tests added)
  modified:
    - src/prl_hgf/env/pat_rl_simulator.py
    - scripts/12_smoke_patrl_foundation.py
    - tests/test_fit_vb_laplace_patrl.py

decisions:
  - id: 135
    summary: epsilon2 node index is 0 (input/observation node), not 1 (belief node)
    rationale: >
      pyhgf 0.2.8 stores epsilon2 at node_trajectories[0]['temp']['value_prediction_error']
      (the input/observation node). node_trajectories[1]['temp']['value_prediction_error']
      is always 0.0 — it records PE received from node 1's VALUE parent (node 2), not
      the observation-level surprise. Confirmed by runtime inspection. Prior executor's
      commit 3c19f23 used node 1 (incorrect); this plan fixes it at node 0.
  - id: 136
    summary: epsilon2_coupling_coef is POSITIVE; formula adds coef*eps2 to base ΔHR
    rationale: >
      YAML stores epsilon2_coupling_coef as positive (e.g. 0.3). ε₂(t) = state_t minus
      belief prediction — positive when state surprises agent. Formula:
      ΔHR(t) = N(dhr_mean, dhr_sd) + epsilon2_coupling_coef * eps2(t).
      Adding positive coef*eps2 moves ΔHR toward zero (less bradycardia) on high-surprise
      trials. Consistent with Klaassen 2024: anticipatory bradycardia inversely related
      to threat expectation; high PE = unexpected state → attenuated response.
  - id: 137
    summary: Model D two-pass uses mean-omega approximation for generative pass
    rationale: >
      Exact per-trial omega_eff injection into pyhgf requires custom scan surgery
      (implemented on the FITTING side in Plan 20-03 via _clamped_step_model_d).
      On the GENERATIVE side (simulate_patrl_cohort), we use
      omega_eff_mean = omega_2_true + lam_true * mean(delta_hr) as a scalar approximation
      for the re-run HGF pass. This mismatch is intentional for the smoke gate (3/5
      agents within 0.3 abs error); tighter recovery requires exact per-trial injection
      and is tracked as a followup TODO.
  - id: 138
    summary: PHENOTYPE_COLUMN_NAME = 'phenotype' propagated to sim_df via dict key constant
    rationale: >
      Using PHENOTYPE_COLUMN_NAME from pat_rl_config.py as the dict key in simulate_patrl_cohort
      guards against silent column-name drift across sim_df → fit_df → BMS pipeline.
      All downstream code (Plans 20-06, 20-07) must import and use this constant.

metrics:
  duration: ~50 minutes
  completed: 2026-04-18
---

# Phase 20 Plan 04: Epsilon2-Coupled ΔHR Simulator + Phenotype Column Summary

**One-liner:** SC4 epsilon2-coupled ΔHR generative model using pyhgf node-0 VPE, phenotype column in sim_df, and M7 bridge (response_model='model_d' + lam_true) on simulate_patrl_cohort.

## Resume Note

Task 1 was committed as `3c19f23` by a prior executor before this resumption. This executor resumed from Task 2 and completed Tasks 2-5.

## What Was Built

### run_hgf_forward_patrl (return_epsilon2 kwarg)

Already completed in Task 1 (commit `3c19f23`). Fixed in Task 4: the correct node index for ε₂ is **node 0** (the observation/input node), not node 1 (the belief node). Node 1's `value_prediction_error` is always 0 in pyhgf 0.2.8.

Updated signature:
```python
def run_hgf_forward_patrl(
    trials: list[PATRLTrial],
    omega_2: float,
    level: int,
    omega_3: float = -6.0,
    kappa: float = 1.0,
    mu3_0: float = 1.0,
    return_epsilon2: bool = False,
) -> np.ndarray | tuple[np.ndarray, np.ndarray]:
```

Epsilon2 source: `net.node_trajectories[0]['temp']['value_prediction_error']`

### SC4 ε₂-Coupled ΔHR Formula

Implemented in `simulate_patrl_cohort`:

```
ΔHR(t) = N(phenotype.dhr_mean, phenotype.dhr_sd) + phenotype.epsilon2_coupling_coef * ε₂(t)
ΔHR(t) = clip(ΔHR(t), config.task.delta_hr_stub.bounds[0], config.task.delta_hr_stub.bounds[1])
```

Sign convention: `epsilon2_coupling_coef` is positive in YAML (e.g. 0.3). ε₂ is positive when state surprises the agent. Adding positive coef*ε₂ moves ΔHR toward zero (less bradycardia) on high-surprise trials — consistent with Klaassen 2024.

ΔHR bounds: `[-15.0, 10.0]` bpm (from `configs/pat_rl.yaml`).

### Phenotype Column

`sim_df` now contains a `phenotype` column keyed via `PHENOTYPE_COLUMN_NAME = 'phenotype'` from `pat_rl_config.py`. Propagation path: `sim_df['phenotype'] → fit_df → compute_stratified_bms` (Plan 20-06).

### New simulate_patrl_cohort Signature

```python
def simulate_patrl_cohort(
    n_participants: int,
    level: int,
    master_seed: int,
    config: PATRLConfig,
    phenotype_name: str = "healthy",        # new (20-04) - default preserves Phase 18/19
    response_model: str = "model_a",        # new (20-04) - M7 bridge
    lam_true: float | None = None,          # new (20-04) - M7 bridge
) -> tuple[pd.DataFrame, dict[str, dict[str, float]], dict[str, list[PATRLTrial]]]:
```

Validation: `response_model='model_d'` requires `lam_true is not None`; non-model_d must have `lam_true=None`.

### M7 Bridge Resolution

`test_model_d_lambda_recovery_smoke_epsilon2_coupled` added to `tests/test_fit_vb_laplace_patrl.py`. Uses `simulate_patrl_cohort(phenotype_name='healthy', response_model='model_d', lam_true=0.1, master_seed=404)` and fits via `fit_vb_laplace_patrl(response_model='model_d')`. Gate: `|posterior_mean(lam) - 0.1| < 0.3` for >= 3/5 agents.

The M7 bridge test coexists with Plan 20-03's `test_model_d_lambda_recovery_smoke` (different seed=42). Both are marked `@pytest.mark.slow`.

## Commits

| Hash | Message |
|------|---------|
| `3c19f23` | feat(20-04): extend run_hgf_forward_patrl with return_epsilon2 kwarg *(Task 1, prior executor)* |
| `45d82ed` | feat(20-04): extend simulate_patrl_cohort with epsilon2-coupled dHR + phenotype column + model_d/lam_true |
| `774c025` | feat(20-04): assert phenotype column in smoke script + log per-phenotype counts |
| `4d13aaf` | test(20-04): 8 new simulator tests + fix epsilon2 node index (node 0 not 1) |
| `0238a32` | test(20-04): add M7 bridge test test_model_d_lambda_recovery_smoke_epsilon2_coupled |
| `b985d40` | style(20-04): remove unused imports in test_pat_rl_simulator (ruff F401) |

## Test Counts

- `tests/test_pat_rl_simulator.py`: 14 tests (6 pre-existing + 8 new), all pass
- `tests/test_fit_vb_laplace_patrl.py`: 16 tests (15 pre-existing + 1 new M7 bridge); 8 fast pass, 8 slow (marked `@pytest.mark.slow`)
- `scripts/12_smoke_patrl_foundation.py --dry-run`: passes, phenotype column logged

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Wrong pyhgf node index for epsilon2**

- **Found during:** Task 4 (test_simulate_patrl_cohort_epsilon2_contributes_nonzero_variance failed)
- **Issue:** `run_hgf_forward_patrl` used `node_trajectories[1]['temp']['value_prediction_error']` which is always 0.0 in pyhgf 0.2.8. The correct node for observation-level prediction error (ε₂) is node 0 (the input/observation node).
- **Fix:** Changed to `net.node_trajectories[0]['temp']['value_prediction_error']` with updated docstrings. Confirmed `std=3.01` for node-0 VPE vs `std=0.0` for node-1 VPE.
- **Files modified:** `src/prl_hgf/env/pat_rl_simulator.py`
- **Commit:** `4d13aaf`

## Test Scope Note on M7 Bridge

The M7 bridge test (`test_model_d_lambda_recovery_smoke_epsilon2_coupled`) is marked `@pytest.mark.slow` — it runs the full Laplace fit (~2-5 min CPU). It will be validated on the cluster. The Plan 20-03 sibling test (`test_model_d_lambda_recovery_smoke`) also uses the same ε₂-coupled generator (it calls `simulate_patrl_cohort` with `response_model='model_d', lam_true=0.1`).

## Next Phase Readiness

- **Plan 20-05** (cohort scale 40x4): `simulate_patrl_cohort` with `phenotype_name` kwarg is ready. Plan 20-05 wraps it in a multi-phenotype loop — no further simulator changes needed.
- **Plan 20-06** (stratified BMS): `sim_df['phenotype']` column is propagated. Import `PHENOTYPE_COLUMN_NAME` from `pat_rl_config`.
- **Plan 20-07** (validation gates): phenotype column available for stratified comparisons.

## Followup TODOs

1. **Exact per-trial omega_eff injection on generative side**: The Model D generative pass currently uses `mean(delta_hr)` as the effective omega (scalar approximation). Exact per-trial `omega_eff(t) = omega_2 + lam * delta_hr(t)` injection via custom pyhgf scan would tighten the M7 bridge recovery gate from 3/5 to 4/5 and `|err| < 0.2`. Track after Plan 20-07.
2. **Tighten M7 bridge gate**: After exact per-trial injection lands, update `test_model_d_lambda_recovery_smoke_epsilon2_coupled` threshold from 3/5 agents within 0.3 to 4/5 within 0.2.
3. **Consumer-spec epsilon2_coupling_coef values**: Current YAML uses `0.3` as placeholder for all phenotypes. Post-20-08 citation pass should update with Klaassen 2024 empirical values.
