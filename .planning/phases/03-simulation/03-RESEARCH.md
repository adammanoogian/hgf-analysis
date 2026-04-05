# Phase 03: Simulation - Research

**Researched:** 2026-04-05
**Domain:** Synthetic participant simulation using pyhgf 0.2.8 Network API
**Confidence:** HIGH (all findings verified against actual source code and empirical tests)

## Summary

Phase 3 requires an interactive simulation loop — not a batch forward pass — because
each trial's choice depends on the model's current beliefs, which depend on previous
choices and rewards. The core challenge is that pyhgf's `input_data` method runs a
full JAX scan over all provided trials, starting from the initial `self.attributes`
state each time. This means calling `input_data` twice does NOT accumulate state; the
second call always resets to the original initial attributes.

However, a working trial-by-trial simulation pattern exists: after each 1-trial
`input_data` call, copy `net.last_attributes` back into `net.attributes`. This
correctly threads state through the simulation. The belief needed for choice
generation at trial t is `net.attributes[INPUT_NODE]["expected_mean"]` — the
current prior before the trial's update — read before calling `input_data`.

The batch simulation of 180 participants (30/group x 2 groups x 3 sessions) takes
approximately 24 minutes on the development machine. This is acceptable for a
one-time generation step. Simulation output should be saved as tidy CSVs with
ground-truth parameters embedded in rows (for later parameter recovery analysis).

**Primary recommendation:** Use the `attributes carry` pattern for trial-by-trial
simulation. Build networks fresh for each participant with their individual parameters;
pre-warm the JIT compiler once before the batch loop. Structure code as
`simulate_agent()` (single participant) called by `simulate_batch()` (all participants).

## Standard Stack

### Core (from Phase 2, already installed)

| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| pyhgf | 0.2.8 | HGF network forward pass | Project-locked decision |
| jax / jax.numpy | (pinned in pyproject.toml) | Array ops inside pyhgf | Required by pyhgf |
| numpy | any | RNG, array construction for simulation | Standard, no JAX overhead |
| pandas | any | Tidy output DataFrames, CSV serialisation | Standard for tabular data |

### Supporting

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| json | stdlib | Embed ground-truth params in output | Serialise dict to string column |

### Installation

No new packages required — all already installed in `ds_env` from Phase 1/2.

## Architecture Patterns

### Recommended Module Structure

```
src/prl_hgf/
├── simulation/
│   ├── __init__.py
│   ├── agent.py       # simulate_agent() — single participant, single session
│   └── batch.py       # simulate_batch() — all groups x sessions
```

This matches the ROADMAP.md proposed structure (`src/simulation/agent.py`,
`src/simulation/batch.py`).

### Pattern 1: Trial-by-Trial Simulation with Attribute Carry

**What:** Each trial calls `input_data` with a single-trial array, then carries
`last_attributes` back into `attributes` to thread state forward.

**When to use:** The only correct pattern for interactive simulation. DO NOT use
batch `input_data` (see Anti-Patterns below).

**Verified working** (empirically tested: trial-by-trial with attribute carry
produces byte-identical results to a single batch call when choices+rewards are
pre-known):

```python
# Source: empirically verified against pyhgf 0.2.8 source code
def simulate_agent(
    net: Network,
    trials: list[Trial],
    beta: float,
    zeta: float,
    rng: np.random.Generator,
) -> tuple[list[int], list[int]]:
    """Run one session's simulation: trial-by-trial with belief-driven choices."""
    choices: list[int] = []
    rewards: list[int] = []
    prev_choice: int = -1  # sentinel: no stickiness on trial 0

    for trial in trials:
        # Step 1: Read PRIOR beliefs from current attributes (before this trial's update)
        p_reward = np.array([
            float(net.attributes[0]["expected_mean"]),  # cue 0
            float(net.attributes[2]["expected_mean"]),  # cue 1
            float(net.attributes[4]["expected_mean"]),  # cue 2
        ])

        # Step 2: Softmax with stickiness
        stick = np.zeros(3)
        if prev_choice >= 0:
            stick[prev_choice] = 1.0
        logits = beta * p_reward + zeta * stick
        logits -= logits.max()         # numerical stability
        probs = np.exp(logits) / np.exp(logits).sum()

        # Step 3: Sample choice
        choice = int(rng.choice(3, p=probs))

        # Step 4: Generate reward from environment
        reward = int(rng.random() < trial.cue_probs[choice])

        choices.append(choice)
        rewards.append(reward)

        # Step 5: Update network with this trial's observation (1 trial at a time)
        inp_t = np.zeros((1, 3), dtype=float)
        obs_t = np.zeros((1, 3), dtype=int)
        inp_t[0, choice] = float(reward)
        obs_t[0, choice] = 1
        net.input_data(input_data=inp_t, observed=obs_t)

        # Step 6: CRITICAL — carry state forward for next trial
        net.attributes = net.last_attributes
        prev_choice = choice

    return choices, rewards
```

### Pattern 2: JIT Pre-Warm Before Batch Loop

**What:** Build one network with default params and call `input_data` once before the
batch loop. This triggers JAX JIT compilation. Subsequent calls with different params
but the same topology still require recompilation (each network instance has its own
`scan_fn`), so the speedup is limited.

**When to use:** Always — reduces first-participant overhead from ~7s to ~5s.

```python
# Warm up JIT once before batch simulation
_warmup_net = build_3level_network()  # or build_2level_network()
_warmup_net.input_data(
    input_data=np.zeros((1, 3)),
    observed=np.ones((1, 3), dtype=int),
)
```

**Important:** `scan_fn` cannot be shared across network instances with different
parameter values (confirmed via test: JAX raises `ShapedArray` mismatch error for
the kappa parameter). Each participant needs a fresh network built from their params.

### Pattern 3: Seeded RNG per Participant-Session

**What:** Derive a unique seed for each (participant_idx, group, session) from the
master seed using `numpy.random.default_rng(master_seed).integers()`.

**When to use:** Always. Ensures full reproducibility without seed collision.

```python
# Source: numpy.random.default_rng design
rng_master = np.random.default_rng(config.simulation.master_seed)
# Draw 180 x 2 seeds (for choices and for env structure) upfront
seeds = rng_master.integers(0, 2**31, size=(180, 2))

# Then per participant:
# env_seed = seeds[participant_idx, 0]   -> generate_session() trial structure
# sim_seed = seeds[participant_idx, 1]   -> stochastic choices in simulate_agent()
```

### Pattern 4: Parameter Sampling with Clipping

**What:** Draw individual parameters from `Normal(group_mean, group_sd)`, then
clip to model bounds (from `configs/prl_analysis.yaml`). For non-baseline sessions,
add the session delta BEFORE clipping.

**When to use:** Always. The Normal(mean, sd) distribution for kappa and beta can
produce negative values with <1% probability, which would crash pyhgf.

```python
# Source: GroupParamDist from task_config.py + model bounds from prl_analysis.yaml
def sample_participant_params(
    group_cfg: GroupConfig,
    session_cfg: SessionConfig | None,
    session_idx: int,   # 0=baseline, 1=post_dose, 2=followup
    rng: np.random.Generator,
) -> dict[str, float]:
    omega_2 = rng.normal(group_cfg.omega_2.mean, group_cfg.omega_2.sd)
    omega_3 = rng.normal(group_cfg.omega_3.mean, group_cfg.omega_3.sd)
    kappa   = rng.normal(group_cfg.kappa.mean,   group_cfg.kappa.sd)
    beta    = rng.normal(group_cfg.beta.mean,    group_cfg.beta.sd)
    zeta    = rng.normal(group_cfg.zeta.mean,    group_cfg.zeta.sd)

    # Apply session deltas (additive on natural scale)
    if session_idx > 0 and session_cfg is not None:
        delta_idx = session_idx - 1
        omega_2 += session_cfg.omega_2_deltas[delta_idx]
        kappa   += session_cfg.kappa_deltas[delta_idx]
        beta    += session_cfg.beta_deltas[delta_idx]
        zeta    += session_cfg.zeta_deltas[delta_idx]

    # Clip to model bounds (from prl_analysis.yaml)
    omega_2 = float(np.clip(omega_2, -8.0,   2.0))
    omega_3 = float(np.clip(omega_3, -12.0,  0.0))
    kappa   = float(np.clip(kappa,    0.01,  2.0))
    beta    = float(np.clip(beta,     0.01, 20.0))
    zeta    = float(np.clip(zeta,    -5.0,   5.0))

    return {"omega_2": omega_2, "omega_3": omega_3, "kappa": kappa,
            "beta": beta, "zeta": zeta}
```

### Recommended Project Structure

```
src/prl_hgf/
├── simulation/
│   ├── __init__.py
│   ├── agent.py     # simulate_agent(net, trials, beta, zeta, rng) -> (choices, rewards)
│   └── batch.py     # simulate_batch(config, output_dir) -> pd.DataFrame
scripts/
└── 03_simulate_participants.py
```

### Anti-Patterns to Avoid

- **Batch input_data for simulation:** Calling `net.input_data(all_420_trials)` with
  pre-specified choices is wrong for simulation because choices depend on beliefs.
  Choices CANNOT be pre-specified before beliefs are computed.

- **Re-running from scratch each trial:** O(n^2) cost. Use the attribute carry pattern.

- **Sharing scan_fn across network instances:** JAX traces different shapes for
  different parameter values. Raises `ShapedArray` mismatch. Each participant gets a
  fresh `build_2level_network()` / `build_3level_network()` call.

- **Reading beliefs from node_trajectories for choice generation:** `node_trajectories`
  from a 1-trial call gives the PRIOR at that trial (the belief BEFORE the reward
  update). This is correct when reading during that call's result. But the simpler
  approach — read from `net.attributes[node]["expected_mean"]` BEFORE calling
  `input_data` — is equivalent and clearer.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Trial sequence generation | Custom phase loop | `generate_session(config, seed)` from `env/simulator.py` | Already implemented, tested, seeded |
| Reward generation | `random() < p` inline | `generate_reward(cue, probs, rng)` from `env/simulator.py` | Already implemented, avoids drift |
| HGF belief update | Any manual Kalman/HGF formula | `net.input_data(inp, observed)` from pyhgf | Correct JAX-backed update |
| Softmax normalisation | Manual `exp/sum` | `np.exp(logits) / sum` or `jax.nn.log_softmax` for fitting | Use numpy for simulation (no JAX needed) |
| Config loading | Hardcoded group params | `load_config()` from `env/task_config.py` | Single source of truth, validated |
| Group/session param lookup | Manual dict parsing | `config.simulation.groups[name]`, `config.simulation.session_deltas[name]` | Already typed and validated in `SimulationConfig` |

**Key insight:** The `prepare_input_data()` function from `hgf_2level.py` is designed
for the FITTING workflow (post-hoc from known choices+rewards). For SIMULATION, build
`inp_t` and `obs_t` inline inside the trial loop — `prepare_input_data()` is not
needed in the simulation path.

## Common Pitfalls

### Pitfall 1: State Reset on Multiple input_data Calls

**What goes wrong:** Calling `net.input_data()` a second time silently resets the
network to its initial state (`self.attributes`), not to the state after the first
call. Beliefs from trial t appear correct but are actually re-initialised from scratch.

**Why it happens:** `input_data` calls `scan(self.scan_fn, self.attributes, ...)`.
`self.attributes` is the INITIAL state, not the final state. `self.last_attributes`
holds the final state but is not automatically fed back into `self.attributes`.

**How to avoid:** After every `input_data` call in the simulation loop:
```python
net.attributes = net.last_attributes
```

**Warning signs:** Beliefs show identical trajectories across sessions; beliefs
reset to 0.5 at every call; agent never learns across trials.

### Pitfall 2: Reading Beliefs from Wrong Source

**What goes wrong:** Using `net.node_trajectories[0]["expected_mean"]` to get the
current prior for choice generation returns a JAX array, not a scalar. Also, after
the attribute carry, the trajectories only hold the LAST call's window (1 trial).

**Why it happens:** `node_trajectories` is the trace of the last `input_data` call,
shape `(n_trials_in_call,)`. It gives the prior AT THE START of each trial in that
call.

**How to avoid:** Read from `net.attributes[INPUT_NODE]["expected_mean"]` before
calling `input_data`. This gives the prior for the CURRENT trial. After the attribute
carry, it gives the prior for the NEXT trial. Example:
```python
p = float(net.attributes[0]["expected_mean"])  # cue 0 prior
```

**Warning signs:** Type errors from JAX array in softmax; IndexError; incorrect
beliefs (prior vs. posterior confusion).

### Pitfall 3: Negative kappa or beta from Gaussian Sampling

**What goes wrong:** `rng.normal(0.8, 0.3)` for kappa can return a negative value
(~0.2% probability per draw). Passing negative kappa to `build_3level_network()`
crashes the model or produces nonsense beliefs.

**Why it happens:** The Normal distribution has infinite support; the model bounds
are not enforced by `GroupParamDist`.

**How to avoid:** Clip all samples to model bounds after drawing. Bounds are in
`configs/prl_analysis.yaml` under `model.hgf_3level.kappa` etc. Clip to
`[0.01, 2.0]` for kappa, `[0.01, 20.0]` for beta.

**Warning signs:** `pyhgf` raises JAX errors inside the belief update; NaN beliefs;
unexpected zero-variance trajectories.

### Pitfall 4: Participant ID Seed Collision

**What goes wrong:** Using `seed = participant_idx` for both `generate_session()` and
the simulation RNG means the same seed generates both trial structure AND stochastic
choices. Different participants in the same group could see correlated sequences.

**Why it happens:** Simple sequential seeds are not independent.

**How to avoid:** Draw all seeds upfront from a master RNG:
```python
rng_master = np.random.default_rng(config.simulation.master_seed)
seeds = rng_master.integers(0, 2**31, size=(n_total, 3))
# seeds[i, 0] -> env seed, seeds[i, 1] -> sim seed, seeds[i, 2] -> spare
```

**Warning signs:** Correlations in choice patterns across participants; identical
trial structures for different participants.

### Pitfall 5: Slow Batch Due to Per-Trial JIT Recompilation

**What goes wrong:** The first participant's session takes ~7s, subsequent ones take
~5s. Without a pre-warm step, the first call in the batch loop triggers JAX JIT
compilation, adding latency to progress logging.

**Why it happens:** JAX compiles `scan_fn` lazily on the first `input_data` call.

**How to avoid:** Call `input_data` once with dummy data before the batch loop to
warm up JIT. Observed speedup: ~30% for first participant.

**Warning signs:** First participant is conspicuously slower than the rest in timing
logs.

### Pitfall 6: Session Deltas Applied Before Clipping

**What goes wrong:** If baseline kappa = 0.02 (clipped from a low sample) and session
delta = 0.3, the effective kappa is 0.32 — fine. But if baseline kappa = 0.01 (at
bound) and delta pushes it DOWN (hypothetical negative delta), it becomes < 0.01.

**Why it happens:** The YAML deltas can push clipped values out of bounds.

**How to avoid:** Clip AFTER applying deltas (not before). The order is:
1. Sample from Normal(mean, sd)
2. Add session delta
3. Clip to bounds

## Code Examples

### Complete Simulation Loop (Verified Pattern)

```python
# Source: empirically verified against pyhgf 0.2.8 internals
# net.attributes = initial state; net.last_attributes = post-trial state
def simulate_agent_session(
    net: Network,          # freshly built with participant's params
    trials: list[Trial],   # from generate_session()
    beta: float,
    zeta: float,
    rng: np.random.Generator,
) -> tuple[list[int], list[int]]:
    choices: list[int] = []
    rewards: list[int] = []
    prev_choice: int = -1

    for trial in trials:
        # Read prior (before update) from current network state
        p_r = np.array([
            float(net.attributes[0]["expected_mean"]),
            float(net.attributes[2]["expected_mean"]),
            float(net.attributes[4]["expected_mean"]),
        ])

        # Softmax with stickiness (sentinel -1 means no stickiness at t=0)
        stick = np.zeros(3)
        if prev_choice >= 0:
            stick[prev_choice] = 1.0
        logits = beta * p_r + zeta * stick
        logits -= logits.max()
        probs = np.exp(logits) / np.exp(logits).sum()
        choice = int(rng.choice(3, p=probs))

        # Generate reward from trial environment
        reward = generate_reward(choice, trial.cue_probs, rng)

        choices.append(choice)
        rewards.append(reward)

        # 1-trial update
        inp_t = np.zeros((1, 3), dtype=float)
        obs_t = np.zeros((1, 3), dtype=int)
        inp_t[0, choice] = float(reward)
        obs_t[0, choice] = 1
        net.input_data(input_data=inp_t, observed=obs_t)
        net.attributes = net.last_attributes   # ← CRITICAL: thread state forward
        prev_choice = choice

    return choices, rewards
```

### Parameter Sampling with Session Deltas

```python
# Source: GroupConfig + SessionConfig from task_config.py
# session_idx: 0=baseline, 1=post_dose, 2=followup
def sample_params(
    group_cfg: GroupConfig,
    session_deltas: SessionConfig,
    session_idx: int,
    rng: np.random.Generator,
) -> dict[str, float]:
    params = {
        "omega_2": rng.normal(group_cfg.omega_2.mean, group_cfg.omega_2.sd),
        "omega_3": rng.normal(group_cfg.omega_3.mean, group_cfg.omega_3.sd),
        "kappa":   rng.normal(group_cfg.kappa.mean,   group_cfg.kappa.sd),
        "beta":    rng.normal(group_cfg.beta.mean,    group_cfg.beta.sd),
        "zeta":    rng.normal(group_cfg.zeta.mean,    group_cfg.zeta.sd),
    }
    if session_idx > 0:
        di = session_idx - 1  # delta index: 0=post_dose, 1=followup
        params["omega_2"] += session_deltas.omega_2_deltas[di]
        params["kappa"]   += session_deltas.kappa_deltas[di]
        params["beta"]    += session_deltas.beta_deltas[di]
        params["zeta"]    += session_deltas.zeta_deltas[di]
    # Clip to model bounds (from prl_analysis.yaml)
    params["omega_2"] = float(np.clip(params["omega_2"], -8.0,   2.0))
    params["omega_3"] = float(np.clip(params["omega_3"], -12.0,  0.0))
    params["kappa"]   = float(np.clip(params["kappa"],    0.01,  2.0))
    params["beta"]    = float(np.clip(params["beta"],     0.01, 20.0))
    params["zeta"]    = float(np.clip(params["zeta"],    -5.0,   5.0))
    return params
```

### Output Row Construction

```python
# Source: SIM-06 requirement (participant_id, group, session, trial, ...)
# true_params stored as separate columns (not JSON) for easy CSV filtering
row = {
    "participant_id": f"{group}_{participant_idx:03d}",
    "group": group,
    "session": session_label,
    "trial": trial.trial_idx,
    "cue_chosen": choice,
    "reward": reward,
    "cue_0_prob": trial.cue_probs[0],
    "cue_1_prob": trial.cue_probs[1],
    "cue_2_prob": trial.cue_probs[2],
    "phase_label": trial.phase_label,
    "phase_name": trial.phase_name,
    "best_cue": trial.best_cue,
    "true_omega_2": true_params["omega_2"],
    "true_omega_3": true_params["omega_3"],
    "true_kappa": true_params["kappa"],
    "true_beta": true_params["beta"],
    "true_zeta": true_params["zeta"],
    "model": model_name,  # "hgf_2level" or "hgf_3level"
}
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Separate batch CSV per participant | Single tidy CSV per session or per batch | Design decision | Simpler to filter; pandas groupby friendly |
| Store beliefs in output | Store only choices + rewards + true params | Design decision | Beliefs can be recomputed during fitting; smaller output |
| omega_3 as primary target | omega_2 and kappa as primary targets | Literature (Mathys 2014) | omega_3 recovery is poor; acknowledged in CLAUDE.md |

## Key Architecture Findings (Empirical)

### pyhgf 0.2.8 Simulation Mechanics (HIGH confidence)

1. `net.input_data(inp, observed)` always starts from `net.attributes` (initial state).
   It does NOT use `last_attributes` as the starting point automatically.

2. `net.last_attributes` holds the final node state after the scan. This IS the
   posterior after the last trial in the call.

3. `net.node_trajectories[node_idx]["expected_mean"]` gives a shape `(n_trials_in_call,)`
   array. `trajectory[t]` is the PRIOR belief at trial t (before that trial's update).
   For a 1-trial call, `trajectory[-1]` equals the PRIOR before the single trial.

4. After `net.attributes = net.last_attributes`, reading `net.attributes[0]["expected_mean"]`
   gives the POSTERIOR from the previous trial = PRIOR for the next trial.

5. The trial-by-trial attribute carry pattern produces byte-identical results to a
   single batch `input_data` call (empirically verified).

6. `scan_fn` cannot be shared across network instances with different parameter values
   (JAX ShapedArray mismatch). Each participant requires a fresh `build_*_network()` call.

### Timing (measured on Windows 11 / conda ds_env)

| Operation | Time |
|-----------|------|
| First `input_data` call (JIT compile) | ~1.6s |
| Subsequent 1-trial `input_data` call (post-JIT) | ~20ms |
| Full 420-trial participant session | ~5-8s |
| Estimated 180 participants | ~24 minutes |

### Batch Design

- 2 groups x 30 participants x 3 sessions = 180 participant-sessions
- Each session: 420 trials (3 sets x 140 trials per set)
- Sequential execution acceptable (one-time generation, ~24 minutes)
- Seed strategy: derive per-(participant, session) seeds from `config.simulation.master_seed`
- Both model variants (2-level and 3-level) can share the same choice/reward sequences
  (same trial structure, same choices, same rewards). The HGF beliefs will differ, but
  for simulation we only need ONE model's choices to generate the dataset. The planner
  should decide whether to simulate under one model or both.

### Group Parameter Distributions (from config)

| Group | omega_2 | omega_3 | kappa | beta | zeta |
|-------|---------|---------|-------|------|------|
| post_concussion | N(-4.0, 1.0) | N(-7.0, 1.5) | N(0.8, 0.3) | N(2.0, 0.8) | N(0.3, 0.5) |
| healthy_control | N(-3.0, 1.0) | N(-6.0, 1.5) | N(1.0, 0.3) | N(2.5, 0.8) | N(0.2, 0.5) |

| Group | omega_2 delta (post_dose, followup) | kappa delta (post_dose, followup) |
|-------|-------------------------------------|-----------------------------------|
| post_concussion | (+1.5, +0.8) | (+0.3, +0.2) |
| healthy_control | (+0.5, +0.2) | (+0.1, +0.05) |

### Success Criterion Verification

The success criterion "chooses best cue >80% during stable phases" is met in the LATE
portion of stable phases (last 10-15 trials with beta=5, healthy_control params: 80-100%
accuracy). EARLY stable-phase accuracy is lower (~50-60%) while the agent is learning.
The >80% criterion should be tested on the last half of acquisition phases, or framed
as "late-stable accuracy > 80%", not mean accuracy over the whole phase.

## Open Questions

1. **Which model to simulate under?**
   - What we know: Both 2-level and 3-level models exist. Phase 4 will fit BOTH to the
     simulated data. The simulation only needs to generate choices once.
   - What's unclear: Should the batch simulation generate data under the 3-level model
     (more realistic, has volatility dynamics) or the 2-level model (simpler baseline)?
   - Recommendation: Generate under the 3-level model (omega_3 and kappa are active
     parameters in the study's primary hypotheses). Phase 4 will then fit both models
     and compare via BMS. Use `build_3level_network()` as the simulation model.

2. **Store belief trajectories in output?**
   - What we know: Beliefs can be recomputed exactly from (params + choices + rewards).
     Storing them doubles output size.
   - What's unclear: Whether Phase 6 analysis needs pre-computed belief trajectories.
   - Recommendation: Do NOT store beliefs in simulation output. Recompute during fitting.

3. **Parallel execution?**
   - What we know: Sequential execution takes ~24 minutes. Python multiprocessing could
     parallelise across participants.
   - What's unclear: Whether JAX/pyhgf is safe for parallel processes (likely yes since
     each process has its own network, but not tested).
   - Recommendation: Implement sequential for Phase 3. Parallelism is a deferred
     optimisation. 24 minutes is acceptable.

## Sources

### Primary (HIGH confidence)

- Empirical tests against pyhgf 0.2.8 source code (read via `inspect.getsource`) — all
  findings about `input_data`, `last_attributes`, `attributes`, `scan_fn`, and
  `node_trajectories` are empirically verified
- `src/prl_hgf/models/hgf_2level.py` — API for `build_2level_network`, `prepare_input_data`,
  `extract_beliefs`, `INPUT_NODES`, `BELIEF_NODES`, `N_CUES`
- `src/prl_hgf/models/hgf_3level.py` — API for `build_3level_network`,
  `extract_beliefs_3level`, `VOLATILITY_NODE`
- `src/prl_hgf/models/response.py` — softmax + stickiness formula and sentinel -1 pattern
- `src/prl_hgf/env/simulator.py` — `Trial` dataclass, `generate_session()`, `generate_reward()`
- `src/prl_hgf/env/task_config.py` — `GroupConfig`, `SessionConfig`, `SimulationConfig`,
  `GroupParamDist` dataclasses
- `configs/prl_analysis.yaml` — group parameter distributions, session deltas, model bounds,
  n_participants_per_group=30, master_seed=1234

### Tertiary (LOW confidence, informational only)

- None: all findings are from direct code inspection and empirical tests, not web search

## Metadata

**Confidence breakdown:**
- Simulation loop pattern: HIGH — empirically verified byte-identical results vs. batch
- pyhgf attribute carry: HIGH — read source code, confirmed via test
- Timing estimates: HIGH — measured on development machine (Windows 11, ds_env)
- Parameter sampling: HIGH — from actual config dataclasses + bounds in YAML
- Output format: HIGH — from SIM-06 requirements + existing project conventions
- Batch timing: MEDIUM — measured on single machine; may vary significantly on other hardware

**Research date:** 2026-04-05
**Valid until:** 2026-05-05 (pyhgf 0.2.8 is pinned; API unlikely to change)
