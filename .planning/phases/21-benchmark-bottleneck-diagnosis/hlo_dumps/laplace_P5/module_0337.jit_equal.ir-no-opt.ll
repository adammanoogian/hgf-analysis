; ModuleID = 'jit_equal'
source_filename = "jit_equal"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_compare(ptr noalias align 16 dereferenceable(4608) %arg0, ptr noalias align 16 dereferenceable(4608) %arg1, ptr noalias align 128 dereferenceable(576) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 576
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 576
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 24
  %5 = udiv i32 %linear_index0, 24
  %6 = icmp ult i32 %linear_index, 576
  br i1 %6, label %wrapped_compare.in_bounds-true, label %wrapped_compare.in_bounds-after

wrapped_compare.in_bounds-after:                  ; preds = %wrapped_compare.in_bounds-true, %entry
  ret void

wrapped_compare.in_bounds-true:                   ; preds = %entry
  %7 = getelementptr i64, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds i64, ptr %7, i32 0
  %9 = load i64, ptr %8, align 8, !invariant.load !4
  %10 = getelementptr i64, ptr %arg1, i32 %linear_index
  %11 = getelementptr inbounds i64, ptr %10, i32 0
  %12 = load i64, ptr %11, align 8, !invariant.load !4
  %13 = icmp eq i64 %9, %12
  %14 = zext i1 %13 to i8
  %15 = getelementptr i8, ptr %arg2, i32 %linear_index
  %16 = getelementptr inbounds i8, ptr %15, i32 0
  store i8 %14, ptr %16, align 1
  br label %wrapped_compare.in_bounds-after
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

!0 = !{ptr @wrapped_compare, !"kernel", i32 1}
!1 = !{ptr @wrapped_compare, !"reqntidx", i32 576}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 576}
!4 = !{}
