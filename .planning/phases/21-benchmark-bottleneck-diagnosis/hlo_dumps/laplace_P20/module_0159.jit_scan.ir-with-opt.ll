; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_42_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !121
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 30
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr inbounds [3840 x i8], ptr addrspace(1) %arg03, i64 0, i64 %4
  br i1 %3, label %slice0-true, label %slice0-after

input_slice_fusion.in_bounds-after:               ; preds = %slice0-after, %slice1-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %6 = icmp ugt i32 %0, 29
  %7 = sext i32 %linear_index to i64
  %8 = getelementptr [3840 x i8], ptr addrspace(1) %arg15, i64 0, i64 %7
  br i1 %6, label %slice1-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %entry
  store i8 0, ptr addrspace(1) %5, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %8, i64 -3840
  store i8 0, ptr addrspace(1) %sunkaddr, align 1
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @copy_fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !121
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 30
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.3840.1

copy_fusion.10.in_bounds-after:                   ; preds = %slice0-after, %slice1-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = zext nneg i16 %4 to i64
  %7 = zext nneg i16 %.decomposed to i64
  %8 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg05, i64 0, i64 %6, i64 %7, i64 0
  br label %concatenate.4.merge

concatenate.pivot.3840.1:                         ; preds = %entry
  %9 = add nsw i32 %linear_index, -3840
  %10 = udiv i32 %9, 20
  %11 = mul i32 %10, 20
  %.decomposed4 = sub i32 %9, %11
  %12 = zext nneg i32 %10 to i64
  %13 = zext nneg i32 %.decomposed4 to i64
  %14 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg05, i64 0, i64 %12, i64 %13, i64 0
  br label %concatenate.4.merge

concatenate.4.merge:                              ; preds = %concatenate.pivot.3840.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %8, %concatenate.pivot.0. ], [ %14, %concatenate.pivot.3840.1 ]
  %15 = icmp ult i32 %0, 30
  %16 = load i8, ptr addrspace(1) %.in, align 1, !invariant.load !123
  %17 = zext nneg i32 %linear_index to i64
  %18 = getelementptr inbounds [3840 x i8], ptr addrspace(1) %arg17, i64 0, i64 %17
  br i1 %15, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.4.merge
  %19 = icmp ugt i32 %0, 29
  %20 = sext i32 %linear_index to i64
  %21 = getelementptr [3840 x i8], ptr addrspace(1) %arg29, i64 0, i64 %20
  br i1 %19, label %slice1-true, label %copy_fusion.10.in_bounds-after

slice0-true:                                      ; preds = %concatenate.4.merge
  store i8 %16, ptr addrspace(1) %18, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %21, i64 -3840
  store i8 %16, ptr addrspace(1) %sunkaddr, align 1
  br label %copy_fusion.10.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(15360) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !124
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 4032
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
  %10 = getelementptr inbounds [3840 x i32], ptr addrspace(1) %arg15, i64 0, i64 %9
  br i1 %7, label %slice1-true, label %input_slice_fusion.1.in_bounds-after

slice0-true:                                      ; preds = %concatenate.1.merge
  store i32 0, ptr addrspace(1) %6, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store i32 0, ptr addrspace(1) %10, align 4
  br label %input_slice_fusion.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !124
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 4032
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
  %10 = getelementptr inbounds [3840 x double], ptr addrspace(1) %arg15, i64 0, i64 %9
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
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !123
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
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !123
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
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
  %0 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !123
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg02, i64 0, i64 %7
  %9 = load i32, ptr addrspace(1) %8, align 4, !invariant.load !123
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i32
  store i32 %9, ptr addrspace(1) %arg26, align 128
  store i32 %11, ptr addrspace(1) %arg38, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg13) local_unnamed_addr #2 {
entry:
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg617, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !123
  %4 = load i64, ptr addrspace(1) %arg515, align 128, !invariant.load !123
  %5 = icmp slt i64 %4, 0
  %6 = add i64 %4, 192
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc i64 %7 to i32
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 191)
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg413, i64 0, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !123
  %14 = getelementptr double, ptr addrspace(1) %arg17, i64 %1
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !123
  %16 = getelementptr double, ptr addrspace(1) %arg311, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !123
  %18 = getelementptr double, ptr addrspace(1) %arg29, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !123
  %multiply.852.21 = fmul double %17, %19
  %add.342.19 = fadd double %15, %multiply.852.21
  %20 = tail call double @llvm.fma.f64(double %add.342.19, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #5
  %22 = tail call double @llvm.nvvm.add.rn.d(double %20, double 0xC338000000000000) #5
  %23 = tail call double @llvm.fma.f64(double %22, double 0xBFE62E42FEFA39EF, double %add.342.19)
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
  %41 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.19) #5
  %42 = bitcast i32 %41 to float
  %43 = tail call float @llvm.nvvm.fabs.f(float %42) #5
  %44 = fcmp olt float %43, 0x4010C46560000000
  br i1 %44, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %45 = fcmp olt double %add.342.19, 0.000000e+00
  %46 = fadd double %add.342.19, 0x7FF0000000000000
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
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !123
  %60 = getelementptr double, ptr addrspace(1) %arg821, i64 %1
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !123
  %62 = getelementptr double, ptr addrspace(1) %arg923, i64 %1
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !123
  %multiply.848.7.clone.1.clone.1 = fmul double %61, %63
  %64 = getelementptr double, ptr addrspace(1) %arg719, i64 %1
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !123
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
  %multiply.853.29 = fmul double %13, %z.2.i
  %compare.265.15 = fcmp ogt double %multiply.853.29, 1.000000e-128
  %105 = select i1 %compare.265.15, double %multiply.853.29, double %59
  %add.343.2 = fadd double %divide.391.1.clone.1, %105
  %divide.392.1 = fdiv double 1.000000e+00, %add.343.2
  %add.341.1.clone.1.clone.1 = fadd double %z.2.i3, 1.000000e+00
  %divide.390.1.clone.1.clone.1 = fdiv double 1.000000e+00, %add.341.1.clone.1.clone.1
  %subtract.76.2.clone.1 = fsub double 1.000000e+00, %divide.390.1.clone.1.clone.1
  %multiply.850.1.clone.1 = fmul double %divide.390.1.clone.1.clone.1, %subtract.76.2.clone.1
  %106 = getelementptr double, ptr addrspace(1) %arg1025, i64 %1
  store double %divide.392.1, ptr addrspace(1) %106, align 8
  %107 = getelementptr double, ptr addrspace(1) %arg1127, i64 %1
  store double %divide.391.1.clone.1, ptr addrspace(1) %107, align 8
  %108 = getelementptr double, ptr addrspace(1) %arg1229, i64 %1
  store double %multiply.850.1.clone.1, ptr addrspace(1) %108, align 8
  %109 = getelementptr double, ptr addrspace(1) %arg1331, i64 %1
  store double %divide.390.1.clone.1.clone.1, ptr addrspace(1) %109, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_59(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.654 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !123
  %0 = icmp slt i64 %param_2.654, 0
  %1 = add i64 %param_2.654, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.654
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.746 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg112, i64 0, i64 %4
  %param_1.7468 = load i32, ptr addrspace(1) %param_1.746, align 4, !invariant.load !123
  %5 = icmp ne i32 %param_1.7468, 0
  %6 = zext i1 %5 to i32
  %7 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg010, i64 0, i64 %4
  store i32 %6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_exponential_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg8) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !123
  %4 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !123
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %9 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
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
  %divide.385.5 = fdiv double 1.000000e+00, %3
  %multiply.842.5 = fmul double %4, %z.2.i
  %add.336.5 = fadd double %divide.385.5, %multiply.842.5
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
  %0 = load i32, ptr addrspace(1) %arg01, align 128, !invariant.load !123
  %1 = sitofp i32 %0 to double
  store double %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !123
  %4 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !123
  %multiply.845.5.clone.1 = fmul double %5, %5
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %multiply.846.9.clone.1 = fmul double %multiply.845.5.clone.1, %7
  %8 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !123
  %multiply.847.7.clone.1 = fmul double %multiply.846.9.clone.1, %8
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
  %param_2.408 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !123
  %0 = icmp slt i64 %param_2.408, 0
  %1 = add i64 %param_2.408, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.408
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.533 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !123
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  store double %param_1.533, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_38(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.395 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !123
  %0 = icmp slt i64 %param_2.395, 0
  %1 = add i64 %param_2.395, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.395
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.521 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg111, i64 0, i64 %4
  %param_1.5218 = load i32, ptr addrspace(1) %param_1.521, align 4, !invariant.load !123
  %5 = sitofp i32 %param_1.5218 to double
  %6 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg09, i64 0, i64 %4
  store double %5, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_30(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.631 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.631, 0
  %2 = add i64 %param_2.631, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.631
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7334 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !123
  %7 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %param_1.7334, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #2 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_5.443 = load i64, ptr addrspace(1) %arg523, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_5.443, 0
  %2 = add i64 %param_5.443, 192
  %3 = select i1 %1, i64 %2, i64 %param_5.443
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_4.550 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg421, i64 0, i64 %5
  %param_4.5509 = load double, ptr addrspace(1) %param_4.550, align 8, !invariant.load !123
  %6 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.74410 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.63011 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.65012 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %multiply.852.9 = fmul double %param_3.63011, %param_2.65012
  %add.342.7 = fadd double %param_1.74410, %multiply.852.9
  %9 = tail call double @llvm.fma.f64(double %add.342.7, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %10 = tail call i32 @llvm.nvvm.d2i.lo(double %9) #5
  %11 = tail call double @llvm.nvvm.add.rn.d(double %9, double 0xC338000000000000) #5
  %12 = tail call double @llvm.fma.f64(double %11, double 0xBFE62E42FEFA39EF, double %add.342.7)
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
  %30 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.7) #5
  %31 = bitcast i32 %30 to float
  %32 = tail call float @llvm.nvvm.fabs.f(float %31) #5
  %33 = fcmp olt float %32, 0x4010C46560000000
  br i1 %33, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %34 = fcmp olt double %add.342.7, 0.000000e+00
  %35 = fadd double %add.342.7, 0x7FF0000000000000
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
  %multiply.853.7 = fmul double %param_4.5509, %z.2.i
  %compare.265.3 = fcmp ogt double %multiply.853.7, 1.000000e-128
  %47 = zext i1 %compare.265.3 to i8
  %48 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store i8 %47, ptr addrspace(1) %48, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.660 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.660, 0
  %2 = add i64 %param_2.660, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.660
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.7505 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = icmp ne i64 %param_1.7505, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.659 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.659, 0
  %2 = add i64 %param_2.659, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.659
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.7494 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = icmp ne i64 %param_1.7494, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.664 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.664, 0
  %2 = add i64 %param_2.664, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.664
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.7545 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !123
  %.not = icmp eq i64 %param_1.7545, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.663 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.663, 0
  %2 = add i64 %param_2.663, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.663
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.7534 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !123
  %.not = icmp eq i64 %param_1.7534, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_53(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.629 = load i64, ptr addrspace(1) %arg317, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_3.629, 0
  %2 = add i64 %param_3.629, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.629
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_2.649 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.6499 = load double, ptr addrspace(1) %param_2.649, align 8, !invariant.load !123
  %6 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.74310 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = tail call double @llvm.fma.f64(double %param_1.74310, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %8 = tail call i32 @llvm.nvvm.d2i.lo(double %7) #5
  %9 = tail call double @llvm.nvvm.add.rn.d(double %7, double 0xC338000000000000) #5
  %10 = tail call double @llvm.fma.f64(double %9, double 0xBFE62E42FEFA39EF, double %param_1.74310)
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
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.74310) #5
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.fabs.f(float %29) #5
  %31 = fcmp olt float %30, 0x4010C46560000000
  br i1 %31, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %32 = fcmp olt double %param_1.74310, 0.000000e+00
  %33 = fadd double %param_1.74310, 0x7FF0000000000000
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
  %multiply.863.5 = fmul double %param_2.6499, %z.2.i
  %compare.267.3 = fcmp ogt double %multiply.863.5, 1.000000e-128
  %45 = zext i1 %compare.267.3 to i8
  %46 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store i8 %45, ptr addrspace(1) %46, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(15360) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.629 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.629, 0
  %2 = add i64 %param_2.629, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.629
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.7314 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = icmp ne i64 %param_1.7314, 0
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i32 %8, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_35(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.580 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.580, 0
  %2 = add i64 %param_2.580, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.580
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6824 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.6824, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.647 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.647, 0
  %2 = add i64 %param_2.647, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.647
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.6924 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %multiply.883.3 = fmul double %param_1.6924, %param_1.6924
  %divide.405.3 = fdiv double 1.000000e+00, %multiply.883.3
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.405.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg7) local_unnamed_addr #2 {
entry:
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.645 = load i64, ptr addrspace(1) %arg219, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.645, 0
  %2 = add i64 %param_2.645, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.645
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg117, i64 %thread_id_x
  %param_1.7414 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %param_7.323 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg729, i64 0, i64 %5
  %param_7.32310 = load double, ptr addrspace(1) %param_7.323, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.55411 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg627, i64 %thread_id_x
  %param_6.40212 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %9 = getelementptr double, ptr addrspace(1) %arg525, i64 %thread_id_x
  %param_5.44513 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %multiply.852.15 = fmul double %param_6.40212, %param_5.44513
  %add.342.13 = fadd double %param_4.55411, %multiply.852.15
  %10 = tail call double @llvm.fma.f64(double %add.342.13, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #5
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #5
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %add.342.13)
  %14 = tail call double @llvm.fma.f64(double %12, double 0xBC7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 0x3EC71DEE62401315)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double 0x3EFA01997C89EB71)
  %18 = tail call double @llvm.fma.f64(double %17, double %14, double 0x3F2A01A014761F65)
  %19 = tail call double @llvm.fma.f64(double %18, double %14, double 0x3F56C16C1852B7AF)
  %20 = tail call double @llvm.fma.f64(double %19, double %14, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %20, double %14, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %21, double %14, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %22, double %14, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %23, double %14, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %24, double %14, double 1.000000e+00)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #5
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #5
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #5
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.13) #5
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #5
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %add.342.13, 0.000000e+00
  %36 = fadd double %add.342.13, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #5
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #5
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.853.17 = fmul double %param_7.32310, %z.2.i
  %compare.265.9 = fcmp ogt double %multiply.853.17, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.62514 = load double, ptr addrspace(1) %48, align 8, !invariant.load !123
  %49 = select i1 %compare.265.9, double %multiply.853.17, double %param_3.62514
  %add.343.3 = fadd double %param_1.7414, %49
  %multiply.881.3 = fmul double %add.343.3, %add.343.3
  %divide.403.3 = fdiv double 1.000000e+00, %multiply.881.3
  %50 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg015, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.403.3, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_37(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.534 = load i64, ptr addrspace(1) %arg422, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_4.534, 0
  %2 = add i64 %param_4.534, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.534
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_2.632 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr addrspace(1) %arg218, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_2.63211 = load double, ptr addrspace(1) %param_2.632, align 8, !invariant.load !123
  %6 = getelementptr double, ptr addrspace(1) %arg116, i64 %thread_id_x
  %param_1.73412 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %subtract.77.5 = fsub double %param_2.63211, %param_1.73412
  %param_3.611 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg320, i64 0, i64 %5
  %param_3.61113 = load i32, ptr addrspace(1) %param_3.611, align 4, !invariant.load !123
  %7 = sitofp i32 %param_3.61113 to double
  %multiply.854.3 = fmul double %subtract.77.5, %7
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.854.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_40(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.637 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.637, 0
  %2 = add i64 %param_2.637, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.637
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7274 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %subtract.76.1 = fsub double 1.000000e+00, %param_1.7274
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.76.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.586 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_3.586, 0
  %2 = add i64 %param_3.586, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.586
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.5864 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.6885 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %multiply.851.3 = fmul double %param_2.5864, %param_1.6885
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.851.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg7) local_unnamed_addr #2 {
entry:
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.582 = load i64, ptr addrspace(1) %arg219, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.582, 0
  %2 = add i64 %param_2.582, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.582
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_7.326 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg729, i64 0, i64 %5
  %param_7.3269 = load double, ptr addrspace(1) %param_7.326, align 8, !invariant.load !123
  %6 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.55810 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg627, i64 %thread_id_x
  %param_6.40711 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg525, i64 %thread_id_x
  %param_5.44912 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %multiply.852.29 = fmul double %param_6.40711, %param_5.44912
  %add.342.27 = fadd double %param_4.55810, %multiply.852.29
  %9 = tail call double @llvm.fma.f64(double %add.342.27, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %10 = tail call i32 @llvm.nvvm.d2i.lo(double %9) #5
  %11 = tail call double @llvm.nvvm.add.rn.d(double %9, double 0xC338000000000000) #5
  %12 = tail call double @llvm.fma.f64(double %11, double 0xBFE62E42FEFA39EF, double %add.342.27)
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
  %30 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.27) #5
  %31 = bitcast i32 %30 to float
  %32 = tail call float @llvm.nvvm.fabs.f(float %31) #5
  %33 = fcmp olt float %32, 0x4010C46560000000
  br i1 %33, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %34 = fcmp olt double %add.342.27, 0.000000e+00
  %35 = fadd double %add.342.27, 0x7FF0000000000000
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
  %multiply.853.45 = fmul double %param_7.3269, %z.2.i
  %compare.265.23 = fcmp ogt double %multiply.853.45, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.58113 = load double, ptr addrspace(1) %47, align 8, !invariant.load !123
  %48 = select i1 %compare.265.23, double %multiply.853.45, double %param_3.58113
  %49 = getelementptr double, ptr addrspace(1) %arg117, i64 %thread_id_x
  %param_1.68414 = load double, ptr addrspace(1) %49, align 8, !invariant.load !123
  %multiply.857.4 = fmul double %param_1.68414, %48
  %50 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg015, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.857.4, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg8) local_unnamed_addr #2 {
entry:
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.602 = load i64, ptr addrspace(1) %arg322, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_3.602, 0
  %2 = add i64 %param_3.602, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.602
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.6124 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %param_8.323 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg832, i64 0, i64 %5
  %param_8.32310 = load double, ptr addrspace(1) %param_8.323, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg526, i64 %thread_id_x
  %param_5.45011 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg730, i64 %thread_id_x
  %param_7.32712 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %9 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.40813 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %multiply.852.33 = fmul double %param_7.32712, %param_6.40813
  %add.342.31 = fadd double %param_5.45011, %multiply.852.33
  %10 = tail call double @llvm.fma.f64(double %add.342.31, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #5
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #5
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %add.342.31)
  %14 = tail call double @llvm.fma.f64(double %12, double 0xBC7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 0x3EC71DEE62401315)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double 0x3EFA01997C89EB71)
  %18 = tail call double @llvm.fma.f64(double %17, double %14, double 0x3F2A01A014761F65)
  %19 = tail call double @llvm.fma.f64(double %18, double %14, double 0x3F56C16C1852B7AF)
  %20 = tail call double @llvm.fma.f64(double %19, double %14, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %20, double %14, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %21, double %14, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %22, double %14, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %23, double %14, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %24, double %14, double 1.000000e+00)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #5
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #5
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #5
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.31) #5
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #5
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %add.342.31, 0.000000e+00
  %36 = fadd double %add.342.31, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #5
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #5
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.853.53 = fmul double %param_8.32310, %z.2.i
  %compare.265.27 = fcmp ogt double %multiply.853.53, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg424, i64 %thread_id_x
  %param_4.52714 = load double, ptr addrspace(1) %48, align 8, !invariant.load !123
  %49 = select i1 %compare.265.27, double %multiply.853.53, double %param_4.52714
  %50 = getelementptr double, ptr addrspace(1) %arg118, i64 %thread_id_x
  %param_1.71415 = load double, ptr addrspace(1) %50, align 8, !invariant.load !123
  %multiply.857.11 = fmul double %param_1.71415, %49
  %multiply.864.3 = fmul double %param_2.6124, %multiply.857.11
  %multiply.869.3 = fmul double %multiply.864.3, %multiply.864.3
  %51 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg016, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.869.3, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg8) local_unnamed_addr #2 {
entry:
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.638 = load i64, ptr addrspace(1) %arg322, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_3.638, 0
  %2 = add i64 %param_3.638, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.638
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.6574 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %param_8.326 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg832, i64 0, i64 %5
  %param_8.32610 = load double, ptr addrspace(1) %param_8.326, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg526, i64 %thread_id_x
  %param_5.45211 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg730, i64 %thread_id_x
  %param_7.33012 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %9 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.41113 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %multiply.852.37 = fmul double %param_7.33012, %param_6.41113
  %add.342.35 = fadd double %param_5.45211, %multiply.852.37
  %10 = tail call double @llvm.fma.f64(double %add.342.35, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #5
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #5
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %add.342.35)
  %14 = tail call double @llvm.fma.f64(double %12, double 0xBC7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 0x3EC71DEE62401315)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double 0x3EFA01997C89EB71)
  %18 = tail call double @llvm.fma.f64(double %17, double %14, double 0x3F2A01A014761F65)
  %19 = tail call double @llvm.fma.f64(double %18, double %14, double 0x3F56C16C1852B7AF)
  %20 = tail call double @llvm.fma.f64(double %19, double %14, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %20, double %14, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %21, double %14, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %22, double %14, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %23, double %14, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %24, double %14, double 1.000000e+00)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #5
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #5
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #5
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.35) #5
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #5
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %add.342.35, 0.000000e+00
  %36 = fadd double %add.342.35, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #5
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #5
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.853.61 = fmul double %param_8.32610, %z.2.i
  %compare.265.31 = fcmp ogt double %multiply.853.61, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg424, i64 %thread_id_x
  %param_4.56014 = load double, ptr addrspace(1) %48, align 8, !invariant.load !123
  %49 = select i1 %compare.265.31, double %multiply.853.61, double %param_4.56014
  %50 = getelementptr double, ptr addrspace(1) %arg118, i64 %thread_id_x
  %param_1.74815 = load double, ptr addrspace(1) %50, align 8, !invariant.load !123
  %multiply.857.15 = fmul double %param_1.74815, %49
  %multiply.864.7 = fmul double %param_2.6574, %multiply.857.15
  %multiply.887.3 = fmul double %multiply.864.7, 2.000000e+00
  %51 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg016, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.887.3, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg8) local_unnamed_addr #2 {
entry:
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.640 = load i64, ptr addrspace(1) %arg322, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_3.640, 0
  %2 = add i64 %param_3.640, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.640
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg118, i64 %thread_id_x
  %param_1.7514 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %param_8.328 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg832, i64 0, i64 %5
  %param_8.32810 = load double, ptr addrspace(1) %param_8.328, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg526, i64 %thread_id_x
  %param_5.45411 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg730, i64 %thread_id_x
  %param_7.33212 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %9 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.41313 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %multiply.852.13 = fmul double %param_7.33212, %param_6.41313
  %add.342.11 = fadd double %param_5.45411, %multiply.852.13
  %10 = tail call double @llvm.fma.f64(double %add.342.11, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #5
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #5
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %add.342.11)
  %14 = tail call double @llvm.fma.f64(double %12, double 0xBC7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 0x3EC71DEE62401315)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double 0x3EFA01997C89EB71)
  %18 = tail call double @llvm.fma.f64(double %17, double %14, double 0x3F2A01A014761F65)
  %19 = tail call double @llvm.fma.f64(double %18, double %14, double 0x3F56C16C1852B7AF)
  %20 = tail call double @llvm.fma.f64(double %19, double %14, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %20, double %14, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %21, double %14, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %22, double %14, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %23, double %14, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %24, double %14, double 1.000000e+00)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #5
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #5
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #5
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.11) #5
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #5
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %add.342.11, 0.000000e+00
  %36 = fadd double %add.342.11, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #5
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #5
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.872.9 = fmul double %param_1.7514, %param_1.7514
  %multiply.873.7 = fmul double %multiply.872.9, 5.000000e-01
  %multiply.853.13 = fmul double %param_8.32810, %z.2.i
  %compare.265.7 = fcmp ogt double %multiply.853.13, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg424, i64 %thread_id_x
  %param_4.56214 = load double, ptr addrspace(1) %48, align 8, !invariant.load !123
  %49 = select i1 %compare.265.7, double %multiply.853.13, double %param_4.56214
  %50 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.66115 = load double, ptr addrspace(1) %50, align 8, !invariant.load !123
  %multiply.857.5 = fmul double %param_2.66115, %49
  %multiply.874.1 = fmul double %multiply.873.7, %multiply.857.5
  %51 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg016, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.874.1, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg8) local_unnamed_addr #2 {
entry:
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.607 = load i64, ptr addrspace(1) %arg322, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_3.607, 0
  %2 = add i64 %param_3.607, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.607
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.6224 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %param_8.317 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg832, i64 0, i64 %5
  %param_8.31710 = load double, ptr addrspace(1) %param_8.317, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg526, i64 %thread_id_x
  %param_5.44011 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg730, i64 %thread_id_x
  %param_7.31912 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %9 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.39813 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %multiply.852.39 = fmul double %param_7.31912, %param_6.39813
  %add.342.37 = fadd double %param_5.44011, %multiply.852.39
  %10 = tail call double @llvm.fma.f64(double %add.342.37, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #5
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #5
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %add.342.37)
  %14 = tail call double @llvm.fma.f64(double %12, double 0xBC7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 0x3EC71DEE62401315)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double 0x3EFA01997C89EB71)
  %18 = tail call double @llvm.fma.f64(double %17, double %14, double 0x3F2A01A014761F65)
  %19 = tail call double @llvm.fma.f64(double %18, double %14, double 0x3F56C16C1852B7AF)
  %20 = tail call double @llvm.fma.f64(double %19, double %14, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %20, double %14, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %21, double %14, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %22, double %14, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %23, double %14, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %24, double %14, double 1.000000e+00)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #5
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #5
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #5
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.37) #5
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #5
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %add.342.37, 0.000000e+00
  %36 = fadd double %add.342.37, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #5
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #5
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.853.65 = fmul double %param_8.31710, %z.2.i
  %compare.265.33 = fcmp ogt double %multiply.853.65, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg424, i64 %thread_id_x
  %param_4.53114 = load double, ptr addrspace(1) %48, align 8, !invariant.load !123
  %49 = select i1 %compare.265.33, double %multiply.853.65, double %param_4.53114
  %50 = getelementptr double, ptr addrspace(1) %arg118, i64 %thread_id_x
  %param_1.72415 = load double, ptr addrspace(1) %50, align 8, !invariant.load !123
  %multiply.857.17 = fmul double %param_1.72415, %49
  %multiply.864.9 = fmul double %param_2.6224, %multiply.857.17
  %51 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg016, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.864.9, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_43(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.719 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_1.719, 0
  %2 = add i64 %param_1.719, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.719
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_6.403 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg626, i64 0, i64 %5
  %param_6.4039 = load double, ptr addrspace(1) %param_6.403, align 8, !invariant.load !123
  %6 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.63410 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.44611 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.55512 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %multiply.852.17 = fmul double %param_5.44611, %param_4.55512
  %add.342.15 = fadd double %param_3.63410, %multiply.852.17
  %9 = tail call double @llvm.fma.f64(double %add.342.15, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %10 = tail call i32 @llvm.nvvm.d2i.lo(double %9) #5
  %11 = tail call double @llvm.nvvm.add.rn.d(double %9, double 0xC338000000000000) #5
  %12 = tail call double @llvm.fma.f64(double %11, double 0xBFE62E42FEFA39EF, double %add.342.15)
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
  %30 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.15) #5
  %31 = bitcast i32 %30 to float
  %32 = tail call float @llvm.nvvm.fabs.f(float %31) #5
  %33 = fcmp olt float %32, 0x4010C46560000000
  br i1 %33, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %34 = fcmp olt double %add.342.15, 0.000000e+00
  %35 = fadd double %add.342.15, 0x7FF0000000000000
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
  %multiply.853.21 = fmul double %param_6.4039, %z.2.i
  %compare.265.11 = fcmp ogt double %multiply.853.21, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.61713 = load double, ptr addrspace(1) %47, align 8, !invariant.load !123
  %48 = select i1 %compare.265.11, double %multiply.853.21, double %param_2.61713
  %49 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %48, ptr addrspace(1) %49, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_46(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.526 = load i64, ptr addrspace(1) %arg415, align 128, !invariant.load !123
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.7134 = load double, ptr addrspace(1) %1, align 8, !invariant.load !123
  %2 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.6015 = load double, ptr addrspace(1) %2, align 8, !invariant.load !123
  %3 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.6116 = load double, ptr addrspace(1) %3, align 8, !invariant.load !123
  %multiply.852.7 = fmul double %param_3.6015, %param_2.6116
  %add.342.5 = fadd double %param_1.7134, %multiply.852.7
  %4 = tail call double @llvm.fma.f64(double %add.342.5, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #5
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #5
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.342.5)
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
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.5) #5
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #5
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.342.5, 0.000000e+00
  %30 = fadd double %add.342.5, 0x7FF0000000000000
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
  %42 = icmp slt i64 %param_4.526, 0
  %43 = add i64 %param_4.526, 192
  %44 = select i1 %42, i64 %43, i64 %param_4.526
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %47 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %46, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_4(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.662 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.662, 0
  %2 = add i64 %param_2.662, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.662
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7524 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %multiply.872.5 = fmul double %param_1.7524, %param_1.7524
  %multiply.873.3 = fmul double %multiply.872.5, 5.000000e-01
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.873.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.655 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.655, 0
  %2 = add i64 %param_2.655, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.655
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7104 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %multiply.888.3 = fmul double %param_1.7104, 2.000000e+00
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.888.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_58(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.619 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.619, 0
  %2 = add i64 %param_2.619, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.619
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_1.721 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg112, i64 0, i64 %5
  %param_1.7219 = load double, ptr addrspace(1) %param_1.721, align 8, !invariant.load !123
  %6 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.7219, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.596 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.596, 0
  %2 = add i64 %param_2.596, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.596
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6984 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = sitofp i64 %param_1.6984 to double
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.618 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.618, 0
  %2 = add i64 %param_2.618, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.618
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7204 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.7204, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_48(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.607 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.607, 0
  %2 = add i64 %param_2.607, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.607
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7094 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.7094, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_51(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.553 = load i64, ptr addrspace(1) %arg420, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_4.553, 0
  %2 = add i64 %param_4.553, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.553
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_3.633 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg318, i64 0, i64 %5
  %param_3.6339 = load double, ptr addrspace(1) %param_3.633, align 8, !invariant.load !123
  %6 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.65210 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = tail call double @llvm.fma.f64(double %param_2.65210, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %8 = tail call i32 @llvm.nvvm.d2i.lo(double %7) #5
  %9 = tail call double @llvm.nvvm.add.rn.d(double %7, double 0xC338000000000000) #5
  %10 = tail call double @llvm.fma.f64(double %9, double 0xBFE62E42FEFA39EF, double %param_2.65210)
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
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.65210) #5
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.fabs.f(float %29) #5
  %31 = fcmp olt float %30, 0x4010C46560000000
  br i1 %31, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %32 = fcmp olt double %param_2.65210, 0.000000e+00
  %33 = fadd double %param_2.65210, 0x7FF0000000000000
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
  %multiply.863.15 = fmul double %param_3.6339, %z.2.i
  %compare.267.11 = fcmp ogt double %multiply.863.15, 1.000000e-128
  %45 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.70111 = load double, ptr addrspace(1) %45, align 8, !invariant.load !123
  %46 = select i1 %compare.267.11, double %multiply.863.15, double %param_1.70111
  %47 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store double %46, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_54(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.593 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6954 = load double, ptr addrspace(1) %1, align 8, !invariant.load !123
  %2 = tail call double @llvm.fma.f64(double %param_1.6954, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #5
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #5
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_1.6954)
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
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.6954) #5
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #5
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_1.6954, 0.000000e+00
  %28 = fadd double %param_1.6954, 0x7FF0000000000000
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
  %40 = icmp slt i64 %param_2.593, 0
  %41 = add i64 %param_2.593, 192
  %42 = select i1 %40, i64 %41, i64 %param_2.593
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %45 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %44, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %45, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_select_fusion(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg17, ptr noalias nocapture align 128 dereferenceable(160) %arg18, ptr noalias nocapture align 128 dereferenceable(160) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg20, ptr noalias nocapture align 128 dereferenceable(160) %arg21, ptr noalias nocapture align 128 dereferenceable(160) %arg22, ptr noalias nocapture align 128 dereferenceable(160) %arg23, ptr noalias nocapture align 128 dereferenceable(160) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg25, ptr noalias nocapture align 128 dereferenceable(160) %arg26, ptr noalias nocapture align 128 dereferenceable(160) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg28, ptr noalias nocapture align 128 dereferenceable(160) %arg29, ptr noalias nocapture align 128 dereferenceable(160) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg31, ptr noalias nocapture align 128 dereferenceable(160) %arg32, ptr noalias nocapture align 128 dereferenceable(160) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg34, ptr noalias nocapture align 128 dereferenceable(80) %arg35, ptr noalias nocapture align 128 dereferenceable(160) %arg36, ptr noalias nocapture align 128 dereferenceable(160) %arg37, ptr noalias nocapture align 128 dereferenceable(160) %arg38, ptr noalias nocapture align 128 dereferenceable(160) %arg39, ptr noalias nocapture align 128 dereferenceable(160) %arg40, ptr noalias nocapture align 128 dereferenceable(160) %arg41, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg45, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg46, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg47, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg48) local_unnamed_addr #2 {
entry:
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
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg1436, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !123
  %4 = getelementptr double, ptr addrspace(1) %arg1538, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !123
  %6 = load i64, ptr addrspace(1) %arg722, align 128, !invariant.load !123
  %7 = icmp slt i64 %6, 0
  %8 = add i64 %6, 192
  %9 = select i1 %7, i64 %8, i64 %6
  %10 = trunc i64 %9 to i32
  %11 = tail call i32 @llvm.smax.i32(i32 %10, i32 0)
  %12 = tail call i32 @llvm.umin.i32(i32 %11, i32 191)
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg620, i64 0, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !123
  %16 = getelementptr double, ptr addrspace(1) %arg1334, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !123
  %18 = getelementptr double, ptr addrspace(1) %arg4292, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !123
  %20 = getelementptr double, ptr addrspace(1) %arg3170, i64 %1
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !123
  %22 = getelementptr double, ptr addrspace(1) %arg2456, i64 %1
  %23 = load double, ptr addrspace(1) %22, align 8
  %24 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr addrspace(1) %arg3476, i64 0, i64 %13, i64 %1, i64 0
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !123
  %26 = getelementptr double, ptr addrspace(1) %arg2864, i64 %1
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !123
  %28 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg1232, i64 0, i64 %13
  %29 = load i32, ptr addrspace(1) %28, align 4, !invariant.load !123
  %30 = getelementptr i64, ptr addrspace(1) %arg314, i64 %1
  %31 = load i64, ptr addrspace(1) %30, align 8, !invariant.load !123
  %32 = getelementptr double, ptr addrspace(1) %arg08, i64 %1
  %33 = load double, ptr addrspace(1) %32, align 8
  %34 = getelementptr double, ptr addrspace(1) %arg212, i64 %1
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !123
  %36 = tail call double @llvm.fma.f64(double %35, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %37 = tail call i32 @llvm.nvvm.d2i.lo(double %36) #5
  %38 = tail call double @llvm.nvvm.add.rn.d(double %36, double 0xC338000000000000) #5
  %39 = tail call double @llvm.fma.f64(double %38, double 0xBFE62E42FEFA39EF, double %35)
  %40 = tail call double @llvm.fma.f64(double %38, double 0xBC7ABC9E3B39803F, double %39)
  %41 = tail call double @llvm.fma.f64(double %40, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %42 = tail call double @llvm.fma.f64(double %41, double %40, double 0x3EC71DEE62401315)
  %43 = tail call double @llvm.fma.f64(double %42, double %40, double 0x3EFA01997C89EB71)
  %44 = tail call double @llvm.fma.f64(double %43, double %40, double 0x3F2A01A014761F65)
  %45 = tail call double @llvm.fma.f64(double %44, double %40, double 0x3F56C16C1852B7AF)
  %46 = tail call double @llvm.fma.f64(double %45, double %40, double 0x3F81111111122322)
  %47 = tail call double @llvm.fma.f64(double %46, double %40, double 0x3FA55555555502A1)
  %48 = tail call double @llvm.fma.f64(double %47, double %40, double 0x3FC5555555555511)
  %49 = tail call double @llvm.fma.f64(double %48, double %40, double 0x3FE000000000000B)
  %50 = tail call double @llvm.fma.f64(double %49, double %40, double 1.000000e+00)
  %51 = tail call double @llvm.fma.f64(double %50, double %40, double 1.000000e+00)
  %52 = tail call i32 @llvm.nvvm.d2i.lo(double %51) #5
  %53 = tail call i32 @llvm.nvvm.d2i.hi(double %51) #5
  %54 = shl i32 %37, 20
  %55 = add i32 %53, %54
  %56 = tail call double @llvm.nvvm.lohi.i2d(i32 %52, i32 %55) #5
  %57 = tail call i32 @llvm.nvvm.d2i.hi(double %35) #5
  %58 = bitcast i32 %57 to float
  %59 = tail call float @llvm.nvvm.fabs.f(float %58) #5
  %60 = fcmp olt float %59, 0x4010C46560000000
  br i1 %60, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %61 = fcmp olt double %35, 0.000000e+00
  %62 = fadd double %35, 0x7FF0000000000000
  %z.0.i = select i1 %61, double 0.000000e+00, double %62
  %63 = fcmp olt float %59, 0x4010E90000000000
  br i1 %63, label %64, label %__nv_exp.exit

64:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %65 = sdiv i32 %37, 2
  %66 = shl i32 %65, 20
  %67 = add i32 %53, %66
  %68 = tail call double @llvm.nvvm.lohi.i2d(i32 %52, i32 %67) #5
  %69 = sub nsw i32 %37, %65
  %70 = shl i32 %69, 20
  %71 = add nsw i32 %70, 1072693248
  %72 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %71) #5
  %73 = fmul double %72, %68
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %64
  %z.2.i = phi double [ %56, %entry ], [ %73, %64 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %74 = getelementptr double, ptr addrspace(1) %arg2048, i64 %1
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !123
  %76 = getelementptr double, ptr addrspace(1) %arg518, i64 %1
  %77 = load double, ptr addrspace(1) %76, align 8, !invariant.load !123
  %78 = getelementptr double, ptr addrspace(1) %arg926, i64 %1
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !123
  %80 = getelementptr double, ptr addrspace(1) %arg1130, i64 %1
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !123
  %82 = getelementptr double, ptr addrspace(1) %arg1028, i64 %1
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !123
  %multiply.852.31 = fmul double %81, %83
  %add.342.29 = fadd double %79, %multiply.852.31
  %84 = tail call double @llvm.fma.f64(double %add.342.29, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %85 = tail call i32 @llvm.nvvm.d2i.lo(double %84) #5
  %86 = tail call double @llvm.nvvm.add.rn.d(double %84, double 0xC338000000000000) #5
  %87 = tail call double @llvm.fma.f64(double %86, double 0xBFE62E42FEFA39EF, double %add.342.29)
  %88 = tail call double @llvm.fma.f64(double %86, double 0xBC7ABC9E3B39803F, double %87)
  %89 = tail call double @llvm.fma.f64(double %88, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %90 = tail call double @llvm.fma.f64(double %89, double %88, double 0x3EC71DEE62401315)
  %91 = tail call double @llvm.fma.f64(double %90, double %88, double 0x3EFA01997C89EB71)
  %92 = tail call double @llvm.fma.f64(double %91, double %88, double 0x3F2A01A014761F65)
  %93 = tail call double @llvm.fma.f64(double %92, double %88, double 0x3F56C16C1852B7AF)
  %94 = tail call double @llvm.fma.f64(double %93, double %88, double 0x3F81111111122322)
  %95 = tail call double @llvm.fma.f64(double %94, double %88, double 0x3FA55555555502A1)
  %96 = tail call double @llvm.fma.f64(double %95, double %88, double 0x3FC5555555555511)
  %97 = tail call double @llvm.fma.f64(double %96, double %88, double 0x3FE000000000000B)
  %98 = tail call double @llvm.fma.f64(double %97, double %88, double 1.000000e+00)
  %99 = tail call double @llvm.fma.f64(double %98, double %88, double 1.000000e+00)
  %100 = tail call i32 @llvm.nvvm.d2i.lo(double %99) #5
  %101 = tail call i32 @llvm.nvvm.d2i.hi(double %99) #5
  %102 = shl i32 %85, 20
  %103 = add i32 %101, %102
  %104 = tail call double @llvm.nvvm.lohi.i2d(i32 %100, i32 %103) #5
  %105 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.29) #5
  %106 = bitcast i32 %105 to float
  %107 = tail call float @llvm.nvvm.fabs.f(float %106) #5
  %108 = fcmp olt float %107, 0x4010C46560000000
  br i1 %108, label %__nv_exp.exit7, label %__internal_fast_icmp_abs_lt.exit.i4

__internal_fast_icmp_abs_lt.exit.i4:              ; preds = %__nv_exp.exit
  %109 = fcmp olt double %add.342.29, 0.000000e+00
  %110 = fadd double %add.342.29, 0x7FF0000000000000
  %z.0.i5 = select i1 %109, double 0.000000e+00, double %110
  %111 = fcmp olt float %107, 0x4010E90000000000
  br i1 %111, label %112, label %__nv_exp.exit7

112:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i4
  %113 = sdiv i32 %85, 2
  %114 = shl i32 %113, 20
  %115 = add i32 %101, %114
  %116 = tail call double @llvm.nvvm.lohi.i2d(i32 %100, i32 %115) #5
  %117 = sub nsw i32 %85, %113
  %118 = shl i32 %117, 20
  %119 = add nsw i32 %118, 1072693248
  %120 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %119) #5
  %121 = fmul double %120, %116
  br label %__nv_exp.exit7

__nv_exp.exit7:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i4, %112
  %z.2.i6 = phi double [ %104, %__nv_exp.exit ], [ %121, %112 ], [ %z.0.i5, %__internal_fast_icmp_abs_lt.exit.i4 ]
  %divide.396.1.clone.1 = fdiv double 1.000000e+00, %33
  %multiply.863.3 = fmul double %15, %z.2.i
  %compare.267.9.clone.1 = fcmp ogt double %multiply.863.3, 1.000000e-128
  %122 = select i1 %compare.267.9.clone.1, double %multiply.863.3, double %75
  %add.348.2.clone.1 = fadd double %divide.396.1.clone.1, %122
  %divide.397.1.clone.1 = fdiv double 1.000000e+00, %add.348.2.clone.1
  %add.350.2 = fadd double %divide.396.1.clone.1, %multiply.863.3
  %divide.399.3 = fdiv double 1.000000e+00, %add.350.2
  %.not = icmp eq i64 %31, 0
  %multiply.848.55 = fmul double %3, %5
  %multiply.849.57 = fmul double %15, %17
  %add.340.55 = fadd double %multiply.848.55, %multiply.849.57
  %multiply.851.5.clone.1 = fmul double %19, %21
  %divide.393.1.clone.1 = fdiv double %multiply.851.5.clone.1, %23
  %subtract.77.7.clone.1 = fsub double %25, %27
  %123 = sitofp i32 %29 to double
  %multiply.854.5.clone.1 = fmul double %subtract.77.7.clone.1, %123
  %divide.394.1.clone.1 = fdiv double %multiply.854.5.clone.1, %21
  %multiply.855.55 = fmul double %divide.394.1.clone.1, %123
  %multiply.856.51 = fmul double %divide.393.1.clone.1, %multiply.855.55
  %add.344.51 = fadd double %add.340.55, %multiply.856.51
  %124 = tail call double @llvm.fabs.f64(double %add.344.51)
  %125 = call i1 @llvm.is.fpclass.f64(double %add.344.51, i32 504)
  %compare.266.41 = fcmp olt double %124, 1.400000e+01
  %126 = and i1 %125, %compare.266.41
  %multiply.853.49 = fmul double %15, %z.2.i6
  %compare.265.25 = fcmp ogt double %multiply.853.49, 1.000000e-128
  %127 = getelementptr double, ptr addrspace(1) %arg824, i64 %1
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !123
  %129 = select i1 %compare.265.25, double %multiply.853.49, double %128
  %130 = getelementptr double, ptr addrspace(1) %arg416, i64 %1
  %131 = load double, ptr addrspace(1) %130, align 8, !invariant.load !123
  %multiply.857.23 = fmul double %131, %129
  %multiply.864.15 = fmul double %77, %multiply.857.23
  %multiply.869.23 = fmul double %multiply.864.15, %multiply.864.15
  %multiply.870.11 = fmul double %multiply.869.23, 5.000000e-01
  %132 = getelementptr double, ptr addrspace(1) %arg2558, i64 %1
  %133 = load double, ptr addrspace(1) %132, align 8, !invariant.load !123
  %add.343.1.clone.1 = fadd double %133, %129
  %multiply.858.1.clone.1 = fmul double %23, %add.343.1.clone.1
  %divide.395.3.clone.1 = fdiv double 1.000000e+00, %multiply.858.1.clone.1
  %subtract.78.1.clone.1 = fsub double %add.344.51, %add.340.55
  %multiply.859.4.clone.1 = fmul double %subtract.78.1.clone.1, %subtract.78.1.clone.1
  %multiply.860.3.clone.1 = fmul double %multiply.859.4.clone.1, %131
  %add.345.3.clone.1 = fadd double %multiply.860.3.clone.1, %divide.395.3.clone.1
  %add.346.1.clone.1 = fadd double %add.345.3.clone.1, -1.000000e+00
  %multiply.871.11 = fmul double %multiply.869.23, %add.346.1.clone.1
  %add.351.9 = fadd double %multiply.870.11, %multiply.871.11
  %multiply.872.11 = fmul double %77, %77
  %multiply.873.9 = fmul double %multiply.872.11, 5.000000e-01
  %multiply.874.4 = fmul double %multiply.873.9, %multiply.857.23
  %multiply.875.7 = fmul double %multiply.874.4, %add.346.1.clone.1
  %subtract.79.7 = fsub double %add.351.9, %multiply.875.7
  %134 = sitofp i64 %31 to double
  %multiply.876.5 = fmul double %subtract.79.7, %134
  %add.352.3 = fadd double %divide.397.1.clone.1, %multiply.876.5
  %compare.270.5 = fcmp ogt double %add.352.3, 1.000000e-128
  %135 = getelementptr double, ptr addrspace(1) %arg110, i64 %1
  %136 = load double, ptr addrspace(1) %135, align 8, !invariant.load !123
  %137 = select i1 %compare.270.5, double %add.352.3, double %136
  %138 = select i1 %.not, double %divide.399.3, double %137
  %139 = select i1 %126, double %138, double %33
  %140 = getelementptr double, ptr addrspace(1) %arg1742, i64 %1
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !123
  %multiply.861.3.clone.1 = fmul double %83, %141
  %142 = getelementptr double, ptr addrspace(1) %arg1640, i64 %1
  %143 = load double, ptr addrspace(1) %142, align 8, !invariant.load !123
  %multiply.862.5.clone.1 = fmul double %15, %143
  %add.347.3.clone.1 = fadd double %multiply.861.3.clone.1, %multiply.862.5.clone.1
  %multiply.865.2.clone.1 = fmul double %multiply.864.15, %add.346.1.clone.1
  %multiply.866.9.clone.1 = fmul double %divide.397.1.clone.1, 2.000000e+00
  %divide.398.5.clone.1 = fdiv double 1.000000e+00, %multiply.866.9.clone.1
  %multiply.867.1.clone.1 = fmul double %divide.398.5.clone.1, %multiply.865.2.clone.1
  %multiply.868.1.clone.1 = fmul double %multiply.867.1.clone.1, %134
  %add.349.1.clone.1 = fadd double %add.347.3.clone.1, %multiply.868.1.clone.1
  %144 = select i1 %126, double %add.349.1.clone.1, double %83
  %145 = getelementptr double, ptr addrspace(1) %arg1844, i64 %1
  %146 = load double, ptr addrspace(1) %145, align 8
  %147 = select i1 %126, double %divide.397.1.clone.1, double %146
  %multiply.877.1.clone.1 = fmul double %122, %divide.397.1.clone.1
  %148 = getelementptr double, ptr addrspace(1) %arg1946, i64 %1
  %149 = load double, ptr addrspace(1) %148, align 8
  %150 = select i1 %126, double %multiply.877.1.clone.1, double %149
  %151 = getelementptr double, ptr addrspace(1) %arg2150, i64 %1
  %152 = load double, ptr addrspace(1) %151, align 8
  %153 = select i1 %126, double %divide.396.1.clone.1, double %152
  %154 = getelementptr double, ptr addrspace(1) %arg2252, i64 %1
  %155 = load double, ptr addrspace(1) %154, align 8
  %156 = select i1 %126, double %add.347.3.clone.1, double %155
  %157 = getelementptr double, ptr addrspace(1) %arg2354, i64 %1
  %158 = load double, ptr addrspace(1) %157, align 8
  %159 = select i1 %126, double %add.346.1.clone.1, double %158
  %160 = getelementptr double, ptr addrspace(1) %arg2660, i64 %1
  %161 = load double, ptr addrspace(1) %160, align 8
  %162 = select i1 %126, double %divide.394.1.clone.1, double %161
  %163 = select i1 %126, double %add.344.51, double %5
  %164 = getelementptr double, ptr addrspace(1) %arg2762, i64 %1
  %165 = load double, ptr addrspace(1) %164, align 8
  %166 = select i1 %126, double %subtract.78.1.clone.1, double %165
  %167 = getelementptr double, ptr addrspace(1) %arg2966, i64 %1
  %168 = load double, ptr addrspace(1) %167, align 8
  %169 = select i1 %126, double %27, double %168
  %170 = getelementptr double, ptr addrspace(1) %arg3068, i64 %1
  %171 = load double, ptr addrspace(1) %170, align 8
  %172 = select i1 %126, double %15, double %171
  %173 = getelementptr double, ptr addrspace(1) %arg3272, i64 %1
  %174 = load double, ptr addrspace(1) %173, align 8
  %175 = select i1 %126, double %21, double %174
  %176 = getelementptr double, ptr addrspace(1) %arg3374, i64 %1
  %177 = load double, ptr addrspace(1) %176, align 8
  %178 = select i1 %126, double %25, double %177
  %179 = getelementptr i32, ptr addrspace(1) %arg3578, i64 %1
  %180 = load i32, ptr addrspace(1) %179, align 4
  %181 = select i1 %126, i32 %29, i32 %180
  %182 = getelementptr double, ptr addrspace(1) %arg3680, i64 %1
  %183 = load double, ptr addrspace(1) %182, align 8
  %184 = select i1 %126, double %21, double %183
  %185 = getelementptr double, ptr addrspace(1) %arg3782, i64 %1
  %186 = load double, ptr addrspace(1) %185, align 8
  %187 = select i1 %126, double %add.340.55, double %186
  %188 = getelementptr double, ptr addrspace(1) %arg3884, i64 %1
  %189 = load double, ptr addrspace(1) %188, align 8
  %190 = select i1 %126, double %131, double %189
  %191 = getelementptr double, ptr addrspace(1) %arg3986, i64 %1
  %192 = load double, ptr addrspace(1) %191, align 8
  %193 = select i1 %126, double %23, double %192
  %194 = getelementptr double, ptr addrspace(1) %arg4088, i64 %1
  %195 = load double, ptr addrspace(1) %194, align 8
  %196 = select i1 %126, double %133, double %195
  %197 = getelementptr double, ptr addrspace(1) %arg4190, i64 %1
  %198 = load double, ptr addrspace(1) %197, align 8
  %199 = select i1 %126, double %multiply.857.23, double %198
  store double %139, ptr addrspace(1) %32, align 8
  %200 = getelementptr double, ptr addrspace(1) %arg4394, i64 %1
  store double %144, ptr addrspace(1) %200, align 8
  store double %147, ptr addrspace(1) %145, align 8
  store double %150, ptr addrspace(1) %148, align 8
  %201 = getelementptr double, ptr addrspace(1) %arg4496, i64 %1
  store double %divide.397.1.clone.1, ptr addrspace(1) %201, align 8
  store double %153, ptr addrspace(1) %151, align 8
  %202 = getelementptr double, ptr addrspace(1) %arg4598, i64 %1
  store double %divide.396.1.clone.1, ptr addrspace(1) %202, align 8
  store double %156, ptr addrspace(1) %154, align 8
  store double %159, ptr addrspace(1) %157, align 8
  store double %add.346.1.clone.1, ptr addrspace(1) %22, align 8
  store double %162, ptr addrspace(1) %160, align 8
  %203 = getelementptr double, ptr addrspace(1) %arg46100, i64 %1
  store double %163, ptr addrspace(1) %203, align 8
  store double %166, ptr addrspace(1) %164, align 8
  store double %169, ptr addrspace(1) %167, align 8
  store double %172, ptr addrspace(1) %170, align 8
  store double %175, ptr addrspace(1) %173, align 8
  store double %178, ptr addrspace(1) %176, align 8
  store i32 %181, ptr addrspace(1) %179, align 4
  store double %184, ptr addrspace(1) %182, align 8
  store double %187, ptr addrspace(1) %185, align 8
  store double %190, ptr addrspace(1) %188, align 8
  store double %193, ptr addrspace(1) %191, align 8
  store double %196, ptr addrspace(1) %194, align 8
  store double %199, ptr addrspace(1) %197, align 8
  %204 = getelementptr double, ptr addrspace(1) %arg47102, i64 %1
  store double %divide.394.1.clone.1, ptr addrspace(1) %204, align 8
  %205 = getelementptr double, ptr addrspace(1) %arg48104, i64 %1
  store double %divide.393.1.clone.1, ptr addrspace(1) %205, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg11) local_unnamed_addr #2 {
entry:
  %arg1143 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1041 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg939 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg837 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg735 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg633 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg531 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg429 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg327 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg225 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg123 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg021 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_6.414 = load i64, ptr addrspace(1) %arg633, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_6.414, 0
  %2 = add i64 %param_6.414, 192
  %3 = select i1 %1, i64 %2, i64 %param_6.414
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg123, i64 %thread_id_x
  %param_1.7424 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg531, i64 %thread_id_x
  %param_5.4555 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %param_11.204 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1143, i64 0, i64 %5
  %param_11.20411 = load double, ptr addrspace(1) %param_11.204, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg837, i64 %thread_id_x
  %param_8.32912 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %9 = getelementptr double, ptr addrspace(1) %arg1041, i64 %thread_id_x
  %param_10.26613 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %10 = getelementptr double, ptr addrspace(1) %arg939, i64 %thread_id_x
  %param_9.32914 = load double, ptr addrspace(1) %10, align 8, !invariant.load !123
  %multiply.852.27 = fmul double %param_10.26613, %param_9.32914
  %add.342.25 = fadd double %param_8.32912, %multiply.852.27
  %11 = tail call double @llvm.fma.f64(double %add.342.25, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #5
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #5
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %add.342.25)
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
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.25) #5
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #5
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %36 = fcmp olt double %add.342.25, 0.000000e+00
  %37 = fadd double %add.342.25, 0x7FF0000000000000
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
  %multiply.853.41 = fmul double %param_11.20411, %z.2.i
  %compare.265.21 = fcmp ogt double %multiply.853.41, 1.000000e-128
  %49 = getelementptr double, ptr addrspace(1) %arg735, i64 %thread_id_x
  %param_7.33315 = load double, ptr addrspace(1) %49, align 8, !invariant.load !123
  %50 = select i1 %compare.265.21, double %multiply.853.41, double %param_7.33315
  %51 = getelementptr double, ptr addrspace(1) %arg429, i64 %thread_id_x
  %param_4.54916 = load double, ptr addrspace(1) %51, align 8, !invariant.load !123
  %multiply.857.19 = fmul double %param_4.54916, %50
  %multiply.864.11 = fmul double %param_5.4555, %multiply.857.19
  %multiply.869.27 = fmul double %multiply.864.11, %multiply.864.11
  %multiply.870.13 = fmul double %multiply.869.27, 5.000000e-01
  %52 = getelementptr double, ptr addrspace(1) %arg327, i64 %thread_id_x
  %param_3.62817 = load double, ptr addrspace(1) %52, align 8, !invariant.load !123
  %multiply.871.13 = fmul double %param_3.62817, %multiply.869.27
  %add.351.11 = fadd double %multiply.870.13, %multiply.871.13
  %multiply.872.13 = fmul double %param_5.4555, %param_5.4555
  %multiply.873.11 = fmul double %multiply.872.13, 5.000000e-01
  %multiply.874.6 = fmul double %multiply.873.11, %multiply.857.19
  %multiply.875.9 = fmul double %param_3.62817, %multiply.874.6
  %subtract.79.9 = fsub double %add.351.11, %multiply.875.9
  %53 = getelementptr i64, ptr addrspace(1) %arg225, i64 %thread_id_x
  %param_2.64820 = load i64, ptr addrspace(1) %53, align 8, !invariant.load !123
  %54 = sitofp i64 %param_2.64820 to double
  %multiply.876.7 = fmul double %subtract.79.9, %54
  %add.352.5 = fadd double %param_1.7424, %multiply.876.7
  %compare.270.3 = fcmp ogt double %add.352.5, 1.000000e-128
  %55 = zext i1 %compare.270.3 to i8
  %56 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg021, i64 0, i64 %5, i64 %thread_id_x
  store i8 %55, ptr addrspace(1) %56, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8) local_unnamed_addr #2 {
entry:
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.690 = load i64, ptr addrspace(1) %arg118, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_1.690, 0
  %2 = add i64 %param_1.690, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.690
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg730, i64 %thread_id_x
  %param_7.3344 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg832, i64 %thread_id_x
  %param_8.3315 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %multiply.848.63 = fmul double %param_7.3344, %param_8.3315
  %param_6.415 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg628, i64 0, i64 %5
  %param_6.41511 = load double, ptr addrspace(1) %param_6.415, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg526, i64 %thread_id_x
  %param_5.45612 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %multiply.849.65 = fmul double %param_6.41511, %param_5.45612
  %add.340.63 = fadd double %multiply.848.63, %multiply.849.65
  %9 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.66513 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %10 = getelementptr double, ptr addrspace(1) %arg322, i64 %thread_id_x
  %param_3.64114 = load double, ptr addrspace(1) %10, align 8, !invariant.load !123
  %param_4.563 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg424, i64 0, i64 %5
  %param_4.56315 = load i32, ptr addrspace(1) %param_4.563, align 4, !invariant.load !123
  %11 = sitofp i32 %param_4.56315 to double
  %multiply.855.63 = fmul double %param_3.64114, %11
  %multiply.856.59 = fmul double %param_2.66513, %multiply.855.63
  %add.344.59 = fadd double %add.340.63, %multiply.856.59
  %12 = tail call double @llvm.fabs.f64(double %add.344.59)
  %13 = call i1 @llvm.is.fpclass.f64(double %add.344.59, i32 504)
  %compare.266.49 = fcmp olt double %12, 1.400000e+01
  %14 = and i1 %13, %compare.266.49
  %15 = zext i1 %14 to i8
  %16 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg016, i64 0, i64 %5, i64 %thread_id_x
  store i8 %15, ptr addrspace(1) %16, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.685 = load i64, ptr addrspace(1) %arg119, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_1.685, 0
  %2 = add i64 %param_1.685, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.685
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg731, i64 %thread_id_x
  %param_7.3515 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg833, i64 %thread_id_x
  %param_8.3496 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %multiply.848.61 = fmul double %param_7.3515, %param_8.3496
  %param_6.432 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg629, i64 0, i64 %5
  %param_6.43212 = load double, ptr addrspace(1) %param_6.432, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg527, i64 %thread_id_x
  %param_5.47013 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %multiply.849.63 = fmul double %param_6.43212, %param_5.47013
  %add.340.61 = fadd double %multiply.848.61, %multiply.849.63
  %9 = getelementptr double, ptr addrspace(1) %arg221, i64 %thread_id_x
  %param_2.67614 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %10 = getelementptr double, ptr addrspace(1) %arg323, i64 %thread_id_x
  %param_3.65515 = load double, ptr addrspace(1) %10, align 8, !invariant.load !123
  %param_4.577 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg425, i64 0, i64 %5
  %param_4.57716 = load i32, ptr addrspace(1) %param_4.577, align 4, !invariant.load !123
  %11 = sitofp i32 %param_4.57716 to double
  %multiply.855.61 = fmul double %param_3.65515, %11
  %multiply.856.57 = fmul double %param_2.67614, %multiply.855.61
  %add.344.57 = fadd double %add.340.61, %multiply.856.57
  %12 = tail call double @llvm.fabs.f64(double %add.344.57)
  %13 = call i1 @llvm.is.fpclass.f64(double %add.344.57, i32 504)
  %compare.266.47 = fcmp olt double %12, 1.400000e+01
  %14 = and i1 %13, %compare.266.47
  %15 = zext i1 %14 to i8
  %16 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg017, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %15, ptr addrspace(1) %16, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg9) local_unnamed_addr #2 {
entry:
  %arg935 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg833 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg731 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg629 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg527 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg425 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg323 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg221 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg017 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.513 = load i64, ptr addrspace(1) %arg425, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_4.513, 0
  %2 = add i64 %param_4.513, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.513
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg323, i64 %thread_id_x
  %param_3.5794 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %param_9.325 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg935, i64 0, i64 %5
  %param_9.32510 = load double, ptr addrspace(1) %param_9.325, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg629, i64 %thread_id_x
  %param_6.40511 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg833, i64 %thread_id_x
  %param_8.32112 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %9 = getelementptr double, ptr addrspace(1) %arg731, i64 %thread_id_x
  %param_7.32413 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %multiply.852.23 = fmul double %param_8.32112, %param_7.32413
  %add.342.21 = fadd double %param_6.40511, %multiply.852.23
  %10 = tail call double @llvm.fma.f64(double %add.342.21, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #5
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #5
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %add.342.21)
  %14 = tail call double @llvm.fma.f64(double %12, double 0xBC7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 0x3EC71DEE62401315)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double 0x3EFA01997C89EB71)
  %18 = tail call double @llvm.fma.f64(double %17, double %14, double 0x3F2A01A014761F65)
  %19 = tail call double @llvm.fma.f64(double %18, double %14, double 0x3F56C16C1852B7AF)
  %20 = tail call double @llvm.fma.f64(double %19, double %14, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %20, double %14, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %21, double %14, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %22, double %14, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %23, double %14, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %24, double %14, double 1.000000e+00)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #5
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #5
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #5
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.21) #5
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #5
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %add.342.21, 0.000000e+00
  %36 = fadd double %add.342.21, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #5
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #5
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.853.33 = fmul double %param_9.32510, %z.2.i
  %compare.265.17 = fcmp ogt double %multiply.853.33, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg527, i64 %thread_id_x
  %param_5.41314 = load double, ptr addrspace(1) %48, align 8, !invariant.load !123
  %49 = select i1 %compare.265.17, double %multiply.853.33, double %param_5.41314
  %50 = getelementptr double, ptr addrspace(1) %arg221, i64 %thread_id_x
  %param_2.57915 = load double, ptr addrspace(1) %50, align 8, !invariant.load !123
  %multiply.857.21 = fmul double %param_2.57915, %49
  %multiply.864.13 = fmul double %param_3.5794, %multiply.857.21
  %51 = getelementptr double, ptr addrspace(1) %arg119, i64 %thread_id_x
  %param_1.68116 = load double, ptr addrspace(1) %51, align 8, !invariant.load !123
  %multiply.865.1 = fmul double %param_1.68116, %multiply.864.13
  %52 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg017, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.865.1, ptr addrspace(1) %52, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #2 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_5.441 = load i64, ptr addrspace(1) %arg523, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_5.441, 0
  %2 = add i64 %param_5.441, 192
  %3 = select i1 %1, i64 %2, i64 %param_5.441
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.7054 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %param_4.548 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg421, i64 0, i64 %5
  %param_4.54810 = load double, ptr addrspace(1) %param_4.548, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.62711 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = tail call double @llvm.fma.f64(double %param_3.62711, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #5
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #5
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %param_3.62711)
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
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %param_3.62711) #5
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #5
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %param_3.62711, 0.000000e+00
  %34 = fadd double %param_3.62711, 0x7FF0000000000000
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
  %multiply.863.17 = fmul double %param_4.54810, %z.2.i
  %compare.267.13 = fcmp ogt double %multiply.863.17, 1.000000e-128
  %46 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.64312 = load double, ptr addrspace(1) %46, align 8, !invariant.load !123
  %47 = select i1 %compare.267.13, double %multiply.863.17, double %param_2.64312
  %add.348.1 = fadd double %param_1.7054, %47
  %multiply.879.3 = fmul double %add.348.1, %add.348.1
  %divide.401.3 = fdiv double 1.000000e+00, %multiply.879.3
  %48 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.401.3, ptr addrspace(1) %48, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.540 = load i64, ptr addrspace(1) %arg420, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_4.540, 0
  %2 = add i64 %param_4.540, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.540
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.6874 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %param_3.619 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg318, i64 0, i64 %5
  %param_3.61910 = load double, ptr addrspace(1) %param_3.619, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.63911 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %8 = tail call double @llvm.fma.f64(double %param_2.63911, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #5
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #5
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %param_2.63911)
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
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.63911) #5
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #5
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %param_2.63911, 0.000000e+00
  %34 = fadd double %param_2.63911, 0x7FF0000000000000
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
  %multiply.863.9 = fmul double %param_3.61910, %z.2.i
  %add.350.1 = fadd double %param_1.6874, %multiply.863.9
  %multiply.886.3 = fmul double %add.350.1, %add.350.1
  %divide.407.3 = fdiv double 1.000000e+00, %multiply.886.3
  %46 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.407.3, ptr addrspace(1) %46, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.658 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_2.658, 0
  %2 = add i64 %param_2.658, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.658
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7124 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %multiply.866.3 = fmul double %param_1.7124, 2.000000e+00
  %multiply.885.3 = fmul double %multiply.866.3, %multiply.866.3
  %divide.406.3 = fdiv double 1.000000e+00, %multiply.885.3
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.406.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.686 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_1.686, 0
  %2 = add i64 %param_1.686, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.686
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.5844 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %multiply.866.7 = fmul double %param_2.5844, 2.000000e+00
  %divide.398.3 = fdiv double 1.000000e+00, %multiply.866.7
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.398.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8) local_unnamed_addr #2 {
entry:
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_8.304 = load i64, ptr addrspace(1) %arg832, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_8.304, 0
  %2 = add i64 %param_8.304, 192
  %3 = select i1 %1, i64 %2, i64 %param_8.304
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.3864 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg730, i64 %thread_id_x
  %param_7.3075 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %multiply.848.9 = fmul double %param_6.3864, %param_7.3075
  %param_5.428 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg526, i64 0, i64 %5
  %param_5.42811 = load double, ptr addrspace(1) %param_5.428, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg424, i64 %thread_id_x
  %param_4.53312 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %multiply.849.11 = fmul double %param_5.42811, %param_4.53312
  %add.340.9 = fadd double %multiply.848.9, %multiply.849.11
  %9 = getelementptr double, ptr addrspace(1) %arg118, i64 %thread_id_x
  %param_1.72813 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %10 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.62614 = load double, ptr addrspace(1) %10, align 8, !invariant.load !123
  %param_3.610 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg322, i64 0, i64 %5
  %param_3.61015 = load i32, ptr addrspace(1) %param_3.610, align 4, !invariant.load !123
  %11 = sitofp i32 %param_3.61015 to double
  %multiply.855.9 = fmul double %param_2.62614, %11
  %multiply.856.5 = fmul double %param_1.72813, %multiply.855.9
  %add.344.5 = fadd double %add.340.9, %multiply.856.5
  %subtract.78.4 = fsub double %add.344.5, %add.340.9
  %multiply.859.1 = fmul double %subtract.78.4, %subtract.78.4
  %12 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg016, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.859.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8) local_unnamed_addr #2 {
entry:
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_8.325 = load i64, ptr addrspace(1) %arg832, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_8.325, 0
  %2 = add i64 %param_8.325, 192
  %3 = select i1 %1, i64 %2, i64 %param_8.325
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.4104 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %7 = getelementptr double, ptr addrspace(1) %arg730, i64 %thread_id_x
  %param_7.3295 = load double, ptr addrspace(1) %7, align 8, !invariant.load !123
  %multiply.848.15 = fmul double %param_6.4104, %param_7.3295
  %param_5.451 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg526, i64 0, i64 %5
  %param_5.45111 = load double, ptr addrspace(1) %param_5.451, align 8, !invariant.load !123
  %8 = getelementptr double, ptr addrspace(1) %arg424, i64 %thread_id_x
  %param_4.55912 = load double, ptr addrspace(1) %8, align 8, !invariant.load !123
  %multiply.849.17 = fmul double %param_5.45111, %param_4.55912
  %add.340.15 = fadd double %multiply.848.15, %multiply.849.17
  %9 = getelementptr double, ptr addrspace(1) %arg118, i64 %thread_id_x
  %param_1.74713 = load double, ptr addrspace(1) %9, align 8, !invariant.load !123
  %10 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.65614 = load double, ptr addrspace(1) %10, align 8, !invariant.load !123
  %param_3.637 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg322, i64 0, i64 %5
  %param_3.63715 = load i32, ptr addrspace(1) %param_3.637, align 4, !invariant.load !123
  %11 = sitofp i32 %param_3.63715 to double
  %multiply.855.17 = fmul double %param_2.65614, %11
  %multiply.856.13 = fmul double %param_1.74713, %multiply.855.17
  %add.344.13 = fadd double %add.340.15, %multiply.856.13
  %subtract.78.3 = fsub double %add.344.13, %add.340.15
  %multiply.884.3 = fmul double %subtract.78.3, 2.000000e+00
  %12 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg016, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.884.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.592 = load i64, ptr addrspace(1) %arg317, align 128, !invariant.load !123
  %1 = icmp slt i64 %param_3.592, 0
  %2 = add i64 %param_3.592, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.592
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.7004 = load double, ptr addrspace(1) %6, align 8, !invariant.load !123
  %param_2.598 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.59810 = load i32, ptr addrspace(1) %param_2.598, align 4, !invariant.load !123
  %7 = sitofp i32 %param_2.59810 to double
  %multiply.855.3 = fmul double %param_1.7004, %7
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.855.3, ptr addrspace(1) %8, align 8
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
define void @copy_fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg5) local_unnamed_addr #3 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !126
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 232
  br i1 %3, label %concatenate.pivot.20., label %copy_fusion.5.in_bounds-after

copy_fusion.5.in_bounds-after:                    ; preds = %slice1-after, %slice2-true, %entry
  ret void

concatenate.pivot.20.:                            ; preds = %entry
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %concatenate.pivot.0., label %concatenate.pivot.40.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.20.
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg03, i64 0, i64 %5, i64 0
  br label %concatenate.3.merge

concatenate.pivot.40.:                            ; preds = %concatenate.pivot.20.
  %7 = icmp ult i32 %linear_index, 40
  br i1 %7, label %concatenate.pivot.20.1, label %concatenate.pivot.40.2

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.40.
  %8 = add nsw i32 %linear_index, -20
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg15, i64 0, i64 %9, i64 0
  br label %concatenate.3.merge

concatenate.pivot.40.2:                           ; preds = %concatenate.pivot.40.
  %11 = add nsw i32 %linear_index, -40
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg27, i64 0, i64 %12
  br label %concatenate.3.merge

concatenate.3.merge:                              ; preds = %concatenate.pivot.40.2, %concatenate.pivot.20.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %6, %concatenate.pivot.0. ], [ %10, %concatenate.pivot.20.1 ], [ %13, %concatenate.pivot.40.2 ]
  %14 = icmp ult i32 %linear_index, 20
  %15 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !123
  %16 = zext nneg i32 %linear_index to i64
  %17 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg39, i64 0, i64 %16
  br i1 %14, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.3.merge
  %18 = add nsw i32 %linear_index, -20
  %19 = icmp ult i32 %18, 20
  %20 = zext nneg i32 %18 to i64
  %21 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg411, i64 0, i64 %20
  br i1 %19, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %22 = icmp ugt i32 %linear_index, 39
  %23 = add nsw i32 %linear_index, -40
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

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117}
!llvm.ident = !{!118}
!nvvmir.version = !{!119}
!llvm.module.flags = !{!120}

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
!14 = !{ptr @loop_divide_multiply_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 20}
!16 = !{ptr @loop_dynamic_update_slice_fusion_59, !"kernel", i32 1}
!17 = !{ptr @loop_dynamic_update_slice_fusion_59, !"reqntidx", i32 1}
!18 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 20}
!20 = !{ptr @loop_divide_exponential_fusion, !"kernel", i32 1}
!21 = !{ptr @loop_divide_exponential_fusion, !"reqntidx", i32 20}
!22 = !{ptr @wrapped_convert, !"kernel", i32 1}
!23 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!24 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!25 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 20}
!26 = !{ptr @loop_compare_multiply_select_fusion, !"kernel", i32 1}
!27 = !{ptr @loop_compare_multiply_select_fusion, !"reqntidx", i32 20}
!28 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!29 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 1}
!30 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!31 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 1}
!32 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!33 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 20}
!34 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!35 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 20}
!36 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!37 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 20}
!38 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!39 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 20}
!40 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!41 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 20}
!42 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!43 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 20}
!44 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!45 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 20}
!46 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!47 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 20}
!48 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!49 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 20}
!50 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!51 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 20}
!52 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!53 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 20}
!54 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!55 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 20}
!56 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!57 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 20}
!58 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!59 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 20}
!60 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!61 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 20}
!62 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!63 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 20}
!64 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!65 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 20}
!66 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!67 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 20}
!68 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!69 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 20}
!70 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!71 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 20}
!72 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!73 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 20}
!74 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!75 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 20}
!76 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!77 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 20}
!78 = !{ptr @loop_dynamic_update_slice_fusion_58, !"kernel", i32 1}
!79 = !{ptr @loop_dynamic_update_slice_fusion_58, !"reqntidx", i32 20}
!80 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 20}
!82 = !{ptr @loop_dynamic_update_slice_fusion_20, !"kernel", i32 1}
!83 = !{ptr @loop_dynamic_update_slice_fusion_20, !"reqntidx", i32 20}
!84 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!85 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 20}
!86 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!87 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 20}
!88 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 20}
!90 = !{ptr @loop_add_divide_select_fusion, !"kernel", i32 1}
!91 = !{ptr @loop_add_divide_select_fusion, !"reqntidx", i32 20}
!92 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 20}
!94 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 20}
!96 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 20}
!98 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 20}
!100 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 20}
!102 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 20}
!104 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 20}
!106 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 20}
!108 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 20}
!110 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 20}
!112 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 20}
!114 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!115 = !{ptr @loop_add_fusion, !"reqntidx", i32 1}
!116 = !{ptr @copy_fusion_5, !"kernel", i32 1}
!117 = !{ptr @copy_fusion_5, !"reqntidx", i32 128}
!118 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!119 = !{i32 2, i32 0}
!120 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!121 = !{i32 0, i32 60}
!122 = !{i32 0, i32 128}
!123 = !{}
!124 = !{i32 0, i32 32}
!125 = !{i32 0, i32 20}
!126 = !{i32 0, i32 2}
