# Current State

## Project Reference

See: `.planning/PROJECT.md` (updated 2026-05-04)

**Core value:** Reliable, scalable hierarchical Bayesian HGF fitting that exposes proper posterior UQ at production cohort sizes.
**Current focus:** Phase 27 — Dependency upgrade chain (BlackJAX 1.5 + NumPyro promotion + JAX shard_map + Python 3.11 + ds_env rebuild).

## Current Position

Phase: 27 of 10 (Dependency upgrade chain) — in progress
Plan: 2 of 4 complete (27-01, 27-02 done; 27-03 next)
Status: In progress — 27-02 complete; dep chain bumped + environment-v10.yml created
Last activity: 2026-05-04 — Completed 27-02-PLAN.md (pyproject.toml bump + environment-v10.yml + smoke)

Progress: [██░░░░░░░░] 20%

## Performance Metrics

**Velocity:**
- Total plans completed: 2
- Average duration: 27 min
- Total execution time: 0.88 hours

**By Phase:**

| Phase | Plans | Total | Avg/Plan |
|-------|-------|-------|----------|
| 27-dependency-upgrade-chain | 2 of 4 | 53 min | 27 min |

*Updated after each plan completion.*

## Accumulated Context

### Decisions

Decisions are logged in PROJECT.md Key Decisions table. Recent decisions affecting current work:

- **Build order flipped vs original framing** (Phase 28 before benchmarks): per ARCHITECTURE.md, per-flag SLURM env-passthrough plumbing is wasted work without `FitConfig` first; benchmarks land LAST against fully-wired toolkit.
- **M2 + W4 fused into Phase 33**: per ARCHITECTURE.md, both touch prior construction in the same files; sequential implementation means rewriting `_make_logdensity_closure` twice.
- **Phase 35 (M3 Gibbs) is conditional**: fires only on Phase 34 evidence per M3-01 — research disagrees with building it speculatively given LOW confidence on production-scale convergence.
- **Pre-registered audit protocol (AUDIT-01) gates Phase 32**: must land before any audit run per Pitfall 10 (confounded sampler audit).
- **Per-parameter non-centering field shape lands in Phase 30**: `MitigationConfig.non_centered: tuple[str, ...]` is a list of parameter names, not a global boolean — even though the consumer ships in Phase 33 (Pitfall 3 prevention).
- **[27-01] Strategy C (pyhgf fork) mandatory**: `jaxlib.xla_extension.PjitFunction` removed in JAX 0.5+; all 6 matrix cells (pyhgf {0.2.8,0.2.11} x JAX {0.7.0,0.9.0,0.10.0}) fail at import time; `--no-deps` Strategy A is unviable.
- **[27-01] Fork base: pyhgf 0.2.8**: project-validated version; minimum fix is one line in `pyhgf/typing.py` replacing `PjitFunction` with `Callable`.
- **[27-01] JAX pin: >=0.9.0,<0.11**: BlackJAX 1.5 minimum; 0.10.0 confirmed working for jaxopt.
- **[27-01] jaxopt OK at JAX 0.10.0**: no `optax.lbfgs()` fallback adapter needed.
- **[27-02] Fork install: pip wheel + in-place patch**: pyhgf 0.2.8 uses maturin (Rust build backend); no Rust toolchain available. Install = `pip install --no-deps pyhgf==0.2.8` + `python scripts/ci/patch_pyhgf_typing.py`. vendor/pyhgf/ is reference archive only.
- **[27-02] vendor/ as plain directory**: no git submodule; .git removed from clone; Python source only tracked.
- **[27-02] requirements-v10.txt is platform-specific**: Windows/CPU snapshot; must regenerate on M3 for Linux/CUDA12 jaxlib wheel.

### Pending Todos

None yet.

### Blockers/Concerns

- **pyhgf 0.2.8 <-> JAX > 0.4.31 compat** — RESOLVED by 27-02. Strategy C: pip wheel + in-place patch via scripts/ci/patch_pyhgf_typing.py. Probe confirmed PASS at JAX 0.10.
- **Per-parameter vs shared σ_θ identifiability at P=200 with K=2-3 covariates** — research-flagged for Phase 33 pre-planning; sim-to-inference evidence required before committing to the more flexible variant.
- **M3 conditional-independence proof + per-block convergence diagnostics** — research-flagged for Phase 35 pre-planning if it fires; lowest-confidence area in v1.0 scope.

### v1.0 Carry-forward (from pre-v1.0 work)

- BlackJAX `max_num_doublings` duplicate-kwarg bug fixed in `b737fe6` (2026-05-04). Capability-map's "P=50 was last PASS" reflects this, not a hardware cliff.
- 3-level NUTS conditioning cliff is real even at n_per_group=5 (P=30): step-size collapses to 7.245e-10, depth-10 saturated, on both A100 80GB and L40S. Diagonal mass matrix can't precondition the κ × ω₂ × ω₃ banana. This is what the v1.0 mitigation ladder addresses.
- Laplace warmup variant (commit `385e8c3`, Phase 14.2-05) is wired but never tested at scale due to the kwarg bug. First v1.0 phase to exercise it: Phase 30.
- `tests/integration/test_capability_map.py` closure-guard validates the map is well-formed. Don't break it; Phase 31 extends it.

## Session Continuity

Last session: 2026-05-04T19:07:00Z
Stopped at: Completed 27-02-PLAN.md — dep chain bump + environment-v10.yml + smoke import confirmed.
Resume file: None — proceed directly to plan 27-03.

---
*Last updated: 2026-05-04 on 27-02 completion*
