"""Seed the incremental CSVs from existing data sources.

Sources:
1. Old LLE CSV (100 rows, round_robin, no regime column) -> new LLE CSV with regime col
2. Old per-trial SR CSV (42000 rows, round_robin) -> new SR CSV with regime col
3. Log file for grw 100/100 results (lambda_hat_qr and summary stats only)
   NOTE: per-trial data for grw is NOT available in log, must be re-computed.

Strategy:
- Write round_robin LLE rows to new LLE CSV (100 rows) using old CSV
- Write round_robin per-trial SR rows to new SR CSV (42000 rows) using old SR CSV
- Do NOT seed grw rows — the incremental scan will compute them fresh.
  Rationale: we only have summary stats for grw, not per-trial data.
  The scan skip-logic will skip round_robin vectors already in the LLE CSV.
"""
from __future__ import annotations

import csv
import os

_SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
_RESULTS_DIR = os.path.join(_SCRIPT_DIR, "..", "results")

OLD_LLE_CSV = os.path.join(_RESULTS_DIR, "lipschitz_lle_distribution.csv")
OLD_SR_CSV = os.path.join(_RESULTS_DIR, "jacobian_spectral_radius_per_trial.csv")

NEW_LLE_CSV = os.path.join(_RESULTS_DIR, "lipschitz_lle_distribution_new.csv")
NEW_SR_CSV = os.path.join(_RESULTS_DIR, "jacobian_spectral_radius_per_trial_new.csv")

LLE_FIELDNAMES = [
    "regime", "param_vector_id", "omega_2", "omega_3", "kappa", "beta", "zeta",
    "lambda_hat_qr", "lambda_hat_gmsr", "max_singular_value", "num_trials_sigma_gt_1",
]
SR_FIELDNAMES = [
    "regime", "param_vector_id", "trial_index", "spectral_radius", "max_singular_value",
]


def main() -> None:
    # -----------------------------------------------------------------------
    # Seed LLE CSV with round_robin data from old CSV
    # -----------------------------------------------------------------------
    n_lle = 0
    with open(NEW_LLE_CSV, "w", newline="") as out_f:
        writer = csv.DictWriter(out_f, fieldnames=LLE_FIELDNAMES)
        writer.writeheader()
        with open(OLD_LLE_CSV, newline="") as in_f:
            reader = csv.DictReader(in_f)
            for row in reader:
                writer.writerow({
                    "regime": "round_robin",
                    "param_vector_id": int(row["param_vector_id"]),
                    "omega_2": float(row["omega_2"]),
                    "omega_3": float(row["omega_3"]),
                    "kappa": float(row["kappa"]),
                    "beta": float(row["beta"]),
                    "zeta": float(row["zeta"]),
                    "lambda_hat_qr": float(row["lambda_hat_qr"]),
                    # old column: lambda_hat (GMSR); new column: lambda_hat_gmsr
                    "lambda_hat_gmsr": float(row["lambda_hat"]),
                    "max_singular_value": float(row["max_singular_value"]),
                    "num_trials_sigma_gt_1": int(row["num_trials_sigma_gt_1"]),
                })
                n_lle += 1
    print(f"Seeded {n_lle} round_robin LLE rows -> {NEW_LLE_CSV}")

    # -----------------------------------------------------------------------
    # Seed SR CSV with round_robin data from old SR CSV
    # -----------------------------------------------------------------------
    n_sr = 0
    with open(NEW_SR_CSV, "w", newline="") as out_f:
        writer = csv.DictWriter(out_f, fieldnames=SR_FIELDNAMES)
        writer.writeheader()
        with open(OLD_SR_CSV, newline="") as in_f:
            reader = csv.DictReader(in_f)
            for row in reader:
                writer.writerow({
                    "regime": "round_robin",
                    "param_vector_id": int(row["param_vector_id"]),
                    "trial_index": int(row["trial_index"]),
                    "spectral_radius": float(row["spectral_radius"]),
                    "max_singular_value": float(row["max_singular_value"]),
                })
                n_sr += 1
    print(f"Seeded {n_sr} round_robin per-trial SR rows -> {NEW_SR_CSV}")

    # -----------------------------------------------------------------------
    # Replace originals
    # -----------------------------------------------------------------------
    os.replace(NEW_LLE_CSV, OLD_LLE_CSV)
    os.replace(NEW_SR_CSV, OLD_SR_CSV)
    print("Replaced originals with seeded versions.")
    print("LLE CSV now has: round_robin x 100 rows (regime column added)")
    print("SR CSV now has: round_robin x 42000 rows (regime column added)")
    print()
    print("Next: run lipschitz_scan.py — it will skip round_robin (already complete)")
    print("      and compute grw, oddball, reversal from scratch.")


if __name__ == "__main__":
    main()
