# Architecture Research: `src/prl_hgf/viz/` — Generic HGF Viewer

**Domain:** Scientific Python visualization module — HGF network inspector + HTML export
**Researched:** 2026-04-24
**Confidence:** HIGH (all claims grounded in direct code inspection of existing modules)

---

## System Overview

```
┌───────────────────────────────────────────────────────────────────────────┐
│                          CALLER LAYER                                      │
│  scripts/  ·  notebooks/  ·  tests/viz/                                   │
└──────────────────────┬────────────────────────────────────────────────────┘
                       │ imports from viz/
┌──────────────────────▼────────────────────────────────────────────────────┐
│                       src/prl_hgf/viz/                                     │
│                                                                            │
│  ┌──────────────┐   ┌──────────────┐   ┌──────────────┐   ┌────────────┐  │
│  │ inspector.py │──▶│   roles.py   │──▶│  schema.py   │──▶│ export.py  │  │
│  │              │   │              │   │              │   │            │  │
│  │ Network →    │   │ assigns node │   │ NetworkSpec  │   │ inject →   │  │
│  │ raw dict     │   │ levels/roles │   │ @dataclass   │   │ HTML str   │  │
│  └──────────────┘   └──────────────┘   └──────────────┘   └────────────┘  │
│         ▲                                     ▲                            │
│         │                                     │ (optional, post-fit)       │
│         │                                     │ idata posteriors           │
└──────────────────────────────────────────────────────────────────────────-┘
                       │
        ┌──────────────┴───────────────────────────┐
        │                                           │
┌───────▼──────────────┐               ┌───────────▼──────────────────────┐
│  src/prl_hgf/models/ │               │  src/prl_hgf/analysis/           │
│  (Network builders)  │               │  (ArviZ InferenceData accessors) │
│  IMPORTED BY viz/    │               │  IMPORTED BY viz/ (post-fit only) │
└──────────────────────┘               └──────────────────────────────────┘
```

The dependency arrow is one-way: `viz/` imports from `models/` and `analysis/`;
nothing in `models/`, `fitting/`, `env/`, `analysis/`, or `simulation/` imports
from `viz/`.

---

## File-by-File Component Breakdown

### `src/prl_hgf/viz/__init__.py`

**Purpose:** Public API surface. Re-exports the two caller-facing entry points.

```python
from prl_hgf.viz.inspector import inspect_network
from prl_hgf.viz.export import render_viewer_html
```

Nothing else is exported. All internal types (`NetworkSpec`, role constants)
stay inside the package unless a caller explicitly imports them by path.

---

### `src/prl_hgf/viz/inspector.py`

**Purpose:** Translate a `pyhgf.model.Network` object into a plain Python dict
(`RawNetworkDict`) that is topology-complete and pyhgf-API-free.

**Public API:**

```python
def inspect_network(network: Network) -> RawNetworkDict:
    """Extract topology and parameters from a pyhgf Network.

    Parameters
    ----------
    network : pyhgf.model.Network
        A constructed (but not necessarily forward-passed) Network.
        Must have `network.attributes`, `network.edges`, and
        `network.input_idxs` populated (these are set at construction time,
        before any call to `input_data`).

    Returns
    -------
    RawNetworkDict
        Plain dict with keys:
            "n_nodes": int
            "input_idxs": tuple[int, ...]
            "nodes": list[dict]   # one per node index
                each node dict has:
                    "idx": int
                    "attributes": dict   # full network.attributes[idx] copy
                    "value_parents": tuple[int, ...] | None
                    "value_children": tuple[int, ...] | None
                    "volatility_parents": tuple[int, ...] | None
                    "volatility_children": tuple[int, ...] | None
    """
```

**What it does NOT do:** assign levels, assign roles, read idata, render HTML.
It is a thin structural reader.

**Imports:** `pyhgf.model.Network` only. No `prl_hgf` imports.

**Type alias (module-level):**

```python
RawNetworkDict = dict  # narrow alias for documentation; not a runtime type
```

**Accessed pyhgf internals (confirmed in existing code):**
- `network.attributes[idx]` — node parameter dict (confirmed: `hierarchical_patrl.py` line ~933 reads `attrs[VOLATILITY_NODE]`)
- `network.edges[idx].volatility_parents` — tuple or None
- `network.edges[idx].value_parents` — tuple or None
- `network.edges[idx].volatility_children` — tuple or None
- `network.edges[idx].value_children` — tuple or None
- `network.input_idxs` — confirmed in every model builder

**Edge case: pyhgf 0.2.8 edges may be None-typed.** The inspector must
guard with `getattr(edge_obj, "volatility_parents", None)` rather than direct
attribute access, because not all edge objects guarantee all four fields exist.
This is the same defensive pattern used in `export_trajectories.py` via
`_safe_temp()`.

**Scope C flag:** This file is ~60 lines. No rendering, no SVG, no JSON
serialisation. Deliberately thin.

---

### `src/prl_hgf/viz/roles.py`

**Purpose:** Walk the raw topology dict and assign a `(level, role)` pair to
every node. Output is a `dict[int, NodeRole]` mapping node index to role.

**Public API:**

```python
@dataclass(frozen=True)
class NodeRole:
    level: int            # 1-indexed from observations upward
    role: str             # "input" | "value" | "volatility"
    branch_idx: int | None  # None if node is shared (e.g., shared vol parent)

def assign_roles(raw: RawNetworkDict) -> dict[int, NodeRole]:
    """Assign HGF level and structural role to each node.

    Parameters
    ----------
    raw : RawNetworkDict
        Output of inspect_network().

    Returns
    -------
    dict[int, NodeRole]
        Keyed by node index.
    """
```

**Imports:** `prl_hgf.viz.inspector` (for the `RawNetworkDict` type alias only;
no circular risk since `inspector.py` does not import from `roles.py`).

**Level/role inference algorithm (concrete pseudocode):**

```
ALGORITHM assign_roles(raw):

  input_idxs  = set(raw["input_idxs"])
  nodes_by_idx = {n["idx"]: n for n in raw["nodes"]}

  # Step 1 — seed input nodes at level 1
  level = {idx: 1 for idx in input_idxs}
  role  = {idx: "input" for idx in input_idxs}

  # Step 2 — BFS / iterative upward propagation
  # Process nodes in order of increasing index (pyhgf builds bottom-up by
  # construction; higher indices are always parents of lower indices in all
  # existing builders: hgf_2level, hgf_3level, hgf_2level_patrl,
  # hgf_3level_patrl). This assumption is safe for existing models and
  # should be documented as an invariant.
  queue = list(input_idxs)
  visited = set(input_idxs)

  while queue:
    idx = queue.pop(0)
    node = nodes_by_idx[idx]
    current_level = level[idx]

    for parent_idx in (node["value_parents"] or ()):
      candidate = current_level + 1
      if parent_idx not in level or level[parent_idx] < candidate:
        level[parent_idx] = candidate
        role[parent_idx]  = "value"
      if parent_idx not in visited:
        visited.add(parent_idx)
        queue.append(parent_idx)

    for parent_idx in (node["volatility_parents"] or ()):
      candidate = current_level + 1
      if parent_idx not in level or level[parent_idx] < candidate:
        level[parent_idx] = candidate
        role[parent_idx]  = "volatility"
      if parent_idx not in visited:
        visited.add(parent_idx)
        queue.append(parent_idx)

  # Step 3 — branch assignment
  # A node is "shared" if it appears in the volatility_parents of MORE THAN
  # ONE distinct branch. Detect by counting reverse edges.
  volatility_parent_ref_count: dict[int, int] = {}
  for node in raw["nodes"]:
    for vp in (node["volatility_parents"] or ()):
      volatility_parent_ref_count[vp] = volatility_parent_ref_count.get(vp,0)+1

  # Assign branch_idx: follow value chain upward from each input_idx.
  # A volatility parent shared across > 1 value nodes gets branch_idx=None.
  branch_of: dict[int, int | None] = {}
  for b_idx, inp_idx in enumerate(sorted(input_idxs)):
    _walk_branch_up(inp_idx, b_idx, nodes_by_idx, branch_of)

  for shared_idx, count in volatility_parent_ref_count.items():
    if count > 1:
      branch_of[shared_idx] = None   # shared volatility parent

  return {
    idx: NodeRole(
      level=level[idx],
      role=role.get(idx, "value"),
      branch_idx=branch_of.get(idx)
    )
    for idx in level
  }
```

**HGF-specific edge cases handled:**

1. **Shared volatility parent (pick_best_cue 3-level):** Node 6 is the
   `volatility_parent` of nodes 1, 3, and 5. `branch_idx` is set to `None`.
   The level assigned is `max(level[1], level[3], level[5]) + 1 = 3` because
   the BFS processes all three children before node 6 is finalised. The
   `level[parent] < candidate` guard ensures level monotonically increases to
   the correct maximum.

2. **PAT-RL single-branch 3-level:** Node 2 is the `volatility_parent` of
   node 1 only. `branch_idx=0`. Level = 3.

3. **PAT-RL 2-level:** No volatility parents. Only two nodes. Input=0,
   level=1; belief=1, level=2.

4. **Multimodal PAT-RL (hgf_2level_multimodal_patrl):** Multiple input nodes
   may share a single belief node. The BFS will converge on the correct level
   via the `candidate > existing` guard.

**Role disambiguation:** A node with both `value_parents` and `volatility_parents`
in the same level cannot occur in any existing builder (pyhgf does not allow a
node to be both a value child and volatility child of the same parent). No
special handling needed.

---

### `src/prl_hgf/viz/schema.py`

**Purpose:** Hold the typed, validated intermediate representation that travels
from the inspector/roles layer to the export layer. Also optionally attaches
posterior summary data from ArviZ idata.

**Decision: `@dataclass(frozen=True)` — not TypedDict, not pydantic.**

Rationale grounded in the existing codebase conventions:
- All existing config objects (`PATRLConfig`, `HazardConfig`, `PhaseConfig`)
  are `@dataclass(frozen=True)`. This project does not use pydantic anywhere.
- `TypedDict` provides no validation; a viewer receiving corrupt data would
  silently produce a broken HTML file — a hard-to-debug failure mode.
- `@dataclass` with `__post_init__` validation (same pattern as
  `pat_rl_config.py`) makes invalid state unrepresentable and produces
  informative `ValueError` messages (matching the project's "expected vs
  actual" error convention).
- Pydantic is not in `pyproject.toml`; adding it for a single module violates
  the "prefer existing tools" principle.

**Public API:**

```python
@dataclass(frozen=True)
class NodeSpec:
    idx: int
    level: int                    # 1 = observation, n = top
    role: str                     # "input" | "value" | "volatility"
    branch_idx: int | None        # None for shared nodes
    attributes: dict              # raw pyhgf node_parameters copy
    posterior_summary: dict | None  # {"mean": float, "hdi_low": float, ...}
                                    # per free param; None if pre-fit

@dataclass(frozen=True)
class NetworkSpec:
    task_name: str                # "pat_rl" | "pick_best_cue" | user-supplied
    n_levels: int                 # inferred: max(node.level for all nodes)
    n_branches: int               # inferred: max(branch_idx) + 1 (excl. None)
    nodes: tuple[NodeSpec, ...]
    input_idxs: tuple[int, ...]
    has_shared_volatility: bool   # True when any node.branch_idx is None
    is_post_fit: bool             # True if any NodeSpec has posterior_summary

def build_network_spec(
    raw: RawNetworkDict,
    roles: dict[int, NodeRole],
    task_name: str,
    idata: az.InferenceData | None = None,
    participant_id: str | None = None,
) -> NetworkSpec:
    """Assemble a NetworkSpec from inspector + roles output.

    If idata is provided, posterior_summary is populated per node
    from the named pyhgf-parameter attributes (omega_2, omega_3, kappa,
    mu3_0) matched to their node indices.

    Parameters
    ----------
    raw : RawNetworkDict
    roles : dict[int, NodeRole]
    task_name : str
    idata : az.InferenceData or None
        If None, produces pre-fit spec (all posterior_summary = None).
    participant_id : str or None
        Required if idata is provided and has a participant_id coordinate.

    Returns
    -------
    NetworkSpec
    """
```

**idata coordinate access pattern:** Uses the same `participant_id` coordinate
path confirmed in `export_trajectories.py` (PAT-RL) and `laplace_idata.py`.
The pick_best_cue path uses `"participant"` (Decision 131). The schema builder
accepts a `coord_name` parameter defaulting to `"participant_id"` to handle
both without importing either config module:

```python
def build_network_spec(..., coord_name: str = "participant_id") -> NetworkSpec:
    ...
```

This keeps `schema.py` task-agnostic — it reads whatever coordinate name the
caller supplies.

**Imports:**
- `prl_hgf.viz.inspector` (`RawNetworkDict`)
- `prl_hgf.viz.roles` (`NodeRole`)
- `arviz` (TYPE_CHECKING only, same pattern as `export_trajectories.py`)

**Does NOT import:** `pat_rl_config.py`, `task_config.py`, any `models/` module.

---

### `src/prl_hgf/viz/export.py`

**Purpose:** Accept a `NetworkSpec` and a template HTML path; inject data into
the template via `<script>` tag replacement; return a self-contained HTML string.

**Scope C boundary:** This file does SVG/JS injection only. It does NOT
re-implement any graphical logic. The template (`patrl_hgf_model.html`) already
contains the React rendering code. Export injects data into that existing code.

**Public API:**

```python
def render_viewer_html(
    spec: NetworkSpec,
    template_path: Path | None = None,
) -> str:
    """Render a self-contained HTML viewer string.

    Parameters
    ----------
    spec : NetworkSpec
        Assembled network specification (pre-fit or post-fit).
    template_path : Path or None
        Path to the HTML template file. Defaults to
        config.FIGURES_DIR / "patrl_hgf_model.html".

    Returns
    -------
    str
        Complete HTML document as a string.  Write to disk with
        Path(output).write_text(html, encoding="utf-8").

    Raises
    ------
    FileNotFoundError
        If template_path does not exist.
    ValueError
        If a required injection marker is missing from the template.
    """
```

**Supporting function (internal but tested):**

```python
def _inject_markers(html: str, substitutions: dict[str, str]) -> str:
    """Replace VIZ_INJECT markers in an HTML string.

    Parameters
    ----------
    html : str
    substitutions : dict[str, str]
        Keys are marker names (without delimiters); values are replacement text.

    Returns
    -------
    str
        HTML with all markers replaced.

    Raises
    ------
    ValueError
        If any key in substitutions has no corresponding marker in html.
    """
```

**Imports:**
- `prl_hgf.viz.schema` (`NetworkSpec`)
- `config` (`FIGURES_DIR`)
- `json`, `re`, `pathlib.Path`

**Does NOT split into sub-files.** The "regex injection vs HTML assembly"
split (mentioned in the milestone brief) is over-engineered for scope C.
The entire export is ~80 lines. A sub-package (`export/regex_injection.py`,
`export/html_assembly.py`) would add two `__init__.py` files and three import
paths for a module that fits on one screen. The internal helper `_inject_markers`
provides the same separation at zero overhead.

---

## Injection Marker Convention

**Decision: `<script type="application/json" id="viz-{name}">...</script>` tags.**

Rationale for choosing this over alternatives:

| Option | Why Rejected |
|--------|-------------|
| HTML comments `<!-- VIZ:NODES -->` | Comments are stripped by HTML minifiers; not parseable by `json.loads` directly; BeautifulSoup test requires full parse |
| `__VIZ_NODES__` string tokens | Invisible in rendered HTML; no semantic boundary; regex must avoid matching JavaScript source code containing similar strings |
| `data-` attributes | Limited to short strings; breaks for large JSON payloads (>64KB); requires element to exist in DOM |
| `<script type="application/json" id="viz-{name}">` | Standard pattern; parseable via `document.getElementById("viz-nodes").textContent`; survives all HTML formatters; testable with both `json.loads` and `BeautifulSoup`; zero collision risk with React source |

**Marker names (confirmed against template structure):**

| Marker `id` | Content | Injected by |
|-------------|---------|-------------|
| `viz-network-spec` | Full `NetworkSpec` as JSON | `export.py` always |
| `viz-posterior-summary` | Per-node posterior dict or `null` | `export.py` when `spec.is_post_fit` |

**Template location of markers:** Immediately before `</head>`, after existing
`<style>` block. The React component reads them via:

```javascript
const spec = JSON.parse(
  document.getElementById("viz-network-spec")?.textContent || "null"
);
```

This is a non-breaking addition to the existing template: if the script tags
are absent (legacy template), `spec` is `null` and the viewer falls back to
its hardcoded defaults (current behaviour preserved).

**Injection implementation (no regex needed for the primary path):**

```python
import json, re

_MARKER_RE = re.compile(
    r'(<script\s+type="application/json"\s+id="(?P<name>[^"]+)">[^<]*</script>)',
    re.DOTALL,
)

def _inject_markers(html: str, substitutions: dict[str, str]) -> str:
    present = {m.group("name") for m in _MARKER_RE.finditer(html)}
    missing = set(substitutions) - present
    if missing:
        raise ValueError(
            f"Template missing markers: {sorted(missing)}. "
            f"Found: {sorted(present)}"
        )
    def replace(m):
        name = m.group("name")
        if name in substitutions:
            return f'<script type="application/json" id="{name}">{substitutions[name]}</script>'
        return m.group(0)
    return _MARKER_RE.sub(replace, html)
```

**Test approach (both methods):**

```python
# Method 1: raw string assert (fast unit test)
def test_inject_nodes_round_trip():
    template = '<script type="application/json" id="viz-network-spec"></script>'
    payload = json.dumps({"n_levels": 3})
    result = _inject_markers(template, {"viz-network-spec": payload})
    assert '"n_levels": 3' in result

# Method 2: BeautifulSoup parse (integration test)
def test_inject_parseable_as_json():
    from bs4 import BeautifulSoup
    html = render_viewer_html(spec, template_path=minimal_template)
    soup = BeautifulSoup(html, "html.parser")
    tag = soup.find("script", {"id": "viz-network-spec"})
    data = json.loads(tag.string)
    assert data["n_levels"] == spec.n_levels
```

BeautifulSoup is not currently in `pyproject.toml`. The `test_inject_nodes_round_trip`
raw-string test is sufficient for CI; the BeautifulSoup test can be marked
`@pytest.mark.optional` and run only when `beautifulsoup4` is installed.

---

## Data Flow Diagrams

### Pre-Fit Path

```
JSON/YAML config
      │
      ▼
env/pat_rl_config.py:load_pat_rl_config()  OR  env/task_config.py:load_config()
      │
      ▼ (caller constructs Network — viz/ does NOT call model builders)
models/hgf_3level_patrl.py:build_3level_network_patrl(omega_2, omega_3, kappa, mu3_0)
      │
      ▼  pyhgf.model.Network object (topology-complete, no forward pass needed)
viz/inspector.py:inspect_network(network)
      │
      ▼  RawNetworkDict (plain dict, no pyhgf types)
viz/roles.py:assign_roles(raw)
      │
      ▼  dict[int, NodeRole]
viz/schema.py:build_network_spec(raw, roles, task_name="pat_rl", idata=None)
      │
      ▼  NetworkSpec (is_post_fit=False, all posterior_summary=None)
viz/export.py:render_viewer_html(spec, template_path=FIGURES_DIR/"patrl_hgf_model.html")
      │
      ▼  str (complete HTML)
Path("output/hgf_viewer_patrl_prefit.html").write_text(html, encoding="utf-8")
```

**Key design decision:** The viewer does NOT call model builders. The caller
constructs the `Network` with default or specified parameters and passes it to
`inspect_network`. This avoids the viewer needing to know which builder to call
for each task — that knowledge lives in `models/` and the calling script.

**Why this is correct:** `export_trajectories.py` follows the same pattern:
the caller selects the builder (`build_2level_network_patrl` vs
`build_3level_network_patrl`) and passes the result to the exporter. The viewer
should not be smarter than the exporter.

---

### Post-Fit Path

```
JSON/YAML config  +  az.InferenceData from fitting/laplace_idata.py (or NUTS)
      │                          │
      ▼                          │
(same Network construction as   │
 pre-fit path)                  │
      │                          │
      ▼                          ▼
viz/inspector.py:inspect_network(network)
viz/roles.py:assign_roles(raw)
viz/schema.py:build_network_spec(
    raw, roles,
    task_name="pat_rl",
    idata=idata,                      ← ArviZ InferenceData injected here
    participant_id="P001",            ← optional: show one subject's posteriors
    coord_name="participant_id"       ← PAT-RL; "participant" for pick_best_cue
)
      │
      ▼  NetworkSpec (is_post_fit=True, posterior_summary populated per node)
viz/export.py:render_viewer_html(spec)
      │
      ▼  str (complete HTML with both network topology and posterior data)
Path("output/hgf_viewer_P001_postfit.html").write_text(html, encoding="utf-8")
```

**idata access in `schema.py`:** Uses the same coordinate pattern as
`export_trajectories.py:export_subject_parameters()`. The `posterior_summary`
dict per `NodeSpec` is populated by matching pyhgf attribute names to known
parameter names:

```
node.attributes["tonic_volatility"]  → parameter key "omega_2" (belief/vol nodes)
node.attributes["mean"]              → parameter key "mu3_0" (volatility node only)
```

The mapping from node index to parameter name is task-specific and must be
supplied by the caller (or inferred from `task_name` in `schema.py` via a
small lookup table). This is the only task-specific logic in `schema.py`, and
it is confined to the `_param_for_node` helper function.

---

## Integration Points

### What `viz/` imports FROM (explicit list)

| Module imported | What is used | File in viz/ |
|----------------|-------------|--------------|
| `pyhgf.model.Network` | type annotation + attribute access | `inspector.py` |
| `config.FIGURES_DIR` | default template path | `export.py` |
| `arviz` (TYPE_CHECKING only) | `az.InferenceData` type hint | `schema.py` |
| `json`, `re`, `pathlib.Path` | standard library | `export.py` |
| `dataclasses` | `@dataclass` | `schema.py`, `roles.py` |

**`viz/` does NOT import from `models/`, `fitting/`, `env/`, `analysis/`,
`simulation/`, `gui/`, or `power/`.** The caller is responsible for constructing
`Network` objects using `models/` builders.

### What imports FROM `viz/` (allowed)

| Caller | Imports | Notes |
|--------|---------|-------|
| `scripts/` pipeline scripts | `render_viewer_html`, `inspect_network` | Entry points |
| `tests/test_viz_*.py` | any public symbol | Testing only |
| `notebooks/` | any public symbol | Interactive use |

**Nothing in the existing `src/prl_hgf/` package imports from `viz/`.** This is
an intentional one-way dependency.

---

## Parallel-Stack Invariant Audit

**Question:** Does `viz/` need to import from `pat_rl_config.py` AND
`task_config.py`? Does this create coupling between the two stacks?

**Answer: No import from either config module is required.**

The viewer is a structural reader. It inspects a `Network` object that has
already been built by the caller. The `Network` object contains no reference to
`PATRLConfig` or `AnalysisConfig` — it is a pure pyhgf object.

The only task-specific item the viewer needs is `task_name` (a `str`), which
the caller supplies. The viewer never needs to read YAML, call a config loader,
or know the difference between PAT-RL and pick_best_cue config hierarchies.

**Parallel-stack invariant check:**

| File | Imports pat_rl_config? | Imports task_config? | Creates coupling? |
|------|----------------------|---------------------|------------------|
| `inspector.py` | No | No | No |
| `roles.py` | No | No | No |
| `schema.py` | No | No | No |
| `export.py` | No | No | No |

**The viewer works equally for both task stacks because it reads from a
`pyhgf.Network` object, which is task-agnostic.** A pick_best_cue 3-level
network (7 nodes, shared volatility parent) and a PAT-RL 3-level network
(3 nodes, single volatility parent) both expose the same pyhgf `edges` and
`attributes` API. The roles algorithm handles both topologies without any
task-specific branching.

The one place where task context matters — the `coord_name` for idata access
— is a `str` parameter passed by the caller, not a config import. This is the
same pattern Decision 131 established: the producer (PAT-RL exporter) uses
`"participant_id"` and the consumer (viewer) accepts whatever name is supplied.

---

## Dependency DAG Between the Four Files

```
inspector.py
    │
    ▼ (imports RawNetworkDict type alias)
roles.py
    │
    ▼ (imports RawNetworkDict, NodeRole)
schema.py
    │
    ▼ (imports NetworkSpec)
export.py
```

The DAG is a linear chain. No cycles. No shared mutable state. Each module can
be imported and unit-tested in isolation.

**Corollary:** `inspector.py` and `roles.py` have zero `prl_hgf` dependencies —
they can be tested with a synthetic `Network`-like dict without importing any
fitting or config code.

---

## Do the Existing Modules Need Changes?

### `fitting/hierarchical_patrl.py` and `fitting/laplace_idata.py`

**No changes required.** The idata format emitted by `build_idata_from_laplace`
already has:
- `posterior` group with per-participant arrays
- `"participant_id"` coordinate (confirmed: `laplace_idata.py` line ~253)
- `beta`, `omega_2`, `omega_3`, `kappa`, `mu3_0` as variables

`schema.py:build_network_spec` reads these fields with the same `idata.posterior[var].sel(participant_id=pid)` pattern already confirmed in
`export_trajectories.py:export_subject_parameters`. No richer idata format is
needed.

**Slow-path fallback:** If a posterior variable is absent from `idata.posterior`
(e.g., `omega_3` when using the 2-level model), `schema.py` sets
`posterior_summary=None` for that node rather than raising. This matches the
`_safe_temp` pattern in `export_trajectories.py`.

### `env/pat_rl_config.py` and `env/task_config.py`

**No changes required.** No `to_viewer_json()` method is needed. The viewer
consumes the `Network` object directly; config values that appear in the figure
(parameter priors, task structure) are either already in `network.attributes` or
are not the viewer's concern (task structure is for the task-specific display
in the template, which is hardcoded in the React component).

The JSON fixture mentioned in the milestone brief is exactly that — a test
fixture, not a new input format. The viewer reads `Network` objects and `idata`,
not JSON task configs. The existing YAML configs remain the source of truth for
task structure.

---

## Test Layout

**Convention:** Flat `tests/` directory (confirmed — no subdirectories exist
under `tests/`). All existing test files are at the top level:
`tests/test_models_patrl.py`, `tests/test_export_trajectories.py`, etc.

**New test files (matching convention):**

```
tests/
  test_viz_inspector.py    # unit: inspect_network on 2level and 3level networks
  test_viz_roles.py        # unit: assign_roles level/role assignment correctness
  test_viz_schema.py       # unit: build_network_spec pre-fit and post-fit paths
  test_viz_export.py       # unit + integration: _inject_markers + render_viewer_html
```

**No `tests/viz/` subdirectory.** The existing codebase has no test subdirectory
precedent. `test_viz_` prefix is sufficient to group them in alphabetical
directory listings and pytest `-k viz` filtering.

---

## Phase 22 / 23 / 24 Boundary Recommendations

The dependency DAG directly determines phase boundaries. Each phase ends on a
shippable unit (a file that passes tests on its own without requiring downstream
files to exist).

### Phase 22: Core Inspector + Roles

**Deliverables:**
- `viz/__init__.py` (stub only — empty or with TODO re-exports)
- `viz/inspector.py` + `tests/test_viz_inspector.py`
- `viz/roles.py` + `tests/test_viz_roles.py`

**Why this phase boundary:** `inspector.py` and `roles.py` have zero `prl_hgf`
dependencies. They can be written, tested, and merged without touching `schema.py`
or `export.py`. The test suite can run with a synthetic minimal `Network`
(no JAX, no pyhgf needed for unit tests if tests construct `RawNetworkDict`
directly).

**Shippable test:** `assign_roles(inspect_network(build_3level_network_patrl()))` 
returns `{0: NodeRole(1,"input",0), 1: NodeRole(2,"value",0), 2: NodeRole(3,"volatility",0)}`.

**Risks needing research:** pyhgf 0.2.8 edges API — specifically whether
`network.edges[idx]` is a dataclass, namedtuple, or object, and whether all
four directional edge attributes are always present. This is the one place where
a single `_inspect_pyhgf.py` exploratory script should be run before writing
`inspector.py`.

### Phase 23: Schema + Post-Fit Integration

**Deliverables:**
- `viz/schema.py` + `tests/test_viz_schema.py`
- `viz/__init__.py` updated to export `build_network_spec`

**Why this phase boundary:** `schema.py` depends on `inspector` and `roles`
(both complete after Phase 22). It also touches the idata access path, which
requires either a real or mocked `az.InferenceData`. The test can reuse the
`_make_2level_idata` factory pattern from `tests/test_export_trajectories.py`
(lines 47-70 of that file show the exact pattern).

**Shippable test:** `build_network_spec` with `idata=None` produces
`NetworkSpec(is_post_fit=False, ...)`; with a mocked `idata`, posteriors
appear in `NodeSpec.posterior_summary`.

**No changes to `fitting/` or `env/` modules.**

### Phase 24: Export + Template Marker Integration

**Deliverables:**
- Marker `<script>` tags added to `figures/patrl_hgf_model.html` (template edit)
- `viz/export.py` + `tests/test_viz_export.py`
- `viz/__init__.py` fully populated with public exports
- `scripts/` entry-point script (optional; scope C demo only)

**Why this phase boundary:** `export.py` depends on `schema` (complete after
Phase 23). The template edit is independent and can be done in Phase 24 or
earlier as a parallel task. Tests confirm round-trip: `NetworkSpec` → JSON →
injected into template → extracted from `<script>` tag → matches original.

**Shippable test:** `render_viewer_html(spec)` produces valid HTML that a browser
can open; the `viz-network-spec` script tag is present and parseable.

**Risk:** The template currently uses React CDN (`react.production.min.js`).
Self-contained output requires either bundling React inline or accepting the CDN
dependency. Scope C does not require self-containment beyond "single file" —
CDN dependency is acceptable.

---

## Anti-Patterns to Avoid

### Anti-Pattern 1: Viewer calls model builders

**What would go wrong:** `export.py` imports `build_3level_network_patrl` and
`build_3level_network`, then dispatches based on `task_name`. Now `viz/`
has imports from `models/`, which in turn import `pyhgf` + JAX. The viewer
becomes JAX-dependent even for pure structural inspection.

**Do instead:** Caller constructs the Network and passes it in. The viewer is
a reader, not an orchestrator. Same pattern as `export_trajectories.py`.

### Anti-Pattern 2: `schema.py` imports from `pat_rl_config.py` for node→param mapping

**What would go wrong:** Creates a cross-stack import in `schema.py`. If
`pat_rl_config.py` is modified (e.g., new phenotype keys), `schema.py` tests
may fail. Violates parallel-stack invariant.

**Do instead:** Pass `task_name: str` as a parameter and resolve the mapping
via a simple lookup table inside `schema.py`. No config imports needed.

### Anti-Pattern 3: Splitting `export.py` into a sub-package

**What would go wrong:** `viz/export/regex_injection.py` and
`viz/export/html_assembly.py` with a `viz/export/__init__.py`. This adds three
files for ~80 lines of code, creates a `viz/export/` directory that callers
must navigate, and adds no value since the internal `_inject_markers` function
already provides the separation.

**Do instead:** Keep `export.py` flat. Internal helpers with leading underscore
provide the same modularity without the filesystem overhead.

### Anti-Pattern 4: Roles algorithm using topological sort library

**What would go wrong:** Importing `networkx` or `graphlib.TopologicalSorter`
adds a non-trivial dependency for a 30-line BFS. The existing codebase has
no graph library dependency.

**Do instead:** The BFS over pyhgf edges (always small: max 7 nodes in current
models) is faster to write, faster to run, and has no dependency. The
"higher index = parent" invariant from all existing builders makes simple
index-ordered iteration equivalent to topological order.

---

## Sources

All findings are grounded in direct code inspection (confidence: HIGH):

- `src/prl_hgf/models/hgf_2level_patrl.py` — node layout, INPUT_NODE, BELIEF_NODE constants
- `src/prl_hgf/models/hgf_3level_patrl.py` — VOLATILITY_NODE, `volatility_children=([BELIEF_NODE], [kappa])` pattern
- `src/prl_hgf/models/hgf_3level.py` — shared volatility parent (node 6) across 3 branches
- `src/prl_hgf/fitting/laplace_idata.py` — `participant_id` coordinate, param names
- `src/prl_hgf/analysis/export_trajectories.py` — idata access pattern, `_safe_temp` defensive pattern
- `src/prl_hgf/env/pat_rl_config.py` — `@dataclass(frozen=True)` convention, validation style
- `src/prl_hgf/power/schema.py` — schema-as-dataclass precedent in this codebase
- `src/prl_hgf/fitting/hierarchical_patrl.py` — `attrs[VOLATILITY_NODE]` access confirms `network.attributes[idx]` is a dict
- `figures/patrl_hgf_model.html` — React component structure, existing constant declarations (PHENOS, INFO, C), no existing injection markers
- `tests/` directory listing — flat convention, no subdirectories
- `docs/HANDOFF_pyhgf_plot_network_extension.md` — Option C (hybrid) recommendation

---

*Architecture research for: `src/prl_hgf/viz/` — Generic HGF Viewer (v1.3 milestone)*
*Researched: 2026-04-24*
