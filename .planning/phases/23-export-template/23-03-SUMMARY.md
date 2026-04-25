---
phase: 23-export-template
plan: 03
subsystem: viz
tags: [jinja2, urllib, html, react, jsx, dataclasses, json-escape, mdn]

# Dependency graph
requires:
  - phase: 22-inspector-roles-schema-scaffold
    provides: NetworkSpec dataclass + build_network_spec public API (consumed by render_viewer_html via dataclasses.asdict)
  - phase: 23-01-template-audit-deps
    provides: jinja2 runtime dep + pytest-snapshot/beautifulsoup4 dev deps in ds_env (DEPS-01)
  - phase: 23-02-promote-template
    provides: figures/hgf_viewer.html promoted-generic with two viz-X marker tags + Jinja2 if/else CDN block (template that render_viewer_html string-injects + Jinja2-renders)
provides:
  - src/prl_hgf/viz/export.py (new, 380 lines) -- render_viewer_html public API + 5 private helpers (_json_for_html, _MARKER_RE, _inject_markers, _CDN_SOURCES, _fetch_cdn_asset, _make_jinja_env, _inline_cdn_assets, _render_offline_template) + _DEFAULT_TEMPLATE_PATH (config.PROJECT_ROOT-based) with import-time existence check
  - src/prl_hgf/viz/__init__.py (modified, +2 lines) -- re-exports render_viewer_html alongside the four preserved Phase 22 symbols (NetworkSpec, NodeSpec, build_network_spec, inspect_network)
  - figures/hgf_viewer.html (modified, 3 lines) -- custom Jinja2 variable delimiters '<<' '>>' on the three CDN inlining lines (deviation Rule 1 -- bug fix; default '{{' collides with JSX's heavy use of inline-style {{...}} patterns)
  - .planning/ROADMAP.md (modified, SC2 paragraph) -- Phase 23 SC2(a) reinterpretation to two-mode offline_mode semantics + SC2(d) corrected to both-defenses _json_for_html
affects:
  - phase 23-04 (viz test scaffold) -- consumes render_viewer_html in tests/test_viz_export.py snapshot tests with offline_mode=True (deterministic CDN-fallback output)
  - phase 24 (post-fit branch) -- POST-02 will populate the empty viz-posterior-summary marker with az.summary output via the same _inject_markers Strategy B path

# Tech tracking
tech-stack:
  added: [jinja2 (custom delimiters '<<' '>>')]
  patterns:
    - "Hybrid template injection: regex string-surgery for JSON marker payloads (Strategy B from research §2) + Jinja2 only for the {% if react_inlined %} CDN inlining block (research §3 + §10.10)"
    - "MDN-canonical JSON-in-HTML escape: ensure_ascii=True AND .replace('</', '<\\\\/') -- both defenses required because ensure_ascii alone does NOT escape '</' (research finding #1 empirically re-verified in ds_env)"
    - "Custom Jinja2 variable delimiters '<<' '>>' to avoid collision with JSX inline-style {{...}} patterns -- statement delimiters {% %} keep default form (only used in HTML-comment-wrapped if/else/endif lines)"
    - "config.PROJECT_ROOT for default file paths (not hand-counted Path(__file__).parents[N]) per CLAUDE.md path-constants mandate, plus import-time existence assertion so misconfiguration fails loudly"
    - "Two-mode offline_mode contract: offline_mode=True (default) = no render-time network I/O + CDN <script src> tags retained; offline_mode=False = urllib.request fetch + inline (~2.83 MiB)"
    - "Deterministic ValueError message format with sorted(missing)[0] for predictable test assertions (EXPORT-04)"

key-files:
  created:
    - "src/prl_hgf/viz/export.py"
  modified:
    - "src/prl_hgf/viz/__init__.py"
    - "figures/hgf_viewer.html"
    - ".planning/ROADMAP.md"

key-decisions:
  - "Custom Jinja2 variable delimiters '<<' '>>' in BOTH _make_jinja_env() and the three template CDN inlining lines -- the only safe way to coexist with React JSX's heavy {{...}} usage without wrapping the entire 480-line JSX block in {% raw %}{% endraw %}"
  - "Centralized _make_jinja_env() factory (called by both _inline_cdn_assets and _render_offline_template) -- single source of truth for delimiters + autoescape=False + BaseLoader; if Phase 24 adds another Jinja2 path it inherits the same config automatically"
  - "_DEFAULT_TEMPLATE_PATH derived from `config.PROJECT_ROOT / 'figures' / 'hgf_viewer.html'` with import-time `if not _DEFAULT_TEMPLATE_PATH.exists(): raise FileNotFoundError(...)` (BLOCKER fix from plan-checker -- replaces hand-counted parents[3])"
  - "render_viewer_html signature: `(spec: NetworkSpec, *, offline_mode: bool = True, template_path: Path | None = None, fetch_timeout: float = 30.0) -> str` -- offline_mode=True is the default so Phase 24 snapshot tests + 'just open the file' workflow get deterministic output without network I/O"
  - "ROADMAP SC2(a) wording reinterpreted in-place (not deferred to a follow-up plan) so future verifiers and Phase 24 planners read the corrected spec; SC2(d) bonus-fixed in the same commit to match research finding #1 + the both-defenses _json_for_html implementation"
  - "viz-posterior-summary marker injected with empty string '' as the pre-fit sentinel (Phase 24 POST-02 will replace with az.summary output via the same _inject_markers contract)"
  - "_fetch_cdn_asset uses ssl.create_default_context() + explicit User-Agent header (Windows-safe per research §3); never ssl.CERT_NONE -- correct fix for Windows cert issues is `conda update certifi` or SSL_CERT_FILE env"

patterns-established:
  - "Pattern 1: Hybrid render -- string-surgery for JSON markers, Jinja2 only for CDN block. Prevents the JSX↔Jinja2 collision from leaking into JSON payload escaping (those payloads pass through json.dumps + .replace, never Jinja2)."
  - "Pattern 2: Both-defenses XSS escape (`json.dumps(ensure_ascii=True).replace('</', '<\\\\/')`) for any string embedded inside `<script type='application/json'>`. Not optional -- single defense leaves </script> escape-out vector."
  - "Pattern 3: Import-time existence assertion for default file paths. Every path constant derived from config.PROJECT_ROOT in a public-API module should fail loudly at import if the file is missing (avoids deferred FileNotFoundError surprise inside render calls)."
  - "Pattern 4: Custom Jinja2 delimiters when embedding template languages that conflict with default `{{ }}`. Verify pre-commit that chosen delimiters appear nowhere in the template (`grep -c '<<' && grep -c '>>'` both 0 before adopting)."

# Metrics
duration: 17min 45s
completed: 2026-04-25
---

# Phase 23 Plan 03: render_viewer_html public API Summary

**Single-call NetworkSpec → self-contained HTML render path (string-surgery JSON injection + Jinja2 CDN inlining); MDN-canonical JSON-in-HTML escape; config.PROJECT_ROOT-based default template with import-time existence check; two-mode offline_mode (default True = no render-time network I/O, opt-in False = ~2.83 MiB inlined).**

## Performance

- **Duration:** 17 min 45 s
- **Started:** 2026-04-25T07:04:55Z
- **Completed:** 2026-04-25T07:22:39Z
- **Tasks:** 3
- **Files modified:** 4 (1 created, 3 modified)

## Accomplishments

- `src/prl_hgf/viz/export.py` (380 lines) ships `render_viewer_html(spec, *, offline_mode=True, template_path=None, fetch_timeout=30.0) -> str` -- the EXPORT-01 public API that turns a `NetworkSpec` into a complete browser-openable HTML document.
- Five load-bearing private helpers: `_json_for_html` (MDN both-defenses), `_inject_markers` (regex Strategy B + post-scan ValueError), `_fetch_cdn_asset` (urllib.request + Windows-safe SSL), `_make_jinja_env` (centralized custom-delimiter Jinja2 factory), `_inline_cdn_assets` + `_render_offline_template` (the two render-mode helpers).
- `_DEFAULT_TEMPLATE_PATH = config.PROJECT_ROOT / "figures" / "hgf_viewer.html"` with import-time existence check (BLOCKER fix replacing hand-counted `parents[3]`).
- `src/prl_hgf/viz/__init__.py` re-exports `render_viewer_html` while preserving all four Phase 22 symbols (`NetworkSpec`, `NodeSpec`, `build_network_spec`, `inspect_network`) in `__all__`.
- ROADMAP.md Phase 23 SC2(a) reinterpreted to two-mode offline_mode semantics + SC2(d) bonus-corrected to both-defenses `_json_for_html`.

## Task Commits

Each task was committed atomically:

1. **Task 1: export.py helpers** -- `8bdf66d` (feat) -- `_json_for_html` (MDN-canonical), `_MARKER_RE` + `_inject_markers` (Strategy B + post-scan ValueError with exact message format), `_CDN_SOURCES` + `_fetch_cdn_asset` (urllib.request + ssl.create_default_context + User-Agent header)
2. **Task 2: render_viewer_html + config.PROJECT_ROOT default + Jinja2 CDN inlining** -- `b56056b` (feat) -- `_make_jinja_env` (custom `<<` `>>` delimiters), `_inline_cdn_assets` + `_render_offline_template`, `_DEFAULT_TEMPLATE_PATH` (with import-time existence check), `render_viewer_html` public API, `__init__.py` re-export. Also lands the deviation Rule 1 fix on `figures/hgf_viewer.html` (three CDN inlining lines: `{{ react_inlined | safe }}` → `<< react_inlined | safe >>`).
3. **Task 3: ROADMAP SC2(a) reinterpretation** -- `59e328b` (docs) -- two-mode offline_mode wording + SC2(d) both-defenses correction; cites research §3 + §10.3 in commit body.

**Plan metadata commit:** _to land after this SUMMARY.md is written_

## Files Created/Modified

- `src/prl_hgf/viz/export.py` (created, 380 lines) -- Phase 23 public API + 4 private helper categories backing it. Module docstring documents the three load-bearing mechanics (Strategy B JSON injection, custom-delimiter Jinja2 CDN block, MDN-canonical both-defenses escape) and the parallel-stack invariant.
- `src/prl_hgf/viz/__init__.py` (modified, 19 → 21 lines) -- adds `from prl_hgf.viz.export import render_viewer_html` + `"render_viewer_html"` entry in `__all__`. All four Phase 22 symbols preserved.
- `figures/hgf_viewer.html` (modified, 3 lines) -- changed three CDN inlining lines from default Jinja2 `{{ react_X | safe }}` to custom-delimiter `<< react_X | safe >>` to match `_make_jinja_env()`'s `variable_start_string='<<'` / `variable_end_string='>>'`. Deviation Rule 1 -- see "Deviations from Plan" below.
- `.planning/ROADMAP.md` (modified, SC2 paragraph at lines 477-483) -- Phase 23 SC2(a) reinterpreted from one-line "opens offline with CDN inlined" to two-mode wording (offline_mode=True default = no render-time network I/O + CDN tags retained; offline_mode=False = urllib fetch + inline ~2.9 MiB). SC2(d) corrected from "ensure_ascii=True" alone to both-defenses `ensure_ascii=True AND .replace("</", "<\\/")`. Citation: research §3 + §10.3 (mode disambiguation), research finding #1 + §4 (both-defenses override).

## Decisions Made

See key-decisions in frontmatter. Highlights:

- **Custom Jinja2 delimiters `<<` `>>`** chosen after empirical confirmation that neither sequence appears in the 531-line template (verified via `grep -c '<<' && grep -c '>>'` both returning 0). Alternative wrap-everything-in-`{% raw %}` was rejected as more invasive (would touch ~480 JSX lines and require careful matching of the if/else block boundaries).
- **`_make_jinja_env()` centralized factory** rather than inline `Environment(...)` calls in each render helper. Phase 24 POST-02 may add a third Jinja2 consumer; the factory ensures it inherits identical delimiters + autoescape settings without copy-paste drift.
- **`offline_mode=True` as the default** (not False) so that Phase 24 snapshot tests are deterministic by construction. Reinterpreting SC2(a) in-place (Task 3) closes the loop -- the plan's own success criterion now matches the implemented contract.
- **`viz-posterior-summary` injected with empty string `""`** rather than skipping the marker. The `_inject_markers` contract requires every payload key to match a template marker; passing `""` exercises the same contract path that POST-02 will use later (just with a non-empty value).

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] JSX↔Jinja2 default-delimiter collision in figures/hgf_viewer.html**

- **Found during:** Task 2 (`render_viewer_html` end-to-end smoke test)
- **Issue:** The promoted-generic template from plan 23-02 uses default Jinja2 variable delimiters `{{ react_inlined | safe }}` for the three CDN inlining lines. Default Jinja2 ALSO scans the whole template for `{{...}}` and treats every JSX inline-style or JS-expression embedding as a variable expansion. The 531-line template contains 80+ JSX `{{...}}` patterns (e.g. line 152: `style={{cursor:disabled?"default":"pointer"}}`, line 183: `style={{display:"flex",height:"100vh",...}}`). On the first call to `Environment(...).from_string(template)`, Jinja2 raises `TemplateSyntaxError: expected token 'end of print statement', got ':'` at line 140 of the template. Both render paths (`_render_offline_template` and `_inline_cdn_assets`) are completely non-functional on the as-shipped 23-02 template.
- **Fix:** Configure both `Environment` instances (centralized in new `_make_jinja_env()` factory) with `variable_start_string="<<"` / `variable_end_string=">>"` (verified zero collisions: `grep -c '<<' figures/hgf_viewer.html` and `grep -c '>>'` both return 0). Update the three template CDN inlining lines from `{{ react_X | safe }}` to `<< react_X | safe >>` (lines 30-32 of figures/hgf_viewer.html). Statement delimiters `{% %}` keep default form -- those only appear on the three Jinja2 if/else/endif lines (HTML-comment-wrapped per plan 23-02 fix 8840cad), so no JSX collision exists for `{%`. Bare-open behavior is preserved -- `<< ... >>` inside `<script>` is a JS syntax error, the script throws, and the CDN `<script src=cdnjs>` fallbacks below load React/Babel exactly as before (identical to the previous `{{ ... }}` literal-render behavior).
- **Files modified:** `figures/hgf_viewer.html` (3 lines: 30, 31, 32), `src/prl_hgf/viz/export.py` (`_make_jinja_env()` + module docstring mechanic 2 + commit-message documentation)
- **Verification:** offline_mode=True smoke test now passes (31,167-char output); offline_mode=False CDN-fetch test now passes (2,970,137-char ~2.83 MiB output); bs4 parses both modes cleanly; viz-network-spec deserializes to `{n_nodes:3, input_idxs:[0]}`.
- **Committed in:** `b56056b` (Task 2 commit; documented in commit body under "DEVIATION (Rule 1 -- bug fix) in figures/hgf_viewer.html")

---

**Total deviations:** 1 auto-fixed (1 Rule 1 bug fix)
**Impact on plan:** The fix is essential -- without it, both render paths fail at the first `env.from_string(template)` call and the entire EXPORT-01 / EXPORT-05 deliverable does not exist. No scope creep: the change is confined to (a) the centralized Jinja2 factory and (b) the three CDN inlining lines in the template. All other template content and all plan-23-02 dual-mode contracts (bare-open + Jinja2-render) remain intact.

## Issues Encountered

- **Conda multi-line `python -c` script execution failure on Windows.** `conda run -n ds_env python -c "..."` rejects multi-line strings (Conda raises `AssertionError: Support for scripts where arguments contain newlines not implemented`). Worked around by writing per-verifier scratch files (`_t_export_finding1.py`, `_t_export_export04.py`, `_t_export_smoke.py`, `_t_export_inline.py`, `_t_export_bs4.py`) and running each via `conda run -n ds_env python <file.py>`. These scratch files are gitignored noise (per `_t_*` and `_verify_*` patterns already in the working tree from prior phases) and intentionally NOT staged in any task commit.
- **Initial F822 ruff error on `__all__ = ["render_viewer_html"]`** when only Task 1 helpers had landed. Resolved by deferring `__all__` finalization until Task 2 (which lands `render_viewer_html`). Task 1's commit message documents the deferral. This is the cost of strict per-task atomic commits when a public symbol is split across two tasks.
- **Initial line-length / I001 ruff errors on the import block** (88-char limit hit by the long `# noqa: F401` inline comment + the I-want-them-grouped sort heuristic). Resolved by parenthesized multi-line imports in Task 1 + dropping the now-unnecessary blank line between `from config` and `from prl_hgf.viz.schema` (both first-party) in Task 2.

## User Setup Required

None -- no external service configuration required. CDN fetch path (`offline_mode=False`) requires an outbound HTTPS connection to `cdnjs.cloudflare.com` at render time; this is the only network dependency and only when the user opts in.

## Next Phase Readiness

**Ready for plan 23-04 (viz test scaffold):**

- `render_viewer_html` is the importable EXPORT-01 public API. Plan 23-04 task 1 can immediately wire `from prl_hgf.viz import render_viewer_html` into `tests/test_viz_export.py`.
- `_inject_markers`, `_json_for_html`, `_MARKER_RE` are all importable as private helpers — plan 23-04's `test_inject_markers_missing_marker_raises_value_error` and `test_json_for_html_escapes_script_close` tests can target them directly.
- `_DEFAULT_TEMPLATE_PATH` is also importable and provably-existent at import time, so test fixtures don't need to compute the template path independently.
- offline_mode=True default produces deterministic output (no network calls, no timestamps in render path) — pytest-snapshot tests will be byte-stable.
- ROADMAP SC2(a) wording matches the implementation, so the plan-23-04 verifier won't trip on the now-corrected verifier prose.

**No blockers or concerns for Phase 24 (post-fit branch):**

- The `viz-posterior-summary` marker is reserved with empty body (pre-fit sentinel). Phase 24 POST-02 just calls `_inject_markers(template, {"posterior-summary": _json_for_html(az_summary_dict)})` via the same Strategy B contract.
- The hybrid string-surgery + Jinja2 split keeps post-fit additions isolated from CDN/template-rendering concerns.

**Working-tree noise (unrelated to this plan):** `src/prl_hgf/fitting/hierarchical_patrl.py` (modified) and `src/prl_hgf/models/hgf_2level_multimodal_patrl.py` (untracked) plus the `_t*` and `_verify_*` scratch scripts are pre-existing Phase 20 work-in-progress; left untouched per the plan's critical_constraints.

---
*Phase: 23-export-template*
*Completed: 2026-04-25*
