; ModuleID = 'jit_broadcast_in_dim'
source_filename = "jit_broadcast_in_dim"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_broadcast(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(19200) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = mul nuw nsw i32 %0, 140
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !5
  %4 = mul nuw nsw i32 %3, 20
  %5 = add nuw nsw i32 %2, %4
  %linear_index = add nuw nsw i32 %5, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2520
  call void @llvm.assume(i1 %linear_index_in_range)
  %row_index = mul nuw nsw i32 %1, 1
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %6 = udiv i32 %linear_index0, 1
  %7 = urem i32 %6, 20
  %8 = udiv i32 %linear_index0, 20
  %9 = icmp ult i32 %linear_index, 2400
  br i1 %9, label %wrapped_broadcast.in_bounds-true, label %wrapped_broadcast.in_bounds-after

wrapped_broadcast.in_bounds-after:                ; preds = %wrapped_broadcast.in_bounds-true, %entry
  ret void

wrapped_broadcast.in_bounds-true:                 ; preds = %entry
  %10 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %row_index
  %11 = load double, ptr %10, align 8, !invariant.load !6
  %12 = getelementptr double, ptr %arg1, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  store double %11, ptr %13, align 8
  br label %wrapped_broadcast.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2}

!0 = !{ptr @wrapped_broadcast, !"kernel", i32 1}
!1 = !{ptr @wrapped_broadcast, !"reqntidx", i32 20}
!2 = !{ptr @wrapped_broadcast, !"reqntidy", i32 7}
!3 = !{i32 0, i32 18}
!4 = !{i32 0, i32 20}
!5 = !{i32 0, i32 7}
!6 = !{}
