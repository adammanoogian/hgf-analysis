"""Frequentist effect size computation for group comparisons.

Provides Cohen's d and partial eta-squared for HGF parameter differences
between the psilocybin intervention groups across sessions.  These accompany
the Bayesian posterior contrasts produced by :mod:`prl_hgf.analysis.group`.

Also provides :func:`cohens_d` — a standalone pooled-SD Cohen's d helper
used by the PAT-RL PRL-V2 phenotype-separability gate (Plan 20-07).

Effect size conventions
-----------------------
* Cohen's d — standardised mean difference.
  Primary helper: ``pingouin.compute_effsize`` with ``eftype="cohen"``.
  Standalone helper: :func:`cohens_d` (pooled SD; no pingouin dep).
* Partial η² — estimated from Cohen's d via the relationship
  ``η² = d² / (d² + 4)`` for two independent groups (Cohen 1988).

Note: partial η² requires at least one df for error, so a minimum of two
observations per group is enforced.
"""

from __future__ import annotations

import logging

import numpy as np
import pandas as pd
import pingouin as pg

logger = logging.getLogger(__name__)

__all__ = [
    "cohens_d",
    "compute_cohens_d",
    "compute_effect_sizes_table",
]


def cohens_d(group_high: np.ndarray, group_low: np.ndarray) -> float:
    """Compute Cohen's d via pooled standard deviation.

    Standard two-sample Cohen's d (Cohen 1988):

    .. math::

        d = \\frac{\\bar{x}_\\text{high} - \\bar{x}_\\text{low}}{s_\\text{pooled}}

    where

    .. math::

        s_\\text{pooled} = \\sqrt{
            \\frac{(n_1 - 1)s_1^2 + (n_2 - 1)s_2^2}{n_1 + n_2 - 2}
        }

    Parameters
    ----------
    group_high : numpy.ndarray
        Values for the "high" condition (e.g. anxiety-high group).
    group_low : numpy.ndarray
        Values for the "low" condition (e.g. anxiety-low group).

    Returns
    -------
    float
        Cohen's d (signed; positive means group_high > group_low).

    Raises
    ------
    ValueError
        If either group has fewer than 2 observations.
    """
    a = np.asarray(group_high, dtype=float)
    b = np.asarray(group_low, dtype=float)

    na, nb = len(a), len(b)
    if na < 2:
        raise ValueError(
            f"cohens_d: group_high has {na} observations; need at least 2. "
            f"Expected at least 2, got {na}."
        )
    if nb < 2:
        raise ValueError(
            f"cohens_d: group_low has {nb} observations; need at least 2. "
            f"Expected at least 2, got {nb}."
        )

    pooled_var = ((na - 1) * a.var(ddof=1) + (nb - 1) * b.var(ddof=1)) / (na + nb - 2)
    pooled_sd = float(np.sqrt(pooled_var))

    if pooled_sd == 0.0:
        logger.warning(
            "cohens_d: pooled SD is zero (all values identical). Returning 0.0."
        )
        return 0.0

    return float((a.mean() - b.mean()) / pooled_sd)


def compute_cohens_d(
    estimates_wide: pd.DataFrame,
    outcome: str,
    session: str,
    group_a: str = "placebo",
    group_b: str = "psilocybin",
) -> float:
    """Compute Cohen's d for a single parameter × session comparison.

    Parameters
    ----------
    estimates_wide : pd.DataFrame
        Wide-form estimates from :func:`~prl_hgf.analysis.group.build_estimates_wide`.
    outcome : str
        Column name of the HGF parameter (e.g. ``"omega_2"``).
    session : str
        Session label (e.g. ``"baseline"``).
    group_a : str, optional
        Reference group label. Default ``"placebo"``.
    group_b : str, optional
        Treatment group label. Default ``"psilocybin"``.

    Returns
    -------
    float
        Cohen's d (signed; positive means group_b > group_a).

    Raises
    ------
    ValueError
        If fewer than 2 observations are available in either group for the
        specified session, or if the *outcome* column is missing.
    """
    if outcome not in estimates_wide.columns:
        raise ValueError(
            f"Outcome '{outcome}' not found in estimates_wide. "
            f"Available columns: {list(estimates_wide.columns)}"
        )

    mask_session = estimates_wide["session"] == session
    df_session = estimates_wide.loc[mask_session]

    vals_a = df_session.loc[df_session["group"] == group_a, outcome].dropna()
    vals_b = df_session.loc[df_session["group"] == group_b, outcome].dropna()

    if len(vals_a) < 2:
        raise ValueError(
            f"Group '{group_a}' has {len(vals_a)} observations for "
            f"outcome='{outcome}', session='{session}'. "
            f"Expected at least 2."
        )
    if len(vals_b) < 2:
        raise ValueError(
            f"Group '{group_b}' has {len(vals_b)} observations for "
            f"outcome='{outcome}', session='{session}'. "
            f"Expected at least 2."
        )

    d: float = pg.compute_effsize(
        vals_a.to_numpy(),
        vals_b.to_numpy(),
        paired=False,
        eftype="cohen",
    )
    return float(d)


def compute_effect_sizes_table(
    estimates_wide: pd.DataFrame,
    params: list[str],
    sessions: list[str],
) -> pd.DataFrame:
    """Build an effect-size table for all (parameter, session) combinations.

    Group labels are discovered dynamically from the ``group`` column of
    *estimates_wide*.  The first alphabetically is treated as the reference
    group (group_a) and the second as the treatment group (group_b).

    Parameters
    ----------
    estimates_wide : pd.DataFrame
        Wide-form estimates from :func:`~prl_hgf.analysis.group.build_estimates_wide`.
    params : list[str]
        HGF parameter column names to include (e.g.
        ``["omega_2", "kappa", "beta", "zeta"]``).
    sessions : list[str]
        Session labels to include (e.g.
        ``["baseline", "session2", "session3"]``).

    Returns
    -------
    pd.DataFrame
        Columns: parameter, session, cohen_d, partial_eta_sq,
        n_control, n_treatment.  One row per (parameter, session) pair.

    Notes
    -----
    * Rows where *cohen_d* cannot be computed (e.g. not enough observations)
      are filled with ``float("nan")`` and a warning is logged.
    * Partial η² follows the two-group formula:
      ``η² = d² / (d² + 4)`` (Cohen 1988, p. 22).
    """
    groups_in_data = sorted(estimates_wide["group"].dropna().unique().tolist())
    if len(groups_in_data) < 2:
        raise ValueError(
            f"Expected at least 2 groups in estimates_wide, found: {groups_in_data}"
        )
    group_a = groups_in_data[0]
    group_b = groups_in_data[1]

    logger.info(
        "Computing effect sizes: group_a=%s vs group_b=%s", group_a, group_b
    )

    rows = []
    for param in params:
        for session in sessions:
            mask_session = estimates_wide["session"] == session
            df_sess = estimates_wide.loc[mask_session]

            n_a = int(
                df_sess.loc[df_sess["group"] == group_a, param].notna().sum()
            )
            n_b = int(
                df_sess.loc[df_sess["group"] == group_b, param].notna().sum()
            )

            try:
                d = compute_cohens_d(
                    estimates_wide,
                    outcome=param,
                    session=session,
                    group_a=group_a,
                    group_b=group_b,
                )
                partial_eta_sq = d**2 / (d**2 + 4.0)
            except (ValueError, ZeroDivisionError) as exc:
                logger.warning(
                    "Could not compute Cohen's d for param=%s, session=%s: %s",
                    param,
                    session,
                    exc,
                )
                d = float("nan")
                partial_eta_sq = float("nan")

            rows.append(
                {
                    "parameter": param,
                    "session": session,
                    "cohen_d": d,
                    "partial_eta_sq": partial_eta_sq,
                    f"n_{group_a}": n_a,
                    f"n_{group_b}": n_b,
                }
            )

    return pd.DataFrame(rows)
