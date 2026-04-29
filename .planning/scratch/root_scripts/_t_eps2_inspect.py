"""Investigate epsilon2 from pyhgf."""
from __future__ import annotations
import sys
sys.path.insert(0, "src")
import numpy as np

from prl_hgf.env.pat_rl_config import load_pat_rl_config
from prl_hgf.env.pat_rl_sequence import generate_session_patrl
from prl_hgf.models.hgf_2level_patrl import build_2level_network_patrl

config = load_pat_rl_config()
trials = generate_session_patrl(config, seed=42)

u = np.array([t.state for t in trials], dtype=np.float64)
n_trials = len(trials)

net = build_2level_network_patrl(omega_2=-3.0)
net.input_data(
    input_data=u[:, None],
    time_steps=np.ones(n_trials, dtype=np.float64),
)

# Inspect node trajectories
print("Node trajectory keys at node 1:")
traj1 = net.node_trajectories[1]
print("  Top-level keys:", list(traj1.keys()))
if "temp" in traj1:
    print("  'temp' keys:", list(traj1["temp"].keys()))
    for k, v in traj1["temp"].items():
        arr = np.asarray(v)
        print(f"    temp[{k!r}]: shape={arr.shape}, mean={float(np.mean(arr)):.4f}, std={float(np.std(arr)):.4f}, sample={arr[:3]}")

print("\nNode trajectory keys at node 0:")
traj0 = net.node_trajectories[0]
print("  Top-level keys:", list(traj0.keys()))
if "temp" in traj0:
    print("  'temp' keys:", list(traj0["temp"].keys()))
    for k, v in traj0["temp"].items():
        arr = np.asarray(v)
        print(f"    temp[{k!r}]: shape={arr.shape}, mean={float(np.mean(arr)):.4f}, std={float(np.std(arr)):.4f}, sample={arr[:3]}")

print("\nAll node indices available:", list(net.node_trajectories.keys()))
for nidx in net.node_trajectories.keys():
    t = net.node_trajectories[nidx]
    top = list(t.keys())
    print(f"  node {nidx}: keys={top}")
    if "temp" in t:
        print(f"    temp keys: {list(t['temp'].keys())}")
