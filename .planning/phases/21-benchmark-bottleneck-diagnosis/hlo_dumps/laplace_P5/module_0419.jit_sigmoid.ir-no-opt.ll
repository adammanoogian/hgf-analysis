; ModuleID = 'jit_sigmoid'
source_filename = "jit_sigmoid"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@1 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"

define void @loop_divide_multiply_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 768
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %loop_divide_multiply_fusion.in_bounds-true, label %loop_divide_multiply_fusion.in_bounds-after

loop_divide_multiply_fusion.in_bounds-after:      ; preds = %loop_divide_multiply_fusion.in_bounds-true, %entry
  ret void

loop_divide_multiply_fusion.in_bounds-true:       ; preds = %entry
  %constant_3_3 = load double, ptr @0, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !6
  %10 = fneg double %9
  %11 = call double @__nv_exp(double %10)
  %add.2.1.clone.1 = fadd double %11, %constant_3_3
  %divide.1.1.clone.1 = fdiv double %constant_3_3, %add.2.1.clone.1
  %subtract.1.2 = fsub double %constant_3_3, %divide.1.1.clone.1
  %multiply.4.1 = fmul double %divide.1.1.clone.1, %subtract.1.2
  %12 = insertvalue { double, double } undef, double %multiply.4.1, 0
  %13 = insertvalue { double, double } %12, double %divide.1.1.clone.1, 1
  %14 = extractvalue { double, double } %13, 0
  %15 = getelementptr double, ptr %arg1, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  store double %14, ptr %16, align 8
  %17 = extractvalue { double, double } %13, 1
  %18 = getelementptr double, ptr %arg2, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  store double %17, ptr %19, align 8
  br label %loop_divide_multiply_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_add_multiply_fusion(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(147456) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2, ptr noalias align 128 dereferenceable(147456) %arg3, ptr noalias align 128 dereferenceable(147456) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 18432
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 768
  %8 = icmp ult i32 %linear_index, 18432
  br i1 %8, label %loop_add_multiply_fusion.in_bounds-true, label %loop_add_multiply_fusion.in_bounds-after

loop_add_multiply_fusion.in_bounds-after:         ; preds = %loop_add_multiply_fusion.in_bounds-true, %entry
  ret void

loop_add_multiply_fusion.in_bounds-true:          ; preds = %entry
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !6
  %12 = urem i32 %linear_index0, 768
  %13 = getelementptr inbounds double, ptr %arg2, i32 %12
  %14 = load double, ptr %13, align 8, !invariant.load !6
  %multiply.5.1.clone.1 = fmul double %11, %14
  %15 = urem i32 %linear_index0, 768
  %constant_3_1 = load double, ptr @1, align 8
  %16 = getelementptr inbounds double, ptr %arg0, i32 %15
  %17 = load double, ptr %16, align 8, !invariant.load !6
  %subtract.1.4 = fsub double %constant_3_1, %17
  %multiply.6.1 = fmul double %multiply.5.1.clone.1, %subtract.1.4
  %18 = urem i32 %linear_index0, 768
  %19 = getelementptr inbounds double, ptr %arg0, i32 %18
  %20 = load double, ptr %19, align 8, !invariant.load !6
  %21 = fneg double %multiply.5.1.clone.1
  %multiply.7.3 = fmul double %20, %21
  %add.3.1 = fadd double %multiply.6.1, %multiply.7.3
  %22 = insertvalue { double, double } undef, double %add.3.1, 0
  %23 = insertvalue { double, double } %22, double %multiply.5.1.clone.1, 1
  %24 = extractvalue { double, double } %23, 0
  %25 = getelementptr double, ptr %arg3, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  store double %24, ptr %26, align 8
  %27 = extractvalue { double, double } %23, 1
  %28 = getelementptr double, ptr %arg4, i32 %linear_index
  %29 = getelementptr inbounds double, ptr %28, i32 0
  store double %27, ptr %29, align 8
  br label %loop_add_multiply_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @loop_divide_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 768}
!2 = !{ptr @loop_add_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_multiply_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 1}
!5 = !{i32 0, i32 768}
!6 = !{}
!7 = !{i32 0, i32 144}
!8 = !{i32 0, i32 128}
