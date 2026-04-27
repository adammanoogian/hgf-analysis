#!/bin/bash
# =============================================================================
# SLURM Job: Phase 14.2 — CPU Benchmark variant (mirror of bench14_gpu)
# =============================================================================
# Same Python entry point as cluster/14_benchmark_gpu.slurm but runs on the
# `comp` partition (CPU only) so the variant comparison rig can submit to
# whichever queue is shorter that day.  Phase 14 was originally supposed to
# settle the GPU-vs-CPU decision gate; with the production-N warm-up upgrade
# (commit 6b7e6ed) the bench has never reached the decision step on either
# partition.  Variant-4 (P=50 SLURM array) is designed to make the bench
# tractable on both, finally closing the gate empirically.
#
# Usage:
#   sbatch cluster/14_benchmark_cpu.slurm                                   # default knobs
#   sbatch --export=ALL,MAX_TREE_DEPTH=8 cluster/14_benchmark_cpu.slurm     # variant 1 cap
#   sbatch --export=ALL,SAMPLER=numpyro cluster/14_benchmark_cpu.slurm      # NumPyro baseline
# =============================================================================

#SBATCH --job-name=prl_bench14cpu
#SBATCH --output=cluster/logs/bench14cpu_%j.out
#SBATCH --error=cluster/logs/bench14cpu_%j.err
#SBATCH --time=24:00:00
#SBATCH --mem=128G
#SBATCH --partition=comp
#SBATCH --cpus-per-task=16

# =============================================================================
# Environment Setup
# =============================================================================
module load miniforge3

cd "${SLURM_SUBMIT_DIR:-$(dirname "$0")/..}"
PROJECT_ROOT="$(pwd)"

mkdir -p cluster/logs results/power
export PYTHONUNBUFFERED=1

_PROJECT="${PROJECT:-fc37}"
conda activate ds_env 2>/dev/null || \
conda activate /scratch/${_PROJECT}/${USER}/conda/envs/ds_env 2>/dev/null || {
    echo "ERROR: Failed to activate ds_env conda environment"
    exit 1
}

# Force CPU platform.  Cross-architecture cache contamination would invalidate
# every entry, so use a CPU-specific cache dir (mirrors 16_smoke_test_cpu.slurm).
export JAX_PLATFORMS=cpu
unset CUDA_VISIBLE_DEVICES

export JAX_COMPILATION_CACHE_DIR="/scratch/${_PROJECT}/${USER}/.jax_cache_cpu/shared"
export JAX_PERSISTENT_CACHE_MIN_ENTRY_SIZE_BYTES=0
export JAX_PERSISTENT_CACHE_MIN_COMPILE_TIME_SECS=0
mkdir -p "$JAX_COMPILATION_CACHE_DIR" 2>/dev/null || {
    echo "WARNING: Could not create JAX cache dir, disabling cache"
    unset JAX_COMPILATION_CACHE_DIR
}

# Pre-warm ArviZ daily-warning file to defeat import-time race (14.1-07 follow-up)
mkdir -p "$HOME/.cache/arviz"
date +%Y-%m-%d > "$HOME/.cache/arviz/daily_warning"

# =============================================================================
# Sampler selection (default: blackjax — Phase 17 production sampler)
# =============================================================================
export SAMPLER="${SAMPLER:-blackjax}"

# =============================================================================
# Phase 14.2 variant knobs — overridable from sbatch --export=...
#   MAX_TREE_DEPTH=8  : variant 1, caps each NUTS draw at 256 leapfrogs
#                       (BlackJAX default is 10 = 1024).  Persistent JAX
#                       cache picks up a new HLO entry; default 10 keeps
#                       the existing cache valid.
# =============================================================================
export MAX_TREE_DEPTH="${MAX_TREE_DEPTH:-10}"

# =============================================================================
# Banner
# =============================================================================
echo "============================================================"
echo "Phase 14 CPU Benchmark"
echo "============================================================"
echo "Job ID:  ${SLURM_JOB_ID:-local}"
echo "Node:    ${SLURMD_NODENAME:-$(hostname)}"
echo "JAX cache: ${JAX_COMPILATION_CACHE_DIR:-disabled}"
echo "Sampler:  ${SAMPLER}"
echo "Max tree depth: ${MAX_TREE_DEPTH}"
echo "Start:   $(date)"
echo "============================================================"
echo ""

python -c "
import jax
devices = jax.devices()
print(f'JAX devices: {devices}')
print(f'JAX backend: {jax.default_backend()}')
"
echo ""

# =============================================================================
# Run Benchmark
# =============================================================================
echo "Running batched hierarchical benchmark..."
echo ""

python scripts/08_run_power_iteration.py \
    --benchmark \
    --chunk-id 0 \
    --job-id "${SLURM_JOB_ID:-bench14cpu}" \
    --fit-chains 4 \
    --fit-draws 500 \
    --fit-tune 500 \
    --sampler "${SAMPLER}" \
    --max-tree-depth "${MAX_TREE_DEPTH}"

EXIT_CODE=$?

echo ""
echo "============================================================"

if [[ $EXIT_CODE -eq 0 ]]; then
    echo "BENCHMARK COMPLETE"
    echo ""
    if [[ -f results/power/benchmark_batched.json ]]; then
        echo "Results:"
        cat results/power/benchmark_batched.json | python -m json.tool 2>/dev/null || \
            cat results/power/benchmark_batched.json
    fi
else
    echo "BENCHMARK FAILED (exit code: $EXIT_CODE)"
    echo "Check: cluster/logs/bench14cpu_${SLURM_JOB_ID}.err"
fi

echo ""
echo "End: $(date)"
echo "============================================================"

# =============================================================================
# Auto-push logs and results to git
# Runs regardless of EXIT_CODE so failed bench still uploads its .err log.
# =============================================================================
echo ""
echo "Pushing benchmark results to git..."
_LOG_OUT="cluster/logs/bench14cpu_${SLURM_JOB_ID}.out"
_LOG_ERR="cluster/logs/bench14cpu_${SLURM_JOB_ID}.err"

git add "${_LOG_OUT}" "${_LOG_ERR}" 2>/dev/null
git add results/power/benchmark_batched.json 2>/dev/null
git add .planning/STATE.md 2>/dev/null
if ! git diff --cached --quiet 2>/dev/null; then
    git commit -m "bench phase14 cpu sampler=${SAMPLER} mtd=${MAX_TREE_DEPTH} (job ${SLURM_JOB_ID})"
    if git push origin main 2>/dev/null; then
        echo "Pushed benchmark results to origin/main"
    else
        echo "WARNING: git push failed — results committed locally only"
    fi
else
    echo "No new files to push"
fi

exit $EXIT_CODE
