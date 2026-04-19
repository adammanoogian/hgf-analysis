; ModuleID = 'jit_subtract'
source_filename = "jit_subtract"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg3) local_unnamed_addr #0 {
entry:
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 6
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.768.1

copy_fusion.in_bounds-after:                      ; preds = %slice0-after, %slice1-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 192
  %5 = mul i16 %4, 192
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = zext nneg i16 %4 to i64
  %7 = zext nneg i16 %.decomposed to i64
  %8 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr addrspace(1) %arg05, i64 0, i64 0, i64 %6, i64 %7
  br label %concatenate.1.merge

concatenate.pivot.768.1:                          ; preds = %entry
  %9 = add nsw i32 %linear_index, -768
  %10 = udiv i32 %9, 192
  %11 = mul i32 %10, 192
  %.decomposed4 = sub i32 %9, %11
  %12 = and i32 %10, 3
  %13 = udiv i32 %9, 768
  %14 = zext nneg i32 %13 to i64
  %15 = zext nneg i32 %12 to i64
  %16 = zext nneg i32 %.decomposed4 to i64
  %17 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr addrspace(1) %arg17, i64 0, i64 %14, i64 0, i64 %15, i64 %16
  br label %concatenate.1.merge

concatenate.1.merge:                              ; preds = %concatenate.pivot.768.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %8, %concatenate.pivot.0. ], [ %17, %concatenate.pivot.768.1 ]
  %18 = icmp ult i32 %0, 6
  %19 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !7
  %20 = zext nneg i32 %linear_index to i64
  %21 = getelementptr inbounds [768 x double], ptr addrspace(1) %arg29, i64 0, i64 %20
  br i1 %18, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.1.merge
  %22 = icmp ugt i32 %0, 5
  %23 = sext i32 %linear_index to i64
  %24 = getelementptr [18432 x double], ptr addrspace(1) %arg311, i64 0, i64 %23
  br i1 %22, label %slice1-true, label %copy_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.1.merge
  store double %19, ptr addrspace(1) %21, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %24, i64 -6144
  store double %19, ptr addrspace(1) %sunkaddr, align 8
  br label %copy_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @input_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg3) local_unnamed_addr #0 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
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
  %8 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr addrspace(1) %arg06, i64 0, i64 0, i64 %6, i64 %7
  br label %concatenate.merge

concatenate.pivot.768.1:                          ; preds = %entry
  %9 = add nsw i32 %linear_index, -768
  %10 = udiv i32 %9, 192
  %11 = mul i32 %10, 192
  %.decomposed5 = sub i32 %9, %11
  %12 = and i32 %10, 3
  %13 = udiv i32 %9, 768
  %14 = zext nneg i32 %13 to i64
  %15 = zext nneg i32 %12 to i64
  %16 = zext nneg i32 %.decomposed5 to i64
  %17 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr addrspace(1) %arg18, i64 0, i64 %14, i64 0, i64 %15, i64 %16
  br label %concatenate.merge

concatenate.merge:                                ; preds = %concatenate.pivot.768.1, %concatenate.pivot.0.
  %.sink4 = phi ptr addrspace(1) [ %17, %concatenate.pivot.768.1 ], [ %8, %concatenate.pivot.0. ]
  %18 = icmp ult i32 %0, 6
  %19 = load double, ptr addrspace(1) %.sink4, align 8, !invariant.load !7
  %20 = fneg double %19
  %21 = zext nneg i32 %linear_index to i64
  %22 = getelementptr inbounds [768 x double], ptr addrspace(1) %arg210, i64 0, i64 %21
  br i1 %18, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %23 = icmp ugt i32 %0, 5
  %24 = sext i32 %linear_index to i64
  %25 = getelementptr [18432 x double], ptr addrspace(1) %arg312, i64 0, i64 %24
  br i1 %23, label %slice1-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  store double %20, ptr addrspace(1) %22, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %25, i64 -6144
  store double %20, ptr addrspace(1) %sunkaddr, align 8
  br label %input_slice_fusion.in_bounds-after
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @copy_fusion, !"kernel", i32 1}
!1 = !{ptr @copy_fusion, !"reqntidx", i32 128}
!2 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!3 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 150}
!6 = !{i32 0, i32 128}
!7 = !{}
