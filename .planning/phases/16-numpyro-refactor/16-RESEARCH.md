# Phase 16: NumPyro Direct Sampling + CUDA Fix - Research

**Researched:** 2026-04-13
**Domain:** NumPyro direct MCMC, JAX JIT caching, CUDA/XLA compatibility
**Confidence:** HIGH (core API verified via official docs and source code)

## Summary

Phase 16 replaces the PyMC bridge (`pmjax.sample_numpyro_nuts`) with direct
NumPyro MCMC calls.  The current pipeline builds a fresh `pm.Model()` each
call, captures data as JAX compile-time constants via closure, and pays
~800s JIT compilation on every iteration with different data.  The fix:
define a numpyro model function that takes data as arguments to `MCMC.run()`,
making data a dynamic traced argument so JAX reuses the compiled XLA kernel
across iterations with same-shaped but different data.

The secondary fix pins `nvidia-cuda-nvcc-cu12` to match the NVIDIA driver's
CUDA version (12.8) so XLA re-enables parallel compilation.

**Primary recommendation:** Use the numpyro model function approach (with
`numpyro.sample()` + `numpyro.factor()`) rather than the raw `potential_fn`
approach.  This gives clean ArviZ integration via `az.from_numpyro()` and
proper parameter naming.  Use `chain_method="vectorized"` with 4 chains on
a single GPU.  For JIT cache reuse across iterations, wrap the MCMC
construction and run inside a helper that reuses the same MCMC object with
`jit_model_args=True` and `num_chains=1` called 4 times sequentially, OR
use `chain_method="vectorized"` (which JITs a single kernel for all chains)
and accept one recompilation per iteration but benefit from vectorized
execution.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| numpyro | >=0.15.0 | Direct MCMC sampling (NUTS) | Already a transitive dep via PyMC; eliminates PyMC bridge overhead |
| jax | >=0.4.26,<0.4.32 | JIT compilation, vmap, lax.scan | Already pinned in pyproject.toml |
| arviz | >=0.21.0 | `az.from_numpyro()` converts MCMC samples to InferenceData | Already pinned; native numpyro support |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| nvidia-cuda-nvcc-cu12 | 12.8.93 | PTX compiler matching driver CUDA 12.8 | Cluster GPU nodes only |
| nvidia-nvjitlink-cu12 | 12.8.93 | JIT linker matching driver | Cluster GPU nodes only |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| numpyro model function | numpyro `potential_fn` | potential_fn gives raw control but loses `az.from_numpyro()` named params; samples are unnamed dicts or `Param:0` |
| `chain_method="vectorized"` | `chain_method="sequential"` + `jit_model_args=True` | sequential reuses JIT cache across `run()` calls with `num_chains=1` but runs chains serially; vectorized runs all 4 chains in one kernel |
| Direct numpyro | blackjax | blackjax is lower-level; no ArviZ integration; more boilerplate for same benefit |

**Installation (cluster only):**
```bash
pip install "nvidia-cuda-nvcc-cu12==12.8.93" "nvidia-nvjitlink-cu12==12.8.93"
```

## Architecture Patterns

### Recommended Refactoring Structure

The key change is in `src/prl_hgf/fitting/hierarchical.py`.  The module
currently has ~1000 lines split into:

1. Per-participant logp functions (keep unchanged)
2. vmap'd batched logp (keep unchanged)
3. PyTensor Op wrapper (`_BatchedLogpOp`, `_BatchedGradOp`) -- REMOVE
4. `jax_funcify` dispatch -- REMOVE
5. `build_pymc_model_batched()` -- REMOVE or deprecate
6. `fit_batch_hierarchical()` -- REWRITE to use numpyro directly

```
src/prl_hgf/fitting/
  hierarchical.py          # Refactored: numpyro model + MCMC
    - _build_scan_inputs()       # KEEP (unchanged)
    - _clamped_scan()            # KEEP (unchanged)
    - _compute_logp()            # KEEP (unchanged)
    - build_logp_fn_batched()    # NEW: returns pure JAX function (no Op)
    - _numpyro_model()           # NEW: numpyro model with sample+factor
    - fit_batch_hierarchical()   # REWRITE: numpyro MCMC directly
    - _build_arrays_single()     # KEEP (unchanged)
    - [downstream helpers]       # KEEP (unchanged)
```

### Pattern 1: NumPyro Model Function with `numpyro.factor()`

**What:** Define priors using `numpyro.sample()` with proper distributions,
then add the custom HGF logp via `numpyro.factor()`.  Data is passed as
arguments to the model function and forwarded to `MCMC.run()`.

**When to use:** This is the primary pattern for the entire refactor.

**Example:**
```python
# Source: NumPyro official docs + forum discussion
import numpyro
import numpyro.distributions as dist
from numpyro.infer import MCMC, NUTS

def numpyro_model_3level(
    input_data,   # (P, T, 3) -- dynamic argument
    observed,     # (P, T, 3) -- dynamic argument
    choices,      # (P, T)    -- dynamic argument
    trial_mask,   # (P, T)    -- dynamic argument
    n_participants,  # int, static
):
    """NumPyro model: 3-level HGF with independent priors per participant."""
    # Priors -- shape (n_participants,)
    omega_2 = numpyro.sample(
        "omega_2",
        dist.TruncatedNormal(
            loc=-3.0, scale=2.0, low=-8.0, high=0.0
        ).expand([n_participants]),
    )
    omega_3 = numpyro.sample(
        "omega_3",
        dist.TruncatedNormal(
            loc=-6.0, scale=2.0, low=-12.0, high=0.0
        ).expand([n_participants]),
    )
    kappa = numpyro.sample(
        "kappa",
        dist.TruncatedNormal(
            loc=1.0, scale=0.5, low=0.01, high=2.0
        ).expand([n_participants]),
    )
    # log_beta for unconstrained sampling, then transform
    log_beta = numpyro.sample(
        "log_beta",
        dist.Normal(0.0, 1.5).expand([n_participants]),
    )
    beta = numpyro.deterministic("beta", jnp.exp(log_beta))
    zeta = numpyro.sample(
        "zeta",
        dist.Normal(0.0, 2.0).expand([n_participants]),
    )

    # Custom logp via the existing vmapped JAX function
    logp = batched_logp_fn(
        omega_2, omega_3, kappa, beta, zeta,
        input_data, observed, choices, trial_mask,
    )
    numpyro.factor("hgf_loglike", logp)


# Running MCMC with data as arguments:
kernel = NUTS(numpyro_model_3level)
mcmc = MCMC(
    kernel,
    num_warmup=1000,
    num_samples=1000,
    num_chains=4,
    chain_method="vectorized",
    progress_bar=True,
)
mcmc.run(
    rng_key,
    input_data=jax_input_data,      # dynamic argument
    observed=jax_observed,           # dynamic argument
    choices=jax_choices,             # dynamic argument
    trial_mask=jax_trial_mask,       # dynamic argument
    n_participants=n_participants,   # static (Python int)
)

# Convert to ArviZ InferenceData:
idata = az.from_numpyro(
    mcmc,
    dims={"omega_2": ["participant"], "omega_3": ["participant"], ...},
    coords={"participant": participant_ids},
)
```

### Pattern 2: JIT Cache Reuse Strategy

**What:** The key goal is avoiding ~800s recompilation on each power sweep
iteration.  Two viable strategies exist.

**Strategy A: Reuse MCMC object with `jit_model_args=True` (single chain)**

```python
kernel = NUTS(numpyro_model_3level)
mcmc = MCMC(
    kernel,
    num_warmup=n_tune,
    num_samples=n_draws,
    num_chains=1,
    jit_model_args=True,
    chain_method="sequential",
    progress_bar=False,
)

# First call: cold JIT
mcmc.run(rng_key_0, input_data=data_iter0, ...)

# Second call with DIFFERENT data (same shapes): warm JIT
mcmc.run(rng_key_1, input_data=data_iter1, ...)
# ^^^^ This reuses the compiled kernel -- near-zero JIT overhead

# Run 4 chains by calling run() 4 times with different rng_keys
# and concatenating samples manually.
```

**Limitation:** `jit_model_args=True` does NOT work with `num_chains > 1`.
This is a documented NumPyro limitation.

**Strategy B: Vectorized chains + JAX persistent cache**

```python
mcmc = MCMC(
    kernel,
    num_warmup=n_tune,
    num_samples=n_draws,
    num_chains=4,
    chain_method="vectorized",
    progress_bar=False,
)

# Set JAX persistent compilation cache (in SLURM script):
# export JAX_COMPILATION_CACHE_DIR="/scratch/.../jax_cache"
# export JAX_PERSISTENT_CACHE_MIN_ENTRY_SIZE_BYTES=0

# First call: cold JIT (~seconds, not ~800s because data is dynamic)
mcmc.run(rng_key, input_data=data_iter0, ...)
```

**Advantage:** Even without `jit_model_args`, the numpyro model traces data
as a dynamic argument.  The XLA HLO graph depends only on shapes, not
values.  So JAX's persistent cache naturally reuses across iterations.  The
key win is that data is NOT a closure constant (unlike the PyMC bridge).

**RECOMMENDED:** Strategy B.  The fundamental problem was never about
`jit_model_args` per se -- it was that the PyMC bridge captured data in
closures, making values part of the trace.  With numpyro direct, data is a
traced argument regardless of `jit_model_args`.  Vectorized chains give the
best single-GPU throughput for 4 chains.

### Pattern 3: ArviZ Conversion with Participant Coords

**What:** Convert numpyro MCMC output to InferenceData with named dims.

```python
import arviz as az

idata = az.from_numpyro(
    mcmc,
    dims={
        "omega_2": ["participant"],
        "omega_3": ["participant"],
        "kappa": ["participant"],
        "log_beta": ["participant"],
        "beta": ["participant"],
        "zeta": ["participant"],
    },
    coords={
        "participant": participant_ids,
    },
)

# Attach group/session metadata (same as current code)
idata.posterior = idata.posterior.assign_coords(
    participant_group=("participant", participant_groups),
    participant_session=("participant", participant_sessions),
)
```

### Anti-Patterns to Avoid

- **Building a new MCMC object per iteration:** The MCMC object should be
  created ONCE (with the model function and kernel) and `.run()` called
  repeatedly with different data.  Creating a new MCMC object triggers
  recompilation.

- **Capturing data in closure:** The entire point of the refactor is to
  avoid `def model(): ... captured_data ...`.  Data MUST be a function
  argument to the model, forwarded via `MCMC.run()`.

- **Using `potential_fn` instead of model function:** While `potential_fn`
  works, it loses named parameter tracking.  `az.from_numpyro()` will
  name samples as `Param:0`, `Param:1`, etc., requiring manual renaming.
  Use model function with `numpyro.sample()` instead.

- **Using `chain_method="parallel"` on single GPU:** `parallel` uses
  `jax.pmap` which distributes across devices.  With 1 GPU and 4 chains,
  it falls back to sequential.  Use `"vectorized"` for single-GPU.

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| InferenceData conversion | Manual dict-to-xarray | `az.from_numpyro(mcmc, dims=..., coords=...)` | Handles chain/draw dims, deterministic sites, coord assignment |
| Truncated priors | Manual log_prob with bounds | `numpyro.distributions.TruncatedNormal(loc, scale, low=, high=)` | Correct gradient through transform; proper NUTS geometry |
| Half-normal for beta | Manual abs(Normal) | `log_beta ~ Normal(); beta = Deterministic(exp(log_beta))` | The current approach already does this correctly; replicate it |
| CUDA version check | Custom subprocess parsing | `nvidia-smi --query-gpu=driver_version` + `ptxas --version` comparison | Standard diagnostic pattern |
| Multi-chain on single GPU | Manual loop + concatenate | `chain_method="vectorized"` | Vectorized chains are JIT'd into one kernel; manual loop misses vectorization |

**Key insight:** The biggest "don't hand-roll" item is the PyMC-to-numpyro
bridge itself.  The current `build_pymc_model_batched()` + `_BatchedLogpOp`
+ `jax_funcify.register` is ~200 lines of boilerplate whose sole purpose is
to make PyMC call numpyro.  Going direct to numpyro eliminates all of it.

## Common Pitfalls

### Pitfall 1: jit_model_args Does Not Work with num_chains > 1

**What goes wrong:** Setting `jit_model_args=True` with `num_chains=4` and
`chain_method="parallel"` does NOT prevent recompilation.  The documentation
explicitly states this limitation.

**Why it happens:** The parallel chain mechanism uses `jax.pmap` which
creates a different compilation path than the single-chain JIT.

**How to avoid:** Either (a) use `num_chains=1` with `jit_model_args=True`
and run 4 separate chains manually, or (b) use `chain_method="vectorized"`
which compiles one kernel for all chains (no per-chain compilation overhead).

**Warning signs:** Second iteration still takes as long as the first.
Monitor JIT timing in the benchmark.

### Pitfall 2: Prior Specification Mismatch

**What goes wrong:** The PyMC model uses `pm.TruncatedNormal` with specific
parameterisation.  The numpyro equivalent uses different parameter names
(`loc`/`scale` vs `mu`/`sigma`; `low`/`high` vs `lower`/`upper`).

**Why it happens:** PyMC and numpyro have different API conventions.

**How to avoid:** Map priors carefully:

| PyMC | NumPyro |
|------|---------|
| `pm.TruncatedNormal("x", mu=-3, sigma=2, upper=0, shape=P)` | `numpyro.sample("x", dist.TruncatedNormal(loc=-3, scale=2, high=0).expand([P]))` |
| `pm.Normal("x", mu=0, sigma=1.5, shape=P)` | `numpyro.sample("x", dist.Normal(0, 1.5).expand([P]))` |
| `pm.Deterministic("beta", pm.math.exp(log_beta))` | `numpyro.deterministic("beta", jnp.exp(log_beta))` |
| `pm.Potential("loglike", logp_op(...))` | `numpyro.factor("loglike", logp_value)` |

**Warning signs:** VALID-01/02 tests fail after refactor.

### Pitfall 3: Shape Convention Differences

**What goes wrong:** PyMC uses `shape=(P,)` on priors to create IID
parameters.  NumPyro uses `.expand([P])` or `plate("participants", P)`.

**Why it happens:** Different frameworks, different idioms.

**How to avoid:** Use `.expand([P])` on each distribution.  Do NOT use
`numpyro.plate()` -- plate implies conditional independence structure that
affects the log density computation.  Since we have independent priors
with a custom likelihood via `factor()`, simple `.expand()` is correct.

### Pitfall 4: CUDA PTX Version > Driver Version

**What goes wrong:** XLA disables parallel compilation, causing single-threaded
JIT that is 2-5x slower.  The warning appears as:
"The NVIDIA driver's CUDA version is 12.8 which is older than the ptxas CUDA
version (12.9.86). XLA is disabling parallel compilation."

**Why it happens:** pip-installed `nvidia-cuda-nvcc-cu12` auto-upgrades to
latest (12.9.x) which exceeds the driver's CUDA 12.8 support.

**How to avoid:** Pin versions in cluster setup:
```bash
pip install "nvidia-cuda-nvcc-cu12==12.8.93" "nvidia-nvjitlink-cu12==12.8.93"
```
Add a startup diagnostic to SLURM scripts that checks `ptxas --version`
against `nvidia-smi` driver CUDA version.

**Warning signs:** "disabling parallel compilation" in MCMC logs.

### Pitfall 5: Losing Downstream ArviZ Compatibility

**What goes wrong:** The current pipeline relies on InferenceData having a
`participant` dimension with string coords, plus `participant_group` and
`participant_session` auxiliary coords.  A naive numpyro conversion may
use integer indices instead.

**Why it happens:** `az.from_numpyro()` uses dim/coord names from the
`dims` and `coords` kwargs.  Without them, dims are unnamed.

**How to avoid:** Always pass `dims` and `coords` to `az.from_numpyro()`.
Then apply the same `assign_coords()` calls for group/session metadata
that the current `fit_batch_hierarchical()` does.

### Pitfall 6: build_logp_ops_batched Creates Closures

**What goes wrong:** The current `build_logp_ops_batched()` captures
`jax_input_data`, `jax_observed`, `jax_choices`, `jax_trial_mask` via
closure in `_jax_logp_batched()`.  If this function is reused in the
numpyro model, data would STILL be closure constants.

**Why it happens:** The function was designed for the PyTensor Op pattern
where data is fixed at graph-construction time.

**How to avoid:** Create a NEW factory `build_logp_fn_batched()` that returns
a pure function taking BOTH parameters AND data as arguments.  The numpyro
model calls this function with runtime data.

## Code Examples

### Example 1: Pure JAX Batched Logp Function (No Closure)

```python
def build_logp_fn_batched(
    model_name: str = "hgf_3level",
    n_trials: int = ...,
) -> callable:
    """Build a pure JAX function for batched logp.

    Unlike build_logp_ops_batched(), this does NOT capture data in closures.
    Data is passed as arguments, enabling JIT cache reuse.

    Returns
    -------
    batched_logp_fn : callable
        (omega_2, ..., input_data, observed, choices, trial_mask) -> scalar
    """
    # Build network once to get base_attrs and scan_fn
    if model_name == "hgf_3level":
        from prl_hgf.models.hgf_3level import build_3level_network
        net = build_3level_network()
    else:
        from prl_hgf.models.hgf_2level import build_2level_network
        net = build_2level_network()

    # Seed with dummy data to get scan_fn
    dummy_input = np.zeros((n_trials, 3), dtype=float)
    dummy_obs = np.zeros((n_trials, 3), dtype=int)
    net.input_data(input_data=dummy_input, observed=dummy_obs)
    base_attrs = net.attributes
    scan_fn = net.scan_fn

    # Reuse existing _single_logp_3level / _single_logp_2level
    # but ensure base_attrs and scan_fn are the only closures
    # (these are STATIC -- they don't change between iterations)

    # ... (same _single_logp_3level / _single_logp_2level as now)

    _batched = jax.vmap(_single_participant_logp, in_axes=0_for_all)

    def batched_logp(*params, input_data, observed, choices, trial_mask):
        per_participant = _batched(*params, input_data, observed, choices, trial_mask)
        return jnp.sum(per_participant)

    return batched_logp
```

### Example 2: CUDA Environment Check Script

```bash
#!/bin/bash
# CUDA environment diagnostic for SLURM scripts
check_cuda_compat() {
    # Get driver CUDA version
    DRIVER_CUDA=$(nvidia-smi --query-gpu=driver_version --format=csv,noheader 2>/dev/null)
    if [[ -z "$DRIVER_CUDA" ]]; then
        echo "WARNING: nvidia-smi not found or no GPU detected"
        return 1
    fi

    # Get supported CUDA version from nvidia-smi
    DRIVER_CUDA_VER=$(nvidia-smi | grep "CUDA Version" | awk '{print $9}')

    # Get ptxas version
    PTXAS_VER=$(ptxas --version 2>/dev/null | grep "release" | awk '{print $5}' | tr -d ',')

    if [[ -z "$PTXAS_VER" ]]; then
        echo "WARNING: ptxas not found in PATH"
        return 1
    fi

    echo "Driver CUDA version: $DRIVER_CUDA_VER"
    echo "ptxas CUDA version:  $PTXAS_VER"

    # Compare major.minor
    DRIVER_MAJOR=$(echo "$DRIVER_CUDA_VER" | cut -d. -f1)
    DRIVER_MINOR=$(echo "$DRIVER_CUDA_VER" | cut -d. -f2)
    PTXAS_MAJOR=$(echo "$PTXAS_VER" | cut -d. -f1)
    PTXAS_MINOR=$(echo "$PTXAS_VER" | cut -d. -f2)

    if (( PTXAS_MAJOR > DRIVER_MAJOR )) || \
       (( PTXAS_MAJOR == DRIVER_MAJOR && PTXAS_MINOR > DRIVER_MINOR )); then
        echo ""
        echo "ERROR: ptxas CUDA version ($PTXAS_VER) > driver CUDA version ($DRIVER_CUDA_VER)"
        echo "  XLA will disable parallel compilation!"
        echo "  FIX: pip install 'nvidia-cuda-nvcc-cu12<=${DRIVER_CUDA_VER}'"
        return 1
    fi

    echo "OK: ptxas version <= driver version (parallel compilation enabled)"
    return 0
}
```

### Example 3: Full fit_batch_hierarchical Rewrite Skeleton

```python
def fit_batch_hierarchical(
    sim_df: pd.DataFrame,
    model_name: str = "hgf_3level",
    n_chains: int = 4,
    n_draws: int = 1000,
    n_tune: int = 1000,
    target_accept: float = 0.95,
    random_seed: int = 42,
    progressbar: bool = True,
) -> az.InferenceData:
    """Fit cohort via direct numpyro MCMC (no PyMC bridge)."""
    import arviz as az
    import numpyro
    import numpyro.distributions as dist
    from numpyro.infer import MCMC, NUTS

    # ... (same DataFrame validation and array building as now) ...

    # Build the pure JAX logp function (no data closure)
    batched_logp_fn = build_logp_fn_batched(model_name, n_trials)

    # Define numpyro model
    def model(input_data, observed, choices, trial_mask, n_participants):
        # ... priors via numpyro.sample() ...
        logp = batched_logp_fn(params..., input_data, observed, choices, trial_mask)
        numpyro.factor("hgf_loglike", logp)

    # Run MCMC
    rng_key = jax.random.PRNGKey(random_seed)
    kernel = NUTS(model, target_accept_prob=target_accept)
    mcmc = MCMC(
        kernel,
        num_warmup=n_tune,
        num_samples=n_draws,
        num_chains=n_chains,
        chain_method="vectorized",
        progress_bar=progressbar,
    )
    mcmc.run(
        rng_key,
        input_data=jax_input_data,
        observed=jax_observed,
        choices=jax_choices,
        trial_mask=jax_trial_mask,
        n_participants=n_participants,
    )

    # Convert to ArviZ
    idata = az.from_numpyro(mcmc, dims=dims_dict, coords=coords_dict)

    # Attach participant metadata
    idata.posterior = idata.posterior.assign_coords(
        participant_group=("participant", participant_groups),
        participant_session=("participant", participant_sessions),
    )

    return idata
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| PyMC bridge + jax_funcify | Direct numpyro MCMC | This refactor (Phase 16) | Eliminates ~800s recompilation per iteration |
| Data as closure constants | Data as traced arguments | This refactor (Phase 16) | JIT cache reuse across iterations |
| pip-auto nvidia-cuda-nvcc | Pinned to driver version | This refactor (Phase 16) | XLA parallel compilation re-enabled |
| `chain_method="parallel"` (PyMC default) | `chain_method="vectorized"` | This refactor (Phase 16) | Single-GPU optimized; 4 chains in one kernel |

**Deprecated/outdated after this phase:**
- `build_pymc_model_batched()`: No longer needed (numpyro model replaces it)
- `_BatchedLogpOp` / `_BatchedGradOp` classes: PyTensor Ops not needed
- `@jax_funcify.register(_BatchedLogpOp)`: No PyTensor dispatch needed
- `import pymc as pm` in `fit_batch_hierarchical()`: No PyMC dependency
- `sampler` parameter: Always uses numpyro directly (no "pymc" option)

## Open Questions

Things that could not be fully resolved:

1. **`jit_model_args` with `chain_method="vectorized"`**
   - What we know: Docs say `jit_model_args` doesn't work with `num_chains > 1`.
     The docs specifically mention `chain_method="parallel"`.
   - What's unclear: Whether `chain_method="vectorized"` has the same limitation,
     since vectorized compiles a single kernel (unlike parallel's pmap).
   - Recommendation: Test empirically during implementation.  If vectorized
     also triggers recompilation, fall back to Strategy A (single chain x4).
     In any case, the fundamental win (data not in closure) still applies.

2. **`numpyro.deterministic` handling in `az.from_numpyro`**
   - What we know: `numpyro.deterministic("beta", jnp.exp(log_beta))` records
     the value.  ArviZ should pick it up automatically.
   - What's unclear: Whether the dims/coords propagate correctly for
     deterministic sites, or if manual coord assignment is needed.
   - Recommendation: Verify in the first implementation pass.  If ArviZ
     doesn't handle it, manually add beta to the InferenceData posterior.

3. **`n_trials` as static argument**
   - What we know: `n_trials` is used inside `_build_scan_inputs` and
     `_compute_logp` as a Python int.  If it varies between iterations,
     it would trigger recompilation.
   - What's unclear: Whether all iterations in the power sweep have the
     same `n_trials` (they should -- config is fixed).
   - Recommendation: Verify `n_trials` is constant.  If not, make it
     a traced argument instead of a Python int.

4. **Backward compatibility of `sampler` parameter**
   - What we know: `fit_batch_hierarchical()` currently accepts
     `sampler="numpyro"` or `sampler="pymc"`.  Phase 16 removes PyMC.
   - What's unclear: Whether any caller relies on `sampler="pymc"`.
   - Recommendation: Keep the parameter but raise `DeprecationWarning`
     for `sampler="pymc"` and document that the PyMC path is removed.

## Sources

### Primary (HIGH confidence)
- NumPyro MCMC API docs: https://num.pyro.ai/en/stable/mcmc.html
  - MCMC constructor: `jit_model_args`, `chain_method`, `num_chains`
  - MCMC.run(): `rng_key, *args, **kwargs` passes data as model args
  - NUTS constructor: `model` vs `potential_fn`
- NumPyro GitHub Issues:
  - #441: jit_model_args design and implementation
  - #691: jit_model_args with multi-chains (fixed for shape issues)
  - #1134: jit_model_args with chain_method="parallel" (documented limitation)
- ArviZ from_numpyro: https://python.arviz.org/en/stable/api/generated/arviz.from_numpyro.html
  - Accepts `dims`, `coords`, handles deterministic sites
- NumPyro distributions: https://num.pyro.ai/en/stable/distributions.html
  - `TruncatedNormal(loc, scale, low=, high=)` confirmed
- JAX XLA parallel compilation: https://github.com/jax-ml/jax/discussions/20156
  - ptxas version > driver version causes fallback to single-threaded

### Secondary (MEDIUM confidence)
- Pyro forum on jit_model_args behavior: https://forum.pyro.ai/t/understanding-the-jitting-behavior-of-mcmc-run/5678
- Pyro forum on custom potential_fn: https://forum.pyro.ai/t/hmc-with-custom-potential-fn-how-to-specify-support/3091
- Medium article on JAX+NumPyro optimization: https://medium.com/@Modexa/7-jax-numpyro-tricks-for-probabilistic-models-at-speed-d6b327755cee

### Tertiary (LOW confidence)
- None -- all key findings verified via official docs or source code.

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH -- numpyro MCMC API is stable and well-documented
- Architecture: HIGH -- model function + factor() pattern verified in docs and forums
- JIT cache strategy: MEDIUM -- vectorized chain + jit_model_args interaction not fully documented
- CUDA fix: HIGH -- version pinning is straightforward; JAX discussion confirms the issue
- ArviZ integration: HIGH -- az.from_numpyro() is well-documented and tested
- Prior mapping: HIGH -- numpyro TruncatedNormal API verified in official docs

**Research date:** 2026-04-13
**Valid until:** 2026-05-13 (30 days -- numpyro API is stable)
