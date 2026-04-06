"""Phase 5: Parameter recovery validation and Bayesian model comparison.

Loads simulation data and fitting results, computes recovery metrics and
scatter plots, runs random-effects BMS (Rigoux et al. 2014), and saves
all outputs to results/validation/.

Usage
-----
Run from the project root::

    conda run -n ds_env python scripts/05_run_validation.py
    conda run -n ds_env python scripts/05_run_validation.py --skip-waic

Options
-------
--skip-waic
    Skip the slow WAIC computation (useful for recovery-only diagnostics).
--sim-path PATH
    Path to simulated data CSV.  Default: ``results/simulated_data.csv``.
--fit-path-2level PATH
    Path to 2-level fit results CSV.  Default:
    ``results/fit_results_hgf_2level.csv``.
--fit-path-3level PATH
    Path to 3-level fit results CSV.  Default:
    ``results/fit_results_hgf_3level.csv``.
--idata-dir PATH
    Directory containing per-participant InferenceData .nc files, organised
    as ``{idata_dir}/{model}/{participant_id}_{group}_{session}.nc``.
    Default: ``results/idata``.

Output
------
``results/validation/`` directory with:

* ``recovery_metrics_{model}.csv``   — per-parameter r, p, bias, RMSE
* ``recovery_scatter_{model}.png``   — scatter plots (true vs recovered)
* ``correlation_matrix_{model}.png`` — inter-parameter correlation heatmap
* ``waic_results.csv``               — per-participant ELPD-WAIC by model
* ``bms_summary.csv``                — BMS summary (exp_r, xp, pxp, bor)
* ``bms_exceedance.png``             — exceedance probability bar plot
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

# ---------------------------------------------------------------------------
# Ensure project root is on sys.path so that config.py is importable when
# running as a script.
# ---------------------------------------------------------------------------
_PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(_PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(_PROJECT_ROOT))

import pandas as pd  # noqa: E402

from config import RESULTS_DIR, VALIDATION_DIR  # noqa: E402
from prl_hgf.analysis.bms import (  # noqa: E402
    compute_batch_waic,
    plot_exceedance_probabilities,
    run_stratified_bms,
)
from prl_hgf.analysis.plots import (  # noqa: E402
    plot_correlation_matrix,
    plot_recovery_scatter,
)
from prl_hgf.analysis.recovery import (  # noqa: E402
    build_recovery_df,
    compute_correlation_matrix,
    compute_recovery_metrics,
)

_MODEL_NAMES = ["hgf_2level", "hgf_3level"]


# ---------------------------------------------------------------------------
# CLI argument parsing
# ---------------------------------------------------------------------------


def _parse_args() -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description=(
            "Phase 5: Parameter recovery validation and Bayesian model comparison."
        )
    )
    parser.add_argument(
        "--skip-waic",
        action="store_true",
        default=False,
        help="Skip WAIC computation (useful for recovery-only diagnostics).",
    )
    parser.add_argument(
        "--sim-path",
        default=None,
        type=Path,
        help=(
            "Path to simulated data CSV. "
            "Default: results/simulated_data.csv"
        ),
    )
    parser.add_argument(
        "--fit-path-2level",
        default=None,
        type=Path,
        dest="fit_path_2level",
        help=(
            "Path to 2-level fit results CSV. "
            "Default: results/fit_results_hgf_2level.csv"
        ),
    )
    parser.add_argument(
        "--fit-path-3level",
        default=None,
        type=Path,
        dest="fit_path_3level",
        help=(
            "Path to 3-level fit results CSV. "
            "Default: results/fit_results_hgf_3level.csv"
        ),
    )
    parser.add_argument(
        "--idata-dir",
        default=None,
        type=Path,
        dest="idata_dir",
        help=(
            "Directory containing per-participant InferenceData .nc files. "
            "Default: results/idata"
        ),
    )
    return parser.parse_args()


# ---------------------------------------------------------------------------
# Data loading helpers
# ---------------------------------------------------------------------------


def _resolve_sim_path(args_path: Path | None) -> Path:
    """Return resolved path to simulated data CSV, or exit with instructions."""
    if args_path is not None:
        return args_path

    candidates = [
        RESULTS_DIR / "simulated_data.csv",
        RESULTS_DIR / "batch_simulation.csv",
        _PROJECT_ROOT / "data" / "simulated" / "batch_simulation.csv",
        _PROJECT_ROOT / "data" / "simulated" / "simulated_participants.csv",
    ]
    for p in candidates:
        if p.exists():
            return p

    print(
        "ERROR: Simulated data not found.  Expected at:\n"
        f"  {candidates[0]}\n"
        "Run scripts/03_simulate_participants.py first, then move or symlink "
        "the output to results/simulated_data.csv"
    )
    sys.exit(1)


def _resolve_fit_path(model: str, args_path: Path | None) -> Path | None:
    """Return resolved path to fit results CSV, or None if missing."""
    if args_path is not None:
        return args_path if args_path.exists() else None

    candidates = [
        RESULTS_DIR / f"fit_results_{model}.csv",
        _PROJECT_ROOT / "data" / "fitted" / f"{model}_results.csv",
    ]
    for p in candidates:
        if p.exists():
            return p
    return None


def _load_fit_df(model: str, path: Path | None) -> pd.DataFrame | None:
    """Load fit DataFrame or return None if file is missing."""
    if path is None or not path.exists():
        print(
            f"  WARNING: Fit results for {model} not found. "
            "Run scripts/04_fit_participants.py first."
        )
        return None
    df = pd.read_csv(path)
    print(f"  Loaded {model} fit results: {len(df):,} rows from {path}")
    return df


# ---------------------------------------------------------------------------
# InferenceData loading / re-fitting helpers
# ---------------------------------------------------------------------------


def _load_idata_from_nc(
    sim_df: pd.DataFrame,
    model: str,
    idata_dir: Path,
) -> dict[tuple, object]:
    """Load InferenceData objects from .nc files for all participants.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        Simulation DataFrame (used to enumerate participant keys).
    model : str
        Model name (subdirectory under ``idata_dir``).
    idata_dir : Path
        Root directory for .nc files.  Files are expected at
        ``{idata_dir}/{model}/{pid}_{group}_{session}.nc``.

    Returns
    -------
    dict mapping ``(participant_id, group, session)`` to InferenceData or None.
    """
    import arviz as az

    keys = (
        sim_df[["participant_id", "group", "session"]]
        .drop_duplicates()
        .itertuples(index=False, name=None)
    )
    idata_map: dict[tuple, object] = {}
    model_dir = idata_dir / model
    n_loaded = 0
    n_missing = 0

    for pid, grp, sess in keys:
        nc_path = model_dir / f"{pid}_{grp}_{sess}.nc"
        if nc_path.exists():
            idata_map[(pid, grp, sess)] = az.from_netcdf(str(nc_path))
            n_loaded += 1
        else:
            idata_map[(pid, grp, sess)] = None
            n_missing += 1

    print(
        f"  idata ({model}): loaded {n_loaded}, missing {n_missing}"
    )
    return idata_map


def _refetch_idata_via_batch(
    sim_df: pd.DataFrame,
    model: str,
    fit_cfg,
) -> dict[tuple, object]:
    """Re-run fit_batch with return_idata=True to obtain InferenceData objects.

    Used as fallback when .nc files are absent.  Runs full MCMC again, which
    is slow — budget 3-5 hours for 180 participants.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        Simulation data.
    model : str
        Model name.
    fit_cfg : FittingConfig
        MCMC settings from config.

    Returns
    -------
    dict mapping ``(participant_id, group, session)`` to InferenceData.
    """
    from prl_hgf.fitting.batch import fit_batch

    print(
        f"  No .nc files found for {model}. Re-fitting to obtain InferenceData "
        "(this may take several hours)..."
    )
    _, idata_dict = fit_batch(
        sim_df=sim_df,
        model_name=model,
        n_chains=fit_cfg.n_chains,
        n_draws=fit_cfg.n_draws,
        n_tune=fit_cfg.n_tune,
        target_accept=fit_cfg.target_accept,
        random_seed=fit_cfg.random_seed,
        cores=1,
        return_idata=True,
    )
    return idata_dict


# ---------------------------------------------------------------------------
# Recovery analysis
# ---------------------------------------------------------------------------


def _run_recovery(
    sim_df: pd.DataFrame,
    fit_df: pd.DataFrame,
    model: str,
) -> tuple[pd.DataFrame, pd.DataFrame, pd.DataFrame] | None:
    """Run recovery pipeline for one model.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        Simulation DataFrame.
    fit_df : pandas.DataFrame
        Fit results DataFrame for ``model``.
    model : str
        Model name (used for output filenames).

    Returns
    -------
    tuple of (recovery_df, metrics_df, corr_df) or None on failure.
    """
    print(f"\n  --- Recovery: {model} ---")

    try:
        recovery_df = build_recovery_df(sim_df, fit_df, exclude_flagged=True, min_n=30)
    except ValueError as exc:
        msg = str(exc)
        if "at least 30" in msg or "participants" in msg:
            n_approx = (
                fit_df[fit_df["flagged"] == False]["participant_id"].nunique()  # noqa: E712
            )
            print(
                f"  ERROR: Need at least 30 non-flagged participants. Got {n_approx}. "
                "Re-run simulation with larger batch size."
            )
        else:
            print(f"  ERROR building recovery_df: {exc}")
        return None

    metrics_df = compute_recovery_metrics(recovery_df)
    corr_df = compute_correlation_matrix(recovery_df)

    # Console output
    print(f"  Recovery metrics ({model}):")
    print(metrics_df.to_string(index=False))

    # Warn on high inter-parameter correlations
    arr = corr_df.to_numpy()
    n = arr.shape[0]
    for i in range(n):
        for j in range(i + 1, n):
            if abs(arr[i, j]) > 0.8:
                print(
                    f"  WARNING: High inter-parameter correlation: "
                    f"{corr_df.columns[i]} & {corr_df.columns[j]} "
                    f"(r={arr[i, j]:.2f})"
                )

    # Omega_3 / kappa caveat
    if model == "hgf_3level":
        print(
            "  NOTE: omega_3 recovery is known to be poor in the literature. "
            "Primary hypotheses focus on omega_2 and kappa. Verify recovery "
            "before interpreting group effects on omega_3."
        )

    return recovery_df, metrics_df, corr_df


# ---------------------------------------------------------------------------
# Plot and save helpers
# ---------------------------------------------------------------------------


def _save_recovery_outputs(
    recovery_df: pd.DataFrame,
    metrics_df: pd.DataFrame,
    corr_df: pd.DataFrame,
    model: str,
    out_dir: Path,
) -> None:
    """Save recovery CSVs and PNG plots for one model."""
    import matplotlib.pyplot as plt

    out_dir.mkdir(parents=True, exist_ok=True)

    # Metrics CSV
    metrics_path = out_dir / f"recovery_metrics_{model}.csv"
    metrics_df.to_csv(metrics_path, index=False)
    print(f"  Saved: {metrics_path}")

    # Scatter plot
    scatter_path = out_dir / f"recovery_scatter_{model}.png"
    fig = plot_recovery_scatter(recovery_df, metrics_df, save_path=scatter_path)
    plt.close(fig)
    print(f"  Saved: {scatter_path}")

    # Correlation matrix plot
    corr_path = out_dir / f"correlation_matrix_{model}.png"
    fig = plot_correlation_matrix(corr_df, save_path=corr_path)
    plt.close(fig)
    print(f"  Saved: {corr_path}")


# ---------------------------------------------------------------------------
# BMS helpers
# ---------------------------------------------------------------------------


def _run_bms(
    waic_df: pd.DataFrame,
    out_dir: Path,
) -> None:
    """Run stratified BMS, print results, and save outputs."""
    import matplotlib.pyplot as plt

    print("\n--- Bayesian Model Comparison (BMS) ---")

    bms_results = run_stratified_bms(waic_df, model_names=_MODEL_NAMES)

    # Print results table
    summary_rows: list[dict] = []
    for group_label, res in bms_results.items():
        model_names = res["model_names"]
        for m_idx, m_name in enumerate(model_names):
            summary_rows.append(
                {
                    "group": group_label,
                    "model": m_name,
                    "exp_r": float(res["exp_r"][m_idx]),
                    "xp": float(res["xp"][m_idx]),
                    "pxp": float(res["pxp"][m_idx]),
                    "bor": float(res["bor"]),
                    "n_subjects": res["n_subjects"],
                }
            )
    summary_df = pd.DataFrame(summary_rows)
    print(summary_df.to_string(index=False))

    # Determine winning model per group
    for group_label, grp_data in summary_df.groupby("group"):
        winner_row = grp_data.loc[grp_data["xp"].idxmax()]
        print(
            f"  Winning model ({group_label}): {winner_row['model']} "
            f"(xp={winner_row['xp']:.3f})"
        )

    # Save BMS summary CSV
    out_dir.mkdir(parents=True, exist_ok=True)
    bms_csv_path = out_dir / "bms_summary.csv"

    # Flatten to per-model rows with columns matching spec
    flat_rows: list[dict] = []
    for group_label, res in bms_results.items():
        model_names = res["model_names"]
        for m_idx, m_name in enumerate(model_names):
            flat_rows.append(
                {
                    "group": group_label,
                    "model": m_name,
                    "exp_r": float(res["exp_r"][m_idx]),
                    "xp": float(res["xp"][m_idx]),
                    "pxp": float(res["pxp"][m_idx]),
                    "bor": float(res["bor"]),
                }
            )
    bms_out_df = pd.DataFrame(
        flat_rows,
        columns=["group", "model", "exp_r", "xp", "pxp", "bor"],
    )
    bms_out_df.to_csv(bms_csv_path, index=False)
    print(f"  Saved: {bms_csv_path}")

    # EP plot
    ep_path = out_dir / "bms_exceedance.png"
    fig = plot_exceedance_probabilities(bms_results, save_path=ep_path)
    plt.close(fig)
    print(f"  Saved: {ep_path}")


# ---------------------------------------------------------------------------
# Main pipeline
# ---------------------------------------------------------------------------


def main() -> None:
    """Run full Phase 5 validation pipeline."""
    args = _parse_args()

    VALIDATION_DIR.mkdir(parents=True, exist_ok=True)

    print("=" * 60)
    print("Phase 5 — Parameter Recovery Validation & BMS")
    print("=" * 60)

    # --- 1. Load simulated data ---
    sim_path = _resolve_sim_path(args.sim_path)
    print(f"\nLoading simulated data from: {sim_path}")
    sim_df = pd.read_csv(sim_path)
    print(f"  {len(sim_df):,} trial rows loaded")

    # --- 2. Load fit results for each model ---
    fit_dfs: dict[str, pd.DataFrame] = {}
    for model in _MODEL_NAMES:
        attr = f"fit_path_{model.replace('-', '_')}"
        args_path = getattr(args, attr, None)
        fit_path = _resolve_fit_path(model, args_path)
        df = _load_fit_df(model, fit_path)
        if df is not None:
            fit_dfs[model] = df

    if not fit_dfs:
        print(
            "\nERROR: No fit results found for any model.\n"
            "Run scripts/04_fit_participants.py --model hgf_2level and\n"
            "       scripts/04_fit_participants.py --model hgf_3level first."
        )
        sys.exit(1)

    # --- 3 & 4. Recovery analysis and plots ---
    print("\n=== Recovery Analysis ===")
    recovery_results: dict[str, tuple] = {}

    for model, fit_df in fit_dfs.items():
        result = _run_recovery(sim_df, fit_df, model)
        if result is not None:
            recovery_results[model] = result
            recovery_df, metrics_df, corr_df = result
            _save_recovery_outputs(
                recovery_df, metrics_df, corr_df, model, VALIDATION_DIR
            )

    # --- 5. WAIC computation ---
    waic_df: pd.DataFrame | None = None

    if args.skip_waic:
        print("\n  Skipping WAIC computation (--skip-waic).")
    else:
        print("\n=== WAIC Computation ===")

        # Try to load config for fitting settings (needed for re-fit fallback)
        try:
            from prl_hgf.env.task_config import load_config

            fit_cfg = load_config().fitting
        except Exception:  # noqa: BLE001
            fit_cfg = None

        # Resolve idata directory
        idata_dir = args.idata_dir if args.idata_dir is not None else RESULTS_DIR / "idata"

        # Build idata_dict: {model_name: {(pid, grp, sess): idata}}
        idata_dict: dict[str, dict[tuple, object]] = {}
        for model in _MODEL_NAMES:
            if model not in fit_dfs:
                continue

            model_nc_dir = idata_dir / model
            has_nc = model_nc_dir.exists() and any(model_nc_dir.glob("*.nc"))

            if has_nc:
                print(f"  Loading .nc files for {model}...")
                idata_dict[model] = _load_idata_from_nc(sim_df, model, idata_dir)
            elif fit_cfg is not None:
                idata_dict[model] = _refetch_idata_via_batch(sim_df, model, fit_cfg)
            else:
                print(
                    f"  WARNING: No .nc files found for {model} and cannot "
                    "load fitting config. Skipping WAIC for this model."
                )

        if len(idata_dict) >= 2:
            print("  Computing batch WAIC (this may take 30-60 minutes)...")
            try:
                waic_df = compute_batch_waic(
                    sim_df=sim_df,
                    idata_dict=idata_dict,
                    model_names=_MODEL_NAMES,
                )
                waic_path = VALIDATION_DIR / "waic_results.csv"
                waic_df.to_csv(waic_path, index=False)
                print(f"  Saved: {waic_path}")
                print(f"  WAIC rows: {len(waic_df)}")
            except Exception as exc:  # noqa: BLE001
                print(f"  ERROR during WAIC computation: {exc}")
                waic_df = None
        else:
            print(
                "  Insufficient idata for WAIC. Need idata for both models. "
                "Skipping BMS."
            )

    # --- 6. BMS ---
    if waic_df is not None and len(waic_df) > 0:
        print("\n=== Bayesian Model Comparison ===")
        _run_bms(waic_df, VALIDATION_DIR)
    elif not args.skip_waic:
        print("\n  BMS skipped (no WAIC results available).")

    # --- 7. Summary ---
    print("\n" + "=" * 60)
    print("Phase 5 Validation — Summary")
    print("=" * 60)

    for model, (_, metrics_df, corr_df) in recovery_results.items():
        print(f"\nModel: {model}")
        passing = metrics_df[metrics_df["passes_threshold"] == True]  # noqa: E712
        failing = metrics_df[metrics_df["passes_threshold"] == False]  # noqa: E712
        if len(passing) > 0:
            print(
                f"  PASS (|r| >= 0.7): {', '.join(passing['parameter'].tolist())}"
            )
        if len(failing) > 0:
            print(
                f"  FAIL (|r| < 0.7):  {', '.join(failing['parameter'].tolist())}"
            )

        # High correlation warnings
        arr = corr_df.to_numpy()
        n = arr.shape[0]
        for i in range(n):
            for j in range(i + 1, n):
                if abs(arr[i, j]) > 0.8:
                    print(
                        f"  CONCERN: {corr_df.columns[i]} vs "
                        f"{corr_df.columns[j]} highly correlated "
                        f"(r={arr[i, j]:.2f})"
                    )

        if model == "hgf_3level":
            print(
                "  NOTE: omega_3 recovery known to be poor — "
                "interpret with caution."
            )

    if waic_df is not None:
        print(f"\nWAIC results: {len(waic_df)} rows saved to {VALIDATION_DIR}")

    print(f"\nAll outputs saved to: {VALIDATION_DIR}")
    print("=" * 60)


if __name__ == "__main__":
    main()
