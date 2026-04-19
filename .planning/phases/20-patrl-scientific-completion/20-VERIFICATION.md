---
phase: 20-patrl-scientific-completion
verified: 2026-04-18T00:00:00Z
status: gaps_found
score: 10/11 success criteria verified (SC8 runtime phenotype-name mismatch)
gaps:
  - truth: "PRL-V2 phenotype separability gate produces correct group comparisons at runtime"
    status: failed
    reason: >
      YAML phenotype keys (healthy, anxious, reward_sensitive, anxious_reward_sensitive)
      do NOT match axis mask constants in scripts/06_group_analysis.py. ANXIETY_HIGH
      uses {high_anxiety, anxious_reward}; YAML uses {anxious, anxious_reward_sensitive}.
      ANXIETY_LOW and REWARD_HIGH use reward_susceptible; YAML uses reward_sensitive.
      At cluster runtime sim_df.phenotype has YAML keys. isin() returns empty intersection
      for three of four phenotypes. d_omega2_factorial and d_beta_factorial are NaN.
      Gate silently fails.
    artifacts:
      - path: "scripts/06_group_analysis.py"
        issue: "Lines 252-255: axis masks use high_anxiety, anxious_reward, reward_susceptible but YAML has anxious, anxious_reward_sensitive, reward_sensitive"
      - path: "configs/pat_rl.yaml"
        issue: "Actual phenotype keys: healthy, anxious, reward_sensitive, anxious_reward_sensitive"
      - path: "src/prl_hgf/env/pat_rl_config.py"
        issue: "_REQUIRED_PHENOTYPE_KEYS = {healthy, anxious, reward_sensitive, anxious_reward_sensitive}"
      - path: "tests/test_validation_gates_patrl.py"
        issue: "test_option_a_factorial_axis_masks_are_correct validates constants match SC8-spec names but not YAML keys"
    missing:
      - "Align YAML phenotype keys with axis mask constants OR add alias map in _run_phenotype_separability before _compute_prl_v2_metrics"
      - "Fix three mismatches: anxious->high_anxiety, reward_sensitive->reward_susceptible, anxious_reward_sensitive->anxious_reward"
      - "Update _REQUIRED_PHENOTYPE_KEYS in pat_rl_config.py if YAML keys renamed"
      - "Add test assertion that axis mask names are subset of actual YAML phenotype keys"
human_verification:
  - test: "sbatch cluster/patrl_smoke.slurm then scripts/05_run_validation.py --task=patrl --fit-method=laplace"
    expected: "PRL-V1 PASS: r >= 0.7 for omega_2, kappa, beta on both hgf_2level_patrl and hgf_3level_patrl"
    why_human: "Numeric recovery r requires actual Laplace fitting of 160-agent cohort on cluster"
  - test: "After SC8 fix: scripts/06_group_analysis.py --task=patrl --analysis=phenotype_separability"
    expected: "d(omega_2)>=0.5, d(beta)>=0.5, |cor(omega_2,beta)|<0.5; summary CSV with contrast_type column"
    why_human: "Requires phenotype name fix AND 160-agent cluster posterior means"
---

# Phase 20: PAT-RL Scientific Completion Verification Report

**Phase Goal:** Close every remaining gap between prl_hgf PAT-RL surface and the downstream consumer study spec: (a) correct configs/pat_rl.yaml; (b) Models A+b/B/C/D; (c) epsilon2-coupled delta-HR simulator; (d) cohort 40x4=160; (e) stratified BMS + PEB export; (f) formal PRL-V1/V2 gates.

**Verified:** 2026-04-18
**Status:** GAPS FOUND
**Re-verification:** No (initial verification)

---

## Goal Achievement

**Score: 10/11 truths verified**

### SC1 -- Config Correctness: VERIFIED

Evidence:
- pat_rl.yaml:37-54: safe reward=0.70/shock=0.10/nothing=0.20; dangerous reward=0.10/shock=0.70/nothing=0.20; avoid reward=0.10/shock=0.10/nothing=0.80
- pat_rl.yaml:25: run_order = [stable, volatile, volatile, stable] (SVVS)
- pat_rl.yaml:53-54: reward_levels [1, 3] and shock_levels [1, 3]
- pat_rl.yaml:91-135: four phenotypes (healthy, anxious, reward_sensitive, anxious_reward_sensitive) each with omega_2, beta, kappa, mu3_0, theta, b, dhr_mean, dhr_sd, epsilon2_coupling_coef
- tests/test_env_pat_rl_config.py: test_run_order_svvs (341), test_magnitudes_1_3 (355), test_phenotype_has_new_fields (373), test_phenotype_b_means_match_sc1 (405), test_fitting_priors_have_bias_and_hr_terms (431), test_phenotype_column_name_constant (457)

### SC2 -- Models Both Fit Paths: VERIFIED

Evidence:
- response_patrl.py:92 model_a_logp with b: float | jnp.ndarray = 0.0 kwarg
- response_patrl.py:166 model_b_logp (gamma * delta_hr additive bias)
- response_patrl.py:239 model_c_logp (alpha * delta_hr EV interaction)
- hierarchical_patrl.py:388-426 dispatches a/b/c in _single_logp
- hierarchical_patrl.py:260-325 dispatches model_d in _single_logp
- fit_vb_laplace_patrl.py:192-253 dispatches a/b/c/d for both 2-level and 3-level
- fit_vb_laplace_patrl.py:452 calls build_idata_from_laplace; produces InferenceData

### SC3 -- Model D: VERIFIED

Evidence:
- hierarchical_patrl.py:281-325: _clamped_step_model_d defined inline inside _make_single_logp_fn closure
- hierarchical_patrl.py:287: omega_eff_i = params[omega_2] + params[lam] * dhr_i
- hierarchical_patrl.py:79: _MU_2_BOUND = 14.0 (layer-2 clamp preserved)
- hierarchical_patrl.py:278: dhr_trials = delta_hr_i.astype(jnp.float64) (fp64 preserved)
- test_fit_vb_laplace_patrl.py:473 test_model_d_lambda_recovery_smoke
- test_fit_vb_laplace_patrl.py:563 test_model_d_lambda_recovery_smoke_epsilon2_coupled

### SC4 -- epsilon2-Coupled Delta-HR: VERIFIED

Evidence:
- pat_rl_simulator.py:37: return_epsilon2: bool = False kwarg on run_hgf_forward_patrl
- pat_rl_simulator.py:408-421: Pass 1 calls run_hgf_forward_patrl(return_epsilon2=True) for both 2-level and 3-level
- pat_rl_simulator.py:424-429: delta_hr = base_dhr + phenotype.epsilon2_coupling_coef * epsilon2_traj
- pat_rl_simulator.py:481: PHENOTYPE_COLUMN_NAME used in row assembly
- pat_rl_config.py:62: PHENOTYPE_COLUMN_NAME = phenotype

### SC5 -- Cohort 40x4=160: VERIFIED

Evidence:
- pat_rl.yaml:85: n_participants_per_phenotype: 40
- pat_rl_simulator.py:135: phenotypes: list[str] | None = None kwarg
- pat_rl_simulator.py:338-339: ss = np.random.SeedSequence(master_seed); phenotype_seeds = ss.spawn(len(phenotypes))
- cluster/patrl_smoke.slurm:70-71: PRL_PATRL_SMOKE_N=40 and PRL_PATRL_SMOKE_PHENOTYPES=all defaults
- test_pat_rl_simulator.py:480: test_simulate_patrl_cohort_determinism_across_phenotype_subsets
- test_pat_rl_simulator.py:511: test_simulate_patrl_cohort_repeat_call_identical_choices

### SC6 -- Stratified BMS + PEB: VERIFIED

Evidence:
- bms.py:372: run_stratified_bms PRESERVED (original pick_best_cue function signature unchanged)
- bms.py:688: compute_batch_waic_patrl with phenotype_col kwarg
- bms.py:805: compute_stratified_bms with phenotype_col kwarg; delegates to run_group_bms per phenotype
- bms.py:944: export_peb_covariates writes delta_waic and delta_f CSV

### SC7 -- PRL-V1 Gate (gate logic): VERIFIED

Evidence:
- scripts/05_run_validation.py:128: --task choices=[prl, patrl]
- scripts/05_run_validation.py:137-138: --fit-method default=laplace
- scripts/05_run_validation.py:103: _MODEL_NAMES_PATRL = [hgf_2level_patrl, hgf_3level_patrl]
- scripts/05_run_validation.py:467: _PATRL_PRIMARY_PARAMS = (omega_2, kappa, beta)
- scripts/05_run_validation.py:468: _PATRL_EXPLORATORY_PARAMS = (omega_3, mu3_0)
- analysis/recovery.py:253: r_threshold default 0.7; :347: passes = bool(r_val >= r_threshold)
- Numeric PRL-V1 r values are cluster-deferred per scope note 1 in verification context (expected; not a gap)

### SC8 -- PRL-V2 Gate: FAILED

Axis mask logic exists and thresholds are correct, but phenotype names mismatch.

What is correct:
- scripts/06_group_analysis.py:147-163: --task patrl and --analysis phenotype_separability args present
- scripts/06_group_analysis.py:265: _PRL_V2_D_THRESHOLD = 0.5
- scripts/06_group_analysis.py:266: _PRL_V2_COR_THRESHOLD = 0.5
- scripts/06_group_analysis.py:457: abs(d_omega2_factorial) >= _PRL_V2_D_THRESHOLD check
- scripts/06_group_analysis.py:510: abs(cor_val) < _PRL_V2_COR_THRESHOLD check
- scripts/06_group_analysis.py:559: contrast_type column in summary_df
- tests/test_validation_gates_patrl.py:148: test_option_a_factorial_axis_masks_are_correct

What is broken:
- scripts/06_group_analysis.py:252: ANXIETY_HIGH = frozenset({high_anxiety, anxious_reward})
  But YAML phenotype keys: anxious, anxious_reward_sensitive (neither match)
- scripts/06_group_analysis.py:253: ANXIETY_LOW = frozenset({healthy, reward_susceptible})
  YAML has reward_sensitive not reward_susceptible
- scripts/06_group_analysis.py:254: REWARD_HIGH = frozenset({reward_susceptible, anxious_reward})
  YAML has reward_sensitive not reward_susceptible; anxious_reward_sensitive not anxious_reward
- scripts/06_group_analysis.py:255: REWARD_LOW = frozenset({healthy, high_anxiety})
  YAML has anxious not high_anxiety
- At runtime: isin() returns empty for three of four phenotypes; d values are NaN; gate silently fails

Note: test_option_a_factorial_axis_masks_are_correct PASSES because it validates that the constants
match the SC8-spec names. It does NOT validate alignment with actual YAML/config phenotype keys.

### SC9 -- No New Scripts: VERIFIED

Evidence:
- git diff b040c3f..HEAD -- scripts/ output: M scripts/05_run_validation.py; M scripts/06_group_analysis.py; M scripts/12_smoke_patrl_foundation.py
- Zero A (added) entries
- tests/test_validation_gates_patrl.py:46: test_sc9_no_new_scripts_audit

### SC10 -- Citations >= 2020: VERIFIED

Evidence:
- docs/references.bib:16-48: klaassen2021freezing, klaassen2024neurocomputational, klaassen2024freezing_preprint, klaassen2021autonomic all present
- docs/references.bib:9: Browning 2015 / Daw 2006 / Schonberg 2007 RETIRED as of Phase 20-08
- docs/PAT_RL_API_HANDOFF.md:547-569: references section cites Klaassen only (no Browning/Daw)
- .planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md: 5 inline (Note: Phase 20 supersedes...) annotations on pre-2020 references
- src/prl_hgf/fitting/hierarchical_patrl.py:251-256: Model D docstring cites Klaassen et al. 2024 Communications Biology doi:10.1038/s42003-024-06267-6

### SC11 -- Additive / Regression Green: VERIFIED (structural)

Evidence:
- git diff origin/main...HEAD -- src/prl_hgf/fitting/hierarchical.py src/prl_hgf/env/task_config.py src/prl_hgf/env/simulator.py src/prl_hgf/models/hgf_2level.py src/prl_hgf/models/hgf_3level.py src/prl_hgf/models/response.py configs/prl_analysis.yaml src/prl_hgf/analysis/group.py src/prl_hgf/analysis/recovery.py produces no output (zero changes)
- tests/test_validation_gates_patrl.py:94: test_sc11_phase_18_19_regression_suite_green (marked @pytest.mark.slow)

---

## Architectural Invariants Audit

1. **No new scripts (SC9):** PASS -- only 3 modified files under scripts/
2. **Citations >= 2020 Roelofs-group-first (SC10):** PASS -- 4 Klaassen entries; Browning/Daw retired
3. **Config-driven only (no hardcoded magic numbers):** PASS -- response_patrl.py, hierarchical_patrl.py, fit_vb_laplace_patrl.py all read from PATRLConfig/priors at runtime
4. **Parallel-stack preserved (Decision 109):** PASS -- zero changes to pick_best_cue files confirmed via git diff
5. **Project-agnostic naming:** PASS -- PAT-RL source files (src/**/*_patrl.py, configs/pat_rl.yaml) contain no study codename references. HEART2ADAPT/H2A references exist only in YAML comments and .planning/ docs (internal documentation, not exported API)

---

## Human Verification Required

### 1. PRL-V1 Numeric Gate (cluster-deferred per scope note 1)

**Test:** Run `sbatch cluster/patrl_smoke.slurm` with defaults (N=40, all phenotypes, laplace method),
then `python scripts/05_run_validation.py --task=patrl --fit-method=laplace`

**Expected:** PRL-V1 PASS for both hgf_2level_patrl and hgf_3level_patrl:
Pearson r >= 0.7 for omega_2, kappa, beta. omega_3 and mu3_0 reported as exploratory (not gated).

**Why human:** Gate logic is code-verified. Numeric r values require actual Laplace fitting of 160 agents on cluster hardware.

### 2. PRL-V2 Numeric Gate (requires SC8 fix first)

**Test:** After resolving phenotype name mismatch (see Gaps Summary),
run `python scripts/06_group_analysis.py --task=patrl --analysis=phenotype_separability`

**Expected:** d(omega_2 anxiety axis) >= 0.5, d(beta reward axis) >= 0.5,
|cor(omega_2, beta)| < 0.5; phenotype_separability_summary.csv with contrast_type column.

**Why human:** Requires phenotype name fix AND 160-agent cohort posterior means from cluster.

---

## Gaps Summary

One gap (SC8) prevents full phase goal achievement. The PRL-V2 phenotype separability gate
has correct logic and threshold constants (d >= 0.5, |cor| < 0.5) but will silently produce
NaN Cohen's d values at runtime due to a phenotype naming mismatch between two layers:

YAML and config module (_REQUIRED_PHENOTYPE_KEYS): healthy, anxious, reward_sensitive, anxious_reward_sensitive

Script axis masks (06_group_analysis.py:252-255): healthy, high_anxiety, reward_susceptible, anxious_reward

Only 'healthy' is shared. Three of four phenotype names differ. When _compute_prl_v2_metrics
calls estimates_df[phenotype].isin(ANXIETY_HIGH), the mask matches zero rows from a real simulation
cohort because 'high_anxiety' and 'anxious_reward' do not exist in sim_df.phenotype.
d_omega2_factorial and d_beta_factorial are NaN; the gate returns FAIL without meaningful evidence.

The regression test test_option_a_factorial_axis_masks_are_correct validates that the script
constants match the SC8-specification names from the verification context. It does NOT validate
alignment with actual YAML/config phenotype keys.

**Remediation Option A:** Rename YAML keys to match script names:
  anxious -> high_anxiety
  reward_sensitive -> reward_susceptible
  anxious_reward_sensitive -> anxious_reward
Update _REQUIRED_PHENOTYPE_KEYS in pat_rl_config.py and all test files referencing old YAML names.

**Remediation Option B:** Keep YAML keys canonical; add explicit alias mapping in _run_phenotype_separability
before calling _compute_prl_v2_metrics. Update test to also assert axis mask names are a subset
of the YAML phenotype keys (cross-layer alignment check).

**Executor debris** (_verify_task1.py, _verify_task2.py, _verify_task3.py at repo root):
Scratch files from executor runs. Not gaps; noted for cleanup.

---

_Verified: 2026-04-18_
_Verifier: Claude (gsd-verifier)_
