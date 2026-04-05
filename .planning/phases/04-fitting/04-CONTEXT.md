# Phase 4: Fitting - Context

**Gathered:** 2026-04-05
**Status:** Ready for planning

<domain>
## Phase Boundary

Single-subject Bayesian parameter estimation for both HGF model variants. Given
simulated choice data from Phase 3, recover posterior distributions for perceptual
parameters (omega_2, omega_3, kappa) and response parameters (beta, zeta) using
MCMC sampling. Batch fitting across all 180 participant-sessions. Diagnostics to
flag problematic fits.

</domain>

<decisions>
## Implementation Decisions

### Sampling framework
- PyMC with a custom PyTensor Op that wraps pyhgf's JAX scan infrastructure
- Reuse pyhgf's `beliefs_propagation` / `scan_fn` as the computation engine
- Build a pure JAX `logp` function that: freezes network topology once, injects
  parameters into the attributes dict as JAX values, runs the existing
  `jax.lax.scan`, computes surprise via softmax_stickiness_surprise
- Wrap in a PyTensor Op following the exact pattern from pyhgf's own
  `HGFLogpGradOp` / `HGFDistribution` (~100 lines of wrapper code)
- Gradients flow automatically through the JAX scan (verified: 0.6ms per eval)
- HGFDistribution CANNOT be used — hardwired to single-branch HGF objects
- ArviZ integration comes for free via PyMC (needed for Phase 5 WAIC/LOO)

### Diagnostics & convergence
- 4 chains x 1000 draws per participant (standard for robust R-hat)
- Convergence thresholds: Claude's discretion based on literature and parameter count
- Fits exceeding thresholds get flagged but still saved

### Output format
- Summary statistics only: mean, SD, HDI, R-hat, ESS per parameter per participant
- One row per participant-parameter in a structured DataFrame
- No full traces saved (beliefs can be recomputed from params + choices + rewards)
- Results DataFrame with columns matching FIT-04 spec: participant_id, group,
  session, model, parameter, mean, sd, hdi_3%, hdi_97%, r_hat, ess

### Claude's Discretion
- Prior specification (informative vs weakly informative, transformed vs native space)
- Exact R-hat/ESS threshold values
- Fitting scope (whether to fit 2-level only, 3-level only, or both in this phase)
- Batch fitting parallelization strategy
- Tune length and sampler settings (target_accept, etc.)

</decisions>

<specifics>
## Specific Ideas

- The parameter injection pattern: `attrs[node_idx] = dict(attrs[node_idx]);
  attrs[node_idx]["tonic_volatility"] = omega_2` — shallow copy modified nodes
  only, not deepcopy (breaks JAX traceability)
- Follow the exact `Op.make_node / perform / grad` structure from pyhgf's
  `HGFLogpGradOp` and `HGFDistribution` as the template
- omega_2 maps to tonic_volatility on nodes 1, 3, 5 simultaneously
- omega_3 maps to tonic_volatility on node 6
- kappa maps to volatility_coupling on edges 6→(1,3,5)

</specifics>

<deferred>
## Deferred Ideas

None — discussion stayed within phase scope

</deferred>

---

*Phase: 04-fitting*
*Context gathered: 2026-04-05*
