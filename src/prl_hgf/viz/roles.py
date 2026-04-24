"""Role + level + branch_idx inference for pyhgf Network nodes.

All inference is adjacency-only: a node's role is determined by its
position in the edge graph, never by the presence/absence of keys in
its per-node attribute dict (see Pitfall P16 in the phase 22 research
doc -- ``tonic_volatility`` is present on BOTH continuous-state and
volatile-state nodes, so reading it as a role signal is ambiguous).

The correct structural signal for ``"volatility"`` is: some OTHER node
lists this node's idx in its ``volatility_parents`` tuple.

Verified against pyhgf 0.2.8 (``AdjacencyLists`` NamedTuple fields:
``node_type``, ``value_parents``, ``volatility_parents``,
``value_children``, ``volatility_children``, ``coupling_fn``).
"""

from __future__ import annotations

from collections import deque
from typing import Any


def infer_role(
    idx: int,
    edges: tuple[Any, ...] | list[Any],
    input_idxs: tuple[int, ...],
) -> str:
    """Infer the role of node ``idx`` from adjacency structure alone.

    Parameters
    ----------
    idx
        Node index being classified.
    edges
        The full sequence ``network.edges`` -- a tuple/list of
        ``AdjacencyLists`` NamedTuples with a ``volatility_parents``
        field (``tuple[int, ...] | None``).
    input_idxs
        The network's ``input_idxs`` tuple.

    Returns
    -------
    str
        One of ``"input"``, ``"volatility"``, ``"value"``.

    Notes
    -----
    Precedence: ``"input"`` wins if ``idx in input_idxs``. Else
    ``"volatility"`` wins if any OTHER edge's ``volatility_parents``
    contains ``idx``. Else ``"value"`` is the fallback.

    **Never reads per-node attribute dict keys** (Pitfall P16). Role is
    purely structural.
    """
    if idx in input_idxs:
        return "input"
    for other in edges:
        vp = other.volatility_parents
        if vp is not None and idx in vp:
            return "volatility"
    return "value"


def assign_levels_and_branches(
    edges: tuple[Any, ...] | list[Any],
    input_idxs: tuple[int, ...],
) -> tuple[dict[int, int], dict[int, int | None], list[int]]:
    """BFS from ``input_idxs`` to assign ``level`` and ``branch_idx`` per node.

    Parameters
    ----------
    edges
        The full ``network.edges`` sequence.
    input_idxs
        The network's ``input_idxs`` tuple.

    Returns
    -------
    levels
        ``dict[node_idx -> level]``. Level 1 = input layer. Parents of a
        level-k node are level k+1 on first discovery.
    branches
        ``dict[node_idx -> branch_idx | None]``. Input nodes get their
        ``enumerate()`` position (0, 1, 2, ...). Interior nodes inherit
        the ``branch_idx`` of whichever parent first enqueued them. If a
        subsequent path reaches the same node from a DIFFERENT branch,
        ``branch_idx`` is promoted to ``None`` (the "shared node" sentinel).
    order
        ``list[int]`` -- BFS discovery order. Callers wanting deterministic
        emission order (e.g. ``NodeSpec`` tuple) iterate ``order``.

    Notes
    -----
    Uses ``set[int]`` for visited (Pitfall P3 guard). The shared
    volatility parent in pick_best_cue 3-level (node 6, reachable
    from branches 0/1/2) is visited exactly once and ends up with
    ``branches[6] is None``.
    """
    visited: set[int] = set()
    levels: dict[int, int] = {}
    branches: dict[int, int | None] = {}
    order: list[int] = []
    queue: deque[tuple[int, int, int | None]] = deque()

    for branch_idx, input_idx in enumerate(input_idxs):
        queue.append((input_idx, 1, branch_idx))

    while queue:
        idx, level, branch = queue.popleft()
        if idx in visited:
            # Contested branch detection: if we revisit from a different
            # branch than originally recorded, promote to shared (None).
            if branches.get(idx) is not None and branches[idx] != branch:
                branches[idx] = None
            continue
        visited.add(idx)
        order.append(idx)
        levels[idx] = level
        branches[idx] = branch

        edge = edges[idx]
        parent_idxs: list[int] = []
        if edge.value_parents is not None:
            parent_idxs.extend(edge.value_parents)
        if edge.volatility_parents is not None:
            parent_idxs.extend(edge.volatility_parents)

        for parent_idx in parent_idxs:
            if parent_idx in visited:
                # Already emitted -- check for contested branch promotion.
                if (
                    branches.get(parent_idx) is not None
                    and branches[parent_idx] != branch
                ):
                    branches[parent_idx] = None
                continue
            queue.append((parent_idx, level + 1, branch))

    return levels, branches, order
