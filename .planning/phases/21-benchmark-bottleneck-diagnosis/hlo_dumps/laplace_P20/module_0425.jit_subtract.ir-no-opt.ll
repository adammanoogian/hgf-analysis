; ModuleID = 'jit_subtract'
source_filename = "jit_subtract"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_subtract_fusion(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_subtract_fusion.in_bounds-true, label %loop_subtract_fusion.in_bounds-after

loop_subtract_fusion.in_bounds-after:             ; preds = %loop_subtract_fusion.in_bounds-true, %entry
  ret void

loop_subtract_fusion.in_bounds-true:              ; preds = %entry
  %7 = load double, ptr %arg1, align 8, !invariant.load !6
  %8 = getelementptr double, ptr %arg0, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !6
  %subtract.1.1 = fsub double %7, %10
  %11 = getelementptr double, ptr %arg2, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  store double %subtract.1.1, ptr %12, align 8
  br label %loop_subtract_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @wrapped_negate(ptr noalias align 16 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(3686400) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 115200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index0 = add nuw nsw i32 %linear_index_base, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 3840
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 20
  %10 = udiv i32 %linear_index1, 20
  %11 = urem i32 %10, 192
  %12 = udiv i32 %linear_index1, 3840
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 20
  %15 = udiv i32 %linear_index2, 20
  %16 = urem i32 %15, 192
  %17 = udiv i32 %linear_index2, 3840
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 20
  %20 = udiv i32 %linear_index3, 20
  %21 = urem i32 %20, 192
  %22 = udiv i32 %linear_index3, 3840
  %23 = icmp ult i32 %linear_index_base, 460800
  br i1 %23, label %wrapped_negate.in_bounds-true, label %wrapped_negate.in_bounds-after

wrapped_negate.in_bounds-after:                   ; preds = %wrapped_negate.in_bounds-true, %entry
  ret void

wrapped_negate.in_bounds-true:                    ; preds = %entry
  %24 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %25 = getelementptr inbounds double, ptr %24, i32 0
  %26 = load double, ptr %25, align 8, !invariant.load !6
  %27 = fneg double %26
  %28 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  %30 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %31 = getelementptr inbounds double, ptr %30, i32 1
  %32 = load double, ptr %31, align 8, !invariant.load !6
  %33 = fneg double %32
  %34 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %35 = getelementptr inbounds double, ptr %34, i32 1
  store double %33, ptr %35, align 8
  %36 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %37 = getelementptr inbounds double, ptr %36, i32 2
  %38 = load double, ptr %37, align 8, !invariant.load !6
  %39 = fneg double %38
  %40 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %41 = getelementptr inbounds double, ptr %40, i32 2
  store double %39, ptr %41, align 8
  %42 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %43 = getelementptr inbounds double, ptr %42, i32 3
  %44 = load double, ptr %43, align 8, !invariant.load !6
  %45 = fneg double %44
  %46 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %47 = getelementptr inbounds double, ptr %46, i32 3
  store double %45, ptr %47, align 8
  br label %wrapped_negate.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 1024}
!2 = !{ptr @wrapped_negate, !"kernel", i32 1}
!3 = !{ptr @wrapped_negate, !"reqntidx", i32 256}
!4 = !{i32 0, i32 4}
!5 = !{i32 0, i32 1024}
!6 = !{}
!7 = !{i32 0, i32 450}
!8 = !{i32 0, i32 256}
