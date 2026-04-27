# Phase 25 — Parallel-scan acceleration of HGF likelihood evaluation: research, theoretical-validation, and prototype

**Status:** Not planned yet (run `/gsd:plan-phase 25` to break down)
**Milestone:** Out-of-cycle research (parallel to v1.3); candidate for v1.4 promotion if 24-06 verdict is positive
**Created:** 2026-04-27

## Goal

Investigate, theoretically validate, and prototype log-depth parallel-scan
methods for HGF likelihood evaluation, replacing the trial-axis O(T)
sequential `lax.scan` with an O(K log T) iterated-linearization scheme.

Targets: scaling HGF to T ≫ 420 (longitudinal / continuous-time / 4-level
HGF), branched/multimodal HGFs, trial-varying parameters, online inference,
and population-level hierarchical pooling — none of which are tractable
with the current sequential per-trial evaluation.

This is a **research phase, not a production phase**. Execution is
literature-first with theoretical validation gates before any code is
written. Implementation prototype is the LAST sub-phase, gated on
positive theory verdict.

## Context — what came before

- **Phase 14.2 variants 1–5** (current) attack the *current* problem:
  NUTS sample-bound at production P=300, max_tree_depth saturating, 12–15h
  window_adaptation. Variants 1–5 are mechanism-driven local fixes
  (commits 0055408, 3995412, f4f17ef, d23af36, 385e8c3, 6c4da42, f5a5b83,
  f35698f).
- Phase 14.2 left parallel-scan / DEER as Tier 4 / deferred research.
  Sister-repo `rlwm_trauma_analysis` had `affine_scan` for Q-learning
  (`core.py:332`); CPU benchmark was 0.26× (slower); GPU never measured.
  Does NOT directly transfer to HGF because HGF level-2 update has
  state-dependent coefficients (sigmoid Jacobian on previous μ_2). Also
  does NOT couple HGF level-3 multiplicatively.
- **Phase 25 attacks the *next* problem**: per-evaluation cost of the
  trial-axis scan, which becomes load-bearing as the model grows in any
  of 5 directions: longer T, branched/multimodal, trial-varying θ,
  hierarchical pooling, online inference.

## Critical literature (NOT assumed complete)

The user explicitly asked us to do MORE research first because we don't
know if our first assumptions are complete. Recent papers (all from the
Linderman lab at Stanford, 2024–2025) have already moved past vanilla
DEER:

1. **Lim et al. 2023, "Parallelizing non-linear sequential models over the
   sequence length"** (arXiv:2309.12252) — original DEER. Reference point
   only; current SOTA has improved on it.

2. **Gonzalez, Warrington, Smith, Linderman 2024 (NeurIPS),
   "Towards Scalable and Stable Parallelization of Nonlinear RNNs"** —
   introduces ELK = quasi-Newton + Levenberg-Marquardt + Kalman smoothing.
   Solves DEER's two practical bottlenecks: cubic complexity in state
   dim, numerical instability from full Newton steps. **THIS IS WHAT TO
   IMPLEMENT, NOT VANILLA DEER.**
   <https://proceedings.neurips.cc/paper_files/paper/2024/hash/0b2b199fdd52089b31d3a0120e400b2a-Abstract-Conference.html>

3. **Zoltowski, Wu, Gonzalez, Kozachkov, Linderman, Aug 2025, arXiv:2508.18413,
   "Parallelizing MCMC Across the Sequence Length"** — the MOST DIRECTLY
   RELEVANT paper. Decomposes sequential MCMC dependencies so chains can
   be parallelized across sequence positions, not just across chains. The
   parallel-NUTS-for-SSM result HGF would inherit from.
   <https://arxiv.org/pdf/2508.18413>

4. **Gonzalez, Kozachkov, Zoltowski, Clarkson, Linderman, Aug 2025,
   arXiv:2508.16817, "Predictability Enables Parallelization of Nonlinear
   State Space Models"** — theoretical paper. Proves nonlinear SSMs whose
   trajectories are locally predictable / contractive admit parallel scan
   with log-depth. Convergence guarantees. Need to verify HGF satisfies
   these conditions.
   <https://arxiv.org/pdf/2508.16817>

5. **Gonzalez et al., Sept 2025, arXiv:2509.21716, "A Unifying Framework
   for Parallelizing Sequential Models with Linear Dynamical Systems"** —
   unifies Newton, Jacobi, trust-region, ELK under common framework.
   Practical guidance: which parallelization strategy for which problem
   structure.
   <https://arxiv.org/pdf/2509.21716>

6. **Sarkka & Garcia-Fernandez 2021, "Parallel Kalman filtering and
   smoothing using the parallel scan algorithm"** — original linear-
   Gaussian parallel Kalman. Applies if HGF is linearized.

7. **Mathys et al. 2014, "Uncertainty in perception and the Hierarchical
   Gaussian Filter"** — HGF derivation. HGF's per-trial update is ALREADY
   a Laplace-linearized Gaussian filter; we'd be applying parallel scan
   to that linearization.

## Open research questions (must answer in 25-01 before any implementation)

- Does HGF satisfy the predictability/contraction conditions of paper #4?
  Sigmoid + exp dynamics are bounded, so likely yes, but need to check
  the formal definitions.
- Does the Zoltowski et al. parallel-MCMC framework #3 directly apply to
  HGF, or does HGF's specific structure (3-level, multiplicative
  cross-level coupling, sigmoid observation) require adaptation?
- ELK (paper #2) uses Kalman smoothing. HGF is already a Kalman-style
  filter under Laplace approximation — does the ELK formulation collapse
  to something simpler for HGF, or is it strictly additional structure?
- For trial-varying θ (PAT-RL Model D's λ·ΔHR(t)), do the per-trial
  Jacobians stay state-independent given the reference trajectory, or
  does the covariate dependence introduce new state-dependent
  nonlinearities?
- For branched/multimodal HGF, does the cross-branch coupling preserve
  contraction? This affects K (iteration count) for ELK convergence.

## Scope guardrails

- This is a research phase. Implementation in 25-04 is a PROTOTYPE for
  validation, not a production drop-in.
- HGF math is preserved. We are accelerating evaluation, not changing the
  model. Numerical agreement with sequential `lax.scan` must be <1e-5
  relative on every test.
- No assumption that sister-repo `affine_scan` translates. It doesn't
  (HGF is nonlinear). We're researching the right thing FOR HGF.
- Validation against pyhgf canonical sequential output is mandatory
  before any decision to productionize.

## Proposed sub-phase breakdown

### 25-00: Phase research synthesis (literature read + summary)

Read all 7 papers, write `RESEARCH.md` with:
1. DEER → ELK → parallel-MCMC → predictability progression timeline
2. Which paper's results map to which HGF use case (longer T, branched,
   trial-varying θ, online, hierarchical pooling)
3. Explicit list of theoretical conditions HGF must satisfy
4. Gaps where HGF-specific work would be needed
5. Decision: ELK vs vanilla DEER vs Zoltowski-MCMC vs hybrid

### 25-01: Theoretical validation — predictability / contraction proof

Verify HGF satisfies the conditions in arXiv:2508.16817 (paper #4).
Specifically:
- Compute the Lipschitz constant of f_HGF over typical posterior regions.
  Does it satisfy the contraction property?
- For (μ_2, σ_2, μ_3, σ_3) state, is the Jacobian spectral norm < 1 in
  typical operating regimes?
- Document failure modes (regimes where contraction breaks — likely
  large |μ_2| or extreme volatility).

**Output:** `THEORETICAL_VALIDATION.md` with proof sketch + numerical
Lipschitz constant scan over posterior support.

**Gate:** positive verdict required to proceed to 25-02. Negative verdict
triggers fallback (parallel scan only on contracting regions, sequential
elsewhere).

### 25-02: Algorithm selection memo

Read paper #5 (unifying framework). Decide between:
- (a) ELK (paper #2) — quasi-Newton + LM + Kalman smoothing
- (b) Vanilla DEER (paper #1) — full Newton, simpler but unstable
- (c) Zoltowski parallel-MCMC (paper #3) — direct MCMC parallelization
- (d) Hybrid: ELK for forward likelihood, sequential MCMC

Decision based on (a) HGF state dim (small, d=4–12), (b) target T
regime, (c) implementation complexity, (d) JAX expressivity.

**Output:** `ALGORITHM_DECISION.md` naming the chosen approach with
rationale.

### 25-03: Reference-implementation reproduction

Reproduce ONE published result before touching HGF. Replicate the toy
benchmark from chosen paper (e.g., the 1-D Kushner-Stratonovich
experiment from paper #2 ELK paper, or the SSM benchmark from paper #3).
Establish that:
1. We can build the algorithm correctly in JAX
2. GPU vs CPU profile matches the paper's published numbers
3. The convergence rate (K iterations to ε-tolerance) matches the
   paper's claims

**Output:** `REPRODUCTION_NOTES.md` with comparison numbers.

**Gate:** must match published numbers within published tolerance.

### 25-04: HGF prototype

Lift HGF's per-trial update equations from `pyhgf.Network.scan_fn`,
compute symbolic / autodiff Jacobians at reference points, build
(A_t, b_t) construction, wire into chosen algorithm
(`jax.lax.associative_scan` for ELK, or whatever 25-02 selected).

Validate:
1. Numerical agreement with pyhgf sequential output: <1e-5 relative
   error on log-likelihood for fixed θ over a simulated PRL cohort
   (use existing Phase 14.2 sim infrastructure).
2. Iteration count K to converge: target K < 5 for typical posterior
   regimes (from 25-01 Lipschitz scan).
3. Per-eval wall: GPU vs sequential lax.scan, both at production shape
   (P=50, T=420 single-cohort, P=300 full).

**Output:** a single benchmark JSON in
`results/diagnostics/hgf_pscan_proto.json` and a Markdown summary table.

### 25-05: Posterior-validity check

Differentiability gate: validate `jax.grad` flows through the
parallel-scan likelihood cleanly (the iterative-linearization fixed-point
is the wrinkle). Compose with NUTS, run a parameter-recovery test on
simulated cohort:
1. Recovery RMSE for ω_2, ω_3 (where applicable), β, ζ
2. ESS / R-hat per parameter
3. Divergence count

Compare against sequential-lax-scan NUTS (Phase 14.2 baseline) on the
SAME simulated cohort. Must match within MCMC noise (recovery RMSE
within 5%, no new divergences).

**Output:** `RECOVERY_COMPARISON.md`.

**Gate:** pass required to proceed to 25-06.

### 25-06: Productionization decision

Synthesize 25-00..25-05 into a verdict:
1. Is parallel-scan HGF ready to replace sequential lax.scan as the
   default likelihood path?
2. What's the speedup at production shape? Phase 14.2 variants 1–5 set
   the bar; parallel-scan must exceed it on the non-trivial use cases
   (branched, trial-varying, longer T).
3. What user-facing API change does this require?

**Output:** `PRODUCTIONIZATION_VERDICT.md`.

## Exit criteria (phase complete)

- [ ] All 7 papers read and synthesized in `RESEARCH.md`
- [ ] HGF contraction property either proved or empirically validated,
      with failure-mode documentation
- [ ] One published result reproduced (25-03)
- [ ] HGF parallel-scan prototype passes numerical-agreement gate
      (<1e-5 vs sequential)
- [ ] Parameter-recovery comparison shows no new pathologies
- [ ] Productionization decision documented with explicit speedup
      numbers and conditions

## Non-goals (explicitly out of scope)

- Replacing sequential `lax.scan` as the production default — that's a
  follow-on phase IF 25-06 verdict is positive.
- Implementing branched/multimodal HGF or trial-varying θ extensions —
  those are separate phases that would BENEFIT from parallel scan but
  aren't blocked by it.
- Online / streaming inference — also a separate phase.
- Extending to PAT-RL: prototype on the simpler PRL `pick_best_cue`
  binary HGF first. PAT-RL adds the binary-state and 2x2 magnitude
  structure which can be ported in a follow-on.

## Dependencies

- Phase 14.2 must complete first. Specifically, variants 1–5 must have
  produced clean comparison numbers so we know parallel scan is
  attacking the *next* problem and not redundant with the easy wins.
- Cluster GPU compute is needed for 25-03 reproduction and 25-04
  prototype timing.
- jaxopt and BlackJAX already dependencies; `jax.lax.associative_scan`
  is in JAX core. Likely no new deps.

## Expected duration

3–5 weeks of research-pace work (NOT execution-pace). Per-sub-phase:
- 25-00 research synthesis: 3–5 days literature read + writeup
- 25-01 theoretical validation: 1 week proof sketch + Lipschitz scan
- 25-02 algorithm decision: 2 days
- 25-03 reproduction: 1 week
- 25-04 prototype: 1–2 weeks
- 25-05 posterior validity: 3–5 days
- 25-06 verdict: 2 days
