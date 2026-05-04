"""Phase 25 prototype: parallel-scan acceleration of HGF likelihood evaluation.

This module is a RESEARCH PROTOTYPE.  It is NOT wired into production fit
paths.  Production NUTS sampling continues to use the sequential lax.scan
path in src/prl_hgf/fitting/{hierarchical,hierarchical_patrl,ops}.py.

This prototype implements an O(K log T) parallel-scan replacement for the
trial-axis O(T) sequential scan, using quasi-ELK (diagonal-Jacobian Newton
iterations via jax.lax.associative_scan) as chosen in:
  .planning/phases/25-parallel-scan-acceleration-research/ALGORITHM_DECISION.md

The algorithm is a Windows-portable pure-JAX re-implementation of the
quasi-DEER variant from lindermanlab/elk (commit 2801539), validated in
25-03 to rel-err 1.28e-15 on the coordinated-turn benchmark.

State representation
--------------------
This module uses the **flat-tuple state** for Jacobian computation within
the quasi-ELK iterations.  The full pyhgf attributes dict is used for the
sequential initialisation pass (lax.scan via pyhgf) and for log-likelihood
extraction.

Full 3-branch flat state mapping (D=8) for Jacobian computation:

  Index  pyhgf path                   math symbol
  -----  ---------------------------  -----------
  0      attributes[1]["mean"]        mu_1_c0  (cue-0 level-1 posterior mean)
  1      attributes[1]["precision"]   pi_1_c0
  2      attributes[3]["mean"]        mu_1_c1  (cue-1)
  3      attributes[3]["precision"]   pi_1_c1
  4      attributes[5]["mean"]        mu_1_c2  (cue-2)
  5      attributes[5]["precision"]   pi_1_c2
  6      attributes[6]["mean"]        mu_2     (shared volatility mean)
  7      attributes[6]["precision"]   pi_2     (shared volatility precision)

The attributes-dict carry is used for the sequential reference (both inside
parallel_scan_likelihood's init pass and in sequential_likelihood), matching
the approach validated in scratch/api_bridging_probe.py (rel-err 1.07e-13
vs pyhgf lax.scan over 50 trials, Phase 25-00b).

The flat representation is used only for the quasi-ELK Jacobian computation
loop, where jax.vmap(jax.jacfwd(f_flat)) requires a single JAX array input.

References
----------
- 25-00b API_BRIDGING_STUDY.md: pyhgf state-shape mapping
- 25-01 THEORETICAL_VALIDATION.md: lambda_hat distribution + K prediction
- 25-02 ALGORITHM_DECISION.md: chosen algorithm + rationale
- 25-03 REPRODUCTION_NOTES.md: reference-impl call signature + sign convention
- scratch/reproduce_reference.py: Windows-portable quasi-ELK, REUSED here
- scratch/api_bridging_probe.py: hgf_step pattern, REUSED here

Numerical agreement target: rel-err < 1e-5 vs pyhgf sequential output.
K-iteration target: K = 8-15 per 25-01 prediction (weakly contracting system).

float64 note
------------
JAX_ENABLE_X64 must be set to "1" before any jax import.  This module
asserts that float64 is active at import time.  The caller (scripts, tests)
is responsible for setting os.environ["JAX_ENABLE_X64"] = "1" before
importing this module.  Risk #6 from 25-00b API_BRIDGING_STUDY.md.
"""

from __future__ import annotations

import jax
import jax.numpy as jnp
import numpy as np

# ---------------------------------------------------------------------------
# float64 guard (Risk #6 from 25-00b — HIGH severity)
# ---------------------------------------------------------------------------
_x64_ok = jax.config.jax_enable_x64
if not _x64_ok:
    raise RuntimeError(
        "parallel_scan_proto requires float64 mode. "
        "Set os.environ['JAX_ENABLE_X64'] = '1' before importing JAX. "
        "Expected: JAX_ENABLE_X64=1. Got: JAX_ENABLE_X64=0 (float32 mode). "
        "(Risk #6 from 25-00b API_BRIDGING_STUDY.md)"
    )

# ---------------------------------------------------------------------------
# State-shape constants
# ---------------------------------------------------------------------------

# Flat state dimension (full 3-branch: mu_1 and pi_1 for each cue + mu_2 + pi_2)
_D_STATE: int = 8

# Mapping: flat-state index -> (node_idx, attribute_key) in pyhgf attributes
_STATE_NODE_PAIRS: tuple[tuple[int, str], ...] = (
    (1, "mean"),  # 0: mu_1_c0
    (1, "precision"),  # 1: pi_1_c0
    (3, "mean"),  # 2: mu_1_c1
    (3, "precision"),  # 3: pi_1_c1
    (5, "mean"),  # 4: mu_1_c2
    (5, "precision"),  # 5: pi_1_c2
    (6, "mean"),  # 6: mu_2
    (6, "precision"),  # 7: pi_2
)


# ---------------------------------------------------------------------------
# Flat-state extraction helpers
# ---------------------------------------------------------------------------


def _attrs_to_flat(attrs: dict) -> jax.Array:
    """Extract 8-dim flat state vector from pyhgf attributes dict.

    Parameters
    ----------
    attrs : dict
        pyhgf attributes dict-of-dicts.

    Returns
    -------
    jax.Array, shape (8,), float64
        [mu_1_c0, pi_1_c0, mu_1_c1, pi_1_c1, mu_1_c2, pi_1_c2, mu_2, pi_2]
    """
    return jnp.array(
        [attrs[node][key] for node, key in _STATE_NODE_PAIRS],
        dtype=jnp.float64,
    )


def _flat_to_attrs_update(base_attrs: dict, flat: jax.Array) -> dict:
    """Write flat 8-dim state vector into a fresh copy of pyhgf attributes.

    Uses the shallow-copy pattern from ops.py to avoid mutating base_attrs.
    The outer dict and each modified node dict are shallow-copied.

    Parameters
    ----------
    base_attrs : dict
        Reference attributes dict (graph structure, static parameters).
    flat : jax.Array, shape (8,)
        New state vector to inject.

    Returns
    -------
    dict
        New attributes dict with updated state values.
    """
    new_attrs = dict(base_attrs)
    # Track which nodes we've already copied
    updated_nodes: set[int] = set()
    for i, (node, key) in enumerate(_STATE_NODE_PAIRS):
        if node not in updated_nodes:
            new_attrs[node] = dict(new_attrs[node])
            updated_nodes.add(node)
        new_attrs[node][key] = flat[i]
    return new_attrs


# ---------------------------------------------------------------------------
# Quasi-ELK associative operator (from reproduce_reference.py §2.3)
# ---------------------------------------------------------------------------


def _diagonal_binary_op(
    elem_i: tuple[jax.Array, jax.Array],
    elem_j: tuple[jax.Array, jax.Array],
) -> tuple[jax.Array, jax.Array]:
    """Associative operator for diagonal linear recurrence.

    Implements (A_j * A_i, A_j * b_i + b_j) where A are diagonal vectors.
    From elk/algs/deer.py diagonal_binary_operator() via reproduce_reference.py.

    Parameters
    ----------
    elem_i : tuple
        (A_i, b_i), each shape (D,).
    elem_j : tuple
        (A_j, b_j), each shape (D,).

    Returns
    -------
    tuple
        Composed (A_out, b_out), each shape (D,).
    """
    A_i, b_i = elem_i
    A_j, b_j = elem_j
    return A_j * A_i, A_j * b_i + b_j


def _diagonal_matmul_recursive(
    A_diags: jax.Array,
    bs: jax.Array,
    y0: jax.Array,
) -> jax.Array:
    """Solve y[t] = A[t]*y[t-1] + b[t] in O(log T) via associative scan.

    From elk/algs/deer.py diagonal_matmul_recursive() via reproduce_reference.py.

    Parameters
    ----------
    A_diags : jax.Array, shape (T, D)
        Diagonal of the recurrence matrix at each step.
    bs : jax.Array, shape (T, D)
        Bias vector at each step.
    y0 : jax.Array, shape (D,)
        Initial condition.

    Returns
    -------
    yt : jax.Array, shape (T+1, D)
        Full trajectory including y0 at index 0.
    """
    D = y0.shape[0]
    ones = jnp.ones((1, D), dtype=jnp.float64)
    first_A = jnp.concatenate([ones, A_diags], axis=0)  # (T+1, D)
    first_b = jnp.concatenate([y0[None], bs], axis=0)  # (T+1, D)
    _, yt = jax.lax.associative_scan(_diagonal_binary_op, (first_A, first_b))
    return yt  # (T+1, D)


# ---------------------------------------------------------------------------
# pyhgf static-network singleton + JAX-traced theta injection
# ---------------------------------------------------------------------------
#
# Pattern mirrors src/prl_hgf/fitting/hierarchical.py::_single_logp_3level
# (lines ~398-443).  The pyhgf Network is built ONCE with placeholder
# defaults; ``scan_fn`` and ``base_attrs`` are cached at module level.  Per-
# call evaluation performs a shallow-copy of ``base_attrs`` and writes JAX-
# traced (omega_2, omega_3, kappa) into the relevant nodes, which keeps
# theta in the autodiff trace and removes the per-call ``build_3level_network``
# / JIT-recompile that dominated 25-04 timing on GPU.

# Belief and volatility node indices (production constants from hierarchical.py).
_BELIEF_NODES: tuple[int, ...] = (1, 3, 5)
_VOLATILITY_NODE: int = 6

# Module-level singletons (lazily initialized; see _get_static_network).
_SCAN_FN: object | None = None
_BASE_ATTRS: dict | None = None


def _get_static_network() -> tuple:
    """Return cached (scan_fn, base_attrs) for the 3-level pick_best_cue HGF.

    Lazily builds the pyhgf Network on first call with placeholder defaults
    (omega_2=-4.0, omega_3=-4.0, kappa=1.0).  Per-call code must then inject
    actual theta values via :func:`_inject_theta` before invoking ``scan_fn``;
    the placeholder values are overwritten and never reach the LL.

    Returns
    -------
    scan_fn : callable
        pyhgf ``beliefs_propagation`` Partial (time-invariant closure over
        edges and update_sequence).
    base_attrs : dict
        Pristine attributes dict with placeholder theta values.

    Notes
    -----
    The pyhgf scan_fn closure is time-invariant for pick_best_cue (no scan
    over parameters), so a single scan_fn serves all theta injections.  This
    is the key optimization that lets ``jax.jit`` cache the parallel-scan
    log-likelihood across participants instead of recompiling per call.
    """
    global _SCAN_FN, _BASE_ATTRS
    if _SCAN_FN is not None and _BASE_ATTRS is not None:
        return _SCAN_FN, _BASE_ATTRS

    from prl_hgf.models.hgf_3level import build_3level_network

    # Build with placeholders; theta is injected per-call by _inject_theta.
    net = build_3level_network(omega_2=-4.0, omega_3=-4.0, kappa=1.0)
    _dummy = np.zeros((1, 3), dtype=np.float64)
    _dobs = np.zeros((1, 3), dtype=np.int32)
    net.input_data(input_data=_dummy, observed=_dobs)
    _SCAN_FN = net.scan_fn

    net_clean = build_3level_network(omega_2=-4.0, omega_3=-4.0, kappa=1.0)
    _BASE_ATTRS = net_clean.attributes
    return _SCAN_FN, _BASE_ATTRS


def _inject_theta(base_attrs: dict, theta: dict[str, jax.Array]) -> dict:
    """Inject JAX-traced theta into a shallow copy of base_attrs.

    Mirrors the production pattern in
    ``hierarchical.py::_single_logp_3level`` (lines ~411-430): only the
    nodes whose static values are replaced are dict-copied; everything else
    references the same object as ``base_attrs``.  Safe under ``jax.grad``
    and ``jax.jit`` because no Python ``float()`` is called on traced arrays.

    Parameters
    ----------
    base_attrs : dict
        Reference attributes dict (graph structure, static parameters)
        from :func:`_get_static_network`.
    theta : dict
        ``{omega_2, omega_3, kappa}`` (each may be a JAX scalar or 0-d array;
        ``kappa`` defaults to 1.0 if absent).  ``beta`` and ``zeta`` are NOT
        injected here — they enter the LL computation directly.

    Returns
    -------
    dict
        New attributes dict with theta written into nodes 1, 3, 5, 6.
    """
    omega_2 = jnp.asarray(theta["omega_2"], dtype=jnp.float64)
    omega_3 = jnp.asarray(theta["omega_3"], dtype=jnp.float64)
    kappa = jnp.asarray(theta.get("kappa", 1.0), dtype=jnp.float64)

    new_attrs = dict(base_attrs)

    # omega_2 and kappa parents-side into level-1 belief nodes (1, 3, 5)
    for idx in _BELIEF_NODES:
        node = dict(new_attrs[idx])
        node["tonic_volatility"] = omega_2
        node["volatility_coupling_parents"] = jnp.array([kappa])
        new_attrs[idx] = node

    # omega_3 + kappa children-side into volatility node 6
    node6 = dict(new_attrs[_VOLATILITY_NODE])
    node6["tonic_volatility"] = omega_3
    node6["volatility_coupling_children"] = jnp.array([kappa, kappa, kappa])
    new_attrs[_VOLATILITY_NODE] = node6

    return new_attrs


# Backward-compat shim: legacy callers (e.g. earlier versions of
# scratch/proto_timing_benchmark.py) imported _build_hgf_closures(theta).
# The new path is _get_static_network() + _inject_theta(base_attrs, theta).
def _build_hgf_closures(theta: dict[str, jax.Array]) -> tuple:
    """Deprecated: returns ``(scan_fn, theta_injected_attrs)`` for legacy callers.

    .. deprecated::
        Use :func:`_get_static_network` + :func:`_inject_theta` instead.
        This shim concretizes theta via ``jnp.asarray`` rather than
        ``float()``, so it preserves traced arrays under ``jax.grad``.
    """
    scan_fn, base_attrs = _get_static_network()
    return scan_fn, _inject_theta(base_attrs, theta)


def _build_scan_inputs_jax(
    choices: np.ndarray,
    rewards: np.ndarray,
) -> tuple:
    """Build JAX-format pyhgf scan input tuple for T trials.

    Constructs the (values, observed_cols, time_steps, None) tuple that
    pyhgf's scan_fn / lax.scan expects, converting to JAX float64 arrays.

    Parameters
    ----------
    choices : np.ndarray, shape (T,), int
        Chosen cue index at each trial (0, 1, or 2).
    rewards : np.ndarray, shape (T,), int
        Reward received (0 or 1) at each trial.

    Returns
    -------
    tuple
        (values, observed_cols, time_steps, None) with JAX float64 arrays.
        values: tuple of 3 arrays each shape (T, 1)
        observed_cols: tuple of 3 arrays each shape (T,)
        time_steps: array shape (T,)
    """
    n_trials = len(choices)
    input_data = np.zeros((n_trials, 3), dtype=np.float64)
    observed = np.zeros((n_trials, 3), dtype=np.float64)

    for t in range(n_trials):
        c = int(choices[t])
        r = int(rewards[t])
        input_data[t, c] = float(r)
        observed[t, c] = 1.0

    values = tuple(
        jnp.array(input_data[:, i : i + 1], dtype=jnp.float64) for i in range(3)
    )
    observed_cols = tuple(
        jnp.array(observed[:, i], dtype=jnp.float64) for i in range(3)
    )
    time_steps = jnp.ones(n_trials, dtype=jnp.float64)

    return (values, observed_cols, time_steps, None)


def _build_batched_inputs(
    choices: np.ndarray,
    rewards: np.ndarray,
) -> jax.Array:
    """Build batched driver array for vmap Jacobian computation.

    For quasi-ELK, we need a batched input array of shape (T, driver_dim)
    that can be vmapped over.  The driver encodes per-trial input as a
    fixed-size flat vector: [values_c0, values_c1, values_c2,
    observed_c0, observed_c1, observed_c2].

    Parameters
    ----------
    choices : np.ndarray, shape (T,), int
    rewards : np.ndarray, shape (T,), int

    Returns
    -------
    drivers : jax.Array, shape (T, 6), float64
        Per-trial driver: first 3 = reward values, last 3 = observed mask.
    """
    n_trials = len(choices)
    input_data = np.zeros((n_trials, 3), dtype=np.float64)
    observed = np.zeros((n_trials, 3), dtype=np.float64)

    for t in range(n_trials):
        c = int(choices[t])
        r = int(rewards[t])
        input_data[t, c] = float(r)
        observed[t, c] = 1.0

    drivers = np.concatenate([input_data, observed], axis=1)  # (T, 6)
    return jnp.array(drivers, dtype=jnp.float64)


# ---------------------------------------------------------------------------
# hgf_step: pure functional per-trial HGF update (public API)
# ---------------------------------------------------------------------------


def hgf_step(
    state: dict,
    input_t: tuple,
) -> tuple[dict, tuple]:
    """Pure functional form of one HGF per-trial update.

    Wraps pyhgf's beliefs_propagation (scan_fn) for a single trial.
    This is the per-trial scan body matching f(state, input) -> (state', output).

    NOTE: This function requires scan_fn to be provided via closure.  Use
    make_hgf_step(scan_fn) to obtain a version with scan_fn captured.

    Parameters
    ----------
    state : dict
        pyhgf attributes dict-of-dicts (the full dynamical state).
    input_t : tuple
        Per-trial input in pyhgf scan_fn format:
        (values_t, observed_t, time_step_t, rng_key)
        where values_t = tuple of 3 arrays each shape (1,),
              observed_t = tuple of 3 scalar arrays,
              time_step_t = scalar float,
              rng_key = None.

    Returns
    -------
    new_state : dict
        Updated attributes dict after this trial's HGF update.
    state_tuple : tuple
        Extracted (mu_1_c0, pi_1_c0, mu_2, pi_2) scalars (cue-0 branch only;
        for compatibility with api_bridging_probe.py verification pattern).

    Notes
    -----
    LIFTED FROM: scratch/api_bridging_probe.py (Phase 25-00b).
    The probe verified rel-err 1.07e-13 vs pyhgf lax.scan over 50 trials.
    PURITY: scan_fn captures edges and update_sequence as static closures.
    These are TIME-INVARIANT for pick_best_cue.  Safe for jax.lax.scan.
    """
    raise RuntimeError(
        "hgf_step requires scan_fn via closure. Use make_hgf_step(scan_fn) instead."
    )


def make_hgf_step(scan_fn: object) -> object:
    """Return a closure over scan_fn usable as hgf_step.

    Parameters
    ----------
    scan_fn : callable
        pyhgf beliefs_propagation Partial (from net.scan_fn).

    Returns
    -------
    callable
        step(attrs, input_t) -> (new_attrs, state_t)
        where state_t = (mu_1_c0, pi_1_c0, mu_2, pi_2).
    """

    def step(
        attrs: dict,
        input_t: tuple,
    ) -> tuple[dict, tuple]:
        new_attrs, _ = scan_fn(attrs, input_t)
        state_t = (
            new_attrs[1]["mean"],
            new_attrs[1]["precision"],
            new_attrs[6]["mean"],
            new_attrs[6]["precision"],
        )
        return new_attrs, state_t

    return step


# ---------------------------------------------------------------------------
# sequential_likelihood (public API)
# ---------------------------------------------------------------------------


def sequential_likelihood(
    theta: dict[str, jax.Array],
    choices: np.ndarray,
    rewards: np.ndarray,
) -> jax.Array:
    """Sequential reference log-likelihood via lax.scan over pyhgf scan_fn.

    This re-implements the production sequential path using the SAME lax.scan
    call that parallel_scan_likelihood uses for initialisation, ensuring any
    rel-err in the numerical agreement test is attributable to the parallel
    algorithm, not a sequential-path implementation difference.
    (Per 25-03 deviation log on EKF-vs-lax.scan issue.)

    Parameters
    ----------
    theta : dict
        HGF parameters: omega_2, omega_3, kappa, beta, zeta.
    choices : np.ndarray, shape (T,), int
        Chosen cue index per trial.
    rewards : np.ndarray, shape (T,), int
        Reward (0 or 1) per trial.

    Returns
    -------
    log_lik : jax.Array, scalar
        Sum of per-trial softmax-stickiness log-likelihoods.
    """
    from jax import lax

    scan_fn, base_attrs = _get_static_network()
    attrs = _inject_theta(base_attrs, theta)
    n_trials = len(choices)
    scan_inputs_jax = _build_scan_inputs_jax(choices, rewards)

    _, node_traj = lax.scan(scan_fn, attrs, scan_inputs_jax)

    # expected_mean from binary INPUT nodes (0, 2, 4) — sigmoid probability
    mu1 = jnp.stack(
        [
            node_traj[0]["expected_mean"],
            node_traj[2]["expected_mean"],
            node_traj[4]["expected_mean"],
        ],
        axis=1,
    )  # (T, 3)

    beta_val = jnp.asarray(theta["beta"], dtype=jnp.float64)
    zeta_val = jnp.asarray(theta["zeta"], dtype=jnp.float64)
    choices_jax = jnp.array(choices, dtype=jnp.int32)

    prev = jnp.concatenate([jnp.array([-1], dtype=jnp.int32), choices_jax[:-1]])
    stick = (prev[:, None] == jnp.arange(3)[None, :]).astype(jnp.float64)
    logits = beta_val * mu1 + zeta_val * stick
    lp = jax.nn.log_softmax(logits, axis=1)
    result = jnp.sum(lp[jnp.arange(n_trials), choices_jax])

    return jnp.where(jnp.isnan(result), -jnp.inf, result)


# ---------------------------------------------------------------------------
# parallel_scan_likelihood (public API)
# ---------------------------------------------------------------------------


def parallel_scan_likelihood(
    theta: dict[str, jax.Array],
    choices: np.ndarray,
    rewards: np.ndarray,
    *,
    max_iter: int = 20,
    tol: float = 1e-5,
    init_trajectory: jax.Array | None = None,
) -> tuple[jax.Array, dict]:
    """Parallel-scan log-likelihood for one participant via quasi-ELK.

    Wraps the Windows-portable quasi-ELK re-implementation from
    scratch/reproduce_reference.py (commit aa5967e, validated at
    rel-err 1.28e-15 on coordinated-turn D=4/T=500).

    Algorithm (quasi-DEER from lindermanlab/elk deer.py):
      1. Determine starting trajectory y^(0) via one of three strategies:
         - Cold start (init_trajectory=None): replicate _initial_state(theta)
           for all T trials.  This is the natural starting point for a fresh
           NUTS call with no cached trajectory.  Measures K in worst-case
           parallel-vs-sequential regime (K=8-15 per 25-01 prediction).
         - Caller-supplied warm start (init_trajectory shape (T, D)): the
           caller passes a precomputed trajectory (e.g. linear interpolation
           from initial state to a coarse final-state estimate, or a cached
           trajectory from a prior parallel-scan call at nearby theta).
           This reduces K toward 1-3, matching the production NUTS leapfrog
           scenario where a trajectory cache is maintained across steps.
      2. For k = 0, 1, ..., max_iter:
         a. Compute diagonal Jacobians diag_jac[t] = diag(df/dy) at y^(k)[t-1].
         b. Compute bias: b[t] = f(y^(k)[t-1]) - diag_jac[t] * y^(k)[t-1].
         c. Solve y^(k+1) via _diagonal_matmul_recursive(+diag_jac, b, y0).
            Sign: +diag_jacs (NOT -diag_jacs) per 25-03 deviation log.
         d. Clip + NaN-guard.
         e. Check convergence: max|y^(k+1) - y^(k)| < tol.
      3. Extract log-likelihood from the converged trajectory.

    Initialisation strategy detail
    -------------------------------
    When init_trajectory is None (cold start), the Newton iterations begin at
    yt = replicated initial state: yt[t] = y0 for all t, where y0 =
    _attrs_to_flat(base_attrs).  This is the most conservative starting point
    and produces the largest K (worst-case parallel work).

    When init_trajectory is supplied (warm start), the caller is responsible
    for shape (T, D) agreement.  Two useful warm-start strategies:
      - Linear interpolation: jnp.linspace(y0, y_final_estimate, T) where
        y_final_estimate is a coarse guess for the final state.
      - Cached: yt from a prior call to parallel_scan_likelihood at the same
        or adjacent theta (e.g. previous NUTS leapfrog step).

    Log-likelihood computation
    --------------------------
    After quasi-ELK convergence, the converged flat trajectory yt contains
    the 8-dim state at each trial.  To extract expected_mean (sigmoid
    probability) for the LL computation, we use yt directly:
    expected_mean_binary_i[t] = sigmoid(mu_1_i[t-1 posterior]) where t-1
    uses the prepended y0 for t=0.

    For the numerical agreement test, this means the LL computed by
    parallel_scan_likelihood reflects the TRAJECTORY quality of quasi-ELK
    (how well yt matches the sequential pyhgf output), not just an identical
    lax.scan call.  The traj_max_rel_err diagnostic quantifies this directly.

    Parameters
    ----------
    theta : dict
        HGF parameters: omega_2, omega_3, kappa, beta, zeta.
    choices : np.ndarray, shape (T,), int
    rewards : np.ndarray, shape (T,), int
    max_iter : int
        Newton iteration cap.  Default 20.
    tol : float
        Convergence tolerance.  Default 1e-5.
    init_trajectory : jax.Array or None, shape (T, D), optional
        Starting trajectory for Newton iterations.  If None (default), uses
        cold start: replicated initial state y0 for all T trials.  Pass a
        precomputed trajectory for warm-start strategies (linear interpolation
        or cached trajectory).  This parameter does NOT change the API contract
        of the return values.

    Returns
    -------
    log_lik : jax.Array, scalar
    diagnostics : dict
        {
          "K_iters": int,
          "final_convergence_delta": float,
          "converged": bool,
          "err_trace": list[float],
          "traj_max_rel_err": float,
        }
    """
    from jax import lax

    scan_fn, base_attrs_ph = _get_static_network()
    base_attrs = _inject_theta(base_attrs_ph, theta)
    n_trials = len(choices)
    scan_inputs_jax = _build_scan_inputs_jax(choices, rewards)

    # -----------------------------------------------------------------------
    # Step 1: Sequential reference pass for traj_max_rel_err diagnostic.
    #
    # We always run one sequential pass to get yt_seq for comparison.
    # If init_trajectory is None (cold start), the Newton iterations begin at
    # the replicated initial state rather than yt_seq.  This is intentional:
    # cold-start benchmarks measure worst-case K (K=8-15 per 25-01 prediction),
    # while the sequential init was the source of the K=1 artifact observed in
    # checkpoint 1 (Newton started at the fixed point, trivially converging).
    # -----------------------------------------------------------------------
    _, node_traj_init = lax.scan(scan_fn, base_attrs, scan_inputs_jax)

    # Extract sequential flat trajectory for convergence comparison (diagnostic)
    yt_seq = jnp.stack(
        [
            node_traj_init[1]["mean"],
            node_traj_init[1]["precision"],
            node_traj_init[3]["mean"],
            node_traj_init[3]["precision"],
            node_traj_init[5]["mean"],
            node_traj_init[5]["precision"],
            node_traj_init[6]["mean"],
            node_traj_init[6]["precision"],
        ],
        axis=1,
    ).astype(jnp.float64)  # (T, 8)

    # Initial flat state (before trial 0)
    y0 = _attrs_to_flat(base_attrs)  # (8,)

    # -----------------------------------------------------------------------
    # Step 2: Build flat-state transition function for Jacobian computation.
    # f_flat(flat_prev, driver_flat) -> flat_next
    # where driver_flat = [values_c0, values_c1, values_c2, obs_c0, obs_c1, obs_c2]
    # -----------------------------------------------------------------------
    def f_flat(flat_prev: jax.Array, driver_flat: jax.Array) -> jax.Array:
        """One HGF step: flat state (8,) in, flat state (8,) out.

        Injects flat_prev into a shallow copy of base_attrs, runs scan_fn
        for one step, extracts the resulting flat state.

        Parameters
        ----------
        flat_prev : jax.Array, shape (8,)
        driver_flat : jax.Array, shape (6,)
            [values_c0, values_c1, values_c2, obs_c0, obs_c1, obs_c2]

        Returns
        -------
        jax.Array, shape (8,)
        """
        attrs = _flat_to_attrs_update(base_attrs, flat_prev)
        # Reconstruct per-trial input_t from driver_flat
        v0 = driver_flat[0:1]  # shape (1,) — values[0][t]
        v1 = driver_flat[1:2]
        v2 = driver_flat[2:3]
        o0 = driver_flat[3]  # scalar — observed[0][t]
        o1 = driver_flat[4]
        o2 = driver_flat[5]
        input_t = (
            (v0, v1, v2),
            (o0, o1, o2),
            jnp.float64(1.0),
            None,
        )
        new_attrs, _ = scan_fn(attrs, input_t)
        return _attrs_to_flat(new_attrs)

    # Build batched driver array (T, 6)
    drivers = _build_batched_inputs(choices, rewards)

    # -----------------------------------------------------------------------
    # Step 3: quasi-ELK Newton iterations
    # -----------------------------------------------------------------------
    if init_trajectory is not None:
        # Caller-supplied warm start: linear interp or cached trajectory.
        yt = jnp.asarray(init_trajectory, dtype=jnp.float64)
    else:
        # Cold start: replicate initial state for all T trials.
        # This is the natural starting point when no trajectory cache is
        # available.  Produces largest K (worst-case parallel work), matching
        # the 25-01 prediction of K=8-15 for weakly-contracting HGF.
        yt = jnp.broadcast_to(y0[None], (n_trials, _D_STATE)).astype(
            jnp.float64
        )  # (T, 8)

    err_trace: list[float] = []
    K_observed = 0

    for k in range(max_iter):
        # y_prev[t] = yt[t-1] (shifted; prepend y0)
        y_prev = jnp.concatenate([y0[None], yt[:-1]], axis=0)  # (T, 8)

        # Diagonal Jacobians: diag(df_flat/d_flat_prev) at each step
        # vmap over trials; jacfwd differentiates wrt first argument
        diag_jacs = jax.vmap(
            lambda s, d: jnp.diag(jax.jacfwd(f_flat, argnums=0)(s, d))
        )(y_prev, drivers)  # (T, 8)

        # Function values: f_flat(y_prev[t], driver[t])
        f_vals = jax.vmap(f_flat)(y_prev, drivers)  # (T, 8)

        # Linearisation bias: b[t] = f(y_prev[t]) - A[t]*y_prev[t]
        bias = f_vals - diag_jacs * y_prev  # (T, 8)

        # Solve linear recurrence: yt_new[t] = A[t]*yt_new[t-1] + b[t]
        # Sign convention: +diag_jacs (from 25-03 deviation log)
        full = _diagonal_matmul_recursive(diag_jacs, bias, y0)  # (T+1, 8)
        yt_new = full[1:]  # drop prepended y0; (T, 8)

        # Clip and NaN-guard (matching elk deer.py clip_ytnext logic)
        clip_val = 1e8
        yt_new = jnp.clip(yt_new, -clip_val, clip_val)
        yt_new = jnp.where(jnp.isnan(yt_new), 0.0, yt_new)

        err_jax = jnp.max(jnp.abs(yt_new - yt))
        K_observed = k + 1

        # Dual-mode convergence check: under eager use the concrete value
        # to break early; under tracing (jax.grad / jax.jit) skip the
        # break and let the Python for-loop unroll all max_iter iterations.
        # This keeps the prototype both fast in benchmarks and differentiable.
        if isinstance(err_jax, jax.core.Tracer):
            err_trace.append(float("nan"))  # placeholder; concrete err unavailable
            yt = yt_new
            continue

        err = float(err_jax)
        err_trace.append(err)
        yt = yt_new
        if err < tol:
            break

    # -----------------------------------------------------------------------
    # Step 4: Compute log-likelihood from converged trajectory yt.
    #
    # We run a final forward pass injecting each converged state into the
    # network to recover expected_mean.  Since the network's expected_mean is
    # computed via the prediction step from the PREVIOUS state, the most
    # accurate approach is to use yt directly as the posterior means and
    # compute expected_mean = sigmoid(level1_expected_mean).
    #
    # The level1 expected_mean (predicted mean) equals the posterior mean
    # from the previous step (autoconnection=1, no drift in pyhgf pick_best_cue).
    # Therefore: expected_mean_binary_i[t] = sigmoid(mu_1_i[t-1 posterior])
    # = sigmoid(yt[t-1, i*2]) for i in {0,1,2}.
    #
    # For the first trial, use y0 (initial state from base_attrs).
    #
    # This avoids a second full lax.scan and computes LL directly from yt.
    # -----------------------------------------------------------------------

    # Prepend y0 to yt to get previous states for prediction step
    yt_prev = jnp.concatenate([y0[None], yt[:-1]], axis=0)  # (T, 8)

    # mu_1 values for the prediction step at each trial:
    # mu_1_c0_pred[t] = yt_prev[t, 0] (level-1 c0 posterior from t-1)
    # The binary expected_mean = sigmoid(mu_1_predicted)
    # For pyhgf's prediction step: mu_1_pred = mu_1_prev (autoconnection=1)
    mu1_c0_pred = jax.nn.sigmoid(yt_prev[:, 0])  # (T,)
    mu1_c1_pred = jax.nn.sigmoid(yt_prev[:, 2])  # (T,)
    mu1_c2_pred = jax.nn.sigmoid(yt_prev[:, 4])  # (T,)

    mu1 = jnp.stack([mu1_c0_pred, mu1_c1_pred, mu1_c2_pred], axis=1)  # (T, 3)

    beta_val = jnp.asarray(theta["beta"], dtype=jnp.float64)
    zeta_val = jnp.asarray(theta["zeta"], dtype=jnp.float64)
    choices_jax = jnp.array(choices, dtype=jnp.int32)

    prev = jnp.concatenate([jnp.array([-1], dtype=jnp.int32), choices_jax[:-1]])
    stick = (prev[:, None] == jnp.arange(3)[None, :]).astype(jnp.float64)
    logits = beta_val * mu1 + zeta_val * stick
    lp = jax.nn.log_softmax(logits, axis=1)
    log_lik = jnp.sum(lp[jnp.arange(n_trials), choices_jax])
    log_lik = jnp.where(jnp.isnan(log_lik), -jnp.inf, log_lik)

    # Diagnostics: trajectory quality vs sequential reference (eager only;
    # under tracing the concrete float is unavailable so we record nan).
    traj_rel_err_jax = jnp.max(jnp.abs(yt - yt_seq) / (jnp.abs(yt_seq) + 1e-12))
    if isinstance(traj_rel_err_jax, jax.core.Tracer):
        traj_rel_err = float("nan")
    else:
        traj_rel_err = float(traj_rel_err_jax)

    diagnostics = {
        "K_iters": K_observed,
        "final_convergence_delta": err_trace[-1] if err_trace else 0.0,
        "converged": len(err_trace) > 0 and err_trace[-1] < tol,
        "err_trace": err_trace,
        "traj_max_rel_err": traj_rel_err,
    }

    return log_lik, diagnostics


__all__ = [
    "hgf_step",
    "make_hgf_step",
    "parallel_scan_likelihood",
    "sequential_likelihood",
]
