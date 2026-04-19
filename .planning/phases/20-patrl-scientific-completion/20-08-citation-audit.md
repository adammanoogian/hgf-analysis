# Plan 20-08 Citation Audit

Generated: 2026-04-18  
Grep scope: `configs/`, `docs/`, `src/prl_hgf/`, `.planning/phases/20-patrl-scientific-completion/`  
(Phase 18/19 planning docs are in-scope for annotation, NOT deletion.)

---

## RETIRE (pre-2020, conflicts with consumer spec — must be removed or replaced)

| File:Line | Citation | Context | Proposed replacement |
|-----------|----------|---------|---------------------|
| `docs/PAT_RL_API_HANDOFF.md:69` | "Browning 2015 direction" | omega_2 phenotype direction claim in PATRLSimulationConfig description | `klaassen2024neurocomputational` |
| `docs/PAT_RL_API_HANDOFF.md:70` | "Daw 2006" | beta phenotype direction claim in the same sentence | `klaassen2024neurocomputational` |

**Note on configs/pat_rl.yaml:** The original YAML had three Browning/Daw/Schönberg
citation sites (lines 20, 67-68, 76 in the Phase-18 version). Plan 20-01 already
replaced those with Klaassen refs. Confirmed clean: no Browning/Daw/Schönberg
strings exist in `configs/pat_rl.yaml` as of the current HEAD (verified by grep).

**Note on src/prl_hgf/:** No Browning/Daw/Schönberg/Behrens citations found in any
`.py` file under `src/prl_hgf/`. The source files are already clean.

---

## KEEP (pre-2020 but methodology-essential; no 2020+ equivalent that would
replace the original method reference)

| File:Line | Citation | Reason to keep |
|-----------|----------|----------------|
| `src/prl_hgf/analysis/bms.py:5` | "Rigoux et al. 2014" | Random-effects groupBMC methodology; this IS the algorithm, not a task-design citation. No 2020+ replacement. Keep. |
| `src/prl_hgf/fitting/hierarchical.py:72` | "Mathys 2011" | HGF mathematical formulation; original algorithm reference. No 2020+ replacement. Keep. |
| `configs/prl_analysis.yaml:89` | "Mathys et al. 2011, 2014" | HGF model specification defaults for pick_best_cue task. Not PAT-RL; not in scope. Keep. |
| `.planning/phases/20-patrl-scientific-completion/20-06-stratified-bms-peb-export-PLAN.md:144` | "Watanabe 2010" | WAIC methodology; original reference. Keep as methodology cite. |
| `.planning/phases/20-patrl-scientific-completion/20-06-stratified-bms-peb-export-PLAN.md:262` | "Rigoux et al. 2014" | BMS methodology in docstring template. Keep. |
| `.planning/phases/20-patrl-scientific-completion/20-06-stratified-bms-peb-export-PLAN.md:393` | "Gelman et al. 2014" | BDA3 reference for WAIC approximation. Keep. |
| `.planning/phases/20-patrl-scientific-completion/20-06-stratified-bms-peb-export-PLAN.md:405-406` | "Friston & Stephan 2007" and "Rigoux et al. 2014" | Free energy + BMS docstring templates. Keep as methodology. |

**Ambiguous case — Behrens 2007:**  
The Behrens 2007 citation appeared in `configs/pat_rl.yaml` in Phase-18 (as
"Behrens 2007 / Browning 2015 pattern") but Plan 20-01 already removed it from
the YAML. It survives only in historical planning docs:

- `.planning/phases/18-pat-rl-task-adaptation/18-01-PLAN.md:102` — historical record of the original YAML
- `.planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md:482` — research notes citing Browning et al. 2015 (where Behrens is listed as a co-author)

Both are Phase 18 planning docs (archived historical record). The PLAN file
describes code that was committed; the RESEARCH file is analytical notes.
Per plan instructions, Phase 18/19 docs should receive an annotation
(not be deleted). See REPLACE section below.

---

## REPLACE (sites where old citation is still live in a non-plan file and needs
a specific Klaassen substitute applied)

| File:Line | Current citation | Action | BibTeX key |
|-----------|-----------------|--------|-----------|
| `docs/PAT_RL_API_HANDOFF.md:69-70` | `"Browning 2015 direction"` and `"Daw 2006"` in PATRLSimulationConfig description block | Replace both with a single sentence: "omega_2 direction (healthy vs anxious) and beta direction (low vs high reward sensitivity) grounded in Klaassen et al. 2024, Communications Biology (HGF × approach-avoidance under threat). Exact numeric values come from the downstream consumer study specification — see `configs/pat_rl.yaml` phenotype blocks and Plan 20-01 SUMMARY for the canonical reference values." | `klaassen2024neurocomputational` |

---

## HISTORICAL ANNOTATION (Phase 18/19 planning docs — preserve with note)

Per the plan: Phase 18/19 historical docs must NOT be deleted. A note is added
inline: "(retired in Phase 20 per SC10; see configs/pat_rl.yaml current comments)"

| File:Line | Citation | Action |
|-----------|----------|--------|
| `.planning/phases/18-pat-rl-task-adaptation/18-01-PLAN.md:102` | "Behrens 2007 / Browning 2015 pattern" | Add inline annotation after the line |
| `.planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md:482` | Browning et al. 2015 as justification for omega_2 direction | Add annotation paragraph noting retirement per SC10 |
| `.planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md:488-489` | Browning 2015; Daw 2006; Schönberg 2007 in parameter table | Add annotation row/footnote |
| `.planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md:494` | Browning's anxiety-by-volatility effect reference | Add annotation |
| `.planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md:499` | "Browning/Daw/Schönberg grounded" | Add annotation |
| `.planning/phases/20-patrl-scientific-completion/20-RESEARCH.md:54` | "Browning 2015 / Daw 2006 grounded" (historical description of Phase-18 state) | No edit needed — this is already a past-tense research note describing what Phase 18 did |
| `.planning/phases/20-patrl-scientific-completion/20-RESEARCH.md:427-430` | Browning/Daw/Schönberg in the §9.1 audit table | No edit needed — this IS the audit table documenting what needs to change |

**Note on 20-RESEARCH.md:** The 20-RESEARCH.md file already documents the
Browning/Daw/Schönberg citations as "to be replaced" in §9.1. These are
descriptions of the problem, not live citations. No edits needed in 20-RESEARCH.md.

---

## ALREADY REPLACED (confirmed clean — upstream plans did the work)

| File | Citation status | Verified by |
|------|----------------|-------------|
| `configs/pat_rl.yaml` | CLEAN — Klaassen 2021 (line 21) and Klaassen 2024 (lines 79-81, 101) present; no Browning/Daw/Schönberg | grep output |
| `src/prl_hgf/models/response_patrl.py` | CLEAN — Klaassen 2024 Comms Bio at lines 192, 272 (model_b_logp and model_c_logp) | grep output (Plan 20-02 H2 check PASS) |
| `src/prl_hgf/env/pat_rl_simulator.py` | CLEAN — Klaassen 2024 Comms Bio at lines 156, 167 | grep output (Plan 20-04 H2 check PASS) |
| `src/prl_hgf/env/pat_rl_config.py` | CLEAN — Klaassen 2024 at lines 155, 456, 463 | grep output |
| `src/prl_hgf/fitting/hierarchical_patrl.py` | No Klaassen ref yet (Plan 20-03 Model D docstring may need check) | grep returned zero — needs Task 6 backfill |
| `src/prl_hgf/fitting/fit_vb_laplace_patrl.py` | No pre-2020 citations; no Klaassen ref yet | grep output |

**Flag for Task 6:** `hierarchical_patrl.py` has no Klaassen reference. The plan
says Plan 20-03 was supposed to add a Klaassen 2024 ref to the Model D docstring.
Grep returned zero matches. Task 6 will need to add one inline.

---

## PENDING CONFIRMATION (researcher flagged but not independently verified)

| Citation requested | Status | Action |
|-------------------|--------|--------|
| Terburg 2020+ (approach-avoidance) | NOT confirmed — no specific paper found in web search | Do NOT add to `docs/references.bib`; flag for user to supply BibTeX |
| Hulsman 2020+ | NOT confirmed | Do NOT add; flag for user |
| Ly 2022+ (reversal learning / HGF) | NOT confirmed | Do NOT add; flag for user |
| Roelofs 2017/2020 reviews | NOT confirmed (Roelofs has published reviews, but specific year+title not verified) | Do NOT add; flag for user |

---

## Summary

| Bucket | Count | Notes |
|--------|-------|-------|
| RETIRE (live, action required) | 2 | Both in `docs/PAT_RL_API_HANDOFF.md` lines 69-70 |
| KEEP (methodology, no change) | 7 sites across 4 files | Rigoux 2014, Mathys 2011/2014, Watanabe 2010, Friston 2007, Gelman 2014 |
| REPLACE (live old → new Klaassen) | 1 unique edit (2 lines become 1 replacement block) | `docs/PAT_RL_API_HANDOFF.md:69-70` |
| ALREADY REPLACED (confirmed clean) | 5 files | configs/pat_rl.yaml, response_patrl.py, pat_rl_simulator.py, pat_rl_config.py, fitting files |
| HISTORICAL ANNOTATION (Phase 18/19 docs) | 5 sites | 18-01-PLAN.md:102, 18-RESEARCH.md:482/488/494/499 |
| TASK 6 BACKFILL NEEDED | 1 file | hierarchical_patrl.py — zero Klaassen refs; needs one added to Model D docstring |
| PENDING CONFIRMATION | 4 | Terburg, Hulsman, Ly, Roelofs reviews — do not fabricate |

**New `docs/references.bib` entries to create (Task 3):** 8 entries minimum
(4 Klaassen + Rigoux2014 + Watanabe2010 + Friston2007 + Gelman2014).

---

## Questions for user review (Task 2 checkpoint)

1. **Approve RETIRE bucket?** The two live Browning/Daw references are only in
   `docs/PAT_RL_API_HANDOFF.md:69-70`. Plan 20-01 already cleaned `configs/pat_rl.yaml`.

2. **Approve KEEP list?** Methodology citations (Rigoux 2014, Mathys 2011/2014,
   Watanabe 2010, Friston 2007, Gelman 2014) are pre-2020 but are original-method
   citations, not task-design citations. Recommend keeping.

3. **Behrens 2007 treatment:** Behrens is only in Phase-18 planning docs (historical),
   not in any live source file. Recommend annotation-only (no deletion).
   Do you agree?

4. **Pending citations — do you want to supply BibTeX for any of:**
   - Terburg 2020+
   - Hulsman 2020+
   - Ly 2022+
   - Roelofs 2017 or 2020 review(s)
   If yes, paste the BibTeX in your "approved" response and Task 3 will include them.

5. **hierarchical_patrl.py backfill:** Plan 20-03 was expected to add a Klaassen 2024
   ref to the Model D docstring but the grep shows zero matches. Task 6 will add
   `# See Klaassen et al. 2024 Communications Biology (klaassen2024neurocomputational)`
   to the `_single_logp_model_d` or the module-level docstring. Approve?

6. **PAT_RL_API_HANDOFF.md "References" section:** Plan calls for adding a new
   `## References` section at the end. This doc currently has no references section.
   Approve adding one citing all 4 Klaassen papers?
