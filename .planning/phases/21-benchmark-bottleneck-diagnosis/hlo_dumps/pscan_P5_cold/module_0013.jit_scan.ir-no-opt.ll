; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_25_0 = constant [64 x i8] zeroinitializer, align 128
@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@1 = private unnamed_addr constant [8 x i8] zeroinitializer
@2 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@3 = private unnamed_addr constant [8 x i8] zeroinitializer
@4 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@5 = private unnamed_addr constant [8 x i8] zeroinitializer
@6 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@7 = private unnamed_addr constant [8 x i8] zeroinitializer
@8 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@9 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@10 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@11 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@12 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@13 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@14 = private unnamed_addr constant [8 x i8] zeroinitializer
@15 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@16 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@17 = private unnamed_addr constant [8 x i8] zeroinitializer
@18 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@19 = private unnamed_addr constant [8 x i8] zeroinitializer
@20 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@21 = private unnamed_addr constant [8 x i8] zeroinitializer
@22 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@23 = private unnamed_addr constant [8 x i8] zeroinitializer
@24 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@25 = private unnamed_addr constant [8 x i8] zeroinitializer
@26 = private unnamed_addr constant [8 x i8] zeroinitializer
@27 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@28 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@29 = private unnamed_addr constant [8 x i8] zeroinitializer
@30 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"

define void @input_slice_fusion(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(1536) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 384
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 384
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.192.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %constant_26_3 = load double, ptr @0, align 8
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.192.2
  %7 = phi i32 [ 192, %concatenate.pivot.192.2 ]
  %8 = sub nsw i32 %3, %7
  %constant_26_31 = load double, ptr @0, align 8
  br label %concatenate.merge

concatenate.pivot.192.:                           ; preds = %input_slice_fusion.in_bounds-true
  %9 = icmp ult i32 %3, 192
  br i1 %9, label %concatenate.pivot.0., label %concatenate.pivot.192.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id0

concatenate.pivot.192.2:                          ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %10 = phi double [ %constant_26_3, %concat_index_from_operand_id0 ], [ %constant_26_31, %concat_index_from_operand_id1 ]
  %11 = icmp sge i32 %3, 0
  %12 = icmp slt i32 %3, 192
  %13 = and i1 %11, %12
  br i1 %13, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %14 = icmp sge i32 %3, 192
  %15 = icmp slt i32 %3, 384
  %16 = and i1 %14, %15
  br i1 %16, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %17 = sub i32 %3, 0
  %18 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %17
  store double %10, ptr %18, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %19 = sub i32 %3, 192
  %20 = getelementptr inbounds [192 x double], ptr %arg1, i32 0, i32 %19
  store double %10, ptr %20, align 8
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(1536) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 192
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 192
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 192
  br i1 %4, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %constant_25_1 = load i64, ptr @1, align 8
  %5 = insertvalue { i64, i64 } undef, i64 %constant_25_1, 0
  %6 = insertvalue { i64, i64 } %5, i64 %constant_25_1, 1
  %7 = extractvalue { i64, i64 } %6, 0
  %8 = getelementptr i64, ptr %arg0, i32 %linear_index
  %9 = getelementptr inbounds i64, ptr %8, i32 0
  store i64 %7, ptr %9, align 8
  %10 = extractvalue { i64, i64 } %6, 1
  %11 = getelementptr i64, ptr %arg1, i32 %linear_index
  %12 = getelementptr inbounds i64, ptr %11, i32 0
  store i64 %10, ptr %12, align 8
  br label %loop_broadcast_fusion.in_bounds-after
}

define void @loop_compare_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_compare_fusion.in_bounds-true, label %loop_compare_fusion.in_bounds-after

loop_compare_fusion.in_bounds-after:              ; preds = %loop_compare_fusion.in_bounds-true, %entry
  ret void

loop_compare_fusion.in_bounds-true:               ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !38
  %constant_34_1 = load i64, ptr @2, align 8
  %5 = icmp slt i64 %4, %constant_34_1
  %6 = zext i1 %5 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.in_bounds-after
}

define void @loop_convert_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_convert_dynamic_slice_fusion.in_bounds-true, label %loop_convert_dynamic_slice_fusion.in_bounds-after

loop_convert_dynamic_slice_fusion.in_bounds-after: ; preds = %loop_convert_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_convert_dynamic_slice_fusion.in_bounds-true: ; preds = %entry
  %5 = load i64, ptr %arg1, align 8, !invariant.load !38
  %constant_37_10 = load i64, ptr @5, align 8
  %6 = icmp slt i64 %5, %constant_37_10
  %7 = zext i1 %6 to i8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !38
  %constant_36_6 = load i64, ptr @4, align 8
  %9 = add i64 %8, %constant_36_6
  %10 = load i64, ptr %arg1, align 8, !invariant.load !38
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.8.10.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.8.10.start_idx0, %3
  %18 = getelementptr inbounds [192 x i64], ptr %arg0, i32 0, i32 %17
  %19 = load i64, ptr %18, align 8, !invariant.load !38
  %20 = insertvalue { i64, i32 } undef, i64 %19, 0
  %21 = trunc i64 %12 to i32
  %22 = icmp sge i32 0, %21
  %23 = select i1 %22, i32 0, i32 %21
  %24 = icmp sle i32 191, %23
  %dynamic-slice.8.10.start_idx01 = select i1 %24, i32 191, i32 %23
  %25 = add i32 %dynamic-slice.8.10.start_idx01, 0
  %26 = getelementptr inbounds [192 x i64], ptr %arg0, i32 0, i32 %25
  %27 = load i64, ptr %26, align 8, !invariant.load !38
  %constant_41_1_clone_1 = load i64, ptr @3, align 8
  %28 = icmp ne i64 %27, %constant_41_1_clone_1
  %29 = zext i1 %28 to i8
  %30 = zext i8 %29 to i32
  %31 = insertvalue { i64, i32 } %20, i32 %30, 1
  %32 = extractvalue { i64, i32 } %31, 0
  %33 = getelementptr i64, ptr %arg2, i32 %linear_index
  %34 = getelementptr inbounds i64, ptr %33, i32 0
  store i64 %32, ptr %34, align 8
  %35 = extractvalue { i64, i32 } %31, 1
  store i32 %35, ptr %arg3, align 4
  br label %loop_convert_dynamic_slice_fusion.in_bounds-after
}

define void @loop_add_divide_dynamic_slice_multiply_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(1536) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 16 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 128 dereferenceable(8) %arg7, ptr noalias align 128 dereferenceable(8) %arg8, ptr noalias align 128 dereferenceable(8) %arg9, ptr noalias align 128 dereferenceable(8) %arg10, ptr noalias align 128 dereferenceable(8) %arg11, ptr noalias align 128 dereferenceable(8) %arg12, ptr noalias align 128 dereferenceable(8) %arg13) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_divide_dynamic_slice_multiply_fusion.in_bounds-true, label %loop_add_divide_dynamic_slice_multiply_fusion.in_bounds-after

loop_add_divide_dynamic_slice_multiply_fusion.in_bounds-after: ; preds = %loop_add_divide_dynamic_slice_multiply_fusion.in_bounds-true, %entry
  ret void

loop_add_divide_dynamic_slice_multiply_fusion.in_bounds-true: ; preds = %entry
  %constant_38_2 = load double, ptr @8, align 8
  %4 = load double, ptr %arg3, align 8, !invariant.load !38
  %5 = load double, ptr %arg4, align 8, !invariant.load !38
  %multiply.69.1.clone.1 = fmul double %4, %5
  %6 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_28_clone_1 = load i64, ptr @7, align 8
  %7 = icmp slt i64 %6, %constant_37_28_clone_1
  %8 = zext i1 %7 to i8
  %9 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_28_clone_1 = load i64, ptr @6, align 8
  %10 = add i64 %9, %constant_36_28_clone_1
  %11 = load i64, ptr %arg2, align 8, !invariant.load !38
  %12 = trunc i8 %8 to i1
  %13 = select i1 %12, i64 %10, i64 %11
  %14 = trunc i64 %13 to i32
  %15 = icmp sge i32 0, %14
  %16 = select i1 %15, i32 0, i32 %14
  %17 = icmp sle i32 191, %16
  %dynamic-slice.6.2.clone.1.start_idx0 = select i1 %17, i32 191, i32 %16
  %18 = add i32 %dynamic-slice.6.2.clone.1.start_idx0, 0
  %19 = getelementptr inbounds [192 x double], ptr %arg1, i32 0, i32 %18
  %20 = load double, ptr %19, align 8, !invariant.load !38
  %21 = load double, ptr %arg0, align 8, !invariant.load !38
  %multiply.70.3.clone.1 = fmul double %20, %21
  %add.35.1.clone.1 = fadd double %multiply.69.1.clone.1, %multiply.70.3.clone.1
  %22 = fneg double %add.35.1.clone.1
  %23 = call double @__nv_exp(double %22)
  %constant_38_21 = load double, ptr @8, align 8
  %add.36.1.clone.1 = fadd double %23, %constant_38_21
  %divide.37.1.clone.1 = fdiv double %constant_38_2, %add.36.1.clone.1
  %constant_38_22 = load double, ptr @8, align 8
  %subtract.11.1 = fsub double %constant_38_22, %divide.37.1.clone.1
  %multiply.71.1 = fmul double %divide.37.1.clone.1, %subtract.11.1
  %24 = insertvalue { double, double, double, double, double, double, double } undef, double %multiply.71.1, 0
  %25 = insertvalue { double, double, double, double, double, double, double } %24, double %divide.37.1.clone.1, 1
  %26 = insertvalue { double, double, double, double, double, double, double } %25, double %add.35.1.clone.1, 2
  %27 = load double, ptr %arg5, align 8, !invariant.load !38
  %28 = call double @__nv_exp(double %27)
  %multiply.73.5.clone.1 = fmul double %20, %28
  %constant_39_2_clone_1_clone_1 = load double, ptr @10, align 8
  %compare.20.2.clone.1 = fcmp ogt double %multiply.73.5.clone.1, %constant_39_2_clone_1_clone_1
  %29 = zext i1 %compare.20.2.clone.1 to i8
  %constant_40_1_clone_1_clone_1 = load double, ptr @9, align 8
  %30 = trunc i8 %29 to i1
  %31 = select i1 %30, double %multiply.73.5.clone.1, double %constant_40_1_clone_1_clone_1
  %constant_38_23 = load double, ptr @8, align 8
  %constant_38_24 = load double, ptr @8, align 8
  %32 = load double, ptr %arg6, align 8, !invariant.load !38
  %divide.39.1.clone.1.clone.1 = fdiv double %constant_38_24, %32
  %add.37.1.clone.1.clone.1 = fadd double %divide.39.1.clone.1.clone.1, %31
  %divide.40.1.clone.1.clone.1 = fdiv double %constant_38_23, %add.37.1.clone.1.clone.1
  %multiply.77.1.clone.1 = fmul double %31, %divide.40.1.clone.1.clone.1
  %33 = insertvalue { double, double, double, double, double, double, double } %26, double %multiply.77.1.clone.1, 3
  %34 = insertvalue { double, double, double, double, double, double, double } %33, double %divide.40.1.clone.1.clone.1, 4
  %35 = insertvalue { double, double, double, double, double, double, double } %34, double %divide.39.1.clone.1.clone.1, 5
  %36 = insertvalue { double, double, double, double, double, double, double } %35, double %20, 6
  %37 = extractvalue { double, double, double, double, double, double, double } %36, 0
  store double %37, ptr %arg7, align 8
  %38 = extractvalue { double, double, double, double, double, double, double } %36, 1
  store double %38, ptr %arg8, align 8
  %39 = extractvalue { double, double, double, double, double, double, double } %36, 2
  store double %39, ptr %arg9, align 8
  %40 = extractvalue { double, double, double, double, double, double, double } %36, 3
  store double %40, ptr %arg10, align 8
  %41 = extractvalue { double, double, double, double, double, double, double } %36, 4
  store double %41, ptr %arg11, align 8
  %42 = extractvalue { double, double, double, double, double, double, double } %36, 5
  store double %42, ptr %arg12, align 8
  %43 = extractvalue { double, double, double, double, double, double, double } %36, 6
  %44 = getelementptr double, ptr %arg13, i32 %linear_index
  %45 = getelementptr inbounds double, ptr %44, i32 0
  store double %43, ptr %45, align 8
  br label %loop_add_divide_dynamic_slice_multiply_fusion.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_divide_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_divide_fusion.in_bounds-true, label %loop_divide_fusion.in_bounds-after

loop_divide_fusion.in_bounds-after:               ; preds = %loop_divide_fusion.in_bounds-true, %entry
  ret void

loop_divide_fusion.in_bounds-true:                ; preds = %entry
  %constant_3_1 = load double, ptr @11, align 8
  %constant_3_11 = load double, ptr @11, align 8
  %4 = load double, ptr %arg2, align 8
  %divide.35.1 = fdiv double %constant_3_11, %4
  %5 = load double, ptr %arg0, align 8, !invariant.load !38
  %6 = load double, ptr %arg1, align 8, !invariant.load !38
  %7 = call double @__nv_exp(double %6)
  %multiply.65.1 = fmul double %5, %7
  %add.31.1 = fadd double %divide.35.1, %multiply.65.1
  %divide.36.1 = fdiv double %constant_3_1, %add.31.1
  store double %divide.36.1, ptr %arg2, align 8
  br label %loop_divide_fusion.in_bounds-after
}

define void @loop_select_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.in_bounds-true, label %loop_select_fusion.in_bounds-after

loop_select_fusion.in_bounds-after:               ; preds = %loop_select_fusion.in_bounds-true, %entry
  ret void

loop_select_fusion.in_bounds-true:                ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !38
  %5 = getelementptr double, ptr %arg3, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !38
  %8 = getelementptr double, ptr %arg3, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !38
  %multiply.66.3 = fmul double %7, %10
  %11 = load double, ptr %arg2, align 8, !invariant.load !38
  %multiply.67.7 = fmul double %multiply.66.3, %11
  %12 = load i64, ptr %arg1, align 8, !invariant.load !38
  %13 = sitofp i64 %12 to double
  %multiply.68.5 = fmul double %multiply.67.7, %13
  %add.32.3 = fadd double %4, %multiply.68.5
  %constant_5_1 = load double, ptr @13, align 8
  %compare.18.1 = fcmp ogt double %add.32.3, %constant_5_1
  %14 = zext i1 %compare.18.1 to i8
  %constant_6_1 = load double, ptr @12, align 8
  %15 = trunc i8 %14 to i1
  %16 = select i1 %15, double %add.32.3, double %constant_6_1
  store double %16, ptr %arg4, align 8
  br label %loop_select_fusion.in_bounds-after
}

define void @loop_add_divide_dynamic_slice_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6, ptr noalias align 16 dereferenceable(1536) %arg7, ptr noalias align 128 dereferenceable(8) %arg8, ptr noalias align 128 dereferenceable(8) %arg9, ptr noalias align 128 dereferenceable(8) %arg10) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_divide_dynamic_slice_fusion.in_bounds-true, label %loop_add_divide_dynamic_slice_fusion.in_bounds-after

loop_add_divide_dynamic_slice_fusion.in_bounds-after: ; preds = %loop_add_divide_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_add_divide_dynamic_slice_fusion.in_bounds-true: ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !38
  %5 = getelementptr double, ptr %arg3, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !38
  %8 = load double, ptr %arg2, align 8, !invariant.load !38
  %multiply.74.7 = fmul double %7, %8
  %9 = load double, ptr %arg1, align 8, !invariant.load !38
  %divide.41.5 = fdiv double %multiply.74.7, %9
  %10 = load i64, ptr %arg5, align 8, !invariant.load !38
  %constant_37_27 = load i64, ptr @14, align 8
  %11 = icmp slt i64 %10, %constant_37_27
  %12 = zext i1 %11 to i8
  %13 = load i64, ptr %arg5, align 8, !invariant.load !38
  %constant_36_26 = load i64, ptr @15, align 8
  %14 = add i64 %13, %constant_36_26
  %15 = load i64, ptr %arg5, align 8, !invariant.load !38
  %16 = trunc i8 %12 to i1
  %17 = select i1 %16, i64 %14, i64 %15
  %18 = trunc i64 %17 to i32
  %19 = icmp sge i32 0, %18
  %20 = select i1 %19, i32 0, i32 %18
  %21 = icmp sle i32 191, %20
  %dynamic-slice.7.2.clone.1.start_idx0 = select i1 %21, i32 191, i32 %20
  %constant_37_271 = load i64, ptr @14, align 8
  %22 = trunc i64 %constant_37_271 to i32
  %23 = icmp sge i32 0, %22
  %24 = select i1 %23, i32 0, i32 %22
  %25 = icmp sle i32 0, %24
  %dynamic-slice.7.2.clone.1.start_idx1 = select i1 %25, i32 0, i32 %24
  %26 = add i32 %dynamic-slice.7.2.clone.1.start_idx0, 0
  %27 = add i32 %dynamic-slice.7.2.clone.1.start_idx1, 0
  %28 = getelementptr inbounds [192 x [1 x double]], ptr %arg7, i32 0, i32 %26, i32 0
  %29 = load double, ptr %28, align 8, !invariant.load !38
  %30 = load double, ptr %arg6, align 8, !invariant.load !38
  %subtract.12.5.clone.1 = fsub double %29, %30
  %31 = trunc i64 %17 to i32
  %32 = icmp sge i32 0, %31
  %33 = select i1 %32, i32 0, i32 %31
  %34 = icmp sle i32 191, %33
  %dynamic-slice.8.9.clone.1.start_idx0 = select i1 %34, i32 191, i32 %33
  %35 = add i32 %dynamic-slice.8.9.clone.1.start_idx0, 0
  %36 = getelementptr inbounds [192 x i64], ptr %arg4, i32 0, i32 %35
  %37 = load i64, ptr %36, align 8, !invariant.load !38
  %38 = sitofp i64 %37 to double
  %multiply.72.3.clone.1 = fmul double %subtract.12.5.clone.1, %38
  %39 = load double, ptr %arg2, align 8, !invariant.load !38
  %divide.38.1.clone.1 = fdiv double %multiply.72.3.clone.1, %39
  %multiply.75.1 = fmul double %divide.38.1.clone.1, %38
  %multiply.76.3 = fmul double %divide.41.5, %multiply.75.1
  %add.38.1 = fadd double %4, %multiply.76.3
  %40 = insertvalue { double, double, double } undef, double %add.38.1, 0
  %41 = insertvalue { double, double, double } %40, double %divide.38.1.clone.1, 1
  %42 = insertvalue { double, double, double } %41, double %29, 2
  %43 = extractvalue { double, double, double } %42, 0
  store double %43, ptr %arg8, align 8
  %44 = extractvalue { double, double, double } %42, 1
  store double %44, ptr %arg9, align 8
  %45 = extractvalue { double, double, double } %42, 2
  %46 = getelementptr double, ptr %arg10, i32 %linear_index
  %47 = getelementptr inbounds double, ptr %46, i32 0
  store double %45, ptr %47, align 8
  br label %loop_add_divide_dynamic_slice_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_9(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.143 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_19 = load i64, ptr @17, align 8
  %0 = icmp slt i64 %param_2.143, %constant_37_19
  %1 = zext i1 %0 to i8
  %param_2.1431 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_18 = load i64, ptr @16, align 8
  %2 = add i64 %param_2.1431, %constant_36_18
  %param_2.1432 = load i64, ptr %arg2, align 8, !invariant.load !38
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.1432
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.51.1.in_bounds-true, label %dynamic-update-slice.51.1.in_bounds-after

dynamic-update-slice.51.1.in_bounds-after:        ; preds = %dynamic-update-slice.51.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.51.1.in_bounds-true:         ; preds = %entry
  %14 = add i64 %8, %12
  %param_1.159 = load double, ptr %arg1, align 8, !invariant.load !38
  %15 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %param_1.159, ptr %15, align 8
  br label %dynamic-update-slice.51.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.177 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_1 = load i64, ptr @19, align 8
  %0 = icmp slt i64 %param_2.177, %constant_37_1
  %1 = zext i1 %0 to i8
  %param_2.1771 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_12 = load i64, ptr @18, align 8
  %2 = add i64 %param_2.1771, %constant_36_12
  %param_2.1772 = load i64, ptr %arg2, align 8, !invariant.load !38
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.1772
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_37_13 = load i64, ptr @19, align 8
  %9 = icmp sge i64 0, %constant_37_13
  %10 = select i1 %9, i64 0, i64 %constant_37_13
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 1
  %18 = udiv i64 %linear_index0, 1
  %19 = icmp ult i64 %linear_index, 1
  br i1 %19, label %dynamic-update-slice.60.1.in_bounds-true, label %dynamic-update-slice.60.1.in_bounds-after

dynamic-update-slice.60.1.in_bounds-after:        ; preds = %dynamic-update-slice.60.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.60.1.in_bounds-true:         ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.181 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.1814 = load double, ptr %param_1.181, align 8, !invariant.load !38
  %23 = getelementptr inbounds [192 x [1 x double]], ptr %arg0, i64 0, i64 %20, i64 0
  store double %param_1.1814, ptr %23, align 8
  br label %dynamic-update-slice.60.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_1(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.98 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_8 = load i64, ptr @21, align 8
  %0 = icmp slt i64 %param_2.98, %constant_37_8
  %1 = zext i1 %0 to i8
  %param_2.981 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_3 = load i64, ptr @20, align 8
  %2 = add i64 %param_2.981, %constant_36_3
  %param_2.982 = load i64, ptr %arg2, align 8, !invariant.load !38
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.982
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.59.1.in_bounds-true, label %dynamic-update-slice.59.1.in_bounds-after

dynamic-update-slice.59.1.in_bounds-after:        ; preds = %dynamic-update-slice.59.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.59.1.in_bounds-true:         ; preds = %entry
  %14 = add i64 %8, %12
  %param_1.124 = load double, ptr %arg1, align 8, !invariant.load !38
  %15 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %param_1.124, ptr %15, align 8
  br label %dynamic-update-slice.59.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_8(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.146 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_20 = load i64, ptr @23, align 8
  %0 = icmp slt i64 %param_2.146, %constant_37_20
  %1 = zext i1 %0 to i8
  %param_2.1461 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_19 = load i64, ptr @22, align 8
  %2 = add i64 %param_2.1461, %constant_36_19
  %param_2.1462 = load i64, ptr %arg2, align 8, !invariant.load !38
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.1462
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.52.1.in_bounds-true, label %dynamic-update-slice.52.1.in_bounds-after

dynamic-update-slice.52.1.in_bounds-after:        ; preds = %dynamic-update-slice.52.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.52.1.in_bounds-true:         ; preds = %entry
  %14 = add i64 %8, %12
  %param_1.161 = load i64, ptr %arg1, align 8, !invariant.load !38
  %15 = getelementptr inbounds [192 x i64], ptr %arg0, i64 0, i64 %14
  store i64 %param_1.161, ptr %15, align 8
  br label %dynamic-update-slice.52.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_18(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 16 dereferenceable(1536) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.124 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_14 = load i64, ptr @25, align 8
  %0 = icmp slt i64 %param_2.124, %constant_37_14
  %1 = zext i1 %0 to i8
  %param_2.1241 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_11 = load i64, ptr @24, align 8
  %2 = add i64 %param_2.1241, %constant_36_11
  %param_2.1242 = load i64, ptr %arg2, align 8, !invariant.load !38
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.1242
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.45.1.in_bounds-true, label %dynamic-update-slice.45.1.in_bounds-after

dynamic-update-slice.45.1.in_bounds-after:        ; preds = %dynamic-update-slice.45.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.45.1.in_bounds-true:         ; preds = %entry
  %14 = add i64 %8, %12
  %param_2.1243 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_144 = load i64, ptr @25, align 8
  %15 = icmp slt i64 %param_2.1243, %constant_37_144
  %16 = zext i1 %15 to i8
  %param_2.1245 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_116 = load i64, ptr @24, align 8
  %17 = add i64 %param_2.1245, %constant_36_116
  %param_2.1247 = load i64, ptr %arg2, align 8, !invariant.load !38
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_2.1247
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.8.2.start_idx0 = select i1 %22, i64 191, i64 %21
  %23 = add i64 %dynamic-slice.8.2.start_idx0, %12
  %param_1.145 = getelementptr inbounds [192 x i64], ptr %arg1, i64 0, i64 %23
  %param_1.1458 = load i64, ptr %param_1.145, align 8, !invariant.load !38
  %24 = getelementptr inbounds [192 x i64], ptr %arg0, i64 0, i64 %14
  store i64 %param_1.1458, ptr %24, align 8
  br label %dynamic-update-slice.45.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_15(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 16 dereferenceable(1536) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.179 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_5 = load i64, ptr @26, align 8
  %0 = icmp slt i64 %param_2.179, %constant_37_5
  %1 = zext i1 %0 to i8
  %param_2.1791 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_10 = load i64, ptr @27, align 8
  %2 = add i64 %param_2.1791, %constant_36_10
  %param_2.1792 = load i64, ptr %arg2, align 8, !invariant.load !38
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.1792
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.44.1.in_bounds-true, label %dynamic-update-slice.44.1.in_bounds-after

dynamic-update-slice.44.1.in_bounds-after:        ; preds = %dynamic-update-slice.44.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.44.1.in_bounds-true:         ; preds = %entry
  %14 = add i64 %8, %12
  %param_2.1793 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_54 = load i64, ptr @26, align 8
  %15 = icmp slt i64 %param_2.1793, %constant_37_54
  %16 = zext i1 %15 to i8
  %param_2.1795 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_106 = load i64, ptr @27, align 8
  %17 = add i64 %param_2.1795, %constant_36_106
  %param_2.1797 = load i64, ptr %arg2, align 8, !invariant.load !38
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_2.1797
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.7.1.start_idx0 = select i1 %22, i64 191, i64 %21
  %constant_37_58 = load i64, ptr @26, align 8
  %23 = icmp sge i64 0, %constant_37_58
  %24 = select i1 %23, i64 0, i64 %constant_37_58
  %25 = icmp sle i64 0, %24
  %dynamic-slice.7.1.start_idx1 = select i1 %25, i64 0, i64 %24
  %26 = add i64 %dynamic-slice.7.1.start_idx0, %12
  %27 = add i64 %dynamic-slice.7.1.start_idx1, 0
  %param_1.143 = getelementptr inbounds [192 x [1 x double]], ptr %arg1, i64 0, i64 %26, i64 0
  %param_1.1439 = load double, ptr %param_1.143, align 8, !invariant.load !38
  %28 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %param_1.1439, ptr %28, align 8
  br label %dynamic-update-slice.44.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_19(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 16 dereferenceable(1536) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.113 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_11 = load i64, ptr @29, align 8
  %0 = icmp slt i64 %param_2.113, %constant_37_11
  %1 = zext i1 %0 to i8
  %param_2.1131 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_7 = load i64, ptr @28, align 8
  %2 = add i64 %param_2.1131, %constant_36_7
  %param_2.1132 = load i64, ptr %arg2, align 8, !invariant.load !38
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.1132
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.41.1.in_bounds-true, label %dynamic-update-slice.41.1.in_bounds-after

dynamic-update-slice.41.1.in_bounds-after:        ; preds = %dynamic-update-slice.41.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.41.1.in_bounds-true:         ; preds = %entry
  %14 = add i64 %8, %12
  %param_2.1133 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_37_114 = load i64, ptr @29, align 8
  %15 = icmp slt i64 %param_2.1133, %constant_37_114
  %16 = zext i1 %15 to i8
  %param_2.1135 = load i64, ptr %arg2, align 8, !invariant.load !38
  %constant_36_76 = load i64, ptr @28, align 8
  %17 = add i64 %param_2.1135, %constant_36_76
  %param_2.1137 = load i64, ptr %arg2, align 8, !invariant.load !38
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_2.1137
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.6.1.start_idx0 = select i1 %22, i64 191, i64 %21
  %23 = add i64 %dynamic-slice.6.1.start_idx0, %12
  %param_1.137 = getelementptr inbounds [192 x double], ptr %arg1, i64 0, i64 %23
  %param_1.1378 = load double, ptr %param_1.137, align 8, !invariant.load !38
  %24 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %param_1.1378, ptr %24, align 8
  br label %dynamic-update-slice.41.1.in_bounds-after
}

define void @loop_add_fusion(ptr noalias align 128 dereferenceable(8) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %4 = load i64, ptr %arg0, align 8
  %constant_35_1 = load i64, ptr @30, align 8
  %5 = add i64 %4, %constant_35_1
  store i64 %5, ptr %arg0, align 8
  br label %loop_add_fusion.in_bounds-after
}

define void @copy_fusion_1(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(1536) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(1536) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 194
  br i1 %4, label %copy_fusion.1.in_bounds-true, label %copy_fusion.1.in_bounds-after

copy_fusion.1.in_bounds-after:                    ; preds = %slice2-after, %entry
  ret void

copy_fusion.1.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = getelementptr inbounds [1 x double], ptr %arg0, i32 0, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !38
  br label %concatenate.1.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %9 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = getelementptr inbounds [1 x double], ptr %arg1, i32 0, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !38
  br label %concatenate.1.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.2.2
  %13 = phi i32 [ 2, %concatenate.pivot.2.2 ]
  %14 = sub nsw i32 %3, %13
  %15 = getelementptr inbounds [192 x double], ptr %arg2, i32 0, i32 %14
  %16 = load double, ptr %15, align 8, !invariant.load !38
  br label %concatenate.1.merge

concatenate.pivot.1.:                             ; preds = %copy_fusion.1.in_bounds-true
  %17 = icmp ult i32 %3, 1
  br i1 %17, label %concatenate.pivot.0., label %concatenate.pivot.2.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.2.:                             ; preds = %concatenate.pivot.1.
  %18 = icmp ult i32 %3, 2
  br i1 %18, label %concatenate.pivot.1.1, label %concatenate.pivot.2.2

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.2.
  br label %concat_index_from_operand_id1

concatenate.pivot.2.2:                            ; preds = %concatenate.pivot.2.
  br label %concat_index_from_operand_id2

concatenate.1.merge:                              ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %19 = phi double [ %8, %concat_index_from_operand_id0 ], [ %12, %concat_index_from_operand_id1 ], [ %16, %concat_index_from_operand_id2 ]
  %20 = icmp sge i32 %3, 0
  %21 = icmp slt i32 %3, 1
  %22 = and i1 %20, %21
  br i1 %22, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.1.merge
  %23 = icmp sge i32 %3, 1
  %24 = icmp slt i32 %3, 2
  %25 = and i1 %23, %24
  br i1 %25, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %26 = icmp sge i32 %3, 2
  %27 = icmp slt i32 %3, 194
  %28 = and i1 %26, %27
  br i1 %28, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  br label %copy_fusion.1.in_bounds-after

slice0-true:                                      ; preds = %concatenate.1.merge
  %29 = sub i32 %3, 0
  %30 = getelementptr inbounds [1 x double], ptr %arg3, i32 0, i32 0
  store double %19, ptr %30, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %31 = sub i32 %3, 1
  %32 = getelementptr inbounds [1 x double], ptr %arg4, i32 0, i32 0
  store double %19, ptr %32, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %33 = sub i32 %3, 2
  %34 = getelementptr inbounds [192 x double], ptr %arg5, i32 0, i32 %33
  store double %19, ptr %34, align 8
  br label %slice2-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 192}
!4 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!6 = !{ptr @loop_convert_dynamic_slice_fusion, !"kernel", i32 1}
!7 = !{ptr @loop_convert_dynamic_slice_fusion, !"reqntidx", i32 1}
!8 = !{ptr @loop_add_divide_dynamic_slice_multiply_fusion, !"kernel", i32 1}
!9 = !{ptr @loop_add_divide_dynamic_slice_multiply_fusion, !"reqntidx", i32 1}
!10 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!11 = !{ptr @loop_divide_fusion, !"reqntidx", i32 1}
!12 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_select_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_add_divide_dynamic_slice_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_add_divide_dynamic_slice_fusion, !"reqntidx", i32 1}
!16 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!17 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 1}
!18 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 1}
!20 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!21 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 1}
!22 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!23 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 1}
!24 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!25 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 1}
!26 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!27 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 1}
!28 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!29 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 1}
!30 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!31 = !{ptr @loop_add_fusion, !"reqntidx", i32 1}
!32 = !{ptr @copy_fusion_1, !"kernel", i32 1}
!33 = !{ptr @copy_fusion_1, !"reqntidx", i32 128}
!34 = !{i32 0, i32 3}
!35 = !{i32 0, i32 128}
!36 = !{i32 0, i32 1}
!37 = !{i32 0, i32 192}
!38 = !{}
!39 = !{i32 0, i32 2}
