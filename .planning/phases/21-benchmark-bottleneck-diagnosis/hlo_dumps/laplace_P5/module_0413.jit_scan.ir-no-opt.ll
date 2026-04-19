; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_63_0 = constant [64 x i8] zeroinitializer, align 128
@0 = private unnamed_addr constant [1 x i8] zeroinitializer
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@2 = private unnamed_addr constant [8 x i8] zeroinitializer
@3 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@4 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@5 = private unnamed_addr constant [8 x i8] zeroinitializer
@6 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@7 = private unnamed_addr constant [8 x i8] zeroinitializer
@8 = private unnamed_addr constant [4 x i8] zeroinitializer
@9 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@10 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@11 = private unnamed_addr constant [8 x i8] zeroinitializer
@12 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@13 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@14 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@15 = private unnamed_addr constant [8 x i8] zeroinitializer
@16 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@17 = private unnamed_addr constant [8 x i8] zeroinitializer
@18 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@19 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@20 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@21 = private unnamed_addr constant [8 x i8] zeroinitializer
@22 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@23 = private unnamed_addr constant [8 x i8] zeroinitializer
@24 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@25 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@26 = private unnamed_addr constant [8 x i8] zeroinitializer
@27 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@28 = private unnamed_addr constant [4 x i8] zeroinitializer
@29 = private unnamed_addr constant [8 x i8] zeroinitializer
@30 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@31 = private unnamed_addr constant [4 x i8] zeroinitializer
@32 = private unnamed_addr constant [8 x i8] zeroinitializer
@33 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@34 = private unnamed_addr constant [4 x i8] zeroinitializer
@35 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@36 = private unnamed_addr constant [8 x i8] zeroinitializer
@37 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@38 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@39 = private unnamed_addr constant [8 x i8] zeroinitializer
@40 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@41 = private unnamed_addr constant [8 x i8] zeroinitializer
@42 = private unnamed_addr constant [8 x i8] zeroinitializer
@43 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@44 = private unnamed_addr constant [1 x i8] zeroinitializer
@45 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@46 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@47 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@48 = private unnamed_addr constant [8 x i8] zeroinitializer
@49 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@50 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@51 = private unnamed_addr constant [8 x i8] zeroinitializer
@52 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@53 = private unnamed_addr constant [8 x i8] zeroinitializer
@54 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@55 = private unnamed_addr constant [8 x i8] zeroinitializer
@56 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@57 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@58 = private unnamed_addr constant [8 x i8] zeroinitializer
@59 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@60 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@61 = private unnamed_addr constant [8 x i8] zeroinitializer
@62 = private unnamed_addr constant [8 x i8] zeroinitializer
@63 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@64 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@65 = private unnamed_addr constant [8 x i8] zeroinitializer
@66 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@67 = private unnamed_addr constant [8 x i8] zeroinitializer
@68 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@69 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@70 = private unnamed_addr constant [8 x i8] zeroinitializer
@71 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@72 = private unnamed_addr constant [8 x i8] zeroinitializer
@73 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@74 = private unnamed_addr constant [8 x i8] zeroinitializer
@75 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@76 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@77 = private unnamed_addr constant [8 x i8] zeroinitializer
@78 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@79 = private unnamed_addr constant [8 x i8] zeroinitializer
@80 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@81 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@82 = private unnamed_addr constant [8 x i8] zeroinitializer
@83 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@84 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@85 = private unnamed_addr constant [8 x i8] zeroinitializer
@86 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@87 = private unnamed_addr constant [8 x i8] zeroinitializer
@88 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@89 = private unnamed_addr constant [8 x i8] zeroinitializer
@90 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@91 = private unnamed_addr constant [8 x i8] zeroinitializer
@92 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@93 = private unnamed_addr constant [8 x i8] zeroinitializer
@94 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@95 = private unnamed_addr constant [8 x i8] zeroinitializer
@96 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@97 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@98 = private unnamed_addr constant [8 x i8] zeroinitializer
@99 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@100 = private unnamed_addr constant [8 x i8] zeroinitializer
@101 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@102 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@103 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@104 = private unnamed_addr constant [8 x i8] zeroinitializer
@105 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@106 = private unnamed_addr constant [8 x i8] zeroinitializer
@107 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@108 = private unnamed_addr constant [8 x i8] zeroinitializer
@109 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@110 = private unnamed_addr constant [8 x i8] zeroinitializer
@111 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@112 = private unnamed_addr constant [8 x i8] zeroinitializer
@113 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@114 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@115 = private unnamed_addr constant [8 x i8] zeroinitializer
@116 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@117 = private unnamed_addr constant [8 x i8] zeroinitializer
@118 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@119 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@120 = private unnamed_addr constant [8 x i8] zeroinitializer
@121 = private unnamed_addr constant [8 x i8] zeroinitializer
@122 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@123 = private unnamed_addr constant [8 x i8] zeroinitializer
@124 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@125 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@126 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@127 = private unnamed_addr constant [8 x i8] zeroinitializer
@128 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@129 = private unnamed_addr constant [8 x i8] zeroinitializer
@130 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@131 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@132 = private unnamed_addr constant [8 x i8] zeroinitializer
@133 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@134 = private unnamed_addr constant [8 x i8] zeroinitializer
@135 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@136 = private unnamed_addr constant [8 x i8] zeroinitializer
@137 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@138 = private unnamed_addr constant [8 x i8] zeroinitializer
@139 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@140 = private unnamed_addr constant [8 x i8] zeroinitializer
@141 = private unnamed_addr constant [4 x i8] zeroinitializer
@142 = private unnamed_addr constant [8 x i8] zeroinitializer
@143 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@144 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@145 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@146 = private unnamed_addr constant [8 x i8] zeroinitializer
@147 = private unnamed_addr constant [4 x i8] zeroinitializer
@148 = private unnamed_addr constant [8 x i8] zeroinitializer
@149 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@150 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@151 = private unnamed_addr constant [8 x i8] zeroinitializer
@152 = private unnamed_addr constant [8 x i8] zeroinitializer
@153 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@154 = private unnamed_addr constant [8 x i8] zeroinitializer
@155 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@156 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@157 = private unnamed_addr constant [8 x i8] zeroinitializer
@158 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@159 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@160 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@161 = private unnamed_addr constant [8 x i8] zeroinitializer
@162 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@163 = private unnamed_addr constant [8 x i8] zeroinitializer
@164 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@165 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@166 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@167 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@168 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@169 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@170 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@171 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@172 = private unnamed_addr constant [8 x i8] zeroinitializer
@173 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@174 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@175 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@176 = private unnamed_addr constant [8 x i8] zeroinitializer
@177 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@178 = private unnamed_addr constant [8 x i8] zeroinitializer
@179 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@180 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@181 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@182 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@183 = private unnamed_addr constant [8 x i8] zeroinitializer
@184 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@185 = private unnamed_addr constant [8 x i8] zeroinitializer
@186 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@187 = private unnamed_addr constant [8 x i8] zeroinitializer
@188 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@189 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@190 = private unnamed_addr constant [8 x i8] zeroinitializer
@191 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@192 = private unnamed_addr constant [8 x i8] zeroinitializer
@193 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@194 = private unnamed_addr constant [8 x i8] zeroinitializer
@195 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@196 = private unnamed_addr constant [8 x i8] zeroinitializer
@197 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@198 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@199 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@200 = private unnamed_addr constant [8 x i8] zeroinitializer
@201 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@202 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@203 = private unnamed_addr constant [8 x i8] zeroinitializer
@204 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@205 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@206 = private unnamed_addr constant [8 x i8] zeroinitializer
@207 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@208 = private unnamed_addr constant [8 x i8] zeroinitializer
@209 = private unnamed_addr constant [4 x i8] zeroinitializer
@210 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10\C0"
@211 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@212 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@213 = private unnamed_addr constant [8 x i8] zeroinitializer
@214 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@215 = private unnamed_addr constant [8 x i8] zeroinitializer
@216 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@217 = private unnamed_addr constant [8 x i8] zeroinitializer
@218 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@219 = private unnamed_addr constant [8 x i8] zeroinitializer
@220 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@221 = private unnamed_addr constant [8 x i8] zeroinitializer
@222 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@223 = private unnamed_addr constant [8 x i8] zeroinitializer
@224 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@225 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@226 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@227 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@228 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@229 = private unnamed_addr constant [4 x i8] zeroinitializer
@230 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@231 = private unnamed_addr constant [8 x i8] zeroinitializer
@232 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@233 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@234 = private unnamed_addr constant [8 x i8] zeroinitializer
@235 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@236 = private unnamed_addr constant [8 x i8] zeroinitializer
@237 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@238 = private unnamed_addr constant [8 x i8] zeroinitializer
@239 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@240 = private unnamed_addr constant [8 x i8] zeroinitializer
@241 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@242 = private unnamed_addr constant [8 x i8] zeroinitializer
@243 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@244 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@245 = private unnamed_addr constant [8 x i8] zeroinitializer
@246 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@247 = private unnamed_addr constant [8 x i8] zeroinitializer
@248 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@249 = private unnamed_addr constant [8 x i8] zeroinitializer
@250 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@251 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@252 = private unnamed_addr constant [8 x i8] zeroinitializer
@253 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@254 = private unnamed_addr constant [8 x i8] zeroinitializer
@255 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@256 = private unnamed_addr constant [8 x i8] zeroinitializer
@257 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@258 = private unnamed_addr constant [8 x i8] zeroinitializer
@259 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@260 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@261 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@262 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"

define void @input_slice_fusion(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(768) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !180
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !181
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1536
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1536
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.768.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 4
  %10 = udiv i32 %8, 4
  %11 = udiv i32 %10, 192
  %constant_66_3 = load i8, ptr @0, align 1
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.768.2
  %12 = phi i32 [ 768, %concatenate.pivot.768.2 ]
  %13 = sub nsw i32 %3, %12
  %14 = mul nuw nsw i32 %13, 1
  %15 = add nuw nsw i32 0, %14
  %16 = urem i32 %15, 4
  %17 = udiv i32 %15, 4
  %18 = udiv i32 %17, 192
  %constant_66_31 = load i8, ptr @0, align 1
  br label %concatenate.merge

concatenate.pivot.768.:                           ; preds = %input_slice_fusion.in_bounds-true
  %19 = icmp ult i32 %3, 768
  br i1 %19, label %concatenate.pivot.0., label %concatenate.pivot.768.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id0

concatenate.pivot.768.2:                          ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %20 = phi i8 [ %constant_66_3, %concat_index_from_operand_id0 ], [ %constant_66_31, %concat_index_from_operand_id1 ]
  %21 = icmp sge i32 %3, 0
  %22 = icmp slt i32 %3, 768
  %23 = and i1 %21, %22
  br i1 %23, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %24 = icmp sge i32 %3, 768
  %25 = icmp slt i32 %3, 1536
  %26 = and i1 %24, %25
  br i1 %26, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %27 = sub i32 %3, 0
  %28 = getelementptr inbounds [768 x i8], ptr %arg0, i32 0, i32 %27
  store i8 %20, ptr %28, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %29 = sub i32 %3, 768
  %30 = getelementptr inbounds [768 x i8], ptr %arg1, i32 0, i32 %29
  store i8 %20, ptr %30, align 1
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @copy_fusion_14(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(768) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !180
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !181
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1536
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1536
  br i1 %4, label %copy_fusion.14.in_bounds-true, label %copy_fusion.14.in_bounds-after

copy_fusion.14.in_bounds-after:                   ; preds = %slice1-after, %entry
  ret void

copy_fusion.14.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.768.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 4
  %10 = udiv i32 %8, 4
  %11 = udiv i32 %10, 192
  %12 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i32 0, i32 %10, i32 %9, i32 0
  %13 = load i8, ptr %12, align 1, !invariant.load !182
  br label %concatenate.4.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.768.1
  %14 = phi i32 [ 768, %concatenate.pivot.768.1 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 4
  %19 = udiv i32 %17, 4
  %20 = udiv i32 %19, 192
  %21 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i32 0, i32 %19, i32 %18, i32 0
  %22 = load i8, ptr %21, align 1, !invariant.load !182
  br label %concatenate.4.merge

concatenate.pivot.768.:                           ; preds = %copy_fusion.14.in_bounds-true
  %23 = icmp ult i32 %3, 768
  br i1 %23, label %concatenate.pivot.0., label %concatenate.pivot.768.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id0

concatenate.pivot.768.1:                          ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id1

concatenate.4.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %24 = phi i8 [ %13, %concat_index_from_operand_id0 ], [ %22, %concat_index_from_operand_id1 ]
  %25 = icmp sge i32 %3, 0
  %26 = icmp slt i32 %3, 768
  %27 = and i1 %25, %26
  br i1 %27, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.4.merge
  %28 = icmp sge i32 %3, 768
  %29 = icmp slt i32 %3, 1536
  %30 = and i1 %28, %29
  br i1 %30, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %copy_fusion.14.in_bounds-after

slice0-true:                                      ; preds = %concatenate.4.merge
  %31 = sub i32 %3, 0
  %32 = getelementptr inbounds [768 x i8], ptr %arg1, i32 0, i32 %31
  store i8 %24, ptr %32, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %33 = sub i32 %3, 768
  %34 = getelementptr inbounds [768 x i8], ptr %arg2, i32 0, i32 %33
  store i8 %24, ptr %34, align 1
  br label %slice1-after
}

define void @input_slice_fusion_1(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(3072) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !183
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !181
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1024
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 960
  br i1 %4, label %input_slice_fusion.1.in_bounds-true, label %input_slice_fusion.1.in_bounds-after

input_slice_fusion.1.in_bounds-after:             ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.1.in_bounds-true:              ; preds = %entry
  br label %concatenate.pivot.192.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %constant_70_3 = load i32, ptr @1, align 4
  br label %concatenate.1.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.192.2
  %7 = phi i32 [ 192, %concatenate.pivot.192.2 ]
  %8 = sub nsw i32 %3, %7
  %9 = mul nuw nsw i32 %8, 1
  %10 = add nuw nsw i32 0, %9
  %11 = urem i32 %10, 4
  %12 = udiv i32 %10, 4
  %13 = udiv i32 %12, 192
  %constant_70_31 = load i32, ptr @1, align 4
  br label %concatenate.1.merge

concatenate.pivot.192.:                           ; preds = %input_slice_fusion.1.in_bounds-true
  %14 = icmp ult i32 %3, 192
  br i1 %14, label %concatenate.pivot.0., label %concatenate.pivot.192.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id0

concatenate.pivot.192.2:                          ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id1

concatenate.1.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %15 = phi i32 [ %constant_70_3, %concat_index_from_operand_id0 ], [ %constant_70_31, %concat_index_from_operand_id1 ]
  %16 = icmp sge i32 %3, 0
  %17 = icmp slt i32 %3, 192
  %18 = and i1 %16, %17
  br i1 %18, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.1.merge
  %19 = icmp sge i32 %3, 192
  %20 = icmp slt i32 %3, 960
  %21 = and i1 %19, %20
  br i1 %21, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.1.in_bounds-after

slice0-true:                                      ; preds = %concatenate.1.merge
  %22 = sub i32 %3, 0
  %23 = getelementptr inbounds [192 x i32], ptr %arg0, i32 0, i32 %22
  store i32 %15, ptr %23, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %24 = sub i32 %3, 192
  %25 = getelementptr inbounds [768 x i32], ptr %arg1, i32 0, i32 %24
  store i32 %15, ptr %25, align 4
  br label %slice1-after
}

define void @input_slice_fusion_2(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(147456) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !184
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !181
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 19456
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 19392
  br i1 %4, label %input_slice_fusion.2.in_bounds-true, label %input_slice_fusion.2.in_bounds-after

input_slice_fusion.2.in_bounds-after:             ; preds = %slice2-after, %entry
  ret void

input_slice_fusion.2.in_bounds-true:              ; preds = %entry
  br label %concatenate.pivot.192.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %constant_64_4 = load double, ptr @2, align 8
  br label %concatenate.2.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.192.3
  %7 = phi i32 [ 192, %concatenate.pivot.192.3 ]
  %8 = sub nsw i32 %3, %7
  %9 = mul nuw nsw i32 %8, 1
  %10 = add nuw nsw i32 0, %9
  %11 = urem i32 %10, 4
  %12 = udiv i32 %10, 4
  %13 = udiv i32 %12, 192
  %constant_64_41 = load double, ptr @2, align 8
  br label %concatenate.2.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.960.4
  %14 = phi i32 [ 960, %concatenate.pivot.960.4 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 4
  %19 = udiv i32 %17, 4
  %20 = urem i32 %19, 24
  %21 = udiv i32 %19, 24
  %22 = udiv i32 %21, 192
  %constant_64_42 = load double, ptr @2, align 8
  br label %concatenate.2.merge

concatenate.pivot.192.:                           ; preds = %input_slice_fusion.2.in_bounds-true
  %23 = icmp ult i32 %3, 192
  br i1 %23, label %concatenate.pivot.0., label %concatenate.pivot.960.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id0

concatenate.pivot.960.:                           ; preds = %concatenate.pivot.192.
  %24 = icmp ult i32 %3, 960
  br i1 %24, label %concatenate.pivot.192.3, label %concatenate.pivot.960.4

concatenate.pivot.192.3:                          ; preds = %concatenate.pivot.960.
  br label %concat_index_from_operand_id1

concatenate.pivot.960.4:                          ; preds = %concatenate.pivot.960.
  br label %concat_index_from_operand_id2

concatenate.2.merge:                              ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %25 = phi double [ %constant_64_4, %concat_index_from_operand_id0 ], [ %constant_64_41, %concat_index_from_operand_id1 ], [ %constant_64_42, %concat_index_from_operand_id2 ]
  %26 = icmp sge i32 %3, 0
  %27 = icmp slt i32 %3, 192
  %28 = and i1 %26, %27
  br i1 %28, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.2.merge
  %29 = icmp sge i32 %3, 192
  %30 = icmp slt i32 %3, 960
  %31 = and i1 %29, %30
  br i1 %31, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %32 = icmp sge i32 %3, 960
  %33 = icmp slt i32 %3, 19392
  %34 = and i1 %32, %33
  br i1 %34, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  br label %input_slice_fusion.2.in_bounds-after

slice0-true:                                      ; preds = %concatenate.2.merge
  %35 = sub i32 %3, 0
  %36 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %35
  store double %25, ptr %36, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %37 = sub i32 %3, 192
  %38 = getelementptr inbounds [768 x double], ptr %arg1, i32 0, i32 %37
  store double %25, ptr %38, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %39 = sub i32 %3, 960
  %40 = getelementptr inbounds [18432 x double], ptr %arg2, i32 0, i32 %39
  store double %25, ptr %40, align 8
  br label %slice2-after
}

define void @loop_compare_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !185
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_compare_fusion.in_bounds-true, label %loop_compare_fusion.in_bounds-after

loop_compare_fusion.in_bounds-after:              ; preds = %loop_compare_fusion.in_bounds-true, %entry
  ret void

loop_compare_fusion.in_bounds-true:               ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !182
  %constant_767_1 = load i64, ptr @3, align 8
  %5 = icmp slt i64 %4, %constant_767_1
  %6 = zext i1 %5 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.in_bounds-after
}

define void @loop_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !185
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_dynamic_slice_fusion.in_bounds-true, label %loop_dynamic_slice_fusion.in_bounds-after

loop_dynamic_slice_fusion.in_bounds-after:        ; preds = %loop_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.in_bounds-true:         ; preds = %entry
  %5 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_109 = load i64, ptr @5, align 8
  %6 = icmp slt i64 %5, %constant_770_109
  %7 = zext i1 %6 to i8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_4 = load i64, ptr @4, align 8
  %9 = add i64 %8, %constant_769_4
  %10 = load i64, ptr %arg1, align 8, !invariant.load !182
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.54.12.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.54.12.start_idx0, %3
  %18 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %17
  %19 = load double, ptr %18, align 8, !invariant.load !182
  %20 = getelementptr double, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %19, ptr %21, align 8
  br label %loop_dynamic_slice_fusion.in_bounds-after
}

define void @loop_convert_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(4) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !185
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_convert_dynamic_slice_fusion.in_bounds-true, label %loop_convert_dynamic_slice_fusion.in_bounds-after

loop_convert_dynamic_slice_fusion.in_bounds-after: ; preds = %loop_convert_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_convert_dynamic_slice_fusion.in_bounds-true: ; preds = %entry
  %5 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_110 = load i64, ptr @7, align 8
  %6 = icmp slt i64 %5, %constant_770_110
  %7 = zext i1 %6 to i8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_5 = load i64, ptr @6, align 8
  %9 = add i64 %8, %constant_769_5
  %10 = load i64, ptr %arg1, align 8, !invariant.load !182
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.55.6.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.55.6.start_idx0, %3
  %18 = getelementptr inbounds [192 x i32], ptr %arg0, i32 0, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !182
  %20 = insertvalue { i32, i32, double } undef, i32 %19, 0
  %21 = getelementptr i32, ptr @8, i32 %linear_index
  %constant_778_1_clone_1 = getelementptr inbounds i32, ptr %21, i32 0
  %constant_778_1_clone_11 = load i32, ptr %constant_778_1_clone_1, align 4
  %22 = icmp ne i32 %19, %constant_778_1_clone_11
  %23 = zext i1 %22 to i8
  %24 = zext i8 %23 to i32
  %25 = insertvalue { i32, i32, double } %20, i32 %24, 1
  %26 = trunc i64 %12 to i32
  %27 = icmp sge i32 0, %26
  %28 = select i1 %27, i32 0, i32 %26
  %29 = icmp sle i32 191, %28
  %dynamic-slice.55.6.start_idx02 = select i1 %29, i32 191, i32 %28
  %30 = add i32 %dynamic-slice.55.6.start_idx02, 0
  %31 = getelementptr inbounds [192 x i32], ptr %arg0, i32 0, i32 %30
  %32 = load i32, ptr %31, align 4, !invariant.load !182
  %33 = sitofp i32 %32 to double
  %34 = insertvalue { i32, i32, double } %25, double %33, 2
  %35 = extractvalue { i32, i32, double } %34, 0
  %36 = getelementptr i32, ptr %arg2, i32 %linear_index
  %37 = getelementptr inbounds i32, ptr %36, i32 0
  store i32 %35, ptr %37, align 4
  %38 = extractvalue { i32, i32, double } %34, 1
  %39 = getelementptr i32, ptr %arg3, i32 %linear_index
  %40 = getelementptr inbounds i32, ptr %39, i32 0
  store i32 %38, ptr %40, align 4
  %41 = extractvalue { i32, i32, double } %34, 2
  store double %41, ptr %arg4, align 8
  br label %loop_convert_dynamic_slice_fusion.in_bounds-after
}

define void @loop_divide_multiply_select_fusion(ptr noalias align 16 dereferenceable(32) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(32) %arg8, ptr noalias align 128 dereferenceable(32) %arg9, ptr noalias align 128 dereferenceable(32) %arg10, ptr noalias align 128 dereferenceable(32) %arg11, ptr noalias align 128 dereferenceable(32) %arg12, ptr noalias align 128 dereferenceable(32) %arg13, ptr noalias align 128 dereferenceable(32) %arg14, ptr noalias align 128 dereferenceable(32) %arg15) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_divide_multiply_select_fusion.in_bounds-true, label %loop_divide_multiply_select_fusion.in_bounds-after

loop_divide_multiply_select_fusion.in_bounds-after: ; preds = %loop_divide_multiply_select_fusion.in_bounds-true, %entry
  ret void

loop_divide_multiply_select_fusion.in_bounds-true: ; preds = %entry
  %constant_772_5 = load double, ptr @9, align 8
  %5 = getelementptr double, ptr %arg6, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !182
  %divide.857.1.clone.1 = fdiv double %constant_772_5, %7
  %8 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_770_123_clone_1 = load i64, ptr @11, align 8
  %9 = icmp slt i64 %8, %constant_770_123_clone_1
  %10 = zext i1 %9 to i8
  %11 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_769_119_clone_1 = load i64, ptr @10, align 8
  %12 = add i64 %11, %constant_769_119_clone_1
  %13 = load i64, ptr %arg5, align 8, !invariant.load !182
  %14 = trunc i8 %10 to i1
  %15 = select i1 %14, i64 %12, i64 %13
  %16 = trunc i64 %15 to i32
  %17 = icmp sge i32 0, %16
  %18 = select i1 %17, i32 0, i32 %16
  %19 = icmp sle i32 191, %18
  %dynamic-slice.54.54.clone.1.start_idx0 = select i1 %19, i32 191, i32 %18
  %20 = add i32 %dynamic-slice.54.54.clone.1.start_idx0, 0
  %21 = getelementptr inbounds [192 x double], ptr %arg4, i32 0, i32 %20
  %22 = load double, ptr %21, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg1, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !182
  %26 = getelementptr double, ptr %arg3, i32 %linear_index
  %27 = getelementptr inbounds double, ptr %26, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !182
  %29 = getelementptr double, ptr %arg2, i32 %linear_index
  %30 = getelementptr inbounds double, ptr %29, i32 0
  %31 = load double, ptr %30, align 8, !invariant.load !182
  %multiply.3502.27.clone.1 = fmul double %28, %31
  %add.1033.25.clone.1 = fadd double %25, %multiply.3502.27.clone.1
  %32 = call double @__nv_exp(double %add.1033.25.clone.1)
  %multiply.3503.9.clone.1 = fmul double %22, %32
  %constant_774_7_clone_1 = load double, ptr @12, align 8
  %compare.375.5.clone.1 = fcmp ogt double %multiply.3503.9.clone.1, %constant_774_7_clone_1
  %33 = zext i1 %compare.375.5.clone.1 to i8
  %34 = getelementptr double, ptr %arg0, i32 %linear_index
  %35 = getelementptr inbounds double, ptr %34, i32 0
  %36 = load double, ptr %35, align 8, !invariant.load !182
  %37 = trunc i8 %33 to i1
  %38 = select i1 %37, double %multiply.3503.9.clone.1, double %36
  %add.1034.2 = fadd double %divide.857.1.clone.1, %38
  %divide.858.1 = fdiv double %constant_772_5, %add.1034.2
  %39 = insertvalue { double, double, double, double, double, double } undef, double %divide.858.1, 0
  %40 = insertvalue { double, double, double, double, double, double } %39, double %38, 1
  %41 = insertvalue { double, double, double, double, double, double } %40, double %divide.857.1.clone.1, 2
  %42 = getelementptr double, ptr %arg6, i32 %linear_index
  %43 = getelementptr inbounds double, ptr %42, i32 0
  %44 = load double, ptr %43, align 8, !invariant.load !182
  %45 = getelementptr double, ptr %arg6, i32 %linear_index
  %46 = getelementptr inbounds double, ptr %45, i32 0
  %47 = load double, ptr %46, align 8, !invariant.load !182
  %multiply.3508.2.clone.1 = fmul double %44, %47
  %divide.860.1.clone.1 = fdiv double %constant_772_5, %multiply.3508.2.clone.1
  %48 = insertvalue { double, double, double, double, double, double } %41, double %divide.860.1.clone.1, 3
  %49 = getelementptr double, ptr %arg8, i32 %linear_index
  %50 = getelementptr inbounds double, ptr %49, i32 0
  %51 = load double, ptr %50, align 8, !invariant.load !182
  %52 = getelementptr double, ptr %arg9, i32 %linear_index
  %53 = getelementptr inbounds double, ptr %52, i32 0
  %54 = load double, ptr %53, align 8, !invariant.load !182
  %multiply.3498.7.clone.1.clone.1 = fmul double %51, %54
  %55 = getelementptr double, ptr %arg7, i32 %linear_index
  %56 = getelementptr inbounds double, ptr %55, i32 0
  %57 = load double, ptr %56, align 8, !invariant.load !182
  %multiply.3499.9.clone.1.clone.1 = fmul double %22, %57
  %add.1031.7.clone.1.clone.1 = fadd double %multiply.3498.7.clone.1.clone.1, %multiply.3499.9.clone.1.clone.1
  %58 = fneg double %add.1031.7.clone.1.clone.1
  %59 = call double @__nv_exp(double %58)
  %add.1032.1.clone.1.clone.1 = fadd double %59, %constant_772_5
  %divide.856.1.clone.1.clone.1 = fdiv double %constant_772_5, %add.1032.1.clone.1.clone.1
  %subtract.145.5.clone.1 = fsub double %constant_772_5, %divide.856.1.clone.1.clone.1
  %multiply.3500.1.clone.1 = fmul double %divide.856.1.clone.1.clone.1, %subtract.145.5.clone.1
  %60 = insertvalue { double, double, double, double, double, double } %48, double %multiply.3500.1.clone.1, 4
  %61 = insertvalue { double, double, double, double, double, double } %60, double %divide.856.1.clone.1.clone.1, 5
  %62 = extractvalue { double, double, double, double, double, double } %61, 0
  %63 = getelementptr double, ptr %arg10, i32 %linear_index
  %64 = getelementptr inbounds double, ptr %63, i32 0
  store double %62, ptr %64, align 8
  %65 = extractvalue { double, double, double, double, double, double } %61, 1
  %66 = getelementptr double, ptr %arg11, i32 %linear_index
  %67 = getelementptr inbounds double, ptr %66, i32 0
  store double %65, ptr %67, align 8
  %68 = extractvalue { double, double, double, double, double, double } %61, 2
  %69 = getelementptr double, ptr %arg12, i32 %linear_index
  %70 = getelementptr inbounds double, ptr %69, i32 0
  store double %68, ptr %70, align 8
  %71 = extractvalue { double, double, double, double, double, double } %61, 3
  %72 = getelementptr double, ptr %arg13, i32 %linear_index
  %73 = getelementptr inbounds double, ptr %72, i32 0
  store double %71, ptr %73, align 8
  %74 = extractvalue { double, double, double, double, double, double } %61, 4
  %75 = getelementptr double, ptr %arg14, i32 %linear_index
  %76 = getelementptr inbounds double, ptr %75, i32 0
  store double %74, ptr %76, align 8
  %77 = extractvalue { double, double, double, double, double, double } %61, 5
  %78 = getelementptr double, ptr %arg15, i32 %linear_index
  %79 = getelementptr inbounds double, ptr %78, i32 0
  store double %77, ptr %79, align 8
  br label %loop_divide_multiply_select_fusion.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_add_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(768) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !187
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %row_index = mul nuw nsw i32 %1, 1
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 96
  br i1 %6, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %7 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %row_index
  %8 = load double, ptr %7, align 8, !invariant.load !182
  %9 = getelementptr double, ptr %arg2, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !182
  %multiply.3504.19 = fmul double %8, %11
  %12 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %row_index
  %13 = load double, ptr %12, align 8, !invariant.load !182
  %multiply.3505.5 = fmul double %multiply.3504.19, %13
  %constant_772_26 = load double, ptr @13, align 8
  %14 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %row_index
  %15 = load double, ptr %14, align 8, !invariant.load !182
  %subtract.145.3 = fsub double %constant_772_26, %15
  %multiply.3506.1 = fmul double %multiply.3505.5, %subtract.145.3
  %16 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %row_index
  %17 = load double, ptr %16, align 8, !invariant.load !182
  %18 = fneg double %multiply.3505.5
  %multiply.3507.3 = fmul double %17, %18
  %add.1035.1 = fadd double %multiply.3506.1, %multiply.3507.3
  %19 = getelementptr double, ptr %arg4, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  store double %add.1035.1, ptr %20, align 8
  br label %loop_add_fusion.in_bounds-after
}

define void @loop_multiply_fusion_1(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(768) %arg7, ptr noalias align 128 dereferenceable(768) %arg8, ptr noalias align 16 dereferenceable(1536) %arg9, ptr noalias align 128 dereferenceable(8) %arg10, ptr noalias align 128 dereferenceable(768) %arg11) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %2 = mul nuw nsw i32 %0, 96
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 96
  br i1 %6, label %loop_multiply_fusion.1.in_bounds-true, label %loop_multiply_fusion.1.in_bounds-after

loop_multiply_fusion.1.in_bounds-after:           ; preds = %loop_multiply_fusion.1.in_bounds-true, %entry
  ret void

loop_multiply_fusion.1.in_bounds-true:            ; preds = %entry
  %7 = getelementptr double, ptr %arg1, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !182
  %10 = fneg double %9
  %11 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %4
  %12 = load double, ptr %11, align 8, !invariant.load !182
  %multiply.3509.9 = fmul double %10, %12
  %13 = load i64, ptr %arg10, align 8, !invariant.load !182
  %constant_770_122 = load i64, ptr @17, align 8
  %14 = icmp slt i64 %13, %constant_770_122
  %15 = zext i1 %14 to i8
  %16 = load i64, ptr %arg10, align 8, !invariant.load !182
  %constant_769_118 = load i64, ptr @16, align 8
  %17 = add i64 %16, %constant_769_118
  %18 = load i64, ptr %arg10, align 8, !invariant.load !182
  %19 = trunc i8 %15 to i1
  %20 = select i1 %19, i64 %17, i64 %18
  %21 = trunc i64 %20 to i32
  %22 = icmp sge i32 0, %21
  %23 = select i1 %22, i32 0, i32 %21
  %24 = icmp sle i32 191, %23
  %dynamic-slice.54.60.start_idx0 = select i1 %24, i32 191, i32 %23
  %25 = add i32 %dynamic-slice.54.60.start_idx0, 0
  %26 = getelementptr inbounds [192 x double], ptr %arg9, i32 0, i32 %25
  %27 = load double, ptr %26, align 8, !invariant.load !182
  %28 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %4
  %29 = load double, ptr %28, align 8, !invariant.load !182
  %30 = getelementptr inbounds [4 x [1 x double]], ptr %arg6, i32 0, i32 %4, i32 0
  %31 = load double, ptr %30, align 8, !invariant.load !182
  %32 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %4
  %33 = load double, ptr %32, align 8, !invariant.load !182
  %multiply.3502.33 = fmul double %31, %33
  %add.1033.31 = fadd double %29, %multiply.3502.33
  %34 = call double @__nv_exp(double %add.1033.31)
  %multiply.3503.15 = fmul double %27, %34
  %constant_774_10 = load double, ptr @18, align 8
  %compare.375.11 = fcmp ogt double %multiply.3503.15, %constant_774_10
  %35 = zext i1 %compare.375.11 to i8
  %36 = getelementptr double, ptr %arg7, i32 %linear_index
  %37 = getelementptr inbounds double, ptr %36, i32 0
  %38 = load double, ptr %37, align 8, !invariant.load !182
  %39 = getelementptr double, ptr %arg8, i32 %linear_index
  %40 = getelementptr inbounds double, ptr %39, i32 0
  %41 = load double, ptr %40, align 8, !invariant.load !182
  %multiply.3510.9 = fmul double %31, %41
  %add.1036.9 = fadd double %38, %multiply.3510.9
  %multiply.3511.9 = fmul double %add.1036.9, %34
  %multiply.3512.5 = fmul double %27, %multiply.3511.9
  %constant_776_16 = load double, ptr @15, align 8
  %42 = trunc i8 %35 to i1
  %43 = select i1 %42, double %multiply.3512.5, double %constant_776_16
  %add.1037.5 = fadd double %multiply.3509.9, %43
  %44 = fneg double %add.1037.5
  %constant_772_8 = load double, ptr @14, align 8
  %45 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %4
  %46 = load double, ptr %45, align 8, !invariant.load !182
  %47 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %4
  %48 = load double, ptr %47, align 8, !invariant.load !182
  %add.1034.10 = fadd double %46, %48
  %multiply.3513.8 = fmul double %add.1034.10, %add.1034.10
  %divide.861.5 = fdiv double %constant_772_8, %multiply.3513.8
  %multiply.3514.1 = fmul double %44, %divide.861.5
  %49 = getelementptr double, ptr %arg11, i32 %linear_index
  %50 = getelementptr inbounds double, ptr %49, i32 0
  store double %multiply.3514.1, ptr %50, align 8
  br label %loop_multiply_fusion.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_85(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(1536) %arg5) {
entry:
  %param_1.1480 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_38 = load i64, ptr @21, align 8
  %0 = icmp slt i64 %param_1.1480, %constant_770_38
  %1 = zext i1 %0 to i8
  %param_1.14801 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_20 = load i64, ptr @20, align 8
  %2 = add i64 %param_1.14801, %constant_769_20
  %param_1.14802 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14802
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_383 = load i64, ptr @21, align 8
  %9 = icmp sge i64 0, %constant_770_383
  %10 = select i1 %9, i64 0, i64 %constant_770_383
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2038.1.in_bounds-true, label %dynamic-update-slice.2038.1.in_bounds-after

dynamic-update-slice.2038.1.in_bounds-after:      ; preds = %dynamic-update-slice.2038.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2038.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_1.14804 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_385 = load i64, ptr @21, align 8
  %22 = icmp slt i64 %param_1.14804, %constant_770_385
  %23 = zext i1 %22 to i8
  %param_1.14806 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_207 = load i64, ptr @20, align 8
  %24 = add i64 %param_1.14806, %constant_769_207
  %param_1.14808 = load i64, ptr %arg1, align 8, !invariant.load !182
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_1.14808
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.54.56.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.54.56.start_idx0, 0
  %param_5.828 = getelementptr inbounds [192 x double], ptr %arg5, i64 0, i64 %30
  %param_5.8289 = load double, ptr %param_5.828, align 8, !invariant.load !182
  %31 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1346 = getelementptr inbounds double, ptr %31, i64 0
  %param_2.134610 = load double, ptr %param_2.1346, align 8, !invariant.load !182
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.943 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.94311 = load double, ptr %param_4.943, align 8, !invariant.load !182
  %33 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1143 = getelementptr inbounds double, ptr %33, i64 0
  %param_3.114312 = load double, ptr %param_3.1143, align 8, !invariant.load !182
  %multiply.3502.29 = fmul double %param_4.94311, %param_3.114312
  %add.1033.27 = fadd double %param_2.134610, %multiply.3502.29
  %34 = call double @__nv_exp(double %add.1033.27)
  %multiply.3503.11 = fmul double %param_5.8289, %34
  %constant_774_8 = load double, ptr @19, align 8
  %compare.375.7 = fcmp ogt double %multiply.3503.11, %constant_774_8
  %35 = zext i1 %compare.375.7 to i8
  %36 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %35, ptr %36, align 1
  br label %dynamic-update-slice.2038.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_48(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(32) %arg2) {
entry:
  %param_1.1481 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_39 = load i64, ptr @23, align 8
  %0 = icmp slt i64 %param_1.1481, %constant_770_39
  %1 = zext i1 %0 to i8
  %param_1.14811 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_65 = load i64, ptr @24, align 8
  %2 = add i64 %param_1.14811, %constant_769_65
  %param_1.14812 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14812
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_393 = load i64, ptr @23, align 8
  %9 = icmp sge i64 0, %constant_770_393
  %10 = select i1 %9, i64 0, i64 %constant_770_393
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_394 = load i64, ptr @23, align 8
  %13 = icmp sge i64 0, %constant_770_394
  %14 = select i1 %13, i64 0, i64 %constant_770_394
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 4
  %24 = udiv i64 %linear_index0, 4
  %25 = icmp ult i64 %linear_index, 4
  br i1 %25, label %dynamic-update-slice.2077.1.in_bounds-true, label %dynamic-update-slice.2077.1.in_bounds-after

dynamic-update-slice.2077.1.in_bounds-after:      ; preds = %dynamic-update-slice.2077.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2077.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i64, ptr %arg2, i64 %linear_index
  %param_2.1371 = getelementptr inbounds i64, ptr %29, i64 0
  %param_2.13715 = load i64, ptr %param_2.1371, align 8, !invariant.load !182
  %constant_770_396 = load i64, ptr @23, align 8
  %30 = icmp ne i64 %param_2.13715, %constant_770_396
  %31 = zext i1 %30 to i8
  %32 = zext i8 %31 to i32
  %constant_780_6 = load i32, ptr @22, align 4
  %33 = icmp eq i32 %32, %constant_780_6
  %34 = zext i1 %33 to i8
  %35 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %34, ptr %35, align 1
  br label %dynamic-update-slice.2077.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_49(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(32) %arg2) {
entry:
  %param_1.1497 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_55 = load i64, ptr @26, align 8
  %0 = icmp slt i64 %param_1.1497, %constant_770_55
  %1 = zext i1 %0 to i8
  %param_1.14971 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_64 = load i64, ptr @27, align 8
  %2 = add i64 %param_1.14971, %constant_769_64
  %param_1.14972 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14972
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_553 = load i64, ptr @26, align 8
  %9 = icmp sge i64 0, %constant_770_553
  %10 = select i1 %9, i64 0, i64 %constant_770_553
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2076.1.in_bounds-true, label %dynamic-update-slice.2076.1.in_bounds-after

dynamic-update-slice.2076.1.in_bounds-after:      ; preds = %dynamic-update-slice.2076.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2076.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg2, i64 %linear_index
  %param_2.1372 = getelementptr inbounds i64, ptr %22, i64 0
  %param_2.13724 = load i64, ptr %param_2.1372, align 8, !invariant.load !182
  %constant_770_555 = load i64, ptr @26, align 8
  %23 = icmp ne i64 %param_2.13724, %constant_770_555
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_780_7 = load i32, ptr @25, align 4
  %26 = icmp eq i32 %25, %constant_780_7
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.2076.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_51(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1373 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_89 = load i64, ptr @29, align 8
  %0 = icmp slt i64 %param_2.1373, %constant_770_89
  %1 = zext i1 %0 to i8
  %param_2.13731 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_59 = load i64, ptr @30, align 8
  %2 = add i64 %param_2.13731, %constant_769_59
  %param_2.13732 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13732
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_893 = load i64, ptr @29, align 8
  %9 = icmp sge i64 0, %constant_770_893
  %10 = select i1 %9, i64 0, i64 %constant_770_893
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_894 = load i64, ptr @29, align 8
  %13 = icmp sge i64 0, %constant_770_894
  %14 = select i1 %13, i64 0, i64 %constant_770_894
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 4
  %24 = udiv i64 %linear_index0, 4
  %25 = icmp ult i64 %linear_index, 4
  br i1 %25, label %dynamic-update-slice.2073.1.in_bounds-true, label %dynamic-update-slice.2073.1.in_bounds-after

dynamic-update-slice.2073.1.in_bounds-after:      ; preds = %dynamic-update-slice.2073.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2073.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1565 = getelementptr inbounds i64, ptr %29, i64 0
  %param_1.15655 = load i64, ptr %param_1.1565, align 8, !invariant.load !182
  %constant_770_896 = load i64, ptr @29, align 8
  %30 = icmp ne i64 %param_1.15655, %constant_770_896
  %31 = zext i1 %30 to i8
  %32 = zext i8 %31 to i32
  %constant_781_2 = load i32, ptr @28, align 4
  %33 = icmp eq i32 %32, %constant_781_2
  %34 = zext i1 %33 to i8
  %35 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %34, ptr %35, align 1
  br label %dynamic-update-slice.2073.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_52(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1374 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_10 = load i64, ptr @32, align 8
  %0 = icmp slt i64 %param_2.1374, %constant_770_10
  %1 = zext i1 %0 to i8
  %param_2.13741 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_58 = load i64, ptr @33, align 8
  %2 = add i64 %param_2.13741, %constant_769_58
  %param_2.13742 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13742
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_103 = load i64, ptr @32, align 8
  %9 = icmp sge i64 0, %constant_770_103
  %10 = select i1 %9, i64 0, i64 %constant_770_103
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2072.1.in_bounds-true, label %dynamic-update-slice.2072.1.in_bounds-after

dynamic-update-slice.2072.1.in_bounds-after:      ; preds = %dynamic-update-slice.2072.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2072.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1566 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.15664 = load i64, ptr %param_1.1566, align 8, !invariant.load !182
  %constant_770_105 = load i64, ptr @32, align 8
  %23 = icmp ne i64 %param_1.15664, %constant_770_105
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_781_4 = load i32, ptr @31, align 4
  %26 = icmp eq i32 %25, %constant_781_4
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.2072.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_101(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1360 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_112 = load i64, ptr @36, align 8
  %0 = icmp slt i64 %param_2.1360, %constant_770_112
  %1 = zext i1 %0 to i8
  %param_2.13601 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_32 = load i64, ptr @35, align 8
  %2 = add i64 %param_2.13601, %constant_769_32
  %param_2.13602 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13602
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !185
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.2048.1.in_bounds-true, label %dynamic-update-slice.2048.1.in_bounds-after

dynamic-update-slice.2048.1.in_bounds-after:      ; preds = %dynamic-update-slice.2048.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2048.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %param_2.13603 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_1124 = load i64, ptr @36, align 8
  %15 = icmp slt i64 %param_2.13603, %constant_770_1124
  %16 = zext i1 %15 to i8
  %param_2.13605 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_326 = load i64, ptr @35, align 8
  %17 = add i64 %param_2.13605, %constant_769_326
  %param_2.13607 = load i64, ptr %arg2, align 8, !invariant.load !182
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_2.13607
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.55.5.start_idx0 = select i1 %22, i64 191, i64 %21
  %23 = add i64 %dynamic-slice.55.5.start_idx0, %12
  %param_1.1558 = getelementptr inbounds [192 x i32], ptr %arg1, i64 0, i64 %23
  %param_1.15588 = load i32, ptr %param_1.1558, align 4, !invariant.load !182
  %24 = getelementptr i32, ptr @34, i64 %linear_index
  %constant_778_2 = getelementptr inbounds i32, ptr %24, i64 0
  %constant_778_29 = load i32, ptr %constant_778_2, align 4
  %25 = icmp ne i32 %param_1.15588, %constant_778_29
  %26 = zext i1 %25 to i8
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds [192 x i32], ptr %arg0, i64 0, i64 %14
  store i32 %27, ptr %28, align 4
  br label %dynamic-update-slice.2048.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_93(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(1536) %arg3) {
entry:
  %param_1.1462 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_20 = load i64, ptr @39, align 8
  %0 = icmp slt i64 %param_1.1462, %constant_770_20
  %1 = zext i1 %0 to i8
  %param_1.14621 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_11 = load i64, ptr @38, align 8
  %2 = add i64 %param_1.14621, %constant_769_11
  %param_1.14622 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14622
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_203 = load i64, ptr @39, align 8
  %9 = icmp sge i64 0, %constant_770_203
  %10 = select i1 %9, i64 0, i64 %constant_770_203
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2030.1.in_bounds-true, label %dynamic-update-slice.2030.1.in_bounds-after

dynamic-update-slice.2030.1.in_bounds-after:      ; preds = %dynamic-update-slice.2030.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2030.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_1.14624 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_205 = load i64, ptr @39, align 8
  %22 = icmp slt i64 %param_1.14624, %constant_770_205
  %23 = zext i1 %22 to i8
  %param_1.14626 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_117 = load i64, ptr @38, align 8
  %24 = add i64 %param_1.14626, %constant_769_117
  %param_1.14628 = load i64, ptr %arg1, align 8, !invariant.load !182
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_1.14628
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.54.100.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.54.100.start_idx0, 0
  %param_3.1144 = getelementptr inbounds [192 x double], ptr %arg3, i64 0, i64 %30
  %param_3.11449 = load double, ptr %param_3.1144, align 8, !invariant.load !182
  %31 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1347 = getelementptr inbounds double, ptr %31, i64 0
  %param_2.134710 = load double, ptr %param_2.1347, align 8, !invariant.load !182
  %32 = call double @__nv_exp(double %param_2.134710)
  %multiply.3524.35 = fmul double %param_3.11449, %32
  %constant_774_13 = load double, ptr @37, align 8
  %compare.377.7 = fcmp ogt double %multiply.3524.35, %constant_774_13
  %33 = zext i1 %compare.377.7 to i8
  %34 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %33, ptr %34, align 1
  br label %dynamic-update-slice.2030.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_78(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.854 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_111 = load i64, ptr @41, align 8
  %0 = icmp slt i64 %param_2.854, %constant_770_111
  %1 = zext i1 %0 to i8
  %param_2.8541 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_28 = load i64, ptr @40, align 8
  %2 = add i64 %param_2.8541, %constant_769_28
  %param_2.8542 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.8542
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !185
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.2045.1.in_bounds-true, label %dynamic-update-slice.2045.1.in_bounds-after

dynamic-update-slice.2045.1.in_bounds-after:      ; preds = %dynamic-update-slice.2045.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2045.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %param_1.1117 = load double, ptr %arg1, align 8, !invariant.load !182
  %15 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %param_1.1117, ptr %15, align 8
  br label %dynamic-update-slice.2045.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_53(ptr noalias align 128 dereferenceable(3072) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1240 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_6 = load i64, ptr @42, align 8
  %0 = icmp slt i64 %param_2.1240, %constant_770_6
  %1 = zext i1 %0 to i8
  %param_2.12401 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_57 = load i64, ptr @43, align 8
  %2 = add i64 %param_2.12401, %constant_769_57
  %param_2.12402 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12402
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_63 = load i64, ptr @42, align 8
  %9 = icmp sge i64 0, %constant_770_63
  %10 = select i1 %9, i64 0, i64 %constant_770_63
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2071.1.in_bounds-true, label %dynamic-update-slice.2071.1.in_bounds-after

dynamic-update-slice.2071.1.in_bounds-after:      ; preds = %dynamic-update-slice.2071.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2071.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1449 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.14494 = load i64, ptr %param_1.1449, align 8, !invariant.load !182
  %constant_770_65 = load i64, ptr @42, align 8
  %23 = icmp ne i64 %param_1.14494, %constant_770_65
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %26 = getelementptr inbounds [192 x [4 x i32]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i32 %25, ptr %26, align 4
  br label %dynamic-update-slice.2071.1.in_bounds-after
}

define void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(4) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %constant_737_1 = load i8, ptr @44, align 1
  %5 = getelementptr i8, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds i8, ptr %5, i32 0
  store i8 %constant_737_1, ptr %6, align 1
  br label %loop_broadcast_fusion.in_bounds-after
}

define void @loop_divide_exponential_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_divide_exponential_fusion.in_bounds-true, label %loop_divide_exponential_fusion.in_bounds-after

loop_divide_exponential_fusion.in_bounds-after:   ; preds = %loop_divide_exponential_fusion.in_bounds-true, %entry
  ret void

loop_divide_exponential_fusion.in_bounds-true:    ; preds = %entry
  %constant_49_2 = load double, ptr @45, align 8
  %5 = getelementptr double, ptr %arg1, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !182
  %divide.850.7 = fdiv double %constant_49_2, %7
  %8 = load double, ptr %arg0, align 8, !invariant.load !182
  %9 = getelementptr double, ptr %arg2, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !182
  %12 = getelementptr double, ptr %arg4, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !182
  %15 = getelementptr double, ptr %arg3, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !182
  %multiply.3478.5.clone.1 = fmul double %14, %17
  %add.1023.3.clone.1 = fadd double %11, %multiply.3478.5.clone.1
  %18 = call double @__nv_exp(double %add.1023.3.clone.1)
  %multiply.3479.5 = fmul double %8, %18
  %add.1024.5 = fadd double %divide.850.7, %multiply.3479.5
  %divide.851.1 = fdiv double %constant_49_2, %add.1024.5
  %19 = insertvalue { double, double, double, double } undef, double %divide.851.1, 0
  %20 = getelementptr double, ptr %arg1, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  %22 = load double, ptr %21, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg1, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !182
  %multiply.3480.2.clone.1 = fmul double %22, %25
  %divide.852.1.clone.1 = fdiv double %constant_49_2, %multiply.3480.2.clone.1
  %26 = insertvalue { double, double, double, double } %19, double %divide.852.1.clone.1, 1
  %multiply.3481.2.clone.1 = fmul double %add.1024.5, %add.1024.5
  %divide.853.1.clone.1 = fdiv double %constant_49_2, %multiply.3481.2.clone.1
  %27 = insertvalue { double, double, double, double } %26, double %divide.853.1.clone.1, 2
  %28 = insertvalue { double, double, double, double } %27, double %18, 3
  %29 = extractvalue { double, double, double, double } %28, 0
  %30 = getelementptr double, ptr %arg5, i32 %linear_index
  %31 = getelementptr inbounds double, ptr %30, i32 0
  store double %29, ptr %31, align 8
  %32 = extractvalue { double, double, double, double } %28, 1
  %33 = getelementptr double, ptr %arg6, i32 %linear_index
  %34 = getelementptr inbounds double, ptr %33, i32 0
  store double %32, ptr %34, align 8
  %35 = extractvalue { double, double, double, double } %28, 2
  %36 = getelementptr double, ptr %arg7, i32 %linear_index
  %37 = getelementptr inbounds double, ptr %36, i32 0
  store double %35, ptr %37, align 8
  %38 = extractvalue { double, double, double, double } %28, 3
  %39 = getelementptr double, ptr %arg8, i32 %linear_index
  %40 = getelementptr inbounds double, ptr %39, i32 0
  store double %38, ptr %40, align 8
  br label %loop_divide_exponential_fusion.in_bounds-after
}

define void @loop_multiply_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(768) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(768) %arg6, ptr noalias align 128 dereferenceable(768) %arg7, ptr noalias align 16 dereferenceable(32) %arg8, ptr noalias align 128 dereferenceable(768) %arg9, ptr noalias align 128 dereferenceable(768) %arg10, ptr noalias align 128 dereferenceable(768) %arg11, ptr noalias align 128 dereferenceable(768) %arg12) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %2 = mul nuw nsw i32 %0, 96
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 96
  br i1 %6, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %7 = getelementptr double, ptr %arg3, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !182
  %10 = fneg double %9
  %11 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %4
  %12 = load double, ptr %11, align 8, !invariant.load !182
  %multiply.3482.7 = fmul double %10, %12
  %13 = load double, ptr %arg1, align 8, !invariant.load !182
  %14 = getelementptr double, ptr %arg6, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !182
  %17 = getelementptr inbounds [4 x [1 x double]], ptr %arg8, i32 0, i32 %4, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !182
  %19 = getelementptr double, ptr %arg7, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  %21 = load double, ptr %20, align 8, !invariant.load !182
  %multiply.3483.1.clone.1 = fmul double %18, %21
  %add.1025.1.clone.1 = fadd double %16, %multiply.3483.1.clone.1
  %22 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %4
  %23 = load double, ptr %22, align 8, !invariant.load !182
  %multiply.3484.1.clone.1 = fmul double %add.1025.1.clone.1, %23
  %multiply.3485.5 = fmul double %13, %multiply.3484.1.clone.1
  %add.1026.5 = fadd double %multiply.3482.7, %multiply.3485.5
  %24 = fneg double %add.1026.5
  %25 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %4
  %26 = load double, ptr %25, align 8, !invariant.load !182
  %multiply.3486.1 = fmul double %24, %26
  %27 = insertvalue { double, double, double, double } undef, double %multiply.3486.1, 0
  %28 = getelementptr double, ptr %arg3, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  %30 = load double, ptr %29, align 8, !invariant.load !182
  %constant_49_3_clone_1 = load double, ptr @47, align 8
  %31 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %4
  %32 = load double, ptr %31, align 8, !invariant.load !182
  %33 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %4
  %34 = load double, ptr %33, align 8, !invariant.load !182
  %35 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %4
  %36 = load double, ptr %35, align 8, !invariant.load !182
  %multiply.3480.1.clone.1 = fmul double %34, %36
  %multiply.3487.1.clone.1 = fmul double %32, %multiply.3480.1.clone.1
  %divide.854.1.clone.1 = fdiv double %constant_49_3_clone_1, %multiply.3487.1.clone.1
  %constant_55_2_clone_1 = load double, ptr @46, align 8
  %multiply.3488.3.clone.1 = fmul double %divide.854.1.clone.1, %constant_55_2_clone_1
  %multiply.3489.1.clone.1 = fmul double %30, %multiply.3488.3.clone.1
  %37 = insertvalue { double, double, double, double } %27, double %multiply.3489.1.clone.1, 1
  %38 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %4
  %39 = load double, ptr %38, align 8, !invariant.load !182
  %divide.850.9.clone.1 = fdiv double %constant_49_3_clone_1, %39
  %40 = load double, ptr %arg1, align 8, !invariant.load !182
  %41 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %4
  %42 = load double, ptr %41, align 8, !invariant.load !182
  %multiply.3479.7.clone.1 = fmul double %40, %42
  %add.1024.7.clone.1 = fadd double %divide.850.9.clone.1, %multiply.3479.7.clone.1
  %multiply.3481.1.clone.1 = fmul double %add.1024.7.clone.1, %add.1024.7.clone.1
  %multiply.3490.1.clone.1 = fmul double %add.1024.7.clone.1, %multiply.3481.1.clone.1
  %divide.855.1.clone.1 = fdiv double %constant_49_3_clone_1, %multiply.3490.1.clone.1
  %multiply.3491.3.clone.1 = fmul double %divide.855.1.clone.1, %constant_55_2_clone_1
  %multiply.3492.1.clone.1 = fmul double %add.1026.5, %multiply.3491.3.clone.1
  %43 = insertvalue { double, double, double, double } %37, double %multiply.3492.1.clone.1, 2
  %44 = insertvalue { double, double, double, double } %43, double %multiply.3484.1.clone.1, 3
  %45 = extractvalue { double, double, double, double } %44, 0
  %46 = getelementptr double, ptr %arg9, i32 %linear_index
  %47 = getelementptr inbounds double, ptr %46, i32 0
  store double %45, ptr %47, align 8
  %48 = extractvalue { double, double, double, double } %44, 1
  %49 = getelementptr double, ptr %arg10, i32 %linear_index
  %50 = getelementptr inbounds double, ptr %49, i32 0
  store double %48, ptr %50, align 8
  %51 = extractvalue { double, double, double, double } %44, 2
  %52 = getelementptr double, ptr %arg11, i32 %linear_index
  %53 = getelementptr inbounds double, ptr %52, i32 0
  store double %51, ptr %53, align 8
  %54 = extractvalue { double, double, double, double } %44, 3
  %55 = getelementptr double, ptr %arg12, i32 %linear_index
  %56 = getelementptr inbounds double, ptr %55, i32 0
  store double %54, ptr %56, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

define void @wrapped_convert(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !185
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %wrapped_convert.in_bounds-true, label %wrapped_convert.in_bounds-after

wrapped_convert.in_bounds-after:                  ; preds = %wrapped_convert.in_bounds-true, %entry
  ret void

wrapped_convert.in_bounds-true:                   ; preds = %entry
  %4 = load i32, ptr %arg0, align 4, !invariant.load !182
  %5 = sitofp i32 %4 to double
  store double %5, ptr %arg1, align 8
  br label %wrapped_convert.in_bounds-after
}

define void @loop_broadcast_fusion_1(ptr noalias align 128 dereferenceable(32) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_broadcast_fusion.1.in_bounds-true, label %loop_broadcast_fusion.1.in_bounds-after

loop_broadcast_fusion.1.in_bounds-after:          ; preds = %loop_broadcast_fusion.1.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.1.in_bounds-true:           ; preds = %entry
  %constant_806_2 = load double, ptr @48, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_806_2, ptr %6, align 8
  br label %loop_broadcast_fusion.1.in_bounds-after
}

define void @loop_compare_multiply_select_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(4) %arg5, ptr noalias align 128 dereferenceable(32) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_compare_multiply_select_fusion.in_bounds-true, label %loop_compare_multiply_select_fusion.in_bounds-after

loop_compare_multiply_select_fusion.in_bounds-after: ; preds = %loop_compare_multiply_select_fusion.in_bounds-true, %entry
  ret void

loop_compare_multiply_select_fusion.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !182
  %8 = getelementptr double, ptr %arg3, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !182
  %11 = getelementptr double, ptr %arg3, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !182
  %multiply.3493.6.clone.1 = fmul double %10, %13
  %14 = getelementptr double, ptr %arg2, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !182
  %multiply.3494.9.clone.1 = fmul double %multiply.3493.6.clone.1, %16
  %17 = load double, ptr %arg1, align 8, !invariant.load !182
  %multiply.3495.7.clone.1 = fmul double %multiply.3494.9.clone.1, %17
  %add.1027.5.clone.1 = fadd double %7, %multiply.3495.7.clone.1
  %constant_60_1_clone_1 = load double, ptr @49, align 8
  %compare.372.1.clone.1 = fcmp ogt double %add.1027.5.clone.1, %constant_60_1_clone_1
  %18 = zext i1 %compare.372.1.clone.1 to i8
  %constant_61_1 = load double, ptr @50, align 8
  %19 = trunc i8 %18 to i1
  %20 = select i1 %19, double %add.1027.5.clone.1, double %constant_61_1
  %21 = insertvalue { double, i8, double } undef, double %20, 0
  %22 = insertvalue { double, i8, double } %21, i8 %18, 1
  %23 = insertvalue { double, i8, double } %22, double %multiply.3493.6.clone.1, 2
  %24 = extractvalue { double, i8, double } %23, 0
  %25 = getelementptr double, ptr %arg4, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  store double %24, ptr %26, align 8
  %27 = extractvalue { double, i8, double } %23, 1
  %28 = getelementptr i8, ptr %arg5, i32 %linear_index
  %29 = getelementptr inbounds i8, ptr %28, i32 0
  store i8 %27, ptr %29, align 1
  %30 = extractvalue { double, i8, double } %23, 2
  %31 = getelementptr double, ptr %arg6, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  store double %30, ptr %32, align 8
  br label %loop_compare_multiply_select_fusion.in_bounds-after
}

define void @loop_broadcast_select_fusion(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(768) %arg5, ptr noalias align 128 dereferenceable(768) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %2 = mul nuw nsw i32 %0, 96
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 96
  br i1 %6, label %loop_broadcast_select_fusion.in_bounds-true, label %loop_broadcast_select_fusion.in_bounds-after

loop_broadcast_select_fusion.in_bounds-after:     ; preds = %loop_broadcast_select_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_select_fusion.in_bounds-true:      ; preds = %entry
  %7 = getelementptr inbounds [4 x i8], ptr %arg0, i32 0, i32 %4
  %8 = load i8, ptr %7, align 1, !invariant.load !182
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !182
  %12 = getelementptr inbounds [4 x [1 x double]], ptr %arg4, i32 0, i32 %4, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !182
  %14 = getelementptr inbounds [4 x [1 x double]], ptr %arg4, i32 0, i32 %4, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !182
  %multiply.3493.8 = fmul double %13, %15
  %16 = getelementptr double, ptr %arg2, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !182
  %multiply.3496.1 = fmul double %multiply.3493.8, %18
  %19 = load double, ptr %arg3, align 8, !invariant.load !182
  %multiply.3497.1 = fmul double %multiply.3496.1, %19
  %add.1028.1 = fadd double %11, %multiply.3497.1
  %constant_806_1_clone_1 = load double, ptr @51, align 8
  %20 = trunc i8 %8 to i1
  %21 = select i1 %20, double %add.1028.1, double %constant_806_1_clone_1
  %22 = insertvalue { double, double } undef, double %21, 0
  %23 = insertvalue { double, double } %22, double %constant_806_1_clone_1, 1
  %24 = extractvalue { double, double } %23, 0
  %25 = getelementptr double, ptr %arg5, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  store double %24, ptr %26, align 8
  %27 = extractvalue { double, double } %23, 1
  %28 = getelementptr double, ptr %arg6, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  br label %loop_broadcast_select_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_70(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1304 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_71 = load i64, ptr @53, align 8
  %0 = icmp slt i64 %param_2.1304, %constant_770_71
  %1 = zext i1 %0 to i8
  %param_2.13041 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_38 = load i64, ptr @52, align 8
  %2 = add i64 %param_2.13041, %constant_769_38
  %param_2.13042 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13042
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_713 = load i64, ptr @53, align 8
  %9 = icmp sge i64 0, %constant_770_713
  %10 = select i1 %9, i64 0, i64 %constant_770_713
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2054.1.in_bounds-true, label %dynamic-update-slice.2054.1.in_bounds-after

dynamic-update-slice.2054.1.in_bounds-after:      ; preds = %dynamic-update-slice.2054.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2054.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i8, ptr %arg1, i64 %linear_index
  %param_1.1513 = getelementptr inbounds i8, ptr %22, i64 0
  %param_1.15134 = load i8, ptr %param_1.1513, align 1, !invariant.load !182
  %23 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %param_1.15134, ptr %23, align 1
  br label %dynamic-update-slice.2054.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_75(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1295 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_62 = load i64, ptr @55, align 8
  %0 = icmp slt i64 %param_2.1295, %constant_770_62
  %1 = zext i1 %0 to i8
  %param_2.12951 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_33 = load i64, ptr @54, align 8
  %2 = add i64 %param_2.12951, %constant_769_33
  %param_2.12952 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12952
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_623 = load i64, ptr @55, align 8
  %9 = icmp sge i64 0, %constant_770_623
  %10 = select i1 %9, i64 0, i64 %constant_770_623
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2049.1.in_bounds-true, label %dynamic-update-slice.2049.1.in_bounds-after

dynamic-update-slice.2049.1.in_bounds-after:      ; preds = %dynamic-update-slice.2049.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2049.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1504 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15044 = load double, ptr %param_1.1504, align 8, !invariant.load !182
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.15044, ptr %23, align 8
  br label %dynamic-update-slice.2049.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_82(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3) {
entry:
  %param_1.1488 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_46 = load i64, ptr @58, align 8
  %0 = icmp slt i64 %param_1.1488, %constant_770_46
  %1 = zext i1 %0 to i8
  %param_1.14881 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_24 = load i64, ptr @57, align 8
  %2 = add i64 %param_1.14881, %constant_769_24
  %param_1.14882 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14882
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_463 = load i64, ptr @58, align 8
  %9 = icmp sge i64 0, %constant_770_463
  %10 = select i1 %9, i64 0, i64 %constant_770_463
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2041.1.in_bounds-true, label %dynamic-update-slice.2041.1.in_bounds-after

dynamic-update-slice.2041.1.in_bounds-after:      ; preds = %dynamic-update-slice.2041.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2041.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_772_28 = load double, ptr @56, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1279 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.12794 = load double, ptr %param_2.1279, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1100 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11005 = load double, ptr %param_3.1100, align 8, !invariant.load !182
  %add.1034.8 = fadd double %param_2.12794, %param_3.11005
  %multiply.3513.6 = fmul double %add.1034.8, %add.1034.8
  %divide.861.3 = fdiv double %constant_772_28, %multiply.3513.6
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.861.3, ptr %24, align 8
  br label %dynamic-update-slice.2041.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_80(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1339 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_50 = load i64, ptr @61, align 8
  %0 = icmp slt i64 %param_2.1339, %constant_770_50
  %1 = zext i1 %0 to i8
  %param_2.13391 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_26 = load i64, ptr @60, align 8
  %2 = add i64 %param_2.13391, %constant_769_26
  %param_2.13392 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13392
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_503 = load i64, ptr @61, align 8
  %9 = icmp sge i64 0, %constant_770_503
  %10 = select i1 %9, i64 0, i64 %constant_770_503
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2043.1.in_bounds-true, label %dynamic-update-slice.2043.1.in_bounds-after

dynamic-update-slice.2043.1.in_bounds-after:      ; preds = %dynamic-update-slice.2043.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2043.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_772_4 = load double, ptr @59, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1492 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.14924 = load double, ptr %param_1.1492, align 8, !invariant.load !182
  %subtract.145.7 = fsub double %constant_772_4, %param_1.14924
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %subtract.145.7, ptr %23, align 8
  br label %dynamic-update-slice.2043.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_77(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(6144) %arg4) {
entry:
  %param_1.1499 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_57 = load i64, ptr @62, align 8
  %0 = icmp slt i64 %param_1.1499, %constant_770_57
  %1 = zext i1 %0 to i8
  %param_1.14991 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_30 = load i64, ptr @63, align 8
  %2 = add i64 %param_1.14991, %constant_769_30
  %param_1.14992 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14992
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_573 = load i64, ptr @62, align 8
  %9 = icmp sge i64 0, %constant_770_573
  %10 = select i1 %9, i64 0, i64 %constant_770_573
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2046.1.in_bounds-true, label %dynamic-update-slice.2046.1.in_bounds-after

dynamic-update-slice.2046.1.in_bounds-after:      ; preds = %dynamic-update-slice.2046.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2046.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_1.14994 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_575 = load i64, ptr @62, align 8
  %22 = icmp slt i64 %param_1.14994, %constant_770_575
  %23 = zext i1 %22 to i8
  %param_1.14996 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_307 = load i64, ptr @63, align 8
  %24 = add i64 %param_1.14996, %constant_769_307
  %param_1.14998 = load i64, ptr %arg1, align 8, !invariant.load !182
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_1.14998
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.56.8.start_idx0 = select i1 %29, i64 191, i64 %28
  %constant_770_579 = load i64, ptr @62, align 8
  %30 = icmp sge i64 0, %constant_770_579
  %31 = select i1 %30, i64 0, i64 %constant_770_579
  %32 = icmp sle i64 0, %31
  %dynamic-slice.56.8.start_idx1 = select i1 %32, i64 0, i64 %31
  %constant_770_5710 = load i64, ptr @62, align 8
  %33 = icmp sge i64 0, %constant_770_5710
  %34 = select i1 %33, i64 0, i64 %constant_770_5710
  %35 = icmp sle i64 0, %34
  %dynamic-slice.56.8.start_idx2 = select i1 %35, i64 0, i64 %34
  %36 = add i64 %dynamic-slice.56.8.start_idx0, 0
  %37 = add i64 %dynamic-slice.56.8.start_idx1, %17
  %38 = add i64 %dynamic-slice.56.8.start_idx2, 0
  %param_4.912 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg4, i64 0, i64 %36, i64 %37, i64 0
  %param_4.91211 = load double, ptr %param_4.912, align 8, !invariant.load !182
  %39 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1109 = getelementptr inbounds double, ptr %39, i64 0
  %param_3.110912 = load double, ptr %param_3.1109, align 8, !invariant.load !182
  %subtract.146.9 = fsub double %param_4.91211, %param_3.110912
  %param_2.1290 = load double, ptr %arg2, align 8, !invariant.load !182
  %multiply.3515.7 = fmul double %subtract.146.9, %param_2.1290
  %40 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3515.7, ptr %40, align 8
  br label %dynamic-update-slice.2046.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_67(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3) {
entry:
  %param_1.1519 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_77 = load i64, ptr @65, align 8
  %0 = icmp slt i64 %param_1.1519, %constant_770_77
  %1 = zext i1 %0 to i8
  %param_1.15191 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_41 = load i64, ptr @64, align 8
  %2 = add i64 %param_1.15191, %constant_769_41
  %param_1.15192 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15192
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_773 = load i64, ptr @65, align 8
  %9 = icmp sge i64 0, %constant_770_773
  %10 = select i1 %9, i64 0, i64 %constant_770_773
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2057.1.in_bounds-true, label %dynamic-update-slice.2057.1.in_bounds-after

dynamic-update-slice.2057.1.in_bounds-after:      ; preds = %dynamic-update-slice.2057.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2057.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1117 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.11174 = load double, ptr %param_3.1117, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1310 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.13105 = load double, ptr %param_2.1310, align 8, !invariant.load !182
  %multiply.3501.7 = fmul double %param_3.11174, %param_2.13105
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3501.7, ptr %24, align 8
  br label %dynamic-update-slice.2057.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_61(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.1126 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_770_92 = load i64, ptr @67, align 8
  %0 = icmp slt i64 %param_3.1126, %constant_770_92
  %1 = zext i1 %0 to i8
  %param_3.11261 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_769_49 = load i64, ptr @66, align 8
  %2 = add i64 %param_3.11261, %constant_769_49
  %param_3.11262 = load i64, ptr %arg3, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11262
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_923 = load i64, ptr @67, align 8
  %9 = icmp sge i64 0, %constant_770_923
  %10 = select i1 %9, i64 0, i64 %constant_770_923
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2063.1.in_bounds-true, label %dynamic-update-slice.2063.1.in_bounds-after

dynamic-update-slice.2063.1.in_bounds-after:      ; preds = %dynamic-update-slice.2063.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2063.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1534 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15344 = load double, ptr %param_1.1534, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1325 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.13255 = load double, ptr %param_2.1325, align 8, !invariant.load !182
  %multiply.3518.5 = fmul double %param_1.15344, %param_2.13255
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3518.5, ptr %24, align 8
  br label %dynamic-update-slice.2063.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_43(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(32) %arg4) {
entry:
  %param_3.1116 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_770_68 = load i64, ptr @70, align 8
  %0 = icmp slt i64 %param_3.1116, %constant_770_68
  %1 = zext i1 %0 to i8
  %param_3.11161 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_769_74 = load i64, ptr @69, align 8
  %2 = add i64 %param_3.11161, %constant_769_74
  %param_3.11162 = load i64, ptr %arg3, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11162
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_683 = load i64, ptr @70, align 8
  %9 = icmp sge i64 0, %constant_770_683
  %10 = select i1 %9, i64 0, i64 %constant_770_683
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2082.1.in_bounds-true, label %dynamic-update-slice.2082.1.in_bounds-after

dynamic-update-slice.2082.1.in_bounds-after:      ; preds = %dynamic-update-slice.2082.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2082.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.983 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.9834 = load double, ptr %param_4.983, align 8, !invariant.load !182
  %multiply.3533.7 = fmul double %param_4.9834, %param_4.9834
  %constant_782_7 = load double, ptr @68, align 8
  %multiply.3534.5 = fmul double %multiply.3533.7, %constant_782_7
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1510 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.15105 = load double, ptr %param_1.1510, align 8, !invariant.load !182
  %24 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1301 = getelementptr inbounds double, ptr %24, i64 0
  %param_2.13016 = load double, ptr %param_2.1301, align 8, !invariant.load !182
  %multiply.3518.3 = fmul double %param_1.15105, %param_2.13016
  %multiply.3535.3 = fmul double %multiply.3534.5, %multiply.3518.3
  %25 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3535.3, ptr %25, align 8
  br label %dynamic-update-slice.2082.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_46(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4) {
entry:
  %param_1.1489 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_47 = load i64, ptr @72, align 8
  %0 = icmp slt i64 %param_1.1489, %constant_770_47
  %1 = zext i1 %0 to i8
  %param_1.14891 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_71 = load i64, ptr @71, align 8
  %2 = add i64 %param_1.14891, %constant_769_71
  %param_1.14892 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14892
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_473 = load i64, ptr @72, align 8
  %9 = icmp sge i64 0, %constant_770_473
  %10 = select i1 %9, i64 0, i64 %constant_770_473
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2079.1.in_bounds-true, label %dynamic-update-slice.2079.1.in_bounds-after

dynamic-update-slice.2079.1.in_bounds-after:      ; preds = %dynamic-update-slice.2079.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2079.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.907 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.9074 = load double, ptr %param_4.907, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1280 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.12805 = load double, ptr %param_2.1280, align 8, !invariant.load !182
  %24 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1101 = getelementptr inbounds double, ptr %24, i64 0
  %param_3.11016 = load double, ptr %param_3.1101, align 8, !invariant.load !182
  %multiply.3518.32 = fmul double %param_2.12805, %param_3.11016
  %multiply.3525.15 = fmul double %param_4.9074, %multiply.3518.32
  %multiply.3530.1 = fmul double %multiply.3525.15, %multiply.3525.15
  %25 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3530.1, ptr %25, align 8
  br label %dynamic-update-slice.2079.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_58(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4) {
entry:
  %param_1.1540 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_98 = load i64, ptr @74, align 8
  %0 = icmp slt i64 %param_1.1540, %constant_770_98
  %1 = zext i1 %0 to i8
  %param_1.15401 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_52 = load i64, ptr @73, align 8
  %2 = add i64 %param_1.15401, %constant_769_52
  %param_1.15402 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15402
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_983 = load i64, ptr @74, align 8
  %9 = icmp sge i64 0, %constant_770_983
  %10 = select i1 %9, i64 0, i64 %constant_770_983
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2066.1.in_bounds-true, label %dynamic-update-slice.2066.1.in_bounds-after

dynamic-update-slice.2066.1.in_bounds-after:      ; preds = %dynamic-update-slice.2066.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2066.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.927 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.9274 = load double, ptr %param_4.927, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1331 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.13315 = load double, ptr %param_2.1331, align 8, !invariant.load !182
  %24 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1129 = getelementptr inbounds double, ptr %24, i64 0
  %param_3.11296 = load double, ptr %param_3.1129, align 8, !invariant.load !182
  %multiply.3518.28 = fmul double %param_2.13315, %param_3.11296
  %multiply.3525.11 = fmul double %param_4.9274, %multiply.3518.28
  %25 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3525.11, ptr %25, align 8
  br label %dynamic-update-slice.2066.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_47(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4) {
entry:
  %param_1.1561 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_23 = load i64, ptr @77, align 8
  %0 = icmp slt i64 %param_1.1561, %constant_770_23
  %1 = zext i1 %0 to i8
  %param_1.15611 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_68 = load i64, ptr @76, align 8
  %2 = add i64 %param_1.15611, %constant_769_68
  %param_1.15612 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15612
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_233 = load i64, ptr @77, align 8
  %9 = icmp sge i64 0, %constant_770_233
  %10 = select i1 %9, i64 0, i64 %constant_770_233
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2078.1.in_bounds-true, label %dynamic-update-slice.2078.1.in_bounds-after

dynamic-update-slice.2078.1.in_bounds-after:      ; preds = %dynamic-update-slice.2078.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2078.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.970 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.9704 = load double, ptr %param_4.970, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1365 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.13655 = load double, ptr %param_2.1365, align 8, !invariant.load !182
  %24 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1171 = getelementptr inbounds double, ptr %24, i64 0
  %param_3.11716 = load double, ptr %param_3.1171, align 8, !invariant.load !182
  %multiply.3518.30 = fmul double %param_2.13655, %param_3.11716
  %multiply.3525.13 = fmul double %param_4.9704, %multiply.3518.30
  %constant_779_9 = load double, ptr @75, align 8
  %multiply.3582.3 = fmul double %multiply.3525.13, %constant_779_9
  %25 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3582.3, ptr %25, align 8
  br label %dynamic-update-slice.2078.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_86(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.900 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_770_36 = load i64, ptr @79, align 8
  %0 = icmp slt i64 %param_4.900, %constant_770_36
  %1 = zext i1 %0 to i8
  %param_4.9001 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_769_19 = load i64, ptr @78, align 8
  %2 = add i64 %param_4.9001, %constant_769_19
  %param_4.9002 = load i64, ptr %arg4, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.9002
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_363 = load i64, ptr @79, align 8
  %9 = icmp sge i64 0, %constant_770_363
  %10 = select i1 %9, i64 0, i64 %constant_770_363
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2037.1.in_bounds-true, label %dynamic-update-slice.2037.1.in_bounds-after

dynamic-update-slice.2037.1.in_bounds-after:      ; preds = %dynamic-update-slice.2037.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2037.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1478 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.14784 = load double, ptr %param_1.1478, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1092 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.10925 = load double, ptr %param_3.1092, align 8, !invariant.load !182
  %24 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1269 = getelementptr inbounds double, ptr %24, i64 0
  %param_2.12696 = load double, ptr %param_2.1269, align 8, !invariant.load !182
  %multiply.3502.11 = fmul double %param_3.10925, %param_2.12696
  %add.1033.9 = fadd double %param_1.14784, %multiply.3502.11
  %25 = call double @__nv_exp(double %add.1033.9)
  %26 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %25, ptr %26, align 8
  br label %dynamic-update-slice.2037.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_44(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(32) %arg2) {
entry:
  %param_1.1503 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_61 = load i64, ptr @82, align 8
  %0 = icmp slt i64 %param_1.1503, %constant_770_61
  %1 = zext i1 %0 to i8
  %param_1.15031 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_73 = load i64, ptr @81, align 8
  %2 = add i64 %param_1.15031, %constant_769_73
  %param_1.15032 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15032
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_613 = load i64, ptr @82, align 8
  %9 = icmp sge i64 0, %constant_770_613
  %10 = select i1 %9, i64 0, i64 %constant_770_613
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2081.1.in_bounds-true, label %dynamic-update-slice.2081.1.in_bounds-after

dynamic-update-slice.2081.1.in_bounds-after:      ; preds = %dynamic-update-slice.2081.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2081.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1377 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.13774 = load double, ptr %param_2.1377, align 8, !invariant.load !182
  %multiply.3533.9 = fmul double %param_2.13774, %param_2.13774
  %constant_782_5 = load double, ptr @80, align 8
  %multiply.3534.7 = fmul double %multiply.3533.9, %constant_782_5
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3534.7, ptr %23, align 8
  br label %dynamic-update-slice.2081.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_45(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1369 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_54 = load i64, ptr @85, align 8
  %0 = icmp slt i64 %param_2.1369, %constant_770_54
  %1 = zext i1 %0 to i8
  %param_2.13691 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_72 = load i64, ptr @84, align 8
  %2 = add i64 %param_2.13691, %constant_769_72
  %param_2.13692 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13692
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_543 = load i64, ptr @85, align 8
  %9 = icmp sge i64 0, %constant_770_543
  %10 = select i1 %9, i64 0, i64 %constant_770_543
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2080.1.in_bounds-true, label %dynamic-update-slice.2080.1.in_bounds-after

dynamic-update-slice.2080.1.in_bounds-after:      ; preds = %dynamic-update-slice.2080.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2080.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1564 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15644 = load double, ptr %param_1.1564, align 8, !invariant.load !182
  %constant_779_15 = load double, ptr @83, align 8
  %multiply.3587.3 = fmul double %param_1.15644, %constant_779_15
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3587.3, ptr %23, align 8
  br label %dynamic-update-slice.2080.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_100(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(1536) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1264 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_31 = load i64, ptr @87, align 8
  %0 = icmp slt i64 %param_2.1264, %constant_770_31
  %1 = zext i1 %0 to i8
  %param_2.12641 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_61 = load i64, ptr @86, align 8
  %2 = add i64 %param_2.12641, %constant_769_61
  %param_2.12642 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12642
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_313 = load i64, ptr @87, align 8
  %9 = icmp sge i64 0, %constant_770_313
  %10 = select i1 %9, i64 0, i64 %constant_770_313
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2074.1.in_bounds-true, label %dynamic-update-slice.2074.1.in_bounds-after

dynamic-update-slice.2074.1.in_bounds-after:      ; preds = %dynamic-update-slice.2074.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2074.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_2.12644 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_315 = load i64, ptr @87, align 8
  %22 = icmp slt i64 %param_2.12644, %constant_770_315
  %23 = zext i1 %22 to i8
  %param_2.12646 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_617 = load i64, ptr @86, align 8
  %24 = add i64 %param_2.12646, %constant_769_617
  %param_2.12648 = load i64, ptr %arg2, align 8, !invariant.load !182
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_2.12648
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.54.3.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.54.3.start_idx0, 0
  %param_1.1473 = getelementptr inbounds [192 x double], ptr %arg1, i64 0, i64 %30
  %param_1.14739 = load double, ptr %param_1.1473, align 8, !invariant.load !182
  %31 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.14739, ptr %31, align 8
  br label %dynamic-update-slice.2074.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_54(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1238 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_4 = load i64, ptr @89, align 8
  %0 = icmp slt i64 %param_2.1238, %constant_770_4
  %1 = zext i1 %0 to i8
  %param_2.12381 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_56 = load i64, ptr @88, align 8
  %2 = add i64 %param_2.12381, %constant_769_56
  %param_2.12382 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12382
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_43 = load i64, ptr @89, align 8
  %9 = icmp sge i64 0, %constant_770_43
  %10 = select i1 %9, i64 0, i64 %constant_770_43
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2070.1.in_bounds-true, label %dynamic-update-slice.2070.1.in_bounds-after

dynamic-update-slice.2070.1.in_bounds-after:      ; preds = %dynamic-update-slice.2070.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2070.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1447 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.14474 = load i64, ptr %param_1.1447, align 8, !invariant.load !182
  %23 = sitofp i64 %param_1.14474 to double
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.2070.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_60(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1327 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_94 = load i64, ptr @91, align 8
  %0 = icmp slt i64 %param_2.1327, %constant_770_94
  %1 = zext i1 %0 to i8
  %param_2.13271 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_50 = load i64, ptr @90, align 8
  %2 = add i64 %param_2.13271, %constant_769_50
  %param_2.13272 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13272
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_943 = load i64, ptr @91, align 8
  %9 = icmp sge i64 0, %constant_770_943
  %10 = select i1 %9, i64 0, i64 %constant_770_943
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2064.1.in_bounds-true, label %dynamic-update-slice.2064.1.in_bounds-after

dynamic-update-slice.2064.1.in_bounds-after:      ; preds = %dynamic-update-slice.2064.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2064.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1536 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15364 = load double, ptr %param_1.1536, align 8, !invariant.load !182
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.15364, ptr %23, align 8
  br label %dynamic-update-slice.2064.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_88(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1265 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_32 = load i64, ptr @93, align 8
  %0 = icmp slt i64 %param_2.1265, %constant_770_32
  %1 = zext i1 %0 to i8
  %param_2.12651 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_17 = load i64, ptr @92, align 8
  %2 = add i64 %param_2.12651, %constant_769_17
  %param_2.12652 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12652
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_323 = load i64, ptr @93, align 8
  %9 = icmp sge i64 0, %constant_770_323
  %10 = select i1 %9, i64 0, i64 %constant_770_323
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2035.1.in_bounds-true, label %dynamic-update-slice.2035.1.in_bounds-after

dynamic-update-slice.2035.1.in_bounds-after:      ; preds = %dynamic-update-slice.2035.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2035.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1474 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.14744 = load double, ptr %param_1.1474, align 8, !invariant.load !182
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.14744, ptr %23, align 8
  br label %dynamic-update-slice.2035.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_91(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4) {
entry:
  %param_1.1466 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_24 = load i64, ptr @95, align 8
  %0 = icmp slt i64 %param_1.1466, %constant_770_24
  %1 = zext i1 %0 to i8
  %param_1.14661 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_13 = load i64, ptr @94, align 8
  %2 = add i64 %param_1.14661, %constant_769_13
  %param_1.14662 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14662
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_243 = load i64, ptr @95, align 8
  %9 = icmp sge i64 0, %constant_770_243
  %10 = select i1 %9, i64 0, i64 %constant_770_243
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2032.1.in_bounds-true, label %dynamic-update-slice.2032.1.in_bounds-after

dynamic-update-slice.2032.1.in_bounds-after:      ; preds = %dynamic-update-slice.2032.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2032.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_1.14664 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_245 = load i64, ptr @95, align 8
  %22 = icmp slt i64 %param_1.14664, %constant_770_245
  %23 = zext i1 %22 to i8
  %param_1.14666 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_137 = load i64, ptr @94, align 8
  %24 = add i64 %param_1.14666, %constant_769_137
  %param_1.14668 = load i64, ptr %arg1, align 8, !invariant.load !182
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_1.14668
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.54.110.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.54.110.start_idx0, 0
  %param_4.895 = getelementptr inbounds [192 x double], ptr %arg4, i64 0, i64 %30
  %param_4.8959 = load double, ptr %param_4.895, align 8, !invariant.load !182
  %31 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1087 = getelementptr inbounds double, ptr %31, i64 0
  %param_3.108710 = load double, ptr %param_3.1087, align 8, !invariant.load !182
  %32 = call double @__nv_exp(double %param_3.108710)
  %multiply.3524.45 = fmul double %param_4.8959, %32
  %constant_774_18 = load double, ptr @96, align 8
  %compare.377.17 = fcmp ogt double %multiply.3524.45, %constant_774_18
  %33 = zext i1 %compare.377.17 to i8
  %34 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1257 = getelementptr inbounds double, ptr %34, i64 0
  %param_2.125711 = load double, ptr %param_2.1257, align 8, !invariant.load !182
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %multiply.3524.45, double %param_2.125711
  %37 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %36, ptr %37, align 8
  br label %dynamic-update-slice.2032.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_94(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1251 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_18 = load i64, ptr @98, align 8
  %0 = icmp slt i64 %param_2.1251, %constant_770_18
  %1 = zext i1 %0 to i8
  %param_2.12511 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_10 = load i64, ptr @97, align 8
  %2 = add i64 %param_2.12511, %constant_769_10
  %param_2.12512 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12512
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_183 = load i64, ptr @98, align 8
  %9 = icmp sge i64 0, %constant_770_183
  %10 = select i1 %9, i64 0, i64 %constant_770_183
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2029.1.in_bounds-true, label %dynamic-update-slice.2029.1.in_bounds-after

dynamic-update-slice.2029.1.in_bounds-after:      ; preds = %dynamic-update-slice.2029.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2029.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1460 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.14604 = load double, ptr %param_1.1460, align 8, !invariant.load !182
  %23 = call double @__nv_exp(double %param_1.14604)
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.2029.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_23(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1319 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_86 = load i64, ptr @100, align 8
  %0 = icmp slt i64 %param_2.1319, %constant_770_86
  %1 = zext i1 %0 to i8
  %param_2.13191 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_98 = load i64, ptr @99, align 8
  %2 = add i64 %param_2.13191, %constant_769_98
  %param_2.13192 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13192
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_863 = load i64, ptr @100, align 8
  %9 = icmp sge i64 0, %constant_770_863
  %10 = select i1 %9, i64 0, i64 %constant_770_863
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_864 = load i64, ptr @100, align 8
  %13 = icmp sge i64 0, %constant_770_864
  %14 = select i1 %13, i64 0, i64 %constant_770_864
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2102.1.in_bounds-true, label %dynamic-update-slice.2102.1.in_bounds-after

dynamic-update-slice.2102.1.in_bounds-after:      ; preds = %dynamic-update-slice.2102.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2102.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1528 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.15285 = load double, ptr %param_1.1528, align 8, !invariant.load !182
  %30 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %param_1.15285, ptr %30, align 8
  br label %dynamic-update-slice.2102.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_18(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 128 dereferenceable(32) %arg3) {
entry:
  %param_1.1543 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_101 = load i64, ptr @104, align 8
  %0 = icmp slt i64 %param_1.1543, %constant_770_101
  %1 = zext i1 %0 to i8
  %param_1.15431 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_103 = load i64, ptr @103, align 8
  %2 = add i64 %param_1.15431, %constant_769_103
  %param_1.15432 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15432
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_1013 = load i64, ptr @104, align 8
  %9 = icmp sge i64 0, %constant_770_1013
  %10 = select i1 %9, i64 0, i64 %constant_770_1013
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_1014 = load i64, ptr @104, align 8
  %13 = icmp sge i64 0, %constant_770_1014
  %14 = select i1 %13, i64 0, i64 %constant_770_1014
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2107.1.in_bounds-true, label %dynamic-update-slice.2107.1.in_bounds-after

dynamic-update-slice.2107.1.in_bounds-after:      ; preds = %dynamic-update-slice.2107.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2107.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1334 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.13345 = load double, ptr %param_2.1334, align 8, !invariant.load !182
  %constant_772_25 = load double, ptr @102, align 8
  %param_3.1165 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11656 = load double, ptr %param_3.1165, align 8, !invariant.load !182
  %param_3.11657 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11658 = load double, ptr %param_3.11657, align 8, !invariant.load !182
  %param_3.11659 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.116510 = load double, ptr %param_3.11659, align 8, !invariant.load !182
  %multiply.3545.4 = fmul double %param_3.11658, %param_3.116510
  %multiply.3612.3 = fmul double %param_3.11656, %multiply.3545.4
  %divide.885.3 = fdiv double %constant_772_25, %multiply.3612.3
  %constant_777_7 = load double, ptr @101, align 8
  %multiply.3613.5 = fmul double %divide.885.3, %constant_777_7
  %multiply.3614.3 = fmul double %param_2.13345, %multiply.3613.5
  %30 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3614.3, ptr %30, align 8
  br label %dynamic-update-slice.2107.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_19(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 16 dereferenceable(32) %arg3) {
entry:
  %param_1.1446 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_3 = load i64, ptr @106, align 8
  %0 = icmp slt i64 %param_1.1446, %constant_770_3
  %1 = zext i1 %0 to i8
  %param_1.14461 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_102 = load i64, ptr @105, align 8
  %2 = add i64 %param_1.14461, %constant_769_102
  %param_1.14462 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14462
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_33 = load i64, ptr @106, align 8
  %9 = icmp sge i64 0, %constant_770_33
  %10 = select i1 %9, i64 0, i64 %constant_770_33
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_34 = load i64, ptr @106, align 8
  %13 = icmp sge i64 0, %constant_770_34
  %14 = select i1 %13, i64 0, i64 %constant_770_34
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2106.1.in_bounds-true, label %dynamic-update-slice.2106.1.in_bounds-after

dynamic-update-slice.2106.1.in_bounds-after:      ; preds = %dynamic-update-slice.2106.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2106.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1075 = getelementptr inbounds [4 x [1 x double]], ptr %arg3, i64 0, i64 %21, i64 0
  %param_3.10755 = load double, ptr %param_3.1075, align 8, !invariant.load !182
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1237 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.12376 = load double, ptr %param_2.1237, align 8, !invariant.load !182
  %multiply.3543.3 = fmul double %param_3.10755, %param_2.12376
  %30 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3543.3, ptr %30, align 8
  br label %dynamic-update-slice.2106.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_27(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.916 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_770_64 = load i64, ptr @108, align 8
  %0 = icmp slt i64 %param_4.916, %constant_770_64
  %1 = zext i1 %0 to i8
  %param_4.9161 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_769_93 = load i64, ptr @107, align 8
  %2 = add i64 %param_4.9161, %constant_769_93
  %param_4.9162 = load i64, ptr %arg4, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.9162
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_643 = load i64, ptr @108, align 8
  %9 = icmp sge i64 0, %constant_770_643
  %10 = select i1 %9, i64 0, i64 %constant_770_643
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_644 = load i64, ptr @108, align 8
  %13 = icmp sge i64 0, %constant_770_644
  %14 = select i1 %13, i64 0, i64 %constant_770_644
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2098.1.in_bounds-true, label %dynamic-update-slice.2098.1.in_bounds-after

dynamic-update-slice.2098.1.in_bounds-after:      ; preds = %dynamic-update-slice.2098.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2098.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1114 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11145 = load double, ptr %param_3.1114, align 8, !invariant.load !182
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1297 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.12976 = load double, ptr %param_2.1297, align 8, !invariant.load !182
  %multiply.3504.27 = fmul double %param_3.11145, %param_2.12976
  %param_1.1506 = getelementptr inbounds [4 x double], ptr %arg1, i64 0, i64 %21
  %param_1.15067 = load double, ptr %param_1.1506, align 8, !invariant.load !182
  %multiply.3505.13 = fmul double %multiply.3504.27, %param_1.15067
  %30 = fneg double %multiply.3505.13
  %31 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %30, ptr %31, align 8
  br label %dynamic-update-slice.2098.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_26(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.909 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_770_51 = load i64, ptr @110, align 8
  %0 = icmp slt i64 %param_4.909, %constant_770_51
  %1 = zext i1 %0 to i8
  %param_4.9091 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_769_94 = load i64, ptr @109, align 8
  %2 = add i64 %param_4.9091, %constant_769_94
  %param_4.9092 = load i64, ptr %arg4, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.9092
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_513 = load i64, ptr @110, align 8
  %9 = icmp sge i64 0, %constant_770_513
  %10 = select i1 %9, i64 0, i64 %constant_770_513
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_514 = load i64, ptr @110, align 8
  %13 = icmp sge i64 0, %constant_770_514
  %14 = select i1 %13, i64 0, i64 %constant_770_514
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2099.1.in_bounds-true, label %dynamic-update-slice.2099.1.in_bounds-after

dynamic-update-slice.2099.1.in_bounds-after:      ; preds = %dynamic-update-slice.2099.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2099.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1104 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11045 = load double, ptr %param_3.1104, align 8, !invariant.load !182
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1284 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.12846 = load double, ptr %param_2.1284, align 8, !invariant.load !182
  %multiply.3504.23 = fmul double %param_3.11045, %param_2.12846
  %param_1.1493 = getelementptr inbounds [4 x double], ptr %arg1, i64 0, i64 %21
  %param_1.14937 = load double, ptr %param_1.1493, align 8, !invariant.load !182
  %multiply.3505.9 = fmul double %multiply.3504.23, %param_1.14937
  %30 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3505.9, ptr %30, align 8
  br label %dynamic-update-slice.2099.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_25(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(768) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %param_5.783 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_770_19 = load i64, ptr @112, align 8
  %0 = icmp slt i64 %param_5.783, %constant_770_19
  %1 = zext i1 %0 to i8
  %param_5.7831 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_769_96 = load i64, ptr @111, align 8
  %2 = add i64 %param_5.7831, %constant_769_96
  %param_5.7832 = load i64, ptr %arg5, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_5.7832
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_193 = load i64, ptr @112, align 8
  %9 = icmp sge i64 0, %constant_770_193
  %10 = select i1 %9, i64 0, i64 %constant_770_193
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_194 = load i64, ptr @112, align 8
  %13 = icmp sge i64 0, %constant_770_194
  %14 = select i1 %13, i64 0, i64 %constant_770_194
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2100.1.in_bounds-true, label %dynamic-update-slice.2100.1.in_bounds-after

dynamic-update-slice.2100.1.in_bounds-after:      ; preds = %dynamic-update-slice.2100.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2100.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_4.891 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.8915 = load double, ptr %param_4.891, align 8, !invariant.load !182
  %29 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1083 = getelementptr inbounds double, ptr %29, i64 0
  %param_3.10836 = load double, ptr %param_3.1083, align 8, !invariant.load !182
  %multiply.3504.17 = fmul double %param_4.8915, %param_3.10836
  %param_2.1252 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.12527 = load double, ptr %param_2.1252, align 8, !invariant.load !182
  %multiply.3505.3 = fmul double %multiply.3504.17, %param_2.12527
  %30 = fneg double %multiply.3505.3
  %param_1.1461 = load double, ptr %arg1, align 8, !invariant.load !182
  %multiply.3539.3 = fmul double %30, %param_1.1461
  %31 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3539.3, ptr %31, align 8
  br label %dynamic-update-slice.2100.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_29(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(768) %arg5, ptr noalias align 16 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(32) %arg8, ptr noalias align 16 dereferenceable(768) %arg9, ptr noalias align 128 dereferenceable(768) %arg10, ptr noalias align 16 dereferenceable(1536) %arg11) {
entry:
  %param_1.1537 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_95 = load i64, ptr @117, align 8
  %0 = icmp slt i64 %param_1.1537, %constant_770_95
  %1 = zext i1 %0 to i8
  %param_1.15371 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_91 = load i64, ptr @116, align 8
  %2 = add i64 %param_1.15371, %constant_769_91
  %param_1.15372 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15372
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_953 = load i64, ptr @117, align 8
  %9 = icmp sge i64 0, %constant_770_953
  %10 = select i1 %9, i64 0, i64 %constant_770_953
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_954 = load i64, ptr @117, align 8
  %13 = icmp sge i64 0, %constant_770_954
  %14 = select i1 %13, i64 0, i64 %constant_770_954
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2096.1.in_bounds-true, label %dynamic-update-slice.2096.1.in_bounds-after

dynamic-update-slice.2096.1.in_bounds-after:      ; preds = %dynamic-update-slice.2096.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2096.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.849 = getelementptr inbounds double, ptr %29, i64 0
  %param_5.8495 = load double, ptr %param_5.849, align 8, !invariant.load !182
  %30 = fneg double %param_5.8495
  %param_4.964 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9646 = load double, ptr %param_4.964, align 8, !invariant.load !182
  %multiply.3509.11 = fmul double %30, %param_4.9646
  %param_1.15377 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_958 = load i64, ptr @117, align 8
  %31 = icmp slt i64 %param_1.15377, %constant_770_958
  %32 = zext i1 %31 to i8
  %param_1.15379 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_9110 = load i64, ptr @116, align 8
  %33 = add i64 %param_1.15379, %constant_769_9110
  %param_1.153711 = load i64, ptr %arg1, align 8, !invariant.load !182
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, i64 %33, i64 %param_1.153711
  %36 = icmp sge i64 0, %35
  %37 = select i1 %36, i64 0, i64 %35
  %38 = icmp sle i64 191, %37
  %dynamic-slice.54.52.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.54.52.start_idx0, 0
  %param_11.247 = getelementptr inbounds [192 x double], ptr %arg11, i64 0, i64 %39
  %param_11.24712 = load double, ptr %param_11.247, align 8, !invariant.load !182
  %param_6.589 = getelementptr inbounds [4 x double], ptr %arg6, i64 0, i64 %21
  %param_6.58913 = load double, ptr %param_6.589, align 8, !invariant.load !182
  %param_8.408 = getelementptr inbounds [4 x [1 x double]], ptr %arg8, i64 0, i64 %21, i64 0
  %param_8.40814 = load double, ptr %param_8.408, align 8, !invariant.load !182
  %param_7.485 = getelementptr inbounds [4 x double], ptr %arg7, i64 0, i64 %21
  %param_7.48515 = load double, ptr %param_7.485, align 8, !invariant.load !182
  %multiply.3502.25 = fmul double %param_8.40814, %param_7.48515
  %add.1033.23 = fadd double %param_6.58913, %multiply.3502.25
  %40 = call double @__nv_exp(double %add.1033.23)
  %multiply.3503.7 = fmul double %param_11.24712, %40
  %constant_774_6 = load double, ptr @118, align 8
  %compare.375.3 = fcmp ogt double %multiply.3503.7, %constant_774_6
  %41 = zext i1 %compare.375.3 to i8
  %42 = getelementptr double, ptr %arg9, i64 %linear_index
  %param_9.361 = getelementptr inbounds double, ptr %42, i64 0
  %param_9.36116 = load double, ptr %param_9.361, align 8, !invariant.load !182
  %43 = getelementptr double, ptr %arg10, i64 %linear_index
  %param_10.306 = getelementptr inbounds double, ptr %43, i64 0
  %param_10.30617 = load double, ptr %param_10.306, align 8, !invariant.load !182
  %multiply.3510.5 = fmul double %param_8.40814, %param_10.30617
  %add.1036.5 = fadd double %param_9.36116, %multiply.3510.5
  %multiply.3511.5 = fmul double %add.1036.5, %40
  %multiply.3512.11 = fmul double %param_11.24712, %multiply.3511.5
  %constant_776_3 = load double, ptr @115, align 8
  %44 = trunc i8 %41 to i1
  %45 = select i1 %44, double %multiply.3512.11, double %constant_776_3
  %add.1037.7 = fadd double %multiply.3509.11, %45
  %constant_772_23 = load double, ptr @114, align 8
  %param_2.1359 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.135918 = load double, ptr %param_2.1359, align 8, !invariant.load !182
  %param_3.1163 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.116319 = load double, ptr %param_3.1163, align 8, !invariant.load !182
  %add.1034.6 = fadd double %param_2.135918, %param_3.116319
  %multiply.3513.4 = fmul double %add.1034.6, %add.1034.6
  %multiply.3606.3 = fmul double %add.1034.6, %multiply.3513.4
  %divide.883.3 = fdiv double %constant_772_23, %multiply.3606.3
  %constant_777_5 = load double, ptr @113, align 8
  %multiply.3607.5 = fmul double %divide.883.3, %constant_777_5
  %multiply.3608.3 = fmul double %add.1037.7, %multiply.3607.5
  %46 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3608.3, ptr %46, align 8
  br label %dynamic-update-slice.2096.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_32(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(768) %arg5, ptr noalias align 128 dereferenceable(768) %arg6) {
entry:
  %param_1.1485 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_43 = load i64, ptr @120, align 8
  %0 = icmp slt i64 %param_1.1485, %constant_770_43
  %1 = zext i1 %0 to i8
  %param_1.14851 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_87 = load i64, ptr @119, align 8
  %2 = add i64 %param_1.14851, %constant_769_87
  %param_1.14852 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14852
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_433 = load i64, ptr @120, align 8
  %9 = icmp sge i64 0, %constant_770_433
  %10 = select i1 %9, i64 0, i64 %constant_770_433
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_434 = load i64, ptr @120, align 8
  %13 = icmp sge i64 0, %constant_770_434
  %14 = select i1 %13, i64 0, i64 %constant_770_434
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2093.1.in_bounds-true, label %dynamic-update-slice.2093.1.in_bounds-after

dynamic-update-slice.2093.1.in_bounds-after:      ; preds = %dynamic-update-slice.2093.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2093.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.794 = getelementptr inbounds double, ptr %29, i64 0
  %param_5.7945 = load double, ptr %param_5.794, align 8, !invariant.load !182
  %param_4.904 = getelementptr inbounds [4 x [1 x double]], ptr %arg4, i64 0, i64 %21, i64 0
  %param_4.9046 = load double, ptr %param_4.904, align 8, !invariant.load !182
  %30 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.542 = getelementptr inbounds double, ptr %30, i64 0
  %param_6.5427 = load double, ptr %param_6.542, align 8, !invariant.load !182
  %multiply.3510.3 = fmul double %param_4.9046, %param_6.5427
  %add.1036.3 = fadd double %param_5.7945, %multiply.3510.3
  %param_2.1276 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.12768 = load double, ptr %param_2.1276, align 8, !invariant.load !182
  %param_3.1097 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.10979 = load double, ptr %param_3.1097, align 8, !invariant.load !182
  %multiply.3502.15 = fmul double %param_4.9046, %param_3.10979
  %add.1033.13 = fadd double %param_2.12768, %multiply.3502.15
  %31 = call double @__nv_exp(double %add.1033.13)
  %multiply.3511.3 = fmul double %add.1036.3, %31
  %32 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3511.3, ptr %32, align 8
  br label %dynamic-update-slice.2093.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_30(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(768) %arg5, ptr noalias align 128 dereferenceable(768) %arg6, ptr noalias align 16 dereferenceable(1536) %arg7) {
entry:
  %param_1.1555 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_11 = load i64, ptr @123, align 8
  %0 = icmp slt i64 %param_1.1555, %constant_770_11
  %1 = zext i1 %0 to i8
  %param_1.15551 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_89 = load i64, ptr @122, align 8
  %2 = add i64 %param_1.15551, %constant_769_89
  %param_1.15552 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15552
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_113 = load i64, ptr @123, align 8
  %9 = icmp sge i64 0, %constant_770_113
  %10 = select i1 %9, i64 0, i64 %constant_770_113
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_114 = load i64, ptr @123, align 8
  %13 = icmp sge i64 0, %constant_770_114
  %14 = select i1 %13, i64 0, i64 %constant_770_114
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2095.1.in_bounds-true, label %dynamic-update-slice.2095.1.in_bounds-after

dynamic-update-slice.2095.1.in_bounds-after:      ; preds = %dynamic-update-slice.2095.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2095.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_1.15555 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_116 = load i64, ptr @123, align 8
  %29 = icmp slt i64 %param_1.15555, %constant_770_116
  %30 = zext i1 %29 to i8
  %param_1.15557 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_898 = load i64, ptr @122, align 8
  %31 = add i64 %param_1.15557, %constant_769_898
  %param_1.15559 = load i64, ptr %arg1, align 8, !invariant.load !182
  %32 = trunc i8 %30 to i1
  %33 = select i1 %32, i64 %31, i64 %param_1.15559
  %34 = icmp sge i64 0, %33
  %35 = select i1 %34, i64 0, i64 %33
  %36 = icmp sle i64 191, %35
  %dynamic-slice.54.62.start_idx0 = select i1 %36, i64 191, i64 %35
  %37 = add i64 %dynamic-slice.54.62.start_idx0, 0
  %param_7.478 = getelementptr inbounds [192 x double], ptr %arg7, i64 0, i64 %37
  %param_7.47810 = load double, ptr %param_7.478, align 8, !invariant.load !182
  %param_2.1354 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.135411 = load double, ptr %param_2.1354, align 8, !invariant.load !182
  %param_4.956 = getelementptr inbounds [4 x [1 x double]], ptr %arg4, i64 0, i64 %21, i64 0
  %param_4.95612 = load double, ptr %param_4.956, align 8, !invariant.load !182
  %param_3.1155 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.115513 = load double, ptr %param_3.1155, align 8, !invariant.load !182
  %multiply.3502.35 = fmul double %param_4.95612, %param_3.115513
  %add.1033.33 = fadd double %param_2.135411, %multiply.3502.35
  %38 = call double @__nv_exp(double %add.1033.33)
  %multiply.3503.17 = fmul double %param_7.47810, %38
  %constant_774_2 = load double, ptr @124, align 8
  %compare.375.13 = fcmp ogt double %multiply.3503.17, %constant_774_2
  %39 = zext i1 %compare.375.13 to i8
  %40 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.841 = getelementptr inbounds double, ptr %40, i64 0
  %param_5.84114 = load double, ptr %param_5.841, align 8, !invariant.load !182
  %41 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.582 = getelementptr inbounds double, ptr %41, i64 0
  %param_6.58215 = load double, ptr %param_6.582, align 8, !invariant.load !182
  %multiply.3510.11 = fmul double %param_4.95612, %param_6.58215
  %add.1036.11 = fadd double %param_5.84114, %multiply.3510.11
  %multiply.3511.11 = fmul double %add.1036.11, %38
  %multiply.3512.7 = fmul double %param_7.47810, %multiply.3511.11
  %constant_776_17 = load double, ptr @121, align 8
  %42 = trunc i8 %39 to i1
  %43 = select i1 %42, double %multiply.3512.7, double %constant_776_17
  %44 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %43, ptr %44, align 8
  br label %dynamic-update-slice.2095.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_102(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(768) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(32) %arg4) {
entry:
  %param_3.1184 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_770_13 = load i64, ptr @129, align 8
  %0 = icmp slt i64 %param_3.1184, %constant_770_13
  %1 = zext i1 %0 to i8
  %param_3.11841 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_769_60 = load i64, ptr @130, align 8
  %2 = add i64 %param_3.11841, %constant_769_60
  %param_3.11842 = load i64, ptr %arg3, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11842
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_133 = load i64, ptr @129, align 8
  %9 = icmp sge i64 0, %constant_770_133
  %10 = select i1 %9, i64 0, i64 %constant_770_133
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_134 = load i64, ptr @129, align 8
  %13 = icmp sge i64 0, %constant_770_134
  %14 = select i1 %13, i64 0, i64 %constant_770_134
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2128.1.in_bounds-true, label %dynamic-update-slice.2128.1.in_bounds-after

dynamic-update-slice.2128.1.in_bounds-after:      ; preds = %dynamic-update-slice.2128.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2128.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_4.981 = getelementptr inbounds [4 x i64], ptr %arg4, i64 0, i64 %21
  %param_4.9815 = load i64, ptr %param_4.981, align 8, !invariant.load !182
  %constant_770_136 = load i64, ptr @129, align 8
  %29 = icmp ne i64 %param_4.9815, %constant_770_136
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_780_4 = load i32, ptr @128, align 4
  %32 = icmp eq i32 %31, %constant_780_4
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1376 = getelementptr inbounds double, ptr %34, i64 0
  %param_2.13767 = load double, ptr %param_2.1376, align 8, !invariant.load !182
  %constant_776_1 = load double, ptr @127, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_2.13767, double %constant_776_1
  %param_1.1567 = getelementptr inbounds [4 x [1 x double]], ptr %arg1, i64 0, i64 %21, i64 0
  %param_1.15678 = load double, ptr %param_1.1567, align 8, !invariant.load !182
  %constant_779_2 = load double, ptr @126, align 8
  %multiply.3587.7 = fmul double %param_1.15678, %constant_779_2
  %multiply.3588.7 = fmul double %36, %multiply.3587.7
  %constant_782_3 = load double, ptr @125, align 8
  %multiply.3625.3 = fmul double %multiply.3588.7, %constant_782_3
  %37 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3625.3, ptr %37, align 8
  br label %dynamic-update-slice.2128.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_99(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(32) %arg3) {
entry:
  %param_2.1363 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_17 = load i64, ptr @134, align 8
  %0 = icmp slt i64 %param_2.1363, %constant_770_17
  %1 = zext i1 %0 to i8
  %param_2.13631 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_62 = load i64, ptr @135, align 8
  %2 = add i64 %param_2.13631, %constant_769_62
  %param_2.13632 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13632
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_173 = load i64, ptr @134, align 8
  %9 = icmp sge i64 0, %constant_770_173
  %10 = select i1 %9, i64 0, i64 %constant_770_173
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_174 = load i64, ptr @134, align 8
  %13 = icmp sge i64 0, %constant_770_174
  %14 = select i1 %13, i64 0, i64 %constant_770_174
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2127.1.in_bounds-true, label %dynamic-update-slice.2127.1.in_bounds-after

dynamic-update-slice.2127.1.in_bounds-after:      ; preds = %dynamic-update-slice.2127.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2127.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1176 = getelementptr inbounds [4 x i64], ptr %arg3, i64 0, i64 %21
  %param_3.11765 = load i64, ptr %param_3.1176, align 8, !invariant.load !182
  %constant_770_176 = load i64, ptr @134, align 8
  %29 = icmp ne i64 %param_3.11765, %constant_770_176
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_780_1 = load i32, ptr @133, align 4
  %32 = icmp eq i32 %31, %constant_780_1
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1560 = getelementptr inbounds double, ptr %34, i64 0
  %param_1.15607 = load double, ptr %param_1.1560, align 8, !invariant.load !182
  %constant_776_19 = load double, ptr @132, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_1.15607, double %constant_776_19
  %constant_779_3 = load double, ptr @131, align 8
  %multiply.3624.1 = fmul double %36, %constant_779_3
  %37 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3624.1, ptr %37, align 8
  br label %dynamic-update-slice.2127.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_103(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(32) %arg3) {
entry:
  %param_2.1355 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_37 = load i64, ptr @138, align 8
  %0 = icmp slt i64 %param_2.1355, %constant_770_37
  %1 = zext i1 %0 to i8
  %param_2.13551 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_66 = load i64, ptr @139, align 8
  %2 = add i64 %param_2.13551, %constant_769_66
  %param_2.13552 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13552
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_373 = load i64, ptr @138, align 8
  %9 = icmp sge i64 0, %constant_770_373
  %10 = select i1 %9, i64 0, i64 %constant_770_373
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_374 = load i64, ptr @138, align 8
  %13 = icmp sge i64 0, %constant_770_374
  %14 = select i1 %13, i64 0, i64 %constant_770_374
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2123.1.in_bounds-true, label %dynamic-update-slice.2123.1.in_bounds-after

dynamic-update-slice.2123.1.in_bounds-after:      ; preds = %dynamic-update-slice.2123.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2123.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1180 = getelementptr inbounds [4 x i64], ptr %arg3, i64 0, i64 %21
  %param_3.11805 = load i64, ptr %param_3.1180, align 8, !invariant.load !182
  %constant_770_376 = load i64, ptr @138, align 8
  %29 = icmp ne i64 %param_3.11805, %constant_770_376
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_780_11 = load i32, ptr @137, align 4
  %32 = icmp eq i32 %31, %constant_780_11
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1556 = getelementptr inbounds double, ptr %34, i64 0
  %param_1.15567 = load double, ptr %param_1.1556, align 8, !invariant.load !182
  %constant_776_18 = load double, ptr @136, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_1.15567, double %constant_776_18
  %37 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %36, ptr %37, align 8
  br label %dynamic-update-slice.2123.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_6(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(768) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.977 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_770_49 = load i64, ptr @142, align 8
  %0 = icmp slt i64 %param_4.977, %constant_770_49
  %1 = zext i1 %0 to i8
  %param_4.9771 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_769_75 = load i64, ptr @143, align 8
  %2 = add i64 %param_4.9771, %constant_769_75
  %param_4.9772 = load i64, ptr %arg4, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.9772
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_493 = load i64, ptr @142, align 8
  %9 = icmp sge i64 0, %constant_770_493
  %10 = select i1 %9, i64 0, i64 %constant_770_493
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_494 = load i64, ptr @142, align 8
  %13 = icmp sge i64 0, %constant_770_494
  %14 = select i1 %13, i64 0, i64 %constant_770_494
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2120.1.in_bounds-true, label %dynamic-update-slice.2120.1.in_bounds-after

dynamic-update-slice.2120.1.in_bounds-after:      ; preds = %dynamic-update-slice.2120.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2120.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1181 = getelementptr inbounds [4 x i64], ptr %arg3, i64 0, i64 %21
  %param_3.11815 = load i64, ptr %param_3.1181, align 8, !invariant.load !182
  %constant_770_496 = load i64, ptr @142, align 8
  %29 = icmp ne i64 %param_3.11815, %constant_770_496
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_781_5 = load i32, ptr @141, align 4
  %32 = icmp eq i32 %31, %constant_781_5
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1282 = getelementptr inbounds double, ptr %34, i64 0
  %param_2.12827 = load double, ptr %param_2.1282, align 8, !invariant.load !182
  %constant_776_6 = load double, ptr @140, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_2.12827, double %constant_776_6
  %param_1.1491 = getelementptr inbounds [4 x double], ptr %arg1, i64 0, i64 %21
  %param_1.14918 = load double, ptr %param_1.1491, align 8, !invariant.load !182
  %37 = call double @__nv_exp(double %param_1.14918)
  %multiply.3576.3 = fmul double %36, %37
  %38 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3576.3, ptr %38, align 8
  br label %dynamic-update-slice.2120.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_7(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(768) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(32) %arg4) {
entry:
  %param_3.1182 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_770_53 = load i64, ptr @148, align 8
  %0 = icmp slt i64 %param_3.1182, %constant_770_53
  %1 = zext i1 %0 to i8
  %param_3.11821 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_769_69 = load i64, ptr @149, align 8
  %2 = add i64 %param_3.11821, %constant_769_69
  %param_3.11822 = load i64, ptr %arg3, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11822
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_533 = load i64, ptr @148, align 8
  %9 = icmp sge i64 0, %constant_770_533
  %10 = select i1 %9, i64 0, i64 %constant_770_533
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_534 = load i64, ptr @148, align 8
  %13 = icmp sge i64 0, %constant_770_534
  %14 = select i1 %13, i64 0, i64 %constant_770_534
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2119.1.in_bounds-true, label %dynamic-update-slice.2119.1.in_bounds-after

dynamic-update-slice.2119.1.in_bounds-after:      ; preds = %dynamic-update-slice.2119.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2119.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_2.1375 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 %21
  %param_2.13755 = load i64, ptr %param_2.1375, align 8, !invariant.load !182
  %constant_770_536 = load i64, ptr @148, align 8
  %29 = icmp ne i64 %param_2.13755, %constant_770_536
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_781_6 = load i32, ptr @147, align 4
  %32 = icmp eq i32 %31, %constant_781_6
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1495 = getelementptr inbounds double, ptr %34, i64 0
  %param_1.14957 = load double, ptr %param_1.1495, align 8, !invariant.load !182
  %constant_776_11 = load double, ptr @146, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_1.14957, double %constant_776_11
  %constant_772_20 = load double, ptr @145, align 8
  %param_4.978 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9788 = load double, ptr %param_4.978, align 8, !invariant.load !182
  %param_4.9789 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.97810 = load double, ptr %param_4.9789, align 8, !invariant.load !182
  %param_4.97811 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.97812 = load double, ptr %param_4.97811, align 8, !invariant.load !182
  %multiply.3559.6 = fmul double %param_4.97810, %param_4.97812
  %multiply.3597.5 = fmul double %param_4.9788, %multiply.3559.6
  %divide.880.5 = fdiv double %constant_772_20, %multiply.3597.5
  %constant_777_2 = load double, ptr @144, align 8
  %multiply.3598.5 = fmul double %divide.880.5, %constant_777_2
  %multiply.3619.3 = fmul double %36, %multiply.3598.5
  %37 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3619.3, ptr %37, align 8
  br label %dynamic-update-slice.2119.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_98(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1307 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_74 = load i64, ptr @151, align 8
  %0 = icmp slt i64 %param_2.1307, %constant_770_74
  %1 = zext i1 %0 to i8
  %param_2.13071 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_3 = load i64, ptr @150, align 8
  %2 = add i64 %param_2.13071, %constant_769_3
  %param_2.13072 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13072
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_743 = load i64, ptr @151, align 8
  %9 = icmp sge i64 0, %constant_770_743
  %10 = select i1 %9, i64 0, i64 %constant_770_743
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_744 = load i64, ptr @151, align 8
  %13 = icmp sge i64 0, %constant_770_744
  %14 = select i1 %13, i64 0, i64 %constant_770_744
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2113.1.in_bounds-true, label %dynamic-update-slice.2113.1.in_bounds-after

dynamic-update-slice.2113.1.in_bounds-after:      ; preds = %dynamic-update-slice.2113.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2113.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1516 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.15165 = load double, ptr %param_1.1516, align 8, !invariant.load !182
  %30 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %param_1.15165, ptr %30, align 8
  br label %dynamic-update-slice.2113.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_35(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4) {
entry:
  %param_3.1145 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_770_58 = load i64, ptr @154, align 8
  %0 = icmp slt i64 %param_3.1145, %constant_770_58
  %1 = zext i1 %0 to i8
  %param_3.11451 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_769_83 = load i64, ptr @153, align 8
  %2 = add i64 %param_3.11451, %constant_769_83
  %param_3.11452 = load i64, ptr %arg3, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11452
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_583 = load i64, ptr @154, align 8
  %9 = icmp sge i64 0, %constant_770_583
  %10 = select i1 %9, i64 0, i64 %constant_770_583
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_584 = load i64, ptr @154, align 8
  %13 = icmp sge i64 0, %constant_770_584
  %14 = select i1 %13, i64 0, i64 %constant_770_584
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2090.1.in_bounds-true, label %dynamic-update-slice.2090.1.in_bounds-after

dynamic-update-slice.2090.1.in_bounds-after:      ; preds = %dynamic-update-slice.2090.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2090.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.11455 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_770_586 = load i64, ptr @154, align 8
  %29 = icmp slt i64 %param_3.11455, %constant_770_586
  %30 = zext i1 %29 to i8
  %param_3.11457 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_769_838 = load i64, ptr @153, align 8
  %31 = add i64 %param_3.11457, %constant_769_838
  %param_3.11459 = load i64, ptr %arg3, align 8, !invariant.load !182
  %32 = trunc i8 %30 to i1
  %33 = select i1 %32, i64 %31, i64 %param_3.11459
  %34 = icmp sge i64 0, %33
  %35 = select i1 %34, i64 0, i64 %33
  %36 = icmp sle i64 191, %35
  %dynamic-slice.54.96.start_idx0 = select i1 %36, i64 191, i64 %35
  %37 = add i64 %dynamic-slice.54.96.start_idx0, 0
  %param_4.946 = getelementptr inbounds [192 x double], ptr %arg4, i64 0, i64 %37
  %param_4.94610 = load double, ptr %param_4.946, align 8, !invariant.load !182
  %param_2.1348 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.134811 = load double, ptr %param_2.1348, align 8, !invariant.load !182
  %38 = call double @__nv_exp(double %param_2.134811)
  %multiply.3524.31 = fmul double %param_4.94610, %38
  %constant_774_11 = load double, ptr @155, align 8
  %compare.377.3 = fcmp ogt double %multiply.3524.31, %constant_774_11
  %39 = zext i1 %compare.377.3 to i8
  %40 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1554 = getelementptr inbounds double, ptr %40, i64 0
  %param_1.155412 = load double, ptr %param_1.1554, align 8, !invariant.load !182
  %multiply.3561.7 = fmul double %param_1.155412, %38
  %multiply.3562.3 = fmul double %param_4.94610, %multiply.3561.7
  %constant_776_4 = load double, ptr @152, align 8
  %41 = trunc i8 %39 to i1
  %42 = select i1 %41, double %multiply.3562.3, double %constant_776_4
  %43 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %42, ptr %43, align 8
  br label %dynamic-update-slice.2090.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_37(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.1098 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_770_44 = load i64, ptr @157, align 8
  %0 = icmp slt i64 %param_3.1098, %constant_770_44
  %1 = zext i1 %0 to i8
  %param_3.10981 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_769_81 = load i64, ptr @156, align 8
  %2 = add i64 %param_3.10981, %constant_769_81
  %param_3.10982 = load i64, ptr %arg3, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.10982
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_443 = load i64, ptr @157, align 8
  %9 = icmp sge i64 0, %constant_770_443
  %10 = select i1 %9, i64 0, i64 %constant_770_443
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_444 = load i64, ptr @157, align 8
  %13 = icmp sge i64 0, %constant_770_444
  %14 = select i1 %13, i64 0, i64 %constant_770_444
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2088.1.in_bounds-true, label %dynamic-update-slice.2088.1.in_bounds-after

dynamic-update-slice.2088.1.in_bounds-after:      ; preds = %dynamic-update-slice.2088.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2088.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1486 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.14865 = load double, ptr %param_1.1486, align 8, !invariant.load !182
  %param_2.1277 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.12776 = load double, ptr %param_2.1277, align 8, !invariant.load !182
  %30 = call double @__nv_exp(double %param_2.12776)
  %multiply.3561.3 = fmul double %param_1.14865, %30
  %31 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3561.3, ptr %31, align 8
  br label %dynamic-update-slice.2088.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_38(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(32) %arg3) {
entry:
  %param_2.1320 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_87 = load i64, ptr @161, align 8
  %0 = icmp slt i64 %param_2.1320, %constant_770_87
  %1 = zext i1 %0 to i8
  %param_2.13201 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_80 = load i64, ptr @160, align 8
  %2 = add i64 %param_2.13201, %constant_769_80
  %param_2.13202 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13202
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_873 = load i64, ptr @161, align 8
  %9 = icmp sge i64 0, %constant_770_873
  %10 = select i1 %9, i64 0, i64 %constant_770_873
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_874 = load i64, ptr @161, align 8
  %13 = icmp sge i64 0, %constant_770_874
  %14 = select i1 %13, i64 0, i64 %constant_770_874
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2087.1.in_bounds-true, label %dynamic-update-slice.2087.1.in_bounds-after

dynamic-update-slice.2087.1.in_bounds-after:      ; preds = %dynamic-update-slice.2087.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2087.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1529 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.15295 = load double, ptr %param_1.1529, align 8, !invariant.load !182
  %constant_772_31 = load double, ptr @159, align 8
  %param_3.1166 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11666 = load double, ptr %param_3.1166, align 8, !invariant.load !182
  %param_3.11667 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11668 = load double, ptr %param_3.11667, align 8, !invariant.load !182
  %param_3.11669 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.116610 = load double, ptr %param_3.11669, align 8, !invariant.load !182
  %multiply.3559.4 = fmul double %param_3.11668, %param_3.116610
  %multiply.3597.3 = fmul double %param_3.11666, %multiply.3559.4
  %divide.880.3 = fdiv double %constant_772_31, %multiply.3597.3
  %constant_777_8 = load double, ptr @158, align 8
  %multiply.3598.3 = fmul double %divide.880.3, %constant_777_8
  %multiply.3599.3 = fmul double %param_1.15295, %multiply.3598.3
  %30 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3599.3, ptr %30, align 8
  br label %dynamic-update-slice.2087.1.in_bounds-after
}

define void @loop_add_and_divide_select_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(32) %arg8, ptr noalias align 128 dereferenceable(32) %arg9, ptr noalias align 16 dereferenceable(32) %arg10, ptr noalias align 16 dereferenceable(32) %arg11, ptr noalias align 128 dereferenceable(32) %arg12, ptr noalias align 16 dereferenceable(32) %arg13, ptr noalias align 128 dereferenceable(32) %arg14, ptr noalias align 128 dereferenceable(32) %arg15, ptr noalias align 128 dereferenceable(32) %arg16, ptr noalias align 128 dereferenceable(32) %arg17, ptr noalias align 128 dereferenceable(8) %arg18, ptr noalias align 16 dereferenceable(32) %arg19, ptr noalias align 16 dereferenceable(32) %arg20, ptr noalias align 128 dereferenceable(32) %arg21, ptr noalias align 128 dereferenceable(32) %arg22, ptr noalias align 128 dereferenceable(32) %arg23, ptr noalias align 128 dereferenceable(32) %arg24, ptr noalias align 128 dereferenceable(32) %arg25, ptr noalias align 16 dereferenceable(6144) %arg26, ptr noalias align 128 dereferenceable(16) %arg27, ptr noalias align 16 dereferenceable(768) %arg28, ptr noalias align 128 dereferenceable(32) %arg29, ptr noalias align 128 dereferenceable(32) %arg30, ptr noalias align 128 dereferenceable(32) %arg31, ptr noalias align 128 dereferenceable(32) %arg32, ptr noalias align 128 dereferenceable(32) %arg33, ptr noalias align 128 dereferenceable(32) %arg34, ptr noalias align 128 dereferenceable(32) %arg35, ptr noalias align 128 dereferenceable(32) %arg36, ptr noalias align 128 dereferenceable(32) %arg37, ptr noalias align 128 dereferenceable(32) %arg38, ptr noalias align 128 dereferenceable(32) %arg39, ptr noalias align 128 dereferenceable(32) %arg40, ptr noalias align 16 dereferenceable(32) %arg41, ptr noalias align 128 dereferenceable(32) %arg42, ptr noalias align 128 dereferenceable(32) %arg43, ptr noalias align 128 dereferenceable(32) %arg44, ptr noalias align 128 dereferenceable(32) %arg45, ptr noalias align 128 dereferenceable(32) %arg46, ptr noalias align 128 dereferenceable(32) %arg47, ptr noalias align 128 dereferenceable(32) %arg48, ptr noalias align 128 dereferenceable(4) %arg49, ptr noalias align 128 dereferenceable(32) %arg50, ptr noalias align 128 dereferenceable(32) %arg51, ptr noalias align 128 dereferenceable(32) %arg52, ptr noalias align 128 dereferenceable(32) %arg53) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_add_and_divide_select_fusion.in_bounds-true, label %loop_add_and_divide_select_fusion.in_bounds-after

loop_add_and_divide_select_fusion.in_bounds-after: ; preds = %loop_add_and_divide_select_fusion.in_bounds-true, %entry
  ret void

loop_add_and_divide_select_fusion.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg20, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !182
  %8 = getelementptr double, ptr %arg21, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !182
  %multiply.3498.21.clone.1 = fmul double %7, %10
  %11 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_770_2 = load i64, ptr @163, align 8
  %12 = icmp slt i64 %11, %constant_770_2
  %13 = zext i1 %12 to i8
  %14 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_769_1 = load i64, ptr @164, align 8
  %15 = add i64 %14, %constant_769_1
  %16 = load i64, ptr %arg5, align 8, !invariant.load !182
  %17 = trunc i8 %13 to i1
  %18 = select i1 %17, i64 %15, i64 %16
  %19 = trunc i64 %18 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 191, %21
  %dynamic-slice.54.50.clone.1.start_idx0 = select i1 %22, i32 191, i32 %21
  %23 = add i32 %dynamic-slice.54.50.clone.1.start_idx0, 0
  %24 = getelementptr inbounds [192 x double], ptr %arg4, i32 0, i32 %23
  %25 = load double, ptr %24, align 8, !invariant.load !182
  %26 = getelementptr double, ptr %arg19, i32 %linear_index
  %27 = getelementptr inbounds double, ptr %26, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !182
  %multiply.3499.23.clone.1 = fmul double %25, %28
  %add.1031.21.clone.1 = fadd double %multiply.3498.21.clone.1, %multiply.3499.23.clone.1
  %29 = getelementptr double, ptr %arg41, i32 %linear_index
  %30 = getelementptr inbounds double, ptr %29, i32 0
  %31 = load double, ptr %30, align 8, !invariant.load !182
  %32 = getelementptr double, ptr %arg34, i32 %linear_index
  %33 = getelementptr inbounds double, ptr %32, i32 0
  %34 = load double, ptr %33, align 8, !invariant.load !182
  %multiply.3501.5.clone.1 = fmul double %31, %34
  %35 = getelementptr double, ptr %arg22, i32 %linear_index
  %36 = getelementptr inbounds double, ptr %35, i32 0
  %37 = load double, ptr %36, align 8, !invariant.load !182
  %divide.862.1.clone.1 = fdiv double %multiply.3501.5.clone.1, %37
  %38 = trunc i64 %18 to i32
  %39 = icmp sge i32 0, %38
  %40 = select i1 %39, i32 0, i32 %38
  %41 = icmp sle i32 191, %40
  %dynamic-slice.56.6.clone.1.start_idx0 = select i1 %41, i32 191, i32 %40
  %constant_770_21 = load i64, ptr @163, align 8
  %42 = trunc i64 %constant_770_21 to i32
  %43 = icmp sge i32 0, %42
  %44 = select i1 %43, i32 0, i32 %42
  %45 = icmp sle i32 0, %44
  %dynamic-slice.56.6.clone.1.start_idx1 = select i1 %45, i32 0, i32 %44
  %constant_770_22 = load i64, ptr @163, align 8
  %46 = trunc i64 %constant_770_22 to i32
  %47 = icmp sge i32 0, %46
  %48 = select i1 %47, i32 0, i32 %46
  %49 = icmp sle i32 0, %48
  %dynamic-slice.56.6.clone.1.start_idx2 = select i1 %49, i32 0, i32 %48
  %50 = add i32 %dynamic-slice.56.6.clone.1.start_idx0, 0
  %51 = add i32 %dynamic-slice.56.6.clone.1.start_idx1, %3
  %52 = add i32 %dynamic-slice.56.6.clone.1.start_idx2, 0
  %53 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg26, i32 0, i32 %50, i32 %51, i32 0
  %54 = load double, ptr %53, align 8, !invariant.load !182
  %55 = getelementptr double, ptr %arg32, i32 %linear_index
  %56 = getelementptr inbounds double, ptr %55, i32 0
  %57 = load double, ptr %56, align 8, !invariant.load !182
  %subtract.146.7.clone.1 = fsub double %54, %57
  %58 = load double, ptr %arg18, align 8, !invariant.load !182
  %multiply.3515.5.clone.1 = fmul double %subtract.146.7.clone.1, %58
  %59 = getelementptr double, ptr %arg34, i32 %linear_index
  %60 = getelementptr inbounds double, ptr %59, i32 0
  %61 = load double, ptr %60, align 8, !invariant.load !182
  %divide.863.1.clone.1 = fdiv double %multiply.3515.5.clone.1, %61
  %multiply.3516.17.clone.1 = fmul double %divide.863.1.clone.1, %58
  %multiply.3517.3.clone.1 = fmul double %divide.862.1.clone.1, %multiply.3516.17.clone.1
  %add.1038.3.clone.1 = fadd double %add.1031.21.clone.1, %multiply.3517.3.clone.1
  %62 = call double @llvm.fabs.f64(double %add.1038.3.clone.1)
  %63 = fcmp one double %62, 0x7FF0000000000000
  %64 = zext i1 %63 to i8
  %65 = call double @llvm.fabs.f64(double %add.1038.3.clone.1)
  %constant_783_1_clone_1 = load double, ptr @165, align 8
  %compare.376.1.clone.1 = fcmp olt double %65, %constant_783_1_clone_1
  %66 = zext i1 %compare.376.1.clone.1 to i8
  %67 = and i8 %64, %66
  %68 = getelementptr double, ptr %arg2, i32 %linear_index
  %69 = getelementptr inbounds double, ptr %68, i32 0
  %70 = load double, ptr %69, align 8, !invariant.load !182
  %71 = getelementptr double, ptr %arg0, i32 %linear_index
  %72 = getelementptr inbounds double, ptr %71, i32 0
  %73 = load double, ptr %72, align 8, !invariant.load !182
  %multiply.3522.3 = fmul double %70, %73
  %74 = getelementptr double, ptr %arg1, i32 %linear_index
  %75 = getelementptr inbounds double, ptr %74, i32 0
  %76 = load double, ptr %75, align 8, !invariant.load !182
  %multiply.3523.5 = fmul double %25, %76
  %add.1041.3 = fadd double %multiply.3522.3, %multiply.3523.5
  %77 = getelementptr double, ptr %arg8, i32 %linear_index
  %78 = getelementptr inbounds double, ptr %77, i32 0
  %79 = load double, ptr %78, align 8, !invariant.load !182
  %80 = getelementptr double, ptr %arg6, i32 %linear_index
  %81 = getelementptr inbounds double, ptr %80, i32 0
  %82 = load double, ptr %81, align 8, !invariant.load !182
  %83 = getelementptr double, ptr %arg7, i32 %linear_index
  %84 = getelementptr inbounds double, ptr %83, i32 0
  %85 = load double, ptr %84, align 8, !invariant.load !182
  %multiply.3518.38 = fmul double %82, %85
  %multiply.3525.21 = fmul double %79, %multiply.3518.38
  %constant_772_30 = load double, ptr @162, align 8
  %86 = getelementptr double, ptr %arg23, i32 %linear_index
  %87 = getelementptr inbounds double, ptr %86, i32 0
  %88 = load double, ptr %87, align 8
  %89 = getelementptr double, ptr %arg6, i32 %linear_index
  %90 = getelementptr inbounds double, ptr %89, i32 0
  %91 = load double, ptr %90, align 8, !invariant.load !182
  %add.1034.3.clone.1 = fadd double %88, %91
  %92 = getelementptr double, ptr %arg22, i32 %linear_index
  %93 = getelementptr inbounds double, ptr %92, i32 0
  %94 = load double, ptr %93, align 8, !invariant.load !182
  %multiply.3519.3.clone.1 = fmul double %add.1034.3.clone.1, %94
  %divide.864.3.clone.1 = fdiv double %constant_772_30, %multiply.3519.3.clone.1
  %95 = getelementptr double, ptr %arg7, i32 %linear_index
  %96 = getelementptr inbounds double, ptr %95, i32 0
  %97 = load double, ptr %96, align 8, !invariant.load !182
  %subtract.147.6.clone.1 = fsub double %add.1038.3.clone.1, %add.1031.21.clone.1
  %multiply.3520.2.clone.1 = fmul double %subtract.147.6.clone.1, %subtract.147.6.clone.1
  %multiply.3521.1.clone.1 = fmul double %97, %multiply.3520.2.clone.1
  %add.1039.1.clone.1 = fadd double %divide.864.3.clone.1, %multiply.3521.1.clone.1
  %constant_784_1_clone_1 = load double, ptr @166, align 8
  %add.1040.1.clone.1 = fadd double %add.1039.1.clone.1, %constant_784_1_clone_1
  %multiply.3526.2 = fmul double %multiply.3525.21, %add.1040.1.clone.1
  %98 = getelementptr double, ptr %arg9, i32 %linear_index
  %99 = getelementptr inbounds double, ptr %98, i32 0
  %100 = load double, ptr %99, align 8
  %divide.866.1.clone.1 = fdiv double %constant_772_30, %100
  %101 = getelementptr double, ptr %arg11, i32 %linear_index
  %102 = getelementptr inbounds double, ptr %101, i32 0
  %103 = load double, ptr %102, align 8, !invariant.load !182
  %104 = call double @__nv_exp(double %103)
  %multiply.3524.33.clone.1 = fmul double %25, %104
  %constant_774_5_clone_1 = load double, ptr @167, align 8
  %compare.377.5.clone.1 = fcmp ogt double %multiply.3524.33.clone.1, %constant_774_5_clone_1
  %105 = zext i1 %compare.377.5.clone.1 to i8
  %106 = getelementptr double, ptr %arg13, i32 %linear_index
  %107 = getelementptr inbounds double, ptr %106, i32 0
  %108 = load double, ptr %107, align 8, !invariant.load !182
  %109 = trunc i8 %105 to i1
  %110 = select i1 %109, double %multiply.3524.33.clone.1, double %108
  %add.1042.2.clone.1 = fadd double %divide.866.1.clone.1, %110
  %divide.867.1.clone.1 = fdiv double %constant_772_30, %add.1042.2.clone.1
  %constant_779_18 = load double, ptr @168, align 8
  %multiply.3527.13 = fmul double %divide.867.1.clone.1, %constant_779_18
  %divide.868.5 = fdiv double %constant_772_30, %multiply.3527.13
  %multiply.3528.3 = fmul double %multiply.3526.2, %divide.868.5
  %111 = getelementptr i64, ptr %arg3, i32 %linear_index
  %112 = getelementptr inbounds i64, ptr %111, i32 0
  %113 = load i64, ptr %112, align 8, !invariant.load !182
  %114 = sitofp i64 %113 to double
  %multiply.3529.3 = fmul double %multiply.3528.3, %114
  %add.1043.1 = fadd double %add.1041.3, %multiply.3529.3
  %115 = getelementptr double, ptr %arg0, i32 %linear_index
  %116 = getelementptr inbounds double, ptr %115, i32 0
  %117 = load double, ptr %116, align 8, !invariant.load !182
  %118 = trunc i8 %67 to i1
  %119 = select i1 %118, double %add.1043.1, double %117
  %120 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } undef, double %119, 0
  %121 = getelementptr i64, ptr %arg3, i32 %linear_index
  %122 = getelementptr inbounds i64, ptr %121, i32 0
  %123 = load i64, ptr %122, align 8, !invariant.load !182
  %constant_770_23 = load i64, ptr @163, align 8
  %124 = icmp ne i64 %123, %constant_770_23
  %125 = zext i1 %124 to i8
  %126 = zext i8 %125 to i32
  %constant_780_2_clone_1 = load i32, ptr @170, align 4
  %127 = icmp slt i32 %126, %constant_780_2_clone_1
  %128 = zext i1 %127 to i8
  %add.1044.5.clone.1 = fadd double %divide.866.1.clone.1, %multiply.3524.33.clone.1
  %divide.869.3.clone.1 = fdiv double %constant_772_30, %add.1044.5.clone.1
  %multiply.3530.5.clone.1 = fmul double %multiply.3525.21, %multiply.3525.21
  %constant_782_6_clone_1 = load double, ptr @169, align 8
  %multiply.3531.7.clone.1 = fmul double %multiply.3530.5.clone.1, %constant_782_6_clone_1
  %multiply.3532.5.clone.1 = fmul double %multiply.3530.5.clone.1, %add.1040.1.clone.1
  %add.1045.5.clone.1 = fadd double %multiply.3531.7.clone.1, %multiply.3532.5.clone.1
  %multiply.3533.15.clone.1 = fmul double %79, %79
  %multiply.3534.13.clone.1 = fmul double %multiply.3533.15.clone.1, %constant_782_6_clone_1
  %multiply.3535.5.clone.1 = fmul double %multiply.3534.13.clone.1, %multiply.3518.38
  %multiply.3536.5.clone.1 = fmul double %multiply.3535.5.clone.1, %add.1040.1.clone.1
  %subtract.148.5.clone.1 = fsub double %add.1045.5.clone.1, %multiply.3536.5.clone.1
  %multiply.3537.3.clone.1 = fmul double %subtract.148.5.clone.1, %114
  %add.1046.3.clone.1 = fadd double %divide.867.1.clone.1, %multiply.3537.3.clone.1
  %compare.380.5.clone.1 = fcmp ogt double %add.1046.3.clone.1, %constant_774_5_clone_1
  %129 = zext i1 %compare.380.5.clone.1 to i8
  %130 = getelementptr double, ptr %arg10, i32 %linear_index
  %131 = getelementptr inbounds double, ptr %130, i32 0
  %132 = load double, ptr %131, align 8, !invariant.load !182
  %133 = trunc i8 %129 to i1
  %134 = select i1 %133, double %add.1046.3.clone.1, double %132
  %135 = trunc i8 %128 to i1
  %136 = select i1 %135, double %divide.869.3.clone.1, double %134
  %137 = getelementptr double, ptr %arg9, i32 %linear_index
  %138 = getelementptr inbounds double, ptr %137, i32 0
  %139 = load double, ptr %138, align 8
  %140 = trunc i8 %67 to i1
  %141 = select i1 %140, double %136, double %139
  %142 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %120, double %141, 1
  %multiply.3538.1.clone.1 = fmul double %110, %divide.867.1.clone.1
  %143 = getelementptr double, ptr %arg12, i32 %linear_index
  %144 = getelementptr inbounds double, ptr %143, i32 0
  %145 = load double, ptr %144, align 8
  %146 = trunc i8 %67 to i1
  %147 = select i1 %146, double %multiply.3538.1.clone.1, double %145
  %148 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %142, double %147, 2
  %multiply.3571.2.clone.1 = fmul double %multiply.3527.13, %multiply.3527.13
  %divide.878.1.clone.1 = fdiv double %constant_772_30, %multiply.3571.2.clone.1
  %149 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %148, double %divide.878.1.clone.1, 3
  %150 = getelementptr double, ptr %arg14, i32 %linear_index
  %151 = getelementptr inbounds double, ptr %150, i32 0
  %152 = load double, ptr %151, align 8
  %153 = trunc i8 %67 to i1
  %154 = select i1 %153, double %divide.867.1.clone.1, double %152
  %155 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %149, double %154, 4
  %156 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %155, double %divide.867.1.clone.1, 5
  %multiply.3563.2.clone.1 = fmul double %add.1042.2.clone.1, %add.1042.2.clone.1
  %divide.877.1.clone.1 = fdiv double %constant_772_30, %multiply.3563.2.clone.1
  %157 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %156, double %divide.877.1.clone.1, 6
  %158 = getelementptr double, ptr %arg15, i32 %linear_index
  %159 = getelementptr inbounds double, ptr %158, i32 0
  %160 = load double, ptr %159, align 8
  %161 = trunc i8 %67 to i1
  %162 = select i1 %161, double %divide.866.1.clone.1, double %160
  %163 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %157, double %162, 7
  %164 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %163, double %divide.866.1.clone.1, 8
  %165 = getelementptr double, ptr %arg9, i32 %linear_index
  %166 = getelementptr inbounds double, ptr %165, i32 0
  %167 = load double, ptr %166, align 8
  %168 = getelementptr double, ptr %arg9, i32 %linear_index
  %169 = getelementptr inbounds double, ptr %168, i32 0
  %170 = load double, ptr %169, align 8
  %multiply.3559.2.clone.1 = fmul double %167, %170
  %divide.876.1.clone.1 = fdiv double %constant_772_30, %multiply.3559.2.clone.1
  %171 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %164, double %divide.876.1.clone.1, 9
  %172 = getelementptr double, ptr %arg16, i32 %linear_index
  %173 = getelementptr inbounds double, ptr %172, i32 0
  %174 = load double, ptr %173, align 8
  %175 = trunc i8 %67 to i1
  %176 = select i1 %175, double %add.1041.3, double %174
  %177 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %171, double %176, 10
  %178 = getelementptr double, ptr %arg17, i32 %linear_index
  %179 = getelementptr inbounds double, ptr %178, i32 0
  %180 = load double, ptr %179, align 8
  %181 = trunc i8 %67 to i1
  %182 = select i1 %181, double %add.1040.1.clone.1, double %180
  %183 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %177, double %182, 11
  %184 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %183, double %add.1040.1.clone.1, 12
  %185 = getelementptr double, ptr %arg24, i32 %linear_index
  %186 = getelementptr inbounds double, ptr %185, i32 0
  %187 = load double, ptr %186, align 8
  %188 = trunc i8 %67 to i1
  %189 = select i1 %188, double %25, double %187
  %190 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %184, double %189, 13
  %191 = getelementptr double, ptr %arg25, i32 %linear_index
  %192 = getelementptr inbounds double, ptr %191, i32 0
  %193 = load double, ptr %192, align 8
  %194 = trunc i8 %67 to i1
  %195 = select i1 %194, double %54, double %193
  %196 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %190, double %195, 14
  %197 = trunc i64 %18 to i32
  %198 = icmp sge i32 0, %197
  %199 = select i1 %198, i32 0, i32 %197
  %200 = icmp sle i32 191, %199
  %dynamic-slice.55.3.clone.1.start_idx0 = select i1 %200, i32 191, i32 %199
  %201 = add i32 %dynamic-slice.55.3.clone.1.start_idx0, 0
  %202 = getelementptr inbounds [192 x i32], ptr %arg28, i32 0, i32 %201
  %203 = load i32, ptr %202, align 4, !invariant.load !182
  %204 = getelementptr i32, ptr %arg27, i32 %linear_index
  %205 = getelementptr inbounds i32, ptr %204, i32 0
  %206 = load i32, ptr %205, align 4
  %207 = trunc i8 %67 to i1
  %208 = select i1 %207, i32 %203, i32 %206
  %209 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %196, i32 %208, 15
  %210 = getelementptr double, ptr %arg29, i32 %linear_index
  %211 = getelementptr inbounds double, ptr %210, i32 0
  %212 = load double, ptr %211, align 8
  %213 = trunc i8 %67 to i1
  %214 = select i1 %213, double %add.1031.21.clone.1, double %212
  %215 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %209, double %214, 16
  %216 = getelementptr double, ptr %arg21, i32 %linear_index
  %217 = getelementptr inbounds double, ptr %216, i32 0
  %218 = load double, ptr %217, align 8, !invariant.load !182
  %219 = trunc i8 %67 to i1
  %220 = select i1 %219, double %add.1038.3.clone.1, double %218
  %221 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %215, double %220, 17
  %222 = getelementptr double, ptr %arg30, i32 %linear_index
  %223 = getelementptr inbounds double, ptr %222, i32 0
  %224 = load double, ptr %223, align 8
  %225 = trunc i8 %67 to i1
  %226 = select i1 %225, double %multiply.3518.38, double %224
  %227 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %221, double %226, 18
  %228 = getelementptr double, ptr %arg31, i32 %linear_index
  %229 = getelementptr inbounds double, ptr %228, i32 0
  %230 = load double, ptr %229, align 8
  %231 = trunc i8 %67 to i1
  %232 = select i1 %231, double %subtract.147.6.clone.1, double %230
  %233 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %227, double %232, 19
  %234 = getelementptr double, ptr %arg32, i32 %linear_index
  %235 = getelementptr inbounds double, ptr %234, i32 0
  %236 = load double, ptr %235, align 8, !invariant.load !182
  %237 = getelementptr double, ptr %arg33, i32 %linear_index
  %238 = getelementptr inbounds double, ptr %237, i32 0
  %239 = load double, ptr %238, align 8
  %240 = trunc i8 %67 to i1
  %241 = select i1 %240, double %236, double %239
  %242 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %233, double %241, 20
  %243 = getelementptr double, ptr %arg34, i32 %linear_index
  %244 = getelementptr inbounds double, ptr %243, i32 0
  %245 = load double, ptr %244, align 8, !invariant.load !182
  %246 = getelementptr double, ptr %arg35, i32 %linear_index
  %247 = getelementptr inbounds double, ptr %246, i32 0
  %248 = load double, ptr %247, align 8
  %249 = trunc i8 %67 to i1
  %250 = select i1 %249, double %245, double %248
  %251 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %242, double %250, 21
  %252 = getelementptr double, ptr %arg34, i32 %linear_index
  %253 = getelementptr inbounds double, ptr %252, i32 0
  %254 = load double, ptr %253, align 8, !invariant.load !182
  %255 = getelementptr double, ptr %arg36, i32 %linear_index
  %256 = getelementptr inbounds double, ptr %255, i32 0
  %257 = load double, ptr %256, align 8
  %258 = trunc i8 %67 to i1
  %259 = select i1 %258, double %254, double %257
  %260 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %251, double %259, 22
  %261 = getelementptr double, ptr %arg37, i32 %linear_index
  %262 = getelementptr inbounds double, ptr %261, i32 0
  %263 = load double, ptr %262, align 8
  %264 = trunc i8 %67 to i1
  %265 = select i1 %264, double %divide.863.1.clone.1, double %263
  %266 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %260, double %265, 23
  %267 = getelementptr double, ptr %arg7, i32 %linear_index
  %268 = getelementptr inbounds double, ptr %267, i32 0
  %269 = load double, ptr %268, align 8, !invariant.load !182
  %270 = getelementptr double, ptr %arg38, i32 %linear_index
  %271 = getelementptr inbounds double, ptr %270, i32 0
  %272 = load double, ptr %271, align 8
  %273 = trunc i8 %67 to i1
  %274 = select i1 %273, double %269, double %272
  %275 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %266, double %274, 24
  %276 = getelementptr double, ptr %arg22, i32 %linear_index
  %277 = getelementptr inbounds double, ptr %276, i32 0
  %278 = load double, ptr %277, align 8, !invariant.load !182
  %279 = getelementptr double, ptr %arg39, i32 %linear_index
  %280 = getelementptr inbounds double, ptr %279, i32 0
  %281 = load double, ptr %280, align 8
  %282 = trunc i8 %67 to i1
  %283 = select i1 %282, double %278, double %281
  %284 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %275, double %283, 25
  %285 = getelementptr double, ptr %arg23, i32 %linear_index
  %286 = getelementptr inbounds double, ptr %285, i32 0
  %287 = load double, ptr %286, align 8
  %288 = getelementptr double, ptr %arg40, i32 %linear_index
  %289 = getelementptr inbounds double, ptr %288, i32 0
  %290 = load double, ptr %289, align 8
  %291 = trunc i8 %67 to i1
  %292 = select i1 %291, double %287, double %290
  %293 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %284, double %292, 26
  %294 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %293, i8 %67, 27
  %295 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %294, double %divide.863.1.clone.1, 28
  %296 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %295, double %divide.862.1.clone.1, 29
  %297 = getelementptr double, ptr %arg22, i32 %linear_index
  %298 = getelementptr inbounds double, ptr %297, i32 0
  %299 = load double, ptr %298, align 8, !invariant.load !182
  %300 = getelementptr double, ptr %arg22, i32 %linear_index
  %301 = getelementptr inbounds double, ptr %300, i32 0
  %302 = load double, ptr %301, align 8, !invariant.load !182
  %multiply.3545.2.clone.1 = fmul double %299, %302
  %divide.874.1.clone.1 = fdiv double %constant_772_30, %multiply.3545.2.clone.1
  %303 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %296, double %divide.874.1.clone.1, 30
  %304 = getelementptr double, ptr %arg34, i32 %linear_index
  %305 = getelementptr inbounds double, ptr %304, i32 0
  %306 = load double, ptr %305, align 8, !invariant.load !182
  %307 = getelementptr double, ptr %arg34, i32 %linear_index
  %308 = getelementptr inbounds double, ptr %307, i32 0
  %309 = load double, ptr %308, align 8, !invariant.load !182
  %multiply.3541.2.clone.1 = fmul double %306, %309
  %divide.871.1.clone.1 = fdiv double %constant_772_30, %multiply.3541.2.clone.1
  %310 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %303, double %divide.871.1.clone.1, 31
  %311 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 0
  %312 = getelementptr double, ptr %arg42, i32 %linear_index
  %313 = getelementptr inbounds double, ptr %312, i32 0
  store double %311, ptr %313, align 8
  %314 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 1
  %315 = getelementptr double, ptr %arg9, i32 %linear_index
  %316 = getelementptr inbounds double, ptr %315, i32 0
  store double %314, ptr %316, align 8
  %317 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 2
  %318 = getelementptr double, ptr %arg12, i32 %linear_index
  %319 = getelementptr inbounds double, ptr %318, i32 0
  store double %317, ptr %319, align 8
  %320 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 3
  %321 = getelementptr double, ptr %arg43, i32 %linear_index
  %322 = getelementptr inbounds double, ptr %321, i32 0
  store double %320, ptr %322, align 8
  %323 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 4
  %324 = getelementptr double, ptr %arg14, i32 %linear_index
  %325 = getelementptr inbounds double, ptr %324, i32 0
  store double %323, ptr %325, align 8
  %326 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 5
  %327 = getelementptr double, ptr %arg44, i32 %linear_index
  %328 = getelementptr inbounds double, ptr %327, i32 0
  store double %326, ptr %328, align 8
  %329 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 6
  %330 = getelementptr double, ptr %arg45, i32 %linear_index
  %331 = getelementptr inbounds double, ptr %330, i32 0
  store double %329, ptr %331, align 8
  %332 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 7
  %333 = getelementptr double, ptr %arg15, i32 %linear_index
  %334 = getelementptr inbounds double, ptr %333, i32 0
  store double %332, ptr %334, align 8
  %335 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 8
  %336 = getelementptr double, ptr %arg46, i32 %linear_index
  %337 = getelementptr inbounds double, ptr %336, i32 0
  store double %335, ptr %337, align 8
  %338 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 9
  %339 = getelementptr double, ptr %arg47, i32 %linear_index
  %340 = getelementptr inbounds double, ptr %339, i32 0
  store double %338, ptr %340, align 8
  %341 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 10
  %342 = getelementptr double, ptr %arg16, i32 %linear_index
  %343 = getelementptr inbounds double, ptr %342, i32 0
  store double %341, ptr %343, align 8
  %344 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 11
  %345 = getelementptr double, ptr %arg17, i32 %linear_index
  %346 = getelementptr inbounds double, ptr %345, i32 0
  store double %344, ptr %346, align 8
  %347 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 12
  %348 = getelementptr double, ptr %arg23, i32 %linear_index
  %349 = getelementptr inbounds double, ptr %348, i32 0
  store double %347, ptr %349, align 8
  %350 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 13
  %351 = getelementptr double, ptr %arg24, i32 %linear_index
  %352 = getelementptr inbounds double, ptr %351, i32 0
  store double %350, ptr %352, align 8
  %353 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 14
  %354 = getelementptr double, ptr %arg25, i32 %linear_index
  %355 = getelementptr inbounds double, ptr %354, i32 0
  store double %353, ptr %355, align 8
  %356 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 15
  %357 = getelementptr i32, ptr %arg27, i32 %linear_index
  %358 = getelementptr inbounds i32, ptr %357, i32 0
  store i32 %356, ptr %358, align 4
  %359 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 16
  %360 = getelementptr double, ptr %arg29, i32 %linear_index
  %361 = getelementptr inbounds double, ptr %360, i32 0
  store double %359, ptr %361, align 8
  %362 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 17
  %363 = getelementptr double, ptr %arg48, i32 %linear_index
  %364 = getelementptr inbounds double, ptr %363, i32 0
  store double %362, ptr %364, align 8
  %365 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 18
  %366 = getelementptr double, ptr %arg30, i32 %linear_index
  %367 = getelementptr inbounds double, ptr %366, i32 0
  store double %365, ptr %367, align 8
  %368 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 19
  %369 = getelementptr double, ptr %arg31, i32 %linear_index
  %370 = getelementptr inbounds double, ptr %369, i32 0
  store double %368, ptr %370, align 8
  %371 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 20
  %372 = getelementptr double, ptr %arg33, i32 %linear_index
  %373 = getelementptr inbounds double, ptr %372, i32 0
  store double %371, ptr %373, align 8
  %374 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 21
  %375 = getelementptr double, ptr %arg35, i32 %linear_index
  %376 = getelementptr inbounds double, ptr %375, i32 0
  store double %374, ptr %376, align 8
  %377 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 22
  %378 = getelementptr double, ptr %arg36, i32 %linear_index
  %379 = getelementptr inbounds double, ptr %378, i32 0
  store double %377, ptr %379, align 8
  %380 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 23
  %381 = getelementptr double, ptr %arg37, i32 %linear_index
  %382 = getelementptr inbounds double, ptr %381, i32 0
  store double %380, ptr %382, align 8
  %383 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 24
  %384 = getelementptr double, ptr %arg38, i32 %linear_index
  %385 = getelementptr inbounds double, ptr %384, i32 0
  store double %383, ptr %385, align 8
  %386 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 25
  %387 = getelementptr double, ptr %arg39, i32 %linear_index
  %388 = getelementptr inbounds double, ptr %387, i32 0
  store double %386, ptr %388, align 8
  %389 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 26
  %390 = getelementptr double, ptr %arg40, i32 %linear_index
  %391 = getelementptr inbounds double, ptr %390, i32 0
  store double %389, ptr %391, align 8
  %392 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 27
  %393 = getelementptr i8, ptr %arg49, i32 %linear_index
  %394 = getelementptr inbounds i8, ptr %393, i32 0
  store i8 %392, ptr %394, align 1
  %395 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 28
  %396 = getelementptr double, ptr %arg50, i32 %linear_index
  %397 = getelementptr inbounds double, ptr %396, i32 0
  store double %395, ptr %397, align 8
  %398 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 29
  %399 = getelementptr double, ptr %arg51, i32 %linear_index
  %400 = getelementptr inbounds double, ptr %399, i32 0
  store double %398, ptr %400, align 8
  %401 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 30
  %402 = getelementptr double, ptr %arg52, i32 %linear_index
  %403 = getelementptr inbounds double, ptr %402, i32 0
  store double %401, ptr %403, align 8
  %404 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, double, i8, double, double, double, double } %310, 31
  %405 = getelementptr double, ptr %arg53, i32 %linear_index
  %406 = getelementptr inbounds double, ptr %405, i32 0
  store double %404, ptr %406, align 8
  br label %loop_add_and_divide_select_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #0

define void @loop_dynamic_update_slice_fusion_40(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1332 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_99 = load i64, ptr @172, align 8
  %0 = icmp slt i64 %param_2.1332, %constant_770_99
  %1 = zext i1 %0 to i8
  %param_2.13321 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_78 = load i64, ptr @171, align 8
  %2 = add i64 %param_2.13321, %constant_769_78
  %param_2.13322 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13322
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_993 = load i64, ptr @172, align 8
  %9 = icmp sge i64 0, %constant_770_993
  %10 = select i1 %9, i64 0, i64 %constant_770_993
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_994 = load i64, ptr @172, align 8
  %13 = icmp sge i64 0, %constant_770_994
  %14 = select i1 %13, i64 0, i64 %constant_770_994
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 4
  %24 = udiv i64 %linear_index0, 4
  %25 = icmp ult i64 %linear_index, 4
  br i1 %25, label %dynamic-update-slice.2085.1.in_bounds-true, label %dynamic-update-slice.2085.1.in_bounds-after

dynamic-update-slice.2085.1.in_bounds-after:      ; preds = %dynamic-update-slice.2085.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2085.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i8, ptr %arg1, i64 %linear_index
  %param_1.1541 = getelementptr inbounds i8, ptr %29, i64 0
  %param_1.15415 = load i8, ptr %param_1.1541, align 1, !invariant.load !182
  %30 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %param_1.15415, ptr %30, align 1
  br label %dynamic-update-slice.2085.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_42(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 16 dereferenceable(32) %arg7) {
entry:
  %param_6.604 = load i64, ptr %arg6, align 8, !invariant.load !182
  %constant_770_84 = load i64, ptr @176, align 8
  %0 = icmp slt i64 %param_6.604, %constant_770_84
  %1 = zext i1 %0 to i8
  %param_6.6041 = load i64, ptr %arg6, align 8, !invariant.load !182
  %constant_769_76 = load i64, ptr @175, align 8
  %2 = add i64 %param_6.6041, %constant_769_76
  %param_6.6042 = load i64, ptr %arg6, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_6.6042
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_843 = load i64, ptr @176, align 8
  %9 = icmp sge i64 0, %constant_770_843
  %10 = select i1 %9, i64 0, i64 %constant_770_843
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2083.1.in_bounds-true, label %dynamic-update-slice.2083.1.in_bounds-after

dynamic-update-slice.2083.1.in_bounds-after:      ; preds = %dynamic-update-slice.2083.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2083.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1553 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15534 = load double, ptr %param_1.1553, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.503 = getelementptr inbounds double, ptr %23, i64 0
  %param_7.5035 = load double, ptr %param_7.503, align 8, !invariant.load !182
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.982 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.9826 = load double, ptr %param_4.982, align 8, !invariant.load !182
  %25 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.863 = getelementptr inbounds double, ptr %25, i64 0
  %param_5.8637 = load double, ptr %param_5.863, align 8, !invariant.load !182
  %multiply.3518.34 = fmul double %param_4.9826, %param_5.8637
  %multiply.3525.17 = fmul double %param_7.5035, %multiply.3518.34
  %multiply.3530.7 = fmul double %multiply.3525.17, %multiply.3525.17
  %constant_782_4 = load double, ptr @174, align 8
  %multiply.3531.9 = fmul double %multiply.3530.7, %constant_782_4
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1142 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.11428 = load double, ptr %param_3.1142, align 8, !invariant.load !182
  %multiply.3532.7 = fmul double %multiply.3530.7, %param_3.11428
  %add.1045.7 = fadd double %multiply.3531.9, %multiply.3532.7
  %multiply.3533.13 = fmul double %param_7.5035, %param_7.5035
  %multiply.3534.11 = fmul double %multiply.3533.13, %constant_782_4
  %multiply.3535.7 = fmul double %multiply.3534.11, %multiply.3518.34
  %27 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11429 = getelementptr inbounds double, ptr %27, i64 0
  %param_3.114210 = load double, ptr %param_3.11429, align 8, !invariant.load !182
  %multiply.3536.7 = fmul double %multiply.3535.7, %param_3.114210
  %subtract.148.7 = fsub double %add.1045.7, %multiply.3536.7
  %28 = getelementptr i64, ptr %arg2, i64 %linear_index
  %param_2.1345 = getelementptr inbounds i64, ptr %28, i64 0
  %param_2.134511 = load i64, ptr %param_2.1345, align 8, !invariant.load !182
  %29 = sitofp i64 %param_2.134511 to double
  %multiply.3537.5 = fmul double %subtract.148.7, %29
  %add.1046.5 = fadd double %param_1.15534, %multiply.3537.5
  %constant_774_1 = load double, ptr @173, align 8
  %compare.380.7 = fcmp ogt double %add.1046.5, %constant_774_1
  %30 = zext i1 %compare.380.7 to i8
  %31 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %30, ptr %31, align 1
  br label %dynamic-update-slice.2083.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_50(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4) {
entry:
  %param_1.1471 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_29 = load i64, ptr @178, align 8
  %0 = icmp slt i64 %param_1.1471, %constant_770_29
  %1 = zext i1 %0 to i8
  %param_1.14711 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_63 = load i64, ptr @177, align 8
  %2 = add i64 %param_1.14711, %constant_769_63
  %param_1.14712 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14712
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_293 = load i64, ptr @178, align 8
  %9 = icmp sge i64 0, %constant_770_293
  %10 = select i1 %9, i64 0, i64 %constant_770_293
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2075.1.in_bounds-true, label %dynamic-update-slice.2075.1.in_bounds-after

dynamic-update-slice.2075.1.in_bounds-after:      ; preds = %dynamic-update-slice.2075.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2075.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_772_32 = load double, ptr @179, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1262 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.12624 = load double, ptr %param_2.1262, align 8, !invariant.load !182
  %param_1.14715 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_296 = load i64, ptr @178, align 8
  %23 = icmp slt i64 %param_1.14715, %constant_770_296
  %24 = zext i1 %23 to i8
  %param_1.14717 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_638 = load i64, ptr @177, align 8
  %25 = add i64 %param_1.14717, %constant_769_638
  %param_1.14719 = load i64, ptr %arg1, align 8, !invariant.load !182
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_1.14719
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.54.64.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.54.64.start_idx0, 0
  %param_4.898 = getelementptr inbounds [192 x double], ptr %arg4, i64 0, i64 %31
  %param_4.89810 = load double, ptr %param_4.898, align 8, !invariant.load !182
  %32 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1090 = getelementptr inbounds double, ptr %32, i64 0
  %param_3.109011 = load double, ptr %param_3.1090, align 8, !invariant.load !182
  %33 = call double @__nv_exp(double %param_3.109011)
  %multiply.3524.27 = fmul double %param_4.89810, %33
  %add.1044.9 = fadd double %param_2.12624, %multiply.3524.27
  %multiply.3578.6 = fmul double %add.1044.9, %add.1044.9
  %divide.879.3 = fdiv double %constant_772_32, %multiply.3578.6
  %34 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.879.3, ptr %34, align 8
  br label %dynamic-update-slice.2075.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_57(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %param_1.1542 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_100 = load i64, ptr @183, align 8
  %0 = icmp slt i64 %param_1.1542, %constant_770_100
  %1 = zext i1 %0 to i8
  %param_1.15421 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_53 = load i64, ptr @182, align 8
  %2 = add i64 %param_1.15421, %constant_769_53
  %param_1.15422 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15422
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_1003 = load i64, ptr @183, align 8
  %9 = icmp sge i64 0, %constant_770_1003
  %10 = select i1 %9, i64 0, i64 %constant_770_1003
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2067.1.in_bounds-true, label %dynamic-update-slice.2067.1.in_bounds-after

dynamic-update-slice.2067.1.in_bounds-after:      ; preds = %dynamic-update-slice.2067.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2067.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_772_12 = load double, ptr @181, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1333 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.13334 = load double, ptr %param_2.1333, align 8, !invariant.load !182
  %constant_779_12 = load double, ptr @180, align 8
  %multiply.3527.15 = fmul double %param_2.13334, %constant_779_12
  %divide.868.7 = fdiv double %constant_772_12, %multiply.3527.15
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.868.7, ptr %23, align 8
  br label %dynamic-update-slice.2067.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_56(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(32) %arg5) {
entry:
  %param_2.1335 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_102 = load i64, ptr @185, align 8
  %0 = icmp slt i64 %param_2.1335, %constant_770_102
  %1 = zext i1 %0 to i8
  %param_2.13351 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_54 = load i64, ptr @184, align 8
  %2 = add i64 %param_2.13351, %constant_769_54
  %param_2.13352 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13352
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_1023 = load i64, ptr @185, align 8
  %9 = icmp sge i64 0, %constant_770_1023
  %10 = select i1 %9, i64 0, i64 %constant_770_1023
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2068.1.in_bounds-true, label %dynamic-update-slice.2068.1.in_bounds-after

dynamic-update-slice.2068.1.in_bounds-after:      ; preds = %dynamic-update-slice.2068.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2068.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.813 = getelementptr inbounds double, ptr %22, i64 0
  %param_5.8134 = load double, ptr %param_5.813, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1132 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11325 = load double, ptr %param_3.1132, align 8, !invariant.load !182
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.930 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.9306 = load double, ptr %param_4.930, align 8, !invariant.load !182
  %multiply.3518.22 = fmul double %param_3.11325, %param_4.9306
  %multiply.3525.5 = fmul double %param_5.8134, %multiply.3518.22
  %25 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1544 = getelementptr inbounds double, ptr %25, i64 0
  %param_1.15447 = load double, ptr %param_1.1544, align 8, !invariant.load !182
  %multiply.3526.3 = fmul double %multiply.3525.5, %param_1.15447
  %26 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3526.3, ptr %26, align 8
  br label %dynamic-update-slice.2068.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_63(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(1536) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8) {
entry:
  %param_4.923 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_770_88 = load i64, ptr @187, align 8
  %0 = icmp slt i64 %param_4.923, %constant_770_88
  %1 = zext i1 %0 to i8
  %param_4.9231 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_769_47 = load i64, ptr @186, align 8
  %2 = add i64 %param_4.9231, %constant_769_47
  %param_4.9232 = load i64, ptr %arg4, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.9232
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_883 = load i64, ptr @187, align 8
  %9 = icmp sge i64 0, %constant_770_883
  %10 = select i1 %9, i64 0, i64 %constant_770_883
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2061.1.in_bounds-true, label %dynamic-update-slice.2061.1.in_bounds-after

dynamic-update-slice.2061.1.in_bounds-after:      ; preds = %dynamic-update-slice.2061.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2061.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.451 = getelementptr inbounds double, ptr %22, i64 0
  %param_7.4514 = load double, ptr %param_7.451, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.374 = getelementptr inbounds double, ptr %23, i64 0
  %param_8.3745 = load double, ptr %param_8.374, align 8, !invariant.load !182
  %multiply.3498.11 = fmul double %param_7.4514, %param_8.3745
  %param_4.9236 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_770_887 = load i64, ptr @187, align 8
  %24 = icmp slt i64 %param_4.9236, %constant_770_887
  %25 = zext i1 %24 to i8
  %param_4.9238 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_769_479 = load i64, ptr @186, align 8
  %26 = add i64 %param_4.9238, %constant_769_479
  %param_4.92310 = load i64, ptr %arg4, align 8, !invariant.load !182
  %27 = trunc i8 %25 to i1
  %28 = select i1 %27, i64 %26, i64 %param_4.92310
  %29 = icmp sge i64 0, %28
  %30 = select i1 %29, i64 0, i64 %28
  %31 = icmp sle i64 191, %30
  %dynamic-slice.54.40.start_idx0 = select i1 %31, i64 191, i64 %30
  %32 = add i64 %dynamic-slice.54.40.start_idx0, 0
  %param_6.554 = getelementptr inbounds [192 x double], ptr %arg6, i64 0, i64 %32
  %param_6.55411 = load double, ptr %param_6.554, align 8, !invariant.load !182
  %33 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.808 = getelementptr inbounds double, ptr %33, i64 0
  %param_5.80812 = load double, ptr %param_5.808, align 8, !invariant.load !182
  %multiply.3499.13 = fmul double %param_6.55411, %param_5.80812
  %add.1031.11 = fadd double %multiply.3498.11, %multiply.3499.13
  %34 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1530 = getelementptr inbounds double, ptr %34, i64 0
  %param_1.153013 = load double, ptr %param_1.1530, align 8, !invariant.load !182
  %35 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1321 = getelementptr inbounds double, ptr %35, i64 0
  %param_2.132114 = load double, ptr %param_2.1321, align 8, !invariant.load !182
  %param_3.1123 = load double, ptr %arg3, align 8, !invariant.load !182
  %multiply.3516.23 = fmul double %param_2.132114, %param_3.1123
  %multiply.3517.9 = fmul double %param_1.153013, %multiply.3516.23
  %add.1038.9 = fadd double %add.1031.11, %multiply.3517.9
  %subtract.147.1 = fsub double %add.1038.9, %add.1031.11
  %multiply.3520.3 = fmul double %subtract.147.1, %subtract.147.1
  %36 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3520.3, ptr %36, align 8
  br label %dynamic-update-slice.2061.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_62(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(1536) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8) {
entry:
  %param_4.971 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_770_90 = load i64, ptr @190, align 8
  %0 = icmp slt i64 %param_4.971, %constant_770_90
  %1 = zext i1 %0 to i8
  %param_4.9711 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_769_48 = load i64, ptr @189, align 8
  %2 = add i64 %param_4.9711, %constant_769_48
  %param_4.9712 = load i64, ptr %arg4, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.9712
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_903 = load i64, ptr @190, align 8
  %9 = icmp sge i64 0, %constant_770_903
  %10 = select i1 %9, i64 0, i64 %constant_770_903
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2062.1.in_bounds-true, label %dynamic-update-slice.2062.1.in_bounds-after

dynamic-update-slice.2062.1.in_bounds-after:      ; preds = %dynamic-update-slice.2062.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2062.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.490 = getelementptr inbounds double, ptr %22, i64 0
  %param_7.4904 = load double, ptr %param_7.490, align 8, !invariant.load !182
  %23 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.414 = getelementptr inbounds double, ptr %23, i64 0
  %param_8.4145 = load double, ptr %param_8.414, align 8, !invariant.load !182
  %multiply.3498.17 = fmul double %param_7.4904, %param_8.4145
  %param_4.9716 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_770_907 = load i64, ptr @190, align 8
  %24 = icmp slt i64 %param_4.9716, %constant_770_907
  %25 = zext i1 %24 to i8
  %param_4.9718 = load i64, ptr %arg4, align 8, !invariant.load !182
  %constant_769_489 = load i64, ptr @189, align 8
  %26 = add i64 %param_4.9718, %constant_769_489
  %param_4.97110 = load i64, ptr %arg4, align 8, !invariant.load !182
  %27 = trunc i8 %25 to i1
  %28 = select i1 %27, i64 %26, i64 %param_4.97110
  %29 = icmp sge i64 0, %28
  %30 = select i1 %29, i64 0, i64 %28
  %31 = icmp sle i64 191, %30
  %dynamic-slice.54.46.start_idx0 = select i1 %31, i64 191, i64 %30
  %32 = add i64 %dynamic-slice.54.46.start_idx0, 0
  %param_6.595 = getelementptr inbounds [192 x double], ptr %arg6, i64 0, i64 %32
  %param_6.59511 = load double, ptr %param_6.595, align 8, !invariant.load !182
  %33 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.854 = getelementptr inbounds double, ptr %33, i64 0
  %param_5.85412 = load double, ptr %param_5.854, align 8, !invariant.load !182
  %multiply.3499.19 = fmul double %param_6.59511, %param_5.85412
  %add.1031.17 = fadd double %multiply.3498.17, %multiply.3499.19
  %34 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1562 = getelementptr inbounds double, ptr %34, i64 0
  %param_1.156213 = load double, ptr %param_1.1562, align 8, !invariant.load !182
  %35 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1366 = getelementptr inbounds double, ptr %35, i64 0
  %param_2.136614 = load double, ptr %param_2.1366, align 8, !invariant.load !182
  %param_3.1172 = load double, ptr %arg3, align 8, !invariant.load !182
  %multiply.3516.29 = fmul double %param_2.136614, %param_3.1172
  %multiply.3517.15 = fmul double %param_1.156213, %multiply.3516.29
  %add.1038.15 = fadd double %add.1031.17, %multiply.3517.15
  %subtract.147.4 = fsub double %add.1038.15, %add.1031.17
  %constant_779_10 = load double, ptr @188, align 8
  %multiply.3555.3 = fmul double %subtract.147.4, %constant_779_10
  %36 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3555.3, ptr %36, align 8
  br label %dynamic-update-slice.2062.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_65(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.1118 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_770_81 = load i64, ptr @192, align 8
  %0 = icmp slt i64 %param_3.1118, %constant_770_81
  %1 = zext i1 %0 to i8
  %param_3.11181 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_769_43 = load i64, ptr @191, align 8
  %2 = add i64 %param_3.11181, %constant_769_43
  %param_3.11182 = load i64, ptr %arg3, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11182
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_813 = load i64, ptr @192, align 8
  %9 = icmp sge i64 0, %constant_770_813
  %10 = select i1 %9, i64 0, i64 %constant_770_813
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !186
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.2059.1.in_bounds-true, label %dynamic-update-slice.2059.1.in_bounds-after

dynamic-update-slice.2059.1.in_bounds-after:      ; preds = %dynamic-update-slice.2059.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2059.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1523 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15234 = load double, ptr %param_1.1523, align 8, !invariant.load !182
  %param_2.1314 = load double, ptr %arg2, align 8, !invariant.load !182
  %multiply.3516.7 = fmul double %param_1.15234, %param_2.1314
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3516.7, ptr %23, align 8
  br label %dynamic-update-slice.2059.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_10(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(768) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(768) %arg7, ptr noalias align 16 dereferenceable(1536) %arg8) {
entry:
  %param_2.1368 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_63 = load i64, ptr @196, align 8
  %0 = icmp slt i64 %param_2.1368, %constant_770_63
  %1 = zext i1 %0 to i8
  %param_2.13681 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_95 = load i64, ptr @195, align 8
  %2 = add i64 %param_2.13681, %constant_769_95
  %param_2.13682 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13682
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_633 = load i64, ptr @196, align 8
  %9 = icmp sge i64 0, %constant_770_633
  %10 = select i1 %9, i64 0, i64 %constant_770_633
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_634 = load i64, ptr @196, align 8
  %13 = icmp sge i64 0, %constant_770_634
  %14 = select i1 %13, i64 0, i64 %constant_770_634
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2116.1.in_bounds-true, label %dynamic-update-slice.2116.1.in_bounds-after

dynamic-update-slice.2116.1.in_bounds-after:      ; preds = %dynamic-update-slice.2116.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2116.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.492 = getelementptr inbounds double, ptr %29, i64 0
  %param_7.4925 = load double, ptr %param_7.492, align 8, !invariant.load !182
  %30 = fneg double %param_7.4925
  %param_6.597 = getelementptr inbounds [4 x double], ptr %arg6, i64 0, i64 %21
  %param_6.5976 = load double, ptr %param_6.597, align 8, !invariant.load !182
  %multiply.3560.23 = fmul double %30, %param_6.5976
  %param_2.13687 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_638 = load i64, ptr @196, align 8
  %31 = icmp slt i64 %param_2.13687, %constant_770_638
  %32 = zext i1 %31 to i8
  %param_2.13689 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_9510 = load i64, ptr @195, align 8
  %33 = add i64 %param_2.13689, %constant_769_9510
  %param_2.136811 = load i64, ptr %arg2, align 8, !invariant.load !182
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, i64 %33, i64 %param_2.136811
  %36 = icmp sge i64 0, %35
  %37 = select i1 %36, i64 0, i64 %35
  %38 = icmp sle i64 191, %37
  %dynamic-slice.54.104.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.54.104.start_idx0, 0
  %param_8.416 = getelementptr inbounds [192 x double], ptr %arg8, i64 0, i64 %39
  %param_8.41612 = load double, ptr %param_8.416, align 8, !invariant.load !182
  %param_5.856 = getelementptr inbounds [4 x double], ptr %arg5, i64 0, i64 %21
  %param_5.85613 = load double, ptr %param_5.856, align 8, !invariant.load !182
  %40 = call double @__nv_exp(double %param_5.85613)
  %multiply.3524.39 = fmul double %param_8.41612, %40
  %constant_774_15 = load double, ptr @197, align 8
  %compare.377.11 = fcmp ogt double %multiply.3524.39, %constant_774_15
  %41 = zext i1 %compare.377.11 to i8
  %42 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.973 = getelementptr inbounds double, ptr %42, i64 0
  %param_4.97314 = load double, ptr %param_4.973, align 8, !invariant.load !182
  %multiply.3561.29 = fmul double %param_4.97314, %40
  %multiply.3562.25 = fmul double %param_8.41612, %multiply.3561.29
  %constant_776_12 = load double, ptr @194, align 8
  %43 = trunc i8 %41 to i1
  %44 = select i1 %43, double %multiply.3562.25, double %constant_776_12
  %add.1055.23 = fadd double %multiply.3560.23, %44
  %45 = fneg double %add.1055.23
  %param_3.1174 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.117415 = load double, ptr %param_3.1174, align 8, !invariant.load !182
  %multiply.3564.15 = fmul double %45, %param_3.117415
  %constant_779_14 = load double, ptr @193, align 8
  %multiply.3570.7 = fmul double %multiply.3564.15, %constant_779_14
  %46 = fneg double %multiply.3570.7
  %param_1.1505 = getelementptr inbounds [4 x double], ptr %arg1, i64 0, i64 %21
  %param_1.150516 = load double, ptr %param_1.1505, align 8, !invariant.load !182
  %multiply.3572.3 = fmul double %46, %param_1.150516
  %47 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3572.3, ptr %47, align 8
  br label %dynamic-update-slice.2116.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_34(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(768) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(768) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(1536) %arg8) {
entry:
  %param_1.1457 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_15 = load i64, ptr @200, align 8
  %0 = icmp slt i64 %param_1.1457, %constant_770_15
  %1 = zext i1 %0 to i8
  %param_1.14571 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_85 = load i64, ptr @199, align 8
  %2 = add i64 %param_1.14571, %constant_769_85
  %param_1.14572 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14572
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_153 = load i64, ptr @200, align 8
  %9 = icmp sge i64 0, %constant_770_153
  %10 = select i1 %9, i64 0, i64 %constant_770_153
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_154 = load i64, ptr @200, align 8
  %13 = icmp sge i64 0, %constant_770_154
  %14 = select i1 %13, i64 0, i64 %constant_770_154
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2091.1.in_bounds-true, label %dynamic-update-slice.2091.1.in_bounds-after

dynamic-update-slice.2091.1.in_bounds-after:      ; preds = %dynamic-update-slice.2091.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2091.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.588 = getelementptr inbounds double, ptr %29, i64 0
  %param_6.5885 = load double, ptr %param_6.588, align 8, !invariant.load !182
  %30 = fneg double %param_6.5885
  %param_5.848 = getelementptr inbounds [4 x double], ptr %arg5, i64 0, i64 %21
  %param_5.8486 = load double, ptr %param_5.848, align 8, !invariant.load !182
  %multiply.3560.9 = fmul double %30, %param_5.8486
  %param_1.14577 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_158 = load i64, ptr @200, align 8
  %31 = icmp slt i64 %param_1.14577, %constant_770_158
  %32 = zext i1 %31 to i8
  %param_1.14579 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_8510 = load i64, ptr @199, align 8
  %33 = add i64 %param_1.14579, %constant_769_8510
  %param_1.145711 = load i64, ptr %arg1, align 8, !invariant.load !182
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, i64 %33, i64 %param_1.145711
  %36 = icmp sge i64 0, %35
  %37 = select i1 %36, i64 0, i64 %35
  %38 = icmp sle i64 191, %37
  %dynamic-slice.54.106.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.54.106.start_idx0, 0
  %param_8.407 = getelementptr inbounds [192 x double], ptr %arg8, i64 0, i64 %39
  %param_8.40712 = load double, ptr %param_8.407, align 8, !invariant.load !182
  %param_4.963 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.96313 = load double, ptr %param_4.963, align 8, !invariant.load !182
  %40 = call double @__nv_exp(double %param_4.96313)
  %multiply.3524.41 = fmul double %param_8.40712, %40
  %constant_774_16 = load double, ptr @201, align 8
  %compare.377.13 = fcmp ogt double %multiply.3524.41, %constant_774_16
  %41 = zext i1 %compare.377.13 to i8
  %42 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1161 = getelementptr inbounds double, ptr %42, i64 0
  %param_3.116114 = load double, ptr %param_3.1161, align 8, !invariant.load !182
  %multiply.3561.15 = fmul double %param_3.116114, %40
  %multiply.3562.11 = fmul double %param_8.40712, %multiply.3561.15
  %constant_776_2 = load double, ptr @203, align 8
  %43 = trunc i8 %41 to i1
  %44 = select i1 %43, double %multiply.3562.11, double %constant_776_2
  %add.1055.9 = fadd double %multiply.3560.9, %44
  %constant_772_21 = load double, ptr @202, align 8
  %param_2.1358 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.135815 = load double, ptr %param_2.1358, align 8, !invariant.load !182
  %param_7.484 = getelementptr inbounds [4 x double], ptr %arg7, i64 0, i64 %21
  %param_7.48416 = load double, ptr %param_7.484, align 8, !invariant.load !182
  %45 = trunc i8 %41 to i1
  %46 = select i1 %45, double %multiply.3524.41, double %param_7.48416
  %add.1042.5 = fadd double %param_2.135815, %46
  %multiply.3563.4 = fmul double %add.1042.5, %add.1042.5
  %multiply.3600.3 = fmul double %add.1042.5, %multiply.3563.4
  %divide.881.3 = fdiv double %constant_772_21, %multiply.3600.3
  %constant_777_3 = load double, ptr @198, align 8
  %multiply.3601.5 = fmul double %divide.881.3, %constant_777_3
  %multiply.3602.3 = fmul double %add.1055.9, %multiply.3601.5
  %47 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3602.3, ptr %47, align 8
  br label %dynamic-update-slice.2091.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_5(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(768) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(768) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(1536) %arg8) {
entry:
  %param_1.1487 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_45 = load i64, ptr @206, align 8
  %0 = icmp slt i64 %param_1.1487, %constant_770_45
  %1 = zext i1 %0 to i8
  %param_1.14871 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_70 = load i64, ptr @205, align 8
  %2 = add i64 %param_1.14871, %constant_769_70
  %param_1.14872 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14872
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_453 = load i64, ptr @206, align 8
  %9 = icmp sge i64 0, %constant_770_453
  %10 = select i1 %9, i64 0, i64 %constant_770_453
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_454 = load i64, ptr @206, align 8
  %13 = icmp sge i64 0, %constant_770_454
  %14 = select i1 %13, i64 0, i64 %constant_770_454
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2121.1.in_bounds-true, label %dynamic-update-slice.2121.1.in_bounds-after

dynamic-update-slice.2121.1.in_bounds-after:      ; preds = %dynamic-update-slice.2121.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2121.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_4.976 = getelementptr inbounds [4 x i64], ptr %arg4, i64 0, i64 %21
  %param_4.9765 = load i64, ptr %param_4.976, align 8, !invariant.load !182
  %constant_770_456 = load i64, ptr @206, align 8
  %29 = icmp ne i64 %param_4.9765, %constant_770_456
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_781_3 = load i32, ptr @209, align 4
  %32 = icmp eq i32 %31, %constant_781_3
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.601 = getelementptr inbounds double, ptr %34, i64 0
  %param_6.6017 = load double, ptr %param_6.601, align 8, !invariant.load !182
  %constant_776_5 = load double, ptr @208, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_6.6017, double %constant_776_5
  %37 = fneg double %36
  %param_5.860 = getelementptr inbounds [4 x double], ptr %arg5, i64 0, i64 %21
  %param_5.8608 = load double, ptr %param_5.860, align 8, !invariant.load !182
  %multiply.3575.13 = fmul double %37, %param_5.8608
  %param_1.14879 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_4510 = load i64, ptr @206, align 8
  %38 = icmp slt i64 %param_1.14879, %constant_770_4510
  %39 = zext i1 %38 to i8
  %param_1.148711 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_7012 = load i64, ptr @205, align 8
  %40 = add i64 %param_1.148711, %constant_769_7012
  %param_1.148713 = load i64, ptr %arg1, align 8, !invariant.load !182
  %41 = trunc i8 %39 to i1
  %42 = select i1 %41, i64 %40, i64 %param_1.148713
  %43 = icmp sge i64 0, %42
  %44 = select i1 %43, i64 0, i64 %42
  %45 = icmp sle i64 191, %44
  %dynamic-slice.54.72.start_idx0 = select i1 %45, i64 191, i64 %44
  %46 = add i64 %dynamic-slice.54.72.start_idx0, 0
  %param_8.423 = getelementptr inbounds [192 x double], ptr %arg8, i64 0, i64 %46
  %param_8.42314 = load double, ptr %param_8.423, align 8, !invariant.load !182
  %47 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1160 = getelementptr inbounds double, ptr %47, i64 0
  %param_3.116015 = load double, ptr %param_3.1160, align 8, !invariant.load !182
  %48 = trunc i8 %33 to i1
  %49 = select i1 %48, double %param_3.116015, double %constant_776_5
  %param_2.1357 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.135716 = load double, ptr %param_2.1357, align 8, !invariant.load !182
  %50 = call double @__nv_exp(double %param_2.135716)
  %multiply.3576.9 = fmul double %49, %50
  %multiply.3577.6 = fmul double %param_8.42314, %multiply.3576.9
  %add.1061.11 = fadd double %multiply.3575.13, %multiply.3577.6
  %constant_772_3 = load double, ptr @207, align 8
  %param_7.500 = getelementptr inbounds [4 x double], ptr %arg7, i64 0, i64 %21
  %param_7.50017 = load double, ptr %param_7.500, align 8, !invariant.load !182
  %multiply.3524.13 = fmul double %param_8.42314, %50
  %add.1044.7 = fadd double %param_7.50017, %multiply.3524.13
  %multiply.3578.4 = fmul double %add.1044.7, %add.1044.7
  %multiply.3620.3 = fmul double %add.1044.7, %multiply.3578.4
  %divide.887.3 = fdiv double %constant_772_3, %multiply.3620.3
  %constant_777_1 = load double, ptr @204, align 8
  %multiply.3621.5 = fmul double %divide.887.3, %constant_777_1
  %multiply.3622.3 = fmul double %add.1061.11, %multiply.3621.5
  %51 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3622.3, ptr %51, align 8
  br label %dynamic-update-slice.2121.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_8(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(768) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(768) %arg7, ptr noalias align 16 dereferenceable(1536) %arg8) {
entry:
  %param_1.1498 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_56 = load i64, ptr @215, align 8
  %0 = icmp slt i64 %param_1.1498, %constant_770_56
  %1 = zext i1 %0 to i8
  %param_1.14981 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_84 = load i64, ptr @214, align 8
  %2 = add i64 %param_1.14981, %constant_769_84
  %param_1.14982 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14982
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_563 = load i64, ptr @215, align 8
  %9 = icmp sge i64 0, %constant_770_563
  %10 = select i1 %9, i64 0, i64 %constant_770_563
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_564 = load i64, ptr @215, align 8
  %13 = icmp sge i64 0, %constant_770_564
  %14 = select i1 %13, i64 0, i64 %constant_770_564
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2118.1.in_bounds-true, label %dynamic-update-slice.2118.1.in_bounds-after

dynamic-update-slice.2118.1.in_bounds-after:      ; preds = %dynamic-update-slice.2118.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2118.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.507 = getelementptr inbounds double, ptr %29, i64 0
  %param_7.5075 = load double, ptr %param_7.507, align 8, !invariant.load !182
  %30 = fneg double %param_7.5075
  %param_6.608 = getelementptr inbounds [4 x double], ptr %arg6, i64 0, i64 %21
  %param_6.6086 = load double, ptr %param_6.608, align 8, !invariant.load !182
  %multiply.3560.19 = fmul double %30, %param_6.6086
  %param_1.14987 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_568 = load i64, ptr @215, align 8
  %31 = icmp slt i64 %param_1.14987, %constant_770_568
  %32 = zext i1 %31 to i8
  %param_1.14989 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_8410 = load i64, ptr @214, align 8
  %33 = add i64 %param_1.14989, %constant_769_8410
  %param_1.149811 = load i64, ptr %arg1, align 8, !invariant.load !182
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, i64 %33, i64 %param_1.149811
  %36 = icmp sge i64 0, %35
  %37 = select i1 %36, i64 0, i64 %35
  %38 = icmp sle i64 191, %37
  %dynamic-slice.54.120.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.54.120.start_idx0, 0
  %param_8.427 = getelementptr inbounds [192 x double], ptr %arg8, i64 0, i64 %39
  %param_8.42712 = load double, ptr %param_8.427, align 8, !invariant.load !182
  %param_5.866 = getelementptr inbounds [4 x double], ptr %arg5, i64 0, i64 %21
  %param_5.86613 = load double, ptr %param_5.866, align 8, !invariant.load !182
  %40 = call double @__nv_exp(double %param_5.86613)
  %multiply.3524.55 = fmul double %param_8.42712, %40
  %constant_774_22 = load double, ptr @216, align 8
  %compare.377.27 = fcmp ogt double %multiply.3524.55, %constant_774_22
  %41 = zext i1 %compare.377.27 to i8
  %42 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.986 = getelementptr inbounds double, ptr %42, i64 0
  %param_4.98614 = load double, ptr %param_4.986, align 8, !invariant.load !182
  %multiply.3561.25 = fmul double %param_4.98614, %40
  %multiply.3562.21 = fmul double %param_8.42712, %multiply.3561.25
  %constant_776_22 = load double, ptr @213, align 8
  %43 = trunc i8 %41 to i1
  %44 = select i1 %43, double %multiply.3562.21, double %constant_776_22
  %add.1055.19 = fadd double %multiply.3560.19, %44
  %45 = fneg double %add.1055.19
  %param_3.1187 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.118715 = load double, ptr %param_3.1187, align 8, !invariant.load !182
  %multiply.3564.11 = fmul double %45, %param_3.118715
  %constant_772_1 = load double, ptr @212, align 8
  %param_2.1380 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.138016 = load double, ptr %param_2.1380, align 8, !invariant.load !182
  %constant_779_6 = load double, ptr @211, align 8
  %multiply.3527.9 = fmul double %param_2.138016, %constant_779_6
  %multiply.3571.4 = fmul double %multiply.3527.9, %multiply.3527.9
  %multiply.3616.3 = fmul double %multiply.3527.9, %multiply.3571.4
  %divide.886.3 = fdiv double %constant_772_1, %multiply.3616.3
  %constant_785_1 = load double, ptr @210, align 8
  %multiply.3617.3 = fmul double %divide.886.3, %constant_785_1
  %multiply.3618.3 = fmul double %multiply.3564.11, %multiply.3617.3
  %46 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3618.3, ptr %46, align 8
  br label %dynamic-update-slice.2118.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_36(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(768) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(768) %arg6, ptr noalias align 16 dereferenceable(1536) %arg7) {
entry:
  %param_1.1469 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_27 = load i64, ptr @219, align 8
  %0 = icmp slt i64 %param_1.1469, %constant_770_27
  %1 = zext i1 %0 to i8
  %param_1.14691 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_82 = load i64, ptr @218, align 8
  %2 = add i64 %param_1.14691, %constant_769_82
  %param_1.14692 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14692
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_273 = load i64, ptr @219, align 8
  %9 = icmp sge i64 0, %constant_770_273
  %10 = select i1 %9, i64 0, i64 %constant_770_273
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_274 = load i64, ptr @219, align 8
  %13 = icmp sge i64 0, %constant_770_274
  %14 = select i1 %13, i64 0, i64 %constant_770_274
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2089.1.in_bounds-true, label %dynamic-update-slice.2089.1.in_bounds-after

dynamic-update-slice.2089.1.in_bounds-after:      ; preds = %dynamic-update-slice.2089.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2089.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.585 = getelementptr inbounds double, ptr %29, i64 0
  %param_6.5855 = load double, ptr %param_6.585, align 8, !invariant.load !182
  %30 = fneg double %param_6.5855
  %param_5.844 = getelementptr inbounds [4 x double], ptr %arg5, i64 0, i64 %21
  %param_5.8446 = load double, ptr %param_5.844, align 8, !invariant.load !182
  %multiply.3560.21 = fmul double %30, %param_5.8446
  %param_1.14697 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_278 = load i64, ptr @219, align 8
  %31 = icmp slt i64 %param_1.14697, %constant_770_278
  %32 = zext i1 %31 to i8
  %param_1.14699 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_8210 = load i64, ptr @218, align 8
  %33 = add i64 %param_1.14699, %constant_769_8210
  %param_1.146911 = load i64, ptr %arg1, align 8, !invariant.load !182
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, i64 %33, i64 %param_1.146911
  %36 = icmp sge i64 0, %35
  %37 = select i1 %36, i64 0, i64 %35
  %38 = icmp sle i64 191, %37
  %dynamic-slice.54.122.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.54.122.start_idx0, 0
  %param_7.481 = getelementptr inbounds [192 x double], ptr %arg7, i64 0, i64 %39
  %param_7.48112 = load double, ptr %param_7.481, align 8, !invariant.load !182
  %param_4.960 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.96013 = load double, ptr %param_4.960, align 8, !invariant.load !182
  %40 = call double @__nv_exp(double %param_4.96013)
  %multiply.3524.57 = fmul double %param_7.48112, %40
  %constant_774_3 = load double, ptr @220, align 8
  %compare.377.29 = fcmp ogt double %multiply.3524.57, %constant_774_3
  %41 = zext i1 %compare.377.29 to i8
  %42 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1159 = getelementptr inbounds double, ptr %42, i64 0
  %param_3.115914 = load double, ptr %param_3.1159, align 8, !invariant.load !182
  %multiply.3561.27 = fmul double %param_3.115914, %40
  %multiply.3562.23 = fmul double %param_7.48112, %multiply.3561.27
  %constant_776_23 = load double, ptr @217, align 8
  %43 = trunc i8 %41 to i1
  %44 = select i1 %43, double %multiply.3562.23, double %constant_776_23
  %add.1055.21 = fadd double %multiply.3560.21, %44
  %45 = fneg double %add.1055.21
  %param_2.1260 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.126015 = load double, ptr %param_2.1260, align 8, !invariant.load !182
  %multiply.3564.13 = fmul double %45, %param_2.126015
  %46 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3564.13, ptr %46, align 8
  br label %dynamic-update-slice.2089.1.in_bounds-after
}

define void @loop_add_divide_select_fusion(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(32) %arg8, ptr noalias align 16 dereferenceable(768) %arg9, ptr noalias align 128 dereferenceable(32) %arg10, ptr noalias align 16 dereferenceable(32) %arg11, ptr noalias align 128 dereferenceable(32) %arg12, ptr noalias align 16 dereferenceable(1536) %arg13, ptr noalias align 128 dereferenceable(8) %arg14, ptr noalias align 16 dereferenceable(768) %arg15, ptr noalias align 128 dereferenceable(768) %arg16, ptr noalias align 128 dereferenceable(32) %arg17, ptr noalias align 16 dereferenceable(32) %arg18, ptr noalias align 128 dereferenceable(768) %arg19, ptr noalias align 128 dereferenceable(768) %arg20, ptr noalias align 128 dereferenceable(768) %arg21, ptr noalias align 16 dereferenceable(32) %arg22, ptr noalias align 128 dereferenceable(768) %arg23, ptr noalias align 128 dereferenceable(8) %arg24, ptr noalias align 128 dereferenceable(32) %arg25, ptr noalias align 128 dereferenceable(32) %arg26, ptr noalias align 16 dereferenceable(6144) %arg27, ptr noalias align 128 dereferenceable(768) %arg28, ptr noalias align 128 dereferenceable(32) %arg29, ptr noalias align 128 dereferenceable(768) %arg30, ptr noalias align 16 dereferenceable(32) %arg31, ptr noalias align 128 dereferenceable(768) %arg32, ptr noalias align 128 dereferenceable(32) %arg33, ptr noalias align 16 dereferenceable(32) %arg34, ptr noalias align 128 dereferenceable(32) %arg35, ptr noalias align 128 dereferenceable(32) %arg36, ptr noalias align 128 dereferenceable(768) %arg37, ptr noalias align 128 dereferenceable(32) %arg38, ptr noalias align 128 dereferenceable(768) %arg39, ptr noalias align 16 dereferenceable(768) %arg40, ptr noalias align 16 dereferenceable(32) %arg41, ptr noalias align 128 dereferenceable(32) %arg42, ptr noalias align 16 dereferenceable(32) %arg43, ptr noalias align 128 dereferenceable(768) %arg44, ptr noalias align 128 dereferenceable(32) %arg45, ptr noalias align 16 dereferenceable(32) %arg46, ptr noalias align 128 dereferenceable(768) %arg47, ptr noalias align 128 dereferenceable(768) %arg48, ptr noalias align 128 dereferenceable(768) %arg49, ptr noalias align 128 dereferenceable(768) %arg50, ptr noalias align 128 dereferenceable(768) %arg51, ptr noalias align 128 dereferenceable(768) %arg52, ptr noalias align 128 dereferenceable(768) %arg53, ptr noalias align 128 dereferenceable(768) %arg54, ptr noalias align 128 dereferenceable(32) %arg55, ptr noalias align 128 dereferenceable(768) %arg56, ptr noalias align 128 dereferenceable(768) %arg57, ptr noalias align 128 dereferenceable(768) %arg58, ptr noalias align 128 dereferenceable(768) %arg59, ptr noalias align 128 dereferenceable(768) %arg60) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %2 = mul nuw nsw i32 %0, 96
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 96
  br i1 %6, label %loop_add_divide_select_fusion.in_bounds-true, label %loop_add_divide_select_fusion.in_bounds-after

loop_add_divide_select_fusion.in_bounds-after:    ; preds = %loop_add_divide_select_fusion.in_bounds-true, %entry
  ret void

loop_add_divide_select_fusion.in_bounds-true:     ; preds = %entry
  %7 = getelementptr inbounds [4 x i8], ptr %arg1, i32 0, i32 %4
  %8 = load i8, ptr %7, align 1, !invariant.load !182
  %9 = getelementptr inbounds [4 x i64], ptr %arg4, i32 0, i32 %4
  %10 = load i64, ptr %9, align 8, !invariant.load !182
  %constant_770_1 = load i64, ptr @221, align 8
  %11 = icmp ne i64 %10, %constant_770_1
  %12 = zext i1 %11 to i8
  %13 = zext i8 %12 to i32
  %constant_780_3 = load i32, ptr @227, align 4
  %14 = icmp slt i32 %13, %constant_780_3
  %15 = zext i1 %14 to i8
  %constant_781_1 = load i32, ptr @229, align 4
  %16 = icmp eq i32 %13, %constant_781_1
  %17 = zext i1 %16 to i8
  %18 = getelementptr double, ptr %arg0, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  %20 = load double, ptr %19, align 8
  %constant_776_10 = load double, ptr @223, align 8
  %21 = trunc i8 %17 to i1
  %22 = select i1 %21, double %20, double %constant_776_10
  %23 = fneg double %22
  %24 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %4
  %25 = load double, ptr %24, align 8, !invariant.load !182
  %multiply.3575.11 = fmul double %23, %25
  %26 = load i64, ptr %arg14, align 8, !invariant.load !182
  %constant_770_11 = load i64, ptr @221, align 8
  %27 = icmp slt i64 %26, %constant_770_11
  %28 = zext i1 %27 to i8
  %29 = load i64, ptr %arg14, align 8, !invariant.load !182
  %constant_769_122 = load i64, ptr @222, align 8
  %30 = add i64 %29, %constant_769_122
  %31 = load i64, ptr %arg14, align 8, !invariant.load !182
  %32 = trunc i8 %28 to i1
  %33 = select i1 %32, i64 %30, i64 %31
  %34 = trunc i64 %33 to i32
  %35 = icmp sge i32 0, %34
  %36 = select i1 %35, i32 0, i32 %34
  %37 = icmp sle i32 191, %36
  %dynamic-slice.54.74.start_idx0 = select i1 %37, i32 191, i32 %36
  %38 = add i32 %dynamic-slice.54.74.start_idx0, 0
  %39 = getelementptr inbounds [192 x double], ptr %arg13, i32 0, i32 %38
  %40 = load double, ptr %39, align 8, !invariant.load !182
  %41 = getelementptr double, ptr %arg9, i32 %linear_index
  %42 = getelementptr inbounds double, ptr %41, i32 0
  %43 = load double, ptr %42, align 8, !invariant.load !182
  %44 = trunc i8 %17 to i1
  %45 = select i1 %44, double %43, double %constant_776_10
  %46 = getelementptr inbounds [4 x double], ptr %arg8, i32 0, i32 %4
  %47 = load double, ptr %46, align 8, !invariant.load !182
  %48 = call double @__nv_exp(double %47)
  %multiply.3576.7 = fmul double %45, %48
  %multiply.3577.4 = fmul double %40, %multiply.3576.7
  %add.1061.9 = fadd double %multiply.3575.11, %multiply.3577.4
  %49 = fneg double %add.1061.9
  %constant_772_19 = load double, ptr @226, align 8
  %50 = getelementptr inbounds [4 x double], ptr %arg12, i32 0, i32 %4
  %51 = load double, ptr %50, align 8, !invariant.load !182
  %multiply.3524.29 = fmul double %40, %48
  %add.1044.11 = fadd double %51, %multiply.3524.29
  %multiply.3578.8 = fmul double %add.1044.11, %add.1044.11
  %divide.879.5 = fdiv double %constant_772_19, %multiply.3578.8
  %multiply.3579.3 = fmul double %49, %divide.879.5
  %52 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %4
  %53 = load double, ptr %52, align 8, !invariant.load !182
  %54 = getelementptr inbounds [4 x [1 x double]], ptr %arg11, i32 0, i32 %4, i32 0
  %55 = load double, ptr %54, align 8, !invariant.load !182
  %56 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %4
  %57 = load double, ptr %56, align 8, !invariant.load !182
  %58 = getelementptr inbounds [4 x double], ptr %arg7, i32 0, i32 %4
  %59 = load double, ptr %58, align 8, !invariant.load !182
  %multiply.3518.20 = fmul double %57, %59
  %multiply.3525.3 = fmul double %55, %multiply.3518.20
  %multiply.3530.9 = fmul double %multiply.3525.3, %multiply.3525.3
  %constant_782_1 = load double, ptr @228, align 8
  %multiply.3531.11 = fmul double %multiply.3530.9, %constant_782_1
  %60 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %4
  %61 = load double, ptr %60, align 8, !invariant.load !182
  %multiply.3532.9 = fmul double %multiply.3530.9, %61
  %add.1045.9 = fadd double %multiply.3531.11, %multiply.3532.9
  %multiply.3533.11 = fmul double %55, %55
  %multiply.3534.9 = fmul double %multiply.3533.11, %constant_782_1
  %multiply.3535.9 = fmul double %multiply.3534.9, %multiply.3518.20
  %62 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %4
  %63 = load double, ptr %62, align 8, !invariant.load !182
  %multiply.3536.9 = fmul double %multiply.3535.9, %63
  %subtract.148.9 = fsub double %add.1045.9, %multiply.3536.9
  %64 = getelementptr inbounds [4 x i64], ptr %arg4, i32 0, i32 %4
  %65 = load i64, ptr %64, align 8, !invariant.load !182
  %66 = sitofp i64 %65 to double
  %multiply.3537.7 = fmul double %subtract.148.9, %66
  %add.1046.7 = fadd double %53, %multiply.3537.7
  %constant_774_4 = load double, ptr @224, align 8
  %compare.380.3 = fcmp ogt double %add.1046.7, %constant_774_4
  %67 = zext i1 %compare.380.3 to i8
  %68 = icmp eq i32 %13, %constant_780_3
  %69 = zext i1 %68 to i8
  %70 = getelementptr double, ptr %arg0, i32 %linear_index
  %71 = getelementptr inbounds double, ptr %70, i32 0
  %72 = load double, ptr %71, align 8
  %73 = fneg double %72
  %multiply.3560.15 = fmul double %73, %25
  %compare.377.25 = fcmp ogt double %multiply.3524.29, %constant_774_4
  %74 = zext i1 %compare.377.25 to i8
  %75 = getelementptr double, ptr %arg9, i32 %linear_index
  %76 = getelementptr inbounds double, ptr %75, i32 0
  %77 = load double, ptr %76, align 8, !invariant.load !182
  %multiply.3561.21 = fmul double %77, %48
  %multiply.3562.17 = fmul double %40, %multiply.3561.21
  %78 = trunc i8 %74 to i1
  %79 = select i1 %78, double %multiply.3562.17, double %constant_776_10
  %add.1055.15 = fadd double %multiply.3560.15, %79
  %80 = fneg double %add.1055.15
  %81 = getelementptr inbounds [4 x double], ptr %arg10, i32 0, i32 %4
  %82 = load double, ptr %81, align 8, !invariant.load !182
  %multiply.3564.7 = fmul double %80, %82
  %83 = trunc i8 %69 to i1
  %84 = select i1 %83, double %multiply.3564.7, double %constant_776_10
  %85 = getelementptr double, ptr %arg15, i32 %linear_index
  %86 = getelementptr inbounds double, ptr %85, i32 0
  %87 = load double, ptr %86, align 8, !invariant.load !182
  %constant_776_102 = load double, ptr @223, align 8
  %88 = trunc i8 %69 to i1
  %89 = select i1 %88, double %87, double %constant_776_102
  %multiply.3580.7 = fmul double %89, %multiply.3518.20
  %90 = getelementptr inbounds [4 x double], ptr %arg41, i32 0, i32 %4
  %91 = load double, ptr %90, align 8, !invariant.load !182
  %92 = getelementptr inbounds [4 x [1 x double]], ptr %arg43, i32 0, i32 %4, i32 0
  %93 = load double, ptr %92, align 8, !invariant.load !182
  %94 = getelementptr inbounds [4 x double], ptr %arg42, i32 0, i32 %4
  %95 = load double, ptr %94, align 8, !invariant.load !182
  %multiply.3502.31.clone.1 = fmul double %93, %95
  %add.1033.29.clone.1 = fadd double %91, %multiply.3502.31.clone.1
  %96 = call double @__nv_exp(double %add.1033.29.clone.1)
  %multiply.3503.13.clone.1 = fmul double %40, %96
  %compare.375.9.clone.1 = fcmp ogt double %multiply.3503.13.clone.1, %constant_774_4
  %97 = zext i1 %compare.375.9.clone.1 to i8
  %98 = getelementptr double, ptr %arg40, i32 %linear_index
  %99 = getelementptr inbounds double, ptr %98, i32 0
  %100 = load double, ptr %99, align 8, !invariant.load !182
  %101 = getelementptr double, ptr %arg16, i32 %linear_index
  %102 = getelementptr inbounds double, ptr %101, i32 0
  %103 = load double, ptr %102, align 8
  %multiply.3510.7.clone.1 = fmul double %93, %103
  %add.1036.7.clone.1 = fadd double %100, %multiply.3510.7.clone.1
  %multiply.3511.7.clone.1 = fmul double %add.1036.7.clone.1, %96
  %multiply.3512.3.clone.1 = fmul double %40, %multiply.3511.7.clone.1
  %104 = trunc i8 %97 to i1
  %105 = select i1 %104, double %multiply.3512.3.clone.1, double %constant_776_10
  %106 = getelementptr inbounds [4 x double], ptr %arg7, i32 0, i32 %4
  %107 = load double, ptr %106, align 8, !invariant.load !182
  %multiply.3550.3.clone.1 = fmul double %105, %107
  %108 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %4
  %109 = load double, ptr %108, align 8, !invariant.load !182
  %110 = getelementptr double, ptr %arg32, i32 %linear_index
  %111 = getelementptr inbounds double, ptr %110, i32 0
  %112 = load double, ptr %111, align 8, !invariant.load !182
  %multiply.3551.1.clone.1 = fmul double %109, %112
  %add.1051.1.clone.1 = fadd double %multiply.3550.3.clone.1, %multiply.3551.1.clone.1
  %113 = trunc i8 %69 to i1
  %114 = select i1 %113, double %add.1051.1.clone.1, double %constant_776_10
  %multiply.3581.7 = fmul double %55, %114
  %add.1062.5 = fadd double %multiply.3580.7, %multiply.3581.7
  %constant_779_8 = load double, ptr @225, align 8
  %multiply.3582.9 = fmul double %multiply.3525.3, %constant_779_8
  %multiply.3583.5 = fmul double %add.1062.5, %multiply.3582.9
  %constant_782_13 = load double, ptr @228, align 8
  %multiply.3584.3 = fmul double %multiply.3583.5, %constant_782_13
  %115 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %4
  %116 = load double, ptr %115, align 8, !invariant.load !182
  %multiply.3585.3 = fmul double %multiply.3583.5, %116
  %117 = getelementptr double, ptr %arg32, i32 %linear_index
  %118 = getelementptr inbounds double, ptr %117, i32 0
  %119 = load double, ptr %118, align 8, !invariant.load !182
  %120 = getelementptr inbounds [4 x double], ptr %arg38, i32 0, i32 %4
  %121 = load double, ptr %120, align 8, !invariant.load !182
  %divide.875.3.clone.1 = fdiv double %119, %121
  %122 = getelementptr double, ptr %arg37, i32 %linear_index
  %123 = getelementptr inbounds double, ptr %122, i32 0
  %124 = load double, ptr %123, align 8
  %125 = fneg double %124
  %multiply.3552.3.clone.1 = fmul double %125, %107
  %126 = getelementptr inbounds [4 x double], ptr %arg36, i32 0, i32 %4
  %127 = load double, ptr %126, align 8, !invariant.load !182
  %multiply.3553.5.clone.1 = fmul double %multiply.3552.3.clone.1, %127
  %add.1052.3.clone.1 = fadd double %divide.875.3.clone.1, %multiply.3553.5.clone.1
  %128 = getelementptr double, ptr %arg32, i32 %linear_index
  %129 = getelementptr inbounds double, ptr %128, i32 0
  %130 = load double, ptr %129, align 8, !invariant.load !182
  %131 = getelementptr inbounds [4 x double], ptr %arg31, i32 0, i32 %4
  %132 = load double, ptr %131, align 8, !invariant.load !182
  %133 = getelementptr inbounds [4 x double], ptr %arg35, i32 0, i32 %4
  %134 = load double, ptr %133, align 8, !invariant.load !182
  %multiply.3498.19.clone.1 = fmul double %132, %134
  %135 = getelementptr inbounds [4 x double], ptr %arg34, i32 0, i32 %4
  %136 = load double, ptr %135, align 8, !invariant.load !182
  %multiply.3499.21.clone.1 = fmul double %40, %136
  %add.1031.19.clone.1 = fadd double %multiply.3498.19.clone.1, %multiply.3499.21.clone.1
  %137 = getelementptr inbounds [4 x double], ptr %arg29, i32 0, i32 %4
  %138 = load double, ptr %137, align 8, !invariant.load !182
  %139 = getelementptr inbounds [4 x double], ptr %arg33, i32 0, i32 %4
  %140 = load double, ptr %139, align 8, !invariant.load !182
  %141 = load double, ptr %arg24, align 8, !invariant.load !182
  %multiply.3516.31.clone.1 = fmul double %140, %141
  %multiply.3517.17.clone.1 = fmul double %138, %multiply.3516.31.clone.1
  %add.1038.17.clone.1 = fadd double %add.1031.19.clone.1, %multiply.3517.17.clone.1
  %subtract.147.5.clone.1 = fsub double %add.1038.17.clone.1, %add.1031.19.clone.1
  %multiply.3520.1.clone.1 = fmul double %subtract.147.5.clone.1, %subtract.147.5.clone.1
  %multiply.3554.3.clone.1 = fmul double %130, %multiply.3520.1.clone.1
  %142 = getelementptr inbounds [4 x double], ptr %arg31, i32 0, i32 %4
  %143 = load double, ptr %142, align 8, !invariant.load !182
  %144 = getelementptr double, ptr %arg30, i32 %linear_index
  %145 = getelementptr inbounds double, ptr %144, i32 0
  %146 = load double, ptr %145, align 8, !invariant.load !182
  %multiply.3504.33.clone.1 = fmul double %143, %146
  %147 = getelementptr inbounds [4 x [1 x double]], ptr %arg46, i32 0, i32 %4, i32 0
  %148 = load double, ptr %147, align 8, !invariant.load !182
  %149 = getelementptr double, ptr %arg28, i32 %linear_index
  %150 = getelementptr inbounds double, ptr %149, i32 0
  %151 = load double, ptr %150, align 8, !invariant.load !182
  %multiply.3543.5.clone.1 = fmul double %148, %151
  %divide.873.3.clone.1 = fdiv double %multiply.3543.5.clone.1, %121
  %152 = getelementptr inbounds [4 x double], ptr %arg45, i32 0, i32 %4
  %153 = load double, ptr %152, align 8, !invariant.load !182
  %multiply.3501.3.clone.1 = fmul double %148, %153
  %multiply.3544.1.clone.1 = fmul double %125, %multiply.3501.3.clone.1
  %multiply.3546.3.clone.1 = fmul double %multiply.3544.1.clone.1, %127
  %add.1048.1.clone.1 = fadd double %divide.873.3.clone.1, %multiply.3546.3.clone.1
  %multiply.3547.15.clone.1 = fmul double %add.1048.1.clone.1, %multiply.3516.31.clone.1
  %154 = getelementptr inbounds [4 x double], ptr %arg29, i32 0, i32 %4
  %155 = load double, ptr %154, align 8, !invariant.load !182
  %156 = getelementptr inbounds [4 x double], ptr %arg45, i32 0, i32 %4
  %157 = load double, ptr %156, align 8, !invariant.load !182
  %multiply.3505.11.clone.1 = fmul double %multiply.3504.33.clone.1, %157
  %158 = fneg double %multiply.3505.11.clone.1
  %159 = load double, ptr %arg24, align 8, !invariant.load !182
  %multiply.3539.5.clone.1 = fmul double %158, %159
  %divide.870.1.clone.1 = fdiv double %multiply.3539.5.clone.1, %157
  %160 = getelementptr double, ptr %arg28, i32 %linear_index
  %161 = getelementptr inbounds double, ptr %160, i32 0
  %162 = load double, ptr %161, align 8, !invariant.load !182
  %163 = fneg double %162
  %164 = trunc i64 %33 to i32
  %165 = icmp sge i32 0, %164
  %166 = select i1 %165, i32 0, i32 %164
  %167 = icmp sle i32 191, %166
  %dynamic-slice.56.4.clone.1.start_idx0 = select i1 %167, i32 191, i32 %166
  %constant_770_14 = load i64, ptr @221, align 8
  %168 = trunc i64 %constant_770_14 to i32
  %169 = icmp sge i32 0, %168
  %170 = select i1 %169, i32 0, i32 %168
  %171 = icmp sle i32 0, %170
  %dynamic-slice.56.4.clone.1.start_idx1 = select i1 %171, i32 0, i32 %170
  %constant_770_15 = load i64, ptr @221, align 8
  %172 = trunc i64 %constant_770_15 to i32
  %173 = icmp sge i32 0, %172
  %174 = select i1 %173, i32 0, i32 %172
  %175 = icmp sle i32 0, %174
  %dynamic-slice.56.4.clone.1.start_idx2 = select i1 %175, i32 0, i32 %174
  %176 = add i32 %dynamic-slice.56.4.clone.1.start_idx0, 0
  %177 = add i32 %dynamic-slice.56.4.clone.1.start_idx1, %4
  %178 = add i32 %dynamic-slice.56.4.clone.1.start_idx2, 0
  %179 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg27, i32 0, i32 %176, i32 %177, i32 0
  %180 = load double, ptr %179, align 8, !invariant.load !182
  %181 = getelementptr inbounds [4 x double], ptr %arg26, i32 0, i32 %4
  %182 = load double, ptr %181, align 8, !invariant.load !182
  %subtract.146.5.clone.1 = fsub double %180, %182
  %multiply.3515.3.clone.1 = fmul double %subtract.146.5.clone.1, %141
  %multiply.3540.21.clone.1 = fmul double %163, %multiply.3515.3.clone.1
  %183 = getelementptr inbounds [4 x double], ptr %arg25, i32 0, i32 %4
  %184 = load double, ptr %183, align 8, !invariant.load !182
  %multiply.3542.23.clone.1 = fmul double %multiply.3540.21.clone.1, %184
  %add.1047.21.clone.1 = fadd double %divide.870.1.clone.1, %multiply.3542.23.clone.1
  %multiply.3548.17.clone.1 = fmul double %add.1047.21.clone.1, %159
  %multiply.3549.17.clone.1 = fmul double %155, %multiply.3548.17.clone.1
  %add.1049.15.clone.1 = fadd double %multiply.3547.15.clone.1, %multiply.3549.17.clone.1
  %add.1050.14.clone.1 = fadd double %multiply.3504.33.clone.1, %add.1049.15.clone.1
  %subtract.149.13.clone.1 = fsub double %add.1050.14.clone.1, %multiply.3504.33.clone.1
  %multiply.3555.9.clone.1 = fmul double %subtract.147.5.clone.1, %constant_779_8
  %multiply.3556.5.clone.1 = fmul double %subtract.149.13.clone.1, %multiply.3555.9.clone.1
  %multiply.3557.5.clone.1 = fmul double %107, %multiply.3556.5.clone.1
  %add.1053.3.clone.1 = fadd double %multiply.3554.3.clone.1, %multiply.3557.5.clone.1
  %add.1054.1.clone.1 = fadd double %add.1052.3.clone.1, %add.1053.3.clone.1
  %185 = trunc i8 %69 to i1
  %186 = select i1 %185, double %add.1054.1.clone.1, double %constant_776_10
  %multiply.3586.9 = fmul double %multiply.3530.9, %186
  %add.1063.7 = fadd double %multiply.3585.3, %multiply.3586.9
  %add.1064.5 = fadd double %multiply.3584.3, %add.1063.7
  %multiply.3587.11 = fmul double %55, %constant_779_8
  %multiply.3588.13 = fmul double %89, %multiply.3587.11
  %multiply.3589.9 = fmul double %multiply.3518.20, %constant_782_1
  %multiply.3590.7 = fmul double %multiply.3588.13, %multiply.3589.9
  %multiply.3591.7 = fmul double %multiply.3534.9, %114
  %add.1065.5 = fadd double %multiply.3590.7, %multiply.3591.7
  %multiply.3592.3 = fmul double %add.1065.5, %116
  %multiply.3593.7 = fmul double %multiply.3535.9, %186
  %add.1066.5 = fadd double %multiply.3592.3, %multiply.3593.7
  %subtract.150.3 = fsub double %add.1064.5, %add.1066.5
  %multiply.3594.5 = fmul double %subtract.150.3, %66
  %add.1067.3 = fadd double %84, %multiply.3594.5
  %187 = trunc i8 %67 to i1
  %188 = select i1 %187, double %add.1067.3, double %constant_776_10
  %189 = trunc i8 %15 to i1
  %190 = select i1 %189, double %multiply.3579.3, double %188
  %191 = getelementptr double, ptr %arg0, i32 %linear_index
  %192 = getelementptr inbounds double, ptr %191, i32 0
  %193 = load double, ptr %192, align 8
  %194 = trunc i8 %8 to i1
  %195 = select i1 %194, double %190, double %193
  %196 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } undef, double %195, 0
  %197 = getelementptr inbounds [4 x double], ptr %arg18, i32 0, i32 %4
  %198 = load double, ptr %197, align 8, !invariant.load !182
  %199 = getelementptr double, ptr %arg16, i32 %linear_index
  %200 = getelementptr inbounds double, ptr %199, i32 0
  %201 = load double, ptr %200, align 8
  %multiply.3558.3.clone.1 = fmul double %198, %201
  %multiply.3565.7.clone.1 = fmul double %87, %multiply.3518.20
  %multiply.3566.5.clone.1 = fmul double %55, %add.1051.1.clone.1
  %add.1057.5.clone.1 = fadd double %multiply.3565.7.clone.1, %multiply.3566.5.clone.1
  %multiply.3567.7.clone.1 = fmul double %add.1057.5.clone.1, %116
  %multiply.3568.5.clone.1 = fmul double %multiply.3525.3, %add.1054.1.clone.1
  %add.1058.5.clone.1 = fadd double %multiply.3567.7.clone.1, %multiply.3568.5.clone.1
  %202 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %4
  %203 = load double, ptr %202, align 8, !invariant.load !182
  %multiply.3527.11.clone.1 = fmul double %203, %constant_779_8
  %divide.868.3.clone.1 = fdiv double %constant_772_19, %multiply.3527.11.clone.1
  %multiply.3569.3.clone.1 = fmul double %add.1058.5.clone.1, %divide.868.3.clone.1
  %204 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %4
  %205 = load double, ptr %204, align 8, !invariant.load !182
  %multiply.3526.1.clone.1 = fmul double %multiply.3525.3, %205
  %constant_779_86 = load double, ptr @225, align 8
  %multiply.3570.9.clone.1 = fmul double %multiply.3564.7, %constant_779_86
  %206 = fneg double %multiply.3570.9.clone.1
  %207 = getelementptr inbounds [4 x double], ptr %arg17, i32 0, i32 %4
  %208 = load double, ptr %207, align 8, !invariant.load !182
  %multiply.3572.5.clone.1 = fmul double %206, %208
  %multiply.3573.3.clone.1 = fmul double %multiply.3526.1.clone.1, %multiply.3572.5.clone.1
  %add.1059.3.clone.1 = fadd double %multiply.3569.3.clone.1, %multiply.3573.3.clone.1
  %multiply.3574.5.clone.1 = fmul double %add.1059.3.clone.1, %66
  %add.1060.3.clone.1 = fadd double %multiply.3558.3.clone.1, %multiply.3574.5.clone.1
  %209 = getelementptr double, ptr %arg16, i32 %linear_index
  %210 = getelementptr inbounds double, ptr %209, i32 0
  %211 = load double, ptr %210, align 8
  %212 = trunc i8 %8 to i1
  %213 = select i1 %212, double %add.1060.3.clone.1, double %211
  %214 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %196, double %213, 1
  %215 = getelementptr double, ptr %arg19, i32 %linear_index
  %216 = getelementptr inbounds double, ptr %215, i32 0
  %217 = load double, ptr %216, align 8
  %218 = trunc i8 %8 to i1
  %219 = select i1 %218, double %multiply.3560.15, double %217
  %220 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %214, double %219, 2
  %221 = getelementptr double, ptr %arg20, i32 %linear_index
  %222 = getelementptr inbounds double, ptr %221, i32 0
  %223 = load double, ptr %222, align 8
  %224 = trunc i8 %8 to i1
  %225 = select i1 %224, double %multiply.3564.7, double %223
  %226 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %220, double %225, 3
  %227 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %4
  %228 = load double, ptr %227, align 8, !invariant.load !182
  %multiply.3595.5.clone.1 = fmul double %79, %228
  %229 = getelementptr inbounds [4 x double], ptr %arg22, i32 0, i32 %4
  %230 = load double, ptr %229, align 8, !invariant.load !182
  %231 = trunc i8 %74 to i1
  %232 = select i1 %231, double %multiply.3524.29, double %230
  %multiply.3596.3.clone.1 = fmul double %232, %multiply.3564.7
  %add.1068.3.clone.1 = fadd double %multiply.3595.5.clone.1, %multiply.3596.3.clone.1
  %233 = getelementptr double, ptr %arg21, i32 %linear_index
  %234 = getelementptr inbounds double, ptr %233, i32 0
  %235 = load double, ptr %234, align 8
  %236 = trunc i8 %8 to i1
  %237 = select i1 %236, double %add.1068.3.clone.1, double %235
  %238 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %226, double %237, 4
  %239 = getelementptr double, ptr %arg23, i32 %linear_index
  %240 = getelementptr inbounds double, ptr %239, i32 0
  %241 = load double, ptr %240, align 8
  %242 = trunc i8 %8 to i1
  %243 = select i1 %242, double %add.1054.1.clone.1, double %241
  %244 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %238, double %243, 5
  %245 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %244, double %add.1054.1.clone.1, 6
  %246 = getelementptr double, ptr %arg39, i32 %linear_index
  %247 = getelementptr inbounds double, ptr %246, i32 0
  %248 = load double, ptr %247, align 8
  %249 = trunc i8 %8 to i1
  %250 = select i1 %249, double %add.1051.1.clone.1, double %248
  %251 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %245, double %250, 7
  %252 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %251, double %add.1051.1.clone.1, 8
  %253 = getelementptr double, ptr %arg44, i32 %linear_index
  %254 = getelementptr inbounds double, ptr %253, i32 0
  %255 = load double, ptr %254, align 8
  %256 = trunc i8 %8 to i1
  %257 = select i1 %256, double %subtract.149.13.clone.1, double %255
  %258 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %252, double %257, 9
  %259 = getelementptr double, ptr %arg30, i32 %linear_index
  %260 = getelementptr inbounds double, ptr %259, i32 0
  %261 = load double, ptr %260, align 8, !invariant.load !182
  %262 = trunc i8 %8 to i1
  %263 = select i1 %262, double %add.1050.14.clone.1, double %261
  %264 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %258, double %263, 10
  %265 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %264, double %add.1048.1.clone.1, 11
  %266 = getelementptr double, ptr %arg37, i32 %linear_index
  %267 = getelementptr inbounds double, ptr %266, i32 0
  %268 = load double, ptr %267, align 8
  %269 = getelementptr double, ptr %arg47, i32 %linear_index
  %270 = getelementptr inbounds double, ptr %269, i32 0
  %271 = load double, ptr %270, align 8
  %272 = trunc i8 %8 to i1
  %273 = select i1 %272, double %268, double %271
  %274 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %265, double %273, 12
  %275 = getelementptr double, ptr %arg48, i32 %linear_index
  %276 = getelementptr inbounds double, ptr %275, i32 0
  %277 = load double, ptr %276, align 8
  %278 = trunc i8 %8 to i1
  %279 = select i1 %278, double %add.1047.21.clone.1, double %277
  %280 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %274, double %279, 13
  %281 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %280, double %divide.870.1.clone.1, 14
  %282 = getelementptr double, ptr %arg49, i32 %linear_index
  %283 = getelementptr inbounds double, ptr %282, i32 0
  %284 = load double, ptr %283, align 8
  %285 = trunc i8 %8 to i1
  %286 = select i1 %285, double %multiply.3558.3.clone.1, double %284
  %287 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %281, double %286, 15
  %288 = getelementptr double, ptr %arg28, i32 %linear_index
  %289 = getelementptr inbounds double, ptr %288, i32 0
  %290 = load double, ptr %289, align 8, !invariant.load !182
  %291 = getelementptr double, ptr %arg50, i32 %linear_index
  %292 = getelementptr inbounds double, ptr %291, i32 0
  %293 = load double, ptr %292, align 8
  %294 = trunc i8 %8 to i1
  %295 = select i1 %294, double %290, double %293
  %296 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %287, double %295, 16
  %297 = getelementptr double, ptr %arg28, i32 %linear_index
  %298 = getelementptr inbounds double, ptr %297, i32 0
  %299 = load double, ptr %298, align 8, !invariant.load !182
  %300 = getelementptr double, ptr %arg51, i32 %linear_index
  %301 = getelementptr inbounds double, ptr %300, i32 0
  %302 = load double, ptr %301, align 8
  %303 = trunc i8 %8 to i1
  %304 = select i1 %303, double %299, double %302
  %305 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %296, double %304, 17
  %306 = getelementptr double, ptr %arg52, i32 %linear_index
  %307 = getelementptr inbounds double, ptr %306, i32 0
  %308 = load double, ptr %307, align 8
  %309 = trunc i8 %8 to i1
  %310 = select i1 %309, double %multiply.3504.33.clone.1, double %308
  %311 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %305, double %310, 18
  %312 = getelementptr double, ptr %arg53, i32 %linear_index
  %313 = getelementptr inbounds double, ptr %312, i32 0
  %314 = load double, ptr %313, align 8
  %315 = trunc i8 %8 to i1
  %316 = select i1 %315, double %multiply.3505.11.clone.1, double %314
  %317 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %311, double %316, 19
  %318 = getelementptr double, ptr %arg47, i32 %linear_index
  %319 = getelementptr inbounds double, ptr %318, i32 0
  %320 = load double, ptr %319, align 8
  %321 = fneg double %320
  %322 = getelementptr inbounds [4 x double], ptr %arg55, i32 0, i32 %4
  %323 = load double, ptr %322, align 8, !invariant.load !182
  %multiply.3509.3.clone.1 = fmul double %321, %323
  %324 = getelementptr double, ptr %arg54, i32 %linear_index
  %325 = getelementptr inbounds double, ptr %324, i32 0
  %326 = load double, ptr %325, align 8
  %327 = trunc i8 %8 to i1
  %328 = select i1 %327, double %multiply.3509.3.clone.1, double %326
  %329 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %317, double %328, 20
  %330 = getelementptr double, ptr %arg32, i32 %linear_index
  %331 = getelementptr inbounds double, ptr %330, i32 0
  %332 = load double, ptr %331, align 8, !invariant.load !182
  %333 = getelementptr double, ptr %arg56, i32 %linear_index
  %334 = getelementptr inbounds double, ptr %333, i32 0
  %335 = load double, ptr %334, align 8
  %336 = trunc i8 %8 to i1
  %337 = select i1 %336, double %332, double %335
  %338 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %329, double %337, 21
  %339 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 0
  %340 = getelementptr double, ptr %arg0, i32 %linear_index
  %341 = getelementptr inbounds double, ptr %340, i32 0
  store double %339, ptr %341, align 8
  %342 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 1
  %343 = getelementptr double, ptr %arg16, i32 %linear_index
  %344 = getelementptr inbounds double, ptr %343, i32 0
  store double %342, ptr %344, align 8
  %345 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 2
  %346 = getelementptr double, ptr %arg19, i32 %linear_index
  %347 = getelementptr inbounds double, ptr %346, i32 0
  store double %345, ptr %347, align 8
  %348 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 3
  %349 = getelementptr double, ptr %arg20, i32 %linear_index
  %350 = getelementptr inbounds double, ptr %349, i32 0
  store double %348, ptr %350, align 8
  %351 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 4
  %352 = getelementptr double, ptr %arg21, i32 %linear_index
  %353 = getelementptr inbounds double, ptr %352, i32 0
  store double %351, ptr %353, align 8
  %354 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 5
  %355 = getelementptr double, ptr %arg23, i32 %linear_index
  %356 = getelementptr inbounds double, ptr %355, i32 0
  store double %354, ptr %356, align 8
  %357 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 6
  %358 = getelementptr double, ptr %arg37, i32 %linear_index
  %359 = getelementptr inbounds double, ptr %358, i32 0
  store double %357, ptr %359, align 8
  %360 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 7
  %361 = getelementptr double, ptr %arg39, i32 %linear_index
  %362 = getelementptr inbounds double, ptr %361, i32 0
  store double %360, ptr %362, align 8
  %363 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 8
  %364 = getelementptr double, ptr %arg57, i32 %linear_index
  %365 = getelementptr inbounds double, ptr %364, i32 0
  store double %363, ptr %365, align 8
  %366 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 9
  %367 = getelementptr double, ptr %arg44, i32 %linear_index
  %368 = getelementptr inbounds double, ptr %367, i32 0
  store double %366, ptr %368, align 8
  %369 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 10
  %370 = getelementptr double, ptr %arg58, i32 %linear_index
  %371 = getelementptr inbounds double, ptr %370, i32 0
  store double %369, ptr %371, align 8
  %372 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 11
  %373 = getelementptr double, ptr %arg59, i32 %linear_index
  %374 = getelementptr inbounds double, ptr %373, i32 0
  store double %372, ptr %374, align 8
  %375 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 12
  %376 = getelementptr double, ptr %arg47, i32 %linear_index
  %377 = getelementptr inbounds double, ptr %376, i32 0
  store double %375, ptr %377, align 8
  %378 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 13
  %379 = getelementptr double, ptr %arg48, i32 %linear_index
  %380 = getelementptr inbounds double, ptr %379, i32 0
  store double %378, ptr %380, align 8
  %381 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 14
  %382 = getelementptr double, ptr %arg60, i32 %linear_index
  %383 = getelementptr inbounds double, ptr %382, i32 0
  store double %381, ptr %383, align 8
  %384 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 15
  %385 = getelementptr double, ptr %arg49, i32 %linear_index
  %386 = getelementptr inbounds double, ptr %385, i32 0
  store double %384, ptr %386, align 8
  %387 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 16
  %388 = getelementptr double, ptr %arg50, i32 %linear_index
  %389 = getelementptr inbounds double, ptr %388, i32 0
  store double %387, ptr %389, align 8
  %390 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 17
  %391 = getelementptr double, ptr %arg51, i32 %linear_index
  %392 = getelementptr inbounds double, ptr %391, i32 0
  store double %390, ptr %392, align 8
  %393 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 18
  %394 = getelementptr double, ptr %arg52, i32 %linear_index
  %395 = getelementptr inbounds double, ptr %394, i32 0
  store double %393, ptr %395, align 8
  %396 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 19
  %397 = getelementptr double, ptr %arg53, i32 %linear_index
  %398 = getelementptr inbounds double, ptr %397, i32 0
  store double %396, ptr %398, align 8
  %399 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 20
  %400 = getelementptr double, ptr %arg54, i32 %linear_index
  %401 = getelementptr inbounds double, ptr %400, i32 0
  store double %399, ptr %401, align 8
  %402 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %338, 21
  %403 = getelementptr double, ptr %arg56, i32 %linear_index
  %404 = getelementptr inbounds double, ptr %403, i32 0
  store double %402, ptr %404, align 8
  br label %loop_add_divide_select_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_9(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(768) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(768) %arg8) {
entry:
  %param_3.1111 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_770_60 = load i64, ptr @231, align 8
  %0 = icmp slt i64 %param_3.1111, %constant_770_60
  %1 = zext i1 %0 to i8
  %param_3.11111 = load i64, ptr %arg3, align 8, !invariant.load !182
  %constant_769_90 = load i64, ptr @230, align 8
  %2 = add i64 %param_3.11111, %constant_769_90
  %param_3.11112 = load i64, ptr %arg3, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11112
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_603 = load i64, ptr @231, align 8
  %9 = icmp sge i64 0, %constant_770_603
  %10 = select i1 %9, i64 0, i64 %constant_770_603
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_604 = load i64, ptr @231, align 8
  %13 = icmp sge i64 0, %constant_770_604
  %14 = select i1 %13, i64 0, i64 %constant_770_604
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2117.1.in_bounds-true, label %dynamic-update-slice.2117.1.in_bounds-after

dynamic-update-slice.2117.1.in_bounds-after:      ; preds = %dynamic-update-slice.2117.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2117.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.369 = getelementptr inbounds double, ptr %29, i64 0
  %param_8.3695 = load double, ptr %param_8.369, align 8, !invariant.load !182
  %param_6.548 = getelementptr inbounds [4 x double], ptr %arg6, i64 0, i64 %21
  %param_6.5486 = load double, ptr %param_6.548, align 8, !invariant.load !182
  %param_7.446 = getelementptr inbounds [4 x double], ptr %arg7, i64 0, i64 %21
  %param_7.4467 = load double, ptr %param_7.446, align 8, !invariant.load !182
  %multiply.3518.18 = fmul double %param_6.5486, %param_7.4467
  %multiply.3565.9 = fmul double %param_8.3695, %multiply.3518.18
  %param_5.800 = getelementptr inbounds [4 x [1 x double]], ptr %arg5, i64 0, i64 %21, i64 0
  %param_5.8008 = load double, ptr %param_5.800, align 8, !invariant.load !182
  %30 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.914 = getelementptr inbounds double, ptr %30, i64 0
  %param_4.9149 = load double, ptr %param_4.914, align 8, !invariant.load !182
  %multiply.3566.7 = fmul double %param_5.8008, %param_4.9149
  %add.1057.7 = fadd double %multiply.3565.9, %multiply.3566.7
  %param_2.1293 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.129310 = load double, ptr %param_2.1293, align 8, !invariant.load !182
  %multiply.3567.5 = fmul double %add.1057.7, %param_2.129310
  %multiply.3525.7 = fmul double %param_5.8008, %multiply.3518.18
  %31 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1502 = getelementptr inbounds double, ptr %31, i64 0
  %param_1.150211 = load double, ptr %param_1.1502, align 8, !invariant.load !182
  %multiply.3568.3 = fmul double %multiply.3525.7, %param_1.150211
  %add.1058.3 = fadd double %multiply.3567.5, %multiply.3568.3
  %32 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %add.1058.3, ptr %32, align 8
  br label %dynamic-update-slice.2117.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_15(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(768) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(768) %arg7, ptr noalias align 128 dereferenceable(768) %arg8, ptr noalias align 128 dereferenceable(768) %arg9, ptr noalias align 16 dereferenceable(32) %arg10, ptr noalias align 16 dereferenceable(32) %arg11, ptr noalias align 16 dereferenceable(1536) %arg12, ptr noalias align 128 dereferenceable(32) %arg13, ptr noalias align 128 dereferenceable(32) %arg14, ptr noalias align 16 dereferenceable(6144) %arg15) {
entry:
  %param_1.1527 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_85 = load i64, ptr @234, align 8
  %0 = icmp slt i64 %param_1.1527, %constant_770_85
  %1 = zext i1 %0 to i8
  %param_1.15271 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_107 = load i64, ptr @233, align 8
  %2 = add i64 %param_1.15271, %constant_769_107
  %param_1.15272 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15272
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_853 = load i64, ptr @234, align 8
  %9 = icmp sge i64 0, %constant_770_853
  %10 = select i1 %9, i64 0, i64 %constant_770_853
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_854 = load i64, ptr @234, align 8
  %13 = icmp sge i64 0, %constant_770_854
  %14 = select i1 %13, i64 0, i64 %constant_770_854
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2110.1.in_bounds-true, label %dynamic-update-slice.2110.1.in_bounds-after

dynamic-update-slice.2110.1.in_bounds-after:      ; preds = %dynamic-update-slice.2110.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2110.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_10.311 = getelementptr inbounds [4 x double], ptr %arg10, i64 0, i64 %21
  %param_10.3115 = load double, ptr %param_10.311, align 8, !invariant.load !182
  %29 = getelementptr double, ptr %arg9, i64 %linear_index
  %param_9.367 = getelementptr inbounds double, ptr %29, i64 0
  %param_9.3676 = load double, ptr %param_9.367, align 8, !invariant.load !182
  %multiply.3504.31 = fmul double %param_10.3115, %param_9.3676
  %30 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.418 = getelementptr inbounds double, ptr %30, i64 0
  %param_8.4187 = load double, ptr %param_8.418, align 8, !invariant.load !182
  %param_3.1175 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11758 = load double, ptr %param_3.1175, align 8, !invariant.load !182
  %param_4.974 = load double, ptr %arg4, align 8, !invariant.load !182
  %multiply.3516.37 = fmul double %param_3.11758, %param_4.974
  %multiply.3547.13 = fmul double %param_8.4187, %multiply.3516.37
  %param_2.1370 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.13709 = load double, ptr %param_2.1370, align 8, !invariant.load !182
  %31 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.857 = getelementptr inbounds double, ptr %31, i64 0
  %param_5.85710 = load double, ptr %param_5.857, align 8, !invariant.load !182
  %32 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.494 = getelementptr inbounds double, ptr %32, i64 0
  %param_7.49411 = load double, ptr %param_7.494, align 8, !invariant.load !182
  %33 = fneg double %param_7.49411
  %param_1.152712 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_8513 = load i64, ptr @234, align 8
  %34 = icmp slt i64 %param_1.152712, %constant_770_8513
  %35 = zext i1 %34 to i8
  %param_1.152714 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_10715 = load i64, ptr @233, align 8
  %36 = add i64 %param_1.152714, %constant_769_10715
  %param_1.152716 = load i64, ptr %arg1, align 8, !invariant.load !182
  %37 = trunc i8 %35 to i1
  %38 = select i1 %37, i64 %36, i64 %param_1.152716
  %39 = icmp sge i64 0, %38
  %40 = select i1 %39, i64 0, i64 %38
  %41 = icmp sle i64 191, %40
  %dynamic-slice.56.20.start_idx0 = select i1 %41, i64 191, i64 %40
  %constant_770_8517 = load i64, ptr @234, align 8
  %42 = icmp sge i64 0, %constant_770_8517
  %43 = select i1 %42, i64 0, i64 %constant_770_8517
  %44 = icmp sle i64 0, %43
  %dynamic-slice.56.20.start_idx1 = select i1 %44, i64 0, i64 %43
  %constant_770_8518 = load i64, ptr @234, align 8
  %45 = icmp sge i64 0, %constant_770_8518
  %46 = select i1 %45, i64 0, i64 %constant_770_8518
  %47 = icmp sle i64 0, %46
  %dynamic-slice.56.20.start_idx2 = select i1 %47, i64 0, i64 %46
  %48 = add i64 %dynamic-slice.56.20.start_idx0, 0
  %49 = add i64 %dynamic-slice.56.20.start_idx1, %21
  %50 = add i64 %dynamic-slice.56.20.start_idx2, 0
  %param_15.150 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg15, i64 0, i64 %48, i64 %49, i64 0
  %param_15.15019 = load double, ptr %param_15.150, align 8, !invariant.load !182
  %param_14.166 = getelementptr inbounds [4 x double], ptr %arg14, i64 0, i64 %21
  %param_14.16620 = load double, ptr %param_14.166, align 8, !invariant.load !182
  %subtract.146.21 = fsub double %param_15.15019, %param_14.16620
  %multiply.3515.19 = fmul double %subtract.146.21, %param_4.974
  %multiply.3540.19 = fmul double %33, %multiply.3515.19
  %param_6.598 = getelementptr inbounds [4 x double], ptr %arg6, i64 0, i64 %21
  %param_6.59821 = load double, ptr %param_6.598, align 8, !invariant.load !182
  %multiply.3542.21 = fmul double %multiply.3540.19, %param_6.59821
  %add.1047.19 = fadd double %param_5.85710, %multiply.3542.21
  %param_4.97422 = load double, ptr %arg4, align 8, !invariant.load !182
  %multiply.3548.15 = fmul double %add.1047.19, %param_4.97422
  %multiply.3549.15 = fmul double %param_2.13709, %multiply.3548.15
  %add.1049.13 = fadd double %multiply.3547.13, %multiply.3549.15
  %add.1050.12 = fadd double %multiply.3504.31, %add.1049.13
  %subtract.149.11 = fsub double %add.1050.12, %multiply.3504.31
  %param_10.31123 = getelementptr inbounds [4 x double], ptr %arg10, i64 0, i64 %21
  %param_10.31124 = load double, ptr %param_10.31123, align 8, !invariant.load !182
  %param_13.194 = getelementptr inbounds [4 x double], ptr %arg13, i64 0, i64 %21
  %param_13.19425 = load double, ptr %param_13.194, align 8, !invariant.load !182
  %multiply.3498.15 = fmul double %param_10.31124, %param_13.19425
  %51 = icmp sge i64 0, %38
  %52 = select i1 %51, i64 0, i64 %38
  %53 = icmp sle i64 191, %52
  %dynamic-slice.54.44.start_idx0 = select i1 %53, i64 191, i64 %52
  %54 = add i64 %dynamic-slice.54.44.start_idx0, 0
  %param_12.234 = getelementptr inbounds [192 x double], ptr %arg12, i64 0, i64 %54
  %param_12.23426 = load double, ptr %param_12.234, align 8, !invariant.load !182
  %param_11.252 = getelementptr inbounds [4 x double], ptr %arg11, i64 0, i64 %21
  %param_11.25227 = load double, ptr %param_11.252, align 8, !invariant.load !182
  %multiply.3499.17 = fmul double %param_12.23426, %param_11.25227
  %add.1031.15 = fadd double %multiply.3498.15, %multiply.3499.17
  %param_2.137028 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.137029 = load double, ptr %param_2.137028, align 8, !invariant.load !182
  %multiply.3517.19 = fmul double %param_2.137029, %multiply.3516.37
  %add.1038.19 = fadd double %add.1031.15, %multiply.3517.19
  %subtract.147.8 = fsub double %add.1038.19, %add.1031.15
  %constant_779_17 = load double, ptr @232, align 8
  %multiply.3555.7 = fmul double %subtract.147.8, %constant_779_17
  %multiply.3556.3 = fmul double %subtract.149.11, %multiply.3555.7
  %55 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3556.3, ptr %55, align 8
  br label %dynamic-update-slice.2110.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_14(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(768) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(768) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(768) %arg7, ptr noalias align 128 dereferenceable(32) %arg8, ptr noalias align 128 dereferenceable(768) %arg9, ptr noalias align 16 dereferenceable(32) %arg10, ptr noalias align 128 dereferenceable(32) %arg11, ptr noalias align 16 dereferenceable(6144) %arg12) {
entry:
  %param_1.1524 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_82 = load i64, ptr @236, align 8
  %0 = icmp slt i64 %param_1.1524, %constant_770_82
  %1 = zext i1 %0 to i8
  %param_1.15241 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_108 = load i64, ptr @237, align 8
  %2 = add i64 %param_1.15241, %constant_769_108
  %param_1.15242 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15242
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_823 = load i64, ptr @236, align 8
  %9 = icmp sge i64 0, %constant_770_823
  %10 = select i1 %9, i64 0, i64 %constant_770_823
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_824 = load i64, ptr @236, align 8
  %13 = icmp sge i64 0, %constant_770_824
  %14 = select i1 %13, i64 0, i64 %constant_770_824
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2111.1.in_bounds-true, label %dynamic-update-slice.2111.1.in_bounds-after

dynamic-update-slice.2111.1.in_bounds-after:      ; preds = %dynamic-update-slice.2111.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2111.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_10.308 = getelementptr inbounds [4 x double], ptr %arg10, i64 0, i64 %21
  %param_10.3085 = load double, ptr %param_10.308, align 8, !invariant.load !182
  %29 = getelementptr double, ptr %arg9, i64 %linear_index
  %param_9.363 = getelementptr inbounds double, ptr %29, i64 0
  %param_9.3636 = load double, ptr %param_9.363, align 8, !invariant.load !182
  %multiply.3504.29 = fmul double %param_10.3085, %param_9.3636
  %30 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.488 = getelementptr inbounds double, ptr %30, i64 0
  %param_7.4887 = load double, ptr %param_7.488, align 8, !invariant.load !182
  %param_8.411 = getelementptr inbounds [4 x double], ptr %arg8, i64 0, i64 %21
  %param_8.4118 = load double, ptr %param_8.411, align 8, !invariant.load !182
  %param_2.1364 = load double, ptr %arg2, align 8, !invariant.load !182
  %multiply.3516.33 = fmul double %param_8.4118, %param_2.1364
  %multiply.3547.11 = fmul double %param_7.4887, %multiply.3516.33
  %param_6.593 = getelementptr inbounds [4 x double], ptr %arg6, i64 0, i64 %21
  %param_6.5939 = load double, ptr %param_6.593, align 8, !invariant.load !182
  %31 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1170 = getelementptr inbounds double, ptr %31, i64 0
  %param_3.117010 = load double, ptr %param_3.1170, align 8, !invariant.load !182
  %32 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.852 = getelementptr inbounds double, ptr %32, i64 0
  %param_5.85211 = load double, ptr %param_5.852, align 8, !invariant.load !182
  %33 = fneg double %param_5.85211
  %param_1.152412 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_8213 = load i64, ptr @236, align 8
  %34 = icmp slt i64 %param_1.152412, %constant_770_8213
  %35 = zext i1 %34 to i8
  %param_1.152414 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_10815 = load i64, ptr @237, align 8
  %36 = add i64 %param_1.152414, %constant_769_10815
  %param_1.152416 = load i64, ptr %arg1, align 8, !invariant.load !182
  %37 = trunc i8 %35 to i1
  %38 = select i1 %37, i64 %36, i64 %param_1.152416
  %39 = icmp sge i64 0, %38
  %40 = select i1 %39, i64 0, i64 %38
  %41 = icmp sle i64 191, %40
  %dynamic-slice.56.18.start_idx0 = select i1 %41, i64 191, i64 %40
  %constant_770_8217 = load i64, ptr @236, align 8
  %42 = icmp sge i64 0, %constant_770_8217
  %43 = select i1 %42, i64 0, i64 %constant_770_8217
  %44 = icmp sle i64 0, %43
  %dynamic-slice.56.18.start_idx1 = select i1 %44, i64 0, i64 %43
  %constant_770_8218 = load i64, ptr @236, align 8
  %45 = icmp sge i64 0, %constant_770_8218
  %46 = select i1 %45, i64 0, i64 %constant_770_8218
  %47 = icmp sle i64 0, %46
  %dynamic-slice.56.18.start_idx2 = select i1 %47, i64 0, i64 %46
  %48 = add i64 %dynamic-slice.56.18.start_idx0, 0
  %49 = add i64 %dynamic-slice.56.18.start_idx1, %21
  %50 = add i64 %dynamic-slice.56.18.start_idx2, 0
  %param_12.231 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg12, i64 0, i64 %48, i64 %49, i64 0
  %param_12.23119 = load double, ptr %param_12.231, align 8, !invariant.load !182
  %param_11.249 = getelementptr inbounds [4 x double], ptr %arg11, i64 0, i64 %21
  %param_11.24920 = load double, ptr %param_11.249, align 8, !invariant.load !182
  %subtract.146.19 = fsub double %param_12.23119, %param_11.24920
  %multiply.3515.17 = fmul double %subtract.146.19, %param_2.1364
  %multiply.3540.17 = fmul double %33, %multiply.3515.17
  %param_4.968 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.96821 = load double, ptr %param_4.968, align 8, !invariant.load !182
  %multiply.3542.19 = fmul double %multiply.3540.17, %param_4.96821
  %add.1047.17 = fadd double %param_3.117010, %multiply.3542.19
  %param_2.136422 = load double, ptr %arg2, align 8, !invariant.load !182
  %multiply.3548.13 = fmul double %add.1047.17, %param_2.136422
  %multiply.3549.13 = fmul double %param_6.5939, %multiply.3548.13
  %add.1049.11 = fadd double %multiply.3547.11, %multiply.3549.13
  %add.1050.10 = fadd double %multiply.3504.29, %add.1049.11
  %subtract.149.9 = fsub double %add.1050.10, %multiply.3504.29
  %constant_779_5 = load double, ptr @235, align 8
  %multiply.3615.3 = fmul double %subtract.149.9, %constant_779_5
  %51 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3615.3, ptr %51, align 8
  br label %dynamic-update-slice.2111.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_17(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(768) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(6144) %arg7) {
entry:
  %param_5.811 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_770_97 = load i64, ptr @238, align 8
  %0 = icmp slt i64 %param_5.811, %constant_770_97
  %1 = zext i1 %0 to i8
  %param_5.8111 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_769_104 = load i64, ptr @239, align 8
  %2 = add i64 %param_5.8111, %constant_769_104
  %param_5.8112 = load i64, ptr %arg5, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_5.8112
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_973 = load i64, ptr @238, align 8
  %9 = icmp sge i64 0, %constant_770_973
  %10 = select i1 %9, i64 0, i64 %constant_770_973
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_974 = load i64, ptr @238, align 8
  %13 = icmp sge i64 0, %constant_770_974
  %14 = select i1 %13, i64 0, i64 %constant_770_974
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2108.1.in_bounds-true, label %dynamic-update-slice.2108.1.in_bounds-after

dynamic-update-slice.2108.1.in_bounds-after:      ; preds = %dynamic-update-slice.2108.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2108.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1330 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.13305 = load double, ptr %param_2.1330, align 8, !invariant.load !182
  %30 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.926 = getelementptr inbounds double, ptr %30, i64 0
  %param_4.9266 = load double, ptr %param_4.926, align 8, !invariant.load !182
  %31 = fneg double %param_4.9266
  %param_5.8117 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_770_978 = load i64, ptr @238, align 8
  %32 = icmp slt i64 %param_5.8117, %constant_770_978
  %33 = zext i1 %32 to i8
  %param_5.8119 = load i64, ptr %arg5, align 8, !invariant.load !182
  %constant_769_10410 = load i64, ptr @239, align 8
  %34 = add i64 %param_5.8119, %constant_769_10410
  %param_5.81111 = load i64, ptr %arg5, align 8, !invariant.load !182
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, i64 %34, i64 %param_5.81111
  %37 = icmp sge i64 0, %36
  %38 = select i1 %37, i64 0, i64 %36
  %39 = icmp sle i64 191, %38
  %dynamic-slice.56.12.start_idx0 = select i1 %39, i64 191, i64 %38
  %constant_770_9712 = load i64, ptr @238, align 8
  %40 = icmp sge i64 0, %constant_770_9712
  %41 = select i1 %40, i64 0, i64 %constant_770_9712
  %42 = icmp sle i64 0, %41
  %dynamic-slice.56.12.start_idx1 = select i1 %42, i64 0, i64 %41
  %constant_770_9713 = load i64, ptr @238, align 8
  %43 = icmp sge i64 0, %constant_770_9713
  %44 = select i1 %43, i64 0, i64 %constant_770_9713
  %45 = icmp sle i64 0, %44
  %dynamic-slice.56.12.start_idx2 = select i1 %45, i64 0, i64 %44
  %46 = add i64 %dynamic-slice.56.12.start_idx0, 0
  %47 = add i64 %dynamic-slice.56.12.start_idx1, %21
  %48 = add i64 %dynamic-slice.56.12.start_idx2, 0
  %param_7.454 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg7, i64 0, i64 %46, i64 %47, i64 0
  %param_7.45414 = load double, ptr %param_7.454, align 8, !invariant.load !182
  %param_6.557 = getelementptr inbounds [4 x double], ptr %arg6, i64 0, i64 %21
  %param_6.55715 = load double, ptr %param_6.557, align 8, !invariant.load !182
  %subtract.146.13 = fsub double %param_7.45414, %param_6.55715
  %param_1.1539 = load double, ptr %arg1, align 8, !invariant.load !182
  %multiply.3515.11 = fmul double %subtract.146.13, %param_1.1539
  %multiply.3540.7 = fmul double %31, %multiply.3515.11
  %param_3.1128 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.112816 = load double, ptr %param_3.1128, align 8, !invariant.load !182
  %multiply.3542.9 = fmul double %multiply.3540.7, %param_3.112816
  %add.1047.7 = fadd double %param_2.13305, %multiply.3542.9
  %param_1.153917 = load double, ptr %arg1, align 8, !invariant.load !182
  %multiply.3548.3 = fmul double %add.1047.7, %param_1.153917
  %49 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3548.3, ptr %49, align 8
  br label %dynamic-update-slice.2108.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_2(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(32) %arg3) {
entry:
  %param_2.1350 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_770_25 = load i64, ptr @242, align 8
  %0 = icmp slt i64 %param_2.1350, %constant_770_25
  %1 = zext i1 %0 to i8
  %param_2.13501 = load i64, ptr %arg2, align 8, !invariant.load !182
  %constant_769_29 = load i64, ptr @243, align 8
  %2 = add i64 %param_2.13501, %constant_769_29
  %param_2.13502 = load i64, ptr %arg2, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13502
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_253 = load i64, ptr @242, align 8
  %9 = icmp sge i64 0, %constant_770_253
  %10 = select i1 %9, i64 0, i64 %constant_770_253
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_254 = load i64, ptr @242, align 8
  %13 = icmp sge i64 0, %constant_770_254
  %14 = select i1 %13, i64 0, i64 %constant_770_254
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2125.1.in_bounds-true, label %dynamic-update-slice.2125.1.in_bounds-after

dynamic-update-slice.2125.1.in_bounds-after:      ; preds = %dynamic-update-slice.2125.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2125.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1178 = getelementptr inbounds [4 x i64], ptr %arg3, i64 0, i64 %21
  %param_3.11785 = load i64, ptr %param_3.1178, align 8, !invariant.load !182
  %constant_770_256 = load i64, ptr @242, align 8
  %29 = icmp ne i64 %param_3.11785, %constant_770_256
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_780_5 = load i32, ptr @241, align 4
  %32 = icmp eq i32 %31, %constant_780_5
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1467 = getelementptr inbounds double, ptr %34, i64 0
  %param_1.14677 = load double, ptr %param_1.1467, align 8, !invariant.load !182
  %constant_776_9 = load double, ptr @240, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_1.14677, double %constant_776_9
  %37 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %36, ptr %37, align 8
  br label %dynamic-update-slice.2125.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_11(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(768) %arg6) {
entry:
  %param_1.1508 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_66 = load i64, ptr @245, align 8
  %0 = icmp slt i64 %param_1.1508, %constant_770_66
  %1 = zext i1 %0 to i8
  %param_1.15081 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_106 = load i64, ptr @244, align 8
  %2 = add i64 %param_1.15081, %constant_769_106
  %param_1.15082 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15082
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_663 = load i64, ptr @245, align 8
  %9 = icmp sge i64 0, %constant_770_663
  %10 = select i1 %9, i64 0, i64 %constant_770_663
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_664 = load i64, ptr @245, align 8
  %13 = icmp sge i64 0, %constant_770_664
  %14 = select i1 %13, i64 0, i64 %constant_770_664
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2115.1.in_bounds-true, label %dynamic-update-slice.2115.1.in_bounds-after

dynamic-update-slice.2115.1.in_bounds-after:      ; preds = %dynamic-update-slice.2115.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2115.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.550 = getelementptr inbounds double, ptr %29, i64 0
  %param_6.5505 = load double, ptr %param_6.550, align 8, !invariant.load !182
  %param_4.917 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9176 = load double, ptr %param_4.917, align 8, !invariant.load !182
  %param_5.802 = getelementptr inbounds [4 x double], ptr %arg5, i64 0, i64 %21
  %param_5.8027 = load double, ptr %param_5.802, align 8, !invariant.load !182
  %multiply.3518.14 = fmul double %param_4.9176, %param_5.8027
  %multiply.3565.5 = fmul double %param_6.5505, %multiply.3518.14
  %param_3.1115 = getelementptr inbounds [4 x [1 x double]], ptr %arg3, i64 0, i64 %21, i64 0
  %param_3.11158 = load double, ptr %param_3.1115, align 8, !invariant.load !182
  %30 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1299 = getelementptr inbounds double, ptr %30, i64 0
  %param_2.12999 = load double, ptr %param_2.1299, align 8, !invariant.load !182
  %multiply.3566.3 = fmul double %param_3.11158, %param_2.12999
  %add.1057.3 = fadd double %multiply.3565.5, %multiply.3566.3
  %31 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %add.1057.3, ptr %31, align 8
  br label %dynamic-update-slice.2115.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_1(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(768) %arg5, ptr noalias align 16 dereferenceable(768) %arg6, ptr noalias align 16 dereferenceable(32) %arg7) {
entry:
  %param_1.1563 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_21 = load i64, ptr @249, align 8
  %0 = icmp slt i64 %param_1.1563, %constant_770_21
  %1 = zext i1 %0 to i8
  %param_1.15631 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_23 = load i64, ptr @250, align 8
  %2 = add i64 %param_1.15631, %constant_769_23
  %param_1.15632 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15632
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_213 = load i64, ptr @249, align 8
  %9 = icmp sge i64 0, %constant_770_213
  %10 = select i1 %9, i64 0, i64 %constant_770_213
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_214 = load i64, ptr @249, align 8
  %13 = icmp sge i64 0, %constant_770_214
  %14 = select i1 %13, i64 0, i64 %constant_770_214
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2126.1.in_bounds-true, label %dynamic-update-slice.2126.1.in_bounds-after

dynamic-update-slice.2126.1.in_bounds-after:      ; preds = %dynamic-update-slice.2126.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2126.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_7.497 = getelementptr inbounds [4 x i64], ptr %arg7, i64 0, i64 %21
  %param_7.4975 = load i64, ptr %param_7.497, align 8, !invariant.load !182
  %constant_770_216 = load i64, ptr @249, align 8
  %29 = icmp ne i64 %param_7.4975, %constant_770_216
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_780_10 = load i32, ptr @248, align 4
  %32 = icmp eq i32 %31, %constant_780_10
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.596 = getelementptr inbounds double, ptr %34, i64 0
  %param_6.5967 = load double, ptr %param_6.596, align 8, !invariant.load !182
  %constant_776_14 = load double, ptr @247, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_6.5967, double %constant_776_14
  %param_2.1367 = getelementptr inbounds [4 x double], ptr %arg2, i64 0, i64 %21
  %param_2.13678 = load double, ptr %param_2.1367, align 8, !invariant.load !182
  %param_3.1173 = getelementptr inbounds [4 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11739 = load double, ptr %param_3.1173, align 8, !invariant.load !182
  %multiply.3518.50 = fmul double %param_2.13678, %param_3.11739
  %multiply.3580.9 = fmul double %36, %multiply.3518.50
  %param_4.972 = getelementptr inbounds [4 x [1 x double]], ptr %arg4, i64 0, i64 %21, i64 0
  %param_4.97210 = load double, ptr %param_4.972, align 8, !invariant.load !182
  %37 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.855 = getelementptr inbounds double, ptr %37, i64 0
  %param_5.85511 = load double, ptr %param_5.855, align 8, !invariant.load !182
  %constant_776_1412 = load double, ptr @247, align 8
  %38 = trunc i8 %33 to i1
  %39 = select i1 %38, double %param_5.85511, double %constant_776_1412
  %multiply.3581.9 = fmul double %param_4.97210, %39
  %add.1062.7 = fadd double %multiply.3580.9, %multiply.3581.9
  %multiply.3525.9 = fmul double %param_4.97210, %multiply.3518.50
  %constant_779_13 = load double, ptr @246, align 8
  %multiply.3582.7 = fmul double %multiply.3525.9, %constant_779_13
  %multiply.3583.3 = fmul double %add.1062.7, %multiply.3582.7
  %40 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3583.3, ptr %40, align 8
  br label %dynamic-update-slice.2126.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_3(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(768) %arg6, ptr noalias align 16 dereferenceable(32) %arg7) {
entry:
  %param_1.1559 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_33 = load i64, ptr @254, align 8
  %0 = icmp slt i64 %param_1.1559, %constant_770_33
  %1 = zext i1 %0 to i8
  %param_1.15591 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_46 = load i64, ptr @255, align 8
  %2 = add i64 %param_1.15591, %constant_769_46
  %param_1.15592 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15592
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_333 = load i64, ptr @254, align 8
  %9 = icmp sge i64 0, %constant_770_333
  %10 = select i1 %9, i64 0, i64 %constant_770_333
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_334 = load i64, ptr @254, align 8
  %13 = icmp sge i64 0, %constant_770_334
  %14 = select i1 %13, i64 0, i64 %constant_770_334
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2124.1.in_bounds-true, label %dynamic-update-slice.2124.1.in_bounds-after

dynamic-update-slice.2124.1.in_bounds-after:      ; preds = %dynamic-update-slice.2124.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2124.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_7.498 = getelementptr inbounds [4 x i64], ptr %arg7, i64 0, i64 %21
  %param_7.4985 = load i64, ptr %param_7.498, align 8, !invariant.load !182
  %constant_770_336 = load i64, ptr @254, align 8
  %29 = icmp ne i64 %param_7.4985, %constant_770_336
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_780_12 = load i32, ptr @253, align 4
  %32 = icmp eq i32 %31, %constant_780_12
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.590 = getelementptr inbounds double, ptr %34, i64 0
  %param_6.5907 = load double, ptr %param_6.590, align 8, !invariant.load !182
  %constant_776_24 = load double, ptr @252, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_6.5907, double %constant_776_24
  %param_4.965 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9658 = load double, ptr %param_4.965, align 8, !invariant.load !182
  %param_5.850 = getelementptr inbounds [4 x double], ptr %arg5, i64 0, i64 %21
  %param_5.8509 = load double, ptr %param_5.850, align 8, !invariant.load !182
  %multiply.3518.46 = fmul double %param_4.9658, %param_5.8509
  %multiply.3580.5 = fmul double %36, %multiply.3518.46
  %param_3.1167 = getelementptr inbounds [4 x [1 x double]], ptr %arg3, i64 0, i64 %21, i64 0
  %param_3.116710 = load double, ptr %param_3.1167, align 8, !invariant.load !182
  %37 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1361 = getelementptr inbounds double, ptr %37, i64 0
  %param_2.136111 = load double, ptr %param_2.1361, align 8, !invariant.load !182
  %constant_776_2412 = load double, ptr @252, align 8
  %38 = trunc i8 %33 to i1
  %39 = select i1 %38, double %param_2.136111, double %constant_776_2412
  %multiply.3581.5 = fmul double %param_3.116710, %39
  %add.1062.3 = fadd double %multiply.3580.5, %multiply.3581.5
  %constant_779_1 = load double, ptr @251, align 8
  %multiply.3623.3 = fmul double %add.1062.3, %constant_779_1
  %40 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3623.3, ptr %40, align 8
  br label %dynamic-update-slice.2124.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion(ptr noalias align 128 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(768) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(768) %arg6, ptr noalias align 16 dereferenceable(32) %arg7) {
entry:
  %param_1.1450 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_770_7 = load i64, ptr @258, align 8
  %0 = icmp slt i64 %param_1.1450, %constant_770_7
  %1 = zext i1 %0 to i8
  %param_1.14501 = load i64, ptr %arg1, align 8, !invariant.load !182
  %constant_769_14 = load i64, ptr @261, align 8
  %2 = add i64 %param_1.14501, %constant_769_14
  %param_1.14502 = load i64, ptr %arg1, align 8, !invariant.load !182
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14502
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_73 = load i64, ptr @258, align 8
  %9 = icmp sge i64 0, %constant_770_73
  %10 = select i1 %9, i64 0, i64 %constant_770_73
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_74 = load i64, ptr @258, align 8
  %13 = icmp sge i64 0, %constant_770_74
  %14 = select i1 %13, i64 0, i64 %constant_770_74
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 96
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 96
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 4
  %22 = udiv i64 %linear_index0, 4
  %23 = urem i64 %22, 24
  %24 = udiv i64 %linear_index0, 96
  %25 = icmp ult i64 %linear_index, 96
  br i1 %25, label %dynamic-update-slice.2129.1.in_bounds-true, label %dynamic-update-slice.2129.1.in_bounds-after

dynamic-update-slice.2129.1.in_bounds-after:      ; preds = %dynamic-update-slice.2129.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2129.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_7.502 = getelementptr inbounds [4 x i64], ptr %arg7, i64 0, i64 %21
  %param_7.5025 = load i64, ptr %param_7.502, align 8, !invariant.load !182
  %constant_770_76 = load i64, ptr @258, align 8
  %29 = icmp ne i64 %param_7.5025, %constant_770_76
  %30 = zext i1 %29 to i8
  %31 = zext i8 %30 to i32
  %constant_780_9 = load i32, ptr @257, align 4
  %32 = icmp eq i32 %31, %constant_780_9
  %33 = zext i1 %32 to i8
  %34 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.603 = getelementptr inbounds double, ptr %34, i64 0
  %param_6.6037 = load double, ptr %param_6.603, align 8, !invariant.load !182
  %constant_776_13 = load double, ptr @256, align 8
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %param_6.6037, double %constant_776_13
  %param_3.1183 = getelementptr inbounds [4 x [1 x double]], ptr %arg3, i64 0, i64 %21, i64 0
  %param_3.11838 = load double, ptr %param_3.1183, align 8, !invariant.load !182
  %constant_779_16 = load double, ptr @260, align 8
  %multiply.3587.9 = fmul double %param_3.11838, %constant_779_16
  %multiply.3588.11 = fmul double %36, %multiply.3587.9
  %param_4.980 = getelementptr inbounds [4 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9809 = load double, ptr %param_4.980, align 8, !invariant.load !182
  %param_5.862 = getelementptr inbounds [4 x double], ptr %arg5, i64 0, i64 %21
  %param_5.86210 = load double, ptr %param_5.862, align 8, !invariant.load !182
  %multiply.3518.42 = fmul double %param_4.9809, %param_5.86210
  %constant_782_2 = load double, ptr @259, align 8
  %multiply.3589.7 = fmul double %multiply.3518.42, %constant_782_2
  %multiply.3590.5 = fmul double %multiply.3588.11, %multiply.3589.7
  %multiply.3533.17 = fmul double %param_3.11838, %param_3.11838
  %multiply.3534.15 = fmul double %multiply.3533.17, %constant_782_2
  %37 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1241 = getelementptr inbounds double, ptr %37, i64 0
  %param_2.124111 = load double, ptr %param_2.1241, align 8, !invariant.load !182
  %constant_776_1312 = load double, ptr @256, align 8
  %38 = trunc i8 %33 to i1
  %39 = select i1 %38, double %param_2.124111, double %constant_776_1312
  %multiply.3591.5 = fmul double %multiply.3534.15, %39
  %add.1065.3 = fadd double %multiply.3590.5, %multiply.3591.5
  %40 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %add.1065.3, ptr %40, align 8
  br label %dynamic-update-slice.2129.1.in_bounds-after
}

define void @loop_add_fusion_1(ptr noalias align 128 dereferenceable(8) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !185
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.1.in_bounds-true, label %loop_add_fusion.1.in_bounds-after

loop_add_fusion.1.in_bounds-after:                ; preds = %loop_add_fusion.1.in_bounds-true, %entry
  ret void

loop_add_fusion.1.in_bounds-true:                 ; preds = %entry
  %4 = load i64, ptr %arg0, align 8
  %constant_768_1 = load i64, ptr @262, align 8
  %5 = add i64 %4, %constant_768_1
  store i64 %5, ptr %arg0, align 8
  br label %loop_add_fusion.1.in_bounds-after
}

define void @copy_fusion_7(ptr noalias align 16 dereferenceable(32) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(768) %arg2, ptr noalias align 128 dereferenceable(1536) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(768) %arg6, ptr noalias align 128 dereferenceable(1536) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !189
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !181
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 384
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 296
  br i1 %4, label %copy_fusion.7.in_bounds-true, label %copy_fusion.7.in_bounds-after

copy_fusion.7.in_bounds-after:                    ; preds = %slice3-after, %entry
  ret void

copy_fusion.7.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.8.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = getelementptr inbounds [4 x [1 x double]], ptr %arg0, i32 0, i32 %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !182
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.4.1
  %9 = phi i32 [ 4, %concatenate.pivot.4.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = getelementptr inbounds [4 x [1 x double]], ptr %arg1, i32 0, i32 %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !182
  br label %concatenate.3.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.8.2
  %13 = phi i32 [ 8, %concatenate.pivot.8.2 ]
  %14 = sub nsw i32 %3, %13
  %15 = mul nuw nsw i32 %14, 1
  %16 = add nuw nsw i32 0, %15
  %17 = urem i32 %16, 4
  %18 = udiv i32 %16, 4
  %19 = udiv i32 %18, 24
  %20 = getelementptr inbounds [24 x [4 x [1 x double]]], ptr %arg2, i32 0, i32 %18, i32 %17, i32 0
  %21 = load double, ptr %20, align 8, !invariant.load !182
  br label %concatenate.3.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.104.3
  %22 = phi i32 [ 104, %concatenate.pivot.104.3 ]
  %23 = sub nsw i32 %3, %22
  %24 = getelementptr inbounds [192 x double], ptr %arg3, i32 0, i32 %23
  %25 = load double, ptr %24, align 8, !invariant.load !182
  br label %concatenate.3.merge

concatenate.pivot.8.:                             ; preds = %copy_fusion.7.in_bounds-true
  %26 = icmp ult i32 %3, 8
  br i1 %26, label %concatenate.pivot.4., label %concatenate.pivot.104.

concatenate.pivot.4.:                             ; preds = %concatenate.pivot.8.
  %27 = icmp ult i32 %3, 4
  br i1 %27, label %concatenate.pivot.0., label %concatenate.pivot.4.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id0

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id1

concatenate.pivot.104.:                           ; preds = %concatenate.pivot.8.
  %28 = icmp ult i32 %3, 104
  br i1 %28, label %concatenate.pivot.8.2, label %concatenate.pivot.104.3

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.104.
  br label %concat_index_from_operand_id2

concatenate.pivot.104.3:                          ; preds = %concatenate.pivot.104.
  br label %concat_index_from_operand_id3

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %29 = phi double [ %8, %concat_index_from_operand_id0 ], [ %12, %concat_index_from_operand_id1 ], [ %21, %concat_index_from_operand_id2 ], [ %25, %concat_index_from_operand_id3 ]
  %30 = icmp sge i32 %3, 0
  %31 = icmp slt i32 %3, 4
  %32 = and i1 %30, %31
  br i1 %32, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.3.merge
  %33 = icmp sge i32 %3, 4
  %34 = icmp slt i32 %3, 8
  %35 = and i1 %33, %34
  br i1 %35, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %36 = icmp sge i32 %3, 8
  %37 = icmp slt i32 %3, 104
  %38 = and i1 %36, %37
  br i1 %38, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %39 = icmp sge i32 %3, 104
  %40 = icmp slt i32 %3, 296
  %41 = and i1 %39, %40
  br i1 %41, label %slice3-true, label %slice3-after

slice3-after:                                     ; preds = %slice3-true, %slice2-after
  br label %copy_fusion.7.in_bounds-after

slice0-true:                                      ; preds = %concatenate.3.merge
  %42 = sub i32 %3, 0
  %43 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %42
  store double %29, ptr %43, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %44 = sub i32 %3, 4
  %45 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %44
  store double %29, ptr %45, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %46 = sub i32 %3, 8
  %47 = getelementptr inbounds [96 x double], ptr %arg6, i32 0, i32 %46
  store double %29, ptr %47, align 8
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  %48 = sub i32 %3, 104
  %49 = getelementptr inbounds [192 x double], ptr %arg7, i32 0, i32 %48
  store double %29, ptr %49, align 8
  br label %slice3-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{ptr @copy_fusion_14, !"kernel", i32 1}
!3 = !{ptr @copy_fusion_14, !"reqntidx", i32 128}
!4 = !{ptr @input_slice_fusion_1, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion_1, !"reqntidx", i32 128}
!6 = !{ptr @input_slice_fusion_2, !"kernel", i32 1}
!7 = !{ptr @input_slice_fusion_2, !"reqntidx", i32 128}
!8 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!9 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!10 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!11 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!12 = !{ptr @loop_convert_dynamic_slice_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_convert_dynamic_slice_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_divide_multiply_select_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_divide_multiply_select_fusion, !"reqntidx", i32 4}
!16 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_add_fusion, !"reqntidx", i32 4}
!18 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!19 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 96}
!20 = !{ptr @loop_dynamic_update_slice_fusion_85, !"kernel", i32 1}
!21 = !{ptr @loop_dynamic_update_slice_fusion_85, !"reqntidx", i32 4}
!22 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!23 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 4}
!24 = !{ptr @loop_dynamic_update_slice_fusion_49, !"kernel", i32 1}
!25 = !{ptr @loop_dynamic_update_slice_fusion_49, !"reqntidx", i32 4}
!26 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!27 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 4}
!28 = !{ptr @loop_dynamic_update_slice_fusion_52, !"kernel", i32 1}
!29 = !{ptr @loop_dynamic_update_slice_fusion_52, !"reqntidx", i32 4}
!30 = !{ptr @loop_dynamic_update_slice_fusion_101, !"kernel", i32 1}
!31 = !{ptr @loop_dynamic_update_slice_fusion_101, !"reqntidx", i32 1}
!32 = !{ptr @loop_dynamic_update_slice_fusion_93, !"kernel", i32 1}
!33 = !{ptr @loop_dynamic_update_slice_fusion_93, !"reqntidx", i32 4}
!34 = !{ptr @loop_dynamic_update_slice_fusion_78, !"kernel", i32 1}
!35 = !{ptr @loop_dynamic_update_slice_fusion_78, !"reqntidx", i32 1}
!36 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!37 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 4}
!38 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!39 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 4}
!40 = !{ptr @loop_divide_exponential_fusion, !"kernel", i32 1}
!41 = !{ptr @loop_divide_exponential_fusion, !"reqntidx", i32 4}
!42 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!43 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 96}
!44 = !{ptr @wrapped_convert, !"kernel", i32 1}
!45 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!46 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!47 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 4}
!48 = !{ptr @loop_compare_multiply_select_fusion, !"kernel", i32 1}
!49 = !{ptr @loop_compare_multiply_select_fusion, !"reqntidx", i32 4}
!50 = !{ptr @loop_broadcast_select_fusion, !"kernel", i32 1}
!51 = !{ptr @loop_broadcast_select_fusion, !"reqntidx", i32 96}
!52 = !{ptr @loop_dynamic_update_slice_fusion_70, !"kernel", i32 1}
!53 = !{ptr @loop_dynamic_update_slice_fusion_70, !"reqntidx", i32 4}
!54 = !{ptr @loop_dynamic_update_slice_fusion_75, !"kernel", i32 1}
!55 = !{ptr @loop_dynamic_update_slice_fusion_75, !"reqntidx", i32 4}
!56 = !{ptr @loop_dynamic_update_slice_fusion_82, !"kernel", i32 1}
!57 = !{ptr @loop_dynamic_update_slice_fusion_82, !"reqntidx", i32 4}
!58 = !{ptr @loop_dynamic_update_slice_fusion_80, !"kernel", i32 1}
!59 = !{ptr @loop_dynamic_update_slice_fusion_80, !"reqntidx", i32 4}
!60 = !{ptr @loop_dynamic_update_slice_fusion_77, !"kernel", i32 1}
!61 = !{ptr @loop_dynamic_update_slice_fusion_77, !"reqntidx", i32 4}
!62 = !{ptr @loop_dynamic_update_slice_fusion_67, !"kernel", i32 1}
!63 = !{ptr @loop_dynamic_update_slice_fusion_67, !"reqntidx", i32 4}
!64 = !{ptr @loop_dynamic_update_slice_fusion_61, !"kernel", i32 1}
!65 = !{ptr @loop_dynamic_update_slice_fusion_61, !"reqntidx", i32 4}
!66 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!67 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 4}
!68 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!69 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 4}
!70 = !{ptr @loop_dynamic_update_slice_fusion_58, !"kernel", i32 1}
!71 = !{ptr @loop_dynamic_update_slice_fusion_58, !"reqntidx", i32 4}
!72 = !{ptr @loop_dynamic_update_slice_fusion_47, !"kernel", i32 1}
!73 = !{ptr @loop_dynamic_update_slice_fusion_47, !"reqntidx", i32 4}
!74 = !{ptr @loop_dynamic_update_slice_fusion_86, !"kernel", i32 1}
!75 = !{ptr @loop_dynamic_update_slice_fusion_86, !"reqntidx", i32 4}
!76 = !{ptr @loop_dynamic_update_slice_fusion_44, !"kernel", i32 1}
!77 = !{ptr @loop_dynamic_update_slice_fusion_44, !"reqntidx", i32 4}
!78 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!79 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 4}
!80 = !{ptr @loop_dynamic_update_slice_fusion_100, !"kernel", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_100, !"reqntidx", i32 4}
!82 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!83 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 4}
!84 = !{ptr @loop_dynamic_update_slice_fusion_60, !"kernel", i32 1}
!85 = !{ptr @loop_dynamic_update_slice_fusion_60, !"reqntidx", i32 4}
!86 = !{ptr @loop_dynamic_update_slice_fusion_88, !"kernel", i32 1}
!87 = !{ptr @loop_dynamic_update_slice_fusion_88, !"reqntidx", i32 4}
!88 = !{ptr @loop_dynamic_update_slice_fusion_91, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_91, !"reqntidx", i32 4}
!90 = !{ptr @loop_dynamic_update_slice_fusion_94, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion_94, !"reqntidx", i32 4}
!92 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 96}
!94 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 96}
!96 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 96}
!98 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 96}
!100 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 96}
!102 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 96}
!104 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 96}
!106 = !{ptr @loop_dynamic_update_slice_fusion_32, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_32, !"reqntidx", i32 96}
!108 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 96}
!110 = !{ptr @loop_dynamic_update_slice_fusion_102, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_102, !"reqntidx", i32 96}
!112 = !{ptr @loop_dynamic_update_slice_fusion_99, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_99, !"reqntidx", i32 96}
!114 = !{ptr @loop_dynamic_update_slice_fusion_103, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_103, !"reqntidx", i32 96}
!116 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 96}
!118 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 96}
!120 = !{ptr @loop_dynamic_update_slice_fusion_98, !"kernel", i32 1}
!121 = !{ptr @loop_dynamic_update_slice_fusion_98, !"reqntidx", i32 96}
!122 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 96}
!124 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!125 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 96}
!126 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 96}
!128 = !{ptr @loop_add_and_divide_select_fusion, !"kernel", i32 1}
!129 = !{ptr @loop_add_and_divide_select_fusion, !"reqntidx", i32 4}
!130 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 4}
!132 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 4}
!134 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 4}
!136 = !{ptr @loop_dynamic_update_slice_fusion_57, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_57, !"reqntidx", i32 4}
!138 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 4}
!140 = !{ptr @loop_dynamic_update_slice_fusion_63, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_63, !"reqntidx", i32 4}
!142 = !{ptr @loop_dynamic_update_slice_fusion_62, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_62, !"reqntidx", i32 4}
!144 = !{ptr @loop_dynamic_update_slice_fusion_65, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_65, !"reqntidx", i32 4}
!146 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 96}
!148 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!149 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 96}
!150 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!151 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 96}
!152 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!153 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 96}
!154 = !{ptr @loop_dynamic_update_slice_fusion_36, !"kernel", i32 1}
!155 = !{ptr @loop_dynamic_update_slice_fusion_36, !"reqntidx", i32 96}
!156 = !{ptr @loop_add_divide_select_fusion, !"kernel", i32 1}
!157 = !{ptr @loop_add_divide_select_fusion, !"reqntidx", i32 96}
!158 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!159 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 96}
!160 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!161 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 96}
!162 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 96}
!164 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 96}
!166 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 96}
!168 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 96}
!170 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!171 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 96}
!172 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!173 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 96}
!174 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!175 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 96}
!176 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!177 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!178 = !{ptr @copy_fusion_7, !"kernel", i32 1}
!179 = !{ptr @copy_fusion_7, !"reqntidx", i32 128}
!180 = !{i32 0, i32 12}
!181 = !{i32 0, i32 128}
!182 = !{}
!183 = !{i32 0, i32 8}
!184 = !{i32 0, i32 152}
!185 = !{i32 0, i32 1}
!186 = !{i32 0, i32 4}
!187 = !{i32 0, i32 24}
!188 = !{i32 0, i32 96}
!189 = !{i32 0, i32 3}
