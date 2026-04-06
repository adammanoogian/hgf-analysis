# Phase 6: Group Analysis - Research

**Researched:** 2026-04-06
**Domain:** Bayesian mixed-effects modeling, raincloud visualization, Quarto scientific manuscripts, effect sizes
**Confidence:** MEDIUM-HIGH (bambi and ptitprince well-documented; posterior propagation approach requires design judgment)

## Summary

Phase 6 combines four distinct technical domains: (1) extracting point estimates from InferenceData objects into a tidy DataFrame, (2) fitting Bayesian mixed-effects models via bambi with a group x session interaction formula, (3) producing raincloud plots with ptitprince, and (4) scaffolding a Quarto manuscript that consumes results CSVs for inline statistics.

The standard approach for this domain in computational psychiatry is a two-stage pipeline: extract posterior means per participant-session into a flat CSV, then fit the group-level mixed-effects model on those means. This is the practical path. Full posterior propagation (measurement error model) is theoretically superior but requires custom PyMC with pm.Data containers and per-draw sampling loops — substantially more complex and rarely done in published HGF pipelines. The CONTEXT.md marks this as "Claude's Discretion": the recommendation is to use the two-stage approach (posterior means as data) and acknowledge the limitation in the manuscript.

The existing codebase already produces the correct input format: `fit_batch()` returns a long-form DataFrame with columns `participant_id, group, session, model, parameter, mean, sd, hdi_3%, hdi_97%, r_hat, ess, flagged`. The pivot from this to a wide-form "estimates table" is a one-liner.

**Primary recommendation:** Use two-stage approach (posterior means into bambi formula model). Implement bambi with `"omega_2 ~ C(group) * C(session) + (1 | participant_id)"`, treat group and session as categorical with treatment coding, and report 94% HDI from bambi posteriors as the effect-size credible interval.

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| bambi | 0.17.2 | Bayesian mixed-effects via formula API on PyMC | lme4-style syntax, produces InferenceData, active development |
| arviz | current (pinned with bambi) | Posterior summaries, HDI computation, forest plots | Standard ArviZ integration; bambi returns InferenceData directly |
| ptitprince | 0.3.1 | Raincloud plots (half-violin + strip + boxplot) | Seaborn-backed, Python 3.9-3.12, updated Oct 2025 |
| pandas | current | Tidy DataFrames for results CSVs | Already in project |
| pingouin | 0.5.5 | Frequentist effect sizes (Cohen's d, partial eta-squared) | Pandas-native, handles paired/repeated measures |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| quarto CLI | current | Render manuscript to PDF | Installed separately (not pip) |
| matplotlib | current | Figure backend for ptitprince/seaborn | Already in project |
| scipy.stats | current | Pearson r, t-tests for supplementary frequentist checks | Already in project |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| ptitprince | matplotlib custom raincloud | ptitprince is 3 lines vs 40+ lines of custom code |
| bambi | pure PyMC multilevel model | bambi formula syntax is faster to specify and debug |
| pingouin Cohen's d | bambi posterior difference | Both valid; pingouin for frequentist reporting, bambi posteriors for Bayesian effect |

**Installation:**
```bash
pip install bambi==0.17.2 ptitprince pingouin
# Quarto CLI installed separately from https://quarto.org/docs/get-started/
```

## Architecture Patterns

### Recommended Project Structure
```
scripts/
└── 06_group_analysis.py        # Pipeline script: extracts, fits, saves CSVs
src/prl_hgf/
└── analysis/
    ├── group.py                 # bambi model factory + posterior extraction
    ├── effect_sizes.py          # Cohen's d and Bayesian effect size helpers
    └── group_plots.py           # raincloud + interaction plot functions
results/
├── estimates_wide.csv           # posterior means per subject x session x param
├── group_model_idata/           # bambi InferenceData per parameter (netCDF)
└── effect_sizes.csv             # Cohen's d / partial eta-sq per comparison
manuscript/
├── _quarto.yml                  # project config: type: manuscript, arxiv-pdf
├── paper.qmd                    # main article, imports results/ CSVs
├── references.bib
└── arxiv_template.tex           # from mikemahoney218/quarto-arxiv extension
```

### Pattern 1: Extract Posterior Means into Wide CSV

The existing `fit_batch()` output is long-form (one row per parameter). Pivot to wide before bambi.

**What:** Pivot fit_df to one row per (participant_id, group, session), drop flagged fits.
**When to use:** Always — this is the input to bambi.
**Example:**
```python
# Source: project fit_batch() output schema (src/prl_hgf/fitting/batch.py)
import pandas as pd

def build_estimates_wide(fit_df: pd.DataFrame, exclude_flagged: bool = True) -> pd.DataFrame:
    """Pivot long-form fit results to wide form for group analysis.

    Parameters
    ----------
    fit_df : pandas.DataFrame
        Output of fit_batch(). Columns: participant_id, group, session,
        model, parameter, mean, sd, hdi_3%, hdi_97%, r_hat, ess, flagged.
    exclude_flagged : bool
        Drop rows where flagged == True before pivoting.

    Returns
    -------
    pandas.DataFrame
        Wide-form: one row per (participant_id, group, session),
        columns: omega_2, omega_3, kappa, beta, zeta.
    """
    if exclude_flagged:
        fit_df = fit_df[fit_df["flagged"] == False].copy()

    return fit_df.pivot_table(
        index=["participant_id", "group", "session"],
        columns="parameter",
        values="mean",
    ).reset_index()
```

### Pattern 2: Bambi Mixed-Effects Formula

**What:** Bayesian linear mixed model with group (between) x session (within, 3 levels) interaction.
**When to use:** Primary hypothesis test for each parameter.
**Example:**
```python
# Source: bambi 0.17.2 docs (https://bambinos.github.io/bambi/notebooks/getting_started.html)
import bambi as bmb
import arviz as az

def fit_group_model(
    estimates_wide: pd.DataFrame,
    outcome: str,
) -> tuple[bmb.Model, az.InferenceData]:
    """Fit Bayesian mixed-effects model for group x session on one parameter.

    Parameters
    ----------
    estimates_wide : pandas.DataFrame
        Wide-form DataFrame with columns: participant_id, group, session, [params].
    outcome : str
        Column name of the HGF parameter (e.g. 'omega_2').

    Returns
    -------
    model : bmb.Model
    idata : az.InferenceData
    """
    # group and session must be string/categorical for treatment coding
    df = estimates_wide.copy()
    df["group"] = df["group"].astype("category")
    df["session"] = df["session"].astype(str).astype("category")

    # C() forces categorical, * expands to main effects + interaction
    formula = f"{outcome} ~ C(group) * C(session) + (1 | participant_id)"
    model = bmb.Model(formula, df, dropna=True)
    idata = model.fit(draws=2000, tune=1000, chains=4, random_seed=42)
    return model, idata
```

### Pattern 3: Extract Posterior Contrasts from Bambi

**What:** Compute group difference within each session from bambi posterior.
**When to use:** For reporting effect sizes and credible intervals on the primary hypothesis.
**Example:**
```python
# Source: bambi interpret API + arviz HDI
import numpy as np
import arviz as az

def compute_group_contrast(idata: az.InferenceData, session_label: str) -> dict:
    """Extract posterior of group difference (post-concussion - control) at a session.

    Parameters
    ----------
    idata : az.InferenceData
        Output of model.fit().
    session_label : str
        Session label matching C(session) coding in the model (e.g. '2').

    Returns
    -------
    dict with keys: mean, sd, hdi_3, hdi_97 (94% HDI).
    """
    # Bambi stores group effect in posterior as 'C(group)[group_label]'
    # Exact name depends on reference level; inspect with list(idata.posterior)
    posterior = idata.posterior.stack(draws=("chain", "draw"))

    # For interaction: extract group main effect + group:session interaction term
    # Then compute contrast = group_effect + group_x_session_effect
    # Exact variable name format: 'C(group)[T.post_concussion]' etc.
    group_main = posterior["C(group)[T.post_concussion]"].values
    interaction = posterior[
        f"C(group)[T.post_concussion]:C(session)[T.{session_label}]"
    ].values
    contrast = group_main + interaction

    hdi = az.hdi(contrast, hdi_prob=0.94)
    return {
        "mean": float(np.mean(contrast)),
        "sd": float(np.std(contrast)),
        "hdi_3": float(hdi[0]),
        "hdi_97": float(hdi[1]),
    }
```

**Warning:** Bambi's variable naming for categorical interactions uses the formulae library's treatment coding. The exact posterior variable name depends on the reference level chosen. Always inspect `list(idata.posterior.data_vars)` after fitting to confirm names.

### Pattern 4: Raincloud Plot with ptitprince

**What:** Half-violin + strip + boxplot for parameter distribution by group x session.
**When to use:** All primary visualizations (GRP-04).
**Example:**
```python
# Source: ptitprince 0.3.1 API (https://github.com/pog87/PtitPrince)
import ptitprince as pt
import matplotlib.pyplot as plt
import seaborn as sns

def plot_raincloud(
    estimates_wide: pd.DataFrame,
    outcome: str,
    palette: str = "colorblind",
    save_path=None,
) -> plt.Figure:
    """Raincloud plot of parameter distribution by group x session.

    Parameters
    ----------
    estimates_wide : pandas.DataFrame
        Wide-form estimates with group, session, and outcome columns.
    outcome : str
        Parameter column to plot (e.g. 'omega_2').
    palette : str
        Seaborn palette name. 'colorblind' gives blue/orange.
    save_path : Path or None
        If provided, saves figure at 150 dpi.
    """
    fig, ax = plt.subplots(figsize=(9, 5))

    pt.RainCloud(
        x="session",
        y=outcome,
        hue="group",
        data=estimates_wide,
        palette=palette,
        bw=0.2,               # KDE bandwidth
        width_viol=0.6,
        orient="h",            # horizontal: easier to read with 3 sessions
        alpha=0.65,
        dodge=True,            # separate groups side-by-side
        pointplot=False,
        move=0.2,
        ax=ax,
    )
    ax.set_title(f"{outcome} by Group × Session")
    ax.set_xlabel(outcome)
    ax.set_ylabel("Session")
    fig.tight_layout()

    if save_path is not None:
        fig.savefig(save_path, dpi=150, bbox_inches="tight")
    return fig
```

### Pattern 5: Quarto Manuscript Scaffold

**What:** Quarto manuscript project with arxiv-pdf output and inline Python statistics.
**When to use:** `manuscript/` folder for Quarto project.

`manuscript/_quarto.yml`:
```yaml
project:
  type: manuscript

manuscript:
  article: paper.qmd

format:
  html: default
  arxiv-pdf:
    keep-tex: true

jupyter: python3

execute:
  echo: false
  cache: true
```

Install the arXiv extension once:
```bash
cd manuscript/
quarto install extension mikemahoney218/quarto-arxiv
```

Inline statistics in `paper.qmd`:
```python
# In a {python} code cell (not shown in output):
import pandas as pd
effect_df = pd.read_csv("../results/effect_sizes.csv")
omega2_d = effect_df.loc[effect_df["parameter"] == "omega_2", "cohen_d"].iloc[0]
omega2_hdi_lo = effect_df.loc[...]["hdi_3"].iloc[0]
omega2_hdi_hi = effect_df.loc[...]["hdi_97"].iloc[0]
```

Then in markdown:
```
The group × session interaction on ω₂ showed a mean effect of
`{python} f"{omega2_d:.2f}"` (94% HDI: `{python} f"[{omega2_hdi_lo:.2f}, {omega2_hdi_hi:.2f}]"`).
```

### Pattern 6: Cohen's d and Partial Eta-Squared via pingouin

**What:** Frequentist effect sizes for all primary comparisons (GRP-05).
**Example:**
```python
# Source: pingouin 0.5.5 docs (https://pingouin-stats.org/generated/pingouin.compute_effsize.html)
import pingouin as pg

def compute_group_cohens_d(
    estimates_wide: pd.DataFrame,
    outcome: str,
    session: str,
) -> float:
    """Compute Cohen's d for group difference within one session."""
    grp_a = estimates_wide.loc[
        (estimates_wide["session"] == session) & (estimates_wide["group"] == "control"),
        outcome,
    ].dropna()
    grp_b = estimates_wide.loc[
        (estimates_wide["session"] == session) & (estimates_wide["group"] == "post_concussion"),
        outcome,
    ].dropna()
    return pg.compute_effsize(grp_a, grp_b, paired=False, eftype="cohen")
```

For repeated-measures partial eta-squared from bambi posterior, derive from the variance components:
```python
# Bayesian partial eta-sq: variance of group effect / (variance of group + residual)
# Extract from bambi idata posterior directly
group_effect_var = float(idata.posterior["C(group)[T.post_concussion]"].var())
sigma_residual = float(idata.posterior["sigma"].mean())
partial_eta_sq = group_effect_var / (group_effect_var + sigma_residual**2)
```

### Anti-Patterns to Avoid
- **Using `session` as numeric:** Bambi will treat it as a continuous covariate rather than 3 discrete levels. Always cast to str/category before building the model.
- **Passing idata to ptitprince directly:** ptitprince takes a pandas DataFrame, not posterior samples. Posterior samples are for bambi/arviz, not raincloud.
- **Rendering Quarto figures as static PNGs pre-generated:** CONTEXT.md requires figures inside Quarto code cells. Do not pre-generate PNGs — they will not update when results change.
- **Using omega_3 as a primary outcome without caveat:** Known poor recovery. Report with explicit caveat in both code comment and manuscript text.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Raincloud plots | Custom half-violin + strip + box | ptitprince 0.3.1 | Seaborn-backed, handles dodge/hue, 3 lines of code |
| Mixed-effects model | Custom PyMC hierarchical model | bambi formula API | lme4 syntax, auto priors, returns InferenceData directly |
| HDI computation | Custom percentile code | az.hdi(prob=0.94) | Exact, handles non-symmetric posteriors |
| Cohen's d | Manual pooled SD formula | pingouin.compute_effsize | Handles paired vs unpaired, returns scalar |
| arXiv Quarto template | Custom LaTeX preamble | mikemahoney218/quarto-arxiv | Extension passes arXiv build checks |
| Posterior variable name lookup | Hard-coded strings | `list(idata.posterior.data_vars)` | Bambi naming depends on reference level; always inspect |

**Key insight:** Bambi's formula interface eliminates 80% of the boilerplate needed for a custom PyMC multilevel model. The main risk is misreading categorical variable names in the posterior — always print `list(idata.posterior)` after first fit.

## Common Pitfalls

### Pitfall 1: Categorical Naming in Bambi Posterior
**What goes wrong:** Bambi encodes `C(group) * C(session)` using treatment contrasts relative to the reference level. The posterior variable for the interaction is named like `C(group)[T.post_concussion]:C(session)[T.2]`. Hard-coding these names without checking fails silently (KeyError or wrong contrast).
**Why it happens:** The reference level defaults to the alphabetically-first category. If group labels are "control" and "post_concussion", control is the reference.
**How to avoid:** After first fit, run `list(idata.posterior.data_vars)` and log the names. Use them as constants in the analysis module.
**Warning signs:** KeyError on posterior variable access; zero-valued contrasts.

### Pitfall 2: Session as Numeric vs Categorical
**What goes wrong:** If session column is an integer (1, 2, 3), bambi may model it as a continuous predictor, collapsing the 3-level interaction into a linear slope.
**Why it happens:** Pandas int columns are inferred as numeric by bambi's formulae parser.
**How to avoid:** Cast `df["session"] = df["session"].astype(str).astype("category")` before every model call. The `C()` wrapper in the formula alone is insufficient if the column is numeric.
**Warning signs:** Posterior has only one `C(session)` term instead of two dummy variables.

### Pitfall 3: Posterior Propagation Complexity vs Payoff
**What goes wrong:** Attempting a full measurement-error model (each participant's posterior SD as the error term in bambi) hits a wall: bambi does not support predictor-level measurement error natively. Implementing it in raw PyMC adds 2-3 weeks of development.
**Why it happens:** The CONTEXT.md marks this as Claude's Discretion; the correct choice for this project is the two-stage approach.
**How to avoid:** Use posterior means as the outcome in bambi. Document the limitation in the manuscript Methods section: "Following standard practice in computational psychiatry (e.g., Iglesias et al. 2021), we used posterior means as point estimates in the group-level model, acknowledging that this underestimates parameter uncertainty."
**Warning signs:** None — this is a design decision, not a runtime error.

### Pitfall 4: ptitprince Palette Warning with seaborn >= 0.14
**What goes wrong:** Passing `palette="colorblind"` to older ptitprince versions raises a seaborn DeprecationWarning about default palette removal.
**Why it happens:** ptitprince 0.3.1 (Oct 2025) already removed the default palette to avoid this. Pass palette explicitly.
**How to avoid:** Always pass `palette="colorblind"` explicitly. Use `sns.color_palette("colorblind")` if you need a list of colors for custom plots.
**Warning signs:** FutureWarning or DeprecationWarning from seaborn at plot time.

### Pitfall 5: Quarto Caching Stale Results
**What goes wrong:** After re-running the pipeline (new results CSVs), Quarto uses cached cell outputs and shows old statistics in the rendered manuscript.
**Why it happens:** `execute: cache: true` is efficient but does not detect changes in external CSV files.
**How to avoid:** Either use `execute: cache: false` during active development, or run `quarto render --cache-refresh paper.qmd` when results change. Add a comment in `_quarto.yml` explaining this.
**Warning signs:** Inline statistics don't change even after running 06_group_analysis.py.

### Pitfall 6: omega_3 Interpretation
**What goes wrong:** Reporting omega_3 group effects without caveat inflates the apparent findings.
**Why it happens:** omega_3 has known poor recovery (documented in CLAUDE.md and fitting models.py comments). Its posterior mean may not reflect the true parameter.
**How to avoid:** Mark omega_3 as `# LOW RECOVERY` in the analysis code. In the manuscript, relegate omega_3 to supplementary or add explicit note: "omega_3 recovery was poor in validation (Phase 5); these results are exploratory."
**Warning signs:** omega_3 recovery_df shows r < 0.5 in Phase 5 output.

## Code Examples

### Extract Posterior Mean per Subject from InferenceData
```python
# Source: arviz summary API + project fit_batch() schema
import arviz as az
import pandas as pd

# Option A: use az.summary() to get mean per parameter (already done by fit_batch)
summary = az.summary(idata, var_names=["omega_2", "beta", "zeta"])
# summary is a DataFrame indexed by parameter name

# Option B: access posterior directly for full posterior samples
omega2_samples = idata.posterior["omega_2"].values  # shape (n_chains, n_draws)
omega2_mean = omega2_samples.mean()  # single float

# Option C: az.extract() for stacked samples
import numpy as np
stacked = az.extract(idata)  # stacks chain+draw into 'sample' dim
omega2_all = stacked["omega_2"].values  # shape (n_samples,)
```

### Inspect Bambi Posterior Variable Names
```python
# Run immediately after model.fit() to get exact interaction term names
print(list(idata.posterior.data_vars))
# Example output:
# ['Intercept', 'C(group)[T.post_concussion]', 'C(session)[T.2]', 'C(session)[T.3]',
#  'C(group)[T.post_concussion]:C(session)[T.2]', 'C(group)[T.post_concussion]:C(session)[T.3]',
#  '1|participant_id_sigma', 'sigma']
```

### Phase Stratification: Aggregate Belief Trajectories by Phase
```python
# Phase stratification is exploratory (CONTEXT.md). The recommended approach:
# 1. Extract mu_1 belief trajectories from posterior (pyhgf node_trajectories)
# 2. Average over trials within stable vs volatile phase labels
# 3. Compute effective learning rate proxy as trial-by-trial change in mu_1

# The HGF 2-level network has BELIEF_NODES = (1, 3, 5) (src/prl_hgf/models/hgf_2level.py).
# After net.input_data(), node_trajectories[node_idx]["mu"] gives per-trial beliefs.
# For group analysis, use the posterior-mean parameter to re-run the network
# deterministically and extract the trajectory.

def extract_phase_trajectories(
    net,  # fitted Network with posterior-mean omega_2
    phase_labels: list[str],  # length n_trials, values "stable"/"volatile"
    belief_node: int = 1,  # cue 0 belief node
) -> dict[str, float]:
    """Compute mean mu1 per phase for one cue."""
    mu1 = net.node_trajectories[belief_node]["muhat"]  # shape (n_trials,)
    import numpy as np
    phases = np.array(phase_labels)
    return {
        "stable_mean_mu1": float(np.mean(mu1[phases == "stable"])),
        "volatile_mean_mu1": float(np.mean(mu1[phases == "volatile"])),
    }
```

**Note:** `node_trajectories` attribute confirmed by pyhgf 0.2.8 documentation and `plot_trajectories()` method source. The attribute name for the belief mean may be `"mu"` or `"muhat"` depending on whether it refers to post-update or pre-update beliefs. Verify against pyhgf 0.2.8 source before implementing.

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Frequentist repeated-measures ANOVA | Bayesian mixed-effects via bambi | ~2020 | Full posterior, propagates uncertainty, no sphericity assumption |
| Static matplotlib raincloud | ptitprince 0.3.1 | Oct 2025 | seaborn 0.14 compatible, no deprecation warnings |
| Hand-rolled LaTeX manuscript | Quarto + arxiv extension | 2022-2025 | Inline computed statistics, reproducible, single-command re-render |
| Posterior means copied manually to table | Quarto reads CSVs directly | ~2023 | Stats update automatically when pipeline reruns |

**Deprecated/outdated:**
- `plot_cap()`: Replaced by `bmb.interpret.plot_predictions()` in bambi >= 0.13.
- pymc3: Project uses PyMC 5.x (pymc package). Do not import pymc3.
- `az.hdi()` with `credible_interval` kwarg: now uses `hdi_prob` parameter name.

## Open Questions

1. **Exact pyhgf node_trajectories attribute name**
   - What we know: pyhgf 0.2.8 exposes `node_trajectories` dict per node; `plot_trajectories()` uses it internally.
   - What's unclear: Whether the pre-update belief mean is `"mu"` or `"muhat"` at the continuous-state nodes (1, 3, 5) in the project's custom 3-branch network.
   - Recommendation: Add a unit test in Phase 6 that builds a minimal network, runs 5 trials, and prints `net.node_trajectories[1].keys()` to confirm attribute names before implementing phase stratification.

2. **Bambi prior defaults for bounded parameters**
   - What we know: Bambi auto-scales priors to data. omega_2 values from Phase 5 are negative (range approximately -8 to 0).
   - What's unclear: Whether bambi's default Normal prior on the intercept is appropriate given this range, or whether custom priors are needed.
   - Recommendation: Run `model.plot_priors()` after `model.build()` and verify the intercept prior covers the observed range. Add custom priors via `priors={"Intercept": bmb.Prior("Normal", mu=-4, sigma=2)}` if auto-scaled priors are too wide.

3. **Phase label column in sim_df**
   - What we know: The simulation DataFrame is generated in Phase 3. Phase labels (stable/volatile) come from the task config (configs/prl_analysis.yaml).
   - What's unclear: Whether the sim_df produced by Phase 3 already includes a `phase_label` column or whether it must be joined from the task config at analysis time.
   - Recommendation: Check the sim_df schema from `03_simulate_participants.py` output before implementing phase stratification.

## Sources

### Primary (HIGH confidence)
- bambi 0.17.2 PyPI page — version, Python requirement, dependency list
- bambi getting_started notebook — formula syntax, `model.fit()`, InferenceData return, `az.summary()` integration
- bambi multi-level_regression notebook — `(1|group)` syntax, `(slope|group)` syntax
- bambi plot_predictions notebook — `bmb.interpret.plot_predictions()` API, `conditional` parameter
- ptitprince 0.3.1 GitHub README — function signature `pt.RainCloud(x, y, hue, data, palette, bw, orient, dodge, move, ax)`
- quarto.org/docs/computations/python.html — Jupyter engine, `{python}` cell syntax, execute options
- quarto.org/docs/manuscripts/components.html — `_quarto.yml` structure for type: manuscript
- mikemahoney218/quarto-arxiv GitHub — installation, `arxiv-pdf` format name, YAML options
- quarto.org/docs/computations/inline-code.html — `` `{python} variable_name` `` inline syntax

### Secondary (MEDIUM confidence)
- arviz.extract and arviz.summary API (via search + PyPI page) — `az.extract()`, `az.summary()`, `idata.posterior.stack()`
- pingouin 0.5.5 docs — `pg.compute_effsize(x, y, paired=False, eftype='cohen')`; `eftype='eta-square'` available
- pyhgf 0.2.8 docs — `node_trajectories`, `plot_trajectories()` method exists; exact attribute names not fully confirmed

### Tertiary (LOW confidence)
- Two-stage approach (posterior means as data): standard practice in computational psychiatry — no single citation, but consistent across HGF literature (Mathys, Iglesias et al.)
- Bambi prior auto-scaling behavior for negative-range outcomes — inferred from documentation, not tested

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH — bambi 0.17.2, ptitprince 0.3.1, quarto arxiv extension all verified via PyPI and official docs
- Architecture: MEDIUM-HIGH — formula patterns verified against bambi docs; posterior variable naming confirmed as treatment-coded but exact names runtime-dependent
- Pitfalls: HIGH — categorical naming, session-as-numeric, and omega_3 caveat all verified against known bambi behavior and project history
- Phase stratification: MEDIUM — pyhgf node_trajectories exists but attribute names not confirmed in current 0.2.8

**Research date:** 2026-04-06
**Valid until:** 2026-05-06 (bambi is actively developed; check for patch releases before planning)
