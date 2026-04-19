; ModuleID = 'jit_clip'
source_filename = "jit_clip"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_minimum_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_minimum_fusion.in_bounds-true, label %loop_minimum_fusion.in_bounds-after

loop_minimum_fusion.in_bounds-after:              ; preds = %loop_minimum_fusion.in_bounds-true, %entry
  ret void

loop_minimum_fusion.in_bounds-true:               ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !3
  %5 = load double, ptr %arg1, align 8, !invariant.load !3
  %6 = load double, ptr %arg2, align 8, !invariant.load !3
  %7 = fcmp une double %5, %5
  %8 = fcmp oeq double %6, %6
  %9 = fcmp oge double %5, %6
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %maximum.1.1 = select i1 %11, double %5, double %6
  %12 = fcmp une double %4, %4
  %13 = fcmp oeq double %maximum.1.1, %maximum.1.1
  %14 = fcmp ole double %4, %maximum.1.1
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %minimum.1.1 = select i1 %16, double %4, double %maximum.1.1
  store double %minimum.1.1, ptr %arg3, align 8
  br label %loop_minimum_fusion.in_bounds-after
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

!0 = !{ptr @loop_minimum_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_minimum_fusion, !"reqntidx", i32 1}
!2 = !{i32 0, i32 1}
!3 = !{}
