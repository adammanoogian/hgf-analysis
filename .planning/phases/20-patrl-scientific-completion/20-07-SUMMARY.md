---
phase: 20
plan: "07"
subsystem: validation-gates
tags:
  - prl-v1
  - prl-v2
  - parameter-recovery
  - phenotype-separability
  - cohens-d
  - SC9
  - SC11
  - option-a-factorial
dependency-graph:
  requires:
    - 20-01  # config + loader
    - 20-02  # models A/B/C
    - 20-03  # model D
    - 20-04  # epsilon2 simulator
    - 20-05  # cohort 40x4
    - 20-06  # stratified BMS + PEB
  provides:
    - PRL-V1 gate logic (r >= 0.7 for omega_2/kappa/beta)
    - PRL-V2 gate logic (Cohen's d + correlation, Option A factorial)
    - SC9 audit test (no new scripts)
    - SC11 regression gate test
  affects:
    - Sister-repo PEB consumer (peb_covariates.csv schema, delta_f convention)
    - Phase 21 (benchmark; consumes same idata layout)
tech-stack:
  added:
    - cohens_d (pooled-SD helper in effect_sizes.py)
  patterns:
    - Option A 2x2 factorial axis mask as frozenset module constants
    - Exit codes 0/1/2 (Decision 148) in scripts/05 + scripts/06
    - exploratory=True + passes_threshold=pd.NA (Decision 141)
key-files:
  created:
    - tests/test_validation_gates_patrl.py
    - .planning/phases/20-patrl-scientific-completion/20-07-SUMMARY.md
  modified:
    - scripts/05_run_validation.py
    - scripts/06_group_analysis.py
    - src/prl_hgf/analysis/recovery.py (Task 1 — commit 26b8d7a)
    - src/prl_hgf/analysis/effect_sizes.py
decisions:
  - "PRL-V2 axis mapping: Option A (2x2 factorial). User approved 2026-04-19."
  - "Default fit-method for PRL-V1/V2: Laplace (NUTS deferred post-Phase-14-15). User directive 2026-04-19."
  - "SC9/SC11/Option A axis mask tests operationalised as pytest assertions."
metrics:
  duration: "~45 min"
  completed: "2026-04-19"
---

# Phase 20 Plan 07: Validation Gates PRL-V1/V2 Summary

One-liner: PRL-V1 recovery gate (r>=0.7) + PRL-V2 phenotype separability gate (Cohen's d>=0.5, Option A factorial) wired into scripts/05 and scripts/06 with SC9/SC11 audit tests.

## Commits

| Hash      | Message                                                                      | Files                                                  |
|-----------|------------------------------------------------------------------------------|--------------------------------------------------------|
| `26b8d7a` | feat(20-07): extend recovery.py with compute_recovery_metrics_patrl          | `src/prl_hgf/analysis/recovery.py`                    |
| `6bc6ef7` | feat(20-07): extend scripts/05_run_validation.py with --task=patrl + PRL-V1  | `scripts/05_run_validation.py`                         |
| `58bf158` | feat(20-07): extend scripts/06_group_analysis.py with --task=patrl phenotype_separability (Option A) | `scripts/06_group_analysis.py`, `src/prl_hgf/analysis/effect_sizes.py` |
| `5bb59cf` | test(20-07): integration + SC9/SC11 audits + axis mask regression tests      | `tests/test_validation_gates_patrl.py`                 |

## CLI Surface

### scripts/05_run_validation.py --help (new args)

```
--task {prl,patrl}         Task: 'prl' = pick_best_cue (default); 'patrl' = PRL-V1 gate
--fit-method {laplace,nuts} Fitting back-end for --task=patrl (default: laplace)
--r-threshold FLOAT         Pearson r threshold for PRL-V1 primary params (default: 0.7)
```

**Default `--task=prl` path unchanged** (backward compatible).

### scripts/06_group_analysis.py --help (new args)

```
--task {prl,patrl}                                     Task (default: prl)
--analysis {group_interaction,phenotype_separability}  Analysis (default: group_interaction)
--fit-method {laplace,nuts}                            Fitting back-end (default: laplace)
--sim-path SIM_PATH                                    PAT-RL sim_df path
--idata-dir IDATA_DIR                                  PAT-RL idata directory
```

**Default `--task=prl --analysis=group_interaction` path unchanged** (backward compatible).

## Gate Formulas and Thresholds

### PRL-V1 Gate (scripts/05 --task=patrl)

```
Pearson r >= 0.7  for:  omega_2 (primary)
                        kappa   (primary)
                        beta    (primary)

omega_3, mu3_0  →  reported but NOT gated (exploratory=True, passes_threshold=pd.NA)
                   Per Decision 141 / Phase 9-01 precedent
```

### PRL-V2 Gate (scripts/06 --task=patrl --analysis=phenotype_separability)

**Option A (2x2 factorial) — user approved 2026-04-19:**

```
ANXIETY_HIGH = {high_anxiety, anxious_reward}   (80 agents)
ANXIETY_LOW  = {healthy, reward_susceptible}    (80 agents)
REWARD_HIGH  = {reward_susceptible, anxious_reward} (80 agents)
REWARD_LOW   = {healthy, high_anxiety}          (80 agents)

Primary gate criteria (ALL must pass):
  d(omega_2 | ANXIETY_HIGH vs ANXIETY_LOW) >= 0.5
  d(beta    | REWARD_HIGH  vs REWARD_LOW ) >= 0.5
  |cor(omega_2, beta)| across all 160 agents  < 0.5

Supplementary (reported as pairwise rows, NOT gated):
  d(omega_2 | high_anxiety vs healthy)
  d(beta    | reward_susceptible vs healthy)

Output: phenotype_separability_summary.csv with contrast_type column
        ('factorial' = gated rows; 'pairwise' = supplementary)
```

Cohen's d formula (pooled SD, `src/prl_hgf/analysis/effect_sizes.cohens_d`):

```python
pooled_sd = sqrt(((n1-1)*s1^2 + (n2-1)*s2^2) / (n1+n2-2))
d = (mean_high - mean_low) / pooled_sd
```

## PRL-V1 and PRL-V2 Numeric Results

**STATUS: WIRED; cluster-deferred.**

The gate logic is fully implemented and tested with synthetic data.  Numeric
validation against the full 160-agent cohort (40×4 phenotypes) requires:

1. **Simulate** 160 agents:
   ```
   conda run -n ds_env python scripts/03_simulate_participants.py --task=patrl
   # or: sbatch cluster/patrl_smoke.slurm  (PRL_PATRL_SMOKE_N=40, PHENOTYPES=all)
   ```

2. **Fit** via Laplace:
   ```
   conda run -n ds_env python scripts/12_smoke_patrl_foundation.py \
       --fit-method laplace --n 40 --all-models
   # or: sbatch cluster/patrl_smoke.slurm
   ```

3. **PRL-V1 gate** (parameter recovery):
   ```
   conda run -n ds_env python scripts/05_run_validation.py \
       --task=patrl \
       --sim-path results/patrl/sim_df.csv \
       --idata-dir results/patrl/idata \
       --fit-method laplace
   ```
   Output: `results/patrl/validation/patrl_recovery_metrics.csv`

4. **PRL-V2 gate** (phenotype separability):
   ```
   conda run -n ds_env python scripts/06_group_analysis.py \
       --task=patrl --analysis=phenotype_separability \
       --sim-path results/patrl/sim_df.csv \
       --idata-dir results/patrl/idata \
       --fit-method laplace
   ```
   Output: `results/patrl/group_analysis/phenotype_separability_summary.csv`

**Laplace β width caveat (OQ7 closure):** Laplace posterior MEANS agree with
NUTS on ω₂ (4/5 within 0.06 in Phase 19 cluster smoke).  However Laplace
over-estimates β posterior SD by ~180% (log→natural transform artifact).  This
affects HDI-sensitive downstream (PEB, model comparison), but NOT the PRL-V2
gate which uses posterior MEANS only.  Revisit after Phase 14-15 cluster NUTS
run.

## SC9 Audit Output

```
git diff --name-status b040c3f..HEAD -- scripts/

M	scripts/05_run_validation.py
M	scripts/06_group_analysis.py
M	scripts/12_smoke_patrl_foundation.py
```

**Result: SC9 GREEN** — zero `A` lines.  Only modifications, no new files.
`scripts/12` was modified in an earlier Phase 20 plan (20-02); 20-07 modified
only `scripts/05` and `scripts/06`.

## SC11 Regression Count

**Full suite run at plan close (2026-04-19):**

```
pytest tests/test_bms.py tests/test_env_pat_rl_config.py
       tests/test_models_patrl.py tests/test_pat_rl_simulator.py
       tests/test_hierarchical_patrl.py tests/test_fit_vb_laplace_patrl.py
       tests/test_smoke_patrl_foundation.py tests/test_validation_gates_patrl.py -v

Result: 111 passed, 5 skipped, 13 deselected (173.79s)
```

5 skipped = blackjax not installed in local `ds_env` (expected; cluster-only).

**SC11 GREEN — 111/111 pass.**

## Deviations from Plan

### Auto-fixed

1. **[Rule 2 - Missing Critical] TYPE_CHECKING guard for type-annotation-only imports in scripts/06**
   - Found during: Task 4
   - Issue: scripts/06 uses `from typing import TYPE_CHECKING` with no actual forward-ref usages (dead import added to satisfy future annotation expansion)
   - Fix: Removed the dead `if TYPE_CHECKING: pass` block in final version — ruff clean
   - Files: `scripts/06_group_analysis.py`

2. **[Rule 1 - Bug] Ruff SIM300 "Yoda condition" in test assertions**
   - Found during: Task 5 ruff check
   - Issue: 4 `assert mod.CONSTANT == frozenset(...)` assertions had literal on right side (SIM300)
   - Fix: `ruff check --fix` swapped to `assert frozenset(...) == mod.CONSTANT`
   - Files: `tests/test_validation_gates_patrl.py`

### No other deviations — plan executed as written.

## Decisions Made

| Decision | Rationale | Phase |
|----------|-----------|-------|
| PRL-V2 axis mapping: Option A (2x2 factorial) — ANXIETY_HIGH={high_anxiety, anxious_reward}, etc. | User approved 2026-04-19; standard in anxiety×reward-sensitivity approach-avoidance literature (Klaassen 2024) | 20-07 |
| Default fit-method for PRL-V1 + PRL-V2: Laplace | NUTS deferred to post-Phase-14-15; Laplace means agree with NUTS (Phase 19 cluster smoke OQ7 closure); over-wide β posterior does not affect gate means | 20-07 |
| SC9/SC11/Option A axis mask tests as pytest assertions | Operationalises must_haves as grep-discoverable, CI-runnable checks | 20-07 |
| cohens_d added to effect_sizes.py (pooled SD, no pingouin dep) | PAT-RL path needs NumPy-only computation; pingouin is only needed for pick_best_cue path | 20-07 |
| frozenset for axis mask constants | Immutable; set semantics for `isin()` compatibility; clearly communicates "unordered membership" | 20-07 |

## Next Phase Readiness

### Blockers
- None for Phase 20 wave completion.

### Followup TODOs

1. **Cluster 160-agent PRL-V1 numeric run** — `sbatch cluster/patrl_smoke.slurm` (PRL_PATRL_SMOKE_N=40, PHENOTYPES=all) + `scripts/05_run_validation.py --task=patrl`.  Required before gating on actual r values.

2. **Post-Phase-14-15 NUTS re-run** — compare Laplace vs NUTS gate results at 160 agents to quantify Laplace mean accuracy at full cohort scale.

3. **Laplace β width overestimation (OQ7)** — flagged as "revisit post-Phase-14-15" caveat.  Does NOT block PRL-V1/V2 gates (which use posterior means).  Blocks any uncertainty-quantification analysis (HDI, PEB covariance).

4. **delta_f sign convention (Plan 20-06 note)** — `delta_f = delta_waic` (unscaled proxy); exact scaling is consumer-dependent.  Confirm at manuscript-prep before submitting PEB results to sister repo.

5. **peb_covariates.csv + phenotype_stratified_bms.csv** — these are generated by `scripts/06 --analysis=phenotype_separability` only when both 2-level and 3-level idata exist.  Production generation deferred to cluster run.
