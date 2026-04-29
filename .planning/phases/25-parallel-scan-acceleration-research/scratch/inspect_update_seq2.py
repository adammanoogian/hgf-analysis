"""Inspect pyhgf update sequence for 3-level network - corrected."""
from __future__ import annotations

import sys
sys.path.insert(0, r"C:\Users\aman0087\Documents\Github\hgf-analysis\src")

import numpy as np
from prl_hgf.models.hgf_3level import build_3level_network

net = build_3level_network()
n_trials = 5
inp = np.zeros((n_trials, 3))
obs = np.zeros((n_trials, 3), dtype=int)
obs[:, 0] = 1

net.input_data(input_data=inp, observed=obs)

print("=== Update sequence ===")
us = net.update_sequence
print("Fields:", [f for f in dir(us) if not f.startswith("_")])
print()

# Print all fields
for field in dir(us):
    if field.startswith("_"):
        continue
    val = getattr(us, field)
    if callable(val):
        continue
    if val is None:
        print(f"{field}: None")
    else:
        print(f"{field}:")
        for item in val:
            node_idx, fn = item
            fn_name = fn.__name__ if hasattr(fn, "__name__") else fn.func.__name__ if hasattr(fn, "func") else type(fn).__name__
            print(f"  node_idx={node_idx}, fn={fn_name}")

print()
print("=== scan_fn type ===")
print(type(net.scan_fn))
import inspect
# Get the scan_fn closure
if hasattr(net.scan_fn, "__wrapped__"):
    print("wrapped:", net.scan_fn.__wrapped__)
if hasattr(net.scan_fn, "func"):
    print("func:", net.scan_fn.func)
