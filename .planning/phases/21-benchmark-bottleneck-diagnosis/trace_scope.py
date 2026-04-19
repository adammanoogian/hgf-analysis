"""Ad-hoc local CPU tracer for Phase 21-01 scope memo.

Dumps JAXPR + HLO for:
  - PAT-RL 3-level logp+prior closure at P=3
  - PAT-RL 2-level logp+prior closure at P=3
  - pick_best_cue 3-level batched logp at P=3
  - pick_best_cue 2-level batched logp at P=3

All at small P=3 for local traceability. No cluster, no GPU.

Writes:
  .planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/<tag>.jaxpr.txt
  .planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps/<tag>.hlo.txt

Not intended for commit — this is a working artifact for the memo.
"""

from __future__ import annotations

import os
import sys
from pathlib import Path

# CPU only, no CUDA, no JAX X64 (default).
os.environ.setdefault("JAX_PLATFORMS", "cpu")

import jax
import jax.numpy as jnp
import numpy as np

REPO_ROOT = Path(__file__).resolve().parents[3]
DUMP_DIR = REPO_ROOT / ".planning/phases/21-benchmark-bottleneck-diagnosis/jaxpr_dumps"
DUMP_DIR.mkdir(parents=True, exist_ok=True)

sys.path.insert(0, str(REPO_ROOT / "src"))
sys.path.insert(0, str(REPO_ROOT))  # for top-level config.py


def count_hlo_ops(hlo_text: str) -> int:
    """Rough HLO op count: count all '=' assignment lines excluding headers."""
    n = 0
    for line in hlo_text.splitlines():
        stripped = line.strip()
        # Skip empty, headers, closing brace
        if not stripped:
            continue
        if stripped.startswith("HloModule") or stripped.startswith("ENTRY"):
            continue
        if stripped in ("{", "}"):
            continue
        # HLO op lines contain ' = ' with a percent-sign SSA name
        if " = " in stripped:
            n += 1
    return n


def extract_callee_body_counts(hlo_text: str) -> dict[str, int]:
    """Walk every named computation block in HLO and count its ops.

    Returns a dict {computation_name: op_count}.
    Useful for spotting scan/while bodies and reduce functions.
    """
    counts: dict[str, int] = {}
    lines = hlo_text.splitlines()
    current_name: str | None = None
    current_count = 0
    depth = 0
    for line in lines:
        stripped = line.strip()
        if not stripped:
            continue
        # Look for computation header line, typically:
        #   computation_name (arg: ..) -> type {
        if stripped.endswith("{") and "(" in stripped and not stripped.startswith("ENTRY"):
            # Start of a new computation
            # Name before the first '(' on the first token
            head = stripped.split("(", 1)[0].strip()
            current_name = head
            current_count = 0
            depth = 1
            continue
        if stripped.startswith("ENTRY") and stripped.endswith("{"):
            head = stripped.split("(", 1)[0].replace("ENTRY", "").strip()
            current_name = head or "ENTRY"
            current_count = 0
            depth = 1
            continue
        if current_name is not None:
            if stripped == "}":
                depth -= 1
                if depth == 0:
                    counts[current_name] = current_count
                    current_name = None
                    current_count = 0
                continue
            if " = " in stripped:
                current_count += 1
    return counts


def dump(tag: str, jaxpr_str: str, hlo_str: str) -> tuple[int, int | None]:
    """Write jaxpr + hlo; return (total_op_count, longest_subcomputation_ops)."""
    (DUMP_DIR / f"{tag}.jaxpr.txt").write_text(jaxpr_str, encoding="utf-8")
    (DUMP_DIR / f"{tag}.hlo.txt").write_text(hlo_str, encoding="utf-8")
    total = count_hlo_ops(hlo_str)
    per_comp = extract_callee_body_counts(hlo_str)
    # Heuristic: find likely scan body (the largest non-ENTRY computation).
    non_entry = {k: v for k, v in per_comp.items() if k != "ENTRY"}
    longest = max(non_entry.values()) if non_entry else None
    return total, longest, per_comp  # type: ignore[return-value]


# -------------------------------------------------------------------------
# PAT-RL cohort builder (P=3, single phenotype for speed)
# -------------------------------------------------------------------------

def build_patrl_cohort_P3():
    from prl_hgf.env.pat_rl_config import load_pat_rl_config
    from prl_hgf.env.pat_rl_simulator import simulate_patrl_cohort

    cfg = load_pat_rl_config()
    sim_df, _truths, _trials = simulate_patrl_cohort(
        n_participants=3,
        level=2,
        master_seed=0,
        config=cfg,
        phenotypes=["healthy"],
        response_model="model_a",
    )
    return cfg, sim_df


def trace_patrl(level: int, tag: str) -> dict:
    print(f"\n[trace_patrl] level={level} tag={tag}")
    from prl_hgf.fitting.hierarchical_patrl import (
        build_logp_fn_batched_patrl,
        _build_patrl_log_posterior,
    )
    from prl_hgf.fitting.fit_vb_laplace_patrl import _build_arrays_single_patrl

    cfg, sim_df = build_patrl_cohort_P3()
    participants = sorted(sim_df["participant_id"].astype(str).unique().tolist())
    arrays = _build_arrays_single_patrl(sim_df, participants)

    model_name = f"hgf_{level}level_patrl"
    logp_fn = build_logp_fn_batched_patrl(
        state_arr=arrays["state"],
        choices_arr=arrays["choice"],
        reward_mag_arr=arrays["reward_mag"],
        shock_mag_arr=arrays["shock_mag"],
        trial_mask=arrays["trial_mask"],
        model_name=model_name,
        response_model="model_a",
        delta_hr_arr=arrays.get("delta_hr"),
    )
    log_posterior_fn = _build_patrl_log_posterior(
        logp_fn, cfg, model_name, response_model="model_a"
    )

    P = len(participants)
    prior = cfg.fitting.priors
    init = {
        "omega_2": jnp.full((P,), prior.omega_2.mean),
        "log_beta": jnp.full((P,), jnp.log(prior.beta.mean)),
    }
    if level == 3:
        init["omega_3"] = jnp.full((P,), prior.omega_3.mean)
        init["kappa"] = jnp.full((P,), prior.kappa.mean)
        init["mu3_0"] = jnp.full((P,), prior.mu3_0.mean)
    init["b"] = jnp.full((P,), prior.b.mean)

    print("  making jaxpr ...")
    jaxpr_str = str(jax.make_jaxpr(log_posterior_fn)(init))
    print(f"  jaxpr len chars: {len(jaxpr_str)}")

    print("  lowering to HLO ...")
    lowered = jax.jit(log_posterior_fn).lower(init)
    hlo_str = lowered.as_text()
    print(f"  hlo len chars: {len(hlo_str)}")

    total, longest, per_comp = dump(tag, jaxpr_str, hlo_str)
    print(f"  total HLO ops: {total}")
    print(f"  longest subcomputation ops: {longest}")
    return {
        "tag": tag,
        "P": P,
        "total_ops": total,
        "longest_subcomputation_ops": longest,
        "subcomputation_op_counts": per_comp,
        "n_subcomputations": len(per_comp),
    }


# -------------------------------------------------------------------------
# pick_best_cue (3-cue PRL) batched logp
# -------------------------------------------------------------------------

def trace_pick_best_cue(level: int, tag: str) -> dict:
    print(f"\n[trace_pick_best_cue] level={level} tag={tag}")
    from prl_hgf.fitting.hierarchical import (
        build_logp_fn_batched,
        _build_arrays_single,
    )
    from prl_hgf.env.task_config import load_config
    from prl_hgf.simulation.batch import simulate_batch
    import dataclasses

    cfg = load_config()
    # Shrink cohort to 1-per-group; 3 groups × 1 × 3 sessions = 9 sessions.
    # We'll slice down to 3 participant-session rows for P=3 tracing.
    cfg_small = dataclasses.replace(
        cfg,
        simulation=dataclasses.replace(cfg.simulation, n_participants_per_group=1),
    )
    sim_df = simulate_batch(cfg_small)
    if isinstance(sim_df, tuple):
        sim_df = sim_df[0]

    # Group by (participant_id, session) to form units.
    sim_df = sim_df.copy()
    sim_df["unit_id"] = sim_df["participant_id"].astype(str) + "::" + sim_df["session"].astype(str)
    unit_ids = sorted(sim_df["unit_id"].unique().tolist())[:3]
    print(f"  selecting {len(unit_ids)} participant-sessions: {unit_ids}")

    input_data_list = []
    observed_list = []
    choices_list = []
    for u in unit_ids:
        subset = sim_df[sim_df["unit_id"] == u].sort_values("trial").reset_index(drop=True)
        id_arr, obs_arr, ch_arr = _build_arrays_single(subset)
        input_data_list.append(id_arr)
        observed_list.append(obs_arr)
        choices_list.append(ch_arr)

    P = len(unit_ids)
    n_trials = input_data_list[0].shape[0]
    input_data = np.stack(input_data_list, axis=0).astype(np.float32)
    observed = np.stack(observed_list, axis=0).astype(np.int32)
    choices = np.stack(choices_list, axis=0).astype(np.int32)
    mask = np.ones((P, n_trials), dtype=np.bool_)

    model_name = f"hgf_{level}level"
    batched_logp, n_params = build_logp_fn_batched(
        model_name=model_name, n_trials=n_trials
    )

    # Use reasonable prior-mean-adjacent values (cfg.fitting may not exist for
    # pick_best_cue in the same form; the exact parameter values don't affect
    # the HLO op count, only shapes do).
    if level == 3:
        omega_2 = jnp.full((P,), -3.0, dtype=jnp.float32)
        omega_3 = jnp.full((P,), -6.0, dtype=jnp.float32)
        kappa = jnp.full((P,), 1.0, dtype=jnp.float32)
        beta = jnp.full((P,), 1.0, dtype=jnp.float32)
        zeta = jnp.full((P,), 0.0, dtype=jnp.float32)
        args = (
            omega_2, omega_3, kappa, beta, zeta,
            jnp.asarray(input_data),
            jnp.asarray(observed),
            jnp.asarray(choices),
            jnp.asarray(mask),
        )
    else:
        omega_2 = jnp.full((P,), -3.0, dtype=jnp.float32)
        beta = jnp.full((P,), 1.0, dtype=jnp.float32)
        zeta = jnp.full((P,), 0.0, dtype=jnp.float32)
        args = (
            omega_2, beta, zeta,
            jnp.asarray(input_data),
            jnp.asarray(observed),
            jnp.asarray(choices),
            jnp.asarray(mask),
        )

    print(f"  P={P} n_trials={n_trials}")
    print("  making jaxpr ...")
    jaxpr_str = str(jax.make_jaxpr(batched_logp)(*args))
    print(f"  jaxpr len chars: {len(jaxpr_str)}")
    print("  lowering to HLO ...")
    lowered = jax.jit(batched_logp).lower(*args)
    hlo_str = lowered.as_text()
    print(f"  hlo len chars: {len(hlo_str)}")

    total, longest, per_comp = dump(tag, jaxpr_str, hlo_str)
    print(f"  total HLO ops: {total}")
    print(f"  longest subcomputation ops: {longest}")
    return {
        "tag": tag,
        "P": P,
        "n_trials": n_trials,
        "total_ops": total,
        "longest_subcomputation_ops": longest,
        "subcomputation_op_counts": per_comp,
        "n_subcomputations": len(per_comp),
    }


# -------------------------------------------------------------------------
# main
# -------------------------------------------------------------------------

if __name__ == "__main__":
    results = []
    # PAT-RL first (the primary target for the memo).
    results.append(trace_patrl(level=3, tag="patrl_3level_P3"))
    results.append(trace_patrl(level=2, tag="patrl_2level_P3"))
    # pick_best_cue next.
    results.append(trace_pick_best_cue(level=3, tag="pickbestcue_3level_P3"))
    results.append(trace_pick_best_cue(level=2, tag="pickbestcue_2level_P3"))

    print("\n\n=== SUMMARY (P=3, local CPU, small traceable) ===")
    for r in results:
        print(
            f"{r['tag']:30s}  total={r['total_ops']:>6d}  "
            f"longest_sub={r['longest_subcomputation_ops']}  "
            f"n_sub={r['n_subcomputations']}"
        )

    # Dump a small JSON file with the raw counts for the memo.
    import json
    (DUMP_DIR / "op_counts.json").write_text(
        json.dumps([{k: v for k, v in r.items()
                     if k != "subcomputation_op_counts"} for r in results],
                   indent=2),
        encoding="utf-8",
    )
    # Full per-computation breakdown to a second file.
    (DUMP_DIR / "op_counts_full.json").write_text(
        json.dumps(results, indent=2, default=str),
        encoding="utf-8",
    )
    print(f"\nWrote: {DUMP_DIR / 'op_counts.json'}")
    print(f"Wrote: {DUMP_DIR / 'op_counts_full.json'}")
