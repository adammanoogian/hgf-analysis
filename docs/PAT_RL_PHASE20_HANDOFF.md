# PAT-RL Phase 20 Handoff for `dcm_hgf_mixed_models` (sister-repo consumer)

**Source repo:** `hgf-analysis` (import: `prl_hgf`)
**Consumer repo:** `dcm_hgf_mixed_models` (siblings via `pip install -e ../hgf-analysis`)
**Phase 20 status:** 8/8 plans complete, verified with 1 gap closed inline (2026-04-19)
**Supersedes for Phase 20+:** augments (does NOT replace) `docs/PAT_RL_API_HANDOFF.md` — the older handoff still describes the stable Phase 18/19 baseline; this doc describes what changed and what's newly available

---

## Dependency upgrade — v1.0 (Phase 27)

As of 2026-05-06, `hgf-analysis` ships an opt-in upgraded dependency chain
(`BlackJAX 1.5`, `NumPyro 0.21`, `Python 3.11`, `JAX >=0.9,<0.10`). The
legacy `ds_env` (BlackJAX 1.2.x, Python 3.10, JAX 0.4.x) remains the SLURM
default for backward compatibility; the new chain is opt-in via:

```bash
sbatch --export=ALL,CONDA_ENV=ds_env_v10 cluster/<script>.slurm
```

**Sister-repo migration recipe** (mirror the new chain in your own env):

```bash
mamba env create -f environment-v10.yml -n <your_env_name>
conda run -n <your_env_name> pip install --no-deps pyhgf==0.2.8
conda run -n <your_env_name> python scripts/ci/patch_pyhgf_typing.py
conda run -n <your_env_name> pip install -U "jax[cuda12]>=0.9,<0.10"      # GPU only
conda run -n <your_env_name> pip install -r cluster/requirements-gpu.txt   # GPU only
conda run -n <your_env_name> pip install -e ../hgf-analysis --no-deps
```

The `--no-deps` on both `pyhgf` and the editable install bypasses pyhgf
0.2.x's stale `jax<0.4.32` metadata constraint (declared, not enforced at
runtime). See `.planning/phases/27-dependency-upgrade-chain/DEPS-02-decision.md`
for the empirical compatibility matrix.

The pyhgf `typing.py` patch is required for JAX 0.5+ — it fixes a removed-
symbol import (`jaxlib.xla_extension.PjitFunction`).

DEPS-05 evidence (BlackJAX 1.5 dense/low-rank mass matrix at P=30) lives
at `.planning/phases/27-dependency-upgrade-chain/DEPS-05-evidence.json`
and as a row in `docs/CAPABILITY_MAP.md` once the run completes.

**Known caveats for `ds_env_v10`** (post-Phase-27 follow-ups):

- GPU loading is fragile on M3 nodes with CUDA 13.0 driver — JAX falls
  back to CPU due to a `cuSPARSE 12.5` / driver-13 binary mismatch. Some
  GPU nodes (e.g. `m3g108`) work; others (e.g. `m3g112`) fall back.
- The diagnostic flag `jax_explain_cache_misses` triggers an upstream
  JAX 0.9.2 unpack bug at `jax/_src/interpreters/partial_eval.py:2364`
  when used with a scan body that contains a nested JIT'd function
  (such as pyhgf's `scan_fn`). Now gated behind
  `PRL_EXPLAIN_CACHE_MISSES=1` in `scripts/03_pre_analysis/03_run_power_iteration.py`.

---

## 1. TL;DR — what you can build with now

| Capability | Was (pre-Phase-20) | Is now (post-Phase-20) |
|------------|---------------------|-----------------------|
| Response models | Model A only (β, stickiness) | **Models A+b, B, C, D** (`b`, `γ`, `α`, `λ`) all fit through both NUTS + Laplace |
| ΔHR generation | State-conditioned stub | **Phenotype-specific ε₂-coupled**: `ΔHR(t) ~ N(dhr_mean, dhr_sd) + coef·ε₂(t)` |
| Cohort scale | 8 agents, healthy only | **40 agents × 4 phenotypes = 160**, deterministic per-phenotype SeedSequence |
| Trial-varying volatility | N/A | **Model D**: `ω_eff(t) = ω + λ·ΔHR(t)` injected into scan body (5/5 λ-recovery PASS at 5 agents) |
| Model comparison | `run_stratified_bms` (group-keyed) | + **`compute_stratified_bms`** (phenotype-keyed) + **`export_peb_covariates`** |
| Config surface | phenotypes w/o b/ΔHR fields | Phenotype priors include **`b`, `dhr_mean`, `dhr_sd`, `epsilon2_coupling_coef`**; **avoid contingency** block loaded |
| Validation | pick_best_cue only | **`scripts/05 --task=patrl`** (PRL-V1) + **`scripts/06 --task=patrl --analysis=phenotype_separability`** (PRL-V2, Option A 2×2 factorial) |
| Numeric gates at 160 agents | none | **2-level PRL-V1/V2: PASS** (ω₂ r=0.935, β r=0.831, d(ω₂)=1.63, d(β)=2.34, \|cor\|=0.005); **3-level PRL-V1: FAIL** on Laplace — needs NUTS, deferred to Phase 14-15 |

**What to use NOW:** everything 2-level. The 2-level Laplace path is validated, fast (~47s for 160 agents CPU), and gate-clean.

**What to WAIT for:** 3-level fits at 160 agents. Laplace fits are pathological at cohort scale (β → exp overflow, κ MAP stuck at prior mean). NUTS is needed; GPU feasibility is gated on Phase 14-15 benchmark results.

---

## 2. Import paths (new Phase 20 surface)

```python
# Config surface — phenotype priors now include b / dhr_* / epsilon2_coupling_coef
from prl_hgf.env.pat_rl_config import (
    load_pat_rl_config,
    PATRLConfig,
    PhenotypeParams,           # now has b, dhr_mean, dhr_sd, epsilon2_coupling_coef
    ContingencyConfig,         # now has .avoid: OutcomeProbs
    FittingPriorConfig,        # now has b, gamma, alpha, lam priors
    PHENOTYPE_COLUMN_NAME,     # canonical "phenotype" string constant
)

# Simulator — multi-phenotype, ε₂-coupled ΔHR, Model D support
from prl_hgf.env.pat_rl_simulator import (
    simulate_patrl_cohort,     # extended kwargs: phenotypes, response_model, lam_true
    run_hgf_forward_patrl,     # extended: return_epsilon2=True gives (mu2, epsilon2)
)

# Response models — all four variants
from prl_hgf.models.response_patrl import (
    model_a_logp,              # now takes b kwarg (default 0.0)
    model_b_logp,              # NEW: σ(β·EV + b + γ·ΔHR)
    model_c_logp,              # NEW: σ((β + α·ΔHR)·EV + b + γ·ΔHR)
    # Model D lives in the scan body, not a standalone logp — see fitting path
)

# Fitting — dispatch all four models through both paths
from prl_hgf.fitting.hierarchical_patrl import (
    fit_batch_hierarchical_patrl,   # BlackJAX NUTS, cluster-only (blackjax not in ds_env)
    build_logp_fn_batched_patrl,    # factory; accepts response_model="model_{a,b,c,d}"
)
from prl_hgf.fitting.fit_vb_laplace_patrl import (
    fit_vb_laplace_patrl,      # VB-Laplace (jaxopt.LBFGS + jax.hessian); all four models
)
from prl_hgf.fitting.laplace_idata import (
    build_idata_from_laplace,  # batched idata factory (all Laplace output)
    # _PARAM_ORDER_* tuples now exist for A/B/C/D × 2/3-level
)

# BMS + PEB — phenotype-stratified model comparison
from prl_hgf.analysis.bms import (
    compute_batch_waic_patrl,      # NEW: fit_df with phenotype column propagated
    compute_subject_waic_patrl,    # NEW: per-subject WAIC with Laplace fast-path
    compute_stratified_bms,        # NEW: phenotype-keyed random-effects BMS
    export_peb_covariates,         # NEW: CSV with participant_id/phenotype/delta_waic/delta_f
    # run_stratified_bms           # EXISTING, unchanged (group-keyed, pick_best_cue)
    # run_group_bms                # EXISTING, unchanged (Rigoux 2014)
)
```

---

## 3. Phenotype grid (authoritative — matches sister-repo `GSD_heart2adapt_sim.yaml`)

4-cell 2×2 factorial (anxiety × reward sensitivity), 40 agents per cell = **160 total**.

| Phenotype key | ω₂ | β | b | ϑ (theta) | μ₃⁰ | dhr_mean | dhr_sd | ε₂_coupling_coef |
|---------------|-----|---|---|-----------|-----|----------|--------|-----------------|
| `healthy` | −3.0 | 2.0 | 0.0 | 0.005 | 1.0 | −2.0 | 0.5 | 0.3 |
| `reward_susceptible` | −3.0 | 3.5 | +0.3 | 0.005 | 1.0 | −2.0 | 0.5 | 0.3 |
| `high_anxiety` | −2.0 | 2.0 | −0.3 | 0.01 | 2.0 | −0.5 | 0.8 | 0.3 |
| `anxious_reward` | −2.0 | 3.5 | 0.0 | 0.01 | 2.0 | −0.5 | 0.8 | 0.3 |

`b.sd` (0.5), `epsilon2_coupling_coef` (0.3) are placeholders pending consumer-spec confirmation — marked as `TODO:consumer-spec` in `configs/pat_rl.yaml`. `dhr_mean/dhr_sd` for `reward_susceptible`/`anxious_reward` are inherited from their baseline phenotype (H2A.1.4 spec only names healthy and high_anxiety).

**Naming invariant:** these four keys are the single source of truth across the codebase (`_REQUIRED_PHENOTYPE_KEYS` in `pat_rl_config.py`). Earlier drafts used `anxious`/`reward_sensitive`/`anxious_reward_sensitive`; those have been retired (commit `96b40b1`, 2026-04-19). Always use the names above.

---

## 4. Contingencies + run order (consumer-spec exact — SC1)

```yaml
task:
  contingencies:
    safe:       {reward: 0.70, shock: 0.10, nothing: 0.20}  # approach
    dangerous:  {reward: 0.10, shock: 0.70, nothing: 0.20}  # approach
    avoid:      {reward: 0.10, shock: 0.10, nothing: 0.80}  # NEW: stochastic avoid outcomes
  run_order: ["stable", "volatile", "volatile", "stable"]    # SVVS counterbalance
  magnitudes:
    reward_levels: [1, 3]
    shock_levels: [1, 3]
  hazards: {stable: 0.03, volatile: 0.10}
  n_trials_per_run: 48
  n_runs: 4   # → 192 trials total
```

**Stochastic avoid note:** The config loader parses `avoid` contingencies, but as of Phase 20 close the simulator and logp do NOT sample from them — choosing "avoid" yields zero value in the EV computation (the participant's reward of avoiding is not observed). If your pipeline needs stochastic avoid outcomes, wire them in the `simulate_patrl_cohort` choice loop or extend the `expected_value` helper. Flagged as future work in Plan 20-05 SUMMARY.

---

## 5. Minimal end-to-end usage (post-Phase-20, Laplace-only path)

```python
from pathlib import Path

from prl_hgf.env.pat_rl_config import load_pat_rl_config
from prl_hgf.env.pat_rl_simulator import simulate_patrl_cohort
from prl_hgf.fitting.fit_vb_laplace_patrl import fit_vb_laplace_patrl
from prl_hgf.analysis.bms import (
    compute_batch_waic_patrl,
    compute_stratified_bms,
    export_peb_covariates,
)

# 1. Load config (or point at dcm_hgf_mixed_models's own YAML)
config = load_pat_rl_config()

# 2. Simulate 160-agent cohort (seed=42 → deterministic)
sim_df, true_params, trials_by_pid = simulate_patrl_cohort(
    n_participants=40,            # per phenotype
    master_seed=42,
    config=config,
    phenotypes=None,              # all 4; pass list[str] to subset
    # NEW Phase 20 kwargs (bridge for Model D generative side):
    # response_model="model_a",   # also "model_b", "model_c", "model_d"
    # lam_true=0.1,               # only used if response_model="model_d"
)
# sim_df has columns: participant_id, trial, state, mag_R, mag_S, choice,
#                     delta_hr, phenotype, run_idx, condition (stable/volatile)

# 3. Fit via VB-Laplace (dispatches model A/b/c/d)
idata_2level = fit_vb_laplace_patrl(
    sim_df=sim_df,
    model_name="hgf_2level_patrl",
    response_model="model_a",     # "model_b" / "model_c" / "model_d" also work
    config=config,
)
# Returns az.InferenceData with dims (chain=1, draw=1000, participant_id=160).
# At 160 agents level-2 Laplace: ~47s on CPU, clean recovery.

# idata_3level = fit_vb_laplace_patrl(sim_df, "hgf_3level_patrl", ...)
# WARNING: 3-level Laplace at 160 agents is numerically unstable —
# ~10% of β → inf, κ MAP stuck at constant. Use NUTS at this scale
# (blocked on Phase 14-15 GPU feasibility).

# 4. Phenotype-propagating WAIC bridge (Phase 20 SC6)
#    Produces fit_df: [participant_id, phenotype, model, elpd_waic, ...]
fit_df_2 = compute_batch_waic_patrl(
    {pid: idata_2level.sel(participant_id=pid) for pid in sim_df.participant_id.unique()},
    sim_df=sim_df,
    model_name="hgf_2level_patrl",
)

# 5. Phenotype-stratified random-effects BMS (Rigoux 2014)
#    Returns {"all": {...}, "healthy": {...}, "high_anxiety": {...}, ...}
#    Each value has posterior model probs + exceedance probs.
# bms_result = compute_stratified_bms(
#     pd.concat([fit_df_2, fit_df_3]),
#     model_names=["hgf_2level_patrl", "hgf_3level_patrl"],
#     phenotype_col="phenotype",
# )
# PENDING: requires 3-level fit_df; wait for NUTS post-Phase-14-15.

# 6. Export PEB covariates (once 3-level available)
# export_peb_covariates(
#     fit_df_2level=fit_df_2,
#     fit_df_3level=fit_df_3,
#     output_path=Path("results/peb_covariates.csv"),
# )
# → CSV with columns: participant_id, phenotype, delta_waic, delta_f
```

**Model D trial-varying ω** has no separate logp; it's a scan-body pattern inside `build_logp_fn_batched_patrl`. To fit Model D, pass `response_model="model_d"` to either fit function and supply a `delta_hr_arr`. Model D's λ appears as a standalone parameter in the posterior.

---

## 6. Trajectory export (unchanged since Phase 18-05; still current)

`prl_hgf.analysis.export_trajectories.export_subject_trajectories` emits the per-subject CSVs that `dcm_pytorch`'s bilinear DCM consumes as modulatory inputs. Columns (authoritative):

```
trial, state, mu2, sigma2, epsilon2, mu3, sigma3, epsilon3,
delta1, psi2, delta_hr, mag_R, mag_S, choice, reward, shock,
outcome_time_s, run_idx, condition
```

Per-subject parameter summary via `export_subject_parameters` emits `parameter_summary.csv` with `participant_id, parameter, posterior_mean, hdi_low, hdi_high` — this is the same schema the Phase 20 numeric-gate runner consumed directly from cluster outputs, so downstream analyses can skip `.nc` round-trips where posterior means are sufficient.

---

## 7. What was numerically validated (and what wasn't)

**Cluster run 2026-04-19 — jobs 54901120 (level-2) + 54901121 (level-3), Laplace, 160 agents.**
Full write-up: `.planning/phases/20-patrl-scientific-completion/20-STEP3-RESULTS.md`.

### Validated (✓ use these)

| Capability | Evidence |
|------------|----------|
| 2-level PRL-V1 recovery | ω₂ r=+0.935, β r=+0.831 at 160 agents |
| PRL-V2 factorial separability | d(ω₂\|anxiety)=+1.629, d(β\|reward)=+2.335, \|cor(ω₂,β)\|=0.005 |
| PRL-V2 pairwise | d(ω₂\|high_anxiety vs healthy)=+1.701, d(β\|reward_susceptible vs healthy)=+2.210 |
| Cohort determinism | `simulate_patrl_cohort(master_seed=42, phenotypes=['healthy'])` twice produces identical `sim_df['choice']`; subset vs full call produces identical healthy rows |
| Model D λ-recovery | 5/5 agents within \|err\|<0.14 of truth at 5-agent smoke (cluster run would confirm at scale but deferred) |

### Not validated at cohort scale (⚠ wait or use NUTS)

| Capability | Status |
|------------|--------|
| 3-level Laplace PRL-V1 | FAIL: ω₂ r=-0.011, β r=-0.076, κ NaN (constant MAP) |
| 2-level vs 3-level BMS | blocked on reliable 3-level fits → NUTS |
| PEB Δ-evidence export | same — needs 3-level fits to differ from 2-level meaningfully |
| Model B/C/D at 160 agents | smoke-validated (5 agents Laplace); cohort-scale unverified; NUTS smoke deferred to cluster |

### Fit-method decision tree for consumer

```
For point estimates / iteration / fast debug:
    → VB-Laplace at 2-level:  PROD-READY
    → VB-Laplace at 3-level:  DO NOT USE at N > ~5 agents

For HDI / model comparison / PEB / uncertainty-sensitive downstream:
    → BlackJAX NUTS (cluster)
    → Feasibility gated on Phase 14-15 GPU benchmark outcome
    → Plan 14.1-03 runs the GPU benchmark; Phase 21 diagnoses the 1.1x
      cold/warm JIT speedup observed in job 54899271
```

---

## 8. Integration checklist for `dcm_hgf_mixed_models`

Based on your sister-repo `docs/files/GSD_heart2adapt_sim.yaml` phase_1 tasks:

### Phase 1 HGF simulation (H2A.1.1 — H2A.1.6)

- [x] **H2A.1.1 task environment** → `prl_hgf.env.pat_rl_simulator.simulate_patrl_cohort` (contingencies, SVVS, magnitudes [1,3], hazards already in `configs/pat_rl.yaml`)
- [x] **H2A.1.2 phenotype 2×2** → `PhenotypeParams` with all 8 fields; sister-repo naming canonicalized
- [x] **H2A.1.3 pre-scan baseline** → reuse `simulate_patrl_cohort` with `n_participants=40, phenotypes=['healthy']` etc. to build pre-scan priors (consumer code; not in this repo)
- [x] **H2A.1.4 scanner session** → full 192-trial PAT-RL via `simulate_patrl_cohort`; ε₂-coupled ΔHR per H2A.1.4 spec
- [x] **H2A.1.5 fit HGF** → `fit_vb_laplace_patrl` for 2-level is PROD-READY at 160 agents; 3-level needs NUTS
- [x] **H2A.1.6 test Models A-D** → all four response models available; Model D (trial-varying ω) validated via λ-recovery smoke

### Phase 2 DCM bridge (H2A.2.x) — no Phase 20 additions but relevant context

- Trajectory export (`export_subject_trajectories`) from Phase 18-05 already ships the DCM-modulator column schema. Phase 20 did NOT change this contract.
- `ε₂(t)`, `ε₃(t)`, `ΔHR(t)` from trajectory CSVs feed directly into `pyro_dcm`'s bilinear DCM as modulatory inputs — no change from pre-Phase-20 usage.
- `ε₂` column now reflects the *phenotype-specific ε₂-coupled ΔHR generative model* (SC4) — consumer should note that the same trajectory CSV columns now have phenotype-dependent distributional properties.

### Phase 3 design optimization (H2A.3.1)

- Cohort-scale sweeps over `n_participants_per_phenotype` ∈ {10, 20, 30, 40} can reuse `simulate_patrl_cohort(n_participants=N, ...)`. Determinism guarantees per-phenotype RNG independence across N values.

---

## 9. Gotchas + known issues for consumer

1. **blackjax not installed in `ds_env`** (Decision-documented in this repo's STATE.md). Any cluster-side NUTS smoke requires `pip install blackjax>=1.2.4`. Laplace path has zero blackjax dependency.

2. **3-level Laplace is unstable at cohort scale.** Do not treat Laplace 3-level posterior means as truth for BMS/PEB at N ≥ ~20. Specifically:
   - log_beta → exp(log_beta) overflows for ~10% of participants at 160 agents (values like 10⁴⁴, 10¹⁵⁹)
   - κ MAP stuck at prior mean (all equal → Pearson r NaN)
   - ω₂ posterior means uncorrelated with truth (r ≈ -0.01 at 160)

3. **Laplace β width ~180% of NUTS β width** (Phase 19 closure memo). Safe for point estimates and separability d; **unsafe for HDI-dependent inference**.

4. **YAML phenotype keys were renamed 2026-04-19.** If you have prior consumer-side code referring to `anxious`, `reward_sensitive`, `anxious_reward_sensitive`, update to `high_anxiety`, `reward_susceptible`, `anxious_reward`.

5. **Avoid contingency loaded but not sampled.** `ContingencyConfig.avoid` is parsed and exposed, but the simulator's choice loop and the logp's `expected_value` treat avoid as zero-EV (no observed outcome). Extend if your analyses require sampling the H2A.1.1 "avoid 10/10/80" outcomes.

6. **Phase 20 is config-driven only.** Every behavioural variant (model choice, phenotype, ε₂ coupling magnitude, cohort size) is reachable via `configs/pat_rl.yaml`. No hardcoded magic numbers; if you need a new axis, add a YAML key and parse in `pat_rl_config.py`.

7. **Project-agnostic naming.** This repo has no study codename — commits and code refer to "PAT-RL task", "consumer study", "downstream sister-repo" generically. Preserve this convention in any PRs from consumer back to this repo.

---

## 10. References + pointers

**Primary Phase 20 artifacts (this repo):**

- `configs/pat_rl.yaml` — authoritative config
- `docs/references.bib` — Klaassen 2021/2024 Roelofs-group BibTeX (Phase 20 citation replacement)
- `.planning/phases/20-patrl-scientific-completion/20-STEP3-RESULTS.md` — numeric gate results
- `.planning/phases/20-patrl-scientific-completion/20-VERIFICATION.md` — verifier pass/gap record

**Tests consumer can mine for call-site examples:**

- `tests/test_pat_rl_simulator.py` — multi-phenotype simulate examples + determinism asserts
- `tests/test_fit_vb_laplace_patrl.py` — Laplace fit examples for Models A/B/C/D
- `tests/test_bms.py` — `compute_batch_waic_patrl` + `compute_stratified_bms` examples
- `tests/test_validation_gates_patrl.py` — SC9/SC11 audits + axis mask constants (Option A factorial)

**Baseline handoff (Phase 18/19):** `docs/PAT_RL_API_HANDOFF.md` — unchanged contracts for trajectory export, per-subject parameter summary, InferenceData shape.

**Upstream Phase 14-15 gating (when NUTS path needed):**

- `.planning/phases/14-integration-gpu-benchmark-and-decision/` — benchmark decision gate
- `.planning/phases/21-benchmark-bottleneck-diagnosis/` — diagnoses the 1.1x cold/warm JIT speedup before committing to NUTS at production shape

---

**Last updated:** 2026-04-19 (Phase 20 close)
**Commit hash at writeup:** check `git log -1` — this doc is generated at phase close; any drift from here means a follow-up phase has landed.
