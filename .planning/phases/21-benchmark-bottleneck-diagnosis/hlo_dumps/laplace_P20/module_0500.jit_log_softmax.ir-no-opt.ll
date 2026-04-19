; ModuleID = 'jit_log_softmax'
source_filename = "jit_log_softmax"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@1 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"

define void @input_reduce_fusion(ptr noalias align 16 dereferenceable(61440) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1) {
entry:
  %return_buffer4 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !8
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_6_1 = load double, ptr @0, align 8
  store double %constant_6_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = udiv i32 %thread.id.x, 2
  %thread.id.1 = urem i32 %1, 128
  %thread.id.2 = urem i32 %thread.id.x, 2
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 30
  %6 = udiv i32 %block.id.x, 30
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
  br label %loop2.loop_header, !llvm.loop !11

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !14

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
  call void @region_0_8_56010d7078a0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer4)
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
  %34 = udiv i32 %33, 20
  %35 = mul nuw nsw i32 %24, 1
  %36 = add nuw nsw i32 0, %35
  %param_0.48 = getelementptr inbounds [1 x [20 x [192 x [2 x double]]]], ptr %arg0, i32 0, i32 0, i32 %33, i32 %32, i32 %28
  %param_0.482 = load double, ptr %param_0.48, align 8, !invariant.load !15
  store double %param_0.482, ptr %reduction_input_address, align 8
  call void @region_0_8_56010d7078a0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
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
  %45 = udiv i32 %44, 20
  %output_element_address = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg1, i32 0, i32 0, i32 %44, i32 %43
  %output = load double, ptr %partial_reduction_result, align 8
  %46 = fneg double %output
  store double %46, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_8_56010d7078a0_198d40d801a8e3c1(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.9 = load double, ptr %0, align 8
  %Arg_1.10 = load double, ptr %1, align 8
  %add.3 = fadd double %Arg_0.9, %Arg_1.10
  store double %add.3, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #1

define void @loop_divide_fusion(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !16
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = urem i32 %5, 20
  %7 = udiv i32 %linear_index0, 3840
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index0, 3840
  %10 = icmp ult i32 %linear_index, 3840
  br i1 %10, label %loop_divide_fusion.in_bounds-true, label %loop_divide_fusion.in_bounds-after

loop_divide_fusion.in_bounds-after:               ; preds = %loop_divide_fusion.in_bounds-true, %entry
  ret void

loop_divide_fusion.in_bounds-true:                ; preds = %entry
  %constant_0_1 = load double, ptr @1, align 8
  %11 = getelementptr double, ptr %arg0, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !15
  %multiply.13.3 = fmul double %13, %13
  %divide.4.1 = fdiv double %constant_0_1, %multiply.13.3
  %14 = insertvalue { double, double } undef, double %divide.4.1, 0
  %15 = getelementptr double, ptr %arg1, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !15
  %divide.3.1.clone.1 = fdiv double %17, %13
  %18 = insertvalue { double, double } %14, double %divide.3.1.clone.1, 1
  %19 = extractvalue { double, double } %18, 0
  %20 = getelementptr double, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %19, ptr %21, align 8
  %22 = extractvalue { double, double } %18, 1
  %23 = getelementptr double, ptr %arg3, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  store double %22, ptr %24, align 8
  br label %loop_divide_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

define void @loop_add_fusion(ptr noalias align 16 dereferenceable(7372800) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1, ptr noalias align 16 dereferenceable(61440) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3, ptr noalias align 128 dereferenceable(30720) %arg4, ptr noalias align 16 dereferenceable(3686400) %arg5, ptr noalias align 128 dereferenceable(7372800) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !17
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !16
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 230400
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index0 = add nuw nsw i32 %linear_index_base, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 384
  %8 = urem i32 %7, 20
  %9 = udiv i32 %linear_index0, 7680
  %10 = urem i32 %9, 1
  %11 = udiv i32 %linear_index0, 7680
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %12 = udiv i32 %linear_index1, 1
  %13 = urem i32 %12, 2
  %14 = udiv i32 %linear_index1, 2
  %15 = urem i32 %14, 192
  %16 = udiv i32 %linear_index1, 384
  %17 = urem i32 %16, 20
  %18 = udiv i32 %linear_index1, 7680
  %19 = urem i32 %18, 1
  %20 = udiv i32 %linear_index1, 7680
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %21 = udiv i32 %linear_index2, 1
  %22 = urem i32 %21, 2
  %23 = udiv i32 %linear_index2, 2
  %24 = urem i32 %23, 192
  %25 = udiv i32 %linear_index2, 384
  %26 = urem i32 %25, 20
  %27 = udiv i32 %linear_index2, 7680
  %28 = urem i32 %27, 1
  %29 = udiv i32 %linear_index2, 7680
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %30 = udiv i32 %linear_index3, 1
  %31 = urem i32 %30, 2
  %32 = udiv i32 %linear_index3, 2
  %33 = urem i32 %32, 192
  %34 = udiv i32 %linear_index3, 384
  %35 = urem i32 %34, 20
  %36 = udiv i32 %linear_index3, 7680
  %37 = urem i32 %36, 1
  %38 = udiv i32 %linear_index3, 7680
  %39 = icmp ult i32 %linear_index_base, 921600
  br i1 %39, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %40 = getelementptr inbounds [120 x [20 x [192 x [1 x double]]]], ptr %arg5, i32 0, i32 %11, i32 %8, i32 %6, i32 0
  %41 = load double, ptr %40, align 8, !invariant.load !15
  %42 = fneg double %41
  %43 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg4, i32 0, i32 0, i32 %8, i32 %6
  %44 = load double, ptr %43, align 8, !invariant.load !15
  %multiply.12.5 = fmul double %42, %44
  %45 = getelementptr inbounds [1 x [1 x [20 x [192 x double]]]], ptr %arg3, i32 0, i32 0, i32 0, i32 %8, i32 %6
  %46 = load double, ptr %45, align 8, !invariant.load !15
  %multiply.14.3 = fmul double %multiply.12.5, %46
  %47 = urem i32 %linear_index0, 7680
  %48 = getelementptr inbounds double, ptr %arg2, i32 %47
  %49 = load double, ptr %48, align 8, !invariant.load !15
  %multiply.15.3 = fmul double %multiply.14.3, %49
  %50 = udiv i32 %linear_index0, 2
  %51 = urem i32 %50, 3840
  %52 = getelementptr inbounds double, ptr %arg1, i32 %51
  %53 = load double, ptr %52, align 8, !invariant.load !15
  %54 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %55 = getelementptr inbounds double, ptr %54, i32 0
  %56 = load double, ptr %55, align 8, !invariant.load !15
  %multiply.16.3 = fmul double %53, %56
  %add.5.1 = fadd double %multiply.15.3, %multiply.16.3
  %57 = getelementptr double, ptr %arg6, i32 %linear_index_base
  %58 = getelementptr inbounds double, ptr %57, i32 0
  store double %add.5.1, ptr %58, align 8
  %59 = getelementptr inbounds [120 x [20 x [192 x [1 x double]]]], ptr %arg5, i32 0, i32 %20, i32 %17, i32 %15, i32 0
  %60 = load double, ptr %59, align 8, !invariant.load !15
  %61 = fneg double %60
  %62 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg4, i32 0, i32 0, i32 %17, i32 %15
  %63 = load double, ptr %62, align 8, !invariant.load !15
  %multiply.12.51 = fmul double %61, %63
  %64 = getelementptr inbounds [1 x [1 x [20 x [192 x double]]]], ptr %arg3, i32 0, i32 0, i32 0, i32 %17, i32 %15
  %65 = load double, ptr %64, align 8, !invariant.load !15
  %multiply.14.32 = fmul double %multiply.12.51, %65
  %66 = urem i32 %linear_index1, 7680
  %67 = getelementptr inbounds double, ptr %arg2, i32 %66
  %68 = load double, ptr %67, align 8, !invariant.load !15
  %multiply.15.33 = fmul double %multiply.14.32, %68
  %69 = udiv i32 %linear_index1, 2
  %70 = urem i32 %69, 3840
  %71 = getelementptr inbounds double, ptr %arg1, i32 %70
  %72 = load double, ptr %71, align 8, !invariant.load !15
  %73 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %74 = getelementptr inbounds double, ptr %73, i32 1
  %75 = load double, ptr %74, align 8, !invariant.load !15
  %multiply.16.34 = fmul double %72, %75
  %add.5.15 = fadd double %multiply.15.33, %multiply.16.34
  %76 = getelementptr double, ptr %arg6, i32 %linear_index_base
  %77 = getelementptr inbounds double, ptr %76, i32 1
  store double %add.5.15, ptr %77, align 8
  %78 = getelementptr inbounds [120 x [20 x [192 x [1 x double]]]], ptr %arg5, i32 0, i32 %29, i32 %26, i32 %24, i32 0
  %79 = load double, ptr %78, align 8, !invariant.load !15
  %80 = fneg double %79
  %81 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg4, i32 0, i32 0, i32 %26, i32 %24
  %82 = load double, ptr %81, align 8, !invariant.load !15
  %multiply.12.56 = fmul double %80, %82
  %83 = getelementptr inbounds [1 x [1 x [20 x [192 x double]]]], ptr %arg3, i32 0, i32 0, i32 0, i32 %26, i32 %24
  %84 = load double, ptr %83, align 8, !invariant.load !15
  %multiply.14.37 = fmul double %multiply.12.56, %84
  %85 = urem i32 %linear_index2, 7680
  %86 = getelementptr inbounds double, ptr %arg2, i32 %85
  %87 = load double, ptr %86, align 8, !invariant.load !15
  %multiply.15.38 = fmul double %multiply.14.37, %87
  %88 = udiv i32 %linear_index2, 2
  %89 = urem i32 %88, 3840
  %90 = getelementptr inbounds double, ptr %arg1, i32 %89
  %91 = load double, ptr %90, align 8, !invariant.load !15
  %92 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %93 = getelementptr inbounds double, ptr %92, i32 2
  %94 = load double, ptr %93, align 8, !invariant.load !15
  %multiply.16.39 = fmul double %91, %94
  %add.5.110 = fadd double %multiply.15.38, %multiply.16.39
  %95 = getelementptr double, ptr %arg6, i32 %linear_index_base
  %96 = getelementptr inbounds double, ptr %95, i32 2
  store double %add.5.110, ptr %96, align 8
  %97 = getelementptr inbounds [120 x [20 x [192 x [1 x double]]]], ptr %arg5, i32 0, i32 %38, i32 %35, i32 %33, i32 0
  %98 = load double, ptr %97, align 8, !invariant.load !15
  %99 = fneg double %98
  %100 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg4, i32 0, i32 0, i32 %35, i32 %33
  %101 = load double, ptr %100, align 8, !invariant.load !15
  %multiply.12.511 = fmul double %99, %101
  %102 = getelementptr inbounds [1 x [1 x [20 x [192 x double]]]], ptr %arg3, i32 0, i32 0, i32 0, i32 %35, i32 %33
  %103 = load double, ptr %102, align 8, !invariant.load !15
  %multiply.14.312 = fmul double %multiply.12.511, %103
  %104 = urem i32 %linear_index3, 7680
  %105 = getelementptr inbounds double, ptr %arg2, i32 %104
  %106 = load double, ptr %105, align 8, !invariant.load !15
  %multiply.15.313 = fmul double %multiply.14.312, %106
  %107 = udiv i32 %linear_index3, 2
  %108 = urem i32 %107, 3840
  %109 = getelementptr inbounds double, ptr %arg1, i32 %108
  %110 = load double, ptr %109, align 8, !invariant.load !15
  %111 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %112 = getelementptr inbounds double, ptr %111, i32 3
  %113 = load double, ptr %112, align 8, !invariant.load !15
  %multiply.16.314 = fmul double %110, %113
  %add.5.115 = fadd double %multiply.15.313, %multiply.16.314
  %114 = getelementptr double, ptr %arg6, i32 %linear_index_base
  %115 = getelementptr inbounds double, ptr %114, i32 3
  store double %add.5.115, ptr %115, align 8
  br label %loop_add_fusion.in_bounds-after
}

define void @loop_add_fusion_1(ptr noalias align 16 dereferenceable(61440) %arg0, ptr noalias align 16 dereferenceable(61440) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(61440) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !16
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 7680
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 2
  %5 = udiv i32 %linear_index0, 2
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 384
  %8 = urem i32 %7, 20
  %9 = udiv i32 %linear_index0, 7680
  %10 = icmp ult i32 %linear_index, 7680
  br i1 %10, label %loop_add_fusion.1.in_bounds-true, label %loop_add_fusion.1.in_bounds-after

loop_add_fusion.1.in_bounds-after:                ; preds = %loop_add_fusion.1.in_bounds-true, %entry
  ret void

loop_add_fusion.1.in_bounds-true:                 ; preds = %entry
  %11 = getelementptr double, ptr %arg0, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !15
  %14 = udiv i32 %linear_index0, 2
  %15 = getelementptr inbounds double, ptr %arg2, i32 %14
  %16 = load double, ptr %15, align 8, !invariant.load !15
  %17 = getelementptr double, ptr %arg1, i32 %linear_index
  %18 = getelementptr inbounds double, ptr %17, i32 0
  %19 = load double, ptr %18, align 8, !invariant.load !15
  %multiply.11.3 = fmul double %16, %19
  %add.4.1 = fadd double %13, %multiply.11.3
  %20 = getelementptr double, ptr %arg3, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %add.4.1, ptr %21, align 8
  br label %loop_add_fusion.1.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7}

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
!2 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_divide_fusion, !"reqntidx", i32 128}
!4 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!6 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!7 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 128}
!8 = !{i32 0, i32 1}
!9 = !{i32 0, i32 256}
!10 = !{i32 0, i32 30}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.enable", i1 false}
!13 = !{!"llvm.loop.unroll.full"}
!14 = distinct !{!14, !12}
!15 = !{}
!16 = !{i32 0, i32 128}
!17 = !{i32 0, i32 1800}
!18 = !{i32 0, i32 60}
