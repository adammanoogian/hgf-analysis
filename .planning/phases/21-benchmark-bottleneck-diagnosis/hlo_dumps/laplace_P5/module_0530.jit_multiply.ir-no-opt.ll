; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [4 x [1 x double]] undef
@1 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [8 x [1 x double]] undef

define void @input_multiply_reduce_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(6144) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(6144) %arg4) {
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
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = udiv i32 %thread.id.x, 32
  %thread.id.1 = urem i32 %1, 4
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = urem i32 %6, 1
  %8 = udiv i32 %block.id.x, 1
  %9 = icmp eq i32 %5, 0
  %tile_bound.2 = select i1 %9, i32 96, i32 256
  %tile_origin.0 = mul i32 %8, 1
  %tile_origin.1 = mul i32 %7, 4
  %tile_origin.2 = mul i32 %5, 256
  %tile_origin.3 = mul i32 %3, 2
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %is_full_tile-after, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %10 = icmp uge i32 %loop1.indvar, 4
  br i1 %10, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 4
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  %11 = icmp eq i32 256, %tile_bound.2
  br i1 %11, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %loop2.loop_exit8, %loop2.loop_exit
  br label %loop1.loop_header, !llvm.loop !6

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result31 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result31 to i64
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
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer32)
  %22 = load double, ptr %return_buffer32, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result34 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result34 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 8, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 8, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane33, align 8
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane33, ptr %return_buffer35)
  %33 = load double, ptr %return_buffer35, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %partial_reduction_result37 = load double, ptr %partial_reduction_result, align 8
  %34 = bitcast double %partial_reduction_result37 to i64
  %35 = bitcast i64 %34 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 4, i32 31)
  %38 = insertelement <2 x i32> %35, i32 %37, i64 0
  %39 = extractelement <2 x i32> %38, i64 1
  %40 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to i64
  %43 = bitcast i64 %42 to double
  store double %43, ptr %result_from_other_lane36, align 8
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane36, ptr %return_buffer38)
  %44 = load double, ptr %return_buffer38, align 8
  store double %44, ptr %partial_reduction_result, align 8
  %partial_reduction_result40 = load double, ptr %partial_reduction_result, align 8
  %45 = bitcast double %partial_reduction_result40 to i64
  %46 = bitcast i64 %45 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> %46, i32 %48, i64 0
  %50 = extractelement <2 x i32> %49, i64 1
  %51 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 2, i32 31)
  %52 = insertelement <2 x i32> %49, i32 %51, i64 1
  %53 = bitcast <2 x i32> %52 to i64
  %54 = bitcast i64 %53 to double
  store double %54, ptr %result_from_other_lane39, align 8
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane39, ptr %return_buffer41)
  %55 = load double, ptr %return_buffer41, align 8
  store double %55, ptr %partial_reduction_result, align 8
  %partial_reduction_result43 = load double, ptr %partial_reduction_result, align 8
  %56 = bitcast double %partial_reduction_result43 to i64
  %57 = bitcast i64 %56 to <2 x i32>
  %58 = extractelement <2 x i32> %57, i64 0
  %59 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 1, i32 31)
  %60 = insertelement <2 x i32> %57, i32 %59, i64 0
  %61 = extractelement <2 x i32> %60, i64 1
  %62 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 1, i32 31)
  %63 = insertelement <2 x i32> %60, i32 %62, i64 1
  %64 = bitcast <2 x i32> %63 to i64
  %65 = bitcast i64 %64 to double
  store double %65, ptr %result_from_other_lane42, align 8
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane42, ptr %return_buffer44)
  %66 = load double, ptr %return_buffer44, align 8
  store double %66, ptr %partial_reduction_result, align 8
  %67 = udiv i32 %thread.id.2, 32
  %68 = icmp ult i32 %thread.id.1, 4
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
  %83 = udiv i32 %82, 4
  %84 = mul nuw nsw i32 %72, 1
  %85 = add nuw nsw i32 0, %84
  %param_0.37 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %82, i32 %79
  %param_0.373 = load double, ptr %param_0.37, align 8, !invariant.load !8
  %param_1.35 = getelementptr inbounds [4 x [192 x double]], ptr %arg1, i32 0, i32 %82, i32 %79
  %param_1.354 = load double, ptr %param_1.35, align 8, !invariant.load !8
  %multiply.7.3 = fmul double %param_0.373, %param_1.354
  store double %multiply.7.3, ptr %reduction_input_address, align 8
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %86 = load double, ptr %return_buffer, align 8
  store double %86, ptr %partial_reduction_result, align 8
  %87 = mul nuw nsw i32 %75, 1
  %88 = add nuw nsw i32 0, %87
  %89 = mul nuw nsw i32 %74, 2
  %90 = add nuw nsw i32 %88, %89
  %91 = udiv i32 %90, 192
  %92 = mul nuw nsw i32 %73, 1
  %93 = add nuw nsw i32 0, %92
  %94 = udiv i32 %93, 4
  %95 = mul nuw nsw i32 %72, 1
  %96 = add nuw nsw i32 0, %95
  %97 = udiv i32 %96, 1
  %param_2.20 = getelementptr inbounds [4 x [1 x double]], ptr %arg2, i32 0, i32 %93, i32 0
  %param_2.205 = load double, ptr %param_2.20, align 8, !invariant.load !8
  %param_0.376 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %93, i32 %90
  %param_0.377 = load double, ptr %param_0.376, align 8, !invariant.load !8
  %multiply.8.1.clone.1 = fmul double %param_2.205, %param_0.377
  %98 = mul nuw nsw i32 %75, 1
  %99 = add nuw nsw i32 0, %98
  %100 = mul nuw nsw i32 %74, 2
  %101 = add nuw nsw i32 %99, %100
  %102 = udiv i32 %101, 192
  %103 = mul nuw nsw i32 %73, 1
  %104 = add nuw nsw i32 0, %103
  %105 = udiv i32 %104, 4
  %106 = mul nuw nsw i32 %72, 1
  %107 = add nuw nsw i32 0, %106
  %108 = udiv i32 %107, 1
  %109 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg4, i32 0, i32 0, i32 %104, i32 %101
  store double %multiply.8.1.clone.1, ptr %109, align 8
  br label %loop3.loop_header, !llvm.loop !9

loop3.loop_exit:                                  ; preds = %loop3.loop_header
  br label %loop2.loop_header, !llvm.loop !10

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %loop1.loop_body
  store i32 0, ptr %loop2.invar_address11, align 4
  br label %loop2.loop_header9

loop2.loop_header9:                               ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar12 = load i32, ptr %loop2.invar_address11, align 4
  %110 = icmp uge i32 %loop2.indvar12, 256
  br i1 %110, label %loop2.loop_exit8, label %loop2.loop_body10

loop2.loop_body10:                                ; preds = %loop2.loop_header9
  %invar.inc13 = add nuw nsw i32 %loop2.indvar12, 32
  store i32 %invar.inc13, ptr %loop2.invar_address11, align 4
  %111 = add i32 %loop2.indvar12, %thread.id.2
  %112 = icmp ult i32 %111, %tile_bound.2
  br i1 %112, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %loop3.loop_exit14, %loop2.loop_body10
  br label %loop2.loop_header9, !llvm.loop !12

loop2.loop_exit8:                                 ; preds = %loop2.loop_header9
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %loop2.loop_body10
  store i32 0, ptr %loop3.invar_address17, align 4
  br label %loop3.loop_header15

loop3.loop_header15:                              ; preds = %loop3.loop_body16, %x_in_tile-true
  %loop3.indvar18 = load i32, ptr %loop3.invar_address17, align 4
  %113 = icmp uge i32 %loop3.indvar18, 2
  br i1 %113, label %loop3.loop_exit14, label %loop3.loop_body16

loop3.loop_body16:                                ; preds = %loop3.loop_header15
  %invar.inc19 = add nuw nsw i32 %loop3.indvar18, 1
  store i32 %invar.inc19, ptr %loop3.invar_address17, align 4
  %114 = add i32 %tile_origin.0, 0
  %115 = add i32 %tile_origin.1, %loop1.indvar
  %116 = add i32 %tile_origin.2, %111
  %117 = add i32 %tile_origin.3, %loop3.indvar18
  %118 = mul nuw nsw i32 %117, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %116, 2
  %121 = add nuw nsw i32 %119, %120
  %122 = udiv i32 %121, 192
  %123 = mul nuw nsw i32 %115, 1
  %124 = add nuw nsw i32 0, %123
  %125 = udiv i32 %124, 4
  %126 = mul nuw nsw i32 %114, 1
  %127 = add nuw nsw i32 0, %126
  %param_0.3720 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %124, i32 %121
  %param_0.3721 = load double, ptr %param_0.3720, align 8, !invariant.load !8
  %param_1.3522 = getelementptr inbounds [4 x [192 x double]], ptr %arg1, i32 0, i32 %124, i32 %121
  %param_1.3523 = load double, ptr %param_1.3522, align 8, !invariant.load !8
  %multiply.7.324 = fmul double %param_0.3721, %param_1.3523
  store double %multiply.7.324, ptr %reduction_input_address, align 8
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer25)
  %128 = load double, ptr %return_buffer25, align 8
  store double %128, ptr %partial_reduction_result, align 8
  %129 = mul nuw nsw i32 %117, 1
  %130 = add nuw nsw i32 0, %129
  %131 = mul nuw nsw i32 %116, 2
  %132 = add nuw nsw i32 %130, %131
  %133 = udiv i32 %132, 192
  %134 = mul nuw nsw i32 %115, 1
  %135 = add nuw nsw i32 0, %134
  %136 = udiv i32 %135, 4
  %137 = mul nuw nsw i32 %114, 1
  %138 = add nuw nsw i32 0, %137
  %139 = udiv i32 %138, 1
  %param_2.2026 = getelementptr inbounds [4 x [1 x double]], ptr %arg2, i32 0, i32 %135, i32 0
  %param_2.2027 = load double, ptr %param_2.2026, align 8, !invariant.load !8
  %param_0.3728 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg0, i32 0, i32 0, i32 %135, i32 %132
  %param_0.3729 = load double, ptr %param_0.3728, align 8, !invariant.load !8
  %multiply.8.1.clone.130 = fmul double %param_2.2027, %param_0.3729
  %140 = mul nuw nsw i32 %117, 1
  %141 = add nuw nsw i32 0, %140
  %142 = mul nuw nsw i32 %116, 2
  %143 = add nuw nsw i32 %141, %142
  %144 = udiv i32 %143, 192
  %145 = mul nuw nsw i32 %115, 1
  %146 = add nuw nsw i32 0, %145
  %147 = udiv i32 %146, 4
  %148 = mul nuw nsw i32 %114, 1
  %149 = add nuw nsw i32 0, %148
  %150 = udiv i32 %149, 1
  %151 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg4, i32 0, i32 0, i32 %146, i32 %143
  store double %multiply.8.1.clone.130, ptr %151, align 8
  br label %loop3.loop_header15, !llvm.loop !13

loop3.loop_exit14:                                ; preds = %loop3.loop_header15
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %152 = icmp eq i32 %lane_id, 0
  br i1 %152, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  call void @llvm.nvvm.barrier0()
  %153 = icmp eq i32 %67, 0
  br i1 %153, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  %154 = load double, ptr %partial_reduction_result, align 8
  %155 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %67
  %156 = addrspacecast ptr addrspace(3) %155 to ptr
  store double %154, ptr %156, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %157 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %lane_id
  %158 = addrspacecast ptr addrspace(3) %157 to ptr
  store double %constant_7_1, ptr %initial_value_addr, align 8
  %159 = icmp ult i32 %thread.id.2, 1
  %160 = select i1 %159, ptr %158, ptr %initial_value_addr
  %161 = icmp eq i32 %thread.id.2, 0
  br i1 %161, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %162 = add i32 %tile_origin.1, %thread.id.1
  %output_element_address = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %162
  %output = load double, ptr %160, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
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

define void @input_add_reduce_fusion(ptr noalias align 16 dereferenceable(147456) %arg0, ptr noalias align 16 dereferenceable(6144) %arg1, ptr noalias align 16 dereferenceable(147456) %arg2, ptr noalias align 16 dereferenceable(6144) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(768) %arg5, ptr noalias align 128 dereferenceable(768) %arg6, ptr noalias align 128 dereferenceable(147456) %arg7) {
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
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !14
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
  %7 = urem i32 %6, 12
  %8 = udiv i32 %block.id.x, 12
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
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer49)
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
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane50, ptr %return_buffer52)
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
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane53, ptr %return_buffer55)
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
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane56, ptr %return_buffer58)
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
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane59, ptr %return_buffer61)
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
  %83 = urem i32 %82, 4
  %84 = udiv i32 %82, 4
  %85 = udiv i32 %84, 24
  %86 = mul nuw nsw i32 %72, 1
  %87 = add nuw nsw i32 0, %86
  %param_2.17 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr %arg2, i32 0, i32 %84, i32 0, i32 %83, i32 %79
  %param_2.173 = load double, ptr %param_2.17, align 8, !invariant.load !8
  %param_3.14 = getelementptr inbounds [4 x [192 x double]], ptr %arg3, i32 0, i32 %83, i32 %79
  %param_3.144 = load double, ptr %param_3.14, align 8, !invariant.load !8
  %multiply.9.3 = fmul double %param_2.173, %param_3.144
  %param_1.36 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg1, i32 0, i32 0, i32 %83, i32 %79
  %param_1.365 = load double, ptr %param_1.36, align 8, !invariant.load !8
  %param_0.38 = getelementptr inbounds [24 x [4 x [192 x double]]], ptr %arg0, i32 0, i32 %84, i32 %83, i32 %79
  %param_0.386 = load double, ptr %param_0.38, align 8, !invariant.load !8
  %multiply.10.5 = fmul double %param_1.365, %param_0.386
  %add.4.3 = fadd double %multiply.9.3, %multiply.10.5
  store double %add.4.3, ptr %reduction_input_address, align 8
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %88 = load double, ptr %return_buffer, align 8
  store double %88, ptr %partial_reduction_result, align 8
  %89 = mul nuw nsw i32 %75, 1
  %90 = add nuw nsw i32 0, %89
  %91 = mul nuw nsw i32 %74, 2
  %92 = add nuw nsw i32 %90, %91
  %93 = udiv i32 %92, 192
  %94 = mul nuw nsw i32 %73, 1
  %95 = add nuw nsw i32 0, %94
  %96 = urem i32 %95, 4
  %97 = udiv i32 %95, 4
  %98 = udiv i32 %97, 1
  %99 = udiv i32 %98, 24
  %100 = mul nuw nsw i32 %72, 1
  %101 = add nuw nsw i32 0, %100
  %param_5.6 = getelementptr inbounds [24 x [4 x [1 x double]]], ptr %arg5, i32 0, i32 %98, i32 %96, i32 0
  %param_5.67 = load double, ptr %param_5.6, align 8, !invariant.load !8
  %param_1.368 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg1, i32 0, i32 0, i32 %96, i32 %92
  %param_1.369 = load double, ptr %param_1.368, align 8, !invariant.load !8
  %multiply.11.3.clone.1 = fmul double %param_5.67, %param_1.369
  %param_4.3 = getelementptr inbounds [4 x [1 x double]], ptr %arg4, i32 0, i32 %96, i32 0
  %param_4.310 = load double, ptr %param_4.3, align 8, !invariant.load !8
  %param_2.1711 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr %arg2, i32 0, i32 %98, i32 0, i32 %96, i32 %92
  %param_2.1712 = load double, ptr %param_2.1711, align 8, !invariant.load !8
  %multiply.12.3.clone.1 = fmul double %param_4.310, %param_2.1712
  %add.5.1.clone.1 = fadd double %multiply.11.3.clone.1, %multiply.12.3.clone.1
  %102 = mul nuw nsw i32 %75, 1
  %103 = add nuw nsw i32 0, %102
  %104 = mul nuw nsw i32 %74, 2
  %105 = add nuw nsw i32 %103, %104
  %106 = udiv i32 %105, 192
  %107 = mul nuw nsw i32 %73, 1
  %108 = add nuw nsw i32 0, %107
  %109 = urem i32 %108, 4
  %110 = udiv i32 %108, 4
  %111 = udiv i32 %110, 1
  %112 = udiv i32 %111, 24
  %113 = mul nuw nsw i32 %72, 1
  %114 = add nuw nsw i32 0, %113
  %115 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr %arg7, i32 0, i32 %111, i32 0, i32 %109, i32 %105
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
  %131 = urem i32 %130, 4
  %132 = udiv i32 %130, 4
  %133 = udiv i32 %132, 24
  %134 = mul nuw nsw i32 %120, 1
  %135 = add nuw nsw i32 0, %134
  %param_2.1725 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr %arg2, i32 0, i32 %132, i32 0, i32 %131, i32 %127
  %param_2.1726 = load double, ptr %param_2.1725, align 8, !invariant.load !8
  %param_3.1427 = getelementptr inbounds [4 x [192 x double]], ptr %arg3, i32 0, i32 %131, i32 %127
  %param_3.1428 = load double, ptr %param_3.1427, align 8, !invariant.load !8
  %multiply.9.329 = fmul double %param_2.1726, %param_3.1428
  %param_1.3630 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg1, i32 0, i32 0, i32 %131, i32 %127
  %param_1.3631 = load double, ptr %param_1.3630, align 8, !invariant.load !8
  %param_0.3832 = getelementptr inbounds [24 x [4 x [192 x double]]], ptr %arg0, i32 0, i32 %132, i32 %131, i32 %127
  %param_0.3833 = load double, ptr %param_0.3832, align 8, !invariant.load !8
  %multiply.10.534 = fmul double %param_1.3631, %param_0.3833
  %add.4.335 = fadd double %multiply.9.329, %multiply.10.534
  store double %add.4.335, ptr %reduction_input_address, align 8
  call void @region_0_42_55fe7c3eebb0_79b0d34134220a8b(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer36)
  %136 = load double, ptr %return_buffer36, align 8
  store double %136, ptr %partial_reduction_result, align 8
  %137 = mul nuw nsw i32 %123, 1
  %138 = add nuw nsw i32 0, %137
  %139 = mul nuw nsw i32 %122, 2
  %140 = add nuw nsw i32 %138, %139
  %141 = udiv i32 %140, 192
  %142 = mul nuw nsw i32 %121, 1
  %143 = add nuw nsw i32 0, %142
  %144 = urem i32 %143, 4
  %145 = udiv i32 %143, 4
  %146 = udiv i32 %145, 1
  %147 = udiv i32 %146, 24
  %148 = mul nuw nsw i32 %120, 1
  %149 = add nuw nsw i32 0, %148
  %param_5.637 = getelementptr inbounds [24 x [4 x [1 x double]]], ptr %arg5, i32 0, i32 %146, i32 %144, i32 0
  %param_5.638 = load double, ptr %param_5.637, align 8, !invariant.load !8
  %param_1.3639 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr %arg1, i32 0, i32 0, i32 %144, i32 %140
  %param_1.3640 = load double, ptr %param_1.3639, align 8, !invariant.load !8
  %multiply.11.3.clone.141 = fmul double %param_5.638, %param_1.3640
  %param_4.342 = getelementptr inbounds [4 x [1 x double]], ptr %arg4, i32 0, i32 %144, i32 0
  %param_4.343 = load double, ptr %param_4.342, align 8, !invariant.load !8
  %param_2.1744 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr %arg2, i32 0, i32 %146, i32 0, i32 %144, i32 %140
  %param_2.1745 = load double, ptr %param_2.1744, align 8, !invariant.load !8
  %multiply.12.3.clone.146 = fmul double %param_4.343, %param_2.1745
  %add.5.1.clone.147 = fadd double %multiply.11.3.clone.141, %multiply.12.3.clone.146
  %150 = mul nuw nsw i32 %123, 1
  %151 = add nuw nsw i32 0, %150
  %152 = mul nuw nsw i32 %122, 2
  %153 = add nuw nsw i32 %151, %152
  %154 = udiv i32 %153, 192
  %155 = mul nuw nsw i32 %121, 1
  %156 = add nuw nsw i32 0, %155
  %157 = urem i32 %156, 4
  %158 = udiv i32 %156, 4
  %159 = udiv i32 %158, 1
  %160 = udiv i32 %159, 24
  %161 = mul nuw nsw i32 %120, 1
  %162 = add nuw nsw i32 0, %161
  %163 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr %arg7, i32 0, i32 %159, i32 0, i32 %157, i32 %153
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
  %177 = urem i32 %176, 4
  %178 = udiv i32 %176, 4
  %179 = udiv i32 %178, 24
  %output_element_address = getelementptr inbounds [24 x [4 x double]], ptr %arg6, i32 0, i32 %178, i32 %177
  %output = load double, ptr %172, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 128}
!2 = !{ptr @input_add_reduce_fusion, !"kernel", i32 1}
!3 = !{ptr @input_add_reduce_fusion, !"reqntidx", i32 256}
!4 = !{i32 0, i32 1}
!5 = !{i32 0, i32 128}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.vectorize.enable", i1 false}
!8 = !{}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7, !11}
!11 = !{!"llvm.loop.unroll.full"}
!12 = distinct !{!12, !7, !11}
!13 = distinct !{!13, !7}
!14 = !{i32 0, i32 256}
!15 = !{i32 0, i32 12}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7, !11}
!19 = distinct !{!19, !7, !11}
!20 = distinct !{!20, !7}
