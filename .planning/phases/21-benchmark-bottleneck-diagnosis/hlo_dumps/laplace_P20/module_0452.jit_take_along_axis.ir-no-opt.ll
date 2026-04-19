; ModuleID = 'jit_take_along_axis'
source_filename = "jit_take_along_axis"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"\02\00\00\00"
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@2 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@3 = private unnamed_addr constant [1 x i8] c"\01"
@4 = private unnamed_addr constant [8 x i8] zeroinitializer
@5 = private unnamed_addr constant [8 x i8] zeroinitializer
@6 = private unnamed_addr constant [1 x i8] c"\01"
@7 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @input_concatenate_fusion(ptr noalias align 16 dereferenceable(15360) %arg0, ptr noalias align 128 dereferenceable(46080) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index0, 1
  %8 = urem i32 %7, 192
  %9 = udiv i32 %linear_index0, 192
  %10 = icmp ult i32 %linear_index, 3840
  br i1 %10, label %input_concatenate_fusion.in_bounds-true, label %input_concatenate_fusion.in_bounds-after

input_concatenate_fusion.in_bounds-after:         ; preds = %input_concatenate_fusion.in_bounds-true, %entry
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %13 = mul nuw nsw i32 %11, 128
  %linear_index1 = add nuw nsw i32 %13, %12
  %linear_index_in_range2 = icmp ult i32 %linear_index1, 3840
  call void @llvm.assume(i1 %linear_index_in_range2)
  %linear_index03 = add nuw nsw i32 %linear_index1, 0
  %14 = udiv i32 %linear_index03, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %linear_index03, 1
  %17 = urem i32 %16, 1
  %18 = udiv i32 %linear_index03, 1
  %19 = urem i32 %18, 192
  %20 = udiv i32 %linear_index03, 192
  %21 = icmp ult i32 %linear_index1, 3840
  br i1 %21, label %input_concatenate_fusion.in_bounds-true4, label %input_concatenate_fusion.in_bounds-after5

input_concatenate_fusion.in_bounds-after5:        ; preds = %input_concatenate_fusion.in_bounds-true4, %input_concatenate_fusion.in_bounds-after
  %22 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %23 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %24 = mul nuw nsw i32 %22, 128
  %linear_index6 = add nuw nsw i32 %24, %23
  %linear_index_in_range7 = icmp ult i32 %linear_index6, 3840
  call void @llvm.assume(i1 %linear_index_in_range7)
  %linear_index08 = add nuw nsw i32 %linear_index6, 0
  %25 = udiv i32 %linear_index08, 1
  %26 = urem i32 %25, 1
  %27 = udiv i32 %linear_index08, 1
  %28 = urem i32 %27, 1
  %29 = udiv i32 %linear_index08, 1
  %30 = urem i32 %29, 192
  %31 = udiv i32 %linear_index08, 192
  %32 = icmp ult i32 %linear_index6, 3840
  br i1 %32, label %input_concatenate_fusion.in_bounds-true9, label %input_concatenate_fusion.in_bounds-after10

input_concatenate_fusion.in_bounds-after10:       ; preds = %input_concatenate_fusion.in_bounds-true9, %input_concatenate_fusion.in_bounds-after5
  ret void

input_concatenate_fusion.in_bounds-true:          ; preds = %entry
  %33 = add i32 %4, 0
  %34 = mul nuw nsw i32 %9, 1
  %35 = add nuw nsw i32 0, %34
  %36 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %9, i32 %8, i32 0, i32 %33
  store i32 %35, ptr %36, align 4
  br label %input_concatenate_fusion.in_bounds-after

input_concatenate_fusion.in_bounds-true4:         ; preds = %input_concatenate_fusion.in_bounds-after
  %37 = add i32 %15, 1
  %38 = mul nuw nsw i32 %19, 1
  %39 = add nuw nsw i32 0, %38
  %40 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %20, i32 %19, i32 0, i32 %37
  store i32 %39, ptr %40, align 4
  br label %input_concatenate_fusion.in_bounds-after5

input_concatenate_fusion.in_bounds-true9:         ; preds = %input_concatenate_fusion.in_bounds-after5
  %41 = add i32 %26, 2
  %42 = getelementptr i32, ptr %arg0, i32 %linear_index6
  %43 = getelementptr inbounds i32, ptr %42, i32 0
  %44 = load i32, ptr %43, align 4, !invariant.load !8
  %constant_19_1 = load i32, ptr @1, align 4
  %45 = icmp slt i32 %44, %constant_19_1
  %46 = zext i1 %45 to i8
  %constant_17_1 = load i32, ptr @0, align 4
  %47 = add i32 %44, %constant_17_1
  %48 = trunc i8 %46 to i1
  %49 = select i1 %48, i32 %47, i32 %44
  %50 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %31, i32 %30, i32 0, i32 %41
  store i32 %49, ptr %50, align 4
  br label %input_concatenate_fusion.in_bounds-after10
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_select_fusion(ptr noalias align 16 dereferenceable(61440) %arg0, ptr noalias align 128 dereferenceable(46080) %arg1, ptr noalias align 128 dereferenceable(24) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3) {
entry:
  %return_buffer = alloca i8, align 1
  %parameter_buffer1 = alloca i8, align 1
  %parameter_buffer = alloca i8, align 1
  %reduce.4.inner.invar_address.reduction_dim.2 = alloca i32, align 4
  %accumulator_0 = alloca i8, align 1
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 192
  %8 = icmp ult i32 %linear_index, 3840
  br i1 %8, label %loop_select_fusion.in_bounds-true, label %loop_select_fusion.in_bounds-after

loop_select_fusion.in_bounds-after:               ; preds = %reduce.4.inner.loop_exit.reduction_dim.2, %entry
  ret void

loop_select_fusion.in_bounds-true:                ; preds = %entry
  %constant_21_2 = load i8, ptr @3, align 1
  store i8 %constant_21_2, ptr %accumulator_0, align 1
  store i32 0, ptr %reduce.4.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.4.inner.loop_header.reduction_dim.2

reduce.4.inner.loop_header.reduction_dim.2:       ; preds = %reduce.4.inner.loop_body.reduction_dim.2, %loop_select_fusion.in_bounds-true
  %reduce.4.inner.indvar.reduction_dim.2 = load i32, ptr %reduce.4.inner.invar_address.reduction_dim.2, align 4
  %9 = icmp uge i32 %reduce.4.inner.indvar.reduction_dim.2, 3
  br i1 %9, label %reduce.4.inner.loop_exit.reduction_dim.2, label %reduce.4.inner.loop_body.reduction_dim.2

reduce.4.inner.loop_body.reduction_dim.2:         ; preds = %reduce.4.inner.loop_header.reduction_dim.2
  %10 = load i8, ptr %accumulator_0, align 1
  %11 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %7, i32 %6, i32 0, i32 %reduce.4.inner.indvar.reduction_dim.2
  %12 = load i32, ptr %11, align 4, !invariant.load !8
  %13 = sext i32 %12 to i64
  %constant_11_1 = load i64, ptr @4, align 8
  %14 = icmp sge i64 %13, %constant_11_1
  %15 = zext i1 %14 to i8
  %16 = getelementptr inbounds [3 x i64], ptr %arg2, i32 0, i32 %reduce.4.inner.indvar.reduction_dim.2
  %17 = load i64, ptr %16, align 8, !invariant.load !8
  %18 = icmp sle i64 %13, %17
  %19 = zext i1 %18 to i8
  %20 = and i8 %15, %19
  store i8 %10, ptr %parameter_buffer, align 1
  store i8 %20, ptr %parameter_buffer1, align 1
  call void @region_0_43_560107b771e0_7b687ac0855e3bbb(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
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
  %30 = udiv i32 %29, 3840
  %31 = mul nuw nsw i32 %29, 1
  %32 = add nuw nsw i32 0, %31
  %33 = urem i32 %32, 192
  %34 = udiv i32 %32, 192
  %35 = udiv i32 %34, 20
  %36 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %34, i32 %33, i32 0, i32 0
  %37 = load i32, ptr %36, align 4, !invariant.load !8
  %38 = sext i32 %37 to i64
  %39 = icmp sge i64 0, %38
  %40 = select i1 %39, i64 0, i64 %38
  %41 = icmp sle i64 19, %40
  %42 = select i1 %41, i64 19, i64 %40
  %43 = trunc i64 %42 to i32
  %44 = add i32 0, %43
  %45 = mul nuw nsw i32 %29, 1
  %46 = add nuw nsw i32 0, %45
  %47 = urem i32 %46, 192
  %48 = udiv i32 %46, 192
  %49 = udiv i32 %48, 20
  %50 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %48, i32 %47, i32 0, i32 1
  %51 = load i32, ptr %50, align 4, !invariant.load !8
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
  %63 = udiv i32 %62, 20
  %64 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %62, i32 %61, i32 0, i32 2
  %65 = load i32, ptr %64, align 4, !invariant.load !8
  %66 = sext i32 %65 to i64
  %67 = icmp sge i64 0, %66
  %68 = select i1 %67, i64 0, i64 %66
  %69 = icmp sle i64 1, %68
  %70 = select i1 %69, i64 1, i64 %68
  %71 = trunc i64 %70 to i32
  %72 = add i32 0, %71
  %73 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %44, i32 %58, i32 %72
  %74 = load double, ptr %73, align 8, !invariant.load !8
  %constant_9_1 = load double, ptr @2, align 8
  %75 = trunc i8 %22 to i1
  %76 = select i1 %75, double %74, double %constant_9_1
  %77 = getelementptr double, ptr %arg3, i32 %linear_index
  %78 = getelementptr inbounds double, ptr %77, i32 0
  store double %76, ptr %78, align 8
  br label %loop_select_fusion.in_bounds-after
}

define internal void @region_0_43_560107b771e0_7b687ac0855e3bbb(ptr dereferenceable(1) %0, ptr dereferenceable(1) %1, ptr dereferenceable(1) %output_arg) {
entry:
  %2 = alloca i8, align 1
  %Arg_0.44 = load i8, ptr %0, align 1
  %Arg_1.45 = load i8, ptr %1, align 1
  %3 = and i8 %Arg_0.44, %Arg_1.45
  store i8 %3, ptr %2, align 1
  %load_ret_value = load i8, ptr %2, align 1
  store i8 %load_ret_value, ptr %output_arg, align 1
  ret void
}

define void @loop_select_fusion_1(ptr noalias align 16 dereferenceable(7372800) %arg0, ptr noalias align 128 dereferenceable(46080) %arg1, ptr noalias align 128 dereferenceable(24) %arg2, ptr noalias align 128 dereferenceable(3686400) %arg3) {
entry:
  %return_buffer39 = alloca i8, align 1
  %parameter_buffer38 = alloca i8, align 1
  %parameter_buffer37 = alloca i8, align 1
  %reduce.6.inner.invar_address.reduction_dim.233 = alloca i32, align 4
  %accumulator_028 = alloca i8, align 1
  %return_buffer26 = alloca i8, align 1
  %parameter_buffer25 = alloca i8, align 1
  %parameter_buffer24 = alloca i8, align 1
  %reduce.6.inner.invar_address.reduction_dim.220 = alloca i32, align 4
  %accumulator_015 = alloca i8, align 1
  %return_buffer13 = alloca i8, align 1
  %parameter_buffer12 = alloca i8, align 1
  %parameter_buffer11 = alloca i8, align 1
  %reduce.6.inner.invar_address.reduction_dim.27 = alloca i32, align 4
  %accumulator_02 = alloca i8, align 1
  %return_buffer = alloca i8, align 1
  %parameter_buffer1 = alloca i8, align 1
  %parameter_buffer = alloca i8, align 1
  %reduce.6.inner.invar_address.reduction_dim.2 = alloca i32, align 4
  %accumulator_0 = alloca i8, align 1
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 115200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index0 = add nuw nsw i32 %linear_index_base, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 192
  %8 = urem i32 %7, 20
  %9 = udiv i32 %linear_index0, 3840
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 1
  %12 = udiv i32 %linear_index1, 1
  %13 = urem i32 %12, 192
  %14 = udiv i32 %linear_index1, 192
  %15 = urem i32 %14, 20
  %16 = udiv i32 %linear_index1, 3840
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 1
  %19 = udiv i32 %linear_index2, 1
  %20 = urem i32 %19, 192
  %21 = udiv i32 %linear_index2, 192
  %22 = urem i32 %21, 20
  %23 = udiv i32 %linear_index2, 3840
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 1
  %26 = udiv i32 %linear_index3, 1
  %27 = urem i32 %26, 192
  %28 = udiv i32 %linear_index3, 192
  %29 = urem i32 %28, 20
  %30 = udiv i32 %linear_index3, 3840
  %31 = icmp ult i32 %linear_index_base, 460800
  br i1 %31, label %loop_select_fusion.1.in_bounds-true, label %loop_select_fusion.1.in_bounds-after

loop_select_fusion.1.in_bounds-after:             ; preds = %reduce.6.inner.loop_exit.reduction_dim.230, %entry
  ret void

loop_select_fusion.1.in_bounds-true:              ; preds = %entry
  %32 = urem i32 %linear_index0, 3840
  %constant_21_1 = load i8, ptr @6, align 1
  store i8 %constant_21_1, ptr %accumulator_0, align 1
  store i32 0, ptr %reduce.6.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.6.inner.loop_header.reduction_dim.2

reduce.6.inner.loop_header.reduction_dim.2:       ; preds = %reduce.6.inner.loop_body.reduction_dim.2, %loop_select_fusion.1.in_bounds-true
  %reduce.6.inner.indvar.reduction_dim.2 = load i32, ptr %reduce.6.inner.invar_address.reduction_dim.2, align 4
  %33 = icmp uge i32 %reduce.6.inner.indvar.reduction_dim.2, 3
  br i1 %33, label %reduce.6.inner.loop_exit.reduction_dim.2, label %reduce.6.inner.loop_body.reduction_dim.2

reduce.6.inner.loop_body.reduction_dim.2:         ; preds = %reduce.6.inner.loop_header.reduction_dim.2
  %34 = load i8, ptr %accumulator_0, align 1
  %35 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %8, i32 %6, i32 0, i32 %reduce.6.inner.indvar.reduction_dim.2
  %36 = load i32, ptr %35, align 4, !invariant.load !8
  %37 = sext i32 %36 to i64
  %constant_11_2 = load i64, ptr @7, align 8
  %38 = icmp sge i64 %37, %constant_11_2
  %39 = zext i1 %38 to i8
  %40 = getelementptr inbounds [3 x i64], ptr %arg2, i32 0, i32 %reduce.6.inner.indvar.reduction_dim.2
  %41 = load i64, ptr %40, align 8, !invariant.load !8
  %42 = icmp sle i64 %37, %41
  %43 = zext i1 %42 to i8
  %44 = and i8 %39, %43
  store i8 %34, ptr %parameter_buffer, align 1
  store i8 %44, ptr %parameter_buffer1, align 1
  call void @region_0_43_560107b771e0_7b687ac0855e3bbb(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %45 = load i8, ptr %return_buffer, align 1
  store i8 %45, ptr %accumulator_0, align 1
  %invar.inc = add nuw nsw i32 %reduce.6.inner.indvar.reduction_dim.2, 1
  store i32 %invar.inc, ptr %reduce.6.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.6.inner.loop_header.reduction_dim.2

reduce.6.inner.loop_exit.reduction_dim.2:         ; preds = %reduce.6.inner.loop_header.reduction_dim.2
  %46 = load i8, ptr %accumulator_0, align 1
  %47 = mul nuw nsw i32 %4, 1
  %48 = add nuw nsw i32 0, %47
  %49 = mul nuw nsw i32 %6, 1
  %50 = add nuw nsw i32 0, %49
  %51 = mul nuw nsw i32 %8, 192
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 3840
  %54 = mul nuw nsw i32 %9, 1
  %55 = add nuw nsw i32 0, %54
  %56 = udiv i32 %55, 120
  %57 = mul nuw nsw i32 %52, 1
  %58 = add nuw nsw i32 0, %57
  %59 = urem i32 %58, 192
  %60 = udiv i32 %58, 192
  %61 = udiv i32 %60, 20
  %62 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %60, i32 %59, i32 0, i32 0
  %63 = load i32, ptr %62, align 4, !invariant.load !8
  %64 = sext i32 %63 to i64
  %65 = icmp sge i64 0, %64
  %66 = select i1 %65, i64 0, i64 %64
  %67 = icmp sle i64 19, %66
  %68 = select i1 %67, i64 19, i64 %66
  %69 = trunc i64 %68 to i32
  %70 = add i32 0, %69
  %71 = mul nuw nsw i32 %52, 1
  %72 = add nuw nsw i32 0, %71
  %73 = urem i32 %72, 192
  %74 = udiv i32 %72, 192
  %75 = udiv i32 %74, 20
  %76 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %74, i32 %73, i32 0, i32 1
  %77 = load i32, ptr %76, align 4, !invariant.load !8
  %78 = sext i32 %77 to i64
  %79 = icmp sge i64 0, %78
  %80 = select i1 %79, i64 0, i64 %78
  %81 = icmp sle i64 191, %80
  %82 = select i1 %81, i64 191, i64 %80
  %83 = trunc i64 %82 to i32
  %84 = add i32 0, %83
  %85 = mul nuw nsw i32 %52, 1
  %86 = add nuw nsw i32 0, %85
  %87 = urem i32 %86, 192
  %88 = udiv i32 %86, 192
  %89 = udiv i32 %88, 20
  %90 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %88, i32 %87, i32 0, i32 2
  %91 = load i32, ptr %90, align 4, !invariant.load !8
  %92 = sext i32 %91 to i64
  %93 = icmp sge i64 0, %92
  %94 = select i1 %93, i64 0, i64 %92
  %95 = icmp sle i64 1, %94
  %96 = select i1 %95, i64 1, i64 %94
  %97 = trunc i64 %96 to i32
  %98 = add i32 0, %97
  %99 = getelementptr inbounds [120 x [20 x [192 x [2 x double]]]], ptr %arg0, i32 0, i32 %55, i32 %70, i32 %84, i32 %98
  %100 = load double, ptr %99, align 8, !invariant.load !8
  %constant_4_1 = load double, ptr @5, align 8
  %101 = trunc i8 %46 to i1
  %102 = select i1 %101, double %100, double %constant_4_1
  %103 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %104 = getelementptr inbounds double, ptr %103, i32 0
  store double %102, ptr %104, align 8
  %105 = urem i32 %linear_index1, 3840
  %constant_21_13 = load i8, ptr @6, align 1
  store i8 %constant_21_13, ptr %accumulator_02, align 1
  store i32 0, ptr %reduce.6.inner.invar_address.reduction_dim.27, align 4
  br label %reduce.6.inner.loop_header.reduction_dim.25

reduce.6.inner.loop_header.reduction_dim.25:      ; preds = %reduce.6.inner.loop_body.reduction_dim.26, %reduce.6.inner.loop_exit.reduction_dim.2
  %reduce.6.inner.indvar.reduction_dim.28 = load i32, ptr %reduce.6.inner.invar_address.reduction_dim.27, align 4
  %106 = icmp uge i32 %reduce.6.inner.indvar.reduction_dim.28, 3
  br i1 %106, label %reduce.6.inner.loop_exit.reduction_dim.24, label %reduce.6.inner.loop_body.reduction_dim.26

reduce.6.inner.loop_body.reduction_dim.26:        ; preds = %reduce.6.inner.loop_header.reduction_dim.25
  %107 = load i8, ptr %accumulator_02, align 1
  %108 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %15, i32 %13, i32 0, i32 %reduce.6.inner.indvar.reduction_dim.28
  %109 = load i32, ptr %108, align 4, !invariant.load !8
  %110 = sext i32 %109 to i64
  %constant_11_210 = load i64, ptr @7, align 8
  %111 = icmp sge i64 %110, %constant_11_210
  %112 = zext i1 %111 to i8
  %113 = getelementptr inbounds [3 x i64], ptr %arg2, i32 0, i32 %reduce.6.inner.indvar.reduction_dim.28
  %114 = load i64, ptr %113, align 8, !invariant.load !8
  %115 = icmp sle i64 %110, %114
  %116 = zext i1 %115 to i8
  %117 = and i8 %112, %116
  store i8 %107, ptr %parameter_buffer11, align 1
  store i8 %117, ptr %parameter_buffer12, align 1
  call void @region_0_43_560107b771e0_7b687ac0855e3bbb(ptr %parameter_buffer11, ptr %parameter_buffer12, ptr %return_buffer13)
  %118 = load i8, ptr %return_buffer13, align 1
  store i8 %118, ptr %accumulator_02, align 1
  %invar.inc9 = add nuw nsw i32 %reduce.6.inner.indvar.reduction_dim.28, 1
  store i32 %invar.inc9, ptr %reduce.6.inner.invar_address.reduction_dim.27, align 4
  br label %reduce.6.inner.loop_header.reduction_dim.25

reduce.6.inner.loop_exit.reduction_dim.24:        ; preds = %reduce.6.inner.loop_header.reduction_dim.25
  %119 = load i8, ptr %accumulator_02, align 1
  %120 = mul nuw nsw i32 %11, 1
  %121 = add nuw nsw i32 0, %120
  %122 = mul nuw nsw i32 %13, 1
  %123 = add nuw nsw i32 0, %122
  %124 = mul nuw nsw i32 %15, 192
  %125 = add nuw nsw i32 %123, %124
  %126 = udiv i32 %125, 3840
  %127 = mul nuw nsw i32 %16, 1
  %128 = add nuw nsw i32 0, %127
  %129 = udiv i32 %128, 120
  %130 = mul nuw nsw i32 %125, 1
  %131 = add nuw nsw i32 0, %130
  %132 = urem i32 %131, 192
  %133 = udiv i32 %131, 192
  %134 = udiv i32 %133, 20
  %135 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %133, i32 %132, i32 0, i32 0
  %136 = load i32, ptr %135, align 4, !invariant.load !8
  %137 = sext i32 %136 to i64
  %138 = icmp sge i64 0, %137
  %139 = select i1 %138, i64 0, i64 %137
  %140 = icmp sle i64 19, %139
  %141 = select i1 %140, i64 19, i64 %139
  %142 = trunc i64 %141 to i32
  %143 = add i32 0, %142
  %144 = mul nuw nsw i32 %125, 1
  %145 = add nuw nsw i32 0, %144
  %146 = urem i32 %145, 192
  %147 = udiv i32 %145, 192
  %148 = udiv i32 %147, 20
  %149 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %147, i32 %146, i32 0, i32 1
  %150 = load i32, ptr %149, align 4, !invariant.load !8
  %151 = sext i32 %150 to i64
  %152 = icmp sge i64 0, %151
  %153 = select i1 %152, i64 0, i64 %151
  %154 = icmp sle i64 191, %153
  %155 = select i1 %154, i64 191, i64 %153
  %156 = trunc i64 %155 to i32
  %157 = add i32 0, %156
  %158 = mul nuw nsw i32 %125, 1
  %159 = add nuw nsw i32 0, %158
  %160 = urem i32 %159, 192
  %161 = udiv i32 %159, 192
  %162 = udiv i32 %161, 20
  %163 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %161, i32 %160, i32 0, i32 2
  %164 = load i32, ptr %163, align 4, !invariant.load !8
  %165 = sext i32 %164 to i64
  %166 = icmp sge i64 0, %165
  %167 = select i1 %166, i64 0, i64 %165
  %168 = icmp sle i64 1, %167
  %169 = select i1 %168, i64 1, i64 %167
  %170 = trunc i64 %169 to i32
  %171 = add i32 0, %170
  %172 = getelementptr inbounds [120 x [20 x [192 x [2 x double]]]], ptr %arg0, i32 0, i32 %128, i32 %143, i32 %157, i32 %171
  %173 = load double, ptr %172, align 8, !invariant.load !8
  %constant_4_114 = load double, ptr @5, align 8
  %174 = trunc i8 %119 to i1
  %175 = select i1 %174, double %173, double %constant_4_114
  %176 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %177 = getelementptr inbounds double, ptr %176, i32 1
  store double %175, ptr %177, align 8
  %178 = urem i32 %linear_index2, 3840
  %constant_21_116 = load i8, ptr @6, align 1
  store i8 %constant_21_116, ptr %accumulator_015, align 1
  store i32 0, ptr %reduce.6.inner.invar_address.reduction_dim.220, align 4
  br label %reduce.6.inner.loop_header.reduction_dim.218

reduce.6.inner.loop_header.reduction_dim.218:     ; preds = %reduce.6.inner.loop_body.reduction_dim.219, %reduce.6.inner.loop_exit.reduction_dim.24
  %reduce.6.inner.indvar.reduction_dim.221 = load i32, ptr %reduce.6.inner.invar_address.reduction_dim.220, align 4
  %179 = icmp uge i32 %reduce.6.inner.indvar.reduction_dim.221, 3
  br i1 %179, label %reduce.6.inner.loop_exit.reduction_dim.217, label %reduce.6.inner.loop_body.reduction_dim.219

reduce.6.inner.loop_body.reduction_dim.219:       ; preds = %reduce.6.inner.loop_header.reduction_dim.218
  %180 = load i8, ptr %accumulator_015, align 1
  %181 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %22, i32 %20, i32 0, i32 %reduce.6.inner.indvar.reduction_dim.221
  %182 = load i32, ptr %181, align 4, !invariant.load !8
  %183 = sext i32 %182 to i64
  %constant_11_223 = load i64, ptr @7, align 8
  %184 = icmp sge i64 %183, %constant_11_223
  %185 = zext i1 %184 to i8
  %186 = getelementptr inbounds [3 x i64], ptr %arg2, i32 0, i32 %reduce.6.inner.indvar.reduction_dim.221
  %187 = load i64, ptr %186, align 8, !invariant.load !8
  %188 = icmp sle i64 %183, %187
  %189 = zext i1 %188 to i8
  %190 = and i8 %185, %189
  store i8 %180, ptr %parameter_buffer24, align 1
  store i8 %190, ptr %parameter_buffer25, align 1
  call void @region_0_43_560107b771e0_7b687ac0855e3bbb(ptr %parameter_buffer24, ptr %parameter_buffer25, ptr %return_buffer26)
  %191 = load i8, ptr %return_buffer26, align 1
  store i8 %191, ptr %accumulator_015, align 1
  %invar.inc22 = add nuw nsw i32 %reduce.6.inner.indvar.reduction_dim.221, 1
  store i32 %invar.inc22, ptr %reduce.6.inner.invar_address.reduction_dim.220, align 4
  br label %reduce.6.inner.loop_header.reduction_dim.218

reduce.6.inner.loop_exit.reduction_dim.217:       ; preds = %reduce.6.inner.loop_header.reduction_dim.218
  %192 = load i8, ptr %accumulator_015, align 1
  %193 = mul nuw nsw i32 %18, 1
  %194 = add nuw nsw i32 0, %193
  %195 = mul nuw nsw i32 %20, 1
  %196 = add nuw nsw i32 0, %195
  %197 = mul nuw nsw i32 %22, 192
  %198 = add nuw nsw i32 %196, %197
  %199 = udiv i32 %198, 3840
  %200 = mul nuw nsw i32 %23, 1
  %201 = add nuw nsw i32 0, %200
  %202 = udiv i32 %201, 120
  %203 = mul nuw nsw i32 %198, 1
  %204 = add nuw nsw i32 0, %203
  %205 = urem i32 %204, 192
  %206 = udiv i32 %204, 192
  %207 = udiv i32 %206, 20
  %208 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %206, i32 %205, i32 0, i32 0
  %209 = load i32, ptr %208, align 4, !invariant.load !8
  %210 = sext i32 %209 to i64
  %211 = icmp sge i64 0, %210
  %212 = select i1 %211, i64 0, i64 %210
  %213 = icmp sle i64 19, %212
  %214 = select i1 %213, i64 19, i64 %212
  %215 = trunc i64 %214 to i32
  %216 = add i32 0, %215
  %217 = mul nuw nsw i32 %198, 1
  %218 = add nuw nsw i32 0, %217
  %219 = urem i32 %218, 192
  %220 = udiv i32 %218, 192
  %221 = udiv i32 %220, 20
  %222 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %220, i32 %219, i32 0, i32 1
  %223 = load i32, ptr %222, align 4, !invariant.load !8
  %224 = sext i32 %223 to i64
  %225 = icmp sge i64 0, %224
  %226 = select i1 %225, i64 0, i64 %224
  %227 = icmp sle i64 191, %226
  %228 = select i1 %227, i64 191, i64 %226
  %229 = trunc i64 %228 to i32
  %230 = add i32 0, %229
  %231 = mul nuw nsw i32 %198, 1
  %232 = add nuw nsw i32 0, %231
  %233 = urem i32 %232, 192
  %234 = udiv i32 %232, 192
  %235 = udiv i32 %234, 20
  %236 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %234, i32 %233, i32 0, i32 2
  %237 = load i32, ptr %236, align 4, !invariant.load !8
  %238 = sext i32 %237 to i64
  %239 = icmp sge i64 0, %238
  %240 = select i1 %239, i64 0, i64 %238
  %241 = icmp sle i64 1, %240
  %242 = select i1 %241, i64 1, i64 %240
  %243 = trunc i64 %242 to i32
  %244 = add i32 0, %243
  %245 = getelementptr inbounds [120 x [20 x [192 x [2 x double]]]], ptr %arg0, i32 0, i32 %201, i32 %216, i32 %230, i32 %244
  %246 = load double, ptr %245, align 8, !invariant.load !8
  %constant_4_127 = load double, ptr @5, align 8
  %247 = trunc i8 %192 to i1
  %248 = select i1 %247, double %246, double %constant_4_127
  %249 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %250 = getelementptr inbounds double, ptr %249, i32 2
  store double %248, ptr %250, align 8
  %251 = urem i32 %linear_index3, 3840
  %constant_21_129 = load i8, ptr @6, align 1
  store i8 %constant_21_129, ptr %accumulator_028, align 1
  store i32 0, ptr %reduce.6.inner.invar_address.reduction_dim.233, align 4
  br label %reduce.6.inner.loop_header.reduction_dim.231

reduce.6.inner.loop_header.reduction_dim.231:     ; preds = %reduce.6.inner.loop_body.reduction_dim.232, %reduce.6.inner.loop_exit.reduction_dim.217
  %reduce.6.inner.indvar.reduction_dim.234 = load i32, ptr %reduce.6.inner.invar_address.reduction_dim.233, align 4
  %252 = icmp uge i32 %reduce.6.inner.indvar.reduction_dim.234, 3
  br i1 %252, label %reduce.6.inner.loop_exit.reduction_dim.230, label %reduce.6.inner.loop_body.reduction_dim.232

reduce.6.inner.loop_body.reduction_dim.232:       ; preds = %reduce.6.inner.loop_header.reduction_dim.231
  %253 = load i8, ptr %accumulator_028, align 1
  %254 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %29, i32 %27, i32 0, i32 %reduce.6.inner.indvar.reduction_dim.234
  %255 = load i32, ptr %254, align 4, !invariant.load !8
  %256 = sext i32 %255 to i64
  %constant_11_236 = load i64, ptr @7, align 8
  %257 = icmp sge i64 %256, %constant_11_236
  %258 = zext i1 %257 to i8
  %259 = getelementptr inbounds [3 x i64], ptr %arg2, i32 0, i32 %reduce.6.inner.indvar.reduction_dim.234
  %260 = load i64, ptr %259, align 8, !invariant.load !8
  %261 = icmp sle i64 %256, %260
  %262 = zext i1 %261 to i8
  %263 = and i8 %258, %262
  store i8 %253, ptr %parameter_buffer37, align 1
  store i8 %263, ptr %parameter_buffer38, align 1
  call void @region_0_43_560107b771e0_7b687ac0855e3bbb(ptr %parameter_buffer37, ptr %parameter_buffer38, ptr %return_buffer39)
  %264 = load i8, ptr %return_buffer39, align 1
  store i8 %264, ptr %accumulator_028, align 1
  %invar.inc35 = add nuw nsw i32 %reduce.6.inner.indvar.reduction_dim.234, 1
  store i32 %invar.inc35, ptr %reduce.6.inner.invar_address.reduction_dim.233, align 4
  br label %reduce.6.inner.loop_header.reduction_dim.231

reduce.6.inner.loop_exit.reduction_dim.230:       ; preds = %reduce.6.inner.loop_header.reduction_dim.231
  %265 = load i8, ptr %accumulator_028, align 1
  %266 = mul nuw nsw i32 %25, 1
  %267 = add nuw nsw i32 0, %266
  %268 = mul nuw nsw i32 %27, 1
  %269 = add nuw nsw i32 0, %268
  %270 = mul nuw nsw i32 %29, 192
  %271 = add nuw nsw i32 %269, %270
  %272 = udiv i32 %271, 3840
  %273 = mul nuw nsw i32 %30, 1
  %274 = add nuw nsw i32 0, %273
  %275 = udiv i32 %274, 120
  %276 = mul nuw nsw i32 %271, 1
  %277 = add nuw nsw i32 0, %276
  %278 = urem i32 %277, 192
  %279 = udiv i32 %277, 192
  %280 = udiv i32 %279, 20
  %281 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %279, i32 %278, i32 0, i32 0
  %282 = load i32, ptr %281, align 4, !invariant.load !8
  %283 = sext i32 %282 to i64
  %284 = icmp sge i64 0, %283
  %285 = select i1 %284, i64 0, i64 %283
  %286 = icmp sle i64 19, %285
  %287 = select i1 %286, i64 19, i64 %285
  %288 = trunc i64 %287 to i32
  %289 = add i32 0, %288
  %290 = mul nuw nsw i32 %271, 1
  %291 = add nuw nsw i32 0, %290
  %292 = urem i32 %291, 192
  %293 = udiv i32 %291, 192
  %294 = udiv i32 %293, 20
  %295 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %293, i32 %292, i32 0, i32 1
  %296 = load i32, ptr %295, align 4, !invariant.load !8
  %297 = sext i32 %296 to i64
  %298 = icmp sge i64 0, %297
  %299 = select i1 %298, i64 0, i64 %297
  %300 = icmp sle i64 191, %299
  %301 = select i1 %300, i64 191, i64 %299
  %302 = trunc i64 %301 to i32
  %303 = add i32 0, %302
  %304 = mul nuw nsw i32 %271, 1
  %305 = add nuw nsw i32 0, %304
  %306 = urem i32 %305, 192
  %307 = udiv i32 %305, 192
  %308 = udiv i32 %307, 20
  %309 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr %arg1, i32 0, i32 %307, i32 %306, i32 0, i32 2
  %310 = load i32, ptr %309, align 4, !invariant.load !8
  %311 = sext i32 %310 to i64
  %312 = icmp sge i64 0, %311
  %313 = select i1 %312, i64 0, i64 %311
  %314 = icmp sle i64 1, %313
  %315 = select i1 %314, i64 1, i64 %313
  %316 = trunc i64 %315 to i32
  %317 = add i32 0, %316
  %318 = getelementptr inbounds [120 x [20 x [192 x [2 x double]]]], ptr %arg0, i32 0, i32 %274, i32 %289, i32 %303, i32 %317
  %319 = load double, ptr %318, align 8, !invariant.load !8
  %constant_4_140 = load double, ptr @5, align 8
  %320 = trunc i8 %265 to i1
  %321 = select i1 %320, double %319, double %constant_4_140
  %322 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %323 = getelementptr inbounds double, ptr %322, i32 3
  store double %321, ptr %323, align 8
  br label %loop_select_fusion.1.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}

!0 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!1 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_select_fusion, !"reqntidx", i32 128}
!4 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!5 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 128}
!6 = !{i32 0, i32 30}
!7 = !{i32 0, i32 128}
!8 = !{}
!9 = !{i32 0, i32 900}
