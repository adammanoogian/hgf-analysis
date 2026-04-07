# PRL HGF Analysis Pipeline

HGF-based analysis pipeline for the PRL pick_best_cue task studying psilocybin
effects on belief updating in post-concussion syndrome.

## Overview

Two model variants (2-level and 3-level binary Hierarchical Gaussian Filter)
are applied to a 2-group × 3-session longitudinal design. The pipeline
validates itself via simulation-to-inference: simulate synthetic participants
with known parameters, recover those parameters via Bayesian fitting, compare
models formally.

**Groups:** post-concussion + psilocybin, post-concussion + placebo
**Sessions:** baseline (pre-dose), post-dose, follow-up
**Task:** pick_best_cue — 3 cues, criterion-based reversals

## Setup

### Prerequisites

- Python 3.10+
- Conda or venv recommended

### Install

```bash
# Clone and enter the repository
git clone <repo-url>
cd psilocybin_prl_analyses

# Create and activate a virtual environment (recommended)
python -m venv .venv
source .venv/bin/activate   # On Windows: .venv\Scripts\activate

# Install in editable mode with dev dependencies
pip install -e ".[dev]"
```

### Verify Installation

```python
import prl_hgf
print(prl_hgf.__version__)  # 0.1.0

from prl_hgf.env.task_config import load_config
config = load_config()
print(config.task.n_cues)   # 3
print(len(config.task.phases))  # 4
```

### Run Tests

```bash
pytest
```

### Lint and Type Check

```bash
ruff check src/ config.py
mypy src/ config.py
```

## Project Structure

```
config.py              # Path constants (PROJECT_ROOT, DATA_DIR, …)
configs/
  prl_analysis.yaml    # Task structure + analysis parameters
src/prl_hgf/
  env/                 # Config loading + trial sequence generation
  models/              # HGF model definitions
  fitting/             # Bayesian fitting
  analysis/            # Group analysis + BMS
scripts/               # Pipeline scripts (01_*, 02_*, …)
tests/                 # Unit + integration tests
validation/            # Scientific validation (parameter recovery)
notebooks/             # Exploratory notebooks
docs/                  # Project documentation
output/                # Generated artifacts (gitignored)
figures/               # Generated plots (gitignored)
```

## Configuration

All task and analysis parameters live in `configs/prl_analysis.yaml`.
Load them via:

```python
from prl_hgf.env.task_config import load_config, AnalysisConfig

config: AnalysisConfig = load_config()
```

Never hardcode task structure (trial counts, reward probabilities, phases).

## Key References

- Mathys et al. (2011, 2014) — HGF theory and binary HGF
- Legrand et al. (2024) — pyhgf (arXiv:2410.09206)
- Mason et al. (2024) — Psilocybin + reversal learning (Translational Psychiatry)
- Rigoux et al. (2014) — Random-effects Bayesian model selection
