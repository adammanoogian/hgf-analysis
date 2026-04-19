; ModuleID = 'jit_concatenate'
source_filename = "jit_concatenate"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_concatenate(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg2) local_unnamed_addr #0 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr double, ptr addrspace(1) %arg08, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !5
  %8 = zext nneg i16 %3 to i64
  %9 = zext nneg i16 %.decomposed to i64
  %10 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr addrspace(1) %arg212, i64 0, i64 %8, i64 %9, i64 0
  %11 = getelementptr double, ptr addrspace(1) %arg110, i64 %5
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !5
  %13 = insertelement <2 x double> poison, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  store <2 x double> %14, ptr addrspace(1) %10, align 16
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

!0 = !{ptr @wrapped_concatenate, !"kernel", i32 1}
!1 = !{ptr @wrapped_concatenate, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 6}
!4 = !{i32 0, i32 128}
!5 = !{}
