---
phase: 12-batched-hierarchical-jax-logp
plan: 02
type: execute
wave: 2
depends_on: ["12-01"]
files_modified:
  - src/prl_hgf/fitting/hierarchical.py
autonomous: true

must_haves:
  truths:
    - "build_logp_ops_batched accepts (P, n_trials, 3) shaped arrays and returns a PyTensor Op"
    - "The batched Op forward pass runs jax.vmap(single_participant_logp)(params_batch, data_batch) and reduces to a scalar via jnp.sum across the participant dimension"
    - "Each lax.scan step inside the per-participant logp performs a Layer 2 stability check and reverts the belief state on instability so unstable trials contribute 0 to logp"
    - "The Op preserves the two-Op split (logp Op + grad Op) so PyMC's gradient machinery works unchanged"
    - "An optional trial_mask argument is accepted (defaulting to all-ones) so future variable-length cohorts reuse the compiled kernel without XLA recompilation"
    - "The -jnp.inf logp sentinel is preserved as a Layer 3 fallback for completely broken parameter combinations"
  artifacts:
    - path: "src/prl_hgf/fitting/hierarchical.py"
      provides: "build_logp_ops_batched factory for both 2-level and 3-level binary HGF, with Layer 2 NaN clamping and trial_mask plumbing"
      exports: ["build_logp_ops_batched"]
      contains: "jax.vmap"
      min_lines: 220
  key_links:
    - from: "src/prl_hgf/fitting/hierarchical.py"
      to: "pyhgf Network.scan_fn"
      via: "build_2level_network()/build_3level_network() then capture base_attrs and scan_fn"
      pattern: "from prl_hgf\\.models\\.hgf_(2|3)level import build_(2|3)level_network"
    - from: "src/prl_hgf/fitting/hierarchical.py"
      to: "pytensor.link.jax.dispatch.jax_funcify"
      via: "@jax_funcify.register(_BatchedLogpOp) so pmjax.sample_numpyro_nuts can JAX-trace through the Op"
      pattern: "@jax_funcify\\.register"
    - from: "src/prl_hgf/fitting/hierarchical.py"
      to: "src/prl_hgf/fitting/ops.py (reference implementation)"
      via: "Identical math at P=1 — same scan_fn, same shallow-copy attribute injection, same softmax-stickiness logp formula"
      pattern: "tonic_volatility|volatility_coupling_children|expected_mean"
---

<objective>
Create the new `src/prl_hgf/fitting/hierarchical.py` module containing `build_logp_ops_batched` — a single factory function that accepts batched `(P, n_trials, 3)` shaped arrays and returns a PyTensor Op whose forward pass `jax.vmap`s a per-participant logp across the participant dimension and reduces to a scalar by summing. The per-participant logp must reuse pyhgf's `Network.scan_fn` (no HGF math reimplementation), inject parameters via the shallow-copy pattern from `ops.py`, and add a tapas-style Layer 2 NaN clamping check inside each scan step. Preserve the two-Op (logp + grad) split so PyMC gradients work unchanged. Plumb through an optional `trial_mask` argument for future variable-length cohorts.

Purpose: This is the compute heart of the v1.2 refactor. The L40S benchmark showed v1.1's per-participant fitting hits ~1.5 s/sample because of CPU↔GPU PCIe dispatch dominating the 420-trial scan. Packing all participants into one `vmap`'d kernel amortizes the dispatch cost — the entire cohort becomes one JAX call instead of P separate ones. The Layer 2 clamping is the safety net so a single bad parameter draw can't NaN-poison the whole cohort.

Output: One new file `src/prl_hgf/fitting/hierarchical.py` containing `build_logp_ops_batched`, supporting both `model_name="hgf_2level"` and `model_name="hgf_3level"`, with all helpers needed to make `jax.vmap` work cleanly. No PyMC model wrapper yet — that lands in Plan 12-03. No tests yet — those land in Plan 12-04 (VALID-01 will be the first time this Op gets numerically validated against `ops.py`).
</objective>

<execution_context>
@C:\Users\aman0087\.claude/get-shit-done/workflows/execute-plan.md
@C:\Users\aman0087\.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@.planning/PROJECT.md
@.planning/ROADMAP.md
@.planning/STATE.md
@.planning/phases/12-batched-hierarchical-jax-logp/12-CONTEXT.md
@.planning/phases/12-batched-hierarchical-jax-logp/12-01-legacy-migration-PLAN.md
@src/prl_hgf/fitting/ops.py
@src/prl_hgf/models/hgf_2level.py
@src/prl_hgf/models/hgf_3level.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Create hierarchical.py with the per-participant JAX logp helper, Layer 2 clamping, and trial_mask plumbing</name>
  <files>src/prl_hgf/fitting/hierarchical.py</files>
  <action>
Create `src/prl_hgf/fitting/hierarchical.py` with `from __future__ import annotations` and `pytensor.config.cxx = ""` at module top (same suppression pattern as `ops.py`). The file should contain (in this order):

1. **Module docstring** explaining: this is the v1.2 batched hierarchical JAX logp; it generalizes `ops.py` from per-participant to a `jax.vmap`'d kernel; it adds tapas-style Layer 2 per-trial NaN clamping; the per-participant math is identical to `ops.py` so VALID-01 (Plan 12-04) can assert bit-exact agreement at P=1.

2. **Constants**:
   - `_MU_2_BOUND: float = 14.0` — tapas's `tapas_ehgf_binary.m` magnitude bound on the level-2 mean
   - `_MODEL_NAMES: tuple[str, ...] = ("hgf_2level", "hgf_3level")`

3. **Private helper `_build_per_participant_logp_2level(input_data_arr, observed_arr, choices_arr) -> Callable`** that returns a pure JAX function `single_participant_logp(omega_2, beta, zeta) -> float` — i.e. the **same body** as `ops.py::build_logp_ops_2level._jax_logp` but with the Layer 2 clamping wrapped around `lax.scan`. Implementation steps:
   - Build a fresh `build_2level_network()` and call `net.input_data(...)` exactly as `ops.py` does
   - Capture `base_attrs = net.attributes` and `scan_fn = net.scan_fn`
   - Pre-compute `values`, `observed_cols`, `time_steps` exactly as in `ops.py`
   - Convert `choices_arr` to `jnp.int32`
   - Define an inner `_clamped_step(carry, scan_inputs_t)` that wraps the original `scan_fn` step:
     ```python
     def _clamped_step(carry, x):
         # carry is (prev_attrs, trial_idx); x is (values_t, observed_t, time_t, None)
         prev_attrs, t = carry
         new_attrs, new_node = scan_fn(prev_attrs, x)
         # Flatten and check finiteness across the entire pytree
         leaves = jax.tree_util.tree_leaves(new_attrs)
         all_finite = jnp.all(jnp.stack([jnp.all(jnp.isfinite(leaf)) for leaf in leaves]))
         # Hard magnitude bound on level-2 means (|mu_2| < 14, tapas convention)
         mu_2_vals = jnp.array([new_attrs[i]["mean"][0] for i in (1, 3, 5)])
         mu_2_ok = jnp.all(jnp.abs(mu_2_vals) < _MU_2_BOUND)
         is_stable = all_finite & mu_2_ok
         safe_attrs = jax.tree_util.tree_map(
             lambda n, o: jnp.where(is_stable, n, o), new_attrs, prev_attrs
         )
         # Pass through node trajectory unchanged for downstream readout; the
         # mask will zero out the logp contribution of unstable trials.
         return (safe_attrs, t + 1), (new_node, is_stable)
     ```
     Note: confirm the exact key for the level-2 mean by reading the pyhgf node attribute layout in the existing `ops.py`. If the key is `"expected_mean"` rather than `"mean"`, use that — match what `ops.py` already accesses on `node_traj`. If the level-2 mean is stored differently (e.g. as a vector under `"mean"` indexed at position 0), adapt accordingly. The intent is a scalar level-2 mean per branch.
   - Run `lax.scan` with the wrapped step; unpack `(node_traj, stability_mask)` from the second scan output
   - Compute `mu1` exactly as `ops.py` does (stack `expected_mean` from input nodes 0/2/4)
   - Compute the per-trial logp contributions exactly as `ops.py` does:
     ```python
     prev = jnp.concatenate([jnp.array([-1]), choices_jax[:-1]])
     stick = (prev[:, None] == jnp.arange(3)[None, :]).astype(jnp.float32)
     logits = beta * mu1 + zeta * stick
     lp = jax.nn.log_softmax(logits, axis=1)
     per_trial_logp = lp[jnp.arange(n_trials), choices_jax]
     ```
   - **Apply the Layer 2 mask** so unstable trials contribute 0:
     ```python
     per_trial_logp = per_trial_logp * stability_mask.astype(per_trial_logp.dtype)
     ```
   - Sum and apply the Layer 3 sentinel:
     ```python
     result = jnp.sum(per_trial_logp)
     return jnp.where(jnp.isnan(result), -jnp.inf, result)
     ```
   - **Layer 2 clamping must use only `jnp.where`/`tree_map`** — no Python `if` on traced values — so the function stays inside `jax.jit` and `jax.vmap`
   - Return the closed-over `single_participant_logp` callable

4. **Private helper `_build_per_participant_logp_3level(input_data_arr, observed_arr, choices_arr) -> Callable`** — same shape but for the 3-level network. Inject parameters following `ops.py::build_logp_ops_3level._jax_logp` exactly (omega_2 into nodes 1/3/5 `tonic_volatility`; omega_3 into node 6 `tonic_volatility`; kappa into node 6 `volatility_coupling_children` and into nodes 1/3/5 `volatility_coupling_parents`; both endpoints required). Returns `single_participant_logp(omega_2, omega_3, kappa, beta, zeta) -> float` with the same Layer 2 clamping wrapper.

5. **Public factory `build_logp_ops_batched(input_data_arr, observed_arr, choices_arr, model_name="hgf_3level", trial_mask=None) -> tuple[Op, int, int]`**:
   - **Inputs:**
     - `input_data_arr: np.ndarray, shape (P, n_trials, 3)` float
     - `observed_arr: np.ndarray, shape (P, n_trials, 3)` int
     - `choices_arr: np.ndarray, shape (P, n_trials)` int
     - `model_name: str` — `"hgf_2level"` or `"hgf_3level"`
     - `trial_mask: np.ndarray | None, shape (P, n_trials)` — defaults to `np.ones((P, n_trials), dtype=int)`. Documented in the docstring as the BATCH-07 padding-ready hook. The kernel multiplies per-trial logp contributions by this mask, so future variable-length cohorts can pad with zeros without recompiling XLA. Phase 12 ships with all-ones masks; padding logic is deferred to v2.
   - **Validate** that `input_data_arr.shape[0] == observed_arr.shape[0] == choices_arr.shape[0]` and that `model_name in _MODEL_NAMES`. Raise `ValueError` with expected vs actual values on mismatch.
   - **Build a single per-participant logp closure** by calling the appropriate `_build_per_participant_logp_*level(input_data_arr[0], observed_arr[0], choices_arr[0], ...)` helper. Because pyhgf's network structure depends only on shape (not data values), one shared `scan_fn`/`base_attrs` is correct across all P participants — but the closure has data baked in. Therefore the cleanest pattern is **NOT** to bake data into the closure for the batched factory; instead, refactor the per-participant helper to take data as runtime arguments. Choose ONE of these two implementations and document why:
     - **Option A (recommended):** Build a network once at the top of `build_logp_ops_batched` (using `input_data_arr[0]` to seed shapes), capture `base_attrs` and `scan_fn`, then write a single `single_participant_logp(params, input_data, observed, choices, trial_mask) -> scalar` JAX function that closes over `base_attrs`/`scan_fn` only (no data). `vmap` over `(params, input_data, observed, choices, trial_mask)` with `in_axes=(0, 0, 0, 0, 0)`.
     - **Option B:** Keep the helpers as-is and do `jax.vmap` over participant index, indexing into the data arrays inside the vmapped function. Cleaner closure but requires lifting `scan_inputs` construction into the vmapped body.
     Pick Option A. The inner `single_participant_logp` should reconstruct `scan_inputs` from the per-participant slice each call (cheap; XLA constant-folds shapes).
   - **vmap'd batched logp:**
     ```python
     batched_logp = jax.vmap(
         single_participant_logp,
         in_axes=(0, 0, 0, 0, 0),  # params, input_data, observed, choices, mask
     )
     ```
   - **Reduction:** the public Op forward returns `jnp.sum(batched_logp(...))` — a scalar.
   - **Two-Op split** mirroring `ops.py`:
     - `_BatchedGradOp` returns gradients with respect to the batched parameter arrays (shape `(P,)` each). Use `jax.value_and_grad` over the params arg only.
     - `_BatchedLogpOp` returns the scalar; delegates `grad` to `_BatchedGradOp`.
     - **Important:** the Op's `make_node` must accept K PyTensor inputs (one per parameter) of shape `(P,)`, not `(scalar,)`. Use `pt.tensor(dtype=floatX, shape=(None,))` for each input. The output stays `pt.scalar(dtype=float)`.
     - **PyMC will pass `omega_2`-shape-`(P,)`** because Plan 12-03 declares `pm.Normal("omega_2", ..., shape=n_participants)`. Confirm via PyTensor docs / PyMC test that a `pt.tensor` input with shape `(None,)` accepts a `(P,)` random variable.
   - **Register `@jax_funcify.register(_BatchedLogpOp)`** so `pmjax.sample_numpyro_nuts` can JAX-trace through the Op. The dispatch implementation should `jit` the same `lambda *params_arrays: jnp.sum(batched_logp(jnp.stack(params_arrays, axis=-1), input_data_arr_jax, observed_arr_jax, choices_arr_jax, trial_mask_jax))` (or equivalent — match the signature you chose for `single_participant_logp`).
   - **Return** `(op_instance, n_participants, n_trials)`.

6. **Module-level `__all__ = ["build_logp_ops_batched"]`**.

**Reference implementation guardrails:**
- The per-participant logp body must produce **bit-exactly** the same numbers as `ops.py::build_logp_ops_3level._jax_logp` when:
  - `P = 1`
  - `trial_mask` is all-ones
  - The Layer 2 clamping never fires (which it should not for valid prior draws)
  Plan 12-04 (VALID-01) is the regression test for this. If you have to choose between mathematical purity and matching `ops.py` exactly, **match `ops.py`**. Same scan_inputs structure, same softmax/stickiness formula, same `-jnp.inf` sentinel, same dtype handling.
- **Do NOT reimplement HGF math.** All updates flow through `pyhgf.Network.scan_fn`.
- **Layer 2 clamping pseudocode** from `12-CONTEXT.md`:
  ```
  is_stable = jnp.all(jnp.isfinite(new_flat)) & (jnp.abs(new_mu_2) < 14)
  safe_attrs = jax.tree_util.tree_map(
      lambda n, o: jnp.where(is_stable, n, o), new_attrs, prev_attrs
  )
  per_trial_logp = per_trial_logp * trial_mask
  ```
  Use this pattern verbatim. Pure JAX, no Python branches on traced values.
- **Type hints:** Python 3.10+ native syntax (`list[float]`, `np.ndarray | None`). NumPy-style docstrings on every public and private function. `from __future__ import annotations` at top.
  </action>
  <verify>
1. `python -c "from prl_hgf.fitting.hierarchical import build_logp_ops_batched; print('OK')"` succeeds (file imports cleanly with no syntax / import errors)
2. **Smoke test the factory at P=1:**
   ```bash
   python -c "
   import numpy as np
   from prl_hgf.fitting.hierarchical import build_logp_ops_batched
   inp = np.zeros((1, 50, 3), dtype=float); inp[0, :, 0] = 0.5
   obs = np.zeros((1, 50, 3), dtype=int); obs[0, :, 0] = 1
   ch = np.zeros((1, 50), dtype=int)
   op, P, T = build_logp_ops_batched(inp, obs, ch, model_name='hgf_3level')
   print(f'Built op: P={P}, T={T}')
   "
   ```
   Should print `Built op: P=1, T=50` without raising.
3. **Smoke test the factory at P=3** (same command, change `(1, 50, 3)` to `(3, 50, 3)` etc) — should print `P=3, T=50`.
4. **Forward pass smoke test at P=2:**
   ```bash
   python -c "
   import numpy as np, pytensor.tensor as pt
   from prl_hgf.fitting.hierarchical import build_logp_ops_batched
   inp = np.zeros((2, 50, 3), dtype=float); inp[:, :, 0] = 0.5
   obs = np.zeros((2, 50, 3), dtype=int); obs[:, :, 0] = 1
   ch = np.zeros((2, 50), dtype=int)
   op, P, T = build_logp_ops_batched(inp, obs, ch, model_name='hgf_3level')
   o2 = pt.as_tensor_variable(np.array([-3.0, -3.0]))
   o3 = pt.as_tensor_variable(np.array([-6.0, -6.0]))
   k  = pt.as_tensor_variable(np.array([1.0, 1.0]))
   b  = pt.as_tensor_variable(np.array([3.0, 3.0]))
   z  = pt.as_tensor_variable(np.array([0.5, 0.5]))
   lp = op(o2, o3, k, b, z).eval()
   print('logp:', float(lp))
   assert np.isfinite(lp), 'logp is not finite'
   "
   ```
   Should print a finite negative number. Both participants have identical inputs/params so the result should be exactly 2x the per-participant logp from `ops.py` for the same data — but **do not assert that here**; that's VALID-01 in Plan 12-04.
5. `python -m ruff check src/prl_hgf/fitting/hierarchical.py`
6. `python -m mypy src/prl_hgf/fitting/hierarchical.py` (warnings tolerated; no hard errors)
  </verify>
  <done>
- `src/prl_hgf/fitting/hierarchical.py` exists and imports cleanly
- `build_logp_ops_batched` accepts `(P, n_trials, 3)` arrays for both `model_name="hgf_2level"` and `model_name="hgf_3level"`
- Building the factory at P=1, P=2, P=3 all succeed without raising
- The forward pass on P=2 with identical participants produces a finite scalar logp
- The module contains a `_clamped_step` (or equivalent) that uses `jnp.where` + `jax.tree_util.tree_map` for Layer 2 reversion (no Python `if` on traced values)
- The two-Op split (`_BatchedLogpOp` + `_BatchedGradOp`) is registered with `@jax_funcify.register` so `pmjax.sample_numpyro_nuts` can dispatch
- `trial_mask` argument is plumbed through with default `np.ones(...)`
- ruff is clean; mypy has no hard errors
  </done>
</task>

</tasks>

<verification>
1. `python -c "from prl_hgf.fitting.hierarchical import build_logp_ops_batched"` succeeds
2. Smoke test at P=1, P=2, P=3 (`model_name="hgf_3level"`) all build the Op without errors
3. Smoke test at P=2 forward-pass (`op(o2, o3, k, b, z).eval()`) returns a finite scalar
4. Smoke test at P=2 with `model_name="hgf_2level"` (`op(o2, b, z).eval()`) returns a finite scalar
5. `python -m ruff check src/prl_hgf/fitting/hierarchical.py` is clean
6. `grep -n "jnp.where" src/prl_hgf/fitting/hierarchical.py` shows the Layer 2 reversion pattern (use Grep tool)
7. `grep -n "@jax_funcify.register" src/prl_hgf/fitting/hierarchical.py` shows the dispatch is registered
8. `tests/test_fitting.py` non-slow subset still passes (regression — Plan 12-01's shims still work)
</verification>

<success_criteria>
- `src/prl_hgf/fitting/hierarchical.py` exists with `build_logp_ops_batched` exported
- The factory accepts `(P, n_trials, 3)` shaped batched arrays, supports both 2-level and 3-level networks, and returns a tuple `(op, n_participants, n_trials)`
- The Op forward pass runs `jax.vmap` over the participant dimension and reduces to a scalar via `jnp.sum`
- Layer 2 clamping is implemented inside the per-participant scan step using `jnp.where` + `jax.tree_util.tree_map` (BATCH-04)
- The two-Op split is preserved (BATCH-03) and `@jax_funcify.register` makes the Op JAX-traceable for `pmjax.sample_numpyro_nuts` (BATCH-02)
- `trial_mask` argument is plumbed through with all-ones default (BATCH-07)
- The `-jnp.inf` Layer 3 sentinel is preserved (BATCH-06)
- All smoke tests pass; existing legacy tests are not broken
</success_criteria>

<output>
After completion, create `.planning/phases/12-batched-hierarchical-jax-logp/12-02-SUMMARY.md` documenting:
- Which option was chosen for `single_participant_logp` (closure-over-data vs runtime-arg) and why
- The exact pyhgf attribute key used to access the level-2 mean for the `|mu_2| < 14` clamping check
- Any deviations from `ops.py`'s math (there should be none beyond the Layer 2 clamping wrapper and the trial_mask multiplication)
- Smoke-test logp values at P=1 / P=2 / P=3 (sanity-check baseline; not a regression target)
</output>
