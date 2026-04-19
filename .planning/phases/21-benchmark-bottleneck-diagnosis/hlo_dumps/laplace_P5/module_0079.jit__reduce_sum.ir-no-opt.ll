; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @input_reduce_fusion(ptr noalias align 16 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %return_buffer7 = alloca double, align 8
  %result_from_other_lane5 = alloca double, align 8
  %return_buffer4 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
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
  %1 = udiv i32 %thread.id.x, 4
  %thread.id.1 = urem i32 %1, 8
  %thread.id.2 = urem i32 %thread.id.x, 4
  %lane_id = urem i32 %thread.id.x, 32
  %2 = udiv i32 %block.id.x, 1
  %3 = urem i32 %2, 1
  %4 = udiv i32 %block.id.x, 1
  %5 = urem i32 %4, 1
  %6 = udiv i32 %block.id.x, 1
  %7 = icmp eq i32 %5, 0
  %tile_bound.1 = select i1 %7, i32 1, i32 8
  %tile_origin.0 = mul i32 %6, 1
  %tile_origin.1 = mul i32 %5, 8
  %tile_origin.2 = mul i32 %3, 4
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %reduce-group-0-true
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %8 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %8, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 8
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 0, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %x_in_tile-after, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %9 = icmp uge i32 %loop2.indvar, 4
  br i1 %9, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 4
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %10 = add i32 %loop2.indvar, %thread.id.2
  %11 = icmp ult i32 %10, 4
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop2.loop_body
  br label %loop2.loop_header, !llvm.loop !4

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !7

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  %partial_reduction_result3 = load double, ptr %partial_reduction_result, align 8
  %12 = bitcast double %partial_reduction_result3 to i64
  %13 = bitcast i64 %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 2, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 0
  %17 = extractelement <2 x i32> %16, i64 1
  %18 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 2, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to i64
  %21 = bitcast i64 %20 to double
  store double %21, ptr %result_from_other_lane, align 8
  call void @region_0_3_55fe61351830_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer4)
  %22 = load double, ptr %return_buffer4, align 8
  store double %22, ptr %partial_reduction_result, align 8
  %partial_reduction_result6 = load double, ptr %partial_reduction_result, align 8
  %23 = bitcast double %partial_reduction_result6 to i64
  %24 = bitcast i64 %23 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 1, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 0
  %28 = extractelement <2 x i32> %27, i64 1
  %29 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 1, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to i64
  %32 = bitcast i64 %31 to double
  store double %32, ptr %result_from_other_lane5, align 8
  call void @region_0_3_55fe61351830_79b0d34134220a8b(ptr %partial_reduction_result, ptr %result_from_other_lane5, ptr %return_buffer7)
  %33 = load double, ptr %return_buffer7, align 8
  store double %33, ptr %partial_reduction_result, align 8
  %34 = udiv i32 %thread.id.2, 32
  %35 = icmp ult i32 %thread.id.1, %tile_bound.1
  br i1 %35, label %thread_in_bounds-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-after, %loop1.loop_exit
  br label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop2.loop_body
  %36 = add i32 %tile_origin.0, 0
  %37 = add i32 %tile_origin.1, %loop1.indvar
  %38 = add i32 %tile_origin.2, %10
  %param_0 = getelementptr inbounds [4 x double], ptr %arg0, i32 0, i32 %38
  %param_02 = load double, ptr %param_0, align 8, !invariant.load !8
  store double %param_02, ptr %reduction_input_address, align 8
  call void @region_0_3_55fe61351830_79b0d34134220a8b(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
  %39 = load double, ptr %return_buffer, align 8
  store double %39, ptr %partial_reduction_result, align 8
  br label %x_in_tile-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %40 = and i32 %thread.id.2, 3
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %thread_in_bounds-true
  br label %thread_in_bounds-after

reduction_write_output-true:                      ; preds = %thread_in_bounds-true
  %42 = add i32 %tile_origin.1, %thread.id.1
  %output = load double, ptr %partial_reduction_result, align 8
  store double %output, ptr %arg1, align 8
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_0_3_55fe61351830_79b0d34134220a8b(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
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

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 32}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 32}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.enable", i1 false}
!6 = !{!"llvm.loop.unroll.full"}
!7 = distinct !{!7, !5}
!8 = !{}
