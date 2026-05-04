"""Smoke probe: pyhgf + JAX cross-version import and minimal HGF construction.

Run as::

    python scripts/ci/probe_pyhgf_jax_compat.py

Exits 0 on PROBE PASSED, 1 on PROBE FAILED.

Used by plan 27-01 CI matrix to populate the DEPS-02 decision record.
Tests the critical import + construction path without running a full fit.
Does not require GPU or cluster access.
"""

from __future__ import annotations

import sys


def main() -> int:
    """Run the pyhgf + JAX compatibility smoke probe.

    Parameters
    ----------
    None

    Returns
    -------
    int
        0 if all checks pass (PROBE PASSED), 1 if any check raises an exception
        (PROBE FAILED with exception printed to stderr).

    Notes
    -----
    Checks performed:

    1. Import ``jax``, ``pyhgf``, ``pyhgf.model.HGF``.
    2. Print ``jax.__version__`` and ``pyhgf.__version__``.
    3. Construct a 2-level binary HGF and ingest a short input sequence.
    4. Construct a 3-level binary HGF (the production model) and ingest input.
    5. Smoke ``jax.lax.scan`` directly (used internally by pyhgf's update loop).
    """
    try:
        import jax
        import numpy as np
        import pyhgf
        from pyhgf.model import HGF

        print(f"JAX: {jax.__version__}")
        print(f"pyhgf: {pyhgf.__version__}")

        # pyhgf 0.2.8 input_data() expects ndarray with shape (n_trials,) —
        # NOT a nested list or a 2d array with wrong axis orientation.
        _inputs = np.array([1, 0, 1, 1, 0], dtype=float)

        # Minimal 2-level binary HGF construction + one update step.
        hgf2 = HGF(n_levels=2, model_type="binary")
        hgf2.input_data(input_data=_inputs)
        print("2-level binary HGF: OK")

        # Minimal 3-level binary HGF (production model used in Phase 3+).
        hgf3 = HGF(n_levels=3, model_type="binary")
        hgf3.input_data(input_data=_inputs)
        print("3-level binary HGF: OK")

        # Confirm jax.lax.scan works (used internally by pyhgf's belief update).
        import jax.numpy as jnp

        xs = jnp.ones(5)
        carry, ys = jax.lax.scan(lambda c, x: (c + x, c), 0.0, xs)
        print(f"jax.lax.scan: OK (carry={carry})")

        print("PROBE PASSED")
        return 0

    except Exception as exc:  # noqa: BLE001
        print(f"PROBE FAILED: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
