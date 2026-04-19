; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [4 x [1 x double]] undef

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
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !2
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_4_1 = load double, ptr @0, align 8
  store double %constant_4_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
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
  br label %loop1.loop_header, !llvm.loop !4

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
  call void @region_0_10_557ff7d4f150_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer32)
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
  call void @region_0_10_557ff7d4f150_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane33, ptr %return_buffer35)
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
  call void @region_0_10_557ff7d4f150_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane36, ptr %return_buffer38)
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
  call void @region_0_10_557ff7d4f150_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane39, ptr %return_buffer41)
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
  call void @region_0_10_557ff7d4f150_c5d0f531a335066f(ptr %partial_reduction_result, ptr %result_from_other_lane42, ptr %return_buffer44)
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
  %param_0.7 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %82, i32 %79
  %param_0.73 = load double, ptr %param_0.7, align 8, !invariant.load !6
  %param_1.5 = getelementptr inbounds [4 x [192 x double]], ptr %arg1, i32 0, i32 %82, i32 %79
  %param_1.54 = load double, ptr %param_1.5, align 8, !invariant.load !6
  %multiply.2.1 = fmul double %param_0.73, %param_1.54
  store double %multiply.2.1, ptr %reduction_input_address, align 8
  call void @region_0_10_557ff7d4f150_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
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
  %param_2.3 = getelementptr inbounds [4 x [1 x double]], ptr %arg2, i32 0, i32 %93, i32 0
  %param_2.35 = load double, ptr %param_2.3, align 8, !invariant.load !6
  %param_0.76 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %93, i32 %90
  %param_0.77 = load double, ptr %param_0.76, align 8, !invariant.load !6
  %multiply.3.1.clone.1 = fmul double %param_2.35, %param_0.77
  %97 = mul nuw nsw i32 %75, 1
  %98 = add nuw nsw i32 0, %97
  %99 = mul nuw nsw i32 %74, 2
  %100 = add nuw nsw i32 %98, %99
  %101 = udiv i32 %100, 192
  %102 = mul nuw nsw i32 %73, 1
  %103 = add nuw nsw i32 0, %102
  %104 = udiv i32 %103, 4
  %105 = mul nuw nsw i32 %72, 1
  %106 = add nuw nsw i32 0, %105
  %107 = getelementptr inbounds [4 x [192 x double]], ptr %arg4, i32 0, i32 %103, i32 %100
  store double %multiply.3.1.clone.1, ptr %107, align 8
  br label %loop3.loop_header, !llvm.loop !7

loop3.loop_exit:                                  ; preds = %loop3.loop_header
  br label %loop2.loop_header, !llvm.loop !8

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %loop1.loop_body
  store i32 0, ptr %loop2.invar_address11, align 4
  br label %loop2.loop_header9

loop2.loop_header9:                               ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar12 = load i32, ptr %loop2.invar_address11, align 4
  %108 = icmp uge i32 %loop2.indvar12, 256
  br i1 %108, label %loop2.loop_exit8, label %loop2.loop_body10

loop2.loop_body10:                                ; preds = %loop2.loop_header9
  %invar.inc13 = add nuw nsw i32 %loop2.indvar12, 32
  store i32 %invar.inc13, ptr %loop2.invar_address11, align 4
  %109 = add i32 %loop2.indvar12, %thread.id.2
  %110 = icmp ult i32 %109, %tile_bound.2
  br i1 %110, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %loop3.loop_exit14, %loop2.loop_body10
  br label %loop2.loop_header9, !llvm.loop !10

loop2.loop_exit8:                                 ; preds = %loop2.loop_header9
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %loop2.loop_body10
  store i32 0, ptr %loop3.invar_address17, align 4
  br label %loop3.loop_header15

loop3.loop_header15:                              ; preds = %loop3.loop_body16, %x_in_tile-true
  %loop3.indvar18 = load i32, ptr %loop3.invar_address17, align 4
  %111 = icmp uge i32 %loop3.indvar18, 2
  br i1 %111, label %loop3.loop_exit14, label %loop3.loop_body16

loop3.loop_body16:                                ; preds = %loop3.loop_header15
  %invar.inc19 = add nuw nsw i32 %loop3.indvar18, 1
  store i32 %invar.inc19, ptr %loop3.invar_address17, align 4
  %112 = add i32 %tile_origin.0, 0
  %113 = add i32 %tile_origin.1, %loop1.indvar
  %114 = add i32 %tile_origin.2, %109
  %115 = add i32 %tile_origin.3, %loop3.indvar18
  %116 = mul nuw nsw i32 %115, 1
  %117 = add nuw nsw i32 0, %116
  %118 = mul nuw nsw i32 %114, 2
  %119 = add nuw nsw i32 %117, %118
  %120 = udiv i32 %119, 192
  %121 = mul nuw nsw i32 %113, 1
  %122 = add nuw nsw i32 0, %121
  %123 = udiv i32 %122, 4
  %124 = mul nuw nsw i32 %112, 1
  %125 = add nuw nsw i32 0, %124
  %param_0.720 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %122, i32 %119
  %param_0.721 = load double, ptr %param_0.720, align 8, !invariant.load !6
  %param_1.522 = getelementptr inbounds [4 x [192 x double]], ptr %arg1, i32 0, i32 %122, i32 %119
  %param_1.523 = load double, ptr %param_1.522, align 8, !invariant.load !6
  %multiply.2.124 = fmul double %param_0.721, %param_1.523
  store double %multiply.2.124, ptr %reduction_input_address, align 8
  call void @region_0_10_557ff7d4f150_c5d0f531a335066f(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer25)
  %126 = load double, ptr %return_buffer25, align 8
  store double %126, ptr %partial_reduction_result, align 8
  %127 = mul nuw nsw i32 %115, 1
  %128 = add nuw nsw i32 0, %127
  %129 = mul nuw nsw i32 %114, 2
  %130 = add nuw nsw i32 %128, %129
  %131 = udiv i32 %130, 192
  %132 = mul nuw nsw i32 %113, 1
  %133 = add nuw nsw i32 0, %132
  %134 = udiv i32 %133, 4
  %135 = mul nuw nsw i32 %112, 1
  %136 = add nuw nsw i32 0, %135
  %param_2.326 = getelementptr inbounds [4 x [1 x double]], ptr %arg2, i32 0, i32 %133, i32 0
  %param_2.327 = load double, ptr %param_2.326, align 8, !invariant.load !6
  %param_0.728 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %133, i32 %130
  %param_0.729 = load double, ptr %param_0.728, align 8, !invariant.load !6
  %multiply.3.1.clone.130 = fmul double %param_2.327, %param_0.729
  %137 = mul nuw nsw i32 %115, 1
  %138 = add nuw nsw i32 0, %137
  %139 = mul nuw nsw i32 %114, 2
  %140 = add nuw nsw i32 %138, %139
  %141 = udiv i32 %140, 192
  %142 = mul nuw nsw i32 %113, 1
  %143 = add nuw nsw i32 0, %142
  %144 = udiv i32 %143, 4
  %145 = mul nuw nsw i32 %112, 1
  %146 = add nuw nsw i32 0, %145
  %147 = getelementptr inbounds [4 x [192 x double]], ptr %arg4, i32 0, i32 %143, i32 %140
  store double %multiply.3.1.clone.130, ptr %147, align 8
  br label %loop3.loop_header15, !llvm.loop !11

loop3.loop_exit14:                                ; preds = %loop3.loop_header15
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %148 = icmp eq i32 %lane_id, 0
  br i1 %148, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  call void @llvm.nvvm.barrier0()
  %149 = icmp eq i32 %67, 0
  br i1 %149, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  %150 = load double, ptr %partial_reduction_result, align 8
  %151 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %67
  %152 = addrspacecast ptr addrspace(3) %151 to ptr
  store double %150, ptr %152, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %153 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %lane_id
  %154 = addrspacecast ptr addrspace(3) %153 to ptr
  store double %constant_4_1, ptr %initial_value_addr, align 8
  %155 = icmp ult i32 %thread.id.2, 1
  %156 = select i1 %155, ptr %154, ptr %initial_value_addr
  %157 = icmp eq i32 %thread.id.2, 0
  br i1 %157, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %158 = add i32 %tile_origin.1, %thread.id.1
  %output_element_address = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %158
  %output = load double, ptr %156, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_10_557ff7d4f150_c5d0f531a335066f(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
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
!1 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 128}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 128}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.vectorize.enable", i1 false}
!6 = !{}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5, !9}
!9 = !{!"llvm.loop.unroll.full"}
!10 = distinct !{!10, !5, !9}
!11 = distinct !{!11, !5}
