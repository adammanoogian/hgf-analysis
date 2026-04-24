# Handoff: Extending pyhgf `plot_network()` for Publication Figures

## Context

This document is a self-contained brief for a separate conversation about
extending or wrapping pyhgf's `plot_network()` to generate the kind of
annotated, publication-quality HGF graphical model figures needed for the
HEART2ADAPT project. The goal is to produce figures like the one described
below directly from the model config — so the figure and the simulation
always stay in sync.

---

## What pyhgf's `plot_network()` currently does

pyhgf represents HGF models as networks of nodes. The `plot_network()`
method (in `pyhgf.plots`) uses graphviz or matplotlib to render the
computational graph:

- **Nodes** are drawn as circles, labeled by index and type (continuous
  value node, binary input node, etc.)
- **Edges** show value coupling and volatility coupling between nodes
- The layout is automatic (graphviz dot/neato)
- Node colors indicate node type (input, value, volatility)
- No annotations for: parameter symbols (ω, κ, ϑ), belief symbols (μ₂, σ₂),
  prediction error labels (ε₂, ε₃), or neural correlate mappings

**Key source files to examine:**
- `pyhgf/plots.py` — main plotting functions
- `pyhgf/model.py` — the `Network` class and its `.plot_network()` method
- See: https://computationalpsychiatry.github.io/pyhgf/notebooks/0.2-Creating_networks.html

## What we need for HEART2ADAPT

A figure that shows:

1. **Standard graphical model notation** — hexagons for hidden states (x₁,
   x₂, x₃), circles for beliefs (μ₂, μ₃), diamonds for observations (u),
   squares for fixed parameters (ω, κ, ϑ)
2. **Hierarchical layout** — level 3 (volatility) at top, level 1 (outcome)
   at bottom, vertical arrows showing coupling
3. **Neural correlate mapping** — arrows from PE quantities to brain region
   labels in the right margin (ε₃ → AMY, ε₂ → VS)
4. **Response model section** — below a separator line, showing the decision
   equation with autonomic modulation inputs
5. **Color coding by level** — coral for level 3 (volatility/AMY pathway),
   teal for level 2 (contingency/VS pathway), blue for level 1 (outcome)

## The key design question: extend vs. wrap?

### Option A: Extend `plot_network()` directly

**Pros:**
- Other pyhgf users benefit
- Works with arbitrary network topologies (not just 3-level binary HGF)
- Stays upstream-compatible

**Cons:**
- The publication figure style is very specific — hexagons, diamonds, neural
  mappings are not general pyhgf concerns
- Would need to add a `style='publication'` or `style='graphical_model'`
  parameter
- pyhgf's node representation doesn't currently store metadata like
  `neural_target` or `pe_symbol` — you'd need to extend the node schema

**What this would look like in practice:**

> **Superseded 2026-04-24**: The concrete shape lives in
> `src/prl_hgf/viz/inspector.py::inspect_network` and will be typed
> by `src/prl_hgf/viz/schema.py::NetworkSpec` (Phase 22 plan 22-03).
> The pseudo-API below is retained for historical context only.

```python
# Hypothetical extended API
model.plot_network(
    style="graphical_model",
    node_shapes={
        "value_parent": "hexagon",
        "input": "diamond",
    },
    annotations={
        "node_2": {"pe_symbol": "ε₂", "neural_target": "VS"},
        "node_3": {"pe_symbol": "ε₃", "neural_target": "AMY"},
    },
    response_model={
        "equation": "σ((β + α·Δhr) · EV + b + γ·Δhr)",
        "inputs": ["beliefs", "magnitudes", "bradycardia"],
    },
)
```

### Option B: Thin wrapper in heart2adapt-sim

**Pros:**
- No upstream dependency
- Full control over layout and styling
- Can use matplotlib, svgwrite, or raw SVG strings
- Neural mappings and response model are project-specific anyway

**Cons:**
- Doesn't benefit pyhgf community
- Duplicates some node traversal logic
- If model structure changes in pyhgf, wrapper might break

**What this would look like:**
```python
# In heart2adapt-sim/plotting/hgf_figure.py
from heart2adapt.config import load_hgf_model

def plot_hgf_graphical_model(config_path, save=None):
    cfg = load_hgf_model(config_path)
    # Read levels, parameters, neural mappings from YAML
    # Generate SVG/matplotlib figure
    # No pyhgf import needed
```

### Option C: Hybrid — read FROM a fitted pyhgf model, render independently

**Pros:**
- Uses pyhgf's actual fitted model object as input
- But renders with custom publication-quality code
- Can overlay posteriors on the figure (e.g., show μ₂ trajectory)

**What this would look like:**
```python
from pyhgf.model import Network
from heart2adapt.plotting import plot_hgf_figure

# After fitting
model = Network()  # ... define and fit ...
results = model.fit(data)

# Extract structure + posteriors from the fitted model
plot_hgf_figure(
    model=model,
    results=results,
    neural_mapping={"node_2": "VS", "node_3": "AMY"},
    response_model=response_model_config,
    save="figures/fig2_hgf.svg",
)
```

## My recommendation (for discussion)

Option C (hybrid) is probably right. Here's the reasoning:

1. The publication figure needs to show things pyhgf doesn't know about
   (neural mappings, response model equations, PE formulas). These are
   project-specific and shouldn't be in pyhgf.

2. But the figure should be able to read FROM a pyhgf model object — so if
   you change the model structure (add a node, change coupling), the figure
   updates automatically without manual YAML editing.

3. The rendering layer should be independent of pyhgf's internal graphviz
   calls — you want full control over shapes, colors, positions.

4. The adapter pattern: `pyhgf.Network → dict → render()`. The dict is the
   same format as the YAML config, so you can also generate figures from
   config alone (for planning/proposals before fitting).

## What to build (task breakdown)

### Task 1: pyhgf model inspector
A function that takes a fitted `pyhgf.Network` and extracts:
- Number of levels
- Node types (binary input, continuous value, volatility)
- Coupling structure (which nodes couple to which, value vs volatility)
- Parameter names and values per node
- Edge weights (κ values)

Output: a plain dict matching the `hgf_model.yaml` schema.

### Task 2: Graphical model renderer
A function that takes the dict from Task 1 plus neural mapping annotations
and produces an SVG or matplotlib figure using:
- Standard graphical model notation (hexagons, circles, diamonds, squares)
- Hierarchical top-to-bottom layout
- Color coding by level (using the project color scheme)
- Neural correlate arrows in the right margin
- Response model section below a separator

### Task 3: Overlay fitted posteriors (optional, later)
Extend the renderer to optionally overlay:
- Posterior distributions on parameter squares (violin or CI bar)
- Recovered belief trajectories as small inset time series
- Model comparison results (winning model highlighted)

## Resolved Questions (Verified 2026-04-24 against pyhgf 0.2.8)

### 1. Does pyhgf expose enough internal structure?

Verified 2026-04-24 against pyhgf 0.2.8. Yes.
`network.attributes[idx]` (dict[str, Any]),
`network.edges[idx]` (AdjacencyLists NamedTuple with int
`node_type` + Optional tuple[int, ...] for value_parents,
volatility_parents, value_children, volatility_children),
`network.input_idxs` (tuple[int, ...]), `network.n_nodes` (int).
All safe in plain Python — no JAX tracing required. See
`src/prl_hgf/viz/inspector.py` module-level comment for the full
attribute-path table and the node_type int->string mapping.

### 2. matplotlib vs raw SVG?

Verified 2026-04-24 against pyhgf 0.2.8. Deferred to Phase 23 (out of
scope for the Phase 22 inspector scaffold). The Phase 22 inspector is
renderer-agnostic — it emits a plain dict / NetworkSpec; Phase 23
chooses the render path.

### 3. Should this be a PR to pyhgf?

Verified 2026-04-24 against pyhgf 0.2.8. Deferred to v1.5+. v1.3 ships
project-internal under `src/prl_hgf/viz/`. Upstream contribution
considered once the schema stabilises across more tasks.

### 4. How to handle the response model?

Verified 2026-04-24 against pyhgf 0.2.8. Deferred to Phase 24 (POST-01
milestone: posterior visual overlay integration). Phase 22 emits only
the HGF topology; response-model parameters (β, ζ, b) are in the prior
block of the fixture JSON but not wired into the graph.

### 5. 2-level vs 3-level switching?

Verified 2026-04-24 against pyhgf 0.2.8. Resolved — no explicit switch
needed. The BFS terminates naturally at whichever level the Network
topology ends (`build_2level_network_patrl()` has 2 nodes,
`build_3level_network_patrl()` has 3). The inspector auto-adapts
because it traverses edges, not a fixed level count.

## pyhgf resources

- Docs: https://computationalpsychiatry.github.io/pyhgf/
- Source: https://github.com/ilabcode/pyhgf
- Network tutorial: https://computationalpsychiatry.github.io/pyhgf/notebooks/0.2-Creating_networks.html
- Plotting source: look in `pyhgf/plots.py` or `pyhgf/visualization/`
- Key paper: Weber et al. (2024) "The generalized Hierarchical Gaussian
  Filter" — describes the node-based network architecture

## Current figure target

The SVG figure produced in the HEART2ADAPT design conversation (Fig 2) uses:
- Coral (#FAECE7 fill, #993C1D stroke) for level 3 / volatility
- Teal (#E1F5EE fill, #0F6E56 stroke) for level 2 / contingency
- Blue (#E6F1FB fill, #185FA5 stroke) for level 1 / outcome
- Purple (#EEEDFE fill, #534AB7 stroke) for response model
- 14px Anthropic Sans for node labels, 12px for annotations
- Hexagons: `<polygon points="x-25,y-15 x,y-25 x+25,y-15 x+25,y+15 x,y+25 x-25,y+15"/>`
- Diamonds: `<polygon points="x,y-20 x+25,y x,y+20 x-25,y"/>`
- Circles: `<circle r="22"/>` for beliefs, `r="18"` dashed for uncertainty
- Squares: `<rect width="26" height="26"/>` for fixed parameters

These specs should be preserved in whatever rendering approach is chosen.

## Project context

This is part of the HEART2ADAPT fMRI proposal — an approach-avoidance
learning study using a 3-level HGF with autonomic (bradycardia) modulation.
The master proposal doc is at `HEART2ADAPT_master_proposal.md`. The GSD
(task tracker) for prl_hgf is at `GSD_prl_hgf.yaml`. The simulation plan
with DCM integration is at `HEART2ADAPT_simulation_plan.md`.
