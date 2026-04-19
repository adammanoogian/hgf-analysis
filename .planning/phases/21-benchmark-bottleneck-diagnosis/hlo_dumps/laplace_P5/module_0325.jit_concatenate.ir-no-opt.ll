; ModuleID = 'jit_concatenate'
source_filename = "jit_concatenate"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_concatenate(ptr noalias align 16 dereferenceable(32) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(192) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 24
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 24
  br i1 %4, label %wrapped_concatenate.in_bounds-true, label %wrapped_concatenate.in_bounds-after

wrapped_concatenate.in_bounds-after:              ; preds = %concatenate.1.1.merge, %entry
  ret void

wrapped_concatenate.in_bounds-true:               ; preds = %entry
  br label %concatenate.pivot.12.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %6
  %8 = load double, ptr %7, align 8, !invariant.load !4
  br label %concatenate.1.1.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.4.1
  %9 = phi i32 [ 4, %concatenate.pivot.4.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %10
  %12 = load double, ptr %11, align 8, !invariant.load !4
  br label %concatenate.1.1.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.8.2
  %13 = phi i32 [ 8, %concatenate.pivot.8.2 ]
  %14 = sub nsw i32 %3, %13
  %15 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %14
  %16 = load double, ptr %15, align 8, !invariant.load !4
  br label %concatenate.1.1.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.12.3
  %17 = phi i32 [ 12, %concatenate.pivot.12.3 ]
  %18 = sub nsw i32 %3, %17
  %19 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %18
  %20 = load double, ptr %19, align 8, !invariant.load !4
  br label %concatenate.1.1.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.16.4
  %21 = phi i32 [ 16, %concatenate.pivot.16.4 ]
  %22 = sub nsw i32 %3, %21
  %23 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %22
  %24 = load double, ptr %23, align 8, !invariant.load !4
  br label %concatenate.1.1.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.20.5
  %25 = phi i32 [ 20, %concatenate.pivot.20.5 ]
  %26 = sub nsw i32 %3, %25
  %27 = getelementptr inbounds [4 x double], ptr %arg5, i32 0, i32 %26
  %28 = load double, ptr %27, align 8, !invariant.load !4
  br label %concatenate.1.1.merge

concatenate.pivot.12.:                            ; preds = %wrapped_concatenate.in_bounds-true
  %29 = icmp ult i32 %3, 12
  br i1 %29, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %concatenate.pivot.12.
  %30 = icmp ult i32 %3, 4
  br i1 %30, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id0

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %31 = icmp ult i32 %3, 8
  br i1 %31, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id1

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id2

concatenate.pivot.16.:                            ; preds = %concatenate.pivot.12.
  %32 = icmp ult i32 %3, 16
  br i1 %32, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id3

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %33 = icmp ult i32 %3, 20
  br i1 %33, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id4

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id5

concatenate.1.1.merge:                            ; preds = %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %34 = phi double [ %8, %concat_index_from_operand_id0 ], [ %12, %concat_index_from_operand_id1 ], [ %16, %concat_index_from_operand_id2 ], [ %20, %concat_index_from_operand_id3 ], [ %24, %concat_index_from_operand_id4 ], [ %28, %concat_index_from_operand_id5 ]
  %35 = getelementptr double, ptr %arg6, i32 %linear_index
  %36 = getelementptr inbounds double, ptr %35, i32 0
  store double %34, ptr %36, align 8
  br label %wrapped_concatenate.in_bounds-after
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

!0 = !{ptr @wrapped_concatenate, !"kernel", i32 1}
!1 = !{ptr @wrapped_concatenate, !"reqntidx", i32 24}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 24}
!4 = !{}
