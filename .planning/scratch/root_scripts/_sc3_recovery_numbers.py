"""Get SC3 lambda recovery numbers for SUMMARY documentation."""
from __future__ import annotations
import numpy as np
from prl_hgf.env.pat_rl_config import load_pat_rl_config
from prl_hgf.env.pat_rl_simulator import simulate_patrl_cohort
from prl_hgf.fitting.fit_vb_laplace_patrl import fit_vb_laplace_patrl

lam_true = 0.1
config = load_pat_rl_config()
print("Simulating 5-agent Model D cohort (lam_true=0.1)...")
sim_df, true_params, _ = simulate_patrl_cohort(
    n_participants=5,
    level=2,
    master_seed=42,
    config=config,
    response_model="model_d",
    lam_true=lam_true,
)
print("Fitting with Laplace model_d...")
idata = fit_vb_laplace_patrl(
    sim_df,
    "hgf_2level_patrl",
    response_model="model_d",
    n_pseudo_draws=500,
    max_iter=200,
    config=config,
)
participants = sorted(sim_df["participant_id"].astype(str).unique().tolist())
lam_vals = idata.posterior["lam"].values  # (1, n_pseudo_draws, P)
print("\nLambda recovery results (SC3 gate: >=3/5 within 0.3 of truth):")
print(f"{'Agent':8} {'true_lam':10} {'post_mean':12} {'|err|':8} {'status':6}")
n_within = 0
for i, pid in enumerate(participants):
    pm = float(np.mean(lam_vals[:, :, i]))
    err = abs(pm - lam_true)
    status = "PASS" if err < 0.3 else "FAIL"
    if err < 0.3:
        n_within += 1
    print(f"{pid:8} {lam_true:10.3f} {pm:12.4f} {err:8.4f} {status:6}")
print(f"\nResult: {n_within}/5 agents within 0.3 of truth (gate: >=3)")
print("SC3 GATE:", "PASS" if n_within >= 3 else "FAIL")
