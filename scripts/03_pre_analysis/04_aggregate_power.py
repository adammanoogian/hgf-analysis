#!/usr/bin/env python
"""Aggregate per-job parquet files from the power sweep into summary CSVs.

This script concatenates all ``.parquet`` files produced by
``08_run_power_iteration.py``, validates schema, warns on missing grid cells,
and writes three output files:

- ``power_master.csv``   — full concatenated result set
- ``power_a_summary.csv`` — P(BF > threshold) by (n_per_group, effect_size)
- ``power_b_summary.csv`` — P(correct BMS) by n_per_group

Run after the SLURM array job completes and all parquet files have been
transferred to ``--input-dir``.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

# Ensure project root is on sys.path so imports work on cluster
# without an editable install.
sys.path.insert(0, str(Path(__file__).resolve().parent.parent.parent))

import config as _cfg
from prl_hgf.power.curves import aggregate_parquets, compute_power_a, compute_power_b


def parse_args() -> argparse.Namespace:
    """Parse command-line arguments.

    Returns
    -------
    argparse.Namespace
        Parsed arguments with attributes: input_dir, output_dir.
    """
    parser = argparse.ArgumentParser(
        description=(
            "Aggregate power sweep parquet files into summary CSVs. "
            "Writes power_master.csv, power_a_summary.csv, power_b_summary.csv."
        ),
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument(
        "--input-dir",
        type=Path,
        default=_cfg.MODELS_DIR / "power",
        help="Directory containing .parquet files from the power sweep.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=_cfg.MODELS_DIR / "power",
        help="Directory where summary CSVs will be written.",
    )
    return parser.parse_args()


def main() -> None:
    """Aggregate parquet files and compute power curves.

    Raises
    ------
    FileNotFoundError
        If no .parquet files are found in ``--input-dir``.
    SystemExit
        On argument parse error (via argparse).
    """
    args = parse_args()

    input_dir: Path = args.input_dir
    output_dir: Path = args.output_dir
    output_dir.mkdir(parents=True, exist_ok=True)

    print(f"Aggregating parquet files from: {input_dir}")
    master_df = aggregate_parquets(input_dir)

    # Write master CSV
    master_path = output_dir / "power_master.csv"
    master_df.to_csv(master_path, index=False)
    print(f"Wrote {len(master_df)} rows to {master_path}")

    # Summary statistics
    unique_n = sorted(master_df["n_per_group"].unique())
    unique_d = sorted(master_df["effect_size"].unique())
    unique_st = sorted(master_df["sweep_type"].unique())
    print(
        f"\nSummary:"
        f"\n  Total rows      : {len(master_df)}"
        f"\n  N/group levels  : {len(unique_n)} — {unique_n}"
        f"\n  Effect sizes    : {len(unique_d)} — {unique_d}"
        f"\n  Sweep types     : {len(unique_st)} — {unique_st}"
    )

    # Power Analysis A: P(BF > threshold) per (n_per_group, effect_size)
    power_a = compute_power_a(master_df)
    power_a_path = output_dir / "power_a_summary.csv"
    power_a.to_csv(power_a_path, index=False)
    print(f"\nWrote {len(power_a)} rows to {power_a_path}")

    # Power Analysis B: P(correct BMS) per n_per_group
    power_b = compute_power_b(master_df)
    power_b_path = output_dir / "power_b_summary.csv"
    power_b.to_csv(power_b_path, index=False)
    print(f"Wrote {len(power_b)} rows to {power_b_path}")


if __name__ == "__main__":
    main()
