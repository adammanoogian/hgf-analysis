; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_63_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !183
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !184
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 6
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr inbounds [768 x i8], ptr addrspace(1) %arg03, i64 0, i64 %4
  br i1 %3, label %slice0-true, label %slice0-after

input_slice_fusion.in_bounds-after:               ; preds = %slice0-after, %slice1-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %6 = icmp ugt i32 %0, 5
  %7 = sext i32 %linear_index to i64
  %8 = getelementptr [768 x i8], ptr addrspace(1) %arg15, i64 0, i64 %7
  br i1 %6, label %slice1-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %entry
  store i8 0, ptr addrspace(1) %5, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %8, i64 -768
  store i8 0, ptr addrspace(1) %sunkaddr, align 1
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @copy_fusion_14(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !183
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !184
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 6
  %4 = add nsw i32 %linear_index, -768
  %.sink = select i1 %3, i32 %linear_index, i32 %4
  %5 = and i32 %1, 3
  %6 = lshr i32 %.sink, 2
  %7 = zext nneg i32 %6 to i64
  %8 = zext nneg i32 %5 to i64
  %9 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg05, i64 0, i64 %7, i64 %8, i64 0
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !185
  %11 = zext nneg i32 %linear_index to i64
  %12 = getelementptr inbounds [768 x i8], ptr addrspace(1) %arg17, i64 0, i64 %11
  br i1 %3, label %slice0-true, label %slice0-after

copy_fusion.14.in_bounds-after:                   ; preds = %slice0-after, %slice1-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %13 = icmp ugt i32 %0, 5
  %14 = sext i32 %linear_index to i64
  %15 = getelementptr [768 x i8], ptr addrspace(1) %arg29, i64 0, i64 %14
  br i1 %13, label %slice1-true, label %copy_fusion.14.in_bounds-after

slice0-true:                                      ; preds = %entry
  store i8 %10, ptr addrspace(1) %12, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %15, i64 -768
  store i8 %10, ptr addrspace(1) %sunkaddr, align 1
  br label %copy_fusion.14.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !186
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !184
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 960
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
  %10 = getelementptr inbounds [768 x i32], ptr addrspace(1) %arg15, i64 0, i64 %9
  br i1 %7, label %slice1-true, label %input_slice_fusion.1.in_bounds-after

slice0-true:                                      ; preds = %concatenate.1.merge
  store i32 0, ptr addrspace(1) %6, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store i32 0, ptr addrspace(1) %10, align 4
  br label %input_slice_fusion.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !187
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !184
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 19392
  br i1 %3, label %concatenate.pivot.192., label %input_slice_fusion.2.in_bounds-after

input_slice_fusion.2.in_bounds-after:             ; preds = %slice1-after, %slice2-true, %entry
  ret void

concatenate.pivot.192.:                           ; preds = %entry
  %4 = icmp ult i32 %linear_index, 192
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg05, i64 0, i64 %5
  br i1 %4, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.pivot.192.
  %7 = add nsw i32 %linear_index, -192
  %8 = icmp ult i32 %7, 768
  %9 = zext nneg i32 %7 to i64
  %10 = getelementptr inbounds [768 x double], ptr addrspace(1) %arg17, i64 0, i64 %9
  br i1 %8, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %11 = icmp ugt i32 %linear_index, 959
  %12 = add nsw i32 %linear_index, -960
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [18432 x double], ptr addrspace(1) %arg29, i64 0, i64 %13
  br i1 %11, label %slice2-true, label %input_slice_fusion.2.in_bounds-after

slice0-true:                                      ; preds = %concatenate.pivot.192.
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %10, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double 0.000000e+00, ptr addrspace(1) %14, align 8
  br label %input_slice_fusion.2.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !185
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
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !185
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  store double %9, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg15, align 128, !invariant.load !185
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg03, i64 0, i64 %7
  %9 = load i32, ptr addrspace(1) %8, align 4, !invariant.load !185
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i32
  %12 = sitofp i32 %9 to double
  store i32 %9, ptr addrspace(1) %arg27, align 128
  store i32 %11, ptr addrspace(1) %arg39, align 128
  store double %12, ptr addrspace(1) %arg411, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_multiply_select_fusion(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg15) local_unnamed_addr #2 {
entry:
  %arg1535 = addrspacecast ptr %arg15 to ptr addrspace(1)
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg617, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !185
  %4 = load i64, ptr addrspace(1) %arg515, align 128, !invariant.load !185
  %5 = icmp slt i64 %4, 0
  %6 = add i64 %4, 192
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc i64 %7 to i32
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 191)
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg413, i64 0, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !185
  %14 = getelementptr double, ptr addrspace(1) %arg17, i64 %1
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !185
  %16 = getelementptr double, ptr addrspace(1) %arg311, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !185
  %18 = getelementptr double, ptr addrspace(1) %arg29, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !185
  %multiply.3502.27.clone.1 = fmul double %17, %19
  %add.1033.25.clone.1 = fadd double %15, %multiply.3502.27.clone.1
  %20 = tail call double @llvm.fma.f64(double %add.1033.25.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #5
  %22 = tail call double @llvm.nvvm.add.rn.d(double %20, double 0xC338000000000000) #5
  %23 = tail call double @llvm.fma.f64(double %22, double 0xBFE62E42FEFA39EF, double %add.1033.25.clone.1)
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
  %41 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.25.clone.1) #5
  %42 = bitcast i32 %41 to float
  %43 = tail call float @llvm.nvvm.fabs.f(float %42) #5
  %44 = fcmp olt float %43, 0x4010C46560000000
  br i1 %44, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %45 = fcmp olt double %add.1033.25.clone.1, 0.000000e+00
  %46 = fadd double %add.1033.25.clone.1, 0x7FF0000000000000
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
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !185
  %60 = getelementptr double, ptr addrspace(1) %arg821, i64 %1
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !185
  %62 = getelementptr double, ptr addrspace(1) %arg923, i64 %1
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !185
  %multiply.3498.7.clone.1.clone.1 = fmul double %61, %63
  %64 = getelementptr double, ptr addrspace(1) %arg719, i64 %1
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !185
  %multiply.3499.9.clone.1.clone.1 = fmul double %13, %65
  %add.1031.7.clone.1.clone.1 = fadd double %multiply.3498.7.clone.1.clone.1, %multiply.3499.9.clone.1.clone.1
  %66 = fneg double %add.1031.7.clone.1.clone.1
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
  %92 = fcmp ogt double %add.1031.7.clone.1.clone.1, 0.000000e+00
  %93 = fsub double 0x7FF0000000000000, %add.1031.7.clone.1.clone.1
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
  %multiply.3508.2.clone.1 = fmul double %3, %3
  %divide.860.1.clone.1 = fdiv double 1.000000e+00, %multiply.3508.2.clone.1
  %divide.857.1.clone.1 = fdiv double 1.000000e+00, %3
  %multiply.3503.9.clone.1 = fmul double %13, %z.2.i
  %compare.375.5.clone.1 = fcmp ogt double %multiply.3503.9.clone.1, 1.000000e-128
  %105 = select i1 %compare.375.5.clone.1, double %multiply.3503.9.clone.1, double %59
  %add.1034.2 = fadd double %divide.857.1.clone.1, %105
  %divide.858.1 = fdiv double 1.000000e+00, %add.1034.2
  %add.1032.1.clone.1.clone.1 = fadd double %z.2.i3, 1.000000e+00
  %divide.856.1.clone.1.clone.1 = fdiv double 1.000000e+00, %add.1032.1.clone.1.clone.1
  %subtract.145.5.clone.1 = fsub double 1.000000e+00, %divide.856.1.clone.1.clone.1
  %multiply.3500.1.clone.1 = fmul double %divide.856.1.clone.1.clone.1, %subtract.145.5.clone.1
  %106 = getelementptr double, ptr addrspace(1) %arg1025, i64 %1
  store double %divide.858.1, ptr addrspace(1) %106, align 8
  %107 = getelementptr double, ptr addrspace(1) %arg1127, i64 %1
  store double %105, ptr addrspace(1) %107, align 8
  %108 = getelementptr double, ptr addrspace(1) %arg1229, i64 %1
  store double %divide.857.1.clone.1, ptr addrspace(1) %108, align 8
  %109 = getelementptr double, ptr addrspace(1) %arg1331, i64 %1
  store double %divide.860.1.clone.1, ptr addrspace(1) %109, align 8
  %110 = getelementptr double, ptr addrspace(1) %arg1433, i64 %1
  store double %multiply.3500.1.clone.1, ptr addrspace(1) %110, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg1535, i64 %1
  store double %divide.856.1.clone.1.clone.1, ptr addrspace(1) %111, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg4) local_unnamed_addr #2 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !189
  %1 = shl nuw nsw i32 %0, 2
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %2 to i64
  %4 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg37, i64 0, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !185
  %6 = zext nneg i32 %linear_index to i64
  %7 = getelementptr double, ptr addrspace(1) %arg25, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %multiply.3504.19 = fmul double %5, %8
  %9 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg13, i64 0, i64 %3
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %multiply.3505.5 = fmul double %multiply.3504.19, %10
  %11 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg01, i64 0, i64 %3
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !185
  %subtract.145.3 = fsub double 1.000000e+00, %12
  %multiply.3506.1 = fmul double %multiply.3505.5, %subtract.145.3
  %13 = fmul double %multiply.3505.5, %12
  %add.1035.1 = fsub double %multiply.3506.1, %13
  %14 = getelementptr double, ptr addrspace(1) %arg49, i64 %6
  store double %add.1035.1, ptr addrspace(1) %14, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg11) local_unnamed_addr #2 {
entry:
  %arg1123 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1021 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %1 = and i32 %0, 3
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !185
  %5 = zext nneg i32 %1 to i64
  %6 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg01, i64 0, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %8 = load i64, ptr addrspace(1) %arg1021, align 128, !invariant.load !185
  %9 = icmp slt i64 %8, 0
  %10 = add i64 %8, 192
  %11 = select i1 %9, i64 %10, i64 %8
  %12 = trunc i64 %11 to i32
  %13 = tail call i32 @llvm.smax.i32(i32 %12, i32 0)
  %14 = tail call i32 @llvm.umin.i32(i32 %13, i32 191)
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg919, i64 0, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !185
  %18 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg49, i64 0, i64 %5
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !185
  %20 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg613, i64 0, i64 %5, i64 0
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !185
  %22 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg511, i64 0, i64 %5
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !185
  %multiply.3502.33 = fmul double %21, %23
  %add.1033.31 = fadd double %19, %multiply.3502.33
  %24 = tail call double @llvm.fma.f64(double %add.1033.31, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %25 = tail call i32 @llvm.nvvm.d2i.lo(double %24) #5
  %26 = tail call double @llvm.nvvm.add.rn.d(double %24, double 0xC338000000000000) #5
  %27 = tail call double @llvm.fma.f64(double %26, double 0xBFE62E42FEFA39EF, double %add.1033.31)
  %28 = tail call double @llvm.fma.f64(double %26, double 0xBC7ABC9E3B39803F, double %27)
  %29 = tail call double @llvm.fma.f64(double %28, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %30 = tail call double @llvm.fma.f64(double %29, double %28, double 0x3EC71DEE62401315)
  %31 = tail call double @llvm.fma.f64(double %30, double %28, double 0x3EFA01997C89EB71)
  %32 = tail call double @llvm.fma.f64(double %31, double %28, double 0x3F2A01A014761F65)
  %33 = tail call double @llvm.fma.f64(double %32, double %28, double 0x3F56C16C1852B7AF)
  %34 = tail call double @llvm.fma.f64(double %33, double %28, double 0x3F81111111122322)
  %35 = tail call double @llvm.fma.f64(double %34, double %28, double 0x3FA55555555502A1)
  %36 = tail call double @llvm.fma.f64(double %35, double %28, double 0x3FC5555555555511)
  %37 = tail call double @llvm.fma.f64(double %36, double %28, double 0x3FE000000000000B)
  %38 = tail call double @llvm.fma.f64(double %37, double %28, double 1.000000e+00)
  %39 = tail call double @llvm.fma.f64(double %38, double %28, double 1.000000e+00)
  %40 = tail call i32 @llvm.nvvm.d2i.lo(double %39) #5
  %41 = tail call i32 @llvm.nvvm.d2i.hi(double %39) #5
  %42 = shl i32 %25, 20
  %43 = add i32 %41, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %40, i32 %43) #5
  %45 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.31) #5
  %46 = bitcast i32 %45 to float
  %47 = tail call float @llvm.nvvm.fabs.f(float %46) #5
  %48 = fcmp olt float %47, 0x4010C46560000000
  br i1 %48, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %49 = fcmp olt double %add.1033.31, 0.000000e+00
  %50 = fadd double %add.1033.31, 0x7FF0000000000000
  %z.0.i = select i1 %49, double 0.000000e+00, double %50
  %51 = fcmp olt float %47, 0x4010E90000000000
  br i1 %51, label %52, label %__nv_exp.exit

52:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %53 = sdiv i32 %25, 2
  %54 = shl i32 %53, 20
  %55 = add i32 %41, %54
  %56 = tail call double @llvm.nvvm.lohi.i2d(i32 %40, i32 %55) #5
  %57 = sub nsw i32 %25, %53
  %58 = shl i32 %57, 20
  %59 = add nsw i32 %58, 1072693248
  %60 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %59) #5
  %61 = fmul double %60, %56
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %52
  %z.2.i = phi double [ %44, %entry ], [ %61, %52 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3503.15 = fmul double %17, %z.2.i
  %compare.375.11 = fcmp ogt double %multiply.3503.15, 1.000000e-128
  %62 = getelementptr double, ptr addrspace(1) %arg715, i64 %2
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !185
  %64 = getelementptr double, ptr addrspace(1) %arg817, i64 %2
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !185
  %multiply.3510.9 = fmul double %21, %65
  %add.1036.9 = fadd double %63, %multiply.3510.9
  %multiply.3511.9 = fmul double %z.2.i, %add.1036.9
  %multiply.3512.5 = fmul double %17, %multiply.3511.9
  %66 = select i1 %compare.375.11, double %multiply.3512.5, double 0.000000e+00
  %67 = fmul double %4, %7
  %add.1037.5 = fsub double %66, %67
  %68 = fneg double %add.1037.5
  %69 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg25, i64 0, i64 %5
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !185
  %71 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg37, i64 0, i64 %5
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !185
  %add.1034.10 = fadd double %70, %72
  %multiply.3513.8 = fmul double %add.1034.10, %add.1034.10
  %divide.861.5 = fdiv double 1.000000e+00, %multiply.3513.8
  %multiply.3514.1 = fmul double %divide.861.5, %68
  %73 = getelementptr double, ptr addrspace(1) %arg1123, i64 %2
  store double %multiply.3514.1, ptr addrspace(1) %73, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_85(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5) local_unnamed_addr #2 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1480 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1480, 0
  %2 = add i64 %param_1.1480, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1480
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_5.828 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg523, i64 0, i64 %5
  %param_5.8289 = load double, ptr addrspace(1) %param_5.828, align 8, !invariant.load !185
  %6 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.134610 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.94311 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.114312 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3502.29 = fmul double %param_4.94311, %param_3.114312
  %add.1033.27 = fadd double %param_2.134610, %multiply.3502.29
  %9 = tail call double @llvm.fma.f64(double %add.1033.27, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %10 = tail call i32 @llvm.nvvm.d2i.lo(double %9) #5
  %11 = tail call double @llvm.nvvm.add.rn.d(double %9, double 0xC338000000000000) #5
  %12 = tail call double @llvm.fma.f64(double %11, double 0xBFE62E42FEFA39EF, double %add.1033.27)
  %13 = tail call double @llvm.fma.f64(double %11, double 0xBC7ABC9E3B39803F, double %12)
  %14 = tail call double @llvm.fma.f64(double %13, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %15 = tail call double @llvm.fma.f64(double %14, double %13, double 0x3EC71DEE62401315)
  %16 = tail call double @llvm.fma.f64(double %15, double %13, double 0x3EFA01997C89EB71)
  %17 = tail call double @llvm.fma.f64(double %16, double %13, double 0x3F2A01A014761F65)
  %18 = tail call double @llvm.fma.f64(double %17, double %13, double 0x3F56C16C1852B7AF)
  %19 = tail call double @llvm.fma.f64(double %18, double %13, double 0x3F81111111122322)
  %20 = tail call double @llvm.fma.f64(double %19, double %13, double 0x3FA55555555502A1)
  %21 = tail call double @llvm.fma.f64(double %20, double %13, double 0x3FC5555555555511)
  %22 = tail call double @llvm.fma.f64(double %21, double %13, double 0x3FE000000000000B)
  %23 = tail call double @llvm.fma.f64(double %22, double %13, double 1.000000e+00)
  %24 = tail call double @llvm.fma.f64(double %23, double %13, double 1.000000e+00)
  %25 = tail call i32 @llvm.nvvm.d2i.lo(double %24) #5
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %24) #5
  %27 = shl i32 %10, 20
  %28 = add i32 %26, %27
  %29 = tail call double @llvm.nvvm.lohi.i2d(i32 %25, i32 %28) #5
  %30 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.27) #5
  %31 = bitcast i32 %30 to float
  %32 = tail call float @llvm.nvvm.fabs.f(float %31) #5
  %33 = fcmp olt float %32, 0x4010C46560000000
  br i1 %33, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %34 = fcmp olt double %add.1033.27, 0.000000e+00
  %35 = fadd double %add.1033.27, 0x7FF0000000000000
  %z.0.i = select i1 %34, double 0.000000e+00, double %35
  %36 = fcmp olt float %32, 0x4010E90000000000
  br i1 %36, label %37, label %__nv_exp.exit

37:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %38 = sdiv i32 %10, 2
  %39 = shl i32 %38, 20
  %40 = add i32 %26, %39
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 %25, i32 %40) #5
  %42 = sub nsw i32 %10, %38
  %43 = shl i32 %42, 20
  %44 = add nsw i32 %43, 1072693248
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %44) #5
  %46 = fmul double %45, %41
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %37
  %z.2.i = phi double [ %29, %entry ], [ %46, %37 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3503.11 = fmul double %param_5.8289, %z.2.i
  %compare.375.7 = fcmp ogt double %multiply.3503.11, 1.000000e-128
  %47 = zext i1 %compare.375.7 to i8
  %48 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store i8 %47, ptr addrspace(1) %48, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_48(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1481 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1481, 0
  %2 = add i64 %param_1.1481, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1481
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.13715 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = icmp ne i64 %param_2.13715, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_49(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1497 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1497, 0
  %2 = add i64 %param_1.1497, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1497
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13724 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = icmp ne i64 %param_2.13724, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_51(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1373 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1373, 0
  %2 = add i64 %param_2.1373, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1373
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15655 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_1.15655, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_52(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1374 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1374, 0
  %2 = add i64 %param_2.1374, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1374
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.15664 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_1.15664, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_101(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.1360 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !185
  %0 = icmp slt i64 %param_2.1360, 0
  %1 = add i64 %param_2.1360, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.1360
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.1558 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg112, i64 0, i64 %4
  %param_1.15588 = load i32, ptr addrspace(1) %param_1.1558, align 4, !invariant.load !185
  %5 = icmp ne i32 %param_1.15588, 0
  %6 = zext i1 %5 to i32
  %7 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg010, i64 0, i64 %4
  store i32 %6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_93(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg3) local_unnamed_addr #2 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1462 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1462, 0
  %2 = add i64 %param_1.1462, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1462
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_3.1144 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg317, i64 0, i64 %5
  %param_3.11449 = load double, ptr addrspace(1) %param_3.1144, align 8, !invariant.load !185
  %6 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.134710 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = tail call double @llvm.fma.f64(double %param_2.134710, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %8 = tail call i32 @llvm.nvvm.d2i.lo(double %7) #5
  %9 = tail call double @llvm.nvvm.add.rn.d(double %7, double 0xC338000000000000) #5
  %10 = tail call double @llvm.fma.f64(double %9, double 0xBFE62E42FEFA39EF, double %param_2.134710)
  %11 = tail call double @llvm.fma.f64(double %9, double 0xBC7ABC9E3B39803F, double %10)
  %12 = tail call double @llvm.fma.f64(double %11, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %13 = tail call double @llvm.fma.f64(double %12, double %11, double 0x3EC71DEE62401315)
  %14 = tail call double @llvm.fma.f64(double %13, double %11, double 0x3EFA01997C89EB71)
  %15 = tail call double @llvm.fma.f64(double %14, double %11, double 0x3F2A01A014761F65)
  %16 = tail call double @llvm.fma.f64(double %15, double %11, double 0x3F56C16C1852B7AF)
  %17 = tail call double @llvm.fma.f64(double %16, double %11, double 0x3F81111111122322)
  %18 = tail call double @llvm.fma.f64(double %17, double %11, double 0x3FA55555555502A1)
  %19 = tail call double @llvm.fma.f64(double %18, double %11, double 0x3FC5555555555511)
  %20 = tail call double @llvm.fma.f64(double %19, double %11, double 0x3FE000000000000B)
  %21 = tail call double @llvm.fma.f64(double %20, double %11, double 1.000000e+00)
  %22 = tail call double @llvm.fma.f64(double %21, double %11, double 1.000000e+00)
  %23 = tail call i32 @llvm.nvvm.d2i.lo(double %22) #5
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %22) #5
  %25 = shl i32 %8, 20
  %26 = add i32 %24, %25
  %27 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %26) #5
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.134710) #5
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.fabs.f(float %29) #5
  %31 = fcmp olt float %30, 0x4010C46560000000
  br i1 %31, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %32 = fcmp olt double %param_2.134710, 0.000000e+00
  %33 = fadd double %param_2.134710, 0x7FF0000000000000
  %z.0.i = select i1 %32, double 0.000000e+00, double %33
  %34 = fcmp olt float %30, 0x4010E90000000000
  br i1 %34, label %35, label %__nv_exp.exit

35:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %36 = sdiv i32 %8, 2
  %37 = shl i32 %36, 20
  %38 = add i32 %24, %37
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %38) #5
  %40 = sub nsw i32 %8, %36
  %41 = shl i32 %40, 20
  %42 = add nsw i32 %41, 1072693248
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %42) #5
  %44 = fmul double %43, %39
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %35
  %z.2.i = phi double [ %27, %entry ], [ %44, %35 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3524.35 = fmul double %param_3.11449, %z.2.i
  %compare.377.7 = fcmp ogt double %multiply.3524.35, 1.000000e-128
  %45 = zext i1 %compare.377.7 to i8
  %46 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store i8 %45, ptr addrspace(1) %46, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_78(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.854 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !185
  %0 = icmp slt i64 %param_2.854, 0
  %1 = add i64 %param_2.854, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.854
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.1117 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !185
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  store double %param_1.1117, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_53(ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1240 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1240, 0
  %2 = add i64 %param_2.1240, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1240
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.14494 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = icmp ne i64 %param_1.14494, 0
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i32 %8, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_exponential_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg8) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !185
  %4 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !185
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %9 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %multiply.3478.5.clone.1 = fmul double %8, %10
  %add.1023.3.clone.1 = fadd double %6, %multiply.3478.5.clone.1
  %11 = tail call double @llvm.fma.f64(double %add.1023.3.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #5
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #5
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %add.1023.3.clone.1)
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
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1023.3.clone.1) #5
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #5
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %36 = fcmp olt double %add.1023.3.clone.1, 0.000000e+00
  %37 = fadd double %add.1023.3.clone.1, 0x7FF0000000000000
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
  %divide.850.7 = fdiv double 1.000000e+00, %3
  %multiply.3479.5 = fmul double %4, %z.2.i
  %add.1024.5 = fadd double %divide.850.7, %multiply.3479.5
  %divide.851.1 = fdiv double 1.000000e+00, %add.1024.5
  %multiply.3480.2.clone.1 = fmul double %3, %3
  %divide.852.1.clone.1 = fdiv double 1.000000e+00, %multiply.3480.2.clone.1
  %multiply.3481.2.clone.1 = fmul double %add.1024.5, %add.1024.5
  %divide.853.1.clone.1 = fdiv double 1.000000e+00, %multiply.3481.2.clone.1
  %49 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %divide.851.1, ptr addrspace(1) %49, align 8
  %50 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %divide.852.1.clone.1, ptr addrspace(1) %50, align 8
  %51 = getelementptr double, ptr addrspace(1) %arg715, i64 %1
  store double %divide.853.1.clone.1, ptr addrspace(1) %51, align 8
  %52 = getelementptr double, ptr addrspace(1) %arg817, i64 %1
  store double %z.2.i, ptr addrspace(1) %52, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg12) local_unnamed_addr #2 {
entry:
  %arg1225 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1123 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1021 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %1 = and i32 %0, 3
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !185
  %5 = zext nneg i32 %1 to i64
  %6 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg25, i64 0, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %8 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !185
  %9 = getelementptr double, ptr addrspace(1) %arg613, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %11 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg817, i64 0, i64 %5, i64 0
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !185
  %13 = getelementptr double, ptr addrspace(1) %arg715, i64 %2
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !185
  %multiply.3483.1.clone.1 = fmul double %12, %14
  %add.1025.1.clone.1 = fadd double %10, %multiply.3483.1.clone.1
  %15 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg511, i64 0, i64 %5
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !185
  %multiply.3484.1.clone.1 = fmul double %16, %add.1025.1.clone.1
  %multiply.3485.5 = fmul double %8, %multiply.3484.1.clone.1
  %17 = fmul double %4, %7
  %add.1026.5 = fsub double %multiply.3485.5, %17
  %18 = fneg double %add.1026.5
  %19 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg01, i64 0, i64 %5
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !185
  %multiply.3486.1 = fmul double %20, %18
  %21 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg49, i64 0, i64 %5
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !185
  %multiply.3480.1.clone.1 = fmul double %22, %22
  %multiply.3487.1.clone.1 = fmul double %22, %multiply.3480.1.clone.1
  %divide.854.1.clone.1 = fdiv double 1.000000e+00, %multiply.3487.1.clone.1
  %multiply.3488.3.clone.1 = fmul double %divide.854.1.clone.1, -2.000000e+00
  %multiply.3489.1.clone.1 = fmul double %4, %multiply.3488.3.clone.1
  %divide.850.9.clone.1 = fdiv double 1.000000e+00, %22
  %multiply.3479.7.clone.1 = fmul double %8, %16
  %add.1024.7.clone.1 = fadd double %multiply.3479.7.clone.1, %divide.850.9.clone.1
  %multiply.3481.1.clone.1 = fmul double %add.1024.7.clone.1, %add.1024.7.clone.1
  %multiply.3490.1.clone.1 = fmul double %add.1024.7.clone.1, %multiply.3481.1.clone.1
  %divide.855.1.clone.1 = fdiv double 1.000000e+00, %multiply.3490.1.clone.1
  %multiply.3491.3.clone.1 = fmul double %divide.855.1.clone.1, -2.000000e+00
  %multiply.3492.1.clone.1 = fmul double %add.1026.5, %multiply.3491.3.clone.1
  %23 = getelementptr double, ptr addrspace(1) %arg919, i64 %2
  store double %multiply.3486.1, ptr addrspace(1) %23, align 8
  %24 = getelementptr double, ptr addrspace(1) %arg1021, i64 %2
  store double %multiply.3489.1.clone.1, ptr addrspace(1) %24, align 8
  %25 = getelementptr double, ptr addrspace(1) %arg1123, i64 %2
  store double %multiply.3492.1.clone.1, ptr addrspace(1) %25, align 8
  %26 = getelementptr double, ptr addrspace(1) %arg1225, i64 %2
  store double %multiply.3484.1.clone.1, ptr addrspace(1) %26, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_convert(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg01, align 128, !invariant.load !185
  %1 = sitofp i32 %0 to double
  store double %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !185
  %4 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !185
  %multiply.3493.6.clone.1 = fmul double %5, %5
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %multiply.3494.9.clone.1 = fmul double %multiply.3493.6.clone.1, %7
  %8 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !185
  %multiply.3495.7.clone.1 = fmul double %multiply.3494.9.clone.1, %8
  %add.1027.5.clone.1 = fadd double %3, %multiply.3495.7.clone.1
  %compare.372.1.clone.1 = fcmp ogt double %add.1027.5.clone.1, 1.000000e-128
  %9 = zext i1 %compare.372.1.clone.1 to i8
  %10 = select i1 %compare.372.1.clone.1, double %add.1027.5.clone.1, double 0x7FF8000000000000
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %10, ptr addrspace(1) %11, align 8
  %12 = getelementptr i8, ptr addrspace(1) %arg511, i64 %1
  store i8 %9, ptr addrspace(1) %12, align 1
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %multiply.3493.6.clone.1, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %1 = and i32 %0, 3
  %2 = zext nneg i32 %1 to i64
  %3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %arg01, i64 0, i64 %2
  %4 = load i8, ptr addrspace(1) %3, align 1, !invariant.load !185
  %5 = zext nneg i32 %0 to i64
  %6 = getelementptr double, ptr addrspace(1) %arg13, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %8 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg49, i64 0, i64 %2, i64 0
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3493.8 = fmul double %9, %9
  %10 = getelementptr double, ptr addrspace(1) %arg25, i64 %5
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %multiply.3496.1 = fmul double %multiply.3493.8, %11
  %12 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !185
  %multiply.3497.1 = fmul double %multiply.3496.1, %12
  %add.1028.1 = fadd double %7, %multiply.3497.1
  %13 = trunc i8 %4 to i1
  %14 = select i1 %13, double %add.1028.1, double 0.000000e+00
  %15 = getelementptr double, ptr addrspace(1) %arg511, i64 %5
  store double %14, ptr addrspace(1) %15, align 8
  %16 = getelementptr double, ptr addrspace(1) %arg613, i64 %5
  store double 0.000000e+00, ptr addrspace(1) %16, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_70(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1304 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1304, 0
  %2 = add i64 %param_2.1304, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1304
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15134 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !185
  %7 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %param_1.15134, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_75(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1295 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1295, 0
  %2 = add i64 %param_2.1295, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1295
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15044 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.15044, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_82(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1488 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1488, 0
  %2 = add i64 %param_1.1488, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1488
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.12794 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg312, i64 %thread_id_x
  %param_3.11005 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %add.1034.8 = fadd double %param_2.12794, %param_3.11005
  %multiply.3513.6 = fmul double %add.1034.8, %add.1034.8
  %divide.861.3 = fdiv double 1.000000e+00, %multiply.3513.6
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.861.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_80(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1339 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1339, 0
  %2 = add i64 %param_2.1339, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1339
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.14924 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %subtract.145.7 = fsub double 1.000000e+00, %param_1.14924
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.145.7, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_77(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1499 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1499, 0
  %2 = add i64 %param_1.1499, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1499
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_4.912 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg421, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_4.91211 = load double, ptr addrspace(1) %param_4.912, align 8, !invariant.load !185
  %6 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.110912 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %subtract.146.9 = fsub double %param_4.91211, %param_3.110912
  %param_2.1290 = load double, ptr addrspace(1) %arg217, align 128, !invariant.load !185
  %multiply.3515.7 = fmul double %subtract.146.9, %param_2.1290
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3515.7, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_67(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1519 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1519, 0
  %2 = add i64 %param_1.1519, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1519
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg312, i64 %thread_id_x
  %param_3.11174 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13105 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %multiply.3501.7 = fmul double %param_3.11174, %param_2.13105
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3501.7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_61(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1126 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_3.1126, 0
  %2 = add i64 %param_3.1126, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.1126
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.15344 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13255 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %multiply.3518.5 = fmul double %param_1.15344, %param_2.13255
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3518.5, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_43(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1116 = load i64, ptr addrspace(1) %arg313, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_3.1116, 0
  %2 = add i64 %param_3.1116, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.1116
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg415, i64 %thread_id_x
  %param_4.9834 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %multiply.3533.7 = fmul double %param_4.9834, %param_4.9834
  %multiply.3534.5 = fmul double %multiply.3533.7, 5.000000e-01
  %7 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15105 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.13016 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3518.3 = fmul double %param_1.15105, %param_2.13016
  %multiply.3535.3 = fmul double %multiply.3534.5, %multiply.3518.3
  %9 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3535.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_46(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1489 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1489, 0
  %2 = add i64 %param_1.1489, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1489
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg415, i64 %thread_id_x
  %param_4.9074 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12805 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.11016 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3518.32 = fmul double %param_2.12805, %param_3.11016
  %multiply.3525.15 = fmul double %param_4.9074, %multiply.3518.32
  %multiply.3530.1 = fmul double %multiply.3525.15, %multiply.3525.15
  %9 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3530.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_58(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1540 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1540, 0
  %2 = add i64 %param_1.1540, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1540
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg415, i64 %thread_id_x
  %param_4.9274 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.13315 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.11296 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3518.28 = fmul double %param_2.13315, %param_3.11296
  %multiply.3525.11 = fmul double %param_4.9274, %multiply.3518.28
  %9 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3525.11, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_47(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1561 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1561, 0
  %2 = add i64 %param_1.1561, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1561
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg415, i64 %thread_id_x
  %param_4.9704 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.13655 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.11716 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3518.30 = fmul double %param_2.13655, %param_3.11716
  %multiply.3525.13 = fmul double %param_4.9704, %multiply.3518.30
  %multiply.3582.3 = fmul double %multiply.3525.13, 2.000000e+00
  %9 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3582.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_86(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.900 = load i64, ptr addrspace(1) %arg415, align 128, !invariant.load !185
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14784 = load double, ptr addrspace(1) %1, align 8, !invariant.load !185
  %2 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.10925 = load double, ptr addrspace(1) %2, align 8, !invariant.load !185
  %3 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12696 = load double, ptr addrspace(1) %3, align 8, !invariant.load !185
  %multiply.3502.11 = fmul double %param_3.10925, %param_2.12696
  %add.1033.9 = fadd double %param_1.14784, %multiply.3502.11
  %4 = tail call double @llvm.fma.f64(double %add.1033.9, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #5
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #5
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.1033.9)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #5
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #5
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.9) #5
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #5
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.1033.9, 0.000000e+00
  %30 = fadd double %add.1033.9, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #5
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #5
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_4.900, 0
  %43 = add i64 %param_4.900, 192
  %44 = select i1 %42, i64 %43, i64 %param_4.900
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %47 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %46, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_44(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1503 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1503, 0
  %2 = add i64 %param_1.1503, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1503
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.13774 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %multiply.3533.9 = fmul double %param_2.13774, %param_2.13774
  %multiply.3534.7 = fmul double %multiply.3533.9, 5.000000e-01
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3534.7, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1369 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1369, 0
  %2 = add i64 %param_2.1369, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1369
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15644 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %multiply.3587.3 = fmul double %param_1.15644, 2.000000e+00
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3587.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_100(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1264 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1264, 0
  %2 = add i64 %param_2.1264, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1264
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_1.1473 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg112, i64 0, i64 %5
  %param_1.14739 = load double, ptr addrspace(1) %param_1.1473, align 8, !invariant.load !185
  %6 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.14739, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_54(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1238 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1238, 0
  %2 = add i64 %param_2.1238, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1238
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.14474 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = sitofp i64 %param_1.14474 to double
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_60(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1327 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1327, 0
  %2 = add i64 %param_2.1327, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1327
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15364 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.15364, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_88(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1265 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1265, 0
  %2 = add i64 %param_2.1265, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1265
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.14744 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.14744, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_91(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1466 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1466, 0
  %2 = add i64 %param_1.1466, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1466
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_4.895 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg420, i64 0, i64 %5
  %param_4.8959 = load double, ptr addrspace(1) %param_4.895, align 8, !invariant.load !185
  %6 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.108710 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = tail call double @llvm.fma.f64(double %param_3.108710, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %8 = tail call i32 @llvm.nvvm.d2i.lo(double %7) #5
  %9 = tail call double @llvm.nvvm.add.rn.d(double %7, double 0xC338000000000000) #5
  %10 = tail call double @llvm.fma.f64(double %9, double 0xBFE62E42FEFA39EF, double %param_3.108710)
  %11 = tail call double @llvm.fma.f64(double %9, double 0xBC7ABC9E3B39803F, double %10)
  %12 = tail call double @llvm.fma.f64(double %11, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %13 = tail call double @llvm.fma.f64(double %12, double %11, double 0x3EC71DEE62401315)
  %14 = tail call double @llvm.fma.f64(double %13, double %11, double 0x3EFA01997C89EB71)
  %15 = tail call double @llvm.fma.f64(double %14, double %11, double 0x3F2A01A014761F65)
  %16 = tail call double @llvm.fma.f64(double %15, double %11, double 0x3F56C16C1852B7AF)
  %17 = tail call double @llvm.fma.f64(double %16, double %11, double 0x3F81111111122322)
  %18 = tail call double @llvm.fma.f64(double %17, double %11, double 0x3FA55555555502A1)
  %19 = tail call double @llvm.fma.f64(double %18, double %11, double 0x3FC5555555555511)
  %20 = tail call double @llvm.fma.f64(double %19, double %11, double 0x3FE000000000000B)
  %21 = tail call double @llvm.fma.f64(double %20, double %11, double 1.000000e+00)
  %22 = tail call double @llvm.fma.f64(double %21, double %11, double 1.000000e+00)
  %23 = tail call i32 @llvm.nvvm.d2i.lo(double %22) #5
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %22) #5
  %25 = shl i32 %8, 20
  %26 = add i32 %24, %25
  %27 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %26) #5
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %param_3.108710) #5
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.fabs.f(float %29) #5
  %31 = fcmp olt float %30, 0x4010C46560000000
  br i1 %31, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %32 = fcmp olt double %param_3.108710, 0.000000e+00
  %33 = fadd double %param_3.108710, 0x7FF0000000000000
  %z.0.i = select i1 %32, double 0.000000e+00, double %33
  %34 = fcmp olt float %30, 0x4010E90000000000
  br i1 %34, label %35, label %__nv_exp.exit

35:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %36 = sdiv i32 %8, 2
  %37 = shl i32 %36, 20
  %38 = add i32 %24, %37
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %38) #5
  %40 = sub nsw i32 %8, %36
  %41 = shl i32 %40, 20
  %42 = add nsw i32 %41, 1072693248
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %42) #5
  %44 = fmul double %43, %39
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %35
  %z.2.i = phi double [ %27, %entry ], [ %44, %35 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3524.45 = fmul double %param_4.8959, %z.2.i
  %compare.377.17 = fcmp ogt double %multiply.3524.45, 1.000000e-128
  %45 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.125711 = load double, ptr addrspace(1) %45, align 8, !invariant.load !185
  %46 = select i1 %compare.377.17, double %multiply.3524.45, double %param_2.125711
  %47 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store double %46, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_94(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1251 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !185
  %1 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.14604 = load double, ptr addrspace(1) %1, align 8, !invariant.load !185
  %2 = tail call double @llvm.fma.f64(double %param_1.14604, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #5
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #5
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_1.14604)
  %6 = tail call double @llvm.fma.f64(double %4, double 0xBC7ABC9E3B39803F, double %5)
  %7 = tail call double @llvm.fma.f64(double %6, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %8 = tail call double @llvm.fma.f64(double %7, double %6, double 0x3EC71DEE62401315)
  %9 = tail call double @llvm.fma.f64(double %8, double %6, double 0x3EFA01997C89EB71)
  %10 = tail call double @llvm.fma.f64(double %9, double %6, double 0x3F2A01A014761F65)
  %11 = tail call double @llvm.fma.f64(double %10, double %6, double 0x3F56C16C1852B7AF)
  %12 = tail call double @llvm.fma.f64(double %11, double %6, double 0x3F81111111122322)
  %13 = tail call double @llvm.fma.f64(double %12, double %6, double 0x3FA55555555502A1)
  %14 = tail call double @llvm.fma.f64(double %13, double %6, double 0x3FC5555555555511)
  %15 = tail call double @llvm.fma.f64(double %14, double %6, double 0x3FE000000000000B)
  %16 = tail call double @llvm.fma.f64(double %15, double %6, double 1.000000e+00)
  %17 = tail call double @llvm.fma.f64(double %16, double %6, double 1.000000e+00)
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #5
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #5
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #5
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.14604) #5
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #5
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_1.14604, 0.000000e+00
  %28 = fadd double %param_1.14604, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #5
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #5
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_2.1251, 0
  %41 = add i64 %param_2.1251, 192
  %42 = select i1 %40, i64 %41, i64 %param_2.1251
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %45 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %44, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %45, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1319 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_2.1319, 0
  %4 = add i64 %param_2.1319, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1319
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.15285 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.15285, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1543 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_1.1543, 0
  %4 = add i64 %param_1.1543, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1543
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.13345 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %param_3.1165 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg317, i64 0, i64 %2
  %param_3.11656 = load double, ptr addrspace(1) %param_3.1165, align 8, !invariant.load !185
  %multiply.3545.4 = fmul double %param_3.11656, %param_3.11656
  %multiply.3612.3 = fmul double %param_3.11656, %multiply.3545.4
  %divide.885.3 = fdiv double 1.000000e+00, %multiply.3612.3
  %multiply.3613.5 = fmul double %divide.885.3, -2.000000e+00
  %multiply.3614.3 = fmul double %param_2.13345, %multiply.3613.5
  %9 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3614.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1446 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_1.1446, 0
  %4 = add i64 %param_1.1446, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1446
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1075 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg313, i64 0, i64 %2, i64 0
  %param_3.10755 = load double, ptr addrspace(1) %param_3.1075, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12376 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3543.3 = fmul double %param_3.10755, %param_2.12376
  %9 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3543.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_4.916 = load i64, ptr addrspace(1) %arg416, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_4.916, 0
  %4 = add i64 %param_4.916, 192
  %5 = select i1 %3, i64 %4, i64 %param_4.916
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1114 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg314, i64 0, i64 %2
  %param_3.11145 = load double, ptr addrspace(1) %param_3.1114, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12976 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %param_1.1506 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg110, i64 0, i64 %2
  %param_1.15067 = load double, ptr addrspace(1) %param_1.1506, align 8, !invariant.load !185
  %9 = fneg double %param_3.11145
  %10 = fmul double %param_2.12976, %9
  %11 = fmul double %10, %param_1.15067
  %12 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %11, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_4.909 = load i64, ptr addrspace(1) %arg416, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_4.909, 0
  %4 = add i64 %param_4.909, 192
  %5 = select i1 %3, i64 %4, i64 %param_4.909
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1104 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg314, i64 0, i64 %2
  %param_3.11045 = load double, ptr addrspace(1) %param_3.1104, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12846 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3504.23 = fmul double %param_3.11045, %param_2.12846
  %param_1.1493 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg110, i64 0, i64 %2
  %param_1.14937 = load double, ptr addrspace(1) %param_1.1493, align 8, !invariant.load !185
  %multiply.3505.9 = fmul double %multiply.3504.23, %param_1.14937
  %9 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3505.9, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #2 {
entry:
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_5.783 = load i64, ptr addrspace(1) %arg518, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_5.783, 0
  %4 = add i64 %param_5.783, 192
  %5 = select i1 %3, i64 %4, i64 %param_5.783
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_4.891 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg416, i64 0, i64 %2
  %param_4.8915 = load double, ptr addrspace(1) %param_4.891, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.10836 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %param_2.1252 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg212, i64 0, i64 %2
  %param_2.12527 = load double, ptr addrspace(1) %param_2.1252, align 8, !invariant.load !185
  %9 = fneg double %param_4.8915
  %10 = fmul double %param_3.10836, %9
  %11 = fmul double %10, %param_2.12527
  %param_1.1461 = load double, ptr addrspace(1) %arg110, align 128, !invariant.load !185
  %multiply.3539.3 = fmul double %11, %param_1.1461
  %12 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3539.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_29(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg11) local_unnamed_addr #2 {
entry:
  %arg1142 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1040 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg938 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg836 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg734 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg632 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg530 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg428 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg326 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg224 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg122 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg020 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_1.1537 = load i64, ptr addrspace(1) %arg122, align 128, !invariant.load !185
  %2 = icmp slt i64 %param_1.1537, 0
  %3 = add i64 %param_1.1537, 192
  %4 = select i1 %2, i64 %3, i64 %param_1.1537
  %5 = tail call i64 @llvm.smax.i64(i64 %4, i64 0)
  %6 = tail call i64 @llvm.umin.i64(i64 %5, i64 191)
  %7 = getelementptr double, ptr addrspace(1) %arg530, i64 %thread_id_x
  %param_5.8495 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %param_4.964 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg428, i64 0, i64 %1
  %param_4.9646 = load double, ptr addrspace(1) %param_4.964, align 8, !invariant.load !185
  %param_11.247 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1142, i64 0, i64 %6
  %param_11.24712 = load double, ptr addrspace(1) %param_11.247, align 8, !invariant.load !185
  %param_6.589 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg632, i64 0, i64 %1
  %param_6.58913 = load double, ptr addrspace(1) %param_6.589, align 8, !invariant.load !185
  %param_8.408 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg836, i64 0, i64 %1, i64 0
  %param_8.40814 = load double, ptr addrspace(1) %param_8.408, align 8, !invariant.load !185
  %param_7.485 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg734, i64 0, i64 %1
  %param_7.48515 = load double, ptr addrspace(1) %param_7.485, align 8, !invariant.load !185
  %multiply.3502.25 = fmul double %param_8.40814, %param_7.48515
  %add.1033.23 = fadd double %param_6.58913, %multiply.3502.25
  %8 = tail call double @llvm.fma.f64(double %add.1033.23, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #5
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #5
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %add.1033.23)
  %12 = tail call double @llvm.fma.f64(double %10, double 0xBC7ABC9E3B39803F, double %11)
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %14 = tail call double @llvm.fma.f64(double %13, double %12, double 0x3EC71DEE62401315)
  %15 = tail call double @llvm.fma.f64(double %14, double %12, double 0x3EFA01997C89EB71)
  %16 = tail call double @llvm.fma.f64(double %15, double %12, double 0x3F2A01A014761F65)
  %17 = tail call double @llvm.fma.f64(double %16, double %12, double 0x3F56C16C1852B7AF)
  %18 = tail call double @llvm.fma.f64(double %17, double %12, double 0x3F81111111122322)
  %19 = tail call double @llvm.fma.f64(double %18, double %12, double 0x3FA55555555502A1)
  %20 = tail call double @llvm.fma.f64(double %19, double %12, double 0x3FC5555555555511)
  %21 = tail call double @llvm.fma.f64(double %20, double %12, double 0x3FE000000000000B)
  %22 = tail call double @llvm.fma.f64(double %21, double %12, double 1.000000e+00)
  %23 = tail call double @llvm.fma.f64(double %22, double %12, double 1.000000e+00)
  %24 = tail call i32 @llvm.nvvm.d2i.lo(double %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %23) #5
  %26 = shl i32 %9, 20
  %27 = add i32 %25, %26
  %28 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.23) #5
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #5
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %add.1033.23, 0.000000e+00
  %34 = fadd double %add.1033.23, 0x7FF0000000000000
  %z.0.i = select i1 %33, double 0.000000e+00, double %34
  %35 = fcmp olt float %31, 0x4010E90000000000
  br i1 %35, label %36, label %__nv_exp.exit

36:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %37 = sdiv i32 %9, 2
  %38 = shl i32 %37, 20
  %39 = add i32 %25, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %39) #5
  %41 = sub nsw i32 %9, %37
  %42 = shl i32 %41, 20
  %43 = add nsw i32 %42, 1072693248
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %43) #5
  %45 = fmul double %44, %40
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %36
  %z.2.i = phi double [ %28, %entry ], [ %45, %36 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %46 = lshr i64 %thread_id_x, 2
  %multiply.3503.7 = fmul double %param_11.24712, %z.2.i
  %compare.375.3 = fcmp ogt double %multiply.3503.7, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg938, i64 %thread_id_x
  %param_9.36116 = load double, ptr addrspace(1) %47, align 8, !invariant.load !185
  %48 = getelementptr double, ptr addrspace(1) %arg1040, i64 %thread_id_x
  %param_10.30617 = load double, ptr addrspace(1) %48, align 8, !invariant.load !185
  %multiply.3510.5 = fmul double %param_8.40814, %param_10.30617
  %add.1036.5 = fadd double %param_9.36116, %multiply.3510.5
  %multiply.3511.5 = fmul double %z.2.i, %add.1036.5
  %multiply.3512.11 = fmul double %param_11.24712, %multiply.3511.5
  %49 = select i1 %compare.375.3, double %multiply.3512.11, double 0.000000e+00
  %50 = fmul double %param_5.8495, %param_4.9646
  %add.1037.7 = fsub double %49, %50
  %param_2.1359 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg224, i64 0, i64 %1
  %param_2.135918 = load double, ptr addrspace(1) %param_2.1359, align 8, !invariant.load !185
  %param_3.1163 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg326, i64 0, i64 %1
  %param_3.116319 = load double, ptr addrspace(1) %param_3.1163, align 8, !invariant.load !185
  %add.1034.6 = fadd double %param_2.135918, %param_3.116319
  %multiply.3513.4 = fmul double %add.1034.6, %add.1034.6
  %multiply.3606.3 = fmul double %add.1034.6, %multiply.3513.4
  %divide.883.3 = fdiv double 1.000000e+00, %multiply.3606.3
  %multiply.3607.5 = fmul double %divide.883.3, -2.000000e+00
  %multiply.3608.3 = fmul double %add.1037.7, %multiply.3607.5
  %51 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg020, i64 0, i64 %6, i64 %46, i64 %1
  store double %multiply.3608.3, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_32(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6) local_unnamed_addr #2 {
entry:
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_1.1485 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !185
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7945 = load double, ptr addrspace(1) %2, align 8, !invariant.load !185
  %param_4.904 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg418, i64 0, i64 %1, i64 0
  %param_4.9046 = load double, ptr addrspace(1) %param_4.904, align 8, !invariant.load !185
  %3 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.5427 = load double, ptr addrspace(1) %3, align 8, !invariant.load !185
  %param_2.1276 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg214, i64 0, i64 %1
  %param_2.12768 = load double, ptr addrspace(1) %param_2.1276, align 8, !invariant.load !185
  %param_3.1097 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg316, i64 0, i64 %1
  %param_3.10979 = load double, ptr addrspace(1) %param_3.1097, align 8, !invariant.load !185
  %multiply.3502.15 = fmul double %param_4.9046, %param_3.10979
  %add.1033.13 = fadd double %param_2.12768, %multiply.3502.15
  %4 = tail call double @llvm.fma.f64(double %add.1033.13, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #5
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #5
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.1033.13)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #5
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #5
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.13) #5
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #5
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.1033.13, 0.000000e+00
  %30 = fadd double %add.1033.13, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #5
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #5
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3510.3 = fmul double %param_4.9046, %param_6.5427
  %add.1036.3 = fadd double %param_5.7945, %multiply.3510.3
  %42 = icmp slt i64 %param_1.1485, 0
  %43 = add i64 %param_1.1485, 192
  %44 = select i1 %42, i64 %43, i64 %param_1.1485
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %47 = lshr i64 %thread_id_x, 2
  %multiply.3511.3 = fmul double %add.1036.3, %z.2.i
  %48 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %46, i64 %47, i64 %1
  store double %multiply.3511.3, ptr addrspace(1) %48, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_30(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg7) local_unnamed_addr #2 {
entry:
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_1.1555 = load i64, ptr addrspace(1) %arg118, align 128, !invariant.load !185
  %2 = icmp slt i64 %param_1.1555, 0
  %3 = add i64 %param_1.1555, 192
  %4 = select i1 %2, i64 %3, i64 %param_1.1555
  %5 = tail call i64 @llvm.smax.i64(i64 %4, i64 0)
  %6 = tail call i64 @llvm.umin.i64(i64 %5, i64 191)
  %param_7.478 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg730, i64 0, i64 %6
  %param_7.47810 = load double, ptr addrspace(1) %param_7.478, align 8, !invariant.load !185
  %param_2.1354 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg220, i64 0, i64 %1
  %param_2.135411 = load double, ptr addrspace(1) %param_2.1354, align 8, !invariant.load !185
  %param_4.956 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg424, i64 0, i64 %1, i64 0
  %param_4.95612 = load double, ptr addrspace(1) %param_4.956, align 8, !invariant.load !185
  %param_3.1155 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg322, i64 0, i64 %1
  %param_3.115513 = load double, ptr addrspace(1) %param_3.1155, align 8, !invariant.load !185
  %multiply.3502.35 = fmul double %param_4.95612, %param_3.115513
  %add.1033.33 = fadd double %param_2.135411, %multiply.3502.35
  %7 = tail call double @llvm.fma.f64(double %add.1033.33, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %8 = tail call i32 @llvm.nvvm.d2i.lo(double %7) #5
  %9 = tail call double @llvm.nvvm.add.rn.d(double %7, double 0xC338000000000000) #5
  %10 = tail call double @llvm.fma.f64(double %9, double 0xBFE62E42FEFA39EF, double %add.1033.33)
  %11 = tail call double @llvm.fma.f64(double %9, double 0xBC7ABC9E3B39803F, double %10)
  %12 = tail call double @llvm.fma.f64(double %11, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %13 = tail call double @llvm.fma.f64(double %12, double %11, double 0x3EC71DEE62401315)
  %14 = tail call double @llvm.fma.f64(double %13, double %11, double 0x3EFA01997C89EB71)
  %15 = tail call double @llvm.fma.f64(double %14, double %11, double 0x3F2A01A014761F65)
  %16 = tail call double @llvm.fma.f64(double %15, double %11, double 0x3F56C16C1852B7AF)
  %17 = tail call double @llvm.fma.f64(double %16, double %11, double 0x3F81111111122322)
  %18 = tail call double @llvm.fma.f64(double %17, double %11, double 0x3FA55555555502A1)
  %19 = tail call double @llvm.fma.f64(double %18, double %11, double 0x3FC5555555555511)
  %20 = tail call double @llvm.fma.f64(double %19, double %11, double 0x3FE000000000000B)
  %21 = tail call double @llvm.fma.f64(double %20, double %11, double 1.000000e+00)
  %22 = tail call double @llvm.fma.f64(double %21, double %11, double 1.000000e+00)
  %23 = tail call i32 @llvm.nvvm.d2i.lo(double %22) #5
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %22) #5
  %25 = shl i32 %8, 20
  %26 = add i32 %24, %25
  %27 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %26) #5
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.33) #5
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.fabs.f(float %29) #5
  %31 = fcmp olt float %30, 0x4010C46560000000
  br i1 %31, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %32 = fcmp olt double %add.1033.33, 0.000000e+00
  %33 = fadd double %add.1033.33, 0x7FF0000000000000
  %z.0.i = select i1 %32, double 0.000000e+00, double %33
  %34 = fcmp olt float %30, 0x4010E90000000000
  br i1 %34, label %35, label %__nv_exp.exit

35:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %36 = sdiv i32 %8, 2
  %37 = shl i32 %36, 20
  %38 = add i32 %24, %37
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %38) #5
  %40 = sub nsw i32 %8, %36
  %41 = shl i32 %40, 20
  %42 = add nsw i32 %41, 1072693248
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %42) #5
  %44 = fmul double %43, %39
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %35
  %z.2.i = phi double [ %27, %entry ], [ %44, %35 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %45 = lshr i64 %thread_id_x, 2
  %multiply.3503.17 = fmul double %param_7.47810, %z.2.i
  %compare.375.13 = fcmp ogt double %multiply.3503.17, 1.000000e-128
  %46 = getelementptr double, ptr addrspace(1) %arg526, i64 %thread_id_x
  %param_5.84114 = load double, ptr addrspace(1) %46, align 8, !invariant.load !185
  %47 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.58215 = load double, ptr addrspace(1) %47, align 8, !invariant.load !185
  %multiply.3510.11 = fmul double %param_4.95612, %param_6.58215
  %add.1036.11 = fadd double %param_5.84114, %multiply.3510.11
  %multiply.3511.11 = fmul double %z.2.i, %add.1036.11
  %multiply.3512.7 = fmul double %param_7.47810, %multiply.3511.11
  %48 = select i1 %compare.375.13, double %multiply.3512.7, double 0.000000e+00
  %49 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg016, i64 0, i64 %6, i64 %45, i64 %1
  store double %48, ptr addrspace(1) %49, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_102(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_3.1184 = load i64, ptr addrspace(1) %arg315, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_3.1184, 0
  %4 = add i64 %param_3.1184, 192
  %5 = select i1 %3, i64 %4, i64 %param_3.1184
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_4.981 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg417, i64 0, i64 %2
  %param_4.9815 = load i64, ptr addrspace(1) %param_4.981, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_4.9815, 0
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.13767 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = select i1 %.not, double 0.000000e+00, double %param_2.13767
  %param_1.1567 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg111, i64 0, i64 %2, i64 0
  %param_1.15678 = load double, ptr addrspace(1) %param_1.1567, align 8, !invariant.load !185
  %multiply.3587.7 = fmul double %param_1.15678, 2.000000e+00
  %multiply.3588.7 = fmul double %9, %multiply.3587.7
  %multiply.3625.3 = fmul double %multiply.3588.7, 5.000000e-01
  %10 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3625.3, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_99(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1363 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_2.1363, 0
  %4 = add i64 %param_2.1363, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1363
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1176 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg314, i64 0, i64 %2
  %param_3.11765 = load i64, ptr addrspace(1) %param_3.1176, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_3.11765, 0
  %8 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.15607 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = fmul double %param_1.15607, 2.000000e+00
  %multiply.3624.1 = select i1 %.not, double 0.000000e+00, double %9
  %10 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3624.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_103(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1355 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_2.1355, 0
  %4 = add i64 %param_2.1355, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1355
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1180 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg314, i64 0, i64 %2
  %param_3.11805 = load i64, ptr addrspace(1) %param_3.1180, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_3.11805, 0
  %8 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.15567 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = select i1 %.not, double 0.000000e+00, double %param_1.15567
  %10 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_4.977 = load i64, ptr addrspace(1) %arg417, align 128, !invariant.load !185
  %param_3.1181 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg315, i64 0, i64 %1
  %param_3.11815 = load i64, ptr addrspace(1) %param_3.1181, align 8, !invariant.load !185
  %2 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12827 = load double, ptr addrspace(1) %2, align 8, !invariant.load !185
  %param_1.1491 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg111, i64 0, i64 %1
  %param_1.14918 = load double, ptr addrspace(1) %param_1.1491, align 8, !invariant.load !185
  %3 = tail call double @llvm.fma.f64(double %param_1.14918, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #5
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #5
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %param_1.14918)
  %7 = tail call double @llvm.fma.f64(double %5, double 0xBC7ABC9E3B39803F, double %6)
  %8 = tail call double @llvm.fma.f64(double %7, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %9 = tail call double @llvm.fma.f64(double %8, double %7, double 0x3EC71DEE62401315)
  %10 = tail call double @llvm.fma.f64(double %9, double %7, double 0x3EFA01997C89EB71)
  %11 = tail call double @llvm.fma.f64(double %10, double %7, double 0x3F2A01A014761F65)
  %12 = tail call double @llvm.fma.f64(double %11, double %7, double 0x3F56C16C1852B7AF)
  %13 = tail call double @llvm.fma.f64(double %12, double %7, double 0x3F81111111122322)
  %14 = tail call double @llvm.fma.f64(double %13, double %7, double 0x3FA55555555502A1)
  %15 = tail call double @llvm.fma.f64(double %14, double %7, double 0x3FC5555555555511)
  %16 = tail call double @llvm.fma.f64(double %15, double %7, double 0x3FE000000000000B)
  %17 = tail call double @llvm.fma.f64(double %16, double %7, double 1.000000e+00)
  %18 = tail call double @llvm.fma.f64(double %17, double %7, double 1.000000e+00)
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #5
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #5
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #5
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.14918) #5
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #5
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %param_1.14918, 0.000000e+00
  %29 = fadd double %param_1.14918, 0x7FF0000000000000
  %z.0.i = select i1 %28, double 0.000000e+00, double %29
  %30 = fcmp olt float %26, 0x4010E90000000000
  br i1 %30, label %31, label %__nv_exp.exit

31:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %32 = sdiv i32 %4, 2
  %33 = shl i32 %32, 20
  %34 = add i32 %20, %33
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #5
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #5
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %.not = icmp eq i64 %param_3.11815, 0
  %41 = select i1 %.not, double %param_2.12827, double 0.000000e+00
  %42 = icmp slt i64 %param_4.977, 0
  %43 = add i64 %param_4.977, 192
  %44 = select i1 %42, i64 %43, i64 %param_4.977
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %47 = lshr i64 %thread_id_x, 2
  %multiply.3576.3 = fmul double %41, %z.2.i
  %48 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %46, i64 %47, i64 %1
  store double %multiply.3576.3, ptr addrspace(1) %48, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_3.1182 = load i64, ptr addrspace(1) %arg319, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_3.1182, 0
  %4 = add i64 %param_3.1182, 192
  %5 = select i1 %3, i64 %4, i64 %param_3.1182
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_2.1375 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg217, i64 0, i64 %2
  %param_2.13755 = load i64, ptr addrspace(1) %param_2.1375, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_2.13755, 0
  %8 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.14957 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = select i1 %.not, double %param_1.14957, double 0.000000e+00
  %param_4.978 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg421, i64 0, i64 %2
  %param_4.9788 = load double, ptr addrspace(1) %param_4.978, align 8, !invariant.load !185
  %multiply.3559.6 = fmul double %param_4.9788, %param_4.9788
  %multiply.3597.5 = fmul double %param_4.9788, %multiply.3559.6
  %divide.880.5 = fdiv double 1.000000e+00, %multiply.3597.5
  %multiply.3598.5 = fmul double %divide.880.5, -2.000000e+00
  %multiply.3619.3 = fmul double %9, %multiply.3598.5
  %10 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3619.3, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_98(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1307 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_2.1307, 0
  %4 = add i64 %param_2.1307, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1307
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.15165 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.15165, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_35(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_3.1145 = load i64, ptr addrspace(1) %arg319, align 128, !invariant.load !185
  %2 = icmp slt i64 %param_3.1145, 0
  %3 = add i64 %param_3.1145, 192
  %4 = select i1 %2, i64 %3, i64 %param_3.1145
  %5 = tail call i64 @llvm.smax.i64(i64 %4, i64 0)
  %6 = tail call i64 @llvm.umin.i64(i64 %5, i64 191)
  %param_4.946 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg421, i64 0, i64 %6
  %param_4.94610 = load double, ptr addrspace(1) %param_4.946, align 8, !invariant.load !185
  %param_2.1348 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg217, i64 0, i64 %1
  %param_2.134811 = load double, ptr addrspace(1) %param_2.1348, align 8, !invariant.load !185
  %7 = tail call double @llvm.fma.f64(double %param_2.134811, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %8 = tail call i32 @llvm.nvvm.d2i.lo(double %7) #5
  %9 = tail call double @llvm.nvvm.add.rn.d(double %7, double 0xC338000000000000) #5
  %10 = tail call double @llvm.fma.f64(double %9, double 0xBFE62E42FEFA39EF, double %param_2.134811)
  %11 = tail call double @llvm.fma.f64(double %9, double 0xBC7ABC9E3B39803F, double %10)
  %12 = tail call double @llvm.fma.f64(double %11, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %13 = tail call double @llvm.fma.f64(double %12, double %11, double 0x3EC71DEE62401315)
  %14 = tail call double @llvm.fma.f64(double %13, double %11, double 0x3EFA01997C89EB71)
  %15 = tail call double @llvm.fma.f64(double %14, double %11, double 0x3F2A01A014761F65)
  %16 = tail call double @llvm.fma.f64(double %15, double %11, double 0x3F56C16C1852B7AF)
  %17 = tail call double @llvm.fma.f64(double %16, double %11, double 0x3F81111111122322)
  %18 = tail call double @llvm.fma.f64(double %17, double %11, double 0x3FA55555555502A1)
  %19 = tail call double @llvm.fma.f64(double %18, double %11, double 0x3FC5555555555511)
  %20 = tail call double @llvm.fma.f64(double %19, double %11, double 0x3FE000000000000B)
  %21 = tail call double @llvm.fma.f64(double %20, double %11, double 1.000000e+00)
  %22 = tail call double @llvm.fma.f64(double %21, double %11, double 1.000000e+00)
  %23 = tail call i32 @llvm.nvvm.d2i.lo(double %22) #5
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %22) #5
  %25 = shl i32 %8, 20
  %26 = add i32 %24, %25
  %27 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %26) #5
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.134811) #5
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.fabs.f(float %29) #5
  %31 = fcmp olt float %30, 0x4010C46560000000
  br i1 %31, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %32 = fcmp olt double %param_2.134811, 0.000000e+00
  %33 = fadd double %param_2.134811, 0x7FF0000000000000
  %z.0.i = select i1 %32, double 0.000000e+00, double %33
  %34 = fcmp olt float %30, 0x4010E90000000000
  br i1 %34, label %35, label %__nv_exp.exit

35:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %36 = sdiv i32 %8, 2
  %37 = shl i32 %36, 20
  %38 = add i32 %24, %37
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %38) #5
  %40 = sub nsw i32 %8, %36
  %41 = shl i32 %40, 20
  %42 = add nsw i32 %41, 1072693248
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %42) #5
  %44 = fmul double %43, %39
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %35
  %z.2.i = phi double [ %27, %entry ], [ %44, %35 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %45 = lshr i64 %thread_id_x, 2
  %multiply.3524.31 = fmul double %param_4.94610, %z.2.i
  %compare.377.3 = fcmp ogt double %multiply.3524.31, 1.000000e-128
  %46 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.155412 = load double, ptr addrspace(1) %46, align 8, !invariant.load !185
  %multiply.3561.7 = fmul double %z.2.i, %param_1.155412
  %multiply.3562.3 = fmul double %param_4.94610, %multiply.3561.7
  %47 = select i1 %compare.377.3, double %multiply.3562.3, double 0.000000e+00
  %48 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %6, i64 %45, i64 %1
  store double %47, ptr addrspace(1) %48, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_37(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_3.1098 = load i64, ptr addrspace(1) %arg313, align 128, !invariant.load !185
  %2 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14865 = load double, ptr addrspace(1) %2, align 8, !invariant.load !185
  %param_2.1277 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg211, i64 0, i64 %1
  %param_2.12776 = load double, ptr addrspace(1) %param_2.1277, align 8, !invariant.load !185
  %3 = tail call double @llvm.fma.f64(double %param_2.12776, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #5
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #5
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %param_2.12776)
  %7 = tail call double @llvm.fma.f64(double %5, double 0xBC7ABC9E3B39803F, double %6)
  %8 = tail call double @llvm.fma.f64(double %7, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %9 = tail call double @llvm.fma.f64(double %8, double %7, double 0x3EC71DEE62401315)
  %10 = tail call double @llvm.fma.f64(double %9, double %7, double 0x3EFA01997C89EB71)
  %11 = tail call double @llvm.fma.f64(double %10, double %7, double 0x3F2A01A014761F65)
  %12 = tail call double @llvm.fma.f64(double %11, double %7, double 0x3F56C16C1852B7AF)
  %13 = tail call double @llvm.fma.f64(double %12, double %7, double 0x3F81111111122322)
  %14 = tail call double @llvm.fma.f64(double %13, double %7, double 0x3FA55555555502A1)
  %15 = tail call double @llvm.fma.f64(double %14, double %7, double 0x3FC5555555555511)
  %16 = tail call double @llvm.fma.f64(double %15, double %7, double 0x3FE000000000000B)
  %17 = tail call double @llvm.fma.f64(double %16, double %7, double 1.000000e+00)
  %18 = tail call double @llvm.fma.f64(double %17, double %7, double 1.000000e+00)
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #5
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #5
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #5
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.12776) #5
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #5
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %param_2.12776, 0.000000e+00
  %29 = fadd double %param_2.12776, 0x7FF0000000000000
  %z.0.i = select i1 %28, double 0.000000e+00, double %29
  %30 = fcmp olt float %26, 0x4010E90000000000
  br i1 %30, label %31, label %__nv_exp.exit

31:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %32 = sdiv i32 %4, 2
  %33 = shl i32 %32, 20
  %34 = add i32 %20, %33
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #5
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #5
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %41 = icmp slt i64 %param_3.1098, 0
  %42 = add i64 %param_3.1098, 192
  %43 = select i1 %41, i64 %42, i64 %param_3.1098
  %44 = tail call i64 @llvm.smax.i64(i64 %43, i64 0)
  %45 = tail call i64 @llvm.umin.i64(i64 %44, i64 191)
  %46 = lshr i64 %thread_id_x, 2
  %multiply.3561.3 = fmul double %param_1.14865, %z.2.i
  %47 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %45, i64 %46, i64 %1
  store double %multiply.3561.3, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_38(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1320 = load i64, ptr addrspace(1) %arg215, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_2.1320, 0
  %4 = add i64 %param_2.1320, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1320
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.15295 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %param_3.1166 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg317, i64 0, i64 %2
  %param_3.11666 = load double, ptr addrspace(1) %param_3.1166, align 8, !invariant.load !185
  %multiply.3559.4 = fmul double %param_3.11666, %param_3.11666
  %multiply.3597.3 = fmul double %param_3.11666, %multiply.3559.4
  %divide.880.3 = fdiv double 1.000000e+00, %multiply.3597.3
  %multiply.3598.3 = fmul double %divide.880.3, -2.000000e+00
  %multiply.3599.3 = fmul double %param_1.15295, %multiply.3598.3
  %9 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3599.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_and_divide_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg8, ptr noalias nocapture align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg11, ptr noalias nocapture align 128 dereferenceable(32) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg13, ptr noalias nocapture align 128 dereferenceable(32) %arg14, ptr noalias nocapture align 128 dereferenceable(32) %arg15, ptr noalias nocapture align 128 dereferenceable(32) %arg16, ptr noalias nocapture align 128 dereferenceable(32) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture align 128 dereferenceable(32) %arg23, ptr noalias nocapture align 128 dereferenceable(32) %arg24, ptr noalias nocapture align 128 dereferenceable(32) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg26, ptr noalias nocapture align 128 dereferenceable(16) %arg27, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg28, ptr noalias nocapture align 128 dereferenceable(32) %arg29, ptr noalias nocapture align 128 dereferenceable(32) %arg30, ptr noalias nocapture align 128 dereferenceable(32) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg32, ptr noalias nocapture align 128 dereferenceable(32) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg34, ptr noalias nocapture align 128 dereferenceable(32) %arg35, ptr noalias nocapture align 128 dereferenceable(32) %arg36, ptr noalias nocapture align 128 dereferenceable(32) %arg37, ptr noalias nocapture align 128 dereferenceable(32) %arg38, ptr noalias nocapture align 128 dereferenceable(32) %arg39, ptr noalias nocapture align 128 dereferenceable(32) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg45, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg46, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg47, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg48, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg49, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg50, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg51, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg52, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg53) local_unnamed_addr #2 {
entry:
  %arg53114 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52112 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51110 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50108 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49106 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48104 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47102 = addrspacecast ptr %arg47 to ptr addrspace(1)
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg2048, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !185
  %4 = getelementptr double, ptr addrspace(1) %arg2150, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !185
  %6 = load i64, ptr addrspace(1) %arg518, align 128, !invariant.load !185
  %7 = icmp slt i64 %6, 0
  %8 = add i64 %6, 192
  %9 = select i1 %7, i64 %8, i64 %6
  %10 = trunc i64 %9 to i32
  %11 = tail call i32 @llvm.smax.i32(i32 %10, i32 0)
  %12 = tail call i32 @llvm.umin.i32(i32 %11, i32 191)
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg416, i64 0, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !185
  %16 = getelementptr double, ptr addrspace(1) %arg1946, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !185
  %18 = getelementptr double, ptr addrspace(1) %arg4190, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !185
  %20 = getelementptr double, ptr addrspace(1) %arg3476, i64 %1
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !185
  %22 = getelementptr double, ptr addrspace(1) %arg2252, i64 %1
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !185
  %24 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg2660, i64 0, i64 %13, i64 %1, i64 0
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !185
  %26 = getelementptr double, ptr addrspace(1) %arg3272, i64 %1
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !185
  %28 = load double, ptr addrspace(1) %arg1844, align 128, !invariant.load !185
  %29 = getelementptr double, ptr addrspace(1) %arg212, i64 %1
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !185
  %31 = getelementptr double, ptr addrspace(1) %arg04, i64 %1
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !185
  %33 = getelementptr double, ptr addrspace(1) %arg110, i64 %1
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !185
  %35 = getelementptr double, ptr addrspace(1) %arg824, i64 %1
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !185
  %37 = getelementptr double, ptr addrspace(1) %arg620, i64 %1
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !185
  %39 = getelementptr double, ptr addrspace(1) %arg722, i64 %1
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !185
  %41 = getelementptr double, ptr addrspace(1) %arg2354, i64 %1
  %42 = load double, ptr addrspace(1) %41, align 8
  %43 = getelementptr double, ptr addrspace(1) %arg926, i64 %1
  %44 = load double, ptr addrspace(1) %43, align 8
  %45 = getelementptr double, ptr addrspace(1) %arg1130, i64 %1
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !185
  %47 = tail call double @llvm.fma.f64(double %46, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %48 = tail call i32 @llvm.nvvm.d2i.lo(double %47) #5
  %49 = tail call double @llvm.nvvm.add.rn.d(double %47, double 0xC338000000000000) #5
  %50 = tail call double @llvm.fma.f64(double %49, double 0xBFE62E42FEFA39EF, double %46)
  %51 = tail call double @llvm.fma.f64(double %49, double 0xBC7ABC9E3B39803F, double %50)
  %52 = tail call double @llvm.fma.f64(double %51, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %53 = tail call double @llvm.fma.f64(double %52, double %51, double 0x3EC71DEE62401315)
  %54 = tail call double @llvm.fma.f64(double %53, double %51, double 0x3EFA01997C89EB71)
  %55 = tail call double @llvm.fma.f64(double %54, double %51, double 0x3F2A01A014761F65)
  %56 = tail call double @llvm.fma.f64(double %55, double %51, double 0x3F56C16C1852B7AF)
  %57 = tail call double @llvm.fma.f64(double %56, double %51, double 0x3F81111111122322)
  %58 = tail call double @llvm.fma.f64(double %57, double %51, double 0x3FA55555555502A1)
  %59 = tail call double @llvm.fma.f64(double %58, double %51, double 0x3FC5555555555511)
  %60 = tail call double @llvm.fma.f64(double %59, double %51, double 0x3FE000000000000B)
  %61 = tail call double @llvm.fma.f64(double %60, double %51, double 1.000000e+00)
  %62 = tail call double @llvm.fma.f64(double %61, double %51, double 1.000000e+00)
  %63 = tail call i32 @llvm.nvvm.d2i.lo(double %62) #5
  %64 = tail call i32 @llvm.nvvm.d2i.hi(double %62) #5
  %65 = shl i32 %48, 20
  %66 = add i32 %64, %65
  %67 = tail call double @llvm.nvvm.lohi.i2d(i32 %63, i32 %66) #5
  %68 = tail call i32 @llvm.nvvm.d2i.hi(double %46) #5
  %69 = bitcast i32 %68 to float
  %70 = tail call float @llvm.nvvm.fabs.f(float %69) #5
  %71 = fcmp olt float %70, 0x4010C46560000000
  br i1 %71, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %72 = fcmp olt double %46, 0.000000e+00
  %73 = fadd double %46, 0x7FF0000000000000
  %z.0.i = select i1 %72, double 0.000000e+00, double %73
  %74 = fcmp olt float %70, 0x4010E90000000000
  br i1 %74, label %75, label %__nv_exp.exit

75:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %76 = sdiv i32 %48, 2
  %77 = shl i32 %76, 20
  %78 = add i32 %64, %77
  %79 = tail call double @llvm.nvvm.lohi.i2d(i32 %63, i32 %78) #5
  %80 = sub nsw i32 %48, %76
  %81 = shl i32 %80, 20
  %82 = add nsw i32 %81, 1072693248
  %83 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %82) #5
  %84 = fmul double %83, %79
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %75
  %z.2.i = phi double [ %67, %entry ], [ %84, %75 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.866.1.clone.1 = fdiv double 1.000000e+00, %44
  %multiply.3518.38 = fmul double %38, %40
  %multiply.3525.21 = fmul double %36, %multiply.3518.38
  %add.1034.3.clone.1 = fadd double %38, %42
  %multiply.3519.3.clone.1 = fmul double %23, %add.1034.3.clone.1
  %divide.864.3.clone.1 = fdiv double 1.000000e+00, %multiply.3519.3.clone.1
  %multiply.3498.21.clone.1 = fmul double %3, %5
  %multiply.3499.23.clone.1 = fmul double %15, %17
  %add.1031.21.clone.1 = fadd double %multiply.3498.21.clone.1, %multiply.3499.23.clone.1
  %multiply.3501.5.clone.1 = fmul double %19, %21
  %divide.862.1.clone.1 = fdiv double %multiply.3501.5.clone.1, %23
  %subtract.146.7.clone.1 = fsub double %25, %27
  %multiply.3515.5.clone.1 = fmul double %subtract.146.7.clone.1, %28
  %divide.863.1.clone.1 = fdiv double %multiply.3515.5.clone.1, %21
  %multiply.3516.17.clone.1 = fmul double %28, %divide.863.1.clone.1
  %multiply.3517.3.clone.1 = fmul double %divide.862.1.clone.1, %multiply.3516.17.clone.1
  %add.1038.3.clone.1 = fadd double %add.1031.21.clone.1, %multiply.3517.3.clone.1
  %subtract.147.6.clone.1 = fsub double %add.1038.3.clone.1, %add.1031.21.clone.1
  %multiply.3520.2.clone.1 = fmul double %subtract.147.6.clone.1, %subtract.147.6.clone.1
  %multiply.3521.1.clone.1 = fmul double %40, %multiply.3520.2.clone.1
  %add.1039.1.clone.1 = fadd double %multiply.3521.1.clone.1, %divide.864.3.clone.1
  %add.1040.1.clone.1 = fadd double %add.1039.1.clone.1, -1.000000e+00
  %multiply.3526.2 = fmul double %multiply.3525.21, %add.1040.1.clone.1
  %multiply.3522.3 = fmul double %30, %32
  %multiply.3523.5 = fmul double %15, %34
  %add.1041.3 = fadd double %multiply.3522.3, %multiply.3523.5
  %85 = tail call double @llvm.fabs.f64(double %add.1038.3.clone.1)
  %86 = call i1 @llvm.is.fpclass.f64(double %add.1038.3.clone.1, i32 504)
  %compare.376.1.clone.1 = fcmp olt double %85, 1.400000e+01
  %87 = and i1 %86, %compare.376.1.clone.1
  %88 = zext i1 %87 to i8
  %multiply.3524.33.clone.1 = fmul double %15, %z.2.i
  %compare.377.5.clone.1 = fcmp ogt double %multiply.3524.33.clone.1, 1.000000e-128
  %89 = getelementptr double, ptr addrspace(1) %arg1334, i64 %1
  %90 = load double, ptr addrspace(1) %89, align 8, !invariant.load !185
  %91 = select i1 %compare.377.5.clone.1, double %multiply.3524.33.clone.1, double %90
  %add.1042.2.clone.1 = fadd double %divide.866.1.clone.1, %91
  %divide.867.1.clone.1 = fdiv double 1.000000e+00, %add.1042.2.clone.1
  %multiply.3527.13 = fmul double %divide.867.1.clone.1, 2.000000e+00
  %divide.868.5 = fdiv double 1.000000e+00, %multiply.3527.13
  %multiply.3528.3 = fmul double %multiply.3526.2, %divide.868.5
  %92 = getelementptr i64, ptr addrspace(1) %arg314, i64 %1
  %93 = load i64, ptr addrspace(1) %92, align 8, !invariant.load !185
  %94 = sitofp i64 %93 to double
  %multiply.3529.3 = fmul double %multiply.3528.3, %94
  %add.1043.1 = fadd double %add.1041.3, %multiply.3529.3
  %95 = select i1 %87, double %add.1043.1, double %32
  %.not = icmp eq i64 %93, 0
  %add.1044.5.clone.1 = fadd double %divide.866.1.clone.1, %multiply.3524.33.clone.1
  %divide.869.3.clone.1 = fdiv double 1.000000e+00, %add.1044.5.clone.1
  %multiply.3530.5.clone.1 = fmul double %multiply.3525.21, %multiply.3525.21
  %multiply.3531.7.clone.1 = fmul double %multiply.3530.5.clone.1, 5.000000e-01
  %multiply.3532.5.clone.1 = fmul double %multiply.3530.5.clone.1, %add.1040.1.clone.1
  %add.1045.5.clone.1 = fadd double %multiply.3531.7.clone.1, %multiply.3532.5.clone.1
  %multiply.3533.15.clone.1 = fmul double %36, %36
  %multiply.3534.13.clone.1 = fmul double %multiply.3533.15.clone.1, 5.000000e-01
  %multiply.3535.5.clone.1 = fmul double %multiply.3534.13.clone.1, %multiply.3518.38
  %multiply.3536.5.clone.1 = fmul double %multiply.3535.5.clone.1, %add.1040.1.clone.1
  %subtract.148.5.clone.1 = fsub double %add.1045.5.clone.1, %multiply.3536.5.clone.1
  %multiply.3537.3.clone.1 = fmul double %subtract.148.5.clone.1, %94
  %add.1046.3.clone.1 = fadd double %multiply.3537.3.clone.1, %divide.867.1.clone.1
  %compare.380.5.clone.1 = fcmp ogt double %add.1046.3.clone.1, 1.000000e-128
  %96 = getelementptr double, ptr addrspace(1) %arg1028, i64 %1
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !185
  %98 = select i1 %compare.380.5.clone.1, double %add.1046.3.clone.1, double %97
  %99 = select i1 %.not, double %divide.869.3.clone.1, double %98
  %100 = select i1 %87, double %99, double %44
  %multiply.3538.1.clone.1 = fmul double %91, %divide.867.1.clone.1
  %101 = getelementptr double, ptr addrspace(1) %arg1232, i64 %1
  %102 = load double, ptr addrspace(1) %101, align 8
  %103 = select i1 %87, double %multiply.3538.1.clone.1, double %102
  %multiply.3571.2.clone.1 = fmul double %multiply.3527.13, %multiply.3527.13
  %divide.878.1.clone.1 = fdiv double 1.000000e+00, %multiply.3571.2.clone.1
  %104 = getelementptr double, ptr addrspace(1) %arg1436, i64 %1
  %105 = load double, ptr addrspace(1) %104, align 8
  %106 = select i1 %87, double %divide.867.1.clone.1, double %105
  %multiply.3563.2.clone.1 = fmul double %add.1042.2.clone.1, %add.1042.2.clone.1
  %divide.877.1.clone.1 = fdiv double 1.000000e+00, %multiply.3563.2.clone.1
  %107 = getelementptr double, ptr addrspace(1) %arg1538, i64 %1
  %108 = load double, ptr addrspace(1) %107, align 8
  %109 = select i1 %87, double %divide.866.1.clone.1, double %108
  %multiply.3559.2.clone.1 = fmul double %44, %44
  %divide.876.1.clone.1 = fdiv double 1.000000e+00, %multiply.3559.2.clone.1
  %110 = getelementptr double, ptr addrspace(1) %arg1640, i64 %1
  %111 = load double, ptr addrspace(1) %110, align 8
  %112 = select i1 %87, double %add.1041.3, double %111
  %113 = getelementptr double, ptr addrspace(1) %arg1742, i64 %1
  %114 = load double, ptr addrspace(1) %113, align 8
  %115 = select i1 %87, double %add.1040.1.clone.1, double %114
  %116 = getelementptr double, ptr addrspace(1) %arg2456, i64 %1
  %117 = load double, ptr addrspace(1) %116, align 8
  %118 = select i1 %87, double %15, double %117
  %119 = getelementptr double, ptr addrspace(1) %arg2558, i64 %1
  %120 = load double, ptr addrspace(1) %119, align 8
  %121 = select i1 %87, double %25, double %120
  %122 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg2864, i64 0, i64 %13
  %123 = load i32, ptr addrspace(1) %122, align 4, !invariant.load !185
  %124 = getelementptr i32, ptr addrspace(1) %arg2762, i64 %1
  %125 = load i32, ptr addrspace(1) %124, align 4
  %126 = select i1 %87, i32 %123, i32 %125
  %127 = getelementptr double, ptr addrspace(1) %arg2966, i64 %1
  %128 = load double, ptr addrspace(1) %127, align 8
  %129 = select i1 %87, double %add.1031.21.clone.1, double %128
  %130 = select i1 %87, double %add.1038.3.clone.1, double %5
  %131 = getelementptr double, ptr addrspace(1) %arg3068, i64 %1
  %132 = load double, ptr addrspace(1) %131, align 8
  %133 = select i1 %87, double %multiply.3518.38, double %132
  %134 = getelementptr double, ptr addrspace(1) %arg3170, i64 %1
  %135 = load double, ptr addrspace(1) %134, align 8
  %136 = select i1 %87, double %subtract.147.6.clone.1, double %135
  %137 = getelementptr double, ptr addrspace(1) %arg3374, i64 %1
  %138 = load double, ptr addrspace(1) %137, align 8
  %139 = select i1 %87, double %27, double %138
  %140 = getelementptr double, ptr addrspace(1) %arg3578, i64 %1
  %141 = load double, ptr addrspace(1) %140, align 8
  %142 = select i1 %87, double %21, double %141
  %143 = getelementptr double, ptr addrspace(1) %arg3680, i64 %1
  %144 = load double, ptr addrspace(1) %143, align 8
  %145 = select i1 %87, double %21, double %144
  %146 = getelementptr double, ptr addrspace(1) %arg3782, i64 %1
  %147 = load double, ptr addrspace(1) %146, align 8
  %148 = select i1 %87, double %divide.863.1.clone.1, double %147
  %149 = getelementptr double, ptr addrspace(1) %arg3884, i64 %1
  %150 = load double, ptr addrspace(1) %149, align 8
  %151 = select i1 %87, double %40, double %150
  %152 = getelementptr double, ptr addrspace(1) %arg3986, i64 %1
  %153 = load double, ptr addrspace(1) %152, align 8
  %154 = select i1 %87, double %23, double %153
  %155 = getelementptr double, ptr addrspace(1) %arg4088, i64 %1
  %156 = load double, ptr addrspace(1) %155, align 8
  %157 = select i1 %87, double %42, double %156
  %multiply.3545.2.clone.1 = fmul double %23, %23
  %divide.874.1.clone.1 = fdiv double 1.000000e+00, %multiply.3545.2.clone.1
  %multiply.3541.2.clone.1 = fmul double %21, %21
  %divide.871.1.clone.1 = fdiv double 1.000000e+00, %multiply.3541.2.clone.1
  %158 = getelementptr double, ptr addrspace(1) %arg4292, i64 %1
  store double %95, ptr addrspace(1) %158, align 8
  store double %100, ptr addrspace(1) %43, align 8
  store double %103, ptr addrspace(1) %101, align 8
  %159 = getelementptr double, ptr addrspace(1) %arg4394, i64 %1
  store double %divide.878.1.clone.1, ptr addrspace(1) %159, align 8
  store double %106, ptr addrspace(1) %104, align 8
  %160 = getelementptr double, ptr addrspace(1) %arg4496, i64 %1
  store double %divide.867.1.clone.1, ptr addrspace(1) %160, align 8
  %161 = getelementptr double, ptr addrspace(1) %arg4598, i64 %1
  store double %divide.877.1.clone.1, ptr addrspace(1) %161, align 8
  store double %109, ptr addrspace(1) %107, align 8
  %162 = getelementptr double, ptr addrspace(1) %arg46100, i64 %1
  store double %divide.866.1.clone.1, ptr addrspace(1) %162, align 8
  %163 = getelementptr double, ptr addrspace(1) %arg47102, i64 %1
  store double %divide.876.1.clone.1, ptr addrspace(1) %163, align 8
  store double %112, ptr addrspace(1) %110, align 8
  store double %115, ptr addrspace(1) %113, align 8
  store double %add.1040.1.clone.1, ptr addrspace(1) %41, align 8
  store double %118, ptr addrspace(1) %116, align 8
  store double %121, ptr addrspace(1) %119, align 8
  store i32 %126, ptr addrspace(1) %124, align 4
  store double %129, ptr addrspace(1) %127, align 8
  %164 = getelementptr double, ptr addrspace(1) %arg48104, i64 %1
  store double %130, ptr addrspace(1) %164, align 8
  store double %133, ptr addrspace(1) %131, align 8
  store double %136, ptr addrspace(1) %134, align 8
  store double %139, ptr addrspace(1) %137, align 8
  store double %142, ptr addrspace(1) %140, align 8
  store double %145, ptr addrspace(1) %143, align 8
  store double %148, ptr addrspace(1) %146, align 8
  store double %151, ptr addrspace(1) %149, align 8
  store double %154, ptr addrspace(1) %152, align 8
  store double %157, ptr addrspace(1) %155, align 8
  %165 = getelementptr i8, ptr addrspace(1) %arg49106, i64 %1
  store i8 %88, ptr addrspace(1) %165, align 1
  %166 = getelementptr double, ptr addrspace(1) %arg50108, i64 %1
  store double %divide.863.1.clone.1, ptr addrspace(1) %166, align 8
  %167 = getelementptr double, ptr addrspace(1) %arg51110, i64 %1
  store double %divide.862.1.clone.1, ptr addrspace(1) %167, align 8
  %168 = getelementptr double, ptr addrspace(1) %arg52112, i64 %1
  store double %divide.874.1.clone.1, ptr addrspace(1) %168, align 8
  %169 = getelementptr double, ptr addrspace(1) %arg53114, i64 %1
  store double %divide.871.1.clone.1, ptr addrspace(1) %169, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_40(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1332 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1332, 0
  %2 = add i64 %param_2.1332, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1332
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.15415 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !185
  %7 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %param_1.15415, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg7) local_unnamed_addr #2 {
entry:
  %arg726 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_6.604 = load i64, ptr addrspace(1) %arg624, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_6.604, 0
  %2 = add i64 %param_6.604, 192
  %3 = select i1 %1, i64 %2, i64 %param_6.604
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.15534 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg726, i64 %thread_id_x
  %param_7.5035 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg420, i64 %thread_id_x
  %param_4.9826 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.8637 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %multiply.3518.34 = fmul double %param_4.9826, %param_5.8637
  %multiply.3525.17 = fmul double %param_7.5035, %multiply.3518.34
  %multiply.3530.7 = fmul double %multiply.3525.17, %multiply.3525.17
  %multiply.3531.9 = fmul double %multiply.3530.7, 5.000000e-01
  %10 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.11428 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %multiply.3532.7 = fmul double %param_3.11428, %multiply.3530.7
  %add.1045.7 = fadd double %multiply.3531.9, %multiply.3532.7
  %multiply.3533.13 = fmul double %param_7.5035, %param_7.5035
  %multiply.3534.11 = fmul double %multiply.3533.13, 5.000000e-01
  %multiply.3535.7 = fmul double %multiply.3534.11, %multiply.3518.34
  %multiply.3536.7 = fmul double %param_3.11428, %multiply.3535.7
  %subtract.148.7 = fsub double %add.1045.7, %multiply.3536.7
  %11 = getelementptr i64, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.134511 = load i64, ptr addrspace(1) %11, align 8, !invariant.load !185
  %12 = sitofp i64 %param_2.134511 to double
  %multiply.3537.5 = fmul double %subtract.148.7, %12
  %add.1046.5 = fadd double %param_1.15534, %multiply.3537.5
  %compare.380.7 = fcmp ogt double %add.1046.5, 1.000000e-128
  %13 = zext i1 %compare.380.7 to i8
  %14 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store i8 %13, ptr addrspace(1) %14, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1471 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1471, 0
  %2 = add i64 %param_1.1471, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1471
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.12624 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %param_4.898 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg420, i64 0, i64 %5
  %param_4.89810 = load double, ptr addrspace(1) %param_4.898, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.109011 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %8 = tail call double @llvm.fma.f64(double %param_3.109011, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #5
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #5
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %param_3.109011)
  %12 = tail call double @llvm.fma.f64(double %10, double 0xBC7ABC9E3B39803F, double %11)
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %14 = tail call double @llvm.fma.f64(double %13, double %12, double 0x3EC71DEE62401315)
  %15 = tail call double @llvm.fma.f64(double %14, double %12, double 0x3EFA01997C89EB71)
  %16 = tail call double @llvm.fma.f64(double %15, double %12, double 0x3F2A01A014761F65)
  %17 = tail call double @llvm.fma.f64(double %16, double %12, double 0x3F56C16C1852B7AF)
  %18 = tail call double @llvm.fma.f64(double %17, double %12, double 0x3F81111111122322)
  %19 = tail call double @llvm.fma.f64(double %18, double %12, double 0x3FA55555555502A1)
  %20 = tail call double @llvm.fma.f64(double %19, double %12, double 0x3FC5555555555511)
  %21 = tail call double @llvm.fma.f64(double %20, double %12, double 0x3FE000000000000B)
  %22 = tail call double @llvm.fma.f64(double %21, double %12, double 1.000000e+00)
  %23 = tail call double @llvm.fma.f64(double %22, double %12, double 1.000000e+00)
  %24 = tail call i32 @llvm.nvvm.d2i.lo(double %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %23) #5
  %26 = shl i32 %9, 20
  %27 = add i32 %25, %26
  %28 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %param_3.109011) #5
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #5
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %param_3.109011, 0.000000e+00
  %34 = fadd double %param_3.109011, 0x7FF0000000000000
  %z.0.i = select i1 %33, double 0.000000e+00, double %34
  %35 = fcmp olt float %31, 0x4010E90000000000
  br i1 %35, label %36, label %__nv_exp.exit

36:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %37 = sdiv i32 %9, 2
  %38 = shl i32 %37, 20
  %39 = add i32 %25, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %39) #5
  %41 = sub nsw i32 %9, %37
  %42 = shl i32 %41, 20
  %43 = add nsw i32 %42, 1072693248
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %43) #5
  %45 = fmul double %44, %40
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %36
  %z.2.i = phi double [ %28, %entry ], [ %45, %36 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3524.27 = fmul double %param_4.89810, %z.2.i
  %add.1044.9 = fadd double %param_2.12624, %multiply.3524.27
  %multiply.3578.6 = fmul double %add.1044.9, %add.1044.9
  %divide.879.3 = fdiv double 1.000000e+00, %multiply.3578.6
  %46 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.879.3, ptr addrspace(1) %46, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_57(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1542 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_1.1542, 0
  %2 = add i64 %param_1.1542, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1542
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.13334 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %multiply.3527.15 = fmul double %param_2.13334, 2.000000e+00
  %divide.868.7 = fdiv double 1.000000e+00, %multiply.3527.15
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.868.7, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_56(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5) local_unnamed_addr #2 {
entry:
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1335 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_2.1335, 0
  %2 = add i64 %param_2.1335, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1335
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg518, i64 %thread_id_x
  %param_5.8134 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.11325 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg416, i64 %thread_id_x
  %param_4.9306 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3518.22 = fmul double %param_3.11325, %param_4.9306
  %multiply.3525.5 = fmul double %param_5.8134, %multiply.3518.22
  %9 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.15447 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %multiply.3526.3 = fmul double %param_1.15447, %multiply.3525.5
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3526.3, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_63(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8) local_unnamed_addr #2 {
entry:
  %arg831 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.923 = load i64, ptr addrspace(1) %arg423, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_4.923, 0
  %2 = add i64 %param_4.923, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.923
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg729, i64 %thread_id_x
  %param_7.4514 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg831, i64 %thread_id_x
  %param_8.3745 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %multiply.3498.11 = fmul double %param_7.4514, %param_8.3745
  %param_6.554 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg627, i64 0, i64 %5
  %param_6.55411 = load double, ptr addrspace(1) %param_6.554, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg525, i64 %thread_id_x
  %param_5.80812 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3499.13 = fmul double %param_6.55411, %param_5.80812
  %add.1031.11 = fadd double %multiply.3498.11, %multiply.3499.13
  %9 = getelementptr double, ptr addrspace(1) %arg117, i64 %thread_id_x
  %param_1.153013 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %10 = getelementptr double, ptr addrspace(1) %arg219, i64 %thread_id_x
  %param_2.132114 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %param_3.1123 = load double, ptr addrspace(1) %arg321, align 128, !invariant.load !185
  %multiply.3516.23 = fmul double %param_2.132114, %param_3.1123
  %multiply.3517.9 = fmul double %param_1.153013, %multiply.3516.23
  %add.1038.9 = fadd double %add.1031.11, %multiply.3517.9
  %subtract.147.1 = fsub double %add.1038.9, %add.1031.11
  %multiply.3520.3 = fmul double %subtract.147.1, %subtract.147.1
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg015, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3520.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_62(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8) local_unnamed_addr #2 {
entry:
  %arg831 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.971 = load i64, ptr addrspace(1) %arg423, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_4.971, 0
  %2 = add i64 %param_4.971, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.971
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg729, i64 %thread_id_x
  %param_7.4904 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg831, i64 %thread_id_x
  %param_8.4145 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %multiply.3498.17 = fmul double %param_7.4904, %param_8.4145
  %param_6.595 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg627, i64 0, i64 %5
  %param_6.59511 = load double, ptr addrspace(1) %param_6.595, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg525, i64 %thread_id_x
  %param_5.85412 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3499.19 = fmul double %param_6.59511, %param_5.85412
  %add.1031.17 = fadd double %multiply.3498.17, %multiply.3499.19
  %9 = getelementptr double, ptr addrspace(1) %arg117, i64 %thread_id_x
  %param_1.156213 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %10 = getelementptr double, ptr addrspace(1) %arg219, i64 %thread_id_x
  %param_2.136614 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %param_3.1172 = load double, ptr addrspace(1) %arg321, align 128, !invariant.load !185
  %multiply.3516.29 = fmul double %param_2.136614, %param_3.1172
  %multiply.3517.15 = fmul double %param_1.156213, %multiply.3516.29
  %add.1038.15 = fadd double %add.1031.17, %multiply.3517.15
  %subtract.147.4 = fsub double %add.1038.15, %add.1031.17
  %multiply.3555.3 = fmul double %subtract.147.4, 2.000000e+00
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg015, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3555.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_65(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !188
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1118 = load i64, ptr addrspace(1) %arg311, align 128, !invariant.load !185
  %1 = icmp slt i64 %param_3.1118, 0
  %2 = add i64 %param_3.1118, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.1118
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15234 = load double, ptr addrspace(1) %6, align 8, !invariant.load !185
  %param_2.1314 = load double, ptr addrspace(1) %arg29, align 128, !invariant.load !185
  %multiply.3516.7 = fmul double %param_1.15234, %param_2.1314
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3516.7, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg8) local_unnamed_addr #2 {
entry:
  %arg833 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg731 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg629 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg527 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg425 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg323 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg221 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg017 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_2.1368 = load i64, ptr addrspace(1) %arg221, align 128, !invariant.load !185
  %2 = icmp slt i64 %param_2.1368, 0
  %3 = add i64 %param_2.1368, 192
  %4 = select i1 %2, i64 %3, i64 %param_2.1368
  %5 = tail call i64 @llvm.smax.i64(i64 %4, i64 0)
  %6 = tail call i64 @llvm.umin.i64(i64 %5, i64 191)
  %7 = getelementptr double, ptr addrspace(1) %arg731, i64 %thread_id_x
  %param_7.4925 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %param_6.597 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg629, i64 0, i64 %1
  %param_6.5976 = load double, ptr addrspace(1) %param_6.597, align 8, !invariant.load !185
  %param_8.416 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg833, i64 0, i64 %6
  %param_8.41612 = load double, ptr addrspace(1) %param_8.416, align 8, !invariant.load !185
  %param_5.856 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg527, i64 0, i64 %1
  %param_5.85613 = load double, ptr addrspace(1) %param_5.856, align 8, !invariant.load !185
  %8 = tail call double @llvm.fma.f64(double %param_5.85613, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #5
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #5
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %param_5.85613)
  %12 = tail call double @llvm.fma.f64(double %10, double 0xBC7ABC9E3B39803F, double %11)
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %14 = tail call double @llvm.fma.f64(double %13, double %12, double 0x3EC71DEE62401315)
  %15 = tail call double @llvm.fma.f64(double %14, double %12, double 0x3EFA01997C89EB71)
  %16 = tail call double @llvm.fma.f64(double %15, double %12, double 0x3F2A01A014761F65)
  %17 = tail call double @llvm.fma.f64(double %16, double %12, double 0x3F56C16C1852B7AF)
  %18 = tail call double @llvm.fma.f64(double %17, double %12, double 0x3F81111111122322)
  %19 = tail call double @llvm.fma.f64(double %18, double %12, double 0x3FA55555555502A1)
  %20 = tail call double @llvm.fma.f64(double %19, double %12, double 0x3FC5555555555511)
  %21 = tail call double @llvm.fma.f64(double %20, double %12, double 0x3FE000000000000B)
  %22 = tail call double @llvm.fma.f64(double %21, double %12, double 1.000000e+00)
  %23 = tail call double @llvm.fma.f64(double %22, double %12, double 1.000000e+00)
  %24 = tail call i32 @llvm.nvvm.d2i.lo(double %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %23) #5
  %26 = shl i32 %9, 20
  %27 = add i32 %25, %26
  %28 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %param_5.85613) #5
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #5
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %param_5.85613, 0.000000e+00
  %34 = fadd double %param_5.85613, 0x7FF0000000000000
  %z.0.i = select i1 %33, double 0.000000e+00, double %34
  %35 = fcmp olt float %31, 0x4010E90000000000
  br i1 %35, label %36, label %__nv_exp.exit

36:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %37 = sdiv i32 %9, 2
  %38 = shl i32 %37, 20
  %39 = add i32 %25, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %39) #5
  %41 = sub nsw i32 %9, %37
  %42 = shl i32 %41, 20
  %43 = add nsw i32 %42, 1072693248
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %43) #5
  %45 = fmul double %44, %40
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %36
  %z.2.i = phi double [ %28, %entry ], [ %45, %36 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %46 = lshr i64 %thread_id_x, 2
  %multiply.3524.39 = fmul double %param_8.41612, %z.2.i
  %compare.377.11 = fcmp ogt double %multiply.3524.39, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg425, i64 %thread_id_x
  %param_4.97314 = load double, ptr addrspace(1) %47, align 8, !invariant.load !185
  %multiply.3561.29 = fmul double %z.2.i, %param_4.97314
  %multiply.3562.25 = fmul double %param_8.41612, %multiply.3561.29
  %48 = select i1 %compare.377.11, double %multiply.3562.25, double 0.000000e+00
  %49 = fmul double %param_7.4925, %param_6.5976
  %add.1055.23 = fsub double %48, %49
  %50 = fneg double %add.1055.23
  %param_3.1174 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg323, i64 0, i64 %1
  %param_3.117415 = load double, ptr addrspace(1) %param_3.1174, align 8, !invariant.load !185
  %multiply.3564.15 = fmul double %param_3.117415, %50
  %51 = fmul double %multiply.3564.15, -2.000000e+00
  %param_1.1505 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg119, i64 0, i64 %1
  %param_1.150516 = load double, ptr addrspace(1) %param_1.1505, align 8, !invariant.load !185
  %multiply.3572.3 = fmul double %param_1.150516, %51
  %52 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg017, i64 0, i64 %6, i64 %46, i64 %1
  store double %multiply.3572.3, ptr addrspace(1) %52, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg8) local_unnamed_addr #2 {
entry:
  %arg833 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg731 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg629 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg527 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg425 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg323 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg221 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg017 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_1.1457 = load i64, ptr addrspace(1) %arg119, align 128, !invariant.load !185
  %2 = icmp slt i64 %param_1.1457, 0
  %3 = add i64 %param_1.1457, 192
  %4 = select i1 %2, i64 %3, i64 %param_1.1457
  %5 = tail call i64 @llvm.smax.i64(i64 %4, i64 0)
  %6 = tail call i64 @llvm.umin.i64(i64 %5, i64 191)
  %7 = getelementptr double, ptr addrspace(1) %arg629, i64 %thread_id_x
  %param_6.5885 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %param_5.848 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg527, i64 0, i64 %1
  %param_5.8486 = load double, ptr addrspace(1) %param_5.848, align 8, !invariant.load !185
  %param_8.407 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg833, i64 0, i64 %6
  %param_8.40712 = load double, ptr addrspace(1) %param_8.407, align 8, !invariant.load !185
  %param_4.963 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg425, i64 0, i64 %1
  %param_4.96313 = load double, ptr addrspace(1) %param_4.963, align 8, !invariant.load !185
  %8 = tail call double @llvm.fma.f64(double %param_4.96313, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #5
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #5
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %param_4.96313)
  %12 = tail call double @llvm.fma.f64(double %10, double 0xBC7ABC9E3B39803F, double %11)
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %14 = tail call double @llvm.fma.f64(double %13, double %12, double 0x3EC71DEE62401315)
  %15 = tail call double @llvm.fma.f64(double %14, double %12, double 0x3EFA01997C89EB71)
  %16 = tail call double @llvm.fma.f64(double %15, double %12, double 0x3F2A01A014761F65)
  %17 = tail call double @llvm.fma.f64(double %16, double %12, double 0x3F56C16C1852B7AF)
  %18 = tail call double @llvm.fma.f64(double %17, double %12, double 0x3F81111111122322)
  %19 = tail call double @llvm.fma.f64(double %18, double %12, double 0x3FA55555555502A1)
  %20 = tail call double @llvm.fma.f64(double %19, double %12, double 0x3FC5555555555511)
  %21 = tail call double @llvm.fma.f64(double %20, double %12, double 0x3FE000000000000B)
  %22 = tail call double @llvm.fma.f64(double %21, double %12, double 1.000000e+00)
  %23 = tail call double @llvm.fma.f64(double %22, double %12, double 1.000000e+00)
  %24 = tail call i32 @llvm.nvvm.d2i.lo(double %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %23) #5
  %26 = shl i32 %9, 20
  %27 = add i32 %25, %26
  %28 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %param_4.96313) #5
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #5
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %param_4.96313, 0.000000e+00
  %34 = fadd double %param_4.96313, 0x7FF0000000000000
  %z.0.i = select i1 %33, double 0.000000e+00, double %34
  %35 = fcmp olt float %31, 0x4010E90000000000
  br i1 %35, label %36, label %__nv_exp.exit

36:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %37 = sdiv i32 %9, 2
  %38 = shl i32 %37, 20
  %39 = add i32 %25, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %39) #5
  %41 = sub nsw i32 %9, %37
  %42 = shl i32 %41, 20
  %43 = add nsw i32 %42, 1072693248
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %43) #5
  %45 = fmul double %44, %40
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %36
  %z.2.i = phi double [ %28, %entry ], [ %45, %36 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %46 = lshr i64 %thread_id_x, 2
  %multiply.3524.41 = fmul double %param_8.40712, %z.2.i
  %compare.377.13 = fcmp ogt double %multiply.3524.41, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg323, i64 %thread_id_x
  %param_3.116114 = load double, ptr addrspace(1) %47, align 8, !invariant.load !185
  %multiply.3561.15 = fmul double %z.2.i, %param_3.116114
  %multiply.3562.11 = fmul double %param_8.40712, %multiply.3561.15
  %48 = select i1 %compare.377.13, double %multiply.3562.11, double 0.000000e+00
  %49 = fmul double %param_6.5885, %param_5.8486
  %add.1055.9 = fsub double %48, %49
  %param_2.1358 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg221, i64 0, i64 %1
  %param_2.135815 = load double, ptr addrspace(1) %param_2.1358, align 8, !invariant.load !185
  %param_7.484 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg731, i64 0, i64 %1
  %param_7.48416 = load double, ptr addrspace(1) %param_7.484, align 8, !invariant.load !185
  %50 = select i1 %compare.377.13, double %multiply.3524.41, double %param_7.48416
  %add.1042.5 = fadd double %param_2.135815, %50
  %multiply.3563.4 = fmul double %add.1042.5, %add.1042.5
  %multiply.3600.3 = fmul double %add.1042.5, %multiply.3563.4
  %divide.881.3 = fdiv double 1.000000e+00, %multiply.3600.3
  %multiply.3601.5 = fmul double %divide.881.3, -2.000000e+00
  %multiply.3602.3 = fmul double %add.1055.9, %multiply.3601.5
  %51 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg017, i64 0, i64 %6, i64 %46, i64 %1
  store double %multiply.3602.3, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg8) local_unnamed_addr #2 {
entry:
  %arg834 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg732 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_1.1487 = load i64, ptr addrspace(1) %arg120, align 128, !invariant.load !185
  %2 = icmp slt i64 %param_1.1487, 0
  %3 = add i64 %param_1.1487, 192
  %4 = select i1 %2, i64 %3, i64 %param_1.1487
  %5 = tail call i64 @llvm.smax.i64(i64 %4, i64 0)
  %6 = tail call i64 @llvm.umin.i64(i64 %5, i64 191)
  %param_4.976 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg426, i64 0, i64 %1
  %param_4.9765 = load i64, ptr addrspace(1) %param_4.976, align 8, !invariant.load !185
  %7 = getelementptr double, ptr addrspace(1) %arg630, i64 %thread_id_x
  %param_6.6017 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %param_5.860 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg528, i64 0, i64 %1
  %param_5.8608 = load double, ptr addrspace(1) %param_5.860, align 8, !invariant.load !185
  %param_8.423 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg834, i64 0, i64 %6
  %param_8.42314 = load double, ptr addrspace(1) %param_8.423, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg324, i64 %thread_id_x
  %param_3.116015 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %param_2.1357 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg222, i64 0, i64 %1
  %param_2.135716 = load double, ptr addrspace(1) %param_2.1357, align 8, !invariant.load !185
  %9 = tail call double @llvm.fma.f64(double %param_2.135716, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %10 = tail call i32 @llvm.nvvm.d2i.lo(double %9) #5
  %11 = tail call double @llvm.nvvm.add.rn.d(double %9, double 0xC338000000000000) #5
  %12 = tail call double @llvm.fma.f64(double %11, double 0xBFE62E42FEFA39EF, double %param_2.135716)
  %13 = tail call double @llvm.fma.f64(double %11, double 0xBC7ABC9E3B39803F, double %12)
  %14 = tail call double @llvm.fma.f64(double %13, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %15 = tail call double @llvm.fma.f64(double %14, double %13, double 0x3EC71DEE62401315)
  %16 = tail call double @llvm.fma.f64(double %15, double %13, double 0x3EFA01997C89EB71)
  %17 = tail call double @llvm.fma.f64(double %16, double %13, double 0x3F2A01A014761F65)
  %18 = tail call double @llvm.fma.f64(double %17, double %13, double 0x3F56C16C1852B7AF)
  %19 = tail call double @llvm.fma.f64(double %18, double %13, double 0x3F81111111122322)
  %20 = tail call double @llvm.fma.f64(double %19, double %13, double 0x3FA55555555502A1)
  %21 = tail call double @llvm.fma.f64(double %20, double %13, double 0x3FC5555555555511)
  %22 = tail call double @llvm.fma.f64(double %21, double %13, double 0x3FE000000000000B)
  %23 = tail call double @llvm.fma.f64(double %22, double %13, double 1.000000e+00)
  %24 = tail call double @llvm.fma.f64(double %23, double %13, double 1.000000e+00)
  %25 = tail call i32 @llvm.nvvm.d2i.lo(double %24) #5
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %24) #5
  %27 = shl i32 %10, 20
  %28 = add i32 %26, %27
  %29 = tail call double @llvm.nvvm.lohi.i2d(i32 %25, i32 %28) #5
  %30 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.135716) #5
  %31 = bitcast i32 %30 to float
  %32 = tail call float @llvm.nvvm.fabs.f(float %31) #5
  %33 = fcmp olt float %32, 0x4010C46560000000
  br i1 %33, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %34 = fcmp olt double %param_2.135716, 0.000000e+00
  %35 = fadd double %param_2.135716, 0x7FF0000000000000
  %z.0.i = select i1 %34, double 0.000000e+00, double %35
  %36 = fcmp olt float %32, 0x4010E90000000000
  br i1 %36, label %37, label %__nv_exp.exit

37:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %38 = sdiv i32 %10, 2
  %39 = shl i32 %38, 20
  %40 = add i32 %26, %39
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 %25, i32 %40) #5
  %42 = sub nsw i32 %10, %38
  %43 = shl i32 %42, 20
  %44 = add nsw i32 %43, 1072693248
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %44) #5
  %46 = fmul double %45, %41
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %37
  %z.2.i = phi double [ %29, %entry ], [ %46, %37 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %.not = icmp eq i64 %param_4.9765, 0
  %47 = select i1 %.not, double %param_3.116015, double 0.000000e+00
  %param_6.6017.neg = fneg double %param_6.6017
  %48 = select i1 %.not, double %param_6.6017.neg, double -0.000000e+00
  %multiply.3575.13 = fmul double %48, %param_5.8608
  %49 = lshr i64 %thread_id_x, 2
  %multiply.3576.9 = fmul double %47, %z.2.i
  %multiply.3577.6 = fmul double %param_8.42314, %multiply.3576.9
  %add.1061.11 = fadd double %multiply.3575.13, %multiply.3577.6
  %param_7.500 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg732, i64 0, i64 %1
  %param_7.50017 = load double, ptr addrspace(1) %param_7.500, align 8, !invariant.load !185
  %multiply.3524.13 = fmul double %param_8.42314, %z.2.i
  %add.1044.7 = fadd double %param_7.50017, %multiply.3524.13
  %multiply.3578.4 = fmul double %add.1044.7, %add.1044.7
  %multiply.3620.3 = fmul double %add.1044.7, %multiply.3578.4
  %divide.887.3 = fdiv double 1.000000e+00, %multiply.3620.3
  %multiply.3621.5 = fmul double %divide.887.3, -2.000000e+00
  %multiply.3622.3 = fmul double %add.1061.11, %multiply.3621.5
  %50 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg018, i64 0, i64 %6, i64 %49, i64 %1
  store double %multiply.3622.3, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg8) local_unnamed_addr #2 {
entry:
  %arg833 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg731 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg629 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg527 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg425 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg323 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg221 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg017 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_1.1498 = load i64, ptr addrspace(1) %arg119, align 128, !invariant.load !185
  %2 = icmp slt i64 %param_1.1498, 0
  %3 = add i64 %param_1.1498, 192
  %4 = select i1 %2, i64 %3, i64 %param_1.1498
  %5 = tail call i64 @llvm.smax.i64(i64 %4, i64 0)
  %6 = tail call i64 @llvm.umin.i64(i64 %5, i64 191)
  %7 = getelementptr double, ptr addrspace(1) %arg731, i64 %thread_id_x
  %param_7.5075 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %param_6.608 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg629, i64 0, i64 %1
  %param_6.6086 = load double, ptr addrspace(1) %param_6.608, align 8, !invariant.load !185
  %param_8.427 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg833, i64 0, i64 %6
  %param_8.42712 = load double, ptr addrspace(1) %param_8.427, align 8, !invariant.load !185
  %param_5.866 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg527, i64 0, i64 %1
  %param_5.86613 = load double, ptr addrspace(1) %param_5.866, align 8, !invariant.load !185
  %8 = tail call double @llvm.fma.f64(double %param_5.86613, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #5
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #5
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %param_5.86613)
  %12 = tail call double @llvm.fma.f64(double %10, double 0xBC7ABC9E3B39803F, double %11)
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %14 = tail call double @llvm.fma.f64(double %13, double %12, double 0x3EC71DEE62401315)
  %15 = tail call double @llvm.fma.f64(double %14, double %12, double 0x3EFA01997C89EB71)
  %16 = tail call double @llvm.fma.f64(double %15, double %12, double 0x3F2A01A014761F65)
  %17 = tail call double @llvm.fma.f64(double %16, double %12, double 0x3F56C16C1852B7AF)
  %18 = tail call double @llvm.fma.f64(double %17, double %12, double 0x3F81111111122322)
  %19 = tail call double @llvm.fma.f64(double %18, double %12, double 0x3FA55555555502A1)
  %20 = tail call double @llvm.fma.f64(double %19, double %12, double 0x3FC5555555555511)
  %21 = tail call double @llvm.fma.f64(double %20, double %12, double 0x3FE000000000000B)
  %22 = tail call double @llvm.fma.f64(double %21, double %12, double 1.000000e+00)
  %23 = tail call double @llvm.fma.f64(double %22, double %12, double 1.000000e+00)
  %24 = tail call i32 @llvm.nvvm.d2i.lo(double %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %23) #5
  %26 = shl i32 %9, 20
  %27 = add i32 %25, %26
  %28 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %param_5.86613) #5
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #5
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %param_5.86613, 0.000000e+00
  %34 = fadd double %param_5.86613, 0x7FF0000000000000
  %z.0.i = select i1 %33, double 0.000000e+00, double %34
  %35 = fcmp olt float %31, 0x4010E90000000000
  br i1 %35, label %36, label %__nv_exp.exit

36:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %37 = sdiv i32 %9, 2
  %38 = shl i32 %37, 20
  %39 = add i32 %25, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %39) #5
  %41 = sub nsw i32 %9, %37
  %42 = shl i32 %41, 20
  %43 = add nsw i32 %42, 1072693248
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %43) #5
  %45 = fmul double %44, %40
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %36
  %z.2.i = phi double [ %28, %entry ], [ %45, %36 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %46 = lshr i64 %thread_id_x, 2
  %multiply.3524.55 = fmul double %param_8.42712, %z.2.i
  %compare.377.27 = fcmp ogt double %multiply.3524.55, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg425, i64 %thread_id_x
  %param_4.98614 = load double, ptr addrspace(1) %47, align 8, !invariant.load !185
  %multiply.3561.25 = fmul double %z.2.i, %param_4.98614
  %multiply.3562.21 = fmul double %param_8.42712, %multiply.3561.25
  %48 = select i1 %compare.377.27, double %multiply.3562.21, double 0.000000e+00
  %49 = fmul double %param_7.5075, %param_6.6086
  %add.1055.19 = fsub double %48, %49
  %50 = fneg double %add.1055.19
  %param_3.1187 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg323, i64 0, i64 %1
  %param_3.118715 = load double, ptr addrspace(1) %param_3.1187, align 8, !invariant.load !185
  %multiply.3564.11 = fmul double %param_3.118715, %50
  %param_2.1380 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg221, i64 0, i64 %1
  %param_2.138016 = load double, ptr addrspace(1) %param_2.1380, align 8, !invariant.load !185
  %multiply.3527.9 = fmul double %param_2.138016, 2.000000e+00
  %multiply.3571.4 = fmul double %multiply.3527.9, %multiply.3527.9
  %multiply.3616.3 = fmul double %multiply.3527.9, %multiply.3571.4
  %divide.886.3 = fdiv double 1.000000e+00, %multiply.3616.3
  %multiply.3617.3 = fmul double %divide.886.3, -4.000000e+00
  %multiply.3618.3 = fmul double %multiply.3564.11, %multiply.3617.3
  %51 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg017, i64 0, i64 %6, i64 %46, i64 %1
  store double %multiply.3618.3, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_36(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg7) local_unnamed_addr #2 {
entry:
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = and i64 %thread_id_x, 3
  %param_1.1469 = load i64, ptr addrspace(1) %arg118, align 128, !invariant.load !185
  %2 = icmp slt i64 %param_1.1469, 0
  %3 = add i64 %param_1.1469, 192
  %4 = select i1 %2, i64 %3, i64 %param_1.1469
  %5 = tail call i64 @llvm.smax.i64(i64 %4, i64 0)
  %6 = tail call i64 @llvm.umin.i64(i64 %5, i64 191)
  %7 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.5855 = load double, ptr addrspace(1) %7, align 8, !invariant.load !185
  %param_5.844 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg526, i64 0, i64 %1
  %param_5.8446 = load double, ptr addrspace(1) %param_5.844, align 8, !invariant.load !185
  %param_7.481 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg730, i64 0, i64 %6
  %param_7.48112 = load double, ptr addrspace(1) %param_7.481, align 8, !invariant.load !185
  %param_4.960 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg424, i64 0, i64 %1
  %param_4.96013 = load double, ptr addrspace(1) %param_4.960, align 8, !invariant.load !185
  %8 = tail call double @llvm.fma.f64(double %param_4.96013, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #5
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #5
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %param_4.96013)
  %12 = tail call double @llvm.fma.f64(double %10, double 0xBC7ABC9E3B39803F, double %11)
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %14 = tail call double @llvm.fma.f64(double %13, double %12, double 0x3EC71DEE62401315)
  %15 = tail call double @llvm.fma.f64(double %14, double %12, double 0x3EFA01997C89EB71)
  %16 = tail call double @llvm.fma.f64(double %15, double %12, double 0x3F2A01A014761F65)
  %17 = tail call double @llvm.fma.f64(double %16, double %12, double 0x3F56C16C1852B7AF)
  %18 = tail call double @llvm.fma.f64(double %17, double %12, double 0x3F81111111122322)
  %19 = tail call double @llvm.fma.f64(double %18, double %12, double 0x3FA55555555502A1)
  %20 = tail call double @llvm.fma.f64(double %19, double %12, double 0x3FC5555555555511)
  %21 = tail call double @llvm.fma.f64(double %20, double %12, double 0x3FE000000000000B)
  %22 = tail call double @llvm.fma.f64(double %21, double %12, double 1.000000e+00)
  %23 = tail call double @llvm.fma.f64(double %22, double %12, double 1.000000e+00)
  %24 = tail call i32 @llvm.nvvm.d2i.lo(double %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %23) #5
  %26 = shl i32 %9, 20
  %27 = add i32 %25, %26
  %28 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %param_4.96013) #5
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #5
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %param_4.96013, 0.000000e+00
  %34 = fadd double %param_4.96013, 0x7FF0000000000000
  %z.0.i = select i1 %33, double 0.000000e+00, double %34
  %35 = fcmp olt float %31, 0x4010E90000000000
  br i1 %35, label %36, label %__nv_exp.exit

36:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %37 = sdiv i32 %9, 2
  %38 = shl i32 %37, 20
  %39 = add i32 %25, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %39) #5
  %41 = sub nsw i32 %9, %37
  %42 = shl i32 %41, 20
  %43 = add nsw i32 %42, 1072693248
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %43) #5
  %45 = fmul double %44, %40
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %36
  %z.2.i = phi double [ %28, %entry ], [ %45, %36 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %46 = lshr i64 %thread_id_x, 2
  %multiply.3524.57 = fmul double %param_7.48112, %z.2.i
  %compare.377.29 = fcmp ogt double %multiply.3524.57, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg322, i64 %thread_id_x
  %param_3.115914 = load double, ptr addrspace(1) %47, align 8, !invariant.load !185
  %multiply.3561.27 = fmul double %z.2.i, %param_3.115914
  %multiply.3562.23 = fmul double %param_7.48112, %multiply.3561.27
  %48 = select i1 %compare.377.29, double %multiply.3562.23, double 0.000000e+00
  %49 = fmul double %param_6.5855, %param_5.8446
  %add.1055.21 = fsub double %48, %49
  %50 = fneg double %add.1055.21
  %param_2.1260 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg220, i64 0, i64 %1
  %param_2.126015 = load double, ptr addrspace(1) %param_2.1260, align 8, !invariant.load !185
  %multiply.3564.13 = fmul double %param_2.126015, %50
  %51 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg016, i64 0, i64 %6, i64 %46, i64 %1
  store double %multiply.3564.13, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_select_fusion(ptr noalias nocapture align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg15, ptr noalias nocapture align 128 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg18, ptr noalias nocapture align 128 dereferenceable(768) %arg19, ptr noalias nocapture align 128 dereferenceable(768) %arg20, ptr noalias nocapture align 128 dereferenceable(768) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg22, ptr noalias nocapture align 128 dereferenceable(768) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg36, ptr noalias nocapture align 128 dereferenceable(768) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg38, ptr noalias nocapture align 128 dereferenceable(768) %arg39, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg43, ptr noalias nocapture align 128 dereferenceable(768) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg45, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg46, ptr noalias nocapture align 128 dereferenceable(768) %arg47, ptr noalias nocapture align 128 dereferenceable(768) %arg48, ptr noalias nocapture align 128 dereferenceable(768) %arg49, ptr noalias nocapture align 128 dereferenceable(768) %arg50, ptr noalias nocapture align 128 dereferenceable(768) %arg51, ptr noalias nocapture align 128 dereferenceable(768) %arg52, ptr noalias nocapture align 128 dereferenceable(768) %arg53, ptr noalias nocapture align 128 dereferenceable(768) %arg54, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg55, ptr noalias nocapture align 128 dereferenceable(768) %arg56, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg57, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg58, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg59, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg60) local_unnamed_addr #2 {
entry:
  %arg60131 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59129 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58127 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57125 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56123 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55121 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54119 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53117 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52115 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51113 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50111 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49109 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48107 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47105 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46103 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45101 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg4499 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg4397 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg4295 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg4193 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg4091 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg3989 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg3887 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg3785 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg3683 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3581 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg3479 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3377 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg3275 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg3173 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3071 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2969 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2867 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2765 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2663 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2561 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2459 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2357 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2255 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2153 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2051 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1949 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1847 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1745 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1643 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1541 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1439 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1337 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1235 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1133 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1031 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg929 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg827 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg725 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg623 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %1 = and i32 %0, 3
  %2 = zext nneg i32 %1 to i64
  %3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %arg113, i64 0, i64 %2
  %4 = load i8, ptr addrspace(1) %3, align 1, !invariant.load !185
  %5 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg419, i64 0, i64 %2
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !185
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg011, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8
  %10 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg215, i64 0, i64 %2
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %12 = load i64, ptr addrspace(1) %arg1439, align 128, !invariant.load !185
  %13 = icmp slt i64 %12, 0
  %14 = add i64 %12, 192
  %15 = select i1 %13, i64 %14, i64 %12
  %16 = trunc i64 %15 to i32
  %17 = tail call i32 @llvm.smax.i32(i32 %16, i32 0)
  %18 = tail call i32 @llvm.umin.i32(i32 %17, i32 191)
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1337, i64 0, i64 %19
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !185
  %22 = getelementptr double, ptr addrspace(1) %arg929, i64 %7
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !185
  %24 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg827, i64 0, i64 %2
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !185
  %26 = tail call double @llvm.fma.f64(double %25, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #5
  %28 = tail call double @llvm.nvvm.add.rn.d(double %26, double 0xC338000000000000) #5
  %29 = tail call double @llvm.fma.f64(double %28, double 0xBFE62E42FEFA39EF, double %25)
  %30 = tail call double @llvm.fma.f64(double %28, double 0xBC7ABC9E3B39803F, double %29)
  %31 = tail call double @llvm.fma.f64(double %30, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %32 = tail call double @llvm.fma.f64(double %31, double %30, double 0x3EC71DEE62401315)
  %33 = tail call double @llvm.fma.f64(double %32, double %30, double 0x3EFA01997C89EB71)
  %34 = tail call double @llvm.fma.f64(double %33, double %30, double 0x3F2A01A014761F65)
  %35 = tail call double @llvm.fma.f64(double %34, double %30, double 0x3F56C16C1852B7AF)
  %36 = tail call double @llvm.fma.f64(double %35, double %30, double 0x3F81111111122322)
  %37 = tail call double @llvm.fma.f64(double %36, double %30, double 0x3FA55555555502A1)
  %38 = tail call double @llvm.fma.f64(double %37, double %30, double 0x3FC5555555555511)
  %39 = tail call double @llvm.fma.f64(double %38, double %30, double 0x3FE000000000000B)
  %40 = tail call double @llvm.fma.f64(double %39, double %30, double 1.000000e+00)
  %41 = tail call double @llvm.fma.f64(double %40, double %30, double 1.000000e+00)
  %42 = tail call i32 @llvm.nvvm.d2i.lo(double %41) #5
  %43 = tail call i32 @llvm.nvvm.d2i.hi(double %41) #5
  %44 = shl i32 %27, 20
  %45 = add i32 %43, %44
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 %42, i32 %45) #5
  %47 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #5
  %48 = bitcast i32 %47 to float
  %49 = tail call float @llvm.nvvm.fabs.f(float %48) #5
  %50 = fcmp olt float %49, 0x4010C46560000000
  br i1 %50, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %51 = fcmp olt double %25, 0.000000e+00
  %52 = fadd double %25, 0x7FF0000000000000
  %z.0.i = select i1 %51, double 0.000000e+00, double %52
  %53 = fcmp olt float %49, 0x4010E90000000000
  br i1 %53, label %54, label %__nv_exp.exit

54:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %55 = sdiv i32 %27, 2
  %56 = shl i32 %55, 20
  %57 = add i32 %43, %56
  %58 = tail call double @llvm.nvvm.lohi.i2d(i32 %42, i32 %57) #5
  %59 = sub nsw i32 %27, %55
  %60 = shl i32 %59, 20
  %61 = add nsw i32 %60, 1072693248
  %62 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %61) #5
  %63 = fmul double %62, %58
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %54
  %z.2.i = phi double [ %46, %entry ], [ %63, %54 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %64 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1235, i64 0, i64 %2
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !185
  %66 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg521, i64 0, i64 %2
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !185
  %68 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg1133, i64 0, i64 %2, i64 0
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !185
  %70 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg623, i64 0, i64 %2
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !185
  %72 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg725, i64 0, i64 %2
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !185
  %74 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg317, i64 0, i64 %2
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !185
  %76 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1031, i64 0, i64 %2
  %77 = load double, ptr addrspace(1) %76, align 8, !invariant.load !185
  %78 = getelementptr double, ptr addrspace(1) %arg1541, i64 %7
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !185
  %80 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4193, i64 0, i64 %2
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !185
  %82 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg4397, i64 0, i64 %2, i64 0
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !185
  %84 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4295, i64 0, i64 %2
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !185
  %multiply.3502.31.clone.1 = fmul double %83, %85
  %add.1033.29.clone.1 = fadd double %81, %multiply.3502.31.clone.1
  %86 = tail call double @llvm.fma.f64(double %add.1033.29.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %87 = tail call i32 @llvm.nvvm.d2i.lo(double %86) #5
  %88 = tail call double @llvm.nvvm.add.rn.d(double %86, double 0xC338000000000000) #5
  %89 = tail call double @llvm.fma.f64(double %88, double 0xBFE62E42FEFA39EF, double %add.1033.29.clone.1)
  %90 = tail call double @llvm.fma.f64(double %88, double 0xBC7ABC9E3B39803F, double %89)
  %91 = tail call double @llvm.fma.f64(double %90, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %92 = tail call double @llvm.fma.f64(double %91, double %90, double 0x3EC71DEE62401315)
  %93 = tail call double @llvm.fma.f64(double %92, double %90, double 0x3EFA01997C89EB71)
  %94 = tail call double @llvm.fma.f64(double %93, double %90, double 0x3F2A01A014761F65)
  %95 = tail call double @llvm.fma.f64(double %94, double %90, double 0x3F56C16C1852B7AF)
  %96 = tail call double @llvm.fma.f64(double %95, double %90, double 0x3F81111111122322)
  %97 = tail call double @llvm.fma.f64(double %96, double %90, double 0x3FA55555555502A1)
  %98 = tail call double @llvm.fma.f64(double %97, double %90, double 0x3FC5555555555511)
  %99 = tail call double @llvm.fma.f64(double %98, double %90, double 0x3FE000000000000B)
  %100 = tail call double @llvm.fma.f64(double %99, double %90, double 1.000000e+00)
  %101 = tail call double @llvm.fma.f64(double %100, double %90, double 1.000000e+00)
  %102 = tail call i32 @llvm.nvvm.d2i.lo(double %101) #5
  %103 = tail call i32 @llvm.nvvm.d2i.hi(double %101) #5
  %104 = shl i32 %87, 20
  %105 = add i32 %103, %104
  %106 = tail call double @llvm.nvvm.lohi.i2d(i32 %102, i32 %105) #5
  %107 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.29.clone.1) #5
  %108 = bitcast i32 %107 to float
  %109 = tail call float @llvm.nvvm.fabs.f(float %108) #5
  %110 = fcmp olt float %109, 0x4010C46560000000
  br i1 %110, label %__nv_exp.exit10, label %__internal_fast_icmp_abs_lt.exit.i7

__internal_fast_icmp_abs_lt.exit.i7:              ; preds = %__nv_exp.exit
  %111 = fcmp olt double %add.1033.29.clone.1, 0.000000e+00
  %112 = fadd double %add.1033.29.clone.1, 0x7FF0000000000000
  %z.0.i8 = select i1 %111, double 0.000000e+00, double %112
  %113 = fcmp olt float %109, 0x4010E90000000000
  br i1 %113, label %114, label %__nv_exp.exit10

114:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i7
  %115 = sdiv i32 %87, 2
  %116 = shl i32 %115, 20
  %117 = add i32 %103, %116
  %118 = tail call double @llvm.nvvm.lohi.i2d(i32 %102, i32 %117) #5
  %119 = sub nsw i32 %87, %115
  %120 = shl i32 %119, 20
  %121 = add nsw i32 %120, 1072693248
  %122 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %121) #5
  %123 = fmul double %122, %118
  br label %__nv_exp.exit10

__nv_exp.exit10:                                  ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i7, %114
  %z.2.i9 = phi double [ %106, %__nv_exp.exit ], [ %123, %114 ], [ %z.0.i8, %__internal_fast_icmp_abs_lt.exit.i7 ]
  %.not = icmp eq i64 %6, 0
  %124 = select i1 %.not, double 0.000000e+00, double %79
  %multiply.3518.20 = fmul double %71, %73
  %multiply.3580.7 = fmul double %multiply.3518.20, %124
  %.neg = fneg double %9
  %multiply.3560.15 = fmul double %11, %.neg
  %multiply.3524.29 = fmul double %21, %z.2.i
  %compare.377.25 = fcmp ogt double %multiply.3524.29, 1.000000e-128
  %multiply.3561.21 = fmul double %23, %z.2.i
  %multiply.3562.17 = fmul double %21, %multiply.3561.21
  %125 = select i1 %compare.377.25, double %multiply.3562.17, double 0.000000e+00
  %add.1055.15 = fadd double %multiply.3560.15, %125
  %126 = fneg double %add.1055.15
  %multiply.3564.7 = fmul double %77, %126
  %127 = select i1 %.not, double 0.000000e+00, double %multiply.3564.7
  %multiply.3525.3 = fmul double %69, %multiply.3518.20
  %multiply.3530.9 = fmul double %multiply.3525.3, %multiply.3525.3
  %multiply.3531.11 = fmul double %multiply.3530.9, 5.000000e-01
  %multiply.3532.9 = fmul double %75, %multiply.3530.9
  %add.1045.9 = fadd double %multiply.3531.11, %multiply.3532.9
  %multiply.3533.11 = fmul double %69, %69
  %multiply.3534.9 = fmul double %multiply.3533.11, 5.000000e-01
  %multiply.3535.9 = fmul double %multiply.3534.9, %multiply.3518.20
  %multiply.3536.9 = fmul double %75, %multiply.3535.9
  %subtract.148.9 = fsub double %add.1045.9, %multiply.3536.9
  %128 = sitofp i64 %6 to double
  %multiply.3537.7 = fmul double %subtract.148.9, %128
  %add.1046.7 = fadd double %67, %multiply.3537.7
  %compare.380.3 = fcmp ogt double %add.1046.7, 1.000000e-128
  %add.1044.11 = fadd double %65, %multiply.3524.29
  %multiply.3578.8 = fmul double %add.1044.11, %add.1044.11
  %divide.879.5 = fdiv double 1.000000e+00, %multiply.3578.8
  %129 = select i1 %.not, double %.neg, double -0.000000e+00
  %multiply.3575.11 = fmul double %129, %11
  %130 = select i1 %.not, double %23, double 0.000000e+00
  %multiply.3576.7 = fmul double %130, %z.2.i
  %multiply.3577.4 = fmul double %21, %multiply.3576.7
  %add.1061.9 = fadd double %multiply.3575.11, %multiply.3577.4
  %131 = fneg double %add.1061.9
  %multiply.3579.3 = fmul double %divide.879.5, %131
  %multiply.3503.13.clone.1 = fmul double %21, %z.2.i9
  %compare.375.9.clone.1 = fcmp ogt double %multiply.3503.13.clone.1, 1.000000e-128
  %132 = getelementptr double, ptr addrspace(1) %arg4091, i64 %7
  %133 = load double, ptr addrspace(1) %132, align 8, !invariant.load !185
  %134 = getelementptr double, ptr addrspace(1) %arg1643, i64 %7
  %135 = load double, ptr addrspace(1) %134, align 8
  %multiply.3510.7.clone.1 = fmul double %83, %135
  %add.1036.7.clone.1 = fadd double %133, %multiply.3510.7.clone.1
  %multiply.3511.7.clone.1 = fmul double %z.2.i9, %add.1036.7.clone.1
  %multiply.3512.3.clone.1 = fmul double %21, %multiply.3511.7.clone.1
  %136 = select i1 %compare.375.9.clone.1, double %multiply.3512.3.clone.1, double 0.000000e+00
  %multiply.3550.3.clone.1 = fmul double %73, %136
  %137 = getelementptr double, ptr addrspace(1) %arg3275, i64 %7
  %138 = load double, ptr addrspace(1) %137, align 8, !invariant.load !185
  %multiply.3551.1.clone.1 = fmul double %71, %138
  %add.1051.1.clone.1 = fadd double %multiply.3551.1.clone.1, %multiply.3550.3.clone.1
  %139 = select i1 %.not, double 0.000000e+00, double %add.1051.1.clone.1
  %multiply.3581.7 = fmul double %69, %139
  %add.1062.5 = fadd double %multiply.3580.7, %multiply.3581.7
  %multiply.3582.9 = fmul double %multiply.3525.3, 2.000000e+00
  %multiply.3583.5 = fmul double %multiply.3582.9, %add.1062.5
  %multiply.3584.3 = fmul double %multiply.3583.5, 5.000000e-01
  %multiply.3585.3 = fmul double %75, %multiply.3583.5
  %140 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3887, i64 0, i64 %2
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !185
  %divide.875.3.clone.1 = fdiv double %138, %141
  %142 = getelementptr double, ptr addrspace(1) %arg3785, i64 %7
  %143 = load double, ptr addrspace(1) %142, align 8
  %144 = fneg double %143
  %multiply.3552.3.clone.1 = fmul double %73, %144
  %145 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3683, i64 0, i64 %2
  %146 = load double, ptr addrspace(1) %145, align 8, !invariant.load !185
  %multiply.3553.5.clone.1 = fmul double %multiply.3552.3.clone.1, %146
  %add.1052.3.clone.1 = fadd double %divide.875.3.clone.1, %multiply.3553.5.clone.1
  %147 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3173, i64 0, i64 %2
  %148 = load double, ptr addrspace(1) %147, align 8, !invariant.load !185
  %149 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3581, i64 0, i64 %2
  %150 = load double, ptr addrspace(1) %149, align 8, !invariant.load !185
  %multiply.3498.19.clone.1 = fmul double %148, %150
  %151 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3479, i64 0, i64 %2
  %152 = load double, ptr addrspace(1) %151, align 8, !invariant.load !185
  %multiply.3499.21.clone.1 = fmul double %21, %152
  %add.1031.19.clone.1 = fadd double %multiply.3498.19.clone.1, %multiply.3499.21.clone.1
  %153 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2969, i64 0, i64 %2
  %154 = load double, ptr addrspace(1) %153, align 8, !invariant.load !185
  %155 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3377, i64 0, i64 %2
  %156 = load double, ptr addrspace(1) %155, align 8, !invariant.load !185
  %157 = load double, ptr addrspace(1) %arg2459, align 128, !invariant.load !185
  %multiply.3516.31.clone.1 = fmul double %156, %157
  %multiply.3517.17.clone.1 = fmul double %154, %multiply.3516.31.clone.1
  %add.1038.17.clone.1 = fadd double %add.1031.19.clone.1, %multiply.3517.17.clone.1
  %subtract.147.5.clone.1 = fsub double %add.1038.17.clone.1, %add.1031.19.clone.1
  %multiply.3520.1.clone.1 = fmul double %subtract.147.5.clone.1, %subtract.147.5.clone.1
  %multiply.3554.3.clone.1 = fmul double %138, %multiply.3520.1.clone.1
  %158 = getelementptr double, ptr addrspace(1) %arg3071, i64 %7
  %159 = load double, ptr addrspace(1) %158, align 8, !invariant.load !185
  %multiply.3504.33.clone.1 = fmul double %148, %159
  %160 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg46103, i64 0, i64 %2, i64 0
  %161 = load double, ptr addrspace(1) %160, align 8, !invariant.load !185
  %162 = getelementptr double, ptr addrspace(1) %arg2867, i64 %7
  %163 = load double, ptr addrspace(1) %162, align 8, !invariant.load !185
  %multiply.3543.5.clone.1 = fmul double %161, %163
  %divide.873.3.clone.1 = fdiv double %multiply.3543.5.clone.1, %141
  %164 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg45101, i64 0, i64 %2
  %165 = load double, ptr addrspace(1) %164, align 8, !invariant.load !185
  %multiply.3501.3.clone.1 = fmul double %161, %165
  %multiply.3544.1.clone.1 = fmul double %multiply.3501.3.clone.1, %144
  %multiply.3546.3.clone.1 = fmul double %146, %multiply.3544.1.clone.1
  %add.1048.1.clone.1 = fadd double %divide.873.3.clone.1, %multiply.3546.3.clone.1
  %multiply.3547.15.clone.1 = fmul double %multiply.3516.31.clone.1, %add.1048.1.clone.1
  %multiply.3505.11.clone.1 = fmul double %multiply.3504.33.clone.1, %165
  %166 = fneg double %multiply.3505.11.clone.1
  %multiply.3539.5.clone.1 = fmul double %157, %166
  %divide.870.1.clone.1 = fdiv double %multiply.3539.5.clone.1, %165
  %167 = fneg double %163
  %168 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg2765, i64 0, i64 %19, i64 %2, i64 0
  %169 = load double, ptr addrspace(1) %168, align 8, !invariant.load !185
  %170 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2663, i64 0, i64 %2
  %171 = load double, ptr addrspace(1) %170, align 8, !invariant.load !185
  %subtract.146.5.clone.1 = fsub double %169, %171
  %multiply.3515.3.clone.1 = fmul double %157, %subtract.146.5.clone.1
  %multiply.3540.21.clone.1 = fmul double %multiply.3515.3.clone.1, %167
  %172 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2561, i64 0, i64 %2
  %173 = load double, ptr addrspace(1) %172, align 8, !invariant.load !185
  %multiply.3542.23.clone.1 = fmul double %173, %multiply.3540.21.clone.1
  %add.1047.21.clone.1 = fadd double %divide.870.1.clone.1, %multiply.3542.23.clone.1
  %multiply.3548.17.clone.1 = fmul double %157, %add.1047.21.clone.1
  %multiply.3549.17.clone.1 = fmul double %154, %multiply.3548.17.clone.1
  %add.1049.15.clone.1 = fadd double %multiply.3547.15.clone.1, %multiply.3549.17.clone.1
  %add.1050.14.clone.1 = fadd double %multiply.3504.33.clone.1, %add.1049.15.clone.1
  %subtract.149.13.clone.1 = fsub double %add.1050.14.clone.1, %multiply.3504.33.clone.1
  %multiply.3555.9.clone.1 = fmul double %subtract.147.5.clone.1, 2.000000e+00
  %multiply.3556.5.clone.1 = fmul double %multiply.3555.9.clone.1, %subtract.149.13.clone.1
  %multiply.3557.5.clone.1 = fmul double %73, %multiply.3556.5.clone.1
  %add.1053.3.clone.1 = fadd double %multiply.3554.3.clone.1, %multiply.3557.5.clone.1
  %add.1054.1.clone.1 = fadd double %add.1052.3.clone.1, %add.1053.3.clone.1
  %174 = select i1 %.not, double 0.000000e+00, double %add.1054.1.clone.1
  %multiply.3586.9 = fmul double %multiply.3530.9, %174
  %add.1063.7 = fadd double %multiply.3585.3, %multiply.3586.9
  %add.1064.5 = fadd double %multiply.3584.3, %add.1063.7
  %multiply.3587.11 = fmul double %69, 2.000000e+00
  %multiply.3588.13 = fmul double %multiply.3587.11, %124
  %multiply.3589.9 = fmul double %multiply.3518.20, 5.000000e-01
  %multiply.3590.7 = fmul double %multiply.3589.9, %multiply.3588.13
  %multiply.3591.7 = fmul double %multiply.3534.9, %139
  %add.1065.5 = fadd double %multiply.3590.7, %multiply.3591.7
  %multiply.3592.3 = fmul double %75, %add.1065.5
  %multiply.3593.7 = fmul double %multiply.3535.9, %174
  %add.1066.5 = fadd double %multiply.3592.3, %multiply.3593.7
  %subtract.150.3 = fsub double %add.1064.5, %add.1066.5
  %multiply.3594.5 = fmul double %subtract.150.3, %128
  %add.1067.3 = fadd double %127, %multiply.3594.5
  %175 = select i1 %compare.380.3, double %add.1067.3, double 0.000000e+00
  %176 = select i1 %.not, double %multiply.3579.3, double %175
  %177 = trunc i8 %4 to i1
  %178 = select i1 %177, double %176, double %9
  %179 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1847, i64 0, i64 %2
  %180 = load double, ptr addrspace(1) %179, align 8, !invariant.load !185
  %multiply.3558.3.clone.1 = fmul double %135, %180
  %multiply.3565.7.clone.1 = fmul double %multiply.3518.20, %79
  %multiply.3566.5.clone.1 = fmul double %69, %add.1051.1.clone.1
  %add.1057.5.clone.1 = fadd double %multiply.3565.7.clone.1, %multiply.3566.5.clone.1
  %multiply.3567.7.clone.1 = fmul double %75, %add.1057.5.clone.1
  %multiply.3568.5.clone.1 = fmul double %multiply.3525.3, %add.1054.1.clone.1
  %add.1058.5.clone.1 = fadd double %multiply.3567.7.clone.1, %multiply.3568.5.clone.1
  %multiply.3527.11.clone.1 = fmul double %67, 2.000000e+00
  %divide.868.3.clone.1 = fdiv double 1.000000e+00, %multiply.3527.11.clone.1
  %multiply.3569.3.clone.1 = fmul double %divide.868.3.clone.1, %add.1058.5.clone.1
  %multiply.3526.1.clone.1 = fmul double %75, %multiply.3525.3
  %181 = fmul double %multiply.3564.7, 2.000000e+00
  %182 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1745, i64 0, i64 %2
  %183 = load double, ptr addrspace(1) %182, align 8, !invariant.load !185
  %multiply.3572.5.clone.1 = fmul double %181, %183
  %multiply.3573.3.clone.1 = fmul double %multiply.3526.1.clone.1, %multiply.3572.5.clone.1
  %184 = fsub double %multiply.3569.3.clone.1, %multiply.3573.3.clone.1
  %multiply.3574.5.clone.1 = fmul double %184, %128
  %add.1060.3.clone.1 = fadd double %multiply.3558.3.clone.1, %multiply.3574.5.clone.1
  %185 = select i1 %177, double %add.1060.3.clone.1, double %135
  %186 = getelementptr double, ptr addrspace(1) %arg1949, i64 %7
  %187 = load double, ptr addrspace(1) %186, align 8
  %188 = select i1 %177, double %multiply.3560.15, double %187
  %189 = getelementptr double, ptr addrspace(1) %arg2051, i64 %7
  %190 = load double, ptr addrspace(1) %189, align 8
  %191 = select i1 %177, double %multiply.3564.7, double %190
  %multiply.3595.5.clone.1 = fmul double %67, %125
  %192 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2255, i64 0, i64 %2
  %193 = load double, ptr addrspace(1) %192, align 8, !invariant.load !185
  %194 = select i1 %compare.377.25, double %multiply.3524.29, double %193
  %multiply.3596.3.clone.1 = fmul double %multiply.3564.7, %194
  %add.1068.3.clone.1 = fadd double %multiply.3595.5.clone.1, %multiply.3596.3.clone.1
  %195 = getelementptr double, ptr addrspace(1) %arg2153, i64 %7
  %196 = load double, ptr addrspace(1) %195, align 8
  %197 = select i1 %177, double %add.1068.3.clone.1, double %196
  %198 = getelementptr double, ptr addrspace(1) %arg2357, i64 %7
  %199 = load double, ptr addrspace(1) %198, align 8
  %200 = select i1 %177, double %add.1054.1.clone.1, double %199
  %201 = getelementptr double, ptr addrspace(1) %arg3989, i64 %7
  %202 = load double, ptr addrspace(1) %201, align 8
  %203 = select i1 %177, double %add.1051.1.clone.1, double %202
  %204 = getelementptr double, ptr addrspace(1) %arg4499, i64 %7
  %205 = load double, ptr addrspace(1) %204, align 8
  %206 = select i1 %177, double %subtract.149.13.clone.1, double %205
  %207 = select i1 %177, double %add.1050.14.clone.1, double %159
  %208 = getelementptr double, ptr addrspace(1) %arg47105, i64 %7
  %209 = load double, ptr addrspace(1) %208, align 8
  %210 = select i1 %177, double %143, double %209
  %211 = getelementptr double, ptr addrspace(1) %arg48107, i64 %7
  %212 = load double, ptr addrspace(1) %211, align 8
  %213 = select i1 %177, double %add.1047.21.clone.1, double %212
  %214 = getelementptr double, ptr addrspace(1) %arg49109, i64 %7
  %215 = load double, ptr addrspace(1) %214, align 8
  %216 = select i1 %177, double %multiply.3558.3.clone.1, double %215
  %217 = getelementptr double, ptr addrspace(1) %arg50111, i64 %7
  %218 = load double, ptr addrspace(1) %217, align 8
  %219 = select i1 %177, double %163, double %218
  %220 = getelementptr double, ptr addrspace(1) %arg51113, i64 %7
  %221 = load double, ptr addrspace(1) %220, align 8
  %222 = select i1 %177, double %163, double %221
  %223 = getelementptr double, ptr addrspace(1) %arg52115, i64 %7
  %224 = load double, ptr addrspace(1) %223, align 8
  %225 = select i1 %177, double %multiply.3504.33.clone.1, double %224
  %226 = getelementptr double, ptr addrspace(1) %arg53117, i64 %7
  %227 = load double, ptr addrspace(1) %226, align 8
  %228 = select i1 %177, double %multiply.3505.11.clone.1, double %227
  %229 = fneg double %209
  %230 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg55121, i64 0, i64 %2
  %231 = load double, ptr addrspace(1) %230, align 8, !invariant.load !185
  %multiply.3509.3.clone.1 = fmul double %231, %229
  %232 = getelementptr double, ptr addrspace(1) %arg54119, i64 %7
  %233 = load double, ptr addrspace(1) %232, align 8
  %234 = select i1 %177, double %multiply.3509.3.clone.1, double %233
  %235 = getelementptr double, ptr addrspace(1) %arg56123, i64 %7
  %236 = load double, ptr addrspace(1) %235, align 8
  %237 = select i1 %177, double %138, double %236
  store double %178, ptr addrspace(1) %8, align 8
  store double %185, ptr addrspace(1) %134, align 8
  store double %188, ptr addrspace(1) %186, align 8
  store double %191, ptr addrspace(1) %189, align 8
  store double %197, ptr addrspace(1) %195, align 8
  store double %200, ptr addrspace(1) %198, align 8
  store double %add.1054.1.clone.1, ptr addrspace(1) %142, align 8
  store double %203, ptr addrspace(1) %201, align 8
  %238 = getelementptr double, ptr addrspace(1) %arg57125, i64 %7
  store double %add.1051.1.clone.1, ptr addrspace(1) %238, align 8
  store double %206, ptr addrspace(1) %204, align 8
  %239 = getelementptr double, ptr addrspace(1) %arg58127, i64 %7
  store double %207, ptr addrspace(1) %239, align 8
  %240 = getelementptr double, ptr addrspace(1) %arg59129, i64 %7
  store double %add.1048.1.clone.1, ptr addrspace(1) %240, align 8
  store double %210, ptr addrspace(1) %208, align 8
  store double %213, ptr addrspace(1) %211, align 8
  %241 = getelementptr double, ptr addrspace(1) %arg60131, i64 %7
  store double %divide.870.1.clone.1, ptr addrspace(1) %241, align 8
  store double %216, ptr addrspace(1) %214, align 8
  store double %219, ptr addrspace(1) %217, align 8
  store double %222, ptr addrspace(1) %220, align 8
  store double %225, ptr addrspace(1) %223, align 8
  store double %228, ptr addrspace(1) %226, align 8
  store double %234, ptr addrspace(1) %232, align 8
  store double %237, ptr addrspace(1) %235, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg8) local_unnamed_addr #2 {
entry:
  %arg828 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg726 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_3.1111 = load i64, ptr addrspace(1) %arg318, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_3.1111, 0
  %4 = add i64 %param_3.1111, 192
  %5 = select i1 %3, i64 %4, i64 %param_3.1111
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg828, i64 %thread_id_x
  %param_8.3695 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %param_6.548 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg624, i64 0, i64 %2
  %param_6.5486 = load double, ptr addrspace(1) %param_6.548, align 8, !invariant.load !185
  %param_7.446 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg726, i64 0, i64 %2
  %param_7.4467 = load double, ptr addrspace(1) %param_7.446, align 8, !invariant.load !185
  %multiply.3518.18 = fmul double %param_6.5486, %param_7.4467
  %multiply.3565.9 = fmul double %param_8.3695, %multiply.3518.18
  %param_5.800 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg522, i64 0, i64 %2, i64 0
  %param_5.8008 = load double, ptr addrspace(1) %param_5.800, align 8, !invariant.load !185
  %9 = getelementptr double, ptr addrspace(1) %arg420, i64 %thread_id_x
  %param_4.9149 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %multiply.3566.7 = fmul double %param_5.8008, %param_4.9149
  %add.1057.7 = fadd double %multiply.3565.9, %multiply.3566.7
  %param_2.1293 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg216, i64 0, i64 %2
  %param_2.129310 = load double, ptr addrspace(1) %param_2.1293, align 8, !invariant.load !185
  %multiply.3567.5 = fmul double %param_2.129310, %add.1057.7
  %multiply.3525.7 = fmul double %param_5.8008, %multiply.3518.18
  %10 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.150211 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %multiply.3568.3 = fmul double %multiply.3525.7, %param_1.150211
  %add.1058.3 = fadd double %multiply.3567.5, %multiply.3568.3
  %11 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %add.1058.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg15) local_unnamed_addr #2 {
entry:
  %arg1560 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1458 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1356 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1254 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1152 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1050 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg948 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg846 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg744 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg642 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg540 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg438 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg336 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg234 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg030 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1527 = load i64, ptr addrspace(1) %arg132, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_1.1527, 0
  %4 = add i64 %param_1.1527, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1527
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_10.311 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1050, i64 0, i64 %2
  %param_10.3115 = load double, ptr addrspace(1) %param_10.311, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg948, i64 %thread_id_x
  %param_9.3676 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3504.31 = fmul double %param_10.3115, %param_9.3676
  %9 = getelementptr double, ptr addrspace(1) %arg846, i64 %thread_id_x
  %param_8.4187 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %param_3.1175 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg336, i64 0, i64 %2
  %param_3.11758 = load double, ptr addrspace(1) %param_3.1175, align 8, !invariant.load !185
  %param_4.974 = load double, ptr addrspace(1) %arg438, align 128, !invariant.load !185
  %multiply.3516.37 = fmul double %param_3.11758, %param_4.974
  %multiply.3547.13 = fmul double %param_8.4187, %multiply.3516.37
  %param_2.1370 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg234, i64 0, i64 %2
  %param_2.13709 = load double, ptr addrspace(1) %param_2.1370, align 8, !invariant.load !185
  %10 = getelementptr double, ptr addrspace(1) %arg540, i64 %thread_id_x
  %param_5.85710 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %11 = getelementptr double, ptr addrspace(1) %arg744, i64 %thread_id_x
  %param_7.49411 = load double, ptr addrspace(1) %11, align 8, !invariant.load !185
  %12 = fneg double %param_7.49411
  %param_15.150 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg1560, i64 0, i64 %7, i64 %2, i64 0
  %param_15.15019 = load double, ptr addrspace(1) %param_15.150, align 8, !invariant.load !185
  %param_14.166 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1458, i64 0, i64 %2
  %param_14.16620 = load double, ptr addrspace(1) %param_14.166, align 8, !invariant.load !185
  %subtract.146.21 = fsub double %param_15.15019, %param_14.16620
  %multiply.3515.19 = fmul double %param_4.974, %subtract.146.21
  %multiply.3540.19 = fmul double %multiply.3515.19, %12
  %param_6.598 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg642, i64 0, i64 %2
  %param_6.59821 = load double, ptr addrspace(1) %param_6.598, align 8, !invariant.load !185
  %multiply.3542.21 = fmul double %param_6.59821, %multiply.3540.19
  %add.1047.19 = fadd double %param_5.85710, %multiply.3542.21
  %multiply.3548.15 = fmul double %param_4.974, %add.1047.19
  %multiply.3549.15 = fmul double %param_2.13709, %multiply.3548.15
  %add.1049.13 = fadd double %multiply.3547.13, %multiply.3549.15
  %add.1050.12 = fadd double %multiply.3504.31, %add.1049.13
  %subtract.149.11 = fsub double %add.1050.12, %multiply.3504.31
  %param_13.194 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1356, i64 0, i64 %2
  %param_13.19425 = load double, ptr addrspace(1) %param_13.194, align 8, !invariant.load !185
  %multiply.3498.15 = fmul double %param_10.3115, %param_13.19425
  %param_12.234 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1254, i64 0, i64 %7
  %param_12.23426 = load double, ptr addrspace(1) %param_12.234, align 8, !invariant.load !185
  %param_11.252 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1152, i64 0, i64 %2
  %param_11.25227 = load double, ptr addrspace(1) %param_11.252, align 8, !invariant.load !185
  %multiply.3499.17 = fmul double %param_12.23426, %param_11.25227
  %add.1031.15 = fadd double %multiply.3498.15, %multiply.3499.17
  %multiply.3517.19 = fmul double %param_2.13709, %multiply.3516.37
  %add.1038.19 = fadd double %multiply.3517.19, %add.1031.15
  %subtract.147.8 = fsub double %add.1038.19, %add.1031.15
  %multiply.3555.7 = fmul double %subtract.147.8, 2.000000e+00
  %multiply.3556.3 = fmul double %multiply.3555.7, %subtract.149.11
  %13 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg030, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3556.3, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg12) local_unnamed_addr #2 {
entry:
  %arg1247 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1145 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1043 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg941 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg839 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg737 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg635 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg533 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg431 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg329 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg227 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg125 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg023 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1524 = load i64, ptr addrspace(1) %arg125, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_1.1524, 0
  %4 = add i64 %param_1.1524, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1524
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_10.308 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1043, i64 0, i64 %2
  %param_10.3085 = load double, ptr addrspace(1) %param_10.308, align 8, !invariant.load !185
  %8 = getelementptr double, ptr addrspace(1) %arg941, i64 %thread_id_x
  %param_9.3636 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %multiply.3504.29 = fmul double %param_10.3085, %param_9.3636
  %9 = getelementptr double, ptr addrspace(1) %arg737, i64 %thread_id_x
  %param_7.4887 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %param_8.411 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg839, i64 0, i64 %2
  %param_8.4118 = load double, ptr addrspace(1) %param_8.411, align 8, !invariant.load !185
  %param_2.1364 = load double, ptr addrspace(1) %arg227, align 128, !invariant.load !185
  %multiply.3516.33 = fmul double %param_8.4118, %param_2.1364
  %multiply.3547.11 = fmul double %param_7.4887, %multiply.3516.33
  %param_6.593 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg635, i64 0, i64 %2
  %param_6.5939 = load double, ptr addrspace(1) %param_6.593, align 8, !invariant.load !185
  %10 = getelementptr double, ptr addrspace(1) %arg329, i64 %thread_id_x
  %param_3.117010 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %11 = getelementptr double, ptr addrspace(1) %arg533, i64 %thread_id_x
  %param_5.85211 = load double, ptr addrspace(1) %11, align 8, !invariant.load !185
  %12 = fneg double %param_5.85211
  %param_12.231 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg1247, i64 0, i64 %7, i64 %2, i64 0
  %param_12.23119 = load double, ptr addrspace(1) %param_12.231, align 8, !invariant.load !185
  %param_11.249 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1145, i64 0, i64 %2
  %param_11.24920 = load double, ptr addrspace(1) %param_11.249, align 8, !invariant.load !185
  %subtract.146.19 = fsub double %param_12.23119, %param_11.24920
  %multiply.3515.17 = fmul double %param_2.1364, %subtract.146.19
  %multiply.3540.17 = fmul double %multiply.3515.17, %12
  %param_4.968 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg431, i64 0, i64 %2
  %param_4.96821 = load double, ptr addrspace(1) %param_4.968, align 8, !invariant.load !185
  %multiply.3542.19 = fmul double %param_4.96821, %multiply.3540.17
  %add.1047.17 = fadd double %param_3.117010, %multiply.3542.19
  %multiply.3548.13 = fmul double %param_2.1364, %add.1047.17
  %multiply.3549.13 = fmul double %param_6.5939, %multiply.3548.13
  %add.1049.11 = fadd double %multiply.3547.11, %multiply.3549.13
  %add.1050.10 = fadd double %multiply.3504.29, %add.1049.11
  %subtract.149.9 = fsub double %add.1050.10, %multiply.3504.29
  %multiply.3615.3 = fmul double %subtract.149.9, 2.000000e+00
  %13 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg023, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3615.3, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg7) local_unnamed_addr #2 {
entry:
  %arg732 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_5.811 = load i64, ptr addrspace(1) %arg528, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_5.811, 0
  %4 = add i64 %param_5.811, 192
  %5 = select i1 %3, i64 %4, i64 %param_5.811
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg222, i64 %thread_id_x
  %param_2.13305 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = getelementptr double, ptr addrspace(1) %arg426, i64 %thread_id_x
  %param_4.9266 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %10 = fneg double %param_4.9266
  %param_7.454 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg732, i64 0, i64 %7, i64 %2, i64 0
  %param_7.45414 = load double, ptr addrspace(1) %param_7.454, align 8, !invariant.load !185
  %param_6.557 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg630, i64 0, i64 %2
  %param_6.55715 = load double, ptr addrspace(1) %param_6.557, align 8, !invariant.load !185
  %subtract.146.13 = fsub double %param_7.45414, %param_6.55715
  %param_1.1539 = load double, ptr addrspace(1) %arg120, align 128, !invariant.load !185
  %multiply.3515.11 = fmul double %subtract.146.13, %param_1.1539
  %multiply.3540.7 = fmul double %multiply.3515.11, %10
  %param_3.1128 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg324, i64 0, i64 %2
  %param_3.112816 = load double, ptr addrspace(1) %param_3.1128, align 8, !invariant.load !185
  %multiply.3542.9 = fmul double %param_3.112816, %multiply.3540.7
  %add.1047.7 = fadd double %param_2.13305, %multiply.3542.9
  %multiply.3548.3 = fmul double %param_1.1539, %add.1047.7
  %11 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg018, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3548.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1350 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_2.1350, 0
  %4 = add i64 %param_2.1350, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1350
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1178 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg314, i64 0, i64 %2
  %param_3.11785 = load i64, ptr addrspace(1) %param_3.1178, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_3.11785, 0
  %8 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.14677 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = select i1 %.not, double 0.000000e+00, double %param_1.14677
  %10 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg6) local_unnamed_addr #2 {
entry:
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1508 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_1.1508, 0
  %4 = add i64 %param_1.1508, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1508
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.5505 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %param_4.917 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg418, i64 0, i64 %2
  %param_4.9176 = load double, ptr addrspace(1) %param_4.917, align 8, !invariant.load !185
  %param_5.802 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg520, i64 0, i64 %2
  %param_5.8027 = load double, ptr addrspace(1) %param_5.802, align 8, !invariant.load !185
  %multiply.3518.14 = fmul double %param_4.9176, %param_5.8027
  %multiply.3565.5 = fmul double %param_6.5505, %multiply.3518.14
  %param_3.1115 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg316, i64 0, i64 %2, i64 0
  %param_3.11158 = load double, ptr addrspace(1) %param_3.1115, align 8, !invariant.load !185
  %9 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12999 = load double, ptr addrspace(1) %9, align 8, !invariant.load !185
  %multiply.3566.3 = fmul double %param_3.11158, %param_2.12999
  %add.1057.3 = fadd double %multiply.3565.5, %multiply.3566.3
  %10 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %add.1057.3, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg7) local_unnamed_addr #2 {
entry:
  %arg727 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg625 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1563 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_1.1563, 0
  %4 = add i64 %param_1.1563, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1563
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_7.497 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg727, i64 0, i64 %2
  %param_7.4975 = load i64, ptr addrspace(1) %param_7.497, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_7.4975, 0
  %8 = getelementptr double, ptr addrspace(1) %arg625, i64 %thread_id_x
  %param_6.5967 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = select i1 %.not, double 0.000000e+00, double %param_6.5967
  %param_2.1367 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg217, i64 0, i64 %2
  %param_2.13678 = load double, ptr addrspace(1) %param_2.1367, align 8, !invariant.load !185
  %param_3.1173 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg319, i64 0, i64 %2
  %param_3.11739 = load double, ptr addrspace(1) %param_3.1173, align 8, !invariant.load !185
  %multiply.3518.50 = fmul double %param_2.13678, %param_3.11739
  %multiply.3580.9 = fmul double %9, %multiply.3518.50
  %param_4.972 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg421, i64 0, i64 %2, i64 0
  %param_4.97210 = load double, ptr addrspace(1) %param_4.972, align 8, !invariant.load !185
  %10 = getelementptr double, ptr addrspace(1) %arg523, i64 %thread_id_x
  %param_5.85511 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %11 = select i1 %.not, double 0.000000e+00, double %param_5.85511
  %multiply.3581.9 = fmul double %param_4.97210, %11
  %add.1062.7 = fadd double %multiply.3580.9, %multiply.3581.9
  %multiply.3525.9 = fmul double %param_4.97210, %multiply.3518.50
  %multiply.3582.7 = fmul double %multiply.3525.9, 2.000000e+00
  %multiply.3583.3 = fmul double %multiply.3582.7, %add.1062.7
  %12 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3583.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg7) local_unnamed_addr #2 {
entry:
  %arg727 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg625 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1559 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_1.1559, 0
  %4 = add i64 %param_1.1559, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1559
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_7.498 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg727, i64 0, i64 %2
  %param_7.4985 = load i64, ptr addrspace(1) %param_7.498, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_7.4985, 0
  %8 = getelementptr double, ptr addrspace(1) %arg625, i64 %thread_id_x
  %param_6.5907 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = select i1 %.not, double 0.000000e+00, double %param_6.5907
  %param_4.965 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg421, i64 0, i64 %2
  %param_4.9658 = load double, ptr addrspace(1) %param_4.965, align 8, !invariant.load !185
  %param_5.850 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg523, i64 0, i64 %2
  %param_5.8509 = load double, ptr addrspace(1) %param_5.850, align 8, !invariant.load !185
  %multiply.3518.46 = fmul double %param_4.9658, %param_5.8509
  %multiply.3580.5 = fmul double %9, %multiply.3518.46
  %param_3.1167 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg319, i64 0, i64 %2, i64 0
  %param_3.116710 = load double, ptr addrspace(1) %param_3.1167, align 8, !invariant.load !185
  %10 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.136111 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %11 = select i1 %.not, double 0.000000e+00, double %param_2.136111
  %multiply.3581.5 = fmul double %param_3.116710, %11
  %add.1062.3 = fadd double %multiply.3580.5, %multiply.3581.5
  %multiply.3623.3 = fmul double %add.1062.3, 2.000000e+00
  %12 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.3623.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg7) local_unnamed_addr #2 {
entry:
  %arg727 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg625 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !190
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1450 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !185
  %3 = icmp slt i64 %param_1.1450, 0
  %4 = add i64 %param_1.1450, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1450
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_7.502 = getelementptr inbounds [4 x i64], ptr addrspace(1) %arg727, i64 0, i64 %2
  %param_7.5025 = load i64, ptr addrspace(1) %param_7.502, align 8, !invariant.load !185
  %.not = icmp eq i64 %param_7.5025, 0
  %8 = getelementptr double, ptr addrspace(1) %arg625, i64 %thread_id_x
  %param_6.6037 = load double, ptr addrspace(1) %8, align 8, !invariant.load !185
  %9 = select i1 %.not, double 0.000000e+00, double %param_6.6037
  %param_3.1183 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg319, i64 0, i64 %2, i64 0
  %param_3.11838 = load double, ptr addrspace(1) %param_3.1183, align 8, !invariant.load !185
  %multiply.3587.9 = fmul double %param_3.11838, 2.000000e+00
  %multiply.3588.11 = fmul double %9, %multiply.3587.9
  %param_4.980 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg421, i64 0, i64 %2
  %param_4.9809 = load double, ptr addrspace(1) %param_4.980, align 8, !invariant.load !185
  %param_5.862 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg523, i64 0, i64 %2
  %param_5.86210 = load double, ptr addrspace(1) %param_5.862, align 8, !invariant.load !185
  %multiply.3518.42 = fmul double %param_4.9809, %param_5.86210
  %multiply.3589.7 = fmul double %multiply.3518.42, 5.000000e-01
  %multiply.3590.5 = fmul double %multiply.3588.11, %multiply.3589.7
  %multiply.3533.17 = fmul double %param_3.11838, %param_3.11838
  %multiply.3534.15 = fmul double %multiply.3533.17, 5.000000e-01
  %10 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.124111 = load double, ptr addrspace(1) %10, align 8, !invariant.load !185
  %11 = select i1 %.not, double 0.000000e+00, double %param_2.124111
  %multiply.3591.5 = fmul double %multiply.3534.15, %11
  %add.1065.3 = fadd double %multiply.3590.5, %multiply.3591.5
  %12 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %add.1065.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture align 128 dereferenceable(8) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128
  %1 = add i64 %0, 1
  store i64 %1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg7) local_unnamed_addr #3 {
entry:
  %arg718 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg616 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg514 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg412 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg310 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !191
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !184
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 296
  br i1 %3, label %concatenate.pivot.8., label %copy_fusion.7.in_bounds-after

copy_fusion.7.in_bounds-after:                    ; preds = %slice2-after, %slice3-true, %entry
  ret void

concatenate.pivot.8.:                             ; preds = %entry
  %4 = icmp ult i32 %linear_index, 8
  br i1 %4, label %concatenate.pivot.4., label %concatenate.pivot.104.

concatenate.pivot.4.:                             ; preds = %concatenate.pivot.8.
  %5 = icmp ult i32 %linear_index, 4
  br i1 %5, label %concatenate.pivot.0., label %concatenate.pivot.4.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  %6 = zext nneg i32 %linear_index to i64
  %7 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg04, i64 0, i64 %6, i64 0
  br label %concatenate.3.merge

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.4.
  %8 = add nsw i32 %linear_index, -4
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg16, i64 0, i64 %9, i64 0
  br label %concatenate.3.merge

concatenate.pivot.104.:                           ; preds = %concatenate.pivot.8.
  %11 = icmp ult i32 %linear_index, 104
  br i1 %11, label %concatenate.pivot.8.2, label %concatenate.pivot.104.3

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.104.
  %12 = add nsw i32 %1, -8
  %13 = and i32 %1, 3
  %14 = lshr i32 %12, 2
  %15 = zext nneg i32 %14 to i64
  %16 = zext nneg i32 %13 to i64
  %17 = getelementptr inbounds [24 x [4 x [1 x double]]], ptr addrspace(1) %arg28, i64 0, i64 %15, i64 %16, i64 0
  br label %concatenate.3.merge

concatenate.pivot.104.3:                          ; preds = %concatenate.pivot.104.
  %18 = add nsw i32 %linear_index, -104
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg310, i64 0, i64 %19
  br label %concatenate.3.merge

concatenate.3.merge:                              ; preds = %concatenate.pivot.104.3, %concatenate.pivot.8.2, %concatenate.pivot.4.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %7, %concatenate.pivot.0. ], [ %10, %concatenate.pivot.4.1 ], [ %17, %concatenate.pivot.8.2 ], [ %20, %concatenate.pivot.104.3 ]
  %21 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !185
  %22 = icmp ult i32 %linear_index, 4
  %23 = zext nneg i32 %linear_index to i64
  %24 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg412, i64 0, i64 %23
  br i1 %22, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.3.merge
  %25 = and i32 %linear_index, 508
  %26 = icmp eq i32 %25, 4
  %27 = add nsw i32 %linear_index, -4
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg514, i64 0, i64 %28
  br i1 %26, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %30 = add nsw i32 %linear_index, -8
  %31 = icmp ult i32 %30, 96
  %32 = zext nneg i32 %30 to i64
  %33 = getelementptr inbounds [96 x double], ptr addrspace(1) %arg616, i64 0, i64 %32
  br i1 %31, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %34 = icmp ugt i32 %linear_index, 103
  %35 = add nsw i32 %linear_index, -104
  %36 = zext nneg i32 %35 to i64
  %37 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg718, i64 0, i64 %36
  br i1 %34, label %slice3-true, label %copy_fusion.7.in_bounds-after

slice0-true:                                      ; preds = %concatenate.3.merge
  store double %21, ptr addrspace(1) %24, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double %21, ptr addrspace(1) %29, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double %21, ptr addrspace(1) %33, align 8
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  store double %21, ptr addrspace(1) %37, align 8
  br label %copy_fusion.7.in_bounds-after
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

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179}
!llvm.ident = !{!180}
!nvvmir.version = !{!181}
!llvm.module.flags = !{!182}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{ptr @copy_fusion_14, !"kernel", i32 1}
!3 = !{ptr @copy_fusion_14, !"reqntidx", i32 128}
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
!14 = !{ptr @loop_divide_multiply_select_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_divide_multiply_select_fusion, !"reqntidx", i32 4}
!16 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_add_fusion, !"reqntidx", i32 4}
!18 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!19 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 96}
!20 = !{ptr @loop_dynamic_update_slice_fusion_85, !"kernel", i32 1}
!21 = !{ptr @loop_dynamic_update_slice_fusion_85, !"reqntidx", i32 4}
!22 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!23 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 4}
!24 = !{ptr @loop_dynamic_update_slice_fusion_49, !"kernel", i32 1}
!25 = !{ptr @loop_dynamic_update_slice_fusion_49, !"reqntidx", i32 4}
!26 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!27 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 4}
!28 = !{ptr @loop_dynamic_update_slice_fusion_52, !"kernel", i32 1}
!29 = !{ptr @loop_dynamic_update_slice_fusion_52, !"reqntidx", i32 4}
!30 = !{ptr @loop_dynamic_update_slice_fusion_101, !"kernel", i32 1}
!31 = !{ptr @loop_dynamic_update_slice_fusion_101, !"reqntidx", i32 1}
!32 = !{ptr @loop_dynamic_update_slice_fusion_93, !"kernel", i32 1}
!33 = !{ptr @loop_dynamic_update_slice_fusion_93, !"reqntidx", i32 4}
!34 = !{ptr @loop_dynamic_update_slice_fusion_78, !"kernel", i32 1}
!35 = !{ptr @loop_dynamic_update_slice_fusion_78, !"reqntidx", i32 1}
!36 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!37 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 4}
!38 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!39 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 4}
!40 = !{ptr @loop_divide_exponential_fusion, !"kernel", i32 1}
!41 = !{ptr @loop_divide_exponential_fusion, !"reqntidx", i32 4}
!42 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!43 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 96}
!44 = !{ptr @wrapped_convert, !"kernel", i32 1}
!45 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!46 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!47 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 4}
!48 = !{ptr @loop_compare_multiply_select_fusion, !"kernel", i32 1}
!49 = !{ptr @loop_compare_multiply_select_fusion, !"reqntidx", i32 4}
!50 = !{ptr @loop_broadcast_select_fusion, !"kernel", i32 1}
!51 = !{ptr @loop_broadcast_select_fusion, !"reqntidx", i32 96}
!52 = !{ptr @loop_dynamic_update_slice_fusion_70, !"kernel", i32 1}
!53 = !{ptr @loop_dynamic_update_slice_fusion_70, !"reqntidx", i32 4}
!54 = !{ptr @loop_dynamic_update_slice_fusion_75, !"kernel", i32 1}
!55 = !{ptr @loop_dynamic_update_slice_fusion_75, !"reqntidx", i32 4}
!56 = !{ptr @loop_dynamic_update_slice_fusion_82, !"kernel", i32 1}
!57 = !{ptr @loop_dynamic_update_slice_fusion_82, !"reqntidx", i32 4}
!58 = !{ptr @loop_dynamic_update_slice_fusion_80, !"kernel", i32 1}
!59 = !{ptr @loop_dynamic_update_slice_fusion_80, !"reqntidx", i32 4}
!60 = !{ptr @loop_dynamic_update_slice_fusion_77, !"kernel", i32 1}
!61 = !{ptr @loop_dynamic_update_slice_fusion_77, !"reqntidx", i32 4}
!62 = !{ptr @loop_dynamic_update_slice_fusion_67, !"kernel", i32 1}
!63 = !{ptr @loop_dynamic_update_slice_fusion_67, !"reqntidx", i32 4}
!64 = !{ptr @loop_dynamic_update_slice_fusion_61, !"kernel", i32 1}
!65 = !{ptr @loop_dynamic_update_slice_fusion_61, !"reqntidx", i32 4}
!66 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!67 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 4}
!68 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!69 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 4}
!70 = !{ptr @loop_dynamic_update_slice_fusion_58, !"kernel", i32 1}
!71 = !{ptr @loop_dynamic_update_slice_fusion_58, !"reqntidx", i32 4}
!72 = !{ptr @loop_dynamic_update_slice_fusion_47, !"kernel", i32 1}
!73 = !{ptr @loop_dynamic_update_slice_fusion_47, !"reqntidx", i32 4}
!74 = !{ptr @loop_dynamic_update_slice_fusion_86, !"kernel", i32 1}
!75 = !{ptr @loop_dynamic_update_slice_fusion_86, !"reqntidx", i32 4}
!76 = !{ptr @loop_dynamic_update_slice_fusion_44, !"kernel", i32 1}
!77 = !{ptr @loop_dynamic_update_slice_fusion_44, !"reqntidx", i32 4}
!78 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!79 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 4}
!80 = !{ptr @loop_dynamic_update_slice_fusion_100, !"kernel", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_100, !"reqntidx", i32 4}
!82 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!83 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 4}
!84 = !{ptr @loop_dynamic_update_slice_fusion_60, !"kernel", i32 1}
!85 = !{ptr @loop_dynamic_update_slice_fusion_60, !"reqntidx", i32 4}
!86 = !{ptr @loop_dynamic_update_slice_fusion_88, !"kernel", i32 1}
!87 = !{ptr @loop_dynamic_update_slice_fusion_88, !"reqntidx", i32 4}
!88 = !{ptr @loop_dynamic_update_slice_fusion_91, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_91, !"reqntidx", i32 4}
!90 = !{ptr @loop_dynamic_update_slice_fusion_94, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion_94, !"reqntidx", i32 4}
!92 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 96}
!94 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 96}
!96 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 96}
!98 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 96}
!100 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 96}
!102 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 96}
!104 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 96}
!106 = !{ptr @loop_dynamic_update_slice_fusion_32, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_32, !"reqntidx", i32 96}
!108 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 96}
!110 = !{ptr @loop_dynamic_update_slice_fusion_102, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_102, !"reqntidx", i32 96}
!112 = !{ptr @loop_dynamic_update_slice_fusion_99, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_99, !"reqntidx", i32 96}
!114 = !{ptr @loop_dynamic_update_slice_fusion_103, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_103, !"reqntidx", i32 96}
!116 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 96}
!118 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 96}
!120 = !{ptr @loop_dynamic_update_slice_fusion_98, !"kernel", i32 1}
!121 = !{ptr @loop_dynamic_update_slice_fusion_98, !"reqntidx", i32 96}
!122 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 96}
!124 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!125 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 96}
!126 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 96}
!128 = !{ptr @loop_add_and_divide_select_fusion, !"kernel", i32 1}
!129 = !{ptr @loop_add_and_divide_select_fusion, !"reqntidx", i32 4}
!130 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 4}
!132 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 4}
!134 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 4}
!136 = !{ptr @loop_dynamic_update_slice_fusion_57, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_57, !"reqntidx", i32 4}
!138 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 4}
!140 = !{ptr @loop_dynamic_update_slice_fusion_63, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_63, !"reqntidx", i32 4}
!142 = !{ptr @loop_dynamic_update_slice_fusion_62, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_62, !"reqntidx", i32 4}
!144 = !{ptr @loop_dynamic_update_slice_fusion_65, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_65, !"reqntidx", i32 4}
!146 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 96}
!148 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!149 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 96}
!150 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!151 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 96}
!152 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!153 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 96}
!154 = !{ptr @loop_dynamic_update_slice_fusion_36, !"kernel", i32 1}
!155 = !{ptr @loop_dynamic_update_slice_fusion_36, !"reqntidx", i32 96}
!156 = !{ptr @loop_add_divide_select_fusion, !"kernel", i32 1}
!157 = !{ptr @loop_add_divide_select_fusion, !"reqntidx", i32 96}
!158 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!159 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 96}
!160 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!161 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 96}
!162 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 96}
!164 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 96}
!166 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 96}
!168 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 96}
!170 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!171 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 96}
!172 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!173 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 96}
!174 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!175 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 96}
!176 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!177 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!178 = !{ptr @copy_fusion_7, !"kernel", i32 1}
!179 = !{ptr @copy_fusion_7, !"reqntidx", i32 128}
!180 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!181 = !{i32 2, i32 0}
!182 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!183 = !{i32 0, i32 12}
!184 = !{i32 0, i32 128}
!185 = !{}
!186 = !{i32 0, i32 8}
!187 = !{i32 0, i32 152}
!188 = !{i32 0, i32 4}
!189 = !{i32 0, i32 24}
!190 = !{i32 0, i32 96}
!191 = !{i32 0, i32 3}
