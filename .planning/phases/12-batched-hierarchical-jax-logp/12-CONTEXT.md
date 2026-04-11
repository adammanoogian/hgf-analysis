# Phase 12: Batched Hierarchical JAX Logp — Context

**Gathered:** 2026-04-11
**Status:** Ready for planning

<domain>
## Phase Boundary

Refactor the custom JAX logp Op to accept batched `(n_participants, ...)` shaped inputs and execute via `jax.vmap` over the participant dimension, reusing pyhgf's `Network.scan_fn` for the HGF forward pass (no reimplementation of HGF math). Wrap it in a batched PyMC model with `shape=(n_participants,)` independent priors and orchestrate a single `pmjax.sample_numpyro_nuts` call for the entire cohort. Add tapas-style Layer 2 per-trial belief clamping inside the `lax.scan` step as a NaN safety net. Validate on CPU against the existing per-participant legacy path: bit-exact at P=1 and within 3× MCSE at P=5.

**Not in this phase:**
- JAX-native simulation rewrite (Phase 13)
- GPU benchmark and decision gate (Phase 14)
- Production power sweep run (Phase 15)
- Partial pooling / true hierarchical model (v2)
- Per-participant NUTS adaptation (v2)

</domain>

<decisions>
## Implementation Decisions

### Prior Structure (BATCH-01)

- **IID per participant, no hyperpriors.** Each participant has their own parameters drawn from the same prior. No partial pooling, no information sharing across participants.
- PyMC expression: `pm.Normal("omega_2", mu=-3.0, sigma=2.0, shape=n_participants)` etc.
- Mathematically identical to fitting each participant separately with the same prior — just packed into one NUTS call to amortize launch overhead.
- Preserves v1.1 statistical semantics exactly. BF values from the batched fit should match BFs from the legacy sequential fit (up to MCMC error).
- **Known caveat:** PyMC/numpyro builds one joint 1500-dim model (300 participants × 5 params) and NUTS adapts ONE step size and ONE mass matrix across all dimensions. Per-participant posteriors from the batched fit may differ slightly from sequential fits because adaptation is shared rather than per-participant. This is acceptable for IID data; monitor r_hat and divergence counts in VALID-02 to detect pathology.
- **Why not hierarchical:** v1.2 is scoped as compute refactor, not stats change. Partial pooling would change BF semantics (answers "does the group distribution shift?" instead of "can we detect per-participant effects?"), break bit-exact VALID-01, and warrant its own validation milestone. Deferred to v2.

### Layer 2 NaN Clamping (BATCH-04)

- **Role:** safety net against NaN propagation, not a routine mechanism. If PyMC's prior bounds are doing their job, clamping should rarely fire in normal fitting.
- **Stability check at each trial step:**
  - `jnp.isfinite(...)` on all flat belief state leaves
  - Hard magnitude bound `|mu_2| < 14` following tapas's `tapas_ehgf_binary.m` convention
  - Combined as `is_stable = jnp.all(jnp.isfinite(new_flat)) & (jnp.abs(new_mu_2) < 14)`
- **Revert logic:** `safe_attrs = jax.tree_util.tree_map(lambda new, old: jnp.where(is_stable, new, old), new_attrs, prev_attrs)`
- **Logp mask propagation:** per-trial mask of shape `(n_trials,)` — clamped trials contribute 0 to the summed logp for that participant. Implemented via `logp_contributions * trial_mask` before the reduction.
- **Must be pure JAX:** uses `jnp.where` and `jax.tree_util.tree_map`, no Python `if` on traced values, so it stays inside `jax.jit` and `jax.vmap`.
- **Diagnostic:** count how often clamping fires across the cohort and report as a fit-quality metric (should be near-zero under normal priors; large counts indicate the prior is letting parameters wander into unstable regions).

### Validation Protocol (VALID-01, VALID-02)

- **VALID-01 (bit-exact at P=1):**
  - `assert np.allclose(batched_P1_logp, sequential_P1_logp, atol=1e-12, rtol=0)` on float64
  - Implemented in `tests/test_hierarchical_logp.py` (new file)
  - Compares the new `build_logp_ops_batched` forward pass at `n_participants=1` against the existing `build_logp_ops_3level` from `ops.py`
  - Runs on CPU, no GPU required
- **VALID-02 (statistical equivalence at P=5):**
  - Fit 5 participants sequentially via the legacy path on CPU with a matched seed
  - Fit the same 5 participants batched via the new path on CPU with the same seed
  - Compare per-parameter posterior means using `arviz.mcse()` for the per-chain Monte Carlo standard error
  - Tolerance: `|mean_batched - mean_sequential| < 3 × max(mcse_batched, mcse_sequential)`
  - Same test file as VALID-01
- **Not measured in Phase 12:** cross-platform (GPU) consistency — that's VALID-03 in Phase 14
- **If tests fail:** iterate on the batched implementation; do NOT loosen the tolerance without documenting why

### Legacy Path Architecture (VALID-05)

- **Strategy: replace-and-freeze.** Move current per-participant fitting code into `src/prl_hgf/fitting/legacy/`, create new `src/prl_hgf/fitting/hierarchical.py` as the new default.
- **Files to move into `legacy/` unchanged:**
  - `fit_participant` (from `fitting/single.py`)
  - `fit_batch` (from `fitting/batch.py`)
  - `_prewarm_jit` helper
  - Anything else only the sequential path uses
- **Frozen legacy docstring header:** every file in `legacy/` gets a top-of-file comment:
  ```
  # Frozen for v1.1 reproducibility — DO NOT MODIFY.
  # See src/prl_hgf/fitting/hierarchical.py for the v1.2+ implementation.
  ```
- **New file `src/prl_hgf/fitting/hierarchical.py`:**
  - `build_logp_ops_batched` — the new batched Op factory
  - `fit_batch_hierarchical` — the new orchestrator
  - Reuses helper functions from `ops.py` where safe (or copies them into the new module to decouple)
- **`src/prl_hgf/fitting/__init__.py`:** re-exports both the legacy and new APIs so downstream imports don't break
- **`--legacy` CLI flag on `scripts/08_run_power_iteration.py`:** routes to legacy `run_power_iteration` from Phase 10-11 code (unchanged) when set; defaults to the new `run_sbf_iteration` using the batched path
- **`ops.py` stays in place** as the per-participant logp — it's called by the legacy path. New batched Op lives in `hierarchical.py` and can import shared helpers from `ops.py` if useful

### MCMC Configuration (BENCH-related)

- **Phase 12 default for real fitting:** 4 chains × 1000 draws × 1000 tune × `target_accept=0.95`
- Raised from v1.1's power-sweep settings (2 × 500 × 500 × 0.9) because the batched joint model is 1500-dim and needs tighter adaptation to keep divergence counts low
- For VALID-02 (5 participants) the test may use reduced draws (e.g., 500 × 500) with explicit documentation that the tolerance accounts for this
- For the full power sweep in Phase 15, Phase 14's benchmark decides whether we can afford the full inference-grade settings or need to reduce
- **CLI flags** on `scripts/08_run_power_iteration.py` expose all four: `--fit-chains`, `--fit-draws`, `--fit-tune`, `--target-accept`
- Defaults for the production path: the inference-grade values above
- Defaults for the benchmark path: whatever Phase 14 picks based on measured timings
- `chains=4` with numpyro: set `numpyro.set_host_device_count(1)` so chains run sequentially on the single GPU; if we get multi-GPU (v2) we can increase device count for pmap parallelism

### Claude's Discretion

- Exact Op class layout (two-Op split vs merged, jax_funcify registration details)
- Whether `build_logp_ops_batched` reuses helper functions from `ops.py` or copies them
- Internal structure of `hierarchical.py` (one file vs split by helper)
- Names of internal helpers
- Test fixture organization in `tests/test_hierarchical_logp.py`
- Exact `arviz.mcse` call signature for VALID-02
- How to persist VALID-01/02 results (stdout only vs log file)

</decisions>

<specifics>
## Specific Ideas

- **tapas clamping bounds are the reference.** `tapas_ehgf_binary.m` uses `|mu_2| < 14` for level-2 state stability. We replicate this rather than deriving our own bounds — existing standards, less to second-guess.
- **Clamping is a safety net, not a mechanism.** If the PyMC priors are working properly (Normal(-3, 2) for omega_2, etc.), parameters should rarely wander into the unstable region. Clamping exists to prevent NaN propagation from corner cases, not to make unstable parameters work. A high clamping-fire count is a diagnostic signal that priors need tightening, not that the clamping should be made more aggressive.
- **"Inference-grade" MCMC settings for actual fitting**, not the reduced-for-compute settings from the v1.1 power sweep. The batched model has 1500 dims vs per-participant's 5 dims — needs more tune and tighter target_accept.
- **Legacy path gets frozen, not duplicated.** The user was explicit: "replace and legacy the old version." We move the existing code into `legacy/` with a DO NOT MODIFY header, make the new batched path the default, and preserve reproducibility via the `--legacy` flag.
- **Bit-exact at P=1 is the canary.** If the batched logp doesn't match the per-participant logp at float64 precision with a single participant, something subtle is wrong (dtype mismatch, reduction order, broadcasting). Run VALID-01 before any MCMC work.

</specifics>

<deferred>
## Deferred Ideas

- **True hierarchical model with population hyperpriors (partial pooling).** Would improve recovery for participants with poor data. Changes statistical semantics vs v1.1 (BFs would differ). Deferred to v2 as its own milestone with its own validation — not smashed into v1.2's compute refactor.
- **Per-participant NUTS adaptation.** Currently shared step size and mass matrix across all 1500 dimensions in the joint model. If monitoring reveals adaptation pathology (divergences, high r_hat on specific participants), fix in v2 via custom numpyro kernel or `HMCGibbs` wrapper.
- **Multi-GPU `pmap` across chains.** Requires `numpyro.set_host_device_count(N)` and `--gres=gpu:N` on SLURM. v1.2 stays on single GPU; multi-GPU is v2.
- **Automatic prior re-tuning if clamping fires frequently.** If the clamping diagnostic count is high in Phase 15 production runs, we may want to tighten PyMC priors (e.g., omega_2 sigma from 2.0 → 1.5). Note for Phase 15 telemetry.

</deferred>

---

*Phase: 12-batched-hierarchical-jax-logp*
*Context gathered: 2026-04-11*
