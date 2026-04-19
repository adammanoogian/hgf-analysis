; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [1 x [1 x double]] undef

define void @input_reduce_fusion(ptr noalias align 16 dereferenceable(384) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %initial_value_addr = alloca double, align 8
  %return_buffer24 = alloca double, align 8
  %result_from_other_lane22 = alloca double, align 8
  %return_buffer21 = alloca double, align 8
  %result_from_other_lane19 = alloca double, align 8
  %return_buffer18 = alloca double, align 8
  %result_from_other_lane16 = alloca double, align 8
  %return_buffer15 = alloca double, align 8
  %result_from_other_lane13 = alloca double, align 8
  %return_buffer12 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer10 = alloca double, align 8
  %loop2.invar_address5 = alloca i32, align 4
  %return_buffer = alloca double, align 8
  %loop2.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca double, align 8
  %reduction_input_address = alloca double, align 8
  %block.id.y = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !2
  %0 = icmp eq i32 %block.id.y, 0
  br i1 %0, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %thread_in_bounds-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %constant_2_1 = load double, ptr @0, align 8
  store double %constant_2_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %1 = udiv i32 %block.id.x, 1
  %2 = urem i32 %1, 1
  %3 = udiv i32 %block.id.x, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %block.id.x, 1
  %6 = icmp eq i32 %2, 0
  %tile_bound.2 = select i1 %6, i32 48, i32 512
  %tile_origin.0 = mul i32 %5, 1
  %tile_origin.1 = mul i32 %4, 1
  %tile_origin.2 = mul i32 %2, 512
  %7 = icmp eq i32 512, %tile_bound.2
  br i1 %7, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %loop2.loop_exit2, %loop2.loop_exit
  %partial_reduction_result11 = load double, ptr %partial_reduction_result, align 8
  %8 = bitcast double %partial_reduction_result11 to i64
  %9 = bitcast i64 %8 to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 16, i32 31)
  %12 = insertelement <2 x i32> %9, i32 %11, i64 0
  %13 = extractelement <2 x i32> %12, i64 1
  %14 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 16, i32 31)
  %15 = insertelement <2 x i32> %12, i32 %14, i64 1
  %16 = bitcast <2 x i32> %15 to i64
  %17 = bitcast i64 %16 to double
  store double %17, ptr %result_from_other_lane, align 8
  call void @region_0_3_55889ba09440_e5fc45201259cab2(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer12)
  %18 = load double, ptr %return_buffer12, align 8
  store double %18, ptr %partial_reduction_result, align 8
  %partial_reduction_result14 = load double, ptr %partial_reduction_result, align 8
  %19 = bitcast double %partial_reduction_result14 to i64
  %20 = bitcast i64 %19 to <2 x i32>
  %21 = extractelement <2 x i32> %20, i64 0
  %22 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %21, i32 8, i32 31)
  %23 = insertelement <2 x i32> %20, i32 %22, i64 0
  %24 = extractelement <2 x i32> %23, i64 1
  %25 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %24, i32 8, i32 31)
  %26 = insertelement <2 x i32> %23, i32 %25, i64 1
  %27 = bitcast <2 x i32> %26 to i64
  %28 = bitcast i64 %27 to double
  store double %28, ptr %result_from_other_lane13, align 8
  call void @region_0_3_55889ba09440_e5fc45201259cab2(ptr %partial_reduction_result, ptr %result_from_other_lane13, ptr %return_buffer15)
  %29 = load double, ptr %return_buffer15, align 8
  store double %29, ptr %partial_reduction_result, align 8
  %partial_reduction_result17 = load double, ptr %partial_reduction_result, align 8
  %30 = bitcast double %partial_reduction_result17 to i64
  %31 = bitcast i64 %30 to <2 x i32>
  %32 = extractelement <2 x i32> %31, i64 0
  %33 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 4, i32 31)
  %34 = insertelement <2 x i32> %31, i32 %33, i64 0
  %35 = extractelement <2 x i32> %34, i64 1
  %36 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %35, i32 4, i32 31)
  %37 = insertelement <2 x i32> %34, i32 %36, i64 1
  %38 = bitcast <2 x i32> %37 to i64
  %39 = bitcast i64 %38 to double
  store double %39, ptr %result_from_other_lane16, align 8
  call void @region_0_3_55889ba09440_e5fc45201259cab2(ptr %partial_reduction_result, ptr %result_from_other_lane16, ptr %return_buffer18)
  %40 = load double, ptr %return_buffer18, align 8
  store double %40, ptr %partial_reduction_result, align 8
  %partial_reduction_result20 = load double, ptr %partial_reduction_result, align 8
  %41 = bitcast double %partial_reduction_result20 to i64
  %42 = bitcast i64 %41 to <2 x i32>
  %43 = extractelement <2 x i32> %42, i64 0
  %44 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 2, i32 31)
  %45 = insertelement <2 x i32> %42, i32 %44, i64 0
  %46 = extractelement <2 x i32> %45, i64 1
  %47 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 2, i32 31)
  %48 = insertelement <2 x i32> %45, i32 %47, i64 1
  %49 = bitcast <2 x i32> %48 to i64
  %50 = bitcast i64 %49 to double
  store double %50, ptr %result_from_other_lane19, align 8
  call void @region_0_3_55889ba09440_e5fc45201259cab2(ptr %partial_reduction_result, ptr %result_from_other_lane19, ptr %return_buffer21)
  %51 = load double, ptr %return_buffer21, align 8
  store double %51, ptr %partial_reduction_result, align 8
  %partial_reduction_result23 = load double, ptr %partial_reduction_result, align 8
  %52 = bitcast double %partial_reduction_result23 to i64
  %53 = bitcast i64 %52 to <2 x i32>
  %54 = extractelement <2 x i32> %53, i64 0
  %55 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %54, i32 1, i32 31)
  %56 = insertelement <2 x i32> %53, i32 %55, i64 0
  %57 = extractelement <2 x i32> %56, i64 1
  %58 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %57, i32 1, i32 31)
  %59 = insertelement <2 x i32> %56, i32 %58, i64 1
  %60 = bitcast <2 x i32> %59 to i64
  %61 = bitcast i64 %60 to double
  store double %61, ptr %result_from_other_lane22, align 8
  call void @region_0_3_55889ba09440_e5fc45201259cab2(ptr %partial_reduction_result, ptr %result_from_other_lane22, ptr %return_buffer24)
  %62 = load double, ptr %return_buffer24, align 8
  store double %62, ptr %partial_reduction_result, align 8
  %63 = udiv i32 %thread.id.2, 32
  br i1 true, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %inter_warp_reduce-after, %is_full_tile-after
  br label %reduce-group-0-after

is_full_tile-true:                                ; preds = %reduce-group-0-true
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %loop2.loop_body, %is_full_tile-true
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %64 = icmp uge i32 %loop2.indvar, 512
  br i1 %64, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc = add nuw nsw i32 %loop2.indvar, 32
  store i32 %invar.inc, ptr %loop2.invar_address, align 4
  %65 = add i32 %loop2.indvar, %thread.id.2
  %66 = add i32 %tile_origin.0, 0
  %67 = add i32 %tile_origin.1, 0
  %68 = add i32 %tile_origin.2, %65
  %param_0 = getelementptr inbounds [48 x double], ptr %arg0, i32 0, i32 %68
  %param_01 = load double, ptr %param_0, align 8, !invariant.load !4
  store double %param_01, ptr %reduction_input_address, align 8
  call void @region_0_3_55889ba09440_e5fc45201259cab2(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %69 = load double, ptr %return_buffer, align 8
  store double %69, ptr %partial_reduction_result, align 8
  br label %loop2.loop_header, !llvm.loop !5

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %reduce-group-0-true
  store i32 0, ptr %loop2.invar_address5, align 4
  br label %loop2.loop_header3

loop2.loop_header3:                               ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar6 = load i32, ptr %loop2.invar_address5, align 4
  %70 = icmp uge i32 %loop2.indvar6, 512
  br i1 %70, label %loop2.loop_exit2, label %loop2.loop_body4

loop2.loop_body4:                                 ; preds = %loop2.loop_header3
  %invar.inc7 = add nuw nsw i32 %loop2.indvar6, 32
  store i32 %invar.inc7, ptr %loop2.invar_address5, align 4
  %71 = add i32 %loop2.indvar6, %thread.id.2
  %72 = icmp ult i32 %71, %tile_bound.2
  br i1 %72, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body4
  br label %loop2.loop_header3, !llvm.loop !8

loop2.loop_exit2:                                 ; preds = %loop2.loop_header3
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %loop2.loop_body4
  %73 = add i32 %tile_origin.0, 0
  %74 = add i32 %tile_origin.1, 0
  %75 = add i32 %tile_origin.2, %71
  %param_08 = getelementptr inbounds [48 x double], ptr %arg0, i32 0, i32 %75
  %param_09 = load double, ptr %param_08, align 8, !invariant.load !4
  store double %param_09, ptr %reduction_input_address, align 8
  call void @region_0_3_55889ba09440_e5fc45201259cab2(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer10)
  %76 = load double, ptr %return_buffer10, align 8
  store double %76, ptr %partial_reduction_result, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %is_full_tile-after
  %77 = icmp eq i32 %lane_id, 0
  br i1 %77, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  call void @llvm.nvvm.barrier0()
  %78 = icmp eq i32 %63, 0
  br i1 %78, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  %79 = load double, ptr %partial_reduction_result, align 8
  %80 = getelementptr inbounds [1 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 0, i32 %63
  %81 = addrspacecast ptr addrspace(3) %80 to ptr
  store double %79, ptr %81, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %82 = getelementptr inbounds [1 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 0, i32 %lane_id
  %83 = addrspacecast ptr addrspace(3) %82 to ptr
  store double %constant_2_1, ptr %initial_value_addr, align 8
  %84 = icmp ult i32 %thread.id.2, 1
  %85 = select i1 %84, ptr %83, ptr %initial_value_addr
  %86 = icmp eq i32 %thread.id.2, 0
  br i1 %86, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %87 = add i32 %tile_origin.1, 0
  %output = load double, ptr %85, align 8
  store double %output, ptr %arg1, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_3_55889ba09440_e5fc45201259cab2(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.4 = load double, ptr %0, align 8
  %Arg_1.5 = load double, ptr %1, align 8
  %add.1 = fadd double %Arg_0.4, %Arg_1.5
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

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 32}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 32}
!4 = !{}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.vectorize.enable", i1 false}
!7 = !{!"llvm.loop.unroll.full"}
!8 = distinct !{!8, !6, !7}
