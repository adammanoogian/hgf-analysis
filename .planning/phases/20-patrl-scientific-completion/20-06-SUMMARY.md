---
phase: 20
plan: "06"
subsystem: analysis/bms
tags: [bms, waic, phenotype, peb, stratified, model-comparison, patrl]
one-liner: "PAT-RL phenotype-stratified BMS + PEB Δ-evidence export via compute_batch_waic_patrl / compute_stratified_bms / export_peb_covariates"

dependency-graph:
  requires: [20-01, 20-04, 20-05]
  provides: [compute_batch_waic_patrl, compute_subject_waic_patrl, compute_stratified_bms, export_peb_covariates]
  affects: [20-07]

tech-stack:
  added: []
  patterns: [phenotype-propagation-bridge, stratified-bms, peb-covariate-export, laplace-idata-waic-fast-path]

key-files:
  created: []
  modified:
    - src/prl_hgf/analysis/bms.py
    - tests/test_bms.py

decisions:
  - id: 173
    summary: "compute_stratified_bms is new — run_stratified_bms preserved unchanged (Decision 109 parallel-stack invariant)"
    rationale: "PAT-RL phenotype stratification uses compute_stratified_bms; pick_best_cue group stratification uses run_stratified_bms; neither delegates to the other"
    plan: "20-06"
  - id: 174
    summary: "delta_f sign convention: delta_f = delta_waic (unscaled proxy); consumers interpret as free-energy proxy"
    rationale: "Under WAIC ≈ -2*log-evidence, delta_f ≈ delta_waic / 2 up to an unknown additive constant that cancels in per-subject PEB contrasts; exact scaling is consumer-dependent (RESEARCH.md §12 Risk 6)"
    plan: "20-06"
  - id: 175
    summary: "Phase 20 BMS/PEB uses Laplace-produced InferenceData as default input (fast-path: log_likelihood group already populated)"
    rationale: "Per user directive 2026-04-19; NUTS deferred to post-Phase-14-15; compute_subject_waic_patrl has fast-path for pre-populated log_likelihood and slow-path (JAX logp re-evaluation) for idatas without it"
    plan: "20-06"
  - id: 176
    summary: "compute_subject_waic_patrl fast-path checks hasattr(idata, 'log_likelihood') — no deep copy needed"
    rationale: "build_idata_from_laplace does not populate log_likelihood; slow-path re-evaluates logp. Fast-path avoids copy overhead when log_likelihood is pre-populated by future fit paths"
    plan: "20-06"

metrics:
  duration: "~11 minutes"
  completed: "2026-04-19"
  tasks-completed: 4
  tests-added: 12
  tests-total: 90
  ruff-clean: true
  mypy-new-errors: 0
---

# Phase 20 Plan 06: Stratified BMS + PEB Export Summary

## What Was Built

Four new public functions added to `src/prl_hgf/analysis/bms.py` (all additive — zero existing functions modified):

### `compute_subject_waic_patrl(sim_df_sub, idata, model_name) -> float`

Per-participant WAIC for PAT-RL. Two-path design:
- **Fast path**: if `idata` has a `log_likelihood` group already (e.g. from a future fit path), calls `az.waic()` directly.
- **Slow path**: re-evaluates the PAT-RL JAX logp factory over every `(chain, draw)` posterior sample, injects into `log_likelihood` group on a deep-copy of idata, then calls `az.waic()`.

Used internally by `compute_batch_waic_patrl`.

### `compute_batch_waic_patrl(sim_df, idata_dict, model_names, phenotype_col) -> pd.DataFrame`

**The H3 producer-consumer inversion fix**: this function is the bridge from `sim_df['phenotype']` (Plan 20-04) to `fit_df['phenotype']` (required by `compute_stratified_bms` in this same plan).

- Iterates `(model, participant_id)` pairs across `idata_dict[model_name][participant_id]`
- Propagates phenotype via `id_to_phen` lookup from `sim_df`
- Participants absent from `sim_df` receive `phenotype='unknown'` (sentinel, not error)
- Raises `ValueError` when `phenotype_col` is absent from `sim_df`
- Returns `DataFrame` with columns: `participant_id`, `phenotype`, `model`, `elpd_waic`

### `compute_stratified_bms(fit_df, model_names, phenotype_col, evidence_col) -> dict[str, dict]`

PAT-RL phenotype-stratified Bayesian Model Selection (Rigoux et al. 2014).

- Builds `(n_subjects, n_models)` ELPD matrix per phenotype via `pivot_table`
- Calls `run_group_bms()` for the pooled sample (`"all"`) and for each phenotype
- Returns dict keyed by `"all"` + each unique phenotype label
- Raises `ValueError` for missing columns or models not in `fit_df`
- Logs `WARNING` for phenotypes with N < 20 (exploratory)
- Decision 109 parallel-stack invariant: `run_stratified_bms` (group-keyed, pick_best_cue) is untouched

### `export_peb_covariates(fit_df_2level, fit_df_3level, output_path, ...) -> pd.DataFrame`

Per-subject delta-evidence export for downstream PEB regression.

- Computes `delta_waic = elpd_waic(3-level) - elpd_waic(2-level)` (positive = 3-level better)
- `delta_f = delta_waic` (unscaled proxy — see delta-F sign convention below)
- Inner join on `(participant_id, phenotype_col)` — participants absent from either input are dropped
- Creates output parent directories automatically
- Writes CSV: `participant_id`, `phenotype`, `delta_waic`, `delta_f`
- Raises `ValueError` for missing columns or empty intersection

## Function Signatures

```python
def compute_subject_waic_patrl(
    sim_df_sub: pd.DataFrame,
    idata: az.InferenceData,
    model_name: str,
) -> float: ...

def compute_batch_waic_patrl(
    sim_df: pd.DataFrame,
    idata_dict: dict[str, dict[str, az.InferenceData]],
    model_names: list[str] | None = None,
    phenotype_col: str = "phenotype",
) -> pd.DataFrame: ...

def compute_stratified_bms(
    fit_df: pd.DataFrame,
    model_names: list[str],
    phenotype_col: str = "phenotype",
    evidence_col: str = "elpd_waic",
) -> dict[str, dict]: ...

def export_peb_covariates(
    fit_df_2level: pd.DataFrame,
    fit_df_3level: pd.DataFrame,
    output_path: Path,
    phenotype_col: str = "phenotype",
    evidence_col: str = "elpd_waic",
) -> pd.DataFrame: ...
```

## Producer/Consumer Chain (H3 Resolution)

```
sim_df (Plan 20-05, 160 agents)
  └── compute_batch_waic_patrl()  ←── idata_dict[model][pid]  ← fit_vb_laplace_patrl()
        ├── phenotype propagated via id_to_phen lookup
        └── fit_df (participant_id, phenotype, model, elpd_waic)
              ├── compute_stratified_bms(fit_df, model_names)
              │     └── run_group_bms() per phenotype + pooled
              └── export_peb_covariates(fit_df_2level, fit_df_3level, path)
                    └── CSV: participant_id, phenotype, delta_waic, delta_f
```

The H3 checker issue (producer in 20-07 while consumer in 20-06) is closed: `compute_batch_waic_patrl` now lives in Plan 20-06.

## Delta-F Sign Convention (Decision 174)

`delta_f = delta_waic` (unscaled proxy for free-energy difference).

Rationale: Under the approximation WAIC ≈ -2·log-evidence (Gelman et al. 2014), the log-evidence ratio F_3level - F_2level ≈ delta_waic / 2 up to an additive constant. That constant cancels in per-subject PEB contrasts. This function exports `delta_f = delta_waic` unscaled and documents the approximation in the docstring.

**Consumer action required**: If the downstream PEB consumer expects F_2level - F_3level, negate the `delta_f` column post-hoc. If it expects a /2 scaling, apply that post-hoc. See RESEARCH.md §12 Risk 6.

## Test Coverage

12 new tests in `tests/test_bms.py` (class `test_compute_*`):

| Test | Covers |
|------|--------|
| `test_compute_batch_waic_patrl_propagates_phenotype` | phenotype column correctly joins from sim_df |
| `test_compute_batch_waic_patrl_unknown_pid_sentinel` | pid absent from sim_df → phenotype='unknown' |
| `test_compute_batch_waic_patrl_missing_phenotype_raises` | ValueError when phenotype col absent |
| `test_compute_stratified_bms_returns_all_plus_per_phenotype` | keys = {"all", "healthy", "anxious"} |
| `test_compute_stratified_bms_missing_column_raises` | ValueError on missing phenotype col |
| `test_compute_stratified_bms_missing_model_raises` | ValueError on missing model in fit_df |
| `test_compute_stratified_bms_low_n_warning_fires` | WARNING with 'exploratory' for N < 20 |
| `test_compute_stratified_bms_preserves_run_stratified_bms` | pick_best_cue path unchanged |
| `test_export_peb_covariates_csv_columns` | columns + delta_waic = elpd_3 - elpd_2 |
| `test_export_peb_covariates_inner_join_alignment` | extra pid in df3 dropped |
| `test_export_peb_covariates_empty_intersection_raises` | ValueError on empty join |
| `test_export_peb_covariates_creates_parent_dir` | output parent mkdir works |

Full regression: **90/90 pass** (12 `@pytest.mark.slow` excluded).

## Deviations from Plan

### Commit granularity: Tasks 1+2+3 in one commit

Tasks 1, 2, and 3 were implemented in a single edit (all new functions appended to `bms.py` in one pass). The plan specified per-task commits but the implementation was verified working as a unit before any intermediate commit was possible. Both commits are present:

- `74bd46a` — feat(20-06): all four functions (Tasks 1+2+3)
- `ae97805` — test(20-06): 12 unit tests (Task 4)

### Test count: 12 not 5

The plan's Task 4 specified "5 unit tests" but listed 12 individual test cases. All 12 were implemented. The "5" referred to test categories, not test functions.

### compute_subject_waic_patrl: slow-path uses _make_single_logp_fn not build_logp_fn_batched_patrl

The plan said "mirror the pattern from `compute_subject_waic` using the PAT-RL logp factory." Implementation uses `_make_single_logp_fn` (single-participant, P=1) rather than `build_logp_fn_batched_patrl` (requires P-shaped arrays). This is correct since we have one participant at a time. Functionally equivalent, avoids batching overhead for single-subject WAIC.

## Parallel-Stack Invariant Verification

Files NOT modified:
- `hierarchical.py` — confirmed unchanged
- `task_config.py` — confirmed unchanged
- `simulator.py` — confirmed unchanged
- `hgf_2level.py`, `hgf_3level.py` — confirmed unchanged
- `response.py` — confirmed unchanged
- `configs/prl_analysis.yaml` — confirmed unchanged
- `analysis/group.py`, `analysis/recovery.py` — confirmed unchanged

`run_group_bms` and `run_stratified_bms` in `bms.py` — confirmed verbatim (regression test passes).

## Hand-off to Plan 20-07

Plan 20-07 (validation gates PRL-V1/V2) can now call:

```python
from prl_hgf.analysis.bms import (
    compute_batch_waic_patrl,
    compute_stratified_bms,
    export_peb_covariates,
)
```

Expected call sequence in `scripts/06_group_analysis.py`:
1. `fit_df = compute_batch_waic_patrl(sim_df, idata_dict, model_names=[...])`
2. `bms_results = compute_stratified_bms(fit_df, model_names=[...])`
3. `export_peb_covariates(fit_df_2level, fit_df_3level, output_path)`

`fit_df` schema: `participant_id`, `phenotype`, `model`, `elpd_waic` — one row per (participant, model).

## Commits

| Hash | Message |
|------|---------|
| `74bd46a` | feat(20-06): add compute_batch_waic_patrl — WAIC with phenotype propagation |
| `ae97805` | test(20-06): 12 unit tests for batch_waic_patrl + stratified_bms + peb_covariates |
