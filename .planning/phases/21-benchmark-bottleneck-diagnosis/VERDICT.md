# Phase 21 VERDICT: Benchmark Bottleneck Root Cause

**Phase:** 21-benchmark-bottleneck-diagnosis
**Dated:** 2026-04-19
**Synthesized from:** 21-01 scope memo, 21-02 harness SUMMARY, 21-03 Laplace
probe, 21-04 NUTS probe, 21-05 P-sweep, 21-06 cache forensics.

---

## (a) Verdict

The single dominant bottleneck causing job-54899271's
**2197s-cold / 1965s-warm / 1.1x-speedup** observation is:
**`cache_key`** — specifically, a **cache scope vs SLURM scheduler
mismatch**: the on-disk persistent-compilation-cache directory is keyed
per-node via `JAX_COMPILATION_CACHE_DIR=.../.jax_cache_gpu/${SLURMD_NODENAME}`,
but SLURM does not guarantee node affinity across `afterok`-chained jobs,
so each new benchmark job lands on a fresh node with an empty cache and
re-compiles from scratch.

The compiled HLO is stable across processes (byte-identical cache keys at
every P), the cache dir is being written (95 entries per cold run), and the
NUTS + HGF graph size is structurally in-range vs state-space baselines —
**the root cause is infrastructure, not production code**.

---

## (b) Evidence Summary by Candidate

### Candidate 1: NUTS sampler step function

**Evidence for:** NUTS cold wall-clock exceeds Laplace wall-clock at matched
shapes: at P=5, NUTS cold 56.7s vs Laplace cold 41.8s (1.36x); at P=20,
NUTS cold 195.4s vs Laplace cold 42.1s (4.6x). NUTS scales
super-linearly with P (56s → 195s → 229s at P=5/20/50) while Laplace is
shape-invariant (~42s at both tested P). So NUTS does add measurable cost.

**Evidence against:** Laplace cache-hit counts (39/91 at P=5/20) prove
the **inner `_single_logp` scan body is reusable across sampler wrappers**
— the NUTS kernel compiles different outer integrator code but reuses the
underlying logp. NUTS wall-clock grows but not because the sampler
step function is pathological — it grows because each new P re-compiles a
new shape of the NUTS outer scan. Cross-process HLO is bit-identical at
every P (21-06 §b), so the NUTS step function is not generating unstable
cache keys.

**Verdict on this candidate:** PARTIALLY SUPPORTED as a co-factor on cold
wall-clock at large P (NUTS-shape-dependence is real) but REFUTED as the
dominant source of the 1.1x cross-process speedup paradox. NUTS does not
defeat the cache — the scheduler does.

### Candidate 2: HGF scan graph size

**Evidence for:** PAT-RL 3-level scan body has ~175 inlined HLO ops/trial
(21-01 §c), which is ~1.8x the LGSSM baseline at ~20-30 ops/step but only
~0.9x the NumPyro 100-state HMM forward-alg baseline at ~200 ops/step.
Total HLO graph at P=3 is 673 ops; extrapolated to P=50 gives ~2.5-3.5k
ops + ~40-80 MFLOPs/draw. Pyhgf-specific structural features include
14 `@_where_*` pytree-leaf clamp calls per scan step and nested
`@partial(jit, static_argnames=...)` decorators on 4 pyhgf sub-functions.

**Evidence against:** **The in-process tracing cache produces 2.0x–2.5x
speedup at P=5 and P=50** (21-05 Obs 2: same-proc-warm 27.9s / cold 55.8s
at P=5 = 2.01x; same-proc-warm 91.9s / cold 229s at P=50 = 2.49x). If the
graph were pathologically large, the in-process cache would also struggle.
It does not. Graph size is **tractable once traced** — the issue is not
graph size, it's cache reuse across Python processes.

**Verdict on this candidate:** REFUTED. The PAT-RL graph is in-range for
state-space-class models (21-01 §c observations 1-4). Graph size alone
does not explain the cross-process persistent-cache-miss pattern.

### Candidate 3: JIT cache key instability (closure-over-data, RESEARCH Risk #5)

**Evidence for:** The PAT-RL path does capture data arrays as closure
constants (21-01 §e: `state_jnp, choices_jnp, reward_jnp, shock_jnp,
mask_jnp, delta_hr_jnp` created at `hierarchical_patrl.py:506-512` and
embedded as `stablehlo.constant` blobs in the compiled graph). This
contrasts with pick_best_cue's traced-args pattern (STATE #106/107).

**Evidence against (DECISIVE):** **HLO text-IR is byte-identical across
SLURM processes at every tested P.** From 21-06 §b:
- `nuts_P5 == pscan_P5_cold == pscan_P5_warm` (total_signature
  `52ce790fb6831595`, scan_body `2f25aed94588c656`, Jaccard 1.000).
- `nuts_P20 == pscan_P20_cold` scan_body EQUAL (`8f7389e0d0d5b748`).
- `pscan_P50_cold == pscan_P50_warm` scan_body EQUAL
  (`62fbc95475cb0a32`).
- **XLA-emitted cache keys identical cold vs warm at P=5**: seven
  `jit_scan-{03f89614, 1ec79288, 6b3ba0a8, 7d77cd68, 9c682c4c,
  be5a09c2, c450ea14}` keys match exactly.

If closure-over-data were generating cache-key instability between
processes, the text IR would drift. It does not. The sha256 is stable;
XLA's own cache keys are stable.

**Verdict on this candidate:** **FALSIFIED** by 21-06 HLO-identity
evidence. Closure-over-data is NOT the root cause. This is an important
NEGATIVE result — it contradicts the working hypothesis 21-04/21-05
carried into 21-06.

### Candidate 4: Cache initialization bug (RESEARCH §Known Pitfalls #6)

**Evidence for:** RESEARCH warned of a scenario where a JAX array is
created before `JAX_COMPILATION_CACHE_DIR` is set, causing silent
misses. Would manifest as empty cache directory despite completed runs.

**Evidence against:** The cache dir **is being written to**. Each
`pscan_P{5,20,50}_cold.log` records 95 `Writing to persistent
compilation cache` lines (21-06 §a fallback table). The user-pasted
`ls -la /scratch/fc37/$USER/.jax_cache_gpu/` shows 13 populated
compute-node subdirs totalling 1.8G. Cache files on disk; no init bug.

**Verdict on this candidate:** REFUTED. Cache writes are happening.
The failure mode is not "cache never populated" but "cache populated
on node A, next job scheduled on node B".

### Candidate 5: Tracing-cost paradox (JAX #22281)

**Evidence for:** HLO IR is stable across processes (Candidate 3
evidence) AND the cache fires on write (Candidate 4 evidence) AND the
cross-process warm wall-clock is still ~100% of cold (21-05 Obs 1).
This is exactly the JAX #22281 pattern: the XLA cache hits but the
tracing cost dominates total wall-clock.

**Evidence against:** **Track (iii) REFRAMED is sufficient on its own.**
Given that 13 per-node cache subdirs exist (21-06 §a) and Phase 14 job
54899271 routed to `m3a118` (`cluster/logs/bench14_54899271.out:38`),
the "cache is full but warm is slow" observation is fully explained by
node non-coresidency without invoking tracing dominance.

**Verdict on this candidate:** ALSO CONSISTENT but NOT REQUIRED. This
hypothesis remains as a residual concern — if, after fixing the per-node
scope issue, single-node-pinned benchmarks STILL show sub-2x warm
speedup, that would be evidence for residual JAX-tracing dominance.
Flagged as follow-up backlog after primary fix lands.

### Candidate 6: Shape polymorphism failure (Phase-1 N=2 vs Phase-2 N=50)

**Evidence for:** 21-06 §c directly measures this. The `pscan_P5_cold`
scan body (hash `2f25aed94588c656`, size 4,771,952 B) is
**structurally different** from the `pscan_P50_cold` scan body (hash
`62fbc95475cb0a32`, size 4,786,267 B). Per-module Jaccard at P=5 vs
P=50 is **0.180** — 82% of modules differ in text IR. The 15-byte
delta is sufficient to change the XLA cache key.

Phase 14 `14_benchmark_gpu.slurm` Phase-1 runs an N=2 warm-up then
Phase-2 runs N=50 production; the N=2-shape cache cannot serve N=50
lookups under the current vmap-based cohort dispatcher.

**Evidence against:** None — this IS a real, independent issue.

**Verdict on this candidate:** SUPPORTED as an **independent secondary
finding**. The Phase 14 N=2 warm-up adds compile time without
accelerating the N=50 production measurement. Recommend deleting it.
BUT this is NOT the dominant cause of the 1.1x paradox — even if N=2
were replaced with N=50 warm-up, the cross-process cache miss would
persist due to the per-node scope issue (Candidate 3's falsification
plus Candidate 8's SUPPORTED finding together imply the N=50-to-N=50
cross-SLURM-job lookup also misses under the current infrastructure).

### Candidate 7: Warmup_params duplication confound (RESEARCH Risk #4)

**Evidence for (null):** RESEARCH worried that if
`fit_batch_hierarchical` did not accept `warmup_params`, the warm call
would re-run NUTS window adaptation and burn ~1100s redundantly.

**Evidence against (DECISIVE):** 21-02 SUMMARY §Decisions-Made #1
records that `fit_batch_hierarchical` **does** accept `warmup_params`
(signature verified at `src/prl_hgf/fitting/hierarchical.py:2012`).
Patch C in 21-02 Task 1 landed without a Wave-2 blocker: the cold call
captures `(idata, adapted_params)`, the warm call passes
`warmup_params=adapted_params`. Duplicate window adaptation is not
happening.

**Verdict on this candidate:** CONFOUND DISSOLVED. The 1965s warm
wall-clock in job-54899271 is NOT inflated by duplicate NUTS window
adaptation — the instrumented harness (21-02 Patch C) already avoids
that. The full 1965s is the real cross-process re-compile cost, which
is fully attributable to the per-node cache scope issue (Candidate 8).

### Candidate 8: Per-node cache scope vs SLURM scheduler mismatch

**Evidence for (STRONG, primary):**

1. **13 distinct per-node cache subdirs exist on the cluster**
   (`m3g107, m3g109, m3g111, m3g113, m3g114, m3g115, m3g118, m3g119,
   m3a118, m3n101, m3n103, m3n109, m3n112`) totalling 1.8G (21-06 §a
   user paste).
2. **Phase 14 job 54899271 routed its cache into `m3a118/`**
   (`cluster/logs/bench14_54899271.out:38`: `JAX_COMPILATION_CACHE_DIR
   = /scratch/fc37/aman0087/.jax_cache_gpu/m3a118`). Any subsequent
   benchmark on a different node saw an empty cache.
3. **SLURM scripts set per-node cache explicitly**:
   `cluster/14_benchmark_gpu.slurm:99`,
   `cluster/21_diagnose_{laplace,nuts,pscan}.slurm`, all route via
   `${SLURMD_NODENAME:-local}` suffix.
4. **Warm-job first-miss-then-write-then-hit pattern**: at P=5, the
   warm SLURM job writes 95 entries (21-06 §a fallback table) — same
   as the cold job just wrote 60s earlier — because it landed on a
   different node whose cache subdir was empty.
5. **The P=20-warm 138-hit/0-write anomaly** (21-06 §a point 3) is
   cleanly explained: that warm job co-located with its cold
   predecessor on the same node. At P=5 and P=50, the warm jobs
   landed on different nodes than their cold predecessors and got
   ~0% speedup.
6. **P-sweep CSV numbers confirm at production scale**: at P=50,
   `cold_jit_s = 229s` and `next_proc_warm_s = 229s` → ratio 1.00x
   (`jit_scaling_sweep.csv` rows 4, 7). This is NOT a
   small-problem-size artifact; it is present at production shape.

**Evidence against:** None. Track (iii) REFRAMED in 21-06 §d is STRONG
and self-sufficient.

**Verdict on this candidate:** **CONFIRMED — THE DOMINANT BOTTLENECK.**
Per-node cache scope is intentional (it avoids concurrent-write
contention when multiple jobs land on the same node) but it defeats the
"persistent cache speeds up future SLURM jobs" promise when SLURM
reassigns jobs across nodes. This fully explains job-54899271's 1.1x
speedup without any additional hypothesis.

---

## (c) PR-Level Fix Recommendation

**File:** `cluster/14_benchmark_gpu.slurm` (primary), also
`cluster/21_diagnose_pscan.slurm`, `cluster/21_diagnose_laplace.slurm`,
`cluster/21_diagnose_nuts.slurm`, `cluster/08_power_sweep.slurm`,
`cluster/16_smoke_test_gpu.slurm`, `cluster/patrl_smoke.slurm`,
`cluster/18_smoke_patrl_cpu.slurm`, `cluster/16_smoke_test_cpu.slurm`
(secondary — same formula, same fix).

**Function / line target:** The cache-dir export block at
`cluster/14_benchmark_gpu.slurm:99`:

```bash
export JAX_COMPILATION_CACHE_DIR="/scratch/${_PROJECT}/${USER}/.jax_cache_gpu/${SLURMD_NODENAME:-local}"
```

**Patch shape (recommended: option A — explicit node pinning):**

```bash
# --- at the top of the SBATCH directive block ---
#SBATCH --nodelist=m3a118          # pin benchmark runs to a single A100 node
#                                   # so persistent-cache hits across afterok
#                                   # chains. Pick the node via `sinfo -p
#                                   # m3-gpu` first; any single-node pin works.
```

**Alternative (option B — network-shared cache dir):**

```bash
# --- replace the cache-dir line with: ---
export JAX_COMPILATION_CACHE_DIR="/scratch/${_PROJECT}/${USER}/.jax_cache_gpu/shared"
#  (drop the ${SLURMD_NODENAME} suffix entirely — cache becomes cross-node)
```

Option B requires confirming that `/scratch/${_PROJECT}/` is a
network-shared mount (it likely is on M3 MASSIVE's Lustre layout, but
verify with `findmnt /scratch/fc37`) AND accepting the concurrent-write-
contention risk that the per-node split was originally designed to avoid.

**Why option A is preferred:** Surgical, two-line patch, zero risk of
concurrent-write contention, and it matches the architectural directive
"isolate before fixing". Node pinning is reversible (just delete the
`#SBATCH --nodelist` line); moving to a network-shared cache is
harder to undo if contention turns out to be a real issue at scale.

**Secondary patch (independent, also recommended):** delete the Phase-1
N=2 warm-up step in `cluster/14_benchmark_gpu.slurm`. Per 21-06 §c, the
N=2 scan body (4,771,952 B) is structurally different from the N=50
scan body (4,786,267 B) under the current vmap-based cohort dispatcher
(Jaccard 0.180). Replace Phase-1 with a direct N=50 cold + in-process
warm measurement. This is an independent fix and should be combined
with the node-pinning patch.

**Explicitly do NOT:** port `src/prl_hgf/fitting/hierarchical_patrl.py::
_build_patrl_log_posterior` closure to the STATE #106/107 traced-args
pattern. That was the 21-05-leading hypothesis (RESEARCH Risk #5) and is
FALSIFIED by 21-06 HLO identity evidence. Such a refactor would be a
large production-code change with zero measurable effect on the
cross-process cache miss.

---

## (d) Follow-up Plan

**Recommended plan:** new **gap-closure plan `14.1-07`** under
`.planning/phases/14-integration-gpu-benchmark/`.

**Justification:** The fix lives in cluster infrastructure (SLURM
scripts), not in production `src/` code. It unblocks Phase 14.1-03
(BlackJAX benchmark resubmission) directly — wrong order would be to
resubmit 14.1-03 first and watch it time out again at 8h with a 1.1x
speedup.

- A **new integer phase** (e.g. `22-patrl-cache-fix`) is overkill for
  a two-line SBATCH directive + a CSV-measurement verification.
- A **quick-NNN under `.planning/quick/`** is too light — the fix
  includes a cross-job verification run (P=50 cold-then-warm) that
  itself uses a cluster submission, and the result needs to be
  captured in a SUMMARY so Phase 14.1-03 can cite it.
- A **14.1-07 gap-closure** is the right size: it adds one plan to the
  existing 14.1-01 through 14.1-06 chain, names the prerequisite for
  14.1-03, and captures the verification-run output as a per-commit
  artifact. It does NOT bloat to a full integer phase.

**Scope of 14.1-07:**

1. Add `#SBATCH --nodelist=<node>` to `cluster/14_benchmark_gpu.slurm`
   (and optionally the `21_diagnose_*` SLURM files for regression-
   testing Phase 21's 1.1x reproduction at P=50 after the fix).
2. Delete the N=2 Phase-1 warm-up block in
   `cluster/14_benchmark_gpu.slurm` (secondary patch from §c).
3. Submit a single cold-then-warm chain at P=50 via
   `cluster/21_submit_pscan_chain.sh` forced to the pinned node.
4. Measure: `next_proc_warm_s / cold_jit_s` should rise from 1.00x
   (baseline) to >= 3.0x (target).
5. If the test passes, unblock 14.1-03. If it fails (sub-2x), promote
   Track (i) JAX #22281 tracing paradox to primary and open a new
   residual-concern plan.

---

## (e) Success Criterion for the Fix

**Test:** Re-run the P-sweep cross-process chain at P=50 after
applying the node-pinning patch. Specifically:

```bash
# On M3, after `--nodelist=<pinned>` is added and pushed:
bash cluster/21_submit_pscan_chain.sh  # submits the 6-job chain
# Wait for completion, then check jit_scaling_sweep.csv
```

**Expected outcome (quantitative invariant):**

1. **Primary:** `next_proc_warm_s / cold_jit_s` ratio at P=50 **>= 3.0x**
   (currently 229s / 229s = 1.00x). Target: next_proc_warm_s <= 75s
   at P=50 (matching the in-process same_proc_warm_s of 93s ± tolerance).
2. **Secondary:** Cold JIT at P=50 remains <= 300s (sanity check that
   the per-node pin did not inadvertently route to a slower node).
3. **Regression check:** P=5 same_proc_warm speedup stays >= 2.0x (no
   regression vs baseline 2.01x).

**Follow-on:** after the P-sweep invariant passes, resubmit
`cluster/14_benchmark_gpu.slurm` (via 14.1-03) and confirm:
- Cold JIT < 500s (currently 2197s in job-54899271 — the 4x reduction
  comes from deleting the N=2 warm-up + letting the cache actually hit).
- Warm JIT / cold JIT ratio > 3x.
- `per_iteration_s` written to `results/power/benchmark_batched.json`
  with a finite value.

**Command to run (14.1-07 verification):**

```bash
# On M3:
cd ~/psilocybin_prl_analyses
git pull origin main
bash cluster/21_submit_pscan_chain.sh
# Wait ~40min for the 6-job chain.
python -c "import pandas as pd; d = pd.read_csv('.planning/phases/21-benchmark-bottleneck-diagnosis/jit_scaling_sweep.csv'); p50 = d[d.P==50]; print('next/cold ratios @ P=50:', (p50.cold_jit_s / p50.next_proc_warm_s).tolist())"
# Expect: all values >= 3.0
```

---

## (f) 14.1-03 Unblock Signal

**14.1-03 CANNOT proceed as-is; it must wait for 14.1-07 to land the
node-pinning patch.** Resubmitting `cluster/14_benchmark_gpu.slurm`
today would reproduce the 1.1x speedup and time out at 8h again
(possibly worse, because N=50 is strictly larger than the 14.1-01
default that job-54899271 ran). 14.1-03's first task should change
from "submit SLURM with SAMPLER=blackjax" to "verify 14.1-07 landed
(grep -c '#SBATCH --nodelist' cluster/14_benchmark_gpu.slurm should
be 1) before submitting".

---

## (g) Deferred / Out-of-Scope

- **`apply_decision_gate` threshold tightening (STATE #105).** Deferred
  until `results/power/benchmark_batched.json` is written by 14.1-03
  after 14.1-07 lands. The tightened thresholds must be calibrated
  against the BlackJAX cluster-real per_iteration_s, not the
  conservative NumPyro defaults.
- **VB-Laplace as production fit-path fallback (CONTEXT.md deferred
  idea).** Not needed — the NUTS path is not infeasible; P=50 is
  marginal (229s cold) but tractable once cross-process cache hits
  land. Leave as backlog note.
- **Shape-polymorphic cohort dispatcher** (20-07's backlog idea for
  making the N=2-vs-N=50 warm-up actually warm). Out of scope;
  requires rewriting the NUTS sampler's scan signature to use
  `jax.export.symbolic_shape("P")`. Document as future Phase X-Y.
- **P=20 in-process warm pathology (1.09x speedup vs 2.0x at P=5/50).**
  Residual orthogonal concern. 21-05 Obs 2 + 21-06 §b data show the
  HLO is byte-identical cold vs warm at P=20 (`nuts_P20 ==
  pscan_P20_cold` scan_body EQUAL), so it's NOT a closure-over-data
  issue; likely an XLA-backend code-path difference at the specific
  P=20 tensor shape. Not a production concern (P=20 is a diagnostic
  shape, never production). Leave as backlog note.
- **Track (i) JAX #22281 tracing paradox.** Not required given Track
  (iii) REFRAMED is sufficient. Revive only if 14.1-07's single-node-
  pinned benchmark still shows sub-2x warm speedup.

---

## (h) Phase 21 SC Closure Checklist

| SC | Status | Evidence |
|----|--------|----------|
| SC1 — graph scope memo (state-space baselines) | satisfied | `benchmark-scope-memo.md` §c: PAT-RL 3-level 23-direct/~175-inlined ops/trial vs NumPyro 100-state HMM ~200 ops/step; pick_best_cue 3-level 427-direct/~1170-inlined ops/trial; state-space-only comparison (no 8-schools/Radon/BNN/transformer/CNN). |
| SC2 — VB-Laplace-vs-NUTS JIT (vb_laplace_vs_nuts_jit.json, 7-value enum) | satisfied | `vb_laplace_vs_nuts_jit.json` has `per_stage_compile_events`, `per_call_wall_clock`, `per_p_scaling`, `nuts_per_p_scaling`, `bottleneck_verdict.bottleneck_layer` ∈ 7-value enum, `hlo_op_counts` filled from 21-01. |
| SC3 — cache forensics | satisfied | `cache_forensics.md` 6 sections; HLO hash matrix; Jaccard overlap; XLA-key bit-identity at P=5; user-pasted 13-per-node-subdir cache tree; three-way track reconciliation (Track iii STRONG; Track ii FALSIFIED; Track i also consistent). |
| SC4 — P-sweep (P ∈ {5, 20, 50}) | satisfied | `jit_scaling_sweep.csv` has 8 rows (3 × P=5, 3 × P=20, 2 × P=50) all status=completed. P=2 dropped per planner judgment; status column replaces jit_wall_clock_s. |
| SC5 — root-cause verdict | satisfied | this document names `cache_key` (per-node cache scope vs SLURM scheduler mismatch) + PR-level fix (node-pinning in `cluster/14_benchmark_gpu.slurm:99`) + follow-up plan (14.1-07) + success criterion (next_proc/cold >= 3x at P=50). |
| SC6 — diagnostic-only scope | satisfied | `git diff --stat src/` == 0 across the whole phase; `git diff --stat results/` == 0; `apply_decision_gate` thresholds unchanged. New code confined to `scripts/08_run_power_iteration.py` diagnostic helpers (additive), `cluster/21_*.slurm` + `.sh` files, and `.planning/phases/21-*/*` artifacts. |
| SC7 — fast feedback loop | satisfied | All SLURM jobs in Phase 21 ran ≤30min walltime per 21-02/03/04/05 probe slurm files; no job used the 8h production budget. P-sweep chain total wall-clock was ~60min across 6 jobs. |

---

## Summary for downstream readers

- **Bottleneck:** `cache_key` — per-node cache scope + SLURM
  no-node-affinity across `afterok` chains. NOT production code.
- **Fix:** two-line SBATCH patch (`--nodelist=<pinned>`) + delete
  Phase-1 N=2 warm-up block. Lives in `cluster/14_benchmark_gpu.slurm`.
- **Follow-up:** new gap-closure plan `14.1-07` (node-pin + verify).
- **Unblocks:** Phase 14.1-03 (BlackJAX benchmark resubmission) will
  proceed after 14.1-07 lands.
- **Orthogonal secondary fix:** delete N=2 warm-up — independently
  justified by Jaccard 0.180 cross-P HLO divergence (21-06 §c).
- **Falsified hypothesis:** closure-over-data refactor of
  `hierarchical.py:1144 _one_step` is NOT warranted; 21-05's leading
  candidate is refuted by 21-06 HLO byte-identity evidence.

---

*End of VERDICT. No production code touched. No fix implemented here —
that is 14.1-07's job.*
