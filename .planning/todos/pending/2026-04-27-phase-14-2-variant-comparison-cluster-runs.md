---
created: 2026-04-27T11:33
title: Phase 14.2 variant comparison — submit cluster runs when GPU available
area: tooling
files:
  - cluster/14_benchmark_gpu.slurm
  - cluster/14_benchmark_cpu.slurm
  - cluster/14_benchmark_array_gpu.slurm
  - cluster/14_benchmark_array_cpu.slurm
  - scripts/14_2_aggregate_variants.py
  - src/prl_hgf/fitting/hierarchical.py
  - src/prl_hgf/power/iteration.py
  - scripts/08_run_power_iteration.py
---

## Problem

Variants 1-5 of the Phase 14.2 bench14 fix-set are implemented and pushed,
but no cluster compute is currently available to run them.  Without the
empirical comparison, we don't know which variant(s) are load-bearing for
making the bench tractable, and we can't answer the GPU-vs-CPU decision
gate that Phase 14 originally targeted (and that has never reached Phase
2 fit completion in any of the 11 historical runs).

The 5 variants attack different layers:

- Variant 1 (`MAX_TREE_DEPTH=8`): runtime cap, bounds leapfrog count per
  draw to 256 instead of 1024.
- Variant 2 (`LAPLACE_WARMUP=1`): replaces BlackJAX `window_adaptation`
  (12-15h on production cohort per jobs 54947091, 54969668) with
  jaxopt LBFGS + Hessian diag at the MAP, producing
  (step_size, inverse_mass_matrix) in seconds-to-minutes.
- Variant 3 (`TIGHT_OMEGA3=1`): tighter ω₃ prior `Normal(-6, 1.0)` to
  collapse the (μ₃, ω₃) funnel arm.
- Variant 4 (P=50 SLURM array, default in `*_array_*.slurm`): splits
  cohort into 6 group×session chunks, parallel.  Statistically
  identical to monolithic P=300 because the BlackJAX path uses
  IID priors per PS.
- Variant 5 (`LAPLACE_ONLY=1`): forces n_tune=1, n_draws=1, Laplace
  warmup — the supplement-not-replacement baseline.

Diagnostic instrumentation (commit 0055408) captures per-step tree
depth, leapfrog count, divergent transitions, energy drift, and
window-partitioned summary so each variant's `[diag warmup|sample]`
lines flow into the post-hoc aggregator.

Implementation commits, in order:
- 0055408 — per-step NUTS diagnostic logging
- 3995412 — variant 1 (max_tree_depth) + `14_benchmark_cpu.slurm`
- f4f17ef — variant 4 (SLURM array, P=50 chunks, GPU + CPU)
- d23af36 — variant-comparison aggregator script
- 385e8c3 — variant 2 (Laplace warm-start)
- 6c4da42 — variant 3 (tight ω₃ prior)
- f5a5b83 — variant 5 (Laplace-only baseline)

## Solution

Submit the runs from the cluster login node when GPU compute is
available.  Each is one independent `sbatch` invocation; env vars are
stackable (e.g., `MAX_TREE_DEPTH=8,LAPLACE_WARMUP=1` enables variants
1+2 simultaneously).

**Pragmatic minimum (2 runs):**

```bash
# Variant 4 alone — P=50 chunking, default knobs.  Baseline per-chunk timing.
sbatch cluster/14_benchmark_array_gpu.slurm

# Variants 1+2+3+4 stack — what to land in production if every individual
# variant proves out.
sbatch --export=ALL,MAX_TREE_DEPTH=8,LAPLACE_WARMUP=1,TIGHT_OMEGA3=1 \
  cluster/14_benchmark_array_gpu.slurm
```

If both succeed, you have a working bench.  If only the second works,
that points to which knob is doing the load-bearing work — backfill
individual ablations as needed.

**Full ablation (7 more runs, ~5 GPU-hours total + ~2 CPU-hours):**

```bash
# Control: full P=300 baseline (may TIME_LIMIT again — that's data too).
sbatch cluster/14_benchmark_gpu.slurm

# Variant 1 alone, full cohort.
sbatch --export=ALL,MAX_TREE_DEPTH=8 cluster/14_benchmark_gpu.slurm

# Variant 4 on CPU partition — closes the GPU-vs-CPU decision gate
# Phase 14 originally targeted.
sbatch cluster/14_benchmark_array_cpu.slurm

# 1+4 (cap + chunking, no Laplace, default prior).
sbatch --export=ALL,MAX_TREE_DEPTH=8 cluster/14_benchmark_array_gpu.slurm

# Variant 2 alone (Laplace warm-start, default cap and prior).
sbatch --export=ALL,LAPLACE_WARMUP=1 cluster/14_benchmark_array_gpu.slurm

# Variant 3 alone (tight ω₃, default cap and Laplace).
sbatch --export=ALL,TIGHT_OMEGA3=1 cluster/14_benchmark_array_gpu.slurm

# Variant 5 baseline (Laplace-only, NUTS as 1-tune/1-draw token).
sbatch --export=ALL,LAPLACE_ONLY=1 cluster/14_benchmark_array_gpu.slurm
```

**After each array-mode run completes**, manually flush the stranded logs
(auto-push is disabled inside arrays to avoid 6 concurrent `git push`
races):

```bash
git add cluster/logs/bench14arr_${SLURM_ARRAY_JOB_ID}_*.{out,err} \
        results/power/benchmark_batched_chunk_*.json
git commit -m "bench14 array: ${SLURM_ARRAY_JOB_ID}"
git push origin main
```

(Replace `bench14arr` with `bench14arrcpu` for the CPU array.)

**After all desired variants land**, locally:

```bash
git pull
python scripts/14_2_aggregate_variants.py
```

This generates `results/diagnostics/variant_comparison.{csv,md,json}`,
sorted with successful runs first by warmup wall time.  Columns:
outcome, P_cohort, max_tree_depth, chunk, warmup_s, sample_s,
saturated_frac, divergent count, leapfrog total, node, log filename.

**Open Tier 4 (defer, research-level):** parallel-scan / DEER for the
trial-axis lax.scan as the GPU underutilization fix beyond what variants
1–5 deliver.  Sister-repo `affine_scan` (`rlwm_trauma_analysis/src/rlwm/
fitting/core.py:332`) doesn't apply — HGF level-2 update has
state-dependent coefficients (sigmoid Jacobian of previous μ₂).
Särkkä-style parallel extended Kalman over HGF's local linearization
(matrix-tuple operator, blog: <https://anandksub.dev/blog/parallel_kalman>)
is the candidate.  RLWM CPU benchmark was 0.26× and GPU A100 numbers
were never recorded — expected payoff is uncertain.  Revisit only if
variants 1–5 leave runtime above the bench budget.
