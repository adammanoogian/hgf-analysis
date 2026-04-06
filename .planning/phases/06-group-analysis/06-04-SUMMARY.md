---
phase: 06-group-analysis
plan: "04"
subsystem: analysis
tags: [csv-schema, hdi-columns, hdi-excludes-zero, gap-closure, canonical-filenames, bayesian-power-validation]

requires:
  - phase: 06-group-analysis
    plan: "01"
    provides: extract_posterior_contrasts returning contrasts DataFrame
  - phase: 06-group-analysis
    plan: "02"
    provides: 06_group_analysis.py pipeline with CSV outputs
  - phase: 06-group-analysis
    plan: "03"
    provides: manuscript/paper.qmd reading canonical CSV filenames with hdi_3%/hdi_97%

provides:
  - _contrast_row with hdi_3%/hdi_97% column names (percent-suffix convention)
  - hdi_excludes_zero boolean in every contrast row
  - canonical CSV saves: estimates_wide.csv, effect_sizes.csv, group_contrasts.csv
  - combined group_contrasts.csv with parameter column for manuscript
  - omega_2 Bayesian power-validation print in pipeline
  - TestContrastsSchema (4 tests) in test_group_analysis.py
  - hdi_excludes_zero narrative in manuscript omega_2 results section

affects:
  - 06-05 (any future plans can rely on consistent hdi_3%/hdi_97% schema)
  - manuscript/paper.qmd (already reads canonical filenames; now has hdi_excludes_zero info)

tech-stack:
  added: []
  patterns:
    - percent-suffix HDI column convention (hdi_3%, hdi_97%) for CSV interoperability
    - hdi_excludes_zero as standard Bayesian significance indicator per row

key-files:
  created: []
  modified:
    - src/prl_hgf/analysis/group.py
    - scripts/06_group_analysis.py
    - manuscript/paper.qmd
    - tests/test_group_analysis.py

decisions:
  - decision: "hdi_3%/hdi_97% column names (percent-suffix)"
    rationale: "Manuscript code already used this convention; unifying group.py to match avoids any mismatch"
    plan: "06-04"
  - decision: "hdi_excludes_zero boolean in _contrast_row"
    rationale: "Enables Bayesian power validation without post-processing; lo>0 or hi<0 is the correct criterion"
    plan: "06-04"
  - decision: "canonical CSV filenames (estimates_wide.csv, effect_sizes.csv, group_contrasts.csv)"
    rationale: "Manuscript expects these filenames; model-specific variants retained for backward compatibility"
    plan: "06-04"
  - decision: "combined group_contrasts.csv with parameter column"
    rationale: "Manuscript filters by parameter column; per-parameter files are not readable in a single read_csv call"
    plan: "06-04"

metrics:
  duration: "4 minutes"
  completed: "2026-04-06"
  tasks_completed: 2
  tests_added: 4
  tests_total_passing: 22
---

# Phase 6 Plan 04: CSV Schema and HDI Fix Summary

**One-liner:** HDI column names unified to hdi_3%/hdi_97%, hdi_excludes_zero added, canonical CSV filenames saved.

## What Was Done

Gap-closure plan fixing three schema mismatches between the group analysis engine
and the manuscript's expectations:

1. **HDI column names** — `_contrast_row` in `group.py` previously emitted
   `hdi_3` and `hdi_97`. The manuscript (written in plan 06-03) used `hdi_3%`
   and `hdi_97%`. Both now agree.

2. **`hdi_excludes_zero` column** — Added as a boolean to every row produced by
   `_contrast_row`. `True` when the 94% HDI lies strictly above zero (`lo > 0`)
   or strictly below zero (`hi < 0`). The pipeline prints a power-validation
   summary for `omega_2` at runtime.

3. **Canonical CSV filenames** — `06_group_analysis.py` now saves:
   - `estimates_wide.csv` (canonical) alongside `estimates_wide_{model}.csv`
   - `effect_sizes.csv` (canonical) alongside `effect_sizes_{model}.csv`
   - `group_contrasts.csv` (canonical, with `parameter` column) alongside
     per-parameter `contrasts_{model}_{param}.csv` files

## Tasks Completed

| Task | Name | Commit | Files |
|------|------|--------|-------|
| 1 | Fix HDI column names, add hdi_excludes_zero, canonical CSV saves | 5830ff0 | group.py, 06_group_analysis.py |
| 2 | Add TestContrastsSchema, update manuscript omega_2 narrative | 11d2bab | test_group_analysis.py, paper.qmd |

## Verification

- `_contrast_row` inline check: `'hdi_3%' in r and 'hdi_97%' in r and 'hdi_excludes_zero' in r` — **OK**
- `TestContrastsSchema`: 4/4 pass
- Full `test_group_analysis.py` suite: 22/22 pass

## Decisions Made

| Decision | Rationale |
|----------|-----------|
| percent-suffix HDI columns | Manuscript already used this convention; unify source to match |
| hdi_excludes_zero = lo>0 or hi<0 | Correct Bayesian criterion; requires BOTH bounds on same side of zero |
| Canonical filenames saved alongside model-specific | Manuscript reads fixed names; per-model files retained for backward compat |
| combined group_contrasts.csv with parameter column | Manuscript filters by `parameter` column in a single `read_csv` call |

## Deviations from Plan

None — plan executed exactly as written.

## Next Phase Readiness

- All three gap issues are closed; manuscript can render correctly once the
  pipeline is run on real data.
- Plan 06-05 (if it exists) can proceed with a consistent schema.
- The `TestContrastsSchema` tests will catch any future regression to the old
  column names.
