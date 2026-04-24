---
phase: 22-inspector-roles-schema-scaffold
plan: 04
subsystem: testing
tags: [pytest, arviz, pyhgf, viz, schema, roles, inspector, canary-tests]

# Dependency graph
requires:
  - phase: 22-01
    provides: inspect_network BFS with two-pass shared-parent dedup
  - phase: 22-02
    provides: infer_role adjacency-only + assign_levels_and_branches BFS
  - phase: 22-03
    provides: NetworkSpec/NodeSpec frozen dataclasses + build_network_spec composer
provides:
  - Canary integration tests for inspect_network (node dedup, Pitfall 8 guard, strict ValueError contract)
  - Unit tests for roles.infer_role + assign_levels_and_branches across 5 network topologies
  - Schema tests for frozen-ness, asdict+json round-trip, dual coord-name probe (participant/participant_id), Laplace r_hat suppression
  - Structural source-level guards preventing P16 regression (node_parameters read) and VIZ-02 regression (prl_hgf.* import in inspector)
affects:
  - Phase 23 (render_viewer_html)
  - Phase 24 (POST-01 posterior_mean/hdi extraction + az.summary integration)

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Session-scoped pytest fixtures for real pyhgf Network objects (no mocks)"
    - "Synthetic arviz.InferenceData via az.from_dict (no MCMC, no PyMC dependency) for schema tests"
    - "cast(az.InferenceData, az.from_dict(...)) pattern for mypy-compatible arviz stub (Decision 143 reuse)"
    - "Soft-gated import + @pytest.mark.skipif pattern for parallel-stack modules (multimodal 2-level PAT-RL)"
    - "Structural source-level guard tests (grep-free regression detection via Path().read_text() assertions)"

key-files:
  created:
    - tests/test_viz_inspector.py
    - tests/test_viz_roles.py
    - tests/test_viz_schema.py
  modified: []

key-decisions:
  - "Soft-gate multimodal fixture via try/except import + @pytest.mark.skipif rather than committing the untracked model file (preserves parallel-stack invariant while keeping test available locally)"
  - "Synthetic idata via az.from_dict for schema tests (no MCMC, no PyMC import) — schema coord-name + Laplace-marker probes tested with constructed xarray posteriors"
  - "cast(az.InferenceData, az.from_dict(...)) to satisfy mypy — reuses existing Decision 143 pattern from src/prl_hgf/fitting/laplace_idata.py"
  - "Structural guard tests (test_inspector_does_not_import_from_prl_hgf, test_roles_does_not_read_node_parameters) as first-class regression defence — complements behavioural assertions"

patterns-established:
  - "Canary tests named after their guarded Pitfall (P3 dedup, P16 adjacency-only, P8 input-node emission, SCHEMA-03/04) for grep-friendly lookup"
  - "Session-scoped fixtures per network variant enable BFS-trace reuse across multiple tests without rebuilding pyhgf Network objects (existing tests/test_models.py convention extended)"
  - "Structural source-level guards prevent future refactors from silently reintroducing known pitfalls"

# Metrics
duration: 10 min
completed: 2026-04-24
---

# Phase 22 Plan 04: Viz Test Scaffold Summary

**32 pytest canary tests across inspect_network, roles.infer_role, and NetworkSpec — encode P3/P16/P8 dedup + Pitfall 8 guard + SCHEMA-03/04 invariants against future regression.**

## Performance

- **Duration:** 10 min
- **Started:** 2026-04-24T18:50:53Z
- **Completed:** 2026-04-24T19:01:14Z
- **Tasks:** 3/3
- **Files created:** 3 (tests/test_viz_inspector.py, tests/test_viz_roles.py, tests/test_viz_schema.py)
- **Total lines:** 570 insertions across the 3 test files

## Accomplishments

- **10 inspector canary tests** covering PAT-RL 3/2-level + pick_best_cue 3/2-level including:
  - `test_pick_best_cue_3level_dedup` — P3 dedup canary (7 nodes emitted, NOT 9)
  - `test_all_input_idxs_emitted` (parametrized ×4 fixtures) — Pitfall 8 guard
  - `test_unknown_node_type_raises_value_error` — strict ValueError contract (CONTEXT Decision 3)
  - `test_inspector_does_not_import_from_prl_hgf` — VIZ-02 structural isolation guard

- **9 role-inference tests** covering 2-level binary, 3-level binary, 2-level PAT-RL, 3-level PAT-RL, and (conditionally) multimodal 2-level:
  - `test_volatility_role_pick_best_cue_node6` — P16 adjacency-only canary (role from edge structure, never from per-node attr dict keys)
  - `test_shared_parent_branch_promoted_to_none` — P3 shared-parent dedup canary (node 6 → branch_idx=None)
  - `test_multimodal_2level_role_coverage` — soft-skipped when `hgf_2level_multimodal_patrl` module absent
  - `test_roles_does_not_read_node_parameters` — P16 source-level guard (grep-free)

- **13 schema tests** via synthetic `az.from_dict` idata (no MCMC, no PyMC dependency):
  - `test_coord_name_detected_participant_id` + `test_coord_name_detected_participant` — SCHEMA-03 dual coord-name probe
  - `test_r_hat_suppressed_on_laplace_idata` — SCHEMA-04 Laplace r_hat suppression
  - `test_no_schema_version_or_extra_field` — CONTEXT Decision 4 forward-compat lockout
  - Round-trip via `dataclasses.asdict` + `json.dumps`
  - Frozen-ness assertions on both NetworkSpec and NodeSpec
  - `__post_init__` validation rejects invalid role/kind + duplicate node idxs

- **Parallel-stack invariant preserved** — zero lines changed under `src/prl_hgf/{env,models,fitting,analysis,gui,power,simulation}/` across all 3 commits (verified via `git diff --stat HEAD~3 HEAD`).

## Task Commits

Each task was committed atomically:

1. **Task 1: tests/test_viz_inspector.py** — `e5f543f` (test: inspector canary counts, Pitfall 8 guard, strict ValueError)
2. **Task 2: tests/test_viz_roles.py** — `daa9464` (test: role inference adjacency-only + BFS shared-parent coverage)
3. **Task 3: tests/test_viz_schema.py** — `a0378cb` (test: schema round-trip, dual coord-name, Laplace r_hat suppression)

## Files Created/Modified

- `tests/test_viz_inspector.py` (167 lines) — 10 integration tests for `inspect_network` against real pyhgf Network objects
- `tests/test_viz_roles.py` (197 lines) — 9 unit tests for `infer_role` + `assign_levels_and_branches`
- `tests/test_viz_schema.py` (206 lines) — 13 unit tests for `NetworkSpec`/`NodeSpec` + `build_network_spec` composition

## Decisions Made

- **Soft-gate multimodal fixture** via `try/except ImportError` + `@pytest.mark.skipif(not _HAS_MULTIMODAL, ...)` rather than committing the untracked `src/prl_hgf/models/hgf_2level_multimodal_patrl.py`. Rationale: the model file exists locally but is untracked (pre-existing parallel-stack work). Committing it would violate the Phase 22 parallel-stack invariant (`src/prl_hgf/models/` diff-stat must be empty). Soft-skipping keeps `tests/test_viz_roles.py` passing in both checkout states — with the model file present (local dev), the multimodal test runs; without it, the test is cleanly skipped rather than erroring at collection. The other 8 role tests are unaffected.
- **Synthetic arviz idata via `az.from_dict`** for all schema tests — avoids coupling test suite to the fitting stack. SCHEMA-03 dual coord-name and SCHEMA-04 Laplace r_hat suppression can be tested purely with constructed xarray posteriors; no MCMC run needed.
- **`cast(az.InferenceData, az.from_dict(...))` for mypy** — reuses existing Decision 143 pattern from `src/prl_hgf/fitting/laplace_idata.py`. `az.from_dict` stub in arviz typeshed returns `Any`; explicit cast is zero-overhead and aligns with established project convention.
- **Structural source-level guard tests** (`test_inspector_does_not_import_from_prl_hgf`, `test_roles_does_not_read_node_parameters`) added as first-class regression defence. These assert on `Path(mod.__file__).read_text()` content, catching structural violations even without behavioural change. Complements the behavioural assertions and prevents future refactors from silently reintroducing P16 (node_parameters read) or VIZ-02 (prl_hgf.* import in inspector) pitfalls.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] Soft-gated multimodal builder import to avoid committing untracked src/ file**

- **Found during:** Task 2 (tests/test_viz_roles.py)
- **Issue:** Plan references `from prl_hgf.models.hgf_2level_multimodal_patrl import build_2level_multimodal_network_patrl` as a hard import. That module lives in an untracked file (visible in initial `git status --short` before plan start as `?? src/prl_hgf/models/hgf_2level_multimodal_patrl.py`). Hard-importing it would mean:
  - Either commit the untracked file (violates parallel-stack invariant — Phase 22 success criterion requires zero line changes under `src/prl_hgf/models/`)
  - Or leave the test suite broken for anyone else who pulls without the untracked file
- **Fix:** Replaced hard import with `try: import ... except ImportError: _HAS_MULTIMODAL = False`; `test_multimodal_2level_role_coverage` decorated with `@pytest.mark.skipif(not _HAS_MULTIMODAL, ...)`; fixture also guarded with `pytest.skip(...)`. Plan explicitly offered this as option (a) ("skip the multimodal test with a clear xfail/skip and document in SUMMARY").
- **Files modified:** tests/test_viz_roles.py only (no src/ changes)
- **Verification:** Multimodal test PASSES locally (file is present), will cleanly SKIP on fresh clones until file is committed in a future plan. Other 8 role tests unaffected. Parallel-stack invariant preserved.
- **Commit:** `daa9464` (Task 2)

**2. [Rule 1 - Bug] cast() wrapper on az.from_dict to satisfy mypy**

- **Found during:** Task 3 (tests/test_viz_schema.py)
- **Issue:** `mypy tests/test_viz_schema.py` flagged `_make_synthetic_idata` with `error: Returning Any from function declared to return "InferenceData"` — arviz's `az.from_dict` stub is `-> Any` in typeshed, so the direct return breaks the declared return type.
- **Fix:** Added `from typing import cast`; wrapped return as `cast(az.InferenceData, az.from_dict(...))`. Zero runtime overhead. Pattern matches existing Decision 143 from `src/prl_hgf/fitting/laplace_idata.py`.
- **Files modified:** tests/test_viz_schema.py (added one import + wrapped one return)
- **Verification:** `mypy tests/test_viz_schema.py` → `Success: no issues found in 1 source file`
- **Commit:** `a0378cb` (Task 3)

---

**Total deviations:** 2 auto-fixed (1 blocking, 1 bug-fix).
**Impact on plan:** Both deviations are zero-scope changes. #1 preserves the parallel-stack invariant that Phase 22 hangs on; #2 reuses an existing project pattern for mypy compat. No behaviour change; no test coverage removed.

## Issues Encountered

None — all 32 tests passed first run (after the two auto-fixed deviations above).

## Verification Output

**Full test suite (`pytest tests/test_viz_inspector.py tests/test_viz_roles.py tests/test_viz_schema.py --tb=no -q`):**

```
============================== 32 passed in 5.97s ==============================
```

**Critical canary tests (individual run):**

```
tests/test_viz_inspector.py::test_pick_best_cue_3level_dedup           PASSED
tests/test_viz_roles.py::test_volatility_role_pick_best_cue_node6      PASSED
tests/test_viz_roles.py::test_shared_parent_branch_promoted_to_none    PASSED
tests/test_viz_schema.py::test_r_hat_suppressed_on_laplace_idata       PASSED
tests/test_viz_schema.py::test_coord_name_detected_participant_id      PASSED
tests/test_viz_schema.py::test_coord_name_detected_participant         PASSED
============================== 6 passed in 5.45s ==============================
```

**Ruff + mypy:**

```
$ ruff check tests/test_viz_inspector.py tests/test_viz_roles.py tests/test_viz_schema.py
All checks passed!
$ ruff format --check tests/test_viz_inspector.py tests/test_viz_roles.py tests/test_viz_schema.py
3 files already formatted
$ mypy tests/test_viz_inspector.py tests/test_viz_roles.py tests/test_viz_schema.py
Success: no issues found in 3 source files
```

**Parallel-stack invariant (plan-scope — diff of the 3 task commits):**

```
$ git diff --stat HEAD~3 HEAD -- src/prl_hgf/env/ src/prl_hgf/models/ src/prl_hgf/fitting/ src/prl_hgf/analysis/ src/prl_hgf/gui/ src/prl_hgf/power/ src/prl_hgf/simulation/
(empty — zero lines changed)
```

Plan 22-04 contributed ZERO src/ modifications. The 114-line uncommitted delta in `src/prl_hgf/fitting/hierarchical_patrl.py` (visible in `git diff --stat main -- src/prl_hgf/fitting/`) is pre-existing uncommitted work from before the plan started (present in the opening `git status --short`), NOT introduced by this plan.

## Notes for Phase 22 Closure

- The 32 tests are the phase-level canary suite. They encode every structural invariant (P3 dedup, P16 adjacency-only, P8 input-node emission, CONTEXT Decision 3 strict ValueError, Decision 4 no-schema-version/no-extra, SCHEMA-03 dual coord-name, SCHEMA-04 Laplace r_hat suppression) that Plans 22-01 / 22-02 / 22-03 established.
- Multimodal test runs locally (model file present as untracked); a future plan that officially introduces the multimodal 2-level PAT-RL variant can commit the source file and remove the soft-gate — the test itself is ready to exercise it.
- All three test modules use real pyhgf Network objects (except synthetic arviz idata for schema tests). No mocks of pyhgf internals were introduced.

## Next Phase Readiness

- **Phase 22 is complete.** All 4 plans (22-01 inspector, 22-02 roles, 22-03 schema+fixture, 22-04 tests) have shipped with SUMMARY.md.
- **Ready for Phase 23** (render_viewer_html) — inputs: `build_network_spec` + frozen `NetworkSpec`/`NodeSpec` schema (Plan 22-03); `data/viz_fixtures/patrl_3level_prefit.json` Medium-tier fixture (Plan 22-03); comprehensive test coverage (Plan 22-04).
- **Ready for Phase 24** (POST-01 posterior extraction) — `test_r_hat_not_suppressed_on_nuts_idata` asserts the empty-tuple presence signal that Phase 24 replaces with actual `az.summary` output per parameter.
- No blockers. No concerns carried forward.

---
*Phase: 22-inspector-roles-schema-scaffold*
*Completed: 2026-04-24*
