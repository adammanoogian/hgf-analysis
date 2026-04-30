"""Closure-guard test for canonical CCDS + Scheme D structure.

Wave 1 (this file): hygiene-only assertions.
Wave 2 will append: forbidden-legacy-alias-import assertions
                    (OUTPUT_DIR, FIGURES_DIR, RESULTS_DIR, VALIDATION_DIR,
                     GROUP_ANALYSIS_DIR via `from config import ...`).
Wave 3 will append: top-level CCDS dir existence, legacy-dir absence
                    (output/, figures/, validation/, cluster/logs/),
                    hardcoded-legacy-path grep audit.
Wave 4 will append: scripts/0N_*/ stage-existence + digit-prefix __init__
                    warning-comment + no-flat-numbered-scripts check.

See ../../CCDS_SCHEME_D_LAYOUT.md and the template at
project_utils/templates/code/test_phase_structure_TEMPLATE.py.
"""

from __future__ import annotations

from pathlib import Path

import pytest

REPO_ROOT = Path(__file__).resolve().parents[2]


# ============================================================
# WAVE 1 — Hygiene assertions (active)
# ============================================================

ROOT_CLUTTER_FORBIDDEN = [
    "_t2_verify.py",
    "bash.exe.stackdump",
    "slurm-54768408.out",
    "__pycache__",  # root-level only; nested __pycache__/ are fine
]


@pytest.mark.parametrize("name", ROOT_CLUTTER_FORBIDDEN)
def test_root_clutter_absent(name: str) -> None:
    """Root-level scratch / OS-stackdump / SLURM-out must not return."""
    assert not (REPO_ROOT / name).exists(), (
        f"Root clutter resurrected: {name}. "
        f"See Phase 26 Plan 26-01 task 1."
    )


def test_changelog_present() -> None:
    """CHANGELOG.md at repo root."""
    cl = REPO_ROOT / "CHANGELOG.md"
    assert cl.is_file(), "CHANGELOG.md missing at repo root"
    text = cl.read_text(encoding="utf-8")
    assert "# Changelog" in text, "CHANGELOG.md missing top-level header"
    assert "Unreleased" in text or "[" in text, (
        "CHANGELOG.md should follow Keep-a-Changelog format"
    )


def test_logs_dir_present_and_keepfile() -> None:
    """logs/ exists with a .gitkeep so the dir tracks but contents do not."""
    logs = REPO_ROOT / "logs"
    assert logs.is_dir(), "logs/ directory missing"
    assert (logs / ".gitkeep").is_file(), "logs/.gitkeep missing"


def test_gitignore_has_logs_line() -> None:
    """.gitignore must ignore logs/ so SLURM/dev logs don't leak upstream."""
    text = (REPO_ROOT / ".gitignore").read_text(encoding="utf-8")
    assert any(line.strip() == "logs/" for line in text.splitlines()), (
        ".gitignore missing exact line: logs/"
    )


# ============================================================
# WAVE 2 — Config aliases (added by Plan 26-02; placeholder below)
# ============================================================
# Plan 26-02 will append:
#   - test_no_legacy_alias_imports (OUTPUT_DIR, FIGURES_DIR, RESULTS_DIR,
#                                   VALIDATION_DIR, GROUP_ANALYSIS_DIR)
#   - test_config_exposes_ccds_constants (DATA_RAW_DIR, …, REPORTS_DIR, …)


# ============================================================
# WAVE 3 — Directory layout (added by Plan 26-03; placeholder below)
# ============================================================
# Plan 26-03 will append:
#   - test_ccds_top_level_exists (data/raw, data/processed, reports/figures,
#                                 reports/tables, models/, …)
#   - test_legacy_dir_absent (output, figures, validation, cluster/logs,
#                             results)
#   - test_no_hardcoded_legacy_paths (grep audit on scripts/, src/)


# ============================================================
# WAVE 4 — Scheme D pipeline (added by Plan 26-04; placeholder below)
# ============================================================
# Plan 26-04 will append:
#   - test_canonical_stage_exists (scripts/01_data_preprocessing, …,
#                                  scripts/06_inference, scripts/utils)
#   - test_digit_prefix_init_has_warning_comment
#   - test_no_flat_numbered_scripts (no scripts/0N_*.py at top of scripts/)
