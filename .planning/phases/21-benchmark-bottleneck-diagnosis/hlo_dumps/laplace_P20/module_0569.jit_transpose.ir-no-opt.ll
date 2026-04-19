; ModuleID = 'jit_transpose'
source_filename = "jit_transpose"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_transpose(ptr noalias align 16 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(3686400) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 115200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index0 = add nuw nsw i32 %linear_index_base, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index0, 20
  %8 = urem i32 %7, 120
  %9 = udiv i32 %linear_index0, 2400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 20
  %12 = udiv i32 %linear_index1, 20
  %13 = urem i32 %12, 1
  %14 = udiv i32 %linear_index1, 20
  %15 = urem i32 %14, 120
  %16 = udiv i32 %linear_index1, 2400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 20
  %19 = udiv i32 %linear_index2, 20
  %20 = urem i32 %19, 1
  %21 = udiv i32 %linear_index2, 20
  %22 = urem i32 %21, 120
  %23 = udiv i32 %linear_index2, 2400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 20
  %26 = udiv i32 %linear_index3, 20
  %27 = urem i32 %26, 1
  %28 = udiv i32 %linear_index3, 20
  %29 = urem i32 %28, 120
  %30 = udiv i32 %linear_index3, 2400
  %31 = icmp ult i32 %linear_index_base, 460800
  br i1 %31, label %wrapped_transpose.in_bounds-true, label %wrapped_transpose.in_bounds-after

wrapped_transpose.in_bounds-after:                ; preds = %wrapped_transpose.in_bounds-true, %entry
  ret void

wrapped_transpose.in_bounds-true:                 ; preds = %entry
  %32 = getelementptr inbounds [120 x [192 x [1 x [20 x double]]]], ptr %arg0, i32 0, i32 %8, i32 %9, i32 0, i32 %4
  %33 = load double, ptr %32, align 8, !invariant.load !4
  %34 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %35 = getelementptr inbounds double, ptr %34, i32 0
  store double %33, ptr %35, align 8
  %36 = getelementptr inbounds [120 x [192 x [1 x [20 x double]]]], ptr %arg0, i32 0, i32 %15, i32 %16, i32 0, i32 %11
  %37 = load double, ptr %36, align 8, !invariant.load !4
  %38 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %39 = getelementptr inbounds double, ptr %38, i32 1
  store double %37, ptr %39, align 8
  %40 = getelementptr inbounds [120 x [192 x [1 x [20 x double]]]], ptr %arg0, i32 0, i32 %22, i32 %23, i32 0, i32 %18
  %41 = load double, ptr %40, align 8, !invariant.load !4
  %42 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %43 = getelementptr inbounds double, ptr %42, i32 2
  store double %41, ptr %43, align 8
  %44 = getelementptr inbounds [120 x [192 x [1 x [20 x double]]]], ptr %arg0, i32 0, i32 %29, i32 %30, i32 0, i32 %25
  %45 = load double, ptr %44, align 8, !invariant.load !4
  %46 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %47 = getelementptr inbounds double, ptr %46, i32 3
  store double %45, ptr %47, align 8
  br label %wrapped_transpose.in_bounds-after
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

!0 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!1 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!2 = !{i32 0, i32 900}
!3 = !{i32 0, i32 128}
!4 = !{}
