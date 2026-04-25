"""Plan 23-03 task 2 verify: end-to-end smoke + invariants."""

from __future__ import annotations

# 1) Public API: all five exports importable.
from prl_hgf.viz import (
    NetworkSpec,
    NodeSpec,
    build_network_spec,
    inspect_network,
    render_viewer_html,
)

print("all five exports OK:", render_viewer_html.__name__)

# 2) _DEFAULT_TEMPLATE_PATH existence (BLOCKER fix).
from prl_hgf.viz.export import _DEFAULT_TEMPLATE_PATH

assert _DEFAULT_TEMPLATE_PATH.exists(), f"Missing: {_DEFAULT_TEMPLATE_PATH}"
print("template path exists:", _DEFAULT_TEMPLATE_PATH)

# 3) End-to-end smoke (offline_mode=True default).
from prl_hgf.models.hgf_3level_patrl import build_3level_network_patrl

net = build_3level_network_patrl()
spec = build_network_spec(net)
html = render_viewer_html(spec)
assert isinstance(html, str), f"expected str, got {type(html)}"
assert len(html) > 1000, f"expected >1000 chars, got {len(html)}"
assert (
    '<script type="application/json" id="viz-network-spec">' in html
), "viz-network-spec marker missing"
assert (
    '<script type="application/json" id="viz-posterior-summary">' in html
), "viz-posterior-summary marker missing"
assert "cdnjs.cloudflare.com" in html, "offline_mode=True should keep CDN <script src> tags"
assert "react/18.2.0" in html, "React 18.2.0 pin missing"
assert "babel-standalone/7.23.2" in html, "Babel 7.23.2 pin missing"

# Verify NETWORK_SPEC marker contains valid JSON deserializable to spec
import json
import re

m = re.search(
    r'<script type="application/json" id="viz-network-spec">\s*(.*?)\s*</script>',
    html,
    re.DOTALL,
)
assert m is not None, "regex failed to match viz-network-spec"
parsed = json.loads(m.group(1))
assert parsed["n_nodes"] == 3, f"n_nodes mismatch: {parsed['n_nodes']}"
assert parsed["input_idxs"] == [0], f"input_idxs mismatch: {parsed['input_idxs']}"
print(f"offline_mode smoke: {len(html)} chars; n_nodes={parsed['n_nodes']}; input_idxs={parsed['input_idxs']}")

# 4) ALL Phase 22 symbols still importable + correct types.
assert NetworkSpec is not None
assert NodeSpec is not None
assert callable(build_network_spec)
assert callable(inspect_network)
assert callable(render_viewer_html)
print("Phase 22 + Phase 23 surface intact")
