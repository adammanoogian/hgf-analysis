"""Lipschitz / LLE numerical scan for HGF Phase 25 Plan 01.

Purpose
-------
Verify that the 3-level binary HGF satisfies the predictability/contraction
conditions of arXiv:2508.16817 (Gonzalez et al. 2025) required for
ELK/PIEKS convergence guarantees.

For each of 100 representative parameter vectors × 4 input regimes the script:

1. Builds a 1-participant synthetic HGF cohort with T=420 trials.
2. Runs pyhgf sequentially to obtain the reference state trajectory.
3. At each trial t computes J_t = jax.jacobian(hgf_step, argnums=0)(state_t).
4. Estimates lambda_hat via the geometric-mean spectral-radius method:
       lambda_hat = mean_t( log(spectral_radius(J_t)) )
   This is the finite-sample surrogate for the Largest Lyapunov Exponent
   (Eq. 5 of arXiv:2508.16817).  The renormalized matrix-product method
   is also computed for cross-validation.
5. Records max singular value and num_trials_sigma_gt_1 (failure-mode flag).

Parameter-vector source
-----------------------
Phase 14.2 posterior chains: NOT available (Phase 14 pending per ROADMAP).
FALLBACK: wide prior sweep with numpy.random.default_rng(seed=25_01).

Prior ranges (from configs/prl_analysis.yaml + hierarchical.py):
  omega_2  : Uniform[-6, -2]   (typical posterior region)
  omega_3  : Uniform[-8, -2]   (yaml: lower -12, upper 0; restrict to posterior-like)
  kappa    : fixed 1.0          (_KAPPA_FIXED in hierarchical.py:76)
  beta     : Uniform[0.5, 4.0] (yaml: lower 0.01, upper 20; restrict to typical)
  zeta     : Uniform[-1.0, 1.0] (yaml: lower -5, upper 5; restrict to posterior-like)

Input regimes (cross-regime sensitivity analysis — amendment 2026-04-27)
-------------------------------------------------------------------------
All four regimes use round-robin cue selection (cue = i % 3) for fair
comparison; only the *outcome* generation differs:

  round_robin : stationary Bernoulli(0.7) — original baseline
  grw         : Gaussian-random-walk outcome probability (slow drift)
  oddball     : stationary Bernoulli(0.7) + 5% rare flipped trials
  reversal    : 4-phase block-reversal [0.7, 0.3, 0.7, 0.3] matching PRL

State representation
--------------------
Single-branch (cue-0) 4-dimensional state:
  index 0: mu_1  = attributes[1]["mean"]       (level-1 posterior mean)
  index 1: pi_1  = attributes[1]["precision"]  (level-1 posterior precision)
  index 2: mu_2  = attributes[6]["mean"]       (volatility posterior mean)
  index 3: pi_2  = attributes[6]["precision"]  (volatility posterior precision)

The Jacobian is 4x4 (state_dim=4).

LLE estimation method
---------------------
PRIMARY: Benettin QR renormalized matrix-product (correct LLE definition):
  lambda_hat_qr = (1/T) * sum_t log|r_11^(t)|  (Benettin et al. 1980)
This correctly estimates the LARGEST Lyapunov exponent by tracking the
most expansive direction via QR decomposition at each step.

SECONDARY (archived): geometric-mean spectral-radius (GMSR) estimator:
  lambda_hat_gmsr = mean_t( log(spectral_radius(J_t)) )
This approximates the Lyapunov exponent but is biased when precision
components grow monotonically (spectral radius = 1.0 for precision trials).
For HGF, pi_1 grows monotonically, causing GMSR to be biased toward 0.

VERDICT criterion: lambda_hat_qr < 0 (negative leading Lyapunov exponent)
All 100 vectors × 4 regimes show negative QR lambda_hat.

Outputs
-------
  results/lipschitz_lle_distribution.csv         (400 rows: 4 regimes × 100)
  results/jacobian_spectral_radius_per_trial.csv (168,000 rows: 4 × 100 × 420)

Usage
-----
    python .planning/phases/25-parallel-scan-acceleration-research/scratch/lipschitz_scan.py

Expected output (final summary line):
    N=100 vectors × 4 regimes scanned.  lambda_hat: median=X, p5=Y, p95=Z.
    Failure-mode count (lambda >= 0): K vectors.

Author: Phase 25-01 executor
Date:   2026-04-27 (amended 2026-04-27 for cross-regime scan)
"""
from __future__ import annotations

import csv
import os
import sys
import time

# -------------------------------------------------------------------------
# CRITICAL: JAX float64 mode — must be set BEFORE any jax import.
# Without this, jax.lax.cond in pyhgf's posterior_update_precision_continuous_node
# raises TypeError (float32 vs float64 mismatch).  Documented as Risk #6 in
# Phase 25-00b API_BRIDGING_STUDY.md.
# -------------------------------------------------------------------------
os.environ["JAX_ENABLE_X64"] = "1"

# Ensure src/ is importable regardless of working directory.
_SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
_PROJECT_ROOT = os.path.normpath(os.path.join(_SCRIPT_DIR, "..", "..", "..", ".."))
if os.path.join(_PROJECT_ROOT, "src") not in sys.path:
    sys.path.insert(0, os.path.join(_PROJECT_ROOT, "src"))

import numpy as np
import jax
import jax.numpy as jnp

from prl_hgf.models.hgf_3level import build_3level_network

# -------------------------------------------------------------------------
# Configuration
# -------------------------------------------------------------------------

N_VECTORS = 100        # number of parameter vectors per regime
T = 420                # production trial count (pick_best_cue per configs/prl_analysis.yaml)
SEED = 25_01           # RNG seed — wide prior sweep (Phase 14.2 chains not available)
KAPPA_FIXED = 1.0      # _KAPPA_FIXED from src/prl_hgf/fitting/hierarchical.py:76
QR_RENORM_EVERY = 10   # renormalize matrix product every this many steps

# Cross-regime sensitivity analysis (amendment 2026-04-27)
# Four input regimes, same cue-cycling, differing outcome distributions.
REGIMES = ["round_robin", "grw", "oddball", "reversal"]

# Prior ranges — restricted to posterior-like region
# Source: configs/prl_analysis.yaml + prior-phase notes
OMEGA_2_RANGE = (-6.0, -2.0)    # yaml lower -8, upper 2; restrict to posterior core
OMEGA_3_RANGE = (-8.0, -2.0)    # yaml lower -12, upper 0; restrict to posterior-like
BETA_RANGE = (0.5, 4.0)         # yaml lower 0.01, upper 20; restrict to typical
ZETA_RANGE = (-1.0, 1.0)        # yaml lower -5, upper 5; restrict to posterior-like

# Output paths (relative to project root)
_RESULTS_DIR = os.path.join(_SCRIPT_DIR, "..", "results")
LLE_CSV = os.path.join(_RESULTS_DIR, "lipschitz_lle_distribution.csv")
SR_CSV = os.path.join(_RESULTS_DIR, "jacobian_spectral_radius_per_trial.csv")


# -------------------------------------------------------------------------
# Step 1: Draw parameter vectors — wide prior sweep (fallback)
# -------------------------------------------------------------------------

def draw_parameter_vectors(
    n: int,
    seed: int,
) -> np.ndarray:
    """Draw parameter vectors from wide prior sweep.

    Parameters
    ----------
    n : int
        Number of vectors to draw.
    seed : int
        RNG seed for reproducibility.

    Returns
    -------
    np.ndarray
        Shape (n, 5) with columns [omega_2, omega_3, kappa, beta, zeta].

    Notes
    -----
    Phase 14.2 posterior chains are NOT available (Phase 14 pending per
    ROADMAP).  Using wide prior sweep as documented fallback (25-01-PLAN.md
    Step 1, FALLBACK branch).  Seed = 25_01 per plan specification.
    """
    rng = np.random.default_rng(seed)
    omega_2 = rng.uniform(*OMEGA_2_RANGE, size=n)
    omega_3 = rng.uniform(*OMEGA_3_RANGE, size=n)
    kappa = np.full(n, KAPPA_FIXED)
    beta = rng.uniform(*BETA_RANGE, size=n)
    zeta = rng.uniform(*ZETA_RANGE, size=n)
    return np.column_stack([omega_2, omega_3, kappa, beta, zeta])


# -------------------------------------------------------------------------
# Step 2: Synthetic input sequence generators (4 regimes)
#
# All four regimes use round-robin cue selection (cue = i % 3) for fair
# per-cue trial-frequency comparison.  Only outcome generation differs.
# Amendment 2026-04-27: original make_synthetic_inputs was Bernoulli(0.7)
# stationary (now "round_robin" regime).  Three new regimes added.
# -------------------------------------------------------------------------

def make_round_robin_inputs(
    t: int,
    seed: int,
) -> tuple[np.ndarray, np.ndarray]:
    """Existing baseline: round-robin cue, stationary Bernoulli(0.7).

    Parameters
    ----------
    t : int
        Number of trials.
    seed : int
        Per-participant seed for reproducible sequences.

    Returns
    -------
    input_data : np.ndarray
        Shape (T, 3), float64.  Reward signal for each of 3 cues.
    observed : np.ndarray
        Shape (T, 3), int32.  Observation mask (1 = observed).
    """
    rng = np.random.default_rng(seed)
    input_data = np.zeros((t, 3), dtype=np.float64)
    observed = np.zeros((t, 3), dtype=np.int32)
    for i in range(t):
        cue = i % 3
        if rng.random() < 0.7:
            input_data[i, cue] = 1.0
        observed[i, cue] = 1
    return input_data, observed


# Backward-compatibility alias (original name preserved)
make_synthetic_inputs = make_round_robin_inputs


def make_grw_inputs(
    t: int,
    seed: int,
) -> tuple[np.ndarray, np.ndarray]:
    """Gaussian-random-walk outcome probability, slow drift.

    Outcome probability drifts as a random walk clipped to [0.05, 0.95],
    probing HGF contraction under non-stationary reward statistics.

    Parameters
    ----------
    t : int
        Number of trials.
    seed : int
        Per-participant seed for reproducible sequences.

    Returns
    -------
    input_data : np.ndarray
        Shape (T, 3), float64.
    observed : np.ndarray
        Shape (T, 3), int32.
    """
    rng = np.random.default_rng(seed)
    p = np.clip(0.5 + np.cumsum(0.03 * rng.standard_normal(t)), 0.05, 0.95)
    input_data = np.zeros((t, 3), dtype=np.float64)
    observed = np.zeros((t, 3), dtype=np.int32)
    for i in range(t):
        cue = i % 3
        if rng.random() < p[i]:
            input_data[i, cue] = 1.0
        observed[i, cue] = 1
    return input_data, observed


def make_oddball_inputs(
    t: int,
    seed: int,
) -> tuple[np.ndarray, np.ndarray]:
    """Stationary Bernoulli(0.7) with 5% rare flipped trials.

    Each trial has a 5% chance of having its outcome flipped, producing
    transient large prediction errors without changing the stationary mean.
    Tests whether oddball PE spikes localize sr >= 1 events.

    Parameters
    ----------
    t : int
        Number of trials.
    seed : int
        Per-participant seed for reproducible sequences.

    Returns
    -------
    input_data : np.ndarray
        Shape (T, 3), float64.
    observed : np.ndarray
        Shape (T, 3), int32.
    """
    rng = np.random.default_rng(seed)
    input_data = np.zeros((t, 3), dtype=np.float64)
    observed = np.zeros((t, 3), dtype=np.int32)
    for i in range(t):
        cue = i % 3
        base = rng.random() < 0.7
        flip = rng.random() < 0.05
        if base ^ flip:
            input_data[i, cue] = 1.0
        observed[i, cue] = 1
    return input_data, observed


def make_reversal_inputs(
    t: int,
    seed: int,
) -> tuple[np.ndarray, np.ndarray]:
    """4-phase block-reversal: 0.7 / 0.3 / 0.7 / 0.3.

    Matches the PRL acquisition→reversal pattern (configs/prl_analysis.yaml
    4-phase structure).  Tests whether phase boundaries produce sr >= 1 spikes
    localized at the reversal onset.

    Parameters
    ----------
    t : int
        Number of trials.
    seed : int
        Per-participant seed for reproducible sequences.

    Returns
    -------
    input_data : np.ndarray
        Shape (T, 3), float64.
    observed : np.ndarray
        Shape (T, 3), int32.
    """
    rng = np.random.default_rng(seed)
    n = t // 4
    p_blocks = [0.7, 0.3, 0.7, 0.3]
    input_data = np.zeros((t, 3), dtype=np.float64)
    observed = np.zeros((t, 3), dtype=np.int32)
    for i in range(t):
        cue = i % 3
        phase = min(i // n, 3)
        if rng.random() < p_blocks[phase]:
            input_data[i, cue] = 1.0
        observed[i, cue] = 1
    return input_data, observed


# Dispatch table keyed by REGIMES list
_INPUT_GENERATORS: dict[str, callable] = {
    "round_robin": make_round_robin_inputs,
    "grw": make_grw_inputs,
    "oddball": make_oddball_inputs,
    "reversal": make_reversal_inputs,
}


# -------------------------------------------------------------------------
# Step 3: Build hgf_step wrapper (reused from 25-00b api_bridging_probe.py)
# -------------------------------------------------------------------------

def build_hgf_step(
    omega_2: float,
    omega_3: float,
    kappa: float,
) -> tuple:
    """Build hgf_step function and initial attributes for given parameters.

    Parameters
    ----------
    omega_2 : float
        Tonic volatility at level 1.
    omega_3 : float
        Meta-volatility (level 2).
    kappa : float
        Coupling strength (fixed at 1.0).

    Returns
    -------
    hgf_step : callable
        Pure function hgf_step(attrs, input_t) -> (attrs', state_t).
    initial_attrs : dict
        Initial pyhgf attributes dict.
    scan_fn : callable
        pyhgf beliefs_propagation scan function (for reference trajectory).

    Notes
    -----
    Pattern from scratch/api_bridging_probe.py (Phase 25-00b).
    scan_fn captures edges and update_sequence as time-invariant closures —
    safe for pick_best_cue fixed graph topology.
    """
    # Build a network with a dummy 1-trial run to initialize scan_fn
    net_for_scan = build_3level_network(
        omega_2=omega_2, omega_3=omega_3, kappa=kappa
    )
    dummy_input = np.zeros((1, 3), dtype=np.float64)
    dummy_obs = np.zeros((1, 3), dtype=np.int32)
    net_for_scan.input_data(input_data=dummy_input, observed=dummy_obs)
    scan_fn = net_for_scan.scan_fn

    # Clean initial attributes — from a fresh network (no forward pass)
    net_clean = build_3level_network(
        omega_2=omega_2, omega_3=omega_3, kappa=kappa
    )
    initial_attrs = net_clean.attributes

    def hgf_step(
        attrs: dict,
        input_t: tuple,
    ) -> tuple[dict, tuple]:
        """Run one HGF trial using pyhgf beliefs_propagation.

        Parameters
        ----------
        attrs : dict
            pyhgf attributes dict-of-dicts (full dynamical state).
        input_t : tuple
            (values_t, observed_t, time_step_t, rng_key) per-trial input.

        Returns
        -------
        new_attrs : dict
            Updated attributes after this trial.
        state_t : tuple
            (mu_1, pi_1, mu_2, pi_2) scalars extracted from updated state.
        """
        new_attrs, _ = scan_fn(attrs, input_t)
        state_t = (
            new_attrs[1]["mean"],
            new_attrs[1]["precision"],
            new_attrs[6]["mean"],
            new_attrs[6]["precision"],
        )
        return new_attrs, state_t

    return hgf_step, initial_attrs, scan_fn


# -------------------------------------------------------------------------
# Step 4: Vectorised Jacobian computation using vmap over trials
# -------------------------------------------------------------------------

def make_batched_jacobian_fn(
    hgf_step,
    initial_attrs: dict,
) -> callable:
    """Build a batched Jacobian function over all T trials.

    Compiles a single jax.jacobian function that accepts explicit per-trial
    input arrays, then uses jax.vmap to evaluate it over all T trials.
    This avoids the 420-separate-compilation problem.

    Parameters
    ----------
    hgf_step : callable
        Per-trial HGF step.
    initial_attrs : dict
        Template attributes dict for state injection.

    Returns
    -------
    callable
        batched_jac(state_traj, values_arr, obs_arr) -> (T, 4, 4) Jacobians.
        state_traj: (T, 4) reference trajectory
        values_arr: (T, 3) float64 input values
        obs_arr: (T, 3) float64 observation mask
    """
    # Build a single-trial state-step function that takes explicit input arrays
    # (not closures over pre-sliced arrays) so vmap can map over them.
    def state_step_explicit(
        s: jnp.ndarray,
        values_t: jnp.ndarray,
        obs_t: jnp.ndarray,
    ) -> jnp.ndarray:
        """One HGF update: state (4,) -> state (4,) with explicit inputs.

        Parameters
        ----------
        s : jnp.ndarray
            Shape (4,): [mu_1, pi_1, mu_2, pi_2].
        values_t : jnp.ndarray
            Shape (3,): per-trial reward observation per cue.
        obs_t : jnp.ndarray
            Shape (3,): per-trial observation mask (float64).

        Returns
        -------
        jnp.ndarray
            Shape (4,): updated state.
        """
        # Inject state into attrs
        attrs = dict(initial_attrs)
        node1 = dict(attrs[1])
        node1["mean"] = s[0]
        node1["precision"] = s[1]
        attrs[1] = node1
        node6 = dict(attrs[6])
        node6["mean"] = s[2]
        node6["precision"] = s[3]
        attrs[6] = node6

        # Convert flat arrays to pyhgf input format:
        # values: tuple of 3 arrays each shape (1,)
        # observed: tuple of 3 scalar floats
        # time_step: scalar float64
        values_in = tuple(values_t[i : i + 1] for i in range(3))
        obs_in = tuple(obs_t[i] for i in range(3))
        input_t = (values_in, obs_in, jnp.float64(1.0), None)

        new_attrs, state_out = hgf_step(attrs, input_t)
        return jnp.array(
            [state_out[0], state_out[1], state_out[2], state_out[3]]
        )

    # jac_fn(s, values_t, obs_t) -> (4, 4) Jacobian w.r.t. s
    jac_fn = jax.jacobian(state_step_explicit, argnums=0)

    # Vectorise over trials: each row of state_traj, values_arr, obs_arr
    # is one trial.
    batched_jac = jax.vmap(jac_fn, in_axes=(0, 0, 0))

    return batched_jac


# -------------------------------------------------------------------------
# Step 5: Reference trajectory via pyhgf lax.scan
# -------------------------------------------------------------------------

def run_reference_trajectory(
    omega_2: float,
    omega_3: float,
    kappa: float,
    input_data: np.ndarray,
    observed: np.ndarray,
) -> np.ndarray:
    """Run pyhgf sequential forward pass to get reference state trajectory.

    Parameters
    ----------
    omega_2 : float
        Tonic volatility.
    omega_3 : float
        Meta-volatility.
    kappa : float
        Coupling strength.
    input_data : np.ndarray
        Shape (T, 3), float64.
    observed : np.ndarray
        Shape (T, 3), int32.

    Returns
    -------
    np.ndarray
        Shape (T, 4) — state trajectory [mu_1, pi_1, mu_2, pi_2] per trial.
    """
    net = build_3level_network(omega_2=omega_2, omega_3=omega_3, kappa=kappa)
    net.input_data(input_data=input_data, observed=observed)
    traj = net.node_trajectories
    mu_1 = np.asarray(traj[1]["mean"])
    pi_1 = np.asarray(traj[1]["precision"])
    mu_2 = np.asarray(traj[6]["mean"])
    pi_2 = np.asarray(traj[6]["precision"])
    return np.stack([mu_1, pi_1, mu_2, pi_2], axis=1)  # (T, 4)


# -------------------------------------------------------------------------
# Step 6: Jacobian computation per trial (vectorised via vmap)
# -------------------------------------------------------------------------

def compute_jacobians(
    hgf_step,
    initial_attrs: dict,
    input_data: np.ndarray,
    observed: np.ndarray,
    state_traj: np.ndarray,
) -> list[np.ndarray]:
    """Compute per-trial Jacobians using vmap over all T trials.

    Parameters
    ----------
    hgf_step : callable
        Per-trial HGF step.
    initial_attrs : dict
        Template attributes dict.
    input_data : np.ndarray
        Shape (T, 3) float64 reward observations.
    observed : np.ndarray
        Shape (T, 3) int32 observation masks.
    state_traj : np.ndarray
        Shape (T, 4) reference trajectory.

    Returns
    -------
    list[np.ndarray]
        Length T list of (4, 4) Jacobian matrices.

    Notes
    -----
    Uses jax.vmap over the batched Jacobian function to evaluate all T
    Jacobians in a single JIT-compiled call.  This avoids 420 separate
    JAX tracings and reduces wall time from ~minutes to ~seconds per vector.
    """
    batched_jac = make_batched_jacobian_fn(hgf_step, initial_attrs)

    state_arr = jnp.array(state_traj, dtype=jnp.float64)   # (T, 4)
    values_arr = jnp.array(input_data, dtype=jnp.float64)  # (T, 3)
    obs_arr = jnp.array(observed, dtype=jnp.float64)        # (T, 3)

    jacs = batched_jac(state_arr, values_arr, obs_arr)      # (T, 4, 4)
    return [np.asarray(jacs[t]) for t in range(state_traj.shape[0])]


# -------------------------------------------------------------------------
# Step 7: LLE estimation (GMSR and QR methods)
# -------------------------------------------------------------------------

def estimate_lle_gmsr(jacobians: list[np.ndarray]) -> float:
    """Geometric-mean spectral-radius LLE estimator.

    lambda_hat = (1/T) * sum_t log(spectral_radius(J_t))

    This is the average log-spectral-radius, which approximates the LLE
    for ergodic systems.  Documented as the primary method for this scan.

    Parameters
    ----------
    jacobians : list[np.ndarray]
        Per-trial (4, 4) Jacobian matrices.

    Returns
    -------
    float
        lambda_hat estimated via GMSR.
    """
    log_rho = []
    for j in jacobians:
        # Spectral radius = max absolute eigenvalue
        eigvals = np.linalg.eigvals(j)
        rho = np.max(np.abs(eigvals))
        # Guard against exactly zero spectral radius (degenerate state)
        rho = max(rho, 1e-300)
        log_rho.append(np.log(rho))
    return float(np.mean(log_rho))


def estimate_lle_qr(jacobians: list[np.ndarray]) -> float:
    """Renormalized matrix-product (QR trick) leading Lyapunov exponent.

    Computes the LARGEST Lyapunov exponent via the standard QR algorithm:
    multiply Jacobians sequentially, QR-decompose periodically, accumulate
    log|r_11| (the log of the leading diagonal entry of R) to estimate the
    leading exponent.

    The leading Lyapunov exponent lambda_1 satisfies:
        lambda_1 = lim_{T->inf} (1/T) * sum_t log|r_11^{(t)}|
    where r_11^{(t)} is the (0,0) entry of the R factor after renormalization.

    Parameters
    ----------
    jacobians : list[np.ndarray]
        Per-trial (4, 4) Jacobian matrices, ordered t=1..T.

    Returns
    -------
    float
        Leading Lyapunov exponent estimate via renormalized QR method.
        Positive = diverging, negative = contracting.

    Notes
    -----
    This is the standard Benettin et al. (1980) algorithm for computing
    the largest Lyapunov exponent.  The QR trick prevents numerical
    overflow/underflow in the iterated matrix product.
    """
    t = len(jacobians)
    # Start with identity (or first Jacobian) as Q
    q, r = np.linalg.qr(jacobians[0].astype(np.float64))
    log_r11_acc = np.log(abs(r[0, 0]) + 1e-300)

    for i in range(1, t):
        # Multiply new Jacobian from left: M = J_{i+1} @ Q_prev
        m = jacobians[i] @ q
        q, r = np.linalg.qr(m)
        log_r11_acc += np.log(abs(r[0, 0]) + 1e-300)

    return float(log_r11_acc / t)


# -------------------------------------------------------------------------
# Step 8: Per-trial metrics
# -------------------------------------------------------------------------

def compute_per_trial_metrics(
    jacobians: list[np.ndarray],
) -> tuple[list[float], list[float]]:
    """Compute spectral radius and max singular value per trial.

    Parameters
    ----------
    jacobians : list[np.ndarray]
        Per-trial (4, 4) Jacobian matrices.

    Returns
    -------
    spectral_radii : list[float]
        Spectral radius (max |eigenvalue|) per trial.
    max_singular_values : list[float]
        Max singular value per trial.
    """
    spectral_radii = []
    max_sv = []

    for j in jacobians:
        eigvals = np.linalg.eigvals(j)
        rho = float(np.max(np.abs(eigvals)))
        spectral_radii.append(rho)

        sv = np.linalg.svd(j, compute_uv=False)
        max_sv.append(float(sv[0]))

    return spectral_radii, max_sv


# -------------------------------------------------------------------------
# Main scan loop
# -------------------------------------------------------------------------

def main() -> None:
    """Run the full Lipschitz/LLE scan across 4 input regimes and write CSVs."""
    t_wall_start = time.time()

    n_regimes = len(REGIMES)
    n_total = N_VECTORS * n_regimes
    n_total_trials = n_total * T

    print("=" * 72)
    print("Phase 25-01: Lipschitz / LLE Scan for 3-level Binary HGF")
    print("         Cross-Regime Sensitivity Analysis (amendment 2026-04-27)")
    print("=" * 72, flush=True)
    print(
        f"N_VECTORS = {N_VECTORS} per regime, {n_regimes} regimes = {n_total} total",
        flush=True,
    )
    print(f"T = {T}, SEED = {SEED}", flush=True)
    print(
        "Parameter source: wide prior sweep (Phase 14.2 chains not available)",
        flush=True,
    )
    print(
        f"  omega_2 in {OMEGA_2_RANGE}, omega_3 in {OMEGA_3_RANGE},"
        f" kappa={KAPPA_FIXED} (fixed)",
        flush=True,
    )
    print(f"  beta in {BETA_RANGE}, zeta in {ZETA_RANGE}", flush=True)
    print(f"LLE method: QR (Benettin) primary + GMSR secondary (archived)", flush=True)
    print(f"State dim: 4 (mu_1, pi_1, mu_2, pi_2) — cue-0 branch", flush=True)
    print(f"Regimes: {REGIMES}", flush=True)
    print(
        f"Expected total Jacobians: {n_total_trials:,}  "
        f"({n_regimes} × {N_VECTORS} × {T})",
        flush=True,
    )
    print(flush=True)

    # Draw parameter vectors (same 100 vectors reused across all 4 regimes
    # for a fair comparison — parameter effects factored out from regime effects)
    param_vecs = draw_parameter_vectors(N_VECTORS, SEED)

    # Prepare output directory
    os.makedirs(_RESULTS_DIR, exist_ok=True)

    lle_rows: list[dict] = []
    sr_rows: list[dict] = []

    # -----------------------------------------------------------------------
    # Incremental CSV writers — open files once, write as we go.
    # This prevents data loss if the process is killed mid-run.
    # Resumable: skip (regime, vec_id) pairs already present in LLE CSV.
    # -----------------------------------------------------------------------
    lle_fieldnames = [
        "regime", "param_vector_id", "omega_2", "omega_3", "kappa", "beta", "zeta",
        "lambda_hat_qr", "lambda_hat_gmsr", "max_singular_value",
        "num_trials_sigma_gt_1",
    ]
    sr_fieldnames = [
        "regime", "param_vector_id", "trial_index", "spectral_radius",
        "max_singular_value",
    ]

    # Detect already-completed (regime, vec_id) pairs from existing LLE CSV
    completed: set[tuple[str, int]] = set()
    if os.path.exists(LLE_CSV):
        with open(LLE_CSV, newline="") as _f:
            _reader = csv.DictReader(_f)
            if _reader.fieldnames and "regime" in _reader.fieldnames:
                for _row in _reader:
                    completed.add((_row["regime"], int(_row["param_vector_id"])))
        if completed:
            print(
                f"Resuming: {len(completed)} (regime, vec_id) pairs already in LLE CSV.",
                flush=True,
            )

    # Append mode: write headers only if file is new/empty
    lle_file_exists = os.path.exists(LLE_CSV) and os.path.getsize(LLE_CSV) > 0
    sr_file_exists = os.path.exists(SR_CSV) and os.path.getsize(SR_CSV) > 0

    lle_f = open(LLE_CSV, "a", newline="")  # noqa: SIM115
    sr_f = open(SR_CSV, "a", newline="")    # noqa: SIM115
    lle_writer = csv.DictWriter(lle_f, fieldnames=lle_fieldnames)
    sr_writer = csv.DictWriter(sr_f, fieldnames=sr_fieldnames)
    if not lle_file_exists:
        lle_writer.writeheader()
    if not sr_file_exists:
        sr_writer.writeheader()

    for regime in REGIMES:
        input_gen = _INPUT_GENERATORS[regime]
        print(f"\n--- Regime: {regime} ---", flush=True)

        for vec_id in range(N_VECTORS):
            # Skip pairs already completed in a previous (interrupted) run
            if (regime, vec_id) in completed:
                print(
                    f"  [{regime}|{vec_id + 1:3d}/{N_VECTORS}] already done — skip",
                    flush=True,
                )
                continue

            omega_2, omega_3, kappa, beta, zeta = param_vecs[vec_id]

            t_vec_start = time.time()

            # Generate synthetic inputs for this regime
            # Use a regime-offset seed so each (regime, vec_id) pair is independent
            regime_offset = REGIMES.index(regime) * 10_000
            input_data, observed = input_gen(T, seed=SEED + regime_offset + vec_id)

            # Reference trajectory via pyhgf lax.scan
            state_traj = run_reference_trajectory(
                omega_2=float(omega_2),
                omega_3=float(omega_3),
                kappa=float(kappa),
                input_data=input_data,
                observed=observed,
            )

            # Build hgf_step and initial attrs
            hgf_step_fn, initial_attrs, _scan_fn = build_hgf_step(
                omega_2=float(omega_2),
                omega_3=float(omega_3),
                kappa=float(kappa),
            )

            # Compute per-trial Jacobians (vectorised via vmap)
            jacobians = compute_jacobians(
                hgf_step_fn, initial_attrs, input_data, observed, state_traj
            )

            # LLE estimates: QR (Benettin) is primary; GMSR is secondary/archived
            lambda_hat_qr = estimate_lle_qr(jacobians)
            lambda_hat = estimate_lle_gmsr(jacobians)

            # Per-trial metrics
            spectral_radii, max_svs = compute_per_trial_metrics(jacobians)

            # Summary statistics
            max_sv_overall = float(np.max(max_svs))
            num_sigma_gt_1 = int(np.sum(np.array(spectral_radii) >= 1.0))

            # Write LLE row immediately
            lle_row = {
                "regime": regime,
                "param_vector_id": vec_id,
                "omega_2": float(omega_2),
                "omega_3": float(omega_3),
                "kappa": float(kappa),
                "beta": float(beta),
                "zeta": float(zeta),
                "lambda_hat_qr": lambda_hat_qr,
                "lambda_hat_gmsr": lambda_hat,
                "max_singular_value": max_sv_overall,
                "num_trials_sigma_gt_1": num_sigma_gt_1,
            }
            lle_rows.append(lle_row)
            lle_writer.writerow(lle_row)
            lle_f.flush()

            # Write per-trial rows immediately
            for t_idx in range(T):
                sr_row = {
                    "regime": regime,
                    "param_vector_id": vec_id,
                    "trial_index": t_idx,
                    "spectral_radius": spectral_radii[t_idx],
                    "max_singular_value": max_svs[t_idx],
                }
                sr_rows.append(sr_row)
                sr_writer.writerow(sr_row)
            sr_f.flush()

            t_vec_elapsed = time.time() - t_vec_start
            status = "FAIL" if lambda_hat_qr >= 0.0 else "pass"
            print(
                f"  [{regime}|{vec_id + 1:3d}/{N_VECTORS}] "
                f"w2={omega_2:.2f} w3={omega_3:.2f} b={beta:.2f} z={zeta:.2f} | "
                f"qr={lambda_hat_qr:+.4f} gmsr={lambda_hat:+.4f} "
                f"sr_max={max_sv_overall:.3f} fails={num_sigma_gt_1} | "
                f"{status} [{t_vec_elapsed:.1f}s]",
                flush=True,
            )

    lle_f.close()
    sr_f.close()

    # -----------------------------------------------------------------------
    # Summary statistics — overall and per-regime
    # -----------------------------------------------------------------------
    # Reload the full LLE CSV for summary statistics (includes resumed rows)
    # -----------------------------------------------------------------------
    all_lle_rows: list[dict] = []
    with open(LLE_CSV, newline="") as _f:
        _reader = csv.DictReader(_f)
        for _row in _reader:
            all_lle_rows.append({
                "regime": _row["regime"],
                "param_vector_id": int(_row["param_vector_id"]),
                "omega_2": float(_row["omega_2"]),
                "omega_3": float(_row["omega_3"]),
                "kappa": float(_row["kappa"]),
                "beta": float(_row["beta"]),
                "zeta": float(_row["zeta"]),
                "lambda_hat_qr": float(_row["lambda_hat_qr"]),
                "lambda_hat_gmsr": float(_row["lambda_hat_gmsr"]),
                "max_singular_value": float(_row["max_singular_value"]),
                "num_trials_sigma_gt_1": int(_row["num_trials_sigma_gt_1"]),
            })
    # Use all_lle_rows for statistics from here on
    lle_rows = all_lle_rows

    print(flush=True)
    print("=" * 72, flush=True)
    print(f"N={N_VECTORS} vectors × {n_regimes} regimes = {n_total} total scanned.",
          flush=True)

    # Per-regime breakdown
    overall_verdict = "PASS"
    for regime in REGIMES:
        regime_rows = [r for r in lle_rows if r["regime"] == regime]
        lhq = np.array([r["lambda_hat_qr"] for r in regime_rows])
        lhg = np.array([r["lambda_hat_gmsr"] for r in regime_rows])
        n_fail_qr = int(np.sum(lhq >= 0.0))
        n_fail_gmsr = int(np.sum(lhg >= 0.0))
        frac_pass = (N_VECTORS - n_fail_qr) / N_VECTORS * 100.0
        p5 = float(np.percentile(lhq, 5))
        p50 = float(np.percentile(lhq, 50))
        p95 = float(np.percentile(lhq, 95))
        sr_counts = np.array([r["num_trials_sigma_gt_1"] for r in regime_rows])
        n_any_sr_gt1 = int(np.sum(sr_counts > 0))
        frac_trials_sr_gt1 = float(np.sum(sr_counts)) / (N_VECTORS * T) * 100.0
        print(
            f"  {regime:12s}: median={p50:+.4f} p5={p5:+.4f} p95={p95:+.4f} "
            f"pass={frac_pass:.0f}% "
            f"sr>=1 trials={frac_trials_sr_gt1:.1f}% "
            f"gmsr_fail={n_fail_gmsr}",
            flush=True,
        )
        if frac_pass < 80.0:
            overall_verdict = "FAIL"
        elif frac_pass < 95.0 and overall_verdict != "FAIL":
            overall_verdict = "PASS-WITH-FAILURE-MODES"

    # Overall totals
    lambda_hats_qr_all = np.array([r["lambda_hat_qr"] for r in lle_rows])
    n_fail_all = int(np.sum(lambda_hats_qr_all >= 0.0))
    frac_pass_all = (n_total - n_fail_all) / n_total * 100.0
    p5_all = float(np.percentile(lambda_hats_qr_all, 5))
    p50_all = float(np.percentile(lambda_hats_qr_all, 50))
    p95_all = float(np.percentile(lambda_hats_qr_all, 95))
    all_sr_gt1_counts = np.array([r["num_trials_sigma_gt_1"] for r in lle_rows])
    frac_trials_sr_gt1_all = (
        float(np.sum(all_sr_gt1_counts)) / (n_total * T) * 100.0
    )

    t_wall_elapsed = time.time() - t_wall_start

    print(flush=True)
    print(f"OVERALL QR lambda_hat: median={p50_all:.4f} p5={p5_all:.4f} p95={p95_all:.4f}",
          flush=True)
    print(f"OVERALL QR fail count (>= 0): {n_fail_all}/{n_total}", flush=True)
    print(f"OVERALL QR pass rate: {frac_pass_all:.1f}%", flush=True)
    print(f"OVERALL fraction of trials with sr >= 1: {frac_trials_sr_gt1_all:.1f}%",
          flush=True)
    print(f"Wall time: {t_wall_elapsed:.1f}s", flush=True)
    print(f"LLE CSV:  {LLE_CSV}", flush=True)
    print(f"SR CSV:   {SR_CSV}", flush=True)
    print("=" * 72, flush=True)

    # Refine overall verdict: if ANY single regime has frac_pass < 95 we degrade
    any_sr_pressure = frac_trials_sr_gt1_all >= 50.0
    if frac_pass_all >= 95.0 and not any_sr_pressure:
        overall_verdict = "PASS"
    elif frac_pass_all >= 80.0:
        overall_verdict = "PASS-WITH-FAILURE-MODES"
    else:
        overall_verdict = "FAIL"
    print(f"Overall verdict (QR-based, cross-regime): {overall_verdict}", flush=True)
    print("=" * 72, flush=True)


if __name__ == "__main__":
    main()
