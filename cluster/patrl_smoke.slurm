#!/bin/bash
# =============================================================================
# SLURM Job: Plan 20-05 — PAT-RL SC5 Cohort Smoke (40 × 4 = 160 agents, CPU)
# =============================================================================
# SC5: 4 phenotypes × 40 agents = 160-agent cohort for PRL-V1/V2 formal gates
# (Phase 20-07). Invokes scripts/12_smoke_patrl_foundation.py with the
# production-scale cohort defaults.
#
# Usage:
#   sbatch cluster/patrl_smoke.slurm                          # defaults
#   sbatch --export=ALL,PRL_PATRL_SMOKE_N=5 cluster/patrl_smoke.slurm
#   sbatch --export=ALL,PRL_PATRL_SMOKE_PHENOTYPES=healthy cluster/patrl_smoke.slurm
#
# Output (git-tracked under results/ so artifacts auto-push to origin):
#   results/patrl_smoke/${SLURM_JOB_ID}/   (trajectory CSVs, param summary,
#                                            idata_{laplace,nuts}.nc,
#                                            laplace_vs_nuts_diff.csv)
#   cluster/logs/patrl_smoke_${SLURM_JOB_ID}.out/.err
#
# Default fit method is 'both' (dual NUTS + Laplace) consistent with the
# 18_smoke_patrl_cpu.slurm policy set in Plans 18-06/19-05.
# Override via PRL_PATRL_SMOKE_METHOD at submission time.
# =============================================================================

#SBATCH --job-name=prl_patrl_smoke
#SBATCH --output=cluster/logs/patrl_smoke_%j.out
#SBATCH --error=cluster/logs/patrl_smoke_%j.err
#SBATCH --time=08:00:00
#SBATCH --mem=64G
#SBATCH --partition=comp
#SBATCH --cpus-per-task=8

# =============================================================================
# Environment Setup
# =============================================================================
module load miniforge3

cd "${SLURM_SUBMIT_DIR:-$(dirname "$0")/..}"
PROJECT_ROOT="$(pwd)"

mkdir -p cluster/logs results/patrl_smoke
export PYTHONUNBUFFERED=1

_PROJECT="${PROJECT:-fc37}"
conda activate ds_env 2>/dev/null || \
conda activate /scratch/${_PROJECT}/${USER}/conda/envs/ds_env 2>/dev/null || {
    echo "ERROR: Failed to activate ds_env conda environment"
    exit 1
}

# Force CPU platform.  No GPU/ptxas checks.
export JAX_PLATFORMS=cpu
unset CUDA_VISIBLE_DEVICES

# Persistent JAX compilation cache (separate path from pick_best_cue cache)
export JAX_COMPILATION_CACHE_DIR="/scratch/${_PROJECT}/${USER}/.jax_cache_cpu/patrl/${SLURMD_NODENAME:-local}"
export JAX_PERSISTENT_CACHE_MIN_ENTRY_SIZE_BYTES=0
export JAX_PERSISTENT_CACHE_MIN_COMPILE_TIME_SECS=0
mkdir -p "$JAX_COMPILATION_CACHE_DIR" 2>/dev/null || {
    echo "WARNING: Could not create JAX cache dir, disabling cache"
    unset JAX_COMPILATION_CACHE_DIR
}

# Log compilations (goes to stderr)
export JAX_LOG_COMPILES=1

# MCMC and smoke scale — override via --export at submission time.
# SC5 defaults (Plan 20-05): PRL_PATRL_SMOKE_N=40 PRL_PATRL_SMOKE_PHENOTYPES=all
# 40 agents × 4 phenotypes = 160 cohort for PRL-V1/V2 gates (Phase 20-07)
export PRL_PATRL_SMOKE_N="${PRL_PATRL_SMOKE_N:-40}"
export PRL_PATRL_SMOKE_PHENOTYPES="${PRL_PATRL_SMOKE_PHENOTYPES:-all}"
export PRL_PATRL_SMOKE_LEVEL="${PRL_PATRL_SMOKE_LEVEL:-2}"
export PRL_PATRL_SMOKE_TUNE="${PRL_PATRL_SMOKE_TUNE:-500}"
export PRL_PATRL_SMOKE_DRAWS="${PRL_PATRL_SMOKE_DRAWS:-500}"
export PRL_PATRL_SMOKE_SEED="${PRL_PATRL_SMOKE_SEED:-42}"
# Default to dual fit (NUTS + Laplace) so idata_nuts.nc + idata_laplace.nc
# both land in results/ for the offline vbl06 comparison harness.
export PRL_PATRL_SMOKE_METHOD="${PRL_PATRL_SMOKE_METHOD:-both}"

# =============================================================================
# Run Smoke Test
# =============================================================================
echo ""
echo "============================================================"
echo "PAT-RL SC5 Cohort Smoke (Plan 20-05)"
echo "============================================================"
echo "Job ID:        ${SLURM_JOB_ID:-local}"
echo "Node:          ${SLURMD_NODENAME:-$(hostname)}"
echo "Partition:     comp (CPU only)"
echo "N per phenotype: ${PRL_PATRL_SMOKE_N}  (total: $((PRL_PATRL_SMOKE_N * 4)) if all phenotypes)"
echo "Phenotypes:    ${PRL_PATRL_SMOKE_PHENOTYPES}"
echo "MCMC:          tune=${PRL_PATRL_SMOKE_TUNE} draws=${PRL_PATRL_SMOKE_DRAWS}"
echo "Level:         ${PRL_PATRL_SMOKE_LEVEL}"
echo "Seed:          ${PRL_PATRL_SMOKE_SEED}"
echo "Fit method:    ${PRL_PATRL_SMOKE_METHOD}"
echo "JAX cache:     ${JAX_COMPILATION_CACHE_DIR:-disabled}"
echo "Start:         $(date)"
echo "============================================================"
echo ""

python -c "
import jax
print(f'JAX devices: {jax.devices()}')
print(f'jax_enable_x64 (pre-run): {jax.config.jax_enable_x64}')
"
echo ""

python scripts/12_smoke_patrl_foundation.py \
    --level "${PRL_PATRL_SMOKE_LEVEL}" \
    --n-participants "${PRL_PATRL_SMOKE_N}" \
    --phenotypes "${PRL_PATRL_SMOKE_PHENOTYPES}" \
    --n-tune "${PRL_PATRL_SMOKE_TUNE}" \
    --n-draws "${PRL_PATRL_SMOKE_DRAWS}" \
    --seed "${PRL_PATRL_SMOKE_SEED}" \
    --fit-method "${PRL_PATRL_SMOKE_METHOD}" \
    --output-dir "results/patrl_smoke/${SLURM_JOB_ID:-local}"

EXIT_CODE=$?

echo ""
echo "============================================================"
if [[ $EXIT_CODE -eq 0 ]]; then
    echo "PAT-RL SMOKE PASSED (N=${PRL_PATRL_SMOKE_N} phenotypes=${PRL_PATRL_SMOKE_PHENOTYPES} level=${PRL_PATRL_SMOKE_LEVEL})"
elif [[ $EXIT_CODE -eq 2 ]]; then
    echo "PAT-RL SMOKE BLOCKED: blackjax not installed (exit=2)"
    echo "  Install: pip install blackjax>=1.2.4"
else
    echo "PAT-RL SMOKE FAILED (exit code: $EXIT_CODE)"
    echo "  Check: cluster/logs/patrl_smoke_${SLURM_JOB_ID}.err"
fi
echo "End:           $(date)"
echo "============================================================"

# =============================================================================
# Auto-push logs and results to git (mirrors 18_smoke_patrl_cpu.slurm)
# =============================================================================
echo ""
echo "Pushing PAT-RL smoke results to git..."
_LOG_OUT="cluster/logs/patrl_smoke_${SLURM_JOB_ID}.out"
_LOG_ERR="cluster/logs/patrl_smoke_${SLURM_JOB_ID}.err"
_OUT_DIR="results/patrl_smoke/${SLURM_JOB_ID}"

# results/ is git-tracked; stage CSVs AND .nc InferenceData files.
# Stage logs first (always present).
git add "${_LOG_OUT}" "${_LOG_ERR}"

# Results-dir staging — diagnose silent-failure mode by
# (a) verifying the dir exists before add, (b) using whole-dir add
# so we don't depend on glob expansion in bash, (c) surfacing errors.
if [[ -d "${_OUT_DIR}" ]]; then
    echo "Results dir exists: ${_OUT_DIR} ($(ls -1 "${_OUT_DIR}" 2>/dev/null | wc -l) files)"
    git add "${_OUT_DIR}"
    _ADD_STATUS=$?
    echo "git add status: ${_ADD_STATUS}"
    echo "Staged files under ${_OUT_DIR}:"
    git diff --cached --name-only | grep "${_OUT_DIR}" || echo "  (none — git add did not stage anything in ${_OUT_DIR})"
else
    echo "WARNING: results dir NOT present at push time: ${_OUT_DIR}"
fi

if ! git diff --cached --quiet; then
    git commit -m "smoke patrl sc5 N=${PRL_PATRL_SMOKE_N} phenotypes=${PRL_PATRL_SMOKE_PHENOTYPES} level=${PRL_PATRL_SMOKE_LEVEL} method=${PRL_PATRL_SMOKE_METHOD} (job ${SLURM_JOB_ID})"
    # Pull-rebase-push loop to handle concurrent jobs racing on git.
    for i in 1 2 3; do
        git pull --rebase origin main && git push origin main && {
            echo "Pushed PAT-RL smoke results to origin/main (attempt ${i})"
            break
        }
        echo "Push attempt ${i} failed; retrying..."
        sleep $((i * 5))
    done
else
    echo "No staged changes to commit"
fi

exit $EXIT_CODE
