#!/usr/bin/env python
"""Entry point for chunk-based power analysis on SLURM.

Each invocation processes a contiguous chunk of the power sweep grid.
A single process reuses the JAX-compiled HGF model across all iterations
in the chunk, avoiding redundant JIT compilation.

Grid layout: ``n_per_group x effect_size x iteration`` (row-major).
With ``n_chunks=3`` and the default grid (7 N x 3 d x 200 iter = 4200
tasks), each chunk handles ~1400 iterations and writes one combined
parquet file.

Chunk assignment:
    chunk 0 → task_ids [0, 1400)
    chunk 1 → task_ids [1400, 2800)
    chunk 2 → task_ids [2800, 4200)

In ``--dry-run`` mode, placeholder rows are written without running
the full simulate-fit pipeline.
"""

from __future__ import annotations

import argparse
import logging
import sys
from pathlib import Path

# Ensure project root is on sys.path so imports work on cluster
# without an editable install.
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

import config as _cfg
from prl_hgf.env.task_config import load_config
from prl_hgf.power.config import load_power_config
from prl_hgf.power.grid import chunk_task_ids, decode_task_id, total_grid_size
from prl_hgf.power.iteration import run_power_iteration
from prl_hgf.power.schema import write_parquet_batch
from prl_hgf.power.seeds import make_chunk_rngs

log = logging.getLogger(__name__)


def parse_args() -> argparse.Namespace:
    """Parse command-line arguments.

    Returns
    -------
    argparse.Namespace
        Parsed arguments.
    """
    parser = argparse.ArgumentParser(
        description="Run a chunk of power analysis iterations (SLURM job).",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument(
        "--chunk-id",
        type=int,
        required=True,
        help="Zero-based chunk index (SLURM_ARRAY_TASK_ID).",
    )
    parser.add_argument(
        "--job-id",
        type=str,
        required=True,
        help="SLURM_ARRAY_JOB_ID (used in output filename).",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        default=False,
        help=(
            "Write placeholder parquet rows instead of running the full "
            "pipeline. Used to verify infrastructure without MCMC."
        ),
    )
    parser.add_argument(
        "--fit-chains",
        type=int,
        default=2,
        help="Number of MCMC chains for power sweep fits.",
    )
    parser.add_argument(
        "--fit-draws",
        type=int,
        default=500,
        help="Posterior draws per chain.",
    )
    parser.add_argument(
        "--fit-tune",
        type=int,
        default=500,
        help="Tuning steps per chain.",
    )
    parser.add_argument(
        "--sampler",
        type=str,
        choices=["pymc", "numpyro"],
        default="pymc",
        help="MCMC backend: pymc (PyTensor NUTS) or numpyro (JAX NUTS).",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=None,
        help=(
            "Override output directory. Defaults to RESULTS_DIR / 'power'. "
            "Use this in tests to redirect output to a tmp directory."
        ),
    )
    return parser.parse_args()


def main() -> None:
    """Execute one chunk of the power sweep.

    Raises
    ------
    SystemExit
        On argument parse error (via argparse).
    """
    args = parse_args()

    base_config = load_config()
    power_config = load_power_config()

    grid_size = total_grid_size(
        power_config.n_per_group_grid,
        power_config.effect_size_grid,
        power_config.n_iterations,
    )
    task_ids = chunk_task_ids(args.chunk_id, power_config.n_chunks, grid_size)

    output_dir = (
        args.output_dir
        if args.output_dir is not None
        else _cfg.RESULTS_DIR / "power"
    )

    out_path = output_dir / f"job_{args.job_id}_chunk_{args.chunk_id:04d}.parquet"

    if args.dry_run:
        rows: list[dict] = []
        for tid in task_ids:
            n_per_group, effect_size, iteration = decode_task_id(
                tid,
                power_config.n_per_group_grid,
                power_config.effect_size_grid,
                power_config.n_iterations,
            )
            rows.append(
                {
                    "sweep_type": "smoke_test",
                    "effect_size": effect_size,
                    "n_per_group": n_per_group,
                    "trial_count": base_config.task.n_trials_total,
                    "iteration": iteration,
                    "parameter": "omega_2",
                    "bf_value": 1.0,
                    "bf_exceeds": False,
                    "bms_xp": 0.5,
                    "bms_correct": False,
                    "recovery_r": 0.0,
                    "n_divergences": 0,
                    "mean_rhat": 1.0,
                }
            )
        write_parquet_batch(rows, out_path)
        print(
            f"Dry run: wrote {len(rows)} placeholder rows to {out_path}"
        )
        return

    # Build independent RNGs for all task IDs in this chunk (spawn once)
    rngs = make_chunk_rngs(power_config.master_seed, grid_size, task_ids)

    all_results: list[dict] = []
    for i, tid in enumerate(task_ids):
        n_per_group, effect_size_delta, iteration = decode_task_id(
            tid,
            power_config.n_per_group_grid,
            power_config.effect_size_grid,
            power_config.n_iterations,
        )

        log.info(
            "Chunk %d: task %d/%d (N=%d, d=%.1f, iter=%d)",
            args.chunk_id,
            i + 1,
            len(task_ids),
            n_per_group,
            effect_size_delta,
            iteration,
        )

        results = run_power_iteration(
            base_config=base_config,
            n_per_group=n_per_group,
            effect_size_delta=effect_size_delta,
            iteration=iteration,
            child_seed=int(rngs[i].integers(0, 2**31)),
            power_config=power_config,
            n_chains=args.fit_chains,
            n_draws=args.fit_draws,
            n_tune=args.fit_tune,
            sampler=args.sampler,
        )
        all_results.extend(results)

        if (i + 1) % 50 == 0:
            print(
                f"  Progress: {i + 1}/{len(task_ids)} iterations complete"
            )

    write_parquet_batch(all_results, out_path)
    print(
        f"Wrote {len(all_results)} rows ({len(task_ids)} iterations) "
        f"to {out_path}"
    )


if __name__ == "__main__":
    main()
