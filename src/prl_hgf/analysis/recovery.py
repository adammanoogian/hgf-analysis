"""Parameter recovery analysis for the PRL HGF pipeline.

Provides functions to join true (simulated) parameters with fitted posterior
means, compute per-parameter recovery metrics, and compute the cross-parameter
correlation matrix.

Typical usage
-------------
>>> recovery_df = build_recovery_df(sim_df, fit_df)
>>> metrics_df = compute_recovery_metrics(recovery_df)
>>> corr_df = compute_correlation_matrix(recovery_df)
"""

from __future__ import annotations

import logging

import numpy as np
import pandas as pd
from scipy import stats

__all__ = [
    "build_recovery_df",
    "compute_recovery_metrics",
    "compute_correlation_matrix",
    "compute_recovery_metrics_patrl",
]

log = logging.getLogger(__name__)

# Columns in sim_df that carry ground-truth parameter values
_TRUE_COLS: list[str] = [
    "true_omega_2",
    "true_omega_3",
    "true_kappa",
    "true_beta",
    "true_zeta",
]

# Default mapping from fitted column name → true column name
_DEFAULT_PARAM_MAP: dict[str, str] = {
    "omega_2": "true_omega_2",
    "omega_3": "true_omega_3",
    "kappa": "true_kappa",
    "beta": "true_beta",
    "zeta": "true_zeta",
}

_ID_COLS: list[str] = ["participant_id", "group", "session"]


# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------


def build_recovery_df(
    sim_df: pd.DataFrame,
    fit_df: pd.DataFrame,
    exclude_flagged: bool = True,
    min_n: int = 30,
) -> pd.DataFrame:
    """Join true parameters from sim_df with fitted posterior means from fit_df.

    The function performs three operations:

    1. Reduces ``sim_df`` to one row per (participant_id, group, session) by
       taking the first value of each ``true_*`` column within each group
       (all trials for a participant-session share the same true parameters).
    2. Optionally removes flagged fits from ``fit_df``.
    3. Pivots ``fit_df`` to wide form so each parameter becomes a column, then
       merges with the true-parameter rows.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        Trial-level simulation output from :func:`~prl_hgf.simulation.batch.simulate_batch`.
        Must contain ``participant_id``, ``group``, ``session``, and all
        ``true_*`` columns (``true_omega_2``, ``true_omega_3``, ``true_kappa``,
        ``true_beta``, ``true_zeta``).
    fit_df : pandas.DataFrame
        Long-form fitting output from :func:`~prl_hgf.fitting.batch.fit_batch`.
        Must contain ``participant_id``, ``group``, ``session``, ``parameter``,
        ``mean``, and ``flagged`` columns.
    exclude_flagged : bool, optional
        If True (default), rows where ``flagged == True`` in ``fit_df`` are
        removed before merging.  The number of excluded participants is logged
        at INFO level.
    min_n : int, optional
        Minimum number of rows required in the merged DataFrame.  Raises
        ``ValueError`` if fewer rows remain after exclusions.  Default is 30,
        which ensures adequate statistical power for correlation-based recovery
        metrics.  Pass ``min_n=0`` to disable the guard (useful for unit tests
        with small synthetic data).

    Returns
    -------
    pandas.DataFrame
        Wide-form DataFrame with one row per (participant_id, group, session).
        Columns include ``true_*`` columns and fitted-parameter columns
        (``omega_2``, ``omega_3``, etc., for whichever parameters are present
        in ``fit_df``).

    Raises
    ------
    ValueError
        If the inner merge produces zero rows (no participants in common), or
        if the number of remaining rows is below ``min_n``.
    """
    # Step 1 — reduce sim_df to one row per participant-session
    true_cols_present = [c for c in _TRUE_COLS if c in sim_df.columns]
    true_params = sim_df.groupby(_ID_COLS)[true_cols_present].first().reset_index()

    # Step 2 — optionally exclude flagged fits
    if exclude_flagged:
        n_total = fit_df["participant_id"].nunique()
        fit_clean = fit_df[fit_df["flagged"] == False].copy()  # noqa: E712
        n_after = fit_clean["participant_id"].nunique()
        n_excluded = n_total - n_after
        if n_excluded > 0:
            log.info(
                "Excluded %d participant(s) with flagged fits (%d remain).",
                n_excluded,
                n_after,
            )
    else:
        fit_clean = fit_df.copy()

    # Step 3 — pivot fit_df to wide form: one row per participant-session,
    # one column per parameter
    fitted_wide = fit_clean.pivot_table(
        index=_ID_COLS,
        columns="parameter",
        values="mean",
    )
    fitted_wide.columns.name = None  # drop MultiIndex level name
    fitted_wide = fitted_wide.reset_index()

    # Step 4 — merge true params with fitted wide form
    recovery_df = true_params.merge(fitted_wide, on=_ID_COLS, how="inner")

    if len(recovery_df) == 0:
        raise ValueError(
            "build_recovery_df: merge produced zero rows.  "
            "Check that participant_id/group/session values overlap between "
            "sim_df and fit_df."
        )

    # Step 5 — enforce minimum-N guard
    if len(recovery_df) < min_n:
        raise ValueError(
            f"Recovery requires at least {min_n} participants, got "
            f"{len(recovery_df)}.  Increase simulation batch size or reduce "
            "exclusions."
        )

    return recovery_df


def compute_recovery_metrics(
    recovery_df: pd.DataFrame,
    param_map: dict[str, str] | None = None,
) -> pd.DataFrame:
    """Compute per-parameter recovery metrics (r, p, bias, RMSE).

    For each parameter pair in ``param_map`` that is present in
    ``recovery_df``, computes Pearson correlation, bias (signed mean error),
    and root-mean-square error between the fitted posterior mean and the
    ground-truth value.

    NaN or infinite values in either the true or recovered array are masked
    before computing metrics.

    Parameters
    ----------
    recovery_df : pandas.DataFrame
        Output of :func:`build_recovery_df`.  Must contain both fitted columns
        (e.g. ``omega_2``) and true columns (e.g. ``true_omega_2``).
    param_map : dict[str, str] or None, optional
        Mapping from fitted-column name to true-column name.  Defaults to::

            {
                "omega_2": "true_omega_2",
                "omega_3": "true_omega_3",
                "kappa": "true_kappa",
                "beta": "true_beta",
                "zeta": "true_zeta",
            }

        Parameters absent from ``recovery_df`` are silently skipped.

    Returns
    -------
    pandas.DataFrame
        One row per parameter with columns:
        ``parameter``, ``r``, ``p``, ``bias``, ``rmse``, ``n``,
        ``passes_threshold``.

        ``passes_threshold`` is True when ``abs(r) >= 0.7`` (the
        ``analysis.recovery_r_threshold`` from config).
    """
    if param_map is None:
        param_map = _DEFAULT_PARAM_MAP

    R_THRESHOLD = 0.7

    rows: list[dict] = []
    for fitted_col, true_col in param_map.items():
        if fitted_col not in recovery_df.columns or true_col not in recovery_df.columns:
            continue

        recovered = recovery_df[fitted_col].to_numpy(dtype=float)
        true = recovery_df[true_col].to_numpy(dtype=float)

        # Mask NaN and Inf
        valid = np.isfinite(recovered) & np.isfinite(true)
        recovered_v = recovered[valid]
        true_v = true[valid]

        n = int(valid.sum())
        if n < 3:
            # Not enough data for a meaningful correlation
            log.warning(
                "Parameter '%s': only %d valid observations — skipping.",
                fitted_col,
                n,
            )
            continue

        r_val, p_val = stats.pearsonr(true_v, recovered_v)
        bias = float(np.mean(recovered_v - true_v))
        rmse = float(np.sqrt(np.mean((recovered_v - true_v) ** 2)))

        rows.append(
            {
                "parameter": fitted_col,
                "r": float(r_val),
                "p": float(p_val),
                "bias": bias,
                "rmse": rmse,
                "n": n,
                "passes_threshold": bool(abs(r_val) >= R_THRESHOLD),
            }
        )

    return pd.DataFrame(
        rows, columns=["parameter", "r", "p", "bias", "rmse", "n", "passes_threshold"]
    )


def compute_recovery_metrics_patrl(
    fit_df: pd.DataFrame,
    r_threshold: float = 0.7,
    primary_params: tuple[str, ...] = ("omega_2", "kappa", "beta"),
    exploratory_params: tuple[str, ...] = ("omega_3", "mu3_0"),
) -> pd.DataFrame:
    """PAT-RL parameter recovery metrics with exploratory labels.

    Computes Pearson r and signed bias for each parameter in
    ``primary_params`` and ``exploratory_params``.  Only primary parameters
    are gated against ``r_threshold``; exploratory parameters are reported
    but not gated (Decision 141, Phase 9-01 precedent — ω₃ recovery is
    known to be poor with binary data).

    Parameters
    ----------
    fit_df : pandas.DataFrame
        Long-format DataFrame with one row per (participant_id, param).
        Required columns: ``param``, ``true_value``, ``posterior_mean``.
    r_threshold : float, optional
        Pearson r threshold applied to ``primary_params``.  Default 0.7
        (PRL-V1 gate criterion).
    primary_params : tuple of str, optional
        Parameters gated by ``r_threshold``.  Default
        ``("omega_2", "kappa", "beta")``.
    exploratory_params : tuple of str, optional
        Parameters reported but not gated.  Default ``("omega_3", "mu3_0")``.
        These receive ``exploratory=True`` and ``passes_threshold=pd.NA``.

    Returns
    -------
    pandas.DataFrame
        Columns: ``param``, ``pearson_r``, ``bias``, ``passes_threshold``,
        ``exploratory``.  One row per parameter.

        * ``passes_threshold`` is True/False for primary parameters.
        * ``passes_threshold`` is ``pd.NA`` for exploratory parameters.
        * ``exploratory`` is False for primary parameters, True for
          exploratory parameters.
    """
    from scipy.stats import pearsonr  # local import; scipy always available

    rows: list[dict] = []
    all_params = list(primary_params) + list(exploratory_params)

    for p in all_params:
        sub = fit_df[fit_df["param"] == p]
        is_exploratory = p in exploratory_params

        if len(sub) < 3:
            log.warning(
                "compute_recovery_metrics_patrl: param '%s' has only %d rows "
                "(need >= 3 for Pearson r) — returning NaN.",
                p,
                len(sub),
            )
            rows.append(
                {
                    "param": p,
                    "pearson_r": float("nan"),
                    "bias": float("nan"),
                    "passes_threshold": pd.NA if is_exploratory else False,
                    "exploratory": is_exploratory,
                }
            )
            continue

        true_vals = sub["true_value"].to_numpy(dtype=float)
        post_means = sub["posterior_mean"].to_numpy(dtype=float)

        # Mask NaN / Inf before computing metrics
        valid = np.isfinite(true_vals) & np.isfinite(post_means)
        if valid.sum() < 3:
            log.warning(
                "compute_recovery_metrics_patrl: param '%s' has only %d finite "
                "pairs — returning NaN.",
                p,
                int(valid.sum()),
            )
            rows.append(
                {
                    "param": p,
                    "pearson_r": float("nan"),
                    "bias": float("nan"),
                    "passes_threshold": pd.NA if is_exploratory else False,
                    "exploratory": is_exploratory,
                }
            )
            continue

        r_val, _ = pearsonr(true_vals[valid], post_means[valid])
        bias = float((post_means[valid] - true_vals[valid]).mean())

        if is_exploratory:
            passes: bool | pd.NAType = pd.NA
        else:
            passes = bool(r_val >= r_threshold)

        rows.append(
            {
                "param": p,
                "pearson_r": float(r_val),
                "bias": bias,
                "passes_threshold": passes,
                "exploratory": is_exploratory,
            }
        )

    return pd.DataFrame(
        rows,
        columns=["param", "pearson_r", "bias", "passes_threshold", "exploratory"],
    )


def compute_correlation_matrix(
    recovery_df: pd.DataFrame,
    param_cols: list[str] | None = None,
) -> pd.DataFrame:
    """Compute the Pearson correlation matrix of fitted posterior means.

    This reveals inter-parameter confounds in the recovery: high off-diagonal
    correlations indicate that two parameters are not independently recoverable.

    Parameters
    ----------
    recovery_df : pandas.DataFrame
        Output of :func:`build_recovery_df`.  Fitted-parameter columns are
        expected to be named ``omega_2``, ``omega_3``, ``kappa``, ``beta``,
        ``zeta`` (those present in ``recovery_df`` are used).
    param_cols : list[str] or None, optional
        Explicit list of column names to include.  If None (default), uses
        whichever of ``["omega_2", "omega_3", "kappa", "beta", "zeta"]``
        are present in ``recovery_df``.

    Returns
    -------
    pandas.DataFrame
        Square correlation matrix indexed and columned by parameter name.
    """
    _ALL_PARAM_COLS = ["omega_2", "omega_3", "kappa", "beta", "zeta"]
    if param_cols is None:
        param_cols = [c for c in _ALL_PARAM_COLS if c in recovery_df.columns]

    return recovery_df[param_cols].corr(method="pearson")
