"""PAT-RL synthetic cohort simulator.

Extracted from scripts/12_smoke_patrl_foundation.py so that downstream
smoke scripts (NUTS smoke, Laplace smoke, VBL-06 Laplace-vs-NUTS
comparison) can all operate on the same synthetic cohort for identical
master_seed. Seed-deterministic end-to-end.
"""

from __future__ import annotations

import logging

import numpy as np
import pandas as pd

from prl_hgf.env.pat_rl_config import PHENOTYPE_COLUMN_NAME, PATRLConfig
from prl_hgf.env.pat_rl_sequence import PATRLTrial, generate_session_patrl
from prl_hgf.models.hgf_2level_patrl import build_2level_network_patrl
from prl_hgf.models.hgf_3level_patrl import build_3level_network_patrl

logger = logging.getLogger(__name__)

__all__ = [
    "run_hgf_forward_patrl",
    "simulate_patrl_cohort",
]


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
    trials : list[PATRLTrial]
        Trial list from :func:`~prl_hgf.env.pat_rl_sequence.generate_session_patrl`.
    omega_2 : float
        Tonic volatility for the value parent node.
    level : int
        HGF level (2 or 3).
    omega_3 : float, optional
        Tonic volatility for the volatility parent (3-level only).
    kappa : float, optional
        Volatility coupling strength (3-level only).
    mu3_0 : float, optional
        Initial volatility state mean (3-level only).
    return_epsilon2 : bool, default False
        If True, also return the level-2 prediction error trajectory
        epsilon2(t) = ``node_trajectories[1]['temp']['value_prediction_error']``.
        Used by the phenotype-specific Delta-HR generative model
        (``simulate_patrl_cohort``, SC4). Decision 126 confirms pyhgf 0.2.8
        exposes this key. Default False preserves the Phase 18/19 return
        shape (mu2 only).

    Returns
    -------
    mu2_array : np.ndarray, shape (n_trials,), float64
        Posterior belief mean trajectory.
    epsilon2_array : np.ndarray, shape (n_trials,), float64
        Level-2 value prediction error trajectory.
        ONLY returned when ``return_epsilon2=True``.

    Raises
    ------
    RuntimeError
        If ``return_epsilon2=True`` and the pyhgf temp key
        ``value_prediction_error`` is missing (surfaces API changes).
    ValueError
        If the epsilon2 shape does not match mu2 shape.
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
        # value_prediction_error is the epsilon2(t) trajectory at level 2.
        try:
            epsilon2 = np.asarray(
                traj["temp"]["value_prediction_error"],
                dtype=np.float64,
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


def simulate_patrl_cohort(
    n_participants: int,
    level: int,
    master_seed: int,
    config: PATRLConfig,
) -> tuple[pd.DataFrame, dict[str, dict[str, float]], dict[str, list[PATRLTrial]]]:
    """Simulate synthetic PAT-RL participants at known true parameters.

    Draws true parameters from the ``healthy`` phenotype distribution for each
    participant, runs an HGF forward pass, and samples binary choices via the
    Model A softmax.

    Parameters
    ----------
    n_participants : int
        Number of synthetic agents.
    level : int
        HGF level (2 or 3).
    master_seed : int
        Master RNG seed; spawns per-participant child seeds.
    config : PATRLConfig
        Loaded PAT-RL configuration.

    Returns
    -------
    sim_df : pandas.DataFrame
        Trial-level data with required columns for
        :func:`~prl_hgf.fitting.hierarchical_patrl.fit_batch_hierarchical_patrl`.
    true_params : dict[str, dict[str, float]]
        Mapping from participant_id to dict of true parameter values.
    trials_by_participant : dict[str, list[PATRLTrial]]
        Mapping from participant_id to list of :class:`~prl_hgf.env.pat_rl_sequence.PATRLTrial`.
    """
    phenotype = config.simulation.phenotypes["healthy"]  # type: ignore[attr-defined]

    # Spawn n_participants independent child seeds from master.
    ss = np.random.SeedSequence(master_seed)
    child_seeds = ss.spawn(n_participants)

    all_rows: list[dict] = []
    true_params: dict[str, dict[str, float]] = {}
    trials_by_participant: dict[str, list[PATRLTrial]] = {}

    for i, child_ss in enumerate(child_seeds):
        pid = f"P{i:03d}"
        rng = np.random.default_rng(child_ss)

        # Sample true parameters from the healthy phenotype distribution.
        omega_2_true = float(rng.normal(phenotype.omega_2.mean, phenotype.omega_2.sd))
        beta_true = float(
            max(0.01, rng.normal(phenotype.beta.mean, phenotype.beta.sd))
        )

        true_p: dict[str, float] = {"omega_2": omega_2_true, "beta": beta_true}

        if level == 3:
            omega_3_true = float(
                rng.normal(phenotype.kappa.mean + 1e-3, max(0.01, phenotype.kappa.sd))
                if phenotype.kappa.sd > 0
                else phenotype.kappa.mean
            )
            # Use omega_3 from config priors
            omega_3_true = float(
                rng.normal(
                    config.fitting.priors.omega_3.mean,  # type: ignore[attr-defined]
                    config.fitting.priors.omega_3.sd,  # type: ignore[attr-defined]
                )
            )
            kappa_true = float(phenotype.kappa.mean)
            mu3_0_true = float(phenotype.mu3_0.mean)
            true_p["omega_3"] = omega_3_true
            true_p["kappa"] = kappa_true
            true_p["mu3_0"] = mu3_0_true

        # Draw a trial seed for environment (separate from parameter RNG).
        env_seed = int(rng.integers(0, 2**31))

        # Generate trial sequence.
        trials = generate_session_patrl(config, seed=env_seed)
        n_trials = len(trials)
        trials_by_participant[pid] = trials

        # HGF forward pass at true parameters to get mu2 trajectory.
        if level == 3:
            mu2_traj = run_hgf_forward_patrl(
                trials,
                omega_2_true,
                level=3,
                omega_3=omega_3_true,
                kappa=kappa_true,
                mu3_0=mu3_0_true,
            )
        else:
            mu2_traj = run_hgf_forward_patrl(trials, omega_2_true, level=2)

        # Sample choices: approach=1, avoid=0 via softmax over [EV_avoid=0, EV_approach].
        reward_mag = np.array([t.reward_mag for t in trials], dtype=np.float64)
        shock_mag = np.array([t.shock_mag for t in trials], dtype=np.float64)

        # Compute EV_approach using numpy (no JAX in simulation loop).
        mu2_clip = np.clip(mu2_traj, -30.0, 30.0)
        p_danger = 1.0 / (1.0 + np.exp(-mu2_clip))
        ev_approach = (1.0 - p_danger) * reward_mag - p_danger * shock_mag

        # Softmax choice probabilities: p_approach = sigmoid(beta * ev_approach).
        logit_approach = beta_true * ev_approach
        p_approach = 1.0 / (1.0 + np.exp(-logit_approach))

        choice_rng = np.random.default_rng(int(rng.integers(0, 2**31)))
        choices = choice_rng.random(n_trials) < p_approach
        choices_int = choices.astype(np.int32)

        delta_hr = np.array([t.delta_hr for t in trials], dtype=np.float64)

        # Assemble rows.
        for t_idx, trial in enumerate(trials):
            all_rows.append(
                {
                    "participant_id": pid,
                    "trial_idx": trial.trial_idx,
                    "state": trial.state,
                    "choice": int(choices_int[t_idx]),
                    "reward_mag": trial.reward_mag,
                    "shock_mag": trial.shock_mag,
                    "delta_hr": float(delta_hr[t_idx]),
                    "outcome_time_s": trial.outcome_time_s,
                }
            )

        true_params[pid] = true_p
        logger.info(
            "Simulated participant %s: omega_2=%.3f  beta=%.3f  "
            "approach_rate=%.2f",
            pid,
            omega_2_true,
            beta_true,
            float(np.mean(choices_int)),
        )

    sim_df = pd.DataFrame(all_rows)
    return sim_df, true_params, trials_by_participant
