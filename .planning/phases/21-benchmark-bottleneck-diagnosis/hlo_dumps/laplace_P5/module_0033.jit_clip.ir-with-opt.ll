; ModuleID = 'jit_clip'
source_filename = "jit_clip"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_minimum_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg01, align 16, !invariant.load !3
  %1 = load double, ptr addrspace(1) %arg13, align 16, !invariant.load !3
  %2 = load double, ptr addrspace(1) %arg25, align 16, !invariant.load !3
  %3 = fcmp uno double %1, 0.000000e+00
  %4 = fcmp oge double %1, %2
  %5 = or i1 %3, %4
  %maximum.1.1 = select i1 %5, double %1, double %2
  %6 = fcmp uno double %0, 0.000000e+00
  %7 = fcmp ole double %0, %maximum.1.1
  %8 = or i1 %6, %7
  %minimum.1.1 = select i1 %8, double %0, double %maximum.1.1
  store double %minimum.1.1, ptr addrspace(1) %arg37, align 128
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @loop_minimum_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_minimum_fusion, !"reqntidx", i32 1}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{}
