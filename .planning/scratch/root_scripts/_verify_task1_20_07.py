"""Verification script for compute_recovery_metrics_patrl."""
from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import pandas as pd
from prl_hgf.analysis.recovery import compute_recovery_metrics_patrl

df = pd.DataFrame({
    "participant_id": ["P0", "P1", "P0", "P1", "P0", "P1"],
    "param": ["omega_2", "omega_2", "beta", "beta", "omega_3", "omega_3"],
    "true_value": [-3, -2, 2.0, 2.5, -6, -5],
    "posterior_mean": [-3.1, -2.1, 2.05, 2.55, -6.2, -4.8],
    "posterior_sd": [0.1] * 6,
})

out = compute_recovery_metrics_patrl(df)
print(out)
print()

# Assertions
omega3_row = out[out.param == "omega_3"].iloc[0]
assert bool(omega3_row["exploratory"]) is True, "omega_3 should be exploratory"
assert omega3_row["passes_threshold"] is pd.NA or pd.isna(omega3_row["passes_threshold"]), f"omega_3 passes_threshold should be pd.NA, got {omega3_row['passes_threshold']}"

mu3_0_absent = "mu3_0" not in out["param"].values
print(f"mu3_0 absent from output (only 2 params in df): {mu3_0_absent}")

omega2_row = out[out.param == "omega_2"].iloc[0]
assert bool(omega2_row["exploratory"]) is False, "omega_2 should NOT be exploratory"
# passes_threshold is bool (True/False) for primary params (may be numpy bool or python bool)
passes_val = omega2_row["passes_threshold"]
assert passes_val is not pd.NA and not (isinstance(passes_val, float) and pd.isna(passes_val)), f"omega_2 passes_threshold should not be NA, got {passes_val}"

print()
print("omega_3 exploratory:", omega3_row["exploratory"])
print("omega_3 passes_threshold:", omega3_row["passes_threshold"])
print("omega_2 exploratory:", omega2_row["exploratory"])
print("omega_2 passes_threshold:", omega2_row["passes_threshold"])
print()
print("ALL ASSERTIONS PASSED")
