"""RNG seeding utilities for parallel SLURM array tasks.

Uses :class:`numpy.random.SeedSequence` to generate independent child
random number generators for each array task. This guarantees that no two
tasks share a state vector, regardless of the number of jobs or master seed.
"""

from __future__ import annotations

import numpy as np


def make_child_rng(
    master_seed: int,
    n_jobs: int,
    job_index: int,
) -> np.random.Generator:
    """Return an independent RNG for a single SLURM array task.

    Uses :class:`numpy.random.SeedSequence` to spawn ``n_jobs`` child
    sequences from ``master_seed``, then wraps ``children[job_index]`` in a
    :class:`numpy.random.Generator` via :func:`numpy.random.default_rng`.
    The SeedSequence algorithm guarantees that all child seeds have distinct
    internal state vectors, so no two tasks produce correlated streams.

    Parameters
    ----------
    master_seed : int
        Master RNG seed passed to :class:`numpy.random.SeedSequence`.
    n_jobs : int
        Total number of array tasks (must be >= 1).
    job_index : int
        Zero-based index of this task (must satisfy ``0 <= job_index < n_jobs``).

    Returns
    -------
    numpy.random.Generator
        Independent generator for this task.

    Raises
    ------
    ValueError
        If ``n_jobs < 1``.
    ValueError
        If ``job_index`` is outside ``[0, n_jobs)``.

    Examples
    --------
    >>> rng = make_child_rng(master_seed=42, n_jobs=10, job_index=0)
    >>> isinstance(rng, np.random.Generator)
    True
    """
    if n_jobs < 1:
        raise ValueError(
            f"n_jobs must be >= 1, got {n_jobs}."
        )
    if not (0 <= job_index < n_jobs):
        raise ValueError(
            f"job_index must be in [0, n_jobs), "
            f"expected 0 <= job_index < {n_jobs}, got {job_index}."
        )
    children = np.random.SeedSequence(master_seed).spawn(n_jobs)
    return np.random.default_rng(children[job_index])


def make_chunk_rngs(
    master_seed: int,
    total_tasks: int,
    task_ids: list[int],
) -> list[np.random.Generator]:
    """Return independent RNGs for a batch of task IDs.

    Spawns ``total_tasks`` children from ``master_seed`` once, then returns
    generators for only the requested ``task_ids``.  This is efficient for
    chunk-based execution where a single SLURM job processes many iterations.

    Parameters
    ----------
    master_seed : int
        Master RNG seed passed to :class:`numpy.random.SeedSequence`.
    total_tasks : int
        Total number of tasks in the full grid (must be >= 1).
    task_ids : list[int]
        Zero-based task indices to generate RNGs for.

    Returns
    -------
    list[numpy.random.Generator]
        One generator per element of *task_ids*, in the same order.

    Raises
    ------
    ValueError
        If ``total_tasks < 1``.
    IndexError
        If any task ID is outside ``[0, total_tasks)``.
    """
    if total_tasks < 1:
        raise ValueError(f"total_tasks must be >= 1, got {total_tasks}.")
    children = np.random.SeedSequence(master_seed).spawn(total_tasks)
    rngs: list[np.random.Generator] = []
    for tid in task_ids:
        if tid < 0 or tid >= total_tasks:
            raise IndexError(
                f"task_id {tid} is out of range for {total_tasks} tasks."
            )
        rngs.append(np.random.default_rng(children[tid]))
    return rngs
