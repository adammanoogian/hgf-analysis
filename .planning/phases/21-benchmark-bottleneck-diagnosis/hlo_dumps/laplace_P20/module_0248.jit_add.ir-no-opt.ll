; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [8 x [1 x double]] undef

define void @input_reduce_fusion(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1) {
entry:
  %initial_value_addr = alloca double, align 8
  %return_buffer32 = alloca double, align 8
  %result_from_other_lane30 = alloca double, align 8
  %return_buffer29 = alloca double, align 8
  %result_from_other_lane27 = alloca double, align 8
  %return_buffer26 = alloca double, align 8
  %result_from_other_lane24 = alloca double, align 8
  %return_buffer23 = alloca double, align 8
  %result_from_other_lane21 = alloca double, align 8
  %return_buffer20 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer18 = alloca double, align 8
  %loop3.invar_address13 = alloca i32, align 4
  %loop2.invar_address7 = alloca i32, align 4
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
  %constant_2_1 = load double, ptr @0, align 8
  store double %constant_2_1, ptr %partial_reduction_result, align 8
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

is_full_tile-after:                               ; preds = %loop2.loop_exit4, %loop2.loop_exit
  br label %loop1.loop_header, !llvm.loop !5

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result19 = load double, ptr %partial_reduction_result, align 8
  %13 = bitcast double %partial_reduction_result19 to i64
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
  call void @region_0_3_5600f7a724b0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer20)
  %23 = load double, ptr %return_buffer20, align 8
  store double %23, ptr %partial_reduction_result, align 8
  %partial_reduction_result22 = load double, ptr %partial_reduction_result, align 8
  %24 = bitcast double %partial_reduction_result22 to i64
  %25 = bitcast i64 %24 to <2 x i32>
  %26 = extractelement <2 x i32> %25, i64 0
  %27 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 8, i32 31)
  %28 = insertelement <2 x i32> %25, i32 %27, i64 0
  %29 = extractelement <2 x i32> %28, i64 1
  %30 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 8, i32 31)
  %31 = insertelement <2 x i32> %28, i32 %30, i64 1
  %32 = bitcast <2 x i32> %31 to i64
  %33 = bitcast i64 %32 to double
  store double %33, ptr %result_from_other_lane21, align 8
  call void @region_0_3_5600f7a724b0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane21, ptr %return_buffer23)
  %34 = load double, ptr %return_buffer23, align 8
  store double %34, ptr %partial_reduction_result, align 8
  %partial_reduction_result25 = load double, ptr %partial_reduction_result, align 8
  %35 = bitcast double %partial_reduction_result25 to i64
  %36 = bitcast i64 %35 to <2 x i32>
  %37 = extractelement <2 x i32> %36, i64 0
  %38 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 4, i32 31)
  %39 = insertelement <2 x i32> %36, i32 %38, i64 0
  %40 = extractelement <2 x i32> %39, i64 1
  %41 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 4, i32 31)
  %42 = insertelement <2 x i32> %39, i32 %41, i64 1
  %43 = bitcast <2 x i32> %42 to i64
  %44 = bitcast i64 %43 to double
  store double %44, ptr %result_from_other_lane24, align 8
  call void @region_0_3_5600f7a724b0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane24, ptr %return_buffer26)
  %45 = load double, ptr %return_buffer26, align 8
  store double %45, ptr %partial_reduction_result, align 8
  %partial_reduction_result28 = load double, ptr %partial_reduction_result, align 8
  %46 = bitcast double %partial_reduction_result28 to i64
  %47 = bitcast i64 %46 to <2 x i32>
  %48 = extractelement <2 x i32> %47, i64 0
  %49 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 2, i32 31)
  %50 = insertelement <2 x i32> %47, i32 %49, i64 0
  %51 = extractelement <2 x i32> %50, i64 1
  %52 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %51, i32 2, i32 31)
  %53 = insertelement <2 x i32> %50, i32 %52, i64 1
  %54 = bitcast <2 x i32> %53 to i64
  %55 = bitcast i64 %54 to double
  store double %55, ptr %result_from_other_lane27, align 8
  call void @region_0_3_5600f7a724b0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane27, ptr %return_buffer29)
  %56 = load double, ptr %return_buffer29, align 8
  store double %56, ptr %partial_reduction_result, align 8
  %partial_reduction_result31 = load double, ptr %partial_reduction_result, align 8
  %57 = bitcast double %partial_reduction_result31 to i64
  %58 = bitcast i64 %57 to <2 x i32>
  %59 = extractelement <2 x i32> %58, i64 0
  %60 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %59, i32 1, i32 31)
  %61 = insertelement <2 x i32> %58, i32 %60, i64 0
  %62 = extractelement <2 x i32> %61, i64 1
  %63 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %62, i32 1, i32 31)
  %64 = insertelement <2 x i32> %61, i32 %63, i64 1
  %65 = bitcast <2 x i32> %64 to i64
  %66 = bitcast i64 %65 to double
  store double %66, ptr %result_from_other_lane30, align 8
  call void @region_0_3_5600f7a724b0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %result_from_other_lane30, ptr %return_buffer32)
  %67 = load double, ptr %return_buffer32, align 8
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
  %param_0 = getelementptr inbounds [20 x [192 x double]], ptr %arg0, i32 0, i32 %83, i32 %80
  %param_03 = load double, ptr %param_0, align 8, !invariant.load !7
  store double %param_03, ptr %reduction_input_address, align 8
  call void @region_0_3_5600f7a724b0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %87 = load double, ptr %return_buffer, align 8
  store double %87, ptr %partial_reduction_result, align 8
  br label %loop3.loop_header, !llvm.loop !8

loop3.loop_exit:                                  ; preds = %loop3.loop_header
  br label %loop2.loop_header, !llvm.loop !9

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %loop1.loop_body
  store i32 0, ptr %loop2.invar_address7, align 4
  br label %loop2.loop_header5

loop2.loop_header5:                               ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar8 = load i32, ptr %loop2.invar_address7, align 4
  %88 = icmp uge i32 %loop2.indvar8, 256
  br i1 %88, label %loop2.loop_exit4, label %loop2.loop_body6

loop2.loop_body6:                                 ; preds = %loop2.loop_header5
  %invar.inc9 = add nuw nsw i32 %loop2.indvar8, 32
  store i32 %invar.inc9, ptr %loop2.invar_address7, align 4
  %89 = add i32 %loop2.indvar8, %thread.id.2
  %90 = icmp ult i32 %89, %tile_bound.2
  br i1 %90, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %loop3.loop_exit10, %loop2.loop_body6
  br label %loop2.loop_header5, !llvm.loop !11

loop2.loop_exit4:                                 ; preds = %loop2.loop_header5
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %loop2.loop_body6
  store i32 0, ptr %loop3.invar_address13, align 4
  br label %loop3.loop_header11

loop3.loop_header11:                              ; preds = %loop3.loop_body12, %x_in_tile-true
  %loop3.indvar14 = load i32, ptr %loop3.invar_address13, align 4
  %91 = icmp uge i32 %loop3.indvar14, 2
  br i1 %91, label %loop3.loop_exit10, label %loop3.loop_body12

loop3.loop_body12:                                ; preds = %loop3.loop_header11
  %invar.inc15 = add nuw nsw i32 %loop3.indvar14, 1
  store i32 %invar.inc15, ptr %loop3.invar_address13, align 4
  %92 = add i32 %tile_origin.0, 0
  %93 = add i32 %tile_origin.1, %loop1.indvar
  %94 = add i32 %tile_origin.2, %89
  %95 = add i32 %tile_origin.3, %loop3.indvar14
  %96 = mul nuw nsw i32 %95, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %94, 2
  %99 = add nuw nsw i32 %97, %98
  %100 = udiv i32 %99, 192
  %101 = mul nuw nsw i32 %93, 1
  %102 = add nuw nsw i32 0, %101
  %103 = udiv i32 %102, 20
  %104 = mul nuw nsw i32 %92, 1
  %105 = add nuw nsw i32 0, %104
  %param_016 = getelementptr inbounds [20 x [192 x double]], ptr %arg0, i32 0, i32 %102, i32 %99
  %param_017 = load double, ptr %param_016, align 8, !invariant.load !7
  store double %param_017, ptr %reduction_input_address, align 8
  call void @region_0_3_5600f7a724b0_198d40d801a8e3c1(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer18)
  %106 = load double, ptr %return_buffer18, align 8
  store double %106, ptr %partial_reduction_result, align 8
  br label %loop3.loop_header11, !llvm.loop !12

loop3.loop_exit10:                                ; preds = %loop3.loop_header11
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %107 = icmp eq i32 %lane_id, 0
  br i1 %107, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  call void @llvm.nvvm.barrier0()
  %108 = icmp eq i32 %68, 0
  br i1 %108, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  %109 = load double, ptr %partial_reduction_result, align 8
  %110 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %68
  %111 = addrspacecast ptr addrspace(3) %110 to ptr
  store double %109, ptr %111, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %112 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %lane_id
  %113 = addrspacecast ptr addrspace(3) %112 to ptr
  store double %constant_2_1, ptr %initial_value_addr, align 8
  %114 = icmp ult i32 %thread.id.2, 1
  %115 = select i1 %114, ptr %113, ptr %initial_value_addr
  %116 = icmp eq i32 %thread.id.2, 0
  br i1 %116, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %117 = add i32 %tile_origin.1, %thread.id.1
  %output_element_address = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %117
  %output = load double, ptr %115, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_3_5600f7a724b0_198d40d801a8e3c1(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
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
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
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
