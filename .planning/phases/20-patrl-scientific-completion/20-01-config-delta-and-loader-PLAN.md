---
phase: 20-patrl-scientific-completion
plan: 01
type: execute
wave: 1
depends_on: []
files_modified:
  - configs/pat_rl.yaml
  - src/prl_hgf/env/pat_rl_config.py
  - tests/test_env_pat_rl_config.py
autonomous: false
estimated_edits: 8
gap_closure: false
user_setup: []

must_haves:
  truths:
    - "configs/pat_rl.yaml contingencies match the consumer spec: safe 70/10/20, dangerous 10/70/20, avoid 10/10/80"
    - "run_order is ['stable', 'volatile', 'volatile', 'stable'] (SVVS)"
    - "magnitudes are reward_levels=[1, 3], shock_levels=[1, 3]"
    - "Every phenotype has numeric entries for omega_2, beta, kappa, mu3_0, b, dhr_mean, dhr_sd, epsilon2_coupling_coef"
    - "load_pat_rl_config() returns a PATRLConfig whose PhenotypeParams carry the new b/dhr_mean/dhr_sd/epsilon2_coupling_coef fields and whose ContingencyConfig carries an avoid block"
    - "All Phase 18/19 existing tests continue to pass (backwards-compatible defaults on new fields)"
  artifacts:
    - path: "configs/pat_rl.yaml"
      provides: "Consumer-spec contingencies, run order, magnitudes, phenotype priors including b/dhr_*/epsilon2_coupling_coef"
      contains: "avoid:\n      reward: 0.10"
    - path: "src/prl_hgf/env/pat_rl_config.py"
      provides: "Extended ContingencyConfig.avoid, PhenotypeParams with new fields, FittingPriorConfig with b prior, parser updates"
      exports: ["ContingencyConfig", "PhenotypeParams", "FittingPriorConfig", "_parse_contingencies", "_parse_phenotype_params", "_parse_fitting_priors"]
    - path: "tests/test_env_pat_rl_config.py"
      provides: "Tests covering new avoid block, phenotype fields, fitting prior b"
      contains: "def test_avoid_contingency_loaded"
  key_links:
    - from: "configs/pat_rl.yaml"
      to: "src/prl_hgf/env/pat_rl_config.py::_parse_contingencies"
      via: "YAML dict -> ContingencyConfig(safe, dangerous, avoid)"
      pattern: "avoid=_parse_outcome_probs"
    - from: "configs/pat_rl.yaml"
      to: "src/prl_hgf/env/pat_rl_config.py::_parse_phenotype_params"
      via: "per-phenotype dict -> PhenotypeParams with b/dhr_*/epsilon2_coupling_coef"
      pattern: "PhenotypeParams\\(.*b=.*dhr_mean=.*epsilon2_coupling_coef="
    - from: "configs/pat_rl.yaml fitting.priors"
      to: "FittingPriorConfig.b"
      via: "_parse_fitting_priors(d['b'])"
      pattern: "b=_parse_prior_gaussian"
---

<objective>
Correct `configs/pat_rl.yaml` to match the downstream consumer study specification (SC1) and extend the loader in `src/prl_hgf/env/pat_rl_config.py` to parse the new surfaces: an explicit `avoid` contingency block, four new phenotype fields (`b`, `dhr_mean`, `dhr_sd`, `epsilon2_coupling_coef`), and a `b` prior in `FittingPriorConfig`. All changes are additive — existing Phase 18/19 callers continue to work with safe defaults where possible. This plan is the hard dependency for every downstream Phase 20 plan (Models A+b/B/C/D, ε₂-coupled ΔHR simulator, cohort scale, BMS, validation gates).

Purpose: Without this config surface, Models B/C/D have no prior structure, the simulator has no phenotype-specific ΔHR generative parameters, and the cohort cannot be scaled to 40×4. This plan is the root of Wave 1.
Output: A consumer-spec-correct `pat_rl.yaml`; a parser that loads every new field; tests proving the new surface is wired.
</objective>

<execution_context>
@.claude/get-shit-done/workflows/execute-plan.md
@.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@.planning/PROJECT.md
@.planning/ROADMAP.md
@.planning/STATE.md
@.planning/phases/20-patrl-scientific-completion/20-RESEARCH.md

@configs/pat_rl.yaml
@src/prl_hgf/env/pat_rl_config.py
@tests/test_env_pat_rl_config.py
</context>

<tasks>

<task type="checkpoint:decision" gate="blocking">
  <name>Task 1: Confirm avoid-contingency semantics and phenotype numeric values</name>
  <decision>
    RESEARCH.md §12 Risk 1 flags that "avoid 10/10/80" may mean `avoid` yields stochastic outcomes (reward 10%, shock 10%, nothing 80%) OR may be documentation-only (avoid always yields nothing, current behavior). In addition, RESEARCH.md §12 Risk 7 flags that the exact numeric values for `b_sd`, `dhr_mean`, `dhr_sd`, `epsilon2_coupling_coef` per phenotype are NOT accessible to the planner.

    We need the user to confirm BOTH before this plan is executable.
  </decision>
  <context>
    Options for avoid representation:
    - Option A — DOC-ONLY: avoid still always yields nothing in the logp; the "10/10/80" is a published/stated contingency but the task-simulator and logp treat avoid as a no-outcome action. Current code is already correct; we just add the `avoid` block to YAML + loader for documentation completeness.
    - Option B — STOCHASTIC: avoid truly yields reward 10%, shock 10%, nothing 80% during simulation AND during logp evaluation. This requires major revision to `expected_value`, scan body, and outcome generation.
    - Option C — DUAL-MODE: add a config flag `avoid_stochastic: bool` (default False = A). Pay the complexity cost up front.

    Option A is the RESEARCH.md §12 recommendation (safer; preserves current Phase 18 logp structure). Unless the user confirms otherwise, this plan assumes Option A.

    Phenotype numeric values needed (per SC1 where listed, else researcher-supplied):
    - `b_sd` per phenotype (SC1 only gives `b_mean`: healthy 0.0, reward-susceptible +0.3, high-anxiety -0.3, anxious+reward 0.0)
    - `dhr_mean` per phenotype (SC1 gives: healthy -2, high-anxiety -0.5; MISSING for reward-susceptible, anxious+reward)
    - `dhr_sd` per phenotype (SC1 gives: healthy 0.5, high-anxiety 0.8; MISSING for reward-susceptible, anxious+reward)
    - `epsilon2_coupling_coef` per phenotype (SC1 MISSING entirely; paper: Klaassen 2024 Communications Biology uses ~0.2–0.4 range)

    Default proposal (matches RESEARCH.md §12 Risk 7): `b_sd=0.5`, missing `dhr_mean=-1.0`, missing `dhr_sd=0.6`, `epsilon2_coupling_coef=0.3` with explicit TODO comment citing Klaassen 2024 (Comms Bio).
  </context>
  <options>
    <option id="option-a-doc-only">
      <name>Option A — Doc-only avoid + placeholder numerics with TODO comments</name>
      <pros>Preserves current logp behavior; zero risk to existing Phase 18/19 tests; placeholder numerics are clearly flagged for later tuning.</pros>
      <cons>Numeric values are not from a published consumer spec; tuning deferred to a later phase.</cons>
    </option>
    <option id="option-b-stochastic-avoid">
      <name>Option B — Stochastic avoid outcomes (major revision)</name>
      <pros>Matches a literal reading of "avoid 10/10/80"; generative model is richer.</pros>
      <cons>Requires rewriting `expected_value`, scan body, simulator outcome draws, AND tests 18-02, 18-03, 18-04. Defers Phase 20 ship by weeks.</cons>
    </option>
    <option id="option-c-dual-mode">
      <name>Option C — Dual-mode flag (avoid_stochastic: bool)</name>
      <pros>Explicit config switch; both paths available.</pros>
      <cons>Doubles test surface; dormant code path adds maintenance debt.</cons>
    </option>
    <option id="option-user-supplies-numerics">
      <name>Option D — User supplies the exact numeric values now</name>
      <pros>Eliminates placeholder-TODO debt; production-ready YAML.</pros>
      <cons>Planner does not have these values; requires user to paste them.</cons>
    </option>
  </options>
  <resume-signal>Reply with one of: `option-a-doc-only`, `option-b-stochastic-avoid`, `option-c-dual-mode`, `option-user-supplies-numerics + <paste values>`. If you pick Option A, also confirm the placeholder numerics (b_sd=0.5, missing dhr_mean=-1.0, missing dhr_sd=0.6, epsilon2_coupling_coef=0.3) are acceptable.</resume-signal>
</task>

<task type="auto">
  <name>Task 2: Update configs/pat_rl.yaml to consumer spec (SC1)</name>
  <files>configs/pat_rl.yaml</files>
  <action>
    Edit `configs/pat_rl.yaml` as follows (assumes Option A from Task 1 — placeholders with TODO comments where the consumer spec is silent):

    1. Contingencies (lines 33-41): replace the `safe` and `dangerous` blocks AND add an `avoid` block:
       ```yaml
       contingencies:
         safe:
           reward: 0.70
           shock: 0.10
           nothing: 0.20
         dangerous:
           reward: 0.10
           shock: 0.70
           nothing: 0.20
         avoid:
           reward: 0.10
           shock: 0.10
           nothing: 0.80
       ```

    2. Run order (line 25): replace with SVVS:
       ```yaml
       run_order: ["stable", "volatile", "volatile", "stable"]
       ```

    3. Magnitudes (lines 46-47): replace with [1, 3]:
       ```yaml
       reward_levels: [1, 3]
       shock_levels: [1, 3]
       ```

    4. Phenotypes (lines 77-97): replace the 4 phenotype blocks with new consumer-spec priors. Use the following keys (SC1 values where stated; placeholders where missing — include TODO comments):
       ```yaml
       phenotypes:
         healthy:
           omega_2: {mean: -3.0, sd: 0.5}
           beta:    {mean: 2.0, sd: 0.5}
           kappa:   {mean: 1.0, sd: 0.0}
           mu3_0:   {mean: 1.0, sd: 0.0}
           b:       {mean: 0.0, sd: 0.5}       # SC1 mean; sd is placeholder, TODO: consumer spec
           dhr_mean: -2.0                        # SC1 value (Klaassen 2024)
           dhr_sd:   0.5                         # SC1 value
           epsilon2_coupling_coef: 0.3           # TODO placeholder, cite Klaassen 2024 Comms Bio
         reward_sensitive:
           omega_2: {mean: -3.0, sd: 0.5}
           beta:    {mean: 3.5, sd: 0.5}
           kappa:   {mean: 1.0, sd: 0.0}
           mu3_0:   {mean: 1.0, sd: 0.0}
           b:       {mean: 0.3, sd: 0.5}         # SC1 mean; sd placeholder
           dhr_mean: -1.0                        # TODO: consumer spec
           dhr_sd:   0.6                         # TODO: consumer spec
           epsilon2_coupling_coef: 0.3           # TODO placeholder
         anxious:
           omega_2: {mean: -2.0, sd: 0.5}
           beta:    {mean: 2.0, sd: 0.5}
           kappa:   {mean: 1.0, sd: 0.0}
           mu3_0:   {mean: 2.0, sd: 0.0}
           b:       {mean: -0.3, sd: 0.5}        # SC1 mean; sd placeholder
           dhr_mean: -0.5                        # SC1 value
           dhr_sd:   0.8                         # SC1 value
           epsilon2_coupling_coef: 0.3           # TODO placeholder
         anxious_reward_sensitive:
           omega_2: {mean: -2.0, sd: 0.5}
           beta:    {mean: 3.5, sd: 0.5}
           kappa:   {mean: 1.0, sd: 0.0}
           mu3_0:   {mean: 2.0, sd: 0.0}
           b:       {mean: 0.0, sd: 0.5}         # SC1 mean; sd placeholder
           dhr_mean: -1.0                        # TODO: consumer spec
           dhr_sd:   0.8                         # TODO: consumer spec
           epsilon2_coupling_coef: 0.3           # TODO placeholder
       ```
       NOTE the phenotype KEY for the high-anxiety phenotype stays `anxious` (not `high_anxiety`) to preserve `_REQUIRED_PHENOTYPE_KEYS` in pat_rl_config.py — SC1 calls this phenotype "HIGH-ANXIETY" informally but the YAML key must remain `anxious`. Add a comment: `# 'anxious' key = SC1's HIGH-ANXIETY phenotype`.

    5. Leave `n_participants_per_phenotype: 8` alone — Plan 20-05 will change this to 40. Leave `delta_hr_stub` alone — Plan 20-04 will integrate ε₂ coupling.

    6. Add `fitting.priors.b` (alongside omega_2, omega_3, kappa, beta, mu3_0): `b: {mean: 0.0, sd: 1.0}` — used by Models A+b, B, C. Add `fitting.priors.gamma`, `fitting.priors.alpha`, `fitting.priors.lam` as Normal priors for Models B/C/D — `gamma: {mean: 0.0, sd: 0.5}`, `alpha: {mean: 0.0, sd: 0.5}`, `lam: {mean: 0.0, sd: 0.1}`. TODO comments referencing consumer spec.

    7. Replace the existing "Browning 2015 / Daw 2006 / Schönberg 2007" citations in the comment block (lines 20, 66-69, 75-76) with: `# Hazard-rate-driven reversal; phenotype direction grounded in Klaassen et al. 2024 (Communications Biology) — approach-avoidance under threat × HGF.` Plan 20-08 will complete citation replacement across docstrings/docs; leave line-level citations here consistent with that plan.
  </action>
  <verify>
    Run: `python -c "import yaml; y = yaml.safe_load(open('configs/pat_rl.yaml')); assert y['task']['contingencies']['avoid']['reward'] == 0.10; assert y['task']['run_order'] == ['stable','volatile','volatile','stable']; assert y['task']['magnitudes']['reward_levels'] == [1,3]; assert set(y['simulation']['phenotypes'].keys()) == {'healthy','anxious','reward_sensitive','anxious_reward_sensitive'}; assert 'b' in y['simulation']['phenotypes']['healthy']; assert 'dhr_mean' in y['simulation']['phenotypes']['healthy']; assert 'epsilon2_coupling_coef' in y['simulation']['phenotypes']['healthy']; assert 'b' in y['fitting']['priors']; print('yaml OK')"`
  </verify>
  <done>
    - configs/pat_rl.yaml parses as valid YAML
    - avoid block is present with reward=0.10, shock=0.10, nothing=0.80
    - run_order is ['stable','volatile','volatile','stable']
    - reward_levels and shock_levels are [1, 3]
    - All 4 phenotypes (keys: healthy, anxious, reward_sensitive, anxious_reward_sensitive) have b, dhr_mean, dhr_sd, epsilon2_coupling_coef fields
    - fitting.priors has b, gamma, alpha, lam blocks
    - TODO comments are in place for placeholder numerics
  </done>
</task>

<task type="auto">
  <name>Task 3: Extend pat_rl_config.py loader (ContingencyConfig + PhenotypeParams + FittingPriorConfig)</name>
  <files>src/prl_hgf/env/pat_rl_config.py</files>
  <action>
    Make these additive changes in `src/prl_hgf/env/pat_rl_config.py`:

    1. **ContingencyConfig**: near line 131 (the current `ContingencyConfig` dataclass), add an `avoid: OutcomeProbs` field. Default must be constructible from the YAML; since dataclass is `frozen=True`, the field can be non-default (no default value) provided every YAML has `avoid` (which it now does after Task 2). Validate in `__post_init__` that avoid probabilities sum to 1.0 (±1e-6) same as existing safe/dangerous.

    2. **`_parse_contingencies`** (line 585): add `avoid=_parse_outcome_probs(d["avoid"], "avoid")` so it returns `ContingencyConfig(safe=..., dangerous=..., avoid=...)`.

    3. **PhenotypeParams** (line 408-428): add 4 new fields — `b: PriorGaussian`, `dhr_mean: float`, `dhr_sd: float`, `epsilon2_coupling_coef: float`. Update the numpy-style docstring to document all fields. Validate in `__post_init__` that `dhr_sd > 0` and `epsilon2_coupling_coef >= 0`.

    4. **`_parse_phenotype_params`** (line 653): parse the new fields:
       ```python
       return PhenotypeParams(
           omega_2=_parse_prior_gaussian(d["omega_2"]),
           beta=_parse_prior_gaussian(d["beta"]),
           kappa=_parse_prior_gaussian(d["kappa"]),
           mu3_0=_parse_prior_gaussian(d["mu3_0"]),
           b=_parse_prior_gaussian(d["b"]),
           dhr_mean=float(d["dhr_mean"]),
           dhr_sd=float(d["dhr_sd"]),
           epsilon2_coupling_coef=float(d["epsilon2_coupling_coef"]),
       )
       ```

    5. **FittingPriorConfig** (line 472-494): add 4 new Normal-prior fields — `b: PriorGaussian`, `gamma: PriorGaussian`, `alpha: PriorGaussian`, `lam: PriorGaussian`. Document each in the numpy docstring (one-line purpose per field).

    6. **`_parse_fitting_priors`** (line 674): parse the new fields:
       ```python
       return FittingPriorConfig(
           omega_2=_parse_prior_gaussian(d["omega_2"]),
           omega_3=_parse_prior_gaussian(d["omega_3"]),
           kappa=_parse_prior_truncated(d["kappa"]),
           beta=_parse_prior_truncated(d["beta"]),
           mu3_0=_parse_prior_gaussian(d["mu3_0"]),
           b=_parse_prior_gaussian(d["b"]),
           gamma=_parse_prior_gaussian(d["gamma"]),
           alpha=_parse_prior_gaussian(d["alpha"]),
           lam=_parse_prior_gaussian(d["lam"]),
       )
       ```

    7. **Add a module-level constant** at top of file: `PHENOTYPE_COLUMN_NAME: str = "phenotype"` — the canonical column name per RESEARCH.md §12 Risk 3. Export via `__all__` if one exists.

    8. Update module `__all__` to include any new public names if applicable (PhenotypeParams and ContingencyConfig are already public).

    Do NOT change: `_REQUIRED_PHENOTYPE_KEYS`, `PATRLTaskConfig`, `PATRLSimulationConfig`, or any non-schema behavior.
  </action>
  <verify>
    Run from project root: `python -c "from prl_hgf.env.pat_rl_config import load_pat_rl_config; c = load_pat_rl_config(); assert c.task.contingencies.avoid.reward == 0.10; ph = c.simulation.phenotypes['healthy']; assert ph.b.mean == 0.0; assert ph.dhr_mean == -2.0; assert ph.epsilon2_coupling_coef == 0.3; assert c.fitting.priors.b.mean == 0.0; assert c.fitting.priors.lam.sd == 0.1; print('loader OK')"`
  </verify>
  <done>
    - ContingencyConfig has `avoid` field; `__post_init__` validates sum≈1
    - PhenotypeParams has `b`, `dhr_mean`, `dhr_sd`, `epsilon2_coupling_coef`
    - FittingPriorConfig has `b`, `gamma`, `alpha`, `lam` Normal priors
    - PHENOTYPE_COLUMN_NAME module constant exists
    - `load_pat_rl_config()` returns a valid PATRLConfig with all new fields populated
    - `python -m py_compile src/prl_hgf/env/pat_rl_config.py` passes
  </done>
</task>

<task type="auto">
  <name>Task 4: Add tests for new config surface</name>
  <files>tests/test_env_pat_rl_config.py</files>
  <action>
    Extend the existing `tests/test_env_pat_rl_config.py` with these new tests (additive — do not delete existing tests):

    1. `test_avoid_contingency_loaded` — assert `config.task.contingencies.avoid.reward == 0.10`, `.shock == 0.10`, `.nothing == 0.80`, and that the three sum to 1.0.
    2. `test_avoid_contingency_sum_validation` — write a tempfile YAML with `avoid: {reward: 0.5, shock: 0.3, nothing: 0.3}` (sums to 1.1) and assert `load_pat_rl_config(path)` raises ValueError.
    3. `test_run_order_svvs` — assert `config.task.run_order == ("stable", "volatile", "volatile", "stable")`.
    4. `test_magnitudes_1_3` — assert `config.task.magnitudes.reward_levels == (1.0, 3.0)` and `.shock_levels == (1.0, 3.0)`.
    5. `test_phenotype_has_new_fields` — for each phenotype in {healthy, anxious, reward_sensitive, anxious_reward_sensitive}, assert the PhenotypeParams has `b`, `dhr_mean`, `dhr_sd`, `epsilon2_coupling_coef` attributes with finite values; `dhr_sd > 0`; `epsilon2_coupling_coef >= 0`.
    6. `test_phenotype_b_means_match_sc1` — assert `healthy.b.mean == 0.0`, `reward_sensitive.b.mean == 0.3`, `anxious.b.mean == -0.3`, `anxious_reward_sensitive.b.mean == 0.0`.
    7. `test_fitting_priors_have_bias_and_hr_terms` — assert `fitting.priors.b`, `.gamma`, `.alpha`, `.lam` are present and are PriorGaussian instances.
    8. `test_phenotype_column_name_constant` — import `PHENOTYPE_COLUMN_NAME`; assert it equals `"phenotype"`.

    Put these in a new `class TestPhase20ConfigExtensions:` or add to existing test classes. Follow existing test style (numpy-style docstrings, absolute imports, `from __future__ import annotations` at top).
  </action>
  <verify>
    Run: `pytest tests/test_env_pat_rl_config.py -v`. All tests (existing + 8 new) must pass.
  </verify>
  <done>
    - 8 new tests added in tests/test_env_pat_rl_config.py
    - All tests pass
    - Existing Phase 18 tests in the same file still pass
  </done>
</task>

</tasks>

<verification>
  - `pytest tests/test_env_pat_rl_config.py -v` — all tests pass
  - `python -c "from prl_hgf.env.pat_rl_config import load_pat_rl_config, PHENOTYPE_COLUMN_NAME; c = load_pat_rl_config(); print(c.task.contingencies.avoid, PHENOTYPE_COLUMN_NAME)"` — prints avoid block + "phenotype"
  - `ruff check configs/pat_rl.yaml src/prl_hgf/env/pat_rl_config.py tests/test_env_pat_rl_config.py` — clean (YAML is not linted by ruff; skip for that file)
  - `mypy src/prl_hgf/env/pat_rl_config.py` — clean
  - Smoke that Phase 18/19 tests still pass: `pytest tests/test_models_patrl.py tests/test_hierarchical_patrl.py tests/test_pat_rl_simulator.py tests/test_fit_vb_laplace_patrl.py -v` — no regressions
</verification>

<success_criteria>
  - configs/pat_rl.yaml loads via load_pat_rl_config() with ZERO ValueError exceptions
  - ContingencyConfig.avoid is accessible and sums to 1.0
  - Every phenotype carries b, dhr_mean, dhr_sd, epsilon2_coupling_coef
  - FittingPriorConfig carries b, gamma, alpha, lam priors
  - PHENOTYPE_COLUMN_NAME = "phenotype" module constant is importable
  - No Phase 18/19 test regression
  - SC1 (from Phase 20 roadmap) is satisfied
</success_criteria>

<output>
After completion, create `.planning/phases/20-patrl-scientific-completion/20-01-SUMMARY.md` with: (a) the final numeric values in configs/pat_rl.yaml (for audit trail before Plan 20-08 citation pass), (b) the list of new public names added to pat_rl_config.py, (c) any placeholder TODOs that Plan 20-08 or a later phase must revisit.
</output>
