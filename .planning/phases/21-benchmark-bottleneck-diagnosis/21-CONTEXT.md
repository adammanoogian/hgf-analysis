# Phase 21: Benchmark Bottleneck Diagnosis — Context

**Gathered:** 2026-04-19
**Status:** Ready for planning

<domain>
## Phase Boundary

Purely diagnostic phase. Identifies the root cause of the Phase 14 BlackJAX GPU benchmark bottleneck observed in job 54899271 (cold JIT 2197s, warm JIT 1965s → 1.1x cache speedup; timed out at 8h on N=50 Phase 2 before `benchmark_batched.json` was written). Produces evidence + a VERDICT.md naming the single dominant bottleneck and a concrete PR-level fix recommendation that unblocks Phase 14.1-03.

**Not in scope:**
- Re-executing the Phase 14 production benchmark (that is 14.1-03's job)
- Implementing the fix named in VERDICT.md (separate follow-up plan)
- Patching `apply_decision_gate` thresholds (deferred until VERDICT.md)
- Bumping SLURM walltime or shrinking production cohort size (banned anti-patterns)

</domain>

<decisions>
## Implementation Decisions

### Research depth & references

- **pyHGF 0.2.8 internals**: docs + source-read of the hot path (scan_fn, continuous_node_posterior_update, attribute flow) + one-trial `jax.make_jaxpr` / `jax.xla_computation` trace to see what the compiler sees. Level-of-understanding target: line-by-line for the per-trial update; HLO-level for the scan body.
- **BlackJAX analogous use cases**: mine two source sets — the official `blackjax-examples` repo (radon-hierarchical, 8-schools, mixture models) AND papers/notebooks that run MCMC on a JAX-scan-inside-logp pattern (NumPyro HMMs, Kalman-filter scan-based MCMC, state-space model fits). The JAX-scan+MCMC corner is the closest structural match to pyHGF scan-in-logp.
- **JAX persistent cache**: official docs only (JAX compilation_cache page + `jax.experimental.compilation_cache` API ref). No source dive needed; runtime instrumentation (JAX_LOG_COMPILES, XLA dump flags) will carry the rest.
- **Research time budget**: single focused 6-8h block. Research first, instrumentation after. Don't interleave — keeps momentum and avoids thrashing.

### Comparison baselines + FLOPs methodology

- **Baselines for scope memo**: state-space models ONLY — NumPyro HMMs, scanned Kalman/LGSSM, other `lax.scan`-in-logp MCMC fits in the JAX ecosystem. Do NOT compare against Bayesian workhorses (8-schools, Radon) or ML forward passes (transformer, CNN, BNN) — different structural shape, muddies the signal.
- **FLOPs rigor**: HLO op-count derived via `jax.xla_computation(logp)(...).as_hlo_text()` → count HLO ops in the compiled graph, multiply by leapfrog-steps-per-draw for the NUTS FLOPs number. ~2× tolerance. No hand-counting from equations, no jax.profiler runs.
- **Non-negotiable table column**: **scan-body depth** — how many ops live inside the per-trial scan body. This is the inner-loop that JIT has to compile. Other columns are nice-to-have; scan-body depth is the one that must appear.
- **Unrunnable references**: skip with note. Keep the memo empirical. Don't cite published numbers to fill rows we can't reproduce.

### VB-Laplace probe design (replaces the originally-proposed SVI probe)

**Key reframing:** the logp-vs-sampler isolation probe reuses the already-validated `src/prl_hgf/fitting/fit_vb_laplace_patrl.py` (Phase 19, TAPAS-parity quasi-Newton MAP + `jax.hessian` Laplace covariance). Zero new deps; the jaxopt.LBFGS + `jax.hessian` path exercises the same `_build_patrl_log_posterior` closure NUTS uses and compiles a heavier graph than numpyro.SVI AutoNormal would. Deliverable filename: `vb_laplace_vs_nuts_jit.json` (not `svi_vs_nuts_jit.json`).

- **Probe harness structure**: run `fit_vb_laplace_patrl` end-to-end (full pipeline only; do NOT manually split LBFGS from Hessian in the harness). Per-stage compile timing comes from `JAX_LOG_COMPILES=1` log events during the run, not from a split harness.
- **LBFGS convergence**: tolerance-based (production-faithful ftol/gtol as shipped). Step count varies with P — accept that; the JIT-timing signal is what matters.
- **Closure fidelity**: exact `_build_patrl_log_posterior`, always. No stripping of Layer-2 clamping, no dropping pyhgf scan, no priors-only variant. Production-identical or nothing — stripping changes the math and the comparison stops being apples-to-apples.
- **`vb_laplace_vs_nuts_jit.json` fields** (all four required):
  - `per_stage_compile_times` — cold + warm per kernel (LBFGS body, Hessian, NUTS step), sourced from JAX_LOG_COMPILES log parsing
  - `per_p_scaling` — same stages at each P ∈ {2, 5, 20, 50} (or early-stopped subset — see P-sweep below); cross-references jit_scaling_sweep.csv
  - `bottleneck_verdict` — string field `bottleneck_layer ∈ {logp_graph, lbfgs_loop, hessian_graph, nuts_kernel, cache_key, both, undetermined}` with a one-paragraph evidence string citing specific numbers from the other fields
  - `hlo_op_counts` — per-stage HLO op count from post-hoc `jax.xla_computation()` calls (not part of the probe run itself — separate analysis step for the scope memo)

### Cache forensics + P-sweep instrumentation

- **HLO dump strategy** (combination):
  - Text IR (`XLA_FLAGS=--xla_dump_hlo_as_text --xla_dump_to=...`) archived per-run so back-to-back runs can be diffed. Keep these.
  - Full heavy-graph artifacts (`--xla_dump_hlo_as_proto --xla_dump_hlo_as_html` for Graphviz) written to a single rotating location — each run REPLACES the previous heavy dump. No proliferation of hundreds-of-MB artifacts. Visualization available for the most recent run only; historical comparison falls back to the lighter text-IR archive.
  - `JAX_LOG_COMPILES=1` log captured for every run regardless.
- **P-sweep cluster job structure**: SLURM array with `--dependency=afterok` chain. For each P ∈ {2, 5, 20, 50}: job A cold (populates cache), job B next-proc warm (reads cache). Array job automated so the executor isn't hand-submitting 8 jobs sequentially. Each job capped at ≤30min walltime (phase SC 7).
- **"Persistent cache proved working" criterion**: **no hard boolean gate**. VERDICT.md author interprets the timing + byte count + HLO hash narrative and reaches a conclusion in prose. Avoids brittle thresholds; keeps the call at the synthesis step where all evidence lands.
- **Early-stop policy**: stop at verdict. If P=5 and P=20 both show the same unambiguous root cause (same HLO hash mismatch, same bottleneck stage in the VB-Laplace probe, etc.), skip P=50 and record as "verdict reached at P=20; P=50 skipped to save cluster hours; re-run if VERDICT.md is contested." Documented explicitly in jit_scaling_sweep.csv via a per-row `status ∈ {completed, early_stopped, infeasible}` column.

### Claude's Discretion

- Exact directory layout under `.planning/phases/21-benchmark-bottleneck-diagnosis/` for raw HLO dumps vs summary CSVs
- SLURM script file naming (suggest mirroring `14_benchmark_gpu.slurm` naming: `21_diagnose_<stage>.slurm`)
- Python CLI flag design on whatever script(s) expose the probe (e.g. `--p-scan P`, `--vb-laplace-probe`) as long as they are additions to existing entry points (phase SC 6 forbids new scripts... wait, 14.1 diagnosis may warrant new; planner should flag if it does)
- How VERDICT.md is structured (narrative vs structured sections) as long as SC 5 decision fields are present

</decisions>

<specifics>
## Specific Ideas

- **"It shouldn't be SVI — use the MATLAB/TAPAS validated variational bayes / laplace assumption we already set up."** User correction mid-discussion reframed Area 3 from "introduce numpyro.SVI as a new probe tool" to "reuse `fit_vb_laplace_patrl` from Phase 19". Principle captured as memory: prefer reusing validated in-project diagnostic paths over pulling in new library tools.
- **"Warm JIT only 3 min faster than cold doesn't make sense."** The triggering observation that justifies the whole phase. Job 54899271 showed cold 2197s / warm 1965s = 1.1× speedup where 3×+ was expected. Any verdict must explain this specific number.
- **"Contextualize how big this graph is to other Bayesian models, ML models."** User's framing: the scope memo exists to answer "is this graph structurally outsized for the hardware we have, or is it small and we just have a cache-miss problem?" State-space models narrowed the comparison corpus accordingly.
- **"Iterate by increasing the relevant parameters, not by reducing them."** Architectural directive repeated twice: P-sweep goes 2 → 5 → 20 → 50 rather than shrinking production cohort. Reducing P is a diagnostic smoke-timing tool only, never the production answer.
- **Heavy HLO artifacts should replace, not proliferate.** User explicit on storage discipline: light text-IR kept per-run for diffing, heavy proto+HTML kept only for the most recent run.

</specifics>

<deferred>
## Deferred Ideas

- **VB-Laplace as production fallback fit path for Phase 14-15 if NUTS proves GPU-infeasible.** Phase 19 closure memo already shows Laplace means agree with NUTS within tolerance on 5-agent smoke; if VERDICT.md names NUTS-sampler as the single bottleneck and no cheap fix exists, Phase 15 production could shift to VB-Laplace. Out of scope for Phase 21 — phase is diagnostic only. Note for roadmap backlog.
- **Tightening `apply_decision_gate` thresholds in `iteration.py`.** STATE decision #105 notes thresholds are NumPyro-conservative and should tighten post-bench. Phase 21 produces the bench data that unblocks this but does NOT do the tightening — that's a separate plan.
- **jax.profiler-based FLOPs measurement.** Considered for Area 2 FLOPs rigor; rejected in favor of HLO op-count derivation. Available as fallback if HLO op counts prove insufficient. Note for potential follow-up.
- **Splitting the VB-Laplace probe into separate LBFGS / Hessian / gradient harnesses for finer localization.** Explicitly rejected in Area 3 (full-pipeline-only decided). Available as an escalation if the full-pipeline timing doesn't localize the bottleneck clearly. Note for potential follow-up plan if VERDICT.md is inconclusive.
- **Comparing against Bayesian workhorses (8-schools, Radon) and ML forward passes (transformer, CNN, BNN).** Rejected in Area 2 (state-space-only decided) but could extend the scope memo later if the state-space comparison alone doesn't contextualize graph size sufficiently. Note for potential follow-up.

</deferred>

---

*Phase: 21-benchmark-bottleneck-diagnosis*
*Context gathered: 2026-04-19*
