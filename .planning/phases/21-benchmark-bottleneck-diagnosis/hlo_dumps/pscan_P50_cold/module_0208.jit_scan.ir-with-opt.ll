; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_42_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !120
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 72
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr inbounds [9216 x i8], ptr addrspace(1) %arg03, i64 0, i64 %4
  br i1 %3, label %slice0-true, label %slice0-after

input_slice_fusion.in_bounds-after:               ; preds = %slice0-after, %slice1-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %6 = icmp ugt i32 %0, 71
  %7 = sext i32 %linear_index to i64
  %8 = getelementptr [9216 x i8], ptr addrspace(1) %arg15, i64 0, i64 %7
  br i1 %6, label %slice1-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %entry
  store i8 0, ptr addrspace(1) %5, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %8, i64 -9216
  store i8 0, ptr addrspace(1) %sunkaddr, align 1
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @copy_fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !120
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 72
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.9216.1

copy_fusion.10.in_bounds-after:                   ; preds = %slice0-after, %slice1-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 48
  %5 = mul i16 %4, 48
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = zext nneg i16 %4 to i64
  %7 = zext nneg i16 %.decomposed to i64
  %8 = getelementptr inbounds [192 x [48 x [1 x i8]]], ptr addrspace(1) %arg05, i64 0, i64 %6, i64 %7, i64 0
  br label %concatenate.4.merge

concatenate.pivot.9216.1:                         ; preds = %entry
  %9 = add nsw i32 %linear_index, -9216
  %10 = udiv i32 %9, 48
  %11 = mul i32 %10, 48
  %.decomposed4 = sub i32 %9, %11
  %12 = zext nneg i32 %10 to i64
  %13 = zext nneg i32 %.decomposed4 to i64
  %14 = getelementptr inbounds [192 x [48 x [1 x i8]]], ptr addrspace(1) %arg05, i64 0, i64 %12, i64 %13, i64 0
  br label %concatenate.4.merge

concatenate.4.merge:                              ; preds = %concatenate.pivot.9216.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %8, %concatenate.pivot.0. ], [ %14, %concatenate.pivot.9216.1 ]
  %15 = icmp ult i32 %0, 72
  %16 = load i8, ptr addrspace(1) %.in, align 1, !invariant.load !121
  %17 = zext nneg i32 %linear_index to i64
  %18 = getelementptr inbounds [9216 x i8], ptr addrspace(1) %arg17, i64 0, i64 %17
  br i1 %15, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.4.merge
  %19 = icmp ugt i32 %0, 71
  %20 = sext i32 %linear_index to i64
  %21 = getelementptr [9216 x i8], ptr addrspace(1) %arg29, i64 0, i64 %20
  br i1 %19, label %slice1-true, label %copy_fusion.10.in_bounds-after

slice0-true:                                      ; preds = %concatenate.4.merge
  store i8 %16, ptr addrspace(1) %18, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %21, i64 -9216
  store i8 %16, ptr addrspace(1) %sunkaddr, align 1
  br label %copy_fusion.10.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(36864) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !120
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 9408
  br i1 %3, label %concatenate.1.merge, label %input_slice_fusion.1.in_bounds-after

input_slice_fusion.1.in_bounds-after:             ; preds = %slice0-after, %slice1-true, %entry
  ret void

concatenate.1.merge:                              ; preds = %entry
  %4 = icmp ult i32 %linear_index, 192
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg03, i64 0, i64 %5
  br i1 %4, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.1.merge
  %7 = icmp ugt i32 %linear_index, 191
  %8 = add nsw i32 %linear_index, -192
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [9216 x i32], ptr addrspace(1) %arg15, i64 0, i64 %9
  br i1 %7, label %slice1-true, label %input_slice_fusion.1.in_bounds-after

slice0-true:                                      ; preds = %concatenate.1.merge
  store i32 0, ptr addrspace(1) %6, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store i32 0, ptr addrspace(1) %10, align 4
  br label %input_slice_fusion.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !120
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 9408
  br i1 %3, label %concatenate.2.merge, label %input_slice_fusion.2.in_bounds-after

input_slice_fusion.2.in_bounds-after:             ; preds = %slice0-after, %slice1-true, %entry
  ret void

concatenate.2.merge:                              ; preds = %entry
  %4 = icmp ult i32 %linear_index, 192
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %5
  br i1 %4, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.2.merge
  %7 = icmp ugt i32 %linear_index, 191
  %8 = add nsw i32 %linear_index, -192
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [9216 x double], ptr addrspace(1) %arg15, i64 0, i64 %9
  br i1 %7, label %slice1-true, label %input_slice_fusion.2.in_bounds-after

slice0-true:                                      ; preds = %concatenate.2.merge
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %10, align 8
  br label %input_slice_fusion.2.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !121
  %1 = icmp slt i64 %0, 192
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !121
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  store double %9, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #2 {
entry:
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !121
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg02, i64 0, i64 %7
  %9 = load i32, ptr addrspace(1) %8, align 4, !invariant.load !121
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i32
  store i32 %9, ptr addrspace(1) %arg26, align 128
  store i32 %11, ptr addrspace(1) %arg38, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_59(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.623 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !121
  %0 = icmp slt i64 %param_2.623, 0
  %1 = add i64 %param_2.623, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.623
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.735 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg112, i64 0, i64 %4
  %param_1.7358 = load i32, ptr addrspace(1) %param_1.735, align 4, !invariant.load !121
  %5 = icmp ne i32 %param_1.7358, 0
  %6 = zext i1 %5 to i32
  %7 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg010, i64 0, i64 %4
  store i32 %6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_38(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.342 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !121
  %0 = icmp slt i64 %param_2.342, 0
  %1 = add i64 %param_2.342, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.342
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.472 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg111, i64 0, i64 %4
  %param_1.4728 = load i32, ptr addrspace(1) %param_1.472, align 4, !invariant.load !121
  %5 = sitofp i32 %param_1.4728 to double
  %6 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg09, i64 0, i64 %4
  store double %5, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_exponential_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(384) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg14) local_unnamed_addr #2 {
entry:
  %arg1433 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1331 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1229 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1127 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1025 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg923 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg821 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg719 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg617 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg515 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg413 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg617, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !121
  %4 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %5 = icmp slt i64 %4, 0
  %6 = add i64 %4, 192
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc i64 %7 to i32
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 191)
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg17, i64 0, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !121
  %14 = getelementptr double, ptr addrspace(1) %arg311, i64 %1
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !121
  %16 = getelementptr double, ptr addrspace(1) %arg515, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !121
  %18 = getelementptr double, ptr addrspace(1) %arg413, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !121
  %multiply.852.5.clone.1 = fmul double %17, %19
  %add.342.3.clone.1 = fadd double %15, %multiply.852.5.clone.1
  %20 = tail call double @llvm.fma.f64(double %add.342.3.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #5
  %22 = tail call double @llvm.nvvm.add.rn.d(double %20, double 0xC338000000000000) #5
  %23 = tail call double @llvm.fma.f64(double %22, double 0xBFE62E42FEFA39EF, double %add.342.3.clone.1)
  %24 = tail call double @llvm.fma.f64(double %22, double 0xBC7ABC9E3B39803F, double %23)
  %25 = tail call double @llvm.fma.f64(double %24, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %26 = tail call double @llvm.fma.f64(double %25, double %24, double 0x3EC71DEE62401315)
  %27 = tail call double @llvm.fma.f64(double %26, double %24, double 0x3EFA01997C89EB71)
  %28 = tail call double @llvm.fma.f64(double %27, double %24, double 0x3F2A01A014761F65)
  %29 = tail call double @llvm.fma.f64(double %28, double %24, double 0x3F56C16C1852B7AF)
  %30 = tail call double @llvm.fma.f64(double %29, double %24, double 0x3F81111111122322)
  %31 = tail call double @llvm.fma.f64(double %30, double %24, double 0x3FA55555555502A1)
  %32 = tail call double @llvm.fma.f64(double %31, double %24, double 0x3FC5555555555511)
  %33 = tail call double @llvm.fma.f64(double %32, double %24, double 0x3FE000000000000B)
  %34 = tail call double @llvm.fma.f64(double %33, double %24, double 1.000000e+00)
  %35 = tail call double @llvm.fma.f64(double %34, double %24, double 1.000000e+00)
  %36 = tail call i32 @llvm.nvvm.d2i.lo(double %35) #5
  %37 = tail call i32 @llvm.nvvm.d2i.hi(double %35) #5
  %38 = shl i32 %21, 20
  %39 = add i32 %37, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %36, i32 %39) #5
  %41 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.3.clone.1) #5
  %42 = bitcast i32 %41 to float
  %43 = tail call float @llvm.nvvm.fabs.f(float %42) #5
  %44 = fcmp olt float %43, 0x4010C46560000000
  br i1 %44, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %45 = fcmp olt double %add.342.3.clone.1, 0.000000e+00
  %46 = fadd double %add.342.3.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %45, double 0.000000e+00, double %46
  %47 = fcmp olt float %43, 0x4010E90000000000
  br i1 %47, label %48, label %__nv_exp.exit

48:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %49 = sdiv i32 %21, 2
  %50 = shl i32 %49, 20
  %51 = add i32 %37, %50
  %52 = tail call double @llvm.nvvm.lohi.i2d(i32 %36, i32 %51) #5
  %53 = sub nsw i32 %21, %49
  %54 = shl i32 %53, 20
  %55 = add nsw i32 %54, 1072693248
  %56 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %55) #5
  %57 = fmul double %56, %52
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %48
  %z.2.i = phi double [ %40, %entry ], [ %57, %48 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %58 = getelementptr double, ptr addrspace(1) %arg05, i64 %1
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !121
  %60 = getelementptr double, ptr addrspace(1) %arg821, i64 %1
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !121
  %62 = getelementptr double, ptr addrspace(1) %arg923, i64 %1
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !121
  %multiply.848.7.clone.1.clone.1 = fmul double %61, %63
  %64 = getelementptr double, ptr addrspace(1) %arg719, i64 %1
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !121
  %multiply.849.9.clone.1.clone.1 = fmul double %13, %65
  %add.340.7.clone.1.clone.1 = fadd double %multiply.848.7.clone.1.clone.1, %multiply.849.9.clone.1.clone.1
  %66 = fneg double %add.340.7.clone.1.clone.1
  %67 = tail call double @llvm.fma.f64(double %66, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %68 = tail call i32 @llvm.nvvm.d2i.lo(double %67) #5
  %69 = tail call double @llvm.nvvm.add.rn.d(double %67, double 0xC338000000000000) #5
  %70 = tail call double @llvm.fma.f64(double %69, double 0xBFE62E42FEFA39EF, double %66)
  %71 = tail call double @llvm.fma.f64(double %69, double 0xBC7ABC9E3B39803F, double %70)
  %72 = tail call double @llvm.fma.f64(double %71, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %73 = tail call double @llvm.fma.f64(double %72, double %71, double 0x3EC71DEE62401315)
  %74 = tail call double @llvm.fma.f64(double %73, double %71, double 0x3EFA01997C89EB71)
  %75 = tail call double @llvm.fma.f64(double %74, double %71, double 0x3F2A01A014761F65)
  %76 = tail call double @llvm.fma.f64(double %75, double %71, double 0x3F56C16C1852B7AF)
  %77 = tail call double @llvm.fma.f64(double %76, double %71, double 0x3F81111111122322)
  %78 = tail call double @llvm.fma.f64(double %77, double %71, double 0x3FA55555555502A1)
  %79 = tail call double @llvm.fma.f64(double %78, double %71, double 0x3FC5555555555511)
  %80 = tail call double @llvm.fma.f64(double %79, double %71, double 0x3FE000000000000B)
  %81 = tail call double @llvm.fma.f64(double %80, double %71, double 1.000000e+00)
  %82 = tail call double @llvm.fma.f64(double %81, double %71, double 1.000000e+00)
  %83 = tail call i32 @llvm.nvvm.d2i.lo(double %82) #5
  %84 = tail call i32 @llvm.nvvm.d2i.hi(double %82) #5
  %85 = shl i32 %68, 20
  %86 = add i32 %84, %85
  %87 = tail call double @llvm.nvvm.lohi.i2d(i32 %83, i32 %86) #5
  %88 = tail call i32 @llvm.nvvm.d2i.hi(double %66) #5
  %89 = bitcast i32 %88 to float
  %90 = tail call float @llvm.nvvm.fabs.f(float %89) #5
  %91 = fcmp olt float %90, 0x4010C46560000000
  br i1 %91, label %__nv_exp.exit4, label %__internal_fast_icmp_abs_lt.exit.i1

__internal_fast_icmp_abs_lt.exit.i1:              ; preds = %__nv_exp.exit
  %92 = fcmp ogt double %add.340.7.clone.1.clone.1, 0.000000e+00
  %93 = fsub double 0x7FF0000000000000, %add.340.7.clone.1.clone.1
  %z.0.i2 = select i1 %92, double 0.000000e+00, double %93
  %94 = fcmp olt float %90, 0x4010E90000000000
  br i1 %94, label %95, label %__nv_exp.exit4

95:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i1
  %96 = sdiv i32 %68, 2
  %97 = shl i32 %96, 20
  %98 = add i32 %84, %97
  %99 = tail call double @llvm.nvvm.lohi.i2d(i32 %83, i32 %98) #5
  %100 = sub nsw i32 %68, %96
  %101 = shl i32 %100, 20
  %102 = add nsw i32 %101, 1072693248
  %103 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %102) #5
  %104 = fmul double %103, %99
  br label %__nv_exp.exit4

__nv_exp.exit4:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i1, %95
  %z.2.i3 = phi double [ %87, %__nv_exp.exit ], [ %104, %95 ], [ %z.0.i2, %__internal_fast_icmp_abs_lt.exit.i1 ]
  %divide.391.1.clone.1 = fdiv double 1.000000e+00, %3
  %multiply.853.13 = fmul double %13, %z.2.i
  %compare.265.13 = fcmp ogt double %multiply.853.13, 1.000000e-128
  %105 = select i1 %compare.265.13, double %multiply.853.13, double %59
  %add.343.5 = fadd double %divide.391.1.clone.1, %105
  %divide.392.1 = fdiv double 1.000000e+00, %add.343.5
  %add.341.3.clone.1.clone.1 = fadd double %z.2.i3, 1.000000e+00
  %divide.390.1.clone.1.clone.1 = fdiv double 1.000000e+00, %add.341.3.clone.1.clone.1
  %subtract.76.5.clone.1 = fsub double 1.000000e+00, %divide.390.1.clone.1.clone.1
  %multiply.850.1.clone.1 = fmul double %divide.390.1.clone.1.clone.1, %subtract.76.5.clone.1
  %106 = getelementptr double, ptr addrspace(1) %arg1025, i64 %1
  store double %divide.392.1, ptr addrspace(1) %106, align 8
  %107 = getelementptr double, ptr addrspace(1) %arg1127, i64 %1
  store double %z.2.i, ptr addrspace(1) %107, align 8
  %108 = getelementptr double, ptr addrspace(1) %arg1229, i64 %1
  store double %divide.391.1.clone.1, ptr addrspace(1) %108, align 8
  %109 = getelementptr double, ptr addrspace(1) %arg1331, i64 %1
  store double %multiply.850.1.clone.1, ptr addrspace(1) %109, align 8
  %110 = getelementptr double, ptr addrspace(1) %arg1433, i64 %1
  store double %divide.390.1.clone.1.clone.1, ptr addrspace(1) %110, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(48) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_exponential_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg8) local_unnamed_addr #2 {
entry:
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !121
  %4 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !121
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %9 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !121
  %multiply.841.5.clone.1 = fmul double %8, %10
  %add.335.3.clone.1 = fadd double %6, %multiply.841.5.clone.1
  %11 = tail call double @llvm.fma.f64(double %add.335.3.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #5
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #5
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %add.335.3.clone.1)
  %15 = tail call double @llvm.fma.f64(double %13, double 0xBC7ABC9E3B39803F, double %14)
  %16 = tail call double @llvm.fma.f64(double %15, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %17 = tail call double @llvm.fma.f64(double %16, double %15, double 0x3EC71DEE62401315)
  %18 = tail call double @llvm.fma.f64(double %17, double %15, double 0x3EFA01997C89EB71)
  %19 = tail call double @llvm.fma.f64(double %18, double %15, double 0x3F2A01A014761F65)
  %20 = tail call double @llvm.fma.f64(double %19, double %15, double 0x3F56C16C1852B7AF)
  %21 = tail call double @llvm.fma.f64(double %20, double %15, double 0x3F81111111122322)
  %22 = tail call double @llvm.fma.f64(double %21, double %15, double 0x3FA55555555502A1)
  %23 = tail call double @llvm.fma.f64(double %22, double %15, double 0x3FC5555555555511)
  %24 = tail call double @llvm.fma.f64(double %23, double %15, double 0x3FE000000000000B)
  %25 = tail call double @llvm.fma.f64(double %24, double %15, double 1.000000e+00)
  %26 = tail call double @llvm.fma.f64(double %25, double %15, double 1.000000e+00)
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #5
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #5
  %29 = shl i32 %12, 20
  %30 = add i32 %28, %29
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %30) #5
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %add.335.3.clone.1) #5
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #5
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %36 = fcmp olt double %add.335.3.clone.1, 0.000000e+00
  %37 = fadd double %add.335.3.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %36, double 0.000000e+00, double %37
  %38 = fcmp olt float %34, 0x4010E90000000000
  br i1 %38, label %39, label %__nv_exp.exit

39:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %40 = sdiv i32 %12, 2
  %41 = shl i32 %40, 20
  %42 = add i32 %28, %41
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %42) #5
  %44 = sub nsw i32 %12, %40
  %45 = shl i32 %44, 20
  %46 = add nsw i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %46) #5
  %48 = fmul double %47, %43
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %39
  %z.2.i = phi double [ %31, %entry ], [ %48, %39 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.385.7 = fdiv double 1.000000e+00, %3
  %multiply.842.7 = fmul double %4, %z.2.i
  %add.336.5 = fadd double %divide.385.7, %multiply.842.7
  %divide.387.1 = fdiv double 1.000000e+00, %add.336.5
  %multiply.843.1.clone.1 = fmul double %3, %3
  %divide.388.1.clone.1 = fdiv double 1.000000e+00, %multiply.843.1.clone.1
  %multiply.844.1.clone.1 = fmul double %add.336.5, %add.336.5
  %divide.389.1.clone.1 = fdiv double 1.000000e+00, %multiply.844.1.clone.1
  %49 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %divide.387.1, ptr addrspace(1) %49, align 8
  %50 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %divide.388.1.clone.1, ptr addrspace(1) %50, align 8
  %51 = getelementptr double, ptr addrspace(1) %arg715, i64 %1
  store double %divide.389.1.clone.1, ptr addrspace(1) %51, align 8
  %52 = getelementptr double, ptr addrspace(1) %arg817, i64 %1
  store double %z.2.i, ptr addrspace(1) %52, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_convert(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg01, align 128, !invariant.load !121
  %1 = sitofp i32 %0 to double
  store double %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(384) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(48) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !121
  %4 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !121
  %multiply.845.5.clone.1 = fmul double %5, %5
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.846.7.clone.1 = fmul double %multiply.845.5.clone.1, %7
  %8 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !121
  %multiply.847.7.clone.1 = fmul double %multiply.846.7.clone.1, %8
  %add.337.5.clone.1 = fadd double %3, %multiply.847.7.clone.1
  %compare.262.1.clone.1 = fcmp ogt double %add.337.5.clone.1, 1.000000e-128
  %9 = zext i1 %compare.262.1.clone.1 to i8
  %10 = select i1 %compare.262.1.clone.1, double %add.337.5.clone.1, double 0x7FF8000000000000
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %10, ptr addrspace(1) %11, align 8
  %12 = getelementptr i8, ptr addrspace(1) %arg511, i64 %1
  store i8 %9, ptr addrspace(1) %12, align 1
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %multiply.845.5.clone.1, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.355 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !121
  %0 = icmp slt i64 %param_2.355, 0
  %1 = add i64 %param_2.355, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.355
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.484 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !121
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  store double %param_1.484, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_30(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(48) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.595 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.595, 0
  %2 = add i64 %param_2.595, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.595
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7154 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !121
  %7 = getelementptr inbounds [192 x [48 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %param_1.7154, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.593 = load i64, ptr addrspace(1) %arg317, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_3.593, 0
  %2 = add i64 %param_3.593, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.593
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_2.618 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.6189 = load double, ptr addrspace(1) %param_2.618, align 8, !invariant.load !121
  %6 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.73310 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.853.5 = fmul double %param_2.6189, %param_1.73310
  %compare.265.3 = fcmp ogt double %multiply.853.5, 1.000000e-128
  %7 = zext i1 %compare.265.3 to i8
  %8 = getelementptr inbounds [192 x [48 x i8]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.630 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.630, 0
  %2 = add i64 %param_2.630, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.630
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.7405 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = icmp ne i64 %param_1.7405, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [48 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.628 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.628, 0
  %2 = add i64 %param_2.628, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.628
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.7394 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = icmp ne i64 %param_1.7394, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [48 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.634 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.634, 0
  %2 = add i64 %param_2.634, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.634
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.7445 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !121
  %.not = icmp eq i64 %param_1.7445, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [48 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.633 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.633, 0
  %2 = add i64 %param_2.633, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.633
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.7434 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !121
  %.not = icmp eq i64 %param_1.7434, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [48 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(36864) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.593 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.593, 0
  %2 = add i64 %param_2.593, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.593
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.7134 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = icmp ne i64 %param_1.7134, 0
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds [192 x [48 x i32]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i32 %8, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_35(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.544 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.544, 0
  %2 = add i64 %param_2.544, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.544
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6644 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.6644, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.614 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.614, 0
  %2 = add i64 %param_2.614, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.614
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.7314 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.883.1 = fmul double %param_1.7314, %param_1.7314
  %divide.405.1 = fdiv double 1.000000e+00, %multiply.883.1
  %7 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.405.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.690 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.690, 0
  %2 = add i64 %param_1.690, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.690
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg415, i64 %thread_id_x
  %param_4.4884 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.5605 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.851.7 = fmul double %param_4.4884, %param_3.5605
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.5706 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %divide.393.3 = fdiv double %multiply.851.7, %param_2.5706
  %9 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.393.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #2 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_5.384 = load i64, ptr addrspace(1) %arg523, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_5.384, 0
  %2 = add i64 %param_5.384, 192
  %3 = select i1 %1, i64 %2, i64 %param_5.384
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.7294 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %param_4.513 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg421, i64 0, i64 %5
  %param_4.51310 = load double, ptr addrspace(1) %param_4.513, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.59011 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.853.15 = fmul double %param_4.51310, %param_3.59011
  %compare.265.15 = fcmp ogt double %multiply.853.15, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.61212 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %9 = select i1 %compare.265.15, double %multiply.853.15, double %param_2.61212
  %add.343.7 = fadd double %param_1.7294, %9
  %multiply.881.1 = fmul double %add.343.7, %add.343.7
  %divide.403.1 = fdiv double 1.000000e+00, %multiply.881.1
  %10 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.403.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_40(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.615 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.615, 0
  %2 = add i64 %param_2.615, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.615
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7094 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %subtract.76.3 = fsub double 1.000000e+00, %param_1.7094
  %7 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.76.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg5) local_unnamed_addr #2 {
entry:
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.562 = load i64, ptr addrspace(1) %arg219, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.562, 0
  %2 = add i64 %param_2.562, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.562
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_5.364 = getelementptr inbounds [192 x [48 x [1 x double]]], ptr addrspace(1) %arg525, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_5.36411 = load double, ptr addrspace(1) %param_5.364, align 8, !invariant.load !121
  %6 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.48412 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %subtract.77.13 = fsub double %param_5.36411, %param_4.48412
  %param_1.682 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg117, i64 0, i64 %5
  %param_1.68213 = load i32, ptr addrspace(1) %param_1.682, align 4, !invariant.load !121
  %7 = sitofp i32 %param_1.68213 to double
  %multiply.854.11 = fmul double %subtract.77.13, %7
  %8 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.55314 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %divide.394.7 = fdiv double %multiply.854.11, %param_3.55314
  %multiply.855.3 = fmul double %divide.394.7, %7
  %9 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg015, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.855.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_37(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.497 = load i64, ptr addrspace(1) %arg422, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_4.497, 0
  %2 = add i64 %param_4.497, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.497
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_3.572 = getelementptr inbounds [192 x [48 x [1 x double]]], ptr addrspace(1) %arg320, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_3.57211 = load double, ptr addrspace(1) %param_3.572, align 8, !invariant.load !121
  %6 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.59612 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %subtract.77.5 = fsub double %param_3.57211, %param_2.59612
  %param_1.716 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg116, i64 0, i64 %5
  %param_1.71613 = load i32, ptr addrspace(1) %param_1.716, align 4, !invariant.load !121
  %7 = sitofp i32 %param_1.71613 to double
  %multiply.854.3 = fmul double %subtract.77.5, %7
  %8 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.854.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.547 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_3.547, 0
  %2 = add i64 %param_3.547, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.547
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.5504 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.6705 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.851.3 = fmul double %param_2.5504, %param_1.6705
  %8 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.851.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.631 = load i64, ptr addrspace(1) %arg218, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.631, 0
  %2 = add i64 %param_2.631, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.631
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg116, i64 %thread_id_x
  %param_1.7414 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.872.9 = fmul double %param_1.7414, %param_1.7414
  %multiply.873.7 = fmul double %multiply.872.9, 5.000000e-01
  %param_6.282 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg626, i64 0, i64 %5
  %param_6.28210 = load double, ptr addrspace(1) %param_6.282, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.39511 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.853.25 = fmul double %param_6.28210, %param_5.39511
  %compare.265.25 = fcmp ogt double %multiply.853.25, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.52512 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %9 = select i1 %compare.265.25, double %multiply.853.25, double %param_4.52512
  %10 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.60313 = load double, ptr addrspace(1) %10, align 8, !invariant.load !121
  %multiply.857.11 = fmul double %param_3.60313, %9
  %multiply.874.1 = fmul double %multiply.873.7, %multiply.857.11
  %11 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.874.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5) local_unnamed_addr #2 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.666 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.666, 0
  %2 = add i64 %param_1.666, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.666
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_5.390 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg523, i64 0, i64 %5
  %param_5.3909 = load double, ptr addrspace(1) %param_5.390, align 8, !invariant.load !121
  %6 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.52110 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.853.23 = fmul double %param_5.3909, %param_4.52110
  %compare.265.23 = fcmp ogt double %multiply.853.23, 1.000000e-128
  %7 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.54311 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %8 = select i1 %compare.265.23, double %multiply.853.23, double %param_3.54311
  %9 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.54612 = load double, ptr addrspace(1) %9, align 8, !invariant.load !121
  %multiply.857.9 = fmul double %param_2.54612, %8
  %10 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.857.9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.706 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.706, 0
  %2 = add i64 %param_1.706, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.706
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.5864 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %param_6.278 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg626, i64 0, i64 %5
  %param_6.27810 = load double, ptr addrspace(1) %param_6.278, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.39111 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.853.31 = fmul double %param_6.27810, %param_5.39111
  %compare.265.31 = fcmp ogt double %multiply.853.31, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.49412 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %9 = select i1 %compare.265.31, double %multiply.853.31, double %param_4.49412
  %10 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.56813 = load double, ptr addrspace(1) %10, align 8, !invariant.load !121
  %multiply.857.17 = fmul double %param_3.56813, %9
  %multiply.864.9 = fmul double %param_2.5864, %multiply.857.17
  %11 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.864.9, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.696 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.696, 0
  %2 = add i64 %param_1.696, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.696
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.5764 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %param_6.271 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg626, i64 0, i64 %5
  %param_6.27110 = load double, ptr addrspace(1) %param_6.271, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.38611 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.853.33 = fmul double %param_6.27110, %param_5.38611
  %compare.265.33 = fcmp ogt double %multiply.853.33, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.49012 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %9 = select i1 %compare.265.33, double %multiply.853.33, double %param_4.49012
  %10 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.56313 = load double, ptr addrspace(1) %10, align 8, !invariant.load !121
  %multiply.857.19 = fmul double %param_3.56313, %9
  %multiply.864.11 = fmul double %param_2.5764, %multiply.857.19
  %multiply.869.1 = fmul double %multiply.864.11, %multiply.864.11
  %11 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.869.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.738 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.738, 0
  %2 = add i64 %param_1.738, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.738
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.6264 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %param_6.280 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg626, i64 0, i64 %5
  %param_6.28010 = load double, ptr addrspace(1) %param_6.280, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.39311 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.853.29 = fmul double %param_6.28010, %param_5.39311
  %compare.265.29 = fcmp ogt double %multiply.853.29, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.52312 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %9 = select i1 %compare.265.29, double %multiply.853.29, double %param_4.52312
  %10 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.60113 = load double, ptr addrspace(1) %10, align 8, !invariant.load !121
  %multiply.857.15 = fmul double %param_3.60113, %9
  %multiply.864.7 = fmul double %param_2.6264, %multiply.857.15
  %multiply.887.3 = fmul double %multiply.864.7, 2.000000e+00
  %11 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.887.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_43(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.516 = load i64, ptr addrspace(1) %arg420, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_4.516, 0
  %2 = add i64 %param_4.516, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.516
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_3.594 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg318, i64 0, i64 %5
  %param_3.5949 = load double, ptr addrspace(1) %param_3.594, align 8, !invariant.load !121
  %6 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.61910 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.853.3 = fmul double %param_3.5949, %param_2.61910
  %compare.265.5 = fcmp ogt double %multiply.853.3, 1.000000e-128
  %7 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.70111 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %8 = select i1 %compare.265.5, double %multiply.853.3, double %param_1.70111
  %9 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store double %8, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_4(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.632 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.632, 0
  %2 = add i64 %param_2.632, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.632
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7424 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.872.5 = fmul double %param_1.7424, %param_1.7424
  %multiply.873.3 = fmul double %multiply.872.5, 5.000000e-01
  %7 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.873.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.624 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.624, 0
  %2 = add i64 %param_2.624, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.624
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6924 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.888.3 = fmul double %param_1.6924, 2.000000e+00
  %7 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.888.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_58(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.583 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.583, 0
  %2 = add i64 %param_2.583, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.583
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_1.703 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg112, i64 0, i64 %5
  %param_1.7039 = load double, ptr addrspace(1) %param_1.703, align 8, !invariant.load !121
  %6 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.7039, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.560 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.560, 0
  %2 = add i64 %param_2.560, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.560
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6804 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = sitofp i64 %param_1.6804 to double
  %8 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.582 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.582, 0
  %2 = add i64 %param_2.582, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.582
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7024 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.7024, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_48(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.571 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.571, 0
  %2 = add i64 %param_2.571, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.571
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6914 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.6914, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_exponential_select_fusion(ptr noalias nocapture align 128 dereferenceable(384) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg9, ptr noalias nocapture align 128 dereferenceable(384) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg11, ptr noalias nocapture align 128 dereferenceable(384) %arg12, ptr noalias nocapture align 128 dereferenceable(384) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg15, ptr noalias nocapture align 128 dereferenceable(384) %arg16, ptr noalias nocapture align 128 dereferenceable(384) %arg17, ptr noalias nocapture align 128 dereferenceable(384) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg21, ptr noalias nocapture align 128 dereferenceable(384) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg23, ptr noalias nocapture align 128 dereferenceable(384) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg25, ptr noalias nocapture align 128 dereferenceable(384) %arg26, ptr noalias nocapture align 128 dereferenceable(384) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg28, ptr noalias nocapture align 128 dereferenceable(384) %arg29, ptr noalias nocapture align 128 dereferenceable(384) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg31, ptr noalias nocapture align 128 dereferenceable(192) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg33, ptr noalias nocapture align 128 dereferenceable(384) %arg34, ptr noalias nocapture align 128 dereferenceable(384) %arg35, ptr noalias nocapture align 128 dereferenceable(384) %arg36, ptr noalias nocapture align 128 dereferenceable(384) %arg37, ptr noalias nocapture align 128 dereferenceable(384) %arg38, ptr noalias nocapture align 128 dereferenceable(384) %arg39, ptr noalias nocapture align 128 dereferenceable(384) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg45, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg46) local_unnamed_addr #2 {
entry:
  %arg46100 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg4598 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg4496 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg4394 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg4292 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg4190 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg4088 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg3986 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg3884 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg3782 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg3680 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3578 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg3476 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3374 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg3272 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg3170 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3068 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2966 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2864 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2762 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2660 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2558 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2456 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2354 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2252 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2150 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1946 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1742 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1538 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1436 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1334 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1232 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1130 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg926 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg722 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg2048, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !121
  %4 = getelementptr double, ptr addrspace(1) %arg2150, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !121
  %6 = load i64, ptr addrspace(1) %arg518, align 128, !invariant.load !121
  %7 = icmp slt i64 %6, 0
  %8 = add i64 %6, 192
  %9 = select i1 %7, i64 %8, i64 %6
  %10 = trunc i64 %9 to i32
  %11 = tail call i32 @llvm.smax.i32(i32 %10, i32 0)
  %12 = tail call i32 @llvm.umin.i32(i32 %11, i32 191)
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg314, i64 0, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !121
  %16 = getelementptr double, ptr addrspace(1) %arg1946, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !121
  %18 = getelementptr double, ptr addrspace(1) %arg4190, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !121
  %20 = getelementptr double, ptr addrspace(1) %arg2864, i64 %1
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !121
  %22 = getelementptr double, ptr addrspace(1) %arg2252, i64 %1
  %23 = load double, ptr addrspace(1) %22, align 8
  %24 = getelementptr inbounds [192 x [48 x [1 x double]]], ptr addrspace(1) %arg3170, i64 0, i64 %13, i64 %1, i64 0
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !121
  %26 = getelementptr double, ptr addrspace(1) %arg2558, i64 %1
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !121
  %28 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg3374, i64 0, i64 %13
  %29 = load i32, ptr addrspace(1) %28, align 4, !invariant.load !121
  %30 = getelementptr double, ptr addrspace(1) %arg416, i64 %1
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !121
  %32 = getelementptr double, ptr addrspace(1) %arg04, i64 %1
  %33 = load double, ptr addrspace(1) %32, align 8
  %34 = getelementptr double, ptr addrspace(1) %arg212, i64 %1
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !121
  %36 = getelementptr double, ptr addrspace(1) %arg620, i64 %1
  %37 = load double, ptr addrspace(1) %36, align 8, !invariant.load !121
  %38 = getelementptr double, ptr addrspace(1) %arg926, i64 %1
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !121
  %40 = getelementptr double, ptr addrspace(1) %arg824, i64 %1
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !121
  %42 = getelementptr double, ptr addrspace(1) %arg722, i64 %1
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !121
  %44 = getelementptr double, ptr addrspace(1) %arg2354, i64 %1
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !121
  %46 = getelementptr double, ptr addrspace(1) %arg1028, i64 %1
  %47 = load double, ptr addrspace(1) %46, align 8
  %48 = getelementptr double, ptr addrspace(1) %arg1538, i64 %1
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !121
  %50 = tail call double @llvm.fma.f64(double %49, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %51 = tail call i32 @llvm.nvvm.d2i.lo(double %50) #5
  %52 = tail call double @llvm.nvvm.add.rn.d(double %50, double 0xC338000000000000) #5
  %53 = tail call double @llvm.fma.f64(double %52, double 0xBFE62E42FEFA39EF, double %49)
  %54 = tail call double @llvm.fma.f64(double %52, double 0xBC7ABC9E3B39803F, double %53)
  %55 = tail call double @llvm.fma.f64(double %54, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %56 = tail call double @llvm.fma.f64(double %55, double %54, double 0x3EC71DEE62401315)
  %57 = tail call double @llvm.fma.f64(double %56, double %54, double 0x3EFA01997C89EB71)
  %58 = tail call double @llvm.fma.f64(double %57, double %54, double 0x3F2A01A014761F65)
  %59 = tail call double @llvm.fma.f64(double %58, double %54, double 0x3F56C16C1852B7AF)
  %60 = tail call double @llvm.fma.f64(double %59, double %54, double 0x3F81111111122322)
  %61 = tail call double @llvm.fma.f64(double %60, double %54, double 0x3FA55555555502A1)
  %62 = tail call double @llvm.fma.f64(double %61, double %54, double 0x3FC5555555555511)
  %63 = tail call double @llvm.fma.f64(double %62, double %54, double 0x3FE000000000000B)
  %64 = tail call double @llvm.fma.f64(double %63, double %54, double 1.000000e+00)
  %65 = tail call double @llvm.fma.f64(double %64, double %54, double 1.000000e+00)
  %66 = tail call i32 @llvm.nvvm.d2i.lo(double %65) #5
  %67 = tail call i32 @llvm.nvvm.d2i.hi(double %65) #5
  %68 = shl i32 %51, 20
  %69 = add i32 %67, %68
  %70 = tail call double @llvm.nvvm.lohi.i2d(i32 %66, i32 %69) #5
  %71 = tail call i32 @llvm.nvvm.d2i.hi(double %49) #5
  %72 = bitcast i32 %71 to float
  %73 = tail call float @llvm.nvvm.fabs.f(float %72) #5
  %74 = fcmp olt float %73, 0x4010C46560000000
  br i1 %74, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %75 = fcmp olt double %49, 0.000000e+00
  %76 = fadd double %49, 0x7FF0000000000000
  %z.0.i = select i1 %75, double 0.000000e+00, double %76
  %77 = fcmp olt float %73, 0x4010E90000000000
  br i1 %77, label %78, label %__nv_exp.exit

78:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %79 = sdiv i32 %51, 2
  %80 = shl i32 %79, 20
  %81 = add i32 %67, %80
  %82 = tail call double @llvm.nvvm.lohi.i2d(i32 %66, i32 %81) #5
  %83 = sub nsw i32 %51, %79
  %84 = shl i32 %83, 20
  %85 = add nsw i32 %84, 1072693248
  %86 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %85) #5
  %87 = fmul double %86, %82
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %78
  %z.2.i = phi double [ %70, %entry ], [ %87, %78 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.396.1.clone.1 = fdiv double 1.000000e+00, %47
  %multiply.853.27 = fmul double %15, %39
  %compare.265.27 = fcmp ogt double %multiply.853.27, 1.000000e-128
  %88 = select i1 %compare.265.27, double %multiply.853.27, double %41
  %multiply.857.13 = fmul double %43, %88
  %multiply.864.5 = fmul double %37, %multiply.857.13
  %add.343.3.clone.1 = fadd double %45, %88
  %multiply.858.1.clone.1 = fmul double %23, %add.343.3.clone.1
  %divide.395.5.clone.1 = fdiv double 1.000000e+00, %multiply.858.1.clone.1
  %multiply.848.3.clone.1 = fmul double %3, %5
  %multiply.849.5.clone.1 = fmul double %15, %17
  %add.340.3.clone.1 = fadd double %multiply.848.3.clone.1, %multiply.849.5.clone.1
  %multiply.851.9.clone.1 = fmul double %19, %21
  %divide.393.5.clone.1 = fdiv double %multiply.851.9.clone.1, %23
  %subtract.77.11.clone.1 = fsub double %25, %27
  %89 = sitofp i32 %29 to double
  %multiply.854.9.clone.1 = fmul double %subtract.77.11.clone.1, %89
  %divide.394.5.clone.1 = fdiv double %multiply.854.9.clone.1, %21
  %multiply.855.5.clone.1 = fmul double %divide.394.5.clone.1, %89
  %multiply.856.1.clone.1 = fmul double %divide.393.5.clone.1, %multiply.855.5.clone.1
  %add.344.1.clone.1 = fadd double %add.340.3.clone.1, %multiply.856.1.clone.1
  %subtract.78.1.clone.1 = fsub double %add.344.1.clone.1, %add.340.3.clone.1
  %multiply.859.2.clone.1 = fmul double %subtract.78.1.clone.1, %subtract.78.1.clone.1
  %multiply.860.1.clone.1 = fmul double %43, %multiply.859.2.clone.1
  %add.345.3.clone.1 = fadd double %multiply.860.1.clone.1, %divide.395.5.clone.1
  %add.346.1.clone.1 = fadd double %add.345.3.clone.1, -1.000000e+00
  %multiply.865.2 = fmul double %multiply.864.5, %add.346.1.clone.1
  %multiply.861.3 = fmul double %31, %33
  %multiply.862.5 = fmul double %15, %35
  %add.347.3 = fadd double %multiply.861.3, %multiply.862.5
  %90 = tail call double @llvm.fabs.f64(double %add.344.1.clone.1)
  %91 = call i1 @llvm.is.fpclass.f64(double %add.344.1.clone.1, i32 504)
  %compare.266.39 = fcmp olt double %90, 1.400000e+01
  %92 = and i1 %91, %compare.266.39
  %multiply.863.11.clone.1 = fmul double %15, %z.2.i
  %compare.267.13.clone.1 = fcmp ogt double %multiply.863.11.clone.1, 1.000000e-128
  %93 = getelementptr double, ptr addrspace(1) %arg1436, i64 %1
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !121
  %95 = select i1 %compare.267.13.clone.1, double %multiply.863.11.clone.1, double %94
  %add.348.5.clone.1 = fadd double %divide.396.1.clone.1, %95
  %divide.397.1.clone.1 = fdiv double 1.000000e+00, %add.348.5.clone.1
  %multiply.866.9 = fmul double %divide.397.1.clone.1, 2.000000e+00
  %divide.398.5 = fdiv double 1.000000e+00, %multiply.866.9
  %multiply.867.1 = fmul double %multiply.865.2, %divide.398.5
  %96 = getelementptr i64, ptr addrspace(1) %arg110, i64 %1
  %97 = load i64, ptr addrspace(1) %96, align 8, !invariant.load !121
  %98 = sitofp i64 %97 to double
  %multiply.868.3 = fmul double %multiply.867.1, %98
  %add.349.1 = fadd double %add.347.3, %multiply.868.3
  %99 = select i1 %92, double %add.349.1, double %33
  %.not = icmp eq i64 %97, 0
  %add.350.2.clone.1 = fadd double %divide.396.1.clone.1, %multiply.863.11.clone.1
  %divide.399.3.clone.1 = fdiv double 1.000000e+00, %add.350.2.clone.1
  %multiply.869.4.clone.1 = fmul double %multiply.864.5, %multiply.864.5
  %multiply.870.9.clone.1 = fmul double %multiply.869.4.clone.1, 5.000000e-01
  %multiply.871.3.clone.1 = fmul double %multiply.869.4.clone.1, %add.346.1.clone.1
  %add.351.7.clone.1 = fadd double %multiply.870.9.clone.1, %multiply.871.3.clone.1
  %multiply.872.11.clone.1 = fmul double %37, %37
  %multiply.873.9.clone.1 = fmul double %multiply.872.11.clone.1, 5.000000e-01
  %multiply.874.4.clone.1 = fmul double %multiply.873.9.clone.1, %multiply.857.13
  %multiply.875.3.clone.1 = fmul double %multiply.874.4.clone.1, %add.346.1.clone.1
  %subtract.79.5.clone.1 = fsub double %add.351.7.clone.1, %multiply.875.3.clone.1
  %multiply.876.5.clone.1 = fmul double %subtract.79.5.clone.1, %98
  %add.352.3.clone.1 = fadd double %multiply.876.5.clone.1, %divide.397.1.clone.1
  %compare.270.5.clone.1 = fcmp ogt double %add.352.3.clone.1, 1.000000e-128
  %100 = getelementptr double, ptr addrspace(1) %arg1130, i64 %1
  %101 = load double, ptr addrspace(1) %100, align 8, !invariant.load !121
  %102 = select i1 %compare.270.5.clone.1, double %add.352.3.clone.1, double %101
  %103 = select i1 %.not, double %divide.399.3.clone.1, double %102
  %104 = select i1 %92, double %103, double %47
  %105 = getelementptr double, ptr addrspace(1) %arg1232, i64 %1
  %106 = load double, ptr addrspace(1) %105, align 8
  %107 = select i1 %92, double %divide.397.1.clone.1, double %106
  %multiply.877.1.clone.1 = fmul double %95, %divide.397.1.clone.1
  %108 = getelementptr double, ptr addrspace(1) %arg1334, i64 %1
  %109 = load double, ptr addrspace(1) %108, align 8
  %110 = select i1 %92, double %multiply.877.1.clone.1, double %109
  %111 = getelementptr double, ptr addrspace(1) %arg1640, i64 %1
  %112 = load double, ptr addrspace(1) %111, align 8
  %113 = select i1 %92, double %divide.396.1.clone.1, double %112
  %114 = getelementptr double, ptr addrspace(1) %arg1742, i64 %1
  %115 = load double, ptr addrspace(1) %114, align 8
  %116 = select i1 %92, double %add.347.3, double %115
  %117 = getelementptr double, ptr addrspace(1) %arg1844, i64 %1
  %118 = load double, ptr addrspace(1) %117, align 8
  %119 = select i1 %92, double %add.346.1.clone.1, double %118
  %120 = select i1 %92, double %add.344.1.clone.1, double %5
  %121 = getelementptr double, ptr addrspace(1) %arg2456, i64 %1
  %122 = load double, ptr addrspace(1) %121, align 8
  %123 = select i1 %92, double %subtract.78.1.clone.1, double %122
  %124 = getelementptr double, ptr addrspace(1) %arg2660, i64 %1
  %125 = load double, ptr addrspace(1) %124, align 8
  %126 = select i1 %92, double %27, double %125
  %127 = getelementptr double, ptr addrspace(1) %arg2762, i64 %1
  %128 = load double, ptr addrspace(1) %127, align 8
  %129 = select i1 %92, double %15, double %128
  %130 = getelementptr double, ptr addrspace(1) %arg2966, i64 %1
  %131 = load double, ptr addrspace(1) %130, align 8
  %132 = select i1 %92, double %21, double %131
  %133 = getelementptr double, ptr addrspace(1) %arg3068, i64 %1
  %134 = load double, ptr addrspace(1) %133, align 8
  %135 = select i1 %92, double %25, double %134
  %136 = getelementptr i32, ptr addrspace(1) %arg3272, i64 %1
  %137 = load i32, ptr addrspace(1) %136, align 4
  %138 = select i1 %92, i32 %29, i32 %137
  %139 = getelementptr double, ptr addrspace(1) %arg3476, i64 %1
  %140 = load double, ptr addrspace(1) %139, align 8
  %141 = select i1 %92, double %21, double %140
  %142 = getelementptr double, ptr addrspace(1) %arg3578, i64 %1
  %143 = load double, ptr addrspace(1) %142, align 8
  %144 = select i1 %92, double %divide.394.5.clone.1, double %143
  %145 = getelementptr double, ptr addrspace(1) %arg3680, i64 %1
  %146 = load double, ptr addrspace(1) %145, align 8
  %147 = select i1 %92, double %add.340.3.clone.1, double %146
  %148 = getelementptr double, ptr addrspace(1) %arg3782, i64 %1
  %149 = load double, ptr addrspace(1) %148, align 8
  %150 = select i1 %92, double %43, double %149
  %151 = getelementptr double, ptr addrspace(1) %arg3884, i64 %1
  %152 = load double, ptr addrspace(1) %151, align 8
  %153 = select i1 %92, double %23, double %152
  %154 = getelementptr double, ptr addrspace(1) %arg3986, i64 %1
  %155 = load double, ptr addrspace(1) %154, align 8
  %156 = select i1 %92, double %45, double %155
  %157 = getelementptr double, ptr addrspace(1) %arg4088, i64 %1
  %158 = load double, ptr addrspace(1) %157, align 8
  %159 = select i1 %92, double %multiply.857.13, double %158
  store double %99, ptr addrspace(1) %32, align 8
  store double %104, ptr addrspace(1) %46, align 8
  store double %107, ptr addrspace(1) %105, align 8
  store double %110, ptr addrspace(1) %108, align 8
  %160 = getelementptr double, ptr addrspace(1) %arg4292, i64 %1
  store double %divide.397.1.clone.1, ptr addrspace(1) %160, align 8
  %161 = getelementptr double, ptr addrspace(1) %arg4394, i64 %1
  store double %z.2.i, ptr addrspace(1) %161, align 8
  store double %113, ptr addrspace(1) %111, align 8
  %162 = getelementptr double, ptr addrspace(1) %arg4496, i64 %1
  store double %divide.396.1.clone.1, ptr addrspace(1) %162, align 8
  store double %116, ptr addrspace(1) %114, align 8
  store double %119, ptr addrspace(1) %117, align 8
  store double %add.346.1.clone.1, ptr addrspace(1) %22, align 8
  %163 = getelementptr double, ptr addrspace(1) %arg4598, i64 %1
  store double %120, ptr addrspace(1) %163, align 8
  store double %123, ptr addrspace(1) %121, align 8
  store double %126, ptr addrspace(1) %124, align 8
  store double %129, ptr addrspace(1) %127, align 8
  store double %132, ptr addrspace(1) %130, align 8
  store double %135, ptr addrspace(1) %133, align 8
  store i32 %138, ptr addrspace(1) %136, align 4
  store double %141, ptr addrspace(1) %139, align 8
  store double %144, ptr addrspace(1) %142, align 8
  store double %147, ptr addrspace(1) %145, align 8
  store double %150, ptr addrspace(1) %148, align 8
  store double %153, ptr addrspace(1) %151, align 8
  store double %156, ptr addrspace(1) %154, align 8
  store double %159, ptr addrspace(1) %157, align 8
  %164 = getelementptr double, ptr addrspace(1) %arg46100, i64 %1
  store double %add.344.1.clone.1, ptr addrspace(1) %164, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg9) local_unnamed_addr #2 {
entry:
  %arg937 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg835 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg733 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg631 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg529 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.732 = load i64, ptr addrspace(1) %arg121, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.732, 0
  %2 = add i64 %param_1.732, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.732
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg223, i64 %thread_id_x
  %param_2.6174 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg529, i64 %thread_id_x
  %param_5.3965 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %param_9.105 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg937, i64 0, i64 %5
  %param_9.10511 = load double, ptr addrspace(1) %param_9.105, align 8, !invariant.load !121
  %8 = getelementptr double, ptr addrspace(1) %arg835, i64 %thread_id_x
  %param_8.14512 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %multiply.853.21 = fmul double %param_9.10511, %param_8.14512
  %compare.265.21 = fcmp ogt double %multiply.853.21, 1.000000e-128
  %9 = getelementptr double, ptr addrspace(1) %arg733, i64 %thread_id_x
  %param_7.21213 = load double, ptr addrspace(1) %9, align 8, !invariant.load !121
  %10 = select i1 %compare.265.21, double %multiply.853.21, double %param_7.21213
  %11 = getelementptr double, ptr addrspace(1) %arg631, i64 %thread_id_x
  %param_6.28314 = load double, ptr addrspace(1) %11, align 8, !invariant.load !121
  %multiply.857.7 = fmul double %param_6.28314, %10
  %multiply.864.17 = fmul double %param_5.3965, %multiply.857.7
  %multiply.869.6 = fmul double %multiply.864.17, %multiply.864.17
  %multiply.870.11 = fmul double %multiply.869.6, 5.000000e-01
  %12 = getelementptr double, ptr addrspace(1) %arg427, i64 %thread_id_x
  %param_4.51515 = load double, ptr addrspace(1) %12, align 8, !invariant.load !121
  %multiply.871.5 = fmul double %param_4.51515, %multiply.869.6
  %add.351.9 = fadd double %multiply.870.11, %multiply.871.5
  %multiply.872.13 = fmul double %param_5.3965, %param_5.3965
  %multiply.873.11 = fmul double %multiply.872.13, 5.000000e-01
  %multiply.874.6 = fmul double %multiply.873.11, %multiply.857.7
  %multiply.875.5 = fmul double %param_4.51515, %multiply.874.6
  %subtract.79.7 = fsub double %add.351.9, %multiply.875.5
  %13 = getelementptr i64, ptr addrspace(1) %arg325, i64 %thread_id_x
  %param_3.59218 = load i64, ptr addrspace(1) %13, align 8, !invariant.load !121
  %14 = sitofp i64 %param_3.59218 to double
  %multiply.876.7 = fmul double %subtract.79.7, %14
  %add.352.5 = fadd double %param_2.6174, %multiply.876.7
  %compare.270.3 = fcmp ogt double %add.352.5, 1.000000e-128
  %15 = zext i1 %compare.270.3 to i8
  %16 = getelementptr inbounds [192 x [48 x i8]], ptr addrspace(1) %arg019, i64 0, i64 %5, i64 %thread_id_x
  store i8 %15, ptr addrspace(1) %16, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.667 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.667, 0
  %2 = add i64 %param_1.667, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.667
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.6495 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = tail call double @llvm.fabs.f64(double %param_2.6495)
  %8 = call i1 @llvm.is.fpclass.f64(double %param_2.6495, i32 504)
  %compare.266.47 = fcmp olt double %7, 1.400000e+01
  %9 = and i1 %8, %compare.266.47
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [48 x [1 x i8]]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.672 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.672, 0
  %2 = add i64 %param_1.672, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.672
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.6354 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = tail call double @llvm.fabs.f64(double %param_2.6354)
  %8 = call i1 @llvm.is.fpclass.f64(double %param_2.6354, i32 504)
  %compare.266.49 = fcmp olt double %7, 1.400000e+01
  %9 = and i1 %8, %compare.266.49
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [48 x i8]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_53(ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg3) local_unnamed_addr #2 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.734 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.734, 0
  %2 = add i64 %param_1.734, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.734
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_3.595 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg317, i64 0, i64 %5
  %param_3.5959 = load double, ptr addrspace(1) %param_3.595, align 8, !invariant.load !121
  %6 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.62010 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.863.5 = fmul double %param_3.5959, %param_2.62010
  %compare.267.3 = fcmp ogt double %multiply.863.5, 1.000000e-128
  %7 = zext i1 %compare.267.3 to i8
  %8 = getelementptr inbounds [192 x [48 x i8]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg7) local_unnamed_addr #2 {
entry:
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.543 = load i64, ptr addrspace(1) %arg219, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.543, 0
  %2 = add i64 %param_2.543, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.543
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.5414 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %param_7.207 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg729, i64 0, i64 %5
  %param_7.20710 = load double, ptr addrspace(1) %param_7.207, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg627, i64 %thread_id_x
  %param_6.27411 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.853.17 = fmul double %param_7.20710, %param_6.27411
  %compare.265.17 = fcmp ogt double %multiply.853.17, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg525, i64 %thread_id_x
  %param_5.36012 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %9 = select i1 %compare.265.17, double %multiply.853.17, double %param_5.36012
  %10 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.47813 = load double, ptr addrspace(1) %10, align 8, !invariant.load !121
  %multiply.857.3 = fmul double %param_4.47813, %9
  %multiply.864.13 = fmul double %param_3.5414, %multiply.857.3
  %11 = getelementptr double, ptr addrspace(1) %arg117, i64 %thread_id_x
  %param_1.66314 = load double, ptr addrspace(1) %11, align 8, !invariant.load !121
  %multiply.865.1 = fmul double %param_1.66314, %multiply.864.13
  %12 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg015, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.865.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5) local_unnamed_addr #2 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.598 = load i64, ptr addrspace(1) %arg319, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_3.598, 0
  %2 = add i64 %param_3.598, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.598
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.7274 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %param_5.388 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg523, i64 0, i64 %5
  %param_5.38810 = load double, ptr addrspace(1) %param_5.388, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.51911 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.863.15 = fmul double %param_5.38810, %param_4.51911
  %compare.267.11 = fcmp ogt double %multiply.863.15, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.61012 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %9 = select i1 %compare.267.11, double %multiply.863.15, double %param_2.61012
  %add.348.3 = fadd double %param_1.7274, %9
  %multiply.879.1 = fmul double %add.348.3, %add.348.3
  %divide.401.1 = fdiv double 1.000000e+00, %multiply.879.1
  %10 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.401.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.602 = load i64, ptr addrspace(1) %arg216, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.602, 0
  %2 = add i64 %param_2.602, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.602
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.7204 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %param_4.504 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg420, i64 0, i64 %5
  %param_4.50410 = load double, ptr addrspace(1) %param_4.504, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.58011 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %multiply.863.13 = fmul double %param_4.50410, %param_3.58011
  %add.350.1 = fadd double %param_1.7204, %multiply.863.13
  %multiply.886.1 = fmul double %add.350.1, %add.350.1
  %divide.407.1 = fdiv double 1.000000e+00, %multiply.886.1
  %8 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.407.1, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.627 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.627, 0
  %2 = add i64 %param_2.627, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.627
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7224 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.866.3 = fmul double %param_1.7224, 2.000000e+00
  %multiply.885.1 = fmul double %multiply.866.3, %multiply.866.3
  %divide.406.1 = fdiv double 1.000000e+00, %multiply.885.1
  %7 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.406.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.668 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_1.668, 0
  %2 = add i64 %param_1.668, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.668
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.5484 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.866.7 = fmul double %param_2.5484, 2.000000e+00
  %divide.398.3 = fdiv double 1.000000e+00, %multiply.866.7
  %7 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.398.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.625 = load i64, ptr addrspace(1) %arg218, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.625, 0
  %2 = add i64 %param_2.625, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.625
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg116, i64 %thread_id_x
  %param_1.7374 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.3925 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %8 = getelementptr double, ptr addrspace(1) %arg626, i64 %thread_id_x
  %param_6.2796 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %multiply.848.15 = fmul double %param_5.3925, %param_6.2796
  %param_4.522 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg422, i64 0, i64 %5
  %param_4.52212 = load double, ptr addrspace(1) %param_4.522, align 8, !invariant.load !121
  %9 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.60013 = load double, ptr addrspace(1) %9, align 8, !invariant.load !121
  %multiply.849.17 = fmul double %param_4.52212, %param_3.60013
  %add.340.15 = fadd double %multiply.848.15, %multiply.849.17
  %subtract.78.3 = fsub double %param_1.7374, %add.340.15
  %multiply.884.3 = fmul double %subtract.78.3, 2.000000e+00
  %10 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.884.3, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.590 = load i64, ptr addrspace(1) %arg218, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.590, 0
  %2 = add i64 %param_2.590, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.590
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg116, i64 %thread_id_x
  %param_1.7104 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.3735 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %8 = getelementptr double, ptr addrspace(1) %arg626, i64 %thread_id_x
  %param_6.2596 = load double, ptr addrspace(1) %8, align 8, !invariant.load !121
  %multiply.848.9 = fmul double %param_5.3735, %param_6.2596
  %param_4.496 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg422, i64 0, i64 %5
  %param_4.49612 = load double, ptr addrspace(1) %param_4.496, align 8, !invariant.load !121
  %9 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.57113 = load double, ptr addrspace(1) %9, align 8, !invariant.load !121
  %multiply.849.11 = fmul double %param_4.49612, %param_3.57113
  %add.340.9 = fadd double %multiply.848.9, %multiply.849.11
  %subtract.78.4 = fsub double %param_1.7104, %add.340.9
  %multiply.859.1 = fmul double %subtract.78.4, %subtract.78.4
  %10 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.859.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_51(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.621 = load i64, ptr addrspace(1) %arg216, align 128, !invariant.load !121
  %1 = icmp slt i64 %param_2.621, 0
  %2 = add i64 %param_2.621, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.621
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_4.517 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg420, i64 0, i64 %5
  %param_4.5179 = load double, ptr addrspace(1) %param_4.517, align 8, !invariant.load !121
  %6 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.59610 = load double, ptr addrspace(1) %6, align 8, !invariant.load !121
  %multiply.863.7 = fmul double %param_4.5179, %param_3.59610
  %compare.267.5 = fcmp ogt double %multiply.863.7, 1.000000e-128
  %7 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.68311 = load double, ptr addrspace(1) %7, align 8, !invariant.load !121
  %8 = select i1 %compare.267.5, double %multiply.863.7, double %param_1.68311
  %9 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store double %8, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture align 128 dereferenceable(8) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128
  %1 = add i64 %0, 1
  store i64 %1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(384) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg5) local_unnamed_addr #3 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !124
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !120
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 288
  br i1 %3, label %concatenate.pivot.48., label %copy_fusion.5.in_bounds-after

copy_fusion.5.in_bounds-after:                    ; preds = %slice1-after, %slice2-true, %entry
  ret void

concatenate.pivot.48.:                            ; preds = %entry
  %4 = icmp ult i32 %linear_index, 48
  br i1 %4, label %concatenate.pivot.0., label %concatenate.pivot.96.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.48.
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [48 x [1 x double]], ptr addrspace(1) %arg03, i64 0, i64 %5, i64 0
  br label %concatenate.3.merge

concatenate.pivot.96.:                            ; preds = %concatenate.pivot.48.
  %7 = icmp ult i32 %linear_index, 96
  br i1 %7, label %concatenate.pivot.48.1, label %concatenate.pivot.96.2

concatenate.pivot.48.1:                           ; preds = %concatenate.pivot.96.
  %8 = add nsw i32 %linear_index, -48
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [48 x [1 x double]], ptr addrspace(1) %arg15, i64 0, i64 %9, i64 0
  br label %concatenate.3.merge

concatenate.pivot.96.2:                           ; preds = %concatenate.pivot.96.
  %11 = add nsw i32 %linear_index, -96
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg27, i64 0, i64 %12
  br label %concatenate.3.merge

concatenate.3.merge:                              ; preds = %concatenate.pivot.96.2, %concatenate.pivot.48.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %6, %concatenate.pivot.0. ], [ %10, %concatenate.pivot.48.1 ], [ %13, %concatenate.pivot.96.2 ]
  %14 = icmp ult i32 %linear_index, 48
  %15 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !121
  %16 = zext nneg i32 %linear_index to i64
  %17 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg39, i64 0, i64 %16
  br i1 %14, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.3.merge
  %18 = add nsw i32 %linear_index, -48
  %19 = icmp ult i32 %18, 48
  %20 = zext nneg i32 %18 to i64
  %21 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg411, i64 0, i64 %20
  br i1 %19, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %22 = icmp ugt i32 %linear_index, 95
  %23 = add nsw i32 %linear_index, -96
  %24 = zext nneg i32 %23 to i64
  %25 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg513, i64 0, i64 %24
  br i1 %22, label %slice2-true, label %copy_fusion.5.in_bounds-after

slice0-true:                                      ; preds = %concatenate.3.merge
  store double %15, ptr addrspace(1) %17, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double %15, ptr addrspace(1) %21, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double %15, ptr addrspace(1) %25, align 8
  br label %copy_fusion.5.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.lo(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.add.rn.d(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.hi(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.lohi.i2d(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.f(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f64(double, i32 immarg) #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115}
!llvm.ident = !{!116}
!nvvmir.version = !{!117}
!llvm.module.flags = !{!118}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{ptr @copy_fusion_10, !"kernel", i32 1}
!3 = !{ptr @copy_fusion_10, !"reqntidx", i32 128}
!4 = !{ptr @input_slice_fusion_1, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion_1, !"reqntidx", i32 128}
!6 = !{ptr @input_slice_fusion_2, !"kernel", i32 1}
!7 = !{ptr @input_slice_fusion_2, !"reqntidx", i32 128}
!8 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!9 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!10 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!11 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!12 = !{ptr @loop_convert_dynamic_slice_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_convert_dynamic_slice_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_dynamic_update_slice_fusion_59, !"kernel", i32 1}
!15 = !{ptr @loop_dynamic_update_slice_fusion_59, !"reqntidx", i32 1}
!16 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!17 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 1}
!18 = !{ptr @loop_divide_exponential_multiply_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_divide_exponential_multiply_fusion, !"reqntidx", i32 48}
!20 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!21 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 48}
!22 = !{ptr @loop_divide_exponential_fusion, !"kernel", i32 1}
!23 = !{ptr @loop_divide_exponential_fusion, !"reqntidx", i32 48}
!24 = !{ptr @wrapped_convert, !"kernel", i32 1}
!25 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!26 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!27 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 48}
!28 = !{ptr @loop_compare_multiply_select_fusion, !"kernel", i32 1}
!29 = !{ptr @loop_compare_multiply_select_fusion, !"reqntidx", i32 48}
!30 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!31 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 1}
!32 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!33 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 48}
!34 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!35 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 48}
!36 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!37 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 48}
!38 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!39 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 48}
!40 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!41 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 48}
!42 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!43 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 48}
!44 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!45 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 48}
!46 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!47 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 48}
!48 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!49 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 48}
!50 = !{ptr @loop_dynamic_update_slice_fusion_24, !"kernel", i32 1}
!51 = !{ptr @loop_dynamic_update_slice_fusion_24, !"reqntidx", i32 48}
!52 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!53 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 48}
!54 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!55 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 48}
!56 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!57 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 48}
!58 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!59 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 48}
!60 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!61 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 48}
!62 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!63 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 48}
!64 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!65 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 48}
!66 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!67 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 48}
!68 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!69 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 48}
!70 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!71 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 48}
!72 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!73 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 48}
!74 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!75 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 48}
!76 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!77 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 48}
!78 = !{ptr @loop_dynamic_update_slice_fusion_58, !"kernel", i32 1}
!79 = !{ptr @loop_dynamic_update_slice_fusion_58, !"reqntidx", i32 48}
!80 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 48}
!82 = !{ptr @loop_dynamic_update_slice_fusion_20, !"kernel", i32 1}
!83 = !{ptr @loop_dynamic_update_slice_fusion_20, !"reqntidx", i32 48}
!84 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!85 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 48}
!86 = !{ptr @loop_add_divide_exponential_select_fusion, !"kernel", i32 1}
!87 = !{ptr @loop_add_divide_exponential_select_fusion, !"reqntidx", i32 48}
!88 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 48}
!90 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 48}
!92 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 48}
!94 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 48}
!96 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 48}
!98 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 48}
!100 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 48}
!102 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 48}
!104 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 48}
!106 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 48}
!108 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 48}
!110 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 48}
!112 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!113 = !{ptr @loop_add_fusion, !"reqntidx", i32 1}
!114 = !{ptr @copy_fusion_5, !"kernel", i32 1}
!115 = !{ptr @copy_fusion_5, !"reqntidx", i32 128}
!116 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!117 = !{i32 2, i32 0}
!118 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!119 = !{i32 0, i32 144}
!120 = !{i32 0, i32 128}
!121 = !{}
!122 = !{i32 0, i32 74}
!123 = !{i32 0, i32 48}
!124 = !{i32 0, i32 3}
