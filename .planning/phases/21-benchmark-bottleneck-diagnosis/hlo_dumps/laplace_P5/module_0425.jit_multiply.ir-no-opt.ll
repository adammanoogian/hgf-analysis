; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_multiply_fusion_1(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %loop_multiply_fusion.1.in_bounds-true, label %loop_multiply_fusion.1.in_bounds-after

loop_multiply_fusion.1.in_bounds-after:           ; preds = %loop_multiply_fusion.1.in_bounds-true, %entry
  ret void

loop_multiply_fusion.1.in_bounds-true:            ; preds = %entry
  %7 = getelementptr inbounds [192 x [4 x double]], ptr %arg1, i32 0, i32 %4, i32 %5
  %8 = load double, ptr %7, align 8, !invariant.load !6
  %9 = getelementptr double, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !6
  %multiply.2.1 = fmul double %8, %11
  %12 = getelementptr double, ptr %arg2, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  store double %multiply.2.1, ptr %13, align 8
  br label %loop_multiply_fusion.1.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_multiply_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(147456) %arg1, ptr noalias align 128 dereferenceable(147456) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
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
  br i1 %8, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %9 = getelementptr inbounds [24 x [192 x [4 x double]]], ptr %arg1, i32 0, i32 %7, i32 %4, i32 %6
  %10 = load double, ptr %9, align 8, !invariant.load !6
  %11 = urem i32 %linear_index0, 768
  %12 = getelementptr inbounds double, ptr %arg0, i32 %11
  %13 = load double, ptr %12, align 8, !invariant.load !6
  %multiply.3.1 = fmul double %10, %13
  %14 = getelementptr double, ptr %arg2, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  store double %multiply.3.1, ptr %15, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 128}
!2 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 6}
!5 = !{i32 0, i32 128}
!6 = !{}
!7 = !{i32 0, i32 144}
