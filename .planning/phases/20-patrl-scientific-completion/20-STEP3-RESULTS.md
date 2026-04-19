# Phase 20 Step 3 — PRL-V1 + PRL-V2 Numeric Gate Results

**Date:** 2026-04-19
**Source data:** cluster jobs 54901120 (level-2 Laplace) + 54901121 (level-3 Laplace)
**Cohort:** 160 agents × 4 phenotypes × 40 per phenotype, master_seed=42
**Fit method:** VB-Laplace via `fit_vb_laplace_patrl` (user directive 2026-04-19 per memory)
**Computed via:** one-shot `_step3_gates.py` (now removed); reuses `simulate_patrl_cohort` for phenotype mapping, reads cluster-smoke `parameter_summary.csv` + `true_params.csv`
**Output CSVs:** `results/patrl_smoke/step3_gates/prl_v1_recovery.csv` + `prl_v2_separability.csv`

## PRL-V1 Recovery Gate (r ≥ 0.7 on primary params)

| Level | Parameter | r | n | Verdict |
|-------|-----------|---|---|---------|
| 2-level | ω₂ | +0.935 | 160 | ✓ PASS |
| 2-level | β | +0.831 | 160 | ✓ PASS |
| 3-level | ω₂ | −0.011 | 160 | ✗ FAIL |
| 3-level | β | −0.076 | 151 | ✗ FAIL |
| 3-level | κ | NaN (constant) | 160 | ✗ FAIL |
| 3-level | ω₃ | −0.029 | 160 | exploratory |
| 3-level | μ₃⁰ | −0.014 | 160 | exploratory |

**2-level gate: PASS** on both primary params with huge margin.
**3-level gate: FAIL** — all 3-level posterior means essentially uncorrelated with truth.

### 3-level failure mode

- κ recovery is `NaN` because all Laplace MAP estimates collapsed to a constant value (optimizer stuck at prior mean or logit boundary)
- β has 9 participants dropped for non-finite posterior means (log_beta → exp blow-up; reported in STEP3 filter)
- The remaining 151 β values and all 160 ω₂ values are finite but essentially random with respect to truth — the MAP is landing on pathological local modes of the 3-level posterior

This is consistent with Phase 19's closure memo finding of β width asymmetry under Laplace (~180% of NUTS sd at 5 agents). At 160 × 3-level the asymmetry compounds into full breakdown.

## PRL-V2 Separability Gate (Option A factorial, d ≥ 0.5, |cor| < 0.5)

Computed on **2-level** posterior means (where Laplace is clean).

| Axis | d / cor | n | Verdict |
|------|---------|---|---------|
| d(ω₂ \| ANX_HI vs ANX_LO) | +1.629 | 80 vs 80 | ✓ PASS |
| d(β \| REW_HI vs REW_LO) | +2.335 | 80 vs 80 | ✓ PASS |
| \|cor(ω₂, β)\| | 0.005 | 160 | ✓ PASS (orthogonality) |

Axis masks (Option A): ANX_HI = {high_anxiety, anxious_reward}; ANX_LO = {healthy, reward_susceptible}; REW_HI = {reward_susceptible, anxious_reward}; REW_LO = {healthy, high_anxiety}.

### Supplementary pairwise (Option B)

| Contrast | d | n |
|----------|---|---|
| d(ω₂ \| high_anxiety vs healthy) | +1.701 | 40 vs 40 |
| d(β \| reward_susceptible vs healthy) | +2.210 | 40 vs 40 |

Pairwise effect sizes closely track factorial d's — phenotype grid is well-separated on both axes with negligible cross-contamination.

## Interpretation

**PRL-V2 validated unconditionally at 2-level Laplace.** The phenotype grid is highly identifiable; ω₂ cleanly separates anxiety, β cleanly separates reward sensitivity, and the two parameters are effectively orthogonal across the 160-agent cohort.

**PRL-V1 partially validated:**
- At 2-level, Laplace recovers primary parameters with excellent fidelity. Production-ready.
- At 3-level, Laplace is not viable at cohort scale. Recovery needs NUTS — which was deferred to Phase 14-15 GPU-feasibility outcomes per user directive 2026-04-19.

**Implication for downstream (BMS + PEB):**
- The 3-level Laplace fits cannot support trustworthy 2-level-vs-3-level BMS at the cohort scale. Running `compute_stratified_bms` on these fits would propagate MAP pathologies into model-evidence differences.
- BMS + PEB Δ-evidence export should be gated on NUTS 3-level fits becoming feasible at 160 agents (Phase 14-15 outcome).

## Followup

1. Revisit 3-level at 160 agents once Phase 14-15 GPU-bench verdict lands — run `fit_batch_hierarchical_patrl` with BlackJAX NUTS and re-run this same gate script.
2. Option for interim: restrict BMS scope to 2-level baseline + 2-level-with-delta-HR Models B/C/D (all 2-level where Laplace works), deferring the 2-level vs 3-level BMS until NUTS 3-level is available.
3. Investigate why 3-level Laplace κ collapses to constant — likely a logit-reparam issue flagged in STATE.md decision 140 ("kappa in native TruncatedNormal space; logit-reparam deferred"). Tighter logit prior or LBFGS restart perturbation may help — but not worth pursuing in Phase 20 if NUTS 3-level becomes the production path post-Phase-14-15.
