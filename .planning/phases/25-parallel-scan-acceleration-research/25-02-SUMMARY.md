---
phase: 25-parallel-scan-acceleration-research
plan: "02"
subsystem: research
tags: [jax, parallel-scan, hgf, elk, pieks, blackjax, nuts, algorithm-selection]

# Dependency graph
requires:
  - phase: 25-parallel-scan-acceleration-research
    plan: "00b"
    provides: API bridging feasibility verdicts (ELK=FEASIBLE ~1-2d, PIEKS=FEASIBLE-WITH-EFFORT ~3-4d) and probe confirming hgf_step IS f(state)
  - phase: 25-parallel-scan-acceleration-research
    plan: "01"
    provides: Empirical lambda_hat distribution (median=-0.0135, cross-regime), K=8-15 prediction, 76% transient-sr->=1 finding, PASS-WITH-FAILURE-MODES verdict
provides:
  - Locked algorithm choice: quasi-ELK (lindermanlab/elk), diagonal-Jacobian variant
  - 5-way comparison table (ELK, DEER, Zoltowski, Hybrid, PIEKS) with all 8 decision criteria
  - Explicit PIEKS-vs-ELK resolution citing empirical lambda_hat and LM-trust-radius mandate
  - Reproduction target for 25-03: arXiv:2102.00514 §5 Coordinated Turn Model (D=4, T=500, V100)
  - T-regime win-zone framing for 25-06 productionization verdict
  - Documented parked options: PIEKS (§13.1) and Zoltowski (§13.2)
affects:
  - 25-03 (reproduces arXiv:2102.00514 §5 D=4/T=500 baseline)
  - 25-04 (prototypes ELK against that baseline)
  - 25-05 (posterior-validity recovery test using ELK)
  - 25-06 (productionization verdict frames T=420 vs T>=1000 distinction)

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Algorithm selection driven by empirical lambda_hat from Benettin QR scan, not analogy-based prediction"
    - "Reproduction target chosen for regime match (D=4, T=500) rather than algorithm match (PIEKS paper used even though ELK chosen)"
    - "Parked options documented with explicit gating conditions to enable future revival"

key-files:
  created:
    - .planning/phases/25-parallel-scan-acceleration-research/ALGORITHM_DECISION.md
    - .planning/phases/25-parallel-scan-acceleration-research/25-02-SUMMARY.md
  modified:
    - .planning/STATE.md

key-decisions:
  - "ELK (quasi-ELK, lindermanlab/elk) chosen over PIEKS: lambda_hat=-0.0135 collapses PIEKS K-advantage; 76% transient-sr>=1 mandates LM trust radius ELK has and PIEKS lacks; eHGF mismatch adds ~1 day bridging"
  - "Reproduction target is PIEKS paper arXiv:2102.00514 §5 (D=4, T=500), not ELK paper — best regime match for establishing GPU breakeven baseline"
  - "PIEKS parked as future validation for simpler linear HGFs (§13.1); Zoltowski parked as third-axis NUTS parallelization (§13.2)"
  - "T=420 speedup expected marginal (0.5-2x GPU); T>=1000 expected 5-10x GPU; T>=2000 branched 10-20x GPU"
  - "No hybrid gating predicate needed: 25-01 failure modes are transient (per-trial sr>1), not divergent (lambda_hat<0 for all 400 vectors); LM damping handles them within ELK"

patterns-established:
  - "Phase 25 algorithm lock: ELK is the chosen algorithm for 25-03 through 25-06; decisions in those plans inherit this lock"
  - "Future-work documentation pattern: parked options get explicit §13.x subsections with gating conditions, not just a dismissal note"

# Metrics
duration: ~45min
completed: 2026-04-28
---

# Phase 25 Plan 02: Algorithm Decision Summary

**quasi-ELK (lindermanlab/elk) locked as Phase 25 algorithm; PIEKS paper arXiv:2102.00514 §5 (D=4, T=500, V100) named as 25-03 reproduction target; PIEKS and Zoltowski explicitly parked as post-Phase-25 future work**

## Performance

- **Duration:** ~45 min
- **Started:** 2026-04-27T00:00:00Z (memo written)
- **Completed:** 2026-04-28T00:00:00Z (checkpoint closed, §13 added, state updated)
- **Tasks:** 2 (Task 1: write ALGORITHM_DECISION.md; Task 2: amend §13 + write summary)
- **Files modified:** 3 (ALGORITHM_DECISION.md created+amended, 25-02-SUMMARY.md created, STATE.md updated)

## Accomplishments

- 5-way algorithm comparison (ELK, DEER, Zoltowski, Hybrid, PIEKS) with all 8 decision
  criteria populated from 25-00b API feasibility verdicts and 25-01 lambda_hat distribution
- PIEKS-vs-ELK question resolved explicitly: empirical lambda_hat = −0.0135 (cross-regime
  median) shrinks PIEKS's K-advantage to 1-3 iterations; 76.5% of trials with transient
  spectral radius ≥ 1 makes ELK's LM trust radius mandatory; eHGF posterior mismatch
  adds bridging cost beyond the 3-4 day estimate
- Reproduction target for 25-03 locked: Yaghoobi et al. arXiv:2102.00514 §5 "Coordinated
  Turn Model" (D=4, T=500, V100 GPU) — chosen for D=4 regime match, not algorithm match
- T-regime win-zone framing locked for 25-06: T=420 marginal (0.5-2x GPU), T>=1000 win
  zone (5-10x GPU), T>=2000 branched (10-20x GPU)
- PIEKS (§13.1) and Zoltowski arXiv:2508.18413 (§13.2) documented as parked future work
  with explicit gating conditions

## Task Commits

Each task was committed atomically:

1. **Task 1 (original): Write ALGORITHM_DECISION.md** — `038b8f8` (docs)
2. **Task 2 (amendment): Add §13 parked-future-work section to ALGORITHM_DECISION.md** — `ac51597` (docs)

**Plan metadata:** included in `docs(25-02): complete algorithm decision plan (confirm-elk)` commit (this plan)

## Files Created/Modified

- `.planning/phases/25-parallel-scan-acceleration-research/ALGORITHM_DECISION.md` — 5-way
  algorithm comparison memo with §1-12 (original) + §13 Parked Algorithms / Future Work
  (added at checkpoint closure). 546 lines + 126 lines §13 amendment.
- `.planning/phases/25-parallel-scan-acceleration-research/25-02-SUMMARY.md` — this file
- `.planning/STATE.md` — updated current position, added PIEKS/Zoltowski parked entries

## Decisions Made

1. **ELK over PIEKS.** Three empirical findings from 25-01 and 25-00b override PIEKS's
   theoretical advantages: (a) λ̂ = −0.0135 collapses the K-iteration advantage;
   (b) 76.5% of trials with transient sr ≥ 1 mandates LM trust radius (ELK has it,
   PIEKS does not); (c) eHGF posterior mismatch adds bridging cost. See
   ALGORITHM_DECISION.md §8 for full rationale.

2. **Reproduction target = PIEKS paper, not ELK paper.** Yaghoobi et al.
   arXiv:2102.00514 §5 Coordinated Turn Model (D=4, T=500, V100) is the most directly
   comparable published benchmark to HGF's regime. Reproducing it in 25-03 establishes
   the GPU breakeven baseline; 25-04 then prototypes ELK against that same baseline.
   The ELK paper's own benchmark (arXiv:2407.19115 Table 2, D=3, sequential wins) is
   too small-D to be a useful baseline.

3. **No hybrid gating predicate.** 25-01 failure modes are transient (per-trial
   Jacobian sr > 1), not globally divergent (λ̂ < 0 for all 400 sampled parameter
   vectors). ELK's LM damping handles the transient spikes within the full-parallel
   path. No routing to sequential fallback is needed.

4. **Expected K range: 8-15 for 1e-5 tolerance.** Test K ∈ {3, 5, 8, 10, 15} in
   25-04 prototype. At λ̂ = −0.0135, both ELK and PIEKS converge in this range; the
   cross-regime variation (−0.0132 to −0.0143 by regime) does not shift the prediction
   materially.

5. **Parked options documented with gating.** PIEKS parked for future validation on
   simpler linear HGFs (§13.1 gating: 25-06 verdict + ELK K > 12 or continuous-emission
   variant). Zoltowski parked as third-axis sampler parallelization (§13.2 gating:
   positive 25-06 verdict + public Zoltowski reference implementation).

## Deviations from Plan

### Auto-fixed Issues

None - plan executed as specified. The checkpoint decision (confirm-elk) was handled
by adding §13 to ALGORITHM_DECISION.md as instructed. The user explicitly parked PIEKS
and Zoltowski rather than dismissing them, which was accommodated by the §13 amendment
approach rather than any deviation from the plan structure.

## Issues Encountered

None. The memo was written with 25-00b and 25-01 findings fully available. The user's
confirm-elk decision at the checkpoint was unambiguous and required only the §13
documentation addition to close the plan.

## Next Phase Readiness

**25-03 (Reference Reproduction) is unblocked.** Required inputs are:
- Reproduction target: arXiv:2102.00514 §5 Coordinated Turn Model, D=4, T=500, V100
- GPU breakeven baseline to establish: parallel vs sequential wall-clock ratio within
  20% of published figure (Fig. 3 of arXiv:2102.00514 or Table 1 in ICASSP version)
- JAX_ENABLE_X64=1 mandatory (carry from 25-00b Risk #6)
- float64 confirmed for all Phase 25 JAX code

**25-04 (HGF Prototype) inputs ready after 25-03:**
- Algorithm: quasi-ELK, lindermanlab/elk repo
- API: `hgf_step` IS `f(state)` (probe confirmed, max rel-err 1.07e-13)
- K test grid: {3, 5, 8, 10, 15} at 1e-4 tolerance
- Benchmark T values: 420 (current production), 1000, 2000

**Blockers:** None. Phase 25 is in good shape to proceed to 25-03.

---
*Phase: 25-parallel-scan-acceleration-research*
*Completed: 2026-04-28*
