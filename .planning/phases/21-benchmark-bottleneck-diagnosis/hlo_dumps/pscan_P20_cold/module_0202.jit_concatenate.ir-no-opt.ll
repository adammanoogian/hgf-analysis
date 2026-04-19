; ModuleID = 'jit_concatenate'
source_filename = "jit_concatenate"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_concatenate(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(61440) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 192
  %8 = icmp ult i32 %linear_index, 3840
  br i1 %8, label %wrapped_concatenate.in_bounds-true, label %wrapped_concatenate.in_bounds-after

wrapped_concatenate.in_bounds-after:              ; preds = %wrapped_concatenate.in_bounds-true, %entry
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %11 = mul nuw nsw i32 %9, 128
  %linear_index1 = add nuw nsw i32 %11, %10
  %linear_index_in_range2 = icmp ult i32 %linear_index1, 3840
  call void @llvm.assume(i1 %linear_index_in_range2)
  %linear_index03 = add nuw nsw i32 %linear_index1, 0
  %12 = udiv i32 %linear_index03, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %linear_index03, 1
  %15 = urem i32 %14, 192
  %16 = udiv i32 %linear_index03, 192
  %17 = icmp ult i32 %linear_index1, 3840
  br i1 %17, label %wrapped_concatenate.in_bounds-true4, label %wrapped_concatenate.in_bounds-after5

wrapped_concatenate.in_bounds-after5:             ; preds = %wrapped_concatenate.in_bounds-true4, %wrapped_concatenate.in_bounds-after
  ret void

wrapped_concatenate.in_bounds-true:               ; preds = %entry
  %18 = add i32 %4, 0
  %19 = getelementptr double, ptr %arg0, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  %21 = load double, ptr %20, align 8, !invariant.load !4
  %22 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg2, i32 0, i32 %7, i32 %6, i32 %18
  store double %21, ptr %22, align 8
  br label %wrapped_concatenate.in_bounds-after

wrapped_concatenate.in_bounds-true4:              ; preds = %wrapped_concatenate.in_bounds-after
  %23 = add i32 %13, 1
  %24 = getelementptr double, ptr %arg1, i32 %linear_index1
  %25 = getelementptr inbounds double, ptr %24, i32 0
  %26 = load double, ptr %25, align 8, !invariant.load !4
  %27 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg2, i32 0, i32 %16, i32 %15, i32 %23
  store double %26, ptr %27, align 8
  br label %wrapped_concatenate.in_bounds-after5
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
!1 = !{ptr @wrapped_concatenate, !"reqntidx", i32 128}
!2 = !{i32 0, i32 30}
!3 = !{i32 0, i32 128}
!4 = !{}
