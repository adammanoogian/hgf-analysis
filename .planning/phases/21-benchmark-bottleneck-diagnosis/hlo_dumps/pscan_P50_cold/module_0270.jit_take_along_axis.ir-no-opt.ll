; ModuleID = 'jit_take_along_axis'
source_filename = "jit_take_along_axis"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@2 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@3 = private unnamed_addr constant [1 x i8] c"\01"
@4 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @input_concatenate_fusion(ptr noalias align 16 dereferenceable(36864) %arg0, ptr noalias align 128 dereferenceable(110592) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 9216
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index0, 1
  %8 = urem i32 %7, 192
  %9 = udiv i32 %linear_index0, 192
  %10 = icmp ult i32 %linear_index, 9216
  br i1 %10, label %input_concatenate_fusion.in_bounds-true, label %input_concatenate_fusion.in_bounds-after

input_concatenate_fusion.in_bounds-after:         ; preds = %input_concatenate_fusion.in_bounds-true, %entry
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %13 = mul nuw nsw i32 %11, 128
  %linear_index1 = add nuw nsw i32 %13, %12
  %linear_index_in_range2 = icmp ult i32 %linear_index1, 9216
  call void @llvm.assume(i1 %linear_index_in_range2)
  %linear_index03 = add nuw nsw i32 %linear_index1, 0
  %14 = udiv i32 %linear_index03, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %linear_index03, 1
  %17 = urem i32 %16, 1
  %18 = udiv i32 %linear_index03, 1
  %19 = urem i32 %18, 192
  %20 = udiv i32 %linear_index03, 192
  %21 = icmp ult i32 %linear_index1, 9216
  br i1 %21, label %input_concatenate_fusion.in_bounds-true4, label %input_concatenate_fusion.in_bounds-after5

input_concatenate_fusion.in_bounds-after5:        ; preds = %input_concatenate_fusion.in_bounds-true4, %input_concatenate_fusion.in_bounds-after
  %22 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %23 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %24 = mul nuw nsw i32 %22, 128
  %linear_index6 = add nuw nsw i32 %24, %23
  %linear_index_in_range7 = icmp ult i32 %linear_index6, 9216
  call void @llvm.assume(i1 %linear_index_in_range7)
  %linear_index08 = add nuw nsw i32 %linear_index6, 0
  %25 = udiv i32 %linear_index08, 1
  %26 = urem i32 %25, 1
  %27 = udiv i32 %linear_index08, 1
  %28 = urem i32 %27, 1
  %29 = udiv i32 %linear_index08, 1
  %30 = urem i32 %29, 192
  %31 = udiv i32 %linear_index08, 192
  %32 = icmp ult i32 %linear_index6, 9216
  br i1 %32, label %input_concatenate_fusion.in_bounds-true9, label %input_concatenate_fusion.in_bounds-after10

input_concatenate_fusion.in_bounds-after10:       ; preds = %input_concatenate_fusion.in_bounds-true9, %input_concatenate_fusion.in_bounds-after5
  ret void

input_concatenate_fusion.in_bounds-true:          ; preds = %entry
  %33 = add i32 %4, 0
  %34 = mul nuw nsw i32 %9, 1
  %35 = add nuw nsw i32 0, %34
  %36 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %9, i32 %8, i32 0, i32 %33
  store i32 %35, ptr %36, align 4
  br label %input_concatenate_fusion.in_bounds-after

input_concatenate_fusion.in_bounds-true4:         ; preds = %input_concatenate_fusion.in_bounds-after
  %37 = add i32 %15, 1
  %38 = mul nuw nsw i32 %19, 1
  %39 = add nuw nsw i32 0, %38
  %40 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %20, i32 %19, i32 0, i32 %37
  store i32 %39, ptr %40, align 4
  br label %input_concatenate_fusion.in_bounds-after5

input_concatenate_fusion.in_bounds-true9:         ; preds = %input_concatenate_fusion.in_bounds-after5
  %41 = add i32 %26, 2
  %42 = getelementptr i32, ptr %arg0, i32 %linear_index6
  %43 = getelementptr inbounds i32, ptr %42, i32 0
  %44 = load i32, ptr %43, align 4, !invariant.load !6
  %constant_13_1 = load i32, ptr @1, align 4
  %45 = icmp slt i32 %44, %constant_13_1
  %46 = zext i1 %45 to i8
  %constant_11_1 = load i32, ptr @0, align 4
  %47 = add i32 %44, %constant_11_1
  %48 = trunc i8 %46 to i1
  %49 = select i1 %48, i32 %47, i32 %44
  %50 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %31, i32 %30, i32 0, i32 %41
  store i32 %49, ptr %50, align 4
  br label %input_concatenate_fusion.in_bounds-after10
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_select_fusion(ptr noalias align 16 dereferenceable(147456) %arg0, ptr noalias align 128 dereferenceable(110592) %arg1, ptr noalias align 128 dereferenceable(24) %arg2, ptr noalias align 128 dereferenceable(73728) %arg3) {
entry:
  %return_buffer = alloca i8, align 1
  %parameter_buffer1 = alloca i8, align 1
  %parameter_buffer = alloca i8, align 1
  %reduce.4.inner.invar_address.reduction_dim.2 = alloca i32, align 4
  %accumulator_0 = alloca i8, align 1
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 9216
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 192
  %8 = icmp ult i32 %linear_index, 9216
  br i1 %8, label %loop_select_fusion.in_bounds-true, label %loop_select_fusion.in_bounds-after

loop_select_fusion.in_bounds-after:               ; preds = %reduce.4.inner.loop_exit.reduction_dim.2, %entry
  ret void

loop_select_fusion.in_bounds-true:                ; preds = %entry
  %constant_15_1 = load i8, ptr @3, align 1
  store i8 %constant_15_1, ptr %accumulator_0, align 1
  store i32 0, ptr %reduce.4.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.4.inner.loop_header.reduction_dim.2

reduce.4.inner.loop_header.reduction_dim.2:       ; preds = %reduce.4.inner.loop_body.reduction_dim.2, %loop_select_fusion.in_bounds-true
  %reduce.4.inner.indvar.reduction_dim.2 = load i32, ptr %reduce.4.inner.invar_address.reduction_dim.2, align 4
  %9 = icmp uge i32 %reduce.4.inner.indvar.reduction_dim.2, 3
  br i1 %9, label %reduce.4.inner.loop_exit.reduction_dim.2, label %reduce.4.inner.loop_body.reduction_dim.2

reduce.4.inner.loop_body.reduction_dim.2:         ; preds = %reduce.4.inner.loop_header.reduction_dim.2
  %10 = load i8, ptr %accumulator_0, align 1
  %11 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %7, i32 %6, i32 0, i32 %reduce.4.inner.indvar.reduction_dim.2
  %12 = load i32, ptr %11, align 4, !invariant.load !6
  %13 = sext i32 %12 to i64
  %constant_5_1 = load i64, ptr @4, align 8
  %14 = icmp sge i64 %13, %constant_5_1
  %15 = zext i1 %14 to i8
  %16 = getelementptr inbounds [3 x i64], ptr %arg2, i32 0, i32 %reduce.4.inner.indvar.reduction_dim.2
  %17 = load i64, ptr %16, align 8, !invariant.load !6
  %18 = icmp sle i64 %13, %17
  %19 = zext i1 %18 to i8
  %20 = and i8 %15, %19
  store i8 %10, ptr %parameter_buffer, align 1
  store i8 %20, ptr %parameter_buffer1, align 1
  call void @region_0_37_55889f591450_9e15c39609a871f9(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %21 = load i8, ptr %return_buffer, align 1
  store i8 %21, ptr %accumulator_0, align 1
  %invar.inc = add nuw nsw i32 %reduce.4.inner.indvar.reduction_dim.2, 1
  store i32 %invar.inc, ptr %reduce.4.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.4.inner.loop_header.reduction_dim.2

reduce.4.inner.loop_exit.reduction_dim.2:         ; preds = %reduce.4.inner.loop_header.reduction_dim.2
  %22 = load i8, ptr %accumulator_0, align 1
  %23 = mul nuw nsw i32 %4, 1
  %24 = add nuw nsw i32 0, %23
  %25 = udiv i32 %24, 1
  %26 = mul nuw nsw i32 %6, 1
  %27 = add nuw nsw i32 0, %26
  %28 = mul nuw nsw i32 %7, 192
  %29 = add nuw nsw i32 %27, %28
  %30 = udiv i32 %29, 9216
  %31 = mul nuw nsw i32 %29, 1
  %32 = add nuw nsw i32 0, %31
  %33 = urem i32 %32, 192
  %34 = udiv i32 %32, 192
  %35 = udiv i32 %34, 48
  %36 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %34, i32 %33, i32 0, i32 0
  %37 = load i32, ptr %36, align 4, !invariant.load !6
  %38 = sext i32 %37 to i64
  %39 = icmp sge i64 0, %38
  %40 = select i1 %39, i64 0, i64 %38
  %41 = icmp sle i64 47, %40
  %42 = select i1 %41, i64 47, i64 %40
  %43 = trunc i64 %42 to i32
  %44 = add i32 0, %43
  %45 = mul nuw nsw i32 %29, 1
  %46 = add nuw nsw i32 0, %45
  %47 = urem i32 %46, 192
  %48 = udiv i32 %46, 192
  %49 = udiv i32 %48, 48
  %50 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %48, i32 %47, i32 0, i32 1
  %51 = load i32, ptr %50, align 4, !invariant.load !6
  %52 = sext i32 %51 to i64
  %53 = icmp sge i64 0, %52
  %54 = select i1 %53, i64 0, i64 %52
  %55 = icmp sle i64 191, %54
  %56 = select i1 %55, i64 191, i64 %54
  %57 = trunc i64 %56 to i32
  %58 = add i32 0, %57
  %59 = mul nuw nsw i32 %29, 1
  %60 = add nuw nsw i32 0, %59
  %61 = urem i32 %60, 192
  %62 = udiv i32 %60, 192
  %63 = udiv i32 %62, 48
  %64 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %62, i32 %61, i32 0, i32 2
  %65 = load i32, ptr %64, align 4, !invariant.load !6
  %66 = sext i32 %65 to i64
  %67 = icmp sge i64 0, %66
  %68 = select i1 %67, i64 0, i64 %66
  %69 = icmp sle i64 1, %68
  %70 = select i1 %69, i64 1, i64 %68
  %71 = trunc i64 %70 to i32
  %72 = add i32 0, %71
  %73 = getelementptr inbounds [48 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %44, i32 %58, i32 %72
  %74 = load double, ptr %73, align 8, !invariant.load !6
  %constant_3_1 = load double, ptr @2, align 8
  %75 = trunc i8 %22 to i1
  %76 = select i1 %75, double %74, double %constant_3_1
  %77 = getelementptr double, ptr %arg3, i32 %linear_index
  %78 = getelementptr inbounds double, ptr %77, i32 0
  store double %76, ptr %78, align 8
  br label %loop_select_fusion.in_bounds-after
}

define internal void @region_0_37_55889f591450_9e15c39609a871f9(ptr dereferenceable(1) %0, ptr dereferenceable(1) %1, ptr dereferenceable(1) %output_arg) {
entry:
  %2 = alloca i8, align 1
  %Arg_0.38 = load i8, ptr %0, align 1
  %Arg_1.39 = load i8, ptr %1, align 1
  %3 = and i8 %Arg_0.38, %Arg_1.39
  store i8 %3, ptr %2, align 1
  %load_ret_value = load i8, ptr %2, align 1
  store i8 %load_ret_value, ptr %output_arg, align 1
  ret void
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!1 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_select_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 72}
!5 = !{i32 0, i32 128}
!6 = !{}
