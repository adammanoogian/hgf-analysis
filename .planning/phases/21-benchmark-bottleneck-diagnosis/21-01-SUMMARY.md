---
phase: 21-benchmark-bottleneck-diagnosis
plan: "01"
subsystem: diagnostic-infra
tags: [jax, xla, hlo, jaxpr, pyhgf, blackjax, benchmark, scope-memo, state-space]

# Dependency graph
requires:
  - phase: 14-benchmark-bottleneck-diagnosis-precursor
    provides: triggering cold-2197s/warm-1965s observation from job 54899271
  - phase: 20-pat-rl-scientific-completion
    provides: PAT-RL logp factory + closure (build_logp_fn_batched_patrl, _build_patrl_log_posterior)
  - phase: 19-vb-laplace-probe-foundation
    provides: fit_vb_laplace_patrl pipeline (for reference; not exercised here)
provides:
  - benchmark-scope-memo.md (HLO op counts + scan-body depth + FLOPs/draw)
  - jaxpr_dumps/ (reproducibility archive for 4 logp variants at P=3)
  - trace_scope.py (local-CPU reproducer; working artifact)
  - Empirical evidence that PAT-RL 3-level scan body ~175 ops inlined; pick_best_cue 3-level scan body ~1170 ops inlined at P=3
  - Structural-difference table for VERDICT.md (21-07) to cite
affects: [21-02-cache-forensics, 21-03-vb-laplace-probe, 21-04-p-sweep, 21-07-verdict]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "JAX graph-scope diagnosis via jax.make_jaxpr + jax.jit.lower.as_text"
    - "HLO op counting by per-subcomputation func.func walk"
    - "Closure-captured-data vs traced-args HLO constant signature"

key-files:
  created:
    - .planning/phases/21-benchmark-bottleneck-diagnosis/benchmark-scope-memo.md
    - .planning/phases/21-benchmark-bottleneck-diagnosis/21-01-SUMMARY.md
    - .planning/phases/21-benchmark-bottleneck-diagnosis/trace_scope.py
    - .planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/patrl_3level_P3.{hlo,jaxpr}.txt
    - .planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/patrl_2level_P3.{hlo,jaxpr}.txt
    - .planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/pickbestcue_3level_P3.{hlo,jaxpr}.txt
    - .planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/pickbestcue_2level_P3.{hlo,jaxpr}.txt
    - .planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/op_counts.json
    - .planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/op_counts_full.json
  modified: []

key-decisions:
  - "Scan body depth reported as 'direct / inlined' — pyhgf nested @partial(jit,...) boundaries mean the raw scan-body callee op count understates the real inner-loop work"
  - "Total HLO op count at P=3 is the local measurement; P=50 extrapolation rule (scan body shape-invariant, outer graph sub-linear in P) stated explicitly instead of attempting a P=50 JIT locally"
  - "FLOPs/draw derived from HLO op count × n_trials × NUTS step count (32 leapfrog steps, ~2x tolerance) rather than hand-counted from equations"
  - "Verdict on 1.1x cache-speedup observation deferred to plan 21-07; memo documents evidence (closure-over-data pattern at hierarchical_patrl.py:506-512 producing stablehlo.constant HLO blobs) without making a call"

patterns-established:
  - "Local CPU jaxpr+HLO dump via trace_scope.py for graph-scope diagnosis — reproducible on any ds_env install in ~40s"
  - "Per-subcomputation op counts via MLIR func.func block walk — distinguishes scan body callee from ENTRY outer graph"

# Metrics
duration: 25min
completed: 2026-04-19
---

# Phase 21 Plan 01: Benchmark Scope Memo Summary

**Empirical HLO graph-scope measurements for PAT-RL 2/3-level and pick_best_cue 2/3-level logp closures at P=3 on local CPU, establishing per-trial scan-body depth and FLOPs/draw estimates for VERDICT.md (21-07) to cite.**

## Performance

- **Duration:** ~25 min (local desk work; no cluster, no GPU)
- **Started:** 2026-04-19T11:38Z
- **Completed:** 2026-04-19T12:03Z
- **Tasks:** 1/1 complete
- **Files created:** 12 (1 memo, 1 summary, 1 trace script, 8 dump files, 2 op-count JSONs)
- **Files modified:** 0 (no src/ changes — diagnostic memo only; `git diff --stat src/` clean)

## Accomplishments

- **Headline numbers at P=3** (from local CPU trace, pyhgf 0.2.10, JAX 0.4.31):

  | Variant | Total HLO ops | Scan-body (`@None`) direct | Scan-body inlined | Main (`@main`) |
  |---------|--------------:|---------------------------:|------------------:|---------------:|
  | PAT-RL 3-level   | 673  | 23  | ~175   | 192 |
  | PAT-RL 2-level   | 433  | 15  | ~100-130 | 123 |
  | pick_best_cue 3-level | 1515 | 427 | ~1170  | 195 |
  | pick_best_cue 2-level | 1098 | 357 | ~800   | 182 |

- **Scan-body depth (HLO ops per trial) — the non-negotiable column:**
  - PAT-RL 3-level: **~175 ops/trial inlined** (23 direct in `@None` scan body + 1 call to `@beliefs_propagation` + 14 `@_where_*` calls for Layer-2 pytree clamp + all nested pyhgf update functions).
  - PAT-RL 2-level: ~100-130 ops/trial.
  - pick_best_cue 3-level: **~1170 ops/trial inlined** (3 parallel binary branches).
  - pick_best_cue 2-level: ~800 ops/trial.

- **FLOPs/draw @ P=50 (extrapolated, ~2× tolerance, NUTS 32 leapfrog × 2 grad + AD factor):**
  - PAT-RL 3-level: ~40-80 MFLOPs/draw.
  - pick_best_cue 3-level: ~150-300 MFLOPs/draw.

- **One-line structural observation (no verdict):** PAT-RL 3-level scan body (~175 inlined ops/trial) is **same order of magnitude as a NumPyro 100-state HMM forward step (~200 ops)**; pick_best_cue 3-level scan body (~1170 inlined) is **~4-6× larger than HMM** because it processes 3 parallel binary branches per trial. Both models are 5-15× larger per step than minimal Kalman/LGSSM baselines. On absolute graph size neither repo model is pathologically huge for a state-space scan.

- **Closure-data HLO blob pattern confirmed:** `patrl_3level_P3.hlo.txt` lines 3-8 contain the `state`/`reward`/`shock`/`mask` arrays embedded as `stablehlo.constant dense<"0x..."> : tensor<3x192xi32>` (and similar) blobs in the compiled graph — directly produced by the data-as-closure capture at `src/prl_hgf/fitting/hierarchical_patrl.py:506-512`. The pick_best_cue equivalent HLO dump has these arrays as `func.func public @main` arguments (`%arg5`, `%arg6`, ...), confirming the STATE #106/#107 traced-args pattern.

## Task Commits

1. **Task 1: Trace the PAT-RL logp graph locally and count HLO ops** — `003b85b` (docs)
   - Scope memo + 8 jaxpr/hlo dump files + 2 op-count JSONs + trace_scope.py

**Plan metadata commit:** (to be added below)

## Files Created/Modified

- `.planning/phases/21-benchmark-bottleneck-diagnosis/benchmark-scope-memo.md` — 6-section memo (exec summary, methodology, state-space comparison table, structural differences, closure-over-data observation, appendix)
- `.planning/phases/21-benchmark-bottleneck-diagnosis/trace_scope.py` — local reproducer; ~40s on CPU; produces all 8 dump files + 2 op-count JSONs
- `.planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/*.hlo.txt` — lowered StableHLO for each variant (~60-160 KB each)
- `.planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/*.jaxpr.txt` — full JAXPR for each variant (~27-270 KB each)
- `.planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/op_counts.json` — headline totals + scan-body counts
- `.planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/op_counts_full.json` — per-subcomputation breakdown for all 4 variants

## Decisions Made

- **Scan body inlined count reported alongside raw count.** The raw `@None` callee op count understates the real per-trial work because pyhgf's nested `@partial(jit, static_argnames=...)` decorators cause each sub-function (`posterior_update_precision_continuous_node`, `posterior_update_mean_continuous_node`, `precision_update`, etc.) to appear as a separate `func.func private` block. Inlined count sums these to give the true per-trial work estimate.
- **P=50 extrapolation rule stated, not measured.** Per CONTEXT.md: "Iterate by increasing the relevant parameters, not by reducing them" — but local JIT at P=50 would exceed the 5-min-local cap (and was explicitly what blew up on cluster). The memo documents the vmap-axis expansion rule (scan body invariant, outer graph sub-linear in P) as the deliverable.
- **FLOPs/draw range instead of point estimate.** ~2× tolerance bracket is honored; NUTS leapfrog step count stated as 16-64 range (midpoint 32); reverse-mode AD factor ~3× stated explicitly.
- **Verdict deferred to 21-07.** Memo flags the closure-over-data pattern at `hierarchical_patrl.py:506-512` and confirms its HLO-constant signature but makes no call on whether it is the cause of the 1.1× cache speedup.

## Deviations from Plan

**Minor — worth documenting for transparency:**

- **pyhgf version:** Installed environment has **pyhgf 0.2.10** (plan/research docs cite 0.2.8). Structural pattern (nested `@partial(jit, static_argnames=...)`) re-confirmed unchanged on direct source read of the 0.2.10 install. Memo appendix notes this explicitly.
- **trace_scope.py as committed artifact:** Plan wording says the tracer "does NOT need to be committed; can live under `.planning/phases/21-benchmark-bottleneck-diagnosis/trace_scope.py` as a working artifact". Decision: committed alongside the dumps because the memo's reproducibility appendix explicitly references it as a one-command reproducer; keeping the artifact with the planning tree (not under `src/`) preserves the "no production code" invariant while enabling 21-02/03 to call out to it if needed.

Neither deviation required code changes to `src/`. None triggered any of the auto-fix rules.

## Issues Encountered

- First trace script iteration used placeholder helpers (`config` top-level import not on path; simulate_batch signature was mis-remembered). Fixed in-session by adding REPO_ROOT to sys.path and switching to the actual `simulate_batch(config)` + `_build_arrays_single` API. Did not affect correctness of final HLO dumps.
- pyhgf version patch (0.2.8 → 0.2.10) noted above; no functional impact.

## Next Phase Readiness

**21-02 (cache forensics audit)** can now proceed with:

- Empirical scan-body depth numbers to reference when designing the HLO-hash-diff instrumentation.
- Concrete identification of closure-captured constants as the likely HLO-hash-unstable surface in the PAT-RL path.
- Reproducible local tracer (`trace_scope.py`) that 21-02 can adapt to produce cross-run HLO dumps at N=2 and N=50 on cluster.

**21-07 (VERDICT.md)** has:

- State-space comparison table anchored to empirical measurements (not speculation).
- Closure-over-data evidence confirmed at HLO level (the `stablehlo.constant dense<"0x...">` blob in `patrl_3level_P3.hlo.txt:3-8`).
- ~2× FLOPs/draw bracket to compare against the GPU compute floor and the observed 2197s/1965s wall times.

**No blockers.** Phase 21 Wave 1 continues with plan 21-02 (cache forensics audit) per the plan 21-01-PLAN.md wave decomposition.

---
*Phase: 21-benchmark-bottleneck-diagnosis*
*Completed: 2026-04-19*
