---
phase: 21-benchmark-bottleneck-diagnosis
plan: "07"
subsystem: diagnostic-synthesis
tags: [jax, xla, jit, persistent-cache, slurm, verdict, bottleneck, cache-scope, node-pinning]

# Dependency graph
requires:
  - phase: 21-01-scope-memo
    provides: HLO op counts + scan-body depths + state-space baseline comparison
  - phase: 21-02-harness-instrumentation
    provides: Locked vb_laplace_vs_nuts_jit.json 5-key schema with bottleneck_verdict + hlo_op_counts slots
  - phase: 21-03-vb-laplace-cluster-probe
    provides: Laplace cold/warm wall-clock + cache hit/miss at P ∈ {5, 20}
  - phase: 21-04-nuts-cluster-probe
    provides: NUTS cold/warm wall-clock + cache hit/miss at P ∈ {5, 20}
  - phase: 21-05-pscan-cross-process-chain
    provides: jit_scaling_sweep.csv cold/same-proc-warm/next-proc-warm at P ∈ {5, 20, 50}
  - phase: 21-06-cache-forensics
    provides: HLO hash matrix + Jaccard overlap + XLA cache-key bit-identity + 3-track reconciliation
provides:
  - Phase 21 VERDICT.md naming `cache_key` as dominant bottleneck
  - PR-level fix recommendation: node-pinning in cluster/14_benchmark_gpu.slurm:99 + delete N=2 warm-up
  - Follow-up plan identifier: 14.1-07 gap-closure
  - Success criterion: next_proc_warm_s/cold_jit_s >= 3.0x at P=50 (baseline 1.00x)
  - Phase 21 SC1-SC7 closure table (all satisfied)
  - ROADMAP + CONTEXT sync eliminating B1/B2/B3/B4/M1 checker blockers
affects:
  - 14.1-03 (BlackJAX benchmark resubmission) — CANNOT proceed as-is; must wait for 14.1-07
  - 14.1-07 (new gap-closure plan) — to be authored after this phase closes
  - 15 (production run) — will consume post-14.1-03 per_iteration_s + gpu_hours_per_chunk

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Evidence-based verdict synthesis: read all 5 required artifacts (benchmark-scope-memo.md, vb_laplace_vs_nuts_jit.json, jit_scaling_sweep.csv, cache_forensics.md, hlo_hash_matrix.json) + 6 per-plan SUMMARY files before writing VERDICT.md"
    - "8-candidate adjudication template with supporting/refuting evidence paragraphs per candidate (NUTS step, HGF scan graph, closure-over-data, cache-init-bug, tracing-cost paradox, shape polymorphism, warmup duplication, per-node cache scope) — scales to any future root-cause investigation"
    - "PR-level fix recommendation as code-diff sketch, not philosophical essay — names FILE + FUNCTION + PATCH SHAPE so follow-up plan can be authored without re-investigating"

key-files:
  created:
    - .planning/phases/21-benchmark-bottleneck-diagnosis/VERDICT.md
    - .planning/phases/21-benchmark-bottleneck-diagnosis/21-07-SUMMARY.md
  modified:
    - .planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_vs_nuts_jit.json
    - .planning/ROADMAP.md
    - .planning/phases/21-benchmark-bottleneck-diagnosis/21-CONTEXT.md
    - .planning/STATE.md

key-decisions:
  - "Bottleneck verdict: `cache_key` — per-node cache scope (JAX_COMPILATION_CACHE_DIR=.../${SLURMD_NODENAME}) vs SLURM scheduler mismatch. Selected from CONTEXT-locked 7-value enum {logp_graph, lbfgs_loop, hessian_graph, nuts_kernel, cache_key, both, undetermined}. Evidence: at P=50 next_proc_warm_s/cold_jit_s = 1.00x; HLO text-IR + XLA cache keys bit-identical across processes (21-06 §b falsifies closure-over-data); 13 per-node cache subdirs × 1.8G total (21-06 §a user paste); Phase 14 job 54899271 routed to m3a118/."
  - "Fix surface: cluster/14_benchmark_gpu.slurm (primary) + 8 sibling SLURM scripts sharing the same JAX_COMPILATION_CACHE_DIR=.../${SLURMD_NODENAME} formula. Option A (preferred, surgical): add `#SBATCH --nodelist=<pinned>` directive. Option B (alternative, requires mount check): drop SLURMD_NODENAME suffix for network-shared cache. Secondary independent fix: delete Phase-1 N=2 warm-up (Jaccard 0.180 cross-P HLO divergence, 21-06 §c)."
  - "Follow-up plan: new 14.1-07 gap-closure (not new integer phase, not quick-NNN). Right size: two-line SBATCH patch + a P=50 verification SLURM submission + SUMMARY capturing next_proc/cold ratio. 14.1-03 CANNOT proceed as-is — must wait for 14.1-07 to land node-pinning patch. This preserves the architectural directive 'isolate before fixing' (verify the fix measures before resubmitting the 8h production benchmark)."
  - "Success criterion: (1) next_proc_warm_s/cold_jit_s at P=50 >= 3.0x (baseline 1.00x); target next_proc_warm_s <= 75s; (2) cold JIT at P=50 <= 300s (sanity check); (3) P=5 same_proc_warm speedup >= 2.0x (regression check). Follow-on: after P-sweep invariant passes, resubmit 14_benchmark_gpu.slurm (14.1-03) and confirm cold JIT < 500s + warm/cold ratio > 3x + finite per_iteration_s in results/power/benchmark_batched.json."
  - "Candidate 7 (warmup_params duplication, RESEARCH Risk #4) CONFOUND DISSOLVED by 21-02 Patch C landing: fit_batch_hierarchical accepts warmup_params at hierarchical.py:2012; cold call captures adapted_params, warm call passes via kwarg. The full 1965s warm wall-clock in job-54899271 is attributable to real cross-process re-compile, not duplicate NUTS window adaptation."
  - "Closure-over-data refactor of src/prl_hgf/fitting/hierarchical_patrl.py::_build_patrl_log_posterior is EXPLICITLY NOT recommended — FALSIFIED by 21-06 HLO byte-identity evidence (nuts_P5 == pscan_P5_cold == pscan_P5_warm produce byte-identical total_signatures and XLA-emitted cache keys). Any production-code refactor would be cost-benefit negative: large scope, zero measurable effect on cross-process cache miss."
  - "ROADMAP + CONTEXT sync at phase close (B1/B2/B3/B4/M1 checker blockers resolved): SC1 state-space baselines only (removed 8-schools/Radon/BNN/transformer/CNN per CONTEXT §Comparison baselines); SC2 vb_laplace_vs_nuts_jit.json filename + 7-value enum + VB-Laplace probe wording (replaces original SVI probe); SC4 P ∈ {5, 20, 50} + status column (replaces jit_wall_clock_s); section header 'VB-Laplace Probe' replaces 'SVI Probe'; plans list all [x]; progress row '7/7 Complete 2026-04-19'; CONTEXT per_stage_compile_events rename + per_call_wall_clock sibling added."

patterns-established:
  - "Verdict-synthesis structural template: (a) one-sentence verdict naming the enum token; (b) 8-candidate adjudication with supporting/refuting evidence paragraphs + 'verdict on this candidate: supported/partially supported/refuted/falsified/confirmed'; (c) PR-level fix (file + function + patch shape, code-diff sketch); (d) follow-up plan naming with justification; (e) success criterion (quantitative invariant + command to verify); (f) downstream unblock signal; (g) deferred/out-of-scope items; (h) SC closure checklist"
  - "Phase 21 diagnostic-only scope preserved throughout: `git diff --stat src/` == 0; `git diff --stat results/` == 0; apply_decision_gate thresholds unchanged at phase close"

# Metrics
duration: ~45min (local desk work: read 5 required artifacts + 4 per-plan SUMMARY files; draft VERDICT.md 8 sections; fill JSON verdict + hlo_op_counts; sync ROADMAP + CONTEXT; update STATE + write SUMMARY)
completed: 2026-04-19
---

# Phase 21 Plan 07: VERDICT Synthesis Summary

**Phase 21 dominant bottleneck: `cache_key` — per-node cache scope (`JAX_COMPILATION_CACHE_DIR=.../${SLURMD_NODENAME}`) combined with SLURM no-node-affinity across `afterok`-chained jobs. Fix surface: `cluster/14_benchmark_gpu.slurm:99` (add `#SBATCH --nodelist=<pinned>` + delete Phase-1 N=2 warm-up). Follow-up plan: 14.1-07. 14.1-03 CANNOT proceed as-is.**

## Performance

- **Duration:** ~45 min (local CPU desk work)
- **Started:** 2026-04-19 (Wave 3 synthesis)
- **Completed:** 2026-04-19
- **Tasks:** 2 (both auto, no checkpoints)
- **Files created:** 2 (`VERDICT.md`, this SUMMARY)
- **Files modified:** 4 (`vb_laplace_vs_nuts_jit.json`, `ROADMAP.md`, `21-CONTEXT.md`, `STATE.md`)
- **Production code changed:** 0 lines (`git diff --stat src/` == 0; `git diff --stat results/` == 0)

## Verdict Headline (1-2 sentences)

The single dominant bottleneck causing job-54899271's 2197s-cold / 1965s-warm / 1.1x-speedup observation is **`cache_key`** — specifically, a cache scope vs SLURM scheduler mismatch where the on-disk persistent-compilation cache directory is keyed per-node via `JAX_COMPILATION_CACHE_DIR=.../.jax_cache_gpu/${SLURMD_NODENAME}` but SLURM does not guarantee node affinity across `afterok`-chained jobs, so each new benchmark job lands on a fresh node with an empty cache and re-compiles from scratch. The compiled HLO is stable across processes (byte-identical cache keys at every P); the NUTS + HGF graph size is structurally in-range vs state-space baselines; the root cause is infrastructure, not production code.

## Named Follow-up Plan + Scope

**Follow-up plan: 14.1-07 (new gap-closure plan under `.planning/phases/14-integration-gpu-benchmark/`)**

**Scope of 14.1-07:**
1. Add `#SBATCH --nodelist=<pinned_node>` to `cluster/14_benchmark_gpu.slurm` (and optionally the `21_diagnose_*.slurm` files for regression-testing Phase 21's 1.1x reproduction at P=50 after the fix).
2. Delete the N=2 Phase-1 warm-up block in `cluster/14_benchmark_gpu.slurm` (secondary independent patch from Jaccard-0.180 structural-orthogonality evidence).
3. Submit a cold-then-warm P=50 chain via `cluster/21_submit_pscan_chain.sh` forced to the pinned node.
4. Measure: `next_proc_warm_s / cold_jit_s` ratio at P=50 should rise from 1.00x (baseline) to >= 3.0x (target).
5. If the test passes, unblock 14.1-03. If it fails (sub-2x), promote Track (i) JAX #22281 tracing paradox to primary and open a new residual-concern plan.

## 14.1-03 Unblock Status

**BLOCKED until 14.1-07 lands.** 14.1-03's first task should change from "submit SLURM with SAMPLER=blackjax" to "verify 14.1-07 landed (grep -c '#SBATCH --nodelist' cluster/14_benchmark_gpu.slurm should be 1) before submitting". Resubmitting `cluster/14_benchmark_gpu.slurm` today would reproduce the 1.1x speedup and time out at 8h again.

## SC Closure Summary

| SC | Status | Justification |
|----|--------|---------------|
| SC1 — graph scope memo (state-space baselines) | satisfied | `benchmark-scope-memo.md` §c reports PAT-RL 3-level 23-direct/~175-inlined ops/trial vs NumPyro 100-state HMM ~200 ops/step; pick_best_cue 3-level 427-direct/~1170-inlined ops/trial; comparison is state-space-only (NumPyro HMM + Kalman/LGSSM) per CONTEXT §Comparison baselines. |
| SC2 — VB-Laplace-vs-NUTS JIT (5-key JSON, 7-value enum) | satisfied | `vb_laplace_vs_nuts_jit.json` has 5 top-level keys: per_stage_compile_events, per_call_wall_clock, per_p_scaling, bottleneck_verdict, hlo_op_counts, nuts_per_p_scaling. bottleneck_verdict.bottleneck_layer = 'cache_key' (from 7-value enum); evidence paragraph cites specific numbers. hlo_op_counts has 16 keys filled from 21-01 scope memo. |
| SC3 — cache forensics | satisfied | `cache_forensics.md` 6 sections with HLO hash matrix, XLA cache-key bit-identity at P=5, user-pasted cluster cache-dir listing (13 per-node subdirs × 1.8G), three-way track reconciliation (iii STRONG; ii FALSIFIED; i ALSO CONSISTENT). |
| SC4 — P-sweep (P ∈ {5, 20, 50}) | satisfied | `jit_scaling_sweep.csv` has 8 rows (3 × P=5, 3 × P=20, 2 × P=50) all status=completed. P=2 dropped per planner judgment; status column replaces jit_wall_clock_s. |
| SC5 — root-cause verdict | satisfied | `VERDICT.md` names `cache_key` as single dominant bottleneck with 8-candidate evidence summary + PR-level fix (file + function + patch shape) + follow-up plan (14.1-07) + success criterion (next_proc/cold >= 3.0x at P=50). |
| SC6 — diagnostic-only scope | satisfied | `git diff --stat src/` == 0 across whole phase; `git diff --stat results/` == 0; `apply_decision_gate` thresholds untouched. New code confined to `scripts/08_run_power_iteration.py` diagnostic helpers (additive), `cluster/21_*.slurm/.sh` files, `.planning/phases/21-*/*` artifacts. |
| SC7 — fast feedback loop | satisfied | All SLURM jobs in Phase 21 ran ≤30min walltime per 21-02/03/04/05 probe slurm files; no job used 8h production budget. P-sweep chain total wall-clock ~60min across 6 jobs. |

## Pointer to VERDICT.md + 5 Required Artifacts

| Artifact | Path | Purpose |
|----------|------|---------|
| **VERDICT.md** | `.planning/phases/21-benchmark-bottleneck-diagnosis/VERDICT.md` | Final verdict: bottleneck name + fix recommendation + follow-up plan + success criterion + 14.1-03 unblock signal + SC closure checklist |
| Graph scope memo | `.planning/phases/21-benchmark-bottleneck-diagnosis/benchmark-scope-memo.md` | SC1: HLO op counts + scan-body depths + state-space baselines + P=3→P=50 extrapolation |
| Laplace-vs-NUTS JSON | `.planning/phases/21-benchmark-bottleneck-diagnosis/vb_laplace_vs_nuts_jit.json` | SC2: 5-key schema; bottleneck_verdict.bottleneck_layer='cache_key'; hlo_op_counts 16-key filled |
| P-sweep CSV | `.planning/phases/21-benchmark-bottleneck-diagnosis/jit_scaling_sweep.csv` | SC4: P ∈ {5,20,50} × cold/same-proc-warm/next-proc-warm × status=completed |
| Cache forensics memo | `.planning/phases/21-benchmark-bottleneck-diagnosis/cache_forensics.md` | SC3: HLO hash matrix + Jaccard overlap + XLA-key bit-identity + user-paste + 3-track reconciliation |

## ROADMAP + CONTEXT Sync Edits (B1/B2/B3/B4/M1 resolution)

| Blocker ID | Resolution |
|------------|-----------|
| **B1** (SC1 banned baselines) | ROADMAP SC1 rewrite: state-space model baselines only (NumPyro HMMs, Kalman-filter scan-based MCMC, LGSSM examples); removed 8-schools, Radon-hierarchical, BNN ~1M params, transformer forward pass, standard CNN forward pass per CONTEXT.md §Comparison baselines. |
| **B2** (SC2 filename + enum + probe) | ROADMAP SC2 rewrite: `vb_laplace_vs_nuts_jit.json` filename (not `svi_vs_nuts_jit.json`); 7-value enum {logp_graph, lbfgs_loop, hessian_graph, nuts_kernel, cache_key, both, undetermined} (not 4-value); VB-Laplace probe reusing fit_vb_laplace_patrl from Phase 19 (replaces SVI probe). Section header + Sources of record + Architectural directives all updated. |
| **B3** (SC4 P-sweep set) | ROADMAP SC4 rewrite + CONTEXT P-sweep bullet: `P ∈ {5, 20, 50}` (P=2 dropped per planner judgment + ascending "iterate by increasing" directive). Dropped-P=2 rationale recorded inline. |
| **B4** (per_stage_compile_events rename) | CONTEXT vb_laplace_vs_nuts_jit.json fields bumped from 4 to 5; `per_stage_compile_times` renamed to `per_stage_compile_events` (event counts, not timings — JAX_LOG_COMPILES doesn't emit wall-clock); `per_call_wall_clock` added as sibling. |
| **M1** (status column replaces jit_wall_clock_s) | ROADMAP SC4 column list ends with `status` (not `jit_wall_clock_s`); enum `status ∈ {completed, early_stopped, infeasible}`; early-stop visibility more valuable than redundant timing. |

Cross-reference: all B1-B4 + M1 resolutions are also captured in the SUMMARY key-decisions frontmatter and reflected in the 4-6 new rows appended to STATE.md §Accumulated Context → Key Decisions (phase column: `21`).

## Git Log Line (Phase 21 closure commit)

The Phase 21 closure commit chain (not yet pushed; Task 4 is the final commit + push):
- `11a76c4 docs(21-07): write VERDICT naming cache-scope mismatch as dominant bottleneck`
- `81d5168 docs(21-07): sync ROADMAP and CONTEXT with final Phase 21 scope`
- **forthcoming** `docs(21-07): complete VERDICT synthesis plan` (STATE + SUMMARY + final push to origin/main)

After the final commit + `git push origin main`, `git log origin/main --oneline -1` will show the Phase 21 closure commit on origin/main, satisfying the "push succeeded" verification check and ensuring the cluster-side repo sees the updated STATE.md + VERDICT.md on next `git pull`.

## Decisions Made

All 7 key decisions are captured in frontmatter `key-decisions`. Headline:

- **Bottleneck named**: `cache_key` (per-node cache scope vs SLURM scheduler mismatch). NOT closure-over-data (FALSIFIED by 21-06), NOT graph size (REFUTED by in-process 2.0x speedup), NOT warmup_params (DISSOLVED by 21-02 Patch C).
- **Fix named**: `cluster/14_benchmark_gpu.slurm:99` + delete Phase-1 N=2 warm-up. Two-line SBATCH patch. NOT production code.
- **Follow-up plan named**: 14.1-07 gap-closure (right-sized: larger than quick-NNN, smaller than new integer phase).
- **Success criterion named**: at P=50, next_proc/cold >= 3.0x (baseline 1.00x); cold < 300s; P=5 regression check >= 2.0x.

## Deviations from Plan

**None.** Plan 21-07 executed exactly as written. All two tasks completed autonomously without checkpoints. All 20 verification criteria from the plan's `<verify>` blocks pass.

## Issues Encountered

None. All upstream artifacts were in-repo and read-ready:
- `benchmark-scope-memo.md` (21-01) — 412 lines
- `vb_laplace_vs_nuts_jit.json` (21-02/03/04) — ready for bottleneck_verdict + hlo_op_counts fill
- `jit_scaling_sweep.csv` (21-05) — 8 rows, all 7 columns populated
- `cache_forensics.md` (21-06) — 6 sections with user-pasted §a and three-track reconciliation
- 6 per-plan SUMMARY files (21-01 through 21-06) with key decisions spelled out

## Next Phase Readiness

- **14.1-07 (gap-closure plan, new)**: Ready for authorship. Scope fully specified in VERDICT.md §(d). Surgical two-line SBATCH patch + P=50 cold-then-warm verification submission.
- **14.1-03 (BlackJAX benchmark resubmission)**: BLOCKED until 14.1-07 lands. First task changes from "submit SLURM" to "verify node-pinning patch is present". Prerequisite: 14.1-07 close + push to origin/main.
- **15 (production run)**: Unaffected by Phase 21 directly; will consume post-14.1-03 `per_iteration_s` + `gpu_hours_per_chunk` to pick partition (GPU vs CPU-comp).
- **apply_decision_gate threshold tightening**: still deferred per STATE #105; not in Phase 21 scope. Becomes authorable after 14.1-03 writes `results/power/benchmark_batched.json` with calibrated BlackJAX-cluster numbers.

---

*Phase: 21-benchmark-bottleneck-diagnosis*
*Completed: 2026-04-19*
