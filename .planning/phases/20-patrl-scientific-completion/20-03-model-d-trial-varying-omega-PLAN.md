---
phase: 20-patrl-scientific-completion
plan: 03
type: execute
wave: 2
depends_on: [20-01, 20-02]
files_modified:
  - src/prl_hgf/fitting/hierarchical_patrl.py
  - src/prl_hgf/fitting/fit_vb_laplace_patrl.py
  - src/prl_hgf/fitting/laplace_idata.py
  - tests/test_hierarchical_patrl.py
  - tests/test_fit_vb_laplace_patrl.py
  - tests/test_models_patrl.py
autonomous: true
estimated_edits: 7
gap_closure: false
user_setup: []

must_haves:
  truths:
    - "Model D injects trial-varying omega_eff(t) = omega + lam * dHR(t) into the scan body, NOT as a one-shot attrs injection"
    - "Model D's response form is identical to Model A (no additional ΔHR-in-response terms — ΔHR enters perception only)"
    - "fit_batch_hierarchical_patrl accepts response_model='model_d' without NotImplementedError"
    - "fit_vb_laplace_patrl accepts response_model='model_d' without NotImplementedError"
    - "Layer-2 clamp (|mu2| < 14) remains enforced inside the new _clamped_step_model_d"
    - "Decision 118 fp64 scan invariant preserved for delta_hr array"
    - "5-agent Laplace recovery smoke of lambda shows posterior mean within 0.3 of the true lambda when data are simulated under Model D"
    - "Task 5 records an explicit TODO-followup: after Plan 20-04 merges, re-run the λ-recovery smoke with the real ε₂-coupled generative simulator (simulate_patrl_cohort with response_model='model_d', lam_true=0.1). The bridge is mirrored as a must_have in Plan 20-04."
  artifacts:
    - path: "src/prl_hgf/fitting/hierarchical_patrl.py"
      provides: "_clamped_step_model_d or equivalent scan-body branch; Model D dispatch in _make_single_logp_fn"
      contains: "omega_eff"
    - path: "src/prl_hgf/fitting/fit_vb_laplace_patrl.py"
      provides: "Laplace log-posterior supports model_d with lam prior + trial-varying omega injection"
      contains: "model_d"
    - path: "src/prl_hgf/fitting/laplace_idata.py"
      provides: "_PARAM_ORDER_2LEVEL_D / _PARAM_ORDER_3LEVEL_D tuples (include lam)"
      contains: "_PARAM_ORDER_2LEVEL_D"
    - path: "tests/test_hierarchical_patrl.py"
      provides: "Model D shape + recovery smoke tests"
      contains: "test_model_d"
  key_links:
    - from: "configs/pat_rl.yaml fitting.priors.lam"
      to: "Laplace / hierarchical log-posterior lam prior"
      via: "prior_lp += norm.logpdf(lam, lam_mean, lam_sd)"
      pattern: "priors\\.lam"
    - from: "_clamped_step_model_d"
      to: "pyhgf belief node attrs[belief_idx]['tonic_volatility']"
      via: "mutate attrs_i with omega_eff_i before calling scan_fn"
      pattern: "tonic_volatility.*omega_eff"
    - from: "delta_hr_arr (sim_df['delta_hr'] column)"
      to: "scan xs tuple"
      via: "append delta_hr as 4th scan input when response_model=='model_d'"
      pattern: "values, observed, time_steps, delta_hr"
---

<objective>
Implement Model D — trial-varying perceptual volatility `omega_eff(t) = omega + lam * dHR(t)` — by injecting the per-trial `tonic_volatility` at the top of the scan body (mirroring the Phase 18-04 kappa-via-attrs reference pattern, Decision 120). Model D's response form is identical to Model A (after the scan completes), so `model_a_logp` with `b` is reused; only the perceptual scan body changes.

Add a `lam` Normal prior to both fitting paths. Plumb `delta_hr` through the scan as a 4th scan input (additive; non-D models ignore it). Add a 5-agent Laplace recovery smoke that verifies λ posterior mean is within 0.3 of the true λ when synthetic data are generated under Model D.

Purpose: SC2 (Model D) + SC3 (trial-varying ω scan-body injection + Layer-2 clamp + fp64 invariants + 5-agent lambda recovery smoke) both land here.
Output: Fully wired Model D in both NUTS and Laplace paths, with recovery smoke test passing.
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
@.planning/phases/20-patrl-scientific-completion/20-02-SUMMARY.md

@src/prl_hgf/fitting/hierarchical_patrl.py
@src/prl_hgf/fitting/fit_vb_laplace_patrl.py
@src/prl_hgf/fitting/laplace_idata.py
@src/prl_hgf/models/response_patrl.py
@tests/test_hierarchical_patrl.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Implement _clamped_step_model_d — trial-varying omega_eff scan body</name>
  <files>src/prl_hgf/fitting/hierarchical_patrl.py</files>
  <action>
    In `_make_single_logp_fn` (around line 200-296), add a conditional scan-body branch for Model D. The existing `_clamped_step` (lines 256-274) handles Models A/B/C (ω injected once into base_attrs before the scan). For Model D, the scan xs tuple must include `delta_hr` per trial, and `tonic_volatility` must be recomputed at each step.

    Pattern (mirrors Decision 120 kappa-via-attrs, but for tonic_volatility at level 2):

    ```python
    # Decision branch at top of _single_logp:
    if response_model == "model_d":
        # Model D: omega_eff(t) = omega + lam * dHR(t). Inject per-trial.
        # Do NOT inject omega into base_attrs up-front for Model D.
        attrs = {**base_attrs}
        if is_3level:
            attrs[_VOLATILITY_NODE] = {
                **attrs[_VOLATILITY_NODE],
                "tonic_volatility": params["omega_3"],
                "volatility_coupling_children": jnp.asarray([params["kappa"]]),
                "mean": params["mu3_0"],
            }
        # belief_idx tonic_volatility will be overwritten per-trial below.

        def _clamped_step_model_d(carry, x):
            val_i, obs_i, ts_i, dhr_i = x
            omega_eff_i = params["omega_2"] + params["lam"] * dhr_i
            attrs_i = {**carry}
            attrs_i[belief_idx] = {
                **attrs_i[belief_idx],
                "tonic_volatility": omega_eff_i,
            }
            new_carry, _traj = scan_fn(attrs_i, ((val_i,), (obs_i,), ts_i, None))
            new_mean = new_carry[belief_idx]["mean"]
            is_stable = jnp.all(jnp.isfinite(new_mean)) & (
                jnp.abs(new_mean) < _MU_2_BOUND
            )
            safe_carry = jax.tree_util.tree_map(
                lambda n, o: jnp.where(is_stable, n, o), new_carry, carry,
            )
            return safe_carry, safe_carry[belief_idx]["mean"]

        values = state.astype(jnp.float64)[:, None]  # (T, 1)
        observed = jnp.ones((n_trials,), dtype=jnp.int32)
        time_steps = jnp.ones((n_trials,), dtype=jnp.float64)
        dhr_trials = delta_hr_jnp.astype(jnp.float64)  # (T,) fp64 per Decision 118

        _, mu2_traj = jax.lax.scan(
            _clamped_step_model_d,
            attrs,
            (values, observed, time_steps, dhr_trials),
        )

        # Response form: Model D uses Model A's response (with b)
        logp_per_trial = model_a_logp(
            mu2_traj, choices.astype(jnp.int32),
            reward.astype(jnp.float64), shock.astype(jnp.float64),
            params["beta"], params.get("b", 0.0),
        )
    else:
        # Existing A/B/C path from Plan 20-02 — unchanged
        ...
    ```

    **Invariants to preserve:**
    - Decision 118: `dhr_trials` cast to fp64 before scan; `values` remain fp64.
    - Decision 120: 3-level kappa injection pattern unchanged for Model D (omega_3/kappa are still one-shot before scan; only omega_2 becomes trial-varying).
    - Layer-2 clamp (`|mu2| < 14`) enforced inside the new step function identically to `_clamped_step`.
    - `base_attrs` is NOT mutated (Model D uses a fresh copy per scan step via `{**carry}`).

    **Dispatch update:** the `response_model` dispatch at the end of `_single_logp` (added in Plan 20-02 Task 2) must route model_d to the Model A response AFTER the Model D scan. Plan 20-02 left a placeholder `raise NotImplementedError("model_d lives in Plan 20-03")` — remove that raise and route to the block above.

    **Relax the entry guard:** in `fit_batch_hierarchical_patrl` (Plan 20-02 left it as `if response_model not in ('model_a','model_b','model_c')`), change to:
    ```python
    if response_model not in ("model_a", "model_b", "model_c", "model_d"):
        raise NotImplementedError(
            f"response_model={response_model!r}: supported are "
            f"'model_a', 'model_b', 'model_c', 'model_d'"
        )
    ```
  </action>
  <verify>
    Run: `python -m py_compile src/prl_hgf/fitting/hierarchical_patrl.py` — no syntax errors.
    Run: `python -c "from prl_hgf.fitting.hierarchical_patrl import fit_batch_hierarchical_patrl; print('OK')"` — import succeeds.
  </verify>
  <done>
    - _clamped_step_model_d exists and has the Layer-2 clamp
    - Scan xs tuple is (values, observed, time_steps, dhr_trials) for Model D
    - Model A response (with b) is used after the Model D scan
    - fit_batch_hierarchical_patrl accepts response_model='model_d'
    - 3-level kappa injection (Decision 120) unchanged for Model D
  </done>
</task>

<task type="auto">
  <name>Task 2: Add lam prior to hierarchical_patrl._build_patrl_log_posterior</name>
  <files>src/prl_hgf/fitting/hierarchical_patrl.py</files>
  <action>
    In `_build_patrl_log_posterior` (grep for this in hierarchical_patrl.py — added the `b`/`gamma`/`alpha` priors in Plan 20-02), add a `lam` prior that activates ONLY for `response_model == "model_d"`:

    ```python
    # After b/gamma/alpha priors:
    if response_model == "model_d":
        # lam_i has Normal prior; small sd=0.1 because lam is a linear coefficient
        # on a bpm-scale ΔHR; a change of 1 bpm should shift omega by ~0.1.
        lam_prior = cfg_priors.lam  # PriorGaussian
        lam_lp = jax.scipy.stats.norm.logpdf(
            params["lam"], lam_prior.mean, lam_prior.sd,
        )
        prior_lp = prior_lp + lam_lp
    ```

    Add `lam` to the `params` dict assembled before the likelihood call:
    ```python
    if response_model == "model_d":
        params["lam"] = free_params["lam"]   # or however free_params are unpacked in this file
    ```

    Mirror the existing closure-based pattern (per Decision 119 — NOT numpyro-traced). The exact symbol name (`free_params`, `theta`, etc.) must match the existing code in `_build_patrl_log_posterior`.

    Note the `b` prior added in 20-02: Model D also uses `b` (because Model A response is reused). Ensure `b` is in params for all of A/B/C/D.
  </action>
  <verify>
    Run: `python -m py_compile src/prl_hgf/fitting/hierarchical_patrl.py`.
    Run: `python -c "from prl_hgf.env.pat_rl_config import load_pat_rl_config; c = load_pat_rl_config(); print(c.fitting.priors.lam.mean, c.fitting.priors.lam.sd)"` — lam prior accessible.
  </verify>
  <done>
    - lam prior log-density term added to prior_lp when response_model == 'model_d'
    - lam is unpacked into params for the likelihood call
    - b remains in params for all model variants
    - Decision 119 (closure-based) preserved
  </done>
</task>

<task type="auto">
  <name>Task 3: Extend fit_vb_laplace_patrl.py to support model_d</name>
  <files>src/prl_hgf/fitting/fit_vb_laplace_patrl.py, src/prl_hgf/fitting/laplace_idata.py</files>
  <action>
    1. **fit_vb_laplace_patrl.py**: relax the entry guard to accept `model_d`:
       ```python
       if response_model not in ("model_a", "model_b", "model_c", "model_d"):
           raise NotImplementedError(
               f"response_model={response_model!r}: supported are "
               f"'model_a', 'model_b', 'model_c', 'model_d'"
           )
       ```

    2. **Extend the Laplace log-posterior** with the Model D scan-body variant. The Laplace path must call the same trial-varying-omega scan. Because the Laplace path operates on a JAX log-posterior function, lift the scan-body branching from Task 1 into a small helper OR duplicate the logic. Prefer the helper pattern: add `_run_patrl_scan(response_model, params, state, delta_hr, is_3level, base_attrs, belief_idx, scan_fn, n_trials)` as a module-level function in `hierarchical_patrl.py`, then import and call from both the hierarchical and Laplace paths. This avoids code duplication and keeps the Model D logic single-sourced.

    3. **Add lam prior to the Laplace log-posterior** for `response_model == "model_d"`, mirroring Task 2 pattern.

    4. **laplace_idata.py**: add new parameter orders:
       ```python
       _PARAM_ORDER_2LEVEL_D: tuple[str, ...] = ("omega_2", "log_beta", "b", "lam")
       _PARAM_ORDER_3LEVEL_D: tuple[str, ...] = (
           "omega_2", "omega_3", "kappa", "mu3_0", "log_beta", "b", "lam",
       )
       ```
       Add to `_VALID_PARAM_ORDERS`. Update the docstring to list all supported parameter orders.

    5. **build_idata_from_laplace**: route `response_model="model_d"` to the new parameter orders. If the function already accepts a `response_model` kwarg from Plan 20-02, extend the if/elif; otherwise add it.

    6. **Participant posterior coords**: ensure `coords` dict in the InferenceData factory lists all parameters including `lam`. Plan 20-02 added the pattern for `b`/`gamma`/`alpha`; extend to `lam` for Model D.
  </action>
  <verify>
    Run: `python -m py_compile src/prl_hgf/fitting/fit_vb_laplace_patrl.py src/prl_hgf/fitting/laplace_idata.py`.
    Run: `python -c "from prl_hgf.fitting.laplace_idata import _PARAM_ORDER_2LEVEL_D, _PARAM_ORDER_3LEVEL_D, _VALID_PARAM_ORDERS; assert _PARAM_ORDER_2LEVEL_D in _VALID_PARAM_ORDERS; print('OK')"`.
  </verify>
  <done>
    - fit_vb_laplace_patrl accepts response_model='model_d'
    - _PARAM_ORDER_2LEVEL_D and _PARAM_ORDER_3LEVEL_D in _VALID_PARAM_ORDERS
    - Helper `_run_patrl_scan` (or equivalent) used by BOTH paths to avoid duplication
    - lam prior active for Model D only
  </done>
</task>

<task type="auto">
  <name>Task 4: Unit tests — Model D scan body + dispatch + shape</name>
  <files>tests/test_hierarchical_patrl.py, tests/test_models_patrl.py</files>
  <action>
    1. **tests/test_hierarchical_patrl.py**:
       - `test_build_logp_fn_batched_patrl_model_d_shape` — build factory with `response_model='model_d'`; assert shape of logp output is `(P,)` and finite for random params
       - `test_model_d_mu2_varies_with_delta_hr` — same config, two runs with different `delta_hr_arr` inputs; assert `mu2_traj` differs (Model A would produce identical trajectories for identical state sequences regardless of ΔHR)
       - `test_model_d_layer2_clamp_active` — feed a pathological `lam` that would push `omega_eff` huge positive for some trials; assert `|mu2_traj| < 14` for all trials (clamp works)
       - `test_model_d_fp64_dtype_preserved` — assert `mu2_traj.dtype == jnp.float64` (Decision 118)
       - `test_model_d_lam_zero_equals_model_a` — with `lam=0`, `b=0`, assert Model D logp equals Model A logp elementwise within 1e-6

    2. **tests/test_models_patrl.py**: no new tests needed (Model D reuses Model A response); add a note in the existing class docstring that Model D's perceptual scan lives in hierarchical_patrl.py.
  </action>
  <verify>
    Run: `pytest tests/test_hierarchical_patrl.py -v -k "model_d"` — all new tests pass.
  </verify>
  <done>
    - 5 new Model D tests in test_hierarchical_patrl.py pass
    - Layer-2 clamp and fp64 invariants verified by tests
    - lam=0 degenerate case verified equivalent to Model A
  </done>
</task>

<task type="auto">
  <name>Task 5: 5-agent Laplace recovery smoke for lambda (SC3)</name>
  <files>tests/test_fit_vb_laplace_patrl.py</files>
  <action>
    Add `test_model_d_lambda_recovery_smoke` to `tests/test_fit_vb_laplace_patrl.py`:

    ```python
    @pytest.mark.slow
    def test_model_d_lambda_recovery_smoke():
        """SC3 gate: Model D λ posterior mean within 0.3 of truth at 5 agents.

        Simulates 5 agents under Model D with a known λ_true, fits via
        fit_vb_laplace_patrl(response_model='model_d'), and asserts the
        posterior mean of λ is within 0.3 of λ_true for at least 3 of 5 agents.

        This is a smoke gate — tighter recovery is validated at 160 agents
        in scripts/05_run_validation.py --task=patrl (PRL-V1 gate).

        NOTE (M7 TODO-followup): The cohort used here generates ΔHR as a
        plain ``Normal(-1, 0.5)`` per trial (no ε₂ coupling) because Plan 20-04
        has not merged yet — see docstring footer. After 20-04 lands, re-run
        this smoke with the real ε₂-coupled generative simulator
        (``simulate_patrl_cohort(response_model='model_d', lam_true=0.1)``)
        to confirm recovery under the scientifically-grounded ΔHR process.
        """
        from prl_hgf.env.pat_rl_config import load_pat_rl_config
        from prl_hgf.env.pat_rl_simulator import simulate_patrl_cohort

        config = load_pat_rl_config()
        # Simulate with Model D at known lam_true. Plan 20-04's simulator
        # extension must optionally accept response_model='model_d' + a true
        # lam — if this isn't yet available at the time this test is written,
        # use a manual cohort builder: simulate mu2 with omega_eff, pass
        # through Model A response.

        lam_true = 0.1
        # ... build 5-agent synthetic cohort with lam_true ...
        # ... call fit_vb_laplace_patrl(sim_df, response_model='model_d') ...
        # ... assert |posterior_mean(lam) - lam_true| < 0.3 for >= 3/5 agents ...
    ```

    **TODO-followup marker (M7):** Until Plan 20-04 merges, the Model D cohort
    simulation inside this test MUST build a LOCAL mini-cohort inline: generate ΔHR
    as `N(-1, 0.5)` for each trial (no ε₂ coupling), run the forward HGF with
    per-trial `omega_eff(t) = omega + lam_true * dhr(t)`, sample Model A choices,
    fit with Model D. This keeps the test self-contained and landable before
    Plan 20-04.

    **AFTER Plan 20-04 merges**, this test MUST be rerun with the real
    ε₂-coupled generator:

    ```python
    # Post-20-04 followup (tracked as must_have in Plan 20-04):
    # sim_df, true_params, _ = simulate_patrl_cohort(
    #     config=config, master_seed=42, n_participants=5,
    #     phenotypes=["healthy"],
    #     response_model="model_d",   # 20-04 adds this kwarg
    #     lam_true=0.1,
    # )
    # ... rerun the same fit + lam-recovery assertion ...
    ```

    Leave the post-20-04 variant as an inline comment block inside this test
    (commented out) so a grep for `Post-20-04 followup` or
    `simulate_patrl_cohort(response_model="model_d"` surfaces the TODO when
    Plan 20-04's SUMMARY is written.

    Mark `@pytest.mark.slow` so it can be excluded from fast test runs. Budget:
    ~2-5 minutes on CPU for 5 agents × 192 trials × Laplace optimization.
  </action>
  <verify>
    Run: `pytest tests/test_fit_vb_laplace_patrl.py::test_model_d_lambda_recovery_smoke -v --run-slow` (or equivalent marker flag). Must pass.

    Grep check: `grep -n "Post-20-04 followup" tests/test_fit_vb_laplace_patrl.py` — match present (documents the M7 bridge in-code).
  </verify>
  <done>
    - test_model_d_lambda_recovery_smoke passes
    - Posterior mean of lam within 0.3 of truth for >= 3/5 agents (SC3)
    - Test self-contained — does not require Plan 20-04 simulator extension to have merged
    - TODO-followup comment block (Post-20-04 followup) present in the test body
      — grep-discoverable; bridges to Plan 20-04's must_have (M7)
  </done>
</task>

</tasks>

<verification>
  - `pytest tests/test_hierarchical_patrl.py tests/test_fit_vb_laplace_patrl.py -v` — all pass (including slow marker)
  - `python -m py_compile src/prl_hgf/fitting/hierarchical_patrl.py src/prl_hgf/fitting/fit_vb_laplace_patrl.py src/prl_hgf/fitting/laplace_idata.py` — clean
  - `ruff check src/prl_hgf/fitting/hierarchical_patrl.py src/prl_hgf/fitting/fit_vb_laplace_patrl.py src/prl_hgf/fitting/laplace_idata.py` — clean
  - `mypy src/prl_hgf/fitting/hierarchical_patrl.py src/prl_hgf/fitting/fit_vb_laplace_patrl.py` — clean
  - Phase 18/19 + Plan 20-01/02 regression: `pytest tests/test_models_patrl.py tests/test_env_pat_rl_config.py tests/test_smoke_patrl_foundation.py -v` — no regressions
</verification>

<success_criteria>
  - SC2 complete (Model D): response_model='model_d' fits cleanly via both fit paths on CPU Laplace smoke
  - SC3 complete: lam recovery posterior mean within 0.3 of truth at 5 agents; Layer-2 clamp and fp64 invariants preserved
  - Model D scan body mirrors Decision 120 kappa-via-attrs pattern (per-trial injection inside _clamped_step)
  - No code duplication: shared _run_patrl_scan helper between hierarchical and Laplace paths
  - blackjax NUTS path for Model D deferred to cluster (consistent with Plan 20-02 for Models B/C)
  - M7 bridge recorded: Plan 20-04's must_haves include re-running Task 5 under the ε₂-coupled generator after 20-04 merges
</success_criteria>

<output>
Create `.planning/phases/20-patrl-scientific-completion/20-03-SUMMARY.md` with: (a) final scan-body diff for Model D (key lines), (b) helper function signature if introduced, (c) recovery smoke result (posterior mean and truth per agent), (d) cluster NUTS smoke TODO for Plan 20-07 / SLURM scripts, (e) explicit note that Task 5's bootstrap Normal(-1, 0.5) ΔHR must be re-verified against Plan 20-04's ε₂-coupled generator (M7 bridge — tracked as must_have in Plan 20-04).
</output>
