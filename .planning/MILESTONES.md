# Project Milestones: PRL HGF Analysis Pipeline

## v1.0 Simulation-to-Inference Pipeline (Shipped: 2026-04-07)

**Delivered:** Complete validated HGF analysis pipeline — from task environment through simulation, fitting, parameter recovery, group analysis, and interactive GUI — ready for real data.

**Phases completed:** 1-7 (18 plans total)

**Key accomplishments:**

- Unified YAML config + task environment simulator reproducing PRL pick_best_cue structure
- 2-level and 3-level binary HGF models with custom softmax+stickiness response function
- Batch simulation of 180 synthetic participants (2 groups x 3 sessions x 30/group)
- PyMC MCMC fitting pipeline with custom JAX-backed PyTensor Ops
- Parameter recovery validation + random-effects BMS (groupBMC)
- Group-level mixed-effects analysis with bambi, raincloud plots, Quarto manuscript scaffold
- Interactive parameter explorer GUI with belief caching and <2s slider updates

**Stats:**

- 105 files created/modified
- 11,016 lines of Python
- 7 phases, 18 plans
- 4 days from init to ship (2026-04-04 → 2026-04-07)

**Git range:** `249fa05` (init) → `154861d` (latest)

**What's next:** v2.0 — Real data ingestion and analysis

---
