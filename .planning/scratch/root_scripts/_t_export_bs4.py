"""Plan 23-03 task 2 verify: bs4 parses without errors + script tags present."""

from __future__ import annotations

from bs4 import BeautifulSoup

from prl_hgf.models.hgf_3level_patrl import build_3level_network_patrl
from prl_hgf.viz import build_network_spec, render_viewer_html

net = build_3level_network_patrl()
spec = build_network_spec(net)
html = render_viewer_html(spec)

soup = BeautifulSoup(html, "html.parser")
assert soup.find("html") is not None, "no <html> tag"
ns = soup.find("script", {"id": "viz-network-spec"})
ps = soup.find("script", {"id": "viz-posterior-summary"})
assert ns is not None, "viz-network-spec missing"
assert ps is not None, "viz-posterior-summary missing"
print("bs4 parse: OK")
print(f"viz-network-spec content length: {len(ns.text.strip())}")
print(f"viz-posterior-summary content length: {len(ps.text.strip())}")
