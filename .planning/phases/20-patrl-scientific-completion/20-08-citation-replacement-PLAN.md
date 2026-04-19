---
phase: 20-patrl-scientific-completion
plan: 08
type: execute
wave: 3
depends_on: [20-01, 20-02, 20-03, 20-04]
files_modified:
  - configs/pat_rl.yaml
  - docs/PAT_RL_API_HANDOFF.md
  - src/prl_hgf/env/pat_rl_config.py
  - src/prl_hgf/env/pat_rl_sequence.py
  - src/prl_hgf/env/pat_rl_simulator.py
  - src/prl_hgf/models/response_patrl.py
  - src/prl_hgf/fitting/hierarchical_patrl.py
  - src/prl_hgf/fitting/fit_vb_laplace_patrl.py
  - docs/references.bib
planning_artifacts_produced:
  # L12: Task 1 produces this planning-artifact output. Not a source file
  # (hence not in files_modified), but tracked explicitly so the audit path
  # is grep-discoverable from the frontmatter.
  - .planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md
autonomous: false
estimated_edits: 10
gap_closure: false
user_setup: []

must_haves:
  truths:
    - "Every literature citation in config files, docstrings, and .planning/ docs dates 2020 or later"
    - "Browning 2015 / Daw 2006 / Schönberg 2007 references are retired wherever they conflicted with the consumer study spec"
    - "Klaassen 2021 (Scientific Reports), Klaassen 2024 (Communications Biology), Klaassen 2024 (bioRxiv preprint), Klaassen 2021 (Frontiers) are the primary Roelofs-group references"
    - "docs/references.bib exists and contains BibTeX entries for each retained citation (new file OR extended if present)"
    - "No fabricated citations — any Roelofs/Terburg/Hulsman/Ly reference the planner cannot confidently source is flagged in SUMMARY for user to supply"
    - "Plan 20-08 runs AFTER Plans 20-02/20-03/20-04 have modified response_patrl.py, hierarchical_patrl.py, fit_vb_laplace_patrl.py, and pat_rl_simulator.py — otherwise Task 6's verification (that Klaassen 2024 inline refs from 20-02/20-03/20-04 are present) cannot pass"
  artifacts:
    - path: "docs/references.bib"
      provides: "BibTeX entries for Klaassen 2021/2024 papers and any existing retained citations"
      contains: "klaassen2024neurocomputational"
    - path: "configs/pat_rl.yaml"
      provides: "Updated citation comments referencing Klaassen 2021/2024 and consumer study spec"
      contains: "Klaassen"
    - path: "docs/PAT_RL_API_HANDOFF.md"
      provides: "Citation block updated from Browning/Daw to Klaassen 2024"
      contains: "Klaassen"
    - path: ".planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md"
      provides: "Audit output from Task 1 (planning artifact, reviewed by user in Task 2)"
      contains: "RETIRE"
  key_links:
    - from: "Each old citation site (Browning 2015, Daw 2006, Schönberg 2007)"
      to: "Klaassen 2021 / 2024 replacement"
      via: "grep + edit; citations use BibTeX keys klaassen2021freezing, klaassen2024neurocomputational, etc."
      pattern: "Klaassen"
    - from: "Plans 20-02 (response_patrl.py Klaassen inline), 20-03 (hierarchical_patrl.py Model D Klaassen), 20-04 (pat_rl_simulator.py Klaassen)"
      to: "Plan 20-08 Task 6 verification step"
      via: "Task 6 greps for Klaassen references added by upstream plans and only adds new refs where absent"
      pattern: "Klaassen"
---

<objective>
Replace every Browning 2015 / Daw 2006 / Schönberg 2007 citation in the repo with Roelofs-group 2020+ references (SC10). Enforce the 2020-or-later citation policy across config files, docstrings, and .planning/ planning docs. Add a `docs/references.bib` with BibTeX entries for every retained citation. Explicitly flag any Roelofs/Terburg/Hulsman/Ly/Klaassen citation that the planner cannot confidently source (RESEARCH.md §9.2) so the user can supply the full BibTeX.

**Checker note (H2):** This plan was previously `depends_on: [20-01]`, but it edits the exact same files as Plans 20-02, 20-03, and 20-04 (response_patrl.py, hierarchical_patrl.py, fit_vb_laplace_patrl.py, pat_rl_simulator.py). Task 6 explicitly verifies that inline Klaassen 2024 references added BY those plans are present. Therefore 20-08 MUST run after 20-02, 20-03, and 20-04 — the dependency array is now `[20-01, 20-02, 20-03, 20-04]` and `wave: 4`.

**Checker note (L12):** Task 1 produces a planning-artifact file at
`.planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md`. This is NOT a source
file (so it stays out of `files_modified`) but it IS a tracked output — recorded in frontmatter
under `planning_artifacts_produced`.

RESEARCH.md §9 identified four confirmed papers with DOIs:
- Klaassen et al. 2021, Scientific Reports 11:12030, DOI 10.1038/s41598-021-90968-z
- Klaassen et al. 2024, Communications Biology, DOI 10.1038/s42003-024-06267-6
- Klaassen et al. 2024, bioRxiv, DOI 10.1101/2024.08.29.610250
- Klaassen et al. 2021, Frontiers in Neuroscience, DOI 10.3389/fnins.2021.621517

The Terburg 2020+ / Hulsman 2020+ / Ly 2022+ / Roelofs 2017/2020 reviews mentioned in the roadmap SC10 were NOT independently verified — do not fabricate; flag for user supply if specific citations are needed.

Purpose: SC10 is a citation-hygiene gate. Every pre-2020 citation (or post-2020 non-Roelofs citation where a Roelofs equivalent exists) must be retired.
Output: Updated citation strings across ~10 files + docs/references.bib with BibTeX + a planning-artifact audit under `.planning/phases/20-patrl-scientific-completion/`.
</objective>

<execution_context>
@.claude/get-shit-done/workflows/execute-plan.md
@.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@.planning/PROJECT.md
@.planning/ROADMAP.md
@.planning/phases/20-patrl-scientific-completion/20-RESEARCH.md

@configs/pat_rl.yaml
@docs/PAT_RL_API_HANDOFF.md
@src/prl_hgf/env/pat_rl_config.py
@src/prl_hgf/env/pat_rl_sequence.py
@src/prl_hgf/env/pat_rl_simulator.py
@src/prl_hgf/models/response_patrl.py
@src/prl_hgf/fitting/hierarchical_patrl.py
@src/prl_hgf/fitting/fit_vb_laplace_patrl.py
</context>

<tasks>

<task type="auto">
  <name>Task 1: Audit — find every citation in the repo</name>
  <files>.planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md</files>
  <action>
    Run a systematic grep to locate every citation in scope:

    ```bash
    # From project root
    grep -rn -E "(Browning|Daw|Sch(ö|o)nberg|Behrens|Rigoux|Watanabe|Friston|Klaassen|Roelofs|Terburg|Hulsman|Ly 20[0-9][0-9])" \
        configs/ docs/ src/prl_hgf/ .planning/phases/20-patrl-scientific-completion/ \
        --include="*.yaml" --include="*.py" --include="*.md" --include="*.bib"
    ```

    Produce a categorized list:
    - **RETIRE** (pre-2020 AND not required for a specific published-methodology citation): Browning 2015, Daw 2006, Schönberg 2007, Behrens 2007 (where it's just context-filler).
    - **KEEP** (pre-2020 but necessary — the original reference for a specific method):
      - Rigoux et al. 2014 — groupBMC methodology reference (bms.py); KEEP with note that this is a methodology citation not a task-design citation.
      - Watanabe 2010 — WAIC methodology; KEEP.
      - Friston & Stephan 2007 — Free energy; KEEP.
      - Behrens 2007 — hazard-rate-driven reversal methodology; KEEP if referenced for its methodological contribution (not for task-parameter values); otherwise retire.
    - **REPLACE**:
      - Browning 2015 → Klaassen 2024 Comms Bio (the HGF-in-approach-avoidance direct precedent)
      - Daw 2006 → Klaassen 2024 Comms Bio
      - Schönberg 2007 → Klaassen 2024 Comms Bio
      - Behrens 2007 (if it's stated as the task-design inspiration) → Klaassen 2021 Sci Rep

    Write the audit output to `.planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md` (L12: this is the planning-artifact output recorded in frontmatter) for user review BEFORE mass-editing.

    STOP and present the audit to the user before applying edits — Task 2 is gated on user review.
  </action>
  <verify>
    File exists: `.planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md`. Contains three sections (RETIRE / KEEP / REPLACE) with file:line references for each citation.
  </verify>
  <done>
    - Audit file exists at the path recorded in frontmatter.planning_artifacts_produced
    - User has reviewed RETIRE/KEEP/REPLACE categorization (via Task 2 checkpoint)
    - No edits applied yet
  </done>
</task>

<task type="checkpoint:human-verify" gate="blocking">
  <name>Task 2: User reviews citation audit before mass-edit</name>
  <what-built>
    Task 1 produced a citation audit at
    `.planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md`
    listing every citation in the repo, categorized into RETIRE/KEEP/REPLACE buckets.
  </what-built>
  <how-to-verify>
    1. Open `.planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md`
    2. Confirm the RETIRE list is correct — citations you do NOT want in the repo
    3. Confirm the KEEP list is correct — methodology citations (Rigoux, Watanabe, Friston) that must stay
    4. Confirm the REPLACE mapping is correct — each replacement pairs a retired citation with a Klaassen 2021/2024 alternative
    5. Flag any citations in the KEEP list that you want retired, or vice versa
    6. Provide any additional Roelofs/Terburg/Hulsman/Ly BibTeX entries you want inserted (the planner could not confidently source these per RESEARCH.md §9.2 LOW confidence)
  </how-to-verify>
  <resume-signal>Reply with one of:
    - "approved" — proceed to Task 3 mass-edit
    - "modify <file:line>: <action>" — specific change list
    - "provide-bibtex: <BibTeX block>" — additional citations to add
  </resume-signal>
</task>

<task type="auto">
  <name>Task 3: Create docs/references.bib with confirmed Klaassen citations + all KEEP methodology citations</name>
  <files>docs/references.bib</files>
  <action>
    Create (or extend if exists) `docs/references.bib`:

    ```bibtex
    % -- Confirmed Roelofs-group Phase 20 references ---------------------------

    @article{klaassen2021freezing,
      author    = {Klaassen, Felix H. and Bramson, Bob and Roelofs, Karin},
      title     = {Defensive freezing and its relation to approach--avoidance
                   decision-making under threat},
      journal   = {Scientific Reports},
      year      = {2021},
      volume    = {11},
      pages     = {12030},
      doi       = {10.1038/s41598-021-90968-z},
      url       = {https://www.nature.com/articles/s41598-021-90968-z}
    }

    @article{klaassen2024neurocomputational,
      author    = {Klaassen, Felix H. and Roelofs, Karin},
      title     = {The neurocomputational link between defensive cardiac states
                   and approach--avoidance arbitration under threat},
      journal   = {Communications Biology},
      year      = {2024},
      doi       = {10.1038/s42003-024-06267-6},
      url       = {https://www.nature.com/articles/s42003-024-06267-6}
    }

    @article{klaassen2024freezingpreprint,
      author    = {Klaassen, Felix H. and Bramson, Bob and Schoffelen,
                   Jan-Mathijs and de Voogd, Lycia D. and Roelofs, Karin},
      title     = {Defensive freezing sharpens threat--reward information
                   processing during approach--avoidance decision making},
      journal   = {bioRxiv},
      year      = {2024},
      doi       = {10.1101/2024.08.29.610250},
      url       = {https://www.biorxiv.org/content/10.1101/2024.08.29.610250v1.full}
    }

    @article{klaassen2021autonomic,
      author    = {Klaassen, Felix H.},
      title     = {Approach--Avoidance Decisions Under Threat: The Role of
                   Autonomic Psychophysiological States},
      journal   = {Frontiers in Neuroscience},
      year      = {2021},
      doi       = {10.3389/fnins.2021.621517},
      url       = {https://www.frontiersin.org/articles/10.3389/fnins.2021.621517/full}
    }

    % -- Retained methodology references (pre-2020, necessary for method citation)

    @article{rigoux2014bms,
      author    = {Rigoux, L. and Stephan, K. E. and Friston, K. J. and
                   Daunizeau, J.},
      title     = {Bayesian model selection for group studies --- revisited},
      journal   = {NeuroImage},
      year      = {2014},
      volume    = {84},
      pages     = {971--985},
      doi       = {10.1016/j.neuroimage.2013.08.065}
    }

    @article{watanabe2010waic,
      author    = {Watanabe, Sumio},
      title     = {Asymptotic equivalence of Bayes cross validation and widely
                   applicable information criterion in singular learning theory},
      journal   = {Journal of Machine Learning Research},
      year      = {2010},
      volume    = {11},
      pages     = {3571--3594}
    }

    @article{friston2007freeenergy,
      author    = {Friston, Karl J. and Stephan, Klaas E.},
      title     = {Free energy and the brain},
      journal   = {Synthese},
      year      = {2007},
      volume    = {159},
      pages     = {417--458},
      doi       = {10.1007/s11229-007-9237-y}
    }

    @book{gelman2014bda,
      author    = {Gelman, Andrew and Carlin, John B. and Stern, Hal S. and
                   Dunson, David B. and Vehtari, Aki and Rubin, Donald B.},
      title     = {Bayesian Data Analysis},
      edition   = {3},
      publisher = {Chapman and Hall/CRC},
      year      = {2014}
    }
    ```

    Any additional BibTeX supplied by the user in Task 2 resume-signal is appended verbatim.

    If the file already exists (e.g. from an earlier phase), preserve existing entries and APPEND the new ones; do not overwrite.
  </action>
  <verify>
    Run: `grep -c "^@" docs/references.bib` — >= 7 entries (the 4 Klaassen + Rigoux + Watanabe + Friston + Gelman = 8 minimum).
  </verify>
  <done>
    - docs/references.bib exists
    - Contains BibTeX keys: klaassen2021freezing, klaassen2024neurocomputational, klaassen2024freezingpreprint, klaassen2021autonomic, rigoux2014bms, watanabe2010waic, friston2007freeenergy, gelman2014bda
    - Any user-supplied additional entries from Task 2 appended
  </done>
</task>

<task type="auto">
  <name>Task 4: Edit configs/pat_rl.yaml — replace RETIRE citations</name>
  <files>configs/pat_rl.yaml</files>
  <action>
    Apply the Task 2-approved mapping. Expected edits based on Task 1 audit (adjust per user feedback in Task 2):

    1. Line 20 (existing "Behrens 2007 / Browning 2015 pattern"): replace with
       ```
       # Hazard-rate-driven reversal paradigm (see Klaassen et al. 2021,
       # Scientific Reports). Stable/volatile counterbalance mirrors the
       # approach-avoidance under threat literature.
       ```

    2. Lines 66-69 (current "Browning et al. 2015 (Nat Neurosci), Daw 2006, Schönberg 2007"): replace with
       ```
       # ---------------------------------------------------------------------------
       # Simulation parameters — phenotype 2x2 grid (anxiety x reward_sensitivity).
       # Direction and magnitude of phenotype-specific priors grounded in
       # Klaassen et al. 2024, Communications Biology (HGF × approach-avoidance
       # under threat). Exact numeric values come from the downstream consumer
       # study specification; placeholder TODOs were flagged in Plan 20-01.
       # ---------------------------------------------------------------------------
       ```

    3. Lines 75-76 (current "Browning 2015 / Daw 2006 / Schönberg 2007 grounded; tune in V2"): replace with
       ```
       # Priors grounded in Klaassen 2024 (Comms Bio) + consumer study spec.
       # Placeholder numeric TODOs flagged in Plan 20-01 SUMMARY.
       ```

    4. Preserve the existing magnitudes/timing/dhr_stub/contingencies comments (these are not pre-2020 citations).

    Do NOT add an inline BibTeX to the YAML; cite by author-year and direct users to `docs/references.bib`.
  </action>
  <verify>
    Run: `grep -E "(Browning|Daw|Schönberg|Schonberg)" configs/pat_rl.yaml` — zero matches.
    Run: `grep "Klaassen" configs/pat_rl.yaml` — at least 2 matches.
  </verify>
  <done>
    - configs/pat_rl.yaml has zero Browning/Daw/Schönberg references
    - Klaassen 2021/2024 cited in the relevant comment blocks
    - Task 1 audit RETIRE list fully applied
  </done>
</task>

<task type="auto">
  <name>Task 5: Edit docs/PAT_RL_API_HANDOFF.md — replace pre-2020 citations</name>
  <files>docs/PAT_RL_API_HANDOFF.md</files>
  <action>
    Open `docs/PAT_RL_API_HANDOFF.md`. Based on RESEARCH.md §9.1 this file has Browning/Daw references around line 70-71.

    1. Replace the lines referencing "omega_2 (-6.0 healthy vs -3.5 anxious, Browning 2015 direction); beta (2.0 low vs 8.0 high reward, Daw 2006)" with:
       ```
       omega_2 direction (healthy vs anxious) and beta direction (low vs high
       reward sensitivity): grounded in Klaassen et al. 2024, Communications
       Biology (HGF × approach-avoidance under threat). Exact numeric values
       come from the downstream consumer study specification — see
       `configs/pat_rl.yaml` phenotype blocks and Plan 20-01 SUMMARY for
       the canonical reference values.
       ```

    2. Grep for any other pre-2020 references in this file and replace per Task 1 audit.

    3. Add a "References" section at the end of the file (or extend if present):
       ```markdown
       ## References

       See `docs/references.bib` for BibTeX. Primary Phase 20 references:

       - Klaassen et al. 2021, Scientific Reports — Defensive freezing ×
         approach-avoidance (`klaassen2021freezing`)
       - Klaassen et al. 2024, Communications Biology — HGF × cardiac × AA
         (`klaassen2024neurocomputational`) — primary methodological grounding
         for PAT-RL response models B/C/D
       - Klaassen et al. 2024, bioRxiv preprint — Freezing × threat-reward
         information processing (`klaassen2024freezingpreprint`)
       - Klaassen et al. 2021, Frontiers in Neuroscience — Autonomic
         psychophysiological states in AA (`klaassen2021autonomic`)
       ```
  </action>
  <verify>
    Run: `grep -E "(Browning|Daw 20[0-9][0-9]|Schönberg|Schonberg)" docs/PAT_RL_API_HANDOFF.md` — zero matches.
    Run: `grep "Klaassen" docs/PAT_RL_API_HANDOFF.md` — at least 4 matches.
  </verify>
  <done>
    - docs/PAT_RL_API_HANDOFF.md has zero pre-2020 citations (except Rigoux/Watanabe/Friston/Gelman if present and justified)
    - References section at end lists primary Klaassen citations
    - Links to docs/references.bib
  </done>
</task>

<task type="auto">
  <name>Task 6: Audit src/prl_hgf/ docstrings for pre-2020 citations and replace — VERIFY upstream plans' Klaassen refs are already present</name>
  <files>src/prl_hgf/env/pat_rl_config.py, src/prl_hgf/env/pat_rl_sequence.py, src/prl_hgf/env/pat_rl_simulator.py, src/prl_hgf/models/response_patrl.py, src/prl_hgf/fitting/hierarchical_patrl.py, src/prl_hgf/fitting/fit_vb_laplace_patrl.py</files>
  <action>
    For each file in `files_modified`, grep for pre-2020 author-year patterns and replace with Klaassen refs or remove (if they're task-design filler).

    ```bash
    grep -n -E "(Browning 201[0-9]|Daw 200[0-9]|Sch(ö|o)nberg 200[0-9]|Behrens 200[0-9])" \
        src/prl_hgf/env/pat_rl_*.py src/prl_hgf/models/response_patrl.py \
        src/prl_hgf/fitting/*patrl*.py
    ```

    Per RESEARCH.md §9.1: "No old citations were found in src/prl_hgf/models/response_patrl.py or src/prl_hgf/fitting/hierarchical_patrl.py — those files are already clean."

    **H2 verification step (NEW):** Plans 20-02, 20-03, and 20-04 were committed BEFORE this plan
    (per the updated `depends_on: [20-01, 20-02, 20-03, 20-04]`). Those plans added inline Klaassen 2024
    references to the following files:

    - `src/prl_hgf/models/response_patrl.py` — Plan 20-02 added Klaassen 2024 Comms Bio ref to
      model_b_logp and model_c_logp sign-convention comments. Verify:
      ```bash
      grep -n "Klaassen" src/prl_hgf/models/response_patrl.py
      ```
      — expect >= 1 match. If zero: Plan 20-02 drifted; re-apply the inline ref here.

    - `src/prl_hgf/fitting/hierarchical_patrl.py` — Plan 20-03 added Klaassen 2024 to Model D
      docstring. Verify:
      ```bash
      grep -n "Klaassen" src/prl_hgf/fitting/hierarchical_patrl.py
      ```
      — expect >= 1 match.

    - `src/prl_hgf/env/pat_rl_simulator.py` — Plan 20-04 added Klaassen 2024 to the
      simulate_patrl_cohort docstring (ε₂-coupled ΔHR generative model). Verify:
      ```bash
      grep -n "Klaassen" src/prl_hgf/env/pat_rl_simulator.py
      ```
      — expect >= 1 match.

    For any matches found, replace in-place with:
    - "See Klaassen et al. 2024 Communications Biology" (methodological)
    - OR remove if filler
    - OR "See `docs/references.bib::klaassen2024neurocomputational`" (docstring reference)

    For `response_patrl.py`: Plan 20-02 added `model_b_logp` / `model_c_logp` with inline Klaassen 2024 reference in sign-convention comments. Verify that's present and update the module docstring (lines 1-35) to reference `docs/references.bib::klaassen2024neurocomputational` if not already.

    For `hierarchical_patrl.py`: Plan 20-03 added Model D; confirm the Model D docstring references Klaassen 2024.

    Any AddedModule with a pre-2020 citation that survived Plans 20-01 through 20-07 gets edited here.
  </action>
  <verify>
    Run: `grep -rn -E "(Browning 201[0-9]|Daw 200[0-9]|Sch(ö|o)nberg 200[0-9])" src/prl_hgf/` — zero matches.
    Run: `grep -rn "Klaassen" src/prl_hgf/` — at least 3 matches (response_patrl.py, hierarchical_patrl.py, pat_rl_simulator.py docstrings — all three populated by upstream Plans 20-02/20-03/20-04).
  </verify>
  <done>
    - Zero pre-2020 non-methodology citations in src/prl_hgf/
    - Klaassen references present in PAT-RL docstrings (from Plans 20-02/20-03/20-04 or backfilled here)
    - Methodology citations (Rigoux 2014 in bms.py; Watanabe 2010; Friston 2007) KEPT with justification
    - H2 dependency verification: upstream plans' Klaassen inline refs confirmed present
  </done>
</task>

<task type="auto">
  <name>Task 7: Audit .planning/ for pre-2020 citations and update</name>
  <files>.planning/phases/20-patrl-scientific-completion/20-RESEARCH.md, .planning/phases/*/*-PLAN.md (if any contain pre-2020 refs in docstrings)</files>
  <action>
    Check `.planning/phases/20-patrl-scientific-completion/` and any Phase 18/19 planning docs that may have propagated the old citations:

    ```bash
    grep -rn -E "(Browning 201[0-9]|Daw 200[0-9]|Sch(ö|o)nberg 200[0-9])" .planning/phases/20-patrl-scientific-completion/ .planning/phases/18-*/ .planning/phases/19-*/
    ```

    For each match in a `-PLAN.md`, `-RESEARCH.md`, or `-SUMMARY.md` file:
    - If the file is Phase 20 (20-RESEARCH.md etc.): update to Klaassen ref
    - If the file is Phase 18/19: add a note inline `(retired in Phase 20 per SC10; see configs/pat_rl.yaml current comments)` rather than editing — preserve Phase 18/19 history

    Phase 20 planning docs must be clean post-edit.
  </action>
  <verify>
    Run: `grep -rn -E "(Browning 201[0-9]|Daw 200[0-9]|Sch(ö|o)nberg 200[0-9])" .planning/phases/20-patrl-scientific-completion/` — zero matches in 20-* files.

    Phase 18/19 doc matches may persist with "retired in Phase 20" notes — that's acceptable historical record.
  </verify>
  <done>
    - Zero pre-2020 citations in .planning/phases/20-patrl-scientific-completion/
    - Phase 18/19 historical references annotated (not deleted)
  </done>
</task>

</tasks>

<verification>
  - `grep -rn -E "(Browning 201[0-9]|Daw 200[0-9]|Sch(ö|o)nberg 200[0-9])" configs/ docs/ src/prl_hgf/ .planning/phases/20-patrl-scientific-completion/ --include="*.yaml" --include="*.py" --include="*.md"` — zero matches
  - `grep -rn "Klaassen" configs/ docs/ src/prl_hgf/` — ≥ 5 matches total
  - `grep -c "^@" docs/references.bib` — ≥ 8 entries
  - `pytest tests/ -v -k "not slow"` — no test regression (docstring changes should not break tests)
  - `ruff check src/prl_hgf/` — clean (docstring format preserved)
  - SC10 self-check: audit file `.planning/phases/20-patrl-scientific-completion/20-08-citation-audit.md` matches actual repo state post-edit
  - H2 regression check: Klaassen refs from upstream plans (20-02 response_patrl.py, 20-03 hierarchical_patrl.py, 20-04 pat_rl_simulator.py) are intact. Zero Klaassen refs were deleted by this plan — only added.
</verification>

<success_criteria>
  - SC10 complete: every literature citation ≥ 2020 where consumer-spec-relevant; Roelofs-group-first; Browning 2015 / Daw 2006 / Schönberg 2007 retired from PAT-RL config/docs
  - docs/references.bib created with 8+ BibTeX entries
  - Methodology citations (Rigoux 2014, Watanabe 2010, Friston 2007, Gelman 2014) KEPT with justification
  - No fabricated citations — RESEARCH.md §9.2 LOW-confidence entries (Terburg, Hulsman, Ly, Roelofs reviews) only included if user supplied BibTeX in Task 2 resume-signal
  - Phase 18/19 historical planning docs annotated (not deleted) to preserve audit trail
  - Zero test regressions
  - H2 dependency inversion resolved: 20-08 runs AFTER 20-02/20-03/20-04 in Wave 4; upstream Klaassen refs are verified as present (not overwritten)
  - L12 file tracking resolved: Task 1's audit artifact is recorded in `planning_artifacts_produced` frontmatter field
</success_criteria>

<output>
Create `.planning/phases/20-patrl-scientific-completion/20-08-SUMMARY.md` with: (a) before/after citation counts per file, (b) list of files edited, (c) any user-supplied additional BibTeX entries from Task 2, (d) any citations the user wanted but the planner could not source (e.g. specific Terburg/Hulsman/Ly papers — flagged for manual insertion), (e) confirmation that Plans 20-02/20-03/20-04 upstream Klaassen refs are intact (H2 check).
</output>
