---
phase: 20-patrl-scientific-completion
plan: 07
type: execute
wave: 4
depends_on: [20-03, 20-05, 20-06]
files_modified:
  - scripts/05_run_validation.py
  - scripts/06_group_analysis.py
  - src/prl_hgf/analysis/recovery.py
  - src/prl_hgf/analysis/effect_sizes.py
  - tests/test_validation_integration.py
autonomous: false
estimated_edits: 5
gap_closure: false
user_setup: []

must_haves:
  truths:
    - "scripts/05_run_validation.py accepts --task {prl,patrl} with default 'prl' (backwards compatible)"
    - "scripts/05 --task=patrl computes recovery metrics for {omega_2, kappa, beta} and labels {omega_3, mu3_0} as exploratory"
    - "PRL-V1 gate: r(omega_2) >= 0.7, r(kappa) >= 0.7, r(beta) >= 0.7 across the 160-agent cohort"
    - "scripts/06_group_analysis.py accepts --task {prl,patrl} and --analysis {group_interaction,phenotype_separability} with defaults preserving pre-Phase-20 behavior"
    - "scripts/06 --task=patrl --analysis=phenotype_separability computes Cohen's d(omega_2 | anxious vs non-anxious), Cohen's d(beta | reward_sensitive vs non-reward-sensitive), |cor(omega_2, beta)|"
    - "PRL-V2 gate: Cohen's d >= 0.5 for both separability axes; |cor(omega_2, beta)| < 0.5"
    - "No new scripts under scripts/; all extensions are modifications to existing files (SC9)"
    - "`git diff --stat scripts/` since phase start shows ONLY modifications (zero new files under scripts/); verified at phase close (SC9 audit)"
    - "Phase 18/19 regression suite is green: `pytest tests/test_models_patrl.py tests/test_hierarchical_patrl.py tests/test_pat_rl_simulator.py tests/test_fit_vb_laplace_patrl.py tests/test_env_pat_rl_config.py tests/test_bms.py -v` exits 0 with zero failures (SC11 gate)"
  artifacts:
    - path: "scripts/05_run_validation.py"
      provides: "--task {prl,patrl} toggle; PAT-RL recovery loop; PRL-V1 gate check"
      contains: "--task"
    - path: "scripts/06_group_analysis.py"
      provides: "--task {prl,patrl} and --analysis toggles; phenotype_separability analysis"
      contains: "phenotype_separability"
    - path: "src/prl_hgf/analysis/recovery.py"
      provides: "Extended compute_recovery_metrics or new compute_recovery_metrics_patrl with exploratory labels for omega_3/mu3_0"
      contains: "exploratory"
    - path: "src/prl_hgf/analysis/effect_sizes.py"
      provides: "cohens_d helper for PRL-V2 gate"
      contains: "cohens_d"
  key_links:
    - from: "sim_df['phenotype'] (from Plan 20-04) → fit_df['phenotype'] (from Plan 20-06's compute_batch_waic_patrl)"
      to: "phenotype-stratified analyses in scripts/05 + scripts/06"
      via: "Plan 20-06 already owns the producer; Plan 20-07 consumes fit_df as-is"
      pattern: "phenotype"
    - from: "fit_df + true_params (160 agents)"
      to: "PRL-V1 gate report (r >= 0.7 for omega_2/kappa/beta)"
      via: "scripts/05 --task=patrl recovery loop → compute_recovery_metrics_patrl → gate check"
      pattern: "passes_threshold"
    - from: "phenotype-stratified posterior estimates"
      to: "Cohen's d + correlation (PRL-V2 gate)"
      via: "scripts/06 --analysis=phenotype_separability"
      pattern: "cohens_d|corrcoef"
---

<objective>
Wire PRL-V1 (parameter recovery) and PRL-V2 (phenotype separability) formal gates by extending existing `scripts/05_run_validation.py` and `scripts/06_group_analysis.py` — NO new scripts (SC9). Add `--task {prl,patrl}` toggles; for PAT-RL the recovery loop uses `hgf_2level_patrl` / `hgf_3level_patrl` and reports r(ω₂), r(κ), r(β) with exploratory labels on ω₃/μ₃⁰ (per Decision 141 and Phase 9-01 precedent). Add `--analysis {group_interaction,phenotype_separability}` to scripts/06; the new analysis computes Cohen's d and correlation gates across the 160-agent cohort.

**Checker note (H3):** The phenotype-propagating WAIC bridge (`compute_batch_waic_patrl`) has been MOVED INTO Plan 20-06 — that's where the producer and its stratified-BMS consumer are co-located. This plan (20-07) now consumes Plan 20-06's output as a black box: fit_df arrives with the `phenotype` column already attached.

**Checker note (M8):** The checkpoint:decision on PRL-V2 axis mapping (Task 2) MUST precede the scripts/06 phenotype-separability implementation (Task 4). The original ordering had the implementation task assuming Option A before the decision resolved; this is fixed by reordering so the checkpoint lands early.

**Checker note (H4):** Two new must_haves are added: SC9 audit (zero new scripts; verified via `git diff --stat`) and SC11 gate (Phase 18/19 regression suite passes) as truth-level commitments, not just verification steps.

This is the Phase 20 scientific-gate plan — the SC7/SC8/SC9/SC11 decision points live here.

Purpose: Without these gates, Phase 20 has extensions but no scientific acceptance criteria. PRL-V1 proves recovery is good enough for inference; PRL-V2 proves phenotypes are separable given the recovery. Both are binary gates with published thresholds. SC11 ensures the extensions haven't regressed the existing Phase 18/19 surface.
Output: Two extended scripts + one recovery-metrics extension + one effect-size helper + a slow integration test that exercises the full pipeline on a 40-agent subset (cluster-only for full 160-agent run).
</objective>

<execution_context>
@.claude/get-shit-done/workflows/execute-plan.md
@.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@.planning/PROJECT.md
@.planning/ROADMAP.md
@.planning/phases/20-patrl-scientific-completion/20-RESEARCH.md
@.planning/phases/20-patrl-scientific-completion/20-03-SUMMARY.md
@.planning/phases/20-patrl-scientific-completion/20-05-SUMMARY.md
@.planning/phases/20-patrl-scientific-completion/20-06-SUMMARY.md

@scripts/05_run_validation.py
@scripts/06_group_analysis.py
@src/prl_hgf/analysis/recovery.py
@src/prl_hgf/analysis/bms.py
@src/prl_hgf/analysis/effect_sizes.py
@tests/test_validation_integration.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Extend src/prl_hgf/analysis/recovery.py — PAT-RL recovery metrics with exploratory labels</name>
  <files>src/prl_hgf/analysis/recovery.py</files>
  <action>
    Open `src/prl_hgf/analysis/recovery.py`. The existing `compute_recovery_metrics` returns per-parameter Pearson r and bias. For PAT-RL add a new function (or a kwarg) that:

    1. Accepts a list of "primary" parameters (recovery gated) and "exploratory" parameters (reported but not gated).

    2. For PRL-V1: primary = `["omega_2", "kappa", "beta"]`, exploratory = `["omega_3", "mu3_0"]`.

    3. Applies the threshold r >= 0.7 to primary parameters only; exploratory parameters are flagged with a boolean column `exploratory=True` and not included in the pass/fail gate.

    Recommended signature:
    ```python
    def compute_recovery_metrics_patrl(
        fit_df: pd.DataFrame,      # has columns: participant_id, param, true_value, posterior_mean, posterior_sd
        r_threshold: float = 0.7,
        primary_params: tuple[str, ...] = ("omega_2", "kappa", "beta"),
        exploratory_params: tuple[str, ...] = ("omega_3", "mu3_0"),
    ) -> pd.DataFrame:
        """PAT-RL parameter recovery metrics with exploratory labels.

        Parameters
        ----------
        fit_df : pandas.DataFrame
            Long-format: one row per (participant_id, param).
        r_threshold : float, default 0.7
            Pearson r threshold for primary_params.
        primary_params : tuple of str
            Parameters gated by the threshold.
        exploratory_params : tuple of str
            Parameters reported but not gated (Decision 141, Phase 9-01
            precedent; ω₃ recovery known poor).

        Returns
        -------
        pandas.DataFrame
            Columns: param, pearson_r, bias, passes_threshold, exploratory.
        """
        from scipy.stats import pearsonr
        rows = []
        for p in list(primary_params) + list(exploratory_params):
            sub = fit_df[fit_df["param"] == p]
            if len(sub) < 3:
                rows.append({
                    "param": p, "pearson_r": float("nan"), "bias": float("nan"),
                    "passes_threshold": False, "exploratory": p in exploratory_params,
                })
                continue
            r, _ = pearsonr(sub["true_value"], sub["posterior_mean"])
            bias = float((sub["posterior_mean"] - sub["true_value"]).mean())
            is_primary = p in primary_params
            passes = bool(r >= r_threshold) if is_primary else pd.NA
            rows.append({
                "param": p, "pearson_r": float(r), "bias": bias,
                "passes_threshold": passes, "exploratory": not is_primary,
            })
        return pd.DataFrame(rows)
    ```

    Do NOT modify the existing `compute_recovery_metrics` — Phase 9-01 callers still use it for pick_best_cue. The parallel-stack invariant (Decision 109) applies here too.

    Add `compute_recovery_metrics_patrl` to `__all__` in recovery.py.
  </action>
  <verify>
    Run: `python -c "from prl_hgf.analysis.recovery import compute_recovery_metrics_patrl; import pandas as pd; df = pd.DataFrame({'participant_id':['P0','P1','P0','P1','P0','P1'], 'param':['omega_2','omega_2','beta','beta','omega_3','omega_3'], 'true_value':[-3,-2,2.0,2.5,-6,-5], 'posterior_mean':[-3.1,-2.1,2.05,2.55,-6.2,-4.8], 'posterior_sd':[0.1]*6}); out = compute_recovery_metrics_patrl(df); print(out)"` — prints a DataFrame with 5 rows (omega_2, kappa, beta, omega_3, mu3_0); omega_3 row has exploratory=True and passes_threshold=<NA>.
  </verify>
  <done>
    - compute_recovery_metrics_patrl function exists
    - Distinguishes primary_params (gated by r >= 0.7) from exploratory_params
    - exploratory=True flag for omega_3, mu3_0
    - passes_threshold=pd.NA for exploratory rows (Decision 141 precedent)
    - Exported in __all__; existing compute_recovery_metrics untouched
  </done>
</task>

<task type="checkpoint:decision" gate="blocking">
  <name>Task 2: Confirm PRL-V2 separability axes mapping (M8 — decision MUST land before Tasks 3-4 touch implementation)</name>
  <decision>
    The phenotype labels in configs/pat_rl.yaml are `healthy`, `anxious`, `reward_sensitive`, `anxious_reward_sensitive` (Decision 109 / Phase 18 canonical set). SC8 (PRL-V2 gate) defines the separability axes as:

    - Anxiety axis: "anxiety_high" vs "anxiety_low" (Cohen's d on omega_2)
    - Reward axis: "reward_high" vs "reward_low" (Cohen's d on beta)

    We need to confirm the canonical phenotype → axis mapping:

    - Anxiety HIGH = {anxious, anxious_reward_sensitive}; Anxiety LOW = {healthy, reward_sensitive}
    - Reward HIGH = {reward_sensitive, anxious_reward_sensitive}; Reward LOW = {healthy, anxious}

    This is the 2x2 factorial interpretation of the 4 phenotypes (anxiety × reward_sensitivity). The YAML phenotype names use the descriptive-label convention (Decision 109); the 2x2 crossing is implicit.

    Question for user: is this mapping correct for the consumer spec? Alternative mappings (e.g. "anxiety high" only = anxious, not anxious_reward_sensitive) would change the Cohen's d grouping.

    **This checkpoint is placed EARLY (right after Task 1) so Tasks 3 and 4 can write their
    implementation text with the axis mapping already resolved.** No plan text downstream of
    this checkpoint assumes a specific option until the user picks one.
  </decision>
  <context>
    Without confirmation, the PRL-V2 gate cannot be coded correctly. RESEARCH.md §10 does not specify the axis mapping because the researcher flagged it as consumer-spec-dependent.

    The 2×2 factorial interpretation (Option A below) is standard for approach-avoidance paradigms with anxiety × reward_sensitivity factors (Klaassen 2024 Communications Biology uses this structure). Option B is simpler but may undercount anxious_reward_sensitive agents.
  </context>
  <options>
    <option id="option-a-2x2-factorial">
      <name>Option A — 2x2 factorial: each phenotype contributes to both axes</name>
      <pros>Standard in the literature; all 160 agents contribute to both Cohen's d measurements; maximum statistical power.</pros>
      <cons>None — this is the default interpretation.</cons>
    </option>
    <option id="option-b-strict-labels">
      <name>Option B — Strict labels: anxiety_high only = 'anxious'; reward_high only = 'reward_sensitive'</name>
      <pros>Simpler mapping, no implicit factorial.</pros>
      <cons>Discards the 80 anxious_reward_sensitive + healthy agents from Cohen's d comparisons; halves the power.</cons>
    </option>
    <option id="option-c-user-supplies">
      <name>Option C — User specifies exact axis groupings now</name>
      <pros>No ambiguity.</pros>
      <cons>Requires user input to unblock plan execution.</cons>
    </option>
  </options>
  <resume-signal>Reply with `option-a-2x2-factorial`, `option-b-strict-labels`, or `option-c-user-supplies + <explicit mapping>`. Option A is the recommended default if no strong preference.</resume-signal>
</task>

<task type="auto">
  <name>Task 3: Extend scripts/05_run_validation.py with --task patrl + PRL-V1 gate</name>
  <files>scripts/05_run_validation.py</files>
  <action>
    Edit `scripts/05_run_validation.py`:

    1. **Add `--task {prl,patrl}` argparse argument** to `_parse_args()` (around line 83):
       ```python
       parser.add_argument(
           "--task",
           choices=["prl", "patrl"],
           default="prl",
           help="Task to validate. 'prl' = pick_best_cue (Phase 1-9); "
                "'patrl' = PAT-RL (Phase 20 PRL-V1 gate).",
       )
       ```

    2. **Branch the `_MODEL_NAMES` constant** (line ~55) based on `args.task`:
       ```python
       def _get_model_names(task: str) -> list[str]:
           if task == "prl":
               return ["hgf_2level", "hgf_3level"]
           elif task == "patrl":
               return ["hgf_2level_patrl", "hgf_3level_patrl"]
           raise ValueError(f"unknown task: {task}")
       ```

    3. **Default path adjustments**: when `args.task == "patrl"`, default `sim_path` to `results/patrl_smoke/sim_df.csv` (or whichever Plan 20-05 SLURM smoke writes); default `fit_path_2level` / `fit_path_3level` / `idata_dir` to the corresponding PAT-RL outputs. Do NOT hardcode — detect via `config.py` or add PAT-RL-specific path constants.

    4. **Branch the recovery loop**: currently calls `_run_recovery(model_name, ...)`. For patrl, route to a new helper `_run_recovery_patrl(model_name, sim_df, true_params, idata_dict, ...)` that:
       - Computes per-participant posterior means for `omega_2`, `kappa`, `beta`, and (for 3-level) `omega_3`, `mu3_0`.
       - Merges with true_params to build a long-format DataFrame.
       - Calls `compute_recovery_metrics_patrl` (from Task 1).
       - Returns the metrics DataFrame.

    5. **PRL-V1 gate report**: after metrics are computed, print a clear PASS/FAIL summary:
       ```python
       if args.task == "patrl":
           primary = metrics[~metrics.exploratory]
           all_pass = primary["passes_threshold"].all()
           log.info("=" * 60)
           log.info("PRL-V1 GATE: %s", "PASS" if all_pass else "FAIL")
           for _, row in primary.iterrows():
               log.info("  %s: r=%.3f (threshold %.2f) %s",
                        row["param"], row["pearson_r"], args.r_threshold,
                        "PASS" if row["passes_threshold"] else "FAIL")
           for _, row in metrics[metrics.exploratory].iterrows():
               log.info("  %s: r=%.3f [exploratory]", row["param"], row["pearson_r"])
           log.info("=" * 60)
       ```

    6. **Add `--r-threshold` flag** (default 0.7) so the gate threshold is settable from CLI.

    7. **Output**: write `patrl_recovery_metrics.csv` to the results dir (mirroring existing prl pattern).

    8. **Do NOT break the default `--task=prl` path** — existing Phase 9-01 validation must continue to work. Pre-Phase-20 CLI invocations must produce identical output.

    Note: Plan 20-07 no longer implements the WAIC phenotype bridge — that now lives in Plan 20-06
    (Task 1 of 20-06 is `compute_batch_waic_patrl`). scripts/05 can import and call it directly.
  </action>
  <verify>
    Run `python scripts/05_run_validation.py --help` — verify `--task` and `--r-threshold` are listed.

    Run (requires Plan 20-05 smoke output): `python scripts/05_run_validation.py --task=patrl --sim-path <test> --fit-path-2level <test> --fit-path-3level <test>` on a small test fixture. Exit 0 with PRL-V1 gate report in stdout.

    Run: `python scripts/05_run_validation.py --task=prl` — backward-compat smoke; unchanged output.
  </verify>
  <done>
    - --task {prl,patrl} and --r-threshold args added
    - PAT-RL recovery loop routes through compute_recovery_metrics_patrl
    - PRL-V1 gate report printed to stdout + saved as patrl_recovery_metrics.csv
    - Backward compat: --task=prl default unchanged
    - SC9 respected: only scripts/05 MODIFIED, no new scripts
  </done>
</task>

<task type="auto">
  <name>Task 4: Extend scripts/06_group_analysis.py with --task patrl --analysis phenotype_separability + PRL-V2 gate</name>
  <files>scripts/06_group_analysis.py, src/prl_hgf/analysis/effect_sizes.py</files>
  <action>
    This task assumes Task 2 (M8 checkpoint) has resolved. Apply the axis mapping from the checkpoint
    resume-signal. Default implementation below assumes `option-a-2x2-factorial`; if the user selected
    a different option, substitute the corresponding axis masks.

    1. **Add CLI args** to `scripts/06_group_analysis.py` `_parse_args`:
       ```python
       parser.add_argument("--task", choices=["prl","patrl"], default="prl")
       parser.add_argument(
           "--analysis", choices=["group_interaction","phenotype_separability"],
           default="group_interaction",
       )
       ```

    2. **Branch main()**: when `args.task == "patrl" and args.analysis == "phenotype_separability"`, call a new helper function `_run_phenotype_separability(...)` that:
       - Loads PAT-RL fit results (posterior means per participant for omega_2, beta) via `compute_batch_waic_patrl` (Plan 20-06 Task 1).
       - Joins with sim_df to attach phenotype (fit_df from 20-06 already has phenotype column attached, so this join is a sanity check not a data fix).
       - Builds axis groupings per the Task 2 resume-signal. For Option A (2x2 factorial):
         ```python
         anx_high_mask = df.phenotype.isin(["anxious","anxious_reward_sensitive"])
         rew_high_mask = df.phenotype.isin(["reward_sensitive","anxious_reward_sensitive"])
         ```
       - Computes Cohen's d via `effect_sizes.py::cohens_d` (add if not present — standard formula `(mean_high - mean_low) / pooled_sd`).
       - Computes `|cor(omega_2, beta)|` via `numpy.corrcoef`.
       - Assembles PRL-V2 gate summary.

    3. **Extend `src/prl_hgf/analysis/effect_sizes.py`** if needed: add a small `cohens_d(group_high, group_low) -> float` helper. If an equivalent already exists (check the file; pick_best_cue may have one), reuse it. Add to `__all__`.

    4. **PRL-V2 gate report**: print the following to stdout and save to `patrl_phenotype_separability_summary.csv`:
       ```
       ============================================================
       PRL-V2 GATE:
         omega_2: Cohen's d (anxiety_high vs anxiety_low) = 0.62 [PASS >= 0.5]
         beta:    Cohen's d (reward_high vs reward_low)   = 0.58 [PASS >= 0.5]
         |cor(omega_2, beta)| = 0.31 [PASS < 0.5]
       OVERALL: PASS
       ============================================================
       ```

    5. **Publication figure**: save a raincloud/violin plot to `patrl_phenotype_separability.png` showing omega_2 and beta distributions per phenotype (4 groups) side-by-side. Reuse existing plotting utilities from `group_plots.py` or `plots.py`. Matplotlib only — no seaborn dep.

    6. **Backward compat**: when `--task=prl` (default), behavior is unchanged. Existing Phase 6-01 callers still work.

    7. **--draws N** existing flag is respected for the posterior-mean aggregation.
  </action>
  <verify>
    Run `python scripts/06_group_analysis.py --help` — verify `--task` and `--analysis` are listed.
    Run: `python scripts/06_group_analysis.py --task=prl` — backward compat; produces existing outputs.
    Run: `python scripts/06_group_analysis.py --task=patrl --analysis=phenotype_separability --sim-path <test> --fit-path-2level <test>` (requires Plan 20-05 cohort + Plan 20-06 WAIC output); exit 0; PRL-V2 gate report in stdout.
  </verify>
  <done>
    - --task and --analysis args added to scripts/06
    - phenotype_separability analysis computes Cohen's d + correlation per Task 2 resume-signal mapping
    - PRL-V2 gate report printed + saved as CSV + PNG
    - Backward compat: default --task=prl unchanged
    - cohens_d helper exists (added or reused) in effect_sizes.py
    - SC9 respected: only scripts/06 MODIFIED
  </done>
</task>

<task type="auto">
  <name>Task 5: Integration smoke test for validation gates + SC9 audit + SC11 regression gate</name>
  <files>tests/test_validation_integration.py</files>
  <action>
    Add or extend `tests/test_validation_integration.py` (create if missing):

    1. `@pytest.mark.slow` `test_prl_v1_gate_smoke_patrl_40_agents` — run simulate_patrl_cohort with 10 agents × 4 phenotypes (downsized from 40 for fast CI; cluster runs full 40 via SLURM), fit via Laplace, compute recovery metrics, verify the gate output structure (not the actual r values — those need more agents). Asserts: output CSV has the expected columns; exploratory column is True for ω₃/μ₃⁰ rows; passes_threshold is boolean for primary.

    2. `@pytest.mark.slow` `test_prl_v2_gate_smoke_patrl_40_agents` — same cohort; compute phenotype_separability; verify the gate output structure. Asserts: Cohen's d and correlation are computed and finite; PRL-V2 summary CSV exists.

    3. `test_compute_recovery_metrics_patrl_exploratory_labeling` — synthetic fit_df; assert `exploratory=True` for ω₃/μ₃⁰ rows; `passes_threshold=pd.NA` for exploratory; `passes_threshold` in {True, False} for primary.

    4. `test_sc9_no_new_scripts_audit` — implements the SC9 gate programmatically:
       ```python
       import subprocess
       out = subprocess.check_output(
           ["git", "diff", "--name-status", f"{PHASE_START_REF}..HEAD", "--", "scripts/"],
           text=True,
       )
       added = [l for l in out.splitlines() if l.startswith("A\t")]
       assert not added, f"SC9 VIOLATED — new scripts added this phase: {added}"
       ```
       (Use a conftest fixture to supply `PHASE_START_REF` — e.g., the commit that landed Plan 20-01.)
       This test operationalizes the SC9 must_have as a grep-discoverable check.

    5. `test_sc11_phase_18_19_regression_suite_green` — calls pytest internally on the regression set:
       ```python
       import subprocess
       result = subprocess.run(
           ["pytest",
            "tests/test_models_patrl.py",
            "tests/test_hierarchical_patrl.py",
            "tests/test_pat_rl_simulator.py",
            "tests/test_fit_vb_laplace_patrl.py",
            "tests/test_env_pat_rl_config.py",
            "tests/test_bms.py",
            "-v", "--tb=short", "-x",
           ],
           capture_output=True, text=True,
       )
       assert result.returncode == 0, (
           f"SC11 VIOLATED — regression suite failures:\n{result.stdout}\n{result.stderr}"
       )
       ```
       Mark this test `@pytest.mark.slow` because it runs the entire regression suite (~few min).
       Skip in fast CI by default; always run at phase-close.

    Mark integration tests `@pytest.mark.slow` so they can be excluded from fast CI. Document the cluster equivalent (full 160-agent run) in the test docstring.
  </action>
  <verify>
    Run: `pytest tests/test_validation_integration.py -v` — fast tests pass.
    Run: `pytest tests/test_validation_integration.py -v --run-slow` — slow tests pass (may take ~5-10 min, including the SC11 regression gate).
    Run the SC9 audit directly: `python -c "import subprocess; print(subprocess.check_output(['git','diff','--name-status','HEAD~N..HEAD','--','scripts/'],text=True))"` — verify no new-file entries.
  </verify>
  <done>
    - 5 new integration tests exist (including SC9 audit + SC11 regression gate)
    - Fast tests pass without `--run-slow`
    - Slow tests pass with `--run-slow`
    - SC9 test is grep-discoverable (`test_sc9_no_new_scripts_audit`)
    - SC11 test is grep-discoverable (`test_sc11_phase_18_19_regression_suite_green`)
    - Cluster-equivalent commands documented in test docstrings
  </done>
</task>

</tasks>

<verification>
  - `pytest tests/test_validation_integration.py tests/test_bms.py -v` — all pass (including phenotype propagation via Plan 20-06's compute_batch_waic_patrl)
  - `pytest tests/test_validation_integration.py --run-slow -v` — slow integration + SC11 regression gate passes
  - `python scripts/05_run_validation.py --help` — --task and --r-threshold present
  - `python scripts/06_group_analysis.py --help` — --task and --analysis present
  - `python scripts/05_run_validation.py --task=prl` — backward-compat unchanged
  - `python scripts/06_group_analysis.py --task=prl` — backward-compat unchanged
  - Verify SC9 (no new scripts): `git diff --stat scripts/` since phase start — ONLY MODIFIED lines, zero ADDED files. Run: `git status --porcelain scripts/ | awk '$1 == "A" { print "FAIL: new file " $2; exit 1 }' && echo "SC9 OK"`
  - SC11 gate (from must_haves): `pytest tests/test_models_patrl.py tests/test_hierarchical_patrl.py tests/test_pat_rl_simulator.py tests/test_fit_vb_laplace_patrl.py tests/test_env_pat_rl_config.py tests/test_bms.py -v` exits 0
  - `ruff check scripts/05_run_validation.py scripts/06_group_analysis.py src/prl_hgf/analysis/recovery.py src/prl_hgf/analysis/effect_sizes.py` — clean
  - `mypy scripts/05_run_validation.py scripts/06_group_analysis.py` — clean (or as-clean-as-pre-Phase-20)
</verification>

<success_criteria>
  - SC7 complete: PRL-V1 gate (r >= 0.7 for ω₂/κ/β) wired into scripts/05 via --task=patrl
  - SC8 complete: PRL-V2 gate (Cohen's d >= 0.5 for both axes, |cor| < 0.5) wired into scripts/06 via --task=patrl --analysis=phenotype_separability
  - SC9 complete: zero new scripts; only scripts/05 and scripts/06 + library modules modified (verified via `test_sc9_no_new_scripts_audit` + git diff --stat scripts/)
  - SC11 complete: Phase 18/19 regression suite is green (verified via `test_sc11_phase_18_19_regression_suite_green` at phase close)
  - Phenotype column propagates sim_df → fit_df via Plan 20-06's compute_batch_waic_patrl → compute_stratified_bms (H3 resolved — 20-07 consumes, 20-06 produces)
  - M8 resolved: checkpoint:decision (Task 2) lands before Tasks 3-4 touch implementation text
  - Exploratory labels on ω₃/μ₃⁰ per Decision 141 / Phase 9-01 precedent
  - Backward compat preserved for Phase 9-01 prl callers
  - Full 160-agent run documented for cluster execution (SLURM script from Plan 20-05)
</success_criteria>

<output>
Create `.planning/phases/20-patrl-scientific-completion/20-07-SUMMARY.md` with: (a) final CLI surface of scripts/05 and scripts/06 (full --help output), (b) PRL-V1 and PRL-V2 gate formulas and thresholds, (c) cluster-run command for full 160-agent pipeline (simulate + fit + validate + separability), (d) any remaining TODO for hand-off to sister-repo PEB consumer (delta_f sign convention note from Plan 20-06), (e) evidence that SC9 audit and SC11 regression gate are both GREEN at phase close.
</output>
