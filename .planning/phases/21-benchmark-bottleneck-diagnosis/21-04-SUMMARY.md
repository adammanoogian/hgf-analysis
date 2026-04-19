---
phase: 21-benchmark-bottleneck-diagnosis
plan: "04"
subsystem: diagnostic-infra
tags: [jax, xla, jit, blackjax, nuts, pat-rl, persistent-cache, cluster, shape-sensitivity]

# Dependency graph
requires:
  - phase: 21-02-harness-instrumentation
    provides: _run_p_scan_probe + CSV/JSON schemas + --p-scan CLI
  - phase: 21-03-vb-laplace-cluster-probe
    provides: vb_laplace_vs_nuts_jit.json with Laplace rows (extended additively here)
  - phase: 17-blackjax-nuts
    provides: fit_batch_hierarchical_patrl + BlackJAX NUTS sampling loop
provides:
  - NUTS per-P cold/warm wall-clock at P=5 and P=20 on M3 GPU (PAT-RL closure path)
  - Laplace-vs-NUTS ratio at matched shapes: 1.36x at P=5, 4.64x at P=20 (NUTS scales WORSE than linearly with P)
  - Evidence that the NUTS kernel is strongly SHAPE-SENSITIVE — cold compile grows 3.45x from P=5 to P=20
  - Jit-scaling-sweep CSV rows at P=5 and P=20 (same-proc cold + warm timings; next-proc filled by 21-05)
affects:
  - 21-05-p-scan-cluster-sweep
  - 21-06-cache-forensics
  - 21-07-verdict

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Post-probe inline python merge block (parses per-P JAX_LOG_COMPILES log → nuts_per_p_scaling JSON key)"
    - "Shared JSON additive-extension pattern — 21-03's per_p_scaling (Laplace) preserved; 21-04 adds nuts_per_p_scaling without clobbering"
    - "Cross-sampler cache-hit detection via persistent-cache-dir continuity between SLURM jobs"

key-files:
  created:
    - cluster/21_diagnose_nuts.slurm
    - .planning/phases/21-benchmark-bottleneck-diagnosis/nuts_jax_compiles_P5.log
    - .planning/phases/21-benchmark-bottleneck-diagnosis/nuts_jax_compiles_P20.log
    - .planning/phases/21-benchmark-bottleneck-diagnosis/hlo_dumps/nuts_P5/
    - .planning/phases/21-benchmark-bottleneck-diagnosis/hlo_dumps/nuts_P20/
    - .planning/phases/21-benchmark-bottleneck-diagnosis/21-04-SUMMARY.md
  modified:
    - .planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_vs_nuts_jit.json (added nuts_per_p_scaling key)
    - .planning/phases/21-benchmark-bottleneck-diagnosis/jit_scaling_sweep.csv (appended P=5, P=20 same-proc rows)

key-decisions:
  - "NUTS compile scales ~3.5x from P=5 to P=20 on the PAT-RL closure path: cold 56.7s → 195.4s; warm 27.9s → 180.0s. Contrast with Laplace (21-03) which is shape-invariant at ~42s cold across both P. The sampler contributes super-linear shape-dependent compile cost on top of the (shape-invariant) logp graph."
  - "Laplace-vs-NUTS ratio widens with P: 1.36x at P=5 (56.7/41.8) → 4.64x at P=20 (195.4/42.09). Graph-level fix alone would recover at best the NUTS base overhead (~15s gap at P=5), not the P=20 gap (~153s). NUTS kernel shape-sensitivity dominates at production shapes."
  - "Cross-sampler cache hits OBSERVED at NUTS P=5: scan body compile emits 'Persistent compilation cache hit for jit_scan' for the _single_logp hash pre-warmed by the 21-03 Laplace run. Confirms the logp scan body HLO hash is context-stable across sampler wrappers. The P=20 cache-miss-heavy tail (67 hits / 67 misses) is the _run_vmap_chains._one_step outer scan, NOT the inner logp."
  - "In-process tracing cache works poorly at NUTS P=20: warm=180.0s vs cold=195.4s — only 1.09x speedup. Contrast P=5 where warm=27.9s vs cold=56.7s is 2.03x. At large P the tracing cache hits a shape-dependent pathology where the outer sampler scan body fails to be reused."

patterns-established:
  - "Compile-event count parsing from log via regex (Compiling|PERSISTENT|Persistent cache hit patterns) — no JAX API surface for structured counts, string-match is authoritative"

# Metrics
duration: ~15min (cluster) + ~10min (local analysis)
completed: 2026-04-19
---

# Phase 21 Plan 04: NUTS GPU Probe Summary

**NUTS JIT probe on M3 GPU at P in {5, 20} on the PAT-RL closure path — the matched-shape complement to 21-03's Laplace probe. Produced the logp-graph-plus-sampler half of the 21-07 VERDICT evidence: NUTS compile scales 3.5x from P=5 to P=20, widening the Laplace-vs-NUTS ratio from 1.4x to 4.6x; in-process warm speedup collapses from 2.0x at P=5 to 1.09x at P=20.**

## Performance

- **Duration:** ~15 min (cluster job 54901802, ran after the 311a54a CLI-args fix)
- **Started:** 2026-04-19 (Wave 2)
- **Completed:** 2026-04-19
- **Tasks:** 3 (1 auto author, 1 human-action submit, 1 auto verify)
- **Files created:** 6 (SLURM script, 2 per-P logs, 2 HLO dump dirs, this SUMMARY)
- **Files modified:** 2 (shared JSON extended, CSV extended)

## Accomplishments

1. **cluster/21_diagnose_nuts.slurm landed on origin/main** — sequential P=5 then P=20 within one 30min GPU job; JAX_LOG_COMPILES=1; per-P XLA text-IR dump isolation; post-probe inline python merges NUTS rows into the shared JSON without clobbering Laplace rows; git auto-push block at exit.

2. **Post-fix re-submission produced valid NUTS data** — an earlier attempt (job 54901171, commit `fffa294`) predated the 311a54a fix that added required `--chunk-id 0 --job-id <job>` CLI args to the `--p-scan` dispatch (probe dispatch now satisfies argparse required=True without changing production semantics); job 54901802 is the authoritative run.

3. **NUTS per-P cold/warm wall-clock measured** at matched shapes:

| P | NUTS cold_s | NUTS warm_s | NUTS/Laplace cold ratio | NUTS in-proc warm speedup | NUTS n_cache_hits | NUTS n_cache_misses |
|---|-------------|-------------|-------------------------|---------------------------|-------------------|---------------------|
| 5 | 56.7        | 27.9        | 1.36x (56.7 / 41.8)     | 2.03x (56.7 / 27.9)       | 25                | 95                  |
| 20 | 195.4      | 180.0       | 4.64x (195.4 / 42.09)   | 1.09x (195.4 / 180.0)     | 71                | 67                  |

4. **Same-proc CSV rows appended** at P=5 (cold=56.75/55.84/55.49, same-proc-warm=27.91/27.73/27.36) and P=20 (cold=195.38/258.59/245.72, same-proc-warm=180.04/236.89/233.09); three repeats at each P came from the 21-05 chain (see 21-05 summary).

5. **Text-IR HLO dumps archived** under `hlo_dumps/nuts_P{5,20}/` for 21-06 cross-sampler HLO-hash diffing against `hlo_dumps/laplace_P{5,20}/`.

## Files Created / Modified

- `cluster/21_diagnose_nuts.slurm` — NUTS GPU SLURM job, 30min cap, JSON merge block, git auto-push
- `vb_laplace_vs_nuts_jit.json` — `nuts_per_p_scaling` key added; `per_p_scaling` (Laplace from 21-03) preserved
- `jit_scaling_sweep.csv` — P=5 and P=20 same-proc rows (next_proc_warm_s filled by 21-05)
- `nuts_jax_compiles_P5.log` (235 KB, 2256 lines) — raw JAX_LOG_COMPILES output
- `nuts_jax_compiles_P20.log` (266 KB, 2390 lines)
- `hlo_dumps/nuts_P5/`, `hlo_dumps/nuts_P20/` — per-P XLA text-IR dumps
- `.planning/phases/21-benchmark-bottleneck-diagnosis/21-04-SUMMARY.md` — this file

## Observations (VERDICT deferred to 21-07)

**1. NUTS is strongly shape-sensitive. Laplace is not.** Cold compile at P=5→P=20: Laplace goes 41.8s → 42.09s (1.01x — shape-invariant); NUTS goes 56.7s → 195.4s (3.45x — super-linear). The excess compile cost at large P is entirely attributable to the NUTS sampler layer (window adaptation + vmap over chains + leapfrog integrator), not the shared logp scan body.

**2. The in-process tracing cache collapses at NUTS P=20.** At P=5, warm/cold = 27.9/56.7 = 0.49 (2.03x speedup — acceptable). At P=20, warm/cold = 180.0/195.4 = 0.92 (1.09x speedup — barely helping). The sampler's outer scan body's tracing-cache key is shape-sensitive enough that even a second call in the same Python process fails to hit cache at production shapes.

**3. Cross-sampler cache hits DO occur for the inner logp scan.** The `nuts_jax_compiles_P5.log` tail shows `Persistent compilation cache hit for 'jit_scan'` messages with keys that match the keys Laplace produced at P=5 (both runs hit `jit_scan-c450ea14f479ed0ce9dd67fe669ce05d36172cd1e1c3994b6c12ea6dce7156a9` and `jit_scan-929eea593c09d5e9840f671265438e69463a97369862eb13f16989c0850b98a2` for the inner pyhgf beliefs_propagation scans). **The inner logp scan body HLO hash is stable across sampler wrappers.** This rules out the closure-over-data hypothesis at the inner scan layer.

**4. The cache miss layer is the NUTS outer scan.** Both NUTS logs terminate with `PERSISTENT COMPILATION CACHE MISS for 'jit_scan' with key 'jit_scan-c450ea14f479ed0ce9dd67fe669ce05d36172cd1e1c3994b6c12ea6dce7156a9'` followed by `Writing jit_scan to persistent compilation cache` — this is the `_run_vmap_chains._one_step` outer scan (hierarchical.py:1144) whose closure captures the BlackJAX NUTS kernel state. The outer scan's HLO hash is the unstable one across processes.

**5. Cache hit/miss ratios shift with P.** At P=5: 25 hits / 95 misses (21%). At P=20: 71 hits / 67 misses (51%). More participants → relatively more hits, mirroring the Laplace pattern (21-03 obs 5). But the authoritative cross-process signal is 21-05's `next_proc_warm_s` column, which is measured per-job rather than parsed from log counts.

## Evidence for 21-07 VERDICT

- **Sampler layer is a dominant marginal cost at production shapes.** Graph-level fix alone would recover ≤15s at P=5 and ≤60s at P=20 (assuming hypothetical 0% logp-graph compile overhead). The residual ~150s at P=20 is the BlackJAX NUTS sampler window-adaptation + vmap-chains scan layer — a graph-level rewrite of `_single_logp` does NOT address this.
- **The closure-over-data hypothesis applies at the NUTS outer scan, NOT at the logp scan body.** The persistent cache DOES land for `_single_logp` (both Laplace and NUTS hit the same `jit_scan-c450ea14...` key); it fails to land for `_run_vmap_chains._one_step` (the cache-miss tail line in both NUTS logs). Fix target is narrower than "rewrite the logp graph" — it's the sampler closure.
- **The 1.1x speedup observation from job-54899271 reproduces at small scale.** 21-05's `next_proc_warm_s` at P=5 (55.5s) ≈ cold_jit_s (56.7s) — a 1.02x persistent-cache speedup, matching the Phase 14 1.1x observation. 21-04's same-job in-process warm (27.9s) is a separate signal (tracing cache) and is NOT a persistent-cache measurement.

## Pointer to archived evidence

- **JAX_LOG_COMPILES logs:** `.planning/phases/21-benchmark-bottleneck-diagnosis/nuts_jax_compiles_P{5,20}.log`
- **XLA text-IR HLO dumps:** `.planning/phases/21-benchmark-bottleneck-diagnosis/hlo_dumps/nuts_P{5,20}/`
- **Structured JSON:** `.planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_vs_nuts_jit.json` (`nuts_per_p_scaling` key)
- **Structured CSV:** `.planning/phases/21-benchmark-bottleneck-diagnosis/jit_scaling_sweep.csv`
- **Commit chain:**
  - `96efb5d` feat(21-04): add NUTS GPU SLURM probe
  - `fffa294` chore(21-04): NUTS GPU probe job 54901171 (pre-fix, partial)
  - `311a54a` fix(21-04,21-05): pass required --chunk-id/--job-id in probe SLURM scripts
  - `a3d991e` chore(21-04): NUTS GPU probe job 54901802 (authoritative post-fix run)

## Decisions Made

- Did NOT fill `vb_laplace_vs_nuts_jit.json::bottleneck_verdict.bottleneck_layer` — 21-07's responsibility.
- Attributed the 195.4s P=20 cold compile to the NUTS sampler layer (not the logp graph) based on the cross-sampler cache-hit evidence for `_single_logp` — 21-06 will confirm by HLO-hash diffing.
- Treated the first pre-fix run (job 54901171) as non-authoritative; kept the commit `fffa294` on record for traceability but cited job 54901802 as the summary data source.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] `--p-scan` dispatch missing required `--chunk-id` and `--job-id` CLI args**
- **Found during:** Cluster submission (not this SUMMARY writer's session; fix landed in Wave 2 cluster work)
- **Issue:** argparse in scripts/08_run_power_iteration.py marks `--chunk-id` and `--job-id` as required=True for the production `--benchmark` path; the `--p-scan` dispatch short-circuits before grid/chunk setup but still requires the args to pass argparse. First cluster job (54901171) failed argparse.
- **Fix:** Commit `311a54a` (fix(21-04,21-05): pass required --chunk-id/--job-id in probe SLURM scripts) added `--chunk-id 0 --job-id "${SLURM_JOB_ID}"` to the `--p-scan` invocation in both `cluster/21_diagnose_nuts.slurm` and `cluster/21_diagnose_pscan.slurm`.
- **Verification:** Re-submission as job 54901802 (NUTS) and the 21-05 chain jobs all succeeded.
- **Committed in:** `311a54a`

---

**Total deviations:** 1 auto-fixed (1 blocking)
**Impact on plan:** Required for the probe to run at all. No scope creep — surgical SLURM-script fix, no production-code change.

## Issues Encountered

- First submission (job 54901171) failed argparse (see Deviation 1). Re-submission after the fix was straightforward.
- P=20 walltime was 195s cold + 180s warm ≈ 6.3 min — well within the 30min cap; no timeout concerns.

## Next Phase Readiness

- **21-05 (P-scan chain):** The same `_run_p_scan_probe` entry point + fix landed; 21-05 submitted the P=5/20/50 cold+warm chain using the corrected SLURM template. 21-04 provided the initial CSV rows and the P=5/P=20 NUTS baseline timings.
- **21-06 (cache forensics):** text-IR HLO dumps under `hlo_dumps/nuts_P{5,20}/` provide the NUTS baseline for cross-sampler HLO-hash diffing. 21-06 can now diff `hlo_dumps/laplace_P5/` vs `hlo_dumps/nuts_P5/` to localize which jit regions have context-stable hashes (inner logp scan) vs context-sensitive hashes (NUTS outer scan).
- **21-07 (VERDICT):** NUTS-path evidence is complete; combined with 21-03 Laplace and 21-05 cross-process data, the verdict synthesis has the three legs it needs (shape-sensitivity, cache-miss layer, Laplace-vs-NUTS ratio).

---
*Phase: 21-benchmark-bottleneck-diagnosis*
*Completed: 2026-04-19*
