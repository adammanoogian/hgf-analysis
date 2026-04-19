"""Verification script for Task 3 (Plan 20-03): Model D param orders."""
from __future__ import annotations
import sys
sys.path.insert(0, "src")

from prl_hgf.fitting.fit_vb_laplace_patrl import fit_vb_laplace_patrl  # noqa: F401
print("fit_vb_laplace_patrl import OK")

from prl_hgf.fitting.laplace_idata import (
    _PARAM_ORDER_2LEVEL,
    _PARAM_ORDER_2LEVEL_B,
    _PARAM_ORDER_2LEVEL_C,
    _PARAM_ORDER_2LEVEL_D,
    _PARAM_ORDER_3LEVEL,
    _PARAM_ORDER_3LEVEL_B,
    _PARAM_ORDER_3LEVEL_C,
    _PARAM_ORDER_3LEVEL_D,
    _VALID_PARAM_ORDERS,
)

print(f"_PARAM_ORDER_2LEVEL_D = {_PARAM_ORDER_2LEVEL_D}")
print(f"_PARAM_ORDER_3LEVEL_D = {_PARAM_ORDER_3LEVEL_D}")

assert "lam" in _PARAM_ORDER_2LEVEL_D, "lam missing from 2LEVEL_D"
assert "lam" in _PARAM_ORDER_3LEVEL_D, "lam missing from 3LEVEL_D"
assert "gamma" not in _PARAM_ORDER_2LEVEL_D, "gamma should NOT be in 2LEVEL_D"

assert _PARAM_ORDER_2LEVEL_D in _VALID_PARAM_ORDERS, "D-2level not in valid orders"
assert _PARAM_ORDER_3LEVEL_D in _VALID_PARAM_ORDERS, "D-3level not in valid orders"

# Existing plan 20-02 orders still valid
assert _PARAM_ORDER_2LEVEL_B in _VALID_PARAM_ORDERS
assert _PARAM_ORDER_2LEVEL_C in _VALID_PARAM_ORDERS
assert _PARAM_ORDER_3LEVEL_B in _VALID_PARAM_ORDERS
assert _PARAM_ORDER_3LEVEL_C in _VALID_PARAM_ORDERS

print("Task 3: ALL CHECKS PASSED")
