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
#SBATCH --output=logs/bench14cpu_%j.out
#SBATCH --error=logs/bench14cpu_%j.err
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

# Run-commit provenance: pin every log to the commit it ran from
echo "============================================================"
echo "Run commit: $(git rev-parse --short HEAD 2>/dev/null) [$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ') dirty] — $(git log -1 --format=%s 2>/dev/null)"
echo "Run job:    ${SLURM_JOB_ID:-<no-slurm>} on $(hostname)"
echo "============================================================"

mkdir -p cluster/logs models/power
export PYTHONUNBUFFERED=1

_PROJECT="${PROJECT:-fc37}"
_CONDA_ENV="${CONDA_ENV:-ds_env}"
conda activate "${_CONDA_ENV}" 2>/dev/null || \
conda activate /scratch/${_PROJECT}/${USER}/conda/envs/"${_CONDA_ENV}" 2>/dev/null || {
    echo "ERROR: Failed to activate ${_CONDA_ENV} conda environment"
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
export FIT_CHAINS="${FIT_CHAINS:-4}"

# Precision: JAX_X64=1 sets fp64 (numerically correct for HGF integrators;
# may eliminate the step_size→1e-10 underflow seen in fp32 runs).
export JAX_X64="${JAX_X64:-0}"
_X64_FLAG=""
if [[ "${JAX_X64}" == "1" ]]; then
    _X64_FLAG="--enable-x64"
fi

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
echo "Phase 14 CPU Benchmark"
echo "============================================================"
echo "Job ID:  ${SLURM_JOB_ID:-local}"
echo "Node:    ${SLURMD_NODENAME:-$(hostname)}"
echo "JAX cache: ${JAX_COMPILATION_CACHE_DIR:-disabled}"
echo "Sampler:  ${SAMPLER}"
echo "Fit chains: ${FIT_CHAINS}"
echo "Precision:  $([[ "${JAX_X64}" == "1" ]] && echo fp64 || echo fp32)  (JAX_X64=${JAX_X64})"
echo "Max tree depth: ${MAX_TREE_DEPTH}"
echo "Laplace warmup: ${LAPLACE_WARMUP}"
echo "Tight omega3:   ${TIGHT_OMEGA3}"
echo "Laplace only:   ${LAPLACE_ONLY}"
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

python scripts/03_pre_analysis/03_run_power_iteration.py \
    --benchmark \
    --chunk-id 0 \
    --job-id "${SLURM_JOB_ID:-bench14cpu}" \
    --fit-chains "${FIT_CHAINS}" \
    --fit-draws 500 \
    --fit-tune 500 \
    --sampler "${SAMPLER}" \
    --max-tree-depth "${MAX_TREE_DEPTH}" \
    ${_X64_FLAG} \
    ${_LAPLACE_FLAG} \
    ${_TIGHT_OMEGA3_FLAG} \
    ${_LAPLACE_ONLY_FLAG}

EXIT_CODE=$?

echo ""
echo "============================================================"

if [[ $EXIT_CODE -eq 0 ]]; then
    echo "BENCHMARK COMPLETE"
    echo ""
    if [[ -f models/power/benchmark_batched.json ]]; then
        echo "Results:"
        cat models/power/benchmark_batched.json | python -m json.tool 2>/dev/null || \
            cat models/power/benchmark_batched.json
    fi
else
    echo "BENCHMARK FAILED (exit code: $EXIT_CODE)"
    echo "Check: logs/bench14cpu_${SLURM_JOB_ID}.err"
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
_LOG_OUT="logs/bench14cpu_${SLURM_JOB_ID}.out"
_LOG_ERR="logs/bench14cpu_${SLURM_JOB_ID}.err"

git add "${_LOG_OUT}" "${_LOG_ERR}"
# Silent no-op when sampling never produced output (e.g. crash mid-warmup) —
# the .out / .err logs are still pushed below so the failure is visible.
git add models/power/benchmark_batched.json 2>/dev/null || true
git add .planning/STATE.md 2>/dev/null  # gitignored by design — silent skip OK
if ! git diff --cached --quiet; then
    git commit -m "bench phase14 cpu sampler=${SAMPLER} mtd=${MAX_TREE_DEPTH} (job ${SLURM_JOB_ID})"
    git pull --rebase --autostash origin main || {
        echo "WARNING: git pull --rebase failed — aborting push to avoid lost work"
        git rebase --abort 2>/dev/null
        exit $EXIT_CODE
    }
    if git push origin main; then
        echo "Pushed benchmark results to origin/main"
    else
        echo "WARNING: git push failed — results committed locally only on $(hostname)"
    fi
else
    echo "No new files to push (check .gitignore if outputs exist on disk)"
fi

exit $EXIT_CODE
