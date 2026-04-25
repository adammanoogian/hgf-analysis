"""HGF viewer module -- pyhgf Network inspection + NetworkSpec schema + HTML export.

Phase 22 public API: ``inspect_network``, ``build_network_spec``,
``NetworkSpec``, ``NodeSpec``.

Phase 23 addition: ``render_viewer_html``.
"""

from __future__ import annotations

from prl_hgf.viz.export import render_viewer_html
from prl_hgf.viz.inspector import inspect_network
from prl_hgf.viz.schema import NetworkSpec, NodeSpec, build_network_spec

__all__ = [
    "NetworkSpec",
    "NodeSpec",
    "build_network_spec",
    "inspect_network",
    "render_viewer_html",
]
