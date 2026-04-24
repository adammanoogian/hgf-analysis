# Project Research Summary

**Project:** hgf-analysis -- v1.3 Generic HGF Viewer (Scaffold + Handoff)
**Domain:** Config-driven HTML network viewer scaffold for pyhgf models
**Researched:** 2026-04-24
**Confidence:** HIGH (all four research files grounded in direct code inspection; stack APIs
verified at runtime in ds_env)

## Executive Summary

The v1.3 milestone adds a config-driven HTML viewer scaffold at `src/prl_hgf/viz/` that
translates a `pyhgf.model.Network` object into a self-contained HTML file showing topology,
node kinds, coupling structure, parameter names, and (optionally) posterior summaries. The
visual language -- hexagon for volatility nodes, circle for value parents, diamond for
binary inputs, square for parameters -- is already established in the seed template
`figures/patrl_hgf_model.html`. The scaffold replaces the hardcoded PAT-RL JSX in that
template with a JSON-injection path driven by a four-file Python module (inspector to roles
to schema to export). No new Python packages are required at runtime: Jinja2 is already
installed as a transitive dep, ArviZ and NumPy cover all posterior extraction needs, and
BeautifulSoup with the stdlib html.parser handles structural HTML testing. The only new
dev dependency is pytest-snapshot for regression testing of the emitted HTML.

The three most important scope constraints are: (1) Scope C only -- no publication SVG
polish, no posterior violin plots, no interactive parameter sliders; those are v1.4
concerns. (2) The template source is `figures/patrl_hgf_model.html` promoted to a generic
form, not a ground-up rewrite. (3) The `viz/` module is a pure reader -- it imports from
pyhgf and ArviZ but nothing in the existing `src/prl_hgf/` package imports from `viz/`,
preserving the parallel-stack invariant. The single highest-risk action in the whole
milestone is writing `inspector.py` from the handoff document hypothetical attribute paths
without first running a REPL session to verify them against pyhgf 0.2.10; that is Pitfall 1
and it must be the first task of Phase 22.

## Key Findings

### Recommended Stack

All runtime needs are met by packages already in ds_env. The four-file module needs:
`pyhgf.model.Network` (`.attributes[idx]`, `.edges[idx]`, `.input_idxs`, `.n_nodes`),
`arviz.summary()` plus `az.hdi()` for posterior extraction, numpy for JAX array coercion,
and Jinja2 `Environment(loader=BaseLoader())` for template injection. Self-contained HTML
output is achieved at export time by fetching CDN resources once with `urllib.request` and
embedding them inline -- no new dependency. Testing uses BeautifulSoup (already installed)
and pytest-snapshot (new dev dep, 0.9.0).

**Core technologies:**
- pyhgf 0.2.10 -- Network topology reader via `.attributes`, `.edges`, `.input_idxs`;
  `AdjacencyLists` NamedTuple API stable across 0.2.x
- jinja2 3.1.6 -- HTML template injection via `<script type="application/json">` slots;
  already a transitive dep of PyMC; make explicit in `[project.dependencies]`
- arviz 0.22.0 -- posterior extraction via `az.summary()` and `az.hdi()`; dual coord-name
  support (`"participant_id"` for Laplace, `"participant"` for NUTS) is caller-supplied
- beautifulsoup4 4.13.4 (dev) -- structural HTML assertion tests; html.parser (stdlib, no lxml)
- pytest-snapshot 0.9.0 (dev, new) -- HTML regression snapshots; add to dev extras
- React 18.2.0 / Babel 7.23.2 (CDN, template-pinned) -- do NOT upgrade to React 19;
  ReactDOM.createRoot() API is React 18

**Explicitly rejected:**
- svgwrite / cairosvg -- SVG stays hand-rolled in the template; Python SVG deferred to v1.4
- plotly / bokeh / altair -- large JS bundles incompatible with self-contained output
- lxml -- not in ds_env; html.parser is sufficient for all structural test needs
- React 19 -- breaks ReactDOM.createRoot() concurrent API in the existing template

### Expected Features

The viewer has two modes distinguished at render time: pre-fit (config only, no idata) and
post-fit (config plus idata). A single HTML artifact is produced per subject or session.

**Must have (table stakes -- all in scope for v1.3):**
- TS-01 to TS-04: Node-kind-distinct shapes, level bands, coupling edge styles, parameter labels
- TS-05: Prior means shown in pre-fit mode (from network.attributes)
- TS-06: 2-level vs 3-level graceful toggle -- no dead space when n_levels == 2
- TS-07: Response model section below separator line
- TS-08: Self-contained single HTML file with all CDN JS/CSS inlined at export time
- TS-09: JSON config schema -- Python produces JSON; HTML reads it from application/json script tag
- TS-10: Notation legend visible without clicking

**Should have (differentiators over pyhgf plot_network):**
- D-01: Config-driven inspector replacing hardcoded JSX topology
- D-02: Posterior overlay -- az.summary() values annotated on parameter nodes/edges
- D-03: R-hat coloring on parameter squares (suppressed for single-chain Laplace idata)
- D-04: Divergence badge when idata.sample_stats.diverging.sum() > 0 (NUTS path only)
- D-07: Fit-method badge (VB-LAPLACE / NUTS) derived from sample_stats.laplace

**Defer to v1.4:**
- D-05 Phenotype highlighting, D-06 click-to-inspect panel
- SVG / PNG / PDF export buttons (AF-08)
- Publication-quality hexagon geometry polish, Weber 2024 visual quality target

### Architecture Approach

The `viz/` package is a linear four-module pipeline with no cycles: inspector.py reads
pyhgf internals into a plain dict, roles.py walks that dict to assign (level, role,
branch_idx) to each node via BFS from input nodes upward, schema.py assembles the typed
NetworkSpec dataclass and optionally attaches ArviZ posterior summaries, and export.py
injects the serialised NetworkSpec JSON into `<script type="application/json">` slots in
the HTML template via Jinja2 and returns a complete HTML string. The caller constructs the
Network object (the viewer never calls model builders), passes it to inspect_network(), and
writes the returned HTML to disk. Public API: two functions re-exported from __init__.py:
`inspect_network` and `render_viewer_html`.

**Major components:**
1. viz/inspector.py -- translates pyhgf.model.Network to RawNetworkDict; zero prl_hgf
   imports; approx 60 lines; uses _safe_temp-style guards for all attribute access
2. viz/roles.py -- BFS from input_idxs upward assigning level + role + branch_idx;
   handles shared volatility parent (pick_best_cue node 6) by deduplication via dict
   keyed on node index
3. viz/schema.py -- @dataclass(frozen=True) NetworkSpec and NodeSpec; build_network_spec()
   accepts idata and coord_name as optional args; no config module imports
4. viz/export.py -- Jinja2 plus _inject_markers() helper; raises ValueError on missing
   marker; approx 80 lines flat (no sub-package split); handles CDN inlining via
   urllib.request
5. Template figures/hgf_viewer.html -- promoted from patrl_hgf_model.html; PAT-RL
   hardcoding replaced by data-driven injection slots; id="viz-network-spec" and
   id="viz-posterior-summary" added; React reads via document.getElementById
6. Tests tests/test_viz_inspector.py, test_viz_roles.py, test_viz_schema.py,
   test_viz_export.py -- flat convention (no tests/viz/ subdir); canary integration
   tests instantiate real Network objects

**Injection marker convention:** `<script type="application/json" id="viz-{name}">` is the
chosen convention. Compatible with Jinja2: Jinja2 renders the template slots at export time
replacing Jinja2 variables inside those blocks with serialised JSON; the React component
reads the tags at browser display time via document.getElementById. Jinja2 is not inside
JSX syntax. Use both.

### Critical Pitfalls

1. **Hypothesis-based coding of pyhgf internals (P1)** -- the handoff doc attribute paths
   are proposals, not verified facts. Phase 22 first task must be a REPL session that
   instantiates build_2level_network_patrl() and build_3level_network_patrl(), prints
   type(net.edges[0]) and net.attributes[0].keys(), and commits findings as a comment in
   inspector.py before any production code is written.

2. **Template PAT-RL hardcoding (P11)** -- figures/patrl_hgf_model.html contains 200+
   lines of PAT-RL-specific JSX (phenotype labels, INFO strings, C.dhr color, ANS framing).
   Phase 23 first task must grep for balanced, reward_blunted, Klaassen, bradycardia and
   classify each hit before any injection code is written.

3. **Shared volatility node duplication (P3)** -- naive graph traversal visits pick_best_cue
   node 6 three times, emitting 9 nodes instead of 7. Key the inspector accumulator on node
   index (dict, not list); add unit test asserting 7 nodes for the 3-level pick_best_cue model.

4. **Injection failure silent pass (P5)** -- re.sub() silently no-ops on a missing marker.
   Assert marker not in result_html after injection; raise ValueError with the marker name.

5. **ArviZ coord-name collision (P9)** -- Laplace path emits "participant_id", NUTS path
   emits "participant". Implement _get_participant_dim(idata) that probes
   idata.posterior.data_vars dynamically; unit test covers both variants.

6. **Node semantic mislabeling (P16)** -- role must be inferred from adjacency structure,
   not from node_parameters keys alone. Set role = "volatility" if the node appears in any
   edge volatility_parents; add assertion for node 6 in 3-level pick_best_cue.

## Implications for Roadmap

### Chosen Phase Ordering: STACK + PITFALLS (adjusted)

**Rejected orderings:**

- FEATURES ordering (22=inspector+schema+JSON example, 23=HTML template pre-fit,
  24=posterior overlay + self-contained export): concentrates too much technically-hard
  work in Phase 24, and the JSON fixture belongs in Phase 22 with the schema it validates.

- ARCHITECTURE ordering (22=inspector+roles, 23=schema, 24=export+template): leaves the
  template untouched until Phase 24, meaning no rendered output exists until the last phase.
  Template audit, export, CDN inlining, and posterior overlay all pile into Phase 24.

**Chosen: STACK + PITFALLS ordering** (22=scaffold, 23=export+template, 24=posterior+docs),
with the four tension resolutions described in the Resolved Conflicts section below.

---

### Phase 22: Inspector + Roles + Schema Scaffold

**Rationale:** The linear DAG (inspector to roles to schema to export) makes these three
the natural prerequisite for everything else. Inspector and roles have zero prl_hgf imports
and can be written and tested against synthetic Network-like dicts. Schema adds the ArviZ
integration and typed NetworkSpec dataclass. JSON fixture produced here validates the schema
immediately. First task is mandatory REPL verification.

**Delivers:**
- src/prl_hgf/viz/__init__.py (stub re-exports)
- src/prl_hgf/viz/inspector.py -- pyhgf topology reader; attribute paths confirmed by REPL first
- src/prl_hgf/viz/roles.py -- BFS level/role/branch_idx assignment
- src/prl_hgf/viz/schema.py -- NetworkSpec / NodeSpec dataclasses; build_network_spec()
- data/viz_fixtures/patrl_3level_prefit.json -- example JSON for PAT-RL 3-level pre-fit path
- First-pass update to docs/HANDOFF_pyhgf_plot_network_extension.md (verified paths, no
  more "Key questions to resolve")
- tests/test_viz_inspector.py, tests/test_viz_roles.py, tests/test_viz_schema.py

**Addresses:** TS-09, D-01 (Python side); node deduplication; dual coord-name support

**Avoids:** P1 (REPL-first), P2 (temp-key guards), P3 (deduplication), P6 (no env/ imports),
P7 (no models/ diffs), P8 (no SVG/renderer code), P12 (canary integration tests),
P14 (single schema format: dict to json.dumps only), P16 (role from adjacency)

**Research flag:** No /gsd:research-phase needed. The one open question (pyhgf edge
attribute shapes) is resolved by the REPL task at Phase 22 start.

---

### Phase 23: Export + Template Promotion

**Rationale:** export.py depends on schema (complete after Phase 22). Template promotion
requires the export module so injection slots can be verified end-to-end. Template audit
(P11 grep checklist) is the first task of this phase, before any injection code is written.
CDN inlining belongs here because it is part of the export contract.

**Delivers:**
- figures/hgf_viewer.html -- generic template promoted from patrl_hgf_model.html; PAT-RL
  hardcoding replaced by data-driven injection slots or conditional guards; Jinja2 injection
  slots id="viz-network-spec" and id="viz-posterior-summary" added
- src/prl_hgf/viz/export.py -- render_viewer_html(spec, template_path=None) -> str;
  _inject_markers() internal helper; CDN inlining via urllib.request; font fallback style
  block if Google Fonts inlining deferred
- viz/__init__.py updated to export render_viewer_html
- tests/test_viz_export.py -- _inject_markers unit tests + BeautifulSoup integration test
- Pre-fit mode verified end-to-end: JSON fixture to render_viewer_html to browser-openable
  HTML with level bands, node shapes, parameter labels

**Addresses:** TS-01 to TS-10 (all table stakes), D-03, D-04, D-07

**Avoids:** P4 (injection collision; ensure_ascii=True; escape </script>), P5 (missing-
marker ValueError), P9 (coord-name via _get_participant_dim), P10 (2-level default from
injected hgf_level field), P11 (template audit first), P15 (new deps verified in ds_env)

**Research flag:** Template audit scope is the only unknown. Estimate 2-4 hours; if audit
reveals more than 6 hours of refactor work, descope phenotype highlighting to v1.4.

---

### Phase 24: Posterior Overlay + Handoff Final Pass

**Rationale:** Post-fit mode requires real or well-mocked ArviZ idata; all upstream
pipeline must be working first. Handoff final pass belongs here because the architecture is
fully confirmed only after export works end-to-end. Snapshot tests close out the milestone.

**Delivers:**
- Post-fit mode in schema.py and export.py: az.summary() values annotated on nodes (D-02);
  r-hat coloring (D-03); divergence badge (D-04); fit-method badge (D-07)
- pytest-snapshot integration: snapshot.assert_match(html, "patrl_3level_scaffold.html")
- Final update to docs/HANDOFF_pyhgf_plot_network_extension.md: architecture confirmed,
  example config referenced, "Verified 2026-04-24 against pyhgf 0.2.10" on every attribute path
- pyproject.toml delta committed: jinja2>=3.1,<4 in dependencies; pytest-snapshot>=0.9.0
  and beautifulsoup4>=4.12 in dev extras

**Addresses:** D-02, D-03, D-04, D-07; milestone deliverable 4 (handoff doc)

**Avoids:** P13 (handoff confirmed complete; no "Key questions" remaining)

**Research flag:** Standard patterns. az.from_dict() with synthetic data is sufficient for
post-fit path tests; no new research needed.

---

### Phase Ordering Rationale

- Phase 22 first: inspector/roles/schema is the dependency root; these three modules have
  no prl_hgf imports and can be written and tested without touching any existing code.
- Phase 22 must not ship any rendering or SVG code (Pitfall 8 scope-creep guard).
- Phase 23 gates on schema; template audit is its first task because PAT-RL hardcoding has
  the highest recovery cost of all pitfalls (approx 1 day if caught late).
- Phase 24 gates on a working export pipeline; posterior overlay is added last because it
  adds complexity to schema.py without changing the export contract.
- No existing module (models/, fitting/, env/, gui/) is modified in any phase. Additive-only
  policy enforced via diff checks at each phase close-out.

### Research Flags

Needs /gsd:research-phase during planning:
- Phase 22 (REPL task): pyhgf 0.2.10 edge attribute shapes -- resolve as Phase 22 literal
  first task. Confirm net.edges[idx] field names and whether any field can be absent on a
  newly constructed (un-run) network.

Standard patterns (skip research-phase):
- Phase 22 (BFS algorithm): Full pseudocode in ARCHITECTURE.md; no graph library needed.
- Phase 23 (Jinja2 injection): Integration pattern fully specified in STACK.md.
- Phase 24 (posterior overlay): az.summary() API confirmed; az.from_dict() mock pattern
  already exists in tests/test_export_trajectories.py.

## Confidence Assessment

| Area         | Confidence | Notes                                                                                                              |
|--------------|------------|--------------------------------------------------------------------------------------------------------------------|
| Stack        | HIGH       | All versions verified at runtime in ds_env; React/Babel CDN versions confirmed via cdnjs API 2026-04-24           |
| Features     | HIGH       | Grounded in direct codebase artifact inspection (patrl_hgf_model.html, laplace_idata.py, explorer.py)             |
| Architecture | HIGH       | All integration points confirmed from source code; BFS pseudocode specified; injection marker round-trip tested    |
| Pitfalls     | HIGH       | All pitfalls grounded in actual code artifacts, STATE.md decisions, and prior failed patterns in existing modules  |

**Overall confidence:** HIGH

## Resolved Conflicts

**Conflict 1: Jinja2 vs regex injection marker convention**

STACK.md proposed Jinja2 variable rendering. ARCHITECTURE.md proposed
`<script type="application/json" id="viz-{name}">` JSON script tags. These are compatible
and complementary. Jinja2 renders the outer template at export time, replacing Jinja2
variables inside the application/json script block with serialised JSON. The React component
reads the script tags at browser display time via document.getElementById. Jinja2 does not
enter JSX syntax. Use both.

**Conflict 2: Where does the JSON example config live?**

STACK + PITFALLS ordering implied Phase 24 with docs. FEATURES implied Phase 22 with
schema. Resolution: Phase 22. The JSON fixture validates schema.py output immediately.
Placing it in Phase 24 defers that validation by two phases and risks schema drift.
Location: data/viz_fixtures/patrl_3level_prefit.json. YAML configs remain the source of
truth for task configuration.

**Conflict 3: When does the handoff doc update happen?**

ARCHITECTURE implied early (cluster needs accurate paths). PITFALLS said Phase 22
close-out plus Phase 24 final pass. Resolution: two-pass approach. Phase 22 close-out
replaces all hypothetical attribute paths with verified ones from the REPL session. Phase 24
does the final architecture-confirmed pass. The cluster workstream gets an accurate handoff
before Phase 23 begins.

**Conflict 4: Where does CDN inlining (TS-08) live?**

FEATURES placed it in Phase 24 as technically hardest. ARCHITECTURE put template + export
together in Phase 24. Resolution: Phase 23. Inlining is a function inside export.py;
export.py is Phase 23. Separating inlining into Phase 24 creates an export API that cannot
deliver self-contained output. If inlining proves harder than 3 hours, stub with a comment
and font fallback style block; harden in Phase 24. The API must exist either way.

**Conflict 5: When does the REPL verification session happen?**

PITFALLS said possibly as pre-phase work. ARCHITECTURE said Phase 22 first task.
Resolution: Phase 22 first task. Verified attribute paths must be committed in the same
phase as the inspector code that uses them. Pre-phase findings become untracked and are
lost across the local/cluster split.

## Gaps to Address

- pyhgf version drift (0.2.8 cluster vs 0.2.10 local): The binary-input node kind string
  was renamed to binary-state between patch releases (confirmed by STACK.md). Role inference
  uses adjacency structure not kind strings (Pitfall 16 addresses this). The Phase 22 REPL
  session must test against 0.2.10 locally and flag any attribute spelled differently than
  the handoff proposes. If cluster 0.2.8 has a structurally different edges API, add a
  version-guard shim or pin the inspector to the 0.2.8 field set.

- Template audit scope (Phase 23): The full extent of PAT-RL-specific hardcoding in
  figures/patrl_hgf_model.html is not enumerable until the grep checklist runs. Write the
  Phase 23 task plan only after that audit completes.

- Font inlining decision (Phase 23 start): STACK.md flags Google Fonts inlining as optional
  complexity for v1.3. Decide at Phase 23 start: full inline or system-font fallback style
  block. Recommendation: fallback for v1.3; font inlining is v1.4 polish.

- Test directory convention: ARCHITECTURE established flat tests/ (no subdirectories).
  FEATURES.md referenced tests/viz/. Flat wins -- use test_viz_ prefix. Resolved decision;
  document in Phase 22 plan.

## Sources

### Primary (HIGH confidence -- direct code inspection or runtime verification)

- figures/patrl_hgf_model.html -- seed template; node shapes, level bands, PAT-RL
  hardcoding, React useState("3level") default, CDN script tags
- src/prl_hgf/models/hgf_3level_patrl.py -- node index constants, VOLATILITY_NODE,
  shared volatility parent topology
- src/prl_hgf/models/hgf_3level.py -- pick_best_cue 7-node topology, node 6 as shared
  volatility parent
- src/prl_hgf/fitting/laplace_idata.py -- "participant_id" coordinate, param_order tuples,
  sample_stats.laplace marker
- src/prl_hgf/analysis/export_trajectories.py -- _safe_temp() pattern, idata access,
  @dataclass convention
- src/prl_hgf/env/pat_rl_config.py -- frozen dataclass validation style, Decision 112
  parallel-stack contract
- src/prl_hgf/power/schema.py -- schema-as-frozen-dataclass precedent in codebase
- docs/HANDOFF_pyhgf_plot_network_extension.md -- Option C architecture, hypothetical
  attribute paths (to be verified and replaced in Phase 22)
- ds_env runtime: jinja2 3.1.6, beautifulsoup4 4.13.4, arviz 0.22.0, numpy 2.2.6,
  pyhgf 0.2.10 confirmed
- cdnjs API 2026-04-24 -- React 18.2.0, Babel 7.23.2 pinned versions confirmed

### Secondary (MEDIUM confidence -- official documentation)

- pyhgf 0.2.8 plot_network() docs -- graphviz backend, no parameter labels, no posterior
  overlay, Jupyter-only output confirmed from computationalpsychiatry.github.io
- ArviZ az.summary() column names confirmed from python.arviz.org v0.21.0 API reference
- PyPI pytest-snapshot 0.9.0 -- confirmed current stable release 2026-04-24

### Tertiary (LOW confidence -- training knowledge)

- DCM plotting conventions -- used only as negative reference (what HGF diagrams should
  NOT borrow from DCM)
- ShinyStan multi-tab diagnostic dashboard structure -- used as anti-pattern reference

---
*Research completed: 2026-04-24*
*Ready for roadmap: yes*
