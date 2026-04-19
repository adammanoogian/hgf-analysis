; ModuleID = 'jit__where'
source_filename = "jit__where"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture readonly align 16 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(1) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = load i8, ptr addrspace(1) %arg25, align 16, !invariant.load !4
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !4
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !4
  %7 = trunc i8 %1 to i1
  %8 = select i1 %7, double %4, double %6
  %9 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  store double %8, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_select_fusion, !"reqntidx", i32 40}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 40}
!4 = !{}
