"""Plan 23-03 task 2 verify: offline_mode=False (CDN inline path) E2E."""

from __future__ import annotations

from prl_hgf.models.hgf_3level_patrl import build_3level_network_patrl
from prl_hgf.viz import build_network_spec, render_viewer_html

net = build_3level_network_patrl()
spec = build_network_spec(net)
html = render_viewer_html(spec, offline_mode=False)
size = len(html)
assert size > 2_500_000, f"inlined should be ~2.9 MiB, got {size}"
assert "cdnjs.cloudflare.com" not in html, "offline_mode=False must drop CDN <script src> tags"
print(f"offline_mode=False inlined: {size} chars (~{size/1024/1024:.2f} MiB)")
