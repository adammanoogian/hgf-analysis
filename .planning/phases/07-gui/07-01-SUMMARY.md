---
phase: 07-gui
plan: "01"
subsystem: gui
tags: [ipywidgets, matplotlib, ipympl, jax, pyhgf, interactive, belief-caching]

requires:
  - phase: 02-models
    provides: build_2level_network, build_3level_network, extract_beliefs, extract_beliefs_3level, prepare_input_data, BELIEF_NODES, INPUT_NODES, VOLATILITY_NODE
  - phase: 03-simulation
    provides: simulate_agent, PARAM_BOUNDS, SimulationResult
  - phase: 01-foundation
    provides: load_config, generate_session, Trial

provides:
  - ParamExplorer class in src/prl_hgf/gui/explorer.py
  - src/prl_hgf/gui/__init__.py exporting ParamExplorer
  - ipympl>=0.9.0 added to pyproject.toml
  - 12 unit tests in tests/test_gui.py (all passing, Agg backend)

affects: [notebooks, final-deliverable]

tech-stack:
  added: [ipympl>=0.9.0]
  patterns:
    - "Batch forward pass (net.input_data 420 trials at once) for GUI updates instead of simulate_agent trial loop"
    - "Belief caching: HGF params trigger forward pass, response params (beta/zeta) only recompute softmax"
    - "Unobserve/observe pattern for preset loading to fire exactly one forward pass"
    - "FloatSlider with continuous_update=False on all sliders"

key-files:
  created:
    - src/prl_hgf/gui/__init__.py
    - src/prl_hgf/gui/explorer.py
    - tests/test_gui.py
  modified:
    - pyproject.toml

key-decisions:
  - "Batch forward pass (~1.1-1.7s) used for slider updates; simulate_agent (~4.2s) only for one-time JAX warm-up"
  - "Belief cache keyed on HGF params (omega_2, omega_3, kappa, mu_1_0, mu_3_0) — response params (beta, zeta) bypass the forward pass"
  - "GUI_SEED=0 fixed for warm-up simulation; observation mask is deterministic and documented as a representative session"
  - "Agg backend set before any matplotlib import in tests for headless execution"
  - "Module-scoped pytest fixture for explorer to amortise JAX JIT compilation (~25s) across all 12 tests"

patterns-established:
  - "Pattern: Batch forward pass pattern for all pyhgf GUI updates"
  - "Pattern: Unobserve/observe bracket for bulk widget value updates"
  - "Pattern: matplotlib Agg backend set at module level in test files before pyplot import"

duration: 9min
completed: "2026-04-06"
---

# Phase 7 Plan 01: ParamExplorer GUI Summary

**Interactive HGF parameter explorer using ipywidgets + matplotlib batch forward pass with belief caching, model toggle, preset profiles, and 12 passing headless unit tests**

## Performance

- **Duration:** 9 min
- **Started:** 2026-04-06T19:57:31Z
- **Completed:** 2026-04-06T20:05:49Z
- **Tasks:** 2
- **Files modified:** 4

## Accomplishments

- ParamExplorer class with 7 sliders, 4-panel figure, model toggle, and 3 preset profiles
- Batch forward pass architecture (~1.1-1.7s per slider change vs ~4.2s trial-by-trial)
- Belief caching: beta/zeta changes skip forward pass entirely (<1ms softmax recompute)
- 12 unit tests all passing with Agg backend (headless, no display required)

## Task Commits

Each task was committed atomically:

1. **Task 1: Add ipympl dependency and create ParamExplorer module** - `90169fc` (feat)
2. **Task 2: Unit tests for ParamExplorer** - `7569ca5` (test)

**Plan metadata:** (docs commit follows this summary)

## Files Created/Modified

- `src/prl_hgf/gui/__init__.py` - Package init exporting ParamExplorer
- `src/prl_hgf/gui/explorer.py` - ParamExplorer class (299 lines): sliders, caching, plot update, presets, model toggle
- `tests/test_gui.py` - 12 unit tests with module-scoped fixture and Agg backend
- `pyproject.toml` - Added ipympl>=0.9.0 dependency

## Decisions Made

- **Batch forward pass chosen over simulate_agent for GUI:** Research phase confirmed ~4.2s vs ~1.1-1.7s. simulate_agent is only used for the one-time JAX warm-up to generate the fixed observation mask.
- **GUI_SEED=0 fixed constant for warm-up:** Produces a deterministic representative session; documented in module docstring that trajectories reflect one simulated session.
- **Agg backend at module level before pyplot import in tests:** Prevents display-related errors in headless CI environments; must precede any matplotlib.pyplot import.
- **Module-scoped fixture for explorer:** JAX JIT compilation during warm-up (~25s setup) is amortised across all 12 tests, keeping the full suite under 65s.
- **Belief cache check by identity (`is`) not equality:** Test 6 checks that `_cached_beliefs_` is the same dict object after a beta change, confirming no forward pass was re-run.

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered

- Ruff reported I001 (unsorted imports) on first pass: `scipy` was incorrectly grouped with stdlib instead of third-party. Fixed by reordering to alphabetical within the third-party block. Ruff passed clean on second attempt.
- Multi-line `conda run -n ds_env python -c "..."` fails on Windows (conda 25.7.0): worked around by writing a temp script file for method-existence check (then deleted before commit).

## User Setup Required

None - no external service configuration required. ipympl is added as a dependency in pyproject.toml; install with `pip install ipympl>=0.9.0` or via `pip install -e ".[dev]"`.

## Next Phase Readiness

- ParamExplorer is the final deliverable of the project pipeline.
- To use in a notebook: `%matplotlib widget` then `from prl_hgf.gui import ParamExplorer; explorer = ParamExplorer(); display(explorer.display())`
- ipympl must be installed for the `%matplotlib widget` backend; without it, the `display()` method still works but canvas will not be an interactive widget.
- No further phases planned (project pipeline complete).

---
*Phase: 07-gui*
*Completed: 2026-04-06*
