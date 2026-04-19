---
phase: 20-patrl-scientific-completion
plan: 02
type: execute
wave: 1
depends_on: [20-01]
files_modified:
  - src/prl_hgf/models/response_patrl.py
  - src/prl_hgf/fitting/hierarchical_patrl.py
  - src/prl_hgf/fitting/fit_vb_laplace_patrl.py
  - tests/test_models_patrl.py
  - tests/test_hierarchical_patrl.py
  - tests/test_fit_vb_laplace_patrl.py
autonomous: true
estimated_edits: 10
gap_closure: false
user_setup: []

must_haves:
  truths:
    - "Model A accepts a bias parameter b (default 0.0) without breaking any existing caller"
    - "Model B computes P(approach) = sigma(beta*EV + b + gamma*dHR)"
    - "Model C computes P(approach) = sigma((beta + alpha*dHR)*EV + b + gamma*dHR)"
    - "fit_batch_hierarchical_patrl accepts response_model in {'model_a','model_b','model_c'} without NotImplementedError"
    - "fit_vb_laplace_patrl accepts response_model in {'model_a','model_b','model_c'} without NotImplementedError"
    - "5-agent Laplace smoke runs cleanly for Models A (with b=0), A+b (b nonzero), B, and C on CPU — blackjax NUTS path smoke is cluster-only"
  artifacts:
    - path: "src/prl_hgf/models/response_patrl.py"
      provides: "model_a_logp (with b kwarg), model_b_logp, model_c_logp"
      exports: ["model_a_logp", "model_b_logp", "model_c_logp", "expected_value", "MU2_CLIP"]
      min_lines: 200
    - path: "src/prl_hgf/fitting/hierarchical_patrl.py"
      provides: "response_model dispatch for model_a/b/c; log-posterior priors for b/gamma/alpha; delta_hr_arr passed into build_logp_fn_batched_patrl signature"
      contains: "response_model in {\"model_a\", \"model_b\", \"model_c\""
    - path: "src/prl_hgf/fitting/fit_vb_laplace_patrl.py"
      provides: "response_model dispatch for Laplace path"
      contains: "response_model in (\"model_a\", \"model_b\", \"model_c\""
  key_links:
    - from: "configs/pat_rl.yaml fitting.priors.b/gamma/alpha"
      to: "_build_patrl_log_posterior"
      via: "prior log-density added to total prior_lp when response_model in {B, C}"
      pattern: "prior_b|prior_gamma|prior_alpha"
    - from: "model_b_logp / model_c_logp"
      to: "_clamped_step scan output (mu2_traj) + delta_hr_arr"
      via: "called after scan; delta_hr array indexed per trial"
      pattern: "model_b_logp\\(mu2_traj"
    - from: "fit_vb_laplace_patrl::_build_patrl_log_posterior"
      to: "models B/C parameters (b, gamma, alpha) in params pytree"
      via: "numpyro Normal priors with FittingPriorConfig values"
      pattern: "numpyro.sample\\(\\\"gamma\\\""
---

<objective>
Implement Phase 20 response-model extensions (SC2, partial): (1) add response bias `b` as a kwarg to `model_a_logp` with safe default 0.0 — backwards-compatible with every Phase 18/19 caller; (2) implement `model_b_logp` (ΔHR bias γ) and `model_c_logp` (ΔHR × value sensitivity α + γ); (3) remove the `NotImplementedError` guards in both fit entry points (`fit_batch_hierarchical_patrl` and `fit_vb_laplace_patrl`) so that `response_model in {'model_a','model_b','model_c'}` dispatches correctly; (4) thread the `delta_hr_arr` into the batched logp factory; (5) add tests covering shape + finite output for all three response models on 5-agent Laplace smoke.

Model D (trial-varying ω) is deliberately deferred to Plan 20-03 because the scan-body surgery is mechanically distinct from Models B/C (which are post-scan additions).

Purpose: SC2 requires all four models (A+b, B, C, D) to fit through BOTH the NUTS batched path and the Laplace path. This plan delivers A+b, B, and C. Plan 20-03 delivers D.
Output: Three working response logp functions + end-to-end fit dispatch + 5-agent Laplace smoke test for each.
</objective>

<execution_context>
@.claude/get-shit-done/workflows/execute-plan.md
@.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@.planning/PROJECT.md
@.planning/ROADMAP.md
@.planning/phases/20-patrl-scientific-completion/20-RESEARCH.md
@.planning/phases/20-patrl-scientific-completion/20-01-SUMMARY.md

@src/prl_hgf/models/response_patrl.py
@src/prl_hgf/fitting/hierarchical_patrl.py
@src/prl_hgf/fitting/fit_vb_laplace_patrl.py
@tests/test_models_patrl.py
@tests/test_hierarchical_patrl.py
@tests/test_fit_vb_laplace_patrl.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Extend model_a_logp with bias b + implement model_b_logp and model_c_logp</name>
  <files>src/prl_hgf/models/response_patrl.py</files>
  <action>
    Edit `src/prl_hgf/models/response_patrl.py`:

    1. Update `model_a_logp` signature (line 75-82) to accept a bias kwarg:
       ```python
       def model_a_logp(
           mu2: jnp.ndarray,
           choices: jnp.ndarray,
           reward_mag: jnp.ndarray,
           shock_mag: jnp.ndarray,
           beta: float | jnp.ndarray,
           b: float | jnp.ndarray = 0.0,
       ) -> jnp.ndarray:
       ```
       Inside the body (line 126-131), change the logits to:
       ```python
       logits = jnp.stack(
           [jnp.zeros_like(ev_approach), beta * ev_approach + b],
           axis=-1,
       )
       ```
       Update the numpy docstring to document `b`: "Response bias on approach logit. Positive = approach bias; negative = avoid bias. Default 0.0 preserves Phase 18 behavior."

    2. Add `model_b_logp` BELOW `model_a_logp`:
       ```python
       def model_b_logp(
           mu2: jnp.ndarray,
           choices: jnp.ndarray,
           reward_mag: jnp.ndarray,
           shock_mag: jnp.ndarray,
           beta: float | jnp.ndarray,
           b: float | jnp.ndarray,
           gamma: float | jnp.ndarray,
           delta_hr: jnp.ndarray,
       ) -> jnp.ndarray:
           """Model B: ΔHR as additive bias on the approach logit.

           P(approach) = softmax([0, beta * EV_approach + b + gamma * ΔHR(t)])[1]

           Sign convention
           ---------------
           ΔHR < 0 indicates anticipatory bradycardia (freezing-associated).
           Positive γ = more avoidance when more bradycardia (because γ*ΔHR
           becomes more negative, lowering the approach logit). Reference:
           Klaassen et al. 2024, Communications Biology.

           Parameters
           ----------
           [... standard numpy-style docstring for all args ...]
           delta_hr : jnp.ndarray, shape (n_trials,)
               Per-trial anticipatory ΔHR in bpm (negative = bradycardia).

           Returns
           -------
           jnp.ndarray, shape (n_trials,)
               Per-trial log-probability of the observed choice.
           """
           ev_approach = expected_value(mu2, reward_mag, shock_mag)
           approach_logit = beta * ev_approach + b + gamma * delta_hr
           logits = jnp.stack(
               [jnp.zeros_like(ev_approach), approach_logit], axis=-1
           )
           logp_all = log_softmax(logits, axis=-1)
           return jnp.take_along_axis(
               logp_all, choices[:, None].astype(jnp.int32), axis=-1,
           ).squeeze(-1)
       ```

    3. Add `model_c_logp` BELOW `model_b_logp`:
       ```python
       def model_c_logp(
           mu2: jnp.ndarray,
           choices: jnp.ndarray,
           reward_mag: jnp.ndarray,
           shock_mag: jnp.ndarray,
           beta: float | jnp.ndarray,
           b: float | jnp.ndarray,
           alpha: float | jnp.ndarray,
           gamma: float | jnp.ndarray,
           delta_hr: jnp.ndarray,
       ) -> jnp.ndarray:
           """Model C: ΔHR modulates BOTH value sensitivity (β) AND bias.

           P(approach) = softmax([0, (beta + alpha*ΔHR(t)) * EV + b + gamma*ΔHR(t)])[1]

           Sign convention: see model_b_logp notes.
           """
           ev_approach = expected_value(mu2, reward_mag, shock_mag)
           effective_beta = beta + alpha * delta_hr
           approach_logit = effective_beta * ev_approach + b + gamma * delta_hr
           logits = jnp.stack(
               [jnp.zeros_like(ev_approach), approach_logit], axis=-1
           )
           logp_all = log_softmax(logits, axis=-1)
           return jnp.take_along_axis(
               logp_all, choices[:, None].astype(jnp.int32), axis=-1,
           ).squeeze(-1)
       ```

    4. Update `__all__` (line 141):
       ```python
       __all__ = [
           "model_a_logp", "model_b_logp", "model_c_logp",
           "expected_value", "MU2_CLIP",
       ]
       ```

    5. Update the module docstring (lines 1-35) to note that Models B and C now live in this file; Model D is in `hierarchical_patrl.py::_clamped_step_model_d` (deferred to Plan 20-03).
  </action>
  <verify>
    Run: `python -c "import jax.numpy as jnp; from prl_hgf.models.response_patrl import model_a_logp, model_b_logp, model_c_logp; mu2=jnp.zeros(5); ch=jnp.array([1,0,1,0,1],dtype=jnp.int32); r=jnp.ones(5); s=jnp.ones(5); dhr=jnp.array([-2,-1,0,1,2],dtype=jnp.float64); a=model_a_logp(mu2,ch,r,s,2.0,0.3); b=model_b_logp(mu2,ch,r,s,2.0,0.3,0.5,dhr); c=model_c_logp(mu2,ch,r,s,2.0,0.3,0.1,0.5,dhr); print(a.shape, b.shape, c.shape); import numpy as np; assert np.all(np.isfinite(np.asarray(a))); assert np.all(np.isfinite(np.asarray(b))); assert np.all(np.isfinite(np.asarray(c))); print('OK')"`
  </verify>
  <done>
    - model_a_logp accepts b kwarg with default 0.0; existing Phase 18 tests still pass
    - model_b_logp and model_c_logp exist with correct signatures
    - All three functions return shape (n_trials,) and finite values for finite inputs
    - Module __all__ exports all three
  </done>
</task>

<task type="auto">
  <name>Task 2: Dispatch in hierarchical_patrl.py — support model_b/model_c + thread delta_hr into the batched logp factory</name>
  <files>src/prl_hgf/fitting/hierarchical_patrl.py</files>
  <action>
    Edit `src/prl_hgf/fitting/hierarchical_patrl.py`:

    1. **Thread delta_hr_arr into the batched logp factory.** Find `build_logp_fn_batched_patrl` (approx line 300+) and add `delta_hr_arr: np.ndarray | None = None` as a new kwarg. If `delta_hr_arr` is None, build a zeros array of shape `(P, n_trials)` — this preserves backward compatibility for Model A (which doesn't use ΔHR).

    2. **Update `_make_single_logp_fn` closure** to accept and capture `delta_hr_jnp` (shape `(n_trials,)` per participant, vmapped via the outer factory). After the scan (line 277-281), compute the response log-likelihood by dispatching on a new outer kwarg `response_model: str` (already a kwarg of `fit_batch_hierarchical_patrl`, just needs to be plumbed through the factory):
       ```python
       # --- inside _make_single_logp_fn, after mu2_traj is computed ---
       if response_model == "model_a":
           logp_per_trial = model_a_logp(
               mu2_traj, choices.astype(jnp.int32),
               reward.astype(jnp.float64), shock.astype(jnp.float64),
               params["beta"], params.get("b", 0.0),
           )
       elif response_model == "model_b":
           from prl_hgf.models.response_patrl import model_b_logp
           logp_per_trial = model_b_logp(
               mu2_traj, choices.astype(jnp.int32),
               reward.astype(jnp.float64), shock.astype(jnp.float64),
               params["beta"], params["b"], params["gamma"],
               delta_hr_jnp.astype(jnp.float64),
           )
       elif response_model == "model_c":
           from prl_hgf.models.response_patrl import model_c_logp
           logp_per_trial = model_c_logp(
               mu2_traj, choices.astype(jnp.int32),
               reward.astype(jnp.float64), shock.astype(jnp.float64),
               params["beta"], params["b"], params["alpha"], params["gamma"],
               delta_hr_jnp.astype(jnp.float64),
           )
       elif response_model == "model_d":
           # Model D lives in Plan 20-03 — raise here; Plan 20-03 replaces this.
           raise NotImplementedError("model_d lives in Plan 20-03")
       else:
           raise ValueError(f"unknown response_model={response_model!r}")
       ```

    3. **Relax the NotImplementedError guard** in `fit_batch_hierarchical_patrl` (line 728-732). Replace:
       ```python
       if response_model != "model_a":
           raise NotImplementedError(...)
       ```
       with:
       ```python
       if response_model not in ("model_a", "model_b", "model_c"):
           raise NotImplementedError(
               f"response_model={response_model!r}: supported are "
               f"'model_a', 'model_b', 'model_c' in Plan 20-02. "
               f"'model_d' lands in Plan 20-03."
           )
       ```

    4. **Update `_build_patrl_log_posterior`** (the log-posterior closure builder — find by grep `_build_patrl_log_posterior`). For Models B and C, add numpyro-style Normal priors on `b`, `gamma`, and (Model C only) `alpha`. Pattern:
       ```python
       # Model A+b/B/C: always sample b
       b_i = numpyro.sample("b", dist.Normal(cfg_priors.b.mean, cfg_priors.b.sd))
       if response_model in ("model_b", "model_c"):
           gamma_i = numpyro.sample("gamma", dist.Normal(cfg_priors.gamma.mean, cfg_priors.gamma.sd))
           params["gamma"] = gamma_i
       if response_model == "model_c":
           alpha_i = numpyro.sample("alpha", dist.Normal(cfg_priors.alpha.mean, cfg_priors.alpha.sd))
           params["alpha"] = alpha_i
       params["b"] = b_i
       ```
       NOTE: this file uses closure-based (not numpyro-traced) logdensity per Decision 119. Adapt the above pattern to the closure style already in use — add `log_prior_b`, `log_prior_gamma`, `log_prior_alpha` Normal log-density terms into `prior_lp`. Use `jax.scipy.stats.norm.logpdf`.

    5. **`_build_arrays_single_patrl`** — confirm `delta_hr` column is already packed (line ~527). Return it as part of the arrays bundle. If already returned, no change needed. Cast to `float64` for fp64 invariant (Decision 118).

    6. **Call sites** — grep for all call sites of `build_logp_fn_batched_patrl` inside `fit_batch_hierarchical_patrl` and pass `delta_hr_arr=delta_hr_arr` through. If no call site exists yet outside the fit entry, add it at the single call site where Phase 18 builds the batched logp.

    Preserve Decision 120 (kappa via attrs) and Decision 118 (fp64 scan inputs). The Layer-2 clamp (|mu2| < 14) remains unchanged.
  </action>
  <verify>
    Run: `python -c "from prl_hgf.fitting.hierarchical_patrl import build_logp_fn_batched_patrl; import inspect; sig = inspect.signature(build_logp_fn_batched_patrl); print(list(sig.parameters))" ` — expect `delta_hr_arr` in the signature.

    Run: `python -m py_compile src/prl_hgf/fitting/hierarchical_patrl.py` — no syntax errors.
  </verify>
  <done>
    - build_logp_fn_batched_patrl accepts delta_hr_arr kwarg
    - _single_logp dispatches on response_model in {model_a, model_b, model_c}
    - fit_batch_hierarchical_patrl raises NotImplementedError only for response_model not in {a, b, c, d}; d routes to a deferred-to-20-03 message
    - _build_patrl_log_posterior samples b/gamma/alpha with their new priors (closure-style log-density addition to prior_lp)
    - Decision 118 (fp64), 120 (kappa via attrs) preserved
  </done>
</task>

<task type="auto">
  <name>Task 3: Extend fit_vb_laplace_patrl.py to dispatch Models A+b, B, C</name>
  <files>src/prl_hgf/fitting/fit_vb_laplace_patrl.py</files>
  <action>
    Edit `src/prl_hgf/fitting/fit_vb_laplace_patrl.py`:

    1. Relax the `NotImplementedError` guard (line 176-179). Replace:
       ```python
       if response_model != "model_a":
           raise NotImplementedError(...)
       ```
       with:
       ```python
       if response_model not in ("model_a", "model_b", "model_c"):
           raise NotImplementedError(
               f"response_model={response_model!r}: supported are "
               f"'model_a', 'model_b', 'model_c'. 'model_d' lands in Plan 20-03."
           )
       ```

    2. **Extend the log-posterior builder** in this file (find `_build_patrl_log_posterior` or equivalent — the Laplace variant). For Model A always add `b` to the params dict with a Normal prior. For Model B additionally add `gamma`. For Model C additionally add `alpha`. Thread `delta_hr` into the likelihood evaluation via a closure-captured `delta_hr_arr` (shape `(P, n_trials)`).

    3. **Dispatch the response model inside the log-likelihood evaluation.** Mirror the dispatch pattern from hierarchical_patrl.py Task 2 step 2 — call `model_a_logp` / `model_b_logp` / `model_c_logp` with the correct argument set based on `response_model`.

    4. **Update `_PARAM_ORDER_*` constants** if the Laplace path uses them (check imports from `laplace_idata.py`) — Models B/C add parameters in the Hessian ravel order. If `_PARAM_ORDER_2LEVEL_PATRL` / `_PARAM_ORDER_3LEVEL_PATRL` exist in this file, extend with `"b"`, then `"gamma"` (Model B/C), then `"alpha"` (Model C only). Store as dict keyed by `(level, response_model)` if clean.

    5. **Propagate `response_model` into `build_idata_from_laplace` call** if applicable — the Laplace InferenceData factory (`laplace_idata.py::_PARAM_ORDER_2LEVEL`/`_PARAM_ORDER_3LEVEL`) may need a new parameter order for Models B/C. Add new constants:
       ```python
       _PARAM_ORDER_2LEVEL_B = ("omega_2", "log_beta", "b", "gamma")
       _PARAM_ORDER_2LEVEL_C = ("omega_2", "log_beta", "b", "gamma", "alpha")
       ```
       and analogous 3-level variants. Add to `_VALID_PARAM_ORDERS` tuple. If this changes the signature of `build_idata_from_laplace`, add a `response_model` kwarg to select the right order; default preserves existing (A) behavior.
  </action>
  <verify>
    Run: `python -c "from prl_hgf.fitting.fit_vb_laplace_patrl import fit_vb_laplace_patrl; print('import OK')"`.
    Run: `python -m py_compile src/prl_hgf/fitting/fit_vb_laplace_patrl.py src/prl_hgf/fitting/laplace_idata.py` — no syntax errors.
    Full smoke deferred to Task 5 (integration).
  </verify>
  <done>
    - fit_vb_laplace_patrl no longer raises NotImplementedError for model_b/model_c
    - Response model dispatch wired inside the log-posterior
    - _PARAM_ORDER_2LEVEL_B / _PARAM_ORDER_2LEVEL_C / 3-level equivalents added
    - laplace_idata.py _VALID_PARAM_ORDERS updated if applicable
  </done>
</task>

<task type="auto">
  <name>Task 4: Unit tests for model_a_logp(b), model_b_logp, model_c_logp + dispatch</name>
  <files>tests/test_models_patrl.py, tests/test_hierarchical_patrl.py, tests/test_fit_vb_laplace_patrl.py</files>
  <action>
    1. **tests/test_models_patrl.py** — add a new `class TestPhase20ResponseModels:` with:
       - `test_model_a_logp_accepts_b_default_zero` — same input, `b=0.0` default must match pre-20 behavior (regression anchor)
       - `test_model_a_logp_b_shifts_logits` — set `b=2.0`, assert approach logit for ev=0 is +2.0 (compare against hand-computed softmax)
       - `test_model_b_logp_shape_and_finite` — 10-trial input; assert shape `(10,)` and all finite
       - `test_model_b_logp_gamma_zero_equals_model_a_plus_b` — set `gamma=0`, assert `model_b_logp(..., gamma=0, dhr=random)` equals `model_a_logp(..., b=same_b)` elementwise within 1e-6
       - `test_model_c_logp_shape_and_finite` — 10-trial input
       - `test_model_c_logp_alpha_zero_equals_model_b` — set `alpha=0`, assert equals model_b with same gamma/b
       - `test_model_c_alpha_effect_sign` — with `alpha > 0` and `ΔHR < 0`, effective_beta < beta — sanity check that approach logit (for positive EV) is smaller

    2. **tests/test_hierarchical_patrl.py** — 
       - Replace the existing test that asserts `NotImplementedError` for `response_model='model_b'` with a test asserting the error is raised ONLY for unrecognized values (e.g. `"model_e"`).
       - Add `test_build_logp_fn_batched_patrl_accepts_delta_hr_arr` — build factory with delta_hr_arr; assert output is finite for 5 agents × 192 trials
       - Add `test_build_logp_fn_batched_patrl_model_b` — build with `response_model='model_b'` and random params (including `b`, `gamma`); assert finite output
       - Add `test_build_logp_fn_batched_patrl_model_c` — ditto for `model_c` with `alpha` included
       - Preserve Decision 118 (fp64 invariant): assert `mu2_traj.dtype == jnp.float64`

    3. **tests/test_fit_vb_laplace_patrl.py** —
       - Add `test_fit_vb_laplace_model_b_smoke` — 5-agent synthetic cohort (healthy phenotype), `response_model='model_b'`, 2-level HGF; assert fit returns InferenceData with `b` and `gamma` posterior variables
       - Add `test_fit_vb_laplace_model_c_smoke` — same but with `response_model='model_c'`; posterior has `alpha` too

    Follow existing test conventions: numpy docstrings, absolute imports, `from __future__ import annotations`, `@pytest.mark.skipif` guards on pyhgf/numpyro availability where already used.

    **blackjax-skip convention (M6 clarification):** Before writing these tests, grep the module-level imports of
    `src/prl_hgf/fitting/hierarchical_patrl.py` to confirm blackjax is NOT imported at module top-level
    (blackjax should only be imported lazily inside `fit_batch_hierarchical_patrl` at NUTS-call time). Verify with:

    ```bash
    grep -n "^import blackjax\|^from blackjax" src/prl_hgf/fitting/hierarchical_patrl.py
    ```

    - If the grep yields ZERO matches (expected): factory-level tests
      (`test_build_logp_fn_batched_patrl_*`) do NOT need `pytest.importorskip('blackjax')` —
      they only exercise the JAX logp factory, which has no blackjax dependency.
      Only the full-pipeline smoke tests that actually call `fit_batch_hierarchical_patrl`
      through the NUTS path need the importorskip.
    - If the grep shows blackjax imported at module level (unexpected — would be a Phase 18 regression):
      add `pytest.importorskip('blackjax')` to every test that imports from
      `hierarchical_patrl`, and flag the module-level import as a bug to be fixed
      in a follow-up (since it defeats the Laplace-without-blackjax smoke path).

    The Laplace-path tests in `test_fit_vb_laplace_patrl.py` use `fit_vb_laplace_patrl`,
    which must NOT require blackjax; confirm no test in that file imports blackjax directly.
    The NUTS smoke for Models B/C is deferred to cluster-only (cluster/ SLURM scripts).
  </action>
  <verify>
    Run: `pytest tests/test_models_patrl.py tests/test_hierarchical_patrl.py tests/test_fit_vb_laplace_patrl.py -v`. All tests pass; no blackjax import errors.

    Additionally run: `grep -n "^import blackjax\|^from blackjax" src/prl_hgf/fitting/hierarchical_patrl.py` — expect zero matches (documents that the blackjax-guard reasoning above is sound).
  </verify>
  <done>
    - 7 new tests in test_models_patrl.py pass
    - 3+ new tests in test_hierarchical_patrl.py pass; existing NotImplementedError test updated
    - 2 new Laplace smoke tests in test_fit_vb_laplace_patrl.py pass
    - blackjax-guard decision explicitly documented (verified module-level imports; guards added only if necessary)
    - No Phase 18/19 tests regressed
  </done>
</task>

<task type="auto">
  <name>Task 5: Integration smoke — 5-agent Laplace fit for Models A+b, B, C end-to-end</name>
  <files>scripts/12_smoke_patrl_foundation.py, tests/test_smoke_patrl_foundation.py</files>
  <action>
    1. In `scripts/12_smoke_patrl_foundation.py`, extend the CLI/default fit loop so `response_model` is a settable config (argparse flag or per-run constant). Default remains `"model_a"`. Add the ability to loop over `["model_a", "model_b", "model_c"]` when `--all-models` flag is set (or similar switch via env var `PRL_PATRL_SMOKE_MODELS=all`).

    2. The Laplace fit path (`_fit_laplace` or similar within the script) must pass `response_model` through to `fit_vb_laplace_patrl`. Preserve the current `--no-blackjax` / blackjax-importorskip behavior.

    3. Add an assertion at the end of each fit: `assert set(idata.posterior.data_vars.keys()) >= expected_params`, where `expected_params` depends on `response_model`:
       - model_a: {omega_2, log_beta, b}  (now that b is always sampled)
       - model_b: {omega_2, log_beta, b, gamma}
       - model_c: {omega_2, log_beta, b, gamma, alpha}

    4. **(M5 clarification) Create or extend `tests/test_smoke_patrl_foundation.py`.**
       First, verify whether the file exists on disk:

       ```bash
       ls tests/test_smoke_patrl_foundation.py 2>/dev/null || echo "MISSING"
       ```

       - If the file EXISTS: extend it — add the new test to the appropriate existing test class
         (or append a new `class TestPhase20SmokeModelDispatch:` block).
       - If the file MISSING: create it following the test-file conventions used by sibling
         files in `tests/` (absolute imports, `from __future__ import annotations` header,
         numpy-style docstrings, same `pytest.importorskip` guard pattern on pyhgf/numpyro
         as `tests/test_hierarchical_patrl.py` uses).

       Add the structural test: `test_smoke_patrl_foundation_supports_all_response_models` —
       parametrize over `["model_a", "model_b", "model_c"]`; run the Laplace smoke for 2 agents
       (healthy phenotype) each; assert the expected posterior vars are present.

    Keep this purely ADDITIVE — no renames of existing CLI flags.
  </action>
  <verify>
    Run: `python scripts/12_smoke_patrl_foundation.py --n-participants 2 --response-model model_b --no-blackjax` (or whatever the smoke CLI exposes). Exit code 0.

    Run: `pytest tests/test_smoke_patrl_foundation.py -v -k "all_response_models or structural"` — passes.

    Post-task file-existence check: `ls tests/test_smoke_patrl_foundation.py` — file exists (created or extended, per action).
  </verify>
  <done>
    - scripts/12 accepts response_model flag; loop-over-all supported
    - Laplace path end-to-end for A+b, B, C works on 2-agent healthy cohort
    - tests/test_smoke_patrl_foundation.py exists on disk (created if it was missing, extended if present)
    - New test_smoke_patrl_foundation_supports_all_response_models passes
    - NotImplementedError no longer raised for B/C
  </done>
</task>

</tasks>

<verification>
  - `pytest tests/test_models_patrl.py tests/test_hierarchical_patrl.py tests/test_fit_vb_laplace_patrl.py tests/test_smoke_patrl_foundation.py -v` — all pass
  - `python -c "from prl_hgf.models.response_patrl import model_a_logp, model_b_logp, model_c_logp; print('OK')"`
  - `ruff check src/prl_hgf/models/response_patrl.py src/prl_hgf/fitting/hierarchical_patrl.py src/prl_hgf/fitting/fit_vb_laplace_patrl.py` — clean
  - `mypy src/prl_hgf/models/response_patrl.py src/prl_hgf/fitting/hierarchical_patrl.py src/prl_hgf/fitting/fit_vb_laplace_patrl.py` — clean
  - Phase 18/19 regression: `pytest tests/test_pat_rl_simulator.py tests/test_env_pat_rl_config.py -v` — all pass
</verification>

<success_criteria>
  - SC2 (partial): Models A+b, B, C fit cleanly through fit_batch_hierarchical_patrl and fit_vb_laplace_patrl on 5-agent CPU Laplace smoke
  - Posterior InferenceData contains `b` for all three models; `gamma` for B and C; `alpha` for C
  - delta_hr_arr is threaded from sim_df -> _build_arrays_single_patrl -> build_logp_fn_batched_patrl -> _single_logp
  - Decision 118 (fp64), 119 (closure-based logdensity), 120 (kappa via attrs) preserved
  - Zero Phase 18/19 test regressions
  - blackjax-NUTS path for B/C deferred to cluster smoke (documented in SUMMARY)
</success_criteria>

<output>
Create `.planning/phases/20-patrl-scientific-completion/20-02-SUMMARY.md` with: (a) final signatures of model_a_logp/b_logp/c_logp, (b) prior log-density terms added to _build_patrl_log_posterior in both hierarchical and Laplace paths, (c) _PARAM_ORDER tuples added to laplace_idata.py, (d) list of tests added/updated, (e) known blackjax-NUTS-for-B/C cluster-only smoke deferred to cluster/SLURM (to be captured in Plan 20-07 verification), (f) result of module-level blackjax-import grep (M6 — was the skipif needed or not?).
</output>
