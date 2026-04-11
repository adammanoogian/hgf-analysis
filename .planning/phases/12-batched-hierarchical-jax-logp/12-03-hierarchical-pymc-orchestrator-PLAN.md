---
phase: 12-batched-hierarchical-jax-logp
plan: 03
type: execute
wave: 3
depends_on: ["12-02"]
files_modified:
  - src/prl_hgf/fitting/hierarchical.py
  - src/prl_hgf/fitting/__init__.py
autonomous: true

must_haves:
  truths:
    - "build_pymc_model_batched constructs a PyMC model with shape=(n_participants,) IID priors matching v1.1 prior specifications exactly"
    - "fit_batch_hierarchical accepts a sim_df, builds the batched model, runs ONE pmjax.sample_numpyro_nuts call for the entire cohort, and returns a single InferenceData with a participant dim on every parameter"
    - "The orchestrator builds (input_data, observed, choices) arrays for every participant in sim_df by stacking individual per-participant arrays into the (P, n_trials, 3) shape expected by build_logp_ops_batched"
    - "Both fit_batch_hierarchical and build_pymc_model_batched are re-exported from prl_hgf.fitting"
    - "The orchestrator preserves the participant_id / group / session metadata via the InferenceData coords so downstream analysis can map posterior slices back to participants"
  artifacts:
    - path: "src/prl_hgf/fitting/hierarchical.py"
      provides: "build_pymc_model_batched, fit_batch_hierarchical added alongside build_logp_ops_batched"
      exports: ["build_logp_ops_batched", "build_pymc_model_batched", "fit_batch_hierarchical"]
      contains: "pmjax.sample_numpyro_nuts"
    - path: "src/prl_hgf/fitting/__init__.py"
      provides: "Re-export build_logp_ops_batched, build_pymc_model_batched, fit_batch_hierarchical"
      exports: ["build_logp_ops_batched", "build_pymc_model_batched", "fit_batch_hierarchical"]
  key_links:
    - from: "src/prl_hgf/fitting/hierarchical.py"
      to: "build_logp_ops_batched (Plan 12-02)"
      via: "build_pymc_model_batched calls build_logp_ops_batched and hooks the returned Op via pm.Potential"
      pattern: "pm\\.Potential.*logp_op"
    - from: "src/prl_hgf/fitting/hierarchical.py"
      to: "pmjax.sample_numpyro_nuts"
      via: "fit_batch_hierarchical calls pmjax.sample_numpyro_nuts() directly (NOT pm.sample with nuts_sampler='numpyro' — that path hits the _init_jitter PyTensor read-only-array bug)"
      pattern: "import pymc.sampling.jax as pmjax"
    - from: "src/prl_hgf/fitting/__init__.py"
      to: "src/prl_hgf/fitting/hierarchical.py"
      via: "from prl_hgf.fitting.hierarchical import build_logp_ops_batched, build_pymc_model_batched, fit_batch_hierarchical"
      pattern: "from prl_hgf\\.fitting\\.hierarchical import"
---

<objective>
Wrap the batched JAX logp Op from Plan 12-02 inside a hierarchical PyMC model factory and a single-call cohort orchestrator. Specifically:

1. Add `build_pymc_model_batched(input_data_arr, observed_arr, choices_arr, model_name)` to `hierarchical.py`. It declares `pm.Normal/pm.TruncatedNormal` priors with `shape=(n_participants,)` matching v1.1 prior specifications exactly (omega_2, beta, zeta for 2-level; omega_2, omega_3, kappa, beta, zeta for 3-level), then hooks the Op via `pm.Potential("loglike", logp_op(...))`.

2. Add `fit_batch_hierarchical(sim_df, model_name, n_chains, n_draws, n_tune, target_accept, random_seed, sampler)` to `hierarchical.py`. It groups `sim_df` by `(participant_id, group, session)`, builds the `(P, n_trials, 3)` stacked arrays, calls `build_pymc_model_batched`, and runs **one** `pmjax.sample_numpyro_nuts` call for the full cohort. Returns a single `InferenceData` with a `participant` dimension on every parameter and metadata coords for participant_id / group / session so downstream analysis can map slices back to participants.

3. Re-export `build_logp_ops_batched`, `build_pymc_model_batched`, and `fit_batch_hierarchical` from `prl_hgf.fitting` (`__init__.py`) so downstream code can `from prl_hgf.fitting import fit_batch_hierarchical`.

Purpose: This is the orchestrator that replaces v1.1's per-participant `fit_batch` loop. By packing all participants into one PyMC model with `shape=(n_participants,)` IID priors and one `pmjax.sample_numpyro_nuts` call, NUTS launch overhead amortizes across the cohort instead of paying it P times. **Statistical semantics are unchanged from v1.1** (no hyperpriors / no partial pooling — see `12-CONTEXT.md` "Why not hierarchical"); only the compute graph changes.

Output: Two new functions in `src/prl_hgf/fitting/hierarchical.py` and three new exports in `src/prl_hgf/fitting/__init__.py`. No tests yet — Plan 12-04 owns all validation.
</objective>

<execution_context>
@C:\Users\aman0087\.claude/get-shit-done/workflows/execute-plan.md
@C:\Users\aman0087\.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@.planning/PROJECT.md
@.planning/ROADMAP.md
@.planning/STATE.md
@.planning/phases/12-batched-hierarchical-jax-logp/12-CONTEXT.md
@.planning/phases/12-batched-hierarchical-jax-logp/12-01-legacy-migration-PLAN.md
@.planning/phases/12-batched-hierarchical-jax-logp/12-02-batched-jax-logp-PLAN.md
@src/prl_hgf/fitting/models.py
@src/prl_hgf/fitting/legacy/batch.py
@src/prl_hgf/fitting/hierarchical.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Add build_pymc_model_batched to hierarchical.py with hierarchical IID priors and pm.Potential hook</name>
  <files>src/prl_hgf/fitting/hierarchical.py</files>
  <action>
Append a new public function `build_pymc_model_batched` to `src/prl_hgf/fitting/hierarchical.py` (do NOT touch the `build_logp_ops_batched` factory from Plan 12-02 — additive only). The function builds a PyMC model with `shape=(n_participants,)` priors for every parameter, hooks the batched logp Op via `pm.Potential`, and returns the model + var_names list.

**Signature:**

```python
def build_pymc_model_batched(
    input_data_arr: np.ndarray,        # shape (P, n_trials, 3)
    observed_arr: np.ndarray,          # shape (P, n_trials, 3)
    choices_arr: np.ndarray,           # shape (P, n_trials)
    model_name: str = "hgf_3level",
    trial_mask: np.ndarray | None = None,
) -> tuple[pm.Model, list[str], int]:
    """Build a hierarchical PyMC model with shape=(P,) IID priors per participant."""
```

**Implementation requirements:**

1. Import `pymc as pm` at the top of the file (the module already imports `pytensor.tensor as pt`, `pytensor`, etc. from Plan 12-02). Also `import pytensor` and set `pytensor.config.cxx = ""` if not already set in Plan 12-02 (it should be).

2. Validate `input_data_arr.ndim == 3` (raise `ValueError` with expected vs actual). Validate `model_name in ("hgf_2level", "hgf_3level")`.

3. Compute `n_participants = input_data_arr.shape[0]`.

4. Call `build_logp_ops_batched(input_data_arr, observed_arr, choices_arr, model_name=model_name, trial_mask=trial_mask)` and capture `(logp_op, P, T)`.

5. **Inside `with pm.Model() as model:`, declare priors with `shape=n_participants` matching v1.1 priors exactly** (cross-reference `src/prl_hgf/fitting/models.py`):

   For `model_name == "hgf_2level"`:
   ```python
   omega_2 = pm.TruncatedNormal("omega_2", mu=-3.0, sigma=2.0, upper=0.0, shape=n_participants)
   log_beta = pm.Normal("log_beta", mu=0.0, sigma=1.5, shape=n_participants)
   beta = pm.Deterministic("beta", pm.math.exp(log_beta))
   zeta = pm.Normal("zeta", mu=0.0, sigma=2.0, shape=n_participants)
   pm.Potential("loglike", logp_op(omega_2, beta, zeta))
   var_names = ["omega_2", "beta", "zeta"]
   ```

   For `model_name == "hgf_3level"`:
   ```python
   omega_2 = pm.TruncatedNormal("omega_2", mu=-3.0, sigma=2.0, upper=0.0, shape=n_participants)
   omega_3 = pm.TruncatedNormal("omega_3", mu=-6.0, sigma=2.0, upper=0.0, shape=n_participants)
   kappa   = pm.TruncatedNormal("kappa",   mu=1.0,  sigma=0.5, lower=0.01, upper=2.0, shape=n_participants)
   log_beta = pm.Normal("log_beta", mu=0.0, sigma=1.5, shape=n_participants)
   beta = pm.Deterministic("beta", pm.math.exp(log_beta))
   zeta = pm.Normal("zeta", mu=0.0, sigma=2.0, shape=n_participants)
   pm.Potential("loglike", logp_op(omega_2, omega_3, kappa, beta, zeta))
   var_names = ["omega_2", "omega_3", "kappa", "beta", "zeta"]
   ```

   **Critical:** Prior names, mu, sigma, lower, upper values must match `models.py` byte-for-byte. The only difference is `shape=n_participants`. This preserves v1.1 statistical semantics exactly so VALID-02 (Plan 12-04) can claim within-MCSE equivalence with the legacy sequential fits.

6. Return `(model, var_names, n_participants)`.

7. **Docstring** must explain: IID priors per participant (no hyperpriors / no partial pooling), why `shape=n_participants` is used, and reference `12-CONTEXT.md` "Prior Structure (BATCH-01)" for the rationale.

**Do NOT** add hyperpriors. Do NOT add `pm.Data` containers (the data is baked into the Op closure already, which is fine because `build_logp_ops_batched` accepts the arrays at factory time). If a future plan needs `pm.Data` for resampling without rebuilding, that's a v2 enhancement.
  </action>
  <verify>
1. **Import smoke test:**
   ```bash
   python -c "from prl_hgf.fitting.hierarchical import build_pymc_model_batched; print('OK')"
   ```
2. **Build smoke test at P=3 with the 3-level model:**
   ```bash
   python -c "
   import numpy as np
   from prl_hgf.fitting.hierarchical import build_pymc_model_batched
   inp = np.zeros((3, 50, 3), dtype=float); inp[:, :, 0] = 0.5
   obs = np.zeros((3, 50, 3), dtype=int); obs[:, :, 0] = 1
   ch = np.zeros((3, 50), dtype=int)
   model, var_names, P = build_pymc_model_batched(inp, obs, ch, model_name='hgf_3level')
   print(f'P={P}, var_names={var_names}')
   print(f'Free RVs: {[v.name for v in model.free_RVs]}')
   # Expected free RVs: omega_2, omega_3, kappa, log_beta, zeta — each shape (3,)
   for v in model.free_RVs:
       print(f'  {v.name}: shape inferred via test_value -> {v.eval().shape if hasattr(v, \"eval\") else \"n/a\"}')
   "
   ```
   Should print 5 free RVs each with shape `(3,)`.
3. **Build smoke test at P=2 with the 2-level model** — should produce 3 free RVs each shape `(2,)`.
4. `python -m ruff check src/prl_hgf/fitting/hierarchical.py`
  </verify>
  <done>
- `build_pymc_model_batched` exists in `hierarchical.py`
- Building the 3-level model at P=3 produces 5 free RVs (omega_2, omega_3, kappa, log_beta, zeta) each with shape `(3,)`
- Building the 2-level model at P=2 produces 3 free RVs each with shape `(2,)`
- Prior specs match `src/prl_hgf/fitting/models.py` byte-for-byte (modulo `shape=n_participants`)
- Docstring explicitly notes IID-per-participant / no partial pooling
- ruff clean
  </done>
</task>

<task type="auto">
  <name>Task 2: Add fit_batch_hierarchical orchestrator and update fitting/__init__.py exports</name>
  <files>src/prl_hgf/fitting/hierarchical.py, src/prl_hgf/fitting/__init__.py</files>
  <action>
**Part A — Add `fit_batch_hierarchical` to `hierarchical.py`:**

```python
def fit_batch_hierarchical(
    sim_df: pd.DataFrame,
    model_name: str = "hgf_3level",
    n_chains: int = 4,
    n_draws: int = 1000,
    n_tune: int = 1000,
    target_accept: float = 0.95,
    random_seed: int = 42,
    sampler: str = "numpyro",
    progressbar: bool = True,
) -> az.InferenceData:
    """Fit an entire cohort in one pmjax.sample_numpyro_nuts call.

    Builds a hierarchical PyMC model with shape=(P,) IID priors and runs one
    NUTS call across all participants instead of looping per-participant. This
    amortizes JAX dispatch overhead across the cohort and is the v1.2 default
    fitting path.

    See ``.planning/phases/12-batched-hierarchical-jax-logp/12-CONTEXT.md`` for
    the design rationale ("Prior Structure (BATCH-01)").
    """
```

**Implementation steps:**

1. Validate `sim_df` has the same required columns the legacy `fit_batch` requires: `{"participant_id", "group", "session", "cue_chosen", "reward"}`. Raise `ValueError` with expected vs actual on mismatch (use the same pattern as `legacy/batch.py::fit_batch`).

2. **Group by `(participant_id, group, session)`** preserving order:
   ```python
   group_keys = ["participant_id", "group", "session"]
   groups = list(sim_df.groupby(group_keys, sort=False))
   ```
   Each group is one "participant" in the batched model. Note: in this codebase a "participant" in a batched fit means one (participant_id, session) pair — sessions are fit separately because v1.1 fitted them separately. **Stay faithful to v1.1**: one batched fit per call covers whatever `sim_df` is passed in. If the caller passes a sim_df with multiple sessions, each (id, group, session) tuple becomes one slot in the batched model. This is correct because the priors are IID — sessions of the same participant are unlinked.

3. **Build the stacked `(P, n_trials, 3)` arrays.** Use a helper that mirrors `legacy/batch.py::_build_arrays` but stacks across participants:
   ```python
   per_p_inputs = []
   per_p_obs = []
   per_p_choices = []
   participant_meta = []  # list[(participant_id, group, session)]
   for (pid, grp, sess), subset in groups:
       if "trial" in subset.columns:
           subset = subset.sort_values("trial")
       inp_p, obs_p, ch_p = _build_arrays_single(subset)  # returns the same shapes as legacy _build_arrays
       per_p_inputs.append(inp_p)
       per_p_obs.append(obs_p)
       per_p_choices.append(ch_p)
       participant_meta.append((pid, grp, sess))

   input_data_arr = np.stack(per_p_inputs, axis=0)   # shape (P, n_trials, 3)
   observed_arr = np.stack(per_p_obs, axis=0)         # shape (P, n_trials, 3)
   choices_arr = np.stack(per_p_choices, axis=0)      # shape (P, n_trials)
   ```
   Add a private helper `_build_arrays_single(subset)` at the bottom of `hierarchical.py` that is structurally identical to `legacy/batch.py::_build_arrays` (you may copy it and rename). This is intentional duplication for decoupling — `legacy/` is frozen and we don't want `hierarchical.py` to import from `legacy/`.

   **Trial-count guard:** verify all participants have the same `n_trials` (assert `len({arr.shape[0] for arr in per_p_inputs}) == 1`); raise `ValueError` with expected vs actual if not. Variable-length cohorts are deferred to the `trial_mask` story (Phase 12 ships with all-ones mask only).

4. **Build the model:**
   ```python
   model, var_names, P = build_pymc_model_batched(
       input_data_arr, observed_arr, choices_arr, model_name=model_name
   )
   ```

5. **Run one `pmjax.sample_numpyro_nuts` call.** Per `STATE.md` blockers: "the `_init_jitter` PyTensor read-only-array bug means we can't use `pm.sample(...)` directly even with `nuts_sampler='numpyro'`; must call `pmjax.sample_numpyro_nuts()` directly." Implementation:
   ```python
   import pymc.sampling.jax as pmjax

   with model:
       if sampler == "numpyro":
           idata = pmjax.sample_numpyro_nuts(
               draws=n_draws,
               tune=n_tune,
               chains=n_chains,
               target_accept=target_accept,
               random_seed=random_seed,
               progressbar=progressbar,
           )
       else:
           # Fall back to pm.sample for development / parity testing
           idata = pm.sample(
               draws=n_draws,
               tune=n_tune,
               chains=n_chains,
               cores=1,
               target_accept=target_accept,
               random_seed=random_seed,
               return_inferencedata=True,
               progressbar=progressbar,
           )
   ```
   Default `sampler="numpyro"` because that's the v1.2 production path; `"pymc"` is documented as a parity-testing fallback. **Do not** add a `nuts_sampler="numpyro"` codepath through `pm.sample` — it triggers the documented `_init_jitter` bug.

6. **Attach participant metadata as InferenceData coords** so downstream analysis can map posterior slices back to (participant_id, group, session). After sampling:
   ```python
   participant_ids = [m[0] for m in participant_meta]
   groups_list = [m[1] for m in participant_meta]
   sessions = [m[2] for m in participant_meta]
   # PyMC names the participant dim something like "omega_2_dim_0" — relabel it
   idata = idata.assign_coords({"participant": participant_ids})
   # Attach group/session as data variables on the InferenceData attrs for downstream use
   idata.posterior.attrs["participant_groups"] = groups_list
   idata.posterior.attrs["participant_sessions"] = sessions
   ```
   The exact rename mechanic depends on how PyMC labels the shape-dim coord; if `assign_coords` doesn't work directly, use `idata.rename({"omega_2_dim_0": "participant"})` or pass `coords={"participant": participant_ids}` to `pm.Model(coords=...)` at construction time and use `dims=("participant",)` on each prior. **Pick the cleanest approach for the PyMC version available** (the project uses pymc 5.x). Document the choice in the SUMMARY.

7. Return `idata`.

**Imports needed at top of file** (add to existing imports from Plan 12-02):
```python
import arviz as az
import pandas as pd
import pymc as pm
```

**Part B — Re-export from `src/prl_hgf/fitting/__init__.py`:**

Open the existing `fitting/__init__.py` (touched in Plan 12-01) and add at the bottom of the import block:

```python
# v1.2 batched hierarchical path (Plans 12-02 / 12-03)
from prl_hgf.fitting.hierarchical import (
    build_logp_ops_batched,
    build_pymc_model_batched,
    fit_batch_hierarchical,
)
```

And extend `__all__`:
```python
__all__ = [
    # legacy v1.1 path
    "fit_batch",
    "fit_participant",
    "extract_summary_rows",
    "flag_fit",
    "build_pymc_model_2level",
    "build_pymc_model_3level",
    "build_logp_ops_2level",
    "build_logp_ops_3level",
    # v1.2 batched hierarchical path
    "build_logp_ops_batched",
    "build_pymc_model_batched",
    "fit_batch_hierarchical",
]
```

Remove the comment block reservation Plan 12-01 left as a placeholder.
  </action>
  <verify>
1. **Import smoke test:**
   ```bash
   python -c "from prl_hgf.fitting import fit_batch_hierarchical, build_pymc_model_batched, build_logp_ops_batched; print('OK')"
   ```
2. **Mini-cohort fit smoke test (very short, just to confirm sampler runs):**
   ```bash
   python -c "
   import numpy as np, pandas as pd
   from prl_hgf.fitting import fit_batch_hierarchical
   # Build a tiny synthetic sim_df: 2 participants, 1 session, 30 trials each
   rows = []
   rng = np.random.default_rng(0)
   for pid in ['P001', 'P002']:
       for t in range(30):
           rows.append({
               'participant_id': pid,
               'group': 'placebo',
               'session': 'baseline',
               'trial': t,
               'cue_chosen': int(rng.integers(0, 3)),
               'reward': float(rng.integers(0, 2)),
           })
   sim_df = pd.DataFrame(rows)
   idata = fit_batch_hierarchical(
       sim_df, model_name='hgf_2level',
       n_chains=2, n_draws=50, n_tune=50, target_accept=0.9,
       random_seed=42, progressbar=False,
   )
   print('posterior dims:', dict(idata.posterior.dims))
   assert 'participant' in idata.posterior.coords or any('dim' in c for c in idata.posterior.coords), 'no participant-shape coord found'
   print('OK')
   "
   ```
   This should run a real (tiny) NUTS sample and return an `InferenceData`. Expect ~30-90 s for the JAX compilation + sampling. If `pmjax.sample_numpyro_nuts` is unavailable in the env, the test should be moved to the slow / numpyro-marker bucket — document the gap in the SUMMARY.
3. **Imports of legacy path still work** (regression):
   ```bash
   python -c "from prl_hgf.fitting import fit_batch, fit_participant, build_logp_ops_3level; print('OK')"
   ```
4. `python -m ruff check src/prl_hgf/fitting/hierarchical.py src/prl_hgf/fitting/__init__.py`
5. `python -m pytest tests/test_fitting.py -v -k "not slow" --timeout=60` — legacy fast tests still pass
  </verify>
  <done>
- `fit_batch_hierarchical` exists in `hierarchical.py` and runs one `pmjax.sample_numpyro_nuts` call for the cohort
- The mini-cohort smoke test (2 participants × 30 trials × 50 draws × 50 tune × 2 chains) returns an `InferenceData` with a participant-dim coord
- `from prl_hgf.fitting import fit_batch_hierarchical, build_pymc_model_batched, build_logp_ops_batched` works
- All legacy imports still work (`from prl_hgf.fitting import fit_batch, fit_participant, ...`)
- `pytest tests/test_fitting.py -v -k "not slow"` still passes (regression — Plan 12-01 shims not broken)
- ruff clean on both modified files
- The orchestrator does NOT use `pm.sample(nuts_sampler='numpyro')` (would hit the `_init_jitter` bug)
  </done>
</task>

</tasks>

<verification>
1. `python -c "from prl_hgf.fitting import build_logp_ops_batched, build_pymc_model_batched, fit_batch_hierarchical"` succeeds
2. `python -c "from prl_hgf.fitting import fit_batch, fit_participant, build_logp_ops_3level"` succeeds (legacy regression)
3. The mini-cohort smoke test from Task 2 verify completes with a finite `InferenceData`
4. `python -m pytest tests/test_fitting.py -v -k "not slow" --timeout=60` — all legacy fast tests still pass
5. `python -m ruff check src/prl_hgf/fitting/hierarchical.py src/prl_hgf/fitting/__init__.py` is clean
6. `grep -n "pmjax.sample_numpyro_nuts" src/prl_hgf/fitting/hierarchical.py` shows direct call (not via `pm.sample`)
</verification>

<success_criteria>
- `build_pymc_model_batched(input_data_arr, observed_arr, choices_arr, model_name)` builds a hierarchical PyMC model with `shape=(n_participants,)` IID priors matching v1.1 byte-for-byte (BATCH-01)
- `fit_batch_hierarchical(sim_df, model_name, ...)` builds the model, runs ONE `pmjax.sample_numpyro_nuts` call, returns a single `InferenceData` with a participant dim on every parameter (BATCH-05)
- Mini-cohort smoke test runs successfully end-to-end
- Three new exports (`build_logp_ops_batched`, `build_pymc_model_batched`, `fit_batch_hierarchical`) are reachable via `from prl_hgf.fitting import ...`
- Legacy import surface unchanged; existing fast tests still pass
</success_criteria>

<output>
After completion, create `.planning/phases/12-batched-hierarchical-jax-logp/12-03-SUMMARY.md` documenting:
- The exact mechanism used to label the participant dim (`coords={"participant": ...}` at `pm.Model` construction vs post-hoc `assign_coords` vs `rename`) and why
- Mini-cohort smoke test wall time and InferenceData shape
- Any pmjax-specific quirks encountered (random_seed handling, chain count semantics, etc.)
- Confirmation that prior specs are byte-identical to `src/prl_hgf/fitting/models.py`
</output>
