"""HGF viewer module -- pyhgf Network inspection + NetworkSpec schema.

Phase 22 partial public API: inspect_network only.
build_network_spec / NetworkSpec / NodeSpec land in plan 22-03.
render_viewer_html lands in Phase 23.
"""

from __future__ import annotations

from prl_hgf.viz.inspector import inspect_network

__all__ = ["inspect_network"]
