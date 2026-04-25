"""Task 2 verification script."""
from __future__ import annotations
import sys
sys.path.insert(0, "src")

from prl_hgf.env.pat_rl_simulator import simulate_patrl_cohort
from prl_hgf.env.pat_rl_config import load_pat_rl_config

c = load_pat_rl_config()
df, tp, tbp = simulate_patrl_cohort(
    n_participants=3, level=2, master_seed=42, config=c, phenotype_name="healthy"
)
assert "phenotype" in df.columns, f"Missing phenotype col, got: {list(df.columns)}"
assert set(df["phenotype"].unique()) == {"healthy"}, f"Got: {df['phenotype'].unique()}"
bounds = c.task.delta_hr_stub.bounds
assert df["delta_hr"].between(bounds[0], bounds[1]).all(), (
    f"delta_hr out of bounds [{bounds[0]}, {bounds[1]}]: "
    f"min={df['delta_hr'].min()}, max={df['delta_hr'].max()}"
)
print("Task 2 verify OK")
print("Columns:", list(df.columns))
print(f"delta_hr stats: min={df['delta_hr'].min():.3f} max={df['delta_hr'].max():.3f}")

# Test backward compat: no phenotype_name kwarg
df2, tp2, tbp2 = simulate_patrl_cohort(
    n_participants=2, level=2, master_seed=10, config=c
)
assert "phenotype" in df2.columns
print("Backward compat (no phenotype_name kwarg): OK")

# Test ValueError for model_d + no lam_true
try:
    simulate_patrl_cohort(
        n_participants=2, level=2, master_seed=10, config=c,
        response_model="model_d", lam_true=None
    )
    raise AssertionError("Expected ValueError not raised")
except ValueError as e:
    print(f"ValueError for model_d+no lam_true: OK ({e})")

# Test ValueError for non-model_d + lam_true
try:
    simulate_patrl_cohort(
        n_participants=2, level=2, master_seed=10, config=c,
        response_model="model_a", lam_true=0.1
    )
    raise AssertionError("Expected ValueError not raised")
except ValueError as e:
    print(f"ValueError for model_a+lam_true: OK ({e})")

print("ALL TASK 2 CHECKS PASSED")
