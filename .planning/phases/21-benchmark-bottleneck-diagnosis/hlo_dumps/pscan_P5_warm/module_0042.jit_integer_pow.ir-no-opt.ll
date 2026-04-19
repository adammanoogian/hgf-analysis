; ModuleID = 'jit_integer_pow'
source_filename = "jit_integer_pow"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_multiply(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %wrapped_multiply.in_bounds-true, label %wrapped_multiply.in_bounds-after

wrapped_multiply.in_bounds-after:                 ; preds = %wrapped_multiply.in_bounds-true, %entry
  ret void

wrapped_multiply.in_bounds-true:                  ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !3
  %5 = load double, ptr %arg0, align 8, !invariant.load !3
  %multiply.1.1 = fmul double %4, %5
  store double %multiply.1.1, ptr %arg1, align 8
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
!1 = !{ptr @wrapped_multiply, !"reqntidx", i32 1}
!2 = !{i32 0, i32 1}
!3 = !{}
