"""Typed NetworkSpec schema for the HGF viewer.

Frozen dataclasses, no version field, no extra dict (CONTEXT Decision 4).
Populated by :func:`build_network_spec` which composes
:func:`prl_hgf.viz.inspector.inspect_network` output with adjacency-based
role inference (:func:`prl_hgf.viz.roles.infer_role`) and optional ArviZ
posterior summaries.

The optional ArviZ branch supports both participant coord names used
across the fitting stack (Decision 131): ``"participant_id"`` on Laplace
and PAT-RL NUTS, ``"participant"`` on pick_best_cue NUTS.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Any

from prl_hgf.viz.inspector import (
    _NODE_TYPE_INT_TO_STR,
    _VERIFIED_AGAINST_PYHGF_VERSION,
    inspect_network,
)
from prl_hgf.viz.roles import infer_role

_VALID_ROLES: frozenset[str] = frozenset({"input", "value", "volatility"})


@dataclass(frozen=True)
class NodeSpec:
    """One node of an HGF network, ready for rendering.

    Parameters
    ----------
    idx
        pyhgf node index.
    kind
        Human-readable pyhgf node kind (from
        ``inspector._NODE_TYPE_INT_TO_STR``): one of ``"constant-state"``,
        ``"binary-state"``, ``"continuous-state"``, ``"ef-state"``,
        ``"dp-state"``, ``"categorical-state"``, ``"volatile-state"``.
    level
        BFS first-discovery depth from input layer. 1 = input, 2 = direct
        parent of input, etc.
    role
        Adjacency-derived role: ``"input"`` | ``"value"`` | ``"volatility"``.
    branch_idx
        Enumerate position of the input node this belongs to. ``None``
        when the node is shared across multiple branches.
    value_parents, volatility_parents, value_children, volatility_children
        Edge adjacency -- empty tuple when absent (never None).
    tonic_volatility, mean, precision
        Selected scalar attributes from ``network.attributes[idx]``.
        ``None`` when not present.
    posterior_mean, posterior_hdi, r_hat
        Optional -- populated only when :func:`build_network_spec` received
        a non-None idata. ``r_hat`` is always ``None`` when the idata was
        produced via VB-Laplace (per SCHEMA-04).
    """

    idx: int
    kind: str
    level: int
    role: str
    branch_idx: int | None
    value_parents: tuple[int, ...] = ()
    volatility_parents: tuple[int, ...] = ()
    value_children: tuple[int, ...] = ()
    volatility_children: tuple[int, ...] = ()
    tonic_volatility: float | None = None
    mean: float | None = None
    precision: float | None = None
    posterior_mean: tuple[tuple[str, float], ...] | None = None
    posterior_hdi: tuple[tuple[str, float, float], ...] | None = None
    r_hat: tuple[tuple[str, float], ...] | None = None

    def __post_init__(self) -> None:
        """Validate kind and role against the known enum sets."""
        if self.kind not in _NODE_TYPE_INT_TO_STR.values():
            raise ValueError(
                f"Invalid NodeSpec kind {self.kind!r} at idx {self.idx}. "
                f"Must be one of {sorted(_NODE_TYPE_INT_TO_STR.values())}"
            )
        if self.role not in _VALID_ROLES:
            raise ValueError(
                f"Invalid NodeSpec role {self.role!r} at idx {self.idx}. "
                f"Must be one of {sorted(_VALID_ROLES)}"
            )


@dataclass(frozen=True)
class NetworkSpec:
    """Complete topology + optional posterior summary for one HGF network.

    Parameters
    ----------
    n_nodes
        Total node count (``network.n_nodes``).
    input_idxs
        Tuple of input node indices.
    nodes
        NodeSpec tuple in BFS discovery order.
    coord_name
        Participant coord dim detected in the idata (``"participant"`` or
        ``"participant_id"``), or ``None`` if no idata was provided.
    source_pyhgf_version
        pyhgf version string the inspector was REPL-verified against
        (pulled from ``inspector._VERIFIED_AGAINST_PYHGF_VERSION``).
    is_laplace
        True if the idata's ``sample_stats`` contained a ``"laplace"``
        marker. False for NUTS idata or when no idata was provided.
    """

    n_nodes: int
    input_idxs: tuple[int, ...]
    nodes: tuple[NodeSpec, ...]
    coord_name: str | None = None
    source_pyhgf_version: str = _VERIFIED_AGAINST_PYHGF_VERSION
    is_laplace: bool = False

    def __post_init__(self) -> None:
        """Validate node count bounds and idx uniqueness."""
        if len(self.nodes) > self.n_nodes:
            raise ValueError(
                f"NodeSpec count {len(self.nodes)} exceeds n_nodes "
                f"{self.n_nodes}. Expected: len(nodes) <= n_nodes"
            )
        emitted_idxs = [n.idx for n in self.nodes]
        if len(emitted_idxs) != len(set(emitted_idxs)):
            raise ValueError(f"Duplicate node idx in NetworkSpec.nodes: {emitted_idxs}")


def _get_participant_dim(idata: Any) -> str | None:
    """Probe xarray ``.dims`` for either participant coord name.

    Decision 131 (dual coord-name): Laplace idata uses
    ``participant_id``; NUTS default is ``participant``; PAT-RL NUTS
    overrides to ``participant_id``. The inspector must not assume a
    task -> coord_name mapping -- probe each idata.

    Parameters
    ----------
    idata
        An ArviZ ``InferenceData`` or ``None``.

    Returns
    -------
    str | None
        ``"participant_id"`` or ``"participant"`` if present in
        ``set(idata.posterior.dims)``; ``None`` when ``idata`` is ``None``
        or neither coord is present.

    Notes
    -----
    Uses ``set(idata.posterior.dims)`` -- NOT ``data_vars`` -- because the
    participant dimension is a coordinate dimension, not a data variable
    (RESEARCH Pattern 5 corrects the stale REQUIREMENTS SCHEMA-03 wording).
    """
    if idata is None:
        return None
    post_dims = set(idata.posterior.dims)
    if "participant_id" in post_dims:
        return "participant_id"
    if "participant" in post_dims:
        return "participant"
    return None


def _is_laplace(idata: Any) -> bool:
    """Detect VB-Laplace-provenance idata via ``sample_stats.laplace``.

    Parameters
    ----------
    idata
        An ArviZ ``InferenceData`` or ``None``.

    Returns
    -------
    bool
        ``True`` iff ``idata`` has a ``sample_stats`` group and
        ``"laplace"`` appears in ``idata.sample_stats.data_vars``.

    Notes
    -----
    Uses membership check on ``sample_stats.data_vars`` -- NOT
    ``idata.sample_stats.laplace == True`` which triggers xarray
    element-wise comparison and returns a DataArray, not a scalar bool
    (RESEARCH Pattern 6 corrects the stale REQUIREMENTS SCHEMA-04 wording).
    """
    if idata is None:
        return False
    if not hasattr(idata, "sample_stats"):
        return False
    return "laplace" in idata.sample_stats.data_vars


def build_network_spec(
    network: Any,
    idata: Any | None = None,
    coord_name: str | None = None,
) -> NetworkSpec:
    """Compose inspector output with role inference into a typed NetworkSpec.

    Parameters
    ----------
    network
        A ``pyhgf.model.Network`` instance. Passed to
        :func:`prl_hgf.viz.inspector.inspect_network`, whose returned
        dict is mapped into per-node :class:`NodeSpec` instances.
    idata
        Optional ArviZ ``InferenceData``. When provided:

        - ``coord_name`` is probed dynamically via
          :func:`_get_participant_dim` unless explicitly supplied.
        - ``is_laplace`` is probed via :func:`_is_laplace`.
        - Per-node ``posterior_mean`` / ``posterior_hdi`` are populated
          as empty tuples (presence signal only -- full per-parameter
          extraction lands in Phase 24 POST-01).
        - Per-node ``r_hat`` is suppressed to ``None`` when the idata is
          VB-Laplace-provenance (SCHEMA-04).

        When ``None`` (pre-fit rendering), all three posterior fields
        remain ``None`` on every node.
    coord_name
        Optional explicit participant coord name override. When ``None``,
        probed dynamically via :func:`_get_participant_dim(idata)`.

    Returns
    -------
    NetworkSpec
        Frozen dataclass ready for serialisation via
        ``dataclasses.asdict`` + ``json.dumps``.

    Notes
    -----
    Phase 22 scaffold scope -- per-parameter posterior_mean / posterior_hdi
    values are NOT computed here; only the PRESENCE signal (empty tuple
    when idata given; ``None`` when idata absent; ``r_hat`` additionally
    ``None`` when Laplace). Phase 24 POST-01 extends this to ``az.summary``
    per parameter.
    """
    raw = inspect_network(network)
    detected_coord = (
        coord_name if coord_name is not None else _get_participant_dim(idata)
    )
    laplace = _is_laplace(idata)

    nodes: list[NodeSpec] = []
    for row in raw["nodes"]:
        role = infer_role(row["idx"], network.edges, network.input_idxs)

        # Phase 22 scaffold: emit presence signal only.
        # Phase 24 POST-01 replaces empty tuples with az.summary output.
        posterior_mean: tuple[tuple[str, float], ...] | None = (
            None if idata is None else ()
        )
        posterior_hdi: tuple[tuple[str, float, float], ...] | None = (
            None if idata is None else ()
        )
        r_hat: tuple[tuple[str, float], ...] | None = (
            None if (idata is None or laplace) else ()
        )

        nodes.append(
            NodeSpec(
                idx=row["idx"],
                kind=row["kind"],
                level=row["level"],
                role=role,
                branch_idx=row["branch_idx"],
                value_parents=row["value_parents"],
                volatility_parents=row["volatility_parents"],
                value_children=row["value_children"],
                volatility_children=row["volatility_children"],
                tonic_volatility=row["tonic_volatility"],
                mean=row["mean"],
                precision=row["precision"],
                posterior_mean=posterior_mean,
                posterior_hdi=posterior_hdi,
                r_hat=r_hat,
            )
        )

    return NetworkSpec(
        n_nodes=raw["n_nodes"],
        input_idxs=raw["input_idxs"],
        nodes=tuple(nodes),
        coord_name=detected_coord,
        is_laplace=laplace,
    )
