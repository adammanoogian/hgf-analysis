; ModuleID = 'jit_transpose'
source_filename = "jit_transpose"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_transpose(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 96
  %4 = lshr i32 %linear_index, 2
  %.lhs.trunc1 = trunc nuw nsw i32 %4 to i16
  %5 = urem i16 %.lhs.trunc1, 24
  %6 = and i32 %2, 3
  %7 = zext nneg i16 %5 to i64
  %8 = zext nneg i16 %3 to i64
  %9 = zext nneg i32 %6 to i64
  %10 = getelementptr inbounds [24 x [192 x [1 x [4 x double]]]], ptr addrspace(1) %arg03, i64 0, i64 %7, i64 %8, i64 0, i64 %9
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !5
  %12 = zext nneg i32 %linear_index to i64
  %13 = getelementptr double, ptr addrspace(1) %arg15, i64 %12
  store double %11, ptr addrspace(1) %13, align 8
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
!3 = !{i32 0, i32 144}
!4 = !{i32 0, i32 128}
!5 = !{}
