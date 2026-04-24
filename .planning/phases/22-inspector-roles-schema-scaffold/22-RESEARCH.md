# Phase 22: Inspector + Roles + Schema Scaffold - Research

**Researched:** 2026-04-24
**Domain:** pyhgf `Network` internal API + ArviZ idata conventions + frozen dataclass schema
**Confidence:** HIGH (grounded in direct reads of the installed pyhgf 0.2.10 source tree, existing prl_hgf models, and laplace_idata.py)

## Summary

This is a scaffold phase with no new external libraries. Everything the
executor needs is already present in the `ds_env` site-packages or the repo.
The central research findings that must flow into planning are:

1. **pyhgf `AdjacencyLists.node_type` is an INTEGER, not a string.** The
   CONTEXT assumes `{"binary-state", "continuous-state", ...}` strings are
   stored on each edge — they are not. Those strings are only accepted by
   `Network.add_nodes(kind=...)`. Internally, pyhgf stores integer codes
   (`0=constant-state, 1=binary-state, 2=continuous-state, 3=ef-state,
   4=dp-state, 5=categorical-state, 6=volatile-state`). The inspector must
   map int -> string. This is the single biggest correction to the phase
   context.
2. **Edge adjacency fields are plain Python tuples of ints.**
   `value_parents`, `volatility_parents`, `value_children`,
   `volatility_children` are each `Optional[tuple[int, ...]]`. `None` means
   "no parents/children of that kind." No JAX arrays, no numpy arrays — safe
   to iterate in plain Python.
3. **`network.n_nodes` is a Python int and `network.input_idxs` returns
   `tuple[int, ...]`.** Both safe to use in Python control flow. No JAX
   tracing concerns.
4. **BFS for dedup is new ground.** No existing `src/prl_hgf/` module
   traverses pyhgf edges; the pyhgf upstream `plot_network` in
   `pyhgf/plots/networkx/plot_network.py` is also a flat two-pass iteration,
   not a BFS. The phase must design the BFS from scratch with an
   `int`-keyed `visited` set.
5. **Dual coord-name is confirmed and isolated.** Laplace path hardcodes
   `"participant_id"` (`laplace_idata.py` line 256); NUTS default is
   `"participant"` (`hierarchical.py:1563`), overridden to
   `"participant_id"` for PAT-RL NUTS (`hierarchical_patrl.py:1490`).
   Detection via `"participant_id" in idata.posterior.dims` then
   `"participant" in idata.posterior.dims` is the correct probe.
6. **Requirements vs CONTEXT mismatch on fixture scope.** REQUIREMENTS.md
   SCHEMA-05 says "full phenotype definitions"; CONTEXT Decision 1 says
   "Tier: Medium, NOT phenotype blocks." CONTEXT overrides — plan must
   follow the medium tier.

**Primary recommendation:** Before any code, the REPL session (VIZ-03)
must record the INTEGER node_type codes observed on each of the three
fixture networks and document the int->string mapping table in the
`inspector.py` top-comment. Every downstream function (role inference,
schema construction) branches on that mapping.

## Standard Stack

### Core libraries (already installed, no new deps)

| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| pyhgf | 0.2.10 (ds_env actual) | Source of `Network` object being inspected | Project dep; pinned 0.2.8 in pyproject but ds_env has 0.2.10 (Decision 184) |
| arviz | (ds_env existing) | Optional `InferenceData` passthrough | Already used by laplace_idata.py and hierarchical.py |
| numpy | (ds_env existing) | Summary stat computation on posterior draws | Standard |
| dataclasses (stdlib) | 3.10+ native | `@dataclass(frozen=True)` for NetworkSpec/NodeSpec | Matches power/schema.py, env/pat_rl_config.py conventions |

### No new dependencies

The phase ships no new imports beyond stdlib + pyhgf + arviz + numpy.
Pitfall P15 ("new deps verified in ds_env") is moot — there are none.

## Architecture Patterns

### Recommended module structure

```
src/prl_hgf/viz/
├── __init__.py      # exports inspect_network, build_network_spec, NetworkSpec, NodeSpec
├── inspector.py     # reads Network -> plain dict
├── roles.py         # infers (level, role, branch_idx) from adjacency
└── schema.py        # frozen dataclasses + build_network_spec
```

### Pattern 1: pyhgf node_type integer -> string mapping (CRITICAL)

**What:** pyhgf stores node kind as an integer code on each `AdjacencyLists`
NamedTuple in `network.edges[idx].node_type`. The CONTEXT phrase
"node_type string outside the known set `{\"binary-state\", ...}`" is
describing the public `Network.add_nodes(kind=...)` argument, not the
internal storage. The inspector's known-set guard must operate on the
integer code AND optionally map it to the human-readable string before
emission.

**Known codes** (verified from `pyhgf/model/add_nodes.py` constant
assignments):

| int | Name passed to `add_nodes(kind=...)` | Stored in `AdjacencyLists.node_type` |
|-----|--------------------------------------|--------------------------------------|
| 0   | `"constant-state"`                    | 0 |
| 1   | `"binary-state"`                      | 1 |
| 2   | `"continuous-state"`                  | 2 |
| 3   | `"ef-state"`                          | 3 |
| 4   | `"dp-state"`                          | 4 |
| 5   | `"categorical-state"`                 | 5 |
| 6   | `"volatile-state"`                    | 6 |

Source lines: `add_nodes.py` L30, L92, L160, L198, L238, L318, L376.

Note: upstream docstring in `typing.py` lists codes only up to 4 and is
stale. Trust the source assignments in `add_nodes.py`.

**Implementation:**
```python
# inspector.py
_NODE_TYPE_INT_TO_STR: dict[int, str] = {
    0: "constant-state",
    1: "binary-state",
    2: "continuous-state",
    3: "ef-state",
    4: "dp-state",
    5: "categorical-state",
    6: "volatile-state",
}

def _node_kind(edge) -> str:
    code = edge.node_type
    if code not in _NODE_TYPE_INT_TO_STR:
        raise ValueError(
            f"Unknown pyhgf node_type code {code} at node index {idx}. "
            f"Known codes: {sorted(_NODE_TYPE_INT_TO_STR)}"
        )
    return _NODE_TYPE_INT_TO_STR[code]
```

**CONTEXT Decision 3 alignment:** the strict ValueError contract is
satisfied; the error message names the offending node index, observed
code, and the known set (as integer keys — human-friendly since the
int->string map is right there in the comment above).

### Pattern 2: BFS from input_idxs with int-keyed visited set

**What:** pick_best_cue 3-level has three input nodes (0, 2, 4) and a
shared volatility parent (6). Naive per-branch traversal would visit
node 6 three times. Planner must specify: maintain `visited: set[int]`
keyed by node index, enqueue from `input_idxs`, at each node follow
`value_parents` and `volatility_parents`, skip any child whose index is
already in `visited`.

**Level assignment during BFS:** level = 1 for input nodes, level = 2 for
direct parents of level-1 nodes, level = 3 for parents of level-2, etc.
Store first-discovery level per node.

**Branch_idx assignment:** use the initial enqueue order of the input
nodes. Input node 0 -> branch_idx 0, input node 2 -> branch_idx 1,
input node 4 -> branch_idx 2. For nodes reachable from multiple branches
(shared volatility parent node 6), branch_idx = None (or a sentinel the
schema can represent).

**Example:** for pick_best_cue 3-level:
- input_idxs = (0, 2, 4) -> enqueue with branch_idx 0, 1, 2 at level 1
- Node 0's value_parents = (1,) -> node 1, level 2, branch_idx 0
- Node 2's value_parents = (3,) -> node 3, level 2, branch_idx 1
- Node 4's value_parents = (5,) -> node 5, level 2, branch_idx 2
- Node 1's volatility_parents = (6,) -> node 6, level 3, branch_idx None
  (shared)
- Node 3's volatility_parents = (6,) -> node 6 ALREADY VISITED, skip
- Node 5's volatility_parents = (6,) -> node 6 ALREADY VISITED, skip
- Result: 7 NodeSpec entries, not 9.

### Pattern 3: Role inference from adjacency only (VIZ-05)

**What:** Role is purely structural. No reads from `node_parameters` dict
keys.

```python
# roles.py
def infer_role(
    idx: int,
    edges: tuple,
    input_idxs: tuple[int, ...],
) -> str:
    if idx in input_idxs:
        return "input"
    # A node is a "volatility" node iff some other node lists it in its
    # volatility_parents tuple
    for other in edges:
        if other.volatility_parents is not None and idx in other.volatility_parents:
            return "volatility"
    return "value"
```

Note: CONTEXT Decision calls this the "adjacency structure" approach.
Verified correct against the pick_best_cue 3-level topology in
`tests/test_models.py:122`:
`vol_edge.volatility_children == (1, 3, 5)` — meaning nodes 1, 3, 5
each have `volatility_parents == (6,)`, so node 6 gets
`role="volatility"` by iterating this way.

### Pattern 4: Frozen dataclass schema (matching project convention)

**What:** Follow `power/schema.py` and `env/pat_rl_config.py` exactly.
Leaf dataclasses are `@dataclass(frozen=True)`, nested composition by
field (no inheritance), `__post_init__` validation for any invariants,
string-typed enums are just `str` (no `enum.Enum` in existing code).

**Example shape** (planner's call on exact fields, but this matches both
conventions and the React state shape):
```python
from dataclasses import dataclass, field

@dataclass(frozen=True)
class NodeSpec:
    idx: int
    kind: str              # "binary-state" | "continuous-state" | ...
    level: int             # 1 = input layer, 2, 3, ...
    role: str              # "input" | "value" | "volatility"
    branch_idx: int | None # None for shared nodes (dedup marker)
    value_parents: tuple[int, ...]          # from edge
    volatility_parents: tuple[int, ...]     # from edge
    value_children: tuple[int, ...]
    volatility_children: tuple[int, ...]
    tonic_volatility: float | None = None   # from attributes when present
    mean: float | None = None
    precision: float | None = None
    posterior_mean: dict[str, float] | None = None  # only when idata given
    posterior_hdi: dict[str, tuple[float, float]] | None = None
    r_hat: dict[str, float] | None = None           # suppressed for Laplace

@dataclass(frozen=True)
class NetworkSpec:
    n_nodes: int
    input_idxs: tuple[int, ...]
    nodes: tuple[NodeSpec, ...]
    coord_name: str | None  # detected participant dim or None
    source_pyhgf_version: str  # recorded for cache invalidation
```

The `None` defaults for tuple fields should be `()` (empty tuple) rather
than `None`, per CONTEXT Decision 4 ("Pure frozen dataclass ... NO
`extra: dict[str, Any]`") — simpler downstream consumption.

### Pattern 5: Dual coord-name detection

**What:** Probe `idata.posterior.dims` (not `data_vars` — the
REQUIREMENTS.md text says `data_vars` but the actual xarray probe is
`.dims` for coordinate names). Accept both.

```python
def _get_participant_dim(idata) -> str | None:
    if idata is None:
        return None
    post_dims = set(idata.posterior.dims)  # set[str]
    if "participant_id" in post_dims:
        return "participant_id"
    if "participant" in post_dims:
        return "participant"
    return None  # or raise, depending on SCHEMA-03 contract
```

**Verified usage:**
- `laplace_idata.py:256`: `"participant_id": list(participant_ids)` in
  coords dict, always.
- `hierarchical.py:1563`: `coord_name: str = "participant"` default.
- `hierarchical_patrl.py:1490`: PAT-RL NUTS calls
  `_samples_to_idata(..., coord_name="participant_id")`. So in practice:
  - PAT-RL + Laplace -> `participant_id`
  - PAT-RL + NUTS -> `participant_id`
  - pick_best_cue + NUTS -> `participant` (default)
- The inspector must not assume task -> coord_name mapping; probe each
  idata.

### Pattern 6: Laplace marker detection

**What:** `sample_stats.laplace` is created by `laplace_idata.py` as a
numpy bool array of shape `(1, n_pseudo_draws)`. It is absent entirely
on NUTS idata.

**Verified** (`laplace_idata.py:268-270`):
```python
sample_stats = {"laplace": np.ones((1, n_pseudo_draws), dtype=bool)}
```

Planner should use safe access:
```python
def _is_laplace(idata) -> bool:
    if idata is None or not hasattr(idata, "sample_stats"):
        return False
    return "laplace" in idata.sample_stats.data_vars
```

Do NOT attempt `idata.sample_stats.laplace == True` — that triggers
xarray element-wise comparison and returns a DataArray, not a scalar.
Use `"laplace" in idata.sample_stats.data_vars` to check presence only.
When present, suppress `r_hat` field in NodeSpec (per SCHEMA-04).

### Anti-Patterns to Avoid

- **Reading `node_parameters` keys to infer role.** Pitfall P16 (CONTEXT
  implicit). `node_parameters` on continuous-state and volatile-state
  (node_type 6) nodes contains both value-level and volatility-level
  parameters — `tonic_volatility` is present on volatility nodes AND
  value nodes. Role must come from adjacency.
- **Treating `node_type` as a string.** See Pattern 1. The docstring
  error in `pyhgf/typing.py` ("0: input node. 1: binary state node...")
  is stale but the integer codes are correct.
- **Ignoring node_type 6 (volatile-state).** Not used in current prl_hgf
  models, but the strict ValueError contract means the known-set must
  include it — a future PR could add a volatile-state node, and the
  inspector should not block it.
- **Importing from any prl_hgf module below pyhgf.** VIZ-02 explicit. The
  inspector is a reader; it depends only on the `pyhgf.model.Network`
  object passed in. Tests import `build_3level_network*` but the
  production inspector code does not.
- **Using list-keyed visited set.** A list makes dedup O(n); for the BFS
  to be correct on shared volatility parents you need `set[int]`.
- **Boolean-indexing xarray for Laplace marker.** See Pattern 6. Use
  `in data_vars` membership.

## Existing Node-Builder Entry Points

These are the fixture sources for TEST-01 and TEST-02. Planner must
specify imports from these exact module paths.

| Function | Module | Signature | Node count (verified) |
|----------|--------|-----------|------------------------|
| `build_2level_network` | `prl_hgf.models.hgf_2level` | `(omega_2: float = -4.0) -> Network` | 6 (3 binary + 3 continuous; verified test_models.py:80) |
| `build_3level_network` | `prl_hgf.models.hgf_3level` | `(omega_2: float = -4.0, omega_3: float = -4.0, kappa: float = 1.0) -> Network` | 7 (3 binary + 3 continuous + 1 shared volatility; verified test_models.py:88) |
| `build_2level_network_patrl` | `prl_hgf.models.hgf_2level_patrl` | `(omega_2: float = -4.0) -> Network` | 2 (1 binary + 1 continuous) |
| `build_3level_network_patrl` | `prl_hgf.models.hgf_3level_patrl` | `(omega_2: float = -4.0, omega_3: float = -6.0, kappa: float = 1.0, mu3_0: float = 1.0) -> Network` | 3 (1 binary + 1 continuous + 1 volatility) |
| `build_2level_multimodal_network_patrl` | `prl_hgf.models.hgf_2level_multimodal_patrl` | `(omega_2: float = -4.0) -> Network` | 3 (2 binary + 1 shared continuous) |

Re-exported via `prl_hgf.models.__init__.py`:
- `build_2level_network`, `build_3level_network` (pick_best_cue)

NOT re-exported (must import from submodule):
- `build_*_patrl` family
- `build_2level_multimodal_network_patrl`

**CONTEXT canary counts verified:** PAT-RL 3-level = 3 nodes
(line 3 of `hgf_3level_patrl.py` docstring), pick_best_cue 3-level =
7 nodes (verified in test_models.py). These match SUMMARY.md's
expectation.

## Configs and Prior YAML Keys

**File:** `configs/pat_rl.yaml`
**Block path:** `fitting.priors` (lines 146-155)
**Keys available:**
- `omega_2: {mean: -4.0, sd: 2.0}`
- `omega_3: {mean: -6.0, sd: 2.0}`
- `kappa: {lower: 0.0, upper: 2.0, mean: 1.0, sd: 0.5}` (truncated)
- `beta: {lower: 0.0, upper: 20.0, mean: 4.0, sd: 3.0}` (truncated)
- `mu3_0: {mean: 1.0, sd: 1.0}`
- `b: {mean: 0.0, sd: 1.0}` (Models A+b, B, C)
- `gamma: {mean: 0.0, sd: 0.5}` (Models B, C)
- `alpha: {mean: 0.0, sd: 0.5}` (Model C)
- `lam: {mean: 0.0, sd: 0.1}` (Model D)

**Note on zeta (ζ) in the CONTEXT phenotype list:** ζ is the stickiness
parameter used in the pick_best_cue softmax-stickiness response model
(`src/prl_hgf/models/response.py`), NOT in PAT-RL. The PAT-RL 3-level
prefit fixture should use ω₂, ω₃, κ, β, b, μ₃⁰ (no zeta). Verifying in
`models/response_patrl.py`:

`grep -n "zeta" src/prl_hgf/models/response_patrl.py` — no match expected
(PAT-RL uses b for bias, not zeta). Planner should validate this assumption
when writing the JSON fixture — the CONTEXT's "ω₂, ω₃, κ, β, ζ, b, μ₃⁰"
list may be a copy-paste from the pick_best_cue model and zeta does not
belong in the PAT-RL fixture.

## ArviZ InferenceData Shape

### Laplace idata structure (from `laplace_idata.py`)

```
idata.posterior:
  omega_2:    (1, n_pseudo_draws, P), dim "participant_id"
  log_beta:   (1, n_pseudo_draws, P), dim "participant_id"
  beta:       (1, n_pseudo_draws, P), dim "participant_id"
  omega_3:    (1, n_pseudo_draws, P), dim "participant_id"  [3-level only]
  kappa:      ... [3-level only]
  mu3_0:      ... [3-level only]
  b:          ... [if Model A+b/B/C]
  gamma:      ... [Models B/C]
  alpha:      ... [Model C]
  lam:        ... [Model D]
idata.sample_stats:
  laplace:    (1, n_pseudo_draws) bool  # marker
  OR: converged, n_iterations, logp_at_mode, hessian_min_eigval,
      hessian_max_eigval, n_eigenvalues_clipped, ridge_added
idata.posterior.coords:
  chain, draw, participant_id  (+ participant_group/session assigned)
```

### NUTS idata structure (from `hierarchical.py:_samples_to_idata`)

```
idata.posterior:
  <each var>: (n_chains, n_draws, P), dim = coord_name
idata.sample_stats:
  diverging:       (n_chains, n_draws)
  acceptance_rate: (n_chains, n_draws)
  # NO "laplace" key — absence IS the signal
idata.posterior.coords:
  chain, draw, <coord_name>
  + participant_group, participant_session assigned
```

Where `coord_name` is:
- `"participant"` for pick_best_cue NUTS (default)
- `"participant_id"` for PAT-RL NUTS (explicit override)

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Graph traversal for networks | Custom nested loops | Plain BFS with `collections.deque` + `set` | Stdlib, zero cost; networkx would be over-engineering for <10 nodes |
| ArviZ posterior summary | Custom mean/hdi computation | `az.summary(idata, var_names=...)` (existing dep) | Handles NaN/Inf, consistent HDI convention, r_hat already computed |
| JSON round-trip of frozen dataclasses | `json.dumps(obj, default=...)` custom | `dataclasses.asdict(obj)` + `json.dumps(result)` | stdlib, handles nested frozen dataclasses naturally |
| Known-node-type validation | New `enum.Enum` | Plain `dict[int, str]` + `KeyError`-style lookup | Project convention uses plain dict mappings; no Enum in env/models/ |

**Key insight:** This is a <300-line scaffold phase. Resist adding
abstractions (Enum, Protocol, graph library). Match existing project
style which is plain stdlib + frozen dataclasses.

## Common Pitfalls

### Pitfall 1: Assuming `node_type` is a string

**What goes wrong:** Code like `if edge.node_type == "binary-state":`
silently fails every check (int 1 != str "binary-state"), and every
node falls through to the ValueError raise branch.

**Why it happens:** CONTEXT decision 3 literally quotes
`{"binary-state", ...}` as the known set. The CONTEXT reflects the
public kwarg vocabulary from `add_nodes()`, not internal storage.

**How to avoid:** REPL session MUST print `network.edges[0].node_type`
and show it is `1`, not `"binary-state"`. Comment the int->string
mapping table in `inspector.py` top.

**Warning signs:** `isinstance(edge.node_type, int)` assertion would
fire in test.

### Pitfall 2: Using `list` for visited set in BFS

**What goes wrong:** Traversal visits node 6 three times in pick_best_cue
3-level (three volatility_parents edges point to it). Inspector emits 9
NodeSpec entries, not 7. TEST-01 canary assertion fails.

**How to avoid:** `visited: set[int] = set()`. Check
`if child_idx in visited: continue` before emitting.

**Warning signs:** Node count 9 in pick_best_cue 3-level instead of 7.

### Pitfall 3: Hardcoding `participant_id` or `participant`

**What goes wrong:** Inspector raises KeyError on the unused coord name,
or silently truncates participant dimension on pick_best_cue NUTS.

**How to avoid:** SCHEMA-03 probe — `set(idata.posterior.dims)` then
check membership. Reject idata where neither is present with a clear
error message.

**Warning signs:** Test passes with PAT-RL idata, fails with
pick_best_cue idata (or vice versa).

### Pitfall 4: REPL session skipped / run once / done stale

**What goes wrong:** Executor writes inspector.py first, adds a REPL
comment AFTER the fact, version lied. Pitfall P1 is explicit: "REPL
first, production code second."

**How to avoid:** P1 enforcement in plan — the task ordering is
(i) REPL REPL.py script ephemeral, (ii) capture findings into
`inspector.py` module-docstring comment, (iii) THEN production
functions. The REPL script itself does not ship (CONTEXT Decision 2).

**Warning signs:** Git history shows `inspector.py` added with
production code and REPL comment in the same commit — no separate
"add REPL comment" commit.

### Pitfall 5: pyhgf version drift between comment and ds_env

**What goes wrong:** REPL run against 0.2.10; later someone updates
ds_env to 0.3.x with breaking `AdjacencyLists` schema; inspector silently
emits wrong shape.

**How to avoid:** The REPL comment records `pyhgf.__version__` verbatim.
Include a lightweight runtime check in `inspect_network`:
```python
import pyhgf
if pyhgf.__version__ != _VERIFIED_AGAINST:
    warnings.warn(
        f"inspector.py verified against pyhgf {_VERIFIED_AGAINST}, "
        f"running on pyhgf {pyhgf.__version__}. Re-run REPL verification."
    )
```

**Warning signs:** Silent data shape mismatches; no test failure because
tests run in same ds_env.

### Pitfall 6: REQUIREMENTS vs CONTEXT phenotype scope contradiction

**What goes wrong:** Executor reads REQUIREMENTS.md SCHEMA-05 ("full
phenotype definitions") and stuffs the JSON fixture with phenotype
blocks. Fails CONTEXT Decision 1 ("NOT phenotype blocks"). Phase close
reviewer flags the mismatch.

**How to avoid:** CONTEXT overrides. Plan must explicitly tell the
executor: "SCHEMA-05 scope is the Medium tier from CONTEXT Decision 1,
NOT the REQUIREMENTS.md wording. The REQUIREMENTS.md line is out of
date (phenotype block was deferred)."

**Warning signs:** JSON fixture has a top-level `phenotypes: {...}` key.

### Pitfall 7: zeta in PAT-RL fixture

**What goes wrong:** Copy-paste from CONTEXT's parameter list ("ω₂, ω₃,
κ, β, ζ, b, μ₃⁰") puts a zeta entry in the PAT-RL prefit fixture. PAT-RL
does not use zeta — that's the pick_best_cue stickiness parameter.

**How to avoid:** Planner confirms by grep that `zeta` does not appear
in `src/prl_hgf/models/response_patrl.py`. Fixture includes only params
in the `configs/pat_rl.yaml` `fitting.priors` block (ω₂, ω₃, κ, β, μ₃⁰,
b, gamma, alpha, lam depending on model variant chosen).

**Warning signs:** Fixture JSON has `"zeta": {...}` in the parameters
block; no matching prior in configs/pat_rl.yaml.

### Pitfall 8: Binary-state nodes skipped (upstream plot_network precedent)

**What goes wrong:** Following pyhgf's own `plots/networkx/plot_network.py`
pattern, which only emits nodes with `node_type in {2, 6}`, would drop
every binary-state input node (node_type == 1). The inspector's job is
to emit ALL reachable nodes, including binary input nodes.

**How to avoid:** Do NOT filter by node_type. Emit every node visited by
the BFS. Binary-state nodes carry `role="input"` since they are in
`input_idxs`.

**Warning signs:** PAT-RL 3-level emits 2 entries (nodes 1, 2) instead
of 3 (nodes 0, 1, 2). pick_best_cue 3-level emits 4 entries instead of 7.

## Code Examples

### Inspector top-level shape (planner reference)

```python
# src/prl_hgf/viz/inspector.py
"""pyhgf Network -> plain dict extractor for the HGF viewer.

pyhgf API verification -- <REPL_DATE> against pyhgf <REPL_VERSION>
(run locally in ds_env)

Verified attribute paths:
  network.attributes[idx] -> dict[str, Any]
  network.edges[idx]      -> AdjacencyLists(node_type: int,
                                           value_parents: Optional[tuple[int,...]],
                                           volatility_parents: Optional[tuple[int,...]],
                                           value_children: Optional[tuple[int,...]],
                                           volatility_children: Optional[tuple[int,...]],
                                           coupling_fn: tuple[Optional[Callable],...])
  network.input_idxs      -> tuple[int, ...]
  network.n_nodes         -> int (plain Python, not JAX)

node_type int -> string mapping (from pyhgf/model/add_nodes.py):
  0 -> "constant-state"
  1 -> "binary-state"
  2 -> "continuous-state"
  3 -> "ef-state"
  4 -> "dp-state"
  5 -> "categorical-state"
  6 -> "volatile-state"
"""

from __future__ import annotations

from collections import deque
from typing import Any

# (imports from pyhgf only for type hints in docstring; no runtime import
# from prl_hgf modules)

_NODE_TYPE_INT_TO_STR: dict[int, str] = {
    0: "constant-state",
    1: "binary-state",
    2: "continuous-state",
    3: "ef-state",
    4: "dp-state",
    5: "categorical-state",
    6: "volatile-state",
}


def inspect_network(network: Any) -> dict[str, Any]:
    """Extract topology from a pyhgf Network into a plain dict."""
    visited: set[int] = set()
    levels: dict[int, int] = {}
    branch_of: dict[int, int | None] = {}
    queue: deque[tuple[int, int, int | None]] = deque()

    for branch_idx, input_idx in enumerate(network.input_idxs):
        queue.append((input_idx, 1, branch_idx))
        levels[input_idx] = 1
        branch_of[input_idx] = branch_idx

    node_rows: list[dict[str, Any]] = []
    while queue:
        idx, level, branch = queue.popleft()
        if idx in visited:
            continue
        visited.add(idx)

        edge = network.edges[idx]
        if edge.node_type not in _NODE_TYPE_INT_TO_STR:
            raise ValueError(
                f"Unknown pyhgf node_type code {edge.node_type} at node "
                f"index {idx}. Known codes: {sorted(_NODE_TYPE_INT_TO_STR)}"
            )
        kind = _NODE_TYPE_INT_TO_STR[edge.node_type]

        attrs = network.attributes[idx]
        node_rows.append({
            "idx": idx,
            "kind": kind,
            "level": level,
            "branch_idx": branch,
            "value_parents": tuple(edge.value_parents or ()),
            "volatility_parents": tuple(edge.volatility_parents or ()),
            "value_children": tuple(edge.value_children or ()),
            "volatility_children": tuple(edge.volatility_children or ()),
            "tonic_volatility": attrs.get("tonic_volatility"),
            "mean": attrs.get("mean"),
            "precision": attrs.get("precision"),
        })

        # enqueue parents — shared parents inherit branch_idx=None
        for parent_idx in (edge.value_parents or ()):
            if parent_idx in visited:
                continue
            levels.setdefault(parent_idx, level + 1)
            prev_branch = branch_of.get(parent_idx, branch)
            new_branch = branch if prev_branch == branch else None
            branch_of[parent_idx] = new_branch
            queue.append((parent_idx, level + 1, new_branch))
        for parent_idx in (edge.volatility_parents or ()):
            if parent_idx in visited:
                continue
            levels.setdefault(parent_idx, level + 1)
            prev_branch = branch_of.get(parent_idx, branch)
            new_branch = branch if prev_branch == branch else None
            branch_of[parent_idx] = new_branch
            queue.append((parent_idx, level + 1, new_branch))

    return {
        "n_nodes": int(network.n_nodes),
        "input_idxs": tuple(network.input_idxs),
        "nodes": tuple(node_rows),
    }
```

**Note:** Exact field names are the planner's discretion per CONTEXT
"Claude's Discretion." The structure above is shown for planner
reference only.

## Handoff Doc: Current "Key Questions" Needing REPL Answers

From `docs/HANDOFF_pyhgf_plot_network_extension.md` section "Key
questions to resolve" (lines 183-204):

1. **"Does pyhgf expose enough internal structure?"** ANSWERED by
   research. Yes — `network.attributes[idx]`, `network.edges[idx]`,
   `network.input_idxs`, `network.n_nodes`. DOC-01 edit: replace the
   question with the verified answer.
2. **"matplotlib vs raw SVG?"** OUT OF SCOPE for Phase 22. Defer to
   Phase 23 when renderer is built. DOC-01 edit: mark as "Deferred to
   Phase 23 (out of scope for inspector scaffold)."
3. **"Should this be a PR to pyhgf?"** OUT OF SCOPE. DOC-01 edit:
   mark as "Deferred — v1.3 ships project-internal; upstream
   contribution considered for v1.5+."
4. **"How to handle the response model?"** OUT OF SCOPE for Phase 22
   (response model integration is Phase 24 POST-01). DOC-01 edit: link
   to Phase 24 plan.
5. **"2-level vs 3-level switching"** ANSWERED by the BFS — when
   `build_2level_network_patrl()` is inspected, the BFS terminates at
   the continuous-state belief node (no volatility_parents); no
   explicit switching needed. DOC-01 edit: document the auto-adapts
   behavior.

Additional "hypothetical" language to strip (line 164: "Hypothetical
extended API"): the `node_shapes={"value_parent": "hexagon", ...}`
pseudo-API block is speculative and should be annotated as "superseded
by the concrete NodeSpec shape in `src/prl_hgf/viz/schema.py`."

## Test Fixture Patterns

### Existing precedent in `tests/test_models.py`

```python
# tests/test_models.py:38-47 — session-scoped config/trials fixtures
@pytest.fixture(scope="session")
def config():
    return load_config()

@pytest.fixture(scope="session")
def trials(config):
    return generate_session(config, seed=42)
```

Planner should mirror this for test_viz_*.py:

```python
# tests/test_viz_inspector.py
import pytest
from prl_hgf.models.hgf_3level import build_3level_network
from prl_hgf.models.hgf_3level_patrl import build_3level_network_patrl

@pytest.fixture(scope="session")
def patrl_3level_network():
    return build_3level_network_patrl()

@pytest.fixture(scope="session")
def pick_best_cue_3level_network():
    return build_3level_network()

def test_patrl_3level_node_count(patrl_3level_network):
    spec = inspect_network(patrl_3level_network)
    assert len(spec["nodes"]) == 3

def test_pick_best_cue_3level_node_count_dedup(pick_best_cue_3level_network):
    spec = inspect_network(pick_best_cue_3level_network)
    assert len(spec["nodes"]) == 7, (
        "Expected 7 nodes (shared volatility parent deduplicated), got "
        f"{len(spec['nodes'])}"
    )
```

## State of the Art

Nothing new — scaffold phase. The following are stable and require no
replacement consideration:

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| (nothing) | Same as now | N/A | N/A |

## Open Questions

1. **Should `level` assignment use first-discovery depth or "logical HGF
   level"?**
   - What we know: BFS first-discovery gives the right answer for
     pick_best_cue 3-level (input=1, value=2, volatility=3) and the
     PAT-RL variants. For multimodal 2-level (inputs 0, 1; shared belief
     2), it gives input=1, belief=2 — also correct.
   - What's unclear: if an exotic topology (e.g., asymmetric branching
     where one branch has more levels than another) ever ships,
     first-discovery may assign "level" differently than the researcher
     expects.
   - Recommendation: use first-discovery depth in Phase 22; document
     the choice in the NodeSpec docstring; add a future note that
     "logical level" could be a renderer concern in Phase 23 if needed.

2. **What exact keys does the Phase 23 React state expect?** The
   `figures/patrl_hgf_model.html` component uses keys like `id`
   ("input", "belief", "vol"), `title`, `body`, and phenotype-specific
   highlight lists. The CONTEXT says "NetworkSpec field names should
   match the React state shape where possible." Without reading the
   full React component, the exact mapping is unclear.
   - Recommendation: planner adopts the schema shape in Pattern 4 (this
     doc) and adds a small key-alias layer (`asdict` result can be
     remapped) in Phase 23 export.py if needed. Do NOT contort the
     dataclass field names to satisfy a Phase 23 concern.

3. **pyhgf 0.2.10 `plot_network` skips `node_type == 1`.** This is
   noted in Pitfall 8 but not yet stress-tested against the fixture
   networks. Planner should specify in test_viz_inspector.py:
   "assert every input_idx appears as a NodeSpec entry."

## Blockers Detected

**None that stop the phase.** The following minor risks are flagged but
do not require a blocker:

- **pyproject.toml pins pyhgf 0.2.8, ds_env has 0.2.10** (Decision 184).
  REPL records 0.2.10. Plan must NOT re-pin pyproject.toml (that's a
  separate decision and out of scope for this phase).
- **REQUIREMENTS.md SCHEMA-05 says phenotype blocks** — CONTEXT overrides
  (see Pitfall 6). Planner must instruct executor explicitly.
- **CONTEXT lists zeta in PAT-RL parameter set** — PAT-RL does not use
  zeta (see Pitfall 7). Planner must instruct executor to validate
  against `configs/pat_rl.yaml` before writing the fixture.

## Sources

### Primary (HIGH confidence) — read directly in this session

- `C:/Users/aman0087/AppData/Local/miniforge3/Lib/site-packages/pyhgf/typing.py` — `AdjacencyLists` NamedTuple definition
- `C:/Users/aman0087/AppData/Local/miniforge3/Lib/site-packages/pyhgf/model/network.py` — `Network` class: `n_nodes`, `input_idxs`, `attributes`, `edges` storage
- `C:/Users/aman0087/AppData/Local/miniforge3/Lib/site-packages/pyhgf/model/add_nodes.py` — authoritative int -> kind mapping
- `C:/Users/aman0087/AppData/Local/miniforge3/Lib/site-packages/pyhgf/utils/add_edges.py` — confirms parent/child fields are plain `tuple[int, ...]`
- `C:/Users/aman0087/AppData/Local/miniforge3/Lib/site-packages/pyhgf/utils/get_input_idxs.py` — confirms `input_idxs` returns `tuple[int, ...]`
- `C:/Users/aman0087/AppData/Local/miniforge3/Lib/site-packages/pyhgf/plots/networkx/plot_network.py` — upstream plotting pattern (reference for pitfall 8)
- `C:/Users/aman0087/Documents/Github/hgf-analysis/src/prl_hgf/models/hgf_3level.py` — pick_best_cue 3-level factory
- `C:/Users/aman0087/Documents/Github/hgf-analysis/src/prl_hgf/models/hgf_3level_patrl.py` — PAT-RL 3-level factory
- `C:/Users/aman0087/Documents/Github/hgf-analysis/src/prl_hgf/models/hgf_2level_patrl.py` — PAT-RL 2-level factory
- `C:/Users/aman0087/Documents/Github/hgf-analysis/src/prl_hgf/models/hgf_2level_multimodal_patrl.py` — multimodal 2-level factory
- `C:/Users/aman0087/Documents/Github/hgf-analysis/src/prl_hgf/fitting/laplace_idata.py` — Laplace idata shape + marker
- `C:/Users/aman0087/Documents/Github/hgf-analysis/src/prl_hgf/fitting/hierarchical.py` L1555-1629 — NUTS idata shape + dual coord-name
- `C:/Users/aman0087/Documents/Github/hgf-analysis/src/prl_hgf/fitting/hierarchical_patrl.py` L1480-1495 — PAT-RL NUTS coord override
- `C:/Users/aman0087/Documents/Github/hgf-analysis/src/prl_hgf/power/schema.py` — `@dataclass(frozen=True)` + validation pattern
- `C:/Users/aman0087/Documents/Github/hgf-analysis/src/prl_hgf/env/pat_rl_config.py` — nested frozen dataclass pattern + __post_init__
- `C:/Users/aman0087/Documents/Github/hgf-analysis/configs/pat_rl.yaml` L140-155 — fitting prior YAML keys
- `C:/Users/aman0087/Documents/Github/hgf-analysis/tests/test_models.py` L77-150 — existing Network fixture pattern
- `C:/Users/aman0087/Documents/Github/hgf-analysis/docs/HANDOFF_pyhgf_plot_network_extension.md` — current state (235 lines) for DOC-01 diff
- `C:/Users/aman0087/Documents/Github/hgf-analysis/.planning/REQUIREMENTS.md` L14-27, 59-67 — exact VIZ/SCHEMA/DOC/TEST requirement wording
- `C:/Users/aman0087/Documents/Github/hgf-analysis/figures/patrl_hgf_model.html` L30-112 — React state shape (CONTEXT reference)
- `C:/Users/aman0087/Documents/Github/hgf-analysis/.planning/phases/22-inspector-roles-schema-scaffold/22-CONTEXT.md` — phase-specific decisions

### Secondary (MEDIUM confidence)

- pyhgf typing.py docstring — stale (lists codes 0-4 only, missing 5 and 6). Evidence from add_nodes.py assignments overrides.

### Tertiary (LOW confidence)

- None — this phase is fully grounded in direct source reads.

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH — all deps already installed and pinned in ds_env
- pyhgf API shape: HIGH — verified by direct read of installed source
- Architecture patterns: HIGH — match existing `power/schema.py` and
  `env/pat_rl_config.py` patterns exactly
- BFS design: MEDIUM — no precedent in repo; planner should inspect the
  pseudocode above for correctness. The algorithm is standard but
  unfixed choices (branch_idx propagation rule for shared parents) may
  warrant discussion in the plan.
- Pitfalls: HIGH — grounded in specific code pointers and the REQUIREMENTS
  vs CONTEXT contradiction

**Research date:** 2026-04-24
**Valid until:** 2026-05-24 (30 days — pyhgf may update but the 0.2.x
Network API has been stable across multiple minor releases)
