# Requirements: v1.3 Generic HGF Viewer (Scaffold + Handoff)

**Defined:** 2026-04-24
**Core Value:** A config-driven HTML viewer scaffold (`src/prl_hgf/viz/`) that reads real pyhgf Network internals and optional ArviZ posteriors, produces a self-contained HTML file valid pre- and post-fit, and ships with a runtime-verified handoff doc for follow-up Claude Code implementation of polish features.

**Scope:** C — spec + example config + Python scaffold + generic template + post-fit overlay hook. Publication-quality SVG polish, interactive sidebar, and export buttons are deferred to v1.4+.

**Motivation:** The existing `docs/HANDOFF_pyhgf_plot_network_extension.md` proposes Option C hybrid renderer but its pyhgf attribute paths are hypothetical. The existing HTML prototypes (`figures/patrl_hgf_model.html`, `hgf_model_explorer.jsx`) establish the visual language but hardcode PAT-RL topology in JSX. v1.3 turns the hypothetical handoff into runtime-verified spec and replaces hardcoded JSX with JSON-injection driven by a Python scaffold.

## v1.3 Requirements

### Inspector + Roles Module (VIZ)

- [ ] **VIZ-01**: `src/prl_hgf/viz/__init__.py` exposes public API `inspect_network` and `render_viewer_html`; no other symbols re-exported
- [ ] **VIZ-02**: `src/prl_hgf/viz/inspector.py` reads `pyhgf.model.Network` via `.attributes[idx]`, `.edges[idx]`, `.input_idxs`, `.n_nodes`; returns a plain dict keyed on node index with zero imports from any `prl_hgf.env` / `prl_hgf.models` / `prl_hgf.fitting` module (reader only)
- [ ] **VIZ-03**: Inspector pyhgf attribute paths verified via REPL session against the actual `ds_env` pyhgf install BEFORE production code is written; REPL findings committed as module-level comment inside `inspector.py` naming the pyhgf version and each verified attribute path
- [ ] **VIZ-04**: `src/prl_hgf/viz/roles.py` assigns `(level, role, branch_idx)` per node via BFS traversal from `input_idxs` upward; shared volatility parent (e.g., pick_best_cue node 6) is visited once and emitted as one node, not one per branch
- [ ] **VIZ-05**: Role is inferred from adjacency structure — `role = "volatility"` iff the node appears in any edge's `volatility_parents`, `role = "input"` iff index in `input_idxs`, `role = "value"` otherwise — not from `node_parameters` keys or `node_type` string

### Schema + Example Config (SCHEMA)

- [ ] **SCHEMA-01**: `src/prl_hgf/viz/schema.py` defines `NetworkSpec` and `NodeSpec` as `@dataclass(frozen=True)` matching existing project convention (`power/schema.py`, `env/pat_rl_config.py`)
- [ ] **SCHEMA-02**: `build_network_spec(network, idata=None, coord_name=None) -> NetworkSpec` accepts optional ArviZ `InferenceData` and optional participant coord name
- [ ] **SCHEMA-03**: Dual coord-name support — `_get_participant_dim(idata)` probes `idata.posterior.data_vars` dynamically when `coord_name` is None; handles both `"participant_id"` (Laplace path, Decision 131) and `"participant"` (NUTS path, Decision 131) without hardcoding
- [ ] **SCHEMA-04**: R-hat suppressed in the emitted spec when `idata.sample_stats.laplace == True`; divergence count absent when no `sample_stats.diverging` variable present
- [ ] **SCHEMA-05**: Standalone PAT-RL 3-level example config at `data/viz_fixtures/patrl_3level_prefit.json` with full phenotype definitions (healthy, high_anxiety, reward_susceptible, anxious_reward) and parameter descriptions (ω₂, ω₃, κ, β, ζ, b, μ₃⁰); validates schema round-trip in tests

### Export + Template (EXPORT)

- [ ] **EXPORT-01**: `src/prl_hgf/viz/export.py` defines `render_viewer_html(spec: NetworkSpec, template_path: Path | None = None) -> str` returning a complete self-contained HTML document as a string
- [ ] **EXPORT-02**: Injection marker convention is `<script type="application/json" id="viz-{name}">` with canonical names `viz-network-spec` and `viz-posterior-summary`; no regex tokens like `__VIZ_NODES__` or HTML comments
- [ ] **EXPORT-03**: Rendering via Jinja2 `Environment(loader=BaseLoader())`; JSON serialization uses `json.dumps(..., ensure_ascii=True)` to neutralize `</script>`, CR/LF, and unicode injection risks
- [ ] **EXPORT-04**: `_inject_markers()` raises `ValueError("injection marker 'viz-{name}' not found in template")` when a marker is missing; silent no-op prevention verified in tests
- [ ] **EXPORT-05**: Self-contained HTML at export time — React 18.2.0 + Babel 7.23.2 CDN assets fetched once via `urllib.request` and embedded inline in the returned HTML; system-font fallback style block used for v1.3 (Google Fonts inlining deferred to v1.4); offline-mode switch available for CI

### Generic HTML Template (TEMPLATE)

- [ ] **TEMPLATE-01**: `figures/hgf_viewer.html` created by promoting `figures/patrl_hgf_model.html` to generic form; original preserved as-is
- [ ] **TEMPLATE-02**: Template audit grep executed BEFORE injection work — catalog every PAT-RL-specific hardcoded value (phenotype names, ANS framing, bradycardia/Klaassen references, `C.dhr` color, response-model equation specifics) and classify each as "replace with injection slot" or "remove"; audit output committed under `.planning/phases/{phase-dir}/` as a phase task record
- [ ] **TEMPLATE-03**: Node-kind shapes rendered correctly from injected JSON — hexagon (volatility parent), circle (value parent), diamond (binary input / observation), square (fixed parameter)
- [ ] **TEMPLATE-04**: Level bands with canonical colors — coral (L3), teal (L2), blue (L1), purple (response model section) — rendered as horizontal bands with L3 on top, L1 on bottom
- [ ] **TEMPLATE-05**: Coupling edge styles distinguish value (solid blue arrow) from volatility (dashed coral arrow); edge labels carry the coupling parameter symbol (κ on volatility edges)
- [ ] **TEMPLATE-06**: Parameter symbol labels rendered on nodes and edges — ω₂, ω₃, κ, β, ζ, b, μ₃⁰ — using STIX/serif math font already in seed template
- [ ] **TEMPLATE-07**: 2-level graceful rendering — when `n_levels == 2`, the L3 band is removed entirely (no dead space), κ square absent from equations panel, no ghost-node rendering for μ₃[k-1]
- [ ] **TEMPLATE-08**: Multimodal 2-level variant rendered correctly — two input diamonds (u₁, u₂) coupling to one shared belief node μ₂ (PAT-RL Model variant from `hgf_2level_multimodal_patrl.py`)
- [ ] **TEMPLATE-09**: Response model section below a horizontal separator line, showing decision equation text derived from spec (no hardcoded "PAT-RL bilinear" text)
- [ ] **TEMPLATE-10**: Notation legend visible in sidebar without user interaction — shapes, edge styles, and badge meanings all labeled

### Post-Fit Overlay (POST)

- [ ] **POST-01**: Post-fit mode activated when `idata` passed to `build_network_spec`; pre-fit mode otherwise; single HTML artifact per render (no toggle overlay, no paired files)
- [ ] **POST-02**: Parameter squares annotated with posterior mean + HDI bracket `[lo, hi]` extracted via `az.summary(..., hdi_prob=0.94)` and `az.hdi()`; values resolved from ArviZ DataFrame columns `mean`, `hdi_3%`, `hdi_97%`
- [ ] **POST-03**: R-hat coloring on parameter square border — green ≤ 1.01, amber ≤ 1.05, red > 1.05; suppressed entirely when `sample_stats.laplace == True` (single-chain Laplace has no r_hat)
- [ ] **POST-04**: Divergence badge rendered on canvas when `idata.sample_stats.diverging.sum() > 0` (NUTS path only); absent when `sample_stats.diverging` variable does not exist
- [ ] **POST-05**: Fit-method badge "VB-LAPLACE" or "NUTS" on canvas, derived from presence of `sample_stats.laplace` boolean (Laplace marker per `laplace_idata.py`)

### Structural Tests (TEST)

- [ ] **TEST-01**: `tests/test_viz_inspector.py` — canary integration test instantiates real `Network` via `build_3level_network_patrl()` and `build_3level_network_pick_best_cue()`; asserts node count (7 for pick_best_cue 3-level despite 3 branches sharing node 6; 3 for PAT-RL 3-level)
- [ ] **TEST-02**: `tests/test_viz_roles.py` — role inference covers 2-level binary, 3-level binary, multimodal 2-level, shared volatility parent; role assertions use adjacency structure only
- [ ] **TEST-03**: `tests/test_viz_schema.py` — `build_network_spec` round-trip with synthetic `az.from_dict()` idata in both coord-name variants (`participant` and `participant_id`); r_hat suppression when `sample_stats.laplace == True` verified
- [ ] **TEST-04**: `tests/test_viz_export.py` — `_inject_markers` unit tests cover missing-marker `ValueError`, successful injection roundtrip, parseable output via `bs4.BeautifulSoup(html, "html.parser")`; JSON script-tag content deserializes via `json.loads()`
- [ ] **TEST-05**: `pytest-snapshot` regression test locks the final pre-fit and post-fit HTML output bit-for-bit; fixture HTML committed under `tests/fixtures/viz/`

### Handoff Doc + Example Config (DOC)

- [ ] **DOC-01**: Phase-22 close-out first-pass update to `docs/HANDOFF_pyhgf_plot_network_extension.md` — replace every hypothetical attribute path with REPL-verified one, annotate with "Verified 2026-04-24 against pyhgf X.Y.Z", remove "Key questions to resolve" section since it is resolved
- [ ] **DOC-02**: Phase-24 close-out final-pass update to handoff doc — architecture confirmed, example config path referenced, implementation checklist for a follow-up Claude Code session that builds the v1.4 publication SVG polish; handoff becomes single-source-of-truth for viewer module

### Dependency Config (DEPS)

- [ ] **DEPS-01**: `pyproject.toml` delta — add `jinja2>=3.1,<4` to `[project.dependencies]` (making the transitive dep explicit); add `pytest-snapshot>=0.9.0` and `beautifulsoup4>=4.12` to `[project.optional-dependencies.dev]`; no other runtime adds

## v1.4+ Requirements (Deferred)

Tracked here for visibility; not in the v1.3 roadmap.

### Publication Polish

- **POLISH-01**: Publication-quality hexagon geometry (anchor alignment, print layout, Weber 2024 visual quality target)
- **POLISH-02**: Phenotype highlighting buttons (config-driven preset subsets of nodes/edges with amber overlay)
- **POLISH-03**: Click-to-inspect sidebar (parameter definition, update equation, prior, posterior summary)
- **POLISH-04**: SVG / PNG / PDF export buttons (headless browser or server-side renderer)
- **POLISH-05**: Google Fonts inlining via base64 `@font-face`
- **POLISH-06**: Response-model equation rendering section with proper mathematical typography (KaTeX/MathJax inlined)
- **POLISH-07**: pyhgf upstream contribution (Option A: extend `plot_network()` with `style='graphical_model'` parameter)

## Out of Scope (Anti-Features)

Explicitly excluded. Requested behaviors that do not belong in this module.

| Feature | Anti-ID | Reason | What to do instead |
|---------|---------|--------|--------------------|
| Live parameter sliders driving belief trajectories | AF-01 | That is the ipywidgets GUI at `src/prl_hgf/gui/explorer.py`; adding it to the viewer collapses scope and requires JAX in the browser | Keep in the Jupyter GUI; viewer links to it via README |
| Embedded `az.plot_trace` / `az.plot_forest` / trace panels | AF-02 | Replaces ArviZ, duplicates it poorly, inflates file size; the viewer is topology + summary, not full diagnostics | Use `az.plot_trace(idata)` in Jupyter directly |
| Editable model in browser (add/remove nodes) | AF-03 | Requires graph-editor framework, bidirectional state sync, validation; 2-week project on its own; no Python execution path in-browser | Edit in YAML; re-run export to regenerate |
| Posterior violin plots or KDE curves on nodes | AF-05 | Requires substantial canvas real estate; overlaps ArviZ's purpose; compact `[lo, hi]` sufficient at viewer resolution | `az.plot_posterior(idata)` for per-parameter marginal densities |
| Multi-participant overlay (all N participant posteriors per node) | AF-06 | Viewer is single-subject / group-summary; multi-participant needs different spatial design | Group-level belongs to `analysis/group.py` + bambi |
| BMS widget embedded in viewer | AF-07 | BMS is group-level analysis result, not per-model structure; embedding conflates purposes | Use `analysis/bms.py` output; separate dashboard |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| VIZ-01 | Phase 22 | Complete |
| VIZ-02 | Phase 22 | Complete |
| VIZ-03 | Phase 22 | Complete |
| VIZ-04 | Phase 22 | Complete |
| VIZ-05 | Phase 22 | Complete |
| SCHEMA-01 | Phase 22 | Complete |
| SCHEMA-02 | Phase 22 | Complete |
| SCHEMA-03 | Phase 22 | Complete |
| SCHEMA-04 | Phase 22 | Complete |
| SCHEMA-05 | Phase 22 | Complete |
| DOC-01 | Phase 22 | Complete |
| TEST-01 | Phase 22 | Complete |
| TEST-02 | Phase 22 | Complete |
| TEST-03 | Phase 22 | Complete |
| EXPORT-01 | Phase 23 | Pending |
| EXPORT-02 | Phase 23 | Pending |
| EXPORT-03 | Phase 23 | Pending |
| EXPORT-04 | Phase 23 | Pending |
| EXPORT-05 | Phase 23 | Pending |
| TEMPLATE-01 | Phase 23 | Pending |
| TEMPLATE-02 | Phase 23 | Pending |
| TEMPLATE-03 | Phase 23 | Pending |
| TEMPLATE-04 | Phase 23 | Pending |
| TEMPLATE-05 | Phase 23 | Pending |
| TEMPLATE-06 | Phase 23 | Pending |
| TEMPLATE-07 | Phase 23 | Pending |
| TEMPLATE-08 | Phase 23 | Pending |
| TEMPLATE-09 | Phase 23 / 24 | Partial — generic placeholder in Phase 23; spec-derived rendering requires NetworkSpec.response_model field (Phase 24) |
| TEMPLATE-10 | Phase 23 | Pending |
| TEST-04 | Phase 23 | Pending |
| DEPS-01 | Phase 23 | Pending |
| POST-01 | Phase 24 | Pending |
| POST-02 | Phase 24 | Pending |
| POST-03 | Phase 24 | Pending |
| POST-04 | Phase 24 | Pending |
| POST-05 | Phase 24 | Pending |
| TEST-05 | Phase 24 | Pending |
| DOC-02 | Phase 24 | Pending |

**Coverage:**
- v1.3 requirements: 38 total
- Mapped to phases: 38
- Unmapped: 0 ✓

## Success Criteria

1. `import prl_hgf.viz; prl_hgf.viz.inspect_network(network)` returns a NetworkSpec from a pyhgf 3-level PAT-RL Network (VIZ-01 through VIZ-05)
2. Shared volatility parent node is emitted once, not per-branch; verified by pick_best_cue 3-level test (VIZ-04, TEST-01)
3. `render_viewer_html(spec)` produces an HTML string that opens in Chrome/Firefox offline (no CDN fetches at display time) and renders L3/L2/L1 bands with distinct node shapes (EXPORT-05, TEMPLATE-03/04/05)
4. Post-fit render with a Laplace idata shows parameter means + HDIs overlaid on parameter squares AND suppresses r_hat coloring (POST-02, POST-03, SCHEMA-04)
5. Post-fit render with a NUTS idata shows r_hat coloring AND divergence badge when applicable (POST-03, POST-04)
6. `docs/HANDOFF_pyhgf_plot_network_extension.md` has zero "hypothetical" attribute paths remaining at Phase 24 close; every path carries a "Verified 2026-04-24" annotation (DOC-01, DOC-02)
7. Snapshot test locks output HTML bit-for-bit (TEST-05)
8. Zero imports into `src/prl_hgf/viz/` from `env/`, `models/`, `fitting/`, `analysis/`, `gui/`, `power/`, `simulation/` modules (parallel-stack invariant preserved)

## Key References

- `.planning/research/SUMMARY.md` — research synthesis with resolved phase ordering
- `.planning/research/STACK.md` — runtime-verified dependency analysis
- `.planning/research/FEATURES.md` — table stakes + differentiators + anti-features + dependency DAG
- `.planning/research/ARCHITECTURE.md` — file-level component design + BFS pseudocode + injection marker convention
- `.planning/research/PITFALLS.md` — 16 ranked pitfalls with prevention strategies per phase
- `docs/HANDOFF_pyhgf_plot_network_extension.md` — existing 235-line design doc (evolves in DOC-01/DOC-02)
- `figures/patrl_hgf_model.html` — seed template defining visual language (promoted in TEMPLATE-01)
- `src/prl_hgf/fitting/laplace_idata.py` — ArviZ idata shape (`sample_stats.laplace` marker, coord_name conventions)
- STATE.md Decisions 112, 118-119, 128-131, 135, 184 — relevant constraints carried from prior phases

---
*Requirements defined: 2026-04-24*
*Traceability updated: 2026-04-24 (v1.3 milestone opened, roadmap pending)*
