"""Two-level binary HGF model for the PRL pick_best_cue pipeline.

Provides a factory function that constructs a 3-branch 2-level binary HGF
network using the pyhgf ``Network`` API.  Each branch corresponds to one cue;
partial feedback (unchosen cues never update) is handled via the ``observed``
mask passed to :meth:`pyhgf.model.Network.input_data`.

Node layout
-----------
::

    Node 0: binary-state   — cue 0 input
    Node 1: continuous-state — cue 0 level-1 belief (value parent of node 0)
    Node 2: binary-state   — cue 1 input
    Node 3: continuous-state — cue 1 level-1 belief (value parent of node 2)
    Node 4: binary-state   — cue 2 input
    Node 5: continuous-state — cue 2 level-1 belief (value parent of node 4)

Input nodes (for ``net.input_idxs``): (0, 2, 4)
Belief nodes (continuous-state, source of ``mu1``): (1, 3, 5)

Parameter mapping
-----------------
+---------------+-------------------+------------------+
| Project name  | pyhgf attribute   | Node(s)          |
+===============+===================+==================+
| omega_2       | tonic_volatility  | 1, 3, 5          |
+---------------+-------------------+------------------+
"""

from __future__ import annotations

import numpy as np
from pyhgf.model import Network

# ---------------------------------------------------------------------------
# Module-level constants (exported for downstream use)
# ---------------------------------------------------------------------------

#: Number of cues in the PRL task (and therefore branches in the model).
N_CUES: int = 3

#: Tuple of node indices for the binary-state input nodes.
INPUT_NODES: tuple[int, ...] = (0, 2, 4)

#: Tuple of node indices for the continuous-state level-1 belief nodes.
BELIEF_NODES: tuple[int, ...] = (1, 3, 5)


# ---------------------------------------------------------------------------
# Factory function
# ---------------------------------------------------------------------------


def build_2level_network(omega_2: float = -4.0) -> Network:
    """Build a 3-branch 2-level binary HGF network.

    Creates three parallel binary HGF branches (one per cue).  Each branch
    consists of a binary-state input node and a continuous-state level-1
    belief node.  The input nodes are identified via ``net.input_idxs`` so
    that :meth:`~pyhgf.model.Network.input_data` can distribute the
    ``(n_trials, 3)`` input array to the correct nodes.

    Parameters
    ----------
    omega_2 : float, optional
        Tonic volatility parameter (log-scale learning rate) shared across
        all three level-1 continuous-state nodes.  Default ``-4.0``.

    Returns
    -------
    pyhgf.model.Network
        Configured network with 6 nodes and ``input_idxs == (0, 2, 4)``.

    Examples
    --------
    >>> net = build_2level_network()
    >>> len(net.edges)
    6
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

    # Explicitly set input node indices (avoids auto-detection ambiguity)
    net.input_idxs = INPUT_NODES

    return net


# ---------------------------------------------------------------------------
# Input preparation helper
# ---------------------------------------------------------------------------


def prepare_input_data(
    trials: list,
    choices: list[int],
    rewards: list[int],
) -> tuple[np.ndarray, np.ndarray]:
    """Build ``(input_data, observed)`` arrays from trial choices and rewards.

    Implements the partial-feedback protocol: only the chosen cue receives a
    reward signal on each trial.  Unchosen cues have ``observed=0`` so that
    their prediction errors are zeroed out inside pyhgf, leaving their beliefs
    unchanged.

    Parameters
    ----------
    trials : list
        Trial objects from :func:`~prl_hgf.env.simulator.generate_session`.
        Only used to determine ``n_trials`` via ``len(trials)``; the reward
        signal comes from the ``rewards`` argument.
    choices : list[int]
        Chosen cue index (0, 1, or 2) for each trial.  Must have length
        ``len(trials)``.
    rewards : list[int]
        Binary reward outcome (0 or 1) for each trial.  Must have length
        ``len(trials)``.

    Returns
    -------
    input_data : numpy.ndarray
        Float array of shape ``(n_trials, 3)``.  Entry ``[t, k]`` contains
        the reward value for cue ``k`` on trial ``t``; equals ``rewards[t]``
        when ``choices[t] == k``, otherwise ``0.0``.
    observed : numpy.ndarray
        Integer array of shape ``(n_trials, 3)``.  Entry ``[t, k]`` is ``1``
        when ``choices[t] == k`` (cue was chosen and observed), ``0``
        otherwise.

    Examples
    --------
    >>> trials_stub = [None] * 3
    >>> choices = [0, 1, 2]
    >>> rewards = [1, 0, 1]
    >>> inp, obs = prepare_input_data(trials_stub, choices, rewards)
    >>> inp.shape
    (3, 3)
    >>> obs.dtype
    dtype('int64')
    """
    n_trials = len(trials)
    input_data = np.zeros((n_trials, N_CUES), dtype=float)
    observed = np.zeros((n_trials, N_CUES), dtype=int)

    for t in range(n_trials):
        cue = choices[t]
        input_data[t, cue] = float(rewards[t])
        observed[t, cue] = 1

    return input_data, observed


# ---------------------------------------------------------------------------
# Belief extraction helper
# ---------------------------------------------------------------------------


def extract_beliefs(net: Network) -> dict[str, np.ndarray]:
    """Extract named belief trajectories from a forward-pass network.

    Must be called after :meth:`~pyhgf.model.Network.input_data` has been
    run.  Uses the correct pyhgf field keys:

    * ``"mean"`` on continuous-state nodes (1, 3, 5): log-odds posterior
      belief :math:`\\mu_1` for each cue.
    * ``"expected_mean"`` on binary-state nodes (0, 2, 4):
      sigmoid-transformed reward probability :math:`P(\\text{reward} | cue_k)`
      in ``[0, 1]``.

    Parameters
    ----------
    net : pyhgf.model.Network
        Network object after calling ``input_data``.

    Returns
    -------
    dict[str, numpy.ndarray]
        Dictionary with keys:

        * ``"mu1_cue0"``, ``"mu1_cue1"``, ``"mu1_cue2"``: log-odds posterior
          belief for each cue (from continuous nodes 1, 3, 5).
        * ``"p_reward_cue0"``, ``"p_reward_cue1"``, ``"p_reward_cue2"``:
          sigmoid-transformed reward probability for each cue (from binary
          nodes 0, 2, 4).  Values are in ``[0, 1]``.

    Examples
    --------
    >>> import numpy as np
    >>> net = build_2level_network()
    >>> inp = np.zeros((10, 3))
    >>> obs = np.zeros((10, 3), dtype=int)
    >>> obs[:, 0] = 1
    >>> net.input_data(input_data=inp, observed=obs)
    >>> beliefs = extract_beliefs(net)
    >>> set(beliefs.keys()) >= {"mu1_cue0", "p_reward_cue0"}
    True
    """
    trajectories = net.node_trajectories

    return {
        # log-odds posterior from continuous-state nodes
        "mu1_cue0": np.asarray(trajectories[1]["mean"]),
        "mu1_cue1": np.asarray(trajectories[3]["mean"]),
        "mu1_cue2": np.asarray(trajectories[5]["mean"]),
        # sigmoid-transformed probability from binary-state nodes
        "p_reward_cue0": np.asarray(trajectories[0]["expected_mean"]),
        "p_reward_cue1": np.asarray(trajectories[2]["expected_mean"]),
        "p_reward_cue2": np.asarray(trajectories[4]["expected_mean"]),
    }
