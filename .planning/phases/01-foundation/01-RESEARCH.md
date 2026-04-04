# Phase 1: Foundation - Research

**Researched:** 2026-04-04
**Domain:** Python package scaffolding, pyhgf Network API, JAX/PyMC dependency management, task environment simulation
**Confidence:** MEDIUM-HIGH (core stack verified via PyPI metadata and official docs; partial feedback and NaN handling LOW confidence)

## Summary

Phase 1 establishes the project skeleton: a `pyproject.toml`-based installable package, a unified YAML/JSON config that mirrors the PRL `pick_best_cue` task structure, and a deterministic task environment simulator. The primary technical risks in this phase are (1) the JAX version pin in pyhgf 0.2.8 constraining the full dependency stack, (2) JAX's CPU-only Windows support requiring awareness during environment setup, and (3) the `pick_best_cue` task config being hosted in a private/inaccessible repository so task structure must be reconstructed from research.

The standard stack is fully determined by the prior decisions: pyhgf 0.2.8 with its transitive constraints (jax>=0.4.26,<0.4.32, pymc>=5.25.1, numpy>=2.0.0, arviz>=0.21.0). The project structure follows Python src-layout convention with hatchling build backend. The task environment simulator is pure Python with numpy RNG — no pyhgf involvement at this stage.

**Primary recommendation:** Pin the full stack to pyhgf 0.2.8's exact constraints; do not install latest JAX (0.9.x requires Python 3.11+ which breaks pyhgf's Python 3.10 support path). Use `jax[cpu]` on Windows. The task config should be a YAML file that hardcodes the PRL pick_best_cue task structure with commentary explaining each field.

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| pyhgf | ==0.2.8 | HGF model building + PyMC integration | Locked prior decision; JAX-backed, Network API supports custom topologies |
| jax | >=0.4.26,<0.4.32 | Differentiable computation backend | Transitive constraint from pyhgf 0.2.8 |
| jaxlib | >=0.4.26,<0.4.32 | JAX compiled backend | Must match jax version exactly |
| pymc | >=5.25.1 | Bayesian MCMC fitting | Transitive constraint from pyhgf 0.2.8 |
| numpy | >=2.0.0 | Array operations, RNG | Transitive constraint; note numpy 2.0 breaking changes |
| arviz | >=0.21.0 | MCMC diagnostics, LOO-CV | Transitive constraint from pyhgf |
| pandas | >=2.0 | Tidy data output | Standard scientific Python |
| scipy | >=1.10 | Statistical functions | Standard scientific Python |
| matplotlib | >=3.4.0 | Plotting | Transitive from pyhgf |
| seaborn | >=0.13.2 | Statistical plots | Transitive from pyhgf |
| ipywidgets | >=8.0 | Jupyter GUI (Phase 7) | Prior decision: VSCode-compatible |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| hatchling | latest | Build backend | Phase 1 pyproject.toml |
| ruff | latest | Linter + formatter | All phases; replaces flake8+black |
| mypy | latest | Static type checking | All phases |
| pytest | >=7.0 | Unit testing | Phase 1 env tests |
| graphviz | >=0.20.3 | Network visualization | Transitive from pyhgf |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| hatchling | setuptools | hatchling is cleaner for src-layout; setuptools requires setup.cfg |
| YAML config | JSON config | YAML supports comments (essential for documenting task parameters); JSON is fine if no comments needed |
| ruff | flake8 + black | ruff replaces both in one tool; faster |

### Installation

```bash
# Windows CPU (critical: must pin jax to pyhgf-compatible range)
pip install "jax[cpu]>=0.4.26,<0.4.32"
pip install -e ".[dev]"
```

**CRITICAL Windows note:** JAX 0.9.x (latest as of April 2026) requires Python >=3.11 and is incompatible with pyhgf's jax<0.4.32 pin. Do not run `pip install jax` without version constraints. The correct JAX versions (0.4.26–0.4.31) support Python 3.10+.

## Architecture Patterns

### Recommended Project Structure
```
psilocybin_prl_analyses/
├── src/
│   └── prl_hgf/               # installable library
│       ├── __init__.py
│       ├── config.py           # Path constants (INF-03)
│       ├── env/
│       │   ├── __init__.py
│       │   ├── task_config.py  # Config loading + validation
│       │   └── simulator.py    # Trial sequence generator (ENV-01..05)
│       ├── models/             # Phase 2: HGF model building
│       ├── fitting/            # Phase 4: PyMC fitting
│       └── analysis/           # Phase 5-6: recovery + group analysis
├── configs/
│   └── prl_analysis.yaml       # Unified config (ENV-01)
├── notebooks/                  # Analysis workflows
│   └── 00_quickstart.ipynb
├── tests/
│   └── test_env_simulator.py   # Phase 1 unit tests
├── validation/                 # Scientific validation (separate from unit tests)
├── pyproject.toml
└── README.md
```

### Pattern 1: pyproject.toml with src-layout and hatchling

**What:** Single pyproject.toml file containing build metadata, dependencies, and tool configs (ruff, mypy, pytest).

**When to use:** All Python packages using src-layout.

```toml
# Source: https://packaging.python.org/en/latest/guides/writing-pyproject-toml/
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[project]
name = "prl-hgf"
version = "0.1.0"
requires-python = ">=3.10"
dependencies = [
    "pyhgf>=0.2.8,<0.3",
    "jax>=0.4.26,<0.4.32",
    "jaxlib>=0.4.26,<0.4.32",
    "numpy>=2.0.0",
    "pandas>=2.0",
    "scipy>=1.10",
    "matplotlib>=3.4.0",
    "seaborn>=0.13.2",
    "arviz>=0.21.0",
    "ipywidgets>=8.0",
    "pyyaml>=6.0",
]

[project.optional-dependencies]
dev = ["pytest>=7.0", "ruff", "mypy"]

[tool.hatch.build.targets.wheel]
packages = ["src/prl_hgf"]

[tool.pytest.ini_options]
testpaths = ["tests"]
pythonpath = ["src"]

[tool.ruff]
line-length = 88

[tool.ruff.lint]
select = ["E", "F", "W", "D", "I"]
ignore = ["D203", "D213"]  # Conflict with numpy docstring style

[tool.ruff.lint.pydocstyle]
convention = "numpy"

[tool.mypy]
python_version = "3.10"
strict = true
```

### Pattern 2: Unified YAML Config with Task Structure

**What:** A single config file that captures the PRL pick_best_cue task structure and extends it with analysis-specific fields. The task structure cannot be imported from the actual pick_best_cue config (private repo / JavaScript-based), so it must be defined here with inline documentation.

**When to use:** ENV-01 requirement; loaded at startup and validated with pydantic or dataclasses.

```yaml
# configs/prl_analysis.yaml
# Source: PRL pick_best_cue task reconstruction from task documentation

task:
  mode: pick_best_cue
  n_cues: 3
  
  # Reward probabilities per cue per phase
  # Convention: cue_0 is the "best" cue in acquisition
  phases:
    acquisition:
      cue_probs: [0.80, 0.20, 0.20]  # best cue, distractor, distractor
      n_trials: 30                    # fixed trial count (replaces criterion)
      phase_label: stable
    reversal_1:
      cue_probs: [0.20, 0.80, 0.20]  # cue_1 becomes best
      n_trials: 30
      phase_label: volatile
    reversal_2:
      cue_probs: [0.20, 0.20, 0.80]  # cue_2 becomes best
      n_trials: 30
      phase_label: volatile
    post_reversal:
      cue_probs: [0.20, 0.20, 0.80]  # stays with final best
      n_trials: 30
      phase_label: stable
  
  n_sets: 3                           # 3 independent sets
  transfer_trials: 20                 # post-reversal transfer phase

simulation:
  seed: 42
  n_participants_per_group: 30
  
groups:
  post_concussion:
    omega_2_mean: -3.5
    omega_2_sd: 1.0
  healthy_control:
    omega_2_mean: -2.5
    omega_2_sd: 1.0
```

**Note on pick_best_cue task structure:** The exact trial counts and reward probabilities for the actual PRL task are not publicly documented in detail. The values above are reasonable defaults from the reversal learning literature (e.g., 80/20 reward probabilities are standard). The config file should be verified against the actual task parameters before real data analysis.

### Pattern 3: Environment Simulator Design

**What:** A deterministic, seed-controlled generator that produces trial-by-trial sequences matching the task structure.

**When to use:** ENV-02 through ENV-05.

```python
# Source: standard reversal learning simulation pattern
from __future__ import annotations
import numpy as np
from dataclasses import dataclass

@dataclass
class Trial:
    set_idx: int
    phase_name: str
    phase_label: str  # 'stable' | 'volatile'
    trial_idx: int
    cue_probs: list[float]  # ground truth reward probs for each cue
    best_cue: int  # index of highest-prob cue

def generate_session(config: dict, seed: int) -> list[Trial]:
    """Generate one session's trial sequence from config."""
    rng = np.random.default_rng(seed)
    trials = []
    for set_idx in range(config["task"]["n_sets"]):
        for phase in config["task"]["phases"].values():
            for t in range(phase["n_trials"]):
                trials.append(Trial(
                    set_idx=set_idx,
                    phase_name=phase["name"],
                    phase_label=phase["phase_label"],
                    trial_idx=len(trials),
                    cue_probs=phase["cue_probs"],
                    best_cue=int(np.argmax(phase["cue_probs"])),
                ))
    return trials
```

**Key design decision:** The simulator generates the *ground truth environment* (cue probabilities, best cue label, stable/volatile tag). Actual simulated choices and feedback are generated by the agent simulator in Phase 3. Phase 1 only needs the environment structure.

### Anti-Patterns to Avoid

- **Hardcoding task structure in Python:** All trial counts, reward probabilities, and phase definitions must come from the config file. Never put `n_trials = 30` directly in simulator code.
- **Installing latest jax:** `pip install jax` will pull 0.9.x which is incompatible with pyhgf 0.2.8's `<0.4.32` constraint. Always specify version bounds.
- **Using `from prl_hgf import *`:** Project convention requires absolute imports only.
- **Putting tests alongside src code:** Use the `tests/` directory at project root, with `pythonpath = ["src"]` in pytest config.
- **Mixing math symbol names at module boundaries:** Internal simulator code can use `p_r` for reward probability, but the public API must use `reward_probability`.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Config loading | Custom YAML parser | `pyyaml` + dataclass validation | Handles edge cases, type coercion |
| Reproducible RNG | `random.seed()` + `np.random.seed()` | `numpy.random.default_rng(seed)` | Thread-safe, reproducible seeding; new-style Generator API |
| Package discovery | Custom import path manipulation | `pip install -e .` with hatchling src-layout | Correct Python packaging; avoids sys.path hacks |
| Docstring format enforcement | Manual review | `ruff` with `convention = "numpy"` | Automated; enforced at CI |
| Reward probability validation | Custom checks | pydantic or dataclasses with `__post_init__` | Catches config errors early with good messages |

**Key insight:** The environment simulator itself is the one thing that must be hand-rolled — no existing library generates PRL pick_best_cue trial sequences. Everything else (config loading, RNG, package structure, linting) has a standard solution.

## Common Pitfalls

### Pitfall 1: JAX Version Conflict on Windows
**What goes wrong:** `pip install -e .` pulls latest jax (0.9.x), which requires Python 3.11+ and is incompatible with pyhgf's `<0.4.32` pin. Pip may silently install an incompatible combination.

**Why it happens:** pyhgf pins `jax>=0.4.26,<0.4.32` but pyproject.toml without an upper bound on jax could pull 0.9.x first, then fail to satisfy pyhgf's constraints.

**How to avoid:** Explicitly pin `jax>=0.4.26,<0.4.32` and `jaxlib>=0.4.26,<0.4.32` in pyproject.toml dependencies. Install jax before pyhgf: `pip install "jax[cpu]>=0.4.26,<0.4.32"`.

**Warning signs:** `ERROR: Package 'pyhgf' requires jax<0.4.32` during install.

### Pitfall 2: numpy 2.0 Binary Incompatibility
**What goes wrong:** If any dependency was compiled against numpy 1.x, importing it with numpy 2.x installed causes a segfault or `AttributeError`.

**Why it happens:** numpy 2.0 broke binary compatibility (released June 2024). pyhgf requires `numpy>=2.0.0`, meaning all dependencies must be numpy-2.0-compatible.

**How to avoid:** Use pyhgf 0.2.8 (already requires numpy>=2.0) and install everything together via a fresh virtual environment. Do not mix packages compiled against numpy 1.x.

**Warning signs:** `AttributeError: module 'numpy' has no attribute 'bool'` or segfault on import.

### Pitfall 3: JAX GPU Not Available on Windows
**What goes wrong:** JAX GPU support is not available on Windows (only via WSL2). Attempting to use JAX with CUDA on native Windows silently falls back to CPU or errors.

**Why it happens:** JAX does not ship GPU wheels for Windows. This project runs CPU-only on Windows.

**How to avoid:** Use `jax[cpu]` explicitly. Document this in README. No code changes needed since pyhgf and PyMC work fine with CPU JAX.

**Warning signs:** JAX tries to find CUDA devices and logs warnings on startup.

### Pitfall 4: pick_best_cue Config Not Publicly Available
**What goes wrong:** The PRL task's `pick_best_cue.json` config is in the belieflab/prl repository (jsPsych 7.x JavaScript task), not a Python-accessible file. The task config includes experiment parameters but the exact reward probability schedule is not publicly documented in detail.

**Why it happens:** The PRL task is a browser-based JavaScript application; its config is not designed for Python import.

**How to avoid:** Reconstruct the task structure from task documentation and literature (80/20 reward probabilities are standard in reversal learning literature). Document the reconstruction in the YAML config with comments. Flag for verification against actual task parameters before real-data analysis.

**Warning signs:** Any assumption about exact trial counts or reward probabilities being "imported" from the task repo.

### Pitfall 5: src-layout + pytest import errors
**What goes wrong:** Running `pytest` from the project root cannot find `prl_hgf` because it's in `src/`.

**Why it happens:** Python does not automatically add `src/` to `sys.path`.

**How to avoid:** Set `pythonpath = ["src"]` in `[tool.pytest.ini_options]` in pyproject.toml. Always use `pip install -e .` before running tests.

**Warning signs:** `ModuleNotFoundError: No module named 'prl_hgf'` when running pytest.

### Pitfall 6: RNG State Not Byte-Identical Across numpy Versions
**What goes wrong:** Using the legacy `np.random.seed()` + `np.random.rand()` API does not guarantee byte-identical output across numpy versions. The new-style Generator API may also differ across versions.

**Why it happens:** numpy's random number generation internals can change across minor versions.

**How to avoid:** Use `numpy.random.default_rng(seed)` (new-style Generator) throughout. Document that reproducibility is guaranteed only within the same numpy version. Pin numpy version in the lockfile (not pyproject.toml, but in a `requirements-lock.txt` or `uv.lock`).

**Warning signs:** Tests checking for byte-identical output fail after numpy upgrade.

## Code Examples

### Creating the pyhgf Network for 3 Parallel Binary Branches (Preview for Phase 2)
```python
# Source: https://computationalpsychiatry.github.io/pyhgf/notebooks/0.2-Creating_networks.html
# NOTE: This is a Phase 2 task; included here so Phase 1 planner can verify
# the Network API supports the required topology before committing to it.
from pyhgf.model import Network

# 3 parallel binary input branches, shared volatility parent
three_cue_hgf = (
    Network()
    .add_nodes(kind="binary-state", n_nodes=3)  # nodes 0, 1, 2: one per cue
    .add_nodes(value_children=[0])              # node 3: continuous state for cue 0
    .add_nodes(value_children=[1])              # node 4: continuous state for cue 1
    .add_nodes(value_children=[2])              # node 5: continuous state for cue 2
    .add_nodes(volatility_children=[3, 4, 5])   # node 6: shared volatility parent
)
```

**Confidence: MEDIUM** — The multi-input Network API is confirmed to exist and supports `n_nodes` and `value_children` lists. The exact structure above (3 binary + 3 continuous + 1 shared volatility) has not been run; the topology matches what's shown in the "multi-input" examples from the docs. Verify during Phase 2.

### Partial Feedback (Unchosen Cues)
```python
# Partial feedback pattern: pass NaN for unchosen cues
# NOTE: This is LOW confidence — not explicitly documented in pyhgf 0.2.8.
# The 'observed' field in node_trajectories suggests support for missing inputs.
# Must verify empirically in Phase 2.
import numpy as np

# input_data shape: (n_trials, n_cues) — NaN for unchosen cues
input_data = np.full((n_trials, 3), np.nan)
for t, (cue_chosen, reward) in enumerate(zip(choices, rewards)):
    input_data[t, cue_chosen] = float(reward)
```

### Minimal pyproject.toml (Phase 1 Target)
```toml
# Source: https://packaging.python.org/en/latest/guides/writing-pyproject-toml/
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[project]
name = "prl-hgf"
version = "0.1.0"
requires-python = ">=3.10,<3.14"
dependencies = [
    "pyhgf>=0.2.8,<0.3",
    "jax>=0.4.26,<0.4.32",
    "jaxlib>=0.4.26,<0.4.32",
    "numpy>=2.0.0,<3.0",
    "pandas>=2.0",
    "scipy>=1.10",
    "matplotlib>=3.4.0",
    "seaborn>=0.13.2",
    "arviz>=0.21.0",
    "ipywidgets>=8.0",
    "pyyaml>=6.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.0",
    "ruff>=0.3",
    "mypy>=1.8",
]

[tool.hatch.build.targets.wheel]
packages = ["src/prl_hgf"]

[tool.pytest.ini_options]
testpaths = ["tests"]
pythonpath = ["src"]

[tool.ruff]
line-length = 88

[tool.ruff.lint]
select = ["E", "F", "W", "D", "I", "UP"]
ignore = ["D203", "D213"]

[tool.ruff.lint.pydocstyle]
convention = "numpy"

[tool.mypy]
python_version = "3.10"
strict = true
```

### Environment Simulator Unit Test Pattern
```python
# tests/test_env_simulator.py
from __future__ import annotations
import numpy as np
from prl_hgf.env.simulator import generate_session


def test_trial_count():
    config = load_config("configs/prl_analysis.yaml")
    trials = generate_session(config, seed=42)
    # 3 sets × 4 phases × 30 trials = 360 trials (adjust per actual config)
    assert len(trials) == 360


def test_reproducibility():
    config = load_config("configs/prl_analysis.yaml")
    trials_a = generate_session(config, seed=42)
    trials_b = generate_session(config, seed=42)
    assert trials_a == trials_b


def test_phase_labels():
    config = load_config("configs/prl_analysis.yaml")
    trials = generate_session(config, seed=42)
    labels = {t.phase_label for t in trials}
    assert labels == {"stable", "volatile"}


def test_reward_probs_sum_to_one():
    config = load_config("configs/prl_analysis.yaml")
    trials = generate_session(config, seed=42)
    for t in trials:
        # Not required to sum to 1, but each prob should be valid
        assert all(0.0 <= p <= 1.0 for p in t.cue_probs)
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| `np.random.seed()` global | `numpy.random.default_rng(seed)` | numpy 1.17 (2019) | Thread-safe, reproducible per-generator seeding |
| `setup.py` / `setup.cfg` | `pyproject.toml` with hatchling | PEP 517/518 (2018), widespread adoption 2022+ | Single config file for build + tooling |
| `flake8` + `black` + `isort` | `ruff` (replaces all three) | ruff stable 2023 | Single tool, much faster |
| numpy 1.x | numpy 2.x | June 2024 | Binary incompatibility with older extensions |
| `pyhgf.model.HGF(n_levels=2)` | `pyhgf.model.Network()` with `add_nodes` | pyhgf 0.2.x | More flexible custom topologies |

**Deprecated/outdated:**
- `np.random.seed()`: Still works but discouraged; use `np.random.default_rng()`.
- `typing.Optional`, `typing.List`, `typing.Dict`: Replaced by `X | None`, `list[X]`, `dict[K, V]` in Python 3.10+.
- `setup.py`: Superseded by pyproject.toml for pure Python packages.

## Open Questions

1. **Exact pick_best_cue task parameters**
   - What we know: PRL task uses belieflab/prl repo (jsPsych); reversal_type field exists; ~160 total trials mentioned; 80/20 reward contingencies are standard in literature
   - What's unclear: Exact trial counts per phase, exact reward probabilities, number of reversals per set, transfer phase structure
   - Recommendation: Define reasonable defaults in YAML config (80/20, 30 trials/phase, 3 sets); add a `# TODO: verify against actual task config` comment; plan to update before real-data analysis

2. **Partial feedback implementation in pyhgf 0.2.8**
   - What we know: Network API supports multiple input nodes; node_trajectories has 'observed' field suggesting per-trial masking may be possible; input_data accepts 2D arrays for multi-input networks
   - What's unclear: Whether passing NaN to an input node correctly skips that node's update in 0.2.8; API for marking observations as missing
   - Recommendation: This is a Phase 2 concern, not Phase 1. Phase 1 only needs the environment simulator (no pyhgf calls). Flag for early testing in Phase 2.

3. **Python version: 3.10 vs 3.11**
   - What we know: pyhgf 0.2.8 supports Python 3.10–3.13; JAX 0.4.26–0.4.31 supports Python 3.10+; pymc 5.25.1 supports Python 3.10+; current system is Windows 11
   - What's unclear: Whether Python 3.10 will encounter any subtle incompatibilities vs 3.11 in practice
   - Recommendation: Target Python 3.11 as the minimum in practice (most packages have better-tested 3.11 paths) but declare `>=3.10` in pyproject.toml for flexibility

4. **jaxlib Windows wheels for 0.4.26–0.4.31**
   - What we know: JAX provides CPU-only wheels for Windows; jaxlib 0.4.26–0.4.31 should have Windows wheels on PyPI
   - What's unclear: Whether all versions in this range have Windows wheels (some versions have been yanked, e.g., 0.4.32 was yanked for data corruption bug on TPU)
   - Recommendation: Try `pip install "jax[cpu]==0.4.31" "jaxlib==0.4.31"` first; fall back to 0.4.30 if needed; document working version in README

## Sources

### Primary (HIGH confidence)
- PyPI pyhgf 0.2.8 metadata (`https://pypi.org/pypi/pyhgf/0.2.8/json`) — exact Python version requirements and dependency pins
- PyPI pymc 5.25.1 metadata (`https://pypi.org/pypi/pymc/5.25.1/json`) — confirms Python >=3.10 support
- PyPI jax PyPI page (`https://pypi.org/project/jax/`) — current version 0.9.2, requires Python >=3.11
- PyPI jax 0.4.31 (`https://pypi.org/project/jax/0.4.31/`) — confirms Python >=3.10 support in the compatible range
- pyhgf documentation: Creating networks (`https://computationalpsychiatry.github.io/pyhgf/notebooks/0.2-Creating_networks.html`) — Network API with `add_nodes`, multi-input examples
- pyhgf documentation: Binary HGF (`https://computationalpsychiatry.github.io/pyhgf/notebooks/1.1-Binary_HGF.html`) — HGF class, HGFDistribution, PyMC integration
- pyhgf documentation: Custom response functions (`https://computationalpsychiatry.github.io/pyhgf/notebooks/2-Using_custom_response_functions.html`) — response function signature
- Python Packaging Guide (`https://packaging.python.org/en/latest/guides/writing-pyproject-toml/`) — pyproject.toml standard
- Ruff configuration docs (`https://docs.astral.sh/ruff/configuration/`) — linting setup

### Secondary (MEDIUM confidence)
- pyhgf arXiv paper 2410.09206 — architecture description (multiple input nodes, branch specialization)
- GitHub ComputationalPsychiatry/pyhgf releases page — v0.2.8 release date (October 3, 2025) and changelog
- WebSearch: JAX 0.4.31 Windows CPU install — confirmed CPU-only Windows support

### Tertiary (LOW confidence)
- WebSearch: JAX version compatibility across Python versions — multiple sources agree 0.4.x supports Python 3.10+
- belieflab/prl GitHub README — task has ~160 trials, reversal_type field; exact pick_best_cue config not publicly accessible
- Inferred: pyhgf NaN-for-missing-inputs pattern — not verified against 0.2.8 source code

## Metadata

**Confidence breakdown:**
- Standard stack (versions, deps): HIGH — verified via PyPI JSON API
- Architecture (pyproject.toml, src layout): HIGH — verified against official Python packaging docs
- pyhgf Network API for multi-input: MEDIUM — confirmed multi-input nodes work; exact topology for 3 binary branches not run end-to-end
- Partial feedback (NaN) pattern: LOW — not explicitly documented; inferred from architecture
- pick_best_cue task structure: LOW — private repo; reconstructed from literature defaults
- Pitfalls (JAX version conflict, numpy 2.0): HIGH — verified from PyPI metadata

**Research date:** 2026-04-04
**Valid until:** 2026-05-04 (JAX version range may expand if pyhgf releases 0.2.9+)
