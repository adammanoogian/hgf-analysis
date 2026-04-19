"""Bayesian model comparison module for the PRL HGF pipeline.

Provides post-hoc WAIC computation for pm.Potential models (which do NOT
populate the log_likelihood group in InferenceData automatically), a
random-effects group BMS wrapper via the groupBMC package (Rigoux et al.
2014), and exceedance probability visualization.

Key challenge
-------------
PyMC models built with ``pm.Potential`` do not fill the ``log_likelihood``
group of ``az.InferenceData`` during sampling.  WAIC therefore cannot be
computed directly via ``az.waic``.  Instead, we re-evaluate the JAX JIT-
compiled logp function over all posterior samples and inject the resulting
array into a new ``log_likelihood`` group before calling ``az.waic``.

groupBMC API notes
------------------
``GroupBMC(L)`` expects ``L`` with shape ``(n_models, n_subjects)`` — the
TRANSPOSE of the ``(n_subjects, n_models)`` matrix used internally here.
``GroupBMCResult`` exposes:

* ``exceedance_probability``       — xp
* ``protected_exceedance_probability`` — pxp
* ``frequency_mean``               — exp_r (expected model frequencies)
* ``frequency_var``
* ``attribution``                  — per-subject posterior responsibility
"""

from __future__ import annotations

import logging
from pathlib import Path

import arviz as az
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import xarray as xr
from groupBMC.groupBMC import GroupBMC

__all__ = [
    "compute_subject_waic",
    "compute_batch_waic",
    "run_group_bms",
    "run_stratified_bms",
    "plot_exceedance_probabilities",
    # PAT-RL additions (Plans 20-06)
    "compute_subject_waic_patrl",
    "compute_batch_waic_patrl",
    "compute_stratified_bms",
    "export_peb_covariates",
]

log = logging.getLogger(__name__)

# ---- model names accepted by compute_subject_waic -------------------------
_MODEL_2LEVEL = "hgf_2level"
_MODEL_3LEVEL = "hgf_3level"


# ---------------------------------------------------------------------------
# WAIC computation (post-hoc, bypasses pm.Potential limitation)
# ---------------------------------------------------------------------------


def compute_subject_waic(
    input_data_arr: np.ndarray,
    observed_arr: np.ndarray,
    choices_arr: np.ndarray,
    idata: az.InferenceData,
    model_name: str,
) -> float:
    """Compute WAIC for one participant by re-evaluating the JAX logp.

    Because ``pm.Potential`` does not populate the ``log_likelihood`` group
    in ``az.InferenceData``, WAIC must be computed post-hoc by calling the
    JAX JIT-compiled logp function over every posterior sample.

    Parameters
    ----------
    input_data_arr : numpy.ndarray, shape (n_trials, 3)
        Float reward-value array.  ``input_data_arr[t, k]`` is the reward on
        trial ``t`` if cue ``k`` was chosen, else ``0.0``.
    observed_arr : numpy.ndarray, shape (n_trials, 3) int
        Binary mask: ``1`` when cue ``k`` was chosen on trial ``t``.
    choices_arr : numpy.ndarray, shape (n_trials,) int
        Chosen cue index ``(0, 1, or 2)`` for each trial.
    idata : az.InferenceData
        InferenceData object with ``posterior`` group from MCMC sampling.
    model_name : str
        ``"hgf_2level"`` or ``"hgf_3level"``.

    Returns
    -------
    float
        ``elpd_waic`` (Expected Log Predictive Density); higher is better.

    Notes
    -----
    Runtime budget: for 4 chains x 1000 draws the loop runs 4 000 times per
    participant.  Each call is JAX JIT-compiled after the first evaluation, so
    typical throughput is ~1 000–5 000 evaluations/second.  A progress log
    line is printed every 500 evaluations.
    """
    from prl_hgf.fitting.ops import build_logp_ops_2level, build_logp_ops_3level

    if model_name == _MODEL_2LEVEL:
        logp_op, _ = build_logp_ops_2level(
            input_data_arr, observed_arr, choices_arr
        )
    elif model_name == _MODEL_3LEVEL:
        logp_op, _ = build_logp_ops_3level(
            input_data_arr, observed_arr, choices_arr
        )
    else:
        raise ValueError(
            f"model_name must be {_MODEL_2LEVEL!r} or {_MODEL_3LEVEL!r},"
            f" got {model_name!r}"
        )

    posterior = idata.posterior
    n_chains = posterior.sizes["chain"]
    n_draws = posterior.sizes["draw"]

    # Collect per-sample log-likelihood values into (n_chains, n_draws) array
    loglike_vals = np.empty((n_chains, n_draws), dtype=float)
    total = n_chains * n_draws
    count = 0

    for chain_idx in range(n_chains):
        for draw_idx in range(n_draws):
            if model_name == _MODEL_2LEVEL:
                o2 = float(posterior["omega_2"].values[chain_idx, draw_idx])
                b = float(posterior["beta"].values[chain_idx, draw_idx])
                z = float(posterior["zeta"].values[chain_idx, draw_idx])
                lp = float(logp_op(o2, b, z).eval())
            else:
                o2 = float(posterior["omega_2"].values[chain_idx, draw_idx])
                o3 = float(posterior["omega_3"].values[chain_idx, draw_idx])
                k = float(posterior["kappa"].values[chain_idx, draw_idx])
                b = float(posterior["beta"].values[chain_idx, draw_idx])
                z = float(posterior["zeta"].values[chain_idx, draw_idx])
                lp = float(logp_op(o2, o3, k, b, z).eval())

            loglike_vals[chain_idx, draw_idx] = lp
            count += 1
            if count % 500 == 0:
                log.info(
                    "compute_subject_waic [%s]: %d / %d evaluations",
                    model_name,
                    count,
                    total,
                )

    # Build xarray DataArray and inject into a copy of idata
    ll_da = xr.DataArray(
        loglike_vals[:, :, np.newaxis],
        dims=["chain", "draw", "loglike_dim_0"],
        coords={
            "chain": posterior.coords["chain"].values,
            "draw": posterior.coords["draw"].values,
        },
    )

    # Add log_likelihood group (mutates idata in-place)
    idata.add_groups({"log_likelihood": {"loglike": ll_da}})

    waic_result = az.waic(idata, var_name="loglike")
    return float(waic_result.elpd_waic)


def compute_batch_waic(
    sim_df: pd.DataFrame,
    idata_dict: dict[str, dict[tuple, az.InferenceData]],
    model_names: list[str] | None = None,
) -> pd.DataFrame:
    """Compute WAIC for all participants across models.

    Iterates over every ``(participant_id, group, session)`` combination and
    every model, reconstructs trial arrays from ``sim_df``, and calls
    :func:`compute_subject_waic`.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        Simulation DataFrame with columns ``participant_id``, ``group``,
        ``session``, ``input_data``, ``observed``, ``choice``.  One row per
        trial.
    idata_dict : dict[str, dict[tuple, az.InferenceData]]
        Nested mapping: ``idata_dict[model_name][(pid, group, session)]``.
        Must contain pre-loaded InferenceData objects for every participant.
    model_names : list[str] or None
        Models to compare.  Defaults to ``["hgf_2level", "hgf_3level"]``.

    Returns
    -------
    pandas.DataFrame
        Columns: ``participant_id``, ``group``, ``session``, ``model``,
        ``elpd_waic``.

    Notes
    -----
    ``sim_df`` must have columns ``reward_c0``, ``reward_c1``, ``reward_c2``
    (float) for ``input_data_arr``, ``observed_c0``, ``observed_c1``,
    ``observed_c2`` (int) for ``observed_arr``, and ``choice`` (int) for
    ``choices_arr``.  These column names are produced by the batch simulation
    script.

    If a fit was flagged (convergence failure) or ``idata`` is missing, the
    row is skipped and a warning is logged.
    """
    if model_names is None:
        model_names = [_MODEL_2LEVEL, _MODEL_3LEVEL]

    keys = (
        sim_df[["participant_id", "group", "session"]]
        .drop_duplicates()
        .itertuples(index=False, name=None)
    )

    rows: list[dict] = []
    for pid, grp, sess in keys:
        mask = (
            (sim_df["participant_id"] == pid)
            & (sim_df["group"] == grp)
            & (sim_df["session"] == sess)
        )
        sub = sim_df.loc[mask].sort_values("trial").reset_index(drop=True)

        # Reconstruct trial-level arrays
        input_data_arr = sub[["reward_c0", "reward_c1", "reward_c2"]].to_numpy(
            dtype=float
        )
        observed_arr = sub[
            ["observed_c0", "observed_c1", "observed_c2"]
        ].to_numpy(dtype=int)
        choices_arr = sub["choice"].to_numpy(dtype=int)

        for model in model_names:
            idata_map = idata_dict.get(model, {})
            idata = idata_map.get((pid, grp, sess))
            if idata is None:
                log.warning(
                    "No idata for participant=%s group=%s session=%s model=%s"
                    " — skipping",
                    pid,
                    grp,
                    sess,
                    model,
                )
                continue

            try:
                elpd = compute_subject_waic(
                    input_data_arr, observed_arr, choices_arr, idata, model
                )
                rows.append(
                    {
                        "participant_id": pid,
                        "group": grp,
                        "session": sess,
                        "model": model,
                        "elpd_waic": elpd,
                    }
                )
            except Exception:
                log.exception(
                    "WAIC failed for participant=%s group=%s session=%s"
                    " model=%s",
                    pid,
                    grp,
                    sess,
                    model,
                )

    return pd.DataFrame(
        rows,
        columns=["participant_id", "group", "session", "model", "elpd_waic"],
    )


# ---------------------------------------------------------------------------
# Group BMS
# ---------------------------------------------------------------------------


def run_group_bms(
    elpd_matrix: np.ndarray,
    model_names: list[str],
    group_label: str = "all",
) -> dict:
    """Run random-effects Bayesian model selection using groupBMC.

    Parameters
    ----------
    elpd_matrix : numpy.ndarray, shape (n_subjects, n_models)
        Per-subject model evidence (elpd_waic).  Higher values indicate better
        model fit.
    model_names : list[str]
        Model name for each column of ``elpd_matrix``.
    group_label : str
        Label for this BMS run (used in plots and return dict).

    Returns
    -------
    dict
        Keys:

        ``alpha`` — Dirichlet posterior sufficient statistics (shape n_models).
        ``exp_r`` — Expected model frequencies (posterior Dirichlet mean).
        ``xp``    — Exceedance probabilities.
        ``pxp``   — Protected exceedance probabilities.
        ``bor``   — Bayesian Omnibus Risk.
        ``model_names`` — Echoed input.
        ``group_label`` — Echoed input.
        ``n_subjects`` — Number of subjects in this BMS run.

    Notes
    -----
    ``GroupBMC`` expects ``L`` with shape ``(n_models, n_subjects)`` so the
    matrix is transposed before passing.  The ``bor`` value is derived from
    the free-energy difference ``F1 - F0`` inside ``GroupBMC`` and is not
    directly exposed on ``GroupBMCResult``; we therefore compute it from the
    ``protected_exceedance_probability`` relationship::

        pxp = (1 - bor) * xp + bor / n_models
        => bor = (pxp - xp) / (1/n_models - xp)  [element-wise, averaged]

    In practice, we extract ``bor`` by calling ``get_result`` and checking
    the ``bor`` attribute directly since the package computes it internally.
    """
    assert (
        elpd_matrix.ndim == 2 and elpd_matrix.shape[1] == len(model_names)
    ), (
        f"elpd_matrix must be (n_subjects, n_models={len(model_names)}),"
        f" got {elpd_matrix.shape}"
    )

    n_subjects, n_models = elpd_matrix.shape

    # GroupBMC expects (n_models, n_subjects)
    L = elpd_matrix.T

    bmc = GroupBMC(L)
    result = bmc.get_result()

    # Extract bor from GroupBMC internal calculation
    from math import exp as _exp

    bor = float(1 / (1 + _exp(bmc.F1() - bmc.F0())))

    xp = np.asarray(result.exceedance_probability)
    pxp = np.asarray(result.protected_exceedance_probability)
    exp_r = np.asarray(result.frequency_mean)
    alpha = np.asarray(result.attribution.sum(axis=1)) + 1.0  # α_0=1 prior

    return {
        "alpha": alpha,
        "exp_r": exp_r,
        "xp": xp,
        "pxp": pxp,
        "bor": bor,
        "model_names": list(model_names),
        "group_label": group_label,
        "n_subjects": n_subjects,
    }


def run_stratified_bms(
    waic_df: pd.DataFrame,
    model_names: list[str],
) -> dict[str, dict]:
    """Run BMS for the full sample and per group.

    Parameters
    ----------
    waic_df : pandas.DataFrame
        Output of :func:`compute_batch_waic`.  Must have columns
        ``participant_id``, ``group``, ``session``, ``model``,
        ``elpd_waic``.
    model_names : list[str]
        Model names to include.  Order determines column order in the ELPD
        matrix.

    Returns
    -------
    dict[str, dict]
        Keys: ``"all"`` plus each unique value in ``waic_df["group"]``.
        Values: dicts returned by :func:`run_group_bms`.

    Notes
    -----
    The ELPD matrix for each BMS run is built by averaging ``elpd_waic``
    across sessions for each ``(participant_id, model)`` pair, then pivoting
    to ``(n_subjects, n_models)``.

    Per-group BMS with fewer than ~20 subjects has limited statistical power
    and should be treated as exploratory.
    """
    results: dict[str, dict] = {}

    def _build_matrix(df: pd.DataFrame) -> np.ndarray | None:
        """Average across sessions then pivot to (subjects, models)."""
        avg = (
            df.groupby(["participant_id", "model"])["elpd_waic"]
            .mean()
            .reset_index()
        )
        pivot = avg.pivot(
            index="participant_id", columns="model", values="elpd_waic"
        )
        # Ensure column order matches model_names
        missing = [m for m in model_names if m not in pivot.columns]
        if missing:
            log.warning(
                "Models %s missing from waic_df — cannot build ELPD matrix",
                missing,
            )
            return None
        pivot = pivot[model_names].dropna()
        if len(pivot) == 0:
            return None
        return pivot.to_numpy(dtype=float)

    # Full sample
    mat = _build_matrix(waic_df)
    if mat is not None:
        results["all"] = run_group_bms(mat, model_names, group_label="all")
    else:
        log.warning("Could not build ELPD matrix for full sample BMS")

    # Per group
    for grp in sorted(waic_df["group"].unique()):
        sub = waic_df[waic_df["group"] == grp]
        mat = _build_matrix(sub)
        if mat is None:
            log.warning("Could not build ELPD matrix for group=%s", grp)
            continue
        n = len(mat)
        if n < 20:
            log.warning(
                "Per-group BMS with N=%d subjects has limited power"
                " (exploratory) for group=%s",
                n,
                grp,
            )
        results[grp] = run_group_bms(mat, model_names, group_label=grp)

    return results


# ---------------------------------------------------------------------------
# Exceedance probability bar plot
# ---------------------------------------------------------------------------


def plot_exceedance_probabilities(
    bms_results: dict[str, dict],
    save_path: Path | None = None,
) -> plt.Figure:
    """Plot exceedance probabilities (EP) and protected EP for all groups.

    Parameters
    ----------
    bms_results : dict[str, dict]
        Output of :func:`run_stratified_bms` or a subset thereof.  Each value
        is a dict with keys ``xp``, ``pxp``, ``model_names``, ``n_subjects``,
        ``bor``, ``group_label``.
    save_path : Path or None
        If provided, figure is saved as PNG at 150 dpi.

    Returns
    -------
    matplotlib.figure.Figure
        Multi-panel figure (one subplot per group label).
    """
    group_labels = list(bms_results.keys())
    n_panels = len(group_labels)
    fig, axes = plt.subplots(
        1,
        n_panels,
        figsize=(4 * n_panels, 4),
        squeeze=False,
    )
    axes = axes[0]  # squeeze the row dimension

    bar_width = 0.35

    for ax, label in zip(axes, group_labels, strict=True):
        res = bms_results[label]
        xp = np.asarray(res["xp"])
        pxp = np.asarray(res["pxp"])
        model_names = res["model_names"]
        n_subjects = res["n_subjects"]
        bor = res["bor"]
        n_models = len(model_names)

        x = np.arange(n_models)

        ax.bar(
            x - bar_width / 2,
            xp,
            width=bar_width,
            label="EP",
            color="#4C72B0",
            alpha=0.85,
        )
        ax.bar(
            x + bar_width / 2,
            pxp,
            width=bar_width,
            label="Protected EP",
            color="#DD8452",
            alpha=0.85,
        )

        # Chance level
        ax.axhline(
            1 / n_models,
            color="grey",
            linestyle="--",
            linewidth=1.2,
            label=f"Chance (1/{n_models})",
        )

        ax.set_xticks(x)
        ax.set_xticklabels(model_names, rotation=15, ha="right", fontsize=9)
        ax.set_ylim(0, 1.05)
        ax.set_ylabel("Probability")
        ax.set_title(
            f"{label}\n(N={n_subjects})",
            fontsize=10,
        )

        # Annotate BOR below bars
        ax.text(
            0.5,
            -0.22,
            f"BOR = {bor:.3f}",
            ha="center",
            va="top",
            transform=ax.transAxes,
            fontsize=8,
            color="dimgrey",
        )

        ax.legend(fontsize=7)

    fig.suptitle("Exceedance Probabilities — Bayesian Model Comparison", y=1.02)
    fig.tight_layout()

    if save_path is not None:
        save_path = Path(save_path)
        save_path.parent.mkdir(parents=True, exist_ok=True)
        fig.savefig(save_path, dpi=150, bbox_inches="tight")
        log.info("Saved EP figure to %s", save_path)

    return fig


# ---------------------------------------------------------------------------
# PAT-RL WAIC bridge (Plan 20-06, Task 1)
# ---------------------------------------------------------------------------


def compute_subject_waic_patrl(
    sim_df_sub: pd.DataFrame,
    idata: az.InferenceData,
    model_name: str,
) -> float:
    """Compute WAIC for one PAT-RL participant.

    If *idata* already has a ``log_likelihood`` group (e.g. produced by a
    future fit path that populates it during sampling), ``az.waic`` is called
    directly.  Otherwise the PAT-RL JAX logp factory is re-evaluated over
    every posterior draw and the result is injected into a copy of *idata*
    before calling ``az.waic`` — mirroring the post-hoc pattern in
    :func:`compute_subject_waic` for the pick_best_cue path.

    Parameters
    ----------
    sim_df_sub : pandas.DataFrame
        Trial-level rows for a single participant.  Must contain ``state``,
        ``choice``, ``reward_mag``, ``shock_mag``, ``delta_hr``,
        ``trial_idx``, ``outcome_time_s``.
    idata : az.InferenceData
        InferenceData with a ``posterior`` group.  Pseudo-draws from
        ``build_idata_from_laplace`` (Plan 19-02) are accepted.
    model_name : {"hgf_2level_patrl", "hgf_3level_patrl"}
        PAT-RL HGF variant.

    Returns
    -------
    float
        ``elpd_waic`` (Expected Log Predictive Density); higher is better.

    Notes
    -----
    When re-evaluating the logp, this function builds a *single-participant*
    batched logp function (P=1) via
    :func:`~prl_hgf.fitting.hierarchical_patrl.build_logp_fn_batched_patrl`
    then iterates over ``(chain, draw)`` pairs.  The per-draw logp is a scalar
    joint log-likelihood (not per-trial), so the injected ``log_likelihood``
    DataArray has shape ``(n_chains, n_draws, 1)`` — ArviZ treats the trailing
    dimension as the observation index.  For WAIC this is equivalent to
    computing WAIC on the marginalised (joint) log-likelihood per draw, which
    is standard for non-decomposable logp implementations.
    """
    import copy

    # Fast path: log_likelihood already populated.
    if hasattr(idata, "log_likelihood") and idata.log_likelihood is not None:
        return float(az.waic(idata).elpd_waic)

    # Slow path: re-evaluate JAX logp per posterior draw.
    from prl_hgf.fitting.hierarchical_patrl import (
        _build_session_scanner_patrl,
        _make_single_logp_fn,
    )

    sub = sim_df_sub.sort_values("trial_idx").reset_index(drop=True)
    n_trials = len(sub)

    state_1d = sub["state"].to_numpy(dtype=np.float64).reshape(1, n_trials)
    choices_1d = sub["choice"].to_numpy(dtype=np.float64).reshape(1, n_trials)
    reward_1d = sub["reward_mag"].to_numpy(dtype=np.float64).reshape(1, n_trials)
    shock_1d = sub["shock_mag"].to_numpy(dtype=np.float64).reshape(1, n_trials)
    delta_hr_1d = sub["delta_hr"].to_numpy(dtype=np.float64).reshape(1, n_trials)
    mask_1d = np.ones((1, n_trials), dtype=np.float64)

    base_attrs, scan_fn, belief_idx = _build_session_scanner_patrl(model_name)

    import jax.numpy as jnp

    single_logp = _make_single_logp_fn(
        base_attrs, scan_fn, belief_idx, model_name, n_trials,
        response_model="model_a",
        delta_hr_jnp=jnp.asarray(delta_hr_1d[0]),
    )

    posterior = idata.posterior
    n_chains = posterior.sizes["chain"]
    n_draws = posterior.sizes["draw"]

    loglike_vals = np.empty((n_chains, n_draws), dtype=float)

    param_names = list(posterior.data_vars)

    for chain_idx in range(n_chains):
        for draw_idx in range(n_draws):
            params: dict[str, float] = {}
            for pname in param_names:
                val = float(posterior[pname].values[chain_idx, draw_idx])
                if pname == "log_beta":
                    params["beta"] = float(np.exp(val))
                else:
                    params[pname] = val
            lp = float(
                single_logp(
                    params,
                    jnp.asarray(state_1d[0]),
                    jnp.asarray(choices_1d[0]),
                    jnp.asarray(reward_1d[0]),
                    jnp.asarray(shock_1d[0]),
                    jnp.asarray(mask_1d[0]),
                    jnp.asarray(delta_hr_1d[0]),
                )
            )
            loglike_vals[chain_idx, draw_idx] = lp

    ll_da = xr.DataArray(
        loglike_vals[:, :, np.newaxis],
        dims=["chain", "draw", "loglike_dim_0"],
        coords={
            "chain": posterior.coords["chain"].values,
            "draw": posterior.coords["draw"].values,
        },
    )

    idata_copy = copy.deepcopy(idata)
    idata_copy.add_groups({"log_likelihood": {"loglike": ll_da}})
    return float(az.waic(idata_copy, var_name="loglike").elpd_waic)


def compute_batch_waic_patrl(
    sim_df: pd.DataFrame,
    idata_dict: dict[str, dict[str, az.InferenceData]],
    model_names: list[str] | None = None,
    phenotype_col: str = "phenotype",
) -> pd.DataFrame:
    """Compute per-participant WAIC across PAT-RL models, propagating phenotype.

    PAT-RL variant of :func:`compute_batch_waic`.  Keys on ``participant_id``
    only (no group/session dimension) and propagates the ``phenotype`` column
    from *sim_df* into the output — this is the bridge from Plan 20-04
    (simulator phenotype tagging) to Plan 20-06 (:func:`compute_stratified_bms`).

    Parameters
    ----------
    sim_df : pandas.DataFrame
        Trial-level data from
        :func:`~prl_hgf.env.pat_rl_simulator.simulate_patrl_cohort`.
        Must have ``participant_id`` and ``phenotype`` columns plus PAT-RL
        trial columns (``state``, ``choice``, ``reward_mag``, ``shock_mag``,
        ``delta_hr``).
    idata_dict : dict[str, dict[str, az.InferenceData]]
        Nested mapping ``idata_dict[model_name][participant_id]``.  Inner
        keys are string participant identifiers.
    model_names : list[str] or None
        Defaults to ``['hgf_2level_patrl', 'hgf_3level_patrl']``.
    phenotype_col : str, default "phenotype"
        Column in *sim_df* that carries the phenotype label.  Use the
        canonical ``PHENOTYPE_COLUMN_NAME`` constant from
        :mod:`prl_hgf.env.pat_rl_config`.

    Returns
    -------
    pandas.DataFrame
        Columns: ``participant_id``, ``phenotype``, ``model``,
        ``elpd_waic``.  One row per ``(participant_id, model)`` pair.

    Raises
    ------
    ValueError
        If ``phenotype_col`` is absent from *sim_df*.

    Notes
    -----
    Participants in *idata_dict* that are absent from *sim_df* receive
    ``phenotype='unknown'`` rather than raising an error, so that partial
    sim_df slices (e.g. a single-session subset) do not abort the full batch.

    Per-participant WAIC failures (logp errors, shape mismatches) are caught,
    logged at ERROR level, and skipped so that the remainder of the batch
    completes.

    References
    ----------
    Watanabe 2010. "Asymptotic equivalence of Bayes cross validation and
    widely applicable information criterion."
    """
    if phenotype_col not in sim_df.columns:
        raise ValueError(
            f"compute_batch_waic_patrl: sim_df is missing the '{phenotype_col}' "
            "column.  Add phenotype labels via simulate_patrl_cohort (Plan 20-04) "
            "or supply a DataFrame that includes the phenotype column produced by "
            "that function.  Expected column name controlled by "
            "prl_hgf.env.pat_rl_config.PHENOTYPE_COLUMN_NAME."
        )

    if model_names is None:
        model_names = ["hgf_2level_patrl", "hgf_3level_patrl"]

    # Build participant_id → phenotype lookup from sim_df.
    id_to_phen: dict[str, str] = (
        sim_df[["participant_id", phenotype_col]]
        .drop_duplicates("participant_id")
        .set_index("participant_id")[phenotype_col]
        .to_dict()
    )

    rows: list[dict] = []
    for model in model_names:
        idata_map = idata_dict.get(model, {})
        for pid, idata in idata_map.items():
            pid_str = str(pid)
            sim_sub = sim_df[sim_df["participant_id"] == pid_str]
            try:
                elpd = compute_subject_waic_patrl(
                    sim_sub.reset_index(drop=True),
                    idata,
                    model,
                )
            except Exception:
                log.exception(
                    "compute_batch_waic_patrl: WAIC failed for "
                    "participant=%s model=%s — skipping",
                    pid_str,
                    model,
                )
                continue
            rows.append(
                {
                    "participant_id": pid_str,
                    phenotype_col: id_to_phen.get(pid_str, "unknown"),
                    "model": model,
                    "elpd_waic": elpd,
                }
            )

    return pd.DataFrame(
        rows,
        columns=["participant_id", phenotype_col, "model", "elpd_waic"],
    )


# ---------------------------------------------------------------------------
# PAT-RL phenotype-stratified BMS (Plan 20-06, Task 2)
# ---------------------------------------------------------------------------


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
        ``model``, ``<evidence_col>``.  One row per
        ``(participant_id, model)`` pair.  Typical source is
        :func:`compute_batch_waic_patrl` with the ``phenotype`` column
        already propagated from sim_df (Plan 20-04).
    model_names : list[str]
        Model names to include; determines column order in the per-subject
        ELPD matrix.  For Phase 20 typically
        ``["hgf_2level_patrl", "hgf_3level_patrl"]``.
    phenotype_col : str, default "phenotype"
        Column name for stratification.  Use the canonical
        ``PHENOTYPE_COLUMN_NAME`` constant from
        :mod:`prl_hgf.env.pat_rl_config`.
    evidence_col : str, default "elpd_waic"
        Column containing per-subject model evidence (higher = better).

    Returns
    -------
    dict[str, dict]
        Keys: ``"all"`` (pooled BMS across all phenotypes) plus every
        unique value in ``fit_df[phenotype_col]``.  Values: dicts from
        :func:`run_group_bms` with keys ``alpha``, ``exp_r``, ``xp``,
        ``pxp``, ``bor``, ``model_names``, ``group_label``,
        ``n_subjects``.

    Raises
    ------
    ValueError
        If required columns are missing or *model_names* is not a subset
        of ``fit_df['model'].unique()``.

    Notes
    -----
    Per-phenotype BMS with fewer than ~20 subjects has limited statistical
    power — the function still runs but logs a warning (mirrors
    :func:`run_stratified_bms` behaviour).

    Parallel-stack invariant (Decision 109): this function coexists with
    :func:`run_stratified_bms`; neither delegates to the other.  Both call
    :func:`run_group_bms` internally.

    References
    ----------
    Rigoux et al. 2014. "Bayesian model selection for group studies —
    revisited." NeuroImage 84: 971-985.
    """
    required_cols = {"participant_id", phenotype_col, "model", evidence_col}
    missing_cols = required_cols - set(fit_df.columns)
    if missing_cols:
        raise ValueError(
            f"compute_stratified_bms: fit_df missing columns "
            f"{sorted(missing_cols)}; got columns {sorted(fit_df.columns)}"
        )

    available_models = set(fit_df["model"].unique())
    missing_models = set(model_names) - available_models
    if missing_models:
        raise ValueError(
            f"compute_stratified_bms: model_names {sorted(missing_models)} "
            f"not found in fit_df['model'].unique()={sorted(available_models)}"
        )

    def _build_matrix(df: pd.DataFrame) -> np.ndarray | None:
        """Pivot to (n_subjects, n_models); return None if any model missing."""
        pivot = df.pivot_table(
            index="participant_id",
            columns="model",
            values=evidence_col,
            aggfunc="mean",
        )
        missing = [m for m in model_names if m not in pivot.columns]
        if missing:
            log.warning(
                "compute_stratified_bms: models %s missing from stratum — "
                "cannot build ELPD matrix",
                missing,
            )
            return None
        pivot = pivot[model_names].dropna()
        if len(pivot) == 0:
            return None
        return pivot.to_numpy(dtype=float)

    results: dict[str, dict] = {}

    # Pooled BMS across all phenotypes.
    mat = _build_matrix(fit_df)
    if mat is not None:
        results["all"] = run_group_bms(mat, model_names, group_label="all")
    else:
        log.warning(
            "compute_stratified_bms: could not build pooled ELPD matrix"
        )

    # Per-phenotype BMS.
    for phen in sorted(fit_df[phenotype_col].unique()):
        sub = fit_df[fit_df[phenotype_col] == phen]
        mat = _build_matrix(sub)
        if mat is None:
            log.warning(
                "compute_stratified_bms: could not build ELPD matrix for "
                "phenotype=%s",
                phen,
            )
            continue
        n = len(mat)
        if n < 20:
            log.warning(
                "compute_stratified_bms: per-phenotype BMS with N=%d has "
                "limited power (exploratory) for phenotype=%s",
                n,
                phen,
            )
        results[phen] = run_group_bms(mat, model_names, group_label=phen)

    return results


# ---------------------------------------------------------------------------
# PEB covariate export (Plan 20-06, Task 3)
# ---------------------------------------------------------------------------


def export_peb_covariates(
    fit_df_2level: pd.DataFrame,
    fit_df_3level: pd.DataFrame,
    output_path: Path,
    phenotype_col: str = "phenotype",
    evidence_col: str = "elpd_waic",
) -> pd.DataFrame:
    """Export per-subject delta-evidence covariates for downstream PEB regression.

    Computes per-subject ``delta_waic`` = elpd_waic(3-level) -
    elpd_waic(2-level) and ``delta_f`` (approximated as ``delta_waic`` under
    the WAIC ≈ -2·log-evidence relationship — see Notes).

    Parameters
    ----------
    fit_df_2level : pandas.DataFrame
        WAIC output for the 2-level PAT-RL model.  Must have columns
        ``participant_id``, ``<phenotype_col>``, ``<evidence_col>``.
        Typically produced by
        ``compute_batch_waic_patrl(model_names=['hgf_2level_patrl'])``.
    fit_df_3level : pandas.DataFrame
        Same schema for the 3-level model.
    output_path : pathlib.Path
        Destination CSV.  Parent directory is created if missing.
    phenotype_col : str, default "phenotype"
        Column name to propagate into the output CSV.
    evidence_col : str, default "elpd_waic"
        Per-subject model evidence column.

    Returns
    -------
    pandas.DataFrame
        Columns: ``participant_id``, ``<phenotype_col>``, ``delta_waic``,
        ``delta_f``.  One row per participant.  Also written to
        *output_path* as CSV.

    Raises
    ------
    ValueError
        If required columns are missing or the participant_id sets of the
        two DataFrames have no intersection.

    Notes
    -----
    ``delta_f`` is an unscaled free-energy proxy.  Under the approximation
    WAIC ≈ -2·log-evidence (Gelman et al. 2014), the log-evidence ratio
    F_3level - F_2level ≈ delta_waic / 2 up to an unknown additive constant.
    That constant cancels in per-subject contrasts used in PEB regression,
    so this function exports ``delta_f = delta_waic`` (unscaled) and flags it
    for the consumer to rescale if the downstream PEB implementation applies
    a specific normalisation.  RESEARCH.md §12 Risk 6 notes that the exact
    sign convention is downstream-consumer-dependent; if the PEB consumer
    expects F_2level - F_3level, negate the ``delta_f`` column in the CSV
    post-hoc.

    References
    ----------
    Friston & Stephan 2007. "Free energy and the brain." Synthese 159.
    Rigoux et al. 2014. "Bayesian model selection for group studies —
    revisited." NeuroImage 84.
    """
    required = {"participant_id", phenotype_col, evidence_col}
    for name, df in [
        ("fit_df_2level", fit_df_2level),
        ("fit_df_3level", fit_df_3level),
    ]:
        missing = required - set(df.columns)
        if missing:
            raise ValueError(
                f"export_peb_covariates: {name} missing columns "
                f"{sorted(missing)}"
            )

    df2 = fit_df_2level[["participant_id", phenotype_col, evidence_col]].rename(
        columns={evidence_col: f"{evidence_col}_2level"}
    )
    df3 = fit_df_3level[["participant_id", phenotype_col, evidence_col]].rename(
        columns={evidence_col: f"{evidence_col}_3level"}
    )

    merged = df2.merge(df3, on=["participant_id", phenotype_col], how="inner")
    if len(merged) == 0:
        raise ValueError(
            "export_peb_covariates: no participants in common between "
            "fit_df_2level and fit_df_3level (check participant_id + "
            f"'{phenotype_col}' alignment)"
        )

    merged["delta_waic"] = (
        merged[f"{evidence_col}_3level"] - merged[f"{evidence_col}_2level"]
    )
    # delta_f: unscaled proxy for free-energy difference (see Notes).
    merged["delta_f"] = merged["delta_waic"]

    out = merged[["participant_id", phenotype_col, "delta_waic", "delta_f"]].copy()

    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    out.to_csv(output_path, index=False)
    log.info(
        "export_peb_covariates: wrote %d rows to %s (phenotypes: %s)",
        len(out),
        output_path,
        sorted(out[phenotype_col].unique()),
    )
    return out
