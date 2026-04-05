"""Three-level binary HGF model for the PRL pick_best_cue pipeline.

Extends the 2-level model by adding a shared continuous-state volatility
parent (node 6) that receives volatility coupling from all three level-1
belief nodes (nodes 1, 3, 5).  This implements the literature-default
architecture for adaptive learning-rate estimation under shared volatility.

Node layout
-----------
::

    Node 0: binary-state   — cue 0 input
    Node 1: continuous-state — cue 0 level-1 belief (value parent of node 0)
    Node 2: binary-state   — cue 1 input
    Node 3: continuous-state — cue 1 level-1 belief (value parent of node 2)
    Node 4: binary-state   — cue 2 input
    Node 5: continuous-state — cue 2 level-1 belief (value parent of node 4)
    Node 6: continuous-state — shared volatility parent
                               (volatility parent of nodes 1, 3, 5)

Input nodes (for ``net.input_idxs``): (0, 2, 4)
Belief nodes (continuous-state, source of ``mu1``): (1, 3, 5)
Volatility node (source of ``mu2``): 6

Parameter mapping
-----------------
+---------------+-------------------+-----------------+
| Project name  | pyhgf attribute   | Node(s)         |
+===============+===================+=================+
| omega_2       | tonic_volatility  | 1, 3, 5         |
+---------------+-------------------+-----------------+
| omega_3       | tonic_volatility  | 6               |
+---------------+-------------------+-----------------+
| kappa         | coupling strength | edge 6→(1, 3, 5)|
+---------------+-------------------+-----------------+

Notes
-----
The shared volatility parent's ``observed`` flag is always 1 (default); it is
not gated by partial feedback.  Level-1 → level-2 volatility prediction errors
flow regardless of which cue was observed on a given trial.  This is the
correct scientific behaviour: the agent always updates its volatility estimate
based on "time passing" even for unchosen cues.

The ω₃ recovery caveat applies: ω₃ is known to be poorly recovered in the
literature.  Primary hypotheses focus on ω₂ and κ.
"""

from __future__ import annotations

import numpy as np
from pyhgf.model import Network

from prl_hgf.models.hgf_2level import (
    BELIEF_NODES,
    INPUT_NODES,
    N_CUES,
    extract_beliefs,
)

# ---------------------------------------------------------------------------
# Module-level constants (exported for downstream use)
# ---------------------------------------------------------------------------

#: Node index for the shared level-2 volatility parent node.
VOLATILITY_NODE: int = 6

# Re-export shared constants so callers can import everything from one place.
__all__ = [
    "build_3level_network",
    "extract_beliefs_3level",
    "VOLATILITY_NODE",
    "INPUT_NODES",
    "BELIEF_NODES",
    "N_CUES",
]


# ---------------------------------------------------------------------------
# Factory function
# ---------------------------------------------------------------------------


def build_3level_network(
    omega_2: float = -4.0,
    omega_3: float = -4.0,
    kappa: float = 1.0,
) -> Network:
    """Build a 3-branch 3-level binary HGF network with shared volatility parent.

    Constructs the same three binary-HGF branches as
    :func:`~prl_hgf.models.hgf_2level.build_2level_network`, then adds a
    single shared continuous-state volatility parent (node 6) connected to all
    three level-1 nodes via volatility coupling of strength ``kappa``.

    Parameters
    ----------
    omega_2 : float, optional
        Tonic volatility for level-1 continuous-state nodes (1, 3, 5).
        Default ``-4.0``.
    omega_3 : float, optional
        Tonic meta-volatility for the shared level-2 node (6).
        Default ``-4.0``.
    kappa : float, optional
        Volatility coupling strength between node 6 and each of nodes 1, 3, 5.
        Default ``1.0``.

    Returns
    -------
    pyhgf.model.Network
        Configured network with 7 nodes and ``input_idxs == (0, 2, 4)``.

    Examples
    --------
    >>> net = build_3level_network()
    >>> len(net.edges)
    7
    >>> net.input_idxs
    (0, 2, 4)
    """
    net = Network()

    # Branch 0: binary input (node 0) + continuous level-1 (node 1)
    net.add_nodes(kind="binary-state")  # node 0
    net.add_nodes(
        kind="continuous-state",
        value_children=0,  # node 1: value parent of node 0
        node_parameters={"tonic_volatility": omega_2},
    )

    # Branch 1: binary input (node 2) + continuous level-1 (node 3)
    net.add_nodes(kind="binary-state")  # node 2
    net.add_nodes(
        kind="continuous-state",
        value_children=2,  # node 3: value parent of node 2
        node_parameters={"tonic_volatility": omega_2},
    )

    # Branch 2: binary input (node 4) + continuous level-1 (node 5)
    net.add_nodes(kind="binary-state")  # node 4
    net.add_nodes(
        kind="continuous-state",
        value_children=4,  # node 5: value parent of node 4
        node_parameters={"tonic_volatility": omega_2},
    )

    # Shared volatility parent (node 6): volatility children = nodes 1, 3, 5
    # kappa is the coupling strength passed as a list of equal strengths.
    net.add_nodes(
        kind="continuous-state",
        volatility_children=([1, 3, 5], [kappa, kappa, kappa]),
        node_parameters={"tonic_volatility": omega_3},
    )  # node 6

    # Explicitly set input node indices (avoids auto-detection ambiguity)
    net.input_idxs = INPUT_NODES

    return net


# ---------------------------------------------------------------------------
# Belief extraction helper (3-level extension)
# ---------------------------------------------------------------------------


def extract_beliefs_3level(net: Network) -> dict[str, np.ndarray]:
    """Extract belief trajectories from a 3-level forward-pass network.

    Extends :func:`~prl_hgf.models.hgf_2level.extract_beliefs` with the
    shared volatility node trajectories.

    Must be called after :meth:`~pyhgf.model.Network.input_data` has been run.

    Parameters
    ----------
    net : pyhgf.model.Network
        3-level network object after calling ``input_data``.

    Returns
    -------
    dict[str, numpy.ndarray]
        Dictionary with all keys from
        :func:`~prl_hgf.models.hgf_2level.extract_beliefs` plus:

        * ``"mu2_volatility"``: posterior mean of the shared volatility node
          (node 6, ``"mean"`` field).
        * ``"sigma2_volatility"``: posterior standard deviation of the shared
          volatility node (``1.0 / precision``).

    Examples
    --------
    >>> import numpy as np
    >>> net = build_3level_network()
    >>> inp = np.zeros((10, 3))
    >>> obs = np.zeros((10, 3), dtype=int)
    >>> obs[:, 0] = 1
    >>> net.input_data(input_data=inp, observed=obs)
    >>> beliefs = extract_beliefs_3level(net)
    >>> "mu2_volatility" in beliefs
    True
    """
    # Start with the 2-level beliefs
    beliefs = extract_beliefs(net)

    trajectories = net.node_trajectories

    # Shared volatility node (node 6)
    beliefs["mu2_volatility"] = np.asarray(trajectories[VOLATILITY_NODE]["mean"])
    beliefs["sigma2_volatility"] = np.asarray(
        1.0 / trajectories[VOLATILITY_NODE]["precision"]
    )

    return beliefs
