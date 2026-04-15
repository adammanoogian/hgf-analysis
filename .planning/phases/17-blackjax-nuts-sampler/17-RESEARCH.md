# Phase 17: BlackJAX NUTS Sampler - Research

**Researched:** 2026-04-14
**Domain:** BlackJAX MCMC, pure JAX log-posterior, multi-GPU chain parallelism
**Confidence:** HIGH (official docs + source code verified)

## Summary

Phase 17 replaces NumPyro MCMC with BlackJAX NUTS in the fitting pipeline.
The core problem is that NumPyro internally recreates function objects on
each MCMC step, preventing JAX from reusing its JIT compilation cache. This
causes ~1800s per-call recompilation on L40S GPUs. BlackJAX solves this by
compiling the NUTS step function exactly once via `jax.jit` and reusing it
across all MCMC steps and power-sweep iterations.

The migration requires: (1) a pure JAX log-posterior function combining
priors with the existing `batched_logp_fn`, (2) BlackJAX `window_adaptation`
for warmup (step size + mass matrix), (3) a `lax.scan`-based inference loop,
(4) manual ArviZ `InferenceData` construction via `az.from_dict`, and (5)
multi-GPU chain parallelism via `jax.pmap` or the newer sharding API.

The existing `build_logp_fn_batched` function returns a pure JAX callable
that takes parameters and data, computes the HGF scan via `lax.scan`, and
returns scalar log-likelihood. This function is unchanged. The priors
(TruncatedNormal, Normal) can be computed using `numpyro.distributions`
`.log_prob()` methods standalone (they are pure JAX, no model context
needed), or via `jax.scipy.stats` functions. The former is simpler and
matches the existing prior specification exactly.

**Primary recommendation:** Use BlackJAX 1.2.4+ (compatible with JAX
0.4.31). Build the log-posterior as `prior_logp + batched_logp_fn(...)`.
Use `blackjax.window_adaptation(blackjax.nuts, logposterior_fn)` for warmup,
then `lax.scan` with `blackjax.nuts(...).step` for sampling. Collect
`NUTSInfo.is_divergent` for diagnostics. Convert to ArviZ via `az.from_dict`
with `(chain, draw, participant)` shaped arrays.

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| blackjax | >=1.2.4 | NUTS kernel + window_adaptation | Pure functional JAX sampler; no function-object recreation; JIT-once pattern |
| jax | >=0.4.26,<0.4.32 | JIT, vmap, pmap, lax.scan | Already pinned in pyproject.toml |
| numpyro.distributions | (via numpyro) | Prior log_prob computation | Pure JAX; `.log_prob()` works standalone without model context; matches existing priors exactly |
| arviz | >=0.21.0 | `az.from_dict()` for InferenceData | Already pinned; manual construction with custom dims/coords |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| numpyro | >=0.15.0 | Only for `numpyro.distributions` (prior logp) | Keep as dependency but NOT for MCMC; only use distributions module |
| nvidia-cuda-nvcc-cu12 | 12.8.93 | PTX compiler for XLA parallel compilation | Cluster GPU nodes only (already installed) |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| numpyro.distributions for priors | jax.scipy.stats.truncnorm.logpdf + norm.logpdf | jax.scipy.stats.truncnorm uses standardized bounds (a, b in std devs from mean), easy to get wrong; numpyro.distributions matches existing code verbatim |
| blackjax.window_adaptation | Manual step size + identity mass matrix | Window adaptation handles dual averaging + mass matrix; manual tuning is fragile |
| az.from_dict | az.from_numpyro | from_numpyro requires NumPyro MCMC object; BlackJAX has no native ArviZ converter |
| jax.pmap for multi-GPU | jax.shard_map (newer API) | pmap is simpler and well-tested; shard_map is more powerful but more complex; both work |

**Installation:**
```bash
pip install "blackjax>=1.2.4"
```

## Architecture Patterns

### Recommended Module Structure

The refactoring modifies `src/prl_hgf/fitting/hierarchical.py` only. No new
modules needed.

```
src/prl_hgf/fitting/
  hierarchical.py
    - _build_scan_inputs()         # KEEP (unchanged)
    - _clamped_scan()              # KEEP (unchanged)
    - _compute_logp()              # KEEP (unchanged)
    - build_logp_fn_batched()      # KEEP (unchanged) - returns pure JAX logp
    - _build_log_posterior()        # NEW: combines priors + batched_logp_fn
    - _run_blackjax_nuts()          # NEW: window_adaptation + lax.scan loop
    - _samples_to_idata()           # NEW: BlackJAX states -> ArviZ InferenceData
    - fit_batch_hierarchical()      # REWRITE: orchestrator using BlackJAX
    - _numpyro_model_3level()       # KEEP (for backward compat / validation)
    - _numpyro_model_2level()       # KEEP (for backward compat / validation)
```

### Pattern 1: Pure JAX Log-Posterior

**What:** Combine prior log-probs with the batched HGF log-likelihood into
a single function that BlackJAX can differentiate.

**When to use:** Required for BlackJAX -- it takes a single `logdensity_fn`
callable.

**Key design:** The logdensity function must accept a single pytree
(dict of parameter arrays) and return a scalar. Data arrays are captured via
closure (they have fixed shape per call, enabling JIT cache reuse).

```python
# Source: BlackJAX quickstart + numpyro.distributions docs
import jax.numpy as jnp
import numpyro.distributions as dist

def _build_log_posterior(
    batched_logp_fn,
    input_data,     # (P, T, 3) - captured in closure
    observed,       # (P, T, 3)
    choices,        # (P, T)
    trial_mask,     # (P, T)
    n_participants,
    model_name="hgf_3level",
):
    """Return a logdensity_fn: dict -> scalar for BlackJAX."""
    is_3level = model_name == "hgf_3level"

    # Define priors (matching _numpyro_model_3level exactly)
    prior_omega_2 = dist.TruncatedNormal(loc=-3.0, scale=2.0, high=0.0)
    prior_log_beta = dist.Normal(0.0, 1.5)
    prior_zeta = dist.Normal(0.0, 2.0)
    if is_3level:
        prior_omega_3 = dist.TruncatedNormal(loc=-6.0, scale=2.0, high=0.0)
        prior_kappa = dist.TruncatedNormal(loc=1.0, scale=0.5, low=0.01, high=2.0)

    def logdensity_fn(params):
        """params: dict with keys omega_2, omega_3, kappa, log_beta, zeta.
        Each value has shape (P,)."""
        omega_2 = params["omega_2"]
        log_beta = params["log_beta"]
        beta = jnp.exp(log_beta)
        zeta = params["zeta"]

        # Sum prior logp across participants
        prior_lp = jnp.sum(prior_omega_2.log_prob(omega_2))
        prior_lp += jnp.sum(prior_log_beta.log_prob(log_beta))
        prior_lp += jnp.sum(prior_zeta.log_prob(zeta))

        if is_3level:
            omega_3 = params["omega_3"]
            kappa = params["kappa"]
            prior_lp += jnp.sum(prior_omega_3.log_prob(omega_3))
            prior_lp += jnp.sum(prior_kappa.log_prob(kappa))
            likelihood_lp = batched_logp_fn(
                omega_2, omega_3, kappa, beta, zeta,
                input_data, observed, choices, trial_mask,
            )
        else:
            likelihood_lp = batched_logp_fn(
                omega_2, beta, zeta,
                input_data, observed, choices, trial_mask,
            )

        return prior_lp + likelihood_lp

    return logdensity_fn
```

### Pattern 2: BlackJAX Window Adaptation + NUTS Sampling

**What:** Two-phase MCMC: warmup (adaptation) then sampling via `lax.scan`.

**When to use:** Every call to `fit_batch_hierarchical`.

```python
# Source: BlackJAX official quickstart + multi-chain docs
import blackjax

def _run_blackjax_nuts(
    logdensity_fn,
    initial_position,     # dict of (P,) arrays
    rng_key,
    n_tune=1000,
    n_draws=1000,
    n_chains=4,
    target_accept=0.95,
):
    rng_key, warmup_key, sample_key = jax.random.split(rng_key, 3)

    # Phase 1: Window adaptation (step size + mass matrix)
    warmup = blackjax.window_adaptation(
        blackjax.nuts,
        logdensity_fn,
        target_acceptance_rate=target_accept,
        is_mass_matrix_diagonal=True,
    )
    (warmup_state, parameters), warmup_info = warmup.run(
        warmup_key, initial_position, num_steps=n_tune,
    )

    # Phase 2: Build NUTS kernel with adapted parameters
    nuts = blackjax.nuts(logdensity_fn, **parameters)

    # Phase 3: Sampling loop via lax.scan (JIT-compiled once)
    @jax.jit
    def one_step(state, rng_key):
        state, info = nuts.step(rng_key, state)
        return state, (state, info)

    keys = jax.random.split(sample_key, n_draws)
    _, (states, infos) = jax.lax.scan(one_step, warmup_state, keys)

    return states, infos, parameters
```

### Pattern 3: Multi-Chain with pmap/vmap Fallback

**What:** Run chains in parallel across GPUs (pmap) or vectorized on
single GPU (vmap).

**When to use:** Always -- fall back to vmap when only 1 GPU available.

```python
# Source: BlackJAX multi-chain docs + JAX pmap docs
def _run_multi_chain(
    logdensity_fn, initial_position, rng_key,
    n_tune, n_draws, n_chains, target_accept,
):
    n_devices = jax.device_count()

    if n_devices >= n_chains:
        # Multi-GPU: one chain per device via pmap
        return _run_pmap_chains(...)
    else:
        # Single GPU: vectorize chains via vmap
        return _run_vmap_chains(...)

def _run_vmap_chains(
    logdensity_fn, initial_position, rng_key,
    n_tune, n_draws, n_chains, target_accept,
):
    """Run n_chains via vmap on a single device."""
    chain_keys = jax.random.split(rng_key, n_chains)

    # Warmup each chain independently (vmapped)
    warmup = blackjax.window_adaptation(
        blackjax.nuts, logdensity_fn,
        target_acceptance_rate=target_accept,
    )

    def _warmup_one(key):
        (state, params), _ = warmup.run(key, initial_position, n_tune)
        return state, params

    warmup_states, warmup_params = jax.vmap(_warmup_one)(chain_keys)

    # Build per-chain NUTS kernels (all share same logdensity_fn)
    # NOTE: parameters may differ per chain after adaptation
    # Use the mean step_size and mass matrix across chains
    mean_step_size = jnp.mean(warmup_params["step_size"])
    mean_inv_mass = jnp.mean(
        warmup_params["inverse_mass_matrix"], axis=0,
    )
    nuts = blackjax.nuts(
        logdensity_fn, mean_step_size, mean_inv_mass,
    )

    # Sampling loop: vmap kernel across chains at each step
    @jax.jit
    def one_step(states, rng_key):
        keys = jax.random.split(rng_key, n_chains)
        states, infos = jax.vmap(nuts.step)(keys, states)
        return states, (states, infos)

    sample_keys = jax.random.split(rng_key, n_draws)
    _, (all_states, all_infos) = jax.lax.scan(
        one_step, warmup_states, sample_keys,
    )
    # all_states.position: dict of (n_draws, n_chains, P) arrays
    return all_states, all_infos
```

### Pattern 4: ArviZ InferenceData from BlackJAX Samples

**What:** Convert BlackJAX sample states to ArviZ InferenceData with
proper dimensions and coordinates.

**When to use:** After sampling, before returning from
`fit_batch_hierarchical`.

```python
# Source: ArviZ from_dict docs
import arviz as az
import numpy as np

def _samples_to_idata(
    states,          # BlackJAX NUTSState with positions
    infos,           # BlackJAX NUTSInfo with diagnostics
    var_names,       # ["omega_2", "omega_3", ...]
    participant_ids, # ["P001", "P002", ...]
    n_chains,
    n_draws,
):
    """Convert BlackJAX samples to ArviZ InferenceData.

    BlackJAX states.position is a dict of arrays shaped:
    - vmap: (n_draws, n_chains, n_participants)
    - single chain: (n_draws, n_participants)

    ArviZ expects: (n_chains, n_draws, *dims)
    """
    posterior_dict = {}
    for var in var_names:
        arr = np.asarray(states.position[var])
        # Reshape from (n_draws, n_chains, P) to (n_chains, n_draws, P)
        if arr.ndim == 3:
            arr = np.transpose(arr, (1, 0, 2))
        elif arr.ndim == 2:
            # Single chain: add chain dim
            arr = arr[np.newaxis, ...]
        posterior_dict[var] = arr

    # Add deterministic: beta = exp(log_beta)
    if "log_beta" in posterior_dict:
        posterior_dict["beta"] = np.exp(posterior_dict["log_beta"])

    # Sample stats: divergences
    sample_stats = {}
    if hasattr(infos, "is_divergent"):
        div_arr = np.asarray(infos.is_divergent)
        if div_arr.ndim == 2:
            div_arr = np.transpose(div_arr, (1, 0))
        elif div_arr.ndim == 1:
            div_arr = div_arr[np.newaxis, :]
        sample_stats["diverging"] = div_arr

    if hasattr(infos, "acceptance_rate"):
        acc_arr = np.asarray(infos.acceptance_rate)
        if acc_arr.ndim == 2:
            acc_arr = np.transpose(acc_arr, (1, 0))
        elif acc_arr.ndim == 1:
            acc_arr = acc_arr[np.newaxis, :]
        sample_stats["acceptance_rate"] = acc_arr

    dims = {var: ["participant"] for var in posterior_dict}
    coords = {"participant": participant_ids}

    idata = az.from_dict(
        posterior=posterior_dict,
        sample_stats=sample_stats,
        dims=dims,
        coords=coords,
    )
    return idata
```

### Anti-Patterns to Avoid

- **Recreating nuts kernel per step:** The whole point of BlackJAX is that
  `nuts.step` is a static function. Never rebuild `blackjax.nuts(...)` inside
  the `lax.scan` body.

- **Capturing mutable state in logdensity_fn:** The logdensity function must
  be a pure function. Data arrays captured in closure are fine (immutable
  JAX arrays), but never capture Python lists or mutable objects.

- **Using `jax.pmap` with single GPU:** pmap on 1 device silently works but
  adds overhead. Always check `jax.device_count()` and fall back to vmap.

- **Ignoring warmup_state after adaptation:** Always use the state returned
  by `warmup.run()` as the initial state for sampling. Do NOT re-init from
  the original position.

- **Vmapping warmup with different initial positions per chain:** BlackJAX
  vmap warmup works, but if different chains find very different mass
  matrices, the averaged matrix may be poor. Better to warmup once, or
  warmup per chain and keep per-chain parameters (harder to implement).

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Step size adaptation | Manual dual averaging | `blackjax.window_adaptation` | Stan's 3-phase warmup is battle-tested; custom impl will miss edge cases |
| Mass matrix estimation | Covariance from initial samples | `blackjax.window_adaptation` | Expanding-window scheme handles initial instability; manual estimation fails early |
| Truncated normal logpdf | `jax.scipy.stats.truncnorm.logpdf` with manual bound conversion | `numpyro.distributions.TruncatedNormal(...).log_prob()` | jax.scipy.stats uses standardized bounds (a, b as std devs from mean, not absolute); easy to get wrong |
| Divergence detection | Manual energy tracking | `NUTSInfo.is_divergent` field | BlackJAX computes it automatically with configurable threshold |
| MCMC progress bar | tqdm wrapper | `blackjax[progress]` optional dep | Built-in support for progress tracking |

**Key insight:** BlackJAX is low-level by design -- it gives you the kernel
and you build the loop. The temptation is to add convenience wrappers, but
the only "convenience" needed is `window_adaptation` for warmup. Everything
else is a straightforward `lax.scan`.

## Common Pitfalls

### Pitfall 1: Forgetting to JIT the Inference Loop

**What goes wrong:** Without `@jax.jit` on the `one_step` function inside
`lax.scan`, each step triggers Python-level dispatch. This is 100x slower
than JIT'd execution.

**Why it happens:** BlackJAX's `nuts.step` returns a Python function that
is NOT pre-jitted. You must wrap it.

**How to avoid:** Always decorate the `one_step` function with `@jax.jit`,
or JIT the outer `lax.scan` call.

**Warning signs:** Sampling takes minutes per step instead of milliseconds.

### Pitfall 2: Wrong Array Shape for ArviZ

**What goes wrong:** BlackJAX returns `(n_draws, n_chains, ...)` but ArviZ
expects `(n_chains, n_draws, ...)`. If you pass wrong shapes, ArviZ silently
creates wrong-shaped datasets.

**Why it happens:** `lax.scan` stacks along axis 0 (draws); vmap adds axis
1 (chains). This is the opposite of ArviZ convention.

**How to avoid:** Always transpose: `np.transpose(arr, (1, 0, 2))` before
passing to `az.from_dict`.

**Warning signs:** `idata.posterior["omega_2"].dims` shows unexpected
dimension ordering.

### Pitfall 3: Position Dict Keys Must Match Exactly

**What goes wrong:** BlackJAX's `HMCState.position` is a pytree (dict).
The keys must be consistent between initialization and the logdensity
function. Mismatched keys cause silent errors or NaN gradients.

**Why it happens:** No validation layer between position dict and
logdensity_fn parameter unpacking.

**How to avoid:** Use a canonical parameter dict with explicit key names.
Test with a single evaluation before launching MCMC.

**Warning signs:** NaN in first MCMC step; gradient contains NaN.

### Pitfall 4: Standardized Bounds in jax.scipy.stats.truncnorm

**What goes wrong:** `jax.scipy.stats.truncnorm.logpdf(x, a, b, loc, scale)`
uses standardized bounds: `a = (low - loc) / scale`, `b = (high - loc) / scale`.
If you pass absolute bounds, the prior is wrong.

**Why it happens:** Scipy convention differs from numpyro/pymc where you
specify `low` and `high` directly.

**How to avoid:** Use `numpyro.distributions.TruncatedNormal` which accepts
absolute bounds via `low=` and `high=` kwargs. Its `.log_prob()` is pure JAX.

**Warning signs:** Prior logp values are very different from expected.

### Pitfall 5: Warmup State vs Initial Position Confusion

**What goes wrong:** After `warmup.run()`, you must use the returned `state`
(which has adapted position and cached gradients) as the initial state for
sampling. Re-initializing from the original position wastes the warmup.

**Why it happens:** The API returns `(state, parameters)` but users sometimes
only use `parameters` and re-init the state.

**How to avoid:** `(warmup_state, params), _ = warmup.run(...)` then pass
`warmup_state` to the sampling loop.

### Pitfall 6: Mass Matrix Averaging Across vmap Chains

**What goes wrong:** When running warmup per-chain via vmap, each chain may
find different mass matrices. Using a single kernel with averaged parameters
may be suboptimal.

**Why it happens:** vmap warmup returns per-chain parameters; BlackJAX
NUTS takes a single step_size and inverse_mass_matrix.

**How to avoid:** Two options: (a) average the adapted parameters across
chains and use a single kernel (simpler, usually fine), or (b) run each
chain with its own kernel (requires restructuring the vmap loop).

**Recommendation:** Option (a) -- average parameters. With IID priors and
5 participants, the posterior geometry is similar across chains.

### Pitfall 7: NUTSInfo Not Collected in lax.scan

**What goes wrong:** The standard inference_loop pattern discards `info`:
`state, _ = kernel(rng_key, state)`. This loses divergence information.

**Why it happens:** Tutorial examples optimize for simplicity.

**How to avoid:** Always collect info: `state, info = kernel(rng_key, state)`
and return both from the scan: `return state, (state, info)`.

**Warning signs:** Cannot report divergences post-sampling.

### Pitfall 8: BlackJAX + L40S pmap Safety

**What goes wrong:** NumPyro's pmap path triggers `psum` operations that
hit JAX bug #31626 on L40S GPUs. BlackJAX does NOT use `psum` internally.

**Why it happens:** NumPyro uses `psum` for chain synchronization; BlackJAX
chains are fully independent.

**How to avoid:** BlackJAX + pmap is safe on L40S. The bug only applies to
NumPyro's chain_method="parallel" codepath.

## Code Examples

### Complete Warmup + Sampling Workflow

```python
# Source: BlackJAX official docs (quickstart + multi-chain)
import blackjax
import jax
import jax.numpy as jnp

def run_blackjax_nuts(
    logdensity_fn,
    initial_position,   # dict of (P,) arrays
    rng_key,
    n_tune=1000,
    n_draws=1000,
    target_accept=0.95,
):
    """Single-chain BlackJAX NUTS with window adaptation."""
    rng_key, warmup_key, sample_key = jax.random.split(rng_key, 3)

    # Warmup: adapts step_size and inverse_mass_matrix
    warmup = blackjax.window_adaptation(
        blackjax.nuts,
        logdensity_fn,
        target_acceptance_rate=target_accept,
        is_mass_matrix_diagonal=True,
    )
    (state, parameters), _ = warmup.run(
        warmup_key, initial_position, num_steps=n_tune,
    )

    # Build kernel with adapted parameters
    kernel = blackjax.nuts(logdensity_fn, **parameters).step

    # Sampling loop
    @jax.jit
    def one_step(state, rng_key):
        new_state, info = kernel(rng_key, state)
        return new_state, (new_state, info)

    keys = jax.random.split(sample_key, n_draws)
    _, (states, infos) = jax.lax.scan(one_step, state, keys)

    return states, infos, parameters
```

### Prior Computation with numpyro.distributions (Standalone)

```python
# Source: NumPyro distributions docs
import numpyro.distributions as dist
import jax.numpy as jnp

# These are pure JAX -- no model context needed
omega_2_prior = dist.TruncatedNormal(loc=-3.0, scale=2.0, high=0.0)
omega_3_prior = dist.TruncatedNormal(loc=-6.0, scale=2.0, high=0.0)
kappa_prior = dist.TruncatedNormal(loc=1.0, scale=0.5, low=0.01, high=2.0)
log_beta_prior = dist.Normal(0.0, 1.5)
zeta_prior = dist.Normal(0.0, 2.0)

# Compute log-prior for a parameter vector of shape (P,)
omega_2_vals = jnp.array([-3.0, -2.5, -4.0])
lp = jnp.sum(omega_2_prior.log_prob(omega_2_vals))  # scalar
# This is JIT-compatible and differentiable via JAX
```

### Divergence Extraction from NUTSInfo

```python
# Source: BlackJAX NUTS source (blackjax/mcmc/nuts.py)
# NUTSInfo fields:
#   momentum, is_divergent, is_turning, energy,
#   trajectory_leftmost_state, trajectory_rightmost_state,
#   num_trajectory_expansions, num_integration_steps, acceptance_rate

# After sampling:
states, infos = run_nuts(...)

# infos.is_divergent: (n_draws,) bool array per chain
n_divergent = int(jnp.sum(infos.is_divergent))
print(f"Divergences: {n_divergent}/{n_draws}")

# infos.acceptance_rate: (n_draws,) float array
mean_accept = float(jnp.mean(infos.acceptance_rate))
print(f"Mean acceptance rate: {mean_accept:.3f}")
```

### az.from_dict with Custom Dims and Coords

```python
# Source: ArviZ from_dict docs
import arviz as az
import numpy as np

# Samples shape: (n_chains, n_draws, n_participants)
posterior = {
    "omega_2": np.random.randn(4, 1000, 5),
    "log_beta": np.random.randn(4, 1000, 5),
    "beta": np.exp(np.random.randn(4, 1000, 5)),
    "zeta": np.random.randn(4, 1000, 5),
}

sample_stats = {
    "diverging": np.zeros((4, 1000), dtype=bool),
    "acceptance_rate": np.ones((4, 1000)) * 0.95,
}

idata = az.from_dict(
    posterior=posterior,
    sample_stats=sample_stats,
    dims={var: ["participant"] for var in posterior},
    coords={"participant": ["P001", "P002", "P003", "P004", "P005"]},
)

# idata.posterior["omega_2"].dims == ("chain", "draw", "participant")
# idata.posterior.coords["participant"] == ["P001", ..., "P005"]
```

### pmap/vmap Fallback Pattern

```python
# Source: JAX pmap docs + BlackJAX multi-chain docs
import jax

def _choose_chain_strategy(n_chains):
    n_devices = jax.device_count()
    if n_devices >= n_chains:
        return "pmap"
    else:
        return "vmap"

# pmap pattern: one chain per device
def _run_pmap_chains(kernel, initial_states, sample_keys, n_draws):
    """initial_states: pytree with leading dim = n_chains (one per device)."""

    def _sample_one_chain(rng_key, state):
        @jax.jit
        def one_step(s, k):
            s, info = kernel(k, s)
            return s, (s, info)
        keys = jax.random.split(rng_key, n_draws)
        _, (states, infos) = jax.lax.scan(one_step, state, keys)
        return states, infos

    # pmap: distribute chains across devices
    states, infos = jax.pmap(_sample_one_chain)(sample_keys, initial_states)
    return states, infos  # (n_chains, n_draws, ...) shape
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| NumPyro MCMC with `numpyro.sample()` + `numpyro.factor()` | BlackJAX NUTS with pure JAX logposterior | Phase 17 (this phase) | Eliminates ~1800s recompilation; cold JIT < 120s target |
| `az.from_numpyro(mcmc)` | `az.from_dict(posterior, sample_stats, dims, coords)` | Phase 17 | Manual but full control over dimensions and coordinates |
| `chain_method="vectorized"` (NumPyro vmap) | `jax.pmap` or `jax.vmap` (BlackJAX) | Phase 17 | pmap safe on L40S (no psum); vmap fallback on single GPU |
| `jax.pmap` (deprecated upstream) | `jax.shard_map` (newer API) | JAX 0.4.x+ | pmap still works; shard_map is future-proof but more complex |
| `jit_model_args=True` (NumPyro) | JIT is inherent (one `jax.jit` on step fn) | Phase 17 | No special flag needed; BlackJAX's functional design enables natural JIT |

**Deprecated/outdated:**
- `jax.pmap`: JAX team recommends `jax.shard_map` for new code (since ~JAX 0.4.x).
  However, `pmap` still works and is simpler. For this project, `pmap` is fine.
- BlackJAX `Algorithm` classes: removed in BlackJAX 1.2.0. Use the functional
  API (`blackjax.nuts`, `blackjax.window_adaptation`) instead.

## Open Questions

1. **Vmap warmup per-chain parameter averaging**
   - What we know: vmap across chains during warmup produces per-chain step_size
     and inverse_mass_matrix. Using a single kernel requires averaging these.
   - What's unclear: Whether averaging degrades NUTS efficiency for this
     specific model (5 correlated parameters x P participants).
   - Recommendation: Start with single warmup (not per-chain). If posterior
     quality degrades, switch to per-chain warmup with averaged params.

2. **BlackJAX 1.2.4 vs 1.5 for JAX 0.4.31**
   - What we know: The cluster has JAX 0.4.31 pinned. BlackJAX 1.5 targets
     JAX 0.9.x (released April 2026). BlackJAX 1.2.4 was released Sep 2024
     when JAX 0.4.x was current.
   - What's unclear: Whether BlackJAX 1.3 or 1.4 still works with JAX 0.4.31,
     or if they require JAX 0.5+.
   - Recommendation: Install `blackjax==1.2.4` first (known JAX 0.4.x compat).
     Test. Only upgrade if a needed feature is missing.

3. **Initial position strategy**
   - What we know: BlackJAX window_adaptation starts from an initial position
     dict. The prior modes are reasonable starting points.
   - What's unclear: Whether starting all participants at the same prior mode
     is sufficient, or if some randomization helps warmup convergence.
   - Recommendation: Start at prior modes (omega_2=-3.0, omega_3=-6.0,
     kappa=1.0, log_beta=0.0, zeta=0.0) for all participants.

4. **lax.scan inside logdensity + BlackJAX compatibility**
   - What we know: The HGF scan uses `jax.lax.scan` inside the logdensity
     function. BlackJAX takes gradients via `jax.grad` of the logdensity.
     `lax.scan` supports reverse-mode autodiff natively.
   - What's unclear: Whether the nested scan (BlackJAX sampling loop scan +
     HGF logdensity scan) causes any XLA compilation issues.
   - Recommendation: This should work fine -- JAX handles nested scans.
     Validate with a smoke test early.

## Sources

### Primary (HIGH confidence)
- BlackJAX GitHub (https://github.com/blackjax-devs/blackjax) - README, source code
- BlackJAX quickstart (https://blackjax-devs.github.io/blackjax/examples/quickstart.html) - API patterns
- BlackJAX multi-chain (https://blackjax-devs.github.io/blackjax/examples/howto_sample_multiple_chains.html) - pmap/vmap patterns
- BlackJAX NUTS source (https://github.com/blackjax-devs/blackjax/blob/main/blackjax/mcmc/nuts.py) - NUTSInfo fields
- BlackJAX window_adaptation source (https://github.com/blackjax-devs/blackjax/blob/main/blackjax/adaptation/window_adaptation.py) - API and return types
- BlackJAX PyPI (https://pypi.org/project/blackjax/) - version 1.5 (Apr 2026), Python >=3.11
- NumPyro distributions (https://num.pyro.ai/en/stable/distributions.html) - standalone log_prob usage
- ArviZ from_dict (https://python.arviz.org/en/stable/api/generated/arviz.from_dict.html) - manual InferenceData construction
- JAX truncnorm.logpdf (https://docs.jax.dev/en/latest/_autosummary/jax.scipy.stats.truncnorm.logpdf.html) - standardized bounds

### Secondary (MEDIUM confidence)
- BlackJAX arxiv paper (https://arxiv.org/html/2402.10797v2) - architecture overview
- PyMC Discourse on BlackJAX divergences (https://discourse.pymc.io/t/sampling-with-blackjax-no-divergence-report/13394) - divergence reporting gaps
- BlackJAX GPU performance issue #597 (https://github.com/blackjax-devs/blackjax/issues/597) - NUTS control-flow overhead on GPU

### Tertiary (LOW confidence)
- BlackJAX release notes date accuracy (release dates from PyPI may be off)
- jax.shard_map as pmap replacement timing (verified direction, not exact version boundary)

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - BlackJAX API verified from source code and official docs
- Architecture: HIGH - Patterns from official examples; logdensity_fn pattern verified
- Prior implementation: HIGH - numpyro.distributions standalone usage verified in docs
- ArviZ conversion: HIGH - az.from_dict is well-documented; shape conventions verified
- Multi-GPU: MEDIUM - pmap pattern from docs but L40S-specific safety claim based on architecture analysis (BlackJAX has no psum)
- Version compatibility: MEDIUM - BlackJAX 1.2.4 was current during JAX 0.4.31 era but exact pin not verified via CI
- Pitfalls: HIGH - derived from docs, source code, and community reports

**Research date:** 2026-04-14
**Valid until:** 2026-05-14 (BlackJAX API is stable; 30 days)
