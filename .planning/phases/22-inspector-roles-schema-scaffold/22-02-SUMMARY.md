---
phase: 22-inspector-roles-schema-scaffold
plan: 02
subsystem: viz
tags: [pyhgf, network, adjacency, bfs, roles, viz-scaffold]

requires:
  - phase: 22-inspector-roles-schema-scaffold
    provides: inspect_network BFS traversal with shared-parent dedup (plan 22-01)
provides:
  - infer_role() adjacency-only role classifier (input / volatility / value)
  - assign_levels_and_branches() BFS helper returning (levels, branches, order)
  - set[int] dedup for shared volatility parents (pick_best_cue node 6 -> branch_idx=None)
affects:
  - 22-03 (schema.py: NetworkSpec/NodeSpec built from these helpers)
  - 22-04 (unit tests exercise infer_role + assign_levels_and_branches on synthetic edges)
  - phase 23 (renderer consumes NetworkSpec whose role/level/branch fields came from here)

tech-stack:
  added: []
  patterns:
    - "Adjacency-only role inference (no per-node attribute dict reads -- P16 guard)"
    - "Duck-typed edges via typing.Any -- keeps module testable without pyhgf import"
    - "Two-pass BFS: pass 1 visits + contested-branch promotion; emission order preserved via list"

key-files:
  created:
    - src/prl_hgf/viz/roles.py
  modified: []

key-decisions:
  - "infer_role uses 'idx in other.volatility_parents' structural scan, never reads tonic_volatility attribute (P16)"
  - "assign_levels_and_branches uses set[int] visited + dict[int, int|None] branches; contested revisit from different branch promotes to None (shared sentinel)"
  - "Not exported from src/prl_hgf/viz/__init__.py in this plan -- 22-03 decides public API surface"
  - "Duck-type edges via Any (no prl_hgf.* / pyhgf.* imports); keeps module unit-testable with synthetic edge NamedTuples in 22-04"

patterns-established:
  - "Adjacency-only role inference: check 'idx in other.volatility_parents' across all edges; 'value' is the fallback"
  - "Contested-branch detection via dict[int, int|None]: sentinel None for shared/multi-branch nodes"
  - "Plans defer public API decisions -- helpers land internal first, __init__.py lines up at the final plan"

duration: 5 min
completed: 2026-04-24
---

# Phase 22 Plan 02: roles.py Adjacency-Only Role Inference + BFS Helpers Summary

**Adjacency-only `infer_role()` + `assign_levels_and_branches()` BFS with set[int] dedup -- pick_best_cue node 6 resolves as role='volatility', branch_idx=None, level=3.**

## Performance

- **Duration:** 5 min
- **Started:** 2026-04-24T18:21:47Z
- **Completed:** 2026-04-24T18:27:12Z
- **Tasks:** 1
- **Files modified:** 1 (created)

## Accomplishments

- `src/prl_hgf/viz/roles.py` created (139 lines, 2 public helpers).
- `infer_role(idx, edges, input_idxs)` classifies nodes using adjacency structure only -- never reads per-node attribute dict keys (P16 guard).
- `assign_levels_and_branches(edges, input_idxs)` BFS traversal returns `(levels, branches, order)` tuple; shared volatility parents (e.g. pick_best_cue node 6, reachable from branches 0/1/2) are emitted once with `branches[idx] is None`.
- Zero `prl_hgf.*` / `pyhgf.*` imports -- edges duck-typed via `typing.Any` so the module is unit-testable with synthetic `AdjacencyLists` NamedTuples in plan 22-04.
- All three canary checks pass; ruff + ruff-format + mypy clean; parallel-stack invariant preserved.

## Task Commits

1. **Task 1: roles.py -- adjacency-only role inference + BFS level/branch helpers** -- `a4ac313` (feat)

## Files Created/Modified

- `src/prl_hgf/viz/roles.py` (new, 139 lines) -- `infer_role()` + `assign_levels_and_branches()` public helpers. Stdlib imports only (`collections.deque`, `typing.Any`).

## Canary Outputs

**Canary 1 (pick_best_cue 3-level `infer_role`):**
```
node 6 role = volatility
node 0 role = input
node 1 role = value
```

**Canary 2 (pick_best_cue 3-level `assign_levels_and_branches`):**
```
levels = {0: 1, 2: 1, 4: 1, 1: 2, 3: 2, 5: 2, 6: 3}
branches = {0: 0, 2: 1, 4: 2, 1: 0, 3: 1, 5: 2, 6: None}
order = [0, 2, 4, 1, 3, 5, 6]
len(order) = 7
branches[6] = None
```

**Canary 3 (PAT-RL 3-level):**
```
levels = {0: 1, 1: 2, 2: 3}
branches = {0: 0, 1: 0, 2: 0}
order = [0, 1, 2]
last node role = volatility
```

## Verification Status

| Check | Result |
|-------|--------|
| `python -c "from prl_hgf.viz.roles import infer_role, assign_levels_and_branches"` | OK |
| pick_best_cue node 6 -> role='volatility', branch_idx=None, level=3 | OK |
| PAT-RL 3-level 3-node traversal | OK |
| `grep -c 'node_parameters' src/prl_hgf/viz/roles.py` | 0 (P16 guard) |
| `grep -E '^from prl_hgf\|^import prl_hgf' src/prl_hgf/viz/roles.py` | no matches |
| `ruff check src/prl_hgf/viz/roles.py` | All checks passed |
| `ruff format --check src/prl_hgf/viz/roles.py` | 1 file already formatted |
| `mypy src/prl_hgf/viz/roles.py` | Success: no issues found |
| Parallel-stack invariant (env/models/fitting/analysis/gui/power/simulation unchanged in this plan) | 0 new lines changed |

## Decisions Made

- **D1 (Docstring phrasing to satisfy P16 grep guard):** The plan example docstring referenced `node_parameters` dict twice in explanatory text. The plan's verify criterion `grep -c "node_parameters" roles.py == 0` is strict structural. Rewrote the two docstring occurrences as "per-node attribute dict" -- preserves the P16 guidance, satisfies the grep check, and keeps the Pitfall P16 reference link. Verify: `grep -c 'node_parameters' src/prl_hgf/viz/roles.py` returns 0.
- **D2 (Two-pass vs recursive):** Implemented the explicit plan design -- BFS via `deque[(idx, level, branch)]` tuples + "already visited -> contested promotion" branch. The inspector.py's two-pass BFS (plan 22-01) does the same logic structurally but uses `branch_of` dict + separate `parents` loop; the single-pass tuple-queue in roles.py is isomorphic and matches the plan example verbatim.
- **D3 (No __init__.py export):** Per plan spec -- roles.py is a schema.py + tests-only internal. Public API surface of viz/ is decided at plan 22-03.

## Deviations from Plan

None -- plan executed exactly as written, except for the D1 docstring rephrasing above, which was necessary to satisfy the plan's own `grep -c 0` verify criterion that conflicted with the plan's example docstring text (strictly-documentation change; zero behavioural impact; P16 guard semantics preserved verbatim by substitution "per-node attribute dict").

## Issues Encountered

- **grep -c check vs example docstring conflict:** Plan task-1 example docstring contained `node_parameters` as explanatory text in two places, but the plan's verify criterion demanded `grep -c "node_parameters" == 0`. Resolved by rewriting the docstring text to "per-node attribute dict" (D1). No code change; the P16 structural guarantee (roles are adjacency-only) was never at risk.
- **Pre-existing uncommitted modifications to `src/prl_hgf/fitting/hierarchical_patrl.py`** (from prior Phase 20 work) surfaced in the parallel-stack invariant check. These are unrelated to this plan; `git diff` vs HEAD pre-existed at session start. Staging was explicit (`git add src/prl_hgf/viz/roles.py` only) so the commit is clean.

## User Setup Required

None -- no external service configuration required.

## Next Phase Readiness

- **Ready for 22-03** (schema.py): `NetworkSpec` / `NodeSpec` frozen dataclasses will `from prl_hgf.viz.roles import infer_role, assign_levels_and_branches` directly. Plan 22-03 will also decide the final public `__init__.py` surface.
- **Ready for 22-04** (unit tests): synthetic `AdjacencyLists` NamedTuples can exercise both helpers independently without building full pyhgf networks.
- **No blockers.**
- **Invariants preserved:** P16 adjacency-only (grep_c = 0); zero prl_hgf.* imports (0 matches); set[int] dedup (verified via pick_best_cue node 6 -> branch=None).

---
*Phase: 22-inspector-roles-schema-scaffold*
*Completed: 2026-04-24*
