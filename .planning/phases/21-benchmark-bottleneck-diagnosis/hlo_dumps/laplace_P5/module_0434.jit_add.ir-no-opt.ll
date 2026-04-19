; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @input_slice_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(147456) %arg2, ptr noalias align 16 dereferenceable(768) %arg3, ptr noalias align 128 dereferenceable(6144) %arg4, ptr noalias align 128 dereferenceable(147456) %arg5) {
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
  %12 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %10, i32 %9
  %13 = load double, ptr %12, align 8, !invariant.load !4
  %14 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %10
  %15 = load double, ptr %14, align 8, !invariant.load !4
  %add.2.2 = fadd double %13, %15
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.768.1
  %16 = phi i32 [ 768, %concatenate.pivot.768.1 ]
  %17 = sub nsw i32 %3, %16
  %18 = mul nuw nsw i32 %17, 1
  %19 = add nuw nsw i32 0, %18
  %20 = urem i32 %19, 192
  %21 = udiv i32 %19, 192
  %22 = urem i32 %21, 4
  %23 = udiv i32 %21, 4
  %24 = udiv i32 %23, 24
  %25 = getelementptr inbounds [24 x [4 x [192 x double]]], ptr %arg2, i32 0, i32 %23, i32 %22, i32 %20
  %26 = load double, ptr %25, align 8, !invariant.load !4
  %27 = getelementptr inbounds [24 x [4 x double]], ptr %arg3, i32 0, i32 %23, i32 %22
  %28 = load double, ptr %27, align 8, !invariant.load !4
  %add.3.2 = fadd double %26, %28
  br label %concatenate.merge

concatenate.pivot.768.:                           ; preds = %input_slice_fusion.in_bounds-true
  %29 = icmp ult i32 %3, 768
  br i1 %29, label %concatenate.pivot.0., label %concatenate.pivot.768.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id0

concatenate.pivot.768.1:                          ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %30 = phi double [ %add.2.2, %concat_index_from_operand_id0 ], [ %add.3.2, %concat_index_from_operand_id1 ]
  %31 = icmp sge i32 %3, 0
  %32 = icmp slt i32 %3, 768
  %33 = and i1 %31, %32
  br i1 %33, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %34 = icmp sge i32 %3, 768
  %35 = icmp slt i32 %3, 19200
  %36 = and i1 %34, %35
  br i1 %36, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %37 = sub i32 %3, 0
  %38 = getelementptr inbounds [768 x double], ptr %arg4, i32 0, i32 %37
  store double %30, ptr %38, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %39 = sub i32 %3, 768
  %40 = getelementptr inbounds [18432 x double], ptr %arg5, i32 0, i32 %39
  store double %30, ptr %40, align 8
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
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{i32 0, i32 150}
!3 = !{i32 0, i32 128}
!4 = !{}
