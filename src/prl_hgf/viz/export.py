"""HGF viewer HTML export.

Phase 23 public API: ``render_viewer_html`` -- a single function that
turns a :class:`prl_hgf.viz.schema.NetworkSpec` into a self-contained
browser-openable HTML string.

Architecture (three mechanics, each load-bearing):

1. **String-surgery JSON injection** (Strategy B from research §2):
   the template ``figures/hgf_viewer.html`` ships with valid default
   JSON payloads baked into ``<script type="application/json"
   id="viz-X">`` marker tags. ``_inject_markers`` regex-replaces the
   content between the marker open/close tags -- preserving the
   "browser-openable without Python" property of the raw template.

2. **Jinja2 CDN block** (research §3 + §10.10): the template's three
   CDN ``<script src=...>`` tags are wrapped in ``{% if react_inlined
   %}...{% else %}...{% endif %}``. In ``offline_mode=False``, the
   CDN assets are fetched via ``urllib.request`` and inlined.

3. **MDN-canonical JSON-in-HTML escape** (research §4, finding #1): the
   ``_json_for_html`` helper pairs ``json.dumps(ensure_ascii=True)``
   with ``.replace("</", "<\\/")`` -- both defenses are required
   because ``ensure_ascii=True`` alone does NOT escape the
   ``</script>`` tag-close sequence (empirically verified in ds_env,
   2026-04-24).

Parallel-stack invariant: this module imports from stdlib,
``jinja2``, ``prl_hgf.viz.schema``, and top-level ``config`` (for
``PROJECT_ROOT`` -- CLAUDE.md mandate). No imports from
``prl_hgf.{env, models, fitting, analysis, gui, power, simulation}``.
"""

from __future__ import annotations

import json
import re
import ssl
import urllib.request
from typing import Any

from jinja2 import (  # noqa: F401  (consumed by task 2 _inline_cdn_assets)
    BaseLoader,
    Environment,
)

from prl_hgf.viz.schema import (
    NetworkSpec,  # noqa: F401  (consumed by task 2 render_viewer_html type hint)
)

# NOTE: __all__ is finalized in task 2 (renders public API surface;
# render_viewer_html is added then). Task 1 lands only the four
# private helpers below: _json_for_html, _MARKER_RE, _inject_markers,
# _CDN_SOURCES, _fetch_cdn_asset.


def _json_for_html(obj: Any) -> str:
    """Serialize ``obj`` as JSON safe to embed inside ``<script type="application/json">``.

    Two defenses combined (research §4, finding #1):

    - ``ensure_ascii=True`` escapes control chars, U+2028/U+2029, and
      non-ASCII codepoints.
    - ``.replace("</", "<\\/")`` escapes the HTML tag-close sequence.
      This is REQUIRED because ``ensure_ascii=True`` does NOT escape
      ``</`` on its own (the slash is ASCII). Omitting this defense
      lets a user-authored string like ``"<script>alert(1)</script>"``
      break out of the ``<script>`` container and trigger XSS.

    Inside a JSON string literal, ``<\\/script>`` is a valid-JSON
    escape that deserializes back to ``</script>`` via ``JSON.parse``.

    Parameters
    ----------
    obj
        Any JSON-serializable Python object (typically a dict produced
        by ``dataclasses.asdict(network_spec)``).

    Returns
    -------
    str
        ASCII-only JSON string with ``</`` sequences neutralized to
        ``<\\/``. Safe for embedding inside ``<script
        type="application/json">`` tags.
    """
    return json.dumps(obj, ensure_ascii=True).replace("</", "<\\/")


_MARKER_RE = re.compile(
    r'(<script type="application/json" id="viz-([a-z\-]+)">)(.*?)(</script>)',
    re.DOTALL,
)


def _inject_markers(template: str, payload: dict[str, str]) -> str:
    """Replace content between ``<script type="application/json" id="viz-X">`` markers.

    Parameters
    ----------
    template
        The raw template string (loaded from ``figures/hgf_viewer.html``).
    payload
        Mapping of short marker name (e.g. ``"network-spec"``, NOT
        ``"viz-network-spec"``) to the already-serialized JSON string
        via :func:`_json_for_html`.

    Returns
    -------
    str
        The template with every matching marker's content replaced.
        Unmatched markers in the template remain with their default body
        (the valid JSON blob baked in at plan 23-02).

    Raises
    ------
    ValueError
        If any key in ``payload`` does not correspond to a marker in the
        template. Message format: ``"injection marker 'viz-{name}' not
        found in template"`` where ``{name}`` is the first missing name
        in sorted order (deterministic).
    """
    replaced_names: set[str] = set()

    def _replace(m: re.Match[str]) -> str:
        name = m.group(2)
        if name in payload:
            replaced_names.add(name)
            return f"{m.group(1)}\n{payload[name]}\n{m.group(4)}"
        return m.group(0)

    out = _MARKER_RE.sub(_replace, template)
    missing = set(payload) - replaced_names
    if missing:
        first_missing = sorted(missing)[0]
        raise ValueError(
            f"injection marker 'viz-{first_missing}' not found in template"
        )
    return out


_CDN_SOURCES: dict[str, str] = {
    "react": "https://cdnjs.cloudflare.com/ajax/libs/react/18.2.0/umd/react.production.min.js",
    "react_dom": "https://cdnjs.cloudflare.com/ajax/libs/react-dom/18.2.0/umd/react-dom.production.min.js",
    "babel": "https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/7.23.2/babel.min.js",
}


def _fetch_cdn_asset(url: str, timeout: float = 30.0) -> str:
    """Fetch a CDN JS asset as a UTF-8 string.

    Uses ``ssl.create_default_context()`` -- Windows-safe per research §3
    (certifi-bundled via conda-forge ds_env). Do NOT use
    ``ssl.CERT_NONE`` -- the correct fix for any Windows cert issue is
    ``conda update certifi`` or setting ``SSL_CERT_FILE``.

    Parameters
    ----------
    url
        Fully-qualified HTTPS URL (only cdnjs.cloudflare.com and
        unpkg.com are expected; both peer at <100 ms from ds_env).
    timeout
        Connection + read timeout in seconds. Default 30 s is generous;
        Babel at 2.8 MiB may take 1-2 s on average.

    Returns
    -------
    str
        UTF-8 decoded body.
    """
    ctx = ssl.create_default_context()
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, context=ctx, timeout=timeout) as resp:  # noqa: S310
        raw: bytes = resp.read()
    return raw.decode("utf-8")


