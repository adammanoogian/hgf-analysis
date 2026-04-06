"""Visualization helpers for parameter recovery analysis.

Provides scatter plots (true vs recovered) and a correlation heatmap for
the PRL HGF parameter recovery validation.

Matplotlib uses the non-interactive Agg backend so plots can be generated
in headless environments (CI, HPC clusters, etc.).
"""

from __future__ import annotations

from pathlib import Path

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt  # noqa: E402
import numpy as np  # noqa: E402
import pandas as pd  # noqa: E402
import seaborn as sns  # noqa: E402

__all__ = ["plot_recovery_scatter", "plot_correlation_matrix"]

# Threshold below which omega_3 recovery is annotated with a caveat
_OMEGA3_CAVEAT = "Recovery expected to be poor (known limitation)"


def plot_recovery_scatter(
    recovery_df: pd.DataFrame,
    metrics_df: pd.DataFrame,
    r_threshold: float = 0.7,
    save_path: Path | None = None,
) -> plt.Figure:
    """Plot true vs recovered parameter values for each parameter.

    Creates a multi-panel figure with one scatter subplot per parameter
    present in ``metrics_df``.  Each panel includes:

    * Scatter of true (x) vs recovered posterior mean (y), alpha=0.4.
    * Dashed black identity line spanning the data range.
    * Annotation of Pearson r and p-value.
    * Title coloured green (|r| >= threshold) or red (|r| < threshold).
    * For omega_3, an italic caveat if |r| < threshold.

    Parameters
    ----------
    recovery_df : pandas.DataFrame
        Output of :func:`~prl_hgf.analysis.recovery.build_recovery_df`.
        Must contain fitted-parameter columns (``omega_2``, etc.) and
        true-parameter columns (``true_omega_2``, etc.).
    metrics_df : pandas.DataFrame
        Output of :func:`~prl_hgf.analysis.recovery.compute_recovery_metrics`.
        Must contain columns ``parameter``, ``r``, ``p``.
    r_threshold : float, optional
        Threshold for pass/fail colouring. Default 0.7.
    save_path : Path or None, optional
        If provided, the figure is saved as a PNG at 150 dpi.

    Returns
    -------
    matplotlib.figure.Figure
        The completed figure object.
    """
    _TRUE_MAP = {
        "omega_2": "true_omega_2",
        "omega_3": "true_omega_3",
        "kappa": "true_kappa",
        "beta": "true_beta",
        "zeta": "true_zeta",
    }

    params = metrics_df["parameter"].tolist()
    n_params = len(params)

    fig, axes = plt.subplots(1, n_params, figsize=(4 * n_params, 4))
    if n_params == 1:
        axes = [axes]

    for ax, param in zip(axes, params, strict=True):
        row = metrics_df[metrics_df["parameter"] == param].iloc[0]
        r_val = float(row["r"])
        p_val = float(row["p"])

        true_col = _TRUE_MAP.get(param)
        if true_col is None or true_col not in recovery_df.columns or param not in recovery_df.columns:
            ax.set_title(param, color="grey")
            ax.text(0.5, 0.5, "Data not available", transform=ax.transAxes, ha="center")
            continue

        x = recovery_df[true_col].to_numpy(dtype=float)
        y = recovery_df[param].to_numpy(dtype=float)

        # Scatter
        ax.scatter(x, y, alpha=0.4, s=20, color="steelblue", edgecolors="none")

        # Identity line
        finite_vals = np.concatenate([x[np.isfinite(x)], y[np.isfinite(y)]])
        if len(finite_vals) > 0:
            lo, hi = finite_vals.min(), finite_vals.max()
            ax.plot([lo, hi], [lo, hi], "--k", linewidth=1, label="identity")

        # r / p annotation
        p_str = f"p={p_val:.3f}" if p_val >= 0.001 else "p<0.001"
        ax.text(
            0.05,
            0.95,
            f"r={r_val:.2f}, {p_str}",
            transform=ax.transAxes,
            va="top",
            fontsize=9,
        )

        # omega_3 caveat annotation
        if param == "omega_3" and abs(r_val) < r_threshold:
            ax.text(
                0.5,
                0.05,
                _OMEGA3_CAVEAT,
                transform=ax.transAxes,
                ha="center",
                fontsize=7,
                style="italic",
                color="dimgrey",
            )

        # Title colour based on threshold
        title_color = "green" if abs(r_val) >= r_threshold else "red"
        ax.set_title(param, color=title_color, fontsize=10)
        ax.set_xlabel("True")
        ax.set_ylabel("Recovered (posterior mean)")

    fig.tight_layout()

    if save_path is not None:
        fig.savefig(save_path, dpi=150, bbox_inches="tight")

    return fig


def plot_correlation_matrix(
    corr_df: pd.DataFrame,
    save_path: Path | None = None,
) -> plt.Figure:
    """Plot a heatmap of the parameter correlation matrix.

    Uses seaborn's ``heatmap`` with annotated cell values.  Cells where
    |r| > 0.8 are noted in a text annotation below the plot if any exist.

    Parameters
    ----------
    corr_df : pandas.DataFrame
        Square correlation matrix, e.g. the output of
        :func:`~prl_hgf.analysis.recovery.compute_correlation_matrix`.
    save_path : Path or None, optional
        If provided, the figure is saved as a PNG at 150 dpi.

    Returns
    -------
    matplotlib.figure.Figure
        The completed figure object.
    """
    fig, ax = plt.subplots(figsize=(6, 5))

    sns.heatmap(
        corr_df,
        annot=True,
        fmt=".2f",
        cmap="RdBu_r",
        vmin=-1,
        vmax=1,
        center=0,
        ax=ax,
        square=True,
    )
    ax.set_title("Parameter correlation matrix (posterior means)", fontsize=11)

    # Note high off-diagonal correlations (potential confounds)
    _CONCERN_THRESHOLD = 0.8
    arr = corr_df.to_numpy()
    n = arr.shape[0]
    high_pairs: list[str] = []
    for i in range(n):
        for j in range(i + 1, n):
            if abs(arr[i, j]) > _CONCERN_THRESHOLD:
                high_pairs.append(
                    f"{corr_df.columns[i]} & {corr_df.columns[j]} (r={arr[i, j]:.2f})"
                )

    if high_pairs:
        note = "High correlation concern (|r|>0.8): " + "; ".join(high_pairs)
        fig.text(
            0.5,
            -0.02,
            note,
            ha="center",
            fontsize=7,
            color="firebrick",
            wrap=True,
        )

    fig.tight_layout()

    if save_path is not None:
        fig.savefig(save_path, dpi=150, bbox_inches="tight")

    return fig
