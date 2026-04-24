# Feature Research: v1.3 Generic HGF Viewer

**Domain:** Config-driven probabilistic network viewer for HGF models
**Researched:** 2026-04-24
**Confidence:** HIGH (codebase artifacts) / MEDIUM (tool comparisons)

---

## Context and Scope

This research covers the v1.3 Generic HGF Viewer — a standalone self-contained
HTML artifact generated from a Python module at `src/prl_hgf/viz/`. It is
categorically different from the existing `src/prl_hgf/gui/explorer.py`
(ipywidgets, Jupyter-bound, parameter sliders driving live belief trajectories).

The viewer's job is to show **what the model IS** (network topology, node
kinds, coupling structure, parameter names and priors) and, when posteriors
are available, **what was found** (posterior summaries overlaid on nodes).

Seed artifacts already exist and define the visual language:
- `figures/patrl_hgf_model.html` — PAT-RL 3-level full model with phenotype
  highlighting; the most complete reference (50 KB, React/Babel, SVG)
- `figures/hgf_model_explorer.jsx` — pick_best_cue 3-parallel-branch model
- Node shapes already established: hexagon (volatility), circle (belief/value
  parent), diamond (binary input/observation), square (fixed parameter)
- Color palette already established: coral l3, teal l2, blue l1, purple
  response model, gold parameters

---

## HGF Node Kinds

Sourced from pyhgf 0.2.8 API, project model files, and the Weber 2024 gHGF
paper (arxiv 2410.09206).

### Definitive node kind taxonomy for this codebase

| Kind | pyhgf `kind=` string | Role | What it holds |
|------|----------------------|------|---------------|
| Binary input | `"binary-state"` | Observation node (level 1) | Observed u ∈ {0,1} per trial |
| Continuous value parent | `"continuous-state"` with value_children | Belief node (level 2) | Posterior mean μ₂ in log-odds |
| Continuous volatility parent | `"continuous-state"` with volatility_children | Volatility node (level 3) | Posterior mean μ₃ in log-volatility |
| Response model | Not a pyhgf node — separate Python module | Decision model | P(action) = σ(f(beliefs, params)) |
| Fixed parameter | Not a node — node_parameters dict key | Scalar hyperparameter | ω₂, ω₃, κ, μ₃⁰, β, b, γ, α |

**Which MUST be visually distinct:** All five are structurally different and
must use different visual encodings. Conflating "value parent" with
"volatility parent" is the most common mistake in HGF diagrams — they differ
in what they communicate upward (mean vs. precision). The existing HTML
prototypes already encode this correctly with circle vs. hexagon shapes.

---

## Analysis of Comparable Tools

### pyhgf `plot_network()` (graphviz backend)

**Source:** pyhgf 0.2.8 docs, notebooks/0.2-Creating_networks.html, API page.

What it does:
- Renders a graphviz Digraph of the node structure
- Shows nodes labeled by index (X₀, X₁, X₂, X₃)
- Shows edges distinguishing value coupling from volatility coupling
- Auto-layout (dot/neato) — no fixed hierarchical positioning

What it does NOT do (confirmed gaps):
- No symbolic parameter labels (ω, κ, ϑ) on nodes
- No HGF-standard shape conventions (hexagon/circle/diamond)
- No color coding by level using project palette
- No response model section
- No prior mean annotations
- No posterior overlay of any kind
- No standalone HTML export — produces graphviz SVG in Jupyter only
- Layout collapses in multi-branch topologies (pick_best_cue 3-branch
  becomes visually cluttered because graphviz does not enforce vertical
  level bands)

**Verdict:** plot_network() is a developer debugging tool, not a
communication artifact. This is the specific gap v1.3 fills.

### PyMC `pm.model_to_graphviz`

What it does:
- Produces a graphviz Digraph of variable dependencies from a PyMC model
- Distinguishes free random variables from observed variables (different
  shapes/shading in Kruschke plate notation)
- Shows plate notation for repeated variables (batched participants)

What it does NOT do:
- Shows PyMC's generative graph, not pyhgf's computational graph topology;
  the two are not equivalent for this codebase
- No posterior overlay
- No level-structured layout
- Not applicable as the primary approach because the HGF model is defined
  via pyhgf Network API, not as a PyMC model directly

**What it gets right:** Plate notation for participant batches is useful
reference for how to show "P participants fitted" compactly.

### Dynamic Causal Modeling (DCM) figures

What the literature convention shows:
- Boxes for hidden states (not directly observable)
- Arrows labeled with coupling parameters (effective connectivity A, B, C
  matrices)
- Exogenous input arrows separate from state-to-state coupling
- Color by modality or region, not by hierarchical level

What HGF figures should borrow from DCM:
- The distinction between "hidden state" (evolving over time, not observed)
  and "observation" (fixed per trial) — already encoded in hexagon vs.
  diamond
- Labeling coupling arrows with the parameter that controls their strength
  (κ on the volatility coupling arrow)

What HGF should NOT borrow from DCM:
- Region-of-interest framing — HGF is computational, not anatomical
- A/B/C matrix notation — irrelevant to scalar HGF coupling

### ArviZ (az.plot_trace, az.plot_forest, az.plot_posterior)

What ArviZ does:
- `az.summary()` returns a pandas DataFrame with columns: mean, sd,
  hdi_3%, hdi_97%, mcse_mean, mcse_sd, ess_bulk, ess_tail, r_hat
- `az.plot_trace` shows chain traces + KDE — useful for diagnostics
- `az.plot_forest` shows per-parameter HDI bars across participants
- `az.plot_posterior` shows marginal posterior per parameter

What ArviZ does NOT do:
- None of the above shows WHERE in the generative model a parameter lives
- az.summary() is a flat table; the viewer's job is to map that table ONTO
  the topology

The viewer's posterior mode maps az.summary() rows by parameter name onto
the corresponding node or edge label in the SVG, showing mean + HDI width as
a compact annotation (e.g., "ω₂  −3.2 [−4.1, −2.3]") — NOT replacing
ArviZ plots but complementing them.

**What maps naturally from idata onto node visualizations:**

| az.summary column | Where it appears in viewer |
|-------------------|---------------------------|
| mean | Primary label beneath parameter symbol on node/edge |
| hdi_3%, hdi_97% | HDI bar width OR bracketed range "[lo, hi]" |
| r_hat | Node border color (green ≤ 1.01, amber ≤ 1.05, red > 1.05) |
| ess_bulk | Tooltip text on hover (not primary display — too technical) |
| sample_stats.diverging | Warning badge on node if divergences > 0 |
| sample_stats.laplace | Mode indicator — "Laplace" badge on canvas |

The `laplace_idata.py` marker (`sample_stats.laplace = True`) means the
viewer must tolerate single-chain idata without r_hat; in that case r_hat
coloring is suppressed entirely.

### ShinyStan

Provides a web UI for Stan output. Relevant observations:
- Organizes diagnostics as separate tabs (Diagnose, Explore, Model Code)
  rather than overlaying onto a model graph
- Good at ESS/R-hat heatmaps per variable but shows no network structure
- Requires a running server (Shiny app) — the antithesis of the standalone
  HTML artifact needed here

**What to avoid:** ShinyStan's tabbed-UI approach. The viewer should NOT
become a multi-tab diagnostic dashboard; that scope belongs to ArviZ itself.

---

## Table Stakes

Features every useful HGF viewer must have. Missing these makes the artifact
useless for its stated purpose.

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **TS-01** Node-kind-distinct visual shapes: hexagon (volatility parent), circle (belief/value parent), diamond (binary input), square (parameter) | Users reading HGF literature expect this mapping; conflating node kinds breaks pedagogical communication | trivial | Already specified in HANDOFF doc and implemented in HTML seeds; just needs Python-side encoding |
| **TS-02** Level bands: vertical layout with LEVEL 3 (coral band) at top, LEVEL 2 (teal band) middle, LEVEL 1 (blue band) bottom | HGF hierarchy is the primary organizing principle; without this the graph reads as a flat network | trivial | Already in patrl_hgf_model.html; needs config-driven band count |
| **TS-03** Coupling-type-distinct edge styles: value coupling solid arrow, volatility coupling dashed arrow | These carry different meanings (mean vs. precision); visual conflation is a conceptual error | trivial | Color + dash pattern already chosen (blue solid, coral dashed) |
| **TS-04** Parameter labels on nodes/edges: ω₂ on belief node, ω₃ on volatility node, κ on volatility coupling edge | Without these the diagram is anonymous structure; with them it's self-documenting | trivial | Math symbols require STIX/serif font; already in seed HTML |
| **TS-05** Prior mean shown in pre-fit mode | Pre-fit mode value: researcher can verify priors match config before burning compute | 1h | Read from configs/pat_rl.yaml fitting.priors block via pat_rl_config |
| **TS-06** 2-level vs 3-level graceful toggle: 3-level shows full three-band layout; 2-level REMOVES the volatility level and its band entirely, leaving no dead space | Showing a greyed-out missing level confuses readers into thinking the level exists but is empty | 1h | rowV geometry conditional in seed HTML already; inspector must emit `n_levels: 2 | 3` |
| **TS-07** Response model section below a separator line with equation text | The decision model is architecturally distinct from the generative model; it must be visually separated | 1h | Already in patrl_hgf_model.html with equation panel on right side |
| **TS-08** Self-contained single HTML file: no external server, no CDN required after generation, all JS/CSS inlined | Collaborators receive one file via email and open it in any browser; any external dependency breaks this | 1-3 days | React + Babel via CDN in seed HTML violates this; production must inline or switch to vanilla JS/SVG |
| **TS-09** JSON config schema accepted as viewer input | Python module generates JSON from YAML config; HTML reads JSON; this is the config-driven path | 1-3 days | JSON is language-neutral and embeddable in HTML as a `<script>` block |
| **TS-10** Notation legend visible without clicking: node shapes + edge styles labeled | First-time readers cannot interpret the diagram without a key | trivial | Already in sidebar of seed HTML under "NOTATION" block |

---

## Differentiators

What makes this viewer more valuable than pyhgf's built-in `plot_network()`.

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| **D-01** Config-driven rendering: Python `inspector` reads pyhgf Network OR YAML config and emits canonical JSON; viewer renders from JSON alone | Topology and the rendered figure stay in sync without manual SVG editing; also enables pre-fit rendering (no fitted model needed) | 1-3 days | Requires `src/prl_hgf/viz/inspector.py` that traverses Network.edges and Network.node_parameters |
| **D-02** Posterior overlay hook: when idata is provided, az.summary() values (mean, HDI) appear as annotations on parameter nodes/edges | Bridges the gap between flat ArviZ summary tables and spatial model intuition; allows at-a-glance review of what was recovered where | 1-3 days | `src/prl_hgf/viz/schema.py` maps param_names tuples from laplace_idata.py to node positions |
| **D-03** R-hat coloring: node/parameter-square border encodes convergence status (green/amber/red) | Instantly surfaces problematic parameters without reading a table; important for VB-Laplace pseudo-chains where r_hat is undefined (border suppressed) | 1h | Must check `sample_stats.laplace` marker to suppress when single-chain |
| **D-04** Divergence badge: if idata.sample_stats.diverging.sum() > 0, a warning badge appears on the canvas | NUTS divergences signal geometry problems near specific parameters; visible warning prevents silent misinterpretation | 1h | Only relevant for NUTS path (blackjax); VB-Laplace has no divergences |
| **D-05** Phenotype / hypothesis highlighting: named preset buttons highlight subsets of nodes + edges in amber | Communicates scientific hypotheses spatially — "this phenotype involves these nodes being disrupted" | 1-3 days | Already implemented in patrl_hgf_model.html; needs config-driven preset loading from pat_rl.yaml phenotypes block |
| **D-06** Click-to-inspect panel: clicking any node or edge opens a sidebar with parameter definition, update equation, prior, and (post-fit) posterior summary | Enables dense information without cluttering the diagram; suitable for paper supplements where reviewers want details | 1-3 days | Already implemented in seed HTML via INFO dict + displayInfo panel |
| **D-07** Fit method badge: "VB-Laplace" or "NUTS" label on canvas derived from idata.sample_stats | Prevents confusion about which approximation produced the posteriors; important for papers citing both paths | trivial | Read from `sample_stats.laplace` boolean |

---

## Anti-Features

Things the viewer must NOT do. Some are commonly requested; all are wrong for
this scope.

| Anti-Feature | Why Requested | Why It Must Be Excluded | What to Do Instead |
|--------------|---------------|-------------------------|--------------------|
| **AF-01** Live parameter sliders driving belief trajectories | Users naturally want interactivity after seeing the existing ipywidgets GUI | That is the ipywidgets GUI (`src/prl_hgf/gui/explorer.py`); adding it to the viewer collapses the scope boundary and requires JAX in the browser | Keep sliders in the existing Jupyter GUI; viewer links to it via a README note |
| **AF-02** az.plot_trace / az.plot_forest / trace panels embedded in HTML | Users want "all diagnostics in one place" | Replaces ArviZ, duplicates it poorly, and inflates file size; the viewer is a topology + summary overlay, not a full diagnostics suite | Direct users to `az.plot_trace(idata)` in Jupyter for full trace inspection |
| **AF-03** Editable model (add/remove nodes in the browser) | "It would be great to prototype new topologies in the viewer" | Requires a graph editor framework (e.g., React Flow), bidirectional state sync, and validation — that is a 2-week project on its own; also the viewer has no Python execution path | Editing is done in YAML config; re-running the Python export regenerates the viewer |
| **AF-04** Publication-quality SVG with hexagon path polish, anchor alignment, pixel-perfect print layout | Researchers want figures for papers | This is v1.4 scope explicitly; the scaffold HTML output is not print-ready | Flag in SUMMARY.md as "Phase 24 exit → v1.4 publication figures" |
| **AF-05** Posterior violin plots or KDE curves on nodes | Rich posterior visualization | Requires substantial canvas real estate and overlaps ArviZ's purpose; the compact "[lo, hi]" annotation is sufficient at the viewer's resolution | Use `az.plot_posterior(idata)` for per-parameter marginal densities |
| **AF-06** Multi-participant overlay (show all N participant posteriors per node) | "Show the group spread" | The viewer is for a single subject or group-level summary; multi-participant layout requires a different spatial design | Group-level analysis belongs to `src/prl_hgf/analysis/group.py` + bambi |
| **AF-07** Model comparison BMS widget embedded in viewer | "Which model won?" | BMS is a group-level analysis result, not a per-model structure property; embedding it conflates the purposes | Use `src/prl_hgf/analysis/bms.py` output; annotate winning model in a separate dashboard |
| **AF-08** SVG / PNG / PDF export buttons | Users want export for slides | These require either browser Print API (fragile) or a server-side renderer (not standalone); defer entirely | "Print to PDF" via browser Ctrl+P is the fallback; explicit export is scope-C deferred to v1.4 |

---

## Feature Dependencies

```
[TS-09] JSON config schema
    └──required by──> [TS-01] Node shapes (shape determined from node kind in JSON)
    └──required by──> [TS-02] Level bands (n_levels from JSON)
    └──required by──> [TS-03] Edge styles (coupling_type from JSON)
    └──required by──> [TS-04] Parameter labels (param_names from JSON)
    └──required by──> [TS-05] Prior means (prior_mean from JSON)
    └──required by──> [TS-06] 2/3-level graceful toggle
    └──required by──> [D-05] Phenotype highlighting (phenotype presets from JSON)

[D-01] Config-driven inspector (Python)
    └──produces──> [TS-09] JSON config schema
    └──required by──> all rendering features

[idata available]
    └──enables──> [D-02] Posterior overlay (az.summary mapped to nodes)
    └──enables──> [D-03] R-hat coloring
    └──enables──> [D-04] Divergence badge
    └──enables──> [D-07] Fit method badge

[D-02] Posterior overlay
    └──depends on──> [D-01] inspector (to know which node each param belongs to)
    └──depends on──> [TS-09] JSON schema (param_name → node_index mapping)

[TS-08] Self-contained HTML
    └──requires──> inlining or replacing CDN React/Babel from seed HTML
    └──conflicts with──> using CDN dependencies
```

### Critical dependency: inspector → JSON schema → renderer

The Python `inspector` (`src/prl_hgf/viz/inspector.py`) is the only path
from model definition to rendered HTML. It must:
1. Accept a `pyhgf.model.Network` object OR a dict parsed from YAML config
2. Extract: node_kind per node, coupling_type per edge, coupling_strength (κ),
   param_names per node, prior_mean per param (from config), n_levels
3. Emit canonical JSON matching `src/prl_hgf/viz/schema.py`

Without this, pre-fit and post-fit modes cannot be rendered generically. The
seed HTML (`patrl_hgf_model.html`) has the topology hardcoded in JSX; the
v1.3 scaffold replaces hardcoded topology with JSON-driven rendering.

---

## Pre-fit vs Post-fit Mode: Distinct Behaviors

### Pre-fit mode (config only, no idata)

Input: JSON produced from YAML config (e.g., `configs/pat_rl.yaml`)

Information available:
- Node kinds and coupling topology (from model definition)
- Parameter names per node/edge
- Prior distributions (mean, sd, or bounds) from `fitting.priors` block
- Phenotype definitions from `simulation.phenotypes` block
- Task name, n_levels, response model variant (A/B/C/D)

What the viewer shows:
- Full network topology with correct shapes and level bands
- Parameter squares labeled with symbol and prior mean (e.g., "ω₂  prior: −4.0")
- Response model equation text in the equation panel
- Phenotype preset buttons (if phenotypes block present in config)
- "PRE-FIT" badge on canvas in amber
- No posterior annotations, no convergence coloring

User value: sanity-check model structure before burning compute. Confirm
the correct number of levels, the correct coupling (κ edge present for 3-level,
absent for 2-level), the correct response model variant, and the correct
parameter names match what the fitting code expects. This catches "I forgot
to enable 3-level" errors before a 30-minute VB-Laplace run.

### Post-fit mode (config + idata)

Input: JSON from config PLUS az.summary() DataFrame extracted from ArviZ idata

Additional information from idata (`build_idata_from_laplace` output):
- Variable names: omega_2, log_beta, beta, omega_3, kappa, mu3_0, b, gamma,
  alpha (depending on param_order variant)
- per-participant or group-level posterior mean + HDI per parameter
- r_hat per parameter (suppressed if single-chain / Laplace path)
- sample_stats.laplace boolean (determines fit-method badge text)
- sample_stats.diverging count (determines divergence badge)

What the viewer shows in addition to pre-fit:
- Parameter squares show: symbol, posterior mean, "[hdi_lo, hdi_hi]"
- R-hat coloring: parameter square border color encodes convergence
- Divergence badge if applicable
- "VB-LAPLACE" or "NUTS" fit-method badge on canvas
- "POST-FIT" mode indicator replaces "PRE-FIT" badge

**Single artifact, mode detected at render time:** The Python export function
reads whether idata is None and writes either a pre-fit or post-fit JSON
block into the HTML. One HTML file, one mode. Do NOT produce two separate
files — a single artifact can be regenerated in either mode by re-running
the export with or without idata. This is simpler than a toggle overlay and
avoids stale pre-fit HTML sitting next to post-fit HTML.

---

## 2-level vs 3-level Graceful Handling

**The rule:** A 2-level config has `n_levels: 2` in the inspector output.
The renderer conditionally renders the LEVEL 3 band and all its contents
(volatility hexagon node, ω₃ parameter square, μ₃⁰ parameter square, κ edge,
temporal evolution ghost node for μ₃[k-1]).

**No dead space:** When `n_levels === 2`, the level 3 band height is zero
and the remaining layout shifts up — rowV does not exist, rowB becomes the
topmost row. This is already demonstrated in patrl_hgf_model.html where the
`is3` flag controls all level-3 SVG elements conditionally.

**κ parameter:** In 2-level mode, κ is absent from the model. The viewer
must not render a κ square in the equations panel or in the notation legend.
The response model section renders identically regardless of HGF level.

**Posterior mode + 2-level:** The idata param_names tuple
`_PARAM_ORDER_2LEVEL` = `("omega_2", "log_beta", "b")` contains no omega_3,
kappa, mu3_0. The viewer must not attempt to annotate absent parameters.
The inspector encodes `param_order` in the JSON so the renderer knows which
params exist.

**Multimodal 2-level (PAT-RL variant `hgf_2level_multimodal_patrl.py`):**
Level structure is still 2-level (no volatility parent), but Level 1 has two
input nodes (u₁, u₂) both coupling to the shared belief node μ₂. This
requires a third layout variant: `n_levels: 2, n_inputs: 2`. The viewer
renders two diamond nodes side-by-side with both value-coupling arrows. This
is already shown in patrl_hgf_model.html under `isMM === true`.

---

## Export Format Scope

| Format | v1.3 scope | Rationale |
|--------|-----------|-----------|
| Standalone HTML (self-contained, all assets inlined) | IN SCOPE | Primary deliverable; email-attachable |
| SVG (extracted from HTML canvas) | SCOPE-C DEFERRED | Requires headless browser or separate renderer; not needed for v1.3 scaffold |
| PNG (rasterized) | SCOPE-C DEFERRED | Same as SVG; defer to v1.4 |
| PDF (publication-quality) | SCOPE-C DEFERRED | v1.4 publication figures milestone |

---

## MVP Definition for v1.3 Scaffold

### Phase 22: Python infrastructure

- [ ] `src/prl_hgf/viz/__init__.py` — module skeleton
- [ ] `src/prl_hgf/viz/inspector.py` — traverses pyhgf.Network or YAML config dict; emits canonical JSON
- [ ] `src/prl_hgf/viz/schema.py` — dataclass or TypedDict for the JSON schema; validates param_order variants
- [ ] Example JSON config for PAT-RL 3-level with phenotypes (pre-fit path)

### Phase 23: HTML template + rendering

- [ ] `figures/hgf_viewer.html` — generic HTML template reading embedded JSON; renders pre-fit mode
- [ ] All TS-01 through TS-10 table stakes in the HTML
- [ ] 2-level vs 3-level graceful toggle working
- [ ] Notation legend present without interaction required

### Phase 24: Posterior overlay + export

- [ ] Post-fit mode: az.summary values annotated on nodes from idata
- [ ] R-hat coloring (D-03) + divergence badge (D-04)
- [ ] Fit method badge (D-07)
- [ ] Self-contained HTML confirmed (TS-08): CDN dependencies inlined or replaced with vanilla SVG
- [ ] `src/prl_hgf/viz/export.py` — `render_viewer(config_path, idata=None) -> Path` API

### Deferred to v1.4

- [ ] SVG / PNG / PDF export buttons (AF-08 resolved)
- [ ] Publication hexagon polish: anchor alignment, print layout
- [ ] Weber 2024 publication-figure visual quality target
- [ ] Phenotype highlighting (D-05) — depends on whether pat_rl.yaml phenotypes land in config JSON

---

## Feature Prioritization Matrix

| Feature | User Value | Implementation Cost | Phase | Priority |
|---------|------------|---------------------|-------|----------|
| TS-01 to TS-04 Node shapes, level bands, edge styles, labels | HIGH | LOW (trivial) | 23 | P1 |
| TS-05 Prior means in pre-fit | HIGH | LOW (1h) | 22/23 | P1 |
| TS-06 2/3-level graceful | HIGH | LOW (1h) | 23 | P1 |
| TS-07 Response model section | HIGH | LOW (1h) | 23 | P1 |
| TS-08 Self-contained HTML | HIGH | MEDIUM (1-3 days) | 24 | P1 |
| TS-09 JSON config schema | HIGH | MEDIUM (1-3 days) | 22 | P1 |
| TS-10 Notation legend | MEDIUM | LOW (trivial) | 23 | P1 |
| D-01 Config-driven inspector | HIGH | MEDIUM (1-3 days) | 22 | P1 |
| D-02 Posterior overlay | HIGH | MEDIUM (1-3 days) | 24 | P1 |
| D-03 R-hat coloring | MEDIUM | LOW (1h) | 24 | P2 |
| D-04 Divergence badge | MEDIUM | LOW (1h) | 24 | P2 |
| D-07 Fit method badge | LOW | LOW (trivial) | 24 | P2 |
| D-05 Phenotype highlighting | MEDIUM | MEDIUM (1-3 days) | 24 | P3 |
| D-06 Click-to-inspect panel | MEDIUM | MEDIUM (1-3 days) | 24 | P3 |

---

## Competitor Feature Analysis

| Feature | pyhgf plot_network | pm.model_to_graphviz | ShinyStan | v1.3 viewer |
|---------|-------------------|---------------------|-----------|-------------|
| Node-kind shapes | Circles only | Plate notation | None | Hex/circle/diamond/square |
| Level layout | Auto (dot) | No levels | No levels | Enforced vertical bands |
| Coupling distinction | YES (some) | NO | NO | YES (solid/dashed + color) |
| Parameter labels | Node index only | Variable name only | Variable name only | Math symbol + prior/posterior |
| Posterior overlay | NO | NO | YES (separate panel) | YES (on node) |
| R-hat coloring | NO | NO | YES (heatmap) | YES (border color) |
| Self-contained HTML | NO (Jupyter) | NO (Jupyter) | NO (Shiny server) | YES |
| Config-driven | NO | NO | NO | YES |
| 2/3-level graceful | N/A | N/A | N/A | YES |

---

## Sources

**HIGH confidence (codebase artifacts, confirmed by direct read):**
- `figures/patrl_hgf_model.html` — seed HTML defining visual language, node shapes,
  color palette, 2/3-level logic, response model section
- `figures/hgf_model_explorer.jsx` — pick_best_cue variant
- `src/prl_hgf/models/hgf_3level_patrl.py` — node layout: INPUT_NODE=0,
  BELIEF_NODE=1, VOLATILITY_NODE=2
- `src/prl_hgf/fitting/laplace_idata.py` — canonical param_order tuples,
  idata structure, sample_stats.laplace marker
- `configs/pat_rl.yaml` — YAML config structure for pre-fit JSON path
- `docs/HANDOFF_pyhgf_plot_network_extension.md` — original spec for the
  node shape conventions and what plot_network() lacks
- `src/prl_hgf/gui/explorer.py` — confirms scope boundary: ipywidgets GUI is
  parameter exploration, not structure viewer

**MEDIUM confidence (WebFetch confirmed from official docs):**
- pyhgf 0.2.8 plot_network: confirmed to be graphviz-based, no parameter
  labels, no posterior overlay, Jupyter-only output
  (computationalpsychiatry.github.io/pyhgf/notebooks/0.2-Creating_networks.html)
- ArviZ az.summary() column names: mean, sd, hdi_3%, hdi_97%, r_hat,
  ess_bulk, ess_tail (python.arviz.org/en/v0.21.0/api/generated/arviz.summary.html)
- pm.model_to_graphviz: confirmed structure-only, no posteriors, Jupyter-only
  (pymc.io/projects/docs/en/v5.6.1/api/generated/pymc.model_to_graphviz.html)

**LOW confidence (training knowledge, not independently verified for 2025):**
- DCM plotting conventions (boxes for hidden states, labeled coupling arrows)
- ShinyStan tabbed diagnostic dashboard structure

---

*Feature research for: v1.3 Generic HGF Viewer*
*Researched: 2026-04-24*
