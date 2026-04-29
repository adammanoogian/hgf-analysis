#!/bin/bash
# =============================================================================
# SLURM Job: Phase 25-05 — Prototype vs Sequential NUTS Recovery (GPU)
# =============================================================================
# Runs BlackJAX NUTS recovery on a P=20 simulated cohort using BOTH the
# prototype parallel-scan likelihood and the sequential lax.scan baseline.
# Both backends use the SAME simulated cohort (seed=2505) so per-parameter
# RMSE/ESS/R-hat/divergence comparison is meaningful.
#
# Outputs (NetCDF chains):
#   .../results/recovery_chains_sequential.nc
#   .../results/recovery_chains_proto.nc
#
# PREREQUISITE
# ------------
# `proto_grad_check.py` must report PASS first.  Until the prototype's
# `_build_hgf_closures` is refactored to thread JAX-traced theta (mirroring
# `hierarchical.py::_single_logp_3level`), this job will exit with the
# blocker diagnostic from `proto_recovery_run.py::_check_differentiability_or_exit`.
#
# Usage:
#   sbatch cluster/25_proto_recovery_gpu.slurm
#
# Plan: 25-05 — Phase 25 Parallel-Scan Acceleration Research
# Derived from: cluster/14_benchmark_gpu.slurm (Phase 14 GPU template)
# =============================================================================

#SBATCH --job-name=25-recovery-cmp
#SBATCH --output=.planning/phases/25-parallel-scan-acceleration-research/results/recovery_%j.out
#SBATCH --error=.planning/phases/25-parallel-scan-acceleration-research/results/recovery_%j.err
#SBATCH --time=08:00:00
#SBATCH --mem=32G
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu
#SBATCH --cpus-per-task=4

# =============================================================================
# Environment Setup (mirrors 14_benchmark_gpu.slurm pattern)
# =============================================================================
module load miniforge3

cd "${SLURM_SUBMIT_DIR:-$(dirname "$0")/..}"
PROJECT_ROOT="$(pwd)"

mkdir -p cluster/logs
mkdir -p .planning/phases/25-parallel-scan-acceleration-research/results
export PYTHONUNBUFFERED=1

# Activate ds_env
_PROJECT="${PROJECT:-fc37}"
conda activate ds_env 2>/dev/null || \
conda activate /scratch/${_PROJECT}/${USER}/conda/envs/ds_env 2>/dev/null || {
    echo "ERROR: Failed to activate ds_env conda environment"
    exit 1
}

# Repair editable install (Phase 14.1-03 regression guard)
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
# ptxas PATH (nvidia-cuda-nvcc-cu12 — mirrors 14_benchmark_gpu.slurm)
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
export JAX_COMPILATION_CACHE_DIR="/scratch/${_PROJECT}/${USER}/.jax_cache_gpu/shared_25recovery"
export JAX_PERSISTENT_CACHE_MIN_ENTRY_SIZE_BYTES=0
export JAX_PERSISTENT_CACHE_MIN_COMPILE_TIME_SECS=0
mkdir -p "$JAX_COMPILATION_CACHE_DIR" 2>/dev/null || unset JAX_COMPILATION_CACHE_DIR

# =============================================================================
# Banner
# =============================================================================
echo "============================================================"
echo "Phase 25-05: NUTS Recovery Comparison (proto vs sequential)"
echo "============================================================"
echo "Job ID:  ${SLURM_JOB_ID:-local}"
echo "Node:    ${SLURMD_NODENAME:-$(hostname)}"
echo "GPU(s):  ${CUDA_VISIBLE_DEVICES:-none}"
echo "JAX cache: ${JAX_COMPILATION_CACHE_DIR:-disabled}"
echo "JAX_ENABLE_X64: ${JAX_ENABLE_X64}"
echo "Start:   $(date)"
echo "============================================================"
echo ""

# Verify GPU
python -c "
import jax
devices = jax.devices()
gpu = [d for d in devices if d.platform == 'gpu']
print(f'JAX devices: {devices}')
if not gpu:
    print('ERROR: No GPU detected — recovery results will not be meaningful!')
    import sys; sys.exit(1)
print(f'GPU: {gpu[0]}')
print(f'JAX version: {jax.__version__}')
"
if [[ $? -ne 0 ]]; then
    echo "GPU check failed. Exiting."
    exit 1
fi
echo ""

# =============================================================================
# Pre-flight: differentiability gate (proto_grad_check.py must PASS)
# =============================================================================
echo "Pre-flight: running proto_grad_check.py to confirm differentiability..."
python .planning/phases/25-parallel-scan-acceleration-research/scratch/proto_grad_check.py
GRAD_EXIT=$?
if [[ $GRAD_EXIT -ne 0 ]]; then
    echo ""
    echo "ABORT: proto_grad_check.py failed (exit ${GRAD_EXIT})."
    echo "  See .../results/proto_grad_check.log for the failure mode."
    echo "  Recovery run will not produce meaningful results until the prototype"
    echo "  is refactored to thread JAX-traced theta (see hierarchical.py::"
    echo "  _single_logp_3level for the production shallow-copy pattern)."
    exit ${GRAD_EXIT}
fi
echo "proto_grad_check.py PASS — proceeding to NUTS recovery."
echo ""

# =============================================================================
# Recovery run: sequential first (baseline), then proto
# =============================================================================
RESULTS_DIR=".planning/phases/25-parallel-scan-acceleration-research/results"
SEQ_NC="${RESULTS_DIR}/recovery_chains_sequential.nc"
PRO_NC="${RESULTS_DIR}/recovery_chains_proto.nc"

echo "[1/2] Sequential baseline NUTS..."
python .planning/phases/25-parallel-scan-acceleration-research/scratch/proto_recovery_run.py \
    --backend sequential \
    --seed 2505 \
    --n-participants 20 \
    --n-trials 420 \
    --num-warmup 1000 \
    --num-samples 1000 \
    --num-chains 4 \
    --out "${SEQ_NC}" \
    --allow-unblocked
SEQ_EXIT=$?

echo ""
echo "[2/2] Prototype parallel-scan NUTS..."
python .planning/phases/25-parallel-scan-acceleration-research/scratch/proto_recovery_run.py \
    --backend proto \
    --seed 2505 \
    --n-participants 20 \
    --n-trials 420 \
    --num-warmup 1000 \
    --num-samples 1000 \
    --num-chains 4 \
    --out "${PRO_NC}" \
    --allow-unblocked
PRO_EXIT=$?

echo ""
echo "============================================================"
if [[ $SEQ_EXIT -eq 0 && $PRO_EXIT -eq 0 ]]; then
    echo "RECOVERY COMPLETE (both backends)"
    ls -lh "${SEQ_NC}" "${PRO_NC}" 2>/dev/null || true
else
    echo "RECOVERY FAILED — sequential_exit=${SEQ_EXIT} proto_exit=${PRO_EXIT}"
fi

echo ""
echo "End: $(date)"
echo "============================================================"

# =============================================================================
# Auto-push results to git (mirrors 14_benchmark_gpu.slurm pattern)
# Runs regardless of EXIT_CODE so failed runs still upload error logs.
# =============================================================================
echo ""
echo "Pushing recovery results to git..."

_LOG_OUT="${RESULTS_DIR}/recovery_${SLURM_JOB_ID}.out"
_LOG_ERR="${RESULTS_DIR}/recovery_${SLURM_JOB_ID}.err"

git add "${_LOG_OUT}" "${_LOG_ERR}" 2>/dev/null
git add "${SEQ_NC}" "${PRO_NC}" 2>/dev/null
git add "${RESULTS_DIR}/proto_grad_check.log" 2>/dev/null
git add .planning/STATE.md 2>/dev/null
if ! git diff --cached --quiet 2>/dev/null; then
    git commit -m "bench phase25-05 gpu nuts-recovery (job ${SLURM_JOB_ID})"
    if git push origin main 2>/dev/null; then
        echo "Pushed recovery results to origin/main"
    else
        echo "WARNING: git push failed — results committed locally only"
    fi
else
    echo "No new files to push"
fi

# Overall exit: nonzero if either backend failed
if [[ $SEQ_EXIT -ne 0 ]]; then
    exit ${SEQ_EXIT}
fi
exit ${PRO_EXIT}
