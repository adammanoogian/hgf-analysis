; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_add_fusion(ptr noalias align 16 dereferenceable(4608) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4608) %arg2) {
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
  br i1 %6, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %7 = getelementptr i64, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds i64, ptr %7, i32 0
  %9 = load i64, ptr %8, align 8, !invariant.load !4
  %10 = load i64, ptr %arg1, align 8, !invariant.load !4
  %11 = add i64 %9, %10
  %12 = getelementptr i64, ptr %arg2, i32 %linear_index
  %13 = getelementptr inbounds i64, ptr %12, i32 0
  store i64 %11, ptr %13, align 8
  br label %loop_add_fusion.in_bounds-after
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

!0 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_add_fusion, !"reqntidx", i32 576}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 576}
!4 = !{}
