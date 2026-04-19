; ModuleID = 'jit_subtract'
source_filename = "jit_subtract"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @copy_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(147456) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2, ptr noalias align 128 dereferenceable(147456) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 19200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 19200
  br i1 %4, label %copy_fusion.in_bounds-true, label %copy_fusion.in_bounds-after

copy_fusion.in_bounds-after:                      ; preds = %slice1-after, %entry
  ret void

copy_fusion.in_bounds-true:                       ; preds = %entry
  br label %concatenate.pivot.768.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 192
  %10 = udiv i32 %8, 192
  %11 = udiv i32 %10, 4
  %12 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %10, i32 %9
  %13 = load double, ptr %12, align 8, !invariant.load !6
  br label %concatenate.1.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.768.1
  %14 = phi i32 [ 768, %concatenate.pivot.768.1 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 192
  %19 = udiv i32 %17, 192
  %20 = urem i32 %19, 4
  %21 = udiv i32 %19, 4
  %22 = udiv i32 %21, 1
  %23 = udiv i32 %22, 24
  %24 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr %arg1, i32 0, i32 %22, i32 0, i32 %20, i32 %18
  %25 = load double, ptr %24, align 8, !invariant.load !6
  br label %concatenate.1.merge

concatenate.pivot.768.:                           ; preds = %copy_fusion.in_bounds-true
  %26 = icmp ult i32 %3, 768
  br i1 %26, label %concatenate.pivot.0., label %concatenate.pivot.768.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id0

concatenate.pivot.768.1:                          ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id1

concatenate.1.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %27 = phi double [ %13, %concat_index_from_operand_id0 ], [ %25, %concat_index_from_operand_id1 ]
  %28 = icmp sge i32 %3, 0
  %29 = icmp slt i32 %3, 768
  %30 = and i1 %28, %29
  br i1 %30, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.1.merge
  %31 = icmp sge i32 %3, 768
  %32 = icmp slt i32 %3, 19200
  %33 = and i1 %31, %32
  br i1 %33, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %copy_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.1.merge
  %34 = sub i32 %3, 0
  %35 = getelementptr inbounds [768 x double], ptr %arg2, i32 0, i32 %34
  store double %27, ptr %35, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %36 = sub i32 %3, 768
  %37 = getelementptr inbounds [18432 x double], ptr %arg3, i32 0, i32 %36
  store double %27, ptr %37, align 8
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @input_slice_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(147456) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2, ptr noalias align 128 dereferenceable(147456) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 19200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 19200
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.768.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 192
  %10 = udiv i32 %8, 192
  %11 = udiv i32 %10, 4
  %12 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %10, i32 %9
  %13 = load double, ptr %12, align 8, !invariant.load !6
  %14 = fneg double %13
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.768.1
  %15 = phi i32 [ 768, %concatenate.pivot.768.1 ]
  %16 = sub nsw i32 %3, %15
  %17 = mul nuw nsw i32 %16, 1
  %18 = add nuw nsw i32 0, %17
  %19 = urem i32 %18, 192
  %20 = udiv i32 %18, 192
  %21 = urem i32 %20, 4
  %22 = udiv i32 %20, 4
  %23 = udiv i32 %22, 1
  %24 = udiv i32 %23, 24
  %25 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr %arg1, i32 0, i32 %23, i32 0, i32 %21, i32 %19
  %26 = load double, ptr %25, align 8, !invariant.load !6
  %27 = fneg double %26
  br label %concatenate.merge

concatenate.pivot.768.:                           ; preds = %input_slice_fusion.in_bounds-true
  %28 = icmp ult i32 %3, 768
  br i1 %28, label %concatenate.pivot.0., label %concatenate.pivot.768.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id0

concatenate.pivot.768.1:                          ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %29 = phi double [ %14, %concat_index_from_operand_id0 ], [ %27, %concat_index_from_operand_id1 ]
  %30 = icmp sge i32 %3, 0
  %31 = icmp slt i32 %3, 768
  %32 = and i1 %30, %31
  br i1 %32, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %33 = icmp sge i32 %3, 768
  %34 = icmp slt i32 %3, 19200
  %35 = and i1 %33, %34
  br i1 %35, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %36 = sub i32 %3, 0
  %37 = getelementptr inbounds [768 x double], ptr %arg2, i32 0, i32 %36
  store double %29, ptr %37, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %38 = sub i32 %3, 768
  %39 = getelementptr inbounds [18432 x double], ptr %arg3, i32 0, i32 %38
  store double %29, ptr %39, align 8
  br label %slice1-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @copy_fusion, !"kernel", i32 1}
!1 = !{ptr @copy_fusion, !"reqntidx", i32 128}
!2 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!3 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 150}
!5 = !{i32 0, i32 128}
!6 = !{}
