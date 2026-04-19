; ModuleID = 'jit_broadcast_in_dim'
source_filename = "jit_broadcast_in_dim"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_broadcast(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(384) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 48
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 48
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 48
  br i1 %4, label %wrapped_broadcast.in_bounds-true, label %wrapped_broadcast.in_bounds-after

wrapped_broadcast.in_bounds-after:                ; preds = %wrapped_broadcast.in_bounds-true, %entry
  ret void

wrapped_broadcast.in_bounds-true:                 ; preds = %entry
  %5 = load i64, ptr %arg0, align 8, !invariant.load !4
  %6 = getelementptr i64, ptr %arg1, i32 %linear_index
  %7 = getelementptr inbounds i64, ptr %6, i32 0
  store i64 %5, ptr %7, align 8
  br label %wrapped_broadcast.in_bounds-after
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

!0 = !{ptr @wrapped_broadcast, !"kernel", i32 1}
!1 = !{ptr @wrapped_broadcast, !"reqntidx", i32 48}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 48}
!4 = !{}
