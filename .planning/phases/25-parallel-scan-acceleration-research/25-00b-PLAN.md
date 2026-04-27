---
phase: 25-parallel-scan-acceleration-research
plan: "00b"
type: execute
wave: 1
depends_on: []
files_modified: []
files_created:
  - .planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md
  - .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py
  - .planning/phases/25-parallel-scan-acceleration-research/25-00b-SUMMARY.md
autonomous: false
requirements: []

must_haves:
  truths:
    - "API_BRIDGING_STUDY.md documents the exact pyhgf state-shape (which keys of the attributes dict carry mu_2, sigma_2, mu_3, sigma_3 for the binary 3-level HGF) extracted by inspection of pyhgf 0.2.8 source, NOT guessed from docs"
    - "Three candidate APIs are mapped onto the HGF per-trial update: (a) EEA-sensors sqrt-parallel-smoothers (transition_function(x_t, Q) + observation_function(x_t, R)), (b) lindermanlab/elk (RNN-style f(state)), (c) jax.lax.associative_scan with custom operator"
    - "For each candidate API a feasibility verdict (FEASIBLE / FEASIBLE-WITH-EFFORT / INFEASIBLE) is recorded with explicit reasons (e.g. 'pyhgf attributes is dict-of-dicts, must flatten to (mu_2, sigma_2, mu_3, sigma_3) tuple via tree_util.tree_flatten')"
    - "A working scratch probe (scratch/api_bridging_probe.py) demonstrates extracting one trial's update from pyhgf and re-expressing it as a pure f(state, input) -> state' function, with numerical agreement to pyhgf's scan_fn output (rel-err < 1e-10) on >= 5 trials of a synthetic binary cohort"
    - "Top-line recommendation: which of (a), (b), (c) to default to in 25-04 prototype, with rationale that 25-02 algorithm-selection memo can cite"
    - "Risk register: at least 3 risks identified (e.g. closure-over-data leakage, dict-of-dicts vs tuple state, in-place mutation of pyhgf attributes vs functional state-passing)"
  artifacts:
    - path: ".planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md"
      provides: "API mapping memo: pyhgf state shape, three-candidate API feasibility verdicts, recommended default for 25-04"
      contains: "transition_function"
    - path: ".planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py"
      provides: "Executable probe extracting one HGF trial update as a pure function and verifying numerical agreement with pyhgf scan_fn"
      contains: "def hgf_step"
  key_links:
    - from: ".planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md"
      to: "pyhgf.math.binary_hgf"
      via: "Documented call-graph of the 3-level binary HGF per-trial update equations as found in pyhgf 0.2.8"
      pattern: "binary_hgf|continuous_node_posterior_update"
    - from: ".planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py"
      to: "src/prl_hgf/fitting/ops.py::scan_fn"
      via: "Numerical agreement check vs production sequential scan output"
      pattern: "lax.scan|scan_fn"
---

<objective>
Produce the API bridging study `API_BRIDGING_STUDY.md`: map pyhgf's Network/attributes
dict-of-dicts state representation onto the three candidate parallel-scan APIs
(EEA-sensors sqrt-parallel-smoothers, lindermanlab/elk, jax.lax.associative_scan
with custom operator) BEFORE the theoretical proof and BEFORE algorithm selection.
This is engineering-feasibility scouting; it can fail (incompatible APIs) and would
block 25-03/25-04 unexpectedly if not surfaced early.

Researcher recommendation (from 25-RESEARCH.md §7) explicitly added this sub-phase
because PHASE_DESCRIPTION.md jumped from literature synthesis straight to theoretical
proof without confirming the engineering pathway exists. PIEKS expects
`transition_function(x_t, Q)` + `observation_function(x_t, R)` with explicit Gaussian
covariances; pyhgf stores state as a dict-of-dicts (`attributes`). The bridging layer
is non-trivial and must be scouted before committing to any algorithm.

**In scope:**
- Inspect pyhgf 0.2.8 source (locate via `python -c "import pyhgf; print(pyhgf.__file__)"`)
  to find the binary 3-level HGF per-trial update equations. Likely entry points:
  `pyhgf.math.binary_hgf`, `pyhgf.utils.beliefs_propagation`,
  `pyhgf.updates.posterior.continuous_node_posterior_update`. Document the exact
  signatures and which fields of the `attributes` dict carry mu_2, sigma_2, mu_3,
  sigma_3.
- Build a scratch probe (`scratch/api_bridging_probe.py`) that:
  - Loads `configs/prl_analysis.yaml` (binary HGF / pick_best_cue is the simpler
    starting target per PHASE_DESCRIPTION.md non-goals — PAT-RL bridging is deferred).
  - Generates a small synthetic 1-participant cohort (T = 50 or so, sufficient).
  - Runs pyhgf's `scan_fn` sequentially to get reference per-trial state trajectory.
  - Re-expresses ONE trial's update as a pure function `hgf_step(state, input) -> state'`
    where `state = (mu_2, sigma_2, mu_3, sigma_3)` is a flat tuple (NOT dict-of-dicts).
  - Loops `hgf_step` over the inputs and confirms numerical agreement with pyhgf's
    `scan_fn` output to rel-err < 1e-10 on every trial.
- For each of the three candidate APIs (sqrt-parallel-smoothers, elk, custom
  associative_scan), state explicitly:
  - What signature `hgf_step` would need to match
  - What additional structure the API requires (Q, R covariances; reference trajectory;
    Jacobian function)
  - Feasibility verdict (FEASIBLE / FEASIBLE-WITH-EFFORT / INFEASIBLE) with reasons
- Identify risks: closure-over-data leakage (the Phase 21 STATE #106/107 pattern),
  in-place mutation in pyhgf vs functional state-passing required by associative_scan,
  dict-of-dicts vs tuple state representation overhead, etc.

**Explicitly NOT in scope:**
- Implementing the full parallel scan (that's 25-04).
- Computing Jacobians or Lipschitz constants (that's 25-01).
- Choosing between PIEKS / ELK / DEER (that's 25-02 — this study INFORMS the choice
  by surfacing engineering feasibility, but does not make the algorithm decision).
- Touching production code under `src/prl_hgf/`. All work lives in the phase
  directory under `scratch/`.
- PAT-RL bridging — start with pick_best_cue binary 3-level HGF per
  PHASE_DESCRIPTION.md non-goals.

**Why autonomous: false.** This task involves engineering judgment calls (which
fields of the attributes dict to lift, how to flatten the state, which API to
recommend). A checkpoint at the end lets the user review the recommendation
before 25-02 cites it.

Purpose: Surface engineering blockers early so 25-02 can choose an algorithm with
known feasible API path, and 25-04 prototype work doesn't discover an unbridgeable
API gap on day 3.

Output:
- `.planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md`
- `.planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py`
- `.planning/phases/25-parallel-scan-acceleration-research/25-00b-SUMMARY.md`
</objective>

<execution_context>
@C:\Users\aman0087\.claude\get-shit-done\workflows\execute-plan.md
@C:\Users\aman0087\.claude\get-shit-done\templates\summary.md
</execution_context>

<context>
@.planning/PROJECT.md
@.planning/ROADMAP.md
@.planning/STATE.md
@.planning/phases/25-parallel-scan-acceleration-research/PHASE_DESCRIPTION.md
@.planning/phases/25-parallel-scan-acceleration-research/25-RESEARCH.md
@src/prl_hgf/fitting/ops.py
@src/prl_hgf/fitting/hierarchical.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Inspect pyhgf source and build scratch API probe</name>
  <files>
    .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py
  </files>
  <action>
  Local CPU-only engineering scouting. No GPU, no cluster.

  Step 1 - Locate pyhgf source:
    - `python -c "import pyhgf, os; print(os.path.dirname(pyhgf.__file__))"`
    - Confirm version is 0.2.8 (per CLAUDE.md architecture decisions).
    - Inspect `pyhgf/math.py` (or `pyhgf/math/binary_hgf.py` depending on layout)
      for the binary HGF per-trial update equations.
    - Inspect `pyhgf/utils.py` (or `pyhgf/utils/beliefs_propagation.py`) for the
      `beliefs_propagation` function — this is the per-trial scan body.
    - Inspect `pyhgf/updates/posterior/` for `continuous_node_posterior_update` and
      its sub-functions (`posterior_update_mean_continuous_node`,
      `posterior_update_precision_continuous_node`).
    - Document the exact call graph: which function calls which, where the
      attributes dict is read/written, where the level-2 sigmoid update happens,
      where the level-3 volatility coupling happens.

  Step 2 - Build the scratch probe at
  `.planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py`:

  ```python
  # Outline only - executor fills in actual pyhgf calls
  import jax
  import jax.numpy as jnp
  from prl_hgf.config_loaders import load_pick_best_cue_config
  # ... pyhgf imports
  # ... build a Network for binary 3-level HGF (1 participant)
  # ... generate synthetic input (50 trials of 0/1 outcomes)

  # Reference: run pyhgf scan_fn sequentially
  reference_trajectory = run_pyhgf_sequential(network, inputs)
  # reference_trajectory = list of attributes dicts, one per trial

  # Lift: extract a single trial update as a pure function
  def hgf_step(state, input_t):
      # state = (mu_2, sigma_2, mu_3, sigma_3) flat tuple
      # input_t = scalar binary outcome
      # body of pyhgf's per-trial update, pulled out and made pure
      ...
      return new_state, output

  # Verify numerical agreement
  state = initial_state(network)
  for t, inp in enumerate(inputs):
      state, _ = hgf_step(state, inp)
      ref_state = extract_state_from_attrs(reference_trajectory[t])
      rel_err = jnp.max(jnp.abs(jnp.array(state) - jnp.array(ref_state))
                        / (jnp.abs(jnp.array(ref_state)) + 1e-12))
      assert rel_err < 1e-10, f"Trial {t} mismatch: {rel_err}"

  print(f"All {len(inputs)} trials match within rel-err 1e-10. OK.")
  ```

  The probe must:
  - Run end-to-end on CPU (no JIT necessary for the probe; clarity > speed).
  - Print a clear pass/fail message.
  - Document in comments WHICH pyhgf functions were lifted and how the state was
    flattened from dict-of-dicts to flat tuple.

  Step 3 - If the probe FAILS (numerical disagreement, or pyhgf's update has
  hidden side effects that prevent extraction):
    - Document the failure mode in `API_BRIDGING_STUDY.md`.
    - Surface as an INFEASIBLE-WITHOUT-FORK verdict for that approach.
    - The phase does NOT halt; the study documents the gap and 25-02 chooses
      an algorithm whose API constraints are different.

  Step 4 - Verify probe runs:
    - `python .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py`
    - Expected output: "All N trials match within rel-err 1e-10. OK." or a clear
      failure message that gets recorded in the study memo.
  </action>
  <verify>
  1. `ls .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py`
     exits 0.
  2. `python .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py`
     runs to completion (success or documented failure).
  3. `grep -c "def hgf_step" .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py`
     >= 1 (the lifted pure-function form is present).
  4. `grep -c "rel_err" .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py`
     >= 1 (numerical-agreement check is wired).
  </verify>
  <done>
  Probe exists, runs, demonstrates either successful extraction (rel-err < 1e-10
  on >= 5 trials) or a clearly-documented failure mode that informs the study memo.
  </done>
</task>

<task type="auto">
  <name>Task 2: Write API_BRIDGING_STUDY.md mapping pyhgf state to three candidate APIs</name>
  <files>
    .planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md
  </files>
  <action>
  Write the bridging study memo capturing the engineering analysis from Task 1.

  Required sections:

  (1) Executive summary (3-5 bullets):
    - Did the lift-to-pure-function probe succeed at rel-err < 1e-10? (Y/N)
    - Which of (a) sqrt-parallel-smoothers, (b) elk, (c) custom associative_scan
      is the recommended default for 25-04 prototype?
    - One-sentence reason for the recommendation.
    - One-sentence statement of the largest engineering risk identified.

  (2) pyhgf state-shape inventory:
    - Path of pyhgf source on this machine (`python -c "import pyhgf, os;
      print(os.path.dirname(pyhgf.__file__))"`).
    - Version: 0.2.8 (CLAUDE.md confirms).
    - Call graph of the binary 3-level HGF per-trial update (function-by-function
      from `beliefs_propagation` down through `continuous_node_posterior_update`
      and its precision/mean sub-functions).
    - Table mapping pyhgf attributes-dict keys to flat state tuple components:
      | pyhgf path                     | math symbol | flat-tuple index |
      |--------------------------------|-------------|------------------|
      | attributes[2]['expected_mean'] | mu_2_pred   | 0                |
      | attributes[2]['expected_precision'] | pi_2_pred | 1            |
      | attributes[3]['expected_mean'] | mu_3_pred   | 2                |
      | attributes[3]['expected_precision'] | pi_3_pred | 3            |
      (Exact keys to be filled in from Task 1 inspection.)

  (3) Candidate API (a): EEA-sensors sqrt-parallel-smoothers
    - Repo: https://github.com/EEA-sensors/sqrt-parallel-smoothers
    - Required signature: `transition_function(x_t, Q)` + `observation_function(x_t, R)`
      where Q, R are explicit Gaussian noise covariances.
    - Mapping to HGF:
      - `transition_function(x_t)`: corresponds to HGF's level-3 -> level-2 prediction
        step (volatility-driven prior update for mu_2_pred, pi_2_pred from previous
        mu_3, pi_3).
      - `observation_function(x_t)`: corresponds to HGF's binary observation update
        (sigmoid + posterior mean/precision update).
      - Q, R: HGF's noise structure is implicit in the omega_2, omega_3 parameters;
        these would map to time-homogeneous Q (driven by exp(kappa*mu_3 + omega_2))
        and observation R (Bernoulli variance, state-dependent).
    - Feasibility verdict: FEASIBLE / FEASIBLE-WITH-EFFORT / INFEASIBLE — fill in
      based on Task 1 findings.
    - Effort estimate (relative): "X days of bridging code in 25-04".
    - Pros: square-root form enforces sigma > 0, native covariance propagation,
      semantically natural for HGF (which IS a Gaussian filter).
    - Cons: rigid Q/R signature; HGF's state-dependent transition variance may
      require a wrapper.

  (4) Candidate API (b): lindermanlab/elk
    - Repo: https://github.com/lindermanlab/elk
    - Required signature: RNN-style `f(state)` (no covariances; point estimates).
    - Mapping to HGF:
      - `f((mu_2, sigma_2, mu_3, sigma_3)) -> (mu_2', sigma_2', mu_3', sigma_3')`.
      - Closer to pyhgf's `scan_fn` signature than (a) — sigma is just another
        state component, not a covariance.
      - Need to provide `jax.jacobian(f)` or hand-coded diagonal approximation for
        the quasi-ELK fast path.
    - Feasibility verdict: ...
    - Pros: API is closer to pyhgf's `scan_fn`; bridging is shallower.
    - Cons: loses Gaussian uncertainty propagation; sigma must be tracked manually;
      Levenberg-Marquardt trust-region requires a per-state metric (e.g. inverse
      Fisher) we'd need to define.

  (5) Candidate API (c): jax.lax.associative_scan with custom operator
    - JAX core; no new deps.
    - Required: define an associative operator combining two trial-blocks into one
      (per Sarkka & Garcia-Fernandez 2021).
    - Mapping to HGF: high implementation risk; the associative operator for
      iterative-linearization (PIEKS) is non-trivial.
    - Feasibility verdict: typically FEASIBLE-WITH-EFFORT (high effort).
    - Pros: full control; no external library dependency.
    - Cons: highest implementation cost; requires re-deriving the associative
      operator and validating it independently of any reference impl.

  (6) Risk register (table, at least 3 risks):
    | Risk | Severity | Mitigation |
    |------|----------|------------|
    | pyhgf attributes is dict-of-dicts; flattening to tuple loses metadata | MEDIUM | Document key->index mapping in Section 2; lock it in 25-04 |
    | Closure-over-data pattern (Phase 21 STATE #106/107) may make the lift impure | HIGH | Probe explicitly tests purity; if fails, switch to functional rewrite of beliefs_propagation |
    | pyhgf functions decorated with @partial(jit, ...); JAX inside JAX may break tracing | MEDIUM | Probe runs in eager mode (no JIT) to avoid; 25-04 must verify JIT safety |
    | (more as discovered in Task 1) | ... | ... |

  (7) Recommendation:
    - "For 25-04 prototype, default to candidate (X)."
    - Rationale (3-5 sentences) citing Section 3-5 verdicts and Section 6 risks.
    - State that 25-02 algorithm-selection memo will lock this decision after
      considering theoretical preferences (PIEKS vs ELK trade-offs from
      25-RESEARCH.md §4) alongside this engineering feasibility.

  (8) Appendix:
    - Path to scratch probe: `scratch/api_bridging_probe.py`.
    - Pasted output of the probe run (or failure log).
    - Cross-reference to 25-RESEARCH.md §4 (HGF-Specific Implementation Candidates).

  Keep memo under ~500 lines. Markdown only.
  </action>
  <verify>
  1. `ls .planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md` exits 0.
  2. `grep -c "transition_function" .planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md` >= 1.
  3. `grep -c "FEASIBLE" .planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md` >= 3 (one verdict per candidate).
  4. `grep -c "Risk" .planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md` >= 1 (risk register present).
  5. `grep -ci "recommend" .planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md` >= 1 (recommendation section present).
  </verify>
  <done>
  API_BRIDGING_STUDY.md exists with all 8 sections, three feasibility verdicts
  documented, risk register populated, recommendation made. 25-02 has an
  engineering-feasibility input to cite alongside theoretical preferences.
  </done>
</task>

<task type="checkpoint:human-verify" gate="blocking">
  <what-built>
  API bridging study memo and scratch probe demonstrating that pyhgf's per-trial
  HGF update CAN (or CANNOT) be lifted to a pure `f(state, input) -> state'`
  function compatible with at least one of three candidate parallel-scan APIs.
  Recommendation made for which API to default to in 25-04 prototype.
  </what-built>
  <how-to-verify>
  1. Read `.planning/phases/25-parallel-scan-acceleration-research/API_BRIDGING_STUDY.md`
     end to end. Check:
     - Does the recommendation section name a single default API?
     - Are the three feasibility verdicts justified by specific engineering
       concerns (not hand-waved)?
     - Does the risk register flag at least 3 concrete risks?
  2. Run the scratch probe:
     `python .planning/phases/25-parallel-scan-acceleration-research/scratch/api_bridging_probe.py`
     Verify it prints "All N trials match within rel-err 1e-10. OK." or a
     clearly-documented failure that the study memo addresses.
  3. Sanity-check the recommendation: does the chosen API match what 25-RESEARCH.md
     §4 recommends as Candidate 1 (sqrt-parallel-smoothers), or does this study
     surface engineering reasons to prefer a different choice?
  4. Confirm 25-02 has enough information to make the algorithm choice with
     engineering feasibility known (not just theoretical preference).
  </how-to-verify>
  <resume-signal>Type "approved" to unblock 25-01 (Wave 2 per dependency); 25-02 will unblock after 25-01's PASS verdict. Or describe revisions needed.</resume-signal>
</task>

</tasks>

<verification>
1. `API_BRIDGING_STUDY.md` is on disk with all required sections.
2. `scratch/api_bridging_probe.py` runs to completion and prints pass/fail message.
3. Three feasibility verdicts are documented (one per candidate API).
4. Risk register lists >= 3 concrete risks with severity and mitigation.
5. Top-line recommendation names which API to default to in 25-04.
6. User has approved the checkpoint.
</verification>

<success_criteria>
- 25-02 algorithm-selection memo can cite engineering feasibility findings from
  this study alongside the theoretical preferences from 25-RESEARCH.md.
- 25-04 prototype work begins with a known-feasible API path; no surprise
  unbridgeable gap on day 3.
- No production code touched (`git diff --stat src/` shows zero lines changed).
</success_criteria>

<output>
After completion, create `.planning/phases/25-parallel-scan-acceleration-research/25-00b-SUMMARY.md`
with: probe pass/fail summary, the recommended default API for 25-04, the single
largest risk identified, and pointers to the study memo and scratch probe.
</output>
</content>
