# Algorithm Decision: Parallel-Scan for HGF Likelihood Evaluation

**Phase:** 25-parallel-scan-acceleration-research
**Plan:** 25-02
**Date:** 2026-04-27
**Synthesizes:** API_BRIDGING_STUDY.md (25-00b) + THEORETICAL_VALIDATION.md (25-01)
**Decides:** Which parallel-scan algorithm to prototype in 25-03/25-04

---

## 1. Executive Summary

- **Chosen algorithm:** ELK (quasi-ELK, diagonal-Jacobian variant; lindermanlab/elk)
- **One-sentence reason:** With empirical λ̂ = −0.0132 (weakly contracting, 76% of trials
  with transient spectral radius ≥ 1), ELK's Levenberg-Marquardt trust radius is not
  optional but required for numerical safety during NUTS warm-up, and its API maps to
  `hgf_step` without structural decomposition — the 3–4 day PIEKS bridging overhead is
  not justified by the marginal covariance-propagation benefit at this λ̂ magnitude.
  (Verdict from API_BRIDGING_STUDY.md: ELK=FEASIBLE ~1-2 days; PIEKS=FEASIBLE-WITH-EFFORT
  ~3-4 days.)
- **Reference paper for 25-03:** Yaghoobi, Corenflos, Hassan, Sarkka 2021 (arXiv:2102.00514),
  Section 5 "Coordinated Turn Model" — D=4, T=500, GPU speedup benchmark. This is the
  closest published configuration to HGF (D=4, T=420); 25-03 reproduces the parallel
  speedup trend, not ELK's own benchmark.
  *Rationale for this choice:* Even though ELK is chosen for 25-04, PIEKS's D=4/T=500
  benchmark provides the most relevant reference point for HGF's parameter regime.
  25-03 reproduction of PIEKS at D=4/T=500 establishes the GPU breakeven baseline;
  25-04 then prototypes ELK against the same baseline.
- **T=420 production speedup expectation:** 0.5–2× on GPU (marginal; cite §9 of
  25-RESEARCH.md). T=420 is near the GPU breakeven; no CPU speedup is expected.
- **T>>420 future speedup expectation:** 5–20× on GPU for T ≥ 1000–2000 (cite §9 of
  25-RESEARCH.md and PIEKS paper D=4 curve). This is the primary Phase 25 motivation.

---

## 2. Candidate (a): ELK

**Paper:** Gonzalez, Warrington, Smith, Linderman. NeurIPS 2024. arXiv:2407.19115.
**Reference impl:** https://github.com/lindermanlab/elk (JAX-native, published, maintained)

**Algorithm summary.** ELK solves the nonlinear recursion `s_t = f(s_{t-1})` iteratively
by treating it as a fixed-point problem. At each Newton iteration, it (1) linearizes
`f` at the current trajectory estimate to obtain time-varying matrices A_t, b_t;
(2) solves the resulting linear SSM in O(log T) depth via `jax.lax.associative_scan`;
(3) updates the trajectory estimate using the Kalman smoother output. The key innovation
over vanilla DEER is the Levenberg-Marquardt (LM) trust region, which clips the Newton
step when the Jacobian is ill-conditioned or has eigenvalues near or above 1. The
quasi-ELK fast path replaces the full D×D Jacobian with its diagonal approximation,
reducing per-step cost from O(D³) to O(D).

**Decision criteria:**

| Criterion | Value | Source |
|-----------|-------|--------|
| Convergence K (HGF, λ̂=−0.013) | 8–15 for 1e-5 tol; 8–10 for 1e-4 tol | THEORETICAL_VALIDATION.md §6.2 |
| Per-iteration cost | O(D log T) quasi-ELK; O(D³ log T) full ELK | 25-RESEARCH.md §1, §4 |
| Covariance propagation | NO — point-estimate optimizer; precision tracked as state var | API_BRIDGING_STUDY.md §4 |
| API bridging effort | **FEASIBLE, ~1-2 days** — `hgf_step` IS `f(state)` directly | API_BRIDGING_STUDY.md §7 |
| Jacobian stability | **STRONG** — LM trust radius prevents sr>1 blow-up; mandatory at λ̂=−0.013 | THEORETICAL_VALIDATION.md §5.4 |
| Reference impl | JAX-native, NeurIPS 2024 published, GPU-benchmarked, actively maintained | arXiv:2407.19115 |
| Composability with NUTS | YES — gradient through fixed-point via custom VJP (jax.lax.custom_root) | arXiv:2407.19115 §3 |
| T=420 win | Marginal (0.5–2×); GPU only | 25-RESEARCH.md §9 |
| T>>420 win | 5–20× for T≥1000 on GPU | 25-RESEARCH.md §9 |

**ELK benchmark from arXiv:2407.19115 Table 2:** Autoregressive GRU, hidden dim=3, V100 GPU.
Sequential: 96ms, quasi-ELK: 221ms. At this small D, sequential beats ELK even on GPU.
The GPU speedup only manifests at larger D or larger T. This is the correct calibration
for our T=420, D=4 regime: ELK's value is in the T>>420 future, not in current production.

**HGF fit assessment:** STRONG for T>>420 (the stated Phase 25 goal). MARGINAL at T=420.
The LM trust radius is critical given the 76% of trials with transient spectral radius ≥ 1
(THEORETICAL_VALIDATION.md §4.3).

---

## 3. Candidate (b): Vanilla DEER

**Paper:** Lim, Hasani, Amini, Lechner. 2023. arXiv:2309.12252.
**Reference impl:** https://github.com/machine-discovery/deer (JAX-native, demo-quality)

**Algorithm summary.** Vanilla DEER applies full Newton's method to the nonlinear
recursion without a trust region. At each iteration, it computes the full D×D Jacobian,
solves the linearized system via `jax.lax.associative_scan`, and updates the trajectory.
There is no Levenberg-Marquardt damping.

**Decision criteria:**

| Criterion | Value | Source |
|-----------|-------|--------|
| Convergence K (HGF, λ̂=−0.013) | 8–15 nominal, BUT can DIVERGE in transient-expansion regimes | THEORETICAL_VALIDATION.md §5.2, §8.1 |
| Per-iteration cost | O(D³ log T) — no diagonal approximation | 25-RESEARCH.md §4 |
| Covariance propagation | NO | Same as ELK |
| API bridging effort | Similar to ELK (~1-2 days); same RNN-style API | API_BRIDGING_STUDY.md §4 |
| Jacobian stability | **WEAK** — no LM trust radius; spectral radius ≥ 1 at ω₂ near −2.0 causes divergence | THEORETICAL_VALIDATION.md §5.4, API_BRIDGING_STUDY.md §6 Risk #3 |
| Reference impl | deer demo (T=10000, 68× on V100) — but benchmark uses stable system (λ<<0); HGF transient regime untested | machine-discovery/deer README |
| Composability with NUTS | YES in principle; but divergence during warm-up breaks gradient | — |
| T=420 win | UNKNOWN — divergence risk in failure-mode regimes | — |
| T>>420 win | UNKNOWN for HGF — divergence risk before convergence | — |

**Recommendation: REJECTED.** DEER strictly dominated by ELK on stability. ELK's LM
damping addresses exactly the failure mode 25-01 identified (transient sr ≥ 1 at
ω₂ near −2.0). Even if DEER converged in most cases, NUTS warm-up will visit ω₂
near the prior upper bound (−2.0 per `configs/prl_analysis.yaml`), guaranteeing
exposure to the high-transient-growth regime. DEER has no protection against this;
ELK does. No gain from DEER justifies the stability regression.

---

## 4. Candidate (c): Zoltowski Parallel-MCMC

**Paper:** Zoltowski, Wu, Gonzalez, Kozachkov, Linderman. Aug 2025. arXiv:2508.18413.
**Reference impl:** None published; prototype in Linderman lab codebase (not released).

**Algorithm summary.** Zoltowski et al. parallelize the NUTS leapfrog trajectory
*across sequence positions*, not just across chains. The core idea: express the MCMC
transition kernel as a recursion over the T observed data points, then parallelize
that recursion with quasi-DEER. Reported speedups: 10–30× for MALA; HMC speedup
depends on leapfrog depth. The parallel-MCMC approach is *orthogonal* to ELK/PIEKS:
ELK reduces per-likelihood-evaluation cost from O(T) to O(K log T); Zoltowski reduces
the number of sequential NUTS calls by parallelizing the leapfrog trajectory itself.

**Decision criteria:**

| Criterion | Value | Source |
|-----------|-------|--------|
| Convergence K (HGF) | N/A — parallelizes the sampler, not the likelihood | — |
| Per-iteration cost | Amortizes NUTS leapfrog; likelihood eval inside still sequential unless ELK/PIEKS layered underneath | arXiv:2508.18413 |
| Covariance propagation | N/A — this is an MCMC method, not a filter | — |
| API bridging effort | **HIGH** — modifies BlackJAX NUTS implementation internals, not just the likelihood | arXiv:2508.18413 §3 |
| Jacobian stability | N/A for sampler; inner likelihood still needs ELK/PIEKS stability | — |
| Reference impl | Not publicly released (lab prototype only) | arXiv:2508.18413 |
| Composability with NUTS | IT IS the MCMC parallelization; composable with ELK likelihood underneath | — |
| T=420 win | Unknown; paper reports MALA speedup; HMC not characterized at T=420 | — |
| T>>420 win | Could be large IF combined with ELK; not independently benchmarked for HGF | — |

**Recommendation: DEFER.** Zoltowski is orthogonal to, not a replacement for, ELK.
Phase 25's scope is likelihood-evaluation parallelization. Sampler-level parallelization
is a natural follow-on phase *after* ELK proves its value in 25-04/25-05. Furthermore,
the reference implementation is not publicly available, and the API modification to
BlackJAX NUTS is non-trivial. The correct Phase 25 scope is: prototype ELK inside
sequential NUTS first; if 25-06 verdict is positive, layer Zoltowski MCMC parallelization
on top in a follow-on phase.

---

## 5. Candidate (d): Hybrid (ELK or PIEKS Forward + Sequential MCMC)

**This is the natural deployment pattern for Phase 25, not a separate algorithm.**

Candidate (d) describes the architecture where parallel-scan replaces the HGF
likelihood evaluation function called by the NUTS sampler, while the NUTS sampler
itself remains sequential. This is:
- The default usage of ELK in 25-04 (ELK computes log p(y|θ) in O(K log T); NUTS
  calls it T_nuts times sequentially).
- The minimal-risk integration path: no modification to BlackJAX NUTS internals.

**Decision criteria:**

| Criterion | Value | Source |
|-----------|-------|--------|
| Convergence K | Same as chosen algorithm (ELK or PIEKS) | Inherits |
| Per-iteration cost | Same as chosen algorithm | Inherits |
| Covariance propagation | Same as chosen algorithm | Inherits |
| API bridging effort | Same as chosen algorithm (NUTS integration is trivial — just replace the likelihood fn) | API_BRIDGING_STUDY.md |
| Jacobian stability | Same as chosen algorithm | Inherits |
| Reference impl | Same as chosen algorithm | Inherits |
| Composability with NUTS | YES by construction — this IS the NUTS integration pattern | — |
| T=420 win | Same as chosen algorithm | Inherits |
| T>>420 win | Same as chosen algorithm | Inherits |

**Recommendation: THIS IS THE PLAN.** Candidate (d) is "ELK used as a drop-in
likelihood for NUTS." Phase 25 implements this pattern. It is not a separate
algorithmic choice from ELK; it is simply ELK's deployment mode.

---

## 6. Candidate (e): PIEKS (Square-Root Form)

**Papers:**
- Yaghoobi, Corenflos, Hassan, Sarkka. ICASSP 2021. arXiv:2102.00514. (Standard PIEKS)
- Corenflos, Yaghoobi. SIAM JSC 2022. arXiv:2207.00426. (Square-root form)
**Reference impl:** https://github.com/EEA-sensors/sqrt-parallel-smoothers (JAX-native,
SIAM JSC 2022 published, benchmarked at D=4/T=500)

**Algorithm summary.** PIEKS (Parallel Iterated Extended Kalman Smoother) is the exact
Gaussian-filter-theoretic parallel-scan counterpart to ELK. The algorithm: (1) linearize
the transition and observation functions at a reference trajectory to obtain time-varying
Kalman matrices; (2) run one full parallel Kalman smoother pass in O(log T) depth via
`jax.lax.associative_scan`; (3) update the linearization point; (4) repeat K times.
The square-root variant (Corenflos & Yaghoobi 2022) propagates Cholesky factors of
the covariance matrices instead of raw covariances, enforcing σ > 0 numerically
throughout without explicit clipping. HGF is a Laplace-approximate Gaussian filter
(Mathys 2014); PIEKS is therefore the exact parallel version of the HGF algorithm
structure — semantically the most natural choice.

**Decision criteria:**

| Criterion | Value | Source |
|-----------|-------|--------|
| Convergence K (HGF, λ̂=−0.013) | 8–10 expected (possibly 3–7 for well-conditioned start; pessimistic 10–15 at p95 λ̂) | THEORETICAL_VALIDATION.md §6.2; 25-RESEARCH.md §4 note on PIEKS conditioning |
| Per-iteration cost | O(D³ log T) — one full Kalman smoother pass per iteration; D=4 → D³=64, small constant | arXiv:2102.00514 §3 |
| Covariance propagation | **YES** — sqrt form maintains full covariance history; σ > 0 enforced implicitly | arXiv:2207.00426 |
| API bridging effort | **FEASIBLE-WITH-EFFORT, ~3-4 days** — requires decomposing HGF into transition_fn(x,Q)+obs_fn(x,R); state-dependent R needs precompute wrapper; eHGF posterior (node 6) diverges from standard IEKS | API_BRIDGING_STUDY.md §3 |
| Jacobian stability | STRONG via sqrt-form covariance propagation; but does NOT have LM trust radius for point-estimate divergence during Newton step | THEORETICAL_VALIDATION.md §8.1; API_BRIDGING_STUDY.md §3 |
| Reference impl | JAX-native, SIAM JSC 2022 published, benchmarked at **D=4, T=500** (closest to HGF D=4, T=420); EEA-sensors group is active | arXiv:2207.00426; GitHub EEA-sensors/sqrt-parallel-smoothers |
| Composability with NUTS | YES — gradient through fixed-point via implicit differentiation (jax.lax.custom_root or hand-coded VJP); well-documented in JAX ecosystem | JAX docs; same as ELK |
| T=420 win | Marginal (0.5–2×) — same breakeven as ELK; GPU only | 25-RESEARCH.md §9; arXiv:2102.00514 §5 |
| T>>420 win | 5–20× for T≥1000 — benchmark in arXiv:2102.00514 shows parallel advantage grows with T; D=4 curve shows breakeven ~T=500 on V100 | arXiv:2102.00514 Fig. 3 |

**PIEKS theoretical strengths for HGF.** Three properties of PIEKS are conceptually
superior to ELK for HGF specifically:
1. **Covariance propagation.** HGF IS a Gaussian filter; its state includes σ₁ and σ₂
   as explicit uncertainty estimates. PIEKS propagates these correctly at every
   iteration, maintaining the probabilistic meaning of the state. ELK treats precision
   as just another scalar state variable and optimizes it as a point estimate without
   any structural guarantee that it remains positive.
2. **Square-root form enforces σ > 0.** pyhgf already guards with
   `jnp.where(precision > 1e-128, ...)` at runtime. The sqrt-PIEKS form makes this
   guarantee structural: underflow of precision is algebraically impossible.
3. **Semantic alignment.** One PIEKS iteration starting from the sequential pyhgf
   reference trajectory reproduces the exact sequential output (the Kalman smoother
   with the correct linearization IS the sequential HGF). Subsequent iterations
   refine toward the global fixed point. ELK has no such "first iteration = exact"
   property.

**PIEKS API bridging challenges (from API_BRIDGING_STUDY.md §3).** Three concrete
obstacles:
1. **State-dependent R.** The Bernoulli observation function gives R_t =
   sigmoid(μ₁_t) × (1 − sigmoid(μ₁_t)), which depends on the current state μ₁_t.
   PIEKS linearizes at the reference trajectory, so R must be precomputed from the
   sequential pyhgf output and passed as a time-indexed array. This is achievable
   but is an extra wrapping step with ~0.5 day of engineering.
2. **State-dependent Q.** The HGF transition variance exp(κ·μ₂ + ω₂) also depends
   on the current state μ₂, requiring similar precomputation from the reference
   trajectory. Same wrapping pattern as R.
3. **eHGF posterior mismatch.** pyhgf 0.2.8 uses `continuous_node_posterior_update_ehgf`
   for node 6 (volatility parent), which updates mean before precision. Standard PIEKS
   (IEKS) assumes precision-first update. This divergence requires either a custom
   posterior step in the PIEKS inner loop or an approximation. This is the most
   substantive engineering challenge: ~1 day of careful implementation and testing.

---

## 7. Comparison Table

| Algorithm | K (HGF, λ̂=−0.013) | Cost/iter | Covariance | API effort | Jacobian stability | Ref impl | T=420 win | T>>420 win |
|-----------|---------------------|-----------|------------|------------|-------------------|----------|-----------|------------|
| **(a) ELK** | **8–15** | O(D log T) quasi | NO | **FEASIBLE ~1-2d** | **STRONG (LM trust region)** | lindermanlab/elk; NeurIPS 2024 | 0.5–2× GPU | 5–20× GPU |
| (b) DEER | 8–15 nominal; **diverges** in sr≥1 regime | O(D³ log T) | NO | ~1-2d | **WEAK (no LM)** | machine-discovery/deer | UNKNOWN/RISKY | UNKNOWN/RISKY |
| (c) Zoltowski | N/A (samples, not filters) | N/A | N/A | **HIGH; no public impl** | N/A | None public | UNKNOWN | UNKNOWN |
| (d) Hybrid | = ELK in NUTS | = ELK | = ELK | = ELK | = ELK | = ELK | = ELK | = ELK |
| (e) PIEKS | **8–10 likely** | O(D³ log T) | **YES (sqrt form)** | FEASIBLE-WITH-EFFORT **~3-4d** | STRONG (sqrt-cov) | EEA-sensors/sqrt-parallel-smoothers; SIAM JSC 2022 | 0.5–2× GPU | 5–20× GPU |

Notes on K estimates for PIEKS vs ELK:
- Both are expected in the 8–15 range at λ̂ = −0.013. The PIEKS covariance
  sub-problem may be better-conditioned, giving K closer to 8; ELK with LM damping
  may take K closer to 10–12 due to step-size reduction in the trust region.
- The K difference between ELK and PIEKS at this λ̂ is estimated 1–3 iterations,
  not an order of magnitude. Both require more iterations than the original 3–10
  prediction (which assumed λ̂ ≈ −0.1 to −0.3).
- The empirical K will be measured in the 25-04 prototype against tolerance 1e-4.

---

## 8. Decision: ELK (quasi-ELK, diagonal-Jacobian)

**Chosen algorithm: ELK (quasi-ELK, lindermanlab/elk)**

**This is a decisive, non-hedged choice.** The reasoning follows:

### 8.1 Why not PIEKS despite its theoretical advantages

PIEKS is the theoretically preferred algorithm for HGF. 25-RESEARCH.md §1 originally
described PIEKS as "the right comparison point to verify correctness" and §4 ranked
it as Candidate 1. The theoretical argument is genuine: HGF is a Gaussian filter,
PIEKS is the parallel Gaussian smoother, semantic alignment is tight.

However, three empirical findings from 25-01 and 25-00b shift the balance decisively
against PIEKS for Phase 25:

**Finding 1: λ̂ = −0.013, not −0.1 to −0.3.**
The original PIEKS preference in 25-RESEARCH.md was calibrated to an expected
λ̂ ≈ −0.1 to −0.3 (moderately contracting). At that λ̂, PIEKS's better-conditioned
sub-problem would yield K = 3–7 vs ELK's K = 5–10, a meaningful advantage that might
justify the 3–4 day bridging cost. At the actual λ̂ = −0.013 (barely contracting),
both algorithms converge in 8–15 iterations. The K advantage of PIEKS over ELK
shrinks to 1–3 iterations at most. The theoretical advantage does not translate to a
practical convergence speed advantage at this λ̂.

**Finding 2: 76% of trials have transient spectral radius ≥ 1.**
THEORETICAL_VALIDATION.md §4.3 shows that individual trial Jacobians are transiently
expansive for the majority of trials across all sampled parameter vectors. This is
concentrated in the ω₂ near −2.0 regime — exactly where NUTS warm-up spends time
(prior upper bound −2.0 per `configs/prl_analysis.yaml`). PIEKS's sqrt-covariance
propagation guards against σ underflow but does NOT provide a trust-radius mechanism
for Newton step size control when the Jacobian has spectral radius > 1. ELK's LM
damping is the direct, principled mitigation for this failure mode. This is not a
minor implementation detail — it is the primary stability mechanism required for HGF
at the observed λ̂.

**Finding 3: eHGF posterior mismatch is a substantive API obstacle.**
pyhgf 0.2.8 uses the eHGF update for the volatility node, which updates mean before
precision. Standard PIEKS assumes precision-first update (standard IEKS form). This
divergence requires a custom posterior step in the PIEKS inner loop — the most
substantive of the three PIEKS bridging challenges identified in API_BRIDGING_STUDY.md
§3. ELK bypasses this entirely by treating `hgf_step` as an opaque differentiable
function: it does not decompose the HGF into observation and transition components,
so the eHGF vs standard IEKS distinction is irrelevant. ELK's API advantage is
concrete and confirmed by the probe (API_BRIDGING_STUDY.md §8.2: max rel-err 1.07e-13,
0 structural changes needed).

### 8.2 Which evidence overrides which

The 25-RESEARCH.md §1 "quasi-ELK primary" recommendation and §4 "PIEKS best match"
tension is resolved as follows:

**§4 PIEKS preference is overridden by the combination of:**
- Empirical λ̂ = −0.013 (collapses the K-iteration advantage of PIEKS)
- 76% transient-expansion trials (makes LM trust radius mandatory, not optional)
- eHGF posterior mismatch (adds ~1 day of bridging beyond the 3-4 day estimate)

**§1 ELK preference is confirmed by:**
- API_BRIDGING_STUDY.md FEASIBLE verdict with 1-2 day estimate (probe confirms `hgf_step` IS `f(state)`)
- THEORETICAL_VALIDATION.md §8.1 explicit statement: "Prefer ELK (LM damping) for robustness during NUTS warm-up"

The evidence that overrides theoretical preference for PIEKS is **empirical** (not
assumed): the Benettin QR scan over 100 parameter vectors gives λ̂ median = −0.0132
with p5 = −0.0170 and p95 = −0.0106. There is no uncertainty about this being a
weakly contracting system. The 76% transient-expansion finding is similarly empirical
and unambiguous. These data did not exist before 25-01; they are what 25-01 was
designed to produce.

### 8.3 ELK covariance propagation is not "losing" for HGF

API_BRIDGING_STUDY.md §4 addresses this directly: for HGF, precision (π₁, π₂) IS part
of the state vector. ELK treats (μ₁, π₁, μ₂, π₂) as a 4-dimensional point-estimate
state and optimizes it jointly. This is not "losing" the uncertainty — it is preserving
it as a state variable, exactly as the sequential pyhgf does. The semantics differ from
PIEKS (which propagates the covariance as a formal Gaussian structure), but the
numerical result is the same to within convergence tolerance. The HGF does not need
formal covariance propagation through the parallel scan; it needs the (μ, π) state
tuple to track the sequential trajectory within 1e-4 relative error.

### 8.4 Addressing the PASS-WITH-FAILURE-MODES hybrid option

25-01 returned PASS-WITH-FAILURE-MODES. The plan requires explicit discussion of the
hybrid option (parallel-in-safe-region + sequential-elsewhere) with a gating predicate.

**Verdict: full-parallel ELK with LM damping; no hybrid gating needed.**

The 25-01 failure modes are TRANSIENT, not DIVERGENT. No parameter vector in the
100-vector scan has λ̂ ≥ 0 (THEORETICAL_VALIDATION.md §7). The "failure modes" are
per-trial Jacobians with spectral radius > 1, which cause ELK's LM damping to tighten
the trust radius for that Newton step — this is exactly what LM damping is designed
for. There is no correctness failure that would require routing to sequential fallback.

THEORETICAL_VALIDATION.md §8.2 makes this explicit:
> "A full-parallel scan is theoretically safe across the entire prior region. No
> hybrid switching predicate is needed for correctness. However, for efficiency:
> ω₂ near −2.0 → more transient growth → more LM damping iterations → slightly
> higher parallel-scan cost."

The ω₂-based gating predicate from 25-01 (ω₂ > −3.0 → HIGH transient regime) would
be a **performance optimization**, not a correctness gate. For Phase 25's prototype
phase (25-04), performance profiling under the LM trust radius is more informative
than a gating predicate that routes to sequential. The gating predicate can be
revisited in 25-06 if the LM overhead in the ω₂ > −3.0 regime proves substantial.

---

## 9. Reproduction Target for 25-03

**Primary target:**
- **Paper:** Yaghoobi, Corenflos, Hassan, Sarkka. "Parallel Iterated Extended and
  Sigma-Point Kalman Smoothers." ICASSP 2021. arXiv:2102.00514.
- **Section:** Section 5, "Numerical Example — Coordinated Turn Model"
- **Hardware:** V100 GPU (paper); A100 or H100 acceptable for M3 cluster
- **T = 500** (closest available to HGF's T = 420; within the breakeven zone)
- **D = 4** state dimensions (exact match to HGF single-branch state: μ₁, π₁, μ₂, π₂)
- **K ≈ 5** Newton iterations reported in the paper
- **Numbers to match:** The paper reports that parallel PIEKS achieves speedup over
  sequential IEKS at T = 500 on GPU; the specific speedup factor should be read from
  Fig. 3 of arXiv:2102.00514 (or Table 1 if present in the ICASSP version).
  Target: reproduce the parallel-vs-sequential wall-clock ratio within 20% of the
  published figure, on the same D=4 coordinated turn model.

**Why PIEKS benchmark for ELK reproduction:** PIEKS at D=4/T=500 is the most directly
comparable published result to HGF's regime. Reproducing it establishes:
1. That we can run `jax.lax.associative_scan` correctly for a D=4 system at T=500.
2. The GPU breakeven point and speedup curve for D=4.
3. A correctness baseline (PIEKS output on the coordinated turn model) against which
   25-04 can validate ELK for correctness at the same dimension.

**Secondary fallback target (if PIEKS benchmark numbers are unavailable from paper):**
- **Paper:** Gonzalez et al. NeurIPS 2024. arXiv:2407.19115. Table 2.
- **Experiment:** Autoregressive GRU, hidden dim=3, V100 GPU
- **Numbers:** Sequential 96ms, quasi-ELK 221ms (sequential wins at this small D)
- **Reproduction goal:** confirm that at D=3, sequential beats quasi-ELK on GPU;
  establishes the ELK overhead calibration before scaling to D=4/T=500+

---

## 10. T=420 vs T>>420 Win-Zone Discussion

This distinction is central to Phase 25's stated motivation. 25-RESEARCH.md §9 is
explicit: HGF at T=420 is a marginal case.

**T=420 (current production):**
- Estimated speedup: 0.5–2× on GPU. May be slower than sequential.
- 25-RESEARCH.md §7b: "CPU benchmark is always slower (confirmed in sister-repo RLWM).
  GPU breakeven estimated T ≥ 1000."
- API_BRIDGING_STUDY.md §6 Risk #7: "do not claim speedup at T=420 on CPU. 25-04
  timing must be measured on GPU (M3 cluster)."
- ELK paper Table 2: at D=3, sequential=96ms outperforms quasi-ELK=221ms even on V100.
  D=4 is only marginally larger; no confident speedup claim is possible.

**T>>420 (Phase 25 stated goal — longitudinal, branched, trial-varying θ):**
- Estimated speedup: 5–20× on GPU for T ≥ 1000–2000.
- arXiv:2102.00514 PIEKS benchmark at D=4: parallel advantage grows with T; breakeven
  ~T=500 on V100 for D=4.
- This is the PRIMARY Phase 25 motivation. The Phase 25 goal is NOT to speed up
  current T=420 production but to ENABLE new use cases that require T>>420.

**Implication for 25-06 productionization decision:**
The 25-06 verdict MUST distinguish between two claims:
1. "Drop-in replacement at T=420" — LOW value; speedup is marginal or negative.
2. "Enabler for T>>420 experiments" — HIGH value; 5–20× speedup is the unlocking
   mechanism for branched HGF, 4-level HGF, longitudinal T=1000+ designs.

If 25-04/25-05 prototype shows correct convergence (NUTS parameter recovery within
tolerance), the 25-06 verdict should recommend enabling ELK as an opt-in mode for
T>>420 use cases, NOT as a replacement for the current T=420 sequential path.

**Specific T regimes for ELK:**
- T < 500: Sequential lax.scan is faster on GPU; ELK adds overhead with no benefit
- T ≈ 500–1000: Marginal; depends on GPU generation and batch size P
- T ≥ 1000: ELK wins; 5–10× speedup on A100/H100 for D=4
- T ≥ 2000 (branched HGF 3-branch, D=12): ELK wins decisively; 10–20× speedup

---

## 11. Risks and Fallbacks

### Risk 1: K turns out higher than 8–15 in practice

**Trigger:** 25-04 prototype empirically measures K > 15 before reaching 1e-4 tolerance.
**Probability:** LOW — 25-01 K estimate is conservative (accounts for chi_w warm-up cost).
**Fallback A:** Relax tolerance to 1e-3 for forward likelihood. For NUTS, gradient
accuracy at 1e-3 relative error is sufficient (HMC leapfrog step error dominates).
**Fallback B:** Use PIEKS as K-reference: run one sequential PIEKS iteration from
pyhgf reference trajectory as warm start for ELK, reducing the initial error ||e^(0)||
and thus chi_w.

### Risk 2: PIEKS bridging proves shallower than estimated

**Trigger:** 25-04 engineering discovers that eHGF/PIEKS mismatch is resolvable in
< 0.5 day (e.g., pyhgf eHGF ≈ standard IEKS within numerical tolerance at this λ̂).
**Probability:** MEDIUM — this would require testing.
**Action:** If 25-04 encounters ELK convergence issues not fixable by LM tuning AND
PIEKS bridging proves easier than estimated, escalate to a new 25-04b plan to pivot
to PIEKS. The 25-02 decision is reversible at that point; this plan documents the
rationale for the reversion.

### Risk 3: Gradient through ELK iteration fails

**Trigger:** `jax.grad` through ELK's fixed-point iteration gives incorrect or
numerically unstable gradients, causing NUTS divergences.
**Probability:** LOW — ELK paper uses `jax.custom_vjp` with implicit differentiation
at the fixed point; this is a documented pattern.
**Mitigation:** Use `jax.lax.custom_root` with the fixed-point Jacobian as the VJP.
This is the standard JAX pattern for differentiating through iterative solvers
(see JAX documentation on custom derivatives for iterative algorithms).
**Fallback:** If NUTS gradients remain unstable, compute ELK forward pass only and
estimate gradients via finite differences for the parallel-scan component. This is
less efficient but viable for a prototype phase.

### Risk 4: LM trust radius too conservative for fast convergence

**Trigger:** LM damping forces K > 15 iterations for HGF in the ω₂ near −2.0 regime,
negating the parallel-scan wall-time benefit.
**Probability:** LOW-MEDIUM. 25-01 shows max sv = 2.11 at the extreme; LM should
handle this with modest damping (λ_LM ≈ 0.1–1.0 in the ELK implementation).
**Mitigation:** Tune LM damping parameter in 25-04. quasi-ELK allows per-problem
LM initialization; start with λ_LM = 0.1 and profile K(λ_LM) in the ω₂ > −3.0 regime.

### Risk 5: D=4 GPU occupancy too low for speedup at T=420

**Trigger:** 25-04 GPU benchmark shows < 0.5× speedup at T=420, even in batched P=50
mode.
**Probability:** MEDIUM-HIGH for T=420 specifically (25-RESEARCH.md §7b confirms this).
**Action:** This is NOT a failure. The T=420 result is expected to be marginal.
25-04 should report T=420, T=1000, T=2000 benchmarks. The 25-06 verdict uses the
T>>420 numbers for the productionization case.

---

## 12. Appendix: Cross-References

### 12.1 Cross-reference to 25-RESEARCH.md

| Section | Claim | How this memo addresses it |
|---------|-------|---------------------------|
| §1 (quasi-ELK primary recommendation) | ELK is the right default; PIEKS is the comparison point | Confirmed. ELK chosen. PIEKS reproduction used as 25-03 baseline (correctness reference). |
| §4 (PIEKS as "best match" for HGF) | PIEKS more natural due to Gaussian covariance propagation | Superseded by empirical λ̂=−0.013. At this λ̂, covariance advantage does not translate to K advantage. ELK LM stability is more important. |
| §7c (Divergent Jacobians break DEER) | ELK LM damping is the mitigation | Confirmed by 25-01: 76% of trials have transient sr ≥ 1. LM damping confirmed as mandatory. |
| §9 (T win zones) | T=420 marginal; T>>420 win zone 5–20× | Adopted directly. T-regime distinction in §10 of this memo. |
| §6 Open Q#1 (PIEKS vs ELK K for HGF) | Unknown; must benchmark | Addressed: at λ̂=−0.013, both K=8–15. Difference estimated 1–3 iterations. Not decisive. |

### 12.2 Cross-reference to 25-00b API_BRIDGING_STUDY.md

The feasibility verdicts from API_BRIDGING_STUDY.md are directly load-bearing in this
decision:
- ELK (candidate b): **FEASIBLE, ~1-2 days** — probe confirmed `hgf_step` IS `f(state)`
  with max rel-err 1.07e-13. No structural decomposition needed. This is the decisive
  engineering advantage of ELK.
- PIEKS (candidate a): **FEASIBLE-WITH-EFFORT, ~3-4 days** — state-dependent Q/R,
  eHGF posterior mismatch (node 6), precision→variance conversion required.
- DIY associative_scan (candidate c): **FEASIBLE-WITH-EFFORT, ~5-7 days** — not considered
  further; both ELK and PIEKS have reference implementations.

The 7-risk register in API_BRIDGING_STUDY.md §6 remains applicable for 25-04:
- Risk #3 (Jacobian eigenvalue > 1): confirmed by 25-01; ELK LM is the mitigation.
- Risk #6 (float64 requirement): JAX_ENABLE_X64=1 mandatory; carry into 25-03/25-04.
- Risk #7 (T=420 breakeven): confirmed; do not claim speedup at T=420 on CPU.

### 12.3 Cross-reference to 25-01 THEORETICAL_VALIDATION.md

Key empirical findings used directly in this decision:

| Finding | Section | Use in this memo |
|---------|---------|-----------------|
| Median λ̂ (Benettin QR) = −0.0132 | §4.1 | Basis for K=8–15 prediction; reasons why PIEKS K advantage is small |
| 100/100 vectors λ̂ < 0 | §4.1 | Confirms full-parallel scan is theoretically safe (no hybrid gating needed) |
| 76.1% of 42,000 trials have sr ≥ 1 | §4.3 | Confirms LM trust radius is mandatory (not optional) for ELK |
| Primary failure-mode driver: ω₂ near −2.0 | §5.2 | Gating predicate discussion; NUTS warm-up visits ω₂ upper bound |
| K = 8–15 for 1e-5 tolerance | §6.2 | Both ELK and PIEKS require ~8–15 iterations; advantage is 1–3 iterations |
| GMSR biased; Benettin QR is authoritative | §4.2 | Methodological note; not directly used in decision |

The PASS-WITH-FAILURE-MODES verdict means: ELK is safe everywhere in the prior,
but requires LM damping in the ω₂ > −3.0 region. No regime requires sequential fallback.

---

*Phase: 25-parallel-scan-acceleration-research*
*Decision memo completed: 2026-04-27*
*Decision owner: Phase 25 executor (25-02)*
