"""Debug why epsilon2 variance test fails."""
from __future__ import annotations
import sys
sys.path.insert(0, "src")
import dataclasses
import numpy as np

from prl_hgf.env.pat_rl_config import load_pat_rl_config
from prl_hgf.env.pat_rl_simulator import simulate_patrl_cohort, run_hgf_forward_patrl
from prl_hgf.env.pat_rl_sequence import generate_session_patrl

config = load_pat_rl_config()

# Check what epsilon2 values look like
c = load_pat_rl_config()
trials = generate_session_patrl(c, seed=42)
mu2, eps2 = run_hgf_forward_patrl(trials, omega_2=-3.0, level=2, return_epsilon2=True)
print(f"eps2 stats: mean={np.mean(eps2):.4f} std={np.std(eps2):.4f} min={np.min(eps2):.4f} max={np.max(eps2):.4f}")
print(f"eps2 unique values: {len(np.unique(eps2))}")

# Now test the config patching
healthy_zero = dataclasses.replace(
    config.simulation.phenotypes["healthy"],
    epsilon2_coupling_coef=0.0,
)
print(f"Original coef: {config.simulation.phenotypes['healthy'].epsilon2_coupling_coef}")
print(f"Patched coef: {healthy_zero.epsilon2_coupling_coef}")

phenotypes_zero = {
    k: (healthy_zero if k == "healthy" else v)
    for k, v in config.simulation.phenotypes.items()
}
sim_zero = dataclasses.replace(
    config.simulation,
    phenotypes=phenotypes_zero,
)
config_zero = dataclasses.replace(config, simulation=sim_zero)

print(f"config_zero healthy coef: {config_zero.simulation.phenotypes['healthy'].epsilon2_coupling_coef}")

df_coupled, _, _ = simulate_patrl_cohort(
    n_participants=5, level=2, master_seed=42, config=config
)
df_zero, _, _ = simulate_patrl_cohort(
    n_participants=5, level=2, master_seed=42, config=config_zero
)

print(f"\nCoupled (coef=0.3) delta_hr stats: mean={df_coupled['delta_hr'].mean():.4f} std={df_coupled['delta_hr'].std():.4f}")
print(f"Zero (coef=0.0) delta_hr stats: mean={df_zero['delta_hr'].mean():.4f} std={df_zero['delta_hr'].std():.4f}")
print(f"Are they equal? {df_coupled['delta_hr'].equals(df_zero['delta_hr'])}")
print(f"Max diff: {(df_coupled['delta_hr'] - df_zero['delta_hr']).abs().max():.8f}")
