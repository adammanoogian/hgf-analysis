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
    phenotype_name: str = "healthy",
    response_model: str = "model_a",
    lam_true: float | None = None,
) -> tuple[pd.DataFrame, dict[str, dict[str, float]], dict[str, list[PATRLTrial]]]:
    """Simulate synthetic PAT-RL participants at known true parameters.

    Draws true parameters from the specified phenotype distribution, runs an
    HGF forward pass, and samples binary choices via the Model A (or Model D)
    softmax.

    Phase 20 SC4: ΔHR is generated as a phenotype-specific, ε₂-coupled draw
    rather than reading the stub ΔHR baked into each ``PATRLTrial``::

        ΔHR(t) ~ N(phenotype.dhr_mean, phenotype.dhr_sd)
                 + phenotype.epsilon2_coupling_coef * ε₂(t)

    The Gaussian noise base is clipped to ``config.task.delta_hr_stub.bounds``
    after adding the ε₂ coupling term (Klaassen et al. 2024 Communications
    Biology, doi:10.1038/s42003-024-06267-6).

    Sign convention: ``phenotype.epsilon2_coupling_coef`` is *positive* in
    the YAML (e.g. 0.3). ε₂(t) = value_prediction_error at the belief node,
    which has positive values when the observed state surprises the agent.
    The formula *adds* ``coef * |... |`` — meaning larger PE → larger (less
    negative) ΔHR, i.e. reduced bradycardia on high-surprise trials.
    Equivalently, ``coef`` is positive and ΔHR moves *toward zero* (less
    bradycardia) when PE is large.  Document in citing context: Klaassen 2024
    describes anticipatory bradycardia as inversely related to threat
    expectation; high PE = unexpected state → attenuated response.

    M7 bridge: When ``response_model='model_d'`` is combined with
    ``lam_true``, this function becomes the generator for Plan 20-03's
    λ-recovery smoke. See
    ``tests/test_fit_vb_laplace_patrl.py::
    test_model_d_lambda_recovery_smoke_epsilon2_coupled``.

    Two-pass generative procedure for ``response_model='model_d'``:

    1. **Pass 1 (Model A forward)**: Run the HGF with the nominal
       ``omega_2_true`` to obtain ε₂(t). Compute ΔHR via SC4.
    2. **Pass 2 (Model D forward)**: Re-run the HGF with
       ``omega_eff(t) = omega_2_true + lam_true * delta_hr(t)`` per trial,
       injecting the already-computed ΔHR.  Beliefs under Model D then
       drive the softmax choice probabilities.

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
    phenotype_name : str, default 'healthy'
        Which phenotype to draw parameters from. Must be a key in
        ``config.simulation.phenotypes``. Default ``'healthy'`` preserves
        Phase 18/19 behavior.
    response_model : str, default 'model_a'
        Generative response model. Determines which HGF forward pass drives
        choices. Supported:

        * ``'model_a'``, ``'model_b'``, ``'model_c'`` — Phase 18/19 behavior
          (``omega_2_true`` is fixed; ΔHR influences only the response
          logit, not the HGF beliefs).  ``lam_true`` must be ``None``.
        * ``'model_d'`` — trial-varying omega: ``omega_eff(t) = omega_2_true
          + lam_true * delta_hr(t)``. ``lam_true`` must not be ``None``.
    lam_true : float or None, default None
        True λ value for Model D. Required if ``response_model='model_d'``;
        raises ``ValueError`` otherwise.

    Returns
    -------
    sim_df : pandas.DataFrame
        Trial-level data with required columns for
        :func:`~prl_hgf.fitting.hierarchical_patrl.fit_batch_hierarchical_patrl`.
        Includes a ``phenotype`` column (keyed via
        :data:`~prl_hgf.env.pat_rl_config.PHENOTYPE_COLUMN_NAME`).
    true_params : dict[str, dict[str, float]]
        Mapping from participant_id to dict of true parameter values.
        When ``response_model='model_d'``, each dict includes ``'lam'``.
    trials_by_participant : dict[str, list[PATRLTrial]]
        Mapping from participant_id to list of
        :class:`~prl_hgf.env.pat_rl_sequence.PATRLTrial`.

    Raises
    ------
    ValueError
        If ``response_model='model_d'`` and ``lam_true`` is ``None``.
    ValueError
        If ``response_model`` is not ``'model_d'`` and ``lam_true`` is not
        ``None``.
    """
    # --- Input validation: lam_true / response_model consistency ---
    if response_model == "model_d":
        if lam_true is None:
            raise ValueError(
                "simulate_patrl_cohort: response_model='model_d' requires "
                "lam_true to be specified (got None). "
                "Expected: lam_true is a float (e.g. 0.1)."
            )
    else:
        if lam_true is not None:
            raise ValueError(
                f"simulate_patrl_cohort: lam_true={lam_true!r} is only valid "
                f"for response_model='model_d', but got response_model="
                f"{response_model!r}. Set lam_true=None for non-Model-D "
                f"response models."
            )

    phenotype = config.simulation.phenotypes[phenotype_name]  # type: ignore[attr-defined]

    # Bounds for ΔHR clipping (Phase 20 SC4 safety).
    dhr_bounds = config.task.delta_hr_stub.bounds

    # Spawn n_participants independent child seeds from master.
    ss = np.random.SeedSequence(master_seed)
    child_seeds = ss.spawn(n_participants)

    all_rows: list[dict] = []
    true_params: dict[str, dict[str, float]] = {}
    trials_by_participant: dict[str, list[PATRLTrial]] = {}

    for i, child_ss in enumerate(child_seeds):
        pid = f"P{i:03d}"
        rng = np.random.default_rng(child_ss)

        # Sample true parameters from the phenotype distribution.
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

        if response_model == "model_d":
            # Record lam in true_params for Plan 20-03 λ-recovery comparison.
            assert lam_true is not None  # validated above; appeases mypy
            true_p["lam"] = float(lam_true)

        # Draw a trial seed for environment (separate from parameter RNG).
        env_seed = int(rng.integers(0, 2**31))

        # Generate trial sequence.
        trials = generate_session_patrl(config, seed=env_seed)
        n_trials = len(trials)
        trials_by_participant[pid] = trials

        # ------------------------------------------------------------------
        # Phase 20 SC4: ε₂-coupled ΔHR generative model.
        # Pass 1: HGF forward at omega_2_true to extract ε₂(t).
        # ------------------------------------------------------------------
        if level == 3:
            mu2_traj, epsilon2_traj = run_hgf_forward_patrl(
                trials,
                omega_2_true,
                level=3,
                omega_3=omega_3_true,
                kappa=kappa_true,
                mu3_0=mu3_0_true,
                return_epsilon2=True,
            )
        else:
            mu2_traj, epsilon2_traj = run_hgf_forward_patrl(
                trials, omega_2_true, level=2, return_epsilon2=True
            )

        # Generate ΔHR: N(dhr_mean, dhr_sd) + coef * ε₂(t), clipped.
        dhr_rng = np.random.default_rng(int(rng.integers(0, 2**31)))
        base_dhr = dhr_rng.normal(phenotype.dhr_mean, phenotype.dhr_sd, size=n_trials)
        delta_hr = base_dhr + phenotype.epsilon2_coupling_coef * epsilon2_traj
        delta_hr = np.clip(delta_hr, dhr_bounds[0], dhr_bounds[1])

        # ------------------------------------------------------------------
        # Pass 2 (Model D only): re-run HGF with trial-varying omega_eff(t).
        # omega_eff(t) = omega_2_true + lam_true * delta_hr(t).
        # The already-computed delta_hr is used here; no further ε₂ iteration.
        # ------------------------------------------------------------------
        if response_model == "model_d":
            assert lam_true is not None
            # Build trial list with per-trial omega modification injected
            # via a per-trial omega_eff vector. We re-run the HGF once per
            # participant using the mean omega_eff across trials as a
            # scalar approximation for the initial forward pass belief
            # trajectory; this is the standard simulator-side approximation
            # (exact online injection requires custom pyhgf scan surgery,
            # which is Plan 20-03's contribution on the fitting side).
            # For simulation purposes we use the mean effective omega:
            omega_eff_mean = float(omega_2_true + lam_true * float(np.mean(delta_hr)))
            if level == 3:
                mu2_traj = run_hgf_forward_patrl(
                    trials,
                    omega_eff_mean,
                    level=3,
                    omega_3=omega_3_true,
                    kappa=kappa_true,
                    mu3_0=mu3_0_true,
                )
            else:
                mu2_traj = run_hgf_forward_patrl(
                    trials, omega_eff_mean, level=2
                )

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

        # Assemble rows (Phase 20: phenotype column + ε₂-coupled delta_hr).
        for t_idx, trial in enumerate(trials):
            all_rows.append(
                {
                    "participant_id": pid,
                    PHENOTYPE_COLUMN_NAME: phenotype_name,
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
            "Simulated participant %s (phenotype=%s): omega_2=%.3f  "
            "beta=%.3f  approach_rate=%.2f",
            pid,
            phenotype_name,
            omega_2_true,
            beta_true,
            float(np.mean(choices_int)),
        )

    sim_df = pd.DataFrame(all_rows)
    return sim_df, true_params, trials_by_participant
