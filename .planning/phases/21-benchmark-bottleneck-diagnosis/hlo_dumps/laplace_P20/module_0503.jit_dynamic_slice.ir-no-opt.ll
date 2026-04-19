; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(61440) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2) {
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
  %8 = urem i32 %7, 20
  %9 = udiv i32 %linear_index0, 3840
  %10 = icmp ult i32 %linear_index, 3840
  br i1 %10, label %loop_dynamic_slice_fusion.in_bounds-true, label %loop_dynamic_slice_fusion.in_bounds-after

loop_dynamic_slice_fusion.in_bounds-after:        ; preds = %loop_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.in_bounds-true:         ; preds = %entry
  %constant_2 = load i64, ptr @0, align 8
  %11 = trunc i64 %constant_2 to i32
  %12 = icmp sge i32 0, %11
  %13 = select i1 %12, i32 0, i32 %11
  %14 = icmp sle i32 0, %13
  %dynamic-slice.2.1.start_idx0 = select i1 %14, i32 0, i32 %13
  %constant_21 = load i64, ptr @0, align 8
  %15 = trunc i64 %constant_21 to i32
  %16 = icmp sge i32 0, %15
  %17 = select i1 %16, i32 0, i32 %15
  %18 = icmp sle i32 0, %17
  %dynamic-slice.2.1.start_idx1 = select i1 %18, i32 0, i32 %17
  %constant_22 = load i64, ptr @0, align 8
  %19 = trunc i64 %constant_22 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 0, %21
  %dynamic-slice.2.1.start_idx2 = select i1 %22, i32 0, i32 %21
  %23 = load i64, ptr %arg1, align 8, !invariant.load !4
  %24 = trunc i64 %23 to i32
  %25 = icmp sge i32 0, %24
  %26 = select i1 %25, i32 0, i32 %24
  %27 = icmp sle i32 1, %26
  %dynamic-slice.2.1.start_idx3 = select i1 %27, i32 1, i32 %26
  %28 = add i32 %dynamic-slice.2.1.start_idx0, %9
  %29 = add i32 %dynamic-slice.2.1.start_idx1, %8
  %30 = add i32 %dynamic-slice.2.1.start_idx2, %6
  %31 = add i32 %dynamic-slice.2.1.start_idx3, %4
  %32 = getelementptr inbounds [1 x [20 x [192 x [2 x double]]]], ptr %arg0, i32 0, i32 0, i32 %29, i32 %30, i32 %31
  %33 = load double, ptr %32, align 8, !invariant.load !4
  %34 = getelementptr double, ptr %arg2, i32 %linear_index
  %35 = getelementptr inbounds double, ptr %34, i32 0
  store double %33, ptr %35, align 8
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
!2 = !{i32 0, i32 30}
!3 = !{i32 0, i32 128}
!4 = !{}
