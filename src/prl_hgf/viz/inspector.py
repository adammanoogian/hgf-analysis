"""pyhgf Network -> plain dict extractor for the HGF viewer.

pyhgf API verification -- 2026-04-24 against pyhgf 0.2.8
(run locally in ds_env)

Verified attribute paths:
  network.attributes[idx] -> dict[str, Any]
  network.edges[idx]      -> AdjacencyLists NamedTuple with fields:
                               node_type: int  (NOT str -- see int->string
                                                mapping below)
                               value_parents: tuple[int, ...] | None
                               volatility_parents: tuple[int, ...] | None
                               value_children: tuple[int, ...] | None
                               volatility_children: tuple[int, ...] | None
                               coupling_fn: tuple[Callable | None, ...]
  network.input_idxs      -> tuple[int, ...]  (plain Python, not JAX)
  network.n_nodes         -> int              (plain Python, not JAX)

node_type int -> string mapping (verified from
pyhgf/model/add_nodes.py assignments, NOT from the stale
pyhgf/typing.py docstring which lists only codes 0-4):

  0 -> "constant-state"
  1 -> "binary-state"
  2 -> "continuous-state"
  3 -> "ef-state"
  4 -> "dp-state"
  5 -> "categorical-state"
  6 -> "volatile-state"

Fixture node counts observed in this REPL session:
  build_3level_network_patrl()        -> n_nodes=3, input_idxs=(0,)
  build_2level_network_patrl()        -> n_nodes=2, input_idxs=(0,)
  build_3level_network()              -> n_nodes=7, input_idxs=(0, 2, 4)
                                         (node 6 is shared volatility parent,
                                          must be deduplicated in BFS)

Verified attribute dict keys (all fixture networks, idx=0):
  ['observed', 'mean', 'expected_mean', 'precision', 'expected_precision',
   'value_coupling_parents', 'temp']
"""

from __future__ import annotations

from collections import deque
from typing import Any

_VERIFIED_AGAINST_PYHGF_VERSION: str = "0.2.8"

_NODE_TYPE_INT_TO_STR: dict[int, str] = {
    0: "constant-state",
    1: "binary-state",
    2: "continuous-state",
    3: "ef-state",
    4: "dp-state",
    5: "categorical-state",
    6: "volatile-state",
}


def inspect_network(network: Any) -> dict[str, Any]:
    """Extract topology from a pyhgf Network into a plain dict.

    Parameters
    ----------
    network
        A pyhgf.model.Network instance. Only the following attrs are read:
        ``attributes`` (dict-like indexed by node idx), ``edges``
        (sequence of ``AdjacencyLists`` NamedTuples), ``input_idxs``
        (tuple of int), ``n_nodes`` (int).

    Returns
    -------
    dict
        Keys: ``n_nodes`` (int), ``input_idxs`` (tuple[int, ...]),
        ``nodes`` (tuple[dict, ...] -- one entry per unique node index
        reachable from ``input_idxs`` via value_parents / volatility_parents,
        deduplicated by idx).

    Raises
    ------
    ValueError
        If any visited node has a ``node_type`` integer not in
        ``_NODE_TYPE_INT_TO_STR``. Message names the offending node idx,
        the observed integer code, and the full known-codes set.

    Notes
    -----
    Uses BFS from ``input_idxs`` with a ``set[int]`` visited guard so
    that shared volatility parents (e.g. node 6 in the pick_best_cue
    3-level topology, reachable from branches 0/1/2) are emitted
    exactly once.
    """
    visited: set[int] = set()
    # branch_of tracks the originating branch for each discovered node.
    # None is the "contested / shared" sentinel: a node reached from
    # >1 distinct input branches before emission.
    branch_of: dict[int, int | None] = {}
    # level_of captures first-discovery BFS depth.
    level_of: dict[int, int] = {}
    queue: deque[int] = deque()

    for branch_idx, input_idx in enumerate(network.input_idxs):
        if input_idx in branch_of and branch_of[input_idx] != branch_idx:
            # Two input_idxs collapse to the same node -- mark shared.
            branch_of[input_idx] = None
        else:
            branch_of.setdefault(input_idx, branch_idx)
        level_of.setdefault(input_idx, 1)
        queue.append(input_idx)

    # Pass 1: BFS to finalise branch_of + level_of using edge discovery.
    # We separate dedup/contested detection from emission so that the
    # "shared parent" status of a node is resolved BEFORE it is emitted,
    # regardless of whether the contesting branch arrives before or
    # after the first enqueue.
    discovery_order: list[int] = []
    while queue:
        idx = queue.popleft()
        if idx in visited:
            continue
        visited.add(idx)
        discovery_order.append(idx)

        edge = network.edges[idx]
        if edge.node_type not in _NODE_TYPE_INT_TO_STR:
            raise ValueError(
                f"Unknown pyhgf node_type code {edge.node_type} at node "
                f"index {idx}. Known codes: {sorted(_NODE_TYPE_INT_TO_STR)}"
            )

        current_branch = branch_of.get(idx)
        current_level = level_of[idx]

        parents = tuple(edge.value_parents or ()) + tuple(edge.volatility_parents or ())
        for parent_idx in parents:
            # Update branch_of for the parent given the propagating branch
            # from its (already-resolved) child.
            if parent_idx not in branch_of:
                branch_of[parent_idx] = current_branch
            elif (
                branch_of[parent_idx] is not None
                and branch_of[parent_idx] != current_branch
            ):
                # Contested: parent was reached from a different branch.
                branch_of[parent_idx] = None
            # else: already contested (None) or same branch -- leave as-is.

            # Level = first discovery depth.
            level_of.setdefault(parent_idx, current_level + 1)

            if parent_idx not in visited:
                queue.append(parent_idx)

    # Pass 2: emit rows in BFS discovery order with resolved branch_of.
    node_rows: list[dict[str, Any]] = []
    for idx in discovery_order:
        edge = network.edges[idx]
        kind = _NODE_TYPE_INT_TO_STR[edge.node_type]
        raw_attrs = network.attributes[idx]
        attrs = raw_attrs if isinstance(raw_attrs, dict) else dict(raw_attrs)
        node_rows.append(
            {
                "idx": idx,
                "kind": kind,
                "level": level_of[idx],
                "branch_idx": branch_of.get(idx),
                "value_parents": tuple(edge.value_parents or ()),
                "volatility_parents": tuple(edge.volatility_parents or ()),
                "value_children": tuple(edge.value_children or ()),
                "volatility_children": tuple(edge.volatility_children or ()),
                "tonic_volatility": _as_float_or_none(attrs.get("tonic_volatility")),
                "mean": _as_float_or_none(attrs.get("mean")),
                "precision": _as_float_or_none(attrs.get("precision")),
            }
        )

    return {
        "n_nodes": int(network.n_nodes),
        "input_idxs": tuple(network.input_idxs),
        "nodes": tuple(node_rows),
    }


def _as_float_or_none(value: Any) -> float | None:
    """Coerce a pyhgf attribute value to float, or None if missing/unhashable."""
    if value is None:
        return None
    try:
        return float(value)
    except (TypeError, ValueError):
        return None
