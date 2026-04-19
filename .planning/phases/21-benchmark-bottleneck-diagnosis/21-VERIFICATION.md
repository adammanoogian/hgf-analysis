---
phase: 21-benchmark-bottleneck-diagnosis
verified: 2026-04-19T00:00:00Z
status: passed
score: 7/7 SCs satisfied
re_verification: null
---

# Phase 21: Benchmark Bottleneck Diagnosis - Verification Report

**Phase Goal (from ROADMAP.md Phase 21):** Identify the root cause of the Phase 14 BlackJAX GPU benchmark bottleneck observed in job 54899271 (cold JIT 2197s, warm JIT 1965s -> only 1.1x cache speedup; timed out at 8h on N=50 Phase 2). Produce diagnostic evidence needed to pick a principled fix. Purely diagnostic - does NOT re-execute the Phase 14 production benchmark.

**Verified:** 2026-04-19
**Status:** passed
**Re-verification:** No - initial verification.

---
## Goal Achievement

The phase goal is achieved. Every SC1-SC7 artifact exists, is substantive, is internally cross-consistent, and the VERDICT concretely names the bottleneck layer (cache_key) and a PR-level fix.

### Observable Truths

| # | Truth | Status | Evidence |
|---|-------|--------|----------|
| 1 | Graph scope vs state-space baselines quantified with HLO-derived numbers | VERIFIED | benchmark-scope-memo.md sec c: PAT-RL 3-level 673 ops at P=3, scan body 23 direct / ~175 inlined; pick_best_cue 3-level 1515 ops, 427 direct / ~1170 inlined; NumPyro 100-state HMM (~200 ops/step) and Kalman/LGSSM (~20-30 ops/step) rows present. |
| 2 | Bottleneck layer named concretely, not undetermined | VERIFIED | vb_laplace_vs_nuts_jit.json line 47: bottleneck_layer = cache_key. VERDICT.md sec a names same layer. |
| 3 | Cache dir populated; HLO hash stable cross-process; N=2 vs N=50 HLO equivalence answered | VERIFIED | cache_forensics.md sec a (13 per-node subdirs, 1.8G), sec b (scan body 2f25aed94588c656 byte-identical across nuts_P5 == pscan_P5_cold == pscan_P5_warm), sec c (P=5 scan body != P=50 scan body -> N=2 warm-up orthogonal to N=50). |
| 4 | JIT scaling vs P measured across P in {5,20,50} | VERIFIED | jit_scaling_sweep.csv has 8 rows spanning P=5, P=20, P=50 with all required columns. 1.00x cross-process speedup at every tested P. |
| 5 | Root-cause + PR-level fix + follow-up plan + success criterion present | VERIFIED | VERDICT.md sec a names cache_key; sec c names file (cluster/14_benchmark_gpu.slurm), function (line 99), patch shape (SBATCH nodelist); sec d names 14.1-07; sec e gives next_proc/cold >= 3.0x at P=50. |
| 6 | Phase is diagnostic-only - no production code touched | VERIFIED | git diff --stat d0c13e6..HEAD -- src/ shows ONE line added to src/prl_hgf/fitting/laplace_idata.py (commit e4eae94 fix 20-02-gap) which is Phase-20 bug-fix, NOT Phase 21 production. git diff --stat d0c13e6..HEAD -- results/power/ empty. apply_decision_gate home src/prl_hgf/power/iteration.py has zero commits in range. |
| 7 | Every SLURM job has walltime <= 30min | VERIFIED | All three cluster/21_diagnose_*.slurm files have SBATCH time=00:30:00. |

**Score:** 7/7 truths verified.

---

## SC Pass/Fail Table

| SC | Requirement | Status | Evidence cited |
|----|-------------|--------|----------------|
| SC1 | benchmark-scope-memo.md with (a) HLO comparison vs state-space, (b) message-passing, (c) FLOPs/draw | PASS | File exists (412 lines). Sec c table: 6 rows incl NumPyro HMM + LGSSM. Sec d: 14 _where_* clamps, nested partial(jit) decorators, beliefs_propagation callees. Sec b: PAT-RL 3-level ~40-80 MFLOPs/draw, pick_best_cue ~150-300 MFLOPs/draw at P=50, ~2x tolerance, 32 leapfrog steps/draw midpoint. No 8-schools/Radon/transformer/CNN - state-space-only. |
| SC2 | JSON with bottleneck_layer in 7-value enum (concrete) + per_call_wall_clock + per_p_scaling + nuts_per_p_scaling + hlo_op_counts | PASS | File exists (84 lines). bottleneck_layer = cache_key (concrete). All 5 required fields populated. P=5 Laplace cold 41.8s/warm 14.8s/next_proc 24.64s. NUTS P=5 cold 56.7s, P=20 cold 195.4s. hlo_op_counts has 14 entries from 21-01 memo. |
| SC3 | cache_forensics.md with (a) listing+bytes, (b) HLO hash diff, (c) N=2 vs N=50 verdict | PASS | File exists (628 lines). Sec a: user-pasted listing with 13 compute-node subdirs + 1.8G + m3a118 for Phase 14 job. Sec b: hash matrix + Jaccard + XLA-emitted key identity (seven jit_scan-{03f89614,...,c450ea14} bit-identical cold vs warm at P=5). Sec c: N=2 (hash 2f25aed94588c656) != N=50 (hash 62fbc95475cb0a32), 15-byte delta, recommend deleting N=2 warm-up. Note: pscan_P20_warm dump missing, documented in Methodology, signal preserved via nuts_P20 vs pscan_P20_cold. |
| SC4 | jit_scaling_sweep.csv with P in {5,20,50} + required columns | PASS | File exists (9 lines). Header matches spec exactly: P,cold_jit_s,same_proc_warm_s,next_proc_warm_s,draws_per_s,vram_peak_mb,status. 3xP=5 + 3xP=20 + 2xP=50 rows; all status=completed. Numbers match VERDICT and cache_forensics. P=2 dropped per planner judgment (CONTEXT sanctioned, ROADMAP notes this). |
| SC5 | VERDICT.md naming ONE bottleneck + PR-level fix (file, function, patch shape) | PASS | File exists (440 lines). Sec a: cache_key. Sec c: FILE=cluster/14_benchmark_gpu.slurm, FUNCTION=cache-dir export at line 99, PATCH=SBATCH nodelist=<node> (option A) or drop SLURMD_NODENAME suffix (option B) + delete N=2 warm-up. Sec d: follow-up plan 14.1-07. Sec e: success criterion next_proc_warm_s/cold_jit_s >= 3.0x at P=50. Sec h: self-check closure checklist. |
| SC6 | No prod code changes since d0c13e6 | PASS | git diff --stat d0c13e6..HEAD -- src/ shows only src/prl_hgf/fitting/laplace_idata.py (+1 line, commit e4eae94 fix 20-02-gap = Phase-20 bug-fix, NOT Phase 21). results/power/ and results/benchmark* diffs empty. src/prl_hgf/power/iteration.py (apply_decision_gate home) untouched. Scripts/ changes in 08_run_power_iteration.py + 12_smoke_patrl_foundation.py are sanctioned diagnostic additions per ROADMAP. |
| SC7 | All SLURM jobs walltime <= 30min | PASS | cluster/21_diagnose_pscan.slurm:51, cluster/21_diagnose_laplace.slurm:28, cluster/21_diagnose_nuts.slurm:46 all have SBATCH time=00:30:00. |

---

## Cross-Consistency Spot Checks (VERDICT vs underlying data)

| Claim | Source | Independent cross-check | Status |
|-------|--------|-------------------------|--------|
| P=5 cold 55.5s / next_proc_warm 55.5s (1.00x) | VERDICT sec a, JSON | CSV rows 2-4: cold 55.49-56.75, next_proc_warm all 55.50 | PASS |
| P=50 cold 229s / next_proc_warm 229s (1.00x) | VERDICT sec b Cand 8, JSON | CSV rows 5,8: cold 228.99/233.78, next_proc_warm 229.00 | PASS |
| Laplace cold 41.8s at P=5 | VERDICT sec b Cand 1 | JSON per_call_wall_clock.5.cold_s = 41.8 | PASS |
| NUTS cold 56.7s at P=5 | VERDICT sec b Cand 1 | JSON nuts_per_p_scaling.5.cold_s = 56.7 | PASS |
| Seven jit_scan XLA keys bit-identical cold vs warm at P=5 | VERDICT sec b Cand 3, cache_forensics sec b | cache_forensics sec b lines 323-326 list identical seven keys for both logs | PASS |
| Scan-body sha 2f25aed94588c656 for nuts_P5 == pscan_P5_cold == pscan_P5_warm | VERDICT sec b Cand 3 | hlo_hash_matrix.json per_run entries confirm identical hash + file sizes | PASS |
| PAT-RL 3-level ~175 inlined ops/trial | VERDICT sec b Cand 2 | benchmark-scope-memo.md sec c table + JSON hlo_op_counts.patrl_3level_scan_body_per_trial_inlined = 175 | PASS |
| Phase 14 job 54899271 routed to m3a118 | VERDICT sec b Cand 8, cache_forensics sec a | cluster/logs/bench14_54899271.out:38 cited consistently in both | PASS (triangulated) |
| JAX_COMPILATION_CACHE_DIR line at cluster/14_benchmark_gpu.slurm:99 with SLURMD_NODENAME suffix | VERDICT sec c | Grep confirms line 99 literal with /.jax_cache_gpu/SLURMD_NODENAME:-local suffix | PASS |
| P=5 scan body 4,771,952 B != P=50 scan body 4,786,267 B | cache_forensics sec c | hlo_hash_matrix.json per_run sizes match both values exactly | PASS |

Every quantitative claim in VERDICT.md is traceable to a primary data file and the numbers match.

---

## Artifact Substantive-ness Check

| Artifact | Expected | Lines / Size | Status |
|----------|----------|-------------:|--------|
| benchmark-scope-memo.md | Scope memo + table + FLOPs | 412 lines | SUBSTANTIVE |
| vb_laplace_vs_nuts_jit.json | 5 top-level + verdict | 84 lines, valid JSON | SUBSTANTIVE |
| cache_forensics.md | Forensics + hash matrix + narrative | 628 lines | SUBSTANTIVE |
| jit_scaling_sweep.csv | P-sweep CSV spec columns | 9 lines (8 data rows) | SUBSTANTIVE |
| VERDICT.md | Root-cause + fix + follow-up | 440 lines | SUBSTANTIVE |
| hlo_hash_matrix.json | Auxiliary hash matrix | >100 lines | SUBSTANTIVE |
| compute_hlo_hashes.py | Repro script | present | PRESENT |
| hlo_dumps/ | 9 subdirs (8 present, 1 documented-missing) | 8/9 | SUBSTANTIVE (gap documented) |
| jaxpr_dumps/ | HLO + JAXPR + op_counts | present | PRESENT |
| cluster/21_diagnose_{laplace,nuts,pscan}.slurm | Diagnostic SLURMs | 3 files, all <=30min | SUBSTANTIVE |
| cluster/21_submit_pscan_chain.sh | P-sweep chain wrapper | present | PRESENT |
| 21-01..21-07 SUMMARY.md | Plan SUMMARYs | 7 files | SUBSTANTIVE |

No stubs. No placeholders. All artifacts carry real content.

---

## Anti-Pattern Scan

No blocker anti-patterns found. The phase is a research/diagnostic phase producing memos + data files + SLURM scripts, not a code-shipping phase.

Minor notes (not gap-closure-required):

- cache_forensics.md Methodology section notes a single missing HLO dump directory (pscan_P20_warm/) for SLURM job 54901806 - user prompt explicitly sanctions this as a known, documented gap. Memo sec c is unaffected because cross-process P=20 equivalence is measured via nuts_P20 == pscan_P20_cold.
- trace_scope.py and compute_hlo_hashes.py live in the phase directory rather than src/ - intentional per CONTEXT: local diagnostic helpers, not production code.

---

## Human Verification

None required. All seven SCs are mechanically verifiable and mechanically passed. The quantitative success criterion for the fix (next_proc_warm_s / cold_jit_s >= 3.0x at P=50) is human-actionable by submitting cluster/21_submit_pscan_chain.sh AFTER the recommended node-pin patch lands in 14.1-07 - but that test is a follow-up-plan verification, not a Phase 21 verification.

---

## Requirements Coverage

All phase-linked requirements (BENCH-DIAG-01 through BENCH-DIAG-05) are satisfied by the SC1-SC5 artifacts (1-to-1 mapping in the ROADMAP).

---

## Gaps Summary

**None.** The phase goal is achieved.

The phase produces a complete, internally cross-consistent, quantitatively defensible root-cause diagnosis (cache_key = per-node cache scope vs SLURM scheduler mismatch) with an actionable PR-level fix recommendation (node-pinning in cluster/14_benchmark_gpu.slurm:99) and a named follow-up plan (14.1-07). The bottleneck layer in the JSON matches the VERDICT, quantitative citations match the CSV/JSON, and diagnostic-only scope is preserved (zero production code changes attributable to Phase 21).

Phase 21 is ready to close. The immediate next action is to create .planning/phases/14-integration-gpu-benchmark/14.1-07-PLAN.md (or equivalent) implementing the node-pin patch and delete-N=2-warmup secondary patch; that plan lives in Phase 14, not Phase 21.

---

*Verified: 2026-04-19*
*Verifier: Claude (gsd-verifier)*

