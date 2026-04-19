; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @input_slice_fusion(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 16 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(960) %arg3) {
entry:
  %return_buffer7 = alloca double, align 8
  %parameter_buffer6 = alloca double, align 8
  %parameter_buffer5 = alloca double, align 8
  %reduce.13.2.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_02 = alloca double, align 8
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.8.2.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 121
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 121
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 121
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %constant_3_3 = load double, ptr @0, align 8
  store double %constant_3_3, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.8.2.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.8.2.inner.loop_header.reduction_dim.0

reduce.8.2.inner.loop_header.reduction_dim.0:     ; preds = %reduce.8.2.inner.loop_body.reduction_dim.0, %concat_index_from_operand_id0
  %reduce.8.2.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.8.2.inner.invar_address.reduction_dim.0, align 4
  %7 = icmp uge i32 %reduce.8.2.inner.indvar.reduction_dim.0, 20
  br i1 %7, label %reduce.8.2.inner.loop_exit.reduction_dim.0, label %reduce.8.2.inner.loop_body.reduction_dim.0

reduce.8.2.inner.loop_body.reduction_dim.0:       ; preds = %reduce.8.2.inner.loop_header.reduction_dim.0
  %8 = load double, ptr %accumulator_0, align 8
  %9 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.8.2.inner.indvar.reduction_dim.0
  %10 = load double, ptr %9, align 8, !invariant.load !4
  store double %8, ptr %parameter_buffer, align 8
  store double %10, ptr %parameter_buffer1, align 8
  call void @region_0_4_5601117394a0_198d40d801a8e3c1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %11 = load double, ptr %return_buffer, align 8
  store double %11, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.8.2.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.8.2.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.8.2.inner.loop_header.reduction_dim.0

reduce.8.2.inner.loop_exit.reduction_dim.0:       ; preds = %reduce.8.2.inner.loop_header.reduction_dim.0
  %12 = load double, ptr %accumulator_0, align 8
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.8
  %13 = phi i32 [ 1, %concatenate.pivot.1.8 ]
  %14 = sub nsw i32 %3, %13
  %constant_3_33 = load double, ptr @0, align 8
  store double %constant_3_33, ptr %accumulator_02, align 8
  store i32 0, ptr %reduce.13.2.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.13.2.inner.loop_header.reduction_dim.1

reduce.13.2.inner.loop_header.reduction_dim.1:    ; preds = %reduce.13.2.inner.loop_body.reduction_dim.1, %concat_index_from_operand_id1
  %reduce.13.2.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.13.2.inner.invar_address.reduction_dim.1, align 4
  %15 = icmp uge i32 %reduce.13.2.inner.indvar.reduction_dim.1, 20
  br i1 %15, label %reduce.13.2.inner.loop_exit.reduction_dim.1, label %reduce.13.2.inner.loop_body.reduction_dim.1

reduce.13.2.inner.loop_body.reduction_dim.1:      ; preds = %reduce.13.2.inner.loop_header.reduction_dim.1
  %16 = load double, ptr %accumulator_02, align 8
  %17 = getelementptr inbounds [120 x [20 x double]], ptr %arg1, i32 0, i32 %14, i32 %reduce.13.2.inner.indvar.reduction_dim.1
  %18 = load double, ptr %17, align 8, !invariant.load !4
  store double %16, ptr %parameter_buffer5, align 8
  store double %18, ptr %parameter_buffer6, align 8
  call void @region_0_4_5601117394a0_198d40d801a8e3c1(ptr %parameter_buffer5, ptr %parameter_buffer6, ptr %return_buffer7)
  %19 = load double, ptr %return_buffer7, align 8
  store double %19, ptr %accumulator_02, align 8
  %invar.inc4 = add nuw nsw i32 %reduce.13.2.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc4, ptr %reduce.13.2.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.13.2.inner.loop_header.reduction_dim.1

reduce.13.2.inner.loop_exit.reduction_dim.1:      ; preds = %reduce.13.2.inner.loop_header.reduction_dim.1
  %20 = load double, ptr %accumulator_02, align 8
  br label %concatenate.merge

concatenate.pivot.1.:                             ; preds = %input_slice_fusion.in_bounds-true
  %21 = icmp ult i32 %3, 1
  br i1 %21, label %concatenate.pivot.0., label %concatenate.pivot.1.8

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.8:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %reduce.13.2.inner.loop_exit.reduction_dim.1, %reduce.8.2.inner.loop_exit.reduction_dim.0
  %22 = phi double [ %12, %reduce.8.2.inner.loop_exit.reduction_dim.0 ], [ %20, %reduce.13.2.inner.loop_exit.reduction_dim.1 ]
  %23 = icmp sge i32 %3, 0
  %24 = icmp slt i32 %3, 1
  %25 = and i1 %23, %24
  br i1 %25, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %26 = icmp sge i32 %3, 1
  %27 = icmp slt i32 %3, 121
  %28 = and i1 %26, %27
  br i1 %28, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %29 = sub i32 %3, 0
  %30 = getelementptr inbounds [1 x double], ptr %arg2, i32 0, i32 0
  store double %22, ptr %30, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %31 = sub i32 %3, 1
  %32 = getelementptr inbounds [120 x double], ptr %arg3, i32 0, i32 %31
  store double %22, ptr %32, align 8
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define internal void @region_0_4_5601117394a0_198d40d801a8e3c1(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
entry:
  %2 = alloca double, align 8
  %Arg_0.5 = load double, ptr %0, align 8
  %Arg_1.6 = load double, ptr %1, align 8
  %add.1 = fadd double %Arg_0.5, %Arg_1.6
  store double %add.1, ptr %2, align 8
  %load_ret_value = load double, ptr %2, align 8
  store double %load_ret_value, ptr %output_arg, align 8
  ret void
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 121}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 121}
!4 = !{}
