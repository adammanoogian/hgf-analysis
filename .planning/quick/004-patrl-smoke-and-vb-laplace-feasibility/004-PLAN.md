---
phase: quick-004
plan: "004"
type: execute
wave: 1
depends_on: []
gap_closure: false
autonomous: true

files_created:
  - cluster/18_smoke_patrl_cpu.slurm
  - .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md

files_modified:
  - scripts/12_smoke_patrl_foundation.py
  - tests/test_smoke_patrl_foundation.py
  - pyproject.toml                                    # commit staged mypy override
  - .planning/ROADMAP.md                              # commit staged edits if doc-only
  - .planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md  # commit staged edits if doc-only
  - .planning/phases/18-pat-rl-task-adaptation/18-01-PLAN.md   # git add (currently untracked)
  - .planning/phases/18-pat-rl-task-adaptation/18-02-PLAN.md   # git add (currently untracked)
  - .planning/phases/18-pat-rl-task-adaptation/18-03-PLAN.md   # git add (currently untracked)
  - .planning/phases/18-pat-rl-task-adaptation/18-04-PLAN.md   # git add (currently untracked)
  - .planning/phases/18-pat-rl-task-adaptation/18-05-PLAN.md   # git add (currently untracked)
  - .planning/phases/18-pat-rl-task-adaptation/18-06-PLAN.md   # git add (currently untracked)

files_deleted:
  - _run_tests.py
  - _run_models_tests.py
  - _verify_loader.py
  - _verify_yaml.py

must_haves:
  truths:
    - "Phase 18 foundation smoke can be launched on the M3 cluster via sbatch cluster/18_smoke_patrl_cpu.slurm."
    - "scripts/12_smoke_patrl_foundation.py still exists, supports --dry-run, and remains the cluster entrypoint."
    - "tests/test_smoke_patrl_foundation.py runs locally on Windows with zero MCMC — structural checks only, no subprocess-run-NUTS."
    - "Parallel-stack invariant: the smoke script imports nothing from prl_hgf.env.task_config, prl_hgf.models.hgf_2level, prl_hgf.models.response."
    - "Scratch verification probes at repo root are gone; pyproject.toml mypy override is committed."
    - "All 18-NN-PLAN.md files for Phase 18 are tracked in git."
    - "A VB-Laplace feasibility memo exists at .planning/quick/004-.../VB_LAPLACE_FEASIBILITY.md with a concrete go/no-go/parallel-track recommendation."
    - "pick_best_cue pipeline still imports and its test suite still passes (regression protection)."
  artifacts:
    - path: "cluster/18_smoke_patrl_cpu.slurm"
      provides: "Cluster smoke entry point for PAT-RL Phase 18 foundation."
      contains: "conda activate ds_env"
      contains_also: "scripts/12_smoke_patrl_foundation.py"
      min_lines: 60
    - path: "scripts/12_smoke_patrl_foundation.py"
      provides: "PAT-RL foundation smoke driver (cluster + dry-run modes)."
      contains: "--dry-run"
    - path: "tests/test_smoke_patrl_foundation.py"
      provides: "Structural-only local test coverage for the smoke script."
      contains: "py_compile"
      must_not_contain: "subprocess.run"
      must_not_contain_also: "RUN_SMOKE_TESTS"
    - path: ".planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md"
      provides: "Decision memo on VB-Laplace vs BlackJAX NUTS for PAT-RL."
      contains: "Recommendation"
      min_lines: 80
  key_links:
    - from: "cluster/18_smoke_patrl_cpu.slurm"
      to: "scripts/12_smoke_patrl_foundation.py"
      via: "python invocation under conda ds_env"
      pattern: "python scripts/12_smoke_patrl_foundation.py"
    - from: "tests/test_smoke_patrl_foundation.py"
      to: "scripts/12_smoke_patrl_foundation.py"
      via: "py_compile + source-text static inspection (NO subprocess exec of MCMC)"
      pattern: "py_compile"
    - from: ".planning/quick/004-.../VB_LAPLACE_FEASIBILITY.md"
      to: "src/prl_hgf/fitting/hierarchical_patrl.py::_build_patrl_log_posterior"
      via: "mapping of tapas quasi-Newton + numerical Hessian onto the existing PAT-RL logp surface"
      pattern: "_build_patrl_log_posterior"
---

<objective>
Stand up the Phase 18 PAT-RL foundation smoke test as a **cluster-targeted** SLURM
job (not a local in-process MCMC run), finish the housekeeping from the cancelled
executor spawn, and produce a decision memo on whether to mirror the matlab tapas
VB-Laplace approximation to sidestep current NUTS sampling friction.

Purpose
-------
- The Plan 18-06 draft wired the smoke into a local `subprocess.run` harness. The
  v1.2 pivot (see STATE.md) explicitly moved NUTS off the Windows laptop. Running
  NUTS locally as a pytest is the wrong venue; smoke belongs on the cluster CPU
  partition, mirroring `cluster/16_smoke_test_cpu.slurm`.
- The previous executor was cancelled mid-spawn and left scratch probes at repo
  root, an un-committed mypy config tweak, and 6 untracked 18-NN-PLAN.md files.
  Clean all of that up in one pass so Phase 18 is landable.
- The user has flagged "sampling issues" and asked whether VB-Laplace (tapas
  style) is a feasible pipeline-up-and-running alternative. This plan answers
  that with a decision memo — **NOT** an implementation. Implementation is out
  of scope and deferred to a follow-up quick plan pending the memo's verdict.

Output
------
- `cluster/18_smoke_patrl_cpu.slurm` — cluster entry point.
- Revised `scripts/12_smoke_patrl_foundation.py` supporting `--dry-run`
  (simulate + forward pass + export only, no MCMC).
- Rewritten `tests/test_smoke_patrl_foundation.py` with 5 structural tests.
- 4 scratch files at repo root deleted.
- pyproject.toml mypy override + staged planning-doc edits committed.
- All 6 18-NN-PLAN.md files added to git.
- `.planning/quick/004-.../VB_LAPLACE_FEASIBILITY.md` decision memo.
</objective>

<execution_context>
@C:\Users\aman0087\.claude/get-shit-done/workflows/execute-plan.md
@C:\Users\aman0087\.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
# Project-level
@.planning/ROADMAP.md
@.planning/STATE.md

# Phase 18 — the work this plan is cleaning up + extending
@.planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md
@.planning/phases/18-pat-rl-task-adaptation/18-04-SUMMARY.md
@.planning/phases/18-pat-rl-task-adaptation/18-05-SUMMARY.md
@.planning/phases/18-pat-rl-task-adaptation/18-06-PLAN.md

# Cluster template to mirror
@cluster/16_smoke_test_cpu.slurm

# Current state of the smoke files (untracked, from cancelled executor)
@scripts/12_smoke_patrl_foundation.py
@tests/test_smoke_patrl_foundation.py

# PAT-RL logp surface — referenced by Task 2 memo
@src/prl_hgf/fitting/hierarchical_patrl.py

# Regression canary: pick_best_cue stack must still import/test
@src/prl_hgf/env/task_config.py
@src/prl_hgf/models/hgf_2level.py
@src/prl_hgf/models/response.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Cluster smoke setup + Phase-18 housekeeping</name>
  <files>
    cluster/18_smoke_patrl_cpu.slurm
    scripts/12_smoke_patrl_foundation.py
    tests/test_smoke_patrl_foundation.py
    pyproject.toml
    .planning/ROADMAP.md
    .planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md
    .planning/phases/18-pat-rl-task-adaptation/18-01-PLAN.md
    .planning/phases/18-pat-rl-task-adaptation/18-02-PLAN.md
    .planning/phases/18-pat-rl-task-adaptation/18-03-PLAN.md
    .planning/phases/18-pat-rl-task-adaptation/18-04-PLAN.md
    .planning/phases/18-pat-rl-task-adaptation/18-05-PLAN.md
    .planning/phases/18-pat-rl-task-adaptation/18-06-PLAN.md
    _run_tests.py
    _run_models_tests.py
    _verify_loader.py
    _verify_yaml.py
  </files>
  <action>
    Five sub-steps. Do them in order, commit discrete commits per logical group.

    === 1. Add `--dry-run` to scripts/12_smoke_patrl_foundation.py ===

    Open `scripts/12_smoke_patrl_foundation.py`. Leave the existing cluster
    entrypoint behaviour intact (it is the launcher target from the new SLURM
    file in step 4). Add a `--dry-run` flag that:
      - Skips step 3 (_fit) entirely — do NOT import blackjax, do NOT call
        fit_batch_hierarchical_patrl.
      - Skips step 4 (_export) and step 5 (_sanity_check) — those require
        idata.
      - Runs steps 1-2 only: load config, simulate cohort, forward pass.
      - Prints a summary: n_participants, n_trials/participant, total rows,
        elapsed seconds.
      - Returns exit 0 on success, 1 on exception.

    Implementation specifics:
      - In `_parse_args` add: `parser.add_argument("--dry-run", action="store_true",
        help="Run simulate + forward pass only, skip MCMC fit/export/sanity.")`
      - In `main`, after `sim_df, true_params, trials_by_participant = _simulate_cohort(...)`,
        check `if args.dry_run: ... return 0` before the fit step.
      - Preserve the existing exit codes (0/1/2) for the non-dry path.
      - Do NOT change the import structure — blackjax must still be lazy-imported
        inside `_fit`.

    === 2. Rewrite tests/test_smoke_patrl_foundation.py as structural-only ===

    Delete the current body wholesale (no subprocess MCMC, no RUN_SMOKE_TESTS gating).
    Replace with exactly these 5 tests, using pytest. Use `from __future__ import
    annotations`, NumPy-style docstrings (per project CLAUDE.md).

    ```python
    from __future__ import annotations

    import py_compile
    import subprocess
    import sys
    from pathlib import Path

    import pytest

    _REPO_ROOT = Path(__file__).resolve().parents[1]
    _SCRIPT = _REPO_ROOT / "scripts" / "12_smoke_patrl_foundation.py"
    _PICK_BEST_CUE_MODULES = [
        "src/prl_hgf/env/task_config.py",
        "src/prl_hgf/models/hgf_2level.py",
        "src/prl_hgf/models/response.py",
    ]


    def test_smoke_script_py_compiles() -> None:
        """Script must be syntactically valid without running it.

        py_compile does not execute module top-level — blackjax is lazy-imported
        inside ``_fit`` so absence of blackjax on the test machine must not
        break compilation.
        """
        py_compile.compile(str(_SCRIPT), doraise=True)


    def test_smoke_script_rejects_invalid_level() -> None:
        """``--level 4`` must be rejected by argparse (choices=[2, 3])."""
        result = subprocess.run(
            [sys.executable, str(_SCRIPT), "--level", "4"],
            capture_output=True,
            text=True,
        )
        assert result.returncode != 0, (
            f"Expected non-zero exit for --level 4; got {result.returncode}.  "
            f"stderr:\n{result.stderr}"
        )
        assert "invalid choice" in result.stderr.lower() or "4" in result.stderr, (
            f"Expected argparse choices error; got stderr:\n{result.stderr}"
        )


    def test_smoke_script_has_no_pick_best_cue_imports() -> None:
        """Parallel-stack invariant: smoke must not import pick_best_cue modules.

        Textual scan of the smoke script — no prl_hgf.env.task_config,
        prl_hgf.models.hgf_2level, or prl_hgf.models.response.  Those are the
        pick_best_cue stack; PAT-RL uses prl_hgf.env.pat_rl_config,
        prl_hgf.models.hgf_2level_patrl, prl_hgf.models.hgf_3level_patrl.
        """
        source = _SCRIPT.read_text(encoding="utf-8")
        forbidden = [
            "from prl_hgf.env.task_config",
            "from prl_hgf.models.hgf_2level ",  # trailing space avoids _patrl hit
            "from prl_hgf.models.hgf_2level\n",
            "from prl_hgf.models.response",
            "import prl_hgf.env.task_config",
            "import prl_hgf.models.hgf_2level\n",
            "import prl_hgf.models.response",
        ]
        hits = [s for s in forbidden if s in source]
        assert not hits, (
            "Parallel-stack violation: smoke script imports pick_best_cue "
            f"modules: {hits}.  Expected only _patrl variants."
        )


    def test_smoke_script_lazy_imports_blackjax() -> None:
        """blackjax must be imported lazily inside the fit path.

        The script must be importable/runnable (e.g. --dry-run) on a machine
        without blackjax.  Check the source: no top-level ``import blackjax``,
        and ``blackjax`` must appear only inside a function body (indented).
        """
        source = _SCRIPT.read_text(encoding="utf-8")
        # No top-level import blackjax
        for line in source.splitlines():
            stripped = line.lstrip()
            if line == stripped and (
                stripped.startswith("import blackjax")
                or stripped.startswith("from blackjax")
            ):
                pytest.fail(
                    "blackjax imported at module top-level; must be lazy "
                    f"(inside _fit).  Offending line: {line!r}"
                )


    @pytest.mark.parametrize("rel_path", _PICK_BEST_CUE_MODULES)
    def test_pick_best_cue_modules_still_compile(rel_path: str) -> None:
        """Regression canary: pick_best_cue modules must still py_compile.

        Protects against accidental co-modification of the pick_best_cue stack
        while we were editing the PAT-RL smoke.
        """
        full = _REPO_ROOT / rel_path
        assert full.exists(), f"Expected pick_best_cue module at {full}"
        py_compile.compile(str(full), doraise=True)
    ```

    === 3. Create cluster/18_smoke_patrl_cpu.slurm ===

    Mirror `cluster/16_smoke_test_cpu.slurm` structure exactly:
      - Header block with #SBATCH directives: job-name=prl_patrl18smoke,
        output=cluster/logs/patrl18smoke_%j.out, error=cluster/logs/patrl18smoke_%j.err,
        time=08:00:00, mem=64G, partition=comp, cpus-per-task=8.
      - `module load miniforge3`.
      - cd to SLURM_SUBMIT_DIR, mkdir -p cluster/logs output/patrl_smoke,
        export PYTHONUNBUFFERED=1.
      - Activate conda ds_env with the same fallback pattern (scratch/${PROJECT}/${USER}/conda/envs/ds_env).
      - Force JAX_PLATFORMS=cpu, unset CUDA_VISIBLE_DEVICES.
      - JAX_COMPILATION_CACHE_DIR at /scratch/${_PROJECT}/${USER}/.jax_cache_cpu/patrl/${SLURMD_NODENAME:-local}
        with the MIN_ENTRY_SIZE=0, MIN_COMPILE_TIME=0 env vars and mkdir fallback.
      - Export JAX_LOG_COMPILES=1.
      - Env overrides (with defaults):
          PRL_PATRL_SMOKE_LEVEL=${PRL_PATRL_SMOKE_LEVEL:-2}
          PRL_PATRL_SMOKE_N=${PRL_PATRL_SMOKE_N:-5}
          PRL_PATRL_SMOKE_TUNE=${PRL_PATRL_SMOKE_TUNE:-500}
          PRL_PATRL_SMOKE_DRAWS=${PRL_PATRL_SMOKE_DRAWS:-500}
          PRL_PATRL_SMOKE_SEED=${PRL_PATRL_SMOKE_SEED:-42}
      - Banner echo block printing job id, node, partition, MCMC scale, level,
        JAX cache dir, start time — identical style to 16_smoke_test_cpu.
      - Python preflight: `python -c "import jax; print(jax.devices()); print(jax.config.jax_enable_x64)"`.
      - Main invocation:
          ```
          python scripts/12_smoke_patrl_foundation.py \
              --level "${PRL_PATRL_SMOKE_LEVEL}" \
              --n-participants "${PRL_PATRL_SMOKE_N}" \
              --n-tune "${PRL_PATRL_SMOKE_TUNE}" \
              --n-draws "${PRL_PATRL_SMOKE_DRAWS}" \
              --seed "${PRL_PATRL_SMOKE_SEED}" \
              --output-dir "output/patrl_smoke_${SLURM_JOB_ID:-local}"
          ```
      - Capture EXIT_CODE, print PASS/FAIL banner, echo end-of-job timestamp.
      - Auto-push block at the end: git add cluster/logs/patrl18smoke_${SLURM_JOB_ID}.out/.err
        and output/patrl_smoke_${SLURM_JOB_ID}/*.csv; commit message
        "smoke patrl cpu level=${PRL_PATRL_SMOKE_LEVEL} tune=${PRL_PATRL_SMOKE_TUNE} draws=${PRL_PATRL_SMOKE_DRAWS} (job ${SLURM_JOB_ID})"
        — follow the exact git-add / git-commit / git-push pattern from
        16_smoke_test_cpu.slurm including the "No new files to push" branch.
      - Exit $EXIT_CODE.

    Why these choices:
      - CPU partition=comp mirrors the v1.2 decision (NUTS off Windows/CUDA).
      - 64G mem and 8 cpus match the 16_smoke baseline — plenty for 5 agents.
      - 08:00 walltime is generous for a 5-agent 2-level fit. Kill early if you
        see convergence; don't tighten by default.
      - Separate cache dir (`.jax_cache_cpu/patrl/...`) avoids collision with
        pick_best_cue's CPU cache.

    === 4. Delete scratch probes + commit pyproject.toml mypy override ===

    Run:
      ```
      rm _run_tests.py _run_models_tests.py _verify_loader.py _verify_yaml.py
      ```
    These are one-off verification files from earlier executor runs; contents
    have no ongoing value. Verify with `git status` that they're gone from
    the working tree (they were untracked, so no git rm needed).

    Review `git diff pyproject.toml`. The user has an uncommitted mypy
    `ignore_missing_imports` addition for `prl_hgf.*` + `config`. It is
    legitimate config cleanup (existing mypy config already has similar
    overrides) — commit it as-is. Do NOT reformat other sections of the file.

    === 5. Verify + commit Phase-18 planning artifacts ===

    a. Check whether `18-01-PLAN.md` through `18-06-PLAN.md` are in git:
       ```
       git ls-files .planning/phases/18-pat-rl-task-adaptation/*.md
       ```
       As of this plan's drafting, the PLAN.md files show as `??` (untracked)
       while their SUMMARYs are tracked. Root cause: earlier executor
       commits (`docs(18-XX): complete ...`) staged SUMMARYs but not PLANs.
       If any 18-NN-PLAN.md is NOT in git ls-files output, add it.

    b. Review `git diff .planning/ROADMAP.md` and
       `git diff .planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md`.
       If the changes are STATE-table / status-badge edits only (no code, no
       logic), commit them. If they look suspect, surface the diff in the
       summary and DO NOT commit them — defer to the user.

    Commit sequence (distinct commits, user has NO Co-Authored-By line
    preference per ~/.claude/CLAUDE.md):
      ```
      # Commit A: smoke files
      git add scripts/12_smoke_patrl_foundation.py \
              tests/test_smoke_patrl_foundation.py \
              cluster/18_smoke_patrl_cpu.slurm
      git commit -m "feat(quick-004): cluster-targeted PAT-RL foundation smoke + structural tests"

      # Commit B: scratch cleanup (--all catches the deletions of untracked
      # scratch files that were already gone from working tree, but they were
      # never tracked so this is effectively a no-op for git; if any were
      # tracked, use git rm)
      # (If _run_* / _verify_* were in git, git rm them and commit.)

      # Commit C: housekeeping
      git add pyproject.toml
      git commit -m "chore: mypy ignore_missing_imports for prl_hgf.* and config"

      # Commit D: planning doc tracking (only if staged edits are doc-only)
      git add .planning/ROADMAP.md \
              .planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md \
              .planning/phases/18-pat-rl-task-adaptation/18-01-PLAN.md \
              .planning/phases/18-pat-rl-task-adaptation/18-02-PLAN.md \
              .planning/phases/18-pat-rl-task-adaptation/18-03-PLAN.md \
              .planning/phases/18-pat-rl-task-adaptation/18-04-PLAN.md \
              .planning/phases/18-pat-rl-task-adaptation/18-05-PLAN.md \
              .planning/phases/18-pat-rl-task-adaptation/18-06-PLAN.md
      git commit -m "docs(18): track all 18-NN-PLAN.md files + roadmap/research updates"
      ```

    IMPORTANT: No "Co-Authored-By" line in ANY commit message. User's global
    CLAUDE.md explicitly overrides that default.

    After commits, `git push origin main` — per project CLAUDE.md "always push
    after committing" (cluster workflow requirement).
  </action>
  <verify>
    Run from repo root:
    ```
    # 1. Smoke script compiles + dry-run exits 0 without blackjax-dependent steps
    python -m py_compile scripts/12_smoke_patrl_foundation.py
    python scripts/12_smoke_patrl_foundation.py --dry-run --n-participants 2

    # 2. Structural tests pass
    python -m pytest tests/test_smoke_patrl_foundation.py -v

    # 3. pick_best_cue regression: the prior-phase test suite still imports
    #    and passes.  Run the pick_best_cue fitting/env modules' tests.
    python -m pytest tests/ -v --ignore=tests/test_smoke_patrl_foundation.py -x

    # 4. Scratch probes gone
    ls _run_tests.py _run_models_tests.py _verify_loader.py _verify_yaml.py 2>&1 | \
        grep -q "No such file" && echo "SCRATCH CLEAN"

    # 5. Phase-18 PLAN.md files tracked
    git ls-files .planning/phases/18-pat-rl-task-adaptation/*-PLAN.md | wc -l
    # Expect: 6

    # 6. SLURM file lints cleanly (bash -n)
    bash -n cluster/18_smoke_patrl_cpu.slurm

    # 7. No Co-Authored-By in recent commits
    git log -5 --format='%B' | grep -i "Co-Authored-By" && echo "FAIL" || echo "OK"
    ```
  </verify>
  <done>
    - `scripts/12_smoke_patrl_foundation.py` supports `--dry-run`, still supports
      full cluster mode, and py_compiles.
    - `tests/test_smoke_patrl_foundation.py` has exactly 5 structural tests; no
      `subprocess.run` MCMC invocation, no `RUN_SMOKE_TESTS` env-gate pattern;
      all 5 pass locally on Windows without blackjax.
    - `cluster/18_smoke_patrl_cpu.slurm` exists, passes `bash -n`, and follows
      the 16_smoke_test_cpu.slurm structure (conda activate ds_env, partition=comp,
      cluster/logs output, JAX cache under .jax_cache_cpu/patrl).
    - Four scratch `_run_*.py` / `_verify_*.py` files are gone from working tree.
    - `pyproject.toml` mypy override is committed.
    - All 6 `18-NN-PLAN.md` files return from `git ls-files`.
    - pick_best_cue regression test suite passes.
    - Commits have NO "Co-Authored-By" line.
    - Commits pushed to `origin/main`.
  </done>
</task>

<task type="auto">
  <name>Task 2: VB-Laplace feasibility memo</name>
  <files>
    .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md
  </files>
  <action>
    Write a decision memo, NOT code. No `src/prl_hgf/fitting/fit_vb_laplace_patrl.py`
    in this task. No new module. No tests for nonexistent code. Just the memo.

    === Required structure ===

    ```markdown
    # VB-Laplace Feasibility Memo — PAT-RL Parameter Fitting

    **Status:** Decision memo (no implementation)
    **Context:** Phase 18 foundation shipped. NUTS sampling friction observed.
    User asks: mirror matlab tapas VB-Laplace to get pipeline running?
    **Decision owner:** user (you)
    **Drafted by:** Claude, quick-004 planner → executor

    ## 1. Current sampling friction — concrete diagnosis

    What "sampling issues" actually means in this repo right now:

    - [ ] BlackJAX cold-compile walltime on cluster CPU (per STATE.md entries
          from phase 16/17: ~1174 s for 10 draws on L40S, later triaged to
          compile-dominated for short runs).
    - [ ] pyhgf JIT retrace on per-subject data shape changes (mitigated in
          quick-003 by using data-as-traced-args).
    - [ ] κ × ω₃ posterior geometry in 3-level (noted by κ-frozen workaround
          in 16_smoke_test_cpu.slurm).
    - [ ] Divergence rate in 3-level PAT-RL (untested end-to-end yet — the
          18-06 plan was meant to produce the first real numbers).
    - [ ] Windows-local NUTS portability (blackjax IS installed locally at
          1.2.4 but cluster is the intended NUTS venue).

    Fill in with observed numbers from most recent smoke logs under
    cluster/logs/. Quote actual walltime and divergence figures. Do not
    handwave.

    ## 2. tapas VB-Laplace — algorithm recap

    Reference: Mathys et al. 2011, 2014; tapas toolbox `tapas_fitModel.m`,
    `tapas_hgf_binary_config.m`, `tapas_quasinewton_optim.m`,
    `tapas_riddersmatrix.m`.

    Algorithm:
    1. Reparametrise constrained parameters to unconstrained space (logit for
       bounded, log for positive, identity for real). tapas ships this per
       config.
    2. Define negative log-joint `f(θ) = -[log p(y|θ) + log p(θ)]` in the
       unconstrained space.
    3. Quasi-Newton optimisation (tapas uses BFGS with Wolfe line search) from
       the prior mean to a MAP θ*.
    4. Numerical Hessian H at θ* via Ridders' extrapolation (5-stencil,
       central differences, error ~O(h^6)).
    5. Laplace approximation: posterior ≈ N(θ*, H^{-1}). The inverse Hessian
       is the asymptotic covariance.
    6. Transform posterior mean and covariance back to the native parameter
       space via the delta rule (Jacobian of the unconstraining transform
       evaluated at θ*).

    Output: per-subject `{mean: dict, cov: ndarray, posterior_mean_in_native: dict}`.
    Runtime: seconds to a few minutes per subject (deterministic). No chain
    diagnostics (no R̂, no divergences, no ESS — by construction).

    ## 3. Mapping onto this repo's existing logp surface

    Existing substrate (no change needed for memo; referenced for
    implementation scoping):

    - `src/prl_hgf/fitting/hierarchical_patrl.py::_build_patrl_log_posterior`
      already produces a JAX-traceable scalar `log p(θ, data)` for one
      subject, parameterised on the unconstrained θ used by the NUTS sampler.
    - That same callable composes with:
      - `jax.grad(logp)` — gradient for quasi-Newton (`jaxopt.LBFGS` or
        `scipy.optimize.minimize(method='L-BFGS-B')` with
        `jax2scipy` wrapper).
      - `jax.hessian(logp)` — exact autodiff Hessian at the mode. Cheaper,
        stabler, and more accurate than Ridders' numerical differentiation,
        and available to us because our logp is JAX-differentiable (tapas's
        matlab logp is not).

    Proposed new module (scoped, not built in this plan):
    `src/prl_hgf/fitting/fit_vb_laplace_patrl.py`
      - `fit_vb_laplace_patrl(subject_df, model_name, response_model, config)
         -> VBLaplacePosterior`
      - `VBLaplacePosterior` dataclass: `{mean_unconstrained, cov_unconstrained,
         mean_native, cov_native, logp_at_mode, n_iterations, converged}`
      - Sibling exporter `export_subject_trajectories_vb_laplace` that
        accepts the dataclass and produces the same CSV schema as the
        existing `export_subject_trajectories` (Plan 18-05) — a shim layer,
        not a fork of the exporter.

    Parallel-stack invariant: new module lives under `fitting/`, does NOT
    touch `hierarchical.py` or `hierarchical_patrl.py`. Both NUTS and
    VB-Laplace paths coexist.

    ## 4. Implementation cost estimate

    | Deliverable                                  | Scope      |
    |----------------------------------------------|------------|
    | `fit_vb_laplace_patrl.py` module             | ~200 LOC   |
    | Unit tests (optimum recovery on synthetic)   | ~120 LOC   |
    | Exporter shim to existing CSV schema         | ~60 LOC    |
    | DCM-pytorch interface compat (memo Plan 18-05)| Already compatible via (mean, cov) tuple; no DCM changes |

    One quick plan (2 tasks, wave 1). Days of Claude execution time, not
    weeks. No new dependencies (jaxopt is already in JAX ecosystem;
    `scipy.optimize` is already a transitive dep).

    ## 5. Tradeoffs vs BlackJAX NUTS

    | Dimension           | BlackJAX NUTS             | VB-Laplace                |
    |---------------------|---------------------------|---------------------------|
    | Runtime per subject | Minutes (compile-heavy)   | Seconds                   |
    | Uncertainty quality | Full posterior (multimodal-safe) | Gaussian at mode (unimodal assumption) |
    | Diagnostics         | R̂, ESS, divergences      | Convergence flag + Hessian condition number |
    | Multimodal posteriors | Handled                | Silently wrong             |
    | Pipeline readiness  | Blocked on compile/divergence | Ready in 1 quick plan |
    | Matches matlab tapas baseline | No                | Yes (useful for cross-validation) |
    | PEB-ready           | Yes (via posterior draws) | Yes (via mean + cov moments) |
    | κ × ω₃ geometry     | NUTS struggles            | Laplace ALSO struggles (ridge → poorly conditioned Hessian) — neither solves this cleanly |

    **Key honest caveat:** VB-Laplace does NOT solve the κ × ω₃ geometry
    problem. It just gives you a point estimate + approximate covariance
    faster. If the true posterior is banana-shaped or multimodal, Laplace
    will silently lie. For the 2-level model (κ not in play), this is far
    less of a concern.

    ## 6. Recommendation

    Pick ONE and justify concretely from sections 1-5:

    - **Option A:** Proceed to implement VB-Laplace in quick-005 as the
      *primary* pipeline path, restricted to 2-level for now. Deploy NUTS
      on the cluster in parallel as validation of the Laplace approximation
      on the healthy phenotype smoke. Matches tapas workflow.

    - **Option B:** Stay on BlackJAX NUTS. Fix the sampling friction in a
      follow-up (per-subject compile cache, tighter priors, blocked
      reparametrisation for ω₃×κ). Defer VB-Laplace until NUTS is proven
      infeasible on 3-level.

    - **Option C:** Implement VB-Laplace in quick-005 as a *second* fit
      path alongside NUTS. Export both; compare posteriors on shared
      smoke subjects. Both paths land in the pipeline; user selects per
      downstream analysis.

    **Recommended: Option C.** Rationale: (1) implementation cost is
    small relative to either staying-blocked on NUTS or rewriting
    downstream consumers to expect only Laplace; (2) having both paths
    lets us use Laplace to unblock PEB development while NUTS converges
    on the cluster for validation; (3) mirrors the matlab tapas norm
    (VB-Laplace default, MCMC as opt-in) which gives us a published
    comparison point; (4) the existing `_build_patrl_log_posterior` is
    already JAX-differentiable so Hessian autodiff is essentially free
    — materially better than tapas's Ridders' matrix approach.

    Only downgrade to Option A if Task 1's first real cluster run of
    `18_smoke_patrl_cpu.slurm` blows past 6h walltime or shows >20%
    divergences on 2-level. Only downgrade to Option B if VB-Laplace
    unit tests on a synthetic cohort show the Laplace covariance
    underestimating true posterior width by >2× on ω_2 (a precision
    inflation failure that would compromise PEB second-level inference).

    ## 7. Non-goals of this memo

    - No benchmarking. No timings outside section 1's recap.
    - No DISCOVERY.md. No Context7 queries. Public-knowledge algorithm recap.
    - No matlab code translation — we map onto the existing JAX logp, we do
      not port tapas line-for-line.
    - No decision on PEB implementation. That belongs in a separate phase.
    ```

    Hard requirements for the memo:
      - Section 1 MUST cite actual numbers where they exist. Check
        cluster/logs/ for recent smoke_test_cpu*.out files; pull quoted
        walltime and divergence rates if available. If no cluster logs
        exist (nothing has run yet on Phase 18), say so explicitly — do not
        fabricate.
      - Section 2 algorithm description must be complete enough that a
        reader could implement VB-Laplace from the memo alone, without
        consulting tapas source. Include the 6 steps verbatim.
      - Section 3 MUST reference
        `src/prl_hgf/fitting/hierarchical_patrl.py::_build_patrl_log_posterior`
        by exact symbol name. The claim "our logp is JAX-differentiable"
        is load-bearing — verify it by reading the function signature
        before writing the memo. If that function does not exist at that
        path, surface the mismatch and halt.
      - Section 6 MUST pick one concrete recommendation. "It depends"
        is not a recommendation.
      - Total length target: 80-250 lines. Concise, decisive.
  </action>
  <verify>
    ```
    # Memo exists and has the 7 required sections
    test -f .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md && \
        grep -c "^## " .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md
    # Expect: >= 7

    # References the real logp symbol
    grep "_build_patrl_log_posterior" \
        .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md

    # Contains a concrete recommendation
    grep -i "recommend" \
        .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md

    # pick_best_cue regression canary — memo edits must not touch source
    python -m pytest tests/ -v --ignore=tests/test_smoke_patrl_foundation.py -x

    # Commit the memo (no Co-Authored-By)
    git add .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md \
            .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/004-PLAN.md
    git commit -m "docs(quick-004): VB-Laplace feasibility memo + quick plan"
    git push origin main
    ```
  </verify>
  <done>
    - `.planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md`
      exists, has 7 sections, references `_build_patrl_log_posterior`, and
      ends with a single concrete recommendation (Option A / B / C chosen).
    - pick_best_cue test suite still passes (no source touched).
    - Memo + this PLAN.md committed and pushed, no Co-Authored-By line.
  </done>
</task>

</tasks>

<verification>

Overall plan-level checks (run after both tasks):

```bash
# 1. Smoke infrastructure is cluster-ready
bash -n cluster/18_smoke_patrl_cpu.slurm
python -m py_compile scripts/12_smoke_patrl_foundation.py
python scripts/12_smoke_patrl_foundation.py --dry-run --n-participants 2

# 2. Structural tests green
python -m pytest tests/test_smoke_patrl_foundation.py -v

# 3. Memo present and decisive
test -s .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md
grep -qi "^## 6" .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md
grep -qi "recommend" .planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/VB_LAPLACE_FEASIBILITY.md

# 4. pick_best_cue regression (MANDATORY, per constraint)
python -m pytest tests/ -v --ignore=tests/test_smoke_patrl_foundation.py

# 5. Working tree clean of scratch
ls _run_tests.py _run_models_tests.py _verify_loader.py _verify_yaml.py 2>&1 | \
    grep -c "No such file"
# Expect: 4

# 6. Phase-18 PLAN.md files tracked
[ "$(git ls-files .planning/phases/18-pat-rl-task-adaptation/*-PLAN.md | wc -l)" -eq 6 ]

# 7. No Co-Authored-By in any commit from this session
git log --since="1 hour ago" --format='%B' | grep -i "Co-Authored-By" && echo "FAIL" || echo "OK"

# 8. Pushed
git status -sb | grep -E "(ahead|behind)" && echo "NOT_PUSHED" || echo "CLEAN"
```
</verification>

<success_criteria>

- cluster/18_smoke_patrl_cpu.slurm exists, lints clean, mirrors 16_smoke_test_cpu.slurm
  structure (partition=comp, conda activate ds_env, cluster/logs output).
- scripts/12_smoke_patrl_foundation.py retained as cluster entry point, with
  --dry-run support added.
- tests/test_smoke_patrl_foundation.py contains exactly 5 structural tests
  (py_compile, invalid-level rejection, no-pick_best_cue-imports, lazy-blackjax,
  pick_best_cue-regression); no subprocess-run-MCMC.
- 4 scratch probe files deleted from repo root.
- pyproject.toml mypy override committed.
- All 6 18-NN-PLAN.md files in git ls-files.
- VB_LAPLACE_FEASIBILITY.md exists at .planning/quick/004-.../ with 7 sections,
  references _build_patrl_log_posterior, and gives a single concrete
  recommendation.
- pick_best_cue test suite passes (regression protection holds).
- All commits pushed to origin/main with NO "Co-Authored-By" lines.

</success_criteria>

<output>
After completion, create `.planning/quick/004-patrl-smoke-and-vb-laplace-feasibility/004-SUMMARY.md`
capturing:
  - What shipped (cluster smoke SLURM, revised smoke script, 5-test structural suite, memo).
  - What was deleted (4 scratch probes).
  - Recommendation chosen by the VB-Laplace memo (quote section 6 verbatim).
  - Next-step pointer: "If memo's recommendation is Option A or C, open
    quick-005 to implement fit_vb_laplace_patrl.py. Otherwise keep driving
    BlackJAX NUTS on cluster via sbatch cluster/18_smoke_patrl_cpu.slurm."
</output>
