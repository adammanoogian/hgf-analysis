"""Patch pyhgf 0.2.x typing.py to remove the removed jaxlib.xla_extension import.

Run after `pip install --no-deps pyhgf==0.2.8` to fix the PjitFunction
import that was removed in JAX 0.5.x.

Usage::

    python scripts/ci/patch_pyhgf_typing.py

Exits 0 on success, 1 on failure.

See .planning/phases/27-dependency-upgrade-chain/DEPS-02-decision.md for
the full strategy rationale (Strategy C).
"""

from __future__ import annotations

import importlib.util
import sys
from pathlib import Path

OLD_IMPORT = "from jaxlib.xla_extension import PjitFunction"
NEW_IMPORT = (
    "from typing import Callable as PjitFunction"
    "  # noqa: PjitFunction removed in JAX 0.5.x"
)


def main() -> int:
    """Patch pyhgf/typing.py in-place.

    Parameters
    ----------
    None

    Returns
    -------
    int
        0 if patch applied (or already applied), 1 on error.
    """
    spec = importlib.util.find_spec("pyhgf")
    if spec is None or spec.origin is None:
        print("ERROR: pyhgf not found in current environment", file=sys.stderr)
        return 1

    typing_path = Path(spec.origin).parent / "typing.py"
    if not typing_path.exists():
        print(f"ERROR: {typing_path} does not exist", file=sys.stderr)
        return 1

    text = typing_path.read_text(encoding="utf-8")

    if OLD_IMPORT not in text:
        if "PjitFunction removed in JAX 0.5.x" in text:
            print(f"Patch already applied: {typing_path}")
            return 0
        print(
            f"WARNING: '{OLD_IMPORT}' not found in {typing_path}. "
            "File may have already been patched or differs from expected.",
            file=sys.stderr,
        )
        return 0

    patched = text.replace(OLD_IMPORT, NEW_IMPORT, 1)
    typing_path.write_text(patched, encoding="utf-8")
    print(f"Patch applied successfully: {typing_path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
