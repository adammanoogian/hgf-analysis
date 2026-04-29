"""Inspect pyhgf update sequence for 3-level network."""
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

print("pre_prediction_steps:", us.pre_prediction_steps)
print("prediction_steps:")
for step in us.prediction_steps:
    node_idx, fn = step
    print(f"  node_idx={node_idx}, fn={fn.__name__ if hasattr(fn, '__name__') else type(fn).__name__}")

print("action_steps:", us.action_steps)
print("observation_steps:")
for step in us.observation_steps:
    node_idx, fn = step
    print(f"  node_idx={node_idx}, fn={fn.__name__ if hasattr(fn, '__name__') else type(fn).__name__}")

print("update_steps:")
for step in us.update_steps:
    node_idx, fn = step
    print(f"  node_idx={node_idx}, fn={fn.__name__ if hasattr(fn, '__name__') else type(fn).__name__}")

print("post_update_steps:", us.post_update_steps)

print("\n=== scan_fn type ===")
print(type(net.scan_fn))
print(net.scan_fn)
