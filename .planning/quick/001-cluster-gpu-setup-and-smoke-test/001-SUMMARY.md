---
phase: quick
plan: 001
subsystem: infrastructure
tags: [cluster, gpu, slurm, m3, smoke-test, mcmc]
dependency_graph:
  requires: [v1.0 milestone]
  provides: [cluster infrastructure, gpu env, pipeline orchestrator, smoke test]
  affects: [production runs on M3]
tech_stack:
  added: [slurm, environment_gpu.yml]
  patterns: [wave orchestration, sbatch dependency chains, config-patch smoke testing]
key_files:
  created:
    - environment_gpu.yml
    - cluster/00_setup_env_gpu.sh
    - cluster/01_diagnostic_gpu.slurm
    - cluster/04_fit_mcmc_gpu.slurm
    - cluster/05_validation_gpu.slurm
    - cluster/06_analysis.slurm
    - cluster/99_push_results.slurm
    - cluster/submit_full_pipeline.sh
    - scripts/smoke_test.sh
  modified: []
decisions:
  - id: q001-d1
    choice: "Include bambi and pingouin in prl_gpu env"
    reason: "06_group_analysis.py imports bambi; needed for cluster analysis step"
  - id: q001-d2
    choice: "Exclude matplotlib/seaborn/ipywidgets from GPU env"
    reason: "Not needed on cluster with --skip-plots; saves env size"
  - id: q001-d3
    choice: "Run simulate inline in orchestrator (not as SLURM job)"
    reason: "Simulation is fast (~30s) and produces the input CSV needed before fit jobs"
  - id: q001-d4
    choice: "JAX constrained to >=0.4.26,<0.4.32"
    reason: "pyhgf 0.2.8 pins jax<0.4.32; rlwm uses >=0.5 but that is incompatible"
metrics:
  duration: 102m
  completed: 2026-04-07
---

# Quick Task 001: Cluster GPU Setup and Smoke Test Summary

M3 cluster infrastructure for GPU-accelerated MCMC fitting with SLURM wave
orchestration and a local smoke test validating the full 5-script pipeline
end-to-end with 2 participants/group.

## Tasks Completed

### Task 1: Create cluster infrastructure (8 files)

Created the full cluster/ directory with SLURM job scripts and a wave
orchestrator, plus the prl_gpu conda environment definition.

**environment_gpu.yml** -- Minimal GPU conda env: Python 3.10, JAX CUDA 12
(0.4.26-0.4.32), PyMC, pyhgf, bambi, pingouin. No visualisation packages.

**cluster/00_setup_env_gpu.sh** -- Env creation/update with --update/--fresh
modes, /scratch/fc37/$USER/conda storage, pip install -e for project package,
full verification (Python, JAX, PyMC, pyhgf, device detection).

**cluster/01_diagnostic_gpu.slurm** -- Quick GPU sanity check: device detection,
computation test, import verification, GPU vs CPU benchmark.

**cluster/04_fit_mcmc_gpu.slurm** -- Main compute job: A40 GPU, 64G mem, 12h
walltime. Multi-model dispatch for parallel fitting. JAX compilation cache.

**cluster/05_validation_gpu.slurm** -- Parameter recovery (skip-waic default).
GPU partition, 4h walltime.

**cluster/06_analysis.slurm** -- Group analysis on comp partition (no GPU).
Both 2level and 3level models, --skip-plots.

**cluster/99_push_results.slurm** -- Auto-push to results branch. Stages
fitted CSVs, validation outputs, group analysis CSVs.

**cluster/submit_full_pipeline.sh** -- Wave orchestrator:
Wave 1 (simulate, inline) -> Wave 2 (fit 2level + 3level, parallel GPU) ->
Wave 3 (validate, afterok) -> Wave 4 (analyse, afterok) ->
Wave 5 (push, afterany). Supports --skip-push, --skip-validation, --models.

### Task 2: Create and run local smoke test

Created scripts/smoke_test.sh and ran it end-to-end with 2 participants/group.

**Smoke test results:**

| Step                       | Duration | Status |
|----------------------------|----------|--------|
| 03_simulate_participants   | 57s      | PASS   |
| 04_fit (hgf_2level)        | 970s     | PASS   |
| 04_fit (hgf_3level)        | 3632s    | PASS   |
| 05_validation (--skip-waic) | 9s      | PASS   |
| 06_group_analysis (2level) | 8s       | PASS   |

Total duration: ~78 minutes. Overall status: PASS.

The 3-level model took ~60 minutes for 12 participant-sessions (CPU-only on
Windows). On M3 GPU this should be 5-10x faster.

Expected warnings with 2 participants:
- Recovery skipped (needs >=30 non-flagged participants)
- Group models skipped (needs >=6 participants)
- Some MCMC fits flagged (divergences with small sample)
All expected and handled gracefully.

## Deviations from Plan

None -- plan executed exactly as written.

## Decisions Made

| ID | Decision | Rationale |
|----|----------|-----------|
| q001-d1 | Include bambi+pingouin in GPU env | 06_group_analysis.py imports bambi |
| q001-d2 | Exclude matplotlib/seaborn/ipywidgets | --skip-plots on cluster; saves env |
| q001-d3 | Simulate inline in orchestrator | Fast (~30s), produces input CSV |
| q001-d4 | JAX >=0.4.26,<0.4.32 | pyhgf 0.2.8 compatibility constraint |

## Regression Check

128 existing tests pass, 0 failures, 1 warning (672s total).

## Next Steps

1. Run `bash cluster/00_setup_env_gpu.sh` on M3 to create the prl_gpu environment
2. Run `sbatch cluster/01_diagnostic_gpu.slurm` to verify GPU access
3. Run `bash cluster/submit_full_pipeline.sh` for full 30-participant pipeline
4. Expected full pipeline time on A40 GPU: 3-5 hours
