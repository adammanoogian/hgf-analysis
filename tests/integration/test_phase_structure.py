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
]

# __pycache__ at repo root is a Python runtime artifact that is always
# gitignored — checking existence is too strict (pytest itself triggers
# config.py bytecode compilation).  We assert it is NOT committed instead.
ROOT_CLUTTER_GITIGNORED_ONLY = [
    "__pycache__",  # root-level only; nested __pycache__/ are fine
]


@pytest.mark.parametrize("name", ROOT_CLUTTER_FORBIDDEN)
def test_root_clutter_absent(name: str) -> None:
    """Root-level scratch / OS-stackdump / SLURM-out must not return."""
    assert not (REPO_ROOT / name).exists(), (
        f"Root clutter resurrected: {name}. See Phase 26 Plan 26-01 task 1."
    )


@pytest.mark.parametrize("name", ROOT_CLUTTER_GITIGNORED_ONLY)
def test_root_clutter_gitignored(name: str) -> None:
    """Runtime artefacts must be gitignored (may exist on disk, must not be tracked)."""
    import subprocess

    result = subprocess.run(
        ["git", "check-ignore", "-q", name],
        cwd=str(REPO_ROOT),
        capture_output=True,
    )
    assert result.returncode == 0, (
        f"Root artefact {name!r} is NOT gitignored.\n"
        f"Add it to .gitignore to prevent accidental commits."
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
# WAVE 2 — Config aliases (active)
# ============================================================

LEGACY_ALIAS_IMPORT_PATTERNS = [
    r"from config import .*\bOUTPUT_DIR\b",
    r"from config import .*\bFIGURES_DIR\b",
    r"from config import .*\bRESULTS_DIR\b",
    r"from config import .*\bVALIDATION_DIR\b",
    r"from config import .*\bGROUP_ANALYSIS_DIR\b",
]

# Also forbid attribute-access on the alias module:
LEGACY_ALIAS_ATTR_PATTERNS = [
    r"\b_cfg\.OUTPUT_DIR\b",
    r"\b_cfg\.FIGURES_DIR\b",
    r"\b_cfg\.RESULTS_DIR\b",
    r"\b_cfg\.VALIDATION_DIR\b",
    r"\b_cfg\.GROUP_ANALYSIS_DIR\b",
    r"\bconfig\.OUTPUT_DIR\b",
    r"\bconfig\.FIGURES_DIR\b",
    r"\bconfig\.RESULTS_DIR\b",
    r"\bconfig\.VALIDATION_DIR\b",
    r"\bconfig\.GROUP_ANALYSIS_DIR\b",
]

W2_GREP_ROOTS = ["scripts", "src", "tests", "validation"]
W2_GREP_EXCLUDE = {
    "__pycache__",
    ".pytest_cache",
    ".ruff_cache",
    ".mypy_cache",
    "legacy",
    "_legacy",
}


def _w2_grep_files(roots: list[str], exclude: set[str]) -> list[Path]:
    files: list[Path] = []
    for root in roots:
        root_path = REPO_ROOT / root
        if not root_path.is_dir():
            continue
        for p in root_path.rglob("*.py"):
            if any(part in exclude for part in p.parts):
                continue
            files.append(p)
    return files


@pytest.mark.parametrize(
    "pattern",
    LEGACY_ALIAS_IMPORT_PATTERNS + LEGACY_ALIAS_ATTR_PATTERNS,
)
def test_no_legacy_alias_imports(pattern: str) -> None:
    """No active code may import or reference the removed legacy aliases."""
    import re

    rx = re.compile(pattern)
    hits: list[str] = []
    for f in _w2_grep_files(W2_GREP_ROOTS, W2_GREP_EXCLUDE):
        for lineno, line in enumerate(
            f.read_text(encoding="utf-8", errors="ignore").splitlines(), 1
        ):
            if rx.search(line):
                rel = f.relative_to(REPO_ROOT).as_posix()
                hits.append(f"{rel}:{lineno}: {line.strip()}")
    assert not hits, (
        f"Legacy alias pattern {pattern!r} found in active code:\n"
        + "\n".join(hits[:25])
        + (f"\n... ({len(hits) - 25} more)" if len(hits) > 25 else "")
        + "\nMigrate to the canonical CCDS constant per "
        "templates/guides/CCDS_SCHEME_D_LAYOUT.md §5."
    )


# Net-new CCDS canonical constants. NOTE: DATA_DIR is intentionally
# OMITTED from this parametrize list — it is a TRANSITIONAL ALIAS retained
# through Wave 2 for backward compat with scripts/03_*.py and scripts/04_*.py.
# Wave 3 may further reduce DATA_DIR's usage; until then, omitting it from
# the closure guard prevents the test from forcing premature DATA_DIR
# removal.
CCDS_REQUIRED_CONSTANTS = [
    "DATA_RAW_DIR",
    "DATA_INTERIM_DIR",
    "DATA_PROCESSED_DIR",
    "MODELS_DIR",
    "MODELS_MLE_DIR",
    "MODELS_BAYESIAN_DIR",
    "REPORTS_DIR",
    "REPORTS_FIGURES_DIR",
    "REPORTS_TABLES_DIR",
    "LOGS_DIR",
]


@pytest.mark.parametrize("name", CCDS_REQUIRED_CONSTANTS)
def test_config_exposes_ccds_constants(name: str) -> None:
    """config.py must expose every canonical CCDS path constant."""
    import importlib
    import sys

    sys.path.insert(0, str(REPO_ROOT))
    _prev_no_write = sys.dont_write_bytecode
    sys.dont_write_bytecode = True  # prevent __pycache__ at repo root
    try:
        config = importlib.import_module("config")
        assert hasattr(config, name), (
            f"config.py missing required CCDS constant: {name}\n"
            f"See templates/guides/CCDS_SCHEME_D_LAYOUT.md §5."
        )
    finally:
        sys.dont_write_bytecode = _prev_no_write
        if str(REPO_ROOT) in sys.path:
            sys.path.remove(str(REPO_ROOT))


REMOVED_LEGACY_CONSTANTS = [
    "OUTPUT_DIR",
    "FIGURES_DIR",
    "RESULTS_DIR",
    "VALIDATION_DIR",
    "GROUP_ANALYSIS_DIR",
]


@pytest.mark.parametrize("name", REMOVED_LEGACY_CONSTANTS)
def test_config_does_not_expose_legacy_aliases(name: str) -> None:
    """Removed legacy constants must NOT be re-introduced as aliases."""
    import importlib
    import sys

    sys.path.insert(0, str(REPO_ROOT))
    _prev_no_write = sys.dont_write_bytecode
    sys.dont_write_bytecode = True  # prevent __pycache__ at repo root
    try:
        config = importlib.import_module("config")
        assert not hasattr(config, name), (
            f"Legacy constant {name} reintroduced in config.py.\n"
            f"Hard-`del` it (canonical §5 forbids deprecation aliases)."
        )
    finally:
        sys.dont_write_bytecode = _prev_no_write
        if str(REPO_ROOT) in sys.path:
            sys.path.remove(str(REPO_ROOT))


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
