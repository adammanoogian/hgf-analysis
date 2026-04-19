; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@1 = private unnamed_addr constant [8 x i8] zeroinitializer
@2 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@3 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@4 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@5 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@6 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@7 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@8 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@9 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@10 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@11 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@12 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@13 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@14 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@15 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@16 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@17 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@18 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@19 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"

define void @loop_convert_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(4) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_convert_fusion.in_bounds-true, label %loop_convert_fusion.in_bounds-after

loop_convert_fusion.in_bounds-after:              ; preds = %loop_convert_fusion.in_bounds-true, %entry
  ret void

loop_convert_fusion.in_bounds-true:               ; preds = %entry
  %4 = getelementptr i64, ptr %arg0, i32 %linear_index
  %5 = getelementptr inbounds i64, ptr %4, i32 0
  %6 = load i64, ptr %5, align 8, !invariant.load !23
  %7 = getelementptr i64, ptr @0, i32 %linear_index
  %constant_41_1 = getelementptr inbounds i64, ptr %7, i32 0
  %constant_41_11 = load i64, ptr %constant_41_1, align 8
  %8 = icmp ne i64 %6, %constant_41_11
  %9 = zext i1 %8 to i8
  %10 = zext i8 %9 to i32
  store i32 %10, ptr %arg1, align 4
  br label %loop_convert_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_convert_fusion_1(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(4) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_convert_fusion.1.in_bounds-true, label %loop_convert_fusion.1.in_bounds-after

loop_convert_fusion.1.in_bounds-after:            ; preds = %loop_convert_fusion.1.in_bounds-true, %entry
  ret void

loop_convert_fusion.1.in_bounds-true:             ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !23
  %constant_39_1 = load i64, ptr @1, align 8
  %5 = icmp ne i64 %4, %constant_39_1
  %6 = zext i1 %5 to i8
  %7 = zext i8 %6 to i32
  store i32 %7, ptr %arg1, align 4
  br label %loop_convert_fusion.1.in_bounds-after
}

define void @loop_divide_fusion_2(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_divide_fusion.2.in_bounds-true, label %loop_divide_fusion.2.in_bounds-after

loop_divide_fusion.2.in_bounds-after:             ; preds = %loop_divide_fusion.2.in_bounds-true, %entry
  ret void

loop_divide_fusion.2.in_bounds-true:              ; preds = %entry
  %constant_77_4 = load double, ptr @2, align 8
  %constant_77_41 = load double, ptr @2, align 8
  %4 = load double, ptr %arg4, align 8, !invariant.load !23
  %divide.82.1.clone.1 = fdiv double %constant_77_41, %4
  %5 = getelementptr double, ptr %arg3, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !23
  %8 = load double, ptr %arg0, align 8, !invariant.load !23
  %9 = getelementptr double, ptr %arg2, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !23
  %12 = load double, ptr %arg1, align 8, !invariant.load !23
  %multiply.192.13 = fmul double %11, %12
  %add.79.11 = fadd double %8, %multiply.192.13
  %13 = call double @__nv_exp(double %add.79.11)
  %multiply.193.7 = fmul double %7, %13
  %constant_79_5 = load double, ptr @4, align 8
  %compare.31.5 = fcmp ogt double %multiply.193.7, %constant_79_5
  %14 = zext i1 %compare.31.5 to i8
  %constant_81_5 = load double, ptr @3, align 8
  %15 = trunc i8 %14 to i1
  %16 = select i1 %15, double %multiply.193.7, double %constant_81_5
  %add.80.2 = fadd double %divide.82.1.clone.1, %16
  %divide.83.1 = fdiv double %constant_77_4, %add.80.2
  %17 = insertvalue { double, double } undef, double %divide.83.1, 0
  %18 = insertvalue { double, double } %17, double %divide.82.1.clone.1, 1
  %19 = extractvalue { double, double } %18, 0
  store double %19, ptr %arg5, align 8
  %20 = extractvalue { double, double } %18, 1
  store double %20, ptr %arg6, align 8
  br label %loop_divide_fusion.2.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @copy_fusion_8(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %2 = mul nuw nsw i32 %0, 3
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 3
  br i1 %4, label %copy_fusion.8.in_bounds-true, label %copy_fusion.8.in_bounds-after

copy_fusion.8.in_bounds-after:                    ; preds = %slice2-after, %entry
  ret void

copy_fusion.8.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = getelementptr inbounds [1 x double], ptr %arg0, i32 0, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !23
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %9 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = getelementptr inbounds [1 x [1 x double]], ptr %arg0, i32 0, i32 0, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !23
  br label %concatenate.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.2.2
  %13 = phi i32 [ 2, %concatenate.pivot.2.2 ]
  %14 = sub nsw i32 %3, %13
  %15 = getelementptr inbounds [1 x [1 x double]], ptr %arg1, i32 0, i32 0, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !23
  br label %concatenate.merge

concatenate.pivot.1.:                             ; preds = %copy_fusion.8.in_bounds-true
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

concatenate.merge:                                ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %19 = phi double [ %8, %concat_index_from_operand_id0 ], [ %12, %concat_index_from_operand_id1 ], [ %16, %concat_index_from_operand_id2 ]
  %20 = icmp sge i32 %3, 0
  %21 = icmp slt i32 %3, 1
  %22 = and i1 %20, %21
  br i1 %22, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %23 = icmp sge i32 %3, 1
  %24 = icmp slt i32 %3, 2
  %25 = and i1 %23, %24
  br i1 %25, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %26 = icmp sge i32 %3, 2
  %27 = icmp slt i32 %3, 3
  %28 = and i1 %26, %27
  br i1 %28, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  br label %copy_fusion.8.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %29 = sub i32 %3, 0
  %30 = getelementptr inbounds [1 x double], ptr %arg2, i32 0, i32 0
  store double %19, ptr %30, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %31 = sub i32 %3, 1
  %32 = getelementptr inbounds [1 x double], ptr %arg3, i32 0, i32 0
  store double %19, ptr %32, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %33 = sub i32 %3, 2
  %34 = getelementptr inbounds [1 x double], ptr %arg4, i32 0, i32 0
  store double %19, ptr %34, align 8
  br label %slice2-after
}

define void @loop_add_divide_multiply_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_divide_multiply_fusion.in_bounds-true, label %loop_add_divide_multiply_fusion.in_bounds-after

loop_add_divide_multiply_fusion.in_bounds-after:  ; preds = %loop_add_divide_multiply_fusion.in_bounds-true, %entry
  ret void

loop_add_divide_multiply_fusion.in_bounds-true:   ; preds = %entry
  %constant_77_2 = load double, ptr @5, align 8
  %4 = load double, ptr %arg2, align 8, !invariant.load !23
  %5 = load double, ptr %arg3, align 8, !invariant.load !23
  %multiply.188.1.clone.1 = fmul double %4, %5
  %6 = getelementptr double, ptr %arg1, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !23
  %9 = load double, ptr %arg0, align 8, !invariant.load !23
  %multiply.189.3.clone.1 = fmul double %8, %9
  %add.77.1.clone.1 = fadd double %multiply.188.1.clone.1, %multiply.189.3.clone.1
  %10 = fneg double %add.77.1.clone.1
  %11 = call double @__nv_exp(double %10)
  %constant_77_21 = load double, ptr @5, align 8
  %add.78.1.clone.1 = fadd double %11, %constant_77_21
  %divide.79.1.clone.1 = fdiv double %constant_77_2, %add.78.1.clone.1
  %constant_77_22 = load double, ptr @5, align 8
  %subtract.24.1 = fsub double %constant_77_22, %divide.79.1.clone.1
  %multiply.190.1 = fmul double %divide.79.1.clone.1, %subtract.24.1
  %12 = insertvalue { double, double, double } undef, double %multiply.190.1, 0
  %13 = insertvalue { double, double, double } %12, double %divide.79.1.clone.1, 1
  %14 = insertvalue { double, double, double } %13, double %add.77.1.clone.1, 2
  %15 = extractvalue { double, double, double } %14, 0
  store double %15, ptr %arg4, align 8
  %16 = extractvalue { double, double, double } %14, 1
  store double %16, ptr %arg5, align 8
  %17 = extractvalue { double, double, double } %14, 2
  store double %17, ptr %arg6, align 8
  br label %loop_add_divide_multiply_fusion.in_bounds-after
}

define void @loop_divide_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
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
  %constant_6_1 = load double, ptr @6, align 8
  %constant_6_11 = load double, ptr @6, align 8
  %4 = load double, ptr %arg4, align 8, !invariant.load !23
  %divide.75.1 = fdiv double %constant_6_11, %4
  %5 = load double, ptr %arg0, align 8, !invariant.load !23
  %6 = load double, ptr %arg1, align 8, !invariant.load !23
  %7 = getelementptr double, ptr %arg3, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !23
  %10 = load double, ptr %arg2, align 8, !invariant.load !23
  %multiply.173.11 = fmul double %9, %10
  %add.71.9 = fadd double %6, %multiply.173.11
  %11 = call double @__nv_exp(double %add.71.9)
  %multiply.174.5 = fmul double %5, %11
  %add.72.3 = fadd double %divide.75.1, %multiply.174.5
  %divide.76.1 = fdiv double %constant_6_1, %add.72.3
  store double %divide.76.1, ptr %arg5, align 8
  br label %loop_divide_fusion.in_bounds-after
}

define void @loop_select_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
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
  %4 = load double, ptr %arg0, align 8, !invariant.load !23
  %5 = getelementptr double, ptr %arg3, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !23
  %8 = getelementptr double, ptr %arg3, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !23
  %multiply.175.1 = fmul double %7, %10
  %11 = load double, ptr %arg1, align 8, !invariant.load !23
  %multiply.176.7 = fmul double %multiply.175.1, %11
  %12 = load i64, ptr %arg2, align 8, !invariant.load !23
  %13 = sitofp i64 %12 to double
  %multiply.177.5 = fmul double %multiply.176.7, %13
  %add.73.3 = fadd double %4, %multiply.177.5
  %constant_8_1 = load double, ptr @8, align 8
  %compare.29.1 = fcmp ogt double %add.73.3, %constant_8_1
  %14 = zext i1 %compare.29.1 to i8
  %constant_9_1 = load double, ptr @7, align 8
  %15 = trunc i8 %14 to i1
  %16 = select i1 %15, double %add.73.3, double %constant_9_1
  store double %16, ptr %arg4, align 8
  br label %loop_select_fusion.in_bounds-after
}

define void @loop_add_divide_multiply_subtract_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(8) %arg4, ptr noalias align 16 dereferenceable(8) %arg5, ptr noalias align 16 dereferenceable(8) %arg6, ptr noalias align 16 dereferenceable(8) %arg7, ptr noalias align 128 dereferenceable(8) %arg8, ptr noalias align 128 dereferenceable(8) %arg9, ptr noalias align 128 dereferenceable(8) %arg10, ptr noalias align 16 dereferenceable(8) %arg11, ptr noalias align 16 dereferenceable(8) %arg12, ptr noalias align 128 dereferenceable(8) %arg13, ptr noalias align 16 dereferenceable(8) %arg14, ptr noalias align 128 dereferenceable(8) %arg15, ptr noalias align 16 dereferenceable(8) %arg16, ptr noalias align 128 dereferenceable(8) %arg17, ptr noalias align 16 dereferenceable(8) %arg18, ptr noalias align 128 dereferenceable(8) %arg19, ptr noalias align 128 dereferenceable(8) %arg20, ptr noalias align 128 dereferenceable(8) %arg21, ptr noalias align 128 dereferenceable(8) %arg22, ptr noalias align 128 dereferenceable(8) %arg23, ptr noalias align 128 dereferenceable(8) %arg24, ptr noalias align 128 dereferenceable(8) %arg25, ptr noalias align 128 dereferenceable(8) %arg26, ptr noalias align 128 dereferenceable(8) %arg27) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_divide_multiply_subtract_fusion.in_bounds-true, label %loop_add_divide_multiply_subtract_fusion.in_bounds-after

loop_add_divide_multiply_subtract_fusion.in_bounds-after: ; preds = %loop_add_divide_multiply_subtract_fusion.in_bounds-true, %entry
  ret void

loop_add_divide_multiply_subtract_fusion.in_bounds-true: ; preds = %entry
  %4 = load double, ptr %arg6, align 8, !invariant.load !23
  %5 = load double, ptr %arg7, align 8, !invariant.load !23
  %multiply.204.1.clone.1 = fmul double %4, %5
  %6 = getelementptr double, ptr %arg3, i32 %linear_index
  %7 = getelementptr inbounds double, ptr %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !23
  %9 = load double, ptr %arg5, align 8, !invariant.load !23
  %multiply.205.3.clone.1 = fmul double %8, %9
  %add.84.1.clone.1 = fadd double %multiply.204.1.clone.1, %multiply.205.3.clone.1
  %10 = getelementptr double, ptr %arg0, i32 %linear_index
  %11 = getelementptr inbounds double, ptr %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !23
  %13 = load double, ptr %arg11, align 8, !invariant.load !23
  %14 = getelementptr double, ptr %arg12, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !23
  %17 = load double, ptr %arg7, align 8, !invariant.load !23
  %multiply.192.11.clone.1 = fmul double %16, %17
  %add.79.9.clone.1 = fadd double %13, %multiply.192.11.clone.1
  %18 = call double @__nv_exp(double %add.79.9.clone.1)
  %multiply.193.5.clone.1 = fmul double %8, %18
  %constant_79_1_clone_1 = load double, ptr @10, align 8
  %compare.31.3.clone.1 = fcmp ogt double %multiply.193.5.clone.1, %constant_79_1_clone_1
  %19 = zext i1 %compare.31.3.clone.1 to i8
  %constant_81_1_clone_1 = load double, ptr @9, align 8
  %20 = trunc i8 %19 to i1
  %21 = select i1 %20, double %multiply.193.5.clone.1, double %constant_81_1_clone_1
  %22 = load double, ptr %arg8, align 8, !invariant.load !23
  %multiply.199.1.clone.1 = fmul double %21, %22
  %multiply.207.9 = fmul double %12, %multiply.199.1.clone.1
  %constant_77_8 = load double, ptr @12, align 8
  %23 = load double, ptr %arg10, align 8, !invariant.load !23
  %add.80.1.clone.1 = fadd double %23, %21
  %24 = load double, ptr %arg9, align 8, !invariant.load !23
  %multiply.200.1.clone.1 = fmul double %add.80.1.clone.1, %24
  %divide.85.1.clone.1 = fdiv double %constant_77_8, %multiply.200.1.clone.1
  %25 = load double, ptr %arg8, align 8, !invariant.load !23
  %26 = load double, ptr %arg13, align 8, !invariant.load !23
  %27 = getelementptr double, ptr %arg16, i32 %linear_index
  %28 = getelementptr inbounds double, ptr %27, i32 0
  %29 = load double, ptr %28, align 8, !invariant.load !23
  %30 = load double, ptr %arg15, align 8, !invariant.load !23
  %multiply.194.7.clone.1 = fmul double %29, %30
  %31 = load double, ptr %arg9, align 8, !invariant.load !23
  %divide.84.5.clone.1 = fdiv double %multiply.194.7.clone.1, %31
  %32 = getelementptr double, ptr %arg18, i32 %linear_index
  %33 = getelementptr inbounds double, ptr %32, i32 0
  %34 = load double, ptr %33, align 8, !invariant.load !23
  %35 = load double, ptr %arg17, align 8, !invariant.load !23
  %subtract.25.5.clone.1 = fsub double %34, %35
  %36 = getelementptr i64, ptr %arg14, i32 %linear_index
  %37 = getelementptr inbounds i64, ptr %36, i32 0
  %38 = load i64, ptr %37, align 8, !invariant.load !23
  %39 = sitofp i64 %38 to double
  %multiply.191.3.clone.1 = fmul double %subtract.25.5.clone.1, %39
  %40 = load double, ptr %arg15, align 8, !invariant.load !23
  %divide.80.1.clone.1 = fdiv double %multiply.191.3.clone.1, %40
  %multiply.195.1.clone.1 = fmul double %divide.80.1.clone.1, %39
  %multiply.196.3.clone.1 = fmul double %divide.84.5.clone.1, %multiply.195.1.clone.1
  %add.81.1.clone.1 = fadd double %26, %multiply.196.3.clone.1
  %41 = load double, ptr %arg13, align 8, !invariant.load !23
  %subtract.26.1 = fsub double %add.81.1.clone.1, %41
  %multiply.202.1.clone.1 = fmul double %subtract.26.1, %subtract.26.1
  %multiply.203.1.clone.1 = fmul double %25, %multiply.202.1.clone.1
  %add.82.1.clone.1 = fadd double %divide.85.1.clone.1, %multiply.203.1.clone.1
  %constant_92_1_clone_1 = load double, ptr @11, align 8
  %add.83.1.clone.1 = fadd double %add.82.1.clone.1, %constant_92_1_clone_1
  %multiply.208.7 = fmul double %multiply.207.9, %add.83.1.clone.1
  %constant_77_81 = load double, ptr @12, align 8
  %constant_77_82 = load double, ptr @12, align 8
  %constant_77_83 = load double, ptr @12, align 8
  %42 = load double, ptr %arg4, align 8, !invariant.load !23
  %divide.86.1.clone.1 = fdiv double %constant_77_83, %42
  %43 = load double, ptr %arg2, align 8, !invariant.load !23
  %44 = call double @__nv_exp(double %43)
  %multiply.206.7.clone.1 = fmul double %8, %44
  %constant_79_1_clone_14 = load double, ptr @10, align 8
  %compare.33.5.clone.1 = fcmp ogt double %multiply.206.7.clone.1, %constant_79_1_clone_14
  %45 = zext i1 %compare.33.5.clone.1 to i8
  %constant_81_1_clone_15 = load double, ptr @9, align 8
  %46 = trunc i8 %45 to i1
  %47 = select i1 %46, double %multiply.206.7.clone.1, double %constant_81_1_clone_15
  %add.85.1.clone.1 = fadd double %divide.86.1.clone.1, %47
  %divide.87.1.clone.1 = fdiv double %constant_77_82, %add.85.1.clone.1
  %constant_89_1 = load double, ptr @13, align 8
  %multiply.209.1 = fmul double %divide.87.1.clone.1, %constant_89_1
  %divide.88.1 = fdiv double %constant_77_81, %multiply.209.1
  %multiply.210.5 = fmul double %multiply.208.7, %divide.88.1
  %48 = load i64, ptr %arg1, align 8, !invariant.load !23
  %49 = sitofp i64 %48 to double
  %multiply.211.3 = fmul double %multiply.210.5, %49
  %add.86.1 = fadd double %add.84.1.clone.1, %multiply.211.3
  %50 = insertvalue { double, double, double, double, double, double, double, double, double } undef, double %add.86.1, 0
  %51 = insertvalue { double, double, double, double, double, double, double, double, double } %50, double %divide.87.1.clone.1, 1
  %52 = insertvalue { double, double, double, double, double, double, double, double, double } %51, double %divide.86.1.clone.1, 2
  %53 = insertvalue { double, double, double, double, double, double, double, double, double } %52, double %add.84.1.clone.1, 3
  %54 = insertvalue { double, double, double, double, double, double, double, double, double } %53, double %add.83.1.clone.1, 4
  %55 = insertvalue { double, double, double, double, double, double, double, double, double } %54, double %subtract.26.1, 5
  %56 = insertvalue { double, double, double, double, double, double, double, double, double } %55, double %multiply.199.1.clone.1, 6
  %57 = insertvalue { double, double, double, double, double, double, double, double, double } %56, double %add.81.1.clone.1, 7
  %58 = insertvalue { double, double, double, double, double, double, double, double, double } %57, double %divide.80.1.clone.1, 8
  %59 = extractvalue { double, double, double, double, double, double, double, double, double } %58, 0
  store double %59, ptr %arg19, align 8
  %60 = extractvalue { double, double, double, double, double, double, double, double, double } %58, 1
  store double %60, ptr %arg20, align 8
  %61 = extractvalue { double, double, double, double, double, double, double, double, double } %58, 2
  store double %61, ptr %arg21, align 8
  %62 = extractvalue { double, double, double, double, double, double, double, double, double } %58, 3
  store double %62, ptr %arg22, align 8
  %63 = extractvalue { double, double, double, double, double, double, double, double, double } %58, 4
  store double %63, ptr %arg23, align 8
  %64 = extractvalue { double, double, double, double, double, double, double, double, double } %58, 5
  store double %64, ptr %arg24, align 8
  %65 = extractvalue { double, double, double, double, double, double, double, double, double } %58, 6
  store double %65, ptr %arg25, align 8
  %66 = extractvalue { double, double, double, double, double, double, double, double, double } %58, 7
  store double %66, ptr %arg26, align 8
  %67 = extractvalue { double, double, double, double, double, double, double, double, double } %58, 8
  store double %67, ptr %arg27, align 8
  br label %loop_add_divide_multiply_subtract_fusion.in_bounds-after
}

define void @loop_multiply_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %4 = getelementptr double, ptr %arg2, i32 %linear_index
  %5 = getelementptr inbounds double, ptr %4, i32 0
  %6 = load double, ptr %5, align 8, !invariant.load !23
  %7 = load double, ptr %arg1, align 8, !invariant.load !23
  %8 = call double @__nv_exp(double %7)
  %multiply.206.5 = fmul double %6, %8
  %constant_79_3 = load double, ptr @15, align 8
  %compare.33.3 = fcmp ogt double %multiply.206.5, %constant_79_3
  %9 = zext i1 %compare.33.3 to i8
  %constant_81_3 = load double, ptr @14, align 8
  %10 = trunc i8 %9 to i1
  %11 = select i1 %10, double %multiply.206.5, double %constant_81_3
  %12 = load double, ptr %arg0, align 8, !invariant.load !23
  %multiply.212.1 = fmul double %11, %12
  %13 = insertvalue { double, double } undef, double %multiply.212.1, 0
  %14 = insertvalue { double, double } %13, double %multiply.212.1, 1
  %15 = extractvalue { double, double } %14, 0
  store double %15, ptr %arg3, align 8
  %16 = extractvalue { double, double } %14, 1
  %17 = getelementptr double, ptr %arg4, i32 %linear_index
  %18 = getelementptr inbounds double, ptr %17, i32 0
  store double %16, ptr %18, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

define void @loop_divide_fusion_1(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_divide_fusion.1.in_bounds-true, label %loop_divide_fusion.1.in_bounds-after

loop_divide_fusion.1.in_bounds-after:             ; preds = %loop_divide_fusion.1.in_bounds-true, %entry
  ret void

loop_divide_fusion.1.in_bounds-true:              ; preds = %entry
  %constant_13_1 = load double, ptr @16, align 8
  %constant_13_11 = load double, ptr @16, align 8
  %4 = load double, ptr %arg2, align 8, !invariant.load !23
  %divide.77.1 = fdiv double %constant_13_11, %4
  %5 = load double, ptr %arg0, align 8, !invariant.load !23
  %6 = load double, ptr %arg1, align 8, !invariant.load !23
  %7 = call double @__nv_exp(double %6)
  %multiply.178.1 = fmul double %5, %7
  %add.74.1 = fadd double %divide.77.1, %multiply.178.1
  %divide.78.1 = fdiv double %constant_13_1, %add.74.1
  store double %divide.78.1, ptr %arg3, align 8
  br label %loop_divide_fusion.1.in_bounds-after
}

define void @loop_select_fusion_1(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(8) %arg3, ptr noalias align 16 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_select_fusion.1.in_bounds-true, label %loop_select_fusion.1.in_bounds-after

loop_select_fusion.1.in_bounds-after:             ; preds = %loop_select_fusion.1.in_bounds-true, %entry
  ret void

loop_select_fusion.1.in_bounds-true:              ; preds = %entry
  %4 = load double, ptr %arg0, align 8, !invariant.load !23
  %5 = getelementptr double, ptr %arg3, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !23
  %8 = load double, ptr %arg2, align 8, !invariant.load !23
  %multiply.179.3 = fmul double %7, %8
  %multiply.180.1 = fmul double %multiply.179.3, %multiply.179.3
  %constant_14_1 = load double, ptr @18, align 8
  %multiply.181.1 = fmul double %multiply.180.1, %constant_14_1
  %9 = load double, ptr %arg1, align 8, !invariant.load !23
  %multiply.182.1 = fmul double %multiply.180.1, %9
  %add.75.1 = fadd double %multiply.181.1, %multiply.182.1
  %multiply.183.15 = fmul double %7, %7
  %constant_14_11 = load double, ptr @18, align 8
  %multiply.184.13 = fmul double %multiply.183.15, %constant_14_11
  %10 = load double, ptr %arg2, align 8, !invariant.load !23
  %multiply.185.11 = fmul double %multiply.184.13, %10
  %11 = load double, ptr %arg1, align 8, !invariant.load !23
  %multiply.186.9 = fmul double %multiply.185.11, %11
  %subtract.23.7 = fsub double %add.75.1, %multiply.186.9
  %12 = load i64, ptr %arg4, align 8, !invariant.load !23
  %13 = sitofp i64 %12 to double
  %multiply.187.5 = fmul double %subtract.23.7, %13
  %add.76.3 = fadd double %4, %multiply.187.5
  %constant_15_1 = load double, ptr @19, align 8
  %compare.30.1 = fcmp ogt double %add.76.3, %constant_15_1
  %14 = zext i1 %compare.30.1 to i8
  %constant_16_1 = load double, ptr @17, align 8
  %15 = trunc i8 %14 to i1
  %16 = select i1 %15, double %add.76.3, double %constant_16_1
  store double %16, ptr %arg5, align 8
  br label %loop_select_fusion.1.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21}

!0 = !{ptr @loop_convert_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_convert_fusion, !"reqntidx", i32 1}
!2 = !{ptr @loop_convert_fusion_1, !"kernel", i32 1}
!3 = !{ptr @loop_convert_fusion_1, !"reqntidx", i32 1}
!4 = !{ptr @loop_divide_fusion_2, !"kernel", i32 1}
!5 = !{ptr @loop_divide_fusion_2, !"reqntidx", i32 1}
!6 = !{ptr @copy_fusion_8, !"kernel", i32 1}
!7 = !{ptr @copy_fusion_8, !"reqntidx", i32 3}
!8 = !{ptr @loop_add_divide_multiply_fusion, !"kernel", i32 1}
!9 = !{ptr @loop_add_divide_multiply_fusion, !"reqntidx", i32 1}
!10 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!11 = !{ptr @loop_divide_fusion, !"reqntidx", i32 1}
!12 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_select_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_add_divide_multiply_subtract_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_add_divide_multiply_subtract_fusion, !"reqntidx", i32 1}
!16 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 1}
!18 = !{ptr @loop_divide_fusion_1, !"kernel", i32 1}
!19 = !{ptr @loop_divide_fusion_1, !"reqntidx", i32 1}
!20 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!21 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 1}
!22 = !{i32 0, i32 1}
!23 = !{}
!24 = !{i32 0, i32 3}
