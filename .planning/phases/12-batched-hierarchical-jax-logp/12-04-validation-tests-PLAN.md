---
phase: 12-batched-hierarchical-jax-logp
plan: 04
type: execute
wave: 4
depends_on: ["12-03"]
files_modified:
  - tests/test_hierarchical_logp.py
autonomous: true

must_haves:
  truths:
    - "VALID-01: at P=1, build_logp_ops_batched returns the same float64 value as build_logp_ops_3level (and build_logp_ops_2level) for matched inputs and parameters, within atol=1e-12 / rtol=0"
    - "VALID-02: fitting 5 synthetic participants sequentially via the legacy path and batched via fit_batch_hierarchical with matched seeds yields per-parameter posterior means that agree within 3 x max(mcse_legacy, mcse_batched)"
    - "Layer 2 clamping diagnostic is exercised by at least one test that drives parameters into the unstable region and confirms the test does not NaN out"
    - "All new tests live in tests/test_hierarchical_logp.py and integrate with the existing pytest suite"
  artifacts:
    - path: "tests/test_hierarchical_logp.py"
      provides: "VALID-01 bit-exact regression, VALID-02 statistical-equivalence regression, Layer 2 clamping smoke test"
      min_lines: 250
      contains: "VALID-01"
  key_links:
    - from: "tests/test_hierarchical_logp.py"
      to: "src/prl_hgf/fitting/hierarchical.py"
      via: "from prl_hgf.fitting.hierarchical import build_logp_ops_batched, fit_batch_hierarchical"
      pattern: "from prl_hgf\\.fitting\\.hierarchical import"
    - from: "tests/test_hierarchical_logp.py"
      to: "src/prl_hgf/fitting/ops.py"
      via: "from prl_hgf.fitting.ops import build_logp_ops_3level, build_logp_ops_2level"
      pattern: "from prl_hgf\\.fitting\\.ops import"
    - from: "tests/test_hierarchical_logp.py"
      to: "src/prl_hgf/fitting/legacy/batch.py"
      via: "from prl_hgf.fitting.legacy import fit_batch (for VALID-02 sequential reference fit)"
      pattern: "from prl_hgf\\.fitting\\.legacy import"
---

<objective>
Create `tests/test_hierarchical_logp.py` containing the two phase-12 validation tests and a small Layer-2 clamping smoke test:

1. **VALID-01 (bit-exact at P=1):** The new `build_logp_ops_batched` forward pass at `n_participants=1` must return float64-identical values to the existing `build_logp_ops_3level` (and `build_logp_ops_2level`) for matched inputs and matched parameters. Tolerance: `atol=1e-12, rtol=0`. This is the canary regression test — if it fails, something subtle is wrong (dtype mismatch, reduction order, broadcasting, attribute injection drift).

2. **VALID-02 (within-MCSE at P=5):** Fit 5 synthetic participants sequentially via the legacy `fit_batch` path on CPU and the same 5 participants batched via `fit_batch_hierarchical` on CPU, both with matched seeds. Per-parameter posterior means must agree within `3 × max(mcse_legacy, mcse_batched)` using `arviz.mcse()` for the per-chain Monte Carlo standard error.

3. **Layer 2 clamping smoke test:** Drive a single participant's logp into the unstable region (e.g. omega_2 = -0.5, which lets mu_2 wander) and confirm the batched logp returns a finite value (i.e. clamping fired and rescued the trial) rather than NaN. This is not a numerical equivalence test — it's an existence test for the safety net.

Purpose: These three tests are the entire validation gate for Phase 12. VALID-01 is the canary that fires before any MCMC work — if the batched logp doesn't match the per-participant logp at P=1, downstream MCMC results are meaningless. VALID-02 is the statistical sanity check that the joint NUTS adaptation across the 1500-dim batched model doesn't drift from per-participant adaptation in a way that breaks BF semantics. The clamping smoke test confirms the safety net actually catches NaNs rather than passing them through.

Output: One new test file `tests/test_hierarchical_logp.py` with at least the three required tests + a couple of supporting fixtures.
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
@.planning/phases/12-batched-hierarchical-jax-logp/12-02-batched-jax-logp-PLAN.md
@.planning/phases/12-batched-hierarchical-jax-logp/12-03-hierarchical-pymc-orchestrator-PLAN.md
@src/prl_hgf/fitting/ops.py
@src/prl_hgf/fitting/hierarchical.py
@tests/test_fitting.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Write VALID-01 bit-exact regression test and the Layer 2 clamping smoke test in tests/test_hierarchical_logp.py</name>
  <files>tests/test_hierarchical_logp.py</files>
  <action>
Create the new file `tests/test_hierarchical_logp.py` with `from __future__ import annotations` at top and a module docstring referencing `12-CONTEXT.md` "Validation Protocol (VALID-01, VALID-02)".

**Module-level imports:**
```python
from __future__ import annotations

import math
import sys
from pathlib import Path

import numpy as np
import pytest

# Ensure the repo root is on sys.path for cluster compatibility
_root = Path(__file__).resolve().parents[1]
if str(_root) not in sys.path:
    sys.path.insert(0, str(_root))
```

**Session-scoped fixture `_simulated_data_session`** that builds a real ~50-trial simulated session for one participant using the same pattern as `tests/test_fitting.py::_simulated_data` (read it first to copy the seed-handling and `prepare_input_data` calls). Returns `(input_data_arr, observed_arr, choices_arr)` shaped `(n_trials, 3)`, `(n_trials, 3)`, `(n_trials,)`.

**Test 1: `test_valid_01_batched_at_p1_bit_exact_3level`**

```python
def test_valid_01_batched_at_p1_bit_exact_3level(_simulated_data_session):
    """VALID-01: batched logp at P=1 must equal per-participant logp bit-exactly (3-level).

    See .planning/phases/12-batched-hierarchical-jax-logp/12-CONTEXT.md
    "Validation Protocol (VALID-01)".
    """
    import pytensor.tensor as pt

    from prl_hgf.fitting.hierarchical import build_logp_ops_batched
    from prl_hgf.fitting.ops import build_logp_ops_3level

    inp_1d, obs_1d, ch_1d = _simulated_data_session  # shapes (T, 3), (T, 3), (T,)

    # Per-participant reference Op (existing implementation)
    legacy_op, _ = build_logp_ops_3level(inp_1d, obs_1d, ch_1d)

    # Batched Op at P=1 — wrap each input in a leading axis
    inp_b = inp_1d[None, ...]
    obs_b = obs_1d[None, ...]
    ch_b = ch_1d[None, ...]
    batched_op, P, T = build_logp_ops_batched(inp_b, obs_b, ch_b, model_name="hgf_3level")
    assert P == 1, f"expected P=1, got {P}"

    # Pick a deterministic parameter set in the valid (stable) region
    omega_2_val, omega_3_val, kappa_val, beta_val, zeta_val = -3.0, -6.0, 1.0, 3.0, 0.5

    # Legacy forward pass — scalar inputs
    legacy_lp = float(
        legacy_op(
            pt.as_tensor_variable(omega_2_val),
            pt.as_tensor_variable(omega_3_val),
            pt.as_tensor_variable(kappa_val),
            pt.as_tensor_variable(beta_val),
            pt.as_tensor_variable(zeta_val),
        ).eval()
    )

    # Batched forward pass — shape (1,) inputs
    batched_lp = float(
        batched_op(
            pt.as_tensor_variable(np.array([omega_2_val])),
            pt.as_tensor_variable(np.array([omega_3_val])),
            pt.as_tensor_variable(np.array([kappa_val])),
            pt.as_tensor_variable(np.array([beta_val])),
            pt.as_tensor_variable(np.array([zeta_val])),
        ).eval()
    )

    assert math.isfinite(legacy_lp), f"legacy logp not finite: {legacy_lp}"
    assert math.isfinite(batched_lp), f"batched logp not finite: {batched_lp}"
    np.testing.assert_allclose(
        batched_lp,
        legacy_lp,
        atol=1e-12,
        rtol=0.0,
        err_msg=(
            f"VALID-01 FAILED: batched P=1 logp ({batched_lp!r}) does not match "
            f"per-participant 3-level logp ({legacy_lp!r}) at atol=1e-12. "
            f"This is the canary — investigate dtype, reduction order, broadcasting, "
            f"or attribute-injection drift between ops.py and hierarchical.py."
        ),
    )
```

**Test 2: `test_valid_01_batched_at_p1_bit_exact_2level`** — same structure but for `build_logp_ops_2level` and `model_name="hgf_2level"` with parameters `(omega_2_val=-3.0, beta_val=3.0, zeta_val=0.5)`.

**Test 3: `test_valid_01_batched_at_p2_doubles_logp`**

This is a sanity-check that the vmap+sum reduction is correct. Build the batched Op at P=2 with two **identical** participants and assert the result is `2 * legacy_lp` within `atol=1e-12`. If this fails the reduction is wrong even when bit-exact at P=1.

```python
def test_valid_01_batched_at_p2_doubles_logp(_simulated_data_session):
    """At P=2 with identical participants, batched logp must equal 2 x legacy logp."""
    import pytensor.tensor as pt

    from prl_hgf.fitting.hierarchical import build_logp_ops_batched
    from prl_hgf.fitting.ops import build_logp_ops_3level

    inp_1d, obs_1d, ch_1d = _simulated_data_session
    legacy_op, _ = build_logp_ops_3level(inp_1d, obs_1d, ch_1d)
    legacy_lp = float(legacy_op(*[pt.as_tensor_variable(v) for v in (-3.0, -6.0, 1.0, 3.0, 0.5)]).eval())

    inp_b = np.stack([inp_1d, inp_1d], axis=0)
    obs_b = np.stack([obs_1d, obs_1d], axis=0)
    ch_b = np.stack([ch_1d, ch_1d], axis=0)
    batched_op, P, _ = build_logp_ops_batched(inp_b, obs_b, ch_b, model_name="hgf_3level")
    assert P == 2

    batched_lp = float(
        batched_op(
            pt.as_tensor_variable(np.array([-3.0, -3.0])),
            pt.as_tensor_variable(np.array([-6.0, -6.0])),
            pt.as_tensor_variable(np.array([1.0, 1.0])),
            pt.as_tensor_variable(np.array([3.0, 3.0])),
            pt.as_tensor_variable(np.array([0.5, 0.5])),
        ).eval()
    )

    np.testing.assert_allclose(batched_lp, 2.0 * legacy_lp, atol=1e-12, rtol=0.0)
```

**Test 4: `test_layer_2_clamping_returns_finite_under_unstable_params`**

Push parameters into a region likely to trigger Layer 2 clamping (e.g. `omega_2 = -0.5` which permits large mu_2 swings) and assert the batched logp returns a finite (non-NaN, non-`-inf`) value, indicating the safety net engaged. We do NOT assert a numerical value — only that the kernel survived without poisoning the logp.

```python
def test_layer_2_clamping_returns_finite_under_unstable_params(_simulated_data_session):
    """Layer 2 clamping smoke test: unstable params should not NaN out the logp.

    See .planning/phases/12-batched-hierarchical-jax-logp/12-CONTEXT.md
    "Layer 2 NaN Clamping (BATCH-04)".
    """
    import pytensor.tensor as pt

    from prl_hgf.fitting.hierarchical import build_logp_ops_batched

    inp_1d, obs_1d, ch_1d = _simulated_data_session
    inp_b = inp_1d[None, ...]
    obs_b = obs_1d[None, ...]
    ch_b = ch_1d[None, ...]

    op, _, _ = build_logp_ops_batched(inp_b, obs_b, ch_b, model_name="hgf_3level")

    # Push omega_2 close to zero (allowed by TruncatedNormal upper=0 but unstable)
    lp = float(
        op(
            pt.as_tensor_variable(np.array([-0.1])),
            pt.as_tensor_variable(np.array([-6.0])),
            pt.as_tensor_variable(np.array([1.0])),
            pt.as_tensor_variable(np.array([3.0])),
            pt.as_tensor_variable(np.array([0.5])),
        ).eval()
    )

    assert math.isfinite(lp) or lp == -math.inf, (
        f"Layer 2 clamping smoke test FAILED: logp is NaN under unstable params. "
        f"Either clamping is not firing, or the -inf sentinel path is broken. "
        f"Got logp={lp}."
    )
    # Allow either: clamping fired and rescued (finite logp) OR Layer 3 sentinel
    # caught a fully-broken trace (-inf). NaN is the only failure mode.
```

**Type hints and docstrings** — NumPy-style throughout, line length 88, ruff-clean.
  </action>
  <verify>
1. `python -m pytest tests/test_hierarchical_logp.py::test_valid_01_batched_at_p1_bit_exact_3level -v --timeout=120` — must PASS
2. `python -m pytest tests/test_hierarchical_logp.py::test_valid_01_batched_at_p1_bit_exact_2level -v --timeout=120` — must PASS
3. `python -m pytest tests/test_hierarchical_logp.py::test_valid_01_batched_at_p2_doubles_logp -v --timeout=120` — must PASS
4. `python -m pytest tests/test_hierarchical_logp.py::test_layer_2_clamping_returns_finite_under_unstable_params -v --timeout=120` — must PASS
5. `python -m ruff check tests/test_hierarchical_logp.py` — clean

**If VALID-01 fails:** STOP. Do not loosen the tolerance. Report the diff and route back to Plan 12-02 for diagnosis. Possible causes (debug in this order): (a) dtype mismatch (`float32` vs `float64` somewhere in the new code), (b) Layer 2 clamping changing the result for stable inputs (it shouldn't — `is_stable=True` means `safe_attrs == new_attrs`), (c) reduction order mismatch (`jnp.sum(per_trial_logp)` vs `jnp.sum(per_trial_logp * mask)` with mask all-ones — these should be identical but FP can drift), (d) attribute-injection drift between `ops.py::build_logp_ops_3level._jax_logp` and `hierarchical.py`'s injection block.
  </verify>
  <done>
- All four tests in Task 1 PASS
- VALID-01 holds at `atol=1e-12` for both 2-level and 3-level
- The P=2 doubling test confirms the vmap+sum reduction
- The Layer 2 clamping smoke test confirms unstable params yield finite-or-(-inf), never NaN
- ruff clean on the new test file
  </done>
</task>

<task type="auto">
  <name>Task 2: Write VALID-02 statistical-equivalence test (5 participants, legacy vs batched, within-MCSE)</name>
  <files>tests/test_hierarchical_logp.py</files>
  <action>
Append the VALID-02 test to `tests/test_hierarchical_logp.py`. Mark it `@pytest.mark.slow` because it runs real MCMC (~3-10 min on CPU depending on draw count).

**Fixture `_five_participant_sim_df`** — generate a synthetic 5-participant tidy DataFrame with fixed seed using `simulate_batch` from `prl_hgf.simulation.batch` (or equivalent existing function in this codebase). Use a small per-participant trial count (e.g. ~100 trials) to keep the test runtime tractable. Single session, single group. Returns the DataFrame.

If `simulate_batch` requires more setup than is reasonable for a fixture, instead manufacture the trial-level rows directly with random reward sequences using a fixed `np.random.default_rng(seed)` — the test only needs *some* sim_df with the right schema, not statistically perfect simulated data. Document the choice.

**Test: `test_valid_02_batched_vs_legacy_within_mcse`**

```python
@pytest.mark.slow
def test_valid_02_batched_vs_legacy_within_mcse(_five_participant_sim_df):
    """VALID-02: batched fit and sequential legacy fit must agree within 3 x MCSE.

    Fits 5 synthetic participants two ways:

    1. Sequentially via the legacy ``fit_batch`` (one PyMC model per participant).
    2. Batched via ``fit_batch_hierarchical`` (one PyMC model for the cohort).

    Both runs use matched seeds and matched MCMC settings (within the constraint
    that the legacy path uses the pymc sampler and the batched path uses
    pmjax.sample_numpyro_nuts because of the _init_jitter bug). Per-parameter
    posterior means must agree within 3 x max(mcse_legacy, mcse_batched) using
    arviz.mcse() for the per-chain Monte Carlo standard error.

    See .planning/phases/12-batched-hierarchical-jax-logp/12-CONTEXT.md
    "Validation Protocol (VALID-02)".
    """
    import arviz as az

    from prl_hgf.fitting.hierarchical import fit_batch_hierarchical
    from prl_hgf.fitting.legacy import fit_batch as legacy_fit_batch

    sim_df = _five_participant_sim_df
    model_name = "hgf_2level"
    n_chains = 2
    n_draws = 500
    n_tune = 500
    target_accept = 0.9
    seed = 1234

    # Reduced settings (500/500 instead of 1000/1000) per 12-CONTEXT.md
    # "VALID-02 ... the test may use reduced draws (e.g., 500 x 500) with
    # explicit documentation that the tolerance accounts for this".
    # The 3x MCSE tolerance is the all-purpose buffer.

    # Legacy: per-participant loop, returns DataFrame + idata_dict
    legacy_df, legacy_idata_dict = legacy_fit_batch(
        sim_df,
        model_name=model_name,
        n_chains=n_chains,
        n_draws=n_draws,
        n_tune=n_tune,
        target_accept=target_accept,
        random_seed=seed,
        cores=1,
        sampler="pymc",
        return_idata=True,
    )

    # Batched: one cohort fit, returns single InferenceData
    batched_idata = fit_batch_hierarchical(
        sim_df,
        model_name=model_name,
        n_chains=n_chains,
        n_draws=n_draws,
        n_tune=n_tune,
        target_accept=target_accept,
        random_seed=seed,
        progressbar=False,
    )

    # For each participant, compare per-parameter posterior means
    # var_names depends on model_name; for hgf_2level: omega_2, beta, zeta
    var_names = ["omega_2", "beta", "zeta"]

    failures = []
    for p_idx, ((pid, grp, sess), _) in enumerate(
        sim_df.groupby(["participant_id", "group", "session"], sort=False)
    ):
        legacy_idata = legacy_idata_dict[(pid, grp, sess)]
        if legacy_idata is None:
            pytest.skip(f"legacy fit failed for participant {pid}; cannot compare")

        for var in var_names:
            legacy_mean = float(legacy_idata.posterior[var].mean().values)
            legacy_mcse = float(az.mcse(legacy_idata, var_names=[var]).to_array().values.squeeze())

            # Batched posterior is shape (chain, draw, participant)
            batched_var = batched_idata.posterior[var].isel({batched_idata.posterior[var].dims[-1]: p_idx})
            batched_mean = float(batched_var.mean().values)
            # Build a temporary InferenceData slice for mcse
            batched_slice_idata = az.InferenceData(
                posterior=batched_idata.posterior[[var]].isel(
                    {batched_idata.posterior[var].dims[-1]: p_idx}
                )
            )
            batched_mcse = float(az.mcse(batched_slice_idata, var_names=[var]).to_array().values.squeeze())

            tolerance = 3.0 * max(legacy_mcse, batched_mcse)
            diff = abs(legacy_mean - batched_mean)
            if diff > tolerance:
                failures.append(
                    f"  {pid} / {var}: legacy_mean={legacy_mean:.4f}, "
                    f"batched_mean={batched_mean:.4f}, diff={diff:.4f}, "
                    f"3*MCSE={tolerance:.4f} (legacy_mcse={legacy_mcse:.4f}, "
                    f"batched_mcse={batched_mcse:.4f})"
                )

    if failures:
        pytest.fail(
            "VALID-02 FAILED: batched and legacy posterior means differ by more "
            "than 3 x MCSE for the following (participant, parameter) pairs:\n"
            + "\n".join(failures)
            + "\n\nThis indicates the joint NUTS adaptation across the batched "
              "1500-dim model is drifting from per-participant adaptation in a "
              "way that breaks v1.1 statistical semantics. Investigate divergence "
              "counts and r_hat in both fits before loosening the tolerance."
        )
```

**Important — handle the participant-dim coord access defensively**: the batched `InferenceData` may label the participant dim as `"participant"` (if Plan 12-03 used `pm.Model(coords=...)`) or as `"omega_2_dim_0"` (if it left the default). The slicing logic above uses `batched_idata.posterior[var].dims[-1]` to grab whatever the last dim is — this should work regardless. If it doesn't, fix Plan 12-03 to label it consistently.

**Tolerances note**: 3x MCSE is the documented Phase 12 tolerance. If the test fails because 3x is too tight at 500/500 draws, **do not loosen it without documenting why in the SUMMARY**. First check whether divergences in either run explain the drift; if so, raise `target_accept` to 0.95 in the test (matching the Phase 12 default in `12-CONTEXT.md` "MCMC Configuration") and re-run.
  </action>
  <verify>
1. `python -m pytest tests/test_hierarchical_logp.py::test_valid_02_batched_vs_legacy_within_mcse -v -m slow --timeout=900` — must PASS
2. `python -m pytest tests/test_hierarchical_logp.py -v --timeout=120 -k "not slow"` — non-slow tests still pass
3. `python -m ruff check tests/test_hierarchical_logp.py` — clean
4. **Regression check:** `python -m pytest tests/test_fitting.py -v -k "not slow" --timeout=60` — legacy fast tests still pass
  </verify>
  <done>
- VALID-02 test exists, marked `@pytest.mark.slow`, and PASSES on CPU within the 3x MCSE tolerance
- Test produces an actionable failure message listing per-(participant, parameter) drift if it fails
- Both fits use matched seeds and the same `n_chains/n_draws/n_tune/target_accept` settings (modulo the documented sampler difference)
- All Phase 12 tests (VALID-01 set + clamping smoke + VALID-02) live in `tests/test_hierarchical_logp.py` and integrate cleanly with the existing pytest suite
- ruff clean on the new test file
  </done>
</task>

</tasks>

<verification>
1. `python -m pytest tests/test_hierarchical_logp.py -v --timeout=120 -k "not slow"` — VALID-01 tests + clamping smoke all PASS
2. `python -m pytest tests/test_hierarchical_logp.py::test_valid_02_batched_vs_legacy_within_mcse -v -m slow --timeout=900` — VALID-02 PASSES
3. `python -m pytest tests/test_fitting.py -v -k "not slow" --timeout=60` — legacy fitting tests still PASS (regression)
4. `python -m ruff check tests/test_hierarchical_logp.py` — no violations
5. The test file contains the strings "VALID-01" and "VALID-02" so a future grep can locate them
</verification>

<success_criteria>
- VALID-01: At P=1 and at P=2-with-identical-participants, the batched logp matches the per-participant logp at `atol=1e-12, rtol=0` for both 2-level and 3-level models
- VALID-02: At P=5 with matched seeds, batched and legacy posterior means agree within `3 × max(mcse_legacy, mcse_batched)` per parameter per participant
- Layer 2 clamping smoke test passes — unstable params yield finite-or-(-inf), never NaN
- New test file integrates with the existing pytest suite and slow-marker convention
- All BATCH and VALID requirements for Phase 12 are now closed: BATCH-01..07 (Plans 12-02 / 12-03) + VALID-01 / VALID-02 (this plan)
</success_criteria>

<output>
After completion, create `.planning/phases/12-batched-hierarchical-jax-logp/12-04-SUMMARY.md` documenting:
- The exact bit-exact diff (should be 0.0) for the VALID-01 3-level test, captured from the test output
- The per-(participant, parameter) drift table for VALID-02 (legacy_mean, batched_mean, diff, 3xMCSE) — even when passing, log it for the milestone audit
- Any tolerance adjustments and their justification (default expectation: zero adjustments)
- Total wall time for the slow test
- Confirmation that all 9 Phase 12 requirements (BATCH-01 through BATCH-07, VALID-01, VALID-02) are now satisfied
</output>
