; ModuleID = 'jit_log_softmax'
source_filename = "jit_log_softmax"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\FF"
@1 = private unnamed_addr constant [8 x i8] zeroinitializer
@2 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @input_reduce_fusion(ptr noalias align 16 dereferenceable(12288) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1) {
entry:
  %return_buffer4 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !10
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_6_1 = load double, ptr @0, align 8
  store double %constant_6_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %1 = udiv i32 %thread.id.x, 2
  %thread.id.1 = urem i32 %1, 128
  %thread.id.2 = urem i32 %thread.id.x, 2
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 6
  %6 = udiv i32 %block.id.x, 6
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 128
  %tile_origin.2 = mul i32 %3, 2
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %7 = icmp uge i32 %loop1.indvar, 128
  br i1 %7, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 128
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %8 = icmp uge i32 %loop2.indvar, 2
  br i1 %8, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 2
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %9 = add i32 %loop2.indvar, %thread.id.2
  %10 = icmp ult i32 %9, 2
  br i1 %10, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !13

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !16

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result3 = load double, ptr %partial_reduction_result, align 8
  %11 = bitcast double %partial_reduction_result3 to i64
  %12 = bitcast i64 %11 to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %15 = insertelement <2 x i32> %12, i32 %14, i64 0
  %16 = extractelement <2 x i32> %15, i64 1
  %17 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %16, i32 1, i32 31)
  %18 = insertelement <2 x i32> %15, i32 %17, i64 1
  %19 = bitcast <2 x i32> %18 to i64
  %20 = bitcast i64 %19 to double
  store double %20, ptr %result_from_other_lane, align 8
  call void @region_0_7_55fe7b85e510_ad09387049906ee1(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer4)
  %21 = load double, ptr %return_buffer4, align 8
  store double %21, ptr %partial_reduction_result, align 8
  %22 = udiv i32 %thread.id.2, 32
  %23 = icmp ult i32 %thread.id.1, 128
  br i1 %23, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %24 = add i32 %tile_origin.0, 0
  %25 = add i32 %tile_origin.1, %loop1.indvar
  %26 = add i32 %tile_origin.2, %9
  %27 = mul nuw nsw i32 %26, 1
  %28 = add nuw nsw i32 0, %27
  %29 = udiv i32 %28, 2
  %30 = mul nuw nsw i32 %25, 1
  %31 = add nuw nsw i32 0, %30
  %32 = urem i32 %31, 192
  %33 = udiv i32 %31, 192
  %34 = udiv i32 %33, 4
  %35 = mul nuw nsw i32 %24, 1
  %36 = add nuw nsw i32 0, %35
  %param_0.25 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %33, i32 %32, i32 %28
  %param_0.252 = load double, ptr %param_0.25, align 8, !invariant.load !17
  store double %param_0.252, ptr %reduction_input_address, align 8
  call void @region_0_7_55fe7b85e510_ad09387049906ee1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %37 = load double, ptr %return_buffer, align 8
  store double %37, ptr %partial_reduction_result, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %38 = and i32 %thread.id.2, 1
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %40 = add i32 %tile_origin.1, %thread.id.1
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = urem i32 %42, 192
  %44 = udiv i32 %42, 192
  %45 = udiv i32 %44, 4
  %output_element_address = getelementptr inbounds [4 x [192 x double]], ptr %arg1, i32 0, i32 %44, i32 %43
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_7_55fe7b85e510_ad09387049906ee1(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.8 = load double, ptr %0, align 8
  %Arg_1.9 = load double, ptr %1, align 8
  %3 = fcmp une double %Arg_0.8, %Arg_0.8
  %4 = fcmp oeq double %Arg_1.9, %Arg_1.9
  %5 = fcmp oge double %Arg_0.8, %Arg_1.9
  %6 = and i1 %4, %5
  %7 = or i1 %3, %6
  %maximum.1 = select i1 %7, double %Arg_0.8, double %Arg_1.9
  store double %maximum.1, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #1

define void @input_exponential_reduce_fusion(ptr noalias align 16 dereferenceable(12288) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2, ptr noalias align 128 dereferenceable(12288) %arg3) {
entry:
  %return_buffer10 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !10
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_5_1 = load double, ptr @1, align 8
  store double %constant_5_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %1 = udiv i32 %thread.id.x, 2
  %thread.id.1 = urem i32 %1, 128
  %thread.id.2 = urem i32 %thread.id.x, 2
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 6
  %6 = udiv i32 %block.id.x, 6
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 128
  %tile_origin.2 = mul i32 %3, 2
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %7 = icmp uge i32 %loop1.indvar, 128
  br i1 %7, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 128
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %8 = icmp uge i32 %loop2.indvar, 2
  br i1 %8, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 2
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %9 = add i32 %loop2.indvar, %thread.id.2
  %10 = icmp ult i32 %9, 2
  br i1 %10, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !18

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !19

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result9 = load double, ptr %partial_reduction_result, align 8
  %11 = bitcast double %partial_reduction_result9 to i64
  %12 = bitcast i64 %11 to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %15 = insertelement <2 x i32> %12, i32 %14, i64 0
  %16 = extractelement <2 x i32> %15, i64 1
  %17 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %16, i32 1, i32 31)
  %18 = insertelement <2 x i32> %15, i32 %17, i64 1
  %19 = bitcast <2 x i32> %18 to i64
  %20 = bitcast i64 %19 to double
  store double %20, ptr %result_from_other_lane, align 8
  call void @region_1_24_55fe7b85f290_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer10)
  %21 = load double, ptr %return_buffer10, align 8
  store double %21, ptr %partial_reduction_result, align 8
  %22 = udiv i32 %thread.id.2, 32
  %23 = icmp ult i32 %thread.id.1, 128
  br i1 %23, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %24 = add i32 %tile_origin.0, 0
  %25 = add i32 %tile_origin.1, %loop1.indvar
  %26 = add i32 %tile_origin.2, %9
  %27 = mul nuw nsw i32 %26, 1
  %28 = add nuw nsw i32 0, %27
  %29 = udiv i32 %28, 2
  %30 = mul nuw nsw i32 %25, 1
  %31 = add nuw nsw i32 0, %30
  %32 = urem i32 %31, 192
  %33 = udiv i32 %31, 192
  %34 = udiv i32 %33, 4
  %35 = mul nuw nsw i32 %24, 1
  %36 = add nuw nsw i32 0, %35
  %param_0.28 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %33, i32 %32, i32 %28
  %param_0.282 = load double, ptr %param_0.28, align 8, !invariant.load !17
  %param_1.28 = getelementptr inbounds [4 x [192 x double]], ptr %arg1, i32 0, i32 %33, i32 %32
  %param_1.283 = load double, ptr %param_1.28, align 8, !invariant.load !17
  %subtract.3.3.clone.1 = fsub double %param_0.282, %param_1.283
  %37 = call double @__nv_exp(double %subtract.3.3.clone.1)
  store double %37, ptr %reduction_input_address, align 8
  call void @region_1_24_55fe7b85f290_79b0d34134220a8b(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %38 = load double, ptr %return_buffer, align 8
  store double %38, ptr %partial_reduction_result, align 8
  %39 = mul nuw nsw i32 %26, 1
  %40 = add nuw nsw i32 0, %39
  %41 = udiv i32 %40, 2
  %42 = mul nuw nsw i32 %25, 1
  %43 = add nuw nsw i32 0, %42
  %44 = urem i32 %43, 192
  %45 = udiv i32 %43, 192
  %46 = udiv i32 %45, 4
  %47 = mul nuw nsw i32 %24, 1
  %48 = add nuw nsw i32 0, %47
  %param_0.284 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %45, i32 %44, i32 %40
  %param_0.285 = load double, ptr %param_0.284, align 8, !invariant.load !17
  %param_1.286 = getelementptr inbounds [4 x [192 x double]], ptr %arg1, i32 0, i32 %45, i32 %44
  %param_1.287 = load double, ptr %param_1.286, align 8, !invariant.load !17
  %subtract.3.3.clone.18 = fsub double %param_0.285, %param_1.287
  %49 = call double @__nv_exp(double %subtract.3.3.clone.18)
  %50 = mul nuw nsw i32 %26, 1
  %51 = add nuw nsw i32 0, %50
  %52 = udiv i32 %51, 2
  %53 = mul nuw nsw i32 %25, 1
  %54 = add nuw nsw i32 0, %53
  %55 = urem i32 %54, 192
  %56 = udiv i32 %54, 192
  %57 = udiv i32 %56, 4
  %58 = mul nuw nsw i32 %24, 1
  %59 = add nuw nsw i32 0, %58
  %60 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg3, i32 0, i32 %56, i32 %55, i32 %51
  store double %49, ptr %60, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %61 = and i32 %thread.id.2, 1
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %63 = add i32 %tile_origin.1, %thread.id.1
  %64 = mul nuw nsw i32 %63, 1
  %65 = add nuw nsw i32 0, %64
  %66 = urem i32 %65, 192
  %67 = udiv i32 %65, 192
  %68 = udiv i32 %67, 4
  %output_element_address = getelementptr inbounds [4 x [192 x double]], ptr %arg2, i32 0, i32 %67, i32 %66
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define internal void @region_1_24_55fe7b85f290_79b0d34134220a8b(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.25 = load double, ptr %0, align 8
  %Arg_1.26 = load double, ptr %1, align 8
  %add.1 = fadd double %Arg_0.25, %Arg_1.26
  store double %add.1, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

define void @loop_subtract_fusion_1(ptr noalias align 16 dereferenceable(12288) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2, ptr noalias align 128 dereferenceable(12288) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1536
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 384
  %8 = icmp ult i32 %linear_index, 1536
  br i1 %8, label %loop_subtract_fusion.1.in_bounds-true, label %loop_subtract_fusion.1.in_bounds-after

loop_subtract_fusion.1.in_bounds-after:           ; preds = %loop_subtract_fusion.1.in_bounds-true, %entry
  ret void

loop_subtract_fusion.1.in_bounds-true:            ; preds = %entry
  %9 = getelementptr double, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !17
  %12 = udiv i32 %linear_index0, 2
  %13 = getelementptr inbounds double, ptr %arg1, i32 %12
  %14 = load double, ptr %13, align 8, !invariant.load !17
  %subtract.3.5 = fsub double %11, %14
  %15 = udiv i32 %linear_index0, 2
  %16 = getelementptr inbounds double, ptr %arg2, i32 %15
  %17 = load double, ptr %16, align 8, !invariant.load !17
  %18 = call double @__nv_log(double %17)
  %subtract.4.1 = fsub double %subtract.3.5, %18
  %19 = getelementptr double, ptr %arg3, i32 %linear_index
  %20 = getelementptr inbounds double, ptr %19, i32 0
  store double %subtract.4.1, ptr %20, align 8
  br label %loop_subtract_fusion.1.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

; Function Attrs: nounwind memory(none)
declare double @__nv_log(double) #2

define void @input_multiply_reduce_fusion(ptr noalias align 16 dereferenceable(294912) %arg0, ptr noalias align 128 dereferenceable(12288) %arg1, ptr noalias align 128 dereferenceable(147456) %arg2, ptr noalias align 128 dereferenceable(294912) %arg3) {
entry:
  %return_buffer10 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !10
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_5_2 = load double, ptr @2, align 8
  store double %constant_5_2, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = udiv i32 %thread.id.x, 2
  %thread.id.1 = urem i32 %1, 128
  %thread.id.2 = urem i32 %thread.id.x, 2
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 144
  %6 = udiv i32 %block.id.x, 144
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 128
  %tile_origin.2 = mul i32 %3, 2
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %7 = icmp uge i32 %loop1.indvar, 128
  br i1 %7, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 128
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %8 = icmp uge i32 %loop2.indvar, 2
  br i1 %8, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 2
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %9 = add i32 %loop2.indvar, %thread.id.2
  %10 = icmp ult i32 %9, 2
  br i1 %10, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !23

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !24

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result9 = load double, ptr %partial_reduction_result, align 8
  %11 = bitcast double %partial_reduction_result9 to i64
  %12 = bitcast i64 %11 to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %15 = insertelement <2 x i32> %12, i32 %14, i64 0
  %16 = extractelement <2 x i32> %15, i64 1
  %17 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %16, i32 1, i32 31)
  %18 = insertelement <2 x i32> %15, i32 %17, i64 1
  %19 = bitcast <2 x i32> %18 to i64
  %20 = bitcast i64 %19 to double
  store double %20, ptr %result_from_other_lane, align 8
  call void @region_1_24_55fe7b85f290_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer10)
  %21 = load double, ptr %return_buffer10, align 8
  store double %21, ptr %partial_reduction_result, align 8
  %22 = udiv i32 %thread.id.2, 32
  %23 = icmp ult i32 %thread.id.1, 128
  br i1 %23, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %24 = add i32 %tile_origin.0, 0
  %25 = add i32 %tile_origin.1, %loop1.indvar
  %26 = add i32 %tile_origin.2, %9
  %27 = mul nuw nsw i32 %26, 1
  %28 = add nuw nsw i32 0, %27
  %29 = udiv i32 %28, 2
  %30 = mul nuw nsw i32 %25, 1
  %31 = add nuw nsw i32 0, %30
  %32 = urem i32 %31, 192
  %33 = udiv i32 %31, 192
  %34 = urem i32 %33, 4
  %35 = udiv i32 %33, 4
  %36 = udiv i32 %35, 24
  %37 = mul nuw nsw i32 %24, 1
  %38 = add nuw nsw i32 0, %37
  %param_0.26 = getelementptr inbounds [24 x [4 x [192 x [2 x double]]]], ptr %arg0, i32 0, i32 %35, i32 %34, i32 %32, i32 %28
  %param_0.262 = load double, ptr %param_0.26, align 8, !invariant.load !17
  %param_1.26 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg1, i32 0, i32 %34, i32 %32, i32 %28
  %param_1.263 = load double, ptr %param_1.26, align 8, !invariant.load !17
  %multiply.1.1.clone.1 = fmul double %param_0.262, %param_1.263
  store double %multiply.1.1.clone.1, ptr %reduction_input_address, align 8
  call void @region_1_24_55fe7b85f290_79b0d34134220a8b(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %39 = load double, ptr %return_buffer, align 8
  store double %39, ptr %partial_reduction_result, align 8
  %40 = mul nuw nsw i32 %26, 1
  %41 = add nuw nsw i32 0, %40
  %42 = udiv i32 %41, 2
  %43 = mul nuw nsw i32 %25, 1
  %44 = add nuw nsw i32 0, %43
  %45 = urem i32 %44, 192
  %46 = udiv i32 %44, 192
  %47 = urem i32 %46, 4
  %48 = udiv i32 %46, 4
  %49 = udiv i32 %48, 24
  %50 = mul nuw nsw i32 %24, 1
  %51 = add nuw nsw i32 0, %50
  %param_0.264 = getelementptr inbounds [24 x [4 x [192 x [2 x double]]]], ptr %arg0, i32 0, i32 %48, i32 %47, i32 %45, i32 %41
  %param_0.265 = load double, ptr %param_0.264, align 8, !invariant.load !17
  %param_1.266 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr %arg1, i32 0, i32 %47, i32 %45, i32 %41
  %param_1.267 = load double, ptr %param_1.266, align 8, !invariant.load !17
  %multiply.1.1.clone.18 = fmul double %param_0.265, %param_1.267
  %52 = mul nuw nsw i32 %26, 1
  %53 = add nuw nsw i32 0, %52
  %54 = udiv i32 %53, 2
  %55 = mul nuw nsw i32 %25, 1
  %56 = add nuw nsw i32 0, %55
  %57 = urem i32 %56, 192
  %58 = udiv i32 %56, 192
  %59 = urem i32 %58, 4
  %60 = udiv i32 %58, 4
  %61 = udiv i32 %60, 24
  %62 = mul nuw nsw i32 %24, 1
  %63 = add nuw nsw i32 0, %62
  %64 = getelementptr inbounds [24 x [4 x [192 x [2 x double]]]], ptr %arg3, i32 0, i32 %60, i32 %59, i32 %57, i32 %53
  store double %multiply.1.1.clone.18, ptr %64, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %65 = and i32 %thread.id.2, 1
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %67 = add i32 %tile_origin.1, %thread.id.1
  %68 = mul nuw nsw i32 %67, 1
  %69 = add nuw nsw i32 0, %68
  %70 = urem i32 %69, 192
  %71 = udiv i32 %69, 192
  %72 = urem i32 %71, 4
  %73 = udiv i32 %71, 4
  %74 = udiv i32 %73, 24
  %output_element_address = getelementptr inbounds [24 x [4 x [192 x double]]], ptr %arg2, i32 0, i32 %73, i32 %72, i32 %70
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

define void @loop_subtract_fusion(ptr noalias align 16 dereferenceable(294912) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(147456) %arg2, ptr noalias align 128 dereferenceable(294912) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 36864
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 384
  %8 = urem i32 %7, 4
  %9 = udiv i32 %linear_index0, 1536
  %10 = icmp ult i32 %linear_index, 36864
  br i1 %10, label %loop_subtract_fusion.in_bounds-true, label %loop_subtract_fusion.in_bounds-after

loop_subtract_fusion.in_bounds-after:             ; preds = %loop_subtract_fusion.in_bounds-true, %entry
  ret void

loop_subtract_fusion.in_bounds-true:              ; preds = %entry
  %11 = getelementptr double, ptr %arg0, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !17
  %14 = udiv i32 %linear_index0, 2
  %15 = getelementptr inbounds double, ptr %arg2, i32 %14
  %16 = load double, ptr %15, align 8, !invariant.load !17
  %17 = urem i32 %14, 768
  %18 = getelementptr inbounds double, ptr %arg1, i32 %17
  %19 = load double, ptr %18, align 8, !invariant.load !17
  %divide.1.3 = fdiv double %16, %19
  %subtract.5.1 = fsub double %13, %divide.1.3
  %20 = getelementptr double, ptr %arg3, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %subtract.5.1, ptr %21, align 8
  br label %loop_subtract_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { nounwind memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9}

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
!2 = !{ptr @input_exponential_reduce_fusion, !"kernel", i32 1}
!3 = !{ptr @input_exponential_reduce_fusion, !"reqntidx", i32 256}
!4 = !{ptr @loop_subtract_fusion_1, !"kernel", i32 1}
!5 = !{ptr @loop_subtract_fusion_1, !"reqntidx", i32 128}
!6 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!7 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 256}
!8 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!9 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 128}
!10 = !{i32 0, i32 1}
!11 = !{i32 0, i32 256}
!12 = !{i32 0, i32 6}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.enable", i1 false}
!15 = !{!"llvm.loop.unroll.full"}
!16 = distinct !{!16, !14}
!17 = !{}
!18 = distinct !{!18, !14, !15}
!19 = distinct !{!19, !14}
!20 = !{i32 0, i32 12}
!21 = !{i32 0, i32 128}
!22 = !{i32 0, i32 144}
!23 = distinct !{!23, !14, !15}
!24 = distinct !{!24, !14}
!25 = !{i32 0, i32 288}
