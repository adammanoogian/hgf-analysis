"""Inspect pyhgf 3-level network attributes to understand state structure."""
from __future__ import annotations

import sys
sys.path.insert(0, r"C:\Users\aman0087\Documents\Github\hgf-analysis\src")

import numpy as np
from prl_hgf.models.hgf_3level import build_3level_network

net = build_3level_network()

# Print actual attribute values for the continuous-state nodes
for idx in [1, 3, 5, 6]:
    print(f"\n=== Node {idx} (continuous-state) ===")
    for k, v in sorted(net.attributes[idx].items()):
        if k != "temp":
            print(f"  {k}: {v}")
        else:
            print(f"  temp: {sorted(v.keys()) if hasattr(v, 'keys') else v}")

print("\n=== Node 0 (binary input) ===")
for k, v in sorted(net.attributes[0].items()):
    if k != "temp":
        print(f"  {k}: {v}")
    else:
        print(f"  temp: {sorted(v.keys()) if hasattr(v, 'keys') else v}")

# Also run a short forward pass to see after-step attributes
n_trials = 5
rng = np.random.default_rng(42)
outcomes = rng.integers(0, 2, (n_trials,))
chosen_cue = 0  # always choose cue 0

inp = np.zeros((n_trials, 3))
obs = np.zeros((n_trials, 3), dtype=int)
for t in range(n_trials):
    if outcomes[t]:
        inp[t, chosen_cue] = 1.0
    obs[t, chosen_cue] = 1

net.input_data(input_data=inp, observed=obs)

print("\n=== After forward pass ===")
print("node_trajectories keys:", sorted(net.node_trajectories.keys()))
print("Node 1 trajectory keys:", sorted(net.node_trajectories[1].keys()))
print("Node 6 trajectory keys:", sorted(net.node_trajectories[6].keys()))

# Print trajectories for level-1 belief node 1 and volatility node 6
print("\nNode 1 'mean':", net.node_trajectories[1]["mean"])
print("Node 1 'precision':", net.node_trajectories[1]["precision"])
print("Node 1 'expected_mean':", net.node_trajectories[1]["expected_mean"])
print("Node 1 'expected_precision':", net.node_trajectories[1]["expected_precision"])
print("Node 6 'mean':", net.node_trajectories[6]["mean"])
print("Node 6 'precision':", net.node_trajectories[6]["precision"])
print("Node 6 'expected_mean':", net.node_trajectories[6]["expected_mean"])
print("Node 6 'expected_precision':", net.node_trajectories[6]["expected_precision"])
