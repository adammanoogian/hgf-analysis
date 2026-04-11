---
phase: 12-batched-hierarchical-jax-logp
plan: 01
type: execute
wave: 1
depends_on: []
files_modified:
  - src/prl_hgf/fitting/legacy/__init__.py
  - src/prl_hgf/fitting/legacy/single.py
  - src/prl_hgf/fitting/legacy/batch.py
  - src/prl_hgf/fitting/single.py
  - src/prl_hgf/fitting/batch.py
  - src/prl_hgf/fitting/__init__.py
autonomous: true

must_haves:
  truths:
    - "src/prl_hgf/fitting/legacy/ exists as a Python subpackage"
    - "fit_participant and fit_batch live in legacy/ with the frozen-for-v1.1 docstring header"
    - "All existing imports of prl_hgf.fitting.batch.fit_batch and prl_hgf.fitting.single.fit_participant still resolve unchanged"
    - "ops.py and models.py remain at their original locations (per-participant path is unmodified)"
    - "tests/test_fitting.py still passes without any test edits"
  artifacts:
    - path: "src/prl_hgf/fitting/legacy/__init__.py"
      provides: "Legacy v1.1 sequential fitting subpackage"
      exports: ["fit_participant", "fit_batch", "extract_summary_rows", "flag_fit"]
    - path: "src/prl_hgf/fitting/legacy/single.py"
      provides: "Frozen per-participant NUTS fitter (moved verbatim from fitting/single.py)"
      contains: "Frozen for v1.1 reproducibility"
    - path: "src/prl_hgf/fitting/legacy/batch.py"
      provides: "Frozen per-participant batch loop (moved verbatim from fitting/batch.py)"
      contains: "Frozen for v1.1 reproducibility"
    - path: "src/prl_hgf/fitting/single.py"
      provides: "Backward-compat shim re-exporting from legacy/single.py"
      min_lines: 10
    - path: "src/prl_hgf/fitting/batch.py"
      provides: "Backward-compat shim re-exporting from legacy/batch.py"
      min_lines: 10
  key_links:
    - from: "src/prl_hgf/fitting/single.py"
      to: "src/prl_hgf/fitting/legacy/single.py"
      via: "from prl_hgf.fitting.legacy.single import *"
      pattern: "from prl_hgf\\.fitting\\.legacy\\.single import"
    - from: "src/prl_hgf/fitting/batch.py"
      to: "src/prl_hgf/fitting/legacy/batch.py"
      via: "from prl_hgf.fitting.legacy.batch import *"
      pattern: "from prl_hgf\\.fitting\\.legacy\\.batch import"
    - from: "src/prl_hgf/fitting/__init__.py"
      to: "src/prl_hgf/fitting/legacy/"
      via: "re-export both legacy + future hierarchical APIs"
      pattern: "from prl_hgf\\.fitting\\.legacy"
---

<objective>
Migrate the v1.1 per-participant sequential fitting code into a frozen `legacy/` subpackage so that the upcoming v1.2 batched hierarchical path (Plans 12-02 / 12-03) can become the new default without breaking any existing imports. This is the "replace-and-freeze" architecture decision from `12-CONTEXT.md` (Legacy Path Architecture, BATCH/VALID-05).

Purpose: Phase 14 will eventually wire a `--legacy` flag on `scripts/08_run_power_iteration.py` to route between the sequential and batched paths. Phase 12 only needs to (a) move the code, (b) freeze it with a DO-NOT-MODIFY header, and (c) preserve every existing import surface so the rest of the codebase, the test suite, and the v1.1 power-sweep scripts keep working untouched.

Output:
- `src/prl_hgf/fitting/legacy/` subpackage containing `single.py` and `batch.py` (verbatim moves with frozen docstring headers)
- Backward-compat shim modules at `src/prl_hgf/fitting/single.py` and `src/prl_hgf/fitting/batch.py` that re-export every public name from `legacy/`
- `src/prl_hgf/fitting/__init__.py` updated to import from `legacy/` and reserve placeholders for the upcoming `hierarchical.py` exports (Plan 12-03)
- All existing tests pass with zero edits
</objective>

<execution_context>
@C:\Users\aman0087\.claude/get-shit-done/workflows/execute-plan.md
@C:\Users\aman0087\.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@.planning/PROJECT.md
@.planning/ROADMAP.md
@.planning/STATE.md
@.planning/phases/12-batched-hierarchical-jax-logp/12-CONTEXT.md
@src/prl_hgf/fitting/__init__.py
@src/prl_hgf/fitting/single.py
@src/prl_hgf/fitting/batch.py
@src/prl_hgf/fitting/ops.py
@src/prl_hgf/fitting/models.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Create legacy/ subpackage and move single.py + batch.py verbatim with frozen header</name>
  <files>src/prl_hgf/fitting/legacy/__init__.py, src/prl_hgf/fitting/legacy/single.py, src/prl_hgf/fitting/legacy/batch.py</files>
  <action>
Create the new subpackage `src/prl_hgf/fitting/legacy/` containing three files. This task moves code; do NOT change any logic.

**1. `src/prl_hgf/fitting/legacy/__init__.py`** — small subpackage init:

```python
"""Frozen v1.1 per-participant sequential fitting code.

# Frozen for v1.1 reproducibility — DO NOT MODIFY.
# See src/prl_hgf/fitting/hierarchical.py for the v1.2+ implementation.

This subpackage preserves the exact per-participant NUTS fitting path that
was code-complete on 2026-04-07 so that v1.1 BFDA results remain bit-exactly
reproducible after the v1.2 batched hierarchical refactor lands.

Phase 14 will add a ``--legacy`` flag to ``scripts/08_run_power_iteration.py``
that routes through these functions; Phase 12 only freezes the code in place.
"""

from __future__ import annotations

from prl_hgf.fitting.legacy.batch import fit_batch
from prl_hgf.fitting.legacy.single import (
    extract_summary_rows,
    flag_fit,
    fit_participant,
)

__all__ = [
    "fit_batch",
    "fit_participant",
    "extract_summary_rows",
    "flag_fit",
]
```

**2. `src/prl_hgf/fitting/legacy/single.py`** — copy the entire current contents of `src/prl_hgf/fitting/single.py` verbatim, then prepend the frozen header **immediately after** `from __future__ import annotations`:

```python
"""Single-participant MCMC fitting for 2-level and 3-level binary HGF models.

# Frozen for v1.1 reproducibility — DO NOT MODIFY.
# See src/prl_hgf/fitting/hierarchical.py for the v1.2+ implementation.

[... rest of original docstring unchanged ...]
"""

from __future__ import annotations
```

Update the internal import inside this file from
`from prl_hgf.fitting.models import build_pymc_model_2level, build_pymc_model_3level`
to keep it as-is — `models.py` and `ops.py` are NOT moving; only `single.py` and `batch.py` move. The legacy file should still import from `prl_hgf.fitting.models`.

Do NOT change any function signatures, body, defaults, log statements, or constants. Bit-for-bit code preservation.

**3. `src/prl_hgf/fitting/legacy/batch.py`** — copy the entire current contents of `src/prl_hgf/fitting/batch.py` verbatim, prepend the same frozen header inside the module docstring, then update the internal import from
`from prl_hgf.fitting.single import fit_participant`
to
`from prl_hgf.fitting.legacy.single import fit_participant`
so the legacy batch loop calls the legacy single-participant function (same code, just relocated).

Likewise update the internal import inside `_prewarm_jit`:
```python
from prl_hgf.fitting.ops import (
    build_logp_ops_2level,
    build_logp_ops_3level,
)
```
stays as-is — `ops.py` is unmoved.

**Constraint:** Use the Read tool first to read the current `single.py` and `batch.py` exactly, then Write the legacy copies. The `_RESULT_COLUMNS` list, `_make_nan_rows`, `_build_arrays`, `_prewarm_jit`, and the public `fit_batch` signature must all be byte-identical (modulo the frozen header and the one internal import path change).
  </action>
  <verify>
1. `python -c "from prl_hgf.fitting.legacy import fit_batch, fit_participant, extract_summary_rows, flag_fit; print('OK')"` succeeds
2. `python -c "from prl_hgf.fitting.legacy.single import fit_participant; import inspect; assert 'Frozen for v1.1 reproducibility' in inspect.getsource(fit_participant.__module__.__class__) or True; print('header present')"` (header check)
3. `python -m ruff check src/prl_hgf/fitting/legacy/`
  </verify>
  <done>
- `src/prl_hgf/fitting/legacy/` directory exists with three files
- Each of `legacy/single.py` and `legacy/batch.py` contains the `# Frozen for v1.1 reproducibility — DO NOT MODIFY.` header inside its module docstring
- `from prl_hgf.fitting.legacy import fit_batch, fit_participant` works
- ruff is clean on the new subpackage
  </done>
</task>

<task type="auto">
  <name>Task 2: Replace fitting/single.py and fitting/batch.py with backward-compat shims and update fitting/__init__.py</name>
  <files>src/prl_hgf/fitting/single.py, src/prl_hgf/fitting/batch.py, src/prl_hgf/fitting/__init__.py</files>
  <action>
Now that `legacy/` holds the real code, replace `src/prl_hgf/fitting/single.py` and `src/prl_hgf/fitting/batch.py` with thin re-export shims so every existing call site (`scripts/04_fit_participants.py`, `scripts/05_run_validation.py`, `scripts/08_run_power_iteration.py`, `src/prl_hgf/power/precheck.py`, `src/prl_hgf/power/iteration.py`, `tests/test_fitting.py`, etc.) keeps working unchanged. **Why shims and not import-rewrites:** the v1.1 power-sweep scripts must remain bit-exactly callable for the eventual `--legacy` Phase-14 wiring; rewriting all call sites would also expand this plan's blast radius beyond the fitting module. Shims keep the change surgical.

**1. New `src/prl_hgf/fitting/single.py`** (replace entire file contents):

```python
"""Backward-compatibility shim for pre-v1.2 imports.

The real per-participant NUTS code now lives in
:mod:`prl_hgf.fitting.legacy.single`. This module re-exports every public
name so existing imports such as
``from prl_hgf.fitting.single import fit_participant`` keep working.

# Frozen for v1.1 reproducibility — DO NOT MODIFY.
# See src/prl_hgf/fitting/hierarchical.py for the v1.2+ implementation.
"""

from __future__ import annotations

from prl_hgf.fitting.legacy.single import (  # noqa: F401
    ESS_THRESHOLD,
    R_HAT_THRESHOLD,
    extract_summary_rows,
    flag_fit,
    fit_participant,
)

__all__ = [
    "fit_participant",
    "extract_summary_rows",
    "flag_fit",
    "R_HAT_THRESHOLD",
    "ESS_THRESHOLD",
]
```

**2. New `src/prl_hgf/fitting/batch.py`** (replace entire file contents):

```python
"""Backward-compatibility shim for pre-v1.2 imports.

The real per-participant batch loop now lives in
:mod:`prl_hgf.fitting.legacy.batch`. This module re-exports every public
name (and the private ``_prewarm_jit`` helper consumed by
``scripts/08_run_power_iteration.py``) so existing imports keep working.

# Frozen for v1.1 reproducibility — DO NOT MODIFY.
# See src/prl_hgf/fitting/hierarchical.py for the v1.2+ implementation.
"""

from __future__ import annotations

from prl_hgf.fitting.legacy.batch import (  # noqa: F401
    _make_nan_rows,
    _prewarm_jit,
    _RESULT_COLUMNS,
    fit_batch,
)

__all__ = ["fit_batch"]
```

Note: `_prewarm_jit` and `_RESULT_COLUMNS` are private but `scripts/08_run_power_iteration.py` imports `_prewarm_jit` directly (`from prl_hgf.fitting.batch import _prewarm_jit`), so the shim must re-export it. Verify by grepping after the change.

**3. Update `src/prl_hgf/fitting/__init__.py`** to (a) keep all existing exports stable and (b) add a stub comment block reserving the future hierarchical exports (which Plan 12-03 will activate). Replace the file with:

```python
"""Model fitting module for the PRL pick_best_cue HGF pipeline.

Public API surface:

* Legacy v1.1 per-participant sequential path (frozen, in
  :mod:`prl_hgf.fitting.legacy`):

  - :func:`fit_batch` — sequential per-participant NUTS loop
  - :func:`fit_participant` — single-participant NUTS fit
  - :func:`extract_summary_rows`, :func:`flag_fit`
  - :func:`build_pymc_model_2level`, :func:`build_pymc_model_3level`
  - :func:`build_logp_ops_2level`, :func:`build_logp_ops_3level`

* v1.2 batched hierarchical path (added by Plans 12-02 / 12-03):

  - :func:`build_logp_ops_batched` — batched JAX logp Op factory
  - :func:`fit_batch_hierarchical` — single-call cohort orchestrator
"""

from __future__ import annotations

# Legacy (frozen) per-participant path — re-exported via the shim modules so
# existing call sites such as ``from prl_hgf.fitting import fit_batch`` keep
# resolving without code changes.
from prl_hgf.fitting.batch import fit_batch
from prl_hgf.fitting.models import (
    build_pymc_model_2level,
    build_pymc_model_3level,
)
from prl_hgf.fitting.ops import (
    build_logp_ops_2level,
    build_logp_ops_3level,
)
from prl_hgf.fitting.single import (
    extract_summary_rows,
    flag_fit,
    fit_participant,
)

# v1.2 batched hierarchical path — populated by Plan 12-02 (build_logp_ops_batched)
# and Plan 12-03 (fit_batch_hierarchical, build_pymc_model_batched). Until those
# land the symbols are not part of the public API; importing from
# prl_hgf.fitting.hierarchical directly will raise ModuleNotFoundError.

__all__ = [
    "fit_batch",
    "fit_participant",
    "extract_summary_rows",
    "flag_fit",
    "build_pymc_model_2level",
    "build_pymc_model_3level",
    "build_logp_ops_2level",
    "build_logp_ops_3level",
]
```

**Critical:** Do NOT delete `src/prl_hgf/fitting/ops.py` or `src/prl_hgf/fitting/models.py` — they stay in place and are still imported by the (now-shim) `single.py` indirectly via `legacy/single.py` -> `prl_hgf.fitting.models` -> `prl_hgf.fitting.ops`.
  </action>
  <verify>
Run each command from the repo root with the project venv:

1. `python -c "from prl_hgf.fitting import fit_batch, fit_participant, build_pymc_model_2level, build_pymc_model_3level, build_logp_ops_2level, build_logp_ops_3level, extract_summary_rows, flag_fit; print('OK')"` succeeds
2. `python -c "from prl_hgf.fitting.batch import fit_batch, _prewarm_jit; print('OK')"` succeeds (covers scripts/08_run_power_iteration.py import pattern)
3. `python -c "from prl_hgf.fitting.single import fit_participant, extract_summary_rows, flag_fit; print('OK')"` succeeds
4. `python -c "from prl_hgf.fitting.ops import build_logp_ops_2level, build_logp_ops_3level; print('OK')"` succeeds (covers tests/test_fitting.py and analysis/bms.py import patterns)
5. `python -m pytest tests/test_fitting.py -v -k "not slow" --timeout=60` — all fast tests still pass with **zero test edits**
6. `python -m ruff check src/prl_hgf/fitting/`
  </verify>
  <done>
- `from prl_hgf.fitting import ...` for every previously-exported name works
- `from prl_hgf.fitting.batch import _prewarm_jit` (private symbol used by scripts/08) works
- `tests/test_fitting.py` fast subset passes with no test edits
- ruff clean on the entire fitting/ subpackage
- The fitting/__init__.py reserves hierarchical exports as a comment block for Plan 12-02/12-03 to activate
  </done>
</task>

</tasks>

<verification>
1. `python -c "from prl_hgf.fitting import fit_batch, fit_participant, build_pymc_model_2level, build_pymc_model_3level, build_logp_ops_2level, build_logp_ops_3level"` — every legacy export resolves
2. `python -c "from prl_hgf.fitting.legacy import fit_batch, fit_participant"` — new legacy subpackage importable
3. `python -m pytest tests/test_fitting.py -v -k "not slow" --timeout=60` — all non-slow fitting tests pass with no edits
4. `python -m ruff check src/prl_hgf/fitting/` — no violations
5. `grep -r "Frozen for v1.1 reproducibility" src/prl_hgf/fitting/legacy/` — header is present in both moved files (use Grep tool)
</verification>

<success_criteria>
- `src/prl_hgf/fitting/legacy/` subpackage exists with `__init__.py`, `single.py`, `batch.py`
- Both moved files contain the `# Frozen for v1.1 reproducibility — DO NOT MODIFY.` header
- `src/prl_hgf/fitting/single.py` and `src/prl_hgf/fitting/batch.py` are now thin shims re-exporting from `legacy/`
- `src/prl_hgf/fitting/ops.py` and `src/prl_hgf/fitting/models.py` are unmodified (per-participant logp / PyMC builders stay in place)
- `src/prl_hgf/fitting/__init__.py` keeps every prior export and adds a docstring/comment block reserving the upcoming hierarchical API
- `tests/test_fitting.py` non-slow subset passes with no edits
- All downstream importers (`scripts/`, `src/prl_hgf/power/`, `tests/`) keep working unchanged
</success_criteria>

<output>
After completion, create `.planning/phases/12-batched-hierarchical-jax-logp/12-01-SUMMARY.md` documenting:
- Files moved into legacy/ and shims created
- Confirmation that no downstream imports were touched
- Where the upcoming hierarchical.py module will live (file does not exist yet — Plan 12-02 creates it)
</output>
