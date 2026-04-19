; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_63_0 = constant [64 x i8] zeroinitializer, align 128
@0 = private unnamed_addr constant [1 x i8] zeroinitializer
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@2 = private unnamed_addr constant [8 x i8] zeroinitializer
@3 = private unnamed_addr constant [8 x i8] zeroinitializer
@4 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@5 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@6 = private unnamed_addr constant [8 x i8] zeroinitializer
@7 = private unnamed_addr constant [4 x i8] zeroinitializer
@8 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@9 = private unnamed_addr constant [8 x i8] zeroinitializer
@10 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@11 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@12 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@13 = private unnamed_addr constant [4 x i8] zeroinitializer
@14 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@15 = private unnamed_addr constant [8 x i8] zeroinitializer
@16 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@17 = private unnamed_addr constant [8 x i8] zeroinitializer
@18 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@19 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@20 = private unnamed_addr constant [8 x i8] zeroinitializer
@21 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@22 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@23 = private unnamed_addr constant [8 x i8] zeroinitializer
@24 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@25 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@26 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@27 = private unnamed_addr constant [8 x i8] zeroinitializer
@28 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@29 = private unnamed_addr constant [8 x i8] zeroinitializer
@30 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@31 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@32 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@33 = private unnamed_addr constant [8 x i8] zeroinitializer
@34 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@35 = private unnamed_addr constant [8 x i8] zeroinitializer
@36 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@37 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@38 = private unnamed_addr constant [8 x i8] zeroinitializer
@39 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@40 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@41 = private unnamed_addr constant [8 x i8] zeroinitializer
@42 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@43 = private unnamed_addr constant [8 x i8] zeroinitializer
@44 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@45 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@46 = private unnamed_addr constant [8 x i8] zeroinitializer
@47 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@48 = private unnamed_addr constant [8 x i8] zeroinitializer
@49 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@50 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@51 = private unnamed_addr constant [8 x i8] zeroinitializer
@52 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@53 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@54 = private unnamed_addr constant [8 x i8] zeroinitializer
@55 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@56 = private unnamed_addr constant [8 x i8] zeroinitializer
@57 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@58 = private unnamed_addr constant [8 x i8] zeroinitializer
@59 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@60 = private unnamed_addr constant [8 x i8] zeroinitializer
@61 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@62 = private unnamed_addr constant [8 x i8] zeroinitializer
@63 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@64 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@65 = private unnamed_addr constant [8 x i8] zeroinitializer
@66 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@67 = private unnamed_addr constant [8 x i8] zeroinitializer
@68 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@69 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@70 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@71 = private unnamed_addr constant [1 x i8] zeroinitializer
@72 = private unnamed_addr constant [8 x i8] zeroinitializer
@73 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@74 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@75 = private unnamed_addr constant [8 x i8] zeroinitializer
@76 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@77 = private unnamed_addr constant [8 x i8] zeroinitializer
@78 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@79 = private unnamed_addr constant [8 x i8] zeroinitializer
@80 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@81 = private unnamed_addr constant [8 x i8] zeroinitializer
@82 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@83 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
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
@94 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@95 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@96 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@97 = private unnamed_addr constant [8 x i8] zeroinitializer
@98 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@99 = private unnamed_addr constant [8 x i8] zeroinitializer
@100 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@101 = private unnamed_addr constant [8 x i8] zeroinitializer
@102 = private unnamed_addr constant [8 x i8] zeroinitializer
@103 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@104 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@105 = private unnamed_addr constant [8 x i8] zeroinitializer
@106 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@107 = private unnamed_addr constant [8 x i8] zeroinitializer
@108 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@109 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@110 = private unnamed_addr constant [8 x i8] zeroinitializer
@111 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@112 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@113 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@114 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@115 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@116 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@117 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@118 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@119 = private unnamed_addr constant [8 x i8] zeroinitializer
@120 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@121 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@122 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@123 = private unnamed_addr constant [8 x i8] zeroinitializer
@124 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@125 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@126 = private unnamed_addr constant [8 x i8] zeroinitializer
@127 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@128 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@129 = private unnamed_addr constant [8 x i8] zeroinitializer
@130 = private unnamed_addr constant [4 x i8] zeroinitializer
@131 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@132 = private unnamed_addr constant [8 x i8] zeroinitializer
@133 = private unnamed_addr constant [4 x i8] zeroinitializer
@134 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@135 = private unnamed_addr constant [8 x i8] zeroinitializer
@136 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@137 = private unnamed_addr constant [8 x i8] zeroinitializer
@138 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@139 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@140 = private unnamed_addr constant [8 x i8] zeroinitializer
@141 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@142 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@143 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@144 = private unnamed_addr constant [8 x i8] zeroinitializer
@145 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@146 = private unnamed_addr constant [8 x i8] zeroinitializer
@147 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@148 = private unnamed_addr constant [8 x i8] zeroinitializer
@149 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@150 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@151 = private unnamed_addr constant [8 x i8] zeroinitializer
@152 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@153 = private unnamed_addr constant [8 x i8] zeroinitializer
@154 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@155 = private unnamed_addr constant [8 x i8] zeroinitializer
@156 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@157 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@158 = private unnamed_addr constant [8 x i8] zeroinitializer
@159 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@160 = private unnamed_addr constant [8 x i8] zeroinitializer
@161 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@162 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@163 = private unnamed_addr constant [8 x i8] zeroinitializer
@164 = private unnamed_addr constant [8 x i8] zeroinitializer
@165 = private unnamed_addr constant [4 x i8] zeroinitializer
@166 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@167 = private unnamed_addr constant [8 x i8] zeroinitializer
@168 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@169 = private unnamed_addr constant [8 x i8] zeroinitializer
@170 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@171 = private unnamed_addr constant [8 x i8] zeroinitializer
@172 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@173 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@174 = private unnamed_addr constant [8 x i8] zeroinitializer
@175 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@176 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@177 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@178 = private unnamed_addr constant [8 x i8] zeroinitializer
@179 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@180 = private unnamed_addr constant [8 x i8] zeroinitializer
@181 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00\C0"
@182 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@183 = private unnamed_addr constant [8 x i8] zeroinitializer
@184 = private unnamed_addr constant [4 x i8] zeroinitializer
@185 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@186 = private unnamed_addr constant [8 x i8] zeroinitializer
@187 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10\C0"
@188 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@189 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@190 = private unnamed_addr constant [8 x i8] zeroinitializer
@191 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@192 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@193 = private unnamed_addr constant [8 x i8] zeroinitializer
@194 = private unnamed_addr constant [8 x i8] zeroinitializer
@195 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@196 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@197 = private unnamed_addr constant [8 x i8] zeroinitializer
@198 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@199 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@200 = private unnamed_addr constant [8 x i8] zeroinitializer
@201 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@202 = private unnamed_addr constant [8 x i8] zeroinitializer
@203 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@204 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@205 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@206 = private unnamed_addr constant [4 x i8] zeroinitializer
@207 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@208 = private unnamed_addr constant [8 x i8] zeroinitializer
@209 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@210 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@211 = private unnamed_addr constant [8 x i8] zeroinitializer
@212 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@213 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@214 = private unnamed_addr constant [8 x i8] zeroinitializer
@215 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@216 = private unnamed_addr constant [8 x i8] zeroinitializer
@217 = private unnamed_addr constant [8 x i8] zeroinitializer
@218 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@219 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@220 = private unnamed_addr constant [8 x i8] zeroinitializer
@221 = private unnamed_addr constant [8 x i8] zeroinitializer
@222 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@223 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@224 = private unnamed_addr constant [8 x i8] zeroinitializer
@225 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@226 = private unnamed_addr constant [8 x i8] zeroinitializer
@227 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@228 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@229 = private unnamed_addr constant [8 x i8] zeroinitializer
@230 = private unnamed_addr constant [8 x i8] zeroinitializer
@231 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@232 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@233 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@234 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@235 = private unnamed_addr constant [8 x i8] zeroinitializer
@236 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@237 = private unnamed_addr constant [8 x i8] zeroinitializer
@238 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@239 = private unnamed_addr constant [8 x i8] zeroinitializer
@240 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@241 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@242 = private unnamed_addr constant [8 x i8] zeroinitializer
@243 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@244 = private unnamed_addr constant [8 x i8] zeroinitializer
@245 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@246 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@247 = private unnamed_addr constant [8 x i8] zeroinitializer
@248 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@249 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@250 = private unnamed_addr constant [8 x i8] zeroinitializer
@251 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@252 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@253 = private unnamed_addr constant [8 x i8] zeroinitializer
@254 = private unnamed_addr constant [8 x i8] zeroinitializer
@255 = private unnamed_addr constant [4 x i8] zeroinitializer
@256 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@257 = private unnamed_addr constant [8 x i8] zeroinitializer
@258 = private unnamed_addr constant [8 x i8] zeroinitializer
@259 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@260 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@261 = private unnamed_addr constant [8 x i8] zeroinitializer
@262 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@263 = private unnamed_addr constant [8 x i8] zeroinitializer
@264 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"

define void @input_slice_fusion(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(3840) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !189
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 7680
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 7680
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.3840.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 20
  %10 = udiv i32 %8, 20
  %11 = udiv i32 %10, 192
  %constant_66_3 = load i8, ptr @0, align 1
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.3840.2
  %12 = phi i32 [ 3840, %concatenate.pivot.3840.2 ]
  %13 = sub nsw i32 %3, %12
  %14 = mul nuw nsw i32 %13, 1
  %15 = add nuw nsw i32 0, %14
  %16 = urem i32 %15, 20
  %17 = udiv i32 %15, 20
  %18 = udiv i32 %17, 192
  %constant_66_31 = load i8, ptr @0, align 1
  br label %concatenate.merge

concatenate.pivot.3840.:                          ; preds = %input_slice_fusion.in_bounds-true
  %19 = icmp ult i32 %3, 3840
  br i1 %19, label %concatenate.pivot.0., label %concatenate.pivot.3840.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.3840.
  br label %concat_index_from_operand_id0

concatenate.pivot.3840.2:                         ; preds = %concatenate.pivot.3840.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %20 = phi i8 [ %constant_66_3, %concat_index_from_operand_id0 ], [ %constant_66_31, %concat_index_from_operand_id1 ]
  %21 = icmp sge i32 %3, 0
  %22 = icmp slt i32 %3, 3840
  %23 = and i1 %21, %22
  br i1 %23, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %24 = icmp sge i32 %3, 3840
  %25 = icmp slt i32 %3, 7680
  %26 = and i1 %24, %25
  br i1 %26, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %27 = sub i32 %3, 0
  %28 = getelementptr inbounds [3840 x i8], ptr %arg0, i32 0, i32 %27
  store i8 %20, ptr %28, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %29 = sub i32 %3, 3840
  %30 = getelementptr inbounds [3840 x i8], ptr %arg1, i32 0, i32 %29
  store i8 %20, ptr %30, align 1
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @copy_fusion_13(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(3840) %arg1, ptr noalias align 128 dereferenceable(3840) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !189
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 7680
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 7680
  br i1 %4, label %copy_fusion.13.in_bounds-true, label %copy_fusion.13.in_bounds-after

copy_fusion.13.in_bounds-after:                   ; preds = %slice1-after, %entry
  ret void

copy_fusion.13.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.3840.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 20
  %10 = udiv i32 %8, 20
  %11 = udiv i32 %10, 192
  %12 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i32 0, i32 %10, i32 %9, i32 0
  %13 = load i8, ptr %12, align 1, !invariant.load !191
  br label %concatenate.4.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.3840.1
  %14 = phi i32 [ 3840, %concatenate.pivot.3840.1 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 20
  %19 = udiv i32 %17, 20
  %20 = udiv i32 %19, 192
  %21 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i32 0, i32 %19, i32 %18, i32 0
  %22 = load i8, ptr %21, align 1, !invariant.load !191
  br label %concatenate.4.merge

concatenate.pivot.3840.:                          ; preds = %copy_fusion.13.in_bounds-true
  %23 = icmp ult i32 %3, 3840
  br i1 %23, label %concatenate.pivot.0., label %concatenate.pivot.3840.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.3840.
  br label %concat_index_from_operand_id0

concatenate.pivot.3840.1:                         ; preds = %concatenate.pivot.3840.
  br label %concat_index_from_operand_id1

concatenate.4.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %24 = phi i8 [ %13, %concat_index_from_operand_id0 ], [ %22, %concat_index_from_operand_id1 ]
  %25 = icmp sge i32 %3, 0
  %26 = icmp slt i32 %3, 3840
  %27 = and i1 %25, %26
  br i1 %27, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.4.merge
  %28 = icmp sge i32 %3, 3840
  %29 = icmp slt i32 %3, 7680
  %30 = and i1 %28, %29
  br i1 %30, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %copy_fusion.13.in_bounds-after

slice0-true:                                      ; preds = %concatenate.4.merge
  %31 = sub i32 %3, 0
  %32 = getelementptr inbounds [3840 x i8], ptr %arg1, i32 0, i32 %31
  store i8 %24, ptr %32, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %33 = sub i32 %3, 3840
  %34 = getelementptr inbounds [3840 x i8], ptr %arg2, i32 0, i32 %33
  store i8 %24, ptr %34, align 1
  br label %slice1-after
}

define void @input_slice_fusion_1(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(15360) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !192
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4032
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
  %11 = urem i32 %10, 20
  %12 = udiv i32 %10, 20
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
  %20 = icmp slt i32 %3, 4032
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
  %25 = getelementptr inbounds [3840 x i32], ptr %arg1, i32 0, i32 %24
  store i32 %15, ptr %25, align 4
  br label %slice1-after
}

define void @input_slice_fusion_2(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !192
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4032
  br i1 %4, label %input_slice_fusion.2.in_bounds-true, label %input_slice_fusion.2.in_bounds-after

input_slice_fusion.2.in_bounds-after:             ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.2.in_bounds-true:              ; preds = %entry
  br label %concatenate.pivot.192.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %constant_64_4 = load double, ptr @2, align 8
  br label %concatenate.2.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.192.2
  %7 = phi i32 [ 192, %concatenate.pivot.192.2 ]
  %8 = sub nsw i32 %3, %7
  %9 = mul nuw nsw i32 %8, 1
  %10 = add nuw nsw i32 0, %9
  %11 = urem i32 %10, 20
  %12 = udiv i32 %10, 20
  %13 = udiv i32 %12, 192
  %constant_64_41 = load double, ptr @2, align 8
  br label %concatenate.2.merge

concatenate.pivot.192.:                           ; preds = %input_slice_fusion.2.in_bounds-true
  %14 = icmp ult i32 %3, 192
  br i1 %14, label %concatenate.pivot.0., label %concatenate.pivot.192.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id0

concatenate.pivot.192.2:                          ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id1

concatenate.2.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %15 = phi double [ %constant_64_4, %concat_index_from_operand_id0 ], [ %constant_64_41, %concat_index_from_operand_id1 ]
  %16 = icmp sge i32 %3, 0
  %17 = icmp slt i32 %3, 192
  %18 = and i1 %16, %17
  br i1 %18, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.2.merge
  %19 = icmp sge i32 %3, 192
  %20 = icmp slt i32 %3, 4032
  %21 = and i1 %19, %20
  br i1 %21, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.2.in_bounds-after

slice0-true:                                      ; preds = %concatenate.2.merge
  %22 = sub i32 %3, 0
  %23 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %22
  store double %15, ptr %23, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %24 = sub i32 %3, 192
  %25 = getelementptr inbounds [3840 x double], ptr %arg1, i32 0, i32 %24
  store double %15, ptr %25, align 8
  br label %slice1-after
}

define void @loop_broadcast_fusion_2(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(3686400) %arg1, ptr noalias align 128 dereferenceable(3686400) %arg2, ptr noalias align 128 dereferenceable(3686400) %arg3, ptr noalias align 128 dereferenceable(3686400) %arg4, ptr noalias align 128 dereferenceable(3686400) %arg5, ptr noalias align 128 dereferenceable(3686400) %arg6, ptr noalias align 128 dereferenceable(3686400) %arg7, ptr noalias align 128 dereferenceable(3686400) %arg8, ptr noalias align 128 dereferenceable(3686400) %arg9, ptr noalias align 128 dereferenceable(3686400) %arg10, ptr noalias align 128 dereferenceable(3686400) %arg11, ptr noalias align 128 dereferenceable(3686400) %arg12, ptr noalias align 128 dereferenceable(3686400) %arg13, ptr noalias align 128 dereferenceable(3686400) %arg14, ptr noalias align 128 dereferenceable(3686400) %arg15, ptr noalias align 128 dereferenceable(3686400) %arg16, ptr noalias align 128 dereferenceable(3686400) %arg17, ptr noalias align 128 dereferenceable(3686400) %arg18, ptr noalias align 128 dereferenceable(3686400) %arg19, ptr noalias align 128 dereferenceable(3686400) %arg20, ptr noalias align 128 dereferenceable(3686400) %arg21, ptr noalias align 128 dereferenceable(3686400) %arg22, ptr noalias align 128 dereferenceable(3686400) %arg23, ptr noalias align 128 dereferenceable(3686400) %arg24, ptr noalias align 128 dereferenceable(3686400) %arg25, ptr noalias align 128 dereferenceable(3686400) %arg26, ptr noalias align 128 dereferenceable(3686400) %arg27, ptr noalias align 128 dereferenceable(3686400) %arg28, ptr noalias align 128 dereferenceable(3686400) %arg29, ptr noalias align 128 dereferenceable(3686400) %arg30, ptr noalias align 128 dereferenceable(3686400) %arg31, ptr noalias align 128 dereferenceable(3686400) %arg32, ptr noalias align 128 dereferenceable(3686400) %arg33, ptr noalias align 128 dereferenceable(3686400) %arg34, ptr noalias align 128 dereferenceable(3686400) %arg35, ptr noalias align 128 dereferenceable(3686400) %arg36, ptr noalias align 128 dereferenceable(3686400) %arg37, ptr noalias align 128 dereferenceable(3686400) %arg38, ptr noalias align 128 dereferenceable(3686400) %arg39, ptr noalias align 128 dereferenceable(3686400) %arg40, ptr noalias align 128 dereferenceable(3686400) %arg41, ptr noalias align 128 dereferenceable(3686400) %arg42, ptr noalias align 128 dereferenceable(3686400) %arg43) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !193
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !194
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 115200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index0 = add nuw nsw i32 %linear_index_base, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = urem i32 %5, 120
  %7 = udiv i32 %linear_index0, 2400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 20
  %10 = udiv i32 %linear_index1, 20
  %11 = urem i32 %10, 120
  %12 = udiv i32 %linear_index1, 2400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 20
  %15 = udiv i32 %linear_index2, 20
  %16 = urem i32 %15, 120
  %17 = udiv i32 %linear_index2, 2400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 20
  %20 = udiv i32 %linear_index3, 20
  %21 = urem i32 %20, 120
  %22 = udiv i32 %linear_index3, 2400
  %23 = icmp ult i32 %linear_index_base, 460800
  br i1 %23, label %loop_broadcast_fusion.2.in_bounds-true, label %loop_broadcast_fusion.2.in_bounds-after

loop_broadcast_fusion.2.in_bounds-after:          ; preds = %loop_broadcast_fusion.2.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.2.in_bounds-true:           ; preds = %entry
  %constant_64_3 = load double, ptr @3, align 8
  %24 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } undef, double %constant_64_3, 0
  %25 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %24, double %constant_64_3, 1
  %26 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %25, double %constant_64_3, 2
  %27 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %26, double %constant_64_3, 3
  %28 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %27, double %constant_64_3, 4
  %29 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %28, double %constant_64_3, 5
  %30 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %29, double %constant_64_3, 6
  %31 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %30, double %constant_64_3, 7
  %32 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %31, double %constant_64_3, 8
  %33 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %32, double %constant_64_3, 9
  %34 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %33, double %constant_64_3, 10
  %35 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %34, double %constant_64_3, 11
  %36 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %35, double %constant_64_3, 12
  %37 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %36, double %constant_64_3, 13
  %38 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %37, double %constant_64_3, 14
  %39 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %38, double %constant_64_3, 15
  %40 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %39, double %constant_64_3, 16
  %41 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %40, double %constant_64_3, 17
  %42 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %41, double %constant_64_3, 18
  %43 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %42, double %constant_64_3, 19
  %44 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %43, double %constant_64_3, 20
  %45 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %44, double %constant_64_3, 21
  %46 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %45, double %constant_64_3, 22
  %47 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %46, double %constant_64_3, 23
  %48 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %47, double %constant_64_3, 24
  %49 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %48, double %constant_64_3, 25
  %50 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %49, double %constant_64_3, 26
  %51 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %50, double %constant_64_3, 27
  %52 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %51, double %constant_64_3, 28
  %53 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %52, double %constant_64_3, 29
  %54 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %53, double %constant_64_3, 30
  %55 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %54, double %constant_64_3, 31
  %56 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %55, double %constant_64_3, 32
  %57 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %56, double %constant_64_3, 33
  %58 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %57, double %constant_64_3, 34
  %59 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %58, double %constant_64_3, 35
  %60 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %59, double %constant_64_3, 36
  %61 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %60, double %constant_64_3, 37
  %62 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %61, double %constant_64_3, 38
  %63 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %62, double %constant_64_3, 39
  %64 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %63, double %constant_64_3, 40
  %65 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %64, double %constant_64_3, 41
  %66 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %65, double %constant_64_3, 42
  %67 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %66, double %constant_64_3, 43
  %68 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 0
  %69 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %70 = getelementptr inbounds double, ptr %69, i32 0
  store double %68, ptr %70, align 8
  %71 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 1
  %72 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %73 = getelementptr inbounds double, ptr %72, i32 0
  store double %71, ptr %73, align 8
  %74 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 2
  %75 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %76 = getelementptr inbounds double, ptr %75, i32 0
  store double %74, ptr %76, align 8
  %77 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 3
  %78 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %79 = getelementptr inbounds double, ptr %78, i32 0
  store double %77, ptr %79, align 8
  %80 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 4
  %81 = getelementptr double, ptr %arg4, i32 %linear_index_base
  %82 = getelementptr inbounds double, ptr %81, i32 0
  store double %80, ptr %82, align 8
  %83 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 5
  %84 = getelementptr double, ptr %arg5, i32 %linear_index_base
  %85 = getelementptr inbounds double, ptr %84, i32 0
  store double %83, ptr %85, align 8
  %86 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 6
  %87 = getelementptr double, ptr %arg6, i32 %linear_index_base
  %88 = getelementptr inbounds double, ptr %87, i32 0
  store double %86, ptr %88, align 8
  %89 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 7
  %90 = getelementptr double, ptr %arg7, i32 %linear_index_base
  %91 = getelementptr inbounds double, ptr %90, i32 0
  store double %89, ptr %91, align 8
  %92 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 8
  %93 = getelementptr double, ptr %arg8, i32 %linear_index_base
  %94 = getelementptr inbounds double, ptr %93, i32 0
  store double %92, ptr %94, align 8
  %95 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 9
  %96 = getelementptr double, ptr %arg9, i32 %linear_index_base
  %97 = getelementptr inbounds double, ptr %96, i32 0
  store double %95, ptr %97, align 8
  %98 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 10
  %99 = getelementptr double, ptr %arg10, i32 %linear_index_base
  %100 = getelementptr inbounds double, ptr %99, i32 0
  store double %98, ptr %100, align 8
  %101 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 11
  %102 = getelementptr double, ptr %arg11, i32 %linear_index_base
  %103 = getelementptr inbounds double, ptr %102, i32 0
  store double %101, ptr %103, align 8
  %104 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 12
  %105 = getelementptr double, ptr %arg12, i32 %linear_index_base
  %106 = getelementptr inbounds double, ptr %105, i32 0
  store double %104, ptr %106, align 8
  %107 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 13
  %108 = getelementptr double, ptr %arg13, i32 %linear_index_base
  %109 = getelementptr inbounds double, ptr %108, i32 0
  store double %107, ptr %109, align 8
  %110 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 14
  %111 = getelementptr double, ptr %arg14, i32 %linear_index_base
  %112 = getelementptr inbounds double, ptr %111, i32 0
  store double %110, ptr %112, align 8
  %113 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 15
  %114 = getelementptr double, ptr %arg15, i32 %linear_index_base
  %115 = getelementptr inbounds double, ptr %114, i32 0
  store double %113, ptr %115, align 8
  %116 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 16
  %117 = getelementptr double, ptr %arg16, i32 %linear_index_base
  %118 = getelementptr inbounds double, ptr %117, i32 0
  store double %116, ptr %118, align 8
  %119 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 17
  %120 = getelementptr double, ptr %arg17, i32 %linear_index_base
  %121 = getelementptr inbounds double, ptr %120, i32 0
  store double %119, ptr %121, align 8
  %122 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 18
  %123 = getelementptr double, ptr %arg18, i32 %linear_index_base
  %124 = getelementptr inbounds double, ptr %123, i32 0
  store double %122, ptr %124, align 8
  %125 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 19
  %126 = getelementptr double, ptr %arg19, i32 %linear_index_base
  %127 = getelementptr inbounds double, ptr %126, i32 0
  store double %125, ptr %127, align 8
  %128 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 20
  %129 = getelementptr double, ptr %arg20, i32 %linear_index_base
  %130 = getelementptr inbounds double, ptr %129, i32 0
  store double %128, ptr %130, align 8
  %131 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 21
  %132 = getelementptr double, ptr %arg21, i32 %linear_index_base
  %133 = getelementptr inbounds double, ptr %132, i32 0
  store double %131, ptr %133, align 8
  %134 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 22
  %135 = getelementptr double, ptr %arg22, i32 %linear_index_base
  %136 = getelementptr inbounds double, ptr %135, i32 0
  store double %134, ptr %136, align 8
  %137 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 23
  %138 = getelementptr double, ptr %arg23, i32 %linear_index_base
  %139 = getelementptr inbounds double, ptr %138, i32 0
  store double %137, ptr %139, align 8
  %140 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 24
  %141 = getelementptr double, ptr %arg24, i32 %linear_index_base
  %142 = getelementptr inbounds double, ptr %141, i32 0
  store double %140, ptr %142, align 8
  %143 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 25
  %144 = getelementptr double, ptr %arg25, i32 %linear_index_base
  %145 = getelementptr inbounds double, ptr %144, i32 0
  store double %143, ptr %145, align 8
  %146 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 26
  %147 = getelementptr double, ptr %arg26, i32 %linear_index_base
  %148 = getelementptr inbounds double, ptr %147, i32 0
  store double %146, ptr %148, align 8
  %149 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 27
  %150 = getelementptr double, ptr %arg27, i32 %linear_index_base
  %151 = getelementptr inbounds double, ptr %150, i32 0
  store double %149, ptr %151, align 8
  %152 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 28
  %153 = getelementptr double, ptr %arg28, i32 %linear_index_base
  %154 = getelementptr inbounds double, ptr %153, i32 0
  store double %152, ptr %154, align 8
  %155 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 29
  %156 = getelementptr double, ptr %arg29, i32 %linear_index_base
  %157 = getelementptr inbounds double, ptr %156, i32 0
  store double %155, ptr %157, align 8
  %158 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 30
  %159 = getelementptr double, ptr %arg30, i32 %linear_index_base
  %160 = getelementptr inbounds double, ptr %159, i32 0
  store double %158, ptr %160, align 8
  %161 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 31
  %162 = getelementptr double, ptr %arg31, i32 %linear_index_base
  %163 = getelementptr inbounds double, ptr %162, i32 0
  store double %161, ptr %163, align 8
  %164 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 32
  %165 = getelementptr double, ptr %arg32, i32 %linear_index_base
  %166 = getelementptr inbounds double, ptr %165, i32 0
  store double %164, ptr %166, align 8
  %167 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 33
  %168 = getelementptr double, ptr %arg33, i32 %linear_index_base
  %169 = getelementptr inbounds double, ptr %168, i32 0
  store double %167, ptr %169, align 8
  %170 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 34
  %171 = getelementptr double, ptr %arg34, i32 %linear_index_base
  %172 = getelementptr inbounds double, ptr %171, i32 0
  store double %170, ptr %172, align 8
  %173 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 35
  %174 = getelementptr double, ptr %arg35, i32 %linear_index_base
  %175 = getelementptr inbounds double, ptr %174, i32 0
  store double %173, ptr %175, align 8
  %176 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 36
  %177 = getelementptr double, ptr %arg36, i32 %linear_index_base
  %178 = getelementptr inbounds double, ptr %177, i32 0
  store double %176, ptr %178, align 8
  %179 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 37
  %180 = getelementptr double, ptr %arg37, i32 %linear_index_base
  %181 = getelementptr inbounds double, ptr %180, i32 0
  store double %179, ptr %181, align 8
  %182 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 38
  %183 = getelementptr double, ptr %arg38, i32 %linear_index_base
  %184 = getelementptr inbounds double, ptr %183, i32 0
  store double %182, ptr %184, align 8
  %185 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 39
  %186 = getelementptr double, ptr %arg39, i32 %linear_index_base
  %187 = getelementptr inbounds double, ptr %186, i32 0
  store double %185, ptr %187, align 8
  %188 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 40
  %189 = getelementptr double, ptr %arg40, i32 %linear_index_base
  %190 = getelementptr inbounds double, ptr %189, i32 0
  store double %188, ptr %190, align 8
  %191 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 41
  %192 = getelementptr double, ptr %arg41, i32 %linear_index_base
  %193 = getelementptr inbounds double, ptr %192, i32 0
  store double %191, ptr %193, align 8
  %194 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 42
  %195 = getelementptr double, ptr %arg42, i32 %linear_index_base
  %196 = getelementptr inbounds double, ptr %195, i32 0
  store double %194, ptr %196, align 8
  %197 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %67, 43
  %198 = getelementptr double, ptr %arg43, i32 %linear_index_base
  %199 = getelementptr inbounds double, ptr %198, i32 0
  store double %197, ptr %199, align 8
  %constant_64_31 = load double, ptr @3, align 8
  %200 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } undef, double %constant_64_31, 0
  %201 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %200, double %constant_64_31, 1
  %202 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %201, double %constant_64_31, 2
  %203 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %202, double %constant_64_31, 3
  %204 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %203, double %constant_64_31, 4
  %205 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %204, double %constant_64_31, 5
  %206 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %205, double %constant_64_31, 6
  %207 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %206, double %constant_64_31, 7
  %208 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %207, double %constant_64_31, 8
  %209 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %208, double %constant_64_31, 9
  %210 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %209, double %constant_64_31, 10
  %211 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %210, double %constant_64_31, 11
  %212 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %211, double %constant_64_31, 12
  %213 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %212, double %constant_64_31, 13
  %214 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %213, double %constant_64_31, 14
  %215 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %214, double %constant_64_31, 15
  %216 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %215, double %constant_64_31, 16
  %217 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %216, double %constant_64_31, 17
  %218 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %217, double %constant_64_31, 18
  %219 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %218, double %constant_64_31, 19
  %220 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %219, double %constant_64_31, 20
  %221 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %220, double %constant_64_31, 21
  %222 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %221, double %constant_64_31, 22
  %223 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %222, double %constant_64_31, 23
  %224 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %223, double %constant_64_31, 24
  %225 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %224, double %constant_64_31, 25
  %226 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %225, double %constant_64_31, 26
  %227 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %226, double %constant_64_31, 27
  %228 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %227, double %constant_64_31, 28
  %229 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %228, double %constant_64_31, 29
  %230 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %229, double %constant_64_31, 30
  %231 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %230, double %constant_64_31, 31
  %232 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %231, double %constant_64_31, 32
  %233 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %232, double %constant_64_31, 33
  %234 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %233, double %constant_64_31, 34
  %235 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %234, double %constant_64_31, 35
  %236 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %235, double %constant_64_31, 36
  %237 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %236, double %constant_64_31, 37
  %238 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %237, double %constant_64_31, 38
  %239 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %238, double %constant_64_31, 39
  %240 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %239, double %constant_64_31, 40
  %241 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %240, double %constant_64_31, 41
  %242 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %241, double %constant_64_31, 42
  %243 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %242, double %constant_64_31, 43
  %244 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 0
  %245 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %246 = getelementptr inbounds double, ptr %245, i32 1
  store double %244, ptr %246, align 8
  %247 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 1
  %248 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %249 = getelementptr inbounds double, ptr %248, i32 1
  store double %247, ptr %249, align 8
  %250 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 2
  %251 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %252 = getelementptr inbounds double, ptr %251, i32 1
  store double %250, ptr %252, align 8
  %253 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 3
  %254 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %255 = getelementptr inbounds double, ptr %254, i32 1
  store double %253, ptr %255, align 8
  %256 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 4
  %257 = getelementptr double, ptr %arg4, i32 %linear_index_base
  %258 = getelementptr inbounds double, ptr %257, i32 1
  store double %256, ptr %258, align 8
  %259 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 5
  %260 = getelementptr double, ptr %arg5, i32 %linear_index_base
  %261 = getelementptr inbounds double, ptr %260, i32 1
  store double %259, ptr %261, align 8
  %262 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 6
  %263 = getelementptr double, ptr %arg6, i32 %linear_index_base
  %264 = getelementptr inbounds double, ptr %263, i32 1
  store double %262, ptr %264, align 8
  %265 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 7
  %266 = getelementptr double, ptr %arg7, i32 %linear_index_base
  %267 = getelementptr inbounds double, ptr %266, i32 1
  store double %265, ptr %267, align 8
  %268 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 8
  %269 = getelementptr double, ptr %arg8, i32 %linear_index_base
  %270 = getelementptr inbounds double, ptr %269, i32 1
  store double %268, ptr %270, align 8
  %271 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 9
  %272 = getelementptr double, ptr %arg9, i32 %linear_index_base
  %273 = getelementptr inbounds double, ptr %272, i32 1
  store double %271, ptr %273, align 8
  %274 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 10
  %275 = getelementptr double, ptr %arg10, i32 %linear_index_base
  %276 = getelementptr inbounds double, ptr %275, i32 1
  store double %274, ptr %276, align 8
  %277 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 11
  %278 = getelementptr double, ptr %arg11, i32 %linear_index_base
  %279 = getelementptr inbounds double, ptr %278, i32 1
  store double %277, ptr %279, align 8
  %280 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 12
  %281 = getelementptr double, ptr %arg12, i32 %linear_index_base
  %282 = getelementptr inbounds double, ptr %281, i32 1
  store double %280, ptr %282, align 8
  %283 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 13
  %284 = getelementptr double, ptr %arg13, i32 %linear_index_base
  %285 = getelementptr inbounds double, ptr %284, i32 1
  store double %283, ptr %285, align 8
  %286 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 14
  %287 = getelementptr double, ptr %arg14, i32 %linear_index_base
  %288 = getelementptr inbounds double, ptr %287, i32 1
  store double %286, ptr %288, align 8
  %289 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 15
  %290 = getelementptr double, ptr %arg15, i32 %linear_index_base
  %291 = getelementptr inbounds double, ptr %290, i32 1
  store double %289, ptr %291, align 8
  %292 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 16
  %293 = getelementptr double, ptr %arg16, i32 %linear_index_base
  %294 = getelementptr inbounds double, ptr %293, i32 1
  store double %292, ptr %294, align 8
  %295 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 17
  %296 = getelementptr double, ptr %arg17, i32 %linear_index_base
  %297 = getelementptr inbounds double, ptr %296, i32 1
  store double %295, ptr %297, align 8
  %298 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 18
  %299 = getelementptr double, ptr %arg18, i32 %linear_index_base
  %300 = getelementptr inbounds double, ptr %299, i32 1
  store double %298, ptr %300, align 8
  %301 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 19
  %302 = getelementptr double, ptr %arg19, i32 %linear_index_base
  %303 = getelementptr inbounds double, ptr %302, i32 1
  store double %301, ptr %303, align 8
  %304 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 20
  %305 = getelementptr double, ptr %arg20, i32 %linear_index_base
  %306 = getelementptr inbounds double, ptr %305, i32 1
  store double %304, ptr %306, align 8
  %307 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 21
  %308 = getelementptr double, ptr %arg21, i32 %linear_index_base
  %309 = getelementptr inbounds double, ptr %308, i32 1
  store double %307, ptr %309, align 8
  %310 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 22
  %311 = getelementptr double, ptr %arg22, i32 %linear_index_base
  %312 = getelementptr inbounds double, ptr %311, i32 1
  store double %310, ptr %312, align 8
  %313 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 23
  %314 = getelementptr double, ptr %arg23, i32 %linear_index_base
  %315 = getelementptr inbounds double, ptr %314, i32 1
  store double %313, ptr %315, align 8
  %316 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 24
  %317 = getelementptr double, ptr %arg24, i32 %linear_index_base
  %318 = getelementptr inbounds double, ptr %317, i32 1
  store double %316, ptr %318, align 8
  %319 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 25
  %320 = getelementptr double, ptr %arg25, i32 %linear_index_base
  %321 = getelementptr inbounds double, ptr %320, i32 1
  store double %319, ptr %321, align 8
  %322 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 26
  %323 = getelementptr double, ptr %arg26, i32 %linear_index_base
  %324 = getelementptr inbounds double, ptr %323, i32 1
  store double %322, ptr %324, align 8
  %325 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 27
  %326 = getelementptr double, ptr %arg27, i32 %linear_index_base
  %327 = getelementptr inbounds double, ptr %326, i32 1
  store double %325, ptr %327, align 8
  %328 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 28
  %329 = getelementptr double, ptr %arg28, i32 %linear_index_base
  %330 = getelementptr inbounds double, ptr %329, i32 1
  store double %328, ptr %330, align 8
  %331 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 29
  %332 = getelementptr double, ptr %arg29, i32 %linear_index_base
  %333 = getelementptr inbounds double, ptr %332, i32 1
  store double %331, ptr %333, align 8
  %334 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 30
  %335 = getelementptr double, ptr %arg30, i32 %linear_index_base
  %336 = getelementptr inbounds double, ptr %335, i32 1
  store double %334, ptr %336, align 8
  %337 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 31
  %338 = getelementptr double, ptr %arg31, i32 %linear_index_base
  %339 = getelementptr inbounds double, ptr %338, i32 1
  store double %337, ptr %339, align 8
  %340 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 32
  %341 = getelementptr double, ptr %arg32, i32 %linear_index_base
  %342 = getelementptr inbounds double, ptr %341, i32 1
  store double %340, ptr %342, align 8
  %343 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 33
  %344 = getelementptr double, ptr %arg33, i32 %linear_index_base
  %345 = getelementptr inbounds double, ptr %344, i32 1
  store double %343, ptr %345, align 8
  %346 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 34
  %347 = getelementptr double, ptr %arg34, i32 %linear_index_base
  %348 = getelementptr inbounds double, ptr %347, i32 1
  store double %346, ptr %348, align 8
  %349 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 35
  %350 = getelementptr double, ptr %arg35, i32 %linear_index_base
  %351 = getelementptr inbounds double, ptr %350, i32 1
  store double %349, ptr %351, align 8
  %352 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 36
  %353 = getelementptr double, ptr %arg36, i32 %linear_index_base
  %354 = getelementptr inbounds double, ptr %353, i32 1
  store double %352, ptr %354, align 8
  %355 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 37
  %356 = getelementptr double, ptr %arg37, i32 %linear_index_base
  %357 = getelementptr inbounds double, ptr %356, i32 1
  store double %355, ptr %357, align 8
  %358 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 38
  %359 = getelementptr double, ptr %arg38, i32 %linear_index_base
  %360 = getelementptr inbounds double, ptr %359, i32 1
  store double %358, ptr %360, align 8
  %361 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 39
  %362 = getelementptr double, ptr %arg39, i32 %linear_index_base
  %363 = getelementptr inbounds double, ptr %362, i32 1
  store double %361, ptr %363, align 8
  %364 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 40
  %365 = getelementptr double, ptr %arg40, i32 %linear_index_base
  %366 = getelementptr inbounds double, ptr %365, i32 1
  store double %364, ptr %366, align 8
  %367 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 41
  %368 = getelementptr double, ptr %arg41, i32 %linear_index_base
  %369 = getelementptr inbounds double, ptr %368, i32 1
  store double %367, ptr %369, align 8
  %370 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 42
  %371 = getelementptr double, ptr %arg42, i32 %linear_index_base
  %372 = getelementptr inbounds double, ptr %371, i32 1
  store double %370, ptr %372, align 8
  %373 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %243, 43
  %374 = getelementptr double, ptr %arg43, i32 %linear_index_base
  %375 = getelementptr inbounds double, ptr %374, i32 1
  store double %373, ptr %375, align 8
  %constant_64_32 = load double, ptr @3, align 8
  %376 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } undef, double %constant_64_32, 0
  %377 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %376, double %constant_64_32, 1
  %378 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %377, double %constant_64_32, 2
  %379 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %378, double %constant_64_32, 3
  %380 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %379, double %constant_64_32, 4
  %381 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %380, double %constant_64_32, 5
  %382 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %381, double %constant_64_32, 6
  %383 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %382, double %constant_64_32, 7
  %384 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %383, double %constant_64_32, 8
  %385 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %384, double %constant_64_32, 9
  %386 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %385, double %constant_64_32, 10
  %387 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %386, double %constant_64_32, 11
  %388 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %387, double %constant_64_32, 12
  %389 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %388, double %constant_64_32, 13
  %390 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %389, double %constant_64_32, 14
  %391 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %390, double %constant_64_32, 15
  %392 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %391, double %constant_64_32, 16
  %393 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %392, double %constant_64_32, 17
  %394 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %393, double %constant_64_32, 18
  %395 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %394, double %constant_64_32, 19
  %396 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %395, double %constant_64_32, 20
  %397 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %396, double %constant_64_32, 21
  %398 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %397, double %constant_64_32, 22
  %399 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %398, double %constant_64_32, 23
  %400 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %399, double %constant_64_32, 24
  %401 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %400, double %constant_64_32, 25
  %402 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %401, double %constant_64_32, 26
  %403 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %402, double %constant_64_32, 27
  %404 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %403, double %constant_64_32, 28
  %405 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %404, double %constant_64_32, 29
  %406 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %405, double %constant_64_32, 30
  %407 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %406, double %constant_64_32, 31
  %408 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %407, double %constant_64_32, 32
  %409 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %408, double %constant_64_32, 33
  %410 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %409, double %constant_64_32, 34
  %411 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %410, double %constant_64_32, 35
  %412 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %411, double %constant_64_32, 36
  %413 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %412, double %constant_64_32, 37
  %414 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %413, double %constant_64_32, 38
  %415 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %414, double %constant_64_32, 39
  %416 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %415, double %constant_64_32, 40
  %417 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %416, double %constant_64_32, 41
  %418 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %417, double %constant_64_32, 42
  %419 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %418, double %constant_64_32, 43
  %420 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 0
  %421 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %422 = getelementptr inbounds double, ptr %421, i32 2
  store double %420, ptr %422, align 8
  %423 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 1
  %424 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %425 = getelementptr inbounds double, ptr %424, i32 2
  store double %423, ptr %425, align 8
  %426 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 2
  %427 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %428 = getelementptr inbounds double, ptr %427, i32 2
  store double %426, ptr %428, align 8
  %429 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 3
  %430 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %431 = getelementptr inbounds double, ptr %430, i32 2
  store double %429, ptr %431, align 8
  %432 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 4
  %433 = getelementptr double, ptr %arg4, i32 %linear_index_base
  %434 = getelementptr inbounds double, ptr %433, i32 2
  store double %432, ptr %434, align 8
  %435 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 5
  %436 = getelementptr double, ptr %arg5, i32 %linear_index_base
  %437 = getelementptr inbounds double, ptr %436, i32 2
  store double %435, ptr %437, align 8
  %438 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 6
  %439 = getelementptr double, ptr %arg6, i32 %linear_index_base
  %440 = getelementptr inbounds double, ptr %439, i32 2
  store double %438, ptr %440, align 8
  %441 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 7
  %442 = getelementptr double, ptr %arg7, i32 %linear_index_base
  %443 = getelementptr inbounds double, ptr %442, i32 2
  store double %441, ptr %443, align 8
  %444 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 8
  %445 = getelementptr double, ptr %arg8, i32 %linear_index_base
  %446 = getelementptr inbounds double, ptr %445, i32 2
  store double %444, ptr %446, align 8
  %447 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 9
  %448 = getelementptr double, ptr %arg9, i32 %linear_index_base
  %449 = getelementptr inbounds double, ptr %448, i32 2
  store double %447, ptr %449, align 8
  %450 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 10
  %451 = getelementptr double, ptr %arg10, i32 %linear_index_base
  %452 = getelementptr inbounds double, ptr %451, i32 2
  store double %450, ptr %452, align 8
  %453 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 11
  %454 = getelementptr double, ptr %arg11, i32 %linear_index_base
  %455 = getelementptr inbounds double, ptr %454, i32 2
  store double %453, ptr %455, align 8
  %456 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 12
  %457 = getelementptr double, ptr %arg12, i32 %linear_index_base
  %458 = getelementptr inbounds double, ptr %457, i32 2
  store double %456, ptr %458, align 8
  %459 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 13
  %460 = getelementptr double, ptr %arg13, i32 %linear_index_base
  %461 = getelementptr inbounds double, ptr %460, i32 2
  store double %459, ptr %461, align 8
  %462 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 14
  %463 = getelementptr double, ptr %arg14, i32 %linear_index_base
  %464 = getelementptr inbounds double, ptr %463, i32 2
  store double %462, ptr %464, align 8
  %465 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 15
  %466 = getelementptr double, ptr %arg15, i32 %linear_index_base
  %467 = getelementptr inbounds double, ptr %466, i32 2
  store double %465, ptr %467, align 8
  %468 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 16
  %469 = getelementptr double, ptr %arg16, i32 %linear_index_base
  %470 = getelementptr inbounds double, ptr %469, i32 2
  store double %468, ptr %470, align 8
  %471 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 17
  %472 = getelementptr double, ptr %arg17, i32 %linear_index_base
  %473 = getelementptr inbounds double, ptr %472, i32 2
  store double %471, ptr %473, align 8
  %474 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 18
  %475 = getelementptr double, ptr %arg18, i32 %linear_index_base
  %476 = getelementptr inbounds double, ptr %475, i32 2
  store double %474, ptr %476, align 8
  %477 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 19
  %478 = getelementptr double, ptr %arg19, i32 %linear_index_base
  %479 = getelementptr inbounds double, ptr %478, i32 2
  store double %477, ptr %479, align 8
  %480 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 20
  %481 = getelementptr double, ptr %arg20, i32 %linear_index_base
  %482 = getelementptr inbounds double, ptr %481, i32 2
  store double %480, ptr %482, align 8
  %483 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 21
  %484 = getelementptr double, ptr %arg21, i32 %linear_index_base
  %485 = getelementptr inbounds double, ptr %484, i32 2
  store double %483, ptr %485, align 8
  %486 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 22
  %487 = getelementptr double, ptr %arg22, i32 %linear_index_base
  %488 = getelementptr inbounds double, ptr %487, i32 2
  store double %486, ptr %488, align 8
  %489 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 23
  %490 = getelementptr double, ptr %arg23, i32 %linear_index_base
  %491 = getelementptr inbounds double, ptr %490, i32 2
  store double %489, ptr %491, align 8
  %492 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 24
  %493 = getelementptr double, ptr %arg24, i32 %linear_index_base
  %494 = getelementptr inbounds double, ptr %493, i32 2
  store double %492, ptr %494, align 8
  %495 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 25
  %496 = getelementptr double, ptr %arg25, i32 %linear_index_base
  %497 = getelementptr inbounds double, ptr %496, i32 2
  store double %495, ptr %497, align 8
  %498 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 26
  %499 = getelementptr double, ptr %arg26, i32 %linear_index_base
  %500 = getelementptr inbounds double, ptr %499, i32 2
  store double %498, ptr %500, align 8
  %501 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 27
  %502 = getelementptr double, ptr %arg27, i32 %linear_index_base
  %503 = getelementptr inbounds double, ptr %502, i32 2
  store double %501, ptr %503, align 8
  %504 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 28
  %505 = getelementptr double, ptr %arg28, i32 %linear_index_base
  %506 = getelementptr inbounds double, ptr %505, i32 2
  store double %504, ptr %506, align 8
  %507 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 29
  %508 = getelementptr double, ptr %arg29, i32 %linear_index_base
  %509 = getelementptr inbounds double, ptr %508, i32 2
  store double %507, ptr %509, align 8
  %510 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 30
  %511 = getelementptr double, ptr %arg30, i32 %linear_index_base
  %512 = getelementptr inbounds double, ptr %511, i32 2
  store double %510, ptr %512, align 8
  %513 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 31
  %514 = getelementptr double, ptr %arg31, i32 %linear_index_base
  %515 = getelementptr inbounds double, ptr %514, i32 2
  store double %513, ptr %515, align 8
  %516 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 32
  %517 = getelementptr double, ptr %arg32, i32 %linear_index_base
  %518 = getelementptr inbounds double, ptr %517, i32 2
  store double %516, ptr %518, align 8
  %519 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 33
  %520 = getelementptr double, ptr %arg33, i32 %linear_index_base
  %521 = getelementptr inbounds double, ptr %520, i32 2
  store double %519, ptr %521, align 8
  %522 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 34
  %523 = getelementptr double, ptr %arg34, i32 %linear_index_base
  %524 = getelementptr inbounds double, ptr %523, i32 2
  store double %522, ptr %524, align 8
  %525 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 35
  %526 = getelementptr double, ptr %arg35, i32 %linear_index_base
  %527 = getelementptr inbounds double, ptr %526, i32 2
  store double %525, ptr %527, align 8
  %528 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 36
  %529 = getelementptr double, ptr %arg36, i32 %linear_index_base
  %530 = getelementptr inbounds double, ptr %529, i32 2
  store double %528, ptr %530, align 8
  %531 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 37
  %532 = getelementptr double, ptr %arg37, i32 %linear_index_base
  %533 = getelementptr inbounds double, ptr %532, i32 2
  store double %531, ptr %533, align 8
  %534 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 38
  %535 = getelementptr double, ptr %arg38, i32 %linear_index_base
  %536 = getelementptr inbounds double, ptr %535, i32 2
  store double %534, ptr %536, align 8
  %537 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 39
  %538 = getelementptr double, ptr %arg39, i32 %linear_index_base
  %539 = getelementptr inbounds double, ptr %538, i32 2
  store double %537, ptr %539, align 8
  %540 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 40
  %541 = getelementptr double, ptr %arg40, i32 %linear_index_base
  %542 = getelementptr inbounds double, ptr %541, i32 2
  store double %540, ptr %542, align 8
  %543 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 41
  %544 = getelementptr double, ptr %arg41, i32 %linear_index_base
  %545 = getelementptr inbounds double, ptr %544, i32 2
  store double %543, ptr %545, align 8
  %546 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 42
  %547 = getelementptr double, ptr %arg42, i32 %linear_index_base
  %548 = getelementptr inbounds double, ptr %547, i32 2
  store double %546, ptr %548, align 8
  %549 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %419, 43
  %550 = getelementptr double, ptr %arg43, i32 %linear_index_base
  %551 = getelementptr inbounds double, ptr %550, i32 2
  store double %549, ptr %551, align 8
  %constant_64_33 = load double, ptr @3, align 8
  %552 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } undef, double %constant_64_33, 0
  %553 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %552, double %constant_64_33, 1
  %554 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %553, double %constant_64_33, 2
  %555 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %554, double %constant_64_33, 3
  %556 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %555, double %constant_64_33, 4
  %557 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %556, double %constant_64_33, 5
  %558 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %557, double %constant_64_33, 6
  %559 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %558, double %constant_64_33, 7
  %560 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %559, double %constant_64_33, 8
  %561 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %560, double %constant_64_33, 9
  %562 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %561, double %constant_64_33, 10
  %563 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %562, double %constant_64_33, 11
  %564 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %563, double %constant_64_33, 12
  %565 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %564, double %constant_64_33, 13
  %566 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %565, double %constant_64_33, 14
  %567 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %566, double %constant_64_33, 15
  %568 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %567, double %constant_64_33, 16
  %569 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %568, double %constant_64_33, 17
  %570 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %569, double %constant_64_33, 18
  %571 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %570, double %constant_64_33, 19
  %572 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %571, double %constant_64_33, 20
  %573 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %572, double %constant_64_33, 21
  %574 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %573, double %constant_64_33, 22
  %575 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %574, double %constant_64_33, 23
  %576 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %575, double %constant_64_33, 24
  %577 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %576, double %constant_64_33, 25
  %578 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %577, double %constant_64_33, 26
  %579 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %578, double %constant_64_33, 27
  %580 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %579, double %constant_64_33, 28
  %581 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %580, double %constant_64_33, 29
  %582 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %581, double %constant_64_33, 30
  %583 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %582, double %constant_64_33, 31
  %584 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %583, double %constant_64_33, 32
  %585 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %584, double %constant_64_33, 33
  %586 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %585, double %constant_64_33, 34
  %587 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %586, double %constant_64_33, 35
  %588 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %587, double %constant_64_33, 36
  %589 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %588, double %constant_64_33, 37
  %590 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %589, double %constant_64_33, 38
  %591 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %590, double %constant_64_33, 39
  %592 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %591, double %constant_64_33, 40
  %593 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %592, double %constant_64_33, 41
  %594 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %593, double %constant_64_33, 42
  %595 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %594, double %constant_64_33, 43
  %596 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 0
  %597 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %598 = getelementptr inbounds double, ptr %597, i32 3
  store double %596, ptr %598, align 8
  %599 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 1
  %600 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %601 = getelementptr inbounds double, ptr %600, i32 3
  store double %599, ptr %601, align 8
  %602 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 2
  %603 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %604 = getelementptr inbounds double, ptr %603, i32 3
  store double %602, ptr %604, align 8
  %605 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 3
  %606 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %607 = getelementptr inbounds double, ptr %606, i32 3
  store double %605, ptr %607, align 8
  %608 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 4
  %609 = getelementptr double, ptr %arg4, i32 %linear_index_base
  %610 = getelementptr inbounds double, ptr %609, i32 3
  store double %608, ptr %610, align 8
  %611 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 5
  %612 = getelementptr double, ptr %arg5, i32 %linear_index_base
  %613 = getelementptr inbounds double, ptr %612, i32 3
  store double %611, ptr %613, align 8
  %614 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 6
  %615 = getelementptr double, ptr %arg6, i32 %linear_index_base
  %616 = getelementptr inbounds double, ptr %615, i32 3
  store double %614, ptr %616, align 8
  %617 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 7
  %618 = getelementptr double, ptr %arg7, i32 %linear_index_base
  %619 = getelementptr inbounds double, ptr %618, i32 3
  store double %617, ptr %619, align 8
  %620 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 8
  %621 = getelementptr double, ptr %arg8, i32 %linear_index_base
  %622 = getelementptr inbounds double, ptr %621, i32 3
  store double %620, ptr %622, align 8
  %623 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 9
  %624 = getelementptr double, ptr %arg9, i32 %linear_index_base
  %625 = getelementptr inbounds double, ptr %624, i32 3
  store double %623, ptr %625, align 8
  %626 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 10
  %627 = getelementptr double, ptr %arg10, i32 %linear_index_base
  %628 = getelementptr inbounds double, ptr %627, i32 3
  store double %626, ptr %628, align 8
  %629 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 11
  %630 = getelementptr double, ptr %arg11, i32 %linear_index_base
  %631 = getelementptr inbounds double, ptr %630, i32 3
  store double %629, ptr %631, align 8
  %632 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 12
  %633 = getelementptr double, ptr %arg12, i32 %linear_index_base
  %634 = getelementptr inbounds double, ptr %633, i32 3
  store double %632, ptr %634, align 8
  %635 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 13
  %636 = getelementptr double, ptr %arg13, i32 %linear_index_base
  %637 = getelementptr inbounds double, ptr %636, i32 3
  store double %635, ptr %637, align 8
  %638 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 14
  %639 = getelementptr double, ptr %arg14, i32 %linear_index_base
  %640 = getelementptr inbounds double, ptr %639, i32 3
  store double %638, ptr %640, align 8
  %641 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 15
  %642 = getelementptr double, ptr %arg15, i32 %linear_index_base
  %643 = getelementptr inbounds double, ptr %642, i32 3
  store double %641, ptr %643, align 8
  %644 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 16
  %645 = getelementptr double, ptr %arg16, i32 %linear_index_base
  %646 = getelementptr inbounds double, ptr %645, i32 3
  store double %644, ptr %646, align 8
  %647 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 17
  %648 = getelementptr double, ptr %arg17, i32 %linear_index_base
  %649 = getelementptr inbounds double, ptr %648, i32 3
  store double %647, ptr %649, align 8
  %650 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 18
  %651 = getelementptr double, ptr %arg18, i32 %linear_index_base
  %652 = getelementptr inbounds double, ptr %651, i32 3
  store double %650, ptr %652, align 8
  %653 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 19
  %654 = getelementptr double, ptr %arg19, i32 %linear_index_base
  %655 = getelementptr inbounds double, ptr %654, i32 3
  store double %653, ptr %655, align 8
  %656 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 20
  %657 = getelementptr double, ptr %arg20, i32 %linear_index_base
  %658 = getelementptr inbounds double, ptr %657, i32 3
  store double %656, ptr %658, align 8
  %659 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 21
  %660 = getelementptr double, ptr %arg21, i32 %linear_index_base
  %661 = getelementptr inbounds double, ptr %660, i32 3
  store double %659, ptr %661, align 8
  %662 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 22
  %663 = getelementptr double, ptr %arg22, i32 %linear_index_base
  %664 = getelementptr inbounds double, ptr %663, i32 3
  store double %662, ptr %664, align 8
  %665 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 23
  %666 = getelementptr double, ptr %arg23, i32 %linear_index_base
  %667 = getelementptr inbounds double, ptr %666, i32 3
  store double %665, ptr %667, align 8
  %668 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 24
  %669 = getelementptr double, ptr %arg24, i32 %linear_index_base
  %670 = getelementptr inbounds double, ptr %669, i32 3
  store double %668, ptr %670, align 8
  %671 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 25
  %672 = getelementptr double, ptr %arg25, i32 %linear_index_base
  %673 = getelementptr inbounds double, ptr %672, i32 3
  store double %671, ptr %673, align 8
  %674 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 26
  %675 = getelementptr double, ptr %arg26, i32 %linear_index_base
  %676 = getelementptr inbounds double, ptr %675, i32 3
  store double %674, ptr %676, align 8
  %677 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 27
  %678 = getelementptr double, ptr %arg27, i32 %linear_index_base
  %679 = getelementptr inbounds double, ptr %678, i32 3
  store double %677, ptr %679, align 8
  %680 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 28
  %681 = getelementptr double, ptr %arg28, i32 %linear_index_base
  %682 = getelementptr inbounds double, ptr %681, i32 3
  store double %680, ptr %682, align 8
  %683 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 29
  %684 = getelementptr double, ptr %arg29, i32 %linear_index_base
  %685 = getelementptr inbounds double, ptr %684, i32 3
  store double %683, ptr %685, align 8
  %686 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 30
  %687 = getelementptr double, ptr %arg30, i32 %linear_index_base
  %688 = getelementptr inbounds double, ptr %687, i32 3
  store double %686, ptr %688, align 8
  %689 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 31
  %690 = getelementptr double, ptr %arg31, i32 %linear_index_base
  %691 = getelementptr inbounds double, ptr %690, i32 3
  store double %689, ptr %691, align 8
  %692 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 32
  %693 = getelementptr double, ptr %arg32, i32 %linear_index_base
  %694 = getelementptr inbounds double, ptr %693, i32 3
  store double %692, ptr %694, align 8
  %695 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 33
  %696 = getelementptr double, ptr %arg33, i32 %linear_index_base
  %697 = getelementptr inbounds double, ptr %696, i32 3
  store double %695, ptr %697, align 8
  %698 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 34
  %699 = getelementptr double, ptr %arg34, i32 %linear_index_base
  %700 = getelementptr inbounds double, ptr %699, i32 3
  store double %698, ptr %700, align 8
  %701 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 35
  %702 = getelementptr double, ptr %arg35, i32 %linear_index_base
  %703 = getelementptr inbounds double, ptr %702, i32 3
  store double %701, ptr %703, align 8
  %704 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 36
  %705 = getelementptr double, ptr %arg36, i32 %linear_index_base
  %706 = getelementptr inbounds double, ptr %705, i32 3
  store double %704, ptr %706, align 8
  %707 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 37
  %708 = getelementptr double, ptr %arg37, i32 %linear_index_base
  %709 = getelementptr inbounds double, ptr %708, i32 3
  store double %707, ptr %709, align 8
  %710 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 38
  %711 = getelementptr double, ptr %arg38, i32 %linear_index_base
  %712 = getelementptr inbounds double, ptr %711, i32 3
  store double %710, ptr %712, align 8
  %713 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 39
  %714 = getelementptr double, ptr %arg39, i32 %linear_index_base
  %715 = getelementptr inbounds double, ptr %714, i32 3
  store double %713, ptr %715, align 8
  %716 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 40
  %717 = getelementptr double, ptr %arg40, i32 %linear_index_base
  %718 = getelementptr inbounds double, ptr %717, i32 3
  store double %716, ptr %718, align 8
  %719 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 41
  %720 = getelementptr double, ptr %arg41, i32 %linear_index_base
  %721 = getelementptr inbounds double, ptr %720, i32 3
  store double %719, ptr %721, align 8
  %722 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 42
  %723 = getelementptr double, ptr %arg42, i32 %linear_index_base
  %724 = getelementptr inbounds double, ptr %723, i32 3
  store double %722, ptr %724, align 8
  %725 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %595, 43
  %726 = getelementptr double, ptr %arg43, i32 %linear_index_base
  %727 = getelementptr inbounds double, ptr %726, i32 3
  store double %725, ptr %727, align 8
  br label %loop_broadcast_fusion.2.in_bounds-after
}

define void @loop_compare_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !195
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
  %4 = load i64, ptr %arg0, align 8, !invariant.load !191
  %constant_767_1 = load i64, ptr @4, align 8
  %5 = icmp slt i64 %4, %constant_767_1
  %6 = zext i1 %5 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.in_bounds-after
}

define void @loop_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !195
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
  %5 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_107 = load i64, ptr @6, align 8
  %6 = icmp slt i64 %5, %constant_770_107
  %7 = zext i1 %6 to i8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_4 = load i64, ptr @5, align 8
  %9 = add i64 %8, %constant_769_4
  %10 = load i64, ptr %arg1, align 8, !invariant.load !191
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.54.1.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.54.1.start_idx0, %3
  %18 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %17
  %19 = load double, ptr %18, align 8, !invariant.load !191
  %20 = getelementptr double, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %19, ptr %21, align 8
  br label %loop_dynamic_slice_fusion.in_bounds-after
}

define void @loop_convert_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !195
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
  %5 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_108 = load i64, ptr @9, align 8
  %6 = icmp slt i64 %5, %constant_770_108
  %7 = zext i1 %6 to i8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_5 = load i64, ptr @8, align 8
  %9 = add i64 %8, %constant_769_5
  %10 = load i64, ptr %arg1, align 8, !invariant.load !191
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.55.1.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.55.1.start_idx0, %3
  %18 = getelementptr inbounds [192 x i32], ptr %arg0, i32 0, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !191
  %20 = insertvalue { i32, i32 } undef, i32 %19, 0
  %21 = getelementptr i32, ptr @7, i32 %linear_index
  %constant_778_1_clone_1 = getelementptr inbounds i32, ptr %21, i32 0
  %constant_778_1_clone_11 = load i32, ptr %constant_778_1_clone_1, align 4
  %22 = icmp ne i32 %19, %constant_778_1_clone_11
  %23 = zext i1 %22 to i8
  %24 = zext i8 %23 to i32
  %25 = insertvalue { i32, i32 } %20, i32 %24, 1
  %26 = extractvalue { i32, i32 } %25, 0
  %27 = getelementptr i32, ptr %arg2, i32 %linear_index
  %28 = getelementptr inbounds i32, ptr %27, i32 0
  store i32 %26, ptr %28, align 4
  %29 = extractvalue { i32, i32 } %25, 1
  %30 = getelementptr i32, ptr %arg3, i32 %linear_index
  %31 = getelementptr inbounds i32, ptr %30, i32 0
  store i32 %29, ptr %31, align 4
  br label %loop_convert_dynamic_slice_fusion.in_bounds-after
}

define void @loop_divide_multiply_fusion(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_divide_multiply_fusion.in_bounds-true, label %loop_divide_multiply_fusion.in_bounds-after

loop_divide_multiply_fusion.in_bounds-after:      ; preds = %loop_divide_multiply_fusion.in_bounds-true, %entry
  ret void

loop_divide_multiply_fusion.in_bounds-true:       ; preds = %entry
  %constant_772_27 = load double, ptr @10, align 8
  %5 = getelementptr double, ptr %arg2, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !191
  %8 = getelementptr double, ptr %arg3, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !191
  %multiply.3498.7.clone.1 = fmul double %7, %10
  %11 = getelementptr inbounds [1 x double], ptr %arg1, i32 0, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !191
  %13 = getelementptr double, ptr %arg0, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !191
  %multiply.3499.9.clone.1 = fmul double %12, %15
  %add.1031.7.clone.1 = fadd double %multiply.3498.7.clone.1, %multiply.3499.9.clone.1
  %16 = fneg double %add.1031.7.clone.1
  %17 = call double @__nv_exp(double %16)
  %add.1032.1.clone.1 = fadd double %17, %constant_772_27
  %divide.856.1.clone.1 = fdiv double %constant_772_27, %add.1032.1.clone.1
  %subtract.145.5 = fsub double %constant_772_27, %divide.856.1.clone.1
  %multiply.3500.1 = fmul double %divide.856.1.clone.1, %subtract.145.5
  %18 = insertvalue { double, double } undef, double %multiply.3500.1, 0
  %19 = insertvalue { double, double } %18, double %divide.856.1.clone.1, 1
  %20 = extractvalue { double, double } %19, 0
  %21 = getelementptr double, ptr %arg4, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  store double %20, ptr %22, align 8
  %23 = extractvalue { double, double } %19, 1
  %24 = getelementptr double, ptr %arg5, i32 %linear_index
  %25 = getelementptr inbounds double, ptr %24, i32 0
  store double %23, ptr %25, align 8
  br label %loop_divide_multiply_fusion.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_divide_fusion(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_divide_fusion.in_bounds-true, label %loop_divide_fusion.in_bounds-after

loop_divide_fusion.in_bounds-after:               ; preds = %loop_divide_fusion.in_bounds-true, %entry
  ret void

loop_divide_fusion.in_bounds-true:                ; preds = %entry
  %constant_772_5 = load double, ptr @11, align 8
  %5 = getelementptr double, ptr %arg5, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !191
  %divide.857.1.clone.1 = fdiv double %constant_772_5, %7
  %8 = getelementptr inbounds [1 x double], ptr %arg1, i32 0, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !191
  %10 = getelementptr double, ptr %arg2, i32 %linear_index
  %11 = getelementptr inbounds double, ptr %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !191
  %13 = getelementptr double, ptr %arg4, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !191
  %16 = getelementptr double, ptr %arg3, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !191
  %multiply.3502.27 = fmul double %15, %18
  %add.1033.25 = fadd double %12, %multiply.3502.27
  %19 = call double @__nv_exp(double %add.1033.25)
  %multiply.3503.37 = fmul double %9, %19
  %constant_774_2 = load double, ptr @12, align 8
  %compare.375.19 = fcmp ogt double %multiply.3503.37, %constant_774_2
  %20 = zext i1 %compare.375.19 to i8
  %21 = getelementptr double, ptr %arg0, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  %23 = load double, ptr %22, align 8, !invariant.load !191
  %24 = trunc i8 %20 to i1
  %25 = select i1 %24, double %multiply.3503.37, double %23
  %add.1034.2 = fadd double %divide.857.1.clone.1, %25
  %divide.858.1 = fdiv double %constant_772_5, %add.1034.2
  %26 = insertvalue { double, double, double } undef, double %divide.858.1, 0
  %27 = insertvalue { double, double, double } %26, double %divide.857.1.clone.1, 1
  %28 = getelementptr double, ptr %arg5, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  %30 = load double, ptr %29, align 8, !invariant.load !191
  %31 = getelementptr double, ptr %arg5, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  %33 = load double, ptr %32, align 8, !invariant.load !191
  %multiply.3508.2.clone.1 = fmul double %30, %33
  %divide.860.1.clone.1 = fdiv double %constant_772_5, %multiply.3508.2.clone.1
  %34 = insertvalue { double, double, double } %27, double %divide.860.1.clone.1, 2
  %35 = extractvalue { double, double, double } %34, 0
  %36 = getelementptr double, ptr %arg6, i32 %linear_index
  %37 = getelementptr inbounds double, ptr %36, i32 0
  store double %35, ptr %37, align 8
  %38 = extractvalue { double, double, double } %34, 1
  %39 = getelementptr double, ptr %arg7, i32 %linear_index
  %40 = getelementptr inbounds double, ptr %39, i32 0
  store double %38, ptr %40, align 8
  %41 = extractvalue { double, double, double } %34, 2
  %42 = getelementptr double, ptr %arg8, i32 %linear_index
  %43 = getelementptr inbounds double, ptr %42, i32 0
  store double %41, ptr %43, align 8
  br label %loop_divide_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_103(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(768) %arg2) {
entry:
  %param_1.1616 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_110 = load i64, ptr @15, align 8
  %0 = icmp slt i64 %param_1.1616, %constant_770_110
  %1 = zext i1 %0 to i8
  %param_1.16161 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_32 = load i64, ptr @14, align 8
  %2 = add i64 %param_1.16161, %constant_769_32
  %param_1.16162 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.16162
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !195
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
  %param_1.16163 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_1104 = load i64, ptr @15, align 8
  %15 = icmp slt i64 %param_1.16163, %constant_770_1104
  %16 = zext i1 %15 to i8
  %param_1.16165 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_326 = load i64, ptr @14, align 8
  %17 = add i64 %param_1.16165, %constant_769_326
  %param_1.16167 = load i64, ptr %arg1, align 8, !invariant.load !191
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_1.16167
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.55.21.start_idx0 = select i1 %22, i64 191, i64 %21
  %23 = add i64 %dynamic-slice.55.21.start_idx0, %12
  %param_2.1372 = getelementptr inbounds [192 x i32], ptr %arg2, i64 0, i64 %23
  %param_2.13728 = load i32, ptr %param_2.1372, align 4, !invariant.load !191
  %24 = getelementptr i32, ptr @13, i64 %linear_index
  %constant_778_2 = getelementptr inbounds i32, ptr %24, i64 0
  %constant_778_29 = load i32, ptr %constant_778_2, align 4
  %25 = icmp ne i32 %param_2.13728, %constant_778_29
  %26 = zext i1 %25 to i8
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds [192 x i32], ptr %arg0, i64 0, i64 %14
  store i32 %27, ptr %28, align 4
  br label %dynamic-update-slice.2048.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_78(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(768) %arg2) {
entry:
  %param_1.1488 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_109 = load i64, ptr @17, align 8
  %0 = icmp slt i64 %param_1.1488, %constant_770_109
  %1 = zext i1 %0 to i8
  %param_1.14881 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_28 = load i64, ptr @16, align 8
  %2 = add i64 %param_1.14881, %constant_769_28
  %param_1.14882 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.14882
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !195
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
  %param_1.14883 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_1094 = load i64, ptr @17, align 8
  %15 = icmp slt i64 %param_1.14883, %constant_770_1094
  %16 = zext i1 %15 to i8
  %param_1.14885 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_286 = load i64, ptr @16, align 8
  %17 = add i64 %param_1.14885, %constant_769_286
  %param_1.14887 = load i64, ptr %arg1, align 8, !invariant.load !191
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_1.14887
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.55.13.start_idx0 = select i1 %22, i64 191, i64 %21
  %23 = add i64 %dynamic-slice.55.13.start_idx0, 0
  %param_2.1349 = getelementptr inbounds [192 x i32], ptr %arg2, i64 0, i64 %23
  %param_2.13498 = load i32, ptr %param_2.1349, align 4, !invariant.load !191
  %24 = sitofp i32 %param_2.13498 to double
  %25 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %24, ptr %25, align 8
  br label %dynamic-update-slice.2045.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_85(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(160) %arg5) {
entry:
  %param_1.1541 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_38 = load i64, ptr @20, align 8
  %0 = icmp slt i64 %param_1.1541, %constant_770_38
  %1 = zext i1 %0 to i8
  %param_1.15411 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_20 = load i64, ptr @19, align 8
  %2 = add i64 %param_1.15411, %constant_769_20
  %param_1.15412 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15412
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_383 = load i64, ptr @20, align 8
  %9 = icmp sge i64 0, %constant_770_383
  %10 = select i1 %9, i64 0, i64 %constant_770_383
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2038.1.in_bounds-true, label %dynamic-update-slice.2038.1.in_bounds-after

dynamic-update-slice.2038.1.in_bounds-after:      ; preds = %dynamic-update-slice.2038.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2038.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_2.1357 = getelementptr inbounds [1 x double], ptr %arg2, i64 0, i64 0
  %param_2.13574 = load double, ptr %param_2.1357, align 8, !invariant.load !191
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1170 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.11705 = load double, ptr %param_3.1170, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.834 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.8346 = load double, ptr %param_5.834, align 8, !invariant.load !191
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.948 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.9487 = load double, ptr %param_4.948, align 8, !invariant.load !191
  %multiply.3502.9 = fmul double %param_5.8346, %param_4.9487
  %add.1033.7 = fadd double %param_3.11705, %multiply.3502.9
  %25 = call double @__nv_exp(double %add.1033.7)
  %multiply.3503.25 = fmul double %param_2.13574, %25
  %constant_774_6 = load double, ptr @18, align 8
  %compare.375.7 = fcmp ogt double %multiply.3503.25, %constant_774_6
  %26 = zext i1 %compare.375.7 to i8
  %27 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %26, ptr %27, align 1
  br label %dynamic-update-slice.2038.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_93(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_1.1523 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_20 = load i64, ptr @23, align 8
  %0 = icmp slt i64 %param_1.1523, %constant_770_20
  %1 = zext i1 %0 to i8
  %param_1.15231 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_11 = load i64, ptr @22, align 8
  %2 = add i64 %param_1.15231, %constant_769_11
  %param_1.15232 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15232
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_203 = load i64, ptr @23, align 8
  %9 = icmp sge i64 0, %constant_770_203
  %10 = select i1 %9, i64 0, i64 %constant_770_203
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2030.1.in_bounds-true, label %dynamic-update-slice.2030.1.in_bounds-after

dynamic-update-slice.2030.1.in_bounds-after:      ; preds = %dynamic-update-slice.2030.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2030.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_3.1172 = getelementptr inbounds [1 x double], ptr %arg3, i64 0, i64 0
  %param_3.11724 = load double, ptr %param_3.1172, align 8, !invariant.load !191
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1358 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.13585 = load double, ptr %param_2.1358, align 8, !invariant.load !191
  %23 = call double @__nv_exp(double %param_2.13585)
  %multiply.3524.37 = fmul double %param_3.11724, %23
  %constant_774_16 = load double, ptr @21, align 8
  %compare.377.7 = fcmp ogt double %multiply.3524.37, %constant_774_16
  %24 = zext i1 %compare.377.7 to i8
  %25 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %24, ptr %25, align 1
  br label %dynamic-update-slice.2030.1.in_bounds-after
}

define void @loop_add_fusion(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(19200) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(19200) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !197
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %2 = mul nuw nsw i32 %0, 140
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !198
  %4 = mul nuw nsw i32 %3, 20
  %5 = add nuw nsw i32 %2, %4
  %linear_index = add nuw nsw i32 %5, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2520
  call void @llvm.assume(i1 %linear_index_in_range)
  %row_index = mul nuw nsw i32 %1, 1
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %6 = udiv i32 %linear_index0, 1
  %7 = urem i32 %6, 20
  %8 = udiv i32 %linear_index0, 20
  %9 = icmp ult i32 %linear_index, 2400
  br i1 %9, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %10 = getelementptr inbounds [20 x double], ptr %arg3, i32 0, i32 %row_index
  %11 = load double, ptr %10, align 8, !invariant.load !191
  %12 = getelementptr double, ptr %arg2, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !191
  %multiply.3504.19 = fmul double %11, %14
  %15 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %row_index
  %16 = load double, ptr %15, align 8, !invariant.load !191
  %multiply.3505.19 = fmul double %multiply.3504.19, %16
  %constant_772_26 = load double, ptr @24, align 8
  %17 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %row_index
  %18 = load double, ptr %17, align 8, !invariant.load !191
  %subtract.145.3 = fsub double %constant_772_26, %18
  %multiply.3506.3 = fmul double %multiply.3505.19, %subtract.145.3
  %19 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %row_index
  %20 = load double, ptr %19, align 8, !invariant.load !191
  %21 = fneg double %multiply.3505.19
  %multiply.3507.3 = fmul double %20, %21
  %add.1035.1 = fadd double %multiply.3506.3, %multiply.3507.3
  %22 = getelementptr double, ptr %arg4, i32 %linear_index
  %23 = getelementptr inbounds double, ptr %22, i32 0
  store double %add.1035.1, ptr %23, align 8
  br label %loop_add_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

define void @loop_multiply_fusion_1(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1, ptr noalias align 16 dereferenceable(19200) %arg2, ptr noalias align 128 dereferenceable(19200) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 16 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(19200) %arg10) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 2400
  br i1 %6, label %loop_multiply_fusion.1.in_bounds-true, label %loop_multiply_fusion.1.in_bounds-after

loop_multiply_fusion.1.in_bounds-after:           ; preds = %loop_multiply_fusion.1.in_bounds-true, %entry
  ret void

loop_multiply_fusion.1.in_bounds-true:            ; preds = %entry
  %7 = getelementptr double, ptr %arg1, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !191
  %10 = fneg double %9
  %11 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %4
  %12 = load double, ptr %11, align 8, !invariant.load !191
  %multiply.3509.9 = fmul double %10, %12
  %13 = getelementptr inbounds [1 x double], ptr %arg5, i32 0, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !191
  %15 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %4
  %16 = load double, ptr %15, align 8, !invariant.load !191
  %17 = getelementptr inbounds [20 x [1 x double]], ptr %arg4, i32 0, i32 %4, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !191
  %19 = getelementptr inbounds [20 x double], ptr %arg7, i32 0, i32 %4
  %20 = load double, ptr %19, align 8, !invariant.load !191
  %multiply.3502.33 = fmul double %18, %20
  %add.1033.31 = fadd double %16, %multiply.3502.33
  %21 = call double @__nv_exp(double %add.1033.31)
  %multiply.3503.45 = fmul double %14, %21
  %constant_774_26 = load double, ptr @25, align 8
  %compare.375.25 = fcmp ogt double %multiply.3503.45, %constant_774_26
  %22 = zext i1 %compare.375.25 to i8
  %23 = getelementptr double, ptr %arg2, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !191
  %26 = getelementptr double, ptr %arg3, i32 %linear_index
  %27 = getelementptr inbounds double, ptr %26, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !191
  %multiply.3510.13 = fmul double %18, %28
  %add.1036.11 = fadd double %25, %multiply.3510.13
  %multiply.3511.9 = fmul double %add.1036.11, %21
  %multiply.3512.7 = fmul double %14, %multiply.3511.9
  %constant_776_23 = load double, ptr @27, align 8
  %29 = trunc i8 %22 to i1
  %30 = select i1 %29, double %multiply.3512.7, double %constant_776_23
  %add.1037.5 = fadd double %multiply.3509.9, %30
  %31 = fneg double %add.1037.5
  %constant_772_8 = load double, ptr @26, align 8
  %32 = getelementptr inbounds [20 x double], ptr %arg8, i32 0, i32 %4
  %33 = load double, ptr %32, align 8, !invariant.load !191
  %34 = getelementptr inbounds [20 x double], ptr %arg9, i32 0, i32 %4
  %35 = load double, ptr %34, align 8, !invariant.load !191
  %36 = trunc i8 %22 to i1
  %37 = select i1 %36, double %multiply.3503.45, double %35
  %add.1034.10 = fadd double %33, %37
  %multiply.3513.10 = fmul double %add.1034.10, %add.1034.10
  %divide.861.5 = fdiv double %constant_772_8, %multiply.3513.10
  %multiply.3514.1 = fmul double %31, %divide.861.5
  %38 = getelementptr double, ptr %arg10, i32 %linear_index
  %39 = getelementptr inbounds double, ptr %38, i32 0
  store double %multiply.3514.1, ptr %39, align 8
  br label %loop_multiply_fusion.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_84(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1284 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_40 = load i64, ptr @29, align 8
  %0 = icmp slt i64 %param_2.1284, %constant_770_40
  %1 = zext i1 %0 to i8
  %param_2.12841 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_21 = load i64, ptr @28, align 8
  %2 = add i64 %param_2.12841, %constant_769_21
  %param_2.12842 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12842
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_403 = load i64, ptr @29, align 8
  %9 = icmp sge i64 0, %constant_770_403
  %10 = select i1 %9, i64 0, i64 %constant_770_403
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2039.1.in_bounds-true, label %dynamic-update-slice.2039.1.in_bounds-after

dynamic-update-slice.2039.1.in_bounds-after:      ; preds = %dynamic-update-slice.2039.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2039.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1543 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15434 = load double, ptr %param_1.1543, align 8, !invariant.load !191
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.15434, ptr %23, align 8
  br label %dynamic-update-slice.2039.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_82(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 16 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 16 dereferenceable(160) %arg7) {
entry:
  %param_1.1549 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_46 = load i64, ptr @33, align 8
  %0 = icmp slt i64 %param_1.1549, %constant_770_46
  %1 = zext i1 %0 to i8
  %param_1.15491 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_24 = load i64, ptr @32, align 8
  %2 = add i64 %param_1.15491, %constant_769_24
  %param_1.15492 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15492
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_463 = load i64, ptr @33, align 8
  %9 = icmp sge i64 0, %constant_770_463
  %10 = select i1 %9, i64 0, i64 %constant_770_463
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2041.1.in_bounds-true, label %dynamic-update-slice.2041.1.in_bounds-after

dynamic-update-slice.2041.1.in_bounds-after:      ; preds = %dynamic-update-slice.2041.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2041.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_772_29 = load double, ptr @31, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1290 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.12904 = load double, ptr %param_2.1290, align 8, !invariant.load !191
  %param_4.918 = getelementptr inbounds [1 x double], ptr %arg4, i64 0, i64 0
  %param_4.9185 = load double, ptr %param_4.918, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.838 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.8386 = load double, ptr %param_5.838, align 8, !invariant.load !191
  %24 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.454 = getelementptr inbounds double, ptr %24, i64 0
  %param_7.4547 = load double, ptr %param_7.454, align 8, !invariant.load !191
  %25 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.608 = getelementptr inbounds double, ptr %25, i64 0
  %param_6.6088 = load double, ptr %param_6.608, align 8, !invariant.load !191
  %multiply.3502.39 = fmul double %param_7.4547, %param_6.6088
  %add.1033.37 = fadd double %param_5.8386, %multiply.3502.39
  %26 = call double @__nv_exp(double %add.1033.37)
  %multiply.3503.53 = fmul double %param_4.9185, %26
  %constant_774_11 = load double, ptr @30, align 8
  %compare.375.31 = fcmp ogt double %multiply.3503.53, %constant_774_11
  %27 = zext i1 %compare.375.31 to i8
  %28 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1125 = getelementptr inbounds double, ptr %28, i64 0
  %param_3.11259 = load double, ptr %param_3.1125, align 8, !invariant.load !191
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, double %multiply.3503.53, double %param_3.11259
  %add.1034.8 = fadd double %param_2.12904, %30
  %multiply.3513.8 = fmul double %add.1034.8, %add.1034.8
  %divide.861.3 = fdiv double %constant_772_29, %multiply.3513.8
  %31 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.861.3, ptr %31, align 8
  br label %dynamic-update-slice.2041.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_77(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 16 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(768) %arg4) {
entry:
  %param_3.1134 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_57 = load i64, ptr @35, align 8
  %0 = icmp slt i64 %param_3.1134, %constant_770_57
  %1 = zext i1 %0 to i8
  %param_3.11341 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_30 = load i64, ptr @34, align 8
  %2 = add i64 %param_3.11341, %constant_769_30
  %param_3.11342 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11342
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_573 = load i64, ptr @35, align 8
  %9 = icmp sge i64 0, %constant_770_573
  %10 = select i1 %9, i64 0, i64 %constant_770_573
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2046.1.in_bounds-true, label %dynamic-update-slice.2046.1.in_bounds-after

dynamic-update-slice.2046.1.in_bounds-after:      ; preds = %dynamic-update-slice.2046.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2046.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_3.11344 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_575 = load i64, ptr @35, align 8
  %22 = icmp slt i64 %param_3.11344, %constant_770_575
  %23 = zext i1 %22 to i8
  %param_3.11346 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_307 = load i64, ptr @34, align 8
  %24 = add i64 %param_3.11346, %constant_769_307
  %param_3.11348 = load i64, ptr %arg3, align 8, !invariant.load !191
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_3.11348
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.56.8.start_idx0 = select i1 %29, i64 191, i64 %28
  %constant_770_579 = load i64, ptr @35, align 8
  %30 = icmp sge i64 0, %constant_770_579
  %31 = select i1 %30, i64 0, i64 %constant_770_579
  %32 = icmp sle i64 0, %31
  %dynamic-slice.56.8.start_idx1 = select i1 %32, i64 0, i64 %31
  %constant_770_5710 = load i64, ptr @35, align 8
  %33 = icmp sge i64 0, %constant_770_5710
  %34 = select i1 %33, i64 0, i64 %constant_770_5710
  %35 = icmp sle i64 0, %34
  %dynamic-slice.56.8.start_idx2 = select i1 %35, i64 0, i64 %34
  %36 = add i64 %dynamic-slice.56.8.start_idx0, 0
  %37 = add i64 %dynamic-slice.56.8.start_idx1, %17
  %38 = add i64 %dynamic-slice.56.8.start_idx2, 0
  %param_2.1301 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr %arg2, i64 0, i64 %36, i64 %37, i64 0
  %param_2.130111 = load double, ptr %param_2.1301, align 8, !invariant.load !191
  %39 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1560 = getelementptr inbounds double, ptr %39, i64 0
  %param_1.156012 = load double, ptr %param_1.1560, align 8, !invariant.load !191
  %subtract.146.9 = fsub double %param_2.130111, %param_1.156012
  %40 = icmp sge i64 0, %26
  %41 = select i1 %40, i64 0, i64 %26
  %42 = icmp sle i64 191, %41
  %dynamic-slice.55.11.start_idx0 = select i1 %42, i64 191, i64 %41
  %43 = add i64 %dynamic-slice.55.11.start_idx0, 0
  %param_4.923 = getelementptr inbounds [192 x i32], ptr %arg4, i64 0, i64 %43
  %param_4.92313 = load i32, ptr %param_4.923, align 4, !invariant.load !191
  %44 = sitofp i32 %param_4.92313 to double
  %multiply.3515.7 = fmul double %subtract.146.9, %44
  %45 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3515.7, ptr %45, align 8
  br label %dynamic-update-slice.2046.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_80(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1351 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_50 = load i64, ptr @38, align 8
  %0 = icmp slt i64 %param_2.1351, %constant_770_50
  %1 = zext i1 %0 to i8
  %param_2.13511 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_26 = load i64, ptr @37, align 8
  %2 = add i64 %param_2.13511, %constant_769_26
  %param_2.13512 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13512
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_503 = load i64, ptr @38, align 8
  %9 = icmp sge i64 0, %constant_770_503
  %10 = select i1 %9, i64 0, i64 %constant_770_503
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2043.1.in_bounds-true, label %dynamic-update-slice.2043.1.in_bounds-after

dynamic-update-slice.2043.1.in_bounds-after:      ; preds = %dynamic-update-slice.2043.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2043.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_772_4 = load double, ptr @36, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1553 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15534 = load double, ptr %param_1.1553, align 8, !invariant.load !191
  %subtract.145.7 = fsub double %constant_772_4, %param_1.15534
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %subtract.145.7, ptr %23, align 8
  br label %dynamic-update-slice.2043.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_76(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %param_1.1562 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_59 = load i64, ptr @41, align 8
  %0 = icmp slt i64 %param_1.1562, %constant_770_59
  %1 = zext i1 %0 to i8
  %param_1.15621 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_31 = load i64, ptr @40, align 8
  %2 = add i64 %param_1.15621, %constant_769_31
  %param_1.15622 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15622
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_593 = load i64, ptr @41, align 8
  %9 = icmp sge i64 0, %constant_770_593
  %10 = select i1 %9, i64 0, i64 %constant_770_593
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2047.1.in_bounds-true, label %dynamic-update-slice.2047.1.in_bounds-after

dynamic-update-slice.2047.1.in_bounds-after:      ; preds = %dynamic-update-slice.2047.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2047.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_772_32 = load double, ptr @39, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1303 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.13034 = load double, ptr %param_2.1303, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.13035 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.13036 = load double, ptr %param_2.13035, align 8, !invariant.load !191
  %multiply.3541.8 = fmul double %param_2.13034, %param_2.13036
  %divide.871.3 = fdiv double %constant_772_32, %multiply.3541.8
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.871.3, ptr %24, align 8
  br label %dynamic-update-slice.2047.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_67(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.1143 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_77 = load i64, ptr @43, align 8
  %0 = icmp slt i64 %param_3.1143, %constant_770_77
  %1 = zext i1 %0 to i8
  %param_3.11431 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_41 = load i64, ptr @42, align 8
  %2 = add i64 %param_3.11431, %constant_769_41
  %param_3.11432 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11432
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_773 = load i64, ptr @43, align 8
  %9 = icmp sge i64 0, %constant_770_773
  %10 = select i1 %9, i64 0, i64 %constant_770_773
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2057.1.in_bounds-true, label %dynamic-update-slice.2057.1.in_bounds-after

dynamic-update-slice.2057.1.in_bounds-after:      ; preds = %dynamic-update-slice.2057.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2057.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1321 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.13214 = load double, ptr %param_2.1321, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1580 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.15805 = load double, ptr %param_1.1580, align 8, !invariant.load !191
  %multiply.3501.7 = fmul double %param_2.13214, %param_1.15805
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3501.7, ptr %24, align 8
  br label %dynamic-update-slice.2057.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_83(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 16 dereferenceable(160) %arg6) {
entry:
  %param_1.1545 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_42 = load i64, ptr @46, align 8
  %0 = icmp slt i64 %param_1.1545, %constant_770_42
  %1 = zext i1 %0 to i8
  %param_1.15451 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_22 = load i64, ptr @45, align 8
  %2 = add i64 %param_1.15451, %constant_769_22
  %param_1.15452 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15452
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_423 = load i64, ptr @46, align 8
  %9 = icmp sge i64 0, %constant_770_423
  %10 = select i1 %9, i64 0, i64 %constant_770_423
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2040.1.in_bounds-true, label %dynamic-update-slice.2040.1.in_bounds-after

dynamic-update-slice.2040.1.in_bounds-after:      ; preds = %dynamic-update-slice.2040.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2040.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_3.1121 = getelementptr inbounds [1 x double], ptr %arg3, i64 0, i64 0
  %param_3.11214 = load double, ptr %param_3.1121, align 8, !invariant.load !191
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.951 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.9515 = load double, ptr %param_4.951, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.607 = getelementptr inbounds double, ptr %23, i64 0
  %param_6.6076 = load double, ptr %param_6.607, align 8, !invariant.load !191
  %24 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.837 = getelementptr inbounds double, ptr %24, i64 0
  %param_5.8377 = load double, ptr %param_5.837, align 8, !invariant.load !191
  %multiply.3502.23 = fmul double %param_6.6076, %param_5.8377
  %add.1033.21 = fadd double %param_4.9515, %multiply.3502.23
  %25 = call double @__nv_exp(double %add.1033.21)
  %multiply.3503.33 = fmul double %param_3.11214, %25
  %constant_774_10 = load double, ptr @44, align 8
  %compare.375.15 = fcmp ogt double %multiply.3503.33, %constant_774_10
  %26 = zext i1 %compare.375.15 to i8
  %27 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1286 = getelementptr inbounds double, ptr %27, i64 0
  %param_2.12868 = load double, ptr %param_2.1286, align 8, !invariant.load !191
  %28 = trunc i8 %26 to i1
  %29 = select i1 %28, double %multiply.3503.33, double %param_2.12868
  %30 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %29, ptr %30, align 8
  br label %dynamic-update-slice.2040.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_86(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4) {
entry:
  %param_1.1539 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_36 = load i64, ptr @48, align 8
  %0 = icmp slt i64 %param_1.1539, %constant_770_36
  %1 = zext i1 %0 to i8
  %param_1.15391 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_19 = load i64, ptr @47, align 8
  %2 = add i64 %param_1.15391, %constant_769_19
  %param_1.15392 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15392
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_363 = load i64, ptr @48, align 8
  %9 = icmp sge i64 0, %constant_770_363
  %10 = select i1 %9, i64 0, i64 %constant_770_363
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2037.1.in_bounds-true, label %dynamic-update-slice.2037.1.in_bounds-after

dynamic-update-slice.2037.1.in_bounds-after:      ; preds = %dynamic-update-slice.2037.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2037.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1280 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.12804 = load double, ptr %param_2.1280, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.911 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.9115 = load double, ptr %param_4.911, align 8, !invariant.load !191
  %24 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1116 = getelementptr inbounds double, ptr %24, i64 0
  %param_3.11166 = load double, ptr %param_3.1116, align 8, !invariant.load !191
  %multiply.3502.11 = fmul double %param_4.9115, %param_3.11166
  %add.1033.9 = fadd double %param_2.12804, %multiply.3502.11
  %25 = call double @__nv_exp(double %add.1033.9)
  %26 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %25, ptr %26, align 8
  br label %dynamic-update-slice.2037.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_44(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1385 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_61 = load i64, ptr @51, align 8
  %0 = icmp slt i64 %param_2.1385, %constant_770_61
  %1 = zext i1 %0 to i8
  %param_2.13851 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_73 = load i64, ptr @50, align 8
  %2 = add i64 %param_2.13851, %constant_769_73
  %param_2.13852 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13852
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_613 = load i64, ptr @51, align 8
  %9 = icmp sge i64 0, %constant_770_613
  %10 = select i1 %9, i64 0, i64 %constant_770_613
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2081.1.in_bounds-true, label %dynamic-update-slice.2081.1.in_bounds-after

dynamic-update-slice.2081.1.in_bounds-after:      ; preds = %dynamic-update-slice.2081.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2081.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1623 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.16234 = load double, ptr %param_1.1623, align 8, !invariant.load !191
  %multiply.3533.9 = fmul double %param_1.16234, %param_1.16234
  %constant_782_5 = load double, ptr @49, align 8
  %multiply.3534.7 = fmul double %multiply.3533.9, %constant_782_5
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3534.7, ptr %23, align 8
  br label %dynamic-update-slice.2081.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_45(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1377 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_54 = load i64, ptr @54, align 8
  %0 = icmp slt i64 %param_2.1377, %constant_770_54
  %1 = zext i1 %0 to i8
  %param_2.13771 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_72 = load i64, ptr @53, align 8
  %2 = add i64 %param_2.13771, %constant_769_72
  %param_2.13772 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13772
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_543 = load i64, ptr @54, align 8
  %9 = icmp sge i64 0, %constant_770_543
  %10 = select i1 %9, i64 0, i64 %constant_770_543
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2080.1.in_bounds-true, label %dynamic-update-slice.2080.1.in_bounds-after

dynamic-update-slice.2080.1.in_bounds-after:      ; preds = %dynamic-update-slice.2080.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2080.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1621 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.16214 = load double, ptr %param_1.1621, align 8, !invariant.load !191
  %constant_779_12 = load double, ptr @52, align 8
  %multiply.3587.3 = fmul double %param_1.16214, %constant_779_12
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3587.3, ptr %23, align 8
  br label %dynamic-update-slice.2080.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_102(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1275 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_31 = load i64, ptr @56, align 8
  %0 = icmp slt i64 %param_2.1275, %constant_770_31
  %1 = zext i1 %0 to i8
  %param_2.12751 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_61 = load i64, ptr @55, align 8
  %2 = add i64 %param_2.12751, %constant_769_61
  %param_2.12752 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12752
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_313 = load i64, ptr @56, align 8
  %9 = icmp sge i64 0, %constant_770_313
  %10 = select i1 %9, i64 0, i64 %constant_770_313
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2074.1.in_bounds-true, label %dynamic-update-slice.2074.1.in_bounds-after

dynamic-update-slice.2074.1.in_bounds-after:      ; preds = %dynamic-update-slice.2074.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2074.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_1.1534 = getelementptr inbounds [1 x double], ptr %arg1, i64 0, i64 0
  %param_1.15344 = load double, ptr %param_1.1534, align 8, !invariant.load !191
  %22 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.15344, ptr %22, align 8
  br label %dynamic-update-slice.2074.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_54(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1249 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_4 = load i64, ptr @58, align 8
  %0 = icmp slt i64 %param_2.1249, %constant_770_4
  %1 = zext i1 %0 to i8
  %param_2.12491 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_56 = load i64, ptr @57, align 8
  %2 = add i64 %param_2.12491, %constant_769_56
  %param_2.12492 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12492
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_43 = load i64, ptr @58, align 8
  %9 = icmp sge i64 0, %constant_770_43
  %10 = select i1 %9, i64 0, i64 %constant_770_43
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2070.1.in_bounds-true, label %dynamic-update-slice.2070.1.in_bounds-after

dynamic-update-slice.2070.1.in_bounds-after:      ; preds = %dynamic-update-slice.2070.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2070.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1508 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.15084 = load i64, ptr %param_1.1508, align 8, !invariant.load !191
  %23 = sitofp i64 %param_1.15084 to double
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.2070.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_60(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1338 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_94 = load i64, ptr @60, align 8
  %0 = icmp slt i64 %param_2.1338, %constant_770_94
  %1 = zext i1 %0 to i8
  %param_2.13381 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_50 = load i64, ptr @59, align 8
  %2 = add i64 %param_2.13381, %constant_769_50
  %param_2.13382 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13382
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_943 = load i64, ptr @60, align 8
  %9 = icmp sge i64 0, %constant_770_943
  %10 = select i1 %9, i64 0, i64 %constant_770_943
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2064.1.in_bounds-true, label %dynamic-update-slice.2064.1.in_bounds-after

dynamic-update-slice.2064.1.in_bounds-after:      ; preds = %dynamic-update-slice.2064.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2064.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1597 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15974 = load double, ptr %param_1.1597, align 8, !invariant.load !191
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.15974, ptr %23, align 8
  br label %dynamic-update-slice.2064.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_88(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1276 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_32 = load i64, ptr @62, align 8
  %0 = icmp slt i64 %param_2.1276, %constant_770_32
  %1 = zext i1 %0 to i8
  %param_2.12761 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_17 = load i64, ptr @61, align 8
  %2 = add i64 %param_2.12761, %constant_769_17
  %param_2.12762 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12762
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_323 = load i64, ptr @62, align 8
  %9 = icmp sge i64 0, %constant_770_323
  %10 = select i1 %9, i64 0, i64 %constant_770_323
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2035.1.in_bounds-true, label %dynamic-update-slice.2035.1.in_bounds-after

dynamic-update-slice.2035.1.in_bounds-after:      ; preds = %dynamic-update-slice.2035.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2035.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1535 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15354 = load double, ptr %param_1.1535, align 8, !invariant.load !191
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.15354, ptr %23, align 8
  br label %dynamic-update-slice.2035.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_91(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_1.1527 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_24 = load i64, ptr @65, align 8
  %0 = icmp slt i64 %param_1.1527, %constant_770_24
  %1 = zext i1 %0 to i8
  %param_1.15271 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_13 = load i64, ptr @64, align 8
  %2 = add i64 %param_1.15271, %constant_769_13
  %param_1.15272 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15272
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_243 = load i64, ptr @65, align 8
  %9 = icmp sge i64 0, %constant_770_243
  %10 = select i1 %9, i64 0, i64 %constant_770_243
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2032.1.in_bounds-true, label %dynamic-update-slice.2032.1.in_bounds-after

dynamic-update-slice.2032.1.in_bounds-after:      ; preds = %dynamic-update-slice.2032.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2032.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_4.906 = getelementptr inbounds [1 x double], ptr %arg4, i64 0, i64 0
  %param_4.9064 = load double, ptr %param_4.906, align 8, !invariant.load !191
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1111 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.11115 = load double, ptr %param_3.1111, align 8, !invariant.load !191
  %23 = call double @__nv_exp(double %param_3.11115)
  %multiply.3524.57 = fmul double %param_4.9064, %23
  %constant_774_25 = load double, ptr @63, align 8
  %compare.377.27 = fcmp ogt double %multiply.3524.57, %constant_774_25
  %24 = zext i1 %compare.377.27 to i8
  %25 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1268 = getelementptr inbounds double, ptr %25, i64 0
  %param_2.12686 = load double, ptr %param_2.1268, align 8, !invariant.load !191
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, double %multiply.3524.57, double %param_2.12686
  %28 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %27, ptr %28, align 8
  br label %dynamic-update-slice.2032.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_94(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1262 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_18 = load i64, ptr @67, align 8
  %0 = icmp slt i64 %param_2.1262, %constant_770_18
  %1 = zext i1 %0 to i8
  %param_2.12621 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_10 = load i64, ptr @66, align 8
  %2 = add i64 %param_2.12621, %constant_769_10
  %param_2.12622 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12622
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_183 = load i64, ptr @67, align 8
  %9 = icmp sge i64 0, %constant_770_183
  %10 = select i1 %9, i64 0, i64 %constant_770_183
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2029.1.in_bounds-true, label %dynamic-update-slice.2029.1.in_bounds-after

dynamic-update-slice.2029.1.in_bounds-after:      ; preds = %dynamic-update-slice.2029.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2029.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1521 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15214 = load double, ptr %param_1.1521, align 8, !invariant.load !191
  %23 = call double @__nv_exp(double %param_1.15214)
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.2029.1.in_bounds-after
}

define void @loop_add_divide_exponential_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_divide_exponential_fusion.in_bounds-true, label %loop_add_divide_exponential_fusion.in_bounds-after

loop_add_divide_exponential_fusion.in_bounds-after: ; preds = %loop_add_divide_exponential_fusion.in_bounds-true, %entry
  ret void

loop_add_divide_exponential_fusion.in_bounds-true: ; preds = %entry
  %constant_49_5 = load double, ptr @68, align 8
  %5 = getelementptr double, ptr %arg1, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !191
  %divide.850.1.clone.1 = fdiv double %constant_49_5, %7
  %8 = load double, ptr %arg0, align 8, !invariant.load !191
  %9 = getelementptr double, ptr %arg2, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !191
  %12 = getelementptr double, ptr %arg4, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !191
  %15 = getelementptr double, ptr %arg3, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !191
  %multiply.3478.5.clone.1 = fmul double %14, %17
  %add.1023.3.clone.1 = fadd double %11, %multiply.3478.5.clone.1
  %18 = call double @__nv_exp(double %add.1023.3.clone.1)
  %multiply.3479.1.clone.1 = fmul double %8, %18
  %add.1024.1.clone.1 = fadd double %divide.850.1.clone.1, %multiply.3479.1.clone.1
  %multiply.3481.2 = fmul double %add.1024.1.clone.1, %add.1024.1.clone.1
  %divide.853.1 = fdiv double %constant_49_5, %multiply.3481.2
  %19 = insertvalue { double, double, double, double, double } undef, double %divide.853.1, 0
  %divide.851.1.clone.1 = fdiv double %constant_49_5, %add.1024.1.clone.1
  %20 = insertvalue { double, double, double, double, double } %19, double %divide.851.1.clone.1, 1
  %21 = insertvalue { double, double, double, double, double } %20, double %add.1024.1.clone.1, 2
  %22 = insertvalue { double, double, double, double, double } %21, double %18, 3
  %23 = getelementptr double, ptr %arg1, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !191
  %26 = getelementptr double, ptr %arg1, i32 %linear_index
  %27 = getelementptr inbounds double, ptr %26, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !191
  %multiply.3480.2.clone.1 = fmul double %25, %28
  %divide.852.1.clone.1 = fdiv double %constant_49_5, %multiply.3480.2.clone.1
  %29 = insertvalue { double, double, double, double, double } %22, double %divide.852.1.clone.1, 4
  %30 = extractvalue { double, double, double, double, double } %29, 0
  %31 = getelementptr double, ptr %arg5, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  store double %30, ptr %32, align 8
  %33 = extractvalue { double, double, double, double, double } %29, 1
  %34 = getelementptr double, ptr %arg6, i32 %linear_index
  %35 = getelementptr inbounds double, ptr %34, i32 0
  store double %33, ptr %35, align 8
  %36 = extractvalue { double, double, double, double, double } %29, 2
  %37 = getelementptr double, ptr %arg7, i32 %linear_index
  %38 = getelementptr inbounds double, ptr %37, i32 0
  store double %36, ptr %38, align 8
  %39 = extractvalue { double, double, double, double, double } %29, 3
  %40 = getelementptr double, ptr %arg8, i32 %linear_index
  %41 = getelementptr inbounds double, ptr %40, i32 0
  store double %39, ptr %41, align 8
  %42 = extractvalue { double, double, double, double, double } %29, 4
  %43 = getelementptr double, ptr %arg9, i32 %linear_index
  %44 = getelementptr inbounds double, ptr %43, i32 0
  store double %42, ptr %44, align 8
  br label %loop_add_divide_exponential_fusion.in_bounds-after
}

define void @loop_multiply_fusion(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(19200) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 16 dereferenceable(19200) %arg7, ptr noalias align 128 dereferenceable(19200) %arg8, ptr noalias align 16 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(19200) %arg10, ptr noalias align 128 dereferenceable(19200) %arg11, ptr noalias align 128 dereferenceable(19200) %arg12, ptr noalias align 128 dereferenceable(19200) %arg13) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 2400
  br i1 %6, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %7 = getelementptr double, ptr %arg3, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !191
  %10 = fneg double %9
  %11 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %4
  %12 = load double, ptr %11, align 8, !invariant.load !191
  %multiply.3482.7 = fmul double %10, %12
  %13 = load double, ptr %arg1, align 8, !invariant.load !191
  %14 = getelementptr double, ptr %arg7, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !191
  %17 = getelementptr inbounds [20 x [1 x double]], ptr %arg9, i32 0, i32 %4, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !191
  %19 = getelementptr double, ptr %arg8, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  %21 = load double, ptr %20, align 8, !invariant.load !191
  %multiply.3483.5.clone.1 = fmul double %18, %21
  %add.1025.3.clone.1 = fadd double %16, %multiply.3483.5.clone.1
  %22 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %4
  %23 = load double, ptr %22, align 8, !invariant.load !191
  %multiply.3484.1.clone.1 = fmul double %add.1025.3.clone.1, %23
  %multiply.3485.5 = fmul double %13, %multiply.3484.1.clone.1
  %add.1026.5 = fadd double %multiply.3482.7, %multiply.3485.5
  %24 = fneg double %add.1026.5
  %25 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %4
  %26 = load double, ptr %25, align 8, !invariant.load !191
  %multiply.3486.1 = fmul double %24, %26
  %27 = insertvalue { double, double, double, double } undef, double %multiply.3486.1, 0
  %28 = getelementptr double, ptr %arg3, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  %30 = load double, ptr %29, align 8, !invariant.load !191
  %constant_49_6_clone_1 = load double, ptr @70, align 8
  %31 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %4
  %32 = load double, ptr %31, align 8, !invariant.load !191
  %33 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %4
  %34 = load double, ptr %33, align 8, !invariant.load !191
  %35 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %4
  %36 = load double, ptr %35, align 8, !invariant.load !191
  %multiply.3480.6.clone.1 = fmul double %34, %36
  %multiply.3487.5.clone.1 = fmul double %32, %multiply.3480.6.clone.1
  %divide.854.3.clone.1 = fdiv double %constant_49_6_clone_1, %multiply.3487.5.clone.1
  %constant_55_2_clone_1 = load double, ptr @69, align 8
  %multiply.3488.3.clone.1 = fmul double %divide.854.3.clone.1, %constant_55_2_clone_1
  %multiply.3489.1.clone.1 = fmul double %30, %multiply.3488.3.clone.1
  %37 = insertvalue { double, double, double, double } %27, double %multiply.3489.1.clone.1, 1
  %38 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %4
  %39 = load double, ptr %38, align 8, !invariant.load !191
  %40 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %4
  %41 = load double, ptr %40, align 8, !invariant.load !191
  %42 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %4
  %43 = load double, ptr %42, align 8, !invariant.load !191
  %multiply.3481.6.clone.1 = fmul double %41, %43
  %multiply.3490.5.clone.1 = fmul double %39, %multiply.3481.6.clone.1
  %divide.855.3.clone.1 = fdiv double %constant_49_6_clone_1, %multiply.3490.5.clone.1
  %multiply.3491.3.clone.1 = fmul double %divide.855.3.clone.1, %constant_55_2_clone_1
  %multiply.3492.1.clone.1 = fmul double %add.1026.5, %multiply.3491.3.clone.1
  %44 = insertvalue { double, double, double, double } %37, double %multiply.3492.1.clone.1, 2
  %45 = insertvalue { double, double, double, double } %44, double %multiply.3484.1.clone.1, 3
  %46 = extractvalue { double, double, double, double } %45, 0
  %47 = getelementptr double, ptr %arg10, i32 %linear_index
  %48 = getelementptr inbounds double, ptr %47, i32 0
  store double %46, ptr %48, align 8
  %49 = extractvalue { double, double, double, double } %45, 1
  %50 = getelementptr double, ptr %arg11, i32 %linear_index
  %51 = getelementptr inbounds double, ptr %50, i32 0
  store double %49, ptr %51, align 8
  %52 = extractvalue { double, double, double, double } %45, 2
  %53 = getelementptr double, ptr %arg12, i32 %linear_index
  %54 = getelementptr inbounds double, ptr %53, i32 0
  store double %52, ptr %54, align 8
  %55 = extractvalue { double, double, double, double } %45, 3
  %56 = getelementptr double, ptr %arg13, i32 %linear_index
  %57 = getelementptr inbounds double, ptr %56, i32 0
  store double %55, ptr %57, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

define void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(20) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %constant_737_1 = load i8, ptr @71, align 1
  %5 = getelementptr i8, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds i8, ptr %5, i32 0
  store i8 %constant_737_1, ptr %6, align 1
  br label %loop_broadcast_fusion.in_bounds-after
}

define void @wrapped_convert(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !195
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
  %4 = load i32, ptr %arg0, align 4, !invariant.load !191
  %5 = sitofp i32 %4 to double
  store double %5, ptr %arg1, align 8
  br label %wrapped_convert.in_bounds-after
}

define void @loop_broadcast_fusion_1(ptr noalias align 128 dereferenceable(160) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_broadcast_fusion.1.in_bounds-true, label %loop_broadcast_fusion.1.in_bounds-after

loop_broadcast_fusion.1.in_bounds-after:          ; preds = %loop_broadcast_fusion.1.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.1.in_bounds-true:           ; preds = %entry
  %constant_806_2 = load double, ptr @72, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_806_2, ptr %6, align 8
  br label %loop_broadcast_fusion.1.in_bounds-after
}

define void @loop_compare_multiply_select_fusion(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(20) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_compare_multiply_select_fusion.in_bounds-true, label %loop_compare_multiply_select_fusion.in_bounds-after

loop_compare_multiply_select_fusion.in_bounds-after: ; preds = %loop_compare_multiply_select_fusion.in_bounds-true, %entry
  ret void

loop_compare_multiply_select_fusion.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !191
  %8 = getelementptr double, ptr %arg3, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !191
  %11 = getelementptr double, ptr %arg3, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !191
  %multiply.3493.6.clone.1 = fmul double %10, %13
  %14 = getelementptr double, ptr %arg2, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !191
  %multiply.3494.9.clone.1 = fmul double %multiply.3493.6.clone.1, %16
  %17 = load double, ptr %arg1, align 8, !invariant.load !191
  %multiply.3495.7.clone.1 = fmul double %multiply.3494.9.clone.1, %17
  %add.1027.5.clone.1 = fadd double %7, %multiply.3495.7.clone.1
  %constant_60_1_clone_1 = load double, ptr @73, align 8
  %compare.372.1.clone.1 = fcmp ogt double %add.1027.5.clone.1, %constant_60_1_clone_1
  %18 = zext i1 %compare.372.1.clone.1 to i8
  %constant_61_1 = load double, ptr @74, align 8
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

define void @loop_broadcast_select_fusion(ptr noalias align 128 dereferenceable(19200) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(20) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(19200) %arg5, ptr noalias align 128 dereferenceable(19200) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 2400
  br i1 %6, label %loop_broadcast_select_fusion.in_bounds-true, label %loop_broadcast_select_fusion.in_bounds-after

loop_broadcast_select_fusion.in_bounds-after:     ; preds = %loop_broadcast_select_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_select_fusion.in_bounds-true:      ; preds = %entry
  %7 = getelementptr inbounds [20 x i8], ptr %arg3, i32 0, i32 %4
  %8 = load i8, ptr %7, align 1, !invariant.load !191
  %9 = getelementptr double, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !191
  %12 = getelementptr inbounds [20 x [1 x double]], ptr %arg4, i32 0, i32 %4, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !191
  %14 = getelementptr inbounds [20 x [1 x double]], ptr %arg4, i32 0, i32 %4, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !191
  %multiply.3493.2 = fmul double %13, %15
  %16 = getelementptr double, ptr %arg1, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !191
  %multiply.3496.7 = fmul double %multiply.3493.2, %18
  %19 = load double, ptr %arg2, align 8, !invariant.load !191
  %multiply.3497.5 = fmul double %multiply.3496.7, %19
  %add.1028.3 = fadd double %11, %multiply.3497.5
  %constant_806_1_clone_1 = load double, ptr @75, align 8
  %20 = trunc i8 %8 to i1
  %21 = select i1 %20, double %add.1028.3, double %constant_806_1_clone_1
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

define void @loop_dynamic_update_slice_fusion_74(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.873 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_2 = load i64, ptr @77, align 8
  %0 = icmp slt i64 %param_2.873, %constant_770_2
  %1 = zext i1 %0 to i8
  %param_2.8731 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_34 = load i64, ptr @76, align 8
  %2 = add i64 %param_2.8731, %constant_769_34
  %param_2.8732 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.8732
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !195
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.2050.1.in_bounds-true, label %dynamic-update-slice.2050.1.in_bounds-after

dynamic-update-slice.2050.1.in_bounds-after:      ; preds = %dynamic-update-slice.2050.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2050.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %param_1.1156 = load double, ptr %arg1, align 8, !invariant.load !191
  %15 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %param_1.1156, ptr %15, align 8
  br label %dynamic-update-slice.2050.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_70(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(20) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1315 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_71 = load i64, ptr @79, align 8
  %0 = icmp slt i64 %param_2.1315, %constant_770_71
  %1 = zext i1 %0 to i8
  %param_2.13151 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_38 = load i64, ptr @78, align 8
  %2 = add i64 %param_2.13151, %constant_769_38
  %param_2.13152 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13152
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_713 = load i64, ptr @79, align 8
  %9 = icmp sge i64 0, %constant_770_713
  %10 = select i1 %9, i64 0, i64 %constant_770_713
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2054.1.in_bounds-true, label %dynamic-update-slice.2054.1.in_bounds-after

dynamic-update-slice.2054.1.in_bounds-after:      ; preds = %dynamic-update-slice.2054.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2054.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i8, ptr %arg1, i64 %linear_index
  %param_1.1574 = getelementptr inbounds i8, ptr %22, i64 0
  %param_1.15744 = load i8, ptr %param_1.1574, align 1, !invariant.load !191
  %23 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %param_1.15744, ptr %23, align 1
  br label %dynamic-update-slice.2054.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_23(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1330 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_86 = load i64, ptr @81, align 8
  %0 = icmp slt i64 %param_2.1330, %constant_770_86
  %1 = zext i1 %0 to i8
  %param_2.13301 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_98 = load i64, ptr @80, align 8
  %2 = add i64 %param_2.13301, %constant_769_98
  %param_2.13302 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13302
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_863 = load i64, ptr @81, align 8
  %9 = icmp sge i64 0, %constant_770_863
  %10 = select i1 %9, i64 0, i64 %constant_770_863
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_864 = load i64, ptr @81, align 8
  %13 = icmp sge i64 0, %constant_770_864
  %14 = select i1 %13, i64 0, i64 %constant_770_864
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2102.1.in_bounds-true, label %dynamic-update-slice.2102.1.in_bounds-after

dynamic-update-slice.2102.1.in_bounds-after:      ; preds = %dynamic-update-slice.2102.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2102.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1589 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.15895 = load double, ptr %param_1.1589, align 8, !invariant.load !191
  %30 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %param_1.15895, ptr %30, align 8
  br label %dynamic-update-slice.2102.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_18(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3) {
entry:
  %param_2.1345 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_101 = load i64, ptr @85, align 8
  %0 = icmp slt i64 %param_2.1345, %constant_770_101
  %1 = zext i1 %0 to i8
  %param_2.13451 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_103 = load i64, ptr @84, align 8
  %2 = add i64 %param_2.13451, %constant_769_103
  %param_2.13452 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13452
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_1013 = load i64, ptr @85, align 8
  %9 = icmp sge i64 0, %constant_770_1013
  %10 = select i1 %9, i64 0, i64 %constant_770_1013
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_1014 = load i64, ptr @85, align 8
  %13 = icmp sge i64 0, %constant_770_1014
  %14 = select i1 %13, i64 0, i64 %constant_770_1014
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2107.1.in_bounds-true, label %dynamic-update-slice.2107.1.in_bounds-after

dynamic-update-slice.2107.1.in_bounds-after:      ; preds = %dynamic-update-slice.2107.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2107.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1604 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.16045 = load double, ptr %param_1.1604, align 8, !invariant.load !191
  %constant_772_25 = load double, ptr @83, align 8
  %param_3.1191 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11916 = load double, ptr %param_3.1191, align 8, !invariant.load !191
  %param_3.11917 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11918 = load double, ptr %param_3.11917, align 8, !invariant.load !191
  %param_3.11919 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.119110 = load double, ptr %param_3.11919, align 8, !invariant.load !191
  %multiply.3545.6 = fmul double %param_3.11918, %param_3.119110
  %multiply.3612.5 = fmul double %param_3.11916, %multiply.3545.6
  %divide.885.3 = fdiv double %constant_772_25, %multiply.3612.5
  %constant_777_7 = load double, ptr @82, align 8
  %multiply.3613.3 = fmul double %divide.885.3, %constant_777_7
  %multiply.3614.1 = fmul double %param_1.16045, %multiply.3613.3
  %30 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3614.1, ptr %30, align 8
  br label %dynamic-update-slice.2107.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_19(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.1098 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_3 = load i64, ptr @87, align 8
  %0 = icmp slt i64 %param_3.1098, %constant_770_3
  %1 = zext i1 %0 to i8
  %param_3.10981 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_102 = load i64, ptr @86, align 8
  %2 = add i64 %param_3.10981, %constant_769_102
  %param_3.10982 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.10982
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_33 = load i64, ptr @87, align 8
  %9 = icmp sge i64 0, %constant_770_33
  %10 = select i1 %9, i64 0, i64 %constant_770_33
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_34 = load i64, ptr @87, align 8
  %13 = icmp sge i64 0, %constant_770_34
  %14 = select i1 %13, i64 0, i64 %constant_770_34
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2106.1.in_bounds-true, label %dynamic-update-slice.2106.1.in_bounds-after

dynamic-update-slice.2106.1.in_bounds-after:      ; preds = %dynamic-update-slice.2106.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2106.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_2.1248 = getelementptr inbounds [20 x [1 x double]], ptr %arg2, i64 0, i64 %21, i64 0
  %param_2.12485 = load double, ptr %param_2.1248, align 8, !invariant.load !191
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1507 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.15076 = load double, ptr %param_1.1507, align 8, !invariant.load !191
  %multiply.3543.3 = fmul double %param_2.12485, %param_1.15076
  %30 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3543.3, ptr %30, align 8
  br label %dynamic-update-slice.2106.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_27(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(19200) %arg3, ptr noalias align 16 dereferenceable(160) %arg4) {
entry:
  %param_2.1308 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_64 = load i64, ptr @89, align 8
  %0 = icmp slt i64 %param_2.1308, %constant_770_64
  %1 = zext i1 %0 to i8
  %param_2.13081 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_93 = load i64, ptr @88, align 8
  %2 = add i64 %param_2.13081, %constant_769_93
  %param_2.13082 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13082
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_643 = load i64, ptr @89, align 8
  %9 = icmp sge i64 0, %constant_770_643
  %10 = select i1 %9, i64 0, i64 %constant_770_643
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_644 = load i64, ptr @89, align 8
  %13 = icmp sge i64 0, %constant_770_644
  %14 = select i1 %13, i64 0, i64 %constant_770_644
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2098.1.in_bounds-true, label %dynamic-update-slice.2098.1.in_bounds-after

dynamic-update-slice.2098.1.in_bounds-after:      ; preds = %dynamic-update-slice.2098.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2098.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_4.927 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9275 = load double, ptr %param_4.927, align 8, !invariant.load !191
  %29 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1140 = getelementptr inbounds double, ptr %29, i64 0
  %param_3.11406 = load double, ptr %param_3.1140, align 8, !invariant.load !191
  %multiply.3504.11 = fmul double %param_4.9275, %param_3.11406
  %param_1.1567 = getelementptr inbounds [20 x double], ptr %arg1, i64 0, i64 %21
  %param_1.15677 = load double, ptr %param_1.1567, align 8, !invariant.load !191
  %multiply.3505.15 = fmul double %multiply.3504.11, %param_1.15677
  %30 = fneg double %multiply.3505.15
  %31 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %30, ptr %31, align 8
  br label %dynamic-update-slice.2098.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_26(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(19200) %arg3, ptr noalias align 16 dereferenceable(160) %arg4) {
entry:
  %param_2.1295 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_51 = load i64, ptr @91, align 8
  %0 = icmp slt i64 %param_2.1295, %constant_770_51
  %1 = zext i1 %0 to i8
  %param_2.12951 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_94 = load i64, ptr @90, align 8
  %2 = add i64 %param_2.12951, %constant_769_94
  %param_2.12952 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12952
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_513 = load i64, ptr @91, align 8
  %9 = icmp sge i64 0, %constant_770_513
  %10 = select i1 %9, i64 0, i64 %constant_770_513
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_514 = load i64, ptr @91, align 8
  %13 = icmp sge i64 0, %constant_770_514
  %14 = select i1 %13, i64 0, i64 %constant_770_514
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2099.1.in_bounds-true, label %dynamic-update-slice.2099.1.in_bounds-after

dynamic-update-slice.2099.1.in_bounds-after:      ; preds = %dynamic-update-slice.2099.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2099.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_4.920 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9205 = load double, ptr %param_4.920, align 8, !invariant.load !191
  %29 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1129 = getelementptr inbounds double, ptr %29, i64 0
  %param_3.11296 = load double, ptr %param_3.1129, align 8, !invariant.load !191
  %multiply.3504.5 = fmul double %param_4.9205, %param_3.11296
  %param_1.1554 = getelementptr inbounds [20 x double], ptr %arg1, i64 0, i64 %21
  %param_1.15547 = load double, ptr %param_1.1554, align 8, !invariant.load !191
  %multiply.3505.9 = fmul double %multiply.3504.5, %param_1.15547
  %30 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3505.9, ptr %30, align 8
  br label %dynamic-update-slice.2099.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_25(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(19200) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(768) %arg5) {
entry:
  %param_2.1263 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_19 = load i64, ptr @93, align 8
  %0 = icmp slt i64 %param_2.1263, %constant_770_19
  %1 = zext i1 %0 to i8
  %param_2.12631 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_96 = load i64, ptr @92, align 8
  %2 = add i64 %param_2.12631, %constant_769_96
  %param_2.12632 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12632
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_193 = load i64, ptr @93, align 8
  %9 = icmp sge i64 0, %constant_770_193
  %10 = select i1 %9, i64 0, i64 %constant_770_193
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_194 = load i64, ptr @93, align 8
  %13 = icmp sge i64 0, %constant_770_194
  %14 = select i1 %13, i64 0, i64 %constant_770_194
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2100.1.in_bounds-true, label %dynamic-update-slice.2100.1.in_bounds-after

dynamic-update-slice.2100.1.in_bounds-after:      ; preds = %dynamic-update-slice.2100.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2100.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_4.902 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9025 = load double, ptr %param_4.902, align 8, !invariant.load !191
  %29 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1107 = getelementptr inbounds double, ptr %29, i64 0
  %param_3.11076 = load double, ptr %param_3.1107, align 8, !invariant.load !191
  %multiply.3504.23 = fmul double %param_4.9025, %param_3.11076
  %param_1.1522 = getelementptr inbounds [20 x double], ptr %arg1, i64 0, i64 %21
  %param_1.15227 = load double, ptr %param_1.1522, align 8, !invariant.load !191
  %multiply.3505.21 = fmul double %multiply.3504.23, %param_1.15227
  %30 = fneg double %multiply.3505.21
  %param_2.12638 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_199 = load i64, ptr @93, align 8
  %31 = icmp slt i64 %param_2.12638, %constant_770_199
  %32 = zext i1 %31 to i8
  %param_2.126310 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_9611 = load i64, ptr @92, align 8
  %33 = add i64 %param_2.126310, %constant_769_9611
  %param_2.126312 = load i64, ptr %arg2, align 8, !invariant.load !191
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, i64 %33, i64 %param_2.126312
  %36 = icmp sge i64 0, %35
  %37 = select i1 %36, i64 0, i64 %35
  %38 = icmp sle i64 191, %37
  %dynamic-slice.55.17.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.55.17.start_idx0, 0
  %param_5.799 = getelementptr inbounds [192 x i32], ptr %arg5, i64 0, i64 %39
  %param_5.79913 = load i32, ptr %param_5.799, align 4, !invariant.load !191
  %40 = sitofp i32 %param_5.79913 to double
  %multiply.3539.3 = fmul double %30, %40
  %41 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3539.3, ptr %41, align 8
  br label %dynamic-update-slice.2100.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_29(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(19200) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 16 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 16 dereferenceable(160) %arg9, ptr noalias align 16 dereferenceable(19200) %arg10, ptr noalias align 128 dereferenceable(19200) %arg11) {
entry:
  %param_3.1152 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_95 = load i64, ptr @99, align 8
  %0 = icmp slt i64 %param_3.1152, %constant_770_95
  %1 = zext i1 %0 to i8
  %param_3.11521 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_91 = load i64, ptr @98, align 8
  %2 = add i64 %param_3.11521, %constant_769_91
  %param_3.11522 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11522
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_953 = load i64, ptr @99, align 8
  %9 = icmp sge i64 0, %constant_770_953
  %10 = select i1 %9, i64 0, i64 %constant_770_953
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_954 = load i64, ptr @99, align 8
  %13 = icmp sge i64 0, %constant_770_954
  %14 = select i1 %13, i64 0, i64 %constant_770_954
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2096.1.in_bounds-true, label %dynamic-update-slice.2096.1.in_bounds-after

dynamic-update-slice.2096.1.in_bounds-after:      ; preds = %dynamic-update-slice.2096.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2096.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1339 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.13395 = load double, ptr %param_2.1339, align 8, !invariant.load !191
  %30 = fneg double %param_2.13395
  %param_1.1598 = getelementptr inbounds [20 x double], ptr %arg1, i64 0, i64 %21
  %param_1.15986 = load double, ptr %param_1.1598, align 8, !invariant.load !191
  %multiply.3509.7 = fmul double %30, %param_1.15986
  %param_6.623 = getelementptr inbounds [1 x double], ptr %arg6, i64 0, i64 0
  %param_6.6237 = load double, ptr %param_6.623, align 8, !invariant.load !191
  %param_7.472 = getelementptr inbounds [20 x double], ptr %arg7, i64 0, i64 %21
  %param_7.4728 = load double, ptr %param_7.472, align 8, !invariant.load !191
  %param_9.296 = getelementptr inbounds [20 x [1 x double]], ptr %arg9, i64 0, i64 %21, i64 0
  %param_9.2969 = load double, ptr %param_9.296, align 8, !invariant.load !191
  %param_8.346 = getelementptr inbounds [20 x double], ptr %arg8, i64 0, i64 %21
  %param_8.34610 = load double, ptr %param_8.346, align 8, !invariant.load !191
  %multiply.3502.37 = fmul double %param_9.2969, %param_8.34610
  %add.1033.35 = fadd double %param_7.4728, %multiply.3502.37
  %31 = call double @__nv_exp(double %add.1033.35)
  %multiply.3503.49 = fmul double %param_6.6237, %31
  %constant_774_8 = load double, ptr @95, align 8
  %compare.375.29 = fcmp ogt double %multiply.3503.49, %constant_774_8
  %32 = zext i1 %compare.375.29 to i8
  %33 = getelementptr double, ptr %arg10, i64 %linear_index
  %param_10.243 = getelementptr inbounds double, ptr %33, i64 0
  %param_10.24311 = load double, ptr %param_10.243, align 8, !invariant.load !191
  %34 = getelementptr double, ptr %arg11, i64 %linear_index
  %param_11.211 = getelementptr inbounds double, ptr %34, i64 0
  %param_11.21112 = load double, ptr %param_11.211, align 8, !invariant.load !191
  %multiply.3510.17 = fmul double %param_9.2969, %param_11.21112
  %add.1036.15 = fadd double %param_10.24311, %multiply.3510.17
  %multiply.3511.13 = fmul double %add.1036.15, %31
  %multiply.3512.11 = fmul double %param_6.6237, %multiply.3511.13
  %constant_776_3 = load double, ptr @97, align 8
  %35 = trunc i8 %32 to i1
  %36 = select i1 %35, double %multiply.3512.11, double %constant_776_3
  %add.1037.3 = fadd double %multiply.3509.7, %36
  %constant_772_23 = load double, ptr @96, align 8
  %param_4.971 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.97113 = load double, ptr %param_4.971, align 8, !invariant.load !191
  %param_5.855 = getelementptr inbounds [20 x double], ptr %arg5, i64 0, i64 %21
  %param_5.85514 = load double, ptr %param_5.855, align 8, !invariant.load !191
  %37 = trunc i8 %32 to i1
  %38 = select i1 %37, double %multiply.3503.49, double %param_5.85514
  %add.1034.6 = fadd double %param_4.97113, %38
  %multiply.3513.6 = fmul double %add.1034.6, %add.1034.6
  %multiply.3606.5 = fmul double %add.1034.6, %multiply.3513.6
  %divide.883.3 = fdiv double %constant_772_23, %multiply.3606.5
  %constant_777_5 = load double, ptr @94, align 8
  %multiply.3607.3 = fmul double %divide.883.3, %constant_777_5
  %multiply.3608.1 = fmul double %add.1037.3, %multiply.3607.3
  %39 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3608.1, ptr %39, align 8
  br label %dynamic-update-slice.2096.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_32(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(19200) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 16 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %param_4.916 = load i64, ptr %arg4, align 8, !invariant.load !191
  %constant_770_43 = load i64, ptr @101, align 8
  %0 = icmp slt i64 %param_4.916, %constant_770_43
  %1 = zext i1 %0 to i8
  %param_4.9161 = load i64, ptr %arg4, align 8, !invariant.load !191
  %constant_769_87 = load i64, ptr @100, align 8
  %2 = add i64 %param_4.9161, %constant_769_87
  %param_4.9162 = load i64, ptr %arg4, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.9162
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_433 = load i64, ptr @101, align 8
  %9 = icmp sge i64 0, %constant_770_433
  %10 = select i1 %9, i64 0, i64 %constant_770_433
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_434 = load i64, ptr @101, align 8
  %13 = icmp sge i64 0, %constant_770_434
  %14 = select i1 %13, i64 0, i64 %constant_770_434
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2093.1.in_bounds-true, label %dynamic-update-slice.2093.1.in_bounds-after

dynamic-update-slice.2093.1.in_bounds-after:      ; preds = %dynamic-update-slice.2093.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2093.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1546 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.15465 = load double, ptr %param_1.1546, align 8, !invariant.load !191
  %param_3.1122 = getelementptr inbounds [20 x [1 x double]], ptr %arg3, i64 0, i64 %21, i64 0
  %param_3.11226 = load double, ptr %param_3.1122, align 8, !invariant.load !191
  %30 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1287 = getelementptr inbounds double, ptr %30, i64 0
  %param_2.12877 = load double, ptr %param_2.1287, align 8, !invariant.load !191
  %multiply.3510.7 = fmul double %param_3.11226, %param_2.12877
  %add.1036.5 = fadd double %param_1.15465, %multiply.3510.7
  %param_5.810 = getelementptr inbounds [20 x double], ptr %arg5, i64 0, i64 %21
  %param_5.8108 = load double, ptr %param_5.810, align 8, !invariant.load !191
  %param_6.586 = getelementptr inbounds [20 x double], ptr %arg6, i64 0, i64 %21
  %param_6.5869 = load double, ptr %param_6.586, align 8, !invariant.load !191
  %multiply.3502.15 = fmul double %param_3.11226, %param_6.5869
  %add.1033.13 = fadd double %param_5.8108, %multiply.3502.15
  %31 = call double @__nv_exp(double %add.1033.13)
  %multiply.3511.3 = fmul double %add.1036.5, %31
  %32 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3511.3, ptr %32, align 8
  br label %dynamic-update-slice.2093.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_30(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(19200) %arg2, ptr noalias align 128 dereferenceable(19200) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7) {
entry:
  %param_1.1514 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_11 = load i64, ptr @105, align 8
  %0 = icmp slt i64 %param_1.1514, %constant_770_11
  %1 = zext i1 %0 to i8
  %param_1.15141 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_89 = load i64, ptr @104, align 8
  %2 = add i64 %param_1.15141, %constant_769_89
  %param_1.15142 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15142
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_113 = load i64, ptr @105, align 8
  %9 = icmp sge i64 0, %constant_770_113
  %10 = select i1 %9, i64 0, i64 %constant_770_113
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_114 = load i64, ptr @105, align 8
  %13 = icmp sge i64 0, %constant_770_114
  %14 = select i1 %13, i64 0, i64 %constant_770_114
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2095.1.in_bounds-true, label %dynamic-update-slice.2095.1.in_bounds-after

dynamic-update-slice.2095.1.in_bounds-after:      ; preds = %dynamic-update-slice.2095.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2095.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_5.854 = getelementptr inbounds [1 x double], ptr %arg5, i64 0, i64 0
  %param_5.8545 = load double, ptr %param_5.854, align 8, !invariant.load !191
  %param_6.622 = getelementptr inbounds [20 x double], ptr %arg6, i64 0, i64 %21
  %param_6.6226 = load double, ptr %param_6.622, align 8, !invariant.load !191
  %param_4.970 = getelementptr inbounds [20 x [1 x double]], ptr %arg4, i64 0, i64 %21, i64 0
  %param_4.9707 = load double, ptr %param_4.970, align 8, !invariant.load !191
  %param_7.470 = getelementptr inbounds [20 x double], ptr %arg7, i64 0, i64 %21
  %param_7.4708 = load double, ptr %param_7.470, align 8, !invariant.load !191
  %multiply.3502.35 = fmul double %param_4.9707, %param_7.4708
  %add.1033.33 = fadd double %param_6.6226, %multiply.3502.35
  %29 = call double @__nv_exp(double %add.1033.33)
  %multiply.3503.47 = fmul double %param_5.8545, %29
  %constant_774_4 = load double, ptr @103, align 8
  %compare.375.27 = fcmp ogt double %multiply.3503.47, %constant_774_4
  %30 = zext i1 %compare.375.27 to i8
  %31 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1371 = getelementptr inbounds double, ptr %31, i64 0
  %param_2.13719 = load double, ptr %param_2.1371, align 8, !invariant.load !191
  %32 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1188 = getelementptr inbounds double, ptr %32, i64 0
  %param_3.118810 = load double, ptr %param_3.1188, align 8, !invariant.load !191
  %multiply.3510.15 = fmul double %param_4.9707, %param_3.118810
  %add.1036.13 = fadd double %param_2.13719, %multiply.3510.15
  %multiply.3511.11 = fmul double %add.1036.13, %29
  %multiply.3512.9 = fmul double %param_5.8545, %multiply.3511.11
  %constant_776_24 = load double, ptr @102, align 8
  %33 = trunc i8 %30 to i1
  %34 = select i1 %33, double %multiply.3512.9, double %constant_776_24
  %35 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %34, ptr %35, align 8
  br label %dynamic-update-slice.2095.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_98(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1318 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_74 = load i64, ptr @107, align 8
  %0 = icmp slt i64 %param_2.1318, %constant_770_74
  %1 = zext i1 %0 to i8
  %param_2.13181 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_3 = load i64, ptr @106, align 8
  %2 = add i64 %param_2.13181, %constant_769_3
  %param_2.13182 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13182
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_743 = load i64, ptr @107, align 8
  %9 = icmp sge i64 0, %constant_770_743
  %10 = select i1 %9, i64 0, i64 %constant_770_743
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_744 = load i64, ptr @107, align 8
  %13 = icmp sge i64 0, %constant_770_744
  %14 = select i1 %13, i64 0, i64 %constant_770_744
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2113.1.in_bounds-true, label %dynamic-update-slice.2113.1.in_bounds-after

dynamic-update-slice.2113.1.in_bounds-after:      ; preds = %dynamic-update-slice.2113.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2113.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1577 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.15775 = load double, ptr %param_1.1577, align 8, !invariant.load !191
  %30 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %param_1.15775, ptr %30, align 8
  br label %dynamic-update-slice.2113.1.in_bounds-after
}

define void @loop_add_and_compare_divide_multiply_select_fusion(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 16 dereferenceable(160) %arg7, ptr noalias align 16 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 16 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(160) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 128 dereferenceable(160) %arg14, ptr noalias align 128 dereferenceable(160) %arg15, ptr noalias align 16 dereferenceable(768) %arg16, ptr noalias align 128 dereferenceable(8) %arg17, ptr noalias align 16 dereferenceable(160) %arg18, ptr noalias align 16 dereferenceable(160) %arg19, ptr noalias align 128 dereferenceable(160) %arg20, ptr noalias align 128 dereferenceable(160) %arg21, ptr noalias align 128 dereferenceable(160) %arg22, ptr noalias align 16 dereferenceable(160) %arg23, ptr noalias align 16 dereferenceable(160) %arg24, ptr noalias align 16 dereferenceable(160) %arg25, ptr noalias align 128 dereferenceable(160) %arg26, ptr noalias align 128 dereferenceable(160) %arg27, ptr noalias align 128 dereferenceable(160) %arg28, ptr noalias align 16 dereferenceable(30720) %arg29, ptr noalias align 128 dereferenceable(80) %arg30, ptr noalias align 128 dereferenceable(160) %arg31, ptr noalias align 128 dereferenceable(160) %arg32, ptr noalias align 128 dereferenceable(160) %arg33, ptr noalias align 128 dereferenceable(160) %arg34, ptr noalias align 128 dereferenceable(160) %arg35, ptr noalias align 128 dereferenceable(160) %arg36, ptr noalias align 128 dereferenceable(160) %arg37, ptr noalias align 128 dereferenceable(160) %arg38, ptr noalias align 128 dereferenceable(160) %arg39, ptr noalias align 128 dereferenceable(160) %arg40, ptr noalias align 128 dereferenceable(160) %arg41, ptr noalias align 16 dereferenceable(160) %arg42, ptr noalias align 128 dereferenceable(20) %arg43, ptr noalias align 128 dereferenceable(160) %arg44, ptr noalias align 128 dereferenceable(160) %arg45, ptr noalias align 128 dereferenceable(160) %arg46, ptr noalias align 128 dereferenceable(160) %arg47, ptr noalias align 128 dereferenceable(160) %arg48, ptr noalias align 128 dereferenceable(160) %arg49, ptr noalias align 128 dereferenceable(160) %arg50, ptr noalias align 128 dereferenceable(160) %arg51, ptr noalias align 128 dereferenceable(160) %arg52, ptr noalias align 128 dereferenceable(20) %arg53, ptr noalias align 128 dereferenceable(160) %arg54, ptr noalias align 128 dereferenceable(160) %arg55, ptr noalias align 128 dereferenceable(160) %arg56) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_and_compare_divide_multiply_select_fusion.in_bounds-true, label %loop_add_and_compare_divide_multiply_select_fusion.in_bounds-after

loop_add_and_compare_divide_multiply_select_fusion.in_bounds-after: ; preds = %loop_add_and_compare_divide_multiply_select_fusion.in_bounds-true, %entry
  ret void

loop_add_and_compare_divide_multiply_select_fusion.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg19, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !191
  %8 = getelementptr double, ptr %arg20, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !191
  %multiply.3498.11.clone.1 = fmul double %7, %10
  %11 = getelementptr inbounds [1 x double], ptr %arg3, i32 0, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !191
  %13 = getelementptr double, ptr %arg18, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !191
  %multiply.3499.13.clone.1 = fmul double %12, %15
  %add.1031.11.clone.1 = fadd double %multiply.3498.11.clone.1, %multiply.3499.13.clone.1
  %16 = getelementptr double, ptr %arg42, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !191
  %19 = getelementptr double, ptr %arg35, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  %21 = load double, ptr %20, align 8, !invariant.load !191
  %multiply.3501.5.clone.1 = fmul double %18, %21
  %22 = getelementptr double, ptr %arg21, i32 %linear_index
  %23 = getelementptr inbounds double, ptr %22, i32 0
  %24 = load double, ptr %23, align 8, !invariant.load !191
  %divide.862.1.clone.1 = fdiv double %multiply.3501.5.clone.1, %24
  %25 = load i64, ptr %arg17, align 8, !invariant.load !191
  %constant_770_1_clone_1 = load i64, ptr @110, align 8
  %26 = icmp slt i64 %25, %constant_770_1_clone_1
  %27 = zext i1 %26 to i8
  %28 = load i64, ptr %arg17, align 8, !invariant.load !191
  %constant_769_113_clone_1 = load i64, ptr @109, align 8
  %29 = add i64 %28, %constant_769_113_clone_1
  %30 = load i64, ptr %arg17, align 8, !invariant.load !191
  %31 = trunc i8 %27 to i1
  %32 = select i1 %31, i64 %29, i64 %30
  %33 = trunc i64 %32 to i32
  %34 = icmp sge i32 0, %33
  %35 = select i1 %34, i32 0, i32 %33
  %36 = icmp sle i32 191, %35
  %dynamic-slice.56.6.clone.1.start_idx0 = select i1 %36, i32 191, i32 %35
  %constant_770_1_clone_11 = load i64, ptr @110, align 8
  %37 = trunc i64 %constant_770_1_clone_11 to i32
  %38 = icmp sge i32 0, %37
  %39 = select i1 %38, i32 0, i32 %37
  %40 = icmp sle i32 0, %39
  %dynamic-slice.56.6.clone.1.start_idx1 = select i1 %40, i32 0, i32 %39
  %constant_770_1_clone_12 = load i64, ptr @110, align 8
  %41 = trunc i64 %constant_770_1_clone_12 to i32
  %42 = icmp sge i32 0, %41
  %43 = select i1 %42, i32 0, i32 %41
  %44 = icmp sle i32 0, %43
  %dynamic-slice.56.6.clone.1.start_idx2 = select i1 %44, i32 0, i32 %43
  %45 = add i32 %dynamic-slice.56.6.clone.1.start_idx0, 0
  %46 = add i32 %dynamic-slice.56.6.clone.1.start_idx1, %3
  %47 = add i32 %dynamic-slice.56.6.clone.1.start_idx2, 0
  %48 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr %arg29, i32 0, i32 %45, i32 %46, i32 0
  %49 = load double, ptr %48, align 8, !invariant.load !191
  %50 = getelementptr double, ptr %arg33, i32 %linear_index
  %51 = getelementptr inbounds double, ptr %50, i32 0
  %52 = load double, ptr %51, align 8, !invariant.load !191
  %subtract.146.7.clone.1 = fsub double %49, %52
  %53 = trunc i64 %32 to i32
  %54 = icmp sge i32 0, %53
  %55 = select i1 %54, i32 0, i32 %53
  %56 = icmp sle i32 191, %55
  %dynamic-slice.55.23.clone.1.start_idx0 = select i1 %56, i32 191, i32 %55
  %57 = add i32 %dynamic-slice.55.23.clone.1.start_idx0, 0
  %58 = getelementptr inbounds [192 x i32], ptr %arg16, i32 0, i32 %57
  %59 = load i32, ptr %58, align 4, !invariant.load !191
  %60 = sitofp i32 %59 to double
  %multiply.3515.5.clone.1 = fmul double %subtract.146.7.clone.1, %60
  %61 = getelementptr double, ptr %arg35, i32 %linear_index
  %62 = getelementptr inbounds double, ptr %61, i32 0
  %63 = load double, ptr %62, align 8, !invariant.load !191
  %divide.863.1.clone.1 = fdiv double %multiply.3515.5.clone.1, %63
  %multiply.3516.9.clone.1 = fmul double %divide.863.1.clone.1, %60
  %multiply.3517.3.clone.1 = fmul double %divide.862.1.clone.1, %multiply.3516.9.clone.1
  %add.1038.3.clone.1 = fadd double %add.1031.11.clone.1, %multiply.3517.3.clone.1
  %64 = call double @llvm.fabs.f64(double %add.1038.3.clone.1)
  %65 = fcmp one double %64, 0x7FF0000000000000
  %66 = zext i1 %65 to i8
  %67 = call double @llvm.fabs.f64(double %add.1038.3.clone.1)
  %constant_783_1_clone_1 = load double, ptr @111, align 8
  %compare.376.3.clone.1 = fcmp olt double %67, %constant_783_1_clone_1
  %68 = zext i1 %compare.376.3.clone.1 to i8
  %69 = and i8 %66, %68
  %70 = getelementptr i64, ptr %arg4, i32 %linear_index
  %71 = getelementptr inbounds i64, ptr %70, i32 0
  %72 = load i64, ptr %71, align 8, !invariant.load !191
  %constant_770_1_clone_13 = load i64, ptr @110, align 8
  %73 = icmp ne i64 %72, %constant_770_1_clone_13
  %74 = zext i1 %73 to i8
  %75 = zext i8 %74 to i32
  %constant_780_2 = load i32, ptr @117, align 4
  %76 = icmp slt i32 %75, %constant_780_2
  %77 = zext i1 %76 to i8
  %constant_772_13 = load double, ptr @108, align 8
  %78 = getelementptr double, ptr %arg0, i32 %linear_index
  %79 = getelementptr inbounds double, ptr %78, i32 0
  %80 = load double, ptr %79, align 8
  %divide.866.1.clone.1 = fdiv double %constant_772_13, %80
  %81 = getelementptr double, ptr %arg2, i32 %linear_index
  %82 = getelementptr inbounds double, ptr %81, i32 0
  %83 = load double, ptr %82, align 8, !invariant.load !191
  %84 = call double @__nv_exp(double %83)
  %multiply.3524.11 = fmul double %12, %84
  %add.1044.2 = fadd double %divide.866.1.clone.1, %multiply.3524.11
  %divide.869.3 = fdiv double %constant_772_13, %add.1044.2
  %constant_774_13 = load double, ptr @112, align 8
  %compare.377.5.clone.1 = fcmp ogt double %multiply.3524.11, %constant_774_13
  %85 = zext i1 %compare.377.5.clone.1 to i8
  %86 = getelementptr double, ptr %arg10, i32 %linear_index
  %87 = getelementptr inbounds double, ptr %86, i32 0
  %88 = load double, ptr %87, align 8, !invariant.load !191
  %89 = trunc i8 %85 to i1
  %90 = select i1 %89, double %multiply.3524.11, double %88
  %add.1042.2.clone.1 = fadd double %divide.866.1.clone.1, %90
  %divide.867.1.clone.1 = fdiv double %constant_772_13, %add.1042.2.clone.1
  %91 = getelementptr double, ptr %arg5, i32 %linear_index
  %92 = getelementptr inbounds double, ptr %91, i32 0
  %93 = load double, ptr %92, align 8, !invariant.load !191
  %94 = getelementptr double, ptr %arg24, i32 %linear_index
  %95 = getelementptr inbounds double, ptr %94, i32 0
  %96 = load double, ptr %95, align 8, !invariant.load !191
  %97 = getelementptr double, ptr %arg25, i32 %linear_index
  %98 = getelementptr inbounds double, ptr %97, i32 0
  %99 = load double, ptr %98, align 8, !invariant.load !191
  %100 = getelementptr double, ptr %arg6, i32 %linear_index
  %101 = getelementptr inbounds double, ptr %100, i32 0
  %102 = load double, ptr %101, align 8, !invariant.load !191
  %multiply.3502.17.clone.1 = fmul double %99, %102
  %add.1033.15.clone.1 = fadd double %96, %multiply.3502.17.clone.1
  %103 = call double @__nv_exp(double %add.1033.15.clone.1)
  %multiply.3503.27.clone.1 = fmul double %12, %103
  %compare.375.9.clone.1 = fcmp ogt double %multiply.3503.27.clone.1, %constant_774_13
  %104 = zext i1 %compare.375.9.clone.1 to i8
  %105 = getelementptr double, ptr %arg23, i32 %linear_index
  %106 = getelementptr inbounds double, ptr %105, i32 0
  %107 = load double, ptr %106, align 8, !invariant.load !191
  %108 = trunc i8 %104 to i1
  %109 = select i1 %108, double %multiply.3503.27.clone.1, double %107
  %110 = getelementptr double, ptr %arg15, i32 %linear_index
  %111 = getelementptr inbounds double, ptr %110, i32 0
  %112 = load double, ptr %111, align 8, !invariant.load !191
  %multiply.3518.1.clone.1 = fmul double %109, %112
  %multiply.3525.35 = fmul double %93, %multiply.3518.1.clone.1
  %multiply.3530.36 = fmul double %multiply.3525.35, %multiply.3525.35
  %constant_782_6 = load double, ptr @116, align 8
  %multiply.3531.17 = fmul double %multiply.3530.36, %constant_782_6
  %113 = getelementptr double, ptr %arg22, i32 %linear_index
  %114 = getelementptr inbounds double, ptr %113, i32 0
  %115 = load double, ptr %114, align 8
  %add.1034.3.clone.1 = fadd double %115, %109
  %116 = getelementptr double, ptr %arg21, i32 %linear_index
  %117 = getelementptr inbounds double, ptr %116, i32 0
  %118 = load double, ptr %117, align 8, !invariant.load !191
  %multiply.3519.1.clone.1 = fmul double %add.1034.3.clone.1, %118
  %divide.864.3.clone.1 = fdiv double %constant_772_13, %multiply.3519.1.clone.1
  %119 = getelementptr double, ptr %arg15, i32 %linear_index
  %120 = getelementptr inbounds double, ptr %119, i32 0
  %121 = load double, ptr %120, align 8, !invariant.load !191
  %subtract.147.11.clone.1 = fsub double %add.1038.3.clone.1, %add.1031.11.clone.1
  %multiply.3520.2.clone.1 = fmul double %subtract.147.11.clone.1, %subtract.147.11.clone.1
  %multiply.3521.1.clone.1 = fmul double %121, %multiply.3520.2.clone.1
  %add.1039.3.clone.1 = fadd double %divide.864.3.clone.1, %multiply.3521.1.clone.1
  %constant_784_1_clone_1 = load double, ptr @113, align 8
  %add.1040.1.clone.1 = fadd double %add.1039.3.clone.1, %constant_784_1_clone_1
  %multiply.3532.17 = fmul double %multiply.3530.36, %add.1040.1.clone.1
  %add.1045.15 = fadd double %multiply.3531.17, %multiply.3532.17
  %multiply.3533.25 = fmul double %93, %93
  %multiply.3534.23 = fmul double %multiply.3533.25, %constant_782_6
  %multiply.3535.13 = fmul double %multiply.3534.23, %multiply.3518.1.clone.1
  %multiply.3536.13 = fmul double %multiply.3535.13, %add.1040.1.clone.1
  %subtract.148.13 = fsub double %add.1045.15, %multiply.3536.13
  %122 = getelementptr i64, ptr %arg4, i32 %linear_index
  %123 = getelementptr inbounds i64, ptr %122, i32 0
  %124 = load i64, ptr %123, align 8, !invariant.load !191
  %125 = sitofp i64 %124 to double
  %multiply.3537.11 = fmul double %subtract.148.13, %125
  %add.1046.9 = fadd double %divide.867.1.clone.1, %multiply.3537.11
  %compare.380.5 = fcmp ogt double %add.1046.9, %constant_774_13
  %126 = zext i1 %compare.380.5 to i8
  %127 = getelementptr double, ptr %arg1, i32 %linear_index
  %128 = getelementptr inbounds double, ptr %127, i32 0
  %129 = load double, ptr %128, align 8, !invariant.load !191
  %130 = trunc i8 %126 to i1
  %131 = select i1 %130, double %add.1046.9, double %129
  %132 = trunc i8 %77 to i1
  %133 = select i1 %132, double %divide.869.3, double %131
  %134 = getelementptr double, ptr %arg0, i32 %linear_index
  %135 = getelementptr inbounds double, ptr %134, i32 0
  %136 = load double, ptr %135, align 8
  %137 = trunc i8 %69 to i1
  %138 = select i1 %137, double %133, double %136
  %139 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } undef, double %138, 0
  %140 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %139, i8 %74, 1
  %141 = getelementptr double, ptr %arg8, i32 %linear_index
  %142 = getelementptr inbounds double, ptr %141, i32 0
  %143 = load double, ptr %142, align 8, !invariant.load !191
  %144 = getelementptr double, ptr %arg6, i32 %linear_index
  %145 = getelementptr inbounds double, ptr %144, i32 0
  %146 = load double, ptr %145, align 8, !invariant.load !191
  %multiply.3522.3.clone.1 = fmul double %143, %146
  %147 = getelementptr double, ptr %arg7, i32 %linear_index
  %148 = getelementptr inbounds double, ptr %147, i32 0
  %149 = load double, ptr %148, align 8, !invariant.load !191
  %multiply.3523.5.clone.1 = fmul double %12, %149
  %add.1041.3.clone.1 = fadd double %multiply.3522.3.clone.1, %multiply.3523.5.clone.1
  %multiply.3526.2.clone.1 = fmul double %multiply.3525.35, %add.1040.1.clone.1
  %constant_779_18_clone_1 = load double, ptr @115, align 8
  %multiply.3527.15.clone.1 = fmul double %divide.867.1.clone.1, %constant_779_18_clone_1
  %divide.868.5.clone.1 = fdiv double %constant_772_13, %multiply.3527.15.clone.1
  %multiply.3528.1.clone.1 = fmul double %multiply.3526.2.clone.1, %divide.868.5.clone.1
  %multiply.3529.1.clone.1 = fmul double %multiply.3528.1.clone.1, %125
  %add.1043.1.clone.1 = fadd double %add.1041.3.clone.1, %multiply.3529.1.clone.1
  %150 = getelementptr double, ptr %arg6, i32 %linear_index
  %151 = getelementptr inbounds double, ptr %150, i32 0
  %152 = load double, ptr %151, align 8, !invariant.load !191
  %153 = trunc i8 %69 to i1
  %154 = select i1 %153, double %add.1043.1.clone.1, double %152
  %155 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %140, double %154, 2
  %multiply.3538.1.clone.1 = fmul double %90, %divide.867.1.clone.1
  %156 = getelementptr double, ptr %arg9, i32 %linear_index
  %157 = getelementptr inbounds double, ptr %156, i32 0
  %158 = load double, ptr %157, align 8
  %159 = trunc i8 %69 to i1
  %160 = select i1 %159, double %multiply.3538.1.clone.1, double %158
  %161 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %155, double %160, 3
  %multiply.3571.2.clone.1 = fmul double %multiply.3527.15.clone.1, %multiply.3527.15.clone.1
  %divide.878.1.clone.1 = fdiv double %constant_772_13, %multiply.3571.2.clone.1
  %162 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %161, double %divide.878.1.clone.1, 4
  %163 = getelementptr double, ptr %arg11, i32 %linear_index
  %164 = getelementptr inbounds double, ptr %163, i32 0
  %165 = load double, ptr %164, align 8
  %166 = trunc i8 %69 to i1
  %167 = select i1 %166, double %divide.867.1.clone.1, double %165
  %168 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %162, double %167, 5
  %169 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %168, double %divide.867.1.clone.1, 6
  %multiply.3563.2.clone.1 = fmul double %add.1042.2.clone.1, %add.1042.2.clone.1
  %divide.877.1.clone.1 = fdiv double %constant_772_13, %multiply.3563.2.clone.1
  %170 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %169, double %divide.877.1.clone.1, 7
  %171 = getelementptr double, ptr %arg12, i32 %linear_index
  %172 = getelementptr inbounds double, ptr %171, i32 0
  %173 = load double, ptr %172, align 8
  %174 = trunc i8 %69 to i1
  %175 = select i1 %174, double %divide.866.1.clone.1, double %173
  %176 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %170, double %175, 8
  %177 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %176, double %divide.866.1.clone.1, 9
  %178 = getelementptr double, ptr %arg0, i32 %linear_index
  %179 = getelementptr inbounds double, ptr %178, i32 0
  %180 = load double, ptr %179, align 8
  %181 = getelementptr double, ptr %arg0, i32 %linear_index
  %182 = getelementptr inbounds double, ptr %181, i32 0
  %183 = load double, ptr %182, align 8
  %184 = getelementptr double, ptr %arg0, i32 %linear_index
  %185 = getelementptr inbounds double, ptr %184, i32 0
  %186 = load double, ptr %185, align 8
  %multiply.3559.4.clone.1 = fmul double %183, %186
  %multiply.3597.3.clone.1 = fmul double %180, %multiply.3559.4.clone.1
  %divide.880.1.clone.1 = fdiv double %constant_772_13, %multiply.3597.3.clone.1
  %constant_777_2_clone_1 = load double, ptr @114, align 8
  %multiply.3598.1.clone.1 = fmul double %divide.880.1.clone.1, %constant_777_2_clone_1
  %187 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %177, double %multiply.3598.1.clone.1, 10
  %divide.876.1.clone.1 = fdiv double %constant_772_13, %multiply.3559.4.clone.1
  %188 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %187, double %divide.876.1.clone.1, 11
  %189 = getelementptr double, ptr %arg13, i32 %linear_index
  %190 = getelementptr inbounds double, ptr %189, i32 0
  %191 = load double, ptr %190, align 8
  %192 = trunc i8 %69 to i1
  %193 = select i1 %192, double %add.1041.3.clone.1, double %191
  %194 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %188, double %193, 12
  %195 = getelementptr double, ptr %arg14, i32 %linear_index
  %196 = getelementptr inbounds double, ptr %195, i32 0
  %197 = load double, ptr %196, align 8
  %198 = trunc i8 %69 to i1
  %199 = select i1 %198, double %add.1040.1.clone.1, double %197
  %200 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %194, double %199, 13
  %201 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %200, double %add.1040.1.clone.1, 14
  %202 = getelementptr double, ptr %arg26, i32 %linear_index
  %203 = getelementptr inbounds double, ptr %202, i32 0
  %204 = load double, ptr %203, align 8
  %205 = trunc i8 %69 to i1
  %206 = select i1 %205, double %multiply.3518.1.clone.1, double %204
  %207 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %201, double %206, 15
  %208 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %207, double %multiply.3518.1.clone.1, 16
  %209 = getelementptr double, ptr %arg27, i32 %linear_index
  %210 = getelementptr inbounds double, ptr %209, i32 0
  %211 = load double, ptr %210, align 8
  %212 = trunc i8 %69 to i1
  %213 = select i1 %212, double %12, double %211
  %214 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %208, double %213, 17
  %215 = getelementptr double, ptr %arg28, i32 %linear_index
  %216 = getelementptr inbounds double, ptr %215, i32 0
  %217 = load double, ptr %216, align 8
  %218 = trunc i8 %69 to i1
  %219 = select i1 %218, double %49, double %217
  %220 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %214, double %219, 18
  %221 = getelementptr i32, ptr %arg30, i32 %linear_index
  %222 = getelementptr inbounds i32, ptr %221, i32 0
  %223 = load i32, ptr %222, align 4
  %224 = trunc i8 %69 to i1
  %225 = select i1 %224, i32 %59, i32 %223
  %226 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %220, i32 %225, 19
  %227 = getelementptr double, ptr %arg31, i32 %linear_index
  %228 = getelementptr inbounds double, ptr %227, i32 0
  %229 = load double, ptr %228, align 8
  %230 = trunc i8 %69 to i1
  %231 = select i1 %230, double %add.1031.11.clone.1, double %229
  %232 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %226, double %231, 20
  %233 = getelementptr double, ptr %arg20, i32 %linear_index
  %234 = getelementptr inbounds double, ptr %233, i32 0
  %235 = load double, ptr %234, align 8, !invariant.load !191
  %236 = trunc i8 %69 to i1
  %237 = select i1 %236, double %add.1038.3.clone.1, double %235
  %238 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %232, double %237, 21
  %239 = getelementptr double, ptr %arg32, i32 %linear_index
  %240 = getelementptr inbounds double, ptr %239, i32 0
  %241 = load double, ptr %240, align 8
  %242 = trunc i8 %69 to i1
  %243 = select i1 %242, double %subtract.147.11.clone.1, double %241
  %244 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %238, double %243, 22
  %245 = getelementptr double, ptr %arg33, i32 %linear_index
  %246 = getelementptr inbounds double, ptr %245, i32 0
  %247 = load double, ptr %246, align 8, !invariant.load !191
  %248 = getelementptr double, ptr %arg34, i32 %linear_index
  %249 = getelementptr inbounds double, ptr %248, i32 0
  %250 = load double, ptr %249, align 8
  %251 = trunc i8 %69 to i1
  %252 = select i1 %251, double %247, double %250
  %253 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %244, double %252, 23
  %254 = getelementptr double, ptr %arg35, i32 %linear_index
  %255 = getelementptr inbounds double, ptr %254, i32 0
  %256 = load double, ptr %255, align 8, !invariant.load !191
  %257 = getelementptr double, ptr %arg36, i32 %linear_index
  %258 = getelementptr inbounds double, ptr %257, i32 0
  %259 = load double, ptr %258, align 8
  %260 = trunc i8 %69 to i1
  %261 = select i1 %260, double %256, double %259
  %262 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %253, double %261, 24
  %263 = getelementptr double, ptr %arg35, i32 %linear_index
  %264 = getelementptr inbounds double, ptr %263, i32 0
  %265 = load double, ptr %264, align 8, !invariant.load !191
  %266 = getelementptr double, ptr %arg37, i32 %linear_index
  %267 = getelementptr inbounds double, ptr %266, i32 0
  %268 = load double, ptr %267, align 8
  %269 = trunc i8 %69 to i1
  %270 = select i1 %269, double %265, double %268
  %271 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %262, double %270, 25
  %272 = getelementptr double, ptr %arg38, i32 %linear_index
  %273 = getelementptr inbounds double, ptr %272, i32 0
  %274 = load double, ptr %273, align 8
  %275 = trunc i8 %69 to i1
  %276 = select i1 %275, double %divide.863.1.clone.1, double %274
  %277 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %271, double %276, 26
  %278 = getelementptr double, ptr %arg15, i32 %linear_index
  %279 = getelementptr inbounds double, ptr %278, i32 0
  %280 = load double, ptr %279, align 8, !invariant.load !191
  %281 = getelementptr double, ptr %arg39, i32 %linear_index
  %282 = getelementptr inbounds double, ptr %281, i32 0
  %283 = load double, ptr %282, align 8
  %284 = trunc i8 %69 to i1
  %285 = select i1 %284, double %280, double %283
  %286 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %277, double %285, 27
  %287 = getelementptr double, ptr %arg21, i32 %linear_index
  %288 = getelementptr inbounds double, ptr %287, i32 0
  %289 = load double, ptr %288, align 8, !invariant.load !191
  %290 = getelementptr double, ptr %arg40, i32 %linear_index
  %291 = getelementptr inbounds double, ptr %290, i32 0
  %292 = load double, ptr %291, align 8
  %293 = trunc i8 %69 to i1
  %294 = select i1 %293, double %289, double %292
  %295 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %286, double %294, 28
  %296 = getelementptr double, ptr %arg22, i32 %linear_index
  %297 = getelementptr inbounds double, ptr %296, i32 0
  %298 = load double, ptr %297, align 8
  %299 = getelementptr double, ptr %arg41, i32 %linear_index
  %300 = getelementptr inbounds double, ptr %299, i32 0
  %301 = load double, ptr %300, align 8
  %302 = trunc i8 %69 to i1
  %303 = select i1 %302, double %298, double %301
  %304 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %295, double %303, 29
  %305 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %304, i8 %69, 30
  %306 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %305, double %divide.863.1.clone.1, 31
  %307 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %306, double %divide.862.1.clone.1, 32
  %308 = getelementptr double, ptr %arg21, i32 %linear_index
  %309 = getelementptr inbounds double, ptr %308, i32 0
  %310 = load double, ptr %309, align 8, !invariant.load !191
  %311 = getelementptr double, ptr %arg21, i32 %linear_index
  %312 = getelementptr inbounds double, ptr %311, i32 0
  %313 = load double, ptr %312, align 8, !invariant.load !191
  %multiply.3545.2.clone.1 = fmul double %310, %313
  %divide.874.1.clone.1 = fdiv double %constant_772_13, %multiply.3545.2.clone.1
  %314 = insertvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %307, double %divide.874.1.clone.1, 33
  %315 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 0
  %316 = getelementptr double, ptr %arg0, i32 %linear_index
  %317 = getelementptr inbounds double, ptr %316, i32 0
  store double %315, ptr %317, align 8
  %318 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 1
  %319 = getelementptr i8, ptr %arg43, i32 %linear_index
  %320 = getelementptr inbounds i8, ptr %319, i32 0
  store i8 %318, ptr %320, align 1
  %321 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 2
  %322 = getelementptr double, ptr %arg44, i32 %linear_index
  %323 = getelementptr inbounds double, ptr %322, i32 0
  store double %321, ptr %323, align 8
  %324 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 3
  %325 = getelementptr double, ptr %arg9, i32 %linear_index
  %326 = getelementptr inbounds double, ptr %325, i32 0
  store double %324, ptr %326, align 8
  %327 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 4
  %328 = getelementptr double, ptr %arg45, i32 %linear_index
  %329 = getelementptr inbounds double, ptr %328, i32 0
  store double %327, ptr %329, align 8
  %330 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 5
  %331 = getelementptr double, ptr %arg11, i32 %linear_index
  %332 = getelementptr inbounds double, ptr %331, i32 0
  store double %330, ptr %332, align 8
  %333 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 6
  %334 = getelementptr double, ptr %arg46, i32 %linear_index
  %335 = getelementptr inbounds double, ptr %334, i32 0
  store double %333, ptr %335, align 8
  %336 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 7
  %337 = getelementptr double, ptr %arg47, i32 %linear_index
  %338 = getelementptr inbounds double, ptr %337, i32 0
  store double %336, ptr %338, align 8
  %339 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 8
  %340 = getelementptr double, ptr %arg12, i32 %linear_index
  %341 = getelementptr inbounds double, ptr %340, i32 0
  store double %339, ptr %341, align 8
  %342 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 9
  %343 = getelementptr double, ptr %arg48, i32 %linear_index
  %344 = getelementptr inbounds double, ptr %343, i32 0
  store double %342, ptr %344, align 8
  %345 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 10
  %346 = getelementptr double, ptr %arg49, i32 %linear_index
  %347 = getelementptr inbounds double, ptr %346, i32 0
  store double %345, ptr %347, align 8
  %348 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 11
  %349 = getelementptr double, ptr %arg50, i32 %linear_index
  %350 = getelementptr inbounds double, ptr %349, i32 0
  store double %348, ptr %350, align 8
  %351 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 12
  %352 = getelementptr double, ptr %arg13, i32 %linear_index
  %353 = getelementptr inbounds double, ptr %352, i32 0
  store double %351, ptr %353, align 8
  %354 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 13
  %355 = getelementptr double, ptr %arg14, i32 %linear_index
  %356 = getelementptr inbounds double, ptr %355, i32 0
  store double %354, ptr %356, align 8
  %357 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 14
  %358 = getelementptr double, ptr %arg22, i32 %linear_index
  %359 = getelementptr inbounds double, ptr %358, i32 0
  store double %357, ptr %359, align 8
  %360 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 15
  %361 = getelementptr double, ptr %arg26, i32 %linear_index
  %362 = getelementptr inbounds double, ptr %361, i32 0
  store double %360, ptr %362, align 8
  %363 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 16
  %364 = getelementptr double, ptr %arg51, i32 %linear_index
  %365 = getelementptr inbounds double, ptr %364, i32 0
  store double %363, ptr %365, align 8
  %366 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 17
  %367 = getelementptr double, ptr %arg27, i32 %linear_index
  %368 = getelementptr inbounds double, ptr %367, i32 0
  store double %366, ptr %368, align 8
  %369 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 18
  %370 = getelementptr double, ptr %arg28, i32 %linear_index
  %371 = getelementptr inbounds double, ptr %370, i32 0
  store double %369, ptr %371, align 8
  %372 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 19
  %373 = getelementptr i32, ptr %arg30, i32 %linear_index
  %374 = getelementptr inbounds i32, ptr %373, i32 0
  store i32 %372, ptr %374, align 4
  %375 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 20
  %376 = getelementptr double, ptr %arg31, i32 %linear_index
  %377 = getelementptr inbounds double, ptr %376, i32 0
  store double %375, ptr %377, align 8
  %378 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 21
  %379 = getelementptr double, ptr %arg52, i32 %linear_index
  %380 = getelementptr inbounds double, ptr %379, i32 0
  store double %378, ptr %380, align 8
  %381 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 22
  %382 = getelementptr double, ptr %arg32, i32 %linear_index
  %383 = getelementptr inbounds double, ptr %382, i32 0
  store double %381, ptr %383, align 8
  %384 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 23
  %385 = getelementptr double, ptr %arg34, i32 %linear_index
  %386 = getelementptr inbounds double, ptr %385, i32 0
  store double %384, ptr %386, align 8
  %387 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 24
  %388 = getelementptr double, ptr %arg36, i32 %linear_index
  %389 = getelementptr inbounds double, ptr %388, i32 0
  store double %387, ptr %389, align 8
  %390 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 25
  %391 = getelementptr double, ptr %arg37, i32 %linear_index
  %392 = getelementptr inbounds double, ptr %391, i32 0
  store double %390, ptr %392, align 8
  %393 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 26
  %394 = getelementptr double, ptr %arg38, i32 %linear_index
  %395 = getelementptr inbounds double, ptr %394, i32 0
  store double %393, ptr %395, align 8
  %396 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 27
  %397 = getelementptr double, ptr %arg39, i32 %linear_index
  %398 = getelementptr inbounds double, ptr %397, i32 0
  store double %396, ptr %398, align 8
  %399 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 28
  %400 = getelementptr double, ptr %arg40, i32 %linear_index
  %401 = getelementptr inbounds double, ptr %400, i32 0
  store double %399, ptr %401, align 8
  %402 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 29
  %403 = getelementptr double, ptr %arg41, i32 %linear_index
  %404 = getelementptr inbounds double, ptr %403, i32 0
  store double %402, ptr %404, align 8
  %405 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 30
  %406 = getelementptr i8, ptr %arg53, i32 %linear_index
  %407 = getelementptr inbounds i8, ptr %406, i32 0
  store i8 %405, ptr %407, align 1
  %408 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 31
  %409 = getelementptr double, ptr %arg54, i32 %linear_index
  %410 = getelementptr inbounds double, ptr %409, i32 0
  store double %408, ptr %410, align 8
  %411 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 32
  %412 = getelementptr double, ptr %arg55, i32 %linear_index
  %413 = getelementptr inbounds double, ptr %412, i32 0
  store double %411, ptr %413, align 8
  %414 = extractvalue { double, i8, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double, double, double, i8, double, double, double } %314, 33
  %415 = getelementptr double, ptr %arg56, i32 %linear_index
  %416 = getelementptr inbounds double, ptr %415, i32 0
  store double %414, ptr %416, align 8
  br label %loop_add_and_compare_divide_multiply_select_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #0

define void @loop_dynamic_update_slice_fusion_40(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(20) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1343 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_99 = load i64, ptr @119, align 8
  %0 = icmp slt i64 %param_2.1343, %constant_770_99
  %1 = zext i1 %0 to i8
  %param_2.13431 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_78 = load i64, ptr @118, align 8
  %2 = add i64 %param_2.13431, %constant_769_78
  %param_2.13432 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13432
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_993 = load i64, ptr @119, align 8
  %9 = icmp sge i64 0, %constant_770_993
  %10 = select i1 %9, i64 0, i64 %constant_770_993
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_994 = load i64, ptr @119, align 8
  %13 = icmp sge i64 0, %constant_770_994
  %14 = select i1 %13, i64 0, i64 %constant_770_994
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 20
  %24 = udiv i64 %linear_index0, 20
  %25 = icmp ult i64 %linear_index, 20
  br i1 %25, label %dynamic-update-slice.2085.1.in_bounds-true, label %dynamic-update-slice.2085.1.in_bounds-after

dynamic-update-slice.2085.1.in_bounds-after:      ; preds = %dynamic-update-slice.2085.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2085.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i8, ptr %arg1, i64 %linear_index
  %param_1.1602 = getelementptr inbounds i8, ptr %29, i64 0
  %param_1.16025 = load i8, ptr %param_1.1602, align 1, !invariant.load !191
  %30 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %param_1.16025, ptr %30, align 1
  br label %dynamic-update-slice.2085.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_42(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 16 dereferenceable(160) %arg6) {
entry:
  %param_1.1587 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_84 = load i64, ptr @123, align 8
  %0 = icmp slt i64 %param_1.1587, %constant_770_84
  %1 = zext i1 %0 to i8
  %param_1.15871 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_76 = load i64, ptr @122, align 8
  %2 = add i64 %param_1.15871, %constant_769_76
  %param_1.15872 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15872
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_843 = load i64, ptr @123, align 8
  %9 = icmp sge i64 0, %constant_770_843
  %10 = select i1 %9, i64 0, i64 %constant_770_843
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2083.1.in_bounds-true, label %dynamic-update-slice.2083.1.in_bounds-after

dynamic-update-slice.2083.1.in_bounds-after:      ; preds = %dynamic-update-slice.2083.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2083.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1356 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.13564 = load double, ptr %param_2.1356, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.638 = getelementptr inbounds double, ptr %23, i64 0
  %param_6.6385 = load double, ptr %param_6.638, align 8, !invariant.load !191
  %24 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.832 = getelementptr inbounds double, ptr %24, i64 0
  %param_5.8326 = load double, ptr %param_5.832, align 8, !invariant.load !191
  %multiply.3525.37 = fmul double %param_6.6385, %param_5.8326
  %multiply.3530.40 = fmul double %multiply.3525.37, %multiply.3525.37
  %constant_782_4 = load double, ptr @121, align 8
  %multiply.3531.19 = fmul double %multiply.3530.40, %constant_782_4
  %25 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.946 = getelementptr inbounds double, ptr %25, i64 0
  %param_4.9467 = load double, ptr %param_4.946, align 8, !invariant.load !191
  %multiply.3532.19 = fmul double %multiply.3530.40, %param_4.9467
  %add.1045.17 = fadd double %multiply.3531.19, %multiply.3532.19
  %multiply.3533.27 = fmul double %param_6.6385, %param_6.6385
  %multiply.3534.25 = fmul double %multiply.3533.27, %constant_782_4
  %26 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.8328 = getelementptr inbounds double, ptr %26, i64 0
  %param_5.8329 = load double, ptr %param_5.8328, align 8, !invariant.load !191
  %multiply.3535.15 = fmul double %multiply.3534.25, %param_5.8329
  %27 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.94610 = getelementptr inbounds double, ptr %27, i64 0
  %param_4.94611 = load double, ptr %param_4.94610, align 8, !invariant.load !191
  %multiply.3536.15 = fmul double %multiply.3535.15, %param_4.94611
  %subtract.148.15 = fsub double %add.1045.17, %multiply.3536.15
  %28 = getelementptr i64, ptr %arg3, i64 %linear_index
  %param_3.1168 = getelementptr inbounds i64, ptr %28, i64 0
  %param_3.116812 = load i64, ptr %param_3.1168, align 8, !invariant.load !191
  %29 = sitofp i64 %param_3.116812 to double
  %multiply.3537.13 = fmul double %subtract.148.15, %29
  %add.1046.11 = fadd double %param_2.13564, %multiply.3537.13
  %constant_774_1 = load double, ptr @120, align 8
  %compare.380.7 = fcmp ogt double %add.1046.11, %constant_774_1
  %30 = zext i1 %compare.380.7 to i8
  %31 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %30, ptr %31, align 1
  br label %dynamic-update-slice.2083.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_49(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(20) %arg2) {
entry:
  %param_1.1558 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_55 = load i64, ptr @126, align 8
  %0 = icmp slt i64 %param_1.1558, %constant_770_55
  %1 = zext i1 %0 to i8
  %param_1.15581 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_64 = load i64, ptr @125, align 8
  %2 = add i64 %param_1.15581, %constant_769_64
  %param_1.15582 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15582
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_553 = load i64, ptr @126, align 8
  %9 = icmp sge i64 0, %constant_770_553
  %10 = select i1 %9, i64 0, i64 %constant_770_553
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2076.1.in_bounds-true, label %dynamic-update-slice.2076.1.in_bounds-after

dynamic-update-slice.2076.1.in_bounds-after:      ; preds = %dynamic-update-slice.2076.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2076.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i8, ptr %arg2, i64 %linear_index
  %param_2.1381 = getelementptr inbounds i8, ptr %22, i64 0
  %param_2.13814 = load i8, ptr %param_2.1381, align 1, !invariant.load !191
  %23 = zext i8 %param_2.13814 to i32
  %constant_780_7 = load i32, ptr @124, align 4
  %24 = icmp eq i32 %23, %constant_780_7
  %25 = zext i1 %24 to i8
  %26 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %25, ptr %26, align 1
  br label %dynamic-update-slice.2076.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_48(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(20) %arg2) {
entry:
  %param_1.1542 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_39 = load i64, ptr @129, align 8
  %0 = icmp slt i64 %param_1.1542, %constant_770_39
  %1 = zext i1 %0 to i8
  %param_1.15421 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_65 = load i64, ptr @128, align 8
  %2 = add i64 %param_1.15421, %constant_769_65
  %param_1.15422 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15422
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_393 = load i64, ptr @129, align 8
  %9 = icmp sge i64 0, %constant_770_393
  %10 = select i1 %9, i64 0, i64 %constant_770_393
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_394 = load i64, ptr @129, align 8
  %13 = icmp sge i64 0, %constant_770_394
  %14 = select i1 %13, i64 0, i64 %constant_770_394
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 20
  %24 = udiv i64 %linear_index0, 20
  %25 = icmp ult i64 %linear_index, 20
  br i1 %25, label %dynamic-update-slice.2077.1.in_bounds-true, label %dynamic-update-slice.2077.1.in_bounds-after

dynamic-update-slice.2077.1.in_bounds-after:      ; preds = %dynamic-update-slice.2077.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2077.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i8, ptr %arg2, i64 %linear_index
  %param_2.1380 = getelementptr inbounds i8, ptr %29, i64 0
  %param_2.13805 = load i8, ptr %param_2.1380, align 1, !invariant.load !191
  %30 = zext i8 %param_2.13805 to i32
  %constant_780_6 = load i32, ptr @127, align 4
  %31 = icmp eq i32 %30, %constant_780_6
  %32 = zext i1 %31 to i8
  %33 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %32, ptr %33, align 1
  br label %dynamic-update-slice.2077.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_52(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(20) %arg2) {
entry:
  %param_1.1513 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_10 = load i64, ptr @132, align 8
  %0 = icmp slt i64 %param_1.1513, %constant_770_10
  %1 = zext i1 %0 to i8
  %param_1.15131 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_58 = load i64, ptr @131, align 8
  %2 = add i64 %param_1.15131, %constant_769_58
  %param_1.15132 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15132
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_103 = load i64, ptr @132, align 8
  %9 = icmp sge i64 0, %constant_770_103
  %10 = select i1 %9, i64 0, i64 %constant_770_103
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2072.1.in_bounds-true, label %dynamic-update-slice.2072.1.in_bounds-after

dynamic-update-slice.2072.1.in_bounds-after:      ; preds = %dynamic-update-slice.2072.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2072.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i8, ptr %arg2, i64 %linear_index
  %param_2.1383 = getelementptr inbounds i8, ptr %22, i64 0
  %param_2.13834 = load i8, ptr %param_2.1383, align 1, !invariant.load !191
  %23 = zext i8 %param_2.13834 to i32
  %constant_781_4 = load i32, ptr @130, align 4
  %24 = icmp eq i32 %23, %constant_781_4
  %25 = zext i1 %24 to i8
  %26 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %25, ptr %26, align 1
  br label %dynamic-update-slice.2072.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_51(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(20) %arg2) {
entry:
  %param_1.1592 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_89 = load i64, ptr @135, align 8
  %0 = icmp slt i64 %param_1.1592, %constant_770_89
  %1 = zext i1 %0 to i8
  %param_1.15921 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_59 = load i64, ptr @134, align 8
  %2 = add i64 %param_1.15921, %constant_769_59
  %param_1.15922 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15922
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_893 = load i64, ptr @135, align 8
  %9 = icmp sge i64 0, %constant_770_893
  %10 = select i1 %9, i64 0, i64 %constant_770_893
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_894 = load i64, ptr @135, align 8
  %13 = icmp sge i64 0, %constant_770_894
  %14 = select i1 %13, i64 0, i64 %constant_770_894
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 20
  %24 = udiv i64 %linear_index0, 20
  %25 = icmp ult i64 %linear_index, 20
  br i1 %25, label %dynamic-update-slice.2073.1.in_bounds-true, label %dynamic-update-slice.2073.1.in_bounds-after

dynamic-update-slice.2073.1.in_bounds-after:      ; preds = %dynamic-update-slice.2073.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2073.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i8, ptr %arg2, i64 %linear_index
  %param_2.1382 = getelementptr inbounds i8, ptr %29, i64 0
  %param_2.13825 = load i8, ptr %param_2.1382, align 1, !invariant.load !191
  %30 = zext i8 %param_2.13825 to i32
  %constant_781_2 = load i32, ptr @133, align 4
  %31 = icmp eq i32 %30, %constant_781_2
  %32 = zext i1 %31 to i8
  %33 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %32, ptr %33, align 1
  br label %dynamic-update-slice.2073.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_53(ptr noalias align 128 dereferenceable(15360) %arg0, ptr noalias align 128 dereferenceable(20) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1251 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_6 = load i64, ptr @137, align 8
  %0 = icmp slt i64 %param_2.1251, %constant_770_6
  %1 = zext i1 %0 to i8
  %param_2.12511 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_57 = load i64, ptr @136, align 8
  %2 = add i64 %param_2.12511, %constant_769_57
  %param_2.12512 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.12512
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_63 = load i64, ptr @137, align 8
  %9 = icmp sge i64 0, %constant_770_63
  %10 = select i1 %9, i64 0, i64 %constant_770_63
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2071.1.in_bounds-true, label %dynamic-update-slice.2071.1.in_bounds-after

dynamic-update-slice.2071.1.in_bounds-after:      ; preds = %dynamic-update-slice.2071.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2071.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i8, ptr %arg1, i64 %linear_index
  %param_1.1510 = getelementptr inbounds i8, ptr %22, i64 0
  %param_1.15104 = load i8, ptr %param_1.1510, align 1, !invariant.load !191
  %23 = zext i8 %param_1.15104 to i32
  %24 = getelementptr inbounds [192 x [20 x i32]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i32 %23, ptr %24, align 4
  br label %dynamic-update-slice.2071.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_50(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_1.1532 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_29 = load i64, ptr @140, align 8
  %0 = icmp slt i64 %param_1.1532, %constant_770_29
  %1 = zext i1 %0 to i8
  %param_1.15321 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_63 = load i64, ptr @139, align 8
  %2 = add i64 %param_1.15321, %constant_769_63
  %param_1.15322 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15322
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_293 = load i64, ptr @140, align 8
  %9 = icmp sge i64 0, %constant_770_293
  %10 = select i1 %9, i64 0, i64 %constant_770_293
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2075.1.in_bounds-true, label %dynamic-update-slice.2075.1.in_bounds-after

dynamic-update-slice.2075.1.in_bounds-after:      ; preds = %dynamic-update-slice.2075.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2075.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_772_28 = load double, ptr @138, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1273 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.12734 = load double, ptr %param_2.1273, align 8, !invariant.load !191
  %param_4.909 = getelementptr inbounds [1 x double], ptr %arg4, i64 0, i64 0
  %param_4.9095 = load double, ptr %param_4.909, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1114 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11146 = load double, ptr %param_3.1114, align 8, !invariant.load !191
  %24 = call double @__nv_exp(double %param_3.11146)
  %multiply.3524.25 = fmul double %param_4.9095, %24
  %add.1044.5 = fadd double %param_2.12734, %multiply.3524.25
  %multiply.3578.6 = fmul double %add.1044.5, %add.1044.5
  %divide.879.3 = fdiv double %constant_772_28, %multiply.3578.6
  %25 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.879.3, ptr %25, align 8
  br label %dynamic-update-slice.2075.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_57(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %param_1.1603 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_100 = load i64, ptr @144, align 8
  %0 = icmp slt i64 %param_1.1603, %constant_770_100
  %1 = zext i1 %0 to i8
  %param_1.16031 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_53 = load i64, ptr @143, align 8
  %2 = add i64 %param_1.16031, %constant_769_53
  %param_1.16032 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.16032
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_1003 = load i64, ptr @144, align 8
  %9 = icmp sge i64 0, %constant_770_1003
  %10 = select i1 %9, i64 0, i64 %constant_770_1003
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2067.1.in_bounds-true, label %dynamic-update-slice.2067.1.in_bounds-after

dynamic-update-slice.2067.1.in_bounds-after:      ; preds = %dynamic-update-slice.2067.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2067.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_772_12 = load double, ptr @142, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1344 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.13444 = load double, ptr %param_2.1344, align 8, !invariant.load !191
  %constant_779_10 = load double, ptr @141, align 8
  %multiply.3527.17 = fmul double %param_2.13444, %constant_779_10
  %divide.868.7 = fdiv double %constant_772_12, %multiply.3527.17
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.868.7, ptr %23, align 8
  br label %dynamic-update-slice.2067.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_56(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4) {
entry:
  %param_2.1346 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_102 = load i64, ptr @146, align 8
  %0 = icmp slt i64 %param_2.1346, %constant_770_102
  %1 = zext i1 %0 to i8
  %param_2.13461 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_54 = load i64, ptr @145, align 8
  %2 = add i64 %param_2.13461, %constant_769_54
  %param_2.13462 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13462
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_1023 = load i64, ptr @146, align 8
  %9 = icmp sge i64 0, %constant_770_1023
  %10 = select i1 %9, i64 0, i64 %constant_770_1023
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2068.1.in_bounds-true, label %dynamic-update-slice.2068.1.in_bounds-after

dynamic-update-slice.2068.1.in_bounds-after:      ; preds = %dynamic-update-slice.2068.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2068.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.938 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.9384 = load double, ptr %param_4.938, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1157 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11575 = load double, ptr %param_3.1157, align 8, !invariant.load !191
  %multiply.3525.5 = fmul double %param_4.9384, %param_3.11575
  %24 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1605 = getelementptr inbounds double, ptr %24, i64 0
  %param_1.16056 = load double, ptr %param_1.1605, align 8, !invariant.load !191
  %multiply.3526.3 = fmul double %multiply.3525.5, %param_1.16056
  %25 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3526.3, ptr %25, align 8
  br label %dynamic-update-slice.2068.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_65(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(768) %arg3) {
entry:
  %param_2.1325 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_81 = load i64, ptr @148, align 8
  %0 = icmp slt i64 %param_2.1325, %constant_770_81
  %1 = zext i1 %0 to i8
  %param_2.13251 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_43 = load i64, ptr @147, align 8
  %2 = add i64 %param_2.13251, %constant_769_43
  %param_2.13252 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13252
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_813 = load i64, ptr @148, align 8
  %9 = icmp sge i64 0, %constant_770_813
  %10 = select i1 %9, i64 0, i64 %constant_770_813
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2059.1.in_bounds-true, label %dynamic-update-slice.2059.1.in_bounds-after

dynamic-update-slice.2059.1.in_bounds-after:      ; preds = %dynamic-update-slice.2059.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2059.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1584 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.15844 = load double, ptr %param_1.1584, align 8, !invariant.load !191
  %param_2.13255 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_816 = load i64, ptr @148, align 8
  %23 = icmp slt i64 %param_2.13255, %constant_770_816
  %24 = zext i1 %23 to i8
  %param_2.13257 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_438 = load i64, ptr @147, align 8
  %25 = add i64 %param_2.13257, %constant_769_438
  %param_2.13259 = load i64, ptr %arg2, align 8, !invariant.load !191
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_2.13259
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.55.27.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.55.27.start_idx0, 0
  %param_3.1144 = getelementptr inbounds [192 x i32], ptr %arg3, i64 0, i64 %31
  %param_3.114410 = load i32, ptr %param_3.1144, align 4, !invariant.load !191
  %32 = sitofp i32 %param_3.114410 to double
  %multiply.3516.7 = fmul double %param_1.15844, %32
  %33 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3516.7, ptr %33, align 8
  br label %dynamic-update-slice.2059.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_62(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 16 dereferenceable(768) %arg8) {
entry:
  %param_1.1593 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_90 = load i64, ptr @151, align 8
  %0 = icmp slt i64 %param_1.1593, %constant_770_90
  %1 = zext i1 %0 to i8
  %param_1.15931 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_48 = load i64, ptr @150, align 8
  %2 = add i64 %param_1.15931, %constant_769_48
  %param_1.15932 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15932
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_903 = load i64, ptr @151, align 8
  %9 = icmp sge i64 0, %constant_770_903
  %10 = select i1 %9, i64 0, i64 %constant_770_903
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2062.1.in_bounds-true, label %dynamic-update-slice.2062.1.in_bounds-after

dynamic-update-slice.2062.1.in_bounds-after:      ; preds = %dynamic-update-slice.2062.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2062.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.631 = getelementptr inbounds double, ptr %22, i64 0
  %param_6.6314 = load double, ptr %param_6.631, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.479 = getelementptr inbounds double, ptr %23, i64 0
  %param_7.4795 = load double, ptr %param_7.479, align 8, !invariant.load !191
  %multiply.3498.21 = fmul double %param_6.6314, %param_7.4795
  %param_5.862 = getelementptr inbounds [1 x double], ptr %arg5, i64 0, i64 0
  %param_5.8626 = load double, ptr %param_5.862, align 8, !invariant.load !191
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.979 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.9797 = load double, ptr %param_4.979, align 8, !invariant.load !191
  %multiply.3499.23 = fmul double %param_5.8626, %param_4.9797
  %add.1031.21 = fadd double %multiply.3498.21, %multiply.3499.23
  %25 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1379 = getelementptr inbounds double, ptr %25, i64 0
  %param_2.13798 = load double, ptr %param_2.1379, align 8, !invariant.load !191
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1199 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.11999 = load double, ptr %param_3.1199, align 8, !invariant.load !191
  %param_1.159310 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_9011 = load i64, ptr @151, align 8
  %27 = icmp slt i64 %param_1.159310, %constant_770_9011
  %28 = zext i1 %27 to i8
  %param_1.159312 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_4813 = load i64, ptr @150, align 8
  %29 = add i64 %param_1.159312, %constant_769_4813
  %param_1.159314 = load i64, ptr %arg1, align 8, !invariant.load !191
  %30 = trunc i8 %28 to i1
  %31 = select i1 %30, i64 %29, i64 %param_1.159314
  %32 = icmp sge i64 0, %31
  %33 = select i1 %32, i64 0, i64 %31
  %34 = icmp sle i64 191, %33
  %dynamic-slice.55.39.start_idx0 = select i1 %34, i64 191, i64 %33
  %35 = add i64 %dynamic-slice.55.39.start_idx0, 0
  %param_8.351 = getelementptr inbounds [192 x i32], ptr %arg8, i64 0, i64 %35
  %param_8.35115 = load i32, ptr %param_8.351, align 4, !invariant.load !191
  %36 = sitofp i32 %param_8.35115 to double
  %multiply.3516.23 = fmul double %param_3.11999, %36
  %multiply.3517.19 = fmul double %param_2.13798, %multiply.3516.23
  %add.1038.19 = fadd double %add.1031.21, %multiply.3517.19
  %subtract.147.13 = fsub double %add.1038.19, %add.1031.21
  %constant_779_16 = load double, ptr @149, align 8
  %multiply.3555.3 = fmul double %subtract.147.13, %constant_779_16
  %37 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3555.3, ptr %37, align 8
  br label %dynamic-update-slice.2062.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_63(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 16 dereferenceable(768) %arg8) {
entry:
  %param_3.1149 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_88 = load i64, ptr @153, align 8
  %0 = icmp slt i64 %param_3.1149, %constant_770_88
  %1 = zext i1 %0 to i8
  %param_3.11491 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_47 = load i64, ptr @152, align 8
  %2 = add i64 %param_3.11491, %constant_769_47
  %param_3.11492 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11492
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_883 = load i64, ptr @153, align 8
  %9 = icmp sge i64 0, %constant_770_883
  %10 = select i1 %9, i64 0, i64 %constant_770_883
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2061.1.in_bounds-true, label %dynamic-update-slice.2061.1.in_bounds-after

dynamic-update-slice.2061.1.in_bounds-after:      ; preds = %dynamic-update-slice.2061.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2061.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.598 = getelementptr inbounds double, ptr %22, i64 0
  %param_6.5984 = load double, ptr %param_6.598, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.444 = getelementptr inbounds double, ptr %23, i64 0
  %param_7.4445 = load double, ptr %param_7.444, align 8, !invariant.load !191
  %multiply.3498.13 = fmul double %param_6.5984, %param_7.4445
  %param_5.823 = getelementptr inbounds [1 x double], ptr %arg5, i64 0, i64 0
  %param_5.8236 = load double, ptr %param_5.823, align 8, !invariant.load !191
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.933 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.9337 = load double, ptr %param_4.933, align 8, !invariant.load !191
  %multiply.3499.15 = fmul double %param_5.8236, %param_4.9337
  %add.1031.13 = fadd double %multiply.3498.13, %multiply.3499.15
  %25 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1591 = getelementptr inbounds double, ptr %25, i64 0
  %param_1.15918 = load double, ptr %param_1.1591, align 8, !invariant.load !191
  %26 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1332 = getelementptr inbounds double, ptr %26, i64 0
  %param_2.13329 = load double, ptr %param_2.1332, align 8, !invariant.load !191
  %param_3.114910 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_8811 = load i64, ptr @153, align 8
  %27 = icmp slt i64 %param_3.114910, %constant_770_8811
  %28 = zext i1 %27 to i8
  %param_3.114912 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_4713 = load i64, ptr @152, align 8
  %29 = add i64 %param_3.114912, %constant_769_4713
  %param_3.114914 = load i64, ptr %arg3, align 8, !invariant.load !191
  %30 = trunc i8 %28 to i1
  %31 = select i1 %30, i64 %29, i64 %param_3.114914
  %32 = icmp sge i64 0, %31
  %33 = select i1 %32, i64 0, i64 %31
  %34 = icmp sle i64 191, %33
  %dynamic-slice.55.31.start_idx0 = select i1 %34, i64 191, i64 %33
  %35 = add i64 %dynamic-slice.55.31.start_idx0, 0
  %param_8.324 = getelementptr inbounds [192 x i32], ptr %arg8, i64 0, i64 %35
  %param_8.32415 = load i32, ptr %param_8.324, align 4, !invariant.load !191
  %36 = sitofp i32 %param_8.32415 to double
  %multiply.3516.13 = fmul double %param_2.13329, %36
  %multiply.3517.9 = fmul double %param_1.15918, %multiply.3516.13
  %add.1038.9 = fadd double %add.1031.13, %multiply.3517.9
  %subtract.147.3 = fsub double %add.1038.9, %add.1031.13
  %multiply.3520.3 = fmul double %subtract.147.3, %subtract.147.3
  %37 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3520.3, ptr %37, align 8
  br label %dynamic-update-slice.2061.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_46(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3) {
entry:
  %param_1.1550 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_47 = load i64, ptr @155, align 8
  %0 = icmp slt i64 %param_1.1550, %constant_770_47
  %1 = zext i1 %0 to i8
  %param_1.15501 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_71 = load i64, ptr @154, align 8
  %2 = add i64 %param_1.15501, %constant_769_71
  %param_1.15502 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15502
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_473 = load i64, ptr @155, align 8
  %9 = icmp sge i64 0, %constant_770_473
  %10 = select i1 %9, i64 0, i64 %constant_770_473
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2079.1.in_bounds-true, label %dynamic-update-slice.2079.1.in_bounds-after

dynamic-update-slice.2079.1.in_bounds-after:      ; preds = %dynamic-update-slice.2079.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2079.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1126 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.11264 = load double, ptr %param_3.1126, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1291 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.12915 = load double, ptr %param_2.1291, align 8, !invariant.load !191
  %multiply.3525.3 = fmul double %param_3.11264, %param_2.12915
  %multiply.3530.4 = fmul double %multiply.3525.3, %multiply.3525.3
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3530.4, ptr %24, align 8
  br label %dynamic-update-slice.2079.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_43(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3) {
entry:
  %param_1.1571 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_68 = load i64, ptr @158, align 8
  %0 = icmp slt i64 %param_1.1571, %constant_770_68
  %1 = zext i1 %0 to i8
  %param_1.15711 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_74 = load i64, ptr @157, align 8
  %2 = add i64 %param_1.15711, %constant_769_74
  %param_1.15712 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15712
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_683 = load i64, ptr @158, align 8
  %9 = icmp sge i64 0, %constant_770_683
  %10 = select i1 %9, i64 0, i64 %constant_770_683
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2082.1.in_bounds-true, label %dynamic-update-slice.2082.1.in_bounds-after

dynamic-update-slice.2082.1.in_bounds-after:      ; preds = %dynamic-update-slice.2082.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2082.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1206 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.12064 = load double, ptr %param_3.1206, align 8, !invariant.load !191
  %multiply.3533.15 = fmul double %param_3.12064, %param_3.12064
  %constant_782_7 = load double, ptr @156, align 8
  %multiply.3534.13 = fmul double %multiply.3533.15, %constant_782_7
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1312 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.13125 = load double, ptr %param_2.1312, align 8, !invariant.load !191
  %multiply.3535.7 = fmul double %multiply.3534.13, %param_2.13125
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3535.7, ptr %24, align 8
  br label %dynamic-update-slice.2082.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_58(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3) {
entry:
  %param_1.1601 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_98 = load i64, ptr @160, align 8
  %0 = icmp slt i64 %param_1.1601, %constant_770_98
  %1 = zext i1 %0 to i8
  %param_1.16011 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_52 = load i64, ptr @159, align 8
  %2 = add i64 %param_1.16011, %constant_769_52
  %param_1.16012 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.16012
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_983 = load i64, ptr @160, align 8
  %9 = icmp sge i64 0, %constant_770_983
  %10 = select i1 %9, i64 0, i64 %constant_770_983
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2066.1.in_bounds-true, label %dynamic-update-slice.2066.1.in_bounds-after

dynamic-update-slice.2066.1.in_bounds-after:      ; preds = %dynamic-update-slice.2066.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2066.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1154 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.11544 = load double, ptr %param_3.1154, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1342 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.13425 = load double, ptr %param_2.1342, align 8, !invariant.load !191
  %multiply.3525.11 = fmul double %param_3.11544, %param_2.13425
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3525.11, ptr %24, align 8
  br label %dynamic-update-slice.2066.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_47(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3) {
entry:
  %param_1.1620 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_23 = load i64, ptr @163, align 8
  %0 = icmp slt i64 %param_1.1620, %constant_770_23
  %1 = zext i1 %0 to i8
  %param_1.16201 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_68 = load i64, ptr @162, align 8
  %2 = add i64 %param_1.16201, %constant_769_68
  %param_1.16202 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.16202
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_233 = load i64, ptr @163, align 8
  %9 = icmp sge i64 0, %constant_770_233
  %10 = select i1 %9, i64 0, i64 %constant_770_233
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !196
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.2078.1.in_bounds-true, label %dynamic-update-slice.2078.1.in_bounds-after

dynamic-update-slice.2078.1.in_bounds-after:      ; preds = %dynamic-update-slice.2078.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2078.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1195 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.11954 = load double, ptr %param_3.1195, align 8, !invariant.load !191
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1376 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.13765 = load double, ptr %param_2.1376, align 8, !invariant.load !191
  %multiply.3525.19 = fmul double %param_3.11954, %param_2.13765
  %constant_779_11 = load double, ptr @161, align 8
  %multiply.3582.3 = fmul double %multiply.3525.19, %constant_779_11
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.3582.3, ptr %24, align 8
  br label %dynamic-update-slice.2078.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_7(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(19200) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(20) %arg4) {
entry:
  %param_3.1186 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_53 = load i64, ptr @167, align 8
  %0 = icmp slt i64 %param_3.1186, %constant_770_53
  %1 = zext i1 %0 to i8
  %param_3.11861 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_69 = load i64, ptr @166, align 8
  %2 = add i64 %param_3.11861, %constant_769_69
  %param_3.11862 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11862
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_533 = load i64, ptr @167, align 8
  %9 = icmp sge i64 0, %constant_770_533
  %10 = select i1 %9, i64 0, i64 %constant_770_533
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_534 = load i64, ptr @167, align 8
  %13 = icmp sge i64 0, %constant_770_534
  %14 = select i1 %13, i64 0, i64 %constant_770_534
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2119.1.in_bounds-true, label %dynamic-update-slice.2119.1.in_bounds-after

dynamic-update-slice.2119.1.in_bounds-after:      ; preds = %dynamic-update-slice.2119.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2119.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_4.981 = getelementptr inbounds [20 x i8], ptr %arg4, i64 0, i64 %21
  %param_4.9815 = load i8, ptr %param_4.981, align 1, !invariant.load !191
  %29 = zext i8 %param_4.9815 to i32
  %constant_781_6 = load i32, ptr @165, align 4
  %30 = icmp eq i32 %29, %constant_781_6
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1297 = getelementptr inbounds double, ptr %32, i64 0
  %param_2.12976 = load double, ptr %param_2.1297, align 8, !invariant.load !191
  %constant_776_19 = load double, ptr @164, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_2.12976, double %constant_776_19
  %param_1.1556 = getelementptr inbounds [20 x double], ptr %arg1, i64 0, i64 %21
  %param_1.15567 = load double, ptr %param_1.1556, align 8, !invariant.load !191
  %multiply.3619.3 = fmul double %34, %param_1.15567
  %35 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3619.3, ptr %35, align 8
  br label %dynamic-update-slice.2119.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_38(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.1148 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_87 = load i64, ptr @169, align 8
  %0 = icmp slt i64 %param_3.1148, %constant_770_87
  %1 = zext i1 %0 to i8
  %param_3.11481 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_80 = load i64, ptr @168, align 8
  %2 = add i64 %param_3.11481, %constant_769_80
  %param_3.11482 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11482
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_873 = load i64, ptr @169, align 8
  %9 = icmp sge i64 0, %constant_770_873
  %10 = select i1 %9, i64 0, i64 %constant_770_873
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_874 = load i64, ptr @169, align 8
  %13 = icmp sge i64 0, %constant_770_874
  %14 = select i1 %13, i64 0, i64 %constant_770_874
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2087.1.in_bounds-true, label %dynamic-update-slice.2087.1.in_bounds-after

dynamic-update-slice.2087.1.in_bounds-after:      ; preds = %dynamic-update-slice.2087.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2087.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1590 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.15905 = load double, ptr %param_1.1590, align 8, !invariant.load !191
  %param_2.1331 = getelementptr inbounds [20 x double], ptr %arg2, i64 0, i64 %21
  %param_2.13316 = load double, ptr %param_2.1331, align 8, !invariant.load !191
  %multiply.3599.3 = fmul double %param_1.15905, %param_2.13316
  %30 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3599.3, ptr %30, align 8
  br label %dynamic-update-slice.2087.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_10(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(19200) %arg4, ptr noalias align 16 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(19200) %arg8) {
entry:
  %param_1.1566 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_63 = load i64, ptr @174, align 8
  %0 = icmp slt i64 %param_1.1566, %constant_770_63
  %1 = zext i1 %0 to i8
  %param_1.15661 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_95 = load i64, ptr @173, align 8
  %2 = add i64 %param_1.15661, %constant_769_95
  %param_1.15662 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15662
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_633 = load i64, ptr @174, align 8
  %9 = icmp sge i64 0, %constant_770_633
  %10 = select i1 %9, i64 0, i64 %constant_770_633
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_634 = load i64, ptr @174, align 8
  %13 = icmp sge i64 0, %constant_770_634
  %14 = select i1 %13, i64 0, i64 %constant_770_634
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2116.1.in_bounds-true, label %dynamic-update-slice.2116.1.in_bounds-after

dynamic-update-slice.2116.1.in_bounds-after:      ; preds = %dynamic-update-slice.2116.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2116.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.350 = getelementptr inbounds double, ptr %29, i64 0
  %param_8.3505 = load double, ptr %param_8.350, align 8, !invariant.load !191
  %30 = fneg double %param_8.3505
  %param_7.477 = getelementptr inbounds [20 x double], ptr %arg7, i64 0, i64 %21
  %param_7.4776 = load double, ptr %param_7.477, align 8, !invariant.load !191
  %multiply.3560.19 = fmul double %30, %param_7.4776
  %param_6.629 = getelementptr inbounds [1 x double], ptr %arg6, i64 0, i64 0
  %param_6.6297 = load double, ptr %param_6.629, align 8, !invariant.load !191
  %param_5.860 = getelementptr inbounds [20 x double], ptr %arg5, i64 0, i64 %21
  %param_5.8608 = load double, ptr %param_5.860, align 8, !invariant.load !191
  %31 = call double @__nv_exp(double %param_5.8608)
  %multiply.3524.55 = fmul double %param_6.6297, %31
  %constant_774_24 = load double, ptr @172, align 8
  %compare.377.25 = fcmp ogt double %multiply.3524.55, %constant_774_24
  %32 = zext i1 %compare.377.25 to i8
  %33 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.977 = getelementptr inbounds double, ptr %33, i64 0
  %param_4.9779 = load double, ptr %param_4.977, align 8, !invariant.load !191
  %multiply.3561.21 = fmul double %param_4.9779, %31
  %multiply.3562.49 = fmul double %param_6.6297, %multiply.3561.21
  %constant_776_21 = load double, ptr @171, align 8
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, double %multiply.3562.49, double %constant_776_21
  %add.1055.37 = fadd double %multiply.3560.19, %35
  %36 = fneg double %add.1055.37
  %param_3.1197 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.119710 = load double, ptr %param_3.1197, align 8, !invariant.load !191
  %multiply.3564.29 = fmul double %36, %param_3.119710
  %constant_779_14 = load double, ptr @170, align 8
  %multiply.3570.7 = fmul double %multiply.3564.29, %constant_779_14
  %37 = fneg double %multiply.3570.7
  %param_2.1307 = getelementptr inbounds [20 x double], ptr %arg2, i64 0, i64 %21
  %param_2.130711 = load double, ptr %param_2.1307, align 8, !invariant.load !191
  %multiply.3572.3 = fmul double %37, %param_2.130711
  %38 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3572.3, ptr %38, align 8
  br label %dynamic-update-slice.2116.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_34(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(19200) %arg4, ptr noalias align 16 dereferenceable(19200) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 16 dereferenceable(160) %arg8) {
entry:
  %param_2.1368 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_15 = load i64, ptr @180, align 8
  %0 = icmp slt i64 %param_2.1368, %constant_770_15
  %1 = zext i1 %0 to i8
  %param_2.13681 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_85 = load i64, ptr @179, align 8
  %2 = add i64 %param_2.13681, %constant_769_85
  %param_2.13682 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13682
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_153 = load i64, ptr @180, align 8
  %9 = icmp sge i64 0, %constant_770_153
  %10 = select i1 %9, i64 0, i64 %constant_770_153
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_154 = load i64, ptr @180, align 8
  %13 = icmp sge i64 0, %constant_770_154
  %14 = select i1 %13, i64 0, i64 %constant_770_154
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2091.1.in_bounds-true, label %dynamic-update-slice.2091.1.in_bounds-after

dynamic-update-slice.2091.1.in_bounds-after:      ; preds = %dynamic-update-slice.2091.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2091.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.965 = getelementptr inbounds double, ptr %29, i64 0
  %param_4.9655 = load double, ptr %param_4.965, align 8, !invariant.load !191
  %30 = fneg double %param_4.9655
  %param_3.1183 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11836 = load double, ptr %param_3.1183, align 8, !invariant.load !191
  %multiply.3560.7 = fmul double %30, %param_3.11836
  %param_1.1614 = getelementptr inbounds [1 x double], ptr %arg1, i64 0, i64 0
  %param_1.16147 = load double, ptr %param_1.1614, align 8, !invariant.load !191
  %param_6.617 = getelementptr inbounds [20 x double], ptr %arg6, i64 0, i64 %21
  %param_6.6178 = load double, ptr %param_6.617, align 8, !invariant.load !191
  %31 = call double @__nv_exp(double %param_6.6178)
  %multiply.3524.45 = fmul double %param_1.16147, %31
  %constant_774_20 = load double, ptr @176, align 8
  %compare.377.15 = fcmp ogt double %multiply.3524.45, %constant_774_20
  %32 = zext i1 %compare.377.15 to i8
  %33 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.849 = getelementptr inbounds double, ptr %33, i64 0
  %param_5.8499 = load double, ptr %param_5.849, align 8, !invariant.load !191
  %multiply.3561.11 = fmul double %param_5.8499, %31
  %multiply.3562.47 = fmul double %param_1.16147, %multiply.3561.11
  %constant_776_15 = load double, ptr @178, align 8
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, double %multiply.3562.47, double %constant_776_15
  %add.1055.35 = fadd double %multiply.3560.7, %35
  %constant_772_21 = load double, ptr @177, align 8
  %param_7.471 = getelementptr inbounds [20 x double], ptr %arg7, i64 0, i64 %21
  %param_7.47110 = load double, ptr %param_7.471, align 8, !invariant.load !191
  %param_8.345 = getelementptr inbounds [20 x double], ptr %arg8, i64 0, i64 %21
  %param_8.34511 = load double, ptr %param_8.345, align 8, !invariant.load !191
  %36 = trunc i8 %32 to i1
  %37 = select i1 %36, double %multiply.3524.45, double %param_8.34511
  %add.1042.5 = fadd double %param_7.47110, %37
  %multiply.3563.6 = fmul double %add.1042.5, %add.1042.5
  %multiply.3600.5 = fmul double %add.1042.5, %multiply.3563.6
  %divide.881.3 = fdiv double %constant_772_21, %multiply.3600.5
  %constant_777_3 = load double, ptr @175, align 8
  %multiply.3601.3 = fmul double %divide.881.3, %constant_777_3
  %multiply.3602.3 = fmul double %add.1055.35, %multiply.3601.3
  %38 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3602.3, ptr %38, align 8
  br label %dynamic-update-slice.2091.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_5(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(19200) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(20) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 16 dereferenceable(19200) %arg7, ptr noalias align 128 dereferenceable(160) %arg8) {
entry:
  %param_4.955 = load i64, ptr %arg4, align 8, !invariant.load !191
  %constant_770_45 = load i64, ptr @186, align 8
  %0 = icmp slt i64 %param_4.955, %constant_770_45
  %1 = zext i1 %0 to i8
  %param_4.9551 = load i64, ptr %arg4, align 8, !invariant.load !191
  %constant_769_70 = load i64, ptr @185, align 8
  %2 = add i64 %param_4.9551, %constant_769_70
  %param_4.9552 = load i64, ptr %arg4, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.9552
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_453 = load i64, ptr @186, align 8
  %9 = icmp sge i64 0, %constant_770_453
  %10 = select i1 %9, i64 0, i64 %constant_770_453
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_454 = load i64, ptr @186, align 8
  %13 = icmp sge i64 0, %constant_770_454
  %14 = select i1 %13, i64 0, i64 %constant_770_454
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2121.1.in_bounds-true, label %dynamic-update-slice.2121.1.in_bounds-after

dynamic-update-slice.2121.1.in_bounds-after:      ; preds = %dynamic-update-slice.2121.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2121.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_5.864 = getelementptr inbounds [20 x i8], ptr %arg5, i64 0, i64 %21
  %param_5.8645 = load i8, ptr %param_5.864, align 1, !invariant.load !191
  %29 = zext i8 %param_5.8645 to i32
  %constant_781_1 = load i32, ptr @184, align 4
  %30 = icmp eq i32 %29, %constant_781_1
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1124 = getelementptr inbounds double, ptr %32, i64 0
  %param_3.11246 = load double, ptr %param_3.1124, align 8, !invariant.load !191
  %constant_776_5 = load double, ptr @183, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_3.11246, double %constant_776_5
  %35 = fneg double %34
  %param_2.1289 = getelementptr inbounds [20 x double], ptr %arg2, i64 0, i64 %21
  %param_2.12897 = load double, ptr %param_2.1289, align 8, !invariant.load !191
  %multiply.3575.5 = fmul double %35, %param_2.12897
  %param_1.1548 = getelementptr inbounds [1 x double], ptr %arg1, i64 0, i64 0
  %param_1.15488 = load double, ptr %param_1.1548, align 8, !invariant.load !191
  %36 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.482 = getelementptr inbounds double, ptr %36, i64 0
  %param_7.4829 = load double, ptr %param_7.482, align 8, !invariant.load !191
  %37 = trunc i8 %31 to i1
  %38 = select i1 %37, double %param_7.4829, double %constant_776_5
  %param_6.635 = getelementptr inbounds [20 x double], ptr %arg6, i64 0, i64 %21
  %param_6.63510 = load double, ptr %param_6.635, align 8, !invariant.load !191
  %39 = call double @__nv_exp(double %param_6.63510)
  %multiply.3576.7 = fmul double %38, %39
  %multiply.3577.13 = fmul double %param_1.15488, %multiply.3576.7
  %add.1061.11 = fadd double %multiply.3575.5, %multiply.3577.13
  %constant_772_3 = load double, ptr @182, align 8
  %param_8.353 = getelementptr inbounds [20 x double], ptr %arg8, i64 0, i64 %21
  %param_8.35311 = load double, ptr %param_8.353, align 8, !invariant.load !191
  %multiply.3524.29 = fmul double %param_1.15488, %39
  %add.1044.9 = fadd double %param_8.35311, %multiply.3524.29
  %multiply.3578.10 = fmul double %add.1044.9, %add.1044.9
  %multiply.3620.5 = fmul double %add.1044.9, %multiply.3578.10
  %divide.887.3 = fdiv double %constant_772_3, %multiply.3620.5
  %constant_777_1 = load double, ptr @181, align 8
  %multiply.3621.3 = fmul double %divide.887.3, %constant_777_1
  %multiply.3622.3 = fmul double %add.1061.11, %multiply.3621.3
  %40 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3622.3, ptr %40, align 8
  br label %dynamic-update-slice.2121.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_8(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(19200) %arg5, ptr noalias align 16 dereferenceable(19200) %arg6, ptr noalias align 16 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8) {
entry:
  %param_3.1174 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_56 = load i64, ptr @193, align 8
  %0 = icmp slt i64 %param_3.1174, %constant_770_56
  %1 = zext i1 %0 to i8
  %param_3.11741 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_84 = load i64, ptr @192, align 8
  %2 = add i64 %param_3.11741, %constant_769_84
  %param_3.11742 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11742
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_563 = load i64, ptr @193, align 8
  %9 = icmp sge i64 0, %constant_770_563
  %10 = select i1 %9, i64 0, i64 %constant_770_563
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_564 = load i64, ptr @193, align 8
  %13 = icmp sge i64 0, %constant_770_564
  %14 = select i1 %13, i64 0, i64 %constant_770_564
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2118.1.in_bounds-true, label %dynamic-update-slice.2118.1.in_bounds-after

dynamic-update-slice.2118.1.in_bounds-after:      ; preds = %dynamic-update-slice.2118.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2118.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.840 = getelementptr inbounds double, ptr %29, i64 0
  %param_5.8405 = load double, ptr %param_5.840, align 8, !invariant.load !191
  %30 = fneg double %param_5.8405
  %param_4.953 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9536 = load double, ptr %param_4.953, align 8, !invariant.load !191
  %multiply.3560.17 = fmul double %30, %param_4.9536
  %param_2.1360 = getelementptr inbounds [1 x double], ptr %arg2, i64 0, i64 0
  %param_2.13607 = load double, ptr %param_2.1360, align 8, !invariant.load !191
  %param_7.457 = getelementptr inbounds [20 x double], ptr %arg7, i64 0, i64 %21
  %param_7.4578 = load double, ptr %param_7.457, align 8, !invariant.load !191
  %31 = call double @__nv_exp(double %param_7.4578)
  %multiply.3524.33 = fmul double %param_2.13607, %31
  %constant_774_14 = load double, ptr @191, align 8
  %compare.377.3 = fcmp ogt double %multiply.3524.33, %constant_774_14
  %32 = zext i1 %compare.377.3 to i8
  %33 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.610 = getelementptr inbounds double, ptr %33, i64 0
  %param_6.6109 = load double, ptr %param_6.610, align 8, !invariant.load !191
  %multiply.3561.19 = fmul double %param_6.6109, %31
  %multiply.3562.45 = fmul double %param_2.13607, %multiply.3561.19
  %constant_776_2 = load double, ptr @190, align 8
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, double %multiply.3562.45, double %constant_776_2
  %add.1055.33 = fadd double %multiply.3560.17, %35
  %36 = fneg double %add.1055.33
  %param_1.1559 = getelementptr inbounds [20 x double], ptr %arg1, i64 0, i64 %21
  %param_1.155910 = load double, ptr %param_1.1559, align 8, !invariant.load !191
  %multiply.3564.27 = fmul double %36, %param_1.155910
  %constant_772_1 = load double, ptr @189, align 8
  %param_8.356 = getelementptr inbounds [20 x double], ptr %arg8, i64 0, i64 %21
  %param_8.35611 = load double, ptr %param_8.356, align 8, !invariant.load !191
  %constant_779_6 = load double, ptr @188, align 8
  %multiply.3527.11 = fmul double %param_8.35611, %constant_779_6
  %multiply.3571.6 = fmul double %multiply.3527.11, %multiply.3527.11
  %multiply.3616.5 = fmul double %multiply.3527.11, %multiply.3571.6
  %divide.886.3 = fdiv double %constant_772_1, %multiply.3616.5
  %constant_785_1 = load double, ptr @187, align 8
  %multiply.3617.3 = fmul double %divide.886.3, %constant_785_1
  %multiply.3618.3 = fmul double %multiply.3564.27, %multiply.3617.3
  %37 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3618.3, ptr %37, align 8
  br label %dynamic-update-slice.2118.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_36(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(19200) %arg5, ptr noalias align 16 dereferenceable(19200) %arg6, ptr noalias align 16 dereferenceable(160) %arg7) {
entry:
  %param_3.1182 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_27 = load i64, ptr @197, align 8
  %0 = icmp slt i64 %param_3.1182, %constant_770_27
  %1 = zext i1 %0 to i8
  %param_3.11821 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_82 = load i64, ptr @196, align 8
  %2 = add i64 %param_3.11821, %constant_769_82
  %param_3.11822 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11822
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_273 = load i64, ptr @197, align 8
  %9 = icmp sge i64 0, %constant_770_273
  %10 = select i1 %9, i64 0, i64 %constant_770_273
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_274 = load i64, ptr @197, align 8
  %13 = icmp sge i64 0, %constant_770_274
  %14 = select i1 %13, i64 0, i64 %constant_770_274
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2089.1.in_bounds-true, label %dynamic-update-slice.2089.1.in_bounds-after

dynamic-update-slice.2089.1.in_bounds-after:      ; preds = %dynamic-update-slice.2089.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2089.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.848 = getelementptr inbounds double, ptr %29, i64 0
  %param_5.8485 = load double, ptr %param_5.848, align 8, !invariant.load !191
  %30 = fneg double %param_5.8485
  %param_4.964 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9646 = load double, ptr %param_4.964, align 8, !invariant.load !191
  %multiply.3560.5 = fmul double %30, %param_4.9646
  %param_1.1530 = getelementptr inbounds [1 x double], ptr %arg1, i64 0, i64 0
  %param_1.15307 = load double, ptr %param_1.1530, align 8, !invariant.load !191
  %param_7.463 = getelementptr inbounds [20 x double], ptr %arg7, i64 0, i64 %21
  %param_7.4638 = load double, ptr %param_7.463, align 8, !invariant.load !191
  %31 = call double @__nv_exp(double %param_7.4638)
  %multiply.3524.43 = fmul double %param_1.15307, %31
  %constant_774_19 = load double, ptr @195, align 8
  %compare.377.13 = fcmp ogt double %multiply.3524.43, %constant_774_19
  %32 = zext i1 %compare.377.13 to i8
  %33 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.616 = getelementptr inbounds double, ptr %33, i64 0
  %param_6.6169 = load double, ptr %param_6.616, align 8, !invariant.load !191
  %multiply.3561.9 = fmul double %param_6.6169, %31
  %multiply.3562.29 = fmul double %param_1.15307, %multiply.3561.9
  %constant_776_14 = load double, ptr @194, align 8
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, double %multiply.3562.29, double %constant_776_14
  %add.1055.19 = fadd double %multiply.3560.5, %35
  %36 = fneg double %add.1055.19
  %param_2.1367 = getelementptr inbounds [20 x double], ptr %arg2, i64 0, i64 %21
  %param_2.136710 = load double, ptr %param_2.1367, align 8, !invariant.load !191
  %multiply.3564.13 = fmul double %36, %param_2.136710
  %37 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3564.13, ptr %37, align 8
  br label %dynamic-update-slice.2089.1.in_bounds-after
}

define void @loop_add_select_fusion(ptr noalias align 128 dereferenceable(19200) %arg0, ptr noalias align 128 dereferenceable(20) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 16 dereferenceable(19200) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 16 dereferenceable(19200) %arg10, ptr noalias align 16 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(8) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 128 dereferenceable(19200) %arg14, ptr noalias align 128 dereferenceable(160) %arg15, ptr noalias align 128 dereferenceable(160) %arg16, ptr noalias align 128 dereferenceable(20) %arg17, ptr noalias align 128 dereferenceable(19200) %arg18, ptr noalias align 16 dereferenceable(160) %arg19, ptr noalias align 128 dereferenceable(19200) %arg20, ptr noalias align 128 dereferenceable(19200) %arg21, ptr noalias align 128 dereferenceable(19200) %arg22, ptr noalias align 128 dereferenceable(160) %arg23, ptr noalias align 128 dereferenceable(19200) %arg24, ptr noalias align 16 dereferenceable(160) %arg25, ptr noalias align 128 dereferenceable(19200) %arg26, ptr noalias align 128 dereferenceable(160) %arg27, ptr noalias align 16 dereferenceable(768) %arg28, ptr noalias align 128 dereferenceable(8) %arg29, ptr noalias align 16 dereferenceable(160) %arg30, ptr noalias align 128 dereferenceable(160) %arg31, ptr noalias align 128 dereferenceable(160) %arg32, ptr noalias align 128 dereferenceable(160) %arg33, ptr noalias align 128 dereferenceable(19200) %arg34, ptr noalias align 128 dereferenceable(160) %arg35, ptr noalias align 128 dereferenceable(19200) %arg36, ptr noalias align 16 dereferenceable(160) %arg37, ptr noalias align 16 dereferenceable(19200) %arg38, ptr noalias align 16 dereferenceable(160) %arg39, ptr noalias align 128 dereferenceable(160) %arg40, ptr noalias align 16 dereferenceable(160) %arg41, ptr noalias align 128 dereferenceable(19200) %arg42, ptr noalias align 128 dereferenceable(160) %arg43, ptr noalias align 128 dereferenceable(19200) %arg44, ptr noalias align 16 dereferenceable(160) %arg45, ptr noalias align 128 dereferenceable(19200) %arg46, ptr noalias align 128 dereferenceable(19200) %arg47, ptr noalias align 128 dereferenceable(160) %arg48, ptr noalias align 16 dereferenceable(30720) %arg49, ptr noalias align 128 dereferenceable(19200) %arg50, ptr noalias align 128 dereferenceable(19200) %arg51, ptr noalias align 128 dereferenceable(19200) %arg52, ptr noalias align 128 dereferenceable(19200) %arg53, ptr noalias align 128 dereferenceable(19200) %arg54, ptr noalias align 128 dereferenceable(19200) %arg55, ptr noalias align 128 dereferenceable(160) %arg56, ptr noalias align 128 dereferenceable(19200) %arg57, ptr noalias align 128 dereferenceable(19200) %arg58, ptr noalias align 128 dereferenceable(19200) %arg59, ptr noalias align 128 dereferenceable(19200) %arg60) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 2400
  br i1 %6, label %loop_add_select_fusion.in_bounds-true, label %loop_add_select_fusion.in_bounds-after

loop_add_select_fusion.in_bounds-after:           ; preds = %loop_add_select_fusion.in_bounds-true, %entry
  ret void

loop_add_select_fusion.in_bounds-true:            ; preds = %entry
  %7 = getelementptr inbounds [20 x i8], ptr %arg1, i32 0, i32 %4
  %8 = load i8, ptr %7, align 1, !invariant.load !191
  %9 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %4
  %10 = load double, ptr %9, align 8, !invariant.load !191
  %11 = getelementptr double, ptr %arg0, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8
  %multiply.3558.3 = fmul double %10, %13
  %14 = getelementptr double, ptr %arg7, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !191
  %17 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %4
  %18 = load double, ptr %17, align 8, !invariant.load !191
  %multiply.3565.11 = fmul double %16, %18
  %19 = getelementptr inbounds [20 x [1 x double]], ptr %arg6, i32 0, i32 %4, i32 0
  %20 = load double, ptr %19, align 8, !invariant.load !191
  %21 = getelementptr inbounds [1 x double], ptr %arg12, i32 0, i32 0
  %22 = load double, ptr %21, align 8, !invariant.load !191
  %23 = getelementptr inbounds [20 x double], ptr %arg39, i32 0, i32 %4
  %24 = load double, ptr %23, align 8, !invariant.load !191
  %25 = getelementptr inbounds [20 x [1 x double]], ptr %arg41, i32 0, i32 %4, i32 0
  %26 = load double, ptr %25, align 8, !invariant.load !191
  %27 = getelementptr inbounds [20 x double], ptr %arg40, i32 0, i32 %4
  %28 = load double, ptr %27, align 8, !invariant.load !191
  %multiply.3502.31.clone.1 = fmul double %26, %28
  %add.1033.29.clone.1 = fadd double %24, %multiply.3502.31.clone.1
  %29 = call double @__nv_exp(double %add.1033.29.clone.1)
  %multiply.3503.43.clone.1 = fmul double %22, %29
  %constant_774_21 = load double, ptr @201, align 8
  %compare.375.23.clone.1 = fcmp ogt double %multiply.3503.43.clone.1, %constant_774_21
  %30 = zext i1 %compare.375.23.clone.1 to i8
  %31 = getelementptr double, ptr %arg38, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  %33 = load double, ptr %32, align 8, !invariant.load !191
  %34 = getelementptr double, ptr %arg0, i32 %linear_index
  %35 = getelementptr inbounds double, ptr %34, i32 0
  %36 = load double, ptr %35, align 8
  %multiply.3510.11.clone.1 = fmul double %26, %36
  %add.1036.9.clone.1 = fadd double %33, %multiply.3510.11.clone.1
  %multiply.3511.7.clone.1 = fmul double %add.1036.9.clone.1, %29
  %multiply.3512.5.clone.1 = fmul double %22, %multiply.3511.7.clone.1
  %constant_776_16 = load double, ptr @202, align 8
  %37 = trunc i8 %30 to i1
  %38 = select i1 %37, double %multiply.3512.5.clone.1, double %constant_776_16
  %39 = getelementptr inbounds [20 x double], ptr %arg33, i32 0, i32 %4
  %40 = load double, ptr %39, align 8, !invariant.load !191
  %multiply.3550.3.clone.1 = fmul double %38, %40
  %41 = getelementptr inbounds [20 x double], ptr %arg37, i32 0, i32 %4
  %42 = load double, ptr %41, align 8, !invariant.load !191
  %43 = trunc i8 %30 to i1
  %44 = select i1 %43, double %multiply.3503.43.clone.1, double %42
  %45 = getelementptr double, ptr %arg26, i32 %linear_index
  %46 = getelementptr inbounds double, ptr %45, i32 0
  %47 = load double, ptr %46, align 8, !invariant.load !191
  %multiply.3551.1.clone.1 = fmul double %44, %47
  %add.1051.1.clone.1 = fadd double %multiply.3550.3.clone.1, %multiply.3551.1.clone.1
  %multiply.3566.11 = fmul double %20, %add.1051.1.clone.1
  %add.1057.9 = fadd double %multiply.3565.11, %multiply.3566.11
  %48 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %4
  %49 = load double, ptr %48, align 8, !invariant.load !191
  %multiply.3567.7 = fmul double %add.1057.9, %49
  %50 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %4
  %51 = load double, ptr %50, align 8, !invariant.load !191
  %multiply.3525.27 = fmul double %20, %51
  %52 = getelementptr double, ptr %arg26, i32 %linear_index
  %53 = getelementptr inbounds double, ptr %52, i32 0
  %54 = load double, ptr %53, align 8, !invariant.load !191
  %55 = getelementptr inbounds [20 x double], ptr %arg35, i32 0, i32 %4
  %56 = load double, ptr %55, align 8, !invariant.load !191
  %divide.875.5.clone.1 = fdiv double %54, %56
  %57 = getelementptr double, ptr %arg34, i32 %linear_index
  %58 = getelementptr inbounds double, ptr %57, i32 0
  %59 = load double, ptr %58, align 8
  %60 = fneg double %59
  %multiply.3552.3.clone.1 = fmul double %60, %40
  %61 = getelementptr inbounds [20 x double], ptr %arg32, i32 0, i32 %4
  %62 = load double, ptr %61, align 8, !invariant.load !191
  %multiply.3553.3.clone.1 = fmul double %multiply.3552.3.clone.1, %62
  %add.1052.3.clone.1 = fadd double %divide.875.5.clone.1, %multiply.3553.3.clone.1
  %63 = getelementptr double, ptr %arg26, i32 %linear_index
  %64 = getelementptr inbounds double, ptr %63, i32 0
  %65 = load double, ptr %64, align 8, !invariant.load !191
  %66 = getelementptr inbounds [20 x double], ptr %arg25, i32 0, i32 %4
  %67 = load double, ptr %66, align 8, !invariant.load !191
  %68 = getelementptr inbounds [20 x double], ptr %arg31, i32 0, i32 %4
  %69 = load double, ptr %68, align 8, !invariant.load !191
  %multiply.3498.19.clone.1 = fmul double %67, %69
  %70 = getelementptr inbounds [20 x double], ptr %arg30, i32 0, i32 %4
  %71 = load double, ptr %70, align 8, !invariant.load !191
  %multiply.3499.21.clone.1 = fmul double %22, %71
  %add.1031.19.clone.1 = fadd double %multiply.3498.19.clone.1, %multiply.3499.21.clone.1
  %72 = getelementptr inbounds [20 x double], ptr %arg23, i32 0, i32 %4
  %73 = load double, ptr %72, align 8, !invariant.load !191
  %74 = getelementptr inbounds [20 x double], ptr %arg27, i32 0, i32 %4
  %75 = load double, ptr %74, align 8, !invariant.load !191
  %76 = load i64, ptr %arg29, align 8, !invariant.load !191
  %constant_770_118_clone_1 = load i64, ptr @200, align 8
  %77 = icmp slt i64 %76, %constant_770_118_clone_1
  %78 = zext i1 %77 to i8
  %79 = load i64, ptr %arg29, align 8, !invariant.load !191
  %constant_769_117_clone_1 = load i64, ptr @199, align 8
  %80 = add i64 %79, %constant_769_117_clone_1
  %81 = load i64, ptr %arg29, align 8, !invariant.load !191
  %82 = trunc i8 %78 to i1
  %83 = select i1 %82, i64 %80, i64 %81
  %84 = trunc i64 %83 to i32
  %85 = icmp sge i32 0, %84
  %86 = select i1 %85, i32 0, i32 %84
  %87 = icmp sle i32 191, %86
  %dynamic-slice.55.37.clone.1.start_idx0 = select i1 %87, i32 191, i32 %86
  %88 = add i32 %dynamic-slice.55.37.clone.1.start_idx0, 0
  %89 = getelementptr inbounds [192 x i32], ptr %arg28, i32 0, i32 %88
  %90 = load i32, ptr %89, align 4, !invariant.load !191
  %91 = sitofp i32 %90 to double
  %multiply.3516.19.clone.1 = fmul double %75, %91
  %multiply.3517.15.clone.1 = fmul double %73, %multiply.3516.19.clone.1
  %add.1038.15.clone.1 = fadd double %add.1031.19.clone.1, %multiply.3517.15.clone.1
  %subtract.147.9.clone.1 = fsub double %add.1038.15.clone.1, %add.1031.19.clone.1
  %multiply.3520.1.clone.1 = fmul double %subtract.147.9.clone.1, %subtract.147.9.clone.1
  %multiply.3554.1.clone.1 = fmul double %65, %multiply.3520.1.clone.1
  %92 = getelementptr inbounds [20 x double], ptr %arg25, i32 0, i32 %4
  %93 = load double, ptr %92, align 8, !invariant.load !191
  %94 = getelementptr double, ptr %arg24, i32 %linear_index
  %95 = getelementptr inbounds double, ptr %94, i32 0
  %96 = load double, ptr %95, align 8, !invariant.load !191
  %multiply.3504.21.clone.1 = fmul double %93, %96
  %97 = getelementptr inbounds [20 x [1 x double]], ptr %arg45, i32 0, i32 %4, i32 0
  %98 = load double, ptr %97, align 8, !invariant.load !191
  %99 = getelementptr double, ptr %arg44, i32 %linear_index
  %100 = getelementptr inbounds double, ptr %99, i32 0
  %101 = load double, ptr %100, align 8
  %multiply.3543.5.clone.1 = fmul double %98, %101
  %divide.873.3.clone.1 = fdiv double %multiply.3543.5.clone.1, %56
  %102 = getelementptr inbounds [20 x double], ptr %arg43, i32 0, i32 %4
  %103 = load double, ptr %102, align 8, !invariant.load !191
  %multiply.3501.3.clone.1 = fmul double %98, %103
  %multiply.3544.3.clone.1 = fmul double %60, %multiply.3501.3.clone.1
  %multiply.3546.3.clone.1 = fmul double %multiply.3544.3.clone.1, %62
  %add.1048.1.clone.1 = fadd double %divide.873.3.clone.1, %multiply.3546.3.clone.1
  %multiply.3547.7.clone.1 = fmul double %add.1048.1.clone.1, %multiply.3516.19.clone.1
  %104 = getelementptr inbounds [20 x double], ptr %arg23, i32 0, i32 %4
  %105 = load double, ptr %104, align 8, !invariant.load !191
  %106 = getelementptr inbounds [20 x double], ptr %arg43, i32 0, i32 %4
  %107 = load double, ptr %106, align 8, !invariant.load !191
  %multiply.3505.23.clone.1 = fmul double %multiply.3504.21.clone.1, %107
  %108 = fneg double %multiply.3505.23.clone.1
  %multiply.3539.5.clone.1 = fmul double %108, %91
  %divide.870.3.clone.1 = fdiv double %multiply.3539.5.clone.1, %107
  %109 = getelementptr double, ptr %arg44, i32 %linear_index
  %110 = getelementptr inbounds double, ptr %109, i32 0
  %111 = load double, ptr %110, align 8
  %112 = fneg double %111
  %113 = trunc i64 %83 to i32
  %114 = icmp sge i32 0, %113
  %115 = select i1 %114, i32 0, i32 %113
  %116 = icmp sle i32 191, %115
  %dynamic-slice.56.4.clone.1.start_idx0 = select i1 %116, i32 191, i32 %115
  %constant_770_118_clone_11 = load i64, ptr @200, align 8
  %117 = trunc i64 %constant_770_118_clone_11 to i32
  %118 = icmp sge i32 0, %117
  %119 = select i1 %118, i32 0, i32 %117
  %120 = icmp sle i32 0, %119
  %dynamic-slice.56.4.clone.1.start_idx1 = select i1 %120, i32 0, i32 %119
  %constant_770_118_clone_12 = load i64, ptr @200, align 8
  %121 = trunc i64 %constant_770_118_clone_12 to i32
  %122 = icmp sge i32 0, %121
  %123 = select i1 %122, i32 0, i32 %121
  %124 = icmp sle i32 0, %123
  %dynamic-slice.56.4.clone.1.start_idx2 = select i1 %124, i32 0, i32 %123
  %125 = add i32 %dynamic-slice.56.4.clone.1.start_idx0, 0
  %126 = add i32 %dynamic-slice.56.4.clone.1.start_idx1, %4
  %127 = add i32 %dynamic-slice.56.4.clone.1.start_idx2, 0
  %128 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr %arg49, i32 0, i32 %125, i32 %126, i32 0
  %129 = load double, ptr %128, align 8, !invariant.load !191
  %130 = getelementptr inbounds [20 x double], ptr %arg48, i32 0, i32 %4
  %131 = load double, ptr %130, align 8, !invariant.load !191
  %subtract.146.5.clone.1 = fsub double %129, %131
  %multiply.3515.3.clone.1 = fmul double %subtract.146.5.clone.1, %91
  %multiply.3540.1.clone.1 = fmul double %112, %multiply.3515.3.clone.1
  %constant_772_30 = load double, ptr @198, align 8
  %132 = getelementptr inbounds [20 x double], ptr %arg43, i32 0, i32 %4
  %133 = load double, ptr %132, align 8, !invariant.load !191
  %134 = getelementptr inbounds [20 x double], ptr %arg43, i32 0, i32 %4
  %135 = load double, ptr %134, align 8, !invariant.load !191
  %multiply.3541.10.clone.1 = fmul double %133, %135
  %divide.871.5.clone.1 = fdiv double %constant_772_30, %multiply.3541.10.clone.1
  %multiply.3542.1.clone.1 = fmul double %multiply.3540.1.clone.1, %divide.871.5.clone.1
  %add.1047.1.clone.1 = fadd double %divide.870.3.clone.1, %multiply.3542.1.clone.1
  %multiply.3548.8.clone.1 = fmul double %add.1047.1.clone.1, %91
  %multiply.3549.9.clone.1 = fmul double %105, %multiply.3548.8.clone.1
  %add.1049.7.clone.1 = fadd double %multiply.3547.7.clone.1, %multiply.3549.9.clone.1
  %add.1050.12.clone.1 = fadd double %multiply.3504.21.clone.1, %add.1049.7.clone.1
  %subtract.149.11.clone.1 = fsub double %add.1050.12.clone.1, %multiply.3504.21.clone.1
  %constant_779_4 = load double, ptr @203, align 8
  %multiply.3555.5.clone.1 = fmul double %subtract.147.9.clone.1, %constant_779_4
  %multiply.3556.5.clone.1 = fmul double %subtract.149.11.clone.1, %multiply.3555.5.clone.1
  %multiply.3557.3.clone.1 = fmul double %40, %multiply.3556.5.clone.1
  %add.1053.1.clone.1 = fadd double %multiply.3554.1.clone.1, %multiply.3557.3.clone.1
  %add.1054.1.clone.1 = fadd double %add.1052.3.clone.1, %add.1053.1.clone.1
  %multiply.3568.5 = fmul double %multiply.3525.27, %add.1054.1.clone.1
  %add.1058.5 = fadd double %multiply.3567.7, %multiply.3568.5
  %136 = getelementptr inbounds [20 x double], ptr %arg15, i32 0, i32 %4
  %137 = load double, ptr %136, align 8, !invariant.load !191
  %multiply.3527.13 = fmul double %137, %constant_779_4
  %divide.868.3 = fdiv double %constant_772_30, %multiply.3527.13
  %multiply.3569.3 = fmul double %add.1058.5, %divide.868.3
  %138 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %4
  %139 = load double, ptr %138, align 8, !invariant.load !191
  %multiply.3526.1 = fmul double %multiply.3525.27, %139
  %140 = getelementptr double, ptr %arg14, i32 %linear_index
  %141 = getelementptr inbounds double, ptr %140, i32 0
  %142 = load double, ptr %141, align 8
  %143 = fneg double %142
  %144 = getelementptr inbounds [20 x double], ptr %arg13, i32 0, i32 %4
  %145 = load double, ptr %144, align 8, !invariant.load !191
  %multiply.3560.21 = fmul double %143, %145
  %146 = getelementptr inbounds [20 x double], ptr %arg11, i32 0, i32 %4
  %147 = load double, ptr %146, align 8, !invariant.load !191
  %148 = call double @__nv_exp(double %147)
  %multiply.3524.47 = fmul double %22, %148
  %compare.377.17 = fcmp ogt double %multiply.3524.47, %constant_774_21
  %149 = zext i1 %compare.377.17 to i8
  %150 = getelementptr double, ptr %arg10, i32 %linear_index
  %151 = getelementptr inbounds double, ptr %150, i32 0
  %152 = load double, ptr %151, align 8, !invariant.load !191
  %multiply.3561.23 = fmul double %152, %148
  %multiply.3562.51 = fmul double %22, %multiply.3561.23
  %153 = trunc i8 %149 to i1
  %154 = select i1 %153, double %multiply.3562.51, double %constant_776_16
  %add.1055.39 = fadd double %multiply.3560.21, %154
  %155 = fneg double %add.1055.39
  %156 = getelementptr inbounds [20 x double], ptr %arg9, i32 0, i32 %4
  %157 = load double, ptr %156, align 8, !invariant.load !191
  %multiply.3564.31 = fmul double %155, %157
  %constant_779_43 = load double, ptr @203, align 8
  %multiply.3570.9 = fmul double %multiply.3564.31, %constant_779_43
  %158 = fneg double %multiply.3570.9
  %159 = getelementptr inbounds [20 x double], ptr %arg8, i32 0, i32 %4
  %160 = load double, ptr %159, align 8, !invariant.load !191
  %multiply.3572.5 = fmul double %158, %160
  %multiply.3573.3 = fmul double %multiply.3526.1, %multiply.3572.5
  %add.1059.3 = fadd double %multiply.3569.3, %multiply.3573.3
  %161 = getelementptr inbounds [20 x i64], ptr %arg3, i32 0, i32 %4
  %162 = load i64, ptr %161, align 8, !invariant.load !191
  %163 = sitofp i64 %162 to double
  %multiply.3574.5 = fmul double %add.1059.3, %163
  %add.1060.3 = fadd double %multiply.3558.3, %multiply.3574.5
  %164 = getelementptr double, ptr %arg0, i32 %linear_index
  %165 = getelementptr inbounds double, ptr %164, i32 0
  %166 = load double, ptr %165, align 8
  %167 = trunc i8 %8 to i1
  %168 = select i1 %167, double %add.1060.3, double %166
  %169 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } undef, double %168, 0
  %170 = getelementptr inbounds [20 x i8], ptr %arg17, i32 0, i32 %4
  %171 = load i8, ptr %170, align 1, !invariant.load !191
  %172 = zext i8 %171 to i32
  %constant_780_3_clone_1 = load i32, ptr @204, align 4
  %173 = icmp slt i32 %172, %constant_780_3_clone_1
  %174 = zext i1 %173 to i8
  %constant_781_3_clone_1 = load i32, ptr @206, align 4
  %175 = icmp eq i32 %172, %constant_781_3_clone_1
  %176 = zext i1 %175 to i8
  %177 = getelementptr double, ptr %arg14, i32 %linear_index
  %178 = getelementptr inbounds double, ptr %177, i32 0
  %179 = load double, ptr %178, align 8
  %180 = trunc i8 %176 to i1
  %181 = select i1 %180, double %179, double %constant_776_16
  %182 = fneg double %181
  %multiply.3575.3.clone.1 = fmul double %182, %145
  %183 = getelementptr double, ptr %arg10, i32 %linear_index
  %184 = getelementptr inbounds double, ptr %183, i32 0
  %185 = load double, ptr %184, align 8, !invariant.load !191
  %186 = trunc i8 %176 to i1
  %187 = select i1 %186, double %185, double %constant_776_16
  %multiply.3576.5.clone.1 = fmul double %187, %148
  %multiply.3577.11.clone.1 = fmul double %22, %multiply.3576.5.clone.1
  %add.1061.9.clone.1 = fadd double %multiply.3575.3.clone.1, %multiply.3577.11.clone.1
  %188 = fneg double %add.1061.9.clone.1
  %189 = getelementptr inbounds [20 x double], ptr %arg16, i32 0, i32 %4
  %190 = load double, ptr %189, align 8, !invariant.load !191
  %add.1044.7.clone.1 = fadd double %190, %multiply.3524.47
  %multiply.3578.8.clone.1 = fmul double %add.1044.7.clone.1, %add.1044.7.clone.1
  %divide.879.5.clone.1 = fdiv double %constant_772_30, %multiply.3578.8.clone.1
  %multiply.3579.3.clone.1 = fmul double %188, %divide.879.5.clone.1
  %191 = getelementptr inbounds [20 x double], ptr %arg15, i32 0, i32 %4
  %192 = load double, ptr %191, align 8, !invariant.load !191
  %multiply.3530.32.clone.1 = fmul double %multiply.3525.27, %multiply.3525.27
  %constant_782_1_clone_1 = load double, ptr @205, align 8
  %multiply.3531.15.clone.1 = fmul double %multiply.3530.32.clone.1, %constant_782_1_clone_1
  %193 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %4
  %194 = load double, ptr %193, align 8, !invariant.load !191
  %multiply.3532.15.clone.1 = fmul double %multiply.3530.32.clone.1, %194
  %add.1045.13.clone.1 = fadd double %multiply.3531.15.clone.1, %multiply.3532.15.clone.1
  %multiply.3533.23.clone.1 = fmul double %20, %20
  %multiply.3534.21.clone.1 = fmul double %multiply.3533.23.clone.1, %constant_782_1_clone_1
  %195 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %4
  %196 = load double, ptr %195, align 8, !invariant.load !191
  %multiply.3535.11.clone.1 = fmul double %multiply.3534.21.clone.1, %196
  %197 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %4
  %198 = load double, ptr %197, align 8, !invariant.load !191
  %multiply.3536.11.clone.1 = fmul double %multiply.3535.11.clone.1, %198
  %subtract.148.11.clone.1 = fsub double %add.1045.13.clone.1, %multiply.3536.11.clone.1
  %multiply.3537.9.clone.1 = fmul double %subtract.148.11.clone.1, %163
  %add.1046.7.clone.1 = fadd double %192, %multiply.3537.9.clone.1
  %compare.380.3.clone.1 = fcmp ogt double %add.1046.7.clone.1, %constant_774_21
  %199 = zext i1 %compare.380.3.clone.1 to i8
  %200 = icmp eq i32 %172, %constant_780_3_clone_1
  %201 = zext i1 %200 to i8
  %202 = trunc i8 %201 to i1
  %203 = select i1 %202, double %multiply.3564.31, double %constant_776_16
  %constant_776_164 = load double, ptr @202, align 8
  %204 = trunc i8 %201 to i1
  %205 = select i1 %204, double %16, double %constant_776_164
  %multiply.3580.9.clone.1 = fmul double %205, %18
  %206 = trunc i8 %201 to i1
  %207 = select i1 %206, double %add.1051.1.clone.1, double %constant_776_16
  %multiply.3581.9.clone.1 = fmul double %20, %207
  %add.1062.11.clone.1 = fadd double %multiply.3580.9.clone.1, %multiply.3581.9.clone.1
  %multiply.3582.9.clone.1 = fmul double %multiply.3525.27, %constant_779_4
  %multiply.3583.5.clone.1 = fmul double %add.1062.11.clone.1, %multiply.3582.9.clone.1
  %constant_782_1_clone_15 = load double, ptr @205, align 8
  %multiply.3584.3.clone.1 = fmul double %multiply.3583.5.clone.1, %constant_782_1_clone_15
  %multiply.3585.5.clone.1 = fmul double %multiply.3583.5.clone.1, %49
  %208 = trunc i8 %201 to i1
  %209 = select i1 %208, double %add.1054.1.clone.1, double %constant_776_16
  %multiply.3586.9.clone.1 = fmul double %multiply.3530.32.clone.1, %209
  %add.1063.7.clone.1 = fadd double %multiply.3585.5.clone.1, %multiply.3586.9.clone.1
  %add.1064.5.clone.1 = fadd double %multiply.3584.3.clone.1, %add.1063.7.clone.1
  %multiply.3587.11.clone.1 = fmul double %20, %constant_779_4
  %multiply.3588.13.clone.1 = fmul double %205, %multiply.3587.11.clone.1
  %210 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %4
  %211 = load double, ptr %210, align 8, !invariant.load !191
  %multiply.3589.7.clone.1 = fmul double %211, %constant_782_1_clone_1
  %multiply.3590.7.clone.1 = fmul double %multiply.3588.13.clone.1, %multiply.3589.7.clone.1
  %multiply.3591.5.clone.1 = fmul double %multiply.3534.21.clone.1, %207
  %add.1065.5.clone.1 = fadd double %multiply.3590.7.clone.1, %multiply.3591.5.clone.1
  %multiply.3592.3.clone.1 = fmul double %add.1065.5.clone.1, %49
  %multiply.3593.7.clone.1 = fmul double %multiply.3535.11.clone.1, %209
  %add.1066.5.clone.1 = fadd double %multiply.3592.3.clone.1, %multiply.3593.7.clone.1
  %subtract.150.3.clone.1 = fsub double %add.1064.5.clone.1, %add.1066.5.clone.1
  %multiply.3594.3.clone.1 = fmul double %subtract.150.3.clone.1, %163
  %add.1067.3.clone.1 = fadd double %203, %multiply.3594.3.clone.1
  %212 = trunc i8 %199 to i1
  %213 = select i1 %212, double %add.1067.3.clone.1, double %constant_776_16
  %214 = trunc i8 %174 to i1
  %215 = select i1 %214, double %multiply.3579.3.clone.1, double %213
  %216 = getelementptr double, ptr %arg14, i32 %linear_index
  %217 = getelementptr inbounds double, ptr %216, i32 0
  %218 = load double, ptr %217, align 8
  %219 = trunc i8 %8 to i1
  %220 = select i1 %219, double %215, double %218
  %221 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %169, double %220, 1
  %222 = getelementptr inbounds [20 x double], ptr %arg15, i32 0, i32 %4
  %223 = load double, ptr %222, align 8, !invariant.load !191
  %multiply.3595.5.clone.1 = fmul double %154, %223
  %224 = getelementptr inbounds [20 x double], ptr %arg19, i32 0, i32 %4
  %225 = load double, ptr %224, align 8, !invariant.load !191
  %226 = trunc i8 %149 to i1
  %227 = select i1 %226, double %multiply.3524.47, double %225
  %multiply.3596.5.clone.1 = fmul double %227, %multiply.3564.31
  %add.1068.3.clone.1 = fadd double %multiply.3595.5.clone.1, %multiply.3596.5.clone.1
  %228 = getelementptr double, ptr %arg18, i32 %linear_index
  %229 = getelementptr inbounds double, ptr %228, i32 0
  %230 = load double, ptr %229, align 8
  %231 = trunc i8 %8 to i1
  %232 = select i1 %231, double %add.1068.3.clone.1, double %230
  %233 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %221, double %232, 2
  %234 = getelementptr double, ptr %arg20, i32 %linear_index
  %235 = getelementptr inbounds double, ptr %234, i32 0
  %236 = load double, ptr %235, align 8
  %237 = trunc i8 %8 to i1
  %238 = select i1 %237, double %multiply.3564.31, double %236
  %239 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %233, double %238, 3
  %240 = getelementptr double, ptr %arg21, i32 %linear_index
  %241 = getelementptr inbounds double, ptr %240, i32 0
  %242 = load double, ptr %241, align 8
  %243 = trunc i8 %8 to i1
  %244 = select i1 %243, double %multiply.3560.21, double %242
  %245 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %239, double %244, 4
  %246 = getelementptr double, ptr %arg22, i32 %linear_index
  %247 = getelementptr inbounds double, ptr %246, i32 0
  %248 = load double, ptr %247, align 8
  %249 = trunc i8 %8 to i1
  %250 = select i1 %249, double %add.1054.1.clone.1, double %248
  %251 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %245, double %250, 5
  %252 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %251, double %add.1054.1.clone.1, 6
  %253 = getelementptr double, ptr %arg36, i32 %linear_index
  %254 = getelementptr inbounds double, ptr %253, i32 0
  %255 = load double, ptr %254, align 8
  %256 = trunc i8 %8 to i1
  %257 = select i1 %256, double %add.1051.1.clone.1, double %255
  %258 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %252, double %257, 7
  %259 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %258, double %add.1051.1.clone.1, 8
  %260 = getelementptr double, ptr %arg24, i32 %linear_index
  %261 = getelementptr inbounds double, ptr %260, i32 0
  %262 = load double, ptr %261, align 8, !invariant.load !191
  %263 = trunc i8 %8 to i1
  %264 = select i1 %263, double %add.1050.12.clone.1, double %262
  %265 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %259, double %264, 9
  %266 = getelementptr double, ptr %arg42, i32 %linear_index
  %267 = getelementptr inbounds double, ptr %266, i32 0
  %268 = load double, ptr %267, align 8
  %269 = trunc i8 %8 to i1
  %270 = select i1 %269, double %subtract.149.11.clone.1, double %268
  %271 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %265, double %270, 10
  %272 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %271, double %add.1048.1.clone.1, 11
  %273 = getelementptr double, ptr %arg34, i32 %linear_index
  %274 = getelementptr inbounds double, ptr %273, i32 0
  %275 = load double, ptr %274, align 8
  %276 = getelementptr double, ptr %arg46, i32 %linear_index
  %277 = getelementptr inbounds double, ptr %276, i32 0
  %278 = load double, ptr %277, align 8
  %279 = trunc i8 %8 to i1
  %280 = select i1 %279, double %275, double %278
  %281 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %272, double %280, 12
  %282 = getelementptr double, ptr %arg47, i32 %linear_index
  %283 = getelementptr inbounds double, ptr %282, i32 0
  %284 = load double, ptr %283, align 8
  %285 = trunc i8 %8 to i1
  %286 = select i1 %285, double %add.1047.1.clone.1, double %284
  %287 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %281, double %286, 13
  %288 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %287, double %add.1047.1.clone.1, 14
  %289 = getelementptr double, ptr %arg50, i32 %linear_index
  %290 = getelementptr inbounds double, ptr %289, i32 0
  %291 = load double, ptr %290, align 8
  %292 = trunc i8 %8 to i1
  %293 = select i1 %292, double %multiply.3558.3, double %291
  %294 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %288, double %293, 15
  %295 = getelementptr double, ptr %arg44, i32 %linear_index
  %296 = getelementptr inbounds double, ptr %295, i32 0
  %297 = load double, ptr %296, align 8
  %298 = getelementptr double, ptr %arg51, i32 %linear_index
  %299 = getelementptr inbounds double, ptr %298, i32 0
  %300 = load double, ptr %299, align 8
  %301 = trunc i8 %8 to i1
  %302 = select i1 %301, double %297, double %300
  %303 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %294, double %302, 16
  %304 = getelementptr double, ptr %arg44, i32 %linear_index
  %305 = getelementptr inbounds double, ptr %304, i32 0
  %306 = load double, ptr %305, align 8
  %307 = getelementptr double, ptr %arg52, i32 %linear_index
  %308 = getelementptr inbounds double, ptr %307, i32 0
  %309 = load double, ptr %308, align 8
  %310 = trunc i8 %8 to i1
  %311 = select i1 %310, double %306, double %309
  %312 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %303, double %311, 17
  %313 = getelementptr double, ptr %arg53, i32 %linear_index
  %314 = getelementptr inbounds double, ptr %313, i32 0
  %315 = load double, ptr %314, align 8
  %316 = trunc i8 %8 to i1
  %317 = select i1 %316, double %multiply.3504.21.clone.1, double %315
  %318 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %312, double %317, 18
  %319 = getelementptr double, ptr %arg54, i32 %linear_index
  %320 = getelementptr inbounds double, ptr %319, i32 0
  %321 = load double, ptr %320, align 8
  %322 = trunc i8 %8 to i1
  %323 = select i1 %322, double %multiply.3505.23.clone.1, double %321
  %324 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %318, double %323, 19
  %325 = getelementptr double, ptr %arg46, i32 %linear_index
  %326 = getelementptr inbounds double, ptr %325, i32 0
  %327 = load double, ptr %326, align 8
  %328 = fneg double %327
  %329 = getelementptr inbounds [20 x double], ptr %arg56, i32 0, i32 %4
  %330 = load double, ptr %329, align 8, !invariant.load !191
  %multiply.3509.3.clone.1 = fmul double %328, %330
  %331 = getelementptr double, ptr %arg55, i32 %linear_index
  %332 = getelementptr inbounds double, ptr %331, i32 0
  %333 = load double, ptr %332, align 8
  %334 = trunc i8 %8 to i1
  %335 = select i1 %334, double %multiply.3509.3.clone.1, double %333
  %336 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %324, double %335, 20
  %337 = getelementptr double, ptr %arg26, i32 %linear_index
  %338 = getelementptr inbounds double, ptr %337, i32 0
  %339 = load double, ptr %338, align 8, !invariant.load !191
  %340 = getelementptr double, ptr %arg57, i32 %linear_index
  %341 = getelementptr inbounds double, ptr %340, i32 0
  %342 = load double, ptr %341, align 8
  %343 = trunc i8 %8 to i1
  %344 = select i1 %343, double %339, double %342
  %345 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %336, double %344, 21
  %346 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 0
  %347 = getelementptr double, ptr %arg0, i32 %linear_index
  %348 = getelementptr inbounds double, ptr %347, i32 0
  store double %346, ptr %348, align 8
  %349 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 1
  %350 = getelementptr double, ptr %arg14, i32 %linear_index
  %351 = getelementptr inbounds double, ptr %350, i32 0
  store double %349, ptr %351, align 8
  %352 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 2
  %353 = getelementptr double, ptr %arg18, i32 %linear_index
  %354 = getelementptr inbounds double, ptr %353, i32 0
  store double %352, ptr %354, align 8
  %355 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 3
  %356 = getelementptr double, ptr %arg20, i32 %linear_index
  %357 = getelementptr inbounds double, ptr %356, i32 0
  store double %355, ptr %357, align 8
  %358 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 4
  %359 = getelementptr double, ptr %arg21, i32 %linear_index
  %360 = getelementptr inbounds double, ptr %359, i32 0
  store double %358, ptr %360, align 8
  %361 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 5
  %362 = getelementptr double, ptr %arg22, i32 %linear_index
  %363 = getelementptr inbounds double, ptr %362, i32 0
  store double %361, ptr %363, align 8
  %364 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 6
  %365 = getelementptr double, ptr %arg34, i32 %linear_index
  %366 = getelementptr inbounds double, ptr %365, i32 0
  store double %364, ptr %366, align 8
  %367 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 7
  %368 = getelementptr double, ptr %arg36, i32 %linear_index
  %369 = getelementptr inbounds double, ptr %368, i32 0
  store double %367, ptr %369, align 8
  %370 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 8
  %371 = getelementptr double, ptr %arg58, i32 %linear_index
  %372 = getelementptr inbounds double, ptr %371, i32 0
  store double %370, ptr %372, align 8
  %373 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 9
  %374 = getelementptr double, ptr %arg59, i32 %linear_index
  %375 = getelementptr inbounds double, ptr %374, i32 0
  store double %373, ptr %375, align 8
  %376 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 10
  %377 = getelementptr double, ptr %arg42, i32 %linear_index
  %378 = getelementptr inbounds double, ptr %377, i32 0
  store double %376, ptr %378, align 8
  %379 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 11
  %380 = getelementptr double, ptr %arg60, i32 %linear_index
  %381 = getelementptr inbounds double, ptr %380, i32 0
  store double %379, ptr %381, align 8
  %382 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 12
  %383 = getelementptr double, ptr %arg46, i32 %linear_index
  %384 = getelementptr inbounds double, ptr %383, i32 0
  store double %382, ptr %384, align 8
  %385 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 13
  %386 = getelementptr double, ptr %arg47, i32 %linear_index
  %387 = getelementptr inbounds double, ptr %386, i32 0
  store double %385, ptr %387, align 8
  %388 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 14
  %389 = getelementptr double, ptr %arg44, i32 %linear_index
  %390 = getelementptr inbounds double, ptr %389, i32 0
  store double %388, ptr %390, align 8
  %391 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 15
  %392 = getelementptr double, ptr %arg50, i32 %linear_index
  %393 = getelementptr inbounds double, ptr %392, i32 0
  store double %391, ptr %393, align 8
  %394 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 16
  %395 = getelementptr double, ptr %arg51, i32 %linear_index
  %396 = getelementptr inbounds double, ptr %395, i32 0
  store double %394, ptr %396, align 8
  %397 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 17
  %398 = getelementptr double, ptr %arg52, i32 %linear_index
  %399 = getelementptr inbounds double, ptr %398, i32 0
  store double %397, ptr %399, align 8
  %400 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 18
  %401 = getelementptr double, ptr %arg53, i32 %linear_index
  %402 = getelementptr inbounds double, ptr %401, i32 0
  store double %400, ptr %402, align 8
  %403 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 19
  %404 = getelementptr double, ptr %arg54, i32 %linear_index
  %405 = getelementptr inbounds double, ptr %404, i32 0
  store double %403, ptr %405, align 8
  %406 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 20
  %407 = getelementptr double, ptr %arg55, i32 %linear_index
  %408 = getelementptr inbounds double, ptr %407, i32 0
  store double %406, ptr %408, align 8
  %409 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %345, 21
  %410 = getelementptr double, ptr %arg57, i32 %linear_index
  %411 = getelementptr inbounds double, ptr %410, i32 0
  store double %409, ptr %411, align 8
  br label %loop_add_select_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_9(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(19200) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(19200) %arg6, ptr noalias align 16 dereferenceable(19200) %arg7) {
entry:
  %param_1.1563 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_60 = load i64, ptr @208, align 8
  %0 = icmp slt i64 %param_1.1563, %constant_770_60
  %1 = zext i1 %0 to i8
  %param_1.15631 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_90 = load i64, ptr @207, align 8
  %2 = add i64 %param_1.15631, %constant_769_90
  %param_1.15632 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15632
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_603 = load i64, ptr @208, align 8
  %9 = icmp sge i64 0, %constant_770_603
  %10 = select i1 %9, i64 0, i64 %constant_770_603
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_604 = load i64, ptr @208, align 8
  %13 = icmp sge i64 0, %constant_770_604
  %14 = select i1 %13, i64 0, i64 %constant_770_604
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2117.1.in_bounds-true, label %dynamic-update-slice.2117.1.in_bounds-after

dynamic-update-slice.2117.1.in_bounds-after:      ; preds = %dynamic-update-slice.2117.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2117.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.439 = getelementptr inbounds double, ptr %29, i64 0
  %param_7.4395 = load double, ptr %param_7.439, align 8, !invariant.load !191
  %param_3.1137 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11376 = load double, ptr %param_3.1137, align 8, !invariant.load !191
  %multiply.3565.9 = fmul double %param_7.4395, %param_3.11376
  %param_4.925 = getelementptr inbounds [20 x [1 x double]], ptr %arg4, i64 0, i64 %21, i64 0
  %param_4.9257 = load double, ptr %param_4.925, align 8, !invariant.load !191
  %30 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.593 = getelementptr inbounds double, ptr %30, i64 0
  %param_6.5938 = load double, ptr %param_6.593, align 8, !invariant.load !191
  %multiply.3566.9 = fmul double %param_4.9257, %param_6.5938
  %add.1057.7 = fadd double %multiply.3565.9, %multiply.3566.9
  %param_5.817 = getelementptr inbounds [20 x double], ptr %arg5, i64 0, i64 %21
  %param_5.8179 = load double, ptr %param_5.817, align 8, !invariant.load !191
  %multiply.3567.5 = fmul double %add.1057.7, %param_5.8179
  %param_3.113710 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.113711 = load double, ptr %param_3.113710, align 8, !invariant.load !191
  %multiply.3525.25 = fmul double %param_4.9257, %param_3.113711
  %31 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1304 = getelementptr inbounds double, ptr %31, i64 0
  %param_2.130412 = load double, ptr %param_2.1304, align 8, !invariant.load !191
  %multiply.3568.3 = fmul double %multiply.3525.25, %param_2.130412
  %add.1058.3 = fadd double %multiply.3567.5, %multiply.3568.3
  %32 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %add.1058.3, ptr %32, align 8
  br label %dynamic-update-slice.2117.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_15(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(19200) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(8) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(19200) %arg9, ptr noalias align 128 dereferenceable(19200) %arg10, ptr noalias align 16 dereferenceable(768) %arg11) {
entry:
  %param_1.1588 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_85 = load i64, ptr @211, align 8
  %0 = icmp slt i64 %param_1.1588, %constant_770_85
  %1 = zext i1 %0 to i8
  %param_1.15881 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_107 = load i64, ptr @210, align 8
  %2 = add i64 %param_1.15881, %constant_769_107
  %param_1.15882 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15882
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_853 = load i64, ptr @211, align 8
  %9 = icmp sge i64 0, %constant_770_853
  %10 = select i1 %9, i64 0, i64 %constant_770_853
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_854 = load i64, ptr @211, align 8
  %13 = icmp sge i64 0, %constant_770_854
  %14 = select i1 %13, i64 0, i64 %constant_770_854
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2110.1.in_bounds-true, label %dynamic-update-slice.2110.1.in_bounds-after

dynamic-update-slice.2110.1.in_bounds-after:      ; preds = %dynamic-update-slice.2110.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2110.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1147 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11475 = load double, ptr %param_3.1147, align 8, !invariant.load !191
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1329 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.13296 = load double, ptr %param_2.1329, align 8, !invariant.load !191
  %multiply.3504.25 = fmul double %param_3.11475, %param_2.13296
  %30 = getelementptr double, ptr %arg10, i64 %linear_index
  %param_10.244 = getelementptr inbounds double, ptr %30, i64 0
  %param_10.2447 = load double, ptr %param_10.244, align 8, !invariant.load !191
  %param_5.858 = getelementptr inbounds [20 x double], ptr %arg5, i64 0, i64 %21
  %param_5.8588 = load double, ptr %param_5.858, align 8, !invariant.load !191
  %param_1.15889 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_8510 = load i64, ptr @211, align 8
  %31 = icmp slt i64 %param_1.15889, %constant_770_8510
  %32 = zext i1 %31 to i8
  %param_1.158811 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_10712 = load i64, ptr @210, align 8
  %33 = add i64 %param_1.158811, %constant_769_10712
  %param_1.158813 = load i64, ptr %arg1, align 8, !invariant.load !191
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, i64 %33, i64 %param_1.158813
  %36 = icmp sge i64 0, %35
  %37 = select i1 %36, i64 0, i64 %35
  %38 = icmp sle i64 191, %37
  %dynamic-slice.55.35.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.55.35.start_idx0, 0
  %param_11.213 = getelementptr inbounds [192 x i32], ptr %arg11, i64 0, i64 %39
  %param_11.21314 = load i32, ptr %param_11.213, align 4, !invariant.load !191
  %40 = sitofp i32 %param_11.21314 to double
  %multiply.3516.37 = fmul double %param_5.8588, %40
  %multiply.3547.11 = fmul double %param_10.2447, %multiply.3516.37
  %param_4.975 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.97515 = load double, ptr %param_4.975, align 8, !invariant.load !191
  %41 = getelementptr double, ptr %arg9, i64 %linear_index
  %param_9.297 = getelementptr inbounds double, ptr %41, i64 0
  %param_9.29716 = load double, ptr %param_9.297, align 8, !invariant.load !191
  %multiply.3548.12 = fmul double %param_9.29716, %40
  %multiply.3549.13 = fmul double %param_4.97515, %multiply.3548.12
  %add.1049.11 = fadd double %multiply.3547.11, %multiply.3549.13
  %add.1050.10 = fadd double %multiply.3504.25, %add.1049.11
  %subtract.149.9 = fsub double %add.1050.10, %multiply.3504.25
  %param_3.114717 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.114718 = load double, ptr %param_3.114717, align 8, !invariant.load !191
  %param_8.349 = getelementptr inbounds [20 x double], ptr %arg8, i64 0, i64 %21
  %param_8.34919 = load double, ptr %param_8.349, align 8, !invariant.load !191
  %multiply.3498.25 = fmul double %param_3.114718, %param_8.34919
  %param_7.476 = getelementptr inbounds [1 x double], ptr %arg7, i64 0, i64 0
  %param_7.47620 = load double, ptr %param_7.476, align 8, !invariant.load !191
  %param_6.627 = getelementptr inbounds [20 x double], ptr %arg6, i64 0, i64 %21
  %param_6.62721 = load double, ptr %param_6.627, align 8, !invariant.load !191
  %multiply.3499.27 = fmul double %param_7.47620, %param_6.62721
  %add.1031.25 = fadd double %multiply.3498.25, %multiply.3499.27
  %param_4.97522 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.97523 = load double, ptr %param_4.97522, align 8, !invariant.load !191
  %multiply.3517.23 = fmul double %param_4.97523, %multiply.3516.37
  %add.1038.23 = fadd double %add.1031.25, %multiply.3517.23
  %subtract.147.17 = fsub double %add.1038.23, %add.1031.25
  %constant_779_7 = load double, ptr @209, align 8
  %multiply.3555.7 = fmul double %subtract.147.17, %constant_779_7
  %multiply.3556.3 = fmul double %subtract.149.9, %multiply.3555.7
  %42 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3556.3, ptr %42, align 8
  br label %dynamic-update-slice.2110.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_14(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(19200) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(19200) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(19200) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 16 dereferenceable(768) %arg8) {
entry:
  %param_1.1619 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_82 = load i64, ptr @214, align 8
  %0 = icmp slt i64 %param_1.1619, %constant_770_82
  %1 = zext i1 %0 to i8
  %param_1.16191 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_108 = load i64, ptr @213, align 8
  %2 = add i64 %param_1.16191, %constant_769_108
  %param_1.16192 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.16192
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_823 = load i64, ptr @214, align 8
  %9 = icmp sge i64 0, %constant_770_823
  %10 = select i1 %9, i64 0, i64 %constant_770_823
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_824 = load i64, ptr @214, align 8
  %13 = icmp sge i64 0, %constant_770_824
  %14 = select i1 %13, i64 0, i64 %constant_770_824
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2111.1.in_bounds-true, label %dynamic-update-slice.2111.1.in_bounds-after

dynamic-update-slice.2111.1.in_bounds-after:      ; preds = %dynamic-update-slice.2111.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2111.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1194 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11945 = load double, ptr %param_3.1194, align 8, !invariant.load !191
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1375 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.13756 = load double, ptr %param_2.1375, align 8, !invariant.load !191
  %multiply.3504.9 = fmul double %param_3.11945, %param_2.13756
  %30 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.626 = getelementptr inbounds double, ptr %30, i64 0
  %param_6.6267 = load double, ptr %param_6.626, align 8, !invariant.load !191
  %param_7.475 = getelementptr inbounds [20 x double], ptr %arg7, i64 0, i64 %21
  %param_7.4758 = load double, ptr %param_7.475, align 8, !invariant.load !191
  %param_1.16199 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_8210 = load i64, ptr @214, align 8
  %31 = icmp slt i64 %param_1.16199, %constant_770_8210
  %32 = zext i1 %31 to i8
  %param_1.161911 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_10812 = load i64, ptr @213, align 8
  %33 = add i64 %param_1.161911, %constant_769_10812
  %param_1.161913 = load i64, ptr %arg1, align 8, !invariant.load !191
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, i64 %33, i64 %param_1.161913
  %36 = icmp sge i64 0, %35
  %37 = select i1 %36, i64 0, i64 %35
  %38 = icmp sle i64 191, %37
  %dynamic-slice.55.43.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.55.43.start_idx0, 0
  %param_8.348 = getelementptr inbounds [192 x i32], ptr %arg8, i64 0, i64 %39
  %param_8.34814 = load i32, ptr %param_8.348, align 4, !invariant.load !191
  %40 = sitofp i32 %param_8.34814 to double
  %multiply.3516.31 = fmul double %param_7.4758, %40
  %multiply.3547.5 = fmul double %param_6.6267, %multiply.3516.31
  %param_5.857 = getelementptr inbounds [20 x double], ptr %arg5, i64 0, i64 %21
  %param_5.85715 = load double, ptr %param_5.857, align 8, !invariant.load !191
  %41 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.974 = getelementptr inbounds double, ptr %41, i64 0
  %param_4.97416 = load double, ptr %param_4.974, align 8, !invariant.load !191
  %multiply.3548.6 = fmul double %param_4.97416, %40
  %multiply.3549.7 = fmul double %param_5.85715, %multiply.3548.6
  %add.1049.5 = fadd double %multiply.3547.5, %multiply.3549.7
  %add.1050.8 = fadd double %multiply.3504.9, %add.1049.5
  %subtract.149.7 = fsub double %add.1050.8, %multiply.3504.9
  %constant_779_5 = load double, ptr @212, align 8
  %multiply.3615.1 = fmul double %subtract.149.7, %constant_779_5
  %42 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3615.1, ptr %42, align 8
  br label %dynamic-update-slice.2111.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_17(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(768) %arg3) {
entry:
  %param_2.1341 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_97 = load i64, ptr @216, align 8
  %0 = icmp slt i64 %param_2.1341, %constant_770_97
  %1 = zext i1 %0 to i8
  %param_2.13411 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_104 = load i64, ptr @215, align 8
  %2 = add i64 %param_2.13411, %constant_769_104
  %param_2.13412 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13412
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_973 = load i64, ptr @216, align 8
  %9 = icmp sge i64 0, %constant_770_973
  %10 = select i1 %9, i64 0, i64 %constant_770_973
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_974 = load i64, ptr @216, align 8
  %13 = icmp sge i64 0, %constant_770_974
  %14 = select i1 %13, i64 0, i64 %constant_770_974
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2108.1.in_bounds-true, label %dynamic-update-slice.2108.1.in_bounds-after

dynamic-update-slice.2108.1.in_bounds-after:      ; preds = %dynamic-update-slice.2108.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2108.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1600 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.16005 = load double, ptr %param_1.1600, align 8, !invariant.load !191
  %param_2.13416 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_977 = load i64, ptr @216, align 8
  %30 = icmp slt i64 %param_2.13416, %constant_770_977
  %31 = zext i1 %30 to i8
  %param_2.13418 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_1049 = load i64, ptr @215, align 8
  %32 = add i64 %param_2.13418, %constant_769_1049
  %param_2.134110 = load i64, ptr %arg2, align 8, !invariant.load !191
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, i64 %32, i64 %param_2.134110
  %35 = icmp sge i64 0, %34
  %36 = select i1 %35, i64 0, i64 %34
  %37 = icmp sle i64 191, %36
  %dynamic-slice.55.9.start_idx0 = select i1 %37, i64 191, i64 %36
  %38 = add i64 %dynamic-slice.55.9.start_idx0, 0
  %param_3.1153 = getelementptr inbounds [192 x i32], ptr %arg3, i64 0, i64 %38
  %param_3.115311 = load i32, ptr %param_3.1153, align 4, !invariant.load !191
  %39 = sitofp i32 %param_3.115311 to double
  %multiply.3548.1 = fmul double %param_1.16005, %39
  %40 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3548.1, ptr %40, align 8
  br label %dynamic-update-slice.2108.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_35(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(19200) %arg3, ptr noalias align 16 dereferenceable(160) %arg4) {
entry:
  %param_2.1361 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_58 = load i64, ptr @220, align 8
  %0 = icmp slt i64 %param_2.1361, %constant_770_58
  %1 = zext i1 %0 to i8
  %param_2.13611 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_83 = load i64, ptr @219, align 8
  %2 = add i64 %param_2.13611, %constant_769_83
  %param_2.13612 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13612
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_583 = load i64, ptr @220, align 8
  %9 = icmp sge i64 0, %constant_770_583
  %10 = select i1 %9, i64 0, i64 %constant_770_583
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_584 = load i64, ptr @220, align 8
  %13 = icmp sge i64 0, %constant_770_584
  %14 = select i1 %13, i64 0, i64 %constant_770_584
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2090.1.in_bounds-true, label %dynamic-update-slice.2090.1.in_bounds-after

dynamic-update-slice.2090.1.in_bounds-after:      ; preds = %dynamic-update-slice.2090.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2090.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_1.1561 = getelementptr inbounds [1 x double], ptr %arg1, i64 0, i64 0
  %param_1.15615 = load double, ptr %param_1.1561, align 8, !invariant.load !191
  %param_4.954 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9546 = load double, ptr %param_4.954, align 8, !invariant.load !191
  %29 = call double @__nv_exp(double %param_4.9546)
  %multiply.3524.39 = fmul double %param_1.15615, %29
  %constant_774_17 = load double, ptr @218, align 8
  %compare.377.9 = fcmp ogt double %multiply.3524.39, %constant_774_17
  %30 = zext i1 %compare.377.9 to i8
  %31 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1175 = getelementptr inbounds double, ptr %31, i64 0
  %param_3.11757 = load double, ptr %param_3.1175, align 8, !invariant.load !191
  %multiply.3561.5 = fmul double %param_3.11757, %29
  %multiply.3562.9 = fmul double %param_1.15615, %multiply.3561.5
  %constant_776_4 = load double, ptr @217, align 8
  %32 = trunc i8 %30 to i1
  %33 = select i1 %32, double %multiply.3562.9, double %constant_776_4
  %34 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %33, ptr %34, align 8
  br label %dynamic-update-slice.2090.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_2(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(20) %arg3) {
entry:
  %param_2.1363 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_25 = load i64, ptr @224, align 8
  %0 = icmp slt i64 %param_2.1363, %constant_770_25
  %1 = zext i1 %0 to i8
  %param_2.13631 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_29 = load i64, ptr @223, align 8
  %2 = add i64 %param_2.13631, %constant_769_29
  %param_2.13632 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13632
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_253 = load i64, ptr @224, align 8
  %9 = icmp sge i64 0, %constant_770_253
  %10 = select i1 %9, i64 0, i64 %constant_770_253
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_254 = load i64, ptr @224, align 8
  %13 = icmp sge i64 0, %constant_770_254
  %14 = select i1 %13, i64 0, i64 %constant_770_254
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2125.1.in_bounds-true, label %dynamic-update-slice.2125.1.in_bounds-after

dynamic-update-slice.2125.1.in_bounds-after:      ; preds = %dynamic-update-slice.2125.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2125.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1200 = getelementptr inbounds [20 x i8], ptr %arg3, i64 0, i64 %21
  %param_3.12005 = load i8, ptr %param_3.1200, align 1, !invariant.load !191
  %29 = zext i8 %param_3.12005 to i32
  %constant_780_5 = load i32, ptr @222, align 4
  %30 = icmp eq i32 %29, %constant_780_5
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1528 = getelementptr inbounds double, ptr %32, i64 0
  %param_1.15286 = load double, ptr %param_1.1528, align 8, !invariant.load !191
  %constant_776_9 = load double, ptr @221, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_1.15286, double %constant_776_9
  %35 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %34, ptr %35, align 8
  br label %dynamic-update-slice.2125.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_3(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(19200) %arg3, ptr noalias align 128 dereferenceable(19200) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(20) %arg6) {
entry:
  %param_5.856 = load i64, ptr %arg5, align 8, !invariant.load !191
  %constant_770_33 = load i64, ptr @229, align 8
  %0 = icmp slt i64 %param_5.856, %constant_770_33
  %1 = zext i1 %0 to i8
  %param_5.8561 = load i64, ptr %arg5, align 8, !invariant.load !191
  %constant_769_46 = load i64, ptr @228, align 8
  %2 = add i64 %param_5.8561, %constant_769_46
  %param_5.8562 = load i64, ptr %arg5, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_5.8562
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_333 = load i64, ptr @229, align 8
  %9 = icmp sge i64 0, %constant_770_333
  %10 = select i1 %9, i64 0, i64 %constant_770_333
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_334 = load i64, ptr @229, align 8
  %13 = icmp sge i64 0, %constant_770_334
  %14 = select i1 %13, i64 0, i64 %constant_770_334
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2124.1.in_bounds-true, label %dynamic-update-slice.2124.1.in_bounds-after

dynamic-update-slice.2124.1.in_bounds-after:      ; preds = %dynamic-update-slice.2124.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2124.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_6.634 = getelementptr inbounds [20 x i8], ptr %arg6, i64 0, i64 %21
  %param_6.6345 = load i8, ptr %param_6.634, align 1, !invariant.load !191
  %29 = zext i8 %param_6.6345 to i32
  %constant_780_11 = load i32, ptr @227, align 4
  %30 = icmp eq i32 %29, %constant_780_11
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1192 = getelementptr inbounds double, ptr %32, i64 0
  %param_3.11926 = load double, ptr %param_3.1192, align 8, !invariant.load !191
  %constant_776_11 = load double, ptr @226, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_3.11926, double %constant_776_11
  %param_2.1373 = getelementptr inbounds [20 x double], ptr %arg2, i64 0, i64 %21
  %param_2.13737 = load double, ptr %param_2.1373, align 8, !invariant.load !191
  %multiply.3580.5 = fmul double %34, %param_2.13737
  %param_1.1617 = getelementptr inbounds [20 x [1 x double]], ptr %arg1, i64 0, i64 %21, i64 0
  %param_1.16178 = load double, ptr %param_1.1617, align 8, !invariant.load !191
  %35 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.972 = getelementptr inbounds double, ptr %35, i64 0
  %param_4.9729 = load double, ptr %param_4.972, align 8, !invariant.load !191
  %constant_776_1110 = load double, ptr @226, align 8
  %36 = trunc i8 %31 to i1
  %37 = select i1 %36, double %param_4.9729, double %constant_776_1110
  %multiply.3581.5 = fmul double %param_1.16178, %37
  %add.1062.7 = fadd double %multiply.3580.5, %multiply.3581.5
  %constant_779_1 = load double, ptr @225, align 8
  %multiply.3623.3 = fmul double %add.1062.7, %constant_779_1
  %38 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3623.3, ptr %38, align 8
  br label %dynamic-update-slice.2124.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(19200) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(19200) %arg5, ptr noalias align 128 dereferenceable(20) %arg6) {
entry:
  %param_1.1511 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_7 = load i64, ptr @235, align 8
  %0 = icmp slt i64 %param_1.1511, %constant_770_7
  %1 = zext i1 %0 to i8
  %param_1.15111 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_14 = load i64, ptr @234, align 8
  %2 = add i64 %param_1.15111, %constant_769_14
  %param_1.15112 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15112
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_73 = load i64, ptr @235, align 8
  %9 = icmp sge i64 0, %constant_770_73
  %10 = select i1 %9, i64 0, i64 %constant_770_73
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_74 = load i64, ptr @235, align 8
  %13 = icmp sge i64 0, %constant_770_74
  %14 = select i1 %13, i64 0, i64 %constant_770_74
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2129.1.in_bounds-true, label %dynamic-update-slice.2129.1.in_bounds-after

dynamic-update-slice.2129.1.in_bounds-after:      ; preds = %dynamic-update-slice.2129.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2129.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_6.637 = getelementptr inbounds [20 x i8], ptr %arg6, i64 0, i64 %21
  %param_6.6375 = load i8, ptr %param_6.637, align 1, !invariant.load !191
  %29 = zext i8 %param_6.6375 to i32
  %constant_780_10 = load i32, ptr @231, align 4
  %30 = icmp eq i32 %29, %constant_780_10
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.866 = getelementptr inbounds double, ptr %32, i64 0
  %param_5.8666 = load double, ptr %param_5.866, align 8, !invariant.load !191
  %constant_776_7 = load double, ptr @230, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_5.8666, double %constant_776_7
  %param_3.1204 = getelementptr inbounds [20 x [1 x double]], ptr %arg3, i64 0, i64 %21, i64 0
  %param_3.12047 = load double, ptr %param_3.1204, align 8, !invariant.load !191
  %constant_779_2 = load double, ptr @233, align 8
  %multiply.3587.9 = fmul double %param_3.12047, %constant_779_2
  %multiply.3588.11 = fmul double %34, %multiply.3587.9
  %param_4.982 = getelementptr inbounds [20 x double], ptr %arg4, i64 0, i64 %21
  %param_4.9828 = load double, ptr %param_4.982, align 8, !invariant.load !191
  %constant_782_2 = load double, ptr @232, align 8
  %multiply.3589.5 = fmul double %param_4.9828, %constant_782_2
  %multiply.3590.5 = fmul double %multiply.3588.11, %multiply.3589.5
  %multiply.3533.19 = fmul double %param_3.12047, %param_3.12047
  %multiply.3534.17 = fmul double %multiply.3533.19, %constant_782_2
  %35 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1252 = getelementptr inbounds double, ptr %35, i64 0
  %param_2.12529 = load double, ptr %param_2.1252, align 8, !invariant.load !191
  %constant_776_710 = load double, ptr @230, align 8
  %36 = trunc i8 %31 to i1
  %37 = select i1 %36, double %param_2.12529, double %constant_776_710
  %multiply.3591.3 = fmul double %multiply.3534.17, %37
  %add.1065.3 = fadd double %multiply.3590.5, %multiply.3591.3
  %38 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %add.1065.3, ptr %38, align 8
  br label %dynamic-update-slice.2129.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_11(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(19200) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %param_5.819 = load i64, ptr %arg5, align 8, !invariant.load !191
  %constant_770_66 = load i64, ptr @237, align 8
  %0 = icmp slt i64 %param_5.819, %constant_770_66
  %1 = zext i1 %0 to i8
  %param_5.8191 = load i64, ptr %arg5, align 8, !invariant.load !191
  %constant_769_106 = load i64, ptr @236, align 8
  %2 = add i64 %param_5.8191, %constant_769_106
  %param_5.8192 = load i64, ptr %arg5, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_5.8192
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_663 = load i64, ptr @237, align 8
  %9 = icmp sge i64 0, %constant_770_663
  %10 = select i1 %9, i64 0, i64 %constant_770_663
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_664 = load i64, ptr @237, align 8
  %13 = icmp sge i64 0, %constant_770_664
  %14 = select i1 %13, i64 0, i64 %constant_770_664
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2115.1.in_bounds-true, label %dynamic-update-slice.2115.1.in_bounds-after

dynamic-update-slice.2115.1.in_bounds-after:      ; preds = %dynamic-update-slice.2115.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2115.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.928 = getelementptr inbounds double, ptr %29, i64 0
  %param_4.9285 = load double, ptr %param_4.928, align 8, !invariant.load !191
  %param_3.1141 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11416 = load double, ptr %param_3.1141, align 8, !invariant.load !191
  %multiply.3565.5 = fmul double %param_4.9285, %param_3.11416
  %param_2.1310 = getelementptr inbounds [20 x [1 x double]], ptr %arg2, i64 0, i64 %21, i64 0
  %param_2.13107 = load double, ptr %param_2.1310, align 8, !invariant.load !191
  %30 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1569 = getelementptr inbounds double, ptr %30, i64 0
  %param_1.15698 = load double, ptr %param_1.1569, align 8, !invariant.load !191
  %multiply.3566.5 = fmul double %param_2.13107, %param_1.15698
  %add.1057.3 = fadd double %multiply.3565.5, %multiply.3566.5
  %31 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %add.1057.3, ptr %31, align 8
  br label %dynamic-update-slice.2115.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_1(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(19200) %arg4, ptr noalias align 16 dereferenceable(19200) %arg5, ptr noalias align 128 dereferenceable(20) %arg6) {
entry:
  %param_1.1524 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_21 = load i64, ptr @242, align 8
  %0 = icmp slt i64 %param_1.1524, %constant_770_21
  %1 = zext i1 %0 to i8
  %param_1.15241 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_23 = load i64, ptr @241, align 8
  %2 = add i64 %param_1.15241, %constant_769_23
  %param_1.15242 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15242
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_213 = load i64, ptr @242, align 8
  %9 = icmp sge i64 0, %constant_770_213
  %10 = select i1 %9, i64 0, i64 %constant_770_213
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_214 = load i64, ptr @242, align 8
  %13 = icmp sge i64 0, %constant_770_214
  %14 = select i1 %13, i64 0, i64 %constant_770_214
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2126.1.in_bounds-true, label %dynamic-update-slice.2126.1.in_bounds-after

dynamic-update-slice.2126.1.in_bounds-after:      ; preds = %dynamic-update-slice.2126.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2126.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_6.632 = getelementptr inbounds [20 x i8], ptr %arg6, i64 0, i64 %21
  %param_6.6325 = load i8, ptr %param_6.632, align 1, !invariant.load !191
  %29 = zext i8 %param_6.6325 to i32
  %constant_780_1 = load i32, ptr @240, align 4
  %30 = icmp eq i32 %29, %constant_780_1
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.861 = getelementptr inbounds double, ptr %32, i64 0
  %param_5.8616 = load double, ptr %param_5.861, align 8, !invariant.load !191
  %constant_776_20 = load double, ptr @239, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_5.8616, double %constant_776_20
  %param_2.1378 = getelementptr inbounds [20 x double], ptr %arg2, i64 0, i64 %21
  %param_2.13787 = load double, ptr %param_2.1378, align 8, !invariant.load !191
  %multiply.3580.7 = fmul double %34, %param_2.13787
  %param_3.1198 = getelementptr inbounds [20 x [1 x double]], ptr %arg3, i64 0, i64 %21, i64 0
  %param_3.11988 = load double, ptr %param_3.1198, align 8, !invariant.load !191
  %35 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.978 = getelementptr inbounds double, ptr %35, i64 0
  %param_4.9789 = load double, ptr %param_4.978, align 8, !invariant.load !191
  %constant_776_2010 = load double, ptr @239, align 8
  %36 = trunc i8 %31 to i1
  %37 = select i1 %36, double %param_4.9789, double %constant_776_2010
  %multiply.3581.7 = fmul double %param_3.11988, %37
  %add.1062.9 = fadd double %multiply.3580.7, %multiply.3581.7
  %param_2.137811 = getelementptr inbounds [20 x double], ptr %arg2, i64 0, i64 %21
  %param_2.137812 = load double, ptr %param_2.137811, align 8, !invariant.load !191
  %multiply.3525.29 = fmul double %param_3.11988, %param_2.137812
  %constant_779_15 = load double, ptr @238, align 8
  %multiply.3582.7 = fmul double %multiply.3525.29, %constant_779_15
  %multiply.3583.3 = fmul double %add.1062.9, %multiply.3582.7
  %38 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3583.3, ptr %38, align 8
  br label %dynamic-update-slice.2126.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_101(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(20) %arg3) {
entry:
  %param_2.1374 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_17 = load i64, ptr @247, align 8
  %0 = icmp slt i64 %param_2.1374, %constant_770_17
  %1 = zext i1 %0 to i8
  %param_2.13741 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_62 = load i64, ptr @246, align 8
  %2 = add i64 %param_2.13741, %constant_769_62
  %param_2.13742 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13742
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_173 = load i64, ptr @247, align 8
  %9 = icmp sge i64 0, %constant_770_173
  %10 = select i1 %9, i64 0, i64 %constant_770_173
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_174 = load i64, ptr @247, align 8
  %13 = icmp sge i64 0, %constant_770_174
  %14 = select i1 %13, i64 0, i64 %constant_770_174
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2127.1.in_bounds-true, label %dynamic-update-slice.2127.1.in_bounds-after

dynamic-update-slice.2127.1.in_bounds-after:      ; preds = %dynamic-update-slice.2127.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2127.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1202 = getelementptr inbounds [20 x i8], ptr %arg3, i64 0, i64 %21
  %param_3.12025 = load i8, ptr %param_3.1202, align 1, !invariant.load !191
  %29 = zext i8 %param_3.12025 to i32
  %constant_780_9 = load i32, ptr @245, align 4
  %30 = icmp eq i32 %29, %constant_780_9
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1618 = getelementptr inbounds double, ptr %32, i64 0
  %param_1.16186 = load double, ptr %param_1.1618, align 8, !invariant.load !191
  %constant_776_12 = load double, ptr @244, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_1.16186, double %constant_776_12
  %constant_779_3 = load double, ptr @243, align 8
  %multiply.3624.3 = fmul double %34, %constant_779_3
  %35 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3624.3, ptr %35, align 8
  br label %dynamic-update-slice.2127.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_100(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(19200) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(20) %arg4) {
entry:
  %param_3.1205 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_770_13 = load i64, ptr @253, align 8
  %0 = icmp slt i64 %param_3.1205, %constant_770_13
  %1 = zext i1 %0 to i8
  %param_3.12051 = load i64, ptr %arg3, align 8, !invariant.load !191
  %constant_769_60 = load i64, ptr @252, align 8
  %2 = add i64 %param_3.12051, %constant_769_60
  %param_3.12052 = load i64, ptr %arg3, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.12052
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_133 = load i64, ptr @253, align 8
  %9 = icmp sge i64 0, %constant_770_133
  %10 = select i1 %9, i64 0, i64 %constant_770_133
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_134 = load i64, ptr @253, align 8
  %13 = icmp sge i64 0, %constant_770_134
  %14 = select i1 %13, i64 0, i64 %constant_770_134
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2128.1.in_bounds-true, label %dynamic-update-slice.2128.1.in_bounds-after

dynamic-update-slice.2128.1.in_bounds-after:      ; preds = %dynamic-update-slice.2128.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2128.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_4.983 = getelementptr inbounds [20 x i8], ptr %arg4, i64 0, i64 %21
  %param_4.9835 = load i8, ptr %param_4.983, align 1, !invariant.load !191
  %29 = zext i8 %param_4.9835 to i32
  %constant_780_4 = load i32, ptr @251, align 4
  %30 = icmp eq i32 %29, %constant_780_4
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1622 = getelementptr inbounds double, ptr %32, i64 0
  %param_1.16226 = load double, ptr %param_1.1622, align 8, !invariant.load !191
  %constant_776_1 = load double, ptr @250, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_1.16226, double %constant_776_1
  %param_2.1384 = getelementptr inbounds [20 x [1 x double]], ptr %arg2, i64 0, i64 %21, i64 0
  %param_2.13847 = load double, ptr %param_2.1384, align 8, !invariant.load !191
  %constant_779_13 = load double, ptr @249, align 8
  %multiply.3587.5 = fmul double %param_2.13847, %constant_779_13
  %multiply.3588.9 = fmul double %34, %multiply.3587.5
  %constant_782_3 = load double, ptr @248, align 8
  %multiply.3625.3 = fmul double %multiply.3588.9, %constant_782_3
  %35 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3625.3, ptr %35, align 8
  br label %dynamic-update-slice.2128.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_6(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(19200) %arg3, ptr noalias align 128 dereferenceable(20) %arg4) {
entry:
  %param_1.1552 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_49 = load i64, ptr @257, align 8
  %0 = icmp slt i64 %param_1.1552, %constant_770_49
  %1 = zext i1 %0 to i8
  %param_1.15521 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_75 = load i64, ptr @256, align 8
  %2 = add i64 %param_1.15521, %constant_769_75
  %param_1.15522 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15522
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_493 = load i64, ptr @257, align 8
  %9 = icmp sge i64 0, %constant_770_493
  %10 = select i1 %9, i64 0, i64 %constant_770_493
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_494 = load i64, ptr @257, align 8
  %13 = icmp sge i64 0, %constant_770_494
  %14 = select i1 %13, i64 0, i64 %constant_770_494
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2120.1.in_bounds-true, label %dynamic-update-slice.2120.1.in_bounds-after

dynamic-update-slice.2120.1.in_bounds-after:      ; preds = %dynamic-update-slice.2120.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2120.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_4.980 = getelementptr inbounds [20 x i8], ptr %arg4, i64 0, i64 %21
  %param_4.9805 = load i8, ptr %param_4.980, align 1, !invariant.load !191
  %29 = zext i8 %param_4.9805 to i32
  %constant_781_5 = load i32, ptr @255, align 4
  %30 = icmp eq i32 %29, %constant_781_5
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1127 = getelementptr inbounds double, ptr %32, i64 0
  %param_3.11276 = load double, ptr %param_3.1127, align 8, !invariant.load !191
  %constant_776_6 = load double, ptr @254, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_3.11276, double %constant_776_6
  %param_2.1293 = getelementptr inbounds [20 x double], ptr %arg2, i64 0, i64 %21
  %param_2.12937 = load double, ptr %param_2.1293, align 8, !invariant.load !191
  %35 = call double @__nv_exp(double %param_2.12937)
  %multiply.3576.3 = fmul double %34, %35
  %36 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3576.3, ptr %36, align 8
  br label %dynamic-update-slice.2120.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_99(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(20) %arg3) {
entry:
  %param_2.1369 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_770_37 = load i64, ptr @261, align 8
  %0 = icmp slt i64 %param_2.1369, %constant_770_37
  %1 = zext i1 %0 to i8
  %param_2.13691 = load i64, ptr %arg2, align 8, !invariant.load !191
  %constant_769_66 = load i64, ptr @260, align 8
  %2 = add i64 %param_2.13691, %constant_769_66
  %param_2.13692 = load i64, ptr %arg2, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.13692
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_373 = load i64, ptr @261, align 8
  %9 = icmp sge i64 0, %constant_770_373
  %10 = select i1 %9, i64 0, i64 %constant_770_373
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_374 = load i64, ptr @261, align 8
  %13 = icmp sge i64 0, %constant_770_374
  %14 = select i1 %13, i64 0, i64 %constant_770_374
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2123.1.in_bounds-true, label %dynamic-update-slice.2123.1.in_bounds-after

dynamic-update-slice.2123.1.in_bounds-after:      ; preds = %dynamic-update-slice.2123.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2123.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %param_3.1203 = getelementptr inbounds [20 x i8], ptr %arg3, i64 0, i64 %21
  %param_3.12035 = load i8, ptr %param_3.1203, align 1, !invariant.load !191
  %29 = zext i8 %param_3.12035 to i32
  %constant_780_12 = load i32, ptr @259, align 4
  %30 = icmp eq i32 %29, %constant_780_12
  %31 = zext i1 %30 to i8
  %32 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1540 = getelementptr inbounds double, ptr %32, i64 0
  %param_1.15406 = load double, ptr %param_1.1540, align 8, !invariant.load !191
  %constant_776_18 = load double, ptr @258, align 8
  %33 = trunc i8 %31 to i1
  %34 = select i1 %33, double %param_1.15406, double %constant_776_18
  %35 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %34, ptr %35, align 8
  br label %dynamic-update-slice.2123.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_37(ptr noalias align 128 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(19200) %arg2, ptr noalias align 16 dereferenceable(160) %arg3) {
entry:
  %param_1.1547 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_770_44 = load i64, ptr @263, align 8
  %0 = icmp slt i64 %param_1.1547, %constant_770_44
  %1 = zext i1 %0 to i8
  %param_1.15471 = load i64, ptr %arg1, align 8, !invariant.load !191
  %constant_769_81 = load i64, ptr @262, align 8
  %2 = add i64 %param_1.15471, %constant_769_81
  %param_1.15472 = load i64, ptr %arg1, align 8, !invariant.load !191
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.15472
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_770_443 = load i64, ptr @263, align 8
  %9 = icmp sge i64 0, %constant_770_443
  %10 = select i1 %9, i64 0, i64 %constant_770_443
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_770_444 = load i64, ptr @263, align 8
  %13 = icmp sge i64 0, %constant_770_444
  %14 = select i1 %13, i64 0, i64 %constant_770_444
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 20
  %22 = udiv i64 %linear_index0, 20
  %23 = urem i64 %22, 120
  %24 = udiv i64 %linear_index0, 2400
  %25 = icmp ult i64 %linear_index, 2400
  br i1 %25, label %dynamic-update-slice.2088.1.in_bounds-true, label %dynamic-update-slice.2088.1.in_bounds-after

dynamic-update-slice.2088.1.in_bounds-after:      ; preds = %dynamic-update-slice.2088.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2088.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1288 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.12885 = load double, ptr %param_2.1288, align 8, !invariant.load !191
  %param_3.1123 = getelementptr inbounds [20 x double], ptr %arg3, i64 0, i64 %21
  %param_3.11236 = load double, ptr %param_3.1123, align 8, !invariant.load !191
  %30 = call double @__nv_exp(double %param_3.11236)
  %multiply.3561.3 = fmul double %param_2.12885, %30
  %31 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 %28
  store double %multiply.3561.3, ptr %31, align 8
  br label %dynamic-update-slice.2088.1.in_bounds-after
}

define void @loop_add_fusion_1(ptr noalias align 128 dereferenceable(8) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !195
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
  %constant_768_1 = load i64, ptr @264, align 8
  %5 = add i64 %4, %constant_768_1
  store i64 %5, ptr %arg0, align 8
  br label %loop_add_fusion.1.in_bounds-after
}

define void @copy_fusion_7(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(1536) %arg2, ptr noalias align 16 dereferenceable(19200) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(1536) %arg6, ptr noalias align 128 dereferenceable(19200) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !200
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2688
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 2632
  br i1 %4, label %copy_fusion.7.in_bounds-true, label %copy_fusion.7.in_bounds-after

copy_fusion.7.in_bounds-after:                    ; preds = %slice3-after, %entry
  ret void

copy_fusion.7.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.40.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = getelementptr inbounds [20 x [1 x double]], ptr %arg0, i32 0, i32 %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !191
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.20.1
  %9 = phi i32 [ 20, %concatenate.pivot.20.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = getelementptr inbounds [20 x [1 x double]], ptr %arg1, i32 0, i32 %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !191
  br label %concatenate.3.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.40.2
  %13 = phi i32 [ 40, %concatenate.pivot.40.2 ]
  %14 = sub nsw i32 %3, %13
  %15 = getelementptr inbounds [192 x double], ptr %arg2, i32 0, i32 %14
  %16 = load double, ptr %15, align 8, !invariant.load !191
  br label %concatenate.3.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.232.3
  %17 = phi i32 [ 232, %concatenate.pivot.232.3 ]
  %18 = sub nsw i32 %3, %17
  %19 = mul nuw nsw i32 %18, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 20
  %22 = udiv i32 %20, 20
  %23 = udiv i32 %22, 120
  %24 = getelementptr inbounds [120 x [20 x [1 x double]]], ptr %arg3, i32 0, i32 %22, i32 %21, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !191
  br label %concatenate.3.merge

concatenate.pivot.40.:                            ; preds = %copy_fusion.7.in_bounds-true
  %26 = icmp ult i32 %3, 40
  br i1 %26, label %concatenate.pivot.20., label %concatenate.pivot.232.

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.40.
  %27 = icmp ult i32 %3, 20
  br i1 %27, label %concatenate.pivot.0., label %concatenate.pivot.20.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id0

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id1

concatenate.pivot.232.:                           ; preds = %concatenate.pivot.40.
  %28 = icmp ult i32 %3, 232
  br i1 %28, label %concatenate.pivot.40.2, label %concatenate.pivot.232.3

concatenate.pivot.40.2:                           ; preds = %concatenate.pivot.232.
  br label %concat_index_from_operand_id2

concatenate.pivot.232.3:                          ; preds = %concatenate.pivot.232.
  br label %concat_index_from_operand_id3

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %29 = phi double [ %8, %concat_index_from_operand_id0 ], [ %12, %concat_index_from_operand_id1 ], [ %16, %concat_index_from_operand_id2 ], [ %25, %concat_index_from_operand_id3 ]
  %30 = icmp sge i32 %3, 0
  %31 = icmp slt i32 %3, 20
  %32 = and i1 %30, %31
  br i1 %32, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.3.merge
  %33 = icmp sge i32 %3, 20
  %34 = icmp slt i32 %3, 40
  %35 = and i1 %33, %34
  br i1 %35, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %36 = icmp sge i32 %3, 40
  %37 = icmp slt i32 %3, 232
  %38 = and i1 %36, %37
  br i1 %38, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %39 = icmp sge i32 %3, 232
  %40 = icmp slt i32 %3, 2632
  %41 = and i1 %39, %40
  br i1 %41, label %slice3-true, label %slice3-after

slice3-after:                                     ; preds = %slice3-true, %slice2-after
  br label %copy_fusion.7.in_bounds-after

slice0-true:                                      ; preds = %concatenate.3.merge
  %42 = sub i32 %3, 0
  %43 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %42
  store double %29, ptr %43, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %44 = sub i32 %3, 20
  %45 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %44
  store double %29, ptr %45, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %46 = sub i32 %3, 40
  %47 = getelementptr inbounds [192 x double], ptr %arg6, i32 0, i32 %46
  store double %29, ptr %47, align 8
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  %48 = sub i32 %3, 232
  %49 = getelementptr inbounds [2400 x double], ptr %arg7, i32 0, i32 %48
  store double %29, ptr %49, align 8
  br label %slice3-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{ptr @copy_fusion_13, !"kernel", i32 1}
!3 = !{ptr @copy_fusion_13, !"reqntidx", i32 128}
!4 = !{ptr @input_slice_fusion_1, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion_1, !"reqntidx", i32 128}
!6 = !{ptr @input_slice_fusion_2, !"kernel", i32 1}
!7 = !{ptr @input_slice_fusion_2, !"reqntidx", i32 128}
!8 = !{ptr @loop_broadcast_fusion_2, !"kernel", i32 1}
!9 = !{ptr @loop_broadcast_fusion_2, !"reqntidx", i32 256}
!10 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!11 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!12 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_convert_dynamic_slice_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_convert_dynamic_slice_fusion, !"reqntidx", i32 1}
!16 = !{ptr @loop_divide_multiply_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 20}
!18 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_divide_fusion, !"reqntidx", i32 20}
!20 = !{ptr @loop_dynamic_update_slice_fusion_103, !"kernel", i32 1}
!21 = !{ptr @loop_dynamic_update_slice_fusion_103, !"reqntidx", i32 1}
!22 = !{ptr @loop_dynamic_update_slice_fusion_78, !"kernel", i32 1}
!23 = !{ptr @loop_dynamic_update_slice_fusion_78, !"reqntidx", i32 1}
!24 = !{ptr @loop_dynamic_update_slice_fusion_85, !"kernel", i32 1}
!25 = !{ptr @loop_dynamic_update_slice_fusion_85, !"reqntidx", i32 20}
!26 = !{ptr @loop_dynamic_update_slice_fusion_93, !"kernel", i32 1}
!27 = !{ptr @loop_dynamic_update_slice_fusion_93, !"reqntidx", i32 20}
!28 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!29 = !{ptr @loop_add_fusion, !"reqntidx", i32 20}
!30 = !{ptr @loop_add_fusion, !"reqntidy", i32 7}
!31 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!32 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 128}
!33 = !{ptr @loop_dynamic_update_slice_fusion_84, !"kernel", i32 1}
!34 = !{ptr @loop_dynamic_update_slice_fusion_84, !"reqntidx", i32 20}
!35 = !{ptr @loop_dynamic_update_slice_fusion_82, !"kernel", i32 1}
!36 = !{ptr @loop_dynamic_update_slice_fusion_82, !"reqntidx", i32 20}
!37 = !{ptr @loop_dynamic_update_slice_fusion_77, !"kernel", i32 1}
!38 = !{ptr @loop_dynamic_update_slice_fusion_77, !"reqntidx", i32 20}
!39 = !{ptr @loop_dynamic_update_slice_fusion_80, !"kernel", i32 1}
!40 = !{ptr @loop_dynamic_update_slice_fusion_80, !"reqntidx", i32 20}
!41 = !{ptr @loop_dynamic_update_slice_fusion_76, !"kernel", i32 1}
!42 = !{ptr @loop_dynamic_update_slice_fusion_76, !"reqntidx", i32 20}
!43 = !{ptr @loop_dynamic_update_slice_fusion_67, !"kernel", i32 1}
!44 = !{ptr @loop_dynamic_update_slice_fusion_67, !"reqntidx", i32 20}
!45 = !{ptr @loop_dynamic_update_slice_fusion_83, !"kernel", i32 1}
!46 = !{ptr @loop_dynamic_update_slice_fusion_83, !"reqntidx", i32 20}
!47 = !{ptr @loop_dynamic_update_slice_fusion_86, !"kernel", i32 1}
!48 = !{ptr @loop_dynamic_update_slice_fusion_86, !"reqntidx", i32 20}
!49 = !{ptr @loop_dynamic_update_slice_fusion_44, !"kernel", i32 1}
!50 = !{ptr @loop_dynamic_update_slice_fusion_44, !"reqntidx", i32 20}
!51 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!52 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 20}
!53 = !{ptr @loop_dynamic_update_slice_fusion_102, !"kernel", i32 1}
!54 = !{ptr @loop_dynamic_update_slice_fusion_102, !"reqntidx", i32 20}
!55 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!56 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 20}
!57 = !{ptr @loop_dynamic_update_slice_fusion_60, !"kernel", i32 1}
!58 = !{ptr @loop_dynamic_update_slice_fusion_60, !"reqntidx", i32 20}
!59 = !{ptr @loop_dynamic_update_slice_fusion_88, !"kernel", i32 1}
!60 = !{ptr @loop_dynamic_update_slice_fusion_88, !"reqntidx", i32 20}
!61 = !{ptr @loop_dynamic_update_slice_fusion_91, !"kernel", i32 1}
!62 = !{ptr @loop_dynamic_update_slice_fusion_91, !"reqntidx", i32 20}
!63 = !{ptr @loop_dynamic_update_slice_fusion_94, !"kernel", i32 1}
!64 = !{ptr @loop_dynamic_update_slice_fusion_94, !"reqntidx", i32 20}
!65 = !{ptr @loop_add_divide_exponential_fusion, !"kernel", i32 1}
!66 = !{ptr @loop_add_divide_exponential_fusion, !"reqntidx", i32 20}
!67 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!68 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!69 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!70 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 20}
!71 = !{ptr @wrapped_convert, !"kernel", i32 1}
!72 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!73 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!74 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 20}
!75 = !{ptr @loop_compare_multiply_select_fusion, !"kernel", i32 1}
!76 = !{ptr @loop_compare_multiply_select_fusion, !"reqntidx", i32 20}
!77 = !{ptr @loop_broadcast_select_fusion, !"kernel", i32 1}
!78 = !{ptr @loop_broadcast_select_fusion, !"reqntidx", i32 128}
!79 = !{ptr @loop_dynamic_update_slice_fusion_74, !"kernel", i32 1}
!80 = !{ptr @loop_dynamic_update_slice_fusion_74, !"reqntidx", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_70, !"kernel", i32 1}
!82 = !{ptr @loop_dynamic_update_slice_fusion_70, !"reqntidx", i32 20}
!83 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!84 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 128}
!85 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!86 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 128}
!87 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!88 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 128}
!89 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!90 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 128}
!91 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!92 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 128}
!93 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!94 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 128}
!95 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!96 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 128}
!97 = !{ptr @loop_dynamic_update_slice_fusion_32, !"kernel", i32 1}
!98 = !{ptr @loop_dynamic_update_slice_fusion_32, !"reqntidx", i32 128}
!99 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!100 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 128}
!101 = !{ptr @loop_dynamic_update_slice_fusion_98, !"kernel", i32 1}
!102 = !{ptr @loop_dynamic_update_slice_fusion_98, !"reqntidx", i32 128}
!103 = !{ptr @loop_add_and_compare_divide_multiply_select_fusion, !"kernel", i32 1}
!104 = !{ptr @loop_add_and_compare_divide_multiply_select_fusion, !"reqntidx", i32 20}
!105 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!106 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 20}
!107 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!108 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 20}
!109 = !{ptr @loop_dynamic_update_slice_fusion_49, !"kernel", i32 1}
!110 = !{ptr @loop_dynamic_update_slice_fusion_49, !"reqntidx", i32 20}
!111 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!112 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 20}
!113 = !{ptr @loop_dynamic_update_slice_fusion_52, !"kernel", i32 1}
!114 = !{ptr @loop_dynamic_update_slice_fusion_52, !"reqntidx", i32 20}
!115 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!116 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 20}
!117 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!118 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 20}
!119 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!120 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 20}
!121 = !{ptr @loop_dynamic_update_slice_fusion_57, !"kernel", i32 1}
!122 = !{ptr @loop_dynamic_update_slice_fusion_57, !"reqntidx", i32 20}
!123 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!124 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 20}
!125 = !{ptr @loop_dynamic_update_slice_fusion_65, !"kernel", i32 1}
!126 = !{ptr @loop_dynamic_update_slice_fusion_65, !"reqntidx", i32 20}
!127 = !{ptr @loop_dynamic_update_slice_fusion_62, !"kernel", i32 1}
!128 = !{ptr @loop_dynamic_update_slice_fusion_62, !"reqntidx", i32 20}
!129 = !{ptr @loop_dynamic_update_slice_fusion_63, !"kernel", i32 1}
!130 = !{ptr @loop_dynamic_update_slice_fusion_63, !"reqntidx", i32 20}
!131 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!132 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 20}
!133 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!134 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 20}
!135 = !{ptr @loop_dynamic_update_slice_fusion_58, !"kernel", i32 1}
!136 = !{ptr @loop_dynamic_update_slice_fusion_58, !"reqntidx", i32 20}
!137 = !{ptr @loop_dynamic_update_slice_fusion_47, !"kernel", i32 1}
!138 = !{ptr @loop_dynamic_update_slice_fusion_47, !"reqntidx", i32 20}
!139 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!140 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 128}
!141 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!142 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 128}
!143 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!144 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 128}
!145 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!146 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 128}
!147 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!148 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 128}
!149 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!150 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 128}
!151 = !{ptr @loop_dynamic_update_slice_fusion_36, !"kernel", i32 1}
!152 = !{ptr @loop_dynamic_update_slice_fusion_36, !"reqntidx", i32 128}
!153 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!154 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 128}
!155 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!156 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 128}
!157 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!158 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 128}
!159 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!160 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 128}
!161 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!162 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 128}
!163 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!164 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 128}
!165 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!166 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 128}
!167 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!168 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 128}
!169 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!170 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 128}
!171 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!172 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 128}
!173 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!174 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 128}
!175 = !{ptr @loop_dynamic_update_slice_fusion_101, !"kernel", i32 1}
!176 = !{ptr @loop_dynamic_update_slice_fusion_101, !"reqntidx", i32 128}
!177 = !{ptr @loop_dynamic_update_slice_fusion_100, !"kernel", i32 1}
!178 = !{ptr @loop_dynamic_update_slice_fusion_100, !"reqntidx", i32 128}
!179 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!180 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 128}
!181 = !{ptr @loop_dynamic_update_slice_fusion_99, !"kernel", i32 1}
!182 = !{ptr @loop_dynamic_update_slice_fusion_99, !"reqntidx", i32 128}
!183 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!184 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 128}
!185 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!186 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!187 = !{ptr @copy_fusion_7, !"kernel", i32 1}
!188 = !{ptr @copy_fusion_7, !"reqntidx", i32 128}
!189 = !{i32 0, i32 60}
!190 = !{i32 0, i32 128}
!191 = !{}
!192 = !{i32 0, i32 32}
!193 = !{i32 0, i32 450}
!194 = !{i32 0, i32 256}
!195 = !{i32 0, i32 1}
!196 = !{i32 0, i32 20}
!197 = !{i32 0, i32 18}
!198 = !{i32 0, i32 7}
!199 = !{i32 0, i32 19}
!200 = !{i32 0, i32 21}
