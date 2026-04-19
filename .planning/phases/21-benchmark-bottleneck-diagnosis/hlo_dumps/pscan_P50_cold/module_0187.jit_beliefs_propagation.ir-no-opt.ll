; ModuleID = 'jit_beliefs_propagation'
source_filename = "jit_beliefs_propagation"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@1 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @input_slice_fusion(ptr noalias align 128 dereferenceable(384) %arg0, ptr noalias align 128 dereferenceable(384) %arg1, ptr noalias align 128 dereferenceable(384) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 144
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice2-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.48.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %constant_15_3 = load double, ptr @1, align 8
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.48.2
  %7 = phi i32 [ 48, %concatenate.pivot.48.2 ]
  %8 = sub nsw i32 %3, %7
  %constant_15_31 = load double, ptr @1, align 8
  br label %concatenate.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.96.3
  %9 = phi i32 [ 96, %concatenate.pivot.96.3 ]
  %10 = sub nsw i32 %3, %9
  %constant_16_2 = load double, ptr @0, align 8
  br label %concatenate.merge

concatenate.pivot.48.:                            ; preds = %input_slice_fusion.in_bounds-true
  %11 = icmp ult i32 %3, 48
  br i1 %11, label %concatenate.pivot.0., label %concatenate.pivot.96.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.48.
  br label %concat_index_from_operand_id0

concatenate.pivot.96.:                            ; preds = %concatenate.pivot.48.
  %12 = icmp ult i32 %3, 96
  br i1 %12, label %concatenate.pivot.48.2, label %concatenate.pivot.96.3

concatenate.pivot.48.2:                           ; preds = %concatenate.pivot.96.
  br label %concat_index_from_operand_id1

concatenate.pivot.96.3:                           ; preds = %concatenate.pivot.96.
  br label %concat_index_from_operand_id2

concatenate.merge:                                ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %13 = phi double [ %constant_15_3, %concat_index_from_operand_id0 ], [ %constant_15_31, %concat_index_from_operand_id1 ], [ %constant_16_2, %concat_index_from_operand_id2 ]
  %14 = icmp sge i32 %3, 0
  %15 = icmp slt i32 %3, 48
  %16 = and i1 %14, %15
  br i1 %16, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %17 = icmp sge i32 %3, 48
  %18 = icmp slt i32 %3, 96
  %19 = and i1 %17, %18
  br i1 %19, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %20 = icmp sge i32 %3, 96
  %21 = icmp slt i32 %3, 144
  %22 = and i1 %20, %21
  br i1 %22, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %23 = sub i32 %3, 0
  %24 = getelementptr inbounds [48 x double], ptr %arg0, i32 0, i32 %23
  store double %13, ptr %24, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %25 = sub i32 %3, 48
  %26 = getelementptr inbounds [48 x double], ptr %arg1, i32 0, i32 %25
  store double %13, ptr %26, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %27 = sub i32 %3, 96
  %28 = getelementptr inbounds [48 x double], ptr %arg2, i32 0, i32 %27
  store double %13, ptr %28, align 8
  br label %slice2-after
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
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{i32 0, i32 2}
!3 = !{i32 0, i32 128}
