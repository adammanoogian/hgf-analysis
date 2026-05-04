"""Phase-stratified learning metrics for PRL analysis.

Computes trial-level behavioral proxies for learning rate (win-stay and
lose-shift rates) aggregated by task phase (stable vs volatile).  These
model-free metrics are the standard approach in the PRL literature when
the HGF is fitted at the session level and per-trial belief trajectories
are not stored.

Phase stratification is exploratory (not primary).  Primary hypotheses
focus on omega_2 and kappa at the session level.
"""

from __future__ import annotations

import pandas as pd

_REQUIRED_COLUMNS: tuple[str, ...] = (
    "participant_id",
    "group",
    "session",
    "trial",
    "cue_chosen",
    "reward",
    "phase_label",
)


def compute_phase_learning_metrics(
    sim_df: pd.DataFrame,
) -> pd.DataFrame:
    """Compute win-stay and lose-shift rates per participant-session-phase.

    Win-stay rate is the proportion of trials on which a participant repeats
    the same cue choice after that cue was rewarded on the previous trial.
    Lose-shift rate is the proportion of trials on which a participant
    switches cue after the chosen cue was not rewarded on the previous trial.

    Both metrics use the phase_label column to stratify trials into stable
    and volatile phases.  The first trial of each (participant_id, session)
    group is excluded because it has no predecessor.

    Parameters
    ----------
    sim_df : pd.DataFrame
        Trial-level simulation (or real) data.  Required columns:
        participant_id, group, session, trial, cue_chosen, reward,
        phase_label.

    Returns
    -------
    pd.DataFrame
        One row per (participant_id, group, session, phase_label) with
        columns: participant_id, group, session, phase_label,
        win_stay_rate, lose_shift_rate, n_trials.

    Examples
    --------
    >>> import pandas as pd
    >>> df = pd.DataFrame(
    ...     {
    ...         "participant_id": ["P1"] * 4,
    ...         "group": ["ctrl"] * 4,
    ...         "session": ["s1"] * 4,
    ...         "trial": [0, 1, 2, 3],
    ...         "cue_chosen": [0, 0, 1, 0],
    ...         "reward": [1, 1, 0, 1],
    ...         "phase_label": ["stable"] * 4,
    ...     }
    ... )
    >>> compute_phase_learning_metrics(df)
    """
    working = sim_df.sort_values(["participant_id", "session", "trial"]).copy()

    # Compute lagged choice and reward within each (participant_id, session)
    grp = working.groupby(["participant_id", "session"], sort=False)
    working["prev_choice"] = grp["cue_chosen"].shift(1)
    working["prev_reward"] = grp["reward"].shift(1)

    # Drop first trial of each participant-session (no predecessor)
    working = working.dropna(subset=["prev_choice", "prev_reward"]).copy()

    # Cast to int so comparisons are unambiguous
    working["prev_choice"] = working["prev_choice"].astype(int)
    working["prev_reward"] = working["prev_reward"].astype(int)

    # Win-stay indicator: was rewarded last trial AND repeated same cue
    working["_win_stay"] = (working["prev_reward"] == 1) & (
        working["cue_chosen"] == working["prev_choice"]
    )
    # Lose-shift indicator: was not rewarded last trial AND switched cue
    working["_lose_shift"] = (working["prev_reward"] == 0) & (
        working["cue_chosen"] != working["prev_choice"]
    )

    # Mask: only include trials preceded by a win (for win-stay denominator)
    working["_prev_win"] = working["prev_reward"] == 1
    # Mask: only include trials preceded by a loss (for lose-shift denominator)
    working["_prev_loss"] = working["prev_reward"] == 0

    def _rates(g: pd.DataFrame) -> pd.Series:
        n_trials = len(g)
        n_prev_win = g["_prev_win"].sum()
        n_prev_loss = g["_prev_loss"].sum()

        win_stay_rate = (
            g.loc[g["_prev_win"], "_win_stay"].mean()
            if n_prev_win > 0
            else float("nan")
        )
        lose_shift_rate = (
            g.loc[g["_prev_loss"], "_lose_shift"].mean()
            if n_prev_loss > 0
            else float("nan")
        )
        return pd.Series(
            {
                "win_stay_rate": float(win_stay_rate),
                "lose_shift_rate": float(lose_shift_rate),
                "n_trials": int(n_trials),
            }
        )

    result = (
        working.groupby(
            ["participant_id", "group", "session", "phase_label"],
            sort=False,
        )
        .apply(_rates, include_groups=False)
        .reset_index()
    )

    # Canonical column order
    result = result[
        [
            "participant_id",
            "group",
            "session",
            "phase_label",
            "win_stay_rate",
            "lose_shift_rate",
            "n_trials",
        ]
    ].reset_index(drop=True)

    return result


def build_phase_stratified_df(
    sim_df: pd.DataFrame,
) -> pd.DataFrame:
    """Build a DataFrame suitable for group x phase mixed-effects analysis.

    Validates that all required columns are present, then delegates to
    :func:`compute_phase_learning_metrics`.

    Parameters
    ----------
    sim_df : pd.DataFrame
        Trial-level simulation (or real) data.  Required columns:
        participant_id, group, session, trial, cue_chosen, reward,
        phase_label.

    Returns
    -------
    pd.DataFrame
        Columns: participant_id, group, session, phase_label,
        win_stay_rate, lose_shift_rate, n_trials.  One row per
        (participant_id, group, session, phase_label) combination.

    Raises
    ------
    ValueError
        If any required column is absent from *sim_df*.

    Examples
    --------
    >>> import pandas as pd
    >>> df = pd.DataFrame(
    ...     {
    ...         "participant_id": ["P1"] * 6,
    ...         "group": ["ctrl"] * 6,
    ...         "session": ["s1"] * 6,
    ...         "trial": list(range(6)),
    ...         "cue_chosen": [0, 0, 1, 0, 1, 0],
    ...         "reward": [1, 1, 0, 1, 0, 1],
    ...         "phase_label": ["stable"] * 3 + ["volatile"] * 3,
    ...     }
    ... )
    >>> build_phase_stratified_df(df)
    """
    missing = [c for c in _REQUIRED_COLUMNS if c not in sim_df.columns]
    if missing:
        raise ValueError(
            f"sim_df is missing required columns: {missing}. "
            f"Expected: {list(_REQUIRED_COLUMNS)}. "
            f"Got: {list(sim_df.columns)}"
        )

    return compute_phase_learning_metrics(sim_df)
