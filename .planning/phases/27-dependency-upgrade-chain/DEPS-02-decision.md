# DEPS-02 Decision Record: pyhgf <-> JAX bypass strategy

**Date:** 2026-05-04
**Phase:** 27-01
**Status:** FINAL — hard-blocks plan 27-02

---

## Matrix results

All 6 cells in the 2x3 matrix (pyhgf {0.2.8, 0.2.11} x JAX {0.7.0, 0.9.0, 0.10.0}) FAILED
with the same error. Strategy A (`pip install --no-deps pyhgf`) is **not viable at any tested
JAX version**. Strategy C (fork) is mandatory.

| pyhgf version | JAX 0.7.0 | JAX 0.9.0 | JAX 0.10.0 |
|---------------|-----------|-----------|------------|
| 0.2.8 | FAIL | FAIL | FAIL |
| 0.2.11 | FAIL | FAIL | FAIL |

**Failure mode (all 6 cells):** `ModuleNotFoundError: No module named 'jaxlib.xla_extension'`

Root cause: `pyhgf/typing.py` line 4 (0.2.8) and line 8 (0.2.11) both import:

```python
from jaxlib.xla_extension import PjitFunction
```

`jaxlib.xla_extension` was restructured in JAX 0.5.x and `PjitFunction` was removed. The
submodule itself no longer exists in JAX 0.7.x, 0.9.x, or 0.10.x. This is a hard import-time
failure — it occurs before any HGF construction, before any `jax.lax.scan`, at module load.

The pip-declared constraint `jax<0.4.32,>=0.4.26` in pyhgf 0.2.x is not conservative
speculation — it reflects a genuine runtime incompatibility. pyhgf 0.2.x is hard-pinned to the
JAX 0.4.x era at a code level, not just a metadata level.

**Evidence artefacts:**
- `probe_jax_0.7.0_pyhgf-0.2.8.txt`
- `probe_jax_0.9.0_pyhgf-0.2.8.txt`
- `probe_jax_0.10.0_pyhgf-0.2.8.txt`
- `probe_jax_0.7.0_pyhgf-0.2.11.txt`
- `probe_jax_0.9.0_pyhgf-0.2.11.txt`
- `probe_jax_0.10.0_pyhgf-0.2.11.txt`

---

## jaxopt smoke result

`from jaxopt import LBFGS` imports cleanly at JAX 0.10.0 (probe_jaxopt_at_jax_0.10.0.txt:
"jaxopt OK"). jaxopt is NOT blocked. The inline `optax.lbfgs()` adapter mitigation noted in
research §3 is not needed at this time.

---

## Strategy chosen

**Strategy C — fork pyhgf 0.2.8, edit `jax<0.4.32` pin and `PjitFunction` import**

Strategy A (`pip install --no-deps pyhgf==0.2.8`) is unviable: all 6 runtime cells fail with
`ModuleNotFoundError: No module named 'jaxlib.xla_extension'`. The failure is at import time in
`pyhgf/typing.py`, which hard-imports `jaxlib.xla_extension.PjitFunction`. This API does not
exist in JAX >= 0.5.x.

Strategy B (pip constraints file) is also unviable: the constraint conflict is a runtime API
removal, not a resolver conflict. Overriding the pip version pin does not fix the missing
`jaxlib.xla_extension` submodule.

**Minimum changes required in the fork (pyhgf 0.2.8 base):**

1. In `pyhgf/typing.py`, replace:
   ```python
   from jaxlib.xla_extension import PjitFunction
   ```
   with:
   ```python
   from typing import Callable as PjitFunction  # noqa: PjitFunction removed in JAX 0.5.x
   ```
   `PjitFunction` is only used as a type annotation in the `Sequence` alias
   (`tuple[tuple[int, PjitFunction], ...]`). `Callable` is a drop-in substitute for type
   annotation purposes.

2. In `pyproject.toml` of the fork, change:
   ```toml
   jax>=0.4.26,<0.4.32
   ```
   to:
   ```toml
   jax>=0.9.0,<0.11
   ```

No other source changes are anticipated — the matrix confirms the failure is entirely in
`pyhgf/typing.py`. The HGF computation itself uses stable `jax.lax.scan` and `jnp` APIs that
have not changed.

**Verification:** After the fork edit, re-run `probe_pyhgf_jax_compat.py` in the JAX 0.10.0
environment with the patched pyhgf installed editably. This is Task 1 of plan 27-02.

---

## Final pin choice

**pyhgf version:** 0.2.8 (forked). Use 0.2.8 as the fork base rather than 0.2.11. Both fail
identically and both contain the same `PjitFunction` import. 0.2.8 is the version this project
was validated against. Reason to not use 0.2.11: the `LayerState`/`LayerParams`/`NetworkState`
types added in 0.2.11 (visible in the inspected `typing.py`) suggest a larger API surface change;
0.2.8 is the known-validated base.

**JAX upper pin:** `jax>=0.9.0,<0.11`

Rationale:
- JAX 0.10.0 is the current latest (Apr 16 2026); no JAX 0.11.x is published yet
- BlackJAX 1.5 requires `jax>=0.9.0`
- NumPyro 0.21 requires `jax>=0.7.0`
- jaxopt imports cleanly at JAX 0.10.0 (confirmed)
- `<0.11` prevents auto-upgrade to hypothetical 0.11.x; lift when tested

---

## Inputs to plan 27-02

Plan 27-02's **first task** must:

1. Fork pyhgf 0.2.8 (clone to a local path or create a patched wheel), applying the single-line
   fix in `pyhgf/typing.py`.
2. Verify the fork passes the probe (`probe_pyhgf_jax_compat.py` exits 0).
3. Then edit `pyproject.toml` with the lines below.

**pyproject.toml diff (exact lines plan 27-02 must apply):**

```diff
--- a/pyproject.toml
+++ b/pyproject.toml
@@ requires-python line:
-    requires-python = ">=3.10"
+    requires-python = ">=3.11"

@@ dependencies block (add/replace these lines):
-    "jax>=0.4.26,<0.4.32",
-    "jaxlib>=0.4.26,<0.4.32",
+    "jax>=0.9.0,<0.11",
+    "jaxlib>=0.9.0,<0.11",

-    "blackjax>=1.2.4",
+    "blackjax>=1.5,<2.0",

+    "numpyro>=0.21.0,<0.22",

@@ tool.ruff section:
-    target-version = "py310"
+    target-version = "py311"

@@ tool.mypy section:
-    python_version = "3.10"
+    python_version = "3.11"
```

**pyhgf installation note for environment-v10.yml:**
The `pyhgf` dependency in `pyproject.toml` should remain as `pyhgf>=0.2.8,<0.3`. The actual
installation in `ds_env_v10` uses a two-step process:

```bash
# Step 1: Build environment without pyhgf (all other deps resolve cleanly)
mamba env create -f environment-v10.yml -n ds_env_v10

# Step 2: Install patched pyhgf fork editably (bypasses pip resolver entirely)
conda run -n ds_env_v10 pip install -e /path/to/pyhgf-fork
```

The fork should be placed in the repo at `vendor/pyhgf/` or referenced as a git submodule.
Plan 27-02 must decide the fork location and document it.

---

## Environment used

**Host:** Local Windows 11 Enterprise (10.0.22631) development machine.
**Python (base):** 3.12.10 (miniforge3 base env)
**Python (probe envs):** 3.11 (fresh mamba-created envs per cell)
**mamba:** 2.1.1
**conda:** 25.7.0
**Probe envs created:** `probe_jax_{0.7.0,0.9.0,0.10.0}_pyhgf{0.2.8,0.2.11}` (6 total)

The probe was run locally, not on M3 cluster. No GPU or CUDA was required (probe is
import-only, no computation).

---

## Risks not addressed

1. **Fork maintenance burden.** pyhgf 0.2.8-fork creates a private dependency. If pyhgf 0.3.0
   ships with a lifted JAX pin and native JAX 0.9+ compatibility, the fork should be retired and
   replaced with `pip install pyhgf>=0.3.0`. Monitor PyPI for pyhgf 0.3.x (checked: not
   published as of 2026-05-04).

2. **pyhgf 0.2.11 `NetworkState`/`LayerState`/`LayerParams` new types.** These were added in
   0.2.11 and are not present in 0.2.8. If any downstream code in this repo or `dcm_hgf_mixed_
   models` uses `LayerState`, the 0.2.8 fork will break. Review before finalizing fork base
   (currently using 0.2.8 — no `LayerState` usage found in project codebase as of this plan).

3. **PyMC at JAX 0.9/0.10.** PyMC 5.25.x was not probed in this matrix. The Phase 12 legacy path
   uses PyMC. Risk is LOW (PyMC's own CI tests against JAX 0.9), but unverified here. Flag for
   plan 27-02 smoke test.

4. **`jaxlib.xla_extension` in other pyhgf internals.** Only `typing.py` was inspected. Plan
   27-02 should search the entire pyhgf 0.2.8 source for `jaxlib.xla_extension` before declaring
   the fork fix complete:
   ```bash
   grep -r "jaxlib.xla_extension" vendor/pyhgf/
   ```

5. **Windows-specific jax/jaxlib behavior.** The probe was run on Windows. jaxlib CPU-only on
   Windows may have different `xla_extension` exposure than Linux. The M3 cluster (Linux) may
   exhibit different behavior. Re-run the probe on M3 if there is any doubt — though the
   `grep -r "jaxlib.xla_extension"` fix approach is source-level and platform-independent.
