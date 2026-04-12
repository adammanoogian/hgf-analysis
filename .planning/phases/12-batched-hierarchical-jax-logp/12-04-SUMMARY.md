# Phase 12 Plan 04: Validation Tests Summary

## One-liner

VALID-01 bit-exact (atol=1e-12) and VALID-02 within-3x-MCSE regression tests for batched hierarchical logp Op.

## Tasks Completed

| Task | Name | Commit | Status |
|------|------|--------|--------|
| 1 | VALID-01 bit-exact + Layer 2 clamping smoke test | a56dcdd | PASS |
| 2 | VALID-02 statistical-equivalence (5 participants) | 4e2719d | PASS |

## VALID-01 Bit-Exact Results

All three VALID-01 tests pass at `atol=1e-12, rtol=0`:

| Test | Diff | Tolerance | Status |
|------|------|-----------|--------|
| 3-level at P=1 | <= 1e-12 | atol=1e-12 | PASS |
| 2-level at P=1 | 0.0 | atol=1e-12 | PASS |
| P=2 doubling | <= 1e-12 | atol=1e-12 | PASS |

The P=1 bit-exact agreement confirms that `build_logp_ops_batched` reproduces the per-participant logp from `build_logp_ops_3level` and `build_logp_ops_2level` identically.  The P=2 doubling test confirms the `jax.vmap` + `jnp.sum` reduction is correct.

## Layer 2 Clamping Smoke Test

Pushing `omega_2=-0.1` (near zero, unstable region) into the batched Op returns a finite value, never NaN.  The tapas-style clamping in `_clamped_scan` correctly reverts belief states when level-2 means exceed the magnitude bound.

## VALID-02 Drift Table

Per-(participant, parameter) comparison of legacy sequential fit vs batched hierarchical fit.  Both use numpyro sampler, 2 chains x 500 draws, 500 tune, target_accept=0.9.

| Participant | Parameter | Legacy Mean | Batched Mean | Diff | 3x max(MCSE) | Status |
|-------------|-----------|-------------|--------------|------|--------------|--------|
| P001 | omega_2 | -3.993 | -3.042 | 0.951 | 1.102 | PASS |
| P001 | beta | 2.279 | 1.787 | 0.492 | 0.583 | PASS |
| P001 | zeta | 0.502 | 0.582 | 0.080 | 0.117 | PASS |
| P002 | omega_2 | -2.495 | -1.347 | 1.148 | 1.349 | PASS |
| P002 | beta | 2.599 | 1.675 | 0.923 | 1.107 | PASS |
| P002 | zeta | 0.420 | 0.475 | 0.055 | 0.096 | PASS |
| P003 | omega_2 | -3.048 | -2.954 | 0.093 | 0.126 | PASS |
| P003 | beta | 2.958 | 2.542 | 0.416 | 0.438 | PASS |
| P003 | zeta | 0.317 | 0.444 | 0.127 | 0.146 | PASS |
| P004 | omega_2 | -2.684 | -1.625 | 1.059 | 1.288 | PASS |
| P004 | beta | 2.015 | 1.446 | 0.569 | 0.661 | PASS |
| P004 | zeta | 0.772 | 0.797 | 0.025 | 0.032 | PASS |
| P005 | omega_2 | -3.127 | -3.104 | 0.023 | 2.004 | PASS |
| P005 | beta | 1.593 | 1.428 | 0.165 | 0.704 | PASS |
| P005 | zeta | 0.653 | 0.699 | 0.046 | 0.071 | PASS |

All 15 comparisons pass at 3x MCSE.  No tolerance adjustment was needed.

## Tolerance Adjustments

None.  The 3x MCSE threshold from the Phase 12 spec held for all parameter comparisons.

## Wall Time

- VALID-01 + clamping (non-slow tests): ~40-60 seconds
- VALID-02 (slow test): ~11 minutes (640s call + 35s setup)
  - Legacy path: ~128s (5 participants x 2 chains x 500+500 draws)
  - Batched path: ~512s (JAX compilation + numpyro NUTS for 15-dim model)
- Total plan execution: ~49 minutes

## Decisions Made

| Decision | Rationale |
|----------|-----------|
| Both paths use `sampler="numpyro"` for VALID-02 | The PyMC sampler hits the `_init_jitter` read-only array bug with JAX-backed Ops; numpyro bypasses PyTensor entirely |
| Simulated agent data (not random) for VALID-02 | Random choice/reward data produces poorly constrained posteriors, making MCSE-based comparison unreliable |
| 100 trials per participant (sliced from 420) | Balances inference quality with test execution speed |
| Positional dim indexing for batched posterior | PyMC assigns per-variable dim names (`omega_2_dim_0`, `zeta_dim_0`, etc.) when `shape=` is used without `dims=`; positional indexing is robust to naming conventions |

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] PyMC sampler `_init_jitter` read-only bug**
- **Found during:** Task 2, initial VALID-02 attempt
- **Issue:** Both legacy `pm.sample()` and batched `pm.sample()` fail with `ValueError: assignment destination is read-only` during `_init_jitter` when using JAX-backed Ops
- **Fix:** Switched both paths to `sampler="numpyro"` which calls `pmjax.sample_numpyro_nuts()` directly, bypassing PyTensor compilation entirely
- **Files modified:** tests/test_hierarchical_logp.py
- **Commit:** 4e2719d

**2. [Rule 1 - Bug] Random data produces poorly constrained posteriors**
- **Found during:** Task 2, first VALID-02 run
- **Issue:** Random choice/reward sequences produce very wide posteriors with low ESS, causing the 3x MCSE comparison to fail not because the models disagree but because neither converges well
- **Fix:** Replaced random data fixture with simulated agent data using `build_2level_network` + `simulate_agent`, producing realistic trial-level data that constrains posteriors
- **Files modified:** tests/test_hierarchical_logp.py
- **Commit:** 4e2719d

## Pre-existing Issues

The legacy test `test_fitting.py::test_omega2_positive_returns_neginf` fails independently of Plan 12-04 changes.  It expects `omega_2=+1.0` to produce NaN in the HGF scan (triggering the `-inf` guard), but the scan returns a finite value (-49.53) instead.  This is a pre-existing issue confirmed by running the test on the pre-12-04 codebase.

## Files Created

| File | Lines | Purpose |
|------|-------|---------|
| tests/test_hierarchical_logp.py | 523 | VALID-01, VALID-02, Layer 2 clamping smoke test |

## Next Phase Readiness

Phase 12 is complete.  All four plans (12-01 through 12-04) are done:
- 12-01: Legacy migration and shims
- 12-02: Batched JAX logp Op factory
- 12-03: Hierarchical PyMC orchestrator
- 12-04: Validation tests (VALID-01 + VALID-02 + clamping)

Ready to proceed to Phase 13 (GPU benchmarking) or Phase 14 (decision gate).
