; ModuleID = 'jit_concatenate'
source_filename = "jit_concatenate"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_concatenate(ptr noalias align 16 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(147456) %arg1, ptr noalias align 128 dereferenceable(294912) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 18432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 192
  %8 = urem i32 %7, 4
  %9 = udiv i32 %linear_index0, 768
  %10 = icmp ult i32 %linear_index, 18432
  br i1 %10, label %wrapped_concatenate.in_bounds-true, label %wrapped_concatenate.in_bounds-after

wrapped_concatenate.in_bounds-after:              ; preds = %wrapped_concatenate.in_bounds-true, %entry
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %13 = mul nuw nsw i32 %11, 128
  %linear_index1 = add nuw nsw i32 %13, %12
  %linear_index_in_range2 = icmp ult i32 %linear_index1, 18432
  call void @llvm.assume(i1 %linear_index_in_range2)
  %linear_index03 = add nuw nsw i32 %linear_index1, 0
  %14 = udiv i32 %linear_index03, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %linear_index03, 1
  %17 = urem i32 %16, 192
  %18 = udiv i32 %linear_index03, 192
  %19 = urem i32 %18, 4
  %20 = udiv i32 %linear_index03, 768
  %21 = icmp ult i32 %linear_index1, 18432
  br i1 %21, label %wrapped_concatenate.in_bounds-true4, label %wrapped_concatenate.in_bounds-after5

wrapped_concatenate.in_bounds-after5:             ; preds = %wrapped_concatenate.in_bounds-true4, %wrapped_concatenate.in_bounds-after
  ret void

wrapped_concatenate.in_bounds-true:               ; preds = %entry
  %22 = add i32 %4, 0
  %23 = getelementptr double, ptr %arg0, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !4
  %26 = getelementptr inbounds [24 x [4 x [192 x [2 x double]]]], ptr %arg2, i32 0, i32 %9, i32 %8, i32 %6, i32 %22
  store double %25, ptr %26, align 8
  br label %wrapped_concatenate.in_bounds-after

wrapped_concatenate.in_bounds-true4:              ; preds = %wrapped_concatenate.in_bounds-after
  %27 = add i32 %15, 1
  %28 = getelementptr double, ptr %arg1, i32 %linear_index1
  %29 = getelementptr inbounds double, ptr %28, i32 0
  %30 = load double, ptr %29, align 8, !invariant.load !4
  %31 = getelementptr inbounds [24 x [4 x [192 x [2 x double]]]], ptr %arg2, i32 0, i32 %20, i32 %19, i32 %17, i32 %27
  store double %30, ptr %31, align 8
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
!2 = !{i32 0, i32 144}
!3 = !{i32 0, i32 128}
!4 = !{}
