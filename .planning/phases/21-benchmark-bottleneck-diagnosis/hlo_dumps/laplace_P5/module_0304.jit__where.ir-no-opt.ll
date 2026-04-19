; ModuleID = 'jit__where'
source_filename = "jit__where"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_select_fusion(ptr noalias align 16 dereferenceable(320) %arg0, ptr noalias align 16 dereferenceable(320) %arg1, ptr noalias align 16 dereferenceable(1) %arg2, ptr noalias align 128 dereferenceable(320) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 40
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 40
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 40
  br i1 %6, label %loop_select_fusion.in_bounds-true, label %loop_select_fusion.in_bounds-after

loop_select_fusion.in_bounds-after:               ; preds = %loop_select_fusion.in_bounds-true, %entry
  ret void

loop_select_fusion.in_bounds-true:                ; preds = %entry
  %7 = load i8, ptr %arg2, align 1, !invariant.load !4
  %8 = getelementptr double, ptr %arg0, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !4
  %11 = getelementptr double, ptr %arg1, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !4
  %14 = trunc i8 %7 to i1
  %15 = select i1 %14, double %10, double %13
  %16 = getelementptr double, ptr %arg3, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  store double %15, ptr %17, align 8
  br label %loop_select_fusion.in_bounds-after
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

!0 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_select_fusion, !"reqntidx", i32 40}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 40}
!4 = !{}
