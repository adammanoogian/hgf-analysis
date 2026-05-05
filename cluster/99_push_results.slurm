#!/bin/bash
# =============================================================================
# SLURM Job: Auto-Push Results to Git After Pipeline Completion
# =============================================================================
# Creates a results branch, commits output files, and pushes to GIT_REMOTE.
# Submit as a final dependent job after analysis jobs complete.
#
# Strategy (default — branch push):
#   1. Creates branch: results/slurm-YYYYMMDD-HHMMSS
#   2. Stages result files (fitted data, validation, group analysis)
#   3. Commits with descriptive message including parent job IDs
#   4. Pushes branch to GIT_REMOTE
#   5. Returns to original branch
#   User merges when ready: git fetch GIT_REMOTE && git merge GIT_REMOTE/<branch>
#
# Strategy (opt-in — push to main, single-author repos only):
#   sbatch --export=ALL,PUSH_TO_MAIN=true cluster/99_push_results.slurm
#   (uses git pull --rebase before commit; fails cleanly on conflict)
#
# Usage:
#   sbatch --dependency=afterany:12345 cluster/99_push_results.slurm
#   sbatch --export=BRANCH_NAME=results/recovery-v2 cluster/99_push_results.slurm
#   sbatch --export=GIT_REMOTE=upstream cluster/99_push_results.slurm   # forks
#
#   # Email notifications (use either or both):
#   #   (1) SLURM-native: scheduler emails BEGIN/END/FAIL
#   sbatch --mail-type=END,FAIL --mail-user=adam.manoogian@monash.edu \
#          --dependency=afterany:JID cluster/99_push_results.slurm
#   #   (2) Custom rich email at exit (branch, commit hash, file counts)
#   sbatch --export=ALL,NOTIFY_EMAIL=adam.manoogian@monash.edu \
#          --dependency=afterany:JID cluster/99_push_results.slurm
#
# Prerequisites:
#   - SSH key or credential helper configured for git push on compute nodes
#   - Git remote configured (defaults to 'origin'; override with GIT_REMOTE)
#
# WINDOWS / CRLF GOTCHA:
#   Submit scripts must run `sed -i 's/\r$//' cluster/*.slurm cluster/*.sh`
#   before any sbatch call when the repo was cloned on Windows. The
#   orchestrators cluster/submit_full_pipeline.sh and submit_power_pipeline.sh
#   do this; manual sbatch users must run it themselves once after pulling
#   on the cluster.
#
# Derived from: project_utils/slurm-autopush.skill (canonical template).
# =============================================================================

#SBATCH --job-name=push_results
#SBATCH --output=logs/push_results_%j.out
#SBATCH --error=logs/push_results_%j.err
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
# Override if 'origin' is not your personal fork (e.g. GIT_REMOTE=upstream)
GIT_REMOTE="${GIT_REMOTE:-origin}"
# Optional: rich custom email at exit (branch, commit hash, file counts).
# Requires `mail`/`mailx`/`sendmail` on the compute node. Empty = disabled.
NOTIFY_EMAIL="${NOTIFY_EMAIL:-}"

# =============================================================================
# Environment Setup (minimal — only need git)
# =============================================================================
cd "${SLURM_SUBMIT_DIR:-$(dirname "$0")/..}"
PROJECT_ROOT="$(pwd)"

mkdir -p logs

# =============================================================================
# Email Notification (custom body, fired via trap at exit)
# =============================================================================
PUSH_STATUS="UNKNOWN"
PUSH_SUMMARY=""

_send_notify_email() {
    local exit_code=$?
    [[ -z "$NOTIFY_EMAIL" ]] && return 0
    local mailer=""
    for cand in mail mailx sendmail; do
        if command -v "$cand" &>/dev/null; then mailer="$cand"; break; fi
    done
    if [[ -z "$mailer" ]]; then
        echo "  NOTIFY_EMAIL set but no mail/mailx/sendmail found — skipping custom email"
        return 0
    fi

    local subject="[SLURM ${SLURM_JOB_ID:-local}] push_results: ${PUSH_STATUS}"
    local body
    body=$(cat <<EOF
SLURM push_results job ${SLURM_JOB_ID:-local} finished with status: ${PUSH_STATUS}
Exit code: ${exit_code}
Node:      ${SLURMD_NODENAME:-$(hostname)}
Project:   ${PROJECT_ROOT}
Remote:    ${GIT_REMOTE}
Parent:    ${PARENT_JOBS}
End time:  $(date)

${PUSH_SUMMARY}

Log: logs/push_results_${SLURM_JOB_ID:-local}.out
EOF
)
    case "$mailer" in
        mail|mailx)
            printf '%s\n' "$body" | "$mailer" -s "$subject" "$NOTIFY_EMAIL" \
                && echo "  notify email sent to $NOTIFY_EMAIL" \
                || echo "  WARN: $mailer exit non-zero sending to $NOTIFY_EMAIL"
            ;;
        sendmail)
            {
                printf 'To: %s\nSubject: %s\n\n' "$NOTIFY_EMAIL" "$subject"
                printf '%s\n' "$body"
            } | sendmail -t "$NOTIFY_EMAIL" \
                && echo "  notify email sent to $NOTIFY_EMAIL (sendmail)" \
                || echo "  WARN: sendmail failed"
            ;;
    esac
}
trap _send_notify_email EXIT

echo "============================================================"
echo "Auto-Push Results to Git"
echo "============================================================"
echo "Job ID: ${SLURM_JOB_ID:-local}"
echo "Node: ${SLURMD_NODENAME:-$(hostname)}"
echo "Project: $PROJECT_ROOT"
echo "Remote: $GIT_REMOTE"
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
    PUSH_STATUS="FAILED_PREFLIGHT"
    PUSH_SUMMARY="git not found on compute node"
    exit 1
fi

if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "ERROR: Not inside a git repository: $PROJECT_ROOT"
    PUSH_STATUS="FAILED_PREFLIGHT"
    PUSH_SUMMARY="Not inside a git repository: ${PROJECT_ROOT}"
    exit 1
fi

if ! git remote get-url "$GIT_REMOTE" &>/dev/null; then
    echo "ERROR: No '$GIT_REMOTE' remote configured"
    echo "Available remotes: $(git remote)"
    echo "Override with: sbatch --export=GIT_REMOTE=<name> ..."
    PUSH_STATUS="FAILED_PREFLIGHT"
    PUSH_SUMMARY="No '${GIT_REMOTE}' remote configured. Available: $(git remote | tr '\n' ' ')"
    exit 1
fi

echo "Testing push access to $GIT_REMOTE..."
if ! git ls-remote --exit-code "$GIT_REMOTE" HEAD &>/dev/null 2>&1; then
    echo "ERROR: Cannot reach $GIT_REMOTE remote"
    echo "Check SSH keys or credential helper on cluster nodes"
    echo "Remote URL: $(git remote get-url "$GIT_REMOTE")"
    PUSH_STATUS="FAILED_PREFLIGHT"
    PUSH_SUMMARY="Cannot reach ${GIT_REMOTE} ($(git remote get-url "$GIT_REMOTE")). Check SSH keys on compute nodes."
    exit 1
fi
echo "  Remote accessible: $(git remote get-url "$GIT_REMOTE")"

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

# Phase 25 cluster outputs (parallel-scan acceleration research)
stage_files "logs/phase25/*.json" "phase25 research JSONs"
stage_files "logs/phase25/*.out" "phase25 stdout logs"
stage_files "logs/phase25/*.err" "phase25 stderr logs"

echo ""

# Check if there's anything to commit
if git diff --cached --quiet; then
    echo "No new or modified result files to commit."
    echo "STATUS: NOTHING TO PUSH"
    PUSH_STATUS="NOTHING_TO_PUSH"
    PUSH_SUMMARY="No result files changed since last push."
    exit 0
fi

echo "Staged changes:"
git diff --cached --stat
echo ""
STAGED_STAT=$(git diff --cached --stat | tail -n 1)

# =============================================================================
# Commit and Push
# =============================================================================
if [[ "$PUSH_TO_MAIN" == "true" ]]; then
    echo "Pulling latest main with rebase..."
    if ! git pull --rebase "$GIT_REMOTE" main; then
        echo "ERROR: git pull --rebase failed (likely merge conflict)"
        echo "Results are staged but NOT pushed. Manual resolution required."
        PUSH_STATUS="FAILED_REBASE_CONFLICT"
        PUSH_SUMMARY="Results staged but NOT pushed (rebase on main failed)."
        exit 1
    fi

    git commit -m "results: PRL HGF pipeline outputs (SLURM jobs: ${PARENT_JOBS})"
    COMMIT_HASH=$(git rev-parse --short HEAD)

    echo "Pushing to main on $GIT_REMOTE..."
    if git push "$GIT_REMOTE" main; then
        echo "STATUS: PUSHED TO MAIN"
        PUSH_STATUS="PUSHED_TO_MAIN"
        PUSH_SUMMARY=$(printf 'Commit: %s\nStaged: %s\nPull locally: git pull %s main' \
                       "$COMMIT_HASH" "$STAGED_STAT" "$GIT_REMOTE")
    else
        echo "ERROR: git push to main failed"
        PUSH_STATUS="FAILED_PUSH"
        PUSH_SUMMARY="Commit ${COMMIT_HASH} made locally but push to main failed."
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
    COMMIT_HASH=$(git rev-parse --short HEAD)

    echo "Pushing branch to $GIT_REMOTE..."
    if git push -u "$GIT_REMOTE" "$BRANCH_NAME"; then
        echo "STATUS: PUSHED TO BRANCH $BRANCH_NAME"
        PUSH_STATUS="PUSHED_TO_BRANCH"
        PUSH_SUMMARY=$(printf 'Branch: %s\nCommit: %s\nStaged: %s\nMerge locally: git fetch %s && git merge %s/%s' \
                       "$BRANCH_NAME" "$COMMIT_HASH" "$STAGED_STAT" \
                       "$GIT_REMOTE" "$GIT_REMOTE" "$BRANCH_NAME")
    else
        echo "ERROR: git push failed"
        PUSH_STATUS="FAILED_PUSH"
        PUSH_SUMMARY="Branch ${BRANCH_NAME} committed locally as ${COMMIT_HASH} but push failed. Manual push: git push -u ${GIT_REMOTE} ${BRANCH_NAME}"
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
    echo "Pull locally: git pull $GIT_REMOTE main"
else
    echo "Merge locally: git fetch $GIT_REMOTE && git merge $GIT_REMOTE/$BRANCH_NAME"
fi
echo "============================================================"
