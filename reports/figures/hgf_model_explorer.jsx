// HGF Model Structure Explorer
// Interactive graphical-model figure for pick_best_cue / psilocybin PRL
// Sliders drive edge thickness; hypothesis presets highlight relevant pathways
// Node shapes follow HANDOFF_pyhgf_plot_network_extension.md spec

import { useState, useMemo } from "react";

// ─── Color palette (from handoff spec) ───────────────────────────────────────
const C = {
  l3:   { fill: "#FAECE7", stroke: "#993C1D", text: "#7a2a10" },  // coral  – level 3 / volatility
  l2:   { fill: "#E1F5EE", stroke: "#0F6E56", text: "#0a5040" },  // teal   – level 2 / beliefs
  l1:   { fill: "#E6F1FB", stroke: "#185FA5", text: "#0d3d7a" },  // blue   – level 1 / inputs
  resp: { fill: "#EEEDFE", stroke: "#534AB7", text: "#3a2d90" },  // purple – response model
  prm:  { fill: "#FFFBEF", stroke: "#9A7820", text: "#6b5200" },  // gold   – parameters
  hl:   { fill: "#FFF3CC", stroke: "#CC8800", text: "#7a5000" },  // amber  – hypothesis highlight
  eVal: "#185FA5",   // solid blue  – value coupling arrows
  eVol: "#993C1D",   // coral dashed – volatility coupling arrows
  eRsp: "#534AB7",   // purple dashed – belief → response
  ePrm: "#9A7820",   // gold dashed  – param → node
};

// ─── Hypothesis definitions ───────────────────────────────────────────────────
const HYPS = [
  {
    id: "none", label: "— Explore freely —", color: "#888", direction: null,
    description: "Click any node, edge, or parameter square to learn what it represents. Sliders adjust parameter magnitudes — edge thickness scales accordingly.",
    hlNodes: [], hlEdges: [], hlParams: [],
  },
  {
    id: "kappa_up", label: "H1: Psilocybin ↑κ", sub: "Enhanced volatility coupling",
    color: "#993C1D", direction: "up",
    description: "Psilocybin strengthens κ — the coupling from the shared volatility node (x₃) to each cue-level belief. A higher κ means individual learning rates are more strongly modulated by the current volatility estimate. Prediction: faster adaptation to reversals, especially mid-session when volatility uncertainty is highest.",
    hlNodes: ["vol"], hlEdges: ["vc0","vc1","vc2"], hlParams: ["kappa"],
  },
  {
    id: "omega2_up", label: "H2: Psilocybin ↑ω₂", sub: "Higher tonic volatility",
    color: "#0F6E56", direction: "up",
    description: "ω₂ sets baseline uncertainty at level 2. Higher ω₂ → broader priors → persistently elevated learning rate regardless of the level-3 volatility estimate. The agent treats all outcomes as more surprising by default. Prediction: faster belief updating across all cues, slightly noisier choice trajectories.",
    hlNodes: ["b0","b1","b2"], hlEdges: ["val0","val1","val2"], hlParams: ["omega2"],
  },
  {
    id: "beta_up", label: "H3: Psilocybin ↑β", sub: "Sharper decision precision",
    color: "#534AB7", direction: "up",
    description: "β (inverse temperature) controls how sharply beliefs drive choices. Higher β → winner-take-most behavior, stronger exploitation. Prediction: higher accuracy on stable acquisition phases, shorter switch latency after reversal — once beliefs update, choices follow immediately.",
    hlNodes: ["resp"], hlEdges: ["re0","re1","re2"], hlParams: ["beta"],
  },
  {
    id: "zeta_down", label: "H4: Psilocybin ↓ζ", sub: "Reduced choice stickiness",
    color: "#534AB7", direction: "down",
    description: "ζ (stickiness) adds a choice-repeat bonus independent of beliefs. Lower ζ → choices are more purely belief-driven, less habitual. Prediction: fewer perseverative errors post-reversal, less momentum on correct-choice streaks during acquisition.",
    hlNodes: ["resp"], hlEdges: ["re0","re1","re2"], hlParams: ["zeta"],
  },
];

// ─── Node info dictionary ─────────────────────────────────────────────────────
const INFO = {
  i0:    { title: "u_A — Cue A observation (node 0)", body: "Binary-state input node. Value = 1 when cue A was chosen and rewarded, 0 when chosen and unrewarded. Unchosen trials: observed=0, belief frozen (partial feedback protocol)." },
  i1:    { title: "u_B — Cue B observation (node 2)", body: "Binary-state input node for cue B. Identical architecture to cue A branch. Only receives a signal on trials where cue B was chosen." },
  i2:    { title: "u_C — Cue C observation (node 4)", body: "Binary-state input node for cue C." },
  b0:    { title: "μ₁_A — Belief about cue A (node 1)", body: "Continuous-state node. Tracks reward probability of cue A in log-odds space. Precision-weighted PE at this level (ε₂_A) is theoretically linked to striatal RPE signals. Updated jointly by ω₂ and (in 3-level model) by κ·μ₂_vol." },
  b1:    { title: "μ₁_B — Belief about cue B (node 3)", body: "Continuous-state node, parallel to cue A branch. Same ω₂ applied." },
  b2:    { title: "μ₁_C — Belief about cue C (node 5)", body: "Continuous-state node, parallel to cue A and B branches." },
  vol:   { title: "μ₂_vol — Shared volatility (node 6)", body: "Continuous-state node shared across all 3 cue branches. Estimates current environmental volatility. Its precision-weighted PE (ε₃) is theoretically linked to amygdala / noradrenaline signals. Only present in the 3-level HGF." },
  omega2:{ title: "ω₂ — Tonic volatility (per branch)", body: "Log-scale baseline volatility for level-2 belief nodes. Higher ω₂ → broader priors → faster learning, independent of the level-3 volatility estimate. Primary psilocybin hypothesis target. Node attribute: tonic_volatility on nodes 1, 3, 5." },
  omega3:{ title: "ω₃ — Meta-volatility (level-3 node)", body: "Baseline volatility for the shared level-3 node. Controls how fast the volatility estimate itself can change. ⚠️ Known poor parameter recovery in the literature — treat group-level ω₃ effects with caution." },
  kappa: { title: "κ — Volatility coupling strength", body: "Scales how strongly the level-3 volatility estimate modulates level-2 learning rates. Effective LR ∝ exp(ω₂ + κ·μ₂). κ=0 collapses to 2-level behaviour; κ=1 (default) gives full volatility modulation. Primary hypothesis: psilocybin ↑κ." },
  beta:  { title: "β — Inverse temperature (decision precision)", body: "Controls sharpness of the softmax. P(k) ∝ exp(β·μ₁_k + ζ·𝟙[prev=k]). Higher β → choices more sharply reflect current belief differences. Range typically 0.5–5 in empirical PRL fits." },
  zeta:  { title: "ζ — Choice stickiness (perseveration)", body: "Adds a repeat-last-choice bonus, independent of beliefs. ζ>0: perseveration. ζ<0: alternation tendency. Positive values are typical in PRL and may reflect motor habit, WM-based repetition, or reduced decision updating." },
  val0:  { title: "Value coupling: μ₁_A ↔ u_A", body: "Bidirectional message passing. Downward: node 1 sends its belief as the prediction for u_A. Upward: the precision-weighted PE ε₁_A propagates back to node 1, updating μ₁_A. Solid blue = value coupling (distinct from volatility coupling)." },
  val1:  { title: "Value coupling: μ₁_B ↔ u_B", body: "Same architecture as the cue A branch." },
  val2:  { title: "Value coupling: μ₁_C ↔ u_C", body: "Same architecture as the cue A branch." },
  vc0:   { title: "Volatility coupling: x₃ → μ₁_A", body: "The shared level-3 node modulates the effective volatility (= learning rate) of the cue A belief node. Coupling strength κ. Dashed coral = volatility coupling (conceptually different from value coupling — this is about precision/uncertainty, not reward value)." },
  vc1:   { title: "Volatility coupling: x₃ → μ₁_B", body: "Same architecture as the cue A branch." },
  vc2:   { title: "Volatility coupling: x₃ → μ₁_C", body: "Same architecture as the cue A branch." },
  re0:   { title: "Belief → response model (cue A)", body: "μ₁_A feeds into the response model as the expected value for cue A. This is a read-only connection — the response model does NOT feed back into the HGF generative model." },
  re1:   { title: "Belief → response model (cue B)", body: "Same as cue A." },
  re2:   { title: "Belief → response model (cue C)", body: "Same as cue A." },
  resp:  { title: "Response model — softmax with stickiness", body: "Maps current beliefs to choice probabilities: P(k) ∝ exp(β·μ₁_k + ζ·𝟙[prev=k]). β controls exploitation vs. exploration; ζ adds a trial-level choice history bias. This is separate from the HGF generative model — it's the observation model for choice data." },
};

// ─── SVG helpers ──────────────────────────────────────────────────────────────
const hexPts = (cx, cy, r) =>
  Array.from({ length: 6 }, (_, i) => {
    const a = (Math.PI / 3) * i - Math.PI / 6;
    return `${(cx + r * Math.cos(a)).toFixed(1)},${(cy + r * Math.sin(a)).toFixed(1)}`;
  }).join(" ");

const diamPts = (cx, cy, rx, ry) =>
  `${cx},${cy - ry} ${cx + rx},${cy} ${cx},${cy + ry} ${cx - rx},${cy}`;

// Retract endpoint by `d` pixels along the line (so arrow stops at node edge)
const retract = (x1, y1, x2, y2, d) => {
  const dx = x2 - x1, dy = y2 - y1;
  const len = Math.hypot(dx, dy);
  if (len < 1) return [x2, y2];
  return [x2 - (dx / len) * d, y2 - (dy / len) * d];
};

// ─── Main component ────────────────────────────────────────────────────────────
export default function HGFExplorer() {
  const [model,  setModel]  = useState("3level");
  const [omega2, setOmega2] = useState(-4);
  const [omega3, setOmega3] = useState(-4);
  const [kappa,  setKappa]  = useState(1.0);
  const [beta,   setBeta]   = useState(1.5);
  const [zeta,   setZeta]   = useState(0.3);
  const [hypId,  setHypId]  = useState("none");
  const [sel,    setSel]    = useState(null);

  const hyp = HYPS.find(h => h.id === hypId);
  const is3 = model === "3level";

  const hlN = id => hyp.hlNodes.includes(id);
  const hlE = id => hyp.hlEdges.includes(id);
  const hlP = id => hyp.hlParams.includes(id);

  // Parameter → edge width mappings
  const wVal  = 1.2 + Math.max(0, (omega2 + 8)) * 0.38; // -8→0 → 1.2→4.2
  const wVol  = 0.8 + kappa * 2.8;                       // 0→2.5 → 0.8→7.8
  const wBeta = 0.8 + beta * 0.65;                       // 0.2→6 → 0.9→4.7
  const wZeta = 0.5 + Math.abs(zeta) * 1.8;              // shows magnitude

  // Layout constants
  const COLS  = [115, 350, 585];
  const SW    = 700;
  const rowV  = 82;
  const rowB  = is3 ? 238 : 168;
  const rowI  = is3 ? 388 : 308;
  const sepY  = rowI + 56;
  const respY = rowI + 118;
  const SH    = respY + 88;

  const handleSel = (id, e) => {
    e?.stopPropagation();
    setSel(prev => prev === id ? null : id);
  };

  const displayInfo = useMemo(() => {
    if (sel && INFO[sel]) return INFO[sel];
    if (hypId !== "none") return { title: `${hyp.label}${hyp.sub ? ` — ${hyp.sub}` : ""}`, body: hyp.description };
    return { title: "HGF Model Structure", body: "Select a hypothesis to highlight pathways. Click any element to inspect it. Adjust sliders to change edge thickness — each slider maps to one parameter's magnitude." };
  }, [sel, hypId]);

  // Helper: node fill/stroke accounting for highlight + selection
  const nodeC = (id, base) => {
    if (hlN(id)) return C.hl;
    if (sel === id) return { ...base, stroke: "#2563EB" };
    return base;
  };
  const edgeColor = (id, def) => hlE(id) ? "#CC7700" : def;
  const paramC = id => hlP(id) ? C.hl : C.prm;

  const DirBadge = ({ x, y }) => hyp.direction ? (
    <text x={x} y={y} textAnchor="middle" fontSize={16} fontWeight={800} fill="#CC8800">
      {hyp.direction === "up" ? "↑" : "↓"}
    </text>
  ) : null;

  const ArrMarker = ({ id, color }) => (
    <marker id={id} markerWidth={8} markerHeight={6} refX={7} refY={3} orient="auto">
      <polygon points="0,0 8,3 0,6" fill={color} />
    </marker>
  );

  const ParamSq = ({ x, y, pid, label }) => {
    const cc = paramC(pid);
    return (
      <g onClick={e => handleSel(pid, e)} style={{ cursor: "pointer" }}>
        {sel === pid && <rect x={x-17} y={y-17} width={34} height={34} rx={6} fill="none" stroke="#2563EB" strokeWidth={1.5} strokeDasharray="4,2" opacity={0.65} />}
        <rect x={x-13} y={y-13} width={26} height={26} rx={3} fill={cc.fill} stroke={cc.stroke} strokeWidth={sel === pid ? 2.2 : 1.5} />
        <text x={x} y={y+1} textAnchor="middle" dominantBaseline="middle"
          fontFamily="Georgia, serif" fontSize={12} fontWeight={700} fill={cc.text}>{label}</text>
        {hlP(pid) && <DirBadge x={x+18} y={y-12} />}
      </g>
    );
  };

  return (
    <div style={{ display:"flex", minHeight:"100vh", fontFamily:"'Inter',system-ui,sans-serif", fontSize:13, background:"#F3F4F6" }}
      onClick={() => setSel(null)}>

      {/* ── Left sidebar ─────────────────────────────────────────────────── */}
      <div style={{ width:270, background:"#fff", borderRight:"1px solid #E5E7EB", padding:"20px 18px", overflowY:"auto", flexShrink:0 }}
        onClick={e => e.stopPropagation()}>

        <div style={{ fontWeight:800, fontSize:15, color:"#111827", marginBottom:2 }}>HGF Model Explorer</div>
        <div style={{ fontSize:11, color:"#9CA3AF", marginBottom:22, letterSpacing:0.3 }}>
          pick_best_cue · 3-cue PRL · psilocybin study
        </div>

        <Block title="MODEL">
          {[
            { id:"2level", label:"2-level HGF", note:"ω₂ only · no shared volatility" },
            { id:"3level", label:"3-level HGF", note:"ω₂ + ω₃ + κ · shared volatility" },
          ].map(m => (
            <label key={m.id} style={{ display:"flex", alignItems:"flex-start", gap:9, marginBottom:9, cursor:"pointer" }}>
              <input type="radio" checked={model===m.id} onChange={() => { setModel(m.id); setSel(null); }} style={{ marginTop:2 }} />
              <div>
                <div style={{ fontWeight: model===m.id ? 700 : 400, color: model===m.id ? "#111" : "#6B7280" }}>{m.label}</div>
                <div style={{ fontSize:10, color:"#9CA3AF", marginTop:1 }}>{m.note}</div>
              </div>
            </label>
          ))}
        </Block>

        <Block title="PARAMETERS  ↔  EDGE THICKNESS">
          <Slider label="ω₂" hint="tonic volatility"     val={omega2} min={-8}   max={0}   step={0.1}  fmt={v=>v.toFixed(1)}  hl={hlP("omega2")} onChange={setOmega2} />
          {is3 && <>
            <Slider label="ω₃" hint="meta-volatility"    val={omega3} min={-8}   max={0}   step={0.1}  fmt={v=>v.toFixed(1)}  hl={hlP("omega3")} onChange={setOmega3} />
            <Slider label="κ"  hint="vol. coupling"      val={kappa}  min={0}    max={2.5} step={0.05} fmt={v=>v.toFixed(2)}  hl={hlP("kappa")}  onChange={setKappa} />
          </>}
          <Slider label="β"  hint="inverse temperature"  val={beta}   min={0.2}  max={6}   step={0.1}  fmt={v=>v.toFixed(1)}  hl={hlP("beta")}   onChange={setBeta} />
          <Slider label="ζ"  hint="stickiness"           val={zeta}   min={-0.5} max={2.5} step={0.05} fmt={v=>v.toFixed(2)}  hl={hlP("zeta")}   onChange={setZeta} />
        </Block>

        <Block title="HYPOTHESES">
          {HYPS.filter(h => is3 || h.id !== "kappa_up").map(h => (
            <button key={h.id} onClick={() => { setHypId(h.id); setSel(null); }} style={{
              display:"block", width:"100%", textAlign:"left", padding:"8px 11px", marginBottom:5,
              borderRadius:7, border:`1.5px solid ${hypId===h.id ? h.color : "#E5E7EB"}`,
              background: hypId===h.id ? `${h.color}14` : "#FAFAFA",
              color: hypId===h.id ? h.color : "#374151",
              fontWeight: hypId===h.id ? 700 : 400, fontSize:12, cursor:"pointer",
            }}>
              <div>{h.label}</div>
              {h.sub && <div style={{ fontSize:10, opacity:0.75, marginTop:1 }}>{h.sub}</div>}
            </button>
          ))}
        </Block>

        <Block title="NOTATION">
          {[
            { shape:"hex",    c:C.l3,   txt:"Hidden state x₃ (volatility)" },
            { shape:"circle", c:C.l2,   txt:"Belief node μ₁ₖ" },
            { shape:"diam",   c:C.l1,   txt:"Observation uₖ (input)" },
            { shape:"sq",     c:C.prm,  txt:"Fixed parameter" },
          ].map((it,i) => (
            <div key={i} style={{ display:"flex", alignItems:"center", gap:8, marginBottom:5 }}>
              <svg width={20} height={20} viewBox="0 0 20 20">
                {it.shape==="hex"    && <polygon points={hexPts(10,10,8)} fill={it.c.fill} stroke={it.c.stroke} strokeWidth={1.5} />}
                {it.shape==="circle" && <circle cx={10} cy={10} r={8} fill={it.c.fill} stroke={it.c.stroke} strokeWidth={1.5} />}
                {it.shape==="diam"   && <polygon points={diamPts(10,10,9,8)} fill={it.c.fill} stroke={it.c.stroke} strokeWidth={1.5} />}
                {it.shape==="sq"     && <rect x={3} y={3} width={14} height={14} rx={2} fill={it.c.fill} stroke={it.c.stroke} strokeWidth={1.5} />}
              </svg>
              <span style={{ fontSize:11, color:"#6B7280" }}>{it.txt}</span>
            </div>
          ))}
          <div style={{ marginTop:6 }}>
            {[
              { dash:false, col:C.eVal, txt:"Value coupling (solid)" },
              { dash:true,  col:C.eVol, txt:"Volatility coupling (dashed)" },
              { dash:true,  col:C.eRsp, txt:"Belief → response (dashed)" },
            ].map((it,i) => (
              <div key={i} style={{ display:"flex", alignItems:"center", gap:8, marginBottom:5 }}>
                <svg width={22} height={10} viewBox="0 0 22 10">
                  <defs>
                    <marker id={`lm${i}`} markerWidth={6} markerHeight={5} refX={5} refY={2.5} orient="auto">
                      <polygon points="0,0 6,2.5 0,5" fill={it.col} />
                    </marker>
                  </defs>
                  <line x1={1} y1={5} x2={16} y2={5} stroke={it.col} strokeWidth={1.8}
                    strokeDasharray={it.dash ? "4,2" : "none"} markerEnd={`url(#lm${i})`} />
                </svg>
                <span style={{ fontSize:11, color:"#6B7280" }}>{it.txt}</span>
              </div>
            ))}
          </div>
        </Block>
      </div>

      {/* ── Right: diagram + info panel ──────────────────────────────────── */}
      <div style={{ flex:1, padding:24, display:"flex", flexDirection:"column", gap:14, overflowY:"auto" }}>

        {/* SVG */}
        <div style={{ background:"#fff", borderRadius:12, border:"1px solid #E5E7EB",
          padding:"18px 14px", boxShadow:"0 1px 4px rgba(0,0,0,0.06)" }}
          onClick={e => e.stopPropagation()}>

          <svg viewBox={`0 0 ${SW} ${SH}`} style={{ width:"100%", maxWidth:SW, display:"block", margin:"0 auto" }}>
            <defs>
              <ArrMarker id="av"   color={C.eVal} />
              <ArrMarker id="av2"  color="#0a3068" />
              <ArrMarker id="avo"  color={C.eVol} />
              <ArrMarker id="avo2" color="#CC7700" />
              <ArrMarker id="ap"   color={C.ePrm} />
              <ArrMarker id="ar"   color={C.eRsp} />
              <ArrMarker id="ar2"  color="#CC7700" />
            </defs>

            {/* ── LEVEL 3: Shared volatility ────────────────────────────── */}
            {is3 && (() => {
              const vx = COLS[1], vy = rowV;
              const nc = nodeC("vol", C.l3);
              return (
                <>
                  {/* Level label */}
                  <text x={18} y={vy+4} fontSize={9} fontWeight={700} fill={C.l3.stroke} opacity={0.65}>LEVEL 3</text>

                  {/* κ volatility coupling arrows: vol → each belief node */}
                  {COLS.map((bx, i) => {
                    const eid = `vc${i}`;
                    const hl  = hlE(eid);
                    const sel_e = sel === eid;
                    const [ex, ey] = retract(vx, vy, bx, rowB, 26);
                    const [sx, sy] = retract(bx, rowB, vx, vy, 33);
                    const col = edgeColor(eid, C.eVol);
                    const sw  = hl ? wVol + 1.5 : wVol;
                    const mid = [(sx+ex)/2, (sy+ey)/2];
                    return (
                      <g key={i} onClick={e => handleSel(eid, e)} style={{ cursor:"pointer" }}>
                        {/* fat invisible hit zone */}
                        <line x1={sx} y1={sy} x2={ex} y2={ey} stroke="transparent" strokeWidth={14} />
                        <line x1={sx} y1={sy} x2={ex} y2={ey}
                          stroke={col} strokeWidth={sw}
                          strokeDasharray={hl ? "none" : "8,4"}
                          markerEnd={hl ? "url(#avo2)" : "url(#avo)"}
                          opacity={0.88} />
                        {/* κ label */}
                        <text x={mid[0] + (i===0?-14: i===2?14:12)} y={mid[1]-8}
                          fontSize={10} fontWeight={hl?800:600} fill={col} fontFamily="Georgia,serif">κ</text>
                        {(hl||sel_e) && <DirBadge x={mid[0]+(i===0?-26:i===2?26:26)} y={mid[1]-4} />}
                      </g>
                    );
                  })}

                  {/* Volatility hex node */}
                  <g onClick={e => handleSel("vol", e)} style={{ cursor:"pointer" }}>
                    {(hlN("vol")||sel==="vol") && (
                      <polygon points={hexPts(vx, vy, 40)} fill="none"
                        stroke={hlN("vol") ? "#CC7700" : "#2563EB"}
                        strokeWidth={2} strokeDasharray={hlN("vol")?"none":"5,3"} opacity={0.55} />
                    )}
                    <polygon points={hexPts(vx, vy, 30)} fill={nc.fill} stroke={nc.stroke} strokeWidth={1.8} />
                    <text x={vx} y={vy-4} textAnchor="middle" dominantBaseline="middle"
                      fontFamily="Georgia,serif" fontSize={12} fontWeight={700} fill={nc.text}>μ₂</text>
                    <text x={vx} y={vy+10} textAnchor="middle" fontSize={9} fill={nc.text} opacity={0.75}>vol</text>
                    {hlN("vol") && <DirBadge x={vx+42} y={vy-18} />}
                  </g>

                  {/* ω₃ param square */}
                  <line x1={vx+58} y1={vy-10} x2={vx+36} y2={vy-4}
                    stroke={C.ePrm} strokeWidth={1.2} strokeDasharray="3,2" markerEnd="url(#ap)" />
                  <ParamSq x={vx+70} y={vy-14} pid="omega3" label="ω₃" />
                </>
              );
            })()}

            {/* ── LEVEL 2: Belief nodes ─────────────────────────────────── */}
            {(() => {
              const labels = ["μ₁_A","μ₁_B","μ₁_C"];
              return (
                <>
                  <text x={18} y={rowB+4} fontSize={9} fontWeight={700} fill={C.l2.stroke} opacity={0.65}>LEVEL 2</text>
                  {COLS.map((cx, i) => {
                    const bid = `b${i}`;
                    const nc  = nodeC(bid, C.l2);
                    return (
                      <g key={i}>
                        {/* ω₂ param square left of each belief node */}
                        <g onClick={e => handleSel("omega2", e)} style={{ cursor:"pointer" }}>
                          <line x1={cx-46} y1={rowB-4} x2={cx-30} y2={rowB}
                            stroke={C.ePrm} strokeWidth={1.2} strokeDasharray="3,2" markerEnd="url(#ap)" />
                          {i===0 && <ParamSq x={cx-58} y={rowB-12} pid="omega2" label="ω₂" />}
                        </g>

                        {/* Belief circle */}
                        <g onClick={e => handleSel(bid, e)} style={{ cursor:"pointer" }}>
                          {/* uncertainty ring (dashed) */}
                          <circle cx={cx} cy={rowB} r={31} fill="none"
                            stroke={nc.stroke} strokeWidth={1} strokeDasharray="5,3" opacity={0.3} />
                          {(hlN(bid)||sel===bid) && (
                            <circle cx={cx} cy={rowB} r={34} fill="none"
                              stroke={hlN(bid)?"#CC7700":"#2563EB"}
                              strokeWidth={2} strokeDasharray={hlN(bid)?"none":"5,3"} opacity={0.55} />
                          )}
                          <circle cx={cx} cy={rowB} r={24} fill={nc.fill} stroke={nc.stroke} strokeWidth={1.8} />
                          <text x={cx} y={rowB+1} textAnchor="middle" dominantBaseline="middle"
                            fontFamily="Georgia,serif" fontSize={11} fontWeight={700} fill={nc.text}>{labels[i]}</text>
                          {hlN(bid) && <DirBadge x={cx+32} y={rowB-21} />}
                        </g>
                      </g>
                    );
                  })}
                </>
              );
            })()}

            {/* ── Value coupling arrows: beliefs → inputs ───────────────── */}
            {COLS.map((cx, i) => {
              const eid = `val${i}`;
              const hl  = hlE(eid);
              const col = edgeColor(eid, C.eVal);
              const sw  = hl ? wVal+1.5 : wVal;
              const y1  = rowB+25, y2 = rowI-20;
              return (
                <g key={i} onClick={e => handleSel(eid, e)} style={{ cursor:"pointer" }}>
                  <line x1={cx} y1={y1} x2={cx} y2={y2} stroke="transparent" strokeWidth={14} />
                  <line x1={cx} y1={y1} x2={cx} y2={y2}
                    stroke={col} strokeWidth={sw} markerEnd={hl?"url(#av2)":"url(#av)"} opacity={0.88} />
                </g>
              );
            })}

            {/* ── LEVEL 1: Input nodes ──────────────────────────────────── */}
            {(() => {
              const iLabels = ["u_A","u_B","u_C"];
              const cues    = ["Cue A","Cue B","Cue C"];
              return (
                <>
                  <text x={18} y={rowI+4} fontSize={9} fontWeight={700} fill={C.l1.stroke} opacity={0.65}>LEVEL 1</text>
                  {COLS.map((cx, i) => {
                    const iid = `i${i}`;
                    const nc  = nodeC(iid, C.l1);
                    return (
                      <g key={i} onClick={e => handleSel(iid, e)} style={{ cursor:"pointer" }}>
                        {(sel===iid) && <polygon points={diamPts(cx,rowI,30,24)} fill="none" stroke="#2563EB" strokeWidth={1.5} strokeDasharray="4,2" opacity={0.55}/>}
                        <polygon points={diamPts(cx,rowI,24,19)} fill={nc.fill} stroke={nc.stroke} strokeWidth={1.8} />
                        <text x={cx} y={rowI+1} textAnchor="middle" dominantBaseline="middle"
                          fontFamily="Georgia,serif" fontSize={11} fontWeight={700} fill={nc.text}>{iLabels[i]}</text>
                        <text x={cx} y={rowI+31} textAnchor="middle" fontSize={10} fill="#9CA3AF">{cues[i]}</text>
                      </g>
                    );
                  })}
                </>
              );
            })()}

            {/* ── Separator ─────────────────────────────────────────────── */}
            <line x1={28} y1={sepY} x2={SW-28} y2={sepY} stroke="#D1D5DB" strokeWidth={1.5} strokeDasharray="9,5" />
            <text x={SW/2} y={sepY+13} textAnchor="middle" fontSize={9} fill="#9CA3AF" fontWeight={600} letterSpacing={1.5}>
              RESPONSE MODEL
            </text>

            {/* Belief → response arrows */}
            {COLS.map((cx, i) => {
              const eid = `re${i}`;
              const hl  = hlE(eid);
              const col = edgeColor(eid, C.eRsp);
              const sw  = hl ? wBeta+0.8 : 1.1;
              const destX = SW/2 + (i===0?-140 : i===2?140 : 0);
              const [ex, ey] = retract(cx, sepY+16, destX, respY-30, 4);
              return (
                <g key={i} onClick={e => handleSel(eid, e)} style={{ cursor:"pointer" }}>
                  <line x1={cx} y1={sepY+17} x2={ex} y2={ey} stroke="transparent" strokeWidth={12} />
                  <line x1={cx} y1={sepY+17} x2={ex} y2={ey}
                    stroke={col} strokeWidth={sw} strokeDasharray="5,3" opacity={0.45}
                    markerEnd={hl?"url(#ar2)":"url(#ar)"} />
                </g>
              );
            })}

            {/* ── Response model rounded-rect ────────────────────────────── */}
            {(() => {
              const ry  = respY;
              const nc  = nodeC("resp", C.resp);
              const bx  = 78, bw = SW-156;
              return (
                <g onClick={e => handleSel("resp", e)} style={{ cursor:"pointer" }}>
                  {(hlN("resp")||sel==="resp") && (
                    <rect x={bx-7} y={ry-38} width={bw+14} height={78} rx={13}
                      fill="none" stroke={hlN("resp")?"#CC7700":"#2563EB"}
                      strokeWidth={2} strokeDasharray={hlN("resp")?"none":"5,3"} opacity={0.55} />
                  )}
                  <rect x={bx} y={ry-32} width={bw} height={66} rx={10}
                    fill={nc.fill} stroke={nc.stroke} strokeWidth={1.8} />
                  <text x={SW/2} y={ry-10} textAnchor="middle"
                    fontFamily="Georgia,serif" fontSize={12} fontWeight={700} fill={nc.text}>
                    P(choose k) ∝ exp( β · μ₁ₖ + ζ · 𝟙[prev = k] )
                  </text>
                  <text x={SW/2} y={ry+8} textAnchor="middle" fontSize={10} fill={nc.text} opacity={0.7}>
                    softmax with stickiness
                  </text>
                  {hlN("resp") && <DirBadge x={bx+bw+20} y={ry-10} />}

                  {/* β square */}
                  <g onClick={e => handleSel("beta", e)} style={{ cursor:"pointer" }}>
                    <ParamSq x={SW/2-70} y={ry+26} pid="beta" label="β" />
                    <text x={SW/2-70} y={ry+46} textAnchor="middle" fontSize={9} fill={C.prm.text}>
                      {beta.toFixed(1)}
                    </text>
                  </g>
                  {/* ζ square */}
                  <g onClick={e => handleSel("zeta", e)} style={{ cursor:"pointer" }}>
                    <ParamSq x={SW/2+70} y={ry+26} pid="zeta" label="ζ" />
                    <text x={SW/2+70} y={ry+46} textAnchor="middle" fontSize={9} fill={C.prm.text}>
                      {zeta.toFixed(2)}
                    </text>
                  </g>
                </g>
              );
            })()}

          </svg>
        </div>

        {/* ── Info panel ──────────────────────────────────────────────────── */}
        <div style={{
          background:"#fff", borderRadius:10, padding:"14px 18px",
          border:`1.5px solid ${sel ? "#E5E7EB" : hypId!=="none" ? hyp.color : "#E5E7EB"}`,
          boxShadow:"0 1px 4px rgba(0,0,0,0.05)", minHeight:68,
        }}>
          <div style={{ fontWeight:700, fontSize:13, marginBottom:5,
            color: sel ? "#111827" : hypId!=="none" ? hyp.color : "#374151" }}>
            {displayInfo.title}
          </div>
          <div style={{ fontSize:12, color:"#4B5563", lineHeight:1.68 }}>
            {displayInfo.body}
          </div>
        </div>

      </div>
    </div>
  );
}

// ─── Helper components ────────────────────────────────────────────────────────
function Block({ title, children }) {
  return (
    <div style={{ marginBottom:20 }}>
      <div style={{ fontSize:9, fontWeight:800, letterSpacing:1.2, color:"#9CA3AF",
        textTransform:"uppercase", marginBottom:9 }}>{title}</div>
      {children}
    </div>
  );
}

function Slider({ label, hint, val, min, max, step, fmt, hl, onChange }) {
  return (
    <div style={{ marginBottom:12 }}>
      <div style={{ display:"flex", justifyContent:"space-between", alignItems:"baseline", marginBottom:3 }}>
        <div style={{ display:"flex", alignItems:"center", gap:5 }}>
          <span style={{ fontFamily:"Georgia,serif", fontWeight:700, fontSize:14,
            color: hl ? "#CC7700" : "#1F2937" }}>{label}</span>
          <span style={{ fontSize:10, color:"#9CA3AF" }}>{hint}</span>
        </div>
        <span style={{ fontSize:12, fontWeight: hl?700:500, color: hl?"#CC7700":"#374151" }}>{fmt(val)}</span>
      </div>
      <input type="range" min={min} max={max} step={step} value={val}
        onChange={e => onChange(parseFloat(e.target.value))}
        style={{ width:"100%", accentColor: hl?"#CC7700":"#185FA5" }} />
    </div>
  );
}
