"""Compute HLO text-IR hashes for Phase 21 cache-forensics diff matrix.

Parameters
----------
None (paths hardcoded relative to the phase directory).

Methodology
-----------
Each `hlo_dumps/<run>/` directory contains ~100 modules compiled during a cluster
probe run (21-03 Laplace, 21-04 NUTS, 21-05 P-sweep). XLA writes the canonical
text-IR of each module to `module_XXXX.<tag>.before_optimizations.txt`. The
question we need to answer for 21-07 VERDICT synthesis is: "does the cache key
(which XLA derives from the text IR) stay stable across (a) cold-vs-warm within
a process, (b) cold-vs-next-proc across processes, (c) same-P different-sampler,
(d) different-P same-sampler?"

A per-directory sha256 over the entire concatenated text IR is one option, but
it conflates every module into one hash. The more informative strategy is to
hash each module INDIVIDUALLY, then compute the Jaccard overlap of the
per-module-hash SET between pairs of runs. A module that survives across two
runs contributes the same sha256 to both sets; a module with unstable HLO (e.g.
closure-over-data changing) gets different hashes.

We also emit a `scan_body` hash — the largest `jit_scan.before_optimizations.txt`
in each directory — because the main observation from Wave 2 is that the
PAT-RL logp scan is the hot loop, and its HLO signature dictates whether the
persistent cache can land a hit on the next-process run.

Output
------
Prints to stdout:
  1. One line per `hlo_dumps/<run>/` subdir showing
     (scan_body_sha256, module_count, per_run_total_signature_sha256).
  2. Pairwise Jaccard overlap matrix (intersection / union of per-module hash
     sets) across all subdirs.
  3. Pairwise scan-body-hash equality matrix.
  4. Grouped-by-hash collapsing (any subdirs that share total_signature).

Run:
  python .planning/phases/21-benchmark-bottleneck-diagnosis/compute_hlo_hashes.py

Notes
-----
Kept as a working artifact under the phase dir; not covered by ruff scanning.
No imports of project src/; pure stdlib.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

PHASE_DIR = Path(".planning/phases/21-benchmark-bottleneck-diagnosis/hlo_dumps")
OUTPUT_JSON = Path(
    ".planning/phases/21-benchmark-bottleneck-diagnosis/hlo_hash_matrix.json"
)


def sha256_hex16(b: bytes) -> str:
    """Return the first 16 hex chars of sha256(b)."""
    return hashlib.sha256(b).hexdigest()[:16]


def collect_per_run(run_dir: Path) -> dict[str, object]:
    """Collect per-module HLO hashes for a single run directory.

    Parameters
    ----------
    run_dir : Path
        Directory containing ``module_XXXX.<tag>.before_optimizations.txt`` files.

    Returns
    -------
    dict
        Keys: ``module_hashes`` (dict tag -> sha256), ``scan_body_hash``
        (hash of the largest ``jit_scan.before_optimizations.txt``),
        ``scan_body_file`` (filename of that module), ``scan_body_size``
        (bytes), ``n_modules`` (int), ``total_signature`` (sha256 over
        sorted per-module hashes; a single scalar identifying the whole run).
    """
    before_opt = sorted(run_dir.glob("*.before_optimizations.txt"))
    # Key each module by its compiled-function tag (everything between
    # `module_XXXX.` and `.before_optimizations.txt`), collapsing the module
    # index so cold/warm runs that differ only by module-index ordering still
    # match on tag. XLA reuses tags across runs; the cache key is derived from
    # content, not ordering.
    tag_to_hash: dict[str, str] = {}
    tag_collisions: dict[str, int] = {}
    for f in before_opt:
        # Filename pattern: module_NNNN.<tag>.before_optimizations.txt
        parts = f.name.split(".", 1)
        if len(parts) < 2:
            continue
        tail = parts[1]
        tag = tail.removesuffix(".before_optimizations.txt")
        content_hash = sha256_hex16(f.read_bytes())
        # A run may have multiple modules with the same tag (e.g. many
        # `jit_scan` calls with different shapes). Disambiguate by appending
        # the collision index to the tag.
        if tag in tag_to_hash:
            idx = tag_collisions.get(tag, 1)
            tag_collisions[tag] = idx + 1
            tag_to_hash[f"{tag}#{idx}"] = content_hash
        else:
            tag_to_hash[tag] = content_hash

    # Scan-body hash = hash of the single largest jit_scan.before_opt file.
    # The largest jit_scan in these dumps is the PAT-RL logp scan body
    # (~4.7MB at P=5/20, ~4.8MB at P=50).
    scan_files = sorted(
        run_dir.glob("*jit_scan.before_optimizations.txt"),
        key=lambda p: p.stat().st_size,
        reverse=True,
    )
    if scan_files:
        scan_body_file = scan_files[0].name
        scan_body_size = scan_files[0].stat().st_size
        scan_body_hash = sha256_hex16(scan_files[0].read_bytes())
    else:
        scan_body_file = "MISSING"
        scan_body_size = 0
        scan_body_hash = "MISSING"

    # Total signature: hash of sorted list of per-module hashes. Stable under
    # module-index permutation but sensitive to any single-module content
    # change.
    hash_list = sorted(tag_to_hash.values())
    total_sig = hashlib.sha256("\n".join(hash_list).encode()).hexdigest()[:16]

    return {
        "module_hashes": tag_to_hash,
        "scan_body_file": scan_body_file,
        "scan_body_size": scan_body_size,
        "scan_body_hash": scan_body_hash,
        "n_modules": len(tag_to_hash),
        "total_signature": total_sig,
    }


def jaccard(a: set[str], b: set[str]) -> float:
    """Compute Jaccard overlap (intersection / union) of two hash sets."""
    if not a and not b:
        return 1.0
    inter = len(a & b)
    union = len(a | b)
    if union == 0:
        return 0.0
    return inter / union


def main() -> None:
    """Run the hash matrix computation and print results."""
    if not PHASE_DIR.exists():
        print(f"ERROR: {PHASE_DIR} does not exist")
        return

    subdirs = sorted([d for d in PHASE_DIR.iterdir() if d.is_dir()])
    if not subdirs:
        print(f"ERROR: no subdirs found under {PHASE_DIR}")
        return

    print(f"Scanning {len(subdirs)} HLO dump directories under {PHASE_DIR}\n")

    per_run: dict[str, dict[str, object]] = {}
    for d in subdirs:
        per_run[d.name] = collect_per_run(d)
        pr = per_run[d.name]
        print(
            f"  {d.name}: n_modules={pr['n_modules']} "
            f"total_sig={pr['total_signature']} "
            f"scan_body_hash={pr['scan_body_hash']} "
            f"(file={pr['scan_body_file']}, size={pr['scan_body_size']:,} B)"
        )

    names = sorted(per_run.keys())
    n = len(names)

    # Per-module Jaccard overlap matrix
    print("\n=== Per-module Jaccard overlap matrix (content-hash set) ===")
    print("  rows/cols: " + ", ".join(names))
    header = " " * 20 + " | " + " | ".join(f"{n:>20}" for n in names)
    print(header)
    for i in range(n):
        row_hashes_i = set(per_run[names[i]]["module_hashes"].values())
        cells: list[str] = []
        for j in range(n):
            row_hashes_j = set(per_run[names[j]]["module_hashes"].values())
            jac = jaccard(row_hashes_i, row_hashes_j)
            cells.append(f"{jac:>20.3f}")
        print(f"  {names[i]:<18} | " + " | ".join(cells))

    # Scan-body pairwise equality matrix
    print("\n=== Scan-body sha256[:16] equality matrix ===")
    for i in range(n):
        row: list[str] = []
        hi = per_run[names[i]]["scan_body_hash"]
        for j in range(n):
            hj = per_run[names[j]]["scan_body_hash"]
            row.append("EQUAL" if hi == hj else "DIFF")
        print(f"  {names[i]:<18} | " + " | ".join(f"{c:>5}" for c in row))

    # Total-signature grouping
    print("\n=== Grouped by total_signature ===")
    sig_groups: dict[str, list[str]] = {}
    for name, pr in per_run.items():
        sig_groups.setdefault(str(pr["total_signature"]), []).append(name)
    for sig, members in sig_groups.items():
        print(f"  {sig}: {', '.join(members)}")

    # Key pairwise comparisons (the ones the plan explicitly asks for)
    print("\n=== Key pairwise comparisons (per plan Step 4) ===")
    pairs = [
        ("pscan_P5_cold", "pscan_P5_warm"),
        ("pscan_P20_cold", "pscan_P20_warm"),
        ("pscan_P50_cold", "pscan_P50_warm"),
        ("nuts_P5", "pscan_P5_cold"),
        ("nuts_P20", "pscan_P20_cold"),
        ("laplace_P5", "nuts_P5"),
        ("laplace_P5", "laplace_P20"),
        ("pscan_P5_cold", "pscan_P20_cold"),
        ("pscan_P20_cold", "pscan_P50_cold"),
        ("pscan_P5_cold", "pscan_P50_cold"),
    ]
    for a, b in pairs:
        if a not in per_run or b not in per_run:
            print(f"  {a} vs {b}: ONE OR BOTH MISSING")
            continue
        ha = set(per_run[a]["module_hashes"].values())
        hb = set(per_run[b]["module_hashes"].values())
        jac = jaccard(ha, hb)
        sa = per_run[a]["scan_body_hash"]
        sb = per_run[b]["scan_body_hash"]
        scan_eq = "EQUAL" if sa == sb else "DIFF"
        ta = per_run[a]["total_signature"]
        tb = per_run[b]["total_signature"]
        total_eq = "EQUAL" if ta == tb else "DIFF"
        print(
            f"  {a:>16} vs {b:<16} | "
            f"jaccard={jac:.3f} | scan_body={scan_eq} | total_sig={total_eq}"
        )

    # Serialize full matrix for the memo
    out = {
        "per_run": {
            k: {
                "n_modules": v["n_modules"],
                "scan_body_file": v["scan_body_file"],
                "scan_body_size": v["scan_body_size"],
                "scan_body_hash": v["scan_body_hash"],
                "total_signature": v["total_signature"],
            }
            for k, v in per_run.items()
        },
        "jaccard_matrix": {
            a: {
                b: jaccard(
                    set(per_run[a]["module_hashes"].values()),
                    set(per_run[b]["module_hashes"].values()),
                )
                for b in names
            }
            for a in names
        },
        "scan_body_equality": {
            a: {
                b: per_run[a]["scan_body_hash"] == per_run[b]["scan_body_hash"]
                for b in names
            }
            for a in names
        },
    }
    OUTPUT_JSON.write_text(json.dumps(out, indent=2))
    print(f"\nWrote structured matrix to {OUTPUT_JSON}")


if __name__ == "__main__":
    main()
