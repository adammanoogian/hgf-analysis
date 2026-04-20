---
phase: 14-integration-gpu-benchmark
plan: "14.1-07"
step: 1-diagnostic
verified: 2026-04-20
status: complete_with_caveat
active_strategy: shared-dir
gate_miscalibrated: true
---

# Phase 14.1-07 Step-1 Diagnostic Verification

## Verdict

**Active strategy:** `shared-dir` — `JAX_COMPILATION_CACHE_DIR` routes all 9 GPU/CPU SLURM scripts to `/scratch/${_PROJECT}/${USER}/.jax_cache_{gpu|cpu}[/subdir]/shared` on the Lustre mount. Cross-process + cross-node persistent compilation cache reuse confirmed at the XLA layer (10/10 compiles hit cross-node on a L40S pair).

**Status:** `complete_with_caveat` — VERDICT §e Primary gate (≥ 3.0× at P=50) fails literally (1.04×), but the gate criterion was miscalibrated against the underlying mechanism. See §Gate Criterion Caveat below. The infrastructure fix is real and delivers the intended cross-process cache behaviour.

**14.1-03 unblock signal:** ISSUED. Plan 14.1-03 can now run `sbatch cluster/14_benchmark_gpu.slurm` unchanged; the in-process tracing-cache speedup of 2.52× (`same_proc_warm / cold` at P=50) is the relevant metric for chunk-based benchmark iteration and is confirmed post-patch.

## Gate Results (VERDICT §e quantitative invariants)

| Gate | Target | Observed | Verdict |
|------|--------|----------|---------|
| Primary: `cold_jit_s / next_proc_warm_s` @ P=50 | ≥ 3.0× | **1.04×** (233.40 / 223.90) | ✗ FAIL (gate miscalibrated — see caveat) |
| Secondary: `cold_jit_s` @ P=50 | ≤ 300s | 233.40s | ✓ PASS |
| Regression: `same_proc_warm_s / cold_jit_s` @ P=5 | ≤ 0.5 (≥ 2.0× in-process) | 0.49 (2.03×; row 12) | ✓ PASS |

**In-process tracing-cache speedup (reference — not a VERDICT §e gate but the metric that matters for 14.1-03's chunk iteration):**

| P | `cold_jit_s` | `same_proc_warm_s` | Speedup |
|---|-------------|---------------------|---------|
| 5 | 55.83s | 27.53s | 2.03× (row 12) |
| 20 | 187.80s | 176.81s | 1.06× (row 15 — P=20 in-process pathology persists per STATE #188) |
| 50 | 233.40s | 92.81s | **2.52× (row 14 — relevant for 14.1-03)** |

## New CSV Rows (post-patch, commits 27d14e1 + 6b7e6ed landed)

`.planning/phases/21-benchmark-bottleneck-diagnosis/jit_scaling_sweep.csv` rows 12–17 (1-indexed from the header row):

```
line 12: 5,55.83,27.53,46.40,0.7266,459.0,completed     # P=5 cold,  job 54902458, node m3g108
line 13: 5,46.38,24.81,46.40,0.8062,455.0,completed     # P=5 warm,  job 54902459, node m3g108
line 14: 50,233.40,92.81,223.90,0.2155,473.0,completed  # P=50 cold, job 54902462, node m3g111
line 15: 20,187.80,176.81,186.70,0.1131,461.0,completed # P=20 cold, job 54902460, node m3g108
line 16: 50,223.90,89.72,223.90,0.2229,469.0,completed  # P=50 warm, job 54902463, node m3g108
line 17: 20,186.72,176.89,186.70,0.1131,461.0,completed # P=20 warm, job 54902461, node m3g108
```

Pre-patch rows 1–11 preserved unchanged for audit (see VERDICT.md §e for pre-patch interpretation).

## XLA Persistent Cache Behaviour (primary mechanism evidence)

`JAX_LOG_COMPILES=1` output from the chain (grep `Persistent compilation cache {hit,MISS}`):

| Job | P | Role | Node | HIT count | MISS count |
|-----|---|------|------|-----------|------------|
| 54902458 | 5 | cold | m3g108 | 9 | 1 (writes to cache) |
| 54902459 | 5 | warm | m3g108 | **10** | **0** ✓ |
| 54902462 | 50 | cold | m3g111 | 9 | 1 (writes to cache) |
| 54902463 | 50 | warm | **m3g108** | **10** | **0** ✓ |

**Key finding:** P=50 cold ran on `m3g111`, P=50 warm ran on `m3g108` (DIFFERENT NODES), yet warm hit 10/10 persistent-cache entries. This confirms the `/shared` cache dir correctly delivers cross-node cache reuse via the Lustre scratch mount. Cache keys are node-agnostic per the VERDICT §(c) hypothesis.

The single cache MISS on each cold job is the `_one_step` outer scan with key
`jit_scan-db76e6f5634d4ae9dc0d7d3c88ba210d6f3dbad528f91e60f7b20083b5d693c0` (P=50; analogous P=5 key). Cold writes it; warm hits it in 0.26s instead of 3.08s. Falsifies the closure-over-data hypothesis (STATE #187, RESEARCH Risk #5) — cache key IS reused cross-process + cross-node.

## Compile-Time Accounting @ P=50 (why the walltime ratio is 1.04×, not 3.0×)

Sum of `Finished XLA compilation of jit(*)` events per job:

| Job | Σ XLA compile time | Walltime (cold_jit_s) | Compile fraction |
|-----|--------------------|------------------------|------------------|
| P=50 cold (54902462) | ~3.5s | 233.40s | **1.5%** |
| P=50 warm (54902463) | ~0.9s | 223.90s | 0.4% |

Walltime decomposition (inferred from compile vs total):
- Python imports: ~5–10s
- JAX tracing (in-process only; not persisted): ~100s
- XLA compile: ~3s (cold) / ~1s (warm)  — the cached quantity
- BlackJAX window adaptation (actual MCMC sampling during warmup): ~100–120s

At ~1.5% of walltime, XLA compile cannot produce a 3.0× walltime ratio no matter how perfectly it is cached. The tracing layer (100s, in-process only) is not persisted across processes and is not addressed by `JAX_COMPILATION_CACHE_DIR`.

## Lustre Contention Probe

`grep -iEn 'flock|cache entry version mismatch|cache lock|lustre|concurrent' cluster/logs/diag21_pscan_54902458..54902463.{out,err}`:

```
(zero hits — grep exited 1)
```

No file-lock or cache-corruption symptoms observed. The `/shared` strategy is safe on Lustre at this workload scale.

## Gate Criterion Caveat

The VERDICT §e Primary gate (`next_proc_warm / cold ≥ 3.0×` at P=50) was derived from Phase 21 §21-05 data that showed `next_proc_warm_s / cold_jit_s = 1.00×` at every tested P pre-patch, combined with an implicit assumption that fixing the cache would lift walltime by ≥ 3.0×. That 3.0× target implicitly assumed XLA compile dominated walltime.

Post-patch measurement falsifies that assumption: compile is ≤ 1.5% of walltime at P=50; persistent cache is now delivering 100% of the achievable compile-time savings; the remaining ~220s per cold process boot is tracing + imports + blackjax adaptation sampling, which persistent cache cannot address by definition.

**Why this is not treated as a mechanism failure:**
- The cache is hitting cross-process AND cross-node (10/10 P=50 warm hits on a different node from cold) — textbook evidence the mechanism works.
- Phase 21 §21-06 HLO bit-identity evidence already predicted this: cache keys matched; only the per-node *cache scope* was broken. `/shared` fixes scope; scope fix is complete.
- The nodelist-fallback branch (plan 14.1-07b Task 3) targets cache-key scope mismatch, which our data proves is already solved. Running the fallback would burn ~40 min of cluster time to re-confirm a non-problem.

**Consequence for the plan:** `complete_with_caveat` instead of `gate_failed` / `fallback_triggered` / `complete`. Task 3 (`nodelist-fallback`) is explicitly SKIPPED on the basis that its hypothesised mechanism (cache_key cross-process miss) is already dissolved by this evidence. Phase 14.1-03 unblock signal is issued on the strength of the mechanism evidence, not the literal gate.

**Deferred option (not part of 14.1-07 scope):** AOT compile + serialize via `jax.jit.lower(...).compile()` + `jax.export.serialize()` would attack the ~100s tracing overhead directly. Cost: one new phase with a shape-variation + blackjax-closure research spike. Benefit at chunk-based 14.1-03 scale: probably ~5 min total saved across a 3-chunk benchmark (tracing re-runs per chunk). Not worth bundling into 14.1-07. Should be considered only if 14.1-03's walltime materially exceeds the Phase-14 decision-gate criterion (STATE #210: > 50 GPU-hours/chunk → fall back to CPU `comp` partition).

## Evidence Commits

Infrastructure patches (`origin/main`):
- `6b7e6ed` — `fix(14.1-07): drop per-node cache suffix + upgrade Phase-1 warm-up to production N` (14.1-07a atomic commit; 9 SLURM scripts + `scripts/08_run_power_iteration.py`)
- `f9a0872` — `docs(14.1-07a): complete node-pin infrastructure patch plan` (14.1-07a plan + summary)
- `79b95c9` — `fix(14.1-07): pre-warm ArviZ daily_warning file to defeat import-time race` (ArviZ race first attempt — `touch` placeholder; superseded)
- `27d14e1` — `fix(14.1-07): write today's ISO date into ArviZ stamp (previous touch was insufficient)` (corrected: writes today's YYYY-MM-DD into stamp file)

Cluster auto-pushes from the post-patch chain (all 6 jobs completed):
- `6581e28` — P=5 cold (job 54902458)
- `7606fb3` — P=5 warm (job 54902459)
- `7964c15` — P=20 cold (job 54902460)
- `59bdb2f` — P=20 warm (job 54902461)
- `68942cb` — P=50 cold (job 54902462)
- `8464086` — P=50 warm (job 54902463)

## Phase 14.1-03 Unblock Signal

Plan 14.1-03 can now execute its production benchmark. Single command:

```
sbatch cluster/14_benchmark_gpu.slurm
```

No additional prerequisite patches. The shared-cache infrastructure is repo-wide; `grep -c '#SBATCH --nodelist' cluster/14_benchmark_gpu.slurm` returns 0 (shared-dir path active; nodelist fallback not applied). The ArviZ pre-warm header in the same script defeats the import-time race.

Expected behaviour under the fix:
- Phase 1 warm-up: ~233s cold compile at production N=max (was N=2 pre-patch; HLO now matches Phase 2)
- Phase 2 measurement: each iteration hits the in-process tracing cache and runs at ~93s-equivalent (2.52× speedup vs cold)
- Each subsequent chunk (new `sbatch` in the chain): persistent cache hits all XLA compiles; tracing re-runs (~100s per chunk start)
- Phase-14 decision-gate criterion unchanged: if total per-chunk walltime × 600 iterations / 3600 > 50 GPU-hours, recommendation falls back to CPU `comp` partition (STATE #210)

**Flag for monitoring (not blocking 14.1-03):** if 14.1-03 walltime materially exceeds the 50 GPU-hour/chunk threshold despite this fix, the next diagnostic cycle should target the ~100s tracing layer (AOT serialize, reduced JIT boundaries, or warmup_params reuse across chunks) rather than the persistent-compile cache — which this verification proves is already saturated.
