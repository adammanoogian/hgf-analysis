; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(12288) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 192
  %8 = icmp ult i32 %linear_index, 768
  br i1 %8, label %loop_dynamic_slice_fusion.in_bounds-true, label %loop_dynamic_slice_fusion.in_bounds-after

loop_dynamic_slice_fusion.in_bounds-after:        ; preds = %loop_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.in_bounds-true:         ; preds = %entry
  %constant_2 = load i64, ptr @0, align 8
  %9 = trunc i64 %constant_2 to i32
  %10 = icmp sge i32 0, %9
  %11 = select i1 %10, i32 0, i32 %9
  %12 = icmp sle i32 0, %11
  %dynamic-slice.2.1.start_idx0 = select i1 %12, i32 0, i32 %11
  %constant_21 = load i64, ptr @0, align 8
  %13 = trunc i64 %constant_21 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 0, %15
  %dynamic-slice.2.1.start_idx1 = select i1 %16, i32 0, i32 %15
  %17 = load i64, ptr %arg1, align 8, !invariant.load !4
  %18 = trunc i64 %17 to i32
  %19 = icmp sge i32 0, %18
  %20 = select i1 %19, i32 0, i32 %18
  %21 = icmp sle i32 1, %20
  %dynamic-slice.2.1.start_idx2 = select i1 %21, i32 1, i32 %20
  %22 = add i32 %dynamic-slice.2.1.start_idx0, %7
  %23 = add i32 %dynamic-slice.2.1.start_idx1, %6
  %24 = add i32 %dynamic-slice.2.1.start_idx2, %4
  %25 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %22, i32 %23, i32 %24
  %26 = load double, ptr %25, align 8, !invariant.load !4
  %27 = getelementptr double, ptr %arg2, i32 %linear_index
  %28 = getelementptr inbounds double, ptr %27, i32 0
  store double %26, ptr %28, align 8
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
!2 = !{i32 0, i32 6}
!3 = !{i32 0, i32 128}
!4 = !{}
