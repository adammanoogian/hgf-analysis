"""Frequentist effect size computation for group comparisons.

Provides Cohen's d and partial eta-squared for HGF parameter differences
between the psilocybin intervention groups across sessions.  These accompany
the Bayesian posterior contrasts produced by :mod:`prl_hgf.analysis.group`.

Effect size conventions
-----------------------
* Cohen's d — standardised mean difference (absolute value reported).
  Computed via ``pingouin.compute_effsize`` with ``eftype="cohen"``.
* Partial η² — estimated from Cohen's d via the relationship
  ``η² = d² / (d² + 4)`` for two independent groups (Cohen 1988).

Note: partial η² requires at least one df for error, so a minimum of two
observations per group is enforced.
"""

from __future__ import annotations

import logging

import pandas as pd
import pingouin as pg

logger = logging.getLogger(__name__)


def compute_cohens_d(
    estimates_wide: pd.DataFrame,
    outcome: str,
    session: str,
    group_a: str = "control",
    group_b: str = "post_concussion",
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
        Reference group label. Default ``"control"``.
    group_b : str, optional
        Treatment group label. Default ``"post_concussion"``.

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
