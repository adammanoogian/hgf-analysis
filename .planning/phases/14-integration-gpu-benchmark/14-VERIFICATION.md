---
phase: 14-integration-gpu-benchmark
verified: 2026-04-12T00:00:00Z
status: gaps_found
score: 2/5 success criteria fully verified (3 require GPU cluster execution)
gaps:
  - truth: "08_run_power_iteration.py --benchmark produces results/power/benchmark_batched.json"
    status: failed
    reason: "Code correctly implemented but benchmark never executed on GPU node. results/power/benchmark_batched.json does not exist. Only results/power/benchmark.json (pre-Phase-14 schema) is present."
    artifacts:
      - path: "results/power/benchmark_batched.json"
        issue: "File does not exist. Only results/power/benchmark.json (old schema) is present."
    missing:
      - "Execute 08_run_power_iteration.py --benchmark on GPU cluster node"
  - truth: "Decision gate result appended to .planning/STATE.md Key Decisions table"
    status: failed
    reason: "STATE.md contains no Benchmark decision gate row. _update_state_md correctly implemented but never called because benchmark was never executed."
    artifacts:
      - path: ".planning/STATE.md"
        issue: "No Benchmark decision gate row in Key Decisions table."
    missing:
      - "Execute benchmark on GPU node so _update_state_md appends decision gate row"
human_verification:
  - test: "Run 08_run_power_iteration.py --benchmark on GPU cluster node"
    expected: "benchmark_batched.json created; STATE.md gains Benchmark decision gate row"
    why_human: "Requires real GPU node with CUDA and nvidia-smi"
  - test: "Run SLURM power sweep array twice with JAX_COMPILATION_CACHE_DIR set; compare JIT times across chunks"
    expected: "Second chunk shows < 5 s JIT time vs ~60 s cold"
    why_human: "Cross-process JAX cache persistence requires two separate SLURM job submissions"
  - test: "Run validation/valid03_cross_platform.py twice (CPU and GPU), then compare"
    expected: "compare_results returns True; all relative errors below 1%"
    why_human: "Requires GPU cluster node for the GPU invocation"
---

# Phase 14: Integration + GPU Benchmark Verification Report

**Phase Goal:** The new batched fit and JAX simulation are wired into run_sbf_iteration. A GPU benchmark job runs one full iteration (300 participant-sessions x 2 models) on a real GPU node, measures per-iteration wall time + VRAM + utilization, and drives a decision gate. Cross-platform consistency validated.

**Verified:** 2026-04-12
**Status:** GAPS FOUND
**Re-verification:** No (initial verification)

---

## Goal Achievement

### Observable Truths

| # | Truth | Status | Evidence |
|---|-------|--------|----------|| 1 | run_sbf_iteration defaults to fit_batch_hierarchical; --legacy flag preserved | VERIFIED | use_legacy=False default in signature (line 793); deferred import of fit_batch_hierarchical in else block (line 906); --legacy CLI flag (line 133); args.legacy passed to run_sbf_iteration (line 597) |
| 2 | Both paths call simulate_batch (JAX vmap internally since Phase 13) | VERIFIED | simulate_batch called unconditionally before if use_legacy branch (line 871); comment explicitly states Phase 13 design decision |
| 3 | --benchmark produces benchmark_batched.json with per-iteration time, peak VRAM, mean GPU utilization | FAILED | Code correctly implemented in _run_benchmark; results/power/benchmark_batched.json does not exist; only results/power/benchmark.json (old schema) is present |
| 4 | Decision gate applied and recorded in benchmark JSON AND STATE.md | FAILED | apply_decision_gate correctly implemented and exported in __all__; STATE.md has no Benchmark decision gate row; _update_state_md never invoked because benchmark was never executed |
| 5 | VALID-03: CPU/GPU posterior means agree within 1% relative error | HUMAN NEEDED | validation/valid03_cross_platform.py fully implemented with correct relative error formula; 4 unit tests pass on synthetic data; actual GPU run requires cluster |

**Score:** 2/5 fully verified; 1 human-needed; 2 failed (require GPU cluster execution to produce outputs)

---

### Required Artifacts

| Artifact | Expected | Status | Details |
|----------|----------|--------|---------|
| src/prl_hgf/power/iteration.py | run_sbf_iteration dual-path, _idata_to_fit_df, _split_idata, _build_idata_dict, apply_decision_gate | VERIFIED | 1019 lines; all 5 functions present; apply_decision_gate in __all__ (line 51); no stub patterns |
| scripts/08_run_power_iteration.py | --legacy flag, --benchmark flag, _GpuMonitor, _run_benchmark, _update_state_md | VERIFIED | 614 lines; all components present; _GpuMonitor background-threaded nvidia-smi class; _run_benchmark calls run_sbf_iteration(use_legacy=False) and apply_decision_gate |
| tests/test_power_iteration.py | VALID-05 legacy test, _idata_to_fit_df test, _split_idata test, decision gate tests, GPU monitor test | VERIFIED | 876 lines; 14 tests covering Phase 14 requirements |
| validation/valid03_cross_platform.py | run_fit_and_save, compare_results, CLI subcommands | VERIFIED | 434 lines; both functions fully implemented; correct relative error formula; run and compare subcommands present |
| tests/test_valid03.py | 4 tests for compare_results logic | VERIFIED | 127 lines; 4 tests covering identical, within-tolerance, exceeds-tolerance, near-zero edge cases |
| results/power/benchmark_batched.json | Benchmark output with Phase 14 schema | MISSING | File does not exist; results/power/benchmark.json (old pre-Phase-14 schema) exists but is irrelevant |
---

### Key Link Verification

| From | To | Via | Status | Details |
|------|----|-----|--------|---------|
| iteration.py run_sbf_iteration | fit_batch_hierarchical | deferred import in else block | WIRED | from prl_hgf.fitting.hierarchical import fit_batch_hierarchical at line 906; called at lines 911 and 924 |
| iteration.py run_sbf_iteration | fit_batch | module-level import | WIRED | from prl_hgf.fitting.batch import fit_batch at line 43; called in if use_legacy block |
| 08_run_power_iteration.py | run_sbf_iteration | _run_benchmark calls with use_legacy=False | WIRED | Line 406 in benchmark script |
| 08_run_power_iteration.py | apply_decision_gate | import and call in _run_benchmark | WIRED | Line 309 import; line 436 call |
| 08_run_power_iteration.py | results/power/benchmark_batched.json | json.dump in _run_benchmark | CODE WIRED NOT EXECUTED | Lines 461-463 correct; file never produced |
| _update_state_md | .planning/STATE.md | string search and row append | CODE WIRED NOT EXECUTED | Function correctly implemented at lines 209-270; never called on live STATE.md |
| validation/valid03_cross_platform.py | fit_batch_hierarchical | import inside run_fit_and_save | WIRED | Line 94 |
| tests/test_valid03.py | validation/valid03_cross_platform.compare_results | direct import | WIRED | Line 25 |

---

### Requirements Coverage

| Requirement | Status | Blocking Issue |
|-------------|--------|----------------|
| BENCH-01: Time full batched iteration, writes benchmark_batched.json | BLOCKED | benchmark_batched.json does not exist; code complete but requires GPU execution |
| BENCH-02: Decision gate formula per_iter_seconds x 600 / 3600 > 50 | CODE VERIFIED | Formula correctly implemented in apply_decision_gate; actual result requires benchmark execution |
| BENCH-03: run_sbf_iteration defaults to batched, --legacy preserves old path | VERIFIED | Fully implemented and tested |
| BENCH-04: nvidia-smi GPU utilization sampling | CODE VERIFIED | _GpuMonitor correctly implemented; requires GPU execution for real utilization samples |
| BENCH-05: JAX compilation cache warm vs cold | PARTIALLY VERIFIED | In-process two-call timing in _run_benchmark; JAX_COMPILATION_CACHE_DIR set in cluster/08_power_sweep.slurm line 56; cross-process disk persistence requires cluster execution |
| VALID-03: CPU/GPU posterior means within 1% relative error | HUMAN NEEDED | Script and tests implemented; requires GPU cluster run |
| VALID-05: Legacy path preservation via --legacy flag | VERIFIED | Tested in test_run_sbf_iteration_legacy_flag_calls_fit_batch |

---

### Anti-Patterns Found

No blocker anti-patterns. Two intentional noqa suppressions documented in SUMMARY: BLE001 on broad except in _GpuMonitor._run and PLC0415 on deferred import of fit_batch_hierarchical.

---

### Human Verification Required

**1. GPU Benchmark Execution (BENCH-01, BENCH-02, BENCH-04)**

**Test:** On M3 cluster GPU node: sbatch --export=BENCHMARK=1 cluster/08_power_sweep.slurm or python scripts/08_run_power_iteration.py --chunk-id 0 --job-id bench --benchmark

**Expected:** results/power/benchmark_batched.json created with per_iteration_s, peak_vram_mb, mean_gpu_util_pct, decision, gpu_hours_per_chunk, jit_cold_s, jit_warm_s fields; STATE.md Key Decisions table gains a Benchmark decision gate row.

**Why human:** Requires a real GPU node with CUDA-capable GPU and nvidia-smi binary.

**2. Cross-Chunk JAX Cache Persistence (BENCH-05)**

**Test:** Run power sweep array twice in sequence with JAX_COMPILATION_CACHE_DIR set; compare JIT times across consecutive SLURM array tasks.

**Expected:** Second chunk shows less than 5 s JIT time vs approximately 60 s cold, confirming JAX_COMPILATION_CACHE_DIR disk persistence.

**Why human:** Cross-process JAX cache persistence requires two separate SLURM job submissions. In-process warm JIT test in _run_benchmark proves only in-memory caching.

**3. VALID-03 Cross-Platform Consistency**

**Test:** JAX_PLATFORM_NAME=cpu python validation/valid03_cross_platform.py run --output results/valid03_cpu.json; then on GPU node: python validation/valid03_cross_platform.py run --output results/valid03_gpu.json; then compare: python validation/valid03_cross_platform.py compare results/valid03_cpu.json results/valid03_gpu.json

**Expected:** compare_results returns True; all relative errors below 1%.

**Why human:** Requires GPU cluster node for the GPU invocation.

---

## Gaps Summary

Phase 14 code is complete and correctly wired. The gap is operational: the benchmark was never executed on a GPU node, so results/power/benchmark_batched.json does not exist and the STATE.md decision gate row was never written.

Success criteria 1 and 2 (batched wiring, --legacy, simulate_batch integration) are fully verified in code and tests.

Success criteria 3 and 4 (benchmark_batched.json and STATE.md decision gate row) fail because _run_benchmark requires GPU cluster execution. The function is correctly implemented; execution is the missing step.

Success criterion 5 (VALID-03) is implemented and unit-tested with synthetic data but requires GPU execution for the authoritative cross-platform result.

Both concrete gaps will be produced by a single --benchmark cluster run.

---

_Verified: 2026-04-12_
_Verifier: Claude (gsd-verifier)_
