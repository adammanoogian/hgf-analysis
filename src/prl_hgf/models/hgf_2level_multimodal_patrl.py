"""2-level binary-state HGF with two observation channels for the PAT-RL task.

Extends the scalar 2-level model by coupling **two** binary-state input nodes
to a single shared continuous-state belief parent.  Both observations (u₁, u₂)
are value-children of the same μ₂ node, so each trial's pair of binary signals
drives a joint precision-weighted belief update.

Node layout
-----------
::

    Node 0: binary-state   — primary observation u₁  (e.g. state signal)
    Node 1: binary-state   — secondary observation u₂ (e.g. physiological binary)
    Node 2: continuous-state — shared value parent (posterior belief μ₂ in log-odds)

Input nodes (for ``net.input_idxs``): (0, 1)
Belief node (continuous-state, source of ``mu2``): 2

Parameter mapping
-----------------
+---------------+-------------------+----------+
| Project name  | pyhgf attribute   | Node(s)  |
+===============+===================+==========+
| omega_2       | tonic_volatility  | 2        |
+---------------+-------------------+----------+

Notes
-----
* This model is a **multimodal** extension: two distinct observation streams
  feed the same latent belief.  In the PAT-RL context, u₁ might be the
  safe/dangerous state signal and u₂ a binary physiological marker (e.g.
  bradycardia above threshold).  Both update μ₂ each trial.
* ``input_data`` must receive an array of shape ``(n_trials, 2)`` — column 0
  for u₁ and column 1 for u₂.
* The response model is unchanged: choices are generated from
  ``EV = (1 − σ(μ₂)) · Vᵣ  −  σ(μ₂) · Vₛ``, exactly as in the scalar 2-level
  and 3-level variants.
* Do **not** modify this file to add pick_best_cue concerns.  The PAT-RL and
  pick_best_cue pipelines are parallel stacks sharing no imports below the
  ``pyhgf`` library level.
"""

from __future__ import annotations

import numpy as np
from pyhgf.model import Network

# ---------------------------------------------------------------------------
# Module-level constants (exported for downstream use)
# ---------------------------------------------------------------------------

#: Node index for the primary binary-state input (u₁).
INPUT_NODE_1: int = 0

#: Node index for the secondary binary-state input (u₂).
INPUT_NODE_2: int = 1

#: Node index for the shared continuous-state belief parent (μ₂).
BELIEF_NODE: int = 2


# ---------------------------------------------------------------------------
# Factory function
# ---------------------------------------------------------------------------


def build_2level_multimodal_network_patrl(omega_2: float = -4.0) -> Network:
    """Build a 2-level multimodal binary HGF with two observation channels.

    Creates two binary-state input nodes (nodes 0 and 1) both coupled as
    value-children to a single continuous-state belief parent (node 2).
    The topology is the simplest multimodal extension of the scalar 2-level
    HGF: shared μ₂ receives joint updates from two binary streams.

    Parameters
    ----------
    omega_2 : float, optional
        Tonic volatility of the shared continuous belief parent.
        Default ``-4.0``.

    Returns
    -------
    pyhgf.model.Network
        Network with ``input_idxs = (0, 1)`` and one belief node (idx 2).
        ``input_data`` expects shape ``(n_trials, 2)``.

    Examples
    --------
    >>> net = build_2level_multimodal_network_patrl()
    >>> net.input_idxs
    (0, 1)
    >>> len(net.edges)
    3
    """
    net = Network()
    net.add_nodes(kind="binary-state")   # node 0: primary observation u₁
    net.add_nodes(kind="binary-state")   # node 1: secondary observation u₂
    net.add_nodes(
        kind="continuous-state",
        value_children=[INPUT_NODE_1, INPUT_NODE_2],  # μ₂ parents both binary nodes
        node_parameters={"tonic_volatility": omega_2, "mean": 0.0, "precision": 1.0},
    )  # node 2: shared belief parent
    # Explicitly set input node indices (avoids auto-detection ambiguity)
    net.input_idxs = (INPUT_NODE_1, INPUT_NODE_2)
    return net


# ---------------------------------------------------------------------------
# Belief extraction helper
# ---------------------------------------------------------------------------


def extract_beliefs_multimodal_patrl(net: Network) -> dict[str, np.ndarray]:
    """Extract per-trial belief trajectories from a fitted multimodal network.

    Must be called after :meth:`~pyhgf.model.Network.input_data` has been
    run so that ``net.node_trajectories`` is populated.

    Parameters
    ----------
    net : pyhgf.model.Network
        Multimodal network object after calling ``input_data``.

    Returns
    -------
    dict[str, numpy.ndarray]
        Dictionary with keys:

        * ``"mu2"``: continuous belief posterior mean (log-odds), shape
          ``(n_trials,)``.
        * ``"sigma2"``: posterior variance ``1 / precision``, shape
          ``(n_trials,)``.
        * ``"p_state"``: sigmoid of ``mu2``; probability of state=1
          (dangerous), shape ``(n_trials,)``.
        * ``"expected_precision"``: from ``temp["effective_precision"]`` of
          node 2, shape ``(n_trials,)``.  Falls back to zeros if absent.

    Examples
    --------
    >>> import numpy as np
    >>> net = build_2level_multimodal_network_patrl()
    >>> u = np.zeros((10, 2))
    >>> net.input_data(input_data=u, time_steps=np.ones(10))
    >>> beliefs = extract_beliefs_multimodal_patrl(net)
    >>> set(beliefs.keys()) >= {"mu2", "sigma2", "p_state", "expected_precision"}
    True
    """
    traj = net.node_trajectories[BELIEF_NODE]
    mu2 = np.asarray(traj["mean"])
    sigma2 = 1.0 / np.asarray(traj["precision"])
    p_state = 1.0 / (1.0 + np.exp(-mu2))
    temp = traj.get("temp", {})
    exp_prec = np.asarray(temp.get("effective_precision", np.zeros_like(mu2)))
    return {
        "mu2": mu2,
        "sigma2": sigma2,
        "p_state": p_state,
        "expected_precision": exp_prec,
    }


__all__ = [
    "INPUT_NODE_1",
    "INPUT_NODE_2",
    "BELIEF_NODE",
    "build_2level_multimodal_network_patrl",
    "extract_beliefs_multimodal_patrl",
]
