# TEMPLATE_AUDIT.md — PAT-RL Hardcoded Surface Catalog

**Date:** 2026-04-24
**Source file:** `figures/patrl_hgf_model.html` (676 lines, current HEAD as of phase 23 open)
**Purpose:** P11 procedural guard. Catalogs every hardcoded PAT-RL surface in
the seed template that must be either **R**emoved, **I**njected, or
**G**uarded by a conditional in the generic `hgf_viewer.html` template
produced by plan 23-02.
**Consumer:** Plan 23-02 (template promotion) + Plan 23-03 (export.py).

## Classification Legend

| Code | Meaning | Action by plan 23-02 |
|------|---------|----------------------|
| **R** | **R**emove | Strip entirely from the generic template (no equivalent in NetworkSpec v1.3) |
| **I** | **I**nject | Replaced by a Jinja2 substitution slot driven by NetworkSpec / RoleAssignment |
| **G** | **G**uard | Kept but wrapped in a conditional (e.g., 3-level vs 2-level branch is a per-spec runtime fact, not a hardcoded radio) |

---

## 1. Grep Output — ROADMAP Audit Terms (11 terms)

Each term run via `grep -n '<term>' figures/patrl_hgf_model.html` against
the 676-line seed.

### 1.1 `balanced` — 4 hits

```
47:  balanced:             '#1D9E75',
56:    id:"balanced",
58:    color: PC.balanced,
125:  const [phenoId, setPhenoId] = useState("balanced");
```

### 1.2 `reward_blunted` — 3 hits

```
48:  reward_blunted:       '#378ADD',
64:    id:"reward_blunted",
66:    color: PC.reward_blunted,
```

### 1.3 `threat_hypervigilant` — 3 hits

```
49:  threat_hypervigilant: '#993C1D',
72:    id:"threat_hypervigilant",
74:    color: PC.threat_hypervigilant,
```

### 1.4 `both_disrupted` — 3 hits

```
50:  both_disrupted:       '#534AB7',
80:    id:"both_disrupted",
82:    color: PC.both_disrupted,
```

### 1.5 `Klaassen` — **(0 hits — ROADMAP listed this term but it is absent from the seed template)**

```
$ grep -n 'Klaassen' figures/patrl_hgf_model.html
$ # (no output — exit 1)
```

ROADMAP success criterion 1 listed `Klaassen` as an audit term. The
pre-planning grep (research §1) confirmed this term is not present in
the current seed. The audit records the 0-hit explicitly so a future
reader does not assume the term was overlooked.

### 1.6 `bradycardia` — 4 hits (long lines truncated by grep, re-listed in full below)

```
95: dhr (INFO dict): "Trial-level change in heart rate during the anticipation window. ΔHR < 0 = bradycardia — a parasympathetic (vagal) pre-response..."
103: gamma (INFO dict): "Adds the autonomic signal directly to the approach logit: +γ·ΔHR. Since anticipatory bradycardia is negative..."
104: alpha (INFO dict): "Scales how much ΔHR modulates EV sensitivity... bradycardia attenuates threat sensitivity in real-time..."
110: dhr_ev (INFO dict): "...In healthy agents, bradycardia may attenuate threat sensitivity (α_shk < 0)..."
111: dhr_resp (INFO dict): "Direct effect of anticipatory bradycardia on the approach logit..."
```

(All embedded inside INFO dict tooltip body strings.)

### 1.7 `C.dhr` — 6 hits

```
251:            {sh:"dia",c:C.dhr,t:"ΔHR / magnitude input"}].map((it,i)=>(
540:                  <polygon points={diamPts(88,evY,20,15)} fill={C.dhr.fill} stroke={C.dhr.stroke} strokeWidth={1.5}/>
541:                  ... fill={C.dhr.text}>Vᵣ</text>
546:                  <polygon points={diamPts(SW_D-88,evY,20,15)} fill={C.dhr.fill} stroke={C.dhr.stroke} strokeWidth={1.5}/>
547:                  ... fill={C.dhr.text}>Vₛ</text>
580:              const nc=nC("dhr",C.dhr);
```

(`C.dhr` is the green color palette entry at line 40 used by ΔHR + magnitude diamonds.)

### 1.8 `PHENOS` — 3 hits

```
54:const PHENOS = [
128:  const pheno = PHENOS.find(p => p.id === phenoId);
232:          {PHENOS.map(p=>(
```

(Definition at 54-87 + lookup at 128 + sidebar render at 232-243.)

### 1.9 `shock_mag` — 1 hit

```
94:  ev_box (INFO dict): "...This is computed by expected_value(mu2, reward_mag, shock_mag) in response_patrl.py..."
```

### 1.10 `reward_mag` — 1 hit

```
94:  ev_box (INFO dict): "EV = (1 − P_d) · Vᵣ − P_d · Vₛ ... where ... Vᵣ = reward magnitude {1,3}, Vₛ = shock magnitude {1,3}. This is computed by expected_value(mu2, reward_mag, shock_mag) in response_patrl.py..."
```

### 1.11 `response_patrl` — 1 hit

```
94:  ev_box (INFO dict): "...is computed by expected_value(mu2, reward_mag, shock_mag) in response_patrl.py..."
```

(Same line as 1.9 + 1.10; counted once in the unique-occurrence summary.)

---

## 2. Grep Output — Google Fonts (EXPORT-05 clause (b))

```bash
grep -nE 'googleapis|@import.*font|fonts\.googleapis\.com' figures/patrl_hgf_model.html
```

Result: **2 hits**

```
7:<link rel="preconnect" href="https://fonts.googleapis.com">
9:<link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:ital,wght@0,300;0,400;0,600;0,700;1,400&family=STIX+Two+Text:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
```

Note: line 8 is a third related `<link rel="preconnect">` for
`fonts.gstatic.com` — does not match the regex (no `googleapis`) but is
semantically part of the Google Fonts block. The plan 23-02 excision
must remove all three lines (7, 8, 9).

**Both googleapis hits classified R for plan 23-02 excision.** v1.3 uses
system-font fallback only:
```
font-family: 'Source Sans 3', 'Source Sans Pro', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
```
Google Fonts inlining is deferred to v1.4 POLISH-05.

---

## 3. Classification Tables (per region)

### 3.1 Title + metadata (line 6)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 6 | `<title>PAT-RL HGF Model</title>` | **I** | Inject `{{ title }}` from `NetworkSpec.task_name` (e.g., `"3-level binary HGF"`). |

### 3.2 Google Fonts `<link>` block (lines 7–9)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 7 | `<link rel="preconnect" href="https://fonts.googleapis.com">` | **R** | EXPORT-05 (b) — system-font fallback only in v1.3. |
| 8 | `<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>` | **R** | Same — part of Google Fonts triple. |
| 9 | `<link href="https://fonts.googleapis.com/css2?family=Source+Sans+3...&family=STIX+Two+Text...">` | **R** | Same — replace `font-family` declaration to use `system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif` and Georgia/`STIX Two Text,Georgia,serif` math fallbacks. |

### 3.3 Phenotype block — palette + PHENOS array + render (lines 45–87, 125–158, 231–244)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 45–51 | `const PC = { balanced: ..., reward_blunted: ..., threat_hypervigilant: ..., both_disrupted: ... };` | **R** | Phenotype palette is PAT-RL-specific. NetworkSpec v1.3 has no phenotype concept. |
| 53–87 | `const PHENOS = [...4 entries...];` | **R** | Entire phenotype taxonomy is PAT-RL clinical framing. Plan 23-02 strips wholesale. |
| 125 | `const [phenoId, setPhenoId] = useState("balanced");` | **R** | Phenotype state hook — no phenotypes in v1.3. |
| 128 | `const pheno = PHENOS.find(p => p.id === phenoId);` | **R** | Lookup against deleted PHENOS. |
| 134–136 | `const hlN = id => pheno.hlN.includes(id); const hlE = ...; const hlP = ...;` | **R** | Highlight predicates derive from phenotype — no equivalent in v1.3. Plan 23-02 must also strip the call sites (`hlN("vol")`, `hlE("kappa_e")`, `hlP("omega2")`, etc.) and replace with `false` or remove the `nc=hlN?…` conditionals entirely. |
| 156–158 | `nC = (id,base) => hlN(id) ? C.hl : (sel===id ? {...base,stroke:"#2563EB"} : base);` etc. | **R** (partial) | Strip the `hlN(id) ? C.hl :` branch. Keep the `sel===id ? ... : base` branch — selection highlight is generic UX, not PAT-RL. |
| 231–244 | `<Blk title="ANS PHENOTYPES (2×2)"> {PHENOS.map(p=>(...))} </Blk>` | **R** | Sidebar phenotype-picker block — entire `<Blk>` removed. |

### 3.4 ANS / SNS / PNS framing in INFO dict (lines 91–112)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 91 | `input: { title:"u — Binary state observation (node 0 in pyhgf)", body:"...IMPORTANT — u vs choices: u drives the HGF belief update. The participant's approach/avoid CHOICES are fitted separately..." }` | **R** | Tooltip body is PAT-RL response-model framing. v1.3 NetworkSpec has no per-node `tooltip` field; recommendation: strip INFO dict entirely (see §5 open question). |
| 92–112 | All other INFO dict entries (belief, vol, ev_box, dhr, resp, omega2/3, kappa, mu3_0, beta, b, gamma, alpha, vrew, vshk, val, kappa_e, ev_resp, dhr_ev, dhr_resp) | **R** | All bodies reference SNS/PNS, phenotypes ①②③④, ΔHR, response models A/B/C, reward/shock magnitudes — none of which exist in NetworkSpec. |
| (downstream) line 160 | `const displayInfo = (sel && INFO[sel]) ? INFO[sel] : null;` | **R** | After INFO is stripped, `displayInfo` is dead. Plan 23-02 must also strip the `{displayInfo&&<div>...</div>}` block at lines 650–659. |

### 3.5 Response model controls (lines 122, 131–132, 216–229, 343–357)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 122 | `const [respModel, setRespModel] = useState("C");` | **R** | Response-model state — PAT-RL Models A/B/C don't exist in HGF NetworkSpec. |
| 131–132 | `const hasDHR = respModel === "B" \|\| respModel === "C"; const hasAlpha = respModel === "C";` | **R** | Same reason — PAT-RL response-model branching. |
| 216–229 | `<Blk title="RESPONSE MODEL"> ... {[{id:"A",...},{id:"B",...},{id:"C",...}].map(...)} </Blk>` | **R** | Sidebar response-model picker — entire `<Blk>` removed. |
| 343–357 | `<EqHeader x={EQX} y={rowI+174} text={\`RESPONSE MODEL (MODEL ${respModel})\`}> ... {respModel==="A"&&<>...</>} ... ` | **R** | Response-model equation block — strip lines 343–357 entirely from the equations panel. |
| 173–177 | `const formula = respModel==="A" ? "P(approach) = σ( β · EV  +  b )" : ...` | **R** | Formula computation for the response-model rectangle (lines 631–644). Strip together with §3.6 response box. |

### 3.6 DHR node + edges + magnitude diamonds (lines 40, 42, 251, 540–550, 576–607)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 40 | `dhr: { fill:"#E8F5E9", stroke:"#388E3C", text:"#1B5E20" }, // green – ΔHR` | **R** | Color palette entry only used by PAT-RL ΔHR + magnitude diamonds. |
| 42 | `eDHR:"#388E3C"` (inside C.eDHR) | **R** | Edge color for ΔHR arrows. |
| 251 | `{sh:"dia",c:C.dhr,t:"ΔHR / magnitude input"}` (notation sidebar entry) | **R** | One of the legend rows in §3.10 sidebar. Remove this row from the array. |
| 540–550 | Vᵣ + Vₛ magnitude diamonds (`diamPts(88,evY,...) fill={C.dhr.fill}` and `diamPts(SW_D-88,evY,...)`) | **R** | PAT-RL reward/shock magnitude inputs — no equivalent in NetworkSpec. |
| 576–607 | Entire `{hasDHR&&(()=>{ ... })()}` block: ΔHR diamond + γ edge + (conditional) α edge | **R** | PAT-RL autonomic input — no equivalent in NetworkSpec v1.3. |

### 3.7 EV block (lines 302, 339–342, 534–562)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 302 | `<rect x={8} y={evY+30} width={SW_D-16} height={respY+76-evY-30} rx={10} fill={C.resp.stroke} opacity={0.06}/>` | **R** | Response-band background rectangle — depends on `respY` which goes away with response model. |
| 339–342 | `<EqHeader text="EXPECTED VALUE"/> <EqLine text="EV = (1−P_d)·Vᵣ − P_d·Vₛ"/> <EqLine text="P_d = σ(μ₂), Vᵣ,Vₛ ∈ {1,3}"/>` | **R** | Equations panel EV block. |
| 534–562 | Entire EV computation visual block (Vᵣ + Vₛ diamonds + EV rounded-rect + formula text) | **R** | PAT-RL expected-value computation. NetworkSpec has belief node + input node — no EV stage. |
| 520–532 | `Belief → EV curved path` block (`<g onClick={e=>click("ev_box",e)}>...`) | **R** | Edge feeds EV, which is being removed. |
| 564–574 | `EV → response arrow` block | **R** | Edge feeds response model, which is being removed. |
| 609–611 | `RESPONSE / DECISION MODEL` separator + label | **R** | Separator below EV — removed with EV. |
| 613–629 | Response-model parameter squares (β, b, γ, α) | **R** | Response-model parameters — `respPs.map(...)` block. |
| 631–644 | Response-model rectangle with `{formula}` text | **R** | The big purple rectangle showing `P(approach) = σ(...)`. |

After all of §3.6 + §3.7 are removed, the diagram terminates at the
LEVEL 1 input row. SH (height) recomputed to drop `respY + 104` term.

### 3.8 HGF level radio buttons (line 121, 202–214 — P10 guard)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 121 | `const [hgfLevel, setHgfLevel] = useState("3level");` | **I** (P10 guard — load-bearing) | Replaced by `hgfLevel = NETWORK_SPEC.hgf_level` (no `useState`). The P10 guard is precisely "the runtime must read level from the spec, not from a hardcoded `useState("3level")` fallback". This is `I` (inject) not `R` (remove) because the variable is still needed downstream — only its source changes. |
| 129–130 | `const is3 = hgfLevel === "3level"; const isMM = hgfLevel === "2level_mm";` | **G** | Keep the boolean derivations — they branch the SVG (LEVEL 3 hexagon, multimodal vs single observation). NetworkSpec drives `hgfLevel` upstream, so these stay verbatim. |
| 202–214 | `<Blk title="HGF LEVEL"> ... 3 radio buttons ... </Blk>` | **R** | Sidebar level picker — at runtime the level is fixed by the rendered NetworkSpec; no user picker. (If a future use case wants a multi-level switcher, it builds 3 separate exported HTMLs.) |

### 3.9 Literal citations / bradycardia text (lines 110, 111)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 110 | `dhr_ev: { ..., body:"Autonomic (PNS) signal modulates how strongly EV influences the decision. In healthy agents, bradycardia may attenuate threat sensitivity (α_shk < 0) — the PNS reconfigures the value computation in real time." }` | **R** | INFO dict entry — already covered by §3.4 wholesale strip. Listed separately because ROADMAP audit term `bradycardia` matches this line. |
| 111 | `dhr_resp:{ ..., body:"Direct effect of anticipatory bradycardia on the approach logit. Healthy phenotype (①): modest γ < 0..." }` | **R** | Same. |

### 3.10 Notation sidebar (lines 247–275 — keep with 2 removals)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 247–250 | `{sh:"hex",c:C.l3,...}, {sh:"cir",c:C.l2,...}, {sh:"dia",c:C.l1,...}, {sh:"sq",c:C.prm,...}` | **G** | These four legend rows are generic HGF: hexagon=volatility, circle=belief, diamond=input, square=parameter. KEEP. |
| 251 | `{sh:"dia",c:C.dhr,t:"ΔHR / magnitude input"}` | **R** | PAT-RL-specific legend row. |
| 252–262 | Legend SVG row rendering | **G** | KEEP — it operates on the array; no PAT-RL coupling. |
| 263–266 | Edge legend `[{dash:false,col:C.eVal,...}, {dash:true,col:C.eVol,...}, {dash:true,col:C.eRsp,...}, {dash:true,col:C.eDHR,...}]` | **G** with **R** for last 2 rows | KEEP first 2 (value coupling, volatility coupling — generic HGF). REMOVE rows 3 (`→ decision pathway`) and 4 (`ΔHR / PNS autonomic path`) — PAT-RL-specific. |
| 246, 275 | `<Blk title="NOTATION">...</Blk>` wrapper | **G** | KEEP wrapper. |

### 3.11 Helper SVG geometry (lines 115–117 — KEEP unchanged)

| Lines | Content | Classification | Rationale |
|-------|---------|----------------|-----------|
| 115 | `const hexPts=(cx,cy,r)=>...` | **G** (KEEP) | Pure geometry — hex polygon point generator. |
| 116 | `const diamPts=(cx,cy,rx,ry)=>...` | **G** (KEEP) | Pure geometry — diamond polygon point generator. |
| 117 | `const retract=(x1,y1,x2,y2,d)=>...` | **G** (KEEP) | Pure geometry — line endpoint retraction so arrows don't overlap nodes. |

These three helpers + the hex/circle/diamond/rectangle SVG primitives
+ the level background bands (lines 297–301) + the `Blk` helper
component (lines 666–671) constitute the **generic SVG kernel** that
plan 23-02 preserves verbatim.

---

## 4. Summary

| Bucket | Count |
|--------|-------|
| **R** (remove) — unique source-line occurrences | ~34 (4+3+3+3+0+5+6+3+1+1+1 ROADMAP terms = 30 unique source-line hits, plus 4 derived removals: `displayInfo` div, `formula` const, response-band rect, `respY` height term) |
| **R** — Google Fonts `<link>` tags | 2 grep hits (lines 7, 9) + 1 sibling preconnect (line 8) = 3 lines actually removed |
| **I** (inject) — Jinja2 substitution slots | 3 (line 6 `<title>`, line 121 `useState("3level")` → `NETWORK_SPEC.hgf_level`, ROOT slot for `NETWORK_SPEC = {{ network_spec_json }}`) |
| **G** (guard / keep) — preserved regions | hexPts/diamPts/retract helpers (115–117), `is3`/`isMM` booleans + branching (129–130 + all `{is3&&...}`/`{isMM ? ... : ...}` blocks), notation sidebar minus 2 rows (246–275), level background rectangles (298–300), `Blk` helper component (666–671), `nC`/`eC`/`pC` selection-highlight branches (with PAT-RL `hlN`/`hlE`/`hlP` branches stripped), `App` layout shell, `EqHeader`/`EqLine` helpers (179–193) |

### Total `R` impact (rough line count)

- Lines 7–9 (Google Fonts triple): 3 lines
- Lines 45–87 (PC palette + PHENOS): 43 lines
- Lines 89–112 (INFO dict): 24 lines
- Lines 122, 125, 128, 131–136 (state hooks + predicates): ~7 lines
- Lines 173–177 (formula const): 5 lines
- Lines 202–229 (HGF LEVEL + RESPONSE MODEL sidebar Blks): 28 lines
- Line 251 (notation row): 1 line
- Lines 263–266 partial (last 2 edge legend rows): 2 lines
- Lines 302, 339–342, 343–357 (response-band rect + EV equations + response equations): ~24 lines
- Lines 520–574 (Belief→EV path + EV block + EV→response arrow): 55 lines
- Lines 576–607 (DHR block): 32 lines
- Lines 609–644 (response separator + parameter squares + response rectangle): 36 lines
- Lines 231–244 (ANS PHENOTYPES sidebar Blk): 14 lines
- Lines 650–659 (`displayInfo` div): 10 lines

**Estimated post-promotion size:** seed (676) − ~284 stripped + ~30 added (Jinja2 markup, NetworkSpec eval block, system-font CSS, fallback) ≈ **420 lines** in `figures/hgf_viewer.html` after plan 23-02.

---

## 5. Open Questions for Plan 23-02

**Q1: INFO dict tooltip bodies — strip entirely or replace with placeholder?**

The seed has 22 INFO dict entries (lines 91–112), each with `{title, body}`
giving rich PAT-RL-specific tooltip content for clicked nodes/edges.
NetworkSpec v1.3 has **no `label` field on NodeSpec** (Phase 22 schema is
just `{coord, role, level, branch}` per CONTEXT Decision 4) — there is
nothing to substitute in.

**Recommendation for plan 23-02:** STRIP INFO dict entirely. The
`{displayInfo&&<div>...</div>}` info panel (lines 650–659) goes away.
Selection highlight (the blue dashed outline on click) stays — that's
in `nC`/`eC`/`pC` and operates on `sel`, not `INFO[sel]`. Click
behavior remains for visual feedback; just no tooltip text appears.

**Phase 24 enhancement path:** Add a `label` field to NodeSpec (or
build a `tooltips: dict[str, str]` parameter on `render_viewer_html`)
and inject `INFO = {{ tooltips_json }}`.

**Q2: Sidebar shrinkage — keep the 278px-wide sidebar after stripping 2 of its 4 Blks?**

After stripping HGF LEVEL Blk (202–214) and RESPONSE MODEL Blk
(216–229) and ANS PHENOTYPES Blk (231–244), the sidebar contains only
the NOTATION Blk (246–275). 200+px of empty whitespace looks wrong.

**Recommendation for plan 23-02:** Reduce sidebar width to ~180px
(just enough for the NOTATION legend) or move the NOTATION block to a
small bottom-right card and let the SVG fill the full viewport width.

**Decision deferred to plan 23-02 layout pass.**

---

## 6. P10 Guard Verification Commands (run at plan 23-02 close)

These commands establish that plan 23-02 produced a properly generic
template:

```bash
# (a) The hardcoded useState("3level") fallback MUST be gone
grep -n 'useState("3level")' figures/hgf_viewer.html      # expect: 0 hits

# (b) The runtime MUST read level from the injected NetworkSpec
grep -n 'NETWORK_SPEC\.nodes' figures/hgf_viewer.html     # expect: >=1 hit
grep -n 'NETWORK_SPEC\.hgf_level' figures/hgf_viewer.html # expect: >=1 hit

# (c) Google Fonts MUST be excised
grep -cE 'googleapis|@import.*font' figures/hgf_viewer.html  # expect: 0

# (d) PAT-RL audit terms MUST NOT appear in the generic template
grep -cE 'phenotype|bradycardia|response_patrl|shock_mag|reward_mag|PHENOS|C\.dhr' figures/hgf_viewer.html  # expect: 0
```

If any of these checks fails, plan 23-02 is incomplete — do not
proceed to plan 23-03 (export.py).

---

**End of audit. Plan 23-02 may now proceed with template promotion.**
