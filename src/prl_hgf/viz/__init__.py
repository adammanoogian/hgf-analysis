"""HGF viewer module -- pyhgf Network inspection + NetworkSpec schema.

Phase 22 public API: ``inspect_network``, ``build_network_spec``,
``NetworkSpec``, ``NodeSpec``.

``render_viewer_html`` lands in Phase 23 (export + template promotion).
"""

from __future__ import annotations

from prl_hgf.viz.inspector import inspect_network
from prl_hgf.viz.schema import NetworkSpec, NodeSpec, build_network_spec

__all__ = [
    "NetworkSpec",
    "NodeSpec",
    "build_network_spec",
    "inspect_network",
]
