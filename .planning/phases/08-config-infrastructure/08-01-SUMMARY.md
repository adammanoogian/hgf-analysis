---
phase: 08-config-infrastructure
plan: 01
subsystem: config
tags: [dataclasses, yaml, pyarrow, power-analysis, bfda, frozen-dataclass]

# Dependency graph
requires:
  - phase: 02-models
    provides: AnalysisConfig/SimulationConfig/SessionConfig frozen dataclasses
  - phase: 01-foundation
    provides: config.py with CONFIGS_DIR path constant
provides:
  - PowerConfig frozen dataclass loading BFDA grid params from YAML power: section
  - make_power_config factory returning frozen AnalysisConfig with n_per_group and omega_2_deltas overrides
  - load_power_config reading only the power: key (no re-parse of task/simulation/fitting)
  - power: section in configs/prl_analysis.yaml with grid and seed params
  - pyarrow>=14.0 dependency declared for Plan 02 parquet I/O
affects:
  - 08-02 (power loop uses make_power_config as entry point)
  - 08-03 (SLURM array job uses PowerConfig.n_jobs throttle)

# Tech tracking
tech-stack:
  added: [pyarrow>=14.0 (declared, not yet used)]
  patterns:
    - dataclasses.replace bottom-up for frozen dataclass mutation-free overrides
    - Power subpackage wraps existing pipeline without modifying any existing module

key-files:
  created:
    - src/prl_hgf/power/__init__.py
    - src/prl_hgf/power/config.py
    - tests/test_power_config.py
  modified:
    - configs/prl_analysis.yaml
    - pyproject.toml
    - environment_gpu.yml

key-decisions:
  - "power/ subpackage never modifies existing modules — all new symbols in power/"
  - "make_power_config is pure (no I/O); load_power_config handles YAML reading separately"
  - "effect_size_delta shifts psilocybin omega_2_deltas only; placebo group unchanged"
  - "pyarrow added as declared dep now so Plan 02 can import without separate config change"

patterns-established:
  - "dataclasses.replace bottom-up: SessionConfig -> SimulationConfig -> AnalysisConfig for frozen override"
  - "Power YAML section isolated: load_power_config reads power: key only, does not touch task/simulation/fitting"
  - "PowerConfig __post_init__ validates: n_iterations>=1, n_jobs>=1, bf_threshold>0"

# Metrics
duration: 7min
completed: 2026-04-07
---

# Phase 8 Plan 1: Config + Infrastructure Summary

**Frozen AnalysisConfig power-variant factory using dataclasses.replace with PowerConfig YAML loader and 8 unit tests verifying immutability, delta application, and validation.**

## Performance

- **Duration:** 7 min
- **Started:** 2026-04-07T15:15:50Z
- **Completed:** 2026-04-07T15:22:47Z
- **Tasks:** 2
- **Files modified:** 6

## Accomplishments

- Created `power/` subpackage with `PowerConfig` frozen dataclass and two public functions: `make_power_config` (pure, no I/O) and `load_power_config` (YAML-only)
- Appended `power:` section to `configs/prl_analysis.yaml` with BFDA grid params (n_per_group_grid, effect_size_grid, n_iterations, master_seed, n_jobs, bf_threshold)
- Added `pyarrow>=14.0` to `pyproject.toml` and `environment_gpu.yml` for Plan 02 parquet I/O
- 8 unit tests all pass: override correctness, immutability, no base mutation, non-omega2 preservation, group key consistency, YAML loading, validation, frozen enforcement

## Task Commits

1. **Task 1: Create power/ subpackage with config factory and PowerConfig** - `bade89d` (feat)
2. **Task 2: Unit tests for make_power_config and PowerConfig** - `f3cdf15` (test)

## Files Created/Modified

- `src/prl_hgf/power/__init__.py` - Public re-exports for power subpackage (`make_power_config`, `PowerConfig`, `load_power_config`)
- `src/prl_hgf/power/config.py` - `PowerConfig` dataclass, `load_power_config` YAML loader, `make_power_config` factory
- `configs/prl_analysis.yaml` - Appended `power:` section with BFDA grid and seed parameters
- `tests/test_power_config.py` - 8 unit tests covering all must-have behaviors
- `pyproject.toml` - Added `pyarrow>=14.0` to dependencies and `pyarrow.*` to mypy overrides
- `environment_gpu.yml` - Added `pyarrow>=14.0` to pip block

## Decisions Made

- `make_power_config` shifts only the psilocybin group's `omega_2_deltas` by `effect_size_delta`; placebo deltas are copied unchanged. This reflects the study hypothesis (psilocybin increases learning rate; placebo provides an inert control) and avoids inflating placebo power.
- `load_power_config` reads only the `power:` top-level key from YAML. It does not re-parse `task`, `simulation`, or `fitting` sections, ensuring a clean separation of concerns.

## Deviations from Plan

None - plan executed exactly as written.

The only minor issue was a ruff import-sort warning (I001) on the test file, resolved immediately with `ruff --fix`.

## Issues Encountered

None.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness

- `make_power_config` is ready for Plan 02 (power simulation loop)
- `PowerConfig.n_jobs` and `PowerConfig.master_seed` are ready for Plan 03 (SLURM array)
- `pyarrow` declared — Plan 02 can import without additional config change
- Concern (from STATE.md): Phase 9 kappa effect size parameterization — verify kappa entry point in `GroupConfig` vs `SessionConfig` during Plan 02 unit tests before cluster submission

---
*Phase: 08-config-infrastructure*
*Completed: 2026-04-07*
