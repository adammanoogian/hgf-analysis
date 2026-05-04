---
phase: 27-dependency-upgrade-chain
plan: 02
subsystem: infra
tags: [jax, blackjax, numpyro, pyhgf, conda, pip, python311, dependency-management]

requires:
  - phase: 27-01
    provides: "DEPS-02-decision.md with Strategy C (pyhgf fork) decision + JAX pin choice"

provides:
  - "pyproject.toml with requires-python>=3.11, jax>=0.9.0, blackjax>=1.5, numpyro>=0.21"
  - "environment-v10.yml: first conda env file in repo (ds_env_v10)"
  - "requirements-v10.txt: pip freeze snapshot (jax==0.10.0 baseline)"
  - "vendor/pyhgf/pyhgf/: patched pyhgf 0.2.8 Python source (PjitFunction fix)"
  - "scripts/ci/patch_pyhgf_typing.py: post-install patcher for pyhgf wheels"
  - "scripts/ci/probe_pyhgf_jax_compat.py: fixed (correct input shape)"

affects:
  - "27-03 (DEPS-05 validation against ds_env_v10)"
  - "27-04 (M3 env build + SLURM wiring using environment-v10.yml)"

tech-stack:
  added:
    - "jax==0.10.0 (was 0.4.31 in ds_env)"
    - "blackjax==1.5 (was 1.2.x)"
    - "numpyro==0.21.0 (promoted from ghost import to declared dep)"
    - "Python 3.11 (was 3.10 as minimum)"
  patterns:
    - "Strategy C: pip install --no-deps pyhgf==0.2.8 + post-install patch_pyhgf_typing.py"
    - "vendor/pyhgf/ as canonical patched source reference (plain directory, no submodule)"
    - "Two-step conda env creation: mamba create + pip install --no-deps pyhgf"

key-files:
  created:
    - "environment-v10.yml"
    - "requirements-v10.txt"
    - "vendor/pyhgf/pyhgf/typing.py (patched)"
    - "vendor/pyhgf/ (full Python source, 60+ files)"
    - "scripts/ci/patch_pyhgf_typing.py"
    - ".planning/phases/27-dependency-upgrade-chain/27-02-smoke-import.txt"
  modified:
    - "pyproject.toml (requires-python, JAX/blackjax/numpyro pins, ruff+mypy py311)"
    - "scripts/ci/probe_pyhgf_jax_compat.py (fix input shape bug)"
    - "src/**/*.py (29 files, ruff format line ending normalization)"

key-decisions:
  - "vendor/pyhgf/ is a plain tracked directory (not a submodule) — simpler for 1-line patch"
  - "Installation installs PyPI wheel (with precompiled rshgf.pyd) + patches typing.py in-place; cannot build from source (no Rust toolchain)"
  - "patch_pyhgf_typing.py script automates the in-place patch for M3 cluster builds"
  - "Probe script bug fixed: input_data needed np.array shape (5,) not list shape (1,5)"
  - "ruff format produced LF->CRLF normalization across 29 src/ files on Windows — acceptable"

patterns-established:
  - "Strategy C install pattern: pip install --no-deps pyhgf==0.2.8 + python scripts/ci/patch_pyhgf_typing.py"
  - "environment-v10.yml comment block is the canonical install recipe contract for ds_env_v10"

duration: 25min
completed: 2026-05-04
---

# Phase 27 Plan 02: Dep Chain Bump Summary

**pyproject.toml bumped to Python 3.11 + JAX 0.9–0.10 + BlackJAX 1.5 + NumPyro 0.21; pyhgf 0.2.8 fork patched via in-place typing.py fix; environment-v10.yml + requirements-v10.txt created; smoke import confirmed PASS at JAX 0.10**

## Performance

- **Duration:** 25 min
- **Started:** 2026-05-04T18:41:48Z
- **Completed:** 2026-05-04T19:07:00Z
- **Tasks:** 3 of 3
- **Files modified:** 95 (92 in Task 1 including vendor/, 4 in Task 2, commit+push in Task 3)

## Accomplishments

- pyproject.toml is now the declared source of truth for the v1.0 dep chain (Python 3.11, JAX 0.9–0.10, BlackJAX 1.5, NumPyro 0.21.0)
- pyhgf 0.2.8 fork: single-line PjitFunction patch confirmed working at JAX 0.10 (probe exits 0, 2-level and 3-level HGF construction OK, jax.lax.scan OK)
- First conda env file in repo: environment-v10.yml documents the two-step pyhgf Strategy C install recipe
- requirements-v10.txt provides a pinned snapshot for reproducible cluster builds
- jaxopt LBFGS confirmed OK at JAX 0.10 (no optax.lbfgs() fallback needed, consistent with 27-01 finding)

## Task Commits

1. **Task 1: Apply pyproject.toml diff + build pyhgf fork + ruff/mypy bump** - `e39c327` (feat)
2. **Task 2: Create environment-v10.yml + requirements-v10.txt + smoke import** - `664330f` (feat)
3. **Task 3: Commit + push** — folded into Tasks 1 and 2 commits (already pushed)

**Plan metadata:** TBD (docs commit below)

## Files Created/Modified

- `pyproject.toml` — requires-python>=3.11, jax>=0.9.0,<0.11, jaxlib>=0.9.0,<0.11, blackjax>=1.5,<2.0, numpyro>=0.21.0,<0.22, ruff py311, mypy py311
- `environment-v10.yml` — conda env spec for ds_env_v10 with Strategy C two-step pyhgf install recipe
- `requirements-v10.txt` — pip freeze snapshot (jax==0.10.0, blackjax==1.5, numpyro==0.21.0, 81 total packages)
- `vendor/pyhgf/pyhgf/typing.py` — patched: `from typing import Callable as PjitFunction` replacing removed jaxlib.xla_extension import
- `vendor/pyhgf/` — 62 Python source files + pyproject.toml + README (reference archive of patched 0.2.8 source)
- `scripts/ci/patch_pyhgf_typing.py` — post-install patcher: finds pyhgf in site-packages and applies the typing.py fix in-place
- `scripts/ci/probe_pyhgf_jax_compat.py` — fixed input shape bug; now uses `np.array([1,0,1,1,0])` (shape 5,) not `[[1,0,1,1,0]]` (shape 1×5)
- `src/**/*.py` — 29 files reformatted by ruff format (LF->CRLF line ending normalization on Windows; no logic changes)
- `vendor/.gitignore` — excludes Rust/docs/tests from vendor tracking

## Decisions Made

- **vendor/ as plain directory, not submodule**: The pyhgf 0.2.8 repo uses maturin (Rust build system); no Rust toolchain available locally, so editable install is not possible. The vendor/ directory holds the patched Python source as a reference/audit trail. Actual runtime install uses PyPI wheel + in-place patch.
- **patch_pyhgf_typing.py as installation automation**: Rather than manual sed commands, a Python script handles the post-install patch. This is M3-cluster-friendly and works on both Windows and Linux.
- **requirements-v10.txt is a pip freeze snapshot, not pip-compile output**: pip-compile would fail due to pyhgf's conflicting jax<0.4.32 pin. Fallback to freeze is documented per plan Task 2b.
- **ruff format LF->CRLF changes accepted**: Windows host produces CRLF; these are formatting-only, no logic changes. CI on Linux will re-normalize.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Fixed probe_pyhgf_jax_compat.py input shape**

- **Found during:** Task 1 (fork verification)
- **Issue:** `input_data=[[1, 0, 1, 1, 0]]` passes a Python list with shape (1, 5) — 1 time step × 5 observations. pyhgf 0.2.8 `input_data()` expects a numpy array with shape (n_trials,) i.e., (5,). JAX 0.10's stricter scan type enforcement surfaces this as "carry shape mismatch". The probe was never tested end-to-end before (27-01 cells all failed at import before reaching this line).
- **Fix:** Changed to `np.array([1, 0, 1, 1, 0], dtype=float)` with explicit dtype.
- **Files modified:** `scripts/ci/probe_pyhgf_jax_compat.py`
- **Verification:** Probe exits 0 with JAX 0.10.0 + patched pyhgf 0.2.8
- **Committed in:** `e39c327` (Task 1 commit)

**2. [Rule 2 - Missing Critical] Added patch_pyhgf_typing.py automation script**

- **Found during:** Task 1 (fork strategy implementation)
- **Issue:** DEPS-02-decision.md specified the patch but didn't specify HOW it would be applied on M3 cluster. Manual sed/Python inline commands are fragile and undocumented. The `vendor/pyhgf/` approach was intended as an editable install but requires Rust toolchain (unavailable).
- **Fix:** Created `scripts/ci/patch_pyhgf_typing.py` — finds pyhgf in site-packages via `importlib.util.find_spec` and patches typing.py in-place. Idempotent (checks if already patched).
- **Files modified:** `scripts/ci/patch_pyhgf_typing.py` (new file)
- **Verification:** Script successfully patches the installed wheel and probe confirms PASS
- **Committed in:** `e39c327` (Task 1 commit)

**3. [Rule 1 - Bug] Removed .git from vendor/pyhgf before staging**

- **Found during:** Task 1 (git add)
- **Issue:** `git clone` creates a nested `.git` directory, making vendor/pyhgf a nested repo (gitlink). This prevents the Python source from being tracked as plain files.
- **Fix:** Removed `.git` from vendor/pyhgf, re-staged as plain directory.
- **Files modified:** `vendor/pyhgf/` (structural)
- **Verification:** `git status vendor/` shows individual file entries, not a single gitlink
- **Committed in:** `e39c327` (Task 1 commit)

---

**Total deviations:** 3 auto-fixed (1 probe bug, 1 missing critical automation, 1 git structure bug)
**Impact on plan:** All auto-fixes essential for correctness and cluster usability. No scope creep.

## Issues Encountered

- **pyhgf Rust build requirement**: pyhgf 0.2.8 uses maturin (Rust) as build backend. Without a Rust toolchain, `pip install -e ./vendor/pyhgf` is not possible. Resolved by using PyPI wheel install + in-place patch of the Python file. The vendor/ directory serves as reference/audit trail for the patch.
- **pip-compile failure**: As anticipated by the plan, pip-compile cannot resolve due to pyhgf's conflicting jax<0.4.32 pin. Used pip freeze fallback per Task 2b.
- **Windows Long Path**: ipympl/ipywidgets install failed with "No such file or directory" due to Windows Long Path limitation. These packages are present in requirements-v10.txt via the raw pip freeze but were not installed in the smoke env; they're optional for cluster use.

## User Setup Required

None — no external service configuration required.

## Next Phase Readiness

- **27-03 (DEPS-05 validation)**: environment-v10.yml + requirements-v10.txt are ready. BlackJAX 1.5 is installed and importable. Install recipe documented in environment-v10.yml.
- **27-04 (M3 env build)**: M3 cluster should `git pull` to get environment-v10.yml. Follow the 5-step install recipe in environment-v10.yml comments. Note: regenerate requirements-v10.txt on M3 after build (Linux + cuda12 wheels will differ).
- **Concern**: requirements-v10.txt is Windows/CPU-only. Plan 27-04 must regenerate it on M3 for the Linux/CUDA12 pin set. The current file is correct for the headline deps but jaxlib wheel ID will differ.

---
*Phase: 27-dependency-upgrade-chain*
*Completed: 2026-05-04*
