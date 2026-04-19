---
phase: 20-patrl-scientific-completion
plan: 04
type: execute
wave: 2
depends_on: [20-01]
files_modified:
  - src/prl_hgf/env/pat_rl_simulator.py
  - tests/test_pat_rl_simulator.py
autonomous: true
estimated_edits: 4
gap_closure: false
user_setup: []

must_haves:
  truths:
    - "run_hgf_forward_patrl optionally returns epsilon2 trajectory via return_epsilon2=True kwarg (backwards compatible)"
    - "simulate_patrl_cohort generates ΔHR per trial as ~N(phenotype.dhr_mean, phenotype.dhr_sd) + phenotype.epsilon2_coupling_coef * epsilon2(t)"
    - "ΔHR is clipped to config.task.delta_hr_stub.bounds after epsilon2 coupling"
    - "sim_df has a 'phenotype' column (canonical name = PHENOTYPE_COLUMN_NAME from Plan 20-01)"
    - "Existing seed-determinism guarantees preserved: same master_seed produces same sim_df"
    - "Existing Phase 18/19 callers (healthy-only, no ε₂) continue to work via safe kwargs defaults"
    - "Plan 20-03's λ-recovery smoke (Task 5) is re-verified against the Plan 20-04 ε₂-coupled generator — this is the M7 bridge. After this plan merges, `tests/test_fit_vb_laplace_patrl.py::test_model_d_lambda_recovery_smoke` must be rerun against a cohort produced by `simulate_patrl_cohort(response_model='model_d', lam_true=0.1)` and pass at the same 0.3 absolute-error threshold for >= 3/5 agents."
  artifacts:
    - path: "src/prl_hgf/env/pat_rl_simulator.py"
      provides: "Extended run_hgf_forward_patrl (return_epsilon2 kwarg), simulate_patrl_cohort with ε₂-coupled ΔHR + phenotype column"
      exports: ["run_hgf_forward_patrl", "simulate_patrl_cohort"]
      min_lines: 250
    - path: "tests/test_pat_rl_simulator.py"
      provides: "Tests for epsilon2 return, ε₂-coupled ΔHR determinism, phenotype column"
      contains: "test_run_hgf_forward_patrl_returns_epsilon2"
  key_links:
    - from: "pyhgf net.node_trajectories[1]['temp']['value_prediction_error']"
      to: "epsilon2 returned by run_hgf_forward_patrl"
      via: "np.asarray(traj['temp']['value_prediction_error'], dtype=float64)"
      pattern: "value_prediction_error"
    - from: "phenotype.epsilon2_coupling_coef + phenotype.dhr_mean/sd"
      to: "delta_hr per-trial draw in simulate_patrl_cohort"
      via: "rng.normal(mean, sd, n_trials) + coef * epsilon2_traj; clip to bounds"
      pattern: "epsilon2_coupling_coef \\*"
    - from: "simulate_patrl_cohort rows"
      to: "sim_df['phenotype'] column"
      via: "row['phenotype'] = phenotype_name per participant"
      pattern: "\"phenotype\":"
    - from: "simulate_patrl_cohort(response_model='model_d', lam_true=...)"
      to: "Plan 20-03 Task 5 λ-recovery smoke (re-verification)"
      via: "optional response_model + lam_true kwargs; forward HGF uses omega_eff(t) = omega + lam_true * dhr(t)"
      pattern: "response_model.*lam_true"
---

<objective>
Replace the simulator's placeholder (state-conditioned stub) ΔHR with the phenotype-specific, ε₂-coupled generative model from SC4. Extract ε₂(t) = value_prediction_error at the belief node (which pyhgf already computes internally per Decision 126) from the forward HGF pass. Compute `ΔHR(t) ~ N(phenotype.dhr_mean, phenotype.dhr_sd) + phenotype.epsilon2_coupling_coef * ε₂(t)` and clip to `config.task.delta_hr_stub.bounds`.

Also add a canonical `phenotype` column to every sim_df row — this is the propagation-critical column for phenotype-stratified BMS (Plan 20-06) and phenotype-separability gate (Plan 20-07). RESEARCH.md §12 Risk 3 flagged this as a silent-failure candidate; use `PHENOTYPE_COLUMN_NAME` from Plan 20-01.

Plan 20-05 changes `n_participants_per_phenotype` to 40 and adds the per-phenotype SeedSequence spawn pattern. This plan (20-04) stays compatible with the existing single-phenotype signature by accepting `phenotypes` as an optional list-of-names kwarg with default behavior matching Phase 18/19.

**M7 bridge:** This plan MUST also expose an optional `response_model='model_d'` + `lam_true` kwarg pair so Plan 20-03's λ-recovery smoke can be re-verified under the real ε₂-coupled generator. See Task 5 below.

Purpose: SC4 (ε₂-coupled ΔHR generative model) is a Phase 20 scientific necessity. Without this, Models B/C/D have no scientifically-justified ΔHR input; they would degenerate to noise regression. This plan is ALSO a dependency for Plan 20-06 (BMS needs phenotype column) and Plan 20-07 (separability gate needs phenotype column). The M7 bridge closes the loop with Plan 20-03's λ-recovery test.
Output: Simulator that generates phenotype-correct ΔHR, tags every trial row with its phenotype, and supports the Model D generative pathway for cross-plan recovery re-verification.
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

@src/prl_hgf/env/pat_rl_simulator.py
@src/prl_hgf/env/pat_rl_sequence.py
@src/prl_hgf/env/pat_rl_config.py
@src/prl_hgf/models/hgf_2level_patrl.py
@src/prl_hgf/models/hgf_3level_patrl.py
@tests/test_pat_rl_simulator.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Extend run_hgf_forward_patrl with return_epsilon2 kwarg</name>
  <files>src/prl_hgf/env/pat_rl_simulator.py</files>
  <action>
    Edit `src/prl_hgf/env/pat_rl_simulator.py`:

    Modify `run_hgf_forward_patrl` (line 29-74) to optionally return `epsilon2`:

    ```python
    def run_hgf_forward_patrl(
        trials: list[PATRLTrial],
        omega_2: float,
        level: int,
        omega_3: float = -6.0,
        kappa: float = 1.0,
        mu3_0: float = 1.0,
        return_epsilon2: bool = False,
    ) -> np.ndarray | tuple[np.ndarray, np.ndarray]:
        """Run HGF forward pass and return per-trial mu2 trajectory.

        Parameters
        ----------
        ...
        return_epsilon2 : bool, default False
            If True, also return the level-2 prediction error trajectory
            ε₂(t) = ``node_trajectories[1]['temp']['value_prediction_error']``.
            Used by the phenotype-specific ΔHR generative model
            (``simulate_patrl_cohort``, SC4). Decision 126 confirms pyhgf 0.2.8
            exposes this key. Default False preserves the Phase 18/19 return
            shape (mu2 only).

        Returns
        -------
        mu2_array : np.ndarray, shape (n_trials,), float64
            Belief posterior mean.
        epsilon2_array : np.ndarray, shape (n_trials,), float64
            ONLY returned when return_epsilon2=True.
        """
        u = np.array([t.state for t in trials], dtype=np.float64)
        n_trials = len(trials)

        if level == 2:
            net = build_2level_network_patrl(omega_2=omega_2)
        else:
            net = build_3level_network_patrl(
                omega_2=omega_2, omega_3=omega_3, kappa=kappa, mu3_0=mu3_0
            )

        net.input_data(
            input_data=u[:, None],
            time_steps=np.ones(n_trials, dtype=np.float64),
        )
        traj = net.node_trajectories[1]  # BELIEF_NODE = 1
        mu2 = np.asarray(traj["mean"], dtype=np.float64)

        if return_epsilon2:
            # Decision 126: pyhgf 0.2.8 temp keys confirmed present.
            # value_prediction_error is the ε₂(t) trajectory at level 2.
            try:
                epsilon2 = np.asarray(
                    traj["temp"]["value_prediction_error"], dtype=np.float64,
                )
            except (KeyError, TypeError) as exc:
                raise RuntimeError(
                    "run_hgf_forward_patrl: expected "
                    "node_trajectories[1]['temp']['value_prediction_error'] "
                    "to be present (Decision 126). Check pyhgf version."
                ) from exc
            if epsilon2.shape != mu2.shape:
                raise ValueError(
                    f"epsilon2 shape {epsilon2.shape} != mu2 shape "
                    f"{mu2.shape}; aborting to surface pyhgf API change."
                )
            return mu2, epsilon2
        return mu2
    ```

    Preserve the Phase 18/19 default return type (`np.ndarray`) when `return_epsilon2=False`. Callers that use positional unpacking would only break if they assume the tuple form — which no existing caller does.
  </action>
  <verify>
    Run: `python -c "from prl_hgf.env.pat_rl_simulator import run_hgf_forward_patrl; from prl_hgf.env.pat_rl_config import load_pat_rl_config; from prl_hgf.env.pat_rl_sequence import generate_session_patrl; c = load_pat_rl_config(); tr = generate_session_patrl(c, seed=42); mu2 = run_hgf_forward_patrl(tr, omega_2=-3.0, level=2); assert mu2.ndim == 1; mu2_b, eps = run_hgf_forward_patrl(tr, omega_2=-3.0, level=2, return_epsilon2=True); import numpy as np; assert mu2_b.shape == eps.shape; assert np.all(np.isfinite(eps)); print('OK')"`
  </verify>
  <done>
    - run_hgf_forward_patrl accepts return_epsilon2 kwarg (default False)
    - Default return type unchanged from Phase 18/19 (np.ndarray)
    - Return tuple (mu2, epsilon2) when flag is True; shapes match; all finite
    - RuntimeError with helpful message if pyhgf temp key missing (surface API regressions explicitly)
  </done>
</task>

<task type="auto">
  <name>Task 2: Extend simulate_patrl_cohort — ε₂-coupled ΔHR + phenotype column (single-phenotype backward-compatible)</name>
  <files>src/prl_hgf/env/pat_rl_simulator.py</files>
  <action>
    Edit `simulate_patrl_cohort` (line 77-217). Keep the existing signature but make two additive changes:

    1. Accept an optional `phenotype_name: str = "healthy"` kwarg (Plan 20-05 will generalize to a list). For now, multi-phenotype support is NOT in scope — this plan is the per-phenotype ΔHR generation. Plan 20-05 wraps this function in a multi-phenotype loop.

    2. After the forward HGF pass (line 160-170), request ε₂ via `return_epsilon2=True`. Replace:
       ```python
       mu2_traj = run_hgf_forward_patrl(trials, omega_2_true, level=2)
       ```
       with:
       ```python
       mu2_traj, epsilon2_traj = run_hgf_forward_patrl(
           trials, omega_2_true, level=2, return_epsilon2=True,
       )
       ```
       (and similarly for the level=3 branch).

    3. **Replace the delta_hr extraction** from `trials` (line 189) with ε₂-coupled generation. The current code uses per-trial stub ΔHR already baked into the `PATRLTrial`. Override it:
       ```python
       # --- Phase 20 SC4: ε₂-coupled ΔHR generative model ---
       # Previously: delta_hr = np.array([t.delta_hr for t in trials], ...)
       # Now: generate from phenotype-specific Gaussian + ε₂ coupling.
       dhr_rng = np.random.default_rng(int(rng.integers(0, 2**31)))
       base_dhr = dhr_rng.normal(
           phenotype.dhr_mean, phenotype.dhr_sd, size=n_trials,
       )
       delta_hr = base_dhr + phenotype.epsilon2_coupling_coef * epsilon2_traj
       # Clip to config.task.delta_hr_stub.bounds (safety — avoid unphysical HR)
       dhr_bounds = config.task.delta_hr_stub.bounds
       delta_hr = np.clip(delta_hr, dhr_bounds[0], dhr_bounds[1])
       ```

    4. **Add phenotype column** to every row:
       ```python
       for t_idx, trial in enumerate(trials):
           all_rows.append({
               "participant_id": pid,
               "phenotype": phenotype_name,   # NEW: canonical column
               "trial_idx": trial.trial_idx,
               "state": trial.state,
               "choice": int(choices_int[t_idx]),
               "reward_mag": trial.reward_mag,
               "shock_mag": trial.shock_mag,
               "delta_hr": float(delta_hr[t_idx]),
               "outcome_time_s": trial.outcome_time_s,
           })
       ```
       Use `PHENOTYPE_COLUMN_NAME` from Plan 20-01 as the key. Import it:
       ```python
       from prl_hgf.env.pat_rl_config import PATRLConfig, PHENOTYPE_COLUMN_NAME
       ```
       and use `PHENOTYPE_COLUMN_NAME` as the dict key.

    5. **Update the phenotype selection line** (line 110):
       ```python
       phenotype = config.simulation.phenotypes[phenotype_name]
       ```

    6. **Update the docstring** to reflect the new ε₂-coupled ΔHR and phenotype column. Cite Klaassen 2024 Communications Biology in the Notes section (Plan 20-08 will do final citation pass; add the reference inline here).

    7. **Preserve seed determinism**: the new `dhr_rng` is spawned from the existing `rng` (per-participant), so same `master_seed` -> same sim_df. Verify via Task 4 test.
  </action>
  <verify>
    Run from project root: `python -c "from prl_hgf.env.pat_rl_simulator import simulate_patrl_cohort; from prl_hgf.env.pat_rl_config import load_pat_rl_config; c = load_pat_rl_config(); df, tp, tbp = simulate_patrl_cohort(n_participants=3, level=2, master_seed=42, config=c, phenotype_name='healthy'); assert 'phenotype' in df.columns; assert set(df['phenotype'].unique()) == {'healthy'}; assert df['delta_hr'].between(c.task.delta_hr_stub.bounds[0], c.task.delta_hr_stub.bounds[1]).all(); print('OK')"`
  </verify>
  <done>
    - simulate_patrl_cohort accepts phenotype_name kwarg (default 'healthy' for backward compat)
    - delta_hr per trial is phenotype-specific + ε₂-coupled, clipped to config bounds
    - sim_df has 'phenotype' column (keyed via PHENOTYPE_COLUMN_NAME)
    - Seed determinism preserved
    - Phase 18/19 callers that don't pass phenotype_name still work
  </done>
</task>

<task type="auto">
  <name>Task 3: Update scripts/12_smoke_patrl_foundation.py to use phenotype column + ε₂-coupled ΔHR</name>
  <files>scripts/12_smoke_patrl_foundation.py</files>
  <action>
    Open `scripts/12_smoke_patrl_foundation.py`. If it constructs `sim_df` directly (bypassing `simulate_patrl_cohort`), update to use the extended simulator signature. If it already goes through `simulate_patrl_cohort`, no change needed — but verify by reading the file.

    Specifically:
    - Wherever `sim_df` is built or consumed, `sim_df["phenotype"]` must be present (now always true after Task 2).
    - The `_fit_blackjax` / `_fit_laplace` helpers should NOT need changes — they read `participant_id`, `trial_idx`, `state`, `choice`, `reward_mag`, `shock_mag`, `delta_hr`. If any helper does an explicit dtype check on columns, add `phenotype` to the allowed set.

    Assertions added: at the end of a smoke run, assert `"phenotype" in sim_df.columns` and the column is non-empty.

    If the script has logging, log per-phenotype participant counts.
  </action>
  <verify>
    Run: `python scripts/12_smoke_patrl_foundation.py --n-participants 2 --no-blackjax` — exit code 0; log includes phenotype column info.
  </verify>
  <done>
    - scripts/12 handles the new phenotype column without breaking
    - Smoke runs end-to-end with phenotype='healthy' default
  </done>
</task>

<task type="auto">
  <name>Task 4: Tests — epsilon2 return, ε₂-coupled ΔHR determinism, phenotype column</name>
  <files>tests/test_pat_rl_simulator.py</files>
  <action>
    Add these tests to `tests/test_pat_rl_simulator.py`:

    1. `test_run_hgf_forward_patrl_returns_epsilon2` — call with `return_epsilon2=True`; assert tuple return; epsilon2 shape matches mu2 shape; all finite.

    2. `test_run_hgf_forward_patrl_default_scalar_return_unchanged` — backward-compatibility anchor: default kwarg returns np.ndarray (not tuple).

    3. `test_simulate_patrl_cohort_has_phenotype_column` — run 3 agents; assert `'phenotype' in df.columns` and all rows have non-empty phenotype string.

    4. `test_simulate_patrl_cohort_epsilon2_coupled_dhr_deterministic` — run twice with same `master_seed`; assert `df1['delta_hr'].equals(df2['delta_hr'])`.

    5. `test_simulate_patrl_cohort_dhr_differs_from_pure_phenotype` — compare two cohorts: one with phenotype `healthy` (dhr_mean=-2, epsilon2_coupling_coef=0.3), one with phenotype `anxious` (dhr_mean=-0.5). Assert `df_healthy['delta_hr'].mean() < df_anxious['delta_hr'].mean()` — phenotype effect survives.

    6. `test_simulate_patrl_cohort_dhr_within_bounds` — assert `(df['delta_hr'] >= bounds[0]).all() & (df['delta_hr'] <= bounds[1]).all()`.

    7. `test_simulate_patrl_cohort_epsilon2_contributes_nonzero_variance` — fix `master_seed`; run two cohorts, one with `phenotype.epsilon2_coupling_coef = 0.0` (edit config in memory) and one with 0.3. Assert the ΔHR std differs — confirms ε₂ coupling actually fires.

    Follow existing test conventions. Mark `@pytest.mark.skipif` on pyhgf availability if the file already uses that pattern.
  </action>
  <verify>
    Run: `pytest tests/test_pat_rl_simulator.py -v` — all existing + 7 new tests pass.
  </verify>
  <done>
    - 7 new tests pass
    - Existing Phase 18 tests in same file still pass
    - Seed determinism proven via test
    - Phenotype effect on ΔHR proven via test
  </done>
</task>

<task type="auto">
  <name>Task 5: M7 bridge — optional response_model='model_d' + lam_true kwargs + re-run Plan 20-03 λ-recovery smoke</name>
  <files>src/prl_hgf/env/pat_rl_simulator.py, tests/test_pat_rl_simulator.py, tests/test_fit_vb_laplace_patrl.py</files>
  <action>
    Close the M7 bridge identified by the checker: after this plan lands, Plan 20-03's
    bootstrap λ-recovery smoke MUST be re-verified under the ε₂-coupled generator.

    1. **Extend `simulate_patrl_cohort`** to accept two additional optional kwargs:
       ```python
       def simulate_patrl_cohort(
           ...,
           response_model: str = "model_a",   # Phase 18/19 default
           lam_true: float | None = None,      # Required if response_model == "model_d"
           ...,
       ) -> tuple[pd.DataFrame, dict, dict]:
       ```
       - `response_model="model_a"`: Phase 18/19 behavior (unchanged).
       - `response_model="model_d"`: inside the forward HGF pass, use
         `omega_eff(t) = omega_2_true + lam_true * dhr(t)`. This requires
         computing ΔHR FIRST (from `phenotype.dhr_mean/sd` only — no ε₂ coupling
         during the perception pass, because ε₂ is the output of the forward run),
         then running the HGF with `omega_eff(t)` per-trial via the same attrs
         injection pattern as `_clamped_step_model_d` in Plan 20-03.

       ALTERNATIVE implementation path (simpler, preferred): generate ΔHR
       as Plan 20-04 Task 2 does (from ε₂ of a Model-A forward pass), then
       RE-RUN the forward HGF with `omega_eff(t) = omega_2_true + lam_true * dhr(t)`
       using the already-computed ΔHR trajectory. This is a two-pass generative
       procedure; document it explicitly in the docstring.

       Validate: `response_model="model_d"` requires `lam_true is not None`;
       raise `ValueError` otherwise. For `response_model in {"model_a","model_b","model_c"}`,
       `lam_true` must be `None` — raise if set (defense against silent misuse).

    2. **Update `true_params` output**: when `response_model="model_d"`, include
       `"lam": lam_true` in each participant's dict so Plan 20-03's recovery
       comparison finds the truth value by the canonical key `lam`.

    3. **Add test** `test_simulate_patrl_cohort_model_d_uses_lam_true` to
       `tests/test_pat_rl_simulator.py`:
       - Run with `response_model="model_d", lam_true=0.0` vs same seed with
         `lam_true=0.5`. Assert the resulting `sim_df['choice']` arrays differ
         (non-zero λ actually bends the belief trajectory).
       - Run with `response_model="model_d"` and `lam_true=None`; assert
         `ValueError`.
       - Run with `response_model="model_a"` and `lam_true=0.1`; assert
         `ValueError` (defensive check).

    4. **Re-enable the M7 bridge test** in `tests/test_fit_vb_laplace_patrl.py`.
       Plan 20-03's `test_model_d_lambda_recovery_smoke` contains a commented
       "Post-20-04 followup" block. In THIS plan (20-04), uncomment that block
       by adding a NEW sibling test
       `test_model_d_lambda_recovery_smoke_epsilon2_coupled` that:
       - Calls `simulate_patrl_cohort(config=c, master_seed=42,
         n_participants=5, phenotypes=["healthy"],
         response_model="model_d", lam_true=0.1)`
       - Fits via `fit_vb_laplace_patrl(sim_df, response_model="model_d")`
       - Asserts `|posterior_mean(lam) - 0.1| < 0.3` for >= 3/5 agents
         (same threshold as Plan 20-03's bootstrap smoke).

       Mark `@pytest.mark.slow` (same budget as Plan 20-03: ~2-5 min CPU).

       DO NOT delete or rename Plan 20-03's original bootstrap test —
       keep both so regressions in either path are catchable.

    5. **Document the M7 bridge in the docstring** of `simulate_patrl_cohort`:
       ```
       Notes
       -----
       When `response_model="model_d"` is combined with `lam_true`, this
       function becomes the generator for Plan 20-03's λ-recovery smoke
       (M7 bridge). See `tests/test_fit_vb_laplace_patrl.py::
       test_model_d_lambda_recovery_smoke_epsilon2_coupled`.
       ```
  </action>
  <verify>
    Run: `pytest tests/test_pat_rl_simulator.py -v -k "model_d"` — passes.
    Run: `pytest tests/test_fit_vb_laplace_patrl.py::test_model_d_lambda_recovery_smoke_epsilon2_coupled -v --run-slow` — passes with λ-recovery gate met at ε₂-coupled generator.
    Grep check: `grep -n "response_model.*model_d.*lam_true\|lam_true.*response_model" src/prl_hgf/env/pat_rl_simulator.py` — match present.
  </verify>
  <done>
    - simulate_patrl_cohort accepts response_model and lam_true kwargs
    - Validation errors raised for mismatched response_model/lam_true combos
    - true_params carries lam when response_model='model_d'
    - New test test_simulate_patrl_cohort_model_d_uses_lam_true passes
    - New test test_model_d_lambda_recovery_smoke_epsilon2_coupled passes
    - Plan 20-03 bootstrap test kept as-is (both coexist)
    - M7 bridge closed
  </done>
</task>

</tasks>

<verification>
  - `pytest tests/test_pat_rl_simulator.py -v` — all pass
  - `pytest tests/test_smoke_patrl_foundation.py -v` — all pass
  - `pytest tests/test_fit_vb_laplace_patrl.py -v --run-slow -k "lambda_recovery"` — both bootstrap (20-03) and ε₂-coupled (20-04) recovery smokes pass
  - `python scripts/12_smoke_patrl_foundation.py --n-participants 2 --no-blackjax` — exit 0
  - `ruff check src/prl_hgf/env/pat_rl_simulator.py tests/test_pat_rl_simulator.py` — clean
  - `mypy src/prl_hgf/env/pat_rl_simulator.py` — clean
  - Phase 18/19 regression: `pytest tests/test_env_pat_rl_config.py tests/test_models_patrl.py tests/test_hierarchical_patrl.py -v` — clean
</verification>

<success_criteria>
  - SC4 complete: ΔHR generated as `N(phenotype.dhr_mean, phenotype.dhr_sd) + phenotype.epsilon2_coupling_coef * ε₂(t)` with clipping
  - sim_df['phenotype'] column exists — canonical, using PHENOTYPE_COLUMN_NAME from Plan 20-01
  - run_hgf_forward_patrl has return_epsilon2 kwarg — backwards compatible
  - Seed determinism preserved end-to-end
  - Plan 20-05 can wrap simulate_patrl_cohort in a multi-phenotype loop without further simulator changes
  - M7 bridge closed: simulate_patrl_cohort(response_model='model_d', lam_true=...) exists and drives a new λ-recovery smoke at parity with Plan 20-03's bootstrap version
</success_criteria>

<output>
Create `.planning/phases/20-patrl-scientific-completion/20-04-SUMMARY.md` with: (a) updated run_hgf_forward_patrl signature, (b) ε₂-coupled ΔHR formula as implemented, (c) ΔHR bounds clipping behavior, (d) phenotype column propagation path (sim_df → fit_df via compute_stratified_bms in Plan 20-06), (e) M7 bridge resolution — new signature of simulate_patrl_cohort with response_model + lam_true, plus the result of the ε₂-coupled λ-recovery smoke (posterior mean and truth per agent, compared against Plan 20-03's bootstrap result).
</output>
