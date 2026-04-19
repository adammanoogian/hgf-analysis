; ModuleID = 'jit_convert_element_type'
source_filename = "jit_convert_element_type"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_convert(ptr noalias align 16 dereferenceable(3072) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 768
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %wrapped_convert.in_bounds-true, label %wrapped_convert.in_bounds-after

wrapped_convert.in_bounds-after:                  ; preds = %wrapped_convert.in_bounds-true, %entry
  ret void

wrapped_convert.in_bounds-true:                   ; preds = %entry
  %7 = getelementptr i32, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds i32, ptr %7, i32 0
  %9 = load i32, ptr %8, align 4, !invariant.load !4
  %10 = sitofp i32 %9 to double
  %11 = getelementptr double, ptr %arg1, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  store double %10, ptr %12, align 8
  br label %wrapped_convert.in_bounds-after
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

!0 = !{ptr @wrapped_convert, !"kernel", i32 1}
!1 = !{ptr @wrapped_convert, !"reqntidx", i32 768}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 768}
!4 = !{}
