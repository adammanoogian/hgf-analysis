# VB-Laplace Feasibility Memo — PAT-RL Parameter Fitting

**Status:** Decision memo (no implementation)
**Context:** Phase 18 foundation shipped. NUTS sampling friction observed.
User asks: mirror matlab tapas VB-Laplace to get pipeline running?
**Decision owner:** user (you)
**Drafted by:** Claude, quick-004 planner → executor

---

## 1. Current sampling friction — concrete diagnosis

The most recent cluster run is `cluster/logs/smoke16cpu_54882395.out`
(Phase 16/17 CPU smoke, 3-level HGF, 5 agents/group, 30 participant-sessions,
tune=500 draws=500, 2 chains, fp32, partition=comp, m3e106).

**Observed numbers:**

| Stage | Walltime |
|-------|----------|
| Simulation (vmap) | 9.76 s |
| Cold JIT (first MCMC call, XLA compilation + 10 draws) | **11,687.95 s (~3.2 h)** |
| Warm JIT #1 (same shape, different seed) | 7,974.84 s (~2.2 h) |
| Warm JIT #2 (pure execute, cache hit confirmed) | 8,049.49 s (~2.2 h) |

**NUTS diagnostics (all three runs):**
- `integration_steps`: mean=1023, p50=1023, p95=1023, max=1023
  → **all chains hitting max_tree_depth=10 cap every step**
- `trajectory_expansions`: mean=10, max=10 (capped)
- `acceptance_rate`: 0.921 (cold), 1.000 (warm 1/2)
- `divergence_rate`: 0.000

**Interpretation of the four friction sources:**

1. **max_tree_depth saturation**: integration_steps=1023 = 2^10 − 1 means
   NUTS always doubles the trajectory to the cap.  This indicates the
   posterior has very long autocorrelation length relative to the step size,
   or the geometry is difficult (banana-shaped κ × ω₃ ridge).  Each NUTS
   step does 2^10 leapfrog steps instead of ~4–16 for a well-conditioned
   posterior.  This alone inflates wall time ~64–256× vs ideal.

2. **Warm JIT still slow (~8000 s) after confirmed cache hit**: XLA cache
   reuse is working (delta: +0 files warm run), but the MCMC loop itself
   is ~8000 s for 10 draws × 2 chains.  That is ~400 s/draw — pure sampling
   cost, not compilation.  At 500 draws this would be ~56 h on CPU for the
   PAT-RL 5-agent smoke.

3. **XLA compile time (cold)**: 11,688 s cold vs 7,975 s warm → ~3,700 s
   overhead for XLA tracing.  Not the bottleneck once cache warms.

4. **No PAT-RL smoke logs yet**: `cluster/logs/` contains no
   `patrl18smoke_*.out` files.  The Phase 18 PAT-RL smoke
   (`cluster/18_smoke_patrl_cpu.slurm`) has not been run yet.  The numbers
   above are from the Phase 16/17 pick_best_cue 3-level smoke — a reasonable
   proxy for the PAT-RL 3-level case since both use the same BlackJAX NUTS
   path and similar posterior geometry.

**Bottom line**: even with a warm XLA cache, NUTS for 3-level HGF costs
~400 s/draw on CPU, driven by max_tree_depth saturation.  The 2-level case
(no κ × ω₃ ridge) will be substantially faster, but by how much is unknown
until `18_smoke_patrl_cpu.slurm` runs.

---

## 2. tapas VB-Laplace — algorithm recap

Reference: Mathys et al. 2011 (Frontiers in Human Neuroscience), Mathys et al.
2014 (Frontiers in Neuroscience); tapas toolbox functions `tapas_fitModel.m`,
`tapas_hgf_binary_config.m`, `tapas_quasinewton_optim.m`,
`tapas_riddersmatrix.m`.

**Algorithm (6 steps):**

1. **Reparametrise** constrained parameters to unconstrained space: logit
   for bounded [a, b] (kappa), log for positive-only (beta), identity for
   real-line (ω₂, ω₃).  tapas ships a per-config transform function
   (`tapas_hgf_binary_config.m::rp`).  The unconstrained vector is θ̃.

2. **Define objective**: negative log-joint in unconstrained space:
   `f(θ̃) = −[log p(y | g(θ̃)) + log p(g(θ̃))]`
   where `g` is the inverse transform (unconstrained → native).
   This is the same quantity that the JAX log-posterior computes with
   opposite sign.

3. **Quasi-Newton optimisation**: find the MAP estimate θ̃* using BFGS with
   Wolfe line-search conditions (`tapas_quasinewton_optim.m`).  Starting
   point: unconstrained prior means.  Convergence tolerance: gradient norm
   < 1e-3 (configurable).  Typical iterations: 30–200 for HGF-binary.

4. **Numerical Hessian** at θ̃* via Ridders' extrapolation
   (`tapas_riddersmatrix.m`): 5-stencil central-difference scheme with
   Richardson extrapolation over step-size; error ~ O(h^6).  Ridders is
   needed in matlab because the log-joint is evaluated by calling the
   perceptual model, which is not symbolically differentiable.

5. **Laplace approximation**: posterior ≈ N(θ̃*, H^{-1}) where
   H = −∇²f(θ̃*) is the negative Hessian of the log-joint at the mode
   (positive definite for a well-conditioned posterior).  The inverse
   Hessian Σ̃ is the approximate posterior covariance in unconstrained space.

6. **Back-transform**: apply the delta rule to propagate the Gaussian
   approximation to native parameter space:
   `μ_native = g(θ̃*)`
   `Σ_native ≈ J · Σ̃ · J^T`
   where J = diag(∂g_i/∂θ̃_i) is the Jacobian of `g` evaluated at θ̃*.
   For log-transform, J_ii = exp(θ̃_i*) = μ_native_i.  For logit-transform,
   J_ii = (b−a) · σ(θ̃_i*) · (1−σ(θ̃_i*)).

**Output per subject**: `{mean_native: dict, cov_native: ndarray,
logp_at_mode: float, n_iterations: int, converged: bool}`.

**Runtime**: seconds to a few minutes per subject (deterministic; no chain
management).  No chain diagnostics by construction — no R̂, no ESS, no
divergence count.

---

## 3. Mapping onto this repo's existing logp surface

**Existing substrate — no change to any existing module needed for the memo;
referenced here for implementation scoping.**

`src/prl_hgf/fitting/hierarchical_patrl.py::_build_patrl_log_posterior`
already produces a JAX-traceable scalar `log p(θ | data)` (log-joint) for
one or more subjects.  The function signature:

```python
def _build_patrl_log_posterior(
    logp_fn: Any,          # batched logp from build_logp_fn_batched_patrl
    config: PATRLConfig,
    model_name: str,
) -> Any:  # returns: dict[str, jnp.ndarray] -> scalar
```

The returned `logdensity_fn(params: dict) -> scalar` is **JAX-differentiable**
throughout: `build_logp_fn_batched_patrl` uses `jax.vmap` + `jax.lax.cond`
over the pyhgf scan; `numpyro.distributions.Normal.log_prob` is JAX-native.
No Python callbacks, no numpy calls inside the traced path.

This means:

- `jax.grad(logdensity_fn)` gives the exact gradient — free, used by NUTS
  already.
- `jax.hessian(logdensity_fn)` gives the exact autodiff Hessian at any
  point — **materially cheaper and more accurate than Ridders' numerical
  differentiation** (tapas's bottleneck at higher parameter counts).
- `jaxopt.LBFGS` or `scipy.optimize.minimize(method='L-BFGS-B', jac=...)`)
  with `jax.grad`-derived gradients can find θ̃* in the unconstrained space.

**Proposed new module (scoped here, not built in this plan):**

```
src/prl_hgf/fitting/fit_vb_laplace_patrl.py
```

Key surface:

```python
def fit_vb_laplace_patrl(
    subject_df: pd.DataFrame,
    model_name: str,        # "hgf_2level_patrl" | "hgf_3level_patrl"
    response_model: str,    # "model_a" for Phase 18
    config: PATRLConfig,
) -> VBLaplacePosterior:   # dataclass: mean_unconstrained, cov_unconstrained,
                            #            mean_native, cov_native,
                            #            logp_at_mode, n_iterations, converged
```

A sibling exporter `export_subject_trajectories_vb_laplace` would accept
`VBLaplacePosterior` and produce the same CSV schema as
`export_subject_trajectories` (Phase 18-05) — a shim layer, not a fork.

**Parallel-stack invariant preserved**: new module lives under `fitting/`,
does NOT touch `hierarchical.py` or `hierarchical_patrl.py`.  Both NUTS
and VB-Laplace paths coexist and share `_build_patrl_log_posterior`.

---

## 4. Implementation cost estimate

| Deliverable | Estimated scope |
|-------------|----------------|
| `fit_vb_laplace_patrl.py` (MAP + Hessian + back-transform) | ~200 LOC |
| Unit tests (MAP recovery on 2-participant synthetic data) | ~120 LOC |
| Exporter shim to existing trajectory CSV schema | ~60 LOC |
| DCM-pytorch interface compat | Zero changes — `(mean, cov)` tuple already aligns with dcm_pytorch `stimulus["values"]` contract established in Phase 18-05 |

**Dependencies**: no new packages.  `jaxopt` is available in the JAX
ecosystem (`pip install jaxopt`; one-line addition to requirements if needed).
`jax.hessian` is in JAX core.  `scipy.optimize` is a transitive dependency
already.

**Execution time**: one quick plan, 2 tasks, wave 1.  Days of Claude
execution time, not weeks.

---

## 5. Tradeoffs vs BlackJAX NUTS

| Dimension | BlackJAX NUTS | VB-Laplace |
|-----------|---------------|------------|
| Runtime per subject | ~400 s/draw × 500 draws ≈ **55 h** (CPU, 3-level, worst-case from smoke log) | **< 60 s** (typical; deterministic) |
| Uncertainty quality | Full posterior (multimodal-safe, asymmetry-safe) | Gaussian at mode (unimodal assumption; silently wrong if posterior is banana-shaped) |
| Diagnostics | R̂, ESS, divergence rate | Convergence flag + Hessian condition number |
| Multimodal posteriors | Handled | Silently collapses to one mode |
| Pipeline readiness | Blocked until max_tree_depth saturation resolved | Ready in 1 quick plan |
| Matches matlab tapas baseline | No | Yes — enables direct cross-validation against published tapas fits |
| PEB-ready | Yes (via posterior draws → moments) | Yes (via mean + cov moments directly) |
| κ × ω₃ posterior geometry | NUTS struggles (max_tree_depth=10 every step) | Laplace ALSO struggles (ridge → poorly conditioned Hessian, large condition number) |
| 2-level model (no κ) | Likely feasible with tighter priors | Well-conditioned — preferred quick path |
| Hessian computation | Not applicable | Exact autodiff via `jax.hessian` (no Ridders' numerical error) |

**Key honest caveat**: VB-Laplace does NOT solve the κ × ω₃ geometry
problem.  A banana-shaped or multimodal posterior gives a Laplace
approximation that is locally correct at the mode but globally wrong.  For
the **2-level model** (κ not in play, ω₂ and log_beta well-separated), this
concern is substantially reduced — Laplace is well-calibrated for
low-dimensional near-Gaussian posteriors.

For the **3-level model**, both NUTS (max_tree_depth saturation) and Laplace
(poorly conditioned Hessian at the mode) will struggle.  Neither is a clean
solution.  The correct fix for 3-level is a reparametrisation (centred →
non-centred for ω₃) or blocking the κ-ω₃ step — a separate task regardless
of which primary path is chosen.

---

## 6. Recommendation

**Recommended: Option C** — implement VB-Laplace in quick-005 as a *second*
fit path alongside BlackJAX NUTS.  Export both; compare posteriors on shared
smoke subjects.  Both paths land in the pipeline; user selects per downstream
analysis.

**Rationale:**

1. **Implementation cost is small relative to staying blocked**: ~380 LOC
   across module + tests + shim.  One quick plan.  The existing
   `_build_patrl_log_posterior` is already JAX-differentiable so exact
   Hessian via `jax.hessian` is essentially free — materially better than
   tapas's Ridders' matrix approach and no new dependencies beyond `jaxopt`.

2. **Unblocks PEB development immediately**: VB-Laplace posterior moments
   (mean + covariance) are exactly the inputs dcm_pytorch needs for the
   PEB second-level GLM.  We can begin PEB pipeline work while the cluster
   NUTS run converges for validation.

3. **Mirrors the matlab tapas norm**: VB-Laplace is the default fit path in
   tapas; MCMC is opt-in.  Having both gives a published comparison point
   for any manuscript Methods section that reviewers will check against the
   tapas HGF literature.

4. **Option C preserves optionality**: if the first real cluster NUTS run of
   `18_smoke_patrl_cpu.slurm` finishes in < 6 h with < 10% divergences on
   2-level, NUTS is the primary path and Laplace is the validation crosscheck.
   If NUTS blows the walltime budget, Laplace is the primary path and NUTS
   is deferred.  Option C works either way.

**Downgrade triggers:**

- Downgrade to **Option A** (Laplace primary, NUTS deferred) only if the
  first real PAT-RL cluster smoke blows past 6 h walltime or shows > 20%
  divergences on the 2-level model.

- Downgrade to **Option B** (NUTS only) only if VB-Laplace unit tests on a
  synthetic 2-participant cohort show the Laplace covariance underestimates
  true posterior width by > 2× on ω₂ — a precision inflation failure that
  would compromise PEB second-level inference by making the group mean appear
  more certain than it is.

---

## 7. Non-goals of this memo

- No benchmarking. No timings beyond section 1's recap of existing logs.
- No matlab code translation — we map onto the existing JAX logp surface,
  not port tapas line-for-line.
- No DISCOVERY.md. No Context7 queries. Algorithm recap is from public
  Mathys et al. 2011/2014 and the tapas toolbox (both author-released).
- No decision on PEB implementation. Belongs in a separate phase (19+).
- No implementation in this plan. `fit_vb_laplace_patrl.py` is quick-005.
