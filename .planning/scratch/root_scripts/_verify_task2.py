"""Verification script for Task 2."""
from __future__ import annotations
import sys
sys.path.insert(0, "src")

import inspect
from prl_hgf.fitting.hierarchical_patrl import build_logp_fn_batched_patrl

sig = inspect.signature(build_logp_fn_batched_patrl)
params = list(sig.parameters)
print(f"build_logp_fn_batched_patrl params: {params}")
assert "delta_hr_arr" in params, f"delta_hr_arr not in signature: {params}"
assert "response_model" in params, f"response_model not in signature: {params}"

# Verify compile only, not run (that's in Task 4 tests)
print("Task 2: SIGNATURE CHECK PASSED")
