---
phase: 19
plan: 04
subsystem: validation
tags: [laplace, nuts, comparison, vb-laplace, patrl, arviz, pandas]
requires: ["19-03"]
provides: ["validation/vbl06_laplace_vs_nuts.py", "tests/test_vbl06_laplace_vs_nuts.py"]
affects: ["19-05"]
tech-stack:
  added: []
  patterns:
    - "Nullable bool column (pd.BooleanDtype) for parameter-specific gating"
    - "NUTS idata dim rename on .copy() only — caller idata read-only contract"
key-files:
  created:
    - validation/vbl06_laplace_vs_nuts.py
    - tests/test_vbl06_laplace_vs_nuts.py
  modified: []
decisions:
  - "within_gate=pd.NA for non-omega_2 rows; True/False only for omega_2 (per VB_LAPLACE_FEASIBILITY.md §6)"
  - "NUTS dim rename on idata_nuts.copy() inside compare_posteriors; never mutates caller idata"
  - "_apply_hard_gates filters to df[df.parameter=='omega_2'] before checking .all(); non-omega_2 rows excluded from gate"
  - "--skip-nuts-comparison exits 0 with info log; Laplace-only diagnostic path unblocks Phase 19 while cluster NUTS pending"
  - "CLI exit codes: 0 all omega_2 gates pass / skip-nuts, 1 gate fails, 2 loader error"
metrics:
  duration: "15 min"
  completed: "2026-04-18"
---

# Phase 19 Plan 04: VBL-06 Laplace-vs-NUTS Comparison Harness Summary

**One-liner:** Per-subject per-parameter Laplace-vs-NUTS diff table with nullable-bool omega_2 hard gates and NUTS dim-rename read-only contract.

## What Was Built

### `validation/vbl06_laplace_vs_nuts.py`

Comparison harness for the Phase 19 VB-Laplace fit path.

**Exports:**
- `compare_posteriors(idata_laplace, idata_nuts, params) -> pd.DataFrame`
- `_apply_hard_gates(df) -> tuple[bool, list[str]]`
- `main() -> int` (CLI entry point)

**Module-level constants (verbatim from VB_LAPLACE_FEASIBILITY.md §6):**
```python
_GATE_ABS_DIFF_MEAN_OMEGA2: float = 0.3
_GATE_ABS_DIFF_LOG_SD_OMEGA2: float = 0.5
_SOFT_SD_RATIO_LOWER: float = 0.5
_SOFT_SD_RATIO_UPPER: float = 2.0
```

### `tests/test_vbl06_laplace_vs_nuts.py`

9 tests total (8 fast, 1 slow env-gated):

| Test | Description |
|------|-------------|
| test_compare_posteriors_identical_idatas_all_within_gate | Identical idatas: diffs ~0, within_gate=True |
| test_compare_posteriors_within_tolerance_passes | Mean diff 0.2 < 0.3 gate: within_gate=True |
| test_compare_posteriors_exceeds_tolerance_fails_gate | Mean diff 0.5 > 0.3 gate: all_pass=False, HARD FAIL message |
| test_compare_posteriors_near_zero_sd_handled | sd_nuts≈0: abs_diff_log_sd=inf, no crash |
| test_compare_posteriors_missing_coord_renames_gracefully | NUTS 'participant' coord renamed on copy; caller unmutated |
| test_compare_posteriors_mismatched_participant_sets_raises | Different PIDs: RuntimeError naming both sets |
| test_apply_hard_gates_omega_2_only | beta diff=1.0 is informational; omega_2-only gate; beta within_gate=NA |
| test_cli_compare_skip_flag | CLI run --skip-nuts-comparison: exit 0, laplace.nc written (slow, RUN_SMOKE_TESTS=1) |
| test_pick_best_cue_regression_unchanged | pick_best_cue pipeline imports unaffected |

## `compare_posteriors` DataFrame Schema

| Column | dtype | Description |
|--------|-------|-------------|
| `participant_id` | object | Participant identifier |
| `parameter` | object | Parameter name (e.g. `omega_2`, `beta`) |
| `mean_laplace` | float64 | Laplace posterior mean |
| `mean_nuts` | float64 | NUTS posterior mean |
| `sd_laplace` | float64 | Laplace posterior SD |
| `sd_nuts` | float64 | NUTS posterior SD |
| `abs_diff_mean` | float64 | `|mean_laplace - mean_nuts|` |
| `abs_diff_log_sd` | float64 | `|log(sd_lap) - log(sd_nuts)|`; inf if sd≈0 |
| `sd_ratio` | float64 | `sd_laplace / sd_nuts`; inf if sd_nuts≈0 |
| `within_gate` | boolean (nullable) | `True/False` for omega_2 rows; `pd.NA` for all others |

## CLI Invocation Forms

**`run` subcommand (Laplace fit + optional NUTS comparison):**
```bash
# Laplace only (cluster NUTS pending):
python validation/vbl06_laplace_vs_nuts.py run \
    --sim-df results/sim_df.parquet \
    --model hgf_2level_patrl \
    --output-dir results/vbl06/ \
    --skip-nuts-comparison

# Full comparison (when cluster NUTS idata arrives):
python validation/vbl06_laplace_vs_nuts.py run \
    --sim-df results/sim_df.parquet \
    --model hgf_2level_patrl \
    --output-dir results/vbl06/
```

**`compare` subcommand (load saved idatas):**
```bash
python validation/vbl06_laplace_vs_nuts.py compare \
    --laplace results/vbl06/laplace.nc \
    --nuts results/vbl06/nuts.nc \
    --out-csv results/vbl06/diff_table.csv \
    --params omega_2 beta
```

**Exit codes:** 0 (all omega_2 gates pass / skip-nuts), 1 (gate fails), 2 (loader error).

## Key Design Decisions

| Decision | Rationale |
|----------|-----------|
| `within_gate=pd.NA` for non-omega_2 rows | No tolerance defined for beta/omega_3/kappa/mu3_0 in Phase 19; pd.BooleanDtype allows mixed T/F/NA |
| NUTS dim rename on `.copy()` only | Caller's idata must not be mutated; rename is scoped to the comparison function |
| `_apply_hard_gates` filters to omega_2 before `.all()` | Non-omega_2 rows have `pd.NA` which would corrupt `.all()` if included |
| `--skip-nuts-comparison` exits 0 | Unblocks Phase 19 execution while cluster NUTS smoke (Plan 19-05) is pending |
| Soft SD-ratio warnings scan all parameters | Informational diagnostics apply regardless of which parameter |

## Deviations from Plan

None — plan executed exactly as written.

## `--skip-nuts-comparison` Path

The `run --skip-nuts-comparison` CLI path:
1. Loads sim_df parquet
2. Runs `fit_vb_laplace_patrl` (Laplace MAP + Hessian)
3. Saves `laplace.nc` to `--output-dir`
4. Logs `"NUTS comparison skipped per --skip-nuts-comparison flag."`
5. Exits 0

Test 8 (`test_cli_compare_skip_flag`) exercises this path end-to-end with a real Laplace fit on a 3-participant 40-trial sim_df.

## Pending Item

The actual Laplace-vs-NUTS diff table will be generated once cluster NUTS results land. The harness is ready to consume them:

```bash
python validation/vbl06_laplace_vs_nuts.py compare \
    --laplace <cluster_laplace.nc> --nuts <cluster_nuts.nc> \
    --out-csv results/vbl06_diff.csv
```

Plan 19-05 smoke script exercises `run --skip-nuts-comparison` end-to-end on the full PAT-RL smoke foundation script.

## Next Phase Readiness

- Plan 19-05 (smoke script integration test) can proceed immediately
- No blockers introduced
- OQ1 (NUTS `_samples_to_idata` dim name `'participant'` vs `'participant_id'`) remains open; the rename-on-copy workaround in `compare_posteriors` handles it correctly until the hotfix lands
