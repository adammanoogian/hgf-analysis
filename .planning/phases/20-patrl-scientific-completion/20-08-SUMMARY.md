---
phase: 20-patrl-scientific-completion
plan: 08
subsystem: citation-hygiene
tags: [citations, klaassen-2024, bibtex, documentation, SC10]

dependency_graph:
  requires: [20-01, 20-02, 20-03, 20-04]
  provides:
    - docs/references.bib with 8 BibTeX entries (4 Klaassen + 4 methodology)
    - Retired Browning 2015 / Daw 2006 from docs/PAT_RL_API_HANDOFF.md
    - Klaassen 2024 backfilled in hierarchical_patrl.py Model D docstring
    - Phase 18/19 historical planning docs annotated (not deleted)
  affects: [20-09-and-later, manuscript-preparation]

tech-stack:
  added: []
  patterns: [citation-policy-SC10, bibtex-references-bib]

key-files:
  created:
    - docs/references.bib
  modified:
    - docs/PAT_RL_API_HANDOFF.md
    - src/prl_hgf/fitting/hierarchical_patrl.py
    - .planning/phases/18-pat-rl-task-adaptation/18-01-PLAN.md
    - .planning/phases/18-pat-rl-task-adaptation/18-RESEARCH.md
    - .planning/phases/20-patrl-scientific-completion/20-08-SUMMARY.md
    - .planning/STATE.md

decisions:
  - id: D-SC10
    choice: Retire pre-2020 PAT-RL citations; substitute Klaassen 2024 Comms Bio
    rationale: Consumer-spec phenotype priors (Plan 20-01) supersede Browning 2015 / Daw 2006; user approved scope 2026-04-18
  - id: D-SC10-scope
    choice: Terburg/Hulsman/Ly/Roelofs reviews NOT added (user did not supply BibTeX)
    rationale: No fabricated citations; flagged in PENDING CONFIRMATION section of 20-08-citation-audit.md

metrics:
  duration: ~20 minutes
  completed: "2026-04-18"
---

# Phase 20 Plan 08: Citation Replacement Summary

**One-liner:** SC10 complete — Browning 2015 / Daw 2006 retired; Klaassen 2024 Comms Bio added across PAT-RL docs and Model D docstring; `docs/references.bib` with 8 BibTeX entries created.

---

## Tasks Completed

| Task | Name | Commit | Files Modified | Result |
|------|------|--------|---------------|--------|
| 1 | Citation audit | `f79f2a4` | `.planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md` (new) | RETIRE/KEEP/REPLACE/HISTORICAL buckets documented |
| 2 | User approval checkpoint | — | — | User approved: "yes retire browning and daw and replace with klaasen" |
| 3 | Create docs/references.bib | `4318edc` | `docs/references.bib` (new, 8 entries) | 4 Klaassen + 4 methodology citations |
| 4 | Edit PAT_RL_API_HANDOFF.md | `11fd024` | `docs/PAT_RL_API_HANDOFF.md` (+36/-4 lines) | Browning/Daw replaced; References section §8 added; stale numeric priors updated |
| 5 | Annotate Phase 18/19 docs | `926a66b` | `18-01-PLAN.md`, `18-RESEARCH.md` (5 sites) | Inline "(Note: Phase 20 supersedes...)" at each pre-2020 ref |
| 6 | Backfill Klaassen 2024 in hierarchical_patrl.py | `ab2c3a5` | `src/prl_hgf/fitting/hierarchical_patrl.py` | Model D scan comment block cites Klaassen 2024 Comms Bio |
| 7 | SUMMARY.md + STATE.md | this commit | `.planning/phases/20-patrl-scientific-completion/20-08-SUMMARY.md`, `.planning/STATE.md` | Plan closed |

---

## Citation Counts Before/After

| File | Pre-2020 citations before | Pre-2020 citations after | Klaassen refs added |
|------|--------------------------|-------------------------|---------------------|
| `docs/PAT_RL_API_HANDOFF.md` | 2 (Browning 2015, Daw 2006 on lines 69-70) | 0 | 5 (in body + §8 References) |
| `src/prl_hgf/fitting/hierarchical_patrl.py` | 0 | 0 | 1 (Model D comment block) |
| `configs/pat_rl.yaml` | 0 (already clean from Plan 20-01) | 0 | — (already had 3 Klaassen refs from 20-01) |
| `docs/references.bib` | new file | 0 live | 4 BibTeX entries |
| `.planning/phases/18-*/18-01-PLAN.md` | 1 (Behrens 2007 / Browning 2015 in YAML snippet) | annotated | 0 |
| `.planning/phases/18-*/18-RESEARCH.md` | 4 sites (lines 482, 488-489, 494, 499) | annotated | 0 |

Total Klaassen refs in `configs/ docs/ src/prl_hgf/`: **26** (verified by grep).

---

## docs/references.bib — Entries Created

8 BibTeX entries:

| Key | Journal | Year | Purpose |
|-----|---------|------|---------|
| `klaassen2021freezing` | Scientific Reports | 2021 | Freezing × approach-avoidance |
| `klaassen2024neurocomputational` | Communications Biology | 2024 | Primary grounding for PAT-RL priors + Model D |
| `klaassen2024freezing_preprint` | bioRxiv | 2024 | Freezing × threat-reward information processing |
| `klaassen2021autonomic` | Frontiers in Neuroscience | 2021 | Autonomic psychophysiology in AA |
| `rigoux2014bms` | NeuroImage | 2014 | BMS methodology (KEEP — original algorithm) |
| `watanabe2010waic` | JMLR | 2010 | WAIC methodology (KEEP) |
| `friston2007freeenergy` | Synthese | 2007 | Free energy (KEEP) |
| `gelman2014bda` | BDA3 book | 2014 | BDA reference (KEEP) |

---

## Numeric Prior Update (Task 4 bonus)

The handoff doc stated "-6.0 healthy vs -3.5 anxious, Browning 2015 direction" and "2.0 low vs 8.0 high reward, Daw 2006" — these were stale against `configs/pat_rl.yaml` as updated by Plan 20-01. The Task 4 edit replaced both the citation AND the stale numerics with a pointer to `configs/pat_rl.yaml` as the authoritative source. The handoff doc no longer claims specific prior values; it directs the reader to the YAML.

---

## H2 Dependency Verification (upstream Plans 20-02/03/04 Klaassen refs)

| File | Expected by plan | Actual grep result | Status |
|------|-----------------|---------------------|--------|
| `src/prl_hgf/models/response_patrl.py` | >= 1 Klaassen ref (Plan 20-02) | Lines 192, 272 | PASS |
| `src/prl_hgf/env/pat_rl_simulator.py` | >= 1 Klaassen ref (Plan 20-04) | Lines 156, 167 | PASS |
| `src/prl_hgf/env/pat_rl_config.py` | >= 1 Klaassen ref | Lines 155, 456, 463 | PASS |
| `src/prl_hgf/fitting/hierarchical_patrl.py` | 0 before Task 6 | 0 (confirmed by audit) | BACKFILLED in Task 6 |

Zero Klaassen refs deleted by this plan. Only added.

---

## Citations NOT Added (user scope restriction)

The following Roelofs-group citations were requested in the original plan but NOT added because:
1. User did not supply BibTeX entries in the Task 2 approval response
2. The planner could not independently verify specific paper details (RESEARCH.md §9.2 LOW confidence)

| Author | Status |
|--------|--------|
| Terburg 2020+ (approach-avoidance) | NOT added — no BibTeX supplied |
| Hulsman 2020+ | NOT added — no BibTeX supplied |
| Ly 2022+ (reversal learning / HGF) | NOT added — no BibTeX supplied |
| Roelofs 2017/2020 reviews | NOT added — no BibTeX supplied |

To add these: paste BibTeX into `docs/references.bib` and add inline citations as needed.

---

## Files That Did NOT Need Editing (already clean)

Per the Task 1 audit and H2 verification:

- `src/prl_hgf/env/pat_rl_simulator.py` — already had Klaassen refs at lines 156, 167 from Plan 20-04. No edits needed.
- `src/prl_hgf/env/pat_rl_config.py` — already had Klaassen refs at lines 155, 456, 463 from Plan 20-01. No edits needed.
- `src/prl_hgf/models/response_patrl.py` — already had Klaassen 2024 at lines 192, 272 from Plan 20-02. No edits needed.
- `configs/pat_rl.yaml` — already clean (3 Klaassen refs) from Plan 20-01. No edits needed.
- Phase 19 planning docs — no Browning/Daw/Schönberg refs found. No edits needed.

---

## Regression Tests

```
pytest tests/test_env_pat_rl_config.py tests/test_models_patrl.py
      tests/test_pat_rl_simulator.py tests/test_hierarchical_patrl.py
      tests/test_fit_vb_laplace_patrl.py -v
```

Result: **74 passed, 11 deselected, 0 failed** (163.70s). Docstring-only changes produced zero regressions, as expected.

---

## Deviations from Plan

### Auto-applied (Rule 1 — Bug / stale data fix)

**Stale numeric priors in PAT_RL_API_HANDOFF.md**

- Found during: Task 4
- Issue: Lines 68-71 stated "-6.0 healthy vs -3.5 anxious" and "2.0 low vs 8.0 high reward" — these were Plan-18 placeholder values superseded by Plan 20-01 config updates (current YAML: healthy omega_2=-3.0, anxious omega_2=-2.0, reward_sensitive beta=3.5)
- Fix: Replaced stale numerics with a pointer to `configs/pat_rl.yaml` as authoritative source
- Files modified: `docs/PAT_RL_API_HANDOFF.md`
- Commit: `11fd024`

---

## Next Phase Readiness

- SC10 gate: CLOSED. All pre-2020 PAT-RL task-design citations retired.
- Remaining unresolved: Terburg/Hulsman/Ly/Roelofs BibTeX entries (flagged above).
- Plan 20-06 (stratified BMS + PEB export) will reference `rigoux2014bms` and `watanabe2010waic` from `docs/references.bib` — those keys are now available.
- Plan 20-07 (validation gates) does not depend on citation changes.
