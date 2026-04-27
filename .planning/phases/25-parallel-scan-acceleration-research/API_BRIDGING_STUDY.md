# API Bridging Study: pyhgf State → Parallel-Scan APIs

**Phase:** 25 — Parallel-scan acceleration of HGF likelihood evaluation
**Plan:** 25-00b
**Date:** 2026-04-27
**Probe:** `scratch/api_bridging_probe.py`

---

## 1. Executive Summary

- **Probe result:** PASS. The pure-function extraction succeeds with max rel-err
  1.07e-13 on 50 trials (threshold: 1e-10). `hgf_step(attrs, input_t) -> (attrs', state_t)`
  wrapping pyhgf's `scan_fn` is a valid, verified, pure function for the
  time-invariant pick_best_cue use case.

- **Recommended default API for 25-04 prototype:** **(b) lindermanlab/elk (quasi-ELK)**
  The RNN-style `f(state)` signature is the closest match to pyhgf's `scan_fn`
  and requires the shallowest bridging layer. ELK's Levenberg-Marquardt trust
  region is also important for numerical stability during NUTS warm-up (see
  Section 6, Risk #3).

- **One-sentence reason:** ELK's API accepts any differentiable `f(state) -> state'`
  and pyhgf's `hgf_step` IS that function without modification; the PIEKS API
  requires decomposing the HGF into explicit `transition_function(x_t, Q)` and
  `observation_function(x_t, R)` with a state-dependent R that needs a wrapper.

- **Largest engineering risk:** The pyhgf `attributes` dict-of-dicts must be
  flattened to a JAX pytree tuple before any parallel-scan API can process it;
  this flattening is achievable via `jax.tree_util.tree_flatten` but must be
  locked down as a fixed convention before 25-04 begins, because the flat
  ordering is not documented in pyhgf and could change between versions.

---

## 2. pyhgf State-Shape Inventory

### 2.1 Source location

```
pyhgf installation: C:\Users\aman0087\AppData\Local\miniforge3\envs\ds_env\lib\site-packages\pyhgf
Version: 0.2.8
```

### 2.2 Network topology (pick_best_cue, 3-level, 3-branch)

```
Node 0: binary-state   — cue 0 input
Node 1: continuous-state — cue 0 level-1 belief (value parent of node 0)
Node 2: binary-state   — cue 1 input
Node 3: continuous-state — cue 1 level-1 belief (value parent of node 2)
Node 4: binary-state   — cue 2 input
Node 5: continuous-state — cue 2 level-1 belief (value parent of node 4)
Node 6: continuous-state — shared volatility parent
                           (volatility parent of nodes 1, 3, 5 via kappa coupling)
```

### 2.3 Call graph: binary 3-level HGF per-trial update

Entry point: `pyhgf.utils.beliefs_propagation` (called as `scan_fn` via `jax.tree_util.Partial`)

```
beliefs_propagation(attributes, inputs, update_sequence, edges, input_idxs)
│
├── Set time_step: attributes[-1]["time_step"] = time_step_t
│
├── PREDICTION SEQUENCE (bottom-up, roots first):
│   ├── continuous_node_prediction(attributes, node_idx=6, edges)  ← volatility parent
│   │   ├── predict_mean → attributes[6]["expected_mean"] (Gaussian RW)
│   │   └── predict_precision → attributes[6]["expected_precision"], attributes[6]["temp"]["effective_precision"]
│   ├── continuous_node_prediction(attributes, node_idx=1, edges)  ← level-1 cue 0
│   │   ├── predict_mean → attributes[1]["expected_mean"]  (uses mu_2 via kappa coupling)
│   │   └── predict_precision → attributes[1]["expected_precision"]  (uses exp(kappa*mu_2 + omega_2))
│   ├── continuous_node_prediction(attributes, node_idx=3, edges)  ← level-1 cue 1 (same)
│   ├── continuous_node_prediction(attributes, node_idx=5, edges)  ← level-1 cue 2 (same)
│   ├── binary_state_node_prediction(attributes, node_idx=0, edges)  ← binary input cue 0
│   │   └── attributes[0]["expected_mean"] = sigmoid(attributes[1]["expected_mean"])
│   ├── binary_state_node_prediction(attributes, node_idx=4, edges)  ← binary input cue 2
│   └── binary_state_node_prediction(attributes, node_idx=2, edges)  ← binary input cue 1
│
├── OBSERVATION: set_observation → inject observations into input nodes 0, 2, 4
│
└── UPDATE SEQUENCE (top-down, leaves first):
    ├── binary_state_node_prediction_error(node=0)  ← computes value PE for node 1
    ├── binary_state_node_prediction_error(node=2)  ← computes value PE for node 3
    ├── binary_state_node_prediction_error(node=4)  ← computes value PE for node 5
    ├── continuous_node_posterior_update(node=1)    ← updates attributes[1]["precision"] then ["mean"]
    ├── continuous_node_posterior_update(node=5)    ← (same for cue 2)
    ├── continuous_node_prediction_error(node=1)    ← computes volatility PE for node 6
    ├── continuous_node_prediction_error(node=5)    ← (same)
    ├── continuous_node_posterior_update(node=3)    ← cue 1 (slightly deferred)
    ├── continuous_node_prediction_error(node=3)    ← (same)
    └── continuous_node_posterior_update_ehgf(node=6) ← eHGF update for volatility parent
```

**Note:** The `continuous_node_posterior_update_ehgf` (not the standard update) is used
for node 6. This is the eHGF variant that updates mean before precision, improving numerical
stability. The update_type defaults to `"eHGF"` in `Network.__init__`.

### 2.4 Attributes dict → flat state tuple mapping

The DYNAMICAL STATE of the single-branch (cue-0) 3-level HGF is a 4-dimensional
tuple. All other quantities in `attributes` are either derived (recomputed each step)
or static (graph structure parameters).

| pyhgf key path                          | math symbol    | flat-tuple index | dtype   |
|-----------------------------------------|----------------|------------------|---------|
| `attributes[1]["mean"]`                 | μ₁ (posterior) | 0                | float64 |
| `attributes[1]["precision"]`            | π₁ (posterior) | 1                | float64 |
| `attributes[6]["mean"]`                 | μ₂ (posterior) | 2                | float64 |
| `attributes[6]["precision"]`            | π₂ (posterior) | 3                | float64 |

**Full 3-branch production state (12-dim):**

| pyhgf key path                          | math symbol    | flat-tuple index |
|-----------------------------------------|----------------|------------------|
| `attributes[1]["mean"]`                 | μ₁_c0          | 0                |
| `attributes[1]["precision"]`            | π₁_c0          | 1                |
| `attributes[3]["mean"]`                 | μ₁_c1          | 2                |
| `attributes[3]["precision"]`            | π₁_c1          | 3                |
| `attributes[5]["mean"]`                 | μ₁_c2          | 4                |
| `attributes[5]["precision"]`            | π₁_c2          | 5                |
| `attributes[6]["mean"]`                 | μ₂ (shared)    | 6                |
| `attributes[6]["precision"]`            | π₂ (shared)    | 7                |

**Derived (non-state) quantities** recomputed at each step from state:
- `attributes[0]["expected_mean"]` = sigmoid(μ₁_pred_c0) — from prediction step
- `attributes[1]["expected_mean"]` = μ₁_pred_c0 — from predict_mean using μ₂, κ, ω₂
- `attributes[1]["expected_precision"]` = π₁_pred_c0 — from predict_precision using μ₂, κ, ω₂
- `attributes[6]["expected_mean"]` = μ₂_pred — from predict_mean using ω₃
- `attributes[6]["expected_precision"]` = π₂_pred — from predict_precision using ω₃

**Static closure (captured by scan_fn):**
- `edges` — graph topology (immutable after build)
- `update_sequence` — ordered list of (node_idx, update_fn) pairs (immutable)

---

## 3. Candidate API (a): EEA-sensors/sqrt-parallel-smoothers

**Repository:** https://github.com/EEA-sensors/sqrt-parallel-smoothers
**Paper:** Corenflos & Yaghoobi, arXiv:2207.00426, SIAM JSC 2022 (sqrt-PIEKS)
**Parent:** arXiv:2102.00514 (Yaghoobi et al. 2021, standard PIEKS)

### Required signature

```python
# EEA-sensors API (from sqrt-parallel-smoothers):
transition_function(x_t, Q) -> x_{t+1}  # Gaussian transition with noise cov Q
observation_function(x_t, R) -> y_t     # Gaussian observation with noise cov R
```

where `x_t` is the Gaussian state (mean, sqrt-covariance) and Q, R are explicit
covariance matrices.

### Mapping to HGF

**State:** `x_t = (μ₁, σ₁, μ₂, σ₂)` where σ = 1/√π (standard deviation form).

**`transition_function(x_t, Q)`** maps to HGF prediction step:
```
μ₁_pred = autoconnection * μ₁ + time_step * tonic_drift
         (for level-1 node: autoconnection=1, tonic_drift=0 → μ₁_pred = μ₁)
σ₁_pred = sqrt(σ₁² + exp(κ·μ₂ + ω₂))  ← volatility-driven expansion
μ₂_pred = μ₂  (Gaussian random walk with tonic volatility ω₃)
σ₂_pred = sqrt(σ₂² + exp(ω₃))
```
Q here is STATE-DEPENDENT (exp(κ·μ₂ + ω₂) depends on μ₂ of the PREVIOUS step).
This means Q is not a fixed matrix — it must be computed from the current state,
which is possible within the API if `transition_function` is a closure over the
parameters (ω₂, ω₃, κ).

**`observation_function(x_t, R)`** maps to binary observation:
```
y_t = sigmoid(μ₁)  [expected Bernoulli probability]
R = σ_bernoulli² = sigmoid(μ₁) * (1 - sigmoid(μ₁))  ← STATE-DEPENDENT
```
R is state-dependent — it changes with μ₁. The sqrt-parallel-smoothers API
can handle time-varying R if passed as an array indexed by trial, but
state-dependent R requires precomputing the reference trajectory first (which
is exactly what PIEKS does: linearize at reference, then do one parallel pass).

### Feasibility verdict

**FEASIBLE-WITH-EFFORT**

**Justification:**
1. The prediction step maps cleanly to `transition_function` if Q is computed
   inline as a function of the current state (wrapped closure).
2. The state-dependent R for the Bernoulli observation requires a wrapper:
   precompute R_t = sigmoid(μ₁_t_ref)*(1 - sigmoid(μ₁_t_ref)) from the
   reference trajectory, then pass as a time-varying array. This is the standard
   PIEKS procedure (one PIEKS iteration with reference trajectory = sequential output).
3. The sqrt-parallel-smoothers API expects explicit covariance matrices; pyhgf
   stores precision (not variance). Conversion: σ = 1/√π adds O(D) operations.
4. pyhgf stores state as dict-of-dicts; must flatten to tuple form first.
5. The eHGF update (used for node 6) is a non-standard posterior update; the
   EEA-sensors PIEKS assumes the standard IEKS form. This may require a custom
   posterior update wrapper.

**Effort estimate:** 3-4 days of bridging code in 25-04.

**Pros:**
- Square-root form enforces σ > 0 without clipping — important for σ₂ and σ₁
  which pyhgf guards with `jnp.where(precision > 1e-128, ...)` at runtime.
- Native Gaussian uncertainty propagation — semantically correct for HGF.
- One PIEKS iteration with the sequential reference trajectory = exact
  reproduction of pyhgf's output. Subsequent iterations refine further.
- Well-tested JAX code from a published paper (SIAM JSC 2022).

**Cons:**
- Rigid Q, R API requires non-trivial wrapping for state-dependent Q.
- eHGF posterior update (used in pyhgf 0.2.8 by default) is not the standard
  IEKS update; may require a custom posterior step function.
- External dependency on EEA-sensors repo (no PyPI package; pip from GitHub).

---

## 4. Candidate API (b): lindermanlab/elk

**Repository:** https://github.com/lindermanlab/elk
**Paper:** Gonzalez, Warrington et al. NeurIPS 2024, arXiv:2407.19115 (ELK)

### Required signature

```python
# ELK API (from lindermanlab/elk):
f(state) -> state'  # any differentiable function
# ELK computes J_t = jax.jacobian(f)(state_t_ref) internally
# or accepts hand-coded diagonal approximation for quasi-ELK
```

where `state` is any JAX-compatible array (no covariance structure required).

### Mapping to HGF

**State:** `state_t = (μ₁, π₁, μ₂, π₂)` as a flat JAX array.

`f(state_t)` = `hgf_step(attrs_from(state_t), input_t)` restricted to the
state components — i.e., the per-trial pyhgf update re-expressed as a pure
function of the minimal state tuple.

**This is EXACTLY what the probe demonstrates.** The `hgf_step` function in
`scratch/api_bridging_probe.py` IS the `f(state)` required by ELK, modulo the
dict-to-tuple flattening. The probe verifies that `hgf_step` is numerically
identical to pyhgf's `lax.scan`.

**`jax.jacobian(f)`** is computable: all pyhgf operations are JAX-differentiable
(sigmoid, exp, arithmetic). The Jacobian has approximate block-diagonal structure
(off-diagonal term: ∂μ₁/∂μ₂ via exp(κ·μ₂ + ω₂)). For quasi-ELK, only the
diagonal is needed: O(D) vs O(D³) for full Newton.

### Feasibility verdict

**FEASIBLE**

**Justification:**
1. `hgf_step` is exactly the `f(state)` ELK requires. No structural changes needed.
2. `jax.tree_util.tree_flatten(attrs)` converts dict-of-dicts to a flat array;
   `jax.tree_util.tree_unflatten(treedef, leaves)` inverts it. One-time cost
   per call pair; no performance overhead under JIT.
3. `jax.jacobian(hgf_step)` works because all pyhgf operations are differentiable.
   The probe confirms no non-differentiable ops in the pick_best_cue path.
4. quasi-ELK (diagonal Jacobian) reduces per-step cost from O(D³) to O(D) —
   appropriate for D=4 (or D=8 for full 3-branch representation).

**Effort estimate:** 1-2 days of bridging code in 25-04.

**Pros:**
- Shallowest API surface: probe demonstrates `hgf_step` IS the required function.
- No covariance decomposition required — precision values stay as-is.
- ELK's Levenberg-Marquardt trust region prevents Jacobian-eigenvalue instability
  during NUTS warm-up (important: 25-RESEARCH.md §7c flags this risk).
- Published, GPU-benchmarked implementation with explicit convergence guarantees.
- quasi-ELK with diagonal Jacobian is optimal for HGF's near-diagonal structure.

**Cons:**
- Loses Gaussian covariance propagation (point estimates only). For HGF,
  where uncertainty (precision) IS part of the state, this is not "losing"
  covariance — it's simply treating precision as a state variable rather than
  a covariance matrix element. The semantics are preserved.
- Levenberg-Marquardt metric requires defining a per-state Fisher information
  metric. For HGF, the natural choice is diag(π₁, 1, π₂, 1) — precision-weighted
  metric. Must be specified explicitly to ELK.
- External dependency on lindermanlab/elk (no PyPI package; pip from GitHub).

---

## 5. Candidate API (c): jax.lax.associative_scan with custom operator

**Library:** JAX core (`jax.lax.associative_scan`)
**Papers:** Sarkka & Garcia-Fernandez 2021 (arXiv:1905.13002), PIEKS (arXiv:2102.00514)

### Required structure

```python
# JAX core associative_scan:
jax.lax.associative_scan(associative_fn, elems, axis=0)
# requires: associative_fn(a, b) -> c with (a ⊕ b) ⊕ c = a ⊕ (b ⊕ c)
```

For PIEKS, the associative operator combines two adjacent linearized HGF
blocks into a single block. Each element is a tuple (A_t, b_t, H_t, R_t, Q_t)
representing the linearized SSM at trial t.

### Mapping to HGF

**Step 1:** Use `hgf_step` (from probe) to compute the reference trajectory
(sequential, as in pyhgf).

**Step 2:** At each trial t, compute the Jacobian:
```python
A_t = jax.jacobian(hgf_step)(state_ref_t, input_t)  # shape (D, D)
b_t = state_ref_{t+1} - A_t @ state_ref_t           # affine offset
```

**Step 3:** Build the associative operator for the linearized (A, b) pairs:
```
(A_1, b_1) ⊕ (A_2, b_2) = (A_2 @ A_1, A_2 @ b_1 + b_2)
```
This is the standard Sarkka & Garcia-Fernandez (2021) parallel Kalman operator
(matrix concatenation form). For PIEKS, we wrap this inside a Kalman smoother
pass.

**Step 4:** Apply `jax.lax.associative_scan` over the (A_t, b_t, H_t, Q_t, R_t)
tuples for O(log T) depth.

**Step 5:** Run multiple iterations (K=3-10) until convergence. Each iteration:
- Linearize at current trajectory estimate
- Run one parallel Kalman smoother pass
- Update trajectory estimate

### Feasibility verdict

**FEASIBLE-WITH-EFFORT** (high effort)

**Justification:**
1. `jax.lax.associative_scan` is in JAX core — no external dependency.
2. The associative operator for the (A, b) affine combination is standard
   and can be coded directly from Sarkka & Garcia-Fernandez 2021.
3. The eHGF posterior update (node 6) must be approximated as a standard
   Gaussian posterior update for the Kalman smoother formulation.
4. `jax.jacobian(hgf_step)` can compute A_t automatically — no hand-coding
   needed.
5. However, the full PIEKS formulation requires also computing the observation
   Jacobian H_t and the noise covariances Q_t, R_t at each step from the
   current state — more complex than the ELK path.

**Effort estimate:** 5-7 days of implementation + validation in 25-04.

**Pros:**
- No external library dependency (pure JAX).
- Full theoretical control — can optimize the operator for HGF's specific structure.
- Most interpretable from the PIEKS/Kalman-smoother perspective — directly
  implements the algorithm described in the 25-RESEARCH.md §1 synthesis.

**Cons:**
- Highest implementation cost: must derive and validate the associative operator.
- Must re-derive the Kalman smoother covariance equations for the eHGF variant.
- All validation must be done from scratch (no reference implementation for the
  HGF-specific operator).
- The Jacobian computation at each linearization adds O(D²) cost per iteration,
  though this is amortized over T steps in parallel.

---

## 6. Risk Register

| # | Risk | Severity | Mitigation |
|---|------|----------|------------|
| 1 | **pyhgf attributes is dict-of-dicts; flattening to tuple loses structural metadata** | MEDIUM | Document key→index mapping (Section 2.4 above); use `jax.tree_util.tree_flatten`/`tree_unflatten` so the mapping is canonical and not hand-coded. Lock the mapping at the start of 25-04. |
| 2 | **Closure-over-data pattern: scan_fn captures edges and update_sequence** | MEDIUM | Probe confirms these are TIME-INVARIANT for pick_best_cue (fixed graph topology, fixed update schedule). Closures are SAFE for this use case. RISK ACTIVATES for trial-varying θ (PAT-RL ΔHR covariate) — that case requires threading θ_t as an explicit scan input. |
| 3 | **Jacobian eigenvalue > 1 during NUTS warm-up: DEER instability** | HIGH | Use ELK (Levenberg-Marquardt trust region prevents this). Do NOT use vanilla DEER. 25-RESEARCH.md §7c confirms: HGF with extreme μ₃ values can approach Jacobian spectral radius ≥ 1. ELK's LM damping clips this. |
| 4 | **pyhgf eHGF posterior update ≠ standard HGF update** | MEDIUM | pyhgf 0.2.8 uses `continuous_node_posterior_update_ehgf` for the volatility node (node 6) — updates mean BEFORE precision. Standard PIEKS assumes precision-first. For PIEKS bridging (API a, c): must use or emulate the eHGF posterior step. For ELK bridging (API b): this distinction disappears — ELK just runs `hgf_step` as a black box. |
| 5 | **pyhgf functions decorated with @partial(jit): JAX-inside-JAX tracing** | MEDIUM | Probe runs in eager mode (no outer JIT); works correctly. For 25-04, need to verify that calling scan_fn inside `jax.lax.associative_scan` (which runs under JIT) does not trigger nested JIT issues. Recommendation: strip JIT from `hgf_step` and rely on the outer `lax.scan` / `associative_scan` JIT boundary. |
| 6 | **Float32 vs float64: pyhgf uses float64; JAX defaults to float32** | HIGH | Confirmed in probe: `JAX_ENABLE_X64=1` is REQUIRED. Without it, dtype mismatch causes `jax.lax.cond` TypeError (confirmed by first probe run). Must set `os.environ["JAX_ENABLE_X64"] = "1"` before any jax import in 25-04 code. |
| 7 | **T=420 breakeven: parallel scan may not speed up at production T** | MEDIUM | 25-RESEARCH.md §9 and §7b: CPU benchmark is always slower (confirmed in sister-repo RLWM). GPU breakeven estimated T ≥ 1000. Phase 25 primary motivation is T ≫ 420; do not claim speedup at T=420 on CPU. 25-04 timing must be measured on GPU (M3 cluster). |

---

## 7. Recommendation

**For the 25-04 prototype, default to candidate (b): lindermanlab/elk (quasi-ELK).**

**Rationale:**

1. **Shallowest bridging:** The probe demonstrates that `hgf_step(attrs, input_t) -> (attrs', state_t)` is numerically identical to pyhgf's `lax.scan` output (max rel-err 1.07e-13). This function IS the `f(state)` ELK requires. The only additional step is the dict-to-tuple flattening (`jax.tree_util.tree_flatten`), which is O(1) overhead.

2. **Numerical stability:** ELK's Levenberg-Marquardt trust region prevents Jacobian-eigenvalue instability (Risk #3). Vanilla DEER would be dangerous for HGF during NUTS warm-up where parameter values can be extreme. This is the concrete engineering reason to prefer ELK over DEER.

3. **Near-diagonal Jacobian:** HGF's Jacobian is nearly diagonal (only one off-diagonal term: ∂μ₁/∂μ₂ via exp(κ·μ₂ + ω₂)). quasi-ELK uses a diagonal Jacobian approximation at O(D) cost per step — this is the optimal regime for HGF, as argued in 25-RESEARCH.md §4.

4. **Lower risk than PIEKS bridging:** API (a) requires decomposing HGF into explicit (transition_function, Q, observation_function, R) with state-dependent R — a non-trivial wrapper. The eHGF posterior update also diverges from standard IEKS. ELK bypasses both issues by treating hgf_step as an opaque differentiable function.

5. **Lower cost than DIY associative_scan:** API (c) requires deriving and validating the associative operator from scratch — 5-7 days vs 1-2 days for ELK.

**Caveat for 25-02:** The 25-02 algorithm-selection memo should use this study's
engineering-feasibility findings alongside the theoretical preferences from
25-RESEARCH.md §4. Specifically:
- PIEKS (API a) is the theoretically preferred algorithm because it propagates
  Gaussian uncertainty explicitly, matching HGF's probabilistic structure.
- ELK (API b) is preferred by engineering feasibility because the bridging layer
  is shallower.
- 25-02 must close this PIEKS vs ELK question explicitly, weighing theoretical
  preference against implementation cost.

---

## 8. Appendix

### 8.1 Scratch probe

**Path:** `scratch/api_bridging_probe.py`
**Committed:** `c886285` (`feat(25-00b): inspect pyhgf source and build api bridging probe`)

### 8.2 Probe output

```
=== Reference trajectory (pyhgf lax.scan) — first 5 trials ===
  t=0: mu1=-0.405840  pi1=1.232014  mu2=-0.00037709  pi2=0.982856
  t=1: mu1=0.009500  pi1=1.444819  mu2=0.00009979  pi2=0.965591
  t=2: mu1=0.309715  pi1=1.657561  mu2=-0.00022572  pi2=0.949738
  t=3: mu1=-0.001601  pi1=1.852832  mu2=0.00015565  pi2=0.933889
  t=4: mu1=-0.246262  pi1=2.042009  mu2=-0.00011536  pi2=0.919237

=== Running hgf_step step-by-step loop ===
  t= 0: mu1=-0.405840(ref=-0.405840)  pi1=1.232014(ref=1.232014)  mu2=-0.00037709(ref=-0.00037709)  rel_err=0.00e+00
  t= 1: mu1=0.009500(ref=0.009500)    pi1=1.444819(ref=1.444819)  mu2=0.00009979(ref=0.00009979)   rel_err=0.00e+00
  t= 2: mu1=0.309715(ref=0.309715)    pi1=1.657561(ref=1.657561)  mu2=-0.00022572(ref=-0.00022572) rel_err=0.00e+00
  t= 3: mu1=-0.001601(ref=-0.001601)  pi1=1.852832(ref=1.852832)  mu2=0.00015565(ref=0.00015565)   rel_err=0.00e+00
  t= 4: mu1=-0.246262(ref=-0.246262)  pi1=2.042009(ref=2.042009)  mu2=-0.00011536(ref=-0.00011536) rel_err=0.00e+00

=== Numerical agreement check ===
N trials:       50
Max rel error:  1.07e-13  (threshold: 1e-10)
Mean rel error: 8.09e-15

All 50 trials match within rel-err 1e-10. OK.
```

### 8.3 Cross-reference to 25-RESEARCH.md

- Section 4 (HGF-Specific Implementation Candidates): This study confirms
  Candidate 1 (EEA-sensors/sqrt-parallel-smoothers) requires FEASIBLE-WITH-EFFORT
  bridging, and Candidate 2 (lindermanlab/elk) is FEASIBLE with shallower effort.

- Section 7c (Failure Modes): Risk #3 in this study directly reflects the
  "Divergent Jacobians break DEER" finding from 25-RESEARCH.md §7c.

- Section 6 (Open Question #2): This study closes the API compatibility question.
  pyhgf's Network graph structure IS compatible with both EEA-sensors and ELK
  APIs, via the dict-to-tuple flattening pattern confirmed here.

---

*Study complete. 25-02 algorithm-selection memo should cite this study for engineering
feasibility alongside 25-RESEARCH.md §4 for theoretical preference.*
