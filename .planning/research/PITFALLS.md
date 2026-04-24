# Domain Pitfalls: Generic HGF Viewer (v1.3 Scaffold)

**Domain:** Reader/visualization module added to existing scientific Python codebase
**Researched:** 2026-04-24
**Milestone context:** v1.3 Generic HGF Viewer — Scope C: spec + config + scaffold only
**Confidence:** HIGH (grounded in actual code, STATE.md decisions, and existing HTML artifacts)

---

## Thematic Overview

Pitfalls are grouped into five themes so planning can tackle related risks together:

1. **pyhgf API Stability** — Pitfalls 1–3
2. **HTML Injection Correctness** — Pitfalls 4–5
3. **Parallel-Stack Respect** — Pitfalls 6–7
4. **Scope-Creep Discipline** — Pitfalls 8–9
5. **Test Coverage and Documentation Sync** — Pitfalls 10–14

---

## Critical Pitfalls

Mistakes that ship broken code or invalidate scientific output.

---

### Pitfall 1: Hypothesis-Based Coding of pyhgf Internals

**What goes wrong:** The handoff doc (`docs/HANDOFF_pyhgf_plot_network_extension.md`) proposes attribute paths (`net.attributes`, `net.edges[idx].volatility_parents`, `net.input_idxs`) hypothetically — the doc explicitly says "key questions to resolve." If Phase 22 writes inspector code from those proposals without a REPL round-trip first, the inspector will use attribute names that either do not exist or have shifted between 0.2.8 (cluster) and 0.2.10 (local, Decision 184). The inspector will fail at the first real model, silently or with an `AttributeError` that only surfaces when a collaborator runs the viewer on the cluster.

**Why it happens:** The handoff doc reads as authoritative because it was written by someone who knows the domain. Developers trust written specs. But the handoff explicitly notes it was written for planning, not from running code. Decision 184 confirms: "structural pattern assumed unchanged" — this is a working hypothesis, not a verified fact.

**Concrete failure mode:** `net.edges[2].volatility_parents` returns a list of node indices in one version and a typed object in another. Or `net.attributes` is the internal JAX pytree, not a list of dicts, and accessing `net.attributes[i]["tonic_volatility"]` raises `TypeError: 'DeviceArray' object is not subscriptable`.

**How to avoid:** Phase 22 must begin with a mandatory REPL verification step (one script or notebook cell, not a full test) that:
1. Instantiates `build_2level_network_patrl()` and `build_3level_network_patrl()`.
2. Calls `net.input_data(...)` to populate trajectories.
3. Prints `type(net.attributes)`, `type(net.edges)`, `net.edges[0].__dict__`, `net.input_idxs`.
4. Records exact attribute names and types — not guesses — in a decision comment at the top of `src/prl_hgf/viz/inspector.py` before any production code is written.

The production code must be written FROM these verified paths, not FROM the handoff proposals. If verification finds the handoff was wrong, update the handoff.

**Warning signs:**
- Inspector written in the same Phase 22 session as the handoff was first read, without a terminal/notebook session in between.
- Inspector unit tests mock `Network` at the module boundary without also having a canary integration test that instantiates a real `Network`.
- Attribute paths in the inspector reference `.volatility_parents` as an index list — plausible but unverified for 0.2.10.

**Phase to address:** Phase 22 (inspector), first task, before any production code.

**Priority:** HIGH — ships broken code.

---

### Pitfall 2: pyhgf Temp-Key Drift Between Patch Releases

**What goes wrong:** Decision 129 confirmed `value_prediction_error`, `effective_precision`, and `volatility_prediction_error` exist in pyhgf 0.2.8 `node_trajectories[i]["temp"]`. The viewer's trajectory panel will want to display these (e.g., overlay PE on the belief trace). If pyhgf 0.2.10 renames `value_prediction_error` to `observation_prediction_error` (a plausible refactor), the viewer silently emits `NaN` trajectories for PE columns — or crashes if it doesn't guard.

The existing `_safe_temp()` helper in `src/prl_hgf/analysis/export_trajectories.py` already implements the correct pattern: fall back to `np.nan` on key absence. The viewer inspector MUST replicate this pattern, not hardcode key names.

**Why it happens:** Developers copy attribute access patterns from code that works today. The `_safe_temp` fallback pattern exists but lives in a module the viewer may not import.

**How to avoid:** The inspector's `extract_node_trajectories()` function (or equivalent) must use the same `traj_node.get("temp", {}).get(key, fallback)` pattern as `_safe_temp`, not direct `traj["temp"]["key"]` subscript. Import `_safe_temp` from `export_trajectories` or inline an identical guard. Add a canary test (`test_pyhgf_temp_keys_inspector`) analogous to the existing `test_pyhgf_temp_keys_extracted` that runs against a real (small) `Network` instance.

**Warning signs:**
- Inspector uses `net.node_trajectories[i]["temp"]["value_prediction_error"]` (direct subscript, no `.get()` guard).
- No canary test that instantiates a real `Network` and asserts key names.

**Phase to address:** Phase 22 (inspector).

**Priority:** HIGH — silently wrong output that looks like a real PE trace.

---

### Pitfall 3: Shared Volatility Node Appearing Multiple Times in Graph Traversal

**What goes wrong:** In the pick_best_cue 3-level model (`hgf_3level.py`), node 6 is the **single** shared volatility parent for belief nodes 1, 3, and 5. A naive graph traversal that follows "volatility_parents" edges from each belief node will visit node 6 three times. The viewer will render three volatility nodes in the SVG, which is architecturally wrong — there is only one. Worse, the JSON schema emitted to the template will contain three entries for the same node with identical parameters, inflating the node count.

**Why it happens:** Following adjacency lists without deduplication is the natural first implementation. For PAT-RL (single branch), no duplication occurs, so the bug hides on that test case and surfaces only on pick_best_cue.

**How to avoid:** The inspector must build a `dict[int, NodeRecord]` keyed by node index, not a `list`. After traversal, deduplicate by index before emitting the schema dict. Add a unit test that calls the inspector on a `build_3level_network()` (pick_best_cue) instance and asserts `len(schema["nodes"]) == 7` (not 9).

**Warning signs:**
- Inspector uses a list accumulator and appends one entry per edge, not per node.
- The schema JSON has duplicate `node_index` values.
- The test suite only tests PAT-RL (single-branch) models.

**Phase to address:** Phase 22 (inspector), specifically the traversal logic.

**Priority:** HIGH — wrong diagram misleads all readers.

---

### Pitfall 4: Regex-Injection Marker Collision with Existing JS/HTML Content

**What goes wrong:** The HTML template (`figures/patrl_hgf_model.html`, ~50 KB of React JSX) contains dense JavaScript strings. A placeholder like `%%HGF_DATA%%` is safe, but a placeholder like `{{data}}` or `// DATA_HERE` risks colliding with existing JSX object literals, template literal syntax, or comment patterns. More subtly: injected JSON strings can contain `</script>` sequences, which terminate the enclosing `<script>` block mid-injection even if properly encoded — the browser's HTML tokenizer closes the script tag before the JSON string close. Unicode surrogate pairs in parameter labels (unlikely but possible) can also break JSON parsing in some runtime contexts.

**Why it happens:** Developers test injection with small, clean ASCII values. The template works. The bug surfaces only when a parameter label or ArviZ coord name contains an apostrophe, backslash, or Unicode character.

**How to avoid:**
- Use a unique, unmistakable marker that cannot appear in JSX: `__HGF_NETWORK_DATA__` (double underscores + all caps) surrounded by a JSX comment block `{/* __HGF_NETWORK_DATA__ */}`. This form cannot appear in normal JSX string literals.
- Use `json.dumps(data, ensure_ascii=True)` — ensures no raw Unicode in the injected payload, no surrogate pairs. Do NOT use `ensure_ascii=False` for HTML injection.
- Wrap the injected JSON in a JavaScript variable assignment, not an inline expression: `const _hgfData = <JSON>;` — keeps the payload isolated from JSX evaluation context.
- Replace `</script>` in injected strings with `<\/script>` (escaped forward slash) before insertion. Python: `payload = payload.replace("</script>", r"<\/script>")`.
- Write an injection test that verifies the HTML is parseable by BeautifulSoup after injection (structural validity check).

**Warning signs:**
- Placeholder is a simple token like `DATA_PLACEHOLDER` or `%%DATA%%` without checking for collision with existing template content.
- `json.dumps` called without `ensure_ascii=True`.
- No test that round-trips an injection and parses the resulting HTML.

**Phase to address:** Phase 23 (export/injection).

**Priority:** HIGH — ships an HTML file that fails in browser silently or with JS parse error.

---

### Pitfall 5: Detecting Injection Failures at Test Time

**What goes wrong:** A regex substitution that fails (wrong marker, encoding error, empty JSON) returns the template unchanged. The exported HTML looks syntactically intact but contains the literal marker string `__HGF_NETWORK_DATA__` rendered visibly in the browser, or the React component crashes on `undefined` data because the variable was never defined. This only surfaces when a human opens the file — not at export time.

**Why it happens:** `re.sub()` succeeds (returns a string) whether or not it made any replacements. There is no built-in failure mode.

**How to avoid:**
- After injection, assert `marker not in result_html`. Raise `InjectionError` with the marker name if the assertion fails.
- After injection, assert `len(result_html) > len(template_html)` — the result must be strictly larger.
- In the test suite, test the failure path: given a template with no marker, confirm `inject()` raises `InjectionError`.

**Warning signs:**
- Export function does not assert marker absence post-injection.
- No test for the "marker missing from template" failure path.

**Phase to address:** Phase 23 (export/injection).

**Priority:** HIGH — silent failure produces invalid viewer output.

---

### Pitfall 6: Importing from Both Config Modules in the Viewer

**What goes wrong:** Decision 112 and Decision 119 establish the parallel-stack invariant: `pat_rl_config.py` has zero imports from `task_config.py`. The viewer's `src/prl_hgf/viz/` package, as a reader, is legitimately allowed to import from both stacks. However, if Phase 22/23 adds a bridge function to either config module (e.g., `task_config.get_hgf_level()`) for the viewer's convenience, it violates the invariant in the other direction. The pick_best_cue stack would now import viewer-facing code, entangling test isolation.

**Why it happens:** Adding a utility method to an existing config class seems less invasive than creating a new abstraction. The developer sees the existing class as the natural home for the helper.

**How to avoid:** All viewer-side adapter logic stays inside `src/prl_hgf/viz/`. If the viewer needs to interpret a `PATRLConfig` or `AnalysisConfig`, it does so by reading the public attributes of those configs — never by adding methods to the config classes. If shared logic is needed, it goes in `src/prl_hgf/viz/adapters.py`, not in `env/`.

Review gate: a ruff import-cycle check on `src/prl_hgf/env/` modules before Phase 22 closes. `env/task_config.py` and `env/pat_rl_config.py` must show zero new imports pointing to `viz/`.

**Warning signs:**
- Phase 22 PR modifies any file under `src/prl_hgf/env/`.
- `task_config.py` or `pat_rl_config.py` have a new import of anything from `viz/`.

**Phase to address:** Phase 22 (inspector scaffolding), enforced via code-review checklist.

**Priority:** MEDIUM — does not break the viewer, but breaks pick_best_cue test isolation and invalidates Decision 112.

---

### Pitfall 7: ipywidgets GUI Regression via Shared Model-Building Utilities

**What goes wrong:** `src/prl_hgf/gui/explorer.py` imports from `prl_hgf.models.hgf_2level`, `hgf_3level`, and `env.task_config`. If Phase 22/23 refactors any of these shared utilities for the viewer (e.g., renames `extract_beliefs` to `extract_beliefs_v2`, or changes the return shape of `build_2level_network` for a viewer convenience), the GUI breaks silently — it continues to import successfully but produces wrong trajectories.

**Why it happens:** When adding a new consumer of shared code, developers sometimes "clean up" the shared module at the same time. This seems low-risk but the GUI has no continuous integration run that would catch a shape change.

**How to avoid:** The viewer must add new code, never modify existing model-building or belief-extraction functions. If a new interface is needed (e.g., a typed `NetworkSchema` dict), the inspector creates it from the existing functions rather than refactoring those functions. Phase 22 review gate: confirm that `src/prl_hgf/models/hgf_2level.py`, `hgf_3level.py`, `hgf_2level_patrl.py`, and `hgf_3level_patrl.py` have no diff from the phase start.

**Warning signs:**
- Phase 22 PR has diffs in `src/prl_hgf/models/` or `src/prl_hgf/env/`.
- GUI tests (if any) fail after the phase closes.

**Phase to address:** Phase 22 (inspector), enforced via "additive only" policy.

**Priority:** MEDIUM — breaks the GUI, which is an existing validated deliverable.

---

### Pitfall 8: Scope Creep via SVG Rendering "While I'm In There"

**What goes wrong:** Phase 22 is inspector-only (extract network structure to dict). Phase 23 is injection-only (write dict to HTML template). Scope C explicitly defers SVG rendering to a future milestone. The most common failure mode: while writing the inspector in Phase 22 and inspecting the template SVG in `patrl_hgf_model.html`, the developer starts implementing hexagon geometry or node-position calculations "since the data is right there." This is invisible creep — the phase still "ships" the inspector, but it also ships partial SVG code that is untested, unscoped, and not in the milestone requirements.

**Why it happens:** The template is compelling (it already has the SVG geometry helpers `hexPts`, `diamPts`). The developer has context. Starting is easy. The partial implementation creates technical debt that the next milestone must navigate.

**How to avoid:** Phase 22 has a hard scope check item: `src/prl_hgf/viz/` must contain exactly:
- `__init__.py`
- `inspector.py` (extracts `NetworkSchema` dict)
- `tests/test_inspector.py`

Nothing else. If `renderer.py`, `geometry.py`, or any SVG-related file appears in the Phase 22 commit, the phase is out of scope. Add this as a literal checklist item in the Phase 22 plan: "No renderer code. No SVG geometry. Scope C defers rendering."

**Warning signs:**
- Phase 22 commit contains `polygon`, `hexPts`, `svgwrite`, `matplotlib`, or `d3` anywhere in `src/prl_hgf/viz/`.
- Time spent on Phase 22 exceeds estimate by more than 30% without a clear reason.

**Phase to address:** Phase 22 (inspector), enforced by explicit file-list constraint in phase plan.

**Priority:** HIGH — blows phase budgets and ships unvalidated rendering code that confuses future milestone scope.

---

### Pitfall 9: ArviZ Coord-Name Collision

**What goes wrong:** Decision 131 and Decision 135 establish that the Laplace path emits `coord_name="participant_id"` (see `src/prl_hgf/fitting/laplace_idata.py` module docstring) while the NUTS path `_samples_to_idata` emits `"participant"`. A viewer that hardcodes either name will silently fail on the other path — `idata.posterior["omega_2"].sel(participant_id=...)` raises `KeyError` when given a NUTS idata, and vice versa. Worse: the viewer may succeed on the data it was tested with and fail only when a collaborator loads a NUTS-fit idata from an older run.

**Why it happens:** Testing with only the Laplace path (which is Phase 20's default per Decision 184) misses the NUTS coord name. The error message (`KeyError: 'participant_id'`) is not obviously about the viewer.

**How to avoid:** The viewer's idata adapter function must detect the coord name dynamically:
```python
def _get_participant_dim(idata: az.InferenceData) -> str:
    posterior = idata.posterior
    for candidate in ("participant_id", "participant"):
        for var in posterior.data_vars.values():
            if candidate in var.dims:
                return candidate
    raise ValueError(
        f"Cannot find participant dimension; dims found: "
        f"{set(d for v in posterior.data_vars.values() for d in v.dims)}"
    )
```
Unit test: assert `_get_participant_dim` returns `"participant_id"` for a Laplace idata and `"participant"` for a mock NUTS idata.

**Warning signs:**
- Viewer idata reader hardcodes `"participant_id"` or `"participant"`.
- Viewer only tested with Laplace idata.
- No unit test covering both coord-name variants.

**Phase to address:** Phase 23 (export/idata reader).

**Priority:** HIGH — silently wrong when coord name mismatches, with a confusing error message.

---

### Pitfall 10: 2-Level Config Passed to 3-Level Template Panel

**What goes wrong:** The HTML template (`patrl_hgf_model.html`) already has a React state toggle `hgfLevel = "3level" | "2level" | "2level_mm"` and conditionally renders the volatility panel `{is3 && ...}`. If the viewer's JSON payload claims a 2-level network but the React component defaults to `hgfLevel="3level"`, the volatility panel renders with empty/`NaN` data rather than being hidden. The user sees a broken volatility display, not an intentional absence.

**Why it happens:** The `hgfLevel` default in the template JSX is hardcoded to `"3level"` (line 121 of `patrl_hgf_model.html`). A generic viewer that doesn't override this default will always start in 3-level mode.

**How to avoid:** The injected JSON payload must include a `hgf_level` field that the React component reads for its initial state: `useState(injectedData.hgf_level || "2level")`. The inspector must emit `"hgf_level": "2level"` or `"3level"` based on whether node index 2 (VOLATILITY_NODE) is present in the network. Template generalization audit (Pitfall 14) must catch this default.

**Warning signs:**
- Injected JSON does not include a `hgf_level` key.
- Template `useState("3level")` is not updated to read from injected data.
- No test that loads a 2-level model and asserts the volatility panel is hidden.

**Phase to address:** Phase 23 (template generalization) and Phase 22 (inspector must emit `hgf_level`).

**Priority:** MEDIUM — visible rendering error, but does not corrupt data.

---

### Pitfall 11: HTML Template Hardcoded PAT-RL Assumptions

**What goes wrong:** `figures/patrl_hgf_model.html` was hand-edited for PAT-RL specifically. It contains:
- Phenotype labels `balanced`, `reward_blunted`, `threat_hypervigilant`, `both_disrupted` (PAT-RL specific, lines 46–86).
- Hardcoded `INFO` strings mentioning `VOLATILITY_NODE`, `BELIEF_NODE`, specific Python module names (`response_patrl.py`), and PAT-RL response model equations `P(approach) = σ(β·EV + b)`.
- Color constants `C.dhr` (green, for ΔHR) that are PAT-RL specific.
- ANS phenotype descriptions referencing Klaassen 2024 and SNS/PNS framing.
- Layout constants `CX=350`, `SW_D=700` that assume a specific number of nodes and panel widths.

Promoting this file to a generic template WITHOUT auditing these assumptions will produce a viewer that either (a) silently renders PAT-RL labels on pick_best_cue models, or (b) crashes when the React component tries to read phenotype data from a pick_best_cue idata that has no phenotype dimension.

**Why it happens:** The template works for PAT-RL. It's tempting to inject data and skip the audit because "the structure is the same." But the React component has 200+ lines of PAT-RL-specific rendering logic before the generic SVG nodes.

**How to avoid:** Before Phase 23 writes a single line of injection code, run a systematic template audit:
1. `grep -n "balanced\|reward_blunted\|threat_hypervigilant\|both_disrupted\|PHENOS\|SNS\|PNS\|Klaassen\|bradycardia\|shock_mag\|reward_mag" figures/patrl_hgf_model.html` — each hit is a hardcoded PAT-RL assumption that must either be injected from the schema or moved to a conditional block.
2. Classify each hit: (a) remove, (b) make data-driven from injected JSON, or (c) keep with a visible conditional guard.
3. The audit findings become a checklist in the Phase 23 plan before template modification begins.

**Warning signs:**
- Phase 23 begins with injection code before the audit is complete.
- The Phase 23 plan does not have an explicit "template audit" task.
- `PHENOS` array in template is still hardcoded (not replaced by injected phenotype data or removed).

**Phase to address:** Phase 23 (template generalization), first task.

**Priority:** HIGH — ships a viewer that shows PAT-RL labels on pick_best_cue models.

---

### Pitfall 12: Test Coverage Trap — Real Network Required for Meaningful Tests

**What goes wrong:** Mocking `pyhgf.Network` at the module boundary (replacing it with a `MagicMock`) makes the inspector test fast but vacuous — it only tests that the inspector calls the right methods, not that it extracts the right values. The real failure modes (wrong attribute path, deduplication bug, temp-key KeyError) only manifest against a real `Network` instance. However, using a real Network in every test is slow if the network is fit to data.

**Why it happens:** Developers default to unit-test isolation (mock everything external). For pyhgf specifically, "external" means the library, which feels like a valid mock boundary.

**How to avoid:** Two-tier test strategy:
- **Structural tests (fast):** Mock `Network` to test schema shape, field names, and error handling. These run on every `pytest` invocation. They do NOT test correct attribute extraction.
- **Canary integration test (medium):** Instantiate `build_2level_network_patrl()` and `build_3level_network_patrl()`, call `input_data` with a tiny trial sequence (10 trials), and assert the inspector output has the correct node count, node types, and that temp keys are present (or gracefully absent). This test runs in < 1 second (no MCMC) and catches attribute-path regressions immediately.

The canary test is NOT the same as a real-fit test. It uses `input_data` directly without MCMC. This is the same approach used in the existing `test_pyhgf_temp_keys_extracted` canary (Decision 129).

For ArviZ idata mocking: use `az.from_dict()` with minimal synthetic data rather than `MagicMock`. This gives a real `InferenceData` object with the correct coord structure, enabling coord-name detection tests to work correctly.

**Warning signs:**
- All inspector tests use `MagicMock(spec=Network)`.
- No test calls `build_2level_network_patrl()` or `build_3level_network_patrl()` directly.
- idata tests use `MagicMock` instead of `az.from_dict()`.

**Phase to address:** Phase 22 (inspector tests).

**Priority:** MEDIUM — tests pass but provide false confidence; real bugs ship.

---

### Pitfall 13: Documentation Drift Between Handoff Spec and Shipped Inspector

**What goes wrong:** `docs/HANDOFF_pyhgf_plot_network_extension.md` proposes attribute paths and schema shapes that are hypothetical. Phase 22 will discover the actual paths. If the handoff is not updated to reflect discoveries, collaborators reading it will implement downstream consumers based on the wrong spec. This is the "mislead future colleagues" failure mode specific to this project's two-workstream structure (local + cluster).

**Why it happens:** Updating documentation feels like overhead after the code is done. The handoff was written in a different context and feels like "planning artifacts," not living spec.

**How to avoid:** Phase 22's definition of done must include: "HANDOFF doc updated to reflect verified attribute paths." Specifically:
- Replace all instances of "Hypothetical extended API" and "Key questions to resolve" in the handoff with verified findings from the REPL session.
- Add a "Verified 2026-04-XX against pyhgf 0.2.10" annotation to each attribute path.
- If the handoff's Option C architecture was modified during implementation, update the "What to build" task breakdown section.

**Warning signs:**
- Phase 22 closes without a commit to `docs/HANDOFF_pyhgf_plot_network_extension.md`.
- The handoff still says "Key questions to resolve" in its last section after Phase 22 ships.

**Phase to address:** Phase 22 (close-out), Phase 24 (docs pass).

**Priority:** MEDIUM — does not break code, but produces misleading documentation for cluster-side collaborators.

---

### Pitfall 14: JSON vs YAML Schema Divergence

**What goes wrong:** Existing configs (`configs/pat_rl.yaml`, `configs/prl_analysis.yaml`) are YAML. The viewer example schema referenced in project planning is JSON. If the viewer accepts both, a loader that parses YAML and JSON separately will silently drift: YAML parsers coerce unquoted values (e.g., `True`/`False`/`null`) differently from JSON parsers, and YAML accepts multi-line strings, anchors, and implicit type coercion that JSON does not. A schema defined in YAML and validated against JSON (or vice versa) can pass validation for the wrong reasons.

**Why it happens:** Python's `yaml.safe_load` and `json.loads` both return `dict`, so they look equivalent at the call site. The differences emerge only with edge-case values.

**How to avoid:** Scope C defines a single schema format for the viewer. Given that the existing codebase is YAML-primary and `pat_rl_config.py` uses `yaml.safe_load`, the viewer's network schema should also be YAML. If a JSON example was proposed in planning, it is a display format only — the canonical on-disk format is YAML, loaded by the existing infrastructure. If JSON output is required (for HTML injection), it is produced by `json.dumps(schema_dict)` from the Python dict, never by maintaining a separate JSON schema file.

Do not add both a YAML loader and a JSON loader to the viewer package in v1.3. Add one. Add the other only when a concrete use case requires it, with explicit schema validation tests for both.

**Warning signs:**
- `src/prl_hgf/viz/` contains both a `load_yaml_schema()` and a `load_json_schema()` function.
- The YAML and JSON loaders have no shared validation function.
- A schema example exists in both `schema.yaml` and `schema.json` with subtly different defaults.

**Phase to address:** Phase 22 (schema design), enforced by choosing one format at the start of the phase.

**Priority:** LOW — schema drift is subtle and may not surface in v1.3, but compounds in v1.4+.

---

### Pitfall 15: Dev Environment Incompatibility Discovered at Cluster Time

**What goes wrong:** The viewer adds a new dependency (e.g., `beautifulsoup4` for HTML testing, or `lxml` for XML parsing). The dependency installs cleanly in the developer's local environment (system Python or a different venv) but is incompatible with `ds_env` (conda, Python 3.10, pyhgf 0.2.8 pinned). The incompatibility is only discovered when the viewer is tested on the cluster.

**Why it happens:** The viewer is developed locally with `pip install <new-dep>` without checking `ds_env`. The cluster `ds_env` has pinned versions that may conflict.

**How to avoid:** Any new dependency added for the viewer must be verified against `ds_env` before Phase 23 closes:
1. `conda run -n ds_env pip install <dep>` on the local machine (or check the conda package for the dep's conda-forge version against the Python 3.10 constraint).
2. Add the dep to `requirements.txt` (or `pyproject.toml [dev]`) immediately when it is first used.
3. `beautifulsoup4` and `lxml` are well-supported on Python 3.10 — acceptable. Anything requiring Python 3.11+ type union syntax or 3.12 features is not acceptable.

**Warning signs:**
- A new `import bs4` or `import lxml` appears in test files without a corresponding `requirements.txt` entry.
- The new dep is only in `pip list` in the developer's default Python, not in `ds_env`.

**Phase to address:** Phase 22/23 (at dependency introduction time).

**Priority:** MEDIUM — code works locally, fails on cluster.

---

### Pitfall 16: Node Semantic Mislabeling

**What goes wrong:** The inspector classifies a continuous-state node as a "value parent" when it is actually a "volatility parent." This is a semantic error that directly misleads scientific readers. In the pick_best_cue 3-level model, node 6 has `volatility_children=[1,3,5]` — it is a volatility parent. In the PAT-RL 3-level model, node 2 has the same role. If the inspector infers node type from `node_parameters["tonic_volatility"]` alone (a continuous node has this key regardless of coupling type), it will label node 6 as "continuous (value)" rather than "continuous (volatility)."

**Why it happens:** pyhgf node types are determined by construction-time coupling semantics, not by a single attribute flag. A node is a "volatility parent" if it appears as a volatility child of another node OR if another node was added with it as a `volatility_children` argument. This topology is encoded in the `edges` structure, not in `node_parameters`.

**How to avoid:** The inspector must determine node role from the adjacency structure, not from `node_parameters` alone:
- A node is an "input node" if its index is in `net.input_idxs`.
- A node is a "volatility parent" if it appears as a `volatility_parent` of any other node in the edges structure.
- A node is a "value parent" if it appears as a `value_parent` of any other node and is NOT also a volatility parent of any node.

Encode the semantic rules as explicit logic with assertions, not as heuristics. Add a unit test that asserts `schema["nodes"][6]["role"] == "volatility"` for the pick_best_cue 3-level model.

**Warning signs:**
- Inspector classifies nodes by `"kind"` attribute from `node_parameters` only.
- Node role inference does not consult the edge structure.
- No test asserts that node 6 in the 3-level model is classified as "volatility parent."

**Phase to address:** Phase 22 (inspector).

**Priority:** HIGH — scientifically misleading output.

---

## Technical Debt Patterns

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Mock `Network` in all inspector tests | Tests run in milliseconds | Real attribute-path bugs not caught | Never for the canary test; acceptable for structural/shape tests |
| Hardcode `"participant_id"` coord name | Works for Laplace path today | Breaks when NUTS idata is loaded (Decision 131/135) | Never |
| Copy phenotype labels from template into inspector | Avoids template audit | Generic viewer shows PAT-RL labels on pick_best_cue models | Never |
| Use `json.dumps(..., ensure_ascii=False)` | Preserves Unicode in labels | `</script>` injection vulnerability; surrogate-pair breakage | Never for HTML injection |
| Add bridge function to `task_config.py` | Convenient accessor | Violates Decision 112 parallel-stack invariant | Never |
| Skip REPL verification of pyhgf attributes | Save 30 minutes | Inspector based on wrong paths; fails on first real use | Never |

---

## Integration Gotchas

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| pyhgf `Network` | Access `net.attributes[i]["tonic_volatility"]` from training-data assumption | Verify attribute path in REPL first; use `_safe_temp` pattern for temp keys |
| ArviZ `InferenceData` | Hardcode `"participant_id"` coord name | Detect dynamically; support both `"participant"` and `"participant_id"` (Decisions 131, 135) |
| React JSX template | Inject raw JSON string | Use `ensure_ascii=True`, escape `</script>`, assert marker absence after injection |
| `pat_rl_config.py` | Add a viewer helper method to the config class | Keep all viewer adapter code in `src/prl_hgf/viz/adapters.py` |
| Pick-best-cue 3-level model | Traverse edges naively and render 3 volatility nodes | Deduplicate by node index; use dict keyed by index |

---

## "Looks Done But Isn't" Checklist

- [ ] **Inspector REPL verification:** Attribute paths confirmed against a running `Network` instance before any production code, not just from the handoff doc.
- [ ] **Temp-key fallback:** `_safe_temp`-style guard used for all `node_trajectories["temp"]` access, not direct subscript.
- [ ] **Deduplication test:** Pick-best-cue 3-level model produces exactly 7 nodes in schema, not 9.
- [ ] **ArviZ coord detection:** `_get_participant_dim` handles both `"participant"` and `"participant_id"`.
- [ ] **Injection marker assertion:** `inject()` raises `InjectionError` when marker is absent from template.
- [ ] **2-level volatility panel:** A 2-level model payload causes the React component to hide the volatility panel (not render NaN values).
- [ ] **Scope C file count:** `src/prl_hgf/viz/` contains only `__init__.py`, `inspector.py`, and `tests/test_inspector.py` after Phase 22.
- [ ] **Handoff updated:** `docs/HANDOFF_pyhgf_plot_network_extension.md` reflects verified attribute paths, not hypotheses.
- [ ] **Template audit complete:** All PAT-RL-specific hardcoded strings classified (remove / make data-driven / conditional) before Phase 23 injection work begins.
- [ ] **No env/ diffs:** `src/prl_hgf/env/task_config.py` and `env/pat_rl_config.py` have zero new imports pointing to `viz/`.

---

## Recovery Strategies

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| Wrong pyhgf attribute paths (P1) | MEDIUM | Re-run REPL verification; update inspector; re-run tests. ~2 hours if caught before Phase 23; ~1 day if after injection code written. |
| Injection failure (P4–P5) | LOW | Fix `json.dumps` flags and marker escaping; re-run injection test. ~1 hour. |
| Coord name collision (P9) | LOW | Refactor one function (`_get_participant_dim`); update tests. ~30 minutes. |
| Template audit skipped (P11) | HIGH | Requires full template audit + targeted JSX refactor + re-test all model variants. ~1 day. |
| Scope creep — partial renderer in Phase 22 (P8) | HIGH | Move renderer code to a branch; unscope from Phase 22; re-plan Phase 23. ~0.5 day churn plus planning overhead. |
| Shared volatility node duplication (P3) | LOW | Fix traversal accumulator (list → dict); update test. ~1 hour if caught early. |
| GUI regression from model-building refactor (P7) | MEDIUM | Revert model-building changes; add additive-only guard to Phase 22/23 checklists. ~0.5 day. |

---

## Pitfall-to-Phase Mapping

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| P1: Hypothesis-based coding | Phase 22 (first task) | REPL session committed as comment; no production code written before session |
| P2: Temp-key drift | Phase 22 (inspector) | Canary integration test passes on real `Network` instance |
| P3: Shared volatility node duplication | Phase 22 (traversal) | Unit test asserts 7 nodes for pick_best_cue 3-level |
| P4: Marker collision / injection | Phase 23 (export) | BeautifulSoup parse test on injected HTML |
| P5: Silent injection failure | Phase 23 (export) | `InjectionError` test for missing-marker case |
| P6: Parallel-stack violation | Phase 22 (review gate) | `grep -r "from prl_hgf.viz" src/prl_hgf/env/` returns empty |
| P7: GUI regression | Phase 22/23 (additive-only policy) | No diffs in `src/prl_hgf/models/` after phases close |
| P8: Scope creep | Phase 22 (file-list constraint) | `ls src/prl_hgf/viz/` matches expected file list exactly |
| P9: ArviZ coord name | Phase 23 (idata reader) | Unit test covers both `"participant"` and `"participant_id"` coords |
| P10: 2-level template default | Phase 23 (template) | Test loads 2-level schema; asserts `hgf_level` field present in JSON payload |
| P11: Template PAT-RL hardcoding | Phase 23 (first task) | Template audit grep checklist completed before injection code written |
| P12: Vacuous mock tests | Phase 22 (test design) | At least one canary test calls `build_2level_network_patrl()` directly |
| P13: Handoff drift | Phase 22 (close-out) + Phase 24 | Handoff has "Verified" annotation; no "Key questions to resolve" remaining |
| P14: JSON vs YAML divergence | Phase 22 (schema design) | Single schema format chosen and documented in `viz/__init__.py` |
| P15: Dev env incompatibility | Phase 22/23 (dep introduction) | New deps verified in `ds_env` before phase closes |
| P16: Node semantic mislabeling | Phase 22 (inspector) | Unit test asserts role="volatility" for node 6 in 3-level pick_best_cue |

---

## Sources

- `docs/HANDOFF_pyhgf_plot_network_extension.md` — primary prior-art document (235 lines, Option C architecture)
- `.planning/STATE.md` Decisions 112, 118, 119, 128, 129, 131, 135, 184 — verified design decisions grounding these pitfalls
- `src/prl_hgf/analysis/export_trajectories.py:_safe_temp()` — existing correct pattern for pyhgf temp-key fallback
- `src/prl_hgf/fitting/laplace_idata.py` module docstring — confirms `"participant_id"` vs `"participant"` asymmetry
- `src/prl_hgf/models/hgf_3level.py` — confirms node 6 as shared volatility parent (topology duplication risk)
- `src/prl_hgf/models/hgf_2level_patrl.py` — node index constants (INPUT_NODE=0, BELIEF_NODE=1)
- `src/prl_hgf/models/hgf_3level_patrl.py` — node index constants (VOLATILITY_NODE=2)
- `src/prl_hgf/env/pat_rl_config.py` module docstring — Decision 112 parallel-stack contract
- `src/prl_hgf/gui/explorer.py` — ipywidgets GUI imports (blast-radius reference)
- `figures/patrl_hgf_model.html` lines 46–131 — hardcoded PAT-RL phenotype labels and INFO strings (Pitfall 11)
- `figures/patrl_hgf_model.html` line 121 — `useState("3level")` hardcoded default (Pitfall 10)

---
*Pitfalls research for: Generic HGF Viewer scaffold (v1.3)*
*Researched: 2026-04-24*
