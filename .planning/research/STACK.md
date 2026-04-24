# Stack Research — v1.3 Generic HGF Viewer (Scaffold)

**Domain:** Config-driven HTML viewer scaffold for pyhgf networks
**Researched:** 2026-04-24
**Confidence:** HIGH (all versions verified at runtime or PyPI; pyhgf internals verified at runtime in ds_env)

---

## Decision Summary

The v1.3 scaffold needs **two runtime additions** and **two dev additions** beyond what is
already in `ds_env`. Everything else is reuse.

| Concern | Decision | Rationale |
|---|---|---|
| HTML template generation | Jinja2 `Environment(loader=BaseLoader())` | Already installed (3.1.6); safer than regex for multi-slot injection |
| SVG elements | Hand-rolled in HTML template | No SVG library needed at scaffold stage |
| pyhgf network inspection | Read `.attributes[idx]`, `.edges[idx]` directly | Verified API — no wrapper library needed |
| JS/CSS in output | Inline at export time (fetch + embed) | Template currently uses CDN links; self-contained requirement mandates inlining |
| ArviZ posterior extraction | `az.summary()` + `az.hdi()` | Already installed (0.22.0); covers all scaffold needs |
| HTML structural testing | `beautifulsoup4` with `html.parser` | Already installed (4.13.4); no lxml needed |
| Snapshot testing | `pytest-snapshot` | Lightweight; fits existing pytest infrastructure |

---

## Reuse — Do Not Add

These facilities are already in `ds_env` and cover every v1.3 scaffold need. Do not
introduce alternatives.

### pyhgf Network inspection (verified at runtime, pyhgf 0.2.10)

The `Network` object exposes everything `inspector.py` needs without any helper library:

```python
from pyhgf.model import Network

# Node attributes — dict keyed by int index (also -1 for global time_step)
net.attributes          # dict[int, dict[str, Any]]
net.attributes[idx]     # keys: 'mean', 'expected_mean', 'precision',
                        #       'tonic_volatility', 'tonic_drift',
                        #       'autoconnection_strength',
                        #       'value_coupling_children', 'value_coupling_parents',
                        #       'volatility_coupling_children', 'volatility_coupling_parents',
                        #       'observed', 'temp'
                        # Note: binary-state nodes (node_type=1) do NOT have
                        # 'tonic_volatility'; continuous-state nodes (node_type=2) do.

# Edges — tuple of AdjacencyLists NamedTuples (one per node, 0-indexed)
net.edges               # tuple[AdjacencyLists, ...]
net.edges[idx].node_type          # int: 0=input, 1=binary-state, 2=continuous-state
net.edges[idx].value_parents      # tuple[int, ...] | None
net.edges[idx].volatility_parents # tuple[int, ...] | None
net.edges[idx].value_children     # tuple[int, ...] | None
net.edges[idx].volatility_children# tuple[int, ...] | None

# Input node indices
net.input_idxs          # tuple[int, ...]

# Node count (excludes the -1 global node)
net.n_nodes             # int
```

The `AdjacencyLists` is a `NamedTuple` from `pyhgf.typing` — named field access
is safe across 0.2.x. The `node_type` encoding (0/1/2) is documented in the source
and verified stable.

**Level inference rule** (no helper needed): traverse from input nodes upward via
`volatility_parents`; each hop is one additional level. `node_type == 1` →
binary-state (leaf or input); `node_type == 2` → continuous-state (value parent or
volatility parent). A continuous-state node with `volatility_children` is a
volatility parent (level 3+).

### ArviZ posterior extraction (arviz 0.22.0)

```python
import arviz as az

# Posterior parameter summary (mean, sd, hdi_3%, hdi_97%, r_hat, ess_bulk)
df = az.summary(idata, var_names=["omega_2", "kappa"], group="posterior")

# HDI for a specific variable
hdi_vals = az.hdi(idata.posterior["omega_2"], hdi_prob=0.94)

# Coord name: idata uses "participant_id" (Laplace path, Decision 131/19-02)
# or "participant" (NUTS path, Decision 18-06).
# schema.py must accept a coord_name kwarg with default "participant_id"
# to match the Laplace idata that v1.3 primarily targets.
idata.posterior.coords["participant_id"]   # Laplace path
idata.posterior.coords["participant"]      # NUTS path (back-compat)
```

`az.summary()` returns a `pd.DataFrame` in `fmt='wide'` (default). The scaffold
JSON serialisation layer in `schema.py` should call `.to_dict(orient='index')` on
the result — no custom accessor needed.

### NumPy (numpy 2.2.6) — already in ds_env

Used for JAX array → Python float conversion in `inspector.py`:

```python
float(np.asarray(net.attributes[idx]["tonic_volatility"]))
```

JAX arrays are returned by `net.attributes` after any model run; `.asarray()` +
`float()` avoids JAX device array JSON serialisation errors.

---

## Runtime Additions

### 1. Jinja2 — HTML template injection

**Already installed:** jinja2 3.1.6 (confirmed in ds_env).

**Why Jinja2 over regex-only injection:**

The prototype pattern (`re.sub(r'const PHENOS = \[.*?\]', ...)`) breaks silently
on multiline JS blocks, fails if the constant name appears in a comment, and
requires re-escaping backslashes in replacement strings. Jinja2's
`Environment(loader=BaseLoader())` solves all three without adding a new
dependency.

**Why not Mako:** Mako is not installed and adds a dependency for no additional
capability at scaffold scope.

**Why not f-strings:** f-strings on a 676-line React/JSX template require escaping
every `{` and `}` in the JS source — not maintainable.

**Integration pattern for `export.py`:**

```python
from jinja2 import Environment, BaseLoader

_ENV = Environment(loader=BaseLoader(), autoescape=False)
# autoescape=False is correct here: we are injecting JS/JSON into a known
# template we control, not sanitising user HTML.

def export_viz_html(
    network: Network,
    idata: az.InferenceData | None,
    config: ViewerConfig,
    output_path: Path,
) -> None:
    template_text = (TEMPLATE_PATH).read_text(encoding="utf-8")
    tmpl = _ENV.from_string(template_text)
    rendered = tmpl.render(
        network_json=_network_to_json(network),
        posterior_json=_posterior_to_json(idata) if idata else "null",
        viewer_config_json=config.to_json(),
    )
    output_path.write_text(rendered, encoding="utf-8")
```

Template injection slots in `figures/hgf_viewer.html` use Jinja2 delimiters
inside a JS `<script>` block, not inside JSX, to avoid Babel parse ambiguity:

```html
<script id="hgf-viewer-data" type="application/json">
{
  "network": {{ network_json }},
  "posterior": {{ posterior_json }},
  "config": {{ viewer_config_json }}
}
</script>
```

The React component reads `document.getElementById('hgf-viewer-data')` on mount.
This keeps Jinja2 out of JSX syntax entirely.

**pyproject.toml change:** None needed — jinja2 is already a transitive
dependency (via PyMC → pytensor). To make it explicit, add to `[project.dependencies]`:

```toml
"jinja2>=3.1,<4",
```

### 2. Self-contained output — inline JS/CSS at export time

The current template loads React 18.2.0, React-DOM 18.2.0, and Babel Standalone
7.23.2 from cdnjs, and loads Source Sans 3 + STIX Two Text from Google Fonts. The
milestone requirement is a **single self-contained HTML file with no external
runtime dependencies**.

**Solution:** At export time, fetch each CDN resource once and embed as inline
`<script>` / `<style>` content. This is stdlib-only:

```python
import urllib.request

def _fetch_and_inline(url: str) -> str:
    with urllib.request.urlopen(url, timeout=15) as r:
        return r.read().decode("utf-8")
```

**Pinned versions to use in the generic template** (verified 2026-04-24 via
cdnjs API — these are the current stable releases; the template should pin
explicit versions, not `@latest`):

| Resource | Pinned URL |
|---|---|
| React | `https://cdnjs.cloudflare.com/ajax/libs/react/18.2.0/umd/react.production.min.js` |
| React-DOM | `https://cdnjs.cloudflare.com/ajax/libs/react-dom/18.2.0/umd/react-dom.production.min.js` |
| Babel Standalone | `https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/7.23.2/babel.min.js` |

**Do not upgrade to React 19** for this milestone. The existing JSX in the
template uses `ReactDOM.createRoot()` which is React 18 API. React 19 introduces
breaking changes to concurrent features. Pin at 18.2.0.

**Google Fonts:** Inline the `@import` as a `<style>` block using the Google Fonts
CSS2 API response (which itself contains `@font-face` with base64 data URIs for
the subset). Alternatively, replace with system font stack for the scaffold if
font fetching adds complexity — defer font inlining to v1.4. At scaffold stage,
a `<style>` fallback is acceptable:

```html
<!-- FALLBACK if font inlining deferred -->
<style>
body { font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif; }
</style>
```

**pyproject.toml change:** None — `urllib.request` is stdlib.

---

## Dev-Only Additions

### 3. pytest-snapshot — HTML snapshot testing

**Not installed.** Add to `[project.optional-dependencies] dev`.

**Verified version:** pytest-snapshot 0.9.0 (PyPI, 2026-04-24).

**Why pytest-snapshot over syrupy:** syrupy (5.1.0) is the more modern option
and supports inline snapshots, but it requires a `--snapshot-update` flag that
conflicts with the project's existing `addopts = "-v --tb=short --strict-markers"`
setup. pytest-snapshot is simpler and integrates with the existing pytest config
without `addopts` changes.

**Why not raw `assert html_content == expected`:** Snapshot files are
version-controlled and reviewable as diffs — structural regressions are
immediately visible in PR reviews. String equality in test code is opaque.

**Integration pattern for `tests/viz/`:**

```python
# tests/viz/test_export.py
def test_export_produces_stable_html(snapshot, tmp_path):
    net = build_3level_network_patrl()
    html = export_viz_html(net, idata=None, config=default_config(), output_path=tmp_path / "out.html")
    snapshot.assert_match(html, "patrl_3level_scaffold.html")
```

**pyproject.toml change:**

```toml
[project.optional-dependencies]
dev = [
    "ruff>=0.4",
    "mypy>=1.10",
    "pytest>=8.0",
    "pytest-cov>=5.0",
    "pytest-snapshot>=0.9.0",  # ADD
]
```

### 4. beautifulsoup4 — structural HTML tests

**Already installed:** beautifulsoup4 4.13.4 (confirmed in ds_env).

**Why bs4 over lxml:** lxml is NOT installed in ds_env and would require a C
extension build on the cluster. bs4 with `html.parser` (stdlib) is sufficient for
structural assertions — finding injection slots, verifying `<script type="application/json">`
is present, asserting node count in the rendered JSON blob.

**Why not regex on HTML:** Structural tests on HTML with regex are fragile
(whitespace, attribute order). bs4 parse + `soup.find()` is the correct tool.

**Integration pattern:**

```python
# tests/viz/test_structure.py
from bs4 import BeautifulSoup

def test_html_has_data_slot(tmp_path):
    html = export_viz_html(net, idata=None, config=cfg, output_path=tmp_path / "o.html")
    soup = BeautifulSoup(html, "html.parser")
    slot = soup.find("script", {"id": "hgf-viewer-data", "type": "application/json"})
    assert slot is not None, "injection slot missing from rendered HTML"
```

**pyproject.toml change:** Add to `[project.optional-dependencies] dev`:

```toml
"beautifulsoup4>=4.12",
```

(It is already a transitive dep but should be explicit in dev for test imports.)

---

## What NOT to Add for v1.3

| Package | Why Not |
|---|---|
| svgwrite / cairosvg | SVG stays hand-rolled in the HTML template. The existing template already has working SVG geometry functions (`hexPts`, `diamPts`, `retract`) as JS — no Python SVG library is needed until publication-quality static export (v1.4+) |
| plotly / bokeh / altair | Scope C explicitly defers publication-quality rendering; these pull in large JS bundles incompatible with the self-contained output requirement |
| lxml | bs4 with `html.parser` covers all structural test needs; lxml is not in ds_env and requires a C build |
| Mako | jinja2 is already installed and sufficient |
| numpyro / SVI | Not in ds_env; existing `fit_vb_laplace_patrl` is the Laplace path; no new fitting code in v1.3 |
| pyhgf.plots / graphviz | `plot_network()` uses graphviz for graph rendering — not needed for the viewer scaffold which does its own SVG |
| React 19 | Breaks `ReactDOM.createRoot()` concurrent API used in the existing template |
| syrupy | More complex snapshot setup; pytest-snapshot is sufficient |

---

## Version Compatibility Summary

| Package | Version in ds_env | Pinned Constraint | Notes |
|---|---|---|---|
| pyhgf | 0.2.10 | `>=0.2.8,<0.3` (existing) | `AdjacencyLists` API stable across 0.2.x |
| jinja2 | 3.1.6 | `>=3.1,<4` | Already transitive dep; make explicit |
| beautifulsoup4 | 4.13.4 | `>=4.12` | Dev dep; html.parser (no lxml) |
| arviz | 0.22.0 | `>=0.21.0` (existing) | `az.summary()`, `az.hdi()` API stable |
| numpy | 2.2.6 | `>=2.0.0,<3.0` (existing) | JAX array coercion |
| pytest-snapshot | not installed | `>=0.9.0` (new, dev) | Add to dev extras |
| React (CDN) | 18.2.0 (template) | Pin at 18.2.0 | Do NOT upgrade to 19 |
| Babel Standalone (CDN) | 7.23.2 (template) | Pin at 7.23.2 | Proven with existing JSX |

---

## pyproject.toml Delta

Minimal diff from the current `pyproject.toml`:

```toml
[project.dependencies]
# ADD (currently transitive only, make explicit):
"jinja2>=3.1,<4",

[project.optional-dependencies]
dev = [
    "ruff>=0.4",
    "mypy>=1.10",
    "pytest>=8.0",
    "pytest-cov>=5.0",
    "pytest-snapshot>=0.9.0",    # ADD — HTML snapshot regression tests
    "beautifulsoup4>=4.12",       # ADD — structural HTML test assertions
]
```

---

## Sources

- pyhgf 0.2.10 `Network` internals — verified at runtime in ds_env (`_inspect_pyhgf.py`, 2026-04-24); `AdjacencyLists` source via `inspect.getsource`
- jinja2 3.1.6 — verified installed in ds_env; `Environment(loader=BaseLoader())` tested at runtime
- beautifulsoup4 4.13.4 — verified installed in ds_env; `html.parser` round-trip tested
- arviz 0.22.0 — verified installed in ds_env; `az.summary()` signature confirmed via `help()`
- React / React-DOM / Babel Standalone versions — cdnjs.com API (`api.cdnjs.com/libraries/{lib}?fields=version`), 2026-04-24; current latest is React 19.1.1, Babel 7.28.4 — template stays on 18.2.0 / 7.23.2 (intentional pin)
- pytest-snapshot 0.9.0 — PyPI (`pypi.org/pypi/pytest-snapshot/json`), 2026-04-24
- syrupy 5.1.0 — PyPI, 2026-04-24; considered and rejected (see dev-only section)
- `pyproject.toml` — read directly from repo root, 2026-04-24

---
*Stack research for: v1.3 Generic HGF Viewer scaffold (src/prl_hgf/viz/)*
*Researched: 2026-04-24*
