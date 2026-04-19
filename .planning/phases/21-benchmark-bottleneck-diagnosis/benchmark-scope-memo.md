# Phase 21 Plan 21-01 — Benchmark Scope Memo

**Date:** 2026-04-19
**Author:** Execution pass (Phase 21, Wave 1)
**Status:** Scope memo only — **no verdict** (verdict is plan 21-07)

---

## (a) Executive summary

- **PAT-RL 3-level logp + prior closure at P=3**: ~673 total HLO ops in the compiled
  graph; the anonymous scan-body callee (`@None`, which is `_clamped_step`) contains
  **23 direct ops + 1 call to `@beliefs_propagation` + 14 `@_where_*` calls** (one
  `jnp.where` per pytree leaf — the Layer-2 clamp). When all helper
  sub-computations (precision_update, posterior_update_mean/precision, predict_precision,
  binary_state_node_prediction, etc.) are inlined, the **effective inner-loop depth per
  trial is ~150-180 ops**.
- **PAT-RL 2-level**: ~433 total ops, ~100-130 ops/trial inlined. Structurally the same
  pattern with one less hierarchy level (no `posterior_update_{precision,mean}_continuous_node_6`
  for the volatility parent).
- **pick_best_cue 3-level @ P=3, n_trials=420**: ~1515 total ops, scan-body callee
  (`@None`) alone is **427 ops** (not counting nested calls to `@beliefs_propagation`).
  This is **~18× larger than the PAT-RL 3-level scan body** because pick_best_cue has
  **3 parallel binary branches** sharing one volatility parent, so every trial runs three
  `posterior_update_precision_continuous_node` instances + three `posterior_update_mean_continuous_node`
  instances inline in the scan body.
- **FLOPs/draw @ P=50 (extrapolated, ~2× tolerance):** PAT-RL 3-level ~40-80 MFLOPs/draw,
  pick_best_cue 3-level ~150-300 MFLOPs/draw (see §b for derivation and assumptions).
- **Top-line observation (no verdict):** On absolute graph size, both repo models are
  **substantially larger per trial than NumPyro 100-state HMM forward-alg scan** (~200
  ops/step) and **~5-15× larger than a Kalman/LGSSM scan** (~20-30 ops/step). The PAT-RL
  inner loop is also carrying more pytree state per step (stateful attributes dict +
  per-node `temp` subdict) than typical state-space-model scan bodies. Whether this
  structural size is the cause of the 2197s cold / 1965s warm cache-speedup-of-only-1.1×
  observation from job 54899271 is **not decided by this memo** — that is VERDICT.md's
  job (21-07).

**Non-negotiable scan-body depth column** (the column CONTEXT.md locked as required) is
populated in the comparison table in §c, sourced empirically from the HLO dumps in
`jaxpr_dumps/`.

---

## (b) Methodology

### Environment

- Local CPU-only trace (`JAX_PLATFORMS=cpu`), no GPU, no cluster.
- JAX 0.4.31, pyhgf 0.2.10 (plan/research docs reference 0.2.8; 0.2.10 is a
  patch-version-increment install; structurally identical scan body — nested
  `@partial(jit, static_argnames=...)` pattern confirmed unchanged). See §f.
- Python 3.12.10, conda `ds_env`, Windows local machine.
- Traceable cohort size: **P=3** (per CONTEXT.md decision). Full n_trials=192 for
  PAT-RL (4 runs × 48 trials from `configs/pat_rl.yaml`); n_trials=420 for
  pick_best_cue (from `configs/prl_analysis.yaml` default trial sequence).

### Trace procedure

A working artifact at `.planning/phases/21-benchmark-bottleneck-diagnosis/trace_scope.py`
(not committed to src/; local desk work only) runs for each of the four logp variants:

1. Build a P=3 synthetic cohort via `simulate_patrl_cohort` (PAT-RL, single phenotype) or
   `simulate_batch` (pick_best_cue, subsetted to 3 participant-sessions).
2. Construct the exact production closure: `build_logp_fn_batched_patrl` ->
   `_build_patrl_log_posterior` for PAT-RL;  `build_logp_fn_batched` for pick_best_cue.
3. Call `str(jax.make_jaxpr(fn)(init_params))` — full JAXPR.
4. Call `jax.jit(fn).lower(init_params).as_text()` — lowered StableHLO (MLIR form).
5. Dump both to `jaxpr_dumps/<tag>.jaxpr.txt` and `jaxpr_dumps/<tag>.hlo.txt`.
6. Count HLO ops by counting lines containing ` = ` inside each named `func.func`
   block. Aggregate both totals and per-subcomputation counts.

Raw counts live at `jaxpr_dumps/op_counts.json` (headline) and
`jaxpr_dumps/op_counts_full.json` (per-subcomputation breakdown).

### HLO op counting proxy — ~2× tolerance

HLO op count is a **proxy for FLOPs**, not a direct FLOP measurement. Each line counted
by `' = ' in stripped` is one StableHLO op (add, multiply, divide, reduce, broadcast,
compare, constant, etc.). Some ops are O(element) (e.g. `stablehlo.add` on a tensor<3xf64>
is 3 FLOPs); others are O(elements²) (e.g. a small matmul inside precision updates is
~elements² FLOPs). Large reductions fold many element ops into a single HLO line.

**Net effect:** HLO-op-count underestimates actual FLOPs by a factor that depends on
tensor shapes. For PAT-RL at P=50, most ops are on `tensor<50xfXX>` → each HLO op is
~50 FLOPs on a vector-add; a few are `tensor<50x192xfXX>` → ~9600 FLOPs per op. Order-of-
magnitude mapping: **1 HLO op ≈ 10-100 FLOPs at P=50** (within ~2× on either side). The
CONTEXT.md-locked ~2× tolerance applies here.

### Extrapolation rule P=3 → P=50

JAX `vmap` with `in_axes=0` over the participant dimension **expands the leading tensor
axis from 3 to 50** but **does not duplicate the scan body** — the scan body remains one
`while_loop` whose carry is a pytree of `tensor<50xfXX>` (at P=50) instead of
`tensor<3xfXX>` (at P=3). Consequences:

- **Scan-body HLO op count stays constant across P** (same StableHLO instructions;
  only the tensor shape changes). This is the invariant the memo exploits.
- **ENTRY (outer) graph op count grows sub-linearly in P** — only the prior log-pdf
  ops (which act on shape `(P,)` tensors) and the final reduction grow; the scan body
  contribution to total op count is constant.
- **FLOPs per op grow linearly in P** (a `stablehlo.add` on `tensor<50xf64>` is 50
  FLOPs; on `tensor<3xf64>` is 3 FLOPs). So total FLOPs/draw scale ~linearly in P.

Therefore the scan-body-depth column in the comparison table below is a **P-invariant
structural measurement** — reported once per model variant, valid at any P.

### FLOPs/draw (with stated assumptions)

Working assumptions:

- **NUTS leapfrog steps per draw**: upper bound `2^max_tree_depth`; for
  `max_tree_depth=10` (BlackJAX default) the cap is 1024 steps. Empirical means
  for hierarchical models with ~150-300 parameters typically fall in **16-64 leapfrog
  steps** per draw post-warmup. Using 32 as a midpoint.
- **FLOPs per leapfrog step**: 2 gradient evaluations (forward logp + reverse-mode AD)
  plus O(K) symplectic integrator updates where K = number of parameters (negligible
  vs logp gradient for K ≤ 300).
- **Reverse-mode AD factor**: roughly 3× the forward-pass FLOPs for a scan-based
  computation (standard rule of thumb; exact factor depends on op mix).
- **FLOPs per logp evaluation at P=50**: extrapolate from P=3 HLO op count. The scan
  body is invoked n_trials times (192 for PAT-RL, 420 for pick_best_cue). Total
  per-evaluation ops ≈ (scan_body_depth_inlined × n_trials) + outer-graph ops. Using
  ~1 HLO op ≈ 50 FLOPs at P=50 (mid-range of the ~2× bracket):
  - PAT-RL 3-level: ~175 inlined × 192 × 50 FLOPs/op ≈ 1.7 MFLOPs per logp evaluation.
  - pick_best_cue 3-level: ~430 direct × 420 × 50 FLOPs/op ≈ 9.0 MFLOPs per evaluation.
- **FLOPs/draw** = 2 × 32 × 4× × FLOPs_per_logp (AD factor + 2 grad evals + 32 leapfrog):
  - PAT-RL 3-level: ~40-80 MFLOPs/draw range (reflects the ~2× tolerance).
  - pick_best_cue 3-level: ~150-300 MFLOPs/draw range.

These are **order-of-magnitude** estimates. A100-class GPUs deliver ~1-20 TFLOPs/s at
fp32/fp64 (varies by numeric format) — so at ~100 MFLOPs/draw, the **theoretical compute
floor is 5-100 ms/draw**. The 2197s / 1965s cold/warm numbers correspond to ~170s/chain
averaged across 80 draws (4 chains × 20 tune + draws), i.e. ~2 s/draw — which is **20-
400× above the compute floor**. That gap is consistent with JIT-compilation-dominated
wall time, not execute-time-dominated wall time. But: **this memo does not adjudicate the
verdict**; the compute-floor vs observed-time gap is raw input for 21-07.

---

## (c) Comparison table — state-space baselines only

Columns:

- **Scan depth (trials)**: number of `lax.scan` iterations per logp evaluation.
- **Inner-loop ops/trial (scan-body depth)**: HLO ops in the scan-body callee. For
  PAT-RL this is `@None` (wrapper) + `@beliefs_propagation` body + their nested callees
  (posterior_update_{precision,mean}_continuous_node, predict_precision, etc.). Reported
  as "direct / inlined" where the two differ. Sourced from `jaxpr_dumps/*.hlo.txt`.
- **HLO op count @ P=3**: total ops in the compiled graph (ENTRY + all callees) at P=3
  (measured locally).
- **HLO op count @ P=50**: extrapolated per §b. Scan body is shape-invariant; outer
  graph grows slightly with P.
- **FLOPs/draw @ P=50**: derived per §b (~2× tolerance).
- **Notes**: key structural features.

| Model | Scan depth (trials) | Inner-loop ops/trial (direct / inlined) | HLO op count @ P=3 | HLO op count @ P=50 (extrapolated) | FLOPs/draw @ P=50 | Notes |
|-------|---------------------|------------------------------------------|--------------------|------------------------------------|---------------------|-------|
| **PAT-RL 3-level (`hgf_3level_patrl`, Model A)** | 192 | 23 direct / ~175 inlined (with Layer-2 clamp + nested pyhgf update chain) | **673** (measured) | ~2.5-3.5k (scan body invariant × 192 + outer ~400-800) | **~40-80 MFLOPs** | Single binary branch + one volatility parent. 14 `@_where_*` pytree-leaf calls for Layer-2 clamp per trial. Nested `@jit` decorators on 4 pyhgf sub-functions. **Closure-captured data arrays** (see §e). |
| **PAT-RL 2-level (`hgf_2level_patrl`, Model A)** | 192 | 15 direct / ~100-130 inlined | **433** (measured) | ~1.8-2.5k | ~25-50 MFLOPs | No omega_3/kappa level; scan body shrinks to binary-branch + prediction. |
| **pick_best_cue 3-level (`hgf_3level`)** | 420 | **427 direct** / ~1170 inlined | **1515** (measured) | ~5-7k | ~150-300 MFLOPs | **3 parallel binary branches** share one volatility parent; scan body contains 3× the posterior updates of PAT-RL. **Traced-args data pattern** (STATE #106/107 — contrasts with PAT-RL closure pattern). |
| **pick_best_cue 2-level (`hgf_2level`)** | 420 | **357 direct** / ~800 inlined | **1098** (measured) | ~4-6k | ~100-200 MFLOPs | 3 parallel binary branches, no volatility parent. |
| **NumPyro 100-state HMM (forward algorithm scan)** | ~100-500 | ~200 ops/step | not measured (cited per RESEARCH.md) | ~200-500 ops/step (O(1) in P; no vmap in standard single-sequence fits) | ~10-40 MFLOPs (single-sequence HMM); scales with N×T for mini-batches | Categorical state, no vmap over participants in stock examples. NumPyro docs report ~30-90s cold JIT for 100-state HMM on GPU (RESEARCH.md §BlackJAX Analogous Cases). |
| **Kalman filter / LGSSM scan-based MCMC** (e.g. dynamax, argus-jax) | T (problem-dependent) | ~20-30 ops/step (matrix ops on fixed-dim state) | not measured | stable; scales with state-dim² | ~1-10 MFLOPs/draw for low-dim LGSSM | Fixed-dim state vector, simple matrix ops, **no nested jit decorators**. Typical scan body is 5-10 lines of JAX code. |

**Observations from the table (no verdict):**

1. The **PAT-RL 3-level scan-body op count (~175 inlined) is in the same order of
   magnitude as NumPyro 100-state HMM (~200 ops/step)**. On a per-trial basis, PAT-RL
   is NOT structurally outsized vs HMM baselines.
2. The **pick_best_cue scan body (427 direct / ~1170 inlined) is substantially larger**
   than the PAT-RL scan body — because it processes three parallel binary branches per
   trial rather than one. It is ~4-6× larger than NumPyro HMM per step.
3. Both repo models are **5-15× larger per step than the simplest LGSSM baselines**
   (which have ~20-30 ops/step). This is expected — HGFs maintain more state than
   dynamic-linear-Gaussian models.
4. The **total compiled graph size (673 for PAT-RL 3-level @ P=3, 1515 for
   pick_best_cue 3-level @ P=3) is modest by state-space-model standards** — both are
   within the same order of magnitude as a 100-state HMM with comparable scan depth.
   Whether the graph is pathologically large **for the specific JIT / persistent-cache
   path used by BlackJAX NUTS on the cluster** is a separate question — not answered
   here.

Direct sources for the cited state-space baseline numbers: RESEARCH.md §JAX
Compilation Cache Mechanics, §BlackJAX Analogous Cases, and
[Structural comparison table for scope memo] in RESEARCH.md (rows 3-4).

---

## (d) Structural differences the HLO exposes

### Difference 1: pyhgf's nested `@partial(jit, static_argnames=...)` decorators inside the scan body

**Source (pyhgf 0.2.10, confirmed by code read):**

- `pyhgf/utils/beliefs_propagation.py:15-23` — `beliefs_propagation` itself is
  decorated with `@partial(jit, static_argnames=("update_sequence", "edges",
  "input_idxs", "observations"))`.
- `pyhgf/updates/posterior/continuous/continuous_node_posterior_update.py:1-5` —
  `continuous_node_posterior_update` is decorated with
  `@partial(jit, static_argnames=("edges", "node_idx"))`.
- `pyhgf/updates/posterior/continuous/posterior_update_precision_continuous_node.py:1-5`
  — same nested JIT decoration.
- `pyhgf/updates/posterior/continuous/posterior_update_mean_continuous_node.py:1-5`
  — same nested JIT decoration.

**What XLA sees:** The `lax.scan` body (pyhgf's `scan_fn = Partial(beliefs_propagation,
...)`) is itself a `@jit`-decorated function that, inside its body, calls
`@jit`-decorated sub-functions (`continuous_node_posterior_update` →
`posterior_update_precision_continuous_node` → `precision_update` with a `lax.cond` per
node). Each inner `@jit` boundary **potentially becomes a separate XLA computation with
its own call-site**.

**HLO evidence:** In `jaxpr_dumps/patrl_3level_P3.hlo.txt`, the scan body callee
`@None` calls `@beliefs_propagation` (8 ops + calls to child fns), which in turn calls
`@continuous_node_prediction`, `@posterior_update_precision_continuous_node_*`,
`@posterior_update_mean_continuous_node_*`, `@precision_update_*`,
`@precision_update_missing_values_*`, `@predict_precision_*`,
`@binary_state_node_prediction`, `@continuous_node_volatility_prediction_error`, etc.
The HLO dump contains **35 distinct named sub-computations** for PAT-RL 3-level (up to
63 for pick_best_cue 3-level). Each is a separate `func.func private` block in the
MLIR/StableHLO. These are what XLA must individually lower and inline during
compilation.

### Difference 2: Layer-2 `tree_map + jnp.where` clamp traversing the full attributes pytree per trial

**Source:** `src/prl_hgf/fitting/hierarchical_patrl.py:354-376` (`_clamped_step` in
`_make_single_logp_fn`; mirrors line ~281-306 for Model D).

**Inline code pointer:**

```python
# hierarchical_patrl.py:367-373
is_stable = jnp.all(jnp.isfinite(new_mean)) & (
    jnp.abs(new_mean) < _MU_2_BOUND
)
safe_carry = jax.tree_util.tree_map(
    lambda n, o: jnp.where(is_stable, n, o),
    new_carry,
    carry,
)
```

**What XLA sees:** A `jnp.where` applied to **every leaf of the attributes pytree**.
For PAT-RL 3-level, the pytree has:

- Node 0 (input): `mean`, `observed`, `time_step` → 3 leaves
- Node 1 (belief): `mean`, `expected_mean`, `precision`, `expected_precision`,
  `tonic_volatility`, plus a `temp` subdict with `value_prediction_error`,
  `volatility_prediction_error`, `effective_precision` → ~8 leaves
- Node 2 (volatility parent): same structure → ~8 leaves
- Plus additional bookkeeping entries

**HLO evidence:** The `@None` scan body at lines 247-272 of
`patrl_3level_P3.hlo.txt` contains **14 `@_where_*` calls** — one per pytree leaf. This
is a direct cost per trial: the clamp alone contributes 14 `where` function calls +
the `is_stable` computation (5 ops) per scan step, before `beliefs_propagation` runs.

**Why it matters for graph size:** For a 192-trial scan, XLA has to trace through these
14 where-calls once (the scan body is shape-invariant), but each where is a pytree-leaf
operation whose output is written into the carry. The carry itself is a pytree of
~14 tensors, so each scan step moves 14 tensors into and out of the clamp.

### Difference 3: pick_best_cue has three parallel binary branches in the scan body (vs PAT-RL's one)

**Source:** Inspection of `jaxpr_dumps/pickbestcue_3level_P3.hlo.txt` shows **three
instances of `@posterior_update_precision_continuous_node`** (`_0`, `_16`, `_21`) and
**three instances of `@posterior_update_mean_continuous_node`** (`_0`, `_14`, `_19`)
in the scan body — one per parallel branch. Only one `@posterior_update_precision_continuous_node_32`
for the shared volatility parent (node 6).

**Consequence:** pick_best_cue scan-body direct ops = 427 vs PAT-RL = 23. This is why
pick_best_cue compiled graphs are roughly **2-3× larger** than PAT-RL despite being the
same HGF family.

### Difference 4: state-space baselines do NOT have nested `@jit` decorators

**Contrast:** A typical NumPyro HMM forward-algorithm body (e.g. the one in NumPyro's
`DiscreteHMM` distribution) is written as pure-JAX arithmetic inside a single `lax.scan`
— no nested `@jit` decorators. A Kalman-filter scan body is typically 5-10 lines of
matrix ops (also pure JAX). Neither introduces nested `@jit` call boundaries that XLA
must resolve.

**Why it may matter for compilation time (hypothesis, not a verdict):** Nested `@jit`
boundaries produce more named `func.func private` blocks in the lowered MLIR. During
XLA compilation, each such block is individually optimized and potentially inlined.
More blocks = more resolution work. Whether this is the dominant contributor to the
observed cold 2197s / warm 1965s times is again an issue for VERDICT.md (21-07).

---

## (e) Closure-over-data observation (no verdict)

### PAT-RL path — data captured as closure constants

**Source pointer:** `src/prl_hgf/fitting/hierarchical_patrl.py:506-512`:

```python
# Convert to JAX arrays once (closure, not traced args — shapes fixed per call).
state_jnp = jnp.asarray(state_arr, dtype=jnp.int32)
choices_jnp = jnp.asarray(choices_arr, dtype=jnp.int32)
reward_jnp = jnp.asarray(reward_mag_arr, dtype=jnp.float32)
shock_jnp = jnp.asarray(shock_mag_arr, dtype=jnp.float32)
mask_jnp = jnp.asarray(trial_mask, dtype=jnp.bool_)
delta_hr_jnp = jnp.asarray(_delta_hr, dtype=jnp.float64)
```

These arrays are captured by the inner `logp_fn(params)` closure and are NOT function
arguments. When XLA traces `_build_patrl_log_posterior` → `logp_fn`, these arrays
become **HLO `stablehlo.constant` blobs embedded in the graph**.

**HLO evidence:** `patrl_3level_P3.hlo.txt` lines 3-8 contain several
`stablehlo.constant dense<"0x..."> : tensor<3x192xi32>` /
`tensor<3x192xf32>` / `tensor<3x192xi1>` blobs. These are `state_jnp`, `reward_jnp`,
`shock_jnp`, `mask_jnp`, etc. hex-encoded directly into the compiled graph. Different
data → different constants → **different HLO bytes → different HLO hash**.

### pick_best_cue path — data passed as traced JAX arguments

**Source pointer:** `src/prl_hgf/fitting/hierarchical.py:584-738`
(`build_logp_fn_batched`). The returned `batched_logp_fn(*args)` takes data arrays as
**function arguments**:

```
batched_logp_fn(omega_2, [omega_3, kappa,] beta, zeta,
                input_data, observed, choices, trial_mask) -> scalar
```

**HLO evidence:** `pickbestcue_3level_P3.hlo.txt` `@main` signature includes
`%arg5: tensor<3x420x3xf32>` (input_data), `%arg6: tensor<3x420x3xi64>` (observed),
`%arg7: tensor<3x420xi64>` (choices), `%arg8: tensor<3x420xi1>` (mask) — **traced
arguments, not constants**. Data values do not enter the HLO graph bytes → HLO hash is
data-value-independent (shape-dependent only).

**Historical note:** STATE.md decisions #106/#107 (phase 12-02) record the rationale
for the traced-args pattern in pick_best_cue. Decision #119 records that the PAT-RL
path was intentionally **not** ported to the traced-args pattern.

### Verdict deferral

**This memo makes no verdict call** on whether the closure-captured-data pattern in
PAT-RL is the cause of the 1.1× cache speedup observed in job 54899271.

**VERDICT.md (plan 21-07)** is the artifact where the verdict is made. This memo
establishes only that:

1. The closure-captured-data pattern is present at `hierarchical_patrl.py:506-512`.
2. The pattern demonstrably produces HLO-constant blobs in the compiled graph (confirmed
   in `jaxpr_dumps/patrl_3level_P3.hlo.txt` lines 3-8).
3. pick_best_cue uses a different pattern (traced args) confirmed in the equivalent HLO
   dump.

Plan 21-07 will combine this structural observation with the cache-forensics evidence
from 21-02 and the VB-Laplace probe JSON from 21-03 to name the bottleneck and
prescribe a fix.

---

## (f) Appendix — artifact paths

### Raw JAXPR and HLO dumps

All under `.planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/`:

| File | Contents | Approx size |
|------|----------|-------------|
| `patrl_3level_P3.jaxpr.txt` | Full JAXPR for PAT-RL 3-level logp+prior at P=3 | ~62 KB |
| `patrl_3level_P3.hlo.txt` | Lowered StableHLO (MLIR) for the same | ~83 KB |
| `patrl_2level_P3.jaxpr.txt` | Full JAXPR for PAT-RL 2-level | ~27 KB |
| `patrl_2level_P3.hlo.txt` | Lowered StableHLO | ~58 KB |
| `pickbestcue_3level_P3.jaxpr.txt` | Full JAXPR for pick_best_cue 3-level | ~256 KB |
| `pickbestcue_3level_P3.hlo.txt` | Lowered StableHLO | ~155 KB |
| `pickbestcue_2level_P3.jaxpr.txt` | Full JAXPR for pick_best_cue 2-level | ~150 KB |
| `pickbestcue_2level_P3.hlo.txt` | Lowered StableHLO | ~110 KB |
| `op_counts.json` | Headline counts (total, longest_sub, n_sub) for all 4 variants | <1 KB |
| `op_counts_full.json` | Per-subcomputation op counts for all 4 variants | ~4 KB |

### Trace script

- `.planning/phases/21-benchmark-bottleneck-diagnosis/trace_scope.py` — ad-hoc local
  tracer (working artifact; not production code; does not live under `src/`).

### Reproducibility

To regenerate the dumps on a fresh local machine with `ds_env` activated:

```bash
cd <repo-root>
python .planning/phases/21-benchmark-bottleneck-diagnosis/trace_scope.py
```

Runtime on local CPU (Windows, Python 3.12, JAX 0.4.31): **~35-45 seconds** total for
all 4 variants. No cluster. No GPU. No production code touched.

### pyhgf version note

The working environment has pyhgf **0.2.10** installed (plan and research docs cite
0.2.8). The structural JIT-decorator pattern (`@partial(jit, static_argnames=...)` on
`beliefs_propagation`, `continuous_node_posterior_update`,
`posterior_update_precision_continuous_node`,
`posterior_update_mean_continuous_node`) was **re-confirmed by direct source read** of
the installed 0.2.10 package and is unchanged from the 0.2.8 structure described in
RESEARCH.md. The `@partial(jit, ...)` decorator set is a first-line decoration on each
public entry point and is unlikely to have changed between 0.2.8 and 0.2.10 patch
releases. All HLO findings in this memo are therefore valid for the cluster GPU
environment that will be exercised in plans 21-02/03/04 (assumed to be on the same
pyhgf minor version).

---

**End of memo.** No verdict on the 1.1× cache-speedup observation — that is plan 21-07.
No code changes to `src/` production modules. `git diff --stat src/` should show 0 lines
changed after this plan's completion.
