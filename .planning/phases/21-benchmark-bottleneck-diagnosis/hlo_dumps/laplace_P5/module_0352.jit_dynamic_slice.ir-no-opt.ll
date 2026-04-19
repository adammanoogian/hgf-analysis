; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_dynamic_slice(ptr noalias align 16 dereferenceable(192) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %wrapped_dynamic-slice.in_bounds-true, label %wrapped_dynamic-slice.in_bounds-after

wrapped_dynamic-slice.in_bounds-after:            ; preds = %wrapped_dynamic-slice.in_bounds-true, %entry
  ret void

wrapped_dynamic-slice.in_bounds-true:             ; preds = %entry
  %5 = load i64, ptr %arg1, align 8, !invariant.load !4
  %6 = trunc i64 %5 to i32
  %7 = icmp sge i32 0, %6
  %8 = select i1 %7, i32 0, i32 %6
  %9 = icmp sle i32 20, %8
  %dynamic-slice.1.1.start_idx0 = select i1 %9, i32 20, i32 %8
  %10 = add i32 %dynamic-slice.1.1.start_idx0, %3
  %11 = getelementptr inbounds [24 x double], ptr %arg0, i32 0, i32 %10
  %12 = load double, ptr %11, align 8, !invariant.load !4
  %13 = getelementptr double, ptr %arg2, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  store double %12, ptr %14, align 8
  br label %wrapped_dynamic-slice.in_bounds-after
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

!0 = !{ptr @wrapped_dynamic_slice, !"kernel", i32 1}
!1 = !{ptr @wrapped_dynamic_slice, !"reqntidx", i32 4}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 4}
!4 = !{}
