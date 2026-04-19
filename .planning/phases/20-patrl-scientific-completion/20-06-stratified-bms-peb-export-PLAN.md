---
phase: 20-patrl-scientific-completion
plan: 06
type: execute
wave: 3
depends_on: [20-04, 20-05]
files_modified:
  - src/prl_hgf/analysis/bms.py
  - tests/test_bms.py
autonomous: true
estimated_edits: 4
gap_closure: false
user_setup: []

must_haves:
  truths:
    - "compute_batch_waic_patrl(sim_df, idata_dict) propagates sim_df['phenotype'] into fit_df['phenotype'] — this is the producer that Plan 20-06 Task 2 (stratified BMS) consumes"
    - "compute_stratified_bms(fit_df, model_names, phenotype_col='phenotype') returns per-phenotype posterior model probabilities + exceedance probabilities"
    - "compute_stratified_bms('all' key) additionally returns pooled-across-phenotype BMS"
    - "export_peb_covariates(fit_df_2level, fit_df_3level, output_path) writes a CSV with columns participant_id, phenotype, delta_waic, delta_f"
    - "Existing run_stratified_bms (group-based) is UNCHANGED — Phase 1 pick_best_cue callers continue to work"
    - "fit_df column requirements documented: participant_id, phenotype, model, elpd_waic"
    - "The 160-agent multi-phenotype fit_df required by compute_stratified_bms comes from Plan 20-05's cohort run through Plan 20-06 Task 1's compute_batch_waic_patrl bridge"
  artifacts:
    - path: "src/prl_hgf/analysis/bms.py"
      provides: "compute_batch_waic_patrl, compute_subject_waic_patrl, compute_stratified_bms, export_peb_covariates"
      exports: ["compute_batch_waic_patrl", "compute_subject_waic_patrl", "compute_stratified_bms", "export_peb_covariates", "run_group_bms", "run_stratified_bms", "compute_batch_waic", "compute_subject_waic", "plot_exceedance_probabilities"]
      contains: "def compute_stratified_bms"
    - path: "tests/test_bms.py"
      provides: "Tests covering compute_batch_waic_patrl (phenotype propagation) + compute_stratified_bms + export_peb_covariates"
      contains: "test_compute_stratified_bms"
  key_links:
    - from: "sim_df['phenotype'] column from Plan 20-04"
      to: "fit_df['phenotype'] column via compute_batch_waic_patrl (Task 1)"
      via: "id_to_phen mapping extracted from sim_df + injected into every output row"
      pattern: "id_to_phen"
    - from: "fit_df from compute_batch_waic_patrl (Task 1)"
      to: "compute_stratified_bms (Task 2) + export_peb_covariates (Task 3)"
      via: "single producer → multiple consumers in same plan"
      pattern: "fit_df"
    - from: "fit_df_2level vs fit_df_3level (same participant_id)"
      to: "merged CSV with delta_waic = elpd_waic(3l) - elpd_waic(2l)"
      via: "pd.merge on ['participant_id', 'phenotype']"
      pattern: "delta_waic"
---

<objective>
Deliver the full producer/consumer chain for phenotype-stratified model comparison:

1. **Producer (Task 1, NEW — moved from Plan 20-07):** `compute_batch_waic_patrl` — a PAT-RL variant of `compute_batch_waic` that propagates the `phenotype` column from sim_df (Plan 20-04) into fit_df. This is the bridge that closes RESEARCH.md §6.4 and enables everything downstream.

2. **Consumer A (Task 2):** `compute_stratified_bms` — phenotype-stratified Bayesian Model Selection. Requires a fit_df with a `phenotype` column (from Task 1).

3. **Consumer B (Task 3):** `export_peb_covariates` — per-subject Δ-evidence covariates for downstream PEB regression.

All three are ADDITIVE — existing `run_group_bms` / `run_stratified_bms` (which stratify by `group`, for pick_best_cue) remain UNCHANGED per Decision 109 (parallel-stack invariant) and RESEARCH.md §12 Risk 6 (keep both).

The PAT-RL stratification key is `phenotype` (4 values: healthy, anxious, reward_sensitive, anxious_reward_sensitive) — NOT `group`. The new `compute_stratified_bms` function is the public PAT-RL entry point; `export_peb_covariates` is the bridge to downstream PEB regression (Parametric Empirical Bayes — a sister-repo concern).

**Checker note (H3):** The original plan placed `compute_batch_waic_patrl` in Plan 20-07 Task 1 (consumer of fit_df), but Task 2 of this plan (compute_stratified_bms) is the REAL consumer — so the producer must land HERE. The dependency inversion is fixed by moving the function into 20-06 and updating 20-07's `depends_on` to include 20-06.

Purpose: SC6 delivers the model-comparison surface for phenotype-specific hypotheses. Without this, the 160-agent cohort from Plan 20-05 can only be analyzed as a single pool — losing the phenotype-specific 2-level-vs-3-level comparison that motivates the study.
Output: Three new functions in `bms.py` (plus one helper `compute_subject_waic_patrl`) + tests.
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
@.planning/phases/20-patrl-scientific-completion/20-04-SUMMARY.md
@.planning/phases/20-patrl-scientific-completion/20-05-SUMMARY.md

@src/prl_hgf/analysis/bms.py
@src/prl_hgf/fitting/hierarchical_patrl.py
@tests/test_bms.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Implement compute_batch_waic_patrl — the phenotype-propagating WAIC bridge (moved from Plan 20-07)</name>
  <files>src/prl_hgf/analysis/bms.py</files>
  <action>
    `compute_batch_waic` (line 170-277 in current `bms.py`) currently keys on `(participant_id, group, session)`. For PAT-RL there is no `group` or `session` — only `participant_id` and `phenotype`. Two options:

    **Option A (additive, recommended):** Add a small new function `compute_batch_waic_patrl(sim_df, idata_dict, model_names=None)`:
    - Iterates over `(participant_id, phenotype)` pairs (no group/session).
    - Returns DataFrame with columns: `participant_id`, `phenotype`, `model`, `elpd_waic`.
    - Internally calls `compute_subject_waic_patrl` for each participant.

    **Option B:** Generalize `compute_batch_waic` to accept a `strat_cols: list[str]` kwarg. Breaking change risk — reject this unless trivial.

    Implement Option A:

    ```python
    def compute_batch_waic_patrl(
        sim_df: pd.DataFrame,
        idata_dict: dict[str, dict[str, az.InferenceData]],
        model_names: list[str] | None = None,
    ) -> pd.DataFrame:
        """Compute WAIC for all PAT-RL participants across models.

        PAT-RL variant of :func:`compute_batch_waic`. Keys on
        ``participant_id`` only (no group/session dimension) and propagates
        the ``phenotype`` column from sim_df into the output — this is the
        bridge from Plan 20-04 (simulator phenotype tagging) to Plan 20-06
        (compute_stratified_bms).

        Parameters
        ----------
        sim_df : pandas.DataFrame
            Trial-level data from
            :func:`~prl_hgf.env.pat_rl_simulator.simulate_patrl_cohort`.
            Must have ``participant_id``, ``phenotype``, plus PAT-RL trial
            columns (``state``, ``choice``, ``reward_mag``, ``shock_mag``,
            ``delta_hr``).
        idata_dict : dict[str, dict[str, az.InferenceData]]
            Nested mapping ``idata_dict[model_name][participant_id]``.
        model_names : list[str] or None
            Defaults to ``['hgf_2level_patrl', 'hgf_3level_patrl']``.

        Returns
        -------
        pandas.DataFrame
            Columns: ``participant_id``, ``phenotype``, ``model``, ``elpd_waic``.
            One row per (participant, model) pair.

        Notes
        -----
        Uses a PAT-RL-specific WAIC inner function (since the existing
        :func:`compute_subject_waic` is hardcoded to the 3-cue
        pick_best_cue logp ops). A new
        ``compute_subject_waic_patrl(sim_df_sub, idata, model_name)`` helper
        is added inside this file that calls the PAT-RL logp factory.

        References
        ----------
        Watanabe 2010. "Asymptotic equivalence of Bayes cross validation
        and widely applicable information criterion."
        """
        if model_names is None:
            model_names = ["hgf_2level_patrl", "hgf_3level_patrl"]

        id_to_phen = (
            sim_df[["participant_id", "phenotype"]]
            .drop_duplicates()
            .set_index("participant_id")["phenotype"]
            .to_dict()
        )

        rows: list[dict] = []
        for model in model_names:
            idata_map = idata_dict.get(model, {})
            for pid, idata in idata_map.items():
                try:
                    elpd = compute_subject_waic_patrl(
                        sim_df[sim_df.participant_id == pid].reset_index(drop=True),
                        idata, model,
                    )
                except Exception:
                    log.exception(
                        "WAIC failed for participant=%s model=%s", pid, model,
                    )
                    continue
                rows.append({
                    "participant_id": pid,
                    "phenotype": id_to_phen.get(pid, "unknown"),
                    "model": model,
                    "elpd_waic": elpd,
                })
        return pd.DataFrame(rows, columns=["participant_id", "phenotype", "model", "elpd_waic"])
    ```

    Add a stub `compute_subject_waic_patrl` that calls `build_logp_fn_batched_patrl` to re-evaluate logp per posterior sample. Mirror the pattern from `compute_subject_waic` (line 64) but use the PAT-RL logp factory.

    Export `compute_batch_waic_patrl` and `compute_subject_waic_patrl` in `__all__`.
  </action>
  <verify>
    Run: `python -c "from prl_hgf.analysis.bms import compute_batch_waic_patrl, compute_subject_waic_patrl; print('OK')"`.
  </verify>
  <done>
    - compute_batch_waic_patrl function exists
    - compute_subject_waic_patrl helper function exists
    - Both exported in __all__
    - Propagates phenotype column from sim_df into fit_df output
    - H3 producer/consumer inversion closed: 20-06 now owns the bridge
  </done>
</task>

<task type="auto">
  <name>Task 2: Implement compute_stratified_bms in bms.py</name>
  <files>src/prl_hgf/analysis/bms.py</files>
  <action>
    Add `compute_stratified_bms` to `src/prl_hgf/analysis/bms.py` (append after `run_stratified_bms` around line 447):

    ```python
    def compute_stratified_bms(
        fit_df: pd.DataFrame,
        model_names: list[str],
        phenotype_col: str = "phenotype",
        evidence_col: str = "elpd_waic",
    ) -> dict[str, dict]:
        """PAT-RL phenotype-stratified Bayesian Model Selection.

        Delegates to :func:`run_group_bms` per-phenotype and for the pooled
        sample, returning a dict keyed by ``"all"`` plus each phenotype label.
        This is the PAT-RL analog of :func:`run_stratified_bms` (which
        stratifies by ``group`` for pick_best_cue).

        Parameters
        ----------
        fit_df : pandas.DataFrame
            Must have columns ``participant_id``, ``<phenotype_col>``,
            ``model``, ``<evidence_col>``. One row per
            (participant_id, model) pair. Typical source is
            :func:`compute_batch_waic_patrl` (Task 1 above) with the
            ``phenotype`` column already propagated from sim_df
            (see Plan 20-04).
        model_names : list[str]
            Model names to include; determines column order in the
            per-subject ELPD matrix. For Phase 20 typically
            ``["hgf_2level_patrl", "hgf_3level_patrl"]``.
        phenotype_col : str, default "phenotype"
            Column name for stratification. Use the canonical
            ``PHENOTYPE_COLUMN_NAME`` constant from
            :mod:`prl_hgf.env.pat_rl_config`.
        evidence_col : str, default "elpd_waic"
            Column containing per-subject model evidence (higher = better).

        Returns
        -------
        dict[str, dict]
            Keys: ``"all"`` (pooled BMS across all phenotypes) plus every
            unique value in ``fit_df[phenotype_col]``. Values: dicts from
            :func:`run_group_bms` with keys ``alpha``, ``exp_r``, ``xp``,
            ``pxp``, ``bor``, ``model_names``, ``group_label``, ``n_subjects``.

        Raises
        ------
        ValueError
            If required columns are missing or model_names is not a subset of
            ``fit_df['model'].unique()``.

        Notes
        -----
        Per-phenotype BMS with fewer than ~20 subjects has limited
        statistical power — the function still runs but logs a warning
        (mirrors :func:`run_stratified_bms` behavior).

        Parallel-stack invariant (Decision 109): this function coexists with
        :func:`run_stratified_bms`; neither delegates to the other. Both call
        :func:`run_group_bms` internally.

        References
        ----------
        Rigoux et al. 2014. "Bayesian model selection for group studies —
        revisited." Neuroimage 84: 971-985.
        """
        required_cols = {"participant_id", phenotype_col, "model", evidence_col}
        missing = required_cols - set(fit_df.columns)
        if missing:
            raise ValueError(
                f"compute_stratified_bms: fit_df missing columns {sorted(missing)}; "
                f"got columns {sorted(fit_df.columns)}"
            )
        available_models = set(fit_df["model"].unique())
        missing_models = set(model_names) - available_models
        if missing_models:
            raise ValueError(
                f"compute_stratified_bms: model_names {sorted(missing_models)} "
                f"not found in fit_df['model'].unique()={sorted(available_models)}"
            )

        results: dict[str, dict] = {}

        def _build_matrix(df: pd.DataFrame) -> np.ndarray | None:
            pivot = df.pivot_table(
                index="participant_id", columns="model", values=evidence_col,
                aggfunc="mean",
            )
            missing = [m for m in model_names if m not in pivot.columns]
            if missing:
                log.warning(
                    "compute_stratified_bms: models %s missing — cannot build "
                    "ELPD matrix for this stratum",
                    missing,
                )
                return None
            pivot = pivot[model_names].dropna()
            if len(pivot) == 0:
                return None
            return pivot.to_numpy(dtype=float)

        mat = _build_matrix(fit_df)
        if mat is not None:
            results["all"] = run_group_bms(mat, model_names, group_label="all")
        else:
            log.warning("compute_stratified_bms: could not build pooled ELPD matrix")

        for phenotype_name in sorted(fit_df[phenotype_col].unique()):
            sub = fit_df[fit_df[phenotype_col] == phenotype_name]
            mat = _build_matrix(sub)
            if mat is None:
                log.warning(
                    "compute_stratified_bms: could not build ELPD matrix for "
                    "phenotype=%s", phenotype_name,
                )
                continue
            n = len(mat)
            if n < 20:
                log.warning(
                    "compute_stratified_bms: per-phenotype BMS with N=%d has "
                    "limited power (exploratory) for phenotype=%s",
                    n, phenotype_name,
                )
            results[phenotype_name] = run_group_bms(
                mat, model_names, group_label=phenotype_name,
            )

        return results
    ```

    Add `compute_stratified_bms` to `__all__` at line 44.
  </action>
  <verify>
    Run: `python -c "from prl_hgf.analysis.bms import compute_stratified_bms; import pandas as pd, numpy as np; df = pd.DataFrame({'participant_id': ['P0','P0','P1','P1']*2, 'phenotype': ['healthy']*4 + ['anxious']*4, 'model': ['hgf_2level_patrl','hgf_3level_patrl']*4, 'elpd_waic': np.random.randn(8)}); res = compute_stratified_bms(df, ['hgf_2level_patrl','hgf_3level_patrl']); print(list(res.keys()))"` — prints `['all', 'anxious', 'healthy']` (or similar).
  </verify>
  <done>
    - compute_stratified_bms function exists and is exported in __all__
    - Docstring follows numpy conventions with Parameters, Returns, Raises, Notes, References
    - Phenotype stratification works; missing column errors are clear
    - Low-N warnings fire
    - Decision 109 parallel-stack invariant preserved (run_stratified_bms unchanged)
  </done>
</task>

<task type="auto">
  <name>Task 3: Implement export_peb_covariates in bms.py</name>
  <files>src/prl_hgf/analysis/bms.py</files>
  <action>
    Append `export_peb_covariates` to `src/prl_hgf/analysis/bms.py`:

    ```python
    def export_peb_covariates(
        fit_df_2level: pd.DataFrame,
        fit_df_3level: pd.DataFrame,
        output_path: Path,
        phenotype_col: str = "phenotype",
        evidence_col: str = "elpd_waic",
    ) -> pd.DataFrame:
        """Export per-subject Δ-evidence covariates for downstream PEB regression.

        Computes per-subject ``delta_waic`` = elpd_waic(3level) − elpd_waic(2level)
        and ``delta_f`` (approximated as delta_waic under the WAIC ≈ −2·F
        relationship — see Notes).

        Parameters
        ----------
        fit_df_2level : pandas.DataFrame
            WAIC output for the 2-level PAT-RL model. Must have columns
            ``participant_id``, ``<phenotype_col>``, ``<evidence_col>``.
            Typically ``compute_batch_waic_patrl(model_names=['hgf_2level_patrl'])``.
        fit_df_3level : pandas.DataFrame
            Same schema for the 3-level model.
        output_path : pathlib.Path
            Destination CSV. Parent directory is created if missing.
        phenotype_col : str, default "phenotype"
            Column name to propagate into the output CSV.
        evidence_col : str, default "elpd_waic"
            Per-subject model evidence column.

        Returns
        -------
        pandas.DataFrame
            Columns: ``participant_id``, ``<phenotype_col>``, ``delta_waic``,
            ``delta_f``. One row per participant. Also written to
            ``output_path`` as CSV.

        Raises
        ------
        ValueError
            If required columns missing or participant_id sets do not align.

        Notes
        -----
        ``delta_f`` is the variational free-energy difference F_3level - F_2level.
        Under the WAIC ≈ −2·log-evidence approximation (Gelman et al. 2014),
        ``delta_f ≈ delta_waic / 2`` with an unknown additive constant (which
        cancels in per-subject differences). For PEB regression the exact
        constant is immaterial; this function exports
        ``delta_f = delta_waic`` with a docstring note — consumers should
        interpret it as an unscaled free-energy proxy. RESEARCH.md §12 Risk 6
        flags that the exact sign convention for PEB is
        downstream-consumer-dependent; if the consumer flips sign, post-
        process the CSV.

        References
        ----------
        Friston & Stephan 2007. "Free energy and the brain." Synthese 159.
        Rigoux et al. 2014. "Bayesian model selection for group studies —
        revisited." Neuroimage 84.
        """
        required = {"participant_id", phenotype_col, evidence_col}
        for name, df in [("fit_df_2level", fit_df_2level), ("fit_df_3level", fit_df_3level)]:
            missing = required - set(df.columns)
            if missing:
                raise ValueError(
                    f"export_peb_covariates: {name} missing columns {sorted(missing)}"
                )

        df2 = (fit_df_2level[["participant_id", phenotype_col, evidence_col]]
               .rename(columns={evidence_col: f"{evidence_col}_2level"}))
        df3 = (fit_df_3level[["participant_id", phenotype_col, evidence_col]]
               .rename(columns={evidence_col: f"{evidence_col}_3level"}))

        merged = df2.merge(df3, on=["participant_id", phenotype_col], how="inner")
        if len(merged) == 0:
            raise ValueError(
                "export_peb_covariates: no participants in common between "
                "fit_df_2level and fit_df_3level (check participant_id + "
                f"{phenotype_col} alignment)"
            )

        merged["delta_waic"] = (
            merged[f"{evidence_col}_3level"] - merged[f"{evidence_col}_2level"]
        )
        # delta_f placeholder: equals delta_waic (see Notes in docstring).
        merged["delta_f"] = merged["delta_waic"]

        out = merged[["participant_id", phenotype_col, "delta_waic", "delta_f"]].copy()

        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        out.to_csv(output_path, index=False)
        log.info(
            "export_peb_covariates: wrote %d rows to %s (phenotypes: %s)",
            len(out), output_path,
            sorted(out[phenotype_col].unique()),
        )
        return out
    ```

    Add `export_peb_covariates` to `__all__`.
  </action>
  <verify>
    Run (from tmpfs): `python -c "
import pandas as pd, numpy as np
from pathlib import Path
import tempfile
from prl_hgf.analysis.bms import export_peb_covariates
df2 = pd.DataFrame({'participant_id': ['P0','P1','P2'], 'phenotype':['healthy','anxious','anxious'], 'elpd_waic':[-100,-110,-120]})
df3 = pd.DataFrame({'participant_id': ['P0','P1','P2'], 'phenotype':['healthy','anxious','anxious'], 'elpd_waic':[-95,-108,-118]})
with tempfile.NamedTemporaryFile(suffix='.csv', delete=False) as f:
    path = Path(f.name)
out = export_peb_covariates(df2, df3, path)
assert set(out.columns) == {'participant_id','phenotype','delta_waic','delta_f'}
assert out.loc[out.participant_id=='P0','delta_waic'].iloc[0] == 5.0
print('OK')
"`
  </verify>
  <done>
    - export_peb_covariates function exists and is exported in __all__
    - Writes CSV with columns participant_id, phenotype, delta_waic, delta_f
    - Aligns on participant_id + phenotype via inner join
    - Raises ValueError on missing columns or empty intersection
    - Docstring explains the delta_f WAIC-≈-−2·F approximation
  </done>
</task>

<task type="auto">
  <name>Task 4: Tests for compute_batch_waic_patrl + compute_stratified_bms + export_peb_covariates</name>
  <files>tests/test_bms.py</files>
  <action>
    Add tests to `tests/test_bms.py`:

    **compute_batch_waic_patrl (Task 1) tests:**

    1. `test_compute_batch_waic_patrl_propagates_phenotype` — 3-agent synthetic sim_df + idata dict; assert output fit_df has `phenotype` column with correct values per participant_id.

    2. `test_compute_batch_waic_patrl_unknown_pid_sentinel` — idata_dict contains a pid not in sim_df; assert output row has `phenotype=='unknown'` (not a crash).

    3. `test_compute_batch_waic_patrl_handles_model_failure` — one participant's WAIC raises an exception; assert other participants still produce rows; log captured via caplog.

    **compute_stratified_bms (Task 2) tests:**

    4. `test_compute_stratified_bms_returns_all_plus_per_phenotype` — build fit_df with 10 participants × 2 phenotypes × 2 models; assert result keys are `{"all", "healthy", "anxious"}`.

    5. `test_compute_stratified_bms_missing_column_raises` — pass fit_df without `phenotype` column; assert ValueError lists missing column.

    6. `test_compute_stratified_bms_missing_model_raises` — pass fit_df without `hgf_3level_patrl` row; assert ValueError.

    7. `test_compute_stratified_bms_low_n_warning_fires` — build fit_df with 3 participants in one phenotype; assert a warning (captured via `caplog`) mentions "exploratory".

    8. `test_compute_stratified_bms_preserves_run_stratified_bms` — regression: run the original `run_stratified_bms` on group-based fixture; assert result identical to pre-Phase-20 expected (snapshot or direct comparison).

    **export_peb_covariates (Task 3) tests:**

    9. `test_export_peb_covariates_csv_columns` — write CSV to tmp path; read back; assert columns `{'participant_id', 'phenotype', 'delta_waic', 'delta_f'}` and delta_waic equals manual computation.

    10. `test_export_peb_covariates_inner_join_alignment` — df3 has an extra participant not in df2; assert the extra is dropped via inner join; assert warning or info logs this.

    11. `test_export_peb_covariates_empty_intersection_raises` — df3 has NO shared participants with df2; assert ValueError.

    12. `test_export_peb_covariates_creates_parent_dir` — output_path with nonexistent parent; assert parent is created.

    Follow existing test conventions: `class TestPhase20StratifiedBMS:` or add to existing classes. Absolute imports; numpy docstrings.
  </action>
  <verify>
    Run: `pytest tests/test_bms.py -v`. All existing + 12 new tests pass.
  </verify>
  <done>
    - 12 new tests pass (3 for compute_batch_waic_patrl + 5 for compute_stratified_bms + 4 for export_peb_covariates)
    - Existing Phase 1 pick_best_cue BMS tests still pass (regression)
    - Coverage of error paths + warning paths
  </done>
</task>

</tasks>

<verification>
  - `pytest tests/test_bms.py -v` — all pass
  - `python -c "from prl_hgf.analysis.bms import compute_batch_waic_patrl, compute_subject_waic_patrl, compute_stratified_bms, export_peb_covariates, run_group_bms, run_stratified_bms; print('six imports OK')"`
  - `ruff check src/prl_hgf/analysis/bms.py tests/test_bms.py` — clean
  - `mypy src/prl_hgf/analysis/bms.py` — clean
  - Regression check on pick_best_cue (Phase 1 callers): `pytest tests/ -v -k "bms"` — no regressions on run_stratified_bms
</verification>

<success_criteria>
  - SC6 complete: compute_batch_waic_patrl + compute_stratified_bms + export_peb_covariates all landed, tested, and documented
  - Canonical "phenotype" column used consistently (per PHENOTYPE_COLUMN_NAME from Plan 20-01)
  - Producer (compute_batch_waic_patrl) and consumers (compute_stratified_bms, export_peb_covariates) co-located in this plan — H3 producer/consumer inversion closed
  - Decision 109 parallel-stack invariant preserved — run_stratified_bms (group-based) unchanged
  - delta_f sign convention documented (flagged per RESEARCH.md §12 Risk 6 for consumer-side post-processing)
  - Ready for Plan 20-07 scripts/06_group_analysis.py to call compute_batch_waic_patrl + compute_stratified_bms
</success_criteria>

<output>
Create `.planning/phases/20-patrl-scientific-completion/20-06-SUMMARY.md` with: (a) final signatures of compute_batch_waic_patrl, compute_subject_waic_patrl, compute_stratified_bms, and export_peb_covariates, (b) delta_f caveat for sister-repo PEB consumer, (c) confirmation that the phenotype-column producer/consumer chain is entirely within this plan (H3 resolution), (d) hand-off list for Plan 20-07 (which now consumes but does not produce the WAIC bridge).
</output>
