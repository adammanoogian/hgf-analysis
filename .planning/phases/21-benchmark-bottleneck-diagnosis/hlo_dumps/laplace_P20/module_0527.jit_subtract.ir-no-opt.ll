; ModuleID = 'jit_subtract'
source_filename = "jit_subtract"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_negate(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = urem i32 %5, 20
  %7 = udiv i32 %linear_index0, 3840
  %8 = icmp ult i32 %linear_index, 3840
  br i1 %8, label %wrapped_negate.in_bounds-true, label %wrapped_negate.in_bounds-after

wrapped_negate.in_bounds-after:                   ; preds = %wrapped_negate.in_bounds-true, %entry
  ret void

wrapped_negate.in_bounds-true:                    ; preds = %entry
  %9 = getelementptr double, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !6
  %12 = fneg double %11
  %13 = getelementptr double, ptr %arg1, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  store double %12, ptr %14, align 8
  br label %wrapped_negate.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @wrapped_negate_1(ptr noalias align 16 dereferenceable(3686400) %arg0, ptr noalias align 128 dereferenceable(3686400) %arg1) {
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
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = urem i32 %5, 20
  %7 = udiv i32 %linear_index0, 3840
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index0, 3840
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 192
  %12 = udiv i32 %linear_index1, 192
  %13 = urem i32 %12, 20
  %14 = udiv i32 %linear_index1, 3840
  %15 = urem i32 %14, 1
  %16 = udiv i32 %linear_index1, 3840
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 192
  %19 = udiv i32 %linear_index2, 192
  %20 = urem i32 %19, 20
  %21 = udiv i32 %linear_index2, 3840
  %22 = urem i32 %21, 1
  %23 = udiv i32 %linear_index2, 3840
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 192
  %26 = udiv i32 %linear_index3, 192
  %27 = urem i32 %26, 20
  %28 = udiv i32 %linear_index3, 3840
  %29 = urem i32 %28, 1
  %30 = udiv i32 %linear_index3, 3840
  %31 = icmp ult i32 %linear_index_base, 460800
  br i1 %31, label %wrapped_negate.1.in_bounds-true, label %wrapped_negate.1.in_bounds-after

wrapped_negate.1.in_bounds-after:                 ; preds = %wrapped_negate.1.in_bounds-true, %entry
  ret void

wrapped_negate.1.in_bounds-true:                  ; preds = %entry
  %32 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %33 = getelementptr inbounds double, ptr %32, i32 0
  %34 = load double, ptr %33, align 8, !invariant.load !6
  %35 = fneg double %34
  %36 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %37 = getelementptr inbounds double, ptr %36, i32 0
  store double %35, ptr %37, align 8
  %38 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %39 = getelementptr inbounds double, ptr %38, i32 1
  %40 = load double, ptr %39, align 8, !invariant.load !6
  %41 = fneg double %40
  %42 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %43 = getelementptr inbounds double, ptr %42, i32 1
  store double %41, ptr %43, align 8
  %44 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %45 = getelementptr inbounds double, ptr %44, i32 2
  %46 = load double, ptr %45, align 8, !invariant.load !6
  %47 = fneg double %46
  %48 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %49 = getelementptr inbounds double, ptr %48, i32 2
  store double %47, ptr %49, align 8
  %50 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %51 = getelementptr inbounds double, ptr %50, i32 3
  %52 = load double, ptr %51, align 8, !invariant.load !6
  %53 = fneg double %52
  %54 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %55 = getelementptr inbounds double, ptr %54, i32 3
  store double %53, ptr %55, align 8
  br label %wrapped_negate.1.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @wrapped_negate, !"kernel", i32 1}
!1 = !{ptr @wrapped_negate, !"reqntidx", i32 1024}
!2 = !{ptr @wrapped_negate_1, !"kernel", i32 1}
!3 = !{ptr @wrapped_negate_1, !"reqntidx", i32 256}
!4 = !{i32 0, i32 4}
!5 = !{i32 0, i32 1024}
!6 = !{}
!7 = !{i32 0, i32 450}
!8 = !{i32 0, i32 256}
