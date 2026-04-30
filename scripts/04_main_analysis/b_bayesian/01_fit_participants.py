"""Pipeline script — Stage 04: Fit participants via NUTS MCMC.

Loads simulated trial data from Phase 3, runs batch MCMC fitting using the
requested HGF model variant, and saves results to
``data/fitted/{model_name}_results.csv``.

Run one model variant at a time.  To fit both models, run the script twice:

    conda run -n ds_env python scripts/04_fit_participants.py --model hgf_2level
    conda run -n ds_env python scripts/04_fit_participants.py --model hgf_3level

Usage
-----
Run from the project root::

    conda run -n ds_env python scripts/04_fit_participants.py [--model MODEL] [--input PATH]

Options
-------
--model    HGF model variant to fit (default: ``hgf_2level``).
           Choices: hgf_2level, hgf_3level.
--input    Path to simulated data CSV (default:
           data/simulated/batch_simulation.csv; falls back to
           data/simulated/simulated_participants.csv if default not found).

Output
------
``data/fitted/{model_name}_results.csv`` — one row per
(participant_id, session, parameter) with full MCMC summary.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

# ---------------------------------------------------------------------------
# Ensure project root is on sys.path so that config.py is importable when
# running as a script.
# ---------------------------------------------------------------------------
_PROJECT_ROOT = Path(__file__).resolve().parents[3]
if str(_PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(_PROJECT_ROOT))

import pandas as pd  # noqa: E402 (after sys.path adjustment)

from config import DATA_DIR  # noqa: E402
from prl_hgf.env.task_config import load_config  # noqa: E402
from prl_hgf.fitting.batch import fit_batch  # noqa: E402


def _parse_args() -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description="Stage 04: batch MCMC fitting of simulated participants"
    )
    parser.add_argument(
        "--model",
        default="hgf_2level",
        choices=["hgf_2level", "hgf_3level"],
        help="HGF model variant to fit (default: hgf_2level)",
    )
    parser.add_argument(
        "--input",
        default=None,
        type=Path,
        help=(
            "Path to simulated data CSV. "
            "Defaults to data/simulated/batch_simulation.csv"
        ),
    )
    return parser.parse_args()


def main() -> None:
    """Load config, run batch fitting, save and summarise results."""
    args = _parse_args()
    config = load_config()
    fit_cfg = config.fitting

    # Resolve input path
    if args.input is not None:
        sim_path = Path(args.input)
    else:
        # Try canonical Phase-3 output path first
        sim_path = DATA_DIR / "simulated" / "batch_simulation.csv"
        if not sim_path.exists():
            # Fall back to alternate name
            alt_path = DATA_DIR / "simulated" / "simulated_participants.csv"
            if alt_path.exists():
                sim_path = alt_path
            else:
                print(
                    f"ERROR: Simulated data not found at {sim_path} or {alt_path}.\n"
                    "Run scripts/03_simulate_participants.py first."
                )
                sys.exit(1)

    if not sim_path.exists():
        print(
            f"ERROR: Simulated data not found at {sim_path}.\n"
            "Run scripts/03_simulate_participants.py first."
        )
        sys.exit(1)

    print("=" * 60)
    print("Stage 04 — Fit Participants")
    print("=" * 60)
    print(f"Model:            {args.model}")
    print(f"Input:            {sim_path}")
    print(f"Chains:           {fit_cfg.n_chains}")
    print(f"Draws:            {fit_cfg.n_draws}")
    print(f"Tune:             {fit_cfg.n_tune}")
    print(f"Target accept:    {fit_cfg.target_accept}")
    print(f"Random seed:      {fit_cfg.random_seed}")
    print()

    sim_df = pd.read_csv(sim_path)
    print(f"Loaded simulated data: {len(sim_df):,} rows, {sim_df.shape[1]} columns")

    n_sessions = sim_df.groupby(["participant_id", "session"]).ngroups
    print(f"Participant-sessions to fit: {n_sessions}")
    print()

    output_dir = DATA_DIR / "fitted"
    output_dir.mkdir(parents=True, exist_ok=True)
    output_path = output_dir / f"{args.model}_results.csv"

    results_df = fit_batch(
        sim_df=sim_df,
        model_name=args.model,
        n_chains=fit_cfg.n_chains,
        n_draws=fit_cfg.n_draws,
        n_tune=fit_cfg.n_tune,
        target_accept=fit_cfg.target_accept,
        random_seed=fit_cfg.random_seed,
        cores=1,  # cores=1 on Windows to avoid JAX process-isolation issues
        output_path=output_path,
    )

    # Summary statistics
    n_fits = results_df["participant_id"].nunique() if len(results_df) > 0 else 0
    n_flagged_sessions = (
        results_df.groupby(["participant_id", "session"])["flagged"]
        .any()
        .sum()
        if len(results_df) > 0
        else 0
    )
    mean_rhat = results_df["r_hat"].mean() if len(results_df) > 0 else float("nan")
    mean_ess = results_df["ess"].mean() if len(results_df) > 0 else float("nan")

    print()
    print("=" * 60)
    print("Fitting complete.")
    print(f"Total result rows:    {len(results_df):,}")
    print(f"Unique participants:  {n_fits}")
    print(f"Flagged sessions:     {n_flagged_sessions}")
    print(f"Mean R-hat:           {mean_rhat:.4f}")
    print(f"Mean ESS:             {mean_ess:.1f}")
    print(f"Output file:          {output_path}")
    print("=" * 60)


if __name__ == "__main__":
    main()
