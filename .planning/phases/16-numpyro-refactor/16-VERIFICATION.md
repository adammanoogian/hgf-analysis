---
phase: 16-numpyro-refactor
verified: 2026-04-13T23:32:32Z
status: passed
score: 6/6 must-haves verified
re_verification: false
---

# Phase 16: NumPyro Refactor Verification Report

**Phase Goal:** Replace PyMC pmjax.sample_numpyro_nuts() with direct numpyro MCMC, enabling JIT cache reuse (data as traced arguments, not closure constants). Fix CUDA driver/PTX mismatch. Validate with JIT timing baselines and CUDA environment check.

**Verified:** 2026-04-13T23:32:32Z
**Status:** PASSED
**Re-verification:** No - initial verification

---

## Goal Achievement

### Observable Truths

| # | Truth | Status | Evidence |
|---|-------|--------|----------|
| 1 | fit_batch_hierarchical uses numpyro MCMC directly | VERIFIED | Function at line 1092: imports MCMC, NUTS from numpyro.infer; no pm.Model or pmjax calls in function body; pm.Model at line 986 is inside deprecated build_pymc_model_batched only |
| 2 | Data passed as args to MCMC.run() for JIT cache reuse | VERIFIED | mcmc.run(rng_key, input_data=..., observed=..., choices=..., trial_mask=..., n_participants=..., batched_logp_fn=...) at lines 1267-1275; build_logp_fn_batched captures only static model structure in closure |
| 3 | CUDA environment check in SLURM GPU scripts | VERIFIED | check_cuda_compat function present in both cluster/08_power_sweep.slurm and cluster/14_benchmark_gpu.slurm; bash syntax passes; mismatch message references requirements-gpu.txt as fix |
| 4 | nvidia-cuda-nvcc-cu12 pinned to 12.8.x in requirements-gpu.txt | VERIFIED | File exists; contains nvidia-cuda-nvcc-cu12==12.8.93 and nvidia-nvjitlink-cu12==12.8.93 |
| 5 | VALID-01/02/03 tests compatible with numpyro-direct path | VERIFIED (structural) | VALID-01 uses build_logp_ops_batched (backward-compat); VALID-02 restructured to convergence quality test; VALID-03 fit_batch_hierarchical call has no sampler= kwarg |
| 6 | Benchmark smoke test logs JIT cold/warm times | VERIFIED | scripts/08_run_power_iteration.py lines 363-393: two timed calls with time.perf_counter(), jit_cold_s and jit_warm_s stored to results dict; cache speedup ratio printed |

**Score:** 6/6 truths verified

---

### Required Artifacts

| Artifact | Status | Details |
|----------|--------|---------|
| src/prl_hgf/fitting/hierarchical.py | VERIFIED | 1303 lines; build_logp_fn_batched at 591, _numpyro_model_3level at 762, _numpyro_model_2level at 834, fit_batch_hierarchical at 1092; numpyro.factor at lines 831/889; az.from_numpyro at 1283; build_pymc_model_batched kept with DeprecationWarning at line 955 |
| src/prl_hgf/fitting/__init__.py | VERIFIED | 63 lines; build_logp_fn_batched in import at line 29 and __all__ at line 59; docstring updated at line 16 |
| src/prl_hgf/power/iteration.py | VERIFIED | 1021 lines; v1.2 batched path at lines 915-936 calls fit_batch_hierarchical with no sampler=; legacy path at lines 369-404 passes sampler= to fit_batch (different legacy function - correct) |
| scripts/08_run_power_iteration.py | VERIFIED | 614 lines; jit_cold_s/jit_warm_s fields at lines 375/390; results[sampler] = numpyro-direct at line 458 |
| cluster/08_power_sweep.slurm | VERIFIED | check_cuda_compat at lines 58-86; called at line 94; bash syntax OK |
| cluster/14_benchmark_gpu.slurm | VERIFIED | check_cuda_compat at lines 49-77; called at line 85; bash syntax OK |
| cluster/requirements-gpu.txt | VERIFIED | 5 lines; nvidia-cuda-nvcc-cu12==12.8.93 and nvidia-nvjitlink-cu12==12.8.93 at lines 4-5 |
| tests/test_hierarchical_logp.py | VERIFIED | 579 lines; test_build_logp_fn_batched_smoke at line 518; test_numpyro_model_importable at line 563; VALID-02 convergence test at line 364 |
| validation/valid03_cross_platform.py | VERIFIED | 443 lines; fit_batch_hierarchical call at line 131 has no sampler=; grep confirms zero matches |

---

### Key Link Verification

| From | To | Via | Status |
|------|----|-----|--------|
| _numpyro_model_3level | batched_logp_fn | numpyro.factor(hgf_loglike, logp) at line 831 | WIRED |
| _numpyro_model_2level | batched_logp_fn | numpyro.factor(hgf_loglike, logp) at line 889 | WIRED |
| fit_batch_hierarchical | numpyro.infer.MCMC | NUTS(model_fn) + MCMC(chain_method=vectorized) + mcmc.run(rng_key, data_kwargs) at lines 1258-1275 | WIRED |
| fit_batch_hierarchical | arviz.from_numpyro | az.from_numpyro(mcmc, dims=..., coords=...) at lines 1283-1293 with group/session metadata | WIRED |
| cluster/08_power_sweep.slurm | nvidia-smi + ptxas | check_cuda_compat called at line 94 with non-fatal fallback | WIRED |
| cluster/14_benchmark_gpu.slurm | nvidia-smi + ptxas | check_cuda_compat called at line 85 with non-fatal fallback | WIRED |
| cluster/requirements-gpu.txt | SLURM scripts | pip install -r cluster/requirements-gpu.txt in comments and check_cuda_compat error message | WIRED |

---

### Requirements Coverage

| Requirement | Status | Notes |
|-------------|--------|-------|
| SC-1: fit_batch_hierarchical uses numpyro MCMC directly | SATISFIED | Confirmed; no PyMC model construction in hot path |
| SC-2: JIT cache reuse timing (second call < 5s) | STRUCTURALLY SATISFIED | Instrumentation present; actual timing requires GPU |
| SC-3: CUDA startup diagnostic in SLURM scripts | SATISFIED | check_cuda_compat in both GPU scripts |
| SC-4: nvidia-cuda-nvcc-cu12 pinned to 12.8.x | SATISFIED | requirements-gpu.txt has ==12.8.93 |
| SC-5: VALID-01/02/03 pass with numpyro-direct path | STRUCTURALLY SATISFIED | Code logic correct; runtime pass requires installed deps |
| SC-6: Benchmark logs JIT cold/warm times | SATISFIED | Both jit_cold_s and jit_warm_s in JSON output |

---

### Anti-Patterns Found

| File | Line | Pattern | Severity | Impact |
|------|------|---------|----------|--------|
| scripts/08_run_power_iteration.py | 21, 84, 562 | placeholder | Info | Intentional --dry-run mode feature; not an implementation stub |

No blocker or warning anti-patterns found.

---

### Human Verification Required

#### 1. JIT Cache Timing (SC-2)

**Test:** Run python scripts/08_run_power_iteration.py --mode benchmark on M3 GPU cluster.
**Expected:** jit_warm_s < 5 seconds vs jit_cold_s ~800 seconds; cache_speedup > 100x logged; both fields in output JSON.
**Why human:** JIT compilation timing requires GPU hardware and JAX/XLA environment.

#### 2. XLA Parallel Compilation (SC-4)

**Test:** After pip install -r cluster/requirements-gpu.txt, launch GPU SLURM job and inspect stdout log.
**Expected:** No disabling parallel compilation warning from XLA; check_cuda_compat reports OK.
**Why human:** Requires cluster GPU environment with CUDA driver.

#### 3. VALID-02 MCMC Convergence (SC-5)

**Test:** Run pytest tests/test_hierarchical_logp.py -v -m slow --timeout=900 with JAX, numpyro, pyhgf installed.
**Expected:** test_valid_02_batched_numpyro_convergence passes: Rhat < 1.10, posteriors finite, values in prior bounds.
**Why human:** Requires ~15 minutes MCMC sampling; cannot execute in verification context.

---

### Gaps Summary

No gaps. All 6 success criteria from the ROADMAP are structurally satisfied in the codebase. The three human verification items are runtime and hardware-dependent - they are not code gaps.

---

*Verified: 2026-04-13T23:32:32Z*
*Verifier: Claude (gsd-verifier)*
