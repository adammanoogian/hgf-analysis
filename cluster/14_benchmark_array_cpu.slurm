#!/bin/bash
# =============================================================================
# SLURM Array Job: Phase 14.2 variant 4 — CPU bench, P=50 chunks
# =============================================================================
# CPU partition equivalent of cluster/14_benchmark_array_gpu.slurm.  Same
# Python entry, same chunk-50 participant split.  Submit whichever queue
# is shorter that day; statistical answer is identical (BlackJAX path
# uses independent priors per PS — see _build_log_posterior in
# src/prl_hgf/fitting/hierarchical.py).
#
# Usage:
#   sbatch cluster/14_benchmark_array_cpu.slurm
#   sbatch --export=ALL,MAX_TREE_DEPTH=8 cluster/14_benchmark_array_cpu.slurm
#
# Manual flush after array completes:
#   git add cluster/logs/bench14arrcpu_${SLURM_ARRAY_JOB_ID}_*.{out,err} \
#           results/power/benchmark_batched_chunk_*.json
#   git commit -m "bench14 array cpu: ${SLURM_ARRAY_JOB_ID}"
#   git push origin main
# =============================================================================

#SBATCH --job-name=prl_bench14arrcpu
#SBATCH --output=cluster/logs/bench14arrcpu_%A_%a.out
#SBATCH --error=cluster/logs/bench14arrcpu_%A_%a.err
#SBATCH --array=0-5
#SBATCH --time=04:00:00
#SBATCH --mem=32G
#SBATCH --partition=comp
#SBATCH --cpus-per-task=8

# =============================================================================
# Environment Setup
# =============================================================================
module load miniforge3

cd "${SLURM_SUBMIT_DIR:-$(dirname "$0")/..}"
PROJECT_ROOT="$(pwd)"

mkdir -p cluster/logs models/power
export PYTHONUNBUFFERED=1

_PROJECT="${PROJECT:-fc37}"
conda activate ds_env 2>/dev/null || \
conda activate /scratch/${_PROJECT}/${USER}/conda/envs/ds_env 2>/dev/null || {
    echo "ERROR: Failed to activate ds_env conda environment"
    exit 1
}

# Force CPU platform — separate cache so cross-architecture HLO don't collide.
export JAX_PLATFORMS=cpu
unset CUDA_VISIBLE_DEVICES

export JAX_COMPILATION_CACHE_DIR="/scratch/${_PROJECT}/${USER}/.jax_cache_cpu/shared"
export JAX_PERSISTENT_CACHE_MIN_ENTRY_SIZE_BYTES=0
export JAX_PERSISTENT_CACHE_MIN_COMPILE_TIME_SECS=0
mkdir -p "$JAX_COMPILATION_CACHE_DIR" 2>/dev/null

mkdir -p "$HOME/.cache/arviz"
date +%Y-%m-%d > "$HOME/.cache/arviz/daily_warning"

# =============================================================================
# Variant knobs
# =============================================================================
export SAMPLER="${SAMPLER:-blackjax}"
export MAX_TREE_DEPTH="${MAX_TREE_DEPTH:-10}"
export PARTICIPANT_CHUNK_COUNT="${PARTICIPANT_CHUNK_COUNT:-6}"

# variant 2: Laplace warmup
export LAPLACE_WARMUP="${LAPLACE_WARMUP:-0}"
_LAPLACE_FLAG=""
if [[ "${LAPLACE_WARMUP}" == "1" ]]; then
    _LAPLACE_FLAG="--laplace-warmup"
fi

# variant 3: tight ω₃ prior
export TIGHT_OMEGA3="${TIGHT_OMEGA3:-0}"
_TIGHT_OMEGA3_FLAG=""
if [[ "${TIGHT_OMEGA3}" == "1" ]]; then
    _TIGHT_OMEGA3_FLAG="--tight-omega3-prior"
fi

# variant 5: Laplace-only
export LAPLACE_ONLY="${LAPLACE_ONLY:-0}"
_LAPLACE_ONLY_FLAG=""
if [[ "${LAPLACE_ONLY}" == "1" ]]; then
    _LAPLACE_ONLY_FLAG="--laplace-only"
fi

# =============================================================================
# Banner
# =============================================================================
echo "============================================================"
echo "Phase 14.2 variant 4 — Array bench (CPU)"
echo "============================================================"
echo "Array job ID:   ${SLURM_ARRAY_JOB_ID:-local}"
echo "Array task ID:  ${SLURM_ARRAY_TASK_ID:-0}"
echo "Node:           ${SLURMD_NODENAME:-$(hostname)}"
echo "Sampler:        ${SAMPLER}"
echo "Max tree depth: ${MAX_TREE_DEPTH}"
echo "Chunk count:    ${PARTICIPANT_CHUNK_COUNT}"
echo "Chunk id:       ${SLURM_ARRAY_TASK_ID:-0}"
echo "Laplace warmup: ${LAPLACE_WARMUP}"
echo "Tight omega3:   ${TIGHT_OMEGA3}"
echo "Laplace only:   ${LAPLACE_ONLY}"
echo "Start:          $(date)"
echo "============================================================"
echo ""

python -c "import jax; print(f'JAX devices: {jax.devices()} backend: {jax.default_backend()}')"
echo ""

python scripts/08_run_power_iteration.py \
    --benchmark \
    --chunk-id 0 \
    --job-id "${SLURM_ARRAY_JOB_ID:-bench14arrcpu}_${SLURM_ARRAY_TASK_ID:-0}" \
    --fit-chains 4 \
    --fit-draws 500 \
    --fit-tune 500 \
    --sampler "${SAMPLER}" \
    --max-tree-depth "${MAX_TREE_DEPTH}" \
    --participant-chunk-id "${SLURM_ARRAY_TASK_ID:-0}" \
    --participant-chunk-count "${PARTICIPANT_CHUNK_COUNT}" \
    ${_LAPLACE_FLAG} \
    ${_TIGHT_OMEGA3_FLAG} \
    ${_LAPLACE_ONLY_FLAG}

EXIT_CODE=$?

echo ""
echo "============================================================"
if [[ $EXIT_CODE -eq 0 ]]; then
    echo "ARRAY TASK ${SLURM_ARRAY_TASK_ID} COMPLETE"
else
    echo "ARRAY TASK ${SLURM_ARRAY_TASK_ID} FAILED (exit $EXIT_CODE)"
fi
echo "End: $(date)"
echo "============================================================"

exit $EXIT_CODE
