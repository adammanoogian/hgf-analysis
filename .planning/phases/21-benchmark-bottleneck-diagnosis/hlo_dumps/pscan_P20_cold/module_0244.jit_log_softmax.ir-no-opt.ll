; ModuleID = 'jit_log_softmax'
source_filename = "jit_log_softmax"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @input_reduce_fusion(ptr noalias align 16 dereferenceable(61440) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1) {
entry:
  %return_buffer4 = alloca double, align 8
  %result_from_other_lane = alloca double, align 8
  %return_buffer = alloca double, align 8
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
  %constant_4_1 = load double, ptr @0, align 8
  store double %constant_4_1, ptr %partial_reduction_result, align 8
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  br label %loop2.loop_header, !llvm.loop !7

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !10

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
  call void @region_0_6_55bc0a454220_39acfdde3893eeca(ptr %partial_reduction_result, ptr %result_from_other_lane, ptr %return_buffer4)
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
  %param_0.10 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr %arg0, i32 0, i32 %33, i32 %32, i32 %28
  %param_0.102 = load double, ptr %param_0.10, align 8, !invariant.load !11
  store double %param_0.102, ptr %reduction_input_address, align 8
  call void @region_0_6_55bc0a454220_39acfdde3893eeca(ptr %partial_reduction_result, ptr %reduction_input_address, ptr %return_buffer)
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
  %output_element_address = getelementptr inbounds [20 x [192 x double]], ptr %arg1, i32 0, i32 %44, i32 %43
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

define internal void @region_0_6_55bc0a454220_39acfdde3893eeca(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.7 = load double, ptr %0, align 8
  %Arg_1.8 = load double, ptr %1, align 8
  %add.2 = fadd double %Arg_0.7, %Arg_1.8
  store double %add.2, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #1

define void @loop_add_fusion(ptr noalias align 16 dereferenceable(61440) %arg0, ptr noalias align 16 dereferenceable(61440) %arg1, ptr noalias align 16 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3, ptr noalias align 128 dereferenceable(61440) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !13
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
  %8 = icmp ult i32 %linear_index, 7680
  br i1 %8, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %9 = getelementptr double, ptr %arg0, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !11
  %12 = udiv i32 %linear_index0, 2
  %13 = getelementptr inbounds double, ptr %arg3, i32 %12
  %14 = load double, ptr %13, align 8, !invariant.load !11
  %15 = getelementptr inbounds double, ptr %arg2, i32 %12
  %16 = load double, ptr %15, align 8, !invariant.load !11
  %divide.1.3 = fdiv double %14, %16
  %17 = getelementptr double, ptr %arg1, i32 %linear_index
  %18 = getelementptr inbounds double, ptr %17, i32 0
  %19 = load double, ptr %18, align 8, !invariant.load !11
  %multiply.1.3 = fmul double %divide.1.3, %19
  %add.3.1 = fadd double %11, %multiply.1.3
  %20 = getelementptr double, ptr %arg4, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %add.3.1, ptr %21, align 8
  br label %loop_add_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
!2 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 1}
!5 = !{i32 0, i32 256}
!6 = !{i32 0, i32 30}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.enable", i1 false}
!9 = !{!"llvm.loop.unroll.full"}
!10 = distinct !{!10, !8}
!11 = !{}
!12 = !{i32 0, i32 60}
!13 = !{i32 0, i32 128}
