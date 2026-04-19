; ModuleID = 'jit__squeeze'
source_filename = "jit__squeeze"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @copy_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(147456) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2, ptr noalias align 128 dereferenceable(147456) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
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
  %12 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %10, i32 %9
  %13 = load double, ptr %12, align 8, !invariant.load !4
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.768.1
  %14 = phi i32 [ 768, %concatenate.pivot.768.1 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 192
  %19 = udiv i32 %17, 192
  %20 = urem i32 %19, 4
  %21 = udiv i32 %19, 4
  %22 = udiv i32 %21, 24
  %23 = getelementptr inbounds [24 x [4 x [192 x double]]], ptr %arg1, i32 0, i32 %21, i32 %20, i32 %18
  %24 = load double, ptr %23, align 8, !invariant.load !4
  br label %concatenate.merge

concatenate.pivot.768.:                           ; preds = %copy_fusion.in_bounds-true
  %25 = icmp ult i32 %3, 768
  br i1 %25, label %concatenate.pivot.0., label %concatenate.pivot.768.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id0

concatenate.pivot.768.1:                          ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %26 = phi double [ %13, %concat_index_from_operand_id0 ], [ %24, %concat_index_from_operand_id1 ]
  %27 = icmp sge i32 %3, 0
  %28 = icmp slt i32 %3, 768
  %29 = and i1 %27, %28
  br i1 %29, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %30 = icmp sge i32 %3, 768
  %31 = icmp slt i32 %3, 19200
  %32 = and i1 %30, %31
  br i1 %32, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %copy_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %33 = sub i32 %3, 0
  %34 = getelementptr inbounds [768 x double], ptr %arg2, i32 0, i32 %33
  store double %26, ptr %34, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %35 = sub i32 %3, 768
  %36 = getelementptr inbounds [18432 x double], ptr %arg3, i32 0, i32 %35
  store double %26, ptr %36, align 8
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

!0 = !{ptr @copy_fusion, !"kernel", i32 1}
!1 = !{ptr @copy_fusion, !"reqntidx", i32 128}
!2 = !{i32 0, i32 150}
!3 = !{i32 0, i32 128}
!4 = !{}
