"""Grid-index arithmetic for the BFDA power sweep.

Maps flat ``SLURM_ARRAY_TASK_ID`` values to ``(n_per_group, effect_size,
iteration)`` tuples without any CSV lookup, using integer division and
modulo on the three-dimensional grid.

Grid layout (row-major order, slowest-to-fastest):
    n_per_group (outer) x effect_size (middle) x iteration (inner)

The SBF (Sequential Bayes Factor) grid is 2-D: ``effect_size x iteration``.
Sample size (N) is handled inside each iteration by simulating at max N and
subsampling at each N level after fitting.
"""

from __future__ import annotations


def total_grid_size(
    n_per_group_grid: list[int],
    effect_size_grid: list[float],
    n_iterations: int,
) -> int:
    """Return the total number of tasks in the power sweep grid.

    Parameters
    ----------
    n_per_group_grid : list[int]
        Sample sizes per group to sweep over.
    effect_size_grid : list[float]
        Effect size deltas to sweep over.
    n_iterations : int
        Number of simulated datasets per grid cell.

    Returns
    -------
    int
        ``len(n_per_group_grid) * len(effect_size_grid) * n_iterations``.
    """
    return len(n_per_group_grid) * len(effect_size_grid) * n_iterations


def decode_task_id(
    task_id: int,
    n_per_group_grid: list[int],
    effect_size_grid: list[float],
    n_iterations: int,
) -> tuple[int, float, int]:
    """Decode a flat task index into grid coordinates.

    The grid is laid out in row-major order with *n_per_group* varying
    slowest, *effect_size* in the middle, and *iteration* varying fastest.

    Parameters
    ----------
    task_id : int
        Zero-based flat index (``SLURM_ARRAY_TASK_ID``).
    n_per_group_grid : list[int]
        Sample sizes per group to sweep over.
    effect_size_grid : list[float]
        Effect size deltas to sweep over.
    n_iterations : int
        Number of simulated datasets per grid cell.

    Returns
    -------
    tuple[int, float, int]
        ``(n_per_group, effect_size, iteration)`` for the given task ID.

    Raises
    ------
    IndexError
        If *task_id* is outside ``[0, total_grid_size)``.
    """
    size = total_grid_size(n_per_group_grid, effect_size_grid, n_iterations)
    if task_id < 0 or task_id >= size:
        raise IndexError(
            f"task_id {task_id} is out of range for grid of size {size} "
            f"(valid range: 0..{size - 1})."
        )

    n_d = len(effect_size_grid) * n_iterations
    n_idx = task_id // n_d
    d_idx = (task_id // n_iterations) % len(effect_size_grid)
    iter_idx = task_id % n_iterations

    return (n_per_group_grid[n_idx], effect_size_grid[d_idx], iter_idx)


def chunk_task_ids(
    chunk_id: int,
    n_chunks: int,
    total_size: int,
) -> list[int]:
    """Return the task IDs assigned to a given chunk.

    Divides ``total_size`` tasks into ``n_chunks`` contiguous blocks.
    The last chunk absorbs any remainder.

    Parameters
    ----------
    chunk_id : int
        Zero-based chunk index (``SLURM_ARRAY_TASK_ID``).
    n_chunks : int
        Total number of chunks (must be >= 1).
    total_size : int
        Total number of tasks across all chunks.

    Returns
    -------
    list[int]
        Task IDs ``[start, start + 1, ..., end - 1]`` for this chunk.

    Raises
    ------
    IndexError
        If *chunk_id* is outside ``[0, n_chunks)``.
    """
    if chunk_id < 0 or chunk_id >= n_chunks:
        raise IndexError(
            f"chunk_id {chunk_id} is out of range for {n_chunks} chunks "
            f"(valid range: 0..{n_chunks - 1})."
        )
    chunk_size = total_size // n_chunks
    start = chunk_id * chunk_size
    end = start + chunk_size if chunk_id < n_chunks - 1 else total_size
    return list(range(start, end))


# ---------------------------------------------------------------------------
# SBF (Sequential Bayes Factor) grid — 2-D: effect_size x iteration
# ---------------------------------------------------------------------------


def sbf_grid_size(
    effect_size_grid: list[float],
    n_iterations: int,
) -> int:
    """Return the total number of tasks in the SBF power sweep grid.

    The SBF grid is 2-D because sample size (N) is handled inside each
    iteration via subsampling, not as a separate grid axis.

    Parameters
    ----------
    effect_size_grid : list[float]
        Effect size deltas to sweep over.
    n_iterations : int
        Number of simulated datasets per effect size level.

    Returns
    -------
    int
        ``len(effect_size_grid) * n_iterations``.
    """
    return len(effect_size_grid) * n_iterations


def decode_sbf_task_id(
    task_id: int,
    effect_size_grid: list[float],
    n_iterations: int,
) -> tuple[float, int]:
    """Decode a flat task index into SBF grid coordinates.

    The grid is laid out in row-major order with *effect_size* varying
    slowest and *iteration* varying fastest.

    Parameters
    ----------
    task_id : int
        Zero-based flat index (``SLURM_ARRAY_TASK_ID``).
    effect_size_grid : list[float]
        Effect size deltas to sweep over.
    n_iterations : int
        Number of simulated datasets per effect size level.

    Returns
    -------
    tuple[float, int]
        ``(effect_size, iteration)`` for the given task ID.

    Raises
    ------
    IndexError
        If *task_id* is outside ``[0, sbf_grid_size)``.
    """
    size = sbf_grid_size(effect_size_grid, n_iterations)
    if task_id < 0 or task_id >= size:
        raise IndexError(
            f"task_id {task_id} is out of range for SBF grid of size "
            f"{size} (valid range: 0..{size - 1})."
        )

    d_idx = task_id // n_iterations
    iter_idx = task_id % n_iterations
    return (effect_size_grid[d_idx], iter_idx)
