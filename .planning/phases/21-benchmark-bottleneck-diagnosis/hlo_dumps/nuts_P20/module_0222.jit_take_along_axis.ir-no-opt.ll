; ModuleID = 'jit_take_along_axis'
source_filename = "jit_take_along_axis"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(61440) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 384
  %8 = icmp ult i32 %linear_index, 7680
  br i1 %8, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %constant_3_1 = load double, ptr @0, align 8
  %9 = getelementptr double, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  store double %constant_3_1, ptr %10, align 8
  br label %loop_broadcast_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @input_scatter_fusion(ptr noalias align 128 dereferenceable(61440) %arg0, ptr noalias align 16 dereferenceable(30720) %arg1, ptr noalias align 16 dereferenceable(46080) %arg2) {
entry:
  %input_address = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index0, 1
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index0, 1
  %10 = icmp ult i32 %linear_index, 3840
  br i1 %10, label %scatter.3.1.in_bounds-true, label %scatter.3.1.in_bounds-after

scatter.3.1.in_bounds-after:                      ; preds = %scatter.in_bounds-after, %entry
  ret void

scatter.3.1.in_bounds-true:                       ; preds = %entry
  %11 = mul nuw nsw i32 %9, 1
  %12 = add nuw nsw i32 0, %11
  %13 = urem i32 %12, 192
  %14 = udiv i32 %12, 192
  %15 = udiv i32 %14, 20
  %param_2.2 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg2, i32 0, i32 %14, i32 %13, i32 0, i32 0
  %param_2.21 = load i32, ptr %param_2.2, align 4, !invariant.load !8
  %16 = add i32 %8, %param_2.21
  %17 = icmp ult i32 %param_2.21, 20
  %18 = and i1 true, %17
  %19 = mul nuw nsw i32 %9, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 192
  %22 = udiv i32 %20, 192
  %23 = udiv i32 %22, 20
  %param_2.22 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg2, i32 0, i32 %22, i32 %21, i32 0, i32 1
  %param_2.23 = load i32, ptr %param_2.22, align 4, !invariant.load !8
  %24 = add i32 %6, %param_2.23
  %25 = icmp ult i32 %param_2.23, 192
  %26 = and i1 %18, %25
  %27 = mul nuw nsw i32 %9, 1
  %28 = add nuw nsw i32 0, %27
  %29 = urem i32 %28, 192
  %30 = udiv i32 %28, 192
  %31 = udiv i32 %30, 20
  %param_2.24 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg2, i32 0, i32 %30, i32 %29, i32 0, i32 2
  %param_2.25 = load i32, ptr %param_2.24, align 4, !invariant.load !8
  %32 = add i32 %4, %param_2.25
  %33 = icmp ult i32 %param_2.25, 2
  %34 = and i1 %26, %33
  br i1 %34, label %scatter.in_bounds-true, label %scatter.in_bounds-after

scatter.in_bounds-after:                          ; preds = %scatter.in_bounds-true, %scatter.3.1.in_bounds-true
  br label %scatter.3.1.in_bounds-after

scatter.in_bounds-true:                           ; preds = %scatter.3.1.in_bounds-true
  %35 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %16, i32 %24, i32 %32
  %36 = mul nuw nsw i32 %4, 1
  %37 = add nuw nsw i32 0, %36
  %38 = mul nuw nsw i32 %6, 1
  %39 = add nuw nsw i32 0, %38
  %40 = mul nuw nsw i32 %8, 1
  %41 = add nuw nsw i32 0, %40
  %42 = udiv i32 %41, 1
  %43 = mul nuw nsw i32 %9, 1
  %44 = add nuw nsw i32 0, %43
  %45 = urem i32 %44, 192
  %46 = udiv i32 %44, 192
  %47 = udiv i32 %46, 20
  %48 = getelementptr double, ptr %arg1, i32 %linear_index
  %param_1.1 = getelementptr inbounds double, ptr %48, i32 0
  %param_1.16 = load double, ptr %param_1.1, align 8, !invariant.load !8
  store double %param_1.16, ptr %input_address, align 8
  %source = load double, ptr %input_address, align 8
  %49 = atomicrmw fadd ptr %35, double %source seq_cst, align 8
  br label %scatter.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 1024}
!2 = !{ptr @input_scatter_fusion, !"kernel", i32 1}
!3 = !{ptr @input_scatter_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 8}
!5 = !{i32 0, i32 1024}
!6 = !{i32 0, i32 30}
!7 = !{i32 0, i32 128}
!8 = !{}
