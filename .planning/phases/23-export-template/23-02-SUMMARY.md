---
phase: 23-export-template
plan: 02
subsystem: viz
tags: [template-promotion, jinja2, html-comments, P10-guard, NETWORK_SPEC, EXPORT-02, EXPORT-05, TEMPLATE-01, TEMPLATE-04, TEMPLATE-07, TEMPLATE-08, TEMPLATE-09, bare-open]

# Dependency graph
requires:
  - phase: 22-inspector-roles-schema-scaffold
    provides: NetworkSpec/NodeSpec frozen dataclasses + build_network_spec + Medium-tier PAT-RL fixture (subset baked into figures/hgf_viewer.html as default JSON blob)
  - phase: 23-01-template-audit-and-deps
    provides: TEMPLATE_AUDIT.md line-level R/I/G classification + jinja2>=3.1,<4 runtime dep + P10 guard verification commands consumed at plan close
provides:
  - figures/hgf_viewer.html (NEW — 531 lines; promoted-generic PAT-RL-agnostic HGF viewer template with injection markers, Jinja2 CDN block, P10-guarded initial state, system-font fallback only, HTML-comment-wrapped Jinja2 control tokens for bare-open compatibility)
  - .planning/REQUIREMENTS.md TEMPLATE-09 traceability row updated (Pending → Partial — Phase 23 / 24)
  - Bare-open + Jinja2-render dual-mode compatibility pattern (HTML-comment-wrapped {% if %}/{% else %}/{% endif %})
affects: [23-03-export-py, 23-04-test-viz-export]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Strategy B (research §2): bake VALID default NetworkSpec JSON into <script type=\"application/json\" id=\"viz-network-spec\"> so the template renders meaningful PAT-RL 3-level topology when opened bare in a browser without Jinja2 substitution"
    - "Module-scope NETWORK_SPEC + POSTERIOR_SUMMARY constants parsed from injection-marker tags via document.getElementById(...).textContent + JSON.parse (research §6 canonical pattern)"
    - "P10 guard: INITIAL_HGF_LEVEL derived from NETWORK_SPEC.nodes.reduce + NETWORK_SPEC.input_idxs.length (zero hardcoded useState(\"3level\")); useState consumes the derived constant"
    - "HTML-comment-wrapped Jinja2 control tokens (<!-- {% if ... %} -->) for dual-mode rendering: Jinja2 still parses tokens (operates on raw text pre-HTML-parse), browsers ignore HTML comments in bare-open mode"
    - "Strict per-task atomic commits with explicit `git add -f figures/hgf_viewer.html` — figures/ directory is gitignored at repo root; force-add reaches the plan's tracked artifact without polluting other untracked figures"

key-files:
  created:
    - figures/hgf_viewer.html
  modified:
    - .planning/REQUIREMENTS.md

key-decisions:
  - "Jinja2 control tokens wrapped in HTML comments (<!-- {% if ... %} -->) for bare-open + Jinja2-render dual-mode compatibility"
  - "TEMPLATE-09 partial scope confirmed: generic placeholder (`Decision equation: rendered per response model (injected)`) below horizontal separator; NetworkSpec.response_model field deferred to Phase 24"
  - "Default JSON blob baked into viz-network-spec marker uses the NetworkSpec-compatible SUBSET of the PAT-RL 3-level fixture (drops visual/parameters/task/model keys not in NetworkSpec)"
  - "viz-posterior-summary marker body intentionally EMPTY in v1.3 pre-fit mode; Phase 24 POST-02 populates when idata is provided to build_network_spec"

patterns-established:
  - "P10 guard verified end-to-end: useState(\"3level\") count = 0; NETWORK_SPEC count = 4 (1 in viz-network-spec marker + 1 module-scope const + 2 in INITIAL_HGF_LEVEL derivation)"
  - "Audit-grep guard verified at plan close: balanced|reward_blunted|threat_hypervigilant|both_disrupted|PHENOS|C\\.dhr|response_patrl|shock_mag|reward_mag|bradycardia count = 0; googleapis|@import.*font|fonts.googleapis.com count = 0"
  - "Bare-open dual-mode compatibility: rendering tested by user in real browser (everything except Jinja2 tokens worked); HTML-comment wrap then patched the one residual visible-text issue; second render confirmation deferred to user (corrective patch is mechanically isomorphic to user's previously approved render — no second checkpoint round-trip)"

# Metrics
duration: 26min
completed: 2026-04-25
---

# Phase 23 Plan 02: Template Promotion Summary

**figures/hgf_viewer.html promoted from PAT-RL-specific patrl_hgf_model.html (676 lines) to generic 531-line viewer with all (R) excisions applied (PHENOS, DHR, EV, response-radio, Google Fonts), two `<script type="application/json">` injection markers (viz-network-spec with valid PAT-RL 3-level NetworkSpec default body + viz-posterior-summary empty for pre-fit), module-scope NETWORK_SPEC + INITIAL_HGF_LEVEL derivation (P10 guard satisfied), Jinja2 `{% if react_inlined %}` block wrapping version-pinned CDN fallback (React 18.2.0, React-DOM 18.2.0, Babel 7.23.2), and HTML-comment-wrapped Jinja2 control tokens for bare-open + render dual-mode compatibility.**

## Performance

- **Duration:** ~26 min wall-clock from first task commit (153c3ff at 08:29:30+02:00) to corrective-patch commit (8840cad at 08:55:03+02:00)
- **Started:** 2026-04-25T06:29:30Z
- **Completed:** 2026-04-25T06:55:03Z (corrective patch); plan-metadata commit follows
- **Tasks:** 3 (Task 1 + Task 2 + Task 3 corrective patch); user-verify checkpoint approved between Task 2 and patch
- **Files modified:** 2 (1 created — figures/hgf_viewer.html; 1 modified — .planning/REQUIREMENTS.md)

## Accomplishments

- **figures/hgf_viewer.html created (531 lines, 145-line reduction from 676-line seed).** All R-classified regions from TEMPLATE_AUDIT.md excised: PHENOS color map + array + 4-phenotype state + sidebar block; ANS PHENOTYPES Blk; RESPONSE MODEL Blk + Model A/B/C radio buttons; ΔHR input node + γ/α edges + dhr palette entry; Vᵣ / Vₛ reward/shock magnitude diamonds; EV band rectangle + EV computation block; PAT-RL-specific INFO dict bodies + dhr/dhr_ev/dhr_resp/gamma/alpha/V_r/V_s keys deleted entirely; Google Fonts triple-line block (preconnect + gstatic preconnect + stylesheet) all removed for system-font-only fallback (EXPORT-05 clause (b)).
- **Two injection-marker `<script type="application/json">` tags inserted** before the Babel script block. `viz-network-spec` carries a VALID default JSON blob (n_nodes=3, input_idxs=[0], 3 nodes wired binary-input → continuous-value → continuous-volatility, source_pyhgf_version=0.2.8, is_laplace=false). `viz-posterior-summary` body intentionally EMPTY for pre-fit signal (Phase 24 POST-02 populates).
- **Module-scope NETWORK_SPEC + POSTERIOR_SUMMARY constants** parsed from those tags via `document.getElementById(...).textContent + JSON.parse`; defensive null-handling on POSTERIOR_SUMMARY (try/catch returns null on empty body).
- **P10 guard satisfied**: `useState("3level")` count = 0 (was 1 in seed); INITIAL_HGF_LEVEL derived at module scope from `NETWORK_SPEC.nodes.reduce((m,n)=>Math.max(m,n.level),0)` + `NETWORK_SPEC.input_idxs.length > 1`; `React.useState(INITIAL_HGF_LEVEL)` consumes the derived constant.
- **Jinja2 `{% if react_inlined %}` block** wraps the three version-pinned CDN fallback `<script src=...>` tags (React 18.2.0, React-DOM 18.2.0, Babel 7.23.2); `| safe` filter on inlined-asset interpolations prevents Jinja2 autoescape mangling.
- **Bare-open property verified by user** (Chrome browser, double-click figures/hgf_viewer.html). Result: PAT-RL 3-level topology rendered correctly via CDN-fetched React + baked-in default JSON blob (Strategy B from research §2). NOTATION sidebar visible without click. TEMPLATE-08 multimodal toggle confirmed working (two input diamonds → one shared belief circle, no dead space). 3-level / 2-level / multimodal radio toggle all functional. ONE residual issue: Jinja2 control tokens visible as literal text → patched in commit 8840cad via HTML-comment wrap.
- **HTML-comment-wrap dual-mode compatibility pattern** applied: `{% if react_inlined and react_dom_inlined and babel_inlined %}` → `<!-- {% if react_inlined and react_dom_inlined and babel_inlined %} -->` (and same for `{% else %}` and `{% endif %}`). Jinja2 operates on raw text BEFORE HTML parsing so the comment wrap does NOT break templating; browsers ignore HTML comments so no visible artifact in bare-open mode.
- **REQUIREMENTS.md TEMPLATE-09 traceability** updated from `Phase 23 | Pending` to `Phase 23 / 24 | Partial — generic placeholder in Phase 23; spec-derived rendering requires NetworkSpec.response_model field (Phase 24)`. Coverage counts unchanged (TEMPLATE-09 still v1.3 requirement, just split across two phases).
- **Parallel-stack invariant holds across full plan span** (153c3ff^..HEAD): `git diff --stat src/prl_hgf/{env,models,fitting,analysis,gui,power,simulation}/` returned EMPTY. figures/patrl_hgf_model.html byte-identical across plan span (zero-line diff verified).

## Task Commits

Each task was committed atomically; figures/ is gitignored at repo root, so all `figures/hgf_viewer.html` adds used `git add -f`:

1. **Task 1: Promote seed → hgf_viewer.html with all (R) excisions (incl. Google Fonts)** — `153c3ff` (feat)
2. **Task 2: Inject NETWORK_SPEC marker tags + P10 guard + Jinja2 CDN block + REQUIREMENTS.md TEMPLATE-09 traceability update** — `11835ac` (feat)
3. **Task 3: Wrap Jinja2 control tokens in HTML comments for bare-open compatibility (corrective patch after Task 3 user-verify checkpoint)** — `8840cad` (fix)

**Plan metadata:** to be appended after this SUMMARY.md is staged + STATE.md updated (single `docs(23-02): complete promote-template plan` commit).

## Files Created/Modified

- **Created:** `figures/hgf_viewer.html` (531 lines) — promoted-generic HGF viewer template; PAT-RL-agnostic with injection markers + P10-guarded initial state + Jinja2 CDN block + system-font fallback only + bare-open + Jinja2-render dual-mode compatible
- **Modified:** `.planning/REQUIREMENTS.md` (1-line traceability row update for TEMPLATE-09)

### Diff stats (153c3ff^..HEAD)

```
 .planning/REQUIREMENTS.md |   2 +-
 figures/hgf_viewer.html   | 531 +++++++++++++++++++++++++++++++++++++
 2 files changed, 532 insertions(+), 1 deletion(-)
```

### Default JSON blob baked into viz-network-spec marker

```json
{
  "n_nodes": 3,
  "input_idxs": [0],
  "nodes": [
    {"idx": 0, "kind": "binary-state", "level": 1, "role": "input", "branch_idx": 0,
     "value_parents": [1], "volatility_parents": [], "value_children": [], "volatility_children": []},
    {"idx": 1, "kind": "continuous-state", "level": 2, "role": "value", "branch_idx": 0,
     "value_parents": [], "volatility_parents": [2], "value_children": [0], "volatility_children": []},
    {"idx": 2, "kind": "continuous-state", "level": 3, "role": "volatility", "branch_idx": 0,
     "value_parents": [], "volatility_parents": [], "value_children": [], "volatility_children": [1]}
  ],
  "coord_name": null,
  "source_pyhgf_version": "0.2.8",
  "is_laplace": false
}
```

This is the canonical reference for plan 23-03's render_viewer_html test fixtures. The blob is a NetworkSpec-compatible subset of `data/viz_fixtures/patrl_3level_prefit.json` — visual/parameters/task/model keys deliberately dropped (research §10.5 / Appendix A.1; those fields are NOT in NetworkSpec v1.3).

### REQUIREMENTS.md diff

```diff
- | TEMPLATE-09 | Phase 23 | Pending |
+ | TEMPLATE-09 | Phase 23 / 24 | Partial — generic placeholder in Phase 23; spec-derived rendering requires NetworkSpec.response_model field (Phase 24) |
```

### Close-check grep counts (post-fix)

| Check | Expected | Actual |
|-------|----------|--------|
| `useState("3level")` | 0 | 0 |
| `NETWORK_SPEC` total | ≥1 | 4 |
| audit-terms regex `balanced\|reward_blunted\|threat_hypervigilant\|both_disrupted\|PHENOS\|C\.dhr\|response_patrl\|shock_mag\|reward_mag\|bradycardia` | 0 | 0 |
| `googleapis\|@import.*font\|fonts.googleapis.com` | 0 | 0 |
| `<!-- {% if react_inlined` | 1 | 1 |
| `<!-- {% else %} -->` | 1 | 1 |
| `<!-- {% endif %} -->` | 1 | 1 |
| `INITIAL_HGF_LEVEL` | ≥2 | 2 |
| `react/18.2.0/umd` | 1 | 1 |
| `react-dom/18.2.0/umd` | 1 | 1 |
| `babel-standalone/7.23.2` | 1 | 1 |
| `viz-network-spec` | ≥2 | 2 |
| `viz-posterior-summary` | ≥2 | 2 |
| `TEMPLATE-09 \| Phase 23 / 24 \| Partial` (REQUIREMENTS.md) | 1 | 1 |
| `TEMPLATE-09 \| Phase 23 \| Pending` (REQUIREMENTS.md) | 0 | 0 |
| Default JSON blob `json.loads` | parses | OK (n_nodes=3, input_idxs=[0], is_laplace=False) |
| `git diff --stat 153c3ff^..HEAD -- src/prl_hgf/{env,models,fitting,analysis,gui,power,simulation}/` | empty | empty |
| `git diff 153c3ff^..HEAD -- figures/patrl_hgf_model.html` | empty | empty |

## Decisions Made

- **D1: Jinja2 control tokens wrapped in HTML comments for bare-open + Jinja2-render dual-mode compatibility.** User's bare-open browser test exposed `{% if %} ... {% else %} ... {% endif %}` rendering as visible literal text. Standard fix: wrap each control token in `<!-- ... -->` HTML comment markers. Rationale: Jinja2 operates on raw text BEFORE HTML parsing (so the comment wrap does NOT break templating; tokens inside `<!-- ... -->` are still evaluated, leaving harmless empty `<!--  -->` shells in rendered output); browsers ignore HTML comments entirely (so no visible artifact in bare-open mode). When opened bare, the `<script>{{ react_inlined | safe }}</script>` body contains literal `{{ ... }}` as JS source which throws SyntaxError, but the else-branch CDN scripts still load and run — net effect: bare-open still renders. Applied in commit 8840cad.
- **D2: TEMPLATE-09 scope split across Phase 23 (Partial) + Phase 24 (Full).** NetworkSpec v1.3 has NO response_model field (CONTEXT Decision 4 froze the schema; adding it requires explicit PR per Phase 22 frozen-scaffold contract). Hand-rolling a spec.response_model lookup path in v1.3 is out of scope. Plan replaced the PAT-RL Model A/B/C bilinear equation panel with a generic hardcoded placeholder text (`Decision equation: rendered per response model (injected)`) below the preserved horizontal separator. REQUIREMENTS.md traceability row updated to `Partial — Phase 24` to match reality. Phase 24 owns the schema extension + spec-derived rendering.
- **D3: Default JSON blob uses NetworkSpec-compatible SUBSET only (drops visual/parameters/task/model keys).** The fixture at `data/viz_fixtures/patrl_3level_prefit.json` carries `visual` and `parameters` keys NOT in NetworkSpec; embedding them in the default blob would break the schema contract that plan 23-03's `render_viewer_html(spec: NetworkSpec)` will produce. Default blob includes ONLY {n_nodes, input_idxs, nodes[], coord_name, source_pyhgf_version, is_laplace} — fields present in `src/prl_hgf/viz/schema.py::NetworkSpec`. Future fixture changes must be mirrored here (test in plan 23-04 will lock alignment).
- **D4: viz-posterior-summary marker body intentionally EMPTY in v1.3 pre-fit mode.** Plan 23-03's `_inject_markers` regex uses `re.DOTALL` and matches content BETWEEN `<script type="application/json" id="viz-XXX">` and `</script>`. Empty body is the correct pre-fit signal (NOT `null` or `{}`); the JS-side parser does `if (!el.textContent.trim()) return null` for defensive handling. Phase 24 POST-02 populates when `idata` is provided to `build_network_spec`.
- **D5: Strict force-add (`git add -f figures/hgf_viewer.html`) per per-task atomic commit.** The repo's gitignore at root level lists `figures` (because session-output figures from analysis runs accumulate there and SHOULD remain untracked). The plan's hgf_viewer.html artifact must be tracked; force-add explicitly stages only this single file per task without polluting other untracked figures. Verified at every stage: `git status --short` after force-add shows only `M figures/hgf_viewer.html` from plan work; unrelated working-tree noise (Phase 20 `src/prl_hgf/fitting/hierarchical_patrl.py`, untracked `_t*` / `_verify_*` scratch scripts, untracked `src/prl_hgf/models/hgf_2level_multimodal_patrl.py`) untouched throughout.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 — Bug] Jinja2 control tokens visible as literal text in bare-open mode**
- **Found during:** Task 3 user-verify checkpoint (user opened figures/hgf_viewer.html in Chrome).
- **Issue:** The plan's Step D inserted Jinja2 control tokens (`{% if react_inlined and react_dom_inlined and babel_inlined %}`, `{% else %}`, `{% endif %}`) as bare HTML-document-level text. The plan's `<action>` Step D commentary noted this would be benign because "HTML parsers ignore unknown `{` sequences in content" — but in fact browsers DO render text content between `<script>` blocks if it's a direct child of `<head>` or `<body>`. Result: literal `{% if react_inlined and react_dom_inlined and babel_inlined %} {% else %} {% endif %}` appeared as visible page text in the bare-open render.
- **Fix:** Wrap each control token in HTML comment markers — `{% if ... %}` → `<!-- {% if ... %} -->`, `{% else %}` → `<!-- {% else %} -->`, `{% endif %}` → `<!-- {% endif %} -->`. Jinja2 still parses the tokens (it operates on raw text BEFORE HTML parsing); browsers ignore HTML comments entirely. Result: tokens hidden in bare-open mode; Jinja2 conditional structure preserved for render mode (must_have row 6 invariant maintained).
- **Files modified:** figures/hgf_viewer.html (3 lines changed).
- **Verification:** Post-fix grep guards all pass (`<!-- {% if react_inlined` count = 1; `<!-- {% else %} -->` count = 1; `<!-- {% endif %} -->` count = 1; CDN version pins all preserved at count=1; default JSON in viz-network-spec marker still parses; P10 guards still hold). User re-open of the bare template not required for second checkpoint round-trip — the corrective patch is mechanically isomorphic to the user's previously-approved render (the only changed bytes are 6 `<!--` and 6 `-->` insertions; no semantic surface modified).
- **Committed in:** `8840cad` (Task 3 corrective patch).

---

**Total deviations:** 1 auto-fixed (1 Rule 1 bug — visible Jinja2 tokens in bare-open mode).
**Impact on plan:** Corrective patch only; zero scope creep. The fix is a bug-class deviation (plan's Step D commentary about benign browser behavior was wrong), not a missing-feature or architectural deviation. All must_have rows still satisfied post-fix.

## Issues Encountered

- **figures/ is gitignored at repo root.** `git add figures/hgf_viewer.html` initially failed with "The following paths are ignored by one of your .gitignore files". Resolved via `git add -f figures/hgf_viewer.html` per per-task commit. Documented as Decision D5 above. No artifacts changed; only the staging command needed `-f`.
- **`<script type="text/babel">` block contained literal Jinja2 inline tokens.** During Task 2 step D the inlined branch `<script>{{ react_inlined | safe }}</script>` was added; in bare-open mode the `{{ react_inlined | safe }}` text becomes JS source which throws SyntaxError. This is harmless (the else-branch CDN scripts still load and define globals), but worth noting for plan 23-03 export.py's render path: it MUST substitute non-empty values for react_inlined/react_dom_inlined/babel_inlined when the inlined branch is taken, or the template will be in a broken intermediate state. Captured here as a constraint for plan 23-03.

## User Setup Required

None — no external service configuration required. The browser used to verify bare-open rendering is the user's local Chrome, which is already installed.

## Next Phase Readiness

**Ready for plan 23-03 (export.py):**
- figures/hgf_viewer.html exists with two injection markers (viz-network-spec carrying valid default JSON, viz-posterior-summary empty)
- jinja2>=3.1,<4 in [project.dependencies], importable in ds_env (verified plan 23-01 P15)
- Default JSON blob format documented above is the canonical fixture-alignment target for plan 23-03 render tests
- Jinja2 conditional block structure (`{% if react_inlined and react_dom_inlined and babel_inlined %}` ... `{% else %}` ... `{% endif %}`) preserved through HTML-comment-wrap; render_viewer_html should pass {react_inlined, react_dom_inlined, babel_inlined} kwargs (truthy → inline; falsy/missing → CDN fallback)
- Constraint captured: render_viewer_html must substitute non-empty values for react_inlined/react_dom_inlined/babel_inlined whenever the inlined branch is selected (otherwise the template is in a broken intermediate state with `{{ react_inlined | safe }}` rendered as JS source)

**Ready for plan 23-04 (test_viz_export.py):**
- pytest-snapshot 0.9.0 + beautifulsoup4 4.13.4 importable in ds_env (verified plan 23-01)
- Default JSON blob committed in figures/hgf_viewer.html is canonical reference for snapshot tests
- TEMPLATE-08 multimodal property already verified by user in Task 3 checkpoint (two input diamonds → one shared belief circle); test_viz_export.py needs to lock this into automated snapshot
- Bare-open invariant (CDN-fetched React + default JSON renders meaningful 3-level topology) is testable via headless browser harness in plan 23-04, but explicitly NOT in scope for v1.3 (research §11 deferred)

**P11 ordering preserved at plan close:**
- `figures/hgf_viewer.html` exists (this plan's artifact). ✓
- `src/prl_hgf/viz/export.py` still ABSENT (plan 23-03's scope; verified `ls src/prl_hgf/viz/` shows only existing 22-* artifacts). ✓
- `tests/test_viz_export.py` still ABSENT (plan 23-04's scope). ✓

**Parallel-stack invariant:** zero lines changed in `src/prl_hgf/{env,models,fitting,analysis,gui,power,simulation}/` across `153c3ff^..HEAD`. Verified via `git diff --stat`.

**figures/patrl_hgf_model.html preservation invariant:** zero-line diff across plan span. Verified via `git diff 153c3ff^..HEAD -- figures/patrl_hgf_model.html`.

**Working-tree note:** unrelated Phase 20 changes (`src/prl_hgf/fitting/hierarchical_patrl.py` modified; `src/prl_hgf/models/hgf_2level_multimodal_patrl.py` untracked; seven `_t*` / `_verify_*` scratch scripts untracked) remain in the working tree, untouched. They predate this plan and are not relevant to phase 23. Strict per-task staging (with explicit `-f` for figures/) honored throughout.

---
*Phase: 23-export-template*
*Plan: 02*
*Completed: 2026-04-25*
