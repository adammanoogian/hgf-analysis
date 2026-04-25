"""Plan 23-03 task 1 verify: EXPORT-04 ValueError exact message."""

from __future__ import annotations

from prl_hgf.viz.export import _inject_markers

try:
    _inject_markers("<html/>", {"network-spec": "{}"})
except ValueError as e:
    msg = str(e)
    expected = "injection marker 'viz-network-spec' not found in template"
    assert msg == expected, f"mismatch: got={msg!r} expected={expected!r}"
    print("EXPORT-04 message format verified")
else:
    raise AssertionError("expected ValueError; none raised")
