# Phase 10: Core Power Modules and Sweep - Research

**Researched:** 2026-04-07
**Domain:** BFDA power sweep, JZS Bayes Factors, BMS discriminability, SLURM grid orchestration
**Confidence:** HIGH (all findings verified directly from codebase and official pingouin docs)

## Summary

Phase 10 is primarily a wiring problem: all underlying machinery exists and is
proven. The simulate-fit-recover loop (Phase 3–6), BMS (Phase 6), and parquet
infrastructure (Phase 8) are fully tested. What is missing is the function that
calls them in the right order, computes JZS Bayes Factors on the resulting
contrast, and writes one parquet row per SLURM task.

The work splits into two new source files:

1. `src/prl_hgf/power/iteration.py` — the callable core: `run_power_iteration()`
   that accepts a resolved `(n_per_group, effect_size_delta, iteration, rng)` and
   returns a filled 13-column dict ready for `write_parquet_row`.

2. An update to `scripts/08_run_power_iteration.py` to replace the stub with a
   real call to `run_power_iteration()`.

Three genuine design decisions the planner must resolve:

- **Contrast computation**: `compute_batch_waic` expects wide columns
  (`reward_c0`, `reward_c1`) that `simulate_batch` does not produce — see the
  BMS mismatch pitfall below. The power module must either convert the sim_df
  or call `compute_subject_waic` directly.
- **Schema row semantics**: the 13-column schema writes ONE row per SLURM task
  (not one row per parameter). `parameter` = "omega_2" (the primary parameter),
  `bf_value` is for omega_2's contrast, `bms_xp` is the XP for the true model
  from the BMS run, `bms_correct` = XP > 0.75.
- **Grid mapping**: task_id maps to (n, d, iteration) via flat arithmetic index
  — no CSV needed.

**Primary recommendation:** Build `run_power_iteration()` in `power/iteration.py`
that wraps the existing pipeline. Do not touch `simulate_batch`, `fit_batch`,
`run_group_bms`, or `write_parquet_row` — call them directly. The only new
computation is the contrast extraction and JZS BF call.

## Standard Stack

All required libraries are already installed. Zero new dependencies.

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| pingouin | >=0.5.5 | `bayesfactor_ttest` for JZS BF | Already in project; validated vs JASP |
| scipy.stats | project baseline | `ttest_ind` to get t-statistic | Already used in `analysis/recovery.py` |
| pandas | project baseline | sim_df manipulation, pivot | Used throughout |
| numpy | project baseline | array ops for contrasts | Used throughout |

### Supporting (already in project)
| Module | API | Purpose |
|--------|-----|---------|
| `prl_hgf.simulation.batch.simulate_batch` | `simulate_batch(config)` | Generate N participants |
| `prl_hgf.fitting.batch.fit_batch` | `fit_batch(sim_df, model_name, ..., return_idata=True)` | MCMC; `return_idata=True` for BMS path |
| `prl_hgf.analysis.bms.run_group_bms` | `run_group_bms(elpd_matrix, model_names)` | Random-effects BMS |
| `prl_hgf.analysis.bms.compute_subject_waic` | `compute_subject_waic(input_arr, obs_arr, choices_arr, idata, model)` | Per-participant WAIC |
| `prl_hgf.analysis.recovery.build_recovery_df` | `build_recovery_df(sim_df, fit_df)` | True vs fitted for recovery_r |
| `prl_hgf.analysis.recovery.compute_recovery_metrics` | `compute_recovery_metrics(recovery_df)` | Pearson r per param |
| `prl_hgf.power.config.make_power_config` | `make_power_config(base, n_per_group, effect_size_delta, master_seed)` | Frozen AnalysisConfig per grid cell |
| `prl_hgf.power.schema.write_parquet_row` | `write_parquet_row(row, path)` | Write 13-col parquet |
| `prl_hgf.power.seeds.make_child_rng` | `make_child_rng(master_seed, n_jobs, job_index)` | Independent per-task RNG |

**Installation:** No new packages required.

## Architecture Patterns

### Recommended Project Structure
```
src/prl_hgf/power/
├── __init__.py        # existing — update exports
├── config.py          # existing — unchanged
├── schema.py          # existing — unchanged
├── seeds.py           # existing — unchanged
├── precheck.py        # existing — unchanged
└── iteration.py       # NEW — run_power_iteration()

scripts/
└── 08_run_power_iteration.py  # MODIFY — wire in real pipeline

cluster/
└── 08_power_sweep.slurm       # MODIFY — update --array directive for full run
```

### Pattern 1: Grid Index Arithmetic (no CSV needed)

Map a flat `task_id` to `(n_per_group, effect_size_delta, iteration)` using pure
arithmetic. The YAML config supplies the grids; no external CSV is needed.

```python
# Source: grid defined in configs/prl_analysis.yaml power section
def decode_task_id(
    task_id: int,
    n_per_group_grid: list[int],
    effect_size_grid: list[float],
    n_iterations: int,
) -> tuple[int, float, int]:
    """Return (n_per_group, effect_size_delta, iteration_idx)."""
    n_d = len(effect_size_grid) * n_iterations
    n_idx = task_id // n_d
    d_idx = (task_id // n_iterations) % len(effect_size_grid)
    iter_idx = task_id % n_iterations
    return n_per_group_grid[n_idx], effect_size_grid[d_idx], iter_idx
```

For the PWR-04 grid (7 N levels × 3 d values × 200 iterations): total = 4200 jobs,
`--array=0-4199%50`.

Note: The current YAML `effect_size_grid` is `[0.0, 0.3, 0.5, 0.8, 1.0, 1.5]` and
`n_iterations=100`. The requirements specify d={0.3, 0.5, 0.7} and K=200. The YAML
must be updated to match requirements before submission.

### Pattern 2: run_power_iteration() Core Pipeline

```python
# Source: synthesized from existing pipeline modules
def run_power_iteration(
    base_config: AnalysisConfig,
    n_per_group: int,
    effect_size_delta: float,
    iteration: int,
    child_seed: int,
    power_config: PowerConfig,
) -> dict:
    """Run one BFDA iteration and return a 13-column result dict."""
    # 1. Build frozen config for this cell
    cfg = make_power_config(base_config, n_per_group, effect_size_delta, child_seed)

    # 2. Simulate
    sim_df = simulate_batch(cfg)

    # 3. Fit 3-level (BF path always uses 3-level as primary)
    fit_df, idata_3level = fit_batch(
        sim_df, "hgf_3level", return_idata=True,
        random_seed=child_seed, cores=1,
    )

    # 4. Extract omega_2 posterior means -> compute contrasts -> JZS BF
    bf_value, bf_exceeds = _compute_jzs_bf(fit_df, power_config.bf_threshold)

    # 5. BMS path: fit 2-level, compute WAIC, run BMS
    fit_df_2, idata_2level = fit_batch(
        sim_df, "hgf_2level", return_idata=True,
        random_seed=child_seed + 1, cores=1,
    )
    bms_xp, bms_correct = _compute_bms_power(
        sim_df, idata_3level, idata_2level
    )

    # 6. Recovery metrics
    recovery_r, n_divergences, mean_rhat = _extract_diagnostics(sim_df, fit_df)

    return {
        "sweep_type": "omega_2",
        "effect_size": effect_size_delta,
        "n_per_group": n_per_group,
        "trial_count": cfg.task.n_trials_total,
        "iteration": iteration,
        "parameter": "omega_2",
        "bf_value": bf_value,
        "bf_exceeds": bf_exceeds,
        "bms_xp": bms_xp,
        "bms_correct": bms_correct,
        "recovery_r": recovery_r,
        "n_divergences": n_divergences,
        "mean_rhat": mean_rhat,
    }
```

### Pattern 3: JZS BF from Posterior Means

Compute the difference-in-differences contrast per participant (using their per-session
posterior mean of omega_2), then call `scipy.stats.ttest_ind` and pass the t-statistic
to `pingouin.bayesfactor_ttest`.

```python
# Source: pingouin official docs (verified), scipy.stats API
import math
from scipy import stats
import pingouin as pg

def compute_jzs_bf(
    fit_df: pd.DataFrame,
    parameter: str = "omega_2",
    session_a: str = "post_dose",
    session_b: str = "baseline",
    r: float = math.sqrt(2) / 2,
) -> float:
    """Compute JZS BF10 for the group x session difference-in-differences.

    Returns BF10 (float). bf > r means evidence for H1.
    """
    wide = (
        fit_df[fit_df["parameter"] == parameter]
        .pivot_table(index=["participant_id", "group"], columns="session", values="mean")
        .reset_index()
    )
    wide["did"] = wide[session_a] - wide[session_b]

    psi = wide.loc[wide["group"] == "psilocybin", "did"].dropna().to_numpy()
    plc = wide.loc[wide["group"] == "placebo", "did"].dropna().to_numpy()

    if len(psi) < 2 or len(plc) < 2:
        return float("nan")

    t_val, _ = stats.ttest_ind(psi, plc, equal_var=False)
    bf = pg.bayesfactor_ttest(
        t=t_val,
        nx=len(psi),
        ny=len(plc),
        paired=False,
        alternative="two-sided",
        r=r,
    )
    return float(bf)
```

The three contrasts (PWR-05) use the same function with different session pairs:
- (a) `session_a="post_dose"`, `session_b="baseline"` — primary DiD
- (b) `session_a="followup"`, `session_b="baseline"` — baseline to followup
- (c) Linear trend: weighted sum `[-1, 0, 1] @ [baseline, post_dose, followup]`
  per participant, then compare two-sample. Requires computing the slope vector
  instead of a single session difference.

### Pattern 4: BMS Power Computation

```python
# Source: bms.py run_group_bms, compute_subject_waic
def _compute_bms_power(
    sim_df: pd.DataFrame,
    idata_3level: dict[tuple, az.InferenceData],
    idata_2level: dict[tuple, az.InferenceData],
) -> tuple[float, bool]:
    """Run BMS and return (xp_3level, xp_3level > 0.75)."""
    # Build input arrays per participant using fit_batch's _build_arrays pattern
    keys = sim_df[["participant_id", "group", "session"]].drop_duplicates()

    rows = []
    for _, row in keys.iterrows():
        pid, grp, sess = row["participant_id"], row["group"], row["session"]
        sub = sim_df[
            (sim_df["participant_id"] == pid)
            & (sim_df["group"] == grp)
            & (sim_df["session"] == sess)
        ].sort_values("trial")

        input_arr, obs_arr, choices_arr = _build_arrays_from_sim(sub)

        for model_name, idata_map in [("hgf_3level", idata_3level), ("hgf_2level", idata_2level)]:
            idata = idata_map.get((pid, grp, sess))
            if idata is None:
                continue
            elpd = compute_subject_waic(input_arr, obs_arr, choices_arr, idata, model_name)
            rows.append({"participant_id": pid, "model": model_name, "elpd_waic": elpd})

    waic_df = pd.DataFrame(rows)
    avg = waic_df.groupby(["participant_id", "model"])["elpd_waic"].mean().reset_index()
    pivot = avg.pivot(index="participant_id", columns="model", values="elpd_waic")
    pivot = pivot[["hgf_2level", "hgf_3level"]].dropna()

    bms = run_group_bms(pivot.to_numpy(), ["hgf_2level", "hgf_3level"])
    xp_3level = float(bms["xp"][1])  # index 1 = hgf_3level
    return xp_3level, xp_3level > 0.75
```

Note: `_build_arrays_from_sim` replicates `fit_batch._build_arrays` — this logic
should be extracted into a shared helper in `fitting/batch.py` or `power/iteration.py`.

### Pattern 5: Schema Row Semantics

One SLURM task writes exactly ONE parquet row (the 13-column schema).
- `parameter` = "omega_2" (primary contrast parameter)
- `bf_value` = BF10 for the DiD contrast on omega_2
- `bf_exceeds` = BF10 > `power_config.bf_threshold` (10.0)
- `bms_xp` = exceedance probability for hgf_3level from this iteration's BMS
- `bms_correct` = bms_xp > 0.75
- `recovery_r` = Pearson r for omega_2 in this iteration (from `compute_recovery_metrics`)
- `n_divergences` = total divergences across all participant MCMC fits
- `mean_rhat` = mean R-hat across all parameters and participants

### Anti-Patterns to Avoid

- **Multiple rows per SLURM task**: The schema is one row per task. Do not write
  one row per parameter (omega_2, kappa, etc.) — that multiplies file count by
  n_params and breaks the flat merge step.
- **Passing sim_df to compute_batch_waic directly**: `compute_batch_waic` expects
  columns `reward_c0/reward_c1/reward_c2/observed_c0/observed_c1/observed_c2/choice`
  but `simulate_batch` outputs `cue_chosen/reward`. Do not call `compute_batch_waic`
  with raw sim_df output without conversion.
- **Guessing task_id to grid mapping**: Always decode task_id deterministically
  from `(n_per_group_grid, effect_size_grid, n_iterations)` — not from a CSV file
  that must be pre-generated and distributed to the cluster.
- **Modifying base_config or power_config**: Both are frozen dataclasses. Only
  `make_power_config` returns a modified copy.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| JZS Bayes Factor | Custom BF integral | `pingouin.bayesfactor_ttest` | Validated vs JASP to within 0.1%; handles numerical integration correctly |
| Per-child RNG | Manual seed addition | `power.seeds.make_child_rng` | SeedSequence guarantees distinct state vectors; `seed + task_id` does not |
| BMS computation | Custom Dirichlet update | `analysis.bms.run_group_bms` | Rigoux 2014 algorithm; handles numerical edge cases |
| Parquet write | Raw `df.to_parquet` | `power.schema.write_parquet_row` | Schema enforcement catches missing/extra columns at write time |
| Config override | Mutating AnalysisConfig | `power.config.make_power_config` | Dataclass is frozen; replace() pattern is already implemented |

**Key insight:** The only genuinely new computation in Phase 10 is calling
`scipy.stats.ttest_ind` on posterior means and passing the t-statistic to
`pingouin.bayesfactor_ttest`. Everything else assembles existing modules.

## Common Pitfalls

### Pitfall 1: compute_batch_waic Column Name Mismatch

**What goes wrong:** `compute_batch_waic` (in `analysis/bms.py`) tries to read
`reward_c0`, `reward_c1`, `reward_c2`, `observed_c0`, `observed_c1`, `observed_c2`,
`choice` from `sim_df`. But `simulate_batch` produces `cue_chosen` and `reward`.
Calling `compute_batch_waic(sim_df, ...)` with raw sim_df raises a `KeyError`.

**Why it happens:** `compute_batch_waic` was designed for a different sim_df
format than what `simulate_batch` currently outputs.

**How to avoid:** In `power/iteration.py`, do not call `compute_batch_waic`.
Instead, call `compute_subject_waic` directly per participant after building the
input/observed/choices arrays using the same logic as `fit_batch._build_arrays`.
Extract `_build_arrays` into a shared helper function in `fitting/batch.py`
(making it importable) or duplicate it into `power/iteration.py`.

**Warning signs:** `KeyError: 'reward_c0'` during WAIC computation.

### Pitfall 2: YAML Power Grid Mismatch with Requirements

**What goes wrong:** `configs/prl_analysis.yaml` has `effect_size_grid: [0.0, 0.3, 0.5, 0.8, 1.0, 1.5]`
and `n_iterations: 100`. The requirements specify d={0.3, 0.5, 0.7} and K=200.
If the YAML is not updated, the sweep runs the wrong grid.

**Why it happens:** The YAML was a placeholder; requirements were finalized later.

**How to avoid:** Update YAML before submitting the full sweep:
```yaml
power:
  effect_size_grid: [0.3, 0.5, 0.7]
  n_iterations: 200
  n_jobs: 4200  # 7 * 3 * 200
```
Also update `--array=0-4199%50` in the SLURM script.

**Warning signs:** Grid has 6 d-values instead of 3; total jobs = 8400 instead of 4200.

### Pitfall 3: 8-Hour Wall Time Risk at N=50 with BMS

**What goes wrong:** At N=50, each job fits 2 groups × 50 participants × 3 sessions
= 300 participant-sessions. The BMS path doubles this to 600 total MCMC fits (both
models). At ~1.5 min/fit on GPU, that is ~15 hours — exceeding the 8-hour SLURM limit.

**Why it happens:** The BMS path (PWR-07) requires fitting both models to compute
WAIC. The 3-level model is slower than 2-level.

**How to avoid:**
- BF-only path (fit 3-level only): ~7.5h for N=50 — borderline within 8h limit.
- BMS path at N=50 requires either: (a) increasing `--time=16:00:00`, or (b)
  reducing MCMC settings for power runs (e.g., n_draws=500, n_tune=500, n_chains=2).
- For power analysis (many iterations), reduced MCMC settings are appropriate — the
  goal is estimating detection probability, not posterior precision.
- Recommended: n_chains=2, n_draws=500, n_tune=500 for power sweep jobs. Full
  settings (4 chains, 1000/1000) only for the real data analysis.

**Warning signs:** Jobs time out at SLURM task IDs corresponding to N=40 or N=50.

### Pitfall 4: idata Memory Accumulation

**What goes wrong:** With `return_idata=True`, `fit_batch` returns a dict holding
ArviZ InferenceData objects for all 300 participant-sessions. For 4 chains × 1000
draws × 5 parameters, each idata is ~50–100 MB. For 300 participants, total RAM is
15–30 GB. For the BMS path (two models), 30–60 GB total — approaching the 64 GB job
allocation.

**Why it happens:** All idata objects must be kept in memory simultaneously for
`compute_subject_waic` to run post-hoc WAIC evaluation.

**How to avoid:**
- Process WAIC computation incrementally: after fitting each participant, immediately
  compute WAIC and discard the idata. This requires calling `fit_participant` directly
  in a loop rather than `fit_batch`.
- Or: reduce MCMC draws (n_draws=500) which halves idata memory.
- Or: accept the 64 GB limit and monitor with `--mem=96G` for N=50 jobs.

**Warning signs:** `MemoryError` or OOM kill in cluster logs at large N.

### Pitfall 5: pingouin.bayesfactor_ttest Only Accepts Two-Sided Tests

**What goes wrong:** The function signature shows `alternative: str = 'two-sided'`
and the docs state it currently only supports `"two-sided"`. Passing `alternative="greater"`
raises an error or silently uses two-sided.

**Why it happens:** pingouin has not yet implemented one-sided JZS BF.

**How to avoid:** Always use `alternative="two-sided"` and `r=math.sqrt(2)/2`.
The two-sided BF10 is the correct quantity for BFDA.

**Warning signs:** Test of `bf_value` gives unexpected values when using directional
alternatives.

### Pitfall 6: BMS XP Extraction Index

**What goes wrong:** `run_group_bms` returns `xp` as a numpy array of length
`n_models`. The order matches `model_names` argument. If `model_names = ["hgf_2level",
"hgf_3level"]`, then `xp[0]` is the 2-level XP and `xp[1]` is 3-level. Swapping
order yields the wrong `bms_correct` boolean.

**Why it happens:** The model ordering is determined by the caller.

**How to avoid:** Always pass `model_names=["hgf_2level", "hgf_3level"]` to
`run_group_bms` and extract `bms["xp"][1]` for the true (3-level) model's XP.

## Code Examples

### JZS BF Computation (verified against official docs)

```python
# Source: pingouin docs (https://pingouin-stats.org/generated/pingouin.bayesfactor_ttest.html)
# Validated against JASP output per official docs
import math
from scipy import stats
import pingouin as pg

# Build DiD vectors from fit_df
wide = (
    fit_df[fit_df["parameter"] == "omega_2"]
    .pivot_table(
        index=["participant_id", "group"],
        columns="session",
        values="mean",
    )
    .reset_index()
)
wide["did"] = wide["post_dose"] - wide["baseline"]

psi = wide.loc[wide["group"] == "psilocybin", "did"].dropna().to_numpy()
plc = wide.loc[wide["group"] == "placebo", "did"].dropna().to_numpy()

t_stat, _ = stats.ttest_ind(psi, plc, equal_var=False)  # Welch t-test
bf10 = pg.bayesfactor_ttest(
    t=t_stat,
    nx=len(psi),
    ny=len(plc),
    paired=False,
    alternative="two-sided",
    r=math.sqrt(2) / 2,  # JZS default: sqrt(2)/2 = 0.7071... matches JASP default
)
bf_exceeds = float(bf10) > 10.0  # power_config.bf_threshold
```

### Grid Decode (no CSV)

```python
# Source: pure arithmetic — consistent with existing YAML structure
def decode_task_id(
    task_id: int,
    n_per_group_grid: list[int],
    effect_size_grid: list[float],
    n_iterations: int,
) -> tuple[int, float, int]:
    n_d = len(effect_size_grid) * n_iterations
    n_idx = task_id // n_d
    d_idx = (task_id // n_iterations) % len(effect_size_grid)
    iter_idx = task_id % n_iterations
    return n_per_group_grid[n_idx], effect_size_grid[d_idx], iter_idx
```

### BMS Power Check

```python
# Source: synthesized from analysis/bms.py run_group_bms signature
from prl_hgf.analysis.bms import run_group_bms
import numpy as np

# elpd_matrix shape: (n_subjects, 2) with columns [2level, 3level]
bms_result = run_group_bms(elpd_matrix, model_names=["hgf_2level", "hgf_3level"])
xp_3level = float(bms_result["xp"][1])  # index 1 = hgf_3level (true model)
bms_correct = xp_3level > 0.75
```

### Linear Trend Contrast (contrast c)

```python
# Linear trend: weighted sum weights=[-1, 0, +1] for [baseline, post_dose, followup]
# Produces a per-participant "trajectory slope" scalar
wide = (
    fit_df[fit_df["parameter"] == "omega_2"]
    .pivot_table(
        index=["participant_id", "group"],
        columns="session",
        values="mean",
    )
    .reset_index()
)
# Weight matrix: sessions in order [baseline, post_dose, followup]
weights = np.array([-1.0, 0.0, 1.0])
wide["trend"] = (
    wide["baseline"] * weights[0]
    + wide["post_dose"] * weights[1]
    + wide["followup"] * weights[2]
)
psi_trend = wide.loc[wide["group"] == "psilocybin", "trend"].dropna().to_numpy()
plc_trend = wide.loc[wide["group"] == "placebo", "trend"].dropna().to_numpy()
t_stat, _ = stats.ttest_ind(psi_trend, plc_trend, equal_var=False)
bf_trend = pg.bayesfactor_ttest(t=t_stat, nx=len(psi_trend), ny=len(plc_trend), r=math.sqrt(2)/2)
```

## State of the Art

| Old Approach | Current Approach | Impact |
|--------------|------------------|--------|
| One iteration per SLURM job with separate grid CSV | Flat arithmetic decode of task_id | No pre-generated CSV required; grid change = YAML edit only |
| compute_batch_waic with wide columns | compute_subject_waic per participant in loop | Works with simulate_batch output; avoids column mismatch |

**Deprecated/outdated:**
- The stub `run_power_iteration` in `08_run_power_iteration.py` (Phase 8 placeholder)
  must be replaced entirely. The Phase 8 stub prints "full pipeline not yet implemented"
  and exits — it does not fail gracefully.

## Open Questions

1. **Primary contrast storage**
   - What we know: the schema has one `bf_value` per row. Requirements list 3 contrasts
     (DiD at post_dose, DiD at followup, linear trend).
   - What's unclear: should all 3 contrasts write separate rows (different `sweep_type`)?
     Or only the primary DiD at post_dose, with the others discarded?
   - Recommendation: write three rows per job with `sweep_type` = `"did_postdose"`,
     `"did_followup"`, `"linear_trend"`. This is a 3x increase in parquet files.
     Alternative: write one row with primary contrast and add `bf_did_followup` and
     `bf_linear_trend` columns — but this violates the existing schema. The planner
     should choose one approach and update `POWER_SCHEMA` if needed.

2. **MCMC settings for power sweep**
   - What we know: current default is 4 chains × 1000 draws × 1000 tune. At N=50,
     this exceeds 8h wall time for the BMS path.
   - What's unclear: what reduced settings are acceptable for power estimation.
   - Recommendation: use n_chains=2, n_draws=500, n_tune=500 for all power sweep
     jobs. Add `--fit-chains`, `--fit-draws`, `--fit-tune` CLI arguments to
     `08_run_power_iteration.py`. The planner should lock this decision.

3. **Group-stratified BMS (PWR-08)**
   - What we know: `run_stratified_bms` already computes per-group BMS.
     PWR-08 says "optional/exploratory".
   - What's unclear: should the SLURM job compute it and store in a separate column,
     or should it be a post-processing step over collected parquet files?
   - Recommendation: compute per-group BMS only in post-processing. Per-job cost is
     already high; stratified BMS with N=10–15 per group has very limited power.

## Sources

### Primary (HIGH confidence)
- `src/prl_hgf/simulation/batch.py` — `simulate_batch` signature and output columns
- `src/prl_hgf/fitting/batch.py` — `fit_batch` signature, `return_idata=True` return type
- `src/prl_hgf/analysis/bms.py` — `run_group_bms`, `compute_subject_waic`, `compute_batch_waic`
  (including the column name mismatch in the docstring)
- `src/prl_hgf/power/schema.py` — 13-column `POWER_SCHEMA` and `write_parquet_row`
- `src/prl_hgf/power/config.py` — `make_power_config` and `PowerConfig`
- `src/prl_hgf/power/seeds.py` — `make_child_rng`
- `scripts/08_run_power_iteration.py` — existing stub and entry point structure
- `configs/prl_analysis.yaml` — current power grid values
- `pingouin` official docs (https://pingouin-stats.org/generated/pingouin.bayesfactor_ttest.html)
  — exact function signature, `r` parameter semantics, JASP validation statement

### Secondary (MEDIUM confidence)
- Estimated GPU MCMC timing (~1.5 min/participant-session) based on PyMC+JAX A40
  characteristics; not measured on this cluster.

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH — all libraries verified in pyproject.toml and environment_gpu.yml
- Architecture: HIGH — call graph verified by reading all source modules directly
- Pitfalls: HIGH (column mismatch, schema semantics, grid mapping) — verified directly
  from source; MEDIUM (timing estimates) — extrapolated from general GPU knowledge
- pingouin API: HIGH — verified from official docs; default r=0.707 = sqrt(2)/2 confirmed

**Research date:** 2026-04-07
**Valid until:** 2026-05-07 (pingouin API is stable; pyhgf/PyMC are pinned in pyproject.toml)
