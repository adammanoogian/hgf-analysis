---
phase: 06-group-analysis
plan: 02
subsystem: analysis
tags: [matplotlib, ptitprince, seaborn, raincloud, group-analysis, visualization, pipeline]

# Dependency graph
requires:
  - phase: 06-01
    provides: build_estimates_wide, summarize_group_models, compute_effect_sizes_table, bambi mixed-effects models
provides:
  - plot_raincloud: ptitprince-based distribution plot grouped by group x session
  - plot_interaction: seaborn pointplot for group x session trajectories
  - plot_all_rainclouds: batch plot loop saving one PNG per parameter
  - scripts/06_group_analysis.py: end-to-end pipeline from fit_df to CSVs and figures
  - GROUP_ANALYSIS_DIR path constant in config.py
  - 18 unit/integration tests for group analysis pipeline
affects:
  - 06-03-manuscript (raincloud/interaction figures used in Quarto report)
  - future real-data pipeline (06_group_analysis.py as reference implementation)

# Tech tracking
tech-stack:
  added: [ptitprince]
  patterns: [Agg backend for headless matplotlib, argparse CLI with --model/--skip-plots/--draws, module-scoped pytest fixtures for expensive shared state]

key-files:
  created:
    - src/prl_hgf/analysis/group_plots.py
    - scripts/06_group_analysis.py
    - tests/test_group_analysis.py
  modified:
    - config.py
    - src/prl_hgf/analysis/__init__.py

key-decisions:
  - "ptitprince RainCloud with orient=h, dodge=True, move=0.2 for raincloud layout"
  - "seaborn pointplot with dodge=0.1, markers=['o','s'], linestyles=['-','--'] for interaction plots"
  - "Pipeline prints phase-stratification note: omega_2 is session-level; trial-level deferred"
  - "Module-scoped pytest fixtures for fit_df and estimates_wide amortise pivot overhead across 18 tests"

patterns-established:
  - "Pipeline scripts add PROJECT_ROOT to sys.path; import config after path setup"
  - "Smoke tests: assert isinstance(fig, plt.Figure) + check PNG exists and is non-empty"

# Metrics
duration: 7min
completed: 2026-04-06
---

# Phase 6 Plan 02: Group Plots and Pipeline Summary

**Raincloud and interaction plot functions via ptitprince/seaborn, end-to-end group analysis pipeline script, and 18 unit tests covering the full path from fit_df to saved figures.**

## Performance

- **Duration:** 7 min
- **Started:** 2026-04-06T16:36:23Z
- **Completed:** 2026-04-06T16:43:21Z
- **Tasks:** 2
- **Files modified:** 5 (2 created new, 3 modified)

## Accomplishments

- `group_plots.py` with `plot_raincloud` (ptitprince RainCloud, orient=h, group hue), `plot_interaction` (seaborn pointplot), and `plot_all_rainclouds` batch loop
- `scripts/06_group_analysis.py` (275 lines): argparse CLI, loads fit_df, builds wide estimates, computes effect sizes, fits bambi group models, saves all CSVs and plots
- `config.py` gains `GROUP_ANALYSIS_DIR = RESULTS_DIR / "group_analysis"`
- `tests/test_group_analysis.py` (306 lines): 18 tests - build_estimates_wide correctness, flagged exclusion, Cohen's d, effect sizes schema, PNG smoke tests

## Task Commits

Each task was committed atomically:

1. **Task 1: Create group_plots.py with raincloud and interaction plots** - `10295ed` (feat)
2. **Task 2: Create pipeline script, add config paths, and write tests** - `42d6ecd` (feat)

**Plan metadata:** (pending docs commit)

## Files Created/Modified

- `src/prl_hgf/analysis/group_plots.py` - plot_raincloud, plot_interaction, plot_all_rainclouds
- `src/prl_hgf/analysis/__init__.py` - added group_plots exports to __all__
- `scripts/06_group_analysis.py` - end-to-end group analysis pipeline with argparse
- `config.py` - added GROUP_ANALYSIS_DIR constant
- `tests/test_group_analysis.py` - 18 unit/integration tests

## Decisions Made

- ptitprince RainCloud with `orient="h"`, `dodge=True`, `move=0.2` matches plan spec and produces readable horizontal clouds.
- `plot_all_rainclouds` closes figures after saving to avoid memory accumulation in batch runs.
- Pipeline prints a note that omega_2 is session-level (not phase-stratified); trial-level phase analysis deferred to real-data pipeline.
- Module-scoped pytest fixtures for `fit_df` and `estimates_wide` amortise the pivot overhead across all 18 tests.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Fixed missing `pathlib.Path` import in test file**

- **Found during:** Task 2 (ruff check after initial write)
- **Issue:** `Path` used as type annotation for `tmp_path` pytest fixture parameter but not imported at module level; also ruff isort required `Path` import to appear before third-party imports
- **Fix:** Added `from pathlib import Path` at top of imports; ran `ruff check --fix --select I` to correct import ordering; removed redundant inline `from pathlib import Path as _Path` in test methods
- **Files modified:** tests/test_group_analysis.py
- **Verification:** `ruff check` passes with zero errors; `pytest` 18/18 pass
- **Committed in:** 42d6ecd (Task 2 commit)

---

**Total deviations:** 1 auto-fixed (Rule 1 - import bug)
**Impact on plan:** Minor fix required by ruff enforcement. No scope creep.

## Issues Encountered

None beyond the import ordering fix noted above.

## Next Phase Readiness

- Group plots and pipeline complete; 06-03 (manuscript/Quarto) can reference `GROUP_ANALYSIS_DIR` outputs
- Real-data pipeline can use `06_group_analysis.py` directly once fitting results are available
- Phase-stratified (stable vs volatile) analysis deferred pending per-trial belief trajectory data

---
*Phase: 06-group-analysis*
*Completed: 2026-04-06*
