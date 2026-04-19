; ModuleID = 'jit_transpose'
source_filename = "jit_transpose"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_transpose(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %linear_index = or disjoint i32 %1, %2
  %3 = lshr i32 %linear_index, 2
  %4 = and i32 %2, 3
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %3 to i64
  %7 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 %6, i64 0
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !5
  %9 = zext nneg i32 %linear_index to i64
  %10 = getelementptr double, ptr addrspace(1) %arg13, i64 %9
  store double %8, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!1 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 6}
!4 = !{i32 0, i32 128}
!5 = !{}
