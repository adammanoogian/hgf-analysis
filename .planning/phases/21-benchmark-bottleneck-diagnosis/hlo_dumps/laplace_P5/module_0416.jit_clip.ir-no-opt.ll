; ModuleID = 'jit_clip'
source_filename = "jit_clip"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@1 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@2 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_divide_minimum_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(6144) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(6144) %arg3, ptr noalias align 128 dereferenceable(6144) %arg4, ptr noalias align 128 dereferenceable(6144) %arg5) {
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
  br i1 %6, label %loop_divide_minimum_fusion.in_bounds-true, label %loop_divide_minimum_fusion.in_bounds-after

loop_divide_minimum_fusion.in_bounds-after:       ; preds = %loop_divide_minimum_fusion.in_bounds-true, %entry
  ret void

loop_divide_minimum_fusion.in_bounds-true:        ; preds = %entry
  %7 = load double, ptr %arg2, align 8, !invariant.load !6
  %8 = getelementptr double, ptr %arg1, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !6
  %11 = fcmp une double %7, %7
  %12 = fcmp oeq double %10, %10
  %13 = fcmp oge double %7, %10
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %maximum.1.3 = select i1 %15, double %7, double %10
  %16 = load double, ptr %arg0, align 8, !invariant.load !6
  %17 = fcmp une double %16, %16
  %18 = fcmp oeq double %maximum.1.3, %maximum.1.3
  %19 = fcmp ole double %16, %maximum.1.3
  %20 = and i1 %18, %19
  %21 = or i1 %17, %20
  %minimum.1.1.clone.1 = select i1 %21, double %16, double %maximum.1.3
  %compare.6.1 = fcmp oeq double %maximum.1.3, %minimum.1.1.clone.1
  %22 = zext i1 %compare.6.1 to i8
  %constant_9_2 = load double, ptr @0, align 8
  %constant_7_1 = load double, ptr @2, align 8
  %23 = trunc i8 %22 to i1
  %24 = select i1 %23, double %constant_9_2, double %constant_7_1
  %compare.7.1 = fcmp oeq double %16, %minimum.1.1.clone.1
  %25 = zext i1 %compare.7.1 to i8
  %constant_5_1 = load double, ptr @1, align 8
  %26 = trunc i8 %25 to i1
  %27 = select i1 %26, double %constant_5_1, double %constant_9_2
  %divide.3.1 = fdiv double %24, %27
  %28 = insertvalue { double, double, double } undef, double %divide.3.1, 0
  %29 = insertvalue { double, double, double } %28, double %minimum.1.1.clone.1, 1
  %30 = getelementptr double, ptr %arg1, i32 %linear_index
  %31 = getelementptr inbounds double, ptr %30, i32 0
  %32 = load double, ptr %31, align 8, !invariant.load !6
  %compare.4.1.clone.1 = fcmp oeq double %32, %maximum.1.3
  %33 = zext i1 %compare.4.1.clone.1 to i8
  %34 = trunc i8 %33 to i1
  %35 = select i1 %34, double %constant_9_2, double %constant_7_1
  %compare.5.1.clone.1 = fcmp oeq double %7, %maximum.1.3
  %36 = zext i1 %compare.5.1.clone.1 to i8
  %37 = trunc i8 %36 to i1
  %38 = select i1 %37, double %constant_5_1, double %constant_9_2
  %divide.2.1.clone.1 = fdiv double %35, %38
  %39 = insertvalue { double, double, double } %29, double %divide.2.1.clone.1, 2
  %40 = extractvalue { double, double, double } %39, 0
  %41 = getelementptr double, ptr %arg3, i32 %linear_index
  %42 = getelementptr inbounds double, ptr %41, i32 0
  store double %40, ptr %42, align 8
  %43 = extractvalue { double, double, double } %39, 1
  %44 = getelementptr double, ptr %arg4, i32 %linear_index
  %45 = getelementptr inbounds double, ptr %44, i32 0
  store double %43, ptr %45, align 8
  %46 = extractvalue { double, double, double } %39, 2
  %47 = getelementptr double, ptr %arg5, i32 %linear_index
  %48 = getelementptr inbounds double, ptr %47, i32 0
  store double %46, ptr %48, align 8
  br label %loop_divide_minimum_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_multiply_fusion(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 16 dereferenceable(147456) %arg2, ptr noalias align 128 dereferenceable(147456) %arg3) {
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
  br i1 %8, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %9 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr %arg2, i32 0, i32 %6, i32 %7, i32 %4
  %10 = load double, ptr %9, align 8, !invariant.load !6
  %11 = urem i32 %linear_index0, 768
  %12 = getelementptr inbounds double, ptr %arg1, i32 %11
  %13 = load double, ptr %12, align 8, !invariant.load !6
  %multiply.4.1 = fmul double %10, %13
  %14 = urem i32 %linear_index0, 768
  %15 = getelementptr inbounds double, ptr %arg0, i32 %14
  %16 = load double, ptr %15, align 8, !invariant.load !6
  %multiply.5.1 = fmul double %multiply.4.1, %16
  %17 = getelementptr double, ptr %arg3, i32 %linear_index
  %18 = getelementptr inbounds double, ptr %17, i32 0
  store double %multiply.5.1, ptr %18, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @loop_divide_minimum_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_divide_minimum_fusion, !"reqntidx", i32 768}
!2 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 1}
!5 = !{i32 0, i32 768}
!6 = !{}
!7 = !{i32 0, i32 144}
!8 = !{i32 0, i32 128}
