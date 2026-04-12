---
phase: 13-jax-native-cohort-simulation
plan: 02
subsystem: simulation
tags: [jax, vmap, lax.scan, pyhgf, hgf, prng, xla, batch]

# Dependency graph
requires:
  - phase: 13-01
    provides: "_build_session_scanner factory, _run_session pure-JAX vmappable kernel"
  - phase: 02-task-environment
    provides: "generate_session, Trial dataclass, cue_probs per-trial"
provides:
  - "simulate_cohort_jax: vmap wrapper over _run_session for shared-trial-sequence cohorts"
  - "simulate_batch: rewritten to use JAX vmap path (per-participant cue_probs stacked and vmapped)"
  - "__init__.py updated to export simulate_cohort_jax and simulate_session_jax"
  - "4 new unit tests: cohort shapes, determinism, distinct participants, diverged column"
affects: [13-03, validation/test_jax_session_valid.py]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "simulate_cohort_jax: factory once + lambda closure over shared cue_probs_arr, vmap 6 scalar params"
    - "simulate_batch two-phase: Python collection pass then single jax.vmap dispatch over full cohort"
    - "Per-participant cue_probs stacked to (P, n_trials, 3) for vmap axis=0 in batch path"

key-files:
  created: []
  modified:
    - src/prl_hgf/simulation/jax_session.py
    - src/prl_hgf/simulation/batch.py
    - src/prl_hgf/simulation/__init__.py
    - tests/test_jax_session.py

key-decisions:
  - "simulate_cohort_jax captures shared cue_probs_arr in lambda closure (not vmap axis) — clean for shared-trial cohorts"
  - "simulate_batch uses per-participant cue_probs stacked as axis=0 — different from simulate_cohort_jax signature — handles env_seed variation"
  - "Two-phase batch: Python collection pass then single vmap dispatch — preserves deterministic seed derivation"
  - "Removed _prewarm_jit: JAX vmap handles JIT compilation on first vmap call; no separate pre-warm needed"

patterns-established:
  - "Two-phase batch pattern: collect all inputs in Python, then dispatch single XLA kernel over full cohort"
  - "Closure vs axis vmap distinction: shared data in closure, per-participant data as axis=0"

# Metrics
duration: 13min
completed: 2026-04-12
---

# Phase 13 Plan 02: Cohort vmap Path Summary

**simulate_cohort_jax (vmap over shared trial sequence) + simulate_batch rewritten to full-cohort JAX vmap dispatch with per-participant cue_probs stacking**

## Performance

- **Duration:** 13 min
- **Started:** 2026-04-12T13:29:37Z
- **Completed:** 2026-04-12T13:42:48Z
- **Tasks:** 2
- **Files modified:** 4

## Accomplishments

- `simulate_cohort_jax` vmaps `_run_session` across `P` participants using shared `cue_probs_arr` in lambda closure; returns `(choices, rewards, diverged)` with shapes `(P, n_trials)`, `(P, n_trials)`, `(P,)`
- `simulate_batch` rewritten to two-phase: Python collection pass gathers all params + per-participant trial sequences, then single `jax.vmap` dispatches over the full cohort `(P_total, n_trials, 3)` in one compiled XLA kernel
- `__init__.py` exports `simulate_cohort_jax` and `simulate_session_jax` alongside existing API
- All 6 existing `test_batch.py` tests pass; 4 new cohort-level tests added to `test_jax_session.py` (9 total, all pass)

## Task Commits

Each task was committed atomically:

1. **Task 1: Add simulate_cohort_jax and update batch.py + __init__.py** - `bf0ba2c` (feat)
2. **Task 2: Cohort-level tests for simulate_cohort_jax** - `bd9ee96` (test)

**Plan metadata:** (docs commit follows)

## Files Created/Modified

- `src/prl_hgf/simulation/jax_session.py` - Added `simulate_cohort_jax` function and updated `__all__`
- `src/prl_hgf/simulation/batch.py` - Rewritten to use JAX vmap two-phase pattern; removed `_prewarm_jit` and `build_3level_network` import
- `src/prl_hgf/simulation/__init__.py` - Added `simulate_cohort_jax` and `simulate_session_jax` to imports and `__all__`
- `tests/test_jax_session.py` - Added tests 6-9: cohort shapes, determinism, distinct participants, diverged column; added imports and `_small_config` helper

## Decisions Made

- **`simulate_cohort_jax` uses lambda closure for shared `cue_probs_arr`:** All participants see the same trial sequence; capturing in closure keeps vmap axes clean (6 scalar params + 1 key). Plan 01 docstring had shown `in_axes=(None, None, ...)` but lambda closure is equivalent and cleaner.
- **`simulate_batch` stacks per-participant `cue_probs_arr` as axis=0:** Each participant-session has a distinct `env_seed` producing a different trial sequence. Stacking to `(P, n_trials, 3)` and vmapping with `in_axes=0` handles this cleanly — different interface from `simulate_cohort_jax`.
- **Removed `_prewarm_jit`:** No longer needed; `jax.vmap` triggers JIT on first call, and the two-phase batch structure means compilation happens once before DataFrame assembly.

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered

None.

## Next Phase Readiness

- JAX-native simulation pipeline is complete: `simulate_session_jax` (single session) + `simulate_cohort_jax` (shared trial sequence cohort) + `simulate_batch` (full study cohort with per-participant trial sequences)
- Plan 03 (benchmarks) can now measure JAX vmap speedup vs the old sequential NumPy loop
- `diverged` column is present and boolean in `simulate_batch` output — ready for downstream filtering

---
*Phase: 13-jax-native-cohort-simulation*
*Completed: 2026-04-12*
