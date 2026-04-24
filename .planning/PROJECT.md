# PRL HGF Analysis Pipeline

## What This Is

A validated Python pipeline for simulating, fitting, and comparing Hierarchical Gaussian Filter (HGF) models on data from the PRL (Probabilistic Reversal Learning) pick_best_cue task. Two model variants — 2-level and 3-level binary HGF — are applied to a 2-group x 3-session longitudinal design studying psilocybin effects on belief updating in post-concussion syndrome. Includes an interactive Jupyter GUI for parameter exploration.

## Core Value

A validated simulation-to-inference pipeline: simulate synthetic participants with known parameters, recover those parameters via Bayesian fitting, compare models formally, and test group x session hypotheses — all before real data arrives. Every step is reproducible from a single shared config that mirrors the PRL task structure.

## Study Design

- **Groups**: (1) post-concussion + psilocybin, (2) post-concussion + placebo
- **Sessions**: 3 timepoints — baseline (pre-dose), post-dose, follow-up
- **Task**: pick_best_cue mode — 3 cues with different reward values, participant selects highest-value cue; criterion-based reversals create volatile phases within sets
- **Hypothesis direction**: Two-tailed. Both groups are post-concussion patients; psilocybin group may show greater improvement in belief updating flexibility (e.g., increased learning rate, stronger volatility coupling) compared to placebo

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
- PWR-01 through PWR-10, PRE-01 through PRE-06, SEED-01, VIZ-01 through VIZ-04, REC-01: BFDA power analysis pipeline (code-complete, pending production run) — v1.1

### Active

#### Current Milestone: v1.2 Hierarchical GPU Fitting (cluster-bound, in progress)

**Goal:** Refactor the v1.1 power analysis fitting pipeline to a batched hierarchical architecture so GPU acceleration actually works — amortizing NUTS launch overhead across all participants in one `sample_numpyro_nuts` call. Finish the v1.1 production run on real compute.

**Target features:**
- Batched hierarchical PyMC model (shape-(n_participants,) independent priors, single joint NUTS call)
- JAX-native cohort simulation via `lax.scan` + `jax.vmap`, reusing pyhgf's `net.scan_fn` (no HGF math rewrite)
- tapas-style Layer 2 per-trial belief clamping inside `lax.scan` (revert to previous state on NaN)
- CPU validation harness (bit-exact vs legacy, statistical equivalence, cross-platform consistency)
- GPU benchmark with decision gate (GPU vs CPU `comp` partition fallback)
- Complete v1.1 production run: `power_master.csv`, 4-panel figure, `recommendation.md` populated with real data

**Why v1.2 exists:** The v1.1 benchmark on an L40S showed ~1.5s per NUTS sample due to per-participant sequential fitting causing 5000 small CPU↔GPU dispatches per fit. That projected to ~18,000 GPU-hours for the full sweep — infeasible. The fix is architectural: batch all participants through one vmapped logp so the launch overhead is amortized.

**v1.2 outstanding (as of v1.3 opening, 2026-04-24):** Phase 14.1-03 benchmark (cluster-bound); Phase 15 production run (deferred until benchmark closes).

#### Current Milestone: v1.3 Generic HGF Viewer — Scaffold + Handoff (local, parallel)

**Goal:** Ship a config-driven HGF viewer scaffold (`src/prl_hgf/viz/`) that reads real pyhgf internals, runs pre- and post-fit, and is paired with a standalone PAT-RL 3-level example config and a completed handoff doc. Full rendering polish deferred to v1.4+.

**Target features:**
- `src/prl_hgf/viz/` module scaffold: `inspector.py` (reads `network.attributes[idx]`, `.edges[idx].volatility_parents`, `.input_idxs`), `roles.py` (level + role inference), `schema.py` (fitted-params ArviZ wrapper), `export.py` (`export_viz_html()` via regex injection)
- Generic HTML template: promote `figures/patrl_hgf_model.html` → `figures/hgf_viewer.html` with parameterized injection slots; PAT-RL-specific branding removed
- Standalone PAT-RL 3-level example config (JSON) with full phenotype definitions and parameter descriptions
- Evolved `docs/HANDOFF_pyhgf_plot_network_extension.md` with runtime-verified pyhgf internals, ArviZ schema + coord conventions (Decision 131), regex-injection spec, follow-up implementation checklist
- Pre-fit path (config-only rendering) + post-fit path (ArviZ posterior overlay hook)
- Structural tests in `tests/viz/` for inspector round-trip, role inference edge cases, export scaffold

**Why v1.3 is parallel:** v1.2's remaining work is cluster-bound and latency-dominated; viewer work is local and has no code overlap with the fitting/power stack. Parallelism is safe.

**v1.3 explicit non-goals (v1.4+):**
- Publication-quality SVG rendering (hexagons, diamonds, neural-correlate arrows)
- Response-model equation rendering section
- Posterior overlay visuals (violin plots, CI bars) — schema defined now, rendering later
- pyhgf upstream contribution (Option A in old handoff) — remains Option C hybrid

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
- 3-level model NaN boundary at omega_2 >= ~-1.2 (handled by prior + simulation NaN guard)
- cores=1 default on Windows for MCMC fitting
- v1.1 per-participant sequential fitting architecture is pessimal for GPU — benchmark showed ~1.5s per NUTS sample on L40S due to PCIe dispatch overhead dominating a 420-trial sequential scan; this motivates v1.2's batched hierarchical refactor

Key v1.1 decisions informing v1.2 (see `project_utils/templates/guides/JAX_GPU_BAYESIAN_FITTING.md` for full writeup):
- `numpyro` (JAX NUTS) is the default sampler, not PyTensor NUTS — avoids a PyMC `_init_jitter` read-only array bug
- rlwm_trauma_analysis benchmarked vmap as 7-13x slower than sequential for LBFGS with 154×50 starts — a lesson we take seriously but do not take as universal; NUTS with a hierarchical model is a different regime and should be benchmarked on its own
- pyhgf has no built-in NaN clamping; tapas-style Layer 2 per-trial reversion must be added in our own JAX code

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
*Last updated: 2026-04-24 opening v1.3 Generic HGF Viewer milestone (parallel to v1.2 cluster-bound work)*
