---
phase: 11
plan: "03"
subsystem: power-publication
tags: [power-analysis, recommendation, markdown-report, bfda, bms, cli]

dependency-graph:
  requires:
    - "11-01: aggregate_parquets, compute_power_a, compute_power_b in prl_hgf.power.curves"
    - "09: trial_sweep_results.csv and power_eligible_params.csv from precheck sweep"
  provides:
    - "scripts/11_write_recommendation.py — CLI that reads power CSVs and writes recommendation.md"
    - "tests/test_power_recommendation.py — 8 unit tests for generate_recommendation()"
  affects:
    - "Phase 12+ (manuscript): recommendation.md is the primary deliverable for grant/prereg use"

tech-stack:
  added: []
  patterns:
    - "importlib.util for testing pipeline scripts outside the src package"
    - "Pure generate_recommendation() function with no I/O for testability"
    - "textwrap.dedent for inline Markdown section generation"
    - "Graceful None handling for optional CSV inputs (precheck, eligibility)"

key-files:
  created:
    - scripts/11_write_recommendation.py
    - tests/test_power_recommendation.py
  modified: []

decisions:
  - decision: "generate_recommendation() re-applies bf_threshold to bf_value for sample-size selection"
    rationale: "Allows any bf_threshold CLI arg to affect the recommended N, not just the pre-baked bf_exceeds bool"
  - decision: "power_a_df and power_b_df are recomputed from master if CSVs missing"
    rationale: "Makes script self-sufficient when only power_master.csv exists"
  - decision: "omega_3 marked EXPLORATORY in eligibility table regardless of r value"
    rationale: "Consistent with locked project decision: binary PRL data gives r~0.67; naive BFDA inflates 20-40pp"
  - decision: "Exclusion rate warning threshold at >5% flagged rows (mean_rhat > 1.05)"
    rationale: "5% is a conventional convergence failure tolerance; warns user to review MCMC settings"

metrics:
  duration: "11m"
  completed: "2026-04-08"
  tasks-completed: 2
  tests-added: 8
  lines-created: 1334
---

# Phase 11 Plan 03: Power Recommendation Script Summary

**One-liner:** CLI script generating `recommendation.md` with concrete N/group and trial count, backed by BF power table, BMS discriminability, exclusion rate, and omega_3 upper-bound caveat.

## Tasks Completed

| # | Task | Commit | Files |
|---|------|--------|-------|
| 1 | Create scripts/11_write_recommendation.py | c9a2823 | scripts/11_write_recommendation.py (796 lines) |
| 2 | Create unit tests for recommendation generation | a0c0876 | tests/test_power_recommendation.py (538 lines) |

## What Was Built

### scripts/11_write_recommendation.py

Pure-function CLI script:

- `generate_recommendation(master_df, power_a_df, power_b_df, precheck_sweep_df, eligibility_df, bf_threshold, power_target) -> str` — returns complete Markdown document, no I/O
- 9 sections: Study Design Summary, Recommended Sample Size, Recommended Trial Count, Eligible Parameters, Power Summary Table (N x d), BMS Discriminability, Exclusion Rate, Caveats, Evidence Generated
- CLI flags: `--input-dir`, `--precheck-dir`, `--output-dir`, `--bf-threshold` (default 6.0), `--power-target` (default 0.80)
- Graceful degradation: missing CSV files handled per-section (pending / not available)
- Recomputes power_a / power_b from master_df if summary CSVs are absent
- Imports `compute_power_a`, `compute_power_b` from `prl_hgf.power.curves`; uses `RESULTS_DIR` from `config`

### tests/test_power_recommendation.py

8 unit tests using importlib.util import:

1. `test_recommendation_contains_n_per_group` — N=25 crosses 80% at d=0.5
2. `test_recommendation_no_crossing` — no N crosses 80%; "does not" in output
3. `test_recommendation_contains_trial_count` — 250 as min passing trial count
4. `test_recommendation_contains_omega3_caveat` — "exploratory" and "omega_3" present
5. `test_recommendation_contains_summary_table` — pipe delimiters (>10 `|` chars)
6. `test_recommendation_exclusion_rate` — 3/10 = 30.0% exclusion rate reported
7. `test_recommendation_handles_missing_precheck` — "pending" and "not available" with None inputs
8. `test_recommendation_bf_threshold_reflected` — "BF > 3" with bf_threshold=3.0

## Verification Results

| Check | Result |
|-------|--------|
| `--help` output (ds_env) | PASS |
| ruff check scripts/11_write_recommendation.py | PASS (clean) |
| ruff check tests/test_power_recommendation.py | PASS (clean) |
| pytest tests/test_power_recommendation.py | 8/8 PASS |
| scripts/11_write_recommendation.py >= 120 lines | PASS (796) |
| tests/test_power_recommendation.py >= 60 lines | PASS (538) |
| from prl_hgf.power.curves import pattern | PASS |
| import config as _cfg pattern | PASS |

## Must-Have Truths Satisfied

- recommendation.md states a concrete recommended N/group with BF evidence: YES (Section 2 computes first N >= power_target)
- recommendation.md states the recommended trial count: YES (Section 3 from precheck_sweep_df)
- recommendation.md includes exclusion rate summary: YES (Section 7, Rhat > 1.05 fraction)
- recommendation.md lists eligible parameters with r and pass/fail: YES (Section 4 table)
- recommendation.md includes omega_3 upper-bound caveat: YES (Section 8 Caveats)
- recommendation.md includes P(BF>threshold) summary table: YES (Section 5, N x d pivot)

## Deviations from Plan

None — plan executed exactly as written.

## Next Phase Readiness

Phase 11 Plan 03 is the final plan of Phase 11. The v1.1 milestone is now
code-complete:

- Plan 11-01: Power aggregation and curve computation (prl_hgf.power.curves)
- Plan 11-02: Power figures (scripts/11_plot_power_curves.py)
- Plan 11-03: Recommendation report (scripts/11_write_recommendation.py)

The `recommendation.md` output is the primary deliverable for grant
applications and preregistration documents. It requires real power sweep
results (power_master.csv) from the SLURM cluster job to produce meaningful
content; with synthetic or absent CSVs, all sections degrade gracefully.
