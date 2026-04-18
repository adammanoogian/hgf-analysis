# Phase 20: PAT-RL Scientific Completion — Research

**Researched:** 2026-04-18
**Domain:** PAT-RL response models B/C/D, config correction, cohort scale, stratified BMS/PEB, validation gates, citation replacement
**Confidence:** HIGH (codebase read direct; citations MEDIUM for new papers; LOW for exact consumer-spec field names not accessible)

---

## Summary

Phase 20 closes every gap between the Phase 18/19 PAT-RL surface and the downstream consumer study spec. The work falls into six clusters: (1) config correction to match the consumer contingencies/run-order/magnitudes/phenotype-priors; (2) response model extension — adding bias `b` to Model A and implementing Models B, C, D as parallel functions in `response_patrl.py` plus matching logp dispatcher in `hierarchical_patrl.py` and `fit_vb_laplace_patrl.py`; (3) epsilon-2-coupled ΔHR generative model in the simulator; (4) cohort scaling from 8 to 40 agents per phenotype with per-phenotype SeedSequence; (5) phenotype-stratified BMS + PEB covariate export in `bms.py`; (6) formal recovery and separability gates wired into existing `scripts/05` and `scripts/06` via `--task=patrl` / `--analysis=phenotype_separability` toggles.

**Primary recommendation:** Implement all six clusters additively — new kwargs with safe defaults everywhere, extending (not replacing) Phase 18/19 call sites. Never create new scripts; extend `scripts/{03,04,05,06,12}_*.py` only.

---

## 1. Config Delta (with file:line references)

**File:** `configs/pat_rl.yaml`

### 1.1 Contingencies (lines 33–41, current → target)

| State | Field | Phase-18 current | Phase-20 target |
|-------|-------|-----------------|----------------|
| safe | reward | 0.75 | 0.70 |
| safe | shock | 0.00 | 0.10 |
| safe | nothing | 0.25 | 0.20 |
| dangerous | reward | 0.25 | 0.10 |
| dangerous | shock | 0.50 | 0.70 |
| dangerous | nothing | 0.25 | 0.20 |

The roadmap SC1 specifies: safe 70/10/20, dangerous 10/70/20, avoid 10/10/80.
The "avoid 10/10/80" row is the *avoid* action outcome (currently implicit — avoid always yields nothing). If the consumer spec requires an explicit `avoid` contingency block (P(reward|avoid)=0.10, P(shock|avoid)=0.10, P(nothing|avoid)=0.80), a new `ContingencyConfig.avoid: OutcomeProbs` field is needed in both the YAML and `pat_rl_config.py`. Currently `OutcomeProbs` only models the approach action and the config loader at lines 585-588 does NOT parse an `avoid` block. **Flag as loader change needed** (see §1.5 below).

### 1.2 Run order (line 25, current → target)

| Field | Phase-18 current | Phase-20 target |
|-------|-----------------|----------------|
| run_order | `["stable", "volatile", "stable", "volatile"]` (SVSVS pattern) | `["stable", "volatile", "volatile", "stable"]` (SVVS) |

No loader change needed — `run_order` is already a free list of strings.

### 1.3 Magnitudes (lines 46–47, current → target)

| Field | Phase-18 current | Phase-20 target |
|-------|-----------------|----------------|
| reward_levels | [1.0, 5.0] | [1, 3] |
| shock_levels | [1.0, 5.0] | [1, 3] |

No loader change needed — already tuple of floats.

### 1.4 Phenotype priors (lines 78–97, current → target)

The Phase-18 values are Browning 2015 / Daw 2006 grounded. The consumer spec supplies different values. The roadmap SC1 says "match consumer spec exactly" — the exact numeric values must come from the researcher / consumer study YAML. The structural changes needed regardless:

- **Add `b` field per phenotype** (response bias; new in Phase 20): `b: {mean: 0.0, sd: 0.5}` — represents the prior on the additive response bias parameter.
- **Add `dhr_mean` and `dhr_sd` fields per phenotype** (ε₂-coupled ΔHR generative model; PRL-06).
- **Add `epsilon2_coupling_coef` field per phenotype** — coefficient λ_dhr that scales ε₂(t) in the ΔHR generative model.

Current `PhenotypeParams` dataclass (lines 408-428) has only `omega_2`, `beta`, `kappa`, `mu3_0`. It will need `b`, `dhr_mean`, `dhr_sd`, `epsilon2_coupling_coef` fields.

### 1.5 Loader changes in `env/pat_rl_config.py`

| Change | Location | Reason |
|--------|----------|--------|
| Add `avoid: OutcomeProbs` to `ContingencyConfig` | line 131+ | Consumer spec has explicit avoid contingency |
| Add `avoid` parsing to `_parse_contingencies()` | line 585 | Load the new field |
| Add `b`, `dhr_mean`, `dhr_sd`, `epsilon2_coupling_coef` to `PhenotypeParams` | line 408 | New phenotype generative params |
| Update `_parse_phenotype_params()` | line 653 | Parse new fields |
| Add `b` prior to `FittingPriorConfig` | line 472 | Prior for Model A+b and Models B, C |
| Update `_parse_fitting_priors()` | line 674 | Parse new fitting prior field |

**Confidence:** HIGH for structural changes; LOW for exact numeric target values (researcher must provide from consumer spec).

---

## 2. Response Model Surface (current + extension sketch)

### 2.1 Current Model A signature

```python
# response_patrl.py line 75
def model_a_logp(
    mu2: jnp.ndarray,       # (n_trials,)
    choices: jnp.ndarray,   # (n_trials,) int32
    reward_mag: jnp.ndarray,# (n_trials,)
    shock_mag: jnp.ndarray, # (n_trials,)
    beta: float | jnp.ndarray,  # scalar
) -> jnp.ndarray:           # (n_trials,)
```

The logit structure is: `[0, beta * EV_approach]`. No bias term. No ΔHR.

### 2.2 Model A + bias `b` (minimum-risk extension)

Add `b: float | jnp.ndarray = 0.0` as a keyword argument with default 0:

```python
def model_a_logp(mu2, choices, reward_mag, shock_mag, beta, b=0.0):
    ev_approach = expected_value(mu2, reward_mag, shock_mag)
    logits = jnp.stack([jnp.zeros_like(ev_approach), beta * ev_approach + b], axis=-1)
    ...
```

All existing call sites pass `b` as positional or omit it — safe default of 0.0 preserves backwards compatibility.

### 2.3 Models B, C, D — recommended structure

Add three new functions in `response_patrl.py` (parallel to `model_a_logp`, NOT a dispatch switch):

```python
def model_b_logp(mu2, choices, reward_mag, shock_mag, beta, b, gamma, delta_hr):
    """Model B: sigma(beta*EV + b + gamma*dHR)"""
    ev = expected_value(mu2, reward_mag, shock_mag)
    logits = jnp.stack([jnp.zeros_like(ev), beta * ev + b + gamma * delta_hr], axis=-1)
    ...

def model_c_logp(mu2, choices, reward_mag, shock_mag, beta, b, alpha, gamma, delta_hr):
    """Model C: sigma((beta + alpha*dHR)*EV + b + gamma*dHR)"""
    ev = expected_value(mu2, reward_mag, shock_mag)
    effective_beta = beta + alpha * delta_hr
    logits = jnp.stack([jnp.zeros_like(ev), effective_beta * ev + b + gamma * delta_hr], axis=-1)
    ...

def model_d_logp(mu2_traj_fn, choices, reward_mag, shock_mag, beta, b, lam, delta_hr):
    """Model D: mu2 trajectory uses omega_eff(t) = omega + lam*dHR(t).
    NOTE: mu2 is NOT passed in; it is computed internally via attrs injection.
    This function is a scan-body helper, not a standalone logp function.
    See Section 3 for the trial-varying omega scan body design.
    """
```

**Rationale for separate functions over a `model_variant` kwarg:** The `_single_logp` inner function inside `_make_single_logp_fn` closes over `model_name` and dispatches accordingly. Adding a second dispatch axis (`response_model`) is cleanest as a `model_variant: str` argument to `_make_single_logp_fn`, which then selects which response function to call after the HGF scan. This avoids fan-out at the outer `logp_fn` level where shapes are already committed.

**Call site consistency:** `fit_batch_hierarchical_patrl` already has `response_model: str = "model_a"` parameter (line 663) and raises `NotImplementedError` for anything other than `"model_a"`. The Phase 20 plan simply extends the `if response_model != "model_a": raise` check to allow `"model_b"`, `"model_c"`, `"model_d"`. Same pattern in `fit_vb_laplace_patrl.py` line 133-179.

**Prior extension in `_build_patrl_log_posterior`:** new parameters `b`, `gamma`, `alpha`, `lam` need priors added to the log-posterior builder. These come from new fields in `FittingPriorConfig`.

**Confidence:** HIGH for design; implementation detail for Model D scan body in §3.

---

## 3. Model D Trial-Varying ω (kappa-via-attrs mirror)

### 3.1 The Phase 18-04 kappa-via-attrs reference pattern

In `hierarchical_patrl.py::_make_single_logp_fn` the 3-level injection (lines 237-243):

```python
attrs[_VOLATILITY_NODE] = {
    **attrs[_VOLATILITY_NODE],
    "tonic_volatility": params["omega_3"],
    "volatility_coupling_children": jnp.asarray([params["kappa"]]),
    "mean": params["mu3_0"],
}
```

This injects scalar parameters into `attrs` before the scan. For Model D, `omega_eff(t) = omega + lam * delta_hr(t)` varies per trial — it cannot be injected once before the scan.

### 3.2 Model D design: trial-varying omega inside `_clamped_step`

The per-trial ω injection must happen inside `_clamped_step` at each step. The scan carry does NOT need to change — `base_attrs` is the carry; we mutate the copy inside the step function before calling `scan_fn`.

```python
def _clamped_step_model_d(carry, x):
    val_i, obs_i, ts_i, dhr_i = x   # dhr_i is new — per-trial scalar
    # Compute effective omega for this trial
    omega_eff_i = params_omega + lam * dhr_i   # params captured from closure
    # Inject trial-level tonic_volatility
    attrs_i = {**carry}
    attrs_i[belief_idx] = {
        **attrs_i[belief_idx],
        "tonic_volatility": omega_eff_i,
    }
    new_carry, _traj = scan_fn(attrs_i, ((val_i,), (obs_i,), ts_i, None))
    # Layer-2 clamp (unchanged from Model A)
    new_mean = new_carry[belief_idx]["mean"]
    is_stable = jnp.all(jnp.isfinite(new_mean)) & (jnp.abs(new_mean) < _MU_2_BOUND)
    safe_carry = jax.tree_util.tree_map(
        lambda n, o: jnp.where(is_stable, n, o), new_carry, carry
    )
    return safe_carry, safe_carry[belief_idx]["mean"]
```

Key point: `omega_eff_i` is recomputed at every trial step from the JAX trace. `params_omega` and `lam` are scalar parameters from the outer closure (vmapped over the participant batch). `dhr_i` is a per-trial input carried in `xs`.

### 3.3 How ΔHR gets into the scan

`_clamped_step` currently receives `xs = (values, observed, time_steps)`. For Model D, extend to `xs = (values, observed, time_steps, delta_hr)`. The `delta_hr_arr` is already assembled by `_build_arrays_single_patrl` (line 527 returns `"delta_hr"` key). It just needs to be passed into `build_logp_fn_batched_patrl` — currently the function signature does NOT include `delta_hr_arr` (see line 304-310). For Models B, C, D this arg needs to be added to the factory signature.

The `delta_hr_jnp = jnp.asarray(delta_hr_arr, dtype=jnp.float64)` array (shape `(P, n_trials)`) is already in `float32` in `_build_arrays_single_patrl` (line 526) — should be promoted to `float64` to match the fp64 scan invariant.

**Confidence:** HIGH — mirrors the existing kappa injection pattern exactly; extension is mechanical.

---

## 4. ε₂-Coupled ΔHR Generative Model

### 4.1 Current simulator state

`pat_rl_simulator.py::simulate_patrl_cohort` does NOT currently run a forward HGF to extract ε₂(t). The forward pass via `run_hgf_forward_patrl` only returns `mu2` (line 73). ΔHR is drawn from the state-conditioned stub distribution inside `generate_session_patrl` (via `generate_delta_hr_stub` in `pat_rl_sequence.py` lines 80-100+), not computed from belief trajectories.

### 4.2 Required addition

The PRL-06 requirement: `ΔHR ~ N(phenotype.dhr_mean, phenotype.dhr_sd) + ε₂_coupling_coef * ε₂(t)`.

This requires:
1. Extract ε₂(t) from the forward HGF pass at true parameters. Currently `run_hgf_forward_patrl` returns only `mu2`. Need to also return `epsilon2` (level-2 prediction error = `temp["value_prediction_error"]` from the belief node trajectory).
2. In `simulate_patrl_cohort`, after the HGF forward pass at true params, compute: `delta_hr = rng.normal(phenotype.dhr_mean, phenotype.dhr_sd, n_trials) + phenotype.epsilon2_coupling_coef * epsilon2_traj`.
3. Clip to the existing `delta_hr_stub.bounds`.

### 4.3 Cost estimate

`run_hgf_forward_patrl` currently extracts `traj = net.node_trajectories[1]` and returns only `traj["mean"]`. The pyhgf temp dict (`traj["temp"]`) carries `value_prediction_error`. The extension is:

```python
# Extend run_hgf_forward_patrl return:
epsilon2 = np.asarray(traj["temp"]["value_prediction_error"], dtype=np.float64)
return mu2_array, epsilon2   # extend return type
```

This is zero additional compute — ε₂ is already computed inside the forward pass. The only cost is reading an extra array from `node_trajectories`. **Confidence:** HIGH — `test_export_trajectories.py::test_pyhgf_temp_keys_extracted` already validates that `"value_prediction_error"` is accessible.

### 4.4 Interface change

`run_hgf_forward_patrl` is called internally in `simulate_patrl_cohort` and in `scripts/12_smoke_patrl_foundation.py` via indirect call through the simulator. A return-type change from `np.ndarray` to `tuple[np.ndarray, np.ndarray]` would break the current internal callers. Safest approach: add `return_epsilon2: bool = False` kwarg; when True returns `(mu2, epsilon2)`, when False returns `mu2` only (backwards compatible).

**Confidence:** HIGH for design; existing tests in `test_pat_rl_simulator.py` check `run_hgf_forward_patrl` return shape — will need update for the new return type.

---

## 5. Cohort Scale + Per-Phenotype RNG

### 5.1 Current state

`configs/pat_rl.yaml` line 72: `n_participants_per_phenotype: 8` (32 total).
`simulate_patrl_cohort` (line 77) takes `n_participants: int` and draws ALL participants from the `"healthy"` phenotype only (line 110). There is NO multi-phenotype loop at present.

### 5.2 Required changes

**YAML change:** `n_participants_per_phenotype: 8` → `n_participants_per_phenotype: 40` (160 total).

**Simulator changes:**

The current `simulate_patrl_cohort` signature is:
```python
def simulate_patrl_cohort(n_participants, level, master_seed, config) -> (sim_df, true_params, trials_by_participant)
```

Phase 20 requires it to iterate over all 4 phenotypes. The recommended additive extension:

```python
def simulate_patrl_cohort(
    n_participants: int | None = None,   # if None, use config.simulation.n_participants_per_phenotype
    level: int = 2,
    master_seed: int | None = None,
    config: PATRLConfig | None = None,
    phenotypes: list[str] | None = None, # if None, use all 4; for smoke use ["healthy"]
) -> (sim_df, true_params, trials_by_participant):
```

The output `sim_df` gains a `phenotype` column (needed for stratified BMS §6).

**Per-phenotype SeedSequence spawn:**

```python
ss = np.random.SeedSequence(master_seed)
phenotype_seeds = ss.spawn(4)   # one SeedSequence per phenotype
for ph_idx, (ph_name, ph_ss) in enumerate(zip(phenotype_names, phenotype_seeds)):
    child_seeds = ph_ss.spawn(n_per_phenotype)  # per-participant seeds within phenotype
    ...
```

This ensures determinism: same master_seed always produces the same 160-agent cohort, regardless of number of phenotypes or order of iteration. The current per-participant `ss.spawn(n_participants)` pattern works for single-phenotype; the per-phenotype version requires the extra level of spawning.

### 5.3 SLURM budget

160 agents × 192 trials at simulation: negligible (pure NumPy, seconds). At NUTS fitting (production): 160 agents × 192 trials × 5000 MCMC samples — the batched JAX `vmap` path from Phase 17-18 handles this. The 5-agent CPU smoke gate requires only `n_per_phenotype=2` per phenotype run (8 total) or a `--phenotypes healthy` single-phenotype flag. No blockers.

**Confidence:** HIGH for RNG design; MEDIUM for SLURM budget (depends on whether ds_env has blackjax — currently a known blocker per STATE.md line 165).

---

## 6. Stratified BMS + PEB Export

### 6.1 Current `bms.py` structure

`analysis/bms.py` already exports:
- `run_group_bms(elpd_matrix, model_names, group_label)` — single-group BMS via groupBMC
- `run_stratified_bms(waic_df, model_names)` — stratifies by `waic_df["group"]` column

The existing `run_stratified_bms` already stratifies by `group`. For PAT-RL the stratification key is `phenotype`, not `group`. Options:
1. Add `compute_stratified_bms(fit_df, phenotype_col="phenotype")` as a new public function that adapts the existing per-group logic.
2. Make `run_stratified_bms` accept an optional `group_col` kwarg (default `"group"`).

Option 2 is more additive — one new kwarg. But the roadmap SC6 names a new function `compute_stratified_bms`. **Use Option 1** (new function calling `run_group_bms` internally) to match the spec exactly and avoid changing existing callers.

### 6.2 `compute_stratified_bms` sketch

```python
def compute_stratified_bms(
    fit_df: pd.DataFrame,
    model_names: list[str],
    phenotype_col: str = "phenotype",
    evidence_col: str = "elpd_waic",
) -> dict[str, dict]:
    """PAT-RL phenotype-stratified BMS.
    fit_df must have columns: participant_id, phenotype, model, elpd_waic.
    Returns dict keyed by "all" + each phenotype label.
    """
    # Reuses run_group_bms internally (no new BMS math)
    ...
```

Input `fit_df` shape: rows are `(participant_id, phenotype, model, elpd_waic)`. This is the same shape as the existing WAIC df except `phenotype` replaces `group`. The existing `compute_batch_waic` does not know about `phenotype` — it will need the phenotype column propagated through from `sim_df`.

### 6.3 `export_peb_covariates` sketch

```python
def export_peb_covariates(
    fit_df_2level: pd.DataFrame,
    fit_df_3level: pd.DataFrame,
    output_path: Path,
) -> pd.DataFrame:
    """Export per-subject delta-WAIC and delta-F for PEB regression.
    Output CSV: participant_id, phenotype, delta_waic, delta_f
    delta_waic = elpd_waic(3level) - elpd_waic(2level)
    delta_f = F_3level - F_2level (free energy approx via WAIC)
    """
    merged = fit_df_2level.merge(
        fit_df_3level, on=["participant_id", "phenotype"], suffixes=("_2l", "_3l")
    )
    merged["delta_waic"] = merged["elpd_waic_3l"] - merged["elpd_waic_2l"]
    merged["delta_f"] = merged["delta_waic"]   # WAIC ≈ LOO ≈ -2*F; sign convention TBD
    out = merged[["participant_id", "phenotype", "delta_waic", "delta_f"]]
    out.to_csv(output_path, index=False)
    return out
```

### 6.4 Phenotype column propagation

**Current gap:** `sim_df` from `simulate_patrl_cohort` does NOT have a `phenotype` column (confirmed — the current simulator draws from `"healthy"` only and appends no phenotype label). The Phase 20 simulator extension must add `phenotype` to each row. Once in `sim_df`, it propagates through `_build_arrays_single_patrl` (which only reads `participant_id` — it will NOT auto-propagate phenotype; explicit join needed at BMS stage using a `participant_id → phenotype` mapping dict).

Recommended: add `phenotype` as a column in `sim_df` directly in the simulator loop. Then `fit_df` can carry it via groupby operations.

**Confidence:** HIGH for structure; LOW for delta_f sign convention (needs researcher to confirm whether Δ-evidence should be log-evidence ratio or WAIC difference).

---

## 7. Validation + Group Analysis Script Extensions

### 7.1 `scripts/05_run_validation.py` current CLI

```
--skip-waic          skip WAIC
--sim-path PATH
--fit-path-2level PATH
--fit-path-3level PATH
--idata-dir PATH
```

The `_parse_args()` function is at line 83. `main()` at line 480 calls `_run_recovery` for each model in `_MODEL_NAMES = ["hgf_2level", "hgf_3level"]`.

**Required extension — `--task` toggle:**

Add `--task {prl,patrl}` argparse argument (default `"prl"` preserves existing behavior). When `--task=patrl`:
- `_MODEL_NAMES` becomes `["hgf_2level_patrl", "hgf_3level_patrl"]`
- `sim_path` defaults to `results/patrl_smoke/sim_df.csv` (or a PAT-RL specific path)
- `fit_path_*` defaults change to PAT-RL fit output paths
- The recovery loop calls a PAT-RL-specific `build_recovery_df_patrl` (or extends existing with model dispatch)
- PRL-V1 gate logic: after `compute_recovery_metrics`, check `r >= 0.7` for `omega_2`, `kappa`, `beta`; label `omega_3`, `mu3_0` as exploratory

The recovery gate check is already present in principle — line 601-622 checks `passes_threshold` from `metrics_df`. A new `r_threshold` kwarg to `compute_recovery_metrics` (currently hardcoded at 0.7) would be needed if the PAT-RL gate differs; it doesn't (also 0.7), so this is straightforward.

### 7.2 `scripts/06_group_analysis.py` current CLI

```
--model {2level,3level}
--skip-plots
--draws N
```

`main()` at line 161 calls `build_estimates_wide`, `summarize_group_models`, `compute_effect_sizes_table`, `plot_raincloud`, `plot_interaction`, `build_phase_stratified_df`.

**Required extension — `--task` + `--analysis` toggles:**

Add:
- `--task {prl,patrl}` (default `"prl"`)
- `--analysis {group_interaction,phenotype_separability}` (default `"group_interaction"`)

When `--task=patrl --analysis=phenotype_separability`:
- Load PAT-RL fit results and `sim_df` with `phenotype` column
- Compute Cohen's d for `omega_2` (anxiety_hi vs anxiety_lo phenotypes) and `beta` (rew_hi vs rew_lo phenotypes)
- Compute `|cor(omega_2, beta)|` across 160 agents
- PRL-V2 gate check: `d >= 0.5` for both, `|cor| < 0.5`
- Save publication figure (`phenotype_separability.png`) + `phenotype_separability_summary.csv`

**Confidence:** HIGH for hook points; the Cohen's d and correlation are standard `scipy.stats` / `numpy.corrcoef` calls — no new library needed.

---

## 8. No-New-Scripts Verification

Files under `scripts/` that will be MODIFIED:

| Script | Change |
|--------|--------|
| `scripts/05_run_validation.py` | Add `--task` toggle, PAT-RL recovery loop, PRL-V1 gate reporting |
| `scripts/06_group_analysis.py` | Add `--task` + `--analysis` toggles, `phenotype_separability` analysis block |
| `scripts/12_smoke_patrl_foundation.py` | Update `_fit_blackjax` / `_fit_laplace` to accept `response_model` kwarg for Models B/C/D; update `simulate_patrl_cohort` call for multi-phenotype |

Files under `scripts/` that will NOT be created:
- No `13_run_patrl_group.py`, no `14_phenotype_bms.py`, etc. All new functionality is in existing scripts or library modules.

**One potential checkpoint:** PRL-V1 requires fitting 160 agents and computing recovery. If `scripts/05_run_validation.py` is the entry point, it needs to either (a) call `simulate_patrl_cohort` + `fit_batch_hierarchical_patrl` inline (very slow), or (b) accept paths to pre-computed fit CSVs (current pattern). The current script loads fit CSVs from disk — it does NOT re-simulate or re-fit. This means the 160-agent simulation + fit must be done first (via `scripts/12_smoke_patrl_foundation.py` extended with `--n-participants=40 --all-phenotypes`) and the recovery validation script consumes the outputs. This fits cleanly into the no-new-scripts invariant.

**Confidence:** HIGH — all needed hook points exist in current scripts.

---

## 9. Citation Replacement Plan (Roelofs 2020+)

### 9.1 Current old citation locations

| File | Lines | Old citation |
|------|-------|-------------|
| `configs/pat_rl.yaml` | 20 | "Behrens 2007 / Browning 2015 pattern" |
| `configs/pat_rl.yaml` | 67 | "Browning et al. 2015 (Nat Neurosci), Daw 2006, Schönberg 2007" |
| `configs/pat_rl.yaml` | 76 | "Browning 2015 / Daw 2006 / Schönberg 2007 grounded; tune in V2" |
| `docs/PAT_RL_API_HANDOFF.md` | line 70-71 | "omega_2 (-6.0 healthy vs -3.5 anxious, Browning 2015 direction); beta (2.0 low vs 8.0 high reward, Daw 2006)" |

No old citations were found in `src/prl_hgf/models/response_patrl.py` or `src/prl_hgf/fitting/hierarchical_patrl.py` — those files are already clean.

### 9.2 Replacement citations (Roelofs Nijmegen group 2020+)

**Confirmed papers (verified via web search, MEDIUM confidence — publication venues confirmed for most):**

**Klaassen et al. 2021, Scientific Reports:**
- Title: "Defensive freezing and its relation to approach-avoidance decision-making under threat"
- DOI / URL: https://www.nature.com/articles/s41598-021-90968-z
- BibTeX key: `klaassen2021freezing`
- Relevance: Anticipatory bradycardia + approach-avoidance decisions; reference for ΔHR covariate

```bibtex
@article{klaassen2021freezing,
  author    = {Klaassen, Felix H. and Bramson, Bob and Roelofs, Karin},
  title     = {Defensive freezing and its relation to approach--avoidance decision-making under threat},
  journal   = {Scientific Reports},
  year      = {2021},
  volume    = {11},
  pages     = {12030},
  doi       = {10.1038/s41598-021-90968-z}
}
```

**Klaassen et al. 2024, bioRxiv / Communications Biology:**
- Title: "The neurocomputational link between defensive cardiac states and approach-avoidance arbitration under threat"
- Published: *Communications Biology* 2024
- URL: https://www.nature.com/articles/s42003-024-06267-6
- BibTeX key: `klaassen2024neurocomputational`
- Relevance: HGF computational model of cardiac deceleration × approach-avoidance; direct methodological precedent for Model B/C/D

```bibtex
@article{klaassen2024neurocomputational,
  author    = {Klaassen, Felix H. and Roelofs, Karin},
  title     = {The neurocomputational link between defensive cardiac states and approach-avoidance arbitration under threat},
  journal   = {Communications Biology},
  year      = {2024},
  doi       = {10.1038/s42003-024-06267-6}
}
```

**Klaassen et al. 2024 (preprint), bioRxiv:**
- Title: "Defensive freezing sharpens threat-reward information processing during approach-avoidance decision making"
- URL: https://www.biorxiv.org/content/10.1101/2024.08.29.610250v1.full
- BibTeX key: `klaassen2024freezing_preprint`
- Relevance: Most recent HGF + freezing analysis; phenotype differentiation of high-anxiety agents

```bibtex
@article{klaassen2024freezing_preprint,
  author    = {Klaassen, Felix H. and Bramson, Bob and Schoffelen, Jan-Mathijs and de Voogd, Lycia D. and Roelofs, Karin},
  title     = {Defensive freezing sharpens threat-reward information processing during approach-avoidance decision making},
  journal   = {bioRxiv},
  year      = {2024},
  doi       = {10.1101/2024.08.29.610250}
}
```

**Klaassen et al. 2021 (Frontiers, Autonomic states):**
- Title: "Approach-Avoidance Decisions Under Threat: The Role of Autonomic Psychophysiological States"
- Published: *Frontiers in Neuroscience* 2021
- URL: https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2021.621517/full
- BibTeX key: `klaassen2021autonomic`
- Relevance: Bradycardia as autonomic correlate of approach-avoidance conflict; motivation for ΔHR covariate

```bibtex
@article{klaassen2021autonomic,
  author    = {Klaassen, Felix H. and others},
  title     = {Approach-Avoidance Decisions Under Threat: The Role of Autonomic Psychophysiological States},
  journal   = {Frontiers in Neuroscience},
  year      = {2021},
  doi       = {10.3389/fnins.2021.621517}
}
```

**Note on Roelofs 2017/2020 reviews, Terburg 2020+, Hulsman 2020+, Ly 2022+:** Web searches did not return specific matches for a "Ly 2022 reversal learning HGF" or "Hulsman 2020+" paper. These should be provided by the researcher if they exist — do not assume or fabricate.

### 9.3 Replacement plan

In `configs/pat_rl.yaml` lines 20, 67-68, 76: Replace Browning/Daw/Schönberg citations with:
- Hazard rates: cite Klaassen 2021 (Scientific Reports) as primary phenomenological reference
- Phenotype priors (omega_2 direction, beta direction): cite Klaassen 2024 (Communications Biology) for computational grounding; reference "consumer study specification" (not a public paper) for the exact numeric values

In `docs/PAT_RL_API_HANDOFF.md`: Update the citation on line 70-71 from "Browning 2015 / Daw 2006" to Klaassen 2024 (Communications Biology).

**Confidence:** MEDIUM — papers exist and are Roelofs-group, but full author lists and exact journal info for several (Terburg 2020+, Hulsman 2020+, Ly 2022+) are not confirmed from web search. Use what is confirmed; flag others for researcher to supply.

---

## 10. Test Fixture Map (Phase 18/19 regression + Phase 20 gaps)

### 10.1 Existing tests that will remain passing with additive extensions

| Test file | What it covers | Why safe under Phase 20 |
|-----------|---------------|------------------------|
| `tests/test_models_patrl.py` | Model A logp shape/semantics, 2-level/3-level topology | Model A gets `b=0.0` default — all existing tests unaffected |
| `tests/test_hierarchical_patrl.py` | `build_logp_fn_batched_patrl` shape, diff, loop reference; 5-agent smoke; `NotImplementedError` for B/C/D | Tests 7 (`NotImplementedError`) will need update to allow `"model_b"` etc; others unchanged |
| `tests/test_pat_rl_simulator.py` | Shape contract, seed determinism, `run_hgf_forward_patrl` | Will need update if return type of `run_hgf_forward_patrl` changes |
| `tests/test_fit_vb_laplace_patrl.py` | Laplace fit path for model_a | Will need update to allow `response_model` for B/C/D |
| `tests/test_bms.py` | `run_group_bms` shape and correctness | No changes to existing BMS functions; new `compute_stratified_bms` is additive |
| `tests/test_env_pat_rl_config.py` | Config loading, validation | Will break if new required fields are added to `PhenotypeParams` without defaults — must use `field(default=...)` or Optional |
| `tests/test_smoke_patrl_foundation.py` | `scripts/12_smoke_patrl_foundation.py` structure | Dry-run structural tests will pass; fit tests depend on blackjax (already skip) |

### 10.2 Tests that need updates under Phase 20

| Test file | Required change |
|-----------|----------------|
| `tests/test_hierarchical_patrl.py` test 7 | Update `NotImplementedError` match pattern to NOT raise for `model_b/c/d` |
| `tests/test_pat_rl_simulator.py` | Update `run_hgf_forward_patrl` return-type tests if signature changes |
| `tests/test_env_pat_rl_config.py` | Add tests for new `avoid` contingency, `b`, `dhr_mean`, `dhr_sd`, `epsilon2_coupling_coef` fields |

### 10.3 New tests needed for Phase 20

| Test file | Coverage |
|-----------|---------|
| `tests/test_models_patrl.py` new cases | `model_b_logp`, `model_c_logp` shape/diff; Model D omega_eff smoke |
| `tests/test_hierarchical_patrl.py` new cases | `build_logp_fn_batched_patrl` for model_b/c/d (shape + finite output); Model D lambda recovery smoke within 0.3 at 5 agents |
| `tests/test_bms.py` new cases | `compute_stratified_bms` shape contract; `export_peb_covariates` CSV output columns |
| `tests/test_pat_rl_simulator.py` new cases | Multi-phenotype `simulate_patrl_cohort` — 4 phenotypes x 5 agents = 20 rows check; `phenotype` column present; per-phenotype seed reproducibility |
| `tests/test_validation_integration.py` or new `test_patrl_recovery_gate.py` | PRL-V1 gate: r >= 0.7 for omega_2/kappa/beta at 160 agents (requires fitting — mark `@pytest.mark.slow`) |

**Confidence:** HIGH — all gaps are visible from reading the existing test suite.

---

## 11. Dependencies

### 11.1 BlackJAX in ds_env

**Known blocker (STATE.md line 165):** `blackjax not installed in ds_env`. This means the 5-agent CPU smoke for Models B/C/D via the NUTS path will skip locally (same as Phase 18 tests 5-6). The Laplace path (`fit_vb_laplace_patrl`) has zero blackjax dependency and works in ds_env. The SC2 requirement ("both fit through `fit_batch_hierarchical_patrl` and `fit_vb_laplace_patrl` on 5-agent CPU smoke") can be met by running the Laplace smoke locally and the NUTS smoke on the cluster.

### 11.2 New parameters in `fit_vb_laplace_patrl`

Models B and C add `gamma`, `b`, and optionally `alpha` as new scalar parameters. These enter `_build_patrl_log_posterior` as additional priors (Normal distributions). No new library needed — numpyro distributions already used. Model C's `alpha` modulates `beta` by `delta_hr` — this is a non-linear interaction that should be expressible in the existing JAX scan body without new dependencies.

Model D's trial-varying ω requires `jax.lax.scan` with an augmented xs tuple — no new library.

### 11.3 `scipy.stats` for Cohen's d + correlation

`scripts/06_group_analysis.py` already imports `bambi` and `arviz`. Cohen's d requires only `scipy.stats` (already in ds_env as a bambi/arviz transitive dep) or a simple numpy formula. No new package needed.

### 11.4 `groupBMC` for stratified BMS

`groupBMC` is already imported and used in `bms.py`. `compute_stratified_bms` calls `run_group_bms` internally — no new import.

**Confidence:** HIGH for all dependency conclusions. The blackjax local-skip pattern is already established in the codebase (per `pytest.importorskip`).

---

## 12. Risks / Unknowns / Checkpoint Candidates

### Risk 1: Avoid-contingency representation
**What might go wrong:** The "avoid 10/10/80" consumer spec may mean `avoid` has stochastic outcomes (reward 10%, shock 10%, nothing 80%). Currently `avoid` always yields nothing. If the logp must account for probabilistic avoid outcomes, the `expected_value` function and scan body need significant revision to handle a 4-outcome (approach-safe, approach-dangerous, avoid) structure. **Checkpoint candidate** — confirm with researcher whether avoid is truly probabilistic before implementing.

### Risk 2: ΔHR sign convention (bradycardia = negative)
**Known issue:** Anticipatory bradycardia is a *decrease* in HR. `ΔHR < 0` on dangerous trials. In Models B and C, `gamma * ΔHR` with gamma > 0 means more avoidance when more bradycardia — which may be the correct direction. But Model D's `ω_eff = ω + λ·ΔHR` with `ΔHR < 0` means lower effective volatility during freezing (ω is negative; ω_eff becomes more negative). The sign convention must be explicit in docstrings and confirmed with the researcher before committing. **Do not assume γ > 0.**

### Risk 3: Phenotype ID column name consistency
**What might go wrong:** The `phenotype` column added in the simulator must be consistently named everywhere: simulator output → `sim_df` → `_build_arrays_single_patrl` (pass-through, not consumed) → `fit_df` (joined later) → `compute_stratified_bms`. Any column name mismatch (`"phenotype"` vs `"phenotype_label"` vs `"group"`) will cause silent failures. Establish `"phenotype"` as the canonical column name in a constant at the module level of `pat_rl_config.py`.

### Risk 4: ArviZ coords for Models B/C/D (extra parameter dims)
**What might go wrong:** Models B and C add `b`, `gamma` (and `alpha` for C) as per-participant parameters. `build_idata_from_laplace` expects `_PARAM_ORDER_2LEVEL = ("omega_2", "log_beta")` or `_PARAM_ORDER_3LEVEL`. These constants are defined in `fitting/laplace_idata.py`. New model variants will need new param-order tuples and will need to be passed correctly through `build_idata_from_laplace`. The ArviZ `coords` dict must list all parameter names. **No blocking issue** — additive extension — but easy to miss.

### Risk 5: 160-agent cohort compute budget for PRL-V1
**What might go wrong:** The formal PRL-V1 gate requires recovery metrics at 160 agents via full fitting. On CPU without blackjax this is infeasible locally. The plan must route PRL-V1 computation through the cluster (SLURM). The validation script extension must work both locally (dry-run with pre-computed CSVs) and on the cluster (simulate + fit inline). The `--task=patrl` toggle in `scripts/05` must accept pre-computed fit CSVs as inputs, not force re-simulation — the current script design does this correctly.

### Risk 6: `run_stratified_bms` vs `compute_stratified_bms` naming
**Duplication concern:** `run_stratified_bms` (existing, stratifies by `"group"`) and `compute_stratified_bms` (new, stratifies by `"phenotype"`) do nearly the same thing. Consider whether the planner should unify them into a single function with a `group_col` kwarg rather than adding a parallel function. This is a design preference — either is valid, but the SC6 spec explicitly names `compute_stratified_bms` as the new entry point.

### Risk 7: Consumer spec numeric values not accessible
**LOW confidence item:** The exact target values for phenotype priors (`b_mean`, `b_sd`, `dhr_mean`, `dhr_sd`, `epsilon2_coupling_coef` per phenotype) must come from the researcher / consumer study spec, which is not accessible in this repo. The YAML structure changes are clear; the exact numbers are not. Plans should include a placeholder comment and note that the researcher must supply these before the plan is executable.

---

## Summary: Recommended Plan Breakdown

Phase 20 has 8 requirements (PRL-02.1 through PRL-08) and 11 success criteria. Recommended wave structure:

### Wave 1 — Config correctness + Model A+b (2 plans)
**Plan 20-01:** `configs/pat_rl.yaml` delta — contingencies, run order, magnitudes, phenotype priors (researcher fills in numeric values). Loader changes in `pat_rl_config.py` — add `avoid: OutcomeProbs`, `b`/`dhr_mean`/`dhr_sd`/`epsilon2_coupling_coef` to `PhenotypeParams`, update `FittingPriorConfig`. Smoke: `load_pat_rl_config()` passes all tests.
**Plan 20-02:** Response bias `b` added to Model A (default 0.0, backwards compatible). Models B and C implemented in `response_patrl.py`. Dispatcher in `_make_single_logp_fn` for `response_model` kwarg. Prior extension in `_build_patrl_log_posterior`. NotImplementedError guard removed for `model_b`, `model_c`. 5-agent Laplace smoke for B and C.

### Wave 2 — Model D + ε₂-coupled ΔHR + cohort scale (3 plans)
**Plan 20-03:** Model D — trial-varying ω via `_clamped_step_model_d`; `delta_hr_arr` added to `build_logp_fn_batched_patrl` signature; λ recovery smoke within 0.3 at 5 agents.
**Plan 20-04:** ε₂-coupled ΔHR generative model — extend `run_hgf_forward_patrl` to optionally return `epsilon2`; update `simulate_patrl_cohort` to compute ΔHR from phenotype distribution + ε₂ coupling; `phenotype` column added to `sim_df`.
**Plan 20-05:** Cohort scale — `n_participants_per_phenotype: 40`; multi-phenotype simulator loop; per-phenotype SeedSequence spawn; SLURM smoke at 40 agents all phenotypes.

### Wave 3 — BMS, PEB export, validation gates, citations (3 plans)
**Plan 20-06:** Stratified BMS + PEB export — `compute_stratified_bms` and `export_peb_covariates` in `analysis/bms.py`; tests for new functions.
**Plan 20-07:** `scripts/05_run_validation.py` extension — `--task=patrl` toggle, PRL-V1 gate (r ≥ 0.7) with exploratory labels on ω₃, μ₃⁰. `scripts/06_group_analysis.py` extension — `--task=patrl --analysis=phenotype_separability`, Cohen's d ≥ 0.5 and |cor| < 0.5 gates, publication figure.
**Plan 20-08:** Citation replacement — `configs/pat_rl.yaml` and `docs/PAT_RL_API_HANDOFF.md` updated to replace Browning 2015 / Daw 2006 / Schönberg 2007 with Klaassen 2021, Klaassen 2024, Roelofs-group refs. YAML comment block revised. No code changes.

**Total: 8 plans across 3 waves.** Wave 3 plans 20-06 and 20-07 can be parallelised (separate files, no coupling).

---

## Sources

### Primary (HIGH confidence)
- Direct codebase reads: `configs/pat_rl.yaml`, `src/prl_hgf/models/response_patrl.py`, `src/prl_hgf/env/pat_rl_config.py`, `src/prl_hgf/env/pat_rl_simulator.py`, `src/prl_hgf/fitting/hierarchical_patrl.py`, `src/prl_hgf/fitting/fit_vb_laplace_patrl.py`, `src/prl_hgf/analysis/bms.py`, `scripts/05_run_validation.py`, `scripts/06_group_analysis.py`, `scripts/12_smoke_patrl_foundation.py`
- Direct test reads: `tests/test_models_patrl.py`, `tests/test_hierarchical_patrl.py`, `tests/test_pat_rl_simulator.py`, `tests/test_bms.py`
- `.planning/STATE.md` — blocker record (blackjax not in ds_env)
- `docs/PAT_RL_API_HANDOFF.md` — API surface and known gaps

### Secondary (MEDIUM confidence)
- Klaassen et al. 2021, *Scientific Reports*: https://www.nature.com/articles/s41598-021-90968-z
- Klaassen et al. 2024, *Communications Biology*: https://www.nature.com/articles/s42003-024-06267-6
- Klaassen et al. 2024, bioRxiv preprint: https://www.biorxiv.org/content/10.1101/2024.08.29.610250v1.full
- Klaassen et al. 2021, *Frontiers in Neuroscience*: https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2021.621517/full

### Tertiary (LOW confidence)
- Terburg 2020+, Hulsman 2020+, Ly 2022+, Roelofs 2017/2020 reviews — referenced in roadmap SC10 but not independently verified in web search; researcher must supply BibTeX

---

## Metadata

**Confidence breakdown:**
- Config delta structure: HIGH (code read direct)
- Config target numerics: LOW (consumer spec not accessible; researcher must supply)
- Response model extension: HIGH (existing code pattern is clear, extension is mechanical)
- Model D scan body: HIGH (mirrors Phase 18-04 kappa-via-attrs exactly)
- ε₂ coupling: HIGH (epsilon2 already computed in forward pass)
- Cohort scale / RNG: HIGH
- BMS/PEB structure: HIGH; sign convention: LOW
- Script extensions: HIGH
- Citations (confirmed papers): MEDIUM
- Citations (Terburg/Hulsman/Ly): LOW

**Research date:** 2026-04-18
**Valid until:** 2026-05-18 (30-day window; pyhgf API changes could affect Model D inject pattern)
