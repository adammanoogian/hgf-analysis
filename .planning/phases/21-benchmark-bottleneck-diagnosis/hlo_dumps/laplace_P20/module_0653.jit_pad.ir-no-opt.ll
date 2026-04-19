; ModuleID = 'jit_pad'
source_filename = "jit_pad"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_pad(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(960) %arg2) {
entry:
  %pad_result_addr = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 120
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 120
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 120
  %5 = udiv i32 %linear_index0, 120
  %6 = icmp ult i32 %linear_index, 120
  br i1 %6, label %wrapped_pad.in_bounds-true, label %wrapped_pad.in_bounds-after

wrapped_pad.in_bounds-after:                      ; preds = %in_bounds-after, %entry
  ret void

wrapped_pad.in_bounds-true:                       ; preds = %entry
  %7 = sub i32 %5, 0
  %8 = icmp sge i32 %7, 0
  %in_bounds = and i1 true, %8
  %9 = urem i32 %7, 1
  %10 = icmp eq i32 0, %9
  %in_bounds1 = and i1 %in_bounds, %10
  %11 = sdiv i32 %7, 1
  %12 = icmp slt i32 %11, 1
  %in_bounds2 = and i1 %in_bounds1, %12
  %13 = sub i32 %4, 80
  %14 = icmp sge i32 %13, 0
  %in_bounds3 = and i1 %in_bounds2, %14
  %15 = urem i32 %13, 1
  %16 = icmp eq i32 0, %15
  %in_bounds4 = and i1 %in_bounds3, %16
  %17 = sdiv i32 %13, 1
  %18 = icmp slt i32 %17, 20
  %in_bounds5 = and i1 %in_bounds4, %18
  br i1 %in_bounds5, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %19 = load double, ptr %pad_result_addr, align 8
  %20 = getelementptr double, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %19, ptr %21, align 8
  br label %wrapped_pad.in_bounds-after

in_bounds-true:                                   ; preds = %wrapped_pad.in_bounds-true
  %22 = getelementptr inbounds [1 x [20 x double]], ptr %arg0, i32 0, i32 0, i32 %17
  %23 = load double, ptr %22, align 8, !invariant.load !4
  store double %23, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %wrapped_pad.in_bounds-true
  %24 = load double, ptr %arg1, align 8, !invariant.load !4
  store double %24, ptr %pad_result_addr, align 8
  br label %in_bounds-after
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

!0 = !{ptr @wrapped_pad, !"kernel", i32 1}
!1 = !{ptr @wrapped_pad, !"reqntidx", i32 120}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 120}
!4 = !{}
