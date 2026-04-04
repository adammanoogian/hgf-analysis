"""Task environment simulator for the PRL pick_best_cue pipeline.

Generates trial-by-trial sequences for one session from a validated
:class:`~prl_hgf.env.task_config.AnalysisConfig`. All task structure
(phase names, trial counts, reward probabilities) is read exclusively from
config — nothing is hardcoded.

Session structure
-----------------
Each session consists of ``config.task.n_sets`` identical sets.  Within each
set, all phases (e.g. acquisition_1, reversal_1, acquisition_2, reversal_2)
are iterated in order, followed by a transfer phase.  For the default config::

    3 sets × (4 phases × 30 trials + 20 transfer trials) = 420 trials

The RNG is seeded once per call so that identical seeds yield identical trial
sequences (ENV-05 reproducibility requirement).
"""

from __future__ import annotations

from dataclasses import dataclass

import numpy as np

from prl_hgf.env.task_config import AnalysisConfig


@dataclass(frozen=True)
class Trial:
    """Immutable representation of a single PRL trial.

    Parameters
    ----------
    trial_idx : int
        Global 0-based trial index across the full session.
    set_idx : int
        Which set this trial belongs to (0-based).
    phase_name : str
        Phase identifier, e.g. ``"acquisition_1"`` or ``"transfer"``.
    phase_label : str
        Stability label: ``"stable"`` for acquisition / post-reversal /
        transfer phases; ``"volatile"`` for reversal phases.
    cue_probs : tuple[float, ...]
        Ground-truth reward probability for each cue on this trial.
        A tuple is used (not a list) for hashability and immutability.
    best_cue : int
        Index of the cue with the highest reward probability.
    """

    trial_idx: int
    set_idx: int
    phase_name: str
    phase_label: str
    cue_probs: tuple[float, ...]
    best_cue: int


def generate_reward(
    cue_chosen: int,
    cue_probs: tuple[float, ...],
    rng: np.random.Generator,
) -> int:
    """Generate a binary reward for the chosen cue.

    Parameters
    ----------
    cue_chosen : int
        Index of the cue selected by the agent.
    cue_probs : tuple[float, ...]
        Ground-truth reward probabilities for each cue.
    rng : numpy.random.Generator
        Seeded random number generator for stochastic reward sampling.

    Returns
    -------
    int
        1 if rewarded, 0 if not.
    """
    return int(rng.random() < cue_probs[cue_chosen])


def generate_session(config: AnalysisConfig, seed: int) -> list[Trial]:
    """Generate one complete session's trial sequence from config.

    Iterates over sets and phases to produce a fully ordered trial list.
    Each set contains all task phases followed by a transfer phase.

    The RNG is seeded for forward-compatibility: Phase 3 simulation will use
    ``generate_reward`` with the same RNG to produce stochastic outcomes.
    The trial *structure* (phase membership, cue probs, best_cue) is entirely
    deterministic from config — only reward outcomes are stochastic.

    Parameters
    ----------
    config : AnalysisConfig
        Validated analysis configuration (loaded via
        :func:`~prl_hgf.env.task_config.load_config`).
    seed : int
        Integer seed for :func:`numpy.random.default_rng`.  Using the same
        seed twice produces identical trial sequences (ENV-05).

    Returns
    -------
    list[Trial]
        Complete ordered list of :class:`Trial` objects for one session.
        Length equals ``config.task.n_trials_total``.

    Examples
    --------
    >>> from prl_hgf.env.task_config import load_config
    >>> from prl_hgf.env.simulator import generate_session
    >>> config = load_config()
    >>> trials = generate_session(config, seed=42)
    >>> len(trials)
    420
    >>> trials[0].phase_name
    'acquisition_1'
    >>> trials[0].phase_label
    'stable'
    """
    rng = np.random.default_rng(seed)
    trials: list[Trial] = []
    trial_idx = 0

    for set_idx in range(config.task.n_sets):
        # --- Main phases (acquisition + reversals) ---
        for phase in config.task.phases:
            probs = tuple(phase.cue_probs)
            best = int(np.argmax(phase.cue_probs))
            for _ in range(phase.n_trials):
                trials.append(
                    Trial(
                        trial_idx=trial_idx,
                        set_idx=set_idx,
                        phase_name=phase.name,
                        phase_label=phase.phase_label,
                        cue_probs=probs,
                        best_cue=best,
                    )
                )
                trial_idx += 1

        # --- Transfer phase ---
        transfer = config.task.transfer
        transfer_probs = tuple(transfer.cue_probs)
        transfer_best = int(np.argmax(transfer.cue_probs))
        for _ in range(transfer.n_trials):
            trials.append(
                Trial(
                    trial_idx=trial_idx,
                    set_idx=set_idx,
                    phase_name="transfer",
                    phase_label=transfer.phase_label,
                    cue_probs=transfer_probs,
                    best_cue=transfer_best,
                )
            )
            trial_idx += 1

    # Consume a random draw to ensure rng state is exercised
    # (forward-compat: callers that pass rng forward get consistent sequences)
    _ = rng.random()

    return trials
