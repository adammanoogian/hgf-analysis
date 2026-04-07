---
phase: 09-prechecks
plan: "02"
subsystem: power-analysis
tags: [pyhgf, mcmc, parameter-recovery, matplotlib, trial-count-sweep]

requires:
  - phase: 09-01
    provides: make_trial_config, run_recovery_precheck, build_eligibility_table, PrecheckResult in power/precheck.py

provides:
  - SweepPoint frozen dataclass in power/precheck.py
  - run_trial_sweep: iterates trial grid with reduced MCMC (2 chains, 500 draws, 500 tune)
  - plot_trial_sweep: VIZ-01 multi-line recovery-r vs trial-count figure
  - find_minimum_trial_count: identifies smallest trial count where all eligible params pass r >= 0.7
  - --sweep / --sweep-grid / --n-per-group-sweep flags on 09_run_prechecks.py
  - 7 unit tests in tests/test_trial_sweep.py

affects:
  - 10-power-sweep (trial count determined here gates the Phase 10 grid)
  - manuscript (VIZ-01 figure is a reportable precheck output)

tech-stack:
  added: []
  patterns:
    - SweepPoint frozen dataclass follows PrecheckResult pattern (frozen=True, pd.DataFrame field)
    - seed+idx pattern for independent RNG per grid point (no between-condition correlation)
    - min_n=0 for sweep recovery df; caller applies own filter (small trial counts lose participants to convergence)
    - matplotlib Agg backend in production module (same as analysis/plots.py)
    - Reduced MCMC (2 chains/500 draws/500 tune) scoped to sweep only; main precheck uses full settings

key-files:
  created:
    - tests/test_trial_sweep.py
  modified:
    - src/prl_hgf/power/precheck.py
    - scripts/09_run_prechecks.py

key-decisions:
  - "run_trial_sweep passes min_n=0 to build_recovery_df; small trial counts may drop many participants to convergence failures — downstream callers apply own filter"
  - "find_minimum_trial_count excludes omega_3 from all-must-pass requirement by default (locked exploratory decision)"
  - "seed+idx seeding for grid points ensures fresh participants; avoids between-condition correlation in recovery estimates"
  - "VIZ-01 omega_3 line rendered dashed and labeled (exploratory) — visually distinguished from power-eligible params"

patterns-established:
  - "Sweep grid default [150, 200, 250, 300, 420] defined as module-level constant _DEFAULT_TRIAL_GRID"
  - "Pipeline script delegates sweep to _run_trial_sweep helper; main() stays < 30 effective LOC"

duration: 12min
completed: 2026-04-07
---

# Phase 9 Plan 02: Trial Count Sweep Summary

**Trial count sweep with SweepPoint dataclass, run_trial_sweep (reduced MCMC), VIZ-01 plot, and find_minimum_trial_count (omega_3 excluded from all-must-pass requirement)**

## Performance

- **Duration:** ~12 min
- **Started:** 2026-04-07T16:35:18Z
- **Completed:** 2026-04-07T16:47:30Z
- **Tasks:** 2/2
- **Files modified:** 3 (precheck.py modified, 09_run_prechecks.py modified, test_trial_sweep.py created)

## Accomplishments

- Added `SweepPoint` frozen dataclass and three new public functions (`run_trial_sweep`, `plot_trial_sweep`, `find_minimum_trial_count`) to `power/precheck.py` without modifying any existing 09-01 functions
- `run_trial_sweep` iterates over trial grid using reduced MCMC settings (2 chains, 500 draws, 500 tune) with `seed+idx` for independent participants per grid point
- `plot_trial_sweep` produces VIZ-01 figure: multi-line r vs trial count with omega_3 dashed/(exploratory) and reference line at r=0.7
- `find_minimum_trial_count` correctly excludes omega_3 from the "all must pass" check; supports custom eligible_params override
- All 16 tests pass (9 from 09-01, 7 new); ruff clean on all touched files

## Task Commits

Each task was committed atomically:

1. **Task 1: Add trial sweep and plotting functions to precheck.py** - `9288992` (feat)
2. **Task 2: Update pipeline script and add sweep unit tests** - `ef157d4` (feat)

**Plan metadata:** (see final metadata commit below)

## Files Created/Modified

- `src/prl_hgf/power/precheck.py` - Added SweepPoint, run_trial_sweep, plot_trial_sweep, find_minimum_trial_count; updated __all__; matplotlib Agg import
- `scripts/09_run_prechecks.py` - Added --sweep, --sweep-grid, --n-per-group-sweep flags; _run_trial_sweep helper
- `tests/test_trial_sweep.py` - 7 unit tests (SweepPoint frozen, find_minimum_trial_count basic/none/omega3/custom, plot figure/reference line)

## Decisions Made

- `run_trial_sweep` passes `min_n=0` to `build_recovery_df` because small trial counts may lose many participants to convergence failures — downstream callers can apply their own minimum-n filter
- `find_minimum_trial_count` excludes omega_3 from the all-must-pass requirement by default (consistent with locked exploratory decision from 09-01)
- `seed+idx` seeding per grid point ensures fresh, independent participants at each trial count (no between-condition correlation in recovery estimates)
- omega_3 line in VIZ-01 rendered dashed and labeled "(exploratory)" to visually distinguish it from power-eligible parameters

## Deviations from Plan

None — plan executed exactly as written.

## Issues Encountered

None — ruff flagged two style issues (import order, `.get(param, None)` → `.get(param)`) that were auto-fixed before the Task 1 commit. No logic changes required.

## User Setup Required

None — no external service configuration required.

## Next Phase Readiness

- Phase 9 complete: both prechecks (recovery gate and trial count sweep) are implemented and unit-tested
- Phase 10 (power sweep) can proceed; the minimum trial count identified by `find_minimum_trial_count` should be used as the lower bound of the Phase 10 `n_trials_grid`
- No blockers

---
*Phase: 09-prechecks*
*Completed: 2026-04-07*
