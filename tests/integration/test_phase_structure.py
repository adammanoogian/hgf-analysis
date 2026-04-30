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
# WAVE 3 — Directory layout (active)
# ============================================================

CCDS_TOP_LEVEL = [
    "data",
    "data/raw",
    "data/processed",
    "models",
    "models/mle",
    "models/bayesian",
    "reports",
    "reports/figures",
    "reports/tables",
    "tests",
    "tests/integration",
    "tests/scientific",
    "logs",
]


@pytest.mark.parametrize("relpath", CCDS_TOP_LEVEL)
def test_ccds_top_level_exists(relpath: str) -> None:
    """Required CCDS directories must exist after Wave 3."""
    assert (REPO_ROOT / relpath).is_dir(), (
        f"Missing required CCDS directory: {relpath}\n"
        f"See templates/guides/CCDS_SCHEME_D_LAYOUT.md §1."
    )


# Top-level legacy dirs that Wave 3 removes. Re-creation must fail this test.
LEGACY_TOP_DIRS = [
    "output",
    "figures",
    "results",
    "validation",
]


@pytest.mark.parametrize("legacy_dir", LEGACY_TOP_DIRS)
def test_legacy_top_dir_absent(legacy_dir: str) -> None:
    """Legacy top-level directories must not have crept back in."""
    path = REPO_ROOT / legacy_dir
    assert not path.exists(), (
        f"Legacy directory resurrected: {legacy_dir}\n"
        f"Move its contents to the canonical location and remove this dir.\n"
        f"See Phase 26 Plan 26-03."
    )


# ---- Hardcoded legacy path strings -----------------------------------
# Blocker 2 fix: now greps *.py + *.slurm + *.sh and includes cluster/ in
# the search roots. Cluster phase-25 files are explicitly excluded since
# they reference .planning/ scratch paths that are not migration targets.

LEGACY_PATH_LITERAL_PATTERNS = [
    r"['\"]output/",
    r"['\"]figures/",
    r"['\"]results/",
    r"Path\(['\"]output/",
    r"Path\(['\"]figures/",
    r"Path\(['\"]results/",
    r"PROJECT_ROOT / ['\"]output['\"]",
    r"PROJECT_ROOT / ['\"]figures['\"]",
    r"PROJECT_ROOT / ['\"]results['\"]",
]

# Shell-logic patterns specific to *.slurm + *.sh files (Blocker 2 fix).
# Cover the bare-path forms (`mkdir -p results/power`, `--output figures/`,
# `git add results/...`) that don't use Python string-literal quoting.
LEGACY_SHELL_PATH_PATTERNS = [
    r"\bresults/power\b",
    r"\bresults/validation\b",
    r"\bresults/group_analysis\b",
    r"\bvalidation/(valid03|vbl06)_",
    # bare `figures/` in shell logic (e.g., `git add figures/*.png`); the
    # pattern is anchored to a non-`reports/` left context so we don't
    # match the legitimate `reports/figures/`:
    r"(?<!reports/)\bfigures/\w",
]

W3_GREP_ROOTS = ["scripts", "src", "tests", "cluster"]
# Exclude __pycache__ + tool caches + the closure-guard test itself
# (which legitimately contains the patterns as REGEXES inside string
# literals, which would otherwise self-match and fail).
W3_GREP_EXCLUDE_DIRS = {
    "__pycache__",
    ".pytest_cache",
    ".ruff_cache",
    ".mypy_cache",
    "legacy",
    "_legacy",
}
W3_GREP_EXCLUDE_FILES = {
    "test_phase_structure.py",  # this file
}
# Cluster files that are part of the Phase 25 parallel stack; they
# reference .planning/ scratch paths that are NOT migration targets.
W3_GREP_EXCLUDE_CLUSTER_PREFIXES = ("25_",)


def _w3_grep_files(roots: list[str], extensions: tuple[str, ...]) -> list[Path]:
    """Walk roots collecting files with any of the given extensions.

    Phase-25 cluster files are skipped — their script references point at
    .planning/ scratch paths.
    """
    files: list[Path] = []
    for root in roots:
        root_path = REPO_ROOT / root
        if not root_path.is_dir():
            continue
        for ext in extensions:
            for p in root_path.rglob(f"*{ext}"):
                if any(part in W3_GREP_EXCLUDE_DIRS for part in p.parts):
                    continue
                if p.name in W3_GREP_EXCLUDE_FILES:
                    continue
                # Skip phase-25 cluster files only when scanning cluster/:
                if root == "cluster" and any(
                    p.name.startswith(prefix)
                    for prefix in W3_GREP_EXCLUDE_CLUSTER_PREFIXES
                ):
                    continue
                files.append(p)
    return files


@pytest.mark.parametrize("pattern", LEGACY_PATH_LITERAL_PATTERNS)
def test_no_hardcoded_legacy_paths(pattern: str) -> None:
    """No active script may contain Python legacy path string literals.

    Greps *.py only — for shell-logic legacy paths in cluster/*.slurm and
    cluster/*.sh, see test_no_hardcoded_legacy_paths_cluster below.
    """
    import re

    rx = re.compile(pattern)
    hits: list[str] = []
    # Python-only roots (cluster files have their own check below):
    py_roots = [r for r in W3_GREP_ROOTS if r != "cluster"]
    for f in _w3_grep_files(py_roots, (".py",)):
        for lineno, line in enumerate(
            f.read_text(encoding="utf-8", errors="ignore").splitlines(), 1
        ):
            if rx.search(line):
                rel = f.relative_to(REPO_ROOT).as_posix()
                hits.append(f"{rel}:{lineno}: {line.strip()}")
    assert not hits, (
        f"Hardcoded legacy path pattern {pattern!r} found in active code:\n"
        + "\n".join(hits[:25])
        + (f"\n... ({len(hits) - 25} more)" if len(hits) > 25 else "")
        + "\n\nMove the path constant to config.py and import from there."
    )


@pytest.mark.parametrize("pattern", LEGACY_SHELL_PATH_PATTERNS)
def test_no_hardcoded_legacy_paths_cluster(pattern: str) -> None:
    """No active cluster shell script may contain bare legacy paths.

    Blocker 2 fix: covers cluster/*.slurm + cluster/*.sh + cluster/*.py.
    Phase-25 files are skipped (their .planning/ scratch references are
    not migration targets).
    """
    import re

    rx = re.compile(pattern)
    hits: list[str] = []
    for f in _w3_grep_files(["cluster"], (".slurm", ".sh", ".py")):
        for lineno, line in enumerate(
            f.read_text(encoding="utf-8", errors="ignore").splitlines(), 1
        ):
            # Skip comment-only lines for shell-script patterns to reduce
            # false positives on historical commentary. The Wave-3 closure
            # guard's primary purpose is to catch RUNTIME shell logic that
            # points at a missing path; stale path references in comments are
            # a documentation concern handled separately.
            stripped = line.lstrip()
            if stripped.startswith("#"):
                continue
            if rx.search(line):
                rel = f.relative_to(REPO_ROOT).as_posix()
                hits.append(f"{rel}:{lineno}: {line.strip()}")
    assert not hits, (
        f"Hardcoded legacy shell path pattern {pattern!r} found in cluster files:\n"
        + "\n".join(hits[:25])
        + (f"\n... ({len(hits) - 25} more)" if len(hits) > 25 else "")
        + "\n\nUpdate to canonical: results/power -> models/power; "
        "results/validation -> models/validation; "
        "results/group_analysis -> reports/tables/group_analysis; "
        "validation/<x>.py -> tests/scientific/test_<x>.py; "
        "figures/ -> reports/figures/."
    )


# ---- Viz template path lockstep update -------------------------------


def test_viz_template_path_uses_reports_figures() -> None:
    """src/prl_hgf/viz/export.py must read template from reports/figures/."""
    p = REPO_ROOT / "src" / "prl_hgf" / "viz" / "export.py"
    text = p.read_text(encoding="utf-8")
    assert 'PROJECT_ROOT / "reports" / "figures" / "hgf_viewer.html"' in text, (
        "viz/export.py::_DEFAULT_TEMPLATE_PATH not updated to reports/figures/. "
        "See Phase 26 Plan 26-03 Task 2."
    )
    assert 'PROJECT_ROOT / "figures" / "hgf_viewer.html"' not in text, (
        "viz/export.py still references the legacy figures/ path. "
        "Update _DEFAULT_TEMPLATE_PATH to reports/figures/."
    )


# ============================================================
# WAVE 4 — Scheme D pipeline (active)
# ============================================================

CANONICAL_STAGES = [
    "scripts/01_data_preprocessing",
    "scripts/02_descriptives",
    "scripts/03_pre_analysis",
    "scripts/04_main_analysis",
    "scripts/04_main_analysis/a_mle",
    "scripts/04_main_analysis/b_bayesian",
    "scripts/05_post_analysis_checks",
    "scripts/06_inference",
    "scripts/utils",
    "scripts/_maintenance",
]


@pytest.mark.parametrize("stage_dir", CANONICAL_STAGES)
def test_canonical_stage_exists(stage_dir: str) -> None:
    """Each Scheme D stage folder must exist (canonical §2 hard rule #1)."""
    assert (REPO_ROOT / stage_dir).is_dir(), (
        f"Missing canonical stage: {stage_dir}\n"
        f"See templates/guides/CCDS_SCHEME_D_LAYOUT.md §2 + Plan 26-04."
    )


# Stages whose name starts with a digit need the dotted-import warning
DIGIT_PREFIX_STAGES = [
    "scripts/01_data_preprocessing",
    "scripts/02_descriptives",
    "scripts/03_pre_analysis",
    "scripts/04_main_analysis",
    "scripts/05_post_analysis_checks",
    "scripts/06_inference",
]


@pytest.mark.parametrize("stage_dir", DIGIT_PREFIX_STAGES)
def test_digit_prefix_init_has_warning_comment(stage_dir: str) -> None:
    """Every digit-prefix __init__.py must warn against dotted imports.

    Python forbids identifiers starting with a digit; importing
    ``scripts.03_pre_analysis.X`` is a SyntaxError. The first 5 lines of
    __init__.py must remind future-you (canonical §2).
    """
    init = REPO_ROOT / stage_dir / "__init__.py"
    assert init.is_file(), f"Missing __init__.py for {stage_dir}"
    first_lines = init.read_text(encoding="utf-8").splitlines()[:5]
    has_warning = any(
        "DO NOT" in line.upper() or "do not import" in line.lower()
        for line in first_lines
    )
    assert has_warning, (
        f"{stage_dir}/__init__.py missing dotted-import warning.\n"
        f"Add as the first non-empty line:\n"
        f"  # DO NOT import as `scripts.{Path(stage_dir).name}.X`. "
        f"Use relative imports inside this stage, or move shared code "
        f"to scripts/utils/."
    )


def test_no_flat_numbered_scripts() -> None:
    """No ``scripts/<NN>_*.py`` may exist at the top of ``scripts/``.

    The flat layout is forbidden per canonical §2: every digit-prefix
    script must live inside a stage folder.
    """
    import re

    flat_re = re.compile(r"^\d+[a-z_].*\.py$")
    flat_hits: list[str] = []
    for p in (REPO_ROOT / "scripts").iterdir():
        if p.is_file() and flat_re.match(p.name):
            flat_hits.append(p.name)
    assert not flat_hits, (
        f"Flat numbered scripts at scripts/ root (forbidden — see "
        f"canonical §2 + Plan 26-04 mapping table):\n"
        + "\n".join(flat_hits)
    )


# Cluster SLURM path-resolution audit
def test_cluster_slurm_paths_resolve() -> None:
    """Every ``python scripts/...`` reference in cluster/*.slurm must exist on disk.

    Catches cases where a slurm file references the old flat path
    after a future re-organization (or a partial Wave-4 revert).
    """
    import re

    cluster_dir = REPO_ROOT / "cluster"
    if not cluster_dir.is_dir():
        pytest.skip("cluster/ not present")
    rx = re.compile(r"python\s+(scripts/[\w/\-\.]+\.py)")
    bad: list[str] = []
    for f in cluster_dir.glob("*.slurm"):
        # Skip phase-25 cluster files — they reference .planning/ scratch
        if f.name.startswith("25_"):
            continue
        for lineno, line in enumerate(
            f.read_text(encoding="utf-8", errors="ignore").splitlines(), 1
        ):
            for match in rx.finditer(line):
                rel = match.group(1)
                if not (REPO_ROOT / rel).is_file():
                    bad.append(f"{f.name}:{lineno}: {rel} (does not exist)")
    assert not bad, (
        "Cluster SLURM references missing scripts:\n" + "\n".join(bad)
        + "\nUpdate the path per Plan 26-04 mapping table."
    )


def test_cluster_logs_dir_absent() -> None:
    """cluster/logs/ removed in favor of top-level logs/ (canonical §1)."""
    assert not (REPO_ROOT / "cluster" / "logs").exists(), (
        "cluster/logs/ resurrected. Use top-level logs/ instead "
        "(canonical §1)."
    )
