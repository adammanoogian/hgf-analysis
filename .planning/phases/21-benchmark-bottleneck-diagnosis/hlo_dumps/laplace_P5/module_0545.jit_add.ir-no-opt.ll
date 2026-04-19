; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_add(ptr noalias align 16 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(147456) %arg1, ptr noalias align 128 dereferenceable(147456) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 18432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 768
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index0, 768
  %10 = icmp ult i32 %linear_index, 18432
  br i1 %10, label %wrapped_add.in_bounds-true, label %wrapped_add.in_bounds-after

wrapped_add.in_bounds-after:                      ; preds = %wrapped_add.in_bounds-true, %entry
  ret void

wrapped_add.in_bounds-true:                       ; preds = %entry
  %11 = getelementptr double, ptr %arg0, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !4
  %14 = getelementptr double, ptr %arg1, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !4
  %add.1.1 = fadd double %13, %16
  %17 = getelementptr double, ptr %arg2, i32 %linear_index
  %18 = getelementptr inbounds double, ptr %17, i32 0
  store double %add.1.1, ptr %18, align 8
  br label %wrapped_add.in_bounds-after
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

!0 = !{ptr @wrapped_add, !"kernel", i32 1}
!1 = !{ptr @wrapped_add, !"reqntidx", i32 1024}
!2 = !{i32 0, i32 18}
!3 = !{i32 0, i32 1024}
!4 = !{}
