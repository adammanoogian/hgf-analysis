# Changelog

All notable changes to this project are documented here.
Format based on [Keep a Changelog](https://keepachangelog.com/).

## [Unreleased]

### Added
-

### Changed
-

### Fixed
-

## [2026-04-30] - Phase 26 Wave 1: Hygiene

### Added
- `CHANGELOG.md` at repo root (Keep-a-Changelog format, date-based entries)
- `logs/` directory with `.gitkeep` marker so SLURM and dev logs stay local
- `tests/integration/__init__.py` marking the integration package
- `tests/integration/test_phase_structure.py` closure-guard scaffold (Wave-1
  hygiene assertions; Waves 2–4 will append config-alias, layout, and
  pipeline checks in lockstep with structural changes)
- `.git/hooks/pre-push` (local-only) to block `.planning/` audit files from
  reaching upstream

### Changed
- `.gitignore`: added `logs/` ignore line next to the Generated-artifacts block

### Removed
- `_t2_verify.py` (root-level scratch script; no longer needed — see git history)
- `bash.exe.stackdump` (OS crash dump; was already gitignored)
- `slurm-54768408.out` (SLURM job log; was already gitignored)
- Root-level `__pycache__/` (auto-regenerated; already gitignored)
