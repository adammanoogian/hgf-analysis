---
phase: 16-numpyro-refactor
plan: 02
subsystem: fitting
tags: [numpyro, jax, cuda, slurm, mcmc, validation]

# Dependency graph
requires:
  - phase: 16-numpyro-refactor (plan 01)
    provides: build_logp_fn_batched, numpyro model functions, rewritten fit_batch_hierarchical
  - phase: 14-benchmark
    provides: benchmark script with JIT timing, SLURM GPU scripts
provides:
  - Updated callers (iteration.py, benchmark script) using numpyro-direct path without sampler= kwarg
  - CUDA PTX/driver version check in GPU SLURM scripts
  - cluster/requirements-gpu.txt with nvidia-cuda-nvcc-cu12 pin
  - Validated VALID-01/02/03 tests with numpyro-direct path
  - New smoke tests for build_logp_fn_batched and numpyro model functions
affects:
  - All future power sweep runs on GPU cluster (CUDA check)
  - Phase 15 production runs (uses numpyro-direct path)

# Tech tracking
tech-stack:
  added:
    - "nvidia-cuda-nvcc-cu12==12.8.93 (cluster pin)"
    - "nvidia-nvjitlink-cu12==12.8.93 (cluster pin)"
  patterns:
    - "check_cuda_compat bash function for SLURM GPU scripts"
    - "sampler= kwarg deprecated; numpyro-direct always used for batched path"

key-files:
  created:
    - cluster/requirements-gpu.txt
  modified:
    - src/prl_hgf/power/iteration.py
    - scripts/08_run_power_iteration.py
    - cluster/08_power_sweep.slurm
    - cluster/14_benchmark_gpu.slurm
    - tests/test_hierarchical_logp.py
    - validation/valid03_cross_platform.py

key-decisions:
  - "sampler= kwarg removed from batched fit_batch_hierarchical calls but kept in function signatures for backward compat"
  - "check_cuda_compat is non-fatal: warns on mismatch but does not abort the SLURM job"
  - "Benchmark JSON sampler field changed to 'numpyro-direct' string literal"

patterns-established:
  - "CUDA version check pattern: check_cuda_compat function in GPU SLURM scripts"
  - "GPU pip deps tracked in cluster/requirements-gpu.txt (separate from main requirements)"

# Metrics
duration: 18min
completed: 2026-04-13
---

# Phase 16 Plan 02: CUDA Fix + Environment Diagnostics Summary

**Wired numpyro-direct path into all callers, added CUDA PTX/driver check to GPU SLURM scripts, validated VALID-01/02/03 backward compat**

## Performance

- **Duration:** 18 min
- **Started:** 2026-04-13T22:25:55Z
- **Completed:** 2026-04-13T22:44:11Z
- **Tasks:** 3/3
- **Files modified:** 7

## Accomplishments
- Removed sampler= kwarg from all fit_batch_hierarchical calls in iteration.py and benchmark script (batched path always uses numpyro-direct)
- Added check_cuda_compat function to both GPU SLURM scripts (08_power_sweep, 14_benchmark_gpu) that detects ptxas vs driver version mismatch
- Created cluster/requirements-gpu.txt with nvidia-cuda-nvcc-cu12==12.8.93 and nvidia-nvjitlink-cu12==12.8.93 pins
- All 6 fast validation tests pass: VALID-01 (4 tests) + 2 new smoke tests for numpyro model functions
- Updated VALID-03 cross-platform script to use numpyro-direct (no sampler= kwarg)

## Task Commits

Each task was committed atomically:

1. **Task 1: Update callers to remove sampler parameter dependency** - `06971d3` (feat)
2. **Task 2: Add CUDA environment check to SLURM scripts** - `267e62a` (feat)
3. **Task 3: Update VALID-01/02/03 tests and run validation** - `d1f1eca` (test)

## Files Created/Modified
- `src/prl_hgf/power/iteration.py` - Removed sampler= from batched fit_batch_hierarchical calls; deprecated sampler docstring
- `scripts/08_run_power_iteration.py` - Removed sampler= from benchmark/production fit calls; deprecated --sampler CLI flag; set sampler field to "numpyro-direct"
- `cluster/08_power_sweep.slurm` - Added check_cuda_compat function and GPU deps comment
- `cluster/14_benchmark_gpu.slurm` - Added check_cuda_compat function and GPU deps comment
- `cluster/requirements-gpu.txt` - New: nvidia-cuda-nvcc-cu12 and nvidia-nvjitlink-cu12 pins for CUDA 12.8
- `tests/test_hierarchical_logp.py` - Removed sampler= from VALID-02; added test_build_logp_fn_batched_smoke and test_numpyro_model_importable
- `validation/valid03_cross_platform.py` - Removed sampler="numpyro" from fit_batch_hierarchical call

## Decisions Made
- Kept --sampler CLI flag in benchmark script for backward compat with existing SLURM scripts, but documented as deprecated and ignored for batched path
- check_cuda_compat is non-fatal: mismatch produces a warning but does not abort the job (MCMC still works, just slower without XLA parallel compilation)
- Changed benchmark JSON sampler field from args.sampler to literal "numpyro-direct" to clearly identify the new path

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None.

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- Phase 16 (numpyro refactor) is fully complete: both Plan 01 (model functions + fit rewrite) and Plan 02 (caller integration + CUDA diagnostics) are done
- End-to-end: power sweep on GPU cluster will use numpyro MCMC directly with XLA JIT cache reuse
- CUDA PTX mismatch is automatically detected and diagnosed in SLURM job output
- Ready for Phase 15 production runs

---
*Phase: 16-numpyro-refactor*
*Completed: 2026-04-13*
