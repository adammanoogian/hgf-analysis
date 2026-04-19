; ModuleID = 'jit_pad'
source_filename = "jit_pad"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @wrapped_pad(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4608) %arg2) local_unnamed_addr #0 {
entry:
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 576
  br i1 %3, label %wrapped_pad.in_bounds-true, label %wrapped_pad.in_bounds-after

wrapped_pad.in_bounds-after:                      ; preds = %wrapped_pad.in_bounds-true, %entry
  ret void

wrapped_pad.in_bounds-true:                       ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 24
  %5 = mul i16 %4, 24
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext12 = zext nneg i16 %.decomposed to i64
  %6 = icmp ugt i16 %.decomposed, 19
  %7 = zext nneg i16 %4 to i64
  %8 = getelementptr [24 x [1 x [4 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 0, i64 %.zext12
  %9 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 -160
  %pad_result_addr.0.in = select i1 %6, ptr addrspace(1) %9, ptr addrspace(1) %arg115
  %pad_result_addr.0 = load double, ptr addrspace(1) %pad_result_addr.0.in, align 8, !invariant.load !5
  %10 = zext nneg i32 %linear_index to i64
  %11 = getelementptr double, ptr addrspace(1) %arg217, i64 %10
  store double %pad_result_addr.0, ptr addrspace(1) %11, align 8
  br label %wrapped_pad.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_pad, !"kernel", i32 1}
!1 = !{ptr @wrapped_pad, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 5}
!4 = !{i32 0, i32 128}
!5 = !{}
