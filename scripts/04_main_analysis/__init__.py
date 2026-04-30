# DO NOT import as `scripts.04_main_analysis.X`. Python identifiers cannot
# start with a digit. Use relative imports inside this stage, or move
# shared code to scripts/utils/. See
# project_utils/templates/guides/CCDS_SCHEME_D_LAYOUT.md §2.
"""Stage 04 (main analysis) — Main analysis stage.

Two parallel-alternative subfolders: a_mle/ (VB-Laplace), b_bayesian/ (BlackJAX NUTS).
"""
