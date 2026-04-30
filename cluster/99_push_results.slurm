#!/bin/bash
# =============================================================================
# SLURM Job: Auto-Push Results to Git After Pipeline Completion
# =============================================================================
# Creates a results branch, commits output files, and pushes to origin.
# Submit as a final dependent job after analysis jobs complete.
#
# Strategy (default — branch push):
#   1. Creates branch: results/slurm-YYYYMMDD-HHMMSS
#   2. Stages result files (fitted data, validation, group analysis)
#   3. Commits with descriptive message including parent job IDs
#   4. Pushes branch to origin
#   5. Returns to original branch
#   User merges when ready: git merge origin/results/slurm-...
#
# Usage:
#   sbatch --dependency=afterany:12345 cluster/99_push_results.slurm
#   sbatch --export=BRANCH_NAME=results/recovery-v2 cluster/99_push_results.slurm
#   sbatch --export=PUSH_TO_MAIN=true cluster/99_push_results.slurm  # (risky)
#
# Prerequisites:
#   - SSH key or credential helper configured for git push on compute nodes
#   - Git remote 'origin' set up (standard for cloned repos)
# =============================================================================

#SBATCH --job-name=push_results
#SBATCH --output=cluster/logs/push_results_%j.out
#SBATCH --error=cluster/logs/push_results_%j.err
#SBATCH --time=00:15:00
#SBATCH --mem=4G
#SBATCH --cpus-per-task=1
#SBATCH --partition=comp

# =============================================================================
# Configuration
# =============================================================================
PUSH_TO_MAIN="${PUSH_TO_MAIN:-false}"
BRANCH_NAME="${BRANCH_NAME:-results/slurm-$(date +%Y%m%d-%H%M%S)}"
PARENT_JOBS="${PARENT_JOBS:-${SLURM_JOB_DEPENDENCY:-unknown}}"

# =============================================================================
# Environment Setup (minimal — only need git)
# =============================================================================
cd "${SLURM_SUBMIT_DIR:-$(dirname "$0")/..}"
PROJECT_ROOT="$(pwd)"

mkdir -p cluster/logs

echo "============================================================"
echo "Auto-Push Results to Git"
echo "============================================================"
echo "Job ID: ${SLURM_JOB_ID:-local}"
echo "Node: ${SLURMD_NODENAME:-$(hostname)}"
echo "Project: $PROJECT_ROOT"
echo "Strategy: $(if [[ "$PUSH_TO_MAIN" == "true" ]]; then echo 'push to main'; else echo "branch: $BRANCH_NAME"; fi)"
echo "Parent jobs: $PARENT_JOBS"
echo "Start: $(date)"
echo "============================================================"

# =============================================================================
# Verify Git Setup
# =============================================================================
echo ""
echo "Checking git configuration..."

if ! command -v git &>/dev/null; then
    echo "ERROR: git not found on this node"
    exit 1
fi

if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "ERROR: Not inside a git repository: $PROJECT_ROOT"
    exit 1
fi

if ! git remote get-url origin &>/dev/null; then
    echo "ERROR: No 'origin' remote configured"
    exit 1
fi

echo "Testing push access to origin..."
if ! git ls-remote --exit-code origin HEAD &>/dev/null 2>&1; then
    echo "ERROR: Cannot reach origin remote"
    echo "Check SSH keys or credential helper on cluster nodes"
    echo "Remote URL: $(git remote get-url origin)"
    exit 1
fi
echo "  Remote accessible: $(git remote get-url origin)"

CURRENT_BRANCH=$(git branch --show-current)
echo "  Current branch: $CURRENT_BRANCH"
echo "  HEAD: $(git rev-parse --short HEAD)"
echo ""

# =============================================================================
# Stage Result Files
# =============================================================================
echo "Staging result files..."

STAGED_COUNT=0

stage_files() {
    local pattern="$1"
    local label="$2"
    local count
    count=$(git add --dry-run -- $pattern 2>/dev/null | wc -l)
    if [[ "$count" -gt 0 ]]; then
        git add -- $pattern 2>/dev/null
        echo "  + $label ($count files)"
        STAGED_COUNT=$((STAGED_COUNT + count))
    fi
}

# Fitted results
stage_files "data/fitted/*.csv" "fitting results"

# Validation outputs
stage_files "models/validation/*.csv" "validation CSVs"
stage_files "models/validation/*.png" "validation plots"

# Group analysis outputs
stage_files "reports/tables/group_analysis/*.csv" "group analysis CSVs"

# Figures
stage_files "reports/figures/*.png" "analysis figures"

echo ""

# Check if there's anything to commit
if git diff --cached --quiet; then
    echo "No new or modified result files to commit."
    echo "STATUS: NOTHING TO PUSH"
    exit 0
fi

echo "Staged changes:"
git diff --cached --stat
echo ""

# =============================================================================
# Commit and Push
# =============================================================================
if [[ "$PUSH_TO_MAIN" == "true" ]]; then
    echo "Pulling latest main with rebase..."
    if ! git pull --rebase origin main; then
        echo "ERROR: git pull --rebase failed (likely merge conflict)"
        echo "Results are staged but NOT pushed. Manual resolution required."
        exit 1
    fi

    git commit -m "results: PRL HGF pipeline outputs (SLURM jobs: ${PARENT_JOBS})"

    echo "Pushing to main..."
    if git push origin main; then
        echo "STATUS: PUSHED TO MAIN"
    else
        echo "ERROR: git push to main failed"
        exit 1
    fi
else
    echo "Creating results branch: $BRANCH_NAME"
    git checkout -b "$BRANCH_NAME"

    git commit -m "results: PRL HGF pipeline outputs (SLURM jobs: ${PARENT_JOBS})

Branch: $BRANCH_NAME
Node: ${SLURMD_NODENAME:-$(hostname)}
Date: $(date --iso-8601=seconds 2>/dev/null || date +%Y-%m-%dT%H:%M:%S)

Merge with:
  git checkout main && git merge $BRANCH_NAME"

    echo "Pushing branch to origin..."
    if git push -u origin "$BRANCH_NAME"; then
        echo "STATUS: PUSHED TO BRANCH $BRANCH_NAME"
    else
        echo "ERROR: git push failed"
        exit 1
    fi

    echo "Returning to branch: $CURRENT_BRANCH"
    git checkout "$CURRENT_BRANCH"
fi

# =============================================================================
# Summary
# =============================================================================
echo ""
echo "============================================================"
echo "Git Push Complete!"
echo "============================================================"
echo "End time: $(date)"
if [[ "$PUSH_TO_MAIN" == "true" ]]; then
    echo "Pull locally: git pull origin main"
else
    echo "Merge locally: git fetch origin && git merge origin/$BRANCH_NAME"
fi
echo "============================================================"
