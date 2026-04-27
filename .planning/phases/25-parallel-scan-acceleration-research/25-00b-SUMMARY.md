---
phase: 25-parallel-scan-acceleration-research
plan: "00b"
subsystem: research
tags: [pyhgf, jax, parallel-scan, HGF, PIEKS, ELK, associative-scan, api-bridging]

# Dependency graph
requires:
  - phase: 25-00
    provides: "25-RESEARCH.md literature synthesis including PIEKS, ELK, associative_scan candidates"
provides:
  - "API_BRIDGING_STUDY.md: pyhgf state-shape inventory with exact key→index mapping for 3-level HGF"
  - "scratch/api_bridging_probe.py: verified pure-function extraction of pyhgf per-trial update (max rel-err 1.07e-13 on 50 trials)"
  - "Three candidate API feasibility verdicts: ELK=FEASIBLE, PIEKS=FEASIBLE-WITH-EFFORT, DIY=FEASIBLE-WITH-EFFORT"
  - "Recommendation: ELK for 25-04 prototype default"
  - "7-risk register including float64 requirement, Jacobian instability, eHGF mismatch"
affects: [25-01, 25-02, 25-03, 25-04]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "hgf_step(attrs, input_t) -> (attrs', state_t): verified pure-function wrap of pyhgf scan_fn"
    - "JAX_ENABLE_X64=1 required for pyhgf compatibility (float64 throughout)"
    - "jax.tree_util.Partial: pyhgf scan_fn captures edges+update_sequence as static closures"
    - "State flattening: attributes[1][mean/precision] + attributes[6][mean/precision] = 4-dim tuple"

key-files:
  created:
    - .planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md
    - .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py
  modified: []

key-decisions:
  - "ELK (lindermanlab/elk quasi-ELK) is the recommended default API for 25-04 prototype: shallowest bridging, Levenberg-Marquardt trust region prevents Jacobian instability"
  - "PIEKS (EEA-sensors/sqrt-parallel-smoothers) is FEASIBLE-WITH-EFFORT: state-dependent R and eHGF posterior update divergence require wrappers"
  - "JAX_ENABLE_X64=1 is mandatory: without it, jax.lax.cond fails with dtype mismatch in posterior_update_precision_continuous_node"
  - "pyhgf scan_fn closure is time-invariant for pick_best_cue: edges and update_sequence are constant, so closure is functionally pure"
  - "Minimal dynamical state is 4-dimensional: (mu_1, pi_1, mu_2, pi_2) from nodes 1 and 6 only"

patterns-established:
  - "Pure-function extraction: wrap scan_fn step-by-step with per-trial sliced inputs (shape contract must match lax.scan's slicing)"
  - "float64 mandate: set JAX_ENABLE_X64 before any jax import in Phase 25 code"

# Metrics
duration: ~60 min
completed: 2026-04-27
---

# Phase 25 Plan 00b: API Bridging Study Summary

**pyhgf 3-level HGF per-trial update extracted as verified pure function `hgf_step`
(max rel-err 1.07e-13 on 50 trials); ELK recommended as 25-04 default API; 7 engineering
risks documented.**

## Performance

- **Duration:** ~60 min
- **Started:** 2026-04-27T14:30:00Z (approx.)
- **Completed:** 2026-04-27T15:36:29Z
- **Tasks:** 2 auto (probe + memo) + 1 checkpoint (pending user review)
- **Files modified:** 2 created (probe + study memo)

## Accomplishments

- Inspected pyhgf 0.2.8 source and confirmed exact attributes dict structure for
  3-level 3-branch binary HGF (7 nodes, dict keyed 0-6 plus -1 for time_step).
- Documented the complete call graph: `beliefs_propagation` → prediction (nodes 6,1,3,5,0,4,2)
  → prediction errors (0,2,4,1,5,1,5,3,3) → posterior updates (1,5,1,5,3,6 via eHGF).
- Built `hgf_step(attrs, input_t) -> (attrs', state_t)` wrapping pyhgf's scan_fn step-by-step.
- Verified numerical agreement: max rel-err = 1.07e-13 on 50 synthetic trials. PASS.
- Documented all three candidate API mappings with feasibility verdicts and engineering effort.
- Identified 7 concrete risks with severity and mitigation, including the float64 requirement
  (Risk #6) discovered by a failed first run.
- Recommended ELK for 25-04 prototype; deferred PIEKS vs ELK theoretical question to 25-02.

## Task Commits

1. **Task 1: Inspect pyhgf source and build scratch API probe** — `c886285` (feat)
2. **Task 2: Write API_BRIDGING_STUDY.md** — `d15765d` (docs)

**Checkpoint (Task 3):** Awaiting user review of API_BRIDGING_STUDY.md and probe output.

## Files Created/Modified

- `.planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py` —
  Pure-function extraction probe; verifies hgf_step numerically against pyhgf lax.scan.
- `.planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md` —
  Engineering feasibility study: pyhgf state-shape inventory, 3 candidate API verdicts,
  7-risk register, recommendation.

## Decisions Made

1. **ELK (quasi-ELK) for 25-04 default:** Shallowest bridging (hgf_step IS f(state));
   LM trust region prevents Jacobian instability. PIEKS deferred to 25-02 theoretical comparison.
2. **JAX_ENABLE_X64 required:** Without float64, `jax.lax.cond` in
   `posterior_update_precision_continuous_node` fails with dtype mismatch (ShapedArray
   float32[1] vs float32[]). This is a hard constraint for all Phase 25 code.
3. **Minimal state is 4-dim:** (mu_1, pi_1, mu_2, pi_2) from attributes[1] and attributes[6].
   Full 3-branch state is 8-dim. Expected_mean/precision are derived quantities, not state.
4. **scan_fn closure is safe for pick_best_cue:** edges and update_sequence are time-invariant
   for the fixed graph topology. Trial-varying theta (PAT-RL ΔHR) would activate closure risk.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] float64/float32 dtype mismatch caused probe failure on first run**

- **Found during:** Task 1 (first run of api_bridging_probe.py)
- **Issue:** Without `JAX_ENABLE_X64=1`, `jax.lax.cond` in pyhgf's
  `posterior_update_precision_continuous_node` raised `TypeError: true_fun and false_fun
  output must have identical types, got DIFFERENT ShapedArray(float32[1]) vs. ShapedArray(float32[])`.
  pyhgf uses float64 throughout; JAX defaults to float32.
- **Fix:** Added `os.environ["JAX_ENABLE_X64"] = "1"` at the top of the probe (before any jax import).
- **Files modified:** `scratch/api_bridging_probe.py`
- **Verification:** Probe ran to completion with max rel-err 1.07e-13. OK.
- **Committed in:** `c886285` (Task 1 commit)

---

**Total deviations:** 1 auto-fixed (1 bug: float64 requirement)
**Impact on plan:** Bug fix was essential; documented float64 as a hard constraint for
all Phase 25 code (Risk #6 in the study). No scope creep.

## Issues Encountered

None beyond the float64 issue (documented in Deviations above).

## User Setup Required

None — no external service configuration required.

## Next Phase Readiness

**Ready for:** Awaiting user approval at checkpoint (Task 3) before 25-01 and 25-02 can proceed.

**25-01 (theoretical validation):** The probe's `hgf_step` function is the concrete
`f(state)` needed to compute Jacobians numerically. The Jacobian scan protocol in
25-RESEARCH.md §5 can now reference `hgf_step` directly.

**25-02 (algorithm selection):** Has engineering-feasibility input. Must close the
PIEKS vs ELK question by weighing theoretical preference (PIEKS propagates Gaussian
uncertainty, more natural for HGF) against engineering feasibility (ELK requires
shallower bridging). API_BRIDGING_STUDY.md provides both verdicts.

**Blocker for 25-01:** None — can proceed in parallel with checkpoint review.
**Blocker for 25-02:** Requires both 25-00b approval AND 25-01 positive contraction verdict.

---
*Phase: 25-parallel-scan-acceleration-research*
*Completed: 2026-04-27*
