"""Plan 23-03 task 1 verify: finding #1 defense empirically present."""

from __future__ import annotations

from prl_hgf.viz.export import _json_for_html

out = _json_for_html({"k": "</script><script>alert(1)</script>"})
assert "</script>" not in out, f"finding #1 defense missing: {out}"
assert "<\\/script>" in out, f"finding #1 escape not applied: {out}"
print("finding #1 defense verified")
print("out =", out)
