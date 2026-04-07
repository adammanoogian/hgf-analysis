---
phase: 09-prechecks
plan: 01
subsystem: power-analysis
tags: [parameter-recovery, precheck, eligibility, convergence-gating, hgf, mcmc]

# Dependency graph
requires:
  - phase: 08-config-infrastructure
    provides: make_power_config, PowerConfig, load_power_config, write_parquet_row
  - phase: 05-fitting
    provides: fit_batch batch MCMC pipeline
  - phase: 03-simulation
    provides: simulate_batch synthetic data generation
  - phase: validation
    provides: build_recovery_df, compute_recovery_metrics, compute_correlation_matrix, plot_recovery_scatter, plot_correlation_matrix
provides:
  - power/precheck.py with make_trial_config, run_recovery_precheck, build_eligibility_table, PrecheckResult
  - scripts/09_run_prechecks.py pipeline CLI
  - tests/test_precheck.py (9 unit tests)
affects: [10-power-sweep, future phases using precheck eligibility results]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "make_trial_config uses dataclasses.replace bottom-up same as make_power_config — no file I/O"
    - "Baseline-only filter before fitting avoids 3x compute cost (PRE-01 pattern)"
    - "PrecheckResult frozen dataclass carries all outputs together"
    - "omega_3 always 'exploratory -- upper bound' in eligibility table (locked project decision)"

key-files:
  created:
    - src/prl_hgf/power/precheck.py
    - scripts/09_run_prechecks.py
    - tests/test_precheck.py
  modified:
    - src/prl_hgf/power/__init__.py

key-decisions:
  - "make_trial_config scales only PhaseConfig.n_trials; TransferConfig.n_trials is untouched"
  - "run_recovery_precheck filters to session=='baseline' before fit_batch to avoid 3x compute"
  - "omega_3 eligibility status is 'exploratory -- upper bound' regardless of actual r (locked)"
  - "n_flagged computed as groupby('participant_id')['flagged'].any().sum() to count participants not rows"

patterns-established:
  - "Precheck script pattern: load_config → run_recovery_precheck → build_eligibility_table → print + save"
  - "Eligibility gate: r >= 0.7 passes, omega_3 always exploratory, below threshold excluded"
  - "PRE-06 convergence gate reported as '{n_flagged}/{n_total} participants excluded'"

# Metrics
duration: 11min
completed: 2026-04-07
---

# Phase 09 Plan 01: Precheck Summary

**Recovery precheck gate with proportional trial scaling, baseline-only fitting, MCMC convergence exclusion (PRE-06), and locked omega_3 exploratory classification**

## Performance

- **Duration:** 11 min
- **Started:** 2026-04-07T16:19:54Z
- **Completed:** 2026-04-07T16:31:03Z
- **Tasks:** 2/2
- **Files modified:** 4

## Accomplishments

- `power/precheck.py` with `PrecheckResult` frozen dataclass, `make_trial_config` (proportional scaling via `dataclasses.replace`), `run_recovery_precheck` (simulate → baseline-only filter → fit → convergence gate → recovery metrics → eligibility), and `build_eligibility_table` (omega_3 locked as exploratory)
- `scripts/09_run_prechecks.py` CLI with argparse (`--n-participants`, `--model`, `--seed`, `--output-dir`), prints eligibility table, PRE-06 exclusion report, and confound matrix warnings
- 9 unit tests covering all spec cases including the omega_3 always-exploratory invariant; all pass, ruff clean

## Task Commits

1. **Task 1: Create power/precheck.py** - `e0f8fe3` (feat)
2. **Task 2: Pipeline script and unit tests** - `2f8ef87` (feat)

**Plan metadata:** (docs commit follows)

## Files Created/Modified

- `src/prl_hgf/power/precheck.py` - PrecheckResult, make_trial_config, run_recovery_precheck, build_eligibility_table
- `src/prl_hgf/power/__init__.py` - Re-exports the four new symbols
- `scripts/09_run_prechecks.py` - Argparse CLI pipeline script
- `tests/test_precheck.py` - 9 unit tests (9/9 pass)

## Decisions Made

- `make_trial_config` scale formula: `scale = (target_per_set - transfer_n) / sum_phase_trials` — preserves stable/volatile ratio because all 4 phases have equal base `n_trials`
- `run_recovery_precheck` uses `sim_df[sim_df["session"] == "baseline"].copy()` before `fit_batch` — avoids fitting post_dose and followup sessions (3x cost reduction)
- `n_flagged` uses `groupby("participant_id")["flagged"].any().sum()` to count participants (not parameter rows)
- `omega_3` status is always `"exploratory -- upper bound"` regardless of r; rationale string includes actual r value plus locked-decision explanation

## Deviations from Plan

None - plan executed exactly as written.

The test count is 9 rather than the spec's 8 because `test_make_trial_config_scales_proportionally` and `test_make_trial_config_preserves_transfer` were split into separate tests for clarity. Both were covered in the spec's first two test items. This is a minor improvement, not a deviation in behavior.

## Issues Encountered

None - ruff flagged an import sort order issue in `test_precheck.py` (I001), fixed with `ruff --fix`.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness

- `power/precheck.py` is ready for Plan 09-02 (trial count variation sweep, confound matrix extension)
- `make_trial_config` can be called directly in Plan 09-02 to sweep across different trial budgets
- Phase 10 power sweep depends on the eligibility CSV output from `09_run_prechecks.py`
- No blockers — all acceptance criteria met

---
*Phase: 09-prechecks*
*Completed: 2026-04-07*
