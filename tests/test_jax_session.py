"""Unit tests for simulate_session_jax (JAX-native single-session simulator).

Tests cover:

1. **Output shapes** — correct shapes for choices, rewards, diverged scalars.
2. **Determinism** — same seed reproduces identical output.
3. **Seed sensitivity** — different seeds produce different outputs.
4. **Stickiness sentinel safety** — ``zeta=0`` with ``prev_choice=-1`` sentinel
   does not crash.
5. **Beta effect** — higher inverse temperature leads to more exploitation of
   the best cue.

All tests are marked ``@pytest.mark.slow`` because they compile the JAX scan
on first call (XLA JIT compilation takes ~5-30 s).

Run::

    pytest tests/test_jax_session.py -v -m slow
"""

from __future__ import annotations

import sys
from pathlib import Path

import jax
import jax.numpy as jnp
import numpy as np
import pytest

_root = Path(__file__).resolve().parents[1]
if str(_root) not in sys.path:
    sys.path.insert(0, str(_root))

from prl_hgf.env.simulator import generate_session
from prl_hgf.env.task_config import load_config
from prl_hgf.simulation.jax_session import simulate_session_jax

# ---------------------------------------------------------------------------
# Shared helper
# ---------------------------------------------------------------------------


def _make_cue_probs() -> tuple[jnp.ndarray, int]:
    """Load config, generate session, return ``(cue_probs_arr, n_trials)``.

    Returns
    -------
    cue_probs_arr : jnp.ndarray, shape (n_trials, 3)
        Per-trial reward probabilities for each cue.
    n_trials : int
        Total number of trials in the session.
    """
    config = load_config()
    trials = generate_session(config, seed=0)
    cue_probs_arr = jnp.array([t.cue_probs for t in trials], dtype=jnp.float32)
    return cue_probs_arr, len(trials)


# Default parameters for most tests
_DEFAULT_PARAMS = {
    "omega_2": jnp.float32(-3.0),
    "omega_3": jnp.float32(-6.0),
    "kappa": jnp.float32(1.0),
    "beta": jnp.float32(2.0),
    "zeta": jnp.float32(0.5),
}


# ---------------------------------------------------------------------------
# Test 1: Output shapes
# ---------------------------------------------------------------------------


@pytest.mark.slow
def test_session_jax_output_shapes() -> None:
    """simulate_session_jax returns correct output shapes for a full session.

    Verifies:
    - choices.shape == (n_trials,)
    - rewards.shape == (n_trials,)
    - diverged.shape == ()
    - All choices in {0, 1, 2}
    - All rewards in {0, 1}
    """
    cue_probs_arr, n_trials = _make_cue_probs()

    choices, rewards, diverged = simulate_session_jax(
        **_DEFAULT_PARAMS,
        cue_probs_arr=cue_probs_arr,
        rng_key=jax.random.PRNGKey(42),
    )

    assert choices.shape == (n_trials,), (
        f"Expected choices.shape == ({n_trials},), got {choices.shape}"
    )
    assert rewards.shape == (n_trials,), (
        f"Expected rewards.shape == ({n_trials},), got {rewards.shape}"
    )
    assert diverged.shape == (), (
        f"Expected diverged.shape == (), got {diverged.shape}"
    )

    # Choices must be valid cue indices
    assert jnp.all((choices >= 0) & (choices <= 2)), (
        f"Found choices outside {{0, 1, 2}}: {np.unique(np.array(choices))}"
    )

    # Rewards must be binary
    assert jnp.all((rewards >= 0) & (rewards <= 1)), (
        f"Found rewards outside {{0, 1}}: {np.unique(np.array(rewards))}"
    )


# ---------------------------------------------------------------------------
# Test 2: Determinism
# ---------------------------------------------------------------------------


@pytest.mark.slow
def test_session_jax_deterministic() -> None:
    """Same PRNG seed produces bit-identical output across two calls."""
    cue_probs_arr, _ = _make_cue_probs()
    key = jax.random.PRNGKey(99)

    choices1, rewards1, diverged1 = simulate_session_jax(
        **_DEFAULT_PARAMS, cue_probs_arr=cue_probs_arr, rng_key=key
    )
    choices2, rewards2, diverged2 = simulate_session_jax(
        **_DEFAULT_PARAMS, cue_probs_arr=cue_probs_arr, rng_key=key
    )

    assert jnp.array_equal(choices1, choices2), "choices differ across identical seeds"
    assert jnp.array_equal(rewards1, rewards2), "rewards differ across identical seeds"
    assert diverged1 == diverged2, "diverged differs across identical seeds"


# ---------------------------------------------------------------------------
# Test 3: Different seeds produce different outputs
# ---------------------------------------------------------------------------


@pytest.mark.slow
def test_session_jax_different_seeds_differ() -> None:
    """Different PRNG seeds produce non-identical choice sequences."""
    cue_probs_arr, _ = _make_cue_probs()

    choices1, _, _ = simulate_session_jax(
        **_DEFAULT_PARAMS,
        cue_probs_arr=cue_probs_arr,
        rng_key=jax.random.PRNGKey(0),
    )
    choices2, _, _ = simulate_session_jax(
        **_DEFAULT_PARAMS,
        cue_probs_arr=cue_probs_arr,
        rng_key=jax.random.PRNGKey(1),
    )

    assert not jnp.array_equal(choices1, choices2), (
        "Expected different choices for different seeds, but got identical sequences"
    )


# ---------------------------------------------------------------------------
# Test 4: Stickiness sentinel safety
# ---------------------------------------------------------------------------


@pytest.mark.slow
def test_session_jax_stickiness_sentinel() -> None:
    """zeta=0 with the -1 sentinel does not crash and produces varied choices.

    The ``prev_choice = jnp.int32(-1)`` sentinel on trial 0 must evaluate to
    all-False in the comparison ``(prev_choice == jnp.arange(3))``, giving
    zero stickiness.  Verify the function runs without error.

    With ``zeta=0`` and ``beta=10`` the agent should mostly exploit the best
    cue but not always — so choices should not all be the same value.
    """
    cue_probs_arr, _ = _make_cue_probs()

    params_no_stick = {
        "omega_2": jnp.float32(-3.0),
        "omega_3": jnp.float32(-6.0),
        "kappa": jnp.float32(1.0),
        "beta": jnp.float32(10.0),
        "zeta": jnp.float32(0.0),
    }

    choices, rewards, diverged = simulate_session_jax(
        **params_no_stick,
        cue_probs_arr=cue_probs_arr,
        rng_key=jax.random.PRNGKey(7),
    )

    # Function ran without error
    assert choices.shape[0] > 0, "Expected non-empty choices"

    # With 3 cues and finite beta, agent should not get stuck on one cue
    # (not all choices should be identical)
    unique_choices = jnp.unique(choices)
    assert len(unique_choices) > 1, (
        f"Expected varied choices, but got only {unique_choices}. "
        "Stickiness sentinel may have caused degenerate behavior."
    )


# ---------------------------------------------------------------------------
# Test 5: Beta effect on choice behavior
# ---------------------------------------------------------------------------


@pytest.mark.slow
def test_session_jax_beta_effect() -> None:
    """Higher beta leads to more exploitation of the best cue.

    With ``beta=0.1`` choices are near-uniform across cues.
    With ``beta=10.0`` the agent strongly exploits the highest-probability cue.

    Verify that the mean frequency of the best cue is higher for ``beta=10``
    than for ``beta=0.1``.
    """
    cue_probs_arr, n_trials = _make_cue_probs()

    # Determine best cue per trial from cue_probs_arr
    best_cue_per_trial = jnp.argmax(cue_probs_arr, axis=1)  # shape (n_trials,)

    base_params = {
        "omega_2": jnp.float32(-3.0),
        "omega_3": jnp.float32(-6.0),
        "kappa": jnp.float32(1.0),
        "zeta": jnp.float32(0.0),
    }

    # Low beta: near-uniform, minimal exploitation
    choices_low, _, _ = simulate_session_jax(
        **base_params,
        beta=jnp.float32(0.1),
        cue_probs_arr=cue_probs_arr,
        rng_key=jax.random.PRNGKey(42),
    )

    # High beta: exploit best cue
    choices_high, _, _ = simulate_session_jax(
        **base_params,
        beta=jnp.float32(10.0),
        cue_probs_arr=cue_probs_arr,
        rng_key=jax.random.PRNGKey(42),
    )

    # Fraction of trials where agent chose the best cue
    best_freq_low = jnp.mean(
        (choices_low == best_cue_per_trial).astype(jnp.float32)
    )
    best_freq_high = jnp.mean(
        (choices_high == best_cue_per_trial).astype(jnp.float32)
    )

    assert float(best_freq_high) > float(best_freq_low), (
        f"Expected beta=10.0 to exploit best cue more than beta=0.1, "
        f"but got best_freq_high={best_freq_high:.3f} <= best_freq_low={best_freq_low:.3f}"
    )
