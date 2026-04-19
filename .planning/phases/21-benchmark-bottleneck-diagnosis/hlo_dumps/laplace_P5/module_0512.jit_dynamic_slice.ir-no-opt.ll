; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(294912) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(147456) %arg2) {
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
  %10 = urem i32 %9, 1
  %11 = udiv i32 %linear_index0, 768
  %12 = icmp ult i32 %linear_index, 18432
  br i1 %12, label %loop_dynamic_slice_fusion.in_bounds-true, label %loop_dynamic_slice_fusion.in_bounds-after

loop_dynamic_slice_fusion.in_bounds-after:        ; preds = %loop_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.in_bounds-true:         ; preds = %entry
  %constant_2 = load i64, ptr @0, align 8
  %13 = trunc i64 %constant_2 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 0, %15
  %dynamic-slice.2.1.start_idx0 = select i1 %16, i32 0, i32 %15
  %constant_21 = load i64, ptr @0, align 8
  %17 = trunc i64 %constant_21 to i32
  %18 = icmp sge i32 0, %17
  %19 = select i1 %18, i32 0, i32 %17
  %20 = icmp sle i32 0, %19
  %dynamic-slice.2.1.start_idx1 = select i1 %20, i32 0, i32 %19
  %constant_22 = load i64, ptr @0, align 8
  %21 = trunc i64 %constant_22 to i32
  %22 = icmp sge i32 0, %21
  %23 = select i1 %22, i32 0, i32 %21
  %24 = icmp sle i32 0, %23
  %dynamic-slice.2.1.start_idx2 = select i1 %24, i32 0, i32 %23
  %constant_23 = load i64, ptr @0, align 8
  %25 = trunc i64 %constant_23 to i32
  %26 = icmp sge i32 0, %25
  %27 = select i1 %26, i32 0, i32 %25
  %28 = icmp sle i32 0, %27
  %dynamic-slice.2.1.start_idx3 = select i1 %28, i32 0, i32 %27
  %29 = load i64, ptr %arg1, align 8, !invariant.load !4
  %30 = trunc i64 %29 to i32
  %31 = icmp sge i32 0, %30
  %32 = select i1 %31, i32 0, i32 %30
  %33 = icmp sle i32 1, %32
  %dynamic-slice.2.1.start_idx4 = select i1 %33, i32 1, i32 %32
  %34 = add i32 %dynamic-slice.2.1.start_idx0, %11
  %35 = add i32 %dynamic-slice.2.1.start_idx1, %10
  %36 = add i32 %dynamic-slice.2.1.start_idx2, %8
  %37 = add i32 %dynamic-slice.2.1.start_idx3, %6
  %38 = add i32 %dynamic-slice.2.1.start_idx4, %4
  %39 = getelementptr inbounds [24 x [1 x [4 x [192 x [2 x double]]]]], ptr %arg0, i32 0, i32 %34, i32 0, i32 %36, i32 %37, i32 %38
  %40 = load double, ptr %39, align 8, !invariant.load !4
  %41 = getelementptr double, ptr %arg2, i32 %linear_index
  %42 = getelementptr inbounds double, ptr %41, i32 0
  store double %40, ptr %42, align 8
  br label %loop_dynamic_slice_fusion.in_bounds-after
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

!0 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 128}
!2 = !{i32 0, i32 144}
!3 = !{i32 0, i32 128}
!4 = !{}
