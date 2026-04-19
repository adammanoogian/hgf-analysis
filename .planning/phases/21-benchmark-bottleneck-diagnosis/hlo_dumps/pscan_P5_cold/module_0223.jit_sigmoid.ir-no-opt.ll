; ModuleID = 'jit_sigmoid'
source_filename = "jit_sigmoid"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_multiply(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 768
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %wrapped_multiply.in_bounds-true, label %wrapped_multiply.in_bounds-after

wrapped_multiply.in_bounds-after:                 ; preds = %wrapped_multiply.in_bounds-true, %entry
  ret void

wrapped_multiply.in_bounds-true:                  ; preds = %entry
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !4
  %10 = getelementptr double, ptr %arg1, i32 %linear_index
  %11 = getelementptr inbounds double, ptr %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !4
  %multiply.1.1 = fmul double %9, %12
  %13 = getelementptr double, ptr %arg2, i32 %linear_index
  %14 = getelementptr inbounds double, ptr %13, i32 0
  store double %multiply.1.1, ptr %14, align 8
  br label %wrapped_multiply.in_bounds-after
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

!0 = !{ptr @wrapped_multiply, !"kernel", i32 1}
!1 = !{ptr @wrapped_multiply, !"reqntidx", i32 768}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 768}
!4 = !{}
