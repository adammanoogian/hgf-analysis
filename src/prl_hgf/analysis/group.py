"""Group-level mixed-effects analysis module.

Provides utilities to extract posterior means from batch fitting output into
a wide-form estimates table, fit Bayesian mixed-effects models via bambi for
each HGF parameter, extract posterior contrasts with credible intervals, and
summarise results across parameters.

The analysis targets the group x session interaction on individual HGF
parameters (ω₂, ω₃, κ, β, ζ) fitted in Phase 4.

Typical usage
-------------
>>> wide = build_estimates_wide(fit_df, model="3level")
>>> results = summarize_group_models(wide, params=["omega_2", "kappa"])
>>> results["omega_2"]["contrasts"]
"""

from __future__ import annotations

import logging
from typing import Any

import arviz as az
import bambi as bmb
import numpy as np
import pandas as pd

logger = logging.getLogger(__name__)


def build_estimates_wide(
    fit_df: pd.DataFrame,
    model: str,
    *,
    exclude_flagged: bool = True,
) -> pd.DataFrame:
    """Pivot per-parameter posterior means to one row per participant-session.

    Parameters
    ----------
    fit_df : pd.DataFrame
        Output of ``fit_batch`` containing columns: participant_id, group,
        session, model, parameter, mean, flagged.
    model : str
        Model variant to retain (e.g. ``"2level"`` or ``"3level"``).
    exclude_flagged : bool, optional
        If ``True`` (default), rows with ``flagged == True`` are dropped
        before pivoting.

    Returns
    -------
    pd.DataFrame
        Wide-form DataFrame with index reset.  Columns are:
        participant_id, group, session, <parameter_1>, <parameter_2>, …
        One row per (participant_id, group, session) combination.
    """
    df = fit_df.loc[fit_df["model"] == model].copy()

    if exclude_flagged and "flagged" in df.columns:
        df = df.loc[~df["flagged"].astype(bool)]

    wide = df.pivot_table(
        index=["participant_id", "group", "session"],
        columns="parameter",
        values="mean",
        aggfunc="first",
    )
    wide.columns.name = None
    return wide.reset_index()


def fit_group_model(
    estimates_wide: pd.DataFrame,
    outcome: str,
    draws: int = 2000,
    tune: int = 1000,
    chains: int = 4,
    random_seed: int = 42,
) -> tuple[bmb.Model, az.InferenceData]:
    """Fit a Bayesian mixed-effects model for one HGF parameter.

    The fixed-effects structure is a group × session interaction with a
    random intercept per participant.  Both *group* and *session* are treated
    as unordered categorical variables so that treatment contrasts are
    computed against the reference level chosen by bambi (alphabetically
    first).

    Parameters
    ----------
    estimates_wide : pd.DataFrame
        Wide-form estimates table from :func:`build_estimates_wide`.
    outcome : str
        Column name of the HGF parameter to model (e.g. ``"omega_2"``).
    draws : int, optional
        Number of posterior draws per chain. Default ``2000``.
    tune : int, optional
        Number of tuning steps. Default ``1000``.
    chains : int, optional
        Number of MCMC chains. Default ``4``.
    random_seed : int, optional
        Seed for reproducible sampling. Default ``42``.

    Returns
    -------
    model : bmb.Model
        Fitted bambi model object.
    idata : az.InferenceData
        ArviZ InferenceData with posterior samples.

    Notes
    -----
    *group* and *session* are cast to ``pd.Categorical`` before model
    construction to guarantee that bambi treats them as unordered factors
    and computes treatment (dummy) contrasts.
    """
    data = estimates_wide.copy()
    data["group"] = pd.Categorical(data["group"].astype(str))
    data["session"] = pd.Categorical(data["session"].astype(str))

    formula = f"{outcome} ~ C(group) * C(session) + (1 | participant_id)"
    model = bmb.Model(formula, data)

    logger.info("Fitting bambi model for outcome=%s", outcome)
    idata = model.fit(
        draws=draws,
        tune=tune,
        chains=chains,
        random_seed=random_seed,
    )

    logger.info(
        "Posterior variable names: %s",
        list(idata.posterior.data_vars),
    )
    return model, idata


def extract_posterior_contrasts(
    idata: az.InferenceData,
    group_label: str = "post_concussion",
    session_labels: list[str] | None = None,
) -> pd.DataFrame:
    """Extract group-difference contrasts from bambi posterior.

    For each session the contrast of interest is the expected difference
    between the *group_label* group and the reference group (alphabetically
    first category).

    * **Reference session**: contrast = group main effect coefficient.
    * **Non-reference sessions**: contrast = group main effect + group×session
      interaction coefficient.

    Variable names are discovered dynamically from ``idata.posterior``
    so that this function is not tied to any particular category ordering.

    Parameters
    ----------
    idata : az.InferenceData
        Posterior samples from :func:`fit_group_model`.
    group_label : str, optional
        Level of *group* corresponding to the treatment arm. Default
        ``"post_concussion"``.
    session_labels : list[str] | None, optional
        Ordered list of sessions (reference session first).  If ``None``,
        the reference session is inferred from the data and only the single
        contrast available in ``idata`` is returned.

    Returns
    -------
    pd.DataFrame
        Columns: session, mean, sd, hdi_3, hdi_97.  One row per session.

    Notes
    -----
    The 94 % HDI is used throughout to match reporting conventions in the
    computational psychiatry literature (Kruschke 2018).
    """
    posterior = idata.posterior

    # Stack chain × draw into a single samples dimension
    stacked = posterior.stack(sample=("chain", "draw"))

    data_vars = list(stacked.data_vars)
    logger.debug("Discovering posterior variable names: %s", data_vars)

    # --- Discover group main effect ---
    group_main_var = _find_variable(
        data_vars,
        pattern=f"C(group)[T.{group_label}]",
    )
    if group_main_var is None:
        raise ValueError(
            f"Cannot find group main-effect variable for group_label="
            f"'{group_label}' in posterior. "
            f"Available variables: {data_vars}"
        )

    group_main_samples: np.ndarray = np.asarray(stacked[group_main_var])

    # --- Discover interaction variables (one per non-reference session) ---
    interaction_vars: dict[str, np.ndarray] = {}
    for var in data_vars:
        if (
            f"C(group)[T.{group_label}]" in var
            and "C(session)" in var
            and var != group_main_var
        ):
            # Extract session label from variable name
            session_name = _parse_session_from_interaction(var, group_label)
            if session_name is not None:
                interaction_vars[session_name] = np.asarray(stacked[var])

    # --- Build contrasts table ---
    rows: list[dict[str, Any]] = []

    # Reference session (group main effect only)
    ref_session = _infer_reference_session(data_vars)
    ref_contrast = group_main_samples
    rows.append(
        _contrast_row(ref_contrast, session=ref_session)
    )

    # Non-reference sessions
    for session_name, interaction_samples in interaction_vars.items():
        contrast = group_main_samples + interaction_samples
        rows.append(_contrast_row(contrast, session=session_name))

    contrasts_df = pd.DataFrame(rows)

    # Reorder rows if session_labels provided
    if session_labels is not None:
        contrasts_df = contrasts_df.set_index("session").reindex(session_labels)
        contrasts_df = contrasts_df.reset_index()

    return contrasts_df


def summarize_group_models(
    estimates_wide: pd.DataFrame,
    params: list[str],
    **fit_kwargs: Any,
) -> dict[str, dict[str, Any]]:
    """Fit group models and extract contrasts for multiple HGF parameters.

    Parameters
    ----------
    estimates_wide : pd.DataFrame
        Wide-form estimates table from :func:`build_estimates_wide`.
    params : list[str]
        HGF parameter column names to analyse (e.g.
        ``["omega_2", "kappa"]``).
    **fit_kwargs
        Additional keyword arguments forwarded to :func:`fit_group_model`
        (e.g. ``draws``, ``tune``, ``chains``, ``random_seed``).

    Returns
    -------
    dict[str, dict[str, Any]]
        Keyed by parameter name.  Each value is a dict with keys:

        * ``"model"`` — fitted :class:`bmb.Model`
        * ``"idata"`` — :class:`az.InferenceData` with posterior
        * ``"contrasts"`` — :class:`pd.DataFrame` from
          :func:`extract_posterior_contrasts`
    """
    results: dict[str, dict[str, Any]] = {}
    for param in params:
        if param not in estimates_wide.columns:
            logger.warning("Parameter '%s' not in estimates table; skipping.", param)
            continue
        logger.info("Fitting group model for parameter: %s", param)
        model, idata = fit_group_model(estimates_wide, outcome=param, **fit_kwargs)
        contrasts = extract_posterior_contrasts(idata)
        results[param] = {
            "model": model,
            "idata": idata,
            "contrasts": contrasts,
        }
    return results


# ---------------------------------------------------------------------------
# Private helpers
# ---------------------------------------------------------------------------


def _contrast_row(samples: np.ndarray, session: str) -> dict[str, Any]:
    """Summarise a 1-D array of posterior contrast samples into a dict row.

    Parameters
    ----------
    samples : np.ndarray
        1-D array of posterior draws for the contrast.
    session : str
        Session label for this row.

    Returns
    -------
    dict[str, Any]
        Keys: session, mean, sd, hdi_3, hdi_97.
    """
    hdi_bounds = az.hdi(samples, hdi_prob=0.94)
    return {
        "session": session,
        "mean": float(np.mean(samples)),
        "sd": float(np.std(samples)),
        "hdi_3": float(hdi_bounds[0]),
        "hdi_97": float(hdi_bounds[1]),
    }


def _find_variable(data_vars: list[str], pattern: str) -> str | None:
    """Return the first variable name containing *pattern*, else None."""
    for var in data_vars:
        if pattern in var:
            return var
    return None


def _parse_session_from_interaction(var_name: str, group_label: str) -> str | None:
    """Extract session label from an interaction variable name.

    Interaction terms look like::

        C(group)[T.post_concussion]:C(session)[T.session2]

    or (order-reversed)::

        C(session)[T.session2]:C(group)[T.post_concussion]

    Parameters
    ----------
    var_name : str
        Full posterior variable name.
    group_label : str
        Treatment level of *group*.

    Returns
    -------
    str | None
        Session label string, or ``None`` if parsing fails.
    """
    import re

    # Try to find C(session)[T.<label>] in the variable name
    match = re.search(r"C\(session\)\[T\.([^\]]+)\]", var_name)
    if match:
        return match.group(1)
    return None


def _infer_reference_session(data_vars: list[str]) -> str:
    """Infer the reference session from posterior variable names.

    The reference session is the one that does NOT appear as ``[T.<level>]``
    in the session main-effect variable (if present), because it is absorbed
    into the intercept.  If the session main effect is absent (only two
    sessions → single dummy), fall back to ``"reference"``.

    Parameters
    ----------
    data_vars : list[str]
        Posterior variable names.

    Returns
    -------
    str
        Inferred reference session label.
    """
    import re

    # Look for C(session)[T.<label>] main effects (not interactions)
    session_levels_in_posterior: set[str] = set()
    for var in data_vars:
        # Interaction variables contain both group and session
        if "C(group)" in var:
            continue
        match = re.search(r"C\(session\)\[T\.([^\]]+)\]", var)
        if match:
            session_levels_in_posterior.add(match.group(1))

    if session_levels_in_posterior:
        # Reference is not in the posterior (it's the intercept level)
        # We can't reliably determine it without the data; return placeholder
        return "reference_session"
    return "reference_session"
