---
phase: 23-export-template
plan: 01
subsystem: viz
tags: [jinja2, pytest-snapshot, beautifulsoup4, template-audit, P11, P15, DEPS-01]

# Dependency graph
requires:
  - phase: 22-inspector-roles-schema-scaffold
    provides: NetworkSpec/NodeSpec frozen dataclasses + build_network_spec + Medium-tier PAT-RL fixture (consumed downstream by plan 23-03 export.py)
provides:
  - TEMPLATE_AUDIT.md (P11 procedural guard) — full grep catalog + R/I/G classification of PAT-RL hardcoded surface in figures/patrl_hgf_model.html
  - jinja2>=3.1,<4 declared in [project.dependencies] (runtime dep for plan 23-03 export.py)
  - pytest-snapshot>=0.9.0 + beautifulsoup4>=4.12 declared in [project.optional-dependencies].dev (dev deps for plan 23-04 test suite)
  - pytest_snapshot.* + bs4.* added to [[tool.mypy.overrides]] ignore_missing_imports list
  - P10 guard verification commands published at the bottom of TEMPLATE_AUDIT.md (load-bearing for plan 23-02 close-checks)
  - ds_env empirically verified: jinja2 3.1.6, bs4 4.13.4, pytest_snapshot 0.9.0 all importable
affects: [23-02-template-promotion, 23-03-export-py, 23-04-test-viz-export]

# Tech tracking
tech-stack:
  added:
    - jinja2>=3.1,<4 (runtime — Jinja2 Environment(loader=BaseLoader()) for plan 23-03 export.py)
    - pytest-snapshot>=0.9.0 (dev — golden-file snapshot fixture for plan 23-04)
    - beautifulsoup4>=4.12 (dev — HTML structure assertions for plan 23-04, MUST NOT leak into runtime)
  patterns:
    - "Audit-first procedural guard (P11): publish TEMPLATE_AUDIT.md BEFORE any template-promotion or export.py code is written. Audit is the gate; promotion can only proceed once the catalog is committed."
    - "P10 guard pattern: hardcoded `useState('3level')` fallback flagged Inject (I), not Remove (R) — variable still needed downstream, only its source changes. Documented at line-level in audit table 3.8."
    - "DEPS-01 P15 guard pattern: never trust pip metadata; explicitly run `import X` in target conda env and capture version in commit message body for traceable baseline."

key-files:
  created:
    - .planning/phases/23-export-template/TEMPLATE_AUDIT.md
  modified:
    - pyproject.toml

key-decisions:
  - "INFO dict tooltip bodies: STRIP entirely in plan 23-02 (NetworkSpec v1.3 has no `label` field on NodeSpec; tooltips deferred to phase 24)"
  - "Sidebar layout after stripping HGF LEVEL + RESPONSE MODEL + ANS PHENOTYPES Blks: deferred to plan 23-02 layout pass (recommendation: shrink sidebar to ~180px or move NOTATION to a small bottom-right card)"
  - "Google Fonts triple-line block (lines 7, 8, 9) classified R wholesale — system-font fallback only in v1.3; Google Fonts inlining deferred to v1.4 POLISH-05"

patterns-established:
  - "P11 (procedural ordering): audit artifact precedes template artifact precedes export-script artifact precedes test artifact in plan numbering"
  - "P15 (env trust): every dep added to pyproject.toml gets verified in the target conda env via `import X; print(X.__version__)` with version captured in commit body"
  - "Strict per-task staging: `git add <file>` per file; never `git add .` or `git add -A`; working-tree noise (Phase 20 fitting/models, scratch _verify_*.py) explicitly NOT staged"

# Metrics
duration: 26min
completed: 2026-04-25
---

# Phase 23 Plan 01: Template Audit + Dependency Wiring Summary

**TEMPLATE_AUDIT.md committed first (P11 guard active for rest of phase 23) cataloguing 11 ROADMAP audit terms + 2 Google Fonts hits across 676-line PAT-RL seed; pyproject.toml gains jinja2 runtime dep + pytest-snapshot/bs4 dev deps with empirical ds_env import verification (jinja2 3.1.6, bs4 4.13.4, pytest_snapshot 0.9.0).**

## Performance

- **Duration:** ~26 min
- **Started:** 2026-04-25T05:48:30Z (approx, plan execution open)
- **Completed:** 2026-04-25T06:14:26Z
- **Tasks:** 2/2
- **Files modified:** 2 (1 created, 1 modified)

## Accomplishments

- **TEMPLATE_AUDIT.md committed FIRST** as the P11 procedural guard (commit 32cc3d8 precedes any other phase 23 file touch). 356 lines, 22 audit-table rows, classifies every R/I/G action plan 23-02 must take.
- **All 11 ROADMAP audit terms cataloged** with line-level grep output (4+3+3+3+0+5+6+3+1+1+1 = 30 unique source-line hits). `Klaassen` recorded as 0-hit explicitly (ROADMAP listed it; pre-planning grep confirmed absence — research §1).
- **Google Fonts 2-hit catalog** (lines 7 + 9 + sibling preconnect at 8) classified R for system-font fallback in v1.3.
- **DEPS-01 landed** in pyproject.toml: jinja2>=3.1,<4 (runtime), pytest-snapshot>=0.9.0 + beautifulsoup4>=4.12 (dev), pytest_snapshot.* + bs4.* (mypy overrides).
- **P15 ds_env empirical verification**: all three imports succeed; pytest --fixtures registers `snapshot` fixture from pytest_snapshot.plugin; `from pytest_snapshot.plugin import Snapshot` resolves cleanly.
- **P10 guard verification commands published** at bottom of TEMPLATE_AUDIT.md (§6) — load-bearing for plan 23-02 close-checks (4 grep checks: useState removed, NETWORK_SPEC.nodes present, googleapis 0, PAT-RL terms 0).
- **P11 ordering preserved at plan close**: `figures/hgf_viewer.html` and `src/prl_hgf/viz/export.py` both still absent (verified: 2 "No such file" responses).

## Task Commits

Each task was committed atomically:

1. **Task 1: TEMPLATE_AUDIT.md (P11 guard)** — `32cc3d8` (docs)
2. **Task 2: pyproject.toml DEPS-01 + P15 verify** — `3ca6f40` (chore)

**Plan metadata:** to be appended after this SUMMARY.md is staged + STATE.md updated (single `docs(23-01): complete template-audit-and-deps plan` commit).

## Files Created/Modified

- **Created:** `.planning/phases/23-export-template/TEMPLATE_AUDIT.md` (356 lines) — full grep catalog + R/I/G classification tables for plan 23-02 template promotion
- **Modified:** `pyproject.toml` (+5 lines net) — see diff summary below

### pyproject.toml diff (5-line patch summary)

```diff
@@ [project.dependencies] @@
     "pyyaml>=6.0",
+    "jinja2>=3.1,<4",
     "groupBMC>=1.0",
@@ [project.optional-dependencies].dev @@
     "pytest-cov>=5.0",
+    "pytest-snapshot>=0.9.0",
+    "beautifulsoup4>=4.12",
 ]
@@ [[tool.mypy.overrides]].module @@
     "jaxopt.*",
+    "pytest_snapshot.*",
+    "bs4.*",
     "prl_hgf.*",
```

### P15 verification output (captured 2026-04-25T06:13Z, ds_env)

```
jinja2: 3.1.6
bs4: 4.13.4
pytest_snapshot: 0.9.0
```

API smoke checks:
- `from pytest_snapshot.plugin import Snapshot` → `<class 'pytest_snapshot.plugin.Snapshot'>`
- `pytest --fixtures tests/test_models.py | grep snapshot` → `snapshot -- ..\..\..\AppData\Local\miniforge3\envs\ds_env\lib\site-packages\pytest_snapshot\plugin.py:30`

### TEMPLATE_AUDIT.md grep counts

- **11 ROADMAP audit terms** recorded (4+3+3+3+0+5+6+3+1+1+1 = 30 unique source-line hits)
- **2 Google Fonts `<link>` tags** recorded (lines 7, 9; sibling preconnect at 8 also flagged for removal)
- **~34 unique R-classified occurrences** across 14 classification table rows in §3
- **3 I-classified slots**: title `<title>` (line 6), `useState("3level")` → `NETWORK_SPEC.hgf_level` (line 121), ROOT slot for `NETWORK_SPEC = {{ network_spec_json }}`
- **G-classified preserved regions**: hexPts/diamPts/retract helpers (115-117), is3/isMM booleans + branching (129-130), notation sidebar minus 2 rows (246-275), level background rectangles (298-300), Blk helper component (666-671), nC/eC/pC selection-highlight branches (PAT-RL hl* branches stripped), App layout shell, EqHeader/EqLine helpers (179-193)

## Decisions Made

- **D1: INFO dict tooltip bodies stripped wholesale in plan 23-02.** NetworkSpec v1.3 has no per-NodeSpec `label` field (CONTEXT Decision 4); nothing to substitute in. Selection highlight (blue dashed outline on click) preserved — operates on `sel`, not `INFO[sel]`. Tooltips deferred to phase 24 enhancement (add `label` to NodeSpec or `tooltips` parameter to `render_viewer_html`). Documented in §5 of audit.
- **D2: Sidebar layout after Blk strips deferred to plan 23-02.** After removing HGF LEVEL + RESPONSE MODEL + ANS PHENOTYPES Blks, only NOTATION remains in 278px sidebar — recommendation: shrink to ~180px or convert to bottom-right card. Layout pass owned by plan 23-02. Documented in §5 of audit.
- **D3: Google Fonts triple-line block (7, 8, 9) all classified R.** Line 8 (`fonts.gstatic.com` preconnect) does NOT match the `googleapis|@import|fonts.googleapis.com` regex but is semantically part of the Google Fonts block — plan 23-02 must remove all three lines. System-font fallback CSS specified verbatim in §3.2.
- **D4: P10 guard wrapped as I (Inject), not R (Remove), at line 121.** `useState("3level")` flagged for replacement by `NETWORK_SPEC.hgf_level` (variable still needed downstream by `is3`/`isMM` booleans at 129-130). Distinguishing I from R at line-level prevents plan 23-02 from over-stripping.

## Deviations from Plan

None — plan executed exactly as written. Both tasks completed in declared order; no Rule 1/2/3 fixes needed; no Rule 4 architectural escalations.

The ROADMAP-vs-RESEARCH discrepancies flagged in the plan `<context>` block (Klaassen 0-hit, pytest-snapshot actually missing, mypy overrides needed, Google Fonts present) were all anticipated and handled per the plan's prescribed approach.

## Issues Encountered

**Bash newline-in-args with `conda run` (worked around).** Initial P15 verification used a multi-line `python -c "..."` string which `conda run` rejected on Windows (`AssertionError: Support for scripts where arguments contain newlines not implemented`). Resolved by collapsing to a single-line statement: `conda run -n ds_env python -c "import jinja2, bs4, pytest_snapshot; print('jinja2:', jinja2.__version__); ..."`. No artifacts changed; verification result identical.

## User Setup Required

None — no external service configuration required. All dependency work is local pip install in ds_env. M3 cluster ds_env will need `pip install pytest-snapshot beautifulsoup4` (or `pip install -e .[dev]`) on next sync — but that's a v1.3-test-suite concern (plan 23-04), not blocking for plan 23-02 template promotion.

## Next Phase Readiness

**Ready for plan 23-02 (template promotion):**
- Audit committed; classification tables tell plan 23-02 exactly what to strip / inject / preserve at line-level granularity
- Estimated post-promotion size in audit §4: ~420 lines in `figures/hgf_viewer.html` (seed 676 − ~284 stripped + ~30 added)
- P10 guard verification commands at audit §6 ready to run at plan 23-02 close

**Ready for plan 23-03 (export.py):**
- jinja2>=3.1,<4 in [project.dependencies], importable in ds_env
- API surface verified: `from jinja2 import Environment, BaseLoader, select_autoescape` resolves

**Ready for plan 23-04 (test_viz_export.py):**
- pytest-snapshot 0.9.0 importable; `snapshot` fixture auto-registered (verified via `pytest --fixtures`)
- beautifulsoup4 4.13.4 importable; `from bs4 import BeautifulSoup` resolves
- mypy overrides prevent missing-stubs errors on test-file imports of both packages

**Parallel-stack invariant:** zero lines changed in `src/prl_hgf/{env,models,fitting,analysis,gui,power,simulation}/` across HEAD~2..HEAD. Verified via `git diff --stat`.

**Working-tree note:** unrelated Phase 20 changes (`src/prl_hgf/fitting/hierarchical_patrl.py` modified, `src/prl_hgf/models/hgf_2level_multimodal_patrl.py` untracked, plus seven `_t*` / `_verify_*` scratch scripts) remain in the working tree, untouched. They predate this plan and are not relevant to phase 23. Strict per-task staging policy honored throughout.

---
*Phase: 23-export-template*
*Plan: 01*
*Completed: 2026-04-25*
