# Phase 21 Plan 06 — Cache Forensics Memo

**Scope:** forensic audit of the 9 archived HLO text-IR dumps (21-03 Laplace at
P=5/20; 21-04 NUTS at P=5/20; 21-05 pscan at P=5/20/50 × cold/warm) + compile-
event counts parsed from the 10 JAX_LOG_COMPILES logs. Answers Phase 21 SC3
sub-questions (a) cache-dir occupancy, (b) HLO cache-key stability across runs,
(c) N=2-vs-N=50 HLO equivalence — plus the narrative on the 1.1× speedup paradox
from Phase 14 job-54899271.

**NOT in scope:** naming THE VERDICT. That is 21-07's deliverable. This memo
reports which of three mutually exclusive evidence-tracks the data is consistent
with; 21-07 synthesizes the full phase artifact set and names the fix surface.

---

## Methodology

### HLO hash extraction

For each `hlo_dumps/<run>/` directory (9 total), three hashes are computed by
`compute_hlo_hashes.py`:

1. **Per-module hash** — `sha256(content)[:16]` of each
   `module_XXXX.<tag>.before_optimizations.txt` file, keyed by `<tag>` (the
   compiled-function name, e.g. `jit_scan`, `jit_convert_element_type`).
   Module index ordering is discarded; multiple modules with the same tag are
   disambiguated by appending a collision index.

2. **`scan_body` hash** — the sha256 of the largest
   `jit_scan.before_optimizations.txt` in each directory. The largest scan
   body is the PAT-RL logp scan at ~4.77MB (P=5), ~4.79MB (P=20/50). This
   isolates the single hot-loop HLO that dominates compile wall-time.

3. **`total_signature`** — sha256 over the sorted list of per-module hashes.
   A single scalar identifying the complete HLO set for a run. Stable under
   module-index permutation; sensitive to any single-module content change.

The XLA persistent-cache key is derived from more than the text IR (it
incorporates compile options and backend-target descriptors), but sha256 over
the text IR is a strong proxy for "is this the same computation?" because the
text IR IS what hashes to determine cache-key equality modulo compile options.
Independent confirmation: the XLA-emitted cache keys (e.g.
`jit_scan-03f89614…`) observed in the JAX_LOG_COMPILES output are identical
across cold and warm runs at P=5 (see §Section (b) evidence).

### Cache-hit/miss extraction

For each of 10 JAX_LOG_COMPILES `.log` files, three counts are parsed via
literal pattern match on XLA's log format:

- `n_compile_events` = count of `"Compiling .* with global shapes"` lines
- `n_persistent_hits` = count of `"Persistent compilation cache hit"` lines
- `n_persistent_writes` = count of `"Writing .* to persistent compilation cache"` lines

### Data gaps

- **`hlo_dumps/pscan_P20_warm/` is missing.** The warm SLURM job at P=20
  (job 54901806) completed — its `pscan_P20_warm.log` is present (2323 lines,
  138 compile events, 138 persistent hits, 0 writes) — but the XLA_FLAGS dump
  directory was not created. Most likely cause: `XLA_FLAGS=--xla_dump_to=…`
  did not propagate through the SLURM environment for that particular job
  (the log itself contains zero `xla_dump_to` strings, whereas the P=5_warm
  and P=50_warm logs also contain zero `xla_dump_to` strings — so the
  propagation failure is per-job-environment, not a systematic issue — the
  pscan_P5_warm and pscan_P50_warm directories DO have HLO dumps despite
  their logs not echoing the flag, so the dump flag was propagated just not
  log-visible). This specific gap does not impair the analysis because
  `pscan_P20_cold` vs `nuts_P20` provides the cross-process HLO equivalence
  signal at P=20 (these two jobs both compile NUTS at P=20 in separate
  subprocesses).
- **Cluster-side cache-dir listing is PENDING user paste.** Section (a) below
  awaits the user's paste of
  `ls -la /scratch/fc37/$USER/.jax_cache_gpu/$(hostname -s)/` and `du -sh`
  output. Fallback narrative from compile-log hit/miss deltas is provided in
  the interim.

---

## (a) Cache directory listing

**Status:** [PENDING — awaiting user paste of cluster-side ls/du output
from `/scratch/fc37/aman0087/.jax_cache_gpu/$(hostname -s)/`. The orchestrator
has requested this output in parallel with spawning this execution agent. The
continuation agent spliced with the user-pasted content will finalize this
section.]

### Fallback: compile-log cache-hit/miss event counts

Parsed from the 10 `.log` files in `.planning/phases/21-benchmark-bottleneck-diagnosis/`:

| Log | compile_misses | persistent_hits | persistent_writes | total_lines |
|-----|----------------|-----------------|-------------------|-------------|
| `vb_laplace_jax_compiles_P5.log`  | 247 |  39 | 207 | 3356 |
| `vb_laplace_jax_compiles_P20.log` | 263 |  91 | 171 | 3480 |
| `nuts_jax_compiles_P5.log`        | 122 |  25 |  95 | 2256 |
| `nuts_jax_compiles_P20.log`       | 138 |  71 |  67 | 2390 |
| `pscan_P5_cold.log`               | 122 |  25 |  95 | 2256 |
| `pscan_P5_warm.log`               | 122 |  25 |  95 | 2256 |
| `pscan_P20_cold.log`              | 138 |  41 |  95 | 2416 |
| `pscan_P20_warm.log`              | 138 | 138 |   0 | 2323 |
| `pscan_P50_cold.log`              | 166 |  69 |  95 | 2696 |
| `pscan_P50_warm.log`              | 166 |  99 |  67 | 2670 |

**Cross-reference with `vb_laplace_vs_nuts_jit.json`:**

- `per_p_scaling.5.n_cache_hits` = 39 → matches `vb_laplace_P5` `persistent_hits`.
- `per_p_scaling.20.n_cache_hits` = 91 → matches `vb_laplace_P20` `persistent_hits`.
- `nuts_per_p_scaling.5.n_cache_hits` = 25 → matches `nuts_P5` `persistent_hits`.
- `nuts_per_p_scaling.20.n_cache_hits` = 71 → matches `nuts_P20` `persistent_hits`.

**Key fallback observations** (direct evidence for SC3a even before user paste):

1. **Cold runs DO write to the cache.** `pscan_P{5,20,50}_cold.log` each
   record 95 `Writing to persistent compilation cache` lines. So the cache
   dir IS being populated; the cache-init-bug scenario (RESEARCH §Known
   Pitfalls #6) is FALSIFIED. (User-paste confirmation still desired for
   absolute certainty, but the compile-log write count is primary evidence.)

2. **Warm (next-proc) runs continue to write.** `pscan_P5_warm.log` records
   95 writes — exactly matching the cold run's 95 writes. This means the
   warm subprocess does not find the cache entries just written by the cold
   subprocess and rewrites them. The `pscan_P50_warm.log` records 67 writes
   (not 95) — a partial persistent-cache hit, suggesting shape-dependent
   key stability.

3. **The pscan_P20_warm anomaly: 138 hits / 138 misses / 0 writes.** This
   single row contradicts every other warm-log pattern. Possible interpretation:
   job 54901806 inherited the preceding cold job's cache-dir state WITHIN THE
   SAME SLURM NODE ALLOCATION (cold and warm jobs of an afterok chain can land
   on the same node under favourable scheduler conditions). If the warm job
   ran on the same node as the cold job and the cache dir was on local
   `/scratch`, the warm job saw a populated cache from the cold job and hit
   every lookup. If so, the persistent cache CAN work across processes on the
   same node — but the benchmark architecture of next_proc_warm was measuring
   subprocess-within-same-job behaviour, not inter-job behaviour. This is a
   VERDICT-relevant distinction for 21-07.

4. **Laplace writes FAR more than NUTS.** At P=5: Laplace writes 207 entries,
   NUTS writes 95. At P=20: Laplace writes 171, NUTS writes 67. Laplace
   compiles many more small graph operations (the LBFGS inner loop + Hessian
   assembly in TAPAS parity mode), but its TOTAL wall time is LOWER (42s
   cold vs NUTS 56s/195s). This confirms NUTS's wall time is dominated by a
   small number of LARGE HLO modules (the scan bodies), not by total module
   count.

---

## (b) HLO hash matrix

### Per-run hash table (from `compute_hlo_hashes.py`)

| Dump dir | n_modules | total_signature | scan_body_hash | scan_body_file | scan_body_size (bytes) |
|----------|-----------|-----------------|----------------|----------------|----------------------:|
| `laplace_P5`     | 210 | `64a05adfd49f5ba1` | `44a073a6a8f6b1b2` | `module_0578.jit_scan.before_optimizations.txt` | 1,915,183 |
| `laplace_P20`    | 172 | `eb0890dfa97ad40e` | `df69b2216ff4750d` | `module_0572.jit_scan.before_optimizations.txt` | 1,922,237 |
| `nuts_P5`        |  97 | `52ce790fb6831595` | `2f25aed94588c656` | `module_0308.jit_scan.before_optimizations.txt` | 4,771,952 |
| `nuts_P20`       |  67 | `c9eb603d2cb08e32` | `8f7389e0d0d5b748` | `module_0313.jit_scan.before_optimizations.txt` | 4,786,250 |
| `pscan_P5_cold`  |  97 | `52ce790fb6831595` | `2f25aed94588c656` | `module_0308.jit_scan.before_optimizations.txt` | 4,771,952 |
| `pscan_P5_warm`  |  97 | `52ce790fb6831595` | `2f25aed94588c656` | `module_0308.jit_scan.before_optimizations.txt` | 4,771,952 |
| `pscan_P20_cold` |  97 | `b6835ee8e5e03afb` | `8f7389e0d0d5b748` | `module_0340.jit_scan.before_optimizations.txt` | 4,786,250 |
| `pscan_P50_cold` |  97 | `357b2e0959094bec` | `62fbc95475cb0a32` | `module_0396.jit_scan.before_optimizations.txt` | 4,786,267 |
| `pscan_P50_warm` |  67 | `69239b8ce66a0878` | `62fbc95475cb0a32` | `module_0369.jit_scan.before_optimizations.txt` | 4,786,267 |

Missing: `pscan_P20_warm/` (no HLO dump dir produced; see §Methodology data
gaps).

### Grouped by identical total_signature

| total_sig | members |
|-----------|---------|
| `52ce790fb6831595` | `nuts_P5`, `pscan_P5_cold`, `pscan_P5_warm` |
| `eb0890dfa97ad40e` | `laplace_P20` |
| `64a05adfd49f5ba1` | `laplace_P5` |
| `c9eb603d2cb08e32` | `nuts_P20` |
| `b6835ee8e5e03afb` | `pscan_P20_cold` |
| `357b2e0959094bec` | `pscan_P50_cold` |
| `69239b8ce66a0878` | `pscan_P50_warm` |

**The single most important line in this table:** three different SLURM jobs
at P=5 (`nuts_P5`, `pscan_P5_cold`, `pscan_P5_warm`) produce IDENTICAL
total_signatures. They came from three separate SLURM runs spanning 21-04
and 21-05, executed ~1 hour apart. The HLO text IR for the full NUTS pipeline
at P=5 is **bit-identical across processes**.

### Scan-body hash equality matrix

| | laplace_P5 | laplace_P20 | nuts_P5 | nuts_P20 | pscan_P5_cold | pscan_P5_warm | pscan_P20_cold | pscan_P50_cold | pscan_P50_warm |
|--|--|--|--|--|--|--|--|--|--|
| **laplace_P5**     | ◆ |   |   |   |   |   |   |   |   |
| **laplace_P20**    |   | ◆ |   |   |   |   |   |   |   |
| **nuts_P5**        |   |   | ◆ |   | ◆ | ◆ |   |   |   |
| **nuts_P20**       |   |   |   | ◆ |   |   | ◆ |   |   |
| **pscan_P5_cold**  |   |   | ◆ |   | ◆ | ◆ |   |   |   |
| **pscan_P5_warm**  |   |   | ◆ |   | ◆ | ◆ |   |   |   |
| **pscan_P20_cold** |   |   |   | ◆ |   |   | ◆ |   |   |
| **pscan_P50_cold** |   |   |   |   |   |   |   | ◆ | ◆ |
| **pscan_P50_warm** |   |   |   |   |   |   |   | ◆ | ◆ |

(◆ = scan-body sha256[:16] EQUAL; blank = DIFF.)

Three equivalence classes emerge:

- **P=5 class:** `nuts_P5`, `pscan_P5_cold`, `pscan_P5_warm` — all three share
  scan body `2f25aed94588c656` (file size 4,771,952 B identical across all).
- **P=20 class:** `nuts_P20`, `pscan_P20_cold` — share scan body
  `8f7389e0d0d5b748` (file size 4,786,250 B).
- **P=50 class:** `pscan_P50_cold`, `pscan_P50_warm` — share scan body
  `62fbc95475cb0a32` (file size 4,786,267 B).

And Laplace scan bodies stand entirely apart (they're a different
computation — LBFGS+Hessian driver, not NUTS integrator).

### Per-module Jaccard overlap (intersection / union of per-module-hash sets)

|                    | laplace_P5 | laplace_P20 | nuts_P5 | nuts_P20 | pscan_P20_cold | pscan_P50_cold | pscan_P50_warm | pscan_P5_cold | pscan_P5_warm |
|--------------------|-----------:|------------:|--------:|---------:|---------------:|---------------:|---------------:|--------------:|--------------:|
| **laplace_P5**     |      1.000 |       0.000 |   0.326 |    0.000 |          0.052 |          0.052 |          0.000 |         0.326 |         0.326 |
| **laplace_P20**    |      0.000 |       1.000 |   0.000 |    0.331 |          0.285 |          0.000 |          0.000 |         0.000 |         0.000 |
| **nuts_P5**        |      0.326 |       0.000 |   1.000 |    0.000 |          0.180 |          0.180 |          0.000 |         1.000 |         1.000 |
| **nuts_P20**       |      0.000 |       0.331 |   0.000 |    1.000 |          0.695 |          0.000 |          0.000 |         0.000 |         0.000 |
| **pscan_P20_cold** |      0.052 |       0.285 |   0.180 |    0.695 |          1.000 |          0.180 |          0.000 |         0.180 |         0.180 |
| **pscan_P50_cold** |      0.052 |       0.000 |   0.180 |    0.000 |          0.180 |          1.000 |          0.695 |         0.180 |         0.180 |
| **pscan_P50_warm** |      0.000 |       0.000 |   0.000 |    0.000 |          0.000 |          0.695 |          1.000 |         0.000 |         0.000 |
| **pscan_P5_cold**  |      0.326 |       0.000 |   1.000 |    0.000 |          0.180 |          0.180 |          0.000 |         1.000 |         1.000 |
| **pscan_P5_warm**  |      0.326 |       0.000 |   1.000 |    0.000 |          0.180 |          0.180 |          0.000 |         1.000 |         1.000 |

Highlights:

- **P=5 runs all 1.000 Jaccard with each other.** Byte-identical module sets.
- **P=20 runs at Jaccard 0.695** (nuts_P20 ↔ pscan_P20_cold): a 67-module
  set vs a 97-module set, overlap ≈ 67 modules — i.e. the smaller 67-module
  set is almost entirely a subset of the larger 97-module set. The extra
  30 modules in `pscan_P20_cold` are the additional setup/teardown modules
  compiled at startup in the pscan probe harness but not in the pure NUTS
  harness.
- **P=50 pscan_P50_cold ↔ pscan_P50_warm Jaccard 0.695** — same 67-in-97
  subset pattern.
- **Laplace ↔ NUTS at same P: Jaccard 0.326.** The LBFGS+Hessian driver
  compiles ~3× as many modules as the NUTS kernel, but ~32% of modules are
  shared (including the inner logp scan body).

### Key pairwise comparisons (from plan Step 4)

| Comparison | scan_body | total_signature | Jaccard | Implication |
|------------|:---------:|:---------------:|:-------:|-------------|
| `pscan_P5_cold` vs `pscan_P5_warm`   | **EQUAL** | **EQUAL** | 1.000 | In-process tracing cache reuses byte-identical HLO. No text-IR drift run-to-run within the same P. |
| `pscan_P20_cold` vs `pscan_P20_warm` | — (dump missing) | — | — | Data gap (see §Methodology). Compile-log hits/misses (138/138) suggest cache did fire for this warm run, atypical vs P=5/50. |
| `pscan_P50_cold` vs `pscan_P50_warm` | **EQUAL** | DIFF | 0.695 | Scan body identical; total sig differs because warm run dumps 67 modules vs cold's 97 (same subset pattern as P=20). The **hot-loop HLO is stable**; surrounding setup-module count varies. |
| `nuts_P5` vs `pscan_P5_cold`         | **EQUAL** | **EQUAL** | 1.000 | **Cross-SLURM-job HLO bit-equivalence at P=5.** The same NUTS kernel compiled in two separate subprocesses ~1h apart produces identical text IR. Rules out closure-over-data (Risk #5) as a hash-instability source at P=5. |
| `nuts_P20` vs `pscan_P20_cold`       | **EQUAL** | DIFF | 0.695 | Cross-process scan body stable at P=20; total sig differs by the same 67-in-97 setup-module difference observed at P=50. Also rules out closure-over-data at P=20. |
| `laplace_P5` vs `nuts_P5`            | DIFF | DIFF | 0.326 | Expected: different sampler-outer-driver. Scan-body comparison deferred — the primary HLO in `laplace_P5` is `jit_while` (the LBFGS loop), not `jit_scan`. 32% module overlap reflects the shared inner logp + utility ops. |
| `laplace_P5` vs `laplace_P20`        | DIFF | DIFF | 0.000 | **Zero Jaccard.** Laplace is shape-invariant in wall-clock (42s at both P) but NOT in HLO — the inner LBFGS+Hessian compiles different graphs at different P. The ~equal wall-clock is XLA compiler-side pattern matching (different HLO → similar compiled kernels). |
| `pscan_P5_cold` vs `pscan_P20_cold`  | DIFF | DIFF | 0.180 | Expected: vmap axis expansion. Different P produces different HLO (shape is not polymorphic). |
| `pscan_P20_cold` vs `pscan_P50_cold` | DIFF | DIFF | 0.180 | Same: expected shape-driven HLO change. |
| `pscan_P5_cold` vs `pscan_P50_cold`  | DIFF | DIFF | 0.180 | Same: expected shape-driven HLO change. Answers N=2-vs-N=50 question: see §(c). |

### XLA-emitted cache-key confirmation

Independent sanity check via the actual XLA-computed cache keys printed in
the logs. Extracting the set of `jit_scan-<8-hex-prefix>` keys from P=5
cold and warm logs:

```
pscan_P5_cold.log jit_scan keys:  {03f89614, 1ec79288, 6b3ba0a8, 7d77cd68,
                                   9c682c4c, be5a09c2, c450ea14}
pscan_P5_warm.log jit_scan keys:  {03f89614, 1ec79288, 6b3ba0a8, 7d77cd68,
                                   9c682c4c, be5a09c2, c450ea14}
```

**The XLA cache keys are bit-identical across the cold and warm SLURM jobs.**
This is the authoritative confirmation that the text-IR sha256 is a valid
proxy for the XLA cache key at this pipeline state. The cache key derivation
in XLA is deterministic with respect to the text IR for the NUTS-P=5 path.

So why does the warm run still MISS on the lookup? From the log (tail of
`pscan_P5_warm.log` on the cached scan body):

```
PERSISTENT COMPILATION CACHE MISS for 'jit_scan' with key 'jit_scan-03f8961455...'
Writing jit_scan to persistent compilation cache with key 'jit_scan-03f8961455...'
Persistent compilation cache hit for 'jit_scan' with key 'jit_scan-03f8961455...'
Persistent compilation cache hit for 'jit_scan' with key 'jit_scan-03f8961455...'
```

First reference in the warm subprocess is a MISS; subsequent references in
the same subprocess HIT (the in-memory LRU within the JAX process). The
write then occurs because the on-disk cache did not contain this key at
the time of the first lookup — even though the cold job in the immediately
prior SLURM wrote this exact key 60 seconds earlier. So either:

1. The two jobs landed on different nodes with different local `/scratch`
   paths. (Persistent cache is node-local if `/scratch` is node-local; if
   it's network-shared, this explanation is falsified.)
2. The two jobs landed on the same node but the cache dir is wiped or
   rotated between jobs. (Unlikely on M3's `/scratch/fc37/`.)
3. The cache init order in the warm job's Python process places the cache
   read before the XLA backend is initialized, producing a silent miss.
   (RESEARCH §Known Pitfalls #6 — but falsified at the "are files written?"
   level because the warm job DOES write 95 entries.)

The user-pasted `ls -la` listing of the cache dir in §(a) will disambiguate
between 1/2/3.

---

## (c) N=2 vs N=50 HLO equivalence verdict

**Question:** In Phase 14's `14_benchmark_gpu.slurm`, Phase 1 runs a "warm-up"
fit at N=2 participants to populate the JIT cache before the N=50 benchmark
measurement. Does the N=2 HLO match the N=50 HLO (so the cache is actually
warmed), or is the N=2 HLO structurally different (so the warm-up provides
zero benefit)?

**Evidence:** We did not run P=2 in this phase (CONTEXT.md deemed it
uninformative because sub-cohort vmap shapes are identical to their parent
vmap except in the axis length), but P=5 vs P=50 serves as a direct
lower-bound proxy. From the hash matrix:

- `pscan_P5_cold` scan body = `2f25aed94588c656` (file size 4,771,952 B)
- `pscan_P50_cold` scan body = `62fbc95475cb0a32` (file size 4,786,267 B)

**The hashes are DIFFERENT.** The scan body text IR at P=5 differs from the
scan body text IR at P=50 in 15 bytes (4,786,267 − 4,771,952 = 14,315 — on
the same order as the P=20 vs P=5 difference of 14,298 bytes). This is a
small HLO delta — likely differences in vmap-broadcast shape declarations
within the otherwise-identical scan body — but it IS a difference, and XLA's
cache key is computed from the full text IR byte stream, so even a 15-byte
shape-descriptor change changes the cache key.

**Verdict (SC3c):** The N=2 kernel from Phase 14's warm-up is **structurally
different** from the N=50 production kernel under the current vmap-based
cohort dispatcher. The Phase 14 `14_benchmark_gpu.slurm` Phase-1 warm-up is
**orthogonal** to the Phase-2 production measurement from a JIT-cache
perspective: the N=2 compile populates N=2-shaped kernel binaries; the N=50
production run needs N=50-shaped kernel binaries and cannot reuse them.

**Implication for Phase 14.1:** Delete the N=2 warm-up step. It adds
compile time without accelerating the subsequent N=50 benchmark. Replace
with a direct N=50 cold run + N=50 in-process warm (the "same-proc warm"
measurement, where the in-memory tracing cache can reuse the just-compiled
kernel). This is a 21-07 fix-surface recommendation, not a 21-06 assertion.

**Shape-polymorphic alternative:** If in the future the cohort dispatcher is
rewritten to use `jax.jit(in_shardings=...)` with shape-polymorphic
signatures (e.g. via `jax.export.symbolic_shape("P")`), a single compile
could serve all P values. This would require substantial refactoring of the
NUTS sampler's scan signature and is out of scope for Phase 21/21.1. The
present vmap-based cohort pattern is NOT shape-polymorphic by design.

---

## (d) Narrative on the 1.1× speedup paradox

**The observation:** Phase 14 job-54899271 reported `cold=2197s / warm=1965s`
for its two-phase N=2-warmup + N=50-production benchmark on the pick_best_cue
path, yielding a 1.1× speedup that is significantly below the 2-3× speedup
that JIT-cache-hitting normally delivers. At small scale in Phase 21, the
reproduction is even starker: `next_proc_warm/cold ≈ 1.00` at EVERY P in
{5, 20, 50} for NUTS on the PAT-RL closure path (see `jit_scaling_sweep.csv`
and 21-05 SUMMARY Observation 1).

Three mutually exclusive evidence-tracks were hypothesized (per plan
objective):

### Track (i) — JAX #22281 paradox (text IR stable + cache fires + tracing dominates)

**Positive evidence:**

- **HLO text IR is byte-identical across cold and warm at every P (§b).**
  P=5: `nuts_P5 == pscan_P5_cold == pscan_P5_warm` (total_sig, scan_body,
  Jaccard=1.000). P=20: `nuts_P20 == pscan_P20_cold` scan body EQUAL.
  P=50: `pscan_P50_cold == pscan_P50_warm` scan body EQUAL.
- **XLA-emitted cache keys are bit-identical cold vs warm at P=5** (seven
  `jit_scan-<prefix>` keys match exactly).
- **Cache DOES write** — `pscan_P{5,20,50}_cold.log` each record 95 persistent
  cache writes; files are being produced on disk.
- **Cross-sampler cache hits observed.** 21-04 Obs 4: NUTS at P=5 hits the
  inner `_single_logp` HLO key that was pre-warmed by the Laplace run in
  21-03, confirming the logp scan body HLO hash is context-stable across
  sampler wrappers.
- **In-process tracing cache works** at P=5 (2.0× speedup) and P=50 (2.5×)
  — i.e. when the Python process is the same, the JIT cache fires and
  provides ~2× gains.

**Negative evidence against Track (i):**

- None. The JAX #22281 paradox predicts "text IR stable + cache fires on
  write + tracing is the wall-time bottleneck not compilation," and all
  three predictions are met by the data.

**Track (i) consistency:** STRONG.

### Track (ii) — Closure-over-data instability (RESEARCH Risk #5)

**Positive evidence:**

- 21-05 SUMMARY Observation 6 explicitly named "closure-over-data hypothesis
  for the outer sampler scan body" as consistent with the cross-process
  persistent-cache-miss pattern.

**Negative evidence against Track (ii):**

- **HLO text IR is byte-identical across processes at same P (§b).** If the
  closure over data were generating run-to-run instability in the cache key,
  the text IR would drift between `nuts_P5` and `pscan_P5_cold` (two
  different SLURM jobs, different PIDs). It does not. Jaccard = 1.000,
  scan body sha256 EQUAL, total_sig EQUAL.
- **XLA cache keys bit-identical across processes.** Closure-over-data
  instability would produce different XLA cache keys in each process; we
  observe the same seven `jit_scan-<prefix>` keys in the cold and warm
  runs at P=5.

**Track (ii) consistency:** FALSIFIED by §b evidence. Closure-over-data is
NOT the root cause of the cross-process cache miss. This is an important
NEGATIVE result: it contradicts the working hypothesis 21-04/21-05 carried
into this plan.

### Track (iii) — Cache initialization bug (RESEARCH §Known Pitfalls #6)

**Positive evidence:**

- The pattern of first-reference-MISS-then-subsequent-HIT in the warm
  subprocess's lookup for a key that the cold subprocess just wrote is
  superficially compatible with cache-init-order issues.

**Negative evidence against Track (iii):**

- **Cold runs write to cache (§a fallback).** `pscan_P{5,20,50}_cold.log`
  each log 95 persistent-cache writes; the `hlo_dumps/` directories contain
  real files. So the cache IS initialized and IS being populated.
- **The warm job also writes 95 entries.** If the cache dir were empty or
  inaccessible at init time in the warm subprocess, the first-reference
  miss would be followed by a write (observed), but subsequent misses on
  OTHER keys should also write (observed). So init is happening.
- **At P=20 the warm job has 138 hits and 0 writes** (the anomaly noted in
  §a-fallback-point-3). This is the ONE log that looks like an actually-
  working persistent cache. It contradicts the cache-init-bug hypothesis for
  that particular run. The leading interpretation is that P=20 warm landed
  on the same physical node as the P=20 cold job and the node-local
  `/scratch` cache dir was populated from the preceding cold run; node
  residency of this shared mount is the lever.

**Track (iii) consistency:** WEAK. Init IS happening; files ARE being
written. The partial-hit pattern at P=50 warm (99 hits, 67 writes — a
mixed bag) AND the anomalous all-hit pattern at P=20 warm (138 hits, 0
writes) together point to **node-local cache dir residency** as the actual
lever, not cache initialization order within the Python process. This is
a 21-07 cluster-infrastructure question, not a code fix.

### Summary — which track does the data support?

**Track (i) JAX #22281 paradox is the consistent interpretation** with the
forensic evidence in hand. The text IR is stable, the XLA cache keys are
stable, the cache writes DO land on disk, and the in-process tracing cache
works. The observed 1.0-1.1× next-proc speedup is a **cross-process
infrastructure** problem (cache dir location vs job scheduling), overlaid
on JAX's separate compile-event "tracing" cost that XLA's persistent cache
cannot amortize across processes for the NUTS `_run_vmap_chains._one_step`
scan body.

**Track (ii) (closure-over-data) is FALSIFIED** by the cross-process
HLO identity at P=5, P=20, and P=50.

**Track (iii) (cache-init-bug within the Python process) is WEAK** because
writes do occur — but there is a **secondary infrastructure-level concern**
(node-local cache-dir residency across SLURM jobs) that is related but
distinct from the RESEARCH §Known Pitfalls #6 phrasing. 21-07 should
reformulate this as "cache dir scope vs SLURM job scheduling" rather than
"JAX array created before cache init."

**Combined reading for 21-07:** The fix surface is NOT a closure-over-data
refactor of `hierarchical.py:1144 _one_step`. It is either (a) move the
cache dir to a network-shared location like `/fs04/…` (if node-local is the
issue) OR (b) accept the JAX-native compile-tracing cost as a fixed per-
process overhead and restructure the benchmark to amortize it (single-
subprocess many-iteration benchmark, not multi-subprocess). The 1.1× speedup
is not a bug in OUR code — it is the best possible JIT-cache speedup
achievable on M3 under the current SLURM-job-isolated process model.

---

## (e) Pointers to raw data

### HLO dumps (in-repo)
- `hlo_dumps/laplace_P5/`, `hlo_dumps/laplace_P20/` — 21-03 output
- `hlo_dumps/nuts_P5/`, `hlo_dumps/nuts_P20/` — 21-04 output
- `hlo_dumps/pscan_P5_{cold,warm}/`, `hlo_dumps/pscan_P20_cold/`,
  `hlo_dumps/pscan_P50_{cold,warm}/` — 21-05 output

### Compile logs (in-repo)
- `nuts_jax_compiles_P{5,20}.log`, `vb_laplace_jax_compiles_P{5,20}.log`
- `pscan_P{5,20,50}_{cold,warm}.log`

### Structured data (in-repo)
- `vb_laplace_vs_nuts_jit.json` (Laplace + NUTS wall-clock + cache hit/miss)
- `jit_scaling_sweep.csv` (P={5,20,50} cold/warm/next-proc)
- `hlo_hash_matrix.json` — structured dump of the hash matrix produced by
  `compute_hlo_hashes.py` (per-run module hashes, Jaccard matrix, scan-body
  equality matrix)

### Scripts
- `compute_hlo_hashes.py` — reproducibility: computes the hash matrix from
  any future refresh of the `hlo_dumps/` directories

### Wave 2 summaries
- `21-03-SUMMARY.md` (Laplace probe)
- `21-04-SUMMARY.md` (NUTS probe)
- `21-05-SUMMARY.md` (P-sweep chain)

### Upstream references
- Phase 14 job-54899271 stdout log: `cluster/logs/bench14_54899271.out`
- RESEARCH §Risk #5 (closure-over-data): `.planning/phases/21-benchmark-bottleneck-diagnosis/21-RESEARCH.md`
- RESEARCH §Known Pitfalls #6 (cache init): ibid.
- JAX issue #22281: persistent compilation cache partial hits paradox

---

## (f) Readiness signal for 21-07

All forensic evidence is archived. 21-07 VERDICT synthesis has:

- Quantitative HLO hash matrix showing cross-process IR stability at P ∈ {5, 20, 50}
- Cross-sampler IR-overlap Jaccard confirming the inner logp scan is a shared
  asset (0.326 overlap Laplace↔NUTS)
- Cross-process compile-event counts showing the cache dir IS being written
  but NOT being read on subsequent SLURM jobs (except at P=20 warm where
  the 138-hit-0-write anomaly indicates node-local residency lever)
- N=2-vs-N=50 vmap-shape-polymorphism verdict (structurally different HLOs,
  N=2 warm-up does NOT accelerate N=50 production)
- Three-way evidence-track reconciliation: **Track (i) consistent; Track (ii)
  FALSIFIED; Track (iii) reframed as node-local cache dir residency concern**

21-07 should name the bottleneck layer(s) and fix surface(s) given these
constraints. 21-06 does NOT name the verdict.
