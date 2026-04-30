"""Phase 5: Parameter recovery validation and Bayesian model comparison.

Loads simulation data and fitting results, computes recovery metrics and
scatter plots, runs random-effects BMS (Rigoux et al. 2014), and saves
all outputs to models/validation/.

Usage
-----
Run from the project root::

    conda run -n ds_env python scripts/05_run_validation.py
    conda run -n ds_env python scripts/05_run_validation.py --skip-waic

    # PAT-RL PRL-V1 gate (Phase 20)
    conda run -n ds_env python scripts/05_run_validation.py \\
        --task=patrl \\
        --sim-path results/patrl/sim_df.csv \\
        --idata-dir results/patrl/idata \\
        --fit-method laplace

Options
-------
--task {prl,patrl}
    Task to validate.  ``'prl'`` = pick_best_cue (default, Phase 1-9);
    ``'patrl'`` = PAT-RL PRL-V1 gate (Phase 20).
--fit-method {laplace,nuts}
    Fitting back-end for PAT-RL (ignored for ``--task=prl``).
    Default ``laplace`` (fast-path; NUTS deferred to post-Phase-14-15
    per user directive 2026-04-19).
--r-threshold FLOAT
    Pearson r threshold for PRL-V1 primary parameters.  Default 0.7.
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
    Directory containing per-participant InferenceData .nc files.
    * prl: ``{idata_dir}/{model}/{participant_id}_{group}_{session}.nc``
    * patrl: ``{idata_dir}/{model}/{participant_id}.nc``
    Default: ``results/idata``.

Output (prl, unchanged)
-----------------------
``results/validation/`` directory with:

* ``recovery_metrics_{model}.csv``   — per-parameter r, p, bias, RMSE
* ``recovery_scatter_{model}.png``   — scatter plots (true vs recovered)
* ``correlation_matrix_{model}.png`` — inter-parameter correlation heatmap
* ``waic_results.csv``               — per-participant ELPD-WAIC by model
* ``bms_summary.csv``                — BMS summary (exp_r, xp, pxp, bor)
* ``bms_exceedance.png``             — exceedance probability bar plot

Output (patrl)
--------------
``results/patrl/validation/`` directory with:

* ``patrl_recovery_metrics.csv`` — per-parameter r, bias, passes_threshold,
  exploratory flag.  Exploratory: ω₃, μ₃⁰.
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

import logging  # noqa: E402

import pandas as pd  # noqa: E402

from config import DATA_PROCESSED_DIR, MODELS_BAYESIAN_DIR, MODELS_DIR  # noqa: E402
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
    compute_recovery_metrics_patrl,
)

VALIDATION_OUT = MODELS_DIR / "validation"

_MODEL_NAMES = ["hgf_2level", "hgf_3level"]
_MODEL_NAMES_PATRL = ["hgf_2level_patrl", "hgf_3level_patrl"]

log = logging.getLogger(__name__)

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
)


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
    # --- Task toggle (Phase 20 PRL-V1 gate) ---
    parser.add_argument(
        "--task",
        choices=["prl", "patrl"],
        default="prl",
        help=(
            "Task to validate.  'prl' = pick_best_cue (Phase 1-9, default); "
            "'patrl' = PAT-RL PRL-V1 gate (Phase 20)."
        ),
    )
    parser.add_argument(
        "--fit-method",
        choices=["laplace", "nuts"],
        default="laplace",
        dest="fit_method",
        help=(
            "Fitting back-end for --task=patrl.  Default 'laplace' (fast-path; "
            "NUTS deferred to post-Phase-14-15 per user directive 2026-04-19).  "
            "Ignored for --task=prl."
        ),
    )
    parser.add_argument(
        "--r-threshold",
        type=float,
        default=0.7,
        dest="r_threshold",
        help="Pearson r threshold for PRL-V1 primary parameters.  Default 0.7.",
    )
    # --- Common options ---
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
        help=("Path to simulated data CSV. Default: results/simulated_data.csv"),
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
        DATA_PROCESSED_DIR / "simulated_data.csv",
        DATA_PROCESSED_DIR / "batch_simulation.csv",
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
        MODELS_BAYESIAN_DIR / f"fit_results_{model}.csv",
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

    print(f"  idata ({model}): loaded {n_loaded}, missing {n_missing}")
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
# PAT-RL helpers (Phase 20 PRL-V1 gate)
# ---------------------------------------------------------------------------

_PATRL_PRIMARY_PARAMS: tuple[str, ...] = ("omega_2", "kappa", "beta")
_PATRL_EXPLORATORY_PARAMS: tuple[str, ...] = ("omega_3", "mu3_0")


def _resolve_patrl_sim_path(args_path: Path | None) -> Path:
    """Return path to PAT-RL simulated data CSV, or exit with instructions."""
    if args_path is not None:
        return args_path
    candidates = [
        DATA_PROCESSED_DIR / "patrl" / "sim_df.csv",
        DATA_PROCESSED_DIR / "patrl_smoke" / "sim_df.csv",
        _PROJECT_ROOT / "models" / "patrl_smoke" / "sim_df.csv",
    ]
    for p in candidates:
        if p.exists():
            return p
    print(
        "ERROR: PAT-RL simulated data not found.  Expected at:\n"
        f"  {candidates[0]}\n"
        "Run scripts/03_simulate_participants.py --task=patrl first, or\n"
        "submit cluster/patrl_smoke.slurm for a 160-agent cohort."
    )
    sys.exit(2)


def _resolve_patrl_idata_dir(args_path: Path | None) -> Path:
    """Return idata directory for PAT-RL fits."""
    if args_path is not None:
        return args_path
    candidates = [
        MODELS_BAYESIAN_DIR / "patrl" / "idata",
        MODELS_BAYESIAN_DIR / "patrl_smoke" / "idata",
        _PROJECT_ROOT / "models" / "patrl_smoke" / "idata",
    ]
    for p in candidates:
        if p.exists():
            return p
    # Return default even if it doesn't exist yet; caller will handle missing files
    return MODELS_BAYESIAN_DIR / "patrl" / "idata"


def _load_patrl_idata(
    idata_dir: Path,
    model: str,
    participant_ids: list[str],
    fit_method: str,
) -> dict[str, object]:
    """Load per-participant InferenceData .nc files for a PAT-RL model.

    Parameters
    ----------
    idata_dir : Path
        Root directory.  Files expected at ``{idata_dir}/{model}/{pid}.nc``.
    model : str
        PAT-RL model name (e.g. ``'hgf_2level_patrl'``).
    participant_ids : list[str]
        Participant IDs to load.
    fit_method : str
        ``'laplace'`` or ``'nuts'`` — used for logging only.

    Returns
    -------
    dict mapping participant_id → InferenceData (or None if file missing).
    """
    import arviz as az

    model_dir = idata_dir / model
    idata_map: dict[str, object] = {}
    n_loaded = n_missing = 0

    for pid in participant_ids:
        nc_path = model_dir / f"{pid}.nc"
        if nc_path.exists():
            idata_map[pid] = az.from_netcdf(str(nc_path))
            n_loaded += 1
        else:
            idata_map[pid] = None
            n_missing += 1

    log.info(
        "PAT-RL idata (%s, %s): loaded %d, missing %d",
        model,
        fit_method,
        n_loaded,
        n_missing,
    )
    return idata_map


def _extract_patrl_posterior_means(
    idata: object,
    model: str,
    participant_id: str,
) -> dict[str, float]:
    """Extract posterior means for PAT-RL parameters from InferenceData.

    Handles both ``participant_id`` (Laplace) and ``participant`` (NUTS)
    coordinate names (Decision 128/132).

    Parameters
    ----------
    idata : az.InferenceData
        Posterior InferenceData for a single participant.
    model : str
        PAT-RL model name.
    participant_id : str
        Participant identifier (used for error messages).

    Returns
    -------
    dict mapping parameter name → posterior mean (float).
    """
    import numpy as np

    is_3level = "3level" in model
    # Parameters present in both 2-level and 3-level
    params = ["omega_2", "beta"]
    if is_3level:
        params += ["kappa", "omega_3", "mu3_0"]

    posterior = idata.posterior  # type: ignore[union-attr]
    means: dict[str, float] = {}

    for p in params:
        if p not in posterior:
            continue
        arr = posterior[p].values  # (chains, draws, [participant_dim])
        if arr.ndim == 3:
            # shape (chains, draws, participants) — single-participant idata
            # should have dim size 1
            arr = arr[:, :, 0]
        means[p] = float(np.mean(arr))

    # Also extract kappa if it's a 2-level model with a b-parameter (Model A+b)
    if "kappa" in posterior and "kappa" not in means:
        arr = posterior["kappa"].values
        if arr.ndim == 3:
            arr = arr[:, :, 0]
        means["kappa"] = float(np.mean(arr))

    return means


def _build_patrl_recovery_fit_df(
    sim_df: pd.DataFrame,
    idata_dict: dict[str, dict[str, object]],
    model: str,
) -> pd.DataFrame:
    """Build long-format fit_df suitable for compute_recovery_metrics_patrl.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        Simulation DataFrame with ``participant_id``, ``true_omega_2``,
        ``true_kappa``, ``true_beta``, ``true_omega_3``, ``true_mu3_0``
        columns (one row per trial; true params are trial-constant).
    idata_dict : dict[str, dict[str, az.InferenceData]]
        ``idata_dict[model][participant_id]`` → InferenceData.
    model : str
        PAT-RL model name to use from ``idata_dict``.

    Returns
    -------
    pandas.DataFrame
        Long-format DataFrame with columns:
        ``participant_id``, ``param``, ``true_value``, ``posterior_mean``.
    """
    # Collapse sim_df to one row per participant with true params
    true_cols = [
        c
        for c in [
            "true_omega_2",
            "true_kappa",
            "true_beta",
            "true_omega_3",
            "true_mu3_0",
        ]
        if c in sim_df.columns
    ]
    true_wide = sim_df.groupby("participant_id")[true_cols].first().reset_index()

    rows: list[dict] = []
    model_map = idata_dict.get(model, {})

    for _, row in true_wide.iterrows():
        pid = str(row["participant_id"])
        idata = model_map.get(pid)
        if idata is None:
            log.warning(
                "_build_patrl_recovery_fit_df: no idata for participant=%s model=%s — skipping",
                pid,
                model,
            )
            continue

        post_means = _extract_patrl_posterior_means(idata, model, pid)

        # Map true_* column → canonical param name
        param_to_true = {
            "omega_2": "true_omega_2",
            "kappa": "true_kappa",
            "beta": "true_beta",
            "omega_3": "true_omega_3",
            "mu3_0": "true_mu3_0",
        }
        for param, true_col in param_to_true.items():
            if param not in post_means:
                continue
            if true_col not in true_wide.columns:
                continue
            rows.append(
                {
                    "participant_id": pid,
                    "param": param,
                    "true_value": float(row[true_col]),
                    "posterior_mean": post_means[param],
                }
            )

    return pd.DataFrame(
        rows,
        columns=["participant_id", "param", "true_value", "posterior_mean"],
    )


def _run_recovery_patrl(
    sim_df: pd.DataFrame,
    idata_dict: dict[str, dict[str, object]],
    out_dir: Path,
    r_threshold: float,
) -> dict[str, pd.DataFrame]:
    """Run PAT-RL PRL-V1 recovery loop over both model variants.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        PAT-RL simulation DataFrame.
    idata_dict : dict[str, dict[str, InferenceData]]
        Nested mapping ``idata_dict[model][participant_id]``.
    out_dir : Path
        Output directory for ``patrl_recovery_metrics.csv``.
    r_threshold : float
        Pearson r gate threshold.

    Returns
    -------
    dict mapping model name → recovery metrics DataFrame.
    """
    out_dir.mkdir(parents=True, exist_ok=True)
    metrics_by_model: dict[str, pd.DataFrame] = {}

    for model in _MODEL_NAMES_PATRL:
        if model not in idata_dict or not idata_dict[model]:
            log.warning("_run_recovery_patrl: no idata for model=%s — skipping", model)
            continue

        log.info("--- PAT-RL Recovery: %s ---", model)
        fit_df_long = _build_patrl_recovery_fit_df(sim_df, idata_dict, model)

        if len(fit_df_long) == 0:
            log.warning(
                "_run_recovery_patrl: empty fit_df for model=%s — skipping", model
            )
            continue

        metrics_df = compute_recovery_metrics_patrl(
            fit_df_long,
            r_threshold=r_threshold,
            primary_params=_PATRL_PRIMARY_PARAMS,
            exploratory_params=_PATRL_EXPLORATORY_PARAMS,
        )
        metrics_by_model[model] = metrics_df

        # Save per-model CSV
        metrics_path = out_dir / f"patrl_recovery_metrics_{model}.csv"
        metrics_df.to_csv(metrics_path, index=False)
        log.info("  Saved: %s", metrics_path)
        print(metrics_df.to_string(index=False))

    return metrics_by_model


def _print_prl_v1_gate_report(
    metrics_by_model: dict[str, pd.DataFrame],
    r_threshold: float,
) -> int:
    """Print PRL-V1 gate report and return exit code.

    Parameters
    ----------
    metrics_by_model : dict
        Mapping model name → recovery metrics DataFrame.
    r_threshold : float
        Gate threshold.

    Returns
    -------
    int
        0 if all primary parameters pass for all models; 1 otherwise.
    """
    print("=" * 60)
    print("PRL-V1 GATE REPORT")
    print(f"Threshold: r >= {r_threshold:.2f}")
    print("=" * 60)

    overall_pass = True

    for model, metrics_df in metrics_by_model.items():
        print(f"\nModel: {model}")
        primary = metrics_df[~metrics_df["exploratory"]]
        exploratory = metrics_df[metrics_df["exploratory"]]

        model_pass = bool(primary["passes_threshold"].all())
        overall_pass = overall_pass and model_pass

        for _, row in primary.iterrows():
            status = "PASS" if row["passes_threshold"] else "FAIL"
            print(
                f"  {row['param']}: r={row['pearson_r']:.3f} "
                f"(threshold {r_threshold:.2f}) [{status}]"
            )

        for _, row in exploratory.iterrows():
            print(
                f"  {row['param']}: r={row['pearson_r']:.3f} [exploratory — not gated]"
            )

        print(f"  --> Model {model}: {'PASS' if model_pass else 'FAIL'}")

    print()
    print(f"PRL-V1 OVERALL: {'PASS' if overall_pass else 'FAIL'}")
    print("=" * 60)
    return 0 if overall_pass else 1


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


def _main_patrl(args: argparse.Namespace) -> None:
    """PAT-RL PRL-V1 gate pipeline (Phase 20).

    Loads PAT-RL sim_df and idata, builds long-format recovery DataFrame,
    calls :func:`~prl_hgf.analysis.recovery.compute_recovery_metrics_patrl`,
    prints PRL-V1 gate report, and saves ``patrl_recovery_metrics.csv``.

    Exit codes per Decision 148:
    * 0 — all primary gate parameters pass (r >= r_threshold).
    * 1 — at least one primary parameter fails the gate.
    * 2 — loader error (missing sim_df, idata dir, or import failure).
    """
    print("=" * 60)
    print("Phase 5 — PAT-RL PRL-V1 Parameter Recovery Gate")
    print(f"fit-method: {args.fit_method}")
    print(f"r-threshold: {args.r_threshold}")
    print("=" * 60)

    out_dir = MODELS_DIR / "validation" / "patrl"
    out_dir.mkdir(parents=True, exist_ok=True)

    # 1. Load sim_df
    sim_path = _resolve_patrl_sim_path(args.sim_path)
    print(f"\nLoading PAT-RL sim_df from: {sim_path}")
    sim_df = pd.read_csv(sim_path)
    n_agents = sim_df["participant_id"].nunique()
    print(f"  {len(sim_df):,} trial rows loaded ({n_agents} participants)")

    participant_ids = sim_df["participant_id"].unique().tolist()

    # 2. Resolve idata directory
    idata_dir = _resolve_patrl_idata_dir(args.idata_dir)
    print(f"\nLoading PAT-RL idata from: {idata_dir}")

    # 3. Load InferenceData for both model variants
    idata_dict: dict[str, dict[str, object]] = {}
    for model in _MODEL_NAMES_PATRL:
        model_dir = idata_dir / model
        if model_dir.exists() and any(model_dir.glob("*.nc")):
            idata_dict[model] = _load_patrl_idata(
                idata_dir, model, participant_ids, args.fit_method
            )
        else:
            log.warning(
                "_main_patrl: idata dir missing or empty for model=%s at %s",
                model,
                model_dir,
            )

    if not idata_dict:
        print(
            "\nERROR: No PAT-RL idata found.  Run fitting first:\n"
            f"  scripts/12_smoke_patrl_foundation.py --fit-method {args.fit_method}\n"
            "  or: sbatch cluster/patrl_smoke.slurm"
        )
        sys.exit(2)

    # 4. Run recovery loop
    print("\n=== PAT-RL Recovery Analysis ===")
    metrics_by_model = _run_recovery_patrl(
        sim_df, idata_dict, out_dir, args.r_threshold
    )

    if not metrics_by_model:
        print("\nERROR: Recovery failed for all models.")
        sys.exit(2)

    # Save combined CSV
    combined_rows: list[pd.DataFrame] = []
    for model_name, mdf in metrics_by_model.items():
        tagged = mdf.copy()
        tagged.insert(0, "model", model_name)
        combined_rows.append(tagged)
    if combined_rows:
        combined_metrics = pd.concat(combined_rows, ignore_index=True)
        combined_path = out_dir / "patrl_recovery_metrics.csv"
        combined_metrics.to_csv(combined_path, index=False)
        print(f"\nSaved combined: {combined_path}")

    # 5. PRL-V1 gate report + exit code
    exit_code = _print_prl_v1_gate_report(metrics_by_model, args.r_threshold)
    sys.exit(exit_code)


def main() -> None:
    """Run full Phase 5 validation pipeline."""
    args = _parse_args()

    VALIDATION_OUT.mkdir(parents=True, exist_ok=True)

    # -----------------------------------------------------------------------
    # PAT-RL branch (Phase 20 PRL-V1 gate)
    # -----------------------------------------------------------------------
    if args.task == "patrl":
        _main_patrl(args)
        return

    # -----------------------------------------------------------------------
    # PRL (pick_best_cue) branch — original Phase 5 code (unchanged)
    # -----------------------------------------------------------------------
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
                recovery_df, metrics_df, corr_df, model, VALIDATION_OUT
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
        idata_dir = (
            args.idata_dir
            if args.idata_dir is not None
            else MODELS_BAYESIAN_DIR / "idata"
        )

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
                waic_path = VALIDATION_OUT / "waic_results.csv"
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
        _run_bms(waic_df, VALIDATION_OUT)
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
            print(f"  PASS (|r| >= 0.7): {', '.join(passing['parameter'].tolist())}")
        if len(failing) > 0:
            print(f"  FAIL (|r| < 0.7):  {', '.join(failing['parameter'].tolist())}")

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
            print("  NOTE: omega_3 recovery known to be poor — interpret with caution.")

    if waic_df is not None:
        print(f"\nWAIC results: {len(waic_df)} rows saved to {VALIDATION_OUT}")

    print(f"\nAll outputs saved to: {VALIDATION_OUT}")
    print("=" * 60)


if __name__ == "__main__":
    main()
