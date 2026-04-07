"""Grid-index arithmetic for the BFDA power sweep.

Maps flat ``SLURM_ARRAY_TASK_ID`` values to ``(n_per_group, effect_size,
iteration)`` tuples without any CSV lookup, using integer division and
modulo on the three-dimensional grid.

Grid layout (row-major order, slowest-to-fastest):
    n_per_group (outer) x effect_size (middle) x iteration (inner)
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
