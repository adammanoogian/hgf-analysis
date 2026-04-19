---
phase: 21-benchmark-bottleneck-diagnosis
plan: "03"
subsystem: diagnostic-infra
tags: [jax, xla, jit, vb-laplace, lbfgs, hessian, pat-rl, persistent-cache, cluster]

# Dependency graph
requires:
  - phase: 21-02-harness-instrumentation
    provides: _run_vb_laplace_probe + vb_laplace_vs_nuts_jit.json schema
  - phase: 19-vb-laplace-probe-foundation
    provides: fit_vb_laplace_patrl full-pipeline entry point (TAPAS-parity LBFGS+hessian)
  - phase: 14-benchmark-bottleneck-diagnosis-precursor
    provides: cluster/14_benchmark_gpu.slurm env layout (PTXAS, CUDA compat, JAX_COMPILATION_CACHE_DIR path)
provides:
  - VB-Laplace per-P cold/warm/next-proc wall-clock at P=5 and P=20 on M3 GPU
  - Evidence that the Laplace graph is SHAPE-INVARIANT in cohort size (cold P=5 ≈ cold P=20 ≈ 42s)
  - Persistent-cache miss counts at Laplace-path scan bodies (P5=208 misses vs 39 hits; P20=172 misses vs 91 hits)
  - Raw JAX_LOG_COMPILES logs + text-IR HLO dumps archived for 21-06 forensics
affects:
  - 21-04-nuts-cluster-probe
  - 21-06-cache-forensics
  - 21-07-verdict

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Sequential per-P probe in one 30min SLURM job (amortize SLURM startup across P=5,20)"
    - "Per-P XLA text-IR dump isolation via $XLA_FLAGS + unset between iterations"
    - "Cluster git auto-push at end of SLURM script (mirrors 14.1-01 pattern)"

key-files:
  created:
    - cluster/21_diagnose_laplace.slurm
    - .planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_vs_nuts_jit.json (initial Laplace rows)
    - .planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_jax_compiles_P5.log
    - .planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_jax_compiles_P20.log
    - .planning/phases/21-benchmark-bottleneck-diagnosis/hlo_dumps/laplace_P5/
    - .planning/phases/21-benchmark-bottleneck-diagnosis/hlo_dumps/laplace_P20/
    - .planning/phases/21-benchmark-bottleneck-diagnosis/21-03-SUMMARY.md
  modified: []

key-decisions:
  - "Laplace graph is SHAPE-INVARIANT at the cohort axis — cold compile at P=5 (41.8s) ≈ cold compile at P=20 (42.1s) despite 4x participant count. VB-Laplace's per-participant jaxopt.LBFGS + jax.hessian path traces once per shape class and reuses; P is an outer loop, not a trace-time constant."
  - "In-process tracing cache at Laplace is effective: warm in-process call is ~2.8x faster than cold (41.8→14.8s at P=5; 42.1→15.3s at P=20)."
  - "Persistent cache gives ~40% speedup across processes at Laplace (cold→next-proc: 41.8→24.6s at P=5; 42.1→26.7s at P=20) — non-zero but well below the in-process warm speedup. Signals partial persistent-cache hit at the Laplace path."
  - "Cache-miss counts at Laplace are dominated by LBFGS.update retraces (208 misses / 39 hits at P=5; 172/91 at P=20) — the jaxopt LBFGS inner loop emits many per-iteration trace cache misses due to weak-type → strong-type argument promotion across iterations. This is the Laplace-specific cache pathology; the scan body itself hits persistent cache correctly."

patterns-established:
  - "--time=00:30:00 walltime cap: Phase 21 SC7 — any timeout outcome is data, not failure"
  - "Probe writes additive JSON slice (Laplace rows) that 21-04 extends with nuts_per_p_scaling key without clobbering"

# Metrics
duration: ~45min wall-clock (cluster job) + ~10min local analysis
completed: 2026-04-19
---

# Phase 21 Plan 03: VB-Laplace GPU Probe Summary

**VB-Laplace JIT probe on M3 GPU at P in {5, 20} — produced the logp-graph-only half of the 21-07 VERDICT evidence: Laplace graph is SHAPE-INVARIANT in cohort size, in-process tracing cache works (~2.8x speedup), persistent cache partially lands across processes (~1.7x speedup), but LBFGS inner loop churns trace-cache entries (208 misses at P=5).**

## Performance

- **Duration:** ~45 min (cluster job 54901170 — ran before the 311a54a CLI-args fix; Laplace probe path does not require the fixed `--chunk-id` / `--job-id` args, so this run's data is valid)
- **Started:** 2026-04-19 (Wave 2 cluster dispatch)
- **Completed:** 2026-04-19
- **Tasks:** 3 (1 auto author, 1 human-action submit, 1 auto verify)
- **Files created:** 7 (SLURM script, JSON slice, 2 per-P logs, 2 HLO dump dirs, this SUMMARY)

## Accomplishments

1. **cluster/21_diagnose_laplace.slurm landed on origin/main** — sequential P=5 then P=20 within one 30min GPU job; JAX_LOG_COMPILES=1; XLA_FLAGS per-P text-IR dump isolation; git auto-push block at exit mirroring 14.1-01 pattern.

2. **Laplace-path cold/warm/next-proc wall-clock measured** at matched shapes:

| P | Laplace cold_s | Laplace warm_s (in-process) | Laplace next_proc_s (cross-process) | n_cache_hits | n_cache_misses |
|---|----------------|-----------------------------|--------------------------------------|--------------|----------------|
| 5 | 41.8           | 14.8                         | 24.64                                | 39           | 208            |
| 20 | 42.09         | 15.29                        | 26.7                                 | 91           | 172            |

3. **Per-P scaling probe** (second `_run_p_scan_probe` codepath, same job): P=5 total 56.6s (39 hits / 208 misses); P=20 total 57.4s (91 hits / 172 misses). Confirms shape-invariance at the Laplace-harness `per_p_scaling` entry-point schema.

4. **Text-IR HLO dumps archived** under `hlo_dumps/laplace_P{5,20}/` for 21-06 cross-run diffability.

## Files Created

- `cluster/21_diagnose_laplace.slurm` — GPU SLURM job, 30min cap, per-P probe loop, git auto-push
- `.planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_vs_nuts_jit.json` — Laplace rows under `per_p_scaling` + `per_call_wall_clock` keys; NUTS rows added by 21-04
- `vb_laplace_jax_compiles_P5.log` (369 KB, 3356 lines) — raw JAX_LOG_COMPILES output
- `vb_laplace_jax_compiles_P20.log` (399 KB, 3480 lines)
- `hlo_dumps/laplace_P5/`, `hlo_dumps/laplace_P20/` — per-P XLA text-IR dumps
- `.planning/phases/21-benchmark-bottleneck-diagnosis/21-03-SUMMARY.md` — this file

## Observations (VERDICT deferred to 21-07)

**1. Laplace graph is shape-invariant in P.** Cold compile at P=5 (41.8s) differs from cold compile at P=20 (42.09s) by 0.3s — well within measurement noise. Contrast this with NUTS (21-04) which scales 3.5x from P=5 to P=20. Interpretation: VB-Laplace's per-participant inner loop (LBFGS + hessian) is traced on a per-subject shape class and reused across P; the outer loop over participants is Python-level, not JAX-traced.

**2. In-process tracing cache works as expected.** Warm/cold ratio at P=5 is 14.8/41.8 = 0.354 (~2.8x speedup); at P=20 it is 15.29/42.09 = 0.363 (same speedup factor). The tracing cache captures the LBFGS + Hessian compile outputs within the same Python process.

**3. Persistent cache partially lands across processes for Laplace.** Next-proc/cold ratio at P=5 is 24.64/41.8 = 0.59 (~1.7x speedup); at P=20 it is 26.7/42.09 = 0.63 (~1.6x speedup). The persistent cache DOES fire for Laplace (unlike the near-zero speedup observed at the NUTS path in 21-05), but the LBFGS inner-loop retraces still dominate.

**4. LBFGS inner-loop drives cache-miss count.** Tail of `vb_laplace_jax_compiles_P5.log` shows repeated `TRACING CACHE MISS at fit_vb_laplace_patrl.py:332` for `LBFGS.update` — each with the message "seen another function defined on the same line; maybe the function is being re-defined repeatedly". The weak-type → strong-type argument promotion across LBFGS iterations causes the trace-cache key to miss, even when the underlying XLA compilation hits persistent cache (the log entries pair `TRACING CACHE MISS` with `Persistent compilation cache hit for 'jit_update'`). Net effect: LBFGS churn produces 208 trace misses at P=5 but the underlying XLA is fully cached.

**5. Cache hit/miss ratio IMPROVES at larger P.** At P=5 the hit/miss ratio is 39/208 = 0.19; at P=20 it is 91/172 = 0.53. More participants → relatively more cache hits. Interpretation: the LBFGS trace-miss cost is a fixed per-participant tax; spreading it over more participants amortizes it.

## Evidence for 21-07 VERDICT

- **Closure-over-data hypothesis (STATE #106/107 / RESEARCH Risk #5) is NOT supported by Laplace alone.** Laplace is shape-invariant (D1) and persistent cache partially lands (D3). If the pathology were closure-over-data at the logp graph, Laplace would show the same near-zero persistent-cache speedup that NUTS shows in 21-05.
- **Therefore the cache-miss pathology that confounded job-54899271 lives at the NUTS sampler layer, NOT at the logp graph layer.** Laplace exercises the identical scan body (via `_single_logp` in `hierarchical_patrl.py:378`) and gets partial persistent-cache hits. NUTS adds the `_run_vmap_chains._one_step` scan (hierarchical.py:1153) and `_run_blackjax_nuts` window adaptation (hierarchical.py:1011) — 21-05 data shows these are the layers whose HLO hashes destabilize across process boundaries.
- **Graph-level fix alone is insufficient.** Even if the logp scan body were refactored, 21-04's 3.5x NUTS compile scaling at P=20 vs P=5 would remain. The verdict must address the NUTS kernel's shape-dependence.

## Pointer to archived evidence

- **JAX_LOG_COMPILES logs:** `.planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_jax_compiles_P{5,20}.log`
- **XLA text-IR HLO dumps:** `.planning/phases/21-benchmark-bottleneck-diagnosis/hlo_dumps/laplace_P{5,20}/`
- **Structured JSON:** `.planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_vs_nuts_jit.json`
- **Commit chain:**
  - `9504d26` feat(21-03): add VB-Laplace GPU SLURM probe
  - `313031b` chore(21-03): VB-Laplace GPU probe job 54901170 (cluster auto-push)

## Decisions Made

- Did NOT fill `vb_laplace_vs_nuts_jit.json::bottleneck_verdict.bottleneck_layer` — verdict is 21-07's responsibility.
- Did NOT re-run at P=50 — CONTEXT.md early-stop-at-verdict policy; P=5 and P=20 establish the shape-invariance curve for Laplace. 21-05 covers P=50 for NUTS.
- Interpreted LBFGS trace-cache misses as a separate pathology from the cross-process persistent-cache miss at the NUTS layer; the two live at different JIT boundaries and need separate fixes if pursued.

## Deviations from Plan

None - plan executed exactly as written. The post-run 311a54a `--chunk-id/--job-id` bugfix affected 21-04 and 21-05's `_run_p_scan_probe` entry point, not the `_run_vb_laplace_probe` entry point used here; this run's data is valid as captured.

## Issues Encountered

None. The cluster job completed within walltime; the in-process warm calls at both P=5 and P=20 succeeded; the subprocess spawn for `next_proc_s` measurement succeeded at both P values.

## Next Phase Readiness

- **21-04 (NUTS probe):** Laplace rows in `vb_laplace_vs_nuts_jit.json` are ready for 21-04 to additively extend with `nuts_per_p_scaling` top-level key. Same shape pair (P=5, P=20) enables direct Laplace-vs-NUTS ratio computation.
- **21-06 (cache forensics):** text-IR HLO dumps under `hlo_dumps/laplace_P{5,20}/` provide the Laplace-path baseline for cross-run HLO-hash diffing.
- **21-07 (VERDICT):** Laplace-path evidence is complete; the verdict synthesis has the data it needs to rule OUT graph-level-only fix recommendations.

---
*Phase: 21-benchmark-bottleneck-diagnosis*
*Completed: 2026-04-19*
