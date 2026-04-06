---
phase: 06-group-analysis
verified: 2026-04-06T19:15:00Z
status: passed
score: 5/5 must-haves verified
re_verification:
  previous_status: gaps_found
  gaps_closed:
    - Gap 1 phase stratification CLOSED
    - Gap 2 hdi_excludes_zero CLOSED
    - Gap 3 CSV schema CLOSED
  gaps_remaining: []
  regressions: []
---

# Phase 6: Group Analysis Verification Report

**Phase Goal:** The pipeline tests the primary hypotheses: group x session interactions on HGF
parameters, phase-stratified learning rate effects, and produces publication-quality figures.
**Verified:** 2026-04-06T19:15:00Z
**Status:** passed
**Re-verification:** Yes -- after gap closure plans 06-04 and 06-05

## Goal Achievement

### Observable Truths

| # | Truth | Status | Evidence |
|---|-------|--------|----------|
| 1 | Posterior means pivoted to wide-form DataFrame, one row per participant-session | VERIFIED | build_estimates_wide in group.py (396 lines); TestBuildEstimatesWide + TestExcludesFlagged (7 tests); no regressions |
| 2 | Bambi mixed-effects model fits group x session interaction on each HGF parameter | VERIFIED | fit_group_model uses bmb.Model; summarize_group_models loops over params; no regressions |
| 3 | Posterior contrasts extracted with 94% HDI per session and hdi_excludes_zero | VERIFIED | _contrast_row returns hdi_3%, hdi_97%, hdi_excludes_zero (lo>0 or hi<0); az.hdi(hdi_prob=0.94) confirmed; TestContrastsSchema 4/4 tests pass |
| 4 | Cohen d and partial eta-squared computed for all primary comparisons | VERIFIED | compute_cohens_d (pingouin) and compute_effect_sizes_table; TestCohensD + TestEffectSizesTable (7 tests); no regressions |
| 5 | Raincloud plots show parameter distributions by group x session | VERIFIED | plot_raincloud using ptitprince.RainCloud; TestPlotRaincloud + TestPlotInteraction (4 smoke tests with PNG write verification); no regressions |
| 6 | Phase-stratified analysis shows different effective learning rates | VERIFIED | compute_phase_learning_metrics + build_phase_stratified_df (195 lines); pipeline section 4b saves phase_stratified.csv, fits bambi group x phase model when n>=6; 5 TestPhaseStratification tests |
| 7 | Bayesian power validation: hdi_excludes_zero flags simulated group x session detection | VERIFIED | hdi_excludes_zero in every contrast row; pipeline prints power-validation summary for omega_2 (lines 264-275); TestContrastsSchema confirms boolean logic |
| 8 | Manuscript reads pipeline outputs correctly (consistent schema) | VERIFIED | paper.qmd reads estimates_wide.csv, group_contrasts.csv, effect_sizes.csv; queries hdi_3%, hdi_97%, hdi_excludes_zero; all matching pipeline output |

**Score:** 8/8 truths verified

### Required Artifacts

| Artifact | Expected | Status | Details |
|----------|----------|--------|---------|
| src/prl_hgf/analysis/phase_stratification.py | Phase-stratified learning metrics | VERIFIED | 195 lines; exports compute_phase_learning_metrics and build_phase_stratified_df; validation guard raises ValueError on missing columns |
| src/prl_hgf/analysis/group.py | HDI columns hdi_3%, hdi_97%, hdi_excludes_zero | VERIFIED | 396 lines; _contrast_row emits these keys at lines 316-318; docstring declares schema |
| src/prl_hgf/analysis/__init__.py | phase_stratification exports in __all__ | VERIFIED | Lines 32-35 import both functions; both in __all__ at lines 66-67 |
| scripts/06_group_analysis.py | Canonical CSV saves, phase stratification section 4b | VERIFIED | 388 lines; canonical saves lines 204-206, 226-228, 280-282; section 4b lines 284-352; bambi phase model fitted |
| tests/test_group_analysis.py | 27 tests covering all analysis pathways | VERIFIED | 504 lines; 27 test functions in 8 test classes |
| manuscript/paper.qmd | Reads canonical CSVs; queries hdi_3%, hdi_97%, hdi_excludes_zero | VERIFIED | 509 lines; setup cell reads all three canonical filenames; omega2_hdi_excludes_zero used in inline narrative |

### Key Link Verification

| From | To | Via | Status | Details |
|------|-----|-----|--------|---------|
| phase_stratification.py | __init__.py | import line 32 | WIRED | Both functions imported and in __all__ |
| phase_stratification.py | scripts/06_group_analysis.py | import lines 76-78; called line 290 | WIRED | build_phase_stratified_df called on loaded sim_df; result saved to phase_stratified.csv |
| phase_stratification.py | tests/test_group_analysis.py | import lines 27-30; 5 tests | WIRED | TestPhaseStratification exercises both public functions |
| group.py _contrast_row | hdi schema | emitted at lines 316-318 | WIRED | Keys hdi_3%, hdi_97%, hdi_excludes_zero match paper.qmd queries at lines 92-95 |
| scripts/06_group_analysis.py | canonical estimates_wide.csv | line 204 | WIRED | paper.qmd reads results_dir / estimates_wide.csv at line 52 |
| scripts/06_group_analysis.py | canonical group_contrasts.csv | parameter inserted line 260; saved line 281 | WIRED | paper.qmd filters by parameter column at line 85 |
| scripts/06_group_analysis.py | canonical effect_sizes.csv | line 226 | WIRED | paper.qmd reads results_dir / effect_sizes.csv at line 54 |
| pipeline section 4b | bambi group x phase model | bmb.Model.fit() lines 327-333 | WIRED | Conditional on n >= 6; graceful degradation otherwise |
| pipeline | omega_2 power validation print | lines 264-275 | WIRED | Checks hdi_excludes_zero column; prints meets/does not meet criterion |

### Requirements Coverage

| Requirement | Status | Blocking Issue |
|-------------|--------|----------------|
| GRP-01: Extract point estimates per participant | SATISFIED | None |
| GRP-02: Mixed-effects model group x session on each parameter | SATISFIED | None |
| GRP-03: Phase-stratified analysis, group x phase interaction on effective learning rate | SATISFIED | None |
| GRP-04: Raincloud and interaction plots by group x session | SATISFIED | None |
| GRP-05: Effect sizes (Cohen d, partial eta-squared) for all group comparisons | SATISFIED | None |

### Anti-Patterns Found

| File | Line | Pattern | Severity | Impact |
|------|------|---------|----------|--------|
| src/prl_hgf/analysis/group.py | 394 | Comment uses word placeholder in _infer_reference_session | Info | Not a code stub -- comment explains a data-absent fallback; function returns valid string in both branches |

No blockers. No warnings. The single token is in a comment explaining a legitimate fallback,
not in rendered output or returned data structures.

### Gap Closure Summary

All three gaps from the initial verification (2026-04-06T16:51:37Z) are confirmed closed.

**Gap 1 (Phase stratification) -- CLOSED.**
src/prl_hgf/analysis/phase_stratification.py (195 lines) implements
compute_phase_learning_metrics and build_phase_stratified_df using win-stay/lose-shift
behavioral proxies -- the standard PRL approach when HGF parameters are session-level and
per-trial belief trajectories are not stored. Both functions are imported in __init__.py
and listed in __all__. Pipeline section 4b (lines 284-352) loads sim_df, calls
build_phase_stratified_df, saves phase_stratified.csv, prints a group x phase summary
table, and fits a bambi model outcome ~ C(group) * C(phase_label) + (1 | participant_id)
for win_stay_rate and lose_shift_rate when n >= 6. Five TestPhaseStratification tests
cover output schema, row count, value bounds [0,1], and the ValueError raised on missing
columns.

**Gap 2 (Power validation / hdi_excludes_zero) -- CLOSED.**
_contrast_row in group.py (lines 316-318) emits hdi_3%, hdi_97%, and hdi_excludes_zero
(True when lo>0 or hi<0 -- the correct Bayesian significance criterion). The pipeline
prints a Bayesian power-validation summary for omega_2 at lines 264-275. TestContrastsSchema
(4 tests) enforces the schema, verifies the boolean logic with constant-positive,
zero-spanning, and constant-negative sample sets, and asserts the old column names hdi_3/hdi_97
are absent.

**Gap 3 (CSV schema mismatch) -- CLOSED.**
The pipeline saves three canonical filenames alongside model-specific variants:
estimates_wide.csv (line 204), effect_sizes.csv (line 226), and group_contrasts.csv
(line 281) with a parameter column inserted at line 260. paper.qmd reads exactly these
three filenames at lines 52-54 and queries hdi_3%/hdi_97%/hdi_excludes_zero at lines 92-95
-- all matching the updated pipeline schema. The get_contrast helper filters by the
parameter column, which is now present in the combined CSV.

**No regressions detected.** Truths 1-5 from the initial verification all pass sanity
checks: exported functions unchanged, bambi wiring intact, az.hdi(hdi_prob=0.94)
confirmed, compute_cohens_d and compute_effect_sizes_table unchanged, plot functions present.

---

_Verified: 2026-04-06T19:15:00Z_
_Verifier: Claude (gsd-verifier)_
