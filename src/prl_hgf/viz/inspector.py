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
