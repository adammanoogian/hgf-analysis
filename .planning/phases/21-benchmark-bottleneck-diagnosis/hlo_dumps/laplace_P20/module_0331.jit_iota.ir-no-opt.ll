; ModuleID = 'jit_iota'
source_filename = "jit_iota"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_iota(ptr noalias align 128 dereferenceable(115200) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 14464
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 120
  %5 = udiv i32 %linear_index0, 120
  %6 = icmp ult i32 %linear_index, 14400
  br i1 %6, label %wrapped_iota.in_bounds-true, label %wrapped_iota.in_bounds-after

wrapped_iota.in_bounds-after:                     ; preds = %wrapped_iota.in_bounds-true, %entry
  ret void

wrapped_iota.in_bounds-true:                      ; preds = %entry
  %7 = mul nuw nsw i32 %5, 1
  %8 = add nuw nsw i32 0, %7
  %9 = zext i32 %8 to i64
  %10 = getelementptr i64, ptr %arg0, i32 %linear_index
  %11 = getelementptr inbounds i64, ptr %10, i32 0
  store i64 %9, ptr %11, align 8
  br label %wrapped_iota.in_bounds-after
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

!0 = !{ptr @wrapped_iota, !"kernel", i32 1}
!1 = !{ptr @wrapped_iota, !"reqntidx", i32 128}
!2 = !{i32 0, i32 113}
!3 = !{i32 0, i32 128}
