; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_35_0 = constant [64 x i8] zeroinitializer, align 128
@0 = private unnamed_addr constant [1 x i8] zeroinitializer
@1 = private unnamed_addr constant [8 x i8] zeroinitializer
@2 = private unnamed_addr constant [8 x i8] zeroinitializer
@3 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@buffer_for_constant_1881_0 = constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1880_0 = constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1879_0 = constant [64 x i8] c"\00\00\00\00\00\00\F0\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_1878_0 = constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1786_0 = constant [64 x i8] zeroinitializer, align 128
@4 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@5 = private unnamed_addr constant [8 x i8] zeroinitializer
@6 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@7 = private unnamed_addr constant [4 x i8] zeroinitializer
@8 = private unnamed_addr constant [8 x i8] zeroinitializer
@9 = private unnamed_addr constant [4 x i8] c"\DA\1B\D1\1B"
@10 = private unnamed_addr constant [8 x i8] zeroinitializer
@11 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@12 = private unnamed_addr constant [4 x i8] c"\06\00\00\00"
@13 = private unnamed_addr constant [4 x i8] c"\11\00\00\00"
@14 = private unnamed_addr constant [4 x i8] c"\13\00\00\00"
@15 = private unnamed_addr constant [4 x i8] c"\04\00\00\00"
@16 = private unnamed_addr constant [4 x i8] c"\08\00\00\00"
@17 = private unnamed_addr constant [4 x i8] c"\10\00\00\00"
@18 = private unnamed_addr constant [4 x i8] c"\03\00\00\00"
@19 = private unnamed_addr constant [4 x i8] c"\0F\00\00\00"
@20 = private unnamed_addr constant [4 x i8] c"\1A\00\00\00"
@21 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@22 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@23 = private unnamed_addr constant [4 x i8] c"\0D\00\00\00"
@24 = private unnamed_addr constant [4 x i8] c"\1D\00\00\00"
@25 = private unnamed_addr constant [4 x i8] c"\18\00\00\00"
@26 = private unnamed_addr constant [4 x i8] c"\05\00\00\00"
@27 = private unnamed_addr constant [8 x i8] c"\CD;\7Ff\9E\A0\F6?"
@28 = private unnamed_addr constant [8 x i8] c"\FF\FF\FF\FF\FF\FF\EF\BF"
@29 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@30 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@31 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@32 = private unnamed_addr constant [8 x i8] c"\0C\00\00\00\00\00\00\00"
@33 = private unnamed_addr constant [4 x i8] c"\05\00\00\00"
@34 = private unnamed_addr constant [4 x i8] c"\1A\00\00\00"
@35 = private unnamed_addr constant [4 x i8] c"\06\00\00\00"
@36 = private unnamed_addr constant [4 x i8] c"\11\00\00\00"
@37 = private unnamed_addr constant [4 x i8] c"\13\00\00\00"
@38 = private unnamed_addr constant [4 x i8] c"\04\00\00\00"
@39 = private unnamed_addr constant [4 x i8] c"\DA\1B\D1\1B"
@40 = private unnamed_addr constant [4 x i8] c"\08\00\00\00"
@41 = private unnamed_addr constant [4 x i8] c"\10\00\00\00"
@42 = private unnamed_addr constant [4 x i8] c"\03\00\00\00"
@43 = private unnamed_addr constant [4 x i8] c"\0F\00\00\00"
@44 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@45 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@46 = private unnamed_addr constant [4 x i8] c"\0D\00\00\00"
@47 = private unnamed_addr constant [4 x i8] c"\1D\00\00\00"
@48 = private unnamed_addr constant [4 x i8] c"\18\00\00\00"
@49 = private unnamed_addr constant [8 x i8] c" \00\00\00\00\00\00\00"
@50 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\14@"
@51 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\0A@"
@52 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\000@"
@53 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\09\C0"
@54 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\19@"
@55 = private unnamed_addr constant [8 x i8] c"\89Sx\A7\C3\CE\BD\BD"
@56 = private unnamed_addr constant [8 x i8] c"2\D9\DB\87\0F\04#>"
@57 = private unnamed_addr constant [8 x i8] c"'\E6F\E7\D25\B1\BB"
@58 = private unnamed_addr constant [8 x i8] c"'\87\E3\C0\EE\8F\F1\BD"
@59 = private unnamed_addr constant [8 x i8] c"5\86\87R\BE\\x>"
@60 = private unnamed_addr constant [8 x i8] c"'\D3$3\F9\DD\08\BC"
@61 = private unnamed_addr constant [8 x i8] c"\E3E\DA-\BF\E6\19>"
@62 = private unnamed_addr constant [8 x i8] c"U9\DDStw\92\BE"
@63 = private unnamed_addr constant [8 x i8] c"\9F|\0B\EF>\B87<"
@64 = private unnamed_addr constant [8 x i8] c"_/N\B2\8FF0\BE"
@65 = private unnamed_addr constant [8 x i8] c"lLU\CD\AB\95S>"
@66 = private unnamed_addr constant [8 x i8] c"\91\9BX\CDr\BAi<"
@67 = private unnamed_addr constant [8 x i8] c"\82\A1\FB\A8\C6Z@>"
@68 = private unnamed_addr constant [8 x i8] c"\AD\907\8A86\B9>"
@69 = private unnamed_addr constant [8 x i8] c"\96k\0A\09\896\A3\BC"
@70 = private unnamed_addr constant [8 x i8] c"\C0\B9_I.\10P\BE"
@71 = private unnamed_addr constant [8 x i8] c"\83P+\81\DB\D5\D0\BE"
@72 = private unnamed_addr constant [8 x i8] c"\E02\81\89\11.x<"
@73 = private unnamed_addr constant [8 x i8] c"\F8J3\E1 L_>"
@74 = private unnamed_addr constant [8 x i8] c"\F6R\D6\D5\0C\86\C8>"
@75 = private unnamed_addr constant [8 x i8] c"\BA&\9E\FD\AC\E4\FD<"
@76 = private unnamed_addr constant [8 x i8] c">\9C\DF\0F\22-r\BE"
@77 = private unnamed_addr constant [8 x i8] c"#\FB\CD\CA\A0)\EA>"
@78 = private unnamed_addr constant [8 x i8] c"\87\C4f\ED>\D3&\BD"
@79 = private unnamed_addr constant [8 x i8] c"T\CB$\B8\8B\BC\8E>"
@80 = private unnamed_addr constant [8 x i8] c"\F2\81\02\F8\F1\CE\08\BF"
@81 = private unnamed_addr constant [8 x i8] c"\E2\D8@p\16\F26\BD"
@82 = private unnamed_addr constant [8 x i8] c"\CCr\A3\0E\D4\A8\B0\BE"
@83 = private unnamed_addr constant [8 x i8] c"\8A\18\B9\D0\84\E6\11?"
@84 = private unnamed_addr constant [8 x i8] c" ~\D7\C2\22*\87="
@85 = private unnamed_addr constant [8 x i8] c"+=\09\9D\D2\FB\D2>"
@86 = private unnamed_addr constant [8 x i8] c"\22\A2\C8T\CD2\F9>"
@87 = private unnamed_addr constant [8 x i8] c"\AF\C0\E5\C4Y\88\AC\BD"
@88 = private unnamed_addr constant [8 x i8] c"\AC\0F\1E~I\A3\F4\BE"
@89 = private unnamed_addr constant [8 x i8] c"\A3\8A\EF\89\8AD7\BF"
@90 = private unnamed_addr constant [8 x i8] c"a\A5\18\D1\83\C5\CD\BD"
@91 = private unnamed_addr constant [8 x i8] c"\8F\93\00\EB\F4\EB\13?"
@92 = private unnamed_addr constant [8 x i8] c"%\0C\D4Z\C5<O?"
@93 = private unnamed_addr constant [8 x i8] c"<k\F4\CCG\0F\12>"
@94 = private unnamed_addr constant [8 x i8] c"S]\FC\A86/,\BF"
@95 = private unnamed_addr constant [8 x i8] c"\B18/\13$\A9[\BF"
@96 = private unnamed_addr constant [8 x i8] c"`M\C8\8D\E3\A91\BE"
@97 = private unnamed_addr constant [8 x i8] c"|\04\04\DF\A5.\22\BF"
@98 = private unnamed_addr constant [8 x i8] c"\F8<S\CA\EEhd?"
@99 = private unnamed_addr constant [8 x i8] c"\A9F=m\CD6_\BE"
@100 = private unnamed_addr constant [8 x i8] c"\DC\A0\FB\D10*\F0?"
@101 = private unnamed_addr constant [8 x i8] c"\BD\1B\89\BB\DA\BAn\BF"
@102 = private unnamed_addr constant [8 x i8] c"\87\B7\03]Ok\9C>"
@103 = private unnamed_addr constant [8 x i8] c"\FB\D7\1A\DDMf\13@"
@104 = private unnamed_addr constant [8 x i8] c"\FCj\B7\E5\CF\FFu?"
@105 = private unnamed_addr constant [8 x i8] c"\A2\E8JC\A5\E8\B6\BE"
@106 = private unnamed_addr constant [8 x i8] c"9\1Ddm\8A\15\F0?"
@107 = private unnamed_addr constant [8 x i8] c"\F66\87{\1F\1D\ED\BE"
@108 = private unnamed_addr constant [8 x i8] c"HZ\0D8\CC\AB\08@"
@109 = private unnamed_addr constant [8 x i8] c"$\F0\12\A2\C2y(?"
@110 = private unnamed_addr constant [8 x i8] c"\A8\FC\84\94vEH\BF"
@111 = private unnamed_addr constant [8 x i8] c"\09\F9\141\C3\B6x\BF"
@112 = private unnamed_addr constant [8 x i8] c"(>\B1\D9\80\BD\CE?"
@113 = private unnamed_addr constant [8 x i8] c"\86\AE\99|^u\FA?"
@114 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\7F"
@115 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@116 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@117 = private unnamed_addr constant [8 x i8] zeroinitializer
@118 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@119 = private unnamed_addr constant [8 x i8] zeroinitializer
@120 = private unnamed_addr constant [8 x i8] zeroinitializer
@121 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@buffer_for_constant_1739_0 = constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1738_0 = constant [64 x i8] zeroinitializer, align 128
@122 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@123 = private unnamed_addr constant [8 x i8] c"\02\00\00\00\00\00\00\00"
@124 = private unnamed_addr constant [8 x i8] zeroinitializer
@125 = private unnamed_addr constant [8 x i8] c"\04\00\00\00\00\00\00\00"
@126 = private unnamed_addr constant [8 x i8] c"\10\00\00\00\00\00\00\00"
@127 = private unnamed_addr constant [8 x i8] c"\00\01\00\00\00\00\00\00"
@128 = private unnamed_addr constant [8 x i8] c"\00\00\01\00\00\00\00\00"
@129 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\01\00\00\00"
@130 = private unnamed_addr constant [4 x i8] c"\DA\1B\D1\1B"
@131 = private unnamed_addr constant [4 x i8] c"\06\00\00\00"
@132 = private unnamed_addr constant [4 x i8] c"\11\00\00\00"
@133 = private unnamed_addr constant [4 x i8] c"\13\00\00\00"
@134 = private unnamed_addr constant [4 x i8] c"\04\00\00\00"
@135 = private unnamed_addr constant [4 x i8] c"\08\00\00\00"
@136 = private unnamed_addr constant [4 x i8] c"\10\00\00\00"
@137 = private unnamed_addr constant [4 x i8] c"\03\00\00\00"
@138 = private unnamed_addr constant [4 x i8] c"\0F\00\00\00"
@139 = private unnamed_addr constant [4 x i8] c"\1A\00\00\00"
@140 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@141 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@142 = private unnamed_addr constant [4 x i8] c"\0D\00\00\00"
@143 = private unnamed_addr constant [4 x i8] c" \00\00\00"
@144 = private unnamed_addr constant [4 x i8] c"\1D\00\00\00"
@145 = private unnamed_addr constant [4 x i8] c"\18\00\00\00"
@146 = private unnamed_addr constant [4 x i8] c"\05\00\00\00"
@147 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@148 = private unnamed_addr constant [4 x i8] c"\DA\1B\D1\1B"
@149 = private unnamed_addr constant [4 x i8] c"\06\00\00\00"
@150 = private unnamed_addr constant [4 x i8] c"\11\00\00\00"
@151 = private unnamed_addr constant [4 x i8] c"\13\00\00\00"
@152 = private unnamed_addr constant [4 x i8] c"\04\00\00\00"
@153 = private unnamed_addr constant [4 x i8] c"\08\00\00\00"
@154 = private unnamed_addr constant [4 x i8] c"\10\00\00\00"
@155 = private unnamed_addr constant [4 x i8] c"\03\00\00\00"
@156 = private unnamed_addr constant [4 x i8] c"\0F\00\00\00"
@157 = private unnamed_addr constant [4 x i8] c"\1A\00\00\00"
@158 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@159 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@160 = private unnamed_addr constant [4 x i8] c"\0D\00\00\00"
@161 = private unnamed_addr constant [4 x i8] c"\1D\00\00\00"
@162 = private unnamed_addr constant [4 x i8] c"\18\00\00\00"
@163 = private unnamed_addr constant [4 x i8] c"\05\00\00\00"
@164 = private unnamed_addr constant [4 x i8] c"\1A\00\00\00"
@165 = private unnamed_addr constant [4 x i8] c"\06\00\00\00"
@166 = private unnamed_addr constant [4 x i8] c"\11\00\00\00"
@167 = private unnamed_addr constant [4 x i8] c"\13\00\00\00"
@168 = private unnamed_addr constant [4 x i8] c"\04\00\00\00"
@169 = private unnamed_addr constant [4 x i8] c"\DA\1B\D1\1B"
@170 = private unnamed_addr constant [4 x i8] c"\08\00\00\00"
@171 = private unnamed_addr constant [4 x i8] c"\10\00\00\00"
@172 = private unnamed_addr constant [4 x i8] c"\03\00\00\00"
@173 = private unnamed_addr constant [4 x i8] c"\0F\00\00\00"
@174 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@175 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@176 = private unnamed_addr constant [4 x i8] c"\0D\00\00\00"
@177 = private unnamed_addr constant [4 x i8] c"\1D\00\00\00"
@178 = private unnamed_addr constant [4 x i8] c"\18\00\00\00"
@179 = private unnamed_addr constant [8 x i8] zeroinitializer
@180 = private unnamed_addr constant [8 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF"
@181 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@182 = private unnamed_addr constant [4 x i8] c"\00\00\00?"
@183 = private unnamed_addr constant [4 x i8] c"\00\00\80\BF"
@184 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@185 = private unnamed_addr constant [4 x i8] c"\09\00\00\00"
@186 = private unnamed_addr constant [4 x i8] c"\DA\1B\D1\1B"
@187 = private unnamed_addr constant [4 x i8] c"\06\00\00\00"
@188 = private unnamed_addr constant [4 x i8] c"\11\00\00\00"
@189 = private unnamed_addr constant [4 x i8] c"\13\00\00\00"
@190 = private unnamed_addr constant [4 x i8] c"\04\00\00\00"
@191 = private unnamed_addr constant [4 x i8] c"\08\00\00\00"
@192 = private unnamed_addr constant [4 x i8] c"\10\00\00\00"
@193 = private unnamed_addr constant [4 x i8] c"\03\00\00\00"
@194 = private unnamed_addr constant [4 x i8] c"\0F\00\00\00"
@195 = private unnamed_addr constant [4 x i8] c"\1A\00\00\00"
@196 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@197 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@198 = private unnamed_addr constant [4 x i8] c"\0D\00\00\00"
@199 = private unnamed_addr constant [4 x i8] c"\1D\00\00\00"
@200 = private unnamed_addr constant [4 x i8] c"\18\00\00\00"
@201 = private unnamed_addr constant [4 x i8] zeroinitializer
@202 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@203 = private unnamed_addr constant [8 x i8] zeroinitializer
@204 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\FF"
@buffer_for_constant_1691_0 = constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1678_0 = constant [64 x i8] zeroinitializer, align 128
@205 = private unnamed_addr constant [8 x i8] zeroinitializer
@206 = private unnamed_addr constant [8 x i8] zeroinitializer
@207 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@208 = private unnamed_addr constant [8 x i8] c"\02\00\00\00\00\00\00\00"
@209 = private unnamed_addr constant [4 x i8] c"\DA\1B\D1\1B"
@210 = private unnamed_addr constant [4 x i8] c"\06\00\00\00"
@211 = private unnamed_addr constant [4 x i8] c"\11\00\00\00"
@212 = private unnamed_addr constant [4 x i8] c"\13\00\00\00"
@213 = private unnamed_addr constant [4 x i8] c"\04\00\00\00"
@214 = private unnamed_addr constant [4 x i8] c"\08\00\00\00"
@215 = private unnamed_addr constant [4 x i8] c"\10\00\00\00"
@216 = private unnamed_addr constant [4 x i8] c"\03\00\00\00"
@217 = private unnamed_addr constant [4 x i8] c"\0F\00\00\00"
@218 = private unnamed_addr constant [4 x i8] c"\1A\00\00\00"
@219 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@220 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@221 = private unnamed_addr constant [4 x i8] c"\0D\00\00\00"
@222 = private unnamed_addr constant [4 x i8] c" \00\00\00"
@223 = private unnamed_addr constant [4 x i8] c"\1D\00\00\00"
@224 = private unnamed_addr constant [4 x i8] c"\18\00\00\00"
@225 = private unnamed_addr constant [4 x i8] c"\05\00\00\00"
@226 = private unnamed_addr constant [8 x i8] zeroinitializer
@227 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@228 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@229 = private unnamed_addr constant [8 x i8] zeroinitializer
@230 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@231 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@232 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@233 = private unnamed_addr constant [8 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF"
@234 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@235 = private unnamed_addr constant [1 x i8] zeroinitializer
@236 = private unnamed_addr constant [1 x i8] zeroinitializer
@237 = private unnamed_addr constant [4 x i8] zeroinitializer
@238 = private unnamed_addr constant [8 x i8] zeroinitializer
@239 = private unnamed_addr constant [4 x i8] zeroinitializer
@240 = private unnamed_addr constant [8 x i8] zeroinitializer
@241 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@242 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@243 = private unnamed_addr constant [8 x i8] zeroinitializer
@244 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@245 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@246 = private unnamed_addr constant [8 x i8] zeroinitializer
@247 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@248 = private unnamed_addr constant [4 x i8] zeroinitializer
@249 = private unnamed_addr constant [8 x i8] zeroinitializer
@250 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@251 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@252 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@253 = private unnamed_addr constant [8 x i8] zeroinitializer
@254 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@255 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@256 = private unnamed_addr constant [8 x i8] zeroinitializer
@257 = private unnamed_addr constant [8 x i8] zeroinitializer
@258 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@259 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@260 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@261 = private unnamed_addr constant [8 x i8] zeroinitializer
@262 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@263 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@264 = private unnamed_addr constant [8 x i8] zeroinitializer
@265 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@266 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@267 = private unnamed_addr constant [8 x i8] zeroinitializer
@268 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@269 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@270 = private unnamed_addr constant [8 x i8] zeroinitializer
@271 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@272 = private unnamed_addr constant [8 x i8] zeroinitializer
@273 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@274 = private unnamed_addr constant [8 x i8] zeroinitializer
@275 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@276 = private unnamed_addr constant [8 x i8] zeroinitializer
@277 = private unnamed_addr constant [8 x i8] zeroinitializer
@278 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@279 = private unnamed_addr constant [8 x i8] zeroinitializer
@280 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@281 = private unnamed_addr constant [8 x i8] zeroinitializer
@282 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@283 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@284 = private unnamed_addr constant [8 x i8] zeroinitializer
@285 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@286 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@287 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@288 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@289 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@290 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@291 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@292 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@293 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@294 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@295 = private unnamed_addr constant [8 x i8] zeroinitializer
@296 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@297 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@298 = private unnamed_addr constant [8 x i8] zeroinitializer
@299 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@300 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@301 = private unnamed_addr constant [8 x i8] zeroinitializer
@302 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@303 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@304 = private unnamed_addr constant [8 x i8] zeroinitializer
@305 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@306 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@307 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@308 = private unnamed_addr constant [8 x i8] zeroinitializer
@309 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@310 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@311 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@312 = private unnamed_addr constant [8 x i8] zeroinitializer
@313 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@314 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@315 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@316 = private unnamed_addr constant [8 x i8] zeroinitializer
@317 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@318 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@319 = private unnamed_addr constant [8 x i8] zeroinitializer
@320 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@321 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@322 = private unnamed_addr constant [8 x i8] zeroinitializer
@323 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@324 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@325 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@326 = private unnamed_addr constant [8 x i8] zeroinitializer
@327 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@328 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@329 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@330 = private unnamed_addr constant [8 x i8] zeroinitializer
@331 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@332 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@333 = private unnamed_addr constant [8 x i8] zeroinitializer
@334 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@335 = private unnamed_addr constant [8 x i8] zeroinitializer
@336 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@337 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@338 = private unnamed_addr constant [8 x i8] zeroinitializer
@339 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@340 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@341 = private unnamed_addr constant [8 x i8] zeroinitializer
@342 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@343 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@344 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@345 = private unnamed_addr constant [8 x i8] zeroinitializer
@346 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@347 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@348 = private unnamed_addr constant [8 x i8] zeroinitializer
@349 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@350 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@351 = private unnamed_addr constant [8 x i8] zeroinitializer
@352 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@353 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@354 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@355 = private unnamed_addr constant [8 x i8] zeroinitializer
@356 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@357 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@358 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@359 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@360 = private unnamed_addr constant [8 x i8] zeroinitializer
@361 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@362 = private unnamed_addr constant [8 x i8] zeroinitializer
@363 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@364 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@365 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@366 = private unnamed_addr constant [8 x i8] zeroinitializer
@367 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@368 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@369 = private unnamed_addr constant [8 x i8] zeroinitializer
@370 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@371 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@372 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@373 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@374 = private unnamed_addr constant [8 x i8] zeroinitializer
@375 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@376 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@377 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@378 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@379 = private unnamed_addr constant [8 x i8] zeroinitializer
@380 = private unnamed_addr constant [8 x i8] zeroinitializer
@381 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@382 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@383 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@384 = private unnamed_addr constant [8 x i8] zeroinitializer
@385 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@386 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@387 = private unnamed_addr constant [8 x i8] zeroinitializer
@388 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@389 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>@"
@390 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>\C0"
@391 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\FF"
@392 = private unnamed_addr constant [8 x i8] zeroinitializer
@393 = private unnamed_addr constant [8 x i8] zeroinitializer
@394 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@395 = private unnamed_addr constant [4 x i8] zeroinitializer
@396 = private unnamed_addr constant [8 x i8] zeroinitializer
@397 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@398 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@399 = private unnamed_addr constant [4 x i8] zeroinitializer
@400 = private unnamed_addr constant [8 x i8] zeroinitializer
@401 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@402 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\FF"
@403 = private unnamed_addr constant [1 x i8] c"\01"
@404 = private unnamed_addr constant [8 x i8] zeroinitializer
@405 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@406 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@407 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>\C0"
@408 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00>@"
@409 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [32 x [33 x double]] undef
@410 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [1 x [2 x double]] undef
@411 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC\BF"
@412 = private unnamed_addr constant [8 x i8] c"\EF9\FA\FEB.\F6\BF"
@413 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@414 = private unnamed_addr constant [8 x i8] zeroinitializer
@415 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@416 = private unnamed_addr constant [8 x i8] c"\EBP\CA\BF@3\F4?"
@417 = private unnamed_addr constant [8 x i8] c"\1C\C7q\1C\C7q\FC?"
@418 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache2 = private addrspace(3) global [32 x [33 x double]] undef
@419 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@420 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@421 = private unnamed_addr constant [8 x i8] zeroinitializer
@422 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@423 = private unnamed_addr constant [8 x i8] c"\B4\BEd\C8\F1g\FD?"
@424 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@425 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@426 = private unnamed_addr constant [8 x i8] zeroinitializer
@427 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@428 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@429 = private unnamed_addr constant [8 x i8] zeroinitializer
@430 = private unnamed_addr constant [8 x i8] zeroinitializer
@431 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@432 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@433 = private unnamed_addr constant [8 x i8] zeroinitializer
@434 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@435 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@436 = private unnamed_addr constant [8 x i8] zeroinitializer
@437 = private unnamed_addr constant [8 x i8] zeroinitializer
@438 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@439 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@440 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@441 = private unnamed_addr constant [8 x i8] zeroinitializer
@442 = private unnamed_addr constant [8 x i8] zeroinitializer
@443 = private unnamed_addr constant [8 x i8] zeroinitializer
@444 = private unnamed_addr constant [8 x i8] c"\BF\00\00\00\00\00\00\00"
@445 = private unnamed_addr constant [8 x i8] c"\7F\01\00\00\00\00\00\00"
@446 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@447 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@448 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@449 = private unnamed_addr constant [4 x i8] zeroinitializer
@450 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@451 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@452 = private unnamed_addr constant [8 x i8] zeroinitializer
@453 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@454 = private unnamed_addr constant [8 x i8] c"\B4\BEd\C8\F1g\FD?"
@455 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0\BF"
@456 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@457 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@458 = private unnamed_addr constant [8 x i8] zeroinitializer
@459 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@460 = private unnamed_addr constant [8 x i8] c"R|\AFc\1A\CB\09@"
@461 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@462 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10\C0"
@463 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@464 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@465 = private unnamed_addr constant [8 x i8] zeroinitializer
@466 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@467 = private unnamed_addr constant [8 x i8] c"\15\13\AA%\BB\E6\DC?"
@468 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\10@"
@469 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0\BF"
@470 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\18@"
@471 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@472 = private unnamed_addr constant [8 x i8] zeroinitializer
@473 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0\BF"
@474 = private unnamed_addr constant [8 x i8] c"R|\AFc\1A\CB\09@"
@475 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\D0?"
@476 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@477 = private unnamed_addr constant [8 x i8] zeroinitializer
@478 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\FF"
@479 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00@\8F@"
@480 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@481 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@482 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@483 = private unnamed_addr constant [8 x i8] c"\0C\00\00\00\00\00\00\00"
@484 = private unnamed_addr constant [4 x i8] c"\05\00\00\00"
@485 = private unnamed_addr constant [4 x i8] c"\1A\00\00\00"
@486 = private unnamed_addr constant [4 x i8] c"\06\00\00\00"
@487 = private unnamed_addr constant [4 x i8] c"\11\00\00\00"
@488 = private unnamed_addr constant [4 x i8] c"\13\00\00\00"
@489 = private unnamed_addr constant [4 x i8] c"\04\00\00\00"
@490 = private unnamed_addr constant [4 x i8] c"\DA\1B\D1\1B"
@491 = private unnamed_addr constant [4 x i8] c"\08\00\00\00"
@492 = private unnamed_addr constant [4 x i8] c"\10\00\00\00"
@493 = private unnamed_addr constant [4 x i8] c"\03\00\00\00"
@494 = private unnamed_addr constant [4 x i8] c"\0F\00\00\00"
@495 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@496 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@497 = private unnamed_addr constant [4 x i8] c"\0D\00\00\00"
@498 = private unnamed_addr constant [4 x i8] c"\1D\00\00\00"
@499 = private unnamed_addr constant [4 x i8] c"\18\00\00\00"
@500 = private unnamed_addr constant [8 x i8] c" \00\00\00\00\00\00\00"
@501 = private unnamed_addr constant [8 x i8] zeroinitializer
@buffer_for_constant_6721_0 = constant [64 x i8] c"\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@502 = private unnamed_addr constant [1 x i8] c"\01"
@503 = private unnamed_addr constant [4 x i8] zeroinitializer
@504 = private unnamed_addr constant [4 x i8] c"\0A\00\00\00"
@505 = private unnamed_addr constant [4 x i8] zeroinitializer
@506 = private unnamed_addr constant [4 x i8] zeroinitializer
@507 = private unnamed_addr constant [4 x i8] c"\0A\00\00\00"
@508 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@509 = private unnamed_addr constant [4 x i8] zeroinitializer
@510 = private unnamed_addr constant [4 x i8] c"\0A\00\00\00"
@511 = private unnamed_addr constant [4 x i8] c"\FF\FF\FF\FF"
@512 = private unnamed_addr constant [8 x i8] zeroinitializer
@513 = private unnamed_addr constant [8 x i8] zeroinitializer
@514 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@515 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@516 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@517 = private unnamed_addr constant [8 x i8] c"\0C\00\00\00\00\00\00\00"
@518 = private unnamed_addr constant [4 x i8] c"\05\00\00\00"
@519 = private unnamed_addr constant [4 x i8] c"\1A\00\00\00"
@520 = private unnamed_addr constant [4 x i8] c"\06\00\00\00"
@521 = private unnamed_addr constant [4 x i8] c"\11\00\00\00"
@522 = private unnamed_addr constant [4 x i8] c"\13\00\00\00"
@523 = private unnamed_addr constant [4 x i8] c"\04\00\00\00"
@524 = private unnamed_addr constant [4 x i8] c"\DA\1B\D1\1B"
@525 = private unnamed_addr constant [4 x i8] c"\08\00\00\00"
@526 = private unnamed_addr constant [4 x i8] c"\10\00\00\00"
@527 = private unnamed_addr constant [4 x i8] c"\03\00\00\00"
@528 = private unnamed_addr constant [4 x i8] c"\0F\00\00\00"
@529 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@530 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@531 = private unnamed_addr constant [4 x i8] c"\0D\00\00\00"
@532 = private unnamed_addr constant [4 x i8] c"\1D\00\00\00"
@533 = private unnamed_addr constant [4 x i8] c"\18\00\00\00"
@534 = private unnamed_addr constant [8 x i8] c" \00\00\00\00\00\00\00"
@535 = private unnamed_addr constant [8 x i8] zeroinitializer
@536 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@537 = private unnamed_addr constant [8 x i8] zeroinitializer
@538 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@539 = private unnamed_addr constant [8 x i8] zeroinitializer
@540 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@541 = private unnamed_addr constant [8 x i8] zeroinitializer
@542 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@543 = private unnamed_addr constant [8 x i8] zeroinitializer
@544 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@545 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E8\BF"
@546 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@547 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@548 = private unnamed_addr constant [8 x i8] c"\CD\CC\CC\CC\CC\CC\EC?"
@549 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@550 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\004@"
@buffer_for_constant_9121_0 = constant [64 x i8] c"\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_9114_0 = constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_9113_0 = constant [64 x i8] zeroinitializer, align 128
@551 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00$@"
@552 = private unnamed_addr constant [8 x i8] c"\FC\A9\F1\D2MbP?"
@553 = private unnamed_addr constant [8 x i8] c"\05\00\00\00\00\00\00\00"
@554 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\14@"
@555 = private unnamed_addr constant [8 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF"
@556 = private unnamed_addr constant [8 x i8] zeroinitializer
@557 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@558 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_broadcast_fusion_20(ptr noalias align 128 dereferenceable(10) %arg0, ptr noalias align 128 dereferenceable(10) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !293
  %2 = mul nuw nsw i32 %0, 10
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 10
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 10
  br i1 %4, label %loop_broadcast_fusion.20.in_bounds-true, label %loop_broadcast_fusion.20.in_bounds-after

loop_broadcast_fusion.20.in_bounds-after:         ; preds = %loop_broadcast_fusion.20.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.20.in_bounds-true:          ; preds = %entry
  %constant_40_1 = load i8, ptr @0, align 1
  %5 = insertvalue { i8, i8 } undef, i8 %constant_40_1, 0
  %6 = insertvalue { i8, i8 } %5, i8 %constant_40_1, 1
  %7 = extractvalue { i8, i8 } %6, 0
  %8 = getelementptr i8, ptr %arg0, i32 %linear_index
  %9 = getelementptr inbounds i8, ptr %8, i32 0
  store i8 %7, ptr %9, align 1
  %10 = extractvalue { i8, i8 } %6, 1
  %11 = getelementptr i8, ptr %arg1, i32 %linear_index
  %12 = getelementptr inbounds i8, ptr %11, i32 0
  store i8 %10, ptr %12, align 1
  br label %loop_broadcast_fusion.20.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_broadcast_fusion_19(ptr noalias align 128 dereferenceable(80) %arg0, ptr noalias align 128 dereferenceable(80) %arg1, ptr noalias align 128 dereferenceable(80) %arg2, ptr noalias align 128 dereferenceable(80) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !293
  %2 = mul nuw nsw i32 %0, 10
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 10
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 10
  br i1 %4, label %loop_broadcast_fusion.19.in_bounds-true, label %loop_broadcast_fusion.19.in_bounds-after

loop_broadcast_fusion.19.in_bounds-after:         ; preds = %loop_broadcast_fusion.19.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.19.in_bounds-true:          ; preds = %entry
  %constant_35_1 = load i64, ptr @1, align 8
  %5 = insertvalue { i64, i64, i64, i64 } undef, i64 %constant_35_1, 0
  %6 = insertvalue { i64, i64, i64, i64 } %5, i64 %constant_35_1, 1
  %7 = insertvalue { i64, i64, i64, i64 } %6, i64 %constant_35_1, 2
  %8 = insertvalue { i64, i64, i64, i64 } %7, i64 %constant_35_1, 3
  %9 = extractvalue { i64, i64, i64, i64 } %8, 0
  %10 = getelementptr i64, ptr %arg0, i32 %linear_index
  %11 = getelementptr inbounds i64, ptr %10, i32 0
  store i64 %9, ptr %11, align 8
  %12 = extractvalue { i64, i64, i64, i64 } %8, 1
  %13 = getelementptr i64, ptr %arg1, i32 %linear_index
  %14 = getelementptr inbounds i64, ptr %13, i32 0
  store i64 %12, ptr %14, align 8
  %15 = extractvalue { i64, i64, i64, i64 } %8, 2
  %16 = getelementptr i64, ptr %arg2, i32 %linear_index
  %17 = getelementptr inbounds i64, ptr %16, i32 0
  store i64 %15, ptr %17, align 8
  %18 = extractvalue { i64, i64, i64, i64 } %8, 3
  %19 = getelementptr i64, ptr %arg3, i32 %linear_index
  %20 = getelementptr inbounds i64, ptr %19, i32 0
  store i64 %18, ptr %20, align 8
  br label %loop_broadcast_fusion.19.in_bounds-after
}

define void @input_slice_fusion(ptr noalias align 128 dereferenceable(80) %arg0, ptr noalias align 128 dereferenceable(320) %arg1, ptr noalias align 128 dereferenceable(1920) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !294
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 384
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 290
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice2-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.10.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %constant_36_4 = load double, ptr @2, align 8
  br label %concatenate.49.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.10.3
  %7 = phi i32 [ 10, %concatenate.pivot.10.3 ]
  %8 = sub nsw i32 %3, %7
  %9 = mul nuw nsw i32 %8, 1
  %10 = add nuw nsw i32 0, %9
  %11 = urem i32 %10, 4
  %12 = udiv i32 %10, 4
  %13 = udiv i32 %12, 10
  %constant_36_41 = load double, ptr @2, align 8
  br label %concatenate.49.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.50.4
  %14 = phi i32 [ 50, %concatenate.pivot.50.4 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 24
  %19 = udiv i32 %17, 24
  %20 = udiv i32 %19, 10
  %constant_36_42 = load double, ptr @2, align 8
  br label %concatenate.49.merge

concatenate.pivot.10.:                            ; preds = %input_slice_fusion.in_bounds-true
  %21 = icmp ult i32 %3, 10
  br i1 %21, label %concatenate.pivot.0., label %concatenate.pivot.50.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.10.
  br label %concat_index_from_operand_id0

concatenate.pivot.50.:                            ; preds = %concatenate.pivot.10.
  %22 = icmp ult i32 %3, 50
  br i1 %22, label %concatenate.pivot.10.3, label %concatenate.pivot.50.4

concatenate.pivot.10.3:                           ; preds = %concatenate.pivot.50.
  br label %concat_index_from_operand_id1

concatenate.pivot.50.4:                           ; preds = %concatenate.pivot.50.
  br label %concat_index_from_operand_id2

concatenate.49.merge:                             ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %23 = phi double [ %constant_36_4, %concat_index_from_operand_id0 ], [ %constant_36_41, %concat_index_from_operand_id1 ], [ %constant_36_42, %concat_index_from_operand_id2 ]
  %24 = icmp sge i32 %3, 0
  %25 = icmp slt i32 %3, 10
  %26 = and i1 %24, %25
  br i1 %26, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.49.merge
  %27 = icmp sge i32 %3, 10
  %28 = icmp slt i32 %3, 50
  %29 = and i1 %27, %28
  br i1 %29, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %30 = icmp sge i32 %3, 50
  %31 = icmp slt i32 %3, 290
  %32 = and i1 %30, %31
  br i1 %32, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.49.merge
  %33 = sub i32 %3, 0
  %34 = getelementptr inbounds [10 x double], ptr %arg0, i32 0, i32 %33
  store double %23, ptr %34, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %35 = sub i32 %3, 10
  %36 = getelementptr inbounds [40 x double], ptr %arg1, i32 0, i32 %35
  store double %23, ptr %36, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %37 = sub i32 %3, 50
  %38 = getelementptr inbounds [240 x double], ptr %arg2, i32 0, i32 %37
  store double %23, ptr %38, align 8
  br label %slice2-after
}

define void @wrapped_transpose(ptr noalias align 16 dereferenceable(3072) %arg0, ptr noalias align 128 dereferenceable(3072) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %wrapped_transpose.in_bounds-true, label %wrapped_transpose.in_bounds-after

wrapped_transpose.in_bounds-after:                ; preds = %wrapped_transpose.in_bounds-true, %entry
  ret void

wrapped_transpose.in_bounds-true:                 ; preds = %entry
  %7 = getelementptr inbounds [4 x [192 x i32]], ptr %arg0, i32 0, i32 %4, i32 %5
  %8 = load i32, ptr %7, align 4, !invariant.load !297
  %9 = getelementptr i32, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds i32, ptr %9, i32 0
  store i32 %8, ptr %10, align 4
  br label %wrapped_transpose.in_bounds-after
}

define void @wrapped_transpose_1(ptr noalias align 16 dereferenceable(3072) %arg0, ptr noalias align 128 dereferenceable(3072) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %wrapped_transpose.1.in_bounds-true, label %wrapped_transpose.1.in_bounds-after

wrapped_transpose.1.in_bounds-after:              ; preds = %wrapped_transpose.1.in_bounds-true, %entry
  ret void

wrapped_transpose.1.in_bounds-true:               ; preds = %entry
  %7 = getelementptr inbounds [4 x [192 x float]], ptr %arg0, i32 0, i32 %4, i32 %5
  %8 = load float, ptr %7, align 4, !invariant.load !297
  %9 = getelementptr float, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds float, ptr %9, i32 0
  store float %8, ptr %10, align 4
  br label %wrapped_transpose.1.in_bounds-after
}

define void @loop_compare_fusion_5(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_compare_fusion.5.in_bounds-true, label %loop_compare_fusion.5.in_bounds-after

loop_compare_fusion.5.in_bounds-after:            ; preds = %loop_compare_fusion.5.in_bounds-true, %entry
  ret void

loop_compare_fusion.5.in_bounds-true:             ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !297
  %constant_1783_1 = load i64, ptr @3, align 8
  %5 = icmp slt i64 %4, %constant_1783_1
  %6 = zext i1 %5 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.5.in_bounds-after
}

define void @loop_clamp_convert_fusion(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_clamp_convert_fusion.in_bounds-true, label %loop_clamp_convert_fusion.in_bounds-after

loop_clamp_convert_fusion.in_bounds-after:        ; preds = %loop_clamp_convert_fusion.in_bounds-true, %entry
  ret void

loop_clamp_convert_fusion.in_bounds-true:         ; preds = %entry
  %4 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1786_7 = load i64, ptr @5, align 8
  %5 = icmp slt i64 %4, %constant_1786_7
  %6 = zext i1 %5 to i8
  %7 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1785_5 = load i64, ptr @6, align 8
  %8 = add i64 %7, %constant_1785_5
  %9 = load i64, ptr %arg1, align 8, !invariant.load !297
  %10 = trunc i8 %6 to i1
  %11 = select i1 %10, i64 %8, i64 %9
  %12 = trunc i64 %11 to i32
  %13 = icmp sge i32 0, %12
  %14 = select i1 %13, i32 0, i32 %12
  %15 = icmp sle i32 9, %14
  %dynamic-slice.1257.6.start_idx0 = select i1 %15, i32 9, i32 %14
  %constant_1786_71 = load i64, ptr @5, align 8
  %16 = trunc i64 %constant_1786_71 to i32
  %17 = icmp sge i32 0, %16
  %18 = select i1 %17, i32 0, i32 %16
  %19 = icmp sle i32 0, %18
  %dynamic-slice.1257.6.start_idx1 = select i1 %19, i32 0, i32 %18
  %20 = add i32 %dynamic-slice.1257.6.start_idx0, 0
  %21 = add i32 %dynamic-slice.1257.6.start_idx1, 1
  %22 = getelementptr inbounds [10 x [2 x i64]], ptr %arg0, i32 0, i32 %20, i32 %21
  %23 = load i64, ptr %22, align 8, !invariant.load !297
  %24 = getelementptr i64, ptr @8, i32 %linear_index
  %constant_1885_1 = getelementptr inbounds i64, ptr %24, i32 0
  %constant_1885_12 = load i64, ptr %constant_1885_1, align 8
  %25 = icmp ne i64 %23, %constant_1885_12
  %26 = zext i1 %25 to i8
  %27 = zext i8 %26 to i32
  %28 = insertvalue { i32, i32 } undef, i32 %27, 0
  %29 = getelementptr i32, ptr @7, i32 %linear_index
  %constant_1886_1_clone_1 = getelementptr inbounds i32, ptr %29, i32 0
  %constant_1886_1_clone_13 = load i32, ptr %constant_1886_1_clone_1, align 4
  %30 = trunc i64 %11 to i32
  %31 = icmp sge i32 0, %30
  %32 = select i1 %31, i32 0, i32 %30
  %33 = icmp sle i32 9, %32
  %dynamic-slice.1257.6.start_idx04 = select i1 %33, i32 9, i32 %32
  %constant_1786_75 = load i64, ptr @5, align 8
  %34 = trunc i64 %constant_1786_75 to i32
  %35 = icmp sge i32 0, %34
  %36 = select i1 %35, i32 0, i32 %34
  %37 = icmp sle i32 0, %36
  %dynamic-slice.1257.6.start_idx16 = select i1 %37, i32 0, i32 %36
  %38 = add i32 %dynamic-slice.1257.6.start_idx04, 0
  %39 = add i32 %dynamic-slice.1257.6.start_idx16, 0
  %40 = getelementptr inbounds [10 x [2 x i64]], ptr %arg0, i32 0, i32 %38, i32 %39
  %41 = load i64, ptr %40, align 8, !invariant.load !297
  %42 = trunc i64 %41 to i32
  %43 = getelementptr i32, ptr @4, i32 %linear_index
  %constant_1887_1_clone_1 = getelementptr inbounds i32, ptr %43, i32 0
  %constant_1887_1_clone_17 = load i32, ptr %constant_1887_1_clone_1, align 4
  %44 = icmp sge i32 %constant_1886_1_clone_13, %42
  %45 = select i1 %44, i32 %constant_1886_1_clone_13, i32 %42
  %46 = icmp sle i32 %constant_1887_1_clone_17, %45
  %47 = select i1 %46, i32 %constant_1887_1_clone_17, i32 %45
  %48 = insertvalue { i32, i32 } %28, i32 %47, 1
  %49 = extractvalue { i32, i32 } %48, 0
  store i32 %49, ptr %arg2, align 4
  %50 = extractvalue { i32, i32 } %48, 1
  %51 = getelementptr i32, ptr %arg3, i32 %linear_index
  %52 = getelementptr inbounds i32, ptr %51, i32 0
  store i32 %50, ptr %52, align 4
  br label %loop_clamp_convert_fusion.in_bounds-after
}

define void @loop_add_slice_fusion(ptr noalias align 16 dereferenceable(80) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !298
  %2 = mul nuw nsw i32 %0, 2
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = icmp ult i32 %linear_index, 2
  br i1 %6, label %loop_add_slice_fusion.in_bounds-true, label %loop_add_slice_fusion.in_bounds-after

loop_add_slice_fusion.in_bounds-after:            ; preds = %concatenate.48.1.merge, %entry
  ret void

loop_add_slice_fusion.in_bounds-true:             ; preds = %entry
  %7 = add i32 %5, 1
  %8 = add i32 %4, 0
  %9 = mul nuw nsw i32 %8, 1
  %10 = add nuw nsw i32 0, %9
  %11 = mul nuw nsw i32 %7, 2
  %12 = add nuw nsw i32 %10, %11
  %13 = udiv i32 %12, 4
  br label %concatenate.pivot.2.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %14 = phi i32 [ 0, %concatenate.pivot.0. ]
  %15 = sub nsw i32 %12, %14
  %16 = add i32 %15, 0
  %17 = mul nuw nsw i32 %16, 1
  %18 = add nuw nsw i32 0, %17
  %19 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1786_6 = load i64, ptr @10, align 8
  %20 = icmp slt i64 %19, %constant_1786_6
  %21 = zext i1 %20 to i8
  %22 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1785_4 = load i64, ptr @11, align 8
  %23 = add i64 %22, %constant_1785_4
  %24 = load i64, ptr %arg1, align 8, !invariant.load !297
  %25 = trunc i8 %21 to i1
  %26 = select i1 %25, i64 %23, i64 %24
  %27 = trunc i64 %26 to i32
  %28 = icmp sge i32 0, %27
  %29 = select i1 %28, i32 0, i32 %27
  %30 = icmp sle i32 9, %29
  %dynamic-slice.1256.95.clone.1.start_idx0 = select i1 %30, i32 9, i32 %29
  %constant_1786_61 = load i64, ptr @10, align 8
  %31 = trunc i64 %constant_1786_61 to i32
  %32 = icmp sge i32 0, %31
  %33 = select i1 %32, i32 0, i32 %31
  %34 = icmp sle i32 0, %33
  %dynamic-slice.1256.95.clone.1.start_idx1 = select i1 %34, i32 0, i32 %33
  %35 = add i32 %dynamic-slice.1256.95.clone.1.start_idx0, 0
  %36 = add i32 %dynamic-slice.1256.95.clone.1.start_idx1, 0
  %37 = getelementptr inbounds [10 x [2 x i32]], ptr %arg0, i32 0, i32 %35, i32 %36
  %38 = load i32, ptr %37, align 4, !invariant.load !297
  %39 = add i32 %18, %38
  %40 = add i32 %15, 2
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = trunc i64 %26 to i32
  %44 = icmp sge i32 0, %43
  %45 = select i1 %44, i32 0, i32 %43
  %46 = icmp sle i32 9, %45
  %dynamic-slice.1256.95.clone.1.start_idx02 = select i1 %46, i32 9, i32 %45
  %constant_1786_63 = load i64, ptr @10, align 8
  %47 = trunc i64 %constant_1786_63 to i32
  %48 = icmp sge i32 0, %47
  %49 = select i1 %48, i32 0, i32 %47
  %50 = icmp sle i32 0, %49
  %dynamic-slice.1256.95.clone.1.start_idx14 = select i1 %50, i32 0, i32 %49
  %51 = add i32 %dynamic-slice.1256.95.clone.1.start_idx02, 0
  %52 = add i32 %dynamic-slice.1256.95.clone.1.start_idx14, 1
  %53 = getelementptr inbounds [10 x [2 x i32]], ptr %arg0, i32 0, i32 %51, i32 %52
  %54 = load i32, ptr %53, align 4, !invariant.load !297
  %55 = add i32 %42, %54
  %56 = add i32 %39, %55
  %constant_1789_3 = load i32, ptr @23, align 4
  %57 = shl i32 %55, %constant_1789_3
  %shft.chk = icmp ult i32 %constant_1789_3, 32
  %58 = select i1 %shft.chk, i32 %57, i32 0
  %constant_1790_3 = load i32, ptr @14, align 4
  %59 = lshr i32 %55, %constant_1790_3
  %shft.chk5 = icmp ult i32 %constant_1790_3, 32
  %60 = select i1 %shft.chk5, i32 %59, i32 0
  %61 = or i32 %58, %60
  %62 = xor i32 %56, %61
  %63 = add i32 %56, %62
  %constant_1791_2 = load i32, ptr @19, align 4
  %64 = shl i32 %62, %constant_1791_2
  %shft.chk6 = icmp ult i32 %constant_1791_2, 32
  %65 = select i1 %shft.chk6, i32 %64, i32 0
  %constant_1792_2 = load i32, ptr @13, align 4
  %66 = lshr i32 %62, %constant_1792_2
  %shft.chk7 = icmp ult i32 %constant_1792_2, 32
  %67 = select i1 %shft.chk7, i32 %66, i32 0
  %68 = or i32 %65, %67
  %69 = xor i32 %63, %68
  %70 = add i32 %63, %69
  %constant_1793_2 = load i32, ptr @20, align 4
  %71 = shl i32 %69, %constant_1793_2
  %shft.chk8 = icmp ult i32 %constant_1793_2, 32
  %72 = select i1 %shft.chk8, i32 %71, i32 0
  %constant_1794_2 = load i32, ptr @12, align 4
  %73 = lshr i32 %69, %constant_1794_2
  %shft.chk9 = icmp ult i32 %constant_1794_2, 32
  %74 = select i1 %shft.chk9, i32 %73, i32 0
  %75 = or i32 %72, %74
  %76 = xor i32 %70, %75
  %77 = add i32 %70, %76
  %78 = add i32 %77, %54
  %79 = shl i32 %76, %constant_1794_2
  %shft.chk10 = icmp ult i32 %constant_1794_2, 32
  %80 = select i1 %shft.chk10, i32 %79, i32 0
  %81 = lshr i32 %76, %constant_1793_2
  %shft.chk11 = icmp ult i32 %constant_1793_2, 32
  %82 = select i1 %shft.chk11, i32 %81, i32 0
  %83 = or i32 %80, %82
  %84 = xor i32 %77, %83
  %85 = xor i32 %38, %54
  %constant_1795_2 = load i32, ptr @9, align 4
  %86 = xor i32 %85, %constant_1795_2
  %87 = add i32 %84, %86
  %constant_1796_2 = load i32, ptr @22, align 4
  %88 = add i32 %87, %constant_1796_2
  %89 = add i32 %78, %88
  %90 = shl i32 %88, %constant_1792_2
  %shft.chk12 = icmp ult i32 %constant_1792_2, 32
  %91 = select i1 %shft.chk12, i32 %90, i32 0
  %92 = lshr i32 %88, %constant_1791_2
  %shft.chk13 = icmp ult i32 %constant_1791_2, 32
  %93 = select i1 %shft.chk13, i32 %92, i32 0
  %94 = or i32 %91, %93
  %95 = xor i32 %89, %94
  %96 = add i32 %89, %95
  %constant_1797_1 = load i32, ptr @24, align 4
  %97 = shl i32 %95, %constant_1797_1
  %shft.chk14 = icmp ult i32 %constant_1797_1, 32
  %98 = select i1 %shft.chk14, i32 %97, i32 0
  %constant_1798_2 = load i32, ptr @18, align 4
  %99 = lshr i32 %95, %constant_1798_2
  %shft.chk15 = icmp ult i32 %constant_1798_2, 32
  %100 = select i1 %shft.chk15, i32 %99, i32 0
  %101 = or i32 %98, %100
  %102 = xor i32 %96, %101
  %103 = add i32 %96, %102
  %constant_1799_2 = load i32, ptr @17, align 4
  %104 = shl i32 %102, %constant_1799_2
  %shft.chk16 = icmp ult i32 %constant_1799_2, 32
  %105 = select i1 %shft.chk16, i32 %104, i32 0
  %106 = lshr i32 %102, %constant_1799_2
  %shft.chk17 = icmp ult i32 %constant_1799_2, 32
  %107 = select i1 %shft.chk17, i32 %106, i32 0
  %108 = or i32 %105, %107
  %109 = xor i32 %103, %108
  %110 = add i32 %103, %109
  %111 = add i32 %110, %86
  %constant_1800_3 = load i32, ptr @25, align 4
  %112 = shl i32 %109, %constant_1800_3
  %shft.chk18 = icmp ult i32 %constant_1800_3, 32
  %113 = select i1 %shft.chk18, i32 %112, i32 0
  %constant_1801_3 = load i32, ptr @16, align 4
  %114 = lshr i32 %109, %constant_1801_3
  %shft.chk19 = icmp ult i32 %constant_1801_3, 32
  %115 = select i1 %shft.chk19, i32 %114, i32 0
  %116 = or i32 %113, %115
  %117 = xor i32 %110, %116
  %118 = add i32 %117, %38
  %constant_1802_3 = load i32, ptr @21, align 4
  %119 = add i32 %118, %constant_1802_3
  %120 = add i32 %111, %119
  %121 = shl i32 %119, %constant_1789_3
  %shft.chk20 = icmp ult i32 %constant_1789_3, 32
  %122 = select i1 %shft.chk20, i32 %121, i32 0
  %123 = lshr i32 %119, %constant_1790_3
  %shft.chk21 = icmp ult i32 %constant_1790_3, 32
  %124 = select i1 %shft.chk21, i32 %123, i32 0
  %125 = or i32 %122, %124
  %126 = xor i32 %120, %125
  %127 = add i32 %120, %126
  %128 = shl i32 %126, %constant_1791_2
  %shft.chk22 = icmp ult i32 %constant_1791_2, 32
  %129 = select i1 %shft.chk22, i32 %128, i32 0
  %130 = lshr i32 %126, %constant_1792_2
  %shft.chk23 = icmp ult i32 %constant_1792_2, 32
  %131 = select i1 %shft.chk23, i32 %130, i32 0
  %132 = or i32 %129, %131
  %133 = xor i32 %127, %132
  %134 = add i32 %127, %133
  %135 = shl i32 %133, %constant_1793_2
  %shft.chk24 = icmp ult i32 %constant_1793_2, 32
  %136 = select i1 %shft.chk24, i32 %135, i32 0
  %137 = lshr i32 %133, %constant_1794_2
  %shft.chk25 = icmp ult i32 %constant_1794_2, 32
  %138 = select i1 %shft.chk25, i32 %137, i32 0
  %139 = or i32 %136, %138
  %140 = xor i32 %134, %139
  %141 = add i32 %134, %140
  %142 = add i32 %141, %38
  %143 = shl i32 %140, %constant_1794_2
  %shft.chk26 = icmp ult i32 %constant_1794_2, 32
  %144 = select i1 %shft.chk26, i32 %143, i32 0
  %145 = lshr i32 %140, %constant_1793_2
  %shft.chk27 = icmp ult i32 %constant_1793_2, 32
  %146 = select i1 %shft.chk27, i32 %145, i32 0
  %147 = or i32 %144, %146
  %148 = xor i32 %141, %147
  %149 = add i32 %148, %54
  %150 = add i32 %149, %constant_1798_2
  %151 = add i32 %142, %150
  %152 = shl i32 %150, %constant_1792_2
  %shft.chk28 = icmp ult i32 %constant_1792_2, 32
  %153 = select i1 %shft.chk28, i32 %152, i32 0
  %154 = lshr i32 %150, %constant_1791_2
  %shft.chk29 = icmp ult i32 %constant_1791_2, 32
  %155 = select i1 %shft.chk29, i32 %154, i32 0
  %156 = or i32 %153, %155
  %157 = xor i32 %151, %156
  %158 = add i32 %151, %157
  %159 = shl i32 %157, %constant_1797_1
  %shft.chk30 = icmp ult i32 %constant_1797_1, 32
  %160 = select i1 %shft.chk30, i32 %159, i32 0
  %161 = lshr i32 %157, %constant_1798_2
  %shft.chk31 = icmp ult i32 %constant_1798_2, 32
  %162 = select i1 %shft.chk31, i32 %161, i32 0
  %163 = or i32 %160, %162
  %164 = xor i32 %158, %163
  %165 = add i32 %158, %164
  %166 = shl i32 %164, %constant_1799_2
  %shft.chk32 = icmp ult i32 %constant_1799_2, 32
  %167 = select i1 %shft.chk32, i32 %166, i32 0
  %168 = lshr i32 %164, %constant_1799_2
  %shft.chk33 = icmp ult i32 %constant_1799_2, 32
  %169 = select i1 %shft.chk33, i32 %168, i32 0
  %170 = or i32 %167, %169
  %171 = xor i32 %165, %170
  %172 = add i32 %165, %171
  %173 = add i32 %172, %54
  %174 = shl i32 %171, %constant_1800_3
  %shft.chk34 = icmp ult i32 %constant_1800_3, 32
  %175 = select i1 %shft.chk34, i32 %174, i32 0
  %176 = lshr i32 %171, %constant_1801_3
  %shft.chk35 = icmp ult i32 %constant_1801_3, 32
  %177 = select i1 %shft.chk35, i32 %176, i32 0
  %178 = or i32 %175, %177
  %179 = xor i32 %172, %178
  %180 = add i32 %179, %86
  %constant_1803_3 = load i32, ptr @15, align 4
  %181 = add i32 %180, %constant_1803_3
  %182 = add i32 %173, %181
  %183 = shl i32 %181, %constant_1789_3
  %shft.chk36 = icmp ult i32 %constant_1789_3, 32
  %184 = select i1 %shft.chk36, i32 %183, i32 0
  %185 = lshr i32 %181, %constant_1790_3
  %shft.chk37 = icmp ult i32 %constant_1790_3, 32
  %186 = select i1 %shft.chk37, i32 %185, i32 0
  %187 = or i32 %184, %186
  %188 = xor i32 %182, %187
  %189 = add i32 %182, %188
  %190 = shl i32 %188, %constant_1791_2
  %shft.chk38 = icmp ult i32 %constant_1791_2, 32
  %191 = select i1 %shft.chk38, i32 %190, i32 0
  %192 = lshr i32 %188, %constant_1792_2
  %shft.chk39 = icmp ult i32 %constant_1792_2, 32
  %193 = select i1 %shft.chk39, i32 %192, i32 0
  %194 = or i32 %191, %193
  %195 = xor i32 %189, %194
  %196 = add i32 %189, %195
  %197 = shl i32 %195, %constant_1793_2
  %shft.chk40 = icmp ult i32 %constant_1793_2, 32
  %198 = select i1 %shft.chk40, i32 %197, i32 0
  %199 = lshr i32 %195, %constant_1794_2
  %shft.chk41 = icmp ult i32 %constant_1794_2, 32
  %200 = select i1 %shft.chk41, i32 %199, i32 0
  %201 = or i32 %198, %200
  %202 = xor i32 %196, %201
  %203 = add i32 %196, %202
  %204 = add i32 %203, %86
  br label %concatenate.48.1.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.2.105
  %205 = phi i32 [ 2, %concatenate.pivot.2.105 ]
  %206 = sub nsw i32 %12, %205
  %207 = add i32 %206, 0
  %208 = mul nuw nsw i32 %207, 1
  %209 = add nuw nsw i32 0, %208
  %210 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1786_642 = load i64, ptr @10, align 8
  %211 = icmp slt i64 %210, %constant_1786_642
  %212 = zext i1 %211 to i8
  %213 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1785_443 = load i64, ptr @11, align 8
  %214 = add i64 %213, %constant_1785_443
  %215 = load i64, ptr %arg1, align 8, !invariant.load !297
  %216 = trunc i8 %212 to i1
  %217 = select i1 %216, i64 %214, i64 %215
  %218 = trunc i64 %217 to i32
  %219 = icmp sge i32 0, %218
  %220 = select i1 %219, i32 0, i32 %218
  %221 = icmp sle i32 9, %220
  %dynamic-slice.1256.95.clone.1.start_idx044 = select i1 %221, i32 9, i32 %220
  %constant_1786_645 = load i64, ptr @10, align 8
  %222 = trunc i64 %constant_1786_645 to i32
  %223 = icmp sge i32 0, %222
  %224 = select i1 %223, i32 0, i32 %222
  %225 = icmp sle i32 0, %224
  %dynamic-slice.1256.95.clone.1.start_idx146 = select i1 %225, i32 0, i32 %224
  %226 = add i32 %dynamic-slice.1256.95.clone.1.start_idx044, 0
  %227 = add i32 %dynamic-slice.1256.95.clone.1.start_idx146, 0
  %228 = getelementptr inbounds [10 x [2 x i32]], ptr %arg0, i32 0, i32 %226, i32 %227
  %229 = load i32, ptr %228, align 4, !invariant.load !297
  %230 = add i32 %209, %229
  %231 = add i32 %206, 2
  %232 = mul nuw nsw i32 %231, 1
  %233 = add nuw nsw i32 0, %232
  %234 = trunc i64 %217 to i32
  %235 = icmp sge i32 0, %234
  %236 = select i1 %235, i32 0, i32 %234
  %237 = icmp sle i32 9, %236
  %dynamic-slice.1256.95.clone.1.start_idx047 = select i1 %237, i32 9, i32 %236
  %constant_1786_648 = load i64, ptr @10, align 8
  %238 = trunc i64 %constant_1786_648 to i32
  %239 = icmp sge i32 0, %238
  %240 = select i1 %239, i32 0, i32 %238
  %241 = icmp sle i32 0, %240
  %dynamic-slice.1256.95.clone.1.start_idx149 = select i1 %241, i32 0, i32 %240
  %242 = add i32 %dynamic-slice.1256.95.clone.1.start_idx047, 0
  %243 = add i32 %dynamic-slice.1256.95.clone.1.start_idx149, 1
  %244 = getelementptr inbounds [10 x [2 x i32]], ptr %arg0, i32 0, i32 %242, i32 %243
  %245 = load i32, ptr %244, align 4, !invariant.load !297
  %246 = add i32 %233, %245
  %247 = add i32 %230, %246
  %constant_1789_350 = load i32, ptr @23, align 4
  %248 = shl i32 %246, %constant_1789_350
  %shft.chk51 = icmp ult i32 %constant_1789_350, 32
  %249 = select i1 %shft.chk51, i32 %248, i32 0
  %constant_1790_352 = load i32, ptr @14, align 4
  %250 = lshr i32 %246, %constant_1790_352
  %shft.chk53 = icmp ult i32 %constant_1790_352, 32
  %251 = select i1 %shft.chk53, i32 %250, i32 0
  %252 = or i32 %249, %251
  %253 = xor i32 %247, %252
  %254 = add i32 %247, %253
  %constant_1791_254 = load i32, ptr @19, align 4
  %255 = shl i32 %253, %constant_1791_254
  %shft.chk55 = icmp ult i32 %constant_1791_254, 32
  %256 = select i1 %shft.chk55, i32 %255, i32 0
  %constant_1792_256 = load i32, ptr @13, align 4
  %257 = lshr i32 %253, %constant_1792_256
  %shft.chk57 = icmp ult i32 %constant_1792_256, 32
  %258 = select i1 %shft.chk57, i32 %257, i32 0
  %259 = or i32 %256, %258
  %260 = xor i32 %254, %259
  %261 = add i32 %254, %260
  %constant_1793_258 = load i32, ptr @20, align 4
  %262 = shl i32 %260, %constant_1793_258
  %shft.chk59 = icmp ult i32 %constant_1793_258, 32
  %263 = select i1 %shft.chk59, i32 %262, i32 0
  %constant_1794_260 = load i32, ptr @12, align 4
  %264 = lshr i32 %260, %constant_1794_260
  %shft.chk61 = icmp ult i32 %constant_1794_260, 32
  %265 = select i1 %shft.chk61, i32 %264, i32 0
  %266 = or i32 %263, %265
  %267 = xor i32 %261, %266
  %268 = add i32 %261, %267
  %269 = add i32 %268, %245
  %270 = shl i32 %267, %constant_1794_260
  %shft.chk62 = icmp ult i32 %constant_1794_260, 32
  %271 = select i1 %shft.chk62, i32 %270, i32 0
  %272 = lshr i32 %267, %constant_1793_258
  %shft.chk63 = icmp ult i32 %constant_1793_258, 32
  %273 = select i1 %shft.chk63, i32 %272, i32 0
  %274 = or i32 %271, %273
  %275 = xor i32 %268, %274
  %276 = xor i32 %229, %245
  %constant_1795_264 = load i32, ptr @9, align 4
  %277 = xor i32 %276, %constant_1795_264
  %278 = add i32 %275, %277
  %constant_1796_265 = load i32, ptr @22, align 4
  %279 = add i32 %278, %constant_1796_265
  %280 = add i32 %269, %279
  %281 = shl i32 %279, %constant_1792_256
  %shft.chk66 = icmp ult i32 %constant_1792_256, 32
  %282 = select i1 %shft.chk66, i32 %281, i32 0
  %283 = lshr i32 %279, %constant_1791_254
  %shft.chk67 = icmp ult i32 %constant_1791_254, 32
  %284 = select i1 %shft.chk67, i32 %283, i32 0
  %285 = or i32 %282, %284
  %286 = xor i32 %280, %285
  %287 = add i32 %280, %286
  %constant_1797_168 = load i32, ptr @24, align 4
  %288 = shl i32 %286, %constant_1797_168
  %shft.chk69 = icmp ult i32 %constant_1797_168, 32
  %289 = select i1 %shft.chk69, i32 %288, i32 0
  %constant_1798_270 = load i32, ptr @18, align 4
  %290 = lshr i32 %286, %constant_1798_270
  %shft.chk71 = icmp ult i32 %constant_1798_270, 32
  %291 = select i1 %shft.chk71, i32 %290, i32 0
  %292 = or i32 %289, %291
  %293 = xor i32 %287, %292
  %294 = add i32 %287, %293
  %constant_1799_272 = load i32, ptr @17, align 4
  %295 = shl i32 %293, %constant_1799_272
  %shft.chk73 = icmp ult i32 %constant_1799_272, 32
  %296 = select i1 %shft.chk73, i32 %295, i32 0
  %297 = lshr i32 %293, %constant_1799_272
  %shft.chk74 = icmp ult i32 %constant_1799_272, 32
  %298 = select i1 %shft.chk74, i32 %297, i32 0
  %299 = or i32 %296, %298
  %300 = xor i32 %294, %299
  %301 = add i32 %294, %300
  %302 = add i32 %301, %277
  %constant_1800_375 = load i32, ptr @25, align 4
  %303 = shl i32 %300, %constant_1800_375
  %shft.chk76 = icmp ult i32 %constant_1800_375, 32
  %304 = select i1 %shft.chk76, i32 %303, i32 0
  %constant_1801_377 = load i32, ptr @16, align 4
  %305 = lshr i32 %300, %constant_1801_377
  %shft.chk78 = icmp ult i32 %constant_1801_377, 32
  %306 = select i1 %shft.chk78, i32 %305, i32 0
  %307 = or i32 %304, %306
  %308 = xor i32 %301, %307
  %309 = add i32 %308, %229
  %constant_1802_379 = load i32, ptr @21, align 4
  %310 = add i32 %309, %constant_1802_379
  %311 = add i32 %302, %310
  %312 = shl i32 %310, %constant_1789_350
  %shft.chk80 = icmp ult i32 %constant_1789_350, 32
  %313 = select i1 %shft.chk80, i32 %312, i32 0
  %314 = lshr i32 %310, %constant_1790_352
  %shft.chk81 = icmp ult i32 %constant_1790_352, 32
  %315 = select i1 %shft.chk81, i32 %314, i32 0
  %316 = or i32 %313, %315
  %317 = xor i32 %311, %316
  %318 = add i32 %311, %317
  %319 = shl i32 %317, %constant_1791_254
  %shft.chk82 = icmp ult i32 %constant_1791_254, 32
  %320 = select i1 %shft.chk82, i32 %319, i32 0
  %321 = lshr i32 %317, %constant_1792_256
  %shft.chk83 = icmp ult i32 %constant_1792_256, 32
  %322 = select i1 %shft.chk83, i32 %321, i32 0
  %323 = or i32 %320, %322
  %324 = xor i32 %318, %323
  %325 = add i32 %318, %324
  %326 = shl i32 %324, %constant_1793_258
  %shft.chk84 = icmp ult i32 %constant_1793_258, 32
  %327 = select i1 %shft.chk84, i32 %326, i32 0
  %328 = lshr i32 %324, %constant_1794_260
  %shft.chk85 = icmp ult i32 %constant_1794_260, 32
  %329 = select i1 %shft.chk85, i32 %328, i32 0
  %330 = or i32 %327, %329
  %331 = xor i32 %325, %330
  %332 = add i32 %325, %331
  %333 = add i32 %332, %229
  %334 = shl i32 %331, %constant_1794_260
  %shft.chk86 = icmp ult i32 %constant_1794_260, 32
  %335 = select i1 %shft.chk86, i32 %334, i32 0
  %336 = lshr i32 %331, %constant_1793_258
  %shft.chk87 = icmp ult i32 %constant_1793_258, 32
  %337 = select i1 %shft.chk87, i32 %336, i32 0
  %338 = or i32 %335, %337
  %339 = xor i32 %332, %338
  %340 = add i32 %339, %245
  %341 = add i32 %340, %constant_1798_270
  %342 = add i32 %333, %341
  %343 = shl i32 %341, %constant_1792_256
  %shft.chk88 = icmp ult i32 %constant_1792_256, 32
  %344 = select i1 %shft.chk88, i32 %343, i32 0
  %345 = lshr i32 %341, %constant_1791_254
  %shft.chk89 = icmp ult i32 %constant_1791_254, 32
  %346 = select i1 %shft.chk89, i32 %345, i32 0
  %347 = or i32 %344, %346
  %348 = xor i32 %342, %347
  %349 = add i32 %342, %348
  %350 = shl i32 %348, %constant_1797_168
  %shft.chk90 = icmp ult i32 %constant_1797_168, 32
  %351 = select i1 %shft.chk90, i32 %350, i32 0
  %352 = lshr i32 %348, %constant_1798_270
  %shft.chk91 = icmp ult i32 %constant_1798_270, 32
  %353 = select i1 %shft.chk91, i32 %352, i32 0
  %354 = or i32 %351, %353
  %355 = xor i32 %349, %354
  %356 = add i32 %349, %355
  %357 = shl i32 %355, %constant_1799_272
  %shft.chk92 = icmp ult i32 %constant_1799_272, 32
  %358 = select i1 %shft.chk92, i32 %357, i32 0
  %359 = lshr i32 %355, %constant_1799_272
  %shft.chk93 = icmp ult i32 %constant_1799_272, 32
  %360 = select i1 %shft.chk93, i32 %359, i32 0
  %361 = or i32 %358, %360
  %362 = xor i32 %356, %361
  %363 = add i32 %356, %362
  %364 = add i32 %363, %245
  %365 = shl i32 %362, %constant_1800_375
  %shft.chk94 = icmp ult i32 %constant_1800_375, 32
  %366 = select i1 %shft.chk94, i32 %365, i32 0
  %367 = lshr i32 %362, %constant_1801_377
  %shft.chk95 = icmp ult i32 %constant_1801_377, 32
  %368 = select i1 %shft.chk95, i32 %367, i32 0
  %369 = or i32 %366, %368
  %370 = xor i32 %363, %369
  %371 = add i32 %370, %277
  %constant_1803_396 = load i32, ptr @15, align 4
  %372 = add i32 %371, %constant_1803_396
  %373 = add i32 %364, %372
  %374 = shl i32 %372, %constant_1789_350
  %shft.chk97 = icmp ult i32 %constant_1789_350, 32
  %375 = select i1 %shft.chk97, i32 %374, i32 0
  %376 = lshr i32 %372, %constant_1790_352
  %shft.chk98 = icmp ult i32 %constant_1790_352, 32
  %377 = select i1 %shft.chk98, i32 %376, i32 0
  %378 = or i32 %375, %377
  %379 = xor i32 %373, %378
  %380 = add i32 %373, %379
  %381 = shl i32 %379, %constant_1791_254
  %shft.chk99 = icmp ult i32 %constant_1791_254, 32
  %382 = select i1 %shft.chk99, i32 %381, i32 0
  %383 = lshr i32 %379, %constant_1792_256
  %shft.chk100 = icmp ult i32 %constant_1792_256, 32
  %384 = select i1 %shft.chk100, i32 %383, i32 0
  %385 = or i32 %382, %384
  %386 = xor i32 %380, %385
  %387 = add i32 %380, %386
  %388 = shl i32 %386, %constant_1793_258
  %shft.chk101 = icmp ult i32 %constant_1793_258, 32
  %389 = select i1 %shft.chk101, i32 %388, i32 0
  %390 = lshr i32 %386, %constant_1794_260
  %shft.chk102 = icmp ult i32 %constant_1794_260, 32
  %391 = select i1 %shft.chk102, i32 %390, i32 0
  %392 = or i32 %389, %391
  %393 = xor i32 %387, %392
  %394 = add i32 %387, %393
  %395 = shl i32 %393, %constant_1794_260
  %shft.chk103 = icmp ult i32 %constant_1794_260, 32
  %396 = select i1 %shft.chk103, i32 %395, i32 0
  %397 = lshr i32 %393, %constant_1793_258
  %shft.chk104 = icmp ult i32 %constant_1793_258, 32
  %398 = select i1 %shft.chk104, i32 %397, i32 0
  %399 = or i32 %396, %398
  %400 = xor i32 %394, %399
  %401 = add i32 %400, %229
  %constant_1804_1 = load i32, ptr @26, align 4
  %402 = add i32 %401, %constant_1804_1
  br label %concatenate.48.1.merge

concatenate.pivot.2.:                             ; preds = %loop_add_slice_fusion.in_bounds-true
  %403 = icmp ult i32 %12, 2
  br i1 %403, label %concatenate.pivot.0., label %concatenate.pivot.2.105

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.2.
  br label %concat_index_from_operand_id0

concatenate.pivot.2.105:                          ; preds = %concatenate.pivot.2.
  br label %concat_index_from_operand_id1

concatenate.48.1.merge:                           ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %404 = phi i32 [ %204, %concat_index_from_operand_id0 ], [ %402, %concat_index_from_operand_id1 ]
  %405 = insertvalue { i32, i32 } undef, i32 %404, 0
  %406 = add i32 %4, 0
  %407 = mul nuw nsw i32 %406, 1
  %408 = add nuw nsw i32 0, %407
  %409 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1786_6106 = load i64, ptr @10, align 8
  %410 = icmp slt i64 %409, %constant_1786_6106
  %411 = zext i1 %410 to i8
  %412 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1785_4107 = load i64, ptr @11, align 8
  %413 = add i64 %412, %constant_1785_4107
  %414 = load i64, ptr %arg1, align 8, !invariant.load !297
  %415 = trunc i8 %411 to i1
  %416 = select i1 %415, i64 %413, i64 %414
  %417 = trunc i64 %416 to i32
  %418 = icmp sge i32 0, %417
  %419 = select i1 %418, i32 0, i32 %417
  %420 = icmp sle i32 9, %419
  %dynamic-slice.1256.95.clone.1.start_idx0108 = select i1 %420, i32 9, i32 %419
  %constant_1786_6109 = load i64, ptr @10, align 8
  %421 = trunc i64 %constant_1786_6109 to i32
  %422 = icmp sge i32 0, %421
  %423 = select i1 %422, i32 0, i32 %421
  %424 = icmp sle i32 0, %423
  %dynamic-slice.1256.95.clone.1.start_idx1110 = select i1 %424, i32 0, i32 %423
  %425 = add i32 %dynamic-slice.1256.95.clone.1.start_idx0108, 0
  %426 = add i32 %dynamic-slice.1256.95.clone.1.start_idx1110, 0
  %427 = getelementptr inbounds [10 x [2 x i32]], ptr %arg0, i32 0, i32 %425, i32 %426
  %428 = load i32, ptr %427, align 4, !invariant.load !297
  %429 = add i32 %408, %428
  %430 = add i32 %4, 2
  %431 = mul nuw nsw i32 %430, 1
  %432 = add nuw nsw i32 0, %431
  %433 = trunc i64 %416 to i32
  %434 = icmp sge i32 0, %433
  %435 = select i1 %434, i32 0, i32 %433
  %436 = icmp sle i32 9, %435
  %dynamic-slice.1256.95.clone.1.start_idx0111 = select i1 %436, i32 9, i32 %435
  %constant_1786_6112 = load i64, ptr @10, align 8
  %437 = trunc i64 %constant_1786_6112 to i32
  %438 = icmp sge i32 0, %437
  %439 = select i1 %438, i32 0, i32 %437
  %440 = icmp sle i32 0, %439
  %dynamic-slice.1256.95.clone.1.start_idx1113 = select i1 %440, i32 0, i32 %439
  %441 = add i32 %dynamic-slice.1256.95.clone.1.start_idx0111, 0
  %442 = add i32 %dynamic-slice.1256.95.clone.1.start_idx1113, 1
  %443 = getelementptr inbounds [10 x [2 x i32]], ptr %arg0, i32 0, i32 %441, i32 %442
  %444 = load i32, ptr %443, align 4, !invariant.load !297
  %445 = add i32 %432, %444
  %446 = add i32 %429, %445
  %constant_1789_3114 = load i32, ptr @23, align 4
  %447 = shl i32 %445, %constant_1789_3114
  %shft.chk115 = icmp ult i32 %constant_1789_3114, 32
  %448 = select i1 %shft.chk115, i32 %447, i32 0
  %constant_1790_3116 = load i32, ptr @14, align 4
  %449 = lshr i32 %445, %constant_1790_3116
  %shft.chk117 = icmp ult i32 %constant_1790_3116, 32
  %450 = select i1 %shft.chk117, i32 %449, i32 0
  %451 = or i32 %448, %450
  %452 = xor i32 %446, %451
  %453 = add i32 %446, %452
  %constant_1791_2118 = load i32, ptr @19, align 4
  %454 = shl i32 %452, %constant_1791_2118
  %shft.chk119 = icmp ult i32 %constant_1791_2118, 32
  %455 = select i1 %shft.chk119, i32 %454, i32 0
  %constant_1792_2120 = load i32, ptr @13, align 4
  %456 = lshr i32 %452, %constant_1792_2120
  %shft.chk121 = icmp ult i32 %constant_1792_2120, 32
  %457 = select i1 %shft.chk121, i32 %456, i32 0
  %458 = or i32 %455, %457
  %459 = xor i32 %453, %458
  %460 = add i32 %453, %459
  %constant_1793_2122 = load i32, ptr @20, align 4
  %461 = shl i32 %459, %constant_1793_2122
  %shft.chk123 = icmp ult i32 %constant_1793_2122, 32
  %462 = select i1 %shft.chk123, i32 %461, i32 0
  %constant_1794_2124 = load i32, ptr @12, align 4
  %463 = lshr i32 %459, %constant_1794_2124
  %shft.chk125 = icmp ult i32 %constant_1794_2124, 32
  %464 = select i1 %shft.chk125, i32 %463, i32 0
  %465 = or i32 %462, %464
  %466 = xor i32 %460, %465
  %467 = add i32 %460, %466
  %468 = add i32 %467, %444
  %469 = shl i32 %466, %constant_1794_2124
  %shft.chk126 = icmp ult i32 %constant_1794_2124, 32
  %470 = select i1 %shft.chk126, i32 %469, i32 0
  %471 = lshr i32 %466, %constant_1793_2122
  %shft.chk127 = icmp ult i32 %constant_1793_2122, 32
  %472 = select i1 %shft.chk127, i32 %471, i32 0
  %473 = or i32 %470, %472
  %474 = xor i32 %467, %473
  %475 = xor i32 %428, %444
  %constant_1795_2128 = load i32, ptr @9, align 4
  %476 = xor i32 %475, %constant_1795_2128
  %477 = add i32 %474, %476
  %constant_1796_2129 = load i32, ptr @22, align 4
  %478 = add i32 %477, %constant_1796_2129
  %479 = add i32 %468, %478
  %480 = shl i32 %478, %constant_1792_2120
  %shft.chk130 = icmp ult i32 %constant_1792_2120, 32
  %481 = select i1 %shft.chk130, i32 %480, i32 0
  %482 = lshr i32 %478, %constant_1791_2118
  %shft.chk131 = icmp ult i32 %constant_1791_2118, 32
  %483 = select i1 %shft.chk131, i32 %482, i32 0
  %484 = or i32 %481, %483
  %485 = xor i32 %479, %484
  %486 = add i32 %479, %485
  %constant_1797_1132 = load i32, ptr @24, align 4
  %487 = shl i32 %485, %constant_1797_1132
  %shft.chk133 = icmp ult i32 %constant_1797_1132, 32
  %488 = select i1 %shft.chk133, i32 %487, i32 0
  %constant_1798_2134 = load i32, ptr @18, align 4
  %489 = lshr i32 %485, %constant_1798_2134
  %shft.chk135 = icmp ult i32 %constant_1798_2134, 32
  %490 = select i1 %shft.chk135, i32 %489, i32 0
  %491 = or i32 %488, %490
  %492 = xor i32 %486, %491
  %493 = add i32 %486, %492
  %constant_1799_2136 = load i32, ptr @17, align 4
  %494 = shl i32 %492, %constant_1799_2136
  %shft.chk137 = icmp ult i32 %constant_1799_2136, 32
  %495 = select i1 %shft.chk137, i32 %494, i32 0
  %496 = lshr i32 %492, %constant_1799_2136
  %shft.chk138 = icmp ult i32 %constant_1799_2136, 32
  %497 = select i1 %shft.chk138, i32 %496, i32 0
  %498 = or i32 %495, %497
  %499 = xor i32 %493, %498
  %500 = add i32 %493, %499
  %501 = add i32 %500, %476
  %constant_1800_3139 = load i32, ptr @25, align 4
  %502 = shl i32 %499, %constant_1800_3139
  %shft.chk140 = icmp ult i32 %constant_1800_3139, 32
  %503 = select i1 %shft.chk140, i32 %502, i32 0
  %constant_1801_3141 = load i32, ptr @16, align 4
  %504 = lshr i32 %499, %constant_1801_3141
  %shft.chk142 = icmp ult i32 %constant_1801_3141, 32
  %505 = select i1 %shft.chk142, i32 %504, i32 0
  %506 = or i32 %503, %505
  %507 = xor i32 %500, %506
  %508 = add i32 %507, %428
  %constant_1802_3143 = load i32, ptr @21, align 4
  %509 = add i32 %508, %constant_1802_3143
  %510 = add i32 %501, %509
  %511 = shl i32 %509, %constant_1789_3114
  %shft.chk144 = icmp ult i32 %constant_1789_3114, 32
  %512 = select i1 %shft.chk144, i32 %511, i32 0
  %513 = lshr i32 %509, %constant_1790_3116
  %shft.chk145 = icmp ult i32 %constant_1790_3116, 32
  %514 = select i1 %shft.chk145, i32 %513, i32 0
  %515 = or i32 %512, %514
  %516 = xor i32 %510, %515
  %517 = add i32 %510, %516
  %518 = shl i32 %516, %constant_1791_2118
  %shft.chk146 = icmp ult i32 %constant_1791_2118, 32
  %519 = select i1 %shft.chk146, i32 %518, i32 0
  %520 = lshr i32 %516, %constant_1792_2120
  %shft.chk147 = icmp ult i32 %constant_1792_2120, 32
  %521 = select i1 %shft.chk147, i32 %520, i32 0
  %522 = or i32 %519, %521
  %523 = xor i32 %517, %522
  %524 = add i32 %517, %523
  %525 = shl i32 %523, %constant_1793_2122
  %shft.chk148 = icmp ult i32 %constant_1793_2122, 32
  %526 = select i1 %shft.chk148, i32 %525, i32 0
  %527 = lshr i32 %523, %constant_1794_2124
  %shft.chk149 = icmp ult i32 %constant_1794_2124, 32
  %528 = select i1 %shft.chk149, i32 %527, i32 0
  %529 = or i32 %526, %528
  %530 = xor i32 %524, %529
  %531 = add i32 %524, %530
  %532 = add i32 %531, %428
  %533 = shl i32 %530, %constant_1794_2124
  %shft.chk150 = icmp ult i32 %constant_1794_2124, 32
  %534 = select i1 %shft.chk150, i32 %533, i32 0
  %535 = lshr i32 %530, %constant_1793_2122
  %shft.chk151 = icmp ult i32 %constant_1793_2122, 32
  %536 = select i1 %shft.chk151, i32 %535, i32 0
  %537 = or i32 %534, %536
  %538 = xor i32 %531, %537
  %539 = add i32 %538, %444
  %540 = add i32 %539, %constant_1798_2134
  %541 = add i32 %532, %540
  %542 = shl i32 %540, %constant_1792_2120
  %shft.chk152 = icmp ult i32 %constant_1792_2120, 32
  %543 = select i1 %shft.chk152, i32 %542, i32 0
  %544 = lshr i32 %540, %constant_1791_2118
  %shft.chk153 = icmp ult i32 %constant_1791_2118, 32
  %545 = select i1 %shft.chk153, i32 %544, i32 0
  %546 = or i32 %543, %545
  %547 = xor i32 %541, %546
  %548 = add i32 %541, %547
  %549 = shl i32 %547, %constant_1797_1132
  %shft.chk154 = icmp ult i32 %constant_1797_1132, 32
  %550 = select i1 %shft.chk154, i32 %549, i32 0
  %551 = lshr i32 %547, %constant_1798_2134
  %shft.chk155 = icmp ult i32 %constant_1798_2134, 32
  %552 = select i1 %shft.chk155, i32 %551, i32 0
  %553 = or i32 %550, %552
  %554 = xor i32 %548, %553
  %555 = add i32 %548, %554
  %556 = shl i32 %554, %constant_1799_2136
  %shft.chk156 = icmp ult i32 %constant_1799_2136, 32
  %557 = select i1 %shft.chk156, i32 %556, i32 0
  %558 = lshr i32 %554, %constant_1799_2136
  %shft.chk157 = icmp ult i32 %constant_1799_2136, 32
  %559 = select i1 %shft.chk157, i32 %558, i32 0
  %560 = or i32 %557, %559
  %561 = xor i32 %555, %560
  %562 = add i32 %555, %561
  %563 = add i32 %562, %444
  %564 = shl i32 %561, %constant_1800_3139
  %shft.chk158 = icmp ult i32 %constant_1800_3139, 32
  %565 = select i1 %shft.chk158, i32 %564, i32 0
  %566 = lshr i32 %561, %constant_1801_3141
  %shft.chk159 = icmp ult i32 %constant_1801_3141, 32
  %567 = select i1 %shft.chk159, i32 %566, i32 0
  %568 = or i32 %565, %567
  %569 = xor i32 %562, %568
  %570 = add i32 %569, %476
  %constant_1803_3160 = load i32, ptr @15, align 4
  %571 = add i32 %570, %constant_1803_3160
  %572 = add i32 %563, %571
  %573 = shl i32 %571, %constant_1789_3114
  %shft.chk161 = icmp ult i32 %constant_1789_3114, 32
  %574 = select i1 %shft.chk161, i32 %573, i32 0
  %575 = lshr i32 %571, %constant_1790_3116
  %shft.chk162 = icmp ult i32 %constant_1790_3116, 32
  %576 = select i1 %shft.chk162, i32 %575, i32 0
  %577 = or i32 %574, %576
  %578 = xor i32 %572, %577
  %579 = add i32 %572, %578
  %580 = shl i32 %578, %constant_1791_2118
  %shft.chk163 = icmp ult i32 %constant_1791_2118, 32
  %581 = select i1 %shft.chk163, i32 %580, i32 0
  %582 = lshr i32 %578, %constant_1792_2120
  %shft.chk164 = icmp ult i32 %constant_1792_2120, 32
  %583 = select i1 %shft.chk164, i32 %582, i32 0
  %584 = or i32 %581, %583
  %585 = xor i32 %579, %584
  %586 = add i32 %579, %585
  %587 = shl i32 %585, %constant_1793_2122
  %shft.chk165 = icmp ult i32 %constant_1793_2122, 32
  %588 = select i1 %shft.chk165, i32 %587, i32 0
  %589 = lshr i32 %585, %constant_1794_2124
  %shft.chk166 = icmp ult i32 %constant_1794_2124, 32
  %590 = select i1 %shft.chk166, i32 %589, i32 0
  %591 = or i32 %588, %590
  %592 = xor i32 %586, %591
  %593 = add i32 %586, %592
  %594 = add i32 %593, %476
  %595 = insertvalue { i32, i32 } %405, i32 %594, 1
  %596 = extractvalue { i32, i32 } %595, 0
  %597 = getelementptr i32, ptr %arg2, i32 %linear_index
  %598 = getelementptr inbounds i32, ptr %597, i32 0
  store i32 %596, ptr %598, align 4
  %599 = extractvalue { i32, i32 } %595, 1
  %600 = getelementptr i32, ptr %arg3, i32 %linear_index
  %601 = getelementptr inbounds i32, ptr %600, i32 0
  store i32 %599, ptr %601, align 4
  br label %loop_add_slice_fusion.in_bounds-after
}

define void @loop_multiply_fusion_2(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(192) %arg1, ptr noalias align 128 dereferenceable(192) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %2 = mul nuw nsw i32 %0, 24
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 24
  br i1 %4, label %loop_multiply_fusion.2.in_bounds-true, label %loop_multiply_fusion.2.in_bounds-after

loop_multiply_fusion.2.in_bounds-after:           ; preds = %loop_multiply_fusion.2.in_bounds-true, %entry
  ret void

loop_multiply_fusion.2.in_bounds-true:            ; preds = %entry
  %5 = getelementptr double, ptr %arg1, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = call double @__nv_rsqrt(double %7)
  %constant_1788_1 = load double, ptr @28, align 8
  %9 = add i32 %3, 0
  %10 = mul nuw nsw i32 %9, 1
  %11 = add nuw nsw i32 0, %10
  %12 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 0
  %13 = load i32, ptr %12, align 4, !invariant.load !297
  %14 = add i32 %11, %13
  %15 = add i32 %3, 24
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 1
  %19 = load i32, ptr %18, align 4, !invariant.load !297
  %20 = add i32 %17, %19
  %21 = add i32 %14, %20
  %constant_1789_1 = load i32, ptr @46, align 4
  %22 = shl i32 %20, %constant_1789_1
  %shft.chk = icmp ult i32 %constant_1789_1, 32
  %23 = select i1 %shft.chk, i32 %22, i32 0
  %constant_1790_1 = load i32, ptr @37, align 4
  %24 = lshr i32 %20, %constant_1790_1
  %shft.chk1 = icmp ult i32 %constant_1790_1, 32
  %25 = select i1 %shft.chk1, i32 %24, i32 0
  %26 = or i32 %23, %25
  %27 = xor i32 %21, %26
  %28 = add i32 %21, %27
  %constant_1791_1 = load i32, ptr @43, align 4
  %29 = shl i32 %27, %constant_1791_1
  %shft.chk2 = icmp ult i32 %constant_1791_1, 32
  %30 = select i1 %shft.chk2, i32 %29, i32 0
  %constant_1792_1 = load i32, ptr @36, align 4
  %31 = lshr i32 %27, %constant_1792_1
  %shft.chk3 = icmp ult i32 %constant_1792_1, 32
  %32 = select i1 %shft.chk3, i32 %31, i32 0
  %33 = or i32 %30, %32
  %34 = xor i32 %28, %33
  %35 = add i32 %28, %34
  %constant_1793_1 = load i32, ptr @34, align 4
  %36 = shl i32 %34, %constant_1793_1
  %shft.chk4 = icmp ult i32 %constant_1793_1, 32
  %37 = select i1 %shft.chk4, i32 %36, i32 0
  %constant_1794_1 = load i32, ptr @35, align 4
  %38 = lshr i32 %34, %constant_1794_1
  %shft.chk5 = icmp ult i32 %constant_1794_1, 32
  %39 = select i1 %shft.chk5, i32 %38, i32 0
  %40 = or i32 %37, %39
  %41 = xor i32 %35, %40
  %42 = add i32 %35, %41
  %43 = add i32 %42, %19
  %44 = shl i32 %41, %constant_1794_1
  %shft.chk6 = icmp ult i32 %constant_1794_1, 32
  %45 = select i1 %shft.chk6, i32 %44, i32 0
  %46 = lshr i32 %41, %constant_1793_1
  %shft.chk7 = icmp ult i32 %constant_1793_1, 32
  %47 = select i1 %shft.chk7, i32 %46, i32 0
  %48 = or i32 %45, %47
  %49 = xor i32 %42, %48
  %50 = xor i32 %13, %19
  %constant_1795_1 = load i32, ptr @39, align 4
  %51 = xor i32 %50, %constant_1795_1
  %52 = add i32 %49, %51
  %constant_1796_1 = load i32, ptr @45, align 4
  %53 = add i32 %52, %constant_1796_1
  %54 = add i32 %43, %53
  %55 = shl i32 %53, %constant_1792_1
  %shft.chk8 = icmp ult i32 %constant_1792_1, 32
  %56 = select i1 %shft.chk8, i32 %55, i32 0
  %57 = lshr i32 %53, %constant_1791_1
  %shft.chk9 = icmp ult i32 %constant_1791_1, 32
  %58 = select i1 %shft.chk9, i32 %57, i32 0
  %59 = or i32 %56, %58
  %60 = xor i32 %54, %59
  %61 = add i32 %54, %60
  %constant_1797_2 = load i32, ptr @47, align 4
  %62 = shl i32 %60, %constant_1797_2
  %shft.chk10 = icmp ult i32 %constant_1797_2, 32
  %63 = select i1 %shft.chk10, i32 %62, i32 0
  %constant_1798_1 = load i32, ptr @42, align 4
  %64 = lshr i32 %60, %constant_1798_1
  %shft.chk11 = icmp ult i32 %constant_1798_1, 32
  %65 = select i1 %shft.chk11, i32 %64, i32 0
  %66 = or i32 %63, %65
  %67 = xor i32 %61, %66
  %68 = add i32 %61, %67
  %constant_1799_1 = load i32, ptr @41, align 4
  %69 = shl i32 %67, %constant_1799_1
  %shft.chk12 = icmp ult i32 %constant_1799_1, 32
  %70 = select i1 %shft.chk12, i32 %69, i32 0
  %71 = lshr i32 %67, %constant_1799_1
  %shft.chk13 = icmp ult i32 %constant_1799_1, 32
  %72 = select i1 %shft.chk13, i32 %71, i32 0
  %73 = or i32 %70, %72
  %74 = xor i32 %68, %73
  %75 = add i32 %68, %74
  %76 = add i32 %75, %51
  %constant_1800_2 = load i32, ptr @48, align 4
  %77 = shl i32 %74, %constant_1800_2
  %shft.chk14 = icmp ult i32 %constant_1800_2, 32
  %78 = select i1 %shft.chk14, i32 %77, i32 0
  %constant_1801_2 = load i32, ptr @40, align 4
  %79 = lshr i32 %74, %constant_1801_2
  %shft.chk15 = icmp ult i32 %constant_1801_2, 32
  %80 = select i1 %shft.chk15, i32 %79, i32 0
  %81 = or i32 %78, %80
  %82 = xor i32 %75, %81
  %83 = add i32 %82, %13
  %constant_1802_1 = load i32, ptr @44, align 4
  %84 = add i32 %83, %constant_1802_1
  %85 = add i32 %76, %84
  %86 = shl i32 %84, %constant_1789_1
  %shft.chk16 = icmp ult i32 %constant_1789_1, 32
  %87 = select i1 %shft.chk16, i32 %86, i32 0
  %88 = lshr i32 %84, %constant_1790_1
  %shft.chk17 = icmp ult i32 %constant_1790_1, 32
  %89 = select i1 %shft.chk17, i32 %88, i32 0
  %90 = or i32 %87, %89
  %91 = xor i32 %85, %90
  %92 = add i32 %85, %91
  %93 = shl i32 %91, %constant_1791_1
  %shft.chk18 = icmp ult i32 %constant_1791_1, 32
  %94 = select i1 %shft.chk18, i32 %93, i32 0
  %95 = lshr i32 %91, %constant_1792_1
  %shft.chk19 = icmp ult i32 %constant_1792_1, 32
  %96 = select i1 %shft.chk19, i32 %95, i32 0
  %97 = or i32 %94, %96
  %98 = xor i32 %92, %97
  %99 = add i32 %92, %98
  %100 = shl i32 %98, %constant_1793_1
  %shft.chk20 = icmp ult i32 %constant_1793_1, 32
  %101 = select i1 %shft.chk20, i32 %100, i32 0
  %102 = lshr i32 %98, %constant_1794_1
  %shft.chk21 = icmp ult i32 %constant_1794_1, 32
  %103 = select i1 %shft.chk21, i32 %102, i32 0
  %104 = or i32 %101, %103
  %105 = xor i32 %99, %104
  %106 = add i32 %99, %105
  %107 = add i32 %106, %13
  %108 = shl i32 %105, %constant_1794_1
  %shft.chk22 = icmp ult i32 %constant_1794_1, 32
  %109 = select i1 %shft.chk22, i32 %108, i32 0
  %110 = lshr i32 %105, %constant_1793_1
  %shft.chk23 = icmp ult i32 %constant_1793_1, 32
  %111 = select i1 %shft.chk23, i32 %110, i32 0
  %112 = or i32 %109, %111
  %113 = xor i32 %106, %112
  %114 = add i32 %113, %19
  %115 = add i32 %114, %constant_1798_1
  %116 = add i32 %107, %115
  %117 = shl i32 %115, %constant_1792_1
  %shft.chk24 = icmp ult i32 %constant_1792_1, 32
  %118 = select i1 %shft.chk24, i32 %117, i32 0
  %119 = lshr i32 %115, %constant_1791_1
  %shft.chk25 = icmp ult i32 %constant_1791_1, 32
  %120 = select i1 %shft.chk25, i32 %119, i32 0
  %121 = or i32 %118, %120
  %122 = xor i32 %116, %121
  %123 = add i32 %116, %122
  %124 = shl i32 %122, %constant_1797_2
  %shft.chk26 = icmp ult i32 %constant_1797_2, 32
  %125 = select i1 %shft.chk26, i32 %124, i32 0
  %126 = lshr i32 %122, %constant_1798_1
  %shft.chk27 = icmp ult i32 %constant_1798_1, 32
  %127 = select i1 %shft.chk27, i32 %126, i32 0
  %128 = or i32 %125, %127
  %129 = xor i32 %123, %128
  %130 = add i32 %123, %129
  %131 = shl i32 %129, %constant_1799_1
  %shft.chk28 = icmp ult i32 %constant_1799_1, 32
  %132 = select i1 %shft.chk28, i32 %131, i32 0
  %133 = lshr i32 %129, %constant_1799_1
  %shft.chk29 = icmp ult i32 %constant_1799_1, 32
  %134 = select i1 %shft.chk29, i32 %133, i32 0
  %135 = or i32 %132, %134
  %136 = xor i32 %130, %135
  %137 = add i32 %130, %136
  %138 = add i32 %137, %19
  %139 = shl i32 %136, %constant_1800_2
  %shft.chk30 = icmp ult i32 %constant_1800_2, 32
  %140 = select i1 %shft.chk30, i32 %139, i32 0
  %141 = lshr i32 %136, %constant_1801_2
  %shft.chk31 = icmp ult i32 %constant_1801_2, 32
  %142 = select i1 %shft.chk31, i32 %141, i32 0
  %143 = or i32 %140, %142
  %144 = xor i32 %137, %143
  %145 = add i32 %144, %51
  %constant_1803_1 = load i32, ptr @38, align 4
  %146 = add i32 %145, %constant_1803_1
  %147 = add i32 %138, %146
  %148 = shl i32 %146, %constant_1789_1
  %shft.chk32 = icmp ult i32 %constant_1789_1, 32
  %149 = select i1 %shft.chk32, i32 %148, i32 0
  %150 = lshr i32 %146, %constant_1790_1
  %shft.chk33 = icmp ult i32 %constant_1790_1, 32
  %151 = select i1 %shft.chk33, i32 %150, i32 0
  %152 = or i32 %149, %151
  %153 = xor i32 %147, %152
  %154 = add i32 %147, %153
  %155 = shl i32 %153, %constant_1791_1
  %shft.chk34 = icmp ult i32 %constant_1791_1, 32
  %156 = select i1 %shft.chk34, i32 %155, i32 0
  %157 = lshr i32 %153, %constant_1792_1
  %shft.chk35 = icmp ult i32 %constant_1792_1, 32
  %158 = select i1 %shft.chk35, i32 %157, i32 0
  %159 = or i32 %156, %158
  %160 = xor i32 %154, %159
  %161 = add i32 %154, %160
  %162 = shl i32 %160, %constant_1793_1
  %shft.chk36 = icmp ult i32 %constant_1793_1, 32
  %163 = select i1 %shft.chk36, i32 %162, i32 0
  %164 = lshr i32 %160, %constant_1794_1
  %shft.chk37 = icmp ult i32 %constant_1794_1, 32
  %165 = select i1 %shft.chk37, i32 %164, i32 0
  %166 = or i32 %163, %165
  %167 = xor i32 %161, %166
  %168 = add i32 %161, %167
  %169 = add i32 %168, %51
  %170 = zext i32 %169 to i64
  %constant_1805_1 = load i64, ptr @49, align 8
  %171 = shl i64 %170, %constant_1805_1
  %shft.chk38 = icmp ult i64 %constant_1805_1, 64
  %172 = select i1 %shft.chk38, i64 %171, i64 0
  %173 = shl i32 %167, %constant_1794_1
  %shft.chk39 = icmp ult i32 %constant_1794_1, 32
  %174 = select i1 %shft.chk39, i32 %173, i32 0
  %175 = lshr i32 %167, %constant_1793_1
  %shft.chk40 = icmp ult i32 %constant_1793_1, 32
  %176 = select i1 %shft.chk40, i32 %175, i32 0
  %177 = or i32 %174, %176
  %178 = xor i32 %168, %177
  %179 = add i32 %178, %13
  %constant_1804_2 = load i32, ptr @33, align 4
  %180 = add i32 %179, %constant_1804_2
  %181 = zext i32 %180 to i64
  %182 = or i64 %172, %181
  %constant_1806_1 = load i64, ptr @32, align 8
  %183 = lshr i64 %182, %constant_1806_1
  %shft.chk41 = icmp ult i64 %constant_1806_1, 64
  %184 = select i1 %shft.chk41, i64 %183, i64 0
  %constant_1807_1 = load i64, ptr @31, align 8
  %185 = or i64 %184, %constant_1807_1
  %186 = bitcast i64 %185 to double
  %constant_1882_1 = load double, ptr @30, align 8
  %add.4161.7 = fadd double %186, %constant_1882_1
  %constant_1883_1 = load double, ptr @29, align 8
  %multiply.2984.5 = fmul double %add.4161.7, %constant_1883_1
  %add.4162.3 = fadd double %multiply.2984.5, %constant_1788_1
  %187 = fcmp une double %constant_1788_1, %constant_1788_1
  %188 = fcmp oeq double %add.4162.3, %add.4162.3
  %189 = fcmp oge double %constant_1788_1, %add.4162.3
  %190 = and i1 %188, %189
  %191 = or i1 %187, %190
  %maximum.44.3 = select i1 %191, double %constant_1788_1, double %add.4162.3
  %192 = call double @llvm.fabs.f64(double %maximum.44.3)
  %constant_1787_1 = load double, ptr @115, align 8
  %compare.665.3 = fcmp oeq double %192, %constant_1787_1
  %193 = zext i1 %compare.665.3 to i8
  %constant_1808_1 = load double, ptr @114, align 8
  %multiply.2985.5 = fmul double %maximum.44.3, %constant_1808_1
  %194 = fneg double %maximum.44.3
  %multiply.2986.5 = fmul double %maximum.44.3, %194
  %195 = call double @__nv_log1p(double %multiply.2986.5)
  %196 = fneg double %195
  %constant_1810_1 = load double, ptr @54, align 8
  %compare.666.25 = fcmp olt double %196, %constant_1810_1
  %197 = zext i1 %compare.666.25 to i8
  %constant_1812_1 = load double, ptr @52, align 8
  %compare.667.15 = fcmp olt double %196, %constant_1812_1
  %198 = zext i1 %compare.667.15 to i8
  %constant_1813_1 = load double, ptr @109, align 8
  %constant_1814_1 = load double, ptr @108, align 8
  %199 = trunc i8 %197 to i1
  %200 = select i1 %199, double %constant_1813_1, double %constant_1814_1
  %constant_1815_1 = load double, ptr @107, align 8
  %constant_1816_1 = load double, ptr @106, align 8
  %201 = trunc i8 %197 to i1
  %202 = select i1 %201, double %constant_1815_1, double %constant_1816_1
  %constant_1817_1 = load double, ptr @105, align 8
  %constant_1818_1 = load double, ptr @104, align 8
  %203 = trunc i8 %197 to i1
  %204 = select i1 %203, double %constant_1817_1, double %constant_1818_1
  %constant_1819_1 = load double, ptr @103, align 8
  %205 = trunc i8 %198 to i1
  %206 = select i1 %205, double %204, double %constant_1819_1
  %constant_1820_1 = load double, ptr @102, align 8
  %constant_1821_1 = load double, ptr @101, align 8
  %207 = trunc i8 %197 to i1
  %208 = select i1 %207, double %constant_1820_1, double %constant_1821_1
  %constant_1822_1 = load double, ptr @100, align 8
  %209 = trunc i8 %198 to i1
  %210 = select i1 %209, double %208, double %constant_1822_1
  %constant_1823_1 = load double, ptr @99, align 8
  %constant_1824_1 = load double, ptr @98, align 8
  %211 = trunc i8 %197 to i1
  %212 = select i1 %211, double %constant_1823_1, double %constant_1824_1
  %constant_1825_1 = load double, ptr @97, align 8
  %213 = trunc i8 %198 to i1
  %214 = select i1 %213, double %212, double %constant_1825_1
  %constant_1826_1 = load double, ptr @96, align 8
  %constant_1828_1 = load double, ptr @95, align 8
  %215 = trunc i8 %197 to i1
  %216 = select i1 %215, double %constant_1826_1, double %constant_1828_1
  %constant_1829_1 = load double, ptr @94, align 8
  %217 = trunc i8 %198 to i1
  %218 = select i1 %217, double %216, double %constant_1829_1
  %constant_1830_1 = load double, ptr @93, align 8
  %constant_1831_1 = load double, ptr @92, align 8
  %219 = trunc i8 %197 to i1
  %220 = select i1 %219, double %constant_1830_1, double %constant_1831_1
  %constant_1832_1 = load double, ptr @91, align 8
  %221 = trunc i8 %198 to i1
  %222 = select i1 %221, double %220, double %constant_1832_1
  %constant_1833_1 = load double, ptr @90, align 8
  %constant_1834_1 = load double, ptr @89, align 8
  %223 = trunc i8 %197 to i1
  %224 = select i1 %223, double %constant_1833_1, double %constant_1834_1
  %constant_1835_1 = load double, ptr @88, align 8
  %225 = trunc i8 %198 to i1
  %226 = select i1 %225, double %224, double %constant_1835_1
  %constant_1836_1 = load double, ptr @87, align 8
  %constant_1837_1 = load double, ptr @86, align 8
  %227 = trunc i8 %197 to i1
  %228 = select i1 %227, double %constant_1836_1, double %constant_1837_1
  %constant_1838_1 = load double, ptr @85, align 8
  %229 = trunc i8 %198 to i1
  %230 = select i1 %229, double %228, double %constant_1838_1
  %constant_1839_1 = load double, ptr @84, align 8
  %constant_1840_1 = load double, ptr @83, align 8
  %231 = trunc i8 %197 to i1
  %232 = select i1 %231, double %constant_1839_1, double %constant_1840_1
  %constant_1841_1 = load double, ptr @82, align 8
  %233 = trunc i8 %198 to i1
  %234 = select i1 %233, double %232, double %constant_1841_1
  %constant_1842_1 = load double, ptr @81, align 8
  %constant_1843_1 = load double, ptr @80, align 8
  %235 = trunc i8 %197 to i1
  %236 = select i1 %235, double %constant_1842_1, double %constant_1843_1
  %constant_1844_1 = load double, ptr @79, align 8
  %237 = trunc i8 %198 to i1
  %238 = select i1 %237, double %236, double %constant_1844_1
  %constant_1845_1 = load double, ptr @78, align 8
  %constant_1846_1 = load double, ptr @77, align 8
  %239 = trunc i8 %197 to i1
  %240 = select i1 %239, double %constant_1845_1, double %constant_1846_1
  %constant_1847_1 = load double, ptr @76, align 8
  %241 = trunc i8 %198 to i1
  %242 = select i1 %241, double %240, double %constant_1847_1
  %constant_1848_1 = load double, ptr @75, align 8
  %constant_1849_1 = load double, ptr @74, align 8
  %243 = trunc i8 %197 to i1
  %244 = select i1 %243, double %constant_1848_1, double %constant_1849_1
  %constant_1850_1 = load double, ptr @73, align 8
  %245 = trunc i8 %198 to i1
  %246 = select i1 %245, double %244, double %constant_1850_1
  %constant_1851_1 = load double, ptr @72, align 8
  %constant_1852_1 = load double, ptr @71, align 8
  %247 = trunc i8 %197 to i1
  %248 = select i1 %247, double %constant_1851_1, double %constant_1852_1
  %constant_1853_1 = load double, ptr @70, align 8
  %249 = trunc i8 %198 to i1
  %250 = select i1 %249, double %248, double %constant_1853_1
  %constant_1854_1 = load double, ptr @69, align 8
  %constant_1855_1 = load double, ptr @68, align 8
  %251 = trunc i8 %197 to i1
  %252 = select i1 %251, double %constant_1854_1, double %constant_1855_1
  %constant_1856_1 = load double, ptr @67, align 8
  %253 = trunc i8 %198 to i1
  %254 = select i1 %253, double %252, double %constant_1856_1
  %constant_1857_1 = load double, ptr @66, align 8
  %constant_1858_1 = load double, ptr @65, align 8
  %255 = trunc i8 %197 to i1
  %256 = select i1 %255, double %constant_1857_1, double %constant_1858_1
  %constant_1859_1 = load double, ptr @64, align 8
  %257 = trunc i8 %198 to i1
  %258 = select i1 %257, double %256, double %constant_1859_1
  %constant_1860_1 = load double, ptr @63, align 8
  %constant_1861_1 = load double, ptr @62, align 8
  %259 = trunc i8 %197 to i1
  %260 = select i1 %259, double %constant_1860_1, double %constant_1861_1
  %constant_1862_1 = load double, ptr @61, align 8
  %261 = trunc i8 %198 to i1
  %262 = select i1 %261, double %260, double %constant_1862_1
  %constant_1863_1 = load double, ptr @60, align 8
  %constant_1864_1 = load double, ptr @59, align 8
  %263 = trunc i8 %197 to i1
  %264 = select i1 %263, double %constant_1863_1, double %constant_1864_1
  %constant_1865_1 = load double, ptr @58, align 8
  %265 = trunc i8 %198 to i1
  %266 = select i1 %265, double %264, double %constant_1865_1
  %constant_1866_1 = load double, ptr @57, align 8
  %constant_1867_1 = load double, ptr @56, align 8
  %267 = trunc i8 %197 to i1
  %268 = select i1 %267, double %constant_1866_1, double %constant_1867_1
  %constant_1869_1 = load double, ptr @55, align 8
  %269 = trunc i8 %198 to i1
  %270 = select i1 %269, double %268, double %constant_1869_1
  %constant_1884_1 = load double, ptr @53, align 8
  %add.4163.5 = fadd double %196, %constant_1884_1
  %271 = call double @__nv_sqrt(double %196)
  %constant_1870_1 = load double, ptr @51, align 8
  %constant_1871_1 = load double, ptr @50, align 8
  %272 = trunc i8 %198 to i1
  %273 = select i1 %272, double %constant_1870_1, double %constant_1871_1
  %subtract.241.3 = fsub double %271, %273
  %274 = trunc i8 %197 to i1
  %275 = select i1 %274, double %add.4163.5, double %subtract.241.3
  %multiply.2987.5 = fmul double %270, %275
  %add.4164.7 = fadd double %266, %multiply.2987.5
  %multiply.2988.5 = fmul double %add.4164.7, %275
  %add.4165.7 = fadd double %262, %multiply.2988.5
  %multiply.2989.5 = fmul double %add.4165.7, %275
  %add.4166.7 = fadd double %258, %multiply.2989.5
  %multiply.2990.5 = fmul double %add.4166.7, %275
  %add.4167.7 = fadd double %254, %multiply.2990.5
  %multiply.2991.5 = fmul double %add.4167.7, %275
  %add.4168.7 = fadd double %250, %multiply.2991.5
  %multiply.2992.5 = fmul double %add.4168.7, %275
  %add.4169.7 = fadd double %246, %multiply.2992.5
  %multiply.2993.5 = fmul double %add.4169.7, %275
  %add.4170.7 = fadd double %242, %multiply.2993.5
  %multiply.2994.5 = fmul double %add.4170.7, %275
  %add.4171.7 = fadd double %238, %multiply.2994.5
  %multiply.2995.5 = fmul double %add.4171.7, %275
  %add.4172.7 = fadd double %234, %multiply.2995.5
  %multiply.2996.5 = fmul double %add.4172.7, %275
  %add.4173.7 = fadd double %230, %multiply.2996.5
  %multiply.2997.5 = fmul double %add.4173.7, %275
  %add.4174.7 = fadd double %226, %multiply.2997.5
  %multiply.2998.5 = fmul double %add.4174.7, %275
  %add.4175.7 = fadd double %222, %multiply.2998.5
  %multiply.2999.5 = fmul double %add.4175.7, %275
  %add.4176.7 = fadd double %218, %multiply.2999.5
  %multiply.3000.5 = fmul double %add.4176.7, %275
  %add.4177.7 = fadd double %214, %multiply.3000.5
  %multiply.3001.5 = fmul double %add.4177.7, %275
  %add.4178.7 = fadd double %210, %multiply.3001.5
  %multiply.3002.5 = fmul double %add.4178.7, %275
  %add.4179.3 = fadd double %206, %multiply.3002.5
  %multiply.3003.1 = fmul double %add.4179.3, %275
  %add.4180.3 = fadd double %202, %multiply.3003.1
  %276 = trunc i8 %198 to i1
  %277 = select i1 %276, double %add.4180.3, double %add.4179.3
  %multiply.3004.1 = fmul double %277, %275
  %add.4181.3 = fadd double %200, %multiply.3004.1
  %278 = trunc i8 %198 to i1
  %279 = select i1 %278, double %add.4181.3, double %277
  %multiply.3005.1 = fmul double %279, %275
  %constant_1872_1 = load double, ptr @110, align 8
  %add.4182.5 = fadd double %multiply.3005.1, %constant_1872_1
  %280 = trunc i8 %197 to i1
  %281 = select i1 %280, double %add.4182.5, double %279
  %multiply.3006.5 = fmul double %281, %275
  %constant_1873_1 = load double, ptr @111, align 8
  %add.4183.3 = fadd double %multiply.3006.5, %constant_1873_1
  %282 = trunc i8 %197 to i1
  %283 = select i1 %282, double %add.4183.3, double %281
  %multiply.3007.1 = fmul double %283, %275
  %constant_1874_1 = load double, ptr @112, align 8
  %add.4184.5 = fadd double %multiply.3007.1, %constant_1874_1
  %284 = trunc i8 %197 to i1
  %285 = select i1 %284, double %add.4184.5, double %283
  %multiply.3008.5 = fmul double %285, %275
  %constant_1875_1 = load double, ptr @113, align 8
  %add.4185.5 = fadd double %multiply.3008.5, %constant_1875_1
  %286 = trunc i8 %197 to i1
  %287 = select i1 %286, double %add.4185.5, double %285
  %multiply.3009.3 = fmul double %287, %maximum.44.3
  %288 = trunc i8 %193 to i1
  %289 = select i1 %288, double %multiply.2985.5, double %multiply.3009.3
  %constant_1876_1 = load double, ptr @27, align 8
  %multiply.3010.3 = fmul double %289, %constant_1876_1
  %multiply.3011.1 = fmul double %8, %multiply.3010.3
  %290 = getelementptr double, ptr %arg2, i32 %linear_index
  %291 = getelementptr inbounds double, ptr %290, i32 0
  store double %multiply.3011.1, ptr %291, align 8
  br label %loop_multiply_fusion.2.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_rsqrt(double) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #0

; Function Attrs: nounwind memory(none)
declare double @__nv_log1p(double) #2

; Function Attrs: nounwind memory(none)
declare double @__nv_sqrt(double) #2

define void @loop_add_fusion_13(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(192) %arg1, ptr noalias align 128 dereferenceable(192) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.45.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.13.in_bounds-true, label %loop_add_fusion.13.in_bounds-after

loop_add_fusion.13.in_bounds-after:               ; preds = %reduce.45.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_add_fusion.13.in_bounds-true:                ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !297
  %5 = fneg double %4
  %constant_1878_2 = load double, ptr @117, align 8
  store double %constant_1878_2, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.45.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.45.1.inner.loop_header.reduction_dim.0

reduce.45.1.inner.loop_header.reduction_dim.0:    ; preds = %reduce.45.1.inner.loop_body.reduction_dim.0, %loop_add_fusion.13.in_bounds-true
  %reduce.45.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.45.1.inner.invar_address.reduction_dim.0, align 4
  %6 = icmp uge i32 %reduce.45.1.inner.indvar.reduction_dim.0, 24
  br i1 %6, label %reduce.45.1.inner.loop_exit.reduction_dim.0, label %reduce.45.1.inner.loop_body.reduction_dim.0

reduce.45.1.inner.loop_body.reduction_dim.0:      ; preds = %reduce.45.1.inner.loop_header.reduction_dim.0
  %7 = load double, ptr %accumulator_0, align 8
  %8 = getelementptr inbounds [24 x double], ptr %arg2, i32 0, i32 %reduce.45.1.inner.indvar.reduction_dim.0
  %9 = load double, ptr %8, align 8, !invariant.load !297
  %10 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %reduce.45.1.inner.indvar.reduction_dim.0
  %11 = load double, ptr %10, align 8, !invariant.load !297
  %multiply.3012.3 = fmul double %9, %11
  %12 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %reduce.45.1.inner.indvar.reduction_dim.0
  %13 = load double, ptr %12, align 8, !invariant.load !297
  %multiply.3013.3 = fmul double %multiply.3012.3, %13
  store double %7, ptr %parameter_buffer, align 8
  store double %multiply.3013.3, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %14 = load double, ptr %return_buffer, align 8
  store double %14, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.45.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.45.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.45.1.inner.loop_header.reduction_dim.0

reduce.45.1.inner.loop_exit.reduction_dim.0:      ; preds = %reduce.45.1.inner.loop_header.reduction_dim.0
  %15 = load double, ptr %accumulator_0, align 8
  %constant_1877_1 = load double, ptr @116, align 8
  %multiply.3014.1 = fmul double %15, %constant_1877_1
  %add.4186.1 = fadd double %5, %multiply.3014.1
  store double %add.4186.1, ptr %arg3, align 8
  br label %loop_add_fusion.13.in_bounds-after
}

define internal void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %scalar_lhs = load double, ptr %0, align 8
  %scalar_rhs = load double, ptr %1, align 8
  %add.3619 = fadd double %scalar_lhs, %scalar_rhs
  store double %add.3619, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

define void @wrapped_slice_5(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %wrapped_slice.5.in_bounds-true, label %wrapped_slice.5.in_bounds-after

wrapped_slice.5.in_bounds-after:                  ; preds = %wrapped_slice.5.in_bounds-true, %entry
  ret void

wrapped_slice.5.in_bounds-true:                   ; preds = %entry
  %5 = add i32 %3, 20
  %6 = getelementptr inbounds [24 x double], ptr %arg0, i32 0, i32 %5
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  store double %7, ptr %9, align 8
  br label %wrapped_slice.5.in_bounds-after
}

define void @wrapped_slice_4(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %wrapped_slice.4.in_bounds-true, label %wrapped_slice.4.in_bounds-after

wrapped_slice.4.in_bounds-after:                  ; preds = %wrapped_slice.4.in_bounds-true, %entry
  ret void

wrapped_slice.4.in_bounds-true:                   ; preds = %entry
  %5 = add i32 %3, 16
  %6 = getelementptr inbounds [24 x double], ptr %arg0, i32 0, i32 %5
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  store double %7, ptr %9, align 8
  br label %wrapped_slice.4.in_bounds-after
}

define void @wrapped_slice_3(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %wrapped_slice.3.in_bounds-true, label %wrapped_slice.3.in_bounds-after

wrapped_slice.3.in_bounds-after:                  ; preds = %wrapped_slice.3.in_bounds-true, %entry
  ret void

wrapped_slice.3.in_bounds-true:                   ; preds = %entry
  %5 = add i32 %3, 12
  %6 = getelementptr inbounds [24 x double], ptr %arg0, i32 0, i32 %5
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  store double %7, ptr %9, align 8
  br label %wrapped_slice.3.in_bounds-after
}

define void @wrapped_slice_2(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %wrapped_slice.2.in_bounds-true, label %wrapped_slice.2.in_bounds-after

wrapped_slice.2.in_bounds-after:                  ; preds = %wrapped_slice.2.in_bounds-true, %entry
  ret void

wrapped_slice.2.in_bounds-true:                   ; preds = %entry
  %5 = add i32 %3, 8
  %6 = getelementptr inbounds [24 x double], ptr %arg0, i32 0, i32 %5
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  store double %7, ptr %9, align 8
  br label %wrapped_slice.2.in_bounds-after
}

define void @wrapped_slice(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %wrapped_slice.in_bounds-true, label %wrapped_slice.in_bounds-after

wrapped_slice.in_bounds-after:                    ; preds = %wrapped_slice.in_bounds-true, %entry
  ret void

wrapped_slice.in_bounds-true:                     ; preds = %entry
  %5 = add i32 %3, 0
  %6 = getelementptr inbounds [24 x double], ptr %arg0, i32 0, i32 %5
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  store double %7, ptr %9, align 8
  br label %wrapped_slice.in_bounds-after
}

define void @wrapped_slice_1(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %wrapped_slice.1.in_bounds-true, label %wrapped_slice.1.in_bounds-after

wrapped_slice.1.in_bounds-after:                  ; preds = %wrapped_slice.1.in_bounds-true, %entry
  ret void

wrapped_slice.1.in_bounds-true:                   ; preds = %entry
  %5 = add i32 %3, 4
  %6 = getelementptr inbounds [24 x double], ptr %arg0, i32 0, i32 %5
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  store double %7, ptr %9, align 8
  br label %wrapped_slice.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_112(ptr noalias align 128 dereferenceable(320) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.3478 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1786_44 = load i64, ptr @119, align 8
  %0 = icmp slt i64 %param_2.3478, %constant_1786_44
  %1 = zext i1 %0 to i8
  %param_2.34781 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1785_24 = load i64, ptr @118, align 8
  %2 = add i64 %param_2.34781, %constant_1785_24
  %param_2.34782 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.34782
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 9, %6
  %8 = select i1 %7, i64 9, i64 %6
  %constant_1786_443 = load i64, ptr @119, align 8
  %9 = icmp sge i64 0, %constant_1786_443
  %10 = select i1 %9, i64 0, i64 %constant_1786_443
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1446.1.in_bounds-true, label %dynamic-update-slice.1446.1.in_bounds-after

dynamic-update-slice.1446.1.in_bounds-after:      ; preds = %dynamic-update-slice.1446.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1446.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.4440 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.44404 = load double, ptr %param_1.4440, align 8, !invariant.load !297
  %23 = getelementptr inbounds [10 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.44404, ptr %23, align 8
  br label %dynamic-update-slice.1446.1.in_bounds-after
}

define void @loop_broadcast_fusion_18(ptr noalias align 128 dereferenceable(1920) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %2 = mul nuw nsw i32 %0, 240
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 240
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 24
  %5 = udiv i32 %linear_index0, 24
  %6 = icmp ult i32 %linear_index, 240
  br i1 %6, label %loop_broadcast_fusion.18.in_bounds-true, label %loop_broadcast_fusion.18.in_bounds-after

loop_broadcast_fusion.18.in_bounds-after:         ; preds = %loop_broadcast_fusion.18.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.18.in_bounds-true:          ; preds = %entry
  %constant_1878_1 = load double, ptr @120, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  store double %constant_1878_1, ptr %8, align 8
  br label %loop_broadcast_fusion.18.in_bounds-after
}

define void @loop_and_fusion_2(ptr noalias align 128 dereferenceable(1) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(1) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_and_fusion.2.in_bounds-true, label %loop_and_fusion.2.in_bounds-after

loop_and_fusion.2.in_bounds-after:                ; preds = %loop_and_fusion.2.in_bounds-true, %entry
  ret void

loop_and_fusion.2.in_bounds-true:                 ; preds = %entry
  %4 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1728_1 = load i64, ptr @121, align 8
  %5 = icmp slt i64 %4, %constant_1728_1
  %6 = zext i1 %5 to i8
  %7 = load i8, ptr %arg1, align 1, !invariant.load !297
  %8 = trunc i8 %7 to i1
  %9 = xor i1 %8, true
  %10 = zext i1 %9 to i8
  %11 = and i8 %6, %10
  %12 = load i8, ptr %arg0, align 1, !invariant.load !297
  %13 = trunc i8 %12 to i1
  %14 = xor i1 %13, true
  %15 = zext i1 %14 to i8
  %16 = and i8 %11, %15
  store i8 %16, ptr %arg3, align 1
  br label %loop_and_fusion.2.in_bounds-after
}

define void @loop_select_fusion_5(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.5.in_bounds-true, label %loop_select_fusion.5.in_bounds-after

loop_select_fusion.5.in_bounds-after:             ; preds = %loop_select_fusion.5.in_bounds-true, %entry
  ret void

loop_select_fusion.5.in_bounds-true:              ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !297
  %constant_1740_1 = load i64, ptr @122, align 8
  %5 = lshr i64 %4, %constant_1740_1
  %shft.chk = icmp ult i64 %constant_1740_1, 64
  %6 = select i1 %shft.chk, i64 %5, i64 0
  %constant_1740_11 = load i64, ptr @122, align 8
  %7 = lshr i64 %6, %constant_1740_11
  %shft.chk2 = icmp ult i64 %constant_1740_11, 64
  %8 = select i1 %shft.chk2, i64 %7, i64 0
  %constant_1740_13 = load i64, ptr @122, align 8
  %9 = lshr i64 %8, %constant_1740_13
  %shft.chk4 = icmp ult i64 %constant_1740_13, 64
  %10 = select i1 %shft.chk4, i64 %9, i64 0
  %constant_1740_15 = load i64, ptr @122, align 8
  %11 = lshr i64 %10, %constant_1740_15
  %shft.chk6 = icmp ult i64 %constant_1740_15, 64
  %12 = select i1 %shft.chk6, i64 %11, i64 0
  %constant_1740_17 = load i64, ptr @122, align 8
  %13 = lshr i64 %12, %constant_1740_17
  %shft.chk8 = icmp ult i64 %constant_1740_17, 64
  %14 = select i1 %shft.chk8, i64 %13, i64 0
  %constant_1740_19 = load i64, ptr @122, align 8
  %15 = and i64 %14, %constant_1740_19
  %constant_1739_2 = load i64, ptr @124, align 8
  %16 = icmp ne i64 %15, %constant_1739_2
  %17 = zext i1 %16 to i8
  %constant_1740_110 = load i64, ptr @122, align 8
  %18 = and i64 %12, %constant_1740_110
  %constant_1739_211 = load i64, ptr @124, align 8
  %19 = icmp ne i64 %18, %constant_1739_211
  %20 = zext i1 %19 to i8
  %constant_1740_112 = load i64, ptr @122, align 8
  %21 = and i64 %10, %constant_1740_112
  %constant_1739_213 = load i64, ptr @124, align 8
  %22 = icmp ne i64 %21, %constant_1739_213
  %23 = zext i1 %22 to i8
  %constant_1740_114 = load i64, ptr @122, align 8
  %24 = and i64 %8, %constant_1740_114
  %constant_1739_215 = load i64, ptr @124, align 8
  %25 = icmp ne i64 %24, %constant_1739_215
  %26 = zext i1 %25 to i8
  %constant_1740_116 = load i64, ptr @122, align 8
  %27 = and i64 %6, %constant_1740_116
  %constant_1739_217 = load i64, ptr @124, align 8
  %28 = icmp ne i64 %27, %constant_1739_217
  %29 = zext i1 %28 to i8
  %30 = load i64, ptr %arg0, align 8, !invariant.load !297
  %constant_1740_118 = load i64, ptr @122, align 8
  %31 = and i64 %30, %constant_1740_118
  %constant_1739_219 = load i64, ptr @124, align 8
  %32 = icmp ne i64 %31, %constant_1739_219
  %33 = zext i1 %32 to i8
  %constant_1737_1 = load i64, ptr @123, align 8
  %constant_1740_120 = load i64, ptr @122, align 8
  %34 = trunc i8 %33 to i1
  %35 = select i1 %34, i64 %constant_1737_1, i64 %constant_1740_120
  %constant_1736_1 = load i64, ptr @125, align 8
  %36 = mul i64 %35, %constant_1736_1
  %37 = trunc i8 %29 to i1
  %38 = select i1 %37, i64 %36, i64 %35
  %constant_1735_1 = load i64, ptr @126, align 8
  %39 = mul i64 %38, %constant_1735_1
  %40 = trunc i8 %26 to i1
  %41 = select i1 %40, i64 %39, i64 %38
  %constant_1734_1 = load i64, ptr @127, align 8
  %42 = mul i64 %41, %constant_1734_1
  %43 = trunc i8 %23 to i1
  %44 = select i1 %43, i64 %42, i64 %41
  %constant_1733_1 = load i64, ptr @128, align 8
  %45 = mul i64 %44, %constant_1733_1
  %46 = trunc i8 %20 to i1
  %47 = select i1 %46, i64 %45, i64 %44
  %constant_1732_1 = load i64, ptr @129, align 8
  %48 = mul i64 %47, %constant_1732_1
  %49 = trunc i8 %17 to i1
  %50 = select i1 %49, i64 %48, i64 %47
  store i64 %50, ptr %arg1, align 8
  br label %loop_select_fusion.5.in_bounds-after
}

define void @loop_add_fusion_11(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_add_fusion.11.in_bounds-true, label %loop_add_fusion.11.in_bounds-after

loop_add_fusion.11.in_bounds-after:               ; preds = %loop_add_fusion.11.in_bounds-true, %entry
  ret void

loop_add_fusion.11.in_bounds-true:                ; preds = %entry
  %5 = load i64, ptr %arg1, align 8, !invariant.load !297
  %6 = trunc i64 %5 to i32
  %constant_1741_2 = load i32, ptr @143, align 4
  %7 = lshr i32 %6, %constant_1741_2
  %shft.chk = icmp ult i32 %constant_1741_2, 32
  %8 = select i1 %shft.chk, i32 %7, i32 0
  %9 = add i32 %3, 0
  %10 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 %9
  %11 = load i32, ptr %10, align 4, !invariant.load !297
  %12 = add i32 %8, %11
  %13 = add i32 %3, 1
  %14 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !297
  %16 = add i32 %6, %15
  %17 = add i32 %12, %16
  %18 = getelementptr i32, ptr @142, i32 %linear_index
  %constant_1742_1 = getelementptr inbounds i32, ptr %18, i32 0
  %constant_1742_11 = load i32, ptr %constant_1742_1, align 4
  %19 = shl i32 %16, %constant_1742_11
  %shft.chk2 = icmp ult i32 %constant_1742_11, 32
  %20 = select i1 %shft.chk2, i32 %19, i32 0
  %21 = getelementptr i32, ptr @133, i32 %linear_index
  %constant_1743_1 = getelementptr inbounds i32, ptr %21, i32 0
  %constant_1743_13 = load i32, ptr %constant_1743_1, align 4
  %22 = lshr i32 %16, %constant_1743_13
  %shft.chk4 = icmp ult i32 %constant_1743_13, 32
  %23 = select i1 %shft.chk4, i32 %22, i32 0
  %24 = or i32 %20, %23
  %25 = xor i32 %17, %24
  %26 = add i32 %17, %25
  %27 = getelementptr i32, ptr @138, i32 %linear_index
  %constant_1744_4 = getelementptr inbounds i32, ptr %27, i32 0
  %constant_1744_45 = load i32, ptr %constant_1744_4, align 4
  %28 = shl i32 %25, %constant_1744_45
  %shft.chk6 = icmp ult i32 %constant_1744_45, 32
  %29 = select i1 %shft.chk6, i32 %28, i32 0
  %30 = getelementptr i32, ptr @132, i32 %linear_index
  %constant_1745_4 = getelementptr inbounds i32, ptr %30, i32 0
  %constant_1745_47 = load i32, ptr %constant_1745_4, align 4
  %31 = lshr i32 %25, %constant_1745_47
  %shft.chk8 = icmp ult i32 %constant_1745_47, 32
  %32 = select i1 %shft.chk8, i32 %31, i32 0
  %33 = or i32 %29, %32
  %34 = xor i32 %26, %33
  %35 = add i32 %26, %34
  %36 = getelementptr i32, ptr @139, i32 %linear_index
  %constant_1746_1 = getelementptr inbounds i32, ptr %36, i32 0
  %constant_1746_19 = load i32, ptr %constant_1746_1, align 4
  %37 = shl i32 %34, %constant_1746_19
  %shft.chk10 = icmp ult i32 %constant_1746_19, 32
  %38 = select i1 %shft.chk10, i32 %37, i32 0
  %39 = getelementptr i32, ptr @131, i32 %linear_index
  %constant_1747_1 = getelementptr inbounds i32, ptr %39, i32 0
  %constant_1747_111 = load i32, ptr %constant_1747_1, align 4
  %40 = lshr i32 %34, %constant_1747_111
  %shft.chk12 = icmp ult i32 %constant_1747_111, 32
  %41 = select i1 %shft.chk12, i32 %40, i32 0
  %42 = or i32 %38, %41
  %43 = xor i32 %35, %42
  %44 = add i32 %35, %43
  %45 = add i32 %44, %15
  %46 = getelementptr i32, ptr @131, i32 %linear_index
  %constant_1747_113 = getelementptr inbounds i32, ptr %46, i32 0
  %constant_1747_114 = load i32, ptr %constant_1747_113, align 4
  %47 = shl i32 %43, %constant_1747_114
  %shft.chk15 = icmp ult i32 %constant_1747_114, 32
  %48 = select i1 %shft.chk15, i32 %47, i32 0
  %49 = getelementptr i32, ptr @139, i32 %linear_index
  %constant_1746_116 = getelementptr inbounds i32, ptr %49, i32 0
  %constant_1746_117 = load i32, ptr %constant_1746_116, align 4
  %50 = lshr i32 %43, %constant_1746_117
  %shft.chk18 = icmp ult i32 %constant_1746_117, 32
  %51 = select i1 %shft.chk18, i32 %50, i32 0
  %52 = or i32 %48, %51
  %53 = xor i32 %44, %52
  %54 = xor i32 %11, %15
  %55 = getelementptr i32, ptr @130, i32 %linear_index
  %constant_1776_3 = getelementptr inbounds i32, ptr %55, i32 0
  %constant_1776_319 = load i32, ptr %constant_1776_3, align 4
  %56 = xor i32 %54, %constant_1776_319
  %57 = add i32 %53, %56
  %58 = getelementptr i32, ptr @141, i32 %linear_index
  %constant_1749_2 = getelementptr inbounds i32, ptr %58, i32 0
  %constant_1749_220 = load i32, ptr %constant_1749_2, align 4
  %59 = add i32 %57, %constant_1749_220
  %60 = add i32 %45, %59
  %61 = getelementptr i32, ptr @132, i32 %linear_index
  %constant_1745_421 = getelementptr inbounds i32, ptr %61, i32 0
  %constant_1745_422 = load i32, ptr %constant_1745_421, align 4
  %62 = shl i32 %59, %constant_1745_422
  %shft.chk23 = icmp ult i32 %constant_1745_422, 32
  %63 = select i1 %shft.chk23, i32 %62, i32 0
  %64 = getelementptr i32, ptr @138, i32 %linear_index
  %constant_1744_424 = getelementptr inbounds i32, ptr %64, i32 0
  %constant_1744_425 = load i32, ptr %constant_1744_424, align 4
  %65 = lshr i32 %59, %constant_1744_425
  %shft.chk26 = icmp ult i32 %constant_1744_425, 32
  %66 = select i1 %shft.chk26, i32 %65, i32 0
  %67 = or i32 %63, %66
  %68 = xor i32 %60, %67
  %69 = add i32 %60, %68
  %70 = getelementptr i32, ptr @144, i32 %linear_index
  %constant_1750_3 = getelementptr inbounds i32, ptr %70, i32 0
  %constant_1750_327 = load i32, ptr %constant_1750_3, align 4
  %71 = shl i32 %68, %constant_1750_327
  %shft.chk28 = icmp ult i32 %constant_1750_327, 32
  %72 = select i1 %shft.chk28, i32 %71, i32 0
  %73 = getelementptr i32, ptr @137, i32 %linear_index
  %constant_1751_1 = getelementptr inbounds i32, ptr %73, i32 0
  %constant_1751_129 = load i32, ptr %constant_1751_1, align 4
  %74 = lshr i32 %68, %constant_1751_129
  %shft.chk30 = icmp ult i32 %constant_1751_129, 32
  %75 = select i1 %shft.chk30, i32 %74, i32 0
  %76 = or i32 %72, %75
  %77 = xor i32 %69, %76
  %78 = add i32 %69, %77
  %79 = getelementptr i32, ptr @136, i32 %linear_index
  %constant_1752_3 = getelementptr inbounds i32, ptr %79, i32 0
  %constant_1752_331 = load i32, ptr %constant_1752_3, align 4
  %80 = shl i32 %77, %constant_1752_331
  %shft.chk32 = icmp ult i32 %constant_1752_331, 32
  %81 = select i1 %shft.chk32, i32 %80, i32 0
  %82 = getelementptr i32, ptr @136, i32 %linear_index
  %constant_1752_333 = getelementptr inbounds i32, ptr %82, i32 0
  %constant_1752_334 = load i32, ptr %constant_1752_333, align 4
  %83 = lshr i32 %77, %constant_1752_334
  %shft.chk35 = icmp ult i32 %constant_1752_334, 32
  %84 = select i1 %shft.chk35, i32 %83, i32 0
  %85 = or i32 %81, %84
  %86 = xor i32 %78, %85
  %87 = add i32 %78, %86
  %88 = add i32 %87, %56
  %89 = getelementptr i32, ptr @145, i32 %linear_index
  %constant_1753_3 = getelementptr inbounds i32, ptr %89, i32 0
  %constant_1753_336 = load i32, ptr %constant_1753_3, align 4
  %90 = shl i32 %86, %constant_1753_336
  %shft.chk37 = icmp ult i32 %constant_1753_336, 32
  %91 = select i1 %shft.chk37, i32 %90, i32 0
  %92 = getelementptr i32, ptr @135, i32 %linear_index
  %constant_1754_3 = getelementptr inbounds i32, ptr %92, i32 0
  %constant_1754_338 = load i32, ptr %constant_1754_3, align 4
  %93 = lshr i32 %86, %constant_1754_338
  %shft.chk39 = icmp ult i32 %constant_1754_338, 32
  %94 = select i1 %shft.chk39, i32 %93, i32 0
  %95 = or i32 %91, %94
  %96 = xor i32 %87, %95
  %97 = add i32 %96, %11
  %98 = getelementptr i32, ptr @140, i32 %linear_index
  %constant_1755_2 = getelementptr inbounds i32, ptr %98, i32 0
  %constant_1755_240 = load i32, ptr %constant_1755_2, align 4
  %99 = add i32 %97, %constant_1755_240
  %100 = add i32 %88, %99
  %101 = getelementptr i32, ptr @142, i32 %linear_index
  %constant_1742_141 = getelementptr inbounds i32, ptr %101, i32 0
  %constant_1742_142 = load i32, ptr %constant_1742_141, align 4
  %102 = shl i32 %99, %constant_1742_142
  %shft.chk43 = icmp ult i32 %constant_1742_142, 32
  %103 = select i1 %shft.chk43, i32 %102, i32 0
  %104 = getelementptr i32, ptr @133, i32 %linear_index
  %constant_1743_144 = getelementptr inbounds i32, ptr %104, i32 0
  %constant_1743_145 = load i32, ptr %constant_1743_144, align 4
  %105 = lshr i32 %99, %constant_1743_145
  %shft.chk46 = icmp ult i32 %constant_1743_145, 32
  %106 = select i1 %shft.chk46, i32 %105, i32 0
  %107 = or i32 %103, %106
  %108 = xor i32 %100, %107
  %109 = add i32 %100, %108
  %110 = getelementptr i32, ptr @138, i32 %linear_index
  %constant_1744_447 = getelementptr inbounds i32, ptr %110, i32 0
  %constant_1744_448 = load i32, ptr %constant_1744_447, align 4
  %111 = shl i32 %108, %constant_1744_448
  %shft.chk49 = icmp ult i32 %constant_1744_448, 32
  %112 = select i1 %shft.chk49, i32 %111, i32 0
  %113 = getelementptr i32, ptr @132, i32 %linear_index
  %constant_1745_450 = getelementptr inbounds i32, ptr %113, i32 0
  %constant_1745_451 = load i32, ptr %constant_1745_450, align 4
  %114 = lshr i32 %108, %constant_1745_451
  %shft.chk52 = icmp ult i32 %constant_1745_451, 32
  %115 = select i1 %shft.chk52, i32 %114, i32 0
  %116 = or i32 %112, %115
  %117 = xor i32 %109, %116
  %118 = add i32 %109, %117
  %119 = getelementptr i32, ptr @139, i32 %linear_index
  %constant_1746_153 = getelementptr inbounds i32, ptr %119, i32 0
  %constant_1746_154 = load i32, ptr %constant_1746_153, align 4
  %120 = shl i32 %117, %constant_1746_154
  %shft.chk55 = icmp ult i32 %constant_1746_154, 32
  %121 = select i1 %shft.chk55, i32 %120, i32 0
  %122 = getelementptr i32, ptr @131, i32 %linear_index
  %constant_1747_156 = getelementptr inbounds i32, ptr %122, i32 0
  %constant_1747_157 = load i32, ptr %constant_1747_156, align 4
  %123 = lshr i32 %117, %constant_1747_157
  %shft.chk58 = icmp ult i32 %constant_1747_157, 32
  %124 = select i1 %shft.chk58, i32 %123, i32 0
  %125 = or i32 %121, %124
  %126 = xor i32 %118, %125
  %127 = add i32 %118, %126
  %128 = add i32 %127, %11
  %129 = getelementptr i32, ptr @131, i32 %linear_index
  %constant_1747_159 = getelementptr inbounds i32, ptr %129, i32 0
  %constant_1747_160 = load i32, ptr %constant_1747_159, align 4
  %130 = shl i32 %126, %constant_1747_160
  %shft.chk61 = icmp ult i32 %constant_1747_160, 32
  %131 = select i1 %shft.chk61, i32 %130, i32 0
  %132 = getelementptr i32, ptr @139, i32 %linear_index
  %constant_1746_162 = getelementptr inbounds i32, ptr %132, i32 0
  %constant_1746_163 = load i32, ptr %constant_1746_162, align 4
  %133 = lshr i32 %126, %constant_1746_163
  %shft.chk64 = icmp ult i32 %constant_1746_163, 32
  %134 = select i1 %shft.chk64, i32 %133, i32 0
  %135 = or i32 %131, %134
  %136 = xor i32 %127, %135
  %137 = add i32 %136, %15
  %138 = getelementptr i32, ptr @137, i32 %linear_index
  %constant_1751_165 = getelementptr inbounds i32, ptr %138, i32 0
  %constant_1751_166 = load i32, ptr %constant_1751_165, align 4
  %139 = add i32 %137, %constant_1751_166
  %140 = add i32 %128, %139
  %141 = getelementptr i32, ptr @132, i32 %linear_index
  %constant_1745_467 = getelementptr inbounds i32, ptr %141, i32 0
  %constant_1745_468 = load i32, ptr %constant_1745_467, align 4
  %142 = shl i32 %139, %constant_1745_468
  %shft.chk69 = icmp ult i32 %constant_1745_468, 32
  %143 = select i1 %shft.chk69, i32 %142, i32 0
  %144 = getelementptr i32, ptr @138, i32 %linear_index
  %constant_1744_470 = getelementptr inbounds i32, ptr %144, i32 0
  %constant_1744_471 = load i32, ptr %constant_1744_470, align 4
  %145 = lshr i32 %139, %constant_1744_471
  %shft.chk72 = icmp ult i32 %constant_1744_471, 32
  %146 = select i1 %shft.chk72, i32 %145, i32 0
  %147 = or i32 %143, %146
  %148 = xor i32 %140, %147
  %149 = add i32 %140, %148
  %150 = getelementptr i32, ptr @144, i32 %linear_index
  %constant_1750_373 = getelementptr inbounds i32, ptr %150, i32 0
  %constant_1750_374 = load i32, ptr %constant_1750_373, align 4
  %151 = shl i32 %148, %constant_1750_374
  %shft.chk75 = icmp ult i32 %constant_1750_374, 32
  %152 = select i1 %shft.chk75, i32 %151, i32 0
  %153 = getelementptr i32, ptr @137, i32 %linear_index
  %constant_1751_176 = getelementptr inbounds i32, ptr %153, i32 0
  %constant_1751_177 = load i32, ptr %constant_1751_176, align 4
  %154 = lshr i32 %148, %constant_1751_177
  %shft.chk78 = icmp ult i32 %constant_1751_177, 32
  %155 = select i1 %shft.chk78, i32 %154, i32 0
  %156 = or i32 %152, %155
  %157 = xor i32 %149, %156
  %158 = add i32 %149, %157
  %159 = getelementptr i32, ptr @136, i32 %linear_index
  %constant_1752_379 = getelementptr inbounds i32, ptr %159, i32 0
  %constant_1752_380 = load i32, ptr %constant_1752_379, align 4
  %160 = shl i32 %157, %constant_1752_380
  %shft.chk81 = icmp ult i32 %constant_1752_380, 32
  %161 = select i1 %shft.chk81, i32 %160, i32 0
  %162 = getelementptr i32, ptr @136, i32 %linear_index
  %constant_1752_382 = getelementptr inbounds i32, ptr %162, i32 0
  %constant_1752_383 = load i32, ptr %constant_1752_382, align 4
  %163 = lshr i32 %157, %constant_1752_383
  %shft.chk84 = icmp ult i32 %constant_1752_383, 32
  %164 = select i1 %shft.chk84, i32 %163, i32 0
  %165 = or i32 %161, %164
  %166 = xor i32 %158, %165
  %167 = add i32 %158, %166
  %168 = add i32 %167, %15
  %169 = getelementptr i32, ptr @145, i32 %linear_index
  %constant_1753_385 = getelementptr inbounds i32, ptr %169, i32 0
  %constant_1753_386 = load i32, ptr %constant_1753_385, align 4
  %170 = shl i32 %166, %constant_1753_386
  %shft.chk87 = icmp ult i32 %constant_1753_386, 32
  %171 = select i1 %shft.chk87, i32 %170, i32 0
  %172 = getelementptr i32, ptr @135, i32 %linear_index
  %constant_1754_388 = getelementptr inbounds i32, ptr %172, i32 0
  %constant_1754_389 = load i32, ptr %constant_1754_388, align 4
  %173 = lshr i32 %166, %constant_1754_389
  %shft.chk90 = icmp ult i32 %constant_1754_389, 32
  %174 = select i1 %shft.chk90, i32 %173, i32 0
  %175 = or i32 %171, %174
  %176 = xor i32 %167, %175
  %177 = add i32 %176, %56
  %178 = getelementptr i32, ptr @134, i32 %linear_index
  %constant_1756_4 = getelementptr inbounds i32, ptr %178, i32 0
  %constant_1756_491 = load i32, ptr %constant_1756_4, align 4
  %179 = add i32 %177, %constant_1756_491
  %180 = add i32 %168, %179
  %181 = getelementptr i32, ptr @142, i32 %linear_index
  %constant_1742_192 = getelementptr inbounds i32, ptr %181, i32 0
  %constant_1742_193 = load i32, ptr %constant_1742_192, align 4
  %182 = shl i32 %179, %constant_1742_193
  %shft.chk94 = icmp ult i32 %constant_1742_193, 32
  %183 = select i1 %shft.chk94, i32 %182, i32 0
  %184 = getelementptr i32, ptr @133, i32 %linear_index
  %constant_1743_195 = getelementptr inbounds i32, ptr %184, i32 0
  %constant_1743_196 = load i32, ptr %constant_1743_195, align 4
  %185 = lshr i32 %179, %constant_1743_196
  %shft.chk97 = icmp ult i32 %constant_1743_196, 32
  %186 = select i1 %shft.chk97, i32 %185, i32 0
  %187 = or i32 %183, %186
  %188 = xor i32 %180, %187
  %189 = add i32 %180, %188
  %190 = getelementptr i32, ptr @138, i32 %linear_index
  %constant_1744_498 = getelementptr inbounds i32, ptr %190, i32 0
  %constant_1744_499 = load i32, ptr %constant_1744_498, align 4
  %191 = shl i32 %188, %constant_1744_499
  %shft.chk100 = icmp ult i32 %constant_1744_499, 32
  %192 = select i1 %shft.chk100, i32 %191, i32 0
  %193 = getelementptr i32, ptr @132, i32 %linear_index
  %constant_1745_4101 = getelementptr inbounds i32, ptr %193, i32 0
  %constant_1745_4102 = load i32, ptr %constant_1745_4101, align 4
  %194 = lshr i32 %188, %constant_1745_4102
  %shft.chk103 = icmp ult i32 %constant_1745_4102, 32
  %195 = select i1 %shft.chk103, i32 %194, i32 0
  %196 = or i32 %192, %195
  %197 = xor i32 %189, %196
  %198 = add i32 %189, %197
  %199 = getelementptr i32, ptr @139, i32 %linear_index
  %constant_1746_1104 = getelementptr inbounds i32, ptr %199, i32 0
  %constant_1746_1105 = load i32, ptr %constant_1746_1104, align 4
  %200 = shl i32 %197, %constant_1746_1105
  %shft.chk106 = icmp ult i32 %constant_1746_1105, 32
  %201 = select i1 %shft.chk106, i32 %200, i32 0
  %202 = getelementptr i32, ptr @131, i32 %linear_index
  %constant_1747_1107 = getelementptr inbounds i32, ptr %202, i32 0
  %constant_1747_1108 = load i32, ptr %constant_1747_1107, align 4
  %203 = lshr i32 %197, %constant_1747_1108
  %shft.chk109 = icmp ult i32 %constant_1747_1108, 32
  %204 = select i1 %shft.chk109, i32 %203, i32 0
  %205 = or i32 %201, %204
  %206 = xor i32 %198, %205
  %207 = add i32 %198, %206
  %208 = getelementptr i32, ptr @131, i32 %linear_index
  %constant_1747_1110 = getelementptr inbounds i32, ptr %208, i32 0
  %constant_1747_1111 = load i32, ptr %constant_1747_1110, align 4
  %209 = shl i32 %206, %constant_1747_1111
  %shft.chk112 = icmp ult i32 %constant_1747_1111, 32
  %210 = select i1 %shft.chk112, i32 %209, i32 0
  %211 = getelementptr i32, ptr @139, i32 %linear_index
  %constant_1746_1113 = getelementptr inbounds i32, ptr %211, i32 0
  %constant_1746_1114 = load i32, ptr %constant_1746_1113, align 4
  %212 = lshr i32 %206, %constant_1746_1114
  %shft.chk115 = icmp ult i32 %constant_1746_1114, 32
  %213 = select i1 %shft.chk115, i32 %212, i32 0
  %214 = or i32 %210, %213
  %215 = xor i32 %207, %214
  %216 = add i32 %215, %11
  %217 = getelementptr i32, ptr @146, i32 %linear_index
  %constant_1757_1 = getelementptr inbounds i32, ptr %217, i32 0
  %constant_1757_1116 = load i32, ptr %constant_1757_1, align 4
  %218 = add i32 %216, %constant_1757_1116
  %219 = insertvalue { i32, i32 } undef, i32 %218, 0
  %220 = add i32 %207, %56
  %221 = insertvalue { i32, i32 } %219, i32 %220, 1
  %222 = extractvalue { i32, i32 } %221, 0
  %223 = getelementptr i32, ptr %arg2, i32 %linear_index
  %224 = getelementptr inbounds i32, ptr %223, i32 0
  store i32 %222, ptr %224, align 4
  %225 = extractvalue { i32, i32 } %221, 1
  %226 = getelementptr i32, ptr %arg3, i32 %linear_index
  %227 = getelementptr inbounds i32, ptr %226, i32 0
  store i32 %225, ptr %227, align 4
  br label %loop_add_fusion.11.in_bounds-after
}

define void @loop_add_fusion_12(ptr noalias align 128 dereferenceable(8) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.12.in_bounds-true, label %loop_add_fusion.12.in_bounds-after

loop_add_fusion.12.in_bounds-after:               ; preds = %loop_add_fusion.12.in_bounds-true, %entry
  ret void

loop_add_fusion.12.in_bounds-true:                ; preds = %entry
  %4 = load i64, ptr %arg0, align 8
  %constant_1740_2 = load i64, ptr @147, align 8
  %5 = add i64 %4, %constant_1740_2
  store i64 %5, ptr %arg0, align 8
  br label %loop_add_fusion.12.in_bounds-after
}

define void @loop_add_fusion_10(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(12) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !294
  %2 = mul nuw nsw i32 %0, 3
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 3
  br i1 %4, label %loop_add_fusion.10.in_bounds-true, label %loop_add_fusion.10.in_bounds-after

loop_add_fusion.10.in_bounds-after:               ; preds = %loop_add_fusion.10.in_bounds-true, %entry
  ret void

loop_add_fusion.10.in_bounds-true:                ; preds = %entry
  %5 = add i32 %3, 0
  %6 = mul nuw nsw i32 %5, 1
  %7 = add nuw nsw i32 0, %6
  %8 = getelementptr inbounds [1 x i32], ptr %arg1, i32 0, i32 0
  %9 = load i32, ptr %8, align 4, !invariant.load !297
  %10 = add i32 %7, %9
  %11 = add i32 %3, 3
  %12 = mul nuw nsw i32 %11, 1
  %13 = add nuw nsw i32 0, %12
  %14 = getelementptr inbounds [1 x i32], ptr %arg0, i32 0, i32 0
  %15 = load i32, ptr %14, align 4, !invariant.load !297
  %16 = add i32 %13, %15
  %17 = add i32 %10, %16
  %constant_1758_3 = load i32, ptr @160, align 4
  %18 = shl i32 %16, %constant_1758_3
  %shft.chk = icmp ult i32 %constant_1758_3, 32
  %19 = select i1 %shft.chk, i32 %18, i32 0
  %constant_1759_3 = load i32, ptr @151, align 4
  %20 = lshr i32 %16, %constant_1759_3
  %shft.chk1 = icmp ult i32 %constant_1759_3, 32
  %21 = select i1 %shft.chk1, i32 %20, i32 0
  %22 = or i32 %19, %21
  %23 = xor i32 %17, %22
  %24 = add i32 %17, %23
  %constant_1760_2 = load i32, ptr @156, align 4
  %25 = shl i32 %23, %constant_1760_2
  %shft.chk2 = icmp ult i32 %constant_1760_2, 32
  %26 = select i1 %shft.chk2, i32 %25, i32 0
  %constant_1761_2 = load i32, ptr @150, align 4
  %27 = lshr i32 %23, %constant_1761_2
  %shft.chk3 = icmp ult i32 %constant_1761_2, 32
  %28 = select i1 %shft.chk3, i32 %27, i32 0
  %29 = or i32 %26, %28
  %30 = xor i32 %24, %29
  %31 = add i32 %24, %30
  %constant_1763_2 = load i32, ptr @157, align 4
  %32 = shl i32 %30, %constant_1763_2
  %shft.chk4 = icmp ult i32 %constant_1763_2, 32
  %33 = select i1 %shft.chk4, i32 %32, i32 0
  %constant_1764_2 = load i32, ptr @149, align 4
  %34 = lshr i32 %30, %constant_1764_2
  %shft.chk5 = icmp ult i32 %constant_1764_2, 32
  %35 = select i1 %shft.chk5, i32 %34, i32 0
  %36 = or i32 %33, %35
  %37 = xor i32 %31, %36
  %38 = add i32 %31, %37
  %39 = add i32 %38, %15
  %40 = shl i32 %37, %constant_1764_2
  %shft.chk6 = icmp ult i32 %constant_1764_2, 32
  %41 = select i1 %shft.chk6, i32 %40, i32 0
  %42 = lshr i32 %37, %constant_1763_2
  %shft.chk7 = icmp ult i32 %constant_1763_2, 32
  %43 = select i1 %shft.chk7, i32 %42, i32 0
  %44 = or i32 %41, %43
  %45 = xor i32 %38, %44
  %46 = xor i32 %9, %15
  %constant_1748_2 = load i32, ptr @148, align 4
  %47 = xor i32 %46, %constant_1748_2
  %48 = add i32 %45, %47
  %constant_1765_1 = load i32, ptr @159, align 4
  %49 = add i32 %48, %constant_1765_1
  %50 = add i32 %39, %49
  %51 = shl i32 %49, %constant_1761_2
  %shft.chk8 = icmp ult i32 %constant_1761_2, 32
  %52 = select i1 %shft.chk8, i32 %51, i32 0
  %53 = lshr i32 %49, %constant_1760_2
  %shft.chk9 = icmp ult i32 %constant_1760_2, 32
  %54 = select i1 %shft.chk9, i32 %53, i32 0
  %55 = or i32 %52, %54
  %56 = xor i32 %50, %55
  %57 = add i32 %50, %56
  %constant_1766_3 = load i32, ptr @161, align 4
  %58 = shl i32 %56, %constant_1766_3
  %shft.chk10 = icmp ult i32 %constant_1766_3, 32
  %59 = select i1 %shft.chk10, i32 %58, i32 0
  %constant_1767_3 = load i32, ptr @155, align 4
  %60 = lshr i32 %56, %constant_1767_3
  %shft.chk11 = icmp ult i32 %constant_1767_3, 32
  %61 = select i1 %shft.chk11, i32 %60, i32 0
  %62 = or i32 %59, %61
  %63 = xor i32 %57, %62
  %64 = add i32 %57, %63
  %constant_1769_2 = load i32, ptr @154, align 4
  %65 = shl i32 %63, %constant_1769_2
  %shft.chk12 = icmp ult i32 %constant_1769_2, 32
  %66 = select i1 %shft.chk12, i32 %65, i32 0
  %67 = lshr i32 %63, %constant_1769_2
  %shft.chk13 = icmp ult i32 %constant_1769_2, 32
  %68 = select i1 %shft.chk13, i32 %67, i32 0
  %69 = or i32 %66, %68
  %70 = xor i32 %64, %69
  %71 = add i32 %64, %70
  %72 = add i32 %71, %47
  %constant_1770_2 = load i32, ptr @162, align 4
  %73 = shl i32 %70, %constant_1770_2
  %shft.chk14 = icmp ult i32 %constant_1770_2, 32
  %74 = select i1 %shft.chk14, i32 %73, i32 0
  %constant_1771_2 = load i32, ptr @153, align 4
  %75 = lshr i32 %70, %constant_1771_2
  %shft.chk15 = icmp ult i32 %constant_1771_2, 32
  %76 = select i1 %shft.chk15, i32 %75, i32 0
  %77 = or i32 %74, %76
  %78 = xor i32 %71, %77
  %79 = add i32 %78, %9
  %constant_1772_2 = load i32, ptr @158, align 4
  %80 = add i32 %79, %constant_1772_2
  %81 = add i32 %72, %80
  %82 = shl i32 %80, %constant_1758_3
  %shft.chk16 = icmp ult i32 %constant_1758_3, 32
  %83 = select i1 %shft.chk16, i32 %82, i32 0
  %84 = lshr i32 %80, %constant_1759_3
  %shft.chk17 = icmp ult i32 %constant_1759_3, 32
  %85 = select i1 %shft.chk17, i32 %84, i32 0
  %86 = or i32 %83, %85
  %87 = xor i32 %81, %86
  %88 = add i32 %81, %87
  %89 = shl i32 %87, %constant_1760_2
  %shft.chk18 = icmp ult i32 %constant_1760_2, 32
  %90 = select i1 %shft.chk18, i32 %89, i32 0
  %91 = lshr i32 %87, %constant_1761_2
  %shft.chk19 = icmp ult i32 %constant_1761_2, 32
  %92 = select i1 %shft.chk19, i32 %91, i32 0
  %93 = or i32 %90, %92
  %94 = xor i32 %88, %93
  %95 = add i32 %88, %94
  %96 = shl i32 %94, %constant_1763_2
  %shft.chk20 = icmp ult i32 %constant_1763_2, 32
  %97 = select i1 %shft.chk20, i32 %96, i32 0
  %98 = lshr i32 %94, %constant_1764_2
  %shft.chk21 = icmp ult i32 %constant_1764_2, 32
  %99 = select i1 %shft.chk21, i32 %98, i32 0
  %100 = or i32 %97, %99
  %101 = xor i32 %95, %100
  %102 = add i32 %95, %101
  %103 = add i32 %102, %9
  %104 = shl i32 %101, %constant_1764_2
  %shft.chk22 = icmp ult i32 %constant_1764_2, 32
  %105 = select i1 %shft.chk22, i32 %104, i32 0
  %106 = lshr i32 %101, %constant_1763_2
  %shft.chk23 = icmp ult i32 %constant_1763_2, 32
  %107 = select i1 %shft.chk23, i32 %106, i32 0
  %108 = or i32 %105, %107
  %109 = xor i32 %102, %108
  %110 = add i32 %109, %15
  %111 = add i32 %110, %constant_1767_3
  %112 = add i32 %103, %111
  %113 = shl i32 %111, %constant_1761_2
  %shft.chk24 = icmp ult i32 %constant_1761_2, 32
  %114 = select i1 %shft.chk24, i32 %113, i32 0
  %115 = lshr i32 %111, %constant_1760_2
  %shft.chk25 = icmp ult i32 %constant_1760_2, 32
  %116 = select i1 %shft.chk25, i32 %115, i32 0
  %117 = or i32 %114, %116
  %118 = xor i32 %112, %117
  %119 = add i32 %112, %118
  %120 = shl i32 %118, %constant_1766_3
  %shft.chk26 = icmp ult i32 %constant_1766_3, 32
  %121 = select i1 %shft.chk26, i32 %120, i32 0
  %122 = lshr i32 %118, %constant_1767_3
  %shft.chk27 = icmp ult i32 %constant_1767_3, 32
  %123 = select i1 %shft.chk27, i32 %122, i32 0
  %124 = or i32 %121, %123
  %125 = xor i32 %119, %124
  %126 = add i32 %119, %125
  %127 = shl i32 %125, %constant_1769_2
  %shft.chk28 = icmp ult i32 %constant_1769_2, 32
  %128 = select i1 %shft.chk28, i32 %127, i32 0
  %129 = lshr i32 %125, %constant_1769_2
  %shft.chk29 = icmp ult i32 %constant_1769_2, 32
  %130 = select i1 %shft.chk29, i32 %129, i32 0
  %131 = or i32 %128, %130
  %132 = xor i32 %126, %131
  %133 = add i32 %126, %132
  %134 = add i32 %133, %15
  %135 = shl i32 %132, %constant_1770_2
  %shft.chk30 = icmp ult i32 %constant_1770_2, 32
  %136 = select i1 %shft.chk30, i32 %135, i32 0
  %137 = lshr i32 %132, %constant_1771_2
  %shft.chk31 = icmp ult i32 %constant_1771_2, 32
  %138 = select i1 %shft.chk31, i32 %137, i32 0
  %139 = or i32 %136, %138
  %140 = xor i32 %133, %139
  %141 = add i32 %140, %47
  %constant_1773_2 = load i32, ptr @152, align 4
  %142 = add i32 %141, %constant_1773_2
  %143 = add i32 %134, %142
  %144 = shl i32 %142, %constant_1758_3
  %shft.chk32 = icmp ult i32 %constant_1758_3, 32
  %145 = select i1 %shft.chk32, i32 %144, i32 0
  %146 = lshr i32 %142, %constant_1759_3
  %shft.chk33 = icmp ult i32 %constant_1759_3, 32
  %147 = select i1 %shft.chk33, i32 %146, i32 0
  %148 = or i32 %145, %147
  %149 = xor i32 %143, %148
  %150 = add i32 %143, %149
  %151 = shl i32 %149, %constant_1760_2
  %shft.chk34 = icmp ult i32 %constant_1760_2, 32
  %152 = select i1 %shft.chk34, i32 %151, i32 0
  %153 = lshr i32 %149, %constant_1761_2
  %shft.chk35 = icmp ult i32 %constant_1761_2, 32
  %154 = select i1 %shft.chk35, i32 %153, i32 0
  %155 = or i32 %152, %154
  %156 = xor i32 %150, %155
  %157 = add i32 %150, %156
  %158 = shl i32 %156, %constant_1763_2
  %shft.chk36 = icmp ult i32 %constant_1763_2, 32
  %159 = select i1 %shft.chk36, i32 %158, i32 0
  %160 = lshr i32 %156, %constant_1764_2
  %shft.chk37 = icmp ult i32 %constant_1764_2, 32
  %161 = select i1 %shft.chk37, i32 %160, i32 0
  %162 = or i32 %159, %161
  %163 = xor i32 %157, %162
  %164 = add i32 %157, %163
  %165 = add i32 %164, %47
  %166 = getelementptr i32, ptr %arg2, i32 %linear_index
  %167 = getelementptr inbounds i32, ptr %166, i32 0
  store i32 %165, ptr %167, align 4
  br label %loop_add_fusion.10.in_bounds-after
}

define void @loop_slice_fusion(ptr noalias align 128 dereferenceable(12) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !296
  %2 = mul nuw nsw i32 %0, 6
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 6
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = icmp ult i32 %linear_index, 6
  br i1 %6, label %loop_slice_fusion.in_bounds-true, label %loop_slice_fusion.in_bounds-after

loop_slice_fusion.in_bounds-after:                ; preds = %slice1-after, %entry
  ret void

loop_slice_fusion.in_bounds-true:                 ; preds = %entry
  %7 = mul nuw nsw i32 %4, 1
  %8 = add nuw nsw i32 0, %7
  %9 = mul nuw nsw i32 %5, 2
  %10 = add nuw nsw i32 %8, %9
  %11 = udiv i32 %10, 6
  br label %concatenate.pivot.3.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %12 = phi i32 [ 0, %concatenate.pivot.0. ]
  %13 = sub nsw i32 %10, %12
  %14 = getelementptr inbounds [3 x i32], ptr %arg0, i32 0, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !297
  br label %concatenate.44.2.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.3.40
  %16 = phi i32 [ 3, %concatenate.pivot.3.40 ]
  %17 = sub nsw i32 %10, %16
  %18 = add i32 %17, 0
  %19 = mul nuw nsw i32 %18, 1
  %20 = add nuw nsw i32 0, %19
  %21 = getelementptr inbounds [1 x i32], ptr %arg1, i32 0, i32 0
  %22 = load i32, ptr %21, align 4, !invariant.load !297
  %23 = add i32 %20, %22
  %24 = add i32 %17, 3
  %25 = mul nuw nsw i32 %24, 1
  %26 = add nuw nsw i32 0, %25
  %27 = getelementptr inbounds [1 x i32], ptr %arg2, i32 0, i32 0
  %28 = load i32, ptr %27, align 4, !invariant.load !297
  %29 = add i32 %26, %28
  %30 = add i32 %23, %29
  %constant_1758_2 = load i32, ptr @176, align 4
  %31 = shl i32 %29, %constant_1758_2
  %shft.chk = icmp ult i32 %constant_1758_2, 32
  %32 = select i1 %shft.chk, i32 %31, i32 0
  %constant_1759_2 = load i32, ptr @167, align 4
  %33 = lshr i32 %29, %constant_1759_2
  %shft.chk1 = icmp ult i32 %constant_1759_2, 32
  %34 = select i1 %shft.chk1, i32 %33, i32 0
  %35 = or i32 %32, %34
  %36 = xor i32 %30, %35
  %37 = add i32 %30, %36
  %constant_1760_1 = load i32, ptr @173, align 4
  %38 = shl i32 %36, %constant_1760_1
  %shft.chk2 = icmp ult i32 %constant_1760_1, 32
  %39 = select i1 %shft.chk2, i32 %38, i32 0
  %constant_1761_1 = load i32, ptr @166, align 4
  %40 = lshr i32 %36, %constant_1761_1
  %shft.chk3 = icmp ult i32 %constant_1761_1, 32
  %41 = select i1 %shft.chk3, i32 %40, i32 0
  %42 = or i32 %39, %41
  %43 = xor i32 %37, %42
  %44 = add i32 %37, %43
  %constant_1763_1 = load i32, ptr @164, align 4
  %45 = shl i32 %43, %constant_1763_1
  %shft.chk4 = icmp ult i32 %constant_1763_1, 32
  %46 = select i1 %shft.chk4, i32 %45, i32 0
  %constant_1764_1 = load i32, ptr @165, align 4
  %47 = lshr i32 %43, %constant_1764_1
  %shft.chk5 = icmp ult i32 %constant_1764_1, 32
  %48 = select i1 %shft.chk5, i32 %47, i32 0
  %49 = or i32 %46, %48
  %50 = xor i32 %44, %49
  %51 = add i32 %44, %50
  %52 = add i32 %51, %28
  %53 = shl i32 %50, %constant_1764_1
  %shft.chk6 = icmp ult i32 %constant_1764_1, 32
  %54 = select i1 %shft.chk6, i32 %53, i32 0
  %55 = lshr i32 %50, %constant_1763_1
  %shft.chk7 = icmp ult i32 %constant_1763_1, 32
  %56 = select i1 %shft.chk7, i32 %55, i32 0
  %57 = or i32 %54, %56
  %58 = xor i32 %51, %57
  %59 = xor i32 %22, %28
  %constant_1748_3 = load i32, ptr @169, align 4
  %60 = xor i32 %59, %constant_1748_3
  %61 = add i32 %58, %60
  %constant_1765_3 = load i32, ptr @175, align 4
  %62 = add i32 %61, %constant_1765_3
  %63 = add i32 %52, %62
  %64 = shl i32 %62, %constant_1761_1
  %shft.chk8 = icmp ult i32 %constant_1761_1, 32
  %65 = select i1 %shft.chk8, i32 %64, i32 0
  %66 = lshr i32 %62, %constant_1760_1
  %shft.chk9 = icmp ult i32 %constant_1760_1, 32
  %67 = select i1 %shft.chk9, i32 %66, i32 0
  %68 = or i32 %65, %67
  %69 = xor i32 %63, %68
  %70 = add i32 %63, %69
  %constant_1766_1 = load i32, ptr @177, align 4
  %71 = shl i32 %69, %constant_1766_1
  %shft.chk10 = icmp ult i32 %constant_1766_1, 32
  %72 = select i1 %shft.chk10, i32 %71, i32 0
  %constant_1767_1 = load i32, ptr @172, align 4
  %73 = lshr i32 %69, %constant_1767_1
  %shft.chk11 = icmp ult i32 %constant_1767_1, 32
  %74 = select i1 %shft.chk11, i32 %73, i32 0
  %75 = or i32 %72, %74
  %76 = xor i32 %70, %75
  %77 = add i32 %70, %76
  %constant_1769_3 = load i32, ptr @171, align 4
  %78 = shl i32 %76, %constant_1769_3
  %shft.chk12 = icmp ult i32 %constant_1769_3, 32
  %79 = select i1 %shft.chk12, i32 %78, i32 0
  %80 = lshr i32 %76, %constant_1769_3
  %shft.chk13 = icmp ult i32 %constant_1769_3, 32
  %81 = select i1 %shft.chk13, i32 %80, i32 0
  %82 = or i32 %79, %81
  %83 = xor i32 %77, %82
  %84 = add i32 %77, %83
  %85 = add i32 %84, %60
  %constant_1770_1 = load i32, ptr @178, align 4
  %86 = shl i32 %83, %constant_1770_1
  %shft.chk14 = icmp ult i32 %constant_1770_1, 32
  %87 = select i1 %shft.chk14, i32 %86, i32 0
  %constant_1771_1 = load i32, ptr @170, align 4
  %88 = lshr i32 %83, %constant_1771_1
  %shft.chk15 = icmp ult i32 %constant_1771_1, 32
  %89 = select i1 %shft.chk15, i32 %88, i32 0
  %90 = or i32 %87, %89
  %91 = xor i32 %84, %90
  %92 = add i32 %91, %22
  %constant_1772_1 = load i32, ptr @174, align 4
  %93 = add i32 %92, %constant_1772_1
  %94 = add i32 %85, %93
  %95 = shl i32 %93, %constant_1758_2
  %shft.chk16 = icmp ult i32 %constant_1758_2, 32
  %96 = select i1 %shft.chk16, i32 %95, i32 0
  %97 = lshr i32 %93, %constant_1759_2
  %shft.chk17 = icmp ult i32 %constant_1759_2, 32
  %98 = select i1 %shft.chk17, i32 %97, i32 0
  %99 = or i32 %96, %98
  %100 = xor i32 %94, %99
  %101 = add i32 %94, %100
  %102 = shl i32 %100, %constant_1760_1
  %shft.chk18 = icmp ult i32 %constant_1760_1, 32
  %103 = select i1 %shft.chk18, i32 %102, i32 0
  %104 = lshr i32 %100, %constant_1761_1
  %shft.chk19 = icmp ult i32 %constant_1761_1, 32
  %105 = select i1 %shft.chk19, i32 %104, i32 0
  %106 = or i32 %103, %105
  %107 = xor i32 %101, %106
  %108 = add i32 %101, %107
  %109 = shl i32 %107, %constant_1763_1
  %shft.chk20 = icmp ult i32 %constant_1763_1, 32
  %110 = select i1 %shft.chk20, i32 %109, i32 0
  %111 = lshr i32 %107, %constant_1764_1
  %shft.chk21 = icmp ult i32 %constant_1764_1, 32
  %112 = select i1 %shft.chk21, i32 %111, i32 0
  %113 = or i32 %110, %112
  %114 = xor i32 %108, %113
  %115 = add i32 %108, %114
  %116 = add i32 %115, %22
  %117 = shl i32 %114, %constant_1764_1
  %shft.chk22 = icmp ult i32 %constant_1764_1, 32
  %118 = select i1 %shft.chk22, i32 %117, i32 0
  %119 = lshr i32 %114, %constant_1763_1
  %shft.chk23 = icmp ult i32 %constant_1763_1, 32
  %120 = select i1 %shft.chk23, i32 %119, i32 0
  %121 = or i32 %118, %120
  %122 = xor i32 %115, %121
  %123 = add i32 %122, %28
  %124 = add i32 %123, %constant_1767_1
  %125 = add i32 %116, %124
  %126 = shl i32 %124, %constant_1761_1
  %shft.chk24 = icmp ult i32 %constant_1761_1, 32
  %127 = select i1 %shft.chk24, i32 %126, i32 0
  %128 = lshr i32 %124, %constant_1760_1
  %shft.chk25 = icmp ult i32 %constant_1760_1, 32
  %129 = select i1 %shft.chk25, i32 %128, i32 0
  %130 = or i32 %127, %129
  %131 = xor i32 %125, %130
  %132 = add i32 %125, %131
  %133 = shl i32 %131, %constant_1766_1
  %shft.chk26 = icmp ult i32 %constant_1766_1, 32
  %134 = select i1 %shft.chk26, i32 %133, i32 0
  %135 = lshr i32 %131, %constant_1767_1
  %shft.chk27 = icmp ult i32 %constant_1767_1, 32
  %136 = select i1 %shft.chk27, i32 %135, i32 0
  %137 = or i32 %134, %136
  %138 = xor i32 %132, %137
  %139 = add i32 %132, %138
  %140 = shl i32 %138, %constant_1769_3
  %shft.chk28 = icmp ult i32 %constant_1769_3, 32
  %141 = select i1 %shft.chk28, i32 %140, i32 0
  %142 = lshr i32 %138, %constant_1769_3
  %shft.chk29 = icmp ult i32 %constant_1769_3, 32
  %143 = select i1 %shft.chk29, i32 %142, i32 0
  %144 = or i32 %141, %143
  %145 = xor i32 %139, %144
  %146 = add i32 %139, %145
  %147 = add i32 %146, %28
  %148 = shl i32 %145, %constant_1770_1
  %shft.chk30 = icmp ult i32 %constant_1770_1, 32
  %149 = select i1 %shft.chk30, i32 %148, i32 0
  %150 = lshr i32 %145, %constant_1771_1
  %shft.chk31 = icmp ult i32 %constant_1771_1, 32
  %151 = select i1 %shft.chk31, i32 %150, i32 0
  %152 = or i32 %149, %151
  %153 = xor i32 %146, %152
  %154 = add i32 %153, %60
  %constant_1773_1 = load i32, ptr @168, align 4
  %155 = add i32 %154, %constant_1773_1
  %156 = add i32 %147, %155
  %157 = shl i32 %155, %constant_1758_2
  %shft.chk32 = icmp ult i32 %constant_1758_2, 32
  %158 = select i1 %shft.chk32, i32 %157, i32 0
  %159 = lshr i32 %155, %constant_1759_2
  %shft.chk33 = icmp ult i32 %constant_1759_2, 32
  %160 = select i1 %shft.chk33, i32 %159, i32 0
  %161 = or i32 %158, %160
  %162 = xor i32 %156, %161
  %163 = add i32 %156, %162
  %164 = shl i32 %162, %constant_1760_1
  %shft.chk34 = icmp ult i32 %constant_1760_1, 32
  %165 = select i1 %shft.chk34, i32 %164, i32 0
  %166 = lshr i32 %162, %constant_1761_1
  %shft.chk35 = icmp ult i32 %constant_1761_1, 32
  %167 = select i1 %shft.chk35, i32 %166, i32 0
  %168 = or i32 %165, %167
  %169 = xor i32 %163, %168
  %170 = add i32 %163, %169
  %171 = shl i32 %169, %constant_1763_1
  %shft.chk36 = icmp ult i32 %constant_1763_1, 32
  %172 = select i1 %shft.chk36, i32 %171, i32 0
  %173 = lshr i32 %169, %constant_1764_1
  %shft.chk37 = icmp ult i32 %constant_1764_1, 32
  %174 = select i1 %shft.chk37, i32 %173, i32 0
  %175 = or i32 %172, %174
  %176 = xor i32 %170, %175
  %177 = add i32 %170, %176
  %178 = shl i32 %176, %constant_1764_1
  %shft.chk38 = icmp ult i32 %constant_1764_1, 32
  %179 = select i1 %shft.chk38, i32 %178, i32 0
  %180 = lshr i32 %176, %constant_1763_1
  %shft.chk39 = icmp ult i32 %constant_1763_1, 32
  %181 = select i1 %shft.chk39, i32 %180, i32 0
  %182 = or i32 %179, %181
  %183 = xor i32 %177, %182
  %184 = add i32 %183, %22
  %constant_1774_1 = load i32, ptr @163, align 4
  %185 = add i32 %184, %constant_1774_1
  br label %concatenate.44.2.merge

concatenate.pivot.3.:                             ; preds = %loop_slice_fusion.in_bounds-true
  %186 = icmp ult i32 %10, 3
  br i1 %186, label %concatenate.pivot.0., label %concatenate.pivot.3.40

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.3.
  br label %concat_index_from_operand_id0

concatenate.pivot.3.40:                           ; preds = %concatenate.pivot.3.
  br label %concat_index_from_operand_id1

concatenate.44.2.merge:                           ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %187 = phi i32 [ %15, %concat_index_from_operand_id0 ], [ %185, %concat_index_from_operand_id1 ]
  %188 = icmp sge i32 %5, 1
  %189 = icmp slt i32 %5, 2
  %190 = and i1 %188, %189
  %191 = icmp sge i32 %4, 0
  %192 = icmp slt i32 %4, 2
  %193 = and i1 %191, %192
  %194 = and i1 %190, %193
  br i1 %194, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.44.2.merge
  %195 = icmp sge i32 %5, 2
  %196 = icmp slt i32 %5, 3
  %197 = and i1 %195, %196
  %198 = icmp sge i32 %4, 0
  %199 = icmp slt i32 %4, 2
  %200 = and i1 %198, %199
  %201 = and i1 %197, %200
  br i1 %201, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %loop_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.44.2.merge
  %202 = sub i32 %5, 1
  %203 = sub i32 %4, 0
  %204 = getelementptr inbounds [1 x [2 x i32]], ptr %arg3, i32 0, i32 0, i32 %203
  store i32 %187, ptr %204, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %205 = sub i32 %5, 2
  %206 = sub i32 %4, 0
  %207 = getelementptr inbounds [1 x [2 x i32]], ptr %arg4, i32 0, i32 0, i32 %206
  store i32 %187, ptr %207, align 4
  br label %slice1-after
}

define void @loop_convert_select_fusion(ptr noalias align 128 dereferenceable(12) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_convert_select_fusion.in_bounds-true, label %loop_convert_select_fusion.in_bounds-after

loop_convert_select_fusion.in_bounds-after:       ; preds = %loop_convert_select_fusion.in_bounds-true, %entry
  ret void

loop_convert_select_fusion.in_bounds-true:        ; preds = %entry
  %5 = getelementptr float, ptr @201, i32 %linear_index
  %constant_1779_1 = getelementptr inbounds float, ptr %5, i32 0
  %constant_1779_11 = load float, ptr %constant_1779_1, align 4
  %6 = add i32 %3, 0
  %7 = getelementptr inbounds [3 x i32], ptr %arg0, i32 0, i32 %6
  %8 = load i32, ptr %7, align 4, !invariant.load !297
  %9 = add i32 %3, 1
  %10 = getelementptr inbounds [3 x i32], ptr %arg0, i32 0, i32 %9
  %11 = load i32, ptr %10, align 4, !invariant.load !297
  %12 = add i32 %8, %11
  %13 = getelementptr i32, ptr @198, i32 %linear_index
  %constant_1742_4 = getelementptr inbounds i32, ptr %13, i32 0
  %constant_1742_42 = load i32, ptr %constant_1742_4, align 4
  %14 = shl i32 %11, %constant_1742_42
  %shft.chk = icmp ult i32 %constant_1742_42, 32
  %15 = select i1 %shft.chk, i32 %14, i32 0
  %16 = getelementptr i32, ptr @189, i32 %linear_index
  %constant_1743_4 = getelementptr inbounds i32, ptr %16, i32 0
  %constant_1743_43 = load i32, ptr %constant_1743_4, align 4
  %17 = lshr i32 %11, %constant_1743_43
  %shft.chk4 = icmp ult i32 %constant_1743_43, 32
  %18 = select i1 %shft.chk4, i32 %17, i32 0
  %19 = or i32 %15, %18
  %20 = xor i32 %12, %19
  %21 = add i32 %12, %20
  %22 = getelementptr i32, ptr @194, i32 %linear_index
  %constant_1744_3 = getelementptr inbounds i32, ptr %22, i32 0
  %constant_1744_35 = load i32, ptr %constant_1744_3, align 4
  %23 = shl i32 %20, %constant_1744_35
  %shft.chk6 = icmp ult i32 %constant_1744_35, 32
  %24 = select i1 %shft.chk6, i32 %23, i32 0
  %25 = getelementptr i32, ptr @188, i32 %linear_index
  %constant_1745_3 = getelementptr inbounds i32, ptr %25, i32 0
  %constant_1745_37 = load i32, ptr %constant_1745_3, align 4
  %26 = lshr i32 %20, %constant_1745_37
  %shft.chk8 = icmp ult i32 %constant_1745_37, 32
  %27 = select i1 %shft.chk8, i32 %26, i32 0
  %28 = or i32 %24, %27
  %29 = xor i32 %21, %28
  %30 = add i32 %21, %29
  %31 = getelementptr i32, ptr @195, i32 %linear_index
  %constant_1746_4 = getelementptr inbounds i32, ptr %31, i32 0
  %constant_1746_49 = load i32, ptr %constant_1746_4, align 4
  %32 = shl i32 %29, %constant_1746_49
  %shft.chk10 = icmp ult i32 %constant_1746_49, 32
  %33 = select i1 %shft.chk10, i32 %32, i32 0
  %34 = getelementptr i32, ptr @187, i32 %linear_index
  %constant_1747_4 = getelementptr inbounds i32, ptr %34, i32 0
  %constant_1747_411 = load i32, ptr %constant_1747_4, align 4
  %35 = lshr i32 %29, %constant_1747_411
  %shft.chk12 = icmp ult i32 %constant_1747_411, 32
  %36 = select i1 %shft.chk12, i32 %35, i32 0
  %37 = or i32 %33, %36
  %38 = xor i32 %30, %37
  %39 = add i32 %30, %38
  %40 = add i32 %39, %11
  %41 = getelementptr i32, ptr @187, i32 %linear_index
  %constant_1747_413 = getelementptr inbounds i32, ptr %41, i32 0
  %constant_1747_414 = load i32, ptr %constant_1747_413, align 4
  %42 = shl i32 %38, %constant_1747_414
  %shft.chk15 = icmp ult i32 %constant_1747_414, 32
  %43 = select i1 %shft.chk15, i32 %42, i32 0
  %44 = getelementptr i32, ptr @195, i32 %linear_index
  %constant_1746_416 = getelementptr inbounds i32, ptr %44, i32 0
  %constant_1746_417 = load i32, ptr %constant_1746_416, align 4
  %45 = lshr i32 %38, %constant_1746_417
  %shft.chk18 = icmp ult i32 %constant_1746_417, 32
  %46 = select i1 %shft.chk18, i32 %45, i32 0
  %47 = or i32 %43, %46
  %48 = xor i32 %39, %47
  %49 = xor i32 %8, %11
  %50 = getelementptr i32, ptr @186, i32 %linear_index
  %constant_1776_1 = getelementptr inbounds i32, ptr %50, i32 0
  %constant_1776_119 = load i32, ptr %constant_1776_1, align 4
  %51 = xor i32 %49, %constant_1776_119
  %52 = add i32 %48, %51
  %53 = getelementptr i32, ptr @197, i32 %linear_index
  %constant_1749_3 = getelementptr inbounds i32, ptr %53, i32 0
  %constant_1749_320 = load i32, ptr %constant_1749_3, align 4
  %54 = add i32 %52, %constant_1749_320
  %55 = add i32 %40, %54
  %56 = getelementptr i32, ptr @188, i32 %linear_index
  %constant_1745_321 = getelementptr inbounds i32, ptr %56, i32 0
  %constant_1745_322 = load i32, ptr %constant_1745_321, align 4
  %57 = shl i32 %54, %constant_1745_322
  %shft.chk23 = icmp ult i32 %constant_1745_322, 32
  %58 = select i1 %shft.chk23, i32 %57, i32 0
  %59 = getelementptr i32, ptr @194, i32 %linear_index
  %constant_1744_324 = getelementptr inbounds i32, ptr %59, i32 0
  %constant_1744_325 = load i32, ptr %constant_1744_324, align 4
  %60 = lshr i32 %54, %constant_1744_325
  %shft.chk26 = icmp ult i32 %constant_1744_325, 32
  %61 = select i1 %shft.chk26, i32 %60, i32 0
  %62 = or i32 %58, %61
  %63 = xor i32 %55, %62
  %64 = add i32 %55, %63
  %65 = getelementptr i32, ptr @199, i32 %linear_index
  %constant_1750_4 = getelementptr inbounds i32, ptr %65, i32 0
  %constant_1750_427 = load i32, ptr %constant_1750_4, align 4
  %66 = shl i32 %63, %constant_1750_427
  %shft.chk28 = icmp ult i32 %constant_1750_427, 32
  %67 = select i1 %shft.chk28, i32 %66, i32 0
  %68 = getelementptr i32, ptr @193, i32 %linear_index
  %constant_1751_2 = getelementptr inbounds i32, ptr %68, i32 0
  %constant_1751_229 = load i32, ptr %constant_1751_2, align 4
  %69 = lshr i32 %63, %constant_1751_229
  %shft.chk30 = icmp ult i32 %constant_1751_229, 32
  %70 = select i1 %shft.chk30, i32 %69, i32 0
  %71 = or i32 %67, %70
  %72 = xor i32 %64, %71
  %73 = add i32 %64, %72
  %74 = getelementptr i32, ptr @192, i32 %linear_index
  %constant_1752_1 = getelementptr inbounds i32, ptr %74, i32 0
  %constant_1752_131 = load i32, ptr %constant_1752_1, align 4
  %75 = shl i32 %72, %constant_1752_131
  %shft.chk32 = icmp ult i32 %constant_1752_131, 32
  %76 = select i1 %shft.chk32, i32 %75, i32 0
  %77 = getelementptr i32, ptr @192, i32 %linear_index
  %constant_1752_133 = getelementptr inbounds i32, ptr %77, i32 0
  %constant_1752_134 = load i32, ptr %constant_1752_133, align 4
  %78 = lshr i32 %72, %constant_1752_134
  %shft.chk35 = icmp ult i32 %constant_1752_134, 32
  %79 = select i1 %shft.chk35, i32 %78, i32 0
  %80 = or i32 %76, %79
  %81 = xor i32 %73, %80
  %82 = add i32 %73, %81
  %83 = add i32 %82, %51
  %84 = getelementptr i32, ptr @200, i32 %linear_index
  %constant_1753_4 = getelementptr inbounds i32, ptr %84, i32 0
  %constant_1753_436 = load i32, ptr %constant_1753_4, align 4
  %85 = shl i32 %81, %constant_1753_436
  %shft.chk37 = icmp ult i32 %constant_1753_436, 32
  %86 = select i1 %shft.chk37, i32 %85, i32 0
  %87 = getelementptr i32, ptr @191, i32 %linear_index
  %constant_1754_4 = getelementptr inbounds i32, ptr %87, i32 0
  %constant_1754_438 = load i32, ptr %constant_1754_4, align 4
  %88 = lshr i32 %81, %constant_1754_438
  %shft.chk39 = icmp ult i32 %constant_1754_438, 32
  %89 = select i1 %shft.chk39, i32 %88, i32 0
  %90 = or i32 %86, %89
  %91 = xor i32 %82, %90
  %92 = add i32 %91, %8
  %93 = getelementptr i32, ptr @196, i32 %linear_index
  %constant_1755_3 = getelementptr inbounds i32, ptr %93, i32 0
  %constant_1755_340 = load i32, ptr %constant_1755_3, align 4
  %94 = add i32 %92, %constant_1755_340
  %95 = add i32 %83, %94
  %96 = getelementptr i32, ptr @198, i32 %linear_index
  %constant_1742_441 = getelementptr inbounds i32, ptr %96, i32 0
  %constant_1742_442 = load i32, ptr %constant_1742_441, align 4
  %97 = shl i32 %94, %constant_1742_442
  %shft.chk43 = icmp ult i32 %constant_1742_442, 32
  %98 = select i1 %shft.chk43, i32 %97, i32 0
  %99 = getelementptr i32, ptr @189, i32 %linear_index
  %constant_1743_444 = getelementptr inbounds i32, ptr %99, i32 0
  %constant_1743_445 = load i32, ptr %constant_1743_444, align 4
  %100 = lshr i32 %94, %constant_1743_445
  %shft.chk46 = icmp ult i32 %constant_1743_445, 32
  %101 = select i1 %shft.chk46, i32 %100, i32 0
  %102 = or i32 %98, %101
  %103 = xor i32 %95, %102
  %104 = add i32 %95, %103
  %105 = getelementptr i32, ptr @194, i32 %linear_index
  %constant_1744_347 = getelementptr inbounds i32, ptr %105, i32 0
  %constant_1744_348 = load i32, ptr %constant_1744_347, align 4
  %106 = shl i32 %103, %constant_1744_348
  %shft.chk49 = icmp ult i32 %constant_1744_348, 32
  %107 = select i1 %shft.chk49, i32 %106, i32 0
  %108 = getelementptr i32, ptr @188, i32 %linear_index
  %constant_1745_350 = getelementptr inbounds i32, ptr %108, i32 0
  %constant_1745_351 = load i32, ptr %constant_1745_350, align 4
  %109 = lshr i32 %103, %constant_1745_351
  %shft.chk52 = icmp ult i32 %constant_1745_351, 32
  %110 = select i1 %shft.chk52, i32 %109, i32 0
  %111 = or i32 %107, %110
  %112 = xor i32 %104, %111
  %113 = add i32 %104, %112
  %114 = getelementptr i32, ptr @195, i32 %linear_index
  %constant_1746_453 = getelementptr inbounds i32, ptr %114, i32 0
  %constant_1746_454 = load i32, ptr %constant_1746_453, align 4
  %115 = shl i32 %112, %constant_1746_454
  %shft.chk55 = icmp ult i32 %constant_1746_454, 32
  %116 = select i1 %shft.chk55, i32 %115, i32 0
  %117 = getelementptr i32, ptr @187, i32 %linear_index
  %constant_1747_456 = getelementptr inbounds i32, ptr %117, i32 0
  %constant_1747_457 = load i32, ptr %constant_1747_456, align 4
  %118 = lshr i32 %112, %constant_1747_457
  %shft.chk58 = icmp ult i32 %constant_1747_457, 32
  %119 = select i1 %shft.chk58, i32 %118, i32 0
  %120 = or i32 %116, %119
  %121 = xor i32 %113, %120
  %122 = add i32 %113, %121
  %123 = add i32 %122, %8
  %124 = getelementptr i32, ptr @187, i32 %linear_index
  %constant_1747_459 = getelementptr inbounds i32, ptr %124, i32 0
  %constant_1747_460 = load i32, ptr %constant_1747_459, align 4
  %125 = shl i32 %121, %constant_1747_460
  %shft.chk61 = icmp ult i32 %constant_1747_460, 32
  %126 = select i1 %shft.chk61, i32 %125, i32 0
  %127 = getelementptr i32, ptr @195, i32 %linear_index
  %constant_1746_462 = getelementptr inbounds i32, ptr %127, i32 0
  %constant_1746_463 = load i32, ptr %constant_1746_462, align 4
  %128 = lshr i32 %121, %constant_1746_463
  %shft.chk64 = icmp ult i32 %constant_1746_463, 32
  %129 = select i1 %shft.chk64, i32 %128, i32 0
  %130 = or i32 %126, %129
  %131 = xor i32 %122, %130
  %132 = add i32 %131, %11
  %133 = getelementptr i32, ptr @193, i32 %linear_index
  %constant_1751_265 = getelementptr inbounds i32, ptr %133, i32 0
  %constant_1751_266 = load i32, ptr %constant_1751_265, align 4
  %134 = add i32 %132, %constant_1751_266
  %135 = add i32 %123, %134
  %136 = getelementptr i32, ptr @188, i32 %linear_index
  %constant_1745_367 = getelementptr inbounds i32, ptr %136, i32 0
  %constant_1745_368 = load i32, ptr %constant_1745_367, align 4
  %137 = shl i32 %134, %constant_1745_368
  %shft.chk69 = icmp ult i32 %constant_1745_368, 32
  %138 = select i1 %shft.chk69, i32 %137, i32 0
  %139 = getelementptr i32, ptr @194, i32 %linear_index
  %constant_1744_370 = getelementptr inbounds i32, ptr %139, i32 0
  %constant_1744_371 = load i32, ptr %constant_1744_370, align 4
  %140 = lshr i32 %134, %constant_1744_371
  %shft.chk72 = icmp ult i32 %constant_1744_371, 32
  %141 = select i1 %shft.chk72, i32 %140, i32 0
  %142 = or i32 %138, %141
  %143 = xor i32 %135, %142
  %144 = add i32 %135, %143
  %145 = getelementptr i32, ptr @199, i32 %linear_index
  %constant_1750_473 = getelementptr inbounds i32, ptr %145, i32 0
  %constant_1750_474 = load i32, ptr %constant_1750_473, align 4
  %146 = shl i32 %143, %constant_1750_474
  %shft.chk75 = icmp ult i32 %constant_1750_474, 32
  %147 = select i1 %shft.chk75, i32 %146, i32 0
  %148 = getelementptr i32, ptr @193, i32 %linear_index
  %constant_1751_276 = getelementptr inbounds i32, ptr %148, i32 0
  %constant_1751_277 = load i32, ptr %constant_1751_276, align 4
  %149 = lshr i32 %143, %constant_1751_277
  %shft.chk78 = icmp ult i32 %constant_1751_277, 32
  %150 = select i1 %shft.chk78, i32 %149, i32 0
  %151 = or i32 %147, %150
  %152 = xor i32 %144, %151
  %153 = add i32 %144, %152
  %154 = getelementptr i32, ptr @192, i32 %linear_index
  %constant_1752_179 = getelementptr inbounds i32, ptr %154, i32 0
  %constant_1752_180 = load i32, ptr %constant_1752_179, align 4
  %155 = shl i32 %152, %constant_1752_180
  %shft.chk81 = icmp ult i32 %constant_1752_180, 32
  %156 = select i1 %shft.chk81, i32 %155, i32 0
  %157 = getelementptr i32, ptr @192, i32 %linear_index
  %constant_1752_182 = getelementptr inbounds i32, ptr %157, i32 0
  %constant_1752_183 = load i32, ptr %constant_1752_182, align 4
  %158 = lshr i32 %152, %constant_1752_183
  %shft.chk84 = icmp ult i32 %constant_1752_183, 32
  %159 = select i1 %shft.chk84, i32 %158, i32 0
  %160 = or i32 %156, %159
  %161 = xor i32 %153, %160
  %162 = add i32 %153, %161
  %163 = add i32 %162, %11
  %164 = getelementptr i32, ptr @200, i32 %linear_index
  %constant_1753_485 = getelementptr inbounds i32, ptr %164, i32 0
  %constant_1753_486 = load i32, ptr %constant_1753_485, align 4
  %165 = shl i32 %161, %constant_1753_486
  %shft.chk87 = icmp ult i32 %constant_1753_486, 32
  %166 = select i1 %shft.chk87, i32 %165, i32 0
  %167 = getelementptr i32, ptr @191, i32 %linear_index
  %constant_1754_488 = getelementptr inbounds i32, ptr %167, i32 0
  %constant_1754_489 = load i32, ptr %constant_1754_488, align 4
  %168 = lshr i32 %161, %constant_1754_489
  %shft.chk90 = icmp ult i32 %constant_1754_489, 32
  %169 = select i1 %shft.chk90, i32 %168, i32 0
  %170 = or i32 %166, %169
  %171 = xor i32 %162, %170
  %172 = add i32 %171, %51
  %173 = getelementptr i32, ptr @190, i32 %linear_index
  %constant_1756_1 = getelementptr inbounds i32, ptr %173, i32 0
  %constant_1756_191 = load i32, ptr %constant_1756_1, align 4
  %174 = add i32 %172, %constant_1756_191
  %175 = add i32 %163, %174
  %176 = getelementptr i32, ptr @198, i32 %linear_index
  %constant_1742_492 = getelementptr inbounds i32, ptr %176, i32 0
  %constant_1742_493 = load i32, ptr %constant_1742_492, align 4
  %177 = shl i32 %174, %constant_1742_493
  %shft.chk94 = icmp ult i32 %constant_1742_493, 32
  %178 = select i1 %shft.chk94, i32 %177, i32 0
  %179 = getelementptr i32, ptr @189, i32 %linear_index
  %constant_1743_495 = getelementptr inbounds i32, ptr %179, i32 0
  %constant_1743_496 = load i32, ptr %constant_1743_495, align 4
  %180 = lshr i32 %174, %constant_1743_496
  %shft.chk97 = icmp ult i32 %constant_1743_496, 32
  %181 = select i1 %shft.chk97, i32 %180, i32 0
  %182 = or i32 %178, %181
  %183 = xor i32 %175, %182
  %184 = add i32 %175, %183
  %185 = getelementptr i32, ptr @194, i32 %linear_index
  %constant_1744_398 = getelementptr inbounds i32, ptr %185, i32 0
  %constant_1744_399 = load i32, ptr %constant_1744_398, align 4
  %186 = shl i32 %183, %constant_1744_399
  %shft.chk100 = icmp ult i32 %constant_1744_399, 32
  %187 = select i1 %shft.chk100, i32 %186, i32 0
  %188 = getelementptr i32, ptr @188, i32 %linear_index
  %constant_1745_3101 = getelementptr inbounds i32, ptr %188, i32 0
  %constant_1745_3102 = load i32, ptr %constant_1745_3101, align 4
  %189 = lshr i32 %183, %constant_1745_3102
  %shft.chk103 = icmp ult i32 %constant_1745_3102, 32
  %190 = select i1 %shft.chk103, i32 %189, i32 0
  %191 = or i32 %187, %190
  %192 = xor i32 %184, %191
  %193 = add i32 %184, %192
  %194 = getelementptr i32, ptr @195, i32 %linear_index
  %constant_1746_4104 = getelementptr inbounds i32, ptr %194, i32 0
  %constant_1746_4105 = load i32, ptr %constant_1746_4104, align 4
  %195 = shl i32 %192, %constant_1746_4105
  %shft.chk106 = icmp ult i32 %constant_1746_4105, 32
  %196 = select i1 %shft.chk106, i32 %195, i32 0
  %197 = getelementptr i32, ptr @187, i32 %linear_index
  %constant_1747_4107 = getelementptr inbounds i32, ptr %197, i32 0
  %constant_1747_4108 = load i32, ptr %constant_1747_4107, align 4
  %198 = lshr i32 %192, %constant_1747_4108
  %shft.chk109 = icmp ult i32 %constant_1747_4108, 32
  %199 = select i1 %shft.chk109, i32 %198, i32 0
  %200 = or i32 %196, %199
  %201 = xor i32 %193, %200
  %202 = add i32 %193, %201
  %203 = add i32 %202, %51
  %204 = getelementptr i32, ptr @185, i32 %linear_index
  %constant_1775_1 = getelementptr inbounds i32, ptr %204, i32 0
  %constant_1775_1110 = load i32, ptr %constant_1775_1, align 4
  %205 = lshr i32 %203, %constant_1775_1110
  %shft.chk111 = icmp ult i32 %constant_1775_1110, 32
  %206 = select i1 %shft.chk111, i32 %205, i32 0
  %207 = getelementptr i32, ptr @184, i32 %linear_index
  %constant_1777_2 = getelementptr inbounds i32, ptr %207, i32 0
  %constant_1777_2112 = load i32, ptr %constant_1777_2, align 4
  %208 = or i32 %206, %constant_1777_2112
  %209 = bitcast i32 %208 to float
  %210 = getelementptr float, ptr @183, i32 %linear_index
  %constant_1778_2 = getelementptr inbounds float, ptr %210, i32 0
  %constant_1778_2113 = load float, ptr %constant_1778_2, align 4
  %add.4065.1 = fadd float %209, %constant_1778_2113
  %211 = call float @llvm.maximum.f32(float %constant_1779_11, float %add.4065.1)
  %212 = getelementptr float, ptr @182, i32 %linear_index
  %constant_1780_2 = getelementptr inbounds float, ptr %212, i32 0
  %constant_1780_2114 = load float, ptr %constant_1780_2, align 4
  %compare.651.1 = fcmp olt float %211, %constant_1780_2114
  %213 = zext i1 %compare.651.1 to i8
  %214 = getelementptr i64, ptr @181, i32 %linear_index
  %constant_1781_1 = getelementptr inbounds i64, ptr %214, i32 0
  %constant_1781_1115 = load i64, ptr %constant_1781_1, align 8
  %215 = getelementptr i64, ptr @180, i32 %linear_index
  %constant_1782_1 = getelementptr inbounds i64, ptr %215, i32 0
  %constant_1782_1116 = load i64, ptr %constant_1782_1, align 8
  %216 = trunc i8 %213 to i1
  %217 = select i1 %216, i64 %constant_1781_1115, i64 %constant_1782_1116
  %218 = insertvalue { i64, i32 } undef, i64 %217, 0
  %constant_1779_1117 = load float, ptr @201, align 4
  %219 = getelementptr inbounds [3 x i32], ptr %arg0, i32 0, i32 0
  %220 = load i32, ptr %219, align 4, !invariant.load !297
  %221 = getelementptr inbounds [3 x i32], ptr %arg0, i32 0, i32 1
  %222 = load i32, ptr %221, align 4, !invariant.load !297
  %223 = add i32 %220, %222
  %constant_1742_4118 = load i32, ptr @198, align 4
  %224 = shl i32 %222, %constant_1742_4118
  %shft.chk119 = icmp ult i32 %constant_1742_4118, 32
  %225 = select i1 %shft.chk119, i32 %224, i32 0
  %constant_1743_4120 = load i32, ptr @189, align 4
  %226 = lshr i32 %222, %constant_1743_4120
  %shft.chk121 = icmp ult i32 %constant_1743_4120, 32
  %227 = select i1 %shft.chk121, i32 %226, i32 0
  %228 = or i32 %225, %227
  %229 = xor i32 %223, %228
  %230 = add i32 %223, %229
  %constant_1744_3122 = load i32, ptr @194, align 4
  %231 = shl i32 %229, %constant_1744_3122
  %shft.chk123 = icmp ult i32 %constant_1744_3122, 32
  %232 = select i1 %shft.chk123, i32 %231, i32 0
  %constant_1745_3124 = load i32, ptr @188, align 4
  %233 = lshr i32 %229, %constant_1745_3124
  %shft.chk125 = icmp ult i32 %constant_1745_3124, 32
  %234 = select i1 %shft.chk125, i32 %233, i32 0
  %235 = or i32 %232, %234
  %236 = xor i32 %230, %235
  %237 = add i32 %230, %236
  %constant_1746_4126 = load i32, ptr @195, align 4
  %238 = shl i32 %236, %constant_1746_4126
  %shft.chk127 = icmp ult i32 %constant_1746_4126, 32
  %239 = select i1 %shft.chk127, i32 %238, i32 0
  %constant_1747_4128 = load i32, ptr @187, align 4
  %240 = lshr i32 %236, %constant_1747_4128
  %shft.chk129 = icmp ult i32 %constant_1747_4128, 32
  %241 = select i1 %shft.chk129, i32 %240, i32 0
  %242 = or i32 %239, %241
  %243 = xor i32 %237, %242
  %244 = add i32 %237, %243
  %245 = add i32 %244, %222
  %constant_1747_4130 = load i32, ptr @187, align 4
  %246 = shl i32 %243, %constant_1747_4130
  %shft.chk131 = icmp ult i32 %constant_1747_4130, 32
  %247 = select i1 %shft.chk131, i32 %246, i32 0
  %constant_1746_4132 = load i32, ptr @195, align 4
  %248 = lshr i32 %243, %constant_1746_4132
  %shft.chk133 = icmp ult i32 %constant_1746_4132, 32
  %249 = select i1 %shft.chk133, i32 %248, i32 0
  %250 = or i32 %247, %249
  %251 = xor i32 %244, %250
  %252 = xor i32 %220, %222
  %constant_1776_1134 = load i32, ptr @186, align 4
  %253 = xor i32 %252, %constant_1776_1134
  %254 = add i32 %251, %253
  %constant_1749_3135 = load i32, ptr @197, align 4
  %255 = add i32 %254, %constant_1749_3135
  %256 = add i32 %245, %255
  %constant_1745_3136 = load i32, ptr @188, align 4
  %257 = shl i32 %255, %constant_1745_3136
  %shft.chk137 = icmp ult i32 %constant_1745_3136, 32
  %258 = select i1 %shft.chk137, i32 %257, i32 0
  %constant_1744_3138 = load i32, ptr @194, align 4
  %259 = lshr i32 %255, %constant_1744_3138
  %shft.chk139 = icmp ult i32 %constant_1744_3138, 32
  %260 = select i1 %shft.chk139, i32 %259, i32 0
  %261 = or i32 %258, %260
  %262 = xor i32 %256, %261
  %263 = add i32 %256, %262
  %constant_1750_4140 = load i32, ptr @199, align 4
  %264 = shl i32 %262, %constant_1750_4140
  %shft.chk141 = icmp ult i32 %constant_1750_4140, 32
  %265 = select i1 %shft.chk141, i32 %264, i32 0
  %constant_1751_2142 = load i32, ptr @193, align 4
  %266 = lshr i32 %262, %constant_1751_2142
  %shft.chk143 = icmp ult i32 %constant_1751_2142, 32
  %267 = select i1 %shft.chk143, i32 %266, i32 0
  %268 = or i32 %265, %267
  %269 = xor i32 %263, %268
  %270 = add i32 %263, %269
  %constant_1752_1144 = load i32, ptr @192, align 4
  %271 = shl i32 %269, %constant_1752_1144
  %shft.chk145 = icmp ult i32 %constant_1752_1144, 32
  %272 = select i1 %shft.chk145, i32 %271, i32 0
  %constant_1752_1146 = load i32, ptr @192, align 4
  %273 = lshr i32 %269, %constant_1752_1146
  %shft.chk147 = icmp ult i32 %constant_1752_1146, 32
  %274 = select i1 %shft.chk147, i32 %273, i32 0
  %275 = or i32 %272, %274
  %276 = xor i32 %270, %275
  %277 = add i32 %270, %276
  %278 = add i32 %277, %253
  %constant_1753_4148 = load i32, ptr @200, align 4
  %279 = shl i32 %276, %constant_1753_4148
  %shft.chk149 = icmp ult i32 %constant_1753_4148, 32
  %280 = select i1 %shft.chk149, i32 %279, i32 0
  %constant_1754_4150 = load i32, ptr @191, align 4
  %281 = lshr i32 %276, %constant_1754_4150
  %shft.chk151 = icmp ult i32 %constant_1754_4150, 32
  %282 = select i1 %shft.chk151, i32 %281, i32 0
  %283 = or i32 %280, %282
  %284 = xor i32 %277, %283
  %285 = add i32 %284, %220
  %constant_1755_3152 = load i32, ptr @196, align 4
  %286 = add i32 %285, %constant_1755_3152
  %287 = add i32 %278, %286
  %constant_1742_4153 = load i32, ptr @198, align 4
  %288 = shl i32 %286, %constant_1742_4153
  %shft.chk154 = icmp ult i32 %constant_1742_4153, 32
  %289 = select i1 %shft.chk154, i32 %288, i32 0
  %constant_1743_4155 = load i32, ptr @189, align 4
  %290 = lshr i32 %286, %constant_1743_4155
  %shft.chk156 = icmp ult i32 %constant_1743_4155, 32
  %291 = select i1 %shft.chk156, i32 %290, i32 0
  %292 = or i32 %289, %291
  %293 = xor i32 %287, %292
  %294 = add i32 %287, %293
  %constant_1744_3157 = load i32, ptr @194, align 4
  %295 = shl i32 %293, %constant_1744_3157
  %shft.chk158 = icmp ult i32 %constant_1744_3157, 32
  %296 = select i1 %shft.chk158, i32 %295, i32 0
  %constant_1745_3159 = load i32, ptr @188, align 4
  %297 = lshr i32 %293, %constant_1745_3159
  %shft.chk160 = icmp ult i32 %constant_1745_3159, 32
  %298 = select i1 %shft.chk160, i32 %297, i32 0
  %299 = or i32 %296, %298
  %300 = xor i32 %294, %299
  %301 = add i32 %294, %300
  %constant_1746_4161 = load i32, ptr @195, align 4
  %302 = shl i32 %300, %constant_1746_4161
  %shft.chk162 = icmp ult i32 %constant_1746_4161, 32
  %303 = select i1 %shft.chk162, i32 %302, i32 0
  %constant_1747_4163 = load i32, ptr @187, align 4
  %304 = lshr i32 %300, %constant_1747_4163
  %shft.chk164 = icmp ult i32 %constant_1747_4163, 32
  %305 = select i1 %shft.chk164, i32 %304, i32 0
  %306 = or i32 %303, %305
  %307 = xor i32 %301, %306
  %308 = add i32 %301, %307
  %309 = add i32 %308, %220
  %constant_1747_4165 = load i32, ptr @187, align 4
  %310 = shl i32 %307, %constant_1747_4165
  %shft.chk166 = icmp ult i32 %constant_1747_4165, 32
  %311 = select i1 %shft.chk166, i32 %310, i32 0
  %constant_1746_4167 = load i32, ptr @195, align 4
  %312 = lshr i32 %307, %constant_1746_4167
  %shft.chk168 = icmp ult i32 %constant_1746_4167, 32
  %313 = select i1 %shft.chk168, i32 %312, i32 0
  %314 = or i32 %311, %313
  %315 = xor i32 %308, %314
  %316 = add i32 %315, %222
  %constant_1751_2169 = load i32, ptr @193, align 4
  %317 = add i32 %316, %constant_1751_2169
  %318 = add i32 %309, %317
  %constant_1745_3170 = load i32, ptr @188, align 4
  %319 = shl i32 %317, %constant_1745_3170
  %shft.chk171 = icmp ult i32 %constant_1745_3170, 32
  %320 = select i1 %shft.chk171, i32 %319, i32 0
  %constant_1744_3172 = load i32, ptr @194, align 4
  %321 = lshr i32 %317, %constant_1744_3172
  %shft.chk173 = icmp ult i32 %constant_1744_3172, 32
  %322 = select i1 %shft.chk173, i32 %321, i32 0
  %323 = or i32 %320, %322
  %324 = xor i32 %318, %323
  %325 = add i32 %318, %324
  %constant_1750_4174 = load i32, ptr @199, align 4
  %326 = shl i32 %324, %constant_1750_4174
  %shft.chk175 = icmp ult i32 %constant_1750_4174, 32
  %327 = select i1 %shft.chk175, i32 %326, i32 0
  %constant_1751_2176 = load i32, ptr @193, align 4
  %328 = lshr i32 %324, %constant_1751_2176
  %shft.chk177 = icmp ult i32 %constant_1751_2176, 32
  %329 = select i1 %shft.chk177, i32 %328, i32 0
  %330 = or i32 %327, %329
  %331 = xor i32 %325, %330
  %332 = add i32 %325, %331
  %constant_1752_1178 = load i32, ptr @192, align 4
  %333 = shl i32 %331, %constant_1752_1178
  %shft.chk179 = icmp ult i32 %constant_1752_1178, 32
  %334 = select i1 %shft.chk179, i32 %333, i32 0
  %constant_1752_1180 = load i32, ptr @192, align 4
  %335 = lshr i32 %331, %constant_1752_1180
  %shft.chk181 = icmp ult i32 %constant_1752_1180, 32
  %336 = select i1 %shft.chk181, i32 %335, i32 0
  %337 = or i32 %334, %336
  %338 = xor i32 %332, %337
  %339 = add i32 %332, %338
  %340 = add i32 %339, %222
  %constant_1753_4182 = load i32, ptr @200, align 4
  %341 = shl i32 %338, %constant_1753_4182
  %shft.chk183 = icmp ult i32 %constant_1753_4182, 32
  %342 = select i1 %shft.chk183, i32 %341, i32 0
  %constant_1754_4184 = load i32, ptr @191, align 4
  %343 = lshr i32 %338, %constant_1754_4184
  %shft.chk185 = icmp ult i32 %constant_1754_4184, 32
  %344 = select i1 %shft.chk185, i32 %343, i32 0
  %345 = or i32 %342, %344
  %346 = xor i32 %339, %345
  %347 = add i32 %346, %253
  %constant_1756_1186 = load i32, ptr @190, align 4
  %348 = add i32 %347, %constant_1756_1186
  %349 = add i32 %340, %348
  %constant_1742_4187 = load i32, ptr @198, align 4
  %350 = shl i32 %348, %constant_1742_4187
  %shft.chk188 = icmp ult i32 %constant_1742_4187, 32
  %351 = select i1 %shft.chk188, i32 %350, i32 0
  %constant_1743_4189 = load i32, ptr @189, align 4
  %352 = lshr i32 %348, %constant_1743_4189
  %shft.chk190 = icmp ult i32 %constant_1743_4189, 32
  %353 = select i1 %shft.chk190, i32 %352, i32 0
  %354 = or i32 %351, %353
  %355 = xor i32 %349, %354
  %356 = add i32 %349, %355
  %constant_1744_3191 = load i32, ptr @194, align 4
  %357 = shl i32 %355, %constant_1744_3191
  %shft.chk192 = icmp ult i32 %constant_1744_3191, 32
  %358 = select i1 %shft.chk192, i32 %357, i32 0
  %constant_1745_3193 = load i32, ptr @188, align 4
  %359 = lshr i32 %355, %constant_1745_3193
  %shft.chk194 = icmp ult i32 %constant_1745_3193, 32
  %360 = select i1 %shft.chk194, i32 %359, i32 0
  %361 = or i32 %358, %360
  %362 = xor i32 %356, %361
  %363 = add i32 %356, %362
  %constant_1746_4195 = load i32, ptr @195, align 4
  %364 = shl i32 %362, %constant_1746_4195
  %shft.chk196 = icmp ult i32 %constant_1746_4195, 32
  %365 = select i1 %shft.chk196, i32 %364, i32 0
  %constant_1747_4197 = load i32, ptr @187, align 4
  %366 = lshr i32 %362, %constant_1747_4197
  %shft.chk198 = icmp ult i32 %constant_1747_4197, 32
  %367 = select i1 %shft.chk198, i32 %366, i32 0
  %368 = or i32 %365, %367
  %369 = xor i32 %363, %368
  %370 = add i32 %363, %369
  %371 = add i32 %370, %253
  %constant_1775_1199 = load i32, ptr @185, align 4
  %372 = lshr i32 %371, %constant_1775_1199
  %shft.chk200 = icmp ult i32 %constant_1775_1199, 32
  %373 = select i1 %shft.chk200, i32 %372, i32 0
  %constant_1777_2201 = load i32, ptr @184, align 4
  %374 = or i32 %373, %constant_1777_2201
  %375 = bitcast i32 %374 to float
  %constant_1778_2202 = load float, ptr @183, align 4
  %add.4065.1203 = fadd float %375, %constant_1778_2202
  %376 = call float @llvm.maximum.f32(float %constant_1779_1117, float %add.4065.1203)
  %constant_1780_2204 = load float, ptr @182, align 4
  %compare.651.1205 = fcmp olt float %376, %constant_1780_2204
  %377 = zext i1 %compare.651.1205 to i8
  %constant_1781_1206 = load i64, ptr @181, align 8
  %constant_1782_1207 = load i64, ptr @180, align 8
  %378 = trunc i8 %377 to i1
  %379 = select i1 %378, i64 %constant_1781_1206, i64 %constant_1782_1207
  %constant_1739_1_clone_1 = load i64, ptr @179, align 8
  %380 = icmp sgt i64 %379, %constant_1739_1_clone_1
  %381 = zext i1 %380 to i8
  %382 = zext i8 %381 to i32
  %383 = insertvalue { i64, i32 } %218, i32 %382, 1
  %384 = extractvalue { i64, i32 } %383, 0
  %385 = getelementptr i64, ptr %arg1, i32 %linear_index
  %386 = getelementptr inbounds i64, ptr %385, i32 0
  store i64 %384, ptr %386, align 8
  %387 = extractvalue { i64, i32 } %383, 1
  store i32 %387, ptr %arg2, align 4
  br label %loop_convert_select_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #0

define void @loop_add_minimum_select_fusion_1(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(192) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(8) %arg8, ptr noalias align 128 dereferenceable(8) %arg9, ptr noalias align 128 dereferenceable(8) %arg10, ptr noalias align 128 dereferenceable(8) %arg11) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer6 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.42.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_minimum_select_fusion.1.in_bounds-true, label %loop_add_minimum_select_fusion.1.in_bounds-after

loop_add_minimum_select_fusion.1.in_bounds-after: ; preds = %reduce.42.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_add_minimum_select_fusion.1.in_bounds-true:  ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !297
  %5 = load double, ptr %arg8, align 8, !invariant.load !297
  %6 = fneg double %5
  %constant_1729_1 = load double, ptr @203, align 8
  store double %constant_1729_1, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.42.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.42.1.clone.1.inner.loop_header.reduction_dim.0

reduce.42.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %concatenate.43.8.clone.1.merge, %loop_add_minimum_select_fusion.1.in_bounds-true
  %reduce.42.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.42.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %7 = icmp uge i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, 24
  br i1 %7, label %reduce.42.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.42.1.clone.1.inner.loop_body.reduction_dim.0

reduce.42.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.42.1.clone.1.inner.loop_header.reduction_dim.0
  %8 = load double, ptr %accumulator_0, align 8
  %9 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0
  %10 = load double, ptr %9, align 8, !invariant.load !297
  br label %concatenate.pivot.12.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %11 = phi i32 [ 0, %concatenate.pivot.0. ]
  %12 = sub nsw i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, %11
  %13 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %12
  %14 = load double, ptr %13, align 8, !invariant.load !297
  br label %concatenate.43.8.clone.1.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.4.1
  %15 = phi i32 [ 4, %concatenate.pivot.4.1 ]
  %16 = sub nsw i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, %15
  %17 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %16
  %18 = load double, ptr %17, align 8, !invariant.load !297
  br label %concatenate.43.8.clone.1.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.8.2
  %19 = phi i32 [ 8, %concatenate.pivot.8.2 ]
  %20 = sub nsw i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, %19
  %21 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %20
  %22 = load double, ptr %21, align 8, !invariant.load !297
  br label %concatenate.43.8.clone.1.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.12.3
  %23 = phi i32 [ 12, %concatenate.pivot.12.3 ]
  %24 = sub nsw i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, %23
  %25 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %24
  %26 = load double, ptr %25, align 8, !invariant.load !297
  br label %concatenate.43.8.clone.1.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.16.4
  %27 = phi i32 [ 16, %concatenate.pivot.16.4 ]
  %28 = sub nsw i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, %27
  %29 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %28
  %30 = load double, ptr %29, align 8, !invariant.load !297
  br label %concatenate.43.8.clone.1.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.20.5
  %31 = phi i32 [ 20, %concatenate.pivot.20.5 ]
  %32 = sub nsw i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, %31
  %33 = getelementptr inbounds [4 x double], ptr %arg7, i32 0, i32 %32
  %34 = load double, ptr %33, align 8, !invariant.load !297
  br label %concatenate.43.8.clone.1.merge

concatenate.pivot.12.:                            ; preds = %reduce.42.1.clone.1.inner.loop_body.reduction_dim.0
  %35 = icmp ult i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, 12
  br i1 %35, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %concatenate.pivot.12.
  %36 = icmp ult i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, 4
  br i1 %36, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id0

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %37 = icmp ult i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, 8
  br i1 %37, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id1

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id2

concatenate.pivot.16.:                            ; preds = %concatenate.pivot.12.
  %38 = icmp ult i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, 16
  br i1 %38, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id3

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %39 = icmp ult i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, 20
  br i1 %39, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id4

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id5

concatenate.43.8.clone.1.merge:                   ; preds = %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %40 = phi double [ %14, %concat_index_from_operand_id0 ], [ %18, %concat_index_from_operand_id1 ], [ %22, %concat_index_from_operand_id2 ], [ %26, %concat_index_from_operand_id3 ], [ %30, %concat_index_from_operand_id4 ], [ %34, %concat_index_from_operand_id5 ]
  %multiply.2971.5.clone.1 = fmul double %10, %40
  %multiply.2972.3.clone.1 = fmul double %multiply.2971.5.clone.1, %40
  store double %8, ptr %parameter_buffer, align 8
  store double %multiply.2972.3.clone.1, ptr %parameter_buffer6, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %parameter_buffer, ptr %parameter_buffer6, ptr %return_buffer)
  %41 = load double, ptr %return_buffer, align 8
  store double %41, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.42.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.42.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.42.1.clone.1.inner.loop_header.reduction_dim.0

reduce.42.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.42.1.clone.1.inner.loop_header.reduction_dim.0
  %42 = load double, ptr %accumulator_0, align 8
  %constant_1731_2_clone_1 = load double, ptr @202, align 8
  %multiply.2973.1.clone.1 = fmul double %42, %constant_1731_2_clone_1
  %add.4066.1.clone.1 = fadd double %6, %multiply.2973.1.clone.1
  %subtract.239.1.clone.1 = fsub double %4, %add.4066.1.clone.1
  %compare.653.1.clone.1 = fcmp une double %subtract.239.1.clone.1, %subtract.239.1.clone.1
  %43 = zext i1 %compare.653.1.clone.1 to i8
  %constant_1730_1_clone_1 = load double, ptr @204, align 8
  %44 = trunc i8 %43 to i1
  %45 = select i1 %44, double %constant_1730_1_clone_1, double %subtract.239.1.clone.1
  %constant_1729_17 = load double, ptr @203, align 8
  %46 = fcmp une double %45, %45
  %47 = fcmp oeq double %constant_1729_17, %constant_1729_17
  %48 = fcmp ole double %45, %constant_1729_17
  %49 = and i1 %47, %48
  %50 = or i1 %46, %49
  %minimum.9.1 = select i1 %50, double %45, double %constant_1729_17
  %51 = insertvalue { double, double, double } undef, double %minimum.9.1, 0
  %52 = insertvalue { double, double, double } %51, double %45, 1
  %53 = insertvalue { double, double, double } %52, double %add.4066.1.clone.1, 2
  %54 = extractvalue { double, double, double } %53, 0
  store double %54, ptr %arg9, align 8
  %55 = extractvalue { double, double, double } %53, 1
  store double %55, ptr %arg10, align 8
  %56 = extractvalue { double, double, double } %53, 2
  store double %56, ptr %arg11, align 8
  br label %loop_add_minimum_select_fusion.1.in_bounds-after
}

define void @loop_and_fusion_1(ptr noalias align 128 dereferenceable(1) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(1) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
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
  %4 = load i64, ptr %arg2, align 8, !invariant.load !297
  %5 = load i64, ptr %arg3, align 8, !invariant.load !297
  %6 = icmp slt i64 %4, %5
  %7 = zext i1 %6 to i8
  %8 = load i8, ptr %arg1, align 1, !invariant.load !297
  %9 = trunc i8 %8 to i1
  %10 = xor i1 %9, true
  %11 = zext i1 %10 to i8
  %12 = and i8 %7, %11
  %13 = load i8, ptr %arg0, align 1, !invariant.load !297
  %14 = trunc i8 %13 to i1
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i8
  %17 = and i8 %12, %16
  store i8 %17, ptr %arg4, align 1
  br label %loop_and_fusion.1.in_bounds-after
}

define void @loop_convert_fusion_4(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(4) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_convert_fusion.4.in_bounds-true, label %loop_convert_fusion.4.in_bounds-after

loop_convert_fusion.4.in_bounds-after:            ; preds = %loop_convert_fusion.4.in_bounds-true, %entry
  ret void

loop_convert_fusion.4.in_bounds-true:             ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !297
  %constant_1691_2 = load i64, ptr @205, align 8
  %5 = icmp eq i64 %4, %constant_1691_2
  %6 = zext i1 %5 to i8
  %7 = zext i8 %6 to i32
  store i32 %7, ptr %arg1, align 4
  br label %loop_convert_fusion.4.in_bounds-after
}

define void @loop_convert_fusion_3(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(4) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_convert_fusion.3.in_bounds-true, label %loop_convert_fusion.3.in_bounds-after

loop_convert_fusion.3.in_bounds-after:            ; preds = %loop_convert_fusion.3.in_bounds-true, %entry
  ret void

loop_convert_fusion.3.in_bounds-true:             ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !297
  %constant_1691_3 = load i64, ptr @206, align 8
  %5 = icmp slt i64 %4, %constant_1691_3
  %6 = zext i1 %5 to i8
  %7 = load i64, ptr %arg0, align 8, !invariant.load !297
  %8 = sub i64 0, %7
  %9 = load i64, ptr %arg0, align 8, !invariant.load !297
  %10 = trunc i8 %6 to i1
  %11 = select i1 %10, i64 %8, i64 %9
  %constant_1681_3 = load i64, ptr @207, align 8
  %12 = and i64 %11, %constant_1681_3
  %13 = sub i64 0, %12
  %14 = trunc i8 %6 to i1
  %15 = select i1 %14, i64 %13, i64 %12
  %constant_1691_31 = load i64, ptr @206, align 8
  %16 = icmp slt i64 %15, %constant_1691_31
  %17 = zext i1 %16 to i8
  %constant_1691_32 = load i64, ptr @206, align 8
  %18 = icmp ne i64 %15, %constant_1691_32
  %19 = zext i1 %18 to i8
  %20 = and i8 %17, %19
  %constant_1679_1 = load i64, ptr @208, align 8
  %21 = add i64 %15, %constant_1679_1
  %22 = trunc i8 %20 to i1
  %23 = select i1 %22, i64 %21, i64 %15
  %constant_1691_33 = load i64, ptr @206, align 8
  %24 = icmp eq i64 %23, %constant_1691_33
  %25 = zext i1 %24 to i8
  %26 = zext i8 %25 to i32
  store i32 %26, ptr %arg1, align 4
  br label %loop_convert_fusion.3.in_bounds-after
}

define void @input_concatenate_fusion_1(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %input_concatenate_fusion.1.in_bounds-true, label %input_concatenate_fusion.1.in_bounds-after

input_concatenate_fusion.1.in_bounds-after:       ; preds = %input_concatenate_fusion.1.in_bounds-true, %entry
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %7 = mul nuw nsw i32 %5, 1
  %linear_index110 = add nuw nsw i32 %7, %6
  %linear_index_in_range111 = icmp ult i32 %linear_index110, 1
  call void @llvm.assume(i1 %linear_index_in_range111)
  %linear_index0112 = add nuw nsw i32 %linear_index110, 0
  %8 = udiv i32 %linear_index0112, 1
  %9 = icmp ult i32 %linear_index110, 1
  br i1 %9, label %input_concatenate_fusion.1.in_bounds-true113, label %input_concatenate_fusion.1.in_bounds-after114

input_concatenate_fusion.1.in_bounds-after114:    ; preds = %input_concatenate_fusion.1.in_bounds-true113, %input_concatenate_fusion.1.in_bounds-after
  ret void

input_concatenate_fusion.1.in_bounds-true:        ; preds = %entry
  %10 = add i32 %3, 0
  %11 = load i64, ptr %arg1, align 8, !invariant.load !297
  %12 = trunc i64 %11 to i32
  %constant_1701_1 = load i32, ptr @222, align 4
  %13 = lshr i32 %12, %constant_1701_1
  %shft.chk = icmp ult i32 %constant_1701_1, 32
  %14 = select i1 %shft.chk, i32 %13, i32 0
  %15 = add i32 %3, 0
  %16 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !297
  %18 = add i32 %14, %17
  %19 = add i32 %3, 1
  %20 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 %19
  %21 = load i32, ptr %20, align 4, !invariant.load !297
  %22 = add i32 %12, %21
  %23 = add i32 %18, %22
  %24 = getelementptr i32, ptr @221, i32 %linear_index
  %constant_1702_1 = getelementptr inbounds i32, ptr %24, i32 0
  %constant_1702_11 = load i32, ptr %constant_1702_1, align 4
  %25 = shl i32 %22, %constant_1702_11
  %shft.chk2 = icmp ult i32 %constant_1702_11, 32
  %26 = select i1 %shft.chk2, i32 %25, i32 0
  %27 = getelementptr i32, ptr @212, i32 %linear_index
  %constant_1703_1 = getelementptr inbounds i32, ptr %27, i32 0
  %constant_1703_13 = load i32, ptr %constant_1703_1, align 4
  %28 = lshr i32 %22, %constant_1703_13
  %shft.chk4 = icmp ult i32 %constant_1703_13, 32
  %29 = select i1 %shft.chk4, i32 %28, i32 0
  %30 = or i32 %26, %29
  %31 = xor i32 %23, %30
  %32 = add i32 %23, %31
  %33 = getelementptr i32, ptr @217, i32 %linear_index
  %constant_1704_1 = getelementptr inbounds i32, ptr %33, i32 0
  %constant_1704_15 = load i32, ptr %constant_1704_1, align 4
  %34 = shl i32 %31, %constant_1704_15
  %shft.chk6 = icmp ult i32 %constant_1704_15, 32
  %35 = select i1 %shft.chk6, i32 %34, i32 0
  %36 = getelementptr i32, ptr @211, i32 %linear_index
  %constant_1705_1 = getelementptr inbounds i32, ptr %36, i32 0
  %constant_1705_17 = load i32, ptr %constant_1705_1, align 4
  %37 = lshr i32 %31, %constant_1705_17
  %shft.chk8 = icmp ult i32 %constant_1705_17, 32
  %38 = select i1 %shft.chk8, i32 %37, i32 0
  %39 = or i32 %35, %38
  %40 = xor i32 %32, %39
  %41 = add i32 %32, %40
  %42 = getelementptr i32, ptr @218, i32 %linear_index
  %constant_1706_1 = getelementptr inbounds i32, ptr %42, i32 0
  %constant_1706_19 = load i32, ptr %constant_1706_1, align 4
  %43 = shl i32 %40, %constant_1706_19
  %shft.chk10 = icmp ult i32 %constant_1706_19, 32
  %44 = select i1 %shft.chk10, i32 %43, i32 0
  %45 = getelementptr i32, ptr @210, i32 %linear_index
  %constant_1707_1 = getelementptr inbounds i32, ptr %45, i32 0
  %constant_1707_111 = load i32, ptr %constant_1707_1, align 4
  %46 = lshr i32 %40, %constant_1707_111
  %shft.chk12 = icmp ult i32 %constant_1707_111, 32
  %47 = select i1 %shft.chk12, i32 %46, i32 0
  %48 = or i32 %44, %47
  %49 = xor i32 %41, %48
  %50 = add i32 %41, %49
  %51 = add i32 %50, %21
  %52 = getelementptr i32, ptr @210, i32 %linear_index
  %constant_1707_113 = getelementptr inbounds i32, ptr %52, i32 0
  %constant_1707_114 = load i32, ptr %constant_1707_113, align 4
  %53 = shl i32 %49, %constant_1707_114
  %shft.chk15 = icmp ult i32 %constant_1707_114, 32
  %54 = select i1 %shft.chk15, i32 %53, i32 0
  %55 = getelementptr i32, ptr @218, i32 %linear_index
  %constant_1706_116 = getelementptr inbounds i32, ptr %55, i32 0
  %constant_1706_117 = load i32, ptr %constant_1706_116, align 4
  %56 = lshr i32 %49, %constant_1706_117
  %shft.chk18 = icmp ult i32 %constant_1706_117, 32
  %57 = select i1 %shft.chk18, i32 %56, i32 0
  %58 = or i32 %54, %57
  %59 = xor i32 %50, %58
  %60 = xor i32 %17, %21
  %61 = getelementptr i32, ptr @209, i32 %linear_index
  %constant_1727_1 = getelementptr inbounds i32, ptr %61, i32 0
  %constant_1727_119 = load i32, ptr %constant_1727_1, align 4
  %62 = xor i32 %60, %constant_1727_119
  %63 = add i32 %59, %62
  %64 = getelementptr i32, ptr @220, i32 %linear_index
  %constant_1708_1 = getelementptr inbounds i32, ptr %64, i32 0
  %constant_1708_120 = load i32, ptr %constant_1708_1, align 4
  %65 = add i32 %63, %constant_1708_120
  %66 = add i32 %51, %65
  %67 = getelementptr i32, ptr @211, i32 %linear_index
  %constant_1705_121 = getelementptr inbounds i32, ptr %67, i32 0
  %constant_1705_122 = load i32, ptr %constant_1705_121, align 4
  %68 = shl i32 %65, %constant_1705_122
  %shft.chk23 = icmp ult i32 %constant_1705_122, 32
  %69 = select i1 %shft.chk23, i32 %68, i32 0
  %70 = getelementptr i32, ptr @217, i32 %linear_index
  %constant_1704_124 = getelementptr inbounds i32, ptr %70, i32 0
  %constant_1704_125 = load i32, ptr %constant_1704_124, align 4
  %71 = lshr i32 %65, %constant_1704_125
  %shft.chk26 = icmp ult i32 %constant_1704_125, 32
  %72 = select i1 %shft.chk26, i32 %71, i32 0
  %73 = or i32 %69, %72
  %74 = xor i32 %66, %73
  %75 = add i32 %66, %74
  %76 = getelementptr i32, ptr @223, i32 %linear_index
  %constant_1709_1 = getelementptr inbounds i32, ptr %76, i32 0
  %constant_1709_127 = load i32, ptr %constant_1709_1, align 4
  %77 = shl i32 %74, %constant_1709_127
  %shft.chk28 = icmp ult i32 %constant_1709_127, 32
  %78 = select i1 %shft.chk28, i32 %77, i32 0
  %79 = getelementptr i32, ptr @216, i32 %linear_index
  %constant_1710_1 = getelementptr inbounds i32, ptr %79, i32 0
  %constant_1710_129 = load i32, ptr %constant_1710_1, align 4
  %80 = lshr i32 %74, %constant_1710_129
  %shft.chk30 = icmp ult i32 %constant_1710_129, 32
  %81 = select i1 %shft.chk30, i32 %80, i32 0
  %82 = or i32 %78, %81
  %83 = xor i32 %75, %82
  %84 = add i32 %75, %83
  %85 = getelementptr i32, ptr @215, i32 %linear_index
  %constant_1711_1 = getelementptr inbounds i32, ptr %85, i32 0
  %constant_1711_131 = load i32, ptr %constant_1711_1, align 4
  %86 = shl i32 %83, %constant_1711_131
  %shft.chk32 = icmp ult i32 %constant_1711_131, 32
  %87 = select i1 %shft.chk32, i32 %86, i32 0
  %88 = getelementptr i32, ptr @215, i32 %linear_index
  %constant_1711_133 = getelementptr inbounds i32, ptr %88, i32 0
  %constant_1711_134 = load i32, ptr %constant_1711_133, align 4
  %89 = lshr i32 %83, %constant_1711_134
  %shft.chk35 = icmp ult i32 %constant_1711_134, 32
  %90 = select i1 %shft.chk35, i32 %89, i32 0
  %91 = or i32 %87, %90
  %92 = xor i32 %84, %91
  %93 = add i32 %84, %92
  %94 = add i32 %93, %62
  %95 = getelementptr i32, ptr @224, i32 %linear_index
  %constant_1712_1 = getelementptr inbounds i32, ptr %95, i32 0
  %constant_1712_136 = load i32, ptr %constant_1712_1, align 4
  %96 = shl i32 %92, %constant_1712_136
  %shft.chk37 = icmp ult i32 %constant_1712_136, 32
  %97 = select i1 %shft.chk37, i32 %96, i32 0
  %98 = getelementptr i32, ptr @214, i32 %linear_index
  %constant_1713_1 = getelementptr inbounds i32, ptr %98, i32 0
  %constant_1713_138 = load i32, ptr %constant_1713_1, align 4
  %99 = lshr i32 %92, %constant_1713_138
  %shft.chk39 = icmp ult i32 %constant_1713_138, 32
  %100 = select i1 %shft.chk39, i32 %99, i32 0
  %101 = or i32 %97, %100
  %102 = xor i32 %93, %101
  %103 = add i32 %102, %17
  %104 = getelementptr i32, ptr @219, i32 %linear_index
  %constant_1714_1 = getelementptr inbounds i32, ptr %104, i32 0
  %constant_1714_140 = load i32, ptr %constant_1714_1, align 4
  %105 = add i32 %103, %constant_1714_140
  %106 = add i32 %94, %105
  %107 = getelementptr i32, ptr @221, i32 %linear_index
  %constant_1702_141 = getelementptr inbounds i32, ptr %107, i32 0
  %constant_1702_142 = load i32, ptr %constant_1702_141, align 4
  %108 = shl i32 %105, %constant_1702_142
  %shft.chk43 = icmp ult i32 %constant_1702_142, 32
  %109 = select i1 %shft.chk43, i32 %108, i32 0
  %110 = getelementptr i32, ptr @212, i32 %linear_index
  %constant_1703_144 = getelementptr inbounds i32, ptr %110, i32 0
  %constant_1703_145 = load i32, ptr %constant_1703_144, align 4
  %111 = lshr i32 %105, %constant_1703_145
  %shft.chk46 = icmp ult i32 %constant_1703_145, 32
  %112 = select i1 %shft.chk46, i32 %111, i32 0
  %113 = or i32 %109, %112
  %114 = xor i32 %106, %113
  %115 = add i32 %106, %114
  %116 = getelementptr i32, ptr @217, i32 %linear_index
  %constant_1704_147 = getelementptr inbounds i32, ptr %116, i32 0
  %constant_1704_148 = load i32, ptr %constant_1704_147, align 4
  %117 = shl i32 %114, %constant_1704_148
  %shft.chk49 = icmp ult i32 %constant_1704_148, 32
  %118 = select i1 %shft.chk49, i32 %117, i32 0
  %119 = getelementptr i32, ptr @211, i32 %linear_index
  %constant_1705_150 = getelementptr inbounds i32, ptr %119, i32 0
  %constant_1705_151 = load i32, ptr %constant_1705_150, align 4
  %120 = lshr i32 %114, %constant_1705_151
  %shft.chk52 = icmp ult i32 %constant_1705_151, 32
  %121 = select i1 %shft.chk52, i32 %120, i32 0
  %122 = or i32 %118, %121
  %123 = xor i32 %115, %122
  %124 = add i32 %115, %123
  %125 = getelementptr i32, ptr @218, i32 %linear_index
  %constant_1706_153 = getelementptr inbounds i32, ptr %125, i32 0
  %constant_1706_154 = load i32, ptr %constant_1706_153, align 4
  %126 = shl i32 %123, %constant_1706_154
  %shft.chk55 = icmp ult i32 %constant_1706_154, 32
  %127 = select i1 %shft.chk55, i32 %126, i32 0
  %128 = getelementptr i32, ptr @210, i32 %linear_index
  %constant_1707_156 = getelementptr inbounds i32, ptr %128, i32 0
  %constant_1707_157 = load i32, ptr %constant_1707_156, align 4
  %129 = lshr i32 %123, %constant_1707_157
  %shft.chk58 = icmp ult i32 %constant_1707_157, 32
  %130 = select i1 %shft.chk58, i32 %129, i32 0
  %131 = or i32 %127, %130
  %132 = xor i32 %124, %131
  %133 = add i32 %124, %132
  %134 = add i32 %133, %17
  %135 = getelementptr i32, ptr @210, i32 %linear_index
  %constant_1707_159 = getelementptr inbounds i32, ptr %135, i32 0
  %constant_1707_160 = load i32, ptr %constant_1707_159, align 4
  %136 = shl i32 %132, %constant_1707_160
  %shft.chk61 = icmp ult i32 %constant_1707_160, 32
  %137 = select i1 %shft.chk61, i32 %136, i32 0
  %138 = getelementptr i32, ptr @218, i32 %linear_index
  %constant_1706_162 = getelementptr inbounds i32, ptr %138, i32 0
  %constant_1706_163 = load i32, ptr %constant_1706_162, align 4
  %139 = lshr i32 %132, %constant_1706_163
  %shft.chk64 = icmp ult i32 %constant_1706_163, 32
  %140 = select i1 %shft.chk64, i32 %139, i32 0
  %141 = or i32 %137, %140
  %142 = xor i32 %133, %141
  %143 = add i32 %142, %21
  %144 = getelementptr i32, ptr @216, i32 %linear_index
  %constant_1710_165 = getelementptr inbounds i32, ptr %144, i32 0
  %constant_1710_166 = load i32, ptr %constant_1710_165, align 4
  %145 = add i32 %143, %constant_1710_166
  %146 = add i32 %134, %145
  %147 = getelementptr i32, ptr @211, i32 %linear_index
  %constant_1705_167 = getelementptr inbounds i32, ptr %147, i32 0
  %constant_1705_168 = load i32, ptr %constant_1705_167, align 4
  %148 = shl i32 %145, %constant_1705_168
  %shft.chk69 = icmp ult i32 %constant_1705_168, 32
  %149 = select i1 %shft.chk69, i32 %148, i32 0
  %150 = getelementptr i32, ptr @217, i32 %linear_index
  %constant_1704_170 = getelementptr inbounds i32, ptr %150, i32 0
  %constant_1704_171 = load i32, ptr %constant_1704_170, align 4
  %151 = lshr i32 %145, %constant_1704_171
  %shft.chk72 = icmp ult i32 %constant_1704_171, 32
  %152 = select i1 %shft.chk72, i32 %151, i32 0
  %153 = or i32 %149, %152
  %154 = xor i32 %146, %153
  %155 = add i32 %146, %154
  %156 = getelementptr i32, ptr @223, i32 %linear_index
  %constant_1709_173 = getelementptr inbounds i32, ptr %156, i32 0
  %constant_1709_174 = load i32, ptr %constant_1709_173, align 4
  %157 = shl i32 %154, %constant_1709_174
  %shft.chk75 = icmp ult i32 %constant_1709_174, 32
  %158 = select i1 %shft.chk75, i32 %157, i32 0
  %159 = getelementptr i32, ptr @216, i32 %linear_index
  %constant_1710_176 = getelementptr inbounds i32, ptr %159, i32 0
  %constant_1710_177 = load i32, ptr %constant_1710_176, align 4
  %160 = lshr i32 %154, %constant_1710_177
  %shft.chk78 = icmp ult i32 %constant_1710_177, 32
  %161 = select i1 %shft.chk78, i32 %160, i32 0
  %162 = or i32 %158, %161
  %163 = xor i32 %155, %162
  %164 = add i32 %155, %163
  %165 = getelementptr i32, ptr @215, i32 %linear_index
  %constant_1711_179 = getelementptr inbounds i32, ptr %165, i32 0
  %constant_1711_180 = load i32, ptr %constant_1711_179, align 4
  %166 = shl i32 %163, %constant_1711_180
  %shft.chk81 = icmp ult i32 %constant_1711_180, 32
  %167 = select i1 %shft.chk81, i32 %166, i32 0
  %168 = getelementptr i32, ptr @215, i32 %linear_index
  %constant_1711_182 = getelementptr inbounds i32, ptr %168, i32 0
  %constant_1711_183 = load i32, ptr %constant_1711_182, align 4
  %169 = lshr i32 %163, %constant_1711_183
  %shft.chk84 = icmp ult i32 %constant_1711_183, 32
  %170 = select i1 %shft.chk84, i32 %169, i32 0
  %171 = or i32 %167, %170
  %172 = xor i32 %164, %171
  %173 = add i32 %164, %172
  %174 = add i32 %173, %21
  %175 = getelementptr i32, ptr @224, i32 %linear_index
  %constant_1712_185 = getelementptr inbounds i32, ptr %175, i32 0
  %constant_1712_186 = load i32, ptr %constant_1712_185, align 4
  %176 = shl i32 %172, %constant_1712_186
  %shft.chk87 = icmp ult i32 %constant_1712_186, 32
  %177 = select i1 %shft.chk87, i32 %176, i32 0
  %178 = getelementptr i32, ptr @214, i32 %linear_index
  %constant_1713_188 = getelementptr inbounds i32, ptr %178, i32 0
  %constant_1713_189 = load i32, ptr %constant_1713_188, align 4
  %179 = lshr i32 %172, %constant_1713_189
  %shft.chk90 = icmp ult i32 %constant_1713_189, 32
  %180 = select i1 %shft.chk90, i32 %179, i32 0
  %181 = or i32 %177, %180
  %182 = xor i32 %173, %181
  %183 = add i32 %182, %62
  %184 = getelementptr i32, ptr @213, i32 %linear_index
  %constant_1715_1 = getelementptr inbounds i32, ptr %184, i32 0
  %constant_1715_191 = load i32, ptr %constant_1715_1, align 4
  %185 = add i32 %183, %constant_1715_191
  %186 = add i32 %174, %185
  %187 = getelementptr i32, ptr @221, i32 %linear_index
  %constant_1702_192 = getelementptr inbounds i32, ptr %187, i32 0
  %constant_1702_193 = load i32, ptr %constant_1702_192, align 4
  %188 = shl i32 %185, %constant_1702_193
  %shft.chk94 = icmp ult i32 %constant_1702_193, 32
  %189 = select i1 %shft.chk94, i32 %188, i32 0
  %190 = getelementptr i32, ptr @212, i32 %linear_index
  %constant_1703_195 = getelementptr inbounds i32, ptr %190, i32 0
  %constant_1703_196 = load i32, ptr %constant_1703_195, align 4
  %191 = lshr i32 %185, %constant_1703_196
  %shft.chk97 = icmp ult i32 %constant_1703_196, 32
  %192 = select i1 %shft.chk97, i32 %191, i32 0
  %193 = or i32 %189, %192
  %194 = xor i32 %186, %193
  %195 = add i32 %186, %194
  %196 = getelementptr i32, ptr @217, i32 %linear_index
  %constant_1704_198 = getelementptr inbounds i32, ptr %196, i32 0
  %constant_1704_199 = load i32, ptr %constant_1704_198, align 4
  %197 = shl i32 %194, %constant_1704_199
  %shft.chk100 = icmp ult i32 %constant_1704_199, 32
  %198 = select i1 %shft.chk100, i32 %197, i32 0
  %199 = getelementptr i32, ptr @211, i32 %linear_index
  %constant_1705_1101 = getelementptr inbounds i32, ptr %199, i32 0
  %constant_1705_1102 = load i32, ptr %constant_1705_1101, align 4
  %200 = lshr i32 %194, %constant_1705_1102
  %shft.chk103 = icmp ult i32 %constant_1705_1102, 32
  %201 = select i1 %shft.chk103, i32 %200, i32 0
  %202 = or i32 %198, %201
  %203 = xor i32 %195, %202
  %204 = add i32 %195, %203
  %205 = getelementptr i32, ptr @218, i32 %linear_index
  %constant_1706_1104 = getelementptr inbounds i32, ptr %205, i32 0
  %constant_1706_1105 = load i32, ptr %constant_1706_1104, align 4
  %206 = shl i32 %203, %constant_1706_1105
  %shft.chk106 = icmp ult i32 %constant_1706_1105, 32
  %207 = select i1 %shft.chk106, i32 %206, i32 0
  %208 = getelementptr i32, ptr @210, i32 %linear_index
  %constant_1707_1107 = getelementptr inbounds i32, ptr %208, i32 0
  %constant_1707_1108 = load i32, ptr %constant_1707_1107, align 4
  %209 = lshr i32 %203, %constant_1707_1108
  %shft.chk109 = icmp ult i32 %constant_1707_1108, 32
  %210 = select i1 %shft.chk109, i32 %209, i32 0
  %211 = or i32 %207, %210
  %212 = xor i32 %204, %211
  %213 = add i32 %204, %212
  %214 = add i32 %213, %62
  %215 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 %10
  store i32 %214, ptr %215, align 4
  br label %input_concatenate_fusion.1.in_bounds-after

input_concatenate_fusion.1.in_bounds-true113:     ; preds = %input_concatenate_fusion.1.in_bounds-after
  %216 = add i32 %8, 1
  %217 = load i64, ptr %arg1, align 8, !invariant.load !297
  %218 = trunc i64 %217 to i32
  %constant_1701_1115 = load i32, ptr @222, align 4
  %219 = lshr i32 %218, %constant_1701_1115
  %shft.chk116 = icmp ult i32 %constant_1701_1115, 32
  %220 = select i1 %shft.chk116, i32 %219, i32 0
  %221 = add i32 %8, 0
  %222 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 %221
  %223 = load i32, ptr %222, align 4, !invariant.load !297
  %224 = add i32 %220, %223
  %225 = add i32 %8, 1
  %226 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 %225
  %227 = load i32, ptr %226, align 4, !invariant.load !297
  %228 = add i32 %218, %227
  %229 = add i32 %224, %228
  %230 = getelementptr i32, ptr @221, i32 %linear_index110
  %constant_1702_1117 = getelementptr inbounds i32, ptr %230, i32 0
  %constant_1702_1118 = load i32, ptr %constant_1702_1117, align 4
  %231 = shl i32 %228, %constant_1702_1118
  %shft.chk119 = icmp ult i32 %constant_1702_1118, 32
  %232 = select i1 %shft.chk119, i32 %231, i32 0
  %233 = getelementptr i32, ptr @212, i32 %linear_index110
  %constant_1703_1120 = getelementptr inbounds i32, ptr %233, i32 0
  %constant_1703_1121 = load i32, ptr %constant_1703_1120, align 4
  %234 = lshr i32 %228, %constant_1703_1121
  %shft.chk122 = icmp ult i32 %constant_1703_1121, 32
  %235 = select i1 %shft.chk122, i32 %234, i32 0
  %236 = or i32 %232, %235
  %237 = xor i32 %229, %236
  %238 = add i32 %229, %237
  %239 = getelementptr i32, ptr @217, i32 %linear_index110
  %constant_1704_1123 = getelementptr inbounds i32, ptr %239, i32 0
  %constant_1704_1124 = load i32, ptr %constant_1704_1123, align 4
  %240 = shl i32 %237, %constant_1704_1124
  %shft.chk125 = icmp ult i32 %constant_1704_1124, 32
  %241 = select i1 %shft.chk125, i32 %240, i32 0
  %242 = getelementptr i32, ptr @211, i32 %linear_index110
  %constant_1705_1126 = getelementptr inbounds i32, ptr %242, i32 0
  %constant_1705_1127 = load i32, ptr %constant_1705_1126, align 4
  %243 = lshr i32 %237, %constant_1705_1127
  %shft.chk128 = icmp ult i32 %constant_1705_1127, 32
  %244 = select i1 %shft.chk128, i32 %243, i32 0
  %245 = or i32 %241, %244
  %246 = xor i32 %238, %245
  %247 = add i32 %238, %246
  %248 = getelementptr i32, ptr @218, i32 %linear_index110
  %constant_1706_1129 = getelementptr inbounds i32, ptr %248, i32 0
  %constant_1706_1130 = load i32, ptr %constant_1706_1129, align 4
  %249 = shl i32 %246, %constant_1706_1130
  %shft.chk131 = icmp ult i32 %constant_1706_1130, 32
  %250 = select i1 %shft.chk131, i32 %249, i32 0
  %251 = getelementptr i32, ptr @210, i32 %linear_index110
  %constant_1707_1132 = getelementptr inbounds i32, ptr %251, i32 0
  %constant_1707_1133 = load i32, ptr %constant_1707_1132, align 4
  %252 = lshr i32 %246, %constant_1707_1133
  %shft.chk134 = icmp ult i32 %constant_1707_1133, 32
  %253 = select i1 %shft.chk134, i32 %252, i32 0
  %254 = or i32 %250, %253
  %255 = xor i32 %247, %254
  %256 = add i32 %247, %255
  %257 = add i32 %256, %227
  %258 = getelementptr i32, ptr @210, i32 %linear_index110
  %constant_1707_1135 = getelementptr inbounds i32, ptr %258, i32 0
  %constant_1707_1136 = load i32, ptr %constant_1707_1135, align 4
  %259 = shl i32 %255, %constant_1707_1136
  %shft.chk137 = icmp ult i32 %constant_1707_1136, 32
  %260 = select i1 %shft.chk137, i32 %259, i32 0
  %261 = getelementptr i32, ptr @218, i32 %linear_index110
  %constant_1706_1138 = getelementptr inbounds i32, ptr %261, i32 0
  %constant_1706_1139 = load i32, ptr %constant_1706_1138, align 4
  %262 = lshr i32 %255, %constant_1706_1139
  %shft.chk140 = icmp ult i32 %constant_1706_1139, 32
  %263 = select i1 %shft.chk140, i32 %262, i32 0
  %264 = or i32 %260, %263
  %265 = xor i32 %256, %264
  %266 = xor i32 %223, %227
  %267 = getelementptr i32, ptr @209, i32 %linear_index110
  %constant_1727_1141 = getelementptr inbounds i32, ptr %267, i32 0
  %constant_1727_1142 = load i32, ptr %constant_1727_1141, align 4
  %268 = xor i32 %266, %constant_1727_1142
  %269 = add i32 %265, %268
  %270 = getelementptr i32, ptr @220, i32 %linear_index110
  %constant_1708_1143 = getelementptr inbounds i32, ptr %270, i32 0
  %constant_1708_1144 = load i32, ptr %constant_1708_1143, align 4
  %271 = add i32 %269, %constant_1708_1144
  %272 = add i32 %257, %271
  %273 = getelementptr i32, ptr @211, i32 %linear_index110
  %constant_1705_1145 = getelementptr inbounds i32, ptr %273, i32 0
  %constant_1705_1146 = load i32, ptr %constant_1705_1145, align 4
  %274 = shl i32 %271, %constant_1705_1146
  %shft.chk147 = icmp ult i32 %constant_1705_1146, 32
  %275 = select i1 %shft.chk147, i32 %274, i32 0
  %276 = getelementptr i32, ptr @217, i32 %linear_index110
  %constant_1704_1148 = getelementptr inbounds i32, ptr %276, i32 0
  %constant_1704_1149 = load i32, ptr %constant_1704_1148, align 4
  %277 = lshr i32 %271, %constant_1704_1149
  %shft.chk150 = icmp ult i32 %constant_1704_1149, 32
  %278 = select i1 %shft.chk150, i32 %277, i32 0
  %279 = or i32 %275, %278
  %280 = xor i32 %272, %279
  %281 = add i32 %272, %280
  %282 = getelementptr i32, ptr @223, i32 %linear_index110
  %constant_1709_1151 = getelementptr inbounds i32, ptr %282, i32 0
  %constant_1709_1152 = load i32, ptr %constant_1709_1151, align 4
  %283 = shl i32 %280, %constant_1709_1152
  %shft.chk153 = icmp ult i32 %constant_1709_1152, 32
  %284 = select i1 %shft.chk153, i32 %283, i32 0
  %285 = getelementptr i32, ptr @216, i32 %linear_index110
  %constant_1710_1154 = getelementptr inbounds i32, ptr %285, i32 0
  %constant_1710_1155 = load i32, ptr %constant_1710_1154, align 4
  %286 = lshr i32 %280, %constant_1710_1155
  %shft.chk156 = icmp ult i32 %constant_1710_1155, 32
  %287 = select i1 %shft.chk156, i32 %286, i32 0
  %288 = or i32 %284, %287
  %289 = xor i32 %281, %288
  %290 = add i32 %281, %289
  %291 = getelementptr i32, ptr @215, i32 %linear_index110
  %constant_1711_1157 = getelementptr inbounds i32, ptr %291, i32 0
  %constant_1711_1158 = load i32, ptr %constant_1711_1157, align 4
  %292 = shl i32 %289, %constant_1711_1158
  %shft.chk159 = icmp ult i32 %constant_1711_1158, 32
  %293 = select i1 %shft.chk159, i32 %292, i32 0
  %294 = getelementptr i32, ptr @215, i32 %linear_index110
  %constant_1711_1160 = getelementptr inbounds i32, ptr %294, i32 0
  %constant_1711_1161 = load i32, ptr %constant_1711_1160, align 4
  %295 = lshr i32 %289, %constant_1711_1161
  %shft.chk162 = icmp ult i32 %constant_1711_1161, 32
  %296 = select i1 %shft.chk162, i32 %295, i32 0
  %297 = or i32 %293, %296
  %298 = xor i32 %290, %297
  %299 = add i32 %290, %298
  %300 = add i32 %299, %268
  %301 = getelementptr i32, ptr @224, i32 %linear_index110
  %constant_1712_1163 = getelementptr inbounds i32, ptr %301, i32 0
  %constant_1712_1164 = load i32, ptr %constant_1712_1163, align 4
  %302 = shl i32 %298, %constant_1712_1164
  %shft.chk165 = icmp ult i32 %constant_1712_1164, 32
  %303 = select i1 %shft.chk165, i32 %302, i32 0
  %304 = getelementptr i32, ptr @214, i32 %linear_index110
  %constant_1713_1166 = getelementptr inbounds i32, ptr %304, i32 0
  %constant_1713_1167 = load i32, ptr %constant_1713_1166, align 4
  %305 = lshr i32 %298, %constant_1713_1167
  %shft.chk168 = icmp ult i32 %constant_1713_1167, 32
  %306 = select i1 %shft.chk168, i32 %305, i32 0
  %307 = or i32 %303, %306
  %308 = xor i32 %299, %307
  %309 = add i32 %308, %223
  %310 = getelementptr i32, ptr @219, i32 %linear_index110
  %constant_1714_1169 = getelementptr inbounds i32, ptr %310, i32 0
  %constant_1714_1170 = load i32, ptr %constant_1714_1169, align 4
  %311 = add i32 %309, %constant_1714_1170
  %312 = add i32 %300, %311
  %313 = getelementptr i32, ptr @221, i32 %linear_index110
  %constant_1702_1171 = getelementptr inbounds i32, ptr %313, i32 0
  %constant_1702_1172 = load i32, ptr %constant_1702_1171, align 4
  %314 = shl i32 %311, %constant_1702_1172
  %shft.chk173 = icmp ult i32 %constant_1702_1172, 32
  %315 = select i1 %shft.chk173, i32 %314, i32 0
  %316 = getelementptr i32, ptr @212, i32 %linear_index110
  %constant_1703_1174 = getelementptr inbounds i32, ptr %316, i32 0
  %constant_1703_1175 = load i32, ptr %constant_1703_1174, align 4
  %317 = lshr i32 %311, %constant_1703_1175
  %shft.chk176 = icmp ult i32 %constant_1703_1175, 32
  %318 = select i1 %shft.chk176, i32 %317, i32 0
  %319 = or i32 %315, %318
  %320 = xor i32 %312, %319
  %321 = add i32 %312, %320
  %322 = getelementptr i32, ptr @217, i32 %linear_index110
  %constant_1704_1177 = getelementptr inbounds i32, ptr %322, i32 0
  %constant_1704_1178 = load i32, ptr %constant_1704_1177, align 4
  %323 = shl i32 %320, %constant_1704_1178
  %shft.chk179 = icmp ult i32 %constant_1704_1178, 32
  %324 = select i1 %shft.chk179, i32 %323, i32 0
  %325 = getelementptr i32, ptr @211, i32 %linear_index110
  %constant_1705_1180 = getelementptr inbounds i32, ptr %325, i32 0
  %constant_1705_1181 = load i32, ptr %constant_1705_1180, align 4
  %326 = lshr i32 %320, %constant_1705_1181
  %shft.chk182 = icmp ult i32 %constant_1705_1181, 32
  %327 = select i1 %shft.chk182, i32 %326, i32 0
  %328 = or i32 %324, %327
  %329 = xor i32 %321, %328
  %330 = add i32 %321, %329
  %331 = getelementptr i32, ptr @218, i32 %linear_index110
  %constant_1706_1183 = getelementptr inbounds i32, ptr %331, i32 0
  %constant_1706_1184 = load i32, ptr %constant_1706_1183, align 4
  %332 = shl i32 %329, %constant_1706_1184
  %shft.chk185 = icmp ult i32 %constant_1706_1184, 32
  %333 = select i1 %shft.chk185, i32 %332, i32 0
  %334 = getelementptr i32, ptr @210, i32 %linear_index110
  %constant_1707_1186 = getelementptr inbounds i32, ptr %334, i32 0
  %constant_1707_1187 = load i32, ptr %constant_1707_1186, align 4
  %335 = lshr i32 %329, %constant_1707_1187
  %shft.chk188 = icmp ult i32 %constant_1707_1187, 32
  %336 = select i1 %shft.chk188, i32 %335, i32 0
  %337 = or i32 %333, %336
  %338 = xor i32 %330, %337
  %339 = add i32 %330, %338
  %340 = add i32 %339, %223
  %341 = getelementptr i32, ptr @210, i32 %linear_index110
  %constant_1707_1189 = getelementptr inbounds i32, ptr %341, i32 0
  %constant_1707_1190 = load i32, ptr %constant_1707_1189, align 4
  %342 = shl i32 %338, %constant_1707_1190
  %shft.chk191 = icmp ult i32 %constant_1707_1190, 32
  %343 = select i1 %shft.chk191, i32 %342, i32 0
  %344 = getelementptr i32, ptr @218, i32 %linear_index110
  %constant_1706_1192 = getelementptr inbounds i32, ptr %344, i32 0
  %constant_1706_1193 = load i32, ptr %constant_1706_1192, align 4
  %345 = lshr i32 %338, %constant_1706_1193
  %shft.chk194 = icmp ult i32 %constant_1706_1193, 32
  %346 = select i1 %shft.chk194, i32 %345, i32 0
  %347 = or i32 %343, %346
  %348 = xor i32 %339, %347
  %349 = add i32 %348, %227
  %350 = getelementptr i32, ptr @216, i32 %linear_index110
  %constant_1710_1195 = getelementptr inbounds i32, ptr %350, i32 0
  %constant_1710_1196 = load i32, ptr %constant_1710_1195, align 4
  %351 = add i32 %349, %constant_1710_1196
  %352 = add i32 %340, %351
  %353 = getelementptr i32, ptr @211, i32 %linear_index110
  %constant_1705_1197 = getelementptr inbounds i32, ptr %353, i32 0
  %constant_1705_1198 = load i32, ptr %constant_1705_1197, align 4
  %354 = shl i32 %351, %constant_1705_1198
  %shft.chk199 = icmp ult i32 %constant_1705_1198, 32
  %355 = select i1 %shft.chk199, i32 %354, i32 0
  %356 = getelementptr i32, ptr @217, i32 %linear_index110
  %constant_1704_1200 = getelementptr inbounds i32, ptr %356, i32 0
  %constant_1704_1201 = load i32, ptr %constant_1704_1200, align 4
  %357 = lshr i32 %351, %constant_1704_1201
  %shft.chk202 = icmp ult i32 %constant_1704_1201, 32
  %358 = select i1 %shft.chk202, i32 %357, i32 0
  %359 = or i32 %355, %358
  %360 = xor i32 %352, %359
  %361 = add i32 %352, %360
  %362 = getelementptr i32, ptr @223, i32 %linear_index110
  %constant_1709_1203 = getelementptr inbounds i32, ptr %362, i32 0
  %constant_1709_1204 = load i32, ptr %constant_1709_1203, align 4
  %363 = shl i32 %360, %constant_1709_1204
  %shft.chk205 = icmp ult i32 %constant_1709_1204, 32
  %364 = select i1 %shft.chk205, i32 %363, i32 0
  %365 = getelementptr i32, ptr @216, i32 %linear_index110
  %constant_1710_1206 = getelementptr inbounds i32, ptr %365, i32 0
  %constant_1710_1207 = load i32, ptr %constant_1710_1206, align 4
  %366 = lshr i32 %360, %constant_1710_1207
  %shft.chk208 = icmp ult i32 %constant_1710_1207, 32
  %367 = select i1 %shft.chk208, i32 %366, i32 0
  %368 = or i32 %364, %367
  %369 = xor i32 %361, %368
  %370 = add i32 %361, %369
  %371 = getelementptr i32, ptr @215, i32 %linear_index110
  %constant_1711_1209 = getelementptr inbounds i32, ptr %371, i32 0
  %constant_1711_1210 = load i32, ptr %constant_1711_1209, align 4
  %372 = shl i32 %369, %constant_1711_1210
  %shft.chk211 = icmp ult i32 %constant_1711_1210, 32
  %373 = select i1 %shft.chk211, i32 %372, i32 0
  %374 = getelementptr i32, ptr @215, i32 %linear_index110
  %constant_1711_1212 = getelementptr inbounds i32, ptr %374, i32 0
  %constant_1711_1213 = load i32, ptr %constant_1711_1212, align 4
  %375 = lshr i32 %369, %constant_1711_1213
  %shft.chk214 = icmp ult i32 %constant_1711_1213, 32
  %376 = select i1 %shft.chk214, i32 %375, i32 0
  %377 = or i32 %373, %376
  %378 = xor i32 %370, %377
  %379 = add i32 %370, %378
  %380 = add i32 %379, %227
  %381 = getelementptr i32, ptr @224, i32 %linear_index110
  %constant_1712_1215 = getelementptr inbounds i32, ptr %381, i32 0
  %constant_1712_1216 = load i32, ptr %constant_1712_1215, align 4
  %382 = shl i32 %378, %constant_1712_1216
  %shft.chk217 = icmp ult i32 %constant_1712_1216, 32
  %383 = select i1 %shft.chk217, i32 %382, i32 0
  %384 = getelementptr i32, ptr @214, i32 %linear_index110
  %constant_1713_1218 = getelementptr inbounds i32, ptr %384, i32 0
  %constant_1713_1219 = load i32, ptr %constant_1713_1218, align 4
  %385 = lshr i32 %378, %constant_1713_1219
  %shft.chk220 = icmp ult i32 %constant_1713_1219, 32
  %386 = select i1 %shft.chk220, i32 %385, i32 0
  %387 = or i32 %383, %386
  %388 = xor i32 %379, %387
  %389 = add i32 %388, %268
  %390 = getelementptr i32, ptr @213, i32 %linear_index110
  %constant_1715_1221 = getelementptr inbounds i32, ptr %390, i32 0
  %constant_1715_1222 = load i32, ptr %constant_1715_1221, align 4
  %391 = add i32 %389, %constant_1715_1222
  %392 = add i32 %380, %391
  %393 = getelementptr i32, ptr @221, i32 %linear_index110
  %constant_1702_1223 = getelementptr inbounds i32, ptr %393, i32 0
  %constant_1702_1224 = load i32, ptr %constant_1702_1223, align 4
  %394 = shl i32 %391, %constant_1702_1224
  %shft.chk225 = icmp ult i32 %constant_1702_1224, 32
  %395 = select i1 %shft.chk225, i32 %394, i32 0
  %396 = getelementptr i32, ptr @212, i32 %linear_index110
  %constant_1703_1226 = getelementptr inbounds i32, ptr %396, i32 0
  %constant_1703_1227 = load i32, ptr %constant_1703_1226, align 4
  %397 = lshr i32 %391, %constant_1703_1227
  %shft.chk228 = icmp ult i32 %constant_1703_1227, 32
  %398 = select i1 %shft.chk228, i32 %397, i32 0
  %399 = or i32 %395, %398
  %400 = xor i32 %392, %399
  %401 = add i32 %392, %400
  %402 = getelementptr i32, ptr @217, i32 %linear_index110
  %constant_1704_1229 = getelementptr inbounds i32, ptr %402, i32 0
  %constant_1704_1230 = load i32, ptr %constant_1704_1229, align 4
  %403 = shl i32 %400, %constant_1704_1230
  %shft.chk231 = icmp ult i32 %constant_1704_1230, 32
  %404 = select i1 %shft.chk231, i32 %403, i32 0
  %405 = getelementptr i32, ptr @211, i32 %linear_index110
  %constant_1705_1232 = getelementptr inbounds i32, ptr %405, i32 0
  %constant_1705_1233 = load i32, ptr %constant_1705_1232, align 4
  %406 = lshr i32 %400, %constant_1705_1233
  %shft.chk234 = icmp ult i32 %constant_1705_1233, 32
  %407 = select i1 %shft.chk234, i32 %406, i32 0
  %408 = or i32 %404, %407
  %409 = xor i32 %401, %408
  %410 = add i32 %401, %409
  %411 = getelementptr i32, ptr @218, i32 %linear_index110
  %constant_1706_1235 = getelementptr inbounds i32, ptr %411, i32 0
  %constant_1706_1236 = load i32, ptr %constant_1706_1235, align 4
  %412 = shl i32 %409, %constant_1706_1236
  %shft.chk237 = icmp ult i32 %constant_1706_1236, 32
  %413 = select i1 %shft.chk237, i32 %412, i32 0
  %414 = getelementptr i32, ptr @210, i32 %linear_index110
  %constant_1707_1238 = getelementptr inbounds i32, ptr %414, i32 0
  %constant_1707_1239 = load i32, ptr %constant_1707_1238, align 4
  %415 = lshr i32 %409, %constant_1707_1239
  %shft.chk240 = icmp ult i32 %constant_1707_1239, 32
  %416 = select i1 %shft.chk240, i32 %415, i32 0
  %417 = or i32 %413, %416
  %418 = xor i32 %410, %417
  %419 = add i32 %410, %418
  %420 = getelementptr i32, ptr @210, i32 %linear_index110
  %constant_1707_1241 = getelementptr inbounds i32, ptr %420, i32 0
  %constant_1707_1242 = load i32, ptr %constant_1707_1241, align 4
  %421 = shl i32 %418, %constant_1707_1242
  %shft.chk243 = icmp ult i32 %constant_1707_1242, 32
  %422 = select i1 %shft.chk243, i32 %421, i32 0
  %423 = getelementptr i32, ptr @218, i32 %linear_index110
  %constant_1706_1244 = getelementptr inbounds i32, ptr %423, i32 0
  %constant_1706_1245 = load i32, ptr %constant_1706_1244, align 4
  %424 = lshr i32 %418, %constant_1706_1245
  %shft.chk246 = icmp ult i32 %constant_1706_1245, 32
  %425 = select i1 %shft.chk246, i32 %424, i32 0
  %426 = or i32 %422, %425
  %427 = xor i32 %419, %426
  %428 = add i32 %427, %223
  %429 = getelementptr i32, ptr @225, i32 %linear_index110
  %constant_1716_1 = getelementptr inbounds i32, ptr %429, i32 0
  %constant_1716_1247 = load i32, ptr %constant_1716_1, align 4
  %430 = add i32 %428, %constant_1716_1247
  %431 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 %216
  store i32 %430, ptr %431, align 4
  br label %input_concatenate_fusion.1.in_bounds-after114
}

define void @loop_broadcast_fusion_10(ptr noalias align 128 dereferenceable(32) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_broadcast_fusion.10.in_bounds-true, label %loop_broadcast_fusion.10.in_bounds-after

loop_broadcast_fusion.10.in_bounds-after:         ; preds = %loop_broadcast_fusion.10.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.10.in_bounds-true:          ; preds = %entry
  %constant_1685_3 = load double, ptr @226, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_1685_3, ptr %6, align 8
  br label %loop_broadcast_fusion.10.in_bounds-after
}

define void @loop_broadcast_fusion_14(ptr noalias align 128 dereferenceable(32) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_broadcast_fusion.14.in_bounds-true, label %loop_broadcast_fusion.14.in_bounds-after

loop_broadcast_fusion.14.in_bounds-after:         ; preds = %loop_broadcast_fusion.14.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.14.in_bounds-true:          ; preds = %entry
  %constant_1686_3 = load double, ptr @227, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_1686_3, ptr %6, align 8
  br label %loop_broadcast_fusion.14.in_bounds-after
}

define void @loop_broadcast_fusion_4(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = icmp ult i32 %linear_index, 4
  br i1 %6, label %loop_broadcast_fusion.4.in_bounds-true, label %loop_broadcast_fusion.4.in_bounds-after

loop_broadcast_fusion.4.in_bounds-after:          ; preds = %loop_broadcast_fusion.4.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.4.in_bounds-true:           ; preds = %entry
  %7 = getelementptr inbounds [1 x double], ptr %arg0, i32 0, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !297
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  store double %8, ptr %10, align 8
  br label %loop_broadcast_fusion.4.in_bounds-after
}

define void @loop_broadcast_fusion_17(ptr noalias align 128 dereferenceable(32) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_broadcast_fusion.17.in_bounds-true, label %loop_broadcast_fusion.17.in_bounds-after

loop_broadcast_fusion.17.in_bounds-after:         ; preds = %loop_broadcast_fusion.17.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.17.in_bounds-true:          ; preds = %entry
  %constant_1698_2 = load double, ptr @228, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_1698_2, ptr %6, align 8
  br label %loop_broadcast_fusion.17.in_bounds-after
}

define void @loop_broadcast_fusion_13(ptr noalias align 128 dereferenceable(32) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = icmp ult i32 %linear_index, 4
  br i1 %6, label %loop_broadcast_fusion.13.in_bounds-true, label %loop_broadcast_fusion.13.in_bounds-after

loop_broadcast_fusion.13.in_bounds-after:         ; preds = %loop_broadcast_fusion.13.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.13.in_bounds-true:          ; preds = %entry
  %constant_1685_6 = load double, ptr @229, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  store double %constant_1685_6, ptr %8, align 8
  br label %loop_broadcast_fusion.13.in_bounds-after
}

define void @loop_broadcast_fusion_8(ptr noalias align 128 dereferenceable(32) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_broadcast_fusion.8.in_bounds-true, label %loop_broadcast_fusion.8.in_bounds-after

loop_broadcast_fusion.8.in_bounds-after:          ; preds = %loop_broadcast_fusion.8.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.8.in_bounds-true:           ; preds = %entry
  %constant_1681_1 = load i64, ptr @230, align 8
  %5 = getelementptr i64, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds i64, ptr %5, i32 0
  store i64 %constant_1681_1, ptr %6, align 8
  br label %loop_broadcast_fusion.8.in_bounds-after
}

define void @loop_add_convert_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
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
  %4 = load i64, ptr %arg0, align 8
  %constant_1681_4_clone_1 = load i64, ptr @231, align 8
  %5 = ashr i64 %4, %constant_1681_4_clone_1
  %6 = icmp slt i64 %4, 0
  %7 = select i1 %6, i64 -1, i64 0
  %shft.chk = icmp ult i64 %constant_1681_4_clone_1, 64
  %8 = select i1 %shft.chk, i64 %5, i64 %7
  %9 = icmp sge i64 %8, 0
  %10 = sub i64 0, %8
  %11 = select i1 %9, i64 %8, i64 %10
  %12 = call i64 @llvm.ctpop.i64(i64 %11)
  %13 = trunc i64 %12 to i8
  %14 = zext i8 %13 to i32
  %15 = load i64, ptr %arg0, align 8
  %16 = xor i64 %15, -1
  %17 = load i64, ptr %arg0, align 8
  %constant_1681_4_clone_11 = load i64, ptr @231, align 8
  %18 = add i64 %17, %constant_1681_4_clone_11
  %19 = and i64 %16, %18
  %constant_1726_1 = load i64, ptr @233, align 8
  %20 = add i64 %19, %constant_1726_1
  %21 = icmp sge i64 %20, 0
  %22 = sub i64 0, %20
  %23 = select i1 %21, i64 %20, i64 %22
  %24 = call i64 @llvm.ctpop.i64(i64 %23)
  %25 = trunc i64 %24 to i8
  %26 = zext i8 %25 to i32
  %27 = sub i32 %14, %26
  %constant_1680_1 = load i32, ptr @232, align 4
  %28 = add i32 %27, %constant_1680_1
  %29 = insertvalue { i32, i32, i64 } undef, i32 %28, 0
  %30 = insertvalue { i32, i32, i64 } %29, i32 %14, 1
  %31 = insertvalue { i32, i32, i64 } %30, i64 %18, 2
  %32 = extractvalue { i32, i32, i64 } %31, 0
  store i32 %32, ptr %arg1, align 4
  %33 = extractvalue { i32, i32, i64 } %31, 1
  store i32 %33, ptr %arg2, align 4
  %34 = extractvalue { i32, i32, i64 } %31, 2
  store i64 %34, ptr %arg0, align 8
  br label %loop_add_convert_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #0

define void @loop_concatenate_fusion_1(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8, ptr noalias align 128 dereferenceable(32) %arg9, ptr noalias align 128 dereferenceable(32) %arg10, ptr noalias align 128 dereferenceable(32) %arg11, ptr noalias align 128 dereferenceable(32) %arg12, ptr noalias align 128 dereferenceable(8) %arg13, ptr noalias align 128 dereferenceable(8) %arg14, ptr noalias align 128 dereferenceable(192) %arg15) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %2 = mul nuw nsw i32 %0, 24
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 24
  br i1 %4, label %loop_concatenate_fusion.1.in_bounds-true, label %loop_concatenate_fusion.1.in_bounds-after

loop_concatenate_fusion.1.in_bounds-after:        ; preds = %concatenate.39.10.merge, %entry
  ret void

loop_concatenate_fusion.1.in_bounds-true:         ; preds = %entry
  %constant_1690_1 = load double, ptr @234, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  br label %concatenate.pivot.12.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %8 = phi i32 [ 0, %concatenate.pivot.0. ]
  %9 = sub nsw i32 %3, %8
  %10 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %9
  %11 = load double, ptr %10, align 8, !invariant.load !297
  %12 = load i64, ptr %arg14, align 8, !invariant.load !297
  %13 = sitofp i64 %12 to double
  %14 = load double, ptr %arg13, align 8, !invariant.load !297
  %multiply.2909.21 = fmul double %13, %14
  %constant_1690_11 = load double, ptr @234, align 8
  %multiply.2910.7 = fmul double %multiply.2909.21, %constant_1690_11
  %15 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %9
  %16 = load double, ptr %15, align 8, !invariant.load !297
  %multiply.2911.3 = fmul double %multiply.2910.7, %16
  %add.3822.3 = fadd double %11, %multiply.2911.3
  br label %concatenate.39.10.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.4.17
  %17 = phi i32 [ 4, %concatenate.pivot.4.17 ]
  %18 = sub nsw i32 %3, %17
  %19 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %18
  %20 = load double, ptr %19, align 8, !invariant.load !297
  %21 = load i64, ptr %arg14, align 8, !invariant.load !297
  %22 = sitofp i64 %21 to double
  %23 = load double, ptr %arg13, align 8, !invariant.load !297
  %multiply.2909.212 = fmul double %22, %23
  %constant_1690_13 = load double, ptr @234, align 8
  %multiply.2910.74 = fmul double %multiply.2909.212, %constant_1690_13
  %24 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %18
  %25 = load double, ptr %24, align 8, !invariant.load !297
  %multiply.2912.5 = fmul double %multiply.2910.74, %25
  %add.3825.5 = fadd double %20, %multiply.2912.5
  br label %concatenate.39.10.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.8.18
  %26 = phi i32 [ 8, %concatenate.pivot.8.18 ]
  %27 = sub nsw i32 %3, %26
  %28 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %27
  %29 = load double, ptr %28, align 8, !invariant.load !297
  %30 = load i64, ptr %arg14, align 8, !invariant.load !297
  %31 = sitofp i64 %30 to double
  %32 = load double, ptr %arg13, align 8, !invariant.load !297
  %multiply.2909.215 = fmul double %31, %32
  %constant_1690_16 = load double, ptr @234, align 8
  %multiply.2910.77 = fmul double %multiply.2909.215, %constant_1690_16
  %33 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %27
  %34 = load double, ptr %33, align 8, !invariant.load !297
  %multiply.2913.5 = fmul double %multiply.2910.77, %34
  %add.3826.5 = fadd double %29, %multiply.2913.5
  br label %concatenate.39.10.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.12.19
  %35 = phi i32 [ 12, %concatenate.pivot.12.19 ]
  %36 = sub nsw i32 %3, %35
  %37 = getelementptr inbounds [4 x double], ptr %arg7, i32 0, i32 %36
  %38 = load double, ptr %37, align 8, !invariant.load !297
  %39 = load i64, ptr %arg14, align 8, !invariant.load !297
  %40 = sitofp i64 %39 to double
  %41 = load double, ptr %arg13, align 8, !invariant.load !297
  %multiply.2909.218 = fmul double %40, %41
  %constant_1690_19 = load double, ptr @234, align 8
  %multiply.2910.710 = fmul double %multiply.2909.218, %constant_1690_19
  %42 = getelementptr inbounds [4 x double], ptr %arg8, i32 0, i32 %36
  %43 = load double, ptr %42, align 8, !invariant.load !297
  %multiply.2914.5 = fmul double %multiply.2910.710, %43
  %add.3827.5 = fadd double %38, %multiply.2914.5
  br label %concatenate.39.10.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.16.20
  %44 = phi i32 [ 16, %concatenate.pivot.16.20 ]
  %45 = sub nsw i32 %3, %44
  %46 = getelementptr inbounds [4 x double], ptr %arg9, i32 0, i32 %45
  %47 = load double, ptr %46, align 8, !invariant.load !297
  %48 = load i64, ptr %arg14, align 8, !invariant.load !297
  %49 = sitofp i64 %48 to double
  %50 = load double, ptr %arg13, align 8, !invariant.load !297
  %multiply.2909.2111 = fmul double %49, %50
  %constant_1690_112 = load double, ptr @234, align 8
  %multiply.2910.713 = fmul double %multiply.2909.2111, %constant_1690_112
  %51 = getelementptr inbounds [4 x double], ptr %arg10, i32 0, i32 %45
  %52 = load double, ptr %51, align 8, !invariant.load !297
  %multiply.2915.5 = fmul double %multiply.2910.713, %52
  %add.3829.5 = fadd double %47, %multiply.2915.5
  br label %concatenate.39.10.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.20.21
  %53 = phi i32 [ 20, %concatenate.pivot.20.21 ]
  %54 = sub nsw i32 %3, %53
  %55 = getelementptr inbounds [4 x double], ptr %arg11, i32 0, i32 %54
  %56 = load double, ptr %55, align 8, !invariant.load !297
  %57 = load i64, ptr %arg14, align 8, !invariant.load !297
  %58 = sitofp i64 %57 to double
  %59 = load double, ptr %arg13, align 8, !invariant.load !297
  %multiply.2909.2114 = fmul double %58, %59
  %constant_1690_115 = load double, ptr @234, align 8
  %multiply.2910.716 = fmul double %multiply.2909.2114, %constant_1690_115
  %60 = getelementptr inbounds [4 x double], ptr %arg12, i32 0, i32 %54
  %61 = load double, ptr %60, align 8, !invariant.load !297
  %multiply.2916.5 = fmul double %multiply.2910.716, %61
  %add.3830.5 = fadd double %56, %multiply.2916.5
  br label %concatenate.39.10.merge

concatenate.pivot.12.:                            ; preds = %loop_concatenate_fusion.1.in_bounds-true
  %62 = icmp ult i32 %3, 12
  br i1 %62, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %concatenate.pivot.12.
  %63 = icmp ult i32 %3, 4
  br i1 %63, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id0

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %64 = icmp ult i32 %3, 8
  br i1 %64, label %concatenate.pivot.4.17, label %concatenate.pivot.8.18

concatenate.pivot.4.17:                           ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id1

concatenate.pivot.8.18:                           ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id2

concatenate.pivot.16.:                            ; preds = %concatenate.pivot.12.
  %65 = icmp ult i32 %3, 16
  br i1 %65, label %concatenate.pivot.12.19, label %concatenate.pivot.20.

concatenate.pivot.12.19:                          ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id3

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %66 = icmp ult i32 %3, 20
  br i1 %66, label %concatenate.pivot.16.20, label %concatenate.pivot.20.21

concatenate.pivot.16.20:                          ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id4

concatenate.pivot.20.21:                          ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id5

concatenate.39.10.merge:                          ; preds = %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %67 = phi double [ %add.3822.3, %concat_index_from_operand_id0 ], [ %add.3825.5, %concat_index_from_operand_id1 ], [ %add.3826.5, %concat_index_from_operand_id2 ], [ %add.3827.5, %concat_index_from_operand_id3 ], [ %add.3829.5, %concat_index_from_operand_id4 ], [ %add.3830.5, %concat_index_from_operand_id5 ]
  %multiply.2917.5 = fmul double %7, %67
  %multiply.2918.3 = fmul double %constant_1690_1, %multiply.2917.5
  %68 = getelementptr double, ptr %arg0, i32 %linear_index
  %69 = getelementptr inbounds double, ptr %68, i32 0
  %70 = load double, ptr %69, align 8, !invariant.load !297
  %constant_1690_122 = load double, ptr @234, align 8
  %multiply.2919.5 = fmul double %constant_1690_122, %67
  %multiply.2920.3 = fmul double %70, %multiply.2919.5
  %add.3831.1 = fadd double %multiply.2918.3, %multiply.2920.3
  %71 = getelementptr double, ptr %arg15, i32 %linear_index
  %72 = getelementptr inbounds double, ptr %71, i32 0
  store double %add.3831.1, ptr %72, align 8
  br label %loop_concatenate_fusion.1.in_bounds-after
}

define void @loop_add_exponential_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(192) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8, ptr noalias align 128 dereferenceable(32) %arg9) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_add_exponential_fusion.in_bounds-true, label %loop_add_exponential_fusion.in_bounds-after

loop_add_exponential_fusion.in_bounds-after:      ; preds = %loop_add_exponential_fusion.in_bounds-true, %entry
  ret void

loop_add_exponential_fusion.in_bounds-true:       ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8
  %8 = load i64, ptr %arg3, align 8, !invariant.load !297
  %9 = sitofp i64 %8 to double
  %10 = load double, ptr %arg2, align 8, !invariant.load !297
  %multiply.2909.9.clone.1 = fmul double %9, %10
  %11 = add i32 %3, 8
  %12 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %11
  %13 = load double, ptr %12, align 8, !invariant.load !297
  %multiply.2921.1.clone.1 = fmul double %multiply.2909.9.clone.1, %13
  %add.3832.1.clone.1 = fadd double %7, %multiply.2921.1.clone.1
  %14 = call double @__nv_exp(double %add.3832.1.clone.1)
  %15 = insertvalue { double, double, double, double, double, double, double } undef, double %14, 0
  %16 = insertvalue { double, double, double, double, double, double, double } %15, double %add.3832.1.clone.1, 1
  %17 = getelementptr double, ptr %arg4, i32 %linear_index
  %18 = getelementptr inbounds double, ptr %17, i32 0
  %19 = load double, ptr %18, align 8
  %20 = add i32 %3, 16
  %21 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %20
  %22 = load double, ptr %21, align 8, !invariant.load !297
  %multiply.2922.1.clone.1 = fmul double %multiply.2909.9.clone.1, %22
  %add.3834.1.clone.1 = fadd double %19, %multiply.2922.1.clone.1
  %23 = insertvalue { double, double, double, double, double, double, double } %16, double %add.3834.1.clone.1, 2
  %24 = getelementptr double, ptr %arg5, i32 %linear_index
  %25 = getelementptr inbounds double, ptr %24, i32 0
  %26 = load double, ptr %25, align 8
  %27 = add i32 %3, 12
  %28 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %27
  %29 = load double, ptr %28, align 8, !invariant.load !297
  %multiply.2923.1.clone.1 = fmul double %multiply.2909.9.clone.1, %29
  %add.3835.1.clone.1 = fadd double %26, %multiply.2923.1.clone.1
  %30 = insertvalue { double, double, double, double, double, double, double } %23, double %add.3835.1.clone.1, 3
  %31 = getelementptr double, ptr %arg6, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  %33 = load double, ptr %32, align 8
  %34 = add i32 %3, 20
  %35 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %34
  %36 = load double, ptr %35, align 8, !invariant.load !297
  %multiply.2924.1.clone.1 = fmul double %multiply.2909.9.clone.1, %36
  %add.3836.1.clone.1 = fadd double %33, %multiply.2924.1.clone.1
  %37 = insertvalue { double, double, double, double, double, double, double } %30, double %add.3836.1.clone.1, 4
  %38 = getelementptr double, ptr %arg7, i32 %linear_index
  %39 = getelementptr inbounds double, ptr %38, i32 0
  %40 = load double, ptr %39, align 8
  %41 = add i32 %3, 4
  %42 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %41
  %43 = load double, ptr %42, align 8, !invariant.load !297
  %multiply.2925.1.clone.1 = fmul double %multiply.2909.9.clone.1, %43
  %add.3837.1.clone.1 = fadd double %40, %multiply.2925.1.clone.1
  %44 = insertvalue { double, double, double, double, double, double, double } %37, double %add.3837.1.clone.1, 5
  %45 = getelementptr double, ptr %arg8, i32 %linear_index
  %46 = getelementptr inbounds double, ptr %45, i32 0
  %47 = load double, ptr %46, align 8
  %48 = add i32 %3, 0
  %49 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %48
  %50 = load double, ptr %49, align 8, !invariant.load !297
  %multiply.2929.1.clone.1 = fmul double %multiply.2909.9.clone.1, %50
  %add.3840.1.clone.1 = fadd double %47, %multiply.2929.1.clone.1
  %51 = insertvalue { double, double, double, double, double, double, double } %44, double %add.3840.1.clone.1, 6
  %52 = extractvalue { double, double, double, double, double, double, double } %51, 0
  %53 = getelementptr double, ptr %arg9, i32 %linear_index
  %54 = getelementptr inbounds double, ptr %53, i32 0
  store double %52, ptr %54, align 8
  %55 = extractvalue { double, double, double, double, double, double, double } %51, 1
  %56 = getelementptr double, ptr %arg0, i32 %linear_index
  %57 = getelementptr inbounds double, ptr %56, i32 0
  store double %55, ptr %57, align 8
  %58 = extractvalue { double, double, double, double, double, double, double } %51, 2
  %59 = getelementptr double, ptr %arg4, i32 %linear_index
  %60 = getelementptr inbounds double, ptr %59, i32 0
  store double %58, ptr %60, align 8
  %61 = extractvalue { double, double, double, double, double, double, double } %51, 3
  %62 = getelementptr double, ptr %arg5, i32 %linear_index
  %63 = getelementptr inbounds double, ptr %62, i32 0
  store double %61, ptr %63, align 8
  %64 = extractvalue { double, double, double, double, double, double, double } %51, 4
  %65 = getelementptr double, ptr %arg6, i32 %linear_index
  %66 = getelementptr inbounds double, ptr %65, i32 0
  store double %64, ptr %66, align 8
  %67 = extractvalue { double, double, double, double, double, double, double } %51, 5
  %68 = getelementptr double, ptr %arg7, i32 %linear_index
  %69 = getelementptr inbounds double, ptr %68, i32 0
  store double %67, ptr %69, align 8
  %70 = extractvalue { double, double, double, double, double, double, double } %51, 6
  %71 = getelementptr double, ptr %arg8, i32 %linear_index
  %72 = getelementptr inbounds double, ptr %71, i32 0
  store double %70, ptr %72, align 8
  br label %loop_add_exponential_fusion.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_broadcast_fusion_7(ptr noalias align 128 dereferenceable(768) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %2 = mul nuw nsw i32 %0, 768
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %loop_broadcast_fusion.7.in_bounds-true, label %loop_broadcast_fusion.7.in_bounds-after

loop_broadcast_fusion.7.in_bounds-after:          ; preds = %loop_broadcast_fusion.7.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.7.in_bounds-true:           ; preds = %entry
  %constant_1678_2 = load i8, ptr @235, align 1
  %7 = getelementptr i8, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds i8, ptr %7, i32 0
  store i8 %constant_1678_2, ptr %8, align 1
  br label %loop_broadcast_fusion.7.in_bounds-after
}

define void @loop_broadcast_fusion_6(ptr noalias align 128 dereferenceable(768) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %2 = mul nuw nsw i32 %0, 768
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index0, 4
  %8 = icmp ult i32 %linear_index, 768
  br i1 %8, label %loop_broadcast_fusion.6.in_bounds-true, label %loop_broadcast_fusion.6.in_bounds-after

loop_broadcast_fusion.6.in_bounds-after:          ; preds = %loop_broadcast_fusion.6.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.6.in_bounds-true:           ; preds = %entry
  %constant_1678_1 = load i8, ptr @236, align 1
  %9 = getelementptr i8, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds i8, ptr %9, i32 0
  store i8 %constant_1678_1, ptr %10, align 1
  br label %loop_broadcast_fusion.6.in_bounds-after
}

define void @loop_broadcast_fusion_15(ptr noalias align 128 dereferenceable(768) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !303
  %2 = mul nuw nsw i32 %0, 192
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 192
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 192
  br i1 %4, label %loop_broadcast_fusion.15.in_bounds-true, label %loop_broadcast_fusion.15.in_bounds-after

loop_broadcast_fusion.15.in_bounds-after:         ; preds = %loop_broadcast_fusion.15.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.15.in_bounds-true:          ; preds = %entry
  %constant_1689_1 = load i32, ptr @237, align 4
  %5 = getelementptr i32, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds i32, ptr %5, i32 0
  store i32 %constant_1689_1, ptr %6, align 4
  br label %loop_broadcast_fusion.15.in_bounds-after
}

define void @loop_broadcast_fusion_12(ptr noalias align 128 dereferenceable(1536) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !303
  %2 = mul nuw nsw i32 %0, 192
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 192
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 192
  br i1 %4, label %loop_broadcast_fusion.12.in_bounds-true, label %loop_broadcast_fusion.12.in_bounds-after

loop_broadcast_fusion.12.in_bounds-after:         ; preds = %loop_broadcast_fusion.12.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.12.in_bounds-true:          ; preds = %entry
  %constant_1685_5 = load double, ptr @238, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_1685_5, ptr %6, align 8
  br label %loop_broadcast_fusion.12.in_bounds-after
}

define void @loop_broadcast_fusion_16(ptr noalias align 128 dereferenceable(3072) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %2 = mul nuw nsw i32 %0, 768
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %loop_broadcast_fusion.16.in_bounds-true, label %loop_broadcast_fusion.16.in_bounds-after

loop_broadcast_fusion.16.in_bounds-after:         ; preds = %loop_broadcast_fusion.16.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.16.in_bounds-true:          ; preds = %entry
  %constant_1689_3 = load i32, ptr @239, align 4
  %7 = getelementptr i32, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds i32, ptr %7, i32 0
  store i32 %constant_1689_3, ptr %8, align 4
  br label %loop_broadcast_fusion.16.in_bounds-after
}

define void @loop_broadcast_fusion_11(ptr noalias align 128 dereferenceable(6144) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %2 = mul nuw nsw i32 %0, 768
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %loop_broadcast_fusion.11.in_bounds-true, label %loop_broadcast_fusion.11.in_bounds-after

loop_broadcast_fusion.11.in_bounds-after:         ; preds = %loop_broadcast_fusion.11.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.11.in_bounds-true:          ; preds = %entry
  %constant_1685_4 = load double, ptr @240, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  store double %constant_1685_4, ptr %8, align 8
  br label %loop_broadcast_fusion.11.in_bounds-after
}

define void @loop_convert_fusion_2(ptr noalias align 128 dereferenceable(3072) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index0, 4
  %8 = icmp ult i32 %linear_index, 768
  br i1 %8, label %loop_convert_fusion.2.in_bounds-true, label %loop_convert_fusion.2.in_bounds-after

loop_convert_fusion.2.in_bounds-after:            ; preds = %loop_convert_fusion.2.in_bounds-true, %entry
  ret void

loop_convert_fusion.2.in_bounds-true:             ; preds = %entry
  %9 = getelementptr i32, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds i32, ptr %9, i32 0
  %11 = load i32, ptr %10, align 4, !invariant.load !297
  %12 = sitofp i32 %11 to double
  %13 = getelementptr double, ptr %arg1, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  store double %12, ptr %14, align 8
  br label %loop_convert_fusion.2.in_bounds-after
}

define void @loop_compare_fusion_2(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_compare_fusion.2.in_bounds-true, label %loop_compare_fusion.2.in_bounds-after

loop_compare_fusion.2.in_bounds-after:            ; preds = %loop_compare_fusion.2.in_bounds-true, %entry
  ret void

loop_compare_fusion.2.in_bounds-true:             ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !297
  %constant_1662_1 = load i64, ptr @241, align 8
  %5 = icmp slt i64 %4, %constant_1662_1
  %6 = zext i1 %5 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.2.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_10(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1417 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_5 = load i64, ptr @243, align 8
  %0 = icmp slt i64 %param_2.1417, %constant_1667_5
  %1 = zext i1 %0 to i8
  %param_2.14171 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_34 = load i64, ptr @244, align 8
  %2 = add i64 %param_2.14171, %constant_1666_34
  %param_2.14172 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14172
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_53 = load i64, ptr @243, align 8
  %9 = icmp sge i64 0, %constant_1667_53
  %10 = select i1 %9, i64 0, i64 %constant_1667_53
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_1667_54 = load i64, ptr @243, align 8
  %13 = icmp sge i64 0, %constant_1667_54
  %14 = select i1 %13, i64 0, i64 %constant_1667_54
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %25, label %dynamic-update-slice.1419.1.in_bounds-true, label %dynamic-update-slice.1419.1.in_bounds-after

dynamic-update-slice.1419.1.in_bounds-after:      ; preds = %dynamic-update-slice.1419.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1419.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1728 = getelementptr inbounds i64, ptr %29, i64 0
  %param_1.17285 = load i64, ptr %param_1.1728, align 8, !invariant.load !297
  %constant_1667_56 = load i64, ptr @243, align 8
  %30 = icmp ne i64 %param_1.17285, %constant_1667_56
  %31 = zext i1 %30 to i8
  %32 = zext i8 %31 to i32
  %constant_1665_3 = load i32, ptr @242, align 4
  %33 = icmp eq i32 %32, %constant_1665_3
  %34 = zext i1 %33 to i8
  %35 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %34, ptr %35, align 1
  br label %dynamic-update-slice.1419.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_11(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1419 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_7 = load i64, ptr @246, align 8
  %0 = icmp slt i64 %param_2.1419, %constant_1667_7
  %1 = zext i1 %0 to i8
  %param_2.14191 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_3 = load i64, ptr @247, align 8
  %2 = add i64 %param_2.14191, %constant_1666_3
  %param_2.14192 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14192
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_73 = load i64, ptr @246, align 8
  %9 = icmp sge i64 0, %constant_1667_73
  %10 = select i1 %9, i64 0, i64 %constant_1667_73
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1418.1.in_bounds-true, label %dynamic-update-slice.1418.1.in_bounds-after

dynamic-update-slice.1418.1.in_bounds-after:      ; preds = %dynamic-update-slice.1418.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1418.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1730 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.17304 = load i64, ptr %param_1.1730, align 8, !invariant.load !297
  %constant_1667_75 = load i64, ptr @246, align 8
  %23 = icmp ne i64 %param_1.17304, %constant_1667_75
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_1665_1 = load i32, ptr @245, align 4
  %26 = icmp eq i32 %25, %constant_1665_1
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.1418.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_13(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1480 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_38 = load i64, ptr @249, align 8
  %0 = icmp slt i64 %param_2.1480, %constant_1667_38
  %1 = zext i1 %0 to i8
  %param_2.14801 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_56 = load i64, ptr @250, align 8
  %2 = add i64 %param_2.14801, %constant_1666_56
  %param_2.14802 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14802
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_383 = load i64, ptr @249, align 8
  %9 = icmp sge i64 0, %constant_1667_383
  %10 = select i1 %9, i64 0, i64 %constant_1667_383
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1415.1.in_bounds-true, label %dynamic-update-slice.1415.1.in_bounds-after

dynamic-update-slice.1415.1.in_bounds-after:      ; preds = %dynamic-update-slice.1415.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1415.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1783 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.17834 = load i64, ptr %param_1.1783, align 8, !invariant.load !297
  %constant_1667_385 = load i64, ptr @249, align 8
  %23 = icmp ne i64 %param_1.17834, %constant_1667_385
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_1671_1 = load i32, ptr @248, align 4
  %26 = icmp eq i32 %25, %constant_1671_1
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.1415.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_56(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %param_1.1786 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_2 = load i64, ptr @253, align 8
  %0 = icmp slt i64 %param_1.1786, %constant_1667_2
  %1 = zext i1 %0 to i8
  %param_1.17861 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_30 = load i64, ptr @252, align 8
  %2 = add i64 %param_1.17861, %constant_1666_30
  %param_1.17862 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17862
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.1394.1.in_bounds-true, label %dynamic-update-slice.1394.1.in_bounds-after

dynamic-update-slice.1394.1.in_bounds-after:      ; preds = %dynamic-update-slice.1394.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1394.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %15 = getelementptr i32, ptr @251, i64 %linear_index
  %constant_1673_1 = getelementptr inbounds i32, ptr %15, i64 0
  %constant_1673_13 = load i32, ptr %constant_1673_1, align 4
  %16 = getelementptr inbounds [192 x i32], ptr %arg0, i64 0, i64 %14
  store i32 %constant_1673_13, ptr %16, align 4
  br label %dynamic-update-slice.1394.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_55(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %param_1.1788 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_57 = load i64, ptr @256, align 8
  %0 = icmp slt i64 %param_1.1788, %constant_1667_57
  %1 = zext i1 %0 to i8
  %param_1.17881 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_26 = load i64, ptr @255, align 8
  %2 = add i64 %param_1.17881, %constant_1666_26
  %param_1.17882 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17882
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.1391.1.in_bounds-true, label %dynamic-update-slice.1391.1.in_bounds-after

dynamic-update-slice.1391.1.in_bounds-after:      ; preds = %dynamic-update-slice.1391.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1391.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %15 = getelementptr double, ptr @254, i64 %linear_index
  %constant_1675_1 = getelementptr inbounds double, ptr %15, i64 0
  %constant_1675_13 = load double, ptr %constant_1675_1, align 8
  %16 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %constant_1675_13, ptr %16, align 8
  br label %dynamic-update-slice.1391.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_14(ptr noalias align 128 dereferenceable(3072) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1463 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_53 = load i64, ptr @257, align 8
  %0 = icmp slt i64 %param_2.1463, %constant_1667_53
  %1 = zext i1 %0 to i8
  %param_2.14631 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_55 = load i64, ptr @258, align 8
  %2 = add i64 %param_2.14631, %constant_1666_55
  %param_2.14632 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14632
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_533 = load i64, ptr @257, align 8
  %9 = icmp sge i64 0, %constant_1667_533
  %10 = select i1 %9, i64 0, i64 %constant_1667_533
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1414.1.in_bounds-true, label %dynamic-update-slice.1414.1.in_bounds-after

dynamic-update-slice.1414.1.in_bounds-after:      ; preds = %dynamic-update-slice.1414.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1414.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1775 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.17754 = load i64, ptr %param_1.1775, align 8, !invariant.load !297
  %constant_1667_535 = load i64, ptr @257, align 8
  %23 = icmp ne i64 %param_1.17754, %constant_1667_535
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %26 = getelementptr inbounds [192 x [4 x i32]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i32 %25, ptr %26, align 4
  br label %dynamic-update-slice.1414.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_44(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1440 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_29 = load i64, ptr @261, align 8
  %0 = icmp slt i64 %param_2.1440, %constant_1667_29
  %1 = zext i1 %0 to i8
  %param_2.14401 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_14 = load i64, ptr @260, align 8
  %2 = add i64 %param_2.14401, %constant_1666_14
  %param_2.14402 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14402
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_293 = load i64, ptr @261, align 8
  %9 = icmp sge i64 0, %constant_1667_293
  %10 = select i1 %9, i64 0, i64 %constant_1667_293
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1381.1.in_bounds-true, label %dynamic-update-slice.1381.1.in_bounds-after

dynamic-update-slice.1381.1.in_bounds-after:      ; preds = %dynamic-update-slice.1381.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1381.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_15 = load double, ptr @259, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1751 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.17514 = load double, ptr %param_1.1751, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.17515 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.17516 = load double, ptr %param_1.17515, align 8, !invariant.load !297
  %multiply.2900.1 = fmul double %param_1.17514, %param_1.17516
  %divide.587.1 = fdiv double %constant_1664_15, %multiply.2900.1
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.587.1, ptr %24, align 8
  br label %dynamic-update-slice.1381.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_6(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %param_1.1750 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_28 = load i64, ptr @264, align 8
  %0 = icmp slt i64 %param_1.1750, %constant_1667_28
  %1 = zext i1 %0 to i8
  %param_1.17501 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_27 = load i64, ptr @263, align 8
  %2 = add i64 %param_1.17501, %constant_1666_27
  %param_1.17502 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17502
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_283 = load i64, ptr @264, align 8
  %9 = icmp sge i64 0, %constant_1667_283
  %10 = select i1 %9, i64 0, i64 %constant_1667_283
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1423.1.in_bounds-true, label %dynamic-update-slice.1423.1.in_bounds-after

dynamic-update-slice.1423.1.in_bounds-after:      ; preds = %dynamic-update-slice.1423.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1423.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1479 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14794 = load double, ptr %param_2.1479, align 8, !invariant.load !297
  %multiply.2893.5 = fmul double %param_2.14794, %param_2.14794
  %constant_1670_3 = load double, ptr @262, align 8
  %multiply.2894.3 = fmul double %multiply.2893.5, %constant_1670_3
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2894.3, ptr %23, align 8
  br label %dynamic-update-slice.1423.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_7(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1476 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_32 = load i64, ptr @267, align 8
  %0 = icmp slt i64 %param_2.1476, %constant_1667_32
  %1 = zext i1 %0 to i8
  %param_2.14761 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_32 = load i64, ptr @266, align 8
  %2 = add i64 %param_2.14761, %constant_1666_32
  %param_2.14762 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14762
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_323 = load i64, ptr @267, align 8
  %9 = icmp sge i64 0, %constant_1667_323
  %10 = select i1 %9, i64 0, i64 %constant_1667_323
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1422.1.in_bounds-true, label %dynamic-update-slice.1422.1.in_bounds-after

dynamic-update-slice.1422.1.in_bounds-after:      ; preds = %dynamic-update-slice.1422.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1422.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1754 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.17544 = load double, ptr %param_1.1754, align 8, !invariant.load !297
  %constant_1669_1 = load double, ptr @265, align 8
  %multiply.2908.3 = fmul double %param_1.17544, %constant_1669_1
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2908.3, ptr %23, align 8
  br label %dynamic-update-slice.1422.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_53(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %param_1.1764 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_42 = load i64, ptr @270, align 8
  %0 = icmp slt i64 %param_1.1764, %constant_1667_42
  %1 = zext i1 %0 to i8
  %param_1.17641 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_2 = load i64, ptr @269, align 8
  %2 = add i64 %param_1.17641, %constant_1666_2
  %param_1.17642 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17642
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_423 = load i64, ptr @270, align 8
  %9 = icmp sge i64 0, %constant_1667_423
  %10 = select i1 %9, i64 0, i64 %constant_1667_423
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1416.1.in_bounds-true, label %dynamic-update-slice.1416.1.in_bounds-after

dynamic-update-slice.1416.1.in_bounds-after:      ; preds = %dynamic-update-slice.1416.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1416.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_1 = load double, ptr @268, align 8
  %22 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %constant_1664_1, ptr %22, align 8
  br label %dynamic-update-slice.1416.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_15(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1465 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_55 = load i64, ptr @272, align 8
  %0 = icmp slt i64 %param_2.1465, %constant_1667_55
  %1 = zext i1 %0 to i8
  %param_2.14651 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_54 = load i64, ptr @271, align 8
  %2 = add i64 %param_2.14651, %constant_1666_54
  %param_2.14652 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14652
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_553 = load i64, ptr @272, align 8
  %9 = icmp sge i64 0, %constant_1667_553
  %10 = select i1 %9, i64 0, i64 %constant_1667_553
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1413.1.in_bounds-true, label %dynamic-update-slice.1413.1.in_bounds-after

dynamic-update-slice.1413.1.in_bounds-after:      ; preds = %dynamic-update-slice.1413.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1413.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.1777 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.17774 = load i64, ptr %param_1.1777, align 8, !invariant.load !297
  %23 = sitofp i64 %param_1.17774 to double
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.1413.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_21(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1464 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_54 = load i64, ptr @274, align 8
  %0 = icmp slt i64 %param_2.1464, %constant_1667_54
  %1 = zext i1 %0 to i8
  %param_2.14641 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_48 = load i64, ptr @273, align 8
  %2 = add i64 %param_2.14641, %constant_1666_48
  %param_2.14642 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14642
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_543 = load i64, ptr @274, align 8
  %9 = icmp sge i64 0, %constant_1667_543
  %10 = select i1 %9, i64 0, i64 %constant_1667_543
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1407.1.in_bounds-true, label %dynamic-update-slice.1407.1.in_bounds-after

dynamic-update-slice.1407.1.in_bounds-after:      ; preds = %dynamic-update-slice.1407.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1407.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1776 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.17764 = load double, ptr %param_1.1776, align 8, !invariant.load !297
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.17764, ptr %23, align 8
  br label %dynamic-update-slice.1407.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_32(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %param_1.1743 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_21 = load i64, ptr @276, align 8
  %0 = icmp slt i64 %param_1.1743, %constant_1667_21
  %1 = zext i1 %0 to i8
  %param_1.17431 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_33 = load i64, ptr @275, align 8
  %2 = add i64 %param_1.17431, %constant_1666_33
  %param_1.17432 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17432
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_213 = load i64, ptr @276, align 8
  %9 = icmp sge i64 0, %constant_1667_213
  %10 = select i1 %9, i64 0, i64 %constant_1667_213
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1396.1.in_bounds-true, label %dynamic-update-slice.1396.1.in_bounds-after

dynamic-update-slice.1396.1.in_bounds-after:      ; preds = %dynamic-update-slice.1396.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1396.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1432 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14324 = load double, ptr %param_2.1432, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.14325 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.14326 = load double, ptr %param_2.14325, align 8, !invariant.load !297
  %multiply.2877.2 = fmul double %param_2.14324, %param_2.14326
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2877.2, ptr %24, align 8
  br label %dynamic-update-slice.1396.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_54(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %param_1.1793 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_11 = load i64, ptr @279, align 8
  %0 = icmp slt i64 %param_1.1793, %constant_1667_11
  %1 = zext i1 %0 to i8
  %param_1.17931 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_31 = load i64, ptr @278, align 8
  %2 = add i64 %param_1.17931, %constant_1666_31
  %param_1.17932 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17932
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_113 = load i64, ptr @279, align 8
  %9 = icmp sge i64 0, %constant_1667_113
  %10 = select i1 %9, i64 0, i64 %constant_1667_113
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1395.1.in_bounds-true, label %dynamic-update-slice.1395.1.in_bounds-after

dynamic-update-slice.1395.1.in_bounds-after:      ; preds = %dynamic-update-slice.1395.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1395.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1677_1 = load double, ptr @277, align 8
  %22 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %constant_1677_1, ptr %22, align 8
  br label %dynamic-update-slice.1395.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_50(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1427 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_16 = load i64, ptr @281, align 8
  %0 = icmp slt i64 %param_2.1427, %constant_1667_16
  %1 = zext i1 %0 to i8
  %param_2.14271 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_7 = load i64, ptr @280, align 8
  %2 = add i64 %param_2.14271, %constant_1666_7
  %param_2.14272 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14272
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_163 = load i64, ptr @281, align 8
  %9 = icmp sge i64 0, %constant_1667_163
  %10 = select i1 %9, i64 0, i64 %constant_1667_163
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1375.1.in_bounds-true, label %dynamic-update-slice.1375.1.in_bounds-after

dynamic-update-slice.1375.1.in_bounds-after:      ; preds = %dynamic-update-slice.1375.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1375.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1738 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.17384 = load double, ptr %param_1.1738, align 8, !invariant.load !297
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.17384, ptr %23, align 8
  br label %dynamic-update-slice.1375.1.in_bounds-after
}

define void @loop_add_divide_exponential_select_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8, ptr noalias align 128 dereferenceable(32) %arg9, ptr noalias align 128 dereferenceable(32) %arg10, ptr noalias align 128 dereferenceable(6144) %arg11, ptr noalias align 128 dereferenceable(8) %arg12, ptr noalias align 128 dereferenceable(32) %arg13, ptr noalias align 128 dereferenceable(32) %arg14, ptr noalias align 128 dereferenceable(32) %arg15, ptr noalias align 128 dereferenceable(32) %arg16, ptr noalias align 128 dereferenceable(32) %arg17, ptr noalias align 128 dereferenceable(32) %arg18, ptr noalias align 128 dereferenceable(32) %arg19, ptr noalias align 128 dereferenceable(32) %arg20, ptr noalias align 128 dereferenceable(32) %arg21, ptr noalias align 128 dereferenceable(32) %arg22, ptr noalias align 128 dereferenceable(32) %arg23, ptr noalias align 128 dereferenceable(32) %arg24) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_add_divide_exponential_select_fusion.in_bounds-true, label %loop_add_divide_exponential_select_fusion.in_bounds-after

loop_add_divide_exponential_select_fusion.in_bounds-after: ; preds = %loop_add_divide_exponential_select_fusion.in_bounds-true, %entry
  ret void

loop_add_divide_exponential_select_fusion.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg2, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = getelementptr double, ptr %arg8, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !297
  %multiply.2873.3.clone.1 = fmul double %7, %10
  %11 = getelementptr double, ptr %arg1, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !297
  %add.3802.3.clone.1 = fadd double %multiply.2873.3.clone.1, %13
  %14 = getelementptr double, ptr %arg9, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !297
  %constant_1664_9 = load double, ptr @282, align 8
  %17 = fneg double %add.3802.3.clone.1
  %18 = call double @__nv_exp(double %17)
  %add.3804.1.clone.1 = fadd double %18, %constant_1664_9
  %divide.575.1.clone.1 = fdiv double %constant_1664_9, %add.3804.1.clone.1
  %subtract.229.25.clone.1 = fsub double %constant_1664_9, %divide.575.1.clone.1
  %multiply.2874.21.clone.1 = fmul double %divide.575.1.clone.1, %subtract.229.25.clone.1
  %multiply.2875.9.clone.1 = fmul double %16, %multiply.2874.21.clone.1
  %19 = getelementptr double, ptr %arg10, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  %21 = load double, ptr %20, align 8, !invariant.load !297
  %divide.576.5.clone.1 = fdiv double %constant_1664_9, %21
  %22 = getelementptr double, ptr %arg13, i32 %linear_index
  %23 = getelementptr inbounds double, ptr %22, i32 0
  %24 = load double, ptr %23, align 8, !invariant.load !297
  %25 = getelementptr double, ptr %arg14, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  %27 = load double, ptr %26, align 8, !invariant.load !297
  %28 = getelementptr double, ptr %arg0, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  %30 = load double, ptr %29, align 8
  %multiply.2876.5.clone.1 = fmul double %27, %30
  %add.3805.3.clone.1 = fadd double %24, %multiply.2876.5.clone.1
  %31 = call double @__nv_exp(double %add.3805.3.clone.1)
  %constant_1668_20 = load double, ptr @283, align 8
  %compare.625.43.clone.1 = fcmp ogt double %31, %constant_1668_20
  %32 = zext i1 %compare.625.43.clone.1 to i8
  %33 = getelementptr double, ptr %arg4, i32 %linear_index
  %34 = getelementptr inbounds double, ptr %33, i32 0
  %35 = load double, ptr %34, align 8, !invariant.load !297
  %36 = trunc i8 %32 to i1
  %37 = select i1 %36, double %31, double %35
  %add.3806.5.clone.1 = fadd double %divide.576.5.clone.1, %37
  %divide.577.1.clone.1 = fdiv double %constant_1664_9, %add.3806.5.clone.1
  %38 = getelementptr double, ptr %arg9, i32 %linear_index
  %39 = getelementptr inbounds double, ptr %38, i32 0
  %40 = load double, ptr %39, align 8, !invariant.load !297
  %41 = getelementptr double, ptr %arg9, i32 %linear_index
  %42 = getelementptr inbounds double, ptr %41, i32 0
  %43 = load double, ptr %42, align 8, !invariant.load !297
  %multiply.2877.10.clone.1 = fmul double %40, %43
  %multiply.2878.11.clone.1 = fmul double %multiply.2877.10.clone.1, %multiply.2874.21.clone.1
  %add.3807.9.clone.1 = fadd double %divide.577.1.clone.1, %multiply.2878.11.clone.1
  %compare.626.19.clone.1 = fcmp ogt double %add.3807.9.clone.1, %constant_1668_20
  %44 = zext i1 %compare.626.19.clone.1 to i8
  %constant_1676_4_clone_1 = load double, ptr @286, align 8
  %45 = trunc i8 %44 to i1
  %46 = select i1 %45, double %add.3807.9.clone.1, double %constant_1676_4_clone_1
  %divide.578.5.clone.1 = fdiv double %multiply.2875.9.clone.1, %46
  %47 = load i64, ptr %arg12, align 8, !invariant.load !297
  %constant_1667_1_clone_1 = load i64, ptr @284, align 8
  %48 = icmp slt i64 %47, %constant_1667_1_clone_1
  %49 = zext i1 %48 to i8
  %50 = load i64, ptr %arg12, align 8, !invariant.load !297
  %constant_1666_4_clone_1 = load i64, ptr @285, align 8
  %51 = add i64 %50, %constant_1666_4_clone_1
  %52 = load i64, ptr %arg12, align 8, !invariant.load !297
  %53 = trunc i8 %49 to i1
  %54 = select i1 %53, i64 %51, i64 %52
  %55 = trunc i64 %54 to i32
  %56 = icmp sge i32 0, %55
  %57 = select i1 %56, i32 0, i32 %55
  %58 = icmp sle i32 191, %57
  %dynamic-slice.1255.9.clone.1.start_idx0 = select i1 %58, i32 191, i32 %57
  %constant_1667_1_clone_11 = load i64, ptr @284, align 8
  %59 = trunc i64 %constant_1667_1_clone_11 to i32
  %60 = icmp sge i32 0, %59
  %61 = select i1 %60, i32 0, i32 %59
  %62 = icmp sle i32 0, %61
  %dynamic-slice.1255.9.clone.1.start_idx1 = select i1 %62, i32 0, i32 %61
  %constant_1667_1_clone_12 = load i64, ptr @284, align 8
  %63 = trunc i64 %constant_1667_1_clone_12 to i32
  %64 = icmp sge i32 0, %63
  %65 = select i1 %64, i32 0, i32 %63
  %66 = icmp sle i32 0, %65
  %dynamic-slice.1255.9.clone.1.start_idx2 = select i1 %66, i32 0, i32 %65
  %67 = add i32 %dynamic-slice.1255.9.clone.1.start_idx0, 0
  %68 = add i32 %dynamic-slice.1255.9.clone.1.start_idx1, %3
  %69 = add i32 %dynamic-slice.1255.9.clone.1.start_idx2, 0
  %70 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg11, i32 0, i32 %67, i32 %68, i32 0
  %71 = load double, ptr %70, align 8, !invariant.load !297
  %subtract.230.9.clone.1 = fsub double %71, %divide.575.1.clone.1
  %divide.579.5.clone.1 = fdiv double %subtract.230.9.clone.1, %multiply.2874.21.clone.1
  %multiply.2879.1.clone.1 = fmul double %divide.578.5.clone.1, %divide.579.5.clone.1
  %add.3810.1.clone.1 = fadd double %add.3802.3.clone.1, %multiply.2879.1.clone.1
  %72 = call double @llvm.fabs.f64(double %add.3810.1.clone.1)
  %73 = fcmp one double %72, 0x7FF0000000000000
  %74 = zext i1 %73 to i8
  %75 = call double @llvm.fabs.f64(double %add.3810.1.clone.1)
  %constant_1672_4 = load double, ptr @287, align 8
  %compare.628.7 = fcmp olt double %75, %constant_1672_4
  %76 = zext i1 %compare.628.7 to i8
  %77 = and i8 %74, %76
  %78 = getelementptr double, ptr %arg2, i32 %linear_index
  %79 = getelementptr inbounds double, ptr %78, i32 0
  %80 = load double, ptr %79, align 8, !invariant.load !297
  %81 = getelementptr double, ptr %arg0, i32 %linear_index
  %82 = getelementptr inbounds double, ptr %81, i32 0
  %83 = load double, ptr %82, align 8
  %multiply.2880.3 = fmul double %80, %83
  %84 = getelementptr double, ptr %arg1, i32 %linear_index
  %85 = getelementptr inbounds double, ptr %84, i32 0
  %86 = load double, ptr %85, align 8, !invariant.load !297
  %add.3811.3 = fadd double %multiply.2880.3, %86
  %87 = getelementptr double, ptr %arg5, i32 %linear_index
  %88 = getelementptr inbounds double, ptr %87, i32 0
  %89 = load double, ptr %88, align 8, !invariant.load !297
  %multiply.2881.13 = fmul double %37, %divide.577.1.clone.1
  %multiply.2882.5 = fmul double %89, %multiply.2881.13
  %multiply.2883.1.clone.1 = fmul double %add.3806.5.clone.1, %46
  %divide.580.1.clone.1 = fdiv double %constant_1664_9, %multiply.2883.1.clone.1
  %subtract.231.2.clone.1 = fsub double %add.3810.1.clone.1, %add.3802.3.clone.1
  %multiply.2884.2.clone.1 = fmul double %subtract.231.2.clone.1, %subtract.231.2.clone.1
  %multiply.2885.1.clone.1 = fmul double %divide.577.1.clone.1, %multiply.2884.2.clone.1
  %add.3812.1.clone.1 = fadd double %divide.580.1.clone.1, %multiply.2885.1.clone.1
  %constant_1674_1_clone_1 = load double, ptr @288, align 8
  %add.3814.1.clone.1 = fadd double %add.3812.1.clone.1, %constant_1674_1_clone_1
  %multiply.2886.2 = fmul double %multiply.2882.5, %add.3814.1.clone.1
  %90 = getelementptr double, ptr %arg6, i32 %linear_index
  %91 = getelementptr inbounds double, ptr %90, i32 0
  %92 = load double, ptr %91, align 8
  %divide.581.1.clone.1 = fdiv double %constant_1664_9, %92
  %93 = getelementptr double, ptr %arg7, i32 %linear_index
  %94 = getelementptr inbounds double, ptr %93, i32 0
  %95 = load double, ptr %94, align 8, !invariant.load !297
  %96 = call double @__nv_exp(double %95)
  %compare.629.11.clone.1 = fcmp ogt double %96, %constant_1668_20
  %97 = zext i1 %compare.629.11.clone.1 to i8
  %98 = getelementptr double, ptr %arg4, i32 %linear_index
  %99 = getelementptr inbounds double, ptr %98, i32 0
  %100 = load double, ptr %99, align 8, !invariant.load !297
  %101 = trunc i8 %97 to i1
  %102 = select i1 %101, double %96, double %100
  %add.3815.5.clone.1 = fadd double %divide.581.1.clone.1, %102
  %divide.582.1.clone.1 = fdiv double %constant_1664_9, %add.3815.5.clone.1
  %constant_1669_2 = load double, ptr @291, align 8
  %multiply.2887.9 = fmul double %divide.582.1.clone.1, %constant_1669_2
  %divide.583.5 = fdiv double %constant_1664_9, %multiply.2887.9
  %multiply.2888.1 = fmul double %multiply.2886.2, %divide.583.5
  %103 = getelementptr i64, ptr %arg3, i32 %linear_index
  %104 = getelementptr inbounds i64, ptr %103, i32 0
  %105 = load i64, ptr %104, align 8, !invariant.load !297
  %106 = sitofp i64 %105 to double
  %multiply.2889.1 = fmul double %multiply.2888.1, %106
  %add.3816.1 = fadd double %add.3811.3, %multiply.2889.1
  %107 = getelementptr double, ptr %arg0, i32 %linear_index
  %108 = getelementptr inbounds double, ptr %107, i32 0
  %109 = load double, ptr %108, align 8
  %110 = trunc i8 %77 to i1
  %111 = select i1 %110, double %add.3816.1, double %109
  %112 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } undef, double %111, 0
  %113 = getelementptr i64, ptr %arg3, i32 %linear_index
  %114 = getelementptr inbounds i64, ptr %113, i32 0
  %115 = load i64, ptr %114, align 8, !invariant.load !297
  %constant_1667_1_clone_13 = load i64, ptr @284, align 8
  %116 = icmp ne i64 %115, %constant_1667_1_clone_13
  %117 = zext i1 %116 to i8
  %118 = zext i8 %117 to i32
  %constant_1665_2_clone_1 = load i32, ptr @290, align 4
  %119 = icmp slt i32 %118, %constant_1665_2_clone_1
  %120 = zext i1 %119 to i8
  %add.3817.2.clone.1 = fadd double %divide.581.1.clone.1, %96
  %divide.584.1.clone.1 = fdiv double %constant_1664_9, %add.3817.2.clone.1
  %multiply.2890.4.clone.1 = fmul double %multiply.2882.5, %multiply.2882.5
  %constant_1670_4_clone_1 = load double, ptr @289, align 8
  %multiply.2891.11.clone.1 = fmul double %multiply.2890.4.clone.1, %constant_1670_4_clone_1
  %multiply.2892.5.clone.1 = fmul double %multiply.2890.4.clone.1, %add.3814.1.clone.1
  %add.3819.9.clone.1 = fadd double %multiply.2891.11.clone.1, %multiply.2892.5.clone.1
  %multiply.2893.11.clone.1 = fmul double %89, %89
  %multiply.2894.9.clone.1 = fmul double %multiply.2893.11.clone.1, %constant_1670_4_clone_1
  %multiply.2895.4.clone.1 = fmul double %multiply.2894.9.clone.1, %multiply.2881.13
  %multiply.2896.5.clone.1 = fmul double %multiply.2895.4.clone.1, %add.3814.1.clone.1
  %subtract.232.7.clone.1 = fsub double %add.3819.9.clone.1, %multiply.2896.5.clone.1
  %multiply.2897.5.clone.1 = fmul double %subtract.232.7.clone.1, %106
  %add.3820.3.clone.1 = fadd double %divide.582.1.clone.1, %multiply.2897.5.clone.1
  %compare.632.5.clone.1 = fcmp ogt double %add.3820.3.clone.1, %constant_1668_20
  %121 = zext i1 %compare.632.5.clone.1 to i8
  %122 = getelementptr double, ptr %arg4, i32 %linear_index
  %123 = getelementptr inbounds double, ptr %122, i32 0
  %124 = load double, ptr %123, align 8, !invariant.load !297
  %125 = trunc i8 %121 to i1
  %126 = select i1 %125, double %add.3820.3.clone.1, double %124
  %127 = trunc i8 %120 to i1
  %128 = select i1 %127, double %divide.584.1.clone.1, double %126
  %129 = getelementptr double, ptr %arg6, i32 %linear_index
  %130 = getelementptr inbounds double, ptr %129, i32 0
  %131 = load double, ptr %130, align 8
  %132 = trunc i8 %77 to i1
  %133 = select i1 %132, double %128, double %131
  %134 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %112, double %133, 1
  %135 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %134, double %divide.582.1.clone.1, 2
  %136 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %135, double %96, 3
  %137 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %136, double %divide.581.1.clone.1, 4
  %138 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %137, double %add.3814.1.clone.1, 5
  %139 = getelementptr double, ptr %arg8, i32 %linear_index
  %140 = getelementptr inbounds double, ptr %139, i32 0
  %141 = load double, ptr %140, align 8, !invariant.load !297
  %142 = trunc i8 %77 to i1
  %143 = select i1 %142, double %add.3810.1.clone.1, double %141
  %144 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %138, double %143, 6
  %145 = getelementptr double, ptr %arg10, i32 %linear_index
  %146 = getelementptr inbounds double, ptr %145, i32 0
  %147 = load double, ptr %146, align 8, !invariant.load !297
  %148 = trunc i8 %77 to i1
  %149 = select i1 %148, double %46, double %147
  %150 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %144, double %149, 7
  %151 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %150, double %add.3810.1.clone.1, 8
  %152 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %151, double %divide.577.1.clone.1, 9
  %153 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %152, double %31, 10
  %154 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double } %153, double %divide.575.1.clone.1, 11
  %155 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 0
  %156 = getelementptr double, ptr %arg0, i32 %linear_index
  %157 = getelementptr inbounds double, ptr %156, i32 0
  store double %155, ptr %157, align 8
  %158 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 1
  %159 = getelementptr double, ptr %arg6, i32 %linear_index
  %160 = getelementptr inbounds double, ptr %159, i32 0
  store double %158, ptr %160, align 8
  %161 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 2
  %162 = getelementptr double, ptr %arg15, i32 %linear_index
  %163 = getelementptr inbounds double, ptr %162, i32 0
  store double %161, ptr %163, align 8
  %164 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 3
  %165 = getelementptr double, ptr %arg16, i32 %linear_index
  %166 = getelementptr inbounds double, ptr %165, i32 0
  store double %164, ptr %166, align 8
  %167 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 4
  %168 = getelementptr double, ptr %arg17, i32 %linear_index
  %169 = getelementptr inbounds double, ptr %168, i32 0
  store double %167, ptr %169, align 8
  %170 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 5
  %171 = getelementptr double, ptr %arg18, i32 %linear_index
  %172 = getelementptr inbounds double, ptr %171, i32 0
  store double %170, ptr %172, align 8
  %173 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 6
  %174 = getelementptr double, ptr %arg19, i32 %linear_index
  %175 = getelementptr inbounds double, ptr %174, i32 0
  store double %173, ptr %175, align 8
  %176 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 7
  %177 = getelementptr double, ptr %arg20, i32 %linear_index
  %178 = getelementptr inbounds double, ptr %177, i32 0
  store double %176, ptr %178, align 8
  %179 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 8
  %180 = getelementptr double, ptr %arg21, i32 %linear_index
  %181 = getelementptr inbounds double, ptr %180, i32 0
  store double %179, ptr %181, align 8
  %182 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 9
  %183 = getelementptr double, ptr %arg22, i32 %linear_index
  %184 = getelementptr inbounds double, ptr %183, i32 0
  store double %182, ptr %184, align 8
  %185 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 10
  %186 = getelementptr double, ptr %arg23, i32 %linear_index
  %187 = getelementptr inbounds double, ptr %186, i32 0
  store double %185, ptr %187, align 8
  %188 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double } %154, 11
  %189 = getelementptr double, ptr %arg24, i32 %linear_index
  %190 = getelementptr inbounds double, ptr %189, i32 0
  store double %188, ptr %190, align 8
  br label %loop_add_divide_exponential_select_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_4(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8) {
entry:
  %param_1.1779 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_17 = load i64, ptr @295, align 8
  %0 = icmp slt i64 %param_1.1779, %constant_1667_17
  %1 = zext i1 %0 to i8
  %param_1.17791 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_15 = load i64, ptr @294, align 8
  %2 = add i64 %param_1.17791, %constant_1666_15
  %param_1.17792 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17792
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_173 = load i64, ptr @295, align 8
  %9 = icmp sge i64 0, %constant_1667_173
  %10 = select i1 %9, i64 0, i64 %constant_1667_173
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1425.1.in_bounds-true, label %dynamic-update-slice.1425.1.in_bounds-after

dynamic-update-slice.1425.1.in_bounds-after:      ; preds = %dynamic-update-slice.1425.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1425.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1469 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14694 = load double, ptr %param_2.1469, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.330 = getelementptr inbounds double, ptr %23, i64 0
  %param_8.3305 = load double, ptr %param_8.330, align 8, !invariant.load !297
  %24 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.531 = getelementptr inbounds double, ptr %24, i64 0
  %param_6.5316 = load double, ptr %param_6.531, align 8, !invariant.load !297
  %constant_1668_5 = load double, ptr @292, align 8
  %compare.625.39 = fcmp ogt double %param_6.5316, %constant_1668_5
  %25 = zext i1 %compare.625.39 to i8
  %26 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.5317 = getelementptr inbounds double, ptr %26, i64 0
  %param_6.5318 = load double, ptr %param_6.5317, align 8, !invariant.load !297
  %27 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.396 = getelementptr inbounds double, ptr %27, i64 0
  %param_7.3969 = load double, ptr %param_7.396, align 8, !invariant.load !297
  %28 = trunc i8 %25 to i1
  %29 = select i1 %28, double %param_6.5318, double %param_7.3969
  %30 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.731 = getelementptr inbounds double, ptr %30, i64 0
  %param_5.73110 = load double, ptr %param_5.731, align 8, !invariant.load !297
  %multiply.2881.29 = fmul double %29, %param_5.73110
  %multiply.2882.17 = fmul double %param_8.3305, %multiply.2881.29
  %multiply.2890.6 = fmul double %multiply.2882.17, %multiply.2882.17
  %constant_1670_2 = load double, ptr @293, align 8
  %multiply.2891.13 = fmul double %multiply.2890.6, %constant_1670_2
  %31 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.929 = getelementptr inbounds double, ptr %31, i64 0
  %param_4.92911 = load double, ptr %param_4.929, align 8, !invariant.load !297
  %multiply.2892.7 = fmul double %multiply.2890.6, %param_4.92911
  %add.3819.11 = fadd double %multiply.2891.13, %multiply.2892.7
  %multiply.2893.13 = fmul double %param_8.3305, %param_8.3305
  %multiply.2894.11 = fmul double %multiply.2893.13, %constant_1670_2
  %multiply.2895.6 = fmul double %multiply.2894.11, %multiply.2881.29
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.92912 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.92913 = load double, ptr %param_4.92912, align 8, !invariant.load !297
  %multiply.2896.7 = fmul double %multiply.2895.6, %param_4.92913
  %subtract.232.9 = fsub double %add.3819.11, %multiply.2896.7
  %33 = getelementptr i64, ptr %arg3, i64 %linear_index
  %param_3.1180 = getelementptr inbounds i64, ptr %33, i64 0
  %param_3.118014 = load i64, ptr %param_3.1180, align 8, !invariant.load !297
  %34 = sitofp i64 %param_3.118014 to double
  %multiply.2897.7 = fmul double %subtract.232.9, %34
  %add.3820.5 = fadd double %param_2.14694, %multiply.2897.7
  %compare.632.3 = fcmp ogt double %add.3820.5, %constant_1668_5
  %35 = zext i1 %compare.632.3 to i8
  %36 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %35, ptr %36, align 1
  br label %dynamic-update-slice.1425.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_2(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1481 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_10 = load i64, ptr @298, align 8
  %0 = icmp slt i64 %param_2.1481, %constant_1667_10
  %1 = zext i1 %0 to i8
  %param_2.14811 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_12 = load i64, ptr @297, align 8
  %2 = add i64 %param_2.14811, %constant_1666_12
  %param_2.14812 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14812
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_103 = load i64, ptr @298, align 8
  %9 = icmp sge i64 0, %constant_1667_103
  %10 = select i1 %9, i64 0, i64 %constant_1667_103
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_1667_104 = load i64, ptr @298, align 8
  %13 = icmp sge i64 0, %constant_1667_104
  %14 = select i1 %13, i64 0, i64 %constant_1667_104
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %25, label %dynamic-update-slice.1427.1.in_bounds-true, label %dynamic-update-slice.1427.1.in_bounds-after

dynamic-update-slice.1427.1.in_bounds-after:      ; preds = %dynamic-update-slice.1427.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1427.1.in_bounds-true:       ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1784 = getelementptr inbounds double, ptr %29, i64 0
  %param_1.17845 = load double, ptr %param_1.1784, align 8, !invariant.load !297
  %30 = call double @llvm.fabs.f64(double %param_1.17845)
  %31 = fcmp one double %30, 0x7FF0000000000000
  %32 = zext i1 %31 to i8
  %33 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.17846 = getelementptr inbounds double, ptr %33, i64 0
  %param_1.17847 = load double, ptr %param_1.17846, align 8, !invariant.load !297
  %34 = call double @llvm.fabs.f64(double %param_1.17847)
  %constant_1672_1 = load double, ptr @296, align 8
  %compare.628.13 = fcmp olt double %34, %constant_1672_1
  %35 = zext i1 %compare.628.13 to i8
  %36 = and i8 %32, %35
  %37 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %36, ptr %37, align 1
  br label %dynamic-update-slice.1427.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_3(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1483 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_13 = load i64, ptr @301, align 8
  %0 = icmp slt i64 %param_2.1483, %constant_1667_13
  %1 = zext i1 %0 to i8
  %param_2.14831 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_1 = load i64, ptr @300, align 8
  %2 = add i64 %param_2.14831, %constant_1666_1
  %param_2.14832 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14832
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_133 = load i64, ptr @301, align 8
  %9 = icmp sge i64 0, %constant_1667_133
  %10 = select i1 %9, i64 0, i64 %constant_1667_133
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1426.1.in_bounds-true, label %dynamic-update-slice.1426.1.in_bounds-after

dynamic-update-slice.1426.1.in_bounds-after:      ; preds = %dynamic-update-slice.1426.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1426.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1785 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.17854 = load double, ptr %param_1.1785, align 8, !invariant.load !297
  %23 = call double @llvm.fabs.f64(double %param_1.17854)
  %24 = fcmp one double %23, 0x7FF0000000000000
  %25 = zext i1 %24 to i8
  %26 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.17855 = getelementptr inbounds double, ptr %26, i64 0
  %param_1.17856 = load double, ptr %param_1.17855, align 8, !invariant.load !297
  %27 = call double @llvm.fabs.f64(double %param_1.17856)
  %constant_1672_6 = load double, ptr @299, align 8
  %compare.628.11 = fcmp olt double %27, %constant_1672_6
  %28 = zext i1 %compare.628.11 to i8
  %29 = and i8 %25, %28
  %30 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %29, ptr %30, align 1
  br label %dynamic-update-slice.1426.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_48(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.1470 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1667_20 = load i64, ptr @304, align 8
  %0 = icmp slt i64 %param_2.1470, %constant_1667_20
  %1 = zext i1 %0 to i8
  %param_2.14701 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1666_9 = load i64, ptr @303, align 8
  %2 = add i64 %param_2.14701, %constant_1666_9
  %param_2.14702 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.14702
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_203 = load i64, ptr @304, align 8
  %9 = icmp sge i64 0, %constant_1667_203
  %10 = select i1 %9, i64 0, i64 %constant_1667_203
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1377.1.in_bounds-true, label %dynamic-update-slice.1377.1.in_bounds-after

dynamic-update-slice.1377.1.in_bounds-after:      ; preds = %dynamic-update-slice.1377.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1377.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1742 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.17424 = load double, ptr %param_1.1742, align 8, !invariant.load !297
  %constant_1668_6 = load double, ptr @302, align 8
  %compare.629.3 = fcmp ogt double %param_1.17424, %constant_1668_6
  %23 = zext i1 %compare.629.3 to i8
  %24 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %23, ptr %24, align 1
  br label %dynamic-update-slice.1377.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_31(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4) {
entry:
  %param_1.1780 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_52 = load i64, ptr @308, align 8
  %0 = icmp slt i64 %param_1.1780, %constant_1667_52
  %1 = zext i1 %0 to i8
  %param_1.17801 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_36 = load i64, ptr @307, align 8
  %2 = add i64 %param_1.17801, %constant_1666_36
  %param_1.17802 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17802
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_523 = load i64, ptr @308, align 8
  %9 = icmp sge i64 0, %constant_1667_523
  %10 = select i1 %9, i64 0, i64 %constant_1667_523
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1397.1.in_bounds-true, label %dynamic-update-slice.1397.1.in_bounds-after

dynamic-update-slice.1397.1.in_bounds-after:      ; preds = %dynamic-update-slice.1397.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1397.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1471 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14714 = load double, ptr %param_2.1471, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.930 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.9305 = load double, ptr %param_4.930, align 8, !invariant.load !297
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.9306 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.9307 = load double, ptr %param_4.9306, align 8, !invariant.load !297
  %multiply.2877.6 = fmul double %param_4.9305, %param_4.9307
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1181 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11818 = load double, ptr %param_3.1181, align 8, !invariant.load !297
  %constant_1664_7 = load double, ptr @306, align 8
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11819 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.118110 = load double, ptr %param_3.11819, align 8, !invariant.load !297
  %subtract.229.29 = fsub double %constant_1664_7, %param_3.118110
  %multiply.2874.25 = fmul double %param_3.11818, %subtract.229.29
  %multiply.2878.7 = fmul double %multiply.2877.6, %multiply.2874.25
  %add.3807.5 = fadd double %param_2.14714, %multiply.2878.7
  %constant_1668_8 = load double, ptr @305, align 8
  %compare.626.3 = fcmp ogt double %add.3807.5, %constant_1668_8
  %27 = zext i1 %compare.626.3 to i8
  %28 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.1397.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_38(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4) {
entry:
  %param_1.1767 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_45 = load i64, ptr @312, align 8
  %0 = icmp slt i64 %param_1.1767, %constant_1667_45
  %1 = zext i1 %0 to i8
  %param_1.17671 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_22 = load i64, ptr @311, align 8
  %2 = add i64 %param_1.17671, %constant_1666_22
  %param_1.17672 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17672
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_453 = load i64, ptr @312, align 8
  %9 = icmp sge i64 0, %constant_1667_453
  %10 = select i1 %9, i64 0, i64 %constant_1667_453
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1387.1.in_bounds-true, label %dynamic-update-slice.1387.1.in_bounds-after

dynamic-update-slice.1387.1.in_bounds-after:      ; preds = %dynamic-update-slice.1387.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1387.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_16 = load double, ptr @310, align 8
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.931 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.9314 = load double, ptr %param_4.931, align 8, !invariant.load !297
  %divide.576.7 = fdiv double %constant_1664_16, %param_4.9314
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1455 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.14555 = load double, ptr %param_2.1455, align 8, !invariant.load !297
  %constant_1668_11 = load double, ptr @309, align 8
  %compare.625.45 = fcmp ogt double %param_2.14555, %constant_1668_11
  %24 = zext i1 %compare.625.45 to i8
  %25 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.14556 = getelementptr inbounds double, ptr %25, i64 0
  %param_2.14557 = load double, ptr %param_2.14556, align 8, !invariant.load !297
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1170 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.11708 = load double, ptr %param_3.1170, align 8, !invariant.load !297
  %27 = trunc i8 %24 to i1
  %28 = select i1 %27, double %param_2.14557, double %param_3.11708
  %add.3806.7 = fadd double %divide.576.7, %28
  %multiply.2901.1 = fmul double %add.3806.7, %add.3806.7
  %divide.588.1 = fdiv double %constant_1664_16, %multiply.2901.1
  %29 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.588.1, ptr %29, align 8
  br label %dynamic-update-slice.1387.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_45(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4) {
entry:
  %param_1.1749 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_27 = load i64, ptr @316, align 8
  %0 = icmp slt i64 %param_1.1749, %constant_1667_27
  %1 = zext i1 %0 to i8
  %param_1.17491 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_13 = load i64, ptr @315, align 8
  %2 = add i64 %param_1.17491, %constant_1666_13
  %param_1.17492 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17492
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_273 = load i64, ptr @316, align 8
  %9 = icmp sge i64 0, %constant_1667_273
  %10 = select i1 %9, i64 0, i64 %constant_1667_273
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1380.1.in_bounds-true, label %dynamic-update-slice.1380.1.in_bounds-after

dynamic-update-slice.1380.1.in_bounds-after:      ; preds = %dynamic-update-slice.1380.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1380.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_14 = load double, ptr @314, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1438 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14384 = load double, ptr %param_2.1438, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1158 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11585 = load double, ptr %param_3.1158, align 8, !invariant.load !297
  %constant_1668_16 = load double, ptr @313, align 8
  %compare.629.9 = fcmp ogt double %param_3.11585, %constant_1668_16
  %24 = zext i1 %compare.629.9 to i8
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11586 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11587 = load double, ptr %param_3.11586, align 8, !invariant.load !297
  %26 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.916 = getelementptr inbounds double, ptr %26, i64 0
  %param_4.9168 = load double, ptr %param_4.916, align 8, !invariant.load !297
  %27 = trunc i8 %24 to i1
  %28 = select i1 %27, double %param_3.11587, double %param_4.9168
  %add.3815.3 = fadd double %param_2.14384, %28
  %multiply.2899.1 = fmul double %add.3815.3, %add.3815.3
  %divide.586.1 = fdiv double %constant_1664_14, %multiply.2899.1
  %29 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.586.1, ptr %29, align 8
  br label %dynamic-update-slice.1380.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_12(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3) {
entry:
  %param_1.1762 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_40 = load i64, ptr @319, align 8
  %0 = icmp slt i64 %param_1.1762, %constant_1667_40
  %1 = zext i1 %0 to i8
  %param_1.17621 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_35 = load i64, ptr @318, align 8
  %2 = add i64 %param_1.17621, %constant_1666_35
  %param_1.17622 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17622
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_403 = load i64, ptr @319, align 8
  %9 = icmp sge i64 0, %constant_1667_403
  %10 = select i1 %9, i64 0, i64 %constant_1667_403
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1417.1.in_bounds-true, label %dynamic-update-slice.1417.1.in_bounds-after

dynamic-update-slice.1417.1.in_bounds-after:      ; preds = %dynamic-update-slice.1417.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1417.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_4 = load double, ptr @317, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1451 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14514 = load double, ptr %param_2.1451, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1167 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11675 = load double, ptr %param_3.1167, align 8, !invariant.load !297
  %add.3817.1 = fadd double %param_2.14514, %param_3.11675
  %multiply.2906.1 = fmul double %add.3817.1, %add.3817.1
  %divide.592.1 = fdiv double %constant_1664_4, %multiply.2906.1
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.592.1, ptr %24, align 8
  br label %dynamic-update-slice.1417.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_17(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6) {
entry:
  %param_1.1729 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_6 = load i64, ptr @322, align 8
  %0 = icmp slt i64 %param_1.1729, %constant_1667_6
  %1 = zext i1 %0 to i8
  %param_1.17291 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_52 = load i64, ptr @321, align 8
  %2 = add i64 %param_1.17291, %constant_1666_52
  %param_1.17292 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17292
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_63 = load i64, ptr @322, align 8
  %9 = icmp sge i64 0, %constant_1667_63
  %10 = select i1 %9, i64 0, i64 %constant_1667_63
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1411.1.in_bounds-true, label %dynamic-update-slice.1411.1.in_bounds-after

dynamic-update-slice.1411.1.in_bounds-after:      ; preds = %dynamic-update-slice.1411.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1411.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.535 = getelementptr inbounds double, ptr %22, i64 0
  %param_6.5354 = load double, ptr %param_6.535, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.911 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.9115 = load double, ptr %param_4.911, align 8, !invariant.load !297
  %constant_1668_18 = load double, ptr @320, align 8
  %compare.625.31 = fcmp ogt double %param_4.9115, %constant_1668_18
  %24 = zext i1 %compare.625.31 to i8
  %25 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.9116 = getelementptr inbounds double, ptr %25, i64 0
  %param_4.9117 = load double, ptr %param_4.9116, align 8, !invariant.load !297
  %26 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.714 = getelementptr inbounds double, ptr %26, i64 0
  %param_5.7148 = load double, ptr %param_5.714, align 8, !invariant.load !297
  %27 = trunc i8 %24 to i1
  %28 = select i1 %27, double %param_4.9117, double %param_5.7148
  %29 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1147 = getelementptr inbounds double, ptr %29, i64 0
  %param_3.11479 = load double, ptr %param_3.1147, align 8, !invariant.load !297
  %multiply.2881.21 = fmul double %28, %param_3.11479
  %multiply.2882.13 = fmul double %param_6.5354, %multiply.2881.21
  %30 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1418 = getelementptr inbounds double, ptr %30, i64 0
  %param_2.141810 = load double, ptr %param_2.1418, align 8, !invariant.load !297
  %multiply.2886.1 = fmul double %multiply.2882.13, %param_2.141810
  %31 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2886.1, ptr %31, align 8
  br label %dynamic-update-slice.1411.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_16(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %param_1.1756 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_34 = load i64, ptr @326, align 8
  %0 = icmp slt i64 %param_1.1756, %constant_1667_34
  %1 = zext i1 %0 to i8
  %param_1.17561 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_53 = load i64, ptr @325, align 8
  %2 = add i64 %param_1.17561, %constant_1666_53
  %param_1.17562 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17562
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_343 = load i64, ptr @326, align 8
  %9 = icmp sge i64 0, %constant_1667_343
  %10 = select i1 %9, i64 0, i64 %constant_1667_343
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1412.1.in_bounds-true, label %dynamic-update-slice.1412.1.in_bounds-after

dynamic-update-slice.1412.1.in_bounds-after:      ; preds = %dynamic-update-slice.1412.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1412.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_2 = load double, ptr @324, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1445 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14454 = load double, ptr %param_2.1445, align 8, !invariant.load !297
  %constant_1669_5 = load double, ptr @323, align 8
  %multiply.2887.3 = fmul double %param_2.14454, %constant_1669_5
  %multiply.2905.1 = fmul double %multiply.2887.3, %multiply.2887.3
  %divide.591.1 = fdiv double %constant_1664_2, %multiply.2905.1
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.591.1, ptr %23, align 8
  br label %dynamic-update-slice.1412.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_18(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %param_1.1731 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_9 = load i64, ptr @330, align 8
  %0 = icmp slt i64 %param_1.1731, %constant_1667_9
  %1 = zext i1 %0 to i8
  %param_1.17311 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_51 = load i64, ptr @329, align 8
  %2 = add i64 %param_1.17311, %constant_1666_51
  %param_1.17312 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17312
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_93 = load i64, ptr @330, align 8
  %9 = icmp sge i64 0, %constant_1667_93
  %10 = select i1 %9, i64 0, i64 %constant_1667_93
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1410.1.in_bounds-true, label %dynamic-update-slice.1410.1.in_bounds-after

dynamic-update-slice.1410.1.in_bounds-after:      ; preds = %dynamic-update-slice.1410.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1410.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_24 = load double, ptr @328, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1420 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14204 = load double, ptr %param_2.1420, align 8, !invariant.load !297
  %constant_1669_6 = load double, ptr @327, align 8
  %multiply.2887.7 = fmul double %param_2.14204, %constant_1669_6
  %divide.583.3 = fdiv double %constant_1664_24, %multiply.2887.7
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.583.3, ptr %23, align 8
  br label %dynamic-update-slice.1410.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_23(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5) {
entry:
  %param_1.1781 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_3 = load i64, ptr @333, align 8
  %0 = icmp slt i64 %param_1.1781, %constant_1667_3
  %1 = zext i1 %0 to i8
  %param_1.17811 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_46 = load i64, ptr @332, align 8
  %2 = add i64 %param_1.17811, %constant_1666_46
  %param_1.17812 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17812
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_33 = load i64, ptr @333, align 8
  %9 = icmp sge i64 0, %constant_1667_33
  %10 = select i1 %9, i64 0, i64 %constant_1667_33
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1405.1.in_bounds-true, label %dynamic-update-slice.1405.1.in_bounds-after

dynamic-update-slice.1405.1.in_bounds-after:      ; preds = %dynamic-update-slice.1405.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1405.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1477 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14774 = load double, ptr %param_2.1477, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.936 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.9365 = load double, ptr %param_4.936, align 8, !invariant.load !297
  %24 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.739 = getelementptr inbounds double, ptr %24, i64 0
  %param_5.7396 = load double, ptr %param_5.739, align 8, !invariant.load !297
  %multiply.2873.9 = fmul double %param_4.9365, %param_5.7396
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1186 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11867 = load double, ptr %param_3.1186, align 8, !invariant.load !297
  %add.3802.9 = fadd double %multiply.2873.9, %param_3.11867
  %subtract.231.1 = fsub double %param_2.14774, %add.3802.9
  %constant_1669_3 = load double, ptr @331, align 8
  %multiply.2904.3 = fmul double %subtract.231.1, %constant_1669_3
  %26 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2904.3, ptr %26, align 8
  br label %dynamic-update-slice.1405.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_24(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5) {
entry:
  %param_1.1772 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_50 = load i64, ptr @335, align 8
  %0 = icmp slt i64 %param_1.1772, %constant_1667_50
  %1 = zext i1 %0 to i8
  %param_1.17721 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_45 = load i64, ptr @334, align 8
  %2 = add i64 %param_1.17721, %constant_1666_45
  %param_1.17722 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17722
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_503 = load i64, ptr @335, align 8
  %9 = icmp sge i64 0, %constant_1667_503
  %10 = select i1 %9, i64 0, i64 %constant_1667_503
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1404.1.in_bounds-true, label %dynamic-update-slice.1404.1.in_bounds-after

dynamic-update-slice.1404.1.in_bounds-after:      ; preds = %dynamic-update-slice.1404.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1404.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1460 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14604 = load double, ptr %param_2.1460, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.925 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.9255 = load double, ptr %param_4.925, align 8, !invariant.load !297
  %24 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.727 = getelementptr inbounds double, ptr %24, i64 0
  %param_5.7276 = load double, ptr %param_5.727, align 8, !invariant.load !297
  %multiply.2873.5 = fmul double %param_4.9255, %param_5.7276
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1173 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11737 = load double, ptr %param_3.1173, align 8, !invariant.load !297
  %add.3802.5 = fadd double %multiply.2873.5, %param_3.11737
  %subtract.231.3 = fsub double %param_2.14604, %add.3802.5
  %multiply.2884.1 = fmul double %subtract.231.3, %subtract.231.3
  %26 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2884.1, ptr %26, align 8
  br label %dynamic-update-slice.1404.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_46(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.1179 = load i64, ptr %arg3, align 8, !invariant.load !297
  %constant_1667_24 = load i64, ptr @338, align 8
  %0 = icmp slt i64 %param_3.1179, %constant_1667_24
  %1 = zext i1 %0 to i8
  %param_3.11791 = load i64, ptr %arg3, align 8, !invariant.load !297
  %constant_1666_11 = load i64, ptr @337, align 8
  %2 = add i64 %param_3.11791, %constant_1666_11
  %param_3.11792 = load i64, ptr %arg3, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.11792
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_243 = load i64, ptr @338, align 8
  %9 = icmp sge i64 0, %constant_1667_243
  %10 = select i1 %9, i64 0, i64 %constant_1667_243
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1379.1.in_bounds-true, label %dynamic-update-slice.1379.1.in_bounds-after

dynamic-update-slice.1379.1.in_bounds-after:      ; preds = %dynamic-update-slice.1379.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1379.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.1746 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.17464 = load double, ptr %param_1.1746, align 8, !invariant.load !297
  %constant_1668_4 = load double, ptr @336, align 8
  %compare.629.7 = fcmp ogt double %param_1.17464, %constant_1668_4
  %23 = zext i1 %compare.629.7 to i8
  %24 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.17465 = getelementptr inbounds double, ptr %24, i64 0
  %param_1.17466 = load double, ptr %param_1.17465, align 8, !invariant.load !297
  %25 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1435 = getelementptr inbounds double, ptr %25, i64 0
  %param_2.14357 = load double, ptr %param_2.1435, align 8, !invariant.load !297
  %26 = trunc i8 %23 to i1
  %27 = select i1 %26, double %param_1.17466, double %param_2.14357
  %28 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %27, ptr %28, align 8
  br label %dynamic-update-slice.1379.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_19(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5) {
entry:
  %param_1.1768 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_46 = load i64, ptr @341, align 8
  %0 = icmp slt i64 %param_1.1768, %constant_1667_46
  %1 = zext i1 %0 to i8
  %param_1.17681 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_50 = load i64, ptr @340, align 8
  %2 = add i64 %param_1.17681, %constant_1666_50
  %param_1.17682 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17682
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_463 = load i64, ptr @341, align 8
  %9 = icmp sge i64 0, %constant_1667_463
  %10 = select i1 %9, i64 0, i64 %constant_1667_463
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1409.1.in_bounds-true, label %dynamic-update-slice.1409.1.in_bounds-after

dynamic-update-slice.1409.1.in_bounds-after:      ; preds = %dynamic-update-slice.1409.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1409.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.737 = getelementptr inbounds double, ptr %22, i64 0
  %param_5.7374 = load double, ptr %param_5.737, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1171 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11715 = load double, ptr %param_3.1171, align 8, !invariant.load !297
  %constant_1668_22 = load double, ptr @339, align 8
  %compare.625.27 = fcmp ogt double %param_3.11715, %constant_1668_22
  %24 = zext i1 %compare.625.27 to i8
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11716 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11717 = load double, ptr %param_3.11716, align 8, !invariant.load !297
  %26 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.923 = getelementptr inbounds double, ptr %26, i64 0
  %param_4.9238 = load double, ptr %param_4.923, align 8, !invariant.load !297
  %27 = trunc i8 %24 to i1
  %28 = select i1 %27, double %param_3.11717, double %param_4.9238
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1456 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.14569 = load double, ptr %param_2.1456, align 8, !invariant.load !297
  %multiply.2881.17 = fmul double %28, %param_2.14569
  %multiply.2882.9 = fmul double %param_5.7374, %multiply.2881.17
  %30 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2882.9, ptr %30, align 8
  br label %dynamic-update-slice.1409.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_9(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5) {
entry:
  %param_1.1782 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_48 = load i64, ptr @345, align 8
  %0 = icmp slt i64 %param_1.1782, %constant_1667_48
  %1 = zext i1 %0 to i8
  %param_1.17821 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_44 = load i64, ptr @344, align 8
  %2 = add i64 %param_1.17821, %constant_1666_44
  %param_1.17822 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17822
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_483 = load i64, ptr @345, align 8
  %9 = icmp sge i64 0, %constant_1667_483
  %10 = select i1 %9, i64 0, i64 %constant_1667_483
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1420.1.in_bounds-true, label %dynamic-update-slice.1420.1.in_bounds-after

dynamic-update-slice.1420.1.in_bounds-after:      ; preds = %dynamic-update-slice.1420.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1420.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.740 = getelementptr inbounds double, ptr %22, i64 0
  %param_5.7404 = load double, ptr %param_5.740, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1187 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11875 = load double, ptr %param_3.1187, align 8, !invariant.load !297
  %constant_1668_21 = load double, ptr @343, align 8
  %compare.625.25 = fcmp ogt double %param_3.11875, %constant_1668_21
  %24 = zext i1 %compare.625.25 to i8
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11876 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11877 = load double, ptr %param_3.11876, align 8, !invariant.load !297
  %26 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.937 = getelementptr inbounds double, ptr %26, i64 0
  %param_4.9378 = load double, ptr %param_4.937, align 8, !invariant.load !297
  %27 = trunc i8 %24 to i1
  %28 = select i1 %27, double %param_3.11877, double %param_4.9378
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1478 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.14789 = load double, ptr %param_2.1478, align 8, !invariant.load !297
  %multiply.2881.15 = fmul double %28, %param_2.14789
  %multiply.2882.7 = fmul double %param_5.7404, %multiply.2881.15
  %constant_1669_4 = load double, ptr @342, align 8
  %multiply.2907.3 = fmul double %multiply.2882.7, %constant_1669_4
  %30 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2907.3, ptr %30, align 8
  br label %dynamic-update-slice.1420.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_8(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5) {
entry:
  %param_1.1758 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_36 = load i64, ptr @348, align 8
  %0 = icmp slt i64 %param_1.1758, %constant_1667_36
  %1 = zext i1 %0 to i8
  %param_1.17581 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_43 = load i64, ptr @347, align 8
  %2 = add i64 %param_1.17581, %constant_1666_43
  %param_1.17582 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17582
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_363 = load i64, ptr @348, align 8
  %9 = icmp sge i64 0, %constant_1667_363
  %10 = select i1 %9, i64 0, i64 %constant_1667_363
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1421.1.in_bounds-true, label %dynamic-update-slice.1421.1.in_bounds-after

dynamic-update-slice.1421.1.in_bounds-after:      ; preds = %dynamic-update-slice.1421.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1421.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.736 = getelementptr inbounds double, ptr %22, i64 0
  %param_5.7364 = load double, ptr %param_5.736, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1164 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11645 = load double, ptr %param_3.1164, align 8, !invariant.load !297
  %constant_1668_17 = load double, ptr @346, align 8
  %compare.625.29 = fcmp ogt double %param_3.11645, %constant_1668_17
  %24 = zext i1 %compare.625.29 to i8
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11646 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11647 = load double, ptr %param_3.11646, align 8, !invariant.load !297
  %26 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.919 = getelementptr inbounds double, ptr %26, i64 0
  %param_4.9198 = load double, ptr %param_4.919, align 8, !invariant.load !297
  %27 = trunc i8 %24 to i1
  %28 = select i1 %27, double %param_3.11647, double %param_4.9198
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1447 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.14479 = load double, ptr %param_2.1447, align 8, !invariant.load !297
  %multiply.2881.19 = fmul double %28, %param_2.14479
  %multiply.2882.11 = fmul double %param_5.7364, %multiply.2881.19
  %multiply.2890.1 = fmul double %multiply.2882.11, %multiply.2882.11
  %30 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2890.1, ptr %30, align 8
  br label %dynamic-update-slice.1421.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_22(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4) {
entry:
  %param_1.1766 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_44 = load i64, ptr @351, align 8
  %0 = icmp slt i64 %param_1.1766, %constant_1667_44
  %1 = zext i1 %0 to i8
  %param_1.17661 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_47 = load i64, ptr @350, align 8
  %2 = add i64 %param_1.17661, %constant_1666_47
  %param_1.17662 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17662
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_443 = load i64, ptr @351, align 8
  %9 = icmp sge i64 0, %constant_1667_443
  %10 = select i1 %9, i64 0, i64 %constant_1667_443
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1406.1.in_bounds-true, label %dynamic-update-slice.1406.1.in_bounds-after

dynamic-update-slice.1406.1.in_bounds-after:      ; preds = %dynamic-update-slice.1406.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1406.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1169 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.11694 = load double, ptr %param_3.1169, align 8, !invariant.load !297
  %constant_1668_19 = load double, ptr @349, align 8
  %compare.625.17 = fcmp ogt double %param_3.11694, %constant_1668_19
  %23 = zext i1 %compare.625.17 to i8
  %24 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11695 = getelementptr inbounds double, ptr %24, i64 0
  %param_3.11696 = load double, ptr %param_3.11695, align 8, !invariant.load !297
  %25 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.921 = getelementptr inbounds double, ptr %25, i64 0
  %param_4.9217 = load double, ptr %param_4.921, align 8, !invariant.load !297
  %26 = trunc i8 %23 to i1
  %27 = select i1 %26, double %param_3.11696, double %param_4.9217
  %28 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1454 = getelementptr inbounds double, ptr %28, i64 0
  %param_2.14548 = load double, ptr %param_2.1454, align 8, !invariant.load !297
  %multiply.2881.7 = fmul double %27, %param_2.14548
  %29 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2881.7, ptr %29, align 8
  br label %dynamic-update-slice.1406.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_5(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5) {
entry:
  %param_1.1747 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_25 = load i64, ptr @355, align 8
  %0 = icmp slt i64 %param_1.1747, %constant_1667_25
  %1 = zext i1 %0 to i8
  %param_1.17471 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_21 = load i64, ptr @354, align 8
  %2 = add i64 %param_1.17471, %constant_1666_21
  %param_1.17472 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17472
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_253 = load i64, ptr @355, align 8
  %9 = icmp sge i64 0, %constant_1667_253
  %10 = select i1 %9, i64 0, i64 %constant_1667_253
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1424.1.in_bounds-true, label %dynamic-update-slice.1424.1.in_bounds-after

dynamic-update-slice.1424.1.in_bounds-after:      ; preds = %dynamic-update-slice.1424.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1424.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.741 = getelementptr inbounds double, ptr %22, i64 0
  %param_5.7414 = load double, ptr %param_5.741, align 8, !invariant.load !297
  %multiply.2893.9 = fmul double %param_5.7414, %param_5.7414
  %constant_1670_1 = load double, ptr @353, align 8
  %multiply.2894.7 = fmul double %multiply.2893.9, %constant_1670_1
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1156 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11565 = load double, ptr %param_3.1156, align 8, !invariant.load !297
  %constant_1668_10 = load double, ptr @352, align 8
  %compare.625.19 = fcmp ogt double %param_3.11565, %constant_1668_10
  %24 = zext i1 %compare.625.19 to i8
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11566 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11567 = load double, ptr %param_3.11566, align 8, !invariant.load !297
  %26 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.915 = getelementptr inbounds double, ptr %26, i64 0
  %param_4.9158 = load double, ptr %param_4.915, align 8, !invariant.load !297
  %27 = trunc i8 %24 to i1
  %28 = select i1 %27, double %param_3.11567, double %param_4.9158
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1436 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.14369 = load double, ptr %param_2.1436, align 8, !invariant.load !297
  %multiply.2881.9 = fmul double %28, %param_2.14369
  %multiply.2895.1 = fmul double %multiply.2894.7, %multiply.2881.9
  %30 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2895.1, ptr %30, align 8
  br label %dynamic-update-slice.1424.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_29(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4) {
entry:
  %param_1.1789 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_31 = load i64, ptr @360, align 8
  %0 = icmp slt i64 %param_1.1789, %constant_1667_31
  %1 = zext i1 %0 to i8
  %param_1.17891 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_38 = load i64, ptr @359, align 8
  %2 = add i64 %param_1.17891, %constant_1666_38
  %param_1.17892 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17892
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_313 = load i64, ptr @360, align 8
  %9 = icmp sge i64 0, %constant_1667_313
  %10 = select i1 %9, i64 0, i64 %constant_1667_313
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1399.1.in_bounds-true, label %dynamic-update-slice.1399.1.in_bounds-after

dynamic-update-slice.1399.1.in_bounds-after:      ; preds = %dynamic-update-slice.1399.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1399.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1485 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14854 = load double, ptr %param_2.1485, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.942 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.9425 = load double, ptr %param_4.942, align 8, !invariant.load !297
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.9426 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.9427 = load double, ptr %param_4.9426, align 8, !invariant.load !297
  %multiply.2877.4 = fmul double %param_4.9425, %param_4.9427
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1191 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11918 = load double, ptr %param_3.1191, align 8, !invariant.load !297
  %constant_1664_26 = load double, ptr @357, align 8
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11919 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.119110 = load double, ptr %param_3.11919, align 8, !invariant.load !297
  %subtract.229.27 = fsub double %constant_1664_26, %param_3.119110
  %multiply.2874.23 = fmul double %param_3.11918, %subtract.229.27
  %multiply.2878.5 = fmul double %multiply.2877.4, %multiply.2874.23
  %add.3807.3 = fadd double %param_2.14854, %multiply.2878.5
  %constant_1668_3 = load double, ptr @358, align 8
  %compare.626.15 = fcmp ogt double %add.3807.3, %constant_1668_3
  %27 = zext i1 %compare.626.15 to i8
  %constant_1676_1 = load double, ptr @356, align 8
  %28 = trunc i8 %27 to i1
  %29 = select i1 %28, double %add.3807.3, double %constant_1676_1
  %30 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %29, ptr %30, align 8
  br label %dynamic-update-slice.1399.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_26(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(6144) %arg3) {
entry:
  %param_1.1745 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_23 = load i64, ptr @362, align 8
  %0 = icmp slt i64 %param_1.1745, %constant_1667_23
  %1 = zext i1 %0 to i8
  %param_1.17451 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_41 = load i64, ptr @363, align 8
  %2 = add i64 %param_1.17451, %constant_1666_41
  %param_1.17452 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17452
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_233 = load i64, ptr @362, align 8
  %9 = icmp sge i64 0, %constant_1667_233
  %10 = select i1 %9, i64 0, i64 %constant_1667_233
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1402.1.in_bounds-true, label %dynamic-update-slice.1402.1.in_bounds-after

dynamic-update-slice.1402.1.in_bounds-after:      ; preds = %dynamic-update-slice.1402.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1402.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_1.17454 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_235 = load i64, ptr @362, align 8
  %22 = icmp slt i64 %param_1.17454, %constant_1667_235
  %23 = zext i1 %22 to i8
  %param_1.17456 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_417 = load i64, ptr @363, align 8
  %24 = add i64 %param_1.17456, %constant_1666_417
  %param_1.17458 = load i64, ptr %arg1, align 8, !invariant.load !297
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_1.17458
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.1255.7.start_idx0 = select i1 %29, i64 191, i64 %28
  %constant_1667_239 = load i64, ptr @362, align 8
  %30 = icmp sge i64 0, %constant_1667_239
  %31 = select i1 %30, i64 0, i64 %constant_1667_239
  %32 = icmp sle i64 0, %31
  %dynamic-slice.1255.7.start_idx1 = select i1 %32, i64 0, i64 %31
  %constant_1667_2310 = load i64, ptr @362, align 8
  %33 = icmp sge i64 0, %constant_1667_2310
  %34 = select i1 %33, i64 0, i64 %constant_1667_2310
  %35 = icmp sle i64 0, %34
  %dynamic-slice.1255.7.start_idx2 = select i1 %35, i64 0, i64 %34
  %36 = add i64 %dynamic-slice.1255.7.start_idx0, 0
  %37 = add i64 %dynamic-slice.1255.7.start_idx1, %17
  %38 = add i64 %dynamic-slice.1255.7.start_idx2, 0
  %param_3.1154 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg3, i64 0, i64 %36, i64 %37, i64 0
  %param_3.115411 = load double, ptr %param_3.1154, align 8, !invariant.load !297
  %39 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1434 = getelementptr inbounds double, ptr %39, i64 0
  %param_2.143412 = load double, ptr %param_2.1434, align 8, !invariant.load !297
  %subtract.230.7 = fsub double %param_3.115411, %param_2.143412
  %40 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.143413 = getelementptr inbounds double, ptr %40, i64 0
  %param_2.143414 = load double, ptr %param_2.143413, align 8, !invariant.load !297
  %constant_1664_25 = load double, ptr @361, align 8
  %41 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.143415 = getelementptr inbounds double, ptr %41, i64 0
  %param_2.143416 = load double, ptr %param_2.143415, align 8, !invariant.load !297
  %subtract.229.19 = fsub double %constant_1664_25, %param_2.143416
  %multiply.2874.15 = fmul double %param_2.143414, %subtract.229.19
  %divide.579.3 = fdiv double %subtract.230.7, %multiply.2874.15
  %42 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.579.3, ptr %42, align 8
  br label %dynamic-update-slice.1402.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_37(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %param_1.1769 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_47 = load i64, ptr @366, align 8
  %0 = icmp slt i64 %param_1.1769, %constant_1667_47
  %1 = zext i1 %0 to i8
  %param_1.17691 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_23 = load i64, ptr @365, align 8
  %2 = add i64 %param_1.17691, %constant_1666_23
  %param_1.17692 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17692
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_473 = load i64, ptr @366, align 8
  %9 = icmp sge i64 0, %constant_1667_473
  %10 = select i1 %9, i64 0, i64 %constant_1667_473
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1388.1.in_bounds-true, label %dynamic-update-slice.1388.1.in_bounds-after

dynamic-update-slice.1388.1.in_bounds-after:      ; preds = %dynamic-update-slice.1388.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1388.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1457 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14574 = load double, ptr %param_2.1457, align 8, !invariant.load !297
  %constant_1664_23 = load double, ptr @364, align 8
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.14575 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.14576 = load double, ptr %param_2.14575, align 8, !invariant.load !297
  %subtract.229.15 = fsub double %constant_1664_23, %param_2.14576
  %multiply.2874.11 = fmul double %param_2.14574, %subtract.229.15
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2874.11, ptr %24, align 8
  br label %dynamic-update-slice.1388.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_33(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %param_1.1727 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_4 = load i64, ptr @369, align 8
  %0 = icmp slt i64 %param_1.1727, %constant_1667_4
  %1 = zext i1 %0 to i8
  %param_1.17271 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_29 = load i64, ptr @368, align 8
  %2 = add i64 %param_1.17271, %constant_1666_29
  %param_1.17272 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17272
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_43 = load i64, ptr @369, align 8
  %9 = icmp sge i64 0, %constant_1667_43
  %10 = select i1 %9, i64 0, i64 %constant_1667_43
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1393.1.in_bounds-true, label %dynamic-update-slice.1393.1.in_bounds-after

dynamic-update-slice.1393.1.in_bounds-after:      ; preds = %dynamic-update-slice.1393.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1393.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_17 = load double, ptr @367, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1416 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14164 = load double, ptr %param_2.1416, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.14165 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.14166 = load double, ptr %param_2.14165, align 8, !invariant.load !297
  %subtract.229.13 = fsub double %constant_1664_17, %param_2.14166
  %multiply.2874.9 = fmul double %param_2.14164, %subtract.229.13
  %multiply.2902.1 = fmul double %multiply.2874.9, %multiply.2874.9
  %divide.589.1 = fdiv double %constant_1664_17, %multiply.2902.1
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.589.1, ptr %24, align 8
  br label %dynamic-update-slice.1393.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_25(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4) {
entry:
  %param_1.1752 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_30 = load i64, ptr @374, align 8
  %0 = icmp slt i64 %param_1.1752, %constant_1667_30
  %1 = zext i1 %0 to i8
  %param_1.17521 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_42 = load i64, ptr @373, align 8
  %2 = add i64 %param_1.17521, %constant_1666_42
  %param_1.17522 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17522
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_303 = load i64, ptr @374, align 8
  %9 = icmp sge i64 0, %constant_1667_303
  %10 = select i1 %9, i64 0, i64 %constant_1667_303
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1403.1.in_bounds-true, label %dynamic-update-slice.1403.1.in_bounds-after

dynamic-update-slice.1403.1.in_bounds-after:      ; preds = %dynamic-update-slice.1403.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1403.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1195 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.11954 = load double, ptr %param_3.1195, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1489 = getelementptr inbounds double, ptr %23, i64 0
  %param_2.14895 = load double, ptr %param_2.1489, align 8, !invariant.load !297
  %constant_1664_21 = load double, ptr @371, align 8
  %24 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.14896 = getelementptr inbounds double, ptr %24, i64 0
  %param_2.14897 = load double, ptr %param_2.14896, align 8, !invariant.load !297
  %subtract.229.23 = fsub double %constant_1664_21, %param_2.14897
  %multiply.2874.19 = fmul double %param_2.14895, %subtract.229.23
  %multiply.2875.7 = fmul double %param_3.11954, %multiply.2874.19
  %25 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.946 = getelementptr inbounds double, ptr %25, i64 0
  %param_4.9468 = load double, ptr %param_4.946, align 8, !invariant.load !297
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11959 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.119510 = load double, ptr %param_3.11959, align 8, !invariant.load !297
  %27 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.119511 = getelementptr inbounds double, ptr %27, i64 0
  %param_3.119512 = load double, ptr %param_3.119511, align 8, !invariant.load !297
  %multiply.2877.16 = fmul double %param_3.119510, %param_3.119512
  %multiply.2878.17 = fmul double %multiply.2877.16, %multiply.2874.19
  %add.3807.15 = fadd double %param_4.9468, %multiply.2878.17
  %constant_1668_23 = load double, ptr @372, align 8
  %compare.626.17 = fcmp ogt double %add.3807.15, %constant_1668_23
  %28 = zext i1 %compare.626.17 to i8
  %constant_1676_6 = load double, ptr @370, align 8
  %29 = trunc i8 %28 to i1
  %30 = select i1 %29, double %add.3807.15, double %constant_1676_6
  %divide.578.3 = fdiv double %multiply.2875.7, %30
  %31 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.578.3, ptr %31, align 8
  br label %dynamic-update-slice.1403.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_27(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4) {
entry:
  %param_1.1792 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_15 = load i64, ptr @379, align 8
  %0 = icmp slt i64 %param_1.1792, %constant_1667_15
  %1 = zext i1 %0 to i8
  %param_1.17921 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_40 = load i64, ptr @378, align 8
  %2 = add i64 %param_1.17921, %constant_1666_40
  %param_1.17922 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17922
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_153 = load i64, ptr @379, align 8
  %9 = icmp sge i64 0, %constant_1667_153
  %10 = select i1 %9, i64 0, i64 %constant_1667_153
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1401.1.in_bounds-true, label %dynamic-update-slice.1401.1.in_bounds-after

dynamic-update-slice.1401.1.in_bounds-after:      ; preds = %dynamic-update-slice.1401.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1401.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_18 = load double, ptr @376, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1488 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14884 = load double, ptr %param_2.1488, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.945 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.9455 = load double, ptr %param_4.945, align 8, !invariant.load !297
  %24 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.9456 = getelementptr inbounds double, ptr %24, i64 0
  %param_4.9457 = load double, ptr %param_4.9456, align 8, !invariant.load !297
  %multiply.2877.14 = fmul double %param_4.9455, %param_4.9457
  %25 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1194 = getelementptr inbounds double, ptr %25, i64 0
  %param_3.11948 = load double, ptr %param_3.1194, align 8, !invariant.load !297
  %26 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11949 = getelementptr inbounds double, ptr %26, i64 0
  %param_3.119410 = load double, ptr %param_3.11949, align 8, !invariant.load !297
  %subtract.229.37 = fsub double %constant_1664_18, %param_3.119410
  %multiply.2874.33 = fmul double %param_3.11948, %subtract.229.37
  %multiply.2878.15 = fmul double %multiply.2877.14, %multiply.2874.33
  %add.3807.13 = fadd double %param_2.14884, %multiply.2878.15
  %constant_1668_15 = load double, ptr @377, align 8
  %compare.626.13 = fcmp ogt double %add.3807.13, %constant_1668_15
  %27 = zext i1 %compare.626.13 to i8
  %constant_1676_5 = load double, ptr @375, align 8
  %28 = trunc i8 %27 to i1
  %29 = select i1 %28, double %add.3807.13, double %constant_1676_5
  %multiply.2903.1 = fmul double %29, %29
  %divide.590.1 = fdiv double %constant_1664_18, %multiply.2903.1
  %30 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.590.1, ptr %30, align 8
  br label %dynamic-update-slice.1401.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_34(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(6144) %arg3) {
entry:
  %param_1.1778 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_56 = load i64, ptr @380, align 8
  %0 = icmp slt i64 %param_1.1778, %constant_1667_56
  %1 = zext i1 %0 to i8
  %param_1.17781 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_28 = load i64, ptr @381, align 8
  %2 = add i64 %param_1.17781, %constant_1666_28
  %param_1.17782 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17782
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_563 = load i64, ptr @380, align 8
  %9 = icmp sge i64 0, %constant_1667_563
  %10 = select i1 %9, i64 0, i64 %constant_1667_563
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1392.1.in_bounds-true, label %dynamic-update-slice.1392.1.in_bounds-after

dynamic-update-slice.1392.1.in_bounds-after:      ; preds = %dynamic-update-slice.1392.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1392.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_1.17784 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_565 = load i64, ptr @380, align 8
  %22 = icmp slt i64 %param_1.17784, %constant_1667_565
  %23 = zext i1 %22 to i8
  %param_1.17786 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_287 = load i64, ptr @381, align 8
  %24 = add i64 %param_1.17786, %constant_1666_287
  %param_1.17788 = load i64, ptr %arg1, align 8, !invariant.load !297
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_1.17788
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.1255.3.start_idx0 = select i1 %29, i64 191, i64 %28
  %constant_1667_569 = load i64, ptr @380, align 8
  %30 = icmp sge i64 0, %constant_1667_569
  %31 = select i1 %30, i64 0, i64 %constant_1667_569
  %32 = icmp sle i64 0, %31
  %dynamic-slice.1255.3.start_idx1 = select i1 %32, i64 0, i64 %31
  %constant_1667_5610 = load i64, ptr @380, align 8
  %33 = icmp sge i64 0, %constant_1667_5610
  %34 = select i1 %33, i64 0, i64 %constant_1667_5610
  %35 = icmp sle i64 0, %34
  %dynamic-slice.1255.3.start_idx2 = select i1 %35, i64 0, i64 %34
  %36 = add i64 %dynamic-slice.1255.3.start_idx0, 0
  %37 = add i64 %dynamic-slice.1255.3.start_idx1, %17
  %38 = add i64 %dynamic-slice.1255.3.start_idx2, 0
  %param_3.1175 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg3, i64 0, i64 %36, i64 %37, i64 0
  %param_3.117511 = load double, ptr %param_3.1175, align 8, !invariant.load !297
  %39 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1466 = getelementptr inbounds double, ptr %39, i64 0
  %param_2.146612 = load double, ptr %param_2.1466, align 8, !invariant.load !297
  %subtract.230.3 = fsub double %param_3.117511, %param_2.146612
  %40 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %subtract.230.3, ptr %40, align 8
  br label %dynamic-update-slice.1392.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_36(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %param_1.1771 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_49 = load i64, ptr @384, align 8
  %0 = icmp slt i64 %param_1.1771, %constant_1667_49
  %1 = zext i1 %0 to i8
  %param_1.17711 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_24 = load i64, ptr @383, align 8
  %2 = add i64 %param_1.17711, %constant_1666_24
  %param_1.17712 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17712
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_493 = load i64, ptr @384, align 8
  %9 = icmp sge i64 0, %constant_1667_493
  %10 = select i1 %9, i64 0, i64 %constant_1667_493
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1389.1.in_bounds-true, label %dynamic-update-slice.1389.1.in_bounds-after

dynamic-update-slice.1389.1.in_bounds-after:      ; preds = %dynamic-update-slice.1389.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1389.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_1664_19 = load double, ptr @382, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1459 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14594 = load double, ptr %param_2.1459, align 8, !invariant.load !297
  %subtract.229.3 = fsub double %constant_1664_19, %param_2.14594
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %subtract.229.3, ptr %23, align 8
  br label %dynamic-update-slice.1389.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_28(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3) {
entry:
  %param_1.1748 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1667_26 = load i64, ptr @387, align 8
  %0 = icmp slt i64 %param_1.1748, %constant_1667_26
  %1 = zext i1 %0 to i8
  %param_1.17481 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1666_39 = load i64, ptr @386, align 8
  %2 = add i64 %param_1.17481, %constant_1666_39
  %param_1.17482 = load i64, ptr %arg1, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.17482
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_1667_263 = load i64, ptr @387, align 8
  %9 = icmp sge i64 0, %constant_1667_263
  %10 = select i1 %9, i64 0, i64 %constant_1667_263
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
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
  br i1 %19, label %dynamic-update-slice.1400.1.in_bounds-true, label %dynamic-update-slice.1400.1.in_bounds-after

dynamic-update-slice.1400.1.in_bounds-after:      ; preds = %dynamic-update-slice.1400.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1400.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.1437 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.14374 = load double, ptr %param_2.1437, align 8, !invariant.load !297
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.1157 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.11575 = load double, ptr %param_3.1157, align 8, !invariant.load !297
  %constant_1664_5 = load double, ptr @385, align 8
  %24 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.11576 = getelementptr inbounds double, ptr %24, i64 0
  %param_3.11577 = load double, ptr %param_3.11576, align 8, !invariant.load !297
  %subtract.229.17 = fsub double %constant_1664_5, %param_3.11577
  %multiply.2874.13 = fmul double %param_3.11575, %subtract.229.17
  %multiply.2875.3 = fmul double %param_2.14374, %multiply.2874.13
  %25 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.2875.3, ptr %25, align 8
  br label %dynamic-update-slice.1400.1.in_bounds-after
}

define void @loop_subtract_fusion(ptr noalias align 128 dereferenceable(3072) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(3072) %arg2, ptr noalias align 128 dereferenceable(6144) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %loop_subtract_fusion.in_bounds-true, label %loop_subtract_fusion.in_bounds-after

loop_subtract_fusion.in_bounds-after:             ; preds = %loop_subtract_fusion.in_bounds-true, %entry
  ret void

loop_subtract_fusion.in_bounds-true:              ; preds = %entry
  %constant_1686_4 = load double, ptr @388, align 8
  %constant_1688_1 = load double, ptr @390, align 8
  %7 = getelementptr double, ptr %arg1, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !297
  %constant_1687_2 = load double, ptr @389, align 8
  %10 = fcmp une double %constant_1688_1, %constant_1688_1
  %11 = fcmp oeq double %9, %9
  %12 = fcmp oge double %constant_1688_1, %9
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = select i1 %14, double %constant_1688_1, double %9
  %16 = fcmp une double %constant_1687_2, %constant_1687_2
  %17 = fcmp oeq double %15, %15
  %18 = fcmp ole double %constant_1687_2, %15
  %19 = and i1 %17, %18
  %20 = or i1 %16, %19
  %21 = select i1 %20, double %constant_1687_2, double %15
  %22 = fneg double %21
  %23 = call double @__nv_exp(double %22)
  %add.3839.5 = fadd double %23, %constant_1686_4
  %divide.593.5 = fdiv double %constant_1686_4, %add.3839.5
  %subtract.233.4 = fsub double %constant_1686_4, %divide.593.5
  %24 = getelementptr float, ptr %arg2, i32 %linear_index
  %25 = getelementptr inbounds float, ptr %24, i32 0
  %26 = load float, ptr %25, align 4, !invariant.load !297
  %27 = fpext float %26 to double
  %multiply.2926.3 = fmul double %subtract.233.4, %27
  %28 = getelementptr float, ptr %arg0, i32 %linear_index
  %29 = getelementptr inbounds float, ptr %28, i32 0
  %30 = load float, ptr %29, align 4, !invariant.load !297
  %31 = fpext float %30 to double
  %multiply.2927.3 = fmul double %divide.593.5, %31
  %subtract.234.1 = fsub double %multiply.2926.3, %multiply.2927.3
  %32 = getelementptr double, ptr %arg3, i32 %linear_index
  %33 = getelementptr inbounds double, ptr %32, i32 0
  store double %subtract.234.1, ptr %33, align 8
  br label %loop_subtract_fusion.in_bounds-after
}

define void @loop_exponential_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(12288) %arg3) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer25 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %pad_result_addr18 = alloca double, align 8
  %reduce.49.5.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %pad_result_addr = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !304
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1536
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 768
  %8 = icmp ult i32 %linear_index, 1536
  br i1 %8, label %loop_exponential_fusion.in_bounds-true, label %loop_exponential_fusion.in_bounds-after

loop_exponential_fusion.in_bounds-after:          ; preds = %reduce.49.5.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_exponential_fusion.in_bounds-true:           ; preds = %entry
  %9 = sub i32 %7, 1
  %10 = icmp sge i32 %9, 0
  %in_bounds = and i1 true, %10
  %11 = urem i32 %9, 1
  %12 = icmp eq i32 0, %11
  %in_bounds1 = and i1 %in_bounds, %12
  %13 = sdiv i32 %9, 1
  %14 = icmp slt i32 %13, 1
  %in_bounds2 = and i1 %in_bounds1, %14
  %15 = sub i32 %6, 0
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
  %26 = icmp slt i32 %25, 4
  %in_bounds8 = and i1 %in_bounds7, %26
  br i1 %in_bounds8, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %27 = load double, ptr %pad_result_addr, align 8
  %28 = urem i32 %linear_index0, 768
  %constant_1683_2 = load double, ptr @391, align 8
  store double %constant_1683_2, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.49.5.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.49.5.inner.loop_header.reduction_dim.0

reduce.49.5.inner.loop_header.reduction_dim.0:    ; preds = %in_bounds-after21, %in_bounds-after
  %reduce.49.5.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.49.5.inner.invar_address.reduction_dim.0, align 4
  %29 = icmp uge i32 %reduce.49.5.inner.indvar.reduction_dim.0, 2
  br i1 %29, label %reduce.49.5.inner.loop_exit.reduction_dim.0, label %reduce.49.5.inner.loop_body.reduction_dim.0

reduce.49.5.inner.loop_body.reduction_dim.0:      ; preds = %reduce.49.5.inner.loop_header.reduction_dim.0
  %30 = load double, ptr %accumulator_0, align 8
  %31 = sub i32 %reduce.49.5.inner.indvar.reduction_dim.0, 1
  %32 = icmp sge i32 %31, 0
  %in_bounds9 = and i1 true, %32
  %33 = urem i32 %31, 1
  %34 = icmp eq i32 0, %33
  %in_bounds10 = and i1 %in_bounds9, %34
  %35 = sdiv i32 %31, 1
  %36 = icmp slt i32 %35, 1
  %in_bounds11 = and i1 %in_bounds10, %36
  %37 = sub i32 %6, 0
  %38 = icmp sge i32 %37, 0
  %in_bounds12 = and i1 %in_bounds11, %38
  %39 = urem i32 %37, 1
  %40 = icmp eq i32 0, %39
  %in_bounds13 = and i1 %in_bounds12, %40
  %41 = sdiv i32 %37, 1
  %42 = icmp slt i32 %41, 192
  %in_bounds14 = and i1 %in_bounds13, %42
  %43 = sub i32 %4, 0
  %44 = icmp sge i32 %43, 0
  %in_bounds15 = and i1 %in_bounds14, %44
  %45 = urem i32 %43, 1
  %46 = icmp eq i32 0, %45
  %in_bounds16 = and i1 %in_bounds15, %46
  %47 = sdiv i32 %43, 1
  %48 = icmp slt i32 %47, 4
  %in_bounds17 = and i1 %in_bounds16, %48
  br i1 %in_bounds17, label %in_bounds-true19, label %in_bounds-false20

in_bounds-after21:                                ; preds = %in_bounds-false20, %in_bounds-true19
  %49 = load double, ptr %pad_result_addr18, align 8
  store double %30, ptr %parameter_buffer, align 8
  store double %49, ptr %parameter_buffer25, align 8
  call void @region_17_4256_557ffa9f0370_e410f936d6284c04(ptr %parameter_buffer, ptr %parameter_buffer25, ptr %return_buffer)
  %50 = load double, ptr %return_buffer, align 8
  store double %50, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.49.5.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.49.5.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.49.5.inner.loop_header.reduction_dim.0

reduce.49.5.inner.loop_exit.reduction_dim.0:      ; preds = %reduce.49.5.inner.loop_header.reduction_dim.0
  %51 = load double, ptr %accumulator_0, align 8
  %subtract.235.5 = fsub double %27, %51
  %52 = call double @__nv_exp(double %subtract.235.5)
  %53 = getelementptr double, ptr %arg3, i32 %linear_index
  %54 = getelementptr inbounds double, ptr %53, i32 0
  store double %52, ptr %54, align 8
  br label %loop_exponential_fusion.in_bounds-after

in_bounds-true:                                   ; preds = %loop_exponential_fusion.in_bounds-true
  %55 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %25
  %56 = load double, ptr %55, align 8, !invariant.load !297
  %57 = getelementptr inbounds [192 x [4 x double]], ptr %arg1, i32 0, i32 %19, i32 %25
  %58 = load double, ptr %57, align 8, !invariant.load !297
  %multiply.2928.5 = fmul double %56, %58
  %59 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %25
  %60 = load double, ptr %59, align 8, !invariant.load !297
  %add.3841.5 = fadd double %multiply.2928.5, %60
  store double %add.3841.5, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %loop_exponential_fusion.in_bounds-true
  %constant_1685_18 = load double, ptr @392, align 8
  store double %constant_1685_18, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-true19:                                 ; preds = %reduce.49.5.inner.loop_body.reduction_dim.0
  %61 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %47
  %62 = load double, ptr %61, align 8, !invariant.load !297
  %63 = getelementptr inbounds [192 x [4 x double]], ptr %arg1, i32 0, i32 %41, i32 %47
  %64 = load double, ptr %63, align 8, !invariant.load !297
  %multiply.2928.522 = fmul double %62, %64
  %65 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %47
  %66 = load double, ptr %65, align 8, !invariant.load !297
  %add.3841.523 = fadd double %multiply.2928.522, %66
  store double %add.3841.523, ptr %pad_result_addr18, align 8
  br label %in_bounds-after21

in_bounds-false20:                                ; preds = %reduce.49.5.inner.loop_body.reduction_dim.0
  %constant_1685_1824 = load double, ptr @392, align 8
  store double %constant_1685_1824, ptr %pad_result_addr18, align 8
  br label %in_bounds-after21
}

define internal void @region_17_4256_557ffa9f0370_e410f936d6284c04(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.4257 = load double, ptr %0, align 8
  %Arg_1.4258 = load double, ptr %1, align 8
  %3 = fcmp une double %Arg_0.4257, %Arg_0.4257
  %4 = fcmp oeq double %Arg_1.4258, %Arg_1.4258
  %5 = fcmp oge double %Arg_0.4257, %Arg_1.4258
  %6 = and i1 %4, %5
  %7 = or i1 %3, %6
  %maximum.41 = select i1 %7, double %Arg_0.4257, double %Arg_1.4258
  store double %maximum.41, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

define void @loop_broadcast_fusion_9(ptr noalias align 128 dereferenceable(12288) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !298
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !305
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2048
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 384
  %8 = icmp ult i32 %linear_index, 1536
  br i1 %8, label %loop_broadcast_fusion.9.in_bounds-true, label %loop_broadcast_fusion.9.in_bounds-after

loop_broadcast_fusion.9.in_bounds-after:          ; preds = %loop_broadcast_fusion.9.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.9.in_bounds-true:           ; preds = %entry
  %constant_1685_1 = load double, ptr @393, align 8
  %9 = getelementptr double, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  store double %constant_1685_1, ptr %10, align 8
  br label %loop_broadcast_fusion.9.in_bounds-after
}

define void @input_scatter_fusion(ptr noalias align 128 dereferenceable(12288) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 16 dereferenceable(3072) %arg2) {
entry:
  %input_address = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index0, 1
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index0, 1
  %10 = icmp ult i32 %linear_index, 768
  br i1 %10, label %scatter.7.1.in_bounds-true, label %scatter.7.1.in_bounds-after

scatter.7.1.in_bounds-after:                      ; preds = %scatter.in_bounds-after, %entry
  ret void

scatter.7.1.in_bounds-true:                       ; preds = %entry
  %11 = mul nuw nsw i32 %9, 1
  %12 = add nuw nsw i32 0, %11
  %13 = urem i32 %12, 192
  %14 = udiv i32 %12, 192
  %15 = udiv i32 %14, 4
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 0, %16
  %18 = mul nuw nsw i32 %14, 1
  %19 = add nuw nsw i32 0, %18
  br label %concatenate.38.7.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.2
  %20 = phi i32 [ 1, %concatenate.pivot.1.2 ]
  %21 = sub nsw i32 0, %20
  %22 = mul nuw nsw i32 %13, 1
  %23 = add nuw nsw i32 0, %22
  br label %concatenate.38.7.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.2.3
  %24 = phi i32 [ 2, %concatenate.pivot.2.3 ]
  %25 = sub nsw i32 0, %24
  %param_2.1888 = getelementptr inbounds [4 x [192 x i32]], ptr %arg2, i32 0, i32 %14, i32 %13
  %param_2.18881 = load i32, ptr %param_2.1888, align 4, !invariant.load !297
  %constant_1689_4 = load i32, ptr @395, align 4
  %26 = icmp slt i32 %param_2.18881, %constant_1689_4
  %27 = zext i1 %26 to i8
  %constant_1699_2 = load i32, ptr @394, align 4
  %28 = add i32 %param_2.18881, %constant_1699_2
  %29 = trunc i8 %27 to i1
  %30 = select i1 %29, i32 %28, i32 %param_2.18881
  br label %concatenate.38.7.merge

concatenate.pivot.1.:                             ; preds = %scatter.7.1.in_bounds-true
  br i1 true, label %concatenate.pivot.0., label %concatenate.pivot.2.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.2.:                             ; preds = %concatenate.pivot.1.
  br i1 true, label %concatenate.pivot.1.2, label %concatenate.pivot.2.3

concatenate.pivot.1.2:                            ; preds = %concatenate.pivot.2.
  br label %concat_index_from_operand_id1

concatenate.pivot.2.3:                            ; preds = %concatenate.pivot.2.
  br label %concat_index_from_operand_id2

concatenate.38.7.merge:                           ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %31 = phi i32 [ %19, %concat_index_from_operand_id0 ], [ %23, %concat_index_from_operand_id1 ], [ %30, %concat_index_from_operand_id2 ]
  %32 = add i32 %8, %31
  %33 = icmp ult i32 %31, 4
  %34 = and i1 true, %33
  %35 = mul nuw nsw i32 %9, 1
  %36 = add nuw nsw i32 0, %35
  %37 = urem i32 %36, 192
  %38 = udiv i32 %36, 192
  %39 = udiv i32 %38, 4
  br label %concatenate.pivot.1.12

concat_index_from_operand_id05:                   ; preds = %concatenate.pivot.0.13
  %40 = phi i32 [ 0, %concatenate.pivot.0.13 ]
  %41 = sub nsw i32 1, %40
  %42 = mul nuw nsw i32 %38, 1
  %43 = add nuw nsw i32 0, %42
  br label %concatenate.38.7.merge4

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.1.15
  %44 = phi i32 [ 1, %concatenate.pivot.1.15 ]
  %45 = sub nsw i32 1, %44
  %46 = mul nuw nsw i32 %37, 1
  %47 = add nuw nsw i32 0, %46
  br label %concatenate.38.7.merge4

concat_index_from_operand_id27:                   ; preds = %concatenate.pivot.2.16
  %48 = phi i32 [ 2, %concatenate.pivot.2.16 ]
  %49 = sub nsw i32 1, %48
  %param_2.18888 = getelementptr inbounds [4 x [192 x i32]], ptr %arg2, i32 0, i32 %38, i32 %37
  %param_2.18889 = load i32, ptr %param_2.18888, align 4, !invariant.load !297
  %constant_1689_410 = load i32, ptr @395, align 4
  %50 = icmp slt i32 %param_2.18889, %constant_1689_410
  %51 = zext i1 %50 to i8
  %constant_1699_211 = load i32, ptr @394, align 4
  %52 = add i32 %param_2.18889, %constant_1699_211
  %53 = trunc i8 %51 to i1
  %54 = select i1 %53, i32 %52, i32 %param_2.18889
  br label %concatenate.38.7.merge4

concatenate.pivot.1.12:                           ; preds = %concatenate.38.7.merge
  br i1 false, label %concatenate.pivot.0.13, label %concatenate.pivot.2.14

concatenate.pivot.0.13:                           ; preds = %concatenate.pivot.1.12
  br label %concat_index_from_operand_id05

concatenate.pivot.2.14:                           ; preds = %concatenate.pivot.1.12
  br i1 true, label %concatenate.pivot.1.15, label %concatenate.pivot.2.16

concatenate.pivot.1.15:                           ; preds = %concatenate.pivot.2.14
  br label %concat_index_from_operand_id16

concatenate.pivot.2.16:                           ; preds = %concatenate.pivot.2.14
  br label %concat_index_from_operand_id27

concatenate.38.7.merge4:                          ; preds = %concat_index_from_operand_id27, %concat_index_from_operand_id16, %concat_index_from_operand_id05
  %55 = phi i32 [ %43, %concat_index_from_operand_id05 ], [ %47, %concat_index_from_operand_id16 ], [ %54, %concat_index_from_operand_id27 ]
  %56 = add i32 %6, %55
  %57 = icmp ult i32 %55, 192
  %58 = and i1 %34, %57
  %59 = mul nuw nsw i32 %9, 1
  %60 = add nuw nsw i32 0, %59
  %61 = urem i32 %60, 192
  %62 = udiv i32 %60, 192
  %63 = udiv i32 %62, 4
  br label %concatenate.pivot.1.25

concat_index_from_operand_id018:                  ; preds = %concatenate.pivot.0.26
  %64 = phi i32 [ 0, %concatenate.pivot.0.26 ]
  %65 = sub nsw i32 2, %64
  %66 = mul nuw nsw i32 %62, 1
  %67 = add nuw nsw i32 0, %66
  br label %concatenate.38.7.merge17

concat_index_from_operand_id119:                  ; preds = %concatenate.pivot.1.28
  %68 = phi i32 [ 1, %concatenate.pivot.1.28 ]
  %69 = sub nsw i32 2, %68
  %70 = mul nuw nsw i32 %61, 1
  %71 = add nuw nsw i32 0, %70
  br label %concatenate.38.7.merge17

concat_index_from_operand_id220:                  ; preds = %concatenate.pivot.2.29
  %72 = phi i32 [ 2, %concatenate.pivot.2.29 ]
  %73 = sub nsw i32 2, %72
  %param_2.188821 = getelementptr inbounds [4 x [192 x i32]], ptr %arg2, i32 0, i32 %62, i32 %61
  %param_2.188822 = load i32, ptr %param_2.188821, align 4, !invariant.load !297
  %constant_1689_423 = load i32, ptr @395, align 4
  %74 = icmp slt i32 %param_2.188822, %constant_1689_423
  %75 = zext i1 %74 to i8
  %constant_1699_224 = load i32, ptr @394, align 4
  %76 = add i32 %param_2.188822, %constant_1699_224
  %77 = trunc i8 %75 to i1
  %78 = select i1 %77, i32 %76, i32 %param_2.188822
  br label %concatenate.38.7.merge17

concatenate.pivot.1.25:                           ; preds = %concatenate.38.7.merge4
  br i1 false, label %concatenate.pivot.0.26, label %concatenate.pivot.2.27

concatenate.pivot.0.26:                           ; preds = %concatenate.pivot.1.25
  br label %concat_index_from_operand_id018

concatenate.pivot.2.27:                           ; preds = %concatenate.pivot.1.25
  br i1 false, label %concatenate.pivot.1.28, label %concatenate.pivot.2.29

concatenate.pivot.1.28:                           ; preds = %concatenate.pivot.2.27
  br label %concat_index_from_operand_id119

concatenate.pivot.2.29:                           ; preds = %concatenate.pivot.2.27
  br label %concat_index_from_operand_id220

concatenate.38.7.merge17:                         ; preds = %concat_index_from_operand_id220, %concat_index_from_operand_id119, %concat_index_from_operand_id018
  %79 = phi i32 [ %67, %concat_index_from_operand_id018 ], [ %71, %concat_index_from_operand_id119 ], [ %78, %concat_index_from_operand_id220 ]
  %80 = add i32 %4, %79
  %81 = icmp ult i32 %79, 2
  %82 = and i1 %58, %81
  br i1 %82, label %scatter.in_bounds-true, label %scatter.in_bounds-after

scatter.in_bounds-after:                          ; preds = %scatter.in_bounds-true, %concatenate.38.7.merge17
  br label %scatter.7.1.in_bounds-after

scatter.in_bounds-true:                           ; preds = %concatenate.38.7.merge17
  %83 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %32, i32 %56, i32 %80
  %84 = mul nuw nsw i32 %4, 1
  %85 = add nuw nsw i32 0, %84
  %86 = mul nuw nsw i32 %6, 1
  %87 = add nuw nsw i32 0, %86
  %88 = mul nuw nsw i32 %8, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %9, 1
  %91 = add nuw nsw i32 0, %90
  %92 = urem i32 %91, 192
  %93 = udiv i32 %91, 192
  %94 = udiv i32 %93, 4
  %95 = getelementptr i8, ptr %arg1, i32 %linear_index
  %param_1.2275 = getelementptr inbounds i8, ptr %95, i32 0
  %param_1.227530 = load i8, ptr %param_1.2275, align 1, !invariant.load !297
  %constant_1686_2 = load double, ptr @397, align 8
  %constant_1685_20 = load double, ptr @396, align 8
  %96 = trunc i8 %param_1.227530 to i1
  %97 = select i1 %96, double %constant_1686_2, double %constant_1685_20
  store double %97, ptr %input_address, align 8
  %source = load double, ptr %input_address, align 8
  %98 = atomicrmw fadd ptr %83, double %source seq_cst, align 8
  br label %scatter.in_bounds-after
}

define void @input_concatenate_fusion(ptr noalias align 16 dereferenceable(3072) %arg0, ptr noalias align 128 dereferenceable(18432) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index0, 768
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index0, 768
  %10 = icmp ult i32 %linear_index, 768
  br i1 %10, label %input_concatenate_fusion.in_bounds-true, label %input_concatenate_fusion.in_bounds-after

input_concatenate_fusion.in_bounds-after:         ; preds = %input_concatenate_fusion.in_bounds-true, %entry
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %13 = mul nuw nsw i32 %11, 128
  %linear_index1 = add nuw nsw i32 %13, %12
  %linear_index_in_range2 = icmp ult i32 %linear_index1, 768
  call void @llvm.assume(i1 %linear_index_in_range2)
  %linear_index03 = add nuw nsw i32 %linear_index1, 0
  %14 = udiv i32 %linear_index03, 1
  %15 = urem i32 %14, 192
  %16 = udiv i32 %linear_index03, 192
  %17 = urem i32 %16, 4
  %18 = udiv i32 %linear_index03, 768
  %19 = urem i32 %18, 1
  %20 = udiv i32 %linear_index03, 768
  %21 = icmp ult i32 %linear_index1, 768
  br i1 %21, label %input_concatenate_fusion.in_bounds-true4, label %input_concatenate_fusion.in_bounds-after5

input_concatenate_fusion.in_bounds-after5:        ; preds = %input_concatenate_fusion.in_bounds-true4, %input_concatenate_fusion.in_bounds-after
  %22 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %23 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %24 = mul nuw nsw i32 %22, 128
  %linear_index6 = add nuw nsw i32 %24, %23
  %linear_index_in_range7 = icmp ult i32 %linear_index6, 768
  call void @llvm.assume(i1 %linear_index_in_range7)
  %linear_index08 = add nuw nsw i32 %linear_index6, 0
  %25 = udiv i32 %linear_index08, 1
  %26 = urem i32 %25, 192
  %27 = udiv i32 %linear_index08, 192
  %28 = urem i32 %27, 4
  %29 = udiv i32 %linear_index08, 768
  %30 = urem i32 %29, 1
  %31 = udiv i32 %linear_index08, 768
  %32 = icmp ult i32 %linear_index6, 768
  br i1 %32, label %input_concatenate_fusion.in_bounds-true9, label %input_concatenate_fusion.in_bounds-after10

input_concatenate_fusion.in_bounds-after10:       ; preds = %input_concatenate_fusion.in_bounds-true9, %input_concatenate_fusion.in_bounds-after5
  ret void

input_concatenate_fusion.in_bounds-true:          ; preds = %entry
  %33 = add i32 %8, 0
  %34 = mul nuw nsw i32 %6, 1
  %35 = add nuw nsw i32 0, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr %arg1, i32 0, i32 0, i32 %33, i32 %6, i32 %4
  store i64 %36, ptr %37, align 8
  br label %input_concatenate_fusion.in_bounds-after

input_concatenate_fusion.in_bounds-true4:         ; preds = %input_concatenate_fusion.in_bounds-after
  %38 = add i32 %19, 1
  %39 = mul nuw nsw i32 %15, 1
  %40 = add nuw nsw i32 0, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr %arg1, i32 0, i32 0, i32 %38, i32 %17, i32 %15
  store i64 %41, ptr %42, align 8
  br label %input_concatenate_fusion.in_bounds-after5

input_concatenate_fusion.in_bounds-true9:         ; preds = %input_concatenate_fusion.in_bounds-after5
  %43 = add i32 %30, 2
  %44 = getelementptr i32, ptr %arg0, i32 %linear_index6
  %45 = getelementptr inbounds i32, ptr %44, i32 0
  %46 = load i32, ptr %45, align 4, !invariant.load !297
  %constant_1689_2 = load i32, ptr @399, align 4
  %47 = icmp slt i32 %46, %constant_1689_2
  %48 = zext i1 %47 to i8
  %constant_1699_1 = load i32, ptr @398, align 4
  %49 = add i32 %46, %constant_1699_1
  %50 = trunc i8 %48 to i1
  %51 = select i1 %50, i32 %49, i32 %46
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr %arg1, i32 0, i32 0, i32 %43, i32 %28, i32 %26
  store i64 %52, ptr %53, align 8
  br label %input_concatenate_fusion.in_bounds-after10
}

define void @loop_select_slice_fusion(ptr noalias align 16 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(18432) %arg1, ptr noalias align 128 dereferenceable(12288) %arg2, ptr noalias align 128 dereferenceable(24) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(6144) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(12288) %arg7, ptr noalias align 128 dereferenceable(6144) %arg8, ptr noalias align 128 dereferenceable(6144) %arg9) {
entry:
  %return_buffer54 = alloca double, align 8
  %parameter_buffer53 = alloca double, align 8
  %parameter_buffer52 = alloca double, align 8
  %reduce.50.12.inner.invar_address.reduction_dim.049 = alloca i32, align 4
  %accumulator_044 = alloca double, align 8
  %return_buffer43 = alloca double, align 8
  %parameter_buffer42 = alloca double, align 8
  %parameter_buffer41 = alloca double, align 8
  %reduce.48.5.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_038 = alloca double, align 8
  %return_buffer36 = alloca double, align 8
  %parameter_buffer35 = alloca double, align 8
  %parameter_buffer34 = alloca double, align 8
  %reduce.50.12.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_031 = alloca double, align 8
  %return_buffer30 = alloca double, align 8
  %parameter_buffer29 = alloca double, align 8
  %parameter_buffer28 = alloca double, align 8
  %pad_result_addr21 = alloca double, align 8
  %reduce.49.3.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_010 = alloca double, align 8
  %pad_result_addr = alloca double, align 8
  %return_buffer = alloca i8, align 1
  %parameter_buffer1 = alloca i8, align 1
  %parameter_buffer = alloca i8, align 1
  %reduce.47.3.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca i8, align 1
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %loop_select_slice_fusion.in_bounds-true, label %loop_select_slice_fusion.in_bounds-after

loop_select_slice_fusion.in_bounds-after:         ; preds = %reduce.50.12.inner.loop_exit.reduction_dim.046, %entry
  ret void

loop_select_slice_fusion.in_bounds-true:          ; preds = %entry
  %7 = getelementptr i8, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds i8, ptr %7, i32 0
  %9 = load i8, ptr %8, align 1, !invariant.load !297
  %constant_1700_1 = load i8, ptr @403, align 1
  store i8 %constant_1700_1, ptr %accumulator_0, align 1
  store i32 0, ptr %reduce.47.3.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.47.3.inner.loop_header.reduction_dim.0

reduce.47.3.inner.loop_header.reduction_dim.0:    ; preds = %reduce.47.3.inner.loop_body.reduction_dim.0, %loop_select_slice_fusion.in_bounds-true
  %reduce.47.3.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.47.3.inner.invar_address.reduction_dim.0, align 4
  %10 = icmp uge i32 %reduce.47.3.inner.indvar.reduction_dim.0, 3
  br i1 %10, label %reduce.47.3.inner.loop_exit.reduction_dim.0, label %reduce.47.3.inner.loop_body.reduction_dim.0

reduce.47.3.inner.loop_body.reduction_dim.0:      ; preds = %reduce.47.3.inner.loop_header.reduction_dim.0
  %11 = load i8, ptr %accumulator_0, align 1
  %12 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr %arg1, i32 0, i32 0, i32 %reduce.47.3.inner.indvar.reduction_dim.0, i32 %5, i32 %4
  %13 = load i64, ptr %12, align 8, !invariant.load !297
  %constant_1691_1 = load i64, ptr @404, align 8
  %14 = icmp sge i64 %13, %constant_1691_1
  %15 = zext i1 %14 to i8
  %16 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr %arg1, i32 0, i32 0, i32 %reduce.47.3.inner.indvar.reduction_dim.0, i32 %5, i32 %4
  %17 = load i64, ptr %16, align 8, !invariant.load !297
  %18 = getelementptr inbounds [3 x i64], ptr %arg3, i32 0, i32 %reduce.47.3.inner.indvar.reduction_dim.0
  %19 = load i64, ptr %18, align 8, !invariant.load !297
  %20 = icmp sle i64 %17, %19
  %21 = zext i1 %20 to i8
  %22 = and i8 %15, %21
  store i8 %11, ptr %parameter_buffer, align 1
  store i8 %22, ptr %parameter_buffer1, align 1
  call void @and_reduce_sub_computation_557ffb2e5a50_aea6391cb20f9f3e(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %23 = load i8, ptr %return_buffer, align 1
  store i8 %23, ptr %accumulator_0, align 1
  %invar.inc = add nuw nsw i32 %reduce.47.3.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.47.3.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.47.3.inner.loop_header.reduction_dim.0

reduce.47.3.inner.loop_exit.reduction_dim.0:      ; preds = %reduce.47.3.inner.loop_header.reduction_dim.0
  %24 = load i8, ptr %accumulator_0, align 1
  %25 = mul nuw nsw i32 %4, 1
  %26 = add nuw nsw i32 0, %25
  %27 = mul nuw nsw i32 %5, 192
  %28 = add nuw nsw i32 %26, %27
  %29 = udiv i32 %28, 768
  %30 = mul nuw nsw i32 %28, 1
  %31 = add nuw nsw i32 0, %30
  %32 = urem i32 %31, 192
  %33 = udiv i32 %31, 192
  %34 = udiv i32 %33, 4
  %35 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr %arg1, i32 0, i32 0, i32 0, i32 %33, i32 %32
  %36 = load i64, ptr %35, align 8, !invariant.load !297
  %37 = icmp sge i64 0, %36
  %38 = select i1 %37, i64 0, i64 %36
  %39 = icmp sle i64 3, %38
  %40 = select i1 %39, i64 3, i64 %38
  %41 = trunc i64 %40 to i32
  %42 = add i32 0, %41
  %43 = mul nuw nsw i32 %28, 1
  %44 = add nuw nsw i32 0, %43
  %45 = urem i32 %44, 192
  %46 = udiv i32 %44, 192
  %47 = udiv i32 %46, 4
  %48 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr %arg1, i32 0, i32 0, i32 1, i32 %46, i32 %45
  %49 = load i64, ptr %48, align 8, !invariant.load !297
  %50 = icmp sge i64 0, %49
  %51 = select i1 %50, i64 0, i64 %49
  %52 = icmp sle i64 191, %51
  %53 = select i1 %52, i64 191, i64 %51
  %54 = trunc i64 %53 to i32
  %55 = add i32 0, %54
  %56 = mul nuw nsw i32 %28, 1
  %57 = add nuw nsw i32 0, %56
  %58 = urem i32 %57, 192
  %59 = udiv i32 %57, 192
  %60 = udiv i32 %59, 4
  %61 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr %arg1, i32 0, i32 0, i32 2, i32 %59, i32 %58
  %62 = load i64, ptr %61, align 8, !invariant.load !297
  %63 = icmp sge i64 0, %62
  %64 = select i1 %63, i64 0, i64 %62
  %65 = icmp sle i64 1, %64
  %66 = select i1 %65, i64 1, i64 %64
  %67 = trunc i64 %66 to i32
  %68 = add i32 0, %67
  %69 = sub i32 %68, 1
  %70 = icmp sge i32 %69, 0
  %in_bounds = and i1 true, %70
  %71 = urem i32 %69, 1
  %72 = icmp eq i32 0, %71
  %in_bounds2 = and i1 %in_bounds, %72
  %73 = sdiv i32 %69, 1
  %74 = icmp slt i32 %73, 1
  %in_bounds3 = and i1 %in_bounds2, %74
  %75 = sub i32 %55, 0
  %76 = icmp sge i32 %75, 0
  %in_bounds4 = and i1 %in_bounds3, %76
  %77 = urem i32 %75, 1
  %78 = icmp eq i32 0, %77
  %in_bounds5 = and i1 %in_bounds4, %78
  %79 = sdiv i32 %75, 1
  %80 = icmp slt i32 %79, 192
  %in_bounds6 = and i1 %in_bounds5, %80
  %81 = sub i32 %42, 0
  %82 = icmp sge i32 %81, 0
  %in_bounds7 = and i1 %in_bounds6, %82
  %83 = urem i32 %81, 1
  %84 = icmp eq i32 0, %83
  %in_bounds8 = and i1 %in_bounds7, %84
  %85 = sdiv i32 %81, 1
  %86 = icmp slt i32 %85, 4
  %in_bounds9 = and i1 %in_bounds8, %86
  br i1 %in_bounds9, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %87 = load double, ptr %pad_result_addr, align 8
  %constant_1683_3 = load double, ptr @402, align 8
  store double %constant_1683_3, ptr %accumulator_010, align 8
  store i32 0, ptr %reduce.49.3.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.49.3.inner.loop_header.reduction_dim.0

reduce.49.3.inner.loop_header.reduction_dim.0:    ; preds = %in_bounds-after24, %in_bounds-after
  %reduce.49.3.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.49.3.inner.invar_address.reduction_dim.0, align 4
  %88 = icmp uge i32 %reduce.49.3.inner.indvar.reduction_dim.0, 2
  br i1 %88, label %reduce.49.3.inner.loop_exit.reduction_dim.0, label %reduce.49.3.inner.loop_body.reduction_dim.0

reduce.49.3.inner.loop_body.reduction_dim.0:      ; preds = %reduce.49.3.inner.loop_header.reduction_dim.0
  %89 = load double, ptr %accumulator_010, align 8
  %90 = sub i32 %reduce.49.3.inner.indvar.reduction_dim.0, 1
  %91 = icmp sge i32 %90, 0
  %in_bounds12 = and i1 true, %91
  %92 = urem i32 %90, 1
  %93 = icmp eq i32 0, %92
  %in_bounds13 = and i1 %in_bounds12, %93
  %94 = sdiv i32 %90, 1
  %95 = icmp slt i32 %94, 1
  %in_bounds14 = and i1 %in_bounds13, %95
  %96 = sub i32 %55, 0
  %97 = icmp sge i32 %96, 0
  %in_bounds15 = and i1 %in_bounds14, %97
  %98 = urem i32 %96, 1
  %99 = icmp eq i32 0, %98
  %in_bounds16 = and i1 %in_bounds15, %99
  %100 = sdiv i32 %96, 1
  %101 = icmp slt i32 %100, 192
  %in_bounds17 = and i1 %in_bounds16, %101
  %102 = sub i32 %42, 0
  %103 = icmp sge i32 %102, 0
  %in_bounds18 = and i1 %in_bounds17, %103
  %104 = urem i32 %102, 1
  %105 = icmp eq i32 0, %104
  %in_bounds19 = and i1 %in_bounds18, %105
  %106 = sdiv i32 %102, 1
  %107 = icmp slt i32 %106, 4
  %in_bounds20 = and i1 %in_bounds19, %107
  br i1 %in_bounds20, label %in_bounds-true22, label %in_bounds-false23

in_bounds-after24:                                ; preds = %in_bounds-false23, %in_bounds-true22
  %108 = load double, ptr %pad_result_addr21, align 8
  store double %89, ptr %parameter_buffer28, align 8
  store double %108, ptr %parameter_buffer29, align 8
  call void @region_17_4256_557ffa9f0370_e410f936d6284c04(ptr %parameter_buffer28, ptr %parameter_buffer29, ptr %return_buffer30)
  %109 = load double, ptr %return_buffer30, align 8
  store double %109, ptr %accumulator_010, align 8
  %invar.inc11 = add nuw nsw i32 %reduce.49.3.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc11, ptr %reduce.49.3.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.49.3.inner.loop_header.reduction_dim.0

reduce.49.3.inner.loop_exit.reduction_dim.0:      ; preds = %reduce.49.3.inner.loop_header.reduction_dim.0
  %110 = load double, ptr %accumulator_010, align 8
  %subtract.235.11 = fsub double %87, %110
  %constant_1685_232 = load double, ptr @400, align 8
  store double %constant_1685_232, ptr %accumulator_031, align 8
  store i32 0, ptr %reduce.50.12.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.50.12.inner.loop_header.reduction_dim.0

reduce.50.12.inner.loop_header.reduction_dim.0:   ; preds = %reduce.50.12.inner.loop_body.reduction_dim.0, %reduce.49.3.inner.loop_exit.reduction_dim.0
  %reduce.50.12.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.50.12.inner.invar_address.reduction_dim.0, align 4
  %111 = icmp uge i32 %reduce.50.12.inner.indvar.reduction_dim.0, 2
  br i1 %111, label %reduce.50.12.inner.loop_exit.reduction_dim.0, label %reduce.50.12.inner.loop_body.reduction_dim.0

reduce.50.12.inner.loop_body.reduction_dim.0:     ; preds = %reduce.50.12.inner.loop_header.reduction_dim.0
  %112 = load double, ptr %accumulator_031, align 8
  %113 = getelementptr inbounds [2 x [192 x [4 x double]]], ptr %arg2, i32 0, i32 %reduce.50.12.inner.indvar.reduction_dim.0, i32 %55, i32 %42
  %114 = load double, ptr %113, align 8, !invariant.load !297
  store double %112, ptr %parameter_buffer34, align 8
  store double %114, ptr %parameter_buffer35, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %parameter_buffer34, ptr %parameter_buffer35, ptr %return_buffer36)
  %115 = load double, ptr %return_buffer36, align 8
  store double %115, ptr %accumulator_031, align 8
  %invar.inc33 = add nuw nsw i32 %reduce.50.12.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc33, ptr %reduce.50.12.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.50.12.inner.loop_header.reduction_dim.0

reduce.50.12.inner.loop_exit.reduction_dim.0:     ; preds = %reduce.50.12.inner.loop_header.reduction_dim.0
  %116 = load double, ptr %accumulator_031, align 8
  %117 = call double @__nv_log(double %116)
  %subtract.236.7 = fsub double %subtract.235.11, %117
  %constant_1698_1 = load double, ptr @401, align 8
  %118 = trunc i8 %24 to i1
  %119 = select i1 %118, double %subtract.236.7, double %constant_1698_1
  %constant_1685_237 = load double, ptr @400, align 8
  %120 = trunc i8 %9 to i1
  %121 = select i1 %120, double %119, double %constant_1685_237
  %122 = insertvalue { double, double } undef, double %121, 0
  %123 = mul nuw nsw i32 %4, 1
  %124 = add nuw nsw i32 0, %123
  %125 = mul nuw nsw i32 %5, 192
  %126 = add nuw nsw i32 %124, %125
  %127 = urem i32 %126, 4
  %128 = udiv i32 %126, 4
  %129 = udiv i32 %128, 192
  %130 = add i32 %128, 0
  %131 = add i32 %127, 0
  %132 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg7, i32 0, i32 %131, i32 %130, i32 1
  %133 = load double, ptr %132, align 8, !invariant.load !297
  %constant_1685_239 = load double, ptr @400, align 8
  store double %constant_1685_239, ptr %accumulator_038, align 8
  store i32 0, ptr %reduce.48.5.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.48.5.clone.1.inner.loop_header.reduction_dim.0

reduce.48.5.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.48.5.clone.1.inner.loop_body.reduction_dim.0, %reduce.50.12.inner.loop_exit.reduction_dim.0
  %reduce.48.5.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.48.5.clone.1.inner.invar_address.reduction_dim.0, align 4
  %134 = icmp uge i32 %reduce.48.5.clone.1.inner.indvar.reduction_dim.0, 2
  br i1 %134, label %reduce.48.5.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.48.5.clone.1.inner.loop_body.reduction_dim.0

reduce.48.5.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.48.5.clone.1.inner.loop_header.reduction_dim.0
  %135 = load double, ptr %accumulator_038, align 8
  %136 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg7, i32 0, i32 %131, i32 %130, i32 %reduce.48.5.clone.1.inner.indvar.reduction_dim.0
  %137 = load double, ptr %136, align 8, !invariant.load !297
  store double %135, ptr %parameter_buffer41, align 8
  store double %137, ptr %parameter_buffer42, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %parameter_buffer41, ptr %parameter_buffer42, ptr %return_buffer43)
  %138 = load double, ptr %return_buffer43, align 8
  store double %138, ptr %accumulator_038, align 8
  %invar.inc40 = add nuw nsw i32 %reduce.48.5.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc40, ptr %reduce.48.5.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.48.5.clone.1.inner.loop_header.reduction_dim.0

reduce.48.5.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.48.5.clone.1.inner.loop_header.reduction_dim.0
  %139 = load double, ptr %accumulator_038, align 8
  %140 = fneg double %139
  %constant_1685_245 = load double, ptr @400, align 8
  store double %constant_1685_245, ptr %accumulator_044, align 8
  store i32 0, ptr %reduce.50.12.inner.invar_address.reduction_dim.049, align 4
  br label %reduce.50.12.inner.loop_header.reduction_dim.047

reduce.50.12.inner.loop_header.reduction_dim.047: ; preds = %reduce.50.12.inner.loop_body.reduction_dim.048, %reduce.48.5.clone.1.inner.loop_exit.reduction_dim.0
  %reduce.50.12.inner.indvar.reduction_dim.050 = load i32, ptr %reduce.50.12.inner.invar_address.reduction_dim.049, align 4
  %141 = icmp uge i32 %reduce.50.12.inner.indvar.reduction_dim.050, 2
  br i1 %141, label %reduce.50.12.inner.loop_exit.reduction_dim.046, label %reduce.50.12.inner.loop_body.reduction_dim.048

reduce.50.12.inner.loop_body.reduction_dim.048:   ; preds = %reduce.50.12.inner.loop_header.reduction_dim.047
  %142 = load double, ptr %accumulator_044, align 8
  %143 = getelementptr inbounds [2 x [192 x [4 x double]]], ptr %arg2, i32 0, i32 %reduce.50.12.inner.indvar.reduction_dim.050, i32 %130, i32 %131
  %144 = load double, ptr %143, align 8, !invariant.load !297
  store double %142, ptr %parameter_buffer52, align 8
  store double %144, ptr %parameter_buffer53, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %parameter_buffer52, ptr %parameter_buffer53, ptr %return_buffer54)
  %145 = load double, ptr %return_buffer54, align 8
  store double %145, ptr %accumulator_044, align 8
  %invar.inc51 = add nuw nsw i32 %reduce.50.12.inner.indvar.reduction_dim.050, 1
  store i32 %invar.inc51, ptr %reduce.50.12.inner.invar_address.reduction_dim.049, align 4
  br label %reduce.50.12.inner.loop_header.reduction_dim.047

reduce.50.12.inner.loop_exit.reduction_dim.046:   ; preds = %reduce.50.12.inner.loop_header.reduction_dim.047
  %146 = load double, ptr %accumulator_044, align 8
  %divide.594.5.clone.1 = fdiv double %140, %146
  %147 = getelementptr inbounds [2 x [192 x [4 x double]]], ptr %arg2, i32 0, i32 1, i32 %130, i32 %131
  %148 = load double, ptr %147, align 8, !invariant.load !297
  %multiply.2930.1.clone.1 = fmul double %divide.594.5.clone.1, %148
  %add.3842.1.clone.1 = fadd double %133, %multiply.2930.1.clone.1
  %149 = insertvalue { double, double } %122, double %add.3842.1.clone.1, 1
  %150 = extractvalue { double, double } %149, 0
  %151 = getelementptr double, ptr %arg8, i32 %linear_index
  %152 = getelementptr inbounds double, ptr %151, i32 0
  store double %150, ptr %152, align 8
  %153 = mul nuw nsw i32 %4, 1
  %154 = add nuw nsw i32 0, %153
  %155 = mul nuw nsw i32 %5, 192
  %156 = add nuw nsw i32 %154, %155
  %157 = urem i32 %156, 4
  %158 = udiv i32 %156, 4
  %159 = udiv i32 %158, 192
  %160 = extractvalue { double, double } %149, 1
  %161 = getelementptr double, ptr %arg9, i32 %linear_index
  %162 = getelementptr inbounds double, ptr %161, i32 0
  store double %160, ptr %162, align 8
  br label %loop_select_slice_fusion.in_bounds-after

in_bounds-true:                                   ; preds = %reduce.47.3.inner.loop_exit.reduction_dim.0
  %163 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %85
  %164 = load double, ptr %163, align 8, !invariant.load !297
  %165 = getelementptr inbounds [192 x [4 x double]], ptr %arg5, i32 0, i32 %79, i32 %85
  %166 = load double, ptr %165, align 8, !invariant.load !297
  %multiply.2928.3 = fmul double %164, %166
  %167 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %85
  %168 = load double, ptr %167, align 8, !invariant.load !297
  %add.3841.3 = fadd double %multiply.2928.3, %168
  store double %add.3841.3, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %reduce.47.3.inner.loop_exit.reduction_dim.0
  %constant_1685_2 = load double, ptr @400, align 8
  store double %constant_1685_2, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-true22:                                 ; preds = %reduce.49.3.inner.loop_body.reduction_dim.0
  %169 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %106
  %170 = load double, ptr %169, align 8, !invariant.load !297
  %171 = getelementptr inbounds [192 x [4 x double]], ptr %arg5, i32 0, i32 %100, i32 %106
  %172 = load double, ptr %171, align 8, !invariant.load !297
  %multiply.2928.325 = fmul double %170, %172
  %173 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %106
  %174 = load double, ptr %173, align 8, !invariant.load !297
  %add.3841.326 = fadd double %multiply.2928.325, %174
  store double %add.3841.326, ptr %pad_result_addr21, align 8
  br label %in_bounds-after24

in_bounds-false23:                                ; preds = %reduce.49.3.inner.loop_body.reduction_dim.0
  %constant_1685_227 = load double, ptr @400, align 8
  store double %constant_1685_227, ptr %pad_result_addr21, align 8
  br label %in_bounds-after24
}

define internal void @and_reduce_sub_computation_557ffb2e5a50_aea6391cb20f9f3e(ptr dereferenceable(1) %0, ptr dereferenceable(1) %1, ptr dereferenceable(1) %output_arg) {
entry:
  %2 = alloca i8, align 1
  %lhs = load i8, ptr %0, align 1
  %rhs = load i8, ptr %1, align 1
  %3 = and i8 %lhs, %rhs
  store i8 %3, ptr %2, align 1
  %load_ret_value = load i8, ptr %2, align 1
  store i8 %load_ret_value, ptr %output_arg, align 1
  ret void
}

; Function Attrs: nounwind memory(none)
declare double @__nv_log(double) #2

define void @input_multiply_reduce_fusion(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2, ptr noalias align 128 dereferenceable(6144) %arg3, ptr noalias align 128 dereferenceable(3072) %arg4, ptr noalias align 128 dereferenceable(3072) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(6144) %arg8) {
entry:
  %return_buffer28 = alloca double, align 8
  %result_from_other_lane26 = alloca double, align 8
  %return_buffer25 = alloca double, align 8
  %result_from_other_lane23 = alloca double, align 8
  %return_buffer22 = alloca double, align 8
  %result_from_other_lane20 = alloca double, align 8
  %return_buffer19 = alloca double, align 8
  %result_from_other_lane17 = alloca double, align 8
  %return_buffer16 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1685_9 = load double, ptr @409, align 8
  store double %constant_1685_9, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !305
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
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
  %tile_bound.2 = select i1 %8, i32 4, i32 32
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
  br label %loop2.loop_header, !llvm.loop !306

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !309

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %13 = load double, ptr %partial_reduction_result, align 8
  %14 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.2, i32 %thread.id.1
  %15 = addrspacecast ptr addrspace(3) %14 to ptr
  store double %13, ptr %15, align 8
  call void @llvm.nvvm.barrier0()
  %16 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %thread.id.2
  %17 = addrspacecast ptr addrspace(3) %16 to ptr
  %partial_reduction_result15 = load double, ptr %17, align 8
  %18 = bitcast double %partial_reduction_result15 to i64
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane, ptr %return_buffer16)
  %28 = load double, ptr %return_buffer16, align 8
  store double %28, ptr %17, align 8
  %partial_reduction_result18 = load double, ptr %17, align 8
  %29 = bitcast double %partial_reduction_result18 to i64
  %30 = bitcast i64 %29 to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 0
  %34 = extractelement <2 x i32> %33, i64 1
  %35 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 8, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to i64
  %38 = bitcast i64 %37 to double
  store double %38, ptr %result_from_other_lane17, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane17, ptr %return_buffer19)
  %39 = load double, ptr %return_buffer19, align 8
  store double %39, ptr %17, align 8
  %partial_reduction_result21 = load double, ptr %17, align 8
  %40 = bitcast double %partial_reduction_result21 to i64
  %41 = bitcast i64 %40 to <2 x i32>
  %42 = extractelement <2 x i32> %41, i64 0
  %43 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 4, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 0
  %45 = extractelement <2 x i32> %44, i64 1
  %46 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 4, i32 31)
  %47 = insertelement <2 x i32> %44, i32 %46, i64 1
  %48 = bitcast <2 x i32> %47 to i64
  %49 = bitcast i64 %48 to double
  store double %49, ptr %result_from_other_lane20, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane20, ptr %return_buffer22)
  %50 = load double, ptr %return_buffer22, align 8
  store double %50, ptr %17, align 8
  %partial_reduction_result24 = load double, ptr %17, align 8
  %51 = bitcast double %partial_reduction_result24 to i64
  %52 = bitcast i64 %51 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 2, i32 31)
  %55 = insertelement <2 x i32> %52, i32 %54, i64 0
  %56 = extractelement <2 x i32> %55, i64 1
  %57 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 1
  %59 = bitcast <2 x i32> %58 to i64
  %60 = bitcast i64 %59 to double
  store double %60, ptr %result_from_other_lane23, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane23, ptr %return_buffer25)
  %61 = load double, ptr %return_buffer25, align 8
  store double %61, ptr %17, align 8
  %partial_reduction_result27 = load double, ptr %17, align 8
  %62 = bitcast double %partial_reduction_result27 to i64
  %63 = bitcast i64 %62 to <2 x i32>
  %64 = extractelement <2 x i32> %63, i64 0
  %65 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  %66 = insertelement <2 x i32> %63, i32 %65, i64 0
  %67 = extractelement <2 x i32> %66, i64 1
  %68 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %67, i32 1, i32 31)
  %69 = insertelement <2 x i32> %66, i32 %68, i64 1
  %70 = bitcast <2 x i32> %69 to i64
  %71 = bitcast i64 %70 to double
  store double %71, ptr %result_from_other_lane26, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane26, ptr %return_buffer28)
  %72 = load double, ptr %return_buffer28, align 8
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
  %param_1.2304 = getelementptr inbounds [1 x [192 x [4 x double]]], ptr %arg1, i32 0, i32 0, i32 %79, i32 %80
  %param_1.23042 = load double, ptr %param_1.2304, align 8, !invariant.load !297
  %param_0.1615 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i32 0, i32 %79, i32 %80
  %param_0.16153 = load double, ptr %param_0.1615, align 8, !invariant.load !297
  %multiply.2942.3 = fmul double %param_1.23042, %param_0.16153
  store double %multiply.2942.3, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %81 = load double, ptr %return_buffer, align 8
  store double %81, ptr %partial_reduction_result, align 8
  %param_6.1289 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %80
  %param_6.12894 = load double, ptr %param_6.1289, align 8, !invariant.load !297
  %multiply.2933.3.clone.1 = fmul double %param_6.12894, %param_1.23042
  %82 = fneg double %multiply.2933.3.clone.1
  %param_5.1731 = getelementptr inbounds [192 x [4 x float]], ptr %arg5, i32 0, i32 %79, i32 %80
  %param_5.17315 = load float, ptr %param_5.1731, align 4, !invariant.load !297
  %83 = fpext float %param_5.17315 to double
  %multiply.2934.9.clone.1 = fmul double %82, %83
  %param_4.2136 = getelementptr inbounds [192 x [4 x float]], ptr %arg4, i32 0, i32 %79, i32 %80
  %param_4.21366 = load float, ptr %param_4.2136, align 4, !invariant.load !297
  %84 = fpext float %param_4.21366 to double
  %multiply.2935.5.clone.1 = fmul double %multiply.2933.3.clone.1, %84
  %85 = fneg double %multiply.2935.5.clone.1
  %add.3846.7.clone.1 = fadd double %multiply.2934.9.clone.1, %85
  %constant_1686_1_clone_1 = load double, ptr @405, align 8
  %constant_1688_2_clone_1 = load double, ptr @407, align 8
  %param_3.2767 = getelementptr inbounds [192 x [4 x double]], ptr %arg3, i32 0, i32 %79, i32 %80
  %param_3.27677 = load double, ptr %param_3.2767, align 8, !invariant.load !297
  %constant_1687_1_clone_1 = load double, ptr @408, align 8
  %86 = fcmp une double %constant_1688_2_clone_1, %constant_1688_2_clone_1
  %87 = fcmp oeq double %param_3.27677, %param_3.27677
  %88 = fcmp oge double %constant_1688_2_clone_1, %param_3.27677
  %89 = and i1 %87, %88
  %90 = or i1 %86, %89
  %91 = select i1 %90, double %constant_1688_2_clone_1, double %param_3.27677
  %92 = fcmp une double %constant_1687_1_clone_1, %constant_1687_1_clone_1
  %93 = fcmp oeq double %91, %91
  %94 = fcmp ole double %constant_1687_1_clone_1, %91
  %95 = and i1 %93, %94
  %96 = or i1 %92, %95
  %97 = select i1 %96, double %constant_1687_1_clone_1, double %91
  %98 = fneg double %97
  %99 = call double @__nv_exp(double %98)
  %add.3839.1.clone.1 = fadd double %99, %constant_1686_1_clone_1
  %divide.593.3.clone.1 = fdiv double %constant_1686_1_clone_1, %add.3839.1.clone.1
  %subtract.233.1.clone.1 = fsub double %constant_1686_1_clone_1, %divide.593.3.clone.1
  %multiply.2936.1.clone.1 = fmul double %divide.593.3.clone.1, %subtract.233.1.clone.1
  %multiply.2937.5.clone.1 = fmul double %add.3846.7.clone.1, %multiply.2936.1.clone.1
  %param_3.27678 = getelementptr inbounds [192 x [4 x double]], ptr %arg3, i32 0, i32 %79, i32 %80
  %param_3.27679 = load double, ptr %param_3.27678, align 8, !invariant.load !297
  %100 = fcmp une double %constant_1688_2_clone_1, %constant_1688_2_clone_1
  %101 = fcmp oeq double %param_3.27679, %param_3.27679
  %102 = fcmp oge double %constant_1688_2_clone_1, %param_3.27679
  %103 = and i1 %101, %102
  %104 = or i1 %100, %103
  %maximum.42.5.clone.1 = select i1 %104, double %constant_1688_2_clone_1, double %param_3.27679
  %compare.638.3.clone.1 = fcmp oeq double %maximum.42.5.clone.1, %97
  %105 = zext i1 %compare.638.3.clone.1 to i8
  %param_2.3554 = getelementptr inbounds [192 x [4 x double]], ptr %arg2, i32 0, i32 %79, i32 %80
  %param_2.355410 = load double, ptr %param_2.3554, align 8, !invariant.load !297
  %106 = trunc i8 %105 to i1
  %107 = select i1 %106, double %constant_1686_1_clone_1, double %param_2.355410
  %compare.639.3.clone.1 = fcmp oeq double %constant_1687_1_clone_1, %97
  %108 = zext i1 %compare.639.3.clone.1 to i8
  %constant_1696_1_clone_1 = load double, ptr @406, align 8
  %109 = trunc i8 %108 to i1
  %110 = select i1 %109, double %constant_1696_1_clone_1, double %constant_1686_1_clone_1
  %divide.595.5.clone.1 = fdiv double %107, %110
  %multiply.2938.3.clone.1 = fmul double %multiply.2937.5.clone.1, %divide.595.5.clone.1
  %param_3.276711 = getelementptr inbounds [192 x [4 x double]], ptr %arg3, i32 0, i32 %79, i32 %80
  %param_3.276712 = load double, ptr %param_3.276711, align 8, !invariant.load !297
  %compare.640.3.clone.1 = fcmp oeq double %param_3.276712, %maximum.42.5.clone.1
  %111 = zext i1 %compare.640.3.clone.1 to i8
  %param_2.355413 = getelementptr inbounds [192 x [4 x double]], ptr %arg2, i32 0, i32 %79, i32 %80
  %param_2.355414 = load double, ptr %param_2.355413, align 8, !invariant.load !297
  %112 = trunc i8 %111 to i1
  %113 = select i1 %112, double %constant_1686_1_clone_1, double %param_2.355414
  %compare.641.3.clone.1 = fcmp oeq double %constant_1688_2_clone_1, %maximum.42.5.clone.1
  %114 = zext i1 %compare.641.3.clone.1 to i8
  %115 = trunc i8 %114 to i1
  %116 = select i1 %115, double %constant_1696_1_clone_1, double %constant_1686_1_clone_1
  %divide.596.3.clone.1 = fdiv double %113, %116
  %multiply.2939.1.clone.1 = fmul double %multiply.2938.3.clone.1, %divide.596.3.clone.1
  %117 = getelementptr inbounds [192 x [4 x double]], ptr %arg8, i32 0, i32 %79, i32 %80
  store double %multiply.2939.1.clone.1, ptr %117, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %118 = add i32 %tile_origin.2, %thread.id.1
  %output_element_address = getelementptr inbounds [4 x double], ptr %arg7, i32 0, i32 %118
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

define void @input_reduce_fusion_2(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
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
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1685_12 = load double, ptr @410, align 8
  store double %constant_1685_12, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !310
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %thread.id.2 = urem i32 %thread.id.x, 64
  %lane_id = urem i32 %thread.id.x, 32
  %1 = udiv i32 %block.id.x, 1
  %2 = urem i32 %1, 1
  %3 = udiv i32 %block.id.x, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %block.id.x, 1
  %6 = urem i32 %5, 1
  %7 = udiv i32 %block.id.x, 1
  %8 = icmp eq i32 %4, 0
  %tile_bound.2 = select i1 %8, i32 384, i32 512
  %tile_origin.0 = mul i32 %7, 1
  %tile_origin.1 = mul i32 %6, 1
  %tile_origin.2 = mul i32 %4, 512
  %tile_origin.3 = mul i32 %2, 2
  %9 = icmp eq i32 512, %tile_bound.2
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer19)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane20, ptr %return_buffer22)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane23, ptr %return_buffer25)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane26, ptr %return_buffer28)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane29, ptr %return_buffer31)
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
  %66 = icmp uge i32 %loop2.indvar, 512
  br i1 %66, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc = add nuw nsw i32 %loop2.indvar, 64
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
  %77 = udiv i32 %76, 768
  %78 = mul nuw nsw i32 %70, 1
  %79 = add nuw nsw i32 0, %78
  %80 = mul nuw nsw i32 %69, 1
  %81 = add nuw nsw i32 0, %80
  %82 = mul nuw nsw i32 %76, 1
  %83 = add nuw nsw i32 0, %82
  %84 = urem i32 %83, 192
  %85 = udiv i32 %83, 192
  %86 = udiv i32 %85, 4
  %param_0.1618 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %85, i32 %84
  %param_0.16182 = load double, ptr %param_0.1618, align 8, !invariant.load !297
  store double %param_0.16182, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %87 = load double, ptr %return_buffer, align 8
  store double %87, ptr %partial_reduction_result, align 8
  br label %loop3.loop_header, !llvm.loop !311

loop3.loop_exit:                                  ; preds = %loop3.loop_header
  br label %loop2.loop_header, !llvm.loop !312

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %reduce-group-0-true
  store i32 0, ptr %loop2.invar_address6, align 4
  br label %loop2.loop_header4

loop2.loop_header4:                               ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar7 = load i32, ptr %loop2.invar_address6, align 4
  %88 = icmp uge i32 %loop2.indvar7, 512
  br i1 %88, label %loop2.loop_exit3, label %loop2.loop_body5

loop2.loop_body5:                                 ; preds = %loop2.loop_header4
  %invar.inc8 = add nuw nsw i32 %loop2.indvar7, 64
  store i32 %invar.inc8, ptr %loop2.invar_address6, align 4
  %89 = add i32 %loop2.indvar7, %thread.id.2
  %90 = icmp ult i32 %89, %tile_bound.2
  br i1 %90, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %loop3.loop_exit9, %loop2.loop_body5
  br label %loop2.loop_header4, !llvm.loop !313

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
  %100 = udiv i32 %99, 768
  %101 = mul nuw nsw i32 %93, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %92, 1
  %104 = add nuw nsw i32 0, %103
  %105 = mul nuw nsw i32 %99, 1
  %106 = add nuw nsw i32 0, %105
  %107 = urem i32 %106, 192
  %108 = udiv i32 %106, 192
  %109 = udiv i32 %108, 4
  %param_0.161815 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %108, i32 %107
  %param_0.161816 = load double, ptr %param_0.161815, align 8, !invariant.load !297
  store double %param_0.161816, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer17)
  %110 = load double, ptr %return_buffer17, align 8
  store double %110, ptr %partial_reduction_result, align 8
  br label %loop3.loop_header10, !llvm.loop !314

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
  %114 = getelementptr inbounds [1 x [2 x double]], ptr addrspace(3) @shared_cache1, i32 0, i32 0, i32 %65
  %115 = addrspacecast ptr addrspace(3) %114 to ptr
  store double %113, ptr %115, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %116 = getelementptr inbounds [1 x [2 x double]], ptr addrspace(3) @shared_cache1, i32 0, i32 0, i32 %lane_id
  %117 = addrspacecast ptr addrspace(3) %116 to ptr
  store double %constant_1685_12, ptr %initial_value_addr, align 8
  %118 = icmp ult i32 %thread.id.2, 2
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %119, ptr %result_from_other_lane32, ptr %return_buffer34)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %119, ptr %result_from_other_lane35, ptr %return_buffer37)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %119, ptr %result_from_other_lane38, ptr %return_buffer40)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %119, ptr %result_from_other_lane41, ptr %return_buffer43)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %119, ptr %result_from_other_lane44, ptr %return_buffer46)
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

define void @input_add_reduce_fusion_3(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(8) %arg8) {
entry:
  %return_buffer11 = alloca double, align 8
  %result_from_other_lane9 = alloca double, align 8
  %return_buffer8 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1685_14_clone_1 = load double, ptr @414, align 8
  store double %constant_1685_14_clone_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !315
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = udiv i32 %thread.id.x, 4
  %thread.id.1 = urem i32 %1, 8
  %thread.id.2 = urem i32 %thread.id.x, 4
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 1, i32 8
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 8
  %tile_origin.2 = mul i32 %3, 4
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %8 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %8, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 8
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %9 = icmp uge i32 %loop2.indvar, 4
  br i1 %9, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 4
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %10 = add i32 %loop2.indvar, %thread.id.2
  %11 = icmp ult i32 %10, 4
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !316

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !317

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result7 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result7 to i64
  %13 = bitcast i64 %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 2, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 0
  %17 = extractelement <2 x i32> %16, i64 1
  %18 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 2, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to i64
  %21 = bitcast i64 %20 to double
  store double %21, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer8)
  %22 = load double, ptr %return_buffer8, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result10 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result10 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 1, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 1, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane9, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane9, ptr %return_buffer11)
  %33 = load double, ptr %return_buffer11, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %34 = udiv i32 %thread.id.2, 32
  %35 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %35, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %36 = add i32 %tile_origin.0, 0
  %37 = add i32 %tile_origin.1, %loop1.indvar
  %38 = add i32 %tile_origin.2, %10
  %param_4.2121 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %38
  %param_4.21212 = load double, ptr %param_4.2121, align 8, !invariant.load !297
  %constant_1721_1_clone_1 = load double, ptr @412, align 8
  %add.3851.5.clone.1 = fadd double %param_4.21212, %constant_1721_1_clone_1
  %multiply.2955.1.clone.1 = fmul double %add.3851.5.clone.1, %add.3851.5.clone.1
  %constant_1718_1_clone_1 = load double, ptr @417, align 8
  %multiply.2956.1.clone.1 = fmul double %multiply.2955.1.clone.1, %constant_1718_1_clone_1
  %constant_1694_1_clone_1 = load double, ptr @416, align 8
  %add.3867.1.clone.1 = fadd double %multiply.2956.1.clone.1, %constant_1694_1_clone_1
  %constant_1684_3_clone_1 = load double, ptr @415, align 8
  %multiply.2957.1.clone.1 = fmul double %add.3867.1.clone.1, %constant_1684_3_clone_1
  store double %multiply.2957.1.clone.1, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %39 = load double, ptr %return_buffer, align 8
  store double %39, ptr %partial_reduction_result, align 8
  %param_0.3138 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  %param_0.31383 = load double, ptr %param_0.3138, align 8
  %param_3.2758 = load i64, ptr %arg3, align 8, !invariant.load !297
  %40 = sitofp i64 %param_3.2758 to double
  %param_2.3548 = load double, ptr %arg2, align 8, !invariant.load !297
  %multiply.2909.25 = fmul double %40, %param_2.3548
  %constant_1690_7 = load double, ptr @413, align 8
  %multiply.2910.11 = fmul double %multiply.2909.25, %constant_1690_7
  %param_1.4495 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %38
  %param_1.44954 = load double, ptr %param_1.4495, align 8, !invariant.load !297
  %multiply.2913.3 = fmul double %multiply.2910.11, %param_1.44954
  %add.3826.3 = fadd double %param_0.31383, %multiply.2913.3
  %param_5.1712 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %38
  %param_5.17125 = load double, ptr %param_5.1712, align 8, !invariant.load !297
  %param_6.1267 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %38
  %param_6.12676 = load double, ptr %param_6.1267, align 8, !invariant.load !297
  %multiply.2943.1.clone.1 = fmul double %param_5.17125, %param_6.12676
  %constant_1722_1_clone_1 = load double, ptr @411, align 8
  %multiply.2944.1.clone.1 = fmul double %add.3851.5.clone.1, %constant_1722_1_clone_1
  %add.3852.1.clone.1 = fadd double %multiply.2943.1.clone.1, %multiply.2944.1.clone.1
  %multiply.2945.1 = fmul double %multiply.2910.11, %add.3852.1.clone.1
  %add.3854.1 = fadd double %add.3826.3, %multiply.2945.1
  %41 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  store double %add.3854.1, ptr %41, align 8
  %42 = getelementptr inbounds [4 x double], ptr %arg7, i32 0, i32 %38
  store double %add.3852.1.clone.1, ptr %42, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %43 = and i32 %thread.id.2, 3
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %45 = add i32 %tile_origin.1, %thread.id.1
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %arg8, align 8
  br label %reduction_write_output-after
}

define void @input_reduce_fusion_1(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
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
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1685_13 = load double, ptr @418, align 8
  store double %constant_1685_13, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !305
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
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
  %tile_bound.2 = select i1 %8, i32 4, i32 32
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
  br label %loop2.loop_header, !llvm.loop !318

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !319

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %13 = load double, ptr %partial_reduction_result, align 8
  %14 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i32 0, i32 %thread.id.2, i32 %thread.id.1
  %15 = addrspacecast ptr addrspace(3) %14 to ptr
  store double %13, ptr %15, align 8
  call void @llvm.nvvm.barrier0()
  %16 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i32 0, i32 %thread.id.1, i32 %thread.id.2
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane, ptr %return_buffer4)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane5, ptr %return_buffer7)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane8, ptr %return_buffer10)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane11, ptr %return_buffer13)
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
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %17, ptr %result_from_other_lane14, ptr %return_buffer16)
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
  %param_0.1619 = getelementptr inbounds [1 x [192 x [4 x double]]], ptr %arg0, i32 0, i32 0, i32 %79, i32 %80
  %param_0.16192 = load double, ptr %param_0.1619, align 8, !invariant.load !297
  store double %param_0.16192, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %81 = load double, ptr %return_buffer, align 8
  store double %81, ptr %partial_reduction_result, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %82 = add i32 %tile_origin.2, %thread.id.1
  %output_element_address = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %82
  %output = load double, ptr %17, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

define void @input_add_reduce_fusion_5(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %return_buffer14 = alloca double, align 8
  %result_from_other_lane12 = alloca double, align 8
  %return_buffer11 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1685_17_clone_1 = load double, ptr @421, align 8
  store double %constant_1685_17_clone_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !315
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = udiv i32 %thread.id.x, 4
  %thread.id.1 = urem i32 %1, 8
  %thread.id.2 = urem i32 %thread.id.x, 4
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 1, i32 8
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 8
  %tile_origin.2 = mul i32 %3, 4
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %8 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %8, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 8
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %9 = icmp uge i32 %loop2.indvar, 4
  br i1 %9, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 4
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %10 = add i32 %loop2.indvar, %thread.id.2
  %11 = icmp ult i32 %10, 4
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !320

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !321

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result10 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result10 to i64
  %13 = bitcast i64 %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 2, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 0
  %17 = extractelement <2 x i32> %16, i64 1
  %18 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 2, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to i64
  %21 = bitcast i64 %20 to double
  store double %21, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer11)
  %22 = load double, ptr %return_buffer11, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result13 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result13 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 1, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 1, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane12, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane12, ptr %return_buffer14)
  %33 = load double, ptr %return_buffer14, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %34 = udiv i32 %thread.id.2, 32
  %35 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %35, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %36 = add i32 %tile_origin.0, 0
  %37 = add i32 %tile_origin.1, %loop1.indvar
  %38 = add i32 %tile_origin.2, %10
  %param_5.1718 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %38
  %param_5.17182 = load double, ptr %param_5.1718, align 8, !invariant.load !297
  %param_5.17183 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %38
  %param_5.17184 = load double, ptr %param_5.17183, align 8, !invariant.load !297
  %multiply.2958.1.clone.1 = fmul double %param_5.17182, %param_5.17184
  %constant_1693_2_clone_1 = load double, ptr @423, align 8
  %add.3870.1.clone.1 = fadd double %multiply.2958.1.clone.1, %constant_1693_2_clone_1
  %constant_1684_4_clone_1 = load double, ptr @422, align 8
  %multiply.2959.1.clone.1 = fmul double %add.3870.1.clone.1, %constant_1684_4_clone_1
  store double %multiply.2959.1.clone.1, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %39 = load double, ptr %return_buffer, align 8
  store double %39, ptr %partial_reduction_result, align 8
  %param_0.3140 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  %param_0.31405 = load double, ptr %param_0.3140, align 8
  %param_3.2760 = load i64, ptr %arg3, align 8, !invariant.load !297
  %40 = sitofp i64 %param_3.2760 to double
  %param_2.3550 = load double, ptr %arg2, align 8, !invariant.load !297
  %multiply.2909.29 = fmul double %40, %param_2.3550
  %constant_1690_2 = load double, ptr @420, align 8
  %multiply.2910.15 = fmul double %multiply.2909.29, %constant_1690_2
  %param_1.4497 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %38
  %param_1.44976 = load double, ptr %param_1.4497, align 8, !invariant.load !297
  %multiply.2911.5 = fmul double %multiply.2910.15, %param_1.44976
  %add.3822.5 = fadd double %param_0.31405, %multiply.2911.5
  %param_4.2124 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %38
  %param_4.21247 = load double, ptr %param_4.2124, align 8
  %param_5.17188 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %38
  %param_5.17189 = load double, ptr %param_5.17188, align 8, !invariant.load !297
  %constant_1720_2_clone_1 = load double, ptr @419, align 8
  %multiply.2931.3.clone.1 = fmul double %param_5.17189, %constant_1720_2_clone_1
  %add.3844.1.clone.1 = fadd double %param_4.21247, %multiply.2931.3.clone.1
  %multiply.2932.1 = fmul double %multiply.2910.15, %add.3844.1.clone.1
  %add.3845.1 = fadd double %add.3822.5, %multiply.2932.1
  %41 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  store double %add.3845.1, ptr %41, align 8
  %42 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %38
  store double %add.3844.1.clone.1, ptr %42, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %43 = and i32 %thread.id.2, 3
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %45 = add i32 %tile_origin.1, %thread.id.1
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %arg6, align 8
  br label %reduction_write_output-after
}

define void @loop_dynamic_slice_fusion_2(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_dynamic_slice_fusion.2.in_bounds-true, label %loop_dynamic_slice_fusion.2.in_bounds-after

loop_dynamic_slice_fusion.2.in_bounds-after:      ; preds = %loop_dynamic_slice_fusion.2.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.2.in_bounds-true:       ; preds = %entry
  %constant_1660_8 = load i64, ptr @424, align 8
  %5 = load i64, ptr %arg1, align 8, !invariant.load !297
  %6 = sub i64 %constant_1660_8, %5
  %constant_1653_2 = load i64, ptr @426, align 8
  %7 = icmp slt i64 %6, %constant_1653_2
  %8 = zext i1 %7 to i8
  %constant_1661_8 = load i64, ptr @425, align 8
  %9 = load i64, ptr %arg1, align 8, !invariant.load !297
  %10 = sub i64 %constant_1661_8, %9
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, i64 %10, i64 %6
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.1204.2.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.1204.2.start_idx0, %3
  %18 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %17
  %19 = load double, ptr %18, align 8, !invariant.load !297
  %20 = getelementptr double, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %19, ptr %21, align 8
  br label %loop_dynamic_slice_fusion.2.in_bounds-after
}

define void @loop_dynamic_slice_fusion(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
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
  %constant_1660_6 = load i64, ptr @427, align 8
  %5 = load i64, ptr %arg1, align 8, !invariant.load !297
  %6 = sub i64 %constant_1660_6, %5
  %constant_1653_23 = load i64, ptr @429, align 8
  %7 = icmp slt i64 %6, %constant_1653_23
  %8 = zext i1 %7 to i8
  %constant_1661_6 = load i64, ptr @428, align 8
  %9 = load i64, ptr %arg1, align 8, !invariant.load !297
  %10 = sub i64 %constant_1661_6, %9
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, i64 %10, i64 %6
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.1202.1.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.1202.1.start_idx0, %3
  %18 = getelementptr inbounds [192 x i32], ptr %arg0, i32 0, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !297
  %20 = getelementptr i32, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds i32, ptr %20, i32 0
  store i32 %19, ptr %21, align 4
  br label %loop_dynamic_slice_fusion.in_bounds-after
}

define void @loop_dynamic_slice_fusion_4(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 4
  br i1 %6, label %loop_dynamic_slice_fusion.4.in_bounds-true, label %loop_dynamic_slice_fusion.4.in_bounds-after

loop_dynamic_slice_fusion.4.in_bounds-after:      ; preds = %loop_dynamic_slice_fusion.4.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.4.in_bounds-true:       ; preds = %entry
  %constant_1660_27 = load i64, ptr @431, align 8
  %7 = load i64, ptr %arg1, align 8, !invariant.load !297
  %8 = sub i64 %constant_1660_27, %7
  %constant_1653_7 = load i64, ptr @430, align 8
  %9 = icmp slt i64 %8, %constant_1653_7
  %10 = zext i1 %9 to i8
  %constant_1661_27 = load i64, ptr @432, align 8
  %11 = load i64, ptr %arg1, align 8, !invariant.load !297
  %12 = sub i64 %constant_1661_27, %11
  %13 = trunc i8 %10 to i1
  %14 = select i1 %13, i64 %12, i64 %8
  %15 = trunc i64 %14 to i32
  %16 = icmp sge i32 0, %15
  %17 = select i1 %16, i32 0, i32 %15
  %18 = icmp sle i32 191, %17
  %dynamic-slice.1219.1.start_idx0 = select i1 %18, i32 191, i32 %17
  %constant_1653_71 = load i64, ptr @430, align 8
  %19 = trunc i64 %constant_1653_71 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 0, %21
  %dynamic-slice.1219.1.start_idx1 = select i1 %22, i32 0, i32 %21
  %23 = add i32 %dynamic-slice.1219.1.start_idx0, %5
  %24 = add i32 %dynamic-slice.1219.1.start_idx1, %4
  %25 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i32 0, i32 %23, i32 %24
  %26 = load i8, ptr %25, align 1, !invariant.load !297
  %27 = getelementptr i8, ptr %arg2, i32 %linear_index
  %28 = getelementptr inbounds i8, ptr %27, i32 0
  store i8 %26, ptr %28, align 1
  br label %loop_dynamic_slice_fusion.4.in_bounds-after
}

define void @loop_dynamic_slice_fusion_3(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 4
  br i1 %6, label %loop_dynamic_slice_fusion.3.in_bounds-true, label %loop_dynamic_slice_fusion.3.in_bounds-after

loop_dynamic_slice_fusion.3.in_bounds-after:      ; preds = %loop_dynamic_slice_fusion.3.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.3.in_bounds-true:       ; preds = %entry
  %constant_1660_9 = load i64, ptr @434, align 8
  %7 = load i64, ptr %arg1, align 8, !invariant.load !297
  %8 = sub i64 %constant_1660_9, %7
  %constant_1653_20 = load i64, ptr @433, align 8
  %9 = icmp slt i64 %8, %constant_1653_20
  %10 = zext i1 %9 to i8
  %constant_1661_9 = load i64, ptr @435, align 8
  %11 = load i64, ptr %arg1, align 8, !invariant.load !297
  %12 = sub i64 %constant_1661_9, %11
  %13 = trunc i8 %10 to i1
  %14 = select i1 %13, i64 %12, i64 %8
  %15 = trunc i64 %14 to i32
  %16 = icmp sge i32 0, %15
  %17 = select i1 %16, i32 0, i32 %15
  %18 = icmp sle i32 191, %17
  %dynamic-slice.1205.1.start_idx0 = select i1 %18, i32 191, i32 %17
  %constant_1653_201 = load i64, ptr @433, align 8
  %19 = trunc i64 %constant_1653_201 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 0, %21
  %dynamic-slice.1205.1.start_idx1 = select i1 %22, i32 0, i32 %21
  %23 = add i32 %dynamic-slice.1205.1.start_idx0, %5
  %24 = add i32 %dynamic-slice.1205.1.start_idx1, %4
  %25 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i32 0, i32 %23, i32 %24
  %26 = load double, ptr %25, align 8, !invariant.load !297
  %27 = getelementptr double, ptr %arg2, i32 %linear_index
  %28 = getelementptr inbounds double, ptr %27, i32 0
  store double %26, ptr %28, align 8
  br label %loop_dynamic_slice_fusion.3.in_bounds-after
}

define void @loop_add_select_fusion_1(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2, ptr noalias align 128 dereferenceable(6144) %arg3, ptr noalias align 128 dereferenceable(768) %arg4, ptr noalias align 128 dereferenceable(6144) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(6144) %arg7, ptr noalias align 128 dereferenceable(6144) %arg8, ptr noalias align 128 dereferenceable(32) %arg9, ptr noalias align 128 dereferenceable(8) %arg10, ptr noalias align 128 dereferenceable(6144) %arg11, ptr noalias align 128 dereferenceable(6144) %arg12, ptr noalias align 128 dereferenceable(32) %arg13, ptr noalias align 128 dereferenceable(6144) %arg14, ptr noalias align 128 dereferenceable(6144) %arg15, ptr noalias align 128 dereferenceable(32) %arg16, ptr noalias align 128 dereferenceable(3072) %arg17, ptr noalias align 128 dereferenceable(768) %arg18, ptr noalias align 128 dereferenceable(6144) %arg19, ptr noalias align 128 dereferenceable(768) %arg20, ptr noalias align 128 dereferenceable(32) %arg21, ptr noalias align 128 dereferenceable(32) %arg22, ptr noalias align 128 dereferenceable(32) %arg23, ptr noalias align 128 dereferenceable(32) %arg24, ptr noalias align 128 dereferenceable(32) %arg25, ptr noalias align 128 dereferenceable(32) %arg26, ptr noalias align 128 dereferenceable(32) %arg27, ptr noalias align 128 dereferenceable(32) %arg28, ptr noalias align 128 dereferenceable(32) %arg29, ptr noalias align 128 dereferenceable(32) %arg30) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_add_select_fusion.1.in_bounds-true, label %loop_add_select_fusion.1.in_bounds-after

loop_add_select_fusion.1.in_bounds-after:         ; preds = %loop_add_select_fusion.1.in_bounds-true, %entry
  ret void

loop_add_select_fusion.1.in_bounds-true:          ; preds = %entry
  %constant_1660_22 = load i64, ptr @438, align 8
  %5 = load i64, ptr %arg10, align 8, !invariant.load !297
  %6 = sub i64 %constant_1660_22, %5
  %constant_1653_28 = load i64, ptr @437, align 8
  %7 = icmp slt i64 %6, %constant_1653_28
  %8 = zext i1 %7 to i8
  %constant_1661_22 = load i64, ptr @439, align 8
  %9 = load i64, ptr %arg10, align 8, !invariant.load !297
  %10 = sub i64 %constant_1661_22, %9
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, i64 %10, i64 %6
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.1200.9.start_idx0 = select i1 %16, i32 191, i32 %15
  %constant_1653_281 = load i64, ptr @437, align 8
  %17 = trunc i64 %constant_1653_281 to i32
  %18 = icmp sge i32 0, %17
  %19 = select i1 %18, i32 0, i32 %17
  %20 = icmp sle i32 0, %19
  %dynamic-slice.1200.9.start_idx1 = select i1 %20, i32 0, i32 %19
  %21 = add i32 %dynamic-slice.1200.9.start_idx0, 0
  %22 = add i32 %dynamic-slice.1200.9.start_idx1, %3
  %23 = getelementptr inbounds [192 x [4 x i8]], ptr %arg4, i32 0, i32 %21, i32 %22
  %24 = load i8, ptr %23, align 1, !invariant.load !297
  %25 = getelementptr double, ptr %arg0, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  %27 = load double, ptr %26, align 8, !invariant.load !297
  %constant_1655_10 = load double, ptr @436, align 8
  %28 = trunc i8 %24 to i1
  %29 = select i1 %28, double %27, double %constant_1655_10
  %30 = getelementptr double, ptr %arg21, i32 %linear_index
  %31 = getelementptr inbounds double, ptr %30, i32 0
  %32 = load double, ptr %31, align 8, !invariant.load !297
  %33 = trunc i8 %24 to i1
  %34 = select i1 %33, double %32, double %constant_1655_10
  %35 = trunc i64 %12 to i32
  %36 = icmp sge i32 0, %35
  %37 = select i1 %36, i32 0, i32 %35
  %38 = icmp sle i32 191, %37
  %dynamic-slice.1206.11.start_idx0 = select i1 %38, i32 191, i32 %37
  %constant_1653_282 = load i64, ptr @437, align 8
  %39 = trunc i64 %constant_1653_282 to i32
  %40 = icmp sge i32 0, %39
  %41 = select i1 %40, i32 0, i32 %39
  %42 = icmp sle i32 0, %41
  %dynamic-slice.1206.11.start_idx1 = select i1 %42, i32 0, i32 %41
  %43 = add i32 %dynamic-slice.1206.11.start_idx0, 0
  %44 = add i32 %dynamic-slice.1206.11.start_idx1, %3
  %45 = getelementptr inbounds [192 x [4 x i8]], ptr %arg20, i32 0, i32 %43, i32 %44
  %46 = load i8, ptr %45, align 1, !invariant.load !297
  %47 = trunc i64 %12 to i32
  %48 = icmp sge i32 0, %47
  %49 = select i1 %48, i32 0, i32 %47
  %50 = icmp sle i32 191, %49
  %dynamic-slice.1207.7.start_idx0 = select i1 %50, i32 191, i32 %49
  %constant_1653_283 = load i64, ptr @437, align 8
  %51 = trunc i64 %constant_1653_283 to i32
  %52 = icmp sge i32 0, %51
  %53 = select i1 %52, i32 0, i32 %51
  %54 = icmp sle i32 0, %53
  %dynamic-slice.1207.7.start_idx1 = select i1 %54, i32 0, i32 %53
  %55 = add i32 %dynamic-slice.1207.7.start_idx0, 0
  %56 = add i32 %dynamic-slice.1207.7.start_idx1, %3
  %57 = getelementptr inbounds [192 x [4 x double]], ptr %arg19, i32 0, i32 %55, i32 %56
  %58 = load double, ptr %57, align 8, !invariant.load !297
  %59 = trunc i64 %12 to i32
  %60 = icmp sge i32 0, %59
  %61 = select i1 %60, i32 0, i32 %59
  %62 = icmp sle i32 191, %61
  %dynamic-slice.1208.19.start_idx0 = select i1 %62, i32 191, i32 %61
  %constant_1653_284 = load i64, ptr @437, align 8
  %63 = trunc i64 %constant_1653_284 to i32
  %64 = icmp sge i32 0, %63
  %65 = select i1 %64, i32 0, i32 %63
  %66 = icmp sle i32 0, %65
  %dynamic-slice.1208.19.start_idx1 = select i1 %66, i32 0, i32 %65
  %67 = add i32 %dynamic-slice.1208.19.start_idx0, 0
  %68 = add i32 %dynamic-slice.1208.19.start_idx1, %3
  %69 = getelementptr inbounds [192 x [4 x i8]], ptr %arg18, i32 0, i32 %67, i32 %68
  %70 = load i8, ptr %69, align 1, !invariant.load !297
  %71 = trunc i64 %12 to i32
  %72 = icmp sge i32 0, %71
  %73 = select i1 %72, i32 0, i32 %71
  %74 = icmp sle i32 191, %73
  %dynamic-slice.1209.26.start_idx0 = select i1 %74, i32 191, i32 %73
  %constant_1653_285 = load i64, ptr @437, align 8
  %75 = trunc i64 %constant_1653_285 to i32
  %76 = icmp sge i32 0, %75
  %77 = select i1 %76, i32 0, i32 %75
  %78 = icmp sle i32 0, %77
  %dynamic-slice.1209.26.start_idx1 = select i1 %78, i32 0, i32 %77
  %79 = add i32 %dynamic-slice.1209.26.start_idx0, 0
  %80 = add i32 %dynamic-slice.1209.26.start_idx1, %3
  %81 = getelementptr inbounds [192 x [4 x i32]], ptr %arg17, i32 0, i32 %79, i32 %80
  %82 = load i32, ptr %81, align 4, !invariant.load !297
  %constant_1656_7 = load i32, ptr @440, align 4
  %83 = icmp eq i32 %82, %constant_1656_7
  %84 = zext i1 %83 to i8
  %85 = getelementptr double, ptr %arg16, i32 %linear_index
  %86 = getelementptr inbounds double, ptr %85, i32 0
  %87 = load double, ptr %86, align 8, !invariant.load !297
  %88 = trunc i8 %24 to i1
  %89 = select i1 %88, double %87, double %constant_1655_10
  %90 = trunc i8 %84 to i1
  %91 = select i1 %90, double %89, double %constant_1655_10
  %92 = trunc i8 %70 to i1
  %93 = select i1 %92, double %91, double %constant_1655_10
  %94 = trunc i64 %12 to i32
  %95 = icmp sge i32 0, %94
  %96 = select i1 %95, i32 0, i32 %94
  %97 = icmp sle i32 191, %96
  %dynamic-slice.1210.28.start_idx0 = select i1 %97, i32 191, i32 %96
  %constant_1653_286 = load i64, ptr @437, align 8
  %98 = trunc i64 %constant_1653_286 to i32
  %99 = icmp sge i32 0, %98
  %100 = select i1 %99, i32 0, i32 %98
  %101 = icmp sle i32 0, %100
  %dynamic-slice.1210.28.start_idx1 = select i1 %101, i32 0, i32 %100
  %102 = add i32 %dynamic-slice.1210.28.start_idx0, 0
  %103 = add i32 %dynamic-slice.1210.28.start_idx1, %3
  %104 = getelementptr inbounds [192 x [4 x double]], ptr %arg12, i32 0, i32 %102, i32 %103
  %105 = load double, ptr %104, align 8, !invariant.load !297
  %multiply.2798.11 = fmul double %93, %105
  %106 = fneg double %multiply.2798.11
  %multiply.2799.9 = fmul double %58, %106
  %107 = trunc i64 %12 to i32
  %108 = icmp sge i32 0, %107
  %109 = select i1 %108, i32 0, i32 %107
  %110 = icmp sle i32 191, %109
  %dynamic-slice.1211.7.start_idx0 = select i1 %110, i32 191, i32 %109
  %constant_1653_287 = load i64, ptr @437, align 8
  %111 = trunc i64 %constant_1653_287 to i32
  %112 = icmp sge i32 0, %111
  %113 = select i1 %112, i32 0, i32 %111
  %114 = icmp sle i32 0, %113
  %dynamic-slice.1211.7.start_idx1 = select i1 %114, i32 0, i32 %113
  %115 = add i32 %dynamic-slice.1211.7.start_idx0, 0
  %116 = add i32 %dynamic-slice.1211.7.start_idx1, %3
  %117 = getelementptr inbounds [192 x [4 x double]], ptr %arg15, i32 0, i32 %115, i32 %116
  %118 = load double, ptr %117, align 8, !invariant.load !297
  %multiply.2800.9 = fmul double %118, %multiply.2798.11
  %add.3722.7 = fadd double %multiply.2799.9, %multiply.2800.9
  %119 = trunc i8 %46 to i1
  %120 = select i1 %119, double %add.3722.7, double %constant_1655_10
  %121 = trunc i64 %12 to i32
  %122 = icmp sge i32 0, %121
  %123 = select i1 %122, i32 0, i32 %121
  %124 = icmp sle i32 191, %123
  %dynamic-slice.1212.7.start_idx0 = select i1 %124, i32 191, i32 %123
  %constant_1653_288 = load i64, ptr @437, align 8
  %125 = trunc i64 %constant_1653_288 to i32
  %126 = icmp sge i32 0, %125
  %127 = select i1 %126, i32 0, i32 %125
  %128 = icmp sle i32 0, %127
  %dynamic-slice.1212.7.start_idx1 = select i1 %128, i32 0, i32 %127
  %129 = add i32 %dynamic-slice.1212.7.start_idx0, 0
  %130 = add i32 %dynamic-slice.1212.7.start_idx1, %3
  %131 = getelementptr inbounds [192 x [4 x double]], ptr %arg14, i32 0, i32 %129, i32 %130
  %132 = load double, ptr %131, align 8, !invariant.load !297
  %133 = getelementptr double, ptr %arg13, i32 %linear_index
  %134 = getelementptr inbounds double, ptr %133, i32 0
  %135 = load double, ptr %134, align 8, !invariant.load !297
  %136 = trunc i8 %24 to i1
  %137 = select i1 %136, double %135, double %constant_1655_10
  %multiply.2801.17 = fmul double %137, %105
  %138 = trunc i64 %12 to i32
  %139 = icmp sge i32 0, %138
  %140 = select i1 %139, i32 0, i32 %138
  %141 = icmp sle i32 191, %140
  %dynamic-slice.1213.13.start_idx0 = select i1 %141, i32 191, i32 %140
  %constant_1653_289 = load i64, ptr @437, align 8
  %142 = trunc i64 %constant_1653_289 to i32
  %143 = icmp sge i32 0, %142
  %144 = select i1 %143, i32 0, i32 %142
  %145 = icmp sle i32 0, %144
  %dynamic-slice.1213.13.start_idx1 = select i1 %145, i32 0, i32 %144
  %146 = add i32 %dynamic-slice.1213.13.start_idx0, 0
  %147 = add i32 %dynamic-slice.1213.13.start_idx1, %3
  %148 = getelementptr inbounds [192 x [4 x double]], ptr %arg11, i32 0, i32 %146, i32 %147
  %149 = load double, ptr %148, align 8, !invariant.load !297
  %multiply.2802.13 = fmul double %multiply.2801.17, %149
  %multiply.2803.7 = fmul double %132, %multiply.2802.13
  %add.3723.7 = fadd double %120, %multiply.2803.7
  %add.3724.5 = fadd double %34, %add.3723.7
  %150 = trunc i64 %12 to i32
  %151 = icmp sge i32 0, %150
  %152 = select i1 %151, i32 0, i32 %150
  %153 = icmp sle i32 191, %152
  %dynamic-slice.1214.4.start_idx0 = select i1 %153, i32 191, i32 %152
  %constant_1653_2810 = load i64, ptr @437, align 8
  %154 = trunc i64 %constant_1653_2810 to i32
  %155 = icmp sge i32 0, %154
  %156 = select i1 %155, i32 0, i32 %154
  %157 = icmp sle i32 0, %156
  %dynamic-slice.1214.4.start_idx1 = select i1 %157, i32 0, i32 %156
  %158 = add i32 %dynamic-slice.1214.4.start_idx0, 0
  %159 = add i32 %dynamic-slice.1214.4.start_idx1, %3
  %160 = getelementptr inbounds [192 x [4 x double]], ptr %arg2, i32 0, i32 %158, i32 %159
  %161 = load double, ptr %160, align 8, !invariant.load !297
  %multiply.2804.5 = fmul double %add.3724.5, %161
  %162 = trunc i64 %12 to i32
  %163 = icmp sge i32 0, %162
  %164 = select i1 %163, i32 0, i32 %162
  %165 = icmp sle i32 191, %164
  %dynamic-slice.1215.5.start_idx0 = select i1 %165, i32 191, i32 %164
  %constant_1653_2811 = load i64, ptr @437, align 8
  %166 = trunc i64 %constant_1653_2811 to i32
  %167 = icmp sge i32 0, %166
  %168 = select i1 %167, i32 0, i32 %166
  %169 = icmp sle i32 0, %168
  %dynamic-slice.1215.5.start_idx1 = select i1 %169, i32 0, i32 %168
  %170 = add i32 %dynamic-slice.1215.5.start_idx0, 0
  %171 = add i32 %dynamic-slice.1215.5.start_idx1, %3
  %172 = getelementptr inbounds [192 x [4 x double]], ptr %arg1, i32 0, i32 %170, i32 %171
  %173 = load double, ptr %172, align 8, !invariant.load !297
  %multiply.2805.3 = fmul double %multiply.2804.5, %173
  %174 = fneg double %multiply.2805.3
  %add.3725.3 = fadd double %29, %174
  %175 = getelementptr double, ptr %arg6, i32 %linear_index
  %176 = getelementptr inbounds double, ptr %175, i32 0
  %177 = load double, ptr %176, align 8, !invariant.load !297
  %178 = trunc i64 %12 to i32
  %179 = icmp sge i32 0, %178
  %180 = select i1 %179, i32 0, i32 %178
  %181 = icmp sle i32 191, %180
  %dynamic-slice.1201.9.start_idx0 = select i1 %181, i32 191, i32 %180
  %constant_1653_2812 = load i64, ptr @437, align 8
  %182 = trunc i64 %constant_1653_2812 to i32
  %183 = icmp sge i32 0, %182
  %184 = select i1 %183, i32 0, i32 %182
  %185 = icmp sle i32 0, %184
  %dynamic-slice.1201.9.start_idx1 = select i1 %185, i32 0, i32 %184
  %186 = add i32 %dynamic-slice.1201.9.start_idx0, 0
  %187 = add i32 %dynamic-slice.1201.9.start_idx1, %3
  %188 = getelementptr inbounds [192 x [4 x double]], ptr %arg7, i32 0, i32 %186, i32 %187
  %189 = load double, ptr %188, align 8, !invariant.load !297
  %add.3721.9 = fadd double %177, %189
  %190 = trunc i8 %24 to i1
  %191 = select i1 %190, double %add.3721.9, double %constant_1655_10
  %192 = getelementptr double, ptr %arg9, i32 %linear_index
  %193 = getelementptr inbounds double, ptr %192, i32 0
  %194 = load double, ptr %193, align 8, !invariant.load !297
  %195 = trunc i8 %24 to i1
  %196 = select i1 %195, double %194, double %constant_1655_10
  %multiply.2806.9 = fmul double %173, %add.3724.5
  %197 = trunc i64 %12 to i32
  %198 = icmp sge i32 0, %197
  %199 = select i1 %198, i32 0, i32 %197
  %200 = icmp sle i32 191, %199
  %dynamic-slice.1216.5.start_idx0 = select i1 %200, i32 191, i32 %199
  %constant_1653_2813 = load i64, ptr @437, align 8
  %201 = trunc i64 %constant_1653_2813 to i32
  %202 = icmp sge i32 0, %201
  %203 = select i1 %202, i32 0, i32 %201
  %204 = icmp sle i32 0, %203
  %dynamic-slice.1216.5.start_idx1 = select i1 %204, i32 0, i32 %203
  %205 = add i32 %dynamic-slice.1216.5.start_idx0, 0
  %206 = add i32 %dynamic-slice.1216.5.start_idx1, %3
  %207 = getelementptr inbounds [192 x [4 x double]], ptr %arg8, i32 0, i32 %205, i32 %206
  %208 = load double, ptr %207, align 8, !invariant.load !297
  %multiply.2807.7 = fmul double %multiply.2806.9, %208
  %add.3726.5 = fadd double %196, %multiply.2807.7
  %add.3727.5 = fadd double %191, %add.3726.5
  %209 = trunc i64 %12 to i32
  %210 = icmp sge i32 0, %209
  %211 = select i1 %210, i32 0, i32 %209
  %212 = icmp sle i32 191, %211
  %dynamic-slice.1217.5.start_idx0 = select i1 %212, i32 191, i32 %211
  %constant_1653_2814 = load i64, ptr @437, align 8
  %213 = trunc i64 %constant_1653_2814 to i32
  %214 = icmp sge i32 0, %213
  %215 = select i1 %214, i32 0, i32 %213
  %216 = icmp sle i32 0, %215
  %dynamic-slice.1217.5.start_idx1 = select i1 %216, i32 0, i32 %215
  %217 = add i32 %dynamic-slice.1217.5.start_idx0, 0
  %218 = add i32 %dynamic-slice.1217.5.start_idx1, %3
  %219 = getelementptr inbounds [192 x [4 x double]], ptr %arg5, i32 0, i32 %217, i32 %218
  %220 = load double, ptr %219, align 8, !invariant.load !297
  %multiply.2808.5 = fmul double %add.3727.5, %220
  %multiply.2809.5 = fmul double %multiply.2808.5, %161
  %221 = trunc i64 %12 to i32
  %222 = icmp sge i32 0, %221
  %223 = select i1 %222, i32 0, i32 %221
  %224 = icmp sle i32 191, %223
  %dynamic-slice.1218.3.start_idx0 = select i1 %224, i32 191, i32 %223
  %constant_1653_2815 = load i64, ptr @437, align 8
  %225 = trunc i64 %constant_1653_2815 to i32
  %226 = icmp sge i32 0, %225
  %227 = select i1 %226, i32 0, i32 %225
  %228 = icmp sle i32 0, %227
  %dynamic-slice.1218.3.start_idx1 = select i1 %228, i32 0, i32 %227
  %229 = add i32 %dynamic-slice.1218.3.start_idx0, 0
  %230 = add i32 %dynamic-slice.1218.3.start_idx1, %3
  %231 = getelementptr inbounds [192 x [4 x double]], ptr %arg3, i32 0, i32 %229, i32 %230
  %232 = load double, ptr %231, align 8, !invariant.load !297
  %multiply.2810.3 = fmul double %multiply.2809.5, %232
  %233 = fneg double %multiply.2810.3
  %add.3728.1 = fadd double %add.3725.3, %233
  %234 = insertvalue { double, double, double, double, double } undef, double %add.3728.1, 0
  %235 = getelementptr double, ptr %arg22, i32 %linear_index
  %236 = getelementptr inbounds double, ptr %235, i32 0
  %237 = load double, ptr %236, align 8, !invariant.load !297
  %238 = trunc i8 %24 to i1
  %239 = select i1 %238, double %constant_1655_10, double %237
  %240 = insertvalue { double, double, double, double, double } %234, double %239, 1
  %241 = getelementptr double, ptr %arg23, i32 %linear_index
  %242 = getelementptr inbounds double, ptr %241, i32 0
  %243 = load double, ptr %242, align 8, !invariant.load !297
  %244 = trunc i8 %24 to i1
  %245 = select i1 %244, double %constant_1655_10, double %243
  %246 = insertvalue { double, double, double, double, double } %240, double %245, 2
  %247 = getelementptr double, ptr %arg24, i32 %linear_index
  %248 = getelementptr inbounds double, ptr %247, i32 0
  %249 = load double, ptr %248, align 8, !invariant.load !297
  %250 = trunc i8 %24 to i1
  %251 = select i1 %250, double %constant_1655_10, double %249
  %252 = insertvalue { double, double, double, double, double } %246, double %251, 3
  %253 = getelementptr double, ptr %arg25, i32 %linear_index
  %254 = getelementptr inbounds double, ptr %253, i32 0
  %255 = load double, ptr %254, align 8, !invariant.load !297
  %256 = trunc i8 %24 to i1
  %257 = select i1 %256, double %constant_1655_10, double %255
  %258 = insertvalue { double, double, double, double, double } %252, double %257, 4
  %259 = extractvalue { double, double, double, double, double } %258, 0
  %260 = getelementptr double, ptr %arg26, i32 %linear_index
  %261 = getelementptr inbounds double, ptr %260, i32 0
  store double %259, ptr %261, align 8
  %262 = extractvalue { double, double, double, double, double } %258, 1
  %263 = getelementptr double, ptr %arg27, i32 %linear_index
  %264 = getelementptr inbounds double, ptr %263, i32 0
  store double %262, ptr %264, align 8
  %265 = extractvalue { double, double, double, double, double } %258, 2
  %266 = getelementptr double, ptr %arg28, i32 %linear_index
  %267 = getelementptr inbounds double, ptr %266, i32 0
  store double %265, ptr %267, align 8
  %268 = extractvalue { double, double, double, double, double } %258, 3
  %269 = getelementptr double, ptr %arg29, i32 %linear_index
  %270 = getelementptr inbounds double, ptr %269, i32 0
  store double %268, ptr %270, align 8
  %271 = extractvalue { double, double, double, double, double } %258, 4
  %272 = getelementptr double, ptr %arg30, i32 %linear_index
  %273 = getelementptr inbounds double, ptr %272, i32 0
  store double %271, ptr %273, align 8
  br label %loop_add_select_fusion.1.in_bounds-after
}

define void @loop_multiply_negate_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_multiply_negate_fusion.in_bounds-true, label %loop_multiply_negate_fusion.in_bounds-after

loop_multiply_negate_fusion.in_bounds-after:      ; preds = %loop_multiply_negate_fusion.in_bounds-true, %entry
  ret void

loop_multiply_negate_fusion.in_bounds-true:       ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = load double, ptr %arg3, align 8, !invariant.load !297
  %9 = getelementptr double, ptr %arg2, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !297
  %12 = getelementptr double, ptr %arg1, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !297
  %multiply.2791.3.clone.1 = fmul double %11, %14
  %15 = fneg double %multiply.2791.3.clone.1
  %multiply.2793.1.clone.1 = fmul double %8, %15
  %16 = getelementptr double, ptr %arg1, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !297
  %multiply.2794.1.clone.1 = fmul double %multiply.2793.1.clone.1, %18
  %multiply.2795.1 = fmul double %7, %multiply.2794.1.clone.1
  %19 = insertvalue { double, double, double } undef, double %multiply.2795.1, 0
  %20 = insertvalue { double, double, double } %19, double %multiply.2794.1.clone.1, 1
  %21 = getelementptr double, ptr %arg1, i32 %linear_index
  %22 = getelementptr inbounds double, ptr %21, i32 0
  %23 = load double, ptr %22, align 8, !invariant.load !297
  %multiply.2792.1.clone.1 = fmul double %15, %23
  %24 = fneg double %multiply.2792.1.clone.1
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
  br label %loop_multiply_negate_fusion.in_bounds-after
}

define void @loop_broadcast_multiply_select_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_broadcast_multiply_select_fusion.in_bounds-true, label %loop_broadcast_multiply_select_fusion.in_bounds-after

loop_broadcast_multiply_select_fusion.in_bounds-after: ; preds = %loop_broadcast_multiply_select_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_multiply_select_fusion.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = getelementptr i8, ptr %arg2, i32 %linear_index
  %9 = getelementptr inbounds i8, ptr %8, i32 0
  %10 = load i8, ptr %9, align 1, !invariant.load !297
  %11 = getelementptr double, ptr %arg3, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !297
  %constant_1182_2_clone_1 = load double, ptr @441, align 8
  %14 = trunc i8 %10 to i1
  %15 = select i1 %14, double %13, double %constant_1182_2_clone_1
  %16 = load double, ptr %arg1, align 8, !invariant.load !297
  %multiply.2796.1 = fmul double %15, %16
  %multiply.2797.1 = fmul double %7, %multiply.2796.1
  %17 = insertvalue { double, double, double } undef, double %multiply.2797.1, 0
  %18 = insertvalue { double, double, double } %17, double %15, 1
  %19 = insertvalue { double, double, double } %18, double %constant_1182_2_clone_1, 2
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
  br label %loop_broadcast_multiply_select_fusion.in_bounds-after
}

define void @loop_add_select_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(6144) %arg3, ptr noalias align 128 dereferenceable(768) %arg4, ptr noalias align 128 dereferenceable(768) %arg5, ptr noalias align 128 dereferenceable(6144) %arg6, ptr noalias align 128 dereferenceable(3072) %arg7, ptr noalias align 128 dereferenceable(8) %arg8, ptr noalias align 128 dereferenceable(6144) %arg9, ptr noalias align 128 dereferenceable(32) %arg10, ptr noalias align 128 dereferenceable(6144) %arg11, ptr noalias align 128 dereferenceable(6144) %arg12, ptr noalias align 128 dereferenceable(6144) %arg13, ptr noalias align 128 dereferenceable(32) %arg14, ptr noalias align 128 dereferenceable(6144) %arg15, ptr noalias align 128 dereferenceable(768) %arg16, ptr noalias align 128 dereferenceable(768) %arg17, ptr noalias align 128 dereferenceable(32) %arg18, ptr noalias align 128 dereferenceable(6144) %arg19, ptr noalias align 128 dereferenceable(768) %arg20, ptr noalias align 128 dereferenceable(6144) %arg21, ptr noalias align 128 dereferenceable(6144) %arg22, ptr noalias align 128 dereferenceable(32) %arg23, ptr noalias align 128 dereferenceable(6144) %arg24, ptr noalias align 128 dereferenceable(6144) %arg25, ptr noalias align 128 dereferenceable(6144) %arg26, ptr noalias align 128 dereferenceable(32) %arg27, ptr noalias align 128 dereferenceable(6144) %arg28, ptr noalias align 128 dereferenceable(6144) %arg29, ptr noalias align 128 dereferenceable(6144) %arg30, ptr noalias align 128 dereferenceable(32) %arg31, ptr noalias align 128 dereferenceable(32) %arg32, ptr noalias align 128 dereferenceable(6144) %arg33, ptr noalias align 128 dereferenceable(6144) %arg34, ptr noalias align 128 dereferenceable(1536) %arg35, ptr noalias align 128 dereferenceable(6144) %arg36, ptr noalias align 128 dereferenceable(32) %arg37, ptr noalias align 128 dereferenceable(32) %arg38, ptr noalias align 128 dereferenceable(6144) %arg39, ptr noalias align 128 dereferenceable(6144) %arg40, ptr noalias align 128 dereferenceable(6144) %arg41, ptr noalias align 128 dereferenceable(6144) %arg42, ptr noalias align 128 dereferenceable(6144) %arg43, ptr noalias align 128 dereferenceable(32) %arg44, ptr noalias align 128 dereferenceable(6144) %arg45, ptr noalias align 128 dereferenceable(32) %arg46, ptr noalias align 128 dereferenceable(32) %arg47, ptr noalias align 128 dereferenceable(6144) %arg48, ptr noalias align 128 dereferenceable(32) %arg49, ptr noalias align 128 dereferenceable(6144) %arg50, ptr noalias align 128 dereferenceable(32) %arg51, ptr noalias align 128 dereferenceable(32) %arg52, ptr noalias align 128 dereferenceable(6144) %arg53, ptr noalias align 128 dereferenceable(6144) %arg54, ptr noalias align 128 dereferenceable(6144) %arg55, ptr noalias align 128 dereferenceable(6144) %arg56, ptr noalias align 128 dereferenceable(768) %arg57, ptr noalias align 128 dereferenceable(32) %arg58, ptr noalias align 128 dereferenceable(768) %arg59, ptr noalias align 128 dereferenceable(32) %arg60, ptr noalias align 128 dereferenceable(32) %arg61, ptr noalias align 128 dereferenceable(6144) %arg62, ptr noalias align 128 dereferenceable(32) %arg63, ptr noalias align 128 dereferenceable(32) %arg64, ptr noalias align 128 dereferenceable(6144) %arg65, ptr noalias align 128 dereferenceable(6144) %arg66, ptr noalias align 128 dereferenceable(6144) %arg67, ptr noalias align 128 dereferenceable(768) %arg68, ptr noalias align 128 dereferenceable(32) %arg69, ptr noalias align 128 dereferenceable(32) %arg70, ptr noalias align 128 dereferenceable(32) %arg71, ptr noalias align 128 dereferenceable(6144) %arg72, ptr noalias align 128 dereferenceable(6144) %arg73, ptr noalias align 128 dereferenceable(32) %arg74, ptr noalias align 128 dereferenceable(6144) %arg75, ptr noalias align 128 dereferenceable(32) %arg76, ptr noalias align 128 dereferenceable(6144) %arg77) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_add_select_fusion.in_bounds-true, label %loop_add_select_fusion.in_bounds-after

loop_add_select_fusion.in_bounds-after:           ; preds = %loop_add_select_fusion.in_bounds-true, %entry
  ret void

loop_add_select_fusion.in_bounds-true:            ; preds = %entry
  %constant_1660_3 = load i64, ptr @444, align 8
  %5 = load i64, ptr %arg8, align 8, !invariant.load !297
  %6 = sub i64 %constant_1660_3, %5
  %constant_1653_17 = load i64, ptr @443, align 8
  %7 = icmp slt i64 %6, %constant_1653_17
  %8 = zext i1 %7 to i8
  %constant_1661_3 = load i64, ptr @445, align 8
  %9 = load i64, ptr %arg8, align 8, !invariant.load !297
  %10 = sub i64 %constant_1661_3, %9
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, i64 %10, i64 %6
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.1200.19.start_idx0 = select i1 %16, i32 191, i32 %15
  %constant_1653_171 = load i64, ptr @443, align 8
  %17 = trunc i64 %constant_1653_171 to i32
  %18 = icmp sge i32 0, %17
  %19 = select i1 %18, i32 0, i32 %17
  %20 = icmp sle i32 0, %19
  %dynamic-slice.1200.19.start_idx1 = select i1 %20, i32 0, i32 %19
  %21 = add i32 %dynamic-slice.1200.19.start_idx0, 0
  %22 = add i32 %dynamic-slice.1200.19.start_idx1, %3
  %23 = getelementptr inbounds [192 x [4 x i8]], ptr %arg5, i32 0, i32 %21, i32 %22
  %24 = load i8, ptr %23, align 1, !invariant.load !297
  %constant_1655_22 = load double, ptr @442, align 8
  %25 = getelementptr double, ptr %arg0, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  %27 = load double, ptr %26, align 8
  %28 = trunc i8 %24 to i1
  %29 = select i1 %28, double %constant_1655_22, double %27
  %30 = trunc i64 %12 to i32
  %31 = icmp sge i32 0, %30
  %32 = select i1 %31, i32 0, i32 %30
  %33 = icmp sle i32 191, %32
  %dynamic-slice.1240.2.start_idx0 = select i1 %33, i32 191, i32 %32
  %constant_1653_172 = load i64, ptr @443, align 8
  %34 = trunc i64 %constant_1653_172 to i32
  %35 = icmp sge i32 0, %34
  %36 = select i1 %35, i32 0, i32 %34
  %37 = icmp sle i32 0, %36
  %dynamic-slice.1240.2.start_idx1 = select i1 %37, i32 0, i32 %36
  %38 = add i32 %dynamic-slice.1240.2.start_idx0, 0
  %39 = add i32 %dynamic-slice.1240.2.start_idx1, %3
  %40 = getelementptr inbounds [192 x [4 x i8]], ptr %arg4, i32 0, i32 %38, i32 %39
  %41 = load i8, ptr %40, align 1, !invariant.load !297
  %42 = trunc i64 %12 to i32
  %43 = icmp sge i32 0, %42
  %44 = select i1 %43, i32 0, i32 %42
  %45 = icmp sle i32 191, %44
  %dynamic-slice.1209.12.start_idx0 = select i1 %45, i32 191, i32 %44
  %constant_1653_173 = load i64, ptr @443, align 8
  %46 = trunc i64 %constant_1653_173 to i32
  %47 = icmp sge i32 0, %46
  %48 = select i1 %47, i32 0, i32 %46
  %49 = icmp sle i32 0, %48
  %dynamic-slice.1209.12.start_idx1 = select i1 %49, i32 0, i32 %48
  %50 = add i32 %dynamic-slice.1209.12.start_idx0, 0
  %51 = add i32 %dynamic-slice.1209.12.start_idx1, %3
  %52 = getelementptr inbounds [192 x [4 x i32]], ptr %arg7, i32 0, i32 %50, i32 %51
  %53 = load i32, ptr %52, align 4, !invariant.load !297
  %constant_1658_1 = load i32, ptr @449, align 4
  %54 = icmp eq i32 %53, %constant_1658_1
  %55 = zext i1 %54 to i8
  %56 = getelementptr double, ptr %arg0, i32 %linear_index
  %57 = getelementptr inbounds double, ptr %56, i32 0
  %58 = load double, ptr %57, align 8
  %59 = trunc i8 %24 to i1
  %60 = select i1 %59, double %58, double %constant_1655_22
  %61 = trunc i8 %55 to i1
  %62 = select i1 %61, double %60, double %constant_1655_22
  %63 = trunc i64 %12 to i32
  %64 = icmp sge i32 0, %63
  %65 = select i1 %64, i32 0, i32 %63
  %66 = icmp sle i32 191, %65
  %dynamic-slice.1241.5.start_idx0 = select i1 %66, i32 191, i32 %65
  %constant_1653_174 = load i64, ptr @443, align 8
  %67 = trunc i64 %constant_1653_174 to i32
  %68 = icmp sge i32 0, %67
  %69 = select i1 %68, i32 0, i32 %67
  %70 = icmp sle i32 0, %69
  %dynamic-slice.1241.5.start_idx1 = select i1 %70, i32 0, i32 %69
  %71 = add i32 %dynamic-slice.1241.5.start_idx0, 0
  %72 = add i32 %dynamic-slice.1241.5.start_idx1, %3
  %73 = getelementptr inbounds [192 x [4 x double]], ptr %arg6, i32 0, i32 %71, i32 %72
  %74 = load double, ptr %73, align 8, !invariant.load !297
  %multiply.2840.7 = fmul double %62, %74
  %75 = fneg double %multiply.2840.7
  %76 = trunc i64 %12 to i32
  %77 = icmp sge i32 0, %76
  %78 = select i1 %77, i32 0, i32 %76
  %79 = icmp sle i32 191, %78
  %dynamic-slice.1242.1.start_idx0 = select i1 %79, i32 191, i32 %78
  %constant_1653_175 = load i64, ptr @443, align 8
  %80 = trunc i64 %constant_1653_175 to i32
  %81 = icmp sge i32 0, %80
  %82 = select i1 %81, i32 0, i32 %80
  %83 = icmp sle i32 0, %82
  %dynamic-slice.1242.1.start_idx1 = select i1 %83, i32 0, i32 %82
  %84 = add i32 %dynamic-slice.1242.1.start_idx0, 0
  %85 = add i32 %dynamic-slice.1242.1.start_idx1, %3
  %86 = getelementptr inbounds [192 x [4 x double]], ptr %arg3, i32 0, i32 %84, i32 %85
  %87 = load double, ptr %86, align 8, !invariant.load !297
  %multiply.2841.5 = fmul double %75, %87
  %88 = fneg double %multiply.2841.5
  %89 = trunc i8 %41 to i1
  %90 = select i1 %89, double %88, double %constant_1655_22
  %91 = getelementptr double, ptr %arg1, i32 %linear_index
  %92 = getelementptr inbounds double, ptr %91, i32 0
  %93 = load double, ptr %92, align 8, !invariant.load !297
  %add.3775.5 = fadd double %90, %93
  %94 = getelementptr double, ptr %arg18, i32 %linear_index
  %95 = getelementptr inbounds double, ptr %94, i32 0
  %96 = load double, ptr %95, align 8
  %97 = trunc i8 %24 to i1
  %98 = select i1 %97, double %96, double %constant_1655_22
  %99 = trunc i64 %12 to i32
  %100 = icmp sge i32 0, %99
  %101 = select i1 %100, i32 0, i32 %99
  %102 = icmp sle i32 191, %101
  %dynamic-slice.1206.7.start_idx0 = select i1 %102, i32 191, i32 %101
  %constant_1653_176 = load i64, ptr @443, align 8
  %103 = trunc i64 %constant_1653_176 to i32
  %104 = icmp sge i32 0, %103
  %105 = select i1 %104, i32 0, i32 %103
  %106 = icmp sle i32 0, %105
  %dynamic-slice.1206.7.start_idx1 = select i1 %106, i32 0, i32 %105
  %107 = add i32 %dynamic-slice.1206.7.start_idx0, 0
  %108 = add i32 %dynamic-slice.1206.7.start_idx1, %3
  %109 = getelementptr inbounds [192 x [4 x i8]], ptr %arg17, i32 0, i32 %107, i32 %108
  %110 = load i8, ptr %109, align 1, !invariant.load !297
  %111 = trunc i64 %12 to i32
  %112 = icmp sge i32 0, %111
  %113 = select i1 %112, i32 0, i32 %111
  %114 = icmp sle i32 191, %113
  %dynamic-slice.1208.15.start_idx0 = select i1 %114, i32 191, i32 %113
  %constant_1653_177 = load i64, ptr @443, align 8
  %115 = trunc i64 %constant_1653_177 to i32
  %116 = icmp sge i32 0, %115
  %117 = select i1 %116, i32 0, i32 %115
  %118 = icmp sle i32 0, %117
  %dynamic-slice.1208.15.start_idx1 = select i1 %118, i32 0, i32 %117
  %119 = add i32 %dynamic-slice.1208.15.start_idx0, 0
  %120 = add i32 %dynamic-slice.1208.15.start_idx1, %3
  %121 = getelementptr inbounds [192 x [4 x i8]], ptr %arg16, i32 0, i32 %119, i32 %120
  %122 = load i8, ptr %121, align 1, !invariant.load !297
  %constant_1656_2 = load i32, ptr @447, align 4
  %123 = icmp eq i32 %53, %constant_1656_2
  %124 = zext i1 %123 to i8
  %125 = trunc i8 %124 to i1
  %126 = select i1 %125, double %60, double %constant_1655_22
  %127 = trunc i8 %122 to i1
  %128 = select i1 %127, double %126, double %constant_1655_22
  %129 = trunc i8 %110 to i1
  %130 = select i1 %129, double %128, double %constant_1655_22
  %131 = trunc i64 %12 to i32
  %132 = icmp sge i32 0, %131
  %133 = select i1 %132, i32 0, i32 %131
  %134 = icmp sle i32 191, %133
  %dynamic-slice.1243.9.start_idx0 = select i1 %134, i32 191, i32 %133
  %constant_1653_178 = load i64, ptr @443, align 8
  %135 = trunc i64 %constant_1653_178 to i32
  %136 = icmp sge i32 0, %135
  %137 = select i1 %136, i32 0, i32 %135
  %138 = icmp sle i32 0, %137
  %dynamic-slice.1243.9.start_idx1 = select i1 %138, i32 0, i32 %137
  %139 = add i32 %dynamic-slice.1243.9.start_idx0, 0
  %140 = add i32 %dynamic-slice.1243.9.start_idx1, %3
  %141 = getelementptr inbounds [192 x [4 x double]], ptr %arg15, i32 0, i32 %139, i32 %140
  %142 = load double, ptr %141, align 8, !invariant.load !297
  %143 = getelementptr double, ptr %arg14, i32 %linear_index
  %144 = getelementptr inbounds double, ptr %143, i32 0
  %145 = load double, ptr %144, align 8
  %146 = trunc i8 %24 to i1
  %147 = select i1 %146, double %145, double %constant_1655_22
  %148 = trunc i64 %12 to i32
  %149 = icmp sge i32 0, %148
  %150 = select i1 %149, i32 0, i32 %148
  %151 = icmp sle i32 191, %150
  %dynamic-slice.1210.20.start_idx0 = select i1 %151, i32 191, i32 %150
  %constant_1653_179 = load i64, ptr @443, align 8
  %152 = trunc i64 %constant_1653_179 to i32
  %153 = icmp sge i32 0, %152
  %154 = select i1 %153, i32 0, i32 %152
  %155 = icmp sle i32 0, %154
  %dynamic-slice.1210.20.start_idx1 = select i1 %155, i32 0, i32 %154
  %156 = add i32 %dynamic-slice.1210.20.start_idx0, 0
  %157 = add i32 %dynamic-slice.1210.20.start_idx1, %3
  %158 = getelementptr inbounds [192 x [4 x double]], ptr %arg13, i32 0, i32 %156, i32 %157
  %159 = load double, ptr %158, align 8, !invariant.load !297
  %multiply.2801.13 = fmul double %147, %159
  %multiply.2842.13 = fmul double %142, %multiply.2801.13
  %160 = trunc i64 %12 to i32
  %161 = icmp sge i32 0, %160
  %162 = select i1 %161, i32 0, i32 %160
  %163 = icmp sle i32 191, %162
  %dynamic-slice.1244.9.start_idx0 = select i1 %163, i32 191, i32 %162
  %constant_1653_1710 = load i64, ptr @443, align 8
  %164 = trunc i64 %constant_1653_1710 to i32
  %165 = icmp sge i32 0, %164
  %166 = select i1 %165, i32 0, i32 %164
  %167 = icmp sle i32 0, %166
  %dynamic-slice.1244.9.start_idx1 = select i1 %167, i32 0, i32 %166
  %168 = add i32 %dynamic-slice.1244.9.start_idx0, 0
  %169 = add i32 %dynamic-slice.1244.9.start_idx1, %3
  %170 = getelementptr inbounds [192 x [4 x double]], ptr %arg12, i32 0, i32 %168, i32 %169
  %171 = load double, ptr %170, align 8, !invariant.load !297
  %multiply.2843.11 = fmul double %multiply.2842.13, %171
  %172 = fneg double %multiply.2843.11
  %constant_1659_1 = load double, ptr @448, align 8
  %multiply.2844.9 = fmul double %172, %constant_1659_1
  %add.3776.9 = fadd double %130, %multiply.2844.9
  %add.3777.11 = fadd double %98, %add.3776.9
  %173 = getelementptr double, ptr %arg1, i32 %linear_index
  %174 = getelementptr inbounds double, ptr %173, i32 0
  %175 = load double, ptr %174, align 8, !invariant.load !297
  %add.3779.9 = fadd double %add.3777.11, %175
  %176 = trunc i64 %12 to i32
  %177 = icmp sge i32 0, %176
  %178 = select i1 %177, i32 0, i32 %176
  %179 = icmp sle i32 191, %178
  %dynamic-slice.1245.7.start_idx0 = select i1 %179, i32 191, i32 %178
  %constant_1653_1711 = load i64, ptr @443, align 8
  %180 = trunc i64 %constant_1653_1711 to i32
  %181 = icmp sge i32 0, %180
  %182 = select i1 %181, i32 0, i32 %180
  %183 = icmp sle i32 0, %182
  %dynamic-slice.1245.7.start_idx1 = select i1 %183, i32 0, i32 %182
  %184 = add i32 %dynamic-slice.1245.7.start_idx0, 0
  %185 = add i32 %dynamic-slice.1245.7.start_idx1, %3
  %186 = getelementptr inbounds [192 x [4 x double]], ptr %arg11, i32 0, i32 %184, i32 %185
  %187 = load double, ptr %186, align 8, !invariant.load !297
  %188 = getelementptr double, ptr %arg10, i32 %linear_index
  %189 = getelementptr inbounds double, ptr %188, i32 0
  %190 = load double, ptr %189, align 8
  %191 = trunc i8 %24 to i1
  %192 = select i1 %191, double %190, double %constant_1655_22
  %193 = getelementptr double, ptr %arg1, i32 %linear_index
  %194 = getelementptr inbounds double, ptr %193, i32 0
  %195 = load double, ptr %194, align 8, !invariant.load !297
  %add.3780.9 = fadd double %192, %195
  %multiply.2851.7 = fmul double %187, %add.3780.9
  %add.3781.7 = fadd double %add.3779.9, %multiply.2851.7
  %196 = trunc i64 %12 to i32
  %197 = icmp sge i32 0, %196
  %198 = select i1 %197, i32 0, i32 %196
  %199 = icmp sle i32 191, %198
  %dynamic-slice.1246.5.start_idx0 = select i1 %199, i32 191, i32 %198
  %constant_1653_1712 = load i64, ptr @443, align 8
  %200 = trunc i64 %constant_1653_1712 to i32
  %201 = icmp sge i32 0, %200
  %202 = select i1 %201, i32 0, i32 %200
  %203 = icmp sle i32 0, %202
  %dynamic-slice.1246.5.start_idx1 = select i1 %203, i32 0, i32 %202
  %204 = add i32 %dynamic-slice.1246.5.start_idx0, 0
  %205 = add i32 %dynamic-slice.1246.5.start_idx1, %3
  %206 = getelementptr inbounds [192 x [4 x double]], ptr %arg9, i32 0, i32 %204, i32 %205
  %207 = load double, ptr %206, align 8, !invariant.load !297
  %multiply.2856.7 = fmul double %add.3781.7, %207
  %208 = fneg double %multiply.2856.7
  %multiply.2857.5 = fmul double %208, %87
  %209 = fneg double %multiply.2857.5
  %210 = getelementptr double, ptr %arg2, i32 %linear_index
  %211 = getelementptr inbounds double, ptr %210, i32 0
  %212 = load double, ptr %211, align 8
  %213 = trunc i8 %24 to i1
  %214 = select i1 %213, double %212, double %constant_1655_22
  %215 = getelementptr double, ptr %arg1, i32 %linear_index
  %216 = getelementptr inbounds double, ptr %215, i32 0
  %217 = load double, ptr %216, align 8, !invariant.load !297
  %add.3782.11 = fadd double %214, %217
  %multiply.2859.9 = fmul double %add.3782.11, %87
  %218 = fneg double %multiply.2859.9
  %add.3784.5 = fadd double %209, %218
  %add.3785.3 = fadd double %add.3775.5, %add.3784.5
  %add.3786.1 = fadd double %29, %add.3785.3
  %219 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } undef, double %add.3786.1, 0
  %220 = getelementptr double, ptr %arg23, i32 %linear_index
  %221 = getelementptr inbounds double, ptr %220, i32 0
  %222 = load double, ptr %221, align 8
  %223 = trunc i8 %24 to i1
  %224 = select i1 %223, double %222, double %constant_1655_22
  %225 = getelementptr double, ptr %arg23, i32 %linear_index
  %226 = getelementptr inbounds double, ptr %225, i32 0
  %227 = load double, ptr %226, align 8
  %228 = trunc i8 %24 to i1
  %229 = select i1 %228, double %constant_1655_22, double %227
  %add.3787.3.clone.1 = fadd double %224, %229
  %230 = trunc i64 %12 to i32
  %231 = icmp sge i32 0, %230
  %232 = select i1 %231, i32 0, i32 %230
  %233 = icmp sle i32 191, %232
  %dynamic-slice.1247.3.clone.1.start_idx0 = select i1 %233, i32 191, i32 %232
  %constant_1653_1713 = load i64, ptr @443, align 8
  %234 = trunc i64 %constant_1653_1713 to i32
  %235 = icmp sge i32 0, %234
  %236 = select i1 %235, i32 0, i32 %234
  %237 = icmp sle i32 0, %236
  %dynamic-slice.1247.3.clone.1.start_idx1 = select i1 %237, i32 0, i32 %236
  %238 = add i32 %dynamic-slice.1247.3.clone.1.start_idx0, 0
  %239 = add i32 %dynamic-slice.1247.3.clone.1.start_idx1, %3
  %240 = getelementptr inbounds [192 x [4 x double]], ptr %arg22, i32 0, i32 %238, i32 %239
  %241 = load double, ptr %240, align 8, !invariant.load !297
  %multiply.2860.5.clone.1 = fmul double %241, %75
  %242 = trunc i64 %12 to i32
  %243 = icmp sge i32 0, %242
  %244 = select i1 %243, i32 0, i32 %242
  %245 = icmp sle i32 191, %244
  %dynamic-slice.1248.6.clone.1.start_idx0 = select i1 %245, i32 191, i32 %244
  %constant_1653_1714 = load i64, ptr @443, align 8
  %246 = trunc i64 %constant_1653_1714 to i32
  %247 = icmp sge i32 0, %246
  %248 = select i1 %247, i32 0, i32 %246
  %249 = icmp sle i32 0, %248
  %dynamic-slice.1248.6.clone.1.start_idx1 = select i1 %249, i32 0, i32 %248
  %250 = add i32 %dynamic-slice.1248.6.clone.1.start_idx0, 0
  %251 = add i32 %dynamic-slice.1248.6.clone.1.start_idx1, %3
  %252 = getelementptr inbounds [192 x [4 x double]], ptr %arg21, i32 0, i32 %250, i32 %251
  %253 = load double, ptr %252, align 8, !invariant.load !297
  %multiply.2861.3.clone.1 = fmul double %multiply.2860.5.clone.1, %253
  %254 = trunc i8 %41 to i1
  %255 = select i1 %254, double %multiply.2861.3.clone.1, double %constant_1655_22
  %256 = getelementptr double, ptr %arg1, i32 %linear_index
  %257 = getelementptr inbounds double, ptr %256, i32 0
  %258 = load double, ptr %257, align 8, !invariant.load !297
  %add.3789.5.clone.1 = fadd double %255, %258
  %259 = trunc i64 %12 to i32
  %260 = icmp sge i32 0, %259
  %261 = select i1 %260, i32 0, i32 %259
  %262 = icmp sle i32 191, %261
  %dynamic-slice.1249.3.clone.1.start_idx0 = select i1 %262, i32 191, i32 %261
  %constant_1653_1715 = load i64, ptr @443, align 8
  %263 = trunc i64 %constant_1653_1715 to i32
  %264 = icmp sge i32 0, %263
  %265 = select i1 %264, i32 0, i32 %263
  %266 = icmp sle i32 0, %265
  %dynamic-slice.1249.3.clone.1.start_idx1 = select i1 %266, i32 0, i32 %265
  %267 = add i32 %dynamic-slice.1249.3.clone.1.start_idx0, 0
  %268 = add i32 %dynamic-slice.1249.3.clone.1.start_idx1, %3
  %269 = getelementptr inbounds [192 x [4 x i8]], ptr %arg20, i32 0, i32 %267, i32 %268
  %270 = load i8, ptr %269, align 1, !invariant.load !297
  %271 = trunc i64 %12 to i32
  %272 = icmp sge i32 0, %271
  %273 = select i1 %272, i32 0, i32 %271
  %274 = icmp sle i32 191, %273
  %dynamic-slice.1250.3.clone.1.start_idx0 = select i1 %274, i32 191, i32 %273
  %constant_1653_1716 = load i64, ptr @443, align 8
  %275 = trunc i64 %constant_1653_1716 to i32
  %276 = icmp sge i32 0, %275
  %277 = select i1 %276, i32 0, i32 %275
  %278 = icmp sle i32 0, %277
  %dynamic-slice.1250.3.clone.1.start_idx1 = select i1 %278, i32 0, i32 %277
  %279 = add i32 %dynamic-slice.1250.3.clone.1.start_idx0, 0
  %280 = add i32 %dynamic-slice.1250.3.clone.1.start_idx1, %3
  %281 = getelementptr inbounds [192 x [4 x double]], ptr %arg19, i32 0, i32 %279, i32 %280
  %282 = load double, ptr %281, align 8, !invariant.load !297
  %multiply.2862.7.clone.1 = fmul double %add.3780.9, %282
  %add.3790.5.clone.1 = fadd double %208, %multiply.2862.7.clone.1
  %283 = trunc i8 %270 to i1
  %284 = select i1 %283, double %add.3790.5.clone.1, double %constant_1655_22
  %multiply.2864.5.clone.1 = fmul double %284, %253
  %add.3791.3.clone.1 = fadd double %add.3789.5.clone.1, %multiply.2864.5.clone.1
  %add.3792.1.clone.1 = fadd double %add.3787.3.clone.1, %add.3791.3.clone.1
  %285 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %219, double %add.3792.1.clone.1, 1
  %286 = getelementptr double, ptr %arg10, i32 %linear_index
  %287 = getelementptr inbounds double, ptr %286, i32 0
  %288 = load double, ptr %287, align 8
  %289 = trunc i8 %24 to i1
  %290 = select i1 %289, double %constant_1655_22, double %288
  %291 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %285, double %290, 2
  %292 = getelementptr double, ptr %arg2, i32 %linear_index
  %293 = getelementptr inbounds double, ptr %292, i32 0
  %294 = load double, ptr %293, align 8
  %295 = trunc i8 %24 to i1
  %296 = select i1 %295, double %constant_1655_22, double %294
  %297 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %291, double %296, 3
  %298 = getelementptr double, ptr %arg18, i32 %linear_index
  %299 = getelementptr inbounds double, ptr %298, i32 0
  %300 = load double, ptr %299, align 8
  %301 = trunc i8 %24 to i1
  %302 = select i1 %301, double %constant_1655_22, double %300
  %303 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %297, double %302, 4
  %304 = getelementptr double, ptr %arg49, i32 %linear_index
  %305 = getelementptr inbounds double, ptr %304, i32 0
  %306 = load double, ptr %305, align 8
  %307 = trunc i64 %12 to i32
  %308 = icmp sge i32 0, %307
  %309 = select i1 %308, i32 0, i32 %307
  %310 = icmp sle i32 191, %309
  %dynamic-slice.1201.5.clone.1.clone.1.start_idx0 = select i1 %310, i32 191, i32 %309
  %constant_1653_1717 = load i64, ptr @443, align 8
  %311 = trunc i64 %constant_1653_1717 to i32
  %312 = icmp sge i32 0, %311
  %313 = select i1 %312, i32 0, i32 %311
  %314 = icmp sle i32 0, %313
  %dynamic-slice.1201.5.clone.1.clone.1.start_idx1 = select i1 %314, i32 0, i32 %313
  %315 = add i32 %dynamic-slice.1201.5.clone.1.clone.1.start_idx0, 0
  %316 = add i32 %dynamic-slice.1201.5.clone.1.clone.1.start_idx1, %3
  %317 = getelementptr inbounds [192 x [4 x double]], ptr %arg50, i32 0, i32 %315, i32 %316
  %318 = load double, ptr %317, align 8, !invariant.load !297
  %add.3721.5.clone.1.clone.1 = fadd double %306, %318
  %319 = trunc i8 %24 to i1
  %320 = select i1 %319, double %constant_1655_22, double %add.3721.5.clone.1.clone.1
  %321 = getelementptr double, ptr %arg1, i32 %linear_index
  %322 = getelementptr inbounds double, ptr %321, i32 0
  %323 = load double, ptr %322, align 8, !invariant.load !297
  %324 = trunc i64 %12 to i32
  %325 = icmp sge i32 0, %324
  %326 = select i1 %325, i32 0, i32 %324
  %327 = icmp sle i32 191, %326
  %dynamic-slice.1220.2.clone.1.clone.1.start_idx0 = select i1 %327, i32 191, i32 %326
  %constant_1653_1718 = load i64, ptr @443, align 8
  %328 = trunc i64 %constant_1653_1718 to i32
  %329 = icmp sge i32 0, %328
  %330 = select i1 %329, i32 0, i32 %328
  %331 = icmp sle i32 0, %330
  %dynamic-slice.1220.2.clone.1.clone.1.start_idx1 = select i1 %331, i32 0, i32 %330
  %332 = add i32 %dynamic-slice.1220.2.clone.1.clone.1.start_idx0, 0
  %333 = add i32 %dynamic-slice.1220.2.clone.1.clone.1.start_idx1, %3
  %334 = getelementptr inbounds [192 x [4 x double]], ptr %arg48, i32 0, i32 %332, i32 %333
  %335 = load double, ptr %334, align 8, !invariant.load !297
  %336 = getelementptr double, ptr %arg47, i32 %linear_index
  %337 = getelementptr inbounds double, ptr %336, i32 0
  %338 = load double, ptr %337, align 8
  %339 = trunc i8 %24 to i1
  %340 = select i1 %339, double %338, double %constant_1655_22
  %341 = getelementptr double, ptr %arg46, i32 %linear_index
  %342 = getelementptr inbounds double, ptr %341, i32 0
  %343 = load double, ptr %342, align 8
  %344 = trunc i8 %24 to i1
  %345 = select i1 %344, double %343, double %constant_1655_22
  %346 = trunc i64 %12 to i32
  %347 = icmp sge i32 0, %346
  %348 = select i1 %347, i32 0, i32 %346
  %349 = icmp sle i32 191, %348
  %dynamic-slice.1215.7.clone.1.clone.1.start_idx0 = select i1 %349, i32 191, i32 %348
  %constant_1653_1719 = load i64, ptr @443, align 8
  %350 = trunc i64 %constant_1653_1719 to i32
  %351 = icmp sge i32 0, %350
  %352 = select i1 %351, i32 0, i32 %350
  %353 = icmp sle i32 0, %352
  %dynamic-slice.1215.7.clone.1.clone.1.start_idx1 = select i1 %353, i32 0, i32 %352
  %354 = add i32 %dynamic-slice.1215.7.clone.1.clone.1.start_idx0, 0
  %355 = add i32 %dynamic-slice.1215.7.clone.1.clone.1.start_idx1, %3
  %356 = getelementptr inbounds [192 x [4 x double]], ptr %arg45, i32 0, i32 %354, i32 %355
  %357 = load double, ptr %356, align 8, !invariant.load !297
  %358 = getelementptr double, ptr %arg44, i32 %linear_index
  %359 = getelementptr inbounds double, ptr %358, i32 0
  %360 = load double, ptr %359, align 8
  %361 = trunc i8 %24 to i1
  %362 = select i1 %361, double %360, double %constant_1655_22
  %363 = trunc i64 %12 to i32
  %364 = icmp sge i32 0, %363
  %365 = select i1 %364, i32 0, i32 %363
  %366 = icmp sle i32 191, %365
  %dynamic-slice.1207.5.clone.1.clone.1.start_idx0 = select i1 %366, i32 191, i32 %365
  %constant_1653_1720 = load i64, ptr @443, align 8
  %367 = trunc i64 %constant_1653_1720 to i32
  %368 = icmp sge i32 0, %367
  %369 = select i1 %368, i32 0, i32 %367
  %370 = icmp sle i32 0, %369
  %dynamic-slice.1207.5.clone.1.clone.1.start_idx1 = select i1 %370, i32 0, i32 %369
  %371 = add i32 %dynamic-slice.1207.5.clone.1.clone.1.start_idx0, 0
  %372 = add i32 %dynamic-slice.1207.5.clone.1.clone.1.start_idx1, %3
  %373 = getelementptr inbounds [192 x [4 x double]], ptr %arg43, i32 0, i32 %371, i32 %372
  %374 = load double, ptr %373, align 8, !invariant.load !297
  %multiply.2798.9.clone.1.clone.1 = fmul double %128, %159
  %375 = fneg double %multiply.2798.9.clone.1.clone.1
  %multiply.2799.7.clone.1.clone.1 = fmul double %374, %375
  %376 = trunc i64 %12 to i32
  %377 = icmp sge i32 0, %376
  %378 = select i1 %377, i32 0, i32 %376
  %379 = icmp sle i32 191, %378
  %dynamic-slice.1211.5.clone.1.clone.1.start_idx0 = select i1 %379, i32 191, i32 %378
  %constant_1653_1721 = load i64, ptr @443, align 8
  %380 = trunc i64 %constant_1653_1721 to i32
  %381 = icmp sge i32 0, %380
  %382 = select i1 %381, i32 0, i32 %380
  %383 = icmp sle i32 0, %382
  %dynamic-slice.1211.5.clone.1.clone.1.start_idx1 = select i1 %383, i32 0, i32 %382
  %384 = add i32 %dynamic-slice.1211.5.clone.1.clone.1.start_idx0, 0
  %385 = add i32 %dynamic-slice.1211.5.clone.1.clone.1.start_idx1, %3
  %386 = getelementptr inbounds [192 x [4 x double]], ptr %arg42, i32 0, i32 %384, i32 %385
  %387 = load double, ptr %386, align 8, !invariant.load !297
  %multiply.2800.7.clone.1.clone.1 = fmul double %387, %multiply.2798.9.clone.1.clone.1
  %add.3722.5.clone.1.clone.1 = fadd double %multiply.2799.7.clone.1.clone.1, %multiply.2800.7.clone.1.clone.1
  %388 = trunc i8 %110 to i1
  %389 = select i1 %388, double %add.3722.5.clone.1.clone.1, double %constant_1655_22
  %390 = trunc i64 %12 to i32
  %391 = icmp sge i32 0, %390
  %392 = select i1 %391, i32 0, i32 %390
  %393 = icmp sle i32 191, %392
  %dynamic-slice.1212.5.clone.1.clone.1.start_idx0 = select i1 %393, i32 191, i32 %392
  %constant_1653_1722 = load i64, ptr @443, align 8
  %394 = trunc i64 %constant_1653_1722 to i32
  %395 = icmp sge i32 0, %394
  %396 = select i1 %395, i32 0, i32 %394
  %397 = icmp sle i32 0, %396
  %dynamic-slice.1212.5.clone.1.clone.1.start_idx1 = select i1 %397, i32 0, i32 %396
  %398 = add i32 %dynamic-slice.1212.5.clone.1.clone.1.start_idx0, 0
  %399 = add i32 %dynamic-slice.1212.5.clone.1.clone.1.start_idx1, %3
  %400 = getelementptr inbounds [192 x [4 x double]], ptr %arg41, i32 0, i32 %398, i32 %399
  %401 = load double, ptr %400, align 8, !invariant.load !297
  %402 = trunc i64 %12 to i32
  %403 = icmp sge i32 0, %402
  %404 = select i1 %403, i32 0, i32 %402
  %405 = icmp sle i32 191, %404
  %dynamic-slice.1213.11.clone.1.clone.1.start_idx0 = select i1 %405, i32 191, i32 %404
  %constant_1653_1723 = load i64, ptr @443, align 8
  %406 = trunc i64 %constant_1653_1723 to i32
  %407 = icmp sge i32 0, %406
  %408 = select i1 %407, i32 0, i32 %406
  %409 = icmp sle i32 0, %408
  %dynamic-slice.1213.11.clone.1.clone.1.start_idx1 = select i1 %409, i32 0, i32 %408
  %410 = add i32 %dynamic-slice.1213.11.clone.1.clone.1.start_idx0, 0
  %411 = add i32 %dynamic-slice.1213.11.clone.1.clone.1.start_idx1, %3
  %412 = getelementptr inbounds [192 x [4 x double]], ptr %arg40, i32 0, i32 %410, i32 %411
  %413 = load double, ptr %412, align 8, !invariant.load !297
  %multiply.2802.11.clone.1.clone.1 = fmul double %multiply.2801.13, %413
  %multiply.2803.5.clone.1.clone.1 = fmul double %401, %multiply.2802.11.clone.1.clone.1
  %add.3723.5.clone.1.clone.1 = fadd double %389, %multiply.2803.5.clone.1.clone.1
  %add.3724.3.clone.1.clone.1 = fadd double %362, %add.3723.5.clone.1.clone.1
  %multiply.2806.7.clone.1.clone.1 = fmul double %357, %add.3724.3.clone.1.clone.1
  %414 = trunc i64 %12 to i32
  %415 = icmp sge i32 0, %414
  %416 = select i1 %415, i32 0, i32 %414
  %417 = icmp sle i32 191, %416
  %dynamic-slice.1216.3.clone.1.clone.1.start_idx0 = select i1 %417, i32 191, i32 %416
  %constant_1653_1724 = load i64, ptr @443, align 8
  %418 = trunc i64 %constant_1653_1724 to i32
  %419 = icmp sge i32 0, %418
  %420 = select i1 %419, i32 0, i32 %418
  %421 = icmp sle i32 0, %420
  %dynamic-slice.1216.3.clone.1.clone.1.start_idx1 = select i1 %421, i32 0, i32 %420
  %422 = add i32 %dynamic-slice.1216.3.clone.1.clone.1.start_idx0, 0
  %423 = add i32 %dynamic-slice.1216.3.clone.1.clone.1.start_idx1, %3
  %424 = getelementptr inbounds [192 x [4 x double]], ptr %arg39, i32 0, i32 %422, i32 %423
  %425 = load double, ptr %424, align 8, !invariant.load !297
  %multiply.2807.5.clone.1.clone.1 = fmul double %multiply.2806.7.clone.1.clone.1, %425
  %add.3726.3.clone.1.clone.1 = fadd double %345, %multiply.2807.5.clone.1.clone.1
  %426 = fneg double %add.3726.3.clone.1.clone.1
  %add.3729.7.clone.1.clone.1 = fadd double %340, %426
  %427 = trunc i8 %24 to i1
  %428 = select i1 %427, double %add.3721.5.clone.1.clone.1, double %constant_1655_22
  %add.3727.3.clone.1.clone.1 = fadd double %428, %add.3726.3.clone.1.clone.1
  %429 = getelementptr double, ptr %arg1, i32 %linear_index
  %430 = getelementptr inbounds double, ptr %429, i32 0
  %431 = load double, ptr %430, align 8, !invariant.load !297
  %add.3730.1.clone.1.clone.1 = fadd double %add.3727.3.clone.1.clone.1, %431
  %add.3731.5.clone.1.clone.1 = fadd double %add.3729.7.clone.1.clone.1, %add.3730.1.clone.1.clone.1
  %432 = getelementptr double, ptr %arg38, i32 %linear_index
  %433 = getelementptr inbounds double, ptr %432, i32 0
  %434 = load double, ptr %433, align 8, !invariant.load !297
  %435 = trunc i8 %24 to i1
  %436 = select i1 %435, double %434, double %constant_1655_22
  %437 = getelementptr double, ptr %arg1, i32 %linear_index
  %438 = getelementptr inbounds double, ptr %437, i32 0
  %439 = load double, ptr %438, align 8, !invariant.load !297
  %add.3732.9.clone.1.clone.1 = fadd double %436, %439
  %440 = getelementptr double, ptr %arg37, i32 %linear_index
  %441 = getelementptr inbounds double, ptr %440, i32 0
  %442 = load double, ptr %441, align 8, !invariant.load !297
  %443 = trunc i8 %24 to i1
  %444 = select i1 %443, double %442, double %constant_1655_22
  %445 = trunc i64 %12 to i32
  %446 = icmp sge i32 0, %445
  %447 = select i1 %446, i32 0, i32 %445
  %448 = icmp sle i32 191, %447
  %dynamic-slice.1221.5.clone.1.clone.1.start_idx0 = select i1 %448, i32 191, i32 %447
  %constant_1653_1725 = load i64, ptr @443, align 8
  %449 = trunc i64 %constant_1653_1725 to i32
  %450 = icmp sge i32 0, %449
  %451 = select i1 %450, i32 0, i32 %449
  %452 = icmp sle i32 0, %451
  %dynamic-slice.1221.5.clone.1.clone.1.start_idx1 = select i1 %452, i32 0, i32 %451
  %453 = add i32 %dynamic-slice.1221.5.clone.1.clone.1.start_idx0, 0
  %454 = add i32 %dynamic-slice.1221.5.clone.1.clone.1.start_idx1, %3
  %455 = getelementptr inbounds [192 x [4 x double]], ptr %arg36, i32 0, i32 %453, i32 %454
  %456 = load double, ptr %455, align 8, !invariant.load !297
  %multiply.2811.7.clone.1.clone.1 = fmul double %456, %add.3727.3.clone.1.clone.1
  %457 = trunc i64 %12 to i32
  %458 = icmp sge i32 0, %457
  %459 = select i1 %458, i32 0, i32 %457
  %460 = icmp sle i32 191, %459
  %dynamic-slice.1204.1.clone.1.clone.1.start_idx0 = select i1 %460, i32 191, i32 %459
  %461 = add i32 %dynamic-slice.1204.1.clone.1.clone.1.start_idx0, 0
  %462 = getelementptr inbounds [192 x double], ptr %arg35, i32 0, i32 %461
  %463 = load double, ptr %462, align 8, !invariant.load !297
  %multiply.2812.9.clone.1.clone.1 = fmul double %multiply.2811.7.clone.1.clone.1, %463
  %464 = getelementptr double, ptr %arg1, i32 %linear_index
  %465 = getelementptr inbounds double, ptr %464, i32 0
  %466 = load double, ptr %465, align 8, !invariant.load !297
  %add.3733.7.clone.1.clone.1 = fadd double %multiply.2812.9.clone.1.clone.1, %466
  %add.3734.5.clone.1.clone.1 = fadd double %444, %add.3733.7.clone.1.clone.1
  %467 = trunc i64 %12 to i32
  %468 = icmp sge i32 0, %467
  %469 = select i1 %468, i32 0, i32 %467
  %470 = icmp sle i32 191, %469
  %dynamic-slice.1222.8.clone.1.clone.1.start_idx0 = select i1 %470, i32 191, i32 %469
  %constant_1653_1726 = load i64, ptr @443, align 8
  %471 = trunc i64 %constant_1653_1726 to i32
  %472 = icmp sge i32 0, %471
  %473 = select i1 %472, i32 0, i32 %471
  %474 = icmp sle i32 0, %473
  %dynamic-slice.1222.8.clone.1.clone.1.start_idx1 = select i1 %474, i32 0, i32 %473
  %475 = add i32 %dynamic-slice.1222.8.clone.1.clone.1.start_idx0, 0
  %476 = add i32 %dynamic-slice.1222.8.clone.1.clone.1.start_idx1, %3
  %477 = getelementptr inbounds [192 x [4 x double]], ptr %arg34, i32 0, i32 %475, i32 %476
  %478 = load double, ptr %477, align 8, !invariant.load !297
  %divide.572.5.clone.1.clone.1 = fdiv double %add.3734.5.clone.1.clone.1, %478
  %multiply.2813.9.clone.1.clone.1 = fmul double %divide.572.5.clone.1.clone.1, %463
  %479 = fneg double %multiply.2813.9.clone.1.clone.1
  %add.3735.7.clone.1.clone.1 = fadd double %add.3732.9.clone.1.clone.1, %479
  %480 = trunc i64 %12 to i32
  %481 = icmp sge i32 0, %480
  %482 = select i1 %481, i32 0, i32 %480
  %483 = icmp sle i32 191, %482
  %dynamic-slice.1223.7.clone.1.clone.1.start_idx0 = select i1 %483, i32 191, i32 %482
  %constant_1653_1727 = load i64, ptr @443, align 8
  %484 = trunc i64 %constant_1653_1727 to i32
  %485 = icmp sge i32 0, %484
  %486 = select i1 %485, i32 0, i32 %484
  %487 = icmp sle i32 0, %486
  %dynamic-slice.1223.7.clone.1.clone.1.start_idx1 = select i1 %487, i32 0, i32 %486
  %488 = add i32 %dynamic-slice.1223.7.clone.1.clone.1.start_idx0, 0
  %489 = add i32 %dynamic-slice.1223.7.clone.1.clone.1.start_idx1, %3
  %490 = getelementptr inbounds [192 x [4 x double]], ptr %arg33, i32 0, i32 %488, i32 %489
  %491 = load double, ptr %490, align 8, !invariant.load !297
  %492 = getelementptr double, ptr %arg32, i32 %linear_index
  %493 = getelementptr inbounds double, ptr %492, i32 0
  %494 = load double, ptr %493, align 8, !invariant.load !297
  %495 = trunc i8 %24 to i1
  %496 = select i1 %495, double %494, double %constant_1655_22
  %497 = getelementptr double, ptr %arg31, i32 %linear_index
  %498 = getelementptr inbounds double, ptr %497, i32 0
  %499 = load double, ptr %498, align 8, !invariant.load !297
  %500 = trunc i8 %24 to i1
  %501 = select i1 %500, double %499, double %constant_1655_22
  %add.3736.11.clone.1.clone.1 = fadd double %496, %501
  %502 = trunc i64 %12 to i32
  %503 = icmp sge i32 0, %502
  %504 = select i1 %503, i32 0, i32 %502
  %505 = icmp sle i32 191, %504
  %dynamic-slice.1224.9.clone.1.clone.1.start_idx0 = select i1 %505, i32 191, i32 %504
  %constant_1653_1728 = load i64, ptr @443, align 8
  %506 = trunc i64 %constant_1653_1728 to i32
  %507 = icmp sge i32 0, %506
  %508 = select i1 %507, i32 0, i32 %506
  %509 = icmp sle i32 0, %508
  %dynamic-slice.1224.9.clone.1.clone.1.start_idx1 = select i1 %509, i32 0, i32 %508
  %510 = add i32 %dynamic-slice.1224.9.clone.1.clone.1.start_idx0, 0
  %511 = add i32 %dynamic-slice.1224.9.clone.1.clone.1.start_idx1, %3
  %512 = getelementptr inbounds [192 x [4 x double]], ptr %arg30, i32 0, i32 %510, i32 %511
  %513 = load double, ptr %512, align 8, !invariant.load !297
  %514 = trunc i64 %12 to i32
  %515 = icmp sge i32 0, %514
  %516 = select i1 %515, i32 0, i32 %514
  %517 = icmp sle i32 191, %516
  %dynamic-slice.1217.3.clone.1.clone.1.start_idx0 = select i1 %517, i32 191, i32 %516
  %constant_1653_1729 = load i64, ptr @443, align 8
  %518 = trunc i64 %constant_1653_1729 to i32
  %519 = icmp sge i32 0, %518
  %520 = select i1 %519, i32 0, i32 %518
  %521 = icmp sle i32 0, %520
  %dynamic-slice.1217.3.clone.1.clone.1.start_idx1 = select i1 %521, i32 0, i32 %520
  %522 = add i32 %dynamic-slice.1217.3.clone.1.clone.1.start_idx0, 0
  %523 = add i32 %dynamic-slice.1217.3.clone.1.clone.1.start_idx1, %3
  %524 = getelementptr inbounds [192 x [4 x double]], ptr %arg29, i32 0, i32 %522, i32 %523
  %525 = load double, ptr %524, align 8, !invariant.load !297
  %multiply.2808.3.clone.1.clone.1 = fmul double %add.3727.3.clone.1.clone.1, %525
  %526 = trunc i64 %12 to i32
  %527 = icmp sge i32 0, %526
  %528 = select i1 %527, i32 0, i32 %526
  %529 = icmp sle i32 191, %528
  %dynamic-slice.1225.14.clone.1.clone.1.start_idx0 = select i1 %529, i32 191, i32 %528
  %constant_1653_1730 = load i64, ptr @443, align 8
  %530 = trunc i64 %constant_1653_1730 to i32
  %531 = icmp sge i32 0, %530
  %532 = select i1 %531, i32 0, i32 %530
  %533 = icmp sle i32 0, %532
  %dynamic-slice.1225.14.clone.1.clone.1.start_idx1 = select i1 %533, i32 0, i32 %532
  %534 = add i32 %dynamic-slice.1225.14.clone.1.clone.1.start_idx0, 0
  %535 = add i32 %dynamic-slice.1225.14.clone.1.clone.1.start_idx1, %3
  %536 = getelementptr inbounds [192 x [4 x double]], ptr %arg28, i32 0, i32 %534, i32 %535
  %537 = load double, ptr %536, align 8, !invariant.load !297
  %divide.573.11.clone.1.clone.1 = fdiv double %multiply.2808.3.clone.1.clone.1, %537
  %multiply.2814.11.clone.1.clone.1 = fmul double %513, %divide.573.11.clone.1.clone.1
  %538 = getelementptr double, ptr %arg27, i32 %linear_index
  %539 = getelementptr inbounds double, ptr %538, i32 0
  %540 = load double, ptr %539, align 8, !invariant.load !297
  %add.3737.9.clone.1.clone.1 = fadd double %multiply.2814.11.clone.1.clone.1, %540
  %add.3738.9.clone.1.clone.1 = fadd double %add.3736.11.clone.1.clone.1, %add.3737.9.clone.1.clone.1
  %541 = getelementptr double, ptr %arg1, i32 %linear_index
  %542 = getelementptr inbounds double, ptr %541, i32 0
  %543 = load double, ptr %542, align 8, !invariant.load !297
  %add.3739.7.clone.1.clone.1 = fadd double %add.3738.9.clone.1.clone.1, %543
  %544 = trunc i64 %12 to i32
  %545 = icmp sge i32 0, %544
  %546 = select i1 %545, i32 0, i32 %544
  %547 = icmp sle i32 191, %546
  %dynamic-slice.1226.5.clone.1.clone.1.start_idx0 = select i1 %547, i32 191, i32 %546
  %constant_1653_1731 = load i64, ptr @443, align 8
  %548 = trunc i64 %constant_1653_1731 to i32
  %549 = icmp sge i32 0, %548
  %550 = select i1 %549, i32 0, i32 %548
  %551 = icmp sle i32 0, %550
  %dynamic-slice.1226.5.clone.1.clone.1.start_idx1 = select i1 %551, i32 0, i32 %550
  %552 = add i32 %dynamic-slice.1226.5.clone.1.clone.1.start_idx0, 0
  %553 = add i32 %dynamic-slice.1226.5.clone.1.clone.1.start_idx1, %3
  %554 = getelementptr inbounds [192 x [4 x double]], ptr %arg26, i32 0, i32 %552, i32 %553
  %555 = load double, ptr %554, align 8, !invariant.load !297
  %multiply.2815.9.clone.1.clone.1 = fmul double %add.3734.5.clone.1.clone.1, %555
  %556 = trunc i64 %12 to i32
  %557 = icmp sge i32 0, %556
  %558 = select i1 %557, i32 0, i32 %556
  %559 = icmp sle i32 191, %558
  %dynamic-slice.1227.5.clone.1.clone.1.start_idx0 = select i1 %559, i32 191, i32 %558
  %constant_1653_1732 = load i64, ptr @443, align 8
  %560 = trunc i64 %constant_1653_1732 to i32
  %561 = icmp sge i32 0, %560
  %562 = select i1 %561, i32 0, i32 %560
  %563 = icmp sle i32 0, %562
  %dynamic-slice.1227.5.clone.1.clone.1.start_idx1 = select i1 %563, i32 0, i32 %562
  %564 = add i32 %dynamic-slice.1227.5.clone.1.clone.1.start_idx0, 0
  %565 = add i32 %dynamic-slice.1227.5.clone.1.clone.1.start_idx1, %3
  %566 = getelementptr inbounds [192 x [4 x double]], ptr %arg25, i32 0, i32 %564, i32 %565
  %567 = load double, ptr %566, align 8, !invariant.load !297
  %multiply.2816.7.clone.1.clone.1 = fmul double %multiply.2815.9.clone.1.clone.1, %567
  %568 = fneg double %multiply.2816.7.clone.1.clone.1
  %add.3740.5.clone.1.clone.1 = fadd double %add.3739.7.clone.1.clone.1, %568
  %multiply.2817.9.clone.1.clone.1 = fmul double %491, %add.3740.5.clone.1.clone.1
  %569 = fneg double %multiply.2817.9.clone.1.clone.1
  %add.3741.5.clone.1.clone.1 = fadd double %add.3735.7.clone.1.clone.1, %569
  %570 = trunc i64 %12 to i32
  %571 = icmp sge i32 0, %570
  %572 = select i1 %571, i32 0, i32 %570
  %573 = icmp sle i32 191, %572
  %dynamic-slice.1228.3.clone.1.clone.1.start_idx0 = select i1 %573, i32 191, i32 %572
  %constant_1653_1733 = load i64, ptr @443, align 8
  %574 = trunc i64 %constant_1653_1733 to i32
  %575 = icmp sge i32 0, %574
  %576 = select i1 %575, i32 0, i32 %574
  %577 = icmp sle i32 0, %576
  %dynamic-slice.1228.3.clone.1.clone.1.start_idx1 = select i1 %577, i32 0, i32 %576
  %578 = add i32 %dynamic-slice.1228.3.clone.1.clone.1.start_idx0, 0
  %579 = add i32 %dynamic-slice.1228.3.clone.1.clone.1.start_idx1, %3
  %580 = getelementptr inbounds [192 x [4 x double]], ptr %arg24, i32 0, i32 %578, i32 %579
  %581 = load double, ptr %580, align 8, !invariant.load !297
  %multiply.2818.7.clone.1.clone.1 = fmul double %add.3740.5.clone.1.clone.1, %581
  %add.3742.5.clone.1.clone.1 = fadd double %add.3741.5.clone.1.clone.1, %multiply.2818.7.clone.1.clone.1
  %multiply.2819.3.clone.1.clone.1 = fmul double %add.3742.5.clone.1.clone.1, %478
  %add.3743.3.clone.1.clone.1 = fadd double %add.3731.5.clone.1.clone.1, %multiply.2819.3.clone.1.clone.1
  %multiply.2820.5.clone.1.clone.1 = fmul double %335, %add.3743.3.clone.1.clone.1
  %add.3744.3.clone.1.clone.1 = fadd double %323, %multiply.2820.5.clone.1.clone.1
  %add.3745.1.clone.1.clone.1 = fadd double %320, %add.3744.3.clone.1.clone.1
  %582 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %303, double %add.3745.1.clone.1.clone.1, 5
  %583 = getelementptr double, ptr %arg51, i32 %linear_index
  %584 = getelementptr inbounds double, ptr %583, i32 0
  %585 = load double, ptr %584, align 8
  %586 = trunc i8 %24 to i1
  %587 = select i1 %586, double %constant_1655_22, double %585
  %588 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %582, double %587, 6
  %589 = trunc i64 %12 to i32
  %590 = icmp sge i32 0, %589
  %591 = select i1 %590, i32 0, i32 %589
  %592 = icmp sle i32 191, %591
  %dynamic-slice.1251.1.clone.1.clone.1.start_idx0 = select i1 %592, i32 191, i32 %591
  %constant_1653_1734 = load i64, ptr @443, align 8
  %593 = trunc i64 %constant_1653_1734 to i32
  %594 = icmp sge i32 0, %593
  %595 = select i1 %594, i32 0, i32 %593
  %596 = icmp sle i32 0, %595
  %dynamic-slice.1251.1.clone.1.clone.1.start_idx1 = select i1 %596, i32 0, i32 %595
  %constant_1653_1735 = load i64, ptr @443, align 8
  %597 = trunc i64 %constant_1653_1735 to i32
  %598 = icmp sge i32 0, %597
  %599 = select i1 %598, i32 0, i32 %597
  %600 = icmp sle i32 0, %599
  %dynamic-slice.1251.1.clone.1.clone.1.start_idx2 = select i1 %600, i32 0, i32 %599
  %601 = add i32 %dynamic-slice.1251.1.clone.1.clone.1.start_idx0, 0
  %602 = add i32 %dynamic-slice.1251.1.clone.1.clone.1.start_idx1, %3
  %603 = add i32 %dynamic-slice.1251.1.clone.1.clone.1.start_idx2, 0
  %604 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg59, i32 0, i32 %601, i32 %602, i32 0
  %605 = load i8, ptr %604, align 1, !invariant.load !297
  %606 = getelementptr double, ptr %arg58, i32 %linear_index
  %607 = getelementptr inbounds double, ptr %606, i32 0
  %608 = load double, ptr %607, align 8
  %constant_1655_2236 = load double, ptr @442, align 8
  %609 = trunc i8 %605 to i1
  %610 = select i1 %609, double %608, double %constant_1655_2236
  %611 = getelementptr double, ptr %arg58, i32 %linear_index
  %612 = getelementptr inbounds double, ptr %611, i32 0
  %613 = load double, ptr %612, align 8
  %614 = trunc i8 %605 to i1
  %615 = select i1 %614, double %constant_1655_2236, double %613
  %add.3794.3.clone.1.clone.1 = fadd double %610, %615
  %616 = trunc i64 %12 to i32
  %617 = icmp sge i32 0, %616
  %618 = select i1 %617, i32 0, i32 %616
  %619 = icmp sle i32 191, %618
  %dynamic-slice.1252.1.clone.1.clone.1.start_idx0 = select i1 %619, i32 191, i32 %618
  %constant_1653_1737 = load i64, ptr @443, align 8
  %620 = trunc i64 %constant_1653_1737 to i32
  %621 = icmp sge i32 0, %620
  %622 = select i1 %621, i32 0, i32 %620
  %623 = icmp sle i32 0, %622
  %dynamic-slice.1252.1.clone.1.clone.1.start_idx1 = select i1 %623, i32 0, i32 %622
  %constant_1653_1738 = load i64, ptr @443, align 8
  %624 = trunc i64 %constant_1653_1738 to i32
  %625 = icmp sge i32 0, %624
  %626 = select i1 %625, i32 0, i32 %624
  %627 = icmp sle i32 0, %626
  %dynamic-slice.1252.1.clone.1.clone.1.start_idx2 = select i1 %627, i32 0, i32 %626
  %628 = add i32 %dynamic-slice.1252.1.clone.1.clone.1.start_idx0, 0
  %629 = add i32 %dynamic-slice.1252.1.clone.1.clone.1.start_idx1, %3
  %630 = add i32 %dynamic-slice.1252.1.clone.1.clone.1.start_idx2, 0
  %631 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg57, i32 0, i32 %628, i32 %629, i32 0
  %632 = load i8, ptr %631, align 1, !invariant.load !297
  %633 = trunc i64 %12 to i32
  %634 = icmp sge i32 0, %633
  %635 = select i1 %634, i32 0, i32 %633
  %636 = icmp sle i32 191, %635
  %dynamic-slice.1232.5.clone.1.clone.1.start_idx0 = select i1 %636, i32 191, i32 %635
  %constant_1653_1739 = load i64, ptr @443, align 8
  %637 = trunc i64 %constant_1653_1739 to i32
  %638 = icmp sge i32 0, %637
  %639 = select i1 %638, i32 0, i32 %637
  %640 = icmp sle i32 0, %639
  %dynamic-slice.1232.5.clone.1.clone.1.start_idx1 = select i1 %640, i32 0, i32 %639
  %641 = add i32 %dynamic-slice.1232.5.clone.1.clone.1.start_idx0, 0
  %642 = add i32 %dynamic-slice.1232.5.clone.1.clone.1.start_idx1, %3
  %643 = getelementptr inbounds [192 x [4 x double]], ptr %arg56, i32 0, i32 %641, i32 %642
  %644 = load double, ptr %643, align 8, !invariant.load !297
  %multiply.2822.3.clone.1.clone.1 = fmul double %375, %644
  %645 = trunc i64 %12 to i32
  %646 = icmp sge i32 0, %645
  %647 = select i1 %646, i32 0, i32 %645
  %648 = icmp sle i32 191, %647
  %dynamic-slice.1253.7.clone.1.clone.1.start_idx0 = select i1 %648, i32 191, i32 %647
  %constant_1653_1740 = load i64, ptr @443, align 8
  %649 = trunc i64 %constant_1653_1740 to i32
  %650 = icmp sge i32 0, %649
  %651 = select i1 %650, i32 0, i32 %649
  %652 = icmp sle i32 0, %651
  %dynamic-slice.1253.7.clone.1.clone.1.start_idx1 = select i1 %652, i32 0, i32 %651
  %653 = add i32 %dynamic-slice.1253.7.clone.1.clone.1.start_idx0, 0
  %654 = add i32 %dynamic-slice.1253.7.clone.1.clone.1.start_idx1, %3
  %655 = getelementptr inbounds [192 x [4 x double]], ptr %arg55, i32 0, i32 %653, i32 %654
  %656 = load double, ptr %655, align 8, !invariant.load !297
  %multiply.2866.7.clone.1.clone.1 = fmul double %multiply.2822.3.clone.1.clone.1, %656
  %constant_1657_1_clone_1_clone_1 = load double, ptr @446, align 8
  %multiply.2868.5.clone.1.clone.1 = fmul double %multiply.2866.7.clone.1.clone.1, %constant_1657_1_clone_1_clone_1
  %657 = trunc i64 %12 to i32
  %658 = icmp sge i32 0, %657
  %659 = select i1 %658, i32 0, i32 %657
  %660 = icmp sle i32 191, %659
  %dynamic-slice.1254.3.clone.1.clone.1.start_idx0 = select i1 %660, i32 191, i32 %659
  %constant_1653_1741 = load i64, ptr @443, align 8
  %661 = trunc i64 %constant_1653_1741 to i32
  %662 = icmp sge i32 0, %661
  %663 = select i1 %662, i32 0, i32 %661
  %664 = icmp sle i32 0, %663
  %dynamic-slice.1254.3.clone.1.clone.1.start_idx1 = select i1 %664, i32 0, i32 %663
  %665 = add i32 %dynamic-slice.1254.3.clone.1.clone.1.start_idx0, 0
  %666 = add i32 %dynamic-slice.1254.3.clone.1.clone.1.start_idx1, %3
  %667 = getelementptr inbounds [192 x [4 x double]], ptr %arg54, i32 0, i32 %665, i32 %666
  %668 = load double, ptr %667, align 8, !invariant.load !297
  %multiply.2869.3.clone.1.clone.1 = fmul double %multiply.2868.5.clone.1.clone.1, %668
  %multiply.2824.5.clone.1.clone.1 = fmul double %multiply.2798.9.clone.1.clone.1, %644
  %669 = trunc i64 %12 to i32
  %670 = icmp sge i32 0, %669
  %671 = select i1 %670, i32 0, i32 %669
  %672 = icmp sle i32 191, %671
  %dynamic-slice.1234.8.clone.1.clone.1.start_idx0 = select i1 %672, i32 191, i32 %671
  %constant_1653_1742 = load i64, ptr @443, align 8
  %673 = trunc i64 %constant_1653_1742 to i32
  %674 = icmp sge i32 0, %673
  %675 = select i1 %674, i32 0, i32 %673
  %676 = icmp sle i32 0, %675
  %dynamic-slice.1234.8.clone.1.clone.1.start_idx1 = select i1 %676, i32 0, i32 %675
  %677 = add i32 %dynamic-slice.1234.8.clone.1.clone.1.start_idx0, 0
  %678 = add i32 %dynamic-slice.1234.8.clone.1.clone.1.start_idx1, %3
  %679 = getelementptr inbounds [192 x [4 x double]], ptr %arg53, i32 0, i32 %677, i32 %678
  %680 = load double, ptr %679, align 8, !invariant.load !297
  %multiply.2825.3.clone.1.clone.1 = fmul double %multiply.2824.5.clone.1.clone.1, %680
  %multiply.2870.5.clone.1.clone.1 = fmul double %multiply.2825.3.clone.1.clone.1, %656
  %add.3795.3.clone.1.clone.1 = fadd double %multiply.2869.3.clone.1.clone.1, %multiply.2870.5.clone.1.clone.1
  %multiply.2827.5.clone.1.clone.1 = fmul double %multiply.2798.9.clone.1.clone.1, %constant_1657_1_clone_1_clone_1
  %multiply.2828.3.clone.1.clone.1 = fmul double %multiply.2827.5.clone.1.clone.1, %680
  %multiply.2871.9.clone.1.clone.1 = fmul double %multiply.2828.3.clone.1.clone.1, %656
  %add.3796.7.clone.1.clone.1 = fadd double %add.3795.3.clone.1.clone.1, %multiply.2871.9.clone.1.clone.1
  %681 = trunc i8 %632 to i1
  %682 = select i1 %681, double %add.3796.7.clone.1.clone.1, double %constant_1655_2236
  %multiply.2830.3.clone.1.clone.1 = fmul double %multiply.2802.11.clone.1.clone.1, %644
  %multiply.2872.7.clone.1.clone.1 = fmul double %multiply.2830.3.clone.1.clone.1, %656
  %add.3797.5.clone.1.clone.1 = fadd double %682, %multiply.2872.7.clone.1.clone.1
  %683 = getelementptr double, ptr %arg52, i32 %linear_index
  %684 = getelementptr inbounds double, ptr %683, i32 0
  %685 = load double, ptr %684, align 8, !invariant.load !297
  %add.3799.3.clone.1.clone.1 = fadd double %add.3797.5.clone.1.clone.1, %685
  %add.3800.1.clone.1.clone.1 = fadd double %add.3794.3.clone.1.clone.1, %add.3799.3.clone.1.clone.1
  %686 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %588, double %add.3800.1.clone.1.clone.1, 7
  %687 = getelementptr double, ptr %arg60, i32 %linear_index
  %688 = getelementptr inbounds double, ptr %687, i32 0
  %689 = load double, ptr %688, align 8
  %690 = trunc i8 %24 to i1
  %691 = select i1 %690, double %constant_1655_22, double %689
  %692 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %686, double %691, 8
  %693 = getelementptr double, ptr %arg63, i32 %linear_index
  %694 = getelementptr inbounds double, ptr %693, i32 0
  %695 = load double, ptr %694, align 8
  %696 = trunc i8 %24 to i1
  %697 = select i1 %696, double %constant_1655_22, double %695
  %698 = getelementptr double, ptr %arg61, i32 %linear_index
  %699 = getelementptr inbounds double, ptr %698, i32 0
  %700 = load double, ptr %699, align 8, !invariant.load !297
  %701 = getelementptr double, ptr %arg76, i32 %linear_index
  %702 = getelementptr inbounds double, ptr %701, i32 0
  %703 = load double, ptr %702, align 8
  %704 = trunc i8 %24 to i1
  %705 = select i1 %704, double %703, double %constant_1655_22
  %706 = trunc i64 %12 to i32
  %707 = icmp sge i32 0, %706
  %708 = select i1 %707, i32 0, i32 %706
  %709 = icmp sle i32 191, %708
  %dynamic-slice.1229.5.clone.1.clone.1.start_idx0 = select i1 %709, i32 191, i32 %708
  %constant_1653_1743 = load i64, ptr @443, align 8
  %710 = trunc i64 %constant_1653_1743 to i32
  %711 = icmp sge i32 0, %710
  %712 = select i1 %711, i32 0, i32 %710
  %713 = icmp sle i32 0, %712
  %dynamic-slice.1229.5.clone.1.clone.1.start_idx1 = select i1 %713, i32 0, i32 %712
  %714 = add i32 %dynamic-slice.1229.5.clone.1.clone.1.start_idx0, 0
  %715 = add i32 %dynamic-slice.1229.5.clone.1.clone.1.start_idx1, %3
  %716 = getelementptr inbounds [192 x [4 x double]], ptr %arg75, i32 0, i32 %714, i32 %715
  %717 = load double, ptr %716, align 8, !invariant.load !297
  %multiply.2821.7.clone.1.clone.1 = fmul double %add.3724.3.clone.1.clone.1, %717
  %divide.574.7.clone.1.clone.1 = fdiv double %add.3724.3.clone.1.clone.1, %537
  %add.3746.5.clone.1.clone.1 = fadd double %multiply.2821.7.clone.1.clone.1, %divide.574.7.clone.1.clone.1
  %add.3747.7.clone.1.clone.1 = fadd double %705, %add.3746.5.clone.1.clone.1
  %718 = getelementptr double, ptr %arg74, i32 %linear_index
  %719 = getelementptr inbounds double, ptr %718, i32 0
  %720 = load double, ptr %719, align 8, !invariant.load !297
  %add.3748.5.clone.1.clone.1 = fadd double %add.3747.7.clone.1.clone.1, %720
  %721 = trunc i64 %12 to i32
  %722 = icmp sge i32 0, %721
  %723 = select i1 %722, i32 0, i32 %721
  %724 = icmp sle i32 191, %723
  %dynamic-slice.1230.3.clone.1.clone.1.start_idx0 = select i1 %724, i32 191, i32 %723
  %constant_1653_1744 = load i64, ptr @443, align 8
  %725 = trunc i64 %constant_1653_1744 to i32
  %726 = icmp sge i32 0, %725
  %727 = select i1 %726, i32 0, i32 %725
  %728 = icmp sle i32 0, %727
  %dynamic-slice.1230.3.clone.1.clone.1.start_idx1 = select i1 %728, i32 0, i32 %727
  %729 = add i32 %dynamic-slice.1230.3.clone.1.clone.1.start_idx0, 0
  %730 = add i32 %dynamic-slice.1230.3.clone.1.clone.1.start_idx1, %3
  %731 = getelementptr inbounds [192 x [4 x double]], ptr %arg73, i32 0, i32 %729, i32 %730
  %732 = load double, ptr %731, align 8, !invariant.load !297
  %733 = getelementptr double, ptr %arg60, i32 %linear_index
  %734 = getelementptr inbounds double, ptr %733, i32 0
  %735 = load double, ptr %734, align 8
  %736 = trunc i8 %24 to i1
  %737 = select i1 %736, double %735, double %constant_1655_22
  %738 = trunc i64 %12 to i32
  %739 = icmp sge i32 0, %738
  %740 = select i1 %739, i32 0, i32 %738
  %741 = icmp sle i32 191, %740
  %dynamic-slice.1231.5.clone.1.clone.1.start_idx0 = select i1 %741, i32 191, i32 %740
  %constant_1653_1745 = load i64, ptr @443, align 8
  %742 = trunc i64 %constant_1653_1745 to i32
  %743 = icmp sge i32 0, %742
  %744 = select i1 %743, i32 0, i32 %742
  %745 = icmp sle i32 0, %744
  %dynamic-slice.1231.5.clone.1.clone.1.start_idx1 = select i1 %745, i32 0, i32 %744
  %746 = add i32 %dynamic-slice.1231.5.clone.1.clone.1.start_idx0, 0
  %747 = add i32 %dynamic-slice.1231.5.clone.1.clone.1.start_idx1, %3
  %748 = getelementptr inbounds [192 x [4 x double]], ptr %arg67, i32 0, i32 %746, i32 %747
  %749 = load double, ptr %748, align 8, !invariant.load !297
  %multiply.2823.13.clone.1.clone.1 = fmul double %749, %multiply.2822.3.clone.1.clone.1
  %750 = trunc i64 %12 to i32
  %751 = icmp sge i32 0, %750
  %752 = select i1 %751, i32 0, i32 %750
  %753 = icmp sle i32 191, %752
  %dynamic-slice.1233.5.clone.1.clone.1.start_idx0 = select i1 %753, i32 191, i32 %752
  %constant_1653_1746 = load i64, ptr @443, align 8
  %754 = trunc i64 %constant_1653_1746 to i32
  %755 = icmp sge i32 0, %754
  %756 = select i1 %755, i32 0, i32 %754
  %757 = icmp sle i32 0, %756
  %dynamic-slice.1233.5.clone.1.clone.1.start_idx1 = select i1 %757, i32 0, i32 %756
  %758 = add i32 %dynamic-slice.1233.5.clone.1.clone.1.start_idx0, 0
  %759 = add i32 %dynamic-slice.1233.5.clone.1.clone.1.start_idx1, %3
  %760 = getelementptr inbounds [192 x [4 x double]], ptr %arg66, i32 0, i32 %758, i32 %759
  %761 = load double, ptr %760, align 8, !invariant.load !297
  %multiply.2826.7.clone.1.clone.1 = fmul double %761, %multiply.2825.3.clone.1.clone.1
  %add.3749.11.clone.1.clone.1 = fadd double %multiply.2823.13.clone.1.clone.1, %multiply.2826.7.clone.1.clone.1
  %multiply.2829.7.clone.1.clone.1 = fmul double %761, %multiply.2828.3.clone.1.clone.1
  %add.3750.9.clone.1.clone.1 = fadd double %add.3749.11.clone.1.clone.1, %multiply.2829.7.clone.1.clone.1
  %762 = trunc i8 %110 to i1
  %763 = select i1 %762, double %add.3750.9.clone.1.clone.1, double %constant_1655_22
  %multiply.2831.9.clone.1.clone.1 = fmul double %761, %multiply.2830.3.clone.1.clone.1
  %add.3751.7.clone.1.clone.1 = fadd double %763, %multiply.2831.9.clone.1.clone.1
  %add.3752.7.clone.1.clone.1 = fadd double %737, %add.3751.7.clone.1.clone.1
  %764 = getelementptr double, ptr %arg1, i32 %linear_index
  %765 = getelementptr inbounds double, ptr %764, i32 0
  %766 = load double, ptr %765, align 8, !invariant.load !297
  %add.3754.5.clone.1.clone.1 = fadd double %add.3752.7.clone.1.clone.1, %766
  %multiply.2832.3.clone.1.clone.1 = fmul double %732, %add.3754.5.clone.1.clone.1
  %add.3755.3.clone.1.clone.1 = fadd double %add.3748.5.clone.1.clone.1, %multiply.2832.3.clone.1.clone.1
  %767 = trunc i64 %12 to i32
  %768 = icmp sge i32 0, %767
  %769 = select i1 %768, i32 0, i32 %767
  %770 = icmp sle i32 191, %769
  %dynamic-slice.1235.1.clone.1.clone.1.start_idx0 = select i1 %770, i32 191, i32 %769
  %constant_1653_1747 = load i64, ptr @443, align 8
  %771 = trunc i64 %constant_1653_1747 to i32
  %772 = icmp sge i32 0, %771
  %773 = select i1 %772, i32 0, i32 %771
  %774 = icmp sle i32 0, %773
  %dynamic-slice.1235.1.clone.1.clone.1.start_idx1 = select i1 %774, i32 0, i32 %773
  %775 = add i32 %dynamic-slice.1235.1.clone.1.clone.1.start_idx0, 0
  %776 = add i32 %dynamic-slice.1235.1.clone.1.clone.1.start_idx1, %3
  %777 = getelementptr inbounds [192 x [4 x double]], ptr %arg72, i32 0, i32 %775, i32 %776
  %778 = load double, ptr %777, align 8, !invariant.load !297
  %multiply.2833.3.clone.1.clone.1 = fmul double %add.3755.3.clone.1.clone.1, %778
  %779 = fneg double %multiply.2833.3.clone.1.clone.1
  %780 = trunc i64 %12 to i32
  %781 = icmp sge i32 0, %780
  %782 = select i1 %781, i32 0, i32 %780
  %783 = icmp sle i32 191, %782
  %dynamic-slice.1236.1.clone.1.clone.1.start_idx0 = select i1 %783, i32 191, i32 %782
  %constant_1653_1748 = load i64, ptr @443, align 8
  %784 = trunc i64 %constant_1653_1748 to i32
  %785 = icmp sge i32 0, %784
  %786 = select i1 %785, i32 0, i32 %784
  %787 = icmp sle i32 0, %786
  %dynamic-slice.1236.1.clone.1.clone.1.start_idx1 = select i1 %787, i32 0, i32 %786
  %788 = add i32 %dynamic-slice.1236.1.clone.1.clone.1.start_idx0, 0
  %789 = add i32 %dynamic-slice.1236.1.clone.1.clone.1.start_idx1, %3
  %790 = getelementptr inbounds [192 x [4 x double]], ptr %arg62, i32 0, i32 %788, i32 %789
  %791 = load double, ptr %790, align 8, !invariant.load !297
  %multiply.2834.5.clone.1.clone.1 = fmul double %779, %791
  %792 = fneg double %multiply.2834.5.clone.1.clone.1
  %793 = getelementptr double, ptr %arg51, i32 %linear_index
  %794 = getelementptr inbounds double, ptr %793, i32 0
  %795 = load double, ptr %794, align 8
  %796 = trunc i8 %24 to i1
  %797 = select i1 %796, double %795, double %constant_1655_22
  %798 = getelementptr double, ptr %arg1, i32 %linear_index
  %799 = getelementptr inbounds double, ptr %798, i32 0
  %800 = load double, ptr %799, align 8, !invariant.load !297
  %add.3756.11.clone.1.clone.1 = fadd double %797, %800
  %multiply.2835.9.clone.1.clone.1 = fmul double %add.3756.11.clone.1.clone.1, %791
  %801 = fneg double %multiply.2835.9.clone.1.clone.1
  %add.3757.5.clone.1.clone.1 = fadd double %792, %801
  %add.3759.3.clone.1.clone.1 = fadd double %700, %add.3757.5.clone.1.clone.1
  %add.3760.1.clone.1.clone.1 = fadd double %697, %add.3759.3.clone.1.clone.1
  %802 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %692, double %add.3760.1.clone.1.clone.1, 9
  %803 = getelementptr double, ptr %arg69, i32 %linear_index
  %804 = getelementptr inbounds double, ptr %803, i32 0
  %805 = load double, ptr %804, align 8
  %806 = trunc i8 %24 to i1
  %807 = select i1 %806, double %805, double %constant_1655_22
  %808 = getelementptr double, ptr %arg69, i32 %linear_index
  %809 = getelementptr inbounds double, ptr %808, i32 0
  %810 = load double, ptr %809, align 8
  %811 = trunc i8 %24 to i1
  %812 = select i1 %811, double %constant_1655_22, double %810
  %add.3764.3.clone.1.clone.1 = fadd double %807, %812
  %813 = getelementptr double, ptr %arg64, i32 %linear_index
  %814 = getelementptr inbounds double, ptr %813, i32 0
  %815 = load double, ptr %814, align 8, !invariant.load !297
  %816 = trunc i64 %12 to i32
  %817 = icmp sge i32 0, %816
  %818 = select i1 %817, i32 0, i32 %816
  %819 = icmp sle i32 191, %818
  %dynamic-slice.1237.5.clone.1.clone.1.start_idx0 = select i1 %819, i32 191, i32 %818
  %constant_1653_1749 = load i64, ptr @443, align 8
  %820 = trunc i64 %constant_1653_1749 to i32
  %821 = icmp sge i32 0, %820
  %822 = select i1 %821, i32 0, i32 %820
  %823 = icmp sle i32 0, %822
  %dynamic-slice.1237.5.clone.1.clone.1.start_idx1 = select i1 %823, i32 0, i32 %822
  %824 = add i32 %dynamic-slice.1237.5.clone.1.clone.1.start_idx0, 0
  %825 = add i32 %dynamic-slice.1237.5.clone.1.clone.1.start_idx1, %3
  %826 = getelementptr inbounds [192 x [4 x i8]], ptr %arg68, i32 0, i32 %824, i32 %825
  %827 = load i8, ptr %826, align 1, !invariant.load !297
  %multiply.2836.11.clone.1.clone.1 = fmul double %add.3754.5.clone.1.clone.1, %357
  %add.3765.9.clone.1.clone.1 = fadd double %779, %multiply.2836.11.clone.1.clone.1
  %828 = trunc i8 %827 to i1
  %829 = select i1 %828, double %add.3765.9.clone.1.clone.1, double %constant_1655_22
  %830 = trunc i64 %12 to i32
  %831 = icmp sge i32 0, %830
  %832 = select i1 %831, i32 0, i32 %830
  %833 = icmp sle i32 191, %832
  %dynamic-slice.1238.5.clone.1.clone.1.start_idx0 = select i1 %833, i32 191, i32 %832
  %constant_1653_1750 = load i64, ptr @443, align 8
  %834 = trunc i64 %constant_1653_1750 to i32
  %835 = icmp sge i32 0, %834
  %836 = select i1 %835, i32 0, i32 %834
  %837 = icmp sle i32 0, %836
  %dynamic-slice.1238.5.clone.1.clone.1.start_idx1 = select i1 %837, i32 0, i32 %836
  %838 = add i32 %dynamic-slice.1238.5.clone.1.clone.1.start_idx0, 0
  %839 = add i32 %dynamic-slice.1238.5.clone.1.clone.1.start_idx1, %3
  %840 = getelementptr inbounds [192 x [4 x double]], ptr %arg65, i32 0, i32 %838, i32 %839
  %841 = load double, ptr %840, align 8, !invariant.load !297
  %multiply.2837.5.clone.1.clone.1 = fmul double %829, %841
  %add.3766.1.clone.1.clone.1 = fadd double %815, %multiply.2837.5.clone.1.clone.1
  %add.3767.1.clone.1.clone.1 = fadd double %add.3764.3.clone.1.clone.1, %add.3766.1.clone.1.clone.1
  %842 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %802, double %add.3767.1.clone.1.clone.1, 10
  %843 = getelementptr double, ptr %arg14, i32 %linear_index
  %844 = getelementptr inbounds double, ptr %843, i32 0
  %845 = load double, ptr %844, align 8
  %846 = trunc i8 %24 to i1
  %847 = select i1 %846, double %constant_1655_22, double %845
  %848 = getelementptr double, ptr %arg71, i32 %linear_index
  %849 = getelementptr inbounds double, ptr %848, i32 0
  %850 = load double, ptr %849, align 8, !invariant.load !297
  %851 = trunc i64 %12 to i32
  %852 = icmp sge i32 0, %851
  %853 = select i1 %852, i32 0, i32 %851
  %854 = icmp sle i32 191, %853
  %dynamic-slice.1239.3.clone.1.clone.1.start_idx0 = select i1 %854, i32 191, i32 %853
  %constant_1653_1751 = load i64, ptr @443, align 8
  %855 = trunc i64 %constant_1653_1751 to i32
  %856 = icmp sge i32 0, %855
  %857 = select i1 %856, i32 0, i32 %855
  %858 = icmp sle i32 0, %857
  %dynamic-slice.1239.3.clone.1.clone.1.start_idx1 = select i1 %858, i32 0, i32 %857
  %859 = add i32 %dynamic-slice.1239.3.clone.1.clone.1.start_idx0, 0
  %860 = add i32 %dynamic-slice.1239.3.clone.1.clone.1.start_idx1, %3
  %861 = getelementptr inbounds [192 x [4 x double]], ptr %arg77, i32 0, i32 %859, i32 %860
  %862 = load double, ptr %861, align 8, !invariant.load !297
  %multiply.2838.7.clone.1.clone.1 = fmul double %862, %multiply.2837.5.clone.1.clone.1
  %add.3769.5.clone.1.clone.1 = fadd double %850, %multiply.2838.7.clone.1.clone.1
  %863 = getelementptr double, ptr %arg70, i32 %linear_index
  %864 = getelementptr inbounds double, ptr %863, i32 0
  %865 = load double, ptr %864, align 8
  %866 = trunc i8 %24 to i1
  %867 = select i1 %866, double %865, double %constant_1655_22
  %add.3770.7.clone.1.clone.1 = fadd double %867, %147
  %868 = getelementptr double, ptr %arg1, i32 %linear_index
  %869 = getelementptr inbounds double, ptr %868, i32 0
  %870 = load double, ptr %869, align 8, !invariant.load !297
  %add.3771.5.clone.1.clone.1 = fadd double %add.3770.7.clone.1.clone.1, %870
  %multiply.2839.3.clone.1.clone.1 = fmul double %335, %add.3771.5.clone.1.clone.1
  %add.3772.3.clone.1.clone.1 = fadd double %add.3769.5.clone.1.clone.1, %multiply.2839.3.clone.1.clone.1
  %add.3774.1.clone.1.clone.1 = fadd double %847, %add.3772.3.clone.1.clone.1
  %871 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %842, double %add.3774.1.clone.1.clone.1, 11
  %872 = getelementptr double, ptr %arg70, i32 %linear_index
  %873 = getelementptr inbounds double, ptr %872, i32 0
  %874 = load double, ptr %873, align 8
  %875 = trunc i8 %24 to i1
  %876 = select i1 %875, double %constant_1655_22, double %874
  %877 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %871, double %876, 12
  %878 = getelementptr double, ptr %arg44, i32 %linear_index
  %879 = getelementptr inbounds double, ptr %878, i32 0
  %880 = load double, ptr %879, align 8
  %881 = trunc i8 %24 to i1
  %882 = select i1 %881, double %constant_1655_22, double %880
  %883 = getelementptr double, ptr %arg1, i32 %linear_index
  %884 = getelementptr inbounds double, ptr %883, i32 0
  %885 = load double, ptr %884, align 8, !invariant.load !297
  %add.3762.1.clone.1 = fadd double %882, %885
  %886 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %877, double %add.3762.1.clone.1, 13
  %887 = getelementptr double, ptr %arg46, i32 %linear_index
  %888 = getelementptr inbounds double, ptr %887, i32 0
  %889 = load double, ptr %888, align 8
  %890 = trunc i8 %24 to i1
  %891 = select i1 %890, double %constant_1655_22, double %889
  %892 = getelementptr double, ptr %arg1, i32 %linear_index
  %893 = getelementptr inbounds double, ptr %892, i32 0
  %894 = load double, ptr %893, align 8, !invariant.load !297
  %add.3761.1.clone.1 = fadd double %891, %894
  %895 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %886, double %add.3761.1.clone.1, 14
  %896 = getelementptr double, ptr %arg76, i32 %linear_index
  %897 = getelementptr inbounds double, ptr %896, i32 0
  %898 = load double, ptr %897, align 8
  %899 = trunc i8 %24 to i1
  %900 = select i1 %899, double %constant_1655_22, double %898
  %901 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %895, double %900, 15
  %902 = getelementptr double, ptr %arg47, i32 %linear_index
  %903 = getelementptr inbounds double, ptr %902, i32 0
  %904 = load double, ptr %903, align 8
  %905 = trunc i8 %24 to i1
  %906 = select i1 %905, double %constant_1655_22, double %904
  %907 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %901, double %906, 16
  %908 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 0
  %909 = getelementptr double, ptr %arg0, i32 %linear_index
  %910 = getelementptr inbounds double, ptr %909, i32 0
  store double %908, ptr %910, align 8
  %911 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 1
  %912 = getelementptr double, ptr %arg23, i32 %linear_index
  %913 = getelementptr inbounds double, ptr %912, i32 0
  store double %911, ptr %913, align 8
  %914 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 2
  %915 = getelementptr double, ptr %arg10, i32 %linear_index
  %916 = getelementptr inbounds double, ptr %915, i32 0
  store double %914, ptr %916, align 8
  %917 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 3
  %918 = getelementptr double, ptr %arg2, i32 %linear_index
  %919 = getelementptr inbounds double, ptr %918, i32 0
  store double %917, ptr %919, align 8
  %920 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 4
  %921 = getelementptr double, ptr %arg18, i32 %linear_index
  %922 = getelementptr inbounds double, ptr %921, i32 0
  store double %920, ptr %922, align 8
  %923 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 5
  %924 = getelementptr double, ptr %arg49, i32 %linear_index
  %925 = getelementptr inbounds double, ptr %924, i32 0
  store double %923, ptr %925, align 8
  %926 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 6
  %927 = getelementptr double, ptr %arg51, i32 %linear_index
  %928 = getelementptr inbounds double, ptr %927, i32 0
  store double %926, ptr %928, align 8
  %929 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 7
  %930 = getelementptr double, ptr %arg58, i32 %linear_index
  %931 = getelementptr inbounds double, ptr %930, i32 0
  store double %929, ptr %931, align 8
  %932 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 8
  %933 = getelementptr double, ptr %arg60, i32 %linear_index
  %934 = getelementptr inbounds double, ptr %933, i32 0
  store double %932, ptr %934, align 8
  %935 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 9
  %936 = getelementptr double, ptr %arg63, i32 %linear_index
  %937 = getelementptr inbounds double, ptr %936, i32 0
  store double %935, ptr %937, align 8
  %938 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 10
  %939 = getelementptr double, ptr %arg69, i32 %linear_index
  %940 = getelementptr inbounds double, ptr %939, i32 0
  store double %938, ptr %940, align 8
  %941 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 11
  %942 = getelementptr double, ptr %arg14, i32 %linear_index
  %943 = getelementptr inbounds double, ptr %942, i32 0
  store double %941, ptr %943, align 8
  %944 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 12
  %945 = getelementptr double, ptr %arg70, i32 %linear_index
  %946 = getelementptr inbounds double, ptr %945, i32 0
  store double %944, ptr %946, align 8
  %947 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 13
  %948 = getelementptr double, ptr %arg44, i32 %linear_index
  %949 = getelementptr inbounds double, ptr %948, i32 0
  store double %947, ptr %949, align 8
  %950 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 14
  %951 = getelementptr double, ptr %arg46, i32 %linear_index
  %952 = getelementptr inbounds double, ptr %951, i32 0
  store double %950, ptr %952, align 8
  %953 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 15
  %954 = getelementptr double, ptr %arg76, i32 %linear_index
  %955 = getelementptr inbounds double, ptr %954, i32 0
  store double %953, ptr %955, align 8
  %956 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double } %907, 16
  %957 = getelementptr double, ptr %arg47, i32 %linear_index
  %958 = getelementptr inbounds double, ptr %957, i32 0
  store double %956, ptr %958, align 8
  br label %loop_add_select_fusion.in_bounds-after
}

define void @input_add_reduce_fusion_2(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %return_buffer10 = alloca double, align 8
  %result_from_other_lane8 = alloca double, align 8
  %return_buffer7 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1685_10_clone_1 = load double, ptr @452, align 8
  store double %constant_1685_10_clone_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !315
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = udiv i32 %thread.id.x, 4
  %thread.id.1 = urem i32 %1, 8
  %thread.id.2 = urem i32 %thread.id.x, 4
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 1, i32 8
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 8
  %tile_origin.2 = mul i32 %3, 4
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %8 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %8, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 8
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %9 = icmp uge i32 %loop2.indvar, 4
  br i1 %9, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 4
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %10 = add i32 %loop2.indvar, %thread.id.2
  %11 = icmp ult i32 %10, 4
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !322

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !323

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result6 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result6 to i64
  %13 = bitcast i64 %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 2, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 0
  %17 = extractelement <2 x i32> %16, i64 1
  %18 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 2, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to i64
  %21 = bitcast i64 %20 to double
  store double %21, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer7)
  %22 = load double, ptr %return_buffer7, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result9 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result9 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 1, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 1, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane8, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane8, ptr %return_buffer10)
  %33 = load double, ptr %return_buffer10, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %34 = udiv i32 %thread.id.2, 32
  %35 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %35, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %36 = add i32 %tile_origin.0, 0
  %37 = add i32 %tile_origin.1, %loop1.indvar
  %38 = add i32 %tile_origin.2, %10
  %param_5.1708 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %38
  %param_5.17082 = load double, ptr %param_5.1708, align 8, !invariant.load !297
  %constant_1720_1_clone_1 = load double, ptr @450, align 8
  %add.3855.5.clone.1 = fadd double %param_5.17082, %constant_1720_1_clone_1
  %multiply.2966.1.clone.1 = fmul double %add.3855.5.clone.1, %add.3855.5.clone.1
  %constant_1693_1_clone_1 = load double, ptr @454, align 8
  %add.3877.1.clone.1 = fadd double %multiply.2966.1.clone.1, %constant_1693_1_clone_1
  %constant_1684_1_clone_1 = load double, ptr @453, align 8
  %multiply.2967.1.clone.1 = fmul double %add.3877.1.clone.1, %constant_1684_1_clone_1
  store double %multiply.2967.1.clone.1, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %39 = load double, ptr %return_buffer, align 8
  store double %39, ptr %partial_reduction_result, align 8
  %param_0.3137 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  %param_0.31373 = load double, ptr %param_0.3137, align 8
  %param_3.2757 = load i64, ptr %arg3, align 8, !invariant.load !297
  %40 = sitofp i64 %param_3.2757 to double
  %param_2.3547 = load double, ptr %arg2, align 8, !invariant.load !297
  %multiply.2909.23 = fmul double %40, %param_2.3547
  %constant_1690_6 = load double, ptr @451, align 8
  %multiply.2910.9 = fmul double %multiply.2909.23, %constant_1690_6
  %param_1.4494 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %38
  %param_1.44944 = load double, ptr %param_1.4494, align 8, !invariant.load !297
  %multiply.2914.3 = fmul double %multiply.2910.9, %param_1.44944
  %add.3827.3 = fadd double %param_0.31373, %multiply.2914.3
  %param_4.2119 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %38
  %param_4.21195 = load double, ptr %param_4.2119, align 8, !invariant.load !297
  %multiply.2946.3.clone.1 = fmul double %add.3855.5.clone.1, %constant_1720_1_clone_1
  %add.3856.1.clone.1 = fadd double %param_4.21195, %multiply.2946.3.clone.1
  %multiply.2947.1 = fmul double %multiply.2910.9, %add.3856.1.clone.1
  %add.3857.1 = fadd double %add.3827.3, %multiply.2947.1
  %41 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  store double %add.3857.1, ptr %41, align 8
  %42 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %38
  store double %add.3856.1.clone.1, ptr %42, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %43 = and i32 %thread.id.2, 3
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %45 = add i32 %tile_origin.1, %thread.id.1
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %arg7, align 8
  br label %reduction_write_output-after
}

define void @input_add_reduce_fusion_1(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %return_buffer10 = alloca double, align 8
  %result_from_other_lane8 = alloca double, align 8
  %return_buffer7 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1685_16_clone_1 = load double, ptr @458, align 8
  store double %constant_1685_16_clone_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !315
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = udiv i32 %thread.id.x, 4
  %thread.id.1 = urem i32 %1, 8
  %thread.id.2 = urem i32 %thread.id.x, 4
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 1, i32 8
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 8
  %tile_origin.2 = mul i32 %3, 4
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %8 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %8, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 8
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %9 = icmp uge i32 %loop2.indvar, 4
  br i1 %9, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 4
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %10 = add i32 %loop2.indvar, %thread.id.2
  %11 = icmp ult i32 %10, 4
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !324

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !325

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result6 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result6 to i64
  %13 = bitcast i64 %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 2, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 0
  %17 = extractelement <2 x i32> %16, i64 1
  %18 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 2, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to i64
  %21 = bitcast i64 %20 to double
  store double %21, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer7)
  %22 = load double, ptr %return_buffer7, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result9 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result9 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 1, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 1, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane8, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane8, ptr %return_buffer10)
  %33 = load double, ptr %return_buffer10, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %34 = udiv i32 %thread.id.2, 32
  %35 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %35, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %36 = add i32 %tile_origin.0, 0
  %37 = add i32 %tile_origin.1, %loop1.indvar
  %38 = add i32 %tile_origin.2, %10
  %param_5.1704 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %38
  %param_5.17042 = load double, ptr %param_5.1704, align 8, !invariant.load !297
  %constant_1719_2_clone_1 = load double, ptr @456, align 8
  %add.3859.5.clone.1 = fadd double %param_5.17042, %constant_1719_2_clone_1
  %multiply.2952.1.clone.1 = fmul double %add.3859.5.clone.1, %add.3859.5.clone.1
  %constant_1717_2_clone_1 = load double, ptr @461, align 8
  %multiply.2953.1.clone.1 = fmul double %multiply.2952.1.clone.1, %constant_1717_2_clone_1
  %constant_1695_2_clone_1 = load double, ptr @460, align 8
  %add.3866.1.clone.1 = fadd double %multiply.2953.1.clone.1, %constant_1695_2_clone_1
  %constant_1684_2_clone_1 = load double, ptr @459, align 8
  %multiply.2954.1.clone.1 = fmul double %add.3866.1.clone.1, %constant_1684_2_clone_1
  store double %multiply.2954.1.clone.1, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %39 = load double, ptr %return_buffer, align 8
  store double %39, ptr %partial_reduction_result, align 8
  %param_0.3136 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  %param_0.31363 = load double, ptr %param_0.3136, align 8
  %param_3.2756 = load i64, ptr %arg3, align 8, !invariant.load !297
  %40 = sitofp i64 %param_3.2756 to double
  %param_2.3546 = load double, ptr %arg2, align 8, !invariant.load !297
  %multiply.2909.19 = fmul double %40, %param_2.3546
  %constant_1690_5 = load double, ptr @457, align 8
  %multiply.2910.5 = fmul double %multiply.2909.19, %constant_1690_5
  %param_1.4493 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %38
  %param_1.44934 = load double, ptr %param_1.4493, align 8, !invariant.load !297
  %multiply.2915.3 = fmul double %multiply.2910.5, %param_1.44934
  %add.3829.3 = fadd double %param_0.31363, %multiply.2915.3
  %param_4.2118 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %38
  %param_4.21185 = load double, ptr %param_4.2118, align 8, !invariant.load !297
  %constant_1723_2_clone_1 = load double, ptr @455, align 8
  %multiply.2948.3.clone.1 = fmul double %add.3859.5.clone.1, %constant_1723_2_clone_1
  %add.3860.1.clone.1 = fadd double %param_4.21185, %multiply.2948.3.clone.1
  %multiply.2949.1 = fmul double %multiply.2910.5, %add.3860.1.clone.1
  %add.3861.1 = fadd double %add.3829.3, %multiply.2949.1
  %41 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  store double %add.3861.1, ptr %41, align 8
  %42 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %38
  store double %add.3860.1.clone.1, ptr %42, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %43 = and i32 %thread.id.2, 3
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %45 = add i32 %tile_origin.1, %thread.id.1
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %arg7, align 8
  br label %reduction_write_output-after
}

define void @input_add_reduce_fusion_4(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %return_buffer10 = alloca double, align 8
  %result_from_other_lane8 = alloca double, align 8
  %return_buffer7 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1685_11_clone_1 = load double, ptr @465, align 8
  store double %constant_1685_11_clone_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !315
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = udiv i32 %thread.id.x, 4
  %thread.id.1 = urem i32 %1, 8
  %thread.id.2 = urem i32 %thread.id.x, 4
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 1, i32 8
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 8
  %tile_origin.2 = mul i32 %3, 4
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %8 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %8, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 8
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %9 = icmp uge i32 %loop2.indvar, 4
  br i1 %9, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 4
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %10 = add i32 %loop2.indvar, %thread.id.2
  %11 = icmp ult i32 %10, 4
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !326

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !327

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result6 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result6 to i64
  %13 = bitcast i64 %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 2, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 0
  %17 = extractelement <2 x i32> %16, i64 1
  %18 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 2, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to i64
  %21 = bitcast i64 %20 to double
  store double %21, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer7)
  %22 = load double, ptr %return_buffer7, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result9 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result9 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 1, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 1, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane8, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane8, ptr %return_buffer10)
  %33 = load double, ptr %return_buffer10, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %34 = udiv i32 %thread.id.2, 32
  %35 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %35, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %36 = add i32 %tile_origin.0, 0
  %37 = add i32 %tile_origin.1, %loop1.indvar
  %38 = add i32 %tile_origin.2, %10
  %param_4.2123 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %38
  %param_4.21232 = load double, ptr %param_4.2123, align 8, !invariant.load !297
  %constant_1720_3_clone_1 = load double, ptr @463, align 8
  %add.3847.5.clone.1 = fadd double %param_4.21232, %constant_1720_3_clone_1
  %multiply.2963.1.clone.1 = fmul double %add.3847.5.clone.1, %add.3847.5.clone.1
  %constant_1719_1_clone_1 = load double, ptr @468, align 8
  %multiply.2964.1.clone.1 = fmul double %multiply.2963.1.clone.1, %constant_1719_1_clone_1
  %constant_1692_1_clone_1 = load double, ptr @467, align 8
  %add.3875.1.clone.1 = fadd double %multiply.2964.1.clone.1, %constant_1692_1_clone_1
  %constant_1684_6_clone_1 = load double, ptr @466, align 8
  %multiply.2965.1.clone.1 = fmul double %add.3875.1.clone.1, %constant_1684_6_clone_1
  store double %multiply.2965.1.clone.1, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %39 = load double, ptr %return_buffer, align 8
  store double %39, ptr %partial_reduction_result, align 8
  %param_0.3139 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  %param_0.31393 = load double, ptr %param_0.3139, align 8
  %param_3.2759 = load i64, ptr %arg3, align 8, !invariant.load !297
  %40 = sitofp i64 %param_3.2759 to double
  %param_2.3549 = load double, ptr %arg2, align 8, !invariant.load !297
  %multiply.2909.27 = fmul double %40, %param_2.3549
  %constant_1690_8 = load double, ptr @464, align 8
  %multiply.2910.13 = fmul double %multiply.2909.27, %constant_1690_8
  %param_1.4496 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %38
  %param_1.44964 = load double, ptr %param_1.4496, align 8, !invariant.load !297
  %multiply.2912.3 = fmul double %multiply.2910.13, %param_1.44964
  %add.3825.3 = fadd double %param_0.31393, %multiply.2912.3
  %param_5.1716 = getelementptr inbounds [4 x [1 x double]], ptr %arg5, i32 0, i32 %38, i32 0
  %param_5.17165 = load double, ptr %param_5.1716, align 8, !invariant.load !297
  %constant_1697_1_clone_1 = load double, ptr @462, align 8
  %multiply.2940.1.clone.1 = fmul double %add.3847.5.clone.1, %constant_1697_1_clone_1
  %add.3849.1.clone.1 = fadd double %param_5.17165, %multiply.2940.1.clone.1
  %multiply.2941.1 = fmul double %multiply.2910.13, %add.3849.1.clone.1
  %add.3850.1 = fadd double %add.3825.3, %multiply.2941.1
  %41 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  store double %add.3850.1, ptr %41, align 8
  %42 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %38
  store double %add.3849.1.clone.1, ptr %42, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %43 = and i32 %thread.id.2, 3
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %45 = add i32 %tile_origin.1, %thread.id.1
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %arg7, align 8
  br label %reduction_write_output-after
}

define void @input_add_reduce_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %return_buffer10 = alloca double, align 8
  %result_from_other_lane8 = alloca double, align 8
  %return_buffer7 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1685_19_clone_1 = load double, ptr @472, align 8
  store double %constant_1685_19_clone_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !315
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = udiv i32 %thread.id.x, 4
  %thread.id.1 = urem i32 %1, 8
  %thread.id.2 = urem i32 %thread.id.x, 4
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 1, i32 8
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 8
  %tile_origin.2 = mul i32 %3, 4
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %8 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %8, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 8
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %9 = icmp uge i32 %loop2.indvar, 4
  br i1 %9, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 4
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %10 = add i32 %loop2.indvar, %thread.id.2
  %11 = icmp ult i32 %10, 4
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !328

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !329

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result6 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result6 to i64
  %13 = bitcast i64 %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 2, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 0
  %17 = extractelement <2 x i32> %16, i64 1
  %18 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 2, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to i64
  %21 = bitcast i64 %20 to double
  store double %21, ptr %result_from_other_lane, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer7)
  %22 = load double, ptr %return_buffer7, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result9 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result9 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 1, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 1, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane8, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane8, ptr %return_buffer10)
  %33 = load double, ptr %return_buffer10, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %34 = udiv i32 %thread.id.2, 32
  %35 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %35, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %36 = add i32 %tile_origin.0, 0
  %37 = add i32 %tile_origin.1, %loop1.indvar
  %38 = add i32 %tile_origin.2, %10
  %param_5.1701 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %38
  %param_5.17012 = load double, ptr %param_5.1701, align 8, !invariant.load !297
  %constant_1724_1_clone_1 = load double, ptr @470, align 8
  %add.3862.5.clone.1 = fadd double %param_5.17012, %constant_1724_1_clone_1
  %multiply.2960.1.clone.1 = fmul double %add.3862.5.clone.1, %add.3862.5.clone.1
  %constant_1717_1_clone_1 = load double, ptr @475, align 8
  %multiply.2961.1.clone.1 = fmul double %multiply.2960.1.clone.1, %constant_1717_1_clone_1
  %constant_1695_1_clone_1 = load double, ptr @474, align 8
  %add.3872.1.clone.1 = fadd double %multiply.2961.1.clone.1, %constant_1695_1_clone_1
  %constant_1684_5_clone_1 = load double, ptr @473, align 8
  %multiply.2962.1.clone.1 = fmul double %add.3872.1.clone.1, %constant_1684_5_clone_1
  store double %multiply.2962.1.clone.1, ptr %reduction_input_address, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %39 = load double, ptr %return_buffer, align 8
  store double %39, ptr %partial_reduction_result, align 8
  %param_0.3135 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  %param_0.31353 = load double, ptr %param_0.3135, align 8
  %param_3.2755 = load i64, ptr %arg3, align 8, !invariant.load !297
  %40 = sitofp i64 %param_3.2755 to double
  %param_2.3545 = load double, ptr %arg2, align 8, !invariant.load !297
  %multiply.2909.17 = fmul double %40, %param_2.3545
  %constant_1690_4 = load double, ptr @471, align 8
  %multiply.2910.3 = fmul double %multiply.2909.17, %constant_1690_4
  %param_1.4492 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %38
  %param_1.44924 = load double, ptr %param_1.4492, align 8, !invariant.load !297
  %multiply.2916.3 = fmul double %multiply.2910.3, %param_1.44924
  %add.3830.3 = fadd double %param_0.31353, %multiply.2916.3
  %param_4.2117 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %38
  %param_4.21175 = load double, ptr %param_4.2117, align 8, !invariant.load !297
  %constant_1723_1_clone_1 = load double, ptr @469, align 8
  %multiply.2950.3.clone.1 = fmul double %add.3862.5.clone.1, %constant_1723_1_clone_1
  %add.3864.1.clone.1 = fadd double %param_4.21175, %multiply.2950.3.clone.1
  %multiply.2951.1 = fmul double %multiply.2910.3, %add.3864.1.clone.1
  %add.3865.1 = fadd double %add.3830.3, %multiply.2951.1
  %41 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  store double %add.3865.1, ptr %41, align 8
  %42 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %38
  store double %add.3864.1.clone.1, ptr %42, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %43 = and i32 %thread.id.2, 3
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %45 = add i32 %tile_origin.1, %thread.id.1
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %arg7, align 8
  br label %reduction_write_output-after
}

define void @wrapped_concatenate(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(192) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %2 = mul nuw nsw i32 %0, 24
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 24
  br i1 %4, label %wrapped_concatenate.in_bounds-true, label %wrapped_concatenate.in_bounds-after

wrapped_concatenate.in_bounds-after:              ; preds = %concatenate.40.1.merge, %entry
  ret void

wrapped_concatenate.in_bounds-true:               ; preds = %entry
  br label %concatenate.pivot.12.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %6
  %8 = load double, ptr %7, align 8, !invariant.load !297
  br label %concatenate.40.1.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.4.1
  %9 = phi i32 [ 4, %concatenate.pivot.4.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %10
  %12 = load double, ptr %11, align 8, !invariant.load !297
  br label %concatenate.40.1.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.8.2
  %13 = phi i32 [ 8, %concatenate.pivot.8.2 ]
  %14 = sub nsw i32 %3, %13
  %15 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %14
  %16 = load double, ptr %15, align 8, !invariant.load !297
  br label %concatenate.40.1.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.12.3
  %17 = phi i32 [ 12, %concatenate.pivot.12.3 ]
  %18 = sub nsw i32 %3, %17
  %19 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %18
  %20 = load double, ptr %19, align 8, !invariant.load !297
  br label %concatenate.40.1.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.16.4
  %21 = phi i32 [ 16, %concatenate.pivot.16.4 ]
  %22 = sub nsw i32 %3, %21
  %23 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %22
  %24 = load double, ptr %23, align 8, !invariant.load !297
  br label %concatenate.40.1.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.20.5
  %25 = phi i32 [ 20, %concatenate.pivot.20.5 ]
  %26 = sub nsw i32 %3, %25
  %27 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %26
  %28 = load double, ptr %27, align 8, !invariant.load !297
  br label %concatenate.40.1.merge

concatenate.pivot.12.:                            ; preds = %wrapped_concatenate.in_bounds-true
  %29 = icmp ult i32 %3, 12
  br i1 %29, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %concatenate.pivot.12.
  %30 = icmp ult i32 %3, 4
  br i1 %30, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id0

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %31 = icmp ult i32 %3, 8
  br i1 %31, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id1

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id2

concatenate.pivot.16.:                            ; preds = %concatenate.pivot.12.
  %32 = icmp ult i32 %3, 16
  br i1 %32, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id3

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %33 = icmp ult i32 %3, 20
  br i1 %33, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id4

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id5

concatenate.40.1.merge:                           ; preds = %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %34 = phi double [ %8, %concat_index_from_operand_id0 ], [ %12, %concat_index_from_operand_id1 ], [ %16, %concat_index_from_operand_id2 ], [ %20, %concat_index_from_operand_id3 ], [ %24, %concat_index_from_operand_id4 ], [ %28, %concat_index_from_operand_id5 ]
  %35 = getelementptr double, ptr %arg6, i32 %linear_index
  %36 = getelementptr inbounds double, ptr %35, i32 0
  store double %34, ptr %36, align 8
  br label %wrapped_concatenate.in_bounds-after
}

define void @loop_add_minimum_select_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(192) %arg1, ptr noalias align 128 dereferenceable(192) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(8) %arg7, ptr noalias align 128 dereferenceable(8) %arg8, ptr noalias align 128 dereferenceable(8) %arg9, ptr noalias align 128 dereferenceable(8) %arg10, ptr noalias align 128 dereferenceable(8) %arg11, ptr noalias align 128 dereferenceable(8) %arg12, ptr noalias align 128 dereferenceable(8) %arg13) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.41.1.clone.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_minimum_select_fusion.in_bounds-true, label %loop_add_minimum_select_fusion.in_bounds-after

loop_add_minimum_select_fusion.in_bounds-after:   ; preds = %reduce.41.1.clone.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_add_minimum_select_fusion.in_bounds-true:    ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !297
  %5 = load double, ptr %arg8, align 8, !invariant.load !297
  %6 = load double, ptr %arg9, align 8, !invariant.load !297
  %add.3869.1.clone.1 = fadd double %5, %6
  %7 = load double, ptr %arg7, align 8, !invariant.load !297
  %add.3871.1.clone.1 = fadd double %add.3869.1.clone.1, %7
  %8 = load double, ptr %arg6, align 8, !invariant.load !297
  %add.3874.1.clone.1 = fadd double %add.3871.1.clone.1, %8
  %9 = load double, ptr %arg5, align 8, !invariant.load !297
  %add.3876.1.clone.1 = fadd double %add.3874.1.clone.1, %9
  %10 = load double, ptr %arg4, align 8, !invariant.load !297
  %add.3879.1.clone.1 = fadd double %add.3876.1.clone.1, %10
  %11 = load double, ptr %arg3, align 8, !invariant.load !297
  %add.3880.1.clone.1 = fadd double %add.3879.1.clone.1, %11
  %12 = fneg double %add.3880.1.clone.1
  %constant_1685_7 = load double, ptr @477, align 8
  store double %constant_1685_7, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.41.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.41.1.clone.1.inner.loop_header.reduction_dim.0

reduce.41.1.clone.1.inner.loop_header.reduction_dim.0: ; preds = %reduce.41.1.clone.1.inner.loop_body.reduction_dim.0, %loop_add_minimum_select_fusion.in_bounds-true
  %reduce.41.1.clone.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.41.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  %13 = icmp uge i32 %reduce.41.1.clone.1.inner.indvar.reduction_dim.0, 24
  br i1 %13, label %reduce.41.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.41.1.clone.1.inner.loop_body.reduction_dim.0

reduce.41.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.41.1.clone.1.inner.loop_header.reduction_dim.0
  %14 = load double, ptr %accumulator_0, align 8
  %15 = getelementptr inbounds [24 x double], ptr %arg2, i32 0, i32 %reduce.41.1.clone.1.inner.indvar.reduction_dim.0
  %16 = load double, ptr %15, align 8, !invariant.load !297
  %17 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %reduce.41.1.clone.1.inner.indvar.reduction_dim.0
  %18 = load double, ptr %17, align 8, !invariant.load !297
  %multiply.2968.3.clone.1 = fmul double %16, %18
  %19 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %reduce.41.1.clone.1.inner.indvar.reduction_dim.0
  %20 = load double, ptr %19, align 8, !invariant.load !297
  %multiply.2969.3.clone.1 = fmul double %multiply.2968.3.clone.1, %20
  store double %14, ptr %parameter_buffer, align 8
  store double %multiply.2969.3.clone.1, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %21 = load double, ptr %return_buffer, align 8
  store double %21, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.41.1.clone.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.41.1.clone.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.41.1.clone.1.inner.loop_header.reduction_dim.0

reduce.41.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.41.1.clone.1.inner.loop_header.reduction_dim.0
  %22 = load double, ptr %accumulator_0, align 8
  %constant_1690_3_clone_1 = load double, ptr @476, align 8
  %multiply.2970.1.clone.1 = fmul double %22, %constant_1690_3_clone_1
  %add.3881.1.clone.1 = fadd double %12, %multiply.2970.1.clone.1
  %subtract.237.1.clone.1 = fsub double %4, %add.3881.1.clone.1
  %compare.644.1.clone.1 = fcmp une double %subtract.237.1.clone.1, %subtract.237.1.clone.1
  %23 = zext i1 %compare.644.1.clone.1 to i8
  %constant_1683_1_clone_1 = load double, ptr @478, align 8
  %24 = trunc i8 %23 to i1
  %25 = select i1 %24, double %constant_1683_1_clone_1, double %subtract.237.1.clone.1
  %constant_1685_72 = load double, ptr @477, align 8
  %26 = fcmp une double %25, %25
  %27 = fcmp oeq double %constant_1685_72, %constant_1685_72
  %28 = fcmp ole double %25, %constant_1685_72
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %minimum.8.1 = select i1 %30, double %25, double %constant_1685_72
  %31 = insertvalue { double, double, double, double } undef, double %minimum.8.1, 0
  %32 = insertvalue { double, double, double, double } %31, double %25, 1
  %33 = insertvalue { double, double, double, double } %32, double %add.3881.1.clone.1, 2
  %34 = load double, ptr %arg8, align 8, !invariant.load !297
  %35 = load double, ptr %arg9, align 8, !invariant.load !297
  %add.3869.1.clone.13 = fadd double %34, %35
  %36 = load double, ptr %arg7, align 8, !invariant.load !297
  %add.3871.1.clone.14 = fadd double %add.3869.1.clone.13, %36
  %37 = load double, ptr %arg6, align 8, !invariant.load !297
  %add.3874.1.clone.15 = fadd double %add.3871.1.clone.14, %37
  %38 = load double, ptr %arg5, align 8, !invariant.load !297
  %add.3876.1.clone.16 = fadd double %add.3874.1.clone.15, %38
  %39 = load double, ptr %arg4, align 8, !invariant.load !297
  %add.3879.1.clone.17 = fadd double %add.3876.1.clone.16, %39
  %40 = load double, ptr %arg3, align 8, !invariant.load !297
  %add.3880.1.clone.18 = fadd double %add.3879.1.clone.17, %40
  %41 = insertvalue { double, double, double, double } %33, double %add.3880.1.clone.18, 3
  %42 = extractvalue { double, double, double, double } %41, 0
  store double %42, ptr %arg10, align 8
  %43 = extractvalue { double, double, double, double } %41, 1
  store double %43, ptr %arg11, align 8
  %44 = extractvalue { double, double, double, double } %41, 2
  store double %44, ptr %arg12, align 8
  %45 = extractvalue { double, double, double, double } %41, 3
  store double %45, ptr %arg13, align 8
  br label %loop_add_minimum_select_fusion.in_bounds-after
}

define void @loop_compare_fusion_3(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_compare_fusion.3.in_bounds-true, label %loop_compare_fusion.3.in_bounds-after

loop_compare_fusion.3.in_bounds-after:            ; preds = %loop_compare_fusion.3.in_bounds-true, %entry
  ret void

loop_compare_fusion.3.in_bounds-true:             ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !297
  %5 = fneg double %4
  %constant_1682_1 = load double, ptr @479, align 8
  %compare.649.1 = fcmp ogt double %5, %constant_1682_1
  %6 = zext i1 %compare.649.1 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.3.in_bounds-after
}

define void @loop_select_fusion_3(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.3.in_bounds-true, label %loop_select_fusion.3.in_bounds-after

loop_select_fusion.3.in_bounds-after:             ; preds = %loop_select_fusion.3.in_bounds-true, %entry
  ret void

loop_select_fusion.3.in_bounds-true:              ; preds = %entry
  %4 = load double, ptr %arg0, align 8
  %5 = load double, ptr %arg1, align 8, !invariant.load !297
  %subtract.224.1 = fsub double %4, %5
  %compare.613.1 = fcmp une double %subtract.224.1, %subtract.224.1
  %6 = zext i1 %compare.613.1 to i8
  %7 = load double, ptr %arg0, align 8
  %8 = load double, ptr %arg1, align 8, !invariant.load !297
  %add.3713.1 = fadd double %7, %8
  %9 = load double, ptr %arg0, align 8
  %10 = load double, ptr %arg1, align 8, !invariant.load !297
  %11 = fcmp une double %9, %9
  %12 = fcmp oeq double %10, %10
  %13 = fcmp oge double %9, %10
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %maximum.40.1 = select i1 %15, double %9, double %10
  %16 = call double @llvm.fabs.f64(double %subtract.224.1)
  %17 = fneg double %16
  %18 = call double @__nv_exp(double %17)
  %19 = call double @__nv_log1p(double %18)
  %add.3714.1 = fadd double %maximum.40.1, %19
  %20 = trunc i8 %6 to i1
  %21 = select i1 %20, double %add.3713.1, double %add.3714.1
  store double %21, ptr %arg0, align 8
  br label %loop_select_fusion.3.in_bounds-after
}

define void @loop_select_fusion_4(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.4.in_bounds-true, label %loop_select_fusion.4.in_bounds-after

loop_select_fusion.4.in_bounds-after:             ; preds = %loop_select_fusion.4.in_bounds-true, %entry
  ret void

loop_select_fusion.4.in_bounds-true:              ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !297
  %5 = load double, ptr %arg1, align 8, !invariant.load !297
  %subtract.223.1 = fsub double %4, %5
  %compare.612.1 = fcmp une double %subtract.223.1, %subtract.223.1
  %6 = zext i1 %compare.612.1 to i8
  %7 = load double, ptr %arg0, align 8, !invariant.load !297
  %8 = load double, ptr %arg1, align 8, !invariant.load !297
  %add.3711.1 = fadd double %7, %8
  %9 = load double, ptr %arg0, align 8, !invariant.load !297
  %10 = load double, ptr %arg1, align 8, !invariant.load !297
  %11 = fcmp une double %9, %9
  %12 = fcmp oeq double %10, %10
  %13 = fcmp oge double %9, %10
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %maximum.39.1 = select i1 %15, double %9, double %10
  %16 = call double @llvm.fabs.f64(double %subtract.223.1)
  %17 = fneg double %16
  %18 = call double @__nv_exp(double %17)
  %19 = call double @__nv_log1p(double %18)
  %add.3712.1 = fadd double %maximum.39.1, %19
  %20 = trunc i8 %6 to i1
  %21 = select i1 %20, double %add.3711.1, double %add.3712.1
  store double %21, ptr %arg2, align 8
  br label %loop_select_fusion.4.in_bounds-after
}

define void @loop_convert_fusion_1(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_convert_fusion.1.in_bounds-true, label %loop_convert_fusion.1.in_bounds-after

loop_convert_fusion.1.in_bounds-after:            ; preds = %loop_convert_fusion.1.in_bounds-true, %entry
  ret void

loop_convert_fusion.1.in_bounds-true:             ; preds = %entry
  %4 = getelementptr double, ptr @501, i32 %linear_index
  %constant_1333_1 = getelementptr inbounds double, ptr %4, i32 0
  %constant_1333_11 = load double, ptr %constant_1333_1, align 8
  %5 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 0
  %6 = load i32, ptr %5, align 4, !invariant.load !297
  %7 = add i32 0, %6
  %8 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 1
  %9 = load i32, ptr %8, align 4, !invariant.load !297
  %10 = add i32 1, %9
  %11 = add i32 %7, %10
  %12 = getelementptr i32, ptr @497, i32 %linear_index
  %constant_485_1 = getelementptr inbounds i32, ptr %12, i32 0
  %constant_485_12 = load i32, ptr %constant_485_1, align 4
  %13 = shl i32 %10, %constant_485_12
  %shft.chk = icmp ult i32 %constant_485_12, 32
  %14 = select i1 %shft.chk, i32 %13, i32 0
  %15 = getelementptr i32, ptr @488, i32 %linear_index
  %constant_487_1 = getelementptr inbounds i32, ptr %15, i32 0
  %constant_487_13 = load i32, ptr %constant_487_1, align 4
  %16 = lshr i32 %10, %constant_487_13
  %shft.chk4 = icmp ult i32 %constant_487_13, 32
  %17 = select i1 %shft.chk4, i32 %16, i32 0
  %18 = or i32 %14, %17
  %19 = xor i32 %11, %18
  %20 = add i32 %11, %19
  %21 = getelementptr i32, ptr @494, i32 %linear_index
  %constant_489_1 = getelementptr inbounds i32, ptr %21, i32 0
  %constant_489_15 = load i32, ptr %constant_489_1, align 4
  %22 = shl i32 %19, %constant_489_15
  %shft.chk6 = icmp ult i32 %constant_489_15, 32
  %23 = select i1 %shft.chk6, i32 %22, i32 0
  %24 = getelementptr i32, ptr @487, i32 %linear_index
  %constant_491_1 = getelementptr inbounds i32, ptr %24, i32 0
  %constant_491_17 = load i32, ptr %constant_491_1, align 4
  %25 = lshr i32 %19, %constant_491_17
  %shft.chk8 = icmp ult i32 %constant_491_17, 32
  %26 = select i1 %shft.chk8, i32 %25, i32 0
  %27 = or i32 %23, %26
  %28 = xor i32 %20, %27
  %29 = add i32 %20, %28
  %30 = getelementptr i32, ptr @485, i32 %linear_index
  %constant_493_1 = getelementptr inbounds i32, ptr %30, i32 0
  %constant_493_19 = load i32, ptr %constant_493_1, align 4
  %31 = shl i32 %28, %constant_493_19
  %shft.chk10 = icmp ult i32 %constant_493_19, 32
  %32 = select i1 %shft.chk10, i32 %31, i32 0
  %33 = getelementptr i32, ptr @486, i32 %linear_index
  %constant_495_1 = getelementptr inbounds i32, ptr %33, i32 0
  %constant_495_111 = load i32, ptr %constant_495_1, align 4
  %34 = lshr i32 %28, %constant_495_111
  %shft.chk12 = icmp ult i32 %constant_495_111, 32
  %35 = select i1 %shft.chk12, i32 %34, i32 0
  %36 = or i32 %32, %35
  %37 = xor i32 %29, %36
  %38 = add i32 %29, %37
  %39 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 1
  %40 = load i32, ptr %39, align 4, !invariant.load !297
  %41 = add i32 %38, %40
  %42 = getelementptr i32, ptr @486, i32 %linear_index
  %constant_495_113 = getelementptr inbounds i32, ptr %42, i32 0
  %constant_495_114 = load i32, ptr %constant_495_113, align 4
  %43 = shl i32 %37, %constant_495_114
  %shft.chk15 = icmp ult i32 %constant_495_114, 32
  %44 = select i1 %shft.chk15, i32 %43, i32 0
  %45 = getelementptr i32, ptr @485, i32 %linear_index
  %constant_493_116 = getelementptr inbounds i32, ptr %45, i32 0
  %constant_493_117 = load i32, ptr %constant_493_116, align 4
  %46 = lshr i32 %37, %constant_493_117
  %shft.chk18 = icmp ult i32 %constant_493_117, 32
  %47 = select i1 %shft.chk18, i32 %46, i32 0
  %48 = or i32 %44, %47
  %49 = xor i32 %38, %48
  %50 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 0
  %51 = load i32, ptr %50, align 4, !invariant.load !297
  %52 = xor i32 %51, %40
  %53 = getelementptr i32, ptr @490, i32 %linear_index
  %constant_1214_1 = getelementptr inbounds i32, ptr %53, i32 0
  %constant_1214_119 = load i32, ptr %constant_1214_1, align 4
  %54 = xor i32 %52, %constant_1214_119
  %55 = add i32 %49, %54
  %56 = getelementptr i32, ptr @496, i32 %linear_index
  %constant_499_1 = getelementptr inbounds i32, ptr %56, i32 0
  %constant_499_120 = load i32, ptr %constant_499_1, align 4
  %57 = add i32 %55, %constant_499_120
  %58 = add i32 %41, %57
  %59 = getelementptr i32, ptr @487, i32 %linear_index
  %constant_491_121 = getelementptr inbounds i32, ptr %59, i32 0
  %constant_491_122 = load i32, ptr %constant_491_121, align 4
  %60 = shl i32 %57, %constant_491_122
  %shft.chk23 = icmp ult i32 %constant_491_122, 32
  %61 = select i1 %shft.chk23, i32 %60, i32 0
  %62 = getelementptr i32, ptr @494, i32 %linear_index
  %constant_489_124 = getelementptr inbounds i32, ptr %62, i32 0
  %constant_489_125 = load i32, ptr %constant_489_124, align 4
  %63 = lshr i32 %57, %constant_489_125
  %shft.chk26 = icmp ult i32 %constant_489_125, 32
  %64 = select i1 %shft.chk26, i32 %63, i32 0
  %65 = or i32 %61, %64
  %66 = xor i32 %58, %65
  %67 = add i32 %58, %66
  %68 = getelementptr i32, ptr @498, i32 %linear_index
  %constant_501_1 = getelementptr inbounds i32, ptr %68, i32 0
  %constant_501_127 = load i32, ptr %constant_501_1, align 4
  %69 = shl i32 %66, %constant_501_127
  %shft.chk28 = icmp ult i32 %constant_501_127, 32
  %70 = select i1 %shft.chk28, i32 %69, i32 0
  %71 = getelementptr i32, ptr @493, i32 %linear_index
  %constant_503_1 = getelementptr inbounds i32, ptr %71, i32 0
  %constant_503_129 = load i32, ptr %constant_503_1, align 4
  %72 = lshr i32 %66, %constant_503_129
  %shft.chk30 = icmp ult i32 %constant_503_129, 32
  %73 = select i1 %shft.chk30, i32 %72, i32 0
  %74 = or i32 %70, %73
  %75 = xor i32 %67, %74
  %76 = add i32 %67, %75
  %77 = getelementptr i32, ptr @492, i32 %linear_index
  %constant_505_1 = getelementptr inbounds i32, ptr %77, i32 0
  %constant_505_131 = load i32, ptr %constant_505_1, align 4
  %78 = shl i32 %75, %constant_505_131
  %shft.chk32 = icmp ult i32 %constant_505_131, 32
  %79 = select i1 %shft.chk32, i32 %78, i32 0
  %80 = getelementptr i32, ptr @492, i32 %linear_index
  %constant_505_133 = getelementptr inbounds i32, ptr %80, i32 0
  %constant_505_134 = load i32, ptr %constant_505_133, align 4
  %81 = lshr i32 %75, %constant_505_134
  %shft.chk35 = icmp ult i32 %constant_505_134, 32
  %82 = select i1 %shft.chk35, i32 %81, i32 0
  %83 = or i32 %79, %82
  %84 = xor i32 %76, %83
  %85 = add i32 %76, %84
  %86 = add i32 %85, %54
  %87 = getelementptr i32, ptr @499, i32 %linear_index
  %constant_507_1 = getelementptr inbounds i32, ptr %87, i32 0
  %constant_507_136 = load i32, ptr %constant_507_1, align 4
  %88 = shl i32 %84, %constant_507_136
  %shft.chk37 = icmp ult i32 %constant_507_136, 32
  %89 = select i1 %shft.chk37, i32 %88, i32 0
  %90 = getelementptr i32, ptr @491, i32 %linear_index
  %constant_509_1 = getelementptr inbounds i32, ptr %90, i32 0
  %constant_509_138 = load i32, ptr %constant_509_1, align 4
  %91 = lshr i32 %84, %constant_509_138
  %shft.chk39 = icmp ult i32 %constant_509_138, 32
  %92 = select i1 %shft.chk39, i32 %91, i32 0
  %93 = or i32 %89, %92
  %94 = xor i32 %85, %93
  %95 = add i32 %94, %51
  %96 = getelementptr i32, ptr @495, i32 %linear_index
  %constant_511_1 = getelementptr inbounds i32, ptr %96, i32 0
  %constant_511_140 = load i32, ptr %constant_511_1, align 4
  %97 = add i32 %95, %constant_511_140
  %98 = add i32 %86, %97
  %99 = getelementptr i32, ptr @497, i32 %linear_index
  %constant_485_141 = getelementptr inbounds i32, ptr %99, i32 0
  %constant_485_142 = load i32, ptr %constant_485_141, align 4
  %100 = shl i32 %97, %constant_485_142
  %shft.chk43 = icmp ult i32 %constant_485_142, 32
  %101 = select i1 %shft.chk43, i32 %100, i32 0
  %102 = getelementptr i32, ptr @488, i32 %linear_index
  %constant_487_144 = getelementptr inbounds i32, ptr %102, i32 0
  %constant_487_145 = load i32, ptr %constant_487_144, align 4
  %103 = lshr i32 %97, %constant_487_145
  %shft.chk46 = icmp ult i32 %constant_487_145, 32
  %104 = select i1 %shft.chk46, i32 %103, i32 0
  %105 = or i32 %101, %104
  %106 = xor i32 %98, %105
  %107 = add i32 %98, %106
  %108 = getelementptr i32, ptr @494, i32 %linear_index
  %constant_489_147 = getelementptr inbounds i32, ptr %108, i32 0
  %constant_489_148 = load i32, ptr %constant_489_147, align 4
  %109 = shl i32 %106, %constant_489_148
  %shft.chk49 = icmp ult i32 %constant_489_148, 32
  %110 = select i1 %shft.chk49, i32 %109, i32 0
  %111 = getelementptr i32, ptr @487, i32 %linear_index
  %constant_491_150 = getelementptr inbounds i32, ptr %111, i32 0
  %constant_491_151 = load i32, ptr %constant_491_150, align 4
  %112 = lshr i32 %106, %constant_491_151
  %shft.chk52 = icmp ult i32 %constant_491_151, 32
  %113 = select i1 %shft.chk52, i32 %112, i32 0
  %114 = or i32 %110, %113
  %115 = xor i32 %107, %114
  %116 = add i32 %107, %115
  %117 = getelementptr i32, ptr @485, i32 %linear_index
  %constant_493_153 = getelementptr inbounds i32, ptr %117, i32 0
  %constant_493_154 = load i32, ptr %constant_493_153, align 4
  %118 = shl i32 %115, %constant_493_154
  %shft.chk55 = icmp ult i32 %constant_493_154, 32
  %119 = select i1 %shft.chk55, i32 %118, i32 0
  %120 = getelementptr i32, ptr @486, i32 %linear_index
  %constant_495_156 = getelementptr inbounds i32, ptr %120, i32 0
  %constant_495_157 = load i32, ptr %constant_495_156, align 4
  %121 = lshr i32 %115, %constant_495_157
  %shft.chk58 = icmp ult i32 %constant_495_157, 32
  %122 = select i1 %shft.chk58, i32 %121, i32 0
  %123 = or i32 %119, %122
  %124 = xor i32 %116, %123
  %125 = add i32 %116, %124
  %126 = add i32 %125, %51
  %127 = getelementptr i32, ptr @486, i32 %linear_index
  %constant_495_159 = getelementptr inbounds i32, ptr %127, i32 0
  %constant_495_160 = load i32, ptr %constant_495_159, align 4
  %128 = shl i32 %124, %constant_495_160
  %shft.chk61 = icmp ult i32 %constant_495_160, 32
  %129 = select i1 %shft.chk61, i32 %128, i32 0
  %130 = getelementptr i32, ptr @485, i32 %linear_index
  %constant_493_162 = getelementptr inbounds i32, ptr %130, i32 0
  %constant_493_163 = load i32, ptr %constant_493_162, align 4
  %131 = lshr i32 %124, %constant_493_163
  %shft.chk64 = icmp ult i32 %constant_493_163, 32
  %132 = select i1 %shft.chk64, i32 %131, i32 0
  %133 = or i32 %129, %132
  %134 = xor i32 %125, %133
  %135 = add i32 %134, %40
  %136 = getelementptr i32, ptr @493, i32 %linear_index
  %constant_503_165 = getelementptr inbounds i32, ptr %136, i32 0
  %constant_503_166 = load i32, ptr %constant_503_165, align 4
  %137 = add i32 %135, %constant_503_166
  %138 = add i32 %126, %137
  %139 = getelementptr i32, ptr @487, i32 %linear_index
  %constant_491_167 = getelementptr inbounds i32, ptr %139, i32 0
  %constant_491_168 = load i32, ptr %constant_491_167, align 4
  %140 = shl i32 %137, %constant_491_168
  %shft.chk69 = icmp ult i32 %constant_491_168, 32
  %141 = select i1 %shft.chk69, i32 %140, i32 0
  %142 = getelementptr i32, ptr @494, i32 %linear_index
  %constant_489_170 = getelementptr inbounds i32, ptr %142, i32 0
  %constant_489_171 = load i32, ptr %constant_489_170, align 4
  %143 = lshr i32 %137, %constant_489_171
  %shft.chk72 = icmp ult i32 %constant_489_171, 32
  %144 = select i1 %shft.chk72, i32 %143, i32 0
  %145 = or i32 %141, %144
  %146 = xor i32 %138, %145
  %147 = add i32 %138, %146
  %148 = getelementptr i32, ptr @498, i32 %linear_index
  %constant_501_173 = getelementptr inbounds i32, ptr %148, i32 0
  %constant_501_174 = load i32, ptr %constant_501_173, align 4
  %149 = shl i32 %146, %constant_501_174
  %shft.chk75 = icmp ult i32 %constant_501_174, 32
  %150 = select i1 %shft.chk75, i32 %149, i32 0
  %151 = getelementptr i32, ptr @493, i32 %linear_index
  %constant_503_176 = getelementptr inbounds i32, ptr %151, i32 0
  %constant_503_177 = load i32, ptr %constant_503_176, align 4
  %152 = lshr i32 %146, %constant_503_177
  %shft.chk78 = icmp ult i32 %constant_503_177, 32
  %153 = select i1 %shft.chk78, i32 %152, i32 0
  %154 = or i32 %150, %153
  %155 = xor i32 %147, %154
  %156 = add i32 %147, %155
  %157 = getelementptr i32, ptr @492, i32 %linear_index
  %constant_505_179 = getelementptr inbounds i32, ptr %157, i32 0
  %constant_505_180 = load i32, ptr %constant_505_179, align 4
  %158 = shl i32 %155, %constant_505_180
  %shft.chk81 = icmp ult i32 %constant_505_180, 32
  %159 = select i1 %shft.chk81, i32 %158, i32 0
  %160 = getelementptr i32, ptr @492, i32 %linear_index
  %constant_505_182 = getelementptr inbounds i32, ptr %160, i32 0
  %constant_505_183 = load i32, ptr %constant_505_182, align 4
  %161 = lshr i32 %155, %constant_505_183
  %shft.chk84 = icmp ult i32 %constant_505_183, 32
  %162 = select i1 %shft.chk84, i32 %161, i32 0
  %163 = or i32 %159, %162
  %164 = xor i32 %156, %163
  %165 = add i32 %156, %164
  %166 = add i32 %165, %40
  %167 = getelementptr i32, ptr @499, i32 %linear_index
  %constant_507_185 = getelementptr inbounds i32, ptr %167, i32 0
  %constant_507_186 = load i32, ptr %constant_507_185, align 4
  %168 = shl i32 %164, %constant_507_186
  %shft.chk87 = icmp ult i32 %constant_507_186, 32
  %169 = select i1 %shft.chk87, i32 %168, i32 0
  %170 = getelementptr i32, ptr @491, i32 %linear_index
  %constant_509_188 = getelementptr inbounds i32, ptr %170, i32 0
  %constant_509_189 = load i32, ptr %constant_509_188, align 4
  %171 = lshr i32 %164, %constant_509_189
  %shft.chk90 = icmp ult i32 %constant_509_189, 32
  %172 = select i1 %shft.chk90, i32 %171, i32 0
  %173 = or i32 %169, %172
  %174 = xor i32 %165, %173
  %175 = add i32 %174, %54
  %176 = getelementptr i32, ptr @489, i32 %linear_index
  %constant_513_1 = getelementptr inbounds i32, ptr %176, i32 0
  %constant_513_191 = load i32, ptr %constant_513_1, align 4
  %177 = add i32 %175, %constant_513_191
  %178 = add i32 %166, %177
  %179 = getelementptr i32, ptr @497, i32 %linear_index
  %constant_485_192 = getelementptr inbounds i32, ptr %179, i32 0
  %constant_485_193 = load i32, ptr %constant_485_192, align 4
  %180 = shl i32 %177, %constant_485_193
  %shft.chk94 = icmp ult i32 %constant_485_193, 32
  %181 = select i1 %shft.chk94, i32 %180, i32 0
  %182 = getelementptr i32, ptr @488, i32 %linear_index
  %constant_487_195 = getelementptr inbounds i32, ptr %182, i32 0
  %constant_487_196 = load i32, ptr %constant_487_195, align 4
  %183 = lshr i32 %177, %constant_487_196
  %shft.chk97 = icmp ult i32 %constant_487_196, 32
  %184 = select i1 %shft.chk97, i32 %183, i32 0
  %185 = or i32 %181, %184
  %186 = xor i32 %178, %185
  %187 = add i32 %178, %186
  %188 = getelementptr i32, ptr @494, i32 %linear_index
  %constant_489_198 = getelementptr inbounds i32, ptr %188, i32 0
  %constant_489_199 = load i32, ptr %constant_489_198, align 4
  %189 = shl i32 %186, %constant_489_199
  %shft.chk100 = icmp ult i32 %constant_489_199, 32
  %190 = select i1 %shft.chk100, i32 %189, i32 0
  %191 = getelementptr i32, ptr @487, i32 %linear_index
  %constant_491_1101 = getelementptr inbounds i32, ptr %191, i32 0
  %constant_491_1102 = load i32, ptr %constant_491_1101, align 4
  %192 = lshr i32 %186, %constant_491_1102
  %shft.chk103 = icmp ult i32 %constant_491_1102, 32
  %193 = select i1 %shft.chk103, i32 %192, i32 0
  %194 = or i32 %190, %193
  %195 = xor i32 %187, %194
  %196 = add i32 %187, %195
  %197 = getelementptr i32, ptr @485, i32 %linear_index
  %constant_493_1104 = getelementptr inbounds i32, ptr %197, i32 0
  %constant_493_1105 = load i32, ptr %constant_493_1104, align 4
  %198 = shl i32 %195, %constant_493_1105
  %shft.chk106 = icmp ult i32 %constant_493_1105, 32
  %199 = select i1 %shft.chk106, i32 %198, i32 0
  %200 = getelementptr i32, ptr @486, i32 %linear_index
  %constant_495_1107 = getelementptr inbounds i32, ptr %200, i32 0
  %constant_495_1108 = load i32, ptr %constant_495_1107, align 4
  %201 = lshr i32 %195, %constant_495_1108
  %shft.chk109 = icmp ult i32 %constant_495_1108, 32
  %202 = select i1 %shft.chk109, i32 %201, i32 0
  %203 = or i32 %199, %202
  %204 = xor i32 %196, %203
  %205 = add i32 %196, %204
  %206 = add i32 %205, %54
  %207 = zext i32 %206 to i64
  %208 = getelementptr i64, ptr @500, i32 %linear_index
  %constant_515_1 = getelementptr inbounds i64, ptr %208, i32 0
  %constant_515_1110 = load i64, ptr %constant_515_1, align 8
  %209 = shl i64 %207, %constant_515_1110
  %shft.chk111 = icmp ult i64 %constant_515_1110, 64
  %210 = select i1 %shft.chk111, i64 %209, i64 0
  %211 = getelementptr i32, ptr @486, i32 %linear_index
  %constant_495_1112 = getelementptr inbounds i32, ptr %211, i32 0
  %constant_495_1113 = load i32, ptr %constant_495_1112, align 4
  %212 = shl i32 %204, %constant_495_1113
  %shft.chk114 = icmp ult i32 %constant_495_1113, 32
  %213 = select i1 %shft.chk114, i32 %212, i32 0
  %214 = getelementptr i32, ptr @485, i32 %linear_index
  %constant_493_1115 = getelementptr inbounds i32, ptr %214, i32 0
  %constant_493_1116 = load i32, ptr %constant_493_1115, align 4
  %215 = lshr i32 %204, %constant_493_1116
  %shft.chk117 = icmp ult i32 %constant_493_1116, 32
  %216 = select i1 %shft.chk117, i32 %215, i32 0
  %217 = or i32 %213, %216
  %218 = xor i32 %205, %217
  %219 = add i32 %218, %51
  %220 = getelementptr i32, ptr @484, i32 %linear_index
  %constant_517_1 = getelementptr inbounds i32, ptr %220, i32 0
  %constant_517_1118 = load i32, ptr %constant_517_1, align 4
  %221 = add i32 %219, %constant_517_1118
  %222 = zext i32 %221 to i64
  %223 = or i64 %210, %222
  %224 = getelementptr i64, ptr @483, i32 %linear_index
  %constant_1109_1 = getelementptr inbounds i64, ptr %224, i32 0
  %constant_1109_1119 = load i64, ptr %constant_1109_1, align 8
  %225 = lshr i64 %223, %constant_1109_1119
  %shft.chk120 = icmp ult i64 %constant_1109_1119, 64
  %226 = select i1 %shft.chk120, i64 %225, i64 0
  %227 = getelementptr i64, ptr @482, i32 %linear_index
  %constant_1215_1 = getelementptr inbounds i64, ptr %227, i32 0
  %constant_1215_1121 = load i64, ptr %constant_1215_1, align 8
  %228 = or i64 %226, %constant_1215_1121
  %229 = bitcast i64 %228 to double
  %230 = getelementptr double, ptr @481, i32 %linear_index
  %constant_1304_1 = getelementptr inbounds double, ptr %230, i32 0
  %constant_1304_1122 = load double, ptr %constant_1304_1, align 8
  %add.3709.1 = fadd double %229, %constant_1304_1122
  %231 = fcmp une double %constant_1333_11, %constant_1333_11
  %232 = fcmp oeq double %add.3709.1, %add.3709.1
  %233 = fcmp oge double %constant_1333_11, %add.3709.1
  %234 = and i1 %232, %233
  %235 = or i1 %231, %234
  %maximum.38.1 = select i1 %235, double %constant_1333_11, double %add.3709.1
  %constant_6653_1 = load double, ptr @480, align 8
  %236 = load double, ptr %arg0, align 8, !invariant.load !297
  %237 = load double, ptr %arg1, align 8, !invariant.load !297
  %subtract.222.1 = fsub double %236, %237
  %238 = fneg double %subtract.222.1
  %239 = call double @__nv_exp(double %238)
  %constant_6653_1123 = load double, ptr @480, align 8
  %add.3710.3 = fadd double %239, %constant_6653_1123
  %divide.571.3 = fdiv double %constant_6653_1, %add.3710.3
  %compare.611.3 = fcmp olt double %maximum.38.1, %divide.571.3
  %240 = zext i1 %compare.611.3 to i8
  %241 = zext i8 %240 to i32
  store i32 %241, ptr %arg3, align 4
  br label %loop_convert_fusion.1.in_bounds-after
}

define void @wrapped_add(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %wrapped_add.in_bounds-true, label %wrapped_add.in_bounds-after

wrapped_add.in_bounds-after:                      ; preds = %wrapped_add.in_bounds-true, %entry
  ret void

wrapped_add.in_bounds-true:                       ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !297
  %add.3666.1 = fadd double %7, %10
  %11 = getelementptr double, ptr %arg0, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  store double %add.3666.1, ptr %12, align 8
  br label %wrapped_add.in_bounds-after
}

define void @input_reduce_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(1) %arg2) {
entry:
  %return_buffer8 = alloca i8, align 1
  %result_from_other_lane = alloca i8, align 1
  %return_buffer = alloca i8, align 1
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca i8, align 1
  %reduction_input_address = alloca i8, align 1
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !292
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_1022_1 = load i8, ptr @502, align 1
  store i8 %constant_1022_1, ptr %partial_reduction_result, align 1
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !315
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
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

x_in_tile-after:                                  ; preds = %concatenate.37.3.merge, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !330

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !331

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result7 = load i8, ptr %partial_reduction_result, align 1
  %12 = zext i8 %partial_reduction_result7 to i32
  %13 = bitcast i32 %12 to <1 x i32>
  %14 = extractelement <1 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 1, i32 31)
  %16 = insertelement <1 x i32> %13, i32 %15, i64 0
  %17 = bitcast <1 x i32> %16 to i32
  %18 = trunc i32 %17 to i8
  store i8 %18, ptr %result_from_other_lane, align 1
  call void @and_reduce_sub_computation_557ffb2e5a50_aea6391cb20f9f3e(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer8)
  %19 = load i8, ptr %return_buffer8, align 1
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
  %constant_6772_1 = load i32, ptr @505, align 4
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %25 = phi i32 [ 0, %concatenate.pivot.0. ]
  %26 = sub nsw i32 %24, %25
  %param_1.299 = load i32, ptr %arg1, align 4, !invariant.load !297
  %constant_6772_12 = load i32, ptr @505, align 4
  %27 = icmp slt i32 %param_1.299, %constant_6772_12
  %28 = zext i1 %27 to i8
  %param_1.2993 = load i32, ptr %arg1, align 4, !invariant.load !297
  %constant_6771_2 = load i32, ptr @504, align 4
  %29 = add i32 %param_1.2993, %constant_6771_2
  %param_1.2994 = load i32, ptr %arg1, align 4, !invariant.load !297
  %30 = trunc i8 %28 to i1
  %31 = select i1 %30, i32 %29, i32 %param_1.2994
  br label %concatenate.37.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.5
  %32 = phi i32 [ 1, %concatenate.pivot.1.5 ]
  %33 = sub nsw i32 %24, %32
  %constant_1020_1 = load i32, ptr @503, align 4
  br label %concatenate.37.3.merge

concatenate.pivot.1.:                             ; preds = %x_in_tile-true
  %34 = icmp ult i32 %24, 1
  br i1 %34, label %concatenate.pivot.0., label %concatenate.pivot.1.5

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.5:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.37.3.merge:                           ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %35 = phi i32 [ %31, %concat_index_from_operand_id0 ], [ %constant_1020_1, %concat_index_from_operand_id1 ]
  %36 = icmp sle i32 %constant_6772_1, %35
  %37 = zext i1 %36 to i8
  %param_0.230 = getelementptr inbounds [2 x i32], ptr %arg0, i32 0, i32 %24
  %param_0.2306 = load i32, ptr %param_0.230, align 4, !invariant.load !297
  %38 = icmp sge i32 %param_0.2306, %35
  %39 = zext i1 %38 to i8
  %40 = and i8 %37, %39
  store i8 %40, ptr %reduction_input_address, align 1
  call void @and_reduce_sub_computation_557ffb2e5a50_aea6391cb20f9f3e(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %41 = load i8, ptr %return_buffer, align 1
  store i8 %41, ptr %partial_reduction_result, align 1
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %42 = and i32 %thread.id.2, 1
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %44 = add i32 %tile_origin.1, %thread.id.1
  %output = load i8, ptr %partial_reduction_result, align 1
  store i8 %output, ptr %arg2, align 1
  br label %reduction_write_output-after
}

define void @loop_dynamic_update_slice_fusion_1(ptr noalias align 128 dereferenceable(1920) %arg0, ptr noalias align 128 dereferenceable(192) %arg1, ptr noalias align 128 dereferenceable(1) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %param_3.148 = load i32, ptr %arg3, align 4, !invariant.load !297
  %constant_6772_2 = load i32, ptr @506, align 4
  %0 = icmp slt i32 %param_3.148, %constant_6772_2
  %1 = zext i1 %0 to i8
  %param_3.1481 = load i32, ptr %arg3, align 4, !invariant.load !297
  %constant_6771_1 = load i32, ptr @507, align 4
  %2 = add i32 %param_3.1481, %constant_6771_1
  %param_3.1482 = load i32, ptr %arg3, align 4, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i32 %2, i32 %param_3.1482
  %5 = icmp sge i32 0, %4
  %6 = select i1 %5, i32 0, i32 %4
  %7 = icmp sle i32 9, %6
  %8 = select i1 %7, i32 9, i32 %6
  %constant_6772_23 = load i32, ptr @506, align 4
  %9 = icmp sge i32 0, %constant_6772_23
  %10 = select i1 %9, i32 0, i32 %constant_6772_23
  %11 = icmp sle i32 0, %10
  %12 = select i1 %11, i32 0, i32 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 24
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 24
  %18 = udiv i64 %linear_index0, 24
  %19 = icmp ult i64 %linear_index, 24
  br i1 %19, label %dynamic-update-slice.1372.1.in_bounds-true, label %dynamic-update-slice.1372.1.in_bounds-after

dynamic-update-slice.1372.1.in_bounds-after:      ; preds = %dynamic-update-slice.1372.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1372.1.in_bounds-true:       ; preds = %entry
  %20 = sext i32 %8 to i64
  %21 = add i64 %20, %18
  %22 = sext i32 %12 to i64
  %23 = add i64 %22, %17
  %param_2.225 = load i8, ptr %arg2, align 1, !invariant.load !297
  %24 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.297 = getelementptr inbounds double, ptr %24, i64 0
  %param_1.2974 = load double, ptr %param_1.297, align 8, !invariant.load !297
  %param_3.1485 = load i32, ptr %arg3, align 4, !invariant.load !297
  %constant_6772_26 = load i32, ptr @506, align 4
  %25 = icmp slt i32 %param_3.1485, %constant_6772_26
  %26 = zext i1 %25 to i8
  %param_3.1487 = load i32, ptr %arg3, align 4, !invariant.load !297
  %constant_6771_18 = load i32, ptr @507, align 4
  %27 = add i32 %param_3.1487, %constant_6771_18
  %param_3.1489 = load i32, ptr %arg3, align 4, !invariant.load !297
  %28 = trunc i8 %26 to i1
  %29 = select i1 %28, i32 %27, i32 %param_3.1489
  %30 = sext i32 %29 to i64
  %31 = icmp sge i64 0, %30
  %32 = select i1 %31, i64 0, i64 %30
  %33 = icmp sle i64 9, %32
  %dynamic-slice.1197.1.start_idx0 = select i1 %33, i64 9, i64 %32
  %constant_6772_210 = load i32, ptr @506, align 4
  %34 = sext i32 %constant_6772_210 to i64
  %35 = icmp sge i64 0, %34
  %36 = select i1 %35, i64 0, i64 %34
  %37 = icmp sle i64 0, %36
  %dynamic-slice.1197.1.start_idx1 = select i1 %37, i64 0, i64 %36
  %38 = add i64 %dynamic-slice.1197.1.start_idx0, %18
  %39 = add i64 %dynamic-slice.1197.1.start_idx1, %17
  %param_0.225 = getelementptr inbounds [10 x [24 x double]], ptr %arg0, i64 0, i64 %38, i64 %39
  %param_0.22511 = load double, ptr %param_0.225, align 8
  %40 = trunc i8 %param_2.225 to i1
  %41 = select i1 %40, double %param_1.2974, double %param_0.22511
  %42 = getelementptr inbounds [10 x [24 x double]], ptr %arg0, i64 0, i64 %21, i64 %23
  store double %41, ptr %42, align 8
  br label %dynamic-update-slice.1372.1.in_bounds-after
}

define void @loop_and_fusion(ptr noalias align 128 dereferenceable(1) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(1) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
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
  %4 = load i32, ptr %arg1, align 4, !invariant.load !297
  %5 = load i32, ptr %arg2, align 4, !invariant.load !297
  %6 = icmp sge i32 %4, %5
  %7 = zext i1 %6 to i8
  %8 = load i8, ptr %arg0, align 1, !invariant.load !297
  %9 = trunc i8 %8 to i1
  %10 = xor i1 %9, true
  %11 = zext i1 %10 to i8
  %12 = and i8 %7, %11
  store i8 %12, ptr %arg3, align 1
  br label %loop_and_fusion.in_bounds-after
}

define void @loop_multiply_fusion(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(1920) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(192) %arg3, ptr noalias align 128 dereferenceable(192) %arg4, ptr noalias align 128 dereferenceable(1920) %arg5, ptr noalias align 128 dereferenceable(192) %arg6, ptr noalias align 128 dereferenceable(192) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %2 = mul nuw nsw i32 %0, 24
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 24
  br i1 %4, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = load i32, ptr %arg2, align 4, !invariant.load !297
  %constant_6799_2 = load i32, ptr @509, align 4
  %9 = icmp slt i32 %8, %constant_6799_2
  %10 = zext i1 %9 to i8
  %11 = load i32, ptr %arg2, align 4, !invariant.load !297
  %constant_6798_1 = load i32, ptr @510, align 4
  %12 = add i32 %11, %constant_6798_1
  %13 = load i32, ptr %arg2, align 4, !invariant.load !297
  %14 = trunc i8 %10 to i1
  %15 = select i1 %14, i32 %12, i32 %13
  %16 = icmp sge i32 0, %15
  %17 = select i1 %16, i32 0, i32 %15
  %18 = icmp sle i32 9, %17
  %dynamic-slice.1198.9.start_idx0 = select i1 %18, i32 9, i32 %17
  %constant_6799_21 = load i32, ptr @509, align 4
  %19 = icmp sge i32 0, %constant_6799_21
  %20 = select i1 %19, i32 0, i32 %constant_6799_21
  %21 = icmp sle i32 0, %20
  %dynamic-slice.1198.9.start_idx1 = select i1 %21, i32 0, i32 %20
  %22 = add i32 %dynamic-slice.1198.9.start_idx0, 0
  %23 = add i32 %dynamic-slice.1198.9.start_idx1, %3
  %24 = getelementptr inbounds [10 x [24 x double]], ptr %arg1, i32 0, i32 %22, i32 %23
  %25 = load double, ptr %24, align 8, !invariant.load !297
  %multiply.2786.3 = fmul double %7, %25
  %26 = getelementptr double, ptr %arg4, i32 %linear_index
  %27 = getelementptr inbounds double, ptr %26, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !297
  %29 = icmp sge i32 0, %15
  %30 = select i1 %29, i32 0, i32 %15
  %31 = icmp sle i32 9, %30
  %dynamic-slice.1199.7.start_idx0 = select i1 %31, i32 9, i32 %30
  %constant_6799_22 = load i32, ptr @509, align 4
  %32 = icmp sge i32 0, %constant_6799_22
  %33 = select i1 %32, i32 0, i32 %constant_6799_22
  %34 = icmp sle i32 0, %33
  %dynamic-slice.1199.7.start_idx1 = select i1 %34, i32 0, i32 %33
  %35 = add i32 %dynamic-slice.1199.7.start_idx0, 0
  %36 = add i32 %dynamic-slice.1199.7.start_idx1, %3
  %37 = getelementptr inbounds [10 x [24 x double]], ptr %arg5, i32 0, i32 %35, i32 %36
  %38 = load double, ptr %37, align 8, !invariant.load !297
  %subtract.225.7 = fsub double %28, %38
  %add.3718.7 = fadd double %subtract.225.7, %25
  %39 = getelementptr double, ptr %arg3, i32 %linear_index
  %40 = getelementptr inbounds double, ptr %39, i32 0
  %41 = load double, ptr %40, align 8, !invariant.load !297
  %add.3719.7 = fadd double %41, %25
  %constant_973_1 = load double, ptr @508, align 8
  %multiply.2787.7 = fmul double %add.3719.7, %constant_973_1
  %subtract.226.5 = fsub double %add.3718.7, %multiply.2787.7
  %multiply.2788.1 = fmul double %multiply.2786.3, %subtract.226.5
  %42 = insertvalue { double, double } undef, double %multiply.2788.1, 0
  %43 = getelementptr double, ptr %arg0, i32 %linear_index
  %44 = getelementptr inbounds double, ptr %43, i32 0
  %45 = load double, ptr %44, align 8, !invariant.load !297
  %46 = getelementptr double, ptr %arg3, i32 %linear_index
  %47 = getelementptr inbounds double, ptr %46, i32 0
  %48 = load double, ptr %47, align 8, !invariant.load !297
  %multiply.2789.1.clone.1 = fmul double %45, %48
  %multiply.2790.1.clone.1 = fmul double %multiply.2789.1.clone.1, %subtract.226.5
  %49 = insertvalue { double, double } %42, double %multiply.2790.1.clone.1, 1
  %50 = extractvalue { double, double } %49, 0
  %51 = getelementptr double, ptr %arg6, i32 %linear_index
  %52 = getelementptr inbounds double, ptr %51, i32 0
  store double %50, ptr %52, align 8
  %53 = extractvalue { double, double } %49, 1
  %54 = getelementptr double, ptr %arg7, i32 %linear_index
  %55 = getelementptr inbounds double, ptr %54, i32 0
  store double %53, ptr %55, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

define void @loop_add_fusion_7(ptr noalias align 128 dereferenceable(4) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.7.in_bounds-true, label %loop_add_fusion.7.in_bounds-after

loop_add_fusion.7.in_bounds-after:                ; preds = %loop_add_fusion.7.in_bounds-true, %entry
  ret void

loop_add_fusion.7.in_bounds-true:                 ; preds = %entry
  %4 = load i32, ptr %arg0, align 4
  %constant_1111_1 = load i32, ptr @511, align 4
  %5 = add i32 %4, %constant_1111_1
  store i32 %5, ptr %arg0, align 4
  br label %loop_add_fusion.7.in_bounds-after
}

define void @loop_compare_fusion(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.16.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_compare_fusion.in_bounds-true, label %loop_compare_fusion.in_bounds-after

loop_compare_fusion.in_bounds-after:              ; preds = %reduce.16.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_compare_fusion.in_bounds-true:               ; preds = %entry
  %constant_6794_1 = load double, ptr @512, align 8
  store double %constant_6794_1, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.16.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.16.1.inner.loop_header.reduction_dim.0

reduce.16.1.inner.loop_header.reduction_dim.0:    ; preds = %reduce.16.1.inner.loop_body.reduction_dim.0, %loop_compare_fusion.in_bounds-true
  %reduce.16.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.16.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.16.1.inner.indvar.reduction_dim.0, 24
  br i1 %4, label %reduce.16.1.inner.loop_exit.reduction_dim.0, label %reduce.16.1.inner.loop_body.reduction_dim.0

reduce.16.1.inner.loop_body.reduction_dim.0:      ; preds = %reduce.16.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [24 x double], ptr %arg0, i32 0, i32 %reduce.16.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  store double %5, ptr %parameter_buffer, align 8
  store double %7, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %8 = load double, ptr %return_buffer, align 8
  store double %8, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.16.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.16.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.16.1.inner.loop_header.reduction_dim.0

reduce.16.1.inner.loop_exit.reduction_dim.0:      ; preds = %reduce.16.1.inner.loop_header.reduction_dim.0
  %9 = load double, ptr %accumulator_0, align 8
  %constant_6794_12 = load double, ptr @512, align 8
  %compare.619.1 = fcmp ole double %9, %constant_6794_12
  %10 = zext i1 %compare.619.1 to i8
  store i8 %10, ptr %arg1, align 1
  br label %loop_compare_fusion.in_bounds-after
}

define void @loop_or_fusion(ptr noalias align 128 dereferenceable(1) %arg0, ptr noalias align 128 dereferenceable(192) %arg1, ptr noalias align 128 dereferenceable(1) %arg2) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.15.3.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_or_fusion.in_bounds-true, label %loop_or_fusion.in_bounds-after

loop_or_fusion.in_bounds-after:                   ; preds = %reduce.15.3.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_or_fusion.in_bounds-true:                    ; preds = %entry
  %constant_6794_2 = load double, ptr @513, align 8
  store double %constant_6794_2, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.15.3.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.15.3.inner.loop_header.reduction_dim.0

reduce.15.3.inner.loop_header.reduction_dim.0:    ; preds = %reduce.15.3.inner.loop_body.reduction_dim.0, %loop_or_fusion.in_bounds-true
  %reduce.15.3.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.15.3.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.15.3.inner.indvar.reduction_dim.0, 24
  br i1 %4, label %reduce.15.3.inner.loop_exit.reduction_dim.0, label %reduce.15.3.inner.loop_body.reduction_dim.0

reduce.15.3.inner.loop_body.reduction_dim.0:      ; preds = %reduce.15.3.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [24 x double], ptr %arg1, i32 0, i32 %reduce.15.3.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  store double %5, ptr %parameter_buffer, align 8
  store double %7, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %8 = load double, ptr %return_buffer, align 8
  store double %8, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.15.3.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.15.3.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.15.3.inner.loop_header.reduction_dim.0

reduce.15.3.inner.loop_exit.reduction_dim.0:      ; preds = %reduce.15.3.inner.loop_header.reduction_dim.0
  %9 = load double, ptr %accumulator_0, align 8
  %constant_6794_22 = load double, ptr @513, align 8
  %compare.618.3 = fcmp ole double %9, %constant_6794_22
  %10 = zext i1 %compare.618.3 to i8
  %11 = load i8, ptr %arg0, align 1, !invariant.load !297
  %12 = or i8 %10, %11
  store i8 %12, ptr %arg2, align 1
  br label %loop_or_fusion.in_bounds-after
}

define void @loop_convert_fusion_5(ptr noalias align 128 dereferenceable(1) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_convert_fusion.5.in_bounds-true, label %loop_convert_fusion.5.in_bounds-after

loop_convert_fusion.5.in_bounds-after:            ; preds = %loop_convert_fusion.5.in_bounds-true, %entry
  ret void

loop_convert_fusion.5.in_bounds-true:             ; preds = %entry
  %4 = load i8, ptr %arg0, align 1, !invariant.load !297
  %5 = load i8, ptr %arg1, align 1, !invariant.load !297
  %6 = or i8 %4, %5
  %7 = zext i8 %6 to i32
  store i32 %7, ptr %arg2, align 4
  br label %loop_convert_fusion.5.in_bounds-after
}

define void @loop_convert_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_convert_fusion.in_bounds-true, label %loop_convert_fusion.in_bounds-after

loop_convert_fusion.in_bounds-after:              ; preds = %loop_convert_fusion.in_bounds-true, %entry
  ret void

loop_convert_fusion.in_bounds-true:               ; preds = %entry
  %4 = getelementptr double, ptr @535, i32 %linear_index
  %constant_1334_1 = getelementptr inbounds double, ptr %4, i32 0
  %constant_1334_11 = load double, ptr %constant_1334_1, align 8
  %5 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 0
  %6 = load i32, ptr %5, align 4, !invariant.load !297
  %7 = add i32 0, %6
  %8 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 1
  %9 = load i32, ptr %8, align 4, !invariant.load !297
  %10 = add i32 1, %9
  %11 = add i32 %7, %10
  %12 = getelementptr i32, ptr @531, i32 %linear_index
  %constant_611_1 = getelementptr inbounds i32, ptr %12, i32 0
  %constant_611_12 = load i32, ptr %constant_611_1, align 4
  %13 = shl i32 %10, %constant_611_12
  %shft.chk = icmp ult i32 %constant_611_12, 32
  %14 = select i1 %shft.chk, i32 %13, i32 0
  %15 = getelementptr i32, ptr @522, i32 %linear_index
  %constant_612_1 = getelementptr inbounds i32, ptr %15, i32 0
  %constant_612_13 = load i32, ptr %constant_612_1, align 4
  %16 = lshr i32 %10, %constant_612_13
  %shft.chk4 = icmp ult i32 %constant_612_13, 32
  %17 = select i1 %shft.chk4, i32 %16, i32 0
  %18 = or i32 %14, %17
  %19 = xor i32 %11, %18
  %20 = add i32 %11, %19
  %21 = getelementptr i32, ptr @528, i32 %linear_index
  %constant_613_1 = getelementptr inbounds i32, ptr %21, i32 0
  %constant_613_15 = load i32, ptr %constant_613_1, align 4
  %22 = shl i32 %19, %constant_613_15
  %shft.chk6 = icmp ult i32 %constant_613_15, 32
  %23 = select i1 %shft.chk6, i32 %22, i32 0
  %24 = getelementptr i32, ptr @521, i32 %linear_index
  %constant_614_1 = getelementptr inbounds i32, ptr %24, i32 0
  %constant_614_17 = load i32, ptr %constant_614_1, align 4
  %25 = lshr i32 %19, %constant_614_17
  %shft.chk8 = icmp ult i32 %constant_614_17, 32
  %26 = select i1 %shft.chk8, i32 %25, i32 0
  %27 = or i32 %23, %26
  %28 = xor i32 %20, %27
  %29 = add i32 %20, %28
  %30 = getelementptr i32, ptr @519, i32 %linear_index
  %constant_615_1 = getelementptr inbounds i32, ptr %30, i32 0
  %constant_615_19 = load i32, ptr %constant_615_1, align 4
  %31 = shl i32 %28, %constant_615_19
  %shft.chk10 = icmp ult i32 %constant_615_19, 32
  %32 = select i1 %shft.chk10, i32 %31, i32 0
  %33 = getelementptr i32, ptr @520, i32 %linear_index
  %constant_616_1 = getelementptr inbounds i32, ptr %33, i32 0
  %constant_616_111 = load i32, ptr %constant_616_1, align 4
  %34 = lshr i32 %28, %constant_616_111
  %shft.chk12 = icmp ult i32 %constant_616_111, 32
  %35 = select i1 %shft.chk12, i32 %34, i32 0
  %36 = or i32 %32, %35
  %37 = xor i32 %29, %36
  %38 = add i32 %29, %37
  %39 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 1
  %40 = load i32, ptr %39, align 4, !invariant.load !297
  %41 = add i32 %38, %40
  %42 = getelementptr i32, ptr @520, i32 %linear_index
  %constant_616_113 = getelementptr inbounds i32, ptr %42, i32 0
  %constant_616_114 = load i32, ptr %constant_616_113, align 4
  %43 = shl i32 %37, %constant_616_114
  %shft.chk15 = icmp ult i32 %constant_616_114, 32
  %44 = select i1 %shft.chk15, i32 %43, i32 0
  %45 = getelementptr i32, ptr @519, i32 %linear_index
  %constant_615_116 = getelementptr inbounds i32, ptr %45, i32 0
  %constant_615_117 = load i32, ptr %constant_615_116, align 4
  %46 = lshr i32 %37, %constant_615_117
  %shft.chk18 = icmp ult i32 %constant_615_117, 32
  %47 = select i1 %shft.chk18, i32 %46, i32 0
  %48 = or i32 %44, %47
  %49 = xor i32 %38, %48
  %50 = getelementptr inbounds [2 x i32], ptr %arg2, i32 0, i32 0
  %51 = load i32, ptr %50, align 4, !invariant.load !297
  %52 = xor i32 %51, %40
  %53 = getelementptr i32, ptr @524, i32 %linear_index
  %constant_1223_1 = getelementptr inbounds i32, ptr %53, i32 0
  %constant_1223_119 = load i32, ptr %constant_1223_1, align 4
  %54 = xor i32 %52, %constant_1223_119
  %55 = add i32 %49, %54
  %56 = getelementptr i32, ptr @530, i32 %linear_index
  %constant_618_1 = getelementptr inbounds i32, ptr %56, i32 0
  %constant_618_120 = load i32, ptr %constant_618_1, align 4
  %57 = add i32 %55, %constant_618_120
  %58 = add i32 %41, %57
  %59 = getelementptr i32, ptr @521, i32 %linear_index
  %constant_614_121 = getelementptr inbounds i32, ptr %59, i32 0
  %constant_614_122 = load i32, ptr %constant_614_121, align 4
  %60 = shl i32 %57, %constant_614_122
  %shft.chk23 = icmp ult i32 %constant_614_122, 32
  %61 = select i1 %shft.chk23, i32 %60, i32 0
  %62 = getelementptr i32, ptr @528, i32 %linear_index
  %constant_613_124 = getelementptr inbounds i32, ptr %62, i32 0
  %constant_613_125 = load i32, ptr %constant_613_124, align 4
  %63 = lshr i32 %57, %constant_613_125
  %shft.chk26 = icmp ult i32 %constant_613_125, 32
  %64 = select i1 %shft.chk26, i32 %63, i32 0
  %65 = or i32 %61, %64
  %66 = xor i32 %58, %65
  %67 = add i32 %58, %66
  %68 = getelementptr i32, ptr @532, i32 %linear_index
  %constant_619_1 = getelementptr inbounds i32, ptr %68, i32 0
  %constant_619_127 = load i32, ptr %constant_619_1, align 4
  %69 = shl i32 %66, %constant_619_127
  %shft.chk28 = icmp ult i32 %constant_619_127, 32
  %70 = select i1 %shft.chk28, i32 %69, i32 0
  %71 = getelementptr i32, ptr @527, i32 %linear_index
  %constant_620_1 = getelementptr inbounds i32, ptr %71, i32 0
  %constant_620_129 = load i32, ptr %constant_620_1, align 4
  %72 = lshr i32 %66, %constant_620_129
  %shft.chk30 = icmp ult i32 %constant_620_129, 32
  %73 = select i1 %shft.chk30, i32 %72, i32 0
  %74 = or i32 %70, %73
  %75 = xor i32 %67, %74
  %76 = add i32 %67, %75
  %77 = getelementptr i32, ptr @526, i32 %linear_index
  %constant_621_1 = getelementptr inbounds i32, ptr %77, i32 0
  %constant_621_131 = load i32, ptr %constant_621_1, align 4
  %78 = shl i32 %75, %constant_621_131
  %shft.chk32 = icmp ult i32 %constant_621_131, 32
  %79 = select i1 %shft.chk32, i32 %78, i32 0
  %80 = getelementptr i32, ptr @526, i32 %linear_index
  %constant_621_133 = getelementptr inbounds i32, ptr %80, i32 0
  %constant_621_134 = load i32, ptr %constant_621_133, align 4
  %81 = lshr i32 %75, %constant_621_134
  %shft.chk35 = icmp ult i32 %constant_621_134, 32
  %82 = select i1 %shft.chk35, i32 %81, i32 0
  %83 = or i32 %79, %82
  %84 = xor i32 %76, %83
  %85 = add i32 %76, %84
  %86 = add i32 %85, %54
  %87 = getelementptr i32, ptr @533, i32 %linear_index
  %constant_622_1 = getelementptr inbounds i32, ptr %87, i32 0
  %constant_622_136 = load i32, ptr %constant_622_1, align 4
  %88 = shl i32 %84, %constant_622_136
  %shft.chk37 = icmp ult i32 %constant_622_136, 32
  %89 = select i1 %shft.chk37, i32 %88, i32 0
  %90 = getelementptr i32, ptr @525, i32 %linear_index
  %constant_623_1 = getelementptr inbounds i32, ptr %90, i32 0
  %constant_623_138 = load i32, ptr %constant_623_1, align 4
  %91 = lshr i32 %84, %constant_623_138
  %shft.chk39 = icmp ult i32 %constant_623_138, 32
  %92 = select i1 %shft.chk39, i32 %91, i32 0
  %93 = or i32 %89, %92
  %94 = xor i32 %85, %93
  %95 = add i32 %94, %51
  %96 = getelementptr i32, ptr @529, i32 %linear_index
  %constant_624_1 = getelementptr inbounds i32, ptr %96, i32 0
  %constant_624_140 = load i32, ptr %constant_624_1, align 4
  %97 = add i32 %95, %constant_624_140
  %98 = add i32 %86, %97
  %99 = getelementptr i32, ptr @531, i32 %linear_index
  %constant_611_141 = getelementptr inbounds i32, ptr %99, i32 0
  %constant_611_142 = load i32, ptr %constant_611_141, align 4
  %100 = shl i32 %97, %constant_611_142
  %shft.chk43 = icmp ult i32 %constant_611_142, 32
  %101 = select i1 %shft.chk43, i32 %100, i32 0
  %102 = getelementptr i32, ptr @522, i32 %linear_index
  %constant_612_144 = getelementptr inbounds i32, ptr %102, i32 0
  %constant_612_145 = load i32, ptr %constant_612_144, align 4
  %103 = lshr i32 %97, %constant_612_145
  %shft.chk46 = icmp ult i32 %constant_612_145, 32
  %104 = select i1 %shft.chk46, i32 %103, i32 0
  %105 = or i32 %101, %104
  %106 = xor i32 %98, %105
  %107 = add i32 %98, %106
  %108 = getelementptr i32, ptr @528, i32 %linear_index
  %constant_613_147 = getelementptr inbounds i32, ptr %108, i32 0
  %constant_613_148 = load i32, ptr %constant_613_147, align 4
  %109 = shl i32 %106, %constant_613_148
  %shft.chk49 = icmp ult i32 %constant_613_148, 32
  %110 = select i1 %shft.chk49, i32 %109, i32 0
  %111 = getelementptr i32, ptr @521, i32 %linear_index
  %constant_614_150 = getelementptr inbounds i32, ptr %111, i32 0
  %constant_614_151 = load i32, ptr %constant_614_150, align 4
  %112 = lshr i32 %106, %constant_614_151
  %shft.chk52 = icmp ult i32 %constant_614_151, 32
  %113 = select i1 %shft.chk52, i32 %112, i32 0
  %114 = or i32 %110, %113
  %115 = xor i32 %107, %114
  %116 = add i32 %107, %115
  %117 = getelementptr i32, ptr @519, i32 %linear_index
  %constant_615_153 = getelementptr inbounds i32, ptr %117, i32 0
  %constant_615_154 = load i32, ptr %constant_615_153, align 4
  %118 = shl i32 %115, %constant_615_154
  %shft.chk55 = icmp ult i32 %constant_615_154, 32
  %119 = select i1 %shft.chk55, i32 %118, i32 0
  %120 = getelementptr i32, ptr @520, i32 %linear_index
  %constant_616_156 = getelementptr inbounds i32, ptr %120, i32 0
  %constant_616_157 = load i32, ptr %constant_616_156, align 4
  %121 = lshr i32 %115, %constant_616_157
  %shft.chk58 = icmp ult i32 %constant_616_157, 32
  %122 = select i1 %shft.chk58, i32 %121, i32 0
  %123 = or i32 %119, %122
  %124 = xor i32 %116, %123
  %125 = add i32 %116, %124
  %126 = add i32 %125, %51
  %127 = getelementptr i32, ptr @520, i32 %linear_index
  %constant_616_159 = getelementptr inbounds i32, ptr %127, i32 0
  %constant_616_160 = load i32, ptr %constant_616_159, align 4
  %128 = shl i32 %124, %constant_616_160
  %shft.chk61 = icmp ult i32 %constant_616_160, 32
  %129 = select i1 %shft.chk61, i32 %128, i32 0
  %130 = getelementptr i32, ptr @519, i32 %linear_index
  %constant_615_162 = getelementptr inbounds i32, ptr %130, i32 0
  %constant_615_163 = load i32, ptr %constant_615_162, align 4
  %131 = lshr i32 %124, %constant_615_163
  %shft.chk64 = icmp ult i32 %constant_615_163, 32
  %132 = select i1 %shft.chk64, i32 %131, i32 0
  %133 = or i32 %129, %132
  %134 = xor i32 %125, %133
  %135 = add i32 %134, %40
  %136 = getelementptr i32, ptr @527, i32 %linear_index
  %constant_620_165 = getelementptr inbounds i32, ptr %136, i32 0
  %constant_620_166 = load i32, ptr %constant_620_165, align 4
  %137 = add i32 %135, %constant_620_166
  %138 = add i32 %126, %137
  %139 = getelementptr i32, ptr @521, i32 %linear_index
  %constant_614_167 = getelementptr inbounds i32, ptr %139, i32 0
  %constant_614_168 = load i32, ptr %constant_614_167, align 4
  %140 = shl i32 %137, %constant_614_168
  %shft.chk69 = icmp ult i32 %constant_614_168, 32
  %141 = select i1 %shft.chk69, i32 %140, i32 0
  %142 = getelementptr i32, ptr @528, i32 %linear_index
  %constant_613_170 = getelementptr inbounds i32, ptr %142, i32 0
  %constant_613_171 = load i32, ptr %constant_613_170, align 4
  %143 = lshr i32 %137, %constant_613_171
  %shft.chk72 = icmp ult i32 %constant_613_171, 32
  %144 = select i1 %shft.chk72, i32 %143, i32 0
  %145 = or i32 %141, %144
  %146 = xor i32 %138, %145
  %147 = add i32 %138, %146
  %148 = getelementptr i32, ptr @532, i32 %linear_index
  %constant_619_173 = getelementptr inbounds i32, ptr %148, i32 0
  %constant_619_174 = load i32, ptr %constant_619_173, align 4
  %149 = shl i32 %146, %constant_619_174
  %shft.chk75 = icmp ult i32 %constant_619_174, 32
  %150 = select i1 %shft.chk75, i32 %149, i32 0
  %151 = getelementptr i32, ptr @527, i32 %linear_index
  %constant_620_176 = getelementptr inbounds i32, ptr %151, i32 0
  %constant_620_177 = load i32, ptr %constant_620_176, align 4
  %152 = lshr i32 %146, %constant_620_177
  %shft.chk78 = icmp ult i32 %constant_620_177, 32
  %153 = select i1 %shft.chk78, i32 %152, i32 0
  %154 = or i32 %150, %153
  %155 = xor i32 %147, %154
  %156 = add i32 %147, %155
  %157 = getelementptr i32, ptr @526, i32 %linear_index
  %constant_621_179 = getelementptr inbounds i32, ptr %157, i32 0
  %constant_621_180 = load i32, ptr %constant_621_179, align 4
  %158 = shl i32 %155, %constant_621_180
  %shft.chk81 = icmp ult i32 %constant_621_180, 32
  %159 = select i1 %shft.chk81, i32 %158, i32 0
  %160 = getelementptr i32, ptr @526, i32 %linear_index
  %constant_621_182 = getelementptr inbounds i32, ptr %160, i32 0
  %constant_621_183 = load i32, ptr %constant_621_182, align 4
  %161 = lshr i32 %155, %constant_621_183
  %shft.chk84 = icmp ult i32 %constant_621_183, 32
  %162 = select i1 %shft.chk84, i32 %161, i32 0
  %163 = or i32 %159, %162
  %164 = xor i32 %156, %163
  %165 = add i32 %156, %164
  %166 = add i32 %165, %40
  %167 = getelementptr i32, ptr @533, i32 %linear_index
  %constant_622_185 = getelementptr inbounds i32, ptr %167, i32 0
  %constant_622_186 = load i32, ptr %constant_622_185, align 4
  %168 = shl i32 %164, %constant_622_186
  %shft.chk87 = icmp ult i32 %constant_622_186, 32
  %169 = select i1 %shft.chk87, i32 %168, i32 0
  %170 = getelementptr i32, ptr @525, i32 %linear_index
  %constant_623_188 = getelementptr inbounds i32, ptr %170, i32 0
  %constant_623_189 = load i32, ptr %constant_623_188, align 4
  %171 = lshr i32 %164, %constant_623_189
  %shft.chk90 = icmp ult i32 %constant_623_189, 32
  %172 = select i1 %shft.chk90, i32 %171, i32 0
  %173 = or i32 %169, %172
  %174 = xor i32 %165, %173
  %175 = add i32 %174, %54
  %176 = getelementptr i32, ptr @523, i32 %linear_index
  %constant_625_1 = getelementptr inbounds i32, ptr %176, i32 0
  %constant_625_191 = load i32, ptr %constant_625_1, align 4
  %177 = add i32 %175, %constant_625_191
  %178 = add i32 %166, %177
  %179 = getelementptr i32, ptr @531, i32 %linear_index
  %constant_611_192 = getelementptr inbounds i32, ptr %179, i32 0
  %constant_611_193 = load i32, ptr %constant_611_192, align 4
  %180 = shl i32 %177, %constant_611_193
  %shft.chk94 = icmp ult i32 %constant_611_193, 32
  %181 = select i1 %shft.chk94, i32 %180, i32 0
  %182 = getelementptr i32, ptr @522, i32 %linear_index
  %constant_612_195 = getelementptr inbounds i32, ptr %182, i32 0
  %constant_612_196 = load i32, ptr %constant_612_195, align 4
  %183 = lshr i32 %177, %constant_612_196
  %shft.chk97 = icmp ult i32 %constant_612_196, 32
  %184 = select i1 %shft.chk97, i32 %183, i32 0
  %185 = or i32 %181, %184
  %186 = xor i32 %178, %185
  %187 = add i32 %178, %186
  %188 = getelementptr i32, ptr @528, i32 %linear_index
  %constant_613_198 = getelementptr inbounds i32, ptr %188, i32 0
  %constant_613_199 = load i32, ptr %constant_613_198, align 4
  %189 = shl i32 %186, %constant_613_199
  %shft.chk100 = icmp ult i32 %constant_613_199, 32
  %190 = select i1 %shft.chk100, i32 %189, i32 0
  %191 = getelementptr i32, ptr @521, i32 %linear_index
  %constant_614_1101 = getelementptr inbounds i32, ptr %191, i32 0
  %constant_614_1102 = load i32, ptr %constant_614_1101, align 4
  %192 = lshr i32 %186, %constant_614_1102
  %shft.chk103 = icmp ult i32 %constant_614_1102, 32
  %193 = select i1 %shft.chk103, i32 %192, i32 0
  %194 = or i32 %190, %193
  %195 = xor i32 %187, %194
  %196 = add i32 %187, %195
  %197 = getelementptr i32, ptr @519, i32 %linear_index
  %constant_615_1104 = getelementptr inbounds i32, ptr %197, i32 0
  %constant_615_1105 = load i32, ptr %constant_615_1104, align 4
  %198 = shl i32 %195, %constant_615_1105
  %shft.chk106 = icmp ult i32 %constant_615_1105, 32
  %199 = select i1 %shft.chk106, i32 %198, i32 0
  %200 = getelementptr i32, ptr @520, i32 %linear_index
  %constant_616_1107 = getelementptr inbounds i32, ptr %200, i32 0
  %constant_616_1108 = load i32, ptr %constant_616_1107, align 4
  %201 = lshr i32 %195, %constant_616_1108
  %shft.chk109 = icmp ult i32 %constant_616_1108, 32
  %202 = select i1 %shft.chk109, i32 %201, i32 0
  %203 = or i32 %199, %202
  %204 = xor i32 %196, %203
  %205 = add i32 %196, %204
  %206 = add i32 %205, %54
  %207 = zext i32 %206 to i64
  %208 = getelementptr i64, ptr @534, i32 %linear_index
  %constant_626_1 = getelementptr inbounds i64, ptr %208, i32 0
  %constant_626_1110 = load i64, ptr %constant_626_1, align 8
  %209 = shl i64 %207, %constant_626_1110
  %shft.chk111 = icmp ult i64 %constant_626_1110, 64
  %210 = select i1 %shft.chk111, i64 %209, i64 0
  %211 = getelementptr i32, ptr @520, i32 %linear_index
  %constant_616_1112 = getelementptr inbounds i32, ptr %211, i32 0
  %constant_616_1113 = load i32, ptr %constant_616_1112, align 4
  %212 = shl i32 %204, %constant_616_1113
  %shft.chk114 = icmp ult i32 %constant_616_1113, 32
  %213 = select i1 %shft.chk114, i32 %212, i32 0
  %214 = getelementptr i32, ptr @519, i32 %linear_index
  %constant_615_1115 = getelementptr inbounds i32, ptr %214, i32 0
  %constant_615_1116 = load i32, ptr %constant_615_1115, align 4
  %215 = lshr i32 %204, %constant_615_1116
  %shft.chk117 = icmp ult i32 %constant_615_1116, 32
  %216 = select i1 %shft.chk117, i32 %215, i32 0
  %217 = or i32 %213, %216
  %218 = xor i32 %205, %217
  %219 = add i32 %218, %51
  %220 = getelementptr i32, ptr @518, i32 %linear_index
  %constant_627_1 = getelementptr inbounds i32, ptr %220, i32 0
  %constant_627_1118 = load i32, ptr %constant_627_1, align 4
  %221 = add i32 %219, %constant_627_1118
  %222 = zext i32 %221 to i64
  %223 = or i64 %210, %222
  %224 = getelementptr i64, ptr @517, i32 %linear_index
  %constant_1155_1 = getelementptr inbounds i64, ptr %224, i32 0
  %constant_1155_1119 = load i64, ptr %constant_1155_1, align 8
  %225 = lshr i64 %223, %constant_1155_1119
  %shft.chk120 = icmp ult i64 %constant_1155_1119, 64
  %226 = select i1 %shft.chk120, i64 %225, i64 0
  %227 = getelementptr i64, ptr @516, i32 %linear_index
  %constant_1225_1 = getelementptr inbounds i64, ptr %227, i32 0
  %constant_1225_1121 = load i64, ptr %constant_1225_1, align 8
  %228 = or i64 %226, %constant_1225_1121
  %229 = bitcast i64 %228 to double
  %230 = getelementptr double, ptr @515, i32 %linear_index
  %constant_1305_1 = getelementptr inbounds double, ptr %230, i32 0
  %constant_1305_1122 = load double, ptr %constant_1305_1, align 8
  %add.3659.3 = fadd double %229, %constant_1305_1122
  %231 = fcmp une double %constant_1334_11, %constant_1334_11
  %232 = fcmp oeq double %add.3659.3, %add.3659.3
  %233 = fcmp oge double %constant_1334_11, %add.3659.3
  %234 = and i1 %232, %233
  %235 = or i1 %231, %234
  %maximum.34.3 = select i1 %235, double %constant_1334_11, double %add.3659.3
  %constant_630_1 = load double, ptr @514, align 8
  %236 = load double, ptr %arg0, align 8, !invariant.load !297
  %237 = load double, ptr %arg1, align 8, !invariant.load !297
  %subtract.218.3 = fsub double %236, %237
  %238 = call double @__nv_exp(double %subtract.218.3)
  %239 = fcmp une double %constant_630_1, %constant_630_1
  %240 = fcmp oeq double %238, %238
  %241 = fcmp ole double %constant_630_1, %238
  %242 = and i1 %240, %241
  %243 = or i1 %239, %242
  %minimum.7.5 = select i1 %243, double %constant_630_1, double %238
  %compare.607.3 = fcmp olt double %maximum.34.3, %minimum.7.5
  %244 = zext i1 %compare.607.3 to i8
  %245 = zext i8 %244 to i32
  store i32 %245, ptr %arg3, align 4
  br label %loop_convert_fusion.in_bounds-after
}

define void @wrapped_add_12(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %wrapped_add.12.in_bounds-true, label %wrapped_add.12.in_bounds-after

wrapped_add.12.in_bounds-after:                   ; preds = %wrapped_add.12.in_bounds-true, %entry
  ret void

wrapped_add.12.in_bounds-true:                    ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !297
  %5 = load i64, ptr %arg1, align 8, !invariant.load !297
  %6 = add i64 %4, %5
  store i64 %6, ptr %arg2, align 8
  br label %wrapped_add.12.in_bounds-after
}

define void @wrapped_add_11(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %wrapped_add.11.in_bounds-true, label %wrapped_add.11.in_bounds-after

wrapped_add.11.in_bounds-after:                   ; preds = %wrapped_add.11.in_bounds-true, %entry
  ret void

wrapped_add.11.in_bounds-true:                    ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !297
  %add.4076.1 = fadd double %7, %10
  %11 = getelementptr double, ptr %arg2, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  store double %add.4076.1, ptr %12, align 8
  br label %wrapped_add.11.in_bounds-after
}

define void @loop_multiply_fusion_1(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8, ptr noalias align 128 dereferenceable(32) %arg9, ptr noalias align 128 dereferenceable(32) %arg10, ptr noalias align 128 dereferenceable(32) %arg11, ptr noalias align 128 dereferenceable(32) %arg12, ptr noalias align 128 dereferenceable(32) %arg13, ptr noalias align 128 dereferenceable(32) %arg14, ptr noalias align 128 dereferenceable(32) %arg15, ptr noalias align 128 dereferenceable(32) %arg16, ptr noalias align 128 dereferenceable(32) %arg17, ptr noalias align 128 dereferenceable(32) %arg18, ptr noalias align 128 dereferenceable(192) %arg19, ptr noalias align 128 dereferenceable(192) %arg20) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %2 = mul nuw nsw i32 %0, 24
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 24
  br i1 %4, label %loop_multiply_fusion.1.in_bounds-true, label %loop_multiply_fusion.1.in_bounds-after

loop_multiply_fusion.1.in_bounds-after:           ; preds = %concatenate.45.4.merge112, %entry
  ret void

loop_multiply_fusion.1.in_bounds-true:            ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !297
  br label %concatenate.pivot.12.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %8 = phi i32 [ 0, %concatenate.pivot.0. ]
  %9 = sub nsw i32 %3, %8
  %10 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %9
  %11 = load double, ptr %10, align 8, !invariant.load !297
  br label %concatenate.45.4.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.4.1
  %12 = phi i32 [ 4, %concatenate.pivot.4.1 ]
  %13 = sub nsw i32 %3, %12
  %14 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %13
  %15 = load double, ptr %14, align 8, !invariant.load !297
  br label %concatenate.45.4.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.8.2
  %16 = phi i32 [ 8, %concatenate.pivot.8.2 ]
  %17 = sub nsw i32 %3, %16
  %18 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %17
  %19 = load double, ptr %18, align 8, !invariant.load !297
  br label %concatenate.45.4.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.12.3
  %20 = phi i32 [ 12, %concatenate.pivot.12.3 ]
  %21 = sub nsw i32 %3, %20
  %22 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %21
  %23 = load double, ptr %22, align 8, !invariant.load !297
  br label %concatenate.45.4.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.16.4
  %24 = phi i32 [ 16, %concatenate.pivot.16.4 ]
  %25 = sub nsw i32 %3, %24
  %26 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %25
  %27 = load double, ptr %26, align 8, !invariant.load !297
  br label %concatenate.45.4.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.20.5
  %28 = phi i32 [ 20, %concatenate.pivot.20.5 ]
  %29 = sub nsw i32 %3, %28
  %30 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %29
  %31 = load double, ptr %30, align 8, !invariant.load !297
  br label %concatenate.45.4.merge

concatenate.pivot.12.:                            ; preds = %loop_multiply_fusion.1.in_bounds-true
  %32 = icmp ult i32 %3, 12
  br i1 %32, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %concatenate.pivot.12.
  %33 = icmp ult i32 %3, 4
  br i1 %33, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id0

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %34 = icmp ult i32 %3, 8
  br i1 %34, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id1

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id2

concatenate.pivot.16.:                            ; preds = %concatenate.pivot.12.
  %35 = icmp ult i32 %3, 16
  br i1 %35, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id3

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %36 = icmp ult i32 %3, 20
  br i1 %36, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id4

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id5

concatenate.45.4.merge:                           ; preds = %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %37 = phi double [ %11, %concat_index_from_operand_id0 ], [ %15, %concat_index_from_operand_id1 ], [ %19, %concat_index_from_operand_id2 ], [ %23, %concat_index_from_operand_id3 ], [ %27, %concat_index_from_operand_id4 ], [ %31, %concat_index_from_operand_id5 ]
  %multiply.2979.3 = fmul double %7, %37
  br label %concatenate.pivot.12.12

concat_index_from_operand_id06:                   ; preds = %concatenate.pivot.0.14
  %38 = phi i32 [ 0, %concatenate.pivot.0.14 ]
  %39 = sub nsw i32 %3, %38
  %40 = getelementptr inbounds [4 x double], ptr %arg13, i32 0, i32 %39
  %41 = load double, ptr %40, align 8, !invariant.load !297
  br label %concatenate.46.5.merge

concat_index_from_operand_id17:                   ; preds = %concatenate.pivot.4.16
  %42 = phi i32 [ 4, %concatenate.pivot.4.16 ]
  %43 = sub nsw i32 %3, %42
  %44 = getelementptr inbounds [4 x double], ptr %arg14, i32 0, i32 %43
  %45 = load double, ptr %44, align 8, !invariant.load !297
  br label %concatenate.46.5.merge

concat_index_from_operand_id28:                   ; preds = %concatenate.pivot.8.17
  %46 = phi i32 [ 8, %concatenate.pivot.8.17 ]
  %47 = sub nsw i32 %3, %46
  %48 = getelementptr inbounds [4 x double], ptr %arg15, i32 0, i32 %47
  %49 = load double, ptr %48, align 8, !invariant.load !297
  br label %concatenate.46.5.merge

concat_index_from_operand_id39:                   ; preds = %concatenate.pivot.12.19
  %50 = phi i32 [ 12, %concatenate.pivot.12.19 ]
  %51 = sub nsw i32 %3, %50
  %52 = getelementptr inbounds [4 x double], ptr %arg16, i32 0, i32 %51
  %53 = load double, ptr %52, align 8, !invariant.load !297
  br label %concatenate.46.5.merge

concat_index_from_operand_id410:                  ; preds = %concatenate.pivot.16.21
  %54 = phi i32 [ 16, %concatenate.pivot.16.21 ]
  %55 = sub nsw i32 %3, %54
  %56 = getelementptr inbounds [4 x double], ptr %arg17, i32 0, i32 %55
  %57 = load double, ptr %56, align 8, !invariant.load !297
  br label %concatenate.46.5.merge

concat_index_from_operand_id511:                  ; preds = %concatenate.pivot.20.22
  %58 = phi i32 [ 20, %concatenate.pivot.20.22 ]
  %59 = sub nsw i32 %3, %58
  %60 = getelementptr inbounds [4 x double], ptr %arg18, i32 0, i32 %59
  %61 = load double, ptr %60, align 8, !invariant.load !297
  br label %concatenate.46.5.merge

concatenate.pivot.12.12:                          ; preds = %concatenate.45.4.merge
  %62 = icmp ult i32 %3, 12
  br i1 %62, label %concatenate.pivot.4.13, label %concatenate.pivot.16.18

concatenate.pivot.4.13:                           ; preds = %concatenate.pivot.12.12
  %63 = icmp ult i32 %3, 4
  br i1 %63, label %concatenate.pivot.0.14, label %concatenate.pivot.8.15

concatenate.pivot.0.14:                           ; preds = %concatenate.pivot.4.13
  br label %concat_index_from_operand_id06

concatenate.pivot.8.15:                           ; preds = %concatenate.pivot.4.13
  %64 = icmp ult i32 %3, 8
  br i1 %64, label %concatenate.pivot.4.16, label %concatenate.pivot.8.17

concatenate.pivot.4.16:                           ; preds = %concatenate.pivot.8.15
  br label %concat_index_from_operand_id17

concatenate.pivot.8.17:                           ; preds = %concatenate.pivot.8.15
  br label %concat_index_from_operand_id28

concatenate.pivot.16.18:                          ; preds = %concatenate.pivot.12.12
  %65 = icmp ult i32 %3, 16
  br i1 %65, label %concatenate.pivot.12.19, label %concatenate.pivot.20.20

concatenate.pivot.12.19:                          ; preds = %concatenate.pivot.16.18
  br label %concat_index_from_operand_id39

concatenate.pivot.20.20:                          ; preds = %concatenate.pivot.16.18
  %66 = icmp ult i32 %3, 20
  br i1 %66, label %concatenate.pivot.16.21, label %concatenate.pivot.20.22

concatenate.pivot.16.21:                          ; preds = %concatenate.pivot.20.20
  br label %concat_index_from_operand_id410

concatenate.pivot.20.22:                          ; preds = %concatenate.pivot.20.20
  br label %concat_index_from_operand_id511

concatenate.46.5.merge:                           ; preds = %concat_index_from_operand_id511, %concat_index_from_operand_id410, %concat_index_from_operand_id39, %concat_index_from_operand_id28, %concat_index_from_operand_id17, %concat_index_from_operand_id06
  %67 = phi double [ %41, %concat_index_from_operand_id06 ], [ %45, %concat_index_from_operand_id17 ], [ %49, %concat_index_from_operand_id28 ], [ %53, %concat_index_from_operand_id39 ], [ %57, %concat_index_from_operand_id410 ], [ %61, %concat_index_from_operand_id511 ]
  br label %concatenate.pivot.12.29

concat_index_from_operand_id023:                  ; preds = %concatenate.pivot.0.31
  %68 = phi i32 [ 0, %concatenate.pivot.0.31 ]
  %69 = sub nsw i32 %3, %68
  %70 = getelementptr inbounds [4 x double], ptr %arg7, i32 0, i32 %69
  %71 = load double, ptr %70, align 8, !invariant.load !297
  br label %concatenate.47.12.merge

concat_index_from_operand_id124:                  ; preds = %concatenate.pivot.4.33
  %72 = phi i32 [ 4, %concatenate.pivot.4.33 ]
  %73 = sub nsw i32 %3, %72
  %74 = getelementptr inbounds [4 x double], ptr %arg8, i32 0, i32 %73
  %75 = load double, ptr %74, align 8, !invariant.load !297
  br label %concatenate.47.12.merge

concat_index_from_operand_id225:                  ; preds = %concatenate.pivot.8.34
  %76 = phi i32 [ 8, %concatenate.pivot.8.34 ]
  %77 = sub nsw i32 %3, %76
  %78 = getelementptr inbounds [4 x double], ptr %arg9, i32 0, i32 %77
  %79 = load double, ptr %78, align 8, !invariant.load !297
  br label %concatenate.47.12.merge

concat_index_from_operand_id326:                  ; preds = %concatenate.pivot.12.36
  %80 = phi i32 [ 12, %concatenate.pivot.12.36 ]
  %81 = sub nsw i32 %3, %80
  %82 = getelementptr inbounds [4 x double], ptr %arg10, i32 0, i32 %81
  %83 = load double, ptr %82, align 8, !invariant.load !297
  br label %concatenate.47.12.merge

concat_index_from_operand_id427:                  ; preds = %concatenate.pivot.16.38
  %84 = phi i32 [ 16, %concatenate.pivot.16.38 ]
  %85 = sub nsw i32 %3, %84
  %86 = getelementptr inbounds [4 x double], ptr %arg11, i32 0, i32 %85
  %87 = load double, ptr %86, align 8, !invariant.load !297
  br label %concatenate.47.12.merge

concat_index_from_operand_id528:                  ; preds = %concatenate.pivot.20.39
  %88 = phi i32 [ 20, %concatenate.pivot.20.39 ]
  %89 = sub nsw i32 %3, %88
  %90 = getelementptr inbounds [4 x double], ptr %arg12, i32 0, i32 %89
  %91 = load double, ptr %90, align 8, !invariant.load !297
  br label %concatenate.47.12.merge

concatenate.pivot.12.29:                          ; preds = %concatenate.46.5.merge
  %92 = icmp ult i32 %3, 12
  br i1 %92, label %concatenate.pivot.4.30, label %concatenate.pivot.16.35

concatenate.pivot.4.30:                           ; preds = %concatenate.pivot.12.29
  %93 = icmp ult i32 %3, 4
  br i1 %93, label %concatenate.pivot.0.31, label %concatenate.pivot.8.32

concatenate.pivot.0.31:                           ; preds = %concatenate.pivot.4.30
  br label %concat_index_from_operand_id023

concatenate.pivot.8.32:                           ; preds = %concatenate.pivot.4.30
  %94 = icmp ult i32 %3, 8
  br i1 %94, label %concatenate.pivot.4.33, label %concatenate.pivot.8.34

concatenate.pivot.4.33:                           ; preds = %concatenate.pivot.8.32
  br label %concat_index_from_operand_id124

concatenate.pivot.8.34:                           ; preds = %concatenate.pivot.8.32
  br label %concat_index_from_operand_id225

concatenate.pivot.16.35:                          ; preds = %concatenate.pivot.12.29
  %95 = icmp ult i32 %3, 16
  br i1 %95, label %concatenate.pivot.12.36, label %concatenate.pivot.20.37

concatenate.pivot.12.36:                          ; preds = %concatenate.pivot.16.35
  br label %concat_index_from_operand_id326

concatenate.pivot.20.37:                          ; preds = %concatenate.pivot.16.35
  %96 = icmp ult i32 %3, 20
  br i1 %96, label %concatenate.pivot.16.38, label %concatenate.pivot.20.39

concatenate.pivot.16.38:                          ; preds = %concatenate.pivot.20.37
  br label %concat_index_from_operand_id427

concatenate.pivot.20.39:                          ; preds = %concatenate.pivot.20.37
  br label %concat_index_from_operand_id528

concatenate.47.12.merge:                          ; preds = %concat_index_from_operand_id528, %concat_index_from_operand_id427, %concat_index_from_operand_id326, %concat_index_from_operand_id225, %concat_index_from_operand_id124, %concat_index_from_operand_id023
  %97 = phi double [ %71, %concat_index_from_operand_id023 ], [ %75, %concat_index_from_operand_id124 ], [ %79, %concat_index_from_operand_id225 ], [ %83, %concat_index_from_operand_id326 ], [ %87, %concat_index_from_operand_id427 ], [ %91, %concat_index_from_operand_id528 ]
  br label %concatenate.pivot.12.47

concat_index_from_operand_id041:                  ; preds = %concatenate.pivot.0.49
  %98 = phi i32 [ 0, %concatenate.pivot.0.49 ]
  %99 = sub nsw i32 %3, %98
  %100 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %99
  %101 = load double, ptr %100, align 8, !invariant.load !297
  br label %concatenate.45.4.merge40

concat_index_from_operand_id142:                  ; preds = %concatenate.pivot.4.51
  %102 = phi i32 [ 4, %concatenate.pivot.4.51 ]
  %103 = sub nsw i32 %3, %102
  %104 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %103
  %105 = load double, ptr %104, align 8, !invariant.load !297
  br label %concatenate.45.4.merge40

concat_index_from_operand_id243:                  ; preds = %concatenate.pivot.8.52
  %106 = phi i32 [ 8, %concatenate.pivot.8.52 ]
  %107 = sub nsw i32 %3, %106
  %108 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %107
  %109 = load double, ptr %108, align 8, !invariant.load !297
  br label %concatenate.45.4.merge40

concat_index_from_operand_id344:                  ; preds = %concatenate.pivot.12.54
  %110 = phi i32 [ 12, %concatenate.pivot.12.54 ]
  %111 = sub nsw i32 %3, %110
  %112 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %111
  %113 = load double, ptr %112, align 8, !invariant.load !297
  br label %concatenate.45.4.merge40

concat_index_from_operand_id445:                  ; preds = %concatenate.pivot.16.56
  %114 = phi i32 [ 16, %concatenate.pivot.16.56 ]
  %115 = sub nsw i32 %3, %114
  %116 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %115
  %117 = load double, ptr %116, align 8, !invariant.load !297
  br label %concatenate.45.4.merge40

concat_index_from_operand_id546:                  ; preds = %concatenate.pivot.20.57
  %118 = phi i32 [ 20, %concatenate.pivot.20.57 ]
  %119 = sub nsw i32 %3, %118
  %120 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %119
  %121 = load double, ptr %120, align 8, !invariant.load !297
  br label %concatenate.45.4.merge40

concatenate.pivot.12.47:                          ; preds = %concatenate.47.12.merge
  %122 = icmp ult i32 %3, 12
  br i1 %122, label %concatenate.pivot.4.48, label %concatenate.pivot.16.53

concatenate.pivot.4.48:                           ; preds = %concatenate.pivot.12.47
  %123 = icmp ult i32 %3, 4
  br i1 %123, label %concatenate.pivot.0.49, label %concatenate.pivot.8.50

concatenate.pivot.0.49:                           ; preds = %concatenate.pivot.4.48
  br label %concat_index_from_operand_id041

concatenate.pivot.8.50:                           ; preds = %concatenate.pivot.4.48
  %124 = icmp ult i32 %3, 8
  br i1 %124, label %concatenate.pivot.4.51, label %concatenate.pivot.8.52

concatenate.pivot.4.51:                           ; preds = %concatenate.pivot.8.50
  br label %concat_index_from_operand_id142

concatenate.pivot.8.52:                           ; preds = %concatenate.pivot.8.50
  br label %concat_index_from_operand_id243

concatenate.pivot.16.53:                          ; preds = %concatenate.pivot.12.47
  %125 = icmp ult i32 %3, 16
  br i1 %125, label %concatenate.pivot.12.54, label %concatenate.pivot.20.55

concatenate.pivot.12.54:                          ; preds = %concatenate.pivot.16.53
  br label %concat_index_from_operand_id344

concatenate.pivot.20.55:                          ; preds = %concatenate.pivot.16.53
  %126 = icmp ult i32 %3, 20
  br i1 %126, label %concatenate.pivot.16.56, label %concatenate.pivot.20.57

concatenate.pivot.16.56:                          ; preds = %concatenate.pivot.20.55
  br label %concat_index_from_operand_id445

concatenate.pivot.20.57:                          ; preds = %concatenate.pivot.20.55
  br label %concat_index_from_operand_id546

concatenate.45.4.merge40:                         ; preds = %concat_index_from_operand_id546, %concat_index_from_operand_id445, %concat_index_from_operand_id344, %concat_index_from_operand_id243, %concat_index_from_operand_id142, %concat_index_from_operand_id041
  %127 = phi double [ %101, %concat_index_from_operand_id041 ], [ %105, %concat_index_from_operand_id142 ], [ %109, %concat_index_from_operand_id243 ], [ %113, %concat_index_from_operand_id344 ], [ %117, %concat_index_from_operand_id445 ], [ %121, %concat_index_from_operand_id546 ]
  %add.4079.9 = fadd double %97, %127
  %constant_1731_1 = load double, ptr @536, align 8
  %multiply.2980.7 = fmul double %add.4079.9, %constant_1731_1
  %subtract.240.5 = fsub double %67, %multiply.2980.7
  %multiply.2981.1 = fmul double %multiply.2979.3, %subtract.240.5
  %128 = insertvalue { double, double } undef, double %multiply.2981.1, 0
  %129 = getelementptr double, ptr %arg0, i32 %linear_index
  %130 = getelementptr inbounds double, ptr %129, i32 0
  %131 = load double, ptr %130, align 8, !invariant.load !297
  br label %concatenate.pivot.12.65

concat_index_from_operand_id059:                  ; preds = %concatenate.pivot.0.67
  %132 = phi i32 [ 0, %concatenate.pivot.0.67 ]
  %133 = sub nsw i32 %3, %132
  %134 = getelementptr inbounds [4 x double], ptr %arg7, i32 0, i32 %133
  %135 = load double, ptr %134, align 8, !invariant.load !297
  br label %concatenate.47.12.merge58

concat_index_from_operand_id160:                  ; preds = %concatenate.pivot.4.69
  %136 = phi i32 [ 4, %concatenate.pivot.4.69 ]
  %137 = sub nsw i32 %3, %136
  %138 = getelementptr inbounds [4 x double], ptr %arg8, i32 0, i32 %137
  %139 = load double, ptr %138, align 8, !invariant.load !297
  br label %concatenate.47.12.merge58

concat_index_from_operand_id261:                  ; preds = %concatenate.pivot.8.70
  %140 = phi i32 [ 8, %concatenate.pivot.8.70 ]
  %141 = sub nsw i32 %3, %140
  %142 = getelementptr inbounds [4 x double], ptr %arg9, i32 0, i32 %141
  %143 = load double, ptr %142, align 8, !invariant.load !297
  br label %concatenate.47.12.merge58

concat_index_from_operand_id362:                  ; preds = %concatenate.pivot.12.72
  %144 = phi i32 [ 12, %concatenate.pivot.12.72 ]
  %145 = sub nsw i32 %3, %144
  %146 = getelementptr inbounds [4 x double], ptr %arg10, i32 0, i32 %145
  %147 = load double, ptr %146, align 8, !invariant.load !297
  br label %concatenate.47.12.merge58

concat_index_from_operand_id463:                  ; preds = %concatenate.pivot.16.74
  %148 = phi i32 [ 16, %concatenate.pivot.16.74 ]
  %149 = sub nsw i32 %3, %148
  %150 = getelementptr inbounds [4 x double], ptr %arg11, i32 0, i32 %149
  %151 = load double, ptr %150, align 8, !invariant.load !297
  br label %concatenate.47.12.merge58

concat_index_from_operand_id564:                  ; preds = %concatenate.pivot.20.75
  %152 = phi i32 [ 20, %concatenate.pivot.20.75 ]
  %153 = sub nsw i32 %3, %152
  %154 = getelementptr inbounds [4 x double], ptr %arg12, i32 0, i32 %153
  %155 = load double, ptr %154, align 8, !invariant.load !297
  br label %concatenate.47.12.merge58

concatenate.pivot.12.65:                          ; preds = %concatenate.45.4.merge40
  %156 = icmp ult i32 %3, 12
  br i1 %156, label %concatenate.pivot.4.66, label %concatenate.pivot.16.71

concatenate.pivot.4.66:                           ; preds = %concatenate.pivot.12.65
  %157 = icmp ult i32 %3, 4
  br i1 %157, label %concatenate.pivot.0.67, label %concatenate.pivot.8.68

concatenate.pivot.0.67:                           ; preds = %concatenate.pivot.4.66
  br label %concat_index_from_operand_id059

concatenate.pivot.8.68:                           ; preds = %concatenate.pivot.4.66
  %158 = icmp ult i32 %3, 8
  br i1 %158, label %concatenate.pivot.4.69, label %concatenate.pivot.8.70

concatenate.pivot.4.69:                           ; preds = %concatenate.pivot.8.68
  br label %concat_index_from_operand_id160

concatenate.pivot.8.70:                           ; preds = %concatenate.pivot.8.68
  br label %concat_index_from_operand_id261

concatenate.pivot.16.71:                          ; preds = %concatenate.pivot.12.65
  %159 = icmp ult i32 %3, 16
  br i1 %159, label %concatenate.pivot.12.72, label %concatenate.pivot.20.73

concatenate.pivot.12.72:                          ; preds = %concatenate.pivot.16.71
  br label %concat_index_from_operand_id362

concatenate.pivot.20.73:                          ; preds = %concatenate.pivot.16.71
  %160 = icmp ult i32 %3, 20
  br i1 %160, label %concatenate.pivot.16.74, label %concatenate.pivot.20.75

concatenate.pivot.16.74:                          ; preds = %concatenate.pivot.20.73
  br label %concat_index_from_operand_id463

concatenate.pivot.20.75:                          ; preds = %concatenate.pivot.20.73
  br label %concat_index_from_operand_id564

concatenate.47.12.merge58:                        ; preds = %concat_index_from_operand_id564, %concat_index_from_operand_id463, %concat_index_from_operand_id362, %concat_index_from_operand_id261, %concat_index_from_operand_id160, %concat_index_from_operand_id059
  %161 = phi double [ %135, %concat_index_from_operand_id059 ], [ %139, %concat_index_from_operand_id160 ], [ %143, %concat_index_from_operand_id261 ], [ %147, %concat_index_from_operand_id362 ], [ %151, %concat_index_from_operand_id463 ], [ %155, %concat_index_from_operand_id564 ]
  %multiply.2982.3.clone.1 = fmul double %131, %161
  br label %concatenate.pivot.12.83

concat_index_from_operand_id077:                  ; preds = %concatenate.pivot.0.85
  %162 = phi i32 [ 0, %concatenate.pivot.0.85 ]
  %163 = sub nsw i32 %3, %162
  %164 = getelementptr inbounds [4 x double], ptr %arg13, i32 0, i32 %163
  %165 = load double, ptr %164, align 8, !invariant.load !297
  br label %concatenate.46.5.merge76

concat_index_from_operand_id178:                  ; preds = %concatenate.pivot.4.87
  %166 = phi i32 [ 4, %concatenate.pivot.4.87 ]
  %167 = sub nsw i32 %3, %166
  %168 = getelementptr inbounds [4 x double], ptr %arg14, i32 0, i32 %167
  %169 = load double, ptr %168, align 8, !invariant.load !297
  br label %concatenate.46.5.merge76

concat_index_from_operand_id279:                  ; preds = %concatenate.pivot.8.88
  %170 = phi i32 [ 8, %concatenate.pivot.8.88 ]
  %171 = sub nsw i32 %3, %170
  %172 = getelementptr inbounds [4 x double], ptr %arg15, i32 0, i32 %171
  %173 = load double, ptr %172, align 8, !invariant.load !297
  br label %concatenate.46.5.merge76

concat_index_from_operand_id380:                  ; preds = %concatenate.pivot.12.90
  %174 = phi i32 [ 12, %concatenate.pivot.12.90 ]
  %175 = sub nsw i32 %3, %174
  %176 = getelementptr inbounds [4 x double], ptr %arg16, i32 0, i32 %175
  %177 = load double, ptr %176, align 8, !invariant.load !297
  br label %concatenate.46.5.merge76

concat_index_from_operand_id481:                  ; preds = %concatenate.pivot.16.92
  %178 = phi i32 [ 16, %concatenate.pivot.16.92 ]
  %179 = sub nsw i32 %3, %178
  %180 = getelementptr inbounds [4 x double], ptr %arg17, i32 0, i32 %179
  %181 = load double, ptr %180, align 8, !invariant.load !297
  br label %concatenate.46.5.merge76

concat_index_from_operand_id582:                  ; preds = %concatenate.pivot.20.93
  %182 = phi i32 [ 20, %concatenate.pivot.20.93 ]
  %183 = sub nsw i32 %3, %182
  %184 = getelementptr inbounds [4 x double], ptr %arg18, i32 0, i32 %183
  %185 = load double, ptr %184, align 8, !invariant.load !297
  br label %concatenate.46.5.merge76

concatenate.pivot.12.83:                          ; preds = %concatenate.47.12.merge58
  %186 = icmp ult i32 %3, 12
  br i1 %186, label %concatenate.pivot.4.84, label %concatenate.pivot.16.89

concatenate.pivot.4.84:                           ; preds = %concatenate.pivot.12.83
  %187 = icmp ult i32 %3, 4
  br i1 %187, label %concatenate.pivot.0.85, label %concatenate.pivot.8.86

concatenate.pivot.0.85:                           ; preds = %concatenate.pivot.4.84
  br label %concat_index_from_operand_id077

concatenate.pivot.8.86:                           ; preds = %concatenate.pivot.4.84
  %188 = icmp ult i32 %3, 8
  br i1 %188, label %concatenate.pivot.4.87, label %concatenate.pivot.8.88

concatenate.pivot.4.87:                           ; preds = %concatenate.pivot.8.86
  br label %concat_index_from_operand_id178

concatenate.pivot.8.88:                           ; preds = %concatenate.pivot.8.86
  br label %concat_index_from_operand_id279

concatenate.pivot.16.89:                          ; preds = %concatenate.pivot.12.83
  %189 = icmp ult i32 %3, 16
  br i1 %189, label %concatenate.pivot.12.90, label %concatenate.pivot.20.91

concatenate.pivot.12.90:                          ; preds = %concatenate.pivot.16.89
  br label %concat_index_from_operand_id380

concatenate.pivot.20.91:                          ; preds = %concatenate.pivot.16.89
  %190 = icmp ult i32 %3, 20
  br i1 %190, label %concatenate.pivot.16.92, label %concatenate.pivot.20.93

concatenate.pivot.16.92:                          ; preds = %concatenate.pivot.20.91
  br label %concat_index_from_operand_id481

concatenate.pivot.20.93:                          ; preds = %concatenate.pivot.20.91
  br label %concat_index_from_operand_id582

concatenate.46.5.merge76:                         ; preds = %concat_index_from_operand_id582, %concat_index_from_operand_id481, %concat_index_from_operand_id380, %concat_index_from_operand_id279, %concat_index_from_operand_id178, %concat_index_from_operand_id077
  %191 = phi double [ %165, %concat_index_from_operand_id077 ], [ %169, %concat_index_from_operand_id178 ], [ %173, %concat_index_from_operand_id279 ], [ %177, %concat_index_from_operand_id380 ], [ %181, %concat_index_from_operand_id481 ], [ %185, %concat_index_from_operand_id582 ]
  br label %concatenate.pivot.12.101

concat_index_from_operand_id095:                  ; preds = %concatenate.pivot.0.103
  %192 = phi i32 [ 0, %concatenate.pivot.0.103 ]
  %193 = sub nsw i32 %3, %192
  %194 = getelementptr inbounds [4 x double], ptr %arg7, i32 0, i32 %193
  %195 = load double, ptr %194, align 8, !invariant.load !297
  br label %concatenate.47.12.merge94

concat_index_from_operand_id196:                  ; preds = %concatenate.pivot.4.105
  %196 = phi i32 [ 4, %concatenate.pivot.4.105 ]
  %197 = sub nsw i32 %3, %196
  %198 = getelementptr inbounds [4 x double], ptr %arg8, i32 0, i32 %197
  %199 = load double, ptr %198, align 8, !invariant.load !297
  br label %concatenate.47.12.merge94

concat_index_from_operand_id297:                  ; preds = %concatenate.pivot.8.106
  %200 = phi i32 [ 8, %concatenate.pivot.8.106 ]
  %201 = sub nsw i32 %3, %200
  %202 = getelementptr inbounds [4 x double], ptr %arg9, i32 0, i32 %201
  %203 = load double, ptr %202, align 8, !invariant.load !297
  br label %concatenate.47.12.merge94

concat_index_from_operand_id398:                  ; preds = %concatenate.pivot.12.108
  %204 = phi i32 [ 12, %concatenate.pivot.12.108 ]
  %205 = sub nsw i32 %3, %204
  %206 = getelementptr inbounds [4 x double], ptr %arg10, i32 0, i32 %205
  %207 = load double, ptr %206, align 8, !invariant.load !297
  br label %concatenate.47.12.merge94

concat_index_from_operand_id499:                  ; preds = %concatenate.pivot.16.110
  %208 = phi i32 [ 16, %concatenate.pivot.16.110 ]
  %209 = sub nsw i32 %3, %208
  %210 = getelementptr inbounds [4 x double], ptr %arg11, i32 0, i32 %209
  %211 = load double, ptr %210, align 8, !invariant.load !297
  br label %concatenate.47.12.merge94

concat_index_from_operand_id5100:                 ; preds = %concatenate.pivot.20.111
  %212 = phi i32 [ 20, %concatenate.pivot.20.111 ]
  %213 = sub nsw i32 %3, %212
  %214 = getelementptr inbounds [4 x double], ptr %arg12, i32 0, i32 %213
  %215 = load double, ptr %214, align 8, !invariant.load !297
  br label %concatenate.47.12.merge94

concatenate.pivot.12.101:                         ; preds = %concatenate.46.5.merge76
  %216 = icmp ult i32 %3, 12
  br i1 %216, label %concatenate.pivot.4.102, label %concatenate.pivot.16.107

concatenate.pivot.4.102:                          ; preds = %concatenate.pivot.12.101
  %217 = icmp ult i32 %3, 4
  br i1 %217, label %concatenate.pivot.0.103, label %concatenate.pivot.8.104

concatenate.pivot.0.103:                          ; preds = %concatenate.pivot.4.102
  br label %concat_index_from_operand_id095

concatenate.pivot.8.104:                          ; preds = %concatenate.pivot.4.102
  %218 = icmp ult i32 %3, 8
  br i1 %218, label %concatenate.pivot.4.105, label %concatenate.pivot.8.106

concatenate.pivot.4.105:                          ; preds = %concatenate.pivot.8.104
  br label %concat_index_from_operand_id196

concatenate.pivot.8.106:                          ; preds = %concatenate.pivot.8.104
  br label %concat_index_from_operand_id297

concatenate.pivot.16.107:                         ; preds = %concatenate.pivot.12.101
  %219 = icmp ult i32 %3, 16
  br i1 %219, label %concatenate.pivot.12.108, label %concatenate.pivot.20.109

concatenate.pivot.12.108:                         ; preds = %concatenate.pivot.16.107
  br label %concat_index_from_operand_id398

concatenate.pivot.20.109:                         ; preds = %concatenate.pivot.16.107
  %220 = icmp ult i32 %3, 20
  br i1 %220, label %concatenate.pivot.16.110, label %concatenate.pivot.20.111

concatenate.pivot.16.110:                         ; preds = %concatenate.pivot.20.109
  br label %concat_index_from_operand_id499

concatenate.pivot.20.111:                         ; preds = %concatenate.pivot.20.109
  br label %concat_index_from_operand_id5100

concatenate.47.12.merge94:                        ; preds = %concat_index_from_operand_id5100, %concat_index_from_operand_id499, %concat_index_from_operand_id398, %concat_index_from_operand_id297, %concat_index_from_operand_id196, %concat_index_from_operand_id095
  %221 = phi double [ %195, %concat_index_from_operand_id095 ], [ %199, %concat_index_from_operand_id196 ], [ %203, %concat_index_from_operand_id297 ], [ %207, %concat_index_from_operand_id398 ], [ %211, %concat_index_from_operand_id499 ], [ %215, %concat_index_from_operand_id5100 ]
  br label %concatenate.pivot.12.119

concat_index_from_operand_id0113:                 ; preds = %concatenate.pivot.0.121
  %222 = phi i32 [ 0, %concatenate.pivot.0.121 ]
  %223 = sub nsw i32 %3, %222
  %224 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %223
  %225 = load double, ptr %224, align 8, !invariant.load !297
  br label %concatenate.45.4.merge112

concat_index_from_operand_id1114:                 ; preds = %concatenate.pivot.4.123
  %226 = phi i32 [ 4, %concatenate.pivot.4.123 ]
  %227 = sub nsw i32 %3, %226
  %228 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %227
  %229 = load double, ptr %228, align 8, !invariant.load !297
  br label %concatenate.45.4.merge112

concat_index_from_operand_id2115:                 ; preds = %concatenate.pivot.8.124
  %230 = phi i32 [ 8, %concatenate.pivot.8.124 ]
  %231 = sub nsw i32 %3, %230
  %232 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %231
  %233 = load double, ptr %232, align 8, !invariant.load !297
  br label %concatenate.45.4.merge112

concat_index_from_operand_id3116:                 ; preds = %concatenate.pivot.12.126
  %234 = phi i32 [ 12, %concatenate.pivot.12.126 ]
  %235 = sub nsw i32 %3, %234
  %236 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %235
  %237 = load double, ptr %236, align 8, !invariant.load !297
  br label %concatenate.45.4.merge112

concat_index_from_operand_id4117:                 ; preds = %concatenate.pivot.16.128
  %238 = phi i32 [ 16, %concatenate.pivot.16.128 ]
  %239 = sub nsw i32 %3, %238
  %240 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %239
  %241 = load double, ptr %240, align 8, !invariant.load !297
  br label %concatenate.45.4.merge112

concat_index_from_operand_id5118:                 ; preds = %concatenate.pivot.20.129
  %242 = phi i32 [ 20, %concatenate.pivot.20.129 ]
  %243 = sub nsw i32 %3, %242
  %244 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %243
  %245 = load double, ptr %244, align 8, !invariant.load !297
  br label %concatenate.45.4.merge112

concatenate.pivot.12.119:                         ; preds = %concatenate.47.12.merge94
  %246 = icmp ult i32 %3, 12
  br i1 %246, label %concatenate.pivot.4.120, label %concatenate.pivot.16.125

concatenate.pivot.4.120:                          ; preds = %concatenate.pivot.12.119
  %247 = icmp ult i32 %3, 4
  br i1 %247, label %concatenate.pivot.0.121, label %concatenate.pivot.8.122

concatenate.pivot.0.121:                          ; preds = %concatenate.pivot.4.120
  br label %concat_index_from_operand_id0113

concatenate.pivot.8.122:                          ; preds = %concatenate.pivot.4.120
  %248 = icmp ult i32 %3, 8
  br i1 %248, label %concatenate.pivot.4.123, label %concatenate.pivot.8.124

concatenate.pivot.4.123:                          ; preds = %concatenate.pivot.8.122
  br label %concat_index_from_operand_id1114

concatenate.pivot.8.124:                          ; preds = %concatenate.pivot.8.122
  br label %concat_index_from_operand_id2115

concatenate.pivot.16.125:                         ; preds = %concatenate.pivot.12.119
  %249 = icmp ult i32 %3, 16
  br i1 %249, label %concatenate.pivot.12.126, label %concatenate.pivot.20.127

concatenate.pivot.12.126:                         ; preds = %concatenate.pivot.16.125
  br label %concat_index_from_operand_id3116

concatenate.pivot.20.127:                         ; preds = %concatenate.pivot.16.125
  %250 = icmp ult i32 %3, 20
  br i1 %250, label %concatenate.pivot.16.128, label %concatenate.pivot.20.129

concatenate.pivot.16.128:                         ; preds = %concatenate.pivot.20.127
  br label %concat_index_from_operand_id4117

concatenate.pivot.20.129:                         ; preds = %concatenate.pivot.20.127
  br label %concat_index_from_operand_id5118

concatenate.45.4.merge112:                        ; preds = %concat_index_from_operand_id5118, %concat_index_from_operand_id4117, %concat_index_from_operand_id3116, %concat_index_from_operand_id2115, %concat_index_from_operand_id1114, %concat_index_from_operand_id0113
  %251 = phi double [ %225, %concat_index_from_operand_id0113 ], [ %229, %concat_index_from_operand_id1114 ], [ %233, %concat_index_from_operand_id2115 ], [ %237, %concat_index_from_operand_id3116 ], [ %241, %concat_index_from_operand_id4117 ], [ %245, %concat_index_from_operand_id5118 ]
  %add.4079.9130 = fadd double %221, %251
  %constant_1731_1131 = load double, ptr @536, align 8
  %multiply.2980.7132 = fmul double %add.4079.9130, %constant_1731_1131
  %subtract.240.5133 = fsub double %191, %multiply.2980.7132
  %multiply.2983.1.clone.1 = fmul double %multiply.2982.3.clone.1, %subtract.240.5133
  %252 = insertvalue { double, double } %128, double %multiply.2983.1.clone.1, 1
  %253 = extractvalue { double, double } %252, 0
  %254 = getelementptr double, ptr %arg19, i32 %linear_index
  %255 = getelementptr inbounds double, ptr %254, i32 0
  store double %253, ptr %255, align 8
  %256 = extractvalue { double, double } %252, 1
  %257 = getelementptr double, ptr %arg20, i32 %linear_index
  %258 = getelementptr inbounds double, ptr %257, i32 0
  store double %256, ptr %258, align 8
  br label %loop_multiply_fusion.1.in_bounds-after
}

define void @loop_or_fusion_1(ptr noalias align 128 dereferenceable(1) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(192) %arg2, ptr noalias align 128 dereferenceable(1) %arg3) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.43.5.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_or_fusion.1.in_bounds-true, label %loop_or_fusion.1.in_bounds-after

loop_or_fusion.1.in_bounds-after:                 ; preds = %reduce.43.5.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_or_fusion.1.in_bounds-true:                  ; preds = %entry
  %4 = load i8, ptr %arg0, align 1, !invariant.load !297
  %constant_1729_2 = load double, ptr @537, align 8
  store double %constant_1729_2, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.43.5.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.43.5.inner.loop_header.reduction_dim.0

reduce.43.5.inner.loop_header.reduction_dim.0:    ; preds = %reduce.43.5.inner.loop_body.reduction_dim.0, %loop_or_fusion.1.in_bounds-true
  %reduce.43.5.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.43.5.inner.invar_address.reduction_dim.0, align 4
  %5 = icmp uge i32 %reduce.43.5.inner.indvar.reduction_dim.0, 24
  br i1 %5, label %reduce.43.5.inner.loop_exit.reduction_dim.0, label %reduce.43.5.inner.loop_body.reduction_dim.0

reduce.43.5.inner.loop_body.reduction_dim.0:      ; preds = %reduce.43.5.inner.loop_header.reduction_dim.0
  %6 = load double, ptr %accumulator_0, align 8
  %7 = getelementptr inbounds [24 x double], ptr %arg2, i32 0, i32 %reduce.43.5.inner.indvar.reduction_dim.0
  %8 = load double, ptr %7, align 8, !invariant.load !297
  store double %6, ptr %parameter_buffer, align 8
  store double %8, ptr %parameter_buffer1, align 8
  call void @scalar_add_computation_557ffb1ca6b0_c5d0f531a335066f(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %9 = load double, ptr %return_buffer, align 8
  store double %9, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.43.5.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.43.5.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.43.5.inner.loop_header.reduction_dim.0

reduce.43.5.inner.loop_exit.reduction_dim.0:      ; preds = %reduce.43.5.inner.loop_header.reduction_dim.0
  %10 = load double, ptr %accumulator_0, align 8
  %constant_1729_22 = load double, ptr @537, align 8
  %compare.660.5 = fcmp ole double %10, %constant_1729_22
  %11 = zext i1 %compare.660.5 to i8
  %12 = load i8, ptr %arg1, align 1, !invariant.load !297
  %13 = or i8 %11, %12
  %14 = or i8 %4, %13
  store i8 %14, ptr %arg3, align 1
  br label %loop_or_fusion.1.in_bounds-after
}

define void @loop_divide_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_divide_fusion.in_bounds-true, label %loop_divide_fusion.in_bounds-after

loop_divide_fusion.in_bounds-after:               ; preds = %loop_divide_fusion.in_bounds-true, %entry
  ret void

loop_divide_fusion.in_bounds-true:                ; preds = %entry
  %4 = load double, ptr %arg1, align 8, !invariant.load !297
  %5 = call double @__nv_exp(double %4)
  %6 = load i64, ptr %arg0, align 8, !invariant.load !297
  %7 = sitofp i64 %6 to double
  %divide.597.1 = fdiv double %5, %7
  store double %divide.597.1, ptr %arg2, align 8
  br label %loop_divide_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_110(ptr noalias align 128 dereferenceable(10) %arg0, ptr noalias align 128 dereferenceable(1) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.3319 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1786_67 = load i64, ptr @539, align 8
  %0 = icmp slt i64 %param_2.3319, %constant_1786_67
  %1 = zext i1 %0 to i8
  %param_2.33191 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1785_26 = load i64, ptr @538, align 8
  %2 = add i64 %param_2.33191, %constant_1785_26
  %param_2.33192 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.33192
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 9, %6
  %8 = select i1 %7, i64 9, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.1448.1.in_bounds-true, label %dynamic-update-slice.1448.1.in_bounds-after

dynamic-update-slice.1448.1.in_bounds-after:      ; preds = %dynamic-update-slice.1448.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1448.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %param_1.4292 = load i8, ptr %arg1, align 1, !invariant.load !297
  %15 = getelementptr inbounds [10 x i8], ptr %arg0, i64 0, i64 %14
  store i8 %param_1.4292, ptr %15, align 1
  br label %dynamic-update-slice.1448.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_70(ptr noalias align 128 dereferenceable(80) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.3403 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1786_71 = load i64, ptr @541, align 8
  %0 = icmp slt i64 %param_2.3403, %constant_1786_71
  %1 = zext i1 %0 to i8
  %param_2.34031 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1785_66 = load i64, ptr @540, align 8
  %2 = add i64 %param_2.34031, %constant_1785_66
  %param_2.34032 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.34032
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 9, %6
  %8 = select i1 %7, i64 9, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.1488.1.in_bounds-true, label %dynamic-update-slice.1488.1.in_bounds-after

dynamic-update-slice.1488.1.in_bounds-after:      ; preds = %dynamic-update-slice.1488.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1488.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %param_1.4372 = load i64, ptr %arg1, align 8, !invariant.load !297
  %15 = getelementptr inbounds [10 x i64], ptr %arg0, i64 0, i64 %14
  store i64 %param_1.4372, ptr %15, align 8
  br label %dynamic-update-slice.1488.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_68(ptr noalias align 128 dereferenceable(80) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.3409 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1786_73 = load i64, ptr @543, align 8
  %0 = icmp slt i64 %param_2.3409, %constant_1786_73
  %1 = zext i1 %0 to i8
  %param_2.34091 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1785_68 = load i64, ptr @542, align 8
  %2 = add i64 %param_2.34091, %constant_1785_68
  %param_2.34092 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.34092
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 9, %6
  %8 = select i1 %7, i64 9, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.1490.1.in_bounds-true, label %dynamic-update-slice.1490.1.in_bounds-after

dynamic-update-slice.1490.1.in_bounds-after:      ; preds = %dynamic-update-slice.1490.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1490.1.in_bounds-true:       ; preds = %entry
  %14 = add i64 %8, %12
  %param_1.4376 = load double, ptr %arg1, align 8, !invariant.load !297
  %15 = getelementptr inbounds [10 x double], ptr %arg0, i64 0, i64 %14
  store double %param_1.4376, ptr %15, align 8
  br label %dynamic-update-slice.1490.1.in_bounds-after
}

define void @loop_add_fusion_1(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
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
  %4 = load i64, ptr %arg0, align 8, !invariant.load !297
  %constant_9007_1 = load i64, ptr @544, align 8
  %5 = add i64 %4, %constant_9007_1
  store i64 %5, ptr %arg1, align 8
  br label %loop_add_fusion.1.in_bounds-after
}

define void @loop_add_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %4 = load i64, ptr %arg2, align 8, !invariant.load !297
  %5 = sitofp i64 %4 to double
  %constant_9010_1 = load double, ptr @545, align 8
  %6 = call double @__nv_pow(double %5, double %constant_9010_1)
  %7 = load double, ptr %arg1, align 8, !invariant.load !297
  %multiply.2774.1 = fmul double %6, %7
  %constant_9009_2 = load double, ptr @546, align 8
  %subtract.211.1 = fsub double %constant_9009_2, %6
  %8 = load double, ptr %arg0, align 8, !invariant.load !297
  %multiply.2775.1 = fmul double %subtract.211.1, %8
  %add.3607.1 = fadd double %multiply.2774.1, %multiply.2775.1
  store double %add.3607.1, ptr %arg3, align 8
  br label %loop_add_fusion.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_pow(double, double) #2

define void @loop_add_exponential_subtract_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_exponential_subtract_fusion.in_bounds-true, label %loop_add_exponential_subtract_fusion.in_bounds-after

loop_add_exponential_subtract_fusion.in_bounds-after: ; preds = %loop_add_exponential_subtract_fusion.in_bounds-true, %entry
  ret void

loop_add_exponential_subtract_fusion.in_bounds-true: ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !297
  %5 = load i64, ptr %arg1, align 8, !invariant.load !297
  %6 = sitofp i64 %5 to double
  %7 = call double @__nv_sqrt(double %6)
  %constant_993_1_clone_1 = load double, ptr @550, align 8
  %multiply.2771.1.clone.1 = fmul double %7, %constant_993_1_clone_1
  %constant_9009_1_clone_1 = load double, ptr @549, align 8
  %constant_9009_1_clone_11 = load double, ptr @549, align 8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_9011_1_clone_1 = load i64, ptr @547, align 8
  %9 = add i64 %8, %constant_9011_1_clone_1
  %10 = sitofp i64 %9 to double
  %divide.563.1.clone.1 = fdiv double %constant_9009_1_clone_11, %10
  %subtract.208.1.clone.1 = fsub double %constant_9009_1_clone_1, %divide.563.1.clone.1
  %11 = load double, ptr %arg3, align 8, !invariant.load !297
  %multiply.2772.1.clone.1 = fmul double %subtract.208.1.clone.1, %11
  %constant_9012_1_clone_1 = load double, ptr @548, align 8
  %12 = load double, ptr %arg2, align 8, !invariant.load !297
  %subtract.209.1.clone.1 = fsub double %constant_9012_1_clone_1, %12
  %divide.564.1.clone.1 = fdiv double %subtract.209.1.clone.1, %10
  %add.3606.1.clone.1 = fadd double %multiply.2772.1.clone.1, %divide.564.1.clone.1
  %multiply.2773.1.clone.1 = fmul double %multiply.2771.1.clone.1, %add.3606.1.clone.1
  %subtract.210.1.clone.1 = fsub double %4, %multiply.2773.1.clone.1
  %13 = call double @__nv_exp(double %subtract.210.1.clone.1)
  %14 = insertvalue { double, double, double } undef, double %13, 0
  %15 = insertvalue { double, double, double } %14, double %subtract.210.1.clone.1, 1
  %16 = insertvalue { double, double, double } %15, double %add.3606.1.clone.1, 2
  %17 = extractvalue { double, double, double } %16, 0
  store double %17, ptr %arg4, align 8
  %18 = extractvalue { double, double, double } %16, 1
  store double %18, ptr %arg5, align 8
  %19 = extractvalue { double, double, double } %16, 2
  store double %19, ptr %arg6, align 8
  br label %loop_add_exponential_subtract_fusion.in_bounds-after
}

define void @loop_concatenate_fusion(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(192) %arg7, ptr noalias align 128 dereferenceable(8) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %2 = mul nuw nsw i32 %0, 24
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 24
  br i1 %4, label %loop_concatenate_fusion.in_bounds-true, label %loop_concatenate_fusion.in_bounds-after

loop_concatenate_fusion.in_bounds-after:          ; preds = %concatenate.36.8.merge, %entry
  ret void

loop_concatenate_fusion.in_bounds-true:           ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8
  br label %concatenate.pivot.12.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %8 = phi i32 [ 0, %concatenate.pivot.0. ]
  %9 = sub nsw i32 %3, %8
  %10 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %9
  %11 = load double, ptr %10, align 8, !invariant.load !297
  br label %concatenate.36.8.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.4.1
  %12 = phi i32 [ 4, %concatenate.pivot.4.1 ]
  %13 = sub nsw i32 %3, %12
  %14 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %13
  %15 = load double, ptr %14, align 8, !invariant.load !297
  br label %concatenate.36.8.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.8.2
  %16 = phi i32 [ 8, %concatenate.pivot.8.2 ]
  %17 = sub nsw i32 %3, %16
  %18 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %17
  %19 = load double, ptr %18, align 8, !invariant.load !297
  br label %concatenate.36.8.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.12.3
  %20 = phi i32 [ 12, %concatenate.pivot.12.3 ]
  %21 = sub nsw i32 %3, %20
  %22 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %21
  %23 = load double, ptr %22, align 8, !invariant.load !297
  br label %concatenate.36.8.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.16.4
  %24 = phi i32 [ 16, %concatenate.pivot.16.4 ]
  %25 = sub nsw i32 %3, %24
  %26 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %25
  %27 = load double, ptr %26, align 8, !invariant.load !297
  br label %concatenate.36.8.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.20.5
  %28 = phi i32 [ 20, %concatenate.pivot.20.5 ]
  %29 = sub nsw i32 %3, %28
  %30 = getelementptr inbounds [4 x double], ptr %arg6, i32 0, i32 %29
  %31 = load double, ptr %30, align 8, !invariant.load !297
  br label %concatenate.36.8.merge

concatenate.pivot.12.:                            ; preds = %loop_concatenate_fusion.in_bounds-true
  %32 = icmp ult i32 %3, 12
  br i1 %32, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %concatenate.pivot.12.
  %33 = icmp ult i32 %3, 4
  br i1 %33, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id0

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %34 = icmp ult i32 %3, 8
  br i1 %34, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id1

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id2

concatenate.pivot.16.:                            ; preds = %concatenate.pivot.12.
  %35 = icmp ult i32 %3, 16
  br i1 %35, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id3

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %36 = icmp ult i32 %3, 20
  br i1 %36, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id4

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id5

concatenate.36.8.merge:                           ; preds = %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %37 = phi double [ %11, %concat_index_from_operand_id0 ], [ %15, %concat_index_from_operand_id1 ], [ %19, %concat_index_from_operand_id2 ], [ %23, %concat_index_from_operand_id3 ], [ %27, %concat_index_from_operand_id4 ], [ %31, %concat_index_from_operand_id5 ]
  %38 = getelementptr double, ptr %arg7, i32 %linear_index
  %39 = getelementptr inbounds double, ptr %38, i32 0
  %40 = load double, ptr %39, align 8
  %subtract.216.3 = fsub double %37, %40
  %41 = getelementptr double, ptr %arg7, i32 %linear_index
  %42 = getelementptr inbounds double, ptr %41, i32 0
  %43 = load double, ptr %42, align 8
  %44 = load i64, ptr %arg8, align 8, !invariant.load !297
  %45 = sitofp i64 %44 to double
  %divide.567.3.clone.1 = fdiv double %subtract.216.3, %45
  %add.3614.1.clone.1 = fadd double %43, %divide.567.3.clone.1
  %subtract.217.5 = fsub double %37, %add.3614.1.clone.1
  %multiply.2781.3 = fmul double %subtract.216.3, %subtract.217.5
  %add.3615.1 = fadd double %7, %multiply.2781.3
  %46 = insertvalue { double, double } undef, double %add.3615.1, 0
  %47 = insertvalue { double, double } %46, double %add.3614.1.clone.1, 1
  %48 = extractvalue { double, double } %47, 0
  %49 = getelementptr double, ptr %arg0, i32 %linear_index
  %50 = getelementptr inbounds double, ptr %49, i32 0
  store double %48, ptr %50, align 8
  %51 = extractvalue { double, double } %47, 1
  %52 = getelementptr double, ptr %arg7, i32 %linear_index
  %53 = getelementptr inbounds double, ptr %52, i32 0
  store double %51, ptr %53, align 8
  br label %loop_concatenate_fusion.in_bounds-after
}

define void @loop_exponential_log_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !292
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_exponential_log_fusion.in_bounds-true, label %loop_exponential_log_fusion.in_bounds-after

loop_exponential_log_fusion.in_bounds-after:      ; preds = %loop_exponential_log_fusion.in_bounds-true, %entry
  ret void

loop_exponential_log_fusion.in_bounds-true:       ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !297
  %5 = call double @__nv_exp(double %4)
  %constant_9117_1 = load double, ptr @551, align 8
  %multiply.2782.1 = fmul double %5, %constant_9117_1
  %6 = call double @__nv_log(double %multiply.2782.1)
  %7 = insertvalue { double, double } undef, double %6, 0
  %8 = insertvalue { double, double } %7, double %5, 1
  %9 = extractvalue { double, double } %8, 0
  store double %9, ptr %arg1, align 8
  %10 = extractvalue { double, double } %8, 1
  store double %10, ptr %arg2, align 8
  br label %loop_exponential_log_fusion.in_bounds-after
}

define void @loop_add_fusion_5(ptr noalias align 128 dereferenceable(192) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(192) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %2 = mul nuw nsw i32 %0, 24
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 24
  br i1 %4, label %loop_add_fusion.5.in_bounds-true, label %loop_add_fusion.5.in_bounds-after

loop_add_fusion.5.in_bounds-after:                ; preds = %loop_add_fusion.5.in_bounds-true, %entry
  ret void

loop_add_fusion.5.in_bounds-true:                 ; preds = %entry
  %5 = load i64, ptr %arg1, align 8, !invariant.load !297
  %6 = sitofp i64 %5 to double
  %7 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_9120_1 = load i64, ptr @553, align 8
  %8 = add i64 %7, %constant_9120_1
  %9 = sitofp i64 %8 to double
  %divide.568.1 = fdiv double %6, %9
  %10 = getelementptr double, ptr %arg0, i32 %linear_index
  %11 = getelementptr inbounds double, ptr %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !297
  %13 = load i64, ptr %arg1, align 8, !invariant.load !297
  %constant_1163_1 = load i64, ptr @555, align 8
  %14 = add i64 %13, %constant_1163_1
  %15 = sitofp i64 %14 to double
  %divide.569.3 = fdiv double %12, %15
  %multiply.2783.3 = fmul double %divide.568.1, %divide.569.3
  %constant_9119_1 = load double, ptr @554, align 8
  %divide.570.1 = fdiv double %constant_9119_1, %9
  %constant_9118_1 = load double, ptr @552, align 8
  %multiply.2785.1 = fmul double %divide.570.1, %constant_9118_1
  %add.3618.1 = fadd double %multiply.2783.3, %multiply.2785.1
  %16 = getelementptr double, ptr %arg2, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  store double %add.3618.1, ptr %17, align 8
  br label %loop_add_fusion.5.in_bounds-after
}

define void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(192) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %2 = mul nuw nsw i32 %0, 24
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 24
  br i1 %4, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %constant_9114_1 = load double, ptr @556, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_9114_1, ptr %6, align 8
  br label %loop_broadcast_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_60(ptr noalias align 128 dereferenceable(1920) %arg0, ptr noalias align 128 dereferenceable(192) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.3450 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1786_16 = load i64, ptr @558, align 8
  %0 = icmp slt i64 %param_2.3450, %constant_1786_16
  %1 = zext i1 %0 to i8
  %param_2.34501 = load i64, ptr %arg2, align 8, !invariant.load !297
  %constant_1785_76 = load i64, ptr @557, align 8
  %2 = add i64 %param_2.34501, %constant_1785_76
  %param_2.34502 = load i64, ptr %arg2, align 8, !invariant.load !297
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.34502
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 9, %6
  %8 = select i1 %7, i64 9, i64 %6
  %constant_1786_163 = load i64, ptr @558, align 8
  %9 = icmp sge i64 0, %constant_1786_163
  %10 = select i1 %9, i64 0, i64 %constant_1786_163
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !292
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 24
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 24
  %18 = udiv i64 %linear_index0, 24
  %19 = icmp ult i64 %linear_index, 24
  br i1 %19, label %dynamic-update-slice.1498.1.in_bounds-true, label %dynamic-update-slice.1498.1.in_bounds-after

dynamic-update-slice.1498.1.in_bounds-after:      ; preds = %dynamic-update-slice.1498.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.1498.1.in_bounds-true:       ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.4412 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.44124 = load double, ptr %param_1.4412, align 8, !invariant.load !297
  %23 = getelementptr inbounds [10 x [24 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.44124, ptr %23, align 8
  br label %dynamic-update-slice.1498.1.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291}

!0 = !{ptr @loop_broadcast_fusion_20, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion_20, !"reqntidx", i32 10}
!2 = !{ptr @loop_broadcast_fusion_19, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion_19, !"reqntidx", i32 10}
!4 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!6 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!7 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!8 = !{ptr @wrapped_transpose_1, !"kernel", i32 1}
!9 = !{ptr @wrapped_transpose_1, !"reqntidx", i32 128}
!10 = !{ptr @loop_compare_fusion_5, !"kernel", i32 1}
!11 = !{ptr @loop_compare_fusion_5, !"reqntidx", i32 1}
!12 = !{ptr @loop_clamp_convert_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_clamp_convert_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_add_slice_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_add_slice_fusion, !"reqntidx", i32 2}
!16 = !{ptr @loop_multiply_fusion_2, !"kernel", i32 1}
!17 = !{ptr @loop_multiply_fusion_2, !"reqntidx", i32 24}
!18 = !{ptr @loop_add_fusion_13, !"kernel", i32 1}
!19 = !{ptr @loop_add_fusion_13, !"reqntidx", i32 1}
!20 = !{ptr @wrapped_slice_5, !"kernel", i32 1}
!21 = !{ptr @wrapped_slice_5, !"reqntidx", i32 4}
!22 = !{ptr @wrapped_slice_4, !"kernel", i32 1}
!23 = !{ptr @wrapped_slice_4, !"reqntidx", i32 4}
!24 = !{ptr @wrapped_slice_3, !"kernel", i32 1}
!25 = !{ptr @wrapped_slice_3, !"reqntidx", i32 4}
!26 = !{ptr @wrapped_slice_2, !"kernel", i32 1}
!27 = !{ptr @wrapped_slice_2, !"reqntidx", i32 4}
!28 = !{ptr @wrapped_slice, !"kernel", i32 1}
!29 = !{ptr @wrapped_slice, !"reqntidx", i32 4}
!30 = !{ptr @wrapped_slice_1, !"kernel", i32 1}
!31 = !{ptr @wrapped_slice_1, !"reqntidx", i32 4}
!32 = !{ptr @loop_dynamic_update_slice_fusion_112, !"kernel", i32 1}
!33 = !{ptr @loop_dynamic_update_slice_fusion_112, !"reqntidx", i32 4}
!34 = !{ptr @loop_broadcast_fusion_18, !"kernel", i32 1}
!35 = !{ptr @loop_broadcast_fusion_18, !"reqntidx", i32 240}
!36 = !{ptr @loop_and_fusion_2, !"kernel", i32 1}
!37 = !{ptr @loop_and_fusion_2, !"reqntidx", i32 1}
!38 = !{ptr @loop_select_fusion_5, !"kernel", i32 1}
!39 = !{ptr @loop_select_fusion_5, !"reqntidx", i32 1}
!40 = !{ptr @loop_add_fusion_11, !"kernel", i32 1}
!41 = !{ptr @loop_add_fusion_11, !"reqntidx", i32 1}
!42 = !{ptr @loop_add_fusion_12, !"kernel", i32 1}
!43 = !{ptr @loop_add_fusion_12, !"reqntidx", i32 1}
!44 = !{ptr @loop_add_fusion_10, !"kernel", i32 1}
!45 = !{ptr @loop_add_fusion_10, !"reqntidx", i32 3}
!46 = !{ptr @loop_slice_fusion, !"kernel", i32 1}
!47 = !{ptr @loop_slice_fusion, !"reqntidx", i32 6}
!48 = !{ptr @loop_convert_select_fusion, !"kernel", i32 1}
!49 = !{ptr @loop_convert_select_fusion, !"reqntidx", i32 1}
!50 = !{ptr @loop_add_minimum_select_fusion_1, !"kernel", i32 1}
!51 = !{ptr @loop_add_minimum_select_fusion_1, !"reqntidx", i32 1}
!52 = !{ptr @loop_and_fusion_1, !"kernel", i32 1}
!53 = !{ptr @loop_and_fusion_1, !"reqntidx", i32 1}
!54 = !{ptr @loop_convert_fusion_4, !"kernel", i32 1}
!55 = !{ptr @loop_convert_fusion_4, !"reqntidx", i32 1}
!56 = !{ptr @loop_convert_fusion_3, !"kernel", i32 1}
!57 = !{ptr @loop_convert_fusion_3, !"reqntidx", i32 1}
!58 = !{ptr @input_concatenate_fusion_1, !"kernel", i32 1}
!59 = !{ptr @input_concatenate_fusion_1, !"reqntidx", i32 1}
!60 = !{ptr @loop_broadcast_fusion_10, !"kernel", i32 1}
!61 = !{ptr @loop_broadcast_fusion_10, !"reqntidx", i32 4}
!62 = !{ptr @loop_broadcast_fusion_14, !"kernel", i32 1}
!63 = !{ptr @loop_broadcast_fusion_14, !"reqntidx", i32 4}
!64 = !{ptr @loop_broadcast_fusion_4, !"kernel", i32 1}
!65 = !{ptr @loop_broadcast_fusion_4, !"reqntidx", i32 4}
!66 = !{ptr @loop_broadcast_fusion_17, !"kernel", i32 1}
!67 = !{ptr @loop_broadcast_fusion_17, !"reqntidx", i32 4}
!68 = !{ptr @loop_broadcast_fusion_13, !"kernel", i32 1}
!69 = !{ptr @loop_broadcast_fusion_13, !"reqntidx", i32 4}
!70 = !{ptr @loop_broadcast_fusion_8, !"kernel", i32 1}
!71 = !{ptr @loop_broadcast_fusion_8, !"reqntidx", i32 4}
!72 = !{ptr @loop_add_convert_fusion, !"kernel", i32 1}
!73 = !{ptr @loop_add_convert_fusion, !"reqntidx", i32 1}
!74 = !{ptr @loop_concatenate_fusion_1, !"kernel", i32 1}
!75 = !{ptr @loop_concatenate_fusion_1, !"reqntidx", i32 24}
!76 = !{ptr @loop_add_exponential_fusion, !"kernel", i32 1}
!77 = !{ptr @loop_add_exponential_fusion, !"reqntidx", i32 4}
!78 = !{ptr @loop_broadcast_fusion_7, !"kernel", i32 1}
!79 = !{ptr @loop_broadcast_fusion_7, !"reqntidx", i32 768}
!80 = !{ptr @loop_broadcast_fusion_6, !"kernel", i32 1}
!81 = !{ptr @loop_broadcast_fusion_6, !"reqntidx", i32 768}
!82 = !{ptr @loop_broadcast_fusion_15, !"kernel", i32 1}
!83 = !{ptr @loop_broadcast_fusion_15, !"reqntidx", i32 192}
!84 = !{ptr @loop_broadcast_fusion_12, !"kernel", i32 1}
!85 = !{ptr @loop_broadcast_fusion_12, !"reqntidx", i32 192}
!86 = !{ptr @loop_broadcast_fusion_16, !"kernel", i32 1}
!87 = !{ptr @loop_broadcast_fusion_16, !"reqntidx", i32 768}
!88 = !{ptr @loop_broadcast_fusion_11, !"kernel", i32 1}
!89 = !{ptr @loop_broadcast_fusion_11, !"reqntidx", i32 768}
!90 = !{ptr @loop_convert_fusion_2, !"kernel", i32 1}
!91 = !{ptr @loop_convert_fusion_2, !"reqntidx", i32 128}
!92 = !{ptr @loop_compare_fusion_2, !"kernel", i32 1}
!93 = !{ptr @loop_compare_fusion_2, !"reqntidx", i32 1}
!94 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 4}
!96 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 4}
!98 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 4}
!100 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 1}
!102 = !{ptr @loop_dynamic_update_slice_fusion_55, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_55, !"reqntidx", i32 1}
!104 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 4}
!106 = !{ptr @loop_dynamic_update_slice_fusion_44, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_44, !"reqntidx", i32 4}
!108 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 4}
!110 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 4}
!112 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 4}
!114 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 4}
!116 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 4}
!118 = !{ptr @loop_dynamic_update_slice_fusion_32, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_32, !"reqntidx", i32 4}
!120 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!121 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 4}
!122 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 4}
!124 = !{ptr @loop_add_divide_exponential_select_fusion, !"kernel", i32 1}
!125 = !{ptr @loop_add_divide_exponential_select_fusion, !"reqntidx", i32 4}
!126 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 4}
!128 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!129 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 4}
!130 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 4}
!132 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 4}
!134 = !{ptr @loop_dynamic_update_slice_fusion_31, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_31, !"reqntidx", i32 4}
!136 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 4}
!138 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 4}
!140 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 4}
!142 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 4}
!144 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 4}
!146 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 4}
!148 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!149 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 4}
!150 = !{ptr @loop_dynamic_update_slice_fusion_24, !"kernel", i32 1}
!151 = !{ptr @loop_dynamic_update_slice_fusion_24, !"reqntidx", i32 4}
!152 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!153 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 4}
!154 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!155 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 4}
!156 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!157 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 4}
!158 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!159 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 4}
!160 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!161 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 4}
!162 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 4}
!164 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 4}
!166 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 4}
!168 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 4}
!170 = !{ptr @loop_dynamic_update_slice_fusion_33, !"kernel", i32 1}
!171 = !{ptr @loop_dynamic_update_slice_fusion_33, !"reqntidx", i32 4}
!172 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!173 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 4}
!174 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!175 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 4}
!176 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!177 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 4}
!178 = !{ptr @loop_dynamic_update_slice_fusion_36, !"kernel", i32 1}
!179 = !{ptr @loop_dynamic_update_slice_fusion_36, !"reqntidx", i32 4}
!180 = !{ptr @loop_dynamic_update_slice_fusion_28, !"kernel", i32 1}
!181 = !{ptr @loop_dynamic_update_slice_fusion_28, !"reqntidx", i32 4}
!182 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!183 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 128}
!184 = !{ptr @loop_exponential_fusion, !"kernel", i32 1}
!185 = !{ptr @loop_exponential_fusion, !"reqntidx", i32 128}
!186 = !{ptr @loop_broadcast_fusion_9, !"kernel", i32 1}
!187 = !{ptr @loop_broadcast_fusion_9, !"reqntidx", i32 1024}
!188 = !{ptr @input_scatter_fusion, !"kernel", i32 1}
!189 = !{ptr @input_scatter_fusion, !"reqntidx", i32 128}
!190 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!191 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 128}
!192 = !{ptr @loop_select_slice_fusion, !"kernel", i32 1}
!193 = !{ptr @loop_select_slice_fusion, !"reqntidx", i32 128}
!194 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!195 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 1024}
!196 = !{ptr @input_reduce_fusion_2, !"kernel", i32 1}
!197 = !{ptr @input_reduce_fusion_2, !"reqntidx", i32 64}
!198 = !{ptr @input_add_reduce_fusion_3, !"kernel", i32 1}
!199 = !{ptr @input_add_reduce_fusion_3, !"reqntidx", i32 32}
!200 = !{ptr @input_reduce_fusion_1, !"kernel", i32 1}
!201 = !{ptr @input_reduce_fusion_1, !"reqntidx", i32 1024}
!202 = !{ptr @input_add_reduce_fusion_5, !"kernel", i32 1}
!203 = !{ptr @input_add_reduce_fusion_5, !"reqntidx", i32 32}
!204 = !{ptr @loop_dynamic_slice_fusion_2, !"kernel", i32 1}
!205 = !{ptr @loop_dynamic_slice_fusion_2, !"reqntidx", i32 1}
!206 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!207 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!208 = !{ptr @loop_dynamic_slice_fusion_4, !"kernel", i32 1}
!209 = !{ptr @loop_dynamic_slice_fusion_4, !"reqntidx", i32 4}
!210 = !{ptr @loop_dynamic_slice_fusion_3, !"kernel", i32 1}
!211 = !{ptr @loop_dynamic_slice_fusion_3, !"reqntidx", i32 4}
!212 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!213 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 4}
!214 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!215 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 4}
!216 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!217 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 4}
!218 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!219 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 4}
!220 = !{ptr @input_add_reduce_fusion_2, !"kernel", i32 1}
!221 = !{ptr @input_add_reduce_fusion_2, !"reqntidx", i32 32}
!222 = !{ptr @input_add_reduce_fusion_1, !"kernel", i32 1}
!223 = !{ptr @input_add_reduce_fusion_1, !"reqntidx", i32 32}
!224 = !{ptr @input_add_reduce_fusion_4, !"kernel", i32 1}
!225 = !{ptr @input_add_reduce_fusion_4, !"reqntidx", i32 32}
!226 = !{ptr @input_add_reduce_fusion, !"kernel", i32 1}
!227 = !{ptr @input_add_reduce_fusion, !"reqntidx", i32 32}
!228 = !{ptr @wrapped_concatenate, !"kernel", i32 1}
!229 = !{ptr @wrapped_concatenate, !"reqntidx", i32 24}
!230 = !{ptr @loop_add_minimum_select_fusion, !"kernel", i32 1}
!231 = !{ptr @loop_add_minimum_select_fusion, !"reqntidx", i32 1}
!232 = !{ptr @loop_compare_fusion_3, !"kernel", i32 1}
!233 = !{ptr @loop_compare_fusion_3, !"reqntidx", i32 1}
!234 = !{ptr @loop_select_fusion_3, !"kernel", i32 1}
!235 = !{ptr @loop_select_fusion_3, !"reqntidx", i32 1}
!236 = !{ptr @loop_select_fusion_4, !"kernel", i32 1}
!237 = !{ptr @loop_select_fusion_4, !"reqntidx", i32 1}
!238 = !{ptr @loop_convert_fusion_1, !"kernel", i32 1}
!239 = !{ptr @loop_convert_fusion_1, !"reqntidx", i32 1}
!240 = !{ptr @wrapped_add, !"kernel", i32 1}
!241 = !{ptr @wrapped_add, !"reqntidx", i32 4}
!242 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!243 = !{ptr @input_reduce_fusion, !"reqntidx", i32 32}
!244 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!245 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 24}
!246 = !{ptr @loop_and_fusion, !"kernel", i32 1}
!247 = !{ptr @loop_and_fusion, !"reqntidx", i32 1}
!248 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!249 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 24}
!250 = !{ptr @loop_add_fusion_7, !"kernel", i32 1}
!251 = !{ptr @loop_add_fusion_7, !"reqntidx", i32 1}
!252 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!253 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!254 = !{ptr @loop_or_fusion, !"kernel", i32 1}
!255 = !{ptr @loop_or_fusion, !"reqntidx", i32 1}
!256 = !{ptr @loop_convert_fusion_5, !"kernel", i32 1}
!257 = !{ptr @loop_convert_fusion_5, !"reqntidx", i32 1}
!258 = !{ptr @loop_convert_fusion, !"kernel", i32 1}
!259 = !{ptr @loop_convert_fusion, !"reqntidx", i32 1}
!260 = !{ptr @wrapped_add_12, !"kernel", i32 1}
!261 = !{ptr @wrapped_add_12, !"reqntidx", i32 1}
!262 = !{ptr @wrapped_add_11, !"kernel", i32 1}
!263 = !{ptr @wrapped_add_11, !"reqntidx", i32 4}
!264 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!265 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 24}
!266 = !{ptr @loop_or_fusion_1, !"kernel", i32 1}
!267 = !{ptr @loop_or_fusion_1, !"reqntidx", i32 1}
!268 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!269 = !{ptr @loop_divide_fusion, !"reqntidx", i32 1}
!270 = !{ptr @loop_dynamic_update_slice_fusion_110, !"kernel", i32 1}
!271 = !{ptr @loop_dynamic_update_slice_fusion_110, !"reqntidx", i32 1}
!272 = !{ptr @loop_dynamic_update_slice_fusion_70, !"kernel", i32 1}
!273 = !{ptr @loop_dynamic_update_slice_fusion_70, !"reqntidx", i32 1}
!274 = !{ptr @loop_dynamic_update_slice_fusion_68, !"kernel", i32 1}
!275 = !{ptr @loop_dynamic_update_slice_fusion_68, !"reqntidx", i32 1}
!276 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!277 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!278 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!279 = !{ptr @loop_add_fusion, !"reqntidx", i32 1}
!280 = !{ptr @loop_add_exponential_subtract_fusion, !"kernel", i32 1}
!281 = !{ptr @loop_add_exponential_subtract_fusion, !"reqntidx", i32 1}
!282 = !{ptr @loop_concatenate_fusion, !"kernel", i32 1}
!283 = !{ptr @loop_concatenate_fusion, !"reqntidx", i32 24}
!284 = !{ptr @loop_exponential_log_fusion, !"kernel", i32 1}
!285 = !{ptr @loop_exponential_log_fusion, !"reqntidx", i32 1}
!286 = !{ptr @loop_add_fusion_5, !"kernel", i32 1}
!287 = !{ptr @loop_add_fusion_5, !"reqntidx", i32 24}
!288 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!289 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 24}
!290 = !{ptr @loop_dynamic_update_slice_fusion_60, !"kernel", i32 1}
!291 = !{ptr @loop_dynamic_update_slice_fusion_60, !"reqntidx", i32 24}
!292 = !{i32 0, i32 1}
!293 = !{i32 0, i32 10}
!294 = !{i32 0, i32 3}
!295 = !{i32 0, i32 128}
!296 = !{i32 0, i32 6}
!297 = !{}
!298 = !{i32 0, i32 2}
!299 = !{i32 0, i32 24}
!300 = !{i32 0, i32 4}
!301 = !{i32 0, i32 240}
!302 = !{i32 0, i32 768}
!303 = !{i32 0, i32 192}
!304 = !{i32 0, i32 12}
!305 = !{i32 0, i32 1024}
!306 = distinct !{!306, !307, !308}
!307 = !{!"llvm.loop.vectorize.enable", i1 false}
!308 = !{!"llvm.loop.unroll.full"}
!309 = distinct !{!309, !307}
!310 = !{i32 0, i32 64}
!311 = distinct !{!311, !307}
!312 = distinct !{!312, !307, !308}
!313 = distinct !{!313, !307, !308}
!314 = distinct !{!314, !307}
!315 = !{i32 0, i32 32}
!316 = distinct !{!316, !307, !308}
!317 = distinct !{!317, !307}
!318 = distinct !{!318, !307, !308}
!319 = distinct !{!319, !307}
!320 = distinct !{!320, !307, !308}
!321 = distinct !{!321, !307}
!322 = distinct !{!322, !307, !308}
!323 = distinct !{!323, !307}
!324 = distinct !{!324, !307, !308}
!325 = distinct !{!325, !307}
!326 = distinct !{!326, !307, !308}
!327 = distinct !{!327, !307}
!328 = distinct !{!328, !307, !308}
!329 = distinct !{!329, !307}
!330 = distinct !{!330, !307, !308}
!331 = distinct !{!331, !307}
