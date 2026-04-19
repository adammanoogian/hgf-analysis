; ModuleID = 'jit_broadcast_in_dim'
source_filename = "jit_broadcast_in_dim"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_broadcast_fusion(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(3686400) %arg1) {
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
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 192
  %8 = urem i32 %7, 20
  %9 = udiv i32 %linear_index0, 3840
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 1
  %12 = udiv i32 %linear_index1, 1
  %13 = urem i32 %12, 192
  %14 = udiv i32 %linear_index1, 192
  %15 = urem i32 %14, 20
  %16 = udiv i32 %linear_index1, 3840
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 1
  %19 = udiv i32 %linear_index2, 1
  %20 = urem i32 %19, 192
  %21 = udiv i32 %linear_index2, 192
  %22 = urem i32 %21, 20
  %23 = udiv i32 %linear_index2, 3840
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 1
  %26 = udiv i32 %linear_index3, 1
  %27 = urem i32 %26, 192
  %28 = udiv i32 %linear_index3, 192
  %29 = urem i32 %28, 20
  %30 = udiv i32 %linear_index3, 3840
  %31 = icmp ult i32 %linear_index_base, 460800
  br i1 %31, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %32 = urem i32 %linear_index0, 3840
  %33 = getelementptr inbounds double, ptr %arg0, i32 %32
  %34 = load double, ptr %33, align 8, !invariant.load !4
  %35 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %36 = getelementptr inbounds double, ptr %35, i32 0
  store double %34, ptr %36, align 8
  %37 = urem i32 %linear_index1, 3840
  %38 = getelementptr inbounds double, ptr %arg0, i32 %37
  %39 = load double, ptr %38, align 8, !invariant.load !4
  %40 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %41 = getelementptr inbounds double, ptr %40, i32 1
  store double %39, ptr %41, align 8
  %42 = urem i32 %linear_index2, 3840
  %43 = getelementptr inbounds double, ptr %arg0, i32 %42
  %44 = load double, ptr %43, align 8, !invariant.load !4
  %45 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %46 = getelementptr inbounds double, ptr %45, i32 2
  store double %44, ptr %46, align 8
  %47 = urem i32 %linear_index3, 3840
  %48 = getelementptr inbounds double, ptr %arg0, i32 %47
  %49 = load double, ptr %48, align 8, !invariant.load !4
  %50 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %51 = getelementptr inbounds double, ptr %50, i32 3
  store double %49, ptr %51, align 8
  br label %loop_broadcast_fusion.in_bounds-after
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

!0 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 128}
!2 = !{i32 0, i32 900}
!3 = !{i32 0, i32 128}
!4 = !{}
