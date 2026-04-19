; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 2
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = icmp ult i32 %linear_index, 2
  br i1 %6, label %loop_dynamic_slice_fusion.in_bounds-true, label %loop_dynamic_slice_fusion.in_bounds-after

loop_dynamic_slice_fusion.in_bounds-after:        ; preds = %loop_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.in_bounds-true:         ; preds = %entry
  %7 = load i64, ptr %arg1, align 8, !invariant.load !4
  %8 = trunc i64 %7 to i32
  %9 = icmp sge i32 0, %8
  %10 = select i1 %9, i32 0, i32 %8
  %11 = icmp sle i32 1, %10
  %dynamic-slice.2.1.start_idx0 = select i1 %11, i32 1, i32 %10
  %constant_2 = load i64, ptr @0, align 8
  %12 = trunc i64 %constant_2 to i32
  %13 = icmp sge i32 0, %12
  %14 = select i1 %13, i32 0, i32 %12
  %15 = icmp sle i32 0, %14
  %dynamic-slice.2.1.start_idx1 = select i1 %15, i32 0, i32 %14
  %16 = add i32 %dynamic-slice.2.1.start_idx0, %5
  %17 = add i32 %dynamic-slice.2.1.start_idx1, %4
  %18 = getelementptr inbounds [2 x [2 x i32]], ptr %arg0, i32 0, i32 %16, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !4
  %20 = getelementptr i32, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds i32, ptr %20, i32 0
  store i32 %19, ptr %21, align 4
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
!1 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 2}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 2}
!4 = !{}
