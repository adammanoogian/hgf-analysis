"""PAT-RL batched logp factory + BlackJAX NUTS orchestrator (parallel stack).

This module is a parallel fitting entry point for the PAT-RL task that
**reuses** generic BlackJAX helpers from :mod:`prl_hgf.fitting.hierarchical`
(``_run_blackjax_nuts``, ``_samples_to_idata``, ``_extract_nuts_stats``)
without modifying any of them.

Architecture
------------
* :func:`_build_session_scanner_patrl` — builds the pyhgf Network ONCE
  outside ``jax.vmap``/``jax.jit``, capturing ``scan_fn`` and ``base_attrs``
  in a closure (mirrors the factory pattern in
  ``prl_hgf.simulation.jax_session``).
* :func:`build_logp_fn_batched_patrl` — creates a batched ``logp_fn``
  that vmaps :func:`_single_logp` over the participant dimension.
* :func:`_build_arrays_single_patrl` — converts a PAT-RL ``sim_df`` into
  the ``(P, n_trials)`` NumPy arrays required by the logp factory.
* :func:`fit_batch_hierarchical_patrl` — top-level entry point; constructs
  a pure-JAX log-posterior and drives BlackJAX NUTS via the reused helpers.

Parallel-stack invariant
------------------------
``hierarchical.py`` is NOT modified.  Its functions are imported and called
unchanged.  PAT-RL fitting concerns live entirely in this module.

Scope (Plan 20-03)
------------------
Models A (with bias b), B (ΔHR additive bias), C (ΔHR × value sensitivity),
and D (trial-varying tonic volatility omega_eff(t) = omega_2 + lam * dHR(t)).

Notes
-----
* ``delta_hr`` is assembled by :func:`_build_arrays_single_patrl` and is
  consumed by the Models B/C logp via the ``delta_hr_arr`` kwarg of
  :func:`build_logp_fn_batched_patrl`.  Model A passes zeros for backward
  compatibility when ``delta_hr_arr=None``.
* Layer-2 clamping is implemented inline (``_MU_2_BOUND = 14.0``) and does
  NOT import from :mod:`prl_hgf.fitting.hierarchical` to preserve the
  parallel-stack invariant.
* kappa is stored in ``attrs[VOLATILITY_NODE]["volatility_coupling_children"]``
  as a JAX array and can be injected dynamically at runtime for the 3-level
  model.
"""

from __future__ import annotations

from typing import Any

import arviz as az
import jax
import jax.numpy as jnp
import numpy as np
import pandas as pd

from prl_hgf.env.pat_rl_config import PATRLConfig, load_pat_rl_config

# Reuse generic BlackJAX helpers from the pick_best_cue fitting module.
# These are logdensity-shape generic — no PAT-RL specific assumptions.
# hierarchical.py is NOT modified; these are pure imports.
from prl_hgf.fitting.hierarchical import (
    _run_blackjax_nuts,
    _samples_to_idata,
)
from prl_hgf.models.hgf_2level_multimodal_patrl import (
    build_2level_multimodal_network_patrl,
)
from prl_hgf.models.hgf_2level_patrl import build_2level_network_patrl
from prl_hgf.models.hgf_3level_patrl import build_3level_network_patrl
from prl_hgf.models.response_patrl import (
    model_a_logp,
    model_b_logp,
    model_c_logp,
)

# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------

#: Tapas magnitude bound on level-2 belief means (tapas_ehgf_binary.m).
#: Implemented inline here; do NOT import from hierarchical.py (that would
#: couple the parallel stacks).
_MU_2_BOUND: float = 14.0

#: Node index for the continuous-state value parent (level-1 belief).
_BELIEF_NODE: int = 1

#: Node index for the continuous-state volatility parent (3-level only).
_VOLATILITY_NODE: int = 2

#: Node index for the shared belief parent in the multimodal 2-level variant.
_BELIEF_NODE_MM: int = 2

#: Supported PAT-RL model names.
_PATRL_MODEL_NAMES: tuple[str, ...] = (
    "hgf_2level_patrl",
    "hgf_3level_patrl",
    "hgf_2level_multimodal_patrl",
)

#: Required columns in the PAT-RL sim_df.
_REQUIRED_COLUMNS: frozenset[str] = frozenset(
    {
        "participant_id",
        "trial_idx",
        "state",
        "choice",
        "reward_mag",
        "shock_mag",
        "delta_hr",
        "outcome_time_s",
    }
)

__all__ = [
    "build_logp_fn_batched_patrl",
    "fit_batch_hierarchical_patrl",
    "_build_arrays_single_patrl",
    "_build_session_scanner_patrl",
]


# ---------------------------------------------------------------------------
# Network factory (private)
# ---------------------------------------------------------------------------


def _build_session_scanner_patrl(
    model_name: str,
) -> tuple[dict, Any, int]:
    """Build ``(base_attrs, scan_fn, belief_idx)`` for the PAT-RL network.

    Constructs the pyhgf ``Network`` ONCE outside ``jax.vmap``/``jax.jit``
    so that ``scan_fn`` can be captured as a closed-over pure-JAX callable.

    Parameters
    ----------
    model_name : {"hgf_2level_patrl", "hgf_3level_patrl", "hgf_2level_multimodal_patrl"}
        PAT-RL model variant.

    Returns
    -------
    base_attrs : dict
        Initial attributes pytree from the primed network.
    scan_fn : callable
        pyhgf ``Network.scan_fn`` (a ``jax.tree_util.Partial``).
    belief_idx : int
        Node index for the continuous-state value parent (``1`` for scalar
        variants; ``2`` for the multimodal variant).

    Raises
    ------
    ValueError
        If ``model_name`` is not a recognised PAT-RL model.
    """
    if model_name not in _PATRL_MODEL_NAMES:
        msg = f"model_name must be one of {_PATRL_MODEL_NAMES}, got {model_name!r}"
        raise ValueError(msg)

    if model_name == "hgf_2level_patrl":
        net = build_2level_network_patrl()
        belief_idx = _BELIEF_NODE  # node 1
        dummy = np.zeros((1, 1), dtype=np.float64)
    elif model_name == "hgf_3level_patrl":
        net = build_3level_network_patrl()
        belief_idx = _BELIEF_NODE  # node 1
        dummy = np.zeros((1, 1), dtype=np.float64)
    else:  # hgf_2level_multimodal_patrl
        net = build_2level_multimodal_network_patrl()
        belief_idx = _BELIEF_NODE_MM  # node 2 (shared belief parent)
        dummy = np.zeros((1, 2), dtype=np.float64)

    # Prime scan_fn with one dummy observation so attributes are initialised.
    net.input_data(input_data=dummy, time_steps=np.ones(1, dtype=np.float64))

    base_attrs = net.attributes
    scan_fn = net.scan_fn
    return base_attrs, scan_fn, belief_idx


# ---------------------------------------------------------------------------
# Per-participant logp (private)
# ---------------------------------------------------------------------------


def _make_single_logp_fn(
    base_attrs: dict,
    scan_fn: Any,
    belief_idx: int,
    model_name: str,
    n_trials: int,
    response_model: str = "model_a",
    delta_hr_jnp: jnp.ndarray | None = None,
) -> Any:
    """Return a single-participant logp function closing over network state.

    The returned function is compatible with ``jax.vmap``.

    Parameters
    ----------
    base_attrs : dict
        Initial attributes pytree from :func:`_build_session_scanner_patrl`.
    scan_fn : callable
        pyhgf ``Network.scan_fn``.
    belief_idx : int
        Belief-node index (always ``1``).
    model_name : str
        PAT-RL model variant.
    n_trials : int
        Number of trials per participant.
    response_model : str, default "model_a"
        Response model name; dispatches which logp function is called after
        the HGF scan.  One of ``"model_a"``, ``"model_b"``, ``"model_c"``,
        ``"model_d"``.
    delta_hr_jnp : jnp.ndarray or None, default None
        Shape ``(P, n_trials)`` or ``None``.  When provided, the per-
        participant row is indexed by vmap and forwarded to Models B/C/D.
        Must be ``None`` for Model A (not used).

    Returns
    -------
    callable
        ``(params, state, choices, reward, shock, mask[, delta_hr]) -> scalar``.
    """
    is_3level = model_name == "hgf_3level_patrl"
    is_multimodal = model_name == "hgf_2level_multimodal_patrl"

    def _single_logp(
        params: dict[str, jnp.ndarray],
        state: jnp.ndarray,
        choices: jnp.ndarray,
        reward: jnp.ndarray,
        shock: jnp.ndarray,
        mask: jnp.ndarray,
        delta_hr_i: jnp.ndarray,
    ) -> jnp.ndarray:
        """Compute single-participant log-likelihood.

        Parameters
        ----------
        params : dict
            Scalar parameter values for this participant:
            ``omega_2`` (and ``omega_3``, ``kappa``, ``mu3_0`` for 3-level),
            ``beta``.  For Models B/C: also ``b``, ``gamma`` (and ``alpha``
            for Model C).  For Model D: ``omega_2``, ``lam``, ``b``, ``beta``.
        state : jnp.ndarray
            Shape ``(n_trials,)`` int32 binary context states.
        choices : jnp.ndarray
            Shape ``(n_trials,)`` int32 binary choices (1=approach).
        reward : jnp.ndarray
            Shape ``(n_trials,)`` float32 reward magnitudes.
        shock : jnp.ndarray
            Shape ``(n_trials,)`` float32 shock magnitudes.
        mask : jnp.ndarray
            Shape ``(n_trials,)`` bool trial mask.
        delta_hr_i : jnp.ndarray
            Shape ``(n_trials,)`` float64 per-trial ΔHR.  All-zeros for
            Model A (not used in EV calculation).  Required for Models B/C/D.

        Returns
        -------
        jnp.ndarray
            Scalar log-likelihood.
        """
        # Model D: trial-varying tonic volatility — omega_eff(t) = omega_2 + lam * dHR(t).
        # Scientific grounding: Klaassen et al. 2024 (Communications Biology,
        # doi:10.1038/s42003-024-06267-6) demonstrates that cardiac deceleration
        # (anticipatory bradycardia, captured here by delta_hr) modulates perceptual
        # precision in threat anticipation. The HGF-level instantiation couples
        # bradycardia to the level-2 tonic volatility parameter omega_2 via lam.
        # See docs/references.bib::klaassen2024neurocomputational.
        # Implementation: inject per-trial into attrs[belief_idx]["tonic_volatility"]
        # inside the scan step (mirrors Decision 120 kappa-via-attrs pattern,
        # but per-trial instead of once). Plan 20-03.
        if response_model == "model_d":
            # 1d) Start from base_attrs; inject 3-level params once (omega_3,
            #     kappa, mu3_0 are NOT trial-varying — only omega_2 via lam).
            attrs_d = {**base_attrs}
            if is_3level:
                attrs_d[_VOLATILITY_NODE] = {
                    **attrs_d[_VOLATILITY_NODE],
                    "tonic_volatility": params["omega_3"],
                    "volatility_coupling_children": jnp.asarray([params["kappa"]]),
                    "mean": params["mu3_0"],
                }
            # Do NOT inject omega_2 into belief_idx here — done per-trial below.

            # 2d) Build scan inputs: state float64, time_steps float64, dHR float64.
            values_d = state.astype(jnp.float64)[:, None]  # (T, 1)
            observed_d = jnp.ones((n_trials,), dtype=jnp.int32)  # (T,)
            time_steps_d = jnp.ones((n_trials,), dtype=jnp.float64)  # (T,)
            # fp64 per Decision 118 — dtype cast happens here, before JAX trace.
            dhr_trials = delta_hr_i.astype(jnp.float64)  # (T,)

            # 3d) Tapas-style Layer-2 clamped scan with per-trial omega injection.
            def _clamped_step_model_d(
                carry: dict,
                x: tuple,
            ) -> tuple[dict, jnp.ndarray]:
                val_i, obs_i, ts_i, dhr_i = x
                # Recompute tonic_volatility per trial (Decision 120 extended).
                omega_eff_i = params["omega_2"] + params["lam"] * dhr_i
                attrs_i = {**carry}
                attrs_i[belief_idx] = {
                    **attrs_i[belief_idx],
                    "tonic_volatility": omega_eff_i,
                }
                new_carry, _traj = scan_fn(attrs_i, ((val_i,), (obs_i,), ts_i, None))
                # Layer-2 clamp: revert if |mu2| >= _MU_2_BOUND or non-finite.
                new_mean = new_carry[belief_idx]["mean"]
                is_stable = jnp.all(jnp.isfinite(new_mean)) & (
                    jnp.abs(new_mean) < _MU_2_BOUND
                )
                safe_carry = jax.tree_util.tree_map(
                    lambda n, o: jnp.where(is_stable, n, o),
                    new_carry,
                    carry,
                )
                return safe_carry, safe_carry[belief_idx]["mean"]

            # 4d) Scan; collect mu2_traj — shape (T,).
            _, mu2_traj = jax.lax.scan(
                _clamped_step_model_d,
                attrs_d,
                (values_d, observed_d, time_steps_d, dhr_trials),
            )

            # 5d) Model D response = Model A response (ΔHR enters perception only;
            #     no additional ΔHR term in the response model — see must_haves).
            logp_per_trial = model_a_logp(
                mu2_traj,
                choices.astype(jnp.int32),
                reward.astype(jnp.float64),
                shock.astype(jnp.float64),
                params["beta"],
                params.get("b", 0.0),
            )
            return jnp.sum(jnp.where(mask, logp_per_trial, 0.0))

        # -----------------------------------------------------------------------
        # Multimodal 2-level: two binary inputs → shared μ₂ (belief_idx = 2).
        # Both input nodes receive the same state signal here; the architecture
        # is structural — plug in distinct u₁/u₂ arrays at the logp-factory
        # level when two independent observation streams are available.
        # -----------------------------------------------------------------------

        if is_multimodal:
            attrs_mm = {**base_attrs}
            attrs_mm[belief_idx] = {
                **attrs_mm[belief_idx],
                "tonic_volatility": params["omega_2"],
            }

            # Build (T, 2) input: replicate state into both channels for now.
            # Replace second column with a distinct observable when available.
            values_mm = jnp.stack(
                [state.astype(jnp.float64), state.astype(jnp.float64)], axis=1
            )  # (T, 2)
            observed_mm = jnp.ones((n_trials,), dtype=jnp.int32)
            time_steps_mm = jnp.ones((n_trials,), dtype=jnp.float64)

            def _clamped_step_mm(
                carry: dict,
                x: tuple,
            ) -> tuple[dict, jnp.ndarray]:
                val1_i, val2_i, obs_i, ts_i = x
                new_carry, _traj = scan_fn(
                    carry,
                    ((val1_i, val2_i), (obs_i, obs_i), ts_i, None),
                )
                new_mean = new_carry[belief_idx]["mean"]
                is_stable = jnp.all(jnp.isfinite(new_mean)) & (
                    jnp.abs(new_mean) < _MU_2_BOUND
                )
                safe_carry = jax.tree_util.tree_map(
                    lambda n, o: jnp.where(is_stable, n, o),
                    new_carry,
                    carry,
                )
                return safe_carry, safe_carry[belief_idx]["mean"]

            _, mu2_traj_mm = jax.lax.scan(
                _clamped_step_mm,
                attrs_mm,
                (values_mm[:, 0], values_mm[:, 1], observed_mm, time_steps_mm),
            )

            # Response model dispatch (same as Models A/B/C below).
            if response_model == "model_a":
                logp_per_trial = model_a_logp(
                    mu2_traj_mm,
                    choices.astype(jnp.int32),
                    reward.astype(jnp.float64),
                    shock.astype(jnp.float64),
                    params["beta"],
                    params.get("b", 0.0),
                )
            elif response_model == "model_b":
                logp_per_trial = model_b_logp(
                    mu2_traj_mm,
                    choices.astype(jnp.int32),
                    reward.astype(jnp.float64),
                    shock.astype(jnp.float64),
                    params["beta"],
                    params["b"],
                    params["gamma"],
                    delta_hr_i.astype(jnp.float64),
                )
            elif response_model == "model_c":
                logp_per_trial = model_c_logp(
                    mu2_traj_mm,
                    choices.astype(jnp.int32),
                    reward.astype(jnp.float64),
                    shock.astype(jnp.float64),
                    params["beta"],
                    params["b"],
                    params["alpha"],
                    params["gamma"],
                    delta_hr_i.astype(jnp.float64),
                )
            else:
                raise ValueError(
                    f"response_model={response_model!r} is not supported for "
                    "hgf_2level_multimodal_patrl.  Use 'model_a', 'model_b', "
                    "or 'model_c'."
                )
            return jnp.sum(jnp.where(mask, logp_per_trial, 0.0))

        # -----------------------------------------------------------------------
        # Models A/B/C: one-shot omega_2 injection before scan.
        # -----------------------------------------------------------------------

        # 1) Inject omega_2 (and 3-level params) into a fresh copy of base_attrs.
        attrs = {**base_attrs}
        attrs[belief_idx] = {
            **attrs[belief_idx],
            "tonic_volatility": params["omega_2"],
        }
        if is_3level:
            attrs[_VOLATILITY_NODE] = {
                **attrs[_VOLATILITY_NODE],
                "tonic_volatility": params["omega_3"],
                # kappa stored as 1-element array in volatility_coupling_children
                "volatility_coupling_children": jnp.asarray([params["kappa"]]),
                "mean": params["mu3_0"],
            }

        # 2) Build scan inputs: binary state as float input, 1D time_steps.
        # Use float64 to match pyhgf attribute dtype (network primed with
        # float64 numpy arrays; jax.lax.cond inside pyhgf requires dtype
        # consistency between branches and the existing precision arrays).
        values = state.astype(jnp.float64)[:, None]  # (T, 1)
        observed = jnp.ones((n_trials,), dtype=jnp.int32)  # (T,)
        time_steps = jnp.ones((n_trials,), dtype=jnp.float64)  # (T,)

        # 3) Tapas-style Layer-2 clamped scan.
        #    _MU_2_BOUND = 14.0 (defined at module level; NOT imported from
        #    hierarchical.py to preserve the parallel-stack invariant).
        def _clamped_step(
            carry: dict,
            x: tuple,
        ) -> tuple[dict, jnp.ndarray]:
            val_i, obs_i, ts_i = x
            new_carry, _traj = scan_fn(carry, ((val_i,), (obs_i,), ts_i, None))

            # Layer-2 clamp: revert if |mu2| >= _MU_2_BOUND or non-finite.
            new_mean = new_carry[belief_idx]["mean"]
            is_stable = jnp.all(jnp.isfinite(new_mean)) & (
                jnp.abs(new_mean) < _MU_2_BOUND
            )
            safe_carry = jax.tree_util.tree_map(
                lambda n, o: jnp.where(is_stable, n, o),
                new_carry,
                carry,
            )
            # Per-trial output: belief-node mu2 after clamping.
            return safe_carry, safe_carry[belief_idx]["mean"]

        # 4) Scan over trials; collect mu2 per step.
        _, mu2_traj = jax.lax.scan(
            _clamped_step,
            attrs,
            (values, observed, time_steps),
        )
        # mu2_traj shape: (T,) — scalar mean per trial.

        # 5) Compute per-trial log-likelihood by dispatching on response_model.
        #    Dispatch is resolved at factory-build time (Python string comparison),
        #    not inside the JAX trace, so there is no tracing overhead.
        if response_model == "model_a":
            logp_per_trial = model_a_logp(
                mu2_traj,
                choices.astype(jnp.int32),
                reward.astype(jnp.float64),
                shock.astype(jnp.float64),
                params["beta"],
                params.get("b", 0.0),
            )
        elif response_model == "model_b":
            logp_per_trial = model_b_logp(
                mu2_traj,
                choices.astype(jnp.int32),
                reward.astype(jnp.float64),
                shock.astype(jnp.float64),
                params["beta"],
                params["b"],
                params["gamma"],
                delta_hr_i.astype(jnp.float64),
            )
        elif response_model == "model_c":
            logp_per_trial = model_c_logp(
                mu2_traj,
                choices.astype(jnp.int32),
                reward.astype(jnp.float64),
                shock.astype(jnp.float64),
                params["beta"],
                params["b"],
                params["alpha"],
                params["gamma"],
                delta_hr_i.astype(jnp.float64),
            )
        else:
            # Unreachable: model_d is handled above; unknown models are rejected
            # at build_logp_fn_batched_patrl / fit_batch_hierarchical_patrl.
            raise ValueError(
                f"response_model={response_model!r} reached A/B/C dispatch "
                "but is not recognised. This is a bug."
            )

        # 6) Apply trial mask and sum.
        return jnp.sum(jnp.where(mask, logp_per_trial, 0.0))

    return _single_logp


# ---------------------------------------------------------------------------
# Public logp factory
# ---------------------------------------------------------------------------


def build_logp_fn_batched_patrl(
    state_arr: np.ndarray,
    choices_arr: np.ndarray,
    reward_mag_arr: np.ndarray,
    shock_mag_arr: np.ndarray,
    trial_mask: np.ndarray,
    model_name: str,
    response_model: str = "model_a",
    delta_hr_arr: np.ndarray | None = None,
) -> Any:
    """Build a batched (vmapped) pure-JAX logp function for PAT-RL.

    Constructs the pyhgf network ONCE (via :func:`_build_session_scanner_patrl`),
    then wraps a per-participant logp in ``jax.vmap`` over the participant
    dimension.  The returned callable accepts a parameter dict with
    ``(P,)``-shaped arrays and returns a scalar summed log-likelihood.

    Parameters
    ----------
    state_arr : numpy.ndarray, shape (P, n_trials)
        Binary context states (0=safe, 1=dangerous) per participant.
    choices_arr : numpy.ndarray, shape (P, n_trials)
        Binary choices (0=avoid, 1=approach) per participant.
    reward_mag_arr : numpy.ndarray, shape (P, n_trials)
        Reward magnitudes per participant.
    shock_mag_arr : numpy.ndarray, shape (P, n_trials)
        Shock magnitudes per participant.
    trial_mask : numpy.ndarray, shape (P, n_trials)
        Boolean mask; ``True`` for valid trials, ``False`` for padding.
    model_name : {"hgf_2level_patrl", "hgf_3level_patrl", "hgf_2level_multimodal_patrl"}
        PAT-RL HGF variant.
    response_model : str, default "model_a"
        Response function to use.  One of ``"model_a"``, ``"model_b"``,
        ``"model_c"``, ``"model_d"``.
    delta_hr_arr : numpy.ndarray or None, shape (P, n_trials), default None
        Per-participant, per-trial anticipatory ΔHR in bpm.  Required for
        Models B, C, and D.  When ``None``, a zeros array of shape
        ``(P, n_trials)`` is used (backward-compatible with Model A).

    Returns
    -------
    logp_fn : callable
        ``dict[str, jnp.ndarray] -> jnp.ndarray``.  Takes a params dict
        where each value has shape ``(P,)`` and returns a scalar.
        Compatible with ``jax.grad`` and BlackJAX NUTS.

    Raises
    ------
    ValueError
        If ``model_name`` is not a recognised PAT-RL variant.
    """

    base_attrs, scan_fn, belief_idx = _build_session_scanner_patrl(model_name)
    n_trials = state_arr.shape[1]
    P = state_arr.shape[0]

    # Build delta_hr array: zeros for Model A (not used), real data for B/C.
    if delta_hr_arr is None:
        _delta_hr = np.zeros((P, n_trials), dtype=np.float64)
    else:
        _delta_hr = np.asarray(delta_hr_arr, dtype=np.float64)

    _single_logp = _make_single_logp_fn(
        base_attrs,
        scan_fn,
        belief_idx,
        model_name,
        n_trials,
        response_model=response_model,
    )

    # Convert to JAX arrays once (closure, not traced args — shapes fixed per call).
    state_jnp = jnp.asarray(state_arr, dtype=jnp.int32)
    choices_jnp = jnp.asarray(choices_arr, dtype=jnp.int32)
    reward_jnp = jnp.asarray(reward_mag_arr, dtype=jnp.float32)
    shock_jnp = jnp.asarray(shock_mag_arr, dtype=jnp.float32)
    mask_jnp = jnp.asarray(trial_mask, dtype=jnp.bool_)
    delta_hr_jnp = jnp.asarray(_delta_hr, dtype=jnp.float64)

    is_3level = model_name == "hgf_3level_patrl"
    _has_b = response_model in ("model_b", "model_c")
    _has_gamma = response_model in ("model_b", "model_c")
    _has_alpha = response_model == "model_c"
    _is_model_d = response_model == "model_d"

    def logp_fn(params: dict[str, jnp.ndarray]) -> jnp.ndarray:
        """Compute batched log-likelihood summed across all participants.

        Parameters
        ----------
        params : dict[str, jnp.ndarray]
            Parameter dict.  Each value has shape ``(P,)``.  Required keys:
            ``omega_2``, ``beta``
            (plus ``omega_3``, ``kappa``, ``mu3_0`` for 3-level;
            ``b`` for A+b/B/C/D; ``gamma`` for B/C; ``alpha`` for C;
            ``lam`` for D).

        Returns
        -------
        jnp.ndarray
            Scalar summed log-likelihood.
        """
        # Model D: trial-varying omega_eff(t) = omega_2 + lam * dHR(t).
        # Both 2-level and 3-level variants share the same vmap helper —
        # the scan body branches on is_3level internally (via _single_logp
        # which closes over is_3level at factory-build time).
        if _is_model_d:
            if is_3level:

                def _call_single_d3(  # type: ignore[misc]
                    omega_2_i: jnp.ndarray,
                    omega_3_i: jnp.ndarray,
                    kappa_i: jnp.ndarray,
                    mu3_0_i: jnp.ndarray,
                    beta_i: jnp.ndarray,
                    b_i: jnp.ndarray,
                    lam_i: jnp.ndarray,
                    state_i: jnp.ndarray,
                    choices_i: jnp.ndarray,
                    reward_i: jnp.ndarray,
                    shock_i: jnp.ndarray,
                    mask_i: jnp.ndarray,
                    dhr_i: jnp.ndarray,
                ) -> Any:
                    return _single_logp(  # type: ignore[return-value]
                        {
                            "omega_2": omega_2_i,
                            "omega_3": omega_3_i,
                            "kappa": kappa_i,
                            "mu3_0": mu3_0_i,
                            "beta": beta_i,
                            "b": b_i,
                            "lam": lam_i,
                        },
                        state_i,
                        choices_i,
                        reward_i,
                        shock_i,
                        mask_i,
                        dhr_i,
                    )

                per_participant = jax.vmap(_call_single_d3)(
                    params["omega_2"],
                    params["omega_3"],
                    params["kappa"],
                    params["mu3_0"],
                    params["beta"],
                    params["b"],
                    params["lam"],
                    state_jnp,
                    choices_jnp,
                    reward_jnp,
                    shock_jnp,
                    mask_jnp,
                    delta_hr_jnp,
                )
            else:

                def _call_single_d2(  # type: ignore[misc]
                    omega_2_i: jnp.ndarray,
                    beta_i: jnp.ndarray,
                    b_i: jnp.ndarray,
                    lam_i: jnp.ndarray,
                    state_i: jnp.ndarray,
                    choices_i: jnp.ndarray,
                    reward_i: jnp.ndarray,
                    shock_i: jnp.ndarray,
                    mask_i: jnp.ndarray,
                    dhr_i: jnp.ndarray,
                ) -> Any:
                    return _single_logp(  # type: ignore[return-value]
                        {
                            "omega_2": omega_2_i,
                            "beta": beta_i,
                            "b": b_i,
                            "lam": lam_i,
                        },
                        state_i,
                        choices_i,
                        reward_i,
                        shock_i,
                        mask_i,
                        dhr_i,
                    )

                per_participant = jax.vmap(_call_single_d2)(
                    params["omega_2"],
                    params["beta"],
                    params["b"],
                    params["lam"],
                    state_jnp,
                    choices_jnp,
                    reward_jnp,
                    shock_jnp,
                    mask_jnp,
                    delta_hr_jnp,
                )
            return jnp.sum(per_participant)

        if is_3level:
            if _has_alpha:

                def _call_single(  # type: ignore[misc]
                    omega_2_i: jnp.ndarray,
                    omega_3_i: jnp.ndarray,
                    kappa_i: jnp.ndarray,
                    mu3_0_i: jnp.ndarray,
                    beta_i: jnp.ndarray,
                    b_i: jnp.ndarray,
                    alpha_i: jnp.ndarray,
                    gamma_i: jnp.ndarray,
                    state_i: jnp.ndarray,
                    choices_i: jnp.ndarray,
                    reward_i: jnp.ndarray,
                    shock_i: jnp.ndarray,
                    mask_i: jnp.ndarray,
                    dhr_i: jnp.ndarray,
                ) -> Any:
                    return _single_logp(  # type: ignore[return-value]
                        {
                            "omega_2": omega_2_i,
                            "omega_3": omega_3_i,
                            "kappa": kappa_i,
                            "mu3_0": mu3_0_i,
                            "beta": beta_i,
                            "b": b_i,
                            "alpha": alpha_i,
                            "gamma": gamma_i,
                        },
                        state_i,
                        choices_i,
                        reward_i,
                        shock_i,
                        mask_i,
                        dhr_i,
                    )

                per_participant = jax.vmap(_call_single)(
                    params["omega_2"],
                    params["omega_3"],
                    params["kappa"],
                    params["mu3_0"],
                    params["beta"],
                    params["b"],
                    params["alpha"],
                    params["gamma"],
                    state_jnp,
                    choices_jnp,
                    reward_jnp,
                    shock_jnp,
                    mask_jnp,
                    delta_hr_jnp,
                )
            elif _has_gamma:

                def _call_single_b3(  # type: ignore[misc]
                    omega_2_i: jnp.ndarray,
                    omega_3_i: jnp.ndarray,
                    kappa_i: jnp.ndarray,
                    mu3_0_i: jnp.ndarray,
                    beta_i: jnp.ndarray,
                    b_i: jnp.ndarray,
                    gamma_i: jnp.ndarray,
                    state_i: jnp.ndarray,
                    choices_i: jnp.ndarray,
                    reward_i: jnp.ndarray,
                    shock_i: jnp.ndarray,
                    mask_i: jnp.ndarray,
                    dhr_i: jnp.ndarray,
                ) -> Any:
                    return _single_logp(  # type: ignore[return-value]
                        {
                            "omega_2": omega_2_i,
                            "omega_3": omega_3_i,
                            "kappa": kappa_i,
                            "mu3_0": mu3_0_i,
                            "beta": beta_i,
                            "b": b_i,
                            "gamma": gamma_i,
                        },
                        state_i,
                        choices_i,
                        reward_i,
                        shock_i,
                        mask_i,
                        dhr_i,
                    )

                per_participant = jax.vmap(_call_single_b3)(
                    params["omega_2"],
                    params["omega_3"],
                    params["kappa"],
                    params["mu3_0"],
                    params["beta"],
                    params["b"],
                    params["gamma"],
                    state_jnp,
                    choices_jnp,
                    reward_jnp,
                    shock_jnp,
                    mask_jnp,
                    delta_hr_jnp,
                )
            else:
                # model_a (3-level): b is sampled but ignored in logit calc if 0
                def _call_single_a3(  # type: ignore[misc]
                    omega_2_i: jnp.ndarray,
                    omega_3_i: jnp.ndarray,
                    kappa_i: jnp.ndarray,
                    mu3_0_i: jnp.ndarray,
                    beta_i: jnp.ndarray,
                    state_i: jnp.ndarray,
                    choices_i: jnp.ndarray,
                    reward_i: jnp.ndarray,
                    shock_i: jnp.ndarray,
                    mask_i: jnp.ndarray,
                    dhr_i: jnp.ndarray,
                ) -> Any:
                    p: dict[str, jnp.ndarray] = {
                        "omega_2": omega_2_i,
                        "omega_3": omega_3_i,
                        "kappa": kappa_i,
                        "mu3_0": mu3_0_i,
                        "beta": beta_i,
                    }
                    if "b" in params:
                        p["b"] = params["b"][0]  # scalar broadcast — handled below
                    return _single_logp(  # type: ignore[return-value]
                        p,
                        state_i,
                        choices_i,
                        reward_i,
                        shock_i,
                        mask_i,
                        dhr_i,
                    )

                # For model_a 3-level with b in params dict:
                if "b" in params:

                    def _call_single_a3b(  # type: ignore[misc]
                        omega_2_i: jnp.ndarray,
                        omega_3_i: jnp.ndarray,
                        kappa_i: jnp.ndarray,
                        mu3_0_i: jnp.ndarray,
                        beta_i: jnp.ndarray,
                        b_i: jnp.ndarray,
                        state_i: jnp.ndarray,
                        choices_i: jnp.ndarray,
                        reward_i: jnp.ndarray,
                        shock_i: jnp.ndarray,
                        mask_i: jnp.ndarray,
                        dhr_i: jnp.ndarray,
                    ) -> Any:
                        return _single_logp(  # type: ignore[return-value]
                            {
                                "omega_2": omega_2_i,
                                "omega_3": omega_3_i,
                                "kappa": kappa_i,
                                "mu3_0": mu3_0_i,
                                "beta": beta_i,
                                "b": b_i,
                            },
                            state_i,
                            choices_i,
                            reward_i,
                            shock_i,
                            mask_i,
                            dhr_i,
                        )

                    per_participant = jax.vmap(_call_single_a3b)(
                        params["omega_2"],
                        params["omega_3"],
                        params["kappa"],
                        params["mu3_0"],
                        params["beta"],
                        params["b"],
                        state_jnp,
                        choices_jnp,
                        reward_jnp,
                        shock_jnp,
                        mask_jnp,
                        delta_hr_jnp,
                    )
                else:

                    def _call_single_a3_nb(  # type: ignore[misc]
                        omega_2_i: jnp.ndarray,
                        omega_3_i: jnp.ndarray,
                        kappa_i: jnp.ndarray,
                        mu3_0_i: jnp.ndarray,
                        beta_i: jnp.ndarray,
                        state_i: jnp.ndarray,
                        choices_i: jnp.ndarray,
                        reward_i: jnp.ndarray,
                        shock_i: jnp.ndarray,
                        mask_i: jnp.ndarray,
                        dhr_i: jnp.ndarray,
                    ) -> Any:
                        return _single_logp(  # type: ignore[return-value]
                            {
                                "omega_2": omega_2_i,
                                "omega_3": omega_3_i,
                                "kappa": kappa_i,
                                "mu3_0": mu3_0_i,
                                "beta": beta_i,
                            },
                            state_i,
                            choices_i,
                            reward_i,
                            shock_i,
                            mask_i,
                            dhr_i,
                        )

                    per_participant = jax.vmap(_call_single_a3_nb)(
                        params["omega_2"],
                        params["omega_3"],
                        params["kappa"],
                        params["mu3_0"],
                        params["beta"],
                        state_jnp,
                        choices_jnp,
                        reward_jnp,
                        shock_jnp,
                        mask_jnp,
                        delta_hr_jnp,
                    )
        else:
            # 2-level variants
            if _has_alpha:

                def _call_single_c2(  # type: ignore[misc]
                    omega_2_i: jnp.ndarray,
                    beta_i: jnp.ndarray,
                    b_i: jnp.ndarray,
                    alpha_i: jnp.ndarray,
                    gamma_i: jnp.ndarray,
                    state_i: jnp.ndarray,
                    choices_i: jnp.ndarray,
                    reward_i: jnp.ndarray,
                    shock_i: jnp.ndarray,
                    mask_i: jnp.ndarray,
                    dhr_i: jnp.ndarray,
                ) -> Any:
                    return _single_logp(  # type: ignore[return-value]
                        {
                            "omega_2": omega_2_i,
                            "beta": beta_i,
                            "b": b_i,
                            "alpha": alpha_i,
                            "gamma": gamma_i,
                        },
                        state_i,
                        choices_i,
                        reward_i,
                        shock_i,
                        mask_i,
                        dhr_i,
                    )

                per_participant = jax.vmap(_call_single_c2)(
                    params["omega_2"],
                    params["beta"],
                    params["b"],
                    params["alpha"],
                    params["gamma"],
                    state_jnp,
                    choices_jnp,
                    reward_jnp,
                    shock_jnp,
                    mask_jnp,
                    delta_hr_jnp,
                )
            elif _has_gamma:

                def _call_single_b2(  # type: ignore[misc]
                    omega_2_i: jnp.ndarray,
                    beta_i: jnp.ndarray,
                    b_i: jnp.ndarray,
                    gamma_i: jnp.ndarray,
                    state_i: jnp.ndarray,
                    choices_i: jnp.ndarray,
                    reward_i: jnp.ndarray,
                    shock_i: jnp.ndarray,
                    mask_i: jnp.ndarray,
                    dhr_i: jnp.ndarray,
                ) -> Any:
                    return _single_logp(  # type: ignore[return-value]
                        {
                            "omega_2": omega_2_i,
                            "beta": beta_i,
                            "b": b_i,
                            "gamma": gamma_i,
                        },
                        state_i,
                        choices_i,
                        reward_i,
                        shock_i,
                        mask_i,
                        dhr_i,
                    )

                per_participant = jax.vmap(_call_single_b2)(
                    params["omega_2"],
                    params["beta"],
                    params["b"],
                    params["gamma"],
                    state_jnp,
                    choices_jnp,
                    reward_jnp,
                    shock_jnp,
                    mask_jnp,
                    delta_hr_jnp,
                )
            else:
                # model_a 2-level
                if "b" in params:

                    def _call_single_a2b(  # type: ignore[misc]
                        omega_2_i: jnp.ndarray,
                        beta_i: jnp.ndarray,
                        b_i: jnp.ndarray,
                        state_i: jnp.ndarray,
                        choices_i: jnp.ndarray,
                        reward_i: jnp.ndarray,
                        shock_i: jnp.ndarray,
                        mask_i: jnp.ndarray,
                        dhr_i: jnp.ndarray,
                    ) -> Any:
                        return _single_logp(  # type: ignore[return-value]
                            {"omega_2": omega_2_i, "beta": beta_i, "b": b_i},
                            state_i,
                            choices_i,
                            reward_i,
                            shock_i,
                            mask_i,
                            dhr_i,
                        )

                    per_participant = jax.vmap(_call_single_a2b)(
                        params["omega_2"],
                        params["beta"],
                        params["b"],
                        state_jnp,
                        choices_jnp,
                        reward_jnp,
                        shock_jnp,
                        mask_jnp,
                        delta_hr_jnp,
                    )
                else:

                    def _call_single_a2(  # type: ignore[misc]
                        omega_2_i: jnp.ndarray,
                        beta_i: jnp.ndarray,
                        state_i: jnp.ndarray,
                        choices_i: jnp.ndarray,
                        reward_i: jnp.ndarray,
                        shock_i: jnp.ndarray,
                        mask_i: jnp.ndarray,
                        dhr_i: jnp.ndarray,
                    ) -> Any:
                        return _single_logp(  # type: ignore[return-value]
                            {"omega_2": omega_2_i, "beta": beta_i},
                            state_i,
                            choices_i,
                            reward_i,
                            shock_i,
                            mask_i,
                            dhr_i,
                        )

                    per_participant = jax.vmap(_call_single_a2)(
                        params["omega_2"],
                        params["beta"],
                        state_jnp,
                        choices_jnp,
                        reward_jnp,
                        shock_jnp,
                        mask_jnp,
                        delta_hr_jnp,
                    )

        return jnp.sum(per_participant)

    return logp_fn


# ---------------------------------------------------------------------------
# DataFrame array builder (private)
# ---------------------------------------------------------------------------


def _build_arrays_single_patrl(
    sim_df: pd.DataFrame,
    participants: list[str],
) -> dict[str, np.ndarray]:
    """Convert a PAT-RL sim_df to ``(P, n_trials)`` arrays needed by logp.

    Assembles stacked NumPy arrays for all participants listed in
    ``participants``.  The ``delta_hr`` column is included in the returned
    dict for downstream CSV export (Phase 18-05) but is NOT used by the
    Model A logp.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        Must contain: ``participant_id``, ``trial_idx``, ``state``,
        ``choice``, ``reward_mag``, ``shock_mag``, ``delta_hr``,
        ``outcome_time_s``.
    participants : list[str]
        Ordered list of participant identifiers.  Determines row order in
        the stacked output.

    Returns
    -------
    dict[str, numpy.ndarray]
        Keys: ``state``, ``choice``, ``reward_mag``, ``shock_mag``,
        ``delta_hr``, ``trial_mask``.  Each value has shape
        ``(P, n_trials)``.

    Raises
    ------
    KeyError
        If any required column is missing from ``sim_df``.
        Message includes expected columns vs actual columns.
    ValueError
        If participants have inconsistent trial counts or a listed
        participant is absent from ``sim_df``.
    """
    actual_cols = frozenset(sim_df.columns)
    missing_cols = sorted(_REQUIRED_COLUMNS - actual_cols)
    if missing_cols:
        msg = (
            f"sim_df is missing required columns: {missing_cols}. "
            f"Expected: {sorted(_REQUIRED_COLUMNS)}. "
            f"Got: {sorted(actual_cols)}"
        )
        raise KeyError(msg)

    n_trials_per_participant: list[int] = []
    rows: dict[str, list[np.ndarray]] = {
        "state": [],
        "choice": [],
        "reward_mag": [],
        "shock_mag": [],
        "delta_hr": [],
    }

    for pid in participants:
        subset = sim_df[sim_df["participant_id"] == str(pid)]
        if subset.empty:
            msg = (
                f"Participant {pid!r} not found in sim_df. "
                f"Available: {sorted(sim_df['participant_id'].unique())}"
            )
            raise ValueError(msg)
        subset = subset.sort_values("trial_idx")
        n = len(subset)
        n_trials_per_participant.append(n)

        rows["state"].append(subset["state"].to_numpy(dtype=np.int32))
        rows["choice"].append(subset["choice"].to_numpy(dtype=np.int32))
        rows["reward_mag"].append(subset["reward_mag"].to_numpy(dtype=np.float32))
        rows["shock_mag"].append(subset["shock_mag"].to_numpy(dtype=np.float32))
        # delta_hr cast to float64 for fp64 invariant (Decision 118):
        # Models B/C pass this into JAX scan via float64 HGF attributes path.
        rows["delta_hr"].append(subset["delta_hr"].to_numpy(dtype=np.float64))

    # Validate uniform trial counts
    unique_counts = set(n_trials_per_participant)
    if len(unique_counts) != 1:
        msg = (
            f"Participants have inconsistent trial counts: {unique_counts}. "
            "All participants must have the same number of trials."
        )
        raise ValueError(msg)

    stacked: dict[str, np.ndarray] = {k: np.stack(v, axis=0) for k, v in rows.items()}
    n_trials = n_trials_per_participant[0]
    stacked["trial_mask"] = np.ones((len(participants), n_trials), dtype=np.bool_)
    return stacked


# ---------------------------------------------------------------------------
# Prior log-probability helper (private)
# ---------------------------------------------------------------------------


def _build_patrl_log_posterior(
    logp_fn: Any,
    config: PATRLConfig,
    model_name: str,
    response_model: str = "model_a",
) -> Any:
    """Build a pure-JAX log-posterior combining PAT-RL priors + logp.

    Parameters
    ----------
    logp_fn : callable
        Batched logp from :func:`build_logp_fn_batched_patrl`.
    config : PATRLConfig
        PAT-RL configuration (priors read from ``config.fitting.priors``).
    model_name : str
        PAT-RL model variant.
    response_model : str, default "model_a"
        Response model; controls which additional priors are included.
        ``"model_a"`` always adds a prior on ``b`` (from Plan 20-02 onwards,
        ``b`` is always sampled with prior N(b.mean, b.sd)).
        ``"model_b"`` additionally adds ``gamma``.
        ``"model_c"`` additionally adds ``alpha``.
        ``"model_d"`` additionally adds ``lam`` (trial-varying omega coupling).

    Returns
    -------
    logdensity_fn : callable
        ``dict[str, jnp.ndarray] -> scalar``.
    """
    import jax.scipy.stats as jss

    priors = config.fitting.priors
    is_3level = model_name == "hgf_3level_patrl"
    _has_gamma = response_model in ("model_b", "model_c")
    _has_alpha = response_model == "model_c"
    _has_lam = response_model == "model_d"

    # omega_2: Gaussian (unrestricted); in practice always negative
    _om2_mean = float(priors.omega_2.mean)
    _om2_sd = float(priors.omega_2.sd)
    # log_beta: parameterise beta in log-space so NUTS can explore freely.
    # Prior on log_beta ~ N(log(prior_beta.mean), prior_beta.sd / prior_beta.mean)
    # (delta method approximation; keeps prior centred near prior_beta.mean).
    _beta_mean = float(priors.beta.mean)
    _beta_sd = float(priors.beta.sd)
    _log_beta_mean = float(np.log(max(_beta_mean, 1e-9)))
    _log_beta_sd = _beta_sd / max(_beta_mean, 1e-9)

    # Response-model parameter priors (closure-style, using jax.scipy.stats.norm)
    _b_mean = float(priors.b.mean)
    _b_sd = float(priors.b.sd)

    if is_3level:
        _om3_mean = float(priors.omega_3.mean)
        _om3_sd = float(priors.omega_3.sd)
        _kappa_mean = float(priors.kappa.mean)
        _kappa_sd = float(priors.kappa.sd)
        _kappa_lower = float(priors.kappa.lower)
        _kappa_upper = float(priors.kappa.upper)
        _mu3_mean = float(priors.mu3_0.mean)
        _mu3_sd = float(priors.mu3_0.sd)

    if _has_gamma:
        _gamma_mean = float(priors.gamma.mean)
        _gamma_sd = float(priors.gamma.sd)

    if _has_alpha:
        _alpha_mean = float(priors.alpha.mean)
        _alpha_sd = float(priors.alpha.sd)

    if _has_lam:
        _lam_mean = float(priors.lam.mean)
        _lam_sd = float(priors.lam.sd)

    def logdensity_fn(params: dict[str, jnp.ndarray]) -> Any:
        """Compute log-posterior = prior log-prob + log-likelihood.

        Parameters
        ----------
        params : dict[str, jnp.ndarray]
            Parameter dict.  Each value has shape ``(P,)``.
            Required: ``omega_2``, ``log_beta``, ``b``.
            For 3-level: also ``omega_3``, ``kappa``, ``mu3_0``.
            For Model B/C: also ``gamma``.
            For Model C: also ``alpha``.
            For Model D: also ``lam``.

        Returns
        -------
        jnp.ndarray
            Scalar log-posterior.
        """
        omega_2 = params["omega_2"]
        log_beta = params["log_beta"]
        beta = jnp.exp(log_beta)
        b = params["b"]

        prior_lp = jnp.sum(jss.norm.logpdf(omega_2, loc=_om2_mean, scale=_om2_sd))
        prior_lp = prior_lp + jnp.sum(
            jss.norm.logpdf(log_beta, loc=_log_beta_mean, scale=_log_beta_sd)
        )
        # b is always sampled for Models A+b, B, C (Plan 20-02 forward)
        prior_lp = prior_lp + jnp.sum(jss.norm.logpdf(b, loc=_b_mean, scale=_b_sd))

        if _has_gamma:
            gamma = params["gamma"]
            prior_lp = prior_lp + jnp.sum(
                jss.norm.logpdf(gamma, loc=_gamma_mean, scale=_gamma_sd)
            )
        if _has_alpha:
            alpha = params["alpha"]
            prior_lp = prior_lp + jnp.sum(
                jss.norm.logpdf(alpha, loc=_alpha_mean, scale=_alpha_sd)
            )
        if _has_lam:
            # Model D: lam is a linear ΔHR→omega coupling coefficient.
            # Prior: Normal(lam.mean, lam.sd) — small sd because 1 bpm ΔHR
            # should shift tonic_volatility by ~lam (i.e. ~0.1).
            lam = params["lam"]
            prior_lp = prior_lp + jnp.sum(
                jss.norm.logpdf(lam, loc=_lam_mean, scale=_lam_sd)
            )

        if is_3level:
            omega_3 = params["omega_3"]
            kappa = params["kappa"]
            mu3_0 = params["mu3_0"]
            prior_lp = prior_lp + jnp.sum(
                jss.norm.logpdf(omega_3, loc=_om3_mean, scale=_om3_sd)
            )
            # TruncatedNormal for kappa (positive coupling)
            # Using clipped Gaussian; TruncatedNormal via numpyro avoided to
            # keep this closure numpyro-free.
            prior_lp = prior_lp + jnp.sum(
                jss.norm.logpdf(kappa, loc=_kappa_mean, scale=_kappa_sd)
            )
            prior_lp = prior_lp + jnp.sum(
                jss.norm.logpdf(mu3_0, loc=_mu3_mean, scale=_mu3_sd)
            )

            base_params: dict[str, jnp.ndarray] = {
                "omega_2": omega_2,
                "omega_3": omega_3,
                "kappa": kappa,
                "mu3_0": mu3_0,
                "beta": beta,
                "b": b,
            }
            if _has_gamma:
                base_params["gamma"] = gamma
            if _has_alpha:
                base_params["alpha"] = alpha
            if _has_lam:
                base_params["lam"] = lam
            likelihood_lp = logp_fn(base_params)
        else:
            base_params = {"omega_2": omega_2, "beta": beta, "b": b}
            if _has_gamma:
                base_params["gamma"] = gamma
            if _has_alpha:
                base_params["alpha"] = alpha
            if _has_lam:
                base_params["lam"] = lam
            likelihood_lp = logp_fn(base_params)

        return prior_lp + likelihood_lp

    return logdensity_fn


# ---------------------------------------------------------------------------
# Public entry point
# ---------------------------------------------------------------------------


def fit_batch_hierarchical_patrl(
    sim_df: pd.DataFrame,
    model_name: str = "hgf_2level_patrl",
    response_model: str = "model_a",
    config: PATRLConfig | None = None,
    n_chains: int | None = None,
    n_tune: int | None = None,
    n_draws: int | None = None,
    target_accept: float | None = None,
    random_seed: int | None = None,
) -> az.InferenceData:
    """Fit PAT-RL Model A to a batched cohort via BlackJAX NUTS.

    Reads participant data from ``sim_df``, builds a pure-JAX log-posterior
    (priors from ``config.fitting.priors`` + HGF log-likelihood), and runs
    NUTS with window adaptation via the generic :func:`_run_blackjax_nuts`
    helper from :mod:`prl_hgf.fitting.hierarchical`.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        Trial-level data.  Must contain: ``participant_id``, ``trial_idx``,
        ``state``, ``choice``, ``reward_mag``, ``shock_mag``, ``delta_hr``,
        ``outcome_time_s``.
    model_name : {"hgf_2level_patrl", "hgf_3level_patrl"}
        PAT-RL HGF variant.
    response_model : str
        Only ``"model_a"`` is supported in Phase 18.  Models B/C/D are
        deferred to Phase 19+.
    config : PATRLConfig or None
        If ``None``, :func:`~prl_hgf.env.pat_rl_config.load_pat_rl_config`
        is called to load the default ``configs/pat_rl.yaml``.
    n_chains : int or None
        Number of MCMC chains.  Overrides ``config.fitting.n_chains``.
    n_tune : int or None
        Number of warmup steps.  Overrides ``config.fitting.n_tune``.
    n_draws : int or None
        Posterior draws per chain.  Overrides ``config.fitting.n_draws``.
    target_accept : float or None
        NUTS target acceptance rate.  Overrides
        ``config.fitting.target_accept``.
    random_seed : int or None
        Base random seed.  Overrides ``config.fitting.random_seed``.

    Returns
    -------
    arviz.InferenceData
        Posterior with a ``participant`` coordinate on every parameter.
        The ``log_beta`` samples are present; ``beta = exp(log_beta)`` is
        added as a deterministic variable.

    Raises
    ------
    NotImplementedError
        If ``response_model != 'model_a'``.
    ValueError
        If ``model_name`` is not a recognised PAT-RL variant or ``sim_df``
        is missing required columns.

    Notes
    -----
    ``_run_blackjax_nuts`` is imported from
    :mod:`prl_hgf.fitting.hierarchical` unchanged.  The PAT-RL
    ``logdensity_fn`` is closure-based (not the traced-arg sample loop),
    so the XLA cache warm-up optimisation from Phase 17 (Quick-003) does
    not apply here.  This is acceptable for Phase 18 smoke runs; the
    traced-arg extension is planned for Phase 19.
    """
    if response_model not in ("model_a", "model_b", "model_c", "model_d"):
        raise NotImplementedError(
            f"response_model={response_model!r}: supported are "
            f"'model_a', 'model_b', 'model_c', 'model_d'."
        )

    if model_name not in _PATRL_MODEL_NAMES:
        msg = f"model_name must be one of {_PATRL_MODEL_NAMES}, got {model_name!r}"
        raise ValueError(msg)

    if config is None:
        config = load_pat_rl_config()

    # Merge MCMC overrides with config defaults.
    _n_chains = int(n_chains if n_chains is not None else config.fitting.n_chains)
    _n_tune = int(n_tune if n_tune is not None else config.fitting.n_tune)
    _n_draws = int(n_draws if n_draws is not None else config.fitting.n_draws)
    _target_accept = float(
        target_accept if target_accept is not None else config.fitting.target_accept
    )
    _random_seed = int(
        random_seed if random_seed is not None else config.fitting.random_seed
    )

    # ------------------------------------------------------------------
    # 1. Extract participant list and build arrays.
    # ------------------------------------------------------------------
    participants: list[str] = sorted(sim_df["participant_id"].astype(str).unique())
    n_participants = len(participants)

    arrays = _build_arrays_single_patrl(sim_df, participants)

    # ------------------------------------------------------------------
    # 2. Build batched logp.
    # ------------------------------------------------------------------
    logp_fn = build_logp_fn_batched_patrl(
        state_arr=arrays["state"],
        choices_arr=arrays["choice"],
        reward_mag_arr=arrays["reward_mag"],
        shock_mag_arr=arrays["shock_mag"],
        trial_mask=arrays["trial_mask"],
        model_name=model_name,
        response_model=response_model,
        delta_hr_arr=arrays.get("delta_hr"),
    )

    # ------------------------------------------------------------------
    # 3. Build pure-JAX log-posterior (prior + likelihood).
    # ------------------------------------------------------------------
    logdensity_fn = _build_patrl_log_posterior(
        logp_fn, config, model_name, response_model=response_model
    )

    # ------------------------------------------------------------------
    # 4. Construct initial parameter positions at prior means.
    # ------------------------------------------------------------------
    priors = config.fitting.priors
    is_3level = model_name == "hgf_3level_patrl"

    _beta_mean = float(priors.beta.mean)
    init_log_beta = float(np.log(max(_beta_mean, 1e-6)))

    initial_position: dict[str, jnp.ndarray] = {
        "omega_2": jnp.full((n_participants,), priors.omega_2.mean),
        "log_beta": jnp.full((n_participants,), init_log_beta),
        "b": jnp.full((n_participants,), priors.b.mean),
    }
    if is_3level:
        initial_position["omega_3"] = jnp.full((n_participants,), priors.omega_3.mean)
        # Clip kappa init into truncated-normal support.
        kappa_init = float(
            np.clip(
                priors.kappa.mean, priors.kappa.lower + 1e-6, priors.kappa.upper - 1e-6
            )
        )
        initial_position["kappa"] = jnp.full((n_participants,), kappa_init)
        initial_position["mu3_0"] = jnp.full((n_participants,), priors.mu3_0.mean)
    if response_model in ("model_b", "model_c"):
        initial_position["gamma"] = jnp.full((n_participants,), priors.gamma.mean)
    if response_model == "model_c":
        initial_position["alpha"] = jnp.full((n_participants,), priors.alpha.mean)
    if response_model == "model_d":
        initial_position["lam"] = jnp.full((n_participants,), priors.lam.mean)

    # ------------------------------------------------------------------
    # 5. Run BlackJAX NUTS (reuse generic helper from hierarchical.py).
    # ------------------------------------------------------------------
    rng_key = jax.random.PRNGKey(_random_seed)

    positions, sample_stats, n_chains_actual, _adapted = _run_blackjax_nuts(
        logdensity_fn=logdensity_fn,
        initial_position=initial_position,
        rng_key=rng_key,
        n_tune=_n_tune,
        n_draws=_n_draws,
        n_chains=_n_chains,
        target_accept=_target_accept,
        # batched_logp_fn=None → fallback to closure-based legacy path
        # (traced-arg XLA cache reuse deferred to Phase 19).
        batched_logp_fn=None,
    )

    # ------------------------------------------------------------------
    # 6. Convert to ArviZ InferenceData.
    # ------------------------------------------------------------------
    # Build var_names list including derived beta.
    _sampled_keys = list(initial_position.keys())
    var_names = _sampled_keys + ["beta"]

    # _samples_to_idata expects participant_groups and participant_sessions;
    # supply defaults since PAT-RL sim_df may not have group/session columns.
    if "group" in sim_df.columns:
        pgroup_map = (
            sim_df[["participant_id", "group"]]
            .drop_duplicates()
            .set_index("participant_id")["group"]
            .to_dict()
        )
        participant_groups = [str(pgroup_map.get(p, "unknown")) for p in participants]
    else:
        participant_groups = ["unknown"] * n_participants

    if "session" in sim_df.columns:
        psession_map = (
            sim_df[["participant_id", "session"]]
            .drop_duplicates()
            .set_index("participant_id")["session"]
            .to_dict()
        )
        participant_sessions = [
            str(psession_map.get(p, "session_1")) for p in participants
        ]
    else:
        participant_sessions = ["session_1"] * n_participants

    idata = _samples_to_idata(
        positions=positions,
        sample_stats=sample_stats,
        var_names=var_names,
        participant_ids=participants,
        participant_groups=participant_groups,
        participant_sessions=participant_sessions,
        model_name=model_name,
        coord_name="participant_id",
    )

    return idata
