---
phase: 22-inspector-roles-schema-scaffold
plan: 01
subsystem: visualization
tags: [pyhgf, viz, inspector, bfs, network-api, repl-verify, scaffold]

# Dependency graph
requires:
  - phase: 18-pat-rl-task-adaptation
    provides: build_3level_network_patrl, build_2level_network_patrl fixture sources
  - phase: models (pick_best_cue)
    provides: build_3level_network fixture source
provides:
  - src/prl_hgf/viz/inspector.py::inspect_network function (BFS-based pyhgf Network -> plain dict extractor)
  - src/prl_hgf/viz/ package with empty/minimal __init__.py exporting inspect_network
  - REPL-verified int->string mapping for pyhgf AdjacencyLists.node_type (0..6)
  - First-pass update to docs/HANDOFF_pyhgf_plot_network_extension.md resolving 5 open questions
affects:
  - 22-02 (roles.py), 22-03 (schema.py + NetworkSpec + build_network_spec), 22-04 (tests), 23 (render_viewer_html), 24 (posterior visual overlay)

# Tech tracking
tech-stack:
  added: []  # no new deps, scaffold phase
  patterns:
    - "REPL-first invariant (P1): REPL verification comment committed separately BEFORE production code (verifiable via git log --follow two-commit ordering)"
    - "Parallel-stack invariant (VIZ-02): zero imports from prl_hgf.* in viz production code; pyhgf duck-typed via Any"
    - "BFS two-pass dedup: Pass 1 resolves contested branch_of via propagation; Pass 2 emits rows in discovery order"

key-files:
  created:
    - src/prl_hgf/viz/__init__.py
    - src/prl_hgf/viz/inspector.py
    - docs/HANDOFF_pyhgf_plot_network_extension.md (first tracked version; was untracked at plan start)
    - .planning/phases/22-inspector-roles-schema-scaffold/22-01-SUMMARY.md
  modified: []

key-decisions:
  - "pyhgf AdjacencyLists.node_type is an INTEGER (0-6), not a string -- CONTEXT Decision 3 wording corrected via RESEARCH findings and REPL confirmation"
  - "ds_env has pyhgf 0.2.8 pinned (NOT 0.2.10 as RESEARCH doc assumed); all handoff/inspector version strings say 0.2.8"
  - "Two-pass BFS: Pass 1 resolves contested branch_of via parent-from-current_branch propagation; Pass 2 emits rows (avoids enqueue-order race where first-sight branch gets baked in before contesting branch arrives)"
  - "__init__.py only exports inspect_network in Phase 22 plan 22-01; NetworkSpec/NodeSpec/build_network_spec deferred to plan 22-03; render_viewer_html to Phase 23"
  - "_as_float_or_none helper coerces pyhgf attribute values to float | None, skipping non-numeric (None/arrays/etc.) gracefully"

patterns-established:
  - "REPL-first two-commit ordering: the verification comment lands as its own atomic commit BEFORE production code; git log --follow reveals the ordering"
  - "Node-type strict-int guard: unknown codes raise ValueError with idx + observed int + sorted known-set; message is single-line and greppable"
  - "Shared-parent dedup marker: branch_idx=None is the 'reached from >1 input branch' sentinel; emitted unchanged in per-node dict"

# Metrics
duration: ~35min
completed: 2026-04-24
---

# Phase 22 Plan 01: Inspector REPL-Verify + BFS Dedup Summary

**pyhgf Network -> plain dict extractor shipped with REPL-verified attribute paths (pyhgf 0.2.8), BFS shared-parent dedup, and first-pass handoff-doc update resolving 5 open questions**

## Performance

- **Duration:** ~35 min
- **Started:** 2026-04-24T17:40:00Z (approx; reinstall + REPL session included)
- **Completed:** 2026-04-24T18:15:20Z
- **Tasks:** 3
- **Files modified:** 3 (all new: inspector.py, viz/__init__.py, HANDOFF_pyhgf_plot_network_extension.md first tracked commit)

## Accomplishments

- **REPL-verified pyhgf 0.2.8 Network API** against ds_env install (pyhgf 0.2.8, NOT 0.2.10 as the research doc assumed). Confirmed AdjacencyLists.node_type is int, attributes are plain dicts, input_idxs/n_nodes are plain Python types.
- **inspect_network() ships with BFS dedup**: build_3level_network_patrl() -> 3 nodes; build_3level_network() -> 7 nodes with shared volatility parent (node 6) emitted exactly once with branch_idx=None.
- **Strict ValueError on unknown node_type int**: message names offending idx, observed int code, and sorted known-codes set.
- **Handoff doc resolves all 5 open questions** with "Verified 2026-04-24 against pyhgf 0.2.8" annotations; hypothetical extended API block annotated as superseded but retained.
- **Parallel-stack invariant holds**: zero lines changed under env/, models/, fitting/, analysis/, gui/, power/, simulation/ (confirmed vs phase-start commit 6a88b5b).
- **ruff + mypy clean** on src/prl_hgf/viz/.

## Task Commits

Each task committed atomically with the P1 REPL-first invariant verifiable via `git log --follow --oneline src/prl_hgf/viz/inspector.py`:

1. **Task 1: REPL verification session + inspector.py top-comment** - `1a7db18` (feat)
   - Shipped: REPL verification comment block + `_VERIFIED_AGAINST_PYHGF_VERSION = "0.2.8"` + `_NODE_TYPE_INT_TO_STR` mapping constant
   - Zero `def` statements in this commit
2. **Task 2: inspect_network() BFS with shared-parent dedup** - `e1a4ec9` (feat)
   - Shipped: `inspect_network()` + `_as_float_or_none()` helper + __init__.py export wiring
   - Two-pass BFS with contested-branch propagation
3. **Task 3: first-pass update to HANDOFF doc** - `9107b8f` (docs)
   - Replaced "Key questions to resolve" section with "Resolved Questions (Verified 2026-04-24 against pyhgf 0.2.8)"
   - Annotated hypothetical API block as superseded 2026-04-24

## Files Created/Modified

- `src/prl_hgf/viz/__init__.py` - Package marker; partial public API (inspect_network only); docstring flags NetworkSpec/NodeSpec/build_network_spec deferred to plan 22-03 and render_viewer_html to Phase 23
- `src/prl_hgf/viz/inspector.py` - REPL-verified pyhgf Network -> plain dict extractor. Top-level docstring captures verified attribute paths, int->string mapping, and observed fixture node counts. `inspect_network()` implements BFS with int-keyed visited set. `_as_float_or_none()` coerces pyhgf attribute values.
- `docs/HANDOFF_pyhgf_plot_network_extension.md` - First-pass update: 5 open questions answered with "Verified 2026-04-24 against pyhgf 0.2.8" blocks; hypothetical API annotated as superseded.
- `.planning/phases/22-inspector-roles-schema-scaffold/22-01-SUMMARY.md` - This file.

## Decisions Made

1. **pyhgf version string is "0.2.8" not "0.2.10"**: The RESEARCH doc asserted ds_env has pyhgf 0.2.10 (per Decision 184 in STATE.md which also claims 0.2.10). Direct REPL session against the actual ds_env shows `pyhgf.__version__ == "0.2.8"` -- matching `pyproject.toml` pin. All inspector.py and handoff-doc annotations use "0.2.8" for internal consistency. This may warrant a STATE.md Decision 184 correction, but that is a scope change beyond this plan.
2. **Two-pass BFS pattern**: The naive one-pass approach (set branch_of on first parent visit, skip if already visited) fails the shared-parent dedup test because the first-discovery branch gets baked in before contesting branches arrive. Solution: Pass 1 walks the queue with contested-promotion semantics (branch_of[parent] <- None when a second branch arrives); Pass 2 emits rows in Pass-1 discovery order with the resolved branch_of values.
3. **_as_float_or_none defensive coercion**: pyhgf attrs store values as JAX arrays in some cases; plain `attrs.get(...)` would leak array types into the NodeSpec dict. The helper coerces via `float()` and returns None on TypeError/ValueError.
4. **Package __init__.py only exports inspect_network**: RESEARCH suggests exporting NetworkSpec/NodeSpec/build_network_spec too, but those land in plan 22-03. Exporting unimported names would raise ImportError; partial export is correct.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] Reinstalled prl_hgf editable install at correct path**

- **Found during:** Task 1 REPL session setup
- **Issue:** `pip show prl-hgf` showed editable install pointing at `C:\Users\aman0087\Documents\Github\psilocybin_prl_analyses` (pre-rename location); `import prl_hgf` failed with `ModuleNotFoundError`. This matches the existing STATE.md blocker for Phase 14.1-03 cluster job 54934145 which hit the same issue on M3.
- **Fix:** Ran `pip install -e .` from the correct repo root (`hgf-analysis`). pyproject.toml package name is `hgf-analysis` (not `prl-hgf`); installed version is now 0.1.0 pointing at the correct src location.
- **Files modified:** None in repo (affects site-packages editable install only)
- **Verification:** `python -c "import prl_hgf; print(prl_hgf.__file__)"` returned the correct path under the repo.
- **Committed in:** N/A -- this is a site-packages/local-env fix; no repo file touched.

**2. [Discovery] pyhgf version mismatch between STATE.md Decision 184 and ds_env reality**

- **Found during:** Task 1 REPL session
- **Issue:** STATE.md Decision 184 claims "pyhgf 0.2.10 installed locally"; RESEARCH doc echoed this. REPL reports `pyhgf.__version__ == "0.2.8"`.
- **Fix:** Used the actual runtime version (0.2.8) in all `_VERIFIED_AGAINST_PYHGF_VERSION` strings and handoff-doc annotations. Flagged in this SUMMARY for STATE.md Accumulated Context review.
- **Files modified:** None directly -- but STATE.md Decision 184 may need a correction in a future quick-NNN task.
- **Verification:** Commit messages for all three tasks explicitly call out "pyhgf 0.2.8".
- **Committed in:** Task 1 (1a7db18), Task 2 (e1a4ec9), Task 3 (9107b8f)

---

**Total deviations:** 2 (1 Rule 3 blocking fix, 1 discovery with no code impact)
**Impact on plan:** Both deviations pre-existing at plan start; neither introduces scope creep. Node count invariants, strict-int guard, REPL-first ordering, and parallel-stack invariant all hold as plan intended.

## Issues Encountered

1. **First BFS implementation failed the shared-parent test**: Initial one-pass implementation assigned branch_idx=0 to node 6 (in pick_best_cue 3-level) because the BFS discovered it via branch 0 (node 1 -> node 6) before nodes 3 and 5 got their turn. The `if parent_idx in visited: continue` guard skipped re-processing, so the contesting branches (1 and 2) never reached the branch_of update code. Diagnostic: printed branch_idx per node, saw node 6's branch=0 instead of None. Fix: refactored to two-pass structure (Pass 1 resolves branch_of with contested-promotion; Pass 2 emits). Added covering sanity check in verification script.

2. **pyhgf 0.2.8 has node_type=2 for the shared volatility parent (node 6), not node_type=6 (volatile-state)**: Discovered during REPL session. pick_best_cue 3-level uses `continuous-state` (2) for the volatility-level node, NOT `volatile-state` (6). This is consistent with pyhgf's convention: the "volatile" meaning is encoded in the edge topology (being someone's volatility_parent), not the node_type code. The inspector correctly treats it as continuous-state and relies on BFS/role logic (Phase 22 plan 22-02) for the volatility role classification.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness

### What's ready for plan 22-02 (roles.py)

- `inspect_network()` emits per-node dicts with `value_parents`, `volatility_parents`, `value_children`, `volatility_children` all populated as tuples. Role inference in plan 22-02 can read directly from the per-node dict OR re-walk `network.edges` -- both are cheap for <10 nodes.
- Shared-parent sentinel `branch_idx=None` already computed, so roles.py doesn't need to re-derive it.
- `level_of` captured in BFS (stored in each node's `level` field) gives first-discovery depth (1 for input, 2 for belief, 3 for volatility) which is exactly what the publication figure expects.

### What's ready for plan 22-03 (schema.py + NetworkSpec)

- The per-node dict shape in inspect_network() pre-matches the expected NodeSpec frozen dataclass field names (idx, kind, level, branch_idx, value_parents, volatility_parents, value_children, volatility_children, tonic_volatility, mean, precision). Plan 22-03 can wrap with @dataclass(frozen=True) without renaming.
- `_VERIFIED_AGAINST_PYHGF_VERSION` constant exists and can be propagated to `NetworkSpec.source_pyhgf_version`.

### Concerns / Blockers

- **STATE.md Decision 184 wording**: claims "pyhgf 0.2.10 installed locally". Runtime REPL shows 0.2.8. If Decision 184's HLO/graph-structure invariants rely on 0.2.10 behaviour, there may be silent drift -- but research suggests nested @jit decorator pattern is unchanged 0.2.8 <-> 0.2.10. Defer follow-up to a quick-NNN if it becomes load-bearing.
- **Editable install was stale at plan start** (pointing at old `psilocybin_prl_analyses` path). Any prior Python session in this ds_env since the repo rename would have silently used old code. Not a plan-22-01 concern but worth flagging for next ds_env user.

---
*Phase: 22-inspector-roles-schema-scaffold*
*Plan: 01*
*Completed: 2026-04-24*
