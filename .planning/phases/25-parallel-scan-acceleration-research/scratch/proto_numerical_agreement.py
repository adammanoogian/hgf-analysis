"""25-04 numerical agreement: prototype parallel-scan log-lik vs pyhgf sequential.

Target: rel-err < 1e-5 on log-likelihood across >= 10 simulated participants
at fixed theta.

Generates 10 synthetic participants with parameters drawn from the posterior-
typical region of the prior (same source as 25-01 lipschitz_scan.py).  For
each participant we compute:

  log_lik_seq : sequential_likelihood (pyhgf lax.scan via scan_fn — same as
                production ops.py _jax_logp path)
  log_lik_par : parallel_scan_likelihood (quasi-ELK trajectory + same LL
                formula from converged flat state)

The rel-err = |log_lik_par - log_lik_seq| / (|log_lik_seq| + 1e-12) should
be < 1e-5 for all 10 participants.

Additionally, the trajectory-level rel-err (traj_max_rel_err from diagnostics)
is reported — this measures how well the quasi-ELK trajectory matches the
sequential pyhgf trajectory.

Participant data
----------------
Rather than running simulate_batch (which returns a DataFrame and requires
the full trial-sequence machinery), we generate synthetic inputs directly:
- Parameter vectors: uniform draw from posterior-typical prior region
  (same ranges as 25-01 lipschitz_scan.py OMEGA_2_RANGE etc.)
- Choices: round-robin cue cycling (cue = t % 3)
- Rewards: Bernoulli(p) where p alternates by PRL phase block [0.7, 0.3, 0.7, 0.3]
  (reversal regime — closest to production PRL paradigm per 25-01 §10)
- T = 420 trials (production trial count; 3 sets × 140 per prl_analysis.yaml)

This is identical to the "reversal" regime in 25-01 lipschitz_scan.py, which
showed the most realistic contraction (lambda_hat = -0.0133, matching
round_robin nearly exactly).

Usage
-----
    python .planning/phases/25-parallel-scan-acceleration-research/scratch/proto_numerical_agreement.py

Expected output (final line): OK
Log file: .planning/phases/25-parallel-scan-acceleration-research/results/proto_numerical_agreement.log
"""
from __future__ import annotations

import os
import sys

# HIGH SEVERITY: must be set before any jax import (Risk #6 from 25-00b)
os.environ["JAX_ENABLE_X64"] = "1"

# Ensure src/ is importable regardless of working directory
_SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
_PROJECT_ROOT = os.path.normpath(os.path.join(_SCRIPT_DIR, "..", "..", "..", ".."))
if os.path.join(_PROJECT_ROOT, "src") not in sys.path:
    sys.path.insert(0, os.path.join(_PROJECT_ROOT, "src"))

import numpy as np

from prl_hgf.fitting.parallel_scan_proto import (
    parallel_scan_likelihood,
    sequential_likelihood,
)

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

N_PARTICIPANTS = 10
T = 420          # production trial count (pick_best_cue, 3 sets × 140 trials)
SEED = 2504      # from 25-04 plan pseudocode
KAPPA_FIXED = 1.0

# Parameter prior ranges (posterior-typical region; same as 25-01 lipschitz_scan.py)
OMEGA_2_RANGE = (-6.0, -2.0)
OMEGA_3_RANGE = (-8.0, -2.0)
BETA_RANGE = (0.5, 4.0)
ZETA_RANGE = (-1.0, 1.0)

# Convergence settings
MAX_ITER = 20
TOL = 1e-5

# ---------------------------------------------------------------------------
# Synthetic data generation: reversal regime
# (4-phase block-reversal [0.7, 0.3, 0.7, 0.3] matching PRL phases)
# Same as 25-01 lipschitz_scan.py reversal regime
# ---------------------------------------------------------------------------


def make_reversal_inputs(
    t_total: int,
    seed: int,
) -> tuple[np.ndarray, np.ndarray]:
    """Generate T-trial reversal-regime synthetic inputs.

    Parameters
    ----------
    t_total : int
        Number of trials (should be 420 = 3 sets × 140).
    seed : int
        Per-participant RNG seed.

    Returns
    -------
    choices : np.ndarray, shape (T,), int
        Chosen cue (round-robin cycling).
    rewards : np.ndarray, shape (T,), int
        Binary reward outcome.
    """
    rng = np.random.default_rng(seed)
    choices = np.array([t % 3 for t in range(t_total)], dtype=np.int32)

    # Block-reversal reward probability: 4 blocks of T//4 trials each
    block_size = t_total // 4
    reward_probs = [0.7, 0.3, 0.7, 0.3]
    probs = np.zeros(t_total, dtype=np.float64)
    for b, p in enumerate(reward_probs):
        start = b * block_size
        end = start + block_size if b < 3 else t_total
        probs[start:end] = p

    rewards = (rng.uniform(size=t_total) < probs).astype(np.int32)
    return choices, rewards


# ---------------------------------------------------------------------------
# Draw 10 parameter vectors from posterior-typical prior
# ---------------------------------------------------------------------------

rng_master = np.random.default_rng(SEED)
omega_2_vals = rng_master.uniform(*OMEGA_2_RANGE, size=N_PARTICIPANTS)
omega_3_vals = rng_master.uniform(*OMEGA_3_RANGE, size=N_PARTICIPANTS)
beta_vals = rng_master.uniform(*BETA_RANGE, size=N_PARTICIPANTS)
zeta_vals = rng_master.uniform(*ZETA_RANGE, size=N_PARTICIPANTS)

print("=" * 72)
print("25-04 Numerical Agreement: parallel-scan LL vs pyhgf sequential")
print("=" * 72)
print(f"N_participants = {N_PARTICIPANTS}")
print(f"T = {T} trials (production pick_best_cue, reversal regime)")
print(f"max_iter = {MAX_ITER}, tol = {TOL:.0e}")
print(f"Seed = {SEED}")
print()

# ---------------------------------------------------------------------------
# Per-participant agreement check
# ---------------------------------------------------------------------------

print(f"{'P':>2}  {'omega_2':>8}  {'omega_3':>8}  {'beta':>6}  {'zeta':>6}  "
      f"{'ll_seq':>12}  {'ll_par':>12}  {'rel_err':>10}  {'traj_err':>10}  "
      f"{'K':>3}  {'cvg':>5}")
print("-" * 100)

rel_errs = []
traj_rel_errs = []
k_iters = []
converged_list = []

for p in range(N_PARTICIPANTS):
    theta_p = {
        "omega_2": float(omega_2_vals[p]),
        "omega_3": float(omega_3_vals[p]),
        "kappa": KAPPA_FIXED,
        "beta": float(beta_vals[p]),
        "zeta": float(zeta_vals[p]),
    }

    # Generate per-participant synthetic inputs
    choices_p, rewards_p = make_reversal_inputs(T, seed=SEED + p * 1000)

    # Sequential reference (lax.scan via pyhgf)
    log_lik_seq = sequential_likelihood(theta_p, choices_p, rewards_p)

    # Parallel scan (quasi-ELK)
    log_lik_par, diag = parallel_scan_likelihood(
        theta_p, choices_p, rewards_p, max_iter=MAX_ITER, tol=TOL
    )

    ll_seq_f = float(log_lik_seq)
    ll_par_f = float(log_lik_par)
    rel_err = abs(ll_par_f - ll_seq_f) / (abs(ll_seq_f) + 1e-12)
    traj_rel_err = diag["traj_max_rel_err"]
    K = diag["K_iters"]
    cvg = diag["converged"]

    rel_errs.append(rel_err)
    traj_rel_errs.append(traj_rel_err)
    k_iters.append(K)
    converged_list.append(cvg)

    print(f"{p:>2}  {theta_p['omega_2']:>8.3f}  {theta_p['omega_3']:>8.3f}  "
          f"{theta_p['beta']:>6.3f}  {theta_p['zeta']:>6.3f}  "
          f"{ll_seq_f:>12.4f}  {ll_par_f:>12.4f}  "
          f"{rel_err:>10.2e}  {traj_rel_err:>10.2e}  "
          f"{K:>3d}  {'PASS' if cvg else 'K_cap':>5}")

rel_errs_arr = np.array(rel_errs)
traj_rel_errs_arr = np.array(traj_rel_errs)
k_iters_arr = np.array(k_iters)

print("-" * 100)
print()
print("Summary:")
print(f"  LL rel_err:  max={rel_errs_arr.max():.2e}  "
      f"mean={rel_errs_arr.mean():.2e}  "
      f"(target < {TOL:.0e})")
print(f"  Traj rel_err: max={traj_rel_errs_arr.max():.2e}  "
      f"mean={traj_rel_errs_arr.mean():.2e}")
print(f"  K_iters:     min={k_iters_arr.min()}  "
      f"median={np.median(k_iters_arr):.0f}  "
      f"max={k_iters_arr.max()}  "
      f"(25-01 prediction: K=8-15)")
print(f"  K=max_iter:  {sum(k == MAX_ITER for k in k_iters_arr)} / {N_PARTICIPANTS} "
      f"participants (signals weakly-contracting; cf. 25-01 §5.2 omega_2 failure mode)")
print(f"  Converged:   {sum(converged_list)} / {N_PARTICIPANTS}")
print()

# ---------------------------------------------------------------------------
# Gate assertion
# ---------------------------------------------------------------------------
assert rel_errs_arr.max() < TOL, (
    f"NUMERICAL AGREEMENT FAILED: "
    f"max rel_err = {rel_errs_arr.max():.2e} (target < {TOL:.0e}). "
    f"Participant with worst rel_err: P={int(np.argmax(rel_errs_arr))}, "
    f"ll_seq={float(sequential_likelihood({}, [], [])):.4f}."
)

print("OK")
