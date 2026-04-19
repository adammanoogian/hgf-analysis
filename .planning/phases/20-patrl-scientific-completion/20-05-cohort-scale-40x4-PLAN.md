---
phase: 20-patrl-scientific-completion
plan: 05
type: execute
wave: 2
depends_on: [20-01, 20-04]
files_modified:
  - configs/pat_rl.yaml
  - src/prl_hgf/env/pat_rl_simulator.py
  - scripts/12_smoke_patrl_foundation.py
  - cluster/patrl_smoke.slurm
  - tests/test_pat_rl_simulator.py
autonomous: true
estimated_edits: 5
gap_closure: false
user_setup: []

must_haves:
  truths:
    - "config.simulation.n_participants_per_phenotype defaults to 40 (consumer-spec cohort scale)"
    - "simulate_patrl_cohort produces 40 × 4 = 160 agents when called with default config and phenotypes=None"
    - "All 4 phenotypes (healthy, anxious, reward_sensitive, anxious_reward_sensitive) are populated from config.simulation.phenotypes"
    - "Per-phenotype RNG is deterministic: same master_seed → same sim_df → same trials_by_participant → same true_params across invocations"
    - "Per-phenotype SeedSequence spawn pattern is used: ss.spawn(4) per phenotype, each of which spawns n_per_phenotype"
    - "Calling simulate_patrl_cohort(master_seed=42, phenotypes=['healthy']) twice produces identical sim_df['choice'] arrays; calling with phenotypes=['healthy','high_anxiety'] vs ['healthy'] produces identical healthy-subset rows (user-observable determinism property, not just an internal SeedSequence pattern)"
    - "Cluster SLURM smoke script defaults to PRL_PATRL_SMOKE_N=40 PRL_PATRL_SMOKE_PHENOTYPES=all"
    - "Existing Phase 18/19 single-phenotype callers continue to work via phenotypes=['healthy'] or legacy phenotype_name kwarg"
  artifacts:
    - path: "configs/pat_rl.yaml"
      provides: "n_participants_per_phenotype: 40"
      contains: "n_participants_per_phenotype: 40"
    - path: "src/prl_hgf/env/pat_rl_simulator.py"
      provides: "Multi-phenotype loop in simulate_patrl_cohort with per-phenotype SeedSequence spawn"
      contains: "ss.spawn("
    - path: "cluster/patrl_smoke.slurm"
      provides: "SLURM defaults for 40-agent all-phenotype smoke (PRL_PATRL_SMOKE_N=40, PRL_PATRL_SMOKE_PHENOTYPES=all)"
      contains: "PRL_PATRL_SMOKE_N=40"
    - path: "tests/test_pat_rl_simulator.py"
      provides: "Multi-phenotype determinism tests; 40 × 4 = 160 structural test (marked @pytest.mark.slow)"
      contains: "test_simulate_patrl_cohort_multi_phenotype"
  key_links:
    - from: "config.simulation.phenotypes (dict of 4)"
      to: "simulate_patrl_cohort multi-phenotype loop"
      via: "iterate phenotype_name over phenotypes list; spawn child seeds per phenotype"
      pattern: "for phenotype_name in phenotypes"
    - from: "master_seed"
      to: "per-phenotype deterministic child SeedSequences"
      via: "ss = np.random.SeedSequence(master_seed); phenotype_seeds = ss.spawn(len(phenotypes))"
      pattern: "SeedSequence\\(.*spawn"
---

<objective>
Scale the PAT-RL synthetic cohort from Phase 18/19's single-phenotype 8-agent default to the consumer-spec 40 × 4 = 160 agents (SC5). The key constraint is DETERMINISM: same `master_seed` must produce identical sim_df, true_params, and trials_by_participant regardless of which phenotypes subset is requested. Use the per-phenotype `SeedSequence.spawn` pattern described in RESEARCH.md §5 and Decision 111 (4-way spawn for trial generator).

Also update `configs/pat_rl.yaml` to `n_participants_per_phenotype: 40`, update the SLURM smoke defaults, and add multi-phenotype determinism tests. Plan 20-04 already added the `phenotype` column and ε₂-coupled ΔHR generator; this plan wires the multi-phenotype loop around it.

Purpose: SC5 (cohort scale) is a Phase 20 scientific necessity — the PRL-V1/V2 gates (Plan 20-07) require 160 agents to hit the Cohen's d ≥ 0.5 + r ≥ 0.7 statistical thresholds. Without this cohort size, the separability gate is underpowered.
Output: simulate_patrl_cohort produces a 160-row cohort (40 per phenotype × 4 phenotypes) deterministically; SLURM smoke defaults to this scale; tests prove the determinism.
</objective>

<execution_context>
@.claude/get-shit-done/workflows/execute-plan.md
@.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@.planning/PROJECT.md
@.planning/ROADMAP.md
@.planning/phases/20-patrl-scientific-completion/20-RESEARCH.md
@.planning/phases/20-patrl-scientific-completion/20-01-SUMMARY.md
@.planning/phases/20-patrl-scientific-completion/20-04-SUMMARY.md

@configs/pat_rl.yaml
@src/prl_hgf/env/pat_rl_simulator.py
@scripts/12_smoke_patrl_foundation.py
@cluster/patrl_smoke.slurm
@tests/test_pat_rl_simulator.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Update configs/pat_rl.yaml cohort size to 40</name>
  <files>configs/pat_rl.yaml</files>
  <action>
    Edit `configs/pat_rl.yaml`:

    Line 72 (current `n_participants_per_phenotype: 8`): change to:
    ```yaml
    n_participants_per_phenotype: 40   # SC5: 4 phenotypes × 40 = 160 agents
    ```

    Update the surrounding comment: replace "4 phenotypes x 8 = 32 for V1/V2" with "4 phenotypes × 40 = 160 agents for PRL-V1/V2 formal gates (Phase 20-07)".

    Do NOT change any other fields. Plan 20-01 already updated contingencies/run_order/magnitudes/phenotype priors.
  </action>
  <verify>
    Run: `python -c "from prl_hgf.env.pat_rl_config import load_pat_rl_config; c = load_pat_rl_config(); assert c.simulation.n_participants_per_phenotype == 40; print('OK')"`.
  </verify>
  <done>
    - n_participants_per_phenotype = 40 in YAML
    - load_pat_rl_config() returns this value
  </done>
</task>

<task type="auto">
  <name>Task 2: Refactor simulate_patrl_cohort for multi-phenotype loop + per-phenotype SeedSequence</name>
  <files>src/prl_hgf/env/pat_rl_simulator.py</files>
  <action>
    Refactor `simulate_patrl_cohort` to iterate over multiple phenotypes deterministically. This replaces Plan 20-04's single-phenotype variant while preserving backward compatibility.

    1. **New signature** (extends Plan 20-04's):
       ```python
       def simulate_patrl_cohort(
           n_participants: int | None = None,   # if None, use config.simulation.n_participants_per_phenotype
           level: int = 2,
           master_seed: int | None = None,
           config: PATRLConfig | None = None,
           phenotypes: list[str] | None = None,  # if None, use all 4; backward compat: accept a str
           phenotype_name: str | None = None,    # legacy from 20-04; if set, treated as phenotypes=[name]
       ) -> tuple[pd.DataFrame, dict[str, dict[str, float]], dict[str, list[PATRLTrial]]]:
       ```

       If `phenotype_name` (legacy) is passed, convert it to `phenotypes=[phenotype_name]` — emit a DeprecationWarning pointing users to `phenotypes=[...]`.

       If `phenotypes is None`, default to `list(config.simulation.phenotypes.keys())` — all 4.

       If `n_participants is None`, use `config.simulation.n_participants_per_phenotype` per phenotype. If it IS passed, use it as the count PER PHENOTYPE (semantic clarification; Plan 20-04's single-phenotype interpretation collapses gracefully).

       If `master_seed is None`, use `config.simulation.master_seed`.

    2. **Per-phenotype SeedSequence spawn** (RESEARCH.md §5):
       ```python
       if master_seed is None:
           master_seed = config.simulation.master_seed
       if phenotypes is None:
           phenotypes = list(config.simulation.phenotypes.keys())
       if n_participants is None:
           n_participants = config.simulation.n_participants_per_phenotype

       ss = np.random.SeedSequence(master_seed)
       phenotype_seeds = ss.spawn(len(phenotypes))
       ```
       The `phenotype_seeds` list is deterministic in the ORDER of `phenotypes`. So `phenotypes=['healthy']` and `phenotypes=['healthy','anxious']` both spawn the same first SeedSequence (for 'healthy'), producing identical healthy-phenotype participants in both runs. This is the key determinism property.

    3. **Inner participant loop** — within each phenotype, use a second spawn level:
       ```python
       all_rows: list[dict] = []
       true_params: dict[str, dict[str, float]] = {}
       trials_by_participant: dict[str, list[PATRLTrial]] = {}
       global_pid_counter = 0  # P000...P159 across all phenotypes

       for ph_idx, (phenotype_name, ph_ss) in enumerate(zip(phenotypes, phenotype_seeds, strict=True)):
           phenotype = config.simulation.phenotypes[phenotype_name]
           child_seeds = ph_ss.spawn(n_participants)
           for local_i, child_ss in enumerate(child_seeds):
               pid = f"P{global_pid_counter:03d}"
               global_pid_counter += 1
               # ... existing participant inner loop from Plan 20-04 ...
               # ... with phenotype = current phenotype (not 'healthy' hardcoded) ...
       ```

    4. **Preserve all Plan 20-04 behavior**: ε₂-coupled ΔHR generation (per phenotype), phenotype column in every row, seed determinism, clipping to config.task.delta_hr_stub.bounds.

    5. **Preserve Phase 18/19 true_params structure**: each pid still maps to a dict with `omega_2`, `beta`, `b` (added in 20-02 — not yet generated from phenotype in 20-04, so add it here: `b_true = float(rng.normal(phenotype.b.mean, phenotype.b.sd))`), and `omega_3`/`kappa`/`mu3_0` for level=3.

    6. **Logging**: log per-phenotype counts at INFO level. Example:
       ```python
       logger.info(
           "simulate_patrl_cohort: %d phenotypes × %d agents = %d total",
           len(phenotypes), n_participants, len(phenotypes) * n_participants,
       )
       ```

    7. **Robustness**: if `phenotypes` contains a name not in `config.simulation.phenotypes`, raise `ValueError` listing available phenotypes.
  </action>
  <verify>
    Run: `python -c "
from prl_hgf.env.pat_rl_simulator import simulate_patrl_cohort
from prl_hgf.env.pat_rl_config import load_pat_rl_config
c = load_pat_rl_config()
df, tp, tbp = simulate_patrl_cohort(config=c, master_seed=42, n_participants=5)  # 5 per phenotype × 4 = 20
assert len(df['participant_id'].unique()) == 20, f'expected 20, got {len(df.participant_id.unique())}'
assert set(df['phenotype'].unique()) == {'healthy','anxious','reward_sensitive','anxious_reward_sensitive'}
print('multi-phenotype OK')
"`
  </verify>
  <done>
    - simulate_patrl_cohort produces 4 phenotypes × N agents = 4N participants when phenotypes=None
    - Per-phenotype SeedSequence spawn is used
    - phenotypes=['healthy'] still works and produces identical healthy participants as the multi-phenotype run
    - Legacy phenotype_name kwarg emits DeprecationWarning but still works
    - true_params contains 'b' for every participant
    - Logging reports per-phenotype counts
  </done>
</task>

<task type="auto">
  <name>Task 3: Update scripts/12_smoke_patrl_foundation.py for multi-phenotype</name>
  <files>scripts/12_smoke_patrl_foundation.py</files>
  <action>
    Edit `scripts/12_smoke_patrl_foundation.py`:

    1. Accept CLI args (or env vars) for `--phenotypes {healthy|anxious|reward_sensitive|anxious_reward_sensitive|all}` (default `all`) and `--n-participants-per-phenotype N` (default from config).

    2. Accept env vars `PRL_PATRL_SMOKE_N` (default 40) and `PRL_PATRL_SMOKE_PHENOTYPES` (default `all`) — these match the roadmap SC5 wording.

    3. If `PRL_PATRL_SMOKE_PHENOTYPES=all`, pass `phenotypes=None` to simulate_patrl_cohort (defaults to all 4). If a single name, pass `phenotypes=[name]`.

    4. Update logging to include per-phenotype participant counts after simulation.

    5. Preserve existing `--no-blackjax` / Laplace path and `--response-model` flag from Plan 20-02.

    6. If the smoke is invoked with the full 160-agent cohort on CPU, emit a warning that fitting will be slow and the smoke should be cluster-only; continue execution but set a default shorter n_draws/n_tune if not overridden.
  </action>
  <verify>
    Run: `PRL_PATRL_SMOKE_N=2 PRL_PATRL_SMOKE_PHENOTYPES=all python scripts/12_smoke_patrl_foundation.py --no-blackjax` — exit 0; 8 agents (2 × 4 phenotypes).

    Run: `PRL_PATRL_SMOKE_N=3 PRL_PATRL_SMOKE_PHENOTYPES=healthy python scripts/12_smoke_patrl_foundation.py --no-blackjax` — exit 0; 3 agents (healthy only).
  </verify>
  <done>
    - scripts/12 accepts --phenotypes and --n-participants-per-phenotype flags
    - PRL_PATRL_SMOKE_N / PRL_PATRL_SMOKE_PHENOTYPES env vars work
    - All 4 phenotypes default; filter to single phenotype works
    - blackjax-skip path still works
  </done>
</task>

<task type="auto">
  <name>Task 4: Update cluster/patrl_smoke.slurm defaults</name>
  <files>cluster/patrl_smoke.slurm</files>
  <action>
    Open `cluster/patrl_smoke.slurm` (create it if it doesn't exist; check `cluster/` for existing SLURM templates to mirror).

    Set SLURM defaults:
    ```bash
    # SC5: 40 agents × 4 phenotypes = 160 cohort for PRL-V1/V2 gates
    export PRL_PATRL_SMOKE_N=40
    export PRL_PATRL_SMOKE_PHENOTYPES=all
    ```

    If the file already exists with different defaults, update only the two env var assignments. Preserve the SBATCH directives (partition, time, memory, gpus if any) exactly.

    If the file does NOT exist, create a minimal SLURM script mirroring whichever existing `cluster/*.slurm` is most similar — the goal is to set the env vars and invoke:
    ```bash
    python scripts/12_smoke_patrl_foundation.py
    ```
    with the 160-agent default.

    Add a bash comment at the top citing Plan 20-05 and SC5.
  </action>
  <verify>
    Run: `grep -n "PRL_PATRL_SMOKE_N=40" cluster/patrl_smoke.slurm` — match found. Run: `grep -n "PRL_PATRL_SMOKE_PHENOTYPES=all" cluster/patrl_smoke.slurm` — match found.
  </verify>
  <done>
    - cluster/patrl_smoke.slurm has PRL_PATRL_SMOKE_N=40 PRL_PATRL_SMOKE_PHENOTYPES=all defaults
    - Invokes scripts/12 without additional args (relies on env)
    - Other SBATCH directives preserved
  </done>
</task>

<task type="auto">
  <name>Task 5: Multi-phenotype determinism tests</name>
  <files>tests/test_pat_rl_simulator.py</files>
  <action>
    Add to `tests/test_pat_rl_simulator.py`:

    1. `test_simulate_patrl_cohort_multi_phenotype_default_all_four` — call with `n_participants=3, phenotypes=None`; assert `len(df.participant_id.unique()) == 12`; assert all 4 phenotypes present.

    2. `test_simulate_patrl_cohort_determinism_across_phenotype_subsets` — key determinism test (L10 user-observable property):
       ```python
       # Run 1: all 4 phenotypes
       df_all, _, _ = simulate_patrl_cohort(n_participants=3, phenotypes=None, master_seed=7, config=c)
       # Run 2: healthy only
       df_h, _, _ = simulate_patrl_cohort(n_participants=3, phenotypes=['healthy'], master_seed=7, config=c)
       # The healthy participants in df_all must match df_h exactly.
       healthy_all = df_all[df_all.phenotype == 'healthy'].reset_index(drop=True)
       pd.testing.assert_frame_equal(healthy_all[['trial_idx','state','choice','delta_hr']],
                                     df_h[['trial_idx','state','choice','delta_hr']])
       ```

    3. `test_simulate_patrl_cohort_repeat_call_identical_choices` (L10 — additional user-observable anchor):
       ```python
       # Call the same function twice with identical args; assert 'choice' arrays identical.
       df_a, _, _ = simulate_patrl_cohort(n_participants=3, phenotypes=['healthy'], master_seed=42, config=c)
       df_b, _, _ = simulate_patrl_cohort(n_participants=3, phenotypes=['healthy'], master_seed=42, config=c)
       assert (df_a['choice'].to_numpy() == df_b['choice'].to_numpy()).all()
       ```

    4. `test_simulate_patrl_cohort_pid_naming` — assert global pid counter produces `P000`...`P011` for 3 agents × 4 phenotypes.

    5. `test_simulate_patrl_cohort_legacy_phenotype_name_kwarg` — call with `phenotype_name='healthy'`; assert DeprecationWarning is raised; assert result matches `phenotypes=['healthy']`.

    6. `@pytest.mark.slow` `test_simulate_patrl_cohort_full_160_scale` — call with `phenotypes=None` and `n_participants=40` (full production scale); assert `len(df.participant_id.unique()) == 160`; 40 per phenotype.

    7. `test_simulate_patrl_cohort_unknown_phenotype_raises` — call with `phenotypes=['nonexistent']`; assert ValueError.
  </action>
  <verify>
    Run: `pytest tests/test_pat_rl_simulator.py -v -k "multi_phenotype or determinism or legacy or unknown or repeat_call"`. Run slow: `pytest tests/test_pat_rl_simulator.py --run-slow -v -k "full_160_scale"`.
  </verify>
  <done>
    - 7 new tests pass (1 new repeat-call-identical-choices test added for L10 user-observable anchor)
    - Determinism across subsets is proven
    - Determinism across repeat calls with same args is proven
    - Full 160-agent scale runs in <1 min on CPU (simulation is pure numpy, no fitting)
    - Legacy kwarg still works with DeprecationWarning
  </done>
</task>

</tasks>

<verification>
  - `pytest tests/test_pat_rl_simulator.py -v --run-slow` — all pass including slow 160-agent test
  - `python -c "from prl_hgf.env.pat_rl_simulator import simulate_patrl_cohort; from prl_hgf.env.pat_rl_config import load_pat_rl_config; c = load_pat_rl_config(); df,_,_ = simulate_patrl_cohort(config=c); assert len(df.participant_id.unique()) == 160; print('160 OK')"`
  - `ruff check src/prl_hgf/env/pat_rl_simulator.py scripts/12_smoke_patrl_foundation.py tests/test_pat_rl_simulator.py` — clean
  - `grep PRL_PATRL_SMOKE_N=40 cluster/patrl_smoke.slurm` — match
  - Phase 18/19 + prior 20 plans regression: `pytest tests/test_env_pat_rl_config.py tests/test_models_patrl.py tests/test_hierarchical_patrl.py tests/test_fit_vb_laplace_patrl.py -v` — clean
</verification>

<success_criteria>
  - SC5 complete: 40 × 4 = 160 agents via simulate_patrl_cohort with all 4 phenotypes populated
  - Per-phenotype SeedSequence spawn pattern documented in simulator + RESEARCH.md §5
  - Determinism across phenotype subsets verified by test
  - User-observable determinism (L10) verified: identical args → identical choices; subset request → identical subset rows
  - SLURM smoke defaults updated (PRL_PATRL_SMOKE_N=40 PRL_PATRL_SMOKE_PHENOTYPES=all)
  - Backwards compatibility preserved (legacy phenotype_name kwarg + single-phenotype caller pattern)
</success_criteria>

<output>
Create `.planning/phases/20-patrl-scientific-completion/20-05-SUMMARY.md` with: (a) new simulate_patrl_cohort signature, (b) SeedSequence spawn tree (master → 4 phenotype → 40 per phenotype), (c) cohort scale verification output, (d) cluster smoke command for M3/MASSIVE, (e) evidence of L10 user-observable determinism tests passing (identical-args-identical-choices + subset-consistent-with-full).
</output>
