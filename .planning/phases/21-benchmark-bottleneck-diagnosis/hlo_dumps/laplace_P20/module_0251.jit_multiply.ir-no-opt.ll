; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [8 x [1 x double]] undef

define void @input_multiply_reduce_fusion(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(30720) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(30720) %arg4) {
entry:
  %initial_value_addr = alloca double, align 8
  %return_buffer44 = alloca double, align 8
  %result_from_other_lane42 = alloca double, align 8
  %return_buffer41 = alloca double, align 8
  %result_from_other_lane39 = alloca double, align 8
  %return_buffer38 = alloca double, align 8
  %result_from_other_lane36 = alloca double, align 8
  %return_buffer35 = alloca double, align 8
  %result_from_other_lane33 = alloca double, align 8
  %return_buffer32 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer25 = alloca double, align 8
  %loop3.invar_address17 = alloca i32, align 4
  %loop2.invar_address11 = alloca i32, align 4
  %return_buffer = alloca double, align 8
  %loop3.invar_address = alloca i32, align 4
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !2
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_4_1 = load double, ptr @0, align 8
  store double %constant_4_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = udiv i32 %thread.id.x, 32
  %thread.id.1 = urem i32 %1, 8
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = urem i32 %6, 3
  %8 = udiv i32 %block.id.x, 3
  %9 = icmp eq i32 %7, 2
  %tile_bound.1 = select i1 %9, i32 4, i32 8
  %10 = icmp eq i32 %5, 0
  %tile_bound.2 = select i1 %10, i32 96, i32 256
  %tile_origin.0 = mul i32 %8, 1
  %tile_origin.1 = mul i32 %7, 8
  %tile_origin.2 = mul i32 %5, 256
  %tile_origin.3 = mul i32 %3, 2
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %is_full_tile-after, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %11 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %11, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 8
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  %12 = icmp eq i32 256, %tile_bound.2
  br i1 %12, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %loop2.loop_exit8, %loop2.loop_exit
  br label %loop1.loop_header, !llvm.loop !5

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result31 = load double, ptr %partial_reduction_result, align 8
  %13 = bitcast double %partial_reduction_result31 to i64
  %14 = bitcast i64 %13 to <2 x i32>
  %15 = extractelement <2 x i32> %14, i64 0
  %16 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 16, i32 31)
  %17 = insertelement <2 x i32> %14, i32 %16, i64 0
  %18 = extractelement <2 x i32> %17, i64 1
  %19 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %18, i32 16, i32 31)
  %20 = insertelement <2 x i32> %17, i32 %19, i64 1
  %21 = bitcast <2 x i32> %20 to i64
  %22 = bitcast i64 %21 to double
  store double %22, ptr %result_from_other_lane, align 8
  call void @region_0_10_5600f7b415f0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer32)
  %23 = load double, ptr %return_buffer32, align 8
  store double %23, ptr %partial_reduction_result, align 8
  %partial_reduction_result34 = load double, ptr %partial_reduction_result, align 8
  %24 = bitcast double %partial_reduction_result34 to i64
  %25 = bitcast i64 %24 to <2 x i32>
  %26 = extractelement <2 x i32> %25, i64 0
  %27 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 8, i32 31)
  %28 = insertelement <2 x i32> %25, i32 %27, i64 0
  %29 = extractelement <2 x i32> %28, i64 1
  %30 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 8, i32 31)
  %31 = insertelement <2 x i32> %28, i32 %30, i64 1
  %32 = bitcast <2 x i32> %31 to i64
  %33 = bitcast i64 %32 to double
  store double %33, ptr %result_from_other_lane33, align 8
  call void @region_0_10_5600f7b415f0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane33, ptr %return_buffer35)
  %34 = load double, ptr %return_buffer35, align 8
  store double %34, ptr %partial_reduction_result, align 8
  %partial_reduction_result37 = load double, ptr %partial_reduction_result, align 8
  %35 = bitcast double %partial_reduction_result37 to i64
  %36 = bitcast i64 %35 to <2 x i32>
  %37 = extractelement <2 x i32> %36, i64 0
  %38 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 4, i32 31)
  %39 = insertelement <2 x i32> %36, i32 %38, i64 0
  %40 = extractelement <2 x i32> %39, i64 1
  %41 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 4, i32 31)
  %42 = insertelement <2 x i32> %39, i32 %41, i64 1
  %43 = bitcast <2 x i32> %42 to i64
  %44 = bitcast i64 %43 to double
  store double %44, ptr %result_from_other_lane36, align 8
  call void @region_0_10_5600f7b415f0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane36, ptr %return_buffer38)
  %45 = load double, ptr %return_buffer38, align 8
  store double %45, ptr %partial_reduction_result, align 8
  %partial_reduction_result40 = load double, ptr %partial_reduction_result, align 8
  %46 = bitcast double %partial_reduction_result40 to i64
  %47 = bitcast i64 %46 to <2 x i32>
  %48 = extractelement <2 x i32> %47, i64 0
  %49 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 2, i32 31)
  %50 = insertelement <2 x i32> %47, i32 %49, i64 0
  %51 = extractelement <2 x i32> %50, i64 1
  %52 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %51, i32 2, i32 31)
  %53 = insertelement <2 x i32> %50, i32 %52, i64 1
  %54 = bitcast <2 x i32> %53 to i64
  %55 = bitcast i64 %54 to double
  store double %55, ptr %result_from_other_lane39, align 8
  call void @region_0_10_5600f7b415f0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane39, ptr %return_buffer41)
  %56 = load double, ptr %return_buffer41, align 8
  store double %56, ptr %partial_reduction_result, align 8
  %partial_reduction_result43 = load double, ptr %partial_reduction_result, align 8
  %57 = bitcast double %partial_reduction_result43 to i64
  %58 = bitcast i64 %57 to <2 x i32>
  %59 = extractelement <2 x i32> %58, i64 0
  %60 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %59, i32 1, i32 31)
  %61 = insertelement <2 x i32> %58, i32 %60, i64 0
  %62 = extractelement <2 x i32> %61, i64 1
  %63 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %62, i32 1, i32 31)
  %64 = insertelement <2 x i32> %61, i32 %63, i64 1
  %65 = bitcast <2 x i32> %64 to i64
  %66 = bitcast i64 %65 to double
  store double %66, ptr %result_from_other_lane42, align 8
  call void @region_0_10_5600f7b415f0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane42, ptr %return_buffer44)
  %67 = load double, ptr %return_buffer44, align 8
  store double %67, ptr %partial_reduction_result, align 8
  %68 = udiv i32 %thread.id.2, 32
  %69 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %69, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %inter_warp_reduce-after, %loop1.loop_exit
  br label %reduce-group-0-after

is_full_tile-true:                                ; preds = %loop1.loop_body
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %loop3.loop_exit, %is_full_tile-true
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %70 = icmp uge i32 %loop2.indvar, 256
  br i1 %70, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 32
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %71 = add i32 %loop2.indvar, %thread.id.2
  store i32 0, ptr %loop3.invar_address, align 4
  br label %loop3.loop_header

loop3.loop_header:                                ; preds = %loop3.loop_body, %loop2.loop_body
  %loop3.indvar = load i32, ptr %loop3.invar_address, align 4
  %72 = icmp uge i32 %loop3.indvar, 2
  br i1 %72, label %loop3.loop_exit, label %loop3.loop_body

loop3.loop_body:                                  ; preds = %loop3.loop_header
  %invar.inc2 = add nuw nsw i32 %loop3.indvar, 1
  store i32 %invar.inc2, ptr %loop3.invar_address, align 4
  %73 = add i32 %tile_origin.0, 0
  %74 = add i32 %tile_origin.1, %loop1.indvar
  %75 = add i32 %tile_origin.2, %71
  %76 = add i32 %tile_origin.3, %loop3.indvar
  %77 = mul nuw nsw i32 %76, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %75, 2
  %80 = add nuw nsw i32 %78, %79
  %81 = udiv i32 %80, 192
  %82 = mul nuw nsw i32 %74, 1
  %83 = add nuw nsw i32 0, %82
  %84 = udiv i32 %83, 20
  %85 = mul nuw nsw i32 %73, 1
  %86 = add nuw nsw i32 0, %85
  %param_0.7 = getelementptr inbounds [20 x [192 x double]], ptr %arg0, i32 0, i32 %83, i32 %80
  %param_0.73 = load double, ptr %param_0.7, align 8, !invariant.load !7
  %param_1.5 = getelementptr inbounds [20 x [192 x double]], ptr %arg1, i32 0, i32 %83, i32 %80
  %param_1.54 = load double, ptr %param_1.5, align 8, !invariant.load !7
  %multiply.2.1 = fmul double %param_0.73, %param_1.54
  store double %multiply.2.1, ptr %reduction_input_address, align 8
  call void @region_0_10_5600f7b415f0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %87 = load double, ptr %return_buffer, align 8
  store double %87, ptr %partial_reduction_result, align 8
  %88 = mul nuw nsw i32 %76, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %75, 2
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 192
  %93 = mul nuw nsw i32 %74, 1
  %94 = add nuw nsw i32 0, %93
  %95 = udiv i32 %94, 20
  %96 = mul nuw nsw i32 %73, 1
  %97 = add nuw nsw i32 0, %96
  %param_2.3 = getelementptr inbounds [20 x [1 x double]], ptr %arg2, i32 0, i32 %94, i32 0
  %param_2.35 = load double, ptr %param_2.3, align 8, !invariant.load !7
  %param_0.76 = getelementptr inbounds [20 x [192 x double]], ptr %arg0, i32 0, i32 %94, i32 %91
  %param_0.77 = load double, ptr %param_0.76, align 8, !invariant.load !7
  %multiply.3.1.clone.1 = fmul double %param_2.35, %param_0.77
  %98 = mul nuw nsw i32 %76, 1
  %99 = add nuw nsw i32 0, %98
  %100 = mul nuw nsw i32 %75, 2
  %101 = add nuw nsw i32 %99, %100
  %102 = udiv i32 %101, 192
  %103 = mul nuw nsw i32 %74, 1
  %104 = add nuw nsw i32 0, %103
  %105 = udiv i32 %104, 20
  %106 = mul nuw nsw i32 %73, 1
  %107 = add nuw nsw i32 0, %106
  %108 = getelementptr inbounds [20 x [192 x double]], ptr %arg4, i32 0, i32 %104, i32 %101
  store double %multiply.3.1.clone.1, ptr %108, align 8
  br label %loop3.loop_header, !llvm.loop !8

loop3.loop_exit:                                  ; preds = %loop3.loop_header
  br label %loop2.loop_header, !llvm.loop !9

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %loop1.loop_body
  store i32 0, ptr %loop2.invar_address11, align 4
  br label %loop2.loop_header9

loop2.loop_header9:                               ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar12 = load i32, ptr %loop2.invar_address11, align 4
  %109 = icmp uge i32 %loop2.indvar12, 256
  br i1 %109, label %loop2.loop_exit8, label %loop2.loop_body10

loop2.loop_body10:                                ; preds = %loop2.loop_header9
  %invar.inc13 = add nuw nsw i32 %loop2.indvar12, 32
  store i32 %invar.inc13, ptr %loop2.invar_address11, align 4
  %110 = add i32 %loop2.indvar12, %thread.id.2
  %111 = icmp ult i32 %110, %tile_bound.2
  br i1 %111, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %loop3.loop_exit14, %loop2.loop_body10
  br label %loop2.loop_header9, !llvm.loop !11

loop2.loop_exit8:                                 ; preds = %loop2.loop_header9
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %loop2.loop_body10
  store i32 0, ptr %loop3.invar_address17, align 4
  br label %loop3.loop_header15

loop3.loop_header15:                              ; preds = %loop3.loop_body16, %x_in_tile-true
  %loop3.indvar18 = load i32, ptr %loop3.invar_address17, align 4
  %112 = icmp uge i32 %loop3.indvar18, 2
  br i1 %112, label %loop3.loop_exit14, label %loop3.loop_body16

loop3.loop_body16:                                ; preds = %loop3.loop_header15
  %invar.inc19 = add nuw nsw i32 %loop3.indvar18, 1
  store i32 %invar.inc19, ptr %loop3.invar_address17, align 4
  %113 = add i32 %tile_origin.0, 0
  %114 = add i32 %tile_origin.1, %loop1.indvar
  %115 = add i32 %tile_origin.2, %110
  %116 = add i32 %tile_origin.3, %loop3.indvar18
  %117 = mul nuw nsw i32 %116, 1
  %118 = add nuw nsw i32 0, %117
  %119 = mul nuw nsw i32 %115, 2
  %120 = add nuw nsw i32 %118, %119
  %121 = udiv i32 %120, 192
  %122 = mul nuw nsw i32 %114, 1
  %123 = add nuw nsw i32 0, %122
  %124 = udiv i32 %123, 20
  %125 = mul nuw nsw i32 %113, 1
  %126 = add nuw nsw i32 0, %125
  %param_0.720 = getelementptr inbounds [20 x [192 x double]], ptr %arg0, i32 0, i32 %123, i32 %120
  %param_0.721 = load double, ptr %param_0.720, align 8, !invariant.load !7
  %param_1.522 = getelementptr inbounds [20 x [192 x double]], ptr %arg1, i32 0, i32 %123, i32 %120
  %param_1.523 = load double, ptr %param_1.522, align 8, !invariant.load !7
  %multiply.2.124 = fmul double %param_0.721, %param_1.523
  store double %multiply.2.124, ptr %reduction_input_address, align 8
  call void @region_0_10_5600f7b415f0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer25)
  %127 = load double, ptr %return_buffer25, align 8
  store double %127, ptr %partial_reduction_result, align 8
  %128 = mul nuw nsw i32 %116, 1
  %129 = add nuw nsw i32 0, %128
  %130 = mul nuw nsw i32 %115, 2
  %131 = add nuw nsw i32 %129, %130
  %132 = udiv i32 %131, 192
  %133 = mul nuw nsw i32 %114, 1
  %134 = add nuw nsw i32 0, %133
  %135 = udiv i32 %134, 20
  %136 = mul nuw nsw i32 %113, 1
  %137 = add nuw nsw i32 0, %136
  %param_2.326 = getelementptr inbounds [20 x [1 x double]], ptr %arg2, i32 0, i32 %134, i32 0
  %param_2.327 = load double, ptr %param_2.326, align 8, !invariant.load !7
  %param_0.728 = getelementptr inbounds [20 x [192 x double]], ptr %arg0, i32 0, i32 %134, i32 %131
  %param_0.729 = load double, ptr %param_0.728, align 8, !invariant.load !7
  %multiply.3.1.clone.130 = fmul double %param_2.327, %param_0.729
  %138 = mul nuw nsw i32 %116, 1
  %139 = add nuw nsw i32 0, %138
  %140 = mul nuw nsw i32 %115, 2
  %141 = add nuw nsw i32 %139, %140
  %142 = udiv i32 %141, 192
  %143 = mul nuw nsw i32 %114, 1
  %144 = add nuw nsw i32 0, %143
  %145 = udiv i32 %144, 20
  %146 = mul nuw nsw i32 %113, 1
  %147 = add nuw nsw i32 0, %146
  %148 = getelementptr inbounds [20 x [192 x double]], ptr %arg4, i32 0, i32 %144, i32 %141
  store double %multiply.3.1.clone.130, ptr %148, align 8
  br label %loop3.loop_header15, !llvm.loop !12

loop3.loop_exit14:                                ; preds = %loop3.loop_header15
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %149 = icmp eq i32 %lane_id, 0
  br i1 %149, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  call void @llvm.nvvm.barrier0()
  %150 = icmp eq i32 %68, 0
  br i1 %150, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  %151 = load double, ptr %partial_reduction_result, align 8
  %152 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %68
  %153 = addrspacecast ptr addrspace(3) %152 to ptr
  store double %151, ptr %153, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %154 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %lane_id
  %155 = addrspacecast ptr addrspace(3) %154 to ptr
  store double %constant_4_1, ptr %initial_value_addr, align 8
  %156 = icmp ult i32 %thread.id.2, 1
  %157 = select i1 %156, ptr %155, ptr %initial_value_addr
  %158 = icmp eq i32 %thread.id.2, 0
  br i1 %158, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %159 = add i32 %tile_origin.1, %thread.id.1
  %output_element_address = getelementptr inbounds [20 x double], ptr %arg3, i32 0, i32 %159
  %output = load double, ptr %157, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_10_5600f7b415f0_198d40d801a8e3c1(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.11 = load double, ptr %0, align 8
  %Arg_1.12 = load double, ptr %1, align 8
  %add.1 = fadd double %Arg_0.11, %Arg_1.12
  store double %add.1, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 256}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 256}
!4 = !{i32 0, i32 3}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.vectorize.enable", i1 false}
!7 = !{}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6, !10}
!10 = !{!"llvm.loop.unroll.full"}
!11 = distinct !{!11, !6, !10}
!12 = distinct !{!12, !6}
