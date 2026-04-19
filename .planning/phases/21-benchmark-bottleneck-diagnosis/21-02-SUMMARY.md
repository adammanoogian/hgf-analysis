---
phase: 21-benchmark-bottleneck-diagnosis
plan: "02"
subsystem: diagnostic-infra
tags: [jax, xla, jit, blackjax, benchmark, argparse, harness, pat-rl, vb-laplace]

# Dependency graph
requires:
  - phase: 14-benchmark-bottleneck-diagnosis-precursor
    provides: _run_benchmark in scripts/08_run_power_iteration.py
  - phase: 17-blackjax-nuts
    provides: fit_batch_hierarchical warmup_params kwarg (adapted-params return tuple)
  - phase: 18-pat-rl-task-adaptation
    provides: fit_batch_hierarchical_patrl + simulate_patrl_cohort
  - phase: 19-vb-laplace-probe-foundation
    provides: fit_vb_laplace_patrl full-pipeline entry point
provides:
  - Re-instrumented _run_benchmark with JAX_LOG_COMPILES + cache-stats parity + warmup_params on warm call
  - New --p-scan and --vb-laplace-probe + companion diagnostic CLI flags
  - _run_p_scan_probe helper writing jit_scaling_sweep.csv (7-column schema)
  - _run_vb_laplace_probe + _run_vb_laplace_subproc_one_shot writing vb_laplace_vs_nuts_jit.json (5-key schema)
  - tests/test_bench_harness_diagnostics.py (7 CPU-only tests locking schemas + argparse)
affects:
  - 21-03-cache-forensics
  - 21-04-vb-laplace-cluster-probe
  - 21-05-p-scan-cluster-sweep
  - 21-07-verdict

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Diagnostic-mode gate on JAX_LOG_COMPILES env var + jax_explain_cache_misses"
    - "Cache-stats delta tracking (before / after cold / after warm) for cache-miss forensics"
    - "Subprocess spawn via sys.executable __file__ for next-proc persistent-cache wall-clock measurement"
    - "CSV append-with-header-if-missing pattern for SLURM-dependency-chain CSV writers"
    - "In-process JAX logger capture via StringIO handler on logging.getLogger('jax')"
    - "Locked JSON schema with bottleneck_layer enum + undetermined default for 21-07 fill-in"

key-files:
  created:
    - tests/test_bench_harness_diagnostics.py
    - .planning/phases/21-benchmark-bottleneck-diagnosis/21-02-SUMMARY.md
  modified:
    - scripts/08_run_power_iteration.py

key-decisions:
  - "Patch C (warmup_params on warm call) landed because fit_batch_hierarchical already accepts warmup_params (signature verified at src/prl_hgf/fitting/hierarchical.py:2012). No production-code change needed; no Wave-2 blocker."
  - "_run_benchmark JAX_LOG_COMPILES instrumentation is gated behind --diagnostic-mode (or externally-set JAX_LOG_COMPILES=1) so production --benchmark calls without the flag have unchanged HLO — backwards-compatible by construction."
  - "Probe dispatch short-circuits BEFORE load_power_config + chunk/grid setup in main() so --p-scan/--vb-laplace-probe do not require --chunk-id/--job-id from CLI; SLURM scripts can dispatch probes without grid context."
  - "--vb-laplace-subproc-only subprocess spawn passes sentinel --chunk-id 0 --job-id vb-laplace-subproc to satisfy argparse required=True without changing the required-flag semantics for production callers."
  - "B4 rename landed: per_stage_compile_events (counts) + per_call_wall_clock (timings) replace the originally-proposed per_stage_compile_times field. JAX_LOG_COMPILES emits event counts, not timings; full-pipeline wall-clock is the timing signal available since CONTEXT forbids harness-splitting."
  - "I4 non-vacuous status round-trip: test_pscan_status_written_value_matches_enum writes status='early_stopped' to a tmp_path CSV and reads it back via pd.read_csv, asserting the value matches the locked 3-value enum. Replaces the previously-vacuous string-equals-itself test."
  - "M2 named constants: n_chains=2, n_draws=10, n_total_draws=n_chains*n_draws at top of _run_p_scan_probe drive both fit kwargs and draws_per_s computation; no hardcoded 2*10."

patterns-established:
  - "Diagnostic-mode argparse gate pattern: `if getattr(args, 'diagnostic_mode', False) or os.environ.get('JAX_LOG_COMPILES') == '1':` — ensures SLURM-env-injected JAX_LOG_COMPILES still activates in production-default --benchmark runs without --diagnostic-mode"
  - "Phase 21 diagnostic CSV/JSON artifacts live under .planning/phases/21-benchmark-bottleneck-diagnosis/, NOT results/power/ (14.1-03 owns the production benchmark_batched.json path)"
  - "Probe-helper signature parity: all three probe helpers (_run_p_scan_probe, _run_vb_laplace_probe, _run_vb_laplace_subproc_one_shot) accept (base_config, power_config, output_dir, P, args) so the main() dispatch table stays uniform even though probes don't use base_config/power_config/output_dir"

# Metrics
duration: 20min
completed: 2026-04-19
---

# Phase 21 Plan 02: Harness Instrumentation Summary

**Re-instrumented `_run_benchmark` with JAX_LOG_COMPILES + cache-stats parity + warmup_params-on-warm fix, plus two new diagnostic CLI entry points (`--p-scan`, `--vb-laplace-probe`) writing locked CSV/JSON schemas that Waves 2-3 SLURM jobs will consume.**

## Performance

- **Duration:** ~20 min
- **Started:** 2026-04-19 (Wave 1 local desk work)
- **Completed:** 2026-04-19
- **Tasks:** 2 (both auto, no checkpoints)
- **Files modified:** 1 (`scripts/08_run_power_iteration.py`)
- **Files created:** 2 (`tests/test_bench_harness_diagnostics.py`, this SUMMARY)

## Accomplishments

1. **`_run_benchmark` re-instrumented** with three surgical patches:
   - **Patch A** (diagnostic-mode gated): `JAX_LOG_COMPILES=1` + `jax.config.update("jax_explain_cache_misses", True)` at top of `_run_benchmark` when `--diagnostic-mode` is set OR `JAX_LOG_COMPILES=1` is pre-set in the environment. Production-default `--benchmark` unchanged.
   - **Patch B** (always-on additive): `_get_cache_stats` called before cold, after cold, AND after warm. New JSON fields: `cache_delta_cold_n_files`, `cache_delta_cold_mb`, `cache_delta_warm_n_files`, `cache_delta_warm_mb`. Parity with `_run_smoke_test` (lines 758-793) achieved.
   - **Patch C** (always-on): cold call captures `(idata, adapted_params)` tuple; warm call passes `warmup_params=adapted_params`. Eliminates the ~1100s NUTS window-adaptation duplication that confounded job-54899271's 1.1x speedup observation.

2. **Two new diagnostic entry points + three companion flags** wired through argparse:
   - `--p-scan P` → `_run_p_scan_probe` → appends one row to `jit_scaling_sweep.csv` at specified P (PAT-RL hgf_3level, model_a, 2 chains, 10 draws, 10 tune).
   - `--vb-laplace-probe --probe-p P` → `_run_vb_laplace_probe` → writes/appends `vb_laplace_vs_nuts_jit.json` slice for this P (cold + warm in-process + subprocess-spawned next-proc wall-clock + JAX_LOG_COMPILES event counts).
   - `--vb-laplace-subproc-only` (internal) → `_run_vb_laplace_subproc_one_shot` → runs ONE `fit_vb_laplace_patrl` call and exits; used by `_run_vb_laplace_probe` to measure next-proc persistent-cache wall-clock.
   - `--p-scan-early-stop` → marks CSV row status as `early_stopped` (for SLURM dependency-chain early termination).
   - `--diagnostic-mode` → gates Patch A in `_run_benchmark`.

3. **7 unit tests landed** (`tests/test_bench_harness_diagnostics.py`), all passing in ~22s CPU locally:
   - `test_pscan_flag_parses` — argparse accepts `--p-scan 5`.
   - `test_vb_laplace_probe_flag_parses` — argparse accepts `--vb-laplace-probe --probe-p 5`.
   - `test_diagnostic_mode_flag_parses` — argparse accepts `--diagnostic-mode`.
   - `test_csv_writer_schema` — 7-column CSV schema locks.
   - `test_json_writer_schema` — 5-key JSON schema + `bottleneck_layer` enum lock.
   - `test_pscan_status_written_value_matches_enum` — non-vacuous status round-trip (I4 replacement).
   - `test_probe_helpers_are_importable` — `_run_p_scan_probe`, `_run_vb_laplace_probe`, `_run_vb_laplace_subproc_one_shot` exist at module scope (SLURM contract).

## Task Commits

1. **Task 1: Patch `_run_benchmark` with JAX_LOG_COMPILES + cache stats + warmup_params** — `6fea454` (feat)
2. **Task 2: Add `--p-scan` and `--vb-laplace-probe` helpers + CLI flags + tests** — `9dac21d` (feat)

**Plan metadata commit:** forthcoming (docs).

## Files Created/Modified

- `scripts/08_run_power_iteration.py` — Re-instrumented `_run_benchmark` (Patches A/B/C); added 6 new argparse flags; added `_run_p_scan_probe`, `_run_vb_laplace_probe`, `_run_vb_laplace_subproc_one_shot` helpers; added main() dispatch short-circuits with mutual-exclusion guards. **+858 lines / −4 lines**.
- `tests/test_bench_harness_diagnostics.py` — **NEW**. 7 CPU-only unit tests for argparse + CSV/JSON schema + status enum round-trip + helper importability.

## Decisions Made

All key decisions are captured in frontmatter `key-decisions`. Highlights:

- **Patch C landed, NOT blocked.** `fit_batch_hierarchical` already accepts `warmup_params` (signature at `src/prl_hgf/fitting/hierarchical.py:2012`) and returns `(idata, adapted_params)` when `warmup_params is None`. The warm call now gets `warmup_params=adapted_params` from the cold return tuple. Surfaces no production-code blocker for Wave 2.
- **B4 rename + sibling field** (plan-authorised). `per_stage_compile_events` (counts) + `per_call_wall_clock` (cold_s/warm_s/next_proc_s) replace the originally-proposed `per_stage_compile_times` field. The JSON schema is locked at 5 top-level keys; `bottleneck_verdict.bottleneck_layer` uses the 7-value enum (`logp_graph | lbfgs_loop | hessian_graph | nuts_kernel | cache_key | both | undetermined`), defaulting to `undetermined` until 21-07.
- **I4 non-vacuous status round-trip landed.** `test_pscan_status_written_value_matches_enum` writes `status='early_stopped'` to a tmp_path CSV, reads it back via `pd.read_csv`, and asserts the value is in the locked 3-value enum. Exercises schema contract, not string identity.
- **M2 named constants landed.** `n_chains`, `n_draws`, `n_tune`, `n_total_draws` are named at the top of `_run_p_scan_probe`; `draws_per_s = n_total_draws / same_proc_warm_s` references the same integer as the fit kwargs (no hardcoded `2 * 10`).
- **Probe dispatch short-circuits before grid/chunk setup.** Probes don't need `base_config`/`power_config` for their execution but the helper signatures accept them for main()-dispatch uniformity. This lets `--p-scan`/`--vb-laplace-probe` run without requiring the SBF grid to be computable.
- **Subprocess spawn sentinel args.** `_run_vb_laplace_probe` spawns `sys.executable __file__ --vb-laplace-subproc-only --probe-p P --chunk-id 0 --job-id vb-laplace-subproc` — the latter two satisfy argparse `required=True` without changing the flag's semantics for production callers. The subproc short-circuits on `args.vb_laplace_subproc_only` before chunk/grid logic.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] Removed duplicate `import os` inside `_run_benchmark`**

- **Found during:** Task 1, after applying Patch A.
- **Issue:** Patch A referenced `os.environ` at the top of `_run_benchmark`, relying on the module-level `import os` (line 30). However, the existing body of `_run_benchmark` had its own inner `import os` statement (line 949, pre-existing), which Python binds as a LOCAL `os` for the entire function scope. This triggered ruff F823 "Local variable `os` referenced before assignment" on the Patch A usage.
- **Fix:** Removed the redundant inner `import os` — `os` is already imported at module level and works correctly from `_run_benchmark`. One-line deletion; behaviour-neutral.
- **Files modified:** `scripts/08_run_power_iteration.py` (removed 2 lines: `import os` + blank line)
- **Verification:** `ruff check scripts/08_run_power_iteration.py` — no F823 error; 3 pre-existing F541 errors remain (in `_run_smoke_test`, out of scope for this plan).
- **Commit:** rolled into `9dac21d` (Task 2 commit, alongside the main probe additions — the inner import was exposed by ruff once the new helpers were added and linted).

**2. [Rule 3 - Blocking] Removed unused `pytest` import from test file**

- **Found during:** Task 2, post-ruff check.
- **Issue:** Initial test file drafted with `import pytest` at top (expected to use `pytest.MonkeyPatch` type annotation) but the final test uses pure `tmp_path` + `pd.read_csv` pattern — `pytest` became unused. Ruff F401 flagged it.
- **Fix:** Removed the `import pytest` line. The tests still use pytest fixtures (`tmp_path`) via duck-typing.
- **Files modified:** `tests/test_bench_harness_diagnostics.py` (removed 1 line)
- **Verification:** All 7 tests still pass (`pytest tests/test_bench_harness_diagnostics.py -v` → 7 passed in 22s).
- **Commit:** rolled into `9dac21d`.

**3. [Rule 2 - Missing Critical] Added `test_probe_helpers_are_importable` unit test**

- **Found during:** Task 2, after drafting the 5 core tests listed in the plan.
- **Issue:** Plan listed 5 unit tests; none validated that the three new probe helper functions actually exist at module scope. Waves 2-3 SLURM scripts will call these helpers via `sys.executable __file__ --p-scan N` / `--vb-laplace-probe --probe-p N`. If a future refactor accidentally renames or removes a helper, SLURM jobs would silently no-op (argparse accepts the flag, dispatch branch runs no-op).
- **Fix:** Added `test_probe_helpers_are_importable` that uses `importlib.util` to import the script module and asserts `hasattr(mod, "_run_p_scan_probe")`, `hasattr(mod, "_run_vb_laplace_probe")`, `hasattr(mod, "_run_vb_laplace_subproc_one_shot")`.
- **Files modified:** `tests/test_bench_harness_diagnostics.py` (+15 lines)
- **Verification:** 7th test passes in ~5.6s CPU.
- **Commit:** rolled into `9dac21d`.

### Plan-API correction

**4. [Rule 1 - Bug] Used `load_pat_rl_config()` (not `PATRLConfig.load()`) and `simulate_patrl_cohort(n_participants=...)` (not `n_per_phenotype=...`)**

- **Found during:** Task 2, when drafting probe helpers.
- **Issue:** Plan text referenced `PATRLConfig.load("configs/pat_rl.yaml")` and `simulate_patrl_cohort(n_per_phenotype=max(1, P // 4), ...)`. Reading the actual API surfaces revealed: (a) the loader is a module-level function `load_pat_rl_config()`, not a classmethod; (b) `simulate_patrl_cohort` takes `n_participants` (per-phenotype count), not `n_per_phenotype`. The user-provided constraint #7 explicitly told me to read `fit_vb_laplace_patrl` before writing the probe; extending the same principle to `simulate_patrl_cohort` and the config loader.
- **Fix:** Probes use the real API:
  ```python
  from prl_hgf.env.pat_rl_config import load_pat_rl_config
  patrl_config = load_pat_rl_config()
  sim_df, _true_params, _trials = simulate_patrl_cohort(
      n_participants=max(1, P // 4),
      config=patrl_config,
      master_seed=99999,
  )
  ```
- **Files modified:** `scripts/08_run_power_iteration.py` (3 probe helper bodies).
- **Verification:** All 7 tests pass; `test_probe_helpers_are_importable` executes the full module body (imports at module scope of the script) without ImportError.
- **Commit:** rolled into `9dac21d`.

**5. [Rule 1 - Bug] Removed `progressbar=False` from `fit_batch_hierarchical_patrl` calls**

- **Found during:** Task 2, when writing `_run_p_scan_probe`.
- **Issue:** Plan text suggested `fit_batch_hierarchical_patrl(..., progressbar=False, ...)`. Reading the real signature (`src/prl_hgf/fitting/hierarchical_patrl.py:1168`) shows `fit_batch_hierarchical_patrl` does NOT accept `progressbar`. This is a PAT-RL-specific divergence from `fit_batch_hierarchical`.
- **Fix:** Probe calls omit `progressbar`. `fit_batch_hierarchical_patrl` does not emit a progress bar by default.
- **Files modified:** `scripts/08_run_power_iteration.py` (two fit calls in `_run_p_scan_probe`).
- **Verification:** Probe path compiles (`ast.parse` passes); helper is importable (`test_probe_helpers_are_importable`).
- **Commit:** rolled into `9dac21d`.

---

**Total deviations:** 5 auto-fixed (2 blocking, 1 missing critical, 2 API-correction bugs).
**Impact on plan:** All auto-fixes necessary for correctness and for satisfying the user's stated constraint #7 ("read the function before writing the probe"). Zero scope creep; zero production-code changes; zero checkpoint needed.

## Issues Encountered

None. The plan's only open structural question (does `fit_batch_hierarchical` accept `warmup_params`?) resolved cleanly in favour of landing Patch C without a Wave-2 blocker.

Wave 2 submissions can invoke the following SLURM lines verbatim once the cluster environment has `blackjax` installed:

```bash
# --p-scan sweep (plan 21-05):
python scripts/08_run_power_iteration.py --p-scan 5  --diagnostic-mode --chunk-id 0 --job-id $SLURM_JOB_ID
python scripts/08_run_power_iteration.py --p-scan 20 --diagnostic-mode --chunk-id 0 --job-id $SLURM_JOB_ID
python scripts/08_run_power_iteration.py --p-scan 50 --diagnostic-mode --chunk-id 0 --job-id $SLURM_JOB_ID

# --vb-laplace-probe (plan 21-03):
python scripts/08_run_power_iteration.py --vb-laplace-probe --probe-p 5  --diagnostic-mode --chunk-id 0 --job-id $SLURM_JOB_ID
python scripts/08_run_power_iteration.py --vb-laplace-probe --probe-p 20 --diagnostic-mode --chunk-id 0 --job-id $SLURM_JOB_ID
```

CSV + JSON artifacts land under `.planning/phases/21-benchmark-bottleneck-diagnosis/`; 21-07 reads them without ambiguity (schemas locked by 7 passing unit tests).

## User Setup Required

None — no new external services, no new environment variables. The `blackjax` cluster-only requirement is pre-existing from Phase 17/18.

## Next Phase Readiness

**Ready for Wave 2 submissions.**

- **Plan 21-03 (VB-Laplace cluster probe)**: harness supports `--vb-laplace-probe --probe-p N` with subprocess spawn for next-proc wall-clock. JSON schema locked; output path is `.planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_vs_nuts_jit.json`.
- **Plan 21-04 (NUTS JIT breakdown cluster probe)**: can parse the JAX_LOG_COMPILES output format established in `_run_vb_laplace_probe` for consistency; will need to extend the `n_lbfgs_events` / `n_hessian_events` keyword lists with `_sample_loop` / `_leapfrog` / `kernel_step` for NUTS-specific events.
- **Plan 21-05 (P-sweep cluster submission chain)**: harness supports `--p-scan N` and `--p-scan-early-stop`; CSV schema locked; output path is `.planning/phases/21-benchmark-bottleneck-diagnosis/jit_scaling_sweep.csv`. SLURM dependency chain can early-stop subsequent P values by passing `--p-scan-early-stop`.
- **Plan 21-06 (cache forensics cluster run)**: can use the re-instrumented `_run_benchmark` with `--diagnostic-mode --benchmark` to capture cache-delta fields + JAX_LOG_COMPILES log in a single full-cohort job; no additional harness work needed for this plan.
- **Plan 21-07 (VERDICT synthesis)**: reads the locked 5-key JSON + 7-column CSV; fills in `bottleneck_verdict.bottleneck_layer` + `hlo_op_counts` slots that this plan intentionally left `undetermined` / empty.

**Not blocked by:** anything. No Wave-2 planning blocker surfaced.

---
*Phase: 21-benchmark-bottleneck-diagnosis*
*Completed: 2026-04-19*
