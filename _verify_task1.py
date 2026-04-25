"""Verification script for Task 1."""
from __future__ import annotations
import sys
sys.path.insert(0, "src")

import jax.numpy as jnp
import numpy as np
from prl_hgf.models.response_patrl import model_a_logp, model_b_logp, model_c_logp, MU2_CLIP

mu2 = jnp.zeros(5, dtype=jnp.float64)
ch = jnp.array([1, 0, 1, 0, 1], dtype=jnp.int32)
r = jnp.ones(5, dtype=jnp.float64)
s = jnp.ones(5, dtype=jnp.float64)
dhr = jnp.array([-2.0, -1.0, 0.0, 1.0, 2.0], dtype=jnp.float64)

a = model_a_logp(mu2, ch, r, s, 2.0, 0.3)
b = model_b_logp(mu2, ch, r, s, 2.0, 0.3, 0.5, dhr)
c = model_c_logp(mu2, ch, r, s, 2.0, 0.3, 0.1, 0.5, dhr)

print(f"shapes: {a.shape}, {b.shape}, {c.shape}")
assert a.shape == (5,), f"Expected (5,), got {a.shape}"
assert b.shape == (5,), f"Expected (5,), got {b.shape}"
assert c.shape == (5,), f"Expected (5,), got {c.shape}"
assert np.all(np.isfinite(np.asarray(a))), "a not finite"
assert np.all(np.isfinite(np.asarray(b))), "b not finite"
assert np.all(np.isfinite(np.asarray(c))), "c not finite"

# b=0 preserves Phase 18 behavior
a_old = model_a_logp(mu2, ch, r, s, 2.0)
a_b0 = model_a_logp(mu2, ch, r, s, 2.0, 0.0)
assert np.allclose(np.asarray(a_old), np.asarray(a_b0)), "b=0 does not preserve old behavior"

# gamma=0 in model_b equals model_a with same b
b_g0 = model_b_logp(mu2, ch, r, s, 2.0, 0.3, 0.0, dhr)
a_same_b = model_a_logp(mu2, ch, r, s, 2.0, 0.3)
assert np.allclose(np.asarray(b_g0), np.asarray(a_same_b), atol=1e-6), "gamma=0 doesn't equal model_a"

# alpha=0 in model_c equals model_b
c_a0 = model_c_logp(mu2, ch, r, s, 2.0, 0.3, 0.0, 0.5, dhr)
b_same = model_b_logp(mu2, ch, r, s, 2.0, 0.3, 0.5, dhr)
assert np.allclose(np.asarray(c_a0), np.asarray(b_same), atol=1e-6), "alpha=0 doesn't equal model_b"

print("Task 1: ALL CHECKS PASSED")
