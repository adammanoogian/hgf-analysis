# Phase 25: Parallel-Scan Acceleration of HGF Likelihood — Research

**Researched:** 2026-04-27
**Domain:** Parallel scan for nonlinear state-space models; JAX implementation; HGF-specific
**Confidence:** HIGH (theoretical claims), MEDIUM (empirical speedup numbers from papers), LOW (HGF-specific numeric estimates derived by analogy)

---

## 1. Synthesis — The 2025 Landscape

The field has converged on a two-layer picture: (a) **deterministic parallel scan for likelihood/gradient evaluation**, and (b) **parallel MCMC across sequence length** as a downstream application. Both are log-depth in T but differ in what gets parallelized and what preconditions are needed.

**Deterministic evaluation (DEER → ELK → ParaRNN lineage).** The core trick — cast sequential recursion as a nonlinear system and solve it with Newton iterations in O(log T) time via `jax.lax.associative_scan` — is now three years old. The 2025 state of the art is *quasi-ELK* (diagonal-Jacobian Levenberg-Marquardt with Kalman smoothing as the linear solver at each Newton step), which reduces per-step cost from O(D³) to O(D) while retaining ELK's numerical stability. The unifying-framework paper (Gonzalez et al., arXiv:2509.21716) formalizes why: all methods differ only in how well their approximate Jacobian Ã approximates the true A, and convergence rate degrades gracefully as diff(Ã) = ‖Ã−A‖ grows.

**Probabilistic parallel inference (dSMC, PIEKS, KLA lineage).** Two sub-lineages exist. (i) The Sarkka/EEA-sensors group (Yaghoobi, Corenflos 2021; Corenflos, Chopin, Sarkka 2022) parallelizes *Gaussian smoothers* and *particle smoothers* directly, treating the SSM probabilistically. Their PIEKS algorithm is IEKS inside a parallel scan — directly applicable to any system where you can write down a Gaussian transition model. (ii) The NeurIPS 2026 KLA paper (arXiv:2602.10743) goes further and builds a parallelizable Bayesian filter as a *sequence model primitive*, using information-form Kalman updates that compose as an associative operation.

**Parallel MCMC (Zoltowski et al. 2025).** Rather than speeding up a single likelihood evaluation, this parallelizes the NUTS *trajectory itself* across leapfrog steps and, critically, across *sequence positions*. The reported speedups are 10–30× for MALA; for HMC they depend strongly on leapfrog depth. This is orthogonal to — and composable with — ELK.

**Consensus verdict.** Parallel scan for nonlinear SSMs works well on GPU when (1) T is large (>~500 in practice), (2) the Jacobian spectral radius is < 1 over the trajectory (predictability/contraction), and (3) state dimension D is small enough that the cubic Newton cost per step doesn't eat the log-T gain. HGF has D=4 (or D=12 for 3-branch), T=420 at current production, and known-bounded Jacobians (sigmoid and exp are Lipschitz-1). The regime is marginal: T=420 is near the breakeven vs a fast sequential GPU scan; T ≫ 420 (the stated goal) is firmly in the win zone. The ELK/quasi-ELK path is the right algorithm; PIEKS is the right COMPARISON POINT to verify correctness.

**Primary recommendation:** Prototype quasi-ELK (diagonal-Jacobian) using the EEA-sensors `sqrt-parallel-smoothers` as a reference implementation. Validate against sequential `lax.scan`. Target T ≥ 1000 for timing claims; do not expect speedup at T=420 on CPU.

---

## 2. Parallel Research Threads

### Direction 1: IEKS Lineage (Sarkka/EEA-sensors group)

**Key papers:**
- Sarkka & Garcia-Fernandez 2021, "Temporal Parallelization of Bayesian Smoothers," *IEEE TAC*, arXiv:1905.13002. — Original linear parallel Kalman; defines the associative operator.
- Yaghoobi, Corenflos, Hassan, Sarkka 2021, "Parallel Iterated Extended and Sigma-Point Kalman Smoothers," *ICASSP 2021*, arXiv:2102.00514. — Extends linear parallel Kalman to nonlinear models via IEKS. JAX code at `EEA-sensors/parallel-non-linear-gaussian-smoothers`.
- Corenflos, Yaghoobi 2022, "Parallel Square-Root Statistical Linear Regression for Inference in Nonlinear SSMs," SIAM JSC, arXiv:2207.00426. — Numerically stable (square-root) version; JAX code at `EEA-sensors/sqrt-parallel-smoothers`.

**Synopsis.** PIEKS is the Gaussian-smoother counterpart to ELK. The algorithm: (a) linearize the transition and observation functions at an initial trajectory guess, (b) run one parallel Kalman smoother pass (O(log T) via associative scan), (c) update the linearization point, (d) repeat until convergence. This is exactly Bell 1994 IEKS, but the inner linear solve is parallelized. The key difference from DEER/ELK: PIEKS treats uncertainty explicitly (covariances propagate through the smoother), whereas ELK collapses to point estimates. For HGF — which is ALREADY a Laplace-approximated Gaussian filter — PIEKS is the most semantically natural formulation. The HGF update *is* one Gaussian filter step; PIEKS would simply parallelize the loop over those steps.

**Reference code:** `EEA-sensors/sqrt-parallel-smoothers` provides a working JAX API: user supplies `transition_function(x, Q)` and `observation_function(x, R)` with covariances; the library handles the parallel IEKS. The API is close enough to pyhgf's `scan_fn` that bridging is straightforward.

**Relevance to HGF: HIGH.** This is arguably *more* directly applicable than ELK because it preserves the probabilistic structure. For a Laplace-approximate Gaussian filter (HGF), one PIEKS iteration recovers the sequential HGF output exactly if the linearization point is the sequential trajectory. Subsequent PIEKS iterations refine it further.

---

### Direction 2: Parallel Particle Filter / dSMC

**Key papers:**
- Corenflos, Chopin, Sarkka 2022, "De-Sequentialized Monte Carlo: A Parallel-in-Time Particle Smoother," *JMLR 23:283*, arXiv:2202.02264. — dSMC reduces particle smoother complexity from O(T) to O(log T). JAX code at `AdrienCorenflos/parallel-ps`.
- Corenflos (2021 and onward), same Sarkka group; direct follow-on from PIEKS.

**Synopsis.** dSMC defines an *associative composition* of particle distributions: given partial-trajectory blocks, their posteriors can be merged via importance re-weighting. This allows log-depth binary-tree reduction over T. The algorithm correctly handles non-Gaussian, non-additive noise — the full generality HGF's binary observation (Bernoulli) would benefit from. However, dSMC is a *smoother*, not a *likelihood calculator*. To use it for NUTS, you need a tractable marginal likelihood estimator, and the particle approximation introduces Monte Carlo error into the gradient. For HGF specifically, where the Laplace approximation is already accepted (the HGF is *defined* as a Laplace-approximate filter), dSMC introduces unnecessary variance relative to PIEKS.

**Comparison with DEER+ELK:** dSMC is variance-prone but assumption-free on the transition model; PIEKS/ELK require differentiability and a reference trajectory but are deterministic. For NUTS, which needs clean gradients, PIEKS/ELK is strongly preferred over dSMC.

**Relevance to HGF: LOW.** dSMC is the right tool if you distrust the Laplace approximation and need full SMC-quality inference. For production HGF NUTS, it is unnecessary complexity.

---

### Direction 3: Computational Psychiatry Parallelization

**Key projects surveyed:**
- pyhgf 0.2.8 (`ComputationalPsychiatry/pyhgf`) — uses `jax.lax.scan` sequentially; no parallel scan implementation. JAX/Rust backends, but no IEKS or DEER.
- TAPAS (MATLAB) — sequential loops; no GPU path.
- hBayesDM (R/Stan) — Stan sequential loops; uses multiple cores only at the chain level, not within a single likelihood evaluation.
- HierarchicalGaussianFiltering.jl (Julia) — sequential iteration; no parallel scan.
- dynamax (Murphy lab, `probml/dynamax`) — implements parallel scan for *linear Gaussian* SSMs only; documentation explicitly notes no nonlinear parallel smoother.

**Conclusion.** No existing computational-psychiatry package implements parallel scan for nonlinear SSMs. pyhgf is the only JAX-native HGF, and its `scan_fn` is a plain `lax.scan` (confirmed in `src/prl_hgf/fitting/ops.py`, line 115: `_, node_traj = lax.scan(scan_fn, attrs, scan_inputs)`). The field is entirely sequential at the trial-axis. Phase 25 would be, to our knowledge, the first application of PIEKS/ELK to a cognitive model in the HGF family.

**Relevance to HGF: HIGH (negative finding).** No code exists to reuse. Confirms the research contribution is novel; also confirms no established patterns for the pyhgf API integration step.

---

### Direction 4: Implicit / Continuation Methods (ParaRNN, Kazemipour)

**Key papers:**
- Gonzalez, Warrington et al. 2024 (ELK), arXiv:2407.19115 — introduces quasi-Newton + Levenberg-Marquardt trust region as alternative to full Jacobian. Already in the existing list as paper #2.
- Chen et al. 2025 (ParaRNN), arXiv:2510.21450, ICLR 2026 oral — Apple ML; 665× speedup over sequential. Uses Newton's method + custom parallel reduction; specifically designed for LLM-scale RNNs (7B param). The Jacobian structure they exploit is dense weight matrices, which doesn't simplify for D=4 HGF.
- Gonzalez et al. 2025 (unifying), arXiv:2509.21716 — Table 1 makes the cost/complexity hierarchy explicit.

**Synopsis on work-efficiency.** The naive parallel scan is *work-inefficient*: O(T log T) total work vs O(T) sequential. For DEER (full Newton), each of the K Newton steps does O(D³) work per time step for a total of O(K T D³ log T) — worse than sequential O(T D³). Quasi-Newton variants bring this to O(K T D log T). ELK adds Kalman smoothing per Newton step, which is O(T D³) sequential but O(D³ log T) parallel — same asymptotic total work as full Newton per iteration. The win is in *wall time* (depth = O(K D³ log T) on GPU), not in total floating-point operations. This is why CPU benchmarks uniformly show parallel scan is slower than sequential (confirmed in our sister-repo RLWM: 0.26×). The benefit only materializes on GPU, and only when T is large enough to amortize the O(K × D³) per-depth-step constant.

**Relevance to HGF: MEDIUM.** ParaRNN's contribution is implementation-level (CUDA custom kernels for large-scale LLMs); not directly reusable for D=4. The unifying framework paper is actionable: it tells us to use quasi-ELK (diagonal Jacobian) for HGF since off-diagonal Jacobian entries are small (cross-level coupling only occurs at one term: ∂μ₂/∂μ₃ via exp(κμ₃+ω₂)).

---

### Direction 5: JAX Libraries with Parallel Scan for Nonlinear SSMs

**Directly relevant repos:**

| Repo | Algorithm | Nonlinear? | API | Notes |
|------|-----------|-----------|-----|-------|
| `EEA-sensors/sqrt-parallel-smoothers` | PIEKS (sq-root form) | Yes | `transition_fn`, `obs_fn`, Q, R | **Best match for HGF** |
| `EEA-sensors/parallel-non-linear-gaussian-smoothers` | PIEKS (standard) | Yes | Same | Older; sqrt version preferred |
| `lindermanlab/elk` | ELK + quasi-ELK | Yes | RNN-style `f(state)` | No covariance propagation |
| `machine-discovery/deer` | vanilla DEER | Yes | Same | Unstable; use ELK instead |
| `probml/dynamax` | Parallel Kalman | Linear only | SSM base class | No nonlinear parallel smoother |
| `AdrienCorenflos/parallel-ps` | dSMC | Yes (stochastic) | particle-based | Not suitable for gradient-based NUTS |

**Recommendation.** `EEA-sensors/sqrt-parallel-smoothers` is the most directly reusable reference. HGF's per-trial update maps directly to a Gaussian-transition SSM with:
- transition function: `f(x_t) = (μ₂_pred, σ₂_pred, μ₃_pred, σ₃_pred)` from the HGF update equations
- observation function: `h(x_t) = sigmoid(μ₂)` for binary outcome

The square-root numerics are important for HGF because σ₂ and σ₃ must remain positive; the sqrt form enforces this implicitly.

**Relevance: HIGH for sqrt-parallel-smoothers; MEDIUM for lindermanlab/elk.**

---

### Direction 6: Parallel HMC / NUTS Beyond Zoltowski et al.

**Key paper found:**
- Zoltowski, Wu, Gonzalez, Kozachkov, Linderman 2025, arXiv:2508.18413 — already in existing list as paper #3.
- KLA (Kalman Linear Attention), arXiv:2602.10743, Feb 2026 — parallelizes Bayesian filtering for language modeling, not MCMC. Uses information-form Kalman updates as an associative operator, enabling O(log T) parallel training. Not NUTS-specific but conceptually adjacent.

**Stan / BlackJAX perspectives.** BlackJAX (arXiv:2402.10797) adds parallel chain execution but does NOT implement parallel scan within a chain. No Stan team paper was found proposing within-chain sequence parallelization. The Zoltowski et al. paper appears to be the only work explicitly parallelizing NUTS *across sequence positions* (as opposed to across chains). Their mechanism is: express the NUTS trajectory (leapfrog steps) as a recursion, apply quasi-DEER to that recursion. This is separate from and composable with ELK for the likelihood evaluation inside NUTS.

**Important distinction.** Zoltowski et al. parallelize the *MCMC chain propagation* across the T dimension of the observed data. ELK/PIEKS parallelize the *likelihood computation* that each MCMC step calls. These are orthogonal speedups: ELK reduces per-call cost from O(T) to O(K log T); Zoltowski reduces the number of sequential calls. Maximum gain requires both. In practice, implementing ELK first (simpler, no MCMC modification) is the right Phase 25 scope.

**Relevance: MEDIUM (Zoltowski directly, but complex to implement alongside ELK; KLA is context only).**

---

### Direction 7: Failure Modes and Negative Results

**Evidence gathered:**

**a. CPU is always slower.** All empirical evidence confirms parallel scan is slower on CPU: the RLWM sister-repo benchmark (0.26×) is consistent with the ELK paper's own finding (for autoregressive GRU with hidden dim 3: sequential 96ms, quasi-ELK 221ms on V100 GPU — note GPU is *still* slower than sequential for this small problem). The "work-inefficiency" is fundamental: parallel scan does more total FLOPs. CPU throughput is FLOPs-bound; GPU throughput is latency-bound (amortizes over parallelism).

**b. Short T: no win.** The parallel binary-tree reduction has constant per-depth overhead. For T=420, K=5 Newton iterations, D=4, the DEER-style overhead is approximately K × log₂(420) ≈ 5 × 9 = 45 depth steps each doing O(D³) = 64 operations. Sequential does T=420 steps of ~100 ops each. On a modern GPU with 5000+ CUDA cores, the 45-depth-step path wins only if each depth step can saturate many cores. With D=4, each step is trivially small; GPU occupancy will be terrible. The breakeven for H100-class GPU with D=4 is estimated at T ≥ 1000–2000 based on the PIEKS GPU speedup curve (differences "less prominent for shorter time horizons," Yaghoobi et al. 2021).

**c. Divergent Jacobians break DEER (not ELK).** The ELK paper shows vanilla DEER becomes numerically unstable when the Jacobian has eigenvalues > 1 in magnitude (arXiv:2407.19115, autoregressive GRU experiment). ELK's Levenberg-Marquardt trust region prevents this. HGF with extreme parameter values (large |μ₃| → large σ₂ via exp(κμ₃+ω₂)) can produce Jacobian eigenvalues near 1 or potentially > 1 during NUTS warm-up. This is why ELK, not vanilla DEER, is the right choice.

**d. Cubic state cost for dense Jacobians.** If HGF's Jacobian were dense D×D, full Newton would cost O(D³ log T × K) per likelihood call — worse than sequential O(DT) for D=4, T=420 since 64 × 9 × 5 = 2880 vs 4 × 420 = 1680. This argues for quasi-ELK (diagonal Jacobian, O(D) per step): 4 × 9 × 5 = 180 vs 1680 — 9× cheaper in total FLOPs, and on GPU with depth-only latency, 9×9×5 = … but the point is that HGF's near-diagonal Jacobian makes quasi-ELK specifically the right choice.

**Relevance: HIGH.** The failure-mode analysis directly shapes the Phase 25 sub-phase gates.

---

### Direction 8: Formal Predictability Conditions (arXiv:2508.16817)

**Extracted from the HTML version:**

**Definition (Largest Lyapunov Exponent, Eq. 5):**
`LLE := lim_{T→∞} (1/T) log(‖J_T J_{T-1} ⋯ J_1‖) = λ`

where J_t is the Jacobian of f at state s_t.

**Predictability condition:** λ < 0 (trajectories converge). λ ≥ 0 means unpredictable (divergent or chaotic).

**LLE Regularity (Eq. 10):** For convergence guarantees, the paper requires: for all t > 1, k ≥ 0: `b·e^(λk) ≤ ‖J_{t+k-1}···J_t‖ ≤ a·e^(λk)` with a ≥ 1, b ≤ 1.

**Lipschitz Jacobian (Theorem 3):** `∀t, s, s': ‖J_t(s) - J_t(s')‖ ≤ L‖s-s'‖`

**PL condition (Eq. 8):** `½‖∇L(s)‖² ≥ μ(L(s) - L(s*))` where √μ is bounded in terms of λ and T (Theorem 2).

**Convergence (Theorem 4):** Error decreases as ‖e^(i)‖₂ ≤ χ_w β^i ‖e^(0)‖₂ with 0 < β < 1, though χ_w may grow exponentially with T (the "warm-up cost").

**Predictable systems (examples from paper):** Dissipative dynamics, strongly contracting systems, Langevin dynamics in potential wells (LLE = −0.015). **Unpredictable (fail conditions):** Lorenz, Chua's Circuit, Rössler attractors (λ > 0).

**HGF-specific LLE sketch.** The HGF 3-level update Jacobian has block structure:
- ∂(μ₂_new)/∂μ₂: involves sigmoid derivative σ'(μ₂) ∈ [0, 0.25] — bounded, always < 1
- ∂(μ₂_new)/∂μ₃: involves exp(κμ₃+ω₂) and σ²₂ terms — bounded iff μ₃ is bounded
- ∂(μ₃_new)/∂μ₃: involves 1/(1+w_t) where w_t is the effective precision weight — bounded < 1 by construction

The Jacobian spectral radius is < 1 in the typical posterior regime (μ₃ roughly −4 to 0 in standard units). The Lipschitz condition is satisfied over any compact region (sigmoid and exp are smooth). The LLE is likely moderately negative (estimated λ ≈ −0.1 to −0.3 based on Sarkka/Yaghoobi benchmark analogy). **Formal proof requires computing J numerically over the Phase 14.2 posterior samples — this is exactly the 25-01 deliverable.**

**Relevance: HIGH. The conditions appear satisfied for HGF in typical operating regimes, but 25-01 must confirm numerically.**

---

### Direction 9: Field Synthesis — When Does Parallel Scan Win?

Based on the full literature survey:

**Win conditions (GPU required):**
1. T ≥ ~1000 for D ≤ 10 (GPU-scale parallelism needed to hide log-depth overhead)
2. λ < 0 (contracting dynamics; HGF likely satisfies this)
3. Off-diagonal Jacobians are small (quasi-Newton/ELK is work-efficient; HGF satisfies this due to near-diagonal structure)
4. Batch across participants (P=300) further amortizes GPU launch overhead

**Lose conditions:**
1. CPU hardware (always loses; work-inefficient)
2. Short T (T=420 is marginal; breakeven estimated ~T=800–2000 on current GPU)
3. Dense Jacobian AND small D (cubic cost not amortized; not applicable to HGF with D=4)
4. Divergent dynamics (λ ≥ 0; HGF in extreme parameter regimes during NUTS warmup could approach this)

**Verdict for HGF at T=420 production:** Marginal case. Speedup at T=420 on A100/H100 is probably 0.5–2× depending on batch size and GPU generation. At T=1000+, speedup is 5–20×. The main Phase 25 motivation (T ≫ 420, branched HGF, trial-varying θ) is firmly in the win zone.

---

## 3. Gap Analysis

**Where the 7-paper list is complete:**
- DEER → ELK → unifying framework progression (papers 1, 2, 5): covers the deterministic Newton-family methods
- Predictability theory (paper 4): the formal condition is well-documented
- Parallel MCMC (paper 3): covered for the NUTS-specific downstream

**Where the 7-paper list is MISSING or under-weighted:**

| Gap | Missing Paper | Importance |
|-----|--------------|-----------|
| PIEKS / Gaussian-smoother approach | arXiv:2102.00514 (Yaghoobi et al. 2021) | HIGH — more natural for HGF than ELK |
| Numerically stable sq-root variant | arXiv:2207.00426 (Corenflos et al. 2022) | HIGH — needed for σ positivity |
| Parallel particle smoother | arXiv:2202.02264 (Corenflos et al. 2022 JMLR) | MEDIUM — dSMC for context |
| Work-efficiency failure analysis | ELK paper Table 2 (seq=96ms, ELK=221ms) | HIGH — Phase 25 gates need this |
| JAX reference implementations | EEA-sensors repos | HIGH — reusable code |
| Cognitive psychiatry gap confirmation | pyhgf codebase survey | HIGH — confirms novelty |

**Papers MORE relevant than papers 4 and 5 for our specific use case:**
- arXiv:2102.00514 (PIEKS) is more directly applicable than arXiv:2509.21716 (unifying framework) because PIEKS explicitly handles Gaussian covariances, which HGF produces.
- arXiv:2207.00426 (sq-root PIEKS) is more practically important than arXiv:2508.16817 (predictability theory) for implementation; the theory paper informs gating, but the sq-root paper provides the working code.

---

## 4. HGF-Specific Implementation Candidates (Top 3)

### Candidate 1: EEA-sensors/sqrt-parallel-smoothers (PIEKS, sq-root form)

**URL:** https://github.com/EEA-sensors/sqrt-parallel-smoothers
**Paper:** arXiv:2207.00426 (Corenflos, Yaghoobi 2022, SIAM JSC)
**Why first choice:**
- HGF is ALREADY a Gaussian filter under Laplace approximation; PIEKS is the exact parallel version of this
- Square-root form enforces σ_t > 0 without extra clipping — important for σ₂, σ₃ in HGF
- JAX-native; API is `transition_function(x_t, Q)` → `x_{t+1}` plus `observation_function(x_t, R)` → `y_t`, matching pyhgf's node structure
- Companion to PIEKS paper; well-tested
- One PIEKS iteration with reference trajectory = sequential HGF output; subsequent iterations are refinements

**Integration path:** Extract HGF update equations from `pyhgf.math.binary_hgf` into the sq-root PIEKS `transition_function` slot. No new math — just API bridging.

### Candidate 2: lindermanlab/elk (quasi-ELK)

**URL:** https://github.com/lindermanlab/elk
**Paper:** arXiv:2407.19115 (Gonzalez et al. NeurIPS 2024)
**Why second choice:**
- Established, published, GPU-benchmarked
- quasi-ELK uses diagonal Jacobian → O(D) per step, optimal for HGF's near-diagonal structure
- Levenberg-Marquardt trust radius prevents Jacobian-eigenvalue instability during NUTS warmup
- Does NOT propagate covariances (point-estimate style); requires separate uncertainty tracking if needed

**Integration path:** Formulate HGF as `s_t = f(s_{t-1})` where `s_t = (μ₂, σ₂, μ₃, σ₃)` and `f` is the pyhgf update. Provide `jax.jacobian(f)` or a hand-coded diagonal approximation. Wire into ELK's `parallel_scan` wrapper.

**Downside vs Candidate 1:** Loses Gaussian uncertainty propagation; PIEKS retains it. For a likelihood calculator feeding NUTS, this may not matter if the point estimate tracks the sequential trajectory closely.

### Candidate 3: jax.lax.associative_scan with custom operator (DIY PIEKS)

**Why third choice:**
- `jax.lax.associative_scan` is in JAX core (no new deps)
- Full control over associative operator for HGF-specific optimizations
- Required reading: Sarkka & Garcia-Fernandez 2021 (arXiv:1905.13002) for the operator definition; PIEKS paper for the iterative extension
- Higher implementation risk; more code to validate
- Recommended ONLY if EEA-sensors API proves incompatible with pyhgf's Network-graph internals

---

## 5. Theoretical Conditions HGF Must Satisfy

All conditions come from arXiv:2508.16817 (Gonzalez et al. 2025) unless noted.

### Condition 1: Negative Largest Lyapunov Exponent (λ < 0)

**Formal statement (Eq. 5):** `λ = lim_{T→∞} (1/T) log(‖J_T ··· J_1‖) < 0`

**HGF Jacobian structure (d=4 state: μ₂, σ₂, μ₃, σ₃):**
```
       ∂μ₂_new/∂μ₂    ∂μ₂_new/∂σ₂    ∂μ₂_new/∂μ₃    ∂μ₂_new/∂σ₃
J_t =  ∂σ₂_new/∂μ₂    ...             ...             ...
       ∂μ₃_new/∂μ₂    ...             ∂μ₃_new/∂μ₃    ...
       ∂σ₃_new/∂μ₂    ...             ...             ∂σ₃_new/∂σ₃
```
Key terms:
- ∂μ₂_new/∂μ₂: prediction residual scaled by σ'(μ₂) ∈ [0, 0.25]; typically 0.05–0.20
- ∂μ₃_new/∂μ₃: Bayesian shrinkage ∈ (0, 1) by construction of precision-weighted update
- ∂μ₂_new/∂μ₃: the volatility-coupling term ∝ exp(κμ₃ + ω₂); bounded for bounded μ₃

**Plausibility of λ < 0:** HIGH. All diagonal entries are < 1 by construction; off-diagonal terms are small. Spectral radius is almost certainly < 1 in the typical posterior region. **Must verify numerically in 25-01 by computing ‖J_T ··· J_1‖^{1/T} over Phase 14.2 posterior samples.**

### Condition 2: L-Lipschitz Jacobians (Theorem 3 of arXiv:2508.16817)

**Formal statement:** `‖J_t(s) - J_t(s')‖ ≤ L‖s - s'‖ for all s, s'`

**HGF:** sigmoid and exp are smooth (C∞); all Jacobian entries are bounded Lipschitz functions of state. This condition is satisfied over any compact domain. The compact domain is the posterior support — finite by construction. **Conclusion: satisfied in practice; no formal issue.**

### Condition 3: LLE Regularity (Eq. 10)

**Statement:** `b·e^(λk) ≤ ‖J_{t+k-1}···J_t‖ ≤ a·e^(λk)`

**Implication for HGF:** This rules out transient growth before eventual decay. For HGF, the level-3 prediction step can temporarily amplify perturbations (high-volatility phase) before damping them (prediction error correction). Transient constant a > 1 is expected. This may require K > 1 Newton iterations (5–10 rather than 3–5). **Must measure empirically in 25-01.**

### Condition 4: Differentiability of f_HGF w.r.t. state

**Required by both PIEKS and ELK.** HGF update equations use sigmoid and exp, both smooth. `jax.jacobian` can compute J_t exactly. **Satisfied by construction.**

### What the 25-01 proof sketch must compute

1. Draw 100 representative parameter vectors from Phase 14.2 posterior chains.
2. For each, run sequential HGF forward to get reference trajectory (μ₂_t, σ₂_t, μ₃_t, σ₃_t).
3. At each trial t, compute J_t = `jax.jacobian(hgf_step)(state_t)`.
4. Compute ‖J_T ··· J_1‖^{1/T} (log-scale); record λ̂.
5. Check max singular value of J_t across trials; document distribution.
6. Identify failure-mode regimes: any parameter vectors with spectral radius > 1?

---

## 6. Open Questions Surfaced by Broader Literature

These did NOT appear in PHASE_DESCRIPTION.md:

1. **PIEKS vs ELK: which has lower iteration count K for HGF?**
   - PIEKS propagates covariances → better-conditioned linear sub-problem → possibly fewer Newton iterations.
   - ELK is a point-estimate optimizer → may need more iterations but each is cheaper.
   - Unknown for HGF; must benchmark in 25-03/25-04.

2. **Is the pyhgf Network graph structure compatible with the EEA-sensors API?**
   - pyhgf stores state in a dict-of-dicts (`attributes`); PIEKS expects explicit matrices (Q, R, transition_fn).
   - The bridging layer (extract HGF math from Network, reformulate as explicit SSM) is non-trivial.
   - Alternative: use ELK's RNN-style API which is closer to pyhgf's `scan_fn` signature.

3. **Gradient of the iterative parallel scan through JAX.**
   - The PIEKS fixed-point iteration is differentiable via implicit differentiation (standard for iterative algorithms in JAX via `jax.lax.while_loop` + custom VJP).
   - The ELK paper does NOT discuss gradient-through-the-iteration; it relies on `jax.custom_vjp` with the fixed-point Jacobian.
   - Must verify that `jax.grad` through the parallel scan (not just through the final output) gives correct gradients for NUTS. The Zoltowski et al. paper discusses this but only for their MCMC setting.

4. **T=420 GPU breakeven: is Phase 25 actually worthwhile for production?**
   - Based on PIEKS benchmarks: "differences less prominent for shorter time horizons" (Yaghoobi 2021) — T=420 may see < 2× speedup on GPU.
   - The Phase 25 goals explicitly target T ≫ 420. But the production bottleneck is P=300 × T=420.
   - **Open question:** Does batching P=300 participants through the parallel scan help GPU occupancy enough to get speedup at T=420? This depends on the JAX vmap+associative_scan interaction — not documented in any paper reviewed.

5. **Trial-varying θ (PAT-RL ΔHR covariate) and PIEKS.**
   - PIEKS assumes time-homogeneous noise covariances Q, R.
   - PAT-RL Model D has trial-varying ΔHR as a linear covariate that modifies the effective ω₂ per trial.
   - This is a time-varying transition function; PIEKS supports this IF the transition function is indexed by t.
   - EEA-sensors sqrt-parallel-smoothers does support time-varying functions (the API passes the whole time series).

6. **KLA (arXiv:2602.10743) as a long-term architecture alternative.**
   - KLA rewrites the Kalman filter in information form so updates are associative (semiring structure).
   - For HGF's Gaussian level 2/3, this could provide a CLEAN associative operator without iterative refinement.
   - This is a more radical reformulation than PIEKS/ELK; appropriate for a follow-on Phase, not Phase 25.

---

## 7. Recommended Sub-Phase Adjustments

Based on the broader literature, proposed changes to the 25-00..25-06 skeleton:

### Keep as-is:
- **25-01 (theoretical validation):** The predictability/contraction proof is essential. Add the numerical Jacobian scan protocol described in Section 5 above as the concrete deliverable.
- **25-05 (posterior validity):** Gradient-through-iteration check is critical and was correctly identified.
- **25-06 (productionization decision):** Correct framing.

### Modify:
- **25-00 (research synthesis):** This document IS 25-00. Add a literature comparison table explicitly comparing PIEKS (Yaghoobi 2021) vs ELK (Gonzalez 2024) vs DEER (Lim 2023) on convergence, cost per iteration, covariance propagation, and API complexity.
- **25-02 (algorithm selection):** Add PIEKS (EEA-sensors) as option (e) alongside ELK/DEER/Zoltowski. The algorithm selection memo must address WHY the user picks ELK over PIEKS or vice versa, given that PIEKS is arguably more natural for HGF. Current PHASE_DESCRIPTION.md does not mention PIEKS.
- **25-03 (reproduction):** Explicitly reproduce the PIEKS GPU speedup from arXiv:2102.00514 (Yaghoobi 2021) OR the ELK benchmark from arXiv:2407.19115 — not just "toy benchmark." Pick the algorithm 25-02 selected and reproduce THAT paper's result.

### Add:
- **25-00b: API bridging study** (0.5 day). Before the theoretical proof, map pyhgf's Network/attributes dict structure to the (transition_fn, Q, obs_fn, R) slot of EEA-sensors API OR the `f(state)` slot of ELK. This is a pure engineering task that can fail (if the Network graph is incompatible) and would block 25-03/25-04 unexpectedly. Better to surface early.

### Drop:
- Nothing from the original list should be dropped, but the **25-02 algorithm decision** memo should explicitly close the PIEKS vs ELK question (currently the existing list does not include this comparison).

---

## Sources

### Primary (HIGH confidence)
- arXiv:2102.00514 (Yaghoobi, Corenflos, Hassan, Sarkka 2021) — PIEKS algorithm, JAX code
- arXiv:2207.00426 (Corenflos, Yaghoobi 2022) — sq-root PIEKS, SIAM JSC
- arXiv:1905.13002 (Sarkka & Garcia-Fernandez 2019/2021) — foundational parallel Kalman
- arXiv:2202.02264 (Corenflos, Chopin, Sarkka 2022 JMLR) — dSMC particle smoother
- arXiv:2407.19115 (Gonzalez et al. NeurIPS 2024) — ELK; GPU benchmark showing seq=96ms > ELK=221ms at small D
- arXiv:2509.21716 (Gonzalez et al. 2025) — unifying framework; Table 1 complexity
- arXiv:2508.16817 HTML version — predictability conditions, formal definitions
- arXiv:2508.18413 HTML version — Zoltowski MCMC parallelization

### Secondary (MEDIUM confidence)
- GitHub: EEA-sensors/sqrt-parallel-smoothers — sq-root PIEKS JAX code
- GitHub: EEA-sensors/parallel-non-linear-gaussian-smoothers — PIEKS JAX code
- GitHub: lindermanlab/elk — ELK JAX code
- GitHub: machine-discovery/deer — DEER demo (T=10000, 68× speedup on V100)
- probml/dynamax JOSS 2025 — confirms no nonlinear parallel smoother exists in dynamax
- pyhgf GitHub + src/prl_hgf/fitting/ops.py line 115 — confirms sequential lax.scan in production

### Tertiary (LOW confidence)
- arXiv:2510.21450 (ParaRNN, Apple 2025) — 665× speedup, but LLM-scale; not directly applicable to D=4
- arXiv:2602.10743 (KLA Feb 2026) — Kalman as associative sequence model; future-facing only

---

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH — EEA-sensors/sqrt-parallel-smoothers is verified via GitHub + paper; ELK is NeurIPS 2024 published
- Architecture: HIGH for PIEKS/ELK algorithms; MEDIUM for JAX API bridging details (untested)
- Pitfalls (failure modes): HIGH for CPU slowdown (multiple confirmed sources + sister-repo); MEDIUM for T=420 breakeven (estimated by analogy, not directly measured for HGF)
- HGF theoretical conditions: MEDIUM — structure is clear and conditions are plausibly satisfied, but 25-01 numeric validation is required before asserting HIGH

**Research date:** 2026-04-27
**Valid until:** 2026-07-27 (90 days; field is active but core algorithms are stable)

---

## RESEARCH COMPLETE
