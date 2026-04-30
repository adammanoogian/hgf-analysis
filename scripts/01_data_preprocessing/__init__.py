# DO NOT import as `scripts.01_data_preprocessing.X`. Python identifiers cannot
# start with a digit. Use relative imports inside this stage, or move
# shared code to scripts/utils/. See
# project_utils/templates/guides/CCDS_SCHEME_D_LAYOUT.md §2.
"""Stage 01 (data preprocessing) — Reserved for raw-data ingest.

Currently empty: pick_best_cue task ingests pre-cleaned per-participant CSVs;
PAT-RL ingest is config-driven via env/. Phase 26 Plan 26-04.
"""
