---
phase: 11-aggregation-publication
plan: 02
subsystem: visualization
tags: [matplotlib, power-analysis, publication-figures, pdf, png, bfda, bms]

# Dependency graph
requires:
  - phase: 11-01
    provides: compute_power_a, compute_power_b from prl_hgf.power.curves; power_master.csv schema
  - phase: 09-prechecks
    provides: trial_sweep_results.csv for precheck recovery panel
provides:
  - scripts/10_plot_power_curves.py CLI producing 3 individual figures + 1 combined 4-panel publication figure
  - plot_precheck_recovery: VIZ-01 trial sweep r vs trial count
  - plot_power_a: VIZ-02 P(BF>threshold) per effect size with 80%/90% refs and d=0.5 annotation
  - plot_power_b: VIZ-03 P(correct BMS) vs N with 75% reference line
  - plot_sensitivity_heatmap: N x d matrix with RdYlGn colormap and cell percentages
  - plot_combined_figure: VIZ-04 2x2 panel saved as PDF + PNG
  - tests/test_power_plots.py with 14 tests across 5 test classes
affects: [grant submission figures, preregistration document, 11-03-recommendation]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - matplotlib.use("Agg") before pyplot import for headless rendering
    - importlib.util.spec_from_file_location for loading pipeline scripts in tests
    - _draw_*_panel helpers for reusing logic between standalone and combined figures
    - _annotate_crossing uses linear interpolation for N where power curve crosses threshold

key-files:
  created:
    - scripts/10_plot_power_curves.py
    - tests/test_power_plots.py
  modified: []

key-decisions:
  - "Recompute P(BF>threshold) from raw bf_value in plot functions (not from bf_exceeds column) so threshold is live at plot time"
  - "compute_power_a/compute_power_b imported and used in main() to derive summaries fresh from master_df"
  - "Panel draw helpers (_draw_*_panel) separate subplot rendering from file I/O to enable test isolation"
  - "plot_combined_figure saves both PDF and PNG via stem.with_suffix() at the same save_path"
  - "14 tests including: figure return types, PNG/PDF file creation, annotation presence, cell value ranges, 4-axes check"

patterns-established:
  - "Panel helpers: _draw_precheck_panel, _draw_power_a_panel, _draw_power_b_panel, _draw_heatmap_panel take existing Axes"
  - "_annotate_crossing: interpolates N crossing using adjacent grid points; no annotation if curve never reaches threshold"
  - "_EFFECT_LINESTYLES list cycles for multiple effect sizes (distinguishable without color alone)"

# Metrics
duration: 10min
completed: 2026-04-07
---

# Phase 11 Plan 02: Power Analysis Plotting Script Summary

**4-panel publication figure (PDF + PNG) with BFDA power curves, BMS discriminability, precheck recovery, and N x d sensitivity heatmap; 14 unit tests all pass**

## Performance

- **Duration:** 10 min
- **Started:** 2026-04-07T21:57:17Z
- **Completed:** 2026-04-07T22:08:02Z
- **Tasks:** 2
- **Files modified:** 2

## Accomplishments

- Created `scripts/10_plot_power_curves.py` (895 lines) with 4 standalone plot functions + 4 panel helpers + CLI
- Power A figure: one curve per effect size, 80%/90% reference lines, d=0.5 crossing annotation via linear interpolation
- Power B figure: single P(correct BMS) curve with 75% reference line
- Sensitivity heatmap: N x d imshow with RdYlGn colormap and cell percentage annotations
- Combined 4-panel VIZ-04 figure (12x10 inches) with bold A/B/C/D panel labels, saved as both PDF and PNG
- 14 unit tests in `tests/test_power_plots.py` all passing; uses importlib.util to load script, synthetic DataFrames only

## Task Commits

1. **Task 1: Create scripts/10_plot_power_curves.py** - `f484c28` (feat)
2. **Task 2: Create unit tests for plot functions** - `4c2ca0d` (test)

**Plan metadata:** (pending — committed with docs commit)

## Files Created/Modified

- `scripts/10_plot_power_curves.py` — CLI plotting script; 4 figure types; imports from prl_hgf.power.curves
- `tests/test_power_plots.py` — 14 tests across 5 test classes; all pass

## Decisions Made

- Recomputed P(BF>threshold) from raw `bf_value` column rather than pre-baked `bf_exceeds` boolean so bf_threshold is live at plot time; this means the CLI `--bf-threshold` arg is meaningful
- Used `compute_power_a` and `compute_power_b` from `prl_hgf.power.curves` in `main()` to derive summaries fresh from master_df rather than relying on pre-aggregated CSVs
- Separated `_draw_*_panel` helpers from standalone plot functions so the combined figure can reuse logic without circular file saves
- `plot_combined_figure` saves PDF via `save_path` and PNG via `stem.with_suffix(".png")` — caller passes a `.pdf` path

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered

- Ruff flagged `compute_power_a`/`compute_power_b` as imported-but-unused (initial draft inlined the logic). Fixed by using them in `main()` to compute summaries from master_df, satisfying both the key_links requirement and ruff.
- Ruff flagged `zip()` without `strict=`. Fixed with `strict=True`.
- Ruff flagged `numpy` and `pytest` as unused in test file. Removed.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness

- All power analysis figures ready: VIZ-01 through VIZ-04
- Combined publication figure (PDF + PNG) is the main grant submission deliverable
- Phase 11 Plan 03 (recommendation) can now produce the final N/group recommendation table to accompany these figures
- No blockers

---
*Phase: 11-aggregation-publication*
*Completed: 2026-04-07*
