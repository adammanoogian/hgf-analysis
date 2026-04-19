; ModuleID = 'jit_pad'
source_filename = "jit_pad"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_pad(ptr noalias align 16 dereferenceable(19200) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(115200) %arg2) {
entry:
  %pad_result_addr = alloca double, align 8
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
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index0, 120
  %8 = icmp ult i32 %linear_index, 14400
  br i1 %8, label %wrapped_pad.in_bounds-true, label %wrapped_pad.in_bounds-after

wrapped_pad.in_bounds-after:                      ; preds = %in_bounds-after, %entry
  ret void

wrapped_pad.in_bounds-true:                       ; preds = %entry
  %9 = sub i32 %7, 0
  %10 = icmp sge i32 %9, 0
  %in_bounds = and i1 true, %10
  %11 = urem i32 %9, 1
  %12 = icmp eq i32 0, %11
  %in_bounds1 = and i1 %in_bounds, %12
  %13 = sdiv i32 %9, 1
  %14 = icmp slt i32 %13, 120
  %in_bounds2 = and i1 %in_bounds1, %14
  %15 = sub i32 %6, 0
  %16 = icmp sge i32 %15, 0
  %in_bounds3 = and i1 %in_bounds2, %16
  %17 = urem i32 %15, 1
  %18 = icmp eq i32 0, %17
  %in_bounds4 = and i1 %in_bounds3, %18
  %19 = sdiv i32 %15, 1
  %20 = icmp slt i32 %19, 1
  %in_bounds5 = and i1 %in_bounds4, %20
  %21 = sub i32 %4, 60
  %22 = icmp sge i32 %21, 0
  %in_bounds6 = and i1 %in_bounds5, %22
  %23 = urem i32 %21, 1
  %24 = icmp eq i32 0, %23
  %in_bounds7 = and i1 %in_bounds6, %24
  %25 = sdiv i32 %21, 1
  %26 = icmp slt i32 %25, 20
  %in_bounds8 = and i1 %in_bounds7, %26
  br i1 %in_bounds8, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %27 = load double, ptr %pad_result_addr, align 8
  %28 = getelementptr double, ptr %arg2, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  br label %wrapped_pad.in_bounds-after

in_bounds-true:                                   ; preds = %wrapped_pad.in_bounds-true
  %30 = getelementptr inbounds [120 x [1 x [20 x double]]], ptr %arg0, i32 0, i32 %13, i32 0, i32 %25
  %31 = load double, ptr %30, align 8, !invariant.load !4
  store double %31, ptr %pad_result_addr, align 8
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %wrapped_pad.in_bounds-true
  %32 = load double, ptr %arg1, align 8, !invariant.load !4
  store double %32, ptr %pad_result_addr, align 8
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
!1 = !{ptr @wrapped_pad, !"reqntidx", i32 128}
!2 = !{i32 0, i32 113}
!3 = !{i32 0, i32 128}
!4 = !{}
