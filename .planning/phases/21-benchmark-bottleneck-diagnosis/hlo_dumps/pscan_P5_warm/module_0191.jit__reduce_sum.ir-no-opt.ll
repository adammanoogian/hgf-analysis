; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [4 x [1 x double]] undef

define void @input_reduce_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1) {
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

is_full_tile-after:                               ; preds = %loop2.loop_exit4, %loop2.loop_exit
  br label %loop1.loop_header, !llvm.loop !4

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result19 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result19 to i64
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
  call void @region_0_3_562a77058cf0_7f16e3fe947b41ce(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer20)
  %22 = load double, ptr %return_buffer20, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result22 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result22 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 8, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 8, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane21, align 8
  call void @region_0_3_562a77058cf0_7f16e3fe947b41ce(ptr %partial_reduction_result, ptr %result_from_other_lane21, ptr %return_buffer23)
  %33 = load double, ptr %return_buffer23, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %partial_reduction_result25 = load double, ptr %partial_reduction_result, align 8
  %34 = bitcast double %partial_reduction_result25 to i64
  %35 = bitcast i64 %34 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 4, i32 31)
  %38 = insertelement <2 x i32> %35, i32 %37, i64 0
  %39 = extractelement <2 x i32> %38, i64 1
  %40 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to i64
  %43 = bitcast i64 %42 to double
  store double %43, ptr %result_from_other_lane24, align 8
  call void @region_0_3_562a77058cf0_7f16e3fe947b41ce(ptr %partial_reduction_result, ptr %result_from_other_lane24, ptr %return_buffer26)
  %44 = load double, ptr %return_buffer26, align 8
  store double %44, ptr %partial_reduction_result, align 8
  %partial_reduction_result28 = load double, ptr %partial_reduction_result, align 8
  %45 = bitcast double %partial_reduction_result28 to i64
  %46 = bitcast i64 %45 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> %46, i32 %48, i64 0
  %50 = extractelement <2 x i32> %49, i64 1
  %51 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 2, i32 31)
  %52 = insertelement <2 x i32> %49, i32 %51, i64 1
  %53 = bitcast <2 x i32> %52 to i64
  %54 = bitcast i64 %53 to double
  store double %54, ptr %result_from_other_lane27, align 8
  call void @region_0_3_562a77058cf0_7f16e3fe947b41ce(ptr %partial_reduction_result, ptr %result_from_other_lane27, ptr %return_buffer29)
  %55 = load double, ptr %return_buffer29, align 8
  store double %55, ptr %partial_reduction_result, align 8
  %partial_reduction_result31 = load double, ptr %partial_reduction_result, align 8
  %56 = bitcast double %partial_reduction_result31 to i64
  %57 = bitcast i64 %56 to <2 x i32>
  %58 = extractelement <2 x i32> %57, i64 0
  %59 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 1, i32 31)
  %60 = insertelement <2 x i32> %57, i32 %59, i64 0
  %61 = extractelement <2 x i32> %60, i64 1
  %62 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 1, i32 31)
  %63 = insertelement <2 x i32> %60, i32 %62, i64 1
  %64 = bitcast <2 x i32> %63 to i64
  %65 = bitcast i64 %64 to double
  store double %65, ptr %result_from_other_lane30, align 8
  call void @region_0_3_562a77058cf0_7f16e3fe947b41ce(ptr %partial_reduction_result, ptr %result_from_other_lane30, ptr %return_buffer32)
  %66 = load double, ptr %return_buffer32, align 8
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
  %param_0 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %82, i32 %79
  %param_03 = load double, ptr %param_0, align 8, !invariant.load !6
  store double %param_03, ptr %reduction_input_address, align 8
  call void @region_0_3_562a77058cf0_7f16e3fe947b41ce(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %86 = load double, ptr %return_buffer, align 8
  store double %86, ptr %partial_reduction_result, align 8
  br label %loop3.loop_header, !llvm.loop !7

loop3.loop_exit:                                  ; preds = %loop3.loop_header
  br label %loop2.loop_header, !llvm.loop !8

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %loop1.loop_body
  store i32 0, ptr %loop2.invar_address7, align 4
  br label %loop2.loop_header5

loop2.loop_header5:                               ; preds = %x_in_tile-after, %is_full_tile-false
  %loop2.indvar8 = load i32, ptr %loop2.invar_address7, align 4
  %87 = icmp uge i32 %loop2.indvar8, 256
  br i1 %87, label %loop2.loop_exit4, label %loop2.loop_body6

loop2.loop_body6:                                 ; preds = %loop2.loop_header5
  %invar.inc9 = add nuw nsw i32 %loop2.indvar8, 32
  store i32 %invar.inc9, ptr %loop2.invar_address7, align 4
  %88 = add i32 %loop2.indvar8, %thread.id.2
  %89 = icmp ult i32 %88, %tile_bound.2
  br i1 %89, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %loop3.loop_exit10, %loop2.loop_body6
  br label %loop2.loop_header5, !llvm.loop !10

loop2.loop_exit4:                                 ; preds = %loop2.loop_header5
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %loop2.loop_body6
  store i32 0, ptr %loop3.invar_address13, align 4
  br label %loop3.loop_header11

loop3.loop_header11:                              ; preds = %loop3.loop_body12, %x_in_tile-true
  %loop3.indvar14 = load i32, ptr %loop3.invar_address13, align 4
  %90 = icmp uge i32 %loop3.indvar14, 2
  br i1 %90, label %loop3.loop_exit10, label %loop3.loop_body12

loop3.loop_body12:                                ; preds = %loop3.loop_header11
  %invar.inc15 = add nuw nsw i32 %loop3.indvar14, 1
  store i32 %invar.inc15, ptr %loop3.invar_address13, align 4
  %91 = add i32 %tile_origin.0, 0
  %92 = add i32 %tile_origin.1, %loop1.indvar
  %93 = add i32 %tile_origin.2, %88
  %94 = add i32 %tile_origin.3, %loop3.indvar14
  %95 = mul nuw nsw i32 %94, 1
  %96 = add nuw nsw i32 0, %95
  %97 = mul nuw nsw i32 %93, 2
  %98 = add nuw nsw i32 %96, %97
  %99 = udiv i32 %98, 192
  %100 = mul nuw nsw i32 %92, 1
  %101 = add nuw nsw i32 0, %100
  %102 = udiv i32 %101, 4
  %103 = mul nuw nsw i32 %91, 1
  %104 = add nuw nsw i32 0, %103
  %param_016 = getelementptr inbounds [4 x [192 x double]], ptr %arg0, i32 0, i32 %101, i32 %98
  %param_017 = load double, ptr %param_016, align 8, !invariant.load !6
  store double %param_017, ptr %reduction_input_address, align 8
  call void @region_0_3_562a77058cf0_7f16e3fe947b41ce(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer18)
  %105 = load double, ptr %return_buffer18, align 8
  store double %105, ptr %partial_reduction_result, align 8
  br label %loop3.loop_header11, !llvm.loop !11

loop3.loop_exit10:                                ; preds = %loop3.loop_header11
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %106 = icmp eq i32 %lane_id, 0
  br i1 %106, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  call void @llvm.nvvm.barrier0()
  %107 = icmp eq i32 %67, 0
  br i1 %107, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  %108 = load double, ptr %partial_reduction_result, align 8
  %109 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %67
  %110 = addrspacecast ptr addrspace(3) %109 to ptr
  store double %108, ptr %110, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %111 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(3) @shared_cache, i32 0, i32 %thread.id.1, i32 %lane_id
  %112 = addrspacecast ptr addrspace(3) %111 to ptr
  store double %constant_2_1, ptr %initial_value_addr, align 8
  %113 = icmp ult i32 %thread.id.2, 1
  %114 = select i1 %113, ptr %112, ptr %initial_value_addr
  %115 = icmp eq i32 %thread.id.2, 0
  br i1 %115, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %116 = add i32 %tile_origin.1, %thread.id.1
  %output_element_address = getelementptr inbounds [4 x double], ptr %arg1, i32 0, i32 %116
  %output = load double, ptr %114, align 8
  store double %output, ptr %output_element_address, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_3_562a77058cf0_7f16e3fe947b41ce(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
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
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 128}
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
