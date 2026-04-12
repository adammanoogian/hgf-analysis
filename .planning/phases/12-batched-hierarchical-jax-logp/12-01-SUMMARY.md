# Phase 12 Plan 01: Legacy Migration Summary

**One-liner:** Freeze v1.1 per-participant NUTS fitting into legacy/ subpackage with backward-compat shims preserving all import surfaces.

## What Was Done

### Task 1: Create legacy/ subpackage (0102267)

Created `src/prl_hgf/fitting/legacy/` containing:

- `__init__.py` -- subpackage init re-exporting fit_batch, fit_participant, extract_summary_rows, flag_fit
- `single.py` -- verbatim copy of fitting/single.py with frozen-for-v1.1 docstring header
- `batch.py` -- verbatim copy of fitting/batch.py with frozen header; internal import updated from `prl_hgf.fitting.single` to `prl_hgf.fitting.legacy.single`

Both legacy modules contain `# Frozen for v1.1 reproducibility -- DO NOT MODIFY.` header inside their module docstrings.

### Task 2: Replace originals with shims and update __init__.py (c075f8b)

- `src/prl_hgf/fitting/single.py` -- replaced with thin shim re-exporting from legacy/single.py (fit_participant, extract_summary_rows, flag_fit, R_HAT_THRESHOLD, ESS_THRESHOLD)
- `src/prl_hgf/fitting/batch.py` -- replaced with thin shim re-exporting from legacy/batch.py (fit_batch, _prewarm_jit, _make_nan_rows, _RESULT_COLUMNS)
- `src/prl_hgf/fitting/__init__.py` -- updated docstring to document legacy + future hierarchical API; stub comments reserve plan 12-02/12-03 symbols; all existing exports preserved

### Files NOT modified (by design)

- `src/prl_hgf/fitting/ops.py` -- stays at original location
- `src/prl_hgf/fitting/models.py` -- stays at original location
- `tests/test_fitting.py` -- no edits needed

## Verification Results

- All 8 import-path checks pass (fitting, fitting.batch, fitting.single, fitting.ops, fitting.legacy, fitting.legacy.single, fitting.legacy.batch)
- `_prewarm_jit` accessible from both `prl_hgf.fitting.batch` (shim) and `prl_hgf.fitting.legacy.batch` (direct)
- ruff clean on entire fitting/ package including legacy/
- 6/7 non-slow tests pass; 1 pre-existing failure in test_omega2_positive_returns_neginf (unrelated to migration -- tests ops.py NaN guard behavior which was not modified)

## Deviations from Plan

None -- plan executed exactly as written.

## Pre-existing Issues Noted

- `test_omega2_positive_returns_neginf` was already failing before this migration (omega_2=+1.0 returns -49.5 instead of -inf). This is an ops.py NaN-guard issue, not related to the legacy migration. ops.py was not modified.

## Decisions Made

| Decision | Rationale | Phase |
|----------|-----------|-------|
| legacy/batch.py imports from legacy/single.py (not shim) | Ensures frozen code calls frozen code; no circular dependency through shims | 12-01 |
| Shims use noqa: F401 for re-exports | Ruff would flag unused imports in shim modules; F401 suppression is standard for re-export patterns | 12-01 |

## Key Files

### Created

- `src/prl_hgf/fitting/legacy/__init__.py`
- `src/prl_hgf/fitting/legacy/single.py`
- `src/prl_hgf/fitting/legacy/batch.py`

### Modified

- `src/prl_hgf/fitting/__init__.py`
- `src/prl_hgf/fitting/single.py`
- `src/prl_hgf/fitting/batch.py`

## Next Phase Readiness

Plan 12-02 (batched JAX logp Op) can proceed immediately. The upcoming `src/prl_hgf/fitting/hierarchical.py` module referenced in the frozen headers does not exist yet -- Plan 12-02 creates the batched Op factory and Plan 12-03 creates the hierarchical PyMC orchestrator.

## Metrics

- Duration: ~23 minutes
- Tasks: 2/2
- Commits: 2
