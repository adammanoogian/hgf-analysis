; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_reduce_fusion(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %return_buffer = alloca double, align 8
  %parameter_buffer1 = alloca double, align 8
  %parameter_buffer = alloca double, align 8
  %reduce.7.1.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca double, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_reduce_fusion.in_bounds-true, label %loop_reduce_fusion.in_bounds-after

loop_reduce_fusion.in_bounds-after:               ; preds = %reduce.7.1.inner.loop_exit.reduction_dim.0, %entry
  ret void

loop_reduce_fusion.in_bounds-true:                ; preds = %entry
  %constant_2_1 = load double, ptr @0, align 8
  store double %constant_2_1, ptr %accumulator_0, align 8
  store i32 0, ptr %reduce.7.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.7.1.inner.loop_header.reduction_dim.0

reduce.7.1.inner.loop_header.reduction_dim.0:     ; preds = %reduce.7.1.inner.loop_body.reduction_dim.0, %loop_reduce_fusion.in_bounds-true
  %reduce.7.1.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.7.1.inner.invar_address.reduction_dim.0, align 4
  %4 = icmp uge i32 %reduce.7.1.inner.indvar.reduction_dim.0, 20
  br i1 %4, label %reduce.7.1.inner.loop_exit.reduction_dim.0, label %reduce.7.1.inner.loop_body.reduction_dim.0

reduce.7.1.inner.loop_body.reduction_dim.0:       ; preds = %reduce.7.1.inner.loop_header.reduction_dim.0
  %5 = load double, ptr %accumulator_0, align 8
  %6 = getelementptr inbounds [20 x double], ptr %arg0, i32 0, i32 %reduce.7.1.inner.indvar.reduction_dim.0
  %7 = load double, ptr %6, align 8, !invariant.load !3
  store double %5, ptr %parameter_buffer, align 8
  store double %7, ptr %parameter_buffer1, align 8
  call void @region_0_3_55bc06021760_39acfdde3893eeca(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %8 = load double, ptr %return_buffer, align 8
  store double %8, ptr %accumulator_0, align 8
  %invar.inc = add nuw nsw i32 %reduce.7.1.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.7.1.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.7.1.inner.loop_header.reduction_dim.0

reduce.7.1.inner.loop_exit.reduction_dim.0:       ; preds = %reduce.7.1.inner.loop_header.reduction_dim.0
  %9 = load double, ptr %accumulator_0, align 8
  store double %9, ptr %arg1, align 8
  br label %loop_reduce_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define internal void @region_0_3_55bc06021760_39acfdde3893eeca(ptr dereferenceable(8) %0, ptr dereferenceable(8) %1, ptr dereferenceable(8) %output_arg) {
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

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @loop_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_reduce_fusion, !"reqntidx", i32 1}
!2 = !{i32 0, i32 1}
!3 = !{}
