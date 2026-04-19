; ModuleID = 'jit_while'
source_filename = "jit_while"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2738_0 = constant [64 x i8] zeroinitializer, align 128
@0 = private unnamed_addr constant [8 x i8] c"\C6\00\00\00\00\00\00\00"
@1 = private unnamed_addr constant [8 x i8] c"\F1h\E3\88\B5\F8\E4>"
@buffer_for_constant_2459_0 = constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_2497_0 = constant [64 x i8] c"\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_2458_0 = constant [64 x i8] c"\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_2480_0 = constant [64 x i8] zeroinitializer, align 128
@2 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@3 = private unnamed_addr constant [8 x i8] zeroinitializer
@4 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@5 = private unnamed_addr constant [8 x i8] zeroinitializer
@6 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@7 = private unnamed_addr constant [8 x i8] zeroinitializer
@8 = private unnamed_addr constant [8 x i8] zeroinitializer
@9 = private unnamed_addr constant [8 x i8] c"\09\00\00\00\00\00\00\00"
@10 = private unnamed_addr constant [8 x i8] c"\13\00\00\00\00\00\00\00"
@11 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@12 = private unnamed_addr constant [8 x i8] zeroinitializer
@13 = private unnamed_addr constant [8 x i8] zeroinitializer
@14 = private unnamed_addr constant [8 x i8] c"\09\00\00\00\00\00\00\00"
@15 = private unnamed_addr constant [8 x i8] c"\13\00\00\00\00\00\00\00"
@16 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@17 = private unnamed_addr constant [8 x i8] c"\09\00\00\00\00\00\00\00"
@18 = private unnamed_addr constant [8 x i8] c"\13\00\00\00\00\00\00\00"
@19 = private unnamed_addr constant [8 x i8] zeroinitializer
@20 = private unnamed_addr constant [8 x i8] zeroinitializer
@21 = private unnamed_addr constant [8 x i8] c"\09\00\00\00\00\00\00\00"
@22 = private unnamed_addr constant [8 x i8] c"\13\00\00\00\00\00\00\00"
@23 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@24 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@25 = private unnamed_addr constant [8 x i8] zeroinitializer
@26 = private unnamed_addr constant [8 x i8] zeroinitializer
@27 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@28 = private unnamed_addr constant [8 x i8] zeroinitializer
@29 = private unnamed_addr constant [8 x i8] zeroinitializer
@30 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@31 = private unnamed_addr constant [8 x i8] zeroinitializer
@32 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@33 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@34 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8?"
@35 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@36 = private unnamed_addr constant [8 x i8] zeroinitializer
@37 = private unnamed_addr constant [8 x i8] zeroinitializer
@38 = private unnamed_addr constant [1 x i8] zeroinitializer
@39 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@40 = private unnamed_addr constant [1 x i8] zeroinitializer
@41 = private unnamed_addr constant [4 x i8] zeroinitializer
@42 = private unnamed_addr constant [8 x i8] zeroinitializer
@43 = private unnamed_addr constant [4 x i8] zeroinitializer
@44 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@45 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@46 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@47 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@48 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@49 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@50 = private unnamed_addr constant [8 x i8] zeroinitializer
@51 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@52 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@53 = private unnamed_addr constant [8 x i8] zeroinitializer
@54 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@55 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@56 = private unnamed_addr constant [8 x i8] zeroinitializer
@57 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@58 = private unnamed_addr constant [8 x i8] zeroinitializer
@59 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@60 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@61 = private unnamed_addr constant [8 x i8] zeroinitializer
@62 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@63 = private unnamed_addr constant [4 x i8] zeroinitializer
@64 = private unnamed_addr constant [8 x i8] zeroinitializer
@65 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@66 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@67 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@68 = private unnamed_addr constant [8 x i8] zeroinitializer
@69 = private unnamed_addr constant [8 x i8] zeroinitializer
@70 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@71 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@72 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@73 = private unnamed_addr constant [8 x i8] zeroinitializer
@74 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@75 = private unnamed_addr constant [8 x i8] zeroinitializer
@76 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@77 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@78 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@79 = private unnamed_addr constant [8 x i8] zeroinitializer
@80 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@81 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@82 = private unnamed_addr constant [8 x i8] zeroinitializer
@83 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@84 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@85 = private unnamed_addr constant [8 x i8] zeroinitializer
@86 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@87 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@88 = private unnamed_addr constant [8 x i8] zeroinitializer
@89 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@90 = private unnamed_addr constant [8 x i8] zeroinitializer
@91 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@92 = private unnamed_addr constant [8 x i8] zeroinitializer
@93 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@94 = private unnamed_addr constant [8 x i8] zeroinitializer
@95 = private unnamed_addr constant [8 x i8] zeroinitializer
@96 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@97 = private unnamed_addr constant [8 x i8] zeroinitializer
@98 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@99 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@100 = private unnamed_addr constant [8 x i8] zeroinitializer
@101 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@102 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@103 = private unnamed_addr constant [8 x i8] zeroinitializer
@104 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@105 = private unnamed_addr constant [8 x i8] zeroinitializer
@106 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@107 = private unnamed_addr constant [8 x i8] zeroinitializer
@108 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@109 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@110 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@111 = private unnamed_addr constant [8 x i8] zeroinitializer
@112 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@113 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@114 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@115 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@116 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@117 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@118 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@119 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@120 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@121 = private unnamed_addr constant [8 x i8] zeroinitializer
@122 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@123 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@124 = private unnamed_addr constant [8 x i8] zeroinitializer
@125 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@126 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@127 = private unnamed_addr constant [8 x i8] zeroinitializer
@128 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@129 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@130 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@131 = private unnamed_addr constant [8 x i8] zeroinitializer
@132 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@133 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@134 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@135 = private unnamed_addr constant [8 x i8] zeroinitializer
@136 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@137 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@138 = private unnamed_addr constant [8 x i8] zeroinitializer
@139 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@140 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@141 = private unnamed_addr constant [8 x i8] zeroinitializer
@142 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@143 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@144 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@145 = private unnamed_addr constant [8 x i8] zeroinitializer
@146 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@147 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@148 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@149 = private unnamed_addr constant [8 x i8] zeroinitializer
@150 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@151 = private unnamed_addr constant [8 x i8] zeroinitializer
@152 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@153 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@154 = private unnamed_addr constant [8 x i8] zeroinitializer
@155 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@156 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@157 = private unnamed_addr constant [8 x i8] zeroinitializer
@158 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@159 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@160 = private unnamed_addr constant [8 x i8] zeroinitializer
@161 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@162 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@163 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@164 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@165 = private unnamed_addr constant [8 x i8] zeroinitializer
@166 = private unnamed_addr constant [8 x i8] zeroinitializer
@167 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@168 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@169 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@170 = private unnamed_addr constant [8 x i8] zeroinitializer
@171 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@172 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@173 = private unnamed_addr constant [8 x i8] zeroinitializer
@174 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@175 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@176 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@177 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@178 = private unnamed_addr constant [8 x i8] zeroinitializer
@179 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@180 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@181 = private unnamed_addr constant [8 x i8] zeroinitializer
@182 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@183 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@184 = private unnamed_addr constant [8 x i8] zeroinitializer
@185 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@186 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@187 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@188 = private unnamed_addr constant [8 x i8] zeroinitializer
@189 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@190 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@191 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@192 = private unnamed_addr constant [8 x i8] zeroinitializer
@193 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@194 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@195 = private unnamed_addr constant [8 x i8] zeroinitializer
@196 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@197 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>@"
@198 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>\C0"
@199 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\FF"
@200 = private unnamed_addr constant [8 x i8] zeroinitializer
@201 = private unnamed_addr constant [8 x i8] zeroinitializer
@202 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@203 = private unnamed_addr constant [8 x i8] zeroinitializer
@204 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@205 = private unnamed_addr constant [1 x i8] c"\01"
@206 = private unnamed_addr constant [8 x i8] zeroinitializer
@207 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@208 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>@"
@209 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>\C0"
@210 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@211 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [32 x [33 x double]] undef
@212 = private unnamed_addr constant [8 x i8] zeroinitializer
@213 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@214 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@215 = private unnamed_addr constant [8 x i8] zeroinitializer
@216 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@217 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@218 = private unnamed_addr constant [8 x i8] zeroinitializer
@219 = private unnamed_addr constant [8 x i8] zeroinitializer
@220 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@221 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@222 = private unnamed_addr constant [8 x i8] zeroinitializer
@223 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@224 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@225 = private unnamed_addr constant [8 x i8] zeroinitializer
@226 = private unnamed_addr constant [8 x i8] zeroinitializer
@227 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@228 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@229 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@230 = private unnamed_addr constant [8 x i8] zeroinitializer
@231 = private unnamed_addr constant [8 x i8] zeroinitializer
@232 = private unnamed_addr constant [8 x i8] zeroinitializer
@233 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@234 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@235 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@236 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@237 = private unnamed_addr constant [4 x i8] zeroinitializer
@238 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@239 = private unnamed_addr constant [8 x i8] zeroinitializer
@240 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@241 = private unnamed_addr constant [8 x i8] c"\15\13\AA%\BB\E6\DC?"
@242 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@243 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@244 = private unnamed_addr constant [8 x i8] zeroinitializer
@245 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@246 = private unnamed_addr constant [8 x i8] zeroinitializer
@247 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@248 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@249 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [32 x [33 x double]] undef
@250 = private unnamed_addr constant [8 x i8] zeroinitializer
@251 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@252 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@253 = private unnamed_addr constant [8 x i8] zeroinitializer
@254 = private unnamed_addr constant [8 x i8] zeroinitializer
@255 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@256 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\18@"
@257 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache2 = private addrspace(3) global [1 x [8 x double]] undef
@258 = private unnamed_addr constant [8 x i8] zeroinitializer
@259 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@260 = private unnamed_addr constant [8 x i8] c"\B4\BEd\C8\F1g\FD?"
@261 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@262 = private unnamed_addr constant [8 x i8] c"R|\AFc\1A\CB\09@"
@263 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@264 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\18@"
@265 = private unnamed_addr constant [8 x i8] c"\EBP\CA\BF@3\F4?"
@266 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@267 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@268 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@269 = private unnamed_addr constant [8 x i8] c"\CD\CC\CC\CC\CC\CC\EC?"
@270 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@271 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@272 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@273 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@274 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@275 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@276 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@277 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@278 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@279 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@280 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@281 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@282 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@283 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\18@"
@284 = private unnamed_addr constant [8 x i8] zeroinitializer
@285 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@286 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@287 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@288 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@289 = private unnamed_addr constant [8 x i8] zeroinitializer
@290 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@291 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@292 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@293 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@294 = private unnamed_addr constant [8 x i8] zeroinitializer
@295 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@296 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@297 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@298 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@299 = private unnamed_addr constant [8 x i8] zeroinitializer
@300 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@301 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@302 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@303 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@304 = private unnamed_addr constant [8 x i8] zeroinitializer
@305 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@306 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@307 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@308 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@309 = private unnamed_addr constant [8 x i8] zeroinitializer
@310 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@311 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@312 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@313 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@314 = private unnamed_addr constant [8 x i8] zeroinitializer
@315 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@316 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@317 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@318 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@319 = private unnamed_addr constant [8 x i8] c"\1C\00\00\00\00\00\00\00"
@buffer_for_constant_3009_0 = constant [64 x i8] zeroinitializer, align 128
@320 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@321 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@322 = private unnamed_addr constant [8 x i8] zeroinitializer
@323 = private unnamed_addr constant [8 x i8] zeroinitializer
@324 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@325 = private unnamed_addr constant [8 x i8] c"\B4\BEd\C8\F1g\FD?"
@326 = private unnamed_addr constant [8 x i8] zeroinitializer
@327 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@328 = private unnamed_addr constant [8 x i8] c"R|\AFc\1A\CB\09@"
@329 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@330 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@331 = private unnamed_addr constant [8 x i8] zeroinitializer
@332 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@333 = private unnamed_addr constant [8 x i8] c"\EBP\CA\BF@3\F4?"
@334 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@335 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@336 = private unnamed_addr constant [8 x i8] zeroinitializer
@337 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@338 = private unnamed_addr constant [8 x i8] c"\15\13\AA%\BB\E6\DC?"
@339 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@340 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@341 = private unnamed_addr constant [8 x i8] zeroinitializer
@342 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@343 = private unnamed_addr constant [8 x i8] c"R|\AFc\1A\CB\09@"
@344 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@345 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\18@"
@346 = private unnamed_addr constant [8 x i8] zeroinitializer
@347 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@348 = private unnamed_addr constant [8 x i8] c"\B4\BEd\C8\F1g\FD?"
@349 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@350 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@351 = private unnamed_addr constant [8 x i8] zeroinitializer
@352 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@353 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\18@"
@354 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@355 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@356 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@357 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@358 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@359 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@360 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@361 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@362 = private unnamed_addr constant [8 x i8] c"\CD\CC\CC\CC\CC\CC\EC?"
@363 = private unnamed_addr constant [8 x i8] zeroinitializer
@364 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@365 = private unnamed_addr constant [8 x i8] c"\1E\00\00\00\00\00\00\00"
@366 = private unnamed_addr constant [8 x i8] zeroinitializer
@367 = private unnamed_addr constant [8 x i8] zeroinitializer
@368 = private unnamed_addr constant [8 x i8] zeroinitializer
@369 = private unnamed_addr constant [8 x i8] zeroinitializer
@370 = private unnamed_addr constant [8 x i8] zeroinitializer
@371 = private unnamed_addr constant [8 x i8] zeroinitializer
@372 = private unnamed_addr constant [8 x i8] zeroinitializer
@373 = private unnamed_addr constant [8 x i8] zeroinitializer
@374 = private unnamed_addr constant [8 x i8] zeroinitializer
@375 = private unnamed_addr constant [8 x i8] zeroinitializer
@376 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@377 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\18@"
@378 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@379 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@380 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@381 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@382 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@383 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@384 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@385 = private unnamed_addr constant [8 x i8] zeroinitializer
@buffer_for_constant_3113_0 = constant [64 x i8] zeroinitializer, align 128
@386 = private unnamed_addr constant [8 x i8] zeroinitializer
@387 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\08@"
@388 = private unnamed_addr constant [8 x i8] c"\9A\99\99\99\99\99\C9?"
@389 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@390 = private unnamed_addr constant [8 x i8] c"\9A\99\99\99\99\99\B9?"
@391 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@392 = private unnamed_addr constant [8 x i8] zeroinitializer
@393 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@394 = private unnamed_addr constant [8 x i8] c"\B4\BEd\C8\F1g\FD?"
@395 = private unnamed_addr constant [8 x i8] zeroinitializer
@396 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@397 = private unnamed_addr constant [8 x i8] c"R|\AFc\1A\CB\09@"
@398 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@399 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@400 = private unnamed_addr constant [8 x i8] zeroinitializer
@401 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@402 = private unnamed_addr constant [8 x i8] c"\B4\BEd\C8\F1g\FD?"
@403 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@404 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@405 = private unnamed_addr constant [8 x i8] zeroinitializer
@406 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@407 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\18@"
@408 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@409 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@410 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@411 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@412 = private unnamed_addr constant [8 x i8] c"-C\1C\EB\E26\1A?"
@413 = private unnamed_addr constant [8 x i8] c"\8D\ED\B5\A0\F7\C6\B0>"
@414 = private unnamed_addr constant [8 x i8] c"<N\D1\91\\\FE\EF\BF"
@415 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@416 = private unnamed_addr constant [8 x i8] c"\CD\CC\CC\CC\CC\CC\EC?"
@417 = private unnamed_addr constant [8 x i8] c"\1E\00\00\00\00\00\00\00"
@418 = private unnamed_addr constant [8 x i8] zeroinitializer
@419 = private unnamed_addr constant [8 x i8] zeroinitializer
@420 = private unnamed_addr constant [8 x i8] zeroinitializer
@421 = private unnamed_addr constant [8 x i8] zeroinitializer
@422 = private unnamed_addr constant [8 x i8] zeroinitializer
@423 = private unnamed_addr constant [8 x i8] zeroinitializer
@424 = private unnamed_addr constant [8 x i8] zeroinitializer
@425 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@426 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@buffer_for_constant_23853_0 = constant [64 x i8] zeroinitializer, align 128
@427 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@428 = private unnamed_addr constant [8 x i8] zeroinitializer
@429 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@430 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>@"
@431 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>\C0"
@432 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\FF"
@433 = private unnamed_addr constant [8 x i8] zeroinitializer
@434 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@435 = private unnamed_addr constant [8 x i8] zeroinitializer
@436 = private unnamed_addr constant [1 x i8] c"\01"
@437 = private unnamed_addr constant [8 x i8] zeroinitializer
@438 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@439 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>@"
@440 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>\C0"
@441 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@442 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache3 = private addrspace(3) global [32 x [33 x double]] undef
@443 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@444 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\18@"
@445 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@446 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@447 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@448 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@449 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@450 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@451 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@452 = private unnamed_addr constant [8 x i8] zeroinitializer
@453 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@454 = private unnamed_addr constant [8 x i8] c"\EBP\CA\BF@3\F4?"
@455 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@456 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@457 = private unnamed_addr constant [8 x i8] zeroinitializer
@458 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@459 = private unnamed_addr constant [8 x i8] c"\B4\BEd\C8\F1g\FD?"
@460 = private unnamed_addr constant [8 x i8] zeroinitializer
@461 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@462 = private unnamed_addr constant [8 x i8] c"\15\13\AA%\BB\E6\DC?"
@463 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@464 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@465 = private unnamed_addr constant [1 x i8] c"\01"
@466 = private unnamed_addr constant [4 x i8] zeroinitializer
@467 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@468 = private unnamed_addr constant [8 x i8] zeroinitializer
@469 = private unnamed_addr constant [4 x i8] zeroinitializer
@470 = private unnamed_addr constant [4 x i8] zeroinitializer
@471 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@472 = private unnamed_addr constant [8 x i8] zeroinitializer
@473 = private unnamed_addr constant [8 x i8] zeroinitializer
@474 = private unnamed_addr constant [8 x i8] zeroinitializer
@475 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@476 = private unnamed_addr constant [8 x i8] zeroinitializer
@477 = private unnamed_addr constant [8 x i8] zeroinitializer
@478 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@479 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@480 = private unnamed_addr constant [8 x i8] zeroinitializer
@481 = private unnamed_addr constant [8 x i8] zeroinitializer
@482 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@483 = private unnamed_addr constant [8 x i8] zeroinitializer
@484 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@485 = private unnamed_addr constant [8 x i8] zeroinitializer
@486 = private unnamed_addr constant [8 x i8] zeroinitializer
@487 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@488 = private unnamed_addr constant [4 x i8] c"\09\00\00\00"
@489 = private unnamed_addr constant [4 x i8] zeroinitializer
@490 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_and_fusion_1(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(1) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_and_fusion.1.in_bounds-true, label %loop_and_fusion.1.in_bounds-after

loop_and_fusion.1.in_bounds-after:                ; preds = %loop_and_fusion.1.in_bounds-true, %entry
  ret void

loop_and_fusion.1.in_bounds-true:                 ; preds = %entry
  %4 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_2457_1 = load double, ptr @1, align 8
  %compare.2763.1 = fcmp ogt double %4, %constant_2457_1
  %5 = zext i1 %compare.2763.1 to i8
  %6 = load i64, ptr %arg0, align 8, !invariant.load !349
  %7 = load i64, ptr %arg1, align 8, !invariant.load !349
  %8 = add i64 %6, %7
  %constant_2456_1 = load i64, ptr @0, align 8
  %9 = icmp sle i64 %8, %constant_2456_1
  %10 = zext i1 %9 to i8
  %11 = and i8 %5, %10
  store i8 %11, ptr %arg3, align 1
  br label %loop_and_fusion.1.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_select_fusion_29(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(80) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !350
  %2 = mul nuw nsw i32 %0, 10
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 10
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 10
  br i1 %4, label %loop_select_fusion.29.in_bounds-true, label %loop_select_fusion.29.in_bounds-after

loop_select_fusion.29.in_bounds-after:            ; preds = %loop_select_fusion.29.in_bounds-true, %entry
  ret void

loop_select_fusion.29.in_bounds-true:             ; preds = %entry
  %5 = load i64, ptr %arg0, align 8, !invariant.load !349
  %6 = load i64, ptr %arg1, align 8, !invariant.load !349
  %7 = add i64 %5, %6
  %constant_2462_3 = load i64, ptr @2, align 8
  %8 = icmp eq i64 %constant_2462_3, 0
  %9 = icmp eq i64 %7, -9223372036854775808
  %10 = icmp eq i64 %constant_2462_3, -1
  %11 = and i1 %9, %10
  %12 = or i1 %11, %8
  %13 = select i1 %12, i64 1, i64 %constant_2462_3
  %14 = srem i64 %7, %13
  %15 = select i1 %11, i64 0, i64 %14
  %16 = select i1 %8, i64 %7, i64 %15
  %constant_2459_3 = load i64, ptr @3, align 8
  %17 = icmp slt i64 %16, %constant_2459_3
  %18 = zext i1 %17 to i8
  %constant_2459_31 = load i64, ptr @3, align 8
  %19 = icmp ne i64 %16, %constant_2459_31
  %20 = zext i1 %19 to i8
  %21 = and i8 %18, %20
  %constant_2462_32 = load i64, ptr @2, align 8
  %22 = add i64 %16, %constant_2462_32
  %23 = trunc i8 %21 to i1
  %24 = select i1 %23, i64 %22, i64 %16
  %25 = zext i32 %linear_index0 to i64
  %26 = add i64 %24, %25
  %constant_2462_33 = load i64, ptr @2, align 8
  %27 = icmp eq i64 %constant_2462_33, 0
  %28 = icmp eq i64 %26, -9223372036854775808
  %29 = icmp eq i64 %constant_2462_33, -1
  %30 = and i1 %28, %29
  %31 = or i1 %30, %27
  %32 = select i1 %31, i64 1, i64 %constant_2462_33
  %33 = srem i64 %26, %32
  %34 = select i1 %30, i64 0, i64 %33
  %35 = select i1 %27, i64 %26, i64 %34
  %constant_2459_34 = load i64, ptr @3, align 8
  %36 = icmp slt i64 %35, %constant_2459_34
  %37 = zext i1 %36 to i8
  %38 = icmp ne i64 %35, %constant_2459_34
  %39 = zext i1 %38 to i8
  %40 = and i8 %37, %39
  %41 = add i64 %35, %constant_2462_33
  %42 = trunc i8 %40 to i1
  %43 = select i1 %42, i64 %41, i64 %35
  %44 = getelementptr i64, ptr %arg2, i32 %linear_index
  %45 = getelementptr inbounds i64, ptr %44, i32 0
  store i64 %43, ptr %45, align 8
  br label %loop_select_fusion.29.in_bounds-after
}

define void @loop_multiply_fusion_1(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_multiply_fusion.1.in_bounds-true, label %loop_multiply_fusion.1.in_bounds-after

loop_multiply_fusion.1.in_bounds-after:           ; preds = %loop_multiply_fusion.1.in_bounds-true, %entry
  ret void

loop_multiply_fusion.1.in_bounds-true:            ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %constant_2460_3 = load double, ptr @4, align 8
  %multiply.11854.1 = fmul double %7, %constant_2460_3
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  store double %multiply.11854.1, ptr %9, align 8
  br label %loop_multiply_fusion.1.in_bounds-after
}

define void @loop_broadcast_fusion_53(ptr noalias align 128 dereferenceable(80) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !350
  %2 = mul nuw nsw i32 %0, 10
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 10
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 10
  br i1 %4, label %loop_broadcast_fusion.53.in_bounds-true, label %loop_broadcast_fusion.53.in_bounds-after

loop_broadcast_fusion.53.in_bounds-after:         ; preds = %loop_broadcast_fusion.53.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.53.in_bounds-true:          ; preds = %entry
  %constant_2461_2 = load double, ptr @5, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_2461_2, ptr %6, align 8
  br label %loop_broadcast_fusion.53.in_bounds-after
}

define void @loop_compare_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
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
  %4 = load i64, ptr %arg0, align 8, !invariant.load !349
  %constant_275_1 = load i64, ptr @6, align 8
  %5 = icmp slt i64 %4, %constant_275_1
  %6 = zext i1 %5 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.in_bounds-after
}

define void @loop_reduce_fusion(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1600) %arg1, ptr noalias align 128 dereferenceable(80) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(1600) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(1600) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(1600) %arg9, ptr noalias align 128 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(1600) %arg11, ptr noalias align 128 dereferenceable(8) %arg12, ptr noalias align 128 dereferenceable(8) %arg13, ptr noalias align 128 dereferenceable(8) %arg14, ptr noalias align 128 dereferenceable(8) %arg15, ptr noalias align 128 dereferenceable(8) %arg16) {
entry:
  %return_buffer55 = alloca double, align 8
  %parameter_buffer54 = alloca double, align 8
  %parameter_buffer53 = alloca double, align 8
  %reduce.108.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_043 = alloca double, align 8
  %return_buffer42 = alloca double, align 8
  %parameter_buffer41 = alloca double, align 8
  %parameter_buffer40 = alloca double, align 8
  %reduce.107.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_030 = alloca double, align 8
  %return_buffer29 = alloca double, align 8
  %parameter_buffer28 = alloca double, align 8
  %parameter_buffer27 = alloca double, align 8
  %reduce.106.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_017 = alloca double, align 8
  %return_buffer16 = alloca double, align 8
  %parameter_buffer15 = alloca double, align 8
  %parameter_buffer14 = alloca double, align 8
  %reduce.105.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_04 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer3 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.104.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.in_bounds-true, label %loop_reduce_fusion.in_bounds-after

loop_reduce_fusion.in_bounds-after:               ; preds = %reduce.108.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.in_bounds-true:                ; preds = %entry
  %constant_1586_3 = load double, ptr @7, align 8
  store double %constant_1586_3, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.104.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.104.1.inner.loop_header.reduction_dim.0

reduce.104.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.104.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.in_bounds-true
  %reduce.104.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.104.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.104.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.104.1.inner.loop_exit.reduction_dim.0, label %reduce.104.1.inner.loop_body.reduction_dim.0

reduce.104.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.104.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %constant_3324_7 = load i64, ptr @9, align 8
  %6 = load i64, ptr %arg3, align 8, !invariant.load !349
  %7 = sub i64 %constant_3324_7, %6
  %constant_226_11 = load i64, ptr @8, align 8
  %8 = icmp slt i64 %7, %constant_226_11
  %9 = zext i1 %8 to i8
  %constant_3456_7 = load i64, ptr @10, align 8
  %10 = load i64, ptr %arg3, align 8, !invariant.load !349
  %11 = sub i64 %constant_3456_7, %10
  %12 = trunc i8 %9 to i1
  %13 = select i1 %12, i64 %11, i64 %7
  %14 = trunc i64 %13 to i32
  %15 = icmp sge i32 0, %14
  %16 = select i1 %15, i32 0, i32 %14
  %17 = icmp sle i32 9, %16
  %dynamic-slice.5236.29.start_idx0 = select i1 %17, i32 9, i32 %16
  %18 = add i32 %dynamic-slice.5236.29.start_idx0, 0
  %19 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %18
  %20 = load i64, ptr %19, align 8, !invariant.load !349
  %constant_226_111 = load i64, ptr @8, align 8
  %21 = icmp slt i64 %20, %constant_226_111
  %22 = zext i1 %21 to i8
  %constant_228_5 = load i64, ptr @11, align 8
  %23 = add i64 %20, %constant_228_5
  %24 = trunc i8 %22 to i1
  %25 = select i1 %24, i64 %23, i64 %20
  %26 = trunc i64 %25 to i32
  %27 = icmp sge i32 0, %26
  %28 = select i1 %27, i32 0, i32 %26
  %29 = icmp sle i32 9, %28
  %dynamic-slice.5238.3.start_idx0 = select i1 %29, i32 9, i32 %28
  %constant_226_112 = load i64, ptr @8, align 8
  %30 = trunc i64 %constant_226_112 to i32
  %31 = icmp sge i32 0, %30
  %32 = select i1 %31, i32 0, i32 %30
  %33 = icmp sle i32 0, %32
  %dynamic-slice.5238.3.start_idx1 = select i1 %33, i32 0, i32 %32
  %34 = add i32 %dynamic-slice.5238.3.start_idx0, 0
  %35 = add i32 %dynamic-slice.5238.3.start_idx1, %reduce.104.1.inner.indvar.reduction_dim.0
  %36 = getelementptr inbounds [10 x [20 x double]], ptr %arg1, i32 0, i32 %34, i32 %35
  %37 = load double, ptr %36, align 8, !invariant.load !349
  %38 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.104.1.inner.indvar.reduction_dim.0
  %39 = load double, ptr %38, align 8, !invariant.load !349
  %multiply.11253.3 = fmul double %37, %39
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11253.3, ptr %parameter_buffer3, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer3, ptr %return_buffer)
  %40 = load double, ptr %return_buffer, align 8
  store double %40, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.104.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.104.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.104.1.inner.loop_header.reduction_dim.0

reduce.104.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.104.1.inner.loop_header.reduction_dim.0
  %41 = load double, ptr %accumulator_0, align 8
  %42 = insertvalue { double, double, double, double, double } undef, double %41, 0
  %constant_1586_35 = load double, ptr @7, align 8
  store double %constant_1586_35, ptr %accumulator_04, align 8
  store i32 0, ptr %reduce.105.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.105.1.clone.1.inner.loop_header.reduction_dim.0

reduce.105.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.105.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.104.1.inner.loop_exit.reduction_dim.0
  %reduce.105.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.105.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %43 = icmp uge i32 %reduce.105.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %43, label %reduce.105.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.105.1.clone.1.inner.loop_body.reduction_dim.0

reduce.105.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.105.1.clone.1.inner.loop_header.reduction_dim.0
  %44 = load double, ptr %accumulator_04, align 8
  %constant_3324_77 = load i64, ptr @9, align 8
  %45 = load i64, ptr %arg3, align 8, !invariant.load !349
  %46 = sub i64 %constant_3324_77, %45
  %constant_226_118 = load i64, ptr @8, align 8
  %47 = icmp slt i64 %46, %constant_226_118
  %48 = zext i1 %47 to i8
  %constant_3456_79 = load i64, ptr @10, align 8
  %49 = load i64, ptr %arg3, align 8, !invariant.load !349
  %50 = sub i64 %constant_3456_79, %49
  %51 = trunc i8 %48 to i1
  %52 = select i1 %51, i64 %50, i64 %46
  %53 = trunc i64 %52 to i32
  %54 = icmp sge i32 0, %53
  %55 = select i1 %54, i32 0, i32 %53
  %56 = icmp sle i32 9, %55
  %dynamic-slice.5236.29.start_idx010 = select i1 %56, i32 9, i32 %55
  %57 = add i32 %dynamic-slice.5236.29.start_idx010, 0
  %58 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %57
  %59 = load i64, ptr %58, align 8, !invariant.load !349
  %constant_226_1111 = load i64, ptr @8, align 8
  %60 = icmp slt i64 %59, %constant_226_1111
  %61 = zext i1 %60 to i8
  %constant_228_512 = load i64, ptr @11, align 8
  %62 = add i64 %59, %constant_228_512
  %63 = trunc i8 %61 to i1
  %64 = select i1 %63, i64 %62, i64 %59
  %65 = trunc i64 %64 to i32
  %66 = icmp sge i32 0, %65
  %67 = select i1 %66, i32 0, i32 %65
  %68 = icmp sle i32 9, %67
  %dynamic-slice.5239.3.clone.1.start_idx0 = select i1 %68, i32 9, i32 %67
  %constant_226_1113 = load i64, ptr @8, align 8
  %69 = trunc i64 %constant_226_1113 to i32
  %70 = icmp sge i32 0, %69
  %71 = select i1 %70, i32 0, i32 %69
  %72 = icmp sle i32 0, %71
  %dynamic-slice.5239.3.clone.1.start_idx1 = select i1 %72, i32 0, i32 %71
  %73 = add i32 %dynamic-slice.5239.3.clone.1.start_idx0, 0
  %74 = add i32 %dynamic-slice.5239.3.clone.1.start_idx1, %reduce.105.1.clone.1.inner.indvar.reduction_dim.0
  %75 = getelementptr inbounds [10 x [20 x double]], ptr %arg5, i32 0, i32 %73, i32 %74
  %76 = load double, ptr %75, align 8, !invariant.load !349
  %77 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %reduce.105.1.clone.1.inner.indvar.reduction_dim.0
  %78 = load double, ptr %77, align 8, !invariant.load !349
  %multiply.11254.3.clone.1 = fmul double %76, %78
  store double %44, ptr %parameter_buffer14, align 8
  store double %multiply.11254.3.clone.1, ptr %parameter_buffer15, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer14, ptr %parameter_buffer15, ptr %return_buffer16)
  %79 = load double, ptr %return_buffer16, align 8
  store double %79, ptr %accumulator_04, align 8
  %invar.inc6 = add nuw nsw i32 %reduce.105.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc6, ptr %reduce.105.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.105.1.clone.1.inner.loop_header.reduction_dim.0

reduce.105.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.105.1.clone.1.inner.loop_header.reduction_dim.0
  %80 = load double, ptr %accumulator_04, align 8
  %81 = insertvalue { double, double, double, double, double } %42, double %80, 1
  %constant_1586_318 = load double, ptr @7, align 8
  store double %constant_1586_318, ptr %accumulator_017, align 8
  store i32 0, ptr %reduce.106.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.106.1.clone.1.inner.loop_header.reduction_dim.0

reduce.106.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.106.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.105.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.106.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.106.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %82 = icmp uge i32 %reduce.106.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %82, label %reduce.106.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.106.1.clone.1.inner.loop_body.reduction_dim.0

reduce.106.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.106.1.clone.1.inner.loop_header.reduction_dim.0
  %83 = load double, ptr %accumulator_017, align 8
  %constant_3324_720 = load i64, ptr @9, align 8
  %84 = load i64, ptr %arg3, align 8, !invariant.load !349
  %85 = sub i64 %constant_3324_720, %84
  %constant_226_1121 = load i64, ptr @8, align 8
  %86 = icmp slt i64 %85, %constant_226_1121
  %87 = zext i1 %86 to i8
  %constant_3456_722 = load i64, ptr @10, align 8
  %88 = load i64, ptr %arg3, align 8, !invariant.load !349
  %89 = sub i64 %constant_3456_722, %88
  %90 = trunc i8 %87 to i1
  %91 = select i1 %90, i64 %89, i64 %85
  %92 = trunc i64 %91 to i32
  %93 = icmp sge i32 0, %92
  %94 = select i1 %93, i32 0, i32 %92
  %95 = icmp sle i32 9, %94
  %dynamic-slice.5236.29.start_idx023 = select i1 %95, i32 9, i32 %94
  %96 = add i32 %dynamic-slice.5236.29.start_idx023, 0
  %97 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %96
  %98 = load i64, ptr %97, align 8, !invariant.load !349
  %constant_226_1124 = load i64, ptr @8, align 8
  %99 = icmp slt i64 %98, %constant_226_1124
  %100 = zext i1 %99 to i8
  %constant_228_525 = load i64, ptr @11, align 8
  %101 = add i64 %98, %constant_228_525
  %102 = trunc i8 %100 to i1
  %103 = select i1 %102, i64 %101, i64 %98
  %104 = trunc i64 %103 to i32
  %105 = icmp sge i32 0, %104
  %106 = select i1 %105, i32 0, i32 %104
  %107 = icmp sle i32 9, %106
  %dynamic-slice.5240.3.clone.1.start_idx0 = select i1 %107, i32 9, i32 %106
  %constant_226_1126 = load i64, ptr @8, align 8
  %108 = trunc i64 %constant_226_1126 to i32
  %109 = icmp sge i32 0, %108
  %110 = select i1 %109, i32 0, i32 %108
  %111 = icmp sle i32 0, %110
  %dynamic-slice.5240.3.clone.1.start_idx1 = select i1 %111, i32 0, i32 %110
  %112 = add i32 %dynamic-slice.5240.3.clone.1.start_idx0, 0
  %113 = add i32 %dynamic-slice.5240.3.clone.1.start_idx1, %reduce.106.1.clone.1.inner.indvar.reduction_dim.0
  %114 = getelementptr inbounds [10 x [20 x double]], ptr %arg7, i32 0, i32 %112, i32 %113
  %115 = load double, ptr %114, align 8, !invariant.load !349
  %116 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %reduce.106.1.clone.1.inner.indvar.reduction_dim.0
  %117 = load double, ptr %116, align 8, !invariant.load !349
  %multiply.11255.3.clone.1 = fmul double %115, %117
  store double %83, ptr %parameter_buffer27, align 8
  store double %multiply.11255.3.clone.1, ptr %parameter_buffer28, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer27, ptr %parameter_buffer28, ptr %return_buffer29)
  %118 = load double, ptr %return_buffer29, align 8
  store double %118, ptr %accumulator_017, align 8
  %invar.inc19 = add nuw nsw i32 %reduce.106.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc19, ptr %reduce.106.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.106.1.clone.1.inner.loop_header.reduction_dim.0

reduce.106.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.106.1.clone.1.inner.loop_header.reduction_dim.0
  %119 = load double, ptr %accumulator_017, align 8
  %120 = insertvalue { double, double, double, double, double } %81, double %119, 2
  %constant_1586_331 = load double, ptr @7, align 8
  store double %constant_1586_331, ptr %accumulator_030, align 8
  store i32 0, ptr %reduce.107.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.107.1.clone.1.inner.loop_header.reduction_dim.0

reduce.107.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.107.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.106.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.107.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.107.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %121 = icmp uge i32 %reduce.107.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %121, label %reduce.107.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.107.1.clone.1.inner.loop_body.reduction_dim.0

reduce.107.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.107.1.clone.1.inner.loop_header.reduction_dim.0
  %122 = load double, ptr %accumulator_030, align 8
  %constant_3324_733 = load i64, ptr @9, align 8
  %123 = load i64, ptr %arg3, align 8, !invariant.load !349
  %124 = sub i64 %constant_3324_733, %123
  %constant_226_1134 = load i64, ptr @8, align 8
  %125 = icmp slt i64 %124, %constant_226_1134
  %126 = zext i1 %125 to i8
  %constant_3456_735 = load i64, ptr @10, align 8
  %127 = load i64, ptr %arg3, align 8, !invariant.load !349
  %128 = sub i64 %constant_3456_735, %127
  %129 = trunc i8 %126 to i1
  %130 = select i1 %129, i64 %128, i64 %124
  %131 = trunc i64 %130 to i32
  %132 = icmp sge i32 0, %131
  %133 = select i1 %132, i32 0, i32 %131
  %134 = icmp sle i32 9, %133
  %dynamic-slice.5236.29.start_idx036 = select i1 %134, i32 9, i32 %133
  %135 = add i32 %dynamic-slice.5236.29.start_idx036, 0
  %136 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %135
  %137 = load i64, ptr %136, align 8, !invariant.load !349
  %constant_226_1137 = load i64, ptr @8, align 8
  %138 = icmp slt i64 %137, %constant_226_1137
  %139 = zext i1 %138 to i8
  %constant_228_538 = load i64, ptr @11, align 8
  %140 = add i64 %137, %constant_228_538
  %141 = trunc i8 %139 to i1
  %142 = select i1 %141, i64 %140, i64 %137
  %143 = trunc i64 %142 to i32
  %144 = icmp sge i32 0, %143
  %145 = select i1 %144, i32 0, i32 %143
  %146 = icmp sle i32 9, %145
  %dynamic-slice.5241.3.clone.1.start_idx0 = select i1 %146, i32 9, i32 %145
  %constant_226_1139 = load i64, ptr @8, align 8
  %147 = trunc i64 %constant_226_1139 to i32
  %148 = icmp sge i32 0, %147
  %149 = select i1 %148, i32 0, i32 %147
  %150 = icmp sle i32 0, %149
  %dynamic-slice.5241.3.clone.1.start_idx1 = select i1 %150, i32 0, i32 %149
  %151 = add i32 %dynamic-slice.5241.3.clone.1.start_idx0, 0
  %152 = add i32 %dynamic-slice.5241.3.clone.1.start_idx1, %reduce.107.1.clone.1.inner.indvar.reduction_dim.0
  %153 = getelementptr inbounds [10 x [20 x double]], ptr %arg9, i32 0, i32 %151, i32 %152
  %154 = load double, ptr %153, align 8, !invariant.load !349
  %155 = getelementptr inbounds [20 x double], ptr %arg8, i32 0, i32 %reduce.107.1.clone.1.inner.indvar.reduction_dim.0
  %156 = load double, ptr %155, align 8, !invariant.load !349
  %multiply.11256.3.clone.1 = fmul double %154, %156
  store double %122, ptr %parameter_buffer40, align 8
  store double %multiply.11256.3.clone.1, ptr %parameter_buffer41, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer40, ptr %parameter_buffer41, ptr %return_buffer42)
  %157 = load double, ptr %return_buffer42, align 8
  store double %157, ptr %accumulator_030, align 8
  %invar.inc32 = add nuw nsw i32 %reduce.107.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc32, ptr %reduce.107.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.107.1.clone.1.inner.loop_header.reduction_dim.0

reduce.107.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.107.1.clone.1.inner.loop_header.reduction_dim.0
  %158 = load double, ptr %accumulator_030, align 8
  %159 = insertvalue { double, double, double, double, double } %120, double %158, 3
  %constant_1586_344 = load double, ptr @7, align 8
  store double %constant_1586_344, ptr %accumulator_043, align 8
  store i32 0, ptr %reduce.108.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.108.1.clone.1.inner.loop_header.reduction_dim.0

reduce.108.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.108.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.107.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.108.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.108.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %160 = icmp uge i32 %reduce.108.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %160, label %reduce.108.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.108.1.clone.1.inner.loop_body.reduction_dim.0

reduce.108.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.108.1.clone.1.inner.loop_header.reduction_dim.0
  %161 = load double, ptr %accumulator_043, align 8
  %constant_3324_746 = load i64, ptr @9, align 8
  %162 = load i64, ptr %arg3, align 8, !invariant.load !349
  %163 = sub i64 %constant_3324_746, %162
  %constant_226_1147 = load i64, ptr @8, align 8
  %164 = icmp slt i64 %163, %constant_226_1147
  %165 = zext i1 %164 to i8
  %constant_3456_748 = load i64, ptr @10, align 8
  %166 = load i64, ptr %arg3, align 8, !invariant.load !349
  %167 = sub i64 %constant_3456_748, %166
  %168 = trunc i8 %165 to i1
  %169 = select i1 %168, i64 %167, i64 %163
  %170 = trunc i64 %169 to i32
  %171 = icmp sge i32 0, %170
  %172 = select i1 %171, i32 0, i32 %170
  %173 = icmp sle i32 9, %172
  %dynamic-slice.5236.29.start_idx049 = select i1 %173, i32 9, i32 %172
  %174 = add i32 %dynamic-slice.5236.29.start_idx049, 0
  %175 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %174
  %176 = load i64, ptr %175, align 8, !invariant.load !349
  %constant_226_1150 = load i64, ptr @8, align 8
  %177 = icmp slt i64 %176, %constant_226_1150
  %178 = zext i1 %177 to i8
  %constant_228_551 = load i64, ptr @11, align 8
  %179 = add i64 %176, %constant_228_551
  %180 = trunc i8 %178 to i1
  %181 = select i1 %180, i64 %179, i64 %176
  %182 = trunc i64 %181 to i32
  %183 = icmp sge i32 0, %182
  %184 = select i1 %183, i32 0, i32 %182
  %185 = icmp sle i32 9, %184
  %dynamic-slice.5242.3.clone.1.start_idx0 = select i1 %185, i32 9, i32 %184
  %constant_226_1152 = load i64, ptr @8, align 8
  %186 = trunc i64 %constant_226_1152 to i32
  %187 = icmp sge i32 0, %186
  %188 = select i1 %187, i32 0, i32 %186
  %189 = icmp sle i32 0, %188
  %dynamic-slice.5242.3.clone.1.start_idx1 = select i1 %189, i32 0, i32 %188
  %190 = add i32 %dynamic-slice.5242.3.clone.1.start_idx0, 0
  %191 = add i32 %dynamic-slice.5242.3.clone.1.start_idx1, %reduce.108.1.clone.1.inner.indvar.reduction_dim.0
  %192 = getelementptr inbounds [10 x [20 x double]], ptr %arg11, i32 0, i32 %190, i32 %191
  %193 = load double, ptr %192, align 8, !invariant.load !349
  %194 = getelementptr inbounds [20 x double], ptr %arg10, i32 0, i32 %reduce.108.1.clone.1.inner.indvar.reduction_dim.0
  %195 = load double, ptr %194, align 8, !invariant.load !349
  %multiply.11257.3.clone.1 = fmul double %193, %195
  store double %161, ptr %parameter_buffer53, align 8
  store double %multiply.11257.3.clone.1, ptr %parameter_buffer54, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer53, ptr %parameter_buffer54, ptr %return_buffer55)
  %196 = load double, ptr %return_buffer55, align 8
  store double %196, ptr %accumulator_043, align 8
  %invar.inc45 = add nuw nsw i32 %reduce.108.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc45, ptr %reduce.108.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.108.1.clone.1.inner.loop_header.reduction_dim.0

reduce.108.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.108.1.clone.1.inner.loop_header.reduction_dim.0
  %197 = load double, ptr %accumulator_043, align 8
  %198 = insertvalue { double, double, double, double, double } %159, double %197, 4
  %199 = extractvalue { double, double, double, double, double } %198, 0
  store double %199, ptr %arg12, align 8
  %200 = extractvalue { double, double, double, double, double } %198, 1
  store double %200, ptr %arg13, align 8
  %201 = extractvalue { double, double, double, double, double } %198, 2
  store double %201, ptr %arg14, align 8
  %202 = extractvalue { double, double, double, double, double } %198, 3
  store double %202, ptr %arg15, align 8
  %203 = extractvalue { double, double, double, double, double } %198, 4
  store double %203, ptr %arg16, align 8
  br label %loop_reduce_fusion.in_bounds-after
}

define internal void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %scalar_lhs = load double, ptr %0, align 8
  %scalar_rhs = load double, ptr %1, align 8
  %add.9442 = fadd double %scalar_lhs, %scalar_rhs
  store double %add.9442, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

define void @loop_multiply_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(80) %arg5, ptr noalias align 128 dereferenceable(80) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(1600) %arg8, ptr noalias align 128 dereferenceable(8) %arg9, ptr noalias align 128 dereferenceable(8) %arg10) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer9 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.109.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %reduce.109.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %constant_3324_6 = load i64, ptr @14, align 8
  %4 = load i64, ptr %arg9, align 8, !invariant.load !349
  %5 = sub i64 %constant_3324_6, %4
  %constant_226_3 = load i64, ptr @13, align 8
  %6 = icmp slt i64 %5, %constant_226_3
  %7 = zext i1 %6 to i8
  %constant_3456_6 = load i64, ptr @15, align 8
  %8 = load i64, ptr %arg9, align 8, !invariant.load !349
  %9 = sub i64 %constant_3456_6, %8
  %10 = trunc i8 %7 to i1
  %11 = select i1 %10, i64 %9, i64 %5
  %12 = trunc i64 %11 to i32
  %13 = icmp sge i32 0, %12
  %14 = select i1 %13, i32 0, i32 %12
  %15 = icmp sle i32 9, %14
  %dynamic-slice.5236.7.start_idx0 = select i1 %15, i32 9, i32 %14
  %16 = add i32 %dynamic-slice.5236.7.start_idx0, 0
  %17 = getelementptr inbounds [10 x i64], ptr %arg6, i32 0, i32 %16
  %18 = load i64, ptr %17, align 8, !invariant.load !349
  %constant_226_31 = load i64, ptr @13, align 8
  %19 = icmp slt i64 %18, %constant_226_31
  %20 = zext i1 %19 to i8
  %constant_228_4 = load i64, ptr @16, align 8
  %21 = add i64 %18, %constant_228_4
  %22 = trunc i8 %20 to i1
  %23 = select i1 %22, i64 %21, i64 %18
  %24 = trunc i64 %23 to i32
  %25 = icmp sge i32 0, %24
  %26 = select i1 %25, i32 0, i32 %24
  %27 = icmp sle i32 9, %26
  %dynamic-slice.5237.1.start_idx0 = select i1 %27, i32 9, i32 %26
  %28 = add i32 %dynamic-slice.5237.1.start_idx0, 0
  %29 = getelementptr inbounds [10 x double], ptr %arg5, i32 0, i32 %28
  %30 = load double, ptr %29, align 8, !invariant.load !349
  %31 = load double, ptr %arg3, align 8, !invariant.load !349
  %32 = load double, ptr %arg4, align 8, !invariant.load !349
  %add.9445.1 = fadd double %31, %32
  %33 = load double, ptr %arg2, align 8, !invariant.load !349
  %add.9446.1 = fadd double %add.9445.1, %33
  %34 = load double, ptr %arg1, align 8, !invariant.load !349
  %add.9447.1 = fadd double %add.9446.1, %34
  %35 = load double, ptr %arg0, align 8, !invariant.load !349
  %add.9448.1 = fadd double %add.9447.1, %35
  %constant_1586_2 = load double, ptr @12, align 8
  store double %constant_1586_2, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.109.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.109.1.inner.loop_header.reduction_dim.0

reduce.109.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.109.1.inner.loop_body.reduction_dim.0, %loop_multiply_fusion.in_bounds-true
  %reduce.109.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.109.1.inner.invar_address.reduction_dim.0, align 4
  %36 = icmp uge i32 %reduce.109.1.inner.indvar.reduction_dim.0, 20
  br i1 %36, label %reduce.109.1.inner.loop_exit.reduction_dim.0, label %reduce.109.1.inner.loop_body.reduction_dim.0

reduce.109.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.109.1.inner.loop_header.reduction_dim.0
  %37 = load double, ptr %accumulator_0, align 8
  %constant_3324_62 = load i64, ptr @14, align 8
  %38 = load i64, ptr %arg9, align 8, !invariant.load !349
  %39 = sub i64 %constant_3324_62, %38
  %constant_226_33 = load i64, ptr @13, align 8
  %40 = icmp slt i64 %39, %constant_226_33
  %41 = zext i1 %40 to i8
  %constant_3456_64 = load i64, ptr @15, align 8
  %42 = load i64, ptr %arg9, align 8, !invariant.load !349
  %43 = sub i64 %constant_3456_64, %42
  %44 = trunc i8 %41 to i1
  %45 = select i1 %44, i64 %43, i64 %39
  %46 = trunc i64 %45 to i32
  %47 = icmp sge i32 0, %46
  %48 = select i1 %47, i32 0, i32 %46
  %49 = icmp sle i32 9, %48
  %dynamic-slice.5236.7.start_idx05 = select i1 %49, i32 9, i32 %48
  %50 = add i32 %dynamic-slice.5236.7.start_idx05, 0
  %51 = getelementptr inbounds [10 x i64], ptr %arg6, i32 0, i32 %50
  %52 = load i64, ptr %51, align 8, !invariant.load !349
  %constant_226_36 = load i64, ptr @13, align 8
  %53 = icmp slt i64 %52, %constant_226_36
  %54 = zext i1 %53 to i8
  %constant_228_47 = load i64, ptr @16, align 8
  %55 = add i64 %52, %constant_228_47
  %56 = trunc i8 %54 to i1
  %57 = select i1 %56, i64 %55, i64 %52
  %58 = trunc i64 %57 to i32
  %59 = icmp sge i32 0, %58
  %60 = select i1 %59, i32 0, i32 %58
  %61 = icmp sle i32 9, %60
  %dynamic-slice.5243.3.start_idx0 = select i1 %61, i32 9, i32 %60
  %constant_226_38 = load i64, ptr @13, align 8
  %62 = trunc i64 %constant_226_38 to i32
  %63 = icmp sge i32 0, %62
  %64 = select i1 %63, i32 0, i32 %62
  %65 = icmp sle i32 0, %64
  %dynamic-slice.5243.3.start_idx1 = select i1 %65, i32 0, i32 %64
  %66 = add i32 %dynamic-slice.5243.3.start_idx0, 0
  %67 = add i32 %dynamic-slice.5243.3.start_idx1, %reduce.109.1.inner.indvar.reduction_dim.0
  %68 = getelementptr inbounds [10 x [20 x double]], ptr %arg8, i32 0, i32 %66, i32 %67
  %69 = load double, ptr %68, align 8, !invariant.load !349
  %70 = getelementptr inbounds [20 x double], ptr %arg7, i32 0, i32 %reduce.109.1.inner.indvar.reduction_dim.0
  %71 = load double, ptr %70, align 8, !invariant.load !349
  %multiply.11258.3 = fmul double %69, %71
  store double %37, ptr %parameter_buffer, align 8
  store double %multiply.11258.3, ptr %parameter_buffer9, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer9, ptr %return_buffer)
  %72 = load double, ptr %return_buffer, align 8
  store double %72, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.109.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.109.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.109.1.inner.loop_header.reduction_dim.0

reduce.109.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.109.1.inner.loop_header.reduction_dim.0
  %73 = load double, ptr %accumulator_0, align 8
  %add.9449.1 = fadd double %add.9448.1, %73
  %multiply.11259.1 = fmul double %30, %add.9449.1
  store double %multiply.11259.1, ptr %arg10, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion(ptr noalias align 128 dereferenceable(80) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %constant_3324_3 = load i64, ptr @17, align 8
  %param_2.115 = load i64, ptr %arg2, align 8, !invariant.load !349
  %0 = sub i64 %constant_3324_3, %param_2.115
  %constant_226_2 = load i64, ptr @19, align 8
  %1 = icmp slt i64 %0, %constant_226_2
  %2 = zext i1 %1 to i8
  %constant_3456_3 = load i64, ptr @18, align 8
  %param_2.1151 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = sub i64 %constant_3456_3, %param_2.1151
  %4 = trunc i8 %2 to i1
  %5 = select i1 %4, i64 %3, i64 %0
  %6 = icmp sge i64 0, %5
  %7 = select i1 %6, i64 0, i64 %5
  %8 = icmp sle i64 9, %7
  %9 = select i1 %8, i64 9, i64 %7
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %10 to i64
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %thread_id_x = zext i32 %11 to i64
  %12 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %12, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %13 = udiv i64 %linear_index0, 1
  %14 = icmp ult i64 %linear_index, 1
  br i1 %14, label %dynamic-update-slice.5521.1.in_bounds-true, label %dynamic-update-slice.5521.1.in_bounds-after

dynamic-update-slice.5521.1.in_bounds-after:      ; preds = %dynamic-update-slice.5521.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5521.1.in_bounds-true:       ; preds = %entry
  %15 = add i64 %9, %13
  %param_1.100 = load double, ptr %arg1, align 8, !invariant.load !349
  %16 = getelementptr inbounds [10 x double], ptr %arg0, i64 0, i64 %15
  store double %param_1.100, ptr %16, align 8
  br label %dynamic-update-slice.5521.1.in_bounds-after
}

define void @loop_add_fusion(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1600) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(80) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(1600) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(1600) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(1600) %arg10, ptr noalias align 128 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(1600) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 128 dereferenceable(1600) %arg14) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8
  %8 = load double, ptr %arg2, align 8, !invariant.load !349
  %9 = fneg double %8
  %constant_3324_2 = load i64, ptr @21, align 8
  %10 = load i64, ptr %arg4, align 8, !invariant.load !349
  %11 = sub i64 %constant_3324_2, %10
  %constant_226_4 = load i64, ptr @20, align 8
  %12 = icmp slt i64 %11, %constant_226_4
  %13 = zext i1 %12 to i8
  %constant_3456_2 = load i64, ptr @22, align 8
  %14 = load i64, ptr %arg4, align 8, !invariant.load !349
  %15 = sub i64 %constant_3456_2, %14
  %16 = trunc i8 %13 to i1
  %17 = select i1 %16, i64 %15, i64 %11
  %18 = trunc i64 %17 to i32
  %19 = icmp sge i32 0, %18
  %20 = select i1 %19, i32 0, i32 %18
  %21 = icmp sle i32 9, %20
  %dynamic-slice.5236.27.start_idx0 = select i1 %21, i32 9, i32 %20
  %22 = add i32 %dynamic-slice.5236.27.start_idx0, 0
  %23 = getelementptr inbounds [10 x i64], ptr %arg3, i32 0, i32 %22
  %24 = load i64, ptr %23, align 8, !invariant.load !349
  %constant_226_41 = load i64, ptr @20, align 8
  %25 = icmp slt i64 %24, %constant_226_41
  %26 = zext i1 %25 to i8
  %constant_228_1 = load i64, ptr @23, align 8
  %27 = add i64 %24, %constant_228_1
  %28 = trunc i8 %26 to i1
  %29 = select i1 %28, i64 %27, i64 %24
  %30 = trunc i64 %29 to i32
  %31 = icmp sge i32 0, %30
  %32 = select i1 %31, i32 0, i32 %30
  %33 = icmp sle i32 9, %32
  %dynamic-slice.5247.1.start_idx0 = select i1 %33, i32 9, i32 %32
  %constant_226_42 = load i64, ptr @20, align 8
  %34 = trunc i64 %constant_226_42 to i32
  %35 = icmp sge i32 0, %34
  %36 = select i1 %35, i32 0, i32 %34
  %37 = icmp sle i32 0, %36
  %dynamic-slice.5247.1.start_idx1 = select i1 %37, i32 0, i32 %36
  %38 = add i32 %dynamic-slice.5247.1.start_idx0, 0
  %39 = add i32 %dynamic-slice.5247.1.start_idx1, %3
  %40 = getelementptr inbounds [10 x [20 x double]], ptr %arg1, i32 0, i32 %38, i32 %39
  %41 = load double, ptr %40, align 8, !invariant.load !349
  %multiply.11263.1 = fmul double %9, %41
  %add.9453.1 = fadd double %7, %multiply.11263.1
  %42 = insertvalue { double, double, double, double, double, double } undef, double %add.9453.1, 0
  %43 = getelementptr double, ptr %arg5, i32 %linear_index
  %44 = getelementptr inbounds double, ptr %43, i32 0
  %45 = load double, ptr %44, align 8
  %46 = trunc i64 %29 to i32
  %47 = icmp sge i32 0, %46
  %48 = select i1 %47, i32 0, i32 %46
  %49 = icmp sle i32 9, %48
  %dynamic-slice.5248.1.clone.1.start_idx0 = select i1 %49, i32 9, i32 %48
  %constant_226_43 = load i64, ptr @20, align 8
  %50 = trunc i64 %constant_226_43 to i32
  %51 = icmp sge i32 0, %50
  %52 = select i1 %51, i32 0, i32 %50
  %53 = icmp sle i32 0, %52
  %dynamic-slice.5248.1.clone.1.start_idx1 = select i1 %53, i32 0, i32 %52
  %54 = add i32 %dynamic-slice.5248.1.clone.1.start_idx0, 0
  %55 = add i32 %dynamic-slice.5248.1.clone.1.start_idx1, %3
  %56 = getelementptr inbounds [10 x [20 x double]], ptr %arg6, i32 0, i32 %54, i32 %55
  %57 = load double, ptr %56, align 8, !invariant.load !349
  %multiply.11264.1.clone.1 = fmul double %9, %57
  %add.9454.1.clone.1 = fadd double %45, %multiply.11264.1.clone.1
  %58 = insertvalue { double, double, double, double, double, double } %42, double %add.9454.1.clone.1, 1
  %59 = getelementptr double, ptr %arg7, i32 %linear_index
  %60 = getelementptr inbounds double, ptr %59, i32 0
  %61 = load double, ptr %60, align 8
  %62 = trunc i64 %29 to i32
  %63 = icmp sge i32 0, %62
  %64 = select i1 %63, i32 0, i32 %62
  %65 = icmp sle i32 9, %64
  %dynamic-slice.5249.1.clone.1.start_idx0 = select i1 %65, i32 9, i32 %64
  %constant_226_44 = load i64, ptr @20, align 8
  %66 = trunc i64 %constant_226_44 to i32
  %67 = icmp sge i32 0, %66
  %68 = select i1 %67, i32 0, i32 %66
  %69 = icmp sle i32 0, %68
  %dynamic-slice.5249.1.clone.1.start_idx1 = select i1 %69, i32 0, i32 %68
  %70 = add i32 %dynamic-slice.5249.1.clone.1.start_idx0, 0
  %71 = add i32 %dynamic-slice.5249.1.clone.1.start_idx1, %3
  %72 = getelementptr inbounds [10 x [20 x double]], ptr %arg8, i32 0, i32 %70, i32 %71
  %73 = load double, ptr %72, align 8, !invariant.load !349
  %multiply.11265.1.clone.1 = fmul double %9, %73
  %add.9455.1.clone.1 = fadd double %61, %multiply.11265.1.clone.1
  %74 = insertvalue { double, double, double, double, double, double } %58, double %add.9455.1.clone.1, 2
  %75 = getelementptr double, ptr %arg9, i32 %linear_index
  %76 = getelementptr inbounds double, ptr %75, i32 0
  %77 = load double, ptr %76, align 8
  %78 = trunc i64 %29 to i32
  %79 = icmp sge i32 0, %78
  %80 = select i1 %79, i32 0, i32 %78
  %81 = icmp sle i32 9, %80
  %dynamic-slice.5246.1.clone.1.start_idx0 = select i1 %81, i32 9, i32 %80
  %constant_226_45 = load i64, ptr @20, align 8
  %82 = trunc i64 %constant_226_45 to i32
  %83 = icmp sge i32 0, %82
  %84 = select i1 %83, i32 0, i32 %82
  %85 = icmp sle i32 0, %84
  %dynamic-slice.5246.1.clone.1.start_idx1 = select i1 %85, i32 0, i32 %84
  %86 = add i32 %dynamic-slice.5246.1.clone.1.start_idx0, 0
  %87 = add i32 %dynamic-slice.5246.1.clone.1.start_idx1, %3
  %88 = getelementptr inbounds [10 x [20 x double]], ptr %arg10, i32 0, i32 %86, i32 %87
  %89 = load double, ptr %88, align 8, !invariant.load !349
  %multiply.11262.1.clone.1 = fmul double %9, %89
  %add.9452.1.clone.1 = fadd double %77, %multiply.11262.1.clone.1
  %90 = insertvalue { double, double, double, double, double, double } %74, double %add.9452.1.clone.1, 3
  %91 = getelementptr double, ptr %arg11, i32 %linear_index
  %92 = getelementptr inbounds double, ptr %91, i32 0
  %93 = load double, ptr %92, align 8
  %94 = trunc i64 %29 to i32
  %95 = icmp sge i32 0, %94
  %96 = select i1 %95, i32 0, i32 %94
  %97 = icmp sle i32 9, %96
  %dynamic-slice.5244.1.clone.1.start_idx0 = select i1 %97, i32 9, i32 %96
  %constant_226_46 = load i64, ptr @20, align 8
  %98 = trunc i64 %constant_226_46 to i32
  %99 = icmp sge i32 0, %98
  %100 = select i1 %99, i32 0, i32 %98
  %101 = icmp sle i32 0, %100
  %dynamic-slice.5244.1.clone.1.start_idx1 = select i1 %101, i32 0, i32 %100
  %102 = add i32 %dynamic-slice.5244.1.clone.1.start_idx0, 0
  %103 = add i32 %dynamic-slice.5244.1.clone.1.start_idx1, %3
  %104 = getelementptr inbounds [10 x [20 x double]], ptr %arg12, i32 0, i32 %102, i32 %103
  %105 = load double, ptr %104, align 8, !invariant.load !349
  %multiply.11260.1.clone.1 = fmul double %9, %105
  %add.9450.1.clone.1 = fadd double %93, %multiply.11260.1.clone.1
  %106 = insertvalue { double, double, double, double, double, double } %90, double %add.9450.1.clone.1, 4
  %107 = getelementptr double, ptr %arg13, i32 %linear_index
  %108 = getelementptr inbounds double, ptr %107, i32 0
  %109 = load double, ptr %108, align 8
  %110 = trunc i64 %29 to i32
  %111 = icmp sge i32 0, %110
  %112 = select i1 %111, i32 0, i32 %110
  %113 = icmp sle i32 9, %112
  %dynamic-slice.5245.1.clone.1.start_idx0 = select i1 %113, i32 9, i32 %112
  %constant_226_47 = load i64, ptr @20, align 8
  %114 = trunc i64 %constant_226_47 to i32
  %115 = icmp sge i32 0, %114
  %116 = select i1 %115, i32 0, i32 %114
  %117 = icmp sle i32 0, %116
  %dynamic-slice.5245.1.clone.1.start_idx1 = select i1 %117, i32 0, i32 %116
  %118 = add i32 %dynamic-slice.5245.1.clone.1.start_idx0, 0
  %119 = add i32 %dynamic-slice.5245.1.clone.1.start_idx1, %3
  %120 = getelementptr inbounds [10 x [20 x double]], ptr %arg14, i32 0, i32 %118, i32 %119
  %121 = load double, ptr %120, align 8, !invariant.load !349
  %multiply.11261.1.clone.1 = fmul double %9, %121
  %add.9451.1.clone.1 = fadd double %109, %multiply.11261.1.clone.1
  %122 = insertvalue { double, double, double, double, double, double } %106, double %add.9451.1.clone.1, 5
  %123 = extractvalue { double, double, double, double, double, double } %122, 0
  %124 = getelementptr double, ptr %arg0, i32 %linear_index
  %125 = getelementptr inbounds double, ptr %124, i32 0
  store double %123, ptr %125, align 8
  %126 = extractvalue { double, double, double, double, double, double } %122, 1
  %127 = getelementptr double, ptr %arg5, i32 %linear_index
  %128 = getelementptr inbounds double, ptr %127, i32 0
  store double %126, ptr %128, align 8
  %129 = extractvalue { double, double, double, double, double, double } %122, 2
  %130 = getelementptr double, ptr %arg7, i32 %linear_index
  %131 = getelementptr inbounds double, ptr %130, i32 0
  store double %129, ptr %131, align 8
  %132 = extractvalue { double, double, double, double, double, double } %122, 3
  %133 = getelementptr double, ptr %arg9, i32 %linear_index
  %134 = getelementptr inbounds double, ptr %133, i32 0
  store double %132, ptr %134, align 8
  %135 = extractvalue { double, double, double, double, double, double } %122, 4
  %136 = getelementptr double, ptr %arg11, i32 %linear_index
  %137 = getelementptr inbounds double, ptr %136, i32 0
  store double %135, ptr %137, align 8
  %138 = extractvalue { double, double, double, double, double, double } %122, 5
  %139 = getelementptr double, ptr %arg13, i32 %linear_index
  %140 = getelementptr inbounds double, ptr %139, i32 0
  store double %138, ptr %140, align 8
  br label %loop_add_fusion.in_bounds-after
}

define void @loop_add_fusion_1(ptr noalias align 128 dereferenceable(8) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
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
  %constant_227_1 = load i64, ptr @24, align 8
  %5 = add i64 %4, %constant_227_1
  store i64 %5, ptr %arg0, align 8
  br label %loop_add_fusion.1.in_bounds-after
}

define void @loop_multiply_fusion_10(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_multiply_fusion.10.in_bounds-true, label %loop_multiply_fusion.10.in_bounds-after

loop_multiply_fusion.10.in_bounds-after:          ; preds = %loop_multiply_fusion.10.in_bounds-true, %entry
  ret void

loop_multiply_fusion.10.in_bounds-true:           ; preds = %entry
  %5 = load double, ptr %arg1, align 8, !invariant.load !349
  %6 = getelementptr double, ptr %arg0, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %multiply.11863.1 = fmul double %5, %8
  %9 = getelementptr double, ptr %arg2, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  store double %multiply.11863.1, ptr %10, align 8
  br label %loop_multiply_fusion.10.in_bounds-after
}

define void @loop_reduce_fusion_1(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1600) %arg1, ptr noalias align 128 dereferenceable(80) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(1600) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(1600) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(1600) %arg9, ptr noalias align 128 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(1600) %arg11, ptr noalias align 128 dereferenceable(8) %arg12, ptr noalias align 128 dereferenceable(8) %arg13, ptr noalias align 128 dereferenceable(8) %arg14, ptr noalias align 128 dereferenceable(8) %arg15, ptr noalias align 128 dereferenceable(8) %arg16) {
entry:
  %return_buffer52 = alloca double, align 8
  %parameter_buffer51 = alloca double, align 8
  %parameter_buffer50 = alloca double, align 8
  %reduce.175.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_041 = alloca double, align 8
  %return_buffer40 = alloca double, align 8
  %parameter_buffer39 = alloca double, align 8
  %parameter_buffer38 = alloca double, align 8
  %reduce.174.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_029 = alloca double, align 8
  %return_buffer28 = alloca double, align 8
  %parameter_buffer27 = alloca double, align 8
  %parameter_buffer26 = alloca double, align 8
  %reduce.173.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_017 = alloca double, align 8
  %return_buffer16 = alloca double, align 8
  %parameter_buffer15 = alloca double, align 8
  %parameter_buffer14 = alloca double, align 8
  %reduce.172.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_05 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer4 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.171.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.1.in_bounds-true, label %loop_reduce_fusion.1.in_bounds-after

loop_reduce_fusion.1.in_bounds-after:             ; preds = %reduce.175.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.1.in_bounds-true:              ; preds = %entry
  %constant_1935_3 = load double, ptr @25, align 8
  store double %constant_1935_3, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.171.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.171.1.inner.loop_header.reduction_dim.0

reduce.171.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.171.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.1.in_bounds-true
  %reduce.171.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.171.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.171.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.171.1.inner.loop_exit.reduction_dim.0, label %reduce.171.1.inner.loop_body.reduction_dim.0

reduce.171.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.171.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1932_11 = load i64, ptr @26, align 8
  %7 = icmp slt i64 %6, %constant_1932_11
  %8 = zext i1 %7 to i8
  %9 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1931_5 = load i64, ptr @27, align 8
  %10 = add i64 %9, %constant_1931_5
  %11 = load i64, ptr %arg3, align 8, !invariant.load !349
  %12 = trunc i8 %8 to i1
  %13 = select i1 %12, i64 %10, i64 %11
  %14 = trunc i64 %13 to i32
  %15 = icmp sge i32 0, %14
  %16 = select i1 %15, i32 0, i32 %14
  %17 = icmp sle i32 9, %16
  %dynamic-slice.5251.9.start_idx0 = select i1 %17, i32 9, i32 %16
  %18 = add i32 %dynamic-slice.5251.9.start_idx0, 0
  %19 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %18
  %20 = load i64, ptr %19, align 8, !invariant.load !349
  %constant_1932_111 = load i64, ptr @26, align 8
  %21 = icmp slt i64 %20, %constant_1932_111
  %22 = zext i1 %21 to i8
  %constant_1931_52 = load i64, ptr @27, align 8
  %23 = add i64 %20, %constant_1931_52
  %24 = trunc i8 %22 to i1
  %25 = select i1 %24, i64 %23, i64 %20
  %26 = trunc i64 %25 to i32
  %27 = icmp sge i32 0, %26
  %28 = select i1 %27, i32 0, i32 %26
  %29 = icmp sle i32 9, %28
  %dynamic-slice.5253.3.start_idx0 = select i1 %29, i32 9, i32 %28
  %constant_1932_113 = load i64, ptr @26, align 8
  %30 = trunc i64 %constant_1932_113 to i32
  %31 = icmp sge i32 0, %30
  %32 = select i1 %31, i32 0, i32 %30
  %33 = icmp sle i32 0, %32
  %dynamic-slice.5253.3.start_idx1 = select i1 %33, i32 0, i32 %32
  %34 = add i32 %dynamic-slice.5253.3.start_idx0, 0
  %35 = add i32 %dynamic-slice.5253.3.start_idx1, %reduce.171.1.inner.indvar.reduction_dim.0
  %36 = getelementptr inbounds [10 x [20 x double]], ptr %arg1, i32 0, i32 %34, i32 %35
  %37 = load double, ptr %36, align 8, !invariant.load !349
  %38 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.171.1.inner.indvar.reduction_dim.0
  %39 = load double, ptr %38, align 8, !invariant.load !349
  %multiply.11266.3 = fmul double %37, %39
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11266.3, ptr %parameter_buffer4, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer4, ptr %return_buffer)
  %40 = load double, ptr %return_buffer, align 8
  store double %40, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.171.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.171.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.171.1.inner.loop_header.reduction_dim.0

reduce.171.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.171.1.inner.loop_header.reduction_dim.0
  %41 = load double, ptr %accumulator_0, align 8
  %42 = insertvalue { double, double, double, double, double } undef, double %41, 0
  %constant_1935_36 = load double, ptr @25, align 8
  store double %constant_1935_36, ptr %accumulator_05, align 8
  store i32 0, ptr %reduce.172.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.172.1.clone.1.inner.loop_header.reduction_dim.0

reduce.172.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.172.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.171.1.inner.loop_exit.reduction_dim.0
  %reduce.172.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.172.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %43 = icmp uge i32 %reduce.172.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %43, label %reduce.172.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.172.1.clone.1.inner.loop_body.reduction_dim.0

reduce.172.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.172.1.clone.1.inner.loop_header.reduction_dim.0
  %44 = load double, ptr %accumulator_05, align 8
  %45 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1932_118 = load i64, ptr @26, align 8
  %46 = icmp slt i64 %45, %constant_1932_118
  %47 = zext i1 %46 to i8
  %48 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1931_59 = load i64, ptr @27, align 8
  %49 = add i64 %48, %constant_1931_59
  %50 = load i64, ptr %arg3, align 8, !invariant.load !349
  %51 = trunc i8 %47 to i1
  %52 = select i1 %51, i64 %49, i64 %50
  %53 = trunc i64 %52 to i32
  %54 = icmp sge i32 0, %53
  %55 = select i1 %54, i32 0, i32 %53
  %56 = icmp sle i32 9, %55
  %dynamic-slice.5251.9.start_idx010 = select i1 %56, i32 9, i32 %55
  %57 = add i32 %dynamic-slice.5251.9.start_idx010, 0
  %58 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %57
  %59 = load i64, ptr %58, align 8, !invariant.load !349
  %constant_1932_1111 = load i64, ptr @26, align 8
  %60 = icmp slt i64 %59, %constant_1932_1111
  %61 = zext i1 %60 to i8
  %constant_1931_512 = load i64, ptr @27, align 8
  %62 = add i64 %59, %constant_1931_512
  %63 = trunc i8 %61 to i1
  %64 = select i1 %63, i64 %62, i64 %59
  %65 = trunc i64 %64 to i32
  %66 = icmp sge i32 0, %65
  %67 = select i1 %66, i32 0, i32 %65
  %68 = icmp sle i32 9, %67
  %dynamic-slice.5254.3.clone.1.start_idx0 = select i1 %68, i32 9, i32 %67
  %constant_1932_1113 = load i64, ptr @26, align 8
  %69 = trunc i64 %constant_1932_1113 to i32
  %70 = icmp sge i32 0, %69
  %71 = select i1 %70, i32 0, i32 %69
  %72 = icmp sle i32 0, %71
  %dynamic-slice.5254.3.clone.1.start_idx1 = select i1 %72, i32 0, i32 %71
  %73 = add i32 %dynamic-slice.5254.3.clone.1.start_idx0, 0
  %74 = add i32 %dynamic-slice.5254.3.clone.1.start_idx1, %reduce.172.1.clone.1.inner.indvar.reduction_dim.0
  %75 = getelementptr inbounds [10 x [20 x double]], ptr %arg5, i32 0, i32 %73, i32 %74
  %76 = load double, ptr %75, align 8, !invariant.load !349
  %77 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %reduce.172.1.clone.1.inner.indvar.reduction_dim.0
  %78 = load double, ptr %77, align 8, !invariant.load !349
  %multiply.11267.3.clone.1 = fmul double %76, %78
  store double %44, ptr %parameter_buffer14, align 8
  store double %multiply.11267.3.clone.1, ptr %parameter_buffer15, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer14, ptr %parameter_buffer15, ptr %return_buffer16)
  %79 = load double, ptr %return_buffer16, align 8
  store double %79, ptr %accumulator_05, align 8
  %invar.inc7 = add nuw nsw i32 %reduce.172.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc7, ptr %reduce.172.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.172.1.clone.1.inner.loop_header.reduction_dim.0

reduce.172.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.172.1.clone.1.inner.loop_header.reduction_dim.0
  %80 = load double, ptr %accumulator_05, align 8
  %81 = insertvalue { double, double, double, double, double } %42, double %80, 1
  %constant_1935_318 = load double, ptr @25, align 8
  store double %constant_1935_318, ptr %accumulator_017, align 8
  store i32 0, ptr %reduce.173.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.173.1.clone.1.inner.loop_header.reduction_dim.0

reduce.173.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.173.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.172.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.173.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.173.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %82 = icmp uge i32 %reduce.173.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %82, label %reduce.173.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.173.1.clone.1.inner.loop_body.reduction_dim.0

reduce.173.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.173.1.clone.1.inner.loop_header.reduction_dim.0
  %83 = load double, ptr %accumulator_017, align 8
  %84 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1932_1120 = load i64, ptr @26, align 8
  %85 = icmp slt i64 %84, %constant_1932_1120
  %86 = zext i1 %85 to i8
  %87 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1931_521 = load i64, ptr @27, align 8
  %88 = add i64 %87, %constant_1931_521
  %89 = load i64, ptr %arg3, align 8, !invariant.load !349
  %90 = trunc i8 %86 to i1
  %91 = select i1 %90, i64 %88, i64 %89
  %92 = trunc i64 %91 to i32
  %93 = icmp sge i32 0, %92
  %94 = select i1 %93, i32 0, i32 %92
  %95 = icmp sle i32 9, %94
  %dynamic-slice.5251.9.start_idx022 = select i1 %95, i32 9, i32 %94
  %96 = add i32 %dynamic-slice.5251.9.start_idx022, 0
  %97 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %96
  %98 = load i64, ptr %97, align 8, !invariant.load !349
  %constant_1932_1123 = load i64, ptr @26, align 8
  %99 = icmp slt i64 %98, %constant_1932_1123
  %100 = zext i1 %99 to i8
  %constant_1931_524 = load i64, ptr @27, align 8
  %101 = add i64 %98, %constant_1931_524
  %102 = trunc i8 %100 to i1
  %103 = select i1 %102, i64 %101, i64 %98
  %104 = trunc i64 %103 to i32
  %105 = icmp sge i32 0, %104
  %106 = select i1 %105, i32 0, i32 %104
  %107 = icmp sle i32 9, %106
  %dynamic-slice.5255.3.clone.1.start_idx0 = select i1 %107, i32 9, i32 %106
  %constant_1932_1125 = load i64, ptr @26, align 8
  %108 = trunc i64 %constant_1932_1125 to i32
  %109 = icmp sge i32 0, %108
  %110 = select i1 %109, i32 0, i32 %108
  %111 = icmp sle i32 0, %110
  %dynamic-slice.5255.3.clone.1.start_idx1 = select i1 %111, i32 0, i32 %110
  %112 = add i32 %dynamic-slice.5255.3.clone.1.start_idx0, 0
  %113 = add i32 %dynamic-slice.5255.3.clone.1.start_idx1, %reduce.173.1.clone.1.inner.indvar.reduction_dim.0
  %114 = getelementptr inbounds [10 x [20 x double]], ptr %arg7, i32 0, i32 %112, i32 %113
  %115 = load double, ptr %114, align 8, !invariant.load !349
  %116 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %reduce.173.1.clone.1.inner.indvar.reduction_dim.0
  %117 = load double, ptr %116, align 8, !invariant.load !349
  %multiply.11268.3.clone.1 = fmul double %115, %117
  store double %83, ptr %parameter_buffer26, align 8
  store double %multiply.11268.3.clone.1, ptr %parameter_buffer27, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer26, ptr %parameter_buffer27, ptr %return_buffer28)
  %118 = load double, ptr %return_buffer28, align 8
  store double %118, ptr %accumulator_017, align 8
  %invar.inc19 = add nuw nsw i32 %reduce.173.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc19, ptr %reduce.173.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.173.1.clone.1.inner.loop_header.reduction_dim.0

reduce.173.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.173.1.clone.1.inner.loop_header.reduction_dim.0
  %119 = load double, ptr %accumulator_017, align 8
  %120 = insertvalue { double, double, double, double, double } %81, double %119, 2
  %constant_1935_330 = load double, ptr @25, align 8
  store double %constant_1935_330, ptr %accumulator_029, align 8
  store i32 0, ptr %reduce.174.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.174.1.clone.1.inner.loop_header.reduction_dim.0

reduce.174.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.174.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.173.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.174.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.174.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %121 = icmp uge i32 %reduce.174.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %121, label %reduce.174.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.174.1.clone.1.inner.loop_body.reduction_dim.0

reduce.174.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.174.1.clone.1.inner.loop_header.reduction_dim.0
  %122 = load double, ptr %accumulator_029, align 8
  %123 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1932_1132 = load i64, ptr @26, align 8
  %124 = icmp slt i64 %123, %constant_1932_1132
  %125 = zext i1 %124 to i8
  %126 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1931_533 = load i64, ptr @27, align 8
  %127 = add i64 %126, %constant_1931_533
  %128 = load i64, ptr %arg3, align 8, !invariant.load !349
  %129 = trunc i8 %125 to i1
  %130 = select i1 %129, i64 %127, i64 %128
  %131 = trunc i64 %130 to i32
  %132 = icmp sge i32 0, %131
  %133 = select i1 %132, i32 0, i32 %131
  %134 = icmp sle i32 9, %133
  %dynamic-slice.5251.9.start_idx034 = select i1 %134, i32 9, i32 %133
  %135 = add i32 %dynamic-slice.5251.9.start_idx034, 0
  %136 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %135
  %137 = load i64, ptr %136, align 8, !invariant.load !349
  %constant_1932_1135 = load i64, ptr @26, align 8
  %138 = icmp slt i64 %137, %constant_1932_1135
  %139 = zext i1 %138 to i8
  %constant_1931_536 = load i64, ptr @27, align 8
  %140 = add i64 %137, %constant_1931_536
  %141 = trunc i8 %139 to i1
  %142 = select i1 %141, i64 %140, i64 %137
  %143 = trunc i64 %142 to i32
  %144 = icmp sge i32 0, %143
  %145 = select i1 %144, i32 0, i32 %143
  %146 = icmp sle i32 9, %145
  %dynamic-slice.5256.3.clone.1.start_idx0 = select i1 %146, i32 9, i32 %145
  %constant_1932_1137 = load i64, ptr @26, align 8
  %147 = trunc i64 %constant_1932_1137 to i32
  %148 = icmp sge i32 0, %147
  %149 = select i1 %148, i32 0, i32 %147
  %150 = icmp sle i32 0, %149
  %dynamic-slice.5256.3.clone.1.start_idx1 = select i1 %150, i32 0, i32 %149
  %151 = add i32 %dynamic-slice.5256.3.clone.1.start_idx0, 0
  %152 = add i32 %dynamic-slice.5256.3.clone.1.start_idx1, %reduce.174.1.clone.1.inner.indvar.reduction_dim.0
  %153 = getelementptr inbounds [10 x [20 x double]], ptr %arg9, i32 0, i32 %151, i32 %152
  %154 = load double, ptr %153, align 8, !invariant.load !349
  %155 = getelementptr inbounds [20 x double], ptr %arg8, i32 0, i32 %reduce.174.1.clone.1.inner.indvar.reduction_dim.0
  %156 = load double, ptr %155, align 8, !invariant.load !349
  %multiply.11269.3.clone.1 = fmul double %154, %156
  store double %122, ptr %parameter_buffer38, align 8
  store double %multiply.11269.3.clone.1, ptr %parameter_buffer39, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer38, ptr %parameter_buffer39, ptr %return_buffer40)
  %157 = load double, ptr %return_buffer40, align 8
  store double %157, ptr %accumulator_029, align 8
  %invar.inc31 = add nuw nsw i32 %reduce.174.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc31, ptr %reduce.174.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.174.1.clone.1.inner.loop_header.reduction_dim.0

reduce.174.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.174.1.clone.1.inner.loop_header.reduction_dim.0
  %158 = load double, ptr %accumulator_029, align 8
  %159 = insertvalue { double, double, double, double, double } %120, double %158, 3
  %constant_1935_342 = load double, ptr @25, align 8
  store double %constant_1935_342, ptr %accumulator_041, align 8
  store i32 0, ptr %reduce.175.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.175.1.clone.1.inner.loop_header.reduction_dim.0

reduce.175.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.175.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.174.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.175.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.175.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %160 = icmp uge i32 %reduce.175.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %160, label %reduce.175.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.175.1.clone.1.inner.loop_body.reduction_dim.0

reduce.175.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.175.1.clone.1.inner.loop_header.reduction_dim.0
  %161 = load double, ptr %accumulator_041, align 8
  %162 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1932_1144 = load i64, ptr @26, align 8
  %163 = icmp slt i64 %162, %constant_1932_1144
  %164 = zext i1 %163 to i8
  %165 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_1931_545 = load i64, ptr @27, align 8
  %166 = add i64 %165, %constant_1931_545
  %167 = load i64, ptr %arg3, align 8, !invariant.load !349
  %168 = trunc i8 %164 to i1
  %169 = select i1 %168, i64 %166, i64 %167
  %170 = trunc i64 %169 to i32
  %171 = icmp sge i32 0, %170
  %172 = select i1 %171, i32 0, i32 %170
  %173 = icmp sle i32 9, %172
  %dynamic-slice.5251.9.start_idx046 = select i1 %173, i32 9, i32 %172
  %174 = add i32 %dynamic-slice.5251.9.start_idx046, 0
  %175 = getelementptr inbounds [10 x i64], ptr %arg2, i32 0, i32 %174
  %176 = load i64, ptr %175, align 8, !invariant.load !349
  %constant_1932_1147 = load i64, ptr @26, align 8
  %177 = icmp slt i64 %176, %constant_1932_1147
  %178 = zext i1 %177 to i8
  %constant_1931_548 = load i64, ptr @27, align 8
  %179 = add i64 %176, %constant_1931_548
  %180 = trunc i8 %178 to i1
  %181 = select i1 %180, i64 %179, i64 %176
  %182 = trunc i64 %181 to i32
  %183 = icmp sge i32 0, %182
  %184 = select i1 %183, i32 0, i32 %182
  %185 = icmp sle i32 9, %184
  %dynamic-slice.5257.3.clone.1.start_idx0 = select i1 %185, i32 9, i32 %184
  %constant_1932_1149 = load i64, ptr @26, align 8
  %186 = trunc i64 %constant_1932_1149 to i32
  %187 = icmp sge i32 0, %186
  %188 = select i1 %187, i32 0, i32 %186
  %189 = icmp sle i32 0, %188
  %dynamic-slice.5257.3.clone.1.start_idx1 = select i1 %189, i32 0, i32 %188
  %190 = add i32 %dynamic-slice.5257.3.clone.1.start_idx0, 0
  %191 = add i32 %dynamic-slice.5257.3.clone.1.start_idx1, %reduce.175.1.clone.1.inner.indvar.reduction_dim.0
  %192 = getelementptr inbounds [10 x [20 x double]], ptr %arg11, i32 0, i32 %190, i32 %191
  %193 = load double, ptr %192, align 8, !invariant.load !349
  %194 = getelementptr inbounds [20 x double], ptr %arg10, i32 0, i32 %reduce.175.1.clone.1.inner.indvar.reduction_dim.0
  %195 = load double, ptr %194, align 8, !invariant.load !349
  %multiply.11270.3.clone.1 = fmul double %193, %195
  store double %161, ptr %parameter_buffer50, align 8
  store double %multiply.11270.3.clone.1, ptr %parameter_buffer51, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer50, ptr %parameter_buffer51, ptr %return_buffer52)
  %196 = load double, ptr %return_buffer52, align 8
  store double %196, ptr %accumulator_041, align 8
  %invar.inc43 = add nuw nsw i32 %reduce.175.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc43, ptr %reduce.175.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.175.1.clone.1.inner.loop_header.reduction_dim.0

reduce.175.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.175.1.clone.1.inner.loop_header.reduction_dim.0
  %197 = load double, ptr %accumulator_041, align 8
  %198 = insertvalue { double, double, double, double, double } %159, double %197, 4
  %199 = extractvalue { double, double, double, double, double } %198, 0
  store double %199, ptr %arg12, align 8
  %200 = extractvalue { double, double, double, double, double } %198, 1
  store double %200, ptr %arg13, align 8
  %201 = extractvalue { double, double, double, double, double } %198, 2
  store double %201, ptr %arg14, align 8
  %202 = extractvalue { double, double, double, double, double } %198, 3
  store double %202, ptr %arg15, align 8
  %203 = extractvalue { double, double, double, double, double } %198, 4
  store double %203, ptr %arg16, align 8
  br label %loop_reduce_fusion.1.in_bounds-after
}

define void @loop_subtract_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(80) %arg5, ptr noalias align 128 dereferenceable(80) %arg6, ptr noalias align 128 dereferenceable(8) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(1600) %arg9, ptr noalias align 128 dereferenceable(80) %arg10, ptr noalias align 128 dereferenceable(8) %arg11) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer9 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.176.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_subtract_fusion.in_bounds-true, label %loop_subtract_fusion.in_bounds-after

loop_subtract_fusion.in_bounds-after:             ; preds = %reduce.176.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_subtract_fusion.in_bounds-true:              ; preds = %entry
  %4 = load i64, ptr %arg7, align 8, !invariant.load !349
  %constant_1932_2 = load i64, ptr @29, align 8
  %5 = icmp slt i64 %4, %constant_1932_2
  %6 = zext i1 %5 to i8
  %7 = load i64, ptr %arg7, align 8, !invariant.load !349
  %constant_1931_2 = load i64, ptr @30, align 8
  %8 = add i64 %7, %constant_1931_2
  %9 = load i64, ptr %arg7, align 8, !invariant.load !349
  %10 = trunc i8 %6 to i1
  %11 = select i1 %10, i64 %8, i64 %9
  %12 = trunc i64 %11 to i32
  %13 = icmp sge i32 0, %12
  %14 = select i1 %13, i32 0, i32 %12
  %15 = icmp sle i32 9, %14
  %dynamic-slice.5250.1.start_idx0 = select i1 %15, i32 9, i32 %14
  %16 = add i32 %dynamic-slice.5250.1.start_idx0, 0
  %17 = getelementptr inbounds [10 x double], ptr %arg6, i32 0, i32 %16
  %18 = load double, ptr %17, align 8, !invariant.load !349
  %19 = trunc i64 %11 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 9, %21
  %dynamic-slice.5251.7.start_idx0 = select i1 %22, i32 9, i32 %21
  %23 = add i32 %dynamic-slice.5251.7.start_idx0, 0
  %24 = getelementptr inbounds [10 x i64], ptr %arg10, i32 0, i32 %23
  %25 = load i64, ptr %24, align 8, !invariant.load !349
  %constant_1932_21 = load i64, ptr @29, align 8
  %26 = icmp slt i64 %25, %constant_1932_21
  %27 = zext i1 %26 to i8
  %constant_1931_22 = load i64, ptr @30, align 8
  %28 = add i64 %25, %constant_1931_22
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, i64 %28, i64 %25
  %31 = trunc i64 %30 to i32
  %32 = icmp sge i32 0, %31
  %33 = select i1 %32, i32 0, i32 %31
  %34 = icmp sle i32 9, %33
  %dynamic-slice.5252.1.start_idx0 = select i1 %34, i32 9, i32 %33
  %35 = add i32 %dynamic-slice.5252.1.start_idx0, 0
  %36 = getelementptr inbounds [10 x double], ptr %arg5, i32 0, i32 %35
  %37 = load double, ptr %36, align 8, !invariant.load !349
  %38 = load double, ptr %arg3, align 8, !invariant.load !349
  %39 = load double, ptr %arg4, align 8, !invariant.load !349
  %add.9459.1 = fadd double %38, %39
  %40 = load double, ptr %arg2, align 8, !invariant.load !349
  %add.9460.1 = fadd double %add.9459.1, %40
  %41 = load double, ptr %arg1, align 8, !invariant.load !349
  %add.9461.1 = fadd double %add.9460.1, %41
  %42 = load double, ptr %arg0, align 8, !invariant.load !349
  %add.9462.1 = fadd double %add.9461.1, %42
  %constant_1935_2 = load double, ptr @28, align 8
  store double %constant_1935_2, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.176.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.176.1.inner.loop_header.reduction_dim.0

reduce.176.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.176.1.inner.loop_body.reduction_dim.0, %loop_subtract_fusion.in_bounds-true
  %reduce.176.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.176.1.inner.invar_address.reduction_dim.0, align 4
  %43 = icmp uge i32 %reduce.176.1.inner.indvar.reduction_dim.0, 20
  br i1 %43, label %reduce.176.1.inner.loop_exit.reduction_dim.0, label %reduce.176.1.inner.loop_body.reduction_dim.0

reduce.176.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.176.1.inner.loop_header.reduction_dim.0
  %44 = load double, ptr %accumulator_0, align 8
  %45 = load i64, ptr %arg7, align 8, !invariant.load !349
  %constant_1932_23 = load i64, ptr @29, align 8
  %46 = icmp slt i64 %45, %constant_1932_23
  %47 = zext i1 %46 to i8
  %48 = load i64, ptr %arg7, align 8, !invariant.load !349
  %constant_1931_24 = load i64, ptr @30, align 8
  %49 = add i64 %48, %constant_1931_24
  %50 = load i64, ptr %arg7, align 8, !invariant.load !349
  %51 = trunc i8 %47 to i1
  %52 = select i1 %51, i64 %49, i64 %50
  %53 = trunc i64 %52 to i32
  %54 = icmp sge i32 0, %53
  %55 = select i1 %54, i32 0, i32 %53
  %56 = icmp sle i32 9, %55
  %dynamic-slice.5251.7.start_idx05 = select i1 %56, i32 9, i32 %55
  %57 = add i32 %dynamic-slice.5251.7.start_idx05, 0
  %58 = getelementptr inbounds [10 x i64], ptr %arg10, i32 0, i32 %57
  %59 = load i64, ptr %58, align 8, !invariant.load !349
  %constant_1932_26 = load i64, ptr @29, align 8
  %60 = icmp slt i64 %59, %constant_1932_26
  %61 = zext i1 %60 to i8
  %constant_1931_27 = load i64, ptr @30, align 8
  %62 = add i64 %59, %constant_1931_27
  %63 = trunc i8 %61 to i1
  %64 = select i1 %63, i64 %62, i64 %59
  %65 = trunc i64 %64 to i32
  %66 = icmp sge i32 0, %65
  %67 = select i1 %66, i32 0, i32 %65
  %68 = icmp sle i32 9, %67
  %dynamic-slice.5258.3.start_idx0 = select i1 %68, i32 9, i32 %67
  %constant_1932_28 = load i64, ptr @29, align 8
  %69 = trunc i64 %constant_1932_28 to i32
  %70 = icmp sge i32 0, %69
  %71 = select i1 %70, i32 0, i32 %69
  %72 = icmp sle i32 0, %71
  %dynamic-slice.5258.3.start_idx1 = select i1 %72, i32 0, i32 %71
  %73 = add i32 %dynamic-slice.5258.3.start_idx0, 0
  %74 = add i32 %dynamic-slice.5258.3.start_idx1, %reduce.176.1.inner.indvar.reduction_dim.0
  %75 = getelementptr inbounds [10 x [20 x double]], ptr %arg9, i32 0, i32 %73, i32 %74
  %76 = load double, ptr %75, align 8, !invariant.load !349
  %77 = getelementptr inbounds [20 x double], ptr %arg8, i32 0, i32 %reduce.176.1.inner.indvar.reduction_dim.0
  %78 = load double, ptr %77, align 8, !invariant.load !349
  %multiply.11271.3 = fmul double %76, %78
  store double %44, ptr %parameter_buffer, align 8
  store double %multiply.11271.3, ptr %parameter_buffer9, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer9, ptr %return_buffer)
  %79 = load double, ptr %return_buffer, align 8
  store double %79, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.176.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.176.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.176.1.inner.loop_header.reduction_dim.0

reduce.176.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.176.1.inner.loop_header.reduction_dim.0
  %80 = load double, ptr %accumulator_0, align 8
  %add.9463.1 = fadd double %add.9462.1, %80
  %multiply.11272.3 = fmul double %37, %add.9463.1
  %subtract.815.1 = fsub double %18, %multiply.11272.3
  store double %subtract.815.1, ptr %arg11, align 8
  br label %loop_subtract_fusion.in_bounds-after
}

define void @loop_add_fusion_2(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1600) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(80) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(1600) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(1600) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(1600) %arg10, ptr noalias align 128 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(1600) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 128 dereferenceable(1600) %arg14) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_fusion.2.in_bounds-true, label %loop_add_fusion.2.in_bounds-after

loop_add_fusion.2.in_bounds-after:                ; preds = %loop_add_fusion.2.in_bounds-true, %entry
  ret void

loop_add_fusion.2.in_bounds-true:                 ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8
  %8 = load double, ptr %arg2, align 8, !invariant.load !349
  %9 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_1932_8 = load i64, ptr @31, align 8
  %10 = icmp slt i64 %9, %constant_1932_8
  %11 = zext i1 %10 to i8
  %12 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_1931_1 = load i64, ptr @32, align 8
  %13 = add i64 %12, %constant_1931_1
  %14 = load i64, ptr %arg4, align 8, !invariant.load !349
  %15 = trunc i8 %11 to i1
  %16 = select i1 %15, i64 %13, i64 %14
  %17 = trunc i64 %16 to i32
  %18 = icmp sge i32 0, %17
  %19 = select i1 %18, i32 0, i32 %17
  %20 = icmp sle i32 9, %19
  %dynamic-slice.5251.25.start_idx0 = select i1 %20, i32 9, i32 %19
  %21 = add i32 %dynamic-slice.5251.25.start_idx0, 0
  %22 = getelementptr inbounds [10 x i64], ptr %arg3, i32 0, i32 %21
  %23 = load i64, ptr %22, align 8, !invariant.load !349
  %constant_1932_81 = load i64, ptr @31, align 8
  %24 = icmp slt i64 %23, %constant_1932_81
  %25 = zext i1 %24 to i8
  %constant_1931_12 = load i64, ptr @32, align 8
  %26 = add i64 %23, %constant_1931_12
  %27 = trunc i8 %25 to i1
  %28 = select i1 %27, i64 %26, i64 %23
  %29 = trunc i64 %28 to i32
  %30 = icmp sge i32 0, %29
  %31 = select i1 %30, i32 0, i32 %29
  %32 = icmp sle i32 9, %31
  %dynamic-slice.5261.1.start_idx0 = select i1 %32, i32 9, i32 %31
  %constant_1932_83 = load i64, ptr @31, align 8
  %33 = trunc i64 %constant_1932_83 to i32
  %34 = icmp sge i32 0, %33
  %35 = select i1 %34, i32 0, i32 %33
  %36 = icmp sle i32 0, %35
  %dynamic-slice.5261.1.start_idx1 = select i1 %36, i32 0, i32 %35
  %37 = add i32 %dynamic-slice.5261.1.start_idx0, 0
  %38 = add i32 %dynamic-slice.5261.1.start_idx1, %3
  %39 = getelementptr inbounds [10 x [20 x double]], ptr %arg1, i32 0, i32 %37, i32 %38
  %40 = load double, ptr %39, align 8, !invariant.load !349
  %multiply.11275.1 = fmul double %8, %40
  %add.9466.1 = fadd double %7, %multiply.11275.1
  %41 = insertvalue { double, double, double, double, double, double } undef, double %add.9466.1, 0
  %42 = getelementptr double, ptr %arg5, i32 %linear_index
  %43 = getelementptr inbounds double, ptr %42, i32 0
  %44 = load double, ptr %43, align 8
  %45 = trunc i64 %28 to i32
  %46 = icmp sge i32 0, %45
  %47 = select i1 %46, i32 0, i32 %45
  %48 = icmp sle i32 9, %47
  %dynamic-slice.5263.1.clone.1.start_idx0 = select i1 %48, i32 9, i32 %47
  %constant_1932_84 = load i64, ptr @31, align 8
  %49 = trunc i64 %constant_1932_84 to i32
  %50 = icmp sge i32 0, %49
  %51 = select i1 %50, i32 0, i32 %49
  %52 = icmp sle i32 0, %51
  %dynamic-slice.5263.1.clone.1.start_idx1 = select i1 %52, i32 0, i32 %51
  %53 = add i32 %dynamic-slice.5263.1.clone.1.start_idx0, 0
  %54 = add i32 %dynamic-slice.5263.1.clone.1.start_idx1, %3
  %55 = getelementptr inbounds [10 x [20 x double]], ptr %arg6, i32 0, i32 %53, i32 %54
  %56 = load double, ptr %55, align 8, !invariant.load !349
  %multiply.11277.1.clone.1 = fmul double %8, %56
  %add.9468.1.clone.1 = fadd double %44, %multiply.11277.1.clone.1
  %57 = insertvalue { double, double, double, double, double, double } %41, double %add.9468.1.clone.1, 1
  %58 = getelementptr double, ptr %arg7, i32 %linear_index
  %59 = getelementptr inbounds double, ptr %58, i32 0
  %60 = load double, ptr %59, align 8
  %61 = trunc i64 %28 to i32
  %62 = icmp sge i32 0, %61
  %63 = select i1 %62, i32 0, i32 %61
  %64 = icmp sle i32 9, %63
  %dynamic-slice.5264.1.clone.1.start_idx0 = select i1 %64, i32 9, i32 %63
  %constant_1932_85 = load i64, ptr @31, align 8
  %65 = trunc i64 %constant_1932_85 to i32
  %66 = icmp sge i32 0, %65
  %67 = select i1 %66, i32 0, i32 %65
  %68 = icmp sle i32 0, %67
  %dynamic-slice.5264.1.clone.1.start_idx1 = select i1 %68, i32 0, i32 %67
  %69 = add i32 %dynamic-slice.5264.1.clone.1.start_idx0, 0
  %70 = add i32 %dynamic-slice.5264.1.clone.1.start_idx1, %3
  %71 = getelementptr inbounds [10 x [20 x double]], ptr %arg8, i32 0, i32 %69, i32 %70
  %72 = load double, ptr %71, align 8, !invariant.load !349
  %multiply.11278.1.clone.1 = fmul double %8, %72
  %add.9469.1.clone.1 = fadd double %60, %multiply.11278.1.clone.1
  %73 = insertvalue { double, double, double, double, double, double } %57, double %add.9469.1.clone.1, 2
  %74 = getelementptr double, ptr %arg9, i32 %linear_index
  %75 = getelementptr inbounds double, ptr %74, i32 0
  %76 = load double, ptr %75, align 8
  %77 = trunc i64 %28 to i32
  %78 = icmp sge i32 0, %77
  %79 = select i1 %78, i32 0, i32 %77
  %80 = icmp sle i32 9, %79
  %dynamic-slice.5262.1.clone.1.start_idx0 = select i1 %80, i32 9, i32 %79
  %constant_1932_86 = load i64, ptr @31, align 8
  %81 = trunc i64 %constant_1932_86 to i32
  %82 = icmp sge i32 0, %81
  %83 = select i1 %82, i32 0, i32 %81
  %84 = icmp sle i32 0, %83
  %dynamic-slice.5262.1.clone.1.start_idx1 = select i1 %84, i32 0, i32 %83
  %85 = add i32 %dynamic-slice.5262.1.clone.1.start_idx0, 0
  %86 = add i32 %dynamic-slice.5262.1.clone.1.start_idx1, %3
  %87 = getelementptr inbounds [10 x [20 x double]], ptr %arg10, i32 0, i32 %85, i32 %86
  %88 = load double, ptr %87, align 8, !invariant.load !349
  %multiply.11276.1.clone.1 = fmul double %8, %88
  %add.9467.1.clone.1 = fadd double %76, %multiply.11276.1.clone.1
  %89 = insertvalue { double, double, double, double, double, double } %73, double %add.9467.1.clone.1, 3
  %90 = getelementptr double, ptr %arg11, i32 %linear_index
  %91 = getelementptr inbounds double, ptr %90, i32 0
  %92 = load double, ptr %91, align 8
  %93 = trunc i64 %28 to i32
  %94 = icmp sge i32 0, %93
  %95 = select i1 %94, i32 0, i32 %93
  %96 = icmp sle i32 9, %95
  %dynamic-slice.5259.1.clone.1.start_idx0 = select i1 %96, i32 9, i32 %95
  %constant_1932_87 = load i64, ptr @31, align 8
  %97 = trunc i64 %constant_1932_87 to i32
  %98 = icmp sge i32 0, %97
  %99 = select i1 %98, i32 0, i32 %97
  %100 = icmp sle i32 0, %99
  %dynamic-slice.5259.1.clone.1.start_idx1 = select i1 %100, i32 0, i32 %99
  %101 = add i32 %dynamic-slice.5259.1.clone.1.start_idx0, 0
  %102 = add i32 %dynamic-slice.5259.1.clone.1.start_idx1, %3
  %103 = getelementptr inbounds [10 x [20 x double]], ptr %arg12, i32 0, i32 %101, i32 %102
  %104 = load double, ptr %103, align 8, !invariant.load !349
  %multiply.11273.1.clone.1 = fmul double %8, %104
  %add.9464.1.clone.1 = fadd double %92, %multiply.11273.1.clone.1
  %105 = insertvalue { double, double, double, double, double, double } %89, double %add.9464.1.clone.1, 4
  %106 = getelementptr double, ptr %arg13, i32 %linear_index
  %107 = getelementptr inbounds double, ptr %106, i32 0
  %108 = load double, ptr %107, align 8
  %109 = trunc i64 %28 to i32
  %110 = icmp sge i32 0, %109
  %111 = select i1 %110, i32 0, i32 %109
  %112 = icmp sle i32 9, %111
  %dynamic-slice.5260.1.clone.1.start_idx0 = select i1 %112, i32 9, i32 %111
  %constant_1932_88 = load i64, ptr @31, align 8
  %113 = trunc i64 %constant_1932_88 to i32
  %114 = icmp sge i32 0, %113
  %115 = select i1 %114, i32 0, i32 %113
  %116 = icmp sle i32 0, %115
  %dynamic-slice.5260.1.clone.1.start_idx1 = select i1 %116, i32 0, i32 %115
  %117 = add i32 %dynamic-slice.5260.1.clone.1.start_idx0, 0
  %118 = add i32 %dynamic-slice.5260.1.clone.1.start_idx1, %3
  %119 = getelementptr inbounds [10 x [20 x double]], ptr %arg14, i32 0, i32 %117, i32 %118
  %120 = load double, ptr %119, align 8, !invariant.load !349
  %multiply.11274.1.clone.1 = fmul double %8, %120
  %add.9465.1.clone.1 = fadd double %108, %multiply.11274.1.clone.1
  %121 = insertvalue { double, double, double, double, double, double } %105, double %add.9465.1.clone.1, 5
  %122 = extractvalue { double, double, double, double, double, double } %121, 0
  %123 = getelementptr double, ptr %arg0, i32 %linear_index
  %124 = getelementptr inbounds double, ptr %123, i32 0
  store double %122, ptr %124, align 8
  %125 = extractvalue { double, double, double, double, double, double } %121, 1
  %126 = getelementptr double, ptr %arg5, i32 %linear_index
  %127 = getelementptr inbounds double, ptr %126, i32 0
  store double %125, ptr %127, align 8
  %128 = extractvalue { double, double, double, double, double, double } %121, 2
  %129 = getelementptr double, ptr %arg7, i32 %linear_index
  %130 = getelementptr inbounds double, ptr %129, i32 0
  store double %128, ptr %130, align 8
  %131 = extractvalue { double, double, double, double, double, double } %121, 3
  %132 = getelementptr double, ptr %arg9, i32 %linear_index
  %133 = getelementptr inbounds double, ptr %132, i32 0
  store double %131, ptr %133, align 8
  %134 = extractvalue { double, double, double, double, double, double } %121, 4
  %135 = getelementptr double, ptr %arg11, i32 %linear_index
  %136 = getelementptr inbounds double, ptr %135, i32 0
  store double %134, ptr %136, align 8
  %137 = extractvalue { double, double, double, double, double, double } %121, 5
  %138 = getelementptr double, ptr %arg13, i32 %linear_index
  %139 = getelementptr inbounds double, ptr %138, i32 0
  store double %137, ptr %139, align 8
  br label %loop_add_fusion.2.in_bounds-after
}

define void @loop_minimum_fusion(ptr noalias align 128 dereferenceable(8) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_minimum_fusion.in_bounds-true, label %loop_minimum_fusion.in_bounds-after

loop_minimum_fusion.in_bounds-after:              ; preds = %loop_minimum_fusion.in_bounds-true, %entry
  ret void

loop_minimum_fusion.in_bounds-true:               ; preds = %entry
  %4 = load double, ptr %arg0, align 8
  %constant_2476_2 = load double, ptr @35, align 8
  %compare.2738.1 = fcmp ole double %4, %constant_2476_2
  %5 = zext i1 %compare.2738.1 to i8
  %constant_2470_3 = load double, ptr @33, align 8
  %6 = load double, ptr %arg0, align 8
  %constant_2478_1 = load double, ptr @34, align 8
  %multiply.11853.1 = fmul double %6, %constant_2478_1
  %7 = trunc i8 %5 to i1
  %8 = select i1 %7, double %constant_2470_3, double %multiply.11853.1
  %constant_2470_31 = load double, ptr @33, align 8
  %9 = fcmp une double %8, %8
  %10 = fcmp oeq double %constant_2470_31, %constant_2470_31
  %11 = fcmp ole double %8, %constant_2470_31
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %minimum.27.1 = select i1 %13, double %8, double %constant_2470_31
  store double %minimum.27.1, ptr %arg0, align 8
  br label %loop_minimum_fusion.in_bounds-after
}

define void @loop_add_fusion_35(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_fusion.35.in_bounds-true, label %loop_add_fusion.35.in_bounds-after

loop_add_fusion.35.in_bounds-after:               ; preds = %loop_add_fusion.35.in_bounds-true, %entry
  ret void

loop_add_fusion.35.in_bounds-true:                ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = load double, ptr %arg2, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %multiply.11868.1 = fmul double %8, %11
  %add.10021.1 = fadd double %7, %multiply.11868.1
  %12 = getelementptr double, ptr %arg3, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  store double %add.10021.1, ptr %13, align 8
  br label %loop_add_fusion.35.in_bounds-after
}

define void @loop_broadcast_fusion_54(ptr noalias align 128 dereferenceable(30720) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !352
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !353
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_broadcast_fusion.54.in_bounds-true, label %loop_broadcast_fusion.54.in_bounds-after

loop_broadcast_fusion.54.in_bounds-after:         ; preds = %loop_broadcast_fusion.54.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.54.in_bounds-true:          ; preds = %entry
  %constant_2461_3 = load double, ptr @36, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  store double %constant_2461_3, ptr %8, align 8
  br label %loop_broadcast_fusion.54.in_bounds-after
}

define void @loop_broadcast_fusion_55(ptr noalias align 128 dereferenceable(160) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_broadcast_fusion.55.in_bounds-true, label %loop_broadcast_fusion.55.in_bounds-after

loop_broadcast_fusion.55.in_bounds-after:         ; preds = %loop_broadcast_fusion.55.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.55.in_bounds-true:          ; preds = %entry
  %constant_2461_4 = load double, ptr @37, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_2461_4, ptr %6, align 8
  br label %loop_broadcast_fusion.55.in_bounds-after
}

define void @loop_broadcast_fusion_61(ptr noalias align 128 dereferenceable(3840) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !352
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !353
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_broadcast_fusion.61.in_bounds-true, label %loop_broadcast_fusion.61.in_bounds-after

loop_broadcast_fusion.61.in_bounds-after:         ; preds = %loop_broadcast_fusion.61.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.61.in_bounds-true:          ; preds = %entry
  %constant_2480_2 = load i8, ptr @38, align 1
  %7 = getelementptr i8, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds i8, ptr %7, i32 0
  store i8 %constant_2480_2, ptr %8, align 1
  br label %loop_broadcast_fusion.61.in_bounds-after
}

define void @loop_broadcast_fusion_59(ptr noalias align 128 dereferenceable(160) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_broadcast_fusion.59.in_bounds-true, label %loop_broadcast_fusion.59.in_bounds-after

loop_broadcast_fusion.59.in_bounds-after:         ; preds = %loop_broadcast_fusion.59.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.59.in_bounds-true:          ; preds = %entry
  %constant_2470_5 = load double, ptr @39, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_2470_5, ptr %6, align 8
  br label %loop_broadcast_fusion.59.in_bounds-after
}

define void @loop_broadcast_fusion_60(ptr noalias align 128 dereferenceable(3840) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !352
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !353
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 20
  %7 = udiv i32 %linear_index0, 20
  %8 = icmp ult i32 %linear_index, 3840
  br i1 %8, label %loop_broadcast_fusion.60.in_bounds-true, label %loop_broadcast_fusion.60.in_bounds-after

loop_broadcast_fusion.60.in_bounds-after:         ; preds = %loop_broadcast_fusion.60.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.60.in_bounds-true:          ; preds = %entry
  %constant_2480_1 = load i8, ptr @40, align 1
  %9 = getelementptr i8, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds i8, ptr %9, i32 0
  store i8 %constant_2480_1, ptr %10, align 1
  br label %loop_broadcast_fusion.60.in_bounds-after
}

define void @loop_broadcast_fusion_62(ptr noalias align 128 dereferenceable(15360) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !352
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !353
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_broadcast_fusion.62.in_bounds-true, label %loop_broadcast_fusion.62.in_bounds-after

loop_broadcast_fusion.62.in_bounds-after:         ; preds = %loop_broadcast_fusion.62.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.62.in_bounds-true:          ; preds = %entry
  %constant_2482_1 = load i32, ptr @41, align 4
  %7 = getelementptr i32, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds i32, ptr %7, i32 0
  store i32 %constant_2482_1, ptr %8, align 4
  br label %loop_broadcast_fusion.62.in_bounds-after
}

define void @loop_broadcast_fusion_56(ptr noalias align 128 dereferenceable(1536) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !354
  %2 = mul nuw nsw i32 %0, 192
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 192
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 192
  br i1 %4, label %loop_broadcast_fusion.56.in_bounds-true, label %loop_broadcast_fusion.56.in_bounds-after

loop_broadcast_fusion.56.in_bounds-after:         ; preds = %loop_broadcast_fusion.56.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.56.in_bounds-true:          ; preds = %entry
  %constant_2461_5 = load double, ptr @42, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_2461_5, ptr %6, align 8
  br label %loop_broadcast_fusion.56.in_bounds-after
}

define void @loop_broadcast_fusion_63(ptr noalias align 128 dereferenceable(768) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !354
  %2 = mul nuw nsw i32 %0, 192
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 192
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 192
  br i1 %4, label %loop_broadcast_fusion.63.in_bounds-true, label %loop_broadcast_fusion.63.in_bounds-after

loop_broadcast_fusion.63.in_bounds-after:         ; preds = %loop_broadcast_fusion.63.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.63.in_bounds-true:          ; preds = %entry
  %constant_2482_2 = load i32, ptr @43, align 4
  %5 = getelementptr i32, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds i32, ptr %5, i32 0
  store i32 %constant_2482_2, ptr %6, align 4
  br label %loop_broadcast_fusion.63.in_bounds-after
}

define void @loop_broadcast_fusion_51(ptr noalias align 128 dereferenceable(160) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_broadcast_fusion.51.in_bounds-true, label %loop_broadcast_fusion.51.in_bounds-after

loop_broadcast_fusion.51.in_bounds-after:         ; preds = %loop_broadcast_fusion.51.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.51.in_bounds-true:          ; preds = %entry
  %constant_2458_1 = load i64, ptr @44, align 8
  %5 = getelementptr i64, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds i64, ptr %5, i32 0
  store i64 %constant_2458_1, ptr %6, align 8
  br label %loop_broadcast_fusion.51.in_bounds-after
}

define void @loop_broadcast_fusion_58(ptr noalias align 128 dereferenceable(160) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = icmp ult i32 %linear_index, 20
  br i1 %6, label %loop_broadcast_fusion.58.in_bounds-true, label %loop_broadcast_fusion.58.in_bounds-after

loop_broadcast_fusion.58.in_bounds-after:         ; preds = %loop_broadcast_fusion.58.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.58.in_bounds-true:          ; preds = %entry
  %constant_2470_4 = load double, ptr @45, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  store double %constant_2470_4, ptr %8, align 8
  br label %loop_broadcast_fusion.58.in_bounds-after
}

define void @loop_broadcast_fusion_64(ptr noalias align 128 dereferenceable(160) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_broadcast_fusion.64.in_bounds-true, label %loop_broadcast_fusion.64.in_bounds-after

loop_broadcast_fusion.64.in_bounds-after:         ; preds = %loop_broadcast_fusion.64.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.64.in_bounds-true:          ; preds = %entry
  %constant_2486_2 = load double, ptr @46, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_2486_2, ptr %6, align 8
  br label %loop_broadcast_fusion.64.in_bounds-after
}

define void @loop_compare_fusion_9(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_compare_fusion.9.in_bounds-true, label %loop_compare_fusion.9.in_bounds-after

loop_compare_fusion.9.in_bounds-after:            ; preds = %loop_compare_fusion.9.in_bounds-true, %entry
  ret void

loop_compare_fusion.9.in_bounds-true:             ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !349
  %constant_5196_1 = load i64, ptr @47, align 8
  %5 = icmp slt i64 %4, %constant_5196_1
  %6 = zext i1 %5 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.9.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_216(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %param_1.7556 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_1 = load i64, ptr @50, align 8
  %0 = icmp slt i64 %param_1.7556, %constant_5141_1
  %1 = zext i1 %0 to i8
  %param_1.75561 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_30 = load i64, ptr @49, align 8
  %2 = add i64 %param_1.75561, %constant_5140_30
  %param_1.75562 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75562
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.5705.1.in_bounds-true, label %dynamic-update-slice.5705.1.in_bounds-after

dynamic-update-slice.5705.1.in_bounds-after:      ; preds = %dynamic-update-slice.5705.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5705.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %15 = getelementptr i32, ptr @48, i64 %linear_index
  %constant_5148_1 = getelementptr inbounds i32, ptr %15, i64 0
  %constant_5148_13 = load i32, ptr %constant_5148_1, align 4
  %16 = getelementptr inbounds [192 x i32], ptr %arg0, i64 0, i64 %14
  store i32 %constant_5148_13, ptr %16, align 4
  br label %dynamic-update-slice.5705.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_215(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %param_1.7558 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_56 = load i64, ptr @53, align 8
  %0 = icmp slt i64 %param_1.7558, %constant_5141_56
  %1 = zext i1 %0 to i8
  %param_1.75581 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_26 = load i64, ptr @52, align 8
  %2 = add i64 %param_1.75581, %constant_5140_26
  %param_1.75582 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75582
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.5702.1.in_bounds-true, label %dynamic-update-slice.5702.1.in_bounds-after

dynamic-update-slice.5702.1.in_bounds-after:      ; preds = %dynamic-update-slice.5702.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5702.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %15 = getelementptr double, ptr @51, i64 %linear_index
  %constant_5150_1 = getelementptr inbounds double, ptr %15, i64 0
  %constant_5150_13 = load double, ptr %constant_5150_1, align 8
  %16 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %constant_5150_13, ptr %16, align 8
  br label %dynamic-update-slice.5702.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_201(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.4306 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_5141_37 = load i64, ptr @56, align 8
  %0 = icmp slt i64 %param_4.4306, %constant_5141_37
  %1 = zext i1 %0 to i8
  %param_4.43061 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_5140_18 = load i64, ptr @55, align 8
  %2 = add i64 %param_4.43061, %constant_5140_18
  %param_4.43062 = load i64, ptr %arg4, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.43062
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_373 = load i64, ptr @56, align 8
  %9 = icmp sge i64 0, %constant_5141_373
  %10 = select i1 %9, i64 0, i64 %constant_5141_373
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5695.1.in_bounds-true, label %dynamic-update-slice.5695.1.in_bounds-after

dynamic-update-slice.5695.1.in_bounds-after:      ; preds = %dynamic-update-slice.5695.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5695.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7548 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75484 = load double, ptr %param_1.7548, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5078 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.50785 = load double, ptr %param_3.5078, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6242 = getelementptr inbounds double, ptr %24, i64 0
  %param_2.62426 = load double, ptr %param_2.6242, align 8, !invariant.load !349
  %multiply.11820.9 = fmul double %param_3.50785, %param_2.62426
  %add.10002.7 = fadd double %param_1.75484, %multiply.11820.9
  %25 = call double @__nv_exp(double %add.10002.7)
  %constant_5143_7 = load double, ptr @54, align 8
  %compare.2727.3 = fcmp ogt double %25, %constant_5143_7
  %26 = zext i1 %compare.2727.3 to i8
  %27 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %26, ptr %27, align 1
  br label %dynamic-update-slice.5695.1.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_dynamic_update_slice_fusion_171(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6190 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_6 = load i64, ptr @58, align 8
  %0 = icmp slt i64 %param_2.6190, %constant_5141_6
  %1 = zext i1 %0 to i8
  %param_2.61901 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_44 = load i64, ptr @59, align 8
  %2 = add i64 %param_2.61901, %constant_5140_44
  %param_2.61902 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.61902
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_63 = load i64, ptr @58, align 8
  %9 = icmp sge i64 0, %constant_5141_63
  %10 = select i1 %9, i64 0, i64 %constant_5141_63
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_5141_64 = load i64, ptr @58, align 8
  %13 = icmp sge i64 0, %constant_5141_64
  %14 = select i1 %13, i64 0, i64 %constant_5141_64
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %25, label %dynamic-update-slice.5729.1.in_bounds-true, label %dynamic-update-slice.5729.1.in_bounds-after

dynamic-update-slice.5729.1.in_bounds-after:      ; preds = %dynamic-update-slice.5729.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5729.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.7497 = getelementptr inbounds i64, ptr %29, i64 0
  %param_1.74975 = load i64, ptr %param_1.7497, align 8, !invariant.load !349
  %constant_5141_66 = load i64, ptr @58, align 8
  %30 = icmp ne i64 %param_1.74975, %constant_5141_66
  %31 = zext i1 %30 to i8
  %32 = zext i8 %31 to i32
  %constant_5139_3 = load i32, ptr @57, align 4
  %33 = icmp eq i32 %32, %constant_5139_3
  %34 = zext i1 %33 to i8
  %35 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %34, ptr %35, align 1
  br label %dynamic-update-slice.5729.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_172(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6228 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_44 = load i64, ptr @61, align 8
  %0 = icmp slt i64 %param_2.6228, %constant_5141_44
  %1 = zext i1 %0 to i8
  %param_2.62281 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_43 = load i64, ptr @62, align 8
  %2 = add i64 %param_2.62281, %constant_5140_43
  %param_2.62282 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62282
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_443 = load i64, ptr @61, align 8
  %9 = icmp sge i64 0, %constant_5141_443
  %10 = select i1 %9, i64 0, i64 %constant_5141_443
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5728.1.in_bounds-true, label %dynamic-update-slice.5728.1.in_bounds-after

dynamic-update-slice.5728.1.in_bounds-after:      ; preds = %dynamic-update-slice.5728.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5728.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.7534 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.75344 = load i64, ptr %param_1.7534, align 8, !invariant.load !349
  %constant_5141_445 = load i64, ptr @61, align 8
  %23 = icmp ne i64 %param_1.75344, %constant_5141_445
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_5139_1 = load i32, ptr @60, align 4
  %26 = icmp eq i32 %25, %constant_5139_1
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.5728.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_174(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6252 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_38 = load i64, ptr @64, align 8
  %0 = icmp slt i64 %param_2.6252, %constant_5141_38
  %1 = zext i1 %0 to i8
  %param_2.62521 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_1 = load i64, ptr @65, align 8
  %2 = add i64 %param_2.62521, %constant_5140_1
  %param_2.62522 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62522
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_383 = load i64, ptr @64, align 8
  %9 = icmp sge i64 0, %constant_5141_383
  %10 = select i1 %9, i64 0, i64 %constant_5141_383
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5725.1.in_bounds-true, label %dynamic-update-slice.5725.1.in_bounds-after

dynamic-update-slice.5725.1.in_bounds-after:      ; preds = %dynamic-update-slice.5725.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5725.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.7555 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.75554 = load i64, ptr %param_1.7555, align 8, !invariant.load !349
  %constant_5141_385 = load i64, ptr @64, align 8
  %23 = icmp ne i64 %param_1.75554, %constant_5141_385
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_5146_1 = load i32, ptr @63, align 4
  %26 = icmp eq i32 %25, %constant_5146_1
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.5725.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_208(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6243 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_20 = load i64, ptr @68, align 8
  %0 = icmp slt i64 %param_2.6243, %constant_5141_20
  %1 = zext i1 %0 to i8
  %param_2.62431 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_9 = load i64, ptr @67, align 8
  %2 = add i64 %param_2.62431, %constant_5140_9
  %param_2.62432 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62432
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_203 = load i64, ptr @68, align 8
  %9 = icmp sge i64 0, %constant_5141_203
  %10 = select i1 %9, i64 0, i64 %constant_5141_203
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5688.1.in_bounds-true, label %dynamic-update-slice.5688.1.in_bounds-after

dynamic-update-slice.5688.1.in_bounds-after:      ; preds = %dynamic-update-slice.5688.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5688.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7549 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75494 = load double, ptr %param_1.7549, align 8, !invariant.load !349
  %23 = call double @__nv_exp(double %param_1.75494)
  %constant_5143_10 = load double, ptr @66, align 8
  %compare.2731.3 = fcmp ogt double %23, %constant_5143_10
  %24 = zext i1 %compare.2731.3 to i8
  %25 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %24, ptr %25, align 1
  br label %dynamic-update-slice.5688.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_175(ptr noalias align 128 dereferenceable(15360) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6237 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_53 = load i64, ptr @69, align 8
  %0 = icmp slt i64 %param_2.6237, %constant_5141_53
  %1 = zext i1 %0 to i8
  %param_2.62371 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_55 = load i64, ptr @70, align 8
  %2 = add i64 %param_2.62371, %constant_5140_55
  %param_2.62372 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62372
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_533 = load i64, ptr @69, align 8
  %9 = icmp sge i64 0, %constant_5141_533
  %10 = select i1 %9, i64 0, i64 %constant_5141_533
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5724.1.in_bounds-true, label %dynamic-update-slice.5724.1.in_bounds-after

dynamic-update-slice.5724.1.in_bounds-after:      ; preds = %dynamic-update-slice.5724.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5724.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.7543 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.75434 = load i64, ptr %param_1.7543, align 8, !invariant.load !349
  %constant_5141_535 = load i64, ptr @69, align 8
  %23 = icmp ne i64 %param_1.75434, %constant_5141_535
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %26 = getelementptr inbounds [192 x [20 x i32]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i32 %25, ptr %26, align 4
  br label %dynamic-update-slice.5724.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_199(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %param_5.3523 = load i64, ptr %arg5, align 8, !invariant.load !349
  %constant_5141_41 = load i64, ptr @73, align 8
  %0 = icmp slt i64 %param_5.3523, %constant_5141_41
  %1 = zext i1 %0 to i8
  %param_5.35231 = load i64, ptr %arg5, align 8, !invariant.load !349
  %constant_5140_20 = load i64, ptr @72, align 8
  %2 = add i64 %param_5.35231, %constant_5140_20
  %param_5.35232 = load i64, ptr %arg5, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_5.35232
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_413 = load i64, ptr @73, align 8
  %9 = icmp sge i64 0, %constant_5141_413
  %10 = select i1 %9, i64 0, i64 %constant_5141_413
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5697.1.in_bounds-true, label %dynamic-update-slice.5697.1.in_bounds-after

dynamic-update-slice.5697.1.in_bounds-after:      ; preds = %dynamic-update-slice.5697.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5697.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6239 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.62394 = load double, ptr %param_2.6239, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4302 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.43025 = load double, ptr %param_4.4302, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5074 = getelementptr inbounds double, ptr %24, i64 0
  %param_3.50746 = load double, ptr %param_3.5074, align 8, !invariant.load !349
  %multiply.11820.11 = fmul double %param_4.43025, %param_3.50746
  %add.10002.9 = fadd double %param_2.62394, %multiply.11820.11
  %25 = call double @__nv_exp(double %add.10002.9)
  %constant_5143_2 = load double, ptr @71, align 8
  %compare.2727.11 = fcmp ogt double %25, %constant_5143_2
  %26 = zext i1 %compare.2727.11 to i8
  %27 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7531 = getelementptr inbounds double, ptr %27, i64 0
  %param_1.75317 = load double, ptr %param_1.7531, align 8, !invariant.load !349
  %28 = trunc i8 %26 to i1
  %29 = select i1 %28, double %25, double %param_1.75317
  %30 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %29, ptr %30, align 8
  br label %dynamic-update-slice.5697.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_202(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.4292 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_5141_35 = load i64, ptr @75, align 8
  %0 = icmp slt i64 %param_4.4292, %constant_5141_35
  %1 = zext i1 %0 to i8
  %param_4.42921 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_5140_17 = load i64, ptr @74, align 8
  %2 = add i64 %param_4.42921, %constant_5140_17
  %param_4.42922 = load i64, ptr %arg4, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.42922
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_353 = load i64, ptr @75, align 8
  %9 = icmp sge i64 0, %constant_5141_353
  %10 = select i1 %9, i64 0, i64 %constant_5141_353
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5694.1.in_bounds-true, label %dynamic-update-slice.5694.1.in_bounds-after

dynamic-update-slice.5694.1.in_bounds-after:      ; preds = %dynamic-update-slice.5694.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5694.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7525 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75254 = load double, ptr %param_1.7525, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5062 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.50625 = load double, ptr %param_3.5062, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6219 = getelementptr inbounds double, ptr %24, i64 0
  %param_2.62196 = load double, ptr %param_2.6219, align 8, !invariant.load !349
  %multiply.11820.7 = fmul double %param_3.50625, %param_2.62196
  %add.10002.5 = fadd double %param_1.75254, %multiply.11820.7
  %25 = call double @__nv_exp(double %add.10002.5)
  %26 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %25, ptr %26, align 8
  br label %dynamic-update-slice.5694.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_198(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %param_1.7535 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_45 = load i64, ptr @79, align 8
  %0 = icmp slt i64 %param_1.7535, %constant_5141_45
  %1 = zext i1 %0 to i8
  %param_1.75351 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_22 = load i64, ptr @78, align 8
  %2 = add i64 %param_1.75351, %constant_5140_22
  %param_1.75352 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75352
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_453 = load i64, ptr @79, align 8
  %9 = icmp sge i64 0, %constant_5141_453
  %10 = select i1 %9, i64 0, i64 %constant_5141_453
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5698.1.in_bounds-true, label %dynamic-update-slice.5698.1.in_bounds-after

dynamic-update-slice.5698.1.in_bounds-after:      ; preds = %dynamic-update-slice.5698.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5698.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_16 = load double, ptr @77, align 8
  %22 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2857 = getelementptr inbounds double, ptr %22, i64 0
  %param_6.28574 = load double, ptr %param_6.2857, align 8, !invariant.load !349
  %divide.2544.7 = fdiv double %constant_5138_16, %param_6.28574
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5079 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.50795 = load double, ptr %param_3.5079, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3527 = getelementptr inbounds double, ptr %24, i64 0
  %param_5.35276 = load double, ptr %param_5.3527, align 8, !invariant.load !349
  %25 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4307 = getelementptr inbounds double, ptr %25, i64 0
  %param_4.43077 = load double, ptr %param_4.4307, align 8, !invariant.load !349
  %multiply.11820.39 = fmul double %param_5.35276, %param_4.43077
  %add.10002.37 = fadd double %param_3.50795, %multiply.11820.39
  %26 = call double @__nv_exp(double %add.10002.37)
  %constant_5143_9 = load double, ptr @76, align 8
  %compare.2727.35 = fcmp ogt double %26, %constant_5143_9
  %27 = zext i1 %compare.2727.35 to i8
  %28 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6229 = getelementptr inbounds double, ptr %28, i64 0
  %param_2.62298 = load double, ptr %param_2.6229, align 8, !invariant.load !349
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, double %26, double %param_2.62298
  %add.10003.7 = fadd double %divide.2544.7, %30
  %multiply.11845.3 = fmul double %add.10003.7, %add.10003.7
  %divide.2557.3 = fdiv double %constant_5138_16, %multiply.11845.3
  %31 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.2557.3, ptr %31, align 8
  br label %dynamic-update-slice.5698.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_167(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6251 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_28 = load i64, ptr @82, align 8
  %0 = icmp slt i64 %param_2.6251, %constant_5141_28
  %1 = zext i1 %0 to i8
  %param_2.62511 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_37 = load i64, ptr @81, align 8
  %2 = add i64 %param_2.62511, %constant_5140_37
  %param_2.62512 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62512
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_283 = load i64, ptr @82, align 8
  %9 = icmp sge i64 0, %constant_5141_283
  %10 = select i1 %9, i64 0, i64 %constant_5141_283
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5733.1.in_bounds-true, label %dynamic-update-slice.5733.1.in_bounds-after

dynamic-update-slice.5733.1.in_bounds-after:      ; preds = %dynamic-update-slice.5733.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5733.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7554 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75544 = load double, ptr %param_1.7554, align 8, !invariant.load !349
  %multiply.11837.5 = fmul double %param_1.75544, %param_1.75544
  %constant_5145_3 = load double, ptr @80, align 8
  %multiply.11838.3 = fmul double %multiply.11837.5, %constant_5145_3
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11838.3, ptr %23, align 8
  br label %dynamic-update-slice.5733.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_168(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6246 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_32 = load i64, ptr @85, align 8
  %0 = icmp slt i64 %param_2.6246, %constant_5141_32
  %1 = zext i1 %0 to i8
  %param_2.62461 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_27 = load i64, ptr @84, align 8
  %2 = add i64 %param_2.62461, %constant_5140_27
  %param_2.62462 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62462
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_323 = load i64, ptr @85, align 8
  %9 = icmp sge i64 0, %constant_5141_323
  %10 = select i1 %9, i64 0, i64 %constant_5141_323
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5732.1.in_bounds-true, label %dynamic-update-slice.5732.1.in_bounds-after

dynamic-update-slice.5732.1.in_bounds-after:      ; preds = %dynamic-update-slice.5732.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5732.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7522 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75224 = load double, ptr %param_1.7522, align 8, !invariant.load !349
  %constant_5144_1 = load double, ptr @83, align 8
  %multiply.11852.3 = fmul double %param_1.75224, %constant_5144_1
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11852.3, ptr %23, align 8
  br label %dynamic-update-slice.5732.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_213(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %param_1.7545 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_55 = load i64, ptr @88, align 8
  %0 = icmp slt i64 %param_1.7545, %constant_5141_55
  %1 = zext i1 %0 to i8
  %param_1.75451 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_3 = load i64, ptr @87, align 8
  %2 = add i64 %param_1.75451, %constant_5140_3
  %param_1.75452 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75452
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_553 = load i64, ptr @88, align 8
  %9 = icmp sge i64 0, %constant_5141_553
  %10 = select i1 %9, i64 0, i64 %constant_5141_553
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5726.1.in_bounds-true, label %dynamic-update-slice.5726.1.in_bounds-after

dynamic-update-slice.5726.1.in_bounds-after:      ; preds = %dynamic-update-slice.5726.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5726.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_1 = load double, ptr @86, align 8
  %22 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %constant_5138_1, ptr %22, align 8
  br label %dynamic-update-slice.5726.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_176(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6226 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_42 = load i64, ptr @90, align 8
  %0 = icmp slt i64 %param_2.6226, %constant_5141_42
  %1 = zext i1 %0 to i8
  %param_2.62261 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_54 = load i64, ptr @89, align 8
  %2 = add i64 %param_2.62261, %constant_5140_54
  %param_2.62262 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62262
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_423 = load i64, ptr @90, align 8
  %9 = icmp sge i64 0, %constant_5141_423
  %10 = select i1 %9, i64 0, i64 %constant_5141_423
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5723.1.in_bounds-true, label %dynamic-update-slice.5723.1.in_bounds-after

dynamic-update-slice.5723.1.in_bounds-after:      ; preds = %dynamic-update-slice.5723.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5723.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.7532 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.75324 = load i64, ptr %param_1.7532, align 8, !invariant.load !349
  %23 = sitofp i64 %param_1.75324 to double
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.5723.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_182(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6227 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_43 = load i64, ptr @92, align 8
  %0 = icmp slt i64 %param_2.6227, %constant_5141_43
  %1 = zext i1 %0 to i8
  %param_2.62271 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_48 = load i64, ptr @91, align 8
  %2 = add i64 %param_2.62271, %constant_5140_48
  %param_2.62272 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62272
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_433 = load i64, ptr @92, align 8
  %9 = icmp sge i64 0, %constant_5141_433
  %10 = select i1 %9, i64 0, i64 %constant_5141_433
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5717.1.in_bounds-true, label %dynamic-update-slice.5717.1.in_bounds-after

dynamic-update-slice.5717.1.in_bounds-after:      ; preds = %dynamic-update-slice.5717.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5717.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7533 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75334 = load double, ptr %param_1.7533, align 8, !invariant.load !349
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.75334, ptr %23, align 8
  br label %dynamic-update-slice.5717.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_192(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6224 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_40 = load i64, ptr @94, align 8
  %0 = icmp slt i64 %param_2.6224, %constant_5141_40
  %1 = zext i1 %0 to i8
  %param_2.62241 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_33 = load i64, ptr @93, align 8
  %2 = add i64 %param_2.62241, %constant_5140_33
  %param_2.62242 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62242
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_403 = load i64, ptr @94, align 8
  %9 = icmp sge i64 0, %constant_5141_403
  %10 = select i1 %9, i64 0, i64 %constant_5141_403
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5707.1.in_bounds-true, label %dynamic-update-slice.5707.1.in_bounds-after

dynamic-update-slice.5707.1.in_bounds-after:      ; preds = %dynamic-update-slice.5707.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5707.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7530 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75304 = load double, ptr %param_1.7530, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.75305 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.75306 = load double, ptr %param_1.75305, align 8, !invariant.load !349
  %multiply.11821.2 = fmul double %param_1.75304, %param_1.75306
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11821.2, ptr %24, align 8
  br label %dynamic-update-slice.5707.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_214(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %param_1.7560 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_7 = load i64, ptr @97, align 8
  %0 = icmp slt i64 %param_1.7560, %constant_5141_7
  %1 = zext i1 %0 to i8
  %param_1.75601 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_31 = load i64, ptr @96, align 8
  %2 = add i64 %param_1.75601, %constant_5140_31
  %param_1.75602 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75602
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_73 = load i64, ptr @97, align 8
  %9 = icmp sge i64 0, %constant_5141_73
  %10 = select i1 %9, i64 0, i64 %constant_5141_73
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5706.1.in_bounds-true, label %dynamic-update-slice.5706.1.in_bounds-after

dynamic-update-slice.5706.1.in_bounds-after:      ; preds = %dynamic-update-slice.5706.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5706.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5153_1 = load double, ptr @95, align 8
  %22 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %constant_5153_1, ptr %22, align 8
  br label %dynamic-update-slice.5706.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_204(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6213 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_29 = load i64, ptr @100, align 8
  %0 = icmp slt i64 %param_2.6213, %constant_5141_29
  %1 = zext i1 %0 to i8
  %param_2.62131 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_14 = load i64, ptr @99, align 8
  %2 = add i64 %param_2.62131, %constant_5140_14
  %param_2.62132 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62132
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_293 = load i64, ptr @100, align 8
  %9 = icmp sge i64 0, %constant_5141_293
  %10 = select i1 %9, i64 0, i64 %constant_5141_293
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5692.1.in_bounds-true, label %dynamic-update-slice.5692.1.in_bounds-after

dynamic-update-slice.5692.1.in_bounds-after:      ; preds = %dynamic-update-slice.5692.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5692.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_15 = load double, ptr @98, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7519 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75194 = load double, ptr %param_1.7519, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.75195 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.75196 = load double, ptr %param_1.75195, align 8, !invariant.load !349
  %multiply.11844.3 = fmul double %param_1.75194, %param_1.75196
  %divide.2556.3 = fdiv double %constant_5138_15, %multiply.11844.3
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.2556.3, ptr %24, align 8
  br label %dynamic-update-slice.5692.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_206(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.5080 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5141_24 = load i64, ptr @103, align 8
  %0 = icmp slt i64 %param_3.5080, %constant_5141_24
  %1 = zext i1 %0 to i8
  %param_3.50801 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5140_11 = load i64, ptr @102, align 8
  %2 = add i64 %param_3.50801, %constant_5140_11
  %param_3.50802 = load i64, ptr %arg3, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.50802
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_243 = load i64, ptr @103, align 8
  %9 = icmp sge i64 0, %constant_5141_243
  %10 = select i1 %9, i64 0, i64 %constant_5141_243
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5690.1.in_bounds-true, label %dynamic-update-slice.5690.1.in_bounds-after

dynamic-update-slice.5690.1.in_bounds-after:      ; preds = %dynamic-update-slice.5690.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5690.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6208 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.62084 = load double, ptr %param_2.6208, align 8, !invariant.load !349
  %23 = call double @__nv_exp(double %param_2.62084)
  %constant_5143_12 = load double, ptr @101, align 8
  %compare.2731.7 = fcmp ogt double %23, %constant_5143_12
  %24 = zext i1 %compare.2731.7 to i8
  %25 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7514 = getelementptr inbounds double, ptr %25, i64 0
  %param_1.75145 = load double, ptr %param_1.7514, align 8, !invariant.load !349
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, double %23, double %param_1.75145
  %28 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %27, ptr %28, align 8
  br label %dynamic-update-slice.5690.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_209(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6202 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_18 = load i64, ptr @105, align 8
  %0 = icmp slt i64 %param_2.6202, %constant_5141_18
  %1 = zext i1 %0 to i8
  %param_2.62021 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_8 = load i64, ptr @104, align 8
  %2 = add i64 %param_2.62021, %constant_5140_8
  %param_2.62022 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62022
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_183 = load i64, ptr @105, align 8
  %9 = icmp sge i64 0, %constant_5141_183
  %10 = select i1 %9, i64 0, i64 %constant_5141_183
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5687.1.in_bounds-true, label %dynamic-update-slice.5687.1.in_bounds-after

dynamic-update-slice.5687.1.in_bounds-after:      ; preds = %dynamic-update-slice.5687.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5687.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7508 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75084 = load double, ptr %param_1.7508, align 8, !invariant.load !349
  %23 = call double @__nv_exp(double %param_1.75084)
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.5687.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_210(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6200 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_16 = load i64, ptr @107, align 8
  %0 = icmp slt i64 %param_2.6200, %constant_5141_16
  %1 = zext i1 %0 to i8
  %param_2.62001 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_7 = load i64, ptr @106, align 8
  %2 = add i64 %param_2.62001, %constant_5140_7
  %param_2.62002 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62002
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_163 = load i64, ptr @107, align 8
  %9 = icmp sge i64 0, %constant_5141_163
  %10 = select i1 %9, i64 0, i64 %constant_5141_163
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5686.1.in_bounds-true, label %dynamic-update-slice.5686.1.in_bounds-after

dynamic-update-slice.5686.1.in_bounds-after:      ; preds = %dynamic-update-slice.5686.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5686.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7506 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75064 = load double, ptr %param_1.7506, align 8, !invariant.load !349
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.75064, ptr %23, align 8
  br label %dynamic-update-slice.5686.1.in_bounds-after
}

define void @loop_add_divide_select_fusion_3(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(30720) %arg12, ptr noalias align 128 dereferenceable(8) %arg13, ptr noalias align 128 dereferenceable(160) %arg14, ptr noalias align 128 dereferenceable(160) %arg15, ptr noalias align 128 dereferenceable(160) %arg16, ptr noalias align 128 dereferenceable(160) %arg17, ptr noalias align 128 dereferenceable(160) %arg18, ptr noalias align 128 dereferenceable(160) %arg19, ptr noalias align 128 dereferenceable(160) %arg20, ptr noalias align 128 dereferenceable(160) %arg21, ptr noalias align 128 dereferenceable(160) %arg22) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_divide_select_fusion.3.in_bounds-true, label %loop_add_divide_select_fusion.3.in_bounds-after

loop_add_divide_select_fusion.3.in_bounds-after:  ; preds = %loop_add_divide_select_fusion.3.in_bounds-true, %entry
  ret void

loop_add_divide_select_fusion.3.in_bounds-true:   ; preds = %entry
  %5 = getelementptr double, ptr %arg3, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr double, ptr %arg5, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %multiply.11817.19 = fmul double %7, %10
  %11 = getelementptr double, ptr %arg2, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !349
  %add.10000.19 = fadd double %multiply.11817.19, %13
  %14 = getelementptr double, ptr %arg8, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !349
  %constant_5138_9 = load double, ptr @108, align 8
  %17 = fneg double %add.10000.19
  %18 = call double @__nv_exp(double %17)
  %add.10001.1.clone.1 = fadd double %18, %constant_5138_9
  %divide.2543.1.clone.1 = fdiv double %constant_5138_9, %add.10001.1.clone.1
  %subtract.869.6.clone.1 = fsub double %constant_5138_9, %divide.2543.1.clone.1
  %multiply.11818.5.clone.1 = fmul double %divide.2543.1.clone.1, %subtract.869.6.clone.1
  %multiply.11819.5.clone.1 = fmul double %16, %multiply.11818.5.clone.1
  %19 = getelementptr double, ptr %arg11, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  %21 = load double, ptr %20, align 8
  %divide.2544.5.clone.1 = fdiv double %constant_5138_9, %21
  %22 = getelementptr double, ptr %arg7, i32 %linear_index
  %23 = getelementptr inbounds double, ptr %22, i32 0
  %24 = load double, ptr %23, align 8, !invariant.load !349
  %25 = getelementptr double, ptr %arg0, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  %27 = load double, ptr %26, align 8, !invariant.load !349
  %multiply.11820.37.clone.1 = fmul double %16, %27
  %add.10002.35.clone.1 = fadd double %24, %multiply.11820.37.clone.1
  %28 = call double @__nv_exp(double %add.10002.35.clone.1)
  %constant_5143_21 = load double, ptr @109, align 8
  %compare.2727.33.clone.1 = fcmp ogt double %28, %constant_5143_21
  %29 = zext i1 %compare.2727.33.clone.1 to i8
  %30 = getelementptr double, ptr %arg6, i32 %linear_index
  %31 = getelementptr inbounds double, ptr %30, i32 0
  %32 = load double, ptr %31, align 8, !invariant.load !349
  %33 = trunc i8 %29 to i1
  %34 = select i1 %33, double %28, double %32
  %add.10003.5.clone.1 = fadd double %divide.2544.5.clone.1, %34
  %divide.2545.1.clone.1 = fdiv double %constant_5138_9, %add.10003.5.clone.1
  %35 = getelementptr double, ptr %arg8, i32 %linear_index
  %36 = getelementptr inbounds double, ptr %35, i32 0
  %37 = load double, ptr %36, align 8, !invariant.load !349
  %38 = getelementptr double, ptr %arg8, i32 %linear_index
  %39 = getelementptr inbounds double, ptr %38, i32 0
  %40 = load double, ptr %39, align 8, !invariant.load !349
  %multiply.11821.12.clone.1 = fmul double %37, %40
  %multiply.11822.11.clone.1 = fmul double %multiply.11821.12.clone.1, %multiply.11818.5.clone.1
  %add.10004.9.clone.1 = fadd double %divide.2545.1.clone.1, %multiply.11822.11.clone.1
  %compare.2728.9.clone.1 = fcmp ogt double %add.10004.9.clone.1, %constant_5143_21
  %41 = zext i1 %compare.2728.9.clone.1 to i8
  %constant_5151_4_clone_1 = load double, ptr @110, align 8
  %42 = trunc i8 %41 to i1
  %43 = select i1 %42, double %add.10004.9.clone.1, double %constant_5151_4_clone_1
  %divide.2546.1.clone.1 = fdiv double %multiply.11819.5.clone.1, %43
  %constant_5141_2_clone_1 = load i64, ptr @111, align 8
  %44 = trunc i64 %constant_5141_2_clone_1 to i32
  %45 = icmp sge i32 0, %44
  %46 = select i1 %45, i32 0, i32 %44
  %47 = icmp sle i32 0, %46
  %dynamic-slice.5484.5.clone.1.start_idx0 = select i1 %47, i32 0, i32 %46
  %48 = load i64, ptr %arg13, align 8, !invariant.load !349
  %constant_5141_2_clone_11 = load i64, ptr @111, align 8
  %49 = icmp slt i64 %48, %constant_5141_2_clone_11
  %50 = zext i1 %49 to i8
  %51 = load i64, ptr %arg13, align 8, !invariant.load !349
  %constant_5140_4_clone_1 = load i64, ptr @112, align 8
  %52 = add i64 %51, %constant_5140_4_clone_1
  %53 = load i64, ptr %arg13, align 8, !invariant.load !349
  %54 = trunc i8 %50 to i1
  %55 = select i1 %54, i64 %52, i64 %53
  %56 = trunc i64 %55 to i32
  %57 = icmp sge i32 0, %56
  %58 = select i1 %57, i32 0, i32 %56
  %59 = icmp sle i32 191, %58
  %dynamic-slice.5484.5.clone.1.start_idx1 = select i1 %59, i32 191, i32 %58
  %constant_5141_2_clone_12 = load i64, ptr @111, align 8
  %60 = trunc i64 %constant_5141_2_clone_12 to i32
  %61 = icmp sge i32 0, %60
  %62 = select i1 %61, i32 0, i32 %60
  %63 = icmp sle i32 0, %62
  %dynamic-slice.5484.5.clone.1.start_idx2 = select i1 %63, i32 0, i32 %62
  %64 = add i32 %dynamic-slice.5484.5.clone.1.start_idx0, %3
  %65 = add i32 %dynamic-slice.5484.5.clone.1.start_idx1, 0
  %66 = add i32 %dynamic-slice.5484.5.clone.1.start_idx2, 0
  %67 = getelementptr inbounds [20 x [192 x [1 x double]]], ptr %arg12, i32 0, i32 %64, i32 %65, i32 0
  %68 = load double, ptr %67, align 8, !invariant.load !349
  %subtract.870.5.clone.1 = fsub double %68, %divide.2543.1.clone.1
  %divide.2547.1.clone.1 = fdiv double %subtract.870.5.clone.1, %multiply.11818.5.clone.1
  %multiply.11823.17 = fmul double %divide.2546.1.clone.1, %divide.2547.1.clone.1
  %add.10006.17 = fadd double %add.10000.19, %multiply.11823.17
  %69 = call double @llvm.fabs.f64(double %add.10006.17)
  %70 = fcmp one double %69, 0x7FF0000000000000
  %71 = zext i1 %70 to i8
  %72 = call double @llvm.fabs.f64(double %add.10006.17)
  %constant_5147_4 = load double, ptr @113, align 8
  %compare.2730.9 = fcmp olt double %72, %constant_5147_4
  %73 = zext i1 %compare.2730.9 to i8
  %74 = and i8 %71, %73
  %75 = getelementptr double, ptr %arg3, i32 %linear_index
  %76 = getelementptr inbounds double, ptr %75, i32 0
  %77 = load double, ptr %76, align 8, !invariant.load !349
  %78 = getelementptr double, ptr %arg0, i32 %linear_index
  %79 = getelementptr inbounds double, ptr %78, i32 0
  %80 = load double, ptr %79, align 8, !invariant.load !349
  %multiply.11824.1 = fmul double %77, %80
  %81 = getelementptr double, ptr %arg2, i32 %linear_index
  %82 = getelementptr inbounds double, ptr %81, i32 0
  %83 = load double, ptr %82, align 8, !invariant.load !349
  %add.10007.1 = fadd double %multiply.11824.1, %83
  %84 = getelementptr double, ptr %arg4, i32 %linear_index
  %85 = getelementptr inbounds double, ptr %84, i32 0
  %86 = load double, ptr %85, align 8, !invariant.load !349
  %multiply.11825.13 = fmul double %34, %divide.2545.1.clone.1
  %multiply.11826.5 = fmul double %86, %multiply.11825.13
  %multiply.11827.1.clone.1 = fmul double %add.10003.5.clone.1, %43
  %divide.2548.3.clone.1 = fdiv double %constant_5138_9, %multiply.11827.1.clone.1
  %subtract.871.2.clone.1 = fsub double %add.10006.17, %add.10000.19
  %multiply.11828.4.clone.1 = fmul double %subtract.871.2.clone.1, %subtract.871.2.clone.1
  %multiply.11829.3.clone.1 = fmul double %divide.2545.1.clone.1, %multiply.11828.4.clone.1
  %add.10008.3.clone.1 = fadd double %divide.2548.3.clone.1, %multiply.11829.3.clone.1
  %constant_5149_1_clone_1 = load double, ptr @114, align 8
  %add.10009.1.clone.1 = fadd double %add.10008.3.clone.1, %constant_5149_1_clone_1
  %multiply.11830.2 = fmul double %multiply.11826.5, %add.10009.1.clone.1
  %87 = getelementptr double, ptr %arg9, i32 %linear_index
  %88 = getelementptr inbounds double, ptr %87, i32 0
  %89 = load double, ptr %88, align 8
  %divide.2549.1.clone.1 = fdiv double %constant_5138_9, %89
  %90 = getelementptr double, ptr %arg10, i32 %linear_index
  %91 = getelementptr inbounds double, ptr %90, i32 0
  %92 = load double, ptr %91, align 8, !invariant.load !349
  %93 = call double @__nv_exp(double %92)
  %compare.2731.9.clone.1 = fcmp ogt double %93, %constant_5143_21
  %94 = zext i1 %compare.2731.9.clone.1 to i8
  %95 = getelementptr double, ptr %arg6, i32 %linear_index
  %96 = getelementptr inbounds double, ptr %95, i32 0
  %97 = load double, ptr %96, align 8, !invariant.load !349
  %98 = trunc i8 %94 to i1
  %99 = select i1 %98, double %93, double %97
  %add.10010.2.clone.1 = fadd double %divide.2549.1.clone.1, %99
  %divide.2550.1.clone.1 = fdiv double %constant_5138_9, %add.10010.2.clone.1
  %constant_5144_2 = load double, ptr @117, align 8
  %multiply.11831.9 = fmul double %divide.2550.1.clone.1, %constant_5144_2
  %divide.2551.5 = fdiv double %constant_5138_9, %multiply.11831.9
  %multiply.11832.1 = fmul double %multiply.11830.2, %divide.2551.5
  %100 = getelementptr i64, ptr %arg1, i32 %linear_index
  %101 = getelementptr inbounds i64, ptr %100, i32 0
  %102 = load i64, ptr %101, align 8, !invariant.load !349
  %103 = sitofp i64 %102 to double
  %multiply.11833.1 = fmul double %multiply.11832.1, %103
  %add.10011.1 = fadd double %add.10007.1, %multiply.11833.1
  %104 = getelementptr double, ptr %arg0, i32 %linear_index
  %105 = getelementptr inbounds double, ptr %104, i32 0
  %106 = load double, ptr %105, align 8, !invariant.load !349
  %107 = trunc i8 %74 to i1
  %108 = select i1 %107, double %add.10011.1, double %106
  %109 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } undef, double %108, 0
  %110 = getelementptr i64, ptr %arg1, i32 %linear_index
  %111 = getelementptr inbounds i64, ptr %110, i32 0
  %112 = load i64, ptr %111, align 8, !invariant.load !349
  %constant_5141_2_clone_13 = load i64, ptr @111, align 8
  %113 = icmp ne i64 %112, %constant_5141_2_clone_13
  %114 = zext i1 %113 to i8
  %115 = zext i8 %114 to i32
  %constant_5139_2_clone_1 = load i32, ptr @116, align 4
  %116 = icmp slt i32 %115, %constant_5139_2_clone_1
  %117 = zext i1 %116 to i8
  %add.10012.2.clone.1 = fadd double %divide.2549.1.clone.1, %93
  %divide.2552.3.clone.1 = fdiv double %constant_5138_9, %add.10012.2.clone.1
  %multiply.11834.23.clone.1 = fmul double %multiply.11826.5, %multiply.11826.5
  %constant_5145_4_clone_1 = load double, ptr @115, align 8
  %multiply.11835.11.clone.1 = fmul double %multiply.11834.23.clone.1, %constant_5145_4_clone_1
  %multiply.11836.11.clone.1 = fmul double %multiply.11834.23.clone.1, %add.10009.1.clone.1
  %add.10013.9.clone.1 = fadd double %multiply.11835.11.clone.1, %multiply.11836.11.clone.1
  %multiply.11837.11.clone.1 = fmul double %86, %86
  %multiply.11838.9.clone.1 = fmul double %multiply.11837.11.clone.1, %constant_5145_4_clone_1
  %multiply.11839.4.clone.1 = fmul double %multiply.11838.9.clone.1, %multiply.11825.13
  %multiply.11840.7.clone.1 = fmul double %multiply.11839.4.clone.1, %add.10009.1.clone.1
  %subtract.872.7.clone.1 = fsub double %add.10013.9.clone.1, %multiply.11840.7.clone.1
  %multiply.11841.5.clone.1 = fmul double %subtract.872.7.clone.1, %103
  %add.10014.3.clone.1 = fadd double %divide.2550.1.clone.1, %multiply.11841.5.clone.1
  %compare.2734.5.clone.1 = fcmp ogt double %add.10014.3.clone.1, %constant_5143_21
  %118 = zext i1 %compare.2734.5.clone.1 to i8
  %119 = getelementptr double, ptr %arg6, i32 %linear_index
  %120 = getelementptr inbounds double, ptr %119, i32 0
  %121 = load double, ptr %120, align 8, !invariant.load !349
  %122 = trunc i8 %118 to i1
  %123 = select i1 %122, double %add.10014.3.clone.1, double %121
  %124 = trunc i8 %117 to i1
  %125 = select i1 %124, double %divide.2552.3.clone.1, double %123
  %126 = getelementptr double, ptr %arg9, i32 %linear_index
  %127 = getelementptr inbounds double, ptr %126, i32 0
  %128 = load double, ptr %127, align 8
  %129 = trunc i8 %74 to i1
  %130 = select i1 %129, double %125, double %128
  %131 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %109, double %130, 1
  %132 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %131, double %divide.2550.1.clone.1, 2
  %133 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %132, double %divide.2549.1.clone.1, 3
  %134 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %133, double %add.10009.1.clone.1, 4
  %135 = getelementptr double, ptr %arg5, i32 %linear_index
  %136 = getelementptr inbounds double, ptr %135, i32 0
  %137 = load double, ptr %136, align 8, !invariant.load !349
  %138 = trunc i8 %74 to i1
  %139 = select i1 %138, double %add.10006.17, double %137
  %140 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %134, double %139, 5
  %141 = getelementptr double, ptr %arg11, i32 %linear_index
  %142 = getelementptr inbounds double, ptr %141, i32 0
  %143 = load double, ptr %142, align 8
  %144 = trunc i8 %74 to i1
  %145 = select i1 %144, double %43, double %143
  %146 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %140, double %145, 6
  %147 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %146, double %divide.2547.1.clone.1, 7
  %148 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %147, double %divide.2546.1.clone.1, 8
  %149 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %148, double %divide.2545.1.clone.1, 9
  %150 = insertvalue { double, double, double, double, double, double, double, double, double, double, double } %149, double %divide.2543.1.clone.1, 10
  %151 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 0
  %152 = getelementptr double, ptr %arg14, i32 %linear_index
  %153 = getelementptr inbounds double, ptr %152, i32 0
  store double %151, ptr %153, align 8
  %154 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 1
  %155 = getelementptr double, ptr %arg9, i32 %linear_index
  %156 = getelementptr inbounds double, ptr %155, i32 0
  store double %154, ptr %156, align 8
  %157 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 2
  %158 = getelementptr double, ptr %arg15, i32 %linear_index
  %159 = getelementptr inbounds double, ptr %158, i32 0
  store double %157, ptr %159, align 8
  %160 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 3
  %161 = getelementptr double, ptr %arg16, i32 %linear_index
  %162 = getelementptr inbounds double, ptr %161, i32 0
  store double %160, ptr %162, align 8
  %163 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 4
  %164 = getelementptr double, ptr %arg17, i32 %linear_index
  %165 = getelementptr inbounds double, ptr %164, i32 0
  store double %163, ptr %165, align 8
  %166 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 5
  %167 = getelementptr double, ptr %arg18, i32 %linear_index
  %168 = getelementptr inbounds double, ptr %167, i32 0
  store double %166, ptr %168, align 8
  %169 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 6
  %170 = getelementptr double, ptr %arg11, i32 %linear_index
  %171 = getelementptr inbounds double, ptr %170, i32 0
  store double %169, ptr %171, align 8
  %172 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 7
  %173 = getelementptr double, ptr %arg19, i32 %linear_index
  %174 = getelementptr inbounds double, ptr %173, i32 0
  store double %172, ptr %174, align 8
  %175 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 8
  %176 = getelementptr double, ptr %arg20, i32 %linear_index
  %177 = getelementptr inbounds double, ptr %176, i32 0
  store double %175, ptr %177, align 8
  %178 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 9
  %179 = getelementptr double, ptr %arg21, i32 %linear_index
  %180 = getelementptr inbounds double, ptr %179, i32 0
  store double %178, ptr %180, align 8
  %181 = extractvalue { double, double, double, double, double, double, double, double, double, double, double } %150, 10
  %182 = getelementptr double, ptr %arg22, i32 %linear_index
  %183 = getelementptr inbounds double, ptr %182, i32 0
  store double %181, ptr %183, align 8
  br label %loop_add_divide_select_fusion.3.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #0

define void @loop_dynamic_update_slice_fusion_165(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(160) %arg10) {
entry:
  %param_5.3535 = load i64, ptr %arg5, align 8, !invariant.load !349
  %constant_5141_17 = load i64, ptr @121, align 8
  %0 = icmp slt i64 %param_5.3535, %constant_5141_17
  %1 = zext i1 %0 to i8
  %param_5.35351 = load i64, ptr %arg5, align 8, !invariant.load !349
  %constant_5140_15 = load i64, ptr @120, align 8
  %2 = add i64 %param_5.35351, %constant_5140_15
  %param_5.35352 = load i64, ptr %arg5, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_5.35352
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_173 = load i64, ptr @121, align 8
  %9 = icmp sge i64 0, %constant_5141_173
  %10 = select i1 %9, i64 0, i64 %constant_5141_173
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5735.1.in_bounds-true, label %dynamic-update-slice.5735.1.in_bounds-after

dynamic-update-slice.5735.1.in_bounds-after:      ; preds = %dynamic-update-slice.5735.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5735.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7546 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75464 = load double, ptr %param_1.7546, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4316 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.43165 = load double, ptr %param_4.4316, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.1684 = getelementptr inbounds double, ptr %24, i64 0
  %param_8.16846 = load double, ptr %param_8.1684, align 8, !invariant.load !349
  %25 = getelementptr double, ptr %arg10, i64 %linear_index
  %param_10.1215 = getelementptr inbounds double, ptr %25, i64 0
  %param_10.12157 = load double, ptr %param_10.1215, align 8, !invariant.load !349
  %26 = getelementptr double, ptr %arg9, i64 %linear_index
  %param_9.1469 = getelementptr inbounds double, ptr %26, i64 0
  %param_9.14698 = load double, ptr %param_9.1469, align 8, !invariant.load !349
  %multiply.11820.17 = fmul double %param_10.12157, %param_9.14698
  %add.10002.15 = fadd double %param_8.16846, %multiply.11820.17
  %27 = call double @__nv_exp(double %add.10002.15)
  %constant_5143_5 = load double, ptr @118, align 8
  %compare.2727.13 = fcmp ogt double %27, %constant_5143_5
  %28 = zext i1 %compare.2727.13 to i8
  %29 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.2195 = getelementptr inbounds double, ptr %29, i64 0
  %param_7.21959 = load double, ptr %param_7.2195, align 8, !invariant.load !349
  %30 = trunc i8 %28 to i1
  %31 = select i1 %30, double %27, double %param_7.21959
  %32 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2867 = getelementptr inbounds double, ptr %32, i64 0
  %param_6.286710 = load double, ptr %param_6.2867, align 8, !invariant.load !349
  %multiply.11825.3 = fmul double %31, %param_6.286710
  %multiply.11826.17 = fmul double %param_4.43165, %multiply.11825.3
  %multiply.11834.27 = fmul double %multiply.11826.17, %multiply.11826.17
  %constant_5145_2 = load double, ptr @119, align 8
  %multiply.11835.13 = fmul double %multiply.11834.27, %constant_5145_2
  %33 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5076 = getelementptr inbounds double, ptr %33, i64 0
  %param_3.507611 = load double, ptr %param_3.5076, align 8, !invariant.load !349
  %multiply.11836.13 = fmul double %multiply.11834.27, %param_3.507611
  %add.10013.11 = fadd double %multiply.11835.13, %multiply.11836.13
  %multiply.11837.13 = fmul double %param_4.43165, %param_4.43165
  %multiply.11838.11 = fmul double %multiply.11837.13, %constant_5145_2
  %multiply.11839.6 = fmul double %multiply.11838.11, %multiply.11825.3
  %34 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.507612 = getelementptr inbounds double, ptr %34, i64 0
  %param_3.507613 = load double, ptr %param_3.507612, align 8, !invariant.load !349
  %multiply.11840.9 = fmul double %multiply.11839.6, %param_3.507613
  %subtract.872.9 = fsub double %add.10013.11, %multiply.11840.9
  %35 = getelementptr i64, ptr %arg2, i64 %linear_index
  %param_2.6240 = getelementptr inbounds i64, ptr %35, i64 0
  %param_2.624014 = load i64, ptr %param_2.6240, align 8, !invariant.load !349
  %36 = sitofp i64 %param_2.624014 to double
  %multiply.11841.7 = fmul double %subtract.872.9, %36
  %add.10014.5 = fadd double %param_1.75464, %multiply.11841.7
  %compare.2734.3 = fcmp ogt double %add.10014.5, %constant_5143_5
  %37 = zext i1 %compare.2734.3 to i8
  %38 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %37, ptr %38, align 1
  br label %dynamic-update-slice.5735.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_163(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %param_1.7500 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_10 = load i64, ptr @124, align 8
  %0 = icmp slt i64 %param_1.7500, %constant_5141_10
  %1 = zext i1 %0 to i8
  %param_1.75001 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_12 = load i64, ptr @123, align 8
  %2 = add i64 %param_1.75001, %constant_5140_12
  %param_1.75002 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75002
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_103 = load i64, ptr @124, align 8
  %9 = icmp sge i64 0, %constant_5141_103
  %10 = select i1 %9, i64 0, i64 %constant_5141_103
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_5141_104 = load i64, ptr @124, align 8
  %13 = icmp sge i64 0, %constant_5141_104
  %14 = select i1 %13, i64 0, i64 %constant_5141_104
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %25, label %dynamic-update-slice.5737.1.in_bounds-true, label %dynamic-update-slice.5737.1.in_bounds-after

dynamic-update-slice.5737.1.in_bounds-after:      ; preds = %dynamic-update-slice.5737.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5737.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3536 = getelementptr inbounds double, ptr %29, i64 0
  %param_5.35365 = load double, ptr %param_5.3536, align 8, !invariant.load !349
  %30 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2868 = getelementptr inbounds double, ptr %30, i64 0
  %param_6.28686 = load double, ptr %param_6.2868, align 8, !invariant.load !349
  %multiply.11817.25 = fmul double %param_5.35365, %param_6.28686
  %31 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4317 = getelementptr inbounds double, ptr %31, i64 0
  %param_4.43177 = load double, ptr %param_4.4317, align 8, !invariant.load !349
  %add.10000.25 = fadd double %multiply.11817.25, %param_4.43177
  %32 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6253 = getelementptr inbounds double, ptr %32, i64 0
  %param_2.62538 = load double, ptr %param_2.6253, align 8, !invariant.load !349
  %33 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5088 = getelementptr inbounds double, ptr %33, i64 0
  %param_3.50889 = load double, ptr %param_3.5088, align 8, !invariant.load !349
  %multiply.11823.23 = fmul double %param_2.62538, %param_3.50889
  %add.10006.23 = fadd double %add.10000.25, %multiply.11823.23
  %34 = call double @llvm.fabs.f64(double %add.10006.23)
  %35 = fcmp one double %34, 0x7FF0000000000000
  %36 = zext i1 %35 to i8
  %37 = call double @llvm.fabs.f64(double %add.10006.23)
  %constant_5147_1 = load double, ptr @122, align 8
  %compare.2730.15 = fcmp olt double %37, %constant_5147_1
  %38 = zext i1 %compare.2730.15 to i8
  %39 = and i8 %36, %38
  %40 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %39, ptr %40, align 1
  br label %dynamic-update-slice.5737.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_164(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %param_1.7503 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_13 = load i64, ptr @127, align 8
  %0 = icmp slt i64 %param_1.7503, %constant_5141_13
  %1 = zext i1 %0 to i8
  %param_1.75031 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_2 = load i64, ptr @126, align 8
  %2 = add i64 %param_1.75031, %constant_5140_2
  %param_1.75032 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75032
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_133 = load i64, ptr @127, align 8
  %9 = icmp sge i64 0, %constant_5141_133
  %10 = select i1 %9, i64 0, i64 %constant_5141_133
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5736.1.in_bounds-true, label %dynamic-update-slice.5736.1.in_bounds-after

dynamic-update-slice.5736.1.in_bounds-after:      ; preds = %dynamic-update-slice.5736.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5736.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3538 = getelementptr inbounds double, ptr %22, i64 0
  %param_5.35384 = load double, ptr %param_5.3538, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2871 = getelementptr inbounds double, ptr %23, i64 0
  %param_6.28715 = load double, ptr %param_6.2871, align 8, !invariant.load !349
  %multiply.11817.23 = fmul double %param_5.35384, %param_6.28715
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4318 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.43186 = load double, ptr %param_4.4318, align 8, !invariant.load !349
  %add.10000.23 = fadd double %multiply.11817.23, %param_4.43186
  %25 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6254 = getelementptr inbounds double, ptr %25, i64 0
  %param_2.62547 = load double, ptr %param_2.6254, align 8, !invariant.load !349
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5089 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.50898 = load double, ptr %param_3.5089, align 8, !invariant.load !349
  %multiply.11823.21 = fmul double %param_2.62547, %param_3.50898
  %add.10006.21 = fadd double %add.10000.23, %multiply.11823.21
  %27 = call double @llvm.fabs.f64(double %add.10006.21)
  %28 = fcmp one double %27, 0x7FF0000000000000
  %29 = zext i1 %28 to i8
  %30 = call double @llvm.fabs.f64(double %add.10006.21)
  %constant_5147_6 = load double, ptr @125, align 8
  %compare.2730.13 = fcmp olt double %30, %constant_5147_6
  %31 = zext i1 %compare.2730.13 to i8
  %32 = and i8 %29, %31
  %33 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %32, ptr %33, align 1
  br label %dynamic-update-slice.5736.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_191(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.4305 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_5141_54 = load i64, ptr @131, align 8
  %0 = icmp slt i64 %param_4.4305, %constant_5141_54
  %1 = zext i1 %0 to i8
  %param_4.43051 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_5140_36 = load i64, ptr @130, align 8
  %2 = add i64 %param_4.43051, %constant_5140_36
  %param_4.43052 = load i64, ptr %arg4, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.43052
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_543 = load i64, ptr @131, align 8
  %9 = icmp sge i64 0, %constant_5141_543
  %10 = select i1 %9, i64 0, i64 %constant_5141_543
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5708.1.in_bounds-true, label %dynamic-update-slice.5708.1.in_bounds-after

dynamic-update-slice.5708.1.in_bounds-after:      ; preds = %dynamic-update-slice.5708.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5708.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7547 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75474 = load double, ptr %param_1.7547, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6241 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.62415 = load double, ptr %param_2.6241, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.62416 = getelementptr inbounds double, ptr %24, i64 0
  %param_2.62417 = load double, ptr %param_2.62416, align 8, !invariant.load !349
  %multiply.11821.8 = fmul double %param_2.62415, %param_2.62417
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5077 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.50778 = load double, ptr %param_3.5077, align 8, !invariant.load !349
  %constant_5138_20 = load double, ptr @129, align 8
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.50779 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.507710 = load double, ptr %param_3.50779, align 8, !invariant.load !349
  %subtract.869.4 = fsub double %constant_5138_20, %param_3.507710
  %multiply.11818.3 = fmul double %param_3.50778, %subtract.869.4
  %multiply.11822.7 = fmul double %multiply.11821.8, %multiply.11818.3
  %add.10004.5 = fadd double %param_1.75474, %multiply.11822.7
  %constant_5143_6 = load double, ptr @128, align 8
  %compare.2728.3 = fcmp ogt double %add.10004.5, %constant_5143_6
  %27 = zext i1 %compare.2728.3 to i8
  %28 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.5708.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_205(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.4308 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_5141_27 = load i64, ptr @135, align 8
  %0 = icmp slt i64 %param_4.4308, %constant_5141_27
  %1 = zext i1 %0 to i8
  %param_4.43081 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_5140_13 = load i64, ptr @134, align 8
  %2 = add i64 %param_4.43081, %constant_5140_13
  %param_4.43082 = load i64, ptr %arg4, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.43082
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_273 = load i64, ptr @135, align 8
  %9 = icmp sge i64 0, %constant_5141_273
  %10 = select i1 %9, i64 0, i64 %constant_5141_273
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5691.1.in_bounds-true, label %dynamic-update-slice.5691.1.in_bounds-after

dynamic-update-slice.5691.1.in_bounds-after:      ; preds = %dynamic-update-slice.5691.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5691.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_14 = load double, ptr @133, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7517 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75174 = load double, ptr %param_1.7517, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5057 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.50575 = load double, ptr %param_3.5057, align 8, !invariant.load !349
  %24 = call double @__nv_exp(double %param_3.50575)
  %constant_5143_11 = load double, ptr @132, align 8
  %compare.2731.5 = fcmp ogt double %24, %constant_5143_11
  %25 = zext i1 %compare.2731.5 to i8
  %26 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6211 = getelementptr inbounds double, ptr %26, i64 0
  %param_2.62116 = load double, ptr %param_2.6211, align 8, !invariant.load !349
  %27 = trunc i8 %25 to i1
  %28 = select i1 %27, double %24, double %param_2.62116
  %add.10010.1 = fadd double %param_1.75174, %28
  %multiply.11843.3 = fmul double %add.10010.1, %add.10010.1
  %divide.2554.3 = fdiv double %constant_5138_14, %multiply.11843.3
  %29 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.2554.3, ptr %29, align 8
  br label %dynamic-update-slice.5691.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_173(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.5071 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5141_52 = load i64, ptr @138, align 8
  %0 = icmp slt i64 %param_3.5071, %constant_5141_52
  %1 = zext i1 %0 to i8
  %param_3.50711 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5140_34 = load i64, ptr @137, align 8
  %2 = add i64 %param_3.50711, %constant_5140_34
  %param_3.50712 = load i64, ptr %arg3, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.50712
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_523 = load i64, ptr @138, align 8
  %9 = icmp sge i64 0, %constant_5141_523
  %10 = select i1 %9, i64 0, i64 %constant_5141_523
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5727.1.in_bounds-true, label %dynamic-update-slice.5727.1.in_bounds-after

dynamic-update-slice.5727.1.in_bounds-after:      ; preds = %dynamic-update-slice.5727.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5727.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_4 = load double, ptr @136, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7542 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75424 = load double, ptr %param_1.7542, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6236 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.62365 = load double, ptr %param_2.6236, align 8, !invariant.load !349
  %24 = call double @__nv_exp(double %param_2.62365)
  %add.10012.1 = fadd double %param_1.75424, %24
  %multiply.11850.3 = fmul double %add.10012.1, %add.10012.1
  %divide.2562.3 = fdiv double %constant_5138_4, %multiply.11850.3
  %25 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.2562.3, ptr %25, align 8
  br label %dynamic-update-slice.5727.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_178(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8) {
entry:
  %param_3.5048 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5141_11 = load i64, ptr @141, align 8
  %0 = icmp slt i64 %param_3.5048, %constant_5141_11
  %1 = zext i1 %0 to i8
  %param_3.50481 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5140_52 = load i64, ptr @140, align 8
  %2 = add i64 %param_3.50481, %constant_5140_52
  %param_3.50482 = load i64, ptr %arg3, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.50482
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_113 = load i64, ptr @141, align 8
  %9 = icmp sge i64 0, %constant_5141_113
  %10 = select i1 %9, i64 0, i64 %constant_5141_113
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5721.1.in_bounds-true, label %dynamic-update-slice.5721.1.in_bounds-after

dynamic-update-slice.5721.1.in_bounds-after:      ; preds = %dynamic-update-slice.5721.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5721.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6195 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.61954 = load double, ptr %param_2.6195, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2859 = getelementptr inbounds double, ptr %23, i64 0
  %param_6.28595 = load double, ptr %param_6.2859, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.1681 = getelementptr inbounds double, ptr %24, i64 0
  %param_8.16816 = load double, ptr %param_8.1681, align 8, !invariant.load !349
  %25 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.2189 = getelementptr inbounds double, ptr %25, i64 0
  %param_7.21897 = load double, ptr %param_7.2189, align 8, !invariant.load !349
  %multiply.11820.19 = fmul double %param_8.16816, %param_7.21897
  %add.10002.17 = fadd double %param_6.28595, %multiply.11820.19
  %26 = call double @__nv_exp(double %add.10002.17)
  %constant_5143_17 = load double, ptr @139, align 8
  %compare.2727.15 = fcmp ogt double %26, %constant_5143_17
  %27 = zext i1 %compare.2727.15 to i8
  %28 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3506 = getelementptr inbounds double, ptr %28, i64 0
  %param_5.35068 = load double, ptr %param_5.3506, align 8, !invariant.load !349
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, double %26, double %param_5.35068
  %31 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4283 = getelementptr inbounds double, ptr %31, i64 0
  %param_4.42839 = load double, ptr %param_4.4283, align 8, !invariant.load !349
  %multiply.11825.5 = fmul double %30, %param_4.42839
  %multiply.11826.13 = fmul double %param_2.61954, %multiply.11825.5
  %32 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7501 = getelementptr inbounds double, ptr %32, i64 0
  %param_1.750110 = load double, ptr %param_1.7501, align 8, !invariant.load !349
  %multiply.11830.1 = fmul double %multiply.11826.13, %param_1.750110
  %33 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11830.1, ptr %33, align 8
  br label %dynamic-update-slice.5721.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_177(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6249 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_34 = load i64, ptr @145, align 8
  %0 = icmp slt i64 %param_2.6249, %constant_5141_34
  %1 = zext i1 %0 to i8
  %param_2.62491 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_53 = load i64, ptr @144, align 8
  %2 = add i64 %param_2.62491, %constant_5140_53
  %param_2.62492 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62492
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_343 = load i64, ptr @145, align 8
  %9 = icmp sge i64 0, %constant_5141_343
  %10 = select i1 %9, i64 0, i64 %constant_5141_343
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5722.1.in_bounds-true, label %dynamic-update-slice.5722.1.in_bounds-after

dynamic-update-slice.5722.1.in_bounds-after:      ; preds = %dynamic-update-slice.5722.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5722.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_19 = load double, ptr @143, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7524 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75244 = load double, ptr %param_1.7524, align 8, !invariant.load !349
  %constant_5144_5 = load double, ptr @142, align 8
  %multiply.11831.3 = fmul double %param_1.75244, %constant_5144_5
  %multiply.11849.3 = fmul double %multiply.11831.3, %multiply.11831.3
  %divide.2560.3 = fdiv double %constant_5138_19, %multiply.11849.3
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.2560.3, ptr %23, align 8
  br label %dynamic-update-slice.5722.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_179(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %param_1.7499 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_9 = load i64, ptr @149, align 8
  %0 = icmp slt i64 %param_1.7499, %constant_5141_9
  %1 = zext i1 %0 to i8
  %param_1.74991 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_51 = load i64, ptr @148, align 8
  %2 = add i64 %param_1.74991, %constant_5140_51
  %param_1.74992 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.74992
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_93 = load i64, ptr @149, align 8
  %9 = icmp sge i64 0, %constant_5141_93
  %10 = select i1 %9, i64 0, i64 %constant_5141_93
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5720.1.in_bounds-true, label %dynamic-update-slice.5720.1.in_bounds-after

dynamic-update-slice.5720.1.in_bounds-after:      ; preds = %dynamic-update-slice.5720.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5720.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_7 = load double, ptr @147, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6193 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.61934 = load double, ptr %param_2.6193, align 8, !invariant.load !349
  %constant_5144_6 = load double, ptr @146, align 8
  %multiply.11831.7 = fmul double %param_2.61934, %constant_5144_6
  %divide.2551.3 = fdiv double %constant_5138_7, %multiply.11831.7
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.2551.3, ptr %23, align 8
  br label %dynamic-update-slice.5720.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_185(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %param_6.2853 = load i64, ptr %arg6, align 8, !invariant.load !349
  %constant_5141_50 = load i64, ptr @151, align 8
  %0 = icmp slt i64 %param_6.2853, %constant_5141_50
  %1 = zext i1 %0 to i8
  %param_6.28531 = load i64, ptr %arg6, align 8, !invariant.load !349
  %constant_5140_45 = load i64, ptr @150, align 8
  %2 = add i64 %param_6.28531, %constant_5140_45
  %param_6.28532 = load i64, ptr %arg6, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_6.28532
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_503 = load i64, ptr @151, align 8
  %9 = icmp sge i64 0, %constant_5141_503
  %10 = select i1 %9, i64 0, i64 %constant_5141_503
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5714.1.in_bounds-true, label %dynamic-update-slice.5714.1.in_bounds-after

dynamic-update-slice.5714.1.in_bounds-after:      ; preds = %dynamic-update-slice.5714.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5714.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4299 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.42994 = load double, ptr %param_4.4299, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3520 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.35205 = load double, ptr %param_5.3520, align 8, !invariant.load !349
  %multiply.11817.5 = fmul double %param_4.42994, %param_5.35205
  %24 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5070 = getelementptr inbounds double, ptr %24, i64 0
  %param_3.50706 = load double, ptr %param_3.5070, align 8, !invariant.load !349
  %add.10000.5 = fadd double %multiply.11817.5, %param_3.50706
  %25 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7540 = getelementptr inbounds double, ptr %25, i64 0
  %param_1.75407 = load double, ptr %param_1.7540, align 8, !invariant.load !349
  %26 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6234 = getelementptr inbounds double, ptr %26, i64 0
  %param_2.62348 = load double, ptr %param_2.6234, align 8, !invariant.load !349
  %multiply.11823.7 = fmul double %param_1.75407, %param_2.62348
  %add.10006.7 = fadd double %add.10000.5, %multiply.11823.7
  %subtract.871.3 = fsub double %add.10006.7, %add.10000.5
  %multiply.11828.1 = fmul double %subtract.871.3, %subtract.871.3
  %27 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11828.1, ptr %27, align 8
  br label %dynamic-update-slice.5714.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_184(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %param_6.2864 = load i64, ptr %arg6, align 8, !invariant.load !349
  %constant_5141_4 = load i64, ptr @154, align 8
  %0 = icmp slt i64 %param_6.2864, %constant_5141_4
  %1 = zext i1 %0 to i8
  %param_6.28641 = load i64, ptr %arg6, align 8, !invariant.load !349
  %constant_5140_46 = load i64, ptr @153, align 8
  %2 = add i64 %param_6.28641, %constant_5140_46
  %param_6.28642 = load i64, ptr %arg6, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_6.28642
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_43 = load i64, ptr @154, align 8
  %9 = icmp sge i64 0, %constant_5141_43
  %10 = select i1 %9, i64 0, i64 %constant_5141_43
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5715.1.in_bounds-true, label %dynamic-update-slice.5715.1.in_bounds-after

dynamic-update-slice.5715.1.in_bounds-after:      ; preds = %dynamic-update-slice.5715.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5715.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4313 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.43134 = load double, ptr %param_4.4313, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3532 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.35325 = load double, ptr %param_5.3532, align 8, !invariant.load !349
  %multiply.11817.9 = fmul double %param_4.43134, %param_5.35325
  %24 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5085 = getelementptr inbounds double, ptr %24, i64 0
  %param_3.50856 = load double, ptr %param_3.5085, align 8, !invariant.load !349
  %add.10000.9 = fadd double %multiply.11817.9, %param_3.50856
  %25 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7551 = getelementptr inbounds double, ptr %25, i64 0
  %param_1.75517 = load double, ptr %param_1.7551, align 8, !invariant.load !349
  %26 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6247 = getelementptr inbounds double, ptr %26, i64 0
  %param_2.62478 = load double, ptr %param_2.6247, align 8, !invariant.load !349
  %multiply.11823.9 = fmul double %param_1.75517, %param_2.62478
  %add.10006.9 = fadd double %add.10000.9, %multiply.11823.9
  %subtract.871.1 = fsub double %add.10006.9, %add.10000.9
  %constant_5144_3 = load double, ptr @152, align 8
  %multiply.11848.3 = fmul double %subtract.871.1, %constant_5144_3
  %27 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11848.3, ptr %27, align 8
  br label %dynamic-update-slice.5715.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_197(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6231 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_47 = load i64, ptr @157, align 8
  %0 = icmp slt i64 %param_2.6231, %constant_5141_47
  %1 = zext i1 %0 to i8
  %param_2.62311 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_23 = load i64, ptr @156, align 8
  %2 = add i64 %param_2.62311, %constant_5140_23
  %param_2.62312 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62312
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_473 = load i64, ptr @157, align 8
  %9 = icmp sge i64 0, %constant_5141_473
  %10 = select i1 %9, i64 0, i64 %constant_5141_473
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5699.1.in_bounds-true, label %dynamic-update-slice.5699.1.in_bounds-after

dynamic-update-slice.5699.1.in_bounds-after:      ; preds = %dynamic-update-slice.5699.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5699.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7537 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75374 = load double, ptr %param_1.7537, align 8, !invariant.load !349
  %constant_5138_23 = load double, ptr @155, align 8
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.75375 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.75376 = load double, ptr %param_1.75375, align 8, !invariant.load !349
  %subtract.869.12 = fsub double %constant_5138_23, %param_1.75376
  %multiply.11818.11 = fmul double %param_1.75374, %subtract.869.12
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11818.11, ptr %24, align 8
  br label %dynamic-update-slice.5699.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_193(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6189 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_5 = load i64, ptr @160, align 8
  %0 = icmp slt i64 %param_2.6189, %constant_5141_5
  %1 = zext i1 %0 to i8
  %param_2.61891 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_29 = load i64, ptr @159, align 8
  %2 = add i64 %param_2.61891, %constant_5140_29
  %param_2.61892 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.61892
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_53 = load i64, ptr @160, align 8
  %9 = icmp sge i64 0, %constant_5141_53
  %10 = select i1 %9, i64 0, i64 %constant_5141_53
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5704.1.in_bounds-true, label %dynamic-update-slice.5704.1.in_bounds-after

dynamic-update-slice.5704.1.in_bounds-after:      ; preds = %dynamic-update-slice.5704.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5704.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_17 = load double, ptr @158, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7496 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.74964 = load double, ptr %param_1.7496, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.74965 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.74966 = load double, ptr %param_1.74965, align 8, !invariant.load !349
  %subtract.869.10 = fsub double %constant_5138_17, %param_1.74966
  %multiply.11818.9 = fmul double %param_1.74964, %subtract.869.10
  %multiply.11846.3 = fmul double %multiply.11818.9, %multiply.11818.9
  %divide.2558.3 = fdiv double %constant_5138_17, %multiply.11846.3
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.2558.3, ptr %24, align 8
  br label %dynamic-update-slice.5704.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_188(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4) {
entry:
  %param_1.7505 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_15 = load i64, ptr @165, align 8
  %0 = icmp slt i64 %param_1.7505, %constant_5141_15
  %1 = zext i1 %0 to i8
  %param_1.75051 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_40 = load i64, ptr @164, align 8
  %2 = add i64 %param_1.75051, %constant_5140_40
  %param_1.75052 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75052
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_153 = load i64, ptr @165, align 8
  %9 = icmp sge i64 0, %constant_5141_153
  %10 = select i1 %9, i64 0, i64 %constant_5141_153
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5711.1.in_bounds-true, label %dynamic-update-slice.5711.1.in_bounds-after

dynamic-update-slice.5711.1.in_bounds-after:      ; preds = %dynamic-update-slice.5711.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5711.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_18 = load double, ptr @162, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6259 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.62594 = load double, ptr %param_2.6259, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4322 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.43225 = load double, ptr %param_4.4322, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.43226 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.43227 = load double, ptr %param_4.43226, align 8, !invariant.load !349
  %multiply.11821.16 = fmul double %param_4.43225, %param_4.43227
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5093 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.50938 = load double, ptr %param_3.5093, align 8, !invariant.load !349
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.50939 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.509310 = load double, ptr %param_3.50939, align 8, !invariant.load !349
  %subtract.869.24 = fsub double %constant_5138_18, %param_3.509310
  %multiply.11818.23 = fmul double %param_3.50938, %subtract.869.24
  %multiply.11822.15 = fmul double %multiply.11821.16, %multiply.11818.23
  %add.10004.13 = fadd double %param_2.62594, %multiply.11822.15
  %constant_5143_16 = load double, ptr @163, align 8
  %compare.2728.13 = fcmp ogt double %add.10004.13, %constant_5143_16
  %27 = zext i1 %compare.2728.13 to i8
  %constant_5151_5 = load double, ptr @161, align 8
  %28 = trunc i8 %27 to i1
  %29 = select i1 %28, double %add.10004.13, double %constant_5151_5
  %multiply.11847.3 = fmul double %29, %29
  %divide.2559.3 = fdiv double %constant_5138_18, %multiply.11847.3
  %30 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.2559.3, ptr %30, align 8
  br label %dynamic-update-slice.5711.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_194(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.5044 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5141_3 = load i64, ptr @166, align 8
  %0 = icmp slt i64 %param_3.5044, %constant_5141_3
  %1 = zext i1 %0 to i8
  %param_3.50441 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5140_28 = load i64, ptr @167, align 8
  %2 = add i64 %param_3.50441, %constant_5140_28
  %param_3.50442 = load i64, ptr %arg3, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.50442
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_33 = load i64, ptr @166, align 8
  %9 = icmp sge i64 0, %constant_5141_33
  %10 = select i1 %9, i64 0, i64 %constant_5141_33
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5703.1.in_bounds-true, label %dynamic-update-slice.5703.1.in_bounds-after

dynamic-update-slice.5703.1.in_bounds-after:      ; preds = %dynamic-update-slice.5703.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5703.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5141_34 = load i64, ptr @166, align 8
  %22 = icmp sge i64 0, %constant_5141_34
  %23 = select i1 %22, i64 0, i64 %constant_5141_34
  %24 = icmp sle i64 0, %23
  %dynamic-slice.5484.3.start_idx0 = select i1 %24, i64 0, i64 %23
  %param_3.50445 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5141_36 = load i64, ptr @166, align 8
  %25 = icmp slt i64 %param_3.50445, %constant_5141_36
  %26 = zext i1 %25 to i8
  %param_3.50447 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5140_288 = load i64, ptr @167, align 8
  %27 = add i64 %param_3.50447, %constant_5140_288
  %param_3.50449 = load i64, ptr %arg3, align 8, !invariant.load !349
  %28 = trunc i8 %26 to i1
  %29 = select i1 %28, i64 %27, i64 %param_3.50449
  %30 = icmp sge i64 0, %29
  %31 = select i1 %30, i64 0, i64 %29
  %32 = icmp sle i64 191, %31
  %dynamic-slice.5484.3.start_idx1 = select i1 %32, i64 191, i64 %31
  %constant_5141_310 = load i64, ptr @166, align 8
  %33 = icmp sge i64 0, %constant_5141_310
  %34 = select i1 %33, i64 0, i64 %constant_5141_310
  %35 = icmp sle i64 0, %34
  %dynamic-slice.5484.3.start_idx2 = select i1 %35, i64 0, i64 %34
  %36 = add i64 %dynamic-slice.5484.3.start_idx0, %17
  %37 = add i64 %dynamic-slice.5484.3.start_idx1, 0
  %38 = add i64 %dynamic-slice.5484.3.start_idx2, 0
  %param_2.6187 = getelementptr inbounds [20 x [192 x [1 x double]]], ptr %arg2, i64 0, i64 %36, i64 %37, i64 0
  %param_2.618711 = load double, ptr %param_2.6187, align 8, !invariant.load !349
  %39 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7494 = getelementptr inbounds double, ptr %39, i64 0
  %param_1.749412 = load double, ptr %param_1.7494, align 8, !invariant.load !349
  %subtract.870.3 = fsub double %param_2.618711, %param_1.749412
  %40 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %subtract.870.3, ptr %40, align 8
  br label %dynamic-update-slice.5703.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_196(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.6233 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_49 = load i64, ptr @170, align 8
  %0 = icmp slt i64 %param_2.6233, %constant_5141_49
  %1 = zext i1 %0 to i8
  %param_2.62331 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_24 = load i64, ptr @169, align 8
  %2 = add i64 %param_2.62331, %constant_5140_24
  %param_2.62332 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62332
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_493 = load i64, ptr @170, align 8
  %9 = icmp sge i64 0, %constant_5141_493
  %10 = select i1 %9, i64 0, i64 %constant_5141_493
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5700.1.in_bounds-true, label %dynamic-update-slice.5700.1.in_bounds-after

dynamic-update-slice.5700.1.in_bounds-after:      ; preds = %dynamic-update-slice.5700.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5700.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_5138_2 = load double, ptr @168, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7539 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75394 = load double, ptr %param_1.7539, align 8, !invariant.load !349
  %subtract.869.1 = fsub double %constant_5138_2, %param_1.75394
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %subtract.869.1, ptr %23, align 8
  br label %dynamic-update-slice.5700.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_189(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.5056 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5141_26 = load i64, ptr @173, align 8
  %0 = icmp slt i64 %param_3.5056, %constant_5141_26
  %1 = zext i1 %0 to i8
  %param_3.50561 = load i64, ptr %arg3, align 8, !invariant.load !349
  %constant_5140_39 = load i64, ptr @172, align 8
  %2 = add i64 %param_3.50561, %constant_5140_39
  %param_3.50562 = load i64, ptr %arg3, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.50562
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_263 = load i64, ptr @173, align 8
  %9 = icmp sge i64 0, %constant_5141_263
  %10 = select i1 %9, i64 0, i64 %constant_5141_263
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5710.1.in_bounds-true, label %dynamic-update-slice.5710.1.in_bounds-after

dynamic-update-slice.5710.1.in_bounds-after:      ; preds = %dynamic-update-slice.5710.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5710.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7516 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75164 = load double, ptr %param_1.7516, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6210 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.62105 = load double, ptr %param_2.6210, align 8, !invariant.load !349
  %constant_5138_24 = load double, ptr @171, align 8
  %24 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.62106 = getelementptr inbounds double, ptr %24, i64 0
  %param_2.62107 = load double, ptr %param_2.62106, align 8, !invariant.load !349
  %subtract.869.14 = fsub double %constant_5138_24, %param_2.62107
  %multiply.11818.13 = fmul double %param_2.62105, %subtract.869.14
  %multiply.11819.3 = fmul double %param_1.75164, %multiply.11818.13
  %25 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11819.3, ptr %25, align 8
  br label %dynamic-update-slice.5710.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_190(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4) {
entry:
  %param_1.7521 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_31 = load i64, ptr @178, align 8
  %0 = icmp slt i64 %param_1.7521, %constant_5141_31
  %1 = zext i1 %0 to i8
  %param_1.75211 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_38 = load i64, ptr @177, align 8
  %2 = add i64 %param_1.75211, %constant_5140_38
  %param_1.75212 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75212
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_313 = load i64, ptr @178, align 8
  %9 = icmp sge i64 0, %constant_5141_313
  %10 = select i1 %9, i64 0, i64 %constant_5141_313
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5709.1.in_bounds-true, label %dynamic-update-slice.5709.1.in_bounds-after

dynamic-update-slice.5709.1.in_bounds-after:      ; preds = %dynamic-update-slice.5709.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5709.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6256 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.62564 = load double, ptr %param_2.6256, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4320 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.43205 = load double, ptr %param_4.4320, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.43206 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.43207 = load double, ptr %param_4.43206, align 8, !invariant.load !349
  %multiply.11821.18 = fmul double %param_4.43205, %param_4.43207
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5091 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.50918 = load double, ptr %param_3.5091, align 8, !invariant.load !349
  %constant_5138_5 = load double, ptr @175, align 8
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.50919 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.509110 = load double, ptr %param_3.50919, align 8, !invariant.load !349
  %subtract.869.26 = fsub double %constant_5138_5, %param_3.509110
  %multiply.11818.25 = fmul double %param_3.50918, %subtract.869.26
  %multiply.11822.17 = fmul double %multiply.11821.18, %multiply.11818.25
  %add.10004.15 = fadd double %param_2.62564, %multiply.11822.17
  %constant_5143_3 = load double, ptr @176, align 8
  %compare.2728.15 = fcmp ogt double %add.10004.15, %constant_5143_3
  %27 = zext i1 %compare.2728.15 to i8
  %constant_5151_1 = load double, ptr @174, align 8
  %28 = trunc i8 %27 to i1
  %29 = select i1 %28, double %add.10004.15, double %constant_5151_1
  %30 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %29, ptr %30, align 8
  br label %dynamic-update-slice.5709.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_183(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %param_1.7511 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5141_21 = load i64, ptr @181, align 8
  %0 = icmp slt i64 %param_1.7511, %constant_5141_21
  %1 = zext i1 %0 to i8
  %param_1.75111 = load i64, ptr %arg1, align 8, !invariant.load !349
  %constant_5140_47 = load i64, ptr @180, align 8
  %2 = add i64 %param_1.75111, %constant_5140_47
  %param_1.75112 = load i64, ptr %arg1, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.75112
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_213 = load i64, ptr @181, align 8
  %9 = icmp sge i64 0, %constant_5141_213
  %10 = select i1 %9, i64 0, i64 %constant_5141_213
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5716.1.in_bounds-true, label %dynamic-update-slice.5716.1.in_bounds-after

dynamic-update-slice.5716.1.in_bounds-after:      ; preds = %dynamic-update-slice.5716.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5716.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4311 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.43114 = load double, ptr %param_4.4311, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2860 = getelementptr inbounds double, ptr %23, i64 0
  %param_6.28605 = load double, ptr %param_6.2860, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3530 = getelementptr inbounds double, ptr %24, i64 0
  %param_5.35306 = load double, ptr %param_5.3530, align 8, !invariant.load !349
  %multiply.11820.21 = fmul double %param_6.28605, %param_5.35306
  %add.10002.19 = fadd double %param_4.43114, %multiply.11820.21
  %25 = call double @__nv_exp(double %add.10002.19)
  %constant_5143_18 = load double, ptr @179, align 8
  %compare.2727.17 = fcmp ogt double %25, %constant_5143_18
  %26 = zext i1 %compare.2727.17 to i8
  %27 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5053 = getelementptr inbounds double, ptr %27, i64 0
  %param_3.50537 = load double, ptr %param_3.5053, align 8, !invariant.load !349
  %28 = trunc i8 %26 to i1
  %29 = select i1 %28, double %25, double %param_3.50537
  %30 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6205 = getelementptr inbounds double, ptr %30, i64 0
  %param_2.62058 = load double, ptr %param_2.6205, align 8, !invariant.load !349
  %multiply.11825.7 = fmul double %29, %param_2.62058
  %31 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11825.7, ptr %31, align 8
  br label %dynamic-update-slice.5716.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_169(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7) {
entry:
  %param_2.6220 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_36 = load i64, ptr @184, align 8
  %0 = icmp slt i64 %param_2.6220, %constant_5141_36
  %1 = zext i1 %0 to i8
  %param_2.62201 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_32 = load i64, ptr @183, align 8
  %2 = add i64 %param_2.62201, %constant_5140_32
  %param_2.62202 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62202
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_363 = load i64, ptr @184, align 8
  %9 = icmp sge i64 0, %constant_5141_363
  %10 = select i1 %9, i64 0, i64 %constant_5141_363
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5731.1.in_bounds-true, label %dynamic-update-slice.5731.1.in_bounds-after

dynamic-update-slice.5731.1.in_bounds-after:      ; preds = %dynamic-update-slice.5731.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5731.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7526 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75264 = load double, ptr %param_1.7526, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3531 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.35315 = load double, ptr %param_5.3531, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.2191 = getelementptr inbounds double, ptr %24, i64 0
  %param_7.21916 = load double, ptr %param_7.2191, align 8, !invariant.load !349
  %25 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2862 = getelementptr inbounds double, ptr %25, i64 0
  %param_6.28627 = load double, ptr %param_6.2862, align 8, !invariant.load !349
  %multiply.11820.25 = fmul double %param_7.21916, %param_6.28627
  %add.10002.23 = fadd double %param_5.35315, %multiply.11820.25
  %26 = call double @__nv_exp(double %add.10002.23)
  %constant_5143_20 = load double, ptr @182, align 8
  %compare.2727.21 = fcmp ogt double %26, %constant_5143_20
  %27 = zext i1 %compare.2727.21 to i8
  %28 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4293 = getelementptr inbounds double, ptr %28, i64 0
  %param_4.42938 = load double, ptr %param_4.4293, align 8, !invariant.load !349
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, double %26, double %param_4.42938
  %31 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5063 = getelementptr inbounds double, ptr %31, i64 0
  %param_3.50639 = load double, ptr %param_3.5063, align 8, !invariant.load !349
  %multiply.11825.11 = fmul double %30, %param_3.50639
  %multiply.11826.3 = fmul double %param_1.75264, %multiply.11825.11
  %multiply.11834.3 = fmul double %multiply.11826.3, %multiply.11826.3
  %32 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11834.3, ptr %32, align 8
  br label %dynamic-update-slice.5731.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_166(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7) {
entry:
  %param_2.6250 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_25 = load i64, ptr @188, align 8
  %0 = icmp slt i64 %param_2.6250, %constant_5141_25
  %1 = zext i1 %0 to i8
  %param_2.62501 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_21 = load i64, ptr @187, align 8
  %2 = add i64 %param_2.62501, %constant_5140_21
  %param_2.62502 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62502
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_253 = load i64, ptr @188, align 8
  %9 = icmp sge i64 0, %constant_5141_253
  %10 = select i1 %9, i64 0, i64 %constant_5141_253
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5734.1.in_bounds-true, label %dynamic-update-slice.5734.1.in_bounds-after

dynamic-update-slice.5734.1.in_bounds-after:      ; preds = %dynamic-update-slice.5734.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5734.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7553 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75534 = load double, ptr %param_1.7553, align 8, !invariant.load !349
  %multiply.11837.9 = fmul double %param_1.75534, %param_1.75534
  %constant_5145_1 = load double, ptr @186, align 8
  %multiply.11838.7 = fmul double %multiply.11837.9, %constant_5145_1
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3534 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.35345 = load double, ptr %param_5.3534, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.2194 = getelementptr inbounds double, ptr %24, i64 0
  %param_7.21946 = load double, ptr %param_7.2194, align 8, !invariant.load !349
  %25 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2866 = getelementptr inbounds double, ptr %25, i64 0
  %param_6.28667 = load double, ptr %param_6.2866, align 8, !invariant.load !349
  %multiply.11820.23 = fmul double %param_7.21946, %param_6.28667
  %add.10002.21 = fadd double %param_5.35345, %multiply.11820.23
  %26 = call double @__nv_exp(double %add.10002.21)
  %constant_5143_19 = load double, ptr @185, align 8
  %compare.2727.19 = fcmp ogt double %26, %constant_5143_19
  %27 = zext i1 %compare.2727.19 to i8
  %28 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4315 = getelementptr inbounds double, ptr %28, i64 0
  %param_4.43158 = load double, ptr %param_4.4315, align 8, !invariant.load !349
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, double %26, double %param_4.43158
  %31 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5087 = getelementptr inbounds double, ptr %31, i64 0
  %param_3.50879 = load double, ptr %param_3.5087, align 8, !invariant.load !349
  %multiply.11825.9 = fmul double %30, %param_3.50879
  %multiply.11839.1 = fmul double %multiply.11838.7, %multiply.11825.9
  %32 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11839.1, ptr %32, align 8
  br label %dynamic-update-slice.5734.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_170(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7) {
entry:
  %param_2.6248 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_48 = load i64, ptr @192, align 8
  %0 = icmp slt i64 %param_2.6248, %constant_5141_48
  %1 = zext i1 %0 to i8
  %param_2.62481 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_35 = load i64, ptr @191, align 8
  %2 = add i64 %param_2.62481, %constant_5140_35
  %param_2.62482 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62482
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_483 = load i64, ptr @192, align 8
  %9 = icmp sge i64 0, %constant_5141_483
  %10 = select i1 %9, i64 0, i64 %constant_5141_483
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5730.1.in_bounds-true, label %dynamic-update-slice.5730.1.in_bounds-after

dynamic-update-slice.5730.1.in_bounds-after:      ; preds = %dynamic-update-slice.5730.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5730.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7552 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75524 = load double, ptr %param_1.7552, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3533 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.35335 = load double, ptr %param_5.3533, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.2193 = getelementptr inbounds double, ptr %24, i64 0
  %param_7.21936 = load double, ptr %param_7.2193, align 8, !invariant.load !349
  %25 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2865 = getelementptr inbounds double, ptr %25, i64 0
  %param_6.28657 = load double, ptr %param_6.2865, align 8, !invariant.load !349
  %multiply.11820.29 = fmul double %param_7.21936, %param_6.28657
  %add.10002.27 = fadd double %param_5.35335, %multiply.11820.29
  %26 = call double @__nv_exp(double %add.10002.27)
  %constant_5143_22 = load double, ptr @190, align 8
  %compare.2727.25 = fcmp ogt double %26, %constant_5143_22
  %27 = zext i1 %compare.2727.25 to i8
  %28 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4314 = getelementptr inbounds double, ptr %28, i64 0
  %param_4.43148 = load double, ptr %param_4.4314, align 8, !invariant.load !349
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, double %26, double %param_4.43148
  %31 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5086 = getelementptr inbounds double, ptr %31, i64 0
  %param_3.50869 = load double, ptr %param_3.5086, align 8, !invariant.load !349
  %multiply.11825.15 = fmul double %30, %param_3.50869
  %multiply.11826.7 = fmul double %param_1.75524, %multiply.11825.15
  %constant_5144_4 = load double, ptr @189, align 8
  %multiply.11851.3 = fmul double %multiply.11826.7, %constant_5144_4
  %32 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11851.3, ptr %32, align 8
  br label %dynamic-update-slice.5730.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_180(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7) {
entry:
  %param_2.6230 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5141_46 = load i64, ptr @195, align 8
  %0 = icmp slt i64 %param_2.6230, %constant_5141_46
  %1 = zext i1 %0 to i8
  %param_2.62301 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_5140_50 = load i64, ptr @194, align 8
  %2 = add i64 %param_2.62301, %constant_5140_50
  %param_2.62302 = load i64, ptr %arg2, align 8, !invariant.load !349
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.62302
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_5141_463 = load i64, ptr @195, align 8
  %9 = icmp sge i64 0, %constant_5141_463
  %10 = select i1 %9, i64 0, i64 %constant_5141_463
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
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
  br i1 %19, label %dynamic-update-slice.5719.1.in_bounds-true, label %dynamic-update-slice.5719.1.in_bounds-after

dynamic-update-slice.5719.1.in_bounds-after:      ; preds = %dynamic-update-slice.5719.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5719.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7536 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.75364 = load double, ptr %param_1.7536, align 8, !invariant.load !349
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.3526 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.35265 = load double, ptr %param_5.3526, align 8, !invariant.load !349
  %24 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.2187 = getelementptr inbounds double, ptr %24, i64 0
  %param_7.21876 = load double, ptr %param_7.2187, align 8, !invariant.load !349
  %25 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.2856 = getelementptr inbounds double, ptr %25, i64 0
  %param_6.28567 = load double, ptr %param_6.2856, align 8, !invariant.load !349
  %multiply.11820.31 = fmul double %param_7.21876, %param_6.28567
  %add.10002.29 = fadd double %param_5.35265, %multiply.11820.31
  %26 = call double @__nv_exp(double %add.10002.29)
  %constant_5143_8 = load double, ptr @193, align 8
  %compare.2727.27 = fcmp ogt double %26, %constant_5143_8
  %27 = zext i1 %compare.2727.27 to i8
  %28 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.4297 = getelementptr inbounds double, ptr %28, i64 0
  %param_4.42978 = load double, ptr %param_4.4297, align 8, !invariant.load !349
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, double %26, double %param_4.42978
  %31 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5068 = getelementptr inbounds double, ptr %31, i64 0
  %param_3.50689 = load double, ptr %param_3.5068, align 8, !invariant.load !349
  %multiply.11825.17 = fmul double %30, %param_3.50689
  %multiply.11826.9 = fmul double %param_1.75364, %multiply.11825.17
  %32 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.11826.9, ptr %32, align 8
  br label %dynamic-update-slice.5719.1.in_bounds-after
}

define void @loop_add_reduce_fusion_3(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3, ptr noalias align 128 dereferenceable(30720) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(8) %arg7, ptr noalias align 128 dereferenceable(30720) %arg8, ptr noalias align 128 dereferenceable(30720) %arg9) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer9 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %pad_result_addr = alloca double, align 8
  %reduce.402.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !355
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !356
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_add_reduce_fusion.3.in_bounds-true, label %loop_add_reduce_fusion.3.in_bounds-after

loop_add_reduce_fusion.3.in_bounds-after:         ; preds = %reduce.402.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_add_reduce_fusion.3.in_bounds-true:          ; preds = %entry
  %constant_2512_1 = load double, ptr @199, align 8
  store double %constant_2512_1, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.402.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.402.1.inner.loop_header.reduction_dim.0

reduce.402.1.inner.loop_header.reduction_dim.0:   ; preds = %in_bounds-after, %loop_add_reduce_fusion.3.in_bounds-true
  %reduce.402.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.402.1.inner.invar_address.reduction_dim.0, align 4
  %7 = icmp uge i32 %reduce.402.1.inner.indvar.reduction_dim.0, 2
  br i1 %7, label %reduce.402.1.inner.loop_exit.reduction_dim.0, label %reduce.402.1.inner.loop_body.reduction_dim.0

reduce.402.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.402.1.inner.loop_header.reduction_dim.0
  %8 = load double, ptr %accumulator_0, align 8
  %9 = sub i32 %reduce.402.1.inner.indvar.reduction_dim.0, 1
  %10 = icmp sge i32 %9, 0
  %in_bounds = and i1 true, %10
  %11 = urem i32 %9, 1
  %12 = icmp eq i32 0, %11
  %in_bounds1 = and i1 %in_bounds, %12
  %13 = sdiv i32 %9, 1
  %14 = icmp slt i32 %13, 1
  %in_bounds2 = and i1 %in_bounds1, %14
  %15 = sub i32 %5, 0
  %16 = icmp sge i32 %15, 0
  %in_bounds3 = and i1 %in_bounds2, %16
  %17 = urem i32 %15, 1
  %18 = icmp eq i32 0, %17
  %in_bounds4 = and i1 %in_bounds3, %18
  %19 = sdiv i32 %15, 1
  %20 = icmp slt i32 %19, 192
  %in_bounds5 = and i1 %in_bounds4, %20
  %21 = sub i32 %4, 0
  %22 = icmp sge i32 %21, 0
  %in_bounds6 = and i1 %in_bounds5, %22
  %23 = urem i32 %21, 1
  %24 = icmp eq i32 0, %23
  %in_bounds7 = and i1 %in_bounds6, %24
  %25 = sdiv i32 %21, 1
  %26 = icmp slt i32 %25, 20
  %in_bounds8 = and i1 %in_bounds7, %26
  br i1 %in_bounds8, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %27 = load double, ptr %pad_result_addr, align 8
  store double %8, ptr %parameter_buffer, align 8
  store double %27, ptr %parameter_buffer9, align 8
  call void @region_26_5046_5601069b0470_33d48f6bb7324218(ptr %parameter_buffer, ptr %parameter_buffer9, ptr %return_buffer)
  %28 = load double, ptr %return_buffer, align 8
  store double %28, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.402.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.402.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.402.1.inner.loop_header.reduction_dim.0

reduce.402.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.402.1.inner.loop_header.reduction_dim.0
  %29 = load double, ptr %accumulator_0, align 8
  %30 = insertvalue { double, double } undef, double %29, 0
  %31 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %4
  %32 = load double, ptr %31, align 8, !invariant.load !349
  %33 = load double, ptr %arg7, align 8, !invariant.load !349
  %34 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %4
  %35 = load double, ptr %34, align 8, !invariant.load !349
  %multiply.11866.5.clone.110 = fmul double %33, %35
  %add.10019.5.clone.111 = fadd double %32, %multiply.11866.5.clone.110
  %36 = call double @__nv_exp(double %add.10019.5.clone.111)
  %constant_2470_9_clone_112 = load double, ptr @196, align 8
  %constant_2506_2_clone_113 = load double, ptr @198, align 8
  %37 = getelementptr double, ptr %arg4, i32 %linear_index
  %38 = getelementptr inbounds double, ptr %37, i32 0
  %39 = load double, ptr %38, align 8, !invariant.load !349
  %constant_2505_2_clone_114 = load double, ptr @197, align 8
  %40 = fcmp une double %constant_2506_2_clone_113, %constant_2506_2_clone_113
  %41 = fcmp oeq double %39, %39
  %42 = fcmp oge double %constant_2506_2_clone_113, %39
  %43 = and i1 %41, %42
  %44 = or i1 %40, %43
  %45 = select i1 %44, double %constant_2506_2_clone_113, double %39
  %46 = fcmp une double %constant_2505_2_clone_114, %constant_2505_2_clone_114
  %47 = fcmp oeq double %45, %45
  %48 = fcmp ole double %constant_2505_2_clone_114, %45
  %49 = and i1 %47, %48
  %50 = or i1 %46, %49
  %51 = select i1 %50, double %constant_2505_2_clone_114, double %45
  %52 = fneg double %51
  %53 = call double @__nv_exp(double %52)
  %add.10024.5.clone.115 = fadd double %53, %constant_2470_9_clone_112
  %divide.2563.5.clone.116 = fdiv double %constant_2470_9_clone_112, %add.10024.5.clone.115
  %subtract.873.3.clone.117 = fsub double %constant_2470_9_clone_112, %divide.2563.5.clone.116
  %54 = getelementptr double, ptr %arg3, i32 %linear_index
  %55 = getelementptr inbounds double, ptr %54, i32 0
  %56 = load double, ptr %55, align 8, !invariant.load !349
  %multiply.11871.1.clone.118 = fmul double %subtract.873.3.clone.117, %56
  %57 = getelementptr double, ptr %arg2, i32 %linear_index
  %58 = getelementptr inbounds double, ptr %57, i32 0
  %59 = load double, ptr %58, align 8, !invariant.load !349
  %multiply.11872.1.clone.119 = fmul double %divide.2563.5.clone.116, %59
  %subtract.874.2.clone.120 = fsub double %multiply.11871.1.clone.118, %multiply.11872.1.clone.119
  %multiply.11873.3.clone.121 = fmul double %36, %subtract.874.2.clone.120
  %60 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %4
  %61 = load double, ptr %60, align 8, !invariant.load !349
  %62 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %4
  %63 = load double, ptr %62, align 8, !invariant.load !349
  %multiply.11874.5.clone.122 = fmul double %33, %63
  %add.10025.5.clone.123 = fadd double %61, %multiply.11874.5.clone.122
  %add.10026.1.clone.124 = fadd double %multiply.11873.3.clone.121, %add.10025.5.clone.123
  %64 = insertvalue { double, double } %30, double %add.10026.1.clone.124, 1
  %65 = extractvalue { double, double } %64, 0
  %66 = getelementptr double, ptr %arg8, i32 %linear_index
  %67 = getelementptr inbounds double, ptr %66, i32 0
  store double %65, ptr %67, align 8
  %68 = extractvalue { double, double } %64, 1
  %69 = getelementptr double, ptr %arg9, i32 %linear_index
  %70 = getelementptr inbounds double, ptr %69, i32 0
  store double %68, ptr %70, align 8
  br label %loop_add_reduce_fusion.3.in_bounds-after

in_bounds-true:                                   ; preds = %reduce.402.1.inner.loop_body.reduction_dim.0
  %71 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %25
  %72 = load double, ptr %71, align 8, !invariant.load !349
  %73 = load double, ptr %arg7, align 8, !invariant.load !349
  %74 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %25
  %75 = load double, ptr %74, align 8, !invariant.load !349
  %multiply.11866.5.clone.1 = fmul double %73, %75
  %add.10019.5.clone.1 = fadd double %72, %multiply.11866.5.clone.1
  %76 = call double @__nv_exp(double %add.10019.5.clone.1)
  %constant_2470_9_clone_1 = load double, ptr @196, align 8
  %constant_2506_2_clone_1 = load double, ptr @198, align 8
  %77 = getelementptr inbounds [192 x [20 x double]], ptr %arg4, i32 0, i32 %19, i32 %25
  %78 = load double, ptr %77, align 8, !invariant.load !349
  %constant_2505_2_clone_1 = load double, ptr @197, align 8
  %79 = fcmp une double %constant_2506_2_clone_1, %constant_2506_2_clone_1
  %80 = fcmp oeq double %78, %78
  %81 = fcmp oge double %constant_2506_2_clone_1, %78
  %82 = and i1 %80, %81
  %83 = or i1 %79, %82
  %84 = select i1 %83, double %constant_2506_2_clone_1, double %78
  %85 = fcmp une double %constant_2505_2_clone_1, %constant_2505_2_clone_1
  %86 = fcmp oeq double %84, %84
  %87 = fcmp ole double %constant_2505_2_clone_1, %84
  %88 = and i1 %86, %87
  %89 = or i1 %85, %88
  %90 = select i1 %89, double %constant_2505_2_clone_1, double %84
  %91 = fneg double %90
  %92 = call double @__nv_exp(double %91)
  %add.10024.5.clone.1 = fadd double %92, %constant_2470_9_clone_1
  %divide.2563.5.clone.1 = fdiv double %constant_2470_9_clone_1, %add.10024.5.clone.1
  %subtract.873.3.clone.1 = fsub double %constant_2470_9_clone_1, %divide.2563.5.clone.1
  %93 = getelementptr inbounds [192 x [20 x double]], ptr %arg3, i32 0, i32 %19, i32 %25
  %94 = load double, ptr %93, align 8, !invariant.load !349
  %multiply.11871.1.clone.1 = fmul double %subtract.873.3.clone.1, %94
  %95 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %19, i32 %25
  %96 = load double, ptr %95, align 8, !invariant.load !349
  %multiply.11872.1.clone.1 = fmul double %divide.2563.5.clone.1, %96
  %subtract.874.2.clone.1 = fsub double %multiply.11871.1.clone.1, %multiply.11872.1.clone.1
  %multiply.11873.3.clone.1 = fmul double %76, %subtract.874.2.clone.1
  %97 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %25
  %98 = load double, ptr %97, align 8, !invariant.load !349
  %99 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %25
  %100 = load double, ptr %99, align 8, !invariant.load !349
  %multiply.11874.5.clone.1 = fmul double %73, %100
  %add.10025.5.clone.1 = fadd double %98, %multiply.11874.5.clone.1
  %add.10026.1.clone.1 = fadd double %multiply.11873.3.clone.1, %add.10025.5.clone.1
  store double %add.10026.1.clone.1, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %reduce.402.1.inner.loop_body.reduction_dim.0
  %constant_2461_27 = load double, ptr @200, align 8
  store double %constant_2461_27, ptr %pad_result_addr, align 8
  br label %in_bounds-after
}

define internal void @region_26_5046_5601069b0470_33d48f6bb7324218(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.5047 = load double, ptr %0, align 8
  %Arg_1.5048 = load double, ptr %1, align 8
  %3 = fcmp une double %Arg_0.5047, %Arg_0.5047
  %4 = fcmp oeq double %Arg_1.5048, %Arg_1.5048
  %5 = fcmp oge double %Arg_0.5047, %Arg_1.5048
  %6 = and i1 %4, %5
  %7 = or i1 %3, %6
  %maximum.59 = select i1 %7, double %Arg_0.5047, double %Arg_1.5048
  store double %maximum.59, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

define void @input_concatenate_fusion_3(ptr noalias align 128 dereferenceable(15360) %arg0, ptr noalias align 128 dereferenceable(46080) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !355
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !356
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index0, 1
  %8 = urem i32 %7, 192
  %9 = udiv i32 %linear_index0, 192
  %10 = icmp ult i32 %linear_index, 3840
  br i1 %10, label %input_concatenate_fusion.3.in_bounds-true, label %input_concatenate_fusion.3.in_bounds-after

input_concatenate_fusion.3.in_bounds-after:       ; preds = %input_concatenate_fusion.3.in_bounds-true, %entry
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !355
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !356
  %13 = mul nuw nsw i32 %11, 128
  %linear_index1 = add nuw nsw i32 %13, %12
  %linear_index_in_range2 = icmp ult i32 %linear_index1, 3840
  call void @llvm.assume(i1 %linear_index_in_range2)
  %linear_index03 = add nuw nsw i32 %linear_index1, 0
  %14 = udiv i32 %linear_index03, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %linear_index03, 1
  %17 = urem i32 %16, 1
  %18 = udiv i32 %linear_index03, 1
  %19 = urem i32 %18, 192
  %20 = udiv i32 %linear_index03, 192
  %21 = icmp ult i32 %linear_index1, 3840
  br i1 %21, label %input_concatenate_fusion.3.in_bounds-true4, label %input_concatenate_fusion.3.in_bounds-after5

input_concatenate_fusion.3.in_bounds-after5:      ; preds = %input_concatenate_fusion.3.in_bounds-true4, %input_concatenate_fusion.3.in_bounds-after
  %22 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !355
  %23 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !356
  %24 = mul nuw nsw i32 %22, 128
  %linear_index6 = add nuw nsw i32 %24, %23
  %linear_index_in_range7 = icmp ult i32 %linear_index6, 3840
  call void @llvm.assume(i1 %linear_index_in_range7)
  %linear_index08 = add nuw nsw i32 %linear_index6, 0
  %25 = udiv i32 %linear_index08, 1
  %26 = urem i32 %25, 1
  %27 = udiv i32 %linear_index08, 1
  %28 = urem i32 %27, 1
  %29 = udiv i32 %linear_index08, 1
  %30 = urem i32 %29, 192
  %31 = udiv i32 %linear_index08, 192
  %32 = icmp ult i32 %linear_index6, 3840
  br i1 %32, label %input_concatenate_fusion.3.in_bounds-true9, label %input_concatenate_fusion.3.in_bounds-after10

input_concatenate_fusion.3.in_bounds-after10:     ; preds = %input_concatenate_fusion.3.in_bounds-true9, %input_concatenate_fusion.3.in_bounds-after5
  ret void

input_concatenate_fusion.3.in_bounds-true:        ; preds = %entry
  %33 = add i32 %4, 0
  %34 = mul nuw nsw i32 %9, 1
  %35 = add nuw nsw i32 0, %34
  %36 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %9, i32 %8, i32 0, i32 %33
  store i32 %35, ptr %36, align 4
  br label %input_concatenate_fusion.3.in_bounds-after

input_concatenate_fusion.3.in_bounds-true4:       ; preds = %input_concatenate_fusion.3.in_bounds-after
  %37 = add i32 %15, 1
  %38 = mul nuw nsw i32 %19, 1
  %39 = add nuw nsw i32 0, %38
  %40 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %20, i32 %19, i32 0, i32 %37
  store i32 %39, ptr %40, align 4
  br label %input_concatenate_fusion.3.in_bounds-after5

input_concatenate_fusion.3.in_bounds-true9:       ; preds = %input_concatenate_fusion.3.in_bounds-after5
  %41 = add i32 %26, 2
  %42 = getelementptr i32, ptr %arg0, i32 %linear_index6
  %43 = getelementptr inbounds i32, ptr %42, i32 0
  %44 = load i32, ptr %43, align 4, !invariant.load !349
  %45 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %31, i32 %30, i32 0, i32 %41
  store i32 %44, ptr %45, align 4
  br label %input_concatenate_fusion.3.in_bounds-after10
}

define void @loop_broadcast_fusion_52(ptr noalias align 128 dereferenceable(61440) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !357
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !353
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 384
  %8 = icmp ult i32 %linear_index, 7680
  br i1 %8, label %loop_broadcast_fusion.52.in_bounds-true, label %loop_broadcast_fusion.52.in_bounds-after

loop_broadcast_fusion.52.in_bounds-after:         ; preds = %loop_broadcast_fusion.52.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.52.in_bounds-true:          ; preds = %entry
  %constant_2461_1 = load double, ptr @201, align 8
  %9 = getelementptr double, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  store double %constant_2461_1, ptr %10, align 8
  br label %loop_broadcast_fusion.52.in_bounds-after
}

define void @input_scatter_fusion_3(ptr noalias align 128 dereferenceable(61440) %arg0, ptr noalias align 128 dereferenceable(46080) %arg1) {
entry:
  %input_address = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !355
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !356
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index0, 1
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index0, 1
  %10 = icmp ult i32 %linear_index, 3840
  br i1 %10, label %scatter.50.1.in_bounds-true, label %scatter.50.1.in_bounds-after

scatter.50.1.in_bounds-after:                     ; preds = %scatter.in_bounds-after, %entry
  ret void

scatter.50.1.in_bounds-true:                      ; preds = %entry
  %11 = mul nuw nsw i32 %9, 1
  %12 = add nuw nsw i32 0, %11
  %13 = urem i32 %12, 192
  %14 = udiv i32 %12, 192
  %15 = udiv i32 %14, 20
  %param_1.7731 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %14, i32 %13, i32 0, i32 0
  %param_1.77311 = load i32, ptr %param_1.7731, align 4, !invariant.load !349
  %16 = add i32 %8, %param_1.77311
  %17 = icmp ult i32 %param_1.77311, 20
  %18 = and i1 true, %17
  %19 = mul nuw nsw i32 %9, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 192
  %22 = udiv i32 %20, 192
  %23 = udiv i32 %22, 20
  %param_1.77312 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %22, i32 %21, i32 0, i32 1
  %param_1.77313 = load i32, ptr %param_1.77312, align 4, !invariant.load !349
  %24 = add i32 %6, %param_1.77313
  %25 = icmp ult i32 %param_1.77313, 192
  %26 = and i1 %18, %25
  %27 = mul nuw nsw i32 %9, 1
  %28 = add nuw nsw i32 0, %27
  %29 = urem i32 %28, 192
  %30 = udiv i32 %28, 192
  %31 = udiv i32 %30, 20
  %param_1.77314 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %30, i32 %29, i32 0, i32 2
  %param_1.77315 = load i32, ptr %param_1.77314, align 4, !invariant.load !349
  %32 = add i32 %4, %param_1.77315
  %33 = icmp ult i32 %param_1.77315, 2
  %34 = and i1 %26, %33
  br i1 %34, label %scatter.in_bounds-true, label %scatter.in_bounds-after

scatter.in_bounds-after:                          ; preds = %scatter.in_bounds-true, %scatter.50.1.in_bounds-true
  br label %scatter.50.1.in_bounds-after

scatter.in_bounds-true:                           ; preds = %scatter.50.1.in_bounds-true
  %35 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %16, i32 %24, i32 %32
  %constant_2460_2 = load double, ptr @202, align 8
  store double %constant_2460_2, ptr %input_address, align 8
  %source = load double, ptr %input_address, align 8
  %36 = atomicrmw fadd ptr %35, double %source seq_cst, align 8
  br label %scatter.in_bounds-after
}

define void @loop_select_slice_fusion_3(ptr noalias align 128 dereferenceable(46080) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(24) %arg3, ptr noalias align 128 dereferenceable(61440) %arg4, ptr noalias align 128 dereferenceable(30720) %arg5, ptr noalias align 128 dereferenceable(30720) %arg6) {
entry:
  %pad_result_addr69 = alloca double, align 8
  %return_buffer62 = alloca double, align 8
  %parameter_buffer61 = alloca double, align 8
  %parameter_buffer60 = alloca double, align 8
  %pad_result_addr54 = alloca double, align 8
  %reduce.403.6.inner.invar_address.reduction_dim.042 = alloca i32, align 4
  %accumulator_037 = alloca double, align 8
  %return_buffer36 = alloca double, align 8
  %parameter_buffer35 = alloca double, align 8
  %parameter_buffer34 = alloca double, align 8
  %reduce.401.5.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_031 = alloca double, align 8
  %return_buffer30 = alloca double, align 8
  %parameter_buffer29 = alloca double, align 8
  %parameter_buffer28 = alloca double, align 8
  %pad_result_addr22 = alloca double, align 8
  %reduce.403.6.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_010 = alloca double, align 8
  %pad_result_addr = alloca double, align 8
  %return_buffer = alloca i8, align 1
  %parameter_buffer1 = alloca i8, align 1
  %parameter_buffer = alloca i8, align 1
  %reduce.372.3.inner.invar_address.reduction_dim.2 = alloca i32, align 4
  %accumulator_0 = alloca i8, align 1
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !355
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !356
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 192
  %8 = icmp ult i32 %linear_index, 3840
  br i1 %8, label %loop_select_slice_fusion.3.in_bounds-true, label %loop_select_slice_fusion.3.in_bounds-after

loop_select_slice_fusion.3.in_bounds-after:       ; preds = %in_bounds-after72, %entry
  ret void

loop_select_slice_fusion.3.in_bounds-true:        ; preds = %entry
  %constant_2502_1 = load i8, ptr @205, align 1
  store i8 %constant_2502_1, ptr %accumulator_0, align 1
  store i32 0, ptr %reduce.372.3.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.372.3.inner.loop_header.reduction_dim.2

reduce.372.3.inner.loop_header.reduction_dim.2:   ; preds = %reduce.372.3.inner.loop_body.reduction_dim.2, %loop_select_slice_fusion.3.in_bounds-true
  %reduce.372.3.inner.indvar.reduction_dim.2 = load i32, ptr %reduce.372.3.inner.invar_address.reduction_dim.2, align 4
  %9 = icmp uge i32 %reduce.372.3.inner.indvar.reduction_dim.2, 3
  br i1 %9, label %reduce.372.3.inner.loop_exit.reduction_dim.2, label %reduce.372.3.inner.loop_body.reduction_dim.2

reduce.372.3.inner.loop_body.reduction_dim.2:     ; preds = %reduce.372.3.inner.loop_header.reduction_dim.2
  %10 = load i8, ptr %accumulator_0, align 1
  %11 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg0, i32 0, i32 %7, i32 %6, i32 0, i32 %reduce.372.3.inner.indvar.reduction_dim.2
  %12 = load i32, ptr %11, align 4, !invariant.load !349
  %13 = sext i32 %12 to i64
  %constant_2459_4 = load i64, ptr @206, align 8
  %14 = icmp sge i64 %13, %constant_2459_4
  %15 = zext i1 %14 to i8
  %16 = getelementptr inbounds [3 x i64], ptr %arg3, i32 0, i32 %reduce.372.3.inner.indvar.reduction_dim.2
  %17 = load i64, ptr %16, align 8, !invariant.load !349
  %18 = icmp sle i64 %13, %17
  %19 = zext i1 %18 to i8
  %20 = and i8 %15, %19
  store i8 %10, ptr %parameter_buffer, align 1
  store i8 %20, ptr %parameter_buffer1, align 1
  call void @region_28_5076_5601061d6c30_7b687ac0855e3bbb(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %21 = load i8, ptr %return_buffer, align 1
  store i8 %21, ptr %accumulator_0, align 1
  %invar.inc = add nuw nsw i32 %reduce.372.3.inner.indvar.reduction_dim.2, 1
  store i32 %invar.inc, ptr %reduce.372.3.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.372.3.inner.loop_header.reduction_dim.2

reduce.372.3.inner.loop_exit.reduction_dim.2:     ; preds = %reduce.372.3.inner.loop_header.reduction_dim.2
  %22 = load i8, ptr %accumulator_0, align 1
  %23 = mul nuw nsw i32 %4, 1
  %24 = add nuw nsw i32 0, %23
  %25 = udiv i32 %24, 1
  %26 = mul nuw nsw i32 %6, 1
  %27 = add nuw nsw i32 0, %26
  %28 = mul nuw nsw i32 %7, 192
  %29 = add nuw nsw i32 %27, %28
  %30 = udiv i32 %29, 3840
  %31 = mul nuw nsw i32 %29, 1
  %32 = add nuw nsw i32 0, %31
  %33 = urem i32 %32, 192
  %34 = udiv i32 %32, 192
  %35 = udiv i32 %34, 20
  %36 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg0, i32 0, i32 %34, i32 %33, i32 0, i32 0
  %37 = load i32, ptr %36, align 4, !invariant.load !349
  %38 = sext i32 %37 to i64
  %39 = icmp sge i64 0, %38
  %40 = select i1 %39, i64 0, i64 %38
  %41 = icmp sle i64 19, %40
  %42 = select i1 %41, i64 19, i64 %40
  %43 = trunc i64 %42 to i32
  %44 = add i32 0, %43
  %45 = mul nuw nsw i32 %29, 1
  %46 = add nuw nsw i32 0, %45
  %47 = urem i32 %46, 192
  %48 = udiv i32 %46, 192
  %49 = udiv i32 %48, 20
  %50 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg0, i32 0, i32 %48, i32 %47, i32 0, i32 1
  %51 = load i32, ptr %50, align 4, !invariant.load !349
  %52 = sext i32 %51 to i64
  %53 = icmp sge i64 0, %52
  %54 = select i1 %53, i64 0, i64 %52
  %55 = icmp sle i64 191, %54
  %56 = select i1 %55, i64 191, i64 %54
  %57 = trunc i64 %56 to i32
  %58 = add i32 0, %57
  %59 = mul nuw nsw i32 %29, 1
  %60 = add nuw nsw i32 0, %59
  %61 = urem i32 %60, 192
  %62 = udiv i32 %60, 192
  %63 = udiv i32 %62, 20
  %64 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg0, i32 0, i32 %62, i32 %61, i32 0, i32 2
  %65 = load i32, ptr %64, align 4, !invariant.load !349
  %66 = sext i32 %65 to i64
  %67 = icmp sge i64 0, %66
  %68 = select i1 %67, i64 0, i64 %66
  %69 = icmp sle i64 1, %68
  %70 = select i1 %69, i64 1, i64 %68
  %71 = trunc i64 %70 to i32
  %72 = add i32 0, %71
  %73 = sub i32 %72, 1
  %74 = icmp sge i32 %73, 0
  %in_bounds = and i1 true, %74
  %75 = urem i32 %73, 1
  %76 = icmp eq i32 0, %75
  %in_bounds2 = and i1 %in_bounds, %76
  %77 = sdiv i32 %73, 1
  %78 = icmp slt i32 %77, 1
  %in_bounds3 = and i1 %in_bounds2, %78
  %79 = sub i32 %58, 0
  %80 = icmp sge i32 %79, 0
  %in_bounds4 = and i1 %in_bounds3, %80
  %81 = urem i32 %79, 1
  %82 = icmp eq i32 0, %81
  %in_bounds5 = and i1 %in_bounds4, %82
  %83 = sdiv i32 %79, 1
  %84 = icmp slt i32 %83, 192
  %in_bounds6 = and i1 %in_bounds5, %84
  %85 = sub i32 %44, 0
  %86 = icmp sge i32 %85, 0
  %in_bounds7 = and i1 %in_bounds6, %86
  %87 = urem i32 %85, 1
  %88 = icmp eq i32 0, %87
  %in_bounds8 = and i1 %in_bounds7, %88
  %89 = sdiv i32 %85, 1
  %90 = icmp slt i32 %89, 20
  %in_bounds9 = and i1 %in_bounds8, %90
  br i1 %in_bounds9, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %91 = load double, ptr %pad_result_addr, align 8
  %92 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %58, i32 %44
  %93 = load double, ptr %92, align 8, !invariant.load !349
  %subtract.875.9 = fsub double %91, %93
  %constant_2461_2411 = load double, ptr @203, align 8
  store double %constant_2461_2411, ptr %accumulator_010, align 8
  store i32 0, ptr %reduce.403.6.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.403.6.inner.loop_header.reduction_dim.0

reduce.403.6.inner.loop_header.reduction_dim.0:   ; preds = %in_bounds-after25, %in_bounds-after
  %reduce.403.6.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.403.6.inner.invar_address.reduction_dim.0, align 4
  %94 = icmp uge i32 %reduce.403.6.inner.indvar.reduction_dim.0, 2
  br i1 %94, label %reduce.403.6.inner.loop_exit.reduction_dim.0, label %reduce.403.6.inner.loop_body.reduction_dim.0

reduce.403.6.inner.loop_body.reduction_dim.0:     ; preds = %reduce.403.6.inner.loop_header.reduction_dim.0
  %95 = load double, ptr %accumulator_010, align 8
  %96 = sub i32 %reduce.403.6.inner.indvar.reduction_dim.0, 1
  %97 = icmp sge i32 %96, 0
  %in_bounds13 = and i1 true, %97
  %98 = urem i32 %96, 1
  %99 = icmp eq i32 0, %98
  %in_bounds14 = and i1 %in_bounds13, %99
  %100 = sdiv i32 %96, 1
  %101 = icmp slt i32 %100, 1
  %in_bounds15 = and i1 %in_bounds14, %101
  %102 = sub i32 %58, 0
  %103 = icmp sge i32 %102, 0
  %in_bounds16 = and i1 %in_bounds15, %103
  %104 = urem i32 %102, 1
  %105 = icmp eq i32 0, %104
  %in_bounds17 = and i1 %in_bounds16, %105
  %106 = sdiv i32 %102, 1
  %107 = icmp slt i32 %106, 192
  %in_bounds18 = and i1 %in_bounds17, %107
  %108 = sub i32 %44, 0
  %109 = icmp sge i32 %108, 0
  %in_bounds19 = and i1 %in_bounds18, %109
  %110 = urem i32 %108, 1
  %111 = icmp eq i32 0, %110
  %in_bounds20 = and i1 %in_bounds19, %111
  %112 = sdiv i32 %108, 1
  %113 = icmp slt i32 %112, 20
  %in_bounds21 = and i1 %in_bounds20, %113
  br i1 %in_bounds21, label %in_bounds-true23, label %in_bounds-false24

in_bounds-after25:                                ; preds = %in_bounds-false24, %in_bounds-true23
  %114 = load double, ptr %pad_result_addr22, align 8
  %115 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %58, i32 %44
  %116 = load double, ptr %115, align 8, !invariant.load !349
  %subtract.875.927 = fsub double %114, %116
  %117 = call double @__nv_exp(double %subtract.875.927)
  store double %95, ptr %parameter_buffer28, align 8
  store double %117, ptr %parameter_buffer29, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer28, ptr %parameter_buffer29, ptr %return_buffer30)
  %118 = load double, ptr %return_buffer30, align 8
  store double %118, ptr %accumulator_010, align 8
  %invar.inc12 = add nuw nsw i32 %reduce.403.6.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc12, ptr %reduce.403.6.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.403.6.inner.loop_header.reduction_dim.0

reduce.403.6.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.403.6.inner.loop_header.reduction_dim.0
  %119 = load double, ptr %accumulator_010, align 8
  %120 = call double @__nv_log(double %119)
  %subtract.877.5 = fsub double %subtract.875.9, %120
  %constant_2486_1 = load double, ptr @204, align 8
  %121 = trunc i8 %22 to i1
  %122 = select i1 %121, double %subtract.877.5, double %constant_2486_1
  %123 = insertvalue { double, double } undef, double %122, 0
  %124 = mul nuw nsw i32 %4, 1
  %125 = add nuw nsw i32 0, %124
  %126 = mul nuw nsw i32 %6, 1
  %127 = add nuw nsw i32 0, %126
  %128 = mul nuw nsw i32 %7, 192
  %129 = add nuw nsw i32 %127, %128
  %130 = urem i32 %129, 20
  %131 = udiv i32 %129, 20
  %132 = udiv i32 %131, 192
  %133 = add i32 %131, 0
  %134 = add i32 %130, 0
  %135 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg4, i32 0, i32 %134, i32 %133, i32 1
  %136 = load double, ptr %135, align 8, !invariant.load !349
  %constant_2461_2432 = load double, ptr @203, align 8
  store double %constant_2461_2432, ptr %accumulator_031, align 8
  store i32 0, ptr %reduce.401.5.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.401.5.clone.1.inner.loop_header.reduction_dim.0

reduce.401.5.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.401.5.clone.1.inner.loop_body.reduction_dim.0, %reduce.403.6.inner.loop_exit.reduction_dim.0
  %reduce.401.5.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.401.5.clone.1.inner.invar_address.reduction_dim.0, align 4
  %137 = icmp uge i32 %reduce.401.5.clone.1.inner.indvar.reduction_dim.0, 2
  br i1 %137, label %reduce.401.5.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.401.5.clone.1.inner.loop_body.reduction_dim.0

reduce.401.5.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.401.5.clone.1.inner.loop_header.reduction_dim.0
  %138 = load double, ptr %accumulator_031, align 8
  %139 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg4, i32 0, i32 %134, i32 %133, i32 %reduce.401.5.clone.1.inner.indvar.reduction_dim.0
  %140 = load double, ptr %139, align 8, !invariant.load !349
  store double %138, ptr %parameter_buffer34, align 8
  store double %140, ptr %parameter_buffer35, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer34, ptr %parameter_buffer35, ptr %return_buffer36)
  %141 = load double, ptr %return_buffer36, align 8
  store double %141, ptr %accumulator_031, align 8
  %invar.inc33 = add nuw nsw i32 %reduce.401.5.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc33, ptr %reduce.401.5.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.401.5.clone.1.inner.loop_header.reduction_dim.0

reduce.401.5.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.401.5.clone.1.inner.loop_header.reduction_dim.0
  %142 = load double, ptr %accumulator_031, align 8
  %143 = fneg double %142
  %constant_2461_2438 = load double, ptr @203, align 8
  store double %constant_2461_2438, ptr %accumulator_037, align 8
  store i32 0, ptr %reduce.403.6.inner.invar_address.reduction_dim.042, align 4
  br label %reduce.403.6.inner.loop_header.reduction_dim.040

reduce.403.6.inner.loop_header.reduction_dim.040: ; preds = %in_bounds-after57, %reduce.401.5.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.403.6.inner.indvar.reduction_dim.043 = load i32, ptr %reduce.403.6.inner.invar_address.reduction_dim.042, align 4
  %144 = icmp uge i32 %reduce.403.6.inner.indvar.reduction_dim.043, 2
  br i1 %144, label %reduce.403.6.inner.loop_exit.reduction_dim.039, label %reduce.403.6.inner.loop_body.reduction_dim.041

reduce.403.6.inner.loop_body.reduction_dim.041:   ; preds = %reduce.403.6.inner.loop_header.reduction_dim.040
  %145 = load double, ptr %accumulator_037, align 8
  %146 = sub i32 %reduce.403.6.inner.indvar.reduction_dim.043, 1
  %147 = icmp sge i32 %146, 0
  %in_bounds45 = and i1 true, %147
  %148 = urem i32 %146, 1
  %149 = icmp eq i32 0, %148
  %in_bounds46 = and i1 %in_bounds45, %149
  %150 = sdiv i32 %146, 1
  %151 = icmp slt i32 %150, 1
  %in_bounds47 = and i1 %in_bounds46, %151
  %152 = sub i32 %133, 0
  %153 = icmp sge i32 %152, 0
  %in_bounds48 = and i1 %in_bounds47, %153
  %154 = urem i32 %152, 1
  %155 = icmp eq i32 0, %154
  %in_bounds49 = and i1 %in_bounds48, %155
  %156 = sdiv i32 %152, 1
  %157 = icmp slt i32 %156, 192
  %in_bounds50 = and i1 %in_bounds49, %157
  %158 = sub i32 %134, 0
  %159 = icmp sge i32 %158, 0
  %in_bounds51 = and i1 %in_bounds50, %159
  %160 = urem i32 %158, 1
  %161 = icmp eq i32 0, %160
  %in_bounds52 = and i1 %in_bounds51, %161
  %162 = sdiv i32 %158, 1
  %163 = icmp slt i32 %162, 20
  %in_bounds53 = and i1 %in_bounds52, %163
  br i1 %in_bounds53, label %in_bounds-true55, label %in_bounds-false56

in_bounds-after57:                                ; preds = %in_bounds-false56, %in_bounds-true55
  %164 = load double, ptr %pad_result_addr54, align 8
  %165 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %133, i32 %134
  %166 = load double, ptr %165, align 8, !invariant.load !349
  %subtract.875.959 = fsub double %164, %166
  %167 = call double @__nv_exp(double %subtract.875.959)
  store double %145, ptr %parameter_buffer60, align 8
  store double %167, ptr %parameter_buffer61, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer60, ptr %parameter_buffer61, ptr %return_buffer62)
  %168 = load double, ptr %return_buffer62, align 8
  store double %168, ptr %accumulator_037, align 8
  %invar.inc44 = add nuw nsw i32 %reduce.403.6.inner.indvar.reduction_dim.043, 1
  store i32 %invar.inc44, ptr %reduce.403.6.inner.invar_address.reduction_dim.042, align 4
  br label %reduce.403.6.inner.loop_header.reduction_dim.040

reduce.403.6.inner.loop_exit.reduction_dim.039:   ; preds = %reduce.403.6.inner.loop_header.reduction_dim.040
  %169 = load double, ptr %accumulator_037, align 8
  %divide.2564.3.clone.1 = fdiv double %143, %169
  %170 = sub i32 %133, 0
  %171 = icmp sge i32 %170, 0
  %in_bounds63 = and i1 true, %171
  %172 = urem i32 %170, 1
  %173 = icmp eq i32 0, %172
  %in_bounds64 = and i1 %in_bounds63, %173
  %174 = sdiv i32 %170, 1
  %175 = icmp slt i32 %174, 192
  %in_bounds65 = and i1 %in_bounds64, %175
  %176 = sub i32 %134, 0
  %177 = icmp sge i32 %176, 0
  %in_bounds66 = and i1 %in_bounds65, %177
  %178 = urem i32 %176, 1
  %179 = icmp eq i32 0, %178
  %in_bounds67 = and i1 %in_bounds66, %179
  %180 = sdiv i32 %176, 1
  %181 = icmp slt i32 %180, 20
  %in_bounds68 = and i1 %in_bounds67, %181
  br i1 %in_bounds68, label %in_bounds-true70, label %in_bounds-false71

in_bounds-after72:                                ; preds = %in_bounds-false71, %in_bounds-true70
  %182 = load double, ptr %pad_result_addr69, align 8
  %183 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %133, i32 %134
  %184 = load double, ptr %183, align 8, !invariant.load !349
  %subtract.875.974 = fsub double %182, %184
  %185 = call double @__nv_exp(double %subtract.875.974)
  %multiply.11875.1.clone.1 = fmul double %divide.2564.3.clone.1, %185
  %add.10027.1.clone.1 = fadd double %136, %multiply.11875.1.clone.1
  %186 = insertvalue { double, double } %123, double %add.10027.1.clone.1, 1
  %187 = extractvalue { double, double } %186, 0
  %188 = getelementptr double, ptr %arg5, i32 %linear_index
  %189 = getelementptr inbounds double, ptr %188, i32 0
  store double %187, ptr %189, align 8
  %190 = mul nuw nsw i32 %4, 1
  %191 = add nuw nsw i32 0, %190
  %192 = mul nuw nsw i32 %6, 1
  %193 = add nuw nsw i32 0, %192
  %194 = mul nuw nsw i32 %7, 192
  %195 = add nuw nsw i32 %193, %194
  %196 = urem i32 %195, 20
  %197 = udiv i32 %195, 20
  %198 = udiv i32 %197, 192
  %199 = extractvalue { double, double } %186, 1
  %200 = getelementptr double, ptr %arg6, i32 %linear_index
  %201 = getelementptr inbounds double, ptr %200, i32 0
  store double %199, ptr %201, align 8
  br label %loop_select_slice_fusion.3.in_bounds-after

in_bounds-true:                                   ; preds = %reduce.372.3.inner.loop_exit.reduction_dim.2
  %202 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %83, i32 %89
  %203 = load double, ptr %202, align 8, !invariant.load !349
  store double %203, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %reduce.372.3.inner.loop_exit.reduction_dim.2
  %constant_2461_24 = load double, ptr @203, align 8
  store double %constant_2461_24, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-true23:                                 ; preds = %reduce.403.6.inner.loop_body.reduction_dim.0
  %204 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %106, i32 %112
  %205 = load double, ptr %204, align 8, !invariant.load !349
  store double %205, ptr %pad_result_addr22, align 8
  br label %in_bounds-after25

in_bounds-false24:                                ; preds = %reduce.403.6.inner.loop_body.reduction_dim.0
  %constant_2461_2426 = load double, ptr @203, align 8
  store double %constant_2461_2426, ptr %pad_result_addr22, align 8
  br label %in_bounds-after25

in_bounds-true55:                                 ; preds = %reduce.403.6.inner.loop_body.reduction_dim.041
  %206 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %156, i32 %162
  %207 = load double, ptr %206, align 8, !invariant.load !349
  store double %207, ptr %pad_result_addr54, align 8
  br label %in_bounds-after57

in_bounds-false56:                                ; preds = %reduce.403.6.inner.loop_body.reduction_dim.041
  %constant_2461_2458 = load double, ptr @203, align 8
  store double %constant_2461_2458, ptr %pad_result_addr54, align 8
  br label %in_bounds-after57

in_bounds-true70:                                 ; preds = %reduce.403.6.inner.loop_exit.reduction_dim.039
  %208 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %174, i32 %180
  %209 = load double, ptr %208, align 8, !invariant.load !349
  store double %209, ptr %pad_result_addr69, align 8
  br label %in_bounds-after72

in_bounds-false71:                                ; preds = %reduce.403.6.inner.loop_exit.reduction_dim.039
  %constant_2461_2473 = load double, ptr @203, align 8
  store double %constant_2461_2473, ptr %pad_result_addr69, align 8
  br label %in_bounds-after72
}

define internal void @region_28_5076_5601061d6c30_7b687ac0855e3bbb(ptr dereferenceable(1) %0, ptr dereferenceable(1) %1, ptr dereferenceable(1) %output_arg) {
entry:
  %2 = alloca i8, align 1
  %Arg_0.5077 = load i8, ptr %0, align 1
  %Arg_1.5078 = load i8, ptr %1, align 1
  %3 = and i8 %Arg_0.5077, %Arg_1.5078
  store i8 %3, ptr %2, align 1
  %load_ret_value = load i8, ptr %2, align 1
  store i8 %load_ret_value, ptr %output_arg, align 1
  ret void
}

; Function Attrs: nounwind memory(none)
declare double @__nv_log(double) #2

define void @input_multiply_reduce_fusion_3(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3, ptr noalias align 128 dereferenceable(30720) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(8) %arg7, ptr noalias align 128 dereferenceable(30720) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(30720) %arg10) {
entry:
  %return_buffer32 = alloca double, align 8
  %result_from_other_lane30 = alloca double, align 8
  %return_buffer29 = alloca double, align 8
  %result_from_other_lane27 = alloca double, align 8
  %return_buffer26 = alloca double, align 8
  %result_from_other_lane24 = alloca double, align 8
  %return_buffer23 = alloca double, align 8
  %result_from_other_lane21 = alloca double, align 8
  %return_buffer20 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !348
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_2461_44_clone_1 = load double, ptr @211, align 8
  store double %constant_2461_44_clone_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !353
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = udiv i32 %thread.id.x, 32
  %thread.id.1 = urem i32 %1, 32
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 192, i32 4096
  %8 = icmp eq i32 %3, 0
  %tile_bound.2 = select i1 %8, i32 20, i32 32
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 4096
  %tile_origin.2 = mul i32 %3, 32
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %9 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %9, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 32
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %10 = icmp uge i32 %loop2.indvar, 32
  br i1 %10, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 32
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %11 = add i32 %loop2.indvar, %thread.id.2
  %12 = icmp ult i32 %11, %tile_bound.2
  br i1 %12, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !358

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !361

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %13 = load double, ptr %partial_reduction_result, align 8
  %14 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.2, i32 %thread.id.1
  %15 = addrspacecast ptr addrspace(3) %14 to ptr
  store double %13, ptr %15, align 8
  call void @llvm.nvvm.barrier0()
  %16 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %thread.id.2
  %17 = addrspacecast ptr addrspace(3) %16 to ptr
  %partial_reduction_result19 = load double, ptr %17, align 8
  %18 = bitcast double %partial_reduction_result19 to i64
  %19 = bitcast i64 %18 to <2 x i32>
  %20 = extractelement <2 x i32> %19, i64 0
  %21 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 16, i32 31)
  %22 = insertelement <2 x i32> %19, i32 %21, i64 0
  %23 = extractelement <2 x i32> %22, i64 1
  %24 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 16, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 1
  %26 = bitcast <2 x i32> %25 to i64
  %27 = bitcast i64 %26 to double
  store double %27, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane, ptr %return_buffer20)
  %28 = load double, ptr %return_buffer20, align 8
  store double %28, ptr %17, align 8
  %partial_reduction_result22 = load double, ptr %17, align 8
  %29 = bitcast double %partial_reduction_result22 to i64
  %30 = bitcast i64 %29 to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 0
  %34 = extractelement <2 x i32> %33, i64 1
  %35 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 8, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to i64
  %38 = bitcast i64 %37 to double
  store double %38, ptr %result_from_other_lane21, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane21, ptr %return_buffer23)
  %39 = load double, ptr %return_buffer23, align 8
  store double %39, ptr %17, align 8
  %partial_reduction_result25 = load double, ptr %17, align 8
  %40 = bitcast double %partial_reduction_result25 to i64
  %41 = bitcast i64 %40 to <2 x i32>
  %42 = extractelement <2 x i32> %41, i64 0
  %43 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 4, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 0
  %45 = extractelement <2 x i32> %44, i64 1
  %46 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 4, i32 31)
  %47 = insertelement <2 x i32> %44, i32 %46, i64 1
  %48 = bitcast <2 x i32> %47 to i64
  %49 = bitcast i64 %48 to double
  store double %49, ptr %result_from_other_lane24, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane24, ptr %return_buffer26)
  %50 = load double, ptr %return_buffer26, align 8
  store double %50, ptr %17, align 8
  %partial_reduction_result28 = load double, ptr %17, align 8
  %51 = bitcast double %partial_reduction_result28 to i64
  %52 = bitcast i64 %51 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 2, i32 31)
  %55 = insertelement <2 x i32> %52, i32 %54, i64 0
  %56 = extractelement <2 x i32> %55, i64 1
  %57 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 1
  %59 = bitcast <2 x i32> %58 to i64
  %60 = bitcast i64 %59 to double
  store double %60, ptr %result_from_other_lane27, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane27, ptr %return_buffer29)
  %61 = load double, ptr %return_buffer29, align 8
  store double %61, ptr %17, align 8
  %partial_reduction_result31 = load double, ptr %17, align 8
  %62 = bitcast double %partial_reduction_result31 to i64
  %63 = bitcast i64 %62 to <2 x i32>
  %64 = extractelement <2 x i32> %63, i64 0
  %65 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  %66 = insertelement <2 x i32> %63, i32 %65, i64 0
  %67 = extractelement <2 x i32> %66, i64 1
  %68 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %67, i32 1, i32 31)
  %69 = insertelement <2 x i32> %66, i32 %68, i64 1
  %70 = bitcast <2 x i32> %69 to i64
  %71 = bitcast i64 %70 to double
  store double %71, ptr %result_from_other_lane30, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane30, ptr %return_buffer32)
  %72 = load double, ptr %return_buffer32, align 8
  store double %72, ptr %17, align 8
  %73 = icmp ult i32 %thread.id.1, %tile_bound.2
  %74 = icmp ult i32 %thread.id.2, %tile_bound.1
  %75 = and i1 %73, %74
  %76 = icmp eq i32 %lane_id, 0
  %77 = and i1 %75, %76
  br i1 %77, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %78 = add i32 %tile_origin.0, 0
  %79 = add i32 %tile_origin.1, %loop1.indvar
  %80 = add i32 %tile_origin.2, %11
  %param_0.5537 = getelementptr inbounds [1 x [192 x [20 x double]]], ptr %arg0, i32 0, i32 0, i32 %79, i32 %80
  %param_0.55372 = load double, ptr %param_0.5537, align 8, !invariant.load !349
  store double %param_0.55372, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %81 = load double, ptr %return_buffer, align 8
  store double %81, ptr %partial_reduction_result, align 8
  %constant_2470_2 = load double, ptr @207, align 8
  %constant_2506_3 = load double, ptr @209, align 8
  %param_3.5742 = getelementptr inbounds [192 x [20 x double]], ptr %arg3, i32 0, i32 %79, i32 %80
  %param_3.57423 = load double, ptr %param_3.5742, align 8, !invariant.load !349
  %constant_2505_3 = load double, ptr @208, align 8
  %82 = fcmp une double %constant_2506_3, %constant_2506_3
  %83 = fcmp oeq double %param_3.57423, %param_3.57423
  %84 = fcmp oge double %constant_2506_3, %param_3.57423
  %85 = and i1 %83, %84
  %86 = or i1 %82, %85
  %87 = select i1 %86, double %constant_2506_3, double %param_3.57423
  %88 = fcmp une double %constant_2505_3, %constant_2505_3
  %89 = fcmp oeq double %87, %87
  %90 = fcmp ole double %constant_2505_3, %87
  %91 = and i1 %89, %90
  %92 = or i1 %88, %91
  %93 = select i1 %92, double %constant_2505_3, double %87
  %94 = fneg double %93
  %95 = call double @__nv_exp(double %94)
  %add.10024.3 = fadd double %95, %constant_2470_2
  %divide.2563.3 = fdiv double %constant_2470_2, %add.10024.3
  %subtract.873.2 = fsub double %constant_2470_2, %divide.2563.3
  %param_2.6342 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %79, i32 %80
  %param_2.63424 = load double, ptr %param_2.6342, align 8, !invariant.load !349
  %multiply.11871.2 = fmul double %subtract.873.2, %param_2.63424
  %param_1.7713 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %79, i32 %80
  %param_1.77135 = load double, ptr %param_1.7713, align 8, !invariant.load !349
  %multiply.11872.2 = fmul double %divide.2563.3, %param_1.77135
  %subtract.874.1 = fsub double %multiply.11871.2, %multiply.11872.2
  %multiply.11886.1 = fmul double %param_0.55372, %subtract.874.1
  %param_5.4295 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %80
  %param_5.42956 = load double, ptr %param_5.4295, align 8, !invariant.load !349
  %param_7.2775 = load double, ptr %arg7, align 8, !invariant.load !349
  %param_6.3519 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %80
  %param_6.35197 = load double, ptr %param_6.3519, align 8, !invariant.load !349
  %multiply.11866.11.clone.1 = fmul double %param_7.2775, %param_6.35197
  %add.10019.11.clone.1 = fadd double %param_5.42956, %multiply.11866.11.clone.1
  %96 = call double @__nv_exp(double %add.10019.11.clone.1)
  %multiply.11877.15.clone.1 = fmul double %96, %param_0.55372
  %97 = fneg double %multiply.11877.15.clone.1
  %param_1.77138 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %79, i32 %80
  %param_1.77139 = load double, ptr %param_1.77138, align 8, !invariant.load !349
  %multiply.11878.9.clone.1 = fmul double %97, %param_1.77139
  %param_2.634210 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %79, i32 %80
  %param_2.634211 = load double, ptr %param_2.634210, align 8, !invariant.load !349
  %multiply.11879.5.clone.1 = fmul double %multiply.11877.15.clone.1, %param_2.634211
  %98 = fneg double %multiply.11879.5.clone.1
  %add.10029.7.clone.1 = fadd double %multiply.11878.9.clone.1, %98
  %multiply.11880.1.clone.1 = fmul double %divide.2563.3, %subtract.873.2
  %multiply.11881.5.clone.1 = fmul double %add.10029.7.clone.1, %multiply.11880.1.clone.1
  %param_3.574212 = getelementptr inbounds [192 x [20 x double]], ptr %arg3, i32 0, i32 %79, i32 %80
  %param_3.574213 = load double, ptr %param_3.574212, align 8, !invariant.load !349
  %99 = fcmp une double %constant_2506_3, %constant_2506_3
  %100 = fcmp oeq double %param_3.574213, %param_3.574213
  %101 = fcmp oge double %constant_2506_3, %param_3.574213
  %102 = and i1 %100, %101
  %103 = or i1 %99, %102
  %maximum.73.1.clone.1 = select i1 %103, double %constant_2506_3, double %param_3.574213
  %compare.2743.1.clone.1 = fcmp oeq double %maximum.73.1.clone.1, %93
  %104 = zext i1 %compare.2743.1.clone.1 to i8
  %param_4.5114 = getelementptr inbounds [192 x [20 x double]], ptr %arg4, i32 0, i32 %79, i32 %80
  %param_4.511414 = load double, ptr %param_4.5114, align 8, !invariant.load !349
  %105 = trunc i8 %104 to i1
  %106 = select i1 %105, double %constant_2470_2, double %param_4.511414
  %compare.2744.1.clone.1 = fcmp oeq double %constant_2505_3, %93
  %107 = zext i1 %compare.2744.1.clone.1 to i8
  %constant_2509_1_clone_1 = load double, ptr @210, align 8
  %108 = trunc i8 %107 to i1
  %109 = select i1 %108, double %constant_2509_1_clone_1, double %constant_2470_2
  %divide.2565.5.clone.1 = fdiv double %106, %109
  %multiply.11882.3.clone.1 = fmul double %multiply.11881.5.clone.1, %divide.2565.5.clone.1
  %param_3.574215 = getelementptr inbounds [192 x [20 x double]], ptr %arg3, i32 0, i32 %79, i32 %80
  %param_3.574216 = load double, ptr %param_3.574215, align 8, !invariant.load !349
  %compare.2745.1.clone.1 = fcmp oeq double %param_3.574216, %maximum.73.1.clone.1
  %110 = zext i1 %compare.2745.1.clone.1 to i8
  %param_4.511417 = getelementptr inbounds [192 x [20 x double]], ptr %arg4, i32 0, i32 %79, i32 %80
  %param_4.511418 = load double, ptr %param_4.511417, align 8, !invariant.load !349
  %111 = trunc i8 %110 to i1
  %112 = select i1 %111, double %constant_2470_2, double %param_4.511418
  %compare.2746.1.clone.1 = fcmp oeq double %constant_2506_3, %maximum.73.1.clone.1
  %113 = zext i1 %compare.2746.1.clone.1 to i8
  %114 = trunc i8 %113 to i1
  %115 = select i1 %114, double %constant_2509_1_clone_1, double %constant_2470_2
  %divide.2566.3.clone.1 = fdiv double %112, %115
  %multiply.11883.1.clone.1 = fmul double %multiply.11882.3.clone.1, %divide.2566.3.clone.1
  %116 = getelementptr inbounds [192 x [20 x double]], ptr %arg8, i32 0, i32 %79, i32 %80
  store double %multiply.11886.1, ptr %116, align 8
  %117 = getelementptr inbounds [192 x [20 x double]], ptr %arg10, i32 0, i32 %79, i32 %80
  store double %multiply.11883.1.clone.1, ptr %117, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %118 = add i32 %tile_origin.2, %thread.id.1
  %output_element_address = getelementptr inbounds [20 x double], ptr %arg9, i32 0, i32 %118
  %output = load double, ptr %17, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #4

define void @loop_broadcast_fusion_57(ptr noalias align 128 dereferenceable(160) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = icmp ult i32 %linear_index, 20
  br i1 %6, label %loop_broadcast_fusion.57.in_bounds-true, label %loop_broadcast_fusion.57.in_bounds-after

loop_broadcast_fusion.57.in_bounds-after:         ; preds = %loop_broadcast_fusion.57.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.57.in_bounds-true:          ; preds = %entry
  %constant_2461_6 = load double, ptr @212, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  store double %constant_2461_6, ptr %8, align 8
  br label %loop_broadcast_fusion.57.in_bounds-after
}

define void @loop_dynamic_slice_fusion_17(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_dynamic_slice_fusion.17.in_bounds-true, label %loop_dynamic_slice_fusion.17.in_bounds-after

loop_dynamic_slice_fusion.17.in_bounds-after:     ; preds = %loop_dynamic_slice_fusion.17.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.17.in_bounds-true:      ; preds = %entry
  %constant_5038_8 = load i64, ptr @213, align 8
  %5 = load i64, ptr %arg1, align 8, !invariant.load !349
  %6 = sub i64 %constant_5038_8, %5
  %constant_5031_2 = load i64, ptr @215, align 8
  %7 = icmp slt i64 %6, %constant_5031_2
  %8 = zext i1 %7 to i8
  %constant_5039_8 = load i64, ptr @214, align 8
  %9 = load i64, ptr %arg1, align 8, !invariant.load !349
  %10 = sub i64 %constant_5039_8, %9
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, i64 %10, i64 %6
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.5434.2.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.5434.2.start_idx0, %3
  %18 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %17
  %19 = load double, ptr %18, align 8, !invariant.load !349
  %20 = getelementptr double, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %19, ptr %21, align 8
  br label %loop_dynamic_slice_fusion.17.in_bounds-after
}

define void @loop_dynamic_slice_fusion_15(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_dynamic_slice_fusion.15.in_bounds-true, label %loop_dynamic_slice_fusion.15.in_bounds-after

loop_dynamic_slice_fusion.15.in_bounds-after:     ; preds = %loop_dynamic_slice_fusion.15.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.15.in_bounds-true:      ; preds = %entry
  %constant_5038_6 = load i64, ptr @216, align 8
  %5 = load i64, ptr %arg1, align 8, !invariant.load !349
  %6 = sub i64 %constant_5038_6, %5
  %constant_5031_13 = load i64, ptr @218, align 8
  %7 = icmp slt i64 %6, %constant_5031_13
  %8 = zext i1 %7 to i8
  %constant_5039_6 = load i64, ptr @217, align 8
  %9 = load i64, ptr %arg1, align 8, !invariant.load !349
  %10 = sub i64 %constant_5039_6, %9
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, i64 %10, i64 %6
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.5432.1.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.5432.1.start_idx0, %3
  %18 = getelementptr inbounds [192 x i32], ptr %arg0, i32 0, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !349
  %20 = getelementptr i32, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds i32, ptr %20, i32 0
  store i32 %19, ptr %21, align 4
  br label %loop_dynamic_slice_fusion.15.in_bounds-after
}

define void @loop_dynamic_slice_fusion_19(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(20) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 20
  br i1 %6, label %loop_dynamic_slice_fusion.19.in_bounds-true, label %loop_dynamic_slice_fusion.19.in_bounds-after

loop_dynamic_slice_fusion.19.in_bounds-after:     ; preds = %loop_dynamic_slice_fusion.19.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.19.in_bounds-true:      ; preds = %entry
  %constant_5038_12 = load i64, ptr @220, align 8
  %7 = load i64, ptr %arg1, align 8, !invariant.load !349
  %8 = sub i64 %constant_5038_12, %7
  %constant_5031_7 = load i64, ptr @219, align 8
  %9 = icmp slt i64 %8, %constant_5031_7
  %10 = zext i1 %9 to i8
  %constant_5039_12 = load i64, ptr @221, align 8
  %11 = load i64, ptr %arg1, align 8, !invariant.load !349
  %12 = sub i64 %constant_5039_12, %11
  %13 = trunc i8 %10 to i1
  %14 = select i1 %13, i64 %12, i64 %8
  %15 = trunc i64 %14 to i32
  %16 = icmp sge i32 0, %15
  %17 = select i1 %16, i32 0, i32 %15
  %18 = icmp sle i32 191, %17
  %dynamic-slice.5449.1.start_idx0 = select i1 %18, i32 191, i32 %17
  %constant_5031_71 = load i64, ptr @219, align 8
  %19 = trunc i64 %constant_5031_71 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 0, %21
  %dynamic-slice.5449.1.start_idx1 = select i1 %22, i32 0, i32 %21
  %23 = add i32 %dynamic-slice.5449.1.start_idx0, %5
  %24 = add i32 %dynamic-slice.5449.1.start_idx1, %4
  %25 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i32 0, i32 %23, i32 %24
  %26 = load i8, ptr %25, align 1, !invariant.load !349
  %27 = getelementptr i8, ptr %arg2, i32 %linear_index
  %28 = getelementptr inbounds i8, ptr %27, i32 0
  store i8 %26, ptr %28, align 1
  br label %loop_dynamic_slice_fusion.19.in_bounds-after
}

define void @loop_dynamic_slice_fusion_18(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 20
  br i1 %6, label %loop_dynamic_slice_fusion.18.in_bounds-true, label %loop_dynamic_slice_fusion.18.in_bounds-after

loop_dynamic_slice_fusion.18.in_bounds-after:     ; preds = %loop_dynamic_slice_fusion.18.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.18.in_bounds-true:      ; preds = %entry
  %constant_5038_9 = load i64, ptr @223, align 8
  %7 = load i64, ptr %arg1, align 8, !invariant.load !349
  %8 = sub i64 %constant_5038_9, %7
  %constant_5031_6 = load i64, ptr @222, align 8
  %9 = icmp slt i64 %8, %constant_5031_6
  %10 = zext i1 %9 to i8
  %constant_5039_9 = load i64, ptr @224, align 8
  %11 = load i64, ptr %arg1, align 8, !invariant.load !349
  %12 = sub i64 %constant_5039_9, %11
  %13 = trunc i8 %10 to i1
  %14 = select i1 %13, i64 %12, i64 %8
  %15 = trunc i64 %14 to i32
  %16 = icmp sge i32 0, %15
  %17 = select i1 %16, i32 0, i32 %15
  %18 = icmp sle i32 191, %17
  %dynamic-slice.5435.1.start_idx0 = select i1 %18, i32 191, i32 %17
  %constant_5031_61 = load i64, ptr @222, align 8
  %19 = trunc i64 %constant_5031_61 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 0, %21
  %dynamic-slice.5435.1.start_idx1 = select i1 %22, i32 0, i32 %21
  %23 = add i32 %dynamic-slice.5435.1.start_idx0, %5
  %24 = add i32 %dynamic-slice.5435.1.start_idx1, %4
  %25 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i32 0, i32 %23, i32 %24
  %26 = load double, ptr %25, align 8, !invariant.load !349
  %27 = getelementptr double, ptr %arg2, i32 %linear_index
  %28 = getelementptr inbounds double, ptr %27, i32 0
  store double %26, ptr %28, align 8
  br label %loop_dynamic_slice_fusion.18.in_bounds-after
}

define void @loop_add_select_fusion_7(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3, ptr noalias align 128 dereferenceable(30720) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(30720) %arg6, ptr noalias align 128 dereferenceable(30720) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(3840) %arg9, ptr noalias align 128 dereferenceable(30720) %arg10, ptr noalias align 128 dereferenceable(30720) %arg11, ptr noalias align 128 dereferenceable(160) %arg12, ptr noalias align 128 dereferenceable(30720) %arg13, ptr noalias align 128 dereferenceable(30720) %arg14, ptr noalias align 128 dereferenceable(160) %arg15, ptr noalias align 128 dereferenceable(15360) %arg16, ptr noalias align 128 dereferenceable(3840) %arg17, ptr noalias align 128 dereferenceable(30720) %arg18, ptr noalias align 128 dereferenceable(3840) %arg19, ptr noalias align 128 dereferenceable(160) %arg20, ptr noalias align 128 dereferenceable(8) %arg21, ptr noalias align 128 dereferenceable(160) %arg22, ptr noalias align 128 dereferenceable(160) %arg23, ptr noalias align 128 dereferenceable(160) %arg24, ptr noalias align 128 dereferenceable(160) %arg25, ptr noalias align 128 dereferenceable(160) %arg26, ptr noalias align 128 dereferenceable(160) %arg27, ptr noalias align 128 dereferenceable(160) %arg28) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_select_fusion.7.in_bounds-true, label %loop_add_select_fusion.7.in_bounds-after

loop_add_select_fusion.7.in_bounds-after:         ; preds = %loop_add_select_fusion.7.in_bounds-true, %entry
  ret void

loop_add_select_fusion.7.in_bounds-true:          ; preds = %entry
  %constant_5038_5 = load i64, ptr @227, align 8
  %5 = load i64, ptr %arg21, align 8, !invariant.load !349
  %6 = sub i64 %constant_5038_5, %5
  %constant_5031_4 = load i64, ptr @226, align 8
  %7 = icmp slt i64 %6, %constant_5031_4
  %8 = zext i1 %7 to i8
  %constant_5039_5 = load i64, ptr @228, align 8
  %9 = load i64, ptr %arg21, align 8, !invariant.load !349
  %10 = sub i64 %constant_5039_5, %9
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, i64 %10, i64 %6
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.5430.9.start_idx0 = select i1 %16, i32 191, i32 %15
  %constant_5031_41 = load i64, ptr @226, align 8
  %17 = trunc i64 %constant_5031_41 to i32
  %18 = icmp sge i32 0, %17
  %19 = select i1 %18, i32 0, i32 %17
  %20 = icmp sle i32 0, %19
  %dynamic-slice.5430.9.start_idx1 = select i1 %20, i32 0, i32 %19
  %21 = add i32 %dynamic-slice.5430.9.start_idx0, 0
  %22 = add i32 %dynamic-slice.5430.9.start_idx1, %3
  %23 = getelementptr inbounds [192 x [20 x i8]], ptr %arg9, i32 0, i32 %21, i32 %22
  %24 = load i8, ptr %23, align 1, !invariant.load !349
  %25 = getelementptr double, ptr %arg0, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  %27 = load double, ptr %26, align 8, !invariant.load !349
  %constant_5033_10 = load double, ptr @225, align 8
  %28 = trunc i8 %24 to i1
  %29 = select i1 %28, double %27, double %constant_5033_10
  %30 = getelementptr double, ptr %arg20, i32 %linear_index
  %31 = getelementptr inbounds double, ptr %30, i32 0
  %32 = load double, ptr %31, align 8, !invariant.load !349
  %33 = trunc i8 %24 to i1
  %34 = select i1 %33, double %32, double %constant_5033_10
  %35 = trunc i64 %12 to i32
  %36 = icmp sge i32 0, %35
  %37 = select i1 %36, i32 0, i32 %35
  %38 = icmp sle i32 191, %37
  %dynamic-slice.5436.11.start_idx0 = select i1 %38, i32 191, i32 %37
  %constant_5031_42 = load i64, ptr @226, align 8
  %39 = trunc i64 %constant_5031_42 to i32
  %40 = icmp sge i32 0, %39
  %41 = select i1 %40, i32 0, i32 %39
  %42 = icmp sle i32 0, %41
  %dynamic-slice.5436.11.start_idx1 = select i1 %42, i32 0, i32 %41
  %43 = add i32 %dynamic-slice.5436.11.start_idx0, 0
  %44 = add i32 %dynamic-slice.5436.11.start_idx1, %3
  %45 = getelementptr inbounds [192 x [20 x i8]], ptr %arg19, i32 0, i32 %43, i32 %44
  %46 = load i8, ptr %45, align 1, !invariant.load !349
  %47 = trunc i64 %12 to i32
  %48 = icmp sge i32 0, %47
  %49 = select i1 %48, i32 0, i32 %47
  %50 = icmp sle i32 191, %49
  %dynamic-slice.5437.5.start_idx0 = select i1 %50, i32 191, i32 %49
  %constant_5031_43 = load i64, ptr @226, align 8
  %51 = trunc i64 %constant_5031_43 to i32
  %52 = icmp sge i32 0, %51
  %53 = select i1 %52, i32 0, i32 %51
  %54 = icmp sle i32 0, %53
  %dynamic-slice.5437.5.start_idx1 = select i1 %54, i32 0, i32 %53
  %55 = add i32 %dynamic-slice.5437.5.start_idx0, 0
  %56 = add i32 %dynamic-slice.5437.5.start_idx1, %3
  %57 = getelementptr inbounds [192 x [20 x double]], ptr %arg18, i32 0, i32 %55, i32 %56
  %58 = load double, ptr %57, align 8, !invariant.load !349
  %59 = trunc i64 %12 to i32
  %60 = icmp sge i32 0, %59
  %61 = select i1 %60, i32 0, i32 %59
  %62 = icmp sle i32 191, %61
  %dynamic-slice.5438.17.start_idx0 = select i1 %62, i32 191, i32 %61
  %constant_5031_44 = load i64, ptr @226, align 8
  %63 = trunc i64 %constant_5031_44 to i32
  %64 = icmp sge i32 0, %63
  %65 = select i1 %64, i32 0, i32 %63
  %66 = icmp sle i32 0, %65
  %dynamic-slice.5438.17.start_idx1 = select i1 %66, i32 0, i32 %65
  %67 = add i32 %dynamic-slice.5438.17.start_idx0, 0
  %68 = add i32 %dynamic-slice.5438.17.start_idx1, %3
  %69 = getelementptr inbounds [192 x [20 x i8]], ptr %arg17, i32 0, i32 %67, i32 %68
  %70 = load i8, ptr %69, align 1, !invariant.load !349
  %71 = trunc i64 %12 to i32
  %72 = icmp sge i32 0, %71
  %73 = select i1 %72, i32 0, i32 %71
  %74 = icmp sle i32 191, %73
  %dynamic-slice.5439.24.start_idx0 = select i1 %74, i32 191, i32 %73
  %constant_5031_45 = load i64, ptr @226, align 8
  %75 = trunc i64 %constant_5031_45 to i32
  %76 = icmp sge i32 0, %75
  %77 = select i1 %76, i32 0, i32 %75
  %78 = icmp sle i32 0, %77
  %dynamic-slice.5439.24.start_idx1 = select i1 %78, i32 0, i32 %77
  %79 = add i32 %dynamic-slice.5439.24.start_idx0, 0
  %80 = add i32 %dynamic-slice.5439.24.start_idx1, %3
  %81 = getelementptr inbounds [192 x [20 x i32]], ptr %arg16, i32 0, i32 %79, i32 %80
  %82 = load i32, ptr %81, align 4, !invariant.load !349
  %constant_5034_7 = load i32, ptr @229, align 4
  %83 = icmp eq i32 %82, %constant_5034_7
  %84 = zext i1 %83 to i8
  %85 = getelementptr double, ptr %arg15, i32 %linear_index
  %86 = getelementptr inbounds double, ptr %85, i32 0
  %87 = load double, ptr %86, align 8, !invariant.load !349
  %88 = trunc i8 %24 to i1
  %89 = select i1 %88, double %87, double %constant_5033_10
  %90 = trunc i8 %84 to i1
  %91 = select i1 %90, double %89, double %constant_5033_10
  %92 = trunc i8 %70 to i1
  %93 = select i1 %92, double %91, double %constant_5033_10
  %94 = trunc i64 %12 to i32
  %95 = icmp sge i32 0, %94
  %96 = select i1 %95, i32 0, i32 %94
  %97 = icmp sle i32 191, %96
  %dynamic-slice.5440.28.start_idx0 = select i1 %97, i32 191, i32 %96
  %constant_5031_46 = load i64, ptr @226, align 8
  %98 = trunc i64 %constant_5031_46 to i32
  %99 = icmp sge i32 0, %98
  %100 = select i1 %99, i32 0, i32 %98
  %101 = icmp sle i32 0, %100
  %dynamic-slice.5440.28.start_idx1 = select i1 %101, i32 0, i32 %100
  %102 = add i32 %dynamic-slice.5440.28.start_idx0, 0
  %103 = add i32 %dynamic-slice.5440.28.start_idx1, %3
  %104 = getelementptr inbounds [192 x [20 x double]], ptr %arg11, i32 0, i32 %102, i32 %103
  %105 = load double, ptr %104, align 8, !invariant.load !349
  %multiply.11756.11 = fmul double %93, %105
  %106 = fneg double %multiply.11756.11
  %multiply.11757.9 = fmul double %58, %106
  %107 = trunc i64 %12 to i32
  %108 = icmp sge i32 0, %107
  %109 = select i1 %108, i32 0, i32 %107
  %110 = icmp sle i32 191, %109
  %dynamic-slice.5441.5.start_idx0 = select i1 %110, i32 191, i32 %109
  %constant_5031_47 = load i64, ptr @226, align 8
  %111 = trunc i64 %constant_5031_47 to i32
  %112 = icmp sge i32 0, %111
  %113 = select i1 %112, i32 0, i32 %111
  %114 = icmp sle i32 0, %113
  %dynamic-slice.5441.5.start_idx1 = select i1 %114, i32 0, i32 %113
  %115 = add i32 %dynamic-slice.5441.5.start_idx0, 0
  %116 = add i32 %dynamic-slice.5441.5.start_idx1, %3
  %117 = getelementptr inbounds [192 x [20 x double]], ptr %arg14, i32 0, i32 %115, i32 %116
  %118 = load double, ptr %117, align 8, !invariant.load !349
  %multiply.11758.7 = fmul double %118, %multiply.11756.11
  %add.9923.7 = fadd double %multiply.11757.9, %multiply.11758.7
  %119 = trunc i8 %46 to i1
  %120 = select i1 %119, double %add.9923.7, double %constant_5033_10
  %121 = trunc i64 %12 to i32
  %122 = icmp sge i32 0, %121
  %123 = select i1 %122, i32 0, i32 %121
  %124 = icmp sle i32 191, %123
  %dynamic-slice.5442.5.start_idx0 = select i1 %124, i32 191, i32 %123
  %constant_5031_48 = load i64, ptr @226, align 8
  %125 = trunc i64 %constant_5031_48 to i32
  %126 = icmp sge i32 0, %125
  %127 = select i1 %126, i32 0, i32 %125
  %128 = icmp sle i32 0, %127
  %dynamic-slice.5442.5.start_idx1 = select i1 %128, i32 0, i32 %127
  %129 = add i32 %dynamic-slice.5442.5.start_idx0, 0
  %130 = add i32 %dynamic-slice.5442.5.start_idx1, %3
  %131 = getelementptr inbounds [192 x [20 x double]], ptr %arg13, i32 0, i32 %129, i32 %130
  %132 = load double, ptr %131, align 8, !invariant.load !349
  %133 = getelementptr double, ptr %arg12, i32 %linear_index
  %134 = getelementptr inbounds double, ptr %133, i32 0
  %135 = load double, ptr %134, align 8, !invariant.load !349
  %136 = trunc i8 %24 to i1
  %137 = select i1 %136, double %135, double %constant_5033_10
  %multiply.11759.17 = fmul double %137, %105
  %138 = trunc i64 %12 to i32
  %139 = icmp sge i32 0, %138
  %140 = select i1 %139, i32 0, i32 %138
  %141 = icmp sle i32 191, %140
  %dynamic-slice.5443.13.start_idx0 = select i1 %141, i32 191, i32 %140
  %constant_5031_49 = load i64, ptr @226, align 8
  %142 = trunc i64 %constant_5031_49 to i32
  %143 = icmp sge i32 0, %142
  %144 = select i1 %143, i32 0, i32 %142
  %145 = icmp sle i32 0, %144
  %dynamic-slice.5443.13.start_idx1 = select i1 %145, i32 0, i32 %144
  %146 = add i32 %dynamic-slice.5443.13.start_idx0, 0
  %147 = add i32 %dynamic-slice.5443.13.start_idx1, %3
  %148 = getelementptr inbounds [192 x [20 x double]], ptr %arg10, i32 0, i32 %146, i32 %147
  %149 = load double, ptr %148, align 8, !invariant.load !349
  %multiply.11760.13 = fmul double %multiply.11759.17, %149
  %multiply.11761.7 = fmul double %132, %multiply.11760.13
  %add.9924.7 = fadd double %120, %multiply.11761.7
  %add.9925.5 = fadd double %34, %add.9924.7
  %150 = trunc i64 %12 to i32
  %151 = icmp sge i32 0, %150
  %152 = select i1 %151, i32 0, i32 %150
  %153 = icmp sle i32 191, %152
  %dynamic-slice.5444.1.start_idx0 = select i1 %153, i32 191, i32 %152
  %constant_5031_410 = load i64, ptr @226, align 8
  %154 = trunc i64 %constant_5031_410 to i32
  %155 = icmp sge i32 0, %154
  %156 = select i1 %155, i32 0, i32 %154
  %157 = icmp sle i32 0, %156
  %dynamic-slice.5444.1.start_idx1 = select i1 %157, i32 0, i32 %156
  %158 = add i32 %dynamic-slice.5444.1.start_idx0, 0
  %159 = add i32 %dynamic-slice.5444.1.start_idx1, %3
  %160 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %158, i32 %159
  %161 = load double, ptr %160, align 8, !invariant.load !349
  %multiply.11762.7 = fmul double %add.9925.5, %161
  %162 = trunc i64 %12 to i32
  %163 = icmp sge i32 0, %162
  %164 = select i1 %163, i32 0, i32 %162
  %165 = icmp sle i32 191, %164
  %dynamic-slice.5445.2.start_idx0 = select i1 %165, i32 191, i32 %164
  %constant_5031_411 = load i64, ptr @226, align 8
  %166 = trunc i64 %constant_5031_411 to i32
  %167 = icmp sge i32 0, %166
  %168 = select i1 %167, i32 0, i32 %166
  %169 = icmp sle i32 0, %168
  %dynamic-slice.5445.2.start_idx1 = select i1 %169, i32 0, i32 %168
  %170 = add i32 %dynamic-slice.5445.2.start_idx0, 0
  %171 = add i32 %dynamic-slice.5445.2.start_idx1, %3
  %172 = getelementptr inbounds [192 x [20 x double]], ptr %arg4, i32 0, i32 %170, i32 %171
  %173 = load double, ptr %172, align 8, !invariant.load !349
  %multiply.11763.5 = fmul double %multiply.11762.7, %173
  %174 = fneg double %multiply.11763.5
  %add.9927.3 = fadd double %29, %174
  %175 = getelementptr double, ptr %arg5, i32 %linear_index
  %176 = getelementptr inbounds double, ptr %175, i32 0
  %177 = load double, ptr %176, align 8, !invariant.load !349
  %178 = trunc i64 %12 to i32
  %179 = icmp sge i32 0, %178
  %180 = select i1 %179, i32 0, i32 %178
  %181 = icmp sle i32 191, %180
  %dynamic-slice.5431.9.start_idx0 = select i1 %181, i32 191, i32 %180
  %constant_5031_412 = load i64, ptr @226, align 8
  %182 = trunc i64 %constant_5031_412 to i32
  %183 = icmp sge i32 0, %182
  %184 = select i1 %183, i32 0, i32 %182
  %185 = icmp sle i32 0, %184
  %dynamic-slice.5431.9.start_idx1 = select i1 %185, i32 0, i32 %184
  %186 = add i32 %dynamic-slice.5431.9.start_idx0, 0
  %187 = add i32 %dynamic-slice.5431.9.start_idx1, %3
  %188 = getelementptr inbounds [192 x [20 x double]], ptr %arg6, i32 0, i32 %186, i32 %187
  %189 = load double, ptr %188, align 8, !invariant.load !349
  %add.9922.9 = fadd double %177, %189
  %190 = trunc i8 %24 to i1
  %191 = select i1 %190, double %add.9922.9, double %constant_5033_10
  %192 = getelementptr double, ptr %arg8, i32 %linear_index
  %193 = getelementptr inbounds double, ptr %192, i32 0
  %194 = load double, ptr %193, align 8, !invariant.load !349
  %195 = trunc i8 %24 to i1
  %196 = select i1 %195, double %194, double %constant_5033_10
  %multiply.11764.9 = fmul double %173, %add.9925.5
  %197 = trunc i64 %12 to i32
  %198 = icmp sge i32 0, %197
  %199 = select i1 %198, i32 0, i32 %197
  %200 = icmp sle i32 191, %199
  %dynamic-slice.5446.5.start_idx0 = select i1 %200, i32 191, i32 %199
  %constant_5031_413 = load i64, ptr @226, align 8
  %201 = trunc i64 %constant_5031_413 to i32
  %202 = icmp sge i32 0, %201
  %203 = select i1 %202, i32 0, i32 %201
  %204 = icmp sle i32 0, %203
  %dynamic-slice.5446.5.start_idx1 = select i1 %204, i32 0, i32 %203
  %205 = add i32 %dynamic-slice.5446.5.start_idx0, 0
  %206 = add i32 %dynamic-slice.5446.5.start_idx1, %3
  %207 = getelementptr inbounds [192 x [20 x double]], ptr %arg7, i32 0, i32 %205, i32 %206
  %208 = load double, ptr %207, align 8, !invariant.load !349
  %multiply.11765.7 = fmul double %multiply.11764.9, %208
  %add.9928.5 = fadd double %196, %multiply.11765.7
  %add.9929.5 = fadd double %191, %add.9928.5
  %209 = trunc i64 %12 to i32
  %210 = icmp sge i32 0, %209
  %211 = select i1 %210, i32 0, i32 %209
  %212 = icmp sle i32 191, %211
  %dynamic-slice.5447.5.start_idx0 = select i1 %212, i32 191, i32 %211
  %constant_5031_414 = load i64, ptr @226, align 8
  %213 = trunc i64 %constant_5031_414 to i32
  %214 = icmp sge i32 0, %213
  %215 = select i1 %214, i32 0, i32 %213
  %216 = icmp sle i32 0, %215
  %dynamic-slice.5447.5.start_idx1 = select i1 %216, i32 0, i32 %215
  %217 = add i32 %dynamic-slice.5447.5.start_idx0, 0
  %218 = add i32 %dynamic-slice.5447.5.start_idx1, %3
  %219 = getelementptr inbounds [192 x [20 x double]], ptr %arg3, i32 0, i32 %217, i32 %218
  %220 = load double, ptr %219, align 8, !invariant.load !349
  %multiply.11766.5 = fmul double %add.9929.5, %220
  %multiply.11767.7 = fmul double %multiply.11766.5, %161
  %221 = trunc i64 %12 to i32
  %222 = icmp sge i32 0, %221
  %223 = select i1 %222, i32 0, i32 %221
  %224 = icmp sle i32 191, %223
  %dynamic-slice.5448.1.start_idx0 = select i1 %224, i32 191, i32 %223
  %constant_5031_415 = load i64, ptr @226, align 8
  %225 = trunc i64 %constant_5031_415 to i32
  %226 = icmp sge i32 0, %225
  %227 = select i1 %226, i32 0, i32 %225
  %228 = icmp sle i32 0, %227
  %dynamic-slice.5448.1.start_idx1 = select i1 %228, i32 0, i32 %227
  %229 = add i32 %dynamic-slice.5448.1.start_idx0, 0
  %230 = add i32 %dynamic-slice.5448.1.start_idx1, %3
  %231 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %229, i32 %230
  %232 = load double, ptr %231, align 8, !invariant.load !349
  %multiply.11768.5 = fmul double %multiply.11767.7, %232
  %233 = fneg double %multiply.11768.5
  %add.9930.1 = fadd double %add.9927.3, %233
  %234 = insertvalue { double, double, double, double } undef, double %add.9930.1, 0
  %235 = getelementptr double, ptr %arg22, i32 %linear_index
  %236 = getelementptr inbounds double, ptr %235, i32 0
  %237 = load double, ptr %236, align 8, !invariant.load !349
  %238 = trunc i8 %24 to i1
  %239 = select i1 %238, double %constant_5033_10, double %237
  %240 = insertvalue { double, double, double, double } %234, double %239, 1
  %241 = getelementptr double, ptr %arg23, i32 %linear_index
  %242 = getelementptr inbounds double, ptr %241, i32 0
  %243 = load double, ptr %242, align 8, !invariant.load !349
  %244 = trunc i8 %24 to i1
  %245 = select i1 %244, double %constant_5033_10, double %243
  %246 = insertvalue { double, double, double, double } %240, double %245, 2
  %247 = getelementptr double, ptr %arg24, i32 %linear_index
  %248 = getelementptr inbounds double, ptr %247, i32 0
  %249 = load double, ptr %248, align 8, !invariant.load !349
  %250 = trunc i8 %24 to i1
  %251 = select i1 %250, double %constant_5033_10, double %249
  %252 = insertvalue { double, double, double, double } %246, double %251, 3
  %253 = extractvalue { double, double, double, double } %252, 0
  %254 = getelementptr double, ptr %arg25, i32 %linear_index
  %255 = getelementptr inbounds double, ptr %254, i32 0
  store double %253, ptr %255, align 8
  %256 = extractvalue { double, double, double, double } %252, 1
  %257 = getelementptr double, ptr %arg26, i32 %linear_index
  %258 = getelementptr inbounds double, ptr %257, i32 0
  store double %256, ptr %258, align 8
  %259 = extractvalue { double, double, double, double } %252, 2
  %260 = getelementptr double, ptr %arg27, i32 %linear_index
  %261 = getelementptr inbounds double, ptr %260, i32 0
  store double %259, ptr %261, align 8
  %262 = extractvalue { double, double, double, double } %252, 3
  %263 = getelementptr double, ptr %arg28, i32 %linear_index
  %264 = getelementptr inbounds double, ptr %263, i32 0
  store double %262, ptr %264, align 8
  br label %loop_add_select_fusion.7.in_bounds-after
}

define void @loop_multiply_negate_fusion_3(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_multiply_negate_fusion.3.in_bounds-true, label %loop_multiply_negate_fusion.3.in_bounds-after

loop_multiply_negate_fusion.3.in_bounds-after:    ; preds = %loop_multiply_negate_fusion.3.in_bounds-true, %entry
  ret void

loop_multiply_negate_fusion.3.in_bounds-true:     ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = load double, ptr %arg3, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg2, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %12 = getelementptr double, ptr %arg1, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !349
  %multiply.11749.2.clone.1 = fmul double %11, %14
  %15 = fneg double %multiply.11749.2.clone.1
  %multiply.11751.1.clone.1 = fmul double %8, %15
  %16 = getelementptr double, ptr %arg1, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !349
  %multiply.11752.1.clone.1 = fmul double %multiply.11751.1.clone.1, %18
  %multiply.11753.1 = fmul double %7, %multiply.11752.1.clone.1
  %19 = insertvalue { double, double, double } undef, double %multiply.11753.1, 0
  %20 = insertvalue { double, double, double } %19, double %multiply.11752.1.clone.1, 1
  %21 = getelementptr double, ptr %arg1, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  %23 = load double, ptr %22, align 8, !invariant.load !349
  %multiply.11750.1.clone.1 = fmul double %15, %23
  %24 = fneg double %multiply.11750.1.clone.1
  %25 = insertvalue { double, double, double } %20, double %24, 2
  %26 = extractvalue { double, double, double } %25, 0
  %27 = getelementptr double, ptr %arg4, i32 %linear_index
  %28 = getelementptr inbounds double, ptr %27, i32 0
  store double %26, ptr %28, align 8
  %29 = extractvalue { double, double, double } %25, 1
  %30 = getelementptr double, ptr %arg5, i32 %linear_index
  %31 = getelementptr inbounds double, ptr %30, i32 0
  store double %29, ptr %31, align 8
  %32 = extractvalue { double, double, double } %25, 2
  %33 = getelementptr double, ptr %arg6, i32 %linear_index
  %34 = getelementptr inbounds double, ptr %33, i32 0
  store double %32, ptr %34, align 8
  br label %loop_multiply_negate_fusion.3.in_bounds-after
}

define void @loop_broadcast_multiply_select_fusion_3(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(20) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_broadcast_multiply_select_fusion.3.in_bounds-true, label %loop_broadcast_multiply_select_fusion.3.in_bounds-after

loop_broadcast_multiply_select_fusion.3.in_bounds-after: ; preds = %loop_broadcast_multiply_select_fusion.3.in_bounds-true, %entry
  ret void

loop_broadcast_multiply_select_fusion.3.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr i8, ptr %arg2, i32 %linear_index
  %9 = getelementptr inbounds i8, ptr %8, i32 0
  %10 = load i8, ptr %9, align 1, !invariant.load !349
  %11 = getelementptr double, ptr %arg3, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !349
  %constant_5190_2_clone_1 = load double, ptr @230, align 8
  %14 = trunc i8 %10 to i1
  %15 = select i1 %14, double %13, double %constant_5190_2_clone_1
  %16 = load double, ptr %arg1, align 8, !invariant.load !349
  %multiply.11754.1 = fmul double %15, %16
  %multiply.11755.1 = fmul double %7, %multiply.11754.1
  %17 = insertvalue { double, double, double } undef, double %multiply.11755.1, 0
  %18 = insertvalue { double, double, double } %17, double %15, 1
  %19 = insertvalue { double, double, double } %18, double %constant_5190_2_clone_1, 2
  %20 = extractvalue { double, double, double } %19, 0
  %21 = getelementptr double, ptr %arg4, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  store double %20, ptr %22, align 8
  %23 = extractvalue { double, double, double } %19, 1
  %24 = getelementptr double, ptr %arg5, i32 %linear_index
  %25 = getelementptr inbounds double, ptr %24, i32 0
  store double %23, ptr %25, align 8
  %26 = extractvalue { double, double, double } %19, 2
  %27 = getelementptr double, ptr %arg6, i32 %linear_index
  %28 = getelementptr inbounds double, ptr %27, i32 0
  store double %26, ptr %28, align 8
  br label %loop_broadcast_multiply_select_fusion.3.in_bounds-after
}

define void @loop_add_select_fusion_6(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(3840) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(30720) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(30720) %arg6, ptr noalias align 128 dereferenceable(30720) %arg7, ptr noalias align 128 dereferenceable(30720) %arg8, ptr noalias align 128 dereferenceable(30720) %arg9, ptr noalias align 128 dereferenceable(30720) %arg10, ptr noalias align 128 dereferenceable(30720) %arg11, ptr noalias align 128 dereferenceable(30720) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 128 dereferenceable(30720) %arg14, ptr noalias align 128 dereferenceable(160) %arg15, ptr noalias align 128 dereferenceable(30720) %arg16, ptr noalias align 128 dereferenceable(30720) %arg17, ptr noalias align 128 dereferenceable(30720) %arg18, ptr noalias align 128 dereferenceable(160) %arg19, ptr noalias align 128 dereferenceable(30720) %arg20, ptr noalias align 128 dereferenceable(30720) %arg21, ptr noalias align 128 dereferenceable(30720) %arg22, ptr noalias align 128 dereferenceable(160) %arg23, ptr noalias align 128 dereferenceable(15360) %arg24, ptr noalias align 128 dereferenceable(3840) %arg25, ptr noalias align 128 dereferenceable(30720) %arg26, ptr noalias align 128 dereferenceable(3840) %arg27, ptr noalias align 128 dereferenceable(160) %arg28, ptr noalias align 128 dereferenceable(160) %arg29, ptr noalias align 128 dereferenceable(3840) %arg30, ptr noalias align 128 dereferenceable(30720) %arg31, ptr noalias align 128 dereferenceable(160) %arg32, ptr noalias align 128 dereferenceable(160) %arg33, ptr noalias align 128 dereferenceable(160) %arg34, ptr noalias align 128 dereferenceable(160) %arg35, ptr noalias align 128 dereferenceable(30720) %arg36, ptr noalias align 128 dereferenceable(160) %arg37, ptr noalias align 128 dereferenceable(160) %arg38, ptr noalias align 128 dereferenceable(30720) %arg39, ptr noalias align 128 dereferenceable(30720) %arg40, ptr noalias align 128 dereferenceable(3840) %arg41, ptr noalias align 128 dereferenceable(160) %arg42, ptr noalias align 128 dereferenceable(3840) %arg43, ptr noalias align 128 dereferenceable(30720) %arg44, ptr noalias align 128 dereferenceable(30720) %arg45, ptr noalias align 128 dereferenceable(30720) %arg46, ptr noalias align 128 dereferenceable(160) %arg47, ptr noalias align 128 dereferenceable(30720) %arg48, ptr noalias align 128 dereferenceable(160) %arg49, ptr noalias align 128 dereferenceable(160) %arg50, ptr noalias align 128 dereferenceable(30720) %arg51, ptr noalias align 128 dereferenceable(30720) %arg52, ptr noalias align 128 dereferenceable(1536) %arg53, ptr noalias align 128 dereferenceable(30720) %arg54, ptr noalias align 128 dereferenceable(160) %arg55, ptr noalias align 128 dereferenceable(160) %arg56, ptr noalias align 128 dereferenceable(30720) %arg57, ptr noalias align 128 dereferenceable(160) %arg58, ptr noalias align 128 dereferenceable(160) %arg59, ptr noalias align 128 dereferenceable(160) %arg60, ptr noalias align 128 dereferenceable(30720) %arg61, ptr noalias align 128 dereferenceable(160) %arg62, ptr noalias align 128 dereferenceable(160) %arg63, ptr noalias align 128 dereferenceable(160) %arg64, ptr noalias align 128 dereferenceable(30720) %arg65, ptr noalias align 128 dereferenceable(30720) %arg66, ptr noalias align 128 dereferenceable(30720) %arg67, ptr noalias align 128 dereferenceable(30720) %arg68, ptr noalias align 128 dereferenceable(30720) %arg69, ptr noalias align 128 dereferenceable(3840) %arg70, ptr noalias align 128 dereferenceable(30720) %arg71, ptr noalias align 128 dereferenceable(30720) %arg72, ptr noalias align 128 dereferenceable(30720) %arg73, ptr noalias align 128 dereferenceable(3840) %arg74, ptr noalias align 128 dereferenceable(160) %arg75, ptr noalias align 128 dereferenceable(30720) %arg76) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_select_fusion.6.in_bounds-true, label %loop_add_select_fusion.6.in_bounds-after

loop_add_select_fusion.6.in_bounds-after:         ; preds = %loop_add_select_fusion.6.in_bounds-true, %entry
  ret void

loop_add_select_fusion.6.in_bounds-true:          ; preds = %entry
  %constant_5038_18 = load i64, ptr @233, align 8
  %5 = load i64, ptr %arg2, align 8, !invariant.load !349
  %6 = sub i64 %constant_5038_18, %5
  %constant_5031_9 = load i64, ptr @232, align 8
  %7 = icmp slt i64 %6, %constant_5031_9
  %8 = zext i1 %7 to i8
  %constant_5039_18 = load i64, ptr @234, align 8
  %9 = load i64, ptr %arg2, align 8, !invariant.load !349
  %10 = sub i64 %constant_5039_18, %9
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, i64 %10, i64 %6
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.5430.17.start_idx0 = select i1 %16, i32 191, i32 %15
  %constant_5031_91 = load i64, ptr @232, align 8
  %17 = trunc i64 %constant_5031_91 to i32
  %18 = icmp sge i32 0, %17
  %19 = select i1 %18, i32 0, i32 %17
  %20 = icmp sle i32 0, %19
  %dynamic-slice.5430.17.start_idx1 = select i1 %20, i32 0, i32 %19
  %21 = add i32 %dynamic-slice.5430.17.start_idx0, 0
  %22 = add i32 %dynamic-slice.5430.17.start_idx1, %3
  %23 = getelementptr inbounds [192 x [20 x i8]], ptr %arg1, i32 0, i32 %21, i32 %22
  %24 = load i8, ptr %23, align 1, !invariant.load !349
  %constant_5033_12 = load double, ptr @231, align 8
  %25 = getelementptr double, ptr %arg0, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  %27 = load double, ptr %26, align 8
  %28 = trunc i8 %24 to i1
  %29 = select i1 %28, double %constant_5033_12, double %27
  %30 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } undef, double %29, 0
  %31 = getelementptr double, ptr %arg19, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  %33 = load double, ptr %32, align 8
  %34 = trunc i8 %24 to i1
  %35 = select i1 %34, double %constant_5033_12, double %33
  %36 = getelementptr double, ptr %arg5, i32 %linear_index
  %37 = getelementptr inbounds double, ptr %36, i32 0
  %38 = load double, ptr %37, align 8, !invariant.load !349
  %39 = trunc i64 %12 to i32
  %40 = icmp sge i32 0, %39
  %41 = select i1 %40, i32 0, i32 %39
  %42 = icmp sle i32 191, %41
  %dynamic-slice.5454.1.clone.1.start_idx0 = select i1 %42, i32 191, i32 %41
  %constant_5031_92 = load i64, ptr @232, align 8
  %43 = trunc i64 %constant_5031_92 to i32
  %44 = icmp sge i32 0, %43
  %45 = select i1 %44, i32 0, i32 %43
  %46 = icmp sle i32 0, %45
  %dynamic-slice.5454.1.clone.1.start_idx1 = select i1 %46, i32 0, i32 %45
  %47 = add i32 %dynamic-slice.5454.1.clone.1.start_idx0, 0
  %48 = add i32 %dynamic-slice.5454.1.clone.1.start_idx1, %3
  %49 = getelementptr inbounds [192 x [20 x double]], ptr %arg31, i32 0, i32 %47, i32 %48
  %50 = load double, ptr %49, align 8, !invariant.load !349
  %51 = trunc i64 %12 to i32
  %52 = icmp sge i32 0, %51
  %53 = select i1 %52, i32 0, i32 %51
  %54 = icmp sle i32 191, %53
  %dynamic-slice.5467.3.clone.1.start_idx0 = select i1 %54, i32 191, i32 %53
  %constant_5031_93 = load i64, ptr @232, align 8
  %55 = trunc i64 %constant_5031_93 to i32
  %56 = icmp sge i32 0, %55
  %57 = select i1 %56, i32 0, i32 %55
  %58 = icmp sle i32 0, %57
  %dynamic-slice.5467.3.clone.1.start_idx1 = select i1 %58, i32 0, i32 %57
  %59 = add i32 %dynamic-slice.5467.3.clone.1.start_idx0, 0
  %60 = add i32 %dynamic-slice.5467.3.clone.1.start_idx1, %3
  %61 = getelementptr inbounds [192 x [20 x i8]], ptr %arg30, i32 0, i32 %59, i32 %60
  %62 = load i8, ptr %61, align 1, !invariant.load !349
  %63 = getelementptr double, ptr %arg29, i32 %linear_index
  %64 = getelementptr inbounds double, ptr %63, i32 0
  %65 = load double, ptr %64, align 8
  %66 = trunc i8 %24 to i1
  %67 = select i1 %66, double %65, double %constant_5033_12
  %68 = getelementptr double, ptr %arg28, i32 %linear_index
  %69 = getelementptr inbounds double, ptr %68, i32 0
  %70 = load double, ptr %69, align 8
  %71 = trunc i8 %24 to i1
  %72 = select i1 %71, double %70, double %constant_5033_12
  %73 = trunc i64 %12 to i32
  %74 = icmp sge i32 0, %73
  %75 = select i1 %74, i32 0, i32 %73
  %76 = icmp sle i32 191, %75
  %dynamic-slice.5436.31.clone.1.start_idx0 = select i1 %76, i32 191, i32 %75
  %constant_5031_94 = load i64, ptr @232, align 8
  %77 = trunc i64 %constant_5031_94 to i32
  %78 = icmp sge i32 0, %77
  %79 = select i1 %78, i32 0, i32 %77
  %80 = icmp sle i32 0, %79
  %dynamic-slice.5436.31.clone.1.start_idx1 = select i1 %80, i32 0, i32 %79
  %81 = add i32 %dynamic-slice.5436.31.clone.1.start_idx0, 0
  %82 = add i32 %dynamic-slice.5436.31.clone.1.start_idx1, %3
  %83 = getelementptr inbounds [192 x [20 x i8]], ptr %arg27, i32 0, i32 %81, i32 %82
  %84 = load i8, ptr %83, align 1, !invariant.load !349
  %85 = trunc i64 %12 to i32
  %86 = icmp sge i32 0, %85
  %87 = select i1 %86, i32 0, i32 %85
  %88 = icmp sle i32 191, %87
  %dynamic-slice.5437.13.clone.1.start_idx0 = select i1 %88, i32 191, i32 %87
  %constant_5031_95 = load i64, ptr @232, align 8
  %89 = trunc i64 %constant_5031_95 to i32
  %90 = icmp sge i32 0, %89
  %91 = select i1 %90, i32 0, i32 %89
  %92 = icmp sle i32 0, %91
  %dynamic-slice.5437.13.clone.1.start_idx1 = select i1 %92, i32 0, i32 %91
  %93 = add i32 %dynamic-slice.5437.13.clone.1.start_idx0, 0
  %94 = add i32 %dynamic-slice.5437.13.clone.1.start_idx1, %3
  %95 = getelementptr inbounds [192 x [20 x double]], ptr %arg26, i32 0, i32 %93, i32 %94
  %96 = load double, ptr %95, align 8, !invariant.load !349
  %97 = trunc i64 %12 to i32
  %98 = icmp sge i32 0, %97
  %99 = select i1 %98, i32 0, i32 %97
  %100 = icmp sle i32 191, %99
  %dynamic-slice.5438.37.clone.1.start_idx0 = select i1 %100, i32 191, i32 %99
  %constant_5031_96 = load i64, ptr @232, align 8
  %101 = trunc i64 %constant_5031_96 to i32
  %102 = icmp sge i32 0, %101
  %103 = select i1 %102, i32 0, i32 %101
  %104 = icmp sle i32 0, %103
  %dynamic-slice.5438.37.clone.1.start_idx1 = select i1 %104, i32 0, i32 %103
  %105 = add i32 %dynamic-slice.5438.37.clone.1.start_idx0, 0
  %106 = add i32 %dynamic-slice.5438.37.clone.1.start_idx1, %3
  %107 = getelementptr inbounds [192 x [20 x i8]], ptr %arg25, i32 0, i32 %105, i32 %106
  %108 = load i8, ptr %107, align 1, !invariant.load !349
  %109 = trunc i64 %12 to i32
  %110 = icmp sge i32 0, %109
  %111 = select i1 %110, i32 0, i32 %109
  %112 = icmp sle i32 191, %111
  %dynamic-slice.5439.44.clone.1.start_idx0 = select i1 %112, i32 191, i32 %111
  %constant_5031_97 = load i64, ptr @232, align 8
  %113 = trunc i64 %constant_5031_97 to i32
  %114 = icmp sge i32 0, %113
  %115 = select i1 %114, i32 0, i32 %113
  %116 = icmp sle i32 0, %115
  %dynamic-slice.5439.44.clone.1.start_idx1 = select i1 %116, i32 0, i32 %115
  %117 = add i32 %dynamic-slice.5439.44.clone.1.start_idx0, 0
  %118 = add i32 %dynamic-slice.5439.44.clone.1.start_idx1, %3
  %119 = getelementptr inbounds [192 x [20 x i32]], ptr %arg24, i32 0, i32 %117, i32 %118
  %120 = load i32, ptr %119, align 4, !invariant.load !349
  %constant_5034_1_clone_1 = load i32, ptr @236, align 4
  %121 = icmp eq i32 %120, %constant_5034_1_clone_1
  %122 = zext i1 %121 to i8
  %123 = getelementptr double, ptr %arg23, i32 %linear_index
  %124 = getelementptr inbounds double, ptr %123, i32 0
  %125 = load double, ptr %124, align 8
  %126 = trunc i8 %24 to i1
  %127 = select i1 %126, double %125, double %constant_5033_12
  %128 = trunc i8 %122 to i1
  %129 = select i1 %128, double %127, double %constant_5033_12
  %130 = trunc i8 %108 to i1
  %131 = select i1 %130, double %129, double %constant_5033_12
  %132 = trunc i64 %12 to i32
  %133 = icmp sge i32 0, %132
  %134 = select i1 %133, i32 0, i32 %132
  %135 = icmp sle i32 191, %134
  %dynamic-slice.5440.68.clone.1.start_idx0 = select i1 %135, i32 191, i32 %134
  %constant_5031_98 = load i64, ptr @232, align 8
  %136 = trunc i64 %constant_5031_98 to i32
  %137 = icmp sge i32 0, %136
  %138 = select i1 %137, i32 0, i32 %136
  %139 = icmp sle i32 0, %138
  %dynamic-slice.5440.68.clone.1.start_idx1 = select i1 %139, i32 0, i32 %138
  %140 = add i32 %dynamic-slice.5440.68.clone.1.start_idx0, 0
  %141 = add i32 %dynamic-slice.5440.68.clone.1.start_idx1, %3
  %142 = getelementptr inbounds [192 x [20 x double]], ptr %arg22, i32 0, i32 %140, i32 %141
  %143 = load double, ptr %142, align 8, !invariant.load !349
  %multiply.11756.31.clone.1 = fmul double %131, %143
  %144 = fneg double %multiply.11756.31.clone.1
  %multiply.11757.17.clone.1 = fmul double %96, %144
  %145 = trunc i64 %12 to i32
  %146 = icmp sge i32 0, %145
  %147 = select i1 %146, i32 0, i32 %145
  %148 = icmp sle i32 191, %147
  %dynamic-slice.5441.13.clone.1.start_idx0 = select i1 %148, i32 191, i32 %147
  %constant_5031_99 = load i64, ptr @232, align 8
  %149 = trunc i64 %constant_5031_99 to i32
  %150 = icmp sge i32 0, %149
  %151 = select i1 %150, i32 0, i32 %149
  %152 = icmp sle i32 0, %151
  %dynamic-slice.5441.13.clone.1.start_idx1 = select i1 %152, i32 0, i32 %151
  %153 = add i32 %dynamic-slice.5441.13.clone.1.start_idx0, 0
  %154 = add i32 %dynamic-slice.5441.13.clone.1.start_idx1, %3
  %155 = getelementptr inbounds [192 x [20 x double]], ptr %arg21, i32 0, i32 %153, i32 %154
  %156 = load double, ptr %155, align 8, !invariant.load !349
  %multiply.11758.15.clone.1 = fmul double %156, %multiply.11756.31.clone.1
  %add.9923.15.clone.1 = fadd double %multiply.11757.17.clone.1, %multiply.11758.15.clone.1
  %157 = trunc i8 %84 to i1
  %158 = select i1 %157, double %add.9923.15.clone.1, double %constant_5033_12
  %159 = trunc i64 %12 to i32
  %160 = icmp sge i32 0, %159
  %161 = select i1 %160, i32 0, i32 %159
  %162 = icmp sle i32 191, %161
  %dynamic-slice.5442.13.clone.1.start_idx0 = select i1 %162, i32 191, i32 %161
  %constant_5031_910 = load i64, ptr @232, align 8
  %163 = trunc i64 %constant_5031_910 to i32
  %164 = icmp sge i32 0, %163
  %165 = select i1 %164, i32 0, i32 %163
  %166 = icmp sle i32 0, %165
  %dynamic-slice.5442.13.clone.1.start_idx1 = select i1 %166, i32 0, i32 %165
  %167 = add i32 %dynamic-slice.5442.13.clone.1.start_idx0, 0
  %168 = add i32 %dynamic-slice.5442.13.clone.1.start_idx1, %3
  %169 = getelementptr inbounds [192 x [20 x double]], ptr %arg20, i32 0, i32 %167, i32 %168
  %170 = load double, ptr %169, align 8, !invariant.load !349
  %171 = getelementptr double, ptr %arg19, i32 %linear_index
  %172 = getelementptr inbounds double, ptr %171, i32 0
  %173 = load double, ptr %172, align 8
  %174 = trunc i8 %24 to i1
  %175 = select i1 %174, double %173, double %constant_5033_12
  %multiply.11759.37.clone.1 = fmul double %175, %143
  %176 = trunc i64 %12 to i32
  %177 = icmp sge i32 0, %176
  %178 = select i1 %177, i32 0, i32 %176
  %179 = icmp sle i32 191, %178
  %dynamic-slice.5443.33.clone.1.start_idx0 = select i1 %179, i32 191, i32 %178
  %constant_5031_911 = load i64, ptr @232, align 8
  %180 = trunc i64 %constant_5031_911 to i32
  %181 = icmp sge i32 0, %180
  %182 = select i1 %181, i32 0, i32 %180
  %183 = icmp sle i32 0, %182
  %dynamic-slice.5443.33.clone.1.start_idx1 = select i1 %183, i32 0, i32 %182
  %184 = add i32 %dynamic-slice.5443.33.clone.1.start_idx0, 0
  %185 = add i32 %dynamic-slice.5443.33.clone.1.start_idx1, %3
  %186 = getelementptr inbounds [192 x [20 x double]], ptr %arg18, i32 0, i32 %184, i32 %185
  %187 = load double, ptr %186, align 8, !invariant.load !349
  %multiply.11760.33.clone.1 = fmul double %multiply.11759.37.clone.1, %187
  %multiply.11761.15.clone.1 = fmul double %170, %multiply.11760.33.clone.1
  %add.9924.15.clone.1 = fadd double %158, %multiply.11761.15.clone.1
  %add.9925.13.clone.1 = fadd double %72, %add.9924.15.clone.1
  %188 = trunc i64 %12 to i32
  %189 = icmp sge i32 0, %188
  %190 = select i1 %189, i32 0, i32 %188
  %191 = icmp sle i32 191, %190
  %dynamic-slice.5459.7.clone.1.start_idx0 = select i1 %191, i32 191, i32 %190
  %constant_5031_912 = load i64, ptr @232, align 8
  %192 = trunc i64 %constant_5031_912 to i32
  %193 = icmp sge i32 0, %192
  %194 = select i1 %193, i32 0, i32 %192
  %195 = icmp sle i32 0, %194
  %dynamic-slice.5459.7.clone.1.start_idx1 = select i1 %195, i32 0, i32 %194
  %196 = add i32 %dynamic-slice.5459.7.clone.1.start_idx0, 0
  %197 = add i32 %dynamic-slice.5459.7.clone.1.start_idx1, %3
  %198 = getelementptr inbounds [192 x [20 x double]], ptr %arg17, i32 0, i32 %196, i32 %197
  %199 = load double, ptr %198, align 8, !invariant.load !349
  %multiply.11779.9.clone.1 = fmul double %add.9925.13.clone.1, %199
  %200 = trunc i64 %12 to i32
  %201 = icmp sge i32 0, %200
  %202 = select i1 %201, i32 0, i32 %200
  %203 = icmp sle i32 191, %202
  %dynamic-slice.5455.8.clone.1.start_idx0 = select i1 %203, i32 191, i32 %202
  %constant_5031_913 = load i64, ptr @232, align 8
  %204 = trunc i64 %constant_5031_913 to i32
  %205 = icmp sge i32 0, %204
  %206 = select i1 %205, i32 0, i32 %204
  %207 = icmp sle i32 0, %206
  %dynamic-slice.5455.8.clone.1.start_idx1 = select i1 %207, i32 0, i32 %206
  %208 = add i32 %dynamic-slice.5455.8.clone.1.start_idx0, 0
  %209 = add i32 %dynamic-slice.5455.8.clone.1.start_idx1, %3
  %210 = getelementptr inbounds [192 x [20 x double]], ptr %arg16, i32 0, i32 %208, i32 %209
  %211 = load double, ptr %210, align 8, !invariant.load !349
  %divide.2542.17.clone.1 = fdiv double %add.9925.13.clone.1, %211
  %add.9953.15.clone.1 = fadd double %multiply.11779.9.clone.1, %divide.2542.17.clone.1
  %add.9955.13.clone.1 = fadd double %67, %add.9953.15.clone.1
  %212 = getelementptr double, ptr %arg15, i32 %linear_index
  %213 = getelementptr inbounds double, ptr %212, i32 0
  %214 = load double, ptr %213, align 8, !invariant.load !349
  %add.9956.11.clone.1 = fadd double %add.9955.13.clone.1, %214
  %215 = trunc i64 %12 to i32
  %216 = icmp sge i32 0, %215
  %217 = select i1 %216, i32 0, i32 %215
  %218 = icmp sle i32 191, %217
  %dynamic-slice.5460.7.clone.1.start_idx0 = select i1 %218, i32 191, i32 %217
  %constant_5031_914 = load i64, ptr @232, align 8
  %219 = trunc i64 %constant_5031_914 to i32
  %220 = icmp sge i32 0, %219
  %221 = select i1 %220, i32 0, i32 %219
  %222 = icmp sle i32 0, %221
  %dynamic-slice.5460.7.clone.1.start_idx1 = select i1 %222, i32 0, i32 %221
  %223 = add i32 %dynamic-slice.5460.7.clone.1.start_idx0, 0
  %224 = add i32 %dynamic-slice.5460.7.clone.1.start_idx1, %3
  %225 = getelementptr inbounds [192 x [20 x double]], ptr %arg14, i32 0, i32 %223, i32 %224
  %226 = load double, ptr %225, align 8, !invariant.load !349
  %227 = getelementptr double, ptr %arg13, i32 %linear_index
  %228 = getelementptr inbounds double, ptr %227, i32 0
  %229 = load double, ptr %228, align 8
  %230 = trunc i8 %24 to i1
  %231 = select i1 %230, double %229, double %constant_5033_12
  %232 = trunc i64 %12 to i32
  %233 = icmp sge i32 0, %232
  %234 = select i1 %233, i32 0, i32 %232
  %235 = icmp sle i32 191, %234
  %dynamic-slice.5461.13.clone.1.start_idx0 = select i1 %235, i32 191, i32 %234
  %constant_5031_915 = load i64, ptr @232, align 8
  %236 = trunc i64 %constant_5031_915 to i32
  %237 = icmp sge i32 0, %236
  %238 = select i1 %237, i32 0, i32 %236
  %239 = icmp sle i32 0, %238
  %dynamic-slice.5461.13.clone.1.start_idx1 = select i1 %239, i32 0, i32 %238
  %240 = add i32 %dynamic-slice.5461.13.clone.1.start_idx0, 0
  %241 = add i32 %dynamic-slice.5461.13.clone.1.start_idx1, %3
  %242 = getelementptr inbounds [192 x [20 x double]], ptr %arg12, i32 0, i32 %240, i32 %241
  %243 = load double, ptr %242, align 8, !invariant.load !349
  %244 = trunc i64 %12 to i32
  %245 = icmp sge i32 0, %244
  %246 = select i1 %245, i32 0, i32 %244
  %247 = icmp sle i32 191, %246
  %dynamic-slice.5462.51.clone.1.start_idx0 = select i1 %247, i32 191, i32 %246
  %constant_5031_916 = load i64, ptr @232, align 8
  %248 = trunc i64 %constant_5031_916 to i32
  %249 = icmp sge i32 0, %248
  %250 = select i1 %249, i32 0, i32 %248
  %251 = icmp sle i32 0, %250
  %dynamic-slice.5462.51.clone.1.start_idx1 = select i1 %251, i32 0, i32 %250
  %252 = add i32 %dynamic-slice.5462.51.clone.1.start_idx0, 0
  %253 = add i32 %dynamic-slice.5462.51.clone.1.start_idx1, %3
  %254 = getelementptr inbounds [192 x [20 x double]], ptr %arg11, i32 0, i32 %252, i32 %253
  %255 = load double, ptr %254, align 8, !invariant.load !349
  %multiply.11780.17.clone.1 = fmul double %144, %255
  %multiply.11781.19.clone.1 = fmul double %243, %multiply.11780.17.clone.1
  %256 = trunc i64 %12 to i32
  %257 = icmp sge i32 0, %256
  %258 = select i1 %257, i32 0, i32 %256
  %259 = icmp sle i32 191, %258
  %dynamic-slice.5463.13.clone.1.start_idx0 = select i1 %259, i32 191, i32 %258
  %constant_5031_917 = load i64, ptr @232, align 8
  %260 = trunc i64 %constant_5031_917 to i32
  %261 = icmp sge i32 0, %260
  %262 = select i1 %261, i32 0, i32 %260
  %263 = icmp sle i32 0, %262
  %dynamic-slice.5463.13.clone.1.start_idx1 = select i1 %263, i32 0, i32 %262
  %264 = add i32 %dynamic-slice.5463.13.clone.1.start_idx0, 0
  %265 = add i32 %dynamic-slice.5463.13.clone.1.start_idx1, %3
  %266 = getelementptr inbounds [192 x [20 x double]], ptr %arg10, i32 0, i32 %264, i32 %265
  %267 = load double, ptr %266, align 8, !invariant.load !349
  %multiply.11782.19.clone.1 = fmul double %multiply.11756.31.clone.1, %255
  %268 = trunc i64 %12 to i32
  %269 = icmp sge i32 0, %268
  %270 = select i1 %269, i32 0, i32 %268
  %271 = icmp sle i32 191, %270
  %dynamic-slice.5464.34.clone.1.start_idx0 = select i1 %271, i32 191, i32 %270
  %constant_5031_918 = load i64, ptr @232, align 8
  %272 = trunc i64 %constant_5031_918 to i32
  %273 = icmp sge i32 0, %272
  %274 = select i1 %273, i32 0, i32 %272
  %275 = icmp sle i32 0, %274
  %dynamic-slice.5464.34.clone.1.start_idx1 = select i1 %275, i32 0, i32 %274
  %276 = add i32 %dynamic-slice.5464.34.clone.1.start_idx0, 0
  %277 = add i32 %dynamic-slice.5464.34.clone.1.start_idx1, %3
  %278 = getelementptr inbounds [192 x [20 x double]], ptr %arg9, i32 0, i32 %276, i32 %277
  %279 = load double, ptr %278, align 8, !invariant.load !349
  %multiply.11783.17.clone.1 = fmul double %multiply.11782.19.clone.1, %279
  %multiply.11784.15.clone.1 = fmul double %267, %multiply.11783.17.clone.1
  %add.9957.17.clone.1 = fadd double %multiply.11781.19.clone.1, %multiply.11784.15.clone.1
  %constant_5035_2_clone_1 = load double, ptr @238, align 8
  %multiply.11785.19.clone.1 = fmul double %multiply.11756.31.clone.1, %constant_5035_2_clone_1
  %multiply.11786.17.clone.1 = fmul double %multiply.11785.19.clone.1, %279
  %multiply.11787.15.clone.1 = fmul double %267, %multiply.11786.17.clone.1
  %add.9958.15.clone.1 = fadd double %add.9957.17.clone.1, %multiply.11787.15.clone.1
  %280 = trunc i8 %84 to i1
  %281 = select i1 %280, double %add.9958.15.clone.1, double %constant_5033_12
  %multiply.11788.17.clone.1 = fmul double %multiply.11760.33.clone.1, %255
  %multiply.11789.15.clone.1 = fmul double %267, %multiply.11788.17.clone.1
  %add.9959.15.clone.1 = fadd double %281, %multiply.11789.15.clone.1
  %add.9960.15.clone.1 = fadd double %231, %add.9959.15.clone.1
  %282 = getelementptr double, ptr %arg3, i32 %linear_index
  %283 = getelementptr inbounds double, ptr %282, i32 0
  %284 = load double, ptr %283, align 8, !invariant.load !349
  %add.9961.13.clone.1 = fadd double %add.9960.15.clone.1, %284
  %multiply.11790.9.clone.1 = fmul double %226, %add.9961.13.clone.1
  %add.9962.9.clone.1 = fadd double %add.9956.11.clone.1, %multiply.11790.9.clone.1
  %285 = trunc i64 %12 to i32
  %286 = icmp sge i32 0, %285
  %287 = select i1 %286, i32 0, i32 %285
  %288 = icmp sle i32 191, %287
  %dynamic-slice.5465.7.clone.1.start_idx0 = select i1 %288, i32 191, i32 %287
  %constant_5031_919 = load i64, ptr @232, align 8
  %289 = trunc i64 %constant_5031_919 to i32
  %290 = icmp sge i32 0, %289
  %291 = select i1 %290, i32 0, i32 %289
  %292 = icmp sle i32 0, %291
  %dynamic-slice.5465.7.clone.1.start_idx1 = select i1 %292, i32 0, i32 %291
  %293 = add i32 %dynamic-slice.5465.7.clone.1.start_idx0, 0
  %294 = add i32 %dynamic-slice.5465.7.clone.1.start_idx1, %3
  %295 = getelementptr inbounds [192 x [20 x double]], ptr %arg8, i32 0, i32 %293, i32 %294
  %296 = load double, ptr %295, align 8, !invariant.load !349
  %multiply.11791.7.clone.1 = fmul double %add.9962.9.clone.1, %296
  %297 = fneg double %multiply.11791.7.clone.1
  %298 = trunc i64 %12 to i32
  %299 = icmp sge i32 0, %298
  %300 = select i1 %299, i32 0, i32 %298
  %301 = icmp sle i32 191, %300
  %dynamic-slice.5445.9.clone.1.start_idx0 = select i1 %301, i32 191, i32 %300
  %constant_5031_920 = load i64, ptr @232, align 8
  %302 = trunc i64 %constant_5031_920 to i32
  %303 = icmp sge i32 0, %302
  %304 = select i1 %303, i32 0, i32 %302
  %305 = icmp sle i32 0, %304
  %dynamic-slice.5445.9.clone.1.start_idx1 = select i1 %305, i32 0, i32 %304
  %306 = add i32 %dynamic-slice.5445.9.clone.1.start_idx0, 0
  %307 = add i32 %dynamic-slice.5445.9.clone.1.start_idx1, %3
  %308 = getelementptr inbounds [192 x [20 x double]], ptr %arg7, i32 0, i32 %306, i32 %307
  %309 = load double, ptr %308, align 8, !invariant.load !349
  %multiply.11794.9.clone.1 = fmul double %add.9961.13.clone.1, %309
  %add.9970.7.clone.1 = fadd double %297, %multiply.11794.9.clone.1
  %310 = trunc i8 %62 to i1
  %311 = select i1 %310, double %add.9970.7.clone.1, double %constant_5033_12
  %312 = trunc i64 %12 to i32
  %313 = icmp sge i32 0, %312
  %314 = select i1 %313, i32 0, i32 %312
  %315 = icmp sle i32 191, %314
  %dynamic-slice.5468.3.clone.1.start_idx0 = select i1 %315, i32 191, i32 %314
  %constant_5031_921 = load i64, ptr @232, align 8
  %316 = trunc i64 %constant_5031_921 to i32
  %317 = icmp sge i32 0, %316
  %318 = select i1 %317, i32 0, i32 %316
  %319 = icmp sle i32 0, %318
  %dynamic-slice.5468.3.clone.1.start_idx1 = select i1 %319, i32 0, i32 %318
  %320 = add i32 %dynamic-slice.5468.3.clone.1.start_idx0, 0
  %321 = add i32 %dynamic-slice.5468.3.clone.1.start_idx1, %3
  %322 = getelementptr inbounds [192 x [20 x double]], ptr %arg6, i32 0, i32 %320, i32 %321
  %323 = load double, ptr %322, align 8, !invariant.load !349
  %multiply.11795.3.clone.1 = fmul double %311, %323
  %multiply.11796.5.clone.1 = fmul double %50, %multiply.11795.3.clone.1
  %add.9973.3.clone.1 = fadd double %38, %multiply.11796.5.clone.1
  %324 = trunc i64 %12 to i32
  %325 = icmp sge i32 0, %324
  %326 = select i1 %325, i32 0, i32 %324
  %327 = icmp sle i32 191, %326
  %dynamic-slice.5450.1.clone.1.start_idx0 = select i1 %327, i32 191, i32 %326
  %constant_5031_922 = load i64, ptr @232, align 8
  %328 = trunc i64 %constant_5031_922 to i32
  %329 = icmp sge i32 0, %328
  %330 = select i1 %329, i32 0, i32 %328
  %331 = icmp sle i32 0, %330
  %dynamic-slice.5450.1.clone.1.start_idx1 = select i1 %331, i32 0, i32 %330
  %332 = add i32 %dynamic-slice.5450.1.clone.1.start_idx0, 0
  %333 = add i32 %dynamic-slice.5450.1.clone.1.start_idx1, %3
  %334 = getelementptr inbounds [192 x [20 x double]], ptr %arg4, i32 0, i32 %332, i32 %333
  %335 = load double, ptr %334, align 8, !invariant.load !349
  %336 = getelementptr double, ptr %arg0, i32 %linear_index
  %337 = getelementptr inbounds double, ptr %336, i32 0
  %338 = load double, ptr %337, align 8
  %339 = trunc i8 %24 to i1
  %340 = select i1 %339, double %338, double %constant_5033_12
  %add.9974.9.clone.1 = fadd double %340, %175
  %341 = getelementptr double, ptr %arg3, i32 %linear_index
  %342 = getelementptr inbounds double, ptr %341, i32 0
  %343 = load double, ptr %342, align 8, !invariant.load !349
  %add.9975.7.clone.1 = fadd double %add.9974.9.clone.1, %343
  %multiply.11797.5.clone.1 = fmul double %335, %add.9975.7.clone.1
  %add.9976.3.clone.1 = fadd double %add.9973.3.clone.1, %multiply.11797.5.clone.1
  %add.9977.1.clone.1 = fadd double %35, %add.9976.3.clone.1
  %344 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %30, double %add.9977.1.clone.1, 1
  %345 = getelementptr double, ptr %arg33, i32 %linear_index
  %346 = getelementptr inbounds double, ptr %345, i32 0
  %347 = load double, ptr %346, align 8
  %348 = trunc i8 %24 to i1
  %349 = select i1 %348, double %347, double %constant_5033_12
  %350 = getelementptr double, ptr %arg33, i32 %linear_index
  %351 = getelementptr inbounds double, ptr %350, i32 0
  %352 = load double, ptr %351, align 8
  %353 = trunc i8 %24 to i1
  %354 = select i1 %353, double %constant_5033_12, double %352
  %add.9969.3.clone.1 = fadd double %349, %354
  %355 = getelementptr double, ptr %arg32, i32 %linear_index
  %356 = getelementptr inbounds double, ptr %355, i32 0
  %357 = load double, ptr %356, align 8, !invariant.load !349
  %add.9971.1.clone.1 = fadd double %357, %multiply.11795.3.clone.1
  %add.9972.1.clone.1 = fadd double %add.9969.3.clone.1, %add.9971.1.clone.1
  %358 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %344, double %add.9972.1.clone.1, 2
  %359 = getelementptr double, ptr %arg37, i32 %linear_index
  %360 = getelementptr inbounds double, ptr %359, i32 0
  %361 = load double, ptr %360, align 8
  %362 = trunc i8 %24 to i1
  %363 = select i1 %362, double %constant_5033_12, double %361
  %364 = getelementptr double, ptr %arg34, i32 %linear_index
  %365 = getelementptr inbounds double, ptr %364, i32 0
  %366 = load double, ptr %365, align 8, !invariant.load !349
  %367 = trunc i64 %12 to i32
  %368 = icmp sge i32 0, %367
  %369 = select i1 %368, i32 0, i32 %367
  %370 = icmp sle i32 191, %369
  %dynamic-slice.5466.1.clone.1.start_idx0 = select i1 %370, i32 191, i32 %369
  %constant_5031_923 = load i64, ptr @232, align 8
  %371 = trunc i64 %constant_5031_923 to i32
  %372 = icmp sge i32 0, %371
  %373 = select i1 %372, i32 0, i32 %371
  %374 = icmp sle i32 0, %373
  %dynamic-slice.5466.1.clone.1.start_idx1 = select i1 %374, i32 0, i32 %373
  %375 = add i32 %dynamic-slice.5466.1.clone.1.start_idx0, 0
  %376 = add i32 %dynamic-slice.5466.1.clone.1.start_idx1, %3
  %377 = getelementptr inbounds [192 x [20 x double]], ptr %arg36, i32 0, i32 %375, i32 %376
  %378 = load double, ptr %377, align 8, !invariant.load !349
  %multiply.11792.5.clone.1 = fmul double %297, %378
  %379 = fneg double %multiply.11792.5.clone.1
  %380 = getelementptr double, ptr %arg35, i32 %linear_index
  %381 = getelementptr inbounds double, ptr %380, i32 0
  %382 = load double, ptr %381, align 8
  %383 = trunc i8 %24 to i1
  %384 = select i1 %383, double %382, double %constant_5033_12
  %385 = getelementptr double, ptr %arg3, i32 %linear_index
  %386 = getelementptr inbounds double, ptr %385, i32 0
  %387 = load double, ptr %386, align 8, !invariant.load !349
  %add.9963.11.clone.1 = fadd double %384, %387
  %multiply.11793.9.clone.1 = fmul double %add.9963.11.clone.1, %378
  %388 = fneg double %multiply.11793.9.clone.1
  %add.9964.5.clone.1 = fadd double %379, %388
  %add.9965.3.clone.1 = fadd double %366, %add.9964.5.clone.1
  %add.9966.1.clone.1 = fadd double %363, %add.9965.3.clone.1
  %389 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %358, double %add.9966.1.clone.1, 3
  %390 = getelementptr double, ptr %arg13, i32 %linear_index
  %391 = getelementptr inbounds double, ptr %390, i32 0
  %392 = load double, ptr %391, align 8
  %393 = trunc i8 %24 to i1
  %394 = select i1 %393, double %constant_5033_12, double %392
  %395 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %389, double %394, 4
  %396 = trunc i64 %12 to i32
  %397 = icmp sge i32 0, %396
  %398 = select i1 %397, i32 0, i32 %396
  %399 = icmp sle i32 191, %398
  %dynamic-slice.5480.1.clone.1.start_idx0 = select i1 %399, i32 191, i32 %398
  %constant_5031_924 = load i64, ptr @232, align 8
  %400 = trunc i64 %constant_5031_924 to i32
  %401 = icmp sge i32 0, %400
  %402 = select i1 %401, i32 0, i32 %400
  %403 = icmp sle i32 0, %402
  %dynamic-slice.5480.1.clone.1.start_idx1 = select i1 %403, i32 0, i32 %402
  %constant_5031_925 = load i64, ptr @232, align 8
  %404 = trunc i64 %constant_5031_925 to i32
  %405 = icmp sge i32 0, %404
  %406 = select i1 %405, i32 0, i32 %404
  %407 = icmp sle i32 0, %406
  %dynamic-slice.5480.1.clone.1.start_idx2 = select i1 %407, i32 0, i32 %406
  %408 = add i32 %dynamic-slice.5480.1.clone.1.start_idx0, 0
  %409 = add i32 %dynamic-slice.5480.1.clone.1.start_idx1, %3
  %410 = add i32 %dynamic-slice.5480.1.clone.1.start_idx2, 0
  %411 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg43, i32 0, i32 %408, i32 %409, i32 0
  %412 = load i8, ptr %411, align 1, !invariant.load !349
  %413 = getelementptr double, ptr %arg42, i32 %linear_index
  %414 = getelementptr inbounds double, ptr %413, i32 0
  %415 = load double, ptr %414, align 8
  %constant_5033_1226 = load double, ptr @231, align 8
  %416 = trunc i8 %412 to i1
  %417 = select i1 %416, double %415, double %constant_5033_1226
  %418 = getelementptr double, ptr %arg42, i32 %linear_index
  %419 = getelementptr inbounds double, ptr %418, i32 0
  %420 = load double, ptr %419, align 8
  %421 = trunc i8 %412 to i1
  %422 = select i1 %421, double %constant_5033_1226, double %420
  %add.9993.3.clone.1 = fadd double %417, %422
  %423 = trunc i64 %12 to i32
  %424 = icmp sge i32 0, %423
  %425 = select i1 %424, i32 0, i32 %423
  %426 = icmp sle i32 191, %425
  %dynamic-slice.5481.1.clone.1.start_idx0 = select i1 %426, i32 191, i32 %425
  %constant_5031_927 = load i64, ptr @232, align 8
  %427 = trunc i64 %constant_5031_927 to i32
  %428 = icmp sge i32 0, %427
  %429 = select i1 %428, i32 0, i32 %427
  %430 = icmp sle i32 0, %429
  %dynamic-slice.5481.1.clone.1.start_idx1 = select i1 %430, i32 0, i32 %429
  %constant_5031_928 = load i64, ptr @232, align 8
  %431 = trunc i64 %constant_5031_928 to i32
  %432 = icmp sge i32 0, %431
  %433 = select i1 %432, i32 0, i32 %431
  %434 = icmp sle i32 0, %433
  %dynamic-slice.5481.1.clone.1.start_idx2 = select i1 %434, i32 0, i32 %433
  %435 = add i32 %dynamic-slice.5481.1.clone.1.start_idx0, 0
  %436 = add i32 %dynamic-slice.5481.1.clone.1.start_idx1, %3
  %437 = add i32 %dynamic-slice.5481.1.clone.1.start_idx2, 0
  %438 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg41, i32 0, i32 %435, i32 %436, i32 0
  %439 = load i8, ptr %438, align 1, !invariant.load !349
  %440 = trunc i64 %12 to i32
  %441 = icmp sge i32 0, %440
  %442 = select i1 %441, i32 0, i32 %440
  %443 = icmp sle i32 191, %442
  %dynamic-slice.5482.1.clone.1.start_idx0 = select i1 %443, i32 191, i32 %442
  %constant_5031_929 = load i64, ptr @232, align 8
  %444 = trunc i64 %constant_5031_929 to i32
  %445 = icmp sge i32 0, %444
  %446 = select i1 %445, i32 0, i32 %444
  %447 = icmp sle i32 0, %446
  %dynamic-slice.5482.1.clone.1.start_idx1 = select i1 %447, i32 0, i32 %446
  %448 = add i32 %dynamic-slice.5482.1.clone.1.start_idx0, 0
  %449 = add i32 %dynamic-slice.5482.1.clone.1.start_idx1, %3
  %450 = getelementptr inbounds [192 x [20 x double]], ptr %arg40, i32 0, i32 %448, i32 %449
  %451 = load double, ptr %450, align 8, !invariant.load !349
  %multiply.11811.13.clone.1 = fmul double %multiply.11780.17.clone.1, %451
  %multiply.11812.11.clone.1 = fmul double %multiply.11811.13.clone.1, %constant_5035_2_clone_1
  %452 = trunc i64 %12 to i32
  %453 = icmp sge i32 0, %452
  %454 = select i1 %453, i32 0, i32 %452
  %455 = icmp sle i32 191, %454
  %dynamic-slice.5483.1.clone.1.start_idx0 = select i1 %455, i32 191, i32 %454
  %constant_5031_930 = load i64, ptr @232, align 8
  %456 = trunc i64 %constant_5031_930 to i32
  %457 = icmp sge i32 0, %456
  %458 = select i1 %457, i32 0, i32 %456
  %459 = icmp sle i32 0, %458
  %dynamic-slice.5483.1.clone.1.start_idx1 = select i1 %459, i32 0, i32 %458
  %460 = add i32 %dynamic-slice.5483.1.clone.1.start_idx0, 0
  %461 = add i32 %dynamic-slice.5483.1.clone.1.start_idx1, %3
  %462 = getelementptr inbounds [192 x [20 x double]], ptr %arg39, i32 0, i32 %460, i32 %461
  %463 = load double, ptr %462, align 8, !invariant.load !349
  %multiply.11813.9.clone.1 = fmul double %multiply.11812.11.clone.1, %463
  %multiply.11814.11.clone.1 = fmul double %multiply.11783.17.clone.1, %451
  %add.9994.9.clone.1 = fadd double %multiply.11813.9.clone.1, %multiply.11814.11.clone.1
  %multiply.11815.11.clone.1 = fmul double %multiply.11786.17.clone.1, %451
  %add.9995.9.clone.1 = fadd double %add.9994.9.clone.1, %multiply.11815.11.clone.1
  %464 = trunc i8 %439 to i1
  %465 = select i1 %464, double %add.9995.9.clone.1, double %constant_5033_1226
  %multiply.11816.7.clone.1 = fmul double %multiply.11788.17.clone.1, %451
  %add.9996.5.clone.1 = fadd double %465, %multiply.11816.7.clone.1
  %466 = getelementptr double, ptr %arg38, i32 %linear_index
  %467 = getelementptr inbounds double, ptr %466, i32 0
  %468 = load double, ptr %467, align 8, !invariant.load !349
  %add.9997.3.clone.1 = fadd double %add.9996.5.clone.1, %468
  %add.9998.1.clone.1 = fadd double %add.9993.3.clone.1, %add.9997.3.clone.1
  %469 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %395, double %add.9998.1.clone.1, 5
  %470 = getelementptr double, ptr %arg35, i32 %linear_index
  %471 = getelementptr inbounds double, ptr %470, i32 0
  %472 = load double, ptr %471, align 8
  %473 = trunc i8 %24 to i1
  %474 = select i1 %473, double %constant_5033_12, double %472
  %475 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %469, double %474, 6
  %476 = getelementptr double, ptr %arg60, i32 %linear_index
  %477 = getelementptr inbounds double, ptr %476, i32 0
  %478 = load double, ptr %477, align 8
  %479 = trunc i64 %12 to i32
  %480 = icmp sge i32 0, %479
  %481 = select i1 %480, i32 0, i32 %479
  %482 = icmp sle i32 191, %481
  %dynamic-slice.5431.5.clone.1.start_idx0 = select i1 %482, i32 191, i32 %481
  %constant_5031_931 = load i64, ptr @232, align 8
  %483 = trunc i64 %constant_5031_931 to i32
  %484 = icmp sge i32 0, %483
  %485 = select i1 %484, i32 0, i32 %483
  %486 = icmp sle i32 0, %485
  %dynamic-slice.5431.5.clone.1.start_idx1 = select i1 %486, i32 0, i32 %485
  %487 = add i32 %dynamic-slice.5431.5.clone.1.start_idx0, 0
  %488 = add i32 %dynamic-slice.5431.5.clone.1.start_idx1, %3
  %489 = getelementptr inbounds [192 x [20 x double]], ptr %arg61, i32 0, i32 %487, i32 %488
  %490 = load double, ptr %489, align 8, !invariant.load !349
  %add.9922.5.clone.1 = fadd double %478, %490
  %491 = trunc i8 %24 to i1
  %492 = select i1 %491, double %constant_5033_12, double %add.9922.5.clone.1
  %493 = getelementptr double, ptr %arg3, i32 %linear_index
  %494 = getelementptr inbounds double, ptr %493, i32 0
  %495 = load double, ptr %494, align 8, !invariant.load !349
  %496 = getelementptr double, ptr %arg59, i32 %linear_index
  %497 = getelementptr inbounds double, ptr %496, i32 0
  %498 = load double, ptr %497, align 8
  %499 = trunc i8 %24 to i1
  %500 = select i1 %499, double %498, double %constant_5033_12
  %501 = getelementptr double, ptr %arg58, i32 %linear_index
  %502 = getelementptr inbounds double, ptr %501, i32 0
  %503 = load double, ptr %502, align 8
  %504 = trunc i8 %24 to i1
  %505 = select i1 %504, double %503, double %constant_5033_12
  %multiply.11764.7.clone.1 = fmul double %309, %add.9925.13.clone.1
  %506 = trunc i64 %12 to i32
  %507 = icmp sge i32 0, %506
  %508 = select i1 %507, i32 0, i32 %506
  %509 = icmp sle i32 191, %508
  %dynamic-slice.5446.3.clone.1.start_idx0 = select i1 %509, i32 191, i32 %508
  %constant_5031_932 = load i64, ptr @232, align 8
  %510 = trunc i64 %constant_5031_932 to i32
  %511 = icmp sge i32 0, %510
  %512 = select i1 %511, i32 0, i32 %510
  %513 = icmp sle i32 0, %512
  %dynamic-slice.5446.3.clone.1.start_idx1 = select i1 %513, i32 0, i32 %512
  %514 = add i32 %dynamic-slice.5446.3.clone.1.start_idx0, 0
  %515 = add i32 %dynamic-slice.5446.3.clone.1.start_idx1, %3
  %516 = getelementptr inbounds [192 x [20 x double]], ptr %arg57, i32 0, i32 %514, i32 %515
  %517 = load double, ptr %516, align 8, !invariant.load !349
  %multiply.11765.5.clone.1 = fmul double %multiply.11764.7.clone.1, %517
  %add.9928.3.clone.1 = fadd double %505, %multiply.11765.5.clone.1
  %518 = fneg double %add.9928.3.clone.1
  %add.9932.11.clone.1 = fadd double %500, %518
  %519 = trunc i8 %24 to i1
  %520 = select i1 %519, double %add.9922.5.clone.1, double %constant_5033_12
  %add.9929.3.clone.1 = fadd double %520, %add.9928.3.clone.1
  %521 = getelementptr double, ptr %arg3, i32 %linear_index
  %522 = getelementptr inbounds double, ptr %521, i32 0
  %523 = load double, ptr %522, align 8, !invariant.load !349
  %add.9933.7.clone.1 = fadd double %add.9929.3.clone.1, %523
  %add.9934.9.clone.1 = fadd double %add.9932.11.clone.1, %add.9933.7.clone.1
  %524 = getelementptr double, ptr %arg56, i32 %linear_index
  %525 = getelementptr inbounds double, ptr %524, i32 0
  %526 = load double, ptr %525, align 8, !invariant.load !349
  %527 = trunc i8 %24 to i1
  %528 = select i1 %527, double %526, double %constant_5033_12
  %529 = getelementptr double, ptr %arg3, i32 %linear_index
  %530 = getelementptr inbounds double, ptr %529, i32 0
  %531 = load double, ptr %530, align 8, !invariant.load !349
  %add.9935.17.clone.1 = fadd double %528, %531
  %532 = getelementptr double, ptr %arg55, i32 %linear_index
  %533 = getelementptr inbounds double, ptr %532, i32 0
  %534 = load double, ptr %533, align 8
  %535 = trunc i8 %24 to i1
  %536 = select i1 %535, double %534, double %constant_5033_12
  %537 = trunc i64 %12 to i32
  %538 = icmp sge i32 0, %537
  %539 = select i1 %538, i32 0, i32 %537
  %540 = icmp sle i32 191, %539
  %dynamic-slice.5451.6.clone.1.start_idx0 = select i1 %540, i32 191, i32 %539
  %constant_5031_933 = load i64, ptr @232, align 8
  %541 = trunc i64 %constant_5031_933 to i32
  %542 = icmp sge i32 0, %541
  %543 = select i1 %542, i32 0, i32 %541
  %544 = icmp sle i32 0, %543
  %dynamic-slice.5451.6.clone.1.start_idx1 = select i1 %544, i32 0, i32 %543
  %545 = add i32 %dynamic-slice.5451.6.clone.1.start_idx0, 0
  %546 = add i32 %dynamic-slice.5451.6.clone.1.start_idx1, %3
  %547 = getelementptr inbounds [192 x [20 x double]], ptr %arg54, i32 0, i32 %545, i32 %546
  %548 = load double, ptr %547, align 8, !invariant.load !349
  %multiply.11769.11.clone.1 = fmul double %548, %add.9929.3.clone.1
  %549 = trunc i64 %12 to i32
  %550 = icmp sge i32 0, %549
  %551 = select i1 %550, i32 0, i32 %549
  %552 = icmp sle i32 191, %551
  %dynamic-slice.5434.1.clone.1.start_idx0 = select i1 %552, i32 191, i32 %551
  %553 = add i32 %dynamic-slice.5434.1.clone.1.start_idx0, 0
  %554 = getelementptr inbounds [192 x double], ptr %arg53, i32 0, i32 %553
  %555 = load double, ptr %554, align 8, !invariant.load !349
  %multiply.11770.13.clone.1 = fmul double %multiply.11769.11.clone.1, %555
  %556 = getelementptr double, ptr %arg3, i32 %linear_index
  %557 = getelementptr inbounds double, ptr %556, i32 0
  %558 = load double, ptr %557, align 8, !invariant.load !349
  %add.9937.11.clone.1 = fadd double %multiply.11770.13.clone.1, %558
  %add.9938.9.clone.1 = fadd double %536, %add.9937.11.clone.1
  %559 = trunc i64 %12 to i32
  %560 = icmp sge i32 0, %559
  %561 = select i1 %560, i32 0, i32 %559
  %562 = icmp sle i32 191, %561
  %dynamic-slice.5452.6.clone.1.start_idx0 = select i1 %562, i32 191, i32 %561
  %constant_5031_934 = load i64, ptr @232, align 8
  %563 = trunc i64 %constant_5031_934 to i32
  %564 = icmp sge i32 0, %563
  %565 = select i1 %564, i32 0, i32 %563
  %566 = icmp sle i32 0, %565
  %dynamic-slice.5452.6.clone.1.start_idx1 = select i1 %566, i32 0, i32 %565
  %567 = add i32 %dynamic-slice.5452.6.clone.1.start_idx0, 0
  %568 = add i32 %dynamic-slice.5452.6.clone.1.start_idx1, %3
  %569 = getelementptr inbounds [192 x [20 x double]], ptr %arg52, i32 0, i32 %567, i32 %568
  %570 = load double, ptr %569, align 8, !invariant.load !349
  %divide.2540.7.clone.1 = fdiv double %add.9938.9.clone.1, %570
  %multiply.11771.5.clone.1 = fmul double %divide.2540.7.clone.1, %555
  %571 = fneg double %multiply.11771.5.clone.1
  %add.9939.15.clone.1 = fadd double %add.9935.17.clone.1, %571
  %572 = trunc i64 %12 to i32
  %573 = icmp sge i32 0, %572
  %574 = select i1 %573, i32 0, i32 %572
  %575 = icmp sle i32 191, %574
  %dynamic-slice.5453.1.clone.1.start_idx0 = select i1 %575, i32 191, i32 %574
  %constant_5031_935 = load i64, ptr @232, align 8
  %576 = trunc i64 %constant_5031_935 to i32
  %577 = icmp sge i32 0, %576
  %578 = select i1 %577, i32 0, i32 %576
  %579 = icmp sle i32 0, %578
  %dynamic-slice.5453.1.clone.1.start_idx1 = select i1 %579, i32 0, i32 %578
  %580 = add i32 %dynamic-slice.5453.1.clone.1.start_idx0, 0
  %581 = add i32 %dynamic-slice.5453.1.clone.1.start_idx1, %3
  %582 = getelementptr inbounds [192 x [20 x double]], ptr %arg51, i32 0, i32 %580, i32 %581
  %583 = load double, ptr %582, align 8, !invariant.load !349
  %584 = getelementptr double, ptr %arg50, i32 %linear_index
  %585 = getelementptr inbounds double, ptr %584, i32 0
  %586 = load double, ptr %585, align 8, !invariant.load !349
  %587 = trunc i8 %24 to i1
  %588 = select i1 %587, double %586, double %constant_5033_12
  %589 = getelementptr double, ptr %arg49, i32 %linear_index
  %590 = getelementptr inbounds double, ptr %589, i32 0
  %591 = load double, ptr %590, align 8, !invariant.load !349
  %592 = trunc i8 %24 to i1
  %593 = select i1 %592, double %591, double %constant_5033_12
  %add.9940.3.clone.1 = fadd double %588, %593
  %594 = trunc i64 %12 to i32
  %595 = icmp sge i32 0, %594
  %596 = select i1 %595, i32 0, i32 %594
  %597 = icmp sle i32 191, %596
  %dynamic-slice.5447.3.clone.1.start_idx0 = select i1 %597, i32 191, i32 %596
  %constant_5031_936 = load i64, ptr @232, align 8
  %598 = trunc i64 %constant_5031_936 to i32
  %599 = icmp sge i32 0, %598
  %600 = select i1 %599, i32 0, i32 %598
  %601 = icmp sle i32 0, %600
  %dynamic-slice.5447.3.clone.1.start_idx1 = select i1 %601, i32 0, i32 %600
  %602 = add i32 %dynamic-slice.5447.3.clone.1.start_idx0, 0
  %603 = add i32 %dynamic-slice.5447.3.clone.1.start_idx1, %3
  %604 = getelementptr inbounds [192 x [20 x double]], ptr %arg48, i32 0, i32 %602, i32 %603
  %605 = load double, ptr %604, align 8, !invariant.load !349
  %multiply.11766.3.clone.1 = fmul double %add.9929.3.clone.1, %605
  %divide.2541.13.clone.1 = fdiv double %multiply.11766.3.clone.1, %211
  %multiply.11772.11.clone.1 = fmul double %50, %divide.2541.13.clone.1
  %606 = getelementptr double, ptr %arg47, i32 %linear_index
  %607 = getelementptr inbounds double, ptr %606, i32 0
  %608 = load double, ptr %607, align 8, !invariant.load !349
  %add.9942.9.clone.1 = fadd double %multiply.11772.11.clone.1, %608
  %add.9943.7.clone.1 = fadd double %add.9940.3.clone.1, %add.9942.9.clone.1
  %609 = getelementptr double, ptr %arg3, i32 %linear_index
  %610 = getelementptr inbounds double, ptr %609, i32 0
  %611 = load double, ptr %610, align 8, !invariant.load !349
  %add.9944.5.clone.1 = fadd double %add.9943.7.clone.1, %611
  %612 = trunc i64 %12 to i32
  %613 = icmp sge i32 0, %612
  %614 = select i1 %613, i32 0, i32 %612
  %615 = icmp sle i32 191, %614
  %dynamic-slice.5456.1.clone.1.start_idx0 = select i1 %615, i32 191, i32 %614
  %constant_5031_937 = load i64, ptr @232, align 8
  %616 = trunc i64 %constant_5031_937 to i32
  %617 = icmp sge i32 0, %616
  %618 = select i1 %617, i32 0, i32 %616
  %619 = icmp sle i32 0, %618
  %dynamic-slice.5456.1.clone.1.start_idx1 = select i1 %619, i32 0, i32 %618
  %620 = add i32 %dynamic-slice.5456.1.clone.1.start_idx0, 0
  %621 = add i32 %dynamic-slice.5456.1.clone.1.start_idx1, %3
  %622 = getelementptr inbounds [192 x [20 x double]], ptr %arg46, i32 0, i32 %620, i32 %621
  %623 = load double, ptr %622, align 8, !invariant.load !349
  %multiply.11773.7.clone.1 = fmul double %add.9938.9.clone.1, %623
  %624 = trunc i64 %12 to i32
  %625 = icmp sge i32 0, %624
  %626 = select i1 %625, i32 0, i32 %624
  %627 = icmp sle i32 191, %626
  %dynamic-slice.5457.1.clone.1.start_idx0 = select i1 %627, i32 191, i32 %626
  %constant_5031_938 = load i64, ptr @232, align 8
  %628 = trunc i64 %constant_5031_938 to i32
  %629 = icmp sge i32 0, %628
  %630 = select i1 %629, i32 0, i32 %628
  %631 = icmp sle i32 0, %630
  %dynamic-slice.5457.1.clone.1.start_idx1 = select i1 %631, i32 0, i32 %630
  %632 = add i32 %dynamic-slice.5457.1.clone.1.start_idx0, 0
  %633 = add i32 %dynamic-slice.5457.1.clone.1.start_idx1, %3
  %634 = getelementptr inbounds [192 x [20 x double]], ptr %arg45, i32 0, i32 %632, i32 %633
  %635 = load double, ptr %634, align 8, !invariant.load !349
  %multiply.11774.5.clone.1 = fmul double %multiply.11773.7.clone.1, %635
  %636 = fneg double %multiply.11774.5.clone.1
  %add.9945.3.clone.1 = fadd double %add.9944.5.clone.1, %636
  %multiply.11775.5.clone.1 = fmul double %583, %add.9945.3.clone.1
  %637 = fneg double %multiply.11775.5.clone.1
  %add.9947.13.clone.1 = fadd double %add.9939.15.clone.1, %637
  %638 = trunc i64 %12 to i32
  %639 = icmp sge i32 0, %638
  %640 = select i1 %639, i32 0, i32 %638
  %641 = icmp sle i32 191, %640
  %dynamic-slice.5458.1.clone.1.start_idx0 = select i1 %641, i32 191, i32 %640
  %constant_5031_939 = load i64, ptr @232, align 8
  %642 = trunc i64 %constant_5031_939 to i32
  %643 = icmp sge i32 0, %642
  %644 = select i1 %643, i32 0, i32 %642
  %645 = icmp sle i32 0, %644
  %dynamic-slice.5458.1.clone.1.start_idx1 = select i1 %645, i32 0, i32 %644
  %646 = add i32 %dynamic-slice.5458.1.clone.1.start_idx0, 0
  %647 = add i32 %dynamic-slice.5458.1.clone.1.start_idx1, %3
  %648 = getelementptr inbounds [192 x [20 x double]], ptr %arg44, i32 0, i32 %646, i32 %647
  %649 = load double, ptr %648, align 8, !invariant.load !349
  %multiply.11776.3.clone.1 = fmul double %add.9945.3.clone.1, %649
  %add.9948.11.clone.1 = fadd double %add.9947.13.clone.1, %multiply.11776.3.clone.1
  %multiply.11777.9.clone.1 = fmul double %add.9948.11.clone.1, %570
  %add.9949.7.clone.1 = fadd double %add.9934.9.clone.1, %multiply.11777.9.clone.1
  %multiply.11778.5.clone.1 = fmul double %335, %add.9949.7.clone.1
  %add.9950.3.clone.1 = fadd double %495, %multiply.11778.5.clone.1
  %add.9952.1.clone.1 = fadd double %492, %add.9950.3.clone.1
  %650 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %475, double %add.9952.1.clone.1, 7
  %651 = getelementptr double, ptr %arg62, i32 %linear_index
  %652 = getelementptr inbounds double, ptr %651, i32 0
  %653 = load double, ptr %652, align 8
  %654 = trunc i8 %24 to i1
  %655 = select i1 %654, double %constant_5033_12, double %653
  %656 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %650, double %655, 8
  %657 = getelementptr double, ptr %arg63, i32 %linear_index
  %658 = getelementptr inbounds double, ptr %657, i32 0
  %659 = load double, ptr %658, align 8
  %660 = trunc i8 %24 to i1
  %661 = select i1 %660, double %constant_5033_12, double %659
  %662 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %656, double %661, 9
  %663 = getelementptr double, ptr %arg64, i32 %linear_index
  %664 = getelementptr inbounds double, ptr %663, i32 0
  %665 = load double, ptr %664, align 8
  %666 = trunc i8 %24 to i1
  %667 = select i1 %666, double %constant_5033_12, double %665
  %668 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %662, double %667, 10
  %669 = getelementptr double, ptr %arg75, i32 %linear_index
  %670 = getelementptr inbounds double, ptr %669, i32 0
  %671 = load double, ptr %670, align 8
  %672 = trunc i8 %24 to i1
  %673 = select i1 %672, double %671, double %constant_5033_12
  %674 = getelementptr double, ptr %arg75, i32 %linear_index
  %675 = getelementptr inbounds double, ptr %674, i32 0
  %676 = load double, ptr %675, align 8
  %677 = trunc i8 %24 to i1
  %678 = select i1 %677, double %constant_5033_12, double %676
  %add.9988.3.clone.1.clone.1 = fadd double %673, %678
  %679 = trunc i64 %12 to i32
  %680 = icmp sge i32 0, %679
  %681 = select i1 %680, i32 0, i32 %679
  %682 = icmp sle i32 191, %681
  %dynamic-slice.5469.1.clone.1.clone.1.start_idx0 = select i1 %682, i32 191, i32 %681
  %constant_5031_940 = load i64, ptr @232, align 8
  %683 = trunc i64 %constant_5031_940 to i32
  %684 = icmp sge i32 0, %683
  %685 = select i1 %684, i32 0, i32 %683
  %686 = icmp sle i32 0, %685
  %dynamic-slice.5469.1.clone.1.clone.1.start_idx1 = select i1 %686, i32 0, i32 %685
  %687 = add i32 %dynamic-slice.5469.1.clone.1.clone.1.start_idx0, 0
  %688 = add i32 %dynamic-slice.5469.1.clone.1.clone.1.start_idx1, %3
  %689 = getelementptr inbounds [192 x [20 x i8]], ptr %arg74, i32 0, i32 %687, i32 %688
  %690 = load i8, ptr %689, align 1, !invariant.load !349
  %691 = trunc i64 %12 to i32
  %692 = icmp sge i32 0, %691
  %693 = select i1 %692, i32 0, i32 %691
  %694 = icmp sle i32 191, %693
  %dynamic-slice.5476.1.clone.1.clone.1.start_idx0 = select i1 %694, i32 191, i32 %693
  %constant_5031_941 = load i64, ptr @232, align 8
  %695 = trunc i64 %constant_5031_941 to i32
  %696 = icmp sge i32 0, %695
  %697 = select i1 %696, i32 0, i32 %695
  %698 = icmp sle i32 0, %697
  %dynamic-slice.5476.1.clone.1.clone.1.start_idx1 = select i1 %698, i32 0, i32 %697
  %699 = add i32 %dynamic-slice.5476.1.clone.1.clone.1.start_idx0, 0
  %700 = add i32 %dynamic-slice.5476.1.clone.1.clone.1.start_idx1, %3
  %701 = getelementptr inbounds [192 x [20 x double]], ptr %arg73, i32 0, i32 %699, i32 %700
  %702 = load double, ptr %701, align 8, !invariant.load !349
  %constant_5036_1_clone_1_clone_1 = load i32, ptr @237, align 4
  %703 = icmp eq i32 %120, %constant_5036_1_clone_1_clone_1
  %704 = zext i1 %703 to i8
  %705 = trunc i8 %704 to i1
  %706 = select i1 %705, double %127, double %constant_5033_12
  %707 = trunc i64 %12 to i32
  %708 = icmp sge i32 0, %707
  %709 = select i1 %708, i32 0, i32 %707
  %710 = icmp sle i32 191, %709
  %dynamic-slice.5470.2.clone.1.clone.1.start_idx0 = select i1 %710, i32 191, i32 %709
  %constant_5031_942 = load i64, ptr @232, align 8
  %711 = trunc i64 %constant_5031_942 to i32
  %712 = icmp sge i32 0, %711
  %713 = select i1 %712, i32 0, i32 %711
  %714 = icmp sle i32 0, %713
  %dynamic-slice.5470.2.clone.1.clone.1.start_idx1 = select i1 %714, i32 0, i32 %713
  %715 = add i32 %dynamic-slice.5470.2.clone.1.clone.1.start_idx0, 0
  %716 = add i32 %dynamic-slice.5470.2.clone.1.clone.1.start_idx1, %3
  %717 = getelementptr inbounds [192 x [20 x double]], ptr %arg72, i32 0, i32 %715, i32 %716
  %718 = load double, ptr %717, align 8, !invariant.load !349
  %multiply.11798.5.clone.1.clone.1 = fmul double %706, %718
  %719 = fneg double %multiply.11798.5.clone.1.clone.1
  %multiply.11807.5.clone.1.clone.1 = fmul double %702, %719
  %720 = trunc i64 %12 to i32
  %721 = icmp sge i32 0, %720
  %722 = select i1 %721, i32 0, i32 %720
  %723 = icmp sle i32 191, %722
  %dynamic-slice.5477.1.clone.1.clone.1.start_idx0 = select i1 %723, i32 191, i32 %722
  %constant_5031_943 = load i64, ptr @232, align 8
  %724 = trunc i64 %constant_5031_943 to i32
  %725 = icmp sge i32 0, %724
  %726 = select i1 %725, i32 0, i32 %724
  %727 = icmp sle i32 0, %726
  %dynamic-slice.5477.1.clone.1.clone.1.start_idx1 = select i1 %727, i32 0, i32 %726
  %728 = add i32 %dynamic-slice.5477.1.clone.1.clone.1.start_idx0, 0
  %729 = add i32 %dynamic-slice.5477.1.clone.1.clone.1.start_idx1, %3
  %730 = getelementptr inbounds [192 x [20 x double]], ptr %arg71, i32 0, i32 %728, i32 %729
  %731 = load double, ptr %730, align 8, !invariant.load !349
  %multiply.11808.3.clone.1.clone.1 = fmul double %multiply.11807.5.clone.1.clone.1, %731
  %732 = trunc i8 %690 to i1
  %733 = select i1 %732, double %multiply.11808.3.clone.1.clone.1, double %constant_5033_12
  %734 = getelementptr double, ptr %arg3, i32 %linear_index
  %735 = getelementptr inbounds double, ptr %734, i32 0
  %736 = load double, ptr %735, align 8, !invariant.load !349
  %add.9989.5.clone.1.clone.1 = fadd double %733, %736
  %737 = trunc i64 %12 to i32
  %738 = icmp sge i32 0, %737
  %739 = select i1 %738, i32 0, i32 %737
  %740 = icmp sle i32 191, %739
  %dynamic-slice.5478.1.clone.1.clone.1.start_idx0 = select i1 %740, i32 191, i32 %739
  %constant_5031_944 = load i64, ptr @232, align 8
  %741 = trunc i64 %constant_5031_944 to i32
  %742 = icmp sge i32 0, %741
  %743 = select i1 %742, i32 0, i32 %741
  %744 = icmp sle i32 0, %743
  %dynamic-slice.5478.1.clone.1.clone.1.start_idx1 = select i1 %744, i32 0, i32 %743
  %745 = add i32 %dynamic-slice.5478.1.clone.1.clone.1.start_idx0, 0
  %746 = add i32 %dynamic-slice.5478.1.clone.1.clone.1.start_idx1, %3
  %747 = getelementptr inbounds [192 x [20 x i8]], ptr %arg70, i32 0, i32 %745, i32 %746
  %748 = load i8, ptr %747, align 1, !invariant.load !349
  %749 = getelementptr double, ptr %arg62, i32 %linear_index
  %750 = getelementptr inbounds double, ptr %749, i32 0
  %751 = load double, ptr %750, align 8
  %752 = trunc i8 %24 to i1
  %753 = select i1 %752, double %751, double %constant_5033_12
  %754 = trunc i8 %84 to i1
  %755 = select i1 %754, double %131, double %constant_5033_12
  %756 = trunc i64 %12 to i32
  %757 = icmp sge i32 0, %756
  %758 = select i1 %757, i32 0, i32 %756
  %759 = icmp sle i32 191, %758
  %dynamic-slice.5472.3.clone.1.clone.1.start_idx0 = select i1 %759, i32 191, i32 %758
  %constant_5031_945 = load i64, ptr @232, align 8
  %760 = trunc i64 %constant_5031_945 to i32
  %761 = icmp sge i32 0, %760
  %762 = select i1 %761, i32 0, i32 %760
  %763 = icmp sle i32 0, %762
  %dynamic-slice.5472.3.clone.1.clone.1.start_idx1 = select i1 %763, i32 0, i32 %762
  %764 = add i32 %dynamic-slice.5472.3.clone.1.clone.1.start_idx0, 0
  %765 = add i32 %dynamic-slice.5472.3.clone.1.clone.1.start_idx1, %3
  %766 = getelementptr inbounds [192 x [20 x double]], ptr %arg69, i32 0, i32 %764, i32 %765
  %767 = load double, ptr %766, align 8, !invariant.load !349
  %multiply.11800.13.clone.1.clone.1 = fmul double %767, %multiply.11759.37.clone.1
  %768 = trunc i64 %12 to i32
  %769 = icmp sge i32 0, %768
  %770 = select i1 %769, i32 0, i32 %768
  %771 = icmp sle i32 191, %770
  %dynamic-slice.5473.3.clone.1.clone.1.start_idx0 = select i1 %771, i32 191, i32 %770
  %constant_5031_946 = load i64, ptr @232, align 8
  %772 = trunc i64 %constant_5031_946 to i32
  %773 = icmp sge i32 0, %772
  %774 = select i1 %773, i32 0, i32 %772
  %775 = icmp sle i32 0, %774
  %dynamic-slice.5473.3.clone.1.clone.1.start_idx1 = select i1 %775, i32 0, i32 %774
  %776 = add i32 %dynamic-slice.5473.3.clone.1.clone.1.start_idx0, 0
  %777 = add i32 %dynamic-slice.5473.3.clone.1.clone.1.start_idx1, %3
  %778 = getelementptr inbounds [192 x [20 x double]], ptr %arg68, i32 0, i32 %776, i32 %777
  %779 = load double, ptr %778, align 8, !invariant.load !349
  %multiply.11801.11.clone.1.clone.1 = fmul double %multiply.11800.13.clone.1.clone.1, %779
  %780 = fneg double %multiply.11801.11.clone.1.clone.1
  %constant_5037_2_clone_1_clone_1 = load double, ptr @235, align 8
  %multiply.11802.7.clone.1.clone.1 = fmul double %780, %constant_5037_2_clone_1_clone_1
  %add.9979.7.clone.1.clone.1 = fadd double %755, %multiply.11802.7.clone.1.clone.1
  %add.9980.11.clone.1.clone.1 = fadd double %753, %add.9979.7.clone.1.clone.1
  %781 = getelementptr double, ptr %arg3, i32 %linear_index
  %782 = getelementptr inbounds double, ptr %781, i32 0
  %783 = load double, ptr %782, align 8, !invariant.load !349
  %add.9981.9.clone.1.clone.1 = fadd double %add.9980.11.clone.1.clone.1, %783
  %784 = trunc i64 %12 to i32
  %785 = icmp sge i32 0, %784
  %786 = select i1 %785, i32 0, i32 %784
  %787 = icmp sle i32 191, %786
  %dynamic-slice.5474.3.clone.1.clone.1.start_idx0 = select i1 %787, i32 191, i32 %786
  %constant_5031_947 = load i64, ptr @232, align 8
  %788 = trunc i64 %constant_5031_947 to i32
  %789 = icmp sge i32 0, %788
  %790 = select i1 %789, i32 0, i32 %788
  %791 = icmp sle i32 0, %790
  %dynamic-slice.5474.3.clone.1.clone.1.start_idx1 = select i1 %791, i32 0, i32 %790
  %792 = add i32 %dynamic-slice.5474.3.clone.1.clone.1.start_idx0, 0
  %793 = add i32 %dynamic-slice.5474.3.clone.1.clone.1.start_idx1, %3
  %794 = getelementptr inbounds [192 x [20 x double]], ptr %arg67, i32 0, i32 %792, i32 %793
  %795 = load double, ptr %794, align 8, !invariant.load !349
  %796 = getelementptr double, ptr %arg64, i32 %linear_index
  %797 = getelementptr inbounds double, ptr %796, i32 0
  %798 = load double, ptr %797, align 8
  %799 = trunc i8 %24 to i1
  %800 = select i1 %799, double %798, double %constant_5033_12
  %801 = getelementptr double, ptr %arg3, i32 %linear_index
  %802 = getelementptr inbounds double, ptr %801, i32 0
  %803 = load double, ptr %802, align 8, !invariant.load !349
  %add.9982.13.clone.1.clone.1 = fadd double %800, %803
  %multiply.11803.7.clone.1.clone.1 = fmul double %795, %add.9982.13.clone.1.clone.1
  %add.9983.7.clone.1.clone.1 = fadd double %add.9981.9.clone.1.clone.1, %multiply.11803.7.clone.1.clone.1
  %804 = trunc i64 %12 to i32
  %805 = icmp sge i32 0, %804
  %806 = select i1 %805, i32 0, i32 %804
  %807 = icmp sle i32 191, %806
  %dynamic-slice.5475.3.clone.1.clone.1.start_idx0 = select i1 %807, i32 191, i32 %806
  %constant_5031_948 = load i64, ptr @232, align 8
  %808 = trunc i64 %constant_5031_948 to i32
  %809 = icmp sge i32 0, %808
  %810 = select i1 %809, i32 0, i32 %808
  %811 = icmp sle i32 0, %810
  %dynamic-slice.5475.3.clone.1.clone.1.start_idx1 = select i1 %811, i32 0, i32 %810
  %812 = add i32 %dynamic-slice.5475.3.clone.1.clone.1.start_idx0, 0
  %813 = add i32 %dynamic-slice.5475.3.clone.1.clone.1.start_idx1, %3
  %814 = getelementptr inbounds [192 x [20 x double]], ptr %arg66, i32 0, i32 %812, i32 %813
  %815 = load double, ptr %814, align 8, !invariant.load !349
  %multiply.11804.5.clone.1.clone.1 = fmul double %add.9983.7.clone.1.clone.1, %815
  %816 = fneg double %multiply.11804.5.clone.1.clone.1
  %817 = trunc i64 %12 to i32
  %818 = icmp sge i32 0, %817
  %819 = select i1 %818, i32 0, i32 %817
  %820 = icmp sle i32 191, %819
  %dynamic-slice.5479.1.clone.1.clone.1.start_idx0 = select i1 %820, i32 191, i32 %819
  %constant_5031_949 = load i64, ptr @232, align 8
  %821 = trunc i64 %constant_5031_949 to i32
  %822 = icmp sge i32 0, %821
  %823 = select i1 %822, i32 0, i32 %821
  %824 = icmp sle i32 0, %823
  %dynamic-slice.5479.1.clone.1.clone.1.start_idx1 = select i1 %824, i32 0, i32 %823
  %825 = add i32 %dynamic-slice.5479.1.clone.1.clone.1.start_idx0, 0
  %826 = add i32 %dynamic-slice.5479.1.clone.1.clone.1.start_idx1, %3
  %827 = getelementptr inbounds [192 x [20 x double]], ptr %arg65, i32 0, i32 %825, i32 %826
  %828 = load double, ptr %827, align 8, !invariant.load !349
  %multiply.11809.5.clone.1.clone.1 = fmul double %add.9982.13.clone.1.clone.1, %828
  %add.9990.3.clone.1.clone.1 = fadd double %816, %multiply.11809.5.clone.1.clone.1
  %829 = trunc i8 %748 to i1
  %830 = select i1 %829, double %add.9990.3.clone.1.clone.1, double %constant_5033_12
  %multiply.11810.3.clone.1.clone.1 = fmul double %830, %731
  %add.9991.3.clone.1.clone.1 = fadd double %add.9989.5.clone.1.clone.1, %multiply.11810.3.clone.1.clone.1
  %add.9992.1.clone.1.clone.1 = fadd double %add.9988.3.clone.1.clone.1, %add.9991.3.clone.1.clone.1
  %831 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %668, double %add.9992.1.clone.1.clone.1, 11
  %832 = getelementptr double, ptr %arg23, i32 %linear_index
  %833 = getelementptr inbounds double, ptr %832, i32 0
  %834 = load double, ptr %833, align 8
  %835 = trunc i8 %24 to i1
  %836 = select i1 %835, double %constant_5033_12, double %834
  %837 = trunc i64 %12 to i32
  %838 = icmp sge i32 0, %837
  %839 = select i1 %838, i32 0, i32 %837
  %840 = icmp sle i32 191, %839
  %dynamic-slice.5471.1.clone.1.start_idx0 = select i1 %840, i32 191, i32 %839
  %constant_5031_950 = load i64, ptr @232, align 8
  %841 = trunc i64 %constant_5031_950 to i32
  %842 = icmp sge i32 0, %841
  %843 = select i1 %842, i32 0, i32 %841
  %844 = icmp sle i32 0, %843
  %dynamic-slice.5471.1.clone.1.start_idx1 = select i1 %844, i32 0, i32 %843
  %845 = add i32 %dynamic-slice.5471.1.clone.1.start_idx0, 0
  %846 = add i32 %dynamic-slice.5471.1.clone.1.start_idx1, %3
  %847 = getelementptr inbounds [192 x [20 x double]], ptr %arg76, i32 0, i32 %845, i32 %846
  %848 = load double, ptr %847, align 8, !invariant.load !349
  %multiply.11799.5.clone.1 = fmul double %719, %848
  %849 = fneg double %multiply.11799.5.clone.1
  %850 = trunc i8 %690 to i1
  %851 = select i1 %850, double %849, double %constant_5033_12
  %852 = getelementptr double, ptr %arg3, i32 %linear_index
  %853 = getelementptr inbounds double, ptr %852, i32 0
  %854 = load double, ptr %853, align 8, !invariant.load !349
  %add.9978.5.clone.1 = fadd double %851, %854
  %multiply.11805.5.clone.1 = fmul double %816, %848
  %855 = fneg double %multiply.11805.5.clone.1
  %856 = getelementptr double, ptr %arg63, i32 %linear_index
  %857 = getelementptr inbounds double, ptr %856, i32 0
  %858 = load double, ptr %857, align 8
  %859 = trunc i8 %24 to i1
  %860 = select i1 %859, double %858, double %constant_5033_12
  %861 = getelementptr double, ptr %arg3, i32 %linear_index
  %862 = getelementptr inbounds double, ptr %861, i32 0
  %863 = load double, ptr %862, align 8, !invariant.load !349
  %add.9984.9.clone.1 = fadd double %860, %863
  %multiply.11806.7.clone.1 = fmul double %add.9984.9.clone.1, %848
  %864 = fneg double %multiply.11806.7.clone.1
  %add.9985.3.clone.1 = fadd double %855, %864
  %add.9986.3.clone.1 = fadd double %add.9978.5.clone.1, %add.9985.3.clone.1
  %add.9987.1.clone.1 = fadd double %836, %add.9986.3.clone.1
  %865 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %831, double %add.9987.1.clone.1, 12
  %866 = getelementptr double, ptr %arg58, i32 %linear_index
  %867 = getelementptr inbounds double, ptr %866, i32 0
  %868 = load double, ptr %867, align 8
  %869 = trunc i8 %24 to i1
  %870 = select i1 %869, double %constant_5033_12, double %868
  %871 = getelementptr double, ptr %arg3, i32 %linear_index
  %872 = getelementptr inbounds double, ptr %871, i32 0
  %873 = load double, ptr %872, align 8, !invariant.load !349
  %add.9967.1.clone.1 = fadd double %870, %873
  %874 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %865, double %add.9967.1.clone.1, 13
  %875 = getelementptr double, ptr %arg28, i32 %linear_index
  %876 = getelementptr inbounds double, ptr %875, i32 0
  %877 = load double, ptr %876, align 8
  %878 = trunc i8 %24 to i1
  %879 = select i1 %878, double %constant_5033_12, double %877
  %880 = getelementptr double, ptr %arg3, i32 %linear_index
  %881 = getelementptr inbounds double, ptr %880, i32 0
  %882 = load double, ptr %881, align 8, !invariant.load !349
  %add.9968.1.clone.1 = fadd double %879, %882
  %883 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %874, double %add.9968.1.clone.1, 14
  %884 = getelementptr double, ptr %arg29, i32 %linear_index
  %885 = getelementptr inbounds double, ptr %884, i32 0
  %886 = load double, ptr %885, align 8
  %887 = trunc i8 %24 to i1
  %888 = select i1 %887, double %constant_5033_12, double %886
  %889 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %883, double %888, 15
  %890 = getelementptr double, ptr %arg59, i32 %linear_index
  %891 = getelementptr inbounds double, ptr %890, i32 0
  %892 = load double, ptr %891, align 8
  %893 = trunc i8 %24 to i1
  %894 = select i1 %893, double %constant_5033_12, double %892
  %895 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %889, double %894, 16
  %896 = getelementptr double, ptr %arg55, i32 %linear_index
  %897 = getelementptr inbounds double, ptr %896, i32 0
  %898 = load double, ptr %897, align 8
  %899 = trunc i8 %24 to i1
  %900 = select i1 %899, double %constant_5033_12, double %898
  %901 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %895, double %900, 17
  %902 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 0
  %903 = getelementptr double, ptr %arg0, i32 %linear_index
  %904 = getelementptr inbounds double, ptr %903, i32 0
  store double %902, ptr %904, align 8
  %905 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 1
  %906 = getelementptr double, ptr %arg19, i32 %linear_index
  %907 = getelementptr inbounds double, ptr %906, i32 0
  store double %905, ptr %907, align 8
  %908 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 2
  %909 = getelementptr double, ptr %arg33, i32 %linear_index
  %910 = getelementptr inbounds double, ptr %909, i32 0
  store double %908, ptr %910, align 8
  %911 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 3
  %912 = getelementptr double, ptr %arg37, i32 %linear_index
  %913 = getelementptr inbounds double, ptr %912, i32 0
  store double %911, ptr %913, align 8
  %914 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 4
  %915 = getelementptr double, ptr %arg13, i32 %linear_index
  %916 = getelementptr inbounds double, ptr %915, i32 0
  store double %914, ptr %916, align 8
  %917 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 5
  %918 = getelementptr double, ptr %arg42, i32 %linear_index
  %919 = getelementptr inbounds double, ptr %918, i32 0
  store double %917, ptr %919, align 8
  %920 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 6
  %921 = getelementptr double, ptr %arg35, i32 %linear_index
  %922 = getelementptr inbounds double, ptr %921, i32 0
  store double %920, ptr %922, align 8
  %923 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 7
  %924 = getelementptr double, ptr %arg60, i32 %linear_index
  %925 = getelementptr inbounds double, ptr %924, i32 0
  store double %923, ptr %925, align 8
  %926 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 8
  %927 = getelementptr double, ptr %arg62, i32 %linear_index
  %928 = getelementptr inbounds double, ptr %927, i32 0
  store double %926, ptr %928, align 8
  %929 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 9
  %930 = getelementptr double, ptr %arg63, i32 %linear_index
  %931 = getelementptr inbounds double, ptr %930, i32 0
  store double %929, ptr %931, align 8
  %932 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 10
  %933 = getelementptr double, ptr %arg64, i32 %linear_index
  %934 = getelementptr inbounds double, ptr %933, i32 0
  store double %932, ptr %934, align 8
  %935 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 11
  %936 = getelementptr double, ptr %arg75, i32 %linear_index
  %937 = getelementptr inbounds double, ptr %936, i32 0
  store double %935, ptr %937, align 8
  %938 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 12
  %939 = getelementptr double, ptr %arg23, i32 %linear_index
  %940 = getelementptr inbounds double, ptr %939, i32 0
  store double %938, ptr %940, align 8
  %941 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 13
  %942 = getelementptr double, ptr %arg58, i32 %linear_index
  %943 = getelementptr inbounds double, ptr %942, i32 0
  store double %941, ptr %943, align 8
  %944 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 14
  %945 = getelementptr double, ptr %arg28, i32 %linear_index
  %946 = getelementptr inbounds double, ptr %945, i32 0
  store double %944, ptr %946, align 8
  %947 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 15
  %948 = getelementptr double, ptr %arg29, i32 %linear_index
  %949 = getelementptr inbounds double, ptr %948, i32 0
  store double %947, ptr %949, align 8
  %950 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 16
  %951 = getelementptr double, ptr %arg59, i32 %linear_index
  %952 = getelementptr inbounds double, ptr %951, i32 0
  store double %950, ptr %952, align 8
  %953 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, 17
  %954 = getelementptr double, ptr %arg55, i32 %linear_index
  %955 = getelementptr inbounds double, ptr %954, i32 0
  store double %953, ptr %955, align 8
  br label %loop_add_select_fusion.6.in_bounds-after
}

define void @loop_reduce_fusion_29(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %return_buffer12 = alloca double, align 8
  %parameter_buffer11 = alloca double, align 8
  %parameter_buffer10 = alloca double, align 8
  %reduce.259.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.269.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.29.in_bounds-true, label %loop_reduce_fusion.29.in_bounds-after

loop_reduce_fusion.29.in_bounds-after:            ; preds = %reduce.259.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.29.in_bounds-true:             ; preds = %entry
  %constant_2461_22 = load double, ptr @239, align 8
  store double %constant_2461_22, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.269.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.269.1.inner.loop_header.reduction_dim.0

reduce.269.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.269.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.29.in_bounds-true
  %reduce.269.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.269.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.269.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.269.1.inner.loop_exit.reduction_dim.0, label %reduce.269.1.inner.loop_body.reduction_dim.0

reduce.269.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.269.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x [1 x double]], ptr %arg3, i32 0, i32 %reduce.269.1.inner.indvar.reduction_dim.0, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.269.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %10 = load double, ptr %arg2, align 8, !invariant.load !349
  %11 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.269.1.inner.indvar.reduction_dim.0
  %12 = load double, ptr %11, align 8, !invariant.load !349
  %multiply.11870.11 = fmul double %10, %12
  %add.10023.11 = fadd double %9, %multiply.11870.11
  %constant_2460_9 = load double, ptr @243, align 8
  %add.10030.11 = fadd double %add.10023.11, %constant_2460_9
  %constant_2570_2 = load double, ptr @242, align 8
  %multiply.11884.9 = fmul double %add.10030.11, %constant_2570_2
  %add.10031.7 = fadd double %7, %multiply.11884.9
  %13 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.269.1.inner.indvar.reduction_dim.0
  %14 = load double, ptr %13, align 8, !invariant.load !349
  %multiply.11885.3 = fmul double %add.10031.7, %14
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11885.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %15 = load double, ptr %return_buffer, align 8
  store double %15, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.269.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.269.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.269.1.inner.loop_header.reduction_dim.0

reduce.269.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.269.1.inner.loop_header.reduction_dim.0
  %16 = load double, ptr %accumulator_0, align 8
  %17 = insertvalue { double, double } undef, double %16, 0
  %constant_2461_223 = load double, ptr @239, align 8
  store double %constant_2461_223, ptr %accumulator_02, align 8
  store i32 0, ptr %reduce.259.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.259.1.clone.1.inner.loop_header.reduction_dim.0

reduce.259.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.259.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.269.1.inner.loop_exit.reduction_dim.0
  %reduce.259.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.259.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %18 = icmp uge i32 %reduce.259.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %18, label %reduce.259.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.259.1.clone.1.inner.loop_body.reduction_dim.0

reduce.259.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.259.1.clone.1.inner.loop_header.reduction_dim.0
  %19 = load double, ptr %accumulator_02, align 8
  %20 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.259.1.clone.1.inner.indvar.reduction_dim.0
  %21 = load double, ptr %20, align 8, !invariant.load !349
  %22 = load double, ptr %arg2, align 8, !invariant.load !349
  %23 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.259.1.clone.1.inner.indvar.reduction_dim.0
  %24 = load double, ptr %23, align 8, !invariant.load !349
  %multiply.11870.115 = fmul double %22, %24
  %add.10023.116 = fadd double %21, %multiply.11870.115
  %constant_2460_97 = load double, ptr @243, align 8
  %add.10030.118 = fadd double %add.10023.116, %constant_2460_97
  %multiply.11913.7.clone.1 = fmul double %add.10030.118, %add.10030.118
  %constant_2570_29 = load double, ptr @242, align 8
  %multiply.11914.7.clone.1 = fmul double %multiply.11913.7.clone.1, %constant_2570_29
  %constant_2530_1_clone_1 = load double, ptr @241, align 8
  %add.10057.5.clone.1 = fadd double %multiply.11914.7.clone.1, %constant_2530_1_clone_1
  %constant_2564_6_clone_1 = load double, ptr @240, align 8
  %multiply.11915.3.clone.1 = fmul double %add.10057.5.clone.1, %constant_2564_6_clone_1
  store double %19, ptr %parameter_buffer10, align 8
  store double %multiply.11915.3.clone.1, ptr %parameter_buffer11, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer10, ptr %parameter_buffer11, ptr %return_buffer12)
  %25 = load double, ptr %return_buffer12, align 8
  store double %25, ptr %accumulator_02, align 8
  %invar.inc4 = add nuw nsw i32 %reduce.259.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.259.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.259.1.clone.1.inner.loop_header.reduction_dim.0

reduce.259.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.259.1.clone.1.inner.loop_header.reduction_dim.0
  %26 = load double, ptr %accumulator_02, align 8
  %27 = insertvalue { double, double } %17, double %26, 1
  %28 = extractvalue { double, double } %27, 0
  store double %28, ptr %arg4, align 8
  %29 = extractvalue { double, double } %27, 1
  store double %29, ptr %arg5, align 8
  br label %loop_reduce_fusion.29.in_bounds-after
}

define void @loop_reduce_fusion_26(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.271.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.26.in_bounds-true, label %loop_reduce_fusion.26.in_bounds-after

loop_reduce_fusion.26.in_bounds-after:            ; preds = %reduce.271.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.26.in_bounds-true:             ; preds = %entry
  %constant_2461_21 = load double, ptr @244, align 8
  store double %constant_2461_21, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.271.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.271.1.inner.loop_header.reduction_dim.0

reduce.271.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.271.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.26.in_bounds-true
  %reduce.271.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.271.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.271.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.271.1.inner.loop_exit.reduction_dim.0, label %reduce.271.1.inner.loop_body.reduction_dim.0

reduce.271.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.271.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.271.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %reduce.271.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %constant_2460_1 = load double, ptr @245, align 8
  %add.10036.11 = fadd double %9, %constant_2460_1
  %add.10037.7 = fadd double %7, %add.10036.11
  %10 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.271.1.inner.indvar.reduction_dim.0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %multiply.11890.3 = fmul double %add.10037.7, %11
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11890.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %12 = load double, ptr %return_buffer, align 8
  store double %12, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.271.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.271.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.271.1.inner.loop_header.reduction_dim.0

reduce.271.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.271.1.inner.loop_header.reduction_dim.0
  %13 = load double, ptr %accumulator_0, align 8
  store double %13, ptr %arg3, align 8
  br label %loop_reduce_fusion.26.in_bounds-after
}

define void @loop_reduce_fusion_27(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.272.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.27.in_bounds-true, label %loop_reduce_fusion.27.in_bounds-after

loop_reduce_fusion.27.in_bounds-after:            ; preds = %reduce.272.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.27.in_bounds-true:             ; preds = %entry
  %constant_2461_38 = load double, ptr @246, align 8
  store double %constant_2461_38, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.272.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.272.1.inner.loop_header.reduction_dim.0

reduce.272.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.272.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.27.in_bounds-true
  %reduce.272.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.272.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.272.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.272.1.inner.loop_exit.reduction_dim.0, label %reduce.272.1.inner.loop_body.reduction_dim.0

reduce.272.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.272.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.272.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %reduce.272.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %constant_2570_3 = load double, ptr @248, align 8
  %add.10039.11 = fadd double %9, %constant_2570_3
  %constant_2563_2 = load double, ptr @247, align 8
  %multiply.11891.9 = fmul double %add.10039.11, %constant_2563_2
  %add.10040.7 = fadd double %7, %multiply.11891.9
  %10 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.272.1.inner.indvar.reduction_dim.0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %multiply.11892.3 = fmul double %add.10040.7, %11
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11892.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %12 = load double, ptr %return_buffer, align 8
  store double %12, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.272.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.272.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.272.1.inner.loop_header.reduction_dim.0

reduce.272.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.272.1.inner.loop_header.reduction_dim.0
  %13 = load double, ptr %accumulator_0, align 8
  store double %13, ptr %arg3, align 8
  br label %loop_reduce_fusion.27.in_bounds-after
}

define void @input_reduce_fusion_9(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1) {
entry:
  %return_buffer16 = alloca double, align 8
  %result_from_other_lane14 = alloca double, align 8
  %return_buffer13 = alloca double, align 8
  %result_from_other_lane11 = alloca double, align 8
  %return_buffer10 = alloca double, align 8
  %result_from_other_lane8 = alloca double, align 8
  %return_buffer7 = alloca double, align 8
  %result_from_other_lane5 = alloca double, align 8
  %return_buffer4 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !348
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_2461_47 = load double, ptr @249, align 8
  store double %constant_2461_47, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !353
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = udiv i32 %thread.id.x, 32
  %thread.id.1 = urem i32 %1, 32
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 192, i32 4096
  %8 = icmp eq i32 %3, 0
  %tile_bound.2 = select i1 %8, i32 20, i32 32
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 4096
  %tile_origin.2 = mul i32 %3, 32
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %9 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %9, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 32
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %10 = icmp uge i32 %loop2.indvar, 32
  br i1 %10, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 32
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %11 = add i32 %loop2.indvar, %thread.id.2
  %12 = icmp ult i32 %11, %tile_bound.2
  br i1 %12, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !362

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !363

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %13 = load double, ptr %partial_reduction_result, align 8
  %14 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache1, i32 0, i32 %thread.id.2, i32 %thread.id.1
  %15 = addrspacecast ptr addrspace(3) %14 to ptr
  store double %13, ptr %15, align 8
  call void @llvm.nvvm.barrier0()
  %16 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache1, i32 0, i32 %thread.id.1, i32 %thread.id.2
  %17 = addrspacecast ptr addrspace(3) %16 to ptr
  %partial_reduction_result3 = load double, ptr %17, align 8
  %18 = bitcast double %partial_reduction_result3 to i64
  %19 = bitcast i64 %18 to <2 x i32>
  %20 = extractelement <2 x i32> %19, i64 0
  %21 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 16, i32 31)
  %22 = insertelement <2 x i32> %19, i32 %21, i64 0
  %23 = extractelement <2 x i32> %22, i64 1
  %24 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 16, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 1
  %26 = bitcast <2 x i32> %25 to i64
  %27 = bitcast i64 %26 to double
  store double %27, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane, ptr %return_buffer4)
  %28 = load double, ptr %return_buffer4, align 8
  store double %28, ptr %17, align 8
  %partial_reduction_result6 = load double, ptr %17, align 8
  %29 = bitcast double %partial_reduction_result6 to i64
  %30 = bitcast i64 %29 to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 0
  %34 = extractelement <2 x i32> %33, i64 1
  %35 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 8, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to i64
  %38 = bitcast i64 %37 to double
  store double %38, ptr %result_from_other_lane5, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane5, ptr %return_buffer7)
  %39 = load double, ptr %return_buffer7, align 8
  store double %39, ptr %17, align 8
  %partial_reduction_result9 = load double, ptr %17, align 8
  %40 = bitcast double %partial_reduction_result9 to i64
  %41 = bitcast i64 %40 to <2 x i32>
  %42 = extractelement <2 x i32> %41, i64 0
  %43 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 4, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 0
  %45 = extractelement <2 x i32> %44, i64 1
  %46 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 4, i32 31)
  %47 = insertelement <2 x i32> %44, i32 %46, i64 1
  %48 = bitcast <2 x i32> %47 to i64
  %49 = bitcast i64 %48 to double
  store double %49, ptr %result_from_other_lane8, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane8, ptr %return_buffer10)
  %50 = load double, ptr %return_buffer10, align 8
  store double %50, ptr %17, align 8
  %partial_reduction_result12 = load double, ptr %17, align 8
  %51 = bitcast double %partial_reduction_result12 to i64
  %52 = bitcast i64 %51 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 2, i32 31)
  %55 = insertelement <2 x i32> %52, i32 %54, i64 0
  %56 = extractelement <2 x i32> %55, i64 1
  %57 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 1
  %59 = bitcast <2 x i32> %58 to i64
  %60 = bitcast i64 %59 to double
  store double %60, ptr %result_from_other_lane11, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane11, ptr %return_buffer13)
  %61 = load double, ptr %return_buffer13, align 8
  store double %61, ptr %17, align 8
  %partial_reduction_result15 = load double, ptr %17, align 8
  %62 = bitcast double %partial_reduction_result15 to i64
  %63 = bitcast i64 %62 to <2 x i32>
  %64 = extractelement <2 x i32> %63, i64 0
  %65 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  %66 = insertelement <2 x i32> %63, i32 %65, i64 0
  %67 = extractelement <2 x i32> %66, i64 1
  %68 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %67, i32 1, i32 31)
  %69 = insertelement <2 x i32> %66, i32 %68, i64 1
  %70 = bitcast <2 x i32> %69 to i64
  %71 = bitcast i64 %70 to double
  store double %71, ptr %result_from_other_lane14, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane14, ptr %return_buffer16)
  %72 = load double, ptr %return_buffer16, align 8
  store double %72, ptr %17, align 8
  %73 = icmp ult i32 %thread.id.1, %tile_bound.2
  %74 = icmp ult i32 %thread.id.2, %tile_bound.1
  %75 = and i1 %73, %74
  %76 = icmp eq i32 %lane_id, 0
  %77 = and i1 %75, %76
  br i1 %77, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %78 = add i32 %tile_origin.0, 0
  %79 = add i32 %tile_origin.1, %loop1.indvar
  %80 = add i32 %tile_origin.2, %11
  %param_0.6126 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i32 0, i32 %79, i32 %80
  %param_0.61262 = load double, ptr %param_0.6126, align 8, !invariant.load !349
  store double %param_0.61262, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %81 = load double, ptr %return_buffer, align 8
  store double %81, ptr %partial_reduction_result, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %82 = add i32 %tile_origin.2, %thread.id.1
  %output_element_address = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %82
  %output = load double, ptr %17, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

define void @loop_reduce_fusion_30(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.270.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.30.in_bounds-true, label %loop_reduce_fusion.30.in_bounds-after

loop_reduce_fusion.30.in_bounds-after:            ; preds = %reduce.270.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.30.in_bounds-true:             ; preds = %entry
  %constant_2461_20 = load double, ptr @250, align 8
  store double %constant_2461_20, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.270.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.270.1.inner.loop_header.reduction_dim.0

reduce.270.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.270.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.30.in_bounds-true
  %reduce.270.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.270.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.270.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.270.1.inner.loop_exit.reduction_dim.0, label %reduce.270.1.inner.loop_body.reduction_dim.0

reduce.270.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.270.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.270.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %reduce.270.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %10 = load double, ptr %arg3, align 8, !invariant.load !349
  %11 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.270.1.inner.indvar.reduction_dim.0
  %12 = load double, ptr %11, align 8, !invariant.load !349
  %multiply.11866.17 = fmul double %10, %12
  %add.10019.17 = fadd double %9, %multiply.11866.17
  %13 = call double @__nv_exp(double %add.10019.17)
  %multiply.11887.7 = fmul double %7, %13
  %constant_2907_1 = load double, ptr @252, align 8
  %add.10033.13 = fadd double %add.10019.17, %constant_2907_1
  %constant_2565_2 = load double, ptr @251, align 8
  %multiply.11888.9 = fmul double %add.10033.13, %constant_2565_2
  %add.10034.7 = fadd double %multiply.11887.7, %multiply.11888.9
  %14 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.270.1.inner.indvar.reduction_dim.0
  %15 = load double, ptr %14, align 8, !invariant.load !349
  %multiply.11889.3 = fmul double %add.10034.7, %15
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11889.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %16 = load double, ptr %return_buffer, align 8
  store double %16, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.270.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.270.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.270.1.inner.loop_header.reduction_dim.0

reduce.270.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.270.1.inner.loop_header.reduction_dim.0
  %17 = load double, ptr %accumulator_0, align 8
  store double %17, ptr %arg4, align 8
  br label %loop_reduce_fusion.30.in_bounds-after
}

define void @loop_reduce_fusion_28(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.268.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.28.in_bounds-true, label %loop_reduce_fusion.28.in_bounds-after

loop_reduce_fusion.28.in_bounds-after:            ; preds = %reduce.268.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.28.in_bounds-true:             ; preds = %entry
  %constant_2461_23 = load double, ptr @253, align 8
  store double %constant_2461_23, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.268.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.268.1.inner.loop_header.reduction_dim.0

reduce.268.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.268.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.28.in_bounds-true
  %reduce.268.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.268.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.268.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.268.1.inner.loop_exit.reduction_dim.0, label %reduce.268.1.inner.loop_body.reduction_dim.0

reduce.268.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.268.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.268.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %reduce.268.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %10 = load double, ptr %arg3, align 8, !invariant.load !349
  %11 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.268.1.inner.indvar.reduction_dim.0
  %12 = load double, ptr %11, align 8, !invariant.load !349
  %multiply.11874.13 = fmul double %10, %12
  %add.10025.13 = fadd double %9, %multiply.11874.13
  %add.10028.4 = fadd double %7, %add.10025.13
  %13 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.268.1.inner.indvar.reduction_dim.0
  %14 = load double, ptr %13, align 8, !invariant.load !349
  %multiply.11876.3 = fmul double %add.10028.4, %14
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11876.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %15 = load double, ptr %return_buffer, align 8
  store double %15, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.268.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.268.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.268.1.inner.loop_header.reduction_dim.0

reduce.268.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.268.1.inner.loop_header.reduction_dim.0
  %16 = load double, ptr %accumulator_0, align 8
  store double %16, ptr %arg4, align 8
  br label %loop_reduce_fusion.28.in_bounds-after
}

define void @loop_add_fusion_39(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(160) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 128 dereferenceable(160) %arg14, ptr noalias align 128 dereferenceable(160) %arg15, ptr noalias align 128 dereferenceable(160) %arg16, ptr noalias align 128 dereferenceable(160) %arg17, ptr noalias align 128 dereferenceable(160) %arg18, ptr noalias align 128 dereferenceable(8) %arg19, ptr noalias align 128 dereferenceable(8) %arg20) {
entry:
  %return_buffer37 = alloca double, align 8
  %parameter_buffer36 = alloca double, align 8
  %parameter_buffer35 = alloca double, align 8
  %reduce.279.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_032 = alloca double, align 8
  %return_buffer31 = alloca double, align 8
  %parameter_buffer30 = alloca double, align 8
  %parameter_buffer29 = alloca double, align 8
  %reduce.278.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_026 = alloca double, align 8
  %return_buffer25 = alloca double, align 8
  %parameter_buffer24 = alloca double, align 8
  %parameter_buffer23 = alloca double, align 8
  %reduce.277.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_020 = alloca double, align 8
  %return_buffer19 = alloca double, align 8
  %parameter_buffer18 = alloca double, align 8
  %parameter_buffer17 = alloca double, align 8
  %reduce.276.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_014 = alloca double, align 8
  %return_buffer13 = alloca double, align 8
  %parameter_buffer12 = alloca double, align 8
  %parameter_buffer11 = alloca double, align 8
  %reduce.275.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_08 = alloca double, align 8
  %return_buffer7 = alloca double, align 8
  %parameter_buffer6 = alloca double, align 8
  %parameter_buffer5 = alloca double, align 8
  %reduce.274.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.273.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.39.in_bounds-true, label %loop_add_fusion.39.in_bounds-after

loop_add_fusion.39.in_bounds-after:               ; preds = %reduce.279.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_add_fusion.39.in_bounds-true:                ; preds = %entry
  %4 = load double, ptr %arg3, align 8, !invariant.load !349
  %5 = load double, ptr %arg4, align 8, !invariant.load !349
  %add.10032.1 = fadd double %4, %5
  %6 = load double, ptr %arg2, align 8, !invariant.load !349
  %add.10035.1 = fadd double %add.10032.1, %6
  %7 = load double, ptr %arg1, align 8, !invariant.load !349
  %add.10038.1 = fadd double %add.10035.1, %7
  %8 = load double, ptr %arg0, align 8, !invariant.load !349
  %add.10041.1 = fadd double %add.10038.1, %8
  %constant_2461_36 = load double, ptr @254, align 8
  store double %constant_2461_36, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.273.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.273.1.inner.loop_header.reduction_dim.0

reduce.273.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.273.1.inner.loop_body.reduction_dim.0, %loop_add_fusion.39.in_bounds-true
  %reduce.273.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.273.1.inner.invar_address.reduction_dim.0, align 4
  %9 = icmp uge i32 %reduce.273.1.inner.indvar.reduction_dim.0, 20
  br i1 %9, label %reduce.273.1.inner.loop_exit.reduction_dim.0, label %reduce.273.1.inner.loop_body.reduction_dim.0

reduce.273.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.273.1.inner.loop_header.reduction_dim.0
  %10 = load double, ptr %accumulator_0, align 8
  %11 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %reduce.273.1.inner.indvar.reduction_dim.0
  %12 = load double, ptr %11, align 8, !invariant.load !349
  %13 = getelementptr inbounds [20 x double], ptr %arg7, i32 0, i32 %reduce.273.1.inner.indvar.reduction_dim.0
  %14 = load double, ptr %13, align 8, !invariant.load !349
  %constant_2913_1 = load double, ptr @256, align 8
  %add.10042.11 = fadd double %14, %constant_2913_1
  %constant_2563_3 = load double, ptr @255, align 8
  %multiply.11893.9 = fmul double %add.10042.11, %constant_2563_3
  %add.10043.7 = fadd double %12, %multiply.11893.9
  %15 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %reduce.273.1.inner.indvar.reduction_dim.0
  %16 = load double, ptr %15, align 8, !invariant.load !349
  %multiply.11894.3 = fmul double %add.10043.7, %16
  store double %10, ptr %parameter_buffer, align 8
  store double %multiply.11894.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %17 = load double, ptr %return_buffer, align 8
  store double %17, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.273.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.273.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.273.1.inner.loop_header.reduction_dim.0

reduce.273.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.273.1.inner.loop_header.reduction_dim.0
  %18 = load double, ptr %accumulator_0, align 8
  %add.10044.1 = fadd double %add.10041.1, %18
  %19 = insertvalue { double, double } undef, double %add.10044.1, 0
  %constant_2461_363 = load double, ptr @254, align 8
  store double %constant_2461_363, ptr %accumulator_02, align 8
  store i32 0, ptr %reduce.274.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.274.1.clone.1.inner.loop_header.reduction_dim.0

reduce.274.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.274.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.273.1.inner.loop_exit.reduction_dim.0
  %reduce.274.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.274.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %20 = icmp uge i32 %reduce.274.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %20, label %reduce.274.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.274.1.clone.1.inner.loop_body.reduction_dim.0

reduce.274.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.274.1.clone.1.inner.loop_header.reduction_dim.0
  %21 = load double, ptr %accumulator_02, align 8
  %22 = getelementptr inbounds [20 x double], ptr %arg11, i32 0, i32 %reduce.274.1.clone.1.inner.indvar.reduction_dim.0
  %23 = load double, ptr %22, align 8, !invariant.load !349
  %24 = getelementptr inbounds [20 x double], ptr %arg12, i32 0, i32 %reduce.274.1.clone.1.inner.indvar.reduction_dim.0
  %25 = load double, ptr %24, align 8, !invariant.load !349
  %multiply.11895.1.clone.1 = fmul double %23, %25
  store double %21, ptr %parameter_buffer5, align 8
  store double %multiply.11895.1.clone.1, ptr %parameter_buffer6, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer5, ptr %parameter_buffer6, ptr %return_buffer7)
  %26 = load double, ptr %return_buffer7, align 8
  store double %26, ptr %accumulator_02, align 8
  %invar.inc4 = add nuw nsw i32 %reduce.274.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.274.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.274.1.clone.1.inner.loop_header.reduction_dim.0

reduce.274.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.274.1.clone.1.inner.loop_header.reduction_dim.0
  %27 = load double, ptr %accumulator_02, align 8
  %constant_2461_369 = load double, ptr @254, align 8
  store double %constant_2461_369, ptr %accumulator_08, align 8
  store i32 0, ptr %reduce.275.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.275.1.clone.1.inner.loop_header.reduction_dim.0

reduce.275.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.275.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.274.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.275.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.275.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %28 = icmp uge i32 %reduce.275.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %28, label %reduce.275.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.275.1.clone.1.inner.loop_body.reduction_dim.0

reduce.275.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.275.1.clone.1.inner.loop_header.reduction_dim.0
  %29 = load double, ptr %accumulator_08, align 8
  %30 = getelementptr inbounds [20 x double], ptr %arg9, i32 0, i32 %reduce.275.1.clone.1.inner.indvar.reduction_dim.0
  %31 = load double, ptr %30, align 8, !invariant.load !349
  %32 = getelementptr inbounds [20 x double], ptr %arg10, i32 0, i32 %reduce.275.1.clone.1.inner.indvar.reduction_dim.0
  %33 = load double, ptr %32, align 8, !invariant.load !349
  %multiply.11896.1.clone.1 = fmul double %31, %33
  store double %29, ptr %parameter_buffer11, align 8
  store double %multiply.11896.1.clone.1, ptr %parameter_buffer12, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer11, ptr %parameter_buffer12, ptr %return_buffer13)
  %34 = load double, ptr %return_buffer13, align 8
  store double %34, ptr %accumulator_08, align 8
  %invar.inc10 = add nuw nsw i32 %reduce.275.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc10, ptr %reduce.275.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.275.1.clone.1.inner.loop_header.reduction_dim.0

reduce.275.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.275.1.clone.1.inner.loop_header.reduction_dim.0
  %35 = load double, ptr %accumulator_08, align 8
  %add.10045.1.clone.1 = fadd double %27, %35
  %constant_2461_3615 = load double, ptr @254, align 8
  store double %constant_2461_3615, ptr %accumulator_014, align 8
  store i32 0, ptr %reduce.276.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.276.1.clone.1.inner.loop_header.reduction_dim.0

reduce.276.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.276.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.275.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.276.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.276.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %36 = icmp uge i32 %reduce.276.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %36, label %reduce.276.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.276.1.clone.1.inner.loop_body.reduction_dim.0

reduce.276.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.276.1.clone.1.inner.loop_header.reduction_dim.0
  %37 = load double, ptr %accumulator_014, align 8
  %38 = getelementptr inbounds [20 x double], ptr %arg13, i32 0, i32 %reduce.276.1.clone.1.inner.indvar.reduction_dim.0
  %39 = load double, ptr %38, align 8, !invariant.load !349
  %40 = getelementptr inbounds [20 x double], ptr %arg14, i32 0, i32 %reduce.276.1.clone.1.inner.indvar.reduction_dim.0
  %41 = load double, ptr %40, align 8, !invariant.load !349
  %multiply.11897.1.clone.1 = fmul double %39, %41
  store double %37, ptr %parameter_buffer17, align 8
  store double %multiply.11897.1.clone.1, ptr %parameter_buffer18, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer17, ptr %parameter_buffer18, ptr %return_buffer19)
  %42 = load double, ptr %return_buffer19, align 8
  store double %42, ptr %accumulator_014, align 8
  %invar.inc16 = add nuw nsw i32 %reduce.276.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc16, ptr %reduce.276.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.276.1.clone.1.inner.loop_header.reduction_dim.0

reduce.276.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.276.1.clone.1.inner.loop_header.reduction_dim.0
  %43 = load double, ptr %accumulator_014, align 8
  %add.10046.1.clone.1 = fadd double %add.10045.1.clone.1, %43
  %constant_2461_3621 = load double, ptr @254, align 8
  store double %constant_2461_3621, ptr %accumulator_020, align 8
  store i32 0, ptr %reduce.277.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.277.1.clone.1.inner.loop_header.reduction_dim.0

reduce.277.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.277.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.276.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.277.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.277.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %44 = icmp uge i32 %reduce.277.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %44, label %reduce.277.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.277.1.clone.1.inner.loop_body.reduction_dim.0

reduce.277.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.277.1.clone.1.inner.loop_header.reduction_dim.0
  %45 = load double, ptr %accumulator_020, align 8
  %46 = getelementptr inbounds [20 x double], ptr %arg15, i32 0, i32 %reduce.277.1.clone.1.inner.indvar.reduction_dim.0
  %47 = load double, ptr %46, align 8, !invariant.load !349
  %48 = getelementptr inbounds [20 x double], ptr %arg16, i32 0, i32 %reduce.277.1.clone.1.inner.indvar.reduction_dim.0
  %49 = load double, ptr %48, align 8, !invariant.load !349
  %multiply.11898.1.clone.1 = fmul double %47, %49
  store double %45, ptr %parameter_buffer23, align 8
  store double %multiply.11898.1.clone.1, ptr %parameter_buffer24, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer23, ptr %parameter_buffer24, ptr %return_buffer25)
  %50 = load double, ptr %return_buffer25, align 8
  store double %50, ptr %accumulator_020, align 8
  %invar.inc22 = add nuw nsw i32 %reduce.277.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc22, ptr %reduce.277.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.277.1.clone.1.inner.loop_header.reduction_dim.0

reduce.277.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.277.1.clone.1.inner.loop_header.reduction_dim.0
  %51 = load double, ptr %accumulator_020, align 8
  %add.10047.1.clone.1 = fadd double %add.10046.1.clone.1, %51
  %constant_2461_3627 = load double, ptr @254, align 8
  store double %constant_2461_3627, ptr %accumulator_026, align 8
  store i32 0, ptr %reduce.278.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.278.1.clone.1.inner.loop_header.reduction_dim.0

reduce.278.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.278.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.277.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.278.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.278.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %52 = icmp uge i32 %reduce.278.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %52, label %reduce.278.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.278.1.clone.1.inner.loop_body.reduction_dim.0

reduce.278.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.278.1.clone.1.inner.loop_header.reduction_dim.0
  %53 = load double, ptr %accumulator_026, align 8
  %54 = getelementptr inbounds [20 x double], ptr %arg17, i32 0, i32 %reduce.278.1.clone.1.inner.indvar.reduction_dim.0
  %55 = load double, ptr %54, align 8, !invariant.load !349
  %56 = getelementptr inbounds [20 x double], ptr %arg18, i32 0, i32 %reduce.278.1.clone.1.inner.indvar.reduction_dim.0
  %57 = load double, ptr %56, align 8, !invariant.load !349
  %multiply.11899.1.clone.1 = fmul double %55, %57
  store double %53, ptr %parameter_buffer29, align 8
  store double %multiply.11899.1.clone.1, ptr %parameter_buffer30, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer29, ptr %parameter_buffer30, ptr %return_buffer31)
  %58 = load double, ptr %return_buffer31, align 8
  store double %58, ptr %accumulator_026, align 8
  %invar.inc28 = add nuw nsw i32 %reduce.278.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc28, ptr %reduce.278.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.278.1.clone.1.inner.loop_header.reduction_dim.0

reduce.278.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.278.1.clone.1.inner.loop_header.reduction_dim.0
  %59 = load double, ptr %accumulator_026, align 8
  %add.10048.1.clone.1 = fadd double %add.10047.1.clone.1, %59
  %constant_2461_3633 = load double, ptr @254, align 8
  store double %constant_2461_3633, ptr %accumulator_032, align 8
  store i32 0, ptr %reduce.279.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.279.1.clone.1.inner.loop_header.reduction_dim.0

reduce.279.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.279.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.278.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.279.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.279.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %60 = icmp uge i32 %reduce.279.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %60, label %reduce.279.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.279.1.clone.1.inner.loop_body.reduction_dim.0

reduce.279.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.279.1.clone.1.inner.loop_header.reduction_dim.0
  %61 = load double, ptr %accumulator_032, align 8
  %62 = getelementptr inbounds [20 x double], ptr %arg8, i32 0, i32 %reduce.279.1.clone.1.inner.indvar.reduction_dim.0
  %63 = load double, ptr %62, align 8, !invariant.load !349
  %64 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %reduce.279.1.clone.1.inner.indvar.reduction_dim.0
  %65 = load double, ptr %64, align 8, !invariant.load !349
  %multiply.11900.1.clone.1 = fmul double %63, %65
  store double %61, ptr %parameter_buffer35, align 8
  store double %multiply.11900.1.clone.1, ptr %parameter_buffer36, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer35, ptr %parameter_buffer36, ptr %return_buffer37)
  %66 = load double, ptr %return_buffer37, align 8
  store double %66, ptr %accumulator_032, align 8
  %invar.inc34 = add nuw nsw i32 %reduce.279.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc34, ptr %reduce.279.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.279.1.clone.1.inner.loop_header.reduction_dim.0

reduce.279.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.279.1.clone.1.inner.loop_header.reduction_dim.0
  %67 = load double, ptr %accumulator_032, align 8
  %add.10049.1.clone.1 = fadd double %add.10048.1.clone.1, %67
  %68 = insertvalue { double, double } %19, double %add.10049.1.clone.1, 1
  %69 = extractvalue { double, double } %68, 0
  store double %69, ptr %arg19, align 8
  %70 = extractvalue { double, double } %68, 1
  store double %70, ptr %arg20, align 8
  br label %loop_add_fusion.39.in_bounds-after
}

define void @input_reduce_fusion_7(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %return_buffer46 = alloca double, align 8
  %result_from_other_lane44 = alloca double, align 8
  %return_buffer43 = alloca double, align 8
  %result_from_other_lane41 = alloca double, align 8
  %return_buffer40 = alloca double, align 8
  %result_from_other_lane38 = alloca double, align 8
  %return_buffer37 = alloca double, align 8
  %result_from_other_lane35 = alloca double, align 8
  %return_buffer34 = alloca double, align 8
  %result_from_other_lane32 = alloca double, align 8
  %initial_value_addr = alloca double, align 8
  %return_buffer31 = alloca double, align 8
  %result_from_other_lane29 = alloca double, align 8
  %return_buffer28 = alloca double, align 8
  %result_from_other_lane26 = alloca double, align 8
  %return_buffer25 = alloca double, align 8
  %result_from_other_lane23 = alloca double, align 8
  %return_buffer22 = alloca double, align 8
  %result_from_other_lane20 = alloca double, align 8
  %return_buffer19 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer17 = alloca double, align 8
  %loop3.invar_address12 = alloca i32, align 4
  %loop2.invar_address6 = alloca i32, align 4
  %return_buffer = alloca double, align 8
  %loop3.invar_address = alloca i32, align 4
  %loop2.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !348
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_2461_57 = load double, ptr @257, align 8
  store double %constant_2461_57, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !364
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %thread.id.2 = urem i32 %thread.id.x, 256
  %lane_id = urem i32 %thread.id.x, 32
  %1 = udiv i32 %block.id.x, 1
  %2 = urem i32 %1, 1
  %3 = udiv i32 %block.id.x, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %block.id.x, 1
  %6 = urem i32 %5, 1
  %7 = udiv i32 %block.id.x, 1
  %8 = icmp eq i32 %4, 0
  %tile_bound.2 = select i1 %8, i32 1920, i32 2048
  %tile_origin.0 = mul i32 %7, 1
  %tile_origin.1 = mul i32 %6, 1
  %tile_origin.2 = mul i32 %4, 2048
  %tile_origin.3 = mul i32 %2, 2
  %9 = icmp eq i32 2048, %tile_bound.2
  br i1 %9, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %loop2.loop_exit3, %loop2.loop_exit
  %partial_reduction_result18 = load double, ptr %partial_reduction_result, align 8
  %10 = bitcast double %partial_reduction_result18 to i64
  %11 = bitcast i64 %10 to <2 x i32>
  %12 = extractelement <2 x i32> %11, i64 0
  %13 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 16, i32 31)
  %14 = insertelement <2 x i32> %11, i32 %13, i64 0
  %15 = extractelement <2 x i32> %14, i64 1
  %16 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 16, i32 31)
  %17 = insertelement <2 x i32> %14, i32 %16, i64 1
  %18 = bitcast <2 x i32> %17 to i64
  %19 = bitcast i64 %18 to double
  store double %19, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer19)
  %20 = load double, ptr %return_buffer19, align 8
  store double %20, ptr %partial_reduction_result, align 8
  %partial_reduction_result21 = load double, ptr %partial_reduction_result, align 8
  %21 = bitcast double %partial_reduction_result21 to i64
  %22 = bitcast i64 %21 to <2 x i32>
  %23 = extractelement <2 x i32> %22, i64 0
  %24 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 8, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 0
  %26 = extractelement <2 x i32> %25, i64 1
  %27 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 8, i32 31)
  %28 = insertelement <2 x i32> %25, i32 %27, i64 1
  %29 = bitcast <2 x i32> %28 to i64
  %30 = bitcast i64 %29 to double
  store double %30, ptr %result_from_other_lane20, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane20, ptr %return_buffer22)
  %31 = load double, ptr %return_buffer22, align 8
  store double %31, ptr %partial_reduction_result, align 8
  %partial_reduction_result24 = load double, ptr %partial_reduction_result, align 8
  %32 = bitcast double %partial_reduction_result24 to i64
  %33 = bitcast i64 %32 to <2 x i32>
  %34 = extractelement <2 x i32> %33, i64 0
  %35 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 4, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 0
  %37 = extractelement <2 x i32> %36, i64 1
  %38 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 4, i32 31)
  %39 = insertelement <2 x i32> %36, i32 %38, i64 1
  %40 = bitcast <2 x i32> %39 to i64
  %41 = bitcast i64 %40 to double
  store double %41, ptr %result_from_other_lane23, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane23, ptr %return_buffer25)
  %42 = load double, ptr %return_buffer25, align 8
  store double %42, ptr %partial_reduction_result, align 8
  %partial_reduction_result27 = load double, ptr %partial_reduction_result, align 8
  %43 = bitcast double %partial_reduction_result27 to i64
  %44 = bitcast i64 %43 to <2 x i32>
  %45 = extractelement <2 x i32> %44, i64 0
  %46 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 2, i32 31)
  %47 = insertelement <2 x i32> %44, i32 %46, i64 0
  %48 = extractelement <2 x i32> %47, i64 1
  %49 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 2, i32 31)
  %50 = insertelement <2 x i32> %47, i32 %49, i64 1
  %51 = bitcast <2 x i32> %50 to i64
  %52 = bitcast i64 %51 to double
  store double %52, ptr %result_from_other_lane26, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane26, ptr %return_buffer28)
  %53 = load double, ptr %return_buffer28, align 8
  store double %53, ptr %partial_reduction_result, align 8
  %partial_reduction_result30 = load double, ptr %partial_reduction_result, align 8
  %54 = bitcast double %partial_reduction_result30 to i64
  %55 = bitcast i64 %54 to <2 x i32>
  %56 = extractelement <2 x i32> %55, i64 0
  %57 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 1, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 0
  %59 = extractelement <2 x i32> %58, i64 1
  %60 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %59, i32 1, i32 31)
  %61 = insertelement <2 x i32> %58, i32 %60, i64 1
  %62 = bitcast <2 x i32> %61 to i64
  %63 = bitcast i64 %62 to double
  store double %63, ptr %result_from_other_lane29, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane29, ptr %return_buffer31)
  %64 = load double, ptr %return_buffer31, align 8
  store double %64, ptr %partial_reduction_result, align 8
  %65 = udiv i32 %thread.id.2, 32
  br i1 true, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %inter_warp_reduce-after, %is_full_tile-after
  br label %reduce-group-0-after

is_full_tile-true:                                ; preds = %reduce-group-0-true
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %loop3.loop_exit, %is_full_tile-true
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %66 = icmp uge i32 %loop2.indvar, 2048
  br i1 %66, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc = add nuw nsw i32 %loop2.indvar, 256
  store i32 %invar.inc, ptr %loop2.invar_address, align 4
  %67 = add i32 %loop2.indvar, %thread.id.2
  store i32 0, ptr %loop3.invar_address, align 4
  br label %loop3.loop_header

loop3.loop_header:                                ; preds = %loop3.loop_body, %loop2.loop_body
  %loop3.indvar = load i32, ptr %loop3.invar_address, align 4
  %68 = icmp uge i32 %loop3.indvar, 2
  br i1 %68, label %loop3.loop_exit, label %loop3.loop_body

loop3.loop_body:                                  ; preds = %loop3.loop_header
  %invar.inc1 = add nuw nsw i32 %loop3.indvar, 1
  store i32 %invar.inc1, ptr %loop3.invar_address, align 4
  %69 = add i32 %tile_origin.0, 0
  %70 = add i32 %tile_origin.1, 0
  %71 = add i32 %tile_origin.2, %67
  %72 = add i32 %tile_origin.3, %loop3.indvar
  %73 = mul nuw nsw i32 %72, 1
  %74 = add nuw nsw i32 0, %73
  %75 = mul nuw nsw i32 %71, 2
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 3840
  %78 = mul nuw nsw i32 %70, 1
  %79 = add nuw nsw i32 0, %78
  %80 = mul nuw nsw i32 %69, 1
  %81 = add nuw nsw i32 0, %80
  %82 = mul nuw nsw i32 %76, 1
  %83 = add nuw nsw i32 0, %82
  %84 = urem i32 %83, 192
  %85 = udiv i32 %83, 192
  %86 = udiv i32 %85, 20
  %param_0.6134 = getelementptr inbounds [20 x [192 x [1 x double]]], ptr %arg0, i32 0, i32 %85, i32 %84, i32 0
  %param_0.61342 = load double, ptr %param_0.6134, align 8, !invariant.load !349
  store double %param_0.61342, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %87 = load double, ptr %return_buffer, align 8
  store double %87, ptr %partial_reduction_result, align 8
  br label %loop3.loop_header, !llvm.loop !365

loop3.loop_exit:                                  ; preds = %loop3.loop_header
  br label %loop2.loop_header, !llvm.loop !366

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %reduce-group-0-true
  store i32 0, ptr %loop2.invar_address6, align 4
  br label %loop2.loop_header4

loop2.loop_header4:                               ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar7 = load i32, ptr %loop2.invar_address6, align 4
  %88 = icmp uge i32 %loop2.indvar7, 2048
  br i1 %88, label %loop2.loop_exit3, label %loop2.loop_body5

loop2.loop_body5:                                 ; preds = %loop2.loop_header4
  %invar.inc8 = add nuw nsw i32 %loop2.indvar7, 256
  store i32 %invar.inc8, ptr %loop2.invar_address6, align 4
  %89 = add i32 %loop2.indvar7, %thread.id.2
  %90 = icmp ult i32 %89, %tile_bound.2
  br i1 %90, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %loop3.loop_exit9, %loop2.loop_body5
  br label %loop2.loop_header4, !llvm.loop !367

loop2.loop_exit3:                                 ; preds = %loop2.loop_header4
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %loop2.loop_body5
  store i32 0, ptr %loop3.invar_address12, align 4
  br label %loop3.loop_header10

loop3.loop_header10:                              ; preds = %loop3.loop_body11, %x_in_tile-true
  %loop3.indvar13 = load i32, ptr %loop3.invar_address12, align 4
  %91 = icmp uge i32 %loop3.indvar13, 2
  br i1 %91, label %loop3.loop_exit9, label %loop3.loop_body11

loop3.loop_body11:                                ; preds = %loop3.loop_header10
  %invar.inc14 = add nuw nsw i32 %loop3.indvar13, 1
  store i32 %invar.inc14, ptr %loop3.invar_address12, align 4
  %92 = add i32 %tile_origin.0, 0
  %93 = add i32 %tile_origin.1, 0
  %94 = add i32 %tile_origin.2, %89
  %95 = add i32 %tile_origin.3, %loop3.indvar13
  %96 = mul nuw nsw i32 %95, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %94, 2
  %99 = add nuw nsw i32 %97, %98
  %100 = udiv i32 %99, 3840
  %101 = mul nuw nsw i32 %93, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %92, 1
  %104 = add nuw nsw i32 0, %103
  %105 = mul nuw nsw i32 %99, 1
  %106 = add nuw nsw i32 0, %105
  %107 = urem i32 %106, 192
  %108 = udiv i32 %106, 192
  %109 = udiv i32 %108, 20
  %param_0.613415 = getelementptr inbounds [20 x [192 x [1 x double]]], ptr %arg0, i32 0, i32 %108, i32 %107, i32 0
  %param_0.613416 = load double, ptr %param_0.613415, align 8, !invariant.load !349
  store double %param_0.613416, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer17)
  %110 = load double, ptr %return_buffer17, align 8
  store double %110, ptr %partial_reduction_result, align 8
  br label %loop3.loop_header10, !llvm.loop !368

loop3.loop_exit9:                                 ; preds = %loop3.loop_header10
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %is_full_tile-after
  %111 = icmp eq i32 %lane_id, 0
  br i1 %111, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  call void @llvm.nvvm.barrier0()
  %112 = icmp eq i32 %65, 0
  br i1 %112, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  %113 = load double, ptr %partial_reduction_result, align 8
  %114 = getelementptr inbounds [1 x [8 x double]], ptr addrspace(3) @shared_cache2, i32 0, i32 0, i32 %65
  %115 = addrspacecast ptr addrspace(3) %114 to ptr
  store double %113, ptr %115, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %116 = getelementptr inbounds [1 x [8 x double]], ptr addrspace(3) @shared_cache2, i32 0, i32 0, i32 %lane_id
  %117 = addrspacecast ptr addrspace(3) %116 to ptr
  store double %constant_2461_57, ptr %initial_value_addr, align 8
  %118 = icmp ult i32 %thread.id.2, 8
  %119 = select i1 %118, ptr %117, ptr %initial_value_addr
  %partial_reduction_result33 = load double, ptr %119, align 8
  %120 = bitcast double %partial_reduction_result33 to i64
  %121 = bitcast i64 %120 to <2 x i32>
  %122 = extractelement <2 x i32> %121, i64 0
  %123 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %122, i32 16, i32 31)
  %124 = insertelement <2 x i32> %121, i32 %123, i64 0
  %125 = extractelement <2 x i32> %124, i64 1
  %126 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %125, i32 16, i32 31)
  %127 = insertelement <2 x i32> %124, i32 %126, i64 1
  %128 = bitcast <2 x i32> %127 to i64
  %129 = bitcast i64 %128 to double
  store double %129, ptr %result_from_other_lane32, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %119, ptr %result_from_other_lane32, ptr %return_buffer34)
  %130 = load double, ptr %return_buffer34, align 8
  store double %130, ptr %119, align 8
  %partial_reduction_result36 = load double, ptr %119, align 8
  %131 = bitcast double %partial_reduction_result36 to i64
  %132 = bitcast i64 %131 to <2 x i32>
  %133 = extractelement <2 x i32> %132, i64 0
  %134 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %133, i32 8, i32 31)
  %135 = insertelement <2 x i32> %132, i32 %134, i64 0
  %136 = extractelement <2 x i32> %135, i64 1
  %137 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %136, i32 8, i32 31)
  %138 = insertelement <2 x i32> %135, i32 %137, i64 1
  %139 = bitcast <2 x i32> %138 to i64
  %140 = bitcast i64 %139 to double
  store double %140, ptr %result_from_other_lane35, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %119, ptr %result_from_other_lane35, ptr %return_buffer37)
  %141 = load double, ptr %return_buffer37, align 8
  store double %141, ptr %119, align 8
  %partial_reduction_result39 = load double, ptr %119, align 8
  %142 = bitcast double %partial_reduction_result39 to i64
  %143 = bitcast i64 %142 to <2 x i32>
  %144 = extractelement <2 x i32> %143, i64 0
  %145 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %144, i32 4, i32 31)
  %146 = insertelement <2 x i32> %143, i32 %145, i64 0
  %147 = extractelement <2 x i32> %146, i64 1
  %148 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %147, i32 4, i32 31)
  %149 = insertelement <2 x i32> %146, i32 %148, i64 1
  %150 = bitcast <2 x i32> %149 to i64
  %151 = bitcast i64 %150 to double
  store double %151, ptr %result_from_other_lane38, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %119, ptr %result_from_other_lane38, ptr %return_buffer40)
  %152 = load double, ptr %return_buffer40, align 8
  store double %152, ptr %119, align 8
  %partial_reduction_result42 = load double, ptr %119, align 8
  %153 = bitcast double %partial_reduction_result42 to i64
  %154 = bitcast i64 %153 to <2 x i32>
  %155 = extractelement <2 x i32> %154, i64 0
  %156 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %155, i32 2, i32 31)
  %157 = insertelement <2 x i32> %154, i32 %156, i64 0
  %158 = extractelement <2 x i32> %157, i64 1
  %159 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %158, i32 2, i32 31)
  %160 = insertelement <2 x i32> %157, i32 %159, i64 1
  %161 = bitcast <2 x i32> %160 to i64
  %162 = bitcast i64 %161 to double
  store double %162, ptr %result_from_other_lane41, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %119, ptr %result_from_other_lane41, ptr %return_buffer43)
  %163 = load double, ptr %return_buffer43, align 8
  store double %163, ptr %119, align 8
  %partial_reduction_result45 = load double, ptr %119, align 8
  %164 = bitcast double %partial_reduction_result45 to i64
  %165 = bitcast i64 %164 to <2 x i32>
  %166 = extractelement <2 x i32> %165, i64 0
  %167 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %166, i32 1, i32 31)
  %168 = insertelement <2 x i32> %165, i32 %167, i64 0
  %169 = extractelement <2 x i32> %168, i64 1
  %170 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %169, i32 1, i32 31)
  %171 = insertelement <2 x i32> %168, i32 %170, i64 1
  %172 = bitcast <2 x i32> %171 to i64
  %173 = bitcast i64 %172 to double
  store double %173, ptr %result_from_other_lane44, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %119, ptr %result_from_other_lane44, ptr %return_buffer46)
  %174 = load double, ptr %return_buffer46, align 8
  store double %174, ptr %119, align 8
  %175 = icmp eq i32 %thread.id.2, 0
  br i1 %175, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %176 = add i32 %tile_origin.1, 0
  %output = load double, ptr %119, align 8
  store double %output, ptr %arg1, align 8
  br label %reduction_write_output-after
}

define void @loop_negate_or_select_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(160) %arg12, ptr noalias align 128 dereferenceable(8) %arg13, ptr noalias align 128 dereferenceable(1) %arg14, ptr noalias align 128 dereferenceable(1) %arg15, ptr noalias align 128 dereferenceable(8) %arg16) {
entry:
  %return_buffer32 = alloca double, align 8
  %parameter_buffer31 = alloca double, align 8
  %parameter_buffer30 = alloca double, align 8
  %reduce.260.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_025 = alloca double, align 8
  %return_buffer24 = alloca double, align 8
  %parameter_buffer23 = alloca double, align 8
  %parameter_buffer22 = alloca double, align 8
  %reduce.258.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_016 = alloca double, align 8
  %return_buffer15 = alloca double, align 8
  %parameter_buffer14 = alloca double, align 8
  %parameter_buffer13 = alloca double, align 8
  %reduce.257.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_09 = alloca double, align 8
  %return_buffer8 = alloca double, align 8
  %parameter_buffer7 = alloca double, align 8
  %parameter_buffer6 = alloca double, align 8
  %reduce.256.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.255.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_negate_or_select_fusion.in_bounds-true, label %loop_negate_or_select_fusion.in_bounds-after

loop_negate_or_select_fusion.in_bounds-after:     ; preds = %reduce.260.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_negate_or_select_fusion.in_bounds-true:      ; preds = %entry
  %4 = load double, ptr %arg3, align 8, !invariant.load !349
  %5 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_2526_3_clone_1 = load double, ptr @273, align 8
  %multiply.11901.5.clone.1 = fmul double %5, %constant_2526_3_clone_1
  %subtract.876.5.clone.1 = fsub double %4, %multiply.11901.5.clone.1
  %constant_2461_8_clone_1 = load double, ptr @258, align 8
  store double %constant_2461_8_clone_1, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.255.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.255.1.clone.1.inner.loop_header.reduction_dim.0

reduce.255.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.255.1.clone.1.inner.loop_body.reduction_dim.0, %loop_negate_or_select_fusion.in_bounds-true
  %reduce.255.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.255.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %6 = icmp uge i32 %reduce.255.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %6, label %reduce.255.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.255.1.clone.1.inner.loop_body.reduction_dim.0

reduce.255.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.255.1.clone.1.inner.loop_header.reduction_dim.0
  %7 = load double, ptr %accumulator_0, align 8
  %8 = getelementptr inbounds [20 x double], ptr %arg9, i32 0, i32 %reduce.255.1.clone.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %constant_2570_4_clone_1 = load double, ptr @268, align 8
  %add.10039.13.clone.1 = fadd double %9, %constant_2570_4_clone_1
  %multiply.11902.7.clone.1 = fmul double %add.10039.13.clone.1, %add.10039.13.clone.1
  %constant_2563_4_clone_1 = load double, ptr @263, align 8
  %multiply.11903.7.clone.1 = fmul double %multiply.11902.7.clone.1, %constant_2563_4_clone_1
  %constant_2527_2_clone_1 = load double, ptr @262, align 8
  %add.10050.5.clone.1 = fadd double %multiply.11903.7.clone.1, %constant_2527_2_clone_1
  %constant_2564_1_clone_1 = load double, ptr @259, align 8
  %multiply.11904.3.clone.1 = fmul double %add.10050.5.clone.1, %constant_2564_1_clone_1
  store double %7, ptr %parameter_buffer, align 8
  store double %multiply.11904.3.clone.1, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %10 = load double, ptr %return_buffer, align 8
  store double %10, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.255.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.255.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.255.1.clone.1.inner.loop_header.reduction_dim.0

reduce.255.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.255.1.clone.1.inner.loop_header.reduction_dim.0
  %11 = load double, ptr %accumulator_0, align 8
  %constant_2461_8_clone_13 = load double, ptr @258, align 8
  store double %constant_2461_8_clone_13, ptr %accumulator_02, align 8
  store i32 0, ptr %reduce.256.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.256.1.clone.1.inner.loop_header.reduction_dim.0

reduce.256.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.256.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.255.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.256.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.256.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %12 = icmp uge i32 %reduce.256.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %12, label %reduce.256.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.256.1.clone.1.inner.loop_body.reduction_dim.0

reduce.256.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.256.1.clone.1.inner.loop_header.reduction_dim.0
  %13 = load double, ptr %accumulator_02, align 8
  %14 = getelementptr inbounds [20 x double], ptr %arg7, i32 0, i32 %reduce.256.1.clone.1.inner.indvar.reduction_dim.0
  %15 = load double, ptr %14, align 8, !invariant.load !349
  %16 = load double, ptr %arg1, align 8, !invariant.load !349
  %17 = getelementptr inbounds [20 x double], ptr %arg8, i32 0, i32 %reduce.256.1.clone.1.inner.indvar.reduction_dim.0
  %18 = load double, ptr %17, align 8, !invariant.load !349
  %multiply.11866.15.clone.1 = fmul double %16, %18
  %add.10019.15.clone.1 = fadd double %15, %multiply.11866.15.clone.1
  %constant_2907_2_clone_1 = load double, ptr @267, align 8
  %add.10033.11.clone.1 = fadd double %add.10019.15.clone.1, %constant_2907_2_clone_1
  %multiply.11905.7.clone.1 = fmul double %add.10033.11.clone.1, %add.10033.11.clone.1
  %constant_2565_1_clone_1 = load double, ptr @266, align 8
  %multiply.11906.7.clone.1 = fmul double %multiply.11905.7.clone.1, %constant_2565_1_clone_1
  %constant_2528_1_clone_1 = load double, ptr @265, align 8
  %add.10051.5.clone.1 = fadd double %multiply.11906.7.clone.1, %constant_2528_1_clone_1
  %constant_2564_1_clone_15 = load double, ptr @259, align 8
  %multiply.11907.3.clone.1 = fmul double %add.10051.5.clone.1, %constant_2564_1_clone_15
  store double %13, ptr %parameter_buffer6, align 8
  store double %multiply.11907.3.clone.1, ptr %parameter_buffer7, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer6, ptr %parameter_buffer7, ptr %return_buffer8)
  %19 = load double, ptr %return_buffer8, align 8
  store double %19, ptr %accumulator_02, align 8
  %invar.inc4 = add nuw nsw i32 %reduce.256.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.256.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.256.1.clone.1.inner.loop_header.reduction_dim.0

reduce.256.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.256.1.clone.1.inner.loop_header.reduction_dim.0
  %20 = load double, ptr %accumulator_02, align 8
  %add.10052.1.clone.1 = fadd double %11, %20
  %constant_2461_8_clone_110 = load double, ptr @258, align 8
  store double %constant_2461_8_clone_110, ptr %accumulator_09, align 8
  store i32 0, ptr %reduce.257.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.257.1.clone.1.inner.loop_header.reduction_dim.0

reduce.257.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.257.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.256.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.257.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.257.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %21 = icmp uge i32 %reduce.257.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %21, label %reduce.257.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.257.1.clone.1.inner.loop_body.reduction_dim.0

reduce.257.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.257.1.clone.1.inner.loop_header.reduction_dim.0
  %22 = load double, ptr %accumulator_09, align 8
  %23 = getelementptr inbounds [20 x double], ptr %arg10, i32 0, i32 %reduce.257.1.clone.1.inner.indvar.reduction_dim.0
  %24 = load double, ptr %23, align 8, !invariant.load !349
  %25 = load double, ptr %arg1, align 8, !invariant.load !349
  %26 = getelementptr inbounds [20 x double], ptr %arg11, i32 0, i32 %reduce.257.1.clone.1.inner.indvar.reduction_dim.0
  %27 = load double, ptr %26, align 8, !invariant.load !349
  %multiply.11874.15.clone.1 = fmul double %25, %27
  %add.10025.15.clone.1 = fadd double %24, %multiply.11874.15.clone.1
  %multiply.11908.5.clone.1 = fmul double %add.10025.15.clone.1, %add.10025.15.clone.1
  %constant_2529_1_clone_1 = load double, ptr @260, align 8
  %add.10053.5.clone.1 = fadd double %multiply.11908.5.clone.1, %constant_2529_1_clone_1
  %constant_2564_1_clone_112 = load double, ptr @259, align 8
  %multiply.11909.3.clone.1 = fmul double %add.10053.5.clone.1, %constant_2564_1_clone_112
  store double %22, ptr %parameter_buffer13, align 8
  store double %multiply.11909.3.clone.1, ptr %parameter_buffer14, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer13, ptr %parameter_buffer14, ptr %return_buffer15)
  %28 = load double, ptr %return_buffer15, align 8
  store double %28, ptr %accumulator_09, align 8
  %invar.inc11 = add nuw nsw i32 %reduce.257.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc11, ptr %reduce.257.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.257.1.clone.1.inner.loop_header.reduction_dim.0

reduce.257.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.257.1.clone.1.inner.loop_header.reduction_dim.0
  %29 = load double, ptr %accumulator_09, align 8
  %add.10054.1.clone.1 = fadd double %add.10052.1.clone.1, %29
  %constant_2461_8_clone_117 = load double, ptr @258, align 8
  store double %constant_2461_8_clone_117, ptr %accumulator_016, align 8
  store i32 0, ptr %reduce.258.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.258.1.clone.1.inner.loop_header.reduction_dim.0

reduce.258.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.258.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.257.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.258.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.258.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %30 = icmp uge i32 %reduce.258.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %30, label %reduce.258.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.258.1.clone.1.inner.loop_body.reduction_dim.0

reduce.258.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.258.1.clone.1.inner.loop_header.reduction_dim.0
  %31 = load double, ptr %accumulator_016, align 8
  %32 = getelementptr inbounds [20 x double], ptr %arg12, i32 0, i32 %reduce.258.1.clone.1.inner.indvar.reduction_dim.0
  %33 = load double, ptr %32, align 8, !invariant.load !349
  %constant_2913_2_clone_1 = load double, ptr @264, align 8
  %add.10042.13.clone.1 = fadd double %33, %constant_2913_2_clone_1
  %multiply.11910.7.clone.1 = fmul double %add.10042.13.clone.1, %add.10042.13.clone.1
  %constant_2563_4_clone_119 = load double, ptr @263, align 8
  %multiply.11911.7.clone.1 = fmul double %multiply.11910.7.clone.1, %constant_2563_4_clone_119
  %constant_2527_2_clone_120 = load double, ptr @262, align 8
  %add.10055.5.clone.1 = fadd double %multiply.11911.7.clone.1, %constant_2527_2_clone_120
  %constant_2564_1_clone_121 = load double, ptr @259, align 8
  %multiply.11912.3.clone.1 = fmul double %add.10055.5.clone.1, %constant_2564_1_clone_121
  store double %31, ptr %parameter_buffer22, align 8
  store double %multiply.11912.3.clone.1, ptr %parameter_buffer23, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer22, ptr %parameter_buffer23, ptr %return_buffer24)
  %34 = load double, ptr %return_buffer24, align 8
  store double %34, ptr %accumulator_016, align 8
  %invar.inc18 = add nuw nsw i32 %reduce.258.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc18, ptr %reduce.258.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.258.1.clone.1.inner.loop_header.reduction_dim.0

reduce.258.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.258.1.clone.1.inner.loop_header.reduction_dim.0
  %35 = load double, ptr %accumulator_016, align 8
  %add.10056.1.clone.1 = fadd double %add.10054.1.clone.1, %35
  %36 = load double, ptr %arg6, align 8, !invariant.load !349
  %add.10058.1.clone.1 = fadd double %add.10056.1.clone.1, %36
  %constant_2461_8_clone_126 = load double, ptr @258, align 8
  store double %constant_2461_8_clone_126, ptr %accumulator_025, align 8
  store i32 0, ptr %reduce.260.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.260.1.clone.1.inner.loop_header.reduction_dim.0

reduce.260.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.260.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.258.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.260.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.260.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %37 = icmp uge i32 %reduce.260.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %37, label %reduce.260.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.260.1.clone.1.inner.loop_body.reduction_dim.0

reduce.260.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.260.1.clone.1.inner.loop_header.reduction_dim.0
  %38 = load double, ptr %accumulator_025, align 8
  %39 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %reduce.260.1.clone.1.inner.indvar.reduction_dim.0
  %40 = load double, ptr %39, align 8, !invariant.load !349
  %constant_2460_11_clone_1 = load double, ptr @261, align 8
  %add.10036.13.clone.1 = fadd double %40, %constant_2460_11_clone_1
  %multiply.11916.5.clone.1 = fmul double %add.10036.13.clone.1, %add.10036.13.clone.1
  %constant_2529_1_clone_128 = load double, ptr @260, align 8
  %add.10059.5.clone.1 = fadd double %multiply.11916.5.clone.1, %constant_2529_1_clone_128
  %constant_2564_1_clone_129 = load double, ptr @259, align 8
  %multiply.11917.3.clone.1 = fmul double %add.10059.5.clone.1, %constant_2564_1_clone_129
  store double %38, ptr %parameter_buffer30, align 8
  store double %multiply.11917.3.clone.1, ptr %parameter_buffer31, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer30, ptr %parameter_buffer31, ptr %return_buffer32)
  %41 = load double, ptr %return_buffer32, align 8
  store double %41, ptr %accumulator_025, align 8
  %invar.inc27 = add nuw nsw i32 %reduce.260.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc27, ptr %reduce.260.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.260.1.clone.1.inner.loop_header.reduction_dim.0

reduce.260.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.260.1.clone.1.inner.loop_header.reduction_dim.0
  %42 = load double, ptr %accumulator_025, align 8
  %add.10060.1.clone.1 = fadd double %add.10058.1.clone.1, %42
  %43 = load double, ptr %arg4, align 8, !invariant.load !349
  %add.10061.1.clone.1 = fadd double %add.10060.1.clone.1, %43
  %44 = fneg double %add.10061.1.clone.1
  %45 = load double, ptr %arg0, align 8, !invariant.load !349
  %subtract.878.5.clone.1 = fsub double %44, %45
  %46 = load double, ptr %arg0, align 8, !invariant.load !349
  %47 = call double @llvm.fabs.f64(double %46)
  %constant_2476_4_clone_1 = load double, ptr @272, align 8
  %multiply.11918.5.clone.1 = fmul double %47, %constant_2476_4_clone_1
  %subtract.879.5.clone.1 = fsub double %subtract.878.5.clone.1, %multiply.11918.5.clone.1
  %48 = fcmp une double %subtract.876.5.clone.1, %subtract.876.5.clone.1
  %49 = fcmp oeq double %subtract.879.5.clone.1, %subtract.879.5.clone.1
  %50 = fcmp oge double %subtract.876.5.clone.1, %subtract.879.5.clone.1
  %51 = and i1 %49, %50
  %52 = or i1 %48, %51
  %maximum.74.5.clone.1 = select i1 %52, double %subtract.876.5.clone.1, double %subtract.879.5.clone.1
  %53 = load double, ptr %arg1, align 8, !invariant.load !349
  %constant_2531_3_clone_1 = load double, ptr @271, align 8
  %multiply.11919.5.clone.1 = fmul double %53, %constant_2531_3_clone_1
  %54 = load double, ptr %arg2, align 8, !invariant.load !349
  %multiply.11920.5.clone.1 = fmul double %multiply.11919.5.clone.1, %54
  %subtract.880.5.clone.1 = fsub double %subtract.878.5.clone.1, %multiply.11920.5.clone.1
  %55 = fcmp une double %maximum.74.5.clone.1, %maximum.74.5.clone.1
  %56 = fcmp oeq double %subtract.880.5.clone.1, %subtract.880.5.clone.1
  %57 = fcmp ole double %maximum.74.5.clone.1, %subtract.880.5.clone.1
  %58 = and i1 %56, %57
  %59 = or i1 %55, %58
  %minimum.28.5.clone.1 = select i1 %59, double %maximum.74.5.clone.1, double %subtract.880.5.clone.1
  %constant_2461_8_clone_133 = load double, ptr @258, align 8
  %60 = fcmp une double %minimum.28.5.clone.1, %minimum.28.5.clone.1
  %61 = fcmp oeq double %constant_2461_8_clone_133, %constant_2461_8_clone_133
  %62 = fcmp oge double %minimum.28.5.clone.1, %constant_2461_8_clone_133
  %63 = and i1 %61, %62
  %64 = or i1 %60, %63
  %maximum.75.5.clone.1 = select i1 %64, double %minimum.28.5.clone.1, double %constant_2461_8_clone_133
  %compare.2749.5.clone.1 = fcmp une double %maximum.75.5.clone.1, %maximum.75.5.clone.1
  %65 = zext i1 %compare.2749.5.clone.1 to i8
  %constant_2532_1_clone_1 = load double, ptr @270, align 8
  %66 = trunc i8 %65 to i1
  %67 = select i1 %66, double %constant_2532_1_clone_1, double %maximum.75.5.clone.1
  %68 = load double, ptr %arg3, align 8, !invariant.load !349
  %69 = call double @llvm.fabs.f64(double %68)
  %70 = load double, ptr %arg2, align 8, !invariant.load !349
  %71 = call double @llvm.fabs.f64(double %70)
  %constant_2533_1_clone_1 = load double, ptr @269, align 8
  %multiply.11921.5.clone.1 = fmul double %71, %constant_2533_1_clone_1
  %subtract.881.5.clone.1 = fsub double %69, %multiply.11921.5.clone.1
  %constant_2461_8_clone_134 = load double, ptr @258, align 8
  %72 = fcmp une double %subtract.881.5.clone.1, %subtract.881.5.clone.1
  %73 = fcmp oeq double %constant_2461_8_clone_134, %constant_2461_8_clone_134
  %74 = fcmp oge double %subtract.881.5.clone.1, %constant_2461_8_clone_134
  %75 = and i1 %73, %74
  %76 = or i1 %72, %75
  %maximum.76.5.clone.1 = select i1 %76, double %subtract.881.5.clone.1, double %constant_2461_8_clone_134
  %compare.2750.5.clone.1 = fcmp une double %maximum.76.5.clone.1, %maximum.76.5.clone.1
  %77 = zext i1 %compare.2750.5.clone.1 to i8
  %constant_2532_1_clone_135 = load double, ptr @270, align 8
  %78 = trunc i8 %77 to i1
  %79 = select i1 %78, double %constant_2532_1_clone_135, double %maximum.76.5.clone.1
  %80 = fcmp une double %67, %67
  %81 = fcmp oeq double %79, %79
  %82 = fcmp oge double %67, %79
  %83 = and i1 %81, %82
  %84 = or i1 %80, %83
  %maximum.77.5.clone.1 = select i1 %84, double %67, double %79
  %constant_2461_8_clone_136 = load double, ptr @258, align 8
  %compare.2751.5.clone.1 = fcmp ole double %maximum.77.5.clone.1, %constant_2461_8_clone_136
  %85 = zext i1 %compare.2751.5.clone.1 to i8
  %86 = load double, ptr %arg1, align 8, !invariant.load !349
  %constant_2470_6_clone_1 = load double, ptr @274, align 8
  %compare.2752.1.clone.1 = fcmp oge double %86, %constant_2470_6_clone_1
  %87 = zext i1 %compare.2752.1.clone.1 to i8
  %constant_2461_8_clone_137 = load double, ptr @258, align 8
  %compare.2753.2.clone.1 = fcmp ogt double %67, %constant_2461_8_clone_137
  %88 = zext i1 %compare.2753.2.clone.1 to i8
  %89 = load double, ptr %arg3, align 8, !invariant.load !349
  %constant_2461_8_clone_138 = load double, ptr @258, align 8
  %compare.2754.5.clone.1 = fcmp oge double %89, %constant_2461_8_clone_138
  %90 = zext i1 %compare.2754.5.clone.1 to i8
  %91 = trunc i8 %88 to i1
  %92 = xor i1 %91, true
  %93 = zext i1 %92 to i8
  %94 = and i8 %90, %93
  %95 = or i8 %88, %94
  %96 = or i8 %95, %85
  %97 = trunc i8 %96 to i1
  %98 = xor i1 %97, true
  %99 = zext i1 %98 to i8
  %100 = and i8 %87, %99
  %101 = or i8 %85, %100
  %102 = load double, ptr %arg0, align 8, !invariant.load !349
  %103 = trunc i8 %101 to i1
  %104 = select i1 %103, double %44, double %102
  %105 = insertvalue { double, i8, i8, double } undef, double %104, 0
  %106 = insertvalue { double, i8, i8, double } %105, i8 %101, 1
  %107 = insertvalue { double, i8, i8, double } %106, i8 %96, 2
  %108 = insertvalue { double, i8, i8, double } %107, double %44, 3
  %109 = extractvalue { double, i8, i8, double } %108, 0
  store double %109, ptr %arg13, align 8
  %110 = extractvalue { double, i8, i8, double } %108, 1
  store i8 %110, ptr %arg14, align 1
  %111 = extractvalue { double, i8, i8, double } %108, 2
  store i8 %111, ptr %arg15, align 1
  %112 = extractvalue { double, i8, i8, double } %108, 3
  store double %112, ptr %arg16, align 8
  br label %loop_negate_or_select_fusion.in_bounds-after
}

define void @loop_select_fusion_36(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.36.in_bounds-true, label %loop_select_fusion.36.in_bounds-after

loop_select_fusion.36.in_bounds-after:            ; preds = %loop_select_fusion.36.in_bounds-true, %entry
  ret void

loop_select_fusion.36.in_bounds-true:             ; preds = %entry
  %5 = load i8, ptr %arg1, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg2, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg3, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %12 = load double, ptr %arg5, align 8, !invariant.load !349
  %13 = getelementptr double, ptr %arg4, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !349
  %multiply.11874.11 = fmul double %12, %15
  %add.10025.11 = fadd double %11, %multiply.11874.11
  %add.10028.1 = fadd double %8, %add.10025.11
  %16 = getelementptr double, ptr %arg0, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !349
  %19 = trunc i8 %5 to i1
  %20 = select i1 %19, double %add.10028.1, double %18
  %21 = insertvalue { double, double } undef, double %20, 0
  %22 = getelementptr double, ptr %arg3, i32 %linear_index
  %23 = getelementptr inbounds double, ptr %22, i32 0
  %24 = load double, ptr %23, align 8, !invariant.load !349
  %25 = trunc i8 %5 to i1
  %26 = select i1 %25, double %add.10025.11, double %24
  %27 = insertvalue { double, double } %21, double %26, 1
  %28 = extractvalue { double, double } %27, 0
  %29 = getelementptr double, ptr %arg6, i32 %linear_index
  %30 = getelementptr inbounds double, ptr %29, i32 0
  store double %28, ptr %30, align 8
  %31 = extractvalue { double, double } %27, 1
  %32 = getelementptr double, ptr %arg7, i32 %linear_index
  %33 = getelementptr inbounds double, ptr %32, i32 0
  store double %31, ptr %33, align 8
  br label %loop_select_fusion.36.in_bounds-after
}

define void @loop_select_fusion_32(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.32.in_bounds-true, label %loop_select_fusion.32.in_bounds-after

loop_select_fusion.32.in_bounds-after:            ; preds = %loop_select_fusion.32.in_bounds-true, %entry
  ret void

loop_select_fusion.32.in_bounds-true:             ; preds = %entry
  %5 = load i8, ptr %arg1, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg0, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = load double, ptr %arg3, align 8, !invariant.load !349
  %10 = getelementptr double, ptr %arg2, i32 %linear_index
  %11 = getelementptr inbounds double, ptr %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !349
  %multiply.11870.5 = fmul double %9, %12
  %add.10023.5 = fadd double %8, %multiply.11870.5
  %13 = getelementptr double, ptr %arg0, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !349
  %16 = trunc i8 %5 to i1
  %17 = select i1 %16, double %add.10023.5, double %15
  %18 = insertvalue { double, double } undef, double %17, 0
  %19 = getelementptr double, ptr %arg5, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  %21 = load double, ptr %20, align 8, !invariant.load !349
  %constant_2460_13_clone_1 = load double, ptr @276, align 8
  %add.10030.7.clone.1 = fadd double %add.10023.5, %constant_2460_13_clone_1
  %constant_2570_6_clone_1 = load double, ptr @275, align 8
  %multiply.11884.5.clone.1 = fmul double %add.10030.7.clone.1, %constant_2570_6_clone_1
  %add.10031.3.clone.1 = fadd double %21, %multiply.11884.5.clone.1
  %22 = getelementptr double, ptr %arg4, i32 %linear_index
  %23 = getelementptr inbounds double, ptr %22, i32 0
  %24 = load double, ptr %23, align 8, !invariant.load !349
  %25 = trunc i8 %5 to i1
  %26 = select i1 %25, double %add.10031.3.clone.1, double %24
  %27 = insertvalue { double, double } %18, double %26, 1
  %28 = extractvalue { double, double } %27, 0
  %29 = getelementptr double, ptr %arg6, i32 %linear_index
  %30 = getelementptr inbounds double, ptr %29, i32 0
  store double %28, ptr %30, align 8
  %31 = extractvalue { double, double } %27, 1
  %32 = getelementptr double, ptr %arg7, i32 %linear_index
  %33 = getelementptr inbounds double, ptr %32, i32 0
  store double %31, ptr %33, align 8
  br label %loop_select_fusion.32.in_bounds-after
}

define void @loop_select_fusion_37(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.37.in_bounds-true, label %loop_select_fusion.37.in_bounds-after

loop_select_fusion.37.in_bounds-after:            ; preds = %loop_select_fusion.37.in_bounds-true, %entry
  ret void

loop_select_fusion.37.in_bounds-true:             ; preds = %entry
  %5 = load i8, ptr %arg1, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg2, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg3, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %12 = load double, ptr %arg5, align 8, !invariant.load !349
  %13 = getelementptr double, ptr %arg4, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !349
  %multiply.11866.13 = fmul double %12, %15
  %add.10019.13 = fadd double %11, %multiply.11866.13
  %16 = call double @__nv_exp(double %add.10019.13)
  %multiply.11887.3 = fmul double %8, %16
  %constant_2907_3 = load double, ptr @278, align 8
  %add.10033.7 = fadd double %add.10019.13, %constant_2907_3
  %constant_2565_3 = load double, ptr @277, align 8
  %multiply.11888.5 = fmul double %add.10033.7, %constant_2565_3
  %add.10034.3 = fadd double %multiply.11887.3, %multiply.11888.5
  %17 = getelementptr double, ptr %arg0, i32 %linear_index
  %18 = getelementptr inbounds double, ptr %17, i32 0
  %19 = load double, ptr %18, align 8, !invariant.load !349
  %20 = trunc i8 %5 to i1
  %21 = select i1 %20, double %add.10034.3, double %19
  %22 = insertvalue { double, double } undef, double %21, 0
  %23 = getelementptr double, ptr %arg3, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !349
  %26 = trunc i8 %5 to i1
  %27 = select i1 %26, double %add.10019.13, double %25
  %28 = insertvalue { double, double } %22, double %27, 1
  %29 = extractvalue { double, double } %28, 0
  %30 = getelementptr double, ptr %arg6, i32 %linear_index
  %31 = getelementptr inbounds double, ptr %30, i32 0
  store double %29, ptr %31, align 8
  %32 = extractvalue { double, double } %28, 1
  %33 = getelementptr double, ptr %arg7, i32 %linear_index
  %34 = getelementptr inbounds double, ptr %33, i32 0
  store double %32, ptr %34, align 8
  br label %loop_select_fusion.37.in_bounds-after
}

define void @loop_select_fusion_33(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(1) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.33.in_bounds-true, label %loop_select_fusion.33.in_bounds-after

loop_select_fusion.33.in_bounds-after:            ; preds = %loop_select_fusion.33.in_bounds-true, %entry
  ret void

loop_select_fusion.33.in_bounds-true:             ; preds = %entry
  %5 = load i8, ptr %arg2, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg0, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %12 = trunc i8 %5 to i1
  %13 = select i1 %12, double %8, double %11
  %14 = insertvalue { double, double } undef, double %13, 0
  %15 = getelementptr double, ptr %arg4, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !349
  %18 = getelementptr double, ptr %arg0, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  %20 = load double, ptr %19, align 8, !invariant.load !349
  %constant_2460_12_clone_1 = load double, ptr @279, align 8
  %add.10036.7.clone.1 = fadd double %20, %constant_2460_12_clone_1
  %add.10037.3.clone.1 = fadd double %17, %add.10036.7.clone.1
  %21 = getelementptr double, ptr %arg3, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  %23 = load double, ptr %22, align 8, !invariant.load !349
  %24 = trunc i8 %5 to i1
  %25 = select i1 %24, double %add.10037.3.clone.1, double %23
  %26 = insertvalue { double, double } %14, double %25, 1
  %27 = extractvalue { double, double } %26, 0
  %28 = getelementptr double, ptr %arg5, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  %30 = extractvalue { double, double } %26, 1
  %31 = getelementptr double, ptr %arg6, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  store double %30, ptr %32, align 8
  br label %loop_select_fusion.33.in_bounds-after
}

define void @loop_select_fusion_34(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(1) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.34.in_bounds-true, label %loop_select_fusion.34.in_bounds-after

loop_select_fusion.34.in_bounds-after:            ; preds = %loop_select_fusion.34.in_bounds-true, %entry
  ret void

loop_select_fusion.34.in_bounds-true:             ; preds = %entry
  %5 = load i8, ptr %arg2, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg0, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %12 = trunc i8 %5 to i1
  %13 = select i1 %12, double %8, double %11
  %14 = insertvalue { double, double } undef, double %13, 0
  %15 = getelementptr double, ptr %arg4, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !349
  %18 = getelementptr double, ptr %arg0, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  %20 = load double, ptr %19, align 8, !invariant.load !349
  %constant_2570_5_clone_1 = load double, ptr @281, align 8
  %add.10039.7.clone.1 = fadd double %20, %constant_2570_5_clone_1
  %constant_2563_5_clone_1 = load double, ptr @280, align 8
  %multiply.11891.5.clone.1 = fmul double %add.10039.7.clone.1, %constant_2563_5_clone_1
  %add.10040.3.clone.1 = fadd double %17, %multiply.11891.5.clone.1
  %21 = getelementptr double, ptr %arg3, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  %23 = load double, ptr %22, align 8, !invariant.load !349
  %24 = trunc i8 %5 to i1
  %25 = select i1 %24, double %add.10040.3.clone.1, double %23
  %26 = insertvalue { double, double } %14, double %25, 1
  %27 = extractvalue { double, double } %26, 0
  %28 = getelementptr double, ptr %arg5, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  %30 = extractvalue { double, double } %26, 1
  %31 = getelementptr double, ptr %arg6, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  store double %30, ptr %32, align 8
  br label %loop_select_fusion.34.in_bounds-after
}

define void @loop_select_fusion_35(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(1) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.35.in_bounds-true, label %loop_select_fusion.35.in_bounds-after

loop_select_fusion.35.in_bounds-after:            ; preds = %loop_select_fusion.35.in_bounds-true, %entry
  ret void

loop_select_fusion.35.in_bounds-true:             ; preds = %entry
  %5 = load i8, ptr %arg2, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg0, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %12 = trunc i8 %5 to i1
  %13 = select i1 %12, double %8, double %11
  %14 = insertvalue { double, double } undef, double %13, 0
  %15 = getelementptr double, ptr %arg4, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !349
  %18 = getelementptr double, ptr %arg0, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  %20 = load double, ptr %19, align 8, !invariant.load !349
  %constant_2913_3_clone_1 = load double, ptr @283, align 8
  %add.10042.7.clone.1 = fadd double %20, %constant_2913_3_clone_1
  %constant_2563_6_clone_1 = load double, ptr @282, align 8
  %multiply.11893.5.clone.1 = fmul double %add.10042.7.clone.1, %constant_2563_6_clone_1
  %add.10043.3.clone.1 = fadd double %17, %multiply.11893.5.clone.1
  %21 = getelementptr double, ptr %arg3, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  %23 = load double, ptr %22, align 8, !invariant.load !349
  %24 = trunc i8 %5 to i1
  %25 = select i1 %24, double %add.10043.3.clone.1, double %23
  %26 = insertvalue { double, double } %14, double %25, 1
  %27 = extractvalue { double, double } %26, 0
  %28 = getelementptr double, ptr %arg5, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  %30 = extractvalue { double, double } %26, 1
  %31 = getelementptr double, ptr %arg6, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  store double %30, ptr %32, align 8
  br label %loop_select_fusion.35.in_bounds-after
}

define void @loop_select_fusion_41(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.41.in_bounds-true, label %loop_select_fusion.41.in_bounds-after

loop_select_fusion.41.in_bounds-after:            ; preds = %loop_select_fusion.41.in_bounds-true, %entry
  ret void

loop_select_fusion.41.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg1, align 8, !invariant.load !349
  %constant_2461_13 = load double, ptr @284, align 8
  %compare.2754.11 = fcmp oge double %4, %constant_2461_13
  %5 = zext i1 %compare.2754.11 to i8
  %6 = load double, ptr %arg1, align 8, !invariant.load !349
  %7 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_2526_9 = load double, ptr @287, align 8
  %multiply.11901.17 = fmul double %7, %constant_2526_9
  %subtract.876.17 = fsub double %6, %multiply.11901.17
  %8 = load double, ptr %arg4, align 8, !invariant.load !349
  %9 = load double, ptr %arg3, align 8, !invariant.load !349
  %subtract.878.17 = fsub double %8, %9
  %10 = load double, ptr %arg3, align 8, !invariant.load !349
  %11 = call double @llvm.fabs.f64(double %10)
  %constant_2476_10 = load double, ptr @286, align 8
  %multiply.11918.17 = fmul double %11, %constant_2476_10
  %subtract.879.17 = fsub double %subtract.878.17, %multiply.11918.17
  %12 = fcmp une double %subtract.876.17, %subtract.876.17
  %13 = fcmp oeq double %subtract.879.17, %subtract.879.17
  %14 = fcmp oge double %subtract.876.17, %subtract.879.17
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %maximum.74.17 = select i1 %16, double %subtract.876.17, double %subtract.879.17
  %17 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2531_9 = load double, ptr @285, align 8
  %multiply.11919.17 = fmul double %17, %constant_2531_9
  %18 = load double, ptr %arg2, align 8, !invariant.load !349
  %multiply.11920.17 = fmul double %multiply.11919.17, %18
  %subtract.880.17 = fsub double %subtract.878.17, %multiply.11920.17
  %19 = fcmp une double %maximum.74.17, %maximum.74.17
  %20 = fcmp oeq double %subtract.880.17, %subtract.880.17
  %21 = fcmp ole double %maximum.74.17, %subtract.880.17
  %22 = and i1 %20, %21
  %23 = or i1 %19, %22
  %minimum.28.17 = select i1 %23, double %maximum.74.17, double %subtract.880.17
  %constant_2461_131 = load double, ptr @284, align 8
  %24 = fcmp une double %minimum.28.17, %minimum.28.17
  %25 = fcmp oeq double %constant_2461_131, %constant_2461_131
  %26 = fcmp oge double %minimum.28.17, %constant_2461_131
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %maximum.75.17 = select i1 %28, double %minimum.28.17, double %constant_2461_131
  %compare.2749.17 = fcmp une double %maximum.75.17, %maximum.75.17
  %29 = zext i1 %compare.2749.17 to i8
  %constant_2532_9 = load double, ptr @288, align 8
  %30 = trunc i8 %29 to i1
  %31 = select i1 %30, double %constant_2532_9, double %maximum.75.17
  %constant_2461_132 = load double, ptr @284, align 8
  %compare.2753.12 = fcmp ogt double %31, %constant_2461_132
  %32 = zext i1 %compare.2753.12 to i8
  %33 = trunc i8 %32 to i1
  %34 = xor i1 %33, true
  %35 = zext i1 %34 to i8
  %36 = and i8 %5, %35
  %constant_2461_133 = load double, ptr @284, align 8
  %37 = load double, ptr %arg0, align 8, !invariant.load !349
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, double %constant_2461_133, double %37
  store double %39, ptr %arg5, align 8
  br label %loop_select_fusion.41.in_bounds-after
}

define void @loop_select_fusion_39(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.39.in_bounds-true, label %loop_select_fusion.39.in_bounds-after

loop_select_fusion.39.in_bounds-after:            ; preds = %loop_select_fusion.39.in_bounds-true, %entry
  ret void

loop_select_fusion.39.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_2461_62 = load double, ptr @289, align 8
  %compare.2754.7 = fcmp oge double %4, %constant_2461_62
  %5 = zext i1 %compare.2754.7 to i8
  %6 = load double, ptr %arg2, align 8, !invariant.load !349
  %7 = load double, ptr %arg3, align 8, !invariant.load !349
  %constant_2526_7 = load double, ptr @292, align 8
  %multiply.11901.13 = fmul double %7, %constant_2526_7
  %subtract.876.13 = fsub double %6, %multiply.11901.13
  %8 = load double, ptr %arg0, align 8, !invariant.load !349
  %9 = load double, ptr %arg1, align 8, !invariant.load !349
  %subtract.878.13 = fsub double %8, %9
  %10 = load double, ptr %arg1, align 8, !invariant.load !349
  %11 = call double @llvm.fabs.f64(double %10)
  %constant_2476_8 = load double, ptr @291, align 8
  %multiply.11918.13 = fmul double %11, %constant_2476_8
  %subtract.879.13 = fsub double %subtract.878.13, %multiply.11918.13
  %12 = fcmp une double %subtract.876.13, %subtract.876.13
  %13 = fcmp oeq double %subtract.879.13, %subtract.879.13
  %14 = fcmp oge double %subtract.876.13, %subtract.879.13
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %maximum.74.13 = select i1 %16, double %subtract.876.13, double %subtract.879.13
  %17 = load double, ptr %arg4, align 8, !invariant.load !349
  %constant_2531_7 = load double, ptr @290, align 8
  %multiply.11919.13 = fmul double %17, %constant_2531_7
  %18 = load double, ptr %arg3, align 8, !invariant.load !349
  %multiply.11920.13 = fmul double %multiply.11919.13, %18
  %subtract.880.13 = fsub double %subtract.878.13, %multiply.11920.13
  %19 = fcmp une double %maximum.74.13, %maximum.74.13
  %20 = fcmp oeq double %subtract.880.13, %subtract.880.13
  %21 = fcmp ole double %maximum.74.13, %subtract.880.13
  %22 = and i1 %20, %21
  %23 = or i1 %19, %22
  %minimum.28.13 = select i1 %23, double %maximum.74.13, double %subtract.880.13
  %constant_2461_621 = load double, ptr @289, align 8
  %24 = fcmp une double %minimum.28.13, %minimum.28.13
  %25 = fcmp oeq double %constant_2461_621, %constant_2461_621
  %26 = fcmp oge double %minimum.28.13, %constant_2461_621
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %maximum.75.13 = select i1 %28, double %minimum.28.13, double %constant_2461_621
  %compare.2749.13 = fcmp une double %maximum.75.13, %maximum.75.13
  %29 = zext i1 %compare.2749.13 to i8
  %constant_2532_7 = load double, ptr @293, align 8
  %30 = trunc i8 %29 to i1
  %31 = select i1 %30, double %constant_2532_7, double %maximum.75.13
  %constant_2461_622 = load double, ptr @289, align 8
  %compare.2753.8 = fcmp ogt double %31, %constant_2461_622
  %32 = zext i1 %compare.2753.8 to i8
  %33 = trunc i8 %32 to i1
  %34 = xor i1 %33, true
  %35 = zext i1 %34 to i8
  %36 = and i8 %5, %35
  %37 = load double, ptr %arg0, align 8, !invariant.load !349
  %38 = load double, ptr %arg1, align 8, !invariant.load !349
  %39 = trunc i8 %36 to i1
  %40 = select i1 %39, double %37, double %38
  store double %40, ptr %arg5, align 8
  br label %loop_select_fusion.39.in_bounds-after
}

define void @loop_select_fusion_42(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.42.in_bounds-true, label %loop_select_fusion.42.in_bounds-after

loop_select_fusion.42.in_bounds-after:            ; preds = %loop_select_fusion.42.in_bounds-true, %entry
  ret void

loop_select_fusion.42.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_2461_7 = load double, ptr @294, align 8
  %compare.2754.13 = fcmp oge double %4, %constant_2461_7
  %5 = zext i1 %compare.2754.13 to i8
  %6 = load double, ptr %arg2, align 8, !invariant.load !349
  %7 = load double, ptr %arg3, align 8, !invariant.load !349
  %constant_2526_1 = load double, ptr @297, align 8
  %multiply.11901.19 = fmul double %7, %constant_2526_1
  %subtract.876.19 = fsub double %6, %multiply.11901.19
  %8 = load double, ptr %arg1, align 8, !invariant.load !349
  %9 = load double, ptr %arg0, align 8, !invariant.load !349
  %subtract.878.19 = fsub double %8, %9
  %10 = load double, ptr %arg0, align 8, !invariant.load !349
  %11 = call double @llvm.fabs.f64(double %10)
  %constant_2476_1 = load double, ptr @296, align 8
  %multiply.11918.19 = fmul double %11, %constant_2476_1
  %subtract.879.19 = fsub double %subtract.878.19, %multiply.11918.19
  %12 = fcmp une double %subtract.876.19, %subtract.876.19
  %13 = fcmp oeq double %subtract.879.19, %subtract.879.19
  %14 = fcmp oge double %subtract.876.19, %subtract.879.19
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %maximum.74.19 = select i1 %16, double %subtract.876.19, double %subtract.879.19
  %17 = load double, ptr %arg4, align 8, !invariant.load !349
  %constant_2531_1 = load double, ptr @295, align 8
  %multiply.11919.19 = fmul double %17, %constant_2531_1
  %18 = load double, ptr %arg3, align 8, !invariant.load !349
  %multiply.11920.19 = fmul double %multiply.11919.19, %18
  %subtract.880.19 = fsub double %subtract.878.19, %multiply.11920.19
  %19 = fcmp une double %maximum.74.19, %maximum.74.19
  %20 = fcmp oeq double %subtract.880.19, %subtract.880.19
  %21 = fcmp ole double %maximum.74.19, %subtract.880.19
  %22 = and i1 %20, %21
  %23 = or i1 %19, %22
  %minimum.28.19 = select i1 %23, double %maximum.74.19, double %subtract.880.19
  %constant_2461_71 = load double, ptr @294, align 8
  %24 = fcmp une double %minimum.28.19, %minimum.28.19
  %25 = fcmp oeq double %constant_2461_71, %constant_2461_71
  %26 = fcmp oge double %minimum.28.19, %constant_2461_71
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %maximum.75.19 = select i1 %28, double %minimum.28.19, double %constant_2461_71
  %compare.2749.19 = fcmp une double %maximum.75.19, %maximum.75.19
  %29 = zext i1 %compare.2749.19 to i8
  %constant_2532_2 = load double, ptr @298, align 8
  %30 = trunc i8 %29 to i1
  %31 = select i1 %30, double %constant_2532_2, double %maximum.75.19
  %constant_2461_72 = load double, ptr @294, align 8
  %compare.2753.14 = fcmp ogt double %31, %constant_2461_72
  %32 = zext i1 %compare.2753.14 to i8
  %33 = trunc i8 %32 to i1
  %34 = xor i1 %33, true
  %35 = zext i1 %34 to i8
  %36 = and i8 %5, %35
  %37 = load double, ptr %arg0, align 8, !invariant.load !349
  %38 = load double, ptr %arg1, align 8, !invariant.load !349
  %39 = trunc i8 %36 to i1
  %40 = select i1 %39, double %37, double %38
  store double %40, ptr %arg5, align 8
  br label %loop_select_fusion.42.in_bounds-after
}

define void @loop_select_fusion_38(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.38.in_bounds-true, label %loop_select_fusion.38.in_bounds-after

loop_select_fusion.38.in_bounds-after:            ; preds = %loop_select_fusion.38.in_bounds-true, %entry
  ret void

loop_select_fusion.38.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg1, align 8, !invariant.load !349
  %constant_2461_12 = load double, ptr @299, align 8
  %compare.2754.3 = fcmp oge double %4, %constant_2461_12
  %5 = zext i1 %compare.2754.3 to i8
  %6 = load double, ptr %arg1, align 8, !invariant.load !349
  %7 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_2526_6 = load double, ptr @302, align 8
  %multiply.11901.11 = fmul double %7, %constant_2526_6
  %subtract.876.11 = fsub double %6, %multiply.11901.11
  %8 = load double, ptr %arg4, align 8, !invariant.load !349
  %9 = load double, ptr %arg3, align 8, !invariant.load !349
  %subtract.878.11 = fsub double %8, %9
  %10 = load double, ptr %arg3, align 8, !invariant.load !349
  %11 = call double @llvm.fabs.f64(double %10)
  %constant_2476_7 = load double, ptr @301, align 8
  %multiply.11918.11 = fmul double %11, %constant_2476_7
  %subtract.879.11 = fsub double %subtract.878.11, %multiply.11918.11
  %12 = fcmp une double %subtract.876.11, %subtract.876.11
  %13 = fcmp oeq double %subtract.879.11, %subtract.879.11
  %14 = fcmp oge double %subtract.876.11, %subtract.879.11
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %maximum.74.11 = select i1 %16, double %subtract.876.11, double %subtract.879.11
  %17 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2531_6 = load double, ptr @300, align 8
  %multiply.11919.11 = fmul double %17, %constant_2531_6
  %18 = load double, ptr %arg2, align 8, !invariant.load !349
  %multiply.11920.11 = fmul double %multiply.11919.11, %18
  %subtract.880.11 = fsub double %subtract.878.11, %multiply.11920.11
  %19 = fcmp une double %maximum.74.11, %maximum.74.11
  %20 = fcmp oeq double %subtract.880.11, %subtract.880.11
  %21 = fcmp ole double %maximum.74.11, %subtract.880.11
  %22 = and i1 %20, %21
  %23 = or i1 %19, %22
  %minimum.28.11 = select i1 %23, double %maximum.74.11, double %subtract.880.11
  %constant_2461_121 = load double, ptr @299, align 8
  %24 = fcmp une double %minimum.28.11, %minimum.28.11
  %25 = fcmp oeq double %constant_2461_121, %constant_2461_121
  %26 = fcmp oge double %minimum.28.11, %constant_2461_121
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %maximum.75.11 = select i1 %28, double %minimum.28.11, double %constant_2461_121
  %compare.2749.11 = fcmp une double %maximum.75.11, %maximum.75.11
  %29 = zext i1 %compare.2749.11 to i8
  %constant_2532_6 = load double, ptr @303, align 8
  %30 = trunc i8 %29 to i1
  %31 = select i1 %30, double %constant_2532_6, double %maximum.75.11
  %constant_2461_122 = load double, ptr @299, align 8
  %compare.2753.4 = fcmp ogt double %31, %constant_2461_122
  %32 = zext i1 %compare.2753.4 to i8
  %33 = trunc i8 %32 to i1
  %34 = xor i1 %33, true
  %35 = zext i1 %34 to i8
  %36 = and i8 %5, %35
  %37 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2461_123 = load double, ptr @299, align 8
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, double %37, double %constant_2461_123
  store double %39, ptr %arg5, align 8
  br label %loop_select_fusion.38.in_bounds-after
}

define void @loop_select_fusion_40(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.40.in_bounds-true, label %loop_select_fusion.40.in_bounds-after

loop_select_fusion.40.in_bounds-after:            ; preds = %loop_select_fusion.40.in_bounds-true, %entry
  ret void

loop_select_fusion.40.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2461_63 = load double, ptr @304, align 8
  %compare.2754.9 = fcmp oge double %4, %constant_2461_63
  %5 = zext i1 %compare.2754.9 to i8
  %6 = load double, ptr %arg0, align 8, !invariant.load !349
  %7 = load double, ptr %arg1, align 8, !invariant.load !349
  %constant_2526_8 = load double, ptr @307, align 8
  %multiply.11901.15 = fmul double %7, %constant_2526_8
  %subtract.876.15 = fsub double %6, %multiply.11901.15
  %8 = load double, ptr %arg4, align 8, !invariant.load !349
  %9 = load double, ptr %arg3, align 8, !invariant.load !349
  %subtract.878.15 = fsub double %8, %9
  %10 = load double, ptr %arg3, align 8, !invariant.load !349
  %11 = call double @llvm.fabs.f64(double %10)
  %constant_2476_9 = load double, ptr @306, align 8
  %multiply.11918.15 = fmul double %11, %constant_2476_9
  %subtract.879.15 = fsub double %subtract.878.15, %multiply.11918.15
  %12 = fcmp une double %subtract.876.15, %subtract.876.15
  %13 = fcmp oeq double %subtract.879.15, %subtract.879.15
  %14 = fcmp oge double %subtract.876.15, %subtract.879.15
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %maximum.74.15 = select i1 %16, double %subtract.876.15, double %subtract.879.15
  %17 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_2531_8 = load double, ptr @305, align 8
  %multiply.11919.15 = fmul double %17, %constant_2531_8
  %18 = load double, ptr %arg1, align 8, !invariant.load !349
  %multiply.11920.15 = fmul double %multiply.11919.15, %18
  %subtract.880.15 = fsub double %subtract.878.15, %multiply.11920.15
  %19 = fcmp une double %maximum.74.15, %maximum.74.15
  %20 = fcmp oeq double %subtract.880.15, %subtract.880.15
  %21 = fcmp ole double %maximum.74.15, %subtract.880.15
  %22 = and i1 %20, %21
  %23 = or i1 %19, %22
  %minimum.28.15 = select i1 %23, double %maximum.74.15, double %subtract.880.15
  %constant_2461_631 = load double, ptr @304, align 8
  %24 = fcmp une double %minimum.28.15, %minimum.28.15
  %25 = fcmp oeq double %constant_2461_631, %constant_2461_631
  %26 = fcmp oge double %minimum.28.15, %constant_2461_631
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %maximum.75.15 = select i1 %28, double %minimum.28.15, double %constant_2461_631
  %compare.2749.15 = fcmp une double %maximum.75.15, %maximum.75.15
  %29 = zext i1 %compare.2749.15 to i8
  %constant_2532_8 = load double, ptr @308, align 8
  %30 = trunc i8 %29 to i1
  %31 = select i1 %30, double %constant_2532_8, double %maximum.75.15
  %constant_2461_632 = load double, ptr @304, align 8
  %compare.2753.10 = fcmp ogt double %31, %constant_2461_632
  %32 = zext i1 %compare.2753.10 to i8
  %33 = trunc i8 %32 to i1
  %34 = xor i1 %33, true
  %35 = zext i1 %34 to i8
  %36 = and i8 %5, %35
  %37 = load double, ptr %arg0, align 8, !invariant.load !349
  %38 = load double, ptr %arg1, align 8, !invariant.load !349
  %39 = trunc i8 %36 to i1
  %40 = select i1 %39, double %37, double %38
  store double %40, ptr %arg5, align 8
  br label %loop_select_fusion.40.in_bounds-after
}

define void @loop_select_fusion_31(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.31.in_bounds-true, label %loop_select_fusion.31.in_bounds-after

loop_select_fusion.31.in_bounds-after:            ; preds = %loop_select_fusion.31.in_bounds-true, %entry
  ret void

loop_select_fusion.31.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg4, align 8, !invariant.load !349
  %5 = load double, ptr %arg1, align 8, !invariant.load !349
  %constant_2526_4 = load double, ptr @312, align 8
  %multiply.11901.7 = fmul double %5, %constant_2526_4
  %subtract.876.7 = fsub double %4, %multiply.11901.7
  %6 = load double, ptr %arg3, align 8, !invariant.load !349
  %7 = load double, ptr %arg2, align 8, !invariant.load !349
  %subtract.878.7 = fsub double %6, %7
  %8 = load double, ptr %arg2, align 8, !invariant.load !349
  %9 = call double @llvm.fabs.f64(double %8)
  %constant_2476_5 = load double, ptr @311, align 8
  %multiply.11918.7 = fmul double %9, %constant_2476_5
  %subtract.879.7 = fsub double %subtract.878.7, %multiply.11918.7
  %10 = fcmp une double %subtract.876.7, %subtract.876.7
  %11 = fcmp oeq double %subtract.879.7, %subtract.879.7
  %12 = fcmp oge double %subtract.876.7, %subtract.879.7
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %maximum.74.7 = select i1 %14, double %subtract.876.7, double %subtract.879.7
  %15 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2531_4 = load double, ptr @310, align 8
  %multiply.11919.7 = fmul double %15, %constant_2531_4
  %16 = load double, ptr %arg1, align 8, !invariant.load !349
  %multiply.11920.7 = fmul double %multiply.11919.7, %16
  %subtract.880.7 = fsub double %subtract.878.7, %multiply.11920.7
  %17 = fcmp une double %maximum.74.7, %maximum.74.7
  %18 = fcmp oeq double %subtract.880.7, %subtract.880.7
  %19 = fcmp ole double %maximum.74.7, %subtract.880.7
  %20 = and i1 %18, %19
  %21 = or i1 %17, %20
  %minimum.28.7 = select i1 %21, double %maximum.74.7, double %subtract.880.7
  %constant_2461_14 = load double, ptr @309, align 8
  %22 = fcmp une double %minimum.28.7, %minimum.28.7
  %23 = fcmp oeq double %constant_2461_14, %constant_2461_14
  %24 = fcmp oge double %minimum.28.7, %constant_2461_14
  %25 = and i1 %23, %24
  %26 = or i1 %22, %25
  %maximum.75.7 = select i1 %26, double %minimum.28.7, double %constant_2461_14
  %compare.2749.7 = fcmp une double %maximum.75.7, %maximum.75.7
  %27 = zext i1 %compare.2749.7 to i8
  %constant_2532_4 = load double, ptr @313, align 8
  %28 = trunc i8 %27 to i1
  %29 = select i1 %28, double %constant_2532_4, double %maximum.75.7
  %constant_2461_141 = load double, ptr @309, align 8
  %compare.2755.1 = fcmp ole double %29, %constant_2461_141
  %30 = zext i1 %compare.2755.1 to i8
  %31 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2461_142 = load double, ptr @309, align 8
  %32 = trunc i8 %30 to i1
  %33 = select i1 %32, double %31, double %constant_2461_142
  store double %33, ptr %arg5, align 8
  br label %loop_select_fusion.31.in_bounds-after
}

define void @loop_select_fusion_43(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.43.in_bounds-true, label %loop_select_fusion.43.in_bounds-after

loop_select_fusion.43.in_bounds-after:            ; preds = %loop_select_fusion.43.in_bounds-true, %entry
  ret void

loop_select_fusion.43.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg1, align 8, !invariant.load !349
  %constant_2461_11 = load double, ptr @314, align 8
  %compare.2754.15 = fcmp oge double %4, %constant_2461_11
  %5 = zext i1 %compare.2754.15 to i8
  %6 = load double, ptr %arg1, align 8, !invariant.load !349
  %7 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2526_5 = load double, ptr @317, align 8
  %multiply.11901.9 = fmul double %7, %constant_2526_5
  %subtract.876.9 = fsub double %6, %multiply.11901.9
  %8 = load double, ptr %arg4, align 8, !invariant.load !349
  %9 = load double, ptr %arg3, align 8, !invariant.load !349
  %subtract.878.9 = fsub double %8, %9
  %10 = load double, ptr %arg3, align 8, !invariant.load !349
  %11 = call double @llvm.fabs.f64(double %10)
  %constant_2476_6 = load double, ptr @316, align 8
  %multiply.11918.9 = fmul double %11, %constant_2476_6
  %subtract.879.9 = fsub double %subtract.878.9, %multiply.11918.9
  %12 = fcmp une double %subtract.876.9, %subtract.876.9
  %13 = fcmp oeq double %subtract.879.9, %subtract.879.9
  %14 = fcmp oge double %subtract.876.9, %subtract.879.9
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %maximum.74.9 = select i1 %16, double %subtract.876.9, double %subtract.879.9
  %17 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_2531_5 = load double, ptr @315, align 8
  %multiply.11919.9 = fmul double %17, %constant_2531_5
  %18 = load double, ptr %arg0, align 8, !invariant.load !349
  %multiply.11920.9 = fmul double %multiply.11919.9, %18
  %subtract.880.9 = fsub double %subtract.878.9, %multiply.11920.9
  %19 = fcmp une double %maximum.74.9, %maximum.74.9
  %20 = fcmp oeq double %subtract.880.9, %subtract.880.9
  %21 = fcmp ole double %maximum.74.9, %subtract.880.9
  %22 = and i1 %20, %21
  %23 = or i1 %19, %22
  %minimum.28.9 = select i1 %23, double %maximum.74.9, double %subtract.880.9
  %constant_2461_111 = load double, ptr @314, align 8
  %24 = fcmp une double %minimum.28.9, %minimum.28.9
  %25 = fcmp oeq double %constant_2461_111, %constant_2461_111
  %26 = fcmp oge double %minimum.28.9, %constant_2461_111
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %maximum.75.9 = select i1 %28, double %minimum.28.9, double %constant_2461_111
  %compare.2749.9 = fcmp une double %maximum.75.9, %maximum.75.9
  %29 = zext i1 %compare.2749.9 to i8
  %constant_2532_5 = load double, ptr @318, align 8
  %30 = trunc i8 %29 to i1
  %31 = select i1 %30, double %constant_2532_5, double %maximum.75.9
  %constant_2461_112 = load double, ptr @314, align 8
  %compare.2753.16 = fcmp ogt double %31, %constant_2461_112
  %32 = zext i1 %compare.2753.16 to i8
  %33 = trunc i8 %32 to i1
  %34 = xor i1 %33, true
  %35 = zext i1 %34 to i8
  %36 = and i8 %5, %35
  %37 = load double, ptr %arg0, align 8, !invariant.load !349
  %38 = load double, ptr %arg1, align 8, !invariant.load !349
  %39 = trunc i8 %36 to i1
  %40 = select i1 %39, double %37, double %38
  store double %40, ptr %arg5, align 8
  br label %loop_select_fusion.43.in_bounds-after
}

define void @loop_and_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(1) %arg2, ptr noalias align 128 dereferenceable(1) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_and_fusion.in_bounds-true, label %loop_and_fusion.in_bounds-after

loop_and_fusion.in_bounds-after:                  ; preds = %loop_and_fusion.in_bounds-true, %entry
  ret void

loop_and_fusion.in_bounds-true:                   ; preds = %entry
  %4 = load i8, ptr %arg1, align 1, !invariant.load !349
  %5 = load i8, ptr %arg2, align 1, !invariant.load !349
  %6 = or i8 %4, %5
  %7 = trunc i8 %6 to i1
  %8 = xor i1 %7, true
  %9 = zext i1 %8 to i8
  %10 = load i64, ptr %arg0, align 8, !invariant.load !349
  %constant_2019_1 = load i64, ptr @319, align 8
  %11 = icmp sle i64 %10, %constant_2019_1
  %12 = zext i1 %11 to i8
  %13 = and i8 %9, %12
  store i8 %13, ptr %arg3, align 1
  br label %loop_and_fusion.in_bounds-after
}

define void @wrapped_convert(ptr noalias align 128 dereferenceable(1) %arg0, ptr noalias align 128 dereferenceable(4) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
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
  %4 = load i8, ptr %arg0, align 1, !invariant.load !349
  %5 = zext i8 %4 to i32
  store i32 %5, ptr %arg1, align 4
  br label %wrapped_convert.in_bounds-after
}

define void @loop_minimum_reduce_fusion(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.313.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_minimum_reduce_fusion.in_bounds-true, label %loop_minimum_reduce_fusion.in_bounds-after

loop_minimum_reduce_fusion.in_bounds-after:       ; preds = %reduce.313.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_minimum_reduce_fusion.in_bounds-true:        ; preds = %entry
  %constant_2975_19 = load double, ptr @323, align 8
  store double %constant_2975_19, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.313.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.313.1.inner.loop_header.reduction_dim.0

reduce.313.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.313.1.inner.loop_body.reduction_dim.0, %loop_minimum_reduce_fusion.in_bounds-true
  %reduce.313.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.313.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.313.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.313.1.inner.loop_exit.reduction_dim.0, label %reduce.313.1.inner.loop_body.reduction_dim.0

reduce.313.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.313.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.313.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_3009_2_clone_1 = load i64, ptr @322, align 8
  %9 = icmp eq i64 %8, %constant_3009_2_clone_1
  %10 = zext i1 %9 to i8
  %11 = load double, ptr %arg2, align 8, !invariant.load !349
  %12 = load double, ptr %arg3, align 8, !invariant.load !349
  %constant_3006_2_clone_1 = load double, ptr @321, align 8
  %multiply.11383.1.clone.1 = fmul double %12, %constant_3006_2_clone_1
  %13 = trunc i8 %10 to i1
  %14 = select i1 %13, double %11, double %multiply.11383.1.clone.1
  %constant_2982_2_clone_1 = load double, ptr @320, align 8
  %15 = fcmp une double %14, %14
  %16 = fcmp oeq double %constant_2982_2_clone_1, %constant_2982_2_clone_1
  %17 = fcmp ole double %14, %constant_2982_2_clone_1
  %18 = and i1 %16, %17
  %19 = or i1 %15, %18
  %minimum.23.1.clone.1 = select i1 %19, double %14, double %constant_2982_2_clone_1
  %20 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.313.1.inner.indvar.reduction_dim.0
  %21 = load double, ptr %20, align 8, !invariant.load !349
  %multiply.11392.15 = fmul double %minimum.23.1.clone.1, %21
  %add.9567.15 = fadd double %7, %multiply.11392.15
  %multiply.11420.5 = fmul double %add.9567.15, %add.9567.15
  %constant_2999_2 = load double, ptr @325, align 8
  %add.9590.5 = fadd double %multiply.11420.5, %constant_2999_2
  %constant_3042_4 = load double, ptr @324, align 8
  %multiply.11421.3 = fmul double %add.9590.5, %constant_3042_4
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11421.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %22 = load double, ptr %return_buffer, align 8
  store double %22, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.313.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.313.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.313.1.inner.loop_header.reduction_dim.0

reduce.313.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.313.1.inner.loop_header.reduction_dim.0
  %23 = load double, ptr %accumulator_0, align 8
  %24 = insertvalue { double, double } undef, double %23, 0
  %25 = load i64, ptr %arg4, align 8, !invariant.load !349
  %constant_3009_2_clone_12 = load i64, ptr @322, align 8
  %26 = icmp eq i64 %25, %constant_3009_2_clone_12
  %27 = zext i1 %26 to i8
  %28 = load double, ptr %arg2, align 8, !invariant.load !349
  %29 = load double, ptr %arg3, align 8, !invariant.load !349
  %constant_3006_2_clone_13 = load double, ptr @321, align 8
  %multiply.11383.1.clone.14 = fmul double %29, %constant_3006_2_clone_13
  %30 = trunc i8 %27 to i1
  %31 = select i1 %30, double %28, double %multiply.11383.1.clone.14
  %constant_2982_2_clone_15 = load double, ptr @320, align 8
  %32 = fcmp une double %31, %31
  %33 = fcmp oeq double %constant_2982_2_clone_15, %constant_2982_2_clone_15
  %34 = fcmp ole double %31, %constant_2982_2_clone_15
  %35 = and i1 %33, %34
  %36 = or i1 %32, %35
  %minimum.23.1.clone.16 = select i1 %36, double %31, double %constant_2982_2_clone_15
  %37 = insertvalue { double, double } %24, double %minimum.23.1.clone.16, 1
  %38 = extractvalue { double, double } %37, 0
  store double %38, ptr %arg5, align 8
  %39 = extractvalue { double, double } %37, 1
  store double %39, ptr %arg6, align 8
  br label %loop_minimum_reduce_fusion.in_bounds-after
}

define void @loop_reduce_fusion_2(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %return_buffer10 = alloca double, align 8
  %parameter_buffer9 = alloca double, align 8
  %parameter_buffer8 = alloca double, align 8
  %reduce.311.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.327.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.2.in_bounds-true, label %loop_reduce_fusion.2.in_bounds-after

loop_reduce_fusion.2.in_bounds-after:             ; preds = %reduce.311.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.2.in_bounds-true:              ; preds = %entry
  %constant_2975_12 = load double, ptr @326, align 8
  store double %constant_2975_12, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.327.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.327.1.inner.loop_header.reduction_dim.0

reduce.327.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.327.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.2.in_bounds-true
  %reduce.327.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.327.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.327.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.327.1.inner.loop_exit.reduction_dim.0, label %reduce.327.1.inner.loop_body.reduction_dim.0

reduce.327.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.327.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.327.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %reduce.327.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %constant_3049_3 = load double, ptr @330, align 8
  %add.9581.11 = fadd double %9, %constant_3049_3
  %constant_3041_2 = load double, ptr @329, align 8
  %multiply.11409.9 = fmul double %add.9581.11, %constant_3041_2
  %add.9582.7 = fadd double %7, %multiply.11409.9
  %10 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.327.1.inner.indvar.reduction_dim.0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %multiply.11410.3 = fmul double %add.9582.7, %11
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11410.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %12 = load double, ptr %return_buffer, align 8
  store double %12, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.327.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.327.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.327.1.inner.loop_header.reduction_dim.0

reduce.327.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.327.1.inner.loop_header.reduction_dim.0
  %13 = load double, ptr %accumulator_0, align 8
  %14 = insertvalue { double, double } undef, double %13, 0
  %constant_2975_123 = load double, ptr @326, align 8
  store double %constant_2975_123, ptr %accumulator_02, align 8
  store i32 0, ptr %reduce.311.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.311.1.clone.1.inner.loop_header.reduction_dim.0

reduce.311.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.311.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.327.1.inner.loop_exit.reduction_dim.0
  %reduce.311.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.311.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %15 = icmp uge i32 %reduce.311.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %15, label %reduce.311.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.311.1.clone.1.inner.loop_body.reduction_dim.0

reduce.311.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.311.1.clone.1.inner.loop_header.reduction_dim.0
  %16 = load double, ptr %accumulator_02, align 8
  %17 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %reduce.311.1.clone.1.inner.indvar.reduction_dim.0
  %18 = load double, ptr %17, align 8, !invariant.load !349
  %constant_3049_35 = load double, ptr @330, align 8
  %add.9581.116 = fadd double %18, %constant_3049_35
  %multiply.11414.7.clone.1 = fmul double %add.9581.116, %add.9581.116
  %constant_3041_27 = load double, ptr @329, align 8
  %multiply.11415.7.clone.1 = fmul double %multiply.11414.7.clone.1, %constant_3041_27
  %constant_3005_2_clone_1 = load double, ptr @328, align 8
  %add.9587.5.clone.1 = fadd double %multiply.11415.7.clone.1, %constant_3005_2_clone_1
  %constant_3042_2_clone_1 = load double, ptr @327, align 8
  %multiply.11416.3.clone.1 = fmul double %add.9587.5.clone.1, %constant_3042_2_clone_1
  store double %16, ptr %parameter_buffer8, align 8
  store double %multiply.11416.3.clone.1, ptr %parameter_buffer9, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer8, ptr %parameter_buffer9, ptr %return_buffer10)
  %19 = load double, ptr %return_buffer10, align 8
  store double %19, ptr %accumulator_02, align 8
  %invar.inc4 = add nuw nsw i32 %reduce.311.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.311.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.311.1.clone.1.inner.loop_header.reduction_dim.0

reduce.311.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.311.1.clone.1.inner.loop_header.reduction_dim.0
  %20 = load double, ptr %accumulator_02, align 8
  %21 = insertvalue { double, double } %14, double %20, 1
  %22 = extractvalue { double, double } %21, 0
  store double %22, ptr %arg3, align 8
  %23 = extractvalue { double, double } %21, 1
  store double %23, ptr %arg4, align 8
  br label %loop_reduce_fusion.2.in_bounds-after
}

define void @loop_reduce_fusion_5(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.312.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.5.in_bounds-true, label %loop_reduce_fusion.5.in_bounds-after

loop_reduce_fusion.5.in_bounds-after:             ; preds = %reduce.312.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.5.in_bounds-true:              ; preds = %entry
  %constant_2975_20 = load double, ptr @331, align 8
  store double %constant_2975_20, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.312.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.312.1.inner.loop_header.reduction_dim.0

reduce.312.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.312.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.5.in_bounds-true
  %reduce.312.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.312.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.312.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.312.1.inner.loop_exit.reduction_dim.0, label %reduce.312.1.inner.loop_body.reduction_dim.0

reduce.312.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.312.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.312.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = load double, ptr %arg2, align 8, !invariant.load !349
  %9 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.312.1.inner.indvar.reduction_dim.0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %multiply.11384.15 = fmul double %8, %10
  %add.9561.15 = fadd double %7, %multiply.11384.15
  %constant_3063_2 = load double, ptr @335, align 8
  %add.9575.11 = fadd double %add.9561.15, %constant_3063_2
  %multiply.11417.7 = fmul double %add.9575.11, %add.9575.11
  %constant_3043_1 = load double, ptr @334, align 8
  %multiply.11418.7 = fmul double %multiply.11417.7, %constant_3043_1
  %constant_3002_1 = load double, ptr @333, align 8
  %add.9588.5 = fadd double %multiply.11418.7, %constant_3002_1
  %constant_3042_3 = load double, ptr @332, align 8
  %multiply.11419.3 = fmul double %add.9588.5, %constant_3042_3
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11419.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %11 = load double, ptr %return_buffer, align 8
  store double %11, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.312.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.312.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.312.1.inner.loop_header.reduction_dim.0

reduce.312.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.312.1.inner.loop_header.reduction_dim.0
  %12 = load double, ptr %accumulator_0, align 8
  store double %12, ptr %arg3, align 8
  br label %loop_reduce_fusion.5.in_bounds-after
}

define void @loop_reduce_fusion_4(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.315.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.4.in_bounds-true, label %loop_reduce_fusion.4.in_bounds-after

loop_reduce_fusion.4.in_bounds-after:             ; preds = %reduce.315.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.4.in_bounds-true:              ; preds = %entry
  %constant_2975_18 = load double, ptr @336, align 8
  store double %constant_2975_18, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.315.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.315.1.inner.loop_header.reduction_dim.0

reduce.315.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.315.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.4.in_bounds-true
  %reduce.315.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.315.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.315.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.315.1.inner.loop_exit.reduction_dim.0, label %reduce.315.1.inner.loop_body.reduction_dim.0

reduce.315.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.315.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.315.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = load double, ptr %arg2, align 8, !invariant.load !349
  %9 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.315.1.inner.indvar.reduction_dim.0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %multiply.11388.13 = fmul double %8, %10
  %add.9565.13 = fadd double %7, %multiply.11388.13
  %constant_2976_4 = load double, ptr @340, align 8
  %add.9572.13 = fadd double %add.9565.13, %constant_2976_4
  %multiply.11425.7 = fmul double %add.9572.13, %add.9572.13
  %constant_3049_1 = load double, ptr @339, align 8
  %multiply.11426.7 = fmul double %multiply.11425.7, %constant_3049_1
  %constant_2997_1 = load double, ptr @338, align 8
  %add.9594.5 = fadd double %multiply.11426.7, %constant_2997_1
  %constant_3042_6 = load double, ptr @337, align 8
  %multiply.11427.3 = fmul double %add.9594.5, %constant_3042_6
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11427.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %11 = load double, ptr %return_buffer, align 8
  store double %11, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.315.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.315.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.315.1.inner.loop_header.reduction_dim.0

reduce.315.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.315.1.inner.loop_header.reduction_dim.0
  %12 = load double, ptr %accumulator_0, align 8
  store double %12, ptr %arg3, align 8
  br label %loop_reduce_fusion.4.in_bounds-after
}

define void @loop_reduce_fusion_3(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.314.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.3.in_bounds-true, label %loop_reduce_fusion.3.in_bounds-after

loop_reduce_fusion.3.in_bounds-after:             ; preds = %reduce.314.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.3.in_bounds-true:              ; preds = %entry
  %constant_2975_21 = load double, ptr @341, align 8
  store double %constant_2975_21, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.314.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.314.1.inner.loop_header.reduction_dim.0

reduce.314.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.314.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.3.in_bounds-true
  %reduce.314.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.314.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.314.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.314.1.inner.loop_exit.reduction_dim.0, label %reduce.314.1.inner.loop_body.reduction_dim.0

reduce.314.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.314.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.314.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %constant_3069_2 = load double, ptr @345, align 8
  %add.9584.13 = fadd double %7, %constant_3069_2
  %multiply.11422.7 = fmul double %add.9584.13, %add.9584.13
  %constant_3041_1 = load double, ptr @344, align 8
  %multiply.11423.7 = fmul double %multiply.11422.7, %constant_3041_1
  %constant_3005_1 = load double, ptr @343, align 8
  %add.9592.5 = fadd double %multiply.11423.7, %constant_3005_1
  %constant_3042_5 = load double, ptr @342, align 8
  %multiply.11424.3 = fmul double %add.9592.5, %constant_3042_5
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11424.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %8 = load double, ptr %return_buffer, align 8
  store double %8, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.314.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.314.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.314.1.inner.loop_header.reduction_dim.0

reduce.314.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.314.1.inner.loop_header.reduction_dim.0
  %9 = load double, ptr %accumulator_0, align 8
  store double %9, ptr %arg1, align 8
  br label %loop_reduce_fusion.3.in_bounds-after
}

define void @loop_negate_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.316.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_negate_fusion.in_bounds-true, label %loop_negate_fusion.in_bounds-after

loop_negate_fusion.in_bounds-after:               ; preds = %reduce.316.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_negate_fusion.in_bounds-true:                ; preds = %entry
  %4 = load double, ptr %arg4, align 8, !invariant.load !349
  %5 = load double, ptr %arg5, align 8, !invariant.load !349
  %add.9589.1 = fadd double %4, %5
  %6 = load double, ptr %arg3, align 8, !invariant.load !349
  %add.9591.1 = fadd double %add.9589.1, %6
  %7 = load double, ptr %arg2, align 8, !invariant.load !349
  %add.9593.1 = fadd double %add.9591.1, %7
  %8 = load double, ptr %arg1, align 8, !invariant.load !349
  %add.9595.1 = fadd double %add.9593.1, %8
  %constant_2975_17 = load double, ptr @346, align 8
  store double %constant_2975_17, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.316.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.316.1.inner.loop_header.reduction_dim.0

reduce.316.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.316.1.inner.loop_body.reduction_dim.0, %loop_negate_fusion.in_bounds-true
  %reduce.316.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.316.1.inner.invar_address.reduction_dim.0, align 4
  %9 = icmp uge i32 %reduce.316.1.inner.indvar.reduction_dim.0, 20
  br i1 %9, label %reduce.316.1.inner.loop_exit.reduction_dim.0, label %reduce.316.1.inner.loop_body.reduction_dim.0

reduce.316.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.316.1.inner.loop_header.reduction_dim.0
  %10 = load double, ptr %accumulator_0, align 8
  %11 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %reduce.316.1.inner.indvar.reduction_dim.0
  %12 = load double, ptr %11, align 8, !invariant.load !349
  %constant_2976_5 = load double, ptr @349, align 8
  %add.9578.13 = fadd double %12, %constant_2976_5
  %multiply.11428.5 = fmul double %add.9578.13, %add.9578.13
  %constant_2999_1 = load double, ptr @348, align 8
  %add.9597.5 = fadd double %multiply.11428.5, %constant_2999_1
  %constant_3042_1 = load double, ptr @347, align 8
  %multiply.11429.3 = fmul double %add.9597.5, %constant_3042_1
  store double %10, ptr %parameter_buffer, align 8
  store double %multiply.11429.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %13 = load double, ptr %return_buffer, align 8
  store double %13, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.316.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.316.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.316.1.inner.loop_header.reduction_dim.0

reduce.316.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.316.1.inner.loop_header.reduction_dim.0
  %14 = load double, ptr %accumulator_0, align 8
  %add.9598.1 = fadd double %add.9595.1, %14
  %15 = load double, ptr %arg0, align 8, !invariant.load !349
  %add.9599.1 = fadd double %add.9598.1, %15
  %16 = fneg double %add.9599.1
  store double %16, ptr %arg7, align 8
  br label %loop_negate_fusion.in_bounds-after
}

define void @loop_add_and_or_select_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(8) %arg9, ptr noalias align 128 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(160) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 128 dereferenceable(160) %arg14, ptr noalias align 128 dereferenceable(160) %arg15, ptr noalias align 128 dereferenceable(160) %arg16, ptr noalias align 128 dereferenceable(160) %arg17, ptr noalias align 128 dereferenceable(160) %arg18, ptr noalias align 128 dereferenceable(160) %arg19, ptr noalias align 128 dereferenceable(160) %arg20, ptr noalias align 128 dereferenceable(160) %arg21, ptr noalias align 128 dereferenceable(1) %arg22, ptr noalias align 128 dereferenceable(1) %arg23, ptr noalias align 128 dereferenceable(1) %arg24, ptr noalias align 128 dereferenceable(8) %arg25, ptr noalias align 128 dereferenceable(8) %arg26, ptr noalias align 128 dereferenceable(8) %arg27) {
entry:
  %return_buffer26 = alloca double, align 8
  %parameter_buffer25 = alloca double, align 8
  %parameter_buffer24 = alloca double, align 8
  %reduce.328.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_021 = alloca double, align 8
  %return_buffer20 = alloca double, align 8
  %parameter_buffer19 = alloca double, align 8
  %parameter_buffer18 = alloca double, align 8
  %reduce.326.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_014 = alloca double, align 8
  %return_buffer13 = alloca double, align 8
  %parameter_buffer12 = alloca double, align 8
  %parameter_buffer11 = alloca double, align 8
  %reduce.325.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_08 = alloca double, align 8
  %return_buffer7 = alloca double, align 8
  %parameter_buffer6 = alloca double, align 8
  %parameter_buffer5 = alloca double, align 8
  %reduce.324.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.323.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_and_or_select_fusion.in_bounds-true, label %loop_add_and_or_select_fusion.in_bounds-after

loop_add_and_or_select_fusion.in_bounds-after:    ; preds = %reduce.328.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_add_and_or_select_fusion.in_bounds-true:     ; preds = %entry
  %4 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_2967_2_clone_1 = load i64, ptr @350, align 8
  %5 = add i64 %4, %constant_2967_2_clone_1
  %constant_2966_1 = load i64, ptr @365, align 8
  %6 = icmp sge i64 %5, %constant_2966_1
  %7 = zext i1 %6 to i8
  %constant_2975_7_clone_1 = load double, ptr @351, align 8
  store double %constant_2975_7_clone_1, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.323.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.323.1.clone.1.inner.loop_header.reduction_dim.0

reduce.323.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.323.1.clone.1.inner.loop_body.reduction_dim.0, %loop_add_and_or_select_fusion.in_bounds-true
  %reduce.323.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.323.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %8 = icmp uge i32 %reduce.323.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %8, label %reduce.323.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.323.1.clone.1.inner.loop_body.reduction_dim.0

reduce.323.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.323.1.clone.1.inner.loop_header.reduction_dim.0
  %9 = load double, ptr %accumulator_0, align 8
  %10 = getelementptr inbounds [20 x double], ptr %arg14, i32 0, i32 %reduce.323.1.clone.1.inner.indvar.reduction_dim.0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %12 = getelementptr inbounds [20 x double], ptr %arg15, i32 0, i32 %reduce.323.1.clone.1.inner.indvar.reduction_dim.0
  %13 = load double, ptr %12, align 8, !invariant.load !349
  %14 = load double, ptr %arg0, align 8, !invariant.load !349
  %15 = getelementptr inbounds [20 x double], ptr %arg13, i32 0, i32 %reduce.323.1.clone.1.inner.indvar.reduction_dim.0
  %16 = load double, ptr %15, align 8, !invariant.load !349
  %multiply.11392.13.clone.1 = fmul double %14, %16
  %add.9567.13.clone.1 = fadd double %13, %multiply.11392.13.clone.1
  %add.9570.4.clone.1 = fadd double %11, %add.9567.13.clone.1
  %17 = getelementptr inbounds [20 x double], ptr %arg13, i32 0, i32 %reduce.323.1.clone.1.inner.indvar.reduction_dim.0
  %18 = load double, ptr %17, align 8, !invariant.load !349
  %multiply.11394.3.clone.1 = fmul double %add.9570.4.clone.1, %18
  store double %9, ptr %parameter_buffer, align 8
  store double %multiply.11394.3.clone.1, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %19 = load double, ptr %return_buffer, align 8
  store double %19, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.323.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.323.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.323.1.clone.1.inner.loop_header.reduction_dim.0

reduce.323.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.323.1.clone.1.inner.loop_header.reduction_dim.0
  %20 = load double, ptr %accumulator_0, align 8
  %constant_2975_7_clone_13 = load double, ptr @351, align 8
  store double %constant_2975_7_clone_13, ptr %accumulator_02, align 8
  store i32 0, ptr %reduce.324.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.324.1.clone.1.inner.loop_header.reduction_dim.0

reduce.324.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.324.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.323.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.324.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.324.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %21 = icmp uge i32 %reduce.324.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %21, label %reduce.324.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.324.1.clone.1.inner.loop_body.reduction_dim.0

reduce.324.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.324.1.clone.1.inner.loop_header.reduction_dim.0
  %22 = load double, ptr %accumulator_02, align 8
  %23 = getelementptr inbounds [20 x [1 x double]], ptr %arg12, i32 0, i32 %reduce.324.1.clone.1.inner.indvar.reduction_dim.0, i32 0
  %24 = load double, ptr %23, align 8, !invariant.load !349
  %25 = getelementptr inbounds [20 x double], ptr %arg11, i32 0, i32 %reduce.324.1.clone.1.inner.indvar.reduction_dim.0
  %26 = load double, ptr %25, align 8, !invariant.load !349
  %27 = load double, ptr %arg0, align 8, !invariant.load !349
  %28 = getelementptr inbounds [20 x double], ptr %arg10, i32 0, i32 %reduce.324.1.clone.1.inner.indvar.reduction_dim.0
  %29 = load double, ptr %28, align 8, !invariant.load !349
  %multiply.11388.11.clone.1 = fmul double %27, %29
  %add.9565.11.clone.1 = fadd double %26, %multiply.11388.11.clone.1
  %constant_2976_3_clone_1 = load double, ptr @354, align 8
  %add.9572.11.clone.1 = fadd double %add.9565.11.clone.1, %constant_2976_3_clone_1
  %constant_3049_2_clone_1 = load double, ptr @357, align 8
  %multiply.11402.9.clone.1 = fmul double %add.9572.11.clone.1, %constant_3049_2_clone_1
  %add.9573.7.clone.1 = fadd double %24, %multiply.11402.9.clone.1
  %30 = getelementptr inbounds [20 x double], ptr %arg10, i32 0, i32 %reduce.324.1.clone.1.inner.indvar.reduction_dim.0
  %31 = load double, ptr %30, align 8, !invariant.load !349
  %multiply.11403.3.clone.1 = fmul double %add.9573.7.clone.1, %31
  store double %22, ptr %parameter_buffer5, align 8
  store double %multiply.11403.3.clone.1, ptr %parameter_buffer6, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer5, ptr %parameter_buffer6, ptr %return_buffer7)
  %32 = load double, ptr %return_buffer7, align 8
  store double %32, ptr %accumulator_02, align 8
  %invar.inc4 = add nuw nsw i32 %reduce.324.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.324.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.324.1.clone.1.inner.loop_header.reduction_dim.0

reduce.324.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.324.1.clone.1.inner.loop_header.reduction_dim.0
  %33 = load double, ptr %accumulator_02, align 8
  %add.9574.1.clone.1 = fadd double %20, %33
  %constant_2975_7_clone_19 = load double, ptr @351, align 8
  store double %constant_2975_7_clone_19, ptr %accumulator_08, align 8
  store i32 0, ptr %reduce.325.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.325.1.clone.1.inner.loop_header.reduction_dim.0

reduce.325.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.325.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.324.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.325.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.325.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %34 = icmp uge i32 %reduce.325.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %34, label %reduce.325.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.325.1.clone.1.inner.loop_body.reduction_dim.0

reduce.325.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.325.1.clone.1.inner.loop_header.reduction_dim.0
  %35 = load double, ptr %accumulator_08, align 8
  %36 = getelementptr inbounds [20 x double], ptr %arg17, i32 0, i32 %reduce.325.1.clone.1.inner.indvar.reduction_dim.0
  %37 = load double, ptr %36, align 8, !invariant.load !349
  %38 = getelementptr inbounds [20 x double], ptr %arg18, i32 0, i32 %reduce.325.1.clone.1.inner.indvar.reduction_dim.0
  %39 = load double, ptr %38, align 8, !invariant.load !349
  %40 = load double, ptr %arg0, align 8, !invariant.load !349
  %41 = getelementptr inbounds [20 x double], ptr %arg16, i32 0, i32 %reduce.325.1.clone.1.inner.indvar.reduction_dim.0
  %42 = load double, ptr %41, align 8, !invariant.load !349
  %multiply.11384.17.clone.1 = fmul double %40, %42
  %add.9561.17.clone.1 = fadd double %39, %multiply.11384.17.clone.1
  %43 = call double @__nv_exp(double %add.9561.17.clone.1)
  %multiply.11405.7.clone.1 = fmul double %37, %43
  %constant_3063_1_clone_1 = load double, ptr @356, align 8
  %add.9575.13.clone.1 = fadd double %add.9561.17.clone.1, %constant_3063_1_clone_1
  %constant_3043_2_clone_1 = load double, ptr @355, align 8
  %multiply.11406.9.clone.1 = fmul double %add.9575.13.clone.1, %constant_3043_2_clone_1
  %add.9576.7.clone.1 = fadd double %multiply.11405.7.clone.1, %multiply.11406.9.clone.1
  %44 = getelementptr inbounds [20 x double], ptr %arg16, i32 0, i32 %reduce.325.1.clone.1.inner.indvar.reduction_dim.0
  %45 = load double, ptr %44, align 8, !invariant.load !349
  %multiply.11407.3.clone.1 = fmul double %add.9576.7.clone.1, %45
  store double %35, ptr %parameter_buffer11, align 8
  store double %multiply.11407.3.clone.1, ptr %parameter_buffer12, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer11, ptr %parameter_buffer12, ptr %return_buffer13)
  %46 = load double, ptr %return_buffer13, align 8
  store double %46, ptr %accumulator_08, align 8
  %invar.inc10 = add nuw nsw i32 %reduce.325.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc10, ptr %reduce.325.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.325.1.clone.1.inner.loop_header.reduction_dim.0

reduce.325.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.325.1.clone.1.inner.loop_header.reduction_dim.0
  %47 = load double, ptr %accumulator_08, align 8
  %add.9577.1.clone.1 = fadd double %add.9574.1.clone.1, %47
  %constant_2975_7_clone_115 = load double, ptr @351, align 8
  store double %constant_2975_7_clone_115, ptr %accumulator_014, align 8
  store i32 0, ptr %reduce.326.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.326.1.clone.1.inner.loop_header.reduction_dim.0

reduce.326.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.326.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.325.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.326.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.326.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %48 = icmp uge i32 %reduce.326.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %48, label %reduce.326.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.326.1.clone.1.inner.loop_body.reduction_dim.0

reduce.326.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.326.1.clone.1.inner.loop_header.reduction_dim.0
  %49 = load double, ptr %accumulator_014, align 8
  %50 = getelementptr inbounds [20 x double], ptr %arg20, i32 0, i32 %reduce.326.1.clone.1.inner.indvar.reduction_dim.0
  %51 = load double, ptr %50, align 8, !invariant.load !349
  %52 = getelementptr inbounds [20 x double], ptr %arg21, i32 0, i32 %reduce.326.1.clone.1.inner.indvar.reduction_dim.0
  %53 = load double, ptr %52, align 8, !invariant.load !349
  %constant_2976_3_clone_117 = load double, ptr @354, align 8
  %add.9578.11.clone.1 = fadd double %53, %constant_2976_3_clone_117
  %add.9579.7.clone.1 = fadd double %51, %add.9578.11.clone.1
  %54 = getelementptr inbounds [20 x double], ptr %arg19, i32 0, i32 %reduce.326.1.clone.1.inner.indvar.reduction_dim.0
  %55 = load double, ptr %54, align 8, !invariant.load !349
  %multiply.11408.3.clone.1 = fmul double %add.9579.7.clone.1, %55
  store double %49, ptr %parameter_buffer18, align 8
  store double %multiply.11408.3.clone.1, ptr %parameter_buffer19, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer18, ptr %parameter_buffer19, ptr %return_buffer20)
  %56 = load double, ptr %return_buffer20, align 8
  store double %56, ptr %accumulator_014, align 8
  %invar.inc16 = add nuw nsw i32 %reduce.326.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc16, ptr %reduce.326.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.326.1.clone.1.inner.loop_header.reduction_dim.0

reduce.326.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.326.1.clone.1.inner.loop_header.reduction_dim.0
  %57 = load double, ptr %accumulator_014, align 8
  %add.9580.1.clone.1 = fadd double %add.9577.1.clone.1, %57
  %58 = load double, ptr %arg9, align 8, !invariant.load !349
  %add.9583.1.clone.1 = fadd double %add.9580.1.clone.1, %58
  %constant_2975_7_clone_122 = load double, ptr @351, align 8
  store double %constant_2975_7_clone_122, ptr %accumulator_021, align 8
  store i32 0, ptr %reduce.328.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.328.1.clone.1.inner.loop_header.reduction_dim.0

reduce.328.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.328.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.326.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.328.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.328.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %59 = icmp uge i32 %reduce.328.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %59, label %reduce.328.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.328.1.clone.1.inner.loop_body.reduction_dim.0

reduce.328.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.328.1.clone.1.inner.loop_header.reduction_dim.0
  %60 = load double, ptr %accumulator_021, align 8
  %61 = getelementptr inbounds [20 x double], ptr %arg7, i32 0, i32 %reduce.328.1.clone.1.inner.indvar.reduction_dim.0
  %62 = load double, ptr %61, align 8, !invariant.load !349
  %63 = getelementptr inbounds [20 x double], ptr %arg8, i32 0, i32 %reduce.328.1.clone.1.inner.indvar.reduction_dim.0
  %64 = load double, ptr %63, align 8, !invariant.load !349
  %constant_3069_1_clone_1 = load double, ptr @353, align 8
  %add.9584.11.clone.1 = fadd double %64, %constant_3069_1_clone_1
  %constant_3041_3_clone_1 = load double, ptr @352, align 8
  %multiply.11411.9.clone.1 = fmul double %add.9584.11.clone.1, %constant_3041_3_clone_1
  %add.9585.7.clone.1 = fadd double %62, %multiply.11411.9.clone.1
  %65 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %reduce.328.1.clone.1.inner.indvar.reduction_dim.0
  %66 = load double, ptr %65, align 8, !invariant.load !349
  %multiply.11412.3.clone.1 = fmul double %add.9585.7.clone.1, %66
  store double %60, ptr %parameter_buffer24, align 8
  store double %multiply.11412.3.clone.1, ptr %parameter_buffer25, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer24, ptr %parameter_buffer25, ptr %return_buffer26)
  %67 = load double, ptr %return_buffer26, align 8
  store double %67, ptr %accumulator_021, align 8
  %invar.inc23 = add nuw nsw i32 %reduce.328.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc23, ptr %reduce.328.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.328.1.clone.1.inner.loop_header.reduction_dim.0

reduce.328.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.328.1.clone.1.inner.loop_header.reduction_dim.0
  %68 = load double, ptr %accumulator_021, align 8
  %add.9586.1.clone.1 = fadd double %add.9583.1.clone.1, %68
  %69 = load double, ptr %arg1, align 8, !invariant.load !349
  %constant_2971_1_clone_1 = load double, ptr @360, align 8
  %multiply.11413.1.clone.1 = fmul double %69, %constant_2971_1_clone_1
  %subtract.825.1.clone.1 = fsub double %add.9586.1.clone.1, %multiply.11413.1.clone.1
  %70 = load double, ptr %arg3, align 8, !invariant.load !349
  %71 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.827.1.clone.1 = fsub double %70, %71
  %72 = load double, ptr %arg5, align 8, !invariant.load !349
  %73 = call double @llvm.fabs.f64(double %72)
  %constant_2970_1_clone_1 = load double, ptr @359, align 8
  %multiply.11430.1.clone.1 = fmul double %73, %constant_2970_1_clone_1
  %subtract.828.1.clone.1 = fsub double %subtract.827.1.clone.1, %multiply.11430.1.clone.1
  %74 = fcmp une double %subtract.825.1.clone.1, %subtract.825.1.clone.1
  %75 = fcmp oeq double %subtract.828.1.clone.1, %subtract.828.1.clone.1
  %76 = fcmp oge double %subtract.825.1.clone.1, %subtract.828.1.clone.1
  %77 = and i1 %75, %76
  %78 = or i1 %74, %77
  %maximum.61.1.clone.1 = select i1 %78, double %subtract.825.1.clone.1, double %subtract.828.1.clone.1
  %79 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2972_1_clone_1 = load double, ptr @358, align 8
  %multiply.11431.1.clone.1 = fmul double %79, %constant_2972_1_clone_1
  %80 = load double, ptr %arg1, align 8, !invariant.load !349
  %multiply.11432.1.clone.1 = fmul double %multiply.11431.1.clone.1, %80
  %subtract.829.1.clone.1 = fsub double %subtract.827.1.clone.1, %multiply.11432.1.clone.1
  %81 = fcmp une double %maximum.61.1.clone.1, %maximum.61.1.clone.1
  %82 = fcmp oeq double %subtract.829.1.clone.1, %subtract.829.1.clone.1
  %83 = fcmp ole double %maximum.61.1.clone.1, %subtract.829.1.clone.1
  %84 = and i1 %82, %83
  %85 = or i1 %81, %84
  %minimum.24.1.clone.1 = select i1 %85, double %maximum.61.1.clone.1, double %subtract.829.1.clone.1
  %constant_2975_7_clone_127 = load double, ptr @351, align 8
  %86 = fcmp une double %minimum.24.1.clone.1, %minimum.24.1.clone.1
  %87 = fcmp oeq double %constant_2975_7_clone_127, %constant_2975_7_clone_127
  %88 = fcmp oge double %minimum.24.1.clone.1, %constant_2975_7_clone_127
  %89 = and i1 %87, %88
  %90 = or i1 %86, %89
  %maximum.62.1.clone.1 = select i1 %90, double %minimum.24.1.clone.1, double %constant_2975_7_clone_127
  %compare.2654.1.clone.1 = fcmp une double %maximum.62.1.clone.1, %maximum.62.1.clone.1
  %91 = zext i1 %compare.2654.1.clone.1 to i8
  %constant_2969_1_clone_1 = load double, ptr @361, align 8
  %92 = trunc i8 %91 to i1
  %93 = select i1 %92, double %constant_2969_1_clone_1, double %maximum.62.1.clone.1
  %94 = call double @llvm.fabs.f64(double %add.9586.1.clone.1)
  %95 = load double, ptr %arg1, align 8, !invariant.load !349
  %96 = call double @llvm.fabs.f64(double %95)
  %constant_2968_1_clone_1 = load double, ptr @362, align 8
  %multiply.11433.5.clone.1 = fmul double %96, %constant_2968_1_clone_1
  %subtract.830.5.clone.1 = fsub double %94, %multiply.11433.5.clone.1
  %constant_2975_7_clone_128 = load double, ptr @351, align 8
  %97 = fcmp une double %subtract.830.5.clone.1, %subtract.830.5.clone.1
  %98 = fcmp oeq double %constant_2975_7_clone_128, %constant_2975_7_clone_128
  %99 = fcmp oge double %subtract.830.5.clone.1, %constant_2975_7_clone_128
  %100 = and i1 %98, %99
  %101 = or i1 %97, %100
  %maximum.63.5.clone.1 = select i1 %101, double %subtract.830.5.clone.1, double %constant_2975_7_clone_128
  %compare.2655.5.clone.1 = fcmp une double %maximum.63.5.clone.1, %maximum.63.5.clone.1
  %102 = zext i1 %compare.2655.5.clone.1 to i8
  %constant_2969_1_clone_129 = load double, ptr @361, align 8
  %103 = trunc i8 %102 to i1
  %104 = select i1 %103, double %constant_2969_1_clone_129, double %maximum.63.5.clone.1
  %105 = fcmp une double %93, %93
  %106 = fcmp oeq double %104, %104
  %107 = fcmp oge double %93, %104
  %108 = and i1 %106, %107
  %109 = or i1 %105, %108
  %maximum.64.5.clone.1 = select i1 %109, double %93, double %104
  %constant_2975_7_clone_130 = load double, ptr @351, align 8
  %compare.2656.5.clone.1 = fcmp ole double %maximum.64.5.clone.1, %constant_2975_7_clone_130
  %110 = zext i1 %compare.2656.5.clone.1 to i8
  %111 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2982_5_clone_1 = load double, ptr @364, align 8
  %compare.2657.1.clone.1 = fcmp oge double %111, %constant_2982_5_clone_1
  %112 = zext i1 %compare.2657.1.clone.1 to i8
  %constant_2975_7_clone_131 = load double, ptr @351, align 8
  %compare.2658.5.clone.1 = fcmp ogt double %93, %constant_2975_7_clone_131
  %113 = zext i1 %compare.2658.5.clone.1 to i8
  %114 = load double, ptr %arg3, align 8, !invariant.load !349
  %115 = load double, ptr %arg4, align 8, !invariant.load !349
  %compare.2659.5.clone.1 = fcmp oge double %114, %115
  %116 = zext i1 %compare.2659.5.clone.1 to i8
  %117 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_3009_3_clone_1 = load i64, ptr @363, align 8
  %118 = icmp sgt i64 %117, %constant_3009_3_clone_1
  %119 = zext i1 %118 to i8
  %120 = and i8 %116, %119
  %121 = or i8 %113, %120
  %constant_2975_7_clone_132 = load double, ptr @351, align 8
  %compare.2661.5.clone.1 = fcmp oge double %add.9586.1.clone.1, %constant_2975_7_clone_132
  %122 = zext i1 %compare.2661.5.clone.1 to i8
  %123 = trunc i8 %121 to i1
  %124 = xor i1 %123, true
  %125 = zext i1 %124 to i8
  %126 = and i8 %122, %125
  %127 = or i8 %121, %126
  %128 = or i8 %127, %110
  %129 = trunc i8 %128 to i1
  %130 = xor i1 %129, true
  %131 = zext i1 %130 to i8
  %132 = and i8 %112, %131
  %133 = or i8 %110, %132
  %134 = trunc i8 %133 to i1
  %135 = xor i1 %134, true
  %136 = zext i1 %135 to i8
  %137 = and i8 %7, %136
  %138 = insertvalue { i8, i8, i8, double, double, i64 } undef, i8 %137, 0
  %139 = insertvalue { i8, i8, i8, double, double, i64 } %138, i8 %133, 1
  %140 = insertvalue { i8, i8, i8, double, double, i64 } %139, i8 %128, 2
  %141 = insertvalue { i8, i8, i8, double, double, i64 } %140, double %93, 3
  %142 = insertvalue { i8, i8, i8, double, double, i64 } %141, double %add.9586.1.clone.1, 4
  %143 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_2967_2_clone_133 = load i64, ptr @350, align 8
  %144 = add i64 %143, %constant_2967_2_clone_133
  %145 = insertvalue { i8, i8, i8, double, double, i64 } %142, i64 %144, 5
  %146 = extractvalue { i8, i8, i8, double, double, i64 } %145, 0
  store i8 %146, ptr %arg22, align 1
  %147 = extractvalue { i8, i8, i8, double, double, i64 } %145, 1
  store i8 %147, ptr %arg23, align 1
  %148 = extractvalue { i8, i8, i8, double, double, i64 } %145, 2
  store i8 %148, ptr %arg24, align 1
  %149 = extractvalue { i8, i8, i8, double, double, i64 } %145, 3
  store double %149, ptr %arg25, align 8
  %150 = extractvalue { i8, i8, i8, double, double, i64 } %145, 4
  store double %150, ptr %arg26, align 8
  %151 = extractvalue { i8, i8, i8, double, double, i64 } %145, 5
  store i64 %151, ptr %arg27, align 8
  br label %loop_add_and_or_select_fusion.in_bounds-after
}

define void @loop_select_fusion_12(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.12.in_bounds-true, label %loop_select_fusion.12.in_bounds-after

loop_select_fusion.12.in_bounds-after:            ; preds = %loop_select_fusion.12.in_bounds-true, %entry
  ret void

loop_select_fusion.12.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg1, align 8, !invariant.load !349
  %constant_2975_10 = load double, ptr @367, align 8
  %compare.2661.15 = fcmp oge double %4, %constant_2975_10
  %5 = zext i1 %compare.2661.15 to i8
  %6 = load double, ptr %arg5, align 8, !invariant.load !349
  %constant_2975_101 = load double, ptr @367, align 8
  %compare.2658.19 = fcmp ogt double %6, %constant_2975_101
  %7 = zext i1 %compare.2658.19 to i8
  %8 = load double, ptr %arg3, align 8, !invariant.load !349
  %9 = load double, ptr %arg4, align 8, !invariant.load !349
  %compare.2659.19 = fcmp oge double %8, %9
  %10 = zext i1 %compare.2659.19 to i8
  %11 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_3009_4 = load i64, ptr @366, align 8
  %12 = icmp sgt i64 %11, %constant_3009_4
  %13 = zext i1 %12 to i8
  %14 = and i8 %10, %13
  %15 = or i8 %7, %14
  %16 = trunc i8 %15 to i1
  %17 = xor i1 %16, true
  %18 = zext i1 %17 to i8
  %19 = and i8 %5, %18
  %20 = load double, ptr %arg0, align 8, !invariant.load !349
  %21 = load double, ptr %arg1, align 8, !invariant.load !349
  %22 = trunc i8 %19 to i1
  %23 = select i1 %22, double %20, double %21
  store double %23, ptr %arg6, align 8
  br label %loop_select_fusion.12.in_bounds-after
}

define void @loop_select_fusion_11(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.11.in_bounds-true, label %loop_select_fusion.11.in_bounds-after

loop_select_fusion.11.in_bounds-after:            ; preds = %loop_select_fusion.11.in_bounds-true, %entry
  ret void

loop_select_fusion.11.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg4, align 8, !invariant.load !349
  %constant_2975_33 = load double, ptr @369, align 8
  %compare.2661.13 = fcmp oge double %4, %constant_2975_33
  %5 = zext i1 %compare.2661.13 to i8
  %6 = load double, ptr %arg3, align 8, !invariant.load !349
  %constant_2975_331 = load double, ptr @369, align 8
  %compare.2658.17 = fcmp ogt double %6, %constant_2975_331
  %7 = zext i1 %compare.2658.17 to i8
  %8 = load double, ptr %arg1, align 8, !invariant.load !349
  %9 = load double, ptr %arg0, align 8, !invariant.load !349
  %compare.2659.17 = fcmp oge double %8, %9
  %10 = zext i1 %compare.2659.17 to i8
  %11 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_3009_9 = load i64, ptr @368, align 8
  %12 = icmp sgt i64 %11, %constant_3009_9
  %13 = zext i1 %12 to i8
  %14 = and i8 %10, %13
  %15 = or i8 %7, %14
  %16 = trunc i8 %15 to i1
  %17 = xor i1 %16, true
  %18 = zext i1 %17 to i8
  %19 = and i8 %5, %18
  %20 = load double, ptr %arg0, align 8, !invariant.load !349
  %21 = load double, ptr %arg1, align 8, !invariant.load !349
  %22 = trunc i8 %19 to i1
  %23 = select i1 %22, double %20, double %21
  store double %23, ptr %arg5, align 8
  br label %loop_select_fusion.11.in_bounds-after
}

define void @loop_select_fusion_10(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.10.in_bounds-true, label %loop_select_fusion.10.in_bounds-after

loop_select_fusion.10.in_bounds-after:            ; preds = %loop_select_fusion.10.in_bounds-true, %entry
  ret void

loop_select_fusion.10.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg6, align 8, !invariant.load !349
  %constant_2975_32 = load double, ptr @371, align 8
  %compare.2661.11 = fcmp oge double %4, %constant_2975_32
  %5 = zext i1 %compare.2661.11 to i8
  %6 = load double, ptr %arg5, align 8, !invariant.load !349
  %constant_2975_321 = load double, ptr @371, align 8
  %compare.2658.15 = fcmp ogt double %6, %constant_2975_321
  %7 = zext i1 %compare.2658.15 to i8
  %8 = load double, ptr %arg3, align 8, !invariant.load !349
  %9 = load double, ptr %arg4, align 8, !invariant.load !349
  %compare.2659.15 = fcmp oge double %8, %9
  %10 = zext i1 %compare.2659.15 to i8
  %11 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_3009_8 = load i64, ptr @370, align 8
  %12 = icmp sgt i64 %11, %constant_3009_8
  %13 = zext i1 %12 to i8
  %14 = and i8 %10, %13
  %15 = or i8 %7, %14
  %16 = trunc i8 %15 to i1
  %17 = xor i1 %16, true
  %18 = zext i1 %17 to i8
  %19 = and i8 %5, %18
  %20 = load double, ptr %arg0, align 8, !invariant.load !349
  %21 = load double, ptr %arg1, align 8, !invariant.load !349
  %22 = trunc i8 %19 to i1
  %23 = select i1 %22, double %20, double %21
  store double %23, ptr %arg7, align 8
  br label %loop_select_fusion.10.in_bounds-after
}

define void @loop_select_fusion_9(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.9.in_bounds-true, label %loop_select_fusion.9.in_bounds-after

loop_select_fusion.9.in_bounds-after:             ; preds = %loop_select_fusion.9.in_bounds-true, %entry
  ret void

loop_select_fusion.9.in_bounds-true:              ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2975_31 = load double, ptr @373, align 8
  %compare.2661.9 = fcmp oge double %4, %constant_2975_31
  %5 = zext i1 %compare.2661.9 to i8
  %6 = load double, ptr %arg5, align 8, !invariant.load !349
  %constant_2975_311 = load double, ptr @373, align 8
  %compare.2658.13 = fcmp ogt double %6, %constant_2975_311
  %7 = zext i1 %compare.2658.13 to i8
  %8 = load double, ptr %arg3, align 8, !invariant.load !349
  %9 = load double, ptr %arg4, align 8, !invariant.load !349
  %compare.2659.13 = fcmp oge double %8, %9
  %10 = zext i1 %compare.2659.13 to i8
  %11 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_3009_7 = load i64, ptr @372, align 8
  %12 = icmp sgt i64 %11, %constant_3009_7
  %13 = zext i1 %12 to i8
  %14 = and i8 %10, %13
  %15 = or i8 %7, %14
  %16 = trunc i8 %15 to i1
  %17 = xor i1 %16, true
  %18 = zext i1 %17 to i8
  %19 = and i8 %5, %18
  %20 = load double, ptr %arg0, align 8, !invariant.load !349
  %21 = load double, ptr %arg1, align 8, !invariant.load !349
  %22 = trunc i8 %19 to i1
  %23 = select i1 %22, double %20, double %21
  store double %23, ptr %arg6, align 8
  br label %loop_select_fusion.9.in_bounds-after
}

define void @loop_select_fusion_8(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.8.in_bounds-true, label %loop_select_fusion.8.in_bounds-after

loop_select_fusion.8.in_bounds-after:             ; preds = %loop_select_fusion.8.in_bounds-true, %entry
  ret void

loop_select_fusion.8.in_bounds-true:              ; preds = %entry
  %4 = load double, ptr %arg4, align 8, !invariant.load !349
  %constant_2975_30 = load double, ptr @375, align 8
  %compare.2661.7 = fcmp oge double %4, %constant_2975_30
  %5 = zext i1 %compare.2661.7 to i8
  %6 = load double, ptr %arg3, align 8, !invariant.load !349
  %constant_2975_301 = load double, ptr @375, align 8
  %compare.2658.11 = fcmp ogt double %6, %constant_2975_301
  %7 = zext i1 %compare.2658.11 to i8
  %8 = load double, ptr %arg0, align 8, !invariant.load !349
  %9 = load double, ptr %arg1, align 8, !invariant.load !349
  %compare.2659.11 = fcmp oge double %8, %9
  %10 = zext i1 %compare.2659.11 to i8
  %11 = load i64, ptr %arg2, align 8, !invariant.load !349
  %constant_3009_6 = load i64, ptr @374, align 8
  %12 = icmp sgt i64 %11, %constant_3009_6
  %13 = zext i1 %12 to i8
  %14 = and i8 %10, %13
  %15 = or i8 %7, %14
  %16 = trunc i8 %15 to i1
  %17 = xor i1 %16, true
  %18 = zext i1 %17 to i8
  %19 = and i8 %5, %18
  %20 = load double, ptr %arg0, align 8, !invariant.load !349
  %21 = load double, ptr %arg1, align 8, !invariant.load !349
  %22 = trunc i8 %19 to i1
  %23 = select i1 %22, double %20, double %21
  store double %23, ptr %arg5, align 8
  br label %loop_select_fusion.8.in_bounds-after
}

define void @wrapped_select(ptr noalias align 128 dereferenceable(1) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %wrapped_select.in_bounds-true, label %wrapped_select.in_bounds-after

wrapped_select.in_bounds-after:                   ; preds = %wrapped_select.in_bounds-true, %entry
  ret void

wrapped_select.in_bounds-true:                    ; preds = %entry
  %4 = load i8, ptr %arg0, align 1, !invariant.load !349
  %5 = load double, ptr %arg1, align 8, !invariant.load !349
  %6 = load double, ptr %arg2, align 8, !invariant.load !349
  %7 = trunc i8 %4 to i1
  %8 = select i1 %7, double %5, double %6
  store double %8, ptr %arg3, align 8
  br label %wrapped_select.in_bounds-after
}

define void @loop_select_fusion_4(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(1) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.4.in_bounds-true, label %loop_select_fusion.4.in_bounds-after

loop_select_fusion.4.in_bounds-after:             ; preds = %loop_select_fusion.4.in_bounds-true, %entry
  ret void

loop_select_fusion.4.in_bounds-true:              ; preds = %entry
  %5 = load i8, ptr %arg2, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg0, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8
  %12 = trunc i8 %5 to i1
  %13 = select i1 %12, double %8, double %11
  %14 = insertvalue { double, double } undef, double %13, 0
  %15 = getelementptr double, ptr %arg4, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !349
  %18 = getelementptr double, ptr %arg0, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  %20 = load double, ptr %19, align 8, !invariant.load !349
  %constant_3069_3_clone_1 = load double, ptr @377, align 8
  %add.9584.7.clone.1 = fadd double %20, %constant_3069_3_clone_1
  %constant_3041_6_clone_1 = load double, ptr @376, align 8
  %multiply.11411.5.clone.1 = fmul double %add.9584.7.clone.1, %constant_3041_6_clone_1
  %add.9585.3.clone.1 = fadd double %17, %multiply.11411.5.clone.1
  %21 = getelementptr double, ptr %arg3, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  %23 = load double, ptr %22, align 8
  %24 = trunc i8 %5 to i1
  %25 = select i1 %24, double %add.9585.3.clone.1, double %23
  %26 = insertvalue { double, double } %14, double %25, 1
  %27 = extractvalue { double, double } %26, 0
  %28 = getelementptr double, ptr %arg1, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  %30 = extractvalue { double, double } %26, 1
  %31 = getelementptr double, ptr %arg3, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  store double %30, ptr %32, align 8
  br label %loop_select_fusion.4.in_bounds-after
}

define void @loop_select_fusion_3(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(1) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.3.in_bounds-true, label %loop_select_fusion.3.in_bounds-after

loop_select_fusion.3.in_bounds-after:             ; preds = %loop_select_fusion.3.in_bounds-true, %entry
  ret void

loop_select_fusion.3.in_bounds-true:              ; preds = %entry
  %5 = load i8, ptr %arg2, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg0, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8
  %12 = trunc i8 %5 to i1
  %13 = select i1 %12, double %8, double %11
  %14 = insertvalue { double, double } undef, double %13, 0
  %15 = getelementptr double, ptr %arg4, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !349
  %18 = getelementptr double, ptr %arg0, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  %20 = load double, ptr %19, align 8, !invariant.load !349
  %constant_3049_5_clone_1 = load double, ptr @379, align 8
  %add.9581.7.clone.1 = fadd double %20, %constant_3049_5_clone_1
  %constant_3041_5_clone_1 = load double, ptr @378, align 8
  %multiply.11409.5.clone.1 = fmul double %add.9581.7.clone.1, %constant_3041_5_clone_1
  %add.9582.3.clone.1 = fadd double %17, %multiply.11409.5.clone.1
  %21 = getelementptr double, ptr %arg3, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  %23 = load double, ptr %22, align 8
  %24 = trunc i8 %5 to i1
  %25 = select i1 %24, double %add.9582.3.clone.1, double %23
  %26 = insertvalue { double, double } %14, double %25, 1
  %27 = extractvalue { double, double } %26, 0
  %28 = getelementptr double, ptr %arg1, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  %30 = extractvalue { double, double } %26, 1
  %31 = getelementptr double, ptr %arg3, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  store double %30, ptr %32, align 8
  br label %loop_select_fusion.3.in_bounds-after
}

define void @loop_select_fusion_2(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(1) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.2.in_bounds-true, label %loop_select_fusion.2.in_bounds-after

loop_select_fusion.2.in_bounds-after:             ; preds = %loop_select_fusion.2.in_bounds-true, %entry
  ret void

loop_select_fusion.2.in_bounds-true:              ; preds = %entry
  %5 = load i8, ptr %arg2, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg0, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8
  %12 = trunc i8 %5 to i1
  %13 = select i1 %12, double %8, double %11
  %14 = insertvalue { double, double } undef, double %13, 0
  %15 = getelementptr double, ptr %arg4, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !349
  %18 = getelementptr double, ptr %arg0, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  %20 = load double, ptr %19, align 8, !invariant.load !349
  %constant_2976_6_clone_1 = load double, ptr @380, align 8
  %add.9578.7.clone.1 = fadd double %20, %constant_2976_6_clone_1
  %add.9579.3.clone.1 = fadd double %17, %add.9578.7.clone.1
  %21 = getelementptr double, ptr %arg3, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  %23 = load double, ptr %22, align 8
  %24 = trunc i8 %5 to i1
  %25 = select i1 %24, double %add.9579.3.clone.1, double %23
  %26 = insertvalue { double, double } %14, double %25, 1
  %27 = extractvalue { double, double } %26, 0
  %28 = getelementptr double, ptr %arg1, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  %30 = extractvalue { double, double } %26, 1
  %31 = getelementptr double, ptr %arg3, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  store double %30, ptr %32, align 8
  br label %loop_select_fusion.2.in_bounds-after
}

define void @loop_select_fusion_6(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.6.in_bounds-true, label %loop_select_fusion.6.in_bounds-after

loop_select_fusion.6.in_bounds-after:             ; preds = %loop_select_fusion.6.in_bounds-true, %entry
  ret void

loop_select_fusion.6.in_bounds-true:              ; preds = %entry
  %5 = load i8, ptr %arg1, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg2, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg3, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8
  %12 = load double, ptr %arg5, align 8, !invariant.load !349
  %13 = getelementptr double, ptr %arg4, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !349
  %multiply.11384.13 = fmul double %12, %15
  %add.9561.13 = fadd double %11, %multiply.11384.13
  %16 = call double @__nv_exp(double %add.9561.13)
  %multiply.11405.3 = fmul double %8, %16
  %constant_3063_3 = load double, ptr @382, align 8
  %add.9575.7 = fadd double %add.9561.13, %constant_3063_3
  %constant_3043_3 = load double, ptr @381, align 8
  %multiply.11406.5 = fmul double %add.9575.7, %constant_3043_3
  %add.9576.3 = fadd double %multiply.11405.3, %multiply.11406.5
  %17 = getelementptr double, ptr %arg0, i32 %linear_index
  %18 = getelementptr inbounds double, ptr %17, i32 0
  %19 = load double, ptr %18, align 8
  %20 = trunc i8 %5 to i1
  %21 = select i1 %20, double %add.9576.3, double %19
  %22 = insertvalue { double, double } undef, double %21, 0
  %23 = getelementptr double, ptr %arg3, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8
  %26 = trunc i8 %5 to i1
  %27 = select i1 %26, double %add.9561.13, double %25
  %28 = insertvalue { double, double } %22, double %27, 1
  %29 = extractvalue { double, double } %28, 0
  %30 = getelementptr double, ptr %arg0, i32 %linear_index
  %31 = getelementptr inbounds double, ptr %30, i32 0
  store double %29, ptr %31, align 8
  %32 = extractvalue { double, double } %28, 1
  %33 = getelementptr double, ptr %arg3, i32 %linear_index
  %34 = getelementptr inbounds double, ptr %33, i32 0
  store double %32, ptr %34, align 8
  br label %loop_select_fusion.6.in_bounds-after
}

define void @loop_select_fusion_1(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.1.in_bounds-true, label %loop_select_fusion.1.in_bounds-after

loop_select_fusion.1.in_bounds-after:             ; preds = %loop_select_fusion.1.in_bounds-true, %entry
  ret void

loop_select_fusion.1.in_bounds-true:              ; preds = %entry
  %5 = load i8, ptr %arg1, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg0, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8
  %9 = load double, ptr %arg3, align 8, !invariant.load !349
  %10 = getelementptr double, ptr %arg2, i32 %linear_index
  %11 = getelementptr inbounds double, ptr %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !349
  %multiply.11388.5 = fmul double %9, %12
  %add.9565.5 = fadd double %8, %multiply.11388.5
  %13 = getelementptr double, ptr %arg0, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  %15 = load double, ptr %14, align 8
  %16 = trunc i8 %5 to i1
  %17 = select i1 %16, double %add.9565.5, double %15
  %18 = insertvalue { double, double } undef, double %17, 0
  %19 = getelementptr double, ptr %arg5, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  %21 = load double, ptr %20, align 8, !invariant.load !349
  %constant_2976_7_clone_1 = load double, ptr @384, align 8
  %add.9572.7.clone.1 = fadd double %add.9565.5, %constant_2976_7_clone_1
  %constant_3049_6_clone_1 = load double, ptr @383, align 8
  %multiply.11402.5.clone.1 = fmul double %add.9572.7.clone.1, %constant_3049_6_clone_1
  %add.9573.3.clone.1 = fadd double %21, %multiply.11402.5.clone.1
  %22 = getelementptr double, ptr %arg4, i32 %linear_index
  %23 = getelementptr inbounds double, ptr %22, i32 0
  %24 = load double, ptr %23, align 8
  %25 = trunc i8 %5 to i1
  %26 = select i1 %25, double %add.9573.3.clone.1, double %24
  %27 = insertvalue { double, double } %18, double %26, 1
  %28 = extractvalue { double, double } %27, 0
  %29 = getelementptr double, ptr %arg0, i32 %linear_index
  %30 = getelementptr inbounds double, ptr %29, i32 0
  store double %28, ptr %30, align 8
  %31 = extractvalue { double, double } %27, 1
  %32 = getelementptr double, ptr %arg4, i32 %linear_index
  %33 = getelementptr inbounds double, ptr %32, i32 0
  store double %31, ptr %33, align 8
  br label %loop_select_fusion.1.in_bounds-after
}

define void @loop_select_fusion_5(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_select_fusion.5.in_bounds-true, label %loop_select_fusion.5.in_bounds-after

loop_select_fusion.5.in_bounds-after:             ; preds = %loop_select_fusion.5.in_bounds-true, %entry
  ret void

loop_select_fusion.5.in_bounds-true:              ; preds = %entry
  %5 = load i8, ptr %arg1, align 1, !invariant.load !349
  %6 = getelementptr double, ptr %arg2, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg3, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8
  %12 = load double, ptr %arg5, align 8, !invariant.load !349
  %13 = getelementptr double, ptr %arg4, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  %15 = load double, ptr %14, align 8, !invariant.load !349
  %multiply.11392.11 = fmul double %12, %15
  %add.9567.11 = fadd double %11, %multiply.11392.11
  %add.9570.1 = fadd double %8, %add.9567.11
  %16 = getelementptr double, ptr %arg0, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  %18 = load double, ptr %17, align 8
  %19 = trunc i8 %5 to i1
  %20 = select i1 %19, double %add.9570.1, double %18
  %21 = insertvalue { double, double } undef, double %20, 0
  %22 = getelementptr double, ptr %arg3, i32 %linear_index
  %23 = getelementptr inbounds double, ptr %22, i32 0
  %24 = load double, ptr %23, align 8
  %25 = trunc i8 %5 to i1
  %26 = select i1 %25, double %add.9567.11, double %24
  %27 = insertvalue { double, double } %21, double %26, 1
  %28 = extractvalue { double, double } %27, 0
  %29 = getelementptr double, ptr %arg0, i32 %linear_index
  %30 = getelementptr inbounds double, ptr %29, i32 0
  store double %28, ptr %30, align 8
  %31 = extractvalue { double, double } %27, 1
  %32 = getelementptr double, ptr %arg3, i32 %linear_index
  %33 = getelementptr inbounds double, ptr %32, i32 0
  store double %31, ptr %33, align 8
  br label %loop_select_fusion.5.in_bounds-after
}

define void @loop_select_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.in_bounds-true, label %loop_select_fusion.in_bounds-after

loop_select_fusion.in_bounds-after:               ; preds = %loop_select_fusion.in_bounds-true, %entry
  ret void

loop_select_fusion.in_bounds-true:                ; preds = %entry
  %4 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_2975_11 = load double, ptr @385, align 8
  %compare.2663.1 = fcmp ole double %4, %constant_2975_11
  %5 = zext i1 %compare.2663.1 to i8
  %6 = load double, ptr %arg0, align 8, !invariant.load !349
  %7 = load double, ptr %arg1, align 8
  %8 = trunc i8 %5 to i1
  %9 = select i1 %8, double %6, double %7
  store double %9, ptr %arg1, align 8
  br label %loop_select_fusion.in_bounds-after
}

define void @input_reduce_fusion_3(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(16) %arg7) {
entry:
  %return_buffer36 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !348
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_3090_13 = load double, ptr @386, align 8
  store double %constant_3090_13, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !369
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = udiv i32 %thread.id.x, 2
  %thread.id.1 = urem i32 %1, 16
  %thread.id.2 = urem i32 %thread.id.x, 2
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 2, i32 16
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 16
  %tile_origin.2 = mul i32 %3, 2
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %8 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %8, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 16
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %9 = icmp uge i32 %loop2.indvar, 2
  br i1 %9, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 2
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %10 = add i32 %loop2.indvar, %thread.id.2
  %11 = icmp ult i32 %10, 2
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %concatenate.79.7.merge, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !370

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !371

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result35 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result35 to i64
  %13 = bitcast i64 %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 1, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 0
  %17 = extractelement <2 x i32> %16, i64 1
  %18 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 1, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to i64
  %21 = bitcast i64 %20 to double
  store double %21, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer36)
  %22 = load double, ptr %return_buffer36, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %23 = udiv i32 %thread.id.2, 32
  %24 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %24, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %25 = add i32 %tile_origin.0, 0
  %26 = add i32 %tile_origin.1, %loop1.indvar
  %27 = add i32 %tile_origin.2, %10
  br label %concatenate.pivot.1.19

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.20
  %28 = phi i32 [ 0, %concatenate.pivot.0.20 ]
  %29 = sub nsw i32 %26, %28
  br label %concatenate.pivot.1.

concat_index_from_operand_id02:                   ; preds = %concatenate.pivot.0.
  %30 = phi i32 [ 0, %concatenate.pivot.0. ]
  %31 = sub nsw i32 %27, %30
  %param_4.2451 = load double, ptr %arg4, align 8, !invariant.load !349
  %param_5.1997 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.837.2 = fsub double %param_4.2451, %param_5.1997
  %multiply.11538.1 = fmul double %subtract.837.2, %subtract.837.2
  br label %concatenate.76.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.4
  %32 = phi i32 [ 1, %concatenate.pivot.1.4 ]
  %33 = sub nsw i32 %27, %32
  %param_6.1650 = load double, ptr %arg6, align 8, !invariant.load !349
  %param_5.19973 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.838.1 = fsub double %param_6.1650, %param_5.19973
  %multiply.11539.1 = fmul double %subtract.838.1, %subtract.838.1
  %34 = fneg double %multiply.11539.1
  br label %concatenate.76.5.merge

concatenate.pivot.1.:                             ; preds = %concat_index_from_operand_id0
  %35 = icmp ult i32 %27, 1
  br i1 %35, label %concatenate.pivot.0., label %concatenate.pivot.1.4

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id02

concatenate.pivot.1.4:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.76.5.merge:                           ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id02
  %36 = phi double [ %multiply.11538.1, %concat_index_from_operand_id02 ], [ %34, %concat_index_from_operand_id1 ]
  br label %concatenate.78.3.merge

concat_index_from_operand_id15:                   ; preds = %concatenate.pivot.1.21
  %37 = phi i32 [ 1, %concatenate.pivot.1.21 ]
  %38 = sub nsw i32 %26, %37
  br label %concatenate.pivot.1.16

concat_index_from_operand_id06:                   ; preds = %concatenate.pivot.0.17
  %39 = phi i32 [ 0, %concatenate.pivot.0.17 ]
  %40 = sub nsw i32 %27, %39
  %param_4.24517 = load double, ptr %arg4, align 8, !invariant.load !349
  %param_5.19978 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.837.29 = fsub double %param_4.24517, %param_5.19978
  %multiply.11538.110 = fmul double %subtract.837.29, %subtract.837.29
  %multiply.11540.1 = fmul double %multiply.11538.110, %subtract.837.29
  %41 = fneg double %multiply.11540.1
  br label %concatenate.77.5.merge

concat_index_from_operand_id111:                  ; preds = %concatenate.pivot.1.18
  %42 = phi i32 [ 1, %concatenate.pivot.1.18 ]
  %43 = sub nsw i32 %27, %42
  %param_6.165012 = load double, ptr %arg6, align 8, !invariant.load !349
  %param_5.199713 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.838.114 = fsub double %param_6.165012, %param_5.199713
  %multiply.11539.115 = fmul double %subtract.838.114, %subtract.838.114
  %multiply.11541.1 = fmul double %multiply.11539.115, %subtract.838.114
  br label %concatenate.77.5.merge

concatenate.pivot.1.16:                           ; preds = %concat_index_from_operand_id15
  %44 = icmp ult i32 %27, 1
  br i1 %44, label %concatenate.pivot.0.17, label %concatenate.pivot.1.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.1.16
  br label %concat_index_from_operand_id06

concatenate.pivot.1.18:                           ; preds = %concatenate.pivot.1.16
  br label %concat_index_from_operand_id111

concatenate.77.5.merge:                           ; preds = %concat_index_from_operand_id111, %concat_index_from_operand_id06
  %45 = phi double [ %41, %concat_index_from_operand_id06 ], [ %multiply.11541.1, %concat_index_from_operand_id111 ]
  br label %concatenate.78.3.merge

concatenate.pivot.1.19:                           ; preds = %x_in_tile-true
  %46 = icmp ult i32 %26, 1
  br i1 %46, label %concatenate.pivot.0.20, label %concatenate.pivot.1.21

concatenate.pivot.0.20:                           ; preds = %concatenate.pivot.1.19
  br label %concat_index_from_operand_id0

concatenate.pivot.1.21:                           ; preds = %concatenate.pivot.1.19
  br label %concat_index_from_operand_id15

concatenate.78.3.merge:                           ; preds = %concatenate.77.5.merge, %concatenate.76.5.merge
  %47 = phi double [ %36, %concatenate.76.5.merge ], [ %45, %concatenate.77.5.merge ]
  br label %concatenate.pivot.1.32

concat_index_from_operand_id022:                  ; preds = %concatenate.pivot.0.33
  %48 = phi i32 [ 0, %concatenate.pivot.0.33 ]
  %49 = sub nsw i32 %27, %48
  %param_3.2891 = load double, ptr %arg3, align 8, !invariant.load !349
  %param_2.3530 = load double, ptr %arg2, align 8, !invariant.load !349
  %subtract.839.5 = fsub double %param_3.2891, %param_2.3530
  %param_0.3062 = load double, ptr %arg0, align 8, !invariant.load !349
  %param_6.165023 = load double, ptr %arg6, align 8, !invariant.load !349
  %param_5.199724 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.838.125 = fsub double %param_6.165023, %param_5.199724
  %multiply.11542.5 = fmul double %param_0.3062, %subtract.838.125
  %subtract.840.5 = fsub double %subtract.839.5, %multiply.11542.5
  br label %concatenate.79.7.merge

concat_index_from_operand_id126:                  ; preds = %concatenate.pivot.1.34
  %50 = phi i32 [ 1, %concatenate.pivot.1.34 ]
  %51 = sub nsw i32 %27, %50
  %param_1.4231 = load double, ptr %arg1, align 8, !invariant.load !349
  %param_2.353027 = load double, ptr %arg2, align 8, !invariant.load !349
  %subtract.841.1 = fsub double %param_1.4231, %param_2.353027
  %param_0.306228 = load double, ptr %arg0, align 8, !invariant.load !349
  %param_4.245129 = load double, ptr %arg4, align 8, !invariant.load !349
  %param_5.199730 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.837.231 = fsub double %param_4.245129, %param_5.199730
  %multiply.11543.1 = fmul double %param_0.306228, %subtract.837.231
  %subtract.842.1 = fsub double %subtract.841.1, %multiply.11543.1
  br label %concatenate.79.7.merge

concatenate.pivot.1.32:                           ; preds = %concatenate.78.3.merge
  %52 = icmp ult i32 %27, 1
  br i1 %52, label %concatenate.pivot.0.33, label %concatenate.pivot.1.34

concatenate.pivot.0.33:                           ; preds = %concatenate.pivot.1.32
  br label %concat_index_from_operand_id022

concatenate.pivot.1.34:                           ; preds = %concatenate.pivot.1.32
  br label %concat_index_from_operand_id126

concatenate.79.7.merge:                           ; preds = %concat_index_from_operand_id126, %concat_index_from_operand_id022
  %53 = phi double [ %subtract.840.5, %concat_index_from_operand_id022 ], [ %subtract.842.1, %concat_index_from_operand_id126 ]
  %multiply.11544.3 = fmul double %47, %53
  store double %multiply.11544.3, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %54 = load double, ptr %return_buffer, align 8
  store double %54, ptr %partial_reduction_result, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %55 = and i32 %thread.id.2, 1
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %57 = add i32 %tile_origin.1, %thread.id.1
  %output_element_address = getelementptr inbounds [2 x double], ptr %arg7, i32 0, i32 %57
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

define void @loop_divide_fusion(ptr noalias align 128 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !372
  %2 = mul nuw nsw i32 %0, 2
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 2
  br i1 %4, label %loop_divide_fusion.in_bounds-true, label %loop_divide_fusion.in_bounds-after

loop_divide_fusion.in_bounds-after:               ; preds = %loop_divide_fusion.in_bounds-true, %entry
  ret void

loop_divide_fusion.in_bounds-true:                ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8
  %8 = load double, ptr %arg3, align 8, !invariant.load !349
  %9 = load double, ptr %arg2, align 8, !invariant.load !349
  %subtract.838.5 = fsub double %8, %9
  %10 = load double, ptr %arg1, align 8, !invariant.load !349
  %11 = load double, ptr %arg2, align 8, !invariant.load !349
  %subtract.837.1 = fsub double %10, %11
  %multiply.11545.1 = fmul double %subtract.838.5, %subtract.837.1
  %multiply.11546.1 = fmul double %multiply.11545.1, %multiply.11545.1
  %subtract.843.1 = fsub double %subtract.838.5, %subtract.837.1
  %multiply.11547.1 = fmul double %multiply.11546.1, %subtract.843.1
  %divide.2507.1 = fdiv double %7, %multiply.11547.1
  %12 = getelementptr double, ptr %arg0, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  store double %divide.2507.1, ptr %13, align 8
  br label %loop_divide_fusion.in_bounds-after
}

define void @loop_select_fusion_22(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(16) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.22.in_bounds-true, label %loop_select_fusion.22.in_bounds-after

loop_select_fusion.22.in_bounds-after:            ; preds = %loop_select_fusion.22.in_bounds-true, %entry
  ret void

loop_select_fusion.22.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg1, align 8, !invariant.load !349
  %5 = getelementptr inbounds [2 x double], ptr %arg6, i32 0, i32 1
  %6 = load double, ptr %5, align 8, !invariant.load !349
  %7 = fneg double %6
  %multiply.11548.3 = fmul double %6, %6
  %8 = getelementptr inbounds [2 x double], ptr %arg6, i32 0, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %10 = getelementptr double, ptr @387, i32 %linear_index
  %constant_3174_1 = getelementptr inbounds double, ptr %10, i32 0
  %constant_3174_11 = load double, ptr %constant_3174_1, align 8
  %multiply.11549.3 = fmul double %9, %constant_3174_11
  %11 = load double, ptr %arg3, align 8, !invariant.load !349
  %multiply.11550.7 = fmul double %multiply.11549.3, %11
  %subtract.844.9 = fsub double %multiply.11548.3, %multiply.11550.7
  %12 = call double @__nv_sqrt(double %subtract.844.9)
  %add.9709.7 = fadd double %7, %12
  %divide.2508.5 = fdiv double %add.9709.7, %multiply.11549.3
  %add.9710.3 = fadd double %4, %divide.2508.5
  %13 = load double, ptr %arg2, align 8, !invariant.load !349
  %14 = load double, ptr %arg1, align 8, !invariant.load !349
  %15 = fcmp une double %13, %13
  %16 = fcmp oeq double %14, %14
  %17 = fcmp ole double %13, %14
  %18 = and i1 %16, %17
  %19 = or i1 %15, %18
  %minimum.25.1 = select i1 %19, double %13, double %14
  %20 = load double, ptr %arg2, align 8, !invariant.load !349
  %21 = load double, ptr %arg1, align 8, !invariant.load !349
  %subtract.838.2 = fsub double %20, %21
  %22 = call double @llvm.fabs.f64(double %subtract.838.2)
  %constant_3130_1 = load double, ptr @388, align 8
  %multiply.11551.1 = fmul double %22, %constant_3130_1
  %add.9712.3 = fadd double %minimum.25.1, %multiply.11551.1
  %compare.2679.3 = fcmp ogt double %add.9710.3, %add.9712.3
  %23 = zext i1 %compare.2679.3 to i8
  %24 = load double, ptr %arg2, align 8, !invariant.load !349
  %25 = load double, ptr %arg1, align 8, !invariant.load !349
  %26 = fcmp une double %24, %24
  %27 = fcmp oeq double %25, %25
  %28 = fcmp oge double %24, %25
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %maximum.65.1 = select i1 %30, double %24, double %25
  %subtract.845.3 = fsub double %maximum.65.1, %multiply.11551.1
  %compare.2680.3 = fcmp olt double %add.9710.3, %subtract.845.3
  %31 = zext i1 %compare.2680.3 to i8
  %32 = and i8 %23, %31
  %33 = trunc i8 %32 to i1
  %34 = xor i1 %33, true
  %35 = zext i1 %34 to i8
  %36 = load double, ptr %arg1, align 8, !invariant.load !349
  %37 = load double, ptr %arg3, align 8, !invariant.load !349
  %38 = load double, ptr %arg4, align 8, !invariant.load !349
  %39 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.839.7 = fsub double %38, %39
  %40 = load double, ptr %arg3, align 8, !invariant.load !349
  %multiply.11542.7 = fmul double %40, %subtract.838.2
  %subtract.840.7 = fsub double %subtract.839.7, %multiply.11542.7
  %multiply.11539.4 = fmul double %subtract.838.2, %subtract.838.2
  %divide.2509.3 = fdiv double %subtract.840.7, %multiply.11539.4
  %constant_3124_2 = load double, ptr @389, align 8
  %multiply.11552.3 = fmul double %divide.2509.3, %constant_3124_2
  %divide.2510.3 = fdiv double %37, %multiply.11552.3
  %subtract.846.1 = fsub double %36, %divide.2510.3
  %constant_3129_1 = load double, ptr @390, align 8
  %multiply.11553.1 = fmul double %22, %constant_3129_1
  %add.9713.1 = fadd double %minimum.25.1, %multiply.11553.1
  %compare.2681.1 = fcmp ogt double %subtract.846.1, %add.9713.1
  %41 = zext i1 %compare.2681.1 to i8
  %subtract.847.1 = fsub double %maximum.65.1, %multiply.11553.1
  %compare.2682.1 = fcmp olt double %subtract.846.1, %subtract.847.1
  %42 = zext i1 %compare.2682.1 to i8
  %43 = and i8 %41, %42
  %44 = and i8 %35, %43
  %45 = trunc i8 %44 to i1
  %46 = xor i1 %45, true
  %47 = zext i1 %46 to i8
  %48 = and i8 %35, %47
  %49 = load double, ptr %arg1, align 8, !invariant.load !349
  %50 = load double, ptr %arg2, align 8, !invariant.load !349
  %add.9714.1 = fadd double %49, %50
  %constant_3112_1 = load double, ptr @391, align 8
  %multiply.11554.1 = fmul double %add.9714.1, %constant_3112_1
  %51 = load double, ptr %arg0, align 8, !invariant.load !349
  %52 = trunc i8 %32 to i1
  %53 = select i1 %52, double %add.9710.3, double %51
  %54 = trunc i8 %44 to i1
  %55 = select i1 %54, double %subtract.846.1, double %53
  %56 = trunc i8 %48 to i1
  %57 = select i1 %56, double %multiply.11554.1, double %55
  store double %57, ptr %arg7, align 8
  br label %loop_select_fusion.22.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_sqrt(double) #2

define void @loop_reduce_fusion_7(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.332.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.7.in_bounds-true, label %loop_reduce_fusion.7.in_bounds-after

loop_reduce_fusion.7.in_bounds-after:             ; preds = %reduce.332.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.7.in_bounds-true:              ; preds = %entry
  %constant_3090_24 = load double, ptr @392, align 8
  store double %constant_3090_24, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.332.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.332.1.inner.loop_header.reduction_dim.0

reduce.332.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.332.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.7.in_bounds-true
  %reduce.332.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.332.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.332.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.332.1.inner.loop_exit.reduction_dim.0, label %reduce.332.1.inner.loop_body.reduction_dim.0

reduce.332.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.332.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.332.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = load double, ptr %arg2, align 8, !invariant.load !349
  %9 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.332.1.inner.indvar.reduction_dim.0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %multiply.11563.15 = fmul double %8, %10
  %add.9724.15 = fadd double %7, %multiply.11563.15
  %multiply.11591.5 = fmul double %add.9724.15, %add.9724.15
  %constant_3117_2 = load double, ptr @394, align 8
  %add.9753.5 = fadd double %multiply.11591.5, %constant_3117_2
  %constant_3165_4 = load double, ptr @393, align 8
  %multiply.11592.3 = fmul double %add.9753.5, %constant_3165_4
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11592.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %11 = load double, ptr %return_buffer, align 8
  store double %11, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.332.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.332.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.332.1.inner.loop_header.reduction_dim.0

reduce.332.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.332.1.inner.loop_header.reduction_dim.0
  %12 = load double, ptr %accumulator_0, align 8
  store double %12, ptr %arg3, align 8
  br label %loop_reduce_fusion.7.in_bounds-after
}

define void @loop_reduce_fusion_8(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.330.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.8.in_bounds-true, label %loop_reduce_fusion.8.in_bounds-after

loop_reduce_fusion.8.in_bounds-after:             ; preds = %reduce.330.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.8.in_bounds-true:              ; preds = %entry
  %constant_3090_23 = load double, ptr @395, align 8
  store double %constant_3090_23, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.330.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.330.1.inner.loop_header.reduction_dim.0

reduce.330.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.330.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.8.in_bounds-true
  %reduce.330.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.330.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.330.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.330.1.inner.loop_exit.reduction_dim.0, label %reduce.330.1.inner.loop_body.reduction_dim.0

reduce.330.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.330.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.330.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %constant_3171_4 = load double, ptr @399, align 8
  %add.9742.13 = fadd double %7, %constant_3171_4
  %multiply.11585.7 = fmul double %add.9742.13, %add.9742.13
  %constant_3164_4 = load double, ptr @398, align 8
  %multiply.11586.7 = fmul double %multiply.11585.7, %constant_3164_4
  %constant_3123_2 = load double, ptr @397, align 8
  %add.9749.5 = fadd double %multiply.11586.7, %constant_3123_2
  %constant_3165_2 = load double, ptr @396, align 8
  %multiply.11587.3 = fmul double %add.9749.5, %constant_3165_2
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11587.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %8 = load double, ptr %return_buffer, align 8
  store double %8, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.330.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.330.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.330.1.inner.loop_header.reduction_dim.0

reduce.330.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.330.1.inner.loop_header.reduction_dim.0
  %9 = load double, ptr %accumulator_0, align 8
  store double %9, ptr %arg1, align 8
  br label %loop_reduce_fusion.8.in_bounds-after
}

define void @loop_negate_fusion_1(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.335.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_negate_fusion.1.in_bounds-true, label %loop_negate_fusion.1.in_bounds-after

loop_negate_fusion.1.in_bounds-after:             ; preds = %reduce.335.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_negate_fusion.1.in_bounds-true:              ; preds = %entry
  %4 = load double, ptr %arg4, align 8, !invariant.load !349
  %5 = load double, ptr %arg5, align 8, !invariant.load !349
  %add.9752.1 = fadd double %4, %5
  %6 = load double, ptr %arg3, align 8, !invariant.load !349
  %add.9754.1 = fadd double %add.9752.1, %6
  %7 = load double, ptr %arg2, align 8, !invariant.load !349
  %add.9757.1 = fadd double %add.9754.1, %7
  %8 = load double, ptr %arg1, align 8, !invariant.load !349
  %add.9759.1 = fadd double %add.9757.1, %8
  %constant_3090_19 = load double, ptr @400, align 8
  store double %constant_3090_19, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.335.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.335.1.inner.loop_header.reduction_dim.0

reduce.335.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.335.1.inner.loop_body.reduction_dim.0, %loop_negate_fusion.1.in_bounds-true
  %reduce.335.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.335.1.inner.invar_address.reduction_dim.0, align 4
  %9 = icmp uge i32 %reduce.335.1.inner.indvar.reduction_dim.0, 20
  br i1 %9, label %reduce.335.1.inner.loop_exit.reduction_dim.0, label %reduce.335.1.inner.loop_body.reduction_dim.0

reduce.335.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.335.1.inner.loop_header.reduction_dim.0
  %10 = load double, ptr %accumulator_0, align 8
  %11 = getelementptr inbounds [20 x double], ptr %arg6, i32 0, i32 %reduce.335.1.inner.indvar.reduction_dim.0
  %12 = load double, ptr %11, align 8, !invariant.load !349
  %constant_3091_5 = load double, ptr @403, align 8
  %add.9738.13 = fadd double %12, %constant_3091_5
  %multiply.11599.5 = fmul double %add.9738.13, %add.9738.13
  %constant_3117_1 = load double, ptr @402, align 8
  %add.9760.5 = fadd double %multiply.11599.5, %constant_3117_1
  %constant_3165_1 = load double, ptr @401, align 8
  %multiply.11600.3 = fmul double %add.9760.5, %constant_3165_1
  store double %10, ptr %parameter_buffer, align 8
  store double %multiply.11600.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %13 = load double, ptr %return_buffer, align 8
  store double %13, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.335.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.335.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.335.1.inner.loop_header.reduction_dim.0

reduce.335.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.335.1.inner.loop_header.reduction_dim.0
  %14 = load double, ptr %accumulator_0, align 8
  %add.9762.1 = fadd double %add.9759.1, %14
  %15 = load double, ptr %arg0, align 8
  %add.9763.1 = fadd double %add.9762.1, %15
  %16 = fneg double %add.9763.1
  store double %16, ptr %arg0, align 8
  br label %loop_negate_fusion.1.in_bounds-after
}

define void @loop_add_and_compare_maximum_select_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(160) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 128 dereferenceable(160) %arg14, ptr noalias align 128 dereferenceable(160) %arg15, ptr noalias align 128 dereferenceable(160) %arg16, ptr noalias align 128 dereferenceable(160) %arg17, ptr noalias align 128 dereferenceable(160) %arg18, ptr noalias align 128 dereferenceable(160) %arg19, ptr noalias align 128 dereferenceable(160) %arg20, ptr noalias align 128 dereferenceable(160) %arg21, ptr noalias align 128 dereferenceable(160) %arg22, ptr noalias align 128 dereferenceable(160) %arg23, ptr noalias align 128 dereferenceable(160) %arg24, ptr noalias align 128 dereferenceable(8) %arg25, ptr noalias align 128 dereferenceable(1) %arg26, ptr noalias align 128 dereferenceable(1) %arg27, ptr noalias align 128 dereferenceable(8) %arg28, ptr noalias align 128 dereferenceable(8) %arg29, ptr noalias align 128 dereferenceable(8) %arg30) {
entry:
  %return_buffer34 = alloca double, align 8
  %parameter_buffer33 = alloca double, align 8
  %parameter_buffer32 = alloca double, align 8
  %reduce.348.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_028 = alloca double, align 8
  %return_buffer27 = alloca double, align 8
  %parameter_buffer26 = alloca double, align 8
  %parameter_buffer25 = alloca double, align 8
  %reduce.347.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_021 = alloca double, align 8
  %return_buffer20 = alloca double, align 8
  %parameter_buffer19 = alloca double, align 8
  %parameter_buffer18 = alloca double, align 8
  %reduce.346.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_014 = alloca double, align 8
  %return_buffer13 = alloca double, align 8
  %parameter_buffer12 = alloca double, align 8
  %parameter_buffer11 = alloca double, align 8
  %reduce.345.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_08 = alloca double, align 8
  %return_buffer7 = alloca double, align 8
  %parameter_buffer6 = alloca double, align 8
  %parameter_buffer5 = alloca double, align 8
  %reduce.344.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.343.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_and_compare_maximum_select_fusion.in_bounds-true, label %loop_add_and_compare_maximum_select_fusion.in_bounds-after

loop_add_and_compare_maximum_select_fusion.in_bounds-after: ; preds = %reduce.348.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_add_and_compare_maximum_select_fusion.in_bounds-true: ; preds = %entry
  %4 = load i64, ptr %arg25, align 8, !invariant.load !349
  %constant_3083_2_clone_1 = load i64, ptr @404, align 8
  %5 = add i64 %4, %constant_3083_2_clone_1
  %constant_3082_1 = load i64, ptr @417, align 8
  %6 = icmp sge i64 %5, %constant_3082_1
  %7 = zext i1 %6 to i8
  %8 = load double, ptr %arg0, align 8, !invariant.load !349
  %9 = load double, ptr %arg1, align 8, !invariant.load !349
  %subtract.838.3 = fsub double %8, %9
  %10 = call double @llvm.fabs.f64(double %subtract.838.3)
  %constant_3128_1 = load double, ptr @413, align 8
  %compare.2693.1 = fcmp ole double %10, %constant_3128_1
  %11 = zext i1 %compare.2693.1 to i8
  %constant_3090_8 = load double, ptr @405, align 8
  store double %constant_3090_8, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.343.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.343.1.clone.1.inner.loop_header.reduction_dim.0

reduce.343.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.343.1.clone.1.inner.loop_body.reduction_dim.0, %loop_add_and_compare_maximum_select_fusion.in_bounds-true
  %reduce.343.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.343.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %12 = icmp uge i32 %reduce.343.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %12, label %reduce.343.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.343.1.clone.1.inner.loop_body.reduction_dim.0

reduce.343.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.343.1.clone.1.inner.loop_header.reduction_dim.0
  %13 = load double, ptr %accumulator_0, align 8
  %14 = getelementptr inbounds [20 x double], ptr %arg14, i32 0, i32 %reduce.343.1.clone.1.inner.indvar.reduction_dim.0
  %15 = load double, ptr %14, align 8, !invariant.load !349
  %16 = getelementptr inbounds [20 x double], ptr %arg15, i32 0, i32 %reduce.343.1.clone.1.inner.indvar.reduction_dim.0
  %17 = load double, ptr %16, align 8, !invariant.load !349
  %18 = load double, ptr %arg3, align 8, !invariant.load !349
  %19 = getelementptr inbounds [20 x double], ptr %arg13, i32 0, i32 %reduce.343.1.clone.1.inner.indvar.reduction_dim.0
  %20 = load double, ptr %19, align 8, !invariant.load !349
  %multiply.11563.13.clone.1 = fmul double %18, %20
  %add.9724.13.clone.1 = fadd double %17, %multiply.11563.13.clone.1
  %add.9728.4.clone.1 = fadd double %15, %add.9724.13.clone.1
  %21 = getelementptr inbounds [20 x double], ptr %arg13, i32 0, i32 %reduce.343.1.clone.1.inner.indvar.reduction_dim.0
  %22 = load double, ptr %21, align 8, !invariant.load !349
  %multiply.11565.3.clone.1 = fmul double %add.9728.4.clone.1, %22
  store double %13, ptr %parameter_buffer, align 8
  store double %multiply.11565.3.clone.1, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %23 = load double, ptr %return_buffer, align 8
  store double %23, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.343.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.343.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.343.1.clone.1.inner.loop_header.reduction_dim.0

reduce.343.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.343.1.clone.1.inner.loop_header.reduction_dim.0
  %24 = load double, ptr %accumulator_0, align 8
  %constant_3090_83 = load double, ptr @405, align 8
  store double %constant_3090_83, ptr %accumulator_02, align 8
  store i32 0, ptr %reduce.344.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.344.1.clone.1.inner.loop_header.reduction_dim.0

reduce.344.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.344.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.343.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.344.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.344.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %25 = icmp uge i32 %reduce.344.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %25, label %reduce.344.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.344.1.clone.1.inner.loop_body.reduction_dim.0

reduce.344.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.344.1.clone.1.inner.loop_header.reduction_dim.0
  %26 = load double, ptr %accumulator_02, align 8
  %27 = getelementptr inbounds [20 x [1 x double]], ptr %arg12, i32 0, i32 %reduce.344.1.clone.1.inner.indvar.reduction_dim.0, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !349
  %29 = getelementptr inbounds [20 x double], ptr %arg11, i32 0, i32 %reduce.344.1.clone.1.inner.indvar.reduction_dim.0
  %30 = load double, ptr %29, align 8, !invariant.load !349
  %31 = load double, ptr %arg3, align 8, !invariant.load !349
  %32 = getelementptr inbounds [20 x double], ptr %arg10, i32 0, i32 %reduce.344.1.clone.1.inner.indvar.reduction_dim.0
  %33 = load double, ptr %32, align 8, !invariant.load !349
  %multiply.11559.11.clone.1 = fmul double %31, %33
  %add.9722.11.clone.1 = fadd double %30, %multiply.11559.11.clone.1
  %constant_3091_3_clone_1 = load double, ptr @409, align 8
  %add.9730.11.clone.1 = fadd double %add.9722.11.clone.1, %constant_3091_3_clone_1
  %constant_3171_2_clone_1 = load double, ptr @408, align 8
  %multiply.11573.9.clone.1 = fmul double %add.9730.11.clone.1, %constant_3171_2_clone_1
  %add.9732.7.clone.1 = fadd double %28, %multiply.11573.9.clone.1
  %34 = getelementptr inbounds [20 x double], ptr %arg10, i32 0, i32 %reduce.344.1.clone.1.inner.indvar.reduction_dim.0
  %35 = load double, ptr %34, align 8, !invariant.load !349
  %multiply.11574.3.clone.1 = fmul double %add.9732.7.clone.1, %35
  store double %26, ptr %parameter_buffer5, align 8
  store double %multiply.11574.3.clone.1, ptr %parameter_buffer6, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer5, ptr %parameter_buffer6, ptr %return_buffer7)
  %36 = load double, ptr %return_buffer7, align 8
  store double %36, ptr %accumulator_02, align 8
  %invar.inc4 = add nuw nsw i32 %reduce.344.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.344.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.344.1.clone.1.inner.loop_header.reduction_dim.0

reduce.344.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.344.1.clone.1.inner.loop_header.reduction_dim.0
  %37 = load double, ptr %accumulator_02, align 8
  %add.9733.1.clone.1 = fadd double %24, %37
  %constant_3090_89 = load double, ptr @405, align 8
  store double %constant_3090_89, ptr %accumulator_08, align 8
  store i32 0, ptr %reduce.345.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.345.1.clone.1.inner.loop_header.reduction_dim.0

reduce.345.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.345.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.344.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.345.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.345.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %38 = icmp uge i32 %reduce.345.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %38, label %reduce.345.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.345.1.clone.1.inner.loop_body.reduction_dim.0

reduce.345.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.345.1.clone.1.inner.loop_header.reduction_dim.0
  %39 = load double, ptr %accumulator_08, align 8
  %40 = getelementptr inbounds [20 x double], ptr %arg17, i32 0, i32 %reduce.345.1.clone.1.inner.indvar.reduction_dim.0
  %41 = load double, ptr %40, align 8, !invariant.load !349
  %42 = getelementptr inbounds [20 x double], ptr %arg18, i32 0, i32 %reduce.345.1.clone.1.inner.indvar.reduction_dim.0
  %43 = load double, ptr %42, align 8, !invariant.load !349
  %44 = load double, ptr %arg3, align 8, !invariant.load !349
  %45 = getelementptr inbounds [20 x double], ptr %arg16, i32 0, i32 %reduce.345.1.clone.1.inner.indvar.reduction_dim.0
  %46 = load double, ptr %45, align 8, !invariant.load !349
  %multiply.11555.17.clone.1 = fmul double %44, %46
  %add.9717.17.clone.1 = fadd double %43, %multiply.11555.17.clone.1
  %47 = call double @__nv_exp(double %add.9717.17.clone.1)
  %multiply.11576.7.clone.1 = fmul double %41, %47
  %constant_3186_1_clone_1 = load double, ptr @411, align 8
  %add.9734.13.clone.1 = fadd double %add.9717.17.clone.1, %constant_3186_1_clone_1
  %constant_3166_2_clone_1 = load double, ptr @410, align 8
  %multiply.11577.9.clone.1 = fmul double %add.9734.13.clone.1, %constant_3166_2_clone_1
  %add.9735.7.clone.1 = fadd double %multiply.11576.7.clone.1, %multiply.11577.9.clone.1
  %48 = getelementptr inbounds [20 x double], ptr %arg16, i32 0, i32 %reduce.345.1.clone.1.inner.indvar.reduction_dim.0
  %49 = load double, ptr %48, align 8, !invariant.load !349
  %multiply.11578.3.clone.1 = fmul double %add.9735.7.clone.1, %49
  store double %39, ptr %parameter_buffer11, align 8
  store double %multiply.11578.3.clone.1, ptr %parameter_buffer12, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer11, ptr %parameter_buffer12, ptr %return_buffer13)
  %50 = load double, ptr %return_buffer13, align 8
  store double %50, ptr %accumulator_08, align 8
  %invar.inc10 = add nuw nsw i32 %reduce.345.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc10, ptr %reduce.345.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.345.1.clone.1.inner.loop_header.reduction_dim.0

reduce.345.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.345.1.clone.1.inner.loop_header.reduction_dim.0
  %51 = load double, ptr %accumulator_08, align 8
  %add.9737.1.clone.1 = fadd double %add.9733.1.clone.1, %51
  %constant_3090_815 = load double, ptr @405, align 8
  store double %constant_3090_815, ptr %accumulator_014, align 8
  store i32 0, ptr %reduce.346.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.346.1.clone.1.inner.loop_header.reduction_dim.0

reduce.346.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.346.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.345.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.346.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.346.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %52 = icmp uge i32 %reduce.346.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %52, label %reduce.346.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.346.1.clone.1.inner.loop_body.reduction_dim.0

reduce.346.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.346.1.clone.1.inner.loop_header.reduction_dim.0
  %53 = load double, ptr %accumulator_014, align 8
  %54 = getelementptr inbounds [20 x double], ptr %arg20, i32 0, i32 %reduce.346.1.clone.1.inner.indvar.reduction_dim.0
  %55 = load double, ptr %54, align 8, !invariant.load !349
  %56 = getelementptr inbounds [20 x double], ptr %arg21, i32 0, i32 %reduce.346.1.clone.1.inner.indvar.reduction_dim.0
  %57 = load double, ptr %56, align 8, !invariant.load !349
  %constant_3091_3_clone_117 = load double, ptr @409, align 8
  %add.9738.11.clone.1 = fadd double %57, %constant_3091_3_clone_117
  %add.9739.7.clone.1 = fadd double %55, %add.9738.11.clone.1
  %58 = getelementptr inbounds [20 x double], ptr %arg19, i32 0, i32 %reduce.346.1.clone.1.inner.indvar.reduction_dim.0
  %59 = load double, ptr %58, align 8, !invariant.load !349
  %multiply.11579.3.clone.1 = fmul double %add.9739.7.clone.1, %59
  store double %53, ptr %parameter_buffer18, align 8
  store double %multiply.11579.3.clone.1, ptr %parameter_buffer19, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer18, ptr %parameter_buffer19, ptr %return_buffer20)
  %60 = load double, ptr %return_buffer20, align 8
  store double %60, ptr %accumulator_014, align 8
  %invar.inc16 = add nuw nsw i32 %reduce.346.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc16, ptr %reduce.346.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.346.1.clone.1.inner.loop_header.reduction_dim.0

reduce.346.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.346.1.clone.1.inner.loop_header.reduction_dim.0
  %61 = load double, ptr %accumulator_014, align 8
  %add.9740.1.clone.1 = fadd double %add.9737.1.clone.1, %61
  %constant_3090_822 = load double, ptr @405, align 8
  store double %constant_3090_822, ptr %accumulator_021, align 8
  store i32 0, ptr %reduce.347.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.347.1.clone.1.inner.loop_header.reduction_dim.0

reduce.347.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.347.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.346.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.347.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.347.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %62 = icmp uge i32 %reduce.347.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %62, label %reduce.347.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.347.1.clone.1.inner.loop_body.reduction_dim.0

reduce.347.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.347.1.clone.1.inner.loop_header.reduction_dim.0
  %63 = load double, ptr %accumulator_021, align 8
  %64 = getelementptr inbounds [20 x double], ptr %arg23, i32 0, i32 %reduce.347.1.clone.1.inner.indvar.reduction_dim.0
  %65 = load double, ptr %64, align 8, !invariant.load !349
  %66 = getelementptr inbounds [20 x double], ptr %arg24, i32 0, i32 %reduce.347.1.clone.1.inner.indvar.reduction_dim.0
  %67 = load double, ptr %66, align 8, !invariant.load !349
  %constant_3171_2_clone_124 = load double, ptr @408, align 8
  %add.9742.11.clone.1 = fadd double %67, %constant_3171_2_clone_124
  %constant_3164_3_clone_1 = load double, ptr @406, align 8
  %multiply.11580.9.clone.1 = fmul double %add.9742.11.clone.1, %constant_3164_3_clone_1
  %add.9743.7.clone.1 = fadd double %65, %multiply.11580.9.clone.1
  %68 = getelementptr inbounds [20 x double], ptr %arg22, i32 0, i32 %reduce.347.1.clone.1.inner.indvar.reduction_dim.0
  %69 = load double, ptr %68, align 8, !invariant.load !349
  %multiply.11581.3.clone.1 = fmul double %add.9743.7.clone.1, %69
  store double %63, ptr %parameter_buffer25, align 8
  store double %multiply.11581.3.clone.1, ptr %parameter_buffer26, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer25, ptr %parameter_buffer26, ptr %return_buffer27)
  %70 = load double, ptr %return_buffer27, align 8
  store double %70, ptr %accumulator_021, align 8
  %invar.inc23 = add nuw nsw i32 %reduce.347.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc23, ptr %reduce.347.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.347.1.clone.1.inner.loop_header.reduction_dim.0

reduce.347.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.347.1.clone.1.inner.loop_header.reduction_dim.0
  %71 = load double, ptr %accumulator_021, align 8
  %add.9744.1.clone.1 = fadd double %add.9740.1.clone.1, %71
  %constant_3090_829 = load double, ptr @405, align 8
  store double %constant_3090_829, ptr %accumulator_028, align 8
  store i32 0, ptr %reduce.348.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.348.1.clone.1.inner.loop_header.reduction_dim.0

reduce.348.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.348.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.347.1.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.348.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.348.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %72 = icmp uge i32 %reduce.348.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %72, label %reduce.348.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.348.1.clone.1.inner.loop_body.reduction_dim.0

reduce.348.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.348.1.clone.1.inner.loop_header.reduction_dim.0
  %73 = load double, ptr %accumulator_028, align 8
  %74 = getelementptr inbounds [20 x double], ptr %arg8, i32 0, i32 %reduce.348.1.clone.1.inner.indvar.reduction_dim.0
  %75 = load double, ptr %74, align 8, !invariant.load !349
  %76 = getelementptr inbounds [20 x double], ptr %arg9, i32 0, i32 %reduce.348.1.clone.1.inner.indvar.reduction_dim.0
  %77 = load double, ptr %76, align 8, !invariant.load !349
  %constant_3192_1_clone_1 = load double, ptr @407, align 8
  %add.9745.11.clone.1 = fadd double %77, %constant_3192_1_clone_1
  %constant_3164_3_clone_131 = load double, ptr @406, align 8
  %multiply.11582.9.clone.1 = fmul double %add.9745.11.clone.1, %constant_3164_3_clone_131
  %add.9747.7.clone.1 = fadd double %75, %multiply.11582.9.clone.1
  %78 = getelementptr inbounds [20 x double], ptr %arg7, i32 0, i32 %reduce.348.1.clone.1.inner.indvar.reduction_dim.0
  %79 = load double, ptr %78, align 8, !invariant.load !349
  %multiply.11583.3.clone.1 = fmul double %add.9747.7.clone.1, %79
  store double %73, ptr %parameter_buffer32, align 8
  store double %multiply.11583.3.clone.1, ptr %parameter_buffer33, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer32, ptr %parameter_buffer33, ptr %return_buffer34)
  %80 = load double, ptr %return_buffer34, align 8
  store double %80, ptr %accumulator_028, align 8
  %invar.inc30 = add nuw nsw i32 %reduce.348.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc30, ptr %reduce.348.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.348.1.clone.1.inner.loop_header.reduction_dim.0

reduce.348.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.348.1.clone.1.inner.loop_header.reduction_dim.0
  %81 = load double, ptr %accumulator_028, align 8
  %add.9748.1.clone.1 = fadd double %add.9744.1.clone.1, %81
  %82 = load double, ptr %arg4, align 8, !invariant.load !349
  %constant_3086_1_clone_1 = load double, ptr @414, align 8
  %multiply.11584.1.clone.1 = fmul double %82, %constant_3086_1_clone_1
  %subtract.851.1.clone.1 = fsub double %add.9748.1.clone.1, %multiply.11584.1.clone.1
  %83 = load double, ptr %arg6, align 8, !invariant.load !349
  %84 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.853.1.clone.1 = fsub double %83, %84
  %85 = load double, ptr %arg5, align 8, !invariant.load !349
  %86 = call double @llvm.fabs.f64(double %85)
  %constant_3128_135 = load double, ptr @413, align 8
  %multiply.11601.1.clone.1 = fmul double %86, %constant_3128_135
  %subtract.854.1.clone.1 = fsub double %subtract.853.1.clone.1, %multiply.11601.1.clone.1
  %87 = fcmp une double %subtract.851.1.clone.1, %subtract.851.1.clone.1
  %88 = fcmp oeq double %subtract.854.1.clone.1, %subtract.854.1.clone.1
  %89 = fcmp oge double %subtract.851.1.clone.1, %subtract.854.1.clone.1
  %90 = and i1 %88, %89
  %91 = or i1 %87, %90
  %maximum.67.1.clone.1 = select i1 %91, double %subtract.851.1.clone.1, double %subtract.854.1.clone.1
  %92 = load double, ptr %arg3, align 8, !invariant.load !349
  %constant_3087_1_clone_1 = load double, ptr @412, align 8
  %multiply.11602.1.clone.1 = fmul double %92, %constant_3087_1_clone_1
  %93 = load double, ptr %arg4, align 8, !invariant.load !349
  %multiply.11603.1.clone.1 = fmul double %multiply.11602.1.clone.1, %93
  %subtract.855.1.clone.1 = fsub double %subtract.853.1.clone.1, %multiply.11603.1.clone.1
  %94 = fcmp une double %maximum.67.1.clone.1, %maximum.67.1.clone.1
  %95 = fcmp oeq double %subtract.855.1.clone.1, %subtract.855.1.clone.1
  %96 = fcmp ole double %maximum.67.1.clone.1, %subtract.855.1.clone.1
  %97 = and i1 %95, %96
  %98 = or i1 %94, %97
  %minimum.26.1.clone.1 = select i1 %98, double %maximum.67.1.clone.1, double %subtract.855.1.clone.1
  %constant_3090_836 = load double, ptr @405, align 8
  %99 = fcmp une double %minimum.26.1.clone.1, %minimum.26.1.clone.1
  %100 = fcmp oeq double %constant_3090_836, %constant_3090_836
  %101 = fcmp oge double %minimum.26.1.clone.1, %constant_3090_836
  %102 = and i1 %100, %101
  %103 = or i1 %99, %102
  %maximum.68.1.clone.1 = select i1 %103, double %minimum.26.1.clone.1, double %constant_3090_836
  %compare.2689.1.clone.1 = fcmp une double %maximum.68.1.clone.1, %maximum.68.1.clone.1
  %104 = zext i1 %compare.2689.1.clone.1 to i8
  %constant_3085_1_clone_1 = load double, ptr @415, align 8
  %105 = trunc i8 %104 to i1
  %106 = select i1 %105, double %constant_3085_1_clone_1, double %maximum.68.1.clone.1
  %constant_3090_837 = load double, ptr @405, align 8
  %compare.2694.1.clone.1 = fcmp ole double %106, %constant_3090_837
  %107 = zext i1 %compare.2694.1.clone.1 to i8
  %108 = load double, ptr %arg3, align 8, !invariant.load !349
  %109 = load double, ptr %arg2, align 8
  %110 = trunc i8 %107 to i1
  %111 = select i1 %110, double %108, double %109
  %112 = load double, ptr %arg2, align 8
  %113 = fcmp une double %111, %111
  %114 = fcmp oeq double %112, %112
  %115 = fcmp oge double %111, %112
  %116 = and i1 %114, %115
  %117 = or i1 %113, %116
  %maximum.71.1.clone.1 = select i1 %117, double %111, double %112
  %constant_3090_838 = load double, ptr @405, align 8
  %compare.2695.1 = fcmp ogt double %maximum.71.1.clone.1, %constant_3090_838
  %118 = zext i1 %compare.2695.1 to i8
  %119 = and i8 %11, %118
  %120 = or i8 %7, %119
  %121 = call double @llvm.fabs.f64(double %add.9748.1.clone.1)
  %122 = load double, ptr %arg4, align 8, !invariant.load !349
  %123 = call double @llvm.fabs.f64(double %122)
  %constant_3084_1_clone_1 = load double, ptr @416, align 8
  %multiply.11604.1.clone.1 = fmul double %123, %constant_3084_1_clone_1
  %subtract.856.1.clone.1 = fsub double %121, %multiply.11604.1.clone.1
  %constant_3090_839 = load double, ptr @405, align 8
  %124 = fcmp une double %subtract.856.1.clone.1, %subtract.856.1.clone.1
  %125 = fcmp oeq double %constant_3090_839, %constant_3090_839
  %126 = fcmp oge double %subtract.856.1.clone.1, %constant_3090_839
  %127 = and i1 %125, %126
  %128 = or i1 %124, %127
  %maximum.69.1.clone.1 = select i1 %128, double %subtract.856.1.clone.1, double %constant_3090_839
  %compare.2690.1.clone.1 = fcmp une double %maximum.69.1.clone.1, %maximum.69.1.clone.1
  %129 = zext i1 %compare.2690.1.clone.1 to i8
  %constant_3085_1_clone_140 = load double, ptr @415, align 8
  %130 = trunc i8 %129 to i1
  %131 = select i1 %130, double %constant_3085_1_clone_140, double %maximum.69.1.clone.1
  %132 = fcmp une double %106, %106
  %133 = fcmp oeq double %131, %131
  %134 = fcmp oge double %106, %131
  %135 = and i1 %133, %134
  %136 = or i1 %132, %135
  %maximum.70.1.clone.1 = select i1 %136, double %106, double %131
  %constant_3090_841 = load double, ptr @405, align 8
  %compare.2691.1.clone.1 = fcmp ole double %maximum.70.1.clone.1, %constant_3090_841
  %137 = zext i1 %compare.2691.1.clone.1 to i8
  %138 = trunc i8 %137 to i1
  %139 = xor i1 %138, true
  %140 = zext i1 %139 to i8
  %141 = and i8 %120, %140
  %142 = insertvalue { i8, double, i8, double, double, i64 } undef, i8 %141, 0
  %143 = insertvalue { i8, double, i8, double, double, i64 } %142, double %maximum.71.1.clone.1, 1
  %144 = insertvalue { i8, double, i8, double, double, i64 } %143, i8 %137, 2
  %145 = insertvalue { i8, double, i8, double, double, i64 } %144, double %106, 3
  %146 = insertvalue { i8, double, i8, double, double, i64 } %145, double %add.9748.1.clone.1, 4
  %147 = load i64, ptr %arg25, align 8, !invariant.load !349
  %constant_3083_2_clone_142 = load i64, ptr @404, align 8
  %148 = add i64 %147, %constant_3083_2_clone_142
  %149 = insertvalue { i8, double, i8, double, double, i64 } %146, i64 %148, 5
  %150 = extractvalue { i8, double, i8, double, double, i64 } %149, 0
  store i8 %150, ptr %arg26, align 1
  %151 = extractvalue { i8, double, i8, double, double, i64 } %149, 1
  store double %151, ptr %arg2, align 8
  %152 = extractvalue { i8, double, i8, double, double, i64 } %149, 2
  store i8 %152, ptr %arg27, align 1
  %153 = extractvalue { i8, double, i8, double, double, i64 } %149, 3
  store double %153, ptr %arg28, align 8
  %154 = extractvalue { i8, double, i8, double, double, i64 } %149, 4
  store double %154, ptr %arg29, align 8
  %155 = extractvalue { i8, double, i8, double, double, i64 } %149, 5
  store i64 %155, ptr %arg30, align 8
  br label %loop_add_and_compare_maximum_select_fusion.in_bounds-after
}

define void @loop_select_fusion_23(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.23.in_bounds-true, label %loop_select_fusion.23.in_bounds-after

loop_select_fusion.23.in_bounds-after:            ; preds = %loop_select_fusion.23.in_bounds-true, %entry
  ret void

loop_select_fusion.23.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg6, align 8, !invariant.load !349
  %constant_3090_12 = load double, ptr @418, align 8
  %compare.2696.9 = fcmp ogt double %4, %constant_3090_12
  %5 = zext i1 %compare.2696.9 to i8
  %6 = load double, ptr %arg5, align 8, !invariant.load !349
  %7 = load double, ptr %arg1, align 8, !invariant.load !349
  %compare.2697.9 = fcmp oge double %6, %7
  %8 = zext i1 %compare.2697.9 to i8
  %9 = or i8 %5, %8
  %10 = load double, ptr %arg2, align 8, !invariant.load !349
  %11 = load double, ptr %arg3, align 8, !invariant.load !349
  %12 = load double, ptr %arg4, align 8, !invariant.load !349
  %subtract.838.15 = fsub double %11, %12
  %multiply.11605.11 = fmul double %10, %subtract.838.15
  %constant_3090_121 = load double, ptr @418, align 8
  %compare.2698.11 = fcmp oge double %multiply.11605.11, %constant_3090_121
  %13 = zext i1 %compare.2698.11 to i8
  %14 = trunc i8 %9 to i1
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i8
  %17 = and i8 %13, %16
  %18 = or i8 %9, %17
  %19 = load double, ptr %arg0, align 8, !invariant.load !349
  %20 = load double, ptr %arg1, align 8, !invariant.load !349
  %21 = trunc i8 %18 to i1
  %22 = select i1 %21, double %19, double %20
  store double %22, ptr %arg7, align 8
  br label %loop_select_fusion.23.in_bounds-after
}

define void @loop_select_fusion_24(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.24.in_bounds-true, label %loop_select_fusion.24.in_bounds-after

loop_select_fusion.24.in_bounds-after:            ; preds = %loop_select_fusion.24.in_bounds-true, %entry
  ret void

loop_select_fusion.24.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg5, align 8, !invariant.load !349
  %constant_3090_34 = load double, ptr @419, align 8
  %compare.2696.17 = fcmp ogt double %4, %constant_3090_34
  %5 = zext i1 %compare.2696.17 to i8
  %6 = load double, ptr %arg3, align 8, !invariant.load !349
  %7 = load double, ptr %arg4, align 8, !invariant.load !349
  %compare.2697.17 = fcmp oge double %6, %7
  %8 = zext i1 %compare.2697.17 to i8
  %9 = or i8 %5, %8
  %10 = load double, ptr %arg2, align 8, !invariant.load !349
  %11 = load double, ptr %arg0, align 8, !invariant.load !349
  %12 = load double, ptr %arg1, align 8, !invariant.load !349
  %subtract.838.13 = fsub double %11, %12
  %multiply.11605.9 = fmul double %10, %subtract.838.13
  %constant_3090_341 = load double, ptr @419, align 8
  %compare.2698.9 = fcmp oge double %multiply.11605.9, %constant_3090_341
  %13 = zext i1 %compare.2698.9 to i8
  %14 = trunc i8 %9 to i1
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i8
  %17 = and i8 %13, %16
  %18 = or i8 %9, %17
  %19 = load double, ptr %arg0, align 8, !invariant.load !349
  %20 = load double, ptr %arg1, align 8, !invariant.load !349
  %21 = trunc i8 %18 to i1
  %22 = select i1 %21, double %19, double %20
  store double %22, ptr %arg6, align 8
  br label %loop_select_fusion.24.in_bounds-after
}

define void @loop_select_fusion_13(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.13.in_bounds-true, label %loop_select_fusion.13.in_bounds-after

loop_select_fusion.13.in_bounds-after:            ; preds = %loop_select_fusion.13.in_bounds-true, %entry
  ret void

loop_select_fusion.13.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg1, align 8, !invariant.load !349
  %5 = load double, ptr %arg3, align 8, !invariant.load !349
  %6 = load double, ptr %arg4, align 8, !invariant.load !349
  %subtract.838.11 = fsub double %5, %6
  %multiply.11605.7 = fmul double %4, %subtract.838.11
  %constant_3090_33 = load double, ptr @420, align 8
  %compare.2698.7 = fcmp oge double %multiply.11605.7, %constant_3090_33
  %7 = zext i1 %compare.2698.7 to i8
  %8 = load double, ptr %arg7, align 8, !invariant.load !349
  %constant_3090_331 = load double, ptr @420, align 8
  %compare.2696.15 = fcmp ogt double %8, %constant_3090_331
  %9 = zext i1 %compare.2696.15 to i8
  %10 = load double, ptr %arg5, align 8, !invariant.load !349
  %11 = load double, ptr %arg6, align 8, !invariant.load !349
  %compare.2697.15 = fcmp oge double %10, %11
  %12 = zext i1 %compare.2697.15 to i8
  %13 = or i8 %9, %12
  %14 = trunc i8 %13 to i1
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i8
  %17 = and i8 %7, %16
  %18 = load double, ptr %arg0, align 8, !invariant.load !349
  %19 = load double, ptr %arg1, align 8, !invariant.load !349
  %20 = load double, ptr %arg2, align 8
  %21 = trunc i8 %13 to i1
  %22 = select i1 %21, double %19, double %20
  %23 = trunc i8 %17 to i1
  %24 = select i1 %23, double %18, double %22
  store double %24, ptr %arg2, align 8
  br label %loop_select_fusion.13.in_bounds-after
}

define void @loop_select_fusion_14(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.14.in_bounds-true, label %loop_select_fusion.14.in_bounds-after

loop_select_fusion.14.in_bounds-after:            ; preds = %loop_select_fusion.14.in_bounds-true, %entry
  ret void

loop_select_fusion.14.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg3, align 8, !invariant.load !349
  %5 = load double, ptr %arg4, align 8, !invariant.load !349
  %6 = load double, ptr %arg5, align 8, !invariant.load !349
  %subtract.838.7 = fsub double %5, %6
  %multiply.11605.3 = fmul double %4, %subtract.838.7
  %constant_3090_31 = load double, ptr @421, align 8
  %compare.2698.3 = fcmp oge double %multiply.11605.3, %constant_3090_31
  %7 = zext i1 %compare.2698.3 to i8
  %8 = load double, ptr %arg6, align 8, !invariant.load !349
  %constant_3090_311 = load double, ptr @421, align 8
  %compare.2696.13 = fcmp ogt double %8, %constant_3090_311
  %9 = zext i1 %compare.2696.13 to i8
  %10 = load double, ptr %arg1, align 8, !invariant.load !349
  %11 = load double, ptr %arg0, align 8, !invariant.load !349
  %compare.2697.13 = fcmp oge double %10, %11
  %12 = zext i1 %compare.2697.13 to i8
  %13 = or i8 %9, %12
  %14 = trunc i8 %13 to i1
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i8
  %17 = and i8 %7, %16
  %18 = load double, ptr %arg0, align 8, !invariant.load !349
  %19 = load double, ptr %arg1, align 8, !invariant.load !349
  %20 = load double, ptr %arg2, align 8, !invariant.load !349
  %21 = trunc i8 %13 to i1
  %22 = select i1 %21, double %19, double %20
  %23 = trunc i8 %17 to i1
  %24 = select i1 %23, double %18, double %22
  store double %24, ptr %arg7, align 8
  br label %loop_select_fusion.14.in_bounds-after
}

define void @loop_select_fusion_15(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.15.in_bounds-true, label %loop_select_fusion.15.in_bounds-after

loop_select_fusion.15.in_bounds-after:            ; preds = %loop_select_fusion.15.in_bounds-true, %entry
  ret void

loop_select_fusion.15.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg3, align 8, !invariant.load !349
  %5 = load double, ptr %arg2, align 8, !invariant.load !349
  %6 = load double, ptr %arg0, align 8, !invariant.load !349
  %subtract.838.9 = fsub double %5, %6
  %multiply.11605.5 = fmul double %4, %subtract.838.9
  %constant_3090_32 = load double, ptr @422, align 8
  %compare.2698.5 = fcmp oge double %multiply.11605.5, %constant_3090_32
  %7 = zext i1 %compare.2698.5 to i8
  %8 = load double, ptr %arg6, align 8, !invariant.load !349
  %constant_3090_321 = load double, ptr @422, align 8
  %compare.2696.11 = fcmp ogt double %8, %constant_3090_321
  %9 = zext i1 %compare.2696.11 to i8
  %10 = load double, ptr %arg4, align 8, !invariant.load !349
  %11 = load double, ptr %arg5, align 8, !invariant.load !349
  %compare.2697.11 = fcmp oge double %10, %11
  %12 = zext i1 %compare.2697.11 to i8
  %13 = or i8 %9, %12
  %14 = trunc i8 %13 to i1
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i8
  %17 = and i8 %7, %16
  %18 = load double, ptr %arg0, align 8, !invariant.load !349
  %19 = load double, ptr %arg1, align 8, !invariant.load !349
  %20 = load double, ptr %arg2, align 8, !invariant.load !349
  %21 = trunc i8 %13 to i1
  %22 = select i1 %21, double %19, double %20
  %23 = trunc i8 %17 to i1
  %24 = select i1 %23, double %18, double %22
  store double %24, ptr %arg7, align 8
  br label %loop_select_fusion.15.in_bounds-after
}

define void @loop_select_fusion_27(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.27.in_bounds-true, label %loop_select_fusion.27.in_bounds-after

loop_select_fusion.27.in_bounds-after:            ; preds = %loop_select_fusion.27.in_bounds-true, %entry
  ret void

loop_select_fusion.27.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg4, align 8, !invariant.load !349
  %constant_3090_10 = load double, ptr @423, align 8
  %compare.2696.7 = fcmp ogt double %4, %constant_3090_10
  %5 = zext i1 %compare.2696.7 to i8
  %6 = load double, ptr %arg2, align 8, !invariant.load !349
  %7 = load double, ptr %arg3, align 8, !invariant.load !349
  %compare.2697.7 = fcmp oge double %6, %7
  %8 = zext i1 %compare.2697.7 to i8
  %9 = or i8 %5, %8
  %10 = load double, ptr %arg0, align 8, !invariant.load !349
  %11 = load double, ptr %arg1, align 8, !invariant.load !349
  %12 = trunc i8 %9 to i1
  %13 = select i1 %12, double %10, double %11
  store double %13, ptr %arg5, align 8
  br label %loop_select_fusion.27.in_bounds-after
}

define void @loop_select_fusion_25(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.25.in_bounds-true, label %loop_select_fusion.25.in_bounds-after

loop_select_fusion.25.in_bounds-after:            ; preds = %loop_select_fusion.25.in_bounds-true, %entry
  ret void

loop_select_fusion.25.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg2, align 8, !invariant.load !349
  %constant_3090_35 = load double, ptr @424, align 8
  %compare.2696.3 = fcmp ogt double %4, %constant_3090_35
  %5 = zext i1 %compare.2696.3 to i8
  %6 = load double, ptr %arg1, align 8, !invariant.load !349
  %7 = load double, ptr %arg0, align 8, !invariant.load !349
  %compare.2697.3 = fcmp oge double %6, %7
  %8 = zext i1 %compare.2697.3 to i8
  %9 = or i8 %5, %8
  %10 = load double, ptr %arg0, align 8, !invariant.load !349
  %11 = load double, ptr %arg1, align 8, !invariant.load !349
  %12 = trunc i8 %9 to i1
  %13 = select i1 %12, double %10, double %11
  store double %13, ptr %arg3, align 8
  br label %loop_select_fusion.25.in_bounds-after
}

define void @loop_add_convert_fusion(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_convert_fusion.in_bounds-true, label %loop_add_convert_fusion.in_bounds-after

loop_add_convert_fusion.in_bounds-after:          ; preds = %loop_add_convert_fusion.in_bounds-true, %entry
  ret void

loop_add_convert_fusion.in_bounds-true:           ; preds = %entry
  %4 = load i32, ptr %arg0, align 4
  %constant_2021_2 = load i32, ptr @425, align 4
  %5 = add i32 %4, %constant_2021_2
  %6 = load i8, ptr %arg1, align 1, !invariant.load !349
  %7 = zext i8 %6 to i32
  %8 = add i32 %5, %7
  %9 = insertvalue { i32, i32 } undef, i32 %8, 0
  %10 = insertvalue { i32, i32 } %9, i32 %7, 1
  %11 = extractvalue { i32, i32 } %10, 0
  store i32 %11, ptr %arg0, align 4
  %12 = extractvalue { i32, i32 } %10, 1
  store i32 %12, ptr %arg2, align 4
  br label %loop_add_convert_fusion.in_bounds-after
}

define void @loop_add_fusion_29(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(4) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.29.in_bounds-true, label %loop_add_fusion.29.in_bounds-after

loop_add_fusion.29.in_bounds-after:               ; preds = %loop_add_fusion.29.in_bounds-true, %entry
  ret void

loop_add_fusion.29.in_bounds-true:                ; preds = %entry
  %4 = load i32, ptr %arg1, align 4
  %constant_2021_1 = load i32, ptr @426, align 4
  %5 = add i32 %4, %constant_2021_1
  %6 = load i32, ptr %arg0, align 4, !invariant.load !349
  %7 = add i32 %5, %6
  store i32 %7, ptr %arg1, align 4
  br label %loop_add_fusion.29.in_bounds-after
}

define void @loop_select_fusion_28(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.28.in_bounds-true, label %loop_select_fusion.28.in_bounds-after

loop_select_fusion.28.in_bounds-after:            ; preds = %loop_select_fusion.28.in_bounds-true, %entry
  ret void

loop_select_fusion.28.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_23818_1 = load double, ptr @428, align 8
  %compare.2714.1 = fcmp ogt double %4, %constant_23818_1
  %5 = zext i1 %compare.2714.1 to i8
  %6 = load double, ptr %arg2, align 8, !invariant.load !349
  %7 = call double @llvm.fabs.f64(double %6)
  %constant_1240_1 = load double, ptr @427, align 8
  %compare.2715.1 = fcmp oeq double %7, %constant_1240_1
  %8 = zext i1 %compare.2715.1 to i8
  %9 = or i8 %5, %8
  %10 = load double, ptr %arg0, align 8, !invariant.load !349
  %11 = load double, ptr %arg1, align 8
  %12 = trunc i8 %9 to i1
  %13 = select i1 %12, double %10, double %11
  store double %13, ptr %arg1, align 8
  br label %loop_select_fusion.28.in_bounds-after
}

define void @loop_add_fusion_24(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_fusion.24.in_bounds-true, label %loop_add_fusion.24.in_bounds-after

loop_add_fusion.24.in_bounds-after:               ; preds = %loop_add_fusion.24.in_bounds-true, %entry
  ret void

loop_add_fusion.24.in_bounds-true:                ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8
  %8 = load double, ptr %arg2, align 8, !invariant.load !349
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !349
  %multiply.11713.1 = fmul double %8, %11
  %add.9877.1 = fadd double %7, %multiply.11713.1
  %12 = getelementptr double, ptr %arg0, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  store double %add.9877.1, ptr %13, align 8
  br label %loop_add_fusion.24.in_bounds-after
}

define void @loop_add_reduce_fusion_2(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(30720) %arg5, ptr noalias align 128 dereferenceable(30720) %arg6) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer9 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %pad_result_addr = alloca double, align 8
  %reduce.396.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !355
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !356
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_add_reduce_fusion.2.in_bounds-true, label %loop_add_reduce_fusion.2.in_bounds-after

loop_add_reduce_fusion.2.in_bounds-after:         ; preds = %reduce.396.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_add_reduce_fusion.2.in_bounds-true:          ; preds = %entry
  %constant_1252_1 = load double, ptr @432, align 8
  store double %constant_1252_1, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.396.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.396.1.inner.loop_header.reduction_dim.0

reduce.396.1.inner.loop_header.reduction_dim.0:   ; preds = %in_bounds-after, %loop_add_reduce_fusion.2.in_bounds-true
  %reduce.396.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.396.1.inner.invar_address.reduction_dim.0, align 4
  %7 = icmp uge i32 %reduce.396.1.inner.indvar.reduction_dim.0, 2
  br i1 %7, label %reduce.396.1.inner.loop_exit.reduction_dim.0, label %reduce.396.1.inner.loop_body.reduction_dim.0

reduce.396.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.396.1.inner.loop_header.reduction_dim.0
  %8 = load double, ptr %accumulator_0, align 8
  %9 = sub i32 %reduce.396.1.inner.indvar.reduction_dim.0, 1
  %10 = icmp sge i32 %9, 0
  %in_bounds = and i1 true, %10
  %11 = urem i32 %9, 1
  %12 = icmp eq i32 0, %11
  %in_bounds1 = and i1 %in_bounds, %12
  %13 = sdiv i32 %9, 1
  %14 = icmp slt i32 %13, 1
  %in_bounds2 = and i1 %in_bounds1, %14
  %15 = sub i32 %5, 0
  %16 = icmp sge i32 %15, 0
  %in_bounds3 = and i1 %in_bounds2, %16
  %17 = urem i32 %15, 1
  %18 = icmp eq i32 0, %17
  %in_bounds4 = and i1 %in_bounds3, %18
  %19 = sdiv i32 %15, 1
  %20 = icmp slt i32 %19, 192
  %in_bounds5 = and i1 %in_bounds4, %20
  %21 = sub i32 %4, 0
  %22 = icmp sge i32 %21, 0
  %in_bounds6 = and i1 %in_bounds5, %22
  %23 = urem i32 %21, 1
  %24 = icmp eq i32 0, %23
  %in_bounds7 = and i1 %in_bounds6, %24
  %25 = sdiv i32 %21, 1
  %26 = icmp slt i32 %25, 20
  %in_bounds8 = and i1 %in_bounds7, %26
  br i1 %in_bounds8, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %27 = load double, ptr %pad_result_addr, align 8
  store double %8, ptr %parameter_buffer, align 8
  store double %27, ptr %parameter_buffer9, align 8
  call void @region_26_5046_5601069b0470_33d48f6bb7324218(ptr %parameter_buffer, ptr %parameter_buffer9, ptr %return_buffer)
  %28 = load double, ptr %return_buffer, align 8
  store double %28, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.396.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.396.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.396.1.inner.loop_header.reduction_dim.0

reduce.396.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.396.1.inner.loop_header.reduction_dim.0
  %29 = load double, ptr %accumulator_0, align 8
  %30 = insertvalue { double, double } undef, double %29, 0
  %31 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %4
  %32 = load double, ptr %31, align 8, !invariant.load !349
  %33 = call double @__nv_exp(double %32)
  %constant_23829_4_clone_110 = load double, ptr @429, align 8
  %constant_23832_2_clone_111 = load double, ptr @431, align 8
  %34 = getelementptr double, ptr %arg3, i32 %linear_index
  %35 = getelementptr inbounds double, ptr %34, i32 0
  %36 = load double, ptr %35, align 8, !invariant.load !349
  %constant_23831_2_clone_112 = load double, ptr @430, align 8
  %37 = fcmp une double %constant_23832_2_clone_111, %constant_23832_2_clone_111
  %38 = fcmp oeq double %36, %36
  %39 = fcmp oge double %constant_23832_2_clone_111, %36
  %40 = and i1 %38, %39
  %41 = or i1 %37, %40
  %42 = select i1 %41, double %constant_23832_2_clone_111, double %36
  %43 = fcmp une double %constant_23831_2_clone_112, %constant_23831_2_clone_112
  %44 = fcmp oeq double %42, %42
  %45 = fcmp ole double %constant_23831_2_clone_112, %42
  %46 = and i1 %44, %45
  %47 = or i1 %43, %46
  %48 = select i1 %47, double %constant_23831_2_clone_112, double %42
  %49 = fneg double %48
  %50 = call double @__nv_exp(double %49)
  %add.9900.5.clone.113 = fadd double %50, %constant_23829_4_clone_110
  %divide.2536.5.clone.114 = fdiv double %constant_23829_4_clone_110, %add.9900.5.clone.113
  %subtract.863.3.clone.115 = fsub double %constant_23829_4_clone_110, %divide.2536.5.clone.114
  %51 = getelementptr double, ptr %arg2, i32 %linear_index
  %52 = getelementptr inbounds double, ptr %51, i32 0
  %53 = load double, ptr %52, align 8, !invariant.load !349
  %multiply.11732.1.clone.116 = fmul double %subtract.863.3.clone.115, %53
  %54 = getelementptr double, ptr %arg1, i32 %linear_index
  %55 = getelementptr inbounds double, ptr %54, i32 0
  %56 = load double, ptr %55, align 8, !invariant.load !349
  %multiply.11733.1.clone.117 = fmul double %divide.2536.5.clone.114, %56
  %subtract.864.2.clone.118 = fsub double %multiply.11732.1.clone.116, %multiply.11733.1.clone.117
  %multiply.11734.3.clone.119 = fmul double %33, %subtract.864.2.clone.118
  %57 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %4
  %58 = load double, ptr %57, align 8, !invariant.load !349
  %add.9902.1.clone.120 = fadd double %multiply.11734.3.clone.119, %58
  %59 = insertvalue { double, double } %30, double %add.9902.1.clone.120, 1
  %60 = extractvalue { double, double } %59, 0
  %61 = getelementptr double, ptr %arg5, i32 %linear_index
  %62 = getelementptr inbounds double, ptr %61, i32 0
  store double %60, ptr %62, align 8
  %63 = extractvalue { double, double } %59, 1
  %64 = getelementptr double, ptr %arg6, i32 %linear_index
  %65 = getelementptr inbounds double, ptr %64, i32 0
  store double %63, ptr %65, align 8
  br label %loop_add_reduce_fusion.2.in_bounds-after

in_bounds-true:                                   ; preds = %reduce.396.1.inner.loop_body.reduction_dim.0
  %66 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %25
  %67 = load double, ptr %66, align 8, !invariant.load !349
  %68 = call double @__nv_exp(double %67)
  %constant_23829_4_clone_1 = load double, ptr @429, align 8
  %constant_23832_2_clone_1 = load double, ptr @431, align 8
  %69 = getelementptr inbounds [192 x [20 x double]], ptr %arg3, i32 0, i32 %19, i32 %25
  %70 = load double, ptr %69, align 8, !invariant.load !349
  %constant_23831_2_clone_1 = load double, ptr @430, align 8
  %71 = fcmp une double %constant_23832_2_clone_1, %constant_23832_2_clone_1
  %72 = fcmp oeq double %70, %70
  %73 = fcmp oge double %constant_23832_2_clone_1, %70
  %74 = and i1 %72, %73
  %75 = or i1 %71, %74
  %76 = select i1 %75, double %constant_23832_2_clone_1, double %70
  %77 = fcmp une double %constant_23831_2_clone_1, %constant_23831_2_clone_1
  %78 = fcmp oeq double %76, %76
  %79 = fcmp ole double %constant_23831_2_clone_1, %76
  %80 = and i1 %78, %79
  %81 = or i1 %77, %80
  %82 = select i1 %81, double %constant_23831_2_clone_1, double %76
  %83 = fneg double %82
  %84 = call double @__nv_exp(double %83)
  %add.9900.5.clone.1 = fadd double %84, %constant_23829_4_clone_1
  %divide.2536.5.clone.1 = fdiv double %constant_23829_4_clone_1, %add.9900.5.clone.1
  %subtract.863.3.clone.1 = fsub double %constant_23829_4_clone_1, %divide.2536.5.clone.1
  %85 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %19, i32 %25
  %86 = load double, ptr %85, align 8, !invariant.load !349
  %multiply.11732.1.clone.1 = fmul double %subtract.863.3.clone.1, %86
  %87 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %19, i32 %25
  %88 = load double, ptr %87, align 8, !invariant.load !349
  %multiply.11733.1.clone.1 = fmul double %divide.2536.5.clone.1, %88
  %subtract.864.2.clone.1 = fsub double %multiply.11732.1.clone.1, %multiply.11733.1.clone.1
  %multiply.11734.3.clone.1 = fmul double %68, %subtract.864.2.clone.1
  %89 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %25
  %90 = load double, ptr %89, align 8, !invariant.load !349
  %add.9902.1.clone.1 = fadd double %multiply.11734.3.clone.1, %90
  store double %add.9902.1.clone.1, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %reduce.396.1.inner.loop_body.reduction_dim.0
  %constant_23818_16 = load double, ptr @433, align 8
  store double %constant_23818_16, ptr %pad_result_addr, align 8
  br label %in_bounds-after
}

define void @loop_select_slice_fusion_2(ptr noalias align 128 dereferenceable(61440) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(24) %arg3, ptr noalias align 128 dereferenceable(46080) %arg4, ptr noalias align 128 dereferenceable(30720) %arg5, ptr noalias align 128 dereferenceable(30720) %arg6) {
entry:
  %return_buffer77 = alloca double, align 8
  %parameter_buffer76 = alloca double, align 8
  %parameter_buffer75 = alloca double, align 8
  %pad_result_addr69 = alloca double, align 8
  %reduce.397.4.inner.invar_address.reduction_dim.057 = alloca i32, align 4
  %accumulator_052 = alloca double, align 8
  %pad_result_addr46 = alloca double, align 8
  %return_buffer36 = alloca i8, align 1
  %parameter_buffer35 = alloca i8, align 1
  %parameter_buffer34 = alloca i8, align 1
  %reduce.368.3.clone.1.inner.invar_address.reduction_dim.2 = alloca i32, align 4
  %accumulator_032 = alloca i8, align 1
  %pad_result_addr26 = alloca double, align 8
  %return_buffer16 = alloca double, align 8
  %parameter_buffer15 = alloca double, align 8
  %parameter_buffer14 = alloca double, align 8
  %pad_result_addr = alloca double, align 8
  %reduce.397.4.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.398.5.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !355
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !356
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 3840
  %8 = icmp ult i32 %linear_index, 3840
  br i1 %8, label %loop_select_slice_fusion.2.in_bounds-true, label %loop_select_slice_fusion.2.in_bounds-after

loop_select_slice_fusion.2.in_bounds-after:       ; preds = %reduce.397.4.inner.loop_exit.reduction_dim.054, %entry
  ret void

loop_select_slice_fusion.2.in_bounds-true:        ; preds = %entry
  %9 = add i32 %7, 1
  %10 = add i32 %6, 0
  %11 = add i32 %4, 0
  %12 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %11, i32 %10, i32 %9
  %13 = load double, ptr %12, align 8, !invariant.load !349
  %constant_23818_13 = load double, ptr @435, align 8
  store double %constant_23818_13, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.398.5.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.398.5.inner.loop_header.reduction_dim.0

reduce.398.5.inner.loop_header.reduction_dim.0:   ; preds = %reduce.398.5.inner.loop_body.reduction_dim.0, %loop_select_slice_fusion.2.in_bounds-true
  %reduce.398.5.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.398.5.inner.invar_address.reduction_dim.0, align 4
  %14 = icmp uge i32 %reduce.398.5.inner.indvar.reduction_dim.0, 2
  br i1 %14, label %reduce.398.5.inner.loop_exit.reduction_dim.0, label %reduce.398.5.inner.loop_body.reduction_dim.0

reduce.398.5.inner.loop_body.reduction_dim.0:     ; preds = %reduce.398.5.inner.loop_header.reduction_dim.0
  %15 = load double, ptr %accumulator_0, align 8
  %16 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %11, i32 %10, i32 %reduce.398.5.inner.indvar.reduction_dim.0
  %17 = load double, ptr %16, align 8, !invariant.load !349
  store double %15, ptr %parameter_buffer, align 8
  store double %17, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %18 = load double, ptr %return_buffer, align 8
  store double %18, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.398.5.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.398.5.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.398.5.inner.loop_header.reduction_dim.0

reduce.398.5.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.398.5.inner.loop_header.reduction_dim.0
  %19 = load double, ptr %accumulator_0, align 8
  %20 = fneg double %19
  %constant_23818_133 = load double, ptr @435, align 8
  store double %constant_23818_133, ptr %accumulator_02, align 8
  store i32 0, ptr %reduce.397.4.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.397.4.inner.loop_header.reduction_dim.0

reduce.397.4.inner.loop_header.reduction_dim.0:   ; preds = %in_bounds-after, %reduce.398.5.inner.loop_exit.reduction_dim.0
  %reduce.397.4.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.397.4.inner.invar_address.reduction_dim.0, align 4
  %21 = icmp uge i32 %reduce.397.4.inner.indvar.reduction_dim.0, 2
  br i1 %21, label %reduce.397.4.inner.loop_exit.reduction_dim.0, label %reduce.397.4.inner.loop_body.reduction_dim.0

reduce.397.4.inner.loop_body.reduction_dim.0:     ; preds = %reduce.397.4.inner.loop_header.reduction_dim.0
  %22 = load double, ptr %accumulator_02, align 8
  %23 = sub i32 %reduce.397.4.inner.indvar.reduction_dim.0, 1
  %24 = icmp sge i32 %23, 0
  %in_bounds = and i1 true, %24
  %25 = urem i32 %23, 1
  %26 = icmp eq i32 0, %25
  %in_bounds5 = and i1 %in_bounds, %26
  %27 = sdiv i32 %23, 1
  %28 = icmp slt i32 %27, 1
  %in_bounds6 = and i1 %in_bounds5, %28
  %29 = sub i32 %10, 0
  %30 = icmp sge i32 %29, 0
  %in_bounds7 = and i1 %in_bounds6, %30
  %31 = urem i32 %29, 1
  %32 = icmp eq i32 0, %31
  %in_bounds8 = and i1 %in_bounds7, %32
  %33 = sdiv i32 %29, 1
  %34 = icmp slt i32 %33, 192
  %in_bounds9 = and i1 %in_bounds8, %34
  %35 = sub i32 %11, 0
  %36 = icmp sge i32 %35, 0
  %in_bounds10 = and i1 %in_bounds9, %36
  %37 = urem i32 %35, 1
  %38 = icmp eq i32 0, %37
  %in_bounds11 = and i1 %in_bounds10, %38
  %39 = sdiv i32 %35, 1
  %40 = icmp slt i32 %39, 20
  %in_bounds12 = and i1 %in_bounds11, %40
  br i1 %in_bounds12, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %41 = load double, ptr %pad_result_addr, align 8
  %42 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %10, i32 %11
  %43 = load double, ptr %42, align 8, !invariant.load !349
  %subtract.865.11 = fsub double %41, %43
  %44 = call double @__nv_exp(double %subtract.865.11)
  store double %22, ptr %parameter_buffer14, align 8
  store double %44, ptr %parameter_buffer15, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer14, ptr %parameter_buffer15, ptr %return_buffer16)
  %45 = load double, ptr %return_buffer16, align 8
  store double %45, ptr %accumulator_02, align 8
  %invar.inc4 = add nuw nsw i32 %reduce.397.4.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.397.4.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.397.4.inner.loop_header.reduction_dim.0

reduce.397.4.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.397.4.inner.loop_header.reduction_dim.0
  %46 = load double, ptr %accumulator_02, align 8
  %divide.2537.3 = fdiv double %20, %46
  %47 = sub i32 %9, 1
  %48 = icmp sge i32 %47, 0
  %in_bounds17 = and i1 true, %48
  %49 = urem i32 %47, 1
  %50 = icmp eq i32 0, %49
  %in_bounds18 = and i1 %in_bounds17, %50
  %51 = sdiv i32 %47, 1
  %52 = icmp slt i32 %51, 1
  %in_bounds19 = and i1 %in_bounds18, %52
  %53 = sub i32 %10, 0
  %54 = icmp sge i32 %53, 0
  %in_bounds20 = and i1 %in_bounds19, %54
  %55 = urem i32 %53, 1
  %56 = icmp eq i32 0, %55
  %in_bounds21 = and i1 %in_bounds20, %56
  %57 = sdiv i32 %53, 1
  %58 = icmp slt i32 %57, 192
  %in_bounds22 = and i1 %in_bounds21, %58
  %59 = sub i32 %11, 0
  %60 = icmp sge i32 %59, 0
  %in_bounds23 = and i1 %in_bounds22, %60
  %61 = urem i32 %59, 1
  %62 = icmp eq i32 0, %61
  %in_bounds24 = and i1 %in_bounds23, %62
  %63 = sdiv i32 %59, 1
  %64 = icmp slt i32 %63, 20
  %in_bounds25 = and i1 %in_bounds24, %64
  br i1 %in_bounds25, label %in_bounds-true27, label %in_bounds-false28

in_bounds-after29:                                ; preds = %in_bounds-false28, %in_bounds-true27
  %65 = load double, ptr %pad_result_addr26, align 8
  %66 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %10, i32 %11
  %67 = load double, ptr %66, align 8, !invariant.load !349
  %subtract.865.1131 = fsub double %65, %67
  %68 = call double @__nv_exp(double %subtract.865.1131)
  %multiply.11735.1 = fmul double %divide.2537.3, %68
  %add.9904.1 = fadd double %13, %multiply.11735.1
  %69 = insertvalue { double, double } undef, double %add.9904.1, 0
  %70 = mul nuw nsw i32 %4, 1
  %71 = add nuw nsw i32 0, %70
  %72 = mul nuw nsw i32 %6, 20
  %73 = add nuw nsw i32 %71, %72
  %74 = urem i32 %73, 192
  %75 = udiv i32 %73, 192
  %76 = udiv i32 %75, 20
  %77 = mul nuw nsw i32 %7, 1
  %78 = add nuw nsw i32 0, %77
  %constant_23822_1_clone_1 = load i8, ptr @436, align 1
  store i8 %constant_23822_1_clone_1, ptr %accumulator_032, align 1
  store i32 0, ptr %reduce.368.3.clone.1.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.368.3.clone.1.inner.loop_header.reduction_dim.2

reduce.368.3.clone.1.inner.loop_header.reduction_dim.2: ; preds = %reduce.368.3.clone.1.inner.loop_body.reduction_dim.2, %in_bounds-after29
  %reduce.368.3.clone.1.inner.indvar.reduction_dim.2 = load i32, ptr %reduce.368.3.clone.1.inner.invar_address.reduction_dim.2, align 4
  %79 = icmp uge i32 %reduce.368.3.clone.1.inner.indvar.reduction_dim.2, 3
  br i1 %79, label %reduce.368.3.clone.1.inner.loop_exit.reduction_dim.2, label %reduce.368.3.clone.1.inner.loop_body.reduction_dim.2

reduce.368.3.clone.1.inner.loop_body.reduction_dim.2: ; preds = %reduce.368.3.clone.1.inner.loop_header.reduction_dim.2
  %80 = load i8, ptr %accumulator_032, align 1
  %81 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg4, i32 0, i32 %75, i32 %74, i32 0, i32 %reduce.368.3.clone.1.inner.indvar.reduction_dim.2
  %82 = load i32, ptr %81, align 4, !invariant.load !349
  %83 = sext i32 %82 to i64
  %constant_23853_1_clone_1 = load i64, ptr @437, align 8
  %84 = icmp sge i64 %83, %constant_23853_1_clone_1
  %85 = zext i1 %84 to i8
  %86 = getelementptr inbounds [3 x i64], ptr %arg3, i32 0, i32 %reduce.368.3.clone.1.inner.indvar.reduction_dim.2
  %87 = load i64, ptr %86, align 8, !invariant.load !349
  %88 = icmp sle i64 %83, %87
  %89 = zext i1 %88 to i8
  %90 = and i8 %85, %89
  store i8 %80, ptr %parameter_buffer34, align 1
  store i8 %90, ptr %parameter_buffer35, align 1
  call void @region_28_5076_5601061d6c30_7b687ac0855e3bbb(ptr %parameter_buffer34, ptr %parameter_buffer35, ptr %return_buffer36)
  %91 = load i8, ptr %return_buffer36, align 1
  store i8 %91, ptr %accumulator_032, align 1
  %invar.inc33 = add nuw nsw i32 %reduce.368.3.clone.1.inner.indvar.reduction_dim.2, 1
  store i32 %invar.inc33, ptr %reduce.368.3.clone.1.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.368.3.clone.1.inner.loop_header.reduction_dim.2

reduce.368.3.clone.1.inner.loop_exit.reduction_dim.2: ; preds = %reduce.368.3.clone.1.inner.loop_header.reduction_dim.2
  %92 = load i8, ptr %accumulator_032, align 1
  %93 = mul nuw nsw i32 %74, 1
  %94 = add nuw nsw i32 0, %93
  %95 = mul nuw nsw i32 %75, 192
  %96 = add nuw nsw i32 %94, %95
  %97 = udiv i32 %96, 3840
  %98 = mul nuw nsw i32 %96, 1
  %99 = add nuw nsw i32 0, %98
  %100 = urem i32 %99, 192
  %101 = udiv i32 %99, 192
  %102 = udiv i32 %101, 20
  %103 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg4, i32 0, i32 %101, i32 %100, i32 0, i32 0
  %104 = load i32, ptr %103, align 4, !invariant.load !349
  %105 = sext i32 %104 to i64
  %106 = icmp sge i64 0, %105
  %107 = select i1 %106, i64 0, i64 %105
  %108 = icmp sle i64 19, %107
  %109 = select i1 %108, i64 19, i64 %107
  %110 = trunc i64 %109 to i32
  %111 = add i32 0, %110
  %112 = mul nuw nsw i32 %96, 1
  %113 = add nuw nsw i32 0, %112
  %114 = urem i32 %113, 192
  %115 = udiv i32 %113, 192
  %116 = udiv i32 %115, 20
  %117 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg4, i32 0, i32 %115, i32 %114, i32 0, i32 1
  %118 = load i32, ptr %117, align 4, !invariant.load !349
  %119 = sext i32 %118 to i64
  %120 = icmp sge i64 0, %119
  %121 = select i1 %120, i64 0, i64 %119
  %122 = icmp sle i64 191, %121
  %123 = select i1 %122, i64 191, i64 %121
  %124 = trunc i64 %123 to i32
  %125 = add i32 0, %124
  %126 = mul nuw nsw i32 %96, 1
  %127 = add nuw nsw i32 0, %126
  %128 = urem i32 %127, 192
  %129 = udiv i32 %127, 192
  %130 = udiv i32 %129, 20
  %131 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg4, i32 0, i32 %129, i32 %128, i32 0, i32 2
  %132 = load i32, ptr %131, align 4, !invariant.load !349
  %133 = sext i32 %132 to i64
  %134 = icmp sge i64 0, %133
  %135 = select i1 %134, i64 0, i64 %133
  %136 = icmp sle i64 1, %135
  %137 = select i1 %136, i64 1, i64 %135
  %138 = trunc i64 %137 to i32
  %139 = add i32 0, %138
  %140 = sub i32 %139, 1
  %141 = icmp sge i32 %140, 0
  %in_bounds37 = and i1 true, %141
  %142 = urem i32 %140, 1
  %143 = icmp eq i32 0, %142
  %in_bounds38 = and i1 %in_bounds37, %143
  %144 = sdiv i32 %140, 1
  %145 = icmp slt i32 %144, 1
  %in_bounds39 = and i1 %in_bounds38, %145
  %146 = sub i32 %125, 0
  %147 = icmp sge i32 %146, 0
  %in_bounds40 = and i1 %in_bounds39, %147
  %148 = urem i32 %146, 1
  %149 = icmp eq i32 0, %148
  %in_bounds41 = and i1 %in_bounds40, %149
  %150 = sdiv i32 %146, 1
  %151 = icmp slt i32 %150, 192
  %in_bounds42 = and i1 %in_bounds41, %151
  %152 = sub i32 %111, 0
  %153 = icmp sge i32 %152, 0
  %in_bounds43 = and i1 %in_bounds42, %153
  %154 = urem i32 %152, 1
  %155 = icmp eq i32 0, %154
  %in_bounds44 = and i1 %in_bounds43, %155
  %156 = sdiv i32 %152, 1
  %157 = icmp slt i32 %156, 20
  %in_bounds45 = and i1 %in_bounds44, %157
  br i1 %in_bounds45, label %in_bounds-true47, label %in_bounds-false48

in_bounds-after49:                                ; preds = %in_bounds-false48, %in_bounds-true47
  %158 = load double, ptr %pad_result_addr46, align 8
  %159 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %125, i32 %111
  %160 = load double, ptr %159, align 8, !invariant.load !349
  %subtract.865.1151 = fsub double %158, %160
  %constant_23818_1353 = load double, ptr @435, align 8
  store double %constant_23818_1353, ptr %accumulator_052, align 8
  store i32 0, ptr %reduce.397.4.inner.invar_address.reduction_dim.057, align 4
  br label %reduce.397.4.inner.loop_header.reduction_dim.055

reduce.397.4.inner.loop_header.reduction_dim.055: ; preds = %in_bounds-after72, %in_bounds-after49
  %reduce.397.4.inner.indvar.reduction_dim.058 = load i32, ptr %reduce.397.4.inner.invar_address.reduction_dim.057, align 4
  %161 = icmp uge i32 %reduce.397.4.inner.indvar.reduction_dim.058, 2
  br i1 %161, label %reduce.397.4.inner.loop_exit.reduction_dim.054, label %reduce.397.4.inner.loop_body.reduction_dim.056

reduce.397.4.inner.loop_body.reduction_dim.056:   ; preds = %reduce.397.4.inner.loop_header.reduction_dim.055
  %162 = load double, ptr %accumulator_052, align 8
  %163 = sub i32 %reduce.397.4.inner.indvar.reduction_dim.058, 1
  %164 = icmp sge i32 %163, 0
  %in_bounds60 = and i1 true, %164
  %165 = urem i32 %163, 1
  %166 = icmp eq i32 0, %165
  %in_bounds61 = and i1 %in_bounds60, %166
  %167 = sdiv i32 %163, 1
  %168 = icmp slt i32 %167, 1
  %in_bounds62 = and i1 %in_bounds61, %168
  %169 = sub i32 %125, 0
  %170 = icmp sge i32 %169, 0
  %in_bounds63 = and i1 %in_bounds62, %170
  %171 = urem i32 %169, 1
  %172 = icmp eq i32 0, %171
  %in_bounds64 = and i1 %in_bounds63, %172
  %173 = sdiv i32 %169, 1
  %174 = icmp slt i32 %173, 192
  %in_bounds65 = and i1 %in_bounds64, %174
  %175 = sub i32 %111, 0
  %176 = icmp sge i32 %175, 0
  %in_bounds66 = and i1 %in_bounds65, %176
  %177 = urem i32 %175, 1
  %178 = icmp eq i32 0, %177
  %in_bounds67 = and i1 %in_bounds66, %178
  %179 = sdiv i32 %175, 1
  %180 = icmp slt i32 %179, 20
  %in_bounds68 = and i1 %in_bounds67, %180
  br i1 %in_bounds68, label %in_bounds-true70, label %in_bounds-false71

in_bounds-after72:                                ; preds = %in_bounds-false71, %in_bounds-true70
  %181 = load double, ptr %pad_result_addr69, align 8
  %182 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %125, i32 %111
  %183 = load double, ptr %182, align 8, !invariant.load !349
  %subtract.865.1174 = fsub double %181, %183
  %184 = call double @__nv_exp(double %subtract.865.1174)
  store double %162, ptr %parameter_buffer75, align 8
  store double %184, ptr %parameter_buffer76, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer75, ptr %parameter_buffer76, ptr %return_buffer77)
  %185 = load double, ptr %return_buffer77, align 8
  store double %185, ptr %accumulator_052, align 8
  %invar.inc59 = add nuw nsw i32 %reduce.397.4.inner.indvar.reduction_dim.058, 1
  store i32 %invar.inc59, ptr %reduce.397.4.inner.invar_address.reduction_dim.057, align 4
  br label %reduce.397.4.inner.loop_header.reduction_dim.055

reduce.397.4.inner.loop_exit.reduction_dim.054:   ; preds = %reduce.397.4.inner.loop_header.reduction_dim.055
  %186 = load double, ptr %accumulator_052, align 8
  %187 = call double @__nv_log(double %186)
  %subtract.866.5.clone.1 = fsub double %subtract.865.1151, %187
  %constant_1242_1_clone_1 = load double, ptr @434, align 8
  %188 = trunc i8 %92 to i1
  %189 = select i1 %188, double %subtract.866.5.clone.1, double %constant_1242_1_clone_1
  %190 = insertvalue { double, double } %69, double %189, 1
  %191 = extractvalue { double, double } %190, 0
  %192 = getelementptr double, ptr %arg5, i32 %linear_index
  %193 = getelementptr inbounds double, ptr %192, i32 0
  store double %191, ptr %193, align 8
  %194 = mul nuw nsw i32 %4, 1
  %195 = add nuw nsw i32 0, %194
  %196 = mul nuw nsw i32 %6, 20
  %197 = add nuw nsw i32 %195, %196
  %198 = urem i32 %197, 192
  %199 = udiv i32 %197, 192
  %200 = udiv i32 %199, 20
  %201 = mul nuw nsw i32 %7, 1
  %202 = add nuw nsw i32 0, %201
  %203 = extractvalue { double, double } %190, 1
  %204 = getelementptr double, ptr %arg6, i32 %linear_index
  %205 = getelementptr inbounds double, ptr %204, i32 0
  store double %203, ptr %205, align 8
  br label %loop_select_slice_fusion.2.in_bounds-after

in_bounds-true:                                   ; preds = %reduce.397.4.inner.loop_body.reduction_dim.0
  %206 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %33, i32 %39
  %207 = load double, ptr %206, align 8, !invariant.load !349
  store double %207, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %reduce.397.4.inner.loop_body.reduction_dim.0
  %constant_23818_1313 = load double, ptr @435, align 8
  store double %constant_23818_1313, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-true27:                                 ; preds = %reduce.397.4.inner.loop_exit.reduction_dim.0
  %208 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %57, i32 %63
  %209 = load double, ptr %208, align 8, !invariant.load !349
  store double %209, ptr %pad_result_addr26, align 8
  br label %in_bounds-after29

in_bounds-false28:                                ; preds = %reduce.397.4.inner.loop_exit.reduction_dim.0
  %constant_23818_1330 = load double, ptr @435, align 8
  store double %constant_23818_1330, ptr %pad_result_addr26, align 8
  br label %in_bounds-after29

in_bounds-true47:                                 ; preds = %reduce.368.3.clone.1.inner.loop_exit.reduction_dim.2
  %210 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %150, i32 %156
  %211 = load double, ptr %210, align 8, !invariant.load !349
  store double %211, ptr %pad_result_addr46, align 8
  br label %in_bounds-after49

in_bounds-false48:                                ; preds = %reduce.368.3.clone.1.inner.loop_exit.reduction_dim.2
  %constant_23818_1350 = load double, ptr @435, align 8
  store double %constant_23818_1350, ptr %pad_result_addr46, align 8
  br label %in_bounds-after49

in_bounds-true70:                                 ; preds = %reduce.397.4.inner.loop_body.reduction_dim.056
  %212 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %173, i32 %179
  %213 = load double, ptr %212, align 8, !invariant.load !349
  store double %213, ptr %pad_result_addr69, align 8
  br label %in_bounds-after72

in_bounds-false71:                                ; preds = %reduce.397.4.inner.loop_body.reduction_dim.056
  %constant_23818_1373 = load double, ptr @435, align 8
  store double %constant_23818_1373, ptr %pad_result_addr69, align 8
  br label %in_bounds-after72
}

define void @input_multiply_reduce_fusion_2(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3, ptr noalias align 128 dereferenceable(30720) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(30720) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(30720) %arg8) {
entry:
  %return_buffer31 = alloca double, align 8
  %result_from_other_lane29 = alloca double, align 8
  %return_buffer28 = alloca double, align 8
  %result_from_other_lane26 = alloca double, align 8
  %return_buffer25 = alloca double, align 8
  %result_from_other_lane23 = alloca double, align 8
  %return_buffer22 = alloca double, align 8
  %result_from_other_lane20 = alloca double, align 8
  %return_buffer19 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !348
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_23818_11_clone_1 = load double, ptr @442, align 8
  store double %constant_23818_11_clone_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !353
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = udiv i32 %thread.id.x, 32
  %thread.id.1 = urem i32 %1, 32
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 192, i32 4096
  %8 = icmp eq i32 %3, 0
  %tile_bound.2 = select i1 %8, i32 20, i32 32
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 4096
  %tile_origin.2 = mul i32 %3, 32
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %9 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %9, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 32
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %10 = icmp uge i32 %loop2.indvar, 32
  br i1 %10, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 32
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %11 = add i32 %loop2.indvar, %thread.id.2
  %12 = icmp ult i32 %11, %tile_bound.2
  br i1 %12, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !373

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !374

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %13 = load double, ptr %partial_reduction_result, align 8
  %14 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache3, i32 0, i32 %thread.id.2, i32 %thread.id.1
  %15 = addrspacecast ptr addrspace(3) %14 to ptr
  store double %13, ptr %15, align 8
  call void @llvm.nvvm.barrier0()
  %16 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache3, i32 0, i32 %thread.id.1, i32 %thread.id.2
  %17 = addrspacecast ptr addrspace(3) %16 to ptr
  %partial_reduction_result18 = load double, ptr %17, align 8
  %18 = bitcast double %partial_reduction_result18 to i64
  %19 = bitcast i64 %18 to <2 x i32>
  %20 = extractelement <2 x i32> %19, i64 0
  %21 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 16, i32 31)
  %22 = insertelement <2 x i32> %19, i32 %21, i64 0
  %23 = extractelement <2 x i32> %22, i64 1
  %24 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 16, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 1
  %26 = bitcast <2 x i32> %25 to i64
  %27 = bitcast i64 %26 to double
  store double %27, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane, ptr %return_buffer19)
  %28 = load double, ptr %return_buffer19, align 8
  store double %28, ptr %17, align 8
  %partial_reduction_result21 = load double, ptr %17, align 8
  %29 = bitcast double %partial_reduction_result21 to i64
  %30 = bitcast i64 %29 to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 0
  %34 = extractelement <2 x i32> %33, i64 1
  %35 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 8, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to i64
  %38 = bitcast i64 %37 to double
  store double %38, ptr %result_from_other_lane20, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane20, ptr %return_buffer22)
  %39 = load double, ptr %return_buffer22, align 8
  store double %39, ptr %17, align 8
  %partial_reduction_result24 = load double, ptr %17, align 8
  %40 = bitcast double %partial_reduction_result24 to i64
  %41 = bitcast i64 %40 to <2 x i32>
  %42 = extractelement <2 x i32> %41, i64 0
  %43 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 4, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 0
  %45 = extractelement <2 x i32> %44, i64 1
  %46 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 4, i32 31)
  %47 = insertelement <2 x i32> %44, i32 %46, i64 1
  %48 = bitcast <2 x i32> %47 to i64
  %49 = bitcast i64 %48 to double
  store double %49, ptr %result_from_other_lane23, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane23, ptr %return_buffer25)
  %50 = load double, ptr %return_buffer25, align 8
  store double %50, ptr %17, align 8
  %partial_reduction_result27 = load double, ptr %17, align 8
  %51 = bitcast double %partial_reduction_result27 to i64
  %52 = bitcast i64 %51 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 2, i32 31)
  %55 = insertelement <2 x i32> %52, i32 %54, i64 0
  %56 = extractelement <2 x i32> %55, i64 1
  %57 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 1
  %59 = bitcast <2 x i32> %58 to i64
  %60 = bitcast i64 %59 to double
  store double %60, ptr %result_from_other_lane26, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane26, ptr %return_buffer28)
  %61 = load double, ptr %return_buffer28, align 8
  store double %61, ptr %17, align 8
  %partial_reduction_result30 = load double, ptr %17, align 8
  %62 = bitcast double %partial_reduction_result30 to i64
  %63 = bitcast i64 %62 to <2 x i32>
  %64 = extractelement <2 x i32> %63, i64 0
  %65 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  %66 = insertelement <2 x i32> %63, i32 %65, i64 0
  %67 = extractelement <2 x i32> %66, i64 1
  %68 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %67, i32 1, i32 31)
  %69 = insertelement <2 x i32> %66, i32 %68, i64 1
  %70 = bitcast <2 x i32> %69 to i64
  %71 = bitcast i64 %70 to double
  store double %71, ptr %result_from_other_lane29, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %17, ptr %result_from_other_lane29, ptr %return_buffer31)
  %72 = load double, ptr %return_buffer31, align 8
  store double %72, ptr %17, align 8
  %73 = icmp ult i32 %thread.id.1, %tile_bound.2
  %74 = icmp ult i32 %thread.id.2, %tile_bound.1
  %75 = and i1 %73, %74
  %76 = icmp eq i32 %lane_id, 0
  %77 = and i1 %75, %76
  br i1 %77, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %78 = add i32 %tile_origin.0, 0
  %79 = add i32 %tile_origin.1, %loop1.indvar
  %80 = add i32 %tile_origin.2, %11
  %param_0.4191 = getelementptr inbounds [1 x [192 x [20 x double]]], ptr %arg0, i32 0, i32 0, i32 %79, i32 %80
  %param_0.41912 = load double, ptr %param_0.4191, align 8, !invariant.load !349
  store double %param_0.41912, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %81 = load double, ptr %return_buffer, align 8
  store double %81, ptr %partial_reduction_result, align 8
  %constant_23829_5 = load double, ptr @438, align 8
  %constant_23832_3 = load double, ptr @440, align 8
  %param_3.4080 = getelementptr inbounds [192 x [20 x double]], ptr %arg3, i32 0, i32 %79, i32 %80
  %param_3.40803 = load double, ptr %param_3.4080, align 8, !invariant.load !349
  %constant_23831_3 = load double, ptr @439, align 8
  %82 = fcmp une double %constant_23832_3, %constant_23832_3
  %83 = fcmp oeq double %param_3.40803, %param_3.40803
  %84 = fcmp oge double %constant_23832_3, %param_3.40803
  %85 = and i1 %83, %84
  %86 = or i1 %82, %85
  %87 = select i1 %86, double %constant_23832_3, double %param_3.40803
  %88 = fcmp une double %constant_23831_3, %constant_23831_3
  %89 = fcmp oeq double %87, %87
  %90 = fcmp ole double %constant_23831_3, %87
  %91 = and i1 %89, %90
  %92 = or i1 %88, %91
  %93 = select i1 %92, double %constant_23831_3, double %87
  %94 = fneg double %93
  %95 = call double @__nv_exp(double %94)
  %add.9900.3 = fadd double %95, %constant_23829_5
  %divide.2536.3 = fdiv double %constant_23829_5, %add.9900.3
  %subtract.863.2 = fsub double %constant_23829_5, %divide.2536.3
  %param_2.4847 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %79, i32 %80
  %param_2.48474 = load double, ptr %param_2.4847, align 8, !invariant.load !349
  %multiply.11732.2 = fmul double %subtract.863.2, %param_2.48474
  %param_1.5834 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %79, i32 %80
  %param_1.58345 = load double, ptr %param_1.5834, align 8, !invariant.load !349
  %multiply.11733.2 = fmul double %divide.2536.3, %param_1.58345
  %subtract.864.1 = fsub double %multiply.11732.2, %multiply.11733.2
  %multiply.11744.1 = fmul double %param_0.41912, %subtract.864.1
  %param_5.4191 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %80
  %param_5.41916 = load double, ptr %param_5.4191, align 8, !invariant.load !349
  %96 = call double @__nv_exp(double %param_5.41916)
  %multiply.11736.15.clone.1 = fmul double %96, %param_0.41912
  %97 = fneg double %multiply.11736.15.clone.1
  %param_1.58347 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %79, i32 %80
  %param_1.58348 = load double, ptr %param_1.58347, align 8, !invariant.load !349
  %multiply.11737.9.clone.1 = fmul double %97, %param_1.58348
  %param_2.48479 = getelementptr inbounds [192 x [20 x double]], ptr %arg2, i32 0, i32 %79, i32 %80
  %param_2.484710 = load double, ptr %param_2.48479, align 8, !invariant.load !349
  %multiply.11738.5.clone.1 = fmul double %multiply.11736.15.clone.1, %param_2.484710
  %98 = fneg double %multiply.11738.5.clone.1
  %add.9907.7.clone.1 = fadd double %multiply.11737.9.clone.1, %98
  %multiply.11739.1.clone.1 = fmul double %divide.2536.3, %subtract.863.2
  %multiply.11740.5.clone.1 = fmul double %add.9907.7.clone.1, %multiply.11739.1.clone.1
  %param_3.408011 = getelementptr inbounds [192 x [20 x double]], ptr %arg3, i32 0, i32 %79, i32 %80
  %param_3.408012 = load double, ptr %param_3.408011, align 8, !invariant.load !349
  %99 = fcmp une double %constant_23832_3, %constant_23832_3
  %100 = fcmp oeq double %param_3.408012, %param_3.408012
  %101 = fcmp oge double %constant_23832_3, %param_3.408012
  %102 = and i1 %100, %101
  %103 = or i1 %99, %102
  %maximum.72.1.clone.1 = select i1 %103, double %constant_23832_3, double %param_3.408012
  %compare.2718.1.clone.1 = fcmp oeq double %maximum.72.1.clone.1, %93
  %104 = zext i1 %compare.2718.1.clone.1 to i8
  %param_4.5037 = getelementptr inbounds [192 x [20 x double]], ptr %arg4, i32 0, i32 %79, i32 %80
  %param_4.503713 = load double, ptr %param_4.5037, align 8, !invariant.load !349
  %105 = trunc i8 %104 to i1
  %106 = select i1 %105, double %constant_23829_5, double %param_4.503713
  %compare.2719.1.clone.1 = fcmp oeq double %constant_23831_3, %93
  %107 = zext i1 %compare.2719.1.clone.1 to i8
  %constant_23879_1_clone_1 = load double, ptr @441, align 8
  %108 = trunc i8 %107 to i1
  %109 = select i1 %108, double %constant_23879_1_clone_1, double %constant_23829_5
  %divide.2538.5.clone.1 = fdiv double %106, %109
  %multiply.11741.3.clone.1 = fmul double %multiply.11740.5.clone.1, %divide.2538.5.clone.1
  %param_3.408014 = getelementptr inbounds [192 x [20 x double]], ptr %arg3, i32 0, i32 %79, i32 %80
  %param_3.408015 = load double, ptr %param_3.408014, align 8, !invariant.load !349
  %compare.2720.1.clone.1 = fcmp oeq double %param_3.408015, %maximum.72.1.clone.1
  %110 = zext i1 %compare.2720.1.clone.1 to i8
  %param_4.503716 = getelementptr inbounds [192 x [20 x double]], ptr %arg4, i32 0, i32 %79, i32 %80
  %param_4.503717 = load double, ptr %param_4.503716, align 8, !invariant.load !349
  %111 = trunc i8 %110 to i1
  %112 = select i1 %111, double %constant_23829_5, double %param_4.503717
  %compare.2721.1.clone.1 = fcmp oeq double %constant_23832_3, %maximum.72.1.clone.1
  %113 = zext i1 %compare.2721.1.clone.1 to i8
  %114 = trunc i8 %113 to i1
  %115 = select i1 %114, double %constant_23879_1_clone_1, double %constant_23829_5
  %divide.2539.3.clone.1 = fdiv double %112, %115
  %multiply.11742.1.clone.1 = fmul double %multiply.11741.3.clone.1, %divide.2539.3.clone.1
  %116 = getelementptr inbounds [192 x [20 x double]], ptr %arg6, i32 0, i32 %79, i32 %80
  store double %multiply.11744.1, ptr %116, align 8
  %117 = getelementptr inbounds [192 x [20 x double]], ptr %arg8, i32 0, i32 %79, i32 %80
  store double %multiply.11742.1.clone.1, ptr %117, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %118 = add i32 %tile_origin.2, %thread.id.1
  %output_element_address = getelementptr inbounds [20 x double], ptr %arg7, i32 0, i32 %118
  %output = load double, ptr %17, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

define void @loop_add_fusion_20(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_fusion.20.in_bounds-true, label %loop_add_fusion.20.in_bounds-after

loop_add_fusion.20.in_bounds-after:               ; preds = %loop_add_fusion.20.in_bounds-true, %entry
  ret void

loop_add_fusion.20.in_bounds-true:                ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %constant_2858_2 = load double, ptr @444, align 8
  %add.9889.3 = fadd double %10, %constant_2858_2
  %constant_1635_1 = load double, ptr @443, align 8
  %multiply.11748.3 = fmul double %add.9889.3, %constant_1635_1
  %add.9913.1 = fadd double %7, %multiply.11748.3
  %11 = getelementptr double, ptr %arg2, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  store double %add.9913.1, ptr %12, align 8
  br label %loop_add_fusion.20.in_bounds-after
}

define void @loop_add_fusion_21(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_fusion.21.in_bounds-true, label %loop_add_fusion.21.in_bounds-after

loop_add_fusion.21.in_bounds-after:               ; preds = %loop_add_fusion.21.in_bounds-true, %entry
  ret void

loop_add_fusion.21.in_bounds-true:                ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %constant_1642_4 = load double, ptr @446, align 8
  %add.9880.3 = fadd double %10, %constant_1642_4
  %constant_1635_4 = load double, ptr @445, align 8
  %multiply.11747.3 = fmul double %add.9880.3, %constant_1635_4
  %add.9912.1 = fadd double %7, %multiply.11747.3
  %11 = getelementptr double, ptr %arg2, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  store double %add.9912.1, ptr %12, align 8
  br label %loop_add_fusion.21.in_bounds-after
}

define void @loop_add_fusion_28(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_fusion.28.in_bounds-true, label %loop_add_fusion.28.in_bounds-after

loop_add_fusion.28.in_bounds-after:               ; preds = %loop_add_fusion.28.in_bounds-true, %entry
  ret void

loop_add_fusion.28.in_bounds-true:                ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %constant_23820_5 = load double, ptr @447, align 8
  %add.9897.3 = fadd double %10, %constant_23820_5
  %add.9910.1 = fadd double %7, %add.9897.3
  %11 = getelementptr double, ptr %arg2, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  store double %add.9910.1, ptr %12, align 8
  br label %loop_add_fusion.28.in_bounds-after
}

define void @loop_add_fusion_18(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_fusion.18.in_bounds-true, label %loop_add_fusion.18.in_bounds-after

loop_add_fusion.18.in_bounds-after:               ; preds = %loop_add_fusion.18.in_bounds-true, %entry
  ret void

loop_add_fusion.18.in_bounds-true:                ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %constant_23820_4 = load double, ptr @449, align 8
  %add.9893.3 = fadd double %10, %constant_23820_4
  %constant_1642_1 = load double, ptr @448, align 8
  %multiply.11743.3 = fmul double %add.9893.3, %constant_1642_1
  %add.9908.1 = fadd double %7, %multiply.11743.3
  %11 = getelementptr double, ptr %arg2, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  store double %add.9908.1, ptr %12, align 8
  br label %loop_add_fusion.18.in_bounds-after
}

define void @loop_add_fusion_19(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_fusion.19.in_bounds-true, label %loop_add_fusion.19.in_bounds-after

loop_add_fusion.19.in_bounds-after:               ; preds = %loop_add_fusion.19.in_bounds-true, %entry
  ret void

loop_add_fusion.19.in_bounds-true:                ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %11 = call double @__nv_exp(double %10)
  %multiply.11745.1 = fmul double %7, %11
  %12 = getelementptr double, ptr %arg1, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !349
  %constant_2857_2 = load double, ptr @451, align 8
  %add.9883.3 = fadd double %14, %constant_2857_2
  %constant_1637_1 = load double, ptr @450, align 8
  %multiply.11746.3 = fmul double %add.9883.3, %constant_1637_1
  %add.9909.1 = fadd double %multiply.11745.1, %multiply.11746.3
  %15 = getelementptr double, ptr %arg2, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  store double %add.9909.1, ptr %16, align 8
  br label %loop_add_fusion.19.in_bounds-after
}

define void @wrapped_add(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %wrapped_add.in_bounds-true, label %wrapped_add.in_bounds-after

wrapped_add.in_bounds-after:                      ; preds = %wrapped_add.in_bounds-true, %entry
  ret void

wrapped_add.in_bounds-true:                       ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !349
  %add.9905.1 = fadd double %7, %10
  %11 = getelementptr double, ptr %arg2, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  store double %add.9905.1, ptr %12, align 8
  br label %wrapped_add.in_bounds-after
}

define void @loop_reduce_fusion_14(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.23922.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.14.in_bounds-true, label %loop_reduce_fusion.14.in_bounds-after

loop_reduce_fusion.14.in_bounds-after:            ; preds = %reduce.23922.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.14.in_bounds-true:             ; preds = %entry
  %constant_23818_8 = load double, ptr @452, align 8
  store double %constant_23818_8, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.23922.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.23922.1.inner.loop_header.reduction_dim.0

reduce.23922.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.23922.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.14.in_bounds-true
  %reduce.23922.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.23922.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.23922.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.23922.1.inner.loop_exit.reduction_dim.0, label %reduce.23922.1.inner.loop_body.reduction_dim.0

reduce.23922.1.inner.loop_body.reduction_dim.0:   ; preds = %reduce.23922.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.23922.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %constant_2857_1 = load double, ptr @456, align 8
  %add.9883.7 = fadd double %7, %constant_2857_1
  %multiply.11719.7 = fmul double %add.9883.7, %add.9883.7
  %constant_1637_2 = load double, ptr @455, align 8
  %multiply.11720.7 = fmul double %multiply.11719.7, %constant_1637_2
  %constant_23867_1 = load double, ptr @454, align 8
  %add.9884.5 = fadd double %multiply.11720.7, %constant_23867_1
  %constant_1636_3 = load double, ptr @453, align 8
  %multiply.11721.3 = fmul double %add.9884.5, %constant_1636_3
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11721.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %8 = load double, ptr %return_buffer, align 8
  store double %8, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.23922.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.23922.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.23922.1.inner.loop_header.reduction_dim.0

reduce.23922.1.inner.loop_exit.reduction_dim.0:   ; preds = %reduce.23922.1.inner.loop_header.reduction_dim.0
  %9 = load double, ptr %accumulator_0, align 8
  store double %9, ptr %arg1, align 8
  br label %loop_reduce_fusion.14.in_bounds-after
}

define void @loop_reduce_fusion_11(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.23931.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.11.in_bounds-true, label %loop_reduce_fusion.11.in_bounds-after

loop_reduce_fusion.11.in_bounds-after:            ; preds = %reduce.23931.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.11.in_bounds-true:             ; preds = %entry
  %constant_23818_9 = load double, ptr @457, align 8
  store double %constant_23818_9, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.23931.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.23931.1.inner.loop_header.reduction_dim.0

reduce.23931.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.23931.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.11.in_bounds-true
  %reduce.23931.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.23931.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.23931.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.23931.1.inner.loop_exit.reduction_dim.0, label %reduce.23931.1.inner.loop_body.reduction_dim.0

reduce.23931.1.inner.loop_body.reduction_dim.0:   ; preds = %reduce.23931.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.23931.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.23931.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %multiply.11722.5 = fmul double %7, %9
  %constant_23861_2 = load double, ptr @459, align 8
  %add.9887.5 = fadd double %multiply.11722.5, %constant_23861_2
  %constant_1636_4 = load double, ptr @458, align 8
  %multiply.11723.3 = fmul double %add.9887.5, %constant_1636_4
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11723.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %10 = load double, ptr %return_buffer, align 8
  store double %10, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.23931.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.23931.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.23931.1.inner.loop_header.reduction_dim.0

reduce.23931.1.inner.loop_exit.reduction_dim.0:   ; preds = %reduce.23931.1.inner.loop_header.reduction_dim.0
  %11 = load double, ptr %accumulator_0, align 8
  store double %11, ptr %arg1, align 8
  br label %loop_reduce_fusion.11.in_bounds-after
}

define void @loop_reduce_fusion_12(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.23949.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.12.in_bounds-true, label %loop_reduce_fusion.12.in_bounds-after

loop_reduce_fusion.12.in_bounds-after:            ; preds = %reduce.23949.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.12.in_bounds-true:             ; preds = %entry
  %constant_23818_15 = load double, ptr @460, align 8
  store double %constant_23818_15, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.23949.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.23949.1.inner.loop_header.reduction_dim.0

reduce.23949.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.23949.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.12.in_bounds-true
  %reduce.23949.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.23949.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.23949.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.23949.1.inner.loop_exit.reduction_dim.0, label %reduce.23949.1.inner.loop_body.reduction_dim.0

reduce.23949.1.inner.loop_body.reduction_dim.0:   ; preds = %reduce.23949.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.23949.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %constant_23820_3 = load double, ptr @464, align 8
  %add.9893.7 = fadd double %7, %constant_23820_3
  %multiply.11727.7 = fmul double %add.9893.7, %add.9893.7
  %constant_1642_3 = load double, ptr @463, align 8
  %multiply.11728.7 = fmul double %multiply.11727.7, %constant_1642_3
  %constant_23855_1 = load double, ptr @462, align 8
  %add.9894.5 = fadd double %multiply.11728.7, %constant_23855_1
  %constant_1636_6 = load double, ptr @461, align 8
  %multiply.11729.3 = fmul double %add.9894.5, %constant_1636_6
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11729.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %8 = load double, ptr %return_buffer, align 8
  store double %8, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.23949.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.23949.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.23949.1.inner.loop_header.reduction_dim.0

reduce.23949.1.inner.loop_exit.reduction_dim.0:   ; preds = %reduce.23949.1.inner.loop_header.reduction_dim.0
  %9 = load double, ptr %accumulator_0, align 8
  store double %9, ptr %arg1, align 8
  br label %loop_reduce_fusion.12.in_bounds-after
}

define void @input_reduce_fusion_8(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(1) %arg3) {
entry:
  %return_buffer9 = alloca i8, align 1
  %result_from_other_lane = alloca i8, align 1
  %return_buffer = alloca i8, align 1
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca i8, align 1
  %reduction_input_address = alloca i8, align 1
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !348
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_2502_2 = load i8, ptr @465, align 1
  store i8 %constant_2502_2, ptr %partial_reduction_result, align 1
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !369
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = udiv i32 %thread.id.x, 2
  %thread.id.1 = urem i32 %1, 16
  %thread.id.2 = urem i32 %thread.id.x, 2
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 1, i32 16
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 16
  %tile_origin.2 = mul i32 %3, 2
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %8 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %8, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 16
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %9 = icmp uge i32 %loop2.indvar, 2
  br i1 %9, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 2
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %10 = add i32 %loop2.indvar, %thread.id.2
  %11 = icmp ult i32 %10, 2
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %concatenate.83.3.merge, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !375

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !376

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result8 = load i8, ptr %partial_reduction_result, align 1
  %12 = zext i8 %partial_reduction_result8 to i32
  %13 = bitcast i32 %12 to <1 x i32>
  %14 = extractelement <1 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 1, i32 31)
  %16 = insertelement <1 x i32> %13, i32 %15, i64 0
  %17 = bitcast <1 x i32> %16 to i32
  %18 = trunc i32 %17 to i8
  store i8 %18, ptr %result_from_other_lane, align 1
  call void @region_28_5076_5601061d6c30_7b687ac0855e3bbb(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer9)
  %19 = load i8, ptr %return_buffer9, align 1
  store i8 %19, ptr %partial_reduction_result, align 1
  %20 = udiv i32 %thread.id.2, 32
  %21 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %21, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %22 = add i32 %tile_origin.0, 0
  %23 = add i32 %tile_origin.1, %loop1.indvar
  %24 = add i32 %tile_origin.2, %10
  %constant_2482_3 = load i32, ptr @469, align 4
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %25 = phi i32 [ 0, %concatenate.pivot.0. ]
  %26 = sub nsw i32 %24, %25
  %param_1.8504 = load i64, ptr %arg1, align 8, !invariant.load !349
  %param_2.7095 = load i64, ptr %arg2, align 8, !invariant.load !349
  %27 = add i64 %param_1.8504, %param_2.7095
  %constant_2462_21 = load i64, ptr @467, align 8
  %28 = icmp eq i64 %constant_2462_21, 0
  %29 = icmp eq i64 %27, -9223372036854775808
  %30 = icmp eq i64 %constant_2462_21, -1
  %31 = and i1 %29, %30
  %32 = or i1 %31, %28
  %33 = select i1 %32, i64 1, i64 %constant_2462_21
  %34 = srem i64 %27, %33
  %35 = select i1 %31, i64 0, i64 %34
  %36 = select i1 %28, i64 %27, i64 %35
  %constant_2459_22 = load i64, ptr @468, align 8
  %37 = icmp slt i64 %36, %constant_2459_22
  %38 = zext i1 %37 to i8
  %constant_2459_222 = load i64, ptr @468, align 8
  %39 = icmp ne i64 %36, %constant_2459_222
  %40 = zext i1 %39 to i8
  %41 = and i8 %38, %40
  %constant_2462_213 = load i64, ptr @467, align 8
  %42 = add i64 %36, %constant_2462_213
  %43 = trunc i8 %41 to i1
  %44 = select i1 %43, i64 %42, i64 %36
  %constant_2459_224 = load i64, ptr @468, align 8
  %45 = icmp slt i64 %44, %constant_2459_224
  %46 = zext i1 %45 to i8
  %constant_2462_215 = load i64, ptr @467, align 8
  %47 = add i64 %44, %constant_2462_215
  %48 = trunc i8 %46 to i1
  %49 = select i1 %48, i64 %47, i64 %44
  %50 = trunc i64 %49 to i32
  br label %concatenate.83.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.6
  %51 = phi i32 [ 1, %concatenate.pivot.1.6 ]
  %52 = sub nsw i32 %24, %51
  %constant_2597_2 = load i32, ptr @466, align 4
  br label %concatenate.83.3.merge

concatenate.pivot.1.:                             ; preds = %x_in_tile-true
  %53 = icmp ult i32 %24, 1
  br i1 %53, label %concatenate.pivot.0., label %concatenate.pivot.1.6

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.6:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.83.3.merge:                           ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %54 = phi i32 [ %50, %concat_index_from_operand_id0 ], [ %constant_2597_2, %concat_index_from_operand_id1 ]
  %55 = icmp sle i32 %constant_2482_3, %54
  %56 = zext i1 %55 to i8
  %param_0.6150 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 %24
  %param_0.61507 = load i32, ptr %param_0.6150, align 4, !invariant.load !349
  %57 = icmp sge i32 %param_0.61507, %54
  %58 = zext i1 %57 to i8
  %59 = and i8 %56, %58
  store i8 %59, ptr %reduction_input_address, align 1
  call void @region_28_5076_5601061d6c30_7b687ac0855e3bbb(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %60 = load i8, ptr %return_buffer, align 1
  store i8 %60, ptr %partial_reduction_result, align 1
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %61 = and i32 %thread.id.2, 1
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %63 = add i32 %tile_origin.1, %thread.id.1
  %output = load i8, ptr %partial_reduction_result, align 1
  store i8 %output, ptr %arg3, align 1
  br label %reduction_write_output-after
}

define void @loop_dynamic_update_slice_fusion_218(ptr noalias align 128 dereferenceable(1600) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %param_4.4879 = load i64, ptr %arg4, align 8, !invariant.load !349
  %param_5.4003 = load i64, ptr %arg5, align 8, !invariant.load !349
  %0 = add i64 %param_4.4879, %param_5.4003
  %constant_2462_22 = load i64, ptr @471, align 8
  %1 = icmp eq i64 %constant_2462_22, 0
  %2 = icmp eq i64 %0, -9223372036854775808
  %3 = icmp eq i64 %constant_2462_22, -1
  %4 = and i1 %2, %3
  %5 = or i1 %4, %1
  %6 = select i1 %5, i64 1, i64 %constant_2462_22
  %7 = srem i64 %0, %6
  %8 = select i1 %4, i64 0, i64 %7
  %9 = select i1 %1, i64 %0, i64 %8
  %constant_2459_23 = load i64, ptr @472, align 8
  %10 = icmp slt i64 %9, %constant_2459_23
  %11 = zext i1 %10 to i8
  %constant_2459_231 = load i64, ptr @472, align 8
  %12 = icmp ne i64 %9, %constant_2459_231
  %13 = zext i1 %12 to i8
  %14 = and i8 %11, %13
  %constant_2462_222 = load i64, ptr @471, align 8
  %15 = add i64 %9, %constant_2462_222
  %16 = trunc i8 %14 to i1
  %17 = select i1 %16, i64 %15, i64 %9
  %constant_2459_233 = load i64, ptr @472, align 8
  %18 = icmp slt i64 %17, %constant_2459_233
  %19 = zext i1 %18 to i8
  %constant_2462_224 = load i64, ptr @471, align 8
  %20 = add i64 %17, %constant_2462_224
  %21 = trunc i8 %19 to i1
  %22 = select i1 %21, i64 %20, i64 %17
  %23 = trunc i64 %22 to i32
  %24 = icmp sge i32 0, %23
  %25 = select i1 %24, i32 0, i32 %23
  %26 = icmp sle i32 9, %25
  %27 = select i1 %26, i32 9, i32 %25
  %constant_2482_5 = load i32, ptr @470, align 4
  %28 = icmp sge i32 0, %constant_2482_5
  %29 = select i1 %28, i32 0, i32 %constant_2482_5
  %30 = icmp sle i32 0, %29
  %31 = select i1 %30, i32 0, i32 %29
  %32 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %32 to i64
  %33 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !351
  %thread_id_x = zext i32 %33 to i64
  %34 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %34, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %35 = udiv i64 %linear_index0, 1
  %36 = urem i64 %35, 20
  %37 = udiv i64 %linear_index0, 20
  %38 = icmp ult i64 %linear_index, 20
  br i1 %38, label %dynamic-update-slice.5739.1.in_bounds-true, label %dynamic-update-slice.5739.1.in_bounds-after

dynamic-update-slice.5739.1.in_bounds-after:      ; preds = %dynamic-update-slice.5739.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.5739.1.in_bounds-true:       ; preds = %entry
  %39 = sext i32 %27 to i64
  %40 = add i64 %39, %37
  %41 = sext i32 %31 to i64
  %42 = add i64 %41, %36
  %param_1.8472 = load i8, ptr %arg1, align 1, !invariant.load !349
  %43 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.7055 = getelementptr inbounds double, ptr %43, i64 0
  %param_2.70555 = load double, ptr %param_2.7055, align 8, !invariant.load !349
  %44 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.5749 = getelementptr inbounds double, ptr %44, i64 0
  %param_3.57496 = load double, ptr %param_3.5749, align 8, !invariant.load !349
  %subtract.883.2 = fsub double %param_2.70555, %param_3.57496
  %param_4.48797 = load i64, ptr %arg4, align 8, !invariant.load !349
  %param_5.40038 = load i64, ptr %arg5, align 8, !invariant.load !349
  %45 = add i64 %param_4.48797, %param_5.40038
  %constant_2462_229 = load i64, ptr @471, align 8
  %46 = icmp eq i64 %constant_2462_229, 0
  %47 = icmp eq i64 %45, -9223372036854775808
  %48 = icmp eq i64 %constant_2462_229, -1
  %49 = and i1 %47, %48
  %50 = or i1 %49, %46
  %51 = select i1 %50, i64 1, i64 %constant_2462_229
  %52 = srem i64 %45, %51
  %53 = select i1 %49, i64 0, i64 %52
  %54 = select i1 %46, i64 %45, i64 %53
  %constant_2459_2310 = load i64, ptr @472, align 8
  %55 = icmp slt i64 %54, %constant_2459_2310
  %56 = zext i1 %55 to i8
  %constant_2459_2311 = load i64, ptr @472, align 8
  %57 = icmp ne i64 %54, %constant_2459_2311
  %58 = zext i1 %57 to i8
  %59 = and i8 %56, %58
  %constant_2462_2212 = load i64, ptr @471, align 8
  %60 = add i64 %54, %constant_2462_2212
  %61 = trunc i8 %59 to i1
  %62 = select i1 %61, i64 %60, i64 %54
  %constant_2459_2313 = load i64, ptr @472, align 8
  %63 = icmp slt i64 %62, %constant_2459_2313
  %64 = zext i1 %63 to i8
  %constant_2462_2214 = load i64, ptr @471, align 8
  %65 = add i64 %62, %constant_2462_2214
  %66 = trunc i8 %64 to i1
  %67 = select i1 %66, i64 %65, i64 %62
  %68 = trunc i64 %67 to i32
  %69 = sext i32 %68 to i64
  %70 = icmp sge i64 0, %69
  %71 = select i1 %70, i64 0, i64 %69
  %72 = icmp sle i64 9, %71
  %dynamic-slice.5486.1.start_idx0 = select i1 %72, i64 9, i64 %71
  %constant_2482_515 = load i32, ptr @470, align 4
  %73 = sext i32 %constant_2482_515 to i64
  %74 = icmp sge i64 0, %73
  %75 = select i1 %74, i64 0, i64 %73
  %76 = icmp sle i64 0, %75
  %dynamic-slice.5486.1.start_idx1 = select i1 %76, i64 0, i64 %75
  %77 = add i64 %dynamic-slice.5486.1.start_idx0, %37
  %78 = add i64 %dynamic-slice.5486.1.start_idx1, %36
  %param_0.5657 = getelementptr inbounds [10 x [20 x double]], ptr %arg0, i64 0, i64 %77, i64 %78
  %param_0.565716 = load double, ptr %param_0.5657, align 8
  %79 = trunc i8 %param_1.8472 to i1
  %80 = select i1 %79, double %subtract.883.2, double %param_0.565716
  %81 = getelementptr inbounds [10 x [20 x double]], ptr %arg0, i64 0, i64 %40, i64 %42
  store double %80, ptr %81, align 8
  br label %dynamic-update-slice.5739.1.in_bounds-after
}

define void @loop_reduce_fusion_20(ptr noalias align 128 dereferenceable(1600) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(1600) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %return_buffer22 = alloca double, align 8
  %parameter_buffer21 = alloca double, align 8
  %parameter_buffer20 = alloca double, align 8
  %reduce.294.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_07 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer6 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.288.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.20.in_bounds-true, label %loop_reduce_fusion.20.in_bounds-after

loop_reduce_fusion.20.in_bounds-after:            ; preds = %reduce.294.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.20.in_bounds-true:             ; preds = %entry
  %constant_2461_41 = load double, ptr @473, align 8
  store double %constant_2461_41, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.288.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.288.1.inner.loop_header.reduction_dim.0

reduce.288.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.288.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.20.in_bounds-true
  %reduce.288.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.288.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.288.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.288.1.inner.loop_exit.reduction_dim.0, label %reduce.288.1.inner.loop_body.reduction_dim.0

reduce.288.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.288.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = load i64, ptr %arg1, align 8, !invariant.load !349
  %7 = load i64, ptr %arg2, align 8, !invariant.load !349
  %8 = add i64 %6, %7
  %constant_2462_10 = load i64, ptr @475, align 8
  %9 = icmp eq i64 %constant_2462_10, 0
  %10 = icmp eq i64 %8, -9223372036854775808
  %11 = icmp eq i64 %constant_2462_10, -1
  %12 = and i1 %10, %11
  %13 = or i1 %12, %9
  %14 = select i1 %13, i64 1, i64 %constant_2462_10
  %15 = srem i64 %8, %14
  %16 = select i1 %12, i64 0, i64 %15
  %17 = select i1 %9, i64 %8, i64 %16
  %constant_2459_8 = load i64, ptr @474, align 8
  %18 = icmp slt i64 %17, %constant_2459_8
  %19 = zext i1 %18 to i8
  %constant_2459_81 = load i64, ptr @474, align 8
  %20 = icmp ne i64 %17, %constant_2459_81
  %21 = zext i1 %20 to i8
  %22 = and i8 %19, %21
  %constant_2462_102 = load i64, ptr @475, align 8
  %23 = add i64 %17, %constant_2462_102
  %24 = trunc i8 %22 to i1
  %25 = select i1 %24, i64 %23, i64 %17
  %constant_2459_83 = load i64, ptr @474, align 8
  %26 = icmp slt i64 %25, %constant_2459_83
  %27 = zext i1 %26 to i8
  %constant_2462_104 = load i64, ptr @475, align 8
  %28 = add i64 %25, %constant_2462_104
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, i64 %28, i64 %25
  %31 = trunc i64 %30 to i32
  %32 = icmp sge i32 0, %31
  %33 = select i1 %32, i32 0, i32 %31
  %34 = icmp sle i32 9, %33
  %dynamic-slice.5499.4.start_idx0 = select i1 %34, i32 9, i32 %33
  %constant_2459_85 = load i64, ptr @474, align 8
  %35 = trunc i64 %constant_2459_85 to i32
  %36 = icmp sge i32 0, %35
  %37 = select i1 %36, i32 0, i32 %35
  %38 = icmp sle i32 0, %37
  %dynamic-slice.5499.4.start_idx1 = select i1 %38, i32 0, i32 %37
  %39 = add i32 %dynamic-slice.5499.4.start_idx0, 0
  %40 = add i32 %dynamic-slice.5499.4.start_idx1, %reduce.288.1.inner.indvar.reduction_dim.0
  %41 = getelementptr inbounds [10 x [20 x double]], ptr %arg0, i32 0, i32 %39, i32 %40
  %42 = load double, ptr %41, align 8, !invariant.load !349
  %multiply.11935.3 = fmul double %42, %42
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11935.3, ptr %parameter_buffer6, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer6, ptr %return_buffer)
  %43 = load double, ptr %return_buffer, align 8
  store double %43, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.288.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.288.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.288.1.inner.loop_header.reduction_dim.0

reduce.288.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.288.1.inner.loop_header.reduction_dim.0
  %44 = load double, ptr %accumulator_0, align 8
  %45 = insertvalue { double, double } undef, double %44, 0
  %constant_2461_418 = load double, ptr @473, align 8
  store double %constant_2461_418, ptr %accumulator_07, align 8
  store i32 0, ptr %reduce.294.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.294.1.clone.1.inner.loop_header.reduction_dim.0

reduce.294.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.294.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.288.1.inner.loop_exit.reduction_dim.0
  %reduce.294.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.294.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %46 = icmp uge i32 %reduce.294.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %46, label %reduce.294.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.294.1.clone.1.inner.loop_body.reduction_dim.0

reduce.294.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.294.1.clone.1.inner.loop_header.reduction_dim.0
  %47 = load double, ptr %accumulator_07, align 8
  %48 = load i64, ptr %arg1, align 8, !invariant.load !349
  %49 = load i64, ptr %arg2, align 8, !invariant.load !349
  %50 = add i64 %48, %49
  %constant_2462_1010 = load i64, ptr @475, align 8
  %51 = icmp eq i64 %constant_2462_1010, 0
  %52 = icmp eq i64 %50, -9223372036854775808
  %53 = icmp eq i64 %constant_2462_1010, -1
  %54 = and i1 %52, %53
  %55 = or i1 %54, %51
  %56 = select i1 %55, i64 1, i64 %constant_2462_1010
  %57 = srem i64 %50, %56
  %58 = select i1 %54, i64 0, i64 %57
  %59 = select i1 %51, i64 %50, i64 %58
  %constant_2459_811 = load i64, ptr @474, align 8
  %60 = icmp slt i64 %59, %constant_2459_811
  %61 = zext i1 %60 to i8
  %constant_2459_812 = load i64, ptr @474, align 8
  %62 = icmp ne i64 %59, %constant_2459_812
  %63 = zext i1 %62 to i8
  %64 = and i8 %61, %63
  %constant_2462_1013 = load i64, ptr @475, align 8
  %65 = add i64 %59, %constant_2462_1013
  %66 = trunc i8 %64 to i1
  %67 = select i1 %66, i64 %65, i64 %59
  %constant_2459_814 = load i64, ptr @474, align 8
  %68 = icmp slt i64 %67, %constant_2459_814
  %69 = zext i1 %68 to i8
  %constant_2462_1015 = load i64, ptr @475, align 8
  %70 = add i64 %67, %constant_2462_1015
  %71 = trunc i8 %69 to i1
  %72 = select i1 %71, i64 %70, i64 %67
  %73 = trunc i64 %72 to i32
  %74 = icmp sge i32 0, %73
  %75 = select i1 %74, i32 0, i32 %73
  %76 = icmp sle i32 9, %75
  %dynamic-slice.5499.4.start_idx016 = select i1 %76, i32 9, i32 %75
  %constant_2459_817 = load i64, ptr @474, align 8
  %77 = trunc i64 %constant_2459_817 to i32
  %78 = icmp sge i32 0, %77
  %79 = select i1 %78, i32 0, i32 %77
  %80 = icmp sle i32 0, %79
  %dynamic-slice.5499.4.start_idx118 = select i1 %80, i32 0, i32 %79
  %81 = add i32 %dynamic-slice.5499.4.start_idx016, 0
  %82 = add i32 %dynamic-slice.5499.4.start_idx118, %reduce.294.1.clone.1.inner.indvar.reduction_dim.0
  %83 = getelementptr inbounds [10 x [20 x double]], ptr %arg0, i32 0, i32 %81, i32 %82
  %84 = load double, ptr %83, align 8, !invariant.load !349
  %85 = trunc i64 %72 to i32
  %86 = icmp sge i32 0, %85
  %87 = select i1 %86, i32 0, i32 %85
  %88 = icmp sle i32 9, %87
  %dynamic-slice.5505.3.clone.1.start_idx0 = select i1 %88, i32 9, i32 %87
  %constant_2459_819 = load i64, ptr @474, align 8
  %89 = trunc i64 %constant_2459_819 to i32
  %90 = icmp sge i32 0, %89
  %91 = select i1 %90, i32 0, i32 %89
  %92 = icmp sle i32 0, %91
  %dynamic-slice.5505.3.clone.1.start_idx1 = select i1 %92, i32 0, i32 %91
  %93 = add i32 %dynamic-slice.5505.3.clone.1.start_idx0, 0
  %94 = add i32 %dynamic-slice.5505.3.clone.1.start_idx1, %reduce.294.1.clone.1.inner.indvar.reduction_dim.0
  %95 = getelementptr inbounds [10 x [20 x double]], ptr %arg3, i32 0, i32 %93, i32 %94
  %96 = load double, ptr %95, align 8, !invariant.load !349
  %multiply.11941.3.clone.1 = fmul double %84, %96
  store double %47, ptr %parameter_buffer20, align 8
  store double %multiply.11941.3.clone.1, ptr %parameter_buffer21, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer20, ptr %parameter_buffer21, ptr %return_buffer22)
  %97 = load double, ptr %return_buffer22, align 8
  store double %97, ptr %accumulator_07, align 8
  %invar.inc9 = add nuw nsw i32 %reduce.294.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc9, ptr %reduce.294.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.294.1.clone.1.inner.loop_header.reduction_dim.0

reduce.294.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.294.1.clone.1.inner.loop_header.reduction_dim.0
  %98 = load double, ptr %accumulator_07, align 8
  %99 = insertvalue { double, double } %45, double %98, 1
  %100 = extractvalue { double, double } %99, 0
  store double %100, ptr %arg4, align 8
  %101 = extractvalue { double, double } %99, 1
  store double %101, ptr %arg5, align 8
  br label %loop_reduce_fusion.20.in_bounds-after
}

define void @loop_add_fusion_37(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(1600) %arg5, ptr noalias align 16 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer6 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.287.11.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.37.in_bounds-true, label %loop_add_fusion.37.in_bounds-after

loop_add_fusion.37.in_bounds-after:               ; preds = %reduce.287.11.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_add_fusion.37.in_bounds-true:                ; preds = %entry
  %constant_2461_34 = load double, ptr @476, align 8
  store double %constant_2461_34, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.287.11.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.287.11.inner.loop_header.reduction_dim.0

reduce.287.11.inner.loop_header.reduction_dim.0:  ; preds = %reduce.287.11.inner.loop_body.reduction_dim.0, %loop_add_fusion.37.in_bounds-true
  %reduce.287.11.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.287.11.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.287.11.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.287.11.inner.loop_exit.reduction_dim.0, label %reduce.287.11.inner.loop_body.reduction_dim.0

reduce.287.11.inner.loop_body.reduction_dim.0:    ; preds = %reduce.287.11.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = load i64, ptr %arg6, align 8, !invariant.load !349
  %7 = load i64, ptr %arg7, align 8, !invariant.load !349
  %8 = add i64 %6, %7
  %constant_2462_9 = load i64, ptr @478, align 8
  %9 = icmp eq i64 %constant_2462_9, 0
  %10 = icmp eq i64 %8, -9223372036854775808
  %11 = icmp eq i64 %constant_2462_9, -1
  %12 = and i1 %10, %11
  %13 = or i1 %12, %9
  %14 = select i1 %13, i64 1, i64 %constant_2462_9
  %15 = srem i64 %8, %14
  %16 = select i1 %12, i64 0, i64 %15
  %17 = select i1 %9, i64 %8, i64 %16
  %constant_2459_1 = load i64, ptr @477, align 8
  %18 = icmp slt i64 %17, %constant_2459_1
  %19 = zext i1 %18 to i8
  %constant_2459_11 = load i64, ptr @477, align 8
  %20 = icmp ne i64 %17, %constant_2459_11
  %21 = zext i1 %20 to i8
  %22 = and i8 %19, %21
  %constant_2462_92 = load i64, ptr @478, align 8
  %23 = add i64 %17, %constant_2462_92
  %24 = trunc i8 %22 to i1
  %25 = select i1 %24, i64 %23, i64 %17
  %constant_2459_13 = load i64, ptr @477, align 8
  %26 = icmp slt i64 %25, %constant_2459_13
  %27 = zext i1 %26 to i8
  %constant_2462_94 = load i64, ptr @478, align 8
  %28 = add i64 %25, %constant_2462_94
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, i64 %28, i64 %25
  %31 = trunc i64 %30 to i32
  %32 = icmp sge i32 0, %31
  %33 = select i1 %32, i32 0, i32 %31
  %34 = icmp sle i32 9, %33
  %dynamic-slice.5498.4.start_idx0 = select i1 %34, i32 9, i32 %33
  %constant_2459_15 = load i64, ptr @477, align 8
  %35 = trunc i64 %constant_2459_15 to i32
  %36 = icmp sge i32 0, %35
  %37 = select i1 %36, i32 0, i32 %35
  %38 = icmp sle i32 0, %37
  %dynamic-slice.5498.4.start_idx1 = select i1 %38, i32 0, i32 %37
  %39 = add i32 %dynamic-slice.5498.4.start_idx0, 0
  %40 = add i32 %dynamic-slice.5498.4.start_idx1, %reduce.287.11.inner.indvar.reduction_dim.0
  %41 = getelementptr inbounds [10 x [20 x double]], ptr %arg5, i32 0, i32 %39, i32 %40
  %42 = load double, ptr %41, align 8, !invariant.load !349
  %multiply.11934.3 = fmul double %42, %42
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11934.3, ptr %parameter_buffer6, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer6, ptr %return_buffer)
  %43 = load double, ptr %return_buffer, align 8
  store double %43, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.287.11.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.287.11.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.287.11.inner.loop_header.reduction_dim.0

reduce.287.11.inner.loop_exit.reduction_dim.0:    ; preds = %reduce.287.11.inner.loop_header.reduction_dim.0
  %44 = load double, ptr %accumulator_0, align 8
  %45 = load double, ptr %arg4, align 8, !invariant.load !349
  %add.10073.9 = fadd double %44, %45
  %46 = load double, ptr %arg3, align 8, !invariant.load !349
  %add.10074.7 = fadd double %add.10073.9, %46
  %47 = load double, ptr %arg2, align 8, !invariant.load !349
  %add.10075.5 = fadd double %add.10074.7, %47
  %48 = load double, ptr %arg1, align 8, !invariant.load !349
  %add.10076.3 = fadd double %add.10075.5, %48
  %49 = load double, ptr %arg0, align 8
  %add.10077.1 = fadd double %add.10076.3, %49
  store double %add.10077.1, ptr %arg0, align 8
  br label %loop_add_fusion.37.in_bounds-after
}

define void @loop_select_fusion_30(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(1600) %arg6, ptr noalias align 128 dereferenceable(1600) %arg7, ptr noalias align 16 dereferenceable(8) %arg8, ptr noalias align 128 dereferenceable(8) %arg9) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer8 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.293.15.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.30.in_bounds-true, label %loop_select_fusion.30.in_bounds-after

loop_select_fusion.30.in_bounds-after:            ; preds = %reduce.293.15.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_select_fusion.30.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !349
  %constant_2461_10 = load double, ptr @480, align 8
  %compare.2762.1 = fcmp ogt double %4, %constant_2461_10
  %5 = zext i1 %compare.2762.1 to i8
  %constant_2461_101 = load double, ptr @480, align 8
  store double %constant_2461_101, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.293.15.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.293.15.inner.loop_header.reduction_dim.0

reduce.293.15.inner.loop_header.reduction_dim.0:  ; preds = %reduce.293.15.inner.loop_body.reduction_dim.0, %loop_select_fusion.30.in_bounds-true
  %reduce.293.15.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.293.15.inner.invar_address.reduction_dim.0, align 4
  %6 = icmp uge i32 %reduce.293.15.inner.indvar.reduction_dim.0, 20
  br i1 %6, label %reduce.293.15.inner.loop_exit.reduction_dim.0, label %reduce.293.15.inner.loop_body.reduction_dim.0

reduce.293.15.inner.loop_body.reduction_dim.0:    ; preds = %reduce.293.15.inner.loop_header.reduction_dim.0
  %7 = load double, ptr %accumulator_0, align 8
  %8 = load i64, ptr %arg8, align 8, !invariant.load !349
  %9 = load i64, ptr %arg9, align 8, !invariant.load !349
  %10 = add i64 %8, %9
  %constant_2462_8 = load i64, ptr @482, align 8
  %11 = icmp eq i64 %constant_2462_8, 0
  %12 = icmp eq i64 %10, -9223372036854775808
  %13 = icmp eq i64 %constant_2462_8, -1
  %14 = and i1 %12, %13
  %15 = or i1 %14, %11
  %16 = select i1 %15, i64 1, i64 %constant_2462_8
  %17 = srem i64 %10, %16
  %18 = select i1 %14, i64 0, i64 %17
  %19 = select i1 %11, i64 %10, i64 %18
  %constant_2459_13 = load i64, ptr @481, align 8
  %20 = icmp slt i64 %19, %constant_2459_13
  %21 = zext i1 %20 to i8
  %constant_2459_132 = load i64, ptr @481, align 8
  %22 = icmp ne i64 %19, %constant_2459_132
  %23 = zext i1 %22 to i8
  %24 = and i8 %21, %23
  %constant_2462_83 = load i64, ptr @482, align 8
  %25 = add i64 %19, %constant_2462_83
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %19
  %constant_2459_134 = load i64, ptr @481, align 8
  %28 = icmp slt i64 %27, %constant_2459_134
  %29 = zext i1 %28 to i8
  %constant_2462_85 = load i64, ptr @482, align 8
  %30 = add i64 %27, %constant_2462_85
  %31 = trunc i8 %29 to i1
  %32 = select i1 %31, i64 %30, i64 %27
  %33 = trunc i64 %32 to i32
  %34 = icmp sge i32 0, %33
  %35 = select i1 %34, i32 0, i32 %33
  %36 = icmp sle i32 9, %35
  %dynamic-slice.5498.6.start_idx0 = select i1 %36, i32 9, i32 %35
  %constant_2459_136 = load i64, ptr @481, align 8
  %37 = trunc i64 %constant_2459_136 to i32
  %38 = icmp sge i32 0, %37
  %39 = select i1 %38, i32 0, i32 %37
  %40 = icmp sle i32 0, %39
  %dynamic-slice.5498.6.start_idx1 = select i1 %40, i32 0, i32 %39
  %41 = add i32 %dynamic-slice.5498.6.start_idx0, 0
  %42 = add i32 %dynamic-slice.5498.6.start_idx1, %reduce.293.15.inner.indvar.reduction_dim.0
  %43 = getelementptr inbounds [10 x [20 x double]], ptr %arg7, i32 0, i32 %41, i32 %42
  %44 = load double, ptr %43, align 8, !invariant.load !349
  %45 = trunc i64 %32 to i32
  %46 = icmp sge i32 0, %45
  %47 = select i1 %46, i32 0, i32 %45
  %48 = icmp sle i32 9, %47
  %dynamic-slice.5504.3.start_idx0 = select i1 %48, i32 9, i32 %47
  %constant_2459_137 = load i64, ptr @481, align 8
  %49 = trunc i64 %constant_2459_137 to i32
  %50 = icmp sge i32 0, %49
  %51 = select i1 %50, i32 0, i32 %49
  %52 = icmp sle i32 0, %51
  %dynamic-slice.5504.3.start_idx1 = select i1 %52, i32 0, i32 %51
  %53 = add i32 %dynamic-slice.5504.3.start_idx0, 0
  %54 = add i32 %dynamic-slice.5504.3.start_idx1, %reduce.293.15.inner.indvar.reduction_dim.0
  %55 = getelementptr inbounds [10 x [20 x double]], ptr %arg6, i32 0, i32 %53, i32 %54
  %56 = load double, ptr %55, align 8, !invariant.load !349
  %multiply.11940.3 = fmul double %44, %56
  store double %7, ptr %parameter_buffer, align 8
  store double %multiply.11940.3, ptr %parameter_buffer8, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer8, ptr %return_buffer)
  %57 = load double, ptr %return_buffer, align 8
  store double %57, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.293.15.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.293.15.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.293.15.inner.loop_header.reduction_dim.0

reduce.293.15.inner.loop_exit.reduction_dim.0:    ; preds = %reduce.293.15.inner.loop_header.reduction_dim.0
  %58 = load double, ptr %accumulator_0, align 8
  %59 = load double, ptr %arg5, align 8, !invariant.load !349
  %add.10078.13 = fadd double %58, %59
  %60 = load double, ptr %arg4, align 8, !invariant.load !349
  %add.10079.11 = fadd double %add.10078.13, %60
  %61 = load double, ptr %arg3, align 8, !invariant.load !349
  %add.10080.9 = fadd double %add.10079.11, %61
  %62 = load double, ptr %arg2, align 8
  %add.10081.7 = fadd double %add.10080.9, %62
  %63 = load double, ptr %arg1, align 8, !invariant.load !349
  %add.10082.5 = fadd double %add.10081.7, %63
  %64 = load double, ptr %arg0, align 8, !invariant.load !349
  %divide.2568.3 = fdiv double %add.10082.5, %64
  %constant_2470_8 = load double, ptr @479, align 8
  %65 = trunc i8 %5 to i1
  %66 = select i1 %65, double %divide.2568.3, double %constant_2470_8
  store double %66, ptr %arg2, align 8
  br label %loop_select_fusion.30.in_bounds-after
}

define void @loop_reduce_fusion_24(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %return_buffer7 = alloca double, align 8
  %parameter_buffer6 = alloca double, align 8
  %parameter_buffer5 = alloca double, align 8
  %reduce.282.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.262.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.24.in_bounds-true, label %loop_reduce_fusion.24.in_bounds-after

loop_reduce_fusion.24.in_bounds-after:            ; preds = %reduce.282.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.24.in_bounds-true:             ; preds = %entry
  %constant_2461_42 = load double, ptr @483, align 8
  store double %constant_2461_42, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.262.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.262.1.inner.loop_header.reduction_dim.0

reduce.262.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.262.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.24.in_bounds-true
  %reduce.262.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.262.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.262.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.262.1.inner.loop_exit.reduction_dim.0, label %reduce.262.1.inner.loop_body.reduction_dim.0

reduce.262.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.262.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.262.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !349
  %8 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.262.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !349
  %multiply.11923.1 = fmul double %7, %9
  store double %5, ptr %parameter_buffer, align 8
  store double %multiply.11923.1, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %10 = load double, ptr %return_buffer, align 8
  store double %10, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.262.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.262.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.262.1.inner.loop_header.reduction_dim.0

reduce.262.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.262.1.inner.loop_header.reduction_dim.0
  %11 = load double, ptr %accumulator_0, align 8
  %12 = insertvalue { double, double } undef, double %11, 0
  %constant_2461_423 = load double, ptr @483, align 8
  store double %constant_2461_423, ptr %accumulator_02, align 8
  store i32 0, ptr %reduce.282.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.282.1.clone.1.inner.loop_header.reduction_dim.0

reduce.282.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.282.1.clone.1.inner.loop_body.reduction_dim.0, %reduce.262.1.inner.loop_exit.reduction_dim.0
  %reduce.282.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.282.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %13 = icmp uge i32 %reduce.282.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %13, label %reduce.282.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.282.1.clone.1.inner.loop_body.reduction_dim.0

reduce.282.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.282.1.clone.1.inner.loop_header.reduction_dim.0
  %14 = load double, ptr %accumulator_02, align 8
  %15 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %reduce.282.1.clone.1.inner.indvar.reduction_dim.0
  %16 = load double, ptr %15, align 8, !invariant.load !349
  %17 = getelementptr inbounds [20 x double], ptr %arg3, i32 0, i32 %reduce.282.1.clone.1.inner.indvar.reduction_dim.0
  %18 = load double, ptr %17, align 8, !invariant.load !349
  %subtract.883.4.clone.1 = fsub double %16, %18
  %19 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.282.1.clone.1.inner.indvar.reduction_dim.0
  %20 = load double, ptr %19, align 8, !invariant.load !349
  %21 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %reduce.282.1.clone.1.inner.indvar.reduction_dim.0
  %22 = load double, ptr %21, align 8, !invariant.load !349
  %subtract.889.4.clone.1 = fsub double %20, %22
  %multiply.11929.3.clone.1 = fmul double %subtract.883.4.clone.1, %subtract.889.4.clone.1
  store double %14, ptr %parameter_buffer5, align 8
  store double %multiply.11929.3.clone.1, ptr %parameter_buffer6, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer5, ptr %parameter_buffer6, ptr %return_buffer7)
  %23 = load double, ptr %return_buffer7, align 8
  store double %23, ptr %accumulator_02, align 8
  %invar.inc4 = add nuw nsw i32 %reduce.282.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.282.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.282.1.clone.1.inner.loop_header.reduction_dim.0

reduce.282.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.282.1.clone.1.inner.loop_header.reduction_dim.0
  %24 = load double, ptr %accumulator_02, align 8
  %25 = insertvalue { double, double } %12, double %24, 1
  %26 = extractvalue { double, double } %25, 0
  store double %26, ptr %arg4, align 8
  %27 = extractvalue { double, double } %25, 1
  store double %27, ptr %arg5, align 8
  br label %loop_reduce_fusion.24.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_229(ptr noalias align 128 dereferenceable(80) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 16 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(8) %arg7, ptr noalias align 128 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(160) %arg11) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer19 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.286.1.inner.invar_address.reduction_dim.0 = alloca i64, align 8
  %accumulator_0 = alloca double, align 8
  %param_6.3214 = load i64, ptr %arg6, align 8, !invariant.load !349
  %param_7.2476 = load i64, ptr %arg7, align 8, !invariant.load !349
  %0 = add i64 %param_6.3214, %param_7.2476
  %constant_2462_18 = load i64, ptr @484, align 8
  %1 = icmp eq i64 %constant_2462_18, 0
  %2 = icmp eq i64 %0, -9223372036854775808
  %3 = icmp eq i64 %constant_2462_18, -1
  %4 = and i1 %2, %3
  %5 = or i1 %4, %1
  %6 = select i1 %5, i64 1, i64 %constant_2462_18
  %7 = srem i64 %0, %6
  %8 = select i1 %4, i64 0, i64 %7
  %9 = select i1 %1, i64 %0, i64 %8
  %constant_2459_19 = load i64, ptr @485, align 8
  %10 = icmp slt i64 %9, %constant_2459_19
  %11 = zext i1 %10 to i8
  %constant_2459_191 = load i64, ptr @485, align 8
  %12 = icmp ne i64 %9, %constant_2459_191
  %13 = zext i1 %12 to i8
  %14 = and i8 %11, %13
  %constant_2462_182 = load i64, ptr @484, align 8
  %15 = add i64 %9, %constant_2462_182
  %16 = trunc i8 %14 to i1
  %17 = select i1 %16, i64 %15, i64 %9
  %constant_2459_193 = load i64, ptr @485, align 8
  %18 = icmp slt i64 %17, %constant_2459_193
  %19 = zext i1 %18 to i8
  %constant_2462_184 = load i64, ptr @484, align 8
  %20 = add i64 %17, %constant_2462_184
  %21 = trunc i8 %19 to i1
  %22 = select i1 %21, i64 %20, i64 %17
  %23 = trunc i64 %22 to i32
  %24 = icmp sge i32 0, %23
  %25 = select i1 %24, i32 0, i32 %23
  %26 = icmp sle i32 9, %25
  %27 = select i1 %26, i32 9, i32 %25
  %28 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %block_id = zext i32 %28 to i64
  %29 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %thread_id_x = zext i32 %29 to i64
  %30 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %30, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %31 = udiv i64 %linear_index0, 1
  %32 = icmp ult i64 %linear_index, 1
  br i1 %32, label %dynamic-update-slice.5750.1.in_bounds-true, label %dynamic-update-slice.5750.1.in_bounds-after

dynamic-update-slice.5750.1.in_bounds-after:      ; preds = %reduce.286.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

dynamic-update-slice.5750.1.in_bounds-true:       ; preds = %entry
  %33 = sext i32 %27 to i64
  %34 = add i64 %33, %31
  %35 = getelementptr i32, ptr @489, i64 %linear_index
  %constant_2597_1 = getelementptr inbounds i32, ptr %35, i64 0
  %constant_2597_15 = load i32, ptr %constant_2597_1, align 4
  %param_6.32146 = load i64, ptr %arg6, align 8, !invariant.load !349
  %param_7.24767 = load i64, ptr %arg7, align 8, !invariant.load !349
  %36 = add i64 %param_6.32146, %param_7.24767
  %constant_2462_188 = load i64, ptr @484, align 8
  %37 = icmp eq i64 %constant_2462_188, 0
  %38 = icmp eq i64 %36, -9223372036854775808
  %39 = icmp eq i64 %constant_2462_188, -1
  %40 = and i1 %38, %39
  %41 = or i1 %40, %37
  %42 = select i1 %41, i64 1, i64 %constant_2462_188
  %43 = srem i64 %36, %42
  %44 = select i1 %40, i64 0, i64 %43
  %45 = select i1 %37, i64 %36, i64 %44
  %constant_2459_199 = load i64, ptr @485, align 8
  %46 = icmp slt i64 %45, %constant_2459_199
  %47 = zext i1 %46 to i8
  %constant_2459_1910 = load i64, ptr @485, align 8
  %48 = icmp ne i64 %45, %constant_2459_1910
  %49 = zext i1 %48 to i8
  %50 = and i8 %47, %49
  %constant_2462_1811 = load i64, ptr @484, align 8
  %51 = add i64 %45, %constant_2462_1811
  %52 = trunc i8 %50 to i1
  %53 = select i1 %52, i64 %51, i64 %45
  %constant_2459_1912 = load i64, ptr @485, align 8
  %54 = icmp slt i64 %53, %constant_2459_1912
  %55 = zext i1 %54 to i8
  %constant_2462_1813 = load i64, ptr @484, align 8
  %56 = add i64 %53, %constant_2462_1813
  %57 = trunc i8 %55 to i1
  %58 = select i1 %57, i64 %56, i64 %53
  %59 = trunc i64 %58 to i32
  %60 = icmp sle i32 %constant_2597_15, %59
  %61 = zext i1 %60 to i8
  %62 = getelementptr i32, ptr @488, i64 %linear_index
  %constant_2736_1 = getelementptr inbounds i32, ptr %62, i64 0
  %constant_2736_114 = load i32, ptr %constant_2736_1, align 4
  %63 = icmp sge i32 %constant_2736_114, %59
  %64 = zext i1 %63 to i8
  %65 = and i8 %61, %64
  %param_4.4920 = load double, ptr %arg4, align 8, !invariant.load !349
  %param_5.4032 = load double, ptr %arg5, align 8, !invariant.load !349
  %add.10068.1 = fadd double %param_4.4920, %param_5.4032
  %param_3.5793 = load double, ptr %arg3, align 8, !invariant.load !349
  %add.10069.1 = fadd double %add.10068.1, %param_3.5793
  %param_2.7096 = load double, ptr %arg2, align 8, !invariant.load !349
  %add.10070.1 = fadd double %add.10069.1, %param_2.7096
  %param_1.8505 = load double, ptr %arg1, align 8, !invariant.load !349
  %add.10071.1 = fadd double %add.10070.1, %param_1.8505
  %constant_2461_15 = load double, ptr @486, align 8
  store double %constant_2461_15, ptr %accumulator_0, align 8
  store i64 0, ptr %reduce.286.1.inner.invar_address.reduction_dim.0, align 8
  br label %reduce.286.1.inner.loop_header.reduction_dim.0

reduce.286.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.286.1.inner.loop_body.reduction_dim.0, %dynamic-update-slice.5750.1.in_bounds-true
  %reduce.286.1.inner.indvar.reduction_dim.0 = load i64, ptr %reduce.286.1.inner.invar_address.reduction_dim.0, align 8
  %66 = icmp uge i64 %reduce.286.1.inner.indvar.reduction_dim.0, 20
  br i1 %66, label %reduce.286.1.inner.loop_exit.reduction_dim.0, label %reduce.286.1.inner.loop_body.reduction_dim.0

reduce.286.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.286.1.inner.loop_header.reduction_dim.0
  %67 = load double, ptr %accumulator_0, align 8
  %param_10.1296 = getelementptr inbounds [20 x double], ptr %arg10, i64 0, i64 %reduce.286.1.inner.indvar.reduction_dim.0
  %param_10.129615 = load double, ptr %param_10.1296, align 8, !invariant.load !349
  %param_11.1094 = getelementptr inbounds [20 x double], ptr %arg11, i64 0, i64 %reduce.286.1.inner.indvar.reduction_dim.0
  %param_11.109416 = load double, ptr %param_11.1094, align 8, !invariant.load !349
  %subtract.887.4 = fsub double %param_10.129615, %param_11.109416
  %param_8.1884 = getelementptr inbounds [20 x double], ptr %arg8, i64 0, i64 %reduce.286.1.inner.indvar.reduction_dim.0
  %param_8.188417 = load double, ptr %param_8.1884, align 8, !invariant.load !349
  %param_9.1625 = getelementptr inbounds [20 x double], ptr %arg9, i64 0, i64 %reduce.286.1.inner.indvar.reduction_dim.0
  %param_9.162518 = load double, ptr %param_9.1625, align 8, !invariant.load !349
  %subtract.893.4 = fsub double %param_8.188417, %param_9.162518
  %multiply.11933.3 = fmul double %subtract.887.4, %subtract.893.4
  store double %67, ptr %parameter_buffer, align 8
  store double %multiply.11933.3, ptr %parameter_buffer19, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer19, ptr %return_buffer)
  %68 = load double, ptr %return_buffer, align 8
  store double %68, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i64 %reduce.286.1.inner.indvar.reduction_dim.0, 1
  store i64 %invar.inc, ptr %reduce.286.1.inner.invar_address.reduction_dim.0, align 8
  br label %reduce.286.1.inner.loop_header.reduction_dim.0

reduce.286.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.286.1.inner.loop_header.reduction_dim.0
  %69 = load double, ptr %accumulator_0, align 8
  %add.10072.1 = fadd double %add.10071.1, %69
  %constant_2461_1520 = load double, ptr @486, align 8
  %compare.2761.1 = fcmp oeq double %add.10072.1, %constant_2461_1520
  %70 = zext i1 %compare.2761.1 to i8
  %constant_2461_1521 = load double, ptr @486, align 8
  %constant_2470_7 = load double, ptr @487, align 8
  %divide.2567.1 = fdiv double %constant_2470_7, %add.10072.1
  %71 = trunc i8 %70 to i1
  %72 = select i1 %71, double %constant_2461_1521, double %divide.2567.1
  %param_6.321422 = load i64, ptr %arg6, align 8, !invariant.load !349
  %param_7.247623 = load i64, ptr %arg7, align 8, !invariant.load !349
  %73 = add i64 %param_6.321422, %param_7.247623
  %constant_2462_1824 = load i64, ptr @484, align 8
  %74 = icmp eq i64 %constant_2462_1824, 0
  %75 = icmp eq i64 %73, -9223372036854775808
  %76 = icmp eq i64 %constant_2462_1824, -1
  %77 = and i1 %75, %76
  %78 = or i1 %77, %74
  %79 = select i1 %78, i64 1, i64 %constant_2462_1824
  %80 = srem i64 %73, %79
  %81 = select i1 %77, i64 0, i64 %80
  %82 = select i1 %74, i64 %73, i64 %81
  %constant_2459_1925 = load i64, ptr @485, align 8
  %83 = icmp slt i64 %82, %constant_2459_1925
  %84 = zext i1 %83 to i8
  %constant_2459_1926 = load i64, ptr @485, align 8
  %85 = icmp ne i64 %82, %constant_2459_1926
  %86 = zext i1 %85 to i8
  %87 = and i8 %84, %86
  %constant_2462_1827 = load i64, ptr @484, align 8
  %88 = add i64 %82, %constant_2462_1827
  %89 = trunc i8 %87 to i1
  %90 = select i1 %89, i64 %88, i64 %82
  %constant_2459_1928 = load i64, ptr @485, align 8
  %91 = icmp slt i64 %90, %constant_2459_1928
  %92 = zext i1 %91 to i8
  %constant_2462_1829 = load i64, ptr @484, align 8
  %93 = add i64 %90, %constant_2462_1829
  %94 = trunc i8 %92 to i1
  %95 = select i1 %94, i64 %93, i64 %90
  %96 = trunc i64 %95 to i32
  %97 = sext i32 %96 to i64
  %98 = icmp sge i64 0, %97
  %99 = select i1 %98, i64 0, i64 %97
  %100 = icmp sle i64 9, %99
  %dynamic-slice.5497.1.start_idx0 = select i1 %100, i64 9, i64 %99
  %101 = add i64 %dynamic-slice.5497.1.start_idx0, %31
  %param_0.5771 = getelementptr inbounds [10 x double], ptr %arg0, i64 0, i64 %101
  %param_0.577130 = load double, ptr %param_0.5771, align 8
  %102 = trunc i8 %65 to i1
  %103 = select i1 %102, double %72, double %param_0.577130
  %104 = getelementptr inbounds [10 x double], ptr %arg0, i64 0, i64 %34
  store double %103, ptr %104, align 8
  br label %dynamic-update-slice.5750.1.in_bounds-after
}

define void @loop_sqrt_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(160) %arg5) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.266.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_sqrt_fusion.in_bounds-true, label %loop_sqrt_fusion.in_bounds-after

loop_sqrt_fusion.in_bounds-after:                 ; preds = %reduce.266.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_sqrt_fusion.in_bounds-true:                  ; preds = %entry
  %4 = load double, ptr %arg3, align 8, !invariant.load !349
  %5 = load double, ptr %arg4, align 8, !invariant.load !349
  %add.10062.1 = fadd double %4, %5
  %6 = load double, ptr %arg2, align 8, !invariant.load !349
  %add.10063.1 = fadd double %add.10062.1, %6
  %7 = load double, ptr %arg1, align 8
  %add.10064.1 = fadd double %add.10063.1, %7
  %8 = load double, ptr %arg0, align 8, !invariant.load !349
  %add.10065.1 = fadd double %add.10064.1, %8
  %constant_2461_55 = load double, ptr @490, align 8
  store double %constant_2461_55, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.266.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.266.1.inner.loop_header.reduction_dim.0

reduce.266.1.inner.loop_header.reduction_dim.0:   ; preds = %reduce.266.1.inner.loop_body.reduction_dim.0, %loop_sqrt_fusion.in_bounds-true
  %reduce.266.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.266.1.inner.invar_address.reduction_dim.0, align 4
  %9 = icmp uge i32 %reduce.266.1.inner.indvar.reduction_dim.0, 20
  br i1 %9, label %reduce.266.1.inner.loop_exit.reduction_dim.0, label %reduce.266.1.inner.loop_body.reduction_dim.0

reduce.266.1.inner.loop_body.reduction_dim.0:     ; preds = %reduce.266.1.inner.loop_header.reduction_dim.0
  %10 = load double, ptr %accumulator_0, align 8
  %11 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %reduce.266.1.inner.indvar.reduction_dim.0
  %12 = load double, ptr %11, align 8, !invariant.load !349
  %13 = getelementptr inbounds [20 x double], ptr %arg5, i32 0, i32 %reduce.266.1.inner.indvar.reduction_dim.0
  %14 = load double, ptr %13, align 8, !invariant.load !349
  %multiply.11927.1 = fmul double %12, %14
  store double %10, ptr %parameter_buffer, align 8
  store double %multiply.11927.1, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_560101e57990_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %15 = load double, ptr %return_buffer, align 8
  store double %15, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.266.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.266.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.266.1.inner.loop_header.reduction_dim.0

reduce.266.1.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.266.1.inner.loop_header.reduction_dim.0
  %16 = load double, ptr %accumulator_0, align 8
  %add.10066.1 = fadd double %add.10065.1, %16
  %17 = call double @__nv_sqrt(double %add.10066.1)
  store double %17, ptr %arg1, align 8
  br label %loop_sqrt_fusion.in_bounds-after
}

define void @loop_add_fusion_38(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.38.in_bounds-true, label %loop_add_fusion.38.in_bounds-after

loop_add_fusion.38.in_bounds-after:               ; preds = %loop_add_fusion.38.in_bounds-true, %entry
  ret void

loop_add_fusion.38.in_bounds-true:                ; preds = %entry
  %4 = load i32, ptr %arg0, align 4
  %5 = load i64, ptr %arg1, align 8, !invariant.load !349
  %6 = trunc i64 %5 to i32
  %7 = add i32 %4, %6
  store i32 %7, ptr %arg0, align 4
  br label %loop_add_fusion.38.in_bounds-after
}

define void @wrapped_add_1(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(4) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %wrapped_add.1.in_bounds-true, label %wrapped_add.1.in_bounds-after

wrapped_add.1.in_bounds-after:                    ; preds = %wrapped_add.1.in_bounds-true, %entry
  ret void

wrapped_add.1.in_bounds-true:                     ; preds = %entry
  %4 = load i32, ptr %arg0, align 4
  %5 = load i32, ptr %arg1, align 4, !invariant.load !349
  %6 = add i32 %4, %5
  store i32 %6, ptr %arg0, align 4
  br label %wrapped_add.1.in_bounds-after
}

define void @loop_add_fusion_41(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.41.in_bounds-true, label %loop_add_fusion.41.in_bounds-after

loop_add_fusion.41.in_bounds-after:               ; preds = %loop_add_fusion.41.in_bounds-true, %entry
  ret void

loop_add_fusion.41.in_bounds-true:                ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !349
  %5 = load i64, ptr %arg1, align 8
  %6 = add i64 %4, %5
  %7 = insertvalue { i64, i64 } undef, i64 %6, 0
  %8 = load i64, ptr %arg2, align 8, !invariant.load !349
  %9 = load i64, ptr %arg1, align 8
  %10 = add i64 %8, %9
  %11 = insertvalue { i64, i64 } %7, i64 %10, 1
  %12 = extractvalue { i64, i64 } %11, 0
  store i64 %12, ptr %arg3, align 8
  %13 = extractvalue { i64, i64 } %11, 1
  store i64 %13, ptr %arg1, align 8
  br label %loop_add_fusion.41.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314, !315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !327, !328, !329, !330, !331, !332, !333, !334, !335, !336, !337, !338, !339, !340, !341, !342, !343, !344, !345, !346, !347}

!0 = !{ptr @loop_and_fusion_1, !"kernel", i32 1}
!1 = !{ptr @loop_and_fusion_1, !"reqntidx", i32 1}
!2 = !{ptr @loop_select_fusion_29, !"kernel", i32 1}
!3 = !{ptr @loop_select_fusion_29, !"reqntidx", i32 10}
!4 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!5 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 20}
!6 = !{ptr @loop_broadcast_fusion_53, !"kernel", i32 1}
!7 = !{ptr @loop_broadcast_fusion_53, !"reqntidx", i32 10}
!8 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!9 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!10 = !{ptr @loop_reduce_fusion, !"kernel", i32 1}
!11 = !{ptr @loop_reduce_fusion, !"reqntidx", i32 1}
!12 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 1}
!16 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_add_fusion, !"reqntidx", i32 20}
!18 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!19 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!20 = !{ptr @loop_multiply_fusion_10, !"kernel", i32 1}
!21 = !{ptr @loop_multiply_fusion_10, !"reqntidx", i32 20}
!22 = !{ptr @loop_reduce_fusion_1, !"kernel", i32 1}
!23 = !{ptr @loop_reduce_fusion_1, !"reqntidx", i32 1}
!24 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!25 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 1}
!26 = !{ptr @loop_add_fusion_2, !"kernel", i32 1}
!27 = !{ptr @loop_add_fusion_2, !"reqntidx", i32 20}
!28 = !{ptr @loop_minimum_fusion, !"kernel", i32 1}
!29 = !{ptr @loop_minimum_fusion, !"reqntidx", i32 1}
!30 = !{ptr @loop_add_fusion_35, !"kernel", i32 1}
!31 = !{ptr @loop_add_fusion_35, !"reqntidx", i32 20}
!32 = !{ptr @loop_broadcast_fusion_54, !"kernel", i32 1}
!33 = !{ptr @loop_broadcast_fusion_54, !"reqntidx", i32 1024}
!34 = !{ptr @loop_broadcast_fusion_55, !"kernel", i32 1}
!35 = !{ptr @loop_broadcast_fusion_55, !"reqntidx", i32 20}
!36 = !{ptr @loop_broadcast_fusion_61, !"kernel", i32 1}
!37 = !{ptr @loop_broadcast_fusion_61, !"reqntidx", i32 1024}
!38 = !{ptr @loop_broadcast_fusion_59, !"kernel", i32 1}
!39 = !{ptr @loop_broadcast_fusion_59, !"reqntidx", i32 20}
!40 = !{ptr @loop_broadcast_fusion_60, !"kernel", i32 1}
!41 = !{ptr @loop_broadcast_fusion_60, !"reqntidx", i32 1024}
!42 = !{ptr @loop_broadcast_fusion_62, !"kernel", i32 1}
!43 = !{ptr @loop_broadcast_fusion_62, !"reqntidx", i32 1024}
!44 = !{ptr @loop_broadcast_fusion_56, !"kernel", i32 1}
!45 = !{ptr @loop_broadcast_fusion_56, !"reqntidx", i32 192}
!46 = !{ptr @loop_broadcast_fusion_63, !"kernel", i32 1}
!47 = !{ptr @loop_broadcast_fusion_63, !"reqntidx", i32 192}
!48 = !{ptr @loop_broadcast_fusion_51, !"kernel", i32 1}
!49 = !{ptr @loop_broadcast_fusion_51, !"reqntidx", i32 20}
!50 = !{ptr @loop_broadcast_fusion_58, !"kernel", i32 1}
!51 = !{ptr @loop_broadcast_fusion_58, !"reqntidx", i32 20}
!52 = !{ptr @loop_broadcast_fusion_64, !"kernel", i32 1}
!53 = !{ptr @loop_broadcast_fusion_64, !"reqntidx", i32 20}
!54 = !{ptr @loop_compare_fusion_9, !"kernel", i32 1}
!55 = !{ptr @loop_compare_fusion_9, !"reqntidx", i32 1}
!56 = !{ptr @loop_dynamic_update_slice_fusion_216, !"kernel", i32 1}
!57 = !{ptr @loop_dynamic_update_slice_fusion_216, !"reqntidx", i32 1}
!58 = !{ptr @loop_dynamic_update_slice_fusion_215, !"kernel", i32 1}
!59 = !{ptr @loop_dynamic_update_slice_fusion_215, !"reqntidx", i32 1}
!60 = !{ptr @loop_dynamic_update_slice_fusion_201, !"kernel", i32 1}
!61 = !{ptr @loop_dynamic_update_slice_fusion_201, !"reqntidx", i32 20}
!62 = !{ptr @loop_dynamic_update_slice_fusion_171, !"kernel", i32 1}
!63 = !{ptr @loop_dynamic_update_slice_fusion_171, !"reqntidx", i32 20}
!64 = !{ptr @loop_dynamic_update_slice_fusion_172, !"kernel", i32 1}
!65 = !{ptr @loop_dynamic_update_slice_fusion_172, !"reqntidx", i32 20}
!66 = !{ptr @loop_dynamic_update_slice_fusion_174, !"kernel", i32 1}
!67 = !{ptr @loop_dynamic_update_slice_fusion_174, !"reqntidx", i32 20}
!68 = !{ptr @loop_dynamic_update_slice_fusion_208, !"kernel", i32 1}
!69 = !{ptr @loop_dynamic_update_slice_fusion_208, !"reqntidx", i32 20}
!70 = !{ptr @loop_dynamic_update_slice_fusion_175, !"kernel", i32 1}
!71 = !{ptr @loop_dynamic_update_slice_fusion_175, !"reqntidx", i32 20}
!72 = !{ptr @loop_dynamic_update_slice_fusion_199, !"kernel", i32 1}
!73 = !{ptr @loop_dynamic_update_slice_fusion_199, !"reqntidx", i32 20}
!74 = !{ptr @loop_dynamic_update_slice_fusion_202, !"kernel", i32 1}
!75 = !{ptr @loop_dynamic_update_slice_fusion_202, !"reqntidx", i32 20}
!76 = !{ptr @loop_dynamic_update_slice_fusion_198, !"kernel", i32 1}
!77 = !{ptr @loop_dynamic_update_slice_fusion_198, !"reqntidx", i32 20}
!78 = !{ptr @loop_dynamic_update_slice_fusion_167, !"kernel", i32 1}
!79 = !{ptr @loop_dynamic_update_slice_fusion_167, !"reqntidx", i32 20}
!80 = !{ptr @loop_dynamic_update_slice_fusion_168, !"kernel", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_168, !"reqntidx", i32 20}
!82 = !{ptr @loop_dynamic_update_slice_fusion_213, !"kernel", i32 1}
!83 = !{ptr @loop_dynamic_update_slice_fusion_213, !"reqntidx", i32 20}
!84 = !{ptr @loop_dynamic_update_slice_fusion_176, !"kernel", i32 1}
!85 = !{ptr @loop_dynamic_update_slice_fusion_176, !"reqntidx", i32 20}
!86 = !{ptr @loop_dynamic_update_slice_fusion_182, !"kernel", i32 1}
!87 = !{ptr @loop_dynamic_update_slice_fusion_182, !"reqntidx", i32 20}
!88 = !{ptr @loop_dynamic_update_slice_fusion_192, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_192, !"reqntidx", i32 20}
!90 = !{ptr @loop_dynamic_update_slice_fusion_214, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion_214, !"reqntidx", i32 20}
!92 = !{ptr @loop_dynamic_update_slice_fusion_204, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_204, !"reqntidx", i32 20}
!94 = !{ptr @loop_dynamic_update_slice_fusion_206, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_206, !"reqntidx", i32 20}
!96 = !{ptr @loop_dynamic_update_slice_fusion_209, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_209, !"reqntidx", i32 20}
!98 = !{ptr @loop_dynamic_update_slice_fusion_210, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_210, !"reqntidx", i32 20}
!100 = !{ptr @loop_add_divide_select_fusion_3, !"kernel", i32 1}
!101 = !{ptr @loop_add_divide_select_fusion_3, !"reqntidx", i32 20}
!102 = !{ptr @loop_dynamic_update_slice_fusion_165, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_165, !"reqntidx", i32 20}
!104 = !{ptr @loop_dynamic_update_slice_fusion_163, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_163, !"reqntidx", i32 20}
!106 = !{ptr @loop_dynamic_update_slice_fusion_164, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_164, !"reqntidx", i32 20}
!108 = !{ptr @loop_dynamic_update_slice_fusion_191, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_191, !"reqntidx", i32 20}
!110 = !{ptr @loop_dynamic_update_slice_fusion_205, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_205, !"reqntidx", i32 20}
!112 = !{ptr @loop_dynamic_update_slice_fusion_173, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_173, !"reqntidx", i32 20}
!114 = !{ptr @loop_dynamic_update_slice_fusion_178, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_178, !"reqntidx", i32 20}
!116 = !{ptr @loop_dynamic_update_slice_fusion_177, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_177, !"reqntidx", i32 20}
!118 = !{ptr @loop_dynamic_update_slice_fusion_179, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_179, !"reqntidx", i32 20}
!120 = !{ptr @loop_dynamic_update_slice_fusion_185, !"kernel", i32 1}
!121 = !{ptr @loop_dynamic_update_slice_fusion_185, !"reqntidx", i32 20}
!122 = !{ptr @loop_dynamic_update_slice_fusion_184, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_184, !"reqntidx", i32 20}
!124 = !{ptr @loop_dynamic_update_slice_fusion_197, !"kernel", i32 1}
!125 = !{ptr @loop_dynamic_update_slice_fusion_197, !"reqntidx", i32 20}
!126 = !{ptr @loop_dynamic_update_slice_fusion_193, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_193, !"reqntidx", i32 20}
!128 = !{ptr @loop_dynamic_update_slice_fusion_188, !"kernel", i32 1}
!129 = !{ptr @loop_dynamic_update_slice_fusion_188, !"reqntidx", i32 20}
!130 = !{ptr @loop_dynamic_update_slice_fusion_194, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_194, !"reqntidx", i32 20}
!132 = !{ptr @loop_dynamic_update_slice_fusion_196, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_196, !"reqntidx", i32 20}
!134 = !{ptr @loop_dynamic_update_slice_fusion_189, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_189, !"reqntidx", i32 20}
!136 = !{ptr @loop_dynamic_update_slice_fusion_190, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_190, !"reqntidx", i32 20}
!138 = !{ptr @loop_dynamic_update_slice_fusion_183, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_183, !"reqntidx", i32 20}
!140 = !{ptr @loop_dynamic_update_slice_fusion_169, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_169, !"reqntidx", i32 20}
!142 = !{ptr @loop_dynamic_update_slice_fusion_166, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_166, !"reqntidx", i32 20}
!144 = !{ptr @loop_dynamic_update_slice_fusion_170, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_170, !"reqntidx", i32 20}
!146 = !{ptr @loop_dynamic_update_slice_fusion_180, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_180, !"reqntidx", i32 20}
!148 = !{ptr @loop_add_reduce_fusion_3, !"kernel", i32 1}
!149 = !{ptr @loop_add_reduce_fusion_3, !"reqntidx", i32 128}
!150 = !{ptr @input_concatenate_fusion_3, !"kernel", i32 1}
!151 = !{ptr @input_concatenate_fusion_3, !"reqntidx", i32 128}
!152 = !{ptr @loop_broadcast_fusion_52, !"kernel", i32 1}
!153 = !{ptr @loop_broadcast_fusion_52, !"reqntidx", i32 1024}
!154 = !{ptr @input_scatter_fusion_3, !"kernel", i32 1}
!155 = !{ptr @input_scatter_fusion_3, !"reqntidx", i32 128}
!156 = !{ptr @loop_select_slice_fusion_3, !"kernel", i32 1}
!157 = !{ptr @loop_select_slice_fusion_3, !"reqntidx", i32 128}
!158 = !{ptr @input_multiply_reduce_fusion_3, !"kernel", i32 1}
!159 = !{ptr @input_multiply_reduce_fusion_3, !"reqntidx", i32 1024}
!160 = !{ptr @loop_broadcast_fusion_57, !"kernel", i32 1}
!161 = !{ptr @loop_broadcast_fusion_57, !"reqntidx", i32 20}
!162 = !{ptr @loop_dynamic_slice_fusion_17, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_slice_fusion_17, !"reqntidx", i32 1}
!164 = !{ptr @loop_dynamic_slice_fusion_15, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_slice_fusion_15, !"reqntidx", i32 1}
!166 = !{ptr @loop_dynamic_slice_fusion_19, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_slice_fusion_19, !"reqntidx", i32 20}
!168 = !{ptr @loop_dynamic_slice_fusion_18, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_slice_fusion_18, !"reqntidx", i32 20}
!170 = !{ptr @loop_add_select_fusion_7, !"kernel", i32 1}
!171 = !{ptr @loop_add_select_fusion_7, !"reqntidx", i32 20}
!172 = !{ptr @loop_multiply_negate_fusion_3, !"kernel", i32 1}
!173 = !{ptr @loop_multiply_negate_fusion_3, !"reqntidx", i32 20}
!174 = !{ptr @loop_broadcast_multiply_select_fusion_3, !"kernel", i32 1}
!175 = !{ptr @loop_broadcast_multiply_select_fusion_3, !"reqntidx", i32 20}
!176 = !{ptr @loop_add_select_fusion_6, !"kernel", i32 1}
!177 = !{ptr @loop_add_select_fusion_6, !"reqntidx", i32 20}
!178 = !{ptr @loop_reduce_fusion_29, !"kernel", i32 1}
!179 = !{ptr @loop_reduce_fusion_29, !"reqntidx", i32 1}
!180 = !{ptr @loop_reduce_fusion_26, !"kernel", i32 1}
!181 = !{ptr @loop_reduce_fusion_26, !"reqntidx", i32 1}
!182 = !{ptr @loop_reduce_fusion_27, !"kernel", i32 1}
!183 = !{ptr @loop_reduce_fusion_27, !"reqntidx", i32 1}
!184 = !{ptr @input_reduce_fusion_9, !"kernel", i32 1}
!185 = !{ptr @input_reduce_fusion_9, !"reqntidx", i32 1024}
!186 = !{ptr @loop_reduce_fusion_30, !"kernel", i32 1}
!187 = !{ptr @loop_reduce_fusion_30, !"reqntidx", i32 1}
!188 = !{ptr @loop_reduce_fusion_28, !"kernel", i32 1}
!189 = !{ptr @loop_reduce_fusion_28, !"reqntidx", i32 1}
!190 = !{ptr @loop_add_fusion_39, !"kernel", i32 1}
!191 = !{ptr @loop_add_fusion_39, !"reqntidx", i32 1}
!192 = !{ptr @input_reduce_fusion_7, !"kernel", i32 1}
!193 = !{ptr @input_reduce_fusion_7, !"reqntidx", i32 256}
!194 = !{ptr @loop_negate_or_select_fusion, !"kernel", i32 1}
!195 = !{ptr @loop_negate_or_select_fusion, !"reqntidx", i32 1}
!196 = !{ptr @loop_select_fusion_36, !"kernel", i32 1}
!197 = !{ptr @loop_select_fusion_36, !"reqntidx", i32 20}
!198 = !{ptr @loop_select_fusion_32, !"kernel", i32 1}
!199 = !{ptr @loop_select_fusion_32, !"reqntidx", i32 20}
!200 = !{ptr @loop_select_fusion_37, !"kernel", i32 1}
!201 = !{ptr @loop_select_fusion_37, !"reqntidx", i32 20}
!202 = !{ptr @loop_select_fusion_33, !"kernel", i32 1}
!203 = !{ptr @loop_select_fusion_33, !"reqntidx", i32 20}
!204 = !{ptr @loop_select_fusion_34, !"kernel", i32 1}
!205 = !{ptr @loop_select_fusion_34, !"reqntidx", i32 20}
!206 = !{ptr @loop_select_fusion_35, !"kernel", i32 1}
!207 = !{ptr @loop_select_fusion_35, !"reqntidx", i32 20}
!208 = !{ptr @loop_select_fusion_41, !"kernel", i32 1}
!209 = !{ptr @loop_select_fusion_41, !"reqntidx", i32 1}
!210 = !{ptr @loop_select_fusion_39, !"kernel", i32 1}
!211 = !{ptr @loop_select_fusion_39, !"reqntidx", i32 1}
!212 = !{ptr @loop_select_fusion_42, !"kernel", i32 1}
!213 = !{ptr @loop_select_fusion_42, !"reqntidx", i32 1}
!214 = !{ptr @loop_select_fusion_38, !"kernel", i32 1}
!215 = !{ptr @loop_select_fusion_38, !"reqntidx", i32 1}
!216 = !{ptr @loop_select_fusion_40, !"kernel", i32 1}
!217 = !{ptr @loop_select_fusion_40, !"reqntidx", i32 1}
!218 = !{ptr @loop_select_fusion_31, !"kernel", i32 1}
!219 = !{ptr @loop_select_fusion_31, !"reqntidx", i32 1}
!220 = !{ptr @loop_select_fusion_43, !"kernel", i32 1}
!221 = !{ptr @loop_select_fusion_43, !"reqntidx", i32 1}
!222 = !{ptr @loop_and_fusion, !"kernel", i32 1}
!223 = !{ptr @loop_and_fusion, !"reqntidx", i32 1}
!224 = !{ptr @wrapped_convert, !"kernel", i32 1}
!225 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!226 = !{ptr @loop_minimum_reduce_fusion, !"kernel", i32 1}
!227 = !{ptr @loop_minimum_reduce_fusion, !"reqntidx", i32 1}
!228 = !{ptr @loop_reduce_fusion_2, !"kernel", i32 1}
!229 = !{ptr @loop_reduce_fusion_2, !"reqntidx", i32 1}
!230 = !{ptr @loop_reduce_fusion_5, !"kernel", i32 1}
!231 = !{ptr @loop_reduce_fusion_5, !"reqntidx", i32 1}
!232 = !{ptr @loop_reduce_fusion_4, !"kernel", i32 1}
!233 = !{ptr @loop_reduce_fusion_4, !"reqntidx", i32 1}
!234 = !{ptr @loop_reduce_fusion_3, !"kernel", i32 1}
!235 = !{ptr @loop_reduce_fusion_3, !"reqntidx", i32 1}
!236 = !{ptr @loop_negate_fusion, !"kernel", i32 1}
!237 = !{ptr @loop_negate_fusion, !"reqntidx", i32 1}
!238 = !{ptr @loop_add_and_or_select_fusion, !"kernel", i32 1}
!239 = !{ptr @loop_add_and_or_select_fusion, !"reqntidx", i32 1}
!240 = !{ptr @loop_select_fusion_12, !"kernel", i32 1}
!241 = !{ptr @loop_select_fusion_12, !"reqntidx", i32 1}
!242 = !{ptr @loop_select_fusion_11, !"kernel", i32 1}
!243 = !{ptr @loop_select_fusion_11, !"reqntidx", i32 1}
!244 = !{ptr @loop_select_fusion_10, !"kernel", i32 1}
!245 = !{ptr @loop_select_fusion_10, !"reqntidx", i32 1}
!246 = !{ptr @loop_select_fusion_9, !"kernel", i32 1}
!247 = !{ptr @loop_select_fusion_9, !"reqntidx", i32 1}
!248 = !{ptr @loop_select_fusion_8, !"kernel", i32 1}
!249 = !{ptr @loop_select_fusion_8, !"reqntidx", i32 1}
!250 = !{ptr @wrapped_select, !"kernel", i32 1}
!251 = !{ptr @wrapped_select, !"reqntidx", i32 1}
!252 = !{ptr @loop_select_fusion_4, !"kernel", i32 1}
!253 = !{ptr @loop_select_fusion_4, !"reqntidx", i32 20}
!254 = !{ptr @loop_select_fusion_3, !"kernel", i32 1}
!255 = !{ptr @loop_select_fusion_3, !"reqntidx", i32 20}
!256 = !{ptr @loop_select_fusion_2, !"kernel", i32 1}
!257 = !{ptr @loop_select_fusion_2, !"reqntidx", i32 20}
!258 = !{ptr @loop_select_fusion_6, !"kernel", i32 1}
!259 = !{ptr @loop_select_fusion_6, !"reqntidx", i32 20}
!260 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!261 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 20}
!262 = !{ptr @loop_select_fusion_5, !"kernel", i32 1}
!263 = !{ptr @loop_select_fusion_5, !"reqntidx", i32 20}
!264 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!265 = !{ptr @loop_select_fusion, !"reqntidx", i32 1}
!266 = !{ptr @input_reduce_fusion_3, !"kernel", i32 1}
!267 = !{ptr @input_reduce_fusion_3, !"reqntidx", i32 32}
!268 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!269 = !{ptr @loop_divide_fusion, !"reqntidx", i32 2}
!270 = !{ptr @loop_select_fusion_22, !"kernel", i32 1}
!271 = !{ptr @loop_select_fusion_22, !"reqntidx", i32 1}
!272 = !{ptr @loop_reduce_fusion_7, !"kernel", i32 1}
!273 = !{ptr @loop_reduce_fusion_7, !"reqntidx", i32 1}
!274 = !{ptr @loop_reduce_fusion_8, !"kernel", i32 1}
!275 = !{ptr @loop_reduce_fusion_8, !"reqntidx", i32 1}
!276 = !{ptr @loop_negate_fusion_1, !"kernel", i32 1}
!277 = !{ptr @loop_negate_fusion_1, !"reqntidx", i32 1}
!278 = !{ptr @loop_add_and_compare_maximum_select_fusion, !"kernel", i32 1}
!279 = !{ptr @loop_add_and_compare_maximum_select_fusion, !"reqntidx", i32 1}
!280 = !{ptr @loop_select_fusion_23, !"kernel", i32 1}
!281 = !{ptr @loop_select_fusion_23, !"reqntidx", i32 1}
!282 = !{ptr @loop_select_fusion_24, !"kernel", i32 1}
!283 = !{ptr @loop_select_fusion_24, !"reqntidx", i32 1}
!284 = !{ptr @loop_select_fusion_13, !"kernel", i32 1}
!285 = !{ptr @loop_select_fusion_13, !"reqntidx", i32 1}
!286 = !{ptr @loop_select_fusion_14, !"kernel", i32 1}
!287 = !{ptr @loop_select_fusion_14, !"reqntidx", i32 1}
!288 = !{ptr @loop_select_fusion_15, !"kernel", i32 1}
!289 = !{ptr @loop_select_fusion_15, !"reqntidx", i32 1}
!290 = !{ptr @loop_select_fusion_27, !"kernel", i32 1}
!291 = !{ptr @loop_select_fusion_27, !"reqntidx", i32 1}
!292 = !{ptr @loop_select_fusion_25, !"kernel", i32 1}
!293 = !{ptr @loop_select_fusion_25, !"reqntidx", i32 1}
!294 = !{ptr @loop_add_convert_fusion, !"kernel", i32 1}
!295 = !{ptr @loop_add_convert_fusion, !"reqntidx", i32 1}
!296 = !{ptr @loop_add_fusion_29, !"kernel", i32 1}
!297 = !{ptr @loop_add_fusion_29, !"reqntidx", i32 1}
!298 = !{ptr @loop_select_fusion_28, !"kernel", i32 1}
!299 = !{ptr @loop_select_fusion_28, !"reqntidx", i32 1}
!300 = !{ptr @loop_add_fusion_24, !"kernel", i32 1}
!301 = !{ptr @loop_add_fusion_24, !"reqntidx", i32 20}
!302 = !{ptr @loop_add_reduce_fusion_2, !"kernel", i32 1}
!303 = !{ptr @loop_add_reduce_fusion_2, !"reqntidx", i32 128}
!304 = !{ptr @loop_select_slice_fusion_2, !"kernel", i32 1}
!305 = !{ptr @loop_select_slice_fusion_2, !"reqntidx", i32 128}
!306 = !{ptr @input_multiply_reduce_fusion_2, !"kernel", i32 1}
!307 = !{ptr @input_multiply_reduce_fusion_2, !"reqntidx", i32 1024}
!308 = !{ptr @loop_add_fusion_20, !"kernel", i32 1}
!309 = !{ptr @loop_add_fusion_20, !"reqntidx", i32 20}
!310 = !{ptr @loop_add_fusion_21, !"kernel", i32 1}
!311 = !{ptr @loop_add_fusion_21, !"reqntidx", i32 20}
!312 = !{ptr @loop_add_fusion_28, !"kernel", i32 1}
!313 = !{ptr @loop_add_fusion_28, !"reqntidx", i32 20}
!314 = !{ptr @loop_add_fusion_18, !"kernel", i32 1}
!315 = !{ptr @loop_add_fusion_18, !"reqntidx", i32 20}
!316 = !{ptr @loop_add_fusion_19, !"kernel", i32 1}
!317 = !{ptr @loop_add_fusion_19, !"reqntidx", i32 20}
!318 = !{ptr @wrapped_add, !"kernel", i32 1}
!319 = !{ptr @wrapped_add, !"reqntidx", i32 20}
!320 = !{ptr @loop_reduce_fusion_14, !"kernel", i32 1}
!321 = !{ptr @loop_reduce_fusion_14, !"reqntidx", i32 1}
!322 = !{ptr @loop_reduce_fusion_11, !"kernel", i32 1}
!323 = !{ptr @loop_reduce_fusion_11, !"reqntidx", i32 1}
!324 = !{ptr @loop_reduce_fusion_12, !"kernel", i32 1}
!325 = !{ptr @loop_reduce_fusion_12, !"reqntidx", i32 1}
!326 = !{ptr @input_reduce_fusion_8, !"kernel", i32 1}
!327 = !{ptr @input_reduce_fusion_8, !"reqntidx", i32 32}
!328 = !{ptr @loop_dynamic_update_slice_fusion_218, !"kernel", i32 1}
!329 = !{ptr @loop_dynamic_update_slice_fusion_218, !"reqntidx", i32 20}
!330 = !{ptr @loop_reduce_fusion_20, !"kernel", i32 1}
!331 = !{ptr @loop_reduce_fusion_20, !"reqntidx", i32 1}
!332 = !{ptr @loop_add_fusion_37, !"kernel", i32 1}
!333 = !{ptr @loop_add_fusion_37, !"reqntidx", i32 1}
!334 = !{ptr @loop_select_fusion_30, !"kernel", i32 1}
!335 = !{ptr @loop_select_fusion_30, !"reqntidx", i32 1}
!336 = !{ptr @loop_reduce_fusion_24, !"kernel", i32 1}
!337 = !{ptr @loop_reduce_fusion_24, !"reqntidx", i32 1}
!338 = !{ptr @loop_dynamic_update_slice_fusion_229, !"kernel", i32 1}
!339 = !{ptr @loop_dynamic_update_slice_fusion_229, !"reqntidx", i32 1}
!340 = !{ptr @loop_sqrt_fusion, !"kernel", i32 1}
!341 = !{ptr @loop_sqrt_fusion, !"reqntidx", i32 1}
!342 = !{ptr @loop_add_fusion_38, !"kernel", i32 1}
!343 = !{ptr @loop_add_fusion_38, !"reqntidx", i32 1}
!344 = !{ptr @wrapped_add_1, !"kernel", i32 1}
!345 = !{ptr @wrapped_add_1, !"reqntidx", i32 1}
!346 = !{ptr @loop_add_fusion_41, !"kernel", i32 1}
!347 = !{ptr @loop_add_fusion_41, !"reqntidx", i32 1}
!348 = !{i32 0, i32 1}
!349 = !{}
!350 = !{i32 0, i32 10}
!351 = !{i32 0, i32 20}
!352 = !{i32 0, i32 4}
!353 = !{i32 0, i32 1024}
!354 = !{i32 0, i32 192}
!355 = !{i32 0, i32 30}
!356 = !{i32 0, i32 128}
!357 = !{i32 0, i32 8}
!358 = distinct !{!358, !359, !360}
!359 = !{!"llvm.loop.vectorize.enable", i1 false}
!360 = !{!"llvm.loop.unroll.full"}
!361 = distinct !{!361, !359}
!362 = distinct !{!362, !359, !360}
!363 = distinct !{!363, !359}
!364 = !{i32 0, i32 256}
!365 = distinct !{!365, !359}
!366 = distinct !{!366, !359, !360}
!367 = distinct !{!367, !359, !360}
!368 = distinct !{!368, !359}
!369 = !{i32 0, i32 32}
!370 = distinct !{!370, !359, !360}
!371 = distinct !{!371, !359}
!372 = !{i32 0, i32 2}
!373 = distinct !{!373, !359, !360}
!374 = distinct !{!374, !359}
!375 = distinct !{!375, !359, !360}
!376 = distinct !{!376, !359}
