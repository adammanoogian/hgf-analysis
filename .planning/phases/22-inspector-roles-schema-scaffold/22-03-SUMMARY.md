---
phase: 22-inspector-roles-schema-scaffold
plan: 03
subsystem: viz
tags: [pyhgf, dataclass, frozen, arviz, laplace, networkspec, viz-scaffold, json-fixture]

requires:
  - phase: 22-inspector-roles-schema-scaffold
    provides: inspect_network dict + _VERIFIED_AGAINST_PYHGF_VERSION + _NODE_TYPE_INT_TO_STR (plan 22-01)
  - phase: 22-inspector-roles-schema-scaffold
    provides: infer_role adjacency-only classifier (plan 22-02)
provides:
  - NodeSpec + NetworkSpec @dataclass(frozen=True) with no schema_version field, no extra dict
  - build_network_spec(network, idata=None, coord_name=None) composing inspector + roles + optional ArviZ
  - _get_participant_dim (dual coord-name dims probe) and _is_laplace (sample_stats.data_vars membership)
  - r_hat suppression (None on every NodeSpec) when idata is VB-Laplace-provenance
  - Final Phase 22 public API on src/prl_hgf/viz/__init__.py (inspect_network, build_network_spec, NetworkSpec, NodeSpec)
  - data/viz_fixtures/patrl_3level_prefit.json Medium-tier pre-fit fixture (topology + priors + visual hints)
affects:
  - 22-04 (unit tests exercise build_network_spec + round-trip + Laplace suppression on the fixture)
  - phase 23 (export.py injects the NetworkSpec asdict payload into the HTML template; fixture is the Phase 23 pre-fit rendering input)
  - phase 24 (POST-01 extends posterior_mean/hdi/r_hat from empty-tuple presence signal to full az.summary output)

tech-stack:
  added: []
  patterns:
    - "Frozen dataclass schema with no schema_version / no extra dict (CONTEXT Decision 4) -- future-compat is deferred to v1.5 PR, not scaffolded speculatively"
    - "Dual-probe coord detection: set(idata.posterior.dims) membership for 'participant_id' then 'participant' -- never assume a task -> coord_name mapping"
    - "Laplace provenance check via 'laplace' in sample_stats.data_vars membership (not == True element-wise comparison)"
    - "Presence-only posterior fields in Phase 22 scaffold (empty tuple = present, None = absent); full extraction deferred to Phase 24"
    - "Fixture priors loaded verbatim from config YAML -- schema-level drift tests compare fixture -> YAML"
    - "data/ gitignore pattern: data/* ignores runtime outputs while !data/viz_fixtures/ whitelists committed schema fixtures"

key-files:
  created:
    - src/prl_hgf/viz/schema.py
    - data/viz_fixtures/patrl_3level_prefit.json
  modified:
    - src/prl_hgf/viz/__init__.py
    - .gitignore

key-decisions:
  - "NodeSpec.kind validated against _NODE_TYPE_INT_TO_STR.values() and role against {'input', 'value', 'volatility'} in __post_init__ -- single source of truth, no re-declaration of valid enum set"
  - "Phase 22 scaffold emits posterior_mean=(), posterior_hdi=(), r_hat=() (or None if Laplace/no-idata) as presence signals; full az.summary extraction deferred to Phase 24 POST-01 to avoid scope drift"
  - "Whitelist data/viz_fixtures/ via .gitignore negation (data/* + !data/viz_fixtures/) -- fixture is committed schema input; other data/ outputs remain ignored"
  - "source_pyhgf_version default pulled from inspector._VERIFIED_AGAINST_PYHGF_VERSION so NetworkSpec stays coupled to the REPL-verified pyhgf pin (currently 0.2.8)"

patterns-established:
  - "Dataclass schema pattern: frozen + no forward-compat scaffolding + explicit __post_init__ validators (mirrors env/pat_rl_config.py PATRLConfig conventions)"
  - "Dual-name xarray coord probe via set(...dims) membership -- reusable pattern for any future participant-dim consumers"
  - "Membership-check over equality-comparison for xarray sentinel vars (avoids element-wise DataArray return)"

duration: 10 min
completed: 2026-04-24
---

# Phase 22 Plan 03: NetworkSpec Frozen Dataclass + Medium-Tier Fixture Summary

**Frozen `NetworkSpec`/`NodeSpec` dataclasses with `build_network_spec` composing inspector + roles + optional ArviZ, dual participant-coord detection via `dims` membership, Laplace r_hat suppression via `data_vars` membership, and a Medium-tier PAT-RL 3-level JSON fixture whose topology matches `build_3level_network_patrl()` and whose priors mirror `configs/pat_rl.yaml` verbatim.**

## Performance

- **Duration:** 10 min
- **Started:** 2026-04-24T18:33:42Z
- **Completed:** 2026-04-24T18:43:23Z
- **Tasks:** 2
- **Files modified:** 4 (2 created, 2 modified)

## Accomplishments

- `src/prl_hgf/viz/schema.py` created (~240 lines): frozen `NodeSpec` + `NetworkSpec` dataclasses, `_get_participant_dim`, `_is_laplace`, `build_network_spec`. Zero `schema_version` and zero `extra:` occurrences per CONTEXT Decision 4.
- Final Phase 22 public API landed on `src/prl_hgf/viz/__init__.py`: `inspect_network`, `build_network_spec`, `NetworkSpec`, `NodeSpec`. `render_viewer_html` intentionally NOT included (deferred to Phase 23).
- `data/viz_fixtures/patrl_3level_prefit.json` Medium-tier fixture shipped: topology matches the actual `build_3level_network_patrl()` output (binary-state L1 input, continuous-state L2 value, continuous-state L3 volatility); priors exactly match `configs/pat_rl.yaml` fitting.priors; parameter set is `ω₂, ω₃, κ, β, b, μ₃⁰` (NO ζ -- ζ is pick_best_cue-only).
- `.gitignore` minimally amended to `data/*` + `!data/viz_fixtures/` so the fixture can commit while runtime `data/` outputs remain ignored.
- Both atomic commits produced; ruff + ruff-format + mypy all clean; parallel-stack invariant preserved (0 lines changed in env/models/fitting/analysis/gui/power/simulation across the two commits).

## Task Commits

1. **Task 1: schema.py -- NetworkSpec + NodeSpec frozen dataclasses + build_network_spec + dual coord-name probe + r_hat suppression** -- `6cde056` (feat)
2. **Task 2: Medium-tier PAT-RL 3-level pre-fit fixture JSON** -- `9ecb8fa` (feat)

## Files Created/Modified

- `src/prl_hgf/viz/schema.py` (new) -- NodeSpec (15 fields), NetworkSpec (6 fields), `_get_participant_dim`, `_is_laplace`, `build_network_spec`. Stdlib + `prl_hgf.viz.{inspector,roles}` imports only.
- `src/prl_hgf/viz/__init__.py` (modified) -- final Phase 22 public API: `inspect_network`, `build_network_spec`, `NetworkSpec`, `NodeSpec`.
- `data/viz_fixtures/patrl_3level_prefit.json` (new) -- 3-node topology + visual hints + parameter priors. Valid JSON; topology cross-checked against builder; priors cross-checked against YAML.
- `.gitignore` (modified) -- replaced `data/` with `data/*` + `!data/viz_fixtures/` so committed schema fixtures pass through the ignore rule.

## Verification Outputs

**asdict + json round-trip (NetworkSpec, PAT-RL 3-level, no idata):**
```
dict keys: ['coord_name', 'input_idxs', 'is_laplace', 'n_nodes', 'nodes', 'source_pyhgf_version']
nodes length: 3
sample node[0] keys: ['branch_idx', 'idx', 'kind', 'level', 'mean',
                      'posterior_hdi', 'posterior_mean', 'precision', 'r_hat',
                      'role', 'tonic_volatility', 'value_children',
                      'value_parents', 'volatility_children', 'volatility_parents']
```

**Laplace suppression canary (synthetic `az.from_dict` idata with `sample_stats={'laplace': ...}`, coord `participant_id`):**
```
is_laplace: True
coord_name: participant_id
Every node r_hat: None  (canary PASS)
posterior_mean / posterior_hdi: empty tuple (presence signal)
```

**NUTS control canary (`participant` coord, no `laplace` in sample_stats):**
```
is_laplace: False
coord_name: participant
Every node r_hat: ()  (empty tuple -- Phase 24 POST-01 will populate)
```

**Topology fixture-vs-builder consistency check:**
```
raw.n_nodes == fixture.n_nodes: 3 == 3
raw.input_idxs == fixture.input_idxs: (0,) == [0]
Node-by-node kind/level/branch_idx/value_parents/volatility_parents/
  value_children/volatility_children all match for idx in (0, 1, 2)
-> T2 verify #3 PASS
```

**Prior drift check (configs/pat_rl.yaml vs fixture parameters block):**
```
omega_2  mean=-4.0 sd=2.0           (match)
omega_3  mean=-6.0 sd=2.0           (match)
kappa    mean=1.0  sd=0.5  [0, 2]   (match truncated)
beta     mean=4.0  sd=3.0  [0, 20]  (match truncated)
mu3_0    mean=1.0  sd=1.0           (match)
b        mean=0.0  sd=1.0           (match)
-> T2 verify #2 PASS
```

**pick_best_cue node-6 canary (reused from 22-02):**
```
spec.nodes[idx=6]: role='volatility', branch_idx=None
-> T1 verify #2 PASS
```

## Verification Status

| Check | Result |
|-------|--------|
| `python -c "from prl_hgf.viz import inspect_network, build_network_spec, NetworkSpec, NodeSpec"` | OK |
| PAT-RL 3-level build_network_spec -> n_nodes=3, 3 NodeSpecs, coord=None, laplace=False | OK |
| pick_best_cue node 6 -> role='volatility', branch_idx=None (through build_network_spec) | OK |
| asdict + json.dumps round-trip of NetworkSpec | OK |
| Laplace canary: synthetic az.from_dict(sample_stats={'laplace': ...}, coords={'participant_id': ...}) -> is_laplace=True, every r_hat=None | OK |
| NUTS canary: synthetic az.from_dict(sample_stats={'diverging': ...}, coords={'participant': ...}) -> is_laplace=False, coord_name='participant', r_hat=() | OK |
| `grep -c schema_version src/prl_hgf/viz/schema.py` | 0 (CONTEXT Decision 4) |
| `grep -c 'extra:' src/prl_hgf/viz/schema.py` | 0 (CONTEXT Decision 4) |
| Fixture valid JSON, n_nodes=3, task=pat_rl | OK |
| `grep -c 'phenotype\|phenotype_preset\|balanced\|threat_hypervigilant\|reward_blunted\|both_disrupted' fixture` | 0 (CONTEXT Decision 1 Medium tier) |
| `grep -c 'zeta\|ζ' fixture` | 0 (Pitfall 7) |
| `grep -n zeta src/prl_hgf/models/response_patrl.py` | 0 matches (PAT-RL uses 'b', not ζ) |
| Fixture priors == configs/pat_rl.yaml fitting.priors (omega_2, omega_3, kappa, beta, mu3_0, b) | OK |
| Fixture topology matches build_3level_network_patrl() inspector output | OK |
| `ruff check src/prl_hgf/viz/{schema,__init__}.py` | All checks passed |
| `ruff format --check src/prl_hgf/viz/{schema,__init__}.py` | 2 files already formatted |
| `mypy src/prl_hgf/viz/` | Success: no issues found in 4 source files |
| Parallel-stack invariant across both commits (env/models/fitting/analysis/gui/power/simulation) | 0 lines changed |

## Decisions Made

- **D1 (`data/` gitignore whitelist):** The plan requires committing `data/viz_fixtures/patrl_3level_prefit.json`, but the pre-existing `.gitignore` blanket-ignores `data/`. Minimally amended to `data/*` + `!data/viz_fixtures/` so schema fixtures commit while runtime outputs (simulation results, fit parquets, etc.) remain ignored. No other `.gitignore` rules touched. **Rationale:** blanket negation (`!data/viz_fixtures/`) cannot reopen a fully-ignored directory; the `data/*` pattern leaves the parent open for re-inclusion of named subdirectories.
- **D2 (Scalar `_VALID_ROLES` constant):** Stored valid-role set as module-level `frozenset` (`_VALID_ROLES`) once, referenced from `NodeSpec.__post_init__`. Avoids re-declaring `{"input", "value", "volatility"}` inline in each validator invocation; the error message uses `sorted(_VALID_ROLES)` for deterministic output.
- **D3 (Presence-only posterior fields):** Phase 22 scaffold scope explicitly stops at "presence signal" for `posterior_mean`/`posterior_hdi`/`r_hat` (empty tuple when idata given, `None` when not). Full per-parameter `az.summary` extraction is Phase 24 POST-01. Emitting empty tuples NOW lets Phase 24 tests detect "idata was supplied" vs "pre-fit" without schema change.
- **D4 (Type annotations on conditional assignments):** For ruff/mypy cleanliness on the conditional `posterior_mean / posterior_hdi / r_hat` assignments inside `build_network_spec`, each uses an explicit `: tuple[...] | None = ...` annotation to disambiguate the type union (otherwise mypy would need to infer `tuple[Never, ...] | None` from the empty-tuple literal).

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] `.gitignore` was blocking fixture commit**
- **Found during:** Task 2 (fixture commit staging)
- **Issue:** `git add data/viz_fixtures/patrl_3level_prefit.json` failed with "paths are ignored by .gitignore". Pre-existing rule `data/` (line 6) blanket-ignores the directory; `!data/viz_fixtures/` cannot reopen a fully-ignored directory.
- **Fix:** Replaced `data/` with `data/*` + `!data/viz_fixtures/`. Preserves blanket-ignore semantics for all other `data/` subdirectories while whitelisting committed schema fixtures.
- **Files modified:** `.gitignore`
- **Verification:** `git check-ignore -v data/viz_fixtures/patrl_3level_prefit.json` exits 1 (unignored). `git status --ignored` confirms runtime `data/` outputs would still match `data/*`.
- **Committed in:** `9ecb8fa` (Task 2 commit)

---

**Total deviations:** 1 auto-fixed (1 blocking)
**Impact on plan:** Essential for task completion; no scope creep. Rule semantics preserved: runtime `data/` outputs remain ignored; only the small committed schema fixture directory passes.

## Issues Encountered

- **Pre-existing uncommitted modifications to `src/prl_hgf/fitting/hierarchical_patrl.py`** (from prior Phase 20 work) surfaced in the parallel-stack invariant check again. Same as in 22-02. Carried over at session start; NOT introduced by this plan. Staging was explicit (`git add` named files only) so both commits are clean of that diff.
- **`ruff format --check` initially failed on `schema.py`** (a multi-line `raise ValueError(...)` that ruff collapsed to one line). Ran `ruff format` to apply; re-verified; re-ran ruff/format/mypy -- all clean. Zero behavioural impact.

## User Setup Required

None -- no external service configuration required.

## Next Phase Readiness

- **Ready for 22-04** (unit tests): `tests/test_viz_schema.py` can import `{NetworkSpec, NodeSpec, build_network_spec}` from `prl_hgf.viz` directly; synthetic `AdjacencyLists` NamedTuples + synthetic `az.from_dict` idata exercise all schema branches (Laplace vs NUTS, participant vs participant_id, pre-fit vs fit).
- **Ready for Phase 23**: `export.py` consumes `dataclasses.asdict(build_network_spec(network, idata))` directly for injection into `<script type="application/json" id="viz-network-spec">`. The fixture doubles as a pre-fit regression input.
- **No blockers.**
- **Invariants preserved:**
  - CONTEXT Decision 4 (no `schema_version`, no `extra:`) -- grep counts = 0
  - CONTEXT Decision 1 (Medium tier fixture, no phenotypes) -- grep counts = 0
  - Pitfall 7 (PAT-RL params, no ζ) -- grep counts = 0; response_patrl.py zeta matches = 0
  - Dual coord-name detection via `.dims` (NOT `.data_vars`) -- canaries pass
  - Laplace detection via `data_vars` membership (NOT `== True`) -- canaries pass
  - Parallel-stack invariant (env/models/fitting/analysis/gui/power/simulation) -- 0 lines across both commits
  - Fixture topology matches `build_3level_network_patrl()` -- cross-check script PASS
  - Fixture priors match `configs/pat_rl.yaml` fitting.priors -- drift-check script PASS

---
*Phase: 22-inspector-roles-schema-scaffold*
*Completed: 2026-04-24*
