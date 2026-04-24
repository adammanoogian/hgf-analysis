# Phase 22: Inspector + Roles + Schema Scaffold - Context

**Gathered:** 2026-04-24
**Status:** Ready for planning

<domain>
## Phase Boundary

Deliver the `src/prl_hgf/viz/` Python scaffold that reads pyhgf `Network` internals, assigns `(level, role, branch_idx)` per node via adjacency-structure BFS, and emits a typed `NetworkSpec` frozen dataclass optionally enriched with ArviZ posterior summaries. Produces a runtime-verified first-pass update to the handoff doc so follow-up Claude Code sessions have correct pyhgf attribute paths.

**Files shipped this phase:**
- `src/prl_hgf/viz/__init__.py`
- `src/prl_hgf/viz/inspector.py`
- `src/prl_hgf/viz/roles.py`
- `src/prl_hgf/viz/schema.py`
- `data/viz_fixtures/patrl_3level_prefit.json` (example config)
- `tests/test_viz_inspector.py`
- `tests/test_viz_roles.py`
- `tests/test_viz_schema.py`
- First-pass update to `docs/HANDOFF_pyhgf_plot_network_extension.md`

**NOT in this phase:** rendering, SVG, HTML template work, `export.py`, posterior visual overlay, template promotion. All phase 23/24.

**Parallel-stack invariant:** `git diff --stat src/prl_hgf/env/ src/prl_hgf/models/ src/prl_hgf/fitting/ src/prl_hgf/analysis/ src/prl_hgf/gui/ src/prl_hgf/power/ src/prl_hgf/simulation/` must show zero lines changed at phase close.

</domain>

<decisions>
## Implementation Decisions

### JSON example config scope (SCHEMA-05)

- **Tier: Medium.** `data/viz_fixtures/patrl_3level_prefit.json` includes:
  - Full topology: node indices, node_type strings, edges with `value_parents` / `volatility_parents`, `input_idxs`
  - Node visual hints: shape (hexagon / circle / diamond / square), level band (L3/L2/L1/response), role
  - Parameter symbols (ω₂, ω₃, κ, β, ζ, b, μ₃⁰) per relevant node
  - Prior mean AND prior sd per parameter (pulled from `configs/pat_rl.yaml` fitting block)
- **NOT in the fixture (deferred to v1.4 polish):** phenotype definitions block, per-parameter descriptive sentences, response-model equation text
- Rationale: medium tier is enough to validate schema round-trip and pre-fit rendering without dragging phenotype presets (D-05) into the scaffold phase
- The fixture doubles as the schema.py round-trip test input and the Phase 23 pre-fit rendering input

### REPL verification artifact location (VIZ-03)

- **Inline only.** REPL findings live as a single module-level comment at the very top of `src/prl_hgf/viz/inspector.py`
- Format: each verified attribute path on its own line, annotated with the pyhgf version the verification was performed against
- Example skeleton:
  ```python
  # pyhgf API verification — 2026-04-24 against pyhgf X.Y.Z (run locally in ds_env)
  # network.attributes[idx] -> dict[str, Any]
  # network.edges[idx] -> AdjacencyLists(node_type, value_parents, volatility_parents, ...)
  # network.input_idxs -> tuple[int, ...]
  # network.n_nodes -> int
  ```
- NO separate `REPL_VERIFICATION.md` under `.planning/phases/22-*/` and NO sibling doc under `docs/`
- Rationale: the comment travels with the code it informs; separate files go stale when pyhgf updates; a future Claude Code reader grepping `inspector.py` sees verification state immediately

### Unknown pyhgf node kind handling (VIZ-02)

- **Strict: `raise ValueError`** when the inspector encounters a `node_type` string outside the known set `{"binary-state", "continuous-state", "ef-state", "categorical-state", "dp-state"}`
- Error message must name the offending node index, the observed `node_type`, and the known-set so the user can update either their model or the inspector's known-set in one glance
- Rationale: v1.3 scaffold is intentionally scoped to pyhgf topologies the project already uses; "warn + unknown role" silently hides a version-drift failure (Pitfall P16); the strict error surfaces drift at inspection time rather than as a mysterious missing rendering in the browser
- If pyhgf ships a new node kind in a future release, the PR to support it touches ONLY `inspector.py` (one-line known-set edit) plus a new case in `roles.py`

### Schema forward-compatibility (SCHEMA-01)

- **Pure frozen dataclass.** `NetworkSpec` and `NodeSpec` are `@dataclass(frozen=True)` with explicit required fields
- NO `schema_version` field, NO `extra: dict[str, Any]` field
- Breaking changes to the schema require a PR and go through normal code review
- Rationale: v1.3 is a scaffold milestone — forward-compat scaffolding has negative ROI at this stage. A `schema_version` field invites readers to branch on it; an `extra` dict invites callers to stuff arbitrary payload in and defeat type safety. Both encourage sloppy evolution. When v1.5 actually needs schema evolution, we add a field deliberately in a PR with its own review.

### Claude's Discretion

- REPL session script (ephemeral; does not ship — only the resulting comment in `inspector.py` ships)
- Exact Python dataclass field names and types (within the schema contract from SCHEMA-01..04)
- BFS implementation details (iterative vs recursive, visited-set representation)
- Test helper utilities in `tests/test_viz_*.py` (pytest fixtures, parametrization)
- JSON key naming convention in the fixture (snake_case per project convention, but exact keys are Claude's choice)
- Error messages for the unknown-node-kind `ValueError` (must satisfy the "name offending node + observed kind + known set" contract)

</decisions>

<specifics>
## Specific Ideas

- REPL session is performed against the actual pyhgf installed in `ds_env` (currently 0.2.10 per Decision 184; may differ from 0.2.8 pinned in `pyproject.toml`). The verification comment records whichever version was actually tested. If `ds_env` later updates pyhgf, a follow-up REPL re-run is needed before the next viz-touching PR.
- The 3-node count for PAT-RL 3-level and 7-node count for pick_best_cue 3-level (shared volatility parent node 6 deduplicated) are the canary assertions in `tests/test_viz_inspector.py` — these numbers come directly from SUMMARY.md's runtime-verified findings.
- Prior means/sds for the JSON fixture come from the actual `configs/pat_rl.yaml` file; any drift from that YAML is a test failure.
- `NetworkSpec` field names should match the patrl_hgf_model.html React state shape where possible so Phase 23's regex injection is a straight dump into `<script type="application/json" id="viz-network-spec">` without translation.

</specifics>

<deferred>
## Deferred Ideas

- **Phenotype preset highlighting** (D-05 from FEATURES.md) — deferred to v1.4. Would require phenotype block in JSON fixture (rejected in decision 1) plus UI button rendering in template (Phase 23+). The JSON fixture deliberately omits phenotype definitions to avoid half-specifying this feature.
- **Per-parameter descriptive sentences** — useful for click-to-inspect sidebar (D-06) which is deferred to v1.4. Parameter symbols + prior mean/sd are sufficient for the scaffold.
- **Schema version field / extra dict** — locked out of v1.3. When schema evolution actually becomes a need (plausibly v1.5 if the viewer goes multi-task), revisit.
- **pyhgf 0.2.8 vs 0.2.10 shim** — if REPL verification reveals structural drift between the two versions (e.g., `AdjacencyLists` field rename), the decision point is: pin `pyhgf` in `pyproject.toml` to match `ds_env`, or add a version-guard in `inspector.py`. Defer this decision to Phase 22 Task 1 (REPL) — the inspector MAY need a version shim but we won't design it speculatively.
- **ShinyStan-style tabbed diagnostic dashboard** — anti-feature AF-02; user has not requested; surface in deferred section as a reminder this is OUT of scope.

</deferred>

---

*Phase: 22-inspector-roles-schema-scaffold*
*Context gathered: 2026-04-24*
