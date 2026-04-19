---
phase: 20-patrl-scientific-completion
plan: "05"
subsystem: pat-rl-simulation
tags: [simulation, cohort-scale, seedsequence, determinism, phenotype]
requires: [20-01, 20-04]
provides:
  - "simulate_patrl_cohort multi-phenotype loop (40 × 4 = 160 agents)"
  - "per-phenotype SeedSequence spawn pattern"
  - "PRL_PATRL_SMOKE_N=40 PRL_PATRL_SMOKE_PHENOTYPES=all SLURM defaults"
affects: [20-06, 20-07]
tech-stack:
  added: []
  patterns:
    - "SeedSequence.spawn(len(phenotypes)) → per-phenotype child seeds → per-participant grandchild seeds"
    - "Subset determinism: spawn index = position in phenotypes list → healthy always gets seed[0]"
key-files:
  created:
    - cluster/patrl_smoke.slurm
  modified:
    - configs/pat_rl.yaml
    - src/prl_hgf/env/pat_rl_simulator.py
    - scripts/12_smoke_patrl_foundation.py
    - tests/test_pat_rl_simulator.py
decisions:
  - id: 165
    text: "Per-phenotype SeedSequence spawn: ss.spawn(len(phenotypes)) gives each phenotype its own child SS; each phenotype's SS then spawns n_per_phenotype grandchild seeds. Order-dependent: phenotypes=['healthy'] index 0 == phenotypes=None index 0 → subset determinism guaranteed."
  - id: 166
    text: "n_participants_per_phenotype=40 default in configs/pat_rl.yaml (SC5); total cohort 40×4=160 agents. Old default was 8."
  - id: 167
    text: "phenotypes=None → all 4 from config.simulation.phenotypes.keys() (insertion order). Passing phenotypes=['healthy'] produces identical healthy rows as full-cohort run (L10 property)."
  - id: 168
    text: "SLURM env var defaults: PRL_PATRL_SMOKE_N=40 PRL_PATRL_SMOKE_PHENOTYPES=all in cluster/patrl_smoke.slurm (Plan 20-05 SC5). cluster/18_smoke_patrl_cpu.slurm left at N=5 to preserve prior smoke outputs."
  - id: 169
    text: "b_true added to true_params for all participants in simulate_patrl_cohort (b ~ N(phenotype.b.mean, phenotype.b.sd)); was missing in Plan 20-04."
  - id: 170
    text: "Stochastic avoid not wired into simulator choice loop (deferred). Simulator records choices from Model A softmax (EV_approach vs 0); avoid outcome contingency is stored in config and consumed by logp path (Plans 20-02/20-03). No change needed for SC5 cohort scale."
metrics:
  duration: "28 minutes"
  completed: "2026-04-19"
---

# Phase 20 Plan 05: Cohort Scale 40×4 with Per-Phenotype SeedSequence Summary

**One-liner:** Scale simulate_patrl_cohort to 40-agent × 4-phenotype = 160-agent cohort via per-phenotype SeedSequence spawn with guaranteed subset determinism (L10).

## Tasks Completed

| Task | Name | Commit | Key Files |
|------|------|--------|-----------|
| 1 | Bump n_participants_per_phenotype to 40 | `5861fe4` | configs/pat_rl.yaml |
| 2 | Multi-phenotype loop + SeedSequence spawn | `990390f` | src/prl_hgf/env/pat_rl_simulator.py, tests/test_pat_rl_simulator.py |
| 3 | Smoke script multi-phenotype CLI + env vars | `6012114` | scripts/12_smoke_patrl_foundation.py |
| 4 | SLURM patrl_smoke.slurm with SC5 defaults | `0b6f495` | cluster/patrl_smoke.slurm |
| 5 | Multi-phenotype determinism tests | `6e596b8` | tests/test_pat_rl_simulator.py |

## New simulate_patrl_cohort Signature

```python
def simulate_patrl_cohort(
    n_participants: int | None = None,      # per phenotype; None → from config (40)
    level: int = 2,
    master_seed: int | None = None,          # None → from config.simulation.master_seed
    config: PATRLConfig | None = None,       # None → fresh load_pat_rl_config()
    phenotypes: list[str] | None = None,     # None → all 4 from config
    phenotype_name: str | None = None,       # DEPRECATED (Plan 20-04 legacy)
    response_model: str = "model_a",
    lam_true: float | None = None,
) -> tuple[pd.DataFrame, dict[str, dict[str, float]], dict[str, list[PATRLTrial]]]:
```

## SeedSequence Spawn Tree (Decision 165)

```
SeedSequence(master_seed)
├── spawn(len(phenotypes))          # one SS per phenotype, ORDER-DEPENDENT
│   ├── [0] healthy_ss
│   │   └── spawn(n_per_phenotype)  # P000..P039
│   │       ├── child_ss[0] → P000
│   │       ├── child_ss[1] → P001
│   │       └── ...
│   ├── [1] reward_sensitive_ss
│   │   └── spawn(n_per_phenotype)  # P040..P079
│   ├── [2] anxious_ss
│   │   └── spawn(n_per_phenotype)  # P080..P119
│   └── [3] anxious_reward_sensitive_ss
│       └── spawn(n_per_phenotype)  # P120..P159
```

Key determinism property: `spawn(1)` for `['healthy']` returns the same first
child as `spawn(4)` for all phenotypes — so calling with `phenotypes=['healthy']`
produces IDENTICAL healthy-phenotype rows as the full 160-agent run.

## Cohort Scale Verification

```
# Full cohort
>>> df, tp, _ = simulate_patrl_cohort(config=c)
>>> len(df['participant_id'].unique())
160
>>> df.groupby('phenotype')['participant_id'].nunique()
phenotype
anxious                      40
anxious_reward_sensitive     40
healthy                      40
reward_sensitive             40
dtype: int64
```

## L10 User-Observable Determinism Tests

### Test 1: Repeat-call identical choices

```python
df_a, _, _ = simulate_patrl_cohort(n_participants=3, phenotypes=['healthy'], master_seed=42, config=c)
df_b, _, _ = simulate_patrl_cohort(n_participants=3, phenotypes=['healthy'], master_seed=42, config=c)
np.testing.assert_array_equal(df_a['choice'].values, df_b['choice'].values)
# PASSED
```

### Test 2: Subset consistent with full cohort

```python
df_all, _, _ = simulate_patrl_cohort(n_participants=3, phenotypes=None, master_seed=7, config=c)
df_h, _, _ = simulate_patrl_cohort(n_participants=3, phenotypes=['healthy'], master_seed=7, config=c)
healthy_all = df_all[df_all.phenotype == 'healthy'].reset_index(drop=True)
pd.testing.assert_frame_equal(healthy_all[['trial_idx','state','choice','delta_hr']],
                               df_h[['trial_idx','state','choice','delta_hr']])
# PASSED
```

## Test Results

| Test Suite | Passed | Skipped | Deselected |
|---|---|---|---|
| tests/test_pat_rl_simulator.py (fast) | 20 | 0 | 1 (slow) |
| tests/test_pat_rl_simulator.py::full_160_scale (slow) | 1 | 0 | 0 |
| tests/test_env_pat_rl_config.py | included in regression | - | - |
| tests/test_models_patrl.py | included in regression | - | - |
| tests/test_hierarchical_patrl.py | included in regression | - | - |
| tests/test_fit_vb_laplace_patrl.py | included in regression | - | - |
| tests/test_smoke_patrl_foundation.py | included in regression | - | - |
| **Full regression suite** | **87 passed** | **5 skipped** | **11 deselected** |

Skipped = blackjax not in dev env (expected). Deselected = slow tests.

## 160-Agent Simulation Timing

Full 160-agent cohort (40 × 4 phenotypes, level=2):
- Local CPU wall time: **~61 seconds** (measured in slow test)
- No fitting involved — pure NumPy HGF forward pass
- SLURM cluster estimate: similar (~60-90 s depending on Lustre I/O)
- Fitting (NUTS + Laplace) at this scale: cluster/patrl_smoke.slurm default
  8h wall time allocation is generous; Laplace path takes ~10-30 min at 160 agents

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Existing tests assumed single-phenotype default**

- **Found during:** Task 2 verification
- **Issue:** 8 existing tests called `simulate_patrl_cohort(n_participants=N, ...)` without `phenotypes` arg. After the signature change, these would return 4× more rows (all 4 phenotypes), breaking shape assertions and `phenotype.unique() == {'healthy'}` checks.
- **Fix:** Added `phenotypes=['healthy']` explicitly to all affected existing tests. This preserves the original test intent (single-phenotype shape contract) while being explicit about the new behavior.
- **Files modified:** `tests/test_pat_rl_simulator.py`
- **Commit:** `990390f`

**2. [Rule 2 - Missing Critical] b_true missing from true_params in Plan 20-04**

- **Found during:** Task 2 implementation
- **Issue:** The old simulator produced `true_params` with only `omega_2`, `beta` (and optionally `omega_3`, `kappa`, `mu3_0`, `lam`). The `b` response bias parameter (added to phenotype YAML in Plan 20-01, added to models in Plan 20-02) was never generated in the simulator.
- **Fix:** Added `b_true = float(rng.normal(phenotype.b.mean, phenotype.b.sd))` and stored it in `true_params`. This is required for PRL-V1 parameter recovery validation (Plan 20-07).
- **Files modified:** `src/prl_hgf/env/pat_rl_simulator.py`
- **Commit:** `990390f`

**3. [Rule 1 - Bug] Ruff B007 for unused loop variables `ph_idx`, `local_i`**

- **Found during:** Ruff check after Task 2 implementation
- **Fix:** Renamed to `_ph_idx`, `_local_i` (underscore-prefix convention for unused variables).
- **Commit:** `990390f`

### Decisions Not in Plan

**Stochastic avoid handling:** The simulator's choice loop uses `EV_approach vs EV_avoid=0` with Model A softmax. Stochastic avoid outcomes (P(reward|avoid)=0.10, etc.) are stored in `configs/pat_rl.yaml::contingencies.avoid` and consumed by the logp path (Plans 20-02/20-03) but NOT wired into the simulator's generative choice sampling. This is intentional — it matches the Phase 18/19 design: the simulator generates choices via softmax over belief trajectories; the stochastic outcome generation for avoid trials happens at the logp level. No change needed for SC5 cohort scale. Followup TODO: wire stochastic avoid outcome generation into `simulate_patrl_cohort` if ground-truth outcome sequences are needed for future validation comparisons.

## Parallel-Stack Invariant

Verified: `git diff --stat src/prl_hgf/fitting/hierarchical.py src/prl_hgf/env/task_config.py src/prl_hgf/env/simulator.py src/prl_hgf/models/hgf_2level.py src/prl_hgf/models/hgf_3level.py src/prl_hgf/models/response.py configs/prl_analysis.yaml` is EMPTY. Zero changes to pick_best_cue stack.

## Cluster Smoke Command

```bash
# On M3/MASSIVE — production 160-agent all-phenotype NUTS+Laplace smoke:
sbatch cluster/patrl_smoke.slurm

# Quick local test (2 agents per phenotype, Laplace only):
PRL_PATRL_SMOKE_N=2 PRL_PATRL_SMOKE_PHENOTYPES=all \
  python scripts/12_smoke_patrl_foundation.py --no-blackjax --dry-run
```

## Next Phase Readiness

- Plan 20-06 (stratified BMS + PEB export): can consume `sim_df` with `phenotype` column and 160 agents directly.
- Plan 20-07 (PRL-V1/V2 validation gates): 160-agent cohort at 40/phenotype meets the Cohen's d ≥ 0.5 power threshold.
- Plan 20-08 (citation replacement): no dependency on this plan.
