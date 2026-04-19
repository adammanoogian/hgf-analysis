; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @copy_fusion(ptr noalias align 16 dereferenceable(32) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(768) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 100
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 100
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 100
  br i1 %4, label %copy_fusion.in_bounds-true, label %copy_fusion.in_bounds-after

copy_fusion.in_bounds-after:                      ; preds = %slice1-after, %entry
  ret void

copy_fusion.in_bounds-true:                       ; preds = %entry
  br label %concatenate.pivot.4.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = getelementptr inbounds [4 x [1 x double]], ptr %arg0, i32 0, i32 %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !8
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.4.1
  %9 = phi i32 [ 4, %concatenate.pivot.4.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = mul nuw nsw i32 %10, 1
  %12 = add nuw nsw i32 0, %11
  %13 = urem i32 %12, 4
  %14 = udiv i32 %12, 4
  %15 = udiv i32 %14, 24
  %16 = getelementptr inbounds [24 x [4 x [1 x double]]], ptr %arg1, i32 0, i32 %14, i32 %13, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !8
  br label %concatenate.merge

concatenate.pivot.4.:                             ; preds = %copy_fusion.in_bounds-true
  %18 = icmp ult i32 %3, 4
  br i1 %18, label %concatenate.pivot.0., label %concatenate.pivot.4.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id0

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %19 = phi double [ %8, %concat_index_from_operand_id0 ], [ %17, %concat_index_from_operand_id1 ]
  %20 = icmp sge i32 %3, 0
  %21 = icmp slt i32 %3, 4
  %22 = and i1 %20, %21
  br i1 %22, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %23 = icmp sge i32 %3, 4
  %24 = icmp slt i32 %3, 100
  %25 = and i1 %23, %24
  br i1 %25, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %copy_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %26 = sub i32 %3, 0
  %27 = getelementptr inbounds [4 x double], ptr %arg2, i32 0, i32 %26
  store double %19, ptr %27, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %28 = sub i32 %3, 4
  %29 = getelementptr inbounds [96 x double], ptr %arg3, i32 0, i32 %28
  store double %19, ptr %29, align 8
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_multiply_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !10
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %7 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %5
  %8 = load double, ptr %7, align 8, !invariant.load !8
  %9 = getelementptr double, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !8
  %multiply.3.1 = fmul double %8, %11
  %12 = getelementptr double, ptr %arg2, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  store double %multiply.3.1, ptr %13, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

define void @loop_add_fusion(ptr noalias align 16 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(6144) %arg2, ptr noalias align 16 dereferenceable(768) %arg3, ptr noalias align 128 dereferenceable(147456) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !11
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !10
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 18432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index0, 768
  %8 = icmp ult i32 %linear_index, 18432
  br i1 %8, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %9 = udiv i32 %linear_index0, 192
  %10 = getelementptr inbounds double, ptr %arg3, i32 %9
  %11 = load double, ptr %10, align 8, !invariant.load !8
  %12 = urem i32 %linear_index0, 768
  %13 = getelementptr inbounds double, ptr %arg2, i32 %12
  %14 = load double, ptr %13, align 8, !invariant.load !8
  %multiply.4.1 = fmul double %11, %14
  %15 = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %6
  %16 = load double, ptr %15, align 8, !invariant.load !8
  %17 = getelementptr double, ptr %arg0, i32 %linear_index
  %18 = getelementptr inbounds double, ptr %17, i32 0
  %19 = load double, ptr %18, align 8, !invariant.load !8
  %multiply.5.3 = fmul double %16, %19
  %add.1.1 = fadd double %multiply.4.1, %multiply.5.3
  %20 = getelementptr double, ptr %arg4, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %add.1.1, ptr %21, align 8
  br label %loop_add_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}

!0 = !{ptr @copy_fusion, !"kernel", i32 1}
!1 = !{ptr @copy_fusion, !"reqntidx", i32 100}
!2 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!4 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!6 = !{i32 0, i32 1}
!7 = !{i32 0, i32 100}
!8 = !{}
!9 = !{i32 0, i32 6}
!10 = !{i32 0, i32 128}
!11 = !{i32 0, i32 144}
