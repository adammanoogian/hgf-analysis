"""Central configuration for PRL HGF Analysis project.

CCDS v2 + Scheme D canonical paths; see
project_utils/templates/guides/CCDS_SCHEME_D_LAYOUT.md.

Project-wide path constants follow the Cookiecutter Data Science v2 directory
tree.  Task-specific parameters live in ``configs/*.yaml`` and are loaded via
``prl_hgf.env.task_config.load_config()``.

Legacy constants (``OUTPUT_DIR``, ``FIGURES_DIR``, ``RESULTS_DIR``,
``VALIDATION_DIR``, ``GROUP_ANALYSIS_DIR``) have been hard-removed; any
attempt to import them will raise ``ImportError``.  Migrate callers to the
canonical CCDS constants below.
"""

from __future__ import annotations

from pathlib import Path

# ---------------------------------------------------------------------------
# Root
# ---------------------------------------------------------------------------

PROJECT_ROOT = Path(__file__).parent

# ---------------------------------------------------------------------------
# Data hierarchy
# ---------------------------------------------------------------------------

DATA_DIR = PROJECT_ROOT / "data"  # transitional alias; Wave 3 scope
DATA_RAW_DIR = PROJECT_ROOT / "data" / "raw"
DATA_INTERIM_DIR = PROJECT_ROOT / "data" / "interim"
DATA_PROCESSED_DIR = PROJECT_ROOT / "data" / "processed"

# ---------------------------------------------------------------------------
# Models / fitted artefacts
# ---------------------------------------------------------------------------

MODELS_DIR = PROJECT_ROOT / "models"
MODELS_MLE_DIR = MODELS_DIR / "mle"
MODELS_BAYESIAN_DIR = MODELS_DIR / "bayesian"

# ---------------------------------------------------------------------------
# Reports (figures + tables)
# ---------------------------------------------------------------------------

REPORTS_DIR = PROJECT_ROOT / "reports"
REPORTS_FIGURES_DIR = REPORTS_DIR / "figures"
REPORTS_TABLES_DIR = REPORTS_DIR / "tables"

# ---------------------------------------------------------------------------
# Logs
# ---------------------------------------------------------------------------

LOGS_DIR = PROJECT_ROOT / "logs"

# ---------------------------------------------------------------------------
# Convenience / tooling paths (retained for callers outside the data pipeline)
# ---------------------------------------------------------------------------

CONFIGS_DIR = PROJECT_ROOT / "configs"
SCRIPTS_DIR = PROJECT_ROOT / "scripts"
DOCS_DIR = PROJECT_ROOT / "docs"
NOTEBOOKS_DIR = PROJECT_ROOT / "notebooks"

# ---------------------------------------------------------------------------
# Auto-scaffold all canonical directories at import time (idempotent)
# ---------------------------------------------------------------------------

_SCAFFOLD = [
    DATA_RAW_DIR,
    DATA_INTERIM_DIR,
    DATA_PROCESSED_DIR,
    MODELS_DIR,
    MODELS_MLE_DIR,
    MODELS_BAYESIAN_DIR,
    REPORTS_DIR,
    REPORTS_FIGURES_DIR,
    REPORTS_TABLES_DIR,
    LOGS_DIR,
    DOCS_DIR,
]
for _directory in _SCAFFOLD:
    _directory.mkdir(parents=True, exist_ok=True)
