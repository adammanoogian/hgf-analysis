; ModuleID = 'jit_subtract'
source_filename = "jit_subtract"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @input_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg5) local_unnamed_addr #0 {
entry:
  %arg517 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 6
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.768.1

input_slice_fusion.in_bounds-after:               ; preds = %slice0-after, %slice1-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 192
  %5 = mul i16 %4, 192
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = zext nneg i16 %4 to i64
  %7 = zext nneg i16 %.decomposed to i64
  %8 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg07, i64 0, i64 %6, i64 %7
  %9 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg19, i64 0, i64 %6, i64 %7
  br label %concatenate.merge

concatenate.pivot.768.1:                          ; preds = %entry
  %10 = add nsw i32 %linear_index, -768
  %11 = udiv i32 %10, 192
  %12 = mul i32 %11, 192
  %.decomposed6 = sub i32 %10, %12
  %13 = and i32 %11, 3
  %14 = udiv i32 %10, 768
  %15 = zext nneg i32 %14 to i64
  %16 = zext nneg i32 %13 to i64
  %17 = zext nneg i32 %.decomposed6 to i64
  %18 = getelementptr inbounds [24 x [4 x [192 x double]]], ptr addrspace(1) %arg211, i64 0, i64 %15, i64 %16, i64 %17
  %19 = getelementptr inbounds [24 x [4 x [192 x double]]], ptr addrspace(1) %arg313, i64 0, i64 %15, i64 %16, i64 %17
  br label %concatenate.merge

concatenate.merge:                                ; preds = %concatenate.pivot.768.1, %concatenate.pivot.0.
  %.sink5 = phi ptr addrspace(1) [ %19, %concatenate.pivot.768.1 ], [ %9, %concatenate.pivot.0. ]
  %.sink.in = phi ptr addrspace(1) [ %18, %concatenate.pivot.768.1 ], [ %8, %concatenate.pivot.0. ]
  %20 = icmp ult i32 %0, 6
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !5
  %21 = load double, ptr addrspace(1) %.sink5, align 8, !invariant.load !5
  %subtract.3.2 = fsub double %.sink, %21
  %22 = zext nneg i32 %linear_index to i64
  %23 = getelementptr inbounds [768 x double], ptr addrspace(1) %arg415, i64 0, i64 %22
  br i1 %20, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %24 = icmp ugt i32 %0, 5
  %25 = sext i32 %linear_index to i64
  %26 = getelementptr [18432 x double], ptr addrspace(1) %arg517, i64 0, i64 %25
  br i1 %24, label %slice1-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  store double %subtract.3.2, ptr addrspace(1) %23, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %26, i64 -6144
  store double %subtract.3.2, ptr addrspace(1) %sunkaddr, align 8
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 150}
!4 = !{i32 0, i32 128}
!5 = !{}
