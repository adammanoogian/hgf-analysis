; ModuleID = 'jit_exp'
source_filename = "jit_exp"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_multiply_fusion(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 20
  br i1 %6, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !6
  %10 = getelementptr double, ptr %arg1, i32 %linear_index
  %11 = getelementptr inbounds double, ptr %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !6
  %multiply.4.1 = fmul double %9, %12
  %13 = getelementptr double, ptr %arg2, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  store double %multiply.4.1, ptr %14, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_add_fusion(ptr noalias align 16 dereferenceable(19200) %arg0, ptr noalias align 16 dereferenceable(19200) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(19200) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index0, 20
  %8 = icmp ult i32 %linear_index, 2400
  br i1 %8, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !6
  %12 = getelementptr inbounds [20 x double], ptr %arg2, i32 0, i32 %4
  %13 = load double, ptr %12, align 8, !invariant.load !6
  %multiply.5.1 = fmul double %11, %13
  %14 = getelementptr inbounds [1 x [20 x double]], ptr %arg3, i32 0, i32 0, i32 %4
  %15 = load double, ptr %14, align 8, !invariant.load !6
  %16 = getelementptr double, ptr %arg0, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  %18 = load double, ptr %17, align 8, !invariant.load !6
  %multiply.6.1 = fmul double %15, %18
  %add.1.1 = fadd double %multiply.5.1, %multiply.6.1
  %19 = getelementptr double, ptr %arg4, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  store double %add.1.1, ptr %20, align 8
  br label %loop_add_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 20}
!2 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 1}
!5 = !{i32 0, i32 20}
!6 = !{}
!7 = !{i32 0, i32 19}
!8 = !{i32 0, i32 128}
