# Phase 21 Research: Benchmark Bottleneck Diagnosis

**Researched:** 2026-04-19
**Domain:** JAX JIT compilation cache, pyhgf 0.2.8 scan body, BlackJAX NUTS, VB-Laplace probe instrumentation
**Confidence:** HIGH (code read directly from installed pyhgf 0.2.8, project source, bench logs)

---

## Triggering Observation

Job 54899271 ran `python scripts/08_run_power_iteration.py --benchmark` on node m3a118 (NVIDIA A100 80GB PCIe, CUDA 12.8, ptxas 12.8, XLA parallel compilation confirmed OK). The SLURM script's `_run_benchmark` function ran in two phases:

**Phase 1 (BENCH-05 JIT cache test):** Two back-to-back calls to `fit_batch_hierarchical` at N=2/group (`hgf_3level`, 2 chains, 10 draws, 10 tune):
- Cold JIT: **2197.13s** (~36.6 min)
- Warm JIT: **1964.78s** (~32.7 min)
- Cache speedup: **1.1x** (expected: ≥3x)

The warm call was barely 232s faster than cold. Then Phase 2 attempted the full N=50 production run but the job was killed at exactly 8h (`CANCELLED AT 2026-04-19T14:40:25 DUE TO TIME LIMIT`). The benchmark never wrote `results/power/benchmark_batched.json`.

**Critical diagnostic fact:** The bench log shows `JAX cache: 4 files, 0.0 MB in /scratch/fc37/aman0087/.jax_cache_gpu/m3a118` at startup — meaning 4 stub/directory files but zero substantive content in the persistent cache before Phase 1 began. After cold JIT, there is no log entry showing how many files were written, because `_run_benchmark` (unlike `_run_smoke_test`) does not call `_get_cache_stats` after the cold call. This is a structural gap in the current benchmark harness. Also critical: `JAX_LOG_COMPILES` was `(unset)` — the benchmark ran without compile logging enabled, so there is zero diagnostic output about which functions retraced.

---

## pyHGF 0.2.8 Scan Body Op Inventory

### Network Structure for PAT-RL

Both `build_2level_network_patrl()` and `build_3level_network_patrl()` produce a pyhgf `Network` object. After `net.input_data(...)` primes it, `net.scan_fn` is a `jax.tree_util.Partial` wrapping `beliefs_propagation` with static kwargs: `update_sequence`, `edges`, `input_idxs`. Source: `pyhgf/model/network.py:158-163` and `pyhgf/utils/beliefs_propagation.py`.

### Per-Trial Scan Body Operations

`beliefs_propagation` is called once per trial inside `jax.lax.scan`. Its execution trace per trial for a 3-level binary HGF:

1. **Set attributes[-1]["time_step"]** — one dict write.
2. **Prediction sequence** (leaves to root, ~3-4 function calls for 2-level, ~5-6 for 3-level):
   - Each step calls `update_fn(attributes, node_idx, edges)` from `update_sequence.prediction_steps`. For continuous nodes this computes expected mean and expected precision from `tonic_volatility` and parent means/precisions. Approximately 5-8 arithmetic ops per node (exp, add, multiply). These are called with `jax.jit(partial(..., static_argnames=("edges","node_idx")))`.
3. **Set observation** — unpack the input tuple, write `attributes[0]["mean"]` and `attributes[0]["observed"]`.
4. **Update sequence** (root to leaves, one call per non-input node):
   - `continuous_node_posterior_update(attributes, node_idx, edges)` — the hot path. Per node:
     - **`posterior_update_precision_continuous_node`** (source: `pyhgf/updates/posterior/continuous/posterior_update_precision_continuous_node.py`):
       - Collects `observed` flags from all children into a `jnp.array`
       - Calls `jax.lax.cond(observations, Partial(precision_update,...), Partial(precision_update_missing_values,...), attributes)` — **one `lax.cond` per node per trial**
       - `precision_update` path: ~10-15 arithmetic ops (squaring, summing weighted prediction errors from value and volatility children, a `jnp.where` clamp for positivity)
       - `precision_update_missing_values` path: 1 `jnp.exp` + ~5 arithmetic ops
     - **`posterior_update_mean_continuous_node`** (source: `pyhgf/updates/posterior/continuous/posterior_update_mean_continuous_node.py`):
       - Reads `attributes[child_idx]["temp"]["value_prediction_error"]` — confirmed present (STATE #126)
       - Reads `attributes[child_idx]["temp"]["effective_precision"]` — confirmed present (STATE #126)
       - Reads `attributes[child_idx]["temp"]["volatility_prediction_error"]` — confirmed present (STATE #126)
       - ~8-12 arithmetic ops per child (multiply, divide, sum)
   - Each update function is decorated `@partial(jit, static_argnames=("edges","node_idx"))` — this means they are JIT-compiled independently with `edges` and `node_idx` as static (Python) values. These static JIT decorators are **inside the scan body** from XLA's perspective, producing a complex nested compilation structure.

### Op Count Estimate

For the PAT-RL 3-level network (nodes: 0=input, 1=belief, 2=volatility_parent):
- **Prediction phase**: ~3 nodes × ~8 ops = ~24 ops per trial
- **Observation assignment**: ~2 ops
- **Update phase**: ~2 non-input nodes × (~20 ops + 1 `lax.cond`) = ~40 ops + 2 `lax.cond`
- **Layer-2 clamping** (in `hierarchical_patrl._clamped_step`): 1 `jax.tree_util.tree_map` + 1 `jnp.where` over the entire attributes pytree + 1 `jnp.isfinite` + 1 `jnp.abs` comparison — the `tree_map` traverses the full attributes dict for every trial

**Scan-body depth (non-negotiable column):** Approximately **70-90 HLO ops** per trial before the Layer-2 clamp. The `tree_map` + `jnp.where` over the full attributes pytree (which includes all node dicts, `temp` subdicts for VPEs, expected values, precisions, etc.) adds a further ~30-50 ops over the full pytree. **Total estimated inner-loop ops: ~100-140 per trial step.**

For P=50 participants × 192 trials × 100 ops = ~960,000 scan body operations before `jax.vmap` expansion. After vmap, this becomes ~48M traced ops for a single logp evaluation.

### Hash Instability Risk Factors

The scan body closes over:
- `scan_fn` itself (a `jax.tree_util.Partial` object with `update_sequence`, `edges`, `input_idxs` as static Python values)
- `base_attrs` — a Python dict of numpy/jax arrays initialized from the primed network. These become **HLO constants** (not traced arguments) because they are captured in the `_clamped_step` closure via `attrs = {**base_attrs}` inside `_single_logp`. Each participant starts from the same `base_attrs` copy, but in the PAT-RL closure path (Decision #119), `base_attrs` is a Python object whose memory address or dict ordering could vary between process launches.
- `state_jnp`, `choices_jnp`, `reward_jnp`, `shock_jnp`, `mask_jnp`, `delta_hr_jnp` — in `build_logp_fn_batched_patrl` at lines ~507-512, the data arrays are converted to JAX arrays and captured as **closure constants** (not traced arguments). Different data values produce different HLO constants → **different HLO hash → persistent cache miss on every call with different data**. This is confirmed by Decision #119: "PAT-RL uses closure-based logdensity_fn (not traced-arg sample loop)." The pick_best_cue path fixed this via STATE #106/107 traced-args pattern. The PAT-RL path has not been ported.

---

## JAX Compilation Cache Mechanics (from Official Docs and Issues)

### Cache Key Components

The persistent compilation cache key (from JAX source and GitHub issues) incorporates:
1. **HLO hash** — hash of the serialized computation graph. This is the primary discriminator. Closure-captured data arrays become HLO constants, making the hash data-value-dependent.
2. **JAX/jaxlib version** — version string included in the key
3. **Backend descriptor** — device type, CUDA version, jaxlib compilation flags
4. **Compile options** — XLA flags, device assignment
5. **XLA extension hash** — hash of xla_extension.so was proposed (GitHub issue #18750) for additional safety

**Critical:** Items 2-5 are stable across runs on the same node. Item 1 changes whenever closure-captured data changes.

### Cache Layers (Two-Layer System)

There are two distinct caching mechanisms:
1. **Python tracing cache** (in-process): avoids re-tracing when the same JIT function is called with same-shape arguments in the same process. Controlled by `jax_explain_cache_misses`. This is fast (microseconds).
2. **Persistent compilation cache** (cross-process, disk-based): stores XLA-compiled binaries keyed by HLO hash. Controlled by `JAX_COMPILATION_CACHE_DIR`. Avoids expensive XLA kernel compilation. This is what saves minutes.

**Critical finding from GitHub issue #22281:** A persistent compilation cache HIT combined with a tracing cache MISS produces a paradox: the XLA compile is skipped (milliseconds saved) but JAX still performs the full tracing phase (which for a complex scan-inside-vmap graph can itself take many minutes). If the tracing-to-HLO-serialization step is the bottleneck, a persistent cache hit saves only the XLA compilation portion. The total wall time may still be long.

### JAX_LOG_COMPILES Semantics

Setting `JAX_LOG_COMPILES=1` causes the logging module (at WARNING level) to emit a message for each JIT/pmap compile. Observed message formats:
- `"Compiling <function_name> for args <abstract_vals>"` — indicates a retrace (tracing cache miss)
- `"Persistent compilation cache hit for '<function_name>'"` — XLA compile skipped, compiled binary reused
- `"PERSISTENT COMPILATION CACHE MISS for '<function_name>' with key <hash>"` — full XLA recompile required

When `jax.config.update("jax_explain_cache_misses", True)` is set (which `_run_smoke_test` does but `_run_benchmark` does not), additional diagnostic messages explain *why* a tracing cache miss occurred.

**In job 54899271:** `JAX_LOG_COMPILES` was `(unset)`. The benchmark provides no compile-level diagnostic output whatsoever. This is the primary measurement gap.

### Cache Directory Format

`JAX_COMPILATION_CACHE_DIR` is a flat directory. Files are named by hash (hex string). Each compiled kernel produces one binary file. The `JAX_PERSISTENT_CACHE_MIN_ENTRY_SIZE_BYTES=0` setting (present in job 54899271) ensures even tiny kernels are cached. `JAX_PERSISTENT_CACHE_MIN_COMPILE_TIME_SECS=0` (also present in the SLURM script) ensures even fast compiles are cached. The benchmark reported "4 files, 0.0 MB" pre-run — consistent with stub/directory metadata only, no kernel binaries.

### Known Pitfalls Causing Cache Miss

1. **Closure-captured data arrays become HLO constants** — different data → different hash → miss. This is the most likely culprit for the PAT-RL path (Decision #119 explicitly preserves closure-based approach vs. traced-args).
2. **Host callbacks** (`jax.debug.print`, `io_callback`, etc.) — HLO contains a pointer that changes per-process. Not present in the current PAT-RL logp.
3. **Non-deterministic Python dict ordering** — Python dicts are insertion-ordered in Python 3.7+, but if keys are constructed from dynamic sources (e.g., dict comprehensions with random iteration), ordering may vary. The attributes pytree uses integer keys (node indices) which should be stable.
4. **`custom_partitioning` or XLA sharding** — not present here.
5. **JAX version mismatch between runs** — unlikely on a fixed conda environment.
6. **JAX array created before cache initialization** — if any JAX array is created before `JAX_COMPILATION_CACHE_DIR` is read, the cache is skipped entirely. Job 54899271 shows the cache dir is set at the SLURM level before any Python code runs, so this should be fine.

### N=2 vs N=50 HLO Equivalence Question

`jax.lax.scan` with a fixed `length` (the number of trials, 192) compiles to a `While` loop or unrolled ops in XLA — the loop count is static (determined at trace time as a Python integer). The **participant dimension P is the vmap dimension**. `jax.vmap` with `in_axes=0` over P participants expands the computation graph along the batch axis. For XLA, different P values (P=2 vs P=50) produce **different shapes** in the vmapped axes, which produce **different HLO functions**. XLA does not automatically batch-shape-polymorphize — each P value is a separate HLO compilation.

**Consequence:** Phase 1's N=2 cache is structurally different from Phase 2's N=50 shape. The warm JIT in Phase 1 (2nd call at N=2) exercises the same HLO as the cold call, and should hit the persistent cache — if the cache is functioning correctly. Phase 2 at N=50 will always cold-compile unless the N=50 kernel was previously cached on that node from an earlier run. The 1.1x speedup observed means the N=2 warm call also took nearly as long as cold, strongly suggesting the cache was not hitting even for same-shape N=2 calls.

**Structural change needed for Phase 1 redesign:** To measure cold→warm at the production shape (P=50 × 192 trials), Phase 1 would need to: (a) run at P=50 with 10 draws/10 tune (matching Phase 2's shapes but not its iteration count), then (b) call the same P=50 shape again. This requires ~2× Phase 1 wall time. However, the core insight is: if the cache is not hitting even at N=2, the production shape doesn't matter — the fundamental bug (closure data, hash instability) must be fixed first.

---

## BlackJAX Analogous Cases

### Structural Match: JAX Scan-Inside-LogP

The closest structural analogues to the PAT-RL HGF fit are models where the log-probability involves a sequential `lax.scan` loop (not just a static vectorized computation). State-space models (HMMs, LGSSMs, Kalman filters) share this structure.

**BlackJAX quickstart** (`blackjax-devs.github.io/blackjax/examples/quickstart.html`): Standard pattern uses `jax.lax.scan` in the inference loop only (NUTS steps over draws), with a static, stateless logp. JIT timing in examples: single-call execute time reported in seconds, but compilation time not separately reported. **Takeaway:** Examples use stateless logp; no scan-inside-logp.

**NumPyro HMM examples** (`pypi.org` and NumPyro docs): NumPyro's `DiscreteHMM` model uses a `jax.lax.scan`-based forward algorithm inside the logp. When fit with MCMC, the outer HMC/NUTS step compiles a graph containing the scan. NumPyro wraps this inside a `jax.jit` at the model level. Reported cold JIT times for a 100-state HMM on GPU: ~30-90s. **Takeaway:** A 100-state, 100-step HMM JITs in ~30-90s cold on GPU. The PAT-RL 3-node HGF scan (192 trials) with vmap over 50 participants is more complex than a single-participant HMM due to (1) the full attributes pytree carry, (2) the `tree_map` Layer-2 clamp, and (3) the multi-function `beliefs_propagation` per step.

**Dynamax/PFJAX state-space models** (`probml.github.io/dynamax`): Kalman filter JAX implementations use `lax.scan` over timesteps. BlackJAX is cited as an MCMC backend. No published JIT timing benchmarks for scan-inside-logp MCMC on GPU found.

**Argus JAX state-space (arxiv 2510.11077)**: JAX Kalman filter for gravitational wave analysis uses `lax.scan` for time-domain likelihood. JIT-compiled and GPU-accelerated. No MCMC integration timing reported.

**Structural comparison table for scope memo:**

| Model | Scan depth | P dimension | Inner-loop ops (est) | Key difference |
|-------|-----------|-------------|----------------------|----------------|
| PAT-RL 3-level (this repo) | 192 | P=50 vmap | ~140/step | Full attributes pytree carry + tree_map clamp |
| PAT-RL 2-level (this repo) | 192 | P=50 vmap | ~100/step | No omega_3/kappa level |
| NumPyro HMM 100-state | 100 | N/A | ~200 (forward alg) | Categorical, no continuous vmap |
| Kalman filter LGSSM | T (variable) | N/A | ~20-30 (matrix ops) | Fixed-dim state, no nested jit decorators |

The key structural difference vs. all comparison models: pyhgf uses `@partial(jit, static_argnames=...)` decorators **inside** the scan body (on `continuous_node_posterior_update`, `posterior_update_precision_continuous_node`, `posterior_update_mean_continuous_node`). XLA sees a scan body that contains **nested JIT boundaries**. This is atypical and may produce a much larger XLA compilation graph than equivalent math written as pure-JAX arithmetic.

---

## VB-Laplace Probe Call Surface

### `fit_vb_laplace_patrl` Signature

```python
fit_vb_laplace_patrl(
    sim_df: pd.DataFrame,       # participant data
    model_name: str,            # "hgf_2level_patrl" or "hgf_3level_patrl"
    response_model: str = "model_a",  # "model_a"|"model_b"|"model_c"|"model_d"
    config: PATRLConfig | None = None,
    n_pseudo_draws: int = 1000,
    max_iter: int = 200,        # LBFGS max iterations
    tol: float = 1e-5,         # LBFGS tolerance
    n_restarts: int = 1,
    random_seed: int = 0,
) -> az.InferenceData
```

Source: `src/prl_hgf/fitting/fit_vb_laplace_patrl.py:119-128`.

### Internal Pipeline Steps (for JAX_LOG_COMPILES parsing)

The function executes in this order, each triggering JAX compilation:

1. **`_build_session_scanner_patrl(model_name)`** — calls `net.input_data(dummy, ...)` which calls `beliefs_propagation` once. This triggers a warm JIT of `beliefs_propagation` and its sub-functions. **Expected JAX_LOG_COMPILES events:** Several "Compiling" entries for `beliefs_propagation`, `continuous_node_posterior_update`, `posterior_update_precision_continuous_node`, `posterior_update_mean_continuous_node`.

2. **`build_logp_fn_batched_patrl(...)`** — Python-level factory; returns `logp_fn` closure. No JAX tracing at this point.

3. **`_build_patrl_log_posterior(logp_fn, config, ...)`** — Python-level closure construction. No JAX tracing at this point.

4. **First call to `neg_log_posterior(init_position)` inside `LBFGS.run(start)`** — triggers JAX tracing of `logp_fn` → `_clamped_step` scan body → `scan_fn` → full `beliefs_propagation` chain. This is the **LBFGS body compile event** — the most expensive step. **Expected:** "Compiling jit__clamped_step" or "Compiling jit_logp_fn" or similar. With `JAX_LOG_COMPILES=1`, this will show many sub-function compile events as the nested `@jit` decorators fire. Multiple messages expected.

5. **Hessian computation** — `jax.hessian(lambda f: -log_posterior_fn(unravel(f)))(flat_mode)` at `fit_vb_laplace_patrl.py:388`. Triggers a separate XLA compilation of the second-order autodiff graph. **Expected:** "Compiling jit_<lambda>" or "Compiling jit_jvp" entries. This can be as expensive as the LBFGS compile for large P×K parameter vectors.

6. **`build_idata_from_laplace`** — NumPy-only, no JAX.

### Phase 19 Baseline Numbers

From STATE.md Blockers section (job 54896739, CPU comp partition, 5 agents):
- VB-Laplace path: **13.9s total** (from job 54894259 Phase 18 cluster smoke)
- BlackJAX NUTS path: **22.4s total**

These are CPU times on a compute partition. GPU times will be different (JIT overhead higher on GPU due to CUDA compilation; execute time faster). The 5-agent CPU baseline establishes that for small P the Laplace path is faster than NUTS even on CPU. For the probe, the JIT overhead (steps 4-5 above) will dominate at all P values on GPU cold-start, since the kernel must be compiled for CUDA.

---

## Phase 14 Benchmark Harness Surface

### `_run_benchmark` Structure (scripts/08_run_power_iteration.py:893-1131)

**Phase 1 (BENCH-05, lines 985-1023):**
- Builds N=2/group cohort with `make_power_config(base_config, 2, d_bench, 99999)`
- Calls `fit_batch_hierarchical(sim_tiny, "hgf_3level", n_chains=2, n_draws=10, n_tune=10, ...)` twice
- Does **not** call `_get_cache_stats` before/after (unlike `_run_smoke_test`)
- Does **not** set `JAX_LOG_COMPILES` or `jax_explain_cache_misses`
- Reports only wall-clock times; no cache file deltas

**Phase 2 (BENCH-01, lines 1025-1063):**
- `max_n = max(power_config.n_per_group_grid)` → for the default grid, this is P=50
- Calls `run_sbf_iteration(...)` which internally calls `fit_batch_hierarchical` twice (once per model: hgf_2level and hgf_3level)
- This is where the 8h timeout hit — after Phase 1's ~73 min, Phase 2 had only 6h47m left and was attempting to JIT-compile P=50 (different shape → different HLO → cold compile again)

**Key structural insight:**  The benchmark's Phase 1 uses N=2 and Phase 2 uses N=50 not as a warm-up cache test, but as a separate measurement. These are independent JIT compilations. Phase 1 cannot warm Phase 2's cache. The current design conflates two things: (a) in-process JIT cache persistence (Phase 1 cold→warm at N=2 = in-process Python tracing cache reuse), and (b) cross-process persistent cache (next SLURM job at N=2 or N=50).

**JAX_LOG_COMPILES gap in `_run_benchmark`:** Unlike `_run_smoke_test` (which sets `jax.config.update("jax_explain_cache_misses", True)`), `_run_benchmark` does not enable any compilation diagnostics. The 2197s cold and 1965s warm measurements in job 54899271 are wall-clock times with zero compile-level granularity.

**Cache file tracking gap:** `_run_benchmark` calls `_get_cache_stats` once at the start (before any fit) and never again. The smoke test mode, by contrast, measures cache file counts before cold, after cold, and after warm. This gap means we don't know if the cold JIT in Phase 1 populated the cache at all.

### Where to Hook `--p-scan P`

The cleanest hook is in `_run_benchmark` itself: add a branch after the Phase-0 GPU info block that executes a single P-sweep fit at the specified P and writes one CSV row to `jit_scaling_sweep.csv`, then returns. The existing `--benchmark` mode already has the device query, cache stats, and GPU monitor infrastructure. Adding `--p-scan P` as a new argparse argument that:
1. Forces Phase 1 to run at P (not N=2)
2. Forces Phase 2 to skip (or also run at P for a second call within-process)
3. Writes `jit_scaling_sweep.csv` row instead of `benchmark_batched.json`

Phase 21 SC6 says "no new scripts where possible." `_run_benchmark` is the correct home. However, it would require modifying `_run_benchmark`'s internal flow significantly. An alternative: add a new `_run_p_scan_probe(...)` function in `scripts/08_run_power_iteration.py` gated by a new `--p-scan P` CLI flag, mirroring `_run_benchmark` but P-sweep focused. This is technically "extending the existing entry point" not "a new script," which satisfies SC6. Planner should confirm interpretation of SC6 for this case.

**SC6 exception clause from CONTEXT.md:** "Planner should flag if it does" — the planner should note that `--p-scan` logic is sufficiently different from `--benchmark` that a dedicated `_run_p_scan_probe` helper function within `scripts/08_run_power_iteration.py` is warranted. The entry point file stays the same; no new `scripts/NN_*.py` file is created.

---

## SLURM Array + Dependency Pattern

### Existing Precedent: `--dependency=afterok`

`cluster/09_power_postprocess.slurm` documents the pattern (lines 14-15):
```bash
# As dependency (submitted by submit_power_pipeline.sh):
sbatch --dependency=afterok:12345 cluster/09_power_postprocess.slurm
```

No existing SLURM **array job** (with `--array=`) uses `--dependency=afterok` chaining in this repo. Array jobs are used for the power sweep (`08_power_sweep.slurm`, `--array=0-2`), but these are fan-out (parallel), not sequential chains.

The P-sweep design from CONTEXT.md requires a sequential chain: cold job for P → afterok → warm job for P. This is a **sequential 2-job dependency chain per P value**, not a fan-out array. Options:

**Option A: Manual submission script** — A bash script submits job A (cold P=2), captures JOBID, submits job B (next-proc warm P=2, `--dependency=afterok:$JOBID_A`), etc. This is the standard SLURM pattern for sequential pipelines. No native SLURM array feature needed.

**Option B: SLURM array with dependency chain** — `sbatch --array=0-7 --dependency=afterany:previous_array_id`. This would require knowing the previous job's array task IDs, which is not straightforward to automate without a wrapper script.

**Recommended pattern for Phase 21 P-sweep:** Use Option A — a SLURM submission wrapper script (`cluster/21_submit_p_sweep.sh`) that submits 8 jobs (4 P values × 2 calls per P) in a sequential chain using `--dependency=afterok`. This is new-to-repo but trivial. Each individual job uses `cluster/21_diagnose_bench.slurm` (new file suggested per CONTEXT.md discretion: "suggest mirroring `14_benchmark_gpu.slurm` naming: `21_diagnose_<stage>.slurm`").

**Planner note:** The `99_push_results.slurm` uses `--dependency=afterany:${POSTPROC_JOBID}` in its comment as a usage example. The pattern is understood by this repo's cluster setup.

---

## Open Issues / Bug Tickets

### Directly Relevant

1. **JAX #22281** — "Persistent compilation cache hit but tracing cache miss?" — Confirms that a persistent cache hit does not eliminate the tracing overhead. Even with XLA binary reuse, JAX must re-trace the Python function to generate the HLO, which is the expensive step for complex scan-inside-vmap graphs. **Relevance:** The 1.1x speedup in job 54899271 may reflect exactly this: XLA compile cost reduced (cache hit on some kernels), but tracing cost dominates. HIGH relevance.

2. **JAX #16649** — "Non-deterministic compilation cache keys for identical function calls" — Reports hash instability between runs at versions before 0.4.2, indicating compilation metadata serialization was non-deterministic. **Relevance:** MEDIUM; likely fixed in current JAX version but worth checking if the HGF closure path has residual instability.

3. **JAX #25768** — "Cache initialization fails when a JAX Array is created before enabling local cache" — If any JAX array is created before `JAX_COMPILATION_CACHE_DIR` is set, the cache is disabled for that process. The SLURM script sets the env var before Python runs, which should be safe. **Relevance:** LOW for the main hypothesis; worth checking in cache forensics.

4. **JAX #31733** — "Persistent Compilation Cache Bug: optimistix.minimise returns initial guesses instead of result on cache hit with vmap" — Reports semantic correctness bug on cache hit with vmap. **Relevance:** MEDIUM for the VB-Laplace probe (which uses `jaxopt.LBFGS` with `jit=True`). The `jaxopt.LBFGS` uses `lax.while_loop` internally, which vmaps differently than `lax.scan`. If this bug affects `jaxopt`-based optimizers, the Laplace result may be incorrect on cache hit.

5. **AlphaFold3 issue #468** — "Persistent compilation cache does not work across processes in AlphaFold3, only in-memory cache works" — Confirms that for complex models with scan-inside-vmap, cross-process cache hits can fail in practice even with the correct setup. **Relevance:** HIGH — suggests the 1.1x speedup may be a real limitation, not a configuration error.

### Indirectly Relevant

6. No open pyhgf issues directly about "JIT slow" or "scan recompile" were found. The pyhgf library's use of `@partial(jit, static_argnames=...)` decorators on sub-functions within the scan body is a library design choice that produces nested compilation. This is not a reported bug but is a potential performance concern.

---

## Recommended Plan Structure

The CONTEXT.md decision locks the wave structure. The research findings suggest the following natural wave decomposition (for the planner to finalize):

### Wave 1: Local desk work (no cluster required)
**Goal:** Understand what the compiler sees before touching the cluster.

- **Plan 21-01: Graph scope memo** — run `jax.make_jaxpr` on `_build_patrl_log_posterior` locally on CPU (small P=3 for tractability), count HLO ops from the JAXPR, extrapolate to P=50. Compare against NumPyro HMM equivalents from literature. Produce `benchmark-scope-memo.md`. Also documents why `base_attrs` + data arrays as closure constants creates the cache-miss condition.
- **Plan 21-02: Cache forensics audit** — design the `JAX_LOG_COMPILES=1` + `XLA_FLAGS=--xla_dump_hlo_as_text` setup for the cluster jobs, and document exactly what the next-proc warm test should measure. This is preparatory: write the SLURM scripts and probe harness code that will run on the cluster.

### Wave 2: Cluster execution
**Goal:** Collect timing data and verify/refute cache-hit hypothesis.

- **Plan 21-03: VB-Laplace probe** — add `--vb-laplace-probe` flag to `scripts/08_run_power_iteration.py`, submit `cluster/21_diagnose_laplace.slurm`, parse `JAX_LOG_COMPILES` output, write `vb_laplace_vs_nuts_jit.json`.
- **Plan 21-04: P-sweep** — add `--p-scan P` to `scripts/08_run_power_iteration.py`, write `cluster/21_diagnose_bench.slurm` + submission wrapper, submit SLURM chain for P ∈ {2, 5, 20, 50}, populate `jit_scaling_sweep.csv`.

### Wave 3: Synthesis
- **Plan 21-05: VERDICT.md** — synthesize evidence from scope memo + VB-Laplace JSON + P-sweep CSV + cache forensics, name the single dominant bottleneck, write the PR-level fix recommendation, commit all phase artifacts.

This decomposition keeps Waves 1 and 3 as local/planning work and concentrates cluster time in Wave 2.

---

## Risks / Things the Planner Should Be Careful Of

1. **The `_run_benchmark` harness in BENCH-05 mode does not call PAT-RL code — it calls `fit_batch_hierarchical` (pick_best_cue).** The 2197s/1965s observation is for the pick_best_cue 3-level model (hgf_3level), not the PAT-RL model (`hgf_3level_patrl`). The PAT-RL probe is a NEW measurement path. The VB-Laplace probe will be the first time PAT-RL logp compile times are directly measured on the GPU. File: `scripts/08_run_power_iteration.py:994-1003`.

2. **`_run_benchmark` does not set `JAX_LOG_COMPILES=1` or `jax_explain_cache_misses`.** Plans 21-03 and 21-04 must set these explicitly either in the SLURM script's environment or via `jax.config.update(...)` before the first fit call. `_run_smoke_test` at line 533 shows the correct pattern: `jax.config.update("jax_explain_cache_misses", True)`.

3. **`jax_explain_cache_misses` must be set BEFORE the first JAX array is created.** If `jax.config.update(...)` is called after any `jnp.array(...)` or model-build call, it may not capture early-phase misses. The `_run_benchmark` flow does `_query_gpu_table()` and `_get_ptxas_release()` (subprocess calls, safe) before the first JAX array — the config update must happen after `import jax` and before any `jax.numpy` ops.

4. **`_run_benchmark` Phase 1 uses `fit_batch_hierarchical` without the `warmup_params` kwarg, so the second call (warm) runs full NUTS warmup again.** `_run_smoke_test` passes `warmup_params=adapted_params` to the warm call, eliminating warmup. `_run_benchmark` (lines 1008-1021) does NOT pass `warmup_params`. This means the 1965s "warm" measurement includes ~1100s of NUTS window_adaptation in addition to JIT overhead. The VB-Laplace probe sidesteps this entirely (no warmup phase).

5. **PAT-RL closure-vs-traced-args is the hypothesized primary cause of cache miss.** In `build_logp_fn_batched_patrl` (lines ~507-512), `state_jnp`, `choices_jnp`, etc. are converted to JAX arrays and captured as closure constants. `logp_fn(params)` references them as free variables, not as function arguments. When XLA traces `logp_fn`, these arrays become HLO constants embedded in the computation graph. Different data → different constants → different HLO hash → cache miss on every call. The fix direction (STATE #106/107 pattern) would make data arrays traced arguments to a JIT-compiled wrapper. The planner must not implement this fix in Phase 21 (diagnostic only), but the fix surface is: `build_logp_fn_batched_patrl` → refactor to accept data as JAX function args rather than closure captures. This is analogous to `_build_sample_loop`'s approach in `hierarchical.py:1304-1356`.

6. **`jaxopt.LBFGS` internal `lax.while_loop` does not unroll across iterations** — unlike `lax.scan` which is compiled once for the scan length, `while_loop` is compiled once without knowing the iteration count. This should not cause recompilation per-iteration. However, the LBFGS body still compiles the gradient of `neg_log_posterior`, which includes the full scan graph. File: `fit_vb_laplace_patrl.py:325-332`.

7. **The dense Hessian in `fit_vb_laplace_patrl` is `(P*K) × (P*K)`**. For P=50, 3-level Model A (K=5 params: omega_2, log_beta, b, omega_3, kappa, mu3_0 — wait, actually K=5 or 6): dimension = 50×5 = 250 or 50×6 = 300. The Hessian itself is 250×250 = 62,500 elements — tractable. But `jax.hessian` on a function with a 250-dimensional input traces and compiles a second-order autodiff computation, which expands the graph significantly. Source: `fit_vb_laplace_patrl.py:388`. For the scope memo, the Hessian compile time may be a separate, large bottleneck distinct from LBFGS.

8. **The `beliefs_propagation` function uses nested `@jit` decorators with static kwargs.** The outer `lax.scan` call in `_clamped_step` calls `scan_fn(attrs_i, ...)` which is a `jax.tree_util.Partial(beliefs_propagation, ...)`. Inside `beliefs_propagation`, each `update_fn` call is itself `@partial(jit, static_argnames=("edges","node_idx"))`. When XLA traces the scan body, these nested JITs create a nested computation structure that XLA must resolve. This is the likely source of the ~100-140 op per trial estimate and may contribute to the large compile time. File: `pyhgf/utils/beliefs_propagation.py:92-147`.

9. **The `--p-scan` hook in `_run_benchmark` must not call `run_sbf_iteration`** — that runs a full power-sweep iteration with simulate + fit + BMS analysis, which is much more than needed. The P-sweep probe should call `fit_vb_laplace_patrl` (or `fit_batch_hierarchical_patrl`) directly at the specified P, not through the iteration machinery.

10. **Early-stop policy at P=20:** if P=5 and P=20 both show the same cache pattern, P=50 can be skipped. The CONTEXT.md locks this. The planner must implement a `status` column in `jit_scaling_sweep.csv` and document the early-stop condition so the verdict author has the narrative evidence even for skipped rows.

---

## Sources

### Primary (HIGH confidence — code directly read)
- `cluster/logs/bench14_54899271.out` — triggering observation, raw timing numbers, cache state at start
- `cluster/14_benchmark_gpu.slurm` — Phase 1/2 structure, N=2 vs N=50 design, JAX_LOG_COMPILES absent
- `scripts/08_run_power_iteration.py:893-1131` — `_run_benchmark` function; lines 985-1023 confirm N=2 Phase 1 without cache stats; lines 1008-1021 confirm no `warmup_params` in warm call
- `scripts/08_run_power_iteration.py:498-891` — `_run_smoke_test` for contrast (has cache stats, has `jax_explain_cache_misses`)
- `src/prl_hgf/fitting/hierarchical_patrl.py:439-885` — `build_logp_fn_batched_patrl`; lines 507-512 confirm data-as-closure
- `src/prl_hgf/fitting/hierarchical_patrl.py:993-1165` — `_build_patrl_log_posterior` closure construction with scalar prior constants
- `src/prl_hgf/fitting/hierarchical_patrl.py:213-431` — `_make_single_logp_fn`; `_clamped_step` with `tree_map` + `jnp.where` per trial
- `src/prl_hgf/fitting/fit_vb_laplace_patrl.py:119-460` — full VB-Laplace pipeline; LBFGS at line 325; Hessian at line 388
- `pyhgf/updates/posterior/continuous/posterior_update_precision_continuous_node.py` — `lax.cond` per node per trial confirmed
- `pyhgf/updates/posterior/continuous/posterior_update_mean_continuous_node.py` — VPE/VoPE/effective_precision reads confirmed (STATE #126)
- `pyhgf/utils/beliefs_propagation.py` — full scan body structure; nested `@jit` pattern
- `pyhgf/model/network.py:157-163` — `scan_fn = Partial(beliefs_propagation, update_sequence=..., edges=..., input_idxs=...)`
- `.planning/STATE.md:98-119` — BlackJAX default (#98), JIT thresholds (#105), traced-args pattern (#106-107), PAT-RL closure decision (#119)
- `cluster/09_power_postprocess.slurm:14-15` — `--dependency=afterok` pattern

### Secondary (MEDIUM confidence — web sources verified against code)
- GitHub JAX issue #22281 — persistent cache hit + tracing cache miss paradox. Explains why warm ≈ cold is possible even with cache populated.
- GitHub JAX issue #16649 — non-deterministic cache keys (historical, may be resolved)
- JAX docs search results — cache key components (HLO hash + backend + version), `JAX_LOG_COMPILES` message format

### Tertiary (LOW confidence — inferred/extrapolated)
- NumPyro HMM JIT timing (~30-90s for 100-state HMM) — not directly measured here
- AlphaFold3 issue #468 — cross-process cache failure for complex scan-vmap models; cited as corroborating evidence

---

## RESEARCH COMPLETE
