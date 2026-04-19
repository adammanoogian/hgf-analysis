; ModuleID = 'jit_mul'
source_filename = "jit_mul"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = and i32 %0, 3
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !4
  %5 = zext nneg i32 %1 to i64
  %6 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg13, i64 0, i64 0, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !4
  %multiply.1.1 = fmul double %4, %7
  %8 = getelementptr double, ptr addrspace(1) %arg25, i64 %2
  store double %multiply.1.1, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 96}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 96}
!4 = !{}
