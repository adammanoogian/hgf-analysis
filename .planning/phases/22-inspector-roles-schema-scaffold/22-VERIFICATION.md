---
phase: 22-inspector-roles-schema-scaffold
verified: 2026-04-24T00:00:00Z
status: passed
score: 10/10 must-haves verified
---

# Phase 22: Inspector + Roles + Schema Scaffold Verification Report

Phase Goal: The viz/ module foundation exists - pyhgf attribute paths are runtime-verified, the inspector extracts topology into a plain dict, roles are inferred from adjacency structure, and a typed NetworkSpec dataclass with optional ArviZ posterior attachment is ready for the export phase.

Verified: 2026-04-24
Status: passed
Re-verification: No - initial verification

## Goal Achievement

### Observable Truths

| # | Truth | Status | Evidence |
|---|-------|--------|----------|
| 1 | REPL-verified pyhgf attribute paths land before production code | VERIFIED | Commit 1a7db18 (REPL-verify) precedes e1a4ec9 (production BFS); module docstring names pyhgf 0.2.8 and all four attribute paths |
| 2 | Inspector emits deduplicated BFS topology | VERIFIED | inspect_network(build_3level_network_patrl()) returns 3 nodes; inspect_network(build_3level_network()) returns 7 nodes (shared parent node 6 deduplicated, not 9) |
| 3 | Role inference is adjacency-only with P16 guard | VERIFIED | Node 6 role=volatility via adjacency scan; node 0 role=input; value fallback works for interior nodes 1/3/5; grep -c node_parameters src/prl_hgf/viz/roles.py returns 0 |
| 4 | build_network_spec returns frozen NetworkSpec with dual-coord/Laplace probing | VERIFIED | NetworkSpec is frozen; _get_participant_dim probes set(idata.posterior.dims); _is_laplace uses membership check on sample_stats.data_vars; r_hat=None for all nodes under Laplace idata |
| 5 | HANDOFF doc reflects resolved REPL verifications | VERIFIED | 0 Key questions to resolve, 6 Verified 2026-04-24 against pyhgf, 1 Resolved Questions |
| 6 | Parallel-stack invariant preserved | VERIFIED | git diff --stat 6a88b5b HEAD on parallel-stack dirs returns 0 lines changed (the uncommitted hierarchical_patrl.py edit is unstaged, not part of Phase 22 commits) |
| 7 | Test suite passes | VERIFIED | 32/32 tests pass (10 inspector + 9 roles + 13 schema) in 6.93s |
| 8 | Public API probe succeeds | VERIFIED | from prl_hgf.viz import inspect_network, build_network_spec, NetworkSpec, NodeSpec exits 0 |
| 9 | Fixture is pre-fit-clean | VERIFIED | patrl_3level_prefit.json parses, n_nodes=3, task=pat_rl, 0 phenotype refs, 0 zeta refs |
| 10 | ruff + mypy clean | VERIFIED | ruff: All checks passed on src/prl_hgf/viz/ plus three test files; mypy: Success: no issues found in 7 source files |

Score: 10/10 truths verified

### Required Artifacts

| Artifact | Expected | Status | Details |
|----------|----------|--------|---------|
| src/prl_hgf/viz/__init__.py | Public API re-exports | VERIFIED | Exports inspect_network, build_network_spec, NetworkSpec, NodeSpec; no render_viewer_html (correctly deferred to Phase 23) |
| src/prl_hgf/viz/inspector.py | REPL verification + BFS dedup | VERIFIED | 193 lines; module docstring lists pyhgf 0.2.8 attribute paths; BFS with set[int] visited guard; emits dict with n_nodes/input_idxs/nodes; raises ValueError on unknown node_type |
| src/prl_hgf/viz/roles.py | Adjacency-only role inference | VERIFIED | 140 lines; infer_role precedence input then volatility then value; no node_parameters references (P16 guard); assign_levels_and_branches BFS helper |
| src/prl_hgf/viz/schema.py | Frozen NetworkSpec + ArviZ probing | VERIFIED | 291 lines; NodeSpec + NetworkSpec are frozen dataclasses; build_network_spec composes inspector + role + optional idata; __post_init__ validates kind/role enums and idx uniqueness |
| data/viz_fixtures/patrl_3level_prefit.json | Medium-tier PAT-RL pre-fit fixture | VERIFIED | Valid JSON, n_nodes=3, 1 input node, 2 continuous-state parents, parameters block has omega_2/omega_3/kappa/beta/mu3_0/b (no zeta) |
| tests/test_viz_inspector.py | Inspector unit tests | VERIFIED | 10 tests pass |
| tests/test_viz_roles.py | Role inference tests | VERIFIED | 9 tests pass |
| tests/test_viz_schema.py | NetworkSpec round-trip + idata tests | VERIFIED | 13 tests pass |
| docs/HANDOFF_pyhgf_plot_network_extension.md | Resolved-questions doc | VERIFIED | 0 Key questions, 6 Verified 2026-04-24, 1 Resolved Questions section |

### Key Link Verification

| From | To | Via | Status | Details |
|------|----|-----|--------|---------|
| schema.py | inspector.py | Import of inspect_network, _NODE_TYPE_INT_TO_STR, _VERIFIED_AGAINST_PYHGF_VERSION | WIRED | Imports confirmed; build_network_spec calls inspect_network(network) at line 242 |
| schema.py | roles.py | from prl_hgf.viz.roles import infer_role | WIRED | Called per-node at line 250 |
| __init__.py | submodules | Package re-exports | WIRED | All four public names imported and in __all__ |
| build_network_spec | _get_participant_dim | Dynamic coord probing | WIRED | Line 243-245 detected_coord = coord_name if coord_name is not None else _get_participant_dim(idata) |
| build_network_spec | _is_laplace | Laplace suppression | WIRED | Line 246 plus line 260-262 conditional r_hat = None if (idata is None or laplace) else () |
| Inspector BFS | Shared-parent dedup | visited set[int] | WIRED | Node 6 emitted once (Pitfall P3 guard), branch_of[6] is None when contested across branches |

### Requirements Coverage

| Requirement | Status | Notes |
|-------------|--------|-------|
| VIZ-01 REPL verification lands first | SATISFIED | Commit 1a7db18 precedes e1a4ec9 |
| VIZ-02 inspector plain-dict extraction | SATISFIED | inspect_network returns dict with keys n_nodes/input_idxs/nodes |
| VIZ-03 shared volatility parent dedup | SATISFIED | pick_best_cue 7 nodes not 9 |
| VIZ-04 adjacency-only role inference | SATISFIED | infer_role scans other.volatility_parents only |
| VIZ-05 level + branch BFS helpers | SATISFIED | assign_levels_and_branches returns (levels, branches, order) |
| SCHEMA-01 frozen dataclasses | SATISFIED | frozen=True on both types |
| SCHEMA-02 no schema version or extra dict | SATISFIED | test_no_schema_version_or_extra_field PASSED |
| SCHEMA-03 dual coord-name probing | SATISFIED | Probes set(idata.posterior.dims) for both names |
| SCHEMA-04 Laplace r_hat suppression | SATISFIED | test_r_hat_suppressed_on_laplace_idata PASSED; membership check not equality |
| SCHEMA-05 asdict JSON round-trip | SATISFIED | test_asdict_json_round_trip PASSED |
| DOC-01 HANDOFF annotated | SATISFIED | 6 Verified 2026-04-24 annotations, Resolved Questions replaces Key questions |
| TEST-01 inspector canary counts | SATISFIED | test_patrl_3level_emits_three_nodes + test_pick_best_cue_3level_dedup PASSED |
| TEST-02 role adjacency-only | SATISFIED | test_roles_does_not_read_node_parameters PASSED |
| TEST-03 schema round-trip + Laplace | SATISFIED | All 13 schema tests PASSED |

### Anti-Patterns Found

None. The viz module files are substantive (140-291 lines), no TODO / FIXME / placeholder strings, no empty-return stubs, all helpers are wired into build_network_spec.

### Human Verification Required

None required for this scaffold phase - all behaviour is verifiable via unit tests + live REPL probes, which were run successfully.

### Gaps Summary

No gaps. Every criterion enumerated in the phase prompt is satisfied by code in the tree. The Phase 22 deliverable (typed NetworkSpec foundation with REPL-verified pyhgf attribute paths, adjacency-only role inference, dual-coord-name + Laplace-aware ArviZ probing, and a pre-fit fixture for the Phase 23 exporter) is complete and ready to consume from Phase 23 (render_viewer_html template promotion).

Note (not a gap): src/prl_hgf/fitting/hierarchical_patrl.py has an unstaged working-tree edit carried over from Phase 20 work. The diff against Phase 22 start commit (6a88b5b) for all parallel-stack directories is 0 lines, i.e. no Phase 22 commit touched the fitting / env / models / analysis / gui / power / simulation stacks. The parallel-stack invariant holds.

---

Verified: 2026-04-24
Verifier: Claude (gsd-verifier)
