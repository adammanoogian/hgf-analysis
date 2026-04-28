#!/bin/bash
# =============================================================================
# SLURM Job: Phase 25-04 — HGF Prototype GPU Timing Benchmark
# =============================================================================
# Benchmarks parallel-scan vs sequential HGF log-likelihood at three
# (P, T) shapes across three init strategies (cold, linear, cached).
#
# PREREQUISITE: Repair Phase 14.1-03 pip-install issue on M3 before submitting:
#   cd $PROJECT_ROOT && pip install -e . --quiet
# Verify: python -c "import prl_hgf; print('OK')"
#
# Results written to: results/diagnostics/hgf_pscan_proto.json
# Incremental write: JSON is updated after each cell — partial results survive
# SLURM timeout (important for the T=2000 cells).
#
# Usage:
#   # From project root on M3:
#   sbatch cluster/25_proto_timing_gpu.slurm
#
# Expected speedups (per 25-RESEARCH.md §9 + 25-04 CPU baseline):
#   (P=50,  T=420)  cold init: 0.5-2x (marginal; T near breakeven on GPU)
#   (P=300, T=420)  cold init: possibly higher (better GPU occupancy)
#   (P=50,  T=2000) cold init: 5-20x  (firmly in win zone on GPU)
#   cached init:    lower K (1-3) across all shapes
# =============================================================================

#SBATCH --job-name=25-proto-timing
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=04:00:00
#SBATCH --mem=32G
#SBATCH --cpus-per-task=4
#SBATCH --output=.planning/phases/25-parallel-scan-acceleration-research/results/proto_timing_%j.out
#SBATCH --error=.planning/phases/25-parallel-scan-acceleration-research/results/proto_timing_%j.err

# =============================================================================
# Environment Setup (mirrors cluster/14_benchmark_gpu.slurm)
# =============================================================================
module load miniforge3

cd "${SLURM_SUBMIT_DIR:-$(dirname "$0")/..}"
PROJECT_ROOT="$(pwd)"

mkdir -p .planning/phases/25-parallel-scan-acceleration-research/results
mkdir -p results/diagnostics
export PYTHONUNBUFFERED=1

# Activate ds_env
_PROJECT="${PROJECT:-fc37}"
conda activate ds_env 2>/dev/null || \
conda activate /scratch/${_PROJECT}/${USER}/conda/envs/ds_env 2>/dev/null || {
    echo "ERROR: Failed to activate ds_env conda environment"
    exit 1
}

# Repair editable install (Phase 14.1-03 pip-install regression guard)
echo "Verifying prl_hgf editable install..."
python -c "import prl_hgf" 2>/dev/null || {
    echo "Editable install missing — running pip install -e . ..."
    pip install -e . --quiet
    python -c "import prl_hgf" || {
        echo "ERROR: prl_hgf not importable after pip install -e ."
        exit 1
    }
}
echo "prl_hgf import OK"

# =============================================================================
# ptxas PATH (nvidia-cuda-nvcc-cu12 — mirrors cluster/14_benchmark_gpu.slurm)
# =============================================================================
PTXAS_BIN=$(python -c 'import nvidia.cuda_nvcc, os; print(os.path.join(os.path.dirname(nvidia.cuda_nvcc.__file__), "bin"))' 2>/dev/null)
if [[ -n "$PTXAS_BIN" && -d "$PTXAS_BIN" ]]; then
    export PATH="$PTXAS_BIN:$PATH"
    echo "Added ptxas to PATH: $PTXAS_BIN"
fi

# =============================================================================
# JAX configuration
# =============================================================================
export JAX_ENABLE_X64=1
export XLA_PYTHON_CLIENT_PREALLOCATE=false

# JAX compilation cache (Lustre scratch, shared across nodes)
export JAX_COMPILATION_CACHE_DIR="/scratch/${_PROJECT}/${USER}/.jax_cache_gpu/shared_25proto"
export JAX_PERSISTENT_CACHE_MIN_ENTRY_SIZE_BYTES=0
export JAX_PERSISTENT_CACHE_MIN_COMPILE_TIME_SECS=0
mkdir -p "$JAX_COMPILATION_CACHE_DIR" 2>/dev/null || unset JAX_COMPILATION_CACHE_DIR

# =============================================================================
# Banner
# =============================================================================
echo "============================================================"
echo "Phase 25-04 HGF Prototype GPU Timing Benchmark"
echo "============================================================"
echo "Job ID:  ${SLURM_JOB_ID:-local}"
echo "Node:    ${SLURMD_NODENAME:-$(hostname)}"
echo "GPU(s):  ${CUDA_VISIBLE_DEVICES:-none}"
echo "JAX cache: ${JAX_COMPILATION_CACHE_DIR:-disabled}"
echo "Start:   $(date)"
echo "============================================================"
echo ""

# Verify GPU is present
python -c "
import jax
devices = jax.devices()
gpu = [d for d in devices if d.platform == 'gpu']
print(f'JAX devices: {devices}')
if not gpu:
    print('ERROR: No GPU detected — benchmark results will not be meaningful!')
    import sys; sys.exit(1)
print(f'GPU: {gpu[0]}')
"
echo ""

# =============================================================================
# Run timing benchmark
# =============================================================================
echo "Running 9-cell timing benchmark (3 shapes x 3 init strategies)..."
echo "Results written incrementally to results/diagnostics/hgf_pscan_proto.json"
echo ""

python .planning/phases/25-parallel-scan-acceleration-research/scratch/proto_timing_benchmark.py

EXIT_CODE=$?

echo ""
echo "============================================================"
if [[ $EXIT_CODE -eq 0 ]]; then
    echo "BENCHMARK COMPLETE"
    echo ""
    if [[ -f results/diagnostics/hgf_pscan_proto.json ]]; then
        echo "Results summary:"
        python -m json.tool results/diagnostics/hgf_pscan_proto.json 2>/dev/null || \
            cat results/diagnostics/hgf_pscan_proto.json
    fi
else
    echo "BENCHMARK FAILED (exit code: $EXIT_CODE)"
    echo "Check: .planning/phases/25-parallel-scan-acceleration-research/results/proto_timing_${SLURM_JOB_ID}.err"
    echo "Partial results (if any):"
    cat results/diagnostics/hgf_pscan_proto.json 2>/dev/null | python -m json.tool 2>/dev/null || true
fi

echo ""
echo "End: $(date)"
echo "============================================================"

# =============================================================================
# Auto-push results to git (so local machine can git pull)
# =============================================================================
echo ""
echo "Pushing benchmark results to git..."
_LOG_OUT=".planning/phases/25-parallel-scan-acceleration-research/results/proto_timing_${SLURM_JOB_ID}.out"
_LOG_ERR=".planning/phases/25-parallel-scan-acceleration-research/results/proto_timing_${SLURM_JOB_ID}.err"

git add "${_LOG_OUT}" "${_LOG_ERR}" 2>/dev/null
git add results/diagnostics/hgf_pscan_proto.json 2>/dev/null
git add .planning/STATE.md 2>/dev/null
if ! git diff --cached --quiet 2>/dev/null; then
    git commit -m "bench phase25-04 gpu timing (job ${SLURM_JOB_ID})"
    if git push origin main 2>/dev/null; then
        echo "Pushed benchmark results to origin/main"
    else
        echo "WARNING: git push failed — results committed locally only"
    fi
else
    echo "No new files to push"
fi

exit $EXIT_CODE
