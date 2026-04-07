---
phase: 11-aggregation-publication
verified: 2026-04-07T00:00:00Z
status: gaps_found
score: 4/5 must-haves verified
gaps:
  - truth: "All phase 11 tests pass"
    status: failed
    reason: "prl_hgf/power/__init__.py eagerly imports iteration.py which chains fitting.ops -> jax at collection time. All three test modules fail to collect. Tests claim no MCMC/JAX required but __init__.py makes that impossible."
    artifacts:
      - path: "src/prl_hgf/power/__init__.py"
        issue: "Line 25 imports iteration.py which triggers the full fitting stack (JAX, pyhgf, bambi) at package import time, blocking collection for test_power_curves.py, test_power_plots.py, test_power_recommendation.py"
    missing:
      - "Remove iteration import from __init__.py so lightweight consumers like curves.py can be imported without JAX"
      - "Verify no other module imports run_power_iteration from prl_hgf.power package namespace before removing"
---

# Phase 11: Aggregation, Figures, and Recommendation Verification Report

**Phase Goal:** All sweep results are aggregated into a single master parquet, publication-quality figures are produced, and a concrete N/group recommendation with supporting evidence is written in results/power/.
**Verified:** 2026-04-07T00:00:00Z
**Status:** gaps_found
**Re-verification:** No

## Goal Achievement

### Observable Truths

| # | Truth | Status | Evidence |
|---|-------|--------|----------|
| 1 | scripts/09_aggregate_power.py concatenates parquets into power_master.csv and warns on missing cells | VERIFIED | 110 lines, imports aggregate_parquets/compute_power_a/compute_power_b, emits UserWarning for missing cells |
| 2 | Power A figure shows P(BF>6) vs N with curves per effect size, 80%/90% lines, d=0.5 annotation | VERIFIED | plot_power_a() recomputes from bf_value>=6.0, axhline(0.80) and axhline(0.90), _annotate_crossing(effect_size=0.5, power_level=0.80) |
| 3 | Power B figure shows P(correct BMS) vs N with 75% reference line | VERIFIED | plot_power_b() plots p_bms_correct vs N, axhline(0.75) |
| 4 | 4-panel publication figure saved as both PDF and PNG | VERIFIED | plot_combined_figure() saves fig.savefig(pdf_path) and fig.savefig(png_path) explicitly |
| 5 | recommendation.md states concrete N/group + trial count + BF evidence + exclusion rate + omega_3 caveat | VERIFIED | generate_recommendation() has 9 sections covering all required elements including omega_3 upper-bound caveat |

**Score: 5/5 truths verified structurally**

### Test Suite Status

| Test File | Lines | Status | Root Cause |
|-----------|-------|--------|------------|
| tests/test_power_curves.py | 283 | FAILS at collection | Import triggers __init__.py -> iteration.py -> fitting.ops -> jax |
| tests/test_power_plots.py | 452 | FAILS at collection | Same root cause |
| tests/test_power_recommendation.py | 538 | FAILS at collection | Same root cause |

**Score: 4/5 must-haves verified** (truths 1-5 pass; test suite gap fails the tests-pass requirement)

### Required Artifacts

| Artifact | Lines | Status |
|----------|-------|--------|
| src/prl_hgf/power/curves.py | 209 | VERIFIED - aggregate_parquets, compute_power_a, compute_power_b, no stubs |
| scripts/09_aggregate_power.py | 110 | VERIFIED - wired to curves.py, writes 3 CSVs |
| scripts/10_plot_power_curves.py | 895 | VERIFIED - all 4 plot functions, combined figure with PDF+PNG save |
| scripts/11_write_recommendation.py | 796 | VERIFIED - generate_recommendation() with all 9 sections |
| tests/test_power_curves.py | 283 | GAP - cannot collect due to __init__.py eager import |
| tests/test_power_plots.py | 452 | GAP - cannot collect due to __init__.py eager import |
| tests/test_power_recommendation.py | 538 | GAP - cannot collect due to __init__.py eager import |
| src/prl_hgf/power/grid.py | - | VERIFIED - chunk_task_ids at line 85 |
| src/prl_hgf/power/seeds.py | - | VERIFIED - make_chunk_rngs at line 66 |
| src/prl_hgf/power/schema.py | 136 | VERIFIED - write_parquet_batch at line 93 |
| scripts/08_run_power_iteration.py | - | VERIFIED - --chunk-id arg line 57, chunk_task_ids called line 125 |

### Key Link Verification

| From | To | Status |
|------|----|--------|
| scripts/09_aggregate_power.py | prl_hgf.power.curves (3 functions) | WIRED |
| scripts/10_plot_power_curves.py | prl_hgf.power.curves (2 functions) | WIRED |
| scripts/11_write_recommendation.py | prl_hgf.power.curves (2 functions) | WIRED |
| prl_hgf.power.curves | prl_hgf.power.schema.POWER_SCHEMA | WIRED |
| plot_combined_figure | PDF + PNG savefig calls | WIRED |
| scripts/08_run_power_iteration.py | prl_hgf.power.grid.chunk_task_ids | WIRED |
| test_power_curves.py | prl_hgf.power.curves | BROKEN - jax chain |

### Requirements Coverage

| Requirement | Status | Evidence |
|-------------|--------|---------|
| VIZ-01 Precheck figure r vs trial count reference r=0.7 | SATISFIED | plot_precheck_recovery() with axhline(0.7), omega_3 dashed |
| VIZ-02 Power A P(BF>6) vs N 80%/90% lines annotate d=0.5 at 80% | SATISFIED | plot_power_a() bf_threshold=6.0, both reference lines, _annotate_crossing |
| VIZ-03 Power B P(correct BMS) vs N reference at 75% | SATISFIED | plot_power_b() axhline(0.75) |
| VIZ-04 Combined 4-panel figure precheck+A+B+heatmap PDF+PNG | SATISFIED | plot_combined_figure() 2x2 layout, both formats saved |
| REC-01 Markdown report N/group trial count evidence caveats | SATISFIED | generate_recommendation() 9-section report with omega_3 upper-bound caveat |

### Anti-Patterns Found

| File | Line | Pattern | Severity | Impact |
|------|------|---------|---------|--------|
| src/prl_hgf/power/__init__.py | 25 | Eager import of iteration.py (triggers JAX chain) | BLOCKER | All 3 phase 11 test files (1,273 combined lines) cannot be collected or run |

### Ruff Status

All checked files pass ruff with zero violations.

### Gaps Summary

One gap blocks test execution. prl_hgf/power/__init__.py line 25 eagerly re-exports run_power_iteration and build_arrays_from_sim from iteration.py. This creates a mandatory JAX import chain triggered by any import of the prl_hgf.power package (including submodule imports like prl_hgf.power.curves). All three phase 11 test files fail at pytest collection time.

Fix: remove lines 25-26 from __init__.py (the iteration import and its two names from __all__). Script 08_run_power_iteration.py imports iteration directly and is unaffected.

All 5 goal truths are structurally verified. All 5 requirements (VIZ-01 through VIZ-04, REC-01) are satisfied. Chunk infrastructure (chunk_task_ids, make_chunk_rngs, write_parquet_batch, --chunk-id) is present and wired. Ruff is clean.

---

_Verified: 2026-04-07T00:00:00Z_
_Verifier: Claude (gsd-verifier)_
