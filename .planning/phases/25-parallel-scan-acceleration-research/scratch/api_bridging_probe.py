"""API bridging probe: pyhgf 3-level HGF lifted to a pure f(state, input)->state'.

This probe is part of Phase 25 (plan 00b) of the hgf-analysis project.

Purpose
-------
Demonstrate that the pyhgf 3-level binary HGF per-trial update CAN be
extracted from the dict-of-dicts attributes representation and re-expressed
as a pure function:

    hgf_step(state, input_t) -> (state', output)

where state is the pyhgf attributes dict (the natural state representation)
and we verify that iterating hgf_step over 50 trials reproduces pyhgf's
sequential lax.scan output to rel-err < 1e-10.

State representation
--------------------
For the 3-level binary HGF, the dynamical state is the full attributes dict.
The MINIMAL tuple representation (for parallel-scan API mapping) is:

    State component          pyhgf key path                    index
    ------------------------------------------------------------------
    mu_1  = posterior mean   attributes[1]["mean"]             0
    pi_1  = posterior prec.  attributes[1]["precision"]        1
    mu_2  = volatility mean  attributes[6]["mean"]             2
    pi_2  = volatility prec. attributes[6]["precision"]        3

(For cue-0 branch only. Full 3-branch state is 12-dim.)

The binary node (node 0) is NOT part of the dynamical state — its
expected_mean = sigmoid(mu_1) is a derived quantity recomputed each step.

Approach
--------
We call pyhgf's own scan_fn (beliefs_propagation) step-by-step, passing
exactly the same input format that jax.lax.scan would pass. This avoids
reimplementing the equations and verifies the pure-function extraction
without code modification.

The key insight: jax.lax.scan calls scan_fn with inputs sliced at each t,
so the per-trial input has shapes matching the per-step slice of the batched
input arrays:
  - values[i]: shape (1,) — one scalar reward observation per cue
  - observed[i]: shape () — scalar boolean
  - time_step: scalar float64

We replicate this exact shape contract in hgf_step.

Purity analysis
---------------
pyhgf's scan_fn (beliefs_propagation) is a jax.tree_util.Partial capturing
edges and update_sequence as static closures. For a TIME-INVARIANT graph
topology (pick_best_cue use case), this closure is functionally pure across
trials. It is NOT pure if edges change per trial (e.g., trial-varying kappa).

Usage
-----
    python .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py

Expected output:
    All 50 trials match within rel-err 1e-10. OK.

Author: Phase 25-00b executor
"""
from __future__ import annotations

import os
import sys

# Ensure jax float64 mode is active — must be set BEFORE importing jax
os.environ["JAX_ENABLE_X64"] = "1"

# Ensure the project src is importable
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "..", "..", "..", "src"))

import numpy as np
import jax
import jax.numpy as jnp

from prl_hgf.models.hgf_3level import build_3level_network

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
N_TRIALS = 50
SEED = 42
REL_ERR_THRESHOLD = 1e-10

# ---------------------------------------------------------------------------
# Step 1: Reference trajectory via pyhgf sequential scan
# ---------------------------------------------------------------------------

# Build a fresh 3-level 3-branch network with default parameters
net = build_3level_network(omega_2=-4.0, omega_3=-4.0, kappa=1.0)

# Generate synthetic binary input: T=50 trials, always choosing cue 0
rng = np.random.default_rng(SEED)
outcomes = rng.integers(0, 2, (N_TRIALS,))

input_data = np.zeros((N_TRIALS, 3), dtype=np.float64)
observed = np.zeros((N_TRIALS, 3), dtype=np.int32)
chosen_cue = 0  # single branch probe: cue 0

for t in range(N_TRIALS):
    if outcomes[t] == 1:
        input_data[t, chosen_cue] = 1.0
    observed[t, chosen_cue] = 1  # only cue 0 is ever observed

# Run pyhgf sequential forward pass (the reference)
net.input_data(input_data=input_data, observed=observed)
traj = net.node_trajectories

# Reference state trajectory
# pyhgf node_trajectories stores per-trial POSTERIOR values (shape: (n_trials,))
#
# State representation (per-step pyhgf attribute keys → flat-tuple index):
#   attributes[1]["mean"]        → mu_1   → index 0  (cue-0 level-1 posterior mean)
#   attributes[1]["precision"]   → pi_1   → index 1  (cue-0 level-1 posterior precision)
#   attributes[6]["mean"]        → mu_2   → index 2  (shared volatility posterior mean)
#   attributes[6]["precision"]   → pi_2   → index 3  (shared volatility posterior precision)
ref_mu1 = np.asarray(traj[1]["mean"])        # (N_TRIALS,)
ref_pi1 = np.asarray(traj[1]["precision"])   # (N_TRIALS,)
ref_mu2 = np.asarray(traj[6]["mean"])        # (N_TRIALS,)
ref_pi2 = np.asarray(traj[6]["precision"])   # (N_TRIALS,)

print("=== Reference trajectory (pyhgf lax.scan) — first 5 trials ===")
for t in range(5):
    print(f"  t={t}: mu1={ref_mu1[t]:.6f}  pi1={ref_pi1[t]:.6f}  "
          f"mu2={ref_mu2[t]:.8f}  pi2={ref_pi2[t]:.6f}")

# ---------------------------------------------------------------------------
# Step 2: Rebuild clean network to get scan_fn and initial attributes
# ---------------------------------------------------------------------------
# We need:
#   1. A clean scan_fn (beliefs_propagation partially applied with edges,
#      update_sequence) — obtained from a network that has called input_data once.
#   2. The INITIAL attributes dict (before any forward pass).
#
# The scan_fn is stable across calls — we get it from any forward-passed network.
# The initial attributes come from a fresh network (no input_data call).

# Get scan_fn from net (already set up)
scan_fn = net.scan_fn
assert scan_fn is not None, "scan_fn should be set after input_data"

# Get initial attributes from the network BEFORE the forward pass.
# Since net has been run, we use net.last_attributes as the state AFTER the
# last trial. We need the INITIAL state (before trial 0).
# We get it by building a fresh network (no input_data call).
net_init = build_3level_network(omega_2=-4.0, omega_3=-4.0, kappa=1.0)
# Trigger scan_fn creation (needed for the internal state to be set)
# Call input_data with a zero sequence just to create scan_fn — we don't use
# its trajectory. The initial attributes are from a fresh build.
net_init.input_data(input_data=np.zeros((1, 3)), observed=np.zeros((1, 3), dtype=int))

# Rebuild AGAIN to get truly pristine initial attributes
net_clean = build_3level_network(omega_2=-4.0, omega_3=-4.0, kappa=1.0)
initial_attrs = net_clean.attributes
# Note: at this point scan_fn is None on net_clean, but we use scan_fn from net.

# ---------------------------------------------------------------------------
# Step 3: Understand the per-trial input format for step-by-step calling
# ---------------------------------------------------------------------------
# jax.lax.scan(scan_fn, attrs, (values, observed_t, time_steps, None))
# where:
#   values: tuple of 3 arrays each shape (N_TRIALS, 1) — batched values
#   observed_t: tuple of 3 arrays each shape (N_TRIALS,) — batched masks
#   time_steps: array shape (N_TRIALS,)
#   rng_key: None
#
# At each trial t, lax.scan slices each axis-0:
#   values[i][t] has shape (1,)  ← this is the per-step shape
#   observed_t[i][t] has shape ()  ← scalar
#   time_steps[t] has shape ()  ← scalar
#
# We must replicate this exact shape contract in hgf_step.

# Prepare the full batched inputs (same as what input_data passes to scan)
values_batched = tuple(input_data[:, i:i+1] for i in range(3))  # 3 x (N_TRIALS, 1)
# observed_t: need float64 as pyhgf computes float ops on it
observed_batched = tuple(observed[:, i].astype(np.float64) for i in range(3))  # 3 x (N_TRIALS,)
time_steps_batched = np.ones(N_TRIALS, dtype=np.float64)  # (N_TRIALS,)

# ---------------------------------------------------------------------------
# Step 4: Define hgf_step — one-trial wrapper around pyhgf's scan_fn
# ---------------------------------------------------------------------------

def hgf_step(
    attrs: dict,
    input_t: tuple,
) -> tuple[dict, tuple[float, float, float, float]]:
    """Run one trial's HGF update using pyhgf's beliefs_propagation.

    This is the per-trial scan body, wrapping pyhgf's scan_fn.
    The function signature matches f(state, input) -> (state', output)
    required by jax.lax.scan and parallel-scan APIs.

    Parameters
    ----------
    attrs : dict
        pyhgf attributes dict-of-dicts — the full dynamical state.
        All node parameters are stored here.
    input_t : tuple
        Per-trial input in pyhgf's scan_fn format:
        (values_t, observed_t, time_step_t, rng_key)
        where values_t = tuple of 3 arrays each shape (1,),
              observed_t = tuple of 3 scalar arrays,
              time_step_t = scalar float,
              rng_key = None.

    Returns
    -------
    new_attrs : dict
        Updated attributes dict (new state after this trial's update).
    state_t : tuple
        Extracted (mu_1, pi_1, mu_2, pi_2) scalars after update.

    Notes
    -----
    LIFTED FROM: pyhgf's lax.scan(scan_fn, attrs, scan_inputs) in
    Network.input_data. We call scan_fn once per trial instead of via
    lax.scan. This is equivalent under JAX's functional semantics.

    PURITY: scan_fn captures edges and update_sequence as static closures
    (jax.tree_util.Partial). These are time-INVARIANT for pick_best_cue,
    so the function IS pure in the sense required by parallel-scan APIs.

    MUTATION: pyhgf uses attrs[node_idx][key] = value (dict mutation).
    Under JAX tracing this is equivalent to functional update. Safe for
    jax.lax.scan. The shallow-copy pattern (ops.py line 109) ensures the
    base_attrs are not corrupted across calls.
    """
    # scan_fn is jax.tree_util.Partial(beliefs_propagation, update_sequence, edges, ...)
    # beliefs_propagation signature: (attributes, inputs, ...) -> (attributes, attributes)
    # The carryover and accumulated outputs are identical (pyhgf convention).
    new_attrs, _ = scan_fn(attrs, input_t)
    # Extract minimal state components for verification
    state_t = (
        new_attrs[1]["mean"],
        new_attrs[1]["precision"],
        new_attrs[6]["mean"],
        new_attrs[6]["precision"],
    )
    return new_attrs, state_t


# ---------------------------------------------------------------------------
# Step 5: Run hgf_step loop and verify against reference trajectory
# ---------------------------------------------------------------------------
print("\n=== Running hgf_step step-by-step loop ===")

current_attrs = initial_attrs
errors = []
max_rel_err = 0.0

for t in range(N_TRIALS):
    # Per-trial input: slice axis-0 from the batched arrays.
    # lax.scan would do this automatically; here we do it manually.
    values_t = tuple(values_batched[i][t] for i in range(3))   # tuple of 3 (1,) arrays
    observed_t = tuple(observed_batched[i][t] for i in range(3))  # tuple of 3 scalars
    time_step_t = time_steps_batched[t]  # scalar
    input_t = (values_t, observed_t, time_step_t, None)

    current_attrs, state_t = hgf_step(current_attrs, input_t)
    mu1_hat, pi1_hat, mu2_hat, pi2_hat = state_t

    # Reference values
    mu1_ref = ref_mu1[t]
    pi1_ref = ref_pi1[t]
    mu2_ref = ref_mu2[t]
    pi2_ref = ref_pi2[t]

    # Relative error (max across state components)
    def rel_err(a: float, b: float) -> float:
        return float(abs(float(a) - float(b)) / (abs(float(b)) + 1e-12))

    err_t = max(
        rel_err(mu1_hat, mu1_ref),
        rel_err(pi1_hat, pi1_ref),
        rel_err(mu2_hat, mu2_ref),
        rel_err(pi2_hat, pi2_ref),
    )
    errors.append(err_t)
    max_rel_err = max(max_rel_err, err_t)

    if t < 5 or err_t > REL_ERR_THRESHOLD:
        print(f"  t={t:2d}: mu1={float(mu1_hat):.6f}(ref={mu1_ref:.6f})  "
              f"pi1={float(pi1_hat):.6f}(ref={pi1_ref:.6f})  "
              f"mu2={float(mu2_hat):.8f}(ref={mu2_ref:.8f})  "
              f"rel_err={err_t:.2e}")

# ---------------------------------------------------------------------------
# Step 6: Report pass/fail
# ---------------------------------------------------------------------------
print(f"\n=== Numerical agreement check ===")
print(f"N trials:       {N_TRIALS}")
print(f"Max rel error:  {max_rel_err:.2e}  (threshold: {REL_ERR_THRESHOLD:.0e})")
print(f"Mean rel error: {np.mean(errors):.2e}")

if max_rel_err < REL_ERR_THRESHOLD:
    print(f"\nAll {N_TRIALS} trials match within rel-err {REL_ERR_THRESHOLD:.0e}. OK.")
    success = True
else:
    n_fail = sum(e > REL_ERR_THRESHOLD for e in errors)
    print(f"\nFAILED: {n_fail}/{N_TRIALS} trials exceed rel-err threshold.")
    print("This indicates a shape mismatch or floating-point precision issue.")
    success = False

# ---------------------------------------------------------------------------
# Step 7: State-shape documentation
# ---------------------------------------------------------------------------
print("\n=== pyhgf 3-level HGF State-Shape Inventory ===")
print()
print("Single-branch (cue-0) minimal state representation:")
print()
print("  pyhgf key path                      math symbol  flat-tuple index  dtype")
print("  ------------------------------------|-------------|-----------------|--------")
print("  attributes[1]['mean']               mu_1 (post.) 0                 float64")
print("  attributes[1]['precision']          pi_1 (post.) 1                 float64")
print("  attributes[6]['mean']               mu_2 (post.) 2                 float64")
print("  attributes[6]['precision']          pi_2 (post.) 3                 float64")
print()
print("Full 3-branch state (12-dim, for production use):")
print("  Nodes 1,3,5: mu_1 and pi_1 per cue → indices 0-5")
print("  Node 6 (shared): mu_2 and pi_2 → indices 10-11")
print("  (Indices 6-9 = expected_mean/precision for nodes 1,3,5 — derived, not state)")
print()
print("Non-state (derived at each step from state):")
print("  attributes[0]['expected_mean']       sigmoid(mu_1)   — computed in prediction step")
print("  attributes[1]['expected_mean']       mu_1_pred       — from mu_1, mu_2, omega_2, kappa")
print("  attributes[1]['expected_precision']  pi_1_pred       — from pi_1, mu_2, omega_2, kappa")
print("  attributes[6]['expected_mean']       mu_2_pred       — from mu_2, omega_3")
print("  attributes[6]['expected_precision']  pi_2_pred       — from pi_2, omega_3")
print()
print("Static closure (captured by scan_fn, NOT part of state):")
print("  edges                       graph topology (value/volatility parent-child links)")
print("  update_sequence             function schedule (prediction→PE→posterior order)")
print("  These are TIME-INVARIANT for pick_best_cue. SAFE as closures.")

# ---------------------------------------------------------------------------
# Step 8: Candidate API mapping summary
# ---------------------------------------------------------------------------
print("\n=== Candidate API Mapping Summary ===")
print()
print("(a) EEA-sensors/sqrt-parallel-smoothers (PIEKS):")
print("    Required: transition_function(x_t, Q) + observation_function(x_t, R)")
print("    HGF mapping:")
print("      x_t = (mu_1, sigma_1, mu_2, sigma_2) — sqrt form (sigma = 1/sqrt(pi))")
print("      transition_function: pyhgf prediction step for nodes 1,6")
print("        → x_{t+1}_pred = (mu_1_pred, sigma_1_pred, mu_2_pred, sigma_2_pred)")
print("        → Q: implied by predict_precision (exp(kappa*mu_2 + omega_2) step)")
print("      observation_function: binary observation via sigmoid(mu_1)")
print("        → y_t = sigmoid(mu_1_t)  [Bernoulli observation]")
print("        → R: Bernoulli variance = mu_1_pred*(1-mu_1_pred) — STATE DEPENDENT")
print("    CHALLENGE: R is state-dependent, not a fixed covariance matrix.")
print("    sqrt-parallel-smoothers API expects fixed R (or at least time-varying")
print("    passed as array). State-dependence requires wrapping.")
print()
print("(b) lindermanlab/elk (quasi-ELK):")
print("    Required: RNN-style f(state) where f is differentiable")
print("    HGF mapping: f((mu_1, pi_1, mu_2, pi_2)) -> (mu_1', pi_1', mu_2', pi_2')")
print("    hgf_step IS this function (as demonstrated by this probe).")
print("    The attrs dict-of-dicts CAN be replaced by a flat tuple via tree_flatten.")
print("    jax.jacobian(f) is computable since all ops are JAX-differentiable.")
print("    CHALLENGE: ELK loses covariance propagation (point estimates only).")
print("    For HGF likelihood feeding NUTS, this may be acceptable.")
print()
print("(c) jax.lax.associative_scan with custom operator:")
print("    Required: an associative operator that combines two trial-blocks.")
print("    HGF mapping: requires deriving the PIEKS associative operator from")
print("      the linearized (A_t, b_t) representation of the HGF update.")
print("    This is the highest-effort path but has no external dependency.")
print("    hgf_step from this probe provides f(state, input) needed to compute")
print("    Jacobians A_t = jax.jacobian(hgf_step)(state_ref_t) for linearization.")

sys.exit(0 if success else 1)
