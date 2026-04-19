; ModuleID = 'jit_exp'
source_filename = "jit_exp"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_exponential(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(160) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %wrapped_exponential.in_bounds-true, label %wrapped_exponential.in_bounds-after

wrapped_exponential.in_bounds-after:              ; preds = %wrapped_exponential.in_bounds-true, %entry
  ret void

wrapped_exponential.in_bounds-true:               ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !7
  %8 = call double @__nv_exp(double %7)
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  store double %8, ptr %10, align 8
  br label %wrapped_exponential.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_multiply_fusion(ptr noalias align 16 dereferenceable(19200) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(19200) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %2 = mul nuw nsw i32 %0, 140
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !9
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
  br i1 %9, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %10 = getelementptr double, ptr %arg0, i32 %linear_index
  %11 = getelementptr inbounds double, ptr %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !7
  %13 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %row_index
  %14 = load double, ptr %13, align 8, !invariant.load !7
  %multiply.1.1 = fmul double %12, %14
  %15 = getelementptr double, ptr %arg2, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  store double %multiply.1.1, ptr %16, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4}

!0 = !{ptr @wrapped_exponential, !"kernel", i32 1}
!1 = !{ptr @wrapped_exponential, !"reqntidx", i32 20}
!2 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 20}
!4 = !{ptr @loop_multiply_fusion, !"reqntidy", i32 7}
!5 = !{i32 0, i32 1}
!6 = !{i32 0, i32 20}
!7 = !{}
!8 = !{i32 0, i32 18}
!9 = !{i32 0, i32 7}
