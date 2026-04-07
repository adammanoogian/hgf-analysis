# PRL HGF Analysis Pipeline

## What This Is

A validated Python pipeline for simulating, fitting, and comparing Hierarchical Gaussian Filter (HGF) models on data from the PRL (Probabilistic Reversal Learning) pick_best_cue task. Two model variants — 2-level and 3-level binary HGF — are applied to a 2-group x 3-session longitudinal design studying psilocybin effects on belief updating in post-concussion syndrome. Includes an interactive Jupyter GUI for parameter exploration.

## Core Value

A validated simulation-to-inference pipeline: simulate synthetic participants with known parameters, recover those parameters via Bayesian fitting, compare models formally, and test group x session hypotheses — all before real data arrives. Every step is reproducible from a single shared config that mirrors the PRL task structure.

## Study Design

- **Groups**: (1) post-concussion + psilocybin, (2) healthy controls + psilocybin
- **Sessions**: 3 timepoints — baseline (pre-dose), post-dose, follow-up
- **Task**: pick_best_cue mode — 3 cues with different reward values, participant selects highest-value cue; criterion-based reversals create volatile phases within sets
- **Hypothesis direction**: Two-tailed. Post-concussion group may show altered belief updating (e.g., reduced flexibility, different volatility priors); psilocybin may modulate these parameters differentially across groups

## Model Architecture

### Perceptual Model

Three parallel binary HGF branches — one per cue — each tracking the reward probability of selecting that cue.

**2-level HGF** (per cue branch):
- Level 0: Binary input node (reward = 1 / no-reward = 0 for the chosen cue)
- Level 1: Continuous state node — tracks log-odds of cue being rewarding
- Free parameter: omega_2 (tonic volatility / evolution rate at level 1)

**3-level HGF** (per cue branch):
- Levels 0-1: Same as 2-level
- Level 2: Volatility parent — estimates how much the cue's reward probability is changing
- Additional free parameters: omega_3 (tonic meta-volatility), kappa (coupling between volatility estimate and level-1 learning rate)
- Optional: mu_3_0 (initial volatility prior mean)

All three branches share a common volatility parent at level 2 (shared-volatility variant, literature default).

### Response Model

Softmax over three cue beliefs with beta (inverse temperature) and zeta (stickiness/perseveration).

### Parameters of Interest

| Parameter | Model | Meaning | Hypothesis relevance |
|-----------|-------|---------|---------------------|
| omega_2 | Both | Tonic volatility (log-space learning rate) | Delta across sessions = learning rate change |
| omega_3 | 3-level | Meta-volatility | Sensitivity to environmental change |
| kappa | 3-level | Coupling strength (volatility -> learning rate) | How much perceived volatility drives flexible updating |
| beta | Both | Inverse temperature (decision noise) | Confidence / exploitation |
| zeta | Both | Stickiness (choice perseveration) | Cognitive flexibility vs. rigidity |

## Requirements

### Validated

- ENV-01 through ENV-05: Config system + task environment — v1.0
- MOD-01 through MOD-05: 2-level and 3-level HGF models — v1.0
- RSP-01 through RSP-04: Softmax + stickiness response function — v1.0
- SIM-01 through SIM-06: Agent simulation + batch generation — v1.0
- FIT-01 through FIT-05: PyMC MCMC fitting pipeline — v1.0
- REC-01 through REC-04: Parameter recovery validation — v1.0
- CMP-01 through CMP-04: Bayesian model selection — v1.0
- GRP-01 through GRP-05: Group-level analysis — v1.0
- GUI-01 through GUI-06: Interactive parameter explorer — v1.0
- INF-01 through INF-05: Infrastructure — v1.0

### Active

(None — awaiting next milestone definition)

### Out of Scope

- Real data ingestion (no data yet; pipeline validates on synthetic data) — planned for v2.0
- RLWM pipeline integration (separate project)
- Neuroimaging regressors from HGF trajectories (v2)
- Active inference model (v2 comparator)
- Hierarchical/multilevel Bayesian fitting (v2)

## Context

Shipped v1.0 with 11,016 LOC Python across 7 phases in 4 days.
Tech stack: pyhgf 0.2.8, JAX, PyMC 5, ArviZ, bambi 0.15.0, groupBMC 1.0, ipywidgets, ipympl.
Environment: ds_env conda (Python 3.10) — pyhgf requires Python <=3.13.

Known limitations:
- omega_3 recovery is poor (literature-known caveat)
- 3-level model NaN boundary at omega_2 >= ~-1.2 (handled by prior)
- cores=1 default on Windows for MCMC fitting

## Constraints

- **pyhgf version**: Pin to 0.2.8 (latest stable with PyMC integration)
- **Python**: 3.10 via ds_env conda environment
- **Config-driven**: Task structure parameters read from YAML config — no hardcoded task sequences
- **Reproducibility**: All simulations seeded; all MCMC chains saved; all figures regenerable

## Key References

- Mathys et al. (2011, 2014) — HGF theory and binary HGF
- Weber et al. (2024) — Generalized HGF (gHGF)
- Legrand et al. (2024) — pyhgf paper (arXiv:2410.09206)
- Mason et al. (2024) — Psilocybin + reversal learning + computational modeling
- Diaconescu et al. — HGF applied to reversal learning in clinical populations
- Rigoux et al. (2014) — Random-effects Bayesian model selection

---
*Last updated: 2026-04-07 after v1.0 milestone*
