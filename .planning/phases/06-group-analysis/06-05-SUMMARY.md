---
phase: 06-group-analysis
plan: 05
subsystem: analysis
tags: [pandas, bambi, arviz, phase-stratification, win-stay, lose-shift, prl]

# Dependency graph
requires:
  - phase: 06-group-analysis
    provides: batch simulation DataFrame (sim_df) with trial, cue_chosen, reward, phase_label columns
provides:
  - compute_phase_learning_metrics: win-stay/lose-shift rates per participant-session-phase
  - build_phase_stratified_df: validated wrapper, raises on missing columns
  - Phase-stratified analysis section in pipeline script (section 4b)
  - phase_stratified.csv output (GRP-03 gap closure)
  - 5 tests covering output schema, row count, value bounds, column validation
affects: [07-gui, manuscript]

# Tech tracking
tech-stack:
  added: []
  patterns: [behavioral proxy metrics for trial-level phase analysis when HGF is session-level]

key-files:
  created:
    - src/prl_hgf/analysis/phase_stratification.py
  modified:
    - src/prl_hgf/analysis/__init__.py
    - scripts/06_group_analysis.py
    - tests/test_group_analysis.py

key-decisions:
  - "Win-stay/lose-shift used as trial-level learning proxies (not EMA prediction error) since sim_df lacks stored HGF belief trajectories"
  - "include_groups=False in groupby.apply to avoid pandas FutureWarning"
  - "Phase stratification section placed as 4b (after group models, before plots) in pipeline"
  - "BLE001 noqa suppresses broad Exception catch for bambi model failures in pipeline"

patterns-established:
  - "Behavioral proxy pattern: use trial-level choice/reward sequences when HGF parameters are session-level"
  - "Validation wrapper pattern: build_*_df validates columns then delegates to compute_* function"

# Metrics
duration: 7min
completed: 2026-04-06
---

# Phase 6 Plan 05: Phase Stratification Summary

**Win-stay/lose-shift behavioral proxy metrics for stable vs volatile PRL phases, integrated into pipeline with group x phase bambi model and 5 new tests (27 total)**

## Performance

- **Duration:** 7 min
- **Started:** 2026-04-06T18:44:27Z
- **Completed:** 2026-04-06T18:51:30Z
- **Tasks:** 2
- **Files modified:** 4

## Accomplishments

- Implemented `compute_phase_learning_metrics` and `build_phase_stratified_df` in a new 160-line module using standard win-stay/lose-shift behavioral proxies
- Integrated phase-stratified analysis into `06_group_analysis.py` as section 4b: loads sim_df, computes metrics, saves `phase_stratified.csv`, prints group x phase summary, fits bambi group x phase interaction model when >= 6 participants available
- Replaced the old deferral NOTE with actual analysis; removed all "deferred to real-data pipeline" language
- Added 5 `TestPhaseStratification` tests; full suite is 27 passing

## Task Commits

Each task was committed atomically:

1. **Task 1: Create phase_stratification.py with win-stay/lose-shift metrics** - `8717f10` (feat)
2. **Task 2: Integrate phase stratification into pipeline and add 5 tests** - `440be46` (feat)

**Plan metadata:** (docs commit follows)

## Files Created/Modified

- `src/prl_hgf/analysis/phase_stratification.py` — New module: compute_phase_learning_metrics and build_phase_stratified_df with NumPy docstrings and type hints
- `src/prl_hgf/analysis/__init__.py` — Added phase_stratification imports and __all__ entries
- `scripts/06_group_analysis.py` — Added arviz + build_phase_stratified_df imports; replaced deferral NOTE; added section 4b; updated docstring with phase_stratified.csv output
- `tests/test_group_analysis.py` — Added _make_sim_df helper, sim_df fixture, TestPhaseStratification class (5 tests)

## Decisions Made

- **Win-stay/lose-shift over EMA prediction error:** sim_df stores only choice/reward, not HGF belief trajectories; win-stay/lose-shift are the standard PRL behavioral proxies and require no reconstruction
- **include_groups=False in groupby.apply:** Suppresses pandas FutureWarning about grouping columns in apply; compatible with pandas available in ds_env
- **.copy() after dropna:** Prevents SettingWithCopyWarning when assigning lagged columns to the filtered DataFrame
- **BLE001 noqa for broad Exception in pipeline:** bambi model failures at runtime should not crash the pipeline; broad catch with informative WARNING print is appropriate here

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] SettingWithCopyWarning from column assignment after dropna**

- **Found during:** Task 1 verification
- **Issue:** `df = df.dropna(...)` returns a view; subsequent `df["col"] = ...` triggered SettingWithCopyWarning
- **Fix:** Renamed working variable to `working`, added `.copy()` after `dropna()` to ensure owned copy before column assignment
- **Files modified:** src/prl_hgf/analysis/phase_stratification.py
- **Verification:** Re-ran temp script; no warnings in output
- **Committed in:** 8717f10 (Task 1 commit)

**2. [Rule 1 - Bug] groupby.apply FutureWarning about include_groups**

- **Found during:** Task 1 verification
- **Issue:** pandas FutureWarning: "DataFrameGroupBy.apply operated on the grouping columns. This behavior is deprecated" — grouping columns were being passed into `_rates()` but not used
- **Fix:** Added `include_groups=False` to `.apply(_rates, include_groups=False)` call
- **Files modified:** src/prl_hgf/analysis/phase_stratification.py
- **Verification:** Re-ran temp script; no FutureWarning in output
- **Committed in:** 8717f10 (Task 1 commit)

---

**Total deviations:** 2 auto-fixed (both Rule 1 - Bug)
**Impact on plan:** Both fixes were in the same module and committed together in Task 1. No scope creep. Plan proceeded as specified.

## Issues Encountered

None beyond the two warnings fixed above.

## Next Phase Readiness

- GRP-03 gap closure complete: phase-stratified analysis implemented with behavioral proxies
- Phase 6 is fully complete (plans 01-05 done)
- Phase 7 (GUI) can proceed; it does not depend on phase stratification
- Manuscript `paper.qmd` can reference `phase_stratified.csv` for exploratory phase results

---
*Phase: 06-group-analysis*
*Completed: 2026-04-06*
