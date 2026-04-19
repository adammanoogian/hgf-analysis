; ModuleID = 'jit_negative'
source_filename = "jit_negative"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @input_slice_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(960) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(960) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 121
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 121
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 121
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = load double, ptr %arg0, align 8, !invariant.load !4
  %8 = fneg double %7
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %9 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = getelementptr inbounds [120 x double], ptr %arg1, i32 0, i32 %10
  %12 = load double, ptr %11, align 8, !invariant.load !4
  %13 = fneg double %12
  br label %concatenate.merge

concatenate.pivot.1.:                             ; preds = %input_slice_fusion.in_bounds-true
  %14 = icmp ult i32 %3, 1
  br i1 %14, label %concatenate.pivot.0., label %concatenate.pivot.1.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %15 = phi double [ %8, %concat_index_from_operand_id0 ], [ %13, %concat_index_from_operand_id1 ]
  %16 = icmp sge i32 %3, 0
  %17 = icmp slt i32 %3, 1
  %18 = and i1 %16, %17
  br i1 %18, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %19 = icmp sge i32 %3, 1
  %20 = icmp slt i32 %3, 121
  %21 = and i1 %19, %20
  br i1 %21, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %22 = sub i32 %3, 0
  %23 = getelementptr inbounds [1 x double], ptr %arg2, i32 0, i32 0
  store double %15, ptr %23, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %24 = sub i32 %3, 1
  %25 = getelementptr inbounds [120 x double], ptr %arg3, i32 0, i32 %24
  store double %15, ptr %25, align 8
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 121}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 121}
!4 = !{}
