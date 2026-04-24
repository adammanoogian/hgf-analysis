# Phase 23 Research: Export + Template Promotion

**Researched:** 2026-04-24
**Domain:** HTML template audit + Jinja2 rendering + CDN asset inlining + JSON-in-HTML injection safety
**Confidence:** HIGH (grounded in direct reads of the installed seed template, ds_env probes for jinja2 3.1.6 / bs4 4.13.4 / pyhgf 0.2.8, and empirical JSON/CDN fetch tests run in ds_env on 2026-04-24)

## Summary

Phase 23 is mostly a template-surgery + plumbing phase with four tightly-coupled
subsystems: (1) audit and promote `figures/patrl_hgf_model.html` to generic
`figures/hgf_viewer.html`, (2) build `src/prl_hgf/viz/export.py` with a single
public `render_viewer_html(spec)` function, (3) inline React + Babel CDN assets
at render time via `urllib.request`, (4) ship a `pytest-snapshot` + `bs4`-based
test at `tests/test_viz_export.py`. No new Python patterns — everything is
stdlib + jinja2 + existing viz module.

Three findings change what the planner should specify:

1. **`json.dumps(..., ensure_ascii=True)` does NOT escape `</script>`** —
   verified empirically in ds_env. The ROADMAP's P4 claim that
   `ensure_ascii=True` "neutralizes `</script>` injection" is half true: it
   escapes newlines, unicode, U+2028/U+2029, and control chars, but the literal
   bytes `</script>` pass through unchanged. A post-encode pass
   (`.replace("</", "<\\/")` — the canonical MDN/OWASP JSON-in-HTML mitigation)
   is REQUIRED in addition to `ensure_ascii=True`, or the injected JSON must
   never contain user-authored HTML strings.

2. **Direct browser-open of the template file is incompatible with naive
   Jinja2 tokens** — if the SOURCE template contains `{{ network_spec_json }}`
   inside a `<script type="application/json">` tag, opening the unrendered
   file in a browser will trigger a `JSON.parse` failure on the Jinja token.
   Mitigation: embed a **valid default JSON blob** in the source template
   (PAT-RL 3-level pre-fit fixture content) and do string-surgery replacement
   of that default at render time. This doubles as a "it renders something
   meaningful when opened bare" property — useful for template QA.

3. **`pytest-snapshot` is NOT installed in `ds_env`** — verified
   `ModuleNotFoundError: No module named 'pytest_snapshot'` via `conda run -n
   ds_env python -c "import pytest_snapshot"`. `jinja2` 3.1.6 and `bs4`
   4.13.4 ARE present. The DEPS-01 pip-install step is real work, not a
   rubber-stamp. ROADMAP's P15 guard catches this if the planner enforces an
   actual `python -c "import X, Y, Z"` import check at the end of plan 1.

**Primary recommendation:** Split Phase 23 into **five plans** (see §11):
audit-first (the P11 guard), deps bump, template promotion, export.py
implementation, tests. The audit MUST run and produce `TEMPLATE_AUDIT.md`
before a single line of the generic template is written — this is the single
most load-bearing procedural rule in the phase.

## 1. PAT-RL Seed Template Audit (Preview)

Ground-truth read of `figures/patrl_hgf_model.html` (677 lines). This preview
catalogs hardcoded PAT-RL values; the actual `TEMPLATE_AUDIT.md` artifact
produced in plan 1 should be a direct copy with the same classifications.

### Classification legend

- **(R) Remove** — delete entirely; has no home in a generic viewer
- **(I) Inject** — replace with a value from `NetworkSpec` JSON
- **(G) Conditional-guard** — keep but gate on `task == "pat_rl"` or
  similar spec-derived field (deferred to v1.4 phenotype overlay — for v1.3
  scope, "conditional-guard" effectively means "delete for now")

### Title + metadata

| Line | Content | Classification | Rationale |
|------|---------|----------------|-----------|
| 6 | `<title>PAT-RL HGF Model</title>` | I | Replace with `<title>{{ title }}</title>` injected from spec `title` field (fallback: "HGF Viewer") |

### Phenotype block — the largest surgical excision

| Lines | Content | Classification |
|-------|---------|----------------|
| 45-51 | `const PC = {balanced, reward_blunted, threat_hypervigilant, both_disrupted}` phenotype color map | R |
| 53-87 | `const PHENOS = [...]` — 4 phenotypes with ANS framing ("Healthy SNS / PNS reciprocity", "Sympathetic hyperactivation", etc.) | R |
| 125 | `const [phenoId, setPhenoId] = useState("balanced")` | R |
| 128 | `const pheno = PHENOS.find(...)` | R |
| 134-136 | `hlN`, `hlE`, `hlP` phenotype highlight helpers | R |
| 156-158 | `nC`, `eC`, `pC` functions using `hlN/hlE/hlP` — rewrite to pass-through | R (rewrite to identity when no phenotype layer) |
| 231-244 | Entire `<Blk title="ANS PHENOTYPES (2×2)">` sidebar block | R |

**Scope note:** Phenotype overlay is POLISH-02, deferred to v1.4. The v1.3
generic template removes all of this. Do NOT try to "make PHENOS come from
injected JSON" — that is scope creep into v1.4 territory.

### ANS / SNS / PNS framing (response-model-specific prose)

The ROADMAP requirement TEMPLATE-09 calls for "decision equation text derived
from spec (no hardcoded 'PAT-RL bilinear' text)". The seed has PAT-RL-specific
body text in the `INFO` dict:

| Lines | Content | Classification |
|-------|---------|----------------|
| 91-112 | `const INFO = {...}` node tooltips, PAT-RL-specific body text referencing "u vs choices", `model_a/b/c_logp`, `response_patrl.py`, "anticipatory bradycardia", SNS/PNS phenotype notes | I/R (v1.3: keep only title, remove bodies; v1.4: replace bodies with injected per-node descriptions) |
| 91 | `"u — Binary state observation (node 0 in pyhgf)"` with PAT-RL-specific "hazard rate: h=0.03/0.10" | I |
| 94 | `response_patrl.py` literal reference in tooltip body | R |
| 94 | `V_r` / `V_s` "reward magnitude {1,3}" / "shock magnitude {1,3}" PAT-RL-specific values | I (from spec `parameters` section) |
| 95 | `"ΔHR — Anticipatory bradycardia"` — PAT-RL autonomic covariate | G (v1.3: R) |
| 96 | Model A/B/C equations | I (from spec response_model block — see §6) |
| 103-104 | γ, α parameter tooltips with PNS/SNS framing | R |
| 110, 111 | `dhr_ev`, `dhr_resp` tooltips | G (v1.3: R) |

### Response model controls

| Lines | Content | Classification |
|-------|---------|----------------|
| 122 | `const [respModel, setRespModel] = useState("C");` | I — default driven by `spec.response_model.default` or removed (v1.3: remove since no response-model variants in generic case) |
| 131 | `const hasDHR = respModel === "B" \|\| respModel === "C";` | R (v1.3: no DHR) |
| 132 | `const hasAlpha = respModel === "C";` | R |
| 216-229 | `<Blk title="RESPONSE MODEL">` sidebar — Model A/B/C radio buttons | R (v1.3: no response-model toggle; the generic viewer shows a single model) |
| 343-357 | Response model equation panel with Models A/B/C conditional text | I — single injected equation text from `spec.response_model.equation` |

### DHR node + edges (PAT-RL autonomic covariate)

| Lines | Content | Classification |
|-------|---------|----------------|
| 40 | `dhr: { fill:"#E8F5E9", stroke:"#388E3C", ... }` — the color slot for the ΔHR node | G (v1.3: R — remove since v1.3 has no autonomic node) |
| 42 | `eDHR: "#388E3C"` palette entry | G |
| 576-607 | Entire `{hasDHR && (...)}` ΔHR input node block with γ and α edges | R |
| 540-550 | `Vᵣ` / `Vₛ` reward/shock magnitude diamond nodes (PAT-RL 2×2 magnitudes) | R (v1.3: generic viewer has no magnitudes; for PAT-RL 3-level the fixture focuses on HGF topology only) |
| 251 | `{sh:"dia", c:C.dhr, t:"ΔHR / magnitude input"}` notation legend entry | R |

### EV (expected value) block — PAT-RL-specific computation

| Lines | Content | Classification |
|-------|---------|----------------|
| 534-562 | `EV = (1−P_d)·Vᵣ − P_d·Vₛ` computation block | R (v1.3: the generic template does not render a task-specific EV computation — that is a response-model-specific visualization, deferred to v1.4 via spec-driven rendering) |
| 302 | `<rect ...fill={C.ev.stroke}...>` EV band background | R |

### HGF level radio buttons

| Lines | Content | Classification |
|-------|---------|----------------|
| 121 | `const [hgfLevel, setHgfLevel] = useState("3level");` | **I (P10 GUARD)** — initial state MUST come from injected `NetworkSpec.hgf_level` field, NOT hardcoded `"3level"` |
| 129-130 | `const is3 = hgfLevel === "3level"; const isMM = hgfLevel === "2level_mm";` | Keep (derived) |
| 202-214 | `<Blk title="HGF LEVEL">` radio buttons | KEEP (user toggle is fine for manual inspection; initial state seeded from injected spec) |

### Literal PAT-RL citation / bradycardia references

ROADMAP called out `Klaassen` as a citation to remove but `Klaassen` does NOT
appear in the seed template (verified by Grep). `bradycardia` appears at:

| Line | Content | Classification |
|------|---------|----------------|
| 110 | `dhr_ev` tooltip body | R (tied to dhr_ev removal) |
| 111 | `dhr_resp` tooltip body | R |

### Notation sidebar

| Lines | Content | Classification |
|-------|---------|----------------|
| 247-275 | `<Blk title="NOTATION">` block — shape legend + edge style legend | KEEP (TEMPLATE-10) — but remove the ΔHR entry (line 251) and the "PNS autonomic path" entry (line 266) |

### Helper SVG geometry (PRESERVE)

| Lines | Content | Classification |
|-------|---------|----------------|
| 115 | `hexPts` helper | KEEP (TEMPLATE-03 requires hexagon shape rendering) |
| 116 | `diamPts` helper | KEEP |
| 117 | `retract` helper | KEEP |

Scope note: per ROADMAP scope discipline "hexPts/diamPts helper functions
remain in the JS template only (no Python geometry code introduced)."

### Audit grep terms (from ROADMAP success criterion 1)

The committed `TEMPLATE_AUDIT.md` must show grep output for each of:
`balanced`, `reward_blunted`, `threat_hypervigilant`, `both_disrupted`,
`Klaassen`, `bradycardia`, `C.dhr`, `PHENOS`, `shock_mag`, `reward_mag`,
`response_patrl`. Pre-planning grep counts in the seed (2026-04-24):

- `balanced` — 5 hits (lines 47, 56, 56, 62)
- `reward_blunted` — 4 hits (lines 48, 64, 64, 69)
- `threat_hypervigilant` — 4 hits (lines 49, 72, 72, 77)
- `both_disrupted` — 4 hits (lines 50, 80, 80, 85)
- `Klaassen` — 0 hits (ROADMAP listed it but it is absent)
- `bradycardia` — 2 hits (lines 110, 111)
- `C.dhr` — 8 hits (lines 251, 540, 541, 546, 547, 580, ...)
- `PHENOS` — 3 hits (lines 54, 128, 232)
- `shock_mag` — 1 hit (line 94)
- `reward_mag` — 1 hit (line 94)
- `response_patrl` — 2 hits (lines 94, 96)

**Total terms to remove:** ~34 unique occurrences across 10 regions. None
require partial rewrites; all are either block-level excisions (PHENOS array,
INFO bodies, ΔHR SVG block) or one-line replacements.

## 2. Jinja2 Injection Strategy

Two viable strategies. Recommend **Strategy B (string surgery on a valid
default)** for its direct-browser-open property.

### Strategy A: Raw Jinja2 tokens in script tag

```html
<!-- figures/hgf_viewer.html -->
<script type="application/json" id="viz-network-spec">{{ network_spec_json }}</script>
```

**Pros:** Idiomatic Jinja2; one-line template change; `StrictUndefined`
environment would raise if the variable is missing.

**Cons:**
- Opening the unrendered `figures/hgf_viewer.html` in a browser triggers
  `SyntaxError: Unexpected token '{' in JSON at position 0` when the
  template script at mount runs `JSON.parse`. The template is not
  browser-openable as a standalone QA artifact.
- Feels idiomatic Python, but the v1.3 module's stated property (per
  REQUIREMENTS SCHEMA-05 and the roadmap phase goal) is that the template
  be browser-openable for manual audit.

### Strategy B: String-surgery replacement of a valid default blob

```html
<!-- figures/hgf_viewer.html -->
<script type="application/json" id="viz-network-spec">
{"n_nodes": 3, "input_idxs": [0], "nodes": [...], "hgf_level": "3level"}
</script>
```

The template ships with a **valid default JSON payload** (the PAT-RL 3-level
pre-fit fixture content). `render_viewer_html(spec)` then surgically replaces
the content between the marker tags.

**Implementation:**

```python
# src/prl_hgf/viz/export.py
import re

_MARKER_RE = re.compile(
    r'(<script type="application/json" id="viz-([a-z\-]+)">)(.*?)(</script>)',
    re.DOTALL,
)

def _inject_markers(template: str, payload: dict[str, str]) -> str:
    """Replace content between each <script id="viz-{name}"> tag.

    Raises ValueError if a named marker from `payload` is absent.
    """
    replaced_names: set[str] = set()

    def _replace(m: re.Match) -> str:
        name = m.group(2)
        if name in payload:
            replaced_names.add(name)
            return f"{m.group(1)}\n{payload[name]}\n{m.group(4)}"
        return m.group(0)  # untouched marker -> leave default

    out = _MARKER_RE.sub(_replace, template)
    missing = set(payload) - replaced_names
    if missing:
        raise ValueError(
            f"injection marker 'viz-{sorted(missing)[0]}' not found in template"
        )
    return out
```

**Pros:**
- Unrendered `figures/hgf_viewer.html` is a fully working demo — opens in
  any browser, renders the PAT-RL 3-level topology from the baked-in JSON.
  This property is load-bearing for manual QA and for sending the bare
  template to collaborators as a "look at this visualization" artifact.
- The regex match scope is bounded by the script tag, so `</script>` inside
  the replaced JSON payload (after `<\/` escape) remains scoped correctly.
- No Jinja2 dependency for core injection. (Jinja2 can still be used for
  the outer CDN asset inlining — see §3.)
- Matches the EXPORT-04 contract cleanly — `set(payload) - replaced_names`
  gives the missing-marker set, which becomes the ValueError message.

**Cons:**
- Requires the planner to specify the valid-default-JSON content (plan 3
  lands a `data/viz_fixtures/patrl_3level_prefit.json` cross-reference).
- Regex-based replacement is fragile if the template ever contains
  nested script tags inside the JSON payload (unlikely, and mitigated by
  the `</` escape).

### Recommendation

Use **Strategy B** for the `viz-network-spec` and `viz-posterior-summary`
markers, AND use Jinja2 for the CDN inlining injections (which happen once at
the top of the template and don't have the "must-render-blank" property):

```html
<!-- hgf_viewer.html -->
{% if react_inlined %}
<script>{{ react_inlined }}</script>
<script>{{ react_dom_inlined }}</script>
<script>{{ babel_inlined }}</script>
{% else %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/18.2.0/umd/react.production.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react-dom/18.2.0/umd/react-dom.production.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/7.23.2/babel.min.js"></script>
{% endif %}
```

This keeps the template browser-openable (CDN fallback when no
Jinja2 rendering) AND allows `render_viewer_html()` to inline the assets
into the returned string.

**However:** this uses Jinja2 for the `{% if %}` block. An even simpler
approach — which the planner may prefer — is to do a second round of string
surgery (`template.replace('<script src="https://cdnjs..."></script>',
f'<script>{inlined}</script>')`). This eliminates the Jinja2 dependency
entirely, but requires the three CDN `<script src=...>` lines to be
canonical-form byte-exact in the template. DEPS-01 adds Jinja2 as a runtime
dep regardless, so the Jinja2 approach is zero-cost.

**Final recommendation:** Jinja2 `Environment(loader=BaseLoader())` + manual
`env.from_string(template).render(...)` for the `{% if react_inlined %}`
block; Strategy B string-surgery for the JSON markers. This gives a clean
separation: Jinja2 handles the "build variants" (inlined vs CDN-fallback);
string-surgery handles the "live data injection" (JSON payloads that must
survive browser-direct-open).

## 3. CDN Asset Inlining Implementation

### URLs verified 2026-04-24 (empirical HEAD/GET from ds_env)

| Asset | URL | Size (bytes) | Fetch time (ds_env) |
|-------|-----|--------------|---------------------|
| React 18.2.0 | `https://cdnjs.cloudflare.com/ajax/libs/react/18.2.0/umd/react.production.min.js` | 10,737 | 0.19 s |
| React-DOM 18.2.0 | `https://cdnjs.cloudflare.com/ajax/libs/react-dom/18.2.0/umd/react-dom.production.min.js` | 131,882 | 0.13 s |
| Babel 7.23.2 | `https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/7.23.2/babel.min.js` | 2,796,613 | 0.24 s |
| **Total** |  | **2,939,232** (~2.80 MiB) | ~0.6 s cold |

Backup mirror (unpkg) returns byte-identical blobs at identical sizes.

### Size implication

The final rendered HTML will be ≥2.9 MiB per call. This is acceptable for a
one-shot visualization artifact but means **don't do this inlining in the
snapshot test** — `pytest-snapshot` with a 2.9 MiB fixture is miserable.
Snapshot tests should use an `inline_cdn=False` (or `offline_mode=True` —
matching the EXPORT-05 "offline-mode switch" verb) code path that leaves the
CDN `<script src=...>` tags intact.

### urllib.request + SSL on Windows

Tested empirically in ds_env (Python 3.11 or 3.12 — both work on Windows
with miniforge3). Default `ssl.create_default_context()` succeeds against
both cdnjs.cloudflare.com and unpkg.com without extra configuration. The
project's Windows install already has `certifi` bundled via conda-forge and
`SSL_CERT_FILE=...\Library\ssl\cacert.pem` set.

**Recommended implementation:**

```python
import ssl
import urllib.request

_CDN_SOURCES: dict[str, str] = {
    "react": "https://cdnjs.cloudflare.com/ajax/libs/react/18.2.0/umd/react.production.min.js",
    "react_dom": "https://cdnjs.cloudflare.com/ajax/libs/react-dom/18.2.0/umd/react-dom.production.min.js",
    "babel": "https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/7.23.2/babel.min.js",
}

def _fetch_cdn_asset(url: str, timeout: float = 30.0) -> str:
    ctx = ssl.create_default_context()
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, context=ctx, timeout=timeout) as resp:
        return resp.read().decode("utf-8")
```

**Pitfalls:**

- Don't use `urllib.request.urlretrieve()` with file path — the phase writes
  to no disk (return value is a string).
- `ssl.CERT_NONE` temptation on Windows if certs fail — NEVER DO THIS. The
  correct fix for any Windows cert issue is updating `certifi` via
  `conda update certifi` or setting `SSL_CERT_FILE` (already set in ds_env).
- Babel at 2.8 MiB may time out on slow connections. Default timeout 30 s
  is generous (cdnjs peers at <100 ms in ds_env); the phase may add
  `fetch_timeout: float = 30.0` as an `render_viewer_html()` kwarg for
  CI-environment tuning.
- **Offline mode switch (EXPORT-05):** `render_viewer_html(spec,
  offline_mode=False)` — when `False`, skip CDN fetch and leave the
  template's raw `<script src="...">` tags intact (Jinja2 `{% else %}`
  branch per §2). Used by CI and by any test that doesn't want to depend on
  a network. Default: `True` (self-contained).
- **`bytes.decode("utf-8")` not `bytes.decode()`** — explicit encoding
  prevents accidental CP-1252 decode on Windows when locale is not UTF-8.

### In-memory caching

Consider `functools.lru_cache` on `_fetch_cdn_asset` so repeated renders in
the same Python process don't re-download 2.8 MiB of Babel. Optional; not
load-bearing.

## 4. JSON-in-HTML Escape Safety

### Empirical test (ds_env 2026-04-24)

Script: `json.dumps({"k": "</script>"}, ensure_ascii=True)`
Output: `{"k": "</script>"}`

`ensure_ascii=True` does **NOT** escape the `</` sequence. The `ensure_ascii`
flag only escapes: non-ASCII codepoints (U+0080+), control chars (U+0000-
U+001F), U+2028/U+2029 (JS line separators). Forward slash is a printable
ASCII character, unchanged.

### Canonical escape pattern (MDN / OWASP / json-safe/HTML5)

The widely-cited mitigation in the HTML5 spec note and OWASP
"JSON-in-HTML-safely" guides:

```python
safe = json.dumps(obj, ensure_ascii=True).replace("</", "<\\/")
```

This produces `<\/script>` instead of `</script>`. Inside a JSON string
literal (inside a `<script type="application/json">` tag), this is a
**valid-JSON** escape sequence that deserializes back to `</script>` on
`JSON.parse()`. The HTML parser, scanning for `</script>` to close the tag,
does not match `<\/script>` (the `<\/` four characters do not begin a
closing tag).

**Key test** (produced by the ds_env probe, matches above):

```
Before:  {"title": "</script><script>alert('xss')</script>"}
After:   {"title": "<\/script><script>alert('xss')<\/script>"}
  - JS sees string literal "</script><script>alert('xss')</script>"
  - HTML sees no </script> until the actual closing tag.
```

### Recommended helper

```python
def _json_for_html(obj: Any) -> str:
    """Serialize obj as JSON safe to embed inside <script type="application/json">."""
    return json.dumps(obj, ensure_ascii=True).replace("</", "<\\/")
```

**Note on ensure_ascii:** Keep it. The four mitigations are separate:
1. `ensure_ascii=True` — escapes control chars, U+2028/U+2029, non-ASCII
   (for defense against broken locales / editor mangling).
2. `.replace("</", "<\\/")` — escapes the HTML tag-close sequence (the
   actual HTML-breakout defense).
3. Wrap in `<script type="application/json">` NOT `<script>` — the
   `application/json` type prevents the browser from executing the
   contents as JavaScript.
4. Parse via `document.getElementById("viz-network-spec").textContent` +
   `JSON.parse(...)` NOT `eval(...)` or inline `<script>var x = ...`.

All four defenses are cheap. Ship all four.

### HTML entity encoding is NOT the right tool

Tempting alternative: `html.escape(json.dumps(obj))` producing
`&lt;/script&gt;`. This is WRONG: the `<script type="application/json">`
content is textContent-only; it is NOT parsed as HTML. Entity-encoding
produces `&lt;/script&gt;` in the textContent, which then fails
`JSON.parse` because `&lt;` is not a JSON token.

**Only the `</` → `<\/` replacement is correct inside JSON payloads.**

## 5. Missing-Marker Detection

EXPORT-04 contract: `_inject_markers()` raises
`ValueError("injection marker 'viz-{name}' not found in template")` when a
named marker is absent.

### Option A: Post-scan after regex replacement (recommended)

Per §2 Strategy B, the regex-based replacement builds a `replaced_names`
set; compare against the input `payload.keys()`:

```python
missing = set(payload) - replaced_names
if missing:
    raise ValueError(
        f"injection marker 'viz-{sorted(missing)[0]}' not found in template"
    )
```

**Pros:** single pass over template text; O(n) where n = template length;
precise error message; `sorted()` makes it deterministic when multiple
markers are missing.

**Cons:** none material.

### Option B: Pre-scan via `bs4.BeautifulSoup`

```python
soup = BeautifulSoup(template, "html.parser")
for name in payload:
    tag = soup.find("script", {"id": f"viz-{name}"})
    if tag is None:
        raise ValueError(...)
```

**Pros:** robust against malformed HTML edge cases.

**Cons:** `bs4` is a **dev-only** dependency (DEPS-01 adds it under
`optional-dependencies.dev`). Using it inside `export.py` would promote
bs4 to a runtime dep. **Do not use bs4 in `export.py`.** Reserve bs4 for
`tests/test_viz_export.py` where it validates the output.

### Option C: Jinja2 `StrictUndefined`

Jinja2 has `jinja2.StrictUndefined` which raises on any access to an
undefined variable. But since this phase uses Jinja2 only for the CDN `{%
if %}` block (per §2), StrictUndefined doesn't cover the JSON markers
(those go through regex surgery, not Jinja2 variable substitution).

### Recommendation

**Option A (post-scan).** Single pass, precise error, no extra runtime deps.
The plan should specify the `re.compile` pattern and the `sorted(missing)[0]`
error message format — both are load-bearing for TEST-04.

### Test coverage (TEST-04)

```python
def test_missing_marker_raises(snapshot):
    bad_template = "<html>no script tags</html>"
    with pytest.raises(ValueError, match=r"injection marker 'viz-network-spec'"):
        _inject_markers(bad_template, {"network-spec": "{}"})

def test_injection_roundtrip():
    template = (
        '<script type="application/json" id="viz-network-spec">{}</script>'
    )
    out = _inject_markers(template, {"network-spec": '{"n_nodes": 3}'})
    soup = BeautifulSoup(out, "html.parser")
    tag = soup.find("script", {"id": "viz-network-spec"})
    parsed = json.loads(tag.string)
    assert parsed == {"n_nodes": 3}
```

## 6. React Template Data-at-Mount Pattern

The seed uses `useState("3level")` hardcoded default (line 121 of
`patrl_hgf_model.html`). P10 GUARD requires the generic template's initial
state to come from injected JSON, NOT from this hardcoded string.

### React pattern for "inject JSON at mount"

Standard React pattern (works with plain React 18 + Babel standalone — no
build step):

```jsx
// inside App()
const specTag = document.getElementById("viz-network-spec");
const initialSpec = JSON.parse(specTag.textContent);
const [hgfLevel, setHgfLevel] = React.useState(initialSpec.hgf_level || "3level");
const [spec, setSpec] = React.useState(initialSpec);
```

The `|| "3level"` fallback is defensive — if for some reason the JSON lacks
`hgf_level` (pre-fit path with older fixture), the UI degrades to the seed's
default. Per P10, the fixture SHOULD always include `hgf_level`.

### Reading the JSON once (top-level, not inside component)

Cleaner pattern: parse the JSON once outside the component tree (at module
scope in the `<script type="text/babel">` block):

```jsx
<script type="text/babel">
const NETWORK_SPEC = JSON.parse(
  document.getElementById("viz-network-spec").textContent
);
const POSTERIOR_SUMMARY = (() => {
  const el = document.getElementById("viz-posterior-summary");
  if (!el || !el.textContent.trim()) return null;
  try { return JSON.parse(el.textContent); } catch { return null; }
})();

function App() {
  const [hgfLevel, setHgfLevel] = React.useState(NETWORK_SPEC.hgf_level || "3level");
  ...
}
</script>
```

**Advantages:**
- Parsed once per page load, not once per React render.
- `POSTERIOR_SUMMARY` gracefully handles the pre-fit case where the tag is
  present but empty (needed for Phase 24 extension — the tag exists in the
  template, gets populated only when `idata` is supplied).
- Module-scope constants visible to helper functions without prop-drilling.

### What does NetworkSpec need to expose for React?

The current `NetworkSpec` dataclass (from `src/prl_hgf/viz/schema.py`) does
NOT have an `hgf_level` field. It has `n_nodes` and a `nodes` tuple with
per-node `level: int`. The React side needs a top-level level indicator.

**Options:**

1. **Add `hgf_level: str` to NetworkSpec.** Values: `"2level"`, `"3level"`,
   `"2level_mm"`. Computed in `build_network_spec` as:
   ```python
   max_level = max(n.level for n in nodes)
   n_input = len(input_idxs)
   if max_level == 3:
       hgf_level = "3level"
   elif n_input > 1 and max_level == 2:
       hgf_level = "2level_mm"
   else:
       hgf_level = "2level"
   ```

2. **Derive on the React side.** The JS code computes
   `const is3 = spec.nodes.some(n => n.level === 3)` from the injected
   tuple. This avoids a schema change.

3. **Derive on the Python export side.** `export.py` computes a flat
   `hgf_level` field and embeds it alongside the spec dump, NOT inside
   NetworkSpec itself.

**Recommendation:** **Option 2 (React-side derivation)**. Rationale:

- Schema-01..05 are all "Complete" per REQUIREMENTS.md. Adding a field
  now drifts the schema from its Phase-22 contract.
- `spec.nodes.some(n => n.level === 3)` is trivial JS.
- `spec.input_idxs.length > 1` distinguishes multimodal from scalar.

This keeps the parallel-stack invariant (no `src/prl_hgf/viz/schema.py`
modifications needed) and P10 becomes a JS-side derivation instead of a
Python-side field addition.

### Concrete P10 guard verification

After Phase 23, the JS code in `figures/hgf_viewer.html` must satisfy:

```bash
# The hardcoded default must be replaced with derivation from injected JSON.
grep -n 'useState("3level")' figures/hgf_viewer.html    # should return 0 matches
grep -n 'useState(.*hgf_level' figures/hgf_viewer.html  # should return ≥1 match
grep -n 'NETWORK_SPEC.nodes.some' figures/hgf_viewer.html  # should return ≥1 match (or equivalent derivation)
```

## 7. 2-level + Multimodal Graceful Rendering

TEMPLATE-07 requires: "when `n_levels == 2`, the L3 band is removed entirely
(no dead space), κ square absent from equations panel, no ghost-node
rendering for μ₃[k-1]."

### The seed already does most of this

Lines 298, 311, 359-409, 311: all L3 rendering is wrapped in `{is3 && (...)}`.
The equation panel line 311-316 is wrapped in `{is3 && (...)}`. The ghost
μ₃[k-1] node at line 371-374 is inside the `{is3 && (...)}` block. The κ
parameter square line 399 is inside the L3 block.

### The dead-space concern

Even when `{is3 && ...}` excludes the L3 visual elements, the SVG viewBox
height `SH` is computed at line 152: `const SH = respY + 104;` where
`respY = evY + 104` and `evY = rowI + 92` and `rowI = is3 ? 390 : 305`.
**This already adapts.** When `is3 === false`, `rowI` shrinks from 390 to
305, and all downstream y-coords shift up. No dead space.

The level-band rectangles at lines 298-302 use `is3 ?` to conditionally
skip the L3 band. Lines 299-302 draw L2 and L1 bands at heights based on
`rowB` and `rowI`, which also shift when `!is3`. The EV band (line 301)
and response band (line 302) likewise.

**Conclusion:** 2-level layout already works in the seed. The planner
needs to verify via a visual inspection render of the 2-level PAT-RL
fixture — NOT a code change.

### Multimodal rendering

Lines 447-503: the multimodal case wraps value-coupling and L1 rendering in
`{isMM ? (...) : (...)}` branches. `isMM = hgfLevel === "2level_mm"`. The
generic template must:

1. **Derive `isMM` from injected JSON** — `spec.input_idxs.length > 1 && !is3`.
2. **Make the two input diamonds u₁, u₂ labeled correctly** — the seed
   labels them "primary obs." / "secondary obs." which is fine for a
   generic template. Optionally replace with `spec.nodes[0].label` / ... if
   the NetworkSpec has labels. Current NetworkSpec does NOT have a label
   field — keep the seed labels.

### React state initialization for multimodal

Following §6 recommendation:

```jsx
const INITIAL_HGF_LEVEL = (() => {
  const max_level = NETWORK_SPEC.nodes.reduce((m, n) => Math.max(m, n.level), 0);
  if (max_level >= 3) return "3level";
  if (NETWORK_SPEC.input_idxs.length > 1) return "2level_mm";
  return "2level";
})();

function App() {
  const [hgfLevel, setHgfLevel] = React.useState(INITIAL_HGF_LEVEL);
  ...
}
```

This is the **canonical P10 guard pattern** for the generic template.

## 8. pytest-snapshot + bs4 Workflow

### pytest-snapshot API (verified via GitHub README)

```python
# tests/test_viz_export.py
def test_render_prefit_snapshot(snapshot):
    snapshot.snapshot_dir = "tests/fixtures/viz"
    spec = _load_prefit_fixture()
    html = render_viewer_html(spec, offline_mode=True)
    snapshot.assert_match(html, "prefit_patrl_3level.html")
```

**Directory layout (matches ROADMAP Phase 24 criterion 3):**

```
tests/
├── fixtures/
│   └── viz/
│       ├── prefit_patrl_3level.html    # snapshot locked
│       └── postfit_patrl_3level_laplace.html  # Phase 24 adds
├── test_viz_export.py
├── test_viz_inspector.py
├── test_viz_roles.py
└── test_viz_schema.py
```

**Update workflow:** `pytest --snapshot-update` regenerates all snapshots.
Review the diff carefully before committing.

**Deletion workflow:** `pytest --snapshot-update --allow-snapshot-deletion`
required for removing orphan snapshots.

### Snapshot brittleness: line endings on Windows

**CRITICAL GOTCHA:** Git on Windows may have `core.autocrlf` set to `true`
(converts `\n` → `\r\n` in working tree). The snapshot file on disk will
have CRLF, but the Python-generated string uses LF. `snapshot.assert_match`
will fail on the first CI run from Linux.

Mitigations:

- Repository-level: add `.gitattributes` with `tests/fixtures/viz/*.html
  text eol=lf` to force LF in snapshots.
- Test-level: normalize line endings in both the generated HTML and the
  snapshot before comparison:
  ```python
  html_normalized = html.replace("\r\n", "\n")
  snapshot.assert_match(html_normalized, "prefit_patrl_3level.html")
  ```

Phase 23 ships the snapshot test with line-ending normalization. Phase 24
inherits the convention.

### bs4 for structural assertions (not snapshot)

```python
def test_render_returns_valid_html():
    spec = _load_prefit_fixture()
    html = render_viewer_html(spec, offline_mode=True)
    soup = BeautifulSoup(html, "html.parser")  # stdlib-backed parser
    # TEST-04 requirements
    spec_tag = soup.find("script", {"id": "viz-network-spec"})
    assert spec_tag is not None
    payload = json.loads(spec_tag.string)
    assert payload["n_nodes"] == 3
    posterior_tag = soup.find("script", {"id": "viz-posterior-summary"})
    assert posterior_tag is not None  # present but empty in pre-fit
```

**Parser choice:** `"html.parser"` uses Python stdlib — zero additional
deps. `bs4` itself is the only import. The `lxml` parser is faster but
requires a C extension — do NOT use here.

### pytest-snapshot installation

```bash
# In ds_env
pip install "pytest-snapshot>=0.9.0" "beautifulsoup4>=4.12"
```

Then verify:

```bash
python -c "import pytest_snapshot; print(pytest_snapshot.__version__)"
python -c "import bs4; print(bs4.__version__)"
```

Only `pytest-snapshot` is new — `beautifulsoup4` 4.13.4 is already present.
The P15 guard in plan 1 should run both import checks.

### pytest.ini / pyproject.toml integration

No config changes beyond DEPS-01 required. pytest-snapshot auto-registers
the `snapshot` fixture via entry points. Existing
`[tool.pytest.ini_options]` in pyproject.toml already configures testpaths
and pythonpath correctly.

## 9. Parallel-Stack Invariant Confirmation

The invariant (from Phase 22 established via ROADMAP success criterion 5):

```bash
git diff --stat \
  src/prl_hgf/env/ src/prl_hgf/models/ src/prl_hgf/fitting/ \
  src/prl_hgf/analysis/ src/prl_hgf/gui/ src/prl_hgf/power/ \
  src/prl_hgf/simulation/
# must report "empty" at phase close
```

### Imports-to-avoid list for export.py

The file `src/prl_hgf/viz/export.py` must NOT import from:

- `prl_hgf.env.*` — task configs and trial sequence generators
- `prl_hgf.models.*` — HGF builders and response models
- `prl_hgf.fitting.*` — MCMC and Laplace fitters
- `prl_hgf.analysis.*` — group analysis, BMS, trajectory export
- `prl_hgf.gui.*` — ipywidgets explorer
- `prl_hgf.power.*` — BFDA power analysis
- `prl_hgf.simulation.*` — JAX-native cohort simulation

### Imports-allowed list

- `prl_hgf.viz.schema` — `NetworkSpec`, `NodeSpec` (for type hints in
  `render_viewer_html` signature)
- `prl_hgf.viz.inspector` — optional (for `_VERIFIED_AGAINST_PYHGF_VERSION`
  if embedded in HTML metadata; probably not needed)
- stdlib: `dataclasses`, `json`, `pathlib`, `re`, `ssl`, `typing`,
  `urllib.request`
- `jinja2` (after DEPS-01)

### No escape hatch needed

`render_viewer_html(spec)` consumes `NetworkSpec` as its only input. Schema
already has everything needed (`n_nodes`, `input_idxs`, `nodes`, `coord_name`,
`source_pyhgf_version`, `is_laplace`). No pyhgf Network pass-through needed.
No task-config read needed. No fitting-stack peek needed.

**Self-check before commit:**

```bash
# Should produce no matches:
grep -rE "^(from|import) prl_hgf\\.(env|models|fitting|analysis|gui|power|simulation)" \
  src/prl_hgf/viz/export.py
```

### Test file parallel-stack invariant

`tests/test_viz_export.py` is allowed to import from `prl_hgf.models.*` for
building fixture networks (matching the pattern already used in
`tests/test_viz_inspector.py` and `tests/test_viz_schema.py`). The invariant
applies to PRODUCTION code under `src/prl_hgf/`, not tests.

However, the simpler choice is: **load the JSON fixture from
`data/viz_fixtures/patrl_3level_prefit.json` directly** in the test without
importing any model-building function. This avoids re-running BFS inside the
test and keeps the snapshot fully deterministic.

```python
import json
from pathlib import Path
from src.prl_hgf.viz.schema import NetworkSpec, NodeSpec

def _load_prefit_fixture() -> NetworkSpec:
    raw = json.loads(Path("data/viz_fixtures/patrl_3level_prefit.json").read_text())
    # reconstruct NetworkSpec from JSON -- drops the 'visual' and 'parameters'
    # keys which belong to the fixture-for-humans, not the schema
    nodes = tuple(
        NodeSpec(
            idx=n["idx"], kind=n["kind"], level=n["level"], role=n["role"],
            branch_idx=n["branch_idx"],
            value_parents=tuple(n["value_parents"]),
            volatility_parents=tuple(n["volatility_parents"]),
            value_children=tuple(n["value_children"]),
            volatility_children=tuple(n["volatility_children"]),
        )
        for n in raw["nodes"]
    )
    return NetworkSpec(
        n_nodes=raw["n_nodes"],
        input_idxs=tuple(raw["input_idxs"]),
        nodes=nodes,
    )
```

**Note:** the fixture JSON currently has `visual` and `parameters` top-level
keys that are NOT part of NetworkSpec. The plan may want to either:

- (a) Strip these during the reconstructor (as above),
- (b) Embed them inside the rendered HTML as a SECOND injection payload
  (e.g., `viz-parameters` script tag) for the React panel to consume.

Recommendation: **(a) for v1.3**, **(b) deferred to v1.4**. The v1.3
generic template doesn't render parameter tooltips (those go into the
v1.4 sidebar polish), so strip them. This maintains the "v1.3 is topology
+ summary, not full panels" scope.

## 10. Risks + Pitfalls

### 10.1 `ensure_ascii=True` does NOT escape `</script>` (empirically verified)

**What goes wrong:** Injected JSON containing a user-authored string
(future POST-phase: task descriptions, node labels from YAML) with
`</script>` in it closes the injection tag early. Browser parses the
remaining JSON as HTML text, then parses the actual closing `</script>`
tag as a second closing tag — resulting in silent loss of the JSON payload
and potentially XSS if the string was "<script>alert(1)</script>".

**Why it happens:** The roadmap assumed `ensure_ascii=True` handles this
(P4 wording: "`ensure_ascii=True` to neutralize `</script>`"). It does not.

**Mitigation:** Pair `ensure_ascii=True` with `.replace("</", "<\\/")`.
Document this as the **canonical pattern** in `export.py`:

```python
def _json_for_html(obj: Any) -> str:
    """MDN-canonical JSON-in-HTML escape: ensure_ascii + tag-close escape."""
    return json.dumps(obj, ensure_ascii=True).replace("</", "<\\/")
```

**Test:** `tests/test_viz_export.py::test_json_for_html_escapes_script_close`
with a fixture containing `"</script>"` in a string field; verify output
contains `<\/script>` and can be re-parsed via `JSON.parse`.

### 10.2 Direct-browser-open of raw template with Jinja2 tokens fails

**What goes wrong:** If template source has `{{ network_spec_json }}` inside
`<script type="application/json">`, bare file-open in a browser triggers
`JSON.parse` SyntaxError. Collaborator opens the file, sees a broken
visualization, assumes the project is broken.

**Mitigation:** Strategy B from §2 — the template ships with a valid
default JSON blob (the PAT-RL 3-level fixture). Replacement is via regex
surgery, not Jinja2 `{{ }}`. Phase close CHECK:

```bash
python -c "
from pathlib import Path
import webbrowser
p = Path('figures/hgf_viewer.html').resolve()
print(f'Template path: {p}')
# Open manually and verify: visible topology renders, no console errors.
"
```

### 10.3 CDN fetch failures in CI / offline environments

**What goes wrong:** CI runs with network isolation (GitHub Actions:
`sudo ufw deny out`, or corporate firewalls). `urllib.request.urlopen`
hangs until `timeout=30.0` then fails the test.

**Mitigation:** `render_viewer_html(spec, offline_mode=False)` — add the
offline mode switch now (EXPORT-05). Snapshot tests and CI tests call with
`offline_mode=True` always; only the "manually open this HTML file"
workflow or end-user calls get the CDN-inlined bundle.

**Test:**

```python
def test_render_offline_has_cdn_script_tags():
    spec = _load_prefit_fixture()
    html = render_viewer_html(spec, offline_mode=True)
    assert 'src="https://cdnjs.cloudflare.com/' in html or \
           'src="https://unpkg.com/' in html
    assert 'ReactDOM' not in html  # inlined version would contain this

def test_render_inlined_has_react_source():
    spec = _load_prefit_fixture()
    html = render_viewer_html(spec, offline_mode=False)
    # React source contains specific strings that only appear inlined
    assert 'REACT_FRAGMENT_TYPE' in html or 'createElement' in html
    assert 'src="https://cdnjs' not in html  # no CDN fetches in inlined mode
```

### 10.4 Seed JS references PAT-RL data structures not in NetworkSpec

**What goes wrong:** PHENOS array has `hlN`/`hlE`/`hlP` node-highlight
maps (`["belief", "vol"]` etc.) that reference NODE IDS like `"belief"`
and `"vol"`. These are SEMANTIC names, NOT pyhgf integer indices. The
generic NetworkSpec only has integer indices. A direct promotion that
leaves PHENOS in place would reference names that don't exist in any
generic spec.

**Mitigation:** PHENOS is in the "R (remove)" category per §1. Remove
entirely. The v1.3 template has no phenotype overlay (POLISH-02 deferred).

### 10.5 Fixture JSON vs NetworkSpec schema mismatch

**What goes wrong:** `data/viz_fixtures/patrl_3level_prefit.json` was
written to match a human-readable fixture spec (with `visual`,
`parameters`, `task`, `model` top-level keys). The actual `NetworkSpec`
dataclass only has `n_nodes`, `input_idxs`, `nodes`, `coord_name`,
`source_pyhgf_version`, `is_laplace`. `dataclasses.asdict(spec)` produces
a different JSON shape than the fixture file.

**Mitigation:** Pick one:

- (a) **Make the fixture the NetworkSpec JSON** — `dataclasses.asdict`
  output; the `task`, `model`, `visual`, `parameters` keys are stripped.
  This is "v1.3 scope discipline": the viewer renders what the schema
  knows about. The fixture becomes literally `json.dumps(asdict(spec))`.
- (b) **Keep the fixture richer, split into two payloads** — inject
  `viz-network-spec` (the asdict output) AND `viz-parameters` (the
  `parameters` block). React consumes both.

**Recommendation: (a) for v1.3.** The `parameters` block goes away until
Phase 24 POST-02 adds posterior annotations (which ARE a richer schema
extension — explicit scope boundary). The `visual`, `task`, `model`
fields are not referenced by the v1.3 template.

Phase 23 adjusts `data/viz_fixtures/patrl_3level_prefit.json` per EXPORT-04
scope to strip these keys, OR it keeps the file as-is and the test harness
loads only the NetworkSpec-compatible subset (§9 approach).

### 10.6 pytest-snapshot not installed in ds_env

**What goes wrong:** `tests/test_viz_export.py` collects fine but every
test function that uses `snapshot` fixture fails with
`NameError: name 'snapshot' is not defined`. CI pipeline breaks silently.

**Mitigation:** DEPS-01 + P15 guard. Plan 1 (or wherever DEPS-01 lands) runs:

```bash
conda run -n ds_env pip install "pytest-snapshot>=0.9.0"
conda run -n ds_env python -c "import pytest_snapshot; print(pytest_snapshot.__version__)"
```

Verify BOTH before committing `pyproject.toml`.

### 10.7 Test file mypy / ruff complains

**What goes wrong:** `mypy tests/test_viz_export.py` produces:
- `error: Module "pytest_snapshot" not found` (stub issue)
- `error: Argument 2 to "assert_match" has incompatible type "str"`

**Mitigation:** Mirror the Phase 22 pattern — add `pytest_snapshot.*` to
the `ignore_missing_imports` list in `[[tool.mypy.overrides]]` in
pyproject.toml. No `cast()` needed.

### 10.8 Windows line endings in snapshot files

See §8. `tests/fixtures/viz/*.html text eol=lf` in `.gitattributes` +
line-ending normalization in the test. Easy to forget; will fail the
first cross-platform CI run.

### 10.9 React 18 `ReactDOM.createRoot` deprecation trap

**What goes wrong:** The seed template uses `ReactDOM.createRoot(document.
getElementById("root")).render(<App/>);` (line 673). This is React 18 API.
Pinned React 18.2.0 is fine, but if a future plan "just bumps React to 19",
the call signature changes.

**Mitigation:** Pin the CDN URL to `18.2.0` literally (not `18` or
`latest`). Phase 23 already does this (EXPORT-05 explicit version pin).

### 10.10 Jinja2 autoescape default

**What goes wrong:** `Environment(loader=BaseLoader())` has `autoescape=False`
by default. If the planner ever decides to route the JSON payload through
Jinja2 variable substitution (Strategy A from §2), `autoescape=False` means
HTML special chars in the payload are NOT escaped. Combined with the
`ensure_ascii` gap (pitfall 10.1), this is a double-unsafe path.

**Mitigation:** Stick with Strategy B (string-surgery, no Jinja2 for JSON
payloads). Document in `export.py` docstring.

## 11. Recommended Plan Breakdown (Planner Hint)

**Five plans.** Rationale: P11 audit-first + P15 deps-first gating,
template surgery is large enough to be its own plan, export.py is small
enough to co-land with CDN inlining, tests are always their own plan.

### Plan 1: Template audit + deps bump (no template changes yet)

**Files modified:** `pyproject.toml`,
`.planning/phases/23-export-template/TEMPLATE_AUDIT.md` (new).

- Run grep for all ROADMAP audit terms against
  `figures/patrl_hgf_model.html`; commit `TEMPLATE_AUDIT.md` with line
  numbers and R/I/G classification (see §1 preview).
- Add `jinja2>=3.1,<4` to `[project.dependencies]`.
- Add `pytest-snapshot>=0.9.0` and `beautifulsoup4>=4.12` to
  `[project.optional-dependencies.dev]`.
- Install in ds_env: `pip install pytest-snapshot beautifulsoup4`.
- Verify importable: `python -c "import jinja2, bs4, pytest_snapshot"`.
- Add `pytest_snapshot.*` to mypy overrides.
- **P11 guard satisfied** before any figures/hgf_viewer.html lines written.

**Why first:** P11 is a procedural rule. Writing the template before the
audit means the audit becomes retroactive — the wrong direction.

**Effort:** 0.5 dev days.

### Plan 2: Template promotion (figures/hgf_viewer.html)

**Files modified:** `figures/hgf_viewer.html` (new).

- Copy `figures/patrl_hgf_model.html` → `figures/hgf_viewer.html`.
- Apply every removal from TEMPLATE_AUDIT.md (plan 1 artifact).
- Apply every injection slot from TEMPLATE_AUDIT.md (placeholder default
  values from PAT-RL 3-level fixture).
- Replace `useState("3level")` with derivation from `NETWORK_SPEC`
  (P10 guard, §6 pattern).
- Add `<script type="application/json" id="viz-network-spec">{valid default}
  </script>` and `<script type="application/json" id="viz-posterior-summary">
  </script>` marker tags.
- Add `{% if react_inlined %}{% else %}` Jinja block for CDN sources.
- Verify: open `figures/hgf_viewer.html` in a browser — PAT-RL 3-level
  topology renders, no console errors. This is the "browser-openable
  without Python" property.

**Why second:** Template is the largest surface. All subsequent plans
depend on its shape.

**Effort:** 1 dev day.

### Plan 3: export.py + render_viewer_html

**Files modified:** `src/prl_hgf/viz/export.py` (new),
`src/prl_hgf/viz/__init__.py` (add `render_viewer_html` to `__all__`),
`data/viz_fixtures/patrl_3level_prefit.json` (strip non-schema keys per
§10.5 recommendation (a) — optional; may defer to Phase 24 if test loads
only the NetworkSpec-compatible subset).

- Write `render_viewer_html(spec: NetworkSpec, offline_mode: bool = False,
  template_path: Path | None = None) -> str`.
- Write `_inject_markers(template, payload)` per §5 Option A.
- Write `_json_for_html(obj)` per §4.
- Write `_fetch_cdn_asset(url)` per §3.
- Write `_inline_cdn_assets(template)` that uses Jinja2 env for
  `{% if react_inlined %}` block.
- Wire all three: marker surgery first, then Jinja2 render with
  `react_inlined` / `babel_inlined` context (or not, for offline_mode).
- **Parallel-stack invariant:** no imports from any `prl_hgf.{env, models,
  fitting, analysis, gui, power, simulation}` — verified via grep.

**Why third:** Depends on the template existing (plan 2) and deps being
installed (plan 1).

**Effort:** 1 dev day.

### Plan 4: tests (tests/test_viz_export.py)

**Files modified:** `tests/test_viz_export.py` (new),
`.gitattributes` (if not present — force LF for snapshot files).

- TEST-04 coverage:
  - `test_missing_marker_raises_value_error`
  - `test_injection_roundtrip`
  - `test_render_returns_bs4_parseable_html`
  - `test_network_spec_json_deserializes`
- Snapshot test: `test_render_prefit_snapshot` locks
  `tests/fixtures/viz/prefit_patrl_3level.html`.
- Offline/online switch tests (§10.3).
- `</script>` escape test (§10.1).
- P10 guard test — grep the rendered HTML for `useState("3level")` (should
  return 0 matches); grep for `useState(INITIAL_HGF_LEVEL)` or equivalent
  (should return 1 match).

**Why fourth:** export.py must exist to test against.

**Effort:** 0.5-1 dev days.

### Plan 5: Phase close-out verification

**Files modified:** none (verification-only).

- Run full `pytest tests/test_viz_*.py` — 32 + new count all pass.
- `ruff check src/prl_hgf/viz/ tests/test_viz_export.py` — clean.
- `ruff format --check src/prl_hgf/viz/ tests/test_viz_export.py` — clean.
- `mypy src/prl_hgf/viz/` — clean.
- Parallel-stack invariant:
  ```bash
  git diff --stat 22-close..HEAD -- \
    src/prl_hgf/env/ src/prl_hgf/models/ src/prl_hgf/fitting/ \
    src/prl_hgf/analysis/ src/prl_hgf/gui/ src/prl_hgf/power/ \
    src/prl_hgf/simulation/
  ```
  Must report empty.
- Open `figures/hgf_viewer.html` in browser — renders PAT-RL 3-level
  topology. Manual QA by author.
- Open `render_viewer_html(spec)` output in browser — renders identically
  (with CDN inlined).
- Update ROADMAP status: Phase 23 → Complete.

**Why fifth:** Verification is its own plan for the parallel-stack and
ROADMAP success criteria sign-off.

**Effort:** 0.25 dev days.

**Total effort:** 3.25 dev days (matches ROADMAP "2-3 dev days" estimate).

---

## Appendix A: Open Questions

Things that couldn't be fully resolved in research; planner should decide:

### A.1 NetworkSpec vs rich fixture — strip or keep?

§10.5 recommends (a) strip non-schema keys in the fixture. But if the
planner wants to keep the rich fixture (for future phenotype overlay /
parameter panel), option (b) is to inject TWO JSON payloads. The fixture
shape change is small either way. **Recommendation: (a) for v1.3 scope
discipline.**

### A.2 Jinja2 vs pure string-surgery for CDN inlining

§2 / §3 discuss a hybrid: Jinja2 for `{% if react_inlined %}`, surgery
for JSON markers. Alternative: pure string surgery for both. The hybrid
uses Jinja2 ~10 lines in export.py; pure surgery is 0 Jinja2 lines but
replaces verbatim `<script src="...">` matches — brittle to
formatting changes in the template. **Recommendation: hybrid.**

### A.3 Does the fixture get pre-embedded in the template, or loaded at render time?

§2 Strategy B requires the template to contain a valid default JSON blob
for the "browser-openable standalone" property. The plan can either:

- (A) Hand-write the default JSON into the template (copy from fixture).
- (B) Run a build step that reads `data/viz_fixtures/patrl_3level_prefit.json`
  and emits the template with that content embedded.

**Recommendation: (A)** — simpler; no build step; template is a
self-contained artifact. The default blob becomes a documented part of
the template, not a build output.

## Appendix B: Sources

### Primary (HIGH confidence)

- `figures/patrl_hgf_model.html` (direct read, 677 lines)
- `src/prl_hgf/viz/schema.py` (direct read, 290 lines)
- `src/prl_hgf/viz/inspector.py` (direct read, 60+ lines of verified paths)
- `src/prl_hgf/viz/__init__.py` (direct read)
- `data/viz_fixtures/patrl_3level_prefit.json` (direct read)
- `pyproject.toml` (direct read)
- `.planning/REQUIREMENTS.md` (lines 30-72)
- `.planning/ROADMAP.md` Phase 23 block (lines 459-511)
- `.planning/phases/22-inspector-roles-schema-scaffold/22-RESEARCH.md`
- `.planning/phases/22-inspector-roles-schema-scaffold/22-04-SUMMARY.md`
- Empirical ds_env probes (2026-04-24):
  - `conda run -n ds_env python -c "import jinja2; print(jinja2.__version__)"` → `3.1.6`
  - `conda run -n ds_env python -c "import bs4; print(bs4.__version__)"` → `4.13.4`
  - `conda run -n ds_env python -c "import pyhgf; print(pyhgf.__version__)"` → `0.2.8`
  - `conda run -n ds_env python -c "import pytest_snapshot"` → ModuleNotFoundError
  - JSON escape empirical test (`_t_json_escape.py`, committed and
    reverted) — `ensure_ascii=True` does NOT escape `</script>`
  - CDN size/latency empirical test (`_t_cdn_jinja.py`, committed and
    reverted) — React 10.7KB, React-DOM 131.8KB, Babel 2.8MB

### Secondary (MEDIUM confidence)

- pytest-snapshot README via GitHub WebFetch — API confirmed for
  `snapshot.assert_match`, `snapshot.assert_match_dir`,
  `pytest --snapshot-update`.

### Tertiary (LOW confidence)

- None — all load-bearing claims have a primary source.

## Metadata

**Confidence breakdown:**

- Template audit (§1): HIGH — direct read of the seed.
- Jinja2 strategy (§2): HIGH — empirical test of both strategies in ds_env.
- CDN inlining (§3): HIGH — empirical fetch with real URLs.
- JSON escape safety (§4): HIGH — empirical test against ds_env.
- Missing-marker detection (§5): HIGH — regex approach verified.
- React data-at-mount (§6): MEDIUM — pattern is canonical but not
  empirically tested in a browser. Plan 2 does that verification.
- 2-level + multimodal (§7): HIGH — direct read of seed's `is3` / `isMM`
  branching logic.
- pytest-snapshot workflow (§8): MEDIUM — API from README, not empirical.
  Plan 4 verifies.
- Parallel-stack invariant (§9): HIGH — documented pattern from Phase 22.
- Risks + pitfalls (§10): HIGH for items with empirical backing,
  MEDIUM for forward-looking items (10.9 React bump, 10.10 autoescape).
- Plan breakdown (§11): MEDIUM — planner may reorganize.

**Research date:** 2026-04-24
**Valid until:** 2026-05-24 (30 days — pyhgf, jinja2, React 18.2 are all
stable; CDN URLs do not change; only pytest-snapshot API could drift).
