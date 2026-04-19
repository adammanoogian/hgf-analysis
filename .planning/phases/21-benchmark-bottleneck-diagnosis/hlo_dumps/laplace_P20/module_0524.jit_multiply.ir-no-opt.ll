; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [8 x [1 x double]] undef
@1 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [8 x [1 x double]] undef

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
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !4
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_7_1 = load double, ptr @0, align 8
  store double %constant_7_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  br label %loop1.loop_header, !llvm.loop !7

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
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer32)
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
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane33, ptr %return_buffer35)
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
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane36, ptr %return_buffer38)
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
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane39, ptr %return_buffer41)
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
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane42, ptr %return_buffer44)
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
  %param_0.36 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %83, i32 %80
  %param_0.363 = load double, ptr %param_0.36, align 8, !invariant.load !9
  %param_1.35 = getelementptr inbounds [20 x [192 x double]], ptr %arg1, i32 0, i32 %83, i32 %80
  %param_1.354 = load double, ptr %param_1.35, align 8, !invariant.load !9
  %multiply.7.3 = fmul double %param_0.363, %param_1.354
  store double %multiply.7.3, ptr %reduction_input_address, align 8
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
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
  %98 = udiv i32 %97, 1
  %param_2.20 = getelementptr inbounds [20 x [1 x double]], ptr %arg2, i32 0, i32 %94, i32 0
  %param_2.205 = load double, ptr %param_2.20, align 8, !invariant.load !9
  %param_0.366 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %94, i32 %91
  %param_0.367 = load double, ptr %param_0.366, align 8, !invariant.load !9
  %multiply.8.1.clone.1 = fmul double %param_2.205, %param_0.367
  %99 = mul nuw nsw i32 %76, 1
  %100 = add nuw nsw i32 0, %99
  %101 = mul nuw nsw i32 %75, 2
  %102 = add nuw nsw i32 %100, %101
  %103 = udiv i32 %102, 192
  %104 = mul nuw nsw i32 %74, 1
  %105 = add nuw nsw i32 0, %104
  %106 = udiv i32 %105, 20
  %107 = mul nuw nsw i32 %73, 1
  %108 = add nuw nsw i32 0, %107
  %109 = udiv i32 %108, 1
  %110 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg4, i32 0, i32 0, i32 %105, i32 %102
  store double %multiply.8.1.clone.1, ptr %110, align 8
  br label %loop3.loop_header, !llvm.loop !10

loop3.loop_exit:                                  ; preds = %loop3.loop_header
  br label %loop2.loop_header, !llvm.loop !11

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %loop1.loop_body
  store i32 0, ptr %loop2.invar_address11, align 4
  br label %loop2.loop_header9

loop2.loop_header9:                               ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar12 = load i32, ptr %loop2.invar_address11, align 4
  %111 = icmp uge i32 %loop2.indvar12, 256
  br i1 %111, label %loop2.loop_exit8, label %loop2.loop_body10

loop2.loop_body10:                                ; preds = %loop2.loop_header9
  %invar.inc13 = add nuw nsw i32 %loop2.indvar12, 32
  store i32 %invar.inc13, ptr %loop2.invar_address11, align 4
  %112 = add i32 %loop2.indvar12, %thread.id.2
  %113 = icmp ult i32 %112, %tile_bound.2
  br i1 %113, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %loop3.loop_exit14, %loop2.loop_body10
  br label %loop2.loop_header9, !llvm.loop !13

loop2.loop_exit8:                                 ; preds = %loop2.loop_header9
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %loop2.loop_body10
  store i32 0, ptr %loop3.invar_address17, align 4
  br label %loop3.loop_header15

loop3.loop_header15:                              ; preds = %loop3.loop_body16, %x_in_tile-true
  %loop3.indvar18 = load i32, ptr %loop3.invar_address17, align 4
  %114 = icmp uge i32 %loop3.indvar18, 2
  br i1 %114, label %loop3.loop_exit14, label %loop3.loop_body16

loop3.loop_body16:                                ; preds = %loop3.loop_header15
  %invar.inc19 = add nuw nsw i32 %loop3.indvar18, 1
  store i32 %invar.inc19, ptr %loop3.invar_address17, align 4
  %115 = add i32 %tile_origin.0, 0
  %116 = add i32 %tile_origin.1, %loop1.indvar
  %117 = add i32 %tile_origin.2, %112
  %118 = add i32 %tile_origin.3, %loop3.indvar18
  %119 = mul nuw nsw i32 %118, 1
  %120 = add nuw nsw i32 0, %119
  %121 = mul nuw nsw i32 %117, 2
  %122 = add nuw nsw i32 %120, %121
  %123 = udiv i32 %122, 192
  %124 = mul nuw nsw i32 %116, 1
  %125 = add nuw nsw i32 0, %124
  %126 = udiv i32 %125, 20
  %127 = mul nuw nsw i32 %115, 1
  %128 = add nuw nsw i32 0, %127
  %param_0.3620 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %125, i32 %122
  %param_0.3621 = load double, ptr %param_0.3620, align 8, !invariant.load !9
  %param_1.3522 = getelementptr inbounds [20 x [192 x double]], ptr %arg1, i32 0, i32 %125, i32 %122
  %param_1.3523 = load double, ptr %param_1.3522, align 8, !invariant.load !9
  %multiply.7.324 = fmul double %param_0.3621, %param_1.3523
  store double %multiply.7.324, ptr %reduction_input_address, align 8
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer25)
  %129 = load double, ptr %return_buffer25, align 8
  store double %129, ptr %partial_reduction_result, align 8
  %130 = mul nuw nsw i32 %118, 1
  %131 = add nuw nsw i32 0, %130
  %132 = mul nuw nsw i32 %117, 2
  %133 = add nuw nsw i32 %131, %132
  %134 = udiv i32 %133, 192
  %135 = mul nuw nsw i32 %116, 1
  %136 = add nuw nsw i32 0, %135
  %137 = udiv i32 %136, 20
  %138 = mul nuw nsw i32 %115, 1
  %139 = add nuw nsw i32 0, %138
  %140 = udiv i32 %139, 1
  %param_2.2026 = getelementptr inbounds [20 x [1 x double]], ptr %arg2, i32 0, i32 %136, i32 0
  %param_2.2027 = load double, ptr %param_2.2026, align 8, !invariant.load !9
  %param_0.3628 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %136, i32 %133
  %param_0.3629 = load double, ptr %param_0.3628, align 8, !invariant.load !9
  %multiply.8.1.clone.130 = fmul double %param_2.2027, %param_0.3629
  %141 = mul nuw nsw i32 %118, 1
  %142 = add nuw nsw i32 0, %141
  %143 = mul nuw nsw i32 %117, 2
  %144 = add nuw nsw i32 %142, %143
  %145 = udiv i32 %144, 192
  %146 = mul nuw nsw i32 %116, 1
  %147 = add nuw nsw i32 0, %146
  %148 = udiv i32 %147, 20
  %149 = mul nuw nsw i32 %115, 1
  %150 = add nuw nsw i32 0, %149
  %151 = udiv i32 %150, 1
  %152 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg4, i32 0, i32 0, i32 %147, i32 %144
  store double %multiply.8.1.clone.130, ptr %152, align 8
  br label %loop3.loop_header15, !llvm.loop !14

loop3.loop_exit14:                                ; preds = %loop3.loop_header15
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %153 = icmp eq i32 %lane_id, 0
  br i1 %153, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  call void @llvm.nvvm.barrier0()
  %154 = icmp eq i32 %68, 0
  br i1 %154, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  %155 = load double, ptr %partial_reduction_result, align 8
  %156 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %68
  %157 = addrspacecast ptr addrspace(3) %156 to ptr
  store double %155, ptr %157, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %158 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %lane_id
  %159 = addrspacecast ptr addrspace(3) %158 to ptr
  store double %constant_7_1, ptr %initial_value_addr, align 8
  %160 = icmp ult i32 %thread.id.2, 1
  %161 = select i1 %160, ptr %159, ptr %initial_value_addr
  %162 = icmp eq i32 %thread.id.2, 0
  br i1 %162, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %163 = add i32 %tile_origin.1, %thread.id.1
  %output_element_address = getelementptr inbounds [20 x double], ptr %arg3, i32 0, i32 %163
  %output = load double, ptr %161, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.43 = load double, ptr %0, align 8
  %Arg_1.44 = load double, ptr %1, align 8
  %add.3 = fadd double %Arg_0.43, %Arg_1.44
  store double %add.3, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

define void @input_add_reduce_fusion(ptr noalias align 16 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(30720) %arg1, ptr noalias align 16 dereferenceable(3686400) %arg2, ptr noalias align 16 dereferenceable(30720) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(19200) %arg5, ptr noalias align 128 dereferenceable(19200) %arg6, ptr noalias align 128 dereferenceable(3686400) %arg7) {
entry:
  %initial_value_addr = alloca double, align 8
  %return_buffer61 = alloca double, align 8
  %result_from_other_lane59 = alloca double, align 8
  %return_buffer58 = alloca double, align 8
  %result_from_other_lane56 = alloca double, align 8
  %return_buffer55 = alloca double, align 8
  %result_from_other_lane53 = alloca double, align 8
  %return_buffer52 = alloca double, align 8
  %result_from_other_lane50 = alloca double, align 8
  %return_buffer49 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer36 = alloca double, align 8
  %loop3.invar_address22 = alloca i32, align 4
  %loop2.invar_address16 = alloca i32, align 4
  %return_buffer = alloca double, align 8
  %loop3.invar_address = alloca i32, align 4
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !4
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_7_2 = load double, ptr @1, align 8
  store double %constant_7_2, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !15
  %1 = udiv i32 %thread.id.x, 32
  %thread.id.1 = urem i32 %1, 8
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = urem i32 %6, 300
  %8 = udiv i32 %block.id.x, 300
  %9 = icmp eq i32 %5, 0
  %tile_bound.2 = select i1 %9, i32 96, i32 256
  %tile_origin.0 = mul i32 %8, 1
  %tile_origin.1 = mul i32 %7, 8
  %tile_origin.2 = mul i32 %5, 256
  %tile_origin.3 = mul i32 %3, 2
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %is_full_tile-after, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %10 = icmp uge i32 %loop1.indvar, 8
  br i1 %10, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 8
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  %11 = icmp eq i32 256, %tile_bound.2
  br i1 %11, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %loop2.loop_exit13, %loop2.loop_exit
  br label %loop1.loop_header, !llvm.loop !16

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result48 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result48 to i64
  %13 = bitcast i64 %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 16, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 0
  %17 = extractelement <2 x i32> %16, i64 1
  %18 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 16, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to i64
  %21 = bitcast i64 %20 to double
  store double %21, ptr %result_from_other_lane, align 8
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer49)
  %22 = load double, ptr %return_buffer49, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result51 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result51 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 8, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 8, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane50, align 8
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane50, ptr %return_buffer52)
  %33 = load double, ptr %return_buffer52, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %partial_reduction_result54 = load double, ptr %partial_reduction_result, align 8
  %34 = bitcast double %partial_reduction_result54 to i64
  %35 = bitcast i64 %34 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 4, i32 31)
  %38 = insertelement <2 x i32> %35, i32 %37, i64 0
  %39 = extractelement <2 x i32> %38, i64 1
  %40 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to i64
  %43 = bitcast i64 %42 to double
  store double %43, ptr %result_from_other_lane53, align 8
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane53, ptr %return_buffer55)
  %44 = load double, ptr %return_buffer55, align 8
  store double %44, ptr %partial_reduction_result, align 8
  %partial_reduction_result57 = load double, ptr %partial_reduction_result, align 8
  %45 = bitcast double %partial_reduction_result57 to i64
  %46 = bitcast i64 %45 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> %46, i32 %48, i64 0
  %50 = extractelement <2 x i32> %49, i64 1
  %51 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 2, i32 31)
  %52 = insertelement <2 x i32> %49, i32 %51, i64 1
  %53 = bitcast <2 x i32> %52 to i64
  %54 = bitcast i64 %53 to double
  store double %54, ptr %result_from_other_lane56, align 8
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane56, ptr %return_buffer58)
  %55 = load double, ptr %return_buffer58, align 8
  store double %55, ptr %partial_reduction_result, align 8
  %partial_reduction_result60 = load double, ptr %partial_reduction_result, align 8
  %56 = bitcast double %partial_reduction_result60 to i64
  %57 = bitcast i64 %56 to <2 x i32>
  %58 = extractelement <2 x i32> %57, i64 0
  %59 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 1, i32 31)
  %60 = insertelement <2 x i32> %57, i32 %59, i64 0
  %61 = extractelement <2 x i32> %60, i64 1
  %62 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 1, i32 31)
  %63 = insertelement <2 x i32> %60, i32 %62, i64 1
  %64 = bitcast <2 x i32> %63 to i64
  %65 = bitcast i64 %64 to double
  store double %65, ptr %result_from_other_lane59, align 8
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane59, ptr %return_buffer61)
  %66 = load double, ptr %return_buffer61, align 8
  store double %66, ptr %partial_reduction_result, align 8
  %67 = udiv i32 %thread.id.2, 32
  %68 = icmp ult i32 %thread.id.1, 8
  br i1 %68, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %inter_warp_reduce-after, %loop1.loop_exit
  br label %reduce-group-0-after

is_full_tile-true:                                ; preds = %loop1.loop_body
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %loop3.loop_exit, %is_full_tile-true
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %69 = icmp uge i32 %loop2.indvar, 256
  br i1 %69, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 32
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %70 = add i32 %loop2.indvar, %thread.id.2
  store i32 0, ptr %loop3.invar_address, align 4
  br label %loop3.loop_header

loop3.loop_header:                                ; preds = %loop3.loop_body, %loop2.loop_body
  %loop3.indvar = load i32, ptr %loop3.invar_address, align 4
  %71 = icmp uge i32 %loop3.indvar, 2
  br i1 %71, label %loop3.loop_exit, label %loop3.loop_body

loop3.loop_body:                                  ; preds = %loop3.loop_header
  %invar.inc2 = add nuw nsw i32 %loop3.indvar, 1
  store i32 %invar.inc2, ptr %loop3.invar_address, align 4
  %72 = add i32 %tile_origin.0, 0
  %73 = add i32 %tile_origin.1, %loop1.indvar
  %74 = add i32 %tile_origin.2, %70
  %75 = add i32 %tile_origin.3, %loop3.indvar
  %76 = mul nuw nsw i32 %75, 1
  %77 = add nuw nsw i32 0, %76
  %78 = mul nuw nsw i32 %74, 2
  %79 = add nuw nsw i32 %77, %78
  %80 = udiv i32 %79, 192
  %81 = mul nuw nsw i32 %73, 1
  %82 = add nuw nsw i32 0, %81
  %83 = urem i32 %82, 20
  %84 = udiv i32 %82, 20
  %85 = udiv i32 %84, 120
  %86 = mul nuw nsw i32 %72, 1
  %87 = add nuw nsw i32 0, %86
  %param_2.17 = getelementptr inbounds [120 x [1 x [20 x [192 x double]]]], ptr %arg2, i32 0, i32 %84, i32 0, i32 %83, i32 %79
  %param_2.173 = load double, ptr %param_2.17, align 8, !invariant.load !9
  %param_3.12 = getelementptr inbounds [20 x [192 x double]], ptr %arg3, i32 0, i32 %83, i32 %79
  %param_3.124 = load double, ptr %param_3.12, align 8, !invariant.load !9
  %multiply.9.3 = fmul double %param_2.173, %param_3.124
  %param_1.36 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg1, i32 0, i32 0, i32 %83, i32 %79
  %param_1.365 = load double, ptr %param_1.36, align 8, !invariant.load !9
  %param_0.37 = getelementptr inbounds [120 x [20 x [192 x double]]], ptr %arg0, i32 0, i32 %84, i32 %83, i32 %79
  %param_0.376 = load double, ptr %param_0.37, align 8, !invariant.load !9
  %multiply.10.5 = fmul double %param_1.365, %param_0.376
  %add.4.3 = fadd double %multiply.9.3, %multiply.10.5
  store double %add.4.3, ptr %reduction_input_address, align 8
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %88 = load double, ptr %return_buffer, align 8
  store double %88, ptr %partial_reduction_result, align 8
  %89 = mul nuw nsw i32 %75, 1
  %90 = add nuw nsw i32 0, %89
  %91 = mul nuw nsw i32 %74, 2
  %92 = add nuw nsw i32 %90, %91
  %93 = udiv i32 %92, 192
  %94 = mul nuw nsw i32 %73, 1
  %95 = add nuw nsw i32 0, %94
  %96 = urem i32 %95, 20
  %97 = udiv i32 %95, 20
  %98 = udiv i32 %97, 1
  %99 = udiv i32 %98, 120
  %100 = mul nuw nsw i32 %72, 1
  %101 = add nuw nsw i32 0, %100
  %param_5.6 = getelementptr inbounds [120 x [20 x [1 x double]]], ptr %arg5, i32 0, i32 %98, i32 %96, i32 0
  %param_5.67 = load double, ptr %param_5.6, align 8, !invariant.load !9
  %param_1.368 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg1, i32 0, i32 0, i32 %96, i32 %92
  %param_1.369 = load double, ptr %param_1.368, align 8, !invariant.load !9
  %multiply.11.3.clone.1 = fmul double %param_5.67, %param_1.369
  %param_4.3 = getelementptr inbounds [20 x [1 x double]], ptr %arg4, i32 0, i32 %96, i32 0
  %param_4.310 = load double, ptr %param_4.3, align 8, !invariant.load !9
  %param_2.1711 = getelementptr inbounds [120 x [1 x [20 x [192 x double]]]], ptr %arg2, i32 0, i32 %98, i32 0, i32 %96, i32 %92
  %param_2.1712 = load double, ptr %param_2.1711, align 8, !invariant.load !9
  %multiply.12.3.clone.1 = fmul double %param_4.310, %param_2.1712
  %add.5.1.clone.1 = fadd double %multiply.11.3.clone.1, %multiply.12.3.clone.1
  %102 = mul nuw nsw i32 %75, 1
  %103 = add nuw nsw i32 0, %102
  %104 = mul nuw nsw i32 %74, 2
  %105 = add nuw nsw i32 %103, %104
  %106 = udiv i32 %105, 192
  %107 = mul nuw nsw i32 %73, 1
  %108 = add nuw nsw i32 0, %107
  %109 = urem i32 %108, 20
  %110 = udiv i32 %108, 20
  %111 = udiv i32 %110, 1
  %112 = udiv i32 %111, 120
  %113 = mul nuw nsw i32 %72, 1
  %114 = add nuw nsw i32 0, %113
  %115 = getelementptr inbounds [120 x [1 x [20 x [192 x double]]]], ptr %arg7, i32 0, i32 %111, i32 0, i32 %109, i32 %105
  store double %add.5.1.clone.1, ptr %115, align 8
  br label %loop3.loop_header, !llvm.loop !17

loop3.loop_exit:                                  ; preds = %loop3.loop_header
  br label %loop2.loop_header, !llvm.loop !18

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %loop1.loop_body
  store i32 0, ptr %loop2.invar_address16, align 4
  br label %loop2.loop_header14

loop2.loop_header14:                              ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar17 = load i32, ptr %loop2.invar_address16, align 4
  %116 = icmp uge i32 %loop2.indvar17, 256
  br i1 %116, label %loop2.loop_exit13, label %loop2.loop_body15

loop2.loop_body15:                                ; preds = %loop2.loop_header14
  %invar.inc18 = add nuw nsw i32 %loop2.indvar17, 32
  store i32 %invar.inc18, ptr %loop2.invar_address16, align 4
  %117 = add i32 %loop2.indvar17, %thread.id.2
  %118 = icmp ult i32 %117, %tile_bound.2
  br i1 %118, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %loop3.loop_exit19, %loop2.loop_body15
  br label %loop2.loop_header14, !llvm.loop !19

loop2.loop_exit13:                                ; preds = %loop2.loop_header14
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %loop2.loop_body15
  store i32 0, ptr %loop3.invar_address22, align 4
  br label %loop3.loop_header20

loop3.loop_header20:                              ; preds = %loop3.loop_body21, %x_in_tile-true
  %loop3.indvar23 = load i32, ptr %loop3.invar_address22, align 4
  %119 = icmp uge i32 %loop3.indvar23, 2
  br i1 %119, label %loop3.loop_exit19, label %loop3.loop_body21

loop3.loop_body21:                                ; preds = %loop3.loop_header20
  %invar.inc24 = add nuw nsw i32 %loop3.indvar23, 1
  store i32 %invar.inc24, ptr %loop3.invar_address22, align 4
  %120 = add i32 %tile_origin.0, 0
  %121 = add i32 %tile_origin.1, %loop1.indvar
  %122 = add i32 %tile_origin.2, %117
  %123 = add i32 %tile_origin.3, %loop3.indvar23
  %124 = mul nuw nsw i32 %123, 1
  %125 = add nuw nsw i32 0, %124
  %126 = mul nuw nsw i32 %122, 2
  %127 = add nuw nsw i32 %125, %126
  %128 = udiv i32 %127, 192
  %129 = mul nuw nsw i32 %121, 1
  %130 = add nuw nsw i32 0, %129
  %131 = urem i32 %130, 20
  %132 = udiv i32 %130, 20
  %133 = udiv i32 %132, 120
  %134 = mul nuw nsw i32 %120, 1
  %135 = add nuw nsw i32 0, %134
  %param_2.1725 = getelementptr inbounds [120 x [1 x [20 x [192 x double]]]], ptr %arg2, i32 0, i32 %132, i32 0, i32 %131, i32 %127
  %param_2.1726 = load double, ptr %param_2.1725, align 8, !invariant.load !9
  %param_3.1227 = getelementptr inbounds [20 x [192 x double]], ptr %arg3, i32 0, i32 %131, i32 %127
  %param_3.1228 = load double, ptr %param_3.1227, align 8, !invariant.load !9
  %multiply.9.329 = fmul double %param_2.1726, %param_3.1228
  %param_1.3630 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg1, i32 0, i32 0, i32 %131, i32 %127
  %param_1.3631 = load double, ptr %param_1.3630, align 8, !invariant.load !9
  %param_0.3732 = getelementptr inbounds [120 x [20 x [192 x double]]], ptr %arg0, i32 0, i32 %132, i32 %131, i32 %127
  %param_0.3733 = load double, ptr %param_0.3732, align 8, !invariant.load !9
  %multiply.10.534 = fmul double %param_1.3631, %param_0.3733
  %add.4.335 = fadd double %multiply.9.329, %multiply.10.534
  store double %add.4.335, ptr %reduction_input_address, align 8
  call void @region_0_42_56010df1e1d0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer36)
  %136 = load double, ptr %return_buffer36, align 8
  store double %136, ptr %partial_reduction_result, align 8
  %137 = mul nuw nsw i32 %123, 1
  %138 = add nuw nsw i32 0, %137
  %139 = mul nuw nsw i32 %122, 2
  %140 = add nuw nsw i32 %138, %139
  %141 = udiv i32 %140, 192
  %142 = mul nuw nsw i32 %121, 1
  %143 = add nuw nsw i32 0, %142
  %144 = urem i32 %143, 20
  %145 = udiv i32 %143, 20
  %146 = udiv i32 %145, 1
  %147 = udiv i32 %146, 120
  %148 = mul nuw nsw i32 %120, 1
  %149 = add nuw nsw i32 0, %148
  %param_5.637 = getelementptr inbounds [120 x [20 x [1 x double]]], ptr %arg5, i32 0, i32 %146, i32 %144, i32 0
  %param_5.638 = load double, ptr %param_5.637, align 8, !invariant.load !9
  %param_1.3639 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr %arg1, i32 0, i32 0, i32 %144, i32 %140
  %param_1.3640 = load double, ptr %param_1.3639, align 8, !invariant.load !9
  %multiply.11.3.clone.141 = fmul double %param_5.638, %param_1.3640
  %param_4.342 = getelementptr inbounds [20 x [1 x double]], ptr %arg4, i32 0, i32 %144, i32 0
  %param_4.343 = load double, ptr %param_4.342, align 8, !invariant.load !9
  %param_2.1744 = getelementptr inbounds [120 x [1 x [20 x [192 x double]]]], ptr %arg2, i32 0, i32 %146, i32 0, i32 %144, i32 %140
  %param_2.1745 = load double, ptr %param_2.1744, align 8, !invariant.load !9
  %multiply.12.3.clone.146 = fmul double %param_4.343, %param_2.1745
  %add.5.1.clone.147 = fadd double %multiply.11.3.clone.141, %multiply.12.3.clone.146
  %150 = mul nuw nsw i32 %123, 1
  %151 = add nuw nsw i32 0, %150
  %152 = mul nuw nsw i32 %122, 2
  %153 = add nuw nsw i32 %151, %152
  %154 = udiv i32 %153, 192
  %155 = mul nuw nsw i32 %121, 1
  %156 = add nuw nsw i32 0, %155
  %157 = urem i32 %156, 20
  %158 = udiv i32 %156, 20
  %159 = udiv i32 %158, 1
  %160 = udiv i32 %159, 120
  %161 = mul nuw nsw i32 %120, 1
  %162 = add nuw nsw i32 0, %161
  %163 = getelementptr inbounds [120 x [1 x [20 x [192 x double]]]], ptr %arg7, i32 0, i32 %159, i32 0, i32 %157, i32 %153
  store double %add.5.1.clone.147, ptr %163, align 8
  br label %loop3.loop_header20, !llvm.loop !20

loop3.loop_exit19:                                ; preds = %loop3.loop_header20
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %164 = icmp eq i32 %lane_id, 0
  br i1 %164, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  call void @llvm.nvvm.barrier0()
  %165 = icmp eq i32 %67, 0
  br i1 %165, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  %166 = load double, ptr %partial_reduction_result, align 8
  %167 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache1, i32 0, i32 %thread.id.1, i32 %67
  %168 = addrspacecast ptr addrspace(3) %167 to ptr
  store double %166, ptr %168, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %169 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache1, i32 0, i32 %thread.id.1, i32 %lane_id
  %170 = addrspacecast ptr addrspace(3) %169 to ptr
  store double %constant_7_2, ptr %initial_value_addr, align 8
  %171 = icmp ult i32 %thread.id.2, 1
  %172 = select i1 %171, ptr %170, ptr %initial_value_addr
  %173 = icmp eq i32 %thread.id.2, 0
  br i1 %173, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %174 = add i32 %tile_origin.1, %thread.id.1
  %175 = mul nuw nsw i32 %174, 1
  %176 = add nuw nsw i32 0, %175
  %177 = urem i32 %176, 20
  %178 = udiv i32 %176, 20
  %179 = udiv i32 %178, 120
  %output_element_address = getelementptr inbounds [120 x [20 x double]], ptr %arg6, i32 0, i32 %178, i32 %177
  %output = load double, ptr %172, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 256}
!2 = !{ptr @input_add_reduce_fusion, !"kernel", i32 1}
!3 = !{ptr @input_add_reduce_fusion, !"reqntidx", i32 256}
!4 = !{i32 0, i32 1}
!5 = !{i32 0, i32 256}
!6 = !{i32 0, i32 3}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.vectorize.enable", i1 false}
!9 = !{}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8, !12}
!12 = !{!"llvm.loop.unroll.full"}
!13 = distinct !{!13, !8, !12}
!14 = distinct !{!14, !8}
!15 = !{i32 0, i32 300}
!16 = distinct !{!16, !8}
!17 = distinct !{!17, !8}
!18 = distinct !{!18, !8, !12}
!19 = distinct !{!19, !8, !12}
!20 = distinct !{!20, !8}
