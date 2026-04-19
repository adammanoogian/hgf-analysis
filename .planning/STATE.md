# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-04-07)

**Core value:** Validated simulation-to-inference pipeline for HGF models on PRL pick_best_cue data.
**Current focus:** Phase 21 Wave 2 complete — benchmark bottleneck diagnosis cluster probes. Plans 21-01 through 21-05 COMPLETE: scope memo, harness re-instrumentation, VB-Laplace probe, NUTS probe, and P-sweep cross-process chain all produced headline data. Waves 3 (21-06 cache forensics + 21-07 VERDICT synthesis) is the remaining work.

## Current Position

Phase: 21 (Benchmark Bottleneck Diagnosis) — Wave 2 complete (5/7 plans); Wave 3 in progress
Plan: 21-05 COMPLETE ✓; next are 21-06 (cache forensics) + 21-07 (VERDICT synthesis)
Status: Wave 2 cluster data collected, committed, and pushed. vb_laplace_vs_nuts_jit.json + jit_scaling_sweep.csv populated across P in {5, 20, 50} for both Laplace and NUTS paths. Wave 3 local desk work remains.
Last activity: 2026-04-19 — Completed plans 21-03, 21-04, 21-05. Wave 2 cluster data produced: Laplace graph is shape-invariant (cold~42s at P=5,20); NUTS scales 3.5x from P=5 to P=20 (56.7s→195.4s); persistent on-disk cache gives ~0% speedup across process boundaries for NUTS at every P tested — Phase 14 1.1x "cache-paradox" reproduced at small scale.

[===========██████████��█████]   v1.1 code-complete (Phases 1-11); Phases 12-14 verified; Phase 16 complete; Phase 17 complete; Phase 18 complete (6/6); Phase 19 COMPLETE (5/5); Phase 14.1 gap closure in progress (1/6); Phase 20 COMPLETE (8/8); Phase 21 Wave 2 COMPLETE (5/7)

## Performance Metrics

| Metric | v1.0 Value |
|--------|------------|
| Phases shipped | 7 |
| Plans completed | 18 |
| Files created/modified | 105 |
| Lines of Python | ~11,016 |
| Days elapsed | 4 (2026-04-04 to 2026-04-07) |

## Accumulated Context

### Key Decisions

See `.planning/milestones/v1.0-ROADMAP.md` for v1.0 decision log.

| Decision | Rationale | Phase |
|----------|-----------|-------|
| MCMC throughout (no MAP proxy) | Simplicity; leverage cluster parallelism for power loop | v1.1 planning |
| Psilocybin vs placebo groups (both post-concussion) | Corrected study design | v1.1 planning |
| pingouin.bayesfactor_ttest over rpy2+anovaBF | pingouin already installed; anovaBF misspecified for RM designs (van den Bergh 2023) | v1.1 roadmap |
| SLURM array %50 throttle | Prevents Lustre metadata import storm on M3 MASSIVE | v1.1 roadmap |
| omega_3 BFDA labeled "exploratory — upper bound" | Recovery r ~ 0.67 with binary data; naive BFDA inflates power 20-40pp | v1.1 roadmap |
| SeedSequence for parallel RNG | task-ID integer seeding gives correlated streams; SeedSequence guarantees independence | v1.1 roadmap |
| power/ package wraps existing pipeline; no existing module modified | Eliminates regression risk; all existing functions called unchanged | v1.1 roadmap |
| make_power_config shifts psilocybin omega_2_deltas only; placebo unchanged | Study hypothesis: psilocybin increases learning rate; placebo is inert control | 08-01 |
| load_power_config reads only power: YAML key; does not re-parse task/simulation/fitting | Clean separation of concerns; existing load_config unaffected | 08-01 |
| write_parquet_row rejects missing AND extra columns | Strict schema enforcement prevents silent drift as Phase 10 adds real pipeline results | 08-02 |
| --output-dir flag on entry point for test isolation | Integration tests write to tmp_path, not results/; keeps test suite clean | 08-02 |
| make_trial_config scales only PhaseConfig.n_trials; TransferConfig.n_trials untouched | Transfer trials are fixed study design; only acquisition/reversal phases vary for trial count studies | 09-01 |
| run_recovery_precheck filters to baseline only before fit_batch | Avoids 3x compute cost; post_dose and followup sessions not needed for recovery gate | 09-01 |
| omega_3 eligibility always "exploratory -- upper bound" regardless of r | Locked decision: binary PRL data r~0.67 in literature; BFDA inflation 20-40pp | 09-01 |
| n_flagged uses groupby("participant_id")["flagged"].any().sum() | fit_df has per-parameter rows; participant is flagged if ANY parameter row is flagged | 09-01 |
| run_trial_sweep passes min_n=0 to build_recovery_df | Small trial counts may lose many participants to convergence failures; downstream callers apply own filter | 09-02 |
| find_minimum_trial_count excludes omega_3 from all-must-pass by default | Consistent with locked exploratory decision; omega_3 never gates the trial count requirement | 09-02 |
| seed+idx seeding per grid point in run_trial_sweep | Fresh independent participants at each trial count; no between-condition correlation in recovery estimates | 09-02 |
| compute_power_b deduplicates on (n_per_group, iteration) before mean | Each SLURM task writes 3 parquet rows (one per sweep_type) with identical BMS values; dedup prevents triple-counting | 11-01 |
| bf_threshold parameter on compute_power_a is documentary; uses pre-computed bf_exceeds bool column directly | No re-thresholding at aggregation time — threshold is baked into schema at write time | 11-01 |
| plot_power_a recomputes from raw bf_value (not bf_exceeds) so --bf-threshold CLI arg is live | Enables users to replot at different thresholds without re-running the sweep | 11-02 |
| plot_combined_figure saves both PDF and PNG from same stem | Grant submission needs PDF; PNG for quick inspection | 11-02 |
| _draw_*_panel helpers separate subplot rendering from file I/O | Enables test isolation and reuse in combined figure without recursive file saves | 11-02 |
| generate_recommendation re-applies bf_threshold to bf_value for N selection | Allows any --bf-threshold CLI arg to affect recommended N, not just pre-baked bf_exceeds bool | 11-03 |
| power_a_df and power_b_df recomputed from master if summary CSVs missing | Makes recommendation script self-sufficient when only power_master.csv exists | 11-03 |
| Chunk-based SLURM: 3 jobs instead of 4200 | JAX compiles once per chunk; reuses compiled model for ~1400 iterations; one combined parquet per chunk | 11 |
| legacy/batch.py imports from legacy/single.py (not shim) | Ensures frozen code calls frozen code; no circular dependency through shims | 12-01 |
| Shims use noqa: F401 for re-exports | Ruff would flag unused imports in shim modules; F401 suppression is standard for re-export patterns | 12-01 |
| Data as runtime args for vmap (not closure-over-data) | Clean vmap signature; XLA sees full data flow; no closure recreation on data change | 12-02 |
| Separate named functions for 2-level/3-level logp | Avoids mypy error from conditional redefinition with different signatures | 12-02 |
| Level-2 mean key is attrs[i]["mean"] | Confirmed via runtime inspection of pyhgf attribute pytree structure | 12-02 |
| Post-hoc dim rename for participant coords (not pm.Model coords=) | dims= parameter interacts unpredictably with pm.Potential in some PyMC versions; post-hoc rename is robust | 12-03 |
| TYPE_CHECKING guard for pd/az imports | Avoids heavy runtime imports; satisfies ruff F821 + UP037 for forward-ref type annotations | 12-03 |
| Both VALID-02 paths use numpyro sampler | PyMC sampler hits _init_jitter read-only array bug with JAX-backed Ops; numpyro bypasses PyTensor entirely | 12-04 |
| Simulated agent data for VALID-02 (not random) | Random choice/reward data produces poorly constrained posteriors, making MCSE-based comparison unreliable | 12-04 |
| Positional dim indexing for batched posterior | PyMC assigns per-variable dim names when shape= used without dims=; positional indexing is robust | 12-04 |
| Factory pattern for jax_session vmappability | _build_session_scanner builds pyhgf Network once outside JAX trace; _run_session is pure-JAX and vmappable for Plan 02 cohort path | 13-01 |
| jnp.int32(-1) sentinel for trial-0 stickiness | (prev_choice == jnp.arange(3)) evaluates all-False for -1 giving zero stickiness; verified in test_session_jax_stickiness_sentinel | 13-01 |
| values_t elements use .reshape(1) in sim path | Matches pyhgf scan_fn shape contract: logp path uses input_data[:, 0:1] sliced to (1,) per step; simulation must match exactly | 13-01 |
| simulate_cohort_jax captures shared cue_probs_arr in lambda closure | Shared trial sequence across participants; closure keeps vmap axes to 6 scalar params + 1 key; cleaner than in_axes=None | 13-02 |
| simulate_batch stacks per-participant cue_probs as axis=0 | Each session has distinct env_seed → different trial sequence; (P, n_trials, 3) stack with in_axes=0 handles variation across participants | 13-02 |
| Two-phase batch: Python collection then single vmap dispatch | Preserves deterministic seed derivation; eliminates _prewarm_jit; DataFrame assembly stays in Python after compiled kernel runs | 13-02 |
| Single fixed trial sequence for VALID-04 controlled-comparison design | Isolates agent RNG from environment RNG; holding env constant makes KS test sensitive only to JAX vs NumPy behavioral difference | 13-03 |
| KS test on choice frequency distributions (not per-trial match) for VALID-04 | NumPy PCG64 and JAX ThreeFry are incompatible RNG streams; per-trial exact match impossible; aggregate distributional equivalence is the correct scientific test | 13-03 |
| VALID-03 is two separate script invocations + JSON comparison (not a single pytest) | JAX platform (CPU/GPU) is set at import time; cannot be changed within a running process | 14-03 |
| compare_results denominator uses abs(mean_a) + 1e-8 | Prevents near-zero division false failures when parameter means (e.g. zeta) are ~ 0.001 | 14-03 |
| Deferred import of fit_batch_hierarchical inside else block of run_sbf_iteration | Keeps heavy JAX/PyMC/pyhgf imports out of import-time when using legacy path; consistent with existing deferred-import pattern | 14-01 |
| fit_df_2 not constructed in batched path of run_sbf_iteration | SBF subsampling loop only uses fit_df_3 for BF contrasts and diagnostics; same is true in legacy path — no structural need to construct it | 14-01 |
| az.rhat(da)[param].values for scalar extraction from az.rhat Dataset | az.rhat(DataArray) returns a Dataset not a scalar; [param].values extracts the 0-d NumPy scalar correctly | 14-01 |
| strict=True on all zip() calls in _idata_to_fit_df and _build_idata_dict | Catches participant metadata length misalignment at helper boundaries before silent posterior-to-participant mapping errors | 14-01 |
| apply_decision_gate is pure function in iteration.py (not script-local) | Testable independently of benchmark script; importable by any caller needing gate logic | 14-02 |
| _update_state_md uses string search + last-| -line insertion (not regex) | Simple and robust for the fixed table structure; handles missing STATE.md gracefully | 14-02 |
| BLE001 noqa on broad except in _GpuMonitor._run | Intentional swallow for nvidia-smi transient failures (missing binary, timeout, parse error) | 14-02 |
| Additive refactor: all PyTensor Op code kept for VALID-01/02 backward compat | Deprecated functions still importable; no test breakage risk | 16-01 |
| chain_method="vectorized" for numpyro MCMC | Single kernel for all 4 chains on one GPU; better throughput than sequential+jit_model_args | 16-01 |
| numpyro.sample() + numpyro.factor() pattern over raw potential_fn | Preserves named parameters for az.from_numpyro(); avoids manual Param:0 renaming | 16-01 |
| Data passed as kwargs to mcmc.run(), not captured in closures | XLA trace is shape-dependent but value-independent; enables JIT cache reuse across power-sweep iterations | 16-01 |
| sampler="pymc" raises DeprecationWarning; numpyro path always used | API backward compat preserved; old callers get warning but still work | 16-01 |
| sampler= kwarg removed from batched fit_batch_hierarchical calls; kept in signatures for backward compat | Batched path always uses numpyro-direct; no need to forward sampler to fit function | 16-02 |
| check_cuda_compat is non-fatal in SLURM scripts | MCMC still works without XLA parallel compilation, just slower; no reason to abort the job | 16-02 |
| GPU pip deps tracked in cluster/requirements-gpu.txt (separate from main requirements) | Cluster-specific CUDA pins should not pollute the main dev environment | 16-02 |
| BlackJAX as default sampler (sampler="blackjax"); NumPyro preserved as fallback | Eliminates ~1800s per-call JIT recompilation; BlackJAX compiles NUTS step once via jax.jit | 17-01 |
| Single warmup replicated across chains (not per-chain warmup) | Simpler implementation; posterior geometry similar across chains with IID priors | 17-01 |
| numpyro.distributions for standalone prior log_prob | Pure JAX, no model context; matches existing prior specs exactly; avoids jax.scipy.stats standardized-bounds pitfall | 17-01 |
| pmap when device_count >= n_chains; vmap fallback on single device | Multi-GPU utilization when available; no overhead from pmap on single device | 17-01 |
| sampler="pymc" deprecation falls through to numpyro (not blackjax) | PyMC users expect NumPyro-style behavior; blackjax path is new and should be explicitly chosen | 17-01 |
| Separate 2-level/3-level log-posterior smoke tests (not parameterized) | Clearer failure diagnostics when one model variant fails | 17-02 |
| SLURM default SAMPLER env var changed from numpyro to blackjax | Matches fit_batch_hierarchical default sampler; override with SAMPLER=numpyro if needed | 17-02 |
| JIT gate thresholds preserved at NumPyro levels with annotation | Thresholds conservative for BlackJAX; will tighten after cluster benchmarking | 17-02 |
| _build_sample_loop factory passes data as traced JIT args (not closure) | XLA persistent cache keys on HLO hash; closure data = HLO constants = cache miss; traced args = shape placeholders = cache hit | quick-003 |
| vmap path @jax.jit, pmap path lets pmap handle compilation | pmap inside JIT boundary is problematic; factory returns different function variants | quick-003 |
| Legacy fallback when batched_logp_fn is None | Backward compat for callers not providing traced-arg data | quick-003 |
| PAT-RL uses fully parallel loader (pat_rl_config.py) with zero imports from task_config.py | task_config.py has 21 callsites and TaskConfig.__post_init__ would reject PAT-RL structure; parallel stack keeps pick_best_cue tests isolated | 18-01 |
| env/__init__.py deliberately not updated with PAT-RL exports | Adding exports risks side-effects on pick_best_cue imports; PAT-RL callers use direct module import | 18-01 |
| SeedSequence 4-way spawn for PAT-RL trial generator (state/mag/dHR/reserved) | Independent child streams for each RNG role; reserved 4th stream lets Plan 18-04 add outcome draws without changing existing seeds | 18-02 |
| State carried forward across run boundaries in generate_session_patrl | Biological realism: context state is continuous; artificial reset at run boundaries would bias run-1 outcomes | 18-02 |
| PhenotypeParams uses PriorGaussian for kappa/mu3_0 (sd=0 allowed) | Avoids over-engineering separate FixedParam type before Models B/C/D clarify param variation needs | 18-01 |
| PAT-RL Model A EV direction: sigmoid(mu2)=P(dangerous); EV_approach=(1-P_danger)*V_rew - P_danger*V_shk | Consistent with state=1 meaning dangerous; at mu2=0,V_shk>>V_rew: P(approach)<<0.01 (validated in test 7) | 18-03 |
| pyhgf 0.2.8 kappa coupling via volatility_children=([child],[kappa]) not node_parameters | node_parameters dict does not accept coupling strength keys in pyhgf 0.2.8; tuple-of-lists is correct API | 18-03 |
| pyhgf 0.2.8 time_steps must be 1D np.ones(n_trials) not 2D matrix | 2D time_steps causes JAX carry-type shape mismatch in scan_fn | 18-03 |
| model_a_logp MU2_CLIP=30 (outer envelope); HGF-level clamping at |mu2|<14 (inner) | Conservative outer clip keeps sigmoid finite at export time; inner clamping handles fitting instability | 18-03 |
| float64 scan inputs in hierarchical_patrl._single_logp | pyhgf attrs are float64; jax.lax.cond in continuous_node_posterior_update requires dtype consistency between branches; float32 inputs cause TypeError when vmap'd | 18-04 |
| PAT-RL closure-based logdensity_fn (not traced-arg sample loop) | _build_sample_loop hardcodes pick_best_cue 7-arg logp signature; re-use would require modifying hierarchical.py (parallel-stack violation); closure path is correct for Phase 18 smoke | 18-04 |
| kappa injected via attrs[2]["volatility_coupling_children"] = jnp.asarray([kappa_i]) | Confirmed at runtime: kappa coupling strength is stored in attributes dict (not only edges), enabling per-participant dynamic injection inside lax.scan | 18-04 |
| log_beta parameterisation: beta sampled in log-space; prior N(log(beta_mean), beta_sd/beta_mean) | NUTS can freely explore without positivity boundary; delta-method approximation centres prior near config beta.mean | 18-04 |
| dcm_pytorch bilinear B-matrix path is LIVE in v0.3.0 (not deferred): parameterize_B + compute_effective_A in neural_state.py | Plan sketch was wrong; read neural_state.py:4-15 + coupled_system.py:20-73 in Task 1 audit | 18-05 |
| Modulator channel values for dcm_pytorch: raw float64, no bounding or normalization | dcm_pytorch neural_state.py:104-113: off-diagonal pass through via pure mask; N(0,1) prior does regularization | 18-05 |
| outcome_time_s feeds stimulus["times"] directly: both are absolute seconds from session start | Confirmed in task_simulator.py:74, ode_integrator.py:35-39; no time-axis transform needed | 18-05 |
| az.hdi returns "lower"/"higher" coordinate labels (not "low"/"high") in ArviZ 0.22+ | Verified at runtime; pivot in export_subject_parameters uses hdi="lower" and hdi="higher" selectors | 18-05 |
| pyhgf 0.2.8 temp keys confirmed: value_prediction_error, effective_precision, volatility_prediction_error all present | Runtime inspection in test_pyhgf_temp_keys_extracted canary test | 18-05 |
| 3-level-only cols (mu3/sigma3/epsilon3) present as NaN in 2-level trajectory CSV | Schema consistency: downstream concat/join across model variants works without column-presence check | 18-05 |
| _samples_to_idata() coord_name kwarg (default "participant"; PAT-RL passes "participant_id") | PRL pipeline and PAT-RL exporter (Plan 18-05) disagree on coord label; kwarg keeps PRL back-compat while making PAT-RL's contract with export_subject_trajectories explicit | 18-06 |
| Smoke script exit codes: 0 success / 1 runtime error / 2 blackjax missing | 3-state map lets CI/docs distinguish "real bug" from "environment not provisioned" without parsing stderr | 18-06 |
| Smoke pytest: 7 structural tests unconditional; end-to-end fit path exercised only by cluster SLURM | blackjax not in dev env; structural tests (compile, argparse, import-scan, lazy-blackjax) give meaningful local signal without MCMC cost | 18-06 |
| Cluster smoke runs CPU comp partition (not GPU) | Fit wall-clock 11.8s single-thread; GPU dispatch overhead dominates at this batch size; no justification for GPU hours | 18-06 |
| build_idata_from_laplace emits dim 'participant_id' natively (not 'participant') | NUTS path _samples_to_idata emits 'participant' (latent OQ1 bug); Laplace path sidesteps it by emitting consumer-correct dim without touching hierarchical.py (parallel-stack invariant) | 19-02 |
| cast(az.InferenceData, az.from_dict(...)) for mypy satisfaction | az.from_dict stub returns Any in arviz typeshed; cast is zero-overhead and makes return type explicit | 19-02 |
| simulate_patrl_cohort uses pure NumPy EV/choice computation (not JAX expected_value) | Original _simulate_cohort used inline NumPy math; importing JAX expected_value would change behavior and break numpy-only simulation path | 19-01 |
| scripts/12 imports only simulate_patrl_cohort (not run_hgf_forward_patrl) | run_hgf_forward_patrl is called inside simulate_patrl_cohort; no separate call site in script; unused import would trigger ruff F401 | 19-01 |
| jaxopt.LBFGS jit=True default; jit=False fallback on any exception with WARN | Non-traceable objects in config closure could cause jax tracing errors; fallback preserves correctness with logging | 19-03 |
| eigh-clip eps=1e-8 for PD regularization; ridge_added tracks actual shift | Cleaner than ridge-add loop; deterministic; logs exactly how many eigenvalues were clipped; no clipping needed on well-specified synthetic data | 19-03 |
| Dense (P*K)x(P*K) Hessian via jax.hessian on ravel_pytree flat vector | Tractable for P<=200; block-diagonal property documented in TODO; block-structured vmap path deferred to Phase 20+ | 19-03 |
| Re-project best_mode_params to param_order after LBFGS before ravel_pytree | JAX pytrees (dicts) are flattened in sorted-key order by jaxopt; ravel_pytree must see insertion order matching param_order to align cov columns with build_idata_from_laplace | 19-03 |
| kappa in native TruncatedNormal space for Phase 19; logit-reparam deferred (OQ2) | Avoids extra Jacobian complexity; cluster smoke (Plan 19-05) will reveal if MAP hits boundary | 19-03 |
| within_gate=pd.NA for non-omega_2 rows; True/False only for omega_2 | No tolerance defined for beta/omega_3/kappa/mu3_0 in Phase 19 (VB_LAPLACE_FEASIBILITY.md §6); pd.BooleanDtype allows mixed T/F/NA | 19-04 |
| NUTS dim rename on idata_nuts.copy() inside compare_posteriors; caller idata never mutated | Read-only contract for idata_nuts; rename scoped to comparison; caller can still use original NUTS idata for other purposes | 19-04 |
| _apply_hard_gates filters to df[df.parameter=='omega_2'] before .all() | Non-omega_2 rows have pd.NA in within_gate; .all() on mixed T/F/NA would raise or give wrong result | 19-04 |
| primary=laplace, secondary=blackjax for both mode; export consumes primary only | Laplace is Phase 19 new path; blackjax is baseline; primary/secondary naming makes data flow unambiguous | 19-05 |
| _sanity_check raises ValueError if method='both' passed directly; callers dispatch to leaf methods separately | Prevents accidental silent no-op; method='both' has no single idata to check | 19-05 |
| true_params.csv written only for laplace/both (not blackjax) to preserve Phase 18 outputs bit-for-bit | blackjax smoke was validated without recovery CSV; adding it would change expected output of existing tests | 19-05 |
| OQ7 closure memo deferred via TODO comment; written only after cluster NUTS numbers land | No useful content before cluster comparison data exists | 19-05 |
| Stochastic avoid contingency (Option B): P(reward|avoid)=0.10, P(shock|avoid)=0.10, P(nothing|avoid)=0.80 | Authoritative consumer spec (sister repo GSD_heart2adapt_sim.yaml H2A.1.1) explicit. Config surface wired in 20-01; stochastic logp/scan wiring deferred to 20-02/20-03 | 20-01 |
| PHENOTYPE_COLUMN_NAME = "phenotype" as module constant in pat_rl_config.py | Guards against column-name drift across sim_df → fit_df → BMS pipeline (RESEARCH.md §12 Risk 3) | 20-01 |
| Model A+b bias always sampled (b in every model, Normal prior): simplifies downstream BMS model comparison — no missing variable conditionals between A/B/C | 20-02 |
| Python-level response_model dispatch at factory-build time (not JAX if/elif in trace): factory creates typed vmapped closure; JAX trace stays clean and shape-invariant across models | 20-02 |
| jax.scipy.stats.norm.logpdf for closure priors in _build_patrl_log_posterior (Decision 119 preserved): no numpyro at closure-build time | 20-02 |
| Stochastic avoid intentionally NOT in Models A/B/C logp: EV=0 by safe-avoid assumption; stochastic avoid in config/sim only; logp wiring deferred to 20-03 Model D scan body | 20-02 |
| blackjax NUTS smoke for B/C deferred to cluster SLURM (Plan 20-07): only Laplace path exercised locally | 20-02 |
| 4 _PARAM_ORDER tuples added to laplace_idata.py for B/C 2-level+3-level: ravel_pytree flat order must match dict insertion order for Hessian column alignment | 20-02 |
| Decision 121 (Model D scan body): per-trial tonic_volatility injection via {**carry} dict copy inside lax.scan; 3-level kappa/omega_3/mu3_0 still injected once before scan; only omega_2 becomes trial-varying via lam | 20-03 |
| Decision 122 (lam prior): Normal(0.0, 0.1) closed over in logdensity_fn (Decision 119 pattern); sd=0.1 chosen for physiological interpretability (1 bpm ΔHR → ~0.1 omega shift) | 20-03 |
| Decision 123 (SC3 recovery): uses real ε₂-coupled generative simulator (Plan 20-04 already merged); bootstrap Normal(-1,0.5) fallback not needed; tighten gate post exact two-pass per-trial simulator | 20-03 |
| Laplace-only local smoke gate for Model D: blackjax NUTS path for D deferred to cluster (Plan 20-07), consistent with Models B/C policy from 20-02 | 20-03 |
| CLI exit codes: 0 all omega_2 gates pass / skip-nuts, 1 gate fails, 2 loader error | 3-state map mirrors smoke script convention (18-06); distinguishes gate failure from environment error | 19-04 |
| epsilon2 node index is 0 (input/observation node), not 1 (belief node): node_trajectories[1]['temp']['value_prediction_error'] is always 0 in pyhgf 0.2.8; actual ε₂ at node 0 (std=3.01 vs 0) | 20-04 |
| epsilon2_coupling_coef is POSITIVE in YAML; formula: ΔHR(t) = N(dhr_mean, dhr_sd) + coef * ε₂(t); positive coef + positive surprise ε₂ → ΔHR moves toward zero (less bradycardia); consistent with Klaassen 2024 | 20-04 |
| Model D two-pass generative uses mean-omega approx: omega_eff_mean = omega_2_true + lam_true * mean(delta_hr) as scalar; exact per-trial injection deferred (tracked as followup TODO in 20-04-SUMMARY.md) | 20-04 |
| M7 bridge: simulate_patrl_cohort(response_model='model_d', lam_true=...) kwarg pair closes Plan 20-03 λ-recovery loop; test_model_d_lambda_recovery_smoke_epsilon2_coupled (seed=404) added as sibling to 20-03's seed=42 test | 20-04 |
| Per-phenotype SeedSequence spawn: ss.spawn(len(phenotypes)) gives each phenotype its own child SS; each phenotype's SS then spawns n_per_phenotype grandchild seeds. Order-dependent: phenotypes=['healthy'] index 0 == phenotypes=None index 0 → subset determinism guaranteed (L10) | 20-05 |
| n_participants_per_phenotype=40 default in configs/pat_rl.yaml (SC5); total cohort 40×4=160 agents for PRL-V1/V2 formal gates (Phase 20-07). Old default was 8. | 20-05 |
| phenotypes=None → all 4 from config.simulation.phenotypes.keys() (insertion order). Passing phenotypes=['healthy'] produces identical healthy rows as full-cohort run with same master_seed (L10 property, verified by test). | 20-05 |
| SLURM env var defaults: PRL_PATRL_SMOKE_N=40 PRL_PATRL_SMOKE_PHENOTYPES=all in cluster/patrl_smoke.slurm (Plan 20-05 SC5). cluster/18_smoke_patrl_cpu.slurm left at N=5 to preserve prior smoke outputs. | 20-05 |
| b_true added to true_params in simulate_patrl_cohort (b ~ N(phenotype.b.mean, phenotype.b.sd)); was absent in Plan 20-04 — required for PRL-V1 parameter recovery validation (Plan 20-07). | 20-05 |
| Stochastic avoid deferred from simulator: choice loop uses EV_approach vs EV_avoid=0 (Model A softmax); avoid contingency outcomes wired only in logp path (Plans 20-02/20-03). No change for SC5 cohort scale. | 20-05 |
| Retire pre-2020 citations; substitute Klaassen 2024 (Comms Bio) for PAT-RL | Consumer-spec phenotype priors (Plan 20-01) supersede Browning 2015/Daw 2006; user approved scope 2026-04-18; no fabricated Terburg/Hulsman/Ly/Roelofs refs | 20-08 |
| compute_stratified_bms is new — run_stratified_bms preserved unchanged | Parallel-stack invariant per Decision 109; both call run_group_bms internally; neither delegates to the other | 20-06 |
| delta_f sign convention: delta_f = delta_waic (unscaled proxy for free-energy difference) | Under WAIC ≈ -2·log-evidence, delta_f ≈ delta_waic/2 + constant; constant cancels in PEB contrasts; exact scaling is consumer-dependent (RESEARCH §12 Risk 6); confirm at manuscript-prep | 20-06 |
| Phase 20 BMS/PEB uses Laplace-produced InferenceData as default input (fast-path via pre-populated log_likelihood) | Per user directive 2026-04-19; NUTS deferred to post-Phase-14-15; compute_subject_waic_patrl has slow-path fallback (JAX logp re-evaluation) for idatas without log_likelihood | 20-06 |
| PRL-V2 axis mapping: Option A (2x2 factorial) — ANXIETY_HIGH={high_anxiety, anxious_reward}, ANXIETY_LOW={healthy, reward_susceptible}, REWARD_HIGH={reward_susceptible, anxious_reward}, REWARD_LOW={healthy, high_anxiety}; 80 agents per side; supplementary B-style pairwise as secondary output | User decision 2026-04-19; standard in anxiety×reward literature (Klaassen 2024); maximises power at 160 agents | 20-07 |
| Default fit-method for PRL-V1 + PRL-V2: Laplace (NUTS deferred to post-Phase-14-15) | Laplace means agree with NUTS (Phase 19 OQ7 closure); over-wide β posterior does not affect PRL-V1/V2 gates which use posterior means | 20-07 |
| SC9 / SC11 / Option A axis mask tests enforce Phase 20 invariants | test_sc9_no_new_scripts_audit asserts zero A-lines in git diff scripts/; test_sc11_phase_18_19_regression_suite_green runs full regression as subprocess; test_option_a_factorial_axis_masks_are_correct imports scripts/06 and asserts frozenset constants | 20-07 |
| Scope-memo scan-body depth reported as "direct (@None callee) / inlined (sum of all nested @jit sub-fns)" | pyhgf's nested @partial(jit, static_argnames=...) decorators on beliefs_propagation, continuous_node_posterior_update, posterior_update_{precision,mean}_continuous_node cause each to appear as a separate func.func private MLIR block; raw @None callee count (23 for PAT-RL 3-level) understates real per-trial work (~175 inlined) | 21-01 |
| P=3 is the local traceable cohort size for jax.make_jaxpr + jax.jit.lower.as_text on CPU | P=50 would exceed the 5-min local wall-time cap and is exactly the shape that blew up on cluster (job 54899271); extrapolation rule (scan body shape-invariant under vmap, outer graph sub-linear in P) substituted for a P=50 measurement | 21-01 |
| Closure-over-data HLO signature confirmed at stablehlo.constant level | patrl_3level_P3.hlo.txt:3-8 contains state/reward/shock/mask arrays as `stablehlo.constant dense<"0x..."> : tensor<3x192xi32>` blobs (HLO constants); pick_best_cue HLO dump has same arrays as @main %arg5/6/7/8 (traced args, STATE #106/107 pattern); no verdict call yet — VERDICT (21-07) combines this with cache forensics (21-02) + VB-Laplace probe (21-03) | 21-01 |
| pyhgf 0.2.10 installed locally (research/plans cite 0.2.8); structural pattern re-confirmed unchanged | Nested `@partial(jit, static_argnames=...)` decorators are first-line decorations on each public entry point — unlikely to have shifted between patch releases; HLO findings valid for cluster environment (assumed same minor version) | 21-01 |
| Patch C (warmup_params on warm) landed — `fit_batch_hierarchical` already accepts `warmup_params` and returns `(idata, adapted_params)` when None | Signature verified at `src/prl_hgf/fitting/hierarchical.py:2012`; cold return tuple unpack + warm kwarg pass-through is a ~10-line edit with zero production-code churn; eliminates ~1100s NUTS warmup duplication that confounded job-54899271's 1.1x speedup observation | 21-02 |
| B4 rename + per_call_wall_clock sibling field in vb_laplace_vs_nuts_jit.json | JAX_LOG_COMPILES emits event COUNTS (not timings); per-stage wall-clock would require harness-splitting which CONTEXT explicitly rejects; full-pipeline wall-clock from time.perf_counter wrappers around cold/warm/next-proc is the timing signal we CAN measure; 5-key schema with bottleneck_layer 7-value enum (`logp_graph \| lbfgs_loop \| hessian_graph \| nuts_kernel \| cache_key \| both \| undetermined`) locks downstream 21-07 reader contract | 21-02 |
| --diagnostic-mode gate on _run_benchmark Patch A; probe entry points short-circuit before grid/chunk setup in main() | Production-default `--benchmark` keeps unchanged HLO (no JAX_LOG_COMPILES env pollution, no log-handler installation); probe invocations do not need the SBF grid (PAT-RL is their subject, not pick_best_cue); SLURM dispatch remains one-liner per probe | 21-02 |
| Laplace graph is SHAPE-INVARIANT at the cohort axis: cold compile at P=5 (41.8s) ≈ cold compile at P=20 (42.09s) on M3 GPU | VB-Laplace's per-participant LBFGS + hessian path is traced once per shape class and reused across P; the outer loop over participants is Python-level not JAX-traced — contrast with NUTS which scales 3.5x from P=5 to P=20 (commit 313031b Laplace job 54901170) | 21-03 |
| NUTS compile scales ~3.5x from P=5 (56.7s) to P=20 (195.4s), saturating at P=50 (229s): the sampler layer is the dominant shape-sensitive compile cost on top of the shape-invariant logp graph | Cross-sampler cache hits DO occur for the inner _single_logp scan body at matched keys; the scaling+cache-miss pathology localizes to the _run_vmap_chains._one_step outer scan (hierarchical.py:1144), NOT the logp graph (commit a3d991e NUTS job 54901802) | 21-04 |
| Persistent on-disk cache provides ~0% speedup across process boundaries for NUTS at EVERY P in {5, 20, 50} — reproduces the Phase 14 1.1x "cache-paradox" at small scale | cold_jit_s ≈ next_proc_warm_s at every tested P (55.5s/55.5s at P=5; 245.7s/245.7s at P=20; 229s/229s at P=50); the closure-over-data hypothesis (STATE #106/107 / RESEARCH Risk #5) applies specifically to the `_one_step` outer scan's BlackJAX kernel-state closure (21-05 chain jobs 54901803-54901808) | 21-05 |
| P=20 is a pathological shape for NUTS on the PAT-RL closure path: BOTH in-process tracing cache (1.09x speedup) AND cross-process persistent cache (1.00x speedup) fail; P=50 recovers to 2.49x in-process and 0.94x cross-process | Separate concern from the primary NUTS outer scan cache miss; 21-06 HLO-hash forensics can diff pscan_P20_cold vs pscan_P20_warm to determine whether the pathology is a stable HLO hash (XLA backend compile-time) or an unstable hash (another closure-over-data site) | 21-05 |

### Pending Todos

- manuscript/references.bib: mason2024 volume/page details need verification before submission
- quarto-arxiv extension must be installed before first arxiv-pdf render
- Phase 10 kappa effect size parameterization: verify kappa entry point in GroupConfig vs SessionConfig during Phase 10 planning (kappa delta lives in SessionConfig.kappa_deltas — confirmed in 08-01 tests, but grid parameterization for kappa needs review before Phase 10 sweep)
- Phase 10: run 100-iteration MAP vs NUTS pilot before committing to full NUTS budget

### Blockers/Concerns

- System Python 3.13 incompatible with pyhgf 0.2.8 — all work must use ds_env
- omega_3 parameter recovery expected to be challenging (known issue in literature)
- **v1.1 per-participant sequential MCMC is GPU-pessimal** — L40S benchmark showed ~1.5s/NUTS-sample vs ~5ms on CPU due to PCIe dispatch overhead. v1.2 refactor is mandatory for GPU feasibility.
- **Decision gate at Phase 14:** if batched hierarchical GPU benchmark is still > 50 GPU-hours per chunk, fall back to CPU `comp` partition (new batched code still wins over v1.1 sequential on CPU).
- pyhgf has no built-in NaN clamping — **RESOLVED in 12-02**: Layer 2 clamping implemented in hierarchical.py using jnp.where + tree_map (|mu_2| < 14 bound).
- `_init_jitter` PyTensor read-only-array bug means we can't use `pm.sample(...)` directly even with `nuts_sampler="numpyro"`; must call `pmjax.sample_numpyro_nuts()` directly. **RESOLVED in 16-01**: fit_batch_hierarchical now uses direct numpyro MCMC, bypassing PyMC/PyTensor entirely.
- **blackjax not installed in ds_env** — PAT-RL smoke tests (18-04 tests 5-6) skip via importorskip. Install blackjax on cluster before running smoke validation. Pre-existing: test_valid_02_batched_blackjax_convergence also fails for same reason.
- **VB-Laplace Option C CONFIRMED + OQ7 CLOSED (2026-04-18)**: Phase 18 cluster smoke (job 54894259) passed 13.9s / 0 divergences / 5/5 directional. Dual-fit rerun (job 54896739) produced the formal Gate #5 data in 22.4s on results/patrl_smoke/54896739/laplace_vs_nuts_diff.csv. Verdict: **posterior MEANS agree well** (4/5 within 0.06 on ω₂); **posterior WIDTHS diverge asymmetrically** (Laplace under-wide on ω₂ ~60% of NUTS sd; Laplace over-wide on β ~180% of NUTS sd — log→natural transform artifact). Neither downgrade trigger fired (>2× underestimation on >30% of agents: only 20%; NUTS walltime: 22.4s vs 6h budget). Use-case split: Laplace for point estimates + CI + iteration; NUTS for uncertainty-sensitive downstream (HDI, model comparison, PEB). See `VB_LAPLACE_CLOSURE_MEMO.md` (FINAL). See `.planning/quick/004-.../VB_LAPLACE_CLOSURE_MEMO.md`.
- **OQ1 RESOLVED (2026-04-18, quick-005)**: `hierarchical.py::_samples_to_idata` uses `coord_name="participant"` by default; docstring at line 1555 explicitly notes PAT-RL callers pass `coord_name="participant_id"`. PAT-RL fitting path (`hierarchical_patrl.py:88`) already does this correctly. The first cluster smoke failure (job 54893705) was a Phase 19-01 pre-refactor simulator issue, NOT OQ1. `export_subject_trajectories` being pick_best_cue-incompatible is intentional — it's the PAT-RL exporter. No code change required.

## Quick Tasks

| ID  | Name | Status | Summary |
|-----|------|--------|---------|
| 001 | Cluster GPU Setup & Smoke Test | Complete | M3 SLURM infrastructure + smoke test PASS |
| 002 | HGF Fitting Lessons Obsidian Doc | Complete | Comprehensive coding guide in Obsidian Vault covering math, JAX/NumPyro patterns, cluster pitfalls |
| 003 | JIT Cache: Data as Traced Args | Complete | BlackJAX sampling loop restructured so data arrays flow as traced JIT args for persistent XLA cache hits |
| 004 | PAT-RL Smoke + VB-Laplace Feasibility | Complete | Cluster SLURM for Phase 18 PAT-RL smoke; --dry-run flag; 5 structural tests; 4 scratch files deleted; 6 PLAN.md files tracked; VB-Laplace Option C recommendation | [004-SUMMARY](./quick/004-patrl-smoke-and-vb-laplace-feasibility/004-SUMMARY.md) |
| 005 | PAT-RL Handoff + Cluster Fixes | Complete | Cluster SLURM outputs to tracked `results/patrl_smoke/<job>/` + .nc files + `--fit-method both` default; OQ1 resolved as doc-gap; OQ7 closure memo; `docs/PAT_RL_API_HANDOFF.md` ships single-source-of-truth PAT-RL API for dcm_hgf_mixed_models v2 | [005-SUMMARY](./quick/005-patrl-handoff-and-cluster-fixes/005-SUMMARY.md) |

### Roadmap Evolution

- Phase 16 added (2026-04-13): NumPyro direct sampling + CUDA fix — replace PyMC wrapper with direct numpyro MCMC to enable JIT cache reuse; fix CUDA PTX mismatch; add environment diagnostics
- Phase 17 added (2026-04-15): BlackJAX NUTS sampler — replace NumPyro MCMC with BlackJAX to eliminate ~1800s JIT recompilation per call; restore multi-GPU pmap for chain parallelism
- Phase 17-01 complete (2026-04-15): BlackJAX core + orchestrator — _build_log_posterior, _run_blackjax_nuts, _samples_to_idata, fit_batch_hierarchical rewrite
- Phase 17-02 complete (2026-04-15): BlackJAX smoke tests + SLURM updates — 4 new fast tests (logp, gradient, idata), VALID-02 blackjax convergence test, SLURM scripts updated for BlackJAX default
- Phase 18 added (2026-04-17): PAT-RL Task Adaptation (the consumer study) — new binary-state approach/avoid task config, trial generator, response models A-D (including trial-varying omega), trajectory export for DCM bridge, and phenotype-stratified BMS. Source: GSD_prl_hgf.yaml. **Caveat**: Multiple YAML assumptions conflict with repo (config loader is task-specific, no `trial_sequence.py` exists, response model signature differs, Delta-HR plumbing absent, no phenotype framework). Integration notes captured inline in ROADMAP.md Phase 18 entry. Consider promoting to v1.3 the consumer study milestone before planning.
- Phase 19 added (2026-04-18): VB-Laplace Fit Path (Tapas-Parity Validation) — implements `fit_vb_laplace_patrl.py` as a second, non-MCMC fit path alongside BlackJAX NUTS. Mirrors matlab tapas HGF toolbox (quasi-Newton MAP + Laplace covariance from numerical Hessian at the mode). Reuses `_build_patrl_log_posterior` from `hierarchical_patrl.py` without modification. ArviZ `InferenceData` output shape-compatible with the NUTS path so the existing Plan 18-05 exporters accept both. Unblocks PEB development immediately + gives a deterministic reference fit to validate cluster NUTS posteriors against. Source of record: `.planning/quick/004-.../VB_LAPLACE_FEASIBILITY.md` Option C. Explicitly implementation (not feasibility re-exploration).
- Phase 21 added (2026-04-19): Benchmark Bottleneck Diagnosis — Graph Scope + SVI Probe + JIT Cache Forensics. Triggered by Phase 14 benchmark job 54899271 (cold 2197s / warm 1965s / 1.1x speedup / 8h walltime killed before `benchmark_batched.json` was written). **Purely diagnostic** phase — does not re-execute the Phase 14 production bench. Produces: (a) `benchmark-scope-memo.md` quantifying batched hierarchical PAT-RL logp size + FLOPs/draw against Stan/NumPyro 8-schools, Radon-hierarchical, BNNs, transformer/CNN forward passes; (b) `svi_vs_nuts_jit.json` isolating whether the bottleneck is the logp graph or the NUTS sampler by running `numpyro.infer.SVI` on the identical `_build_patrl_log_posterior` closure; (c) `cache_forensics.md` answering whether `.jax_cache_gpu` actually populates and whether Phase-1 N=2 and Phase-2 N=50 HLO hashes collide (STATE #106/107 traced-args vs closure path — PAT-RL uses closure via decision #119); (d) `jit_scaling_sweep.csv` with cold/warm (same-proc + next-proc) JIT timings at P ∈ {2, 5, 20, 50} in separate ≤30-min SLURM jobs; (e) `VERDICT.md` naming the single dominant bottleneck + concrete fix recommendation at PR level. **Anti-patterns banned**: bumping walltime, shrinking production cohort, patching `apply_decision_gate` thresholds before verdict. Sister to 14.1-03 (Phase 14.1-03 still owns the `benchmark_batched.json` write — Phase 21 only makes that run cheap and principled).
- Phase 20 added (2026-04-18): PAT-RL Scientific Completion — Models B/C/D + Cohort Scale + Config-Correctness. Closes every remaining gap between prl_hgf's PAT-RL surface and the downstream sister-repo study hypotheses (consumer-side task spec; not tracked in this toolbox). Fixes `configs/pat_rl.yaml` contingencies/run-order/magnitudes/phenotype-priors to match consumer spec exactly (supersedes Phase 18 config); adds response bias `b` to Model A; implements Models B, C, D (incl. trial-varying ω scan body for D); adds phenotype-specific ε₂-coupled ΔHR generative model; scales cohort to 40×4=160; phenotype-stratified BMS with PEB Δ-evidence export; formal PRL-V1 (r≥0.7) + PRL-V2 (Cohen's d≥0.5) gates. **User architectural directives**: (a) NO new scripts — extend existing numbered scripts (`03_simulate_participants.py`, `04_fit_participants.py`, `05_run_validation.py`, `06_group_analysis.py`, `scripts/12_smoke_patrl_foundation.py`) via config-driven adaptation; (b) citations must be ≥2020, prefer Karin Roelofs' Nijmegen group (Klaassen 2021/2024, Terburg 2020+, Hulsman 2020+, Ly 2022+) — retire the Browning 2015 / Daw 2006 defaults from Phase 18 config; (c) config-driven only — every behavioural variant reachable via `configs/pat_rl.yaml` key, no hardcoded magic numbers, no new CLI flags that belong in YAML. (d) **Project-agnostic naming**: all new code, configs, docs, and commits use generic terminology ("PAT-RL task", "consumer study", "downstream sister-repo") — NO study codename references. Supersedes Phase 18 Option A deferrals.

## Session Continuity

Last session: 2026-04-19 (Wave 2 cluster data complete + SUMMARY docs)
Stopped at: Completed plans 21-03, 21-04, 21-05. Wave 2 cluster evidence assembled: vb_laplace_vs_nuts_jit.json (5 keys + nuts_per_p_scaling extension), jit_scaling_sweep.csv (8 rows at P=5/20/50 all status=completed), 10 raw JAX_LOG_COMPILES logs, 10 text-IR HLO dump directories. Key findings: Laplace shape-invariant, NUTS 3.5x shape-sensitive, persistent cache 0% cross-process at all P (Phase 14 1.1x paradox reproduced). Wave 2 SUMMARYs (21-03/21-04/21-05) committed locally as a single bundled docs commit. All cluster artifacts already on origin/main via per-job auto-push.
Resume file: None
Next action: 21-06 cache forensics (HLO-hash diff across hlo_dumps/{laplace,nuts,pscan}_P*/ → cache_forensics.md) + 21-07 VERDICT synthesis. Still pending: Cluster 160-agent PRL-V1/V2 numeric runs (`sbatch cluster/patrl_smoke.slurm` with Laplace default) and 14.1-03 GPU benchmark — both deferred until Phase 21 VERDICT settles the persistent-cache-miss fix.
