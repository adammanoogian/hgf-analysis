; ModuleID = 'jit_broadcast_in_dim'
source_filename = "jit_broadcast_in_dim"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_broadcast_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = icmp ult i32 %linear_index, 4
  br i1 %6, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %7 = getelementptr inbounds [1 x double], ptr %arg0, i32 0, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !4
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  store double %8, ptr %10, align 8
  br label %loop_broadcast_fusion.in_bounds-after
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

!0 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 4}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 4}
!4 = !{}
