; ModuleID = 'jit_exp'
source_filename = "jit_exp"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !6
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !6
  %multiply.4.1 = fmul double %3, %5
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  store double %multiply.4.1, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %1 = and i32 %0, 3
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg25, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !6
  %5 = zext nneg i32 %1 to i64
  %6 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg37, i64 0, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !6
  %multiply.5.3 = fmul double %4, %7
  %8 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg13, i64 0, i64 0, i64 %5
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !6
  %10 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !6
  %multiply.6.3 = fmul double %9, %11
  %add.1.1 = fadd double %multiply.5.3, %multiply.6.3
  %12 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  store double %add.1.1, ptr addrspace(1) %12, align 8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 4}
!2 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_fusion, !"reqntidx", i32 96}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 4}
!6 = !{}
!7 = !{i32 0, i32 96}
