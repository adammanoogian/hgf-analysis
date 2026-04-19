"""Phase 6: Group-level HGF parameter analysis.

Loads simulated data and batch-fitting results, builds wide-form per-subject
parameter estimates, fits Bayesian mixed-effects models (group × session
interaction via bambi), extracts posterior contrasts and frequentist effect
sizes, and saves all outputs to ``results/group_analysis/``.

Usage
-----
Run from the project root::

    conda run -n ds_env python scripts/06_group_analysis.py
    conda run -n ds_env python scripts/06_group_analysis.py --model 3level
    conda run -n ds_env python scripts/06_group_analysis.py --skip-plots

    # PAT-RL PRL-V2 phenotype separability gate (Phase 20)
    conda run -n ds_env python scripts/06_group_analysis.py \\
        --task=patrl --analysis=phenotype_separability \\
        --sim-path results/patrl/sim_df.csv \\
        --idata-dir results/patrl/idata \\
        --fit-method laplace

Options
-------
--task {prl,patrl}
    Task to analyse.  Default ``prl`` (pick_best_cue, Phase 1-6 behaviour).
    ``patrl`` activates the PAT-RL PRL-V2 gate.
--analysis {group_interaction,phenotype_separability}
    Analysis to run.  Default ``group_interaction`` (existing Phase 6 pipeline).
    ``phenotype_separability`` computes Cohen's d + correlation gates for PAT-RL.
--fit-method {laplace,nuts}
    Fitting back-end for --task=patrl (ignored for --task=prl).
    Default ``laplace`` (per user directive 2026-04-19).
--model {2level,3level}
    HGF model variant to analyse. Default: ``2level``.
--skip-plots
    Skip saving figure outputs (CSV outputs are always saved).
--draws N
    Number of posterior draws per chain for bambi. Default: ``2000``.

Output (prl, unchanged)
-----------------------
``results/group_analysis/`` directory with:

* ``estimates_wide_{model}.csv``   — wide-form per-subject parameter means
* ``effect_sizes_{model}.csv``     — Cohen's d and partial η² per param × session
* ``contrasts_{model}_{param}.csv`` — posterior contrasts per session (one file
  per parameter)
* ``phase_stratified.csv``         — win-stay/lose-shift rates per participant ×
  session × phase (stable/volatile)
* ``raincloud_{param}.png``        — raincloud plots (unless ``--skip-plots``)
* ``interaction_{param}.png``      — interaction plots (unless ``--skip-plots``)

Output (patrl phenotype_separability)
--------------------------------------
``results/patrl/group_analysis/`` directory with:

* ``phenotype_separability_summary.csv`` — Cohen's d + correlation gate results
  with ``contrast_type`` column (``"factorial"`` / ``"pairwise"``).  Only
  factorial rows count toward the PRL-V2 gate pass/fail.
* ``phenotype_stratified_bms.csv`` — per-phenotype BMS results (from
  :func:`~prl_hgf.analysis.bms.compute_stratified_bms`).
* ``peb_covariates.csv`` — PEB Δ-evidence export (from
  :func:`~prl_hgf.analysis.bms.export_peb_covariates`).
* ``phenotype_separability.png`` / ``.pdf`` — raincloud publication figure.

Phase-stratification note
-------------------------
ω₂ (tonic volatility) is a session-level parameter.  Phase-stratified analysis
uses behavioral proxies (win-stay and lose-shift rates) as trial-level measures
of learning rate adaptation.  This is the standard approach when HGF parameters
are estimated at the session level.  Phase stratification is exploratory; primary
hypotheses focus on ω₂ and κ at the session level.
"""

from __future__ import annotations

import argparse
import logging
import sys
from pathlib import Path
from typing import TYPE_CHECKING

# ---------------------------------------------------------------------------
# Ensure project root is on sys.path so that config.py is importable when
# running as a script.
# ---------------------------------------------------------------------------
_PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(_PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(_PROJECT_ROOT))

import arviz as az  # noqa: E402
import matplotlib.pyplot as plt  # noqa: E402
import numpy as np  # noqa: E402
import pandas as pd  # noqa: E402

from config import GROUP_ANALYSIS_DIR, RESULTS_DIR  # noqa: E402
from prl_hgf.analysis.effect_sizes import (  # noqa: E402
    cohens_d,
    compute_effect_sizes_table,
)

if TYPE_CHECKING:
    pass
from prl_hgf.analysis.group import (  # noqa: E402
    build_estimates_wide,
    summarize_group_models,
)
from prl_hgf.analysis.group_plots import (  # noqa: E402
    plot_interaction,
    plot_raincloud,
)
from prl_hgf.analysis.phase_stratification import (  # noqa: E402
    build_phase_stratified_df,
)

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
)
logger = logging.getLogger(__name__)

# Parameters of interest for each model variant
_PARAMS_2LEVEL = ["omega_2", "beta", "zeta"]
_PARAMS_3LEVEL = ["omega_2", "omega_3", "kappa", "beta", "zeta"]

_SESSION_LABELS = ["baseline", "session2", "session3"]


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------


def _parse_args() -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description="Phase 6: Group-level HGF parameter analysis."
    )
    # --- Task / analysis toggles (Phase 20 PRL-V2 gate) ---
    parser.add_argument(
        "--task",
        choices=["prl", "patrl"],
        default="prl",
        help=(
            "Task to analyse.  'prl' = pick_best_cue (default); "
            "'patrl' = PAT-RL (Phase 20 PRL-V2 gate)."
        ),
    )
    parser.add_argument(
        "--analysis",
        choices=["group_interaction", "phenotype_separability"],
        default="group_interaction",
        help=(
            "Analysis to run.  'group_interaction' = existing Phase 6 pipeline (default); "
            "'phenotype_separability' = PAT-RL PRL-V2 phenotype Cohen's d + correlation."
        ),
    )
    parser.add_argument(
        "--fit-method",
        choices=["laplace", "nuts"],
        default="laplace",
        dest="fit_method",
        help=(
            "Fitting back-end for --task=patrl.  Default 'laplace' (per user "
            "directive 2026-04-19).  Ignored for --task=prl."
        ),
    )
    # --- PAT-RL data paths ---
    parser.add_argument(
        "--sim-path",
        default=None,
        type=Path,
        dest="sim_path",
        help="Path to PAT-RL sim_df CSV (--task=patrl only).",
    )
    parser.add_argument(
        "--idata-dir",
        default=None,
        type=Path,
        dest="idata_dir",
        help=(
            "Directory containing per-participant InferenceData .nc files "
            "(--task=patrl only).  See scripts/05 --idata-dir for path conventions."
        ),
    )
    # --- Original Phase 6 options (preserved unchanged) ---
    parser.add_argument(
        "--model",
        choices=["2level", "3level"],
        default="2level",
        help="HGF model variant to analyse. Default: 2level.",
    )
    parser.add_argument(
        "--skip-plots",
        action="store_true",
        default=False,
        help="Skip saving figure outputs (CSV outputs are always saved).",
    )
    parser.add_argument(
        "--draws",
        type=int,
        default=2000,
        help="Posterior draws per chain for bambi. Default: 2000.",
    )
    return parser.parse_args()


# ---------------------------------------------------------------------------
# Data loading helpers
# ---------------------------------------------------------------------------


def _resolve_fit_path(model: str) -> Path | None:
    """Return path to fit-results CSV for *model*, or None if not found."""
    candidates = [
        RESULTS_DIR / f"fit_results_hgf_{model}.csv",
        RESULTS_DIR / f"fit_results_{model}.csv",
        _PROJECT_ROOT / "data" / "fitted" / f"hgf_{model}_results.csv",
    ]
    for p in candidates:
        if p.exists():
            return p
    return None


def _resolve_sim_path() -> Path | None:
    """Return path to simulated-data CSV, or None if not found."""
    candidates = [
        RESULTS_DIR / "simulated_data.csv",
        RESULTS_DIR / "batch_simulation.csv",
        _PROJECT_ROOT / "data" / "simulated" / "batch_simulation.csv",
        _PROJECT_ROOT / "data" / "simulated" / "simulated_participants.csv",
    ]
    for p in candidates:
        if p.exists():
            return p
    return None


# ---------------------------------------------------------------------------
# Main pipeline
# ---------------------------------------------------------------------------


# ---------------------------------------------------------------------------
# Option A (2x2 factorial) axis mask constants — PRL-V2 gate
# Decision: User chose Option A (2026-04-19); all 4 phenotypes contribute to
# both Cohen's d measurements (anxiety axis + reward axis).
# ---------------------------------------------------------------------------

ANXIETY_HIGH: frozenset[str] = frozenset({"high_anxiety", "anxious_reward"})
ANXIETY_LOW: frozenset[str] = frozenset({"healthy", "reward_susceptible"})
REWARD_HIGH: frozenset[str] = frozenset({"reward_susceptible", "anxious_reward"})
REWARD_LOW: frozenset[str] = frozenset({"healthy", "high_anxiety"})

# Supplementary B-style pairwise contrasts (reported but NOT gated)
_PAIRWISE_CONTRASTS: list[tuple[str, str, str, str]] = [
    # (param, label, high_phenotype, low_phenotype)
    ("omega_2", "high_anxiety_vs_healthy", "high_anxiety", "healthy"),
    ("beta", "reward_susceptible_vs_healthy", "reward_susceptible", "healthy"),
]

# PRL-V2 gate thresholds
_PRL_V2_D_THRESHOLD = 0.5
_PRL_V2_COR_THRESHOLD = 0.5


# ---------------------------------------------------------------------------
# PAT-RL data loading helpers
# ---------------------------------------------------------------------------


def _resolve_patrl_sim_path_06(sim_path: Path | None) -> Path:
    """Return PAT-RL sim_df path or exit with instructions."""
    if sim_path is not None:
        return sim_path
    candidates = [
        RESULTS_DIR / "patrl" / "sim_df.csv",
        RESULTS_DIR / "patrl_smoke" / "sim_df.csv",
        _PROJECT_ROOT / "output" / "patrl_smoke" / "sim_df.csv",
    ]
    for p in candidates:
        if p.exists():
            return p
    print(
        "ERROR: PAT-RL sim_df not found.\n"
        f"Expected at: {candidates[0]}\n"
        "Run scripts/03_simulate_participants.py --task=patrl first."
    )
    sys.exit(2)


def _resolve_patrl_idata_dir_06(idata_dir: Path | None) -> Path:
    """Return PAT-RL idata dir (may not exist yet; caller checks)."""
    if idata_dir is not None:
        return idata_dir
    candidates = [
        RESULTS_DIR / "patrl" / "idata",
        RESULTS_DIR / "patrl_smoke" / "idata",
        _PROJECT_ROOT / "output" / "patrl_smoke" / "idata",
    ]
    for p in candidates:
        if p.exists():
            return p
    return RESULTS_DIR / "patrl" / "idata"


def _load_patrl_posterior_means_06(
    idata_dir: Path,
    model: str,
    participant_ids: list[str],
) -> dict[str, dict[str, float]]:
    """Load posterior means for omega_2 and beta from PAT-RL idata files.

    Parameters
    ----------
    idata_dir : Path
        Root directory.  Files at ``{idata_dir}/{model}/{pid}.nc``.
    model : str
        PAT-RL model name.
    participant_ids : list[str]
        Participant IDs to load.

    Returns
    -------
    dict mapping participant_id → {param: posterior_mean}.
    """
    model_dir = idata_dir / model
    results: dict[str, dict[str, float]] = {}
    n_loaded = n_missing = 0

    for pid in participant_ids:
        nc_path = model_dir / f"{pid}.nc"
        if not nc_path.exists():
            n_missing += 1
            continue

        idata = az.from_netcdf(str(nc_path))
        posterior = idata.posterior
        means: dict[str, float] = {}
        for param in ["omega_2", "beta"]:
            if param in posterior:
                arr = posterior[param].values
                if arr.ndim == 3:
                    arr = arr[:, :, 0]
                means[param] = float(np.mean(arr))
        results[pid] = means
        n_loaded += 1

    logger.info(
        "PAT-RL posterior means (%s): loaded %d, missing %d",
        model,
        n_loaded,
        n_missing,
    )
    return results


def _build_patrl_estimates_df(
    sim_df: pd.DataFrame,
    idata_dir: Path,
    model: str,
) -> pd.DataFrame:
    """Build per-participant estimates DataFrame with phenotype column.

    Parameters
    ----------
    sim_df : pandas.DataFrame
        PAT-RL simulation DataFrame with ``participant_id`` and ``phenotype``.
    idata_dir : Path
        idata root directory.
    model : str
        PAT-RL model name.

    Returns
    -------
    pandas.DataFrame
        Columns: ``participant_id``, ``phenotype``, ``omega_2``, ``beta``.
    """
    participant_ids = sim_df["participant_id"].unique().tolist()
    phen_map = (
        sim_df[["participant_id", "phenotype"]]
        .drop_duplicates("participant_id")
        .set_index("participant_id")["phenotype"]
        .to_dict()
    )

    post_means = _load_patrl_posterior_means_06(idata_dir, model, participant_ids)

    rows: list[dict] = []
    for pid, means in post_means.items():
        rows.append(
            {
                "participant_id": pid,
                "phenotype": phen_map.get(str(pid), "unknown"),
                "omega_2": means.get("omega_2", float("nan")),
                "beta": means.get("beta", float("nan")),
            }
        )

    df = pd.DataFrame(rows, columns=["participant_id", "phenotype", "omega_2", "beta"])
    df = df.dropna(subset=["omega_2", "beta"])
    return df.reset_index(drop=True)


# ---------------------------------------------------------------------------
# Cohen's d + correlation gate logic
# ---------------------------------------------------------------------------


def _compute_prl_v2_metrics(
    estimates_df: pd.DataFrame,
) -> tuple[pd.DataFrame, bool]:
    """Compute PRL-V2 phenotype separability metrics (Option A factorial).

    Parameters
    ----------
    estimates_df : pandas.DataFrame
        Per-participant estimates with ``phenotype``, ``omega_2``, ``beta``.

    Returns
    -------
    tuple of (summary_df, gate_pass)
        ``summary_df`` has columns: ``contrast``, ``param``, ``d_or_cor``,
        ``passes``, ``contrast_type``, ``n_high``, ``n_low``.
        ``gate_pass`` is True iff all three primary factorial criteria pass.
    """
    rows: list[dict] = []

    # --- Factorial: anxiety axis on omega_2 ---
    anx_high = estimates_df.loc[
        estimates_df["phenotype"].isin(ANXIETY_HIGH), "omega_2"
    ].to_numpy()
    anx_low = estimates_df.loc[
        estimates_df["phenotype"].isin(ANXIETY_LOW), "omega_2"
    ].to_numpy()

    if len(anx_high) >= 2 and len(anx_low) >= 2:
        d_omega2_factorial = cohens_d(anx_high, anx_low)
    else:
        logger.warning(
            "_compute_prl_v2_metrics: insufficient agents for anxiety axis "
            "(high=%d, low=%d) — setting d=NaN",
            len(anx_high),
            len(anx_low),
        )
        d_omega2_factorial = float("nan")

    rows.append(
        {
            "contrast": "anxiety_high_vs_low",
            "param": "omega_2",
            "d_or_cor": d_omega2_factorial,
            "passes": bool(
                not np.isnan(d_omega2_factorial)
                and abs(d_omega2_factorial) >= _PRL_V2_D_THRESHOLD
            ),
            "contrast_type": "factorial",
            "n_high": len(anx_high),
            "n_low": len(anx_low),
        }
    )

    # --- Factorial: reward axis on beta ---
    rew_high = estimates_df.loc[
        estimates_df["phenotype"].isin(REWARD_HIGH), "beta"
    ].to_numpy()
    rew_low = estimates_df.loc[
        estimates_df["phenotype"].isin(REWARD_LOW), "beta"
    ].to_numpy()

    if len(rew_high) >= 2 and len(rew_low) >= 2:
        d_beta_factorial = cohens_d(rew_high, rew_low)
    else:
        logger.warning(
            "_compute_prl_v2_metrics: insufficient agents for reward axis "
            "(high=%d, low=%d) — setting d=NaN",
            len(rew_high),
            len(rew_low),
        )
        d_beta_factorial = float("nan")

    rows.append(
        {
            "contrast": "reward_high_vs_low",
            "param": "beta",
            "d_or_cor": d_beta_factorial,
            "passes": bool(
                not np.isnan(d_beta_factorial)
                and abs(d_beta_factorial) >= _PRL_V2_D_THRESHOLD
            ),
            "contrast_type": "factorial",
            "n_high": len(rew_high),
            "n_low": len(rew_low),
        }
    )

    # --- Factorial: omega_2 / beta orthogonality ---
    all_omega2 = estimates_df["omega_2"].to_numpy()
    all_beta = estimates_df["beta"].to_numpy()
    valid = np.isfinite(all_omega2) & np.isfinite(all_beta)
    if valid.sum() >= 3:
        cor_matrix = np.corrcoef(all_omega2[valid], all_beta[valid])
        cor_val = float(cor_matrix[0, 1])
    else:
        cor_val = float("nan")

    cor_passes = bool(
        not np.isnan(cor_val) and abs(cor_val) < _PRL_V2_COR_THRESHOLD
    )
    rows.append(
        {
            "contrast": "cor_omega2_beta",
            "param": "omega_2,beta",
            "d_or_cor": cor_val,
            "passes": cor_passes,
            "contrast_type": "factorial",
            "n_high": int(valid.sum()),
            "n_low": int(valid.sum()),
        }
    )

    # --- Supplementary B-style pairwise contrasts ---
    for param, label, high_phen, low_phen in _PAIRWISE_CONTRASTS:
        high_vals = estimates_df.loc[
            estimates_df["phenotype"] == high_phen, param
        ].to_numpy()
        low_vals = estimates_df.loc[
            estimates_df["phenotype"] == low_phen, param
        ].to_numpy()

        if len(high_vals) >= 2 and len(low_vals) >= 2:
            d_val = cohens_d(high_vals, low_vals)
        else:
            d_val = float("nan")

        rows.append(
            {
                "contrast": label,
                "param": param,
                "d_or_cor": d_val,
                "passes": bool(
                    not np.isnan(d_val) and abs(d_val) >= _PRL_V2_D_THRESHOLD
                ),
                "contrast_type": "pairwise",
                "n_high": len(high_vals),
                "n_low": len(low_vals),
            }
        )

    summary_df = pd.DataFrame(
        rows,
        columns=[
            "contrast",
            "param",
            "d_or_cor",
            "passes",
            "contrast_type",
            "n_high",
            "n_low",
        ],
    )

    # Gate: only factorial rows count
    factorial_rows = summary_df[summary_df["contrast_type"] == "factorial"]
    gate_pass = bool(factorial_rows["passes"].all())

    return summary_df, gate_pass


def _print_prl_v2_gate_report(
    summary_df: pd.DataFrame,
    gate_pass: bool,
) -> None:
    """Print PRL-V2 gate report to stdout."""
    print("=" * 60)
    print("PRL-V2 GATE REPORT (Option A — 2x2 factorial)")
    print(f"d threshold: >= {_PRL_V2_D_THRESHOLD}  |  |cor| threshold: < {_PRL_V2_COR_THRESHOLD}")
    print("=" * 60)

    factorial = summary_df[summary_df["contrast_type"] == "factorial"]
    for _, row in factorial.iterrows():
        status = "PASS" if row["passes"] else "FAIL"
        contrast = str(row["contrast"])
        val = float(row["d_or_cor"])
        param = str(row["param"])

        if "cor" in contrast:
            print(
                f"  |cor({param})| = {abs(val):.3f} "
                f"(threshold < {_PRL_V2_COR_THRESHOLD}) [{status}]"
            )
        else:
            print(
                f"  {param}: d({contrast}) = {val:.3f} "
                f"(threshold >= {_PRL_V2_D_THRESHOLD}) [{status}]"
            )

    print()
    pairwise = summary_df[summary_df["contrast_type"] == "pairwise"]
    if len(pairwise) > 0:
        print("  Supplementary pairwise (not gated):")
        for _, row in pairwise.iterrows():
            val = float(row["d_or_cor"])
            print(
                f"    {row['param']}: d({row['contrast']}) = {val:.3f}"
            )
        print()

    print(f"PRL-V2 OVERALL: {'PASS' if gate_pass else 'FAIL'}")
    print("=" * 60)


# ---------------------------------------------------------------------------
# Publication figure (phenotype separability)
# ---------------------------------------------------------------------------


def _plot_phenotype_separability(
    estimates_df: pd.DataFrame,
    out_dir: Path,
    skip_plots: bool,
) -> None:
    """Save phenotype separability figure as PNG + PDF.

    Shows violin + jitter (raincloud-style) distributions of omega_2 and beta
    per phenotype across all 4 groups.  Matplotlib only — no seaborn dependency.

    Parameters
    ----------
    estimates_df : pandas.DataFrame
        Per-participant estimates with columns ``phenotype``, ``omega_2``,
        ``beta``.
    out_dir : Path
        Output directory.
    skip_plots : bool
        If True, skip file output.
    """
    if skip_plots:
        logger.info("_plot_phenotype_separability: --skip-plots set, skipping.")
        return

    phenotypes = sorted(estimates_df["phenotype"].unique().tolist())
    params = ["omega_2", "beta"]
    param_labels = {"omega_2": "ω₂ (tonic volatility)", "beta": "β (inverse temperature)"}

    rng = np.random.default_rng(seed=20)

    fig, axes = plt.subplots(1, 2, figsize=(10, 5))
    fig.suptitle("PAT-RL Phenotype Separability (PRL-V2)", fontsize=13, y=1.01)

    colors = ["#4878D0", "#EE854A", "#6ACC65", "#D65F5F"]

    for ax, param in zip(axes, params, strict=True):
        data_groups = [
            estimates_df.loc[estimates_df["phenotype"] == ph, param].dropna().to_numpy()
            for ph in phenotypes
        ]

        x_positions = np.arange(len(phenotypes), dtype=float)

        # Violin
        if any(len(g) > 1 for g in data_groups):
            vp = ax.violinplot(
                [g if len(g) > 1 else np.array([g[0], g[0]]) for g in data_groups],
                positions=x_positions,
                showmedians=True,
                widths=0.6,
            )
            for pc, col in zip(vp["bodies"], colors, strict=False):
                pc.set_facecolor(col)
                pc.set_alpha(0.35)
            for part_key in ("cbars", "cmedians", "cmins", "cmaxes"):
                if part_key in vp:
                    vp[part_key].set_edgecolor("black")
                    vp[part_key].set_linewidth(1.2)

        # Jitter scatter
        for i, (group_vals, col) in enumerate(zip(data_groups, colors, strict=False)):
            if len(group_vals) == 0:
                continue
            jitter = rng.uniform(-0.12, 0.12, len(group_vals))
            ax.scatter(
                x_positions[i] + jitter,
                group_vals,
                color=col,
                alpha=0.7,
                s=14,
                zorder=3,
            )

        # Axis formatting
        ax.set_xticks(x_positions)
        ax.set_xticklabels(phenotypes, rotation=25, ha="right", fontsize=9)
        ax.set_ylabel(param_labels[param], fontsize=10)
        ax.set_title(param_labels[param], fontsize=11)
        ax.spines["top"].set_visible(False)
        ax.spines["right"].set_visible(False)

    fig.tight_layout()

    png_path = out_dir / "phenotype_separability.png"
    pdf_path = out_dir / "phenotype_separability.pdf"
    fig.savefig(str(png_path), dpi=150, bbox_inches="tight")
    fig.savefig(str(pdf_path), bbox_inches="tight")
    plt.close(fig)
    logger.info("Saved: %s", png_path)
    logger.info("Saved: %s", pdf_path)
    print(f"  Saved: {png_path}")
    print(f"  Saved: {pdf_path}")


# ---------------------------------------------------------------------------
# PAT-RL main pipeline
# ---------------------------------------------------------------------------


def _run_phenotype_separability(args: argparse.Namespace) -> None:
    """Run PAT-RL PRL-V2 phenotype separability pipeline.

    Loads sim_df + idata, builds per-participant estimates DataFrame,
    computes Cohen's d + correlation (Option A factorial), saves
    ``phenotype_separability_summary.csv``, ``phenotype_stratified_bms.csv``,
    ``peb_covariates.csv``, and the publication figure.

    Exit codes per Decision 148:
    * 0 — all primary gate criteria pass.
    * 1 — at least one primary gate criterion fails.
    * 2 — loader error.
    """
    from prl_hgf.analysis.bms import (
        compute_batch_waic_patrl,
        compute_stratified_bms,
        export_peb_covariates,
    )

    print("=" * 60)
    print("Phase 6 — PAT-RL PRL-V2 Phenotype Separability Gate")
    print(f"fit-method: {args.fit_method}")
    print("=" * 60)

    out_dir = RESULTS_DIR / "patrl" / "group_analysis"
    out_dir.mkdir(parents=True, exist_ok=True)

    # 1. Load sim_df
    sim_path = _resolve_patrl_sim_path_06(args.sim_path)
    print(f"\nLoading PAT-RL sim_df from: {sim_path}")
    sim_df = pd.read_csv(sim_path)
    n_agents = sim_df["participant_id"].nunique()
    print(f"  {len(sim_df):,} trial rows ({n_agents} participants)")

    # Check phenotype column
    if "phenotype" not in sim_df.columns:
        print("ERROR: sim_df missing 'phenotype' column.  Regenerate via")
        print("  scripts/03_simulate_participants.py --task=patrl")
        sys.exit(2)

    # 2. Resolve idata directory
    idata_dir = _resolve_patrl_idata_dir_06(args.idata_dir)
    print(f"Loading PAT-RL idata from: {idata_dir}")

    # 3. Build per-participant estimates (omega_2, beta) for the 2-level model
    #    (primary gate uses point estimates; 3-level handles kappa separately)
    model_for_estimates = "hgf_2level_patrl"
    print(f"\nBuilding posterior mean estimates (model={model_for_estimates})...")
    estimates_df = _build_patrl_estimates_df(sim_df, idata_dir, model_for_estimates)

    if len(estimates_df) == 0:
        print(
            "\nERROR: No estimates could be loaded.  Run fitting first:\n"
            f"  scripts/12_smoke_patrl_foundation.py --fit-method {args.fit_method}\n"
            "  or: sbatch cluster/patrl_smoke.slurm"
        )
        sys.exit(2)

    print(f"  {len(estimates_df)} participants with valid estimates")
    print(f"  Phenotypes: {sorted(estimates_df['phenotype'].unique().tolist())}")

    # 4. Compute PRL-V2 metrics (Option A factorial + supplementary pairwise)
    print("\nComputing PRL-V2 phenotype separability metrics...")
    summary_df, gate_pass = _compute_prl_v2_metrics(estimates_df)

    # Save summary CSV
    summary_path = out_dir / "phenotype_separability_summary.csv"
    summary_df.to_csv(summary_path, index=False)
    print(f"  Saved: {summary_path}")

    # 5. Stratified BMS (Plan 20-06 followup — consumes fit_df from compute_batch_waic_patrl)
    print("\nComputing stratified BMS (phenotype-level)...")
    try:
        # Build idata_dict for compute_batch_waic_patrl
        idata_dict_waic: dict[str, dict[str, object]] = {}
        for model in ["hgf_2level_patrl", "hgf_3level_patrl"]:
            model_dir = idata_dir / model
            if not model_dir.exists():
                continue
            nc_files = list(model_dir.glob("*.nc"))
            if nc_files:
                model_map: dict[str, object] = {}
                for nc_file in nc_files:
                    pid = nc_file.stem
                    model_map[pid] = az.from_netcdf(str(nc_file))
                idata_dict_waic[model] = model_map

        if len(idata_dict_waic) >= 2:
            fit_df_waic = compute_batch_waic_patrl(
                sim_df=sim_df,
                idata_dict=idata_dict_waic,
                model_names=list(idata_dict_waic.keys()),
            )

            bms_results = compute_stratified_bms(
                fit_df=fit_df_waic,
                model_names=list(idata_dict_waic.keys()),
            )

            # Flatten BMS results to DataFrame
            bms_rows: list[dict] = []
            for stratum, res_list in bms_results.items():
                if isinstance(res_list, list):
                    for res in res_list:
                        for m_idx, m_name in enumerate(res["model_names"]):
                            bms_rows.append(
                                {
                                    "phenotype": stratum,
                                    "model": m_name,
                                    "exp_r": float(res["exp_r"][m_idx]),
                                    "xp": float(res["xp"][m_idx]),
                                    "pxp": float(res["pxp"][m_idx]),
                                    "bor": float(res["bor"]),
                                    "n_subjects": res["n_subjects"],
                                }
                            )
                else:
                    res = res_list
                    for m_idx, m_name in enumerate(res["model_names"]):
                        bms_rows.append(
                            {
                                "phenotype": stratum,
                                "model": m_name,
                                "exp_r": float(res["exp_r"][m_idx]),
                                "xp": float(res["xp"][m_idx]),
                                "pxp": float(res["pxp"][m_idx]),
                                "bor": float(res["bor"]),
                                "n_subjects": res["n_subjects"],
                            }
                        )

            if bms_rows:
                bms_df = pd.DataFrame(bms_rows)
                bms_path = out_dir / "phenotype_stratified_bms.csv"
                bms_df.to_csv(bms_path, index=False)
                print(f"  Saved: {bms_path}")

            # Export PEB covariates
            try:
                peb_idata_dict = {k: v for k, v in idata_dict_waic.items()}
                peb_df = export_peb_covariates(
                    idata_dict=peb_idata_dict,
                    sim_df=sim_df,
                    model_name=model_for_estimates,
                )
                peb_path = out_dir / "peb_covariates.csv"
                peb_df.to_csv(peb_path, index=False)
                print(f"  Saved: {peb_path}")
            except Exception as exc:  # noqa: BLE001
                logger.warning("export_peb_covariates failed: %s", exc)
        else:
            print(
                "  NOTE: idata for only one model found. "
                "Stratified BMS and PEB export require both 2-level and 3-level idata. "
                "Run full cohort fitting first."
            )
    except Exception as exc:  # noqa: BLE001
        logger.warning("Stratified BMS step failed: %s", exc)
        print(f"  WARNING: Stratified BMS failed — {exc}")

    # 6. Publication figure
    _plot_phenotype_separability(estimates_df, out_dir, args.skip_plots)

    # 7. Gate report
    _print_prl_v2_gate_report(summary_df, gate_pass)

    print(f"\nAll PAT-RL group analysis outputs saved to: {out_dir}")
    sys.exit(0 if gate_pass else 1)


def main() -> None:
    """Run Phase 6 group-level analysis pipeline."""
    args = _parse_args()

    # -----------------------------------------------------------------------
    # PAT-RL phenotype separability branch (Phase 20 PRL-V2 gate)
    # -----------------------------------------------------------------------
    if args.task == "patrl" and args.analysis == "phenotype_separability":
        _run_phenotype_separability(args)
        return

    if args.task == "patrl" and args.analysis == "group_interaction":
        print(
            "NOTE: --task=patrl --analysis=group_interaction is not yet implemented. "
            "Use --analysis=phenotype_separability for the PAT-RL PRL-V2 gate."
        )
        sys.exit(0)

    # -----------------------------------------------------------------------
    # PRL (pick_best_cue) branch — original Phase 6 code (unchanged)
    # -----------------------------------------------------------------------
    model = f"hgf_{args.model}"
    params = _PARAMS_3LEVEL if args.model == "3level" else _PARAMS_2LEVEL

    GROUP_ANALYSIS_DIR.mkdir(parents=True, exist_ok=True)

    print("=" * 60)
    print("Phase 6 — Group-Level HGF Parameter Analysis")
    print(f"Model: {model}")
    print("=" * 60)

    # --- 1. Load fit results ---
    fit_path = _resolve_fit_path(args.model)
    if fit_path is None or not fit_path.exists():
        print(
            f"\nERROR: Fit results for model '{model}' not found.\n"
            "Run scripts/04_fit_participants.py first.\n"
            f"Expected at: {RESULTS_DIR / f'fit_results_{model}.csv'}"
        )
        sys.exit(1)

    print(f"\nLoading fit results from: {fit_path}")
    fit_df = pd.read_csv(fit_path)
    print(f"  {len(fit_df):,} rows loaded")

    # Optionally load sim_df for context (not strictly required for group analysis)
    sim_path = _resolve_sim_path()
    if sim_path is not None:
        print(f"Simulated data found at: {sim_path} (not required for group analysis)")

    # --- 2. Build wide-form estimates ---
    print("\nBuilding wide-form estimates table...")
    estimates_wide = build_estimates_wide(fit_df, model=model, exclude_flagged=True)
    n_participants = estimates_wide["participant_id"].nunique()
    print(f"  {len(estimates_wide)} participant-session rows ({n_participants} participants)")

    estimates_path = GROUP_ANALYSIS_DIR / f"estimates_wide_{model}.csv"
    estimates_wide.to_csv(estimates_path, index=False)
    print(f"  Saved: {estimates_path}")

    # Canonical filename (manuscript reads estimates_wide.csv)
    canonical_estimates_path = GROUP_ANALYSIS_DIR / "estimates_wide.csv"
    estimates_wide.to_csv(canonical_estimates_path, index=False)
    print(f"  Saved (canonical): {canonical_estimates_path}")

    # --- 3. Effect sizes ---
    print("\nComputing effect sizes...")
    available_sessions = sorted(estimates_wide["session"].dropna().unique().tolist())
    available_params = [p for p in params if p in estimates_wide.columns]

    if len(available_params) == 0:
        print(f"  WARNING: None of {params} found in estimates_wide. Skipping effect sizes.")
    else:
        effect_df = compute_effect_sizes_table(
            estimates_wide,
            params=available_params,
            sessions=available_sessions,
        )
        effect_path = GROUP_ANALYSIS_DIR / f"effect_sizes_{model}.csv"
        effect_df.to_csv(effect_path, index=False)
        print(f"  Saved: {effect_path}")

        # Canonical filename (manuscript reads effect_sizes.csv)
        canonical_effect_path = GROUP_ANALYSIS_DIR / "effect_sizes.csv"
        effect_df.to_csv(canonical_effect_path, index=False)
        print(f"  Saved (canonical): {canonical_effect_path}")
        print(effect_df.to_string(index=False))

    # --- 4. Bayesian mixed-effects models ---
    print("\nFitting Bayesian mixed-effects models (bambi)...")
    print("  NOTE: Phase stratification uses behavioral metrics (win-stay, lose-shift)")
    print("  as trial-level proxies since omega_2 is a session-level parameter.")

    if n_participants < 6:
        print(
            f"  WARNING: Only {n_participants} participants available. "
            "Group models require at least 6 participants (3 per group). Skipping."
        )
        group_results: dict = {}
    else:
        group_results = summarize_group_models(
            estimates_wide,
            params=available_params,
            draws=args.draws,
        )

        # Save posterior contrasts — per-parameter files (backward compat) and
        # combined group_contrasts.csv (canonical filename for manuscript)
        all_contrasts: list[pd.DataFrame] = []
        for param, res in group_results.items():
            contrasts_path = GROUP_ANALYSIS_DIR / f"contrasts_{model}_{param}.csv"
            res["contrasts"].to_csv(contrasts_path, index=False)
            print(f"  Saved contrasts: {contrasts_path}")
            print(res["contrasts"].to_string(index=False))

            # Tag with parameter for combined table
            tagged = res["contrasts"].copy()
            tagged.insert(0, "parameter", param)
            all_contrasts.append(tagged)

            # Power-validation: report whether omega_2 HDI excludes zero
            if param == "omega_2" and "hdi_excludes_zero" in res["contrasts"].columns:
                excludes_rows = res["contrasts"][
                    res["contrasts"]["hdi_excludes_zero"]
                ]
                n_sessions = len(res["contrasts"])
                n_excludes = len(excludes_rows)
                print(
                    f"\n  [Power validation] omega_2: HDI excludes zero in "
                    f"{n_excludes}/{n_sessions} sessions "
                    f"({'meets' if n_excludes >= 1 else 'does not meet'} "
                    f"Bayesian significance criterion)"
                )

        if all_contrasts:
            combined_contrasts = pd.concat(all_contrasts, ignore_index=True)
            # Save canonical filename (manuscript reads group_contrasts.csv)
            canonical_contrasts_path = GROUP_ANALYSIS_DIR / "group_contrasts.csv"
            combined_contrasts.to_csv(canonical_contrasts_path, index=False)
            print(f"\n  Saved combined contrasts (canonical): {canonical_contrasts_path}")

    # --- 4b. Phase-stratified analysis (exploratory) ---
    print("\nPhase-stratified analysis (stable vs volatile)...")
    phase_sim_path = _resolve_sim_path()
    if phase_sim_path is not None and phase_sim_path.exists():
        phase_sim_df = pd.read_csv(phase_sim_path)
        try:
            phase_df = build_phase_stratified_df(phase_sim_df)
        except ValueError as exc:
            print(f"  WARNING: {exc}")
            print("  Skipping phase-stratified analysis.")
            phase_df = None

        if phase_df is not None:
            phase_path = GROUP_ANALYSIS_DIR / "phase_stratified.csv"
            phase_df.to_csv(phase_path, index=False)
            print(f"  Saved: {phase_path}")

            # Summarise by group x phase
            summary = (
                phase_df
                .groupby(["group", "phase_label"])[["win_stay_rate", "lose_shift_rate"]]
                .agg(["mean", "std"])
            )
            print("\n  Win-Stay and Lose-Shift by Group x Phase:")
            print(summary.to_string())

            # Fit group x phase model on win_stay_rate and lose_shift_rate
            n_participants_phase = phase_df["participant_id"].nunique()
            if n_participants_phase >= 6:
                import bambi as bmb  # noqa: E402

                phase_data = phase_df.copy()
                phase_data["group"] = pd.Categorical(phase_data["group"].astype(str))
                phase_data["phase_label"] = pd.Categorical(
                    phase_data["phase_label"].astype(str)
                )

                for outcome in ["win_stay_rate", "lose_shift_rate"]:
                    formula = (
                        f"{outcome} ~ C(group) * C(phase_label) + (1 | participant_id)"
                    )
                    print(f"\n  Fitting bambi model: {formula}")
                    try:
                        phase_model = bmb.Model(formula, phase_data)
                        phase_idata = phase_model.fit(
                            draws=args.draws,
                            tune=1000,
                            chains=4,
                            random_seed=42,
                        )
                        phase_summary = az.summary(
                            phase_idata,
                            var_names=[
                                v
                                for v in phase_idata.posterior.data_vars
                                if "1|participant_id" not in v and v != "sigma"
                            ],
                        )
                        print(f"\n  {outcome} model summary:")
                        print(phase_summary.to_string())
                    except Exception as exc:  # noqa: BLE001
                        print(f"  WARNING: bambi phase model failed — {exc}")
            else:
                print(
                    f"  WARNING: Only {n_participants_phase} participants. "
                    "Need >= 6 for group x phase model. Skipping."
                )
    else:
        print("  Simulated data not found. Skipping phase-stratified analysis.")
        print("  (Run scripts/03_simulate_participants.py first.)")

    # --- 5. Plots ---
    if args.skip_plots:
        print("\nSkipping plots (--skip-plots).")
    else:
        print("\nSaving plots...")
        for param in available_params:
            if param not in estimates_wide.columns:
                continue

            # Raincloud
            rc_path = GROUP_ANALYSIS_DIR / f"raincloud_{param}.png"
            fig = plot_raincloud(estimates_wide, outcome=param, save_path=rc_path)
            plt.close(fig)
            print(f"  Saved: {rc_path}")

            # Interaction
            int_path = GROUP_ANALYSIS_DIR / f"interaction_{param}.png"
            fig = plot_interaction(estimates_wide, outcome=param, save_path=int_path)
            plt.close(fig)
            print(f"  Saved: {int_path}")

    # --- 6. Summary ---
    print("\n" + "=" * 60)
    print("Phase 6 Group Analysis — Complete")
    print("=" * 60)
    print(f"Model: {model}")
    print(f"Participants analysed: {n_participants}")
    print(f"Parameters: {available_params}")
    print(f"Outputs saved to: {GROUP_ANALYSIS_DIR}")
    print("=" * 60)


if __name__ == "__main__":
    main()
