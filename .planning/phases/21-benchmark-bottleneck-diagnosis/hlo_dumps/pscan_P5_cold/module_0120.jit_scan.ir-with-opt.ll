; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_42_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !113
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
define void @copy_fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !113
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !115
  %11 = zext nneg i32 %linear_index to i64
  %12 = getelementptr inbounds [768 x i8], ptr addrspace(1) %arg17, i64 0, i64 %11
  br i1 %3, label %slice0-true, label %slice0-after

copy_fusion.10.in_bounds-after:                   ; preds = %slice0-after, %slice1-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %13 = icmp ugt i32 %0, 5
  %14 = sext i32 %linear_index to i64
  %15 = getelementptr [768 x i8], ptr addrspace(1) %arg29, i64 0, i64 %14
  br i1 %13, label %slice1-true, label %copy_fusion.10.in_bounds-after

slice0-true:                                      ; preds = %entry
  store i8 %10, ptr addrspace(1) %12, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %15, i64 -768
  store i8 %10, ptr addrspace(1) %sunkaddr, align 1
  br label %copy_fusion.10.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !116
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
define void @input_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !116
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 960
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
  %10 = getelementptr inbounds [768 x double], ptr addrspace(1) %arg15, i64 0, i64 %9
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
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !115
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
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !115
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
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
  %0 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !115
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg02, i64 0, i64 %7
  %9 = load i32, ptr addrspace(1) %8, align 4, !invariant.load !115
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i32
  store i32 %9, ptr addrspace(1) %arg26, align 128
  store i32 %11, ptr addrspace(1) %arg38, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_exponential_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg14) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg311, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !115
  %4 = getelementptr double, ptr addrspace(1) %arg413, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !115
  %multiply.848.7.clone.1 = fmul double %3, %5
  %6 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !115
  %7 = icmp slt i64 %6, 0
  %8 = add i64 %6, 192
  %9 = select i1 %7, i64 %8, i64 %6
  %10 = trunc i64 %9 to i32
  %11 = tail call i32 @llvm.smax.i32(i32 %10, i32 0)
  %12 = tail call i32 @llvm.umin.i32(i32 %11, i32 191)
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg17, i64 0, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !115
  %16 = getelementptr double, ptr addrspace(1) %arg05, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !115
  %multiply.849.9.clone.1 = fmul double %15, %17
  %add.340.7.clone.1 = fadd double %multiply.848.7.clone.1, %multiply.849.9.clone.1
  %18 = fneg double %add.340.7.clone.1
  %19 = tail call double @llvm.fma.f64(double %18, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #5
  %21 = tail call double @llvm.nvvm.add.rn.d(double %19, double 0xC338000000000000) #5
  %22 = tail call double @llvm.fma.f64(double %21, double 0xBFE62E42FEFA39EF, double %18)
  %23 = tail call double @llvm.fma.f64(double %21, double 0xBC7ABC9E3B39803F, double %22)
  %24 = tail call double @llvm.fma.f64(double %23, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %25 = tail call double @llvm.fma.f64(double %24, double %23, double 0x3EC71DEE62401315)
  %26 = tail call double @llvm.fma.f64(double %25, double %23, double 0x3EFA01997C89EB71)
  %27 = tail call double @llvm.fma.f64(double %26, double %23, double 0x3F2A01A014761F65)
  %28 = tail call double @llvm.fma.f64(double %27, double %23, double 0x3F56C16C1852B7AF)
  %29 = tail call double @llvm.fma.f64(double %28, double %23, double 0x3F81111111122322)
  %30 = tail call double @llvm.fma.f64(double %29, double %23, double 0x3FA55555555502A1)
  %31 = tail call double @llvm.fma.f64(double %30, double %23, double 0x3FC5555555555511)
  %32 = tail call double @llvm.fma.f64(double %31, double %23, double 0x3FE000000000000B)
  %33 = tail call double @llvm.fma.f64(double %32, double %23, double 1.000000e+00)
  %34 = tail call double @llvm.fma.f64(double %33, double %23, double 1.000000e+00)
  %35 = tail call i32 @llvm.nvvm.d2i.lo(double %34) #5
  %36 = tail call i32 @llvm.nvvm.d2i.hi(double %34) #5
  %37 = shl i32 %20, 20
  %38 = add i32 %36, %37
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 %35, i32 %38) #5
  %40 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #5
  %41 = bitcast i32 %40 to float
  %42 = tail call float @llvm.nvvm.fabs.f(float %41) #5
  %43 = fcmp olt float %42, 0x4010C46560000000
  br i1 %43, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %44 = fcmp ogt double %add.340.7.clone.1, 0.000000e+00
  %45 = fsub double 0x7FF0000000000000, %add.340.7.clone.1
  %z.0.i = select i1 %44, double 0.000000e+00, double %45
  %46 = fcmp olt float %42, 0x4010E90000000000
  br i1 %46, label %47, label %__nv_exp.exit

47:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %48 = sdiv i32 %20, 2
  %49 = shl i32 %48, 20
  %50 = add i32 %36, %49
  %51 = tail call double @llvm.nvvm.lohi.i2d(i32 %35, i32 %50) #5
  %52 = sub nsw i32 %20, %48
  %53 = shl i32 %52, 20
  %54 = add nsw i32 %53, 1072693248
  %55 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %54) #5
  %56 = fmul double %55, %51
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %47
  %z.2.i = phi double [ %39, %entry ], [ %56, %47 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %57 = getelementptr double, ptr addrspace(1) %arg923, i64 %1
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !115
  %59 = getelementptr double, ptr addrspace(1) %arg617, i64 %1
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !115
  %61 = getelementptr double, ptr addrspace(1) %arg821, i64 %1
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !115
  %63 = getelementptr double, ptr addrspace(1) %arg719, i64 %1
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !115
  %multiply.852.5.clone.1.clone.1 = fmul double %62, %64
  %add.342.3.clone.1.clone.1 = fadd double %60, %multiply.852.5.clone.1.clone.1
  %65 = tail call double @llvm.fma.f64(double %add.342.3.clone.1.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %66 = tail call i32 @llvm.nvvm.d2i.lo(double %65) #5
  %67 = tail call double @llvm.nvvm.add.rn.d(double %65, double 0xC338000000000000) #5
  %68 = tail call double @llvm.fma.f64(double %67, double 0xBFE62E42FEFA39EF, double %add.342.3.clone.1.clone.1)
  %69 = tail call double @llvm.fma.f64(double %67, double 0xBC7ABC9E3B39803F, double %68)
  %70 = tail call double @llvm.fma.f64(double %69, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %71 = tail call double @llvm.fma.f64(double %70, double %69, double 0x3EC71DEE62401315)
  %72 = tail call double @llvm.fma.f64(double %71, double %69, double 0x3EFA01997C89EB71)
  %73 = tail call double @llvm.fma.f64(double %72, double %69, double 0x3F2A01A014761F65)
  %74 = tail call double @llvm.fma.f64(double %73, double %69, double 0x3F56C16C1852B7AF)
  %75 = tail call double @llvm.fma.f64(double %74, double %69, double 0x3F81111111122322)
  %76 = tail call double @llvm.fma.f64(double %75, double %69, double 0x3FA55555555502A1)
  %77 = tail call double @llvm.fma.f64(double %76, double %69, double 0x3FC5555555555511)
  %78 = tail call double @llvm.fma.f64(double %77, double %69, double 0x3FE000000000000B)
  %79 = tail call double @llvm.fma.f64(double %78, double %69, double 1.000000e+00)
  %80 = tail call double @llvm.fma.f64(double %79, double %69, double 1.000000e+00)
  %81 = tail call i32 @llvm.nvvm.d2i.lo(double %80) #5
  %82 = tail call i32 @llvm.nvvm.d2i.hi(double %80) #5
  %83 = shl i32 %66, 20
  %84 = add i32 %82, %83
  %85 = tail call double @llvm.nvvm.lohi.i2d(i32 %81, i32 %84) #5
  %86 = tail call i32 @llvm.nvvm.d2i.hi(double %add.342.3.clone.1.clone.1) #5
  %87 = bitcast i32 %86 to float
  %88 = tail call float @llvm.nvvm.fabs.f(float %87) #5
  %89 = fcmp olt float %88, 0x4010C46560000000
  br i1 %89, label %__nv_exp.exit4, label %__internal_fast_icmp_abs_lt.exit.i1

__internal_fast_icmp_abs_lt.exit.i1:              ; preds = %__nv_exp.exit
  %90 = fcmp olt double %add.342.3.clone.1.clone.1, 0.000000e+00
  %91 = fadd double %add.342.3.clone.1.clone.1, 0x7FF0000000000000
  %z.0.i2 = select i1 %90, double 0.000000e+00, double %91
  %92 = fcmp olt float %88, 0x4010E90000000000
  br i1 %92, label %93, label %__nv_exp.exit4

93:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i1
  %94 = sdiv i32 %66, 2
  %95 = shl i32 %94, 20
  %96 = add i32 %82, %95
  %97 = tail call double @llvm.nvvm.lohi.i2d(i32 %81, i32 %96) #5
  %98 = sub nsw i32 %66, %94
  %99 = shl i32 %98, 20
  %100 = add nsw i32 %99, 1072693248
  %101 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %100) #5
  %102 = fmul double %101, %97
  br label %__nv_exp.exit4

__nv_exp.exit4:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i1, %93
  %z.2.i3 = phi double [ %85, %__nv_exp.exit ], [ %102, %93 ], [ %z.0.i2, %__internal_fast_icmp_abs_lt.exit.i1 ]
  %divide.391.1.clone.1.clone.1 = fdiv double 1.000000e+00, %58
  %add.341.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.390.1.clone.1 = fdiv double 1.000000e+00, %add.341.1.clone.1
  %subtract.76.5 = fsub double 1.000000e+00, %divide.390.1.clone.1
  %multiply.850.1 = fmul double %divide.390.1.clone.1, %subtract.76.5
  %multiply.853.13.clone.1 = fmul double %15, %z.2.i3
  %compare.265.15.clone.1 = fcmp ogt double %multiply.853.13.clone.1, 1.000000e-128
  %103 = getelementptr double, ptr addrspace(1) %arg515, i64 %1
  %104 = load double, ptr addrspace(1) %103, align 8, !invariant.load !115
  %105 = select i1 %compare.265.15.clone.1, double %multiply.853.13.clone.1, double %104
  %add.343.5.clone.1 = fadd double %divide.391.1.clone.1.clone.1, %105
  %divide.392.1.clone.1 = fdiv double 1.000000e+00, %add.343.5.clone.1
  %106 = getelementptr double, ptr addrspace(1) %arg1025, i64 %1
  store double %multiply.850.1, ptr addrspace(1) %106, align 8
  %107 = getelementptr double, ptr addrspace(1) %arg1127, i64 %1
  store double %divide.390.1.clone.1, ptr addrspace(1) %107, align 8
  %108 = getelementptr double, ptr addrspace(1) %arg1229, i64 %1
  store double %divide.392.1.clone.1, ptr addrspace(1) %108, align 8
  %109 = getelementptr double, ptr addrspace(1) %arg1331, i64 %1
  store double %z.2.i3, ptr addrspace(1) %109, align 8
  %110 = getelementptr double, ptr addrspace(1) %arg1433, i64 %1
  store double %divide.391.1.clone.1.clone.1, ptr addrspace(1) %110, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !115
  %4 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !115
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %9 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !115
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
  %0 = load i32, ptr addrspace(1) %arg01, align 128, !invariant.load !115
  %1 = sitofp i32 %0 to double
  store double %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !115
  %4 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !115
  %multiply.845.5.clone.1 = fmul double %5, %5
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.846.9.clone.1 = fmul double %multiply.845.5.clone.1, %7
  %8 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !115
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
define void @loop_dynamic_update_slice_fusion_30(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.629 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.629, 0
  %2 = add i64 %param_2.629, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.629
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7014 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !115
  %7 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %param_1.7014, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg3) local_unnamed_addr #2 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.715 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.715, 0
  %2 = add i64 %param_1.715, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.715
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_3.608 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg317, i64 0, i64 %5
  %param_3.6089 = load double, ptr addrspace(1) %param_3.608, align 8, !invariant.load !115
  %6 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.65210 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.853.5 = fmul double %param_3.6089, %param_2.65210
  %compare.265.3 = fcmp ogt double %multiply.853.5, 1.000000e-128
  %7 = zext i1 %compare.265.3 to i8
  %8 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.662 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.662, 0
  %2 = add i64 %param_2.662, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.662
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.7225 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = icmp ne i64 %param_1.7225, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.660 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.660, 0
  %2 = add i64 %param_2.660, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.660
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.7204 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = icmp ne i64 %param_1.7204, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.666 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.666, 0
  %2 = add i64 %param_2.666, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.666
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.7245 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !115
  %.not = icmp eq i64 %param_1.7245, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.665 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.665, 0
  %2 = add i64 %param_2.665, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.665
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.7234 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !115
  %.not = icmp eq i64 %param_1.7234, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_59(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.655 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !115
  %0 = icmp slt i64 %param_2.655, 0
  %1 = add i64 %param_2.655, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.655
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.716 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg112, i64 0, i64 %4
  %param_1.7168 = load i32, ptr addrspace(1) %param_1.716, align 4, !invariant.load !115
  %5 = icmp ne i32 %param_1.7168, 0
  %6 = zext i1 %5 to i32
  %7 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg010, i64 0, i64 %4
  store i32 %6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.408 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !115
  %0 = icmp slt i64 %param_2.408, 0
  %1 = add i64 %param_2.408, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.408
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.514 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !115
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  store double %param_1.514, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_38(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.395 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !115
  %0 = icmp slt i64 %param_2.395, 0
  %1 = add i64 %param_2.395, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.395
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.502 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg111, i64 0, i64 %4
  %param_1.5028 = load i32, ptr addrspace(1) %param_1.502, align 4, !invariant.load !115
  %5 = sitofp i32 %param_1.5028 to double
  %6 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg09, i64 0, i64 %4
  store double %5, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.627 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.627, 0
  %2 = add i64 %param_2.627, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.627
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.6994 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = icmp ne i64 %param_1.6994, 0
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i32 %8, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_35(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.578 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.578, 0
  %2 = add i64 %param_2.578, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.578
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6504 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.6504, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.646 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.646, 0
  %2 = add i64 %param_2.646, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.646
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.6604 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.883.1 = fmul double %param_1.6604, %param_1.6604
  %divide.405.1 = fdiv double 1.000000e+00, %multiply.883.1
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.405.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.676 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.676, 0
  %2 = add i64 %param_1.676, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.676
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg415, i64 %thread_id_x
  %param_4.5044 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.5765 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %multiply.851.7 = fmul double %param_4.5044, %param_3.5765
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.6046 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %divide.393.3 = fdiv double %multiply.851.7, %param_2.6046
  %9 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.393.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5) local_unnamed_addr #2 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.609 = load i64, ptr addrspace(1) %arg319, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_3.609, 0
  %2 = add i64 %param_3.609, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.609
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.7124 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %param_5.390 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg523, i64 0, i64 %5
  %param_5.39010 = load double, ptr addrspace(1) %param_5.390, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.53011 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %multiply.853.9 = fmul double %param_5.39010, %param_4.53011
  %compare.265.17 = fcmp ogt double %multiply.853.9, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.64412 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %9 = select i1 %compare.265.17, double %multiply.853.9, double %param_2.64412
  %add.343.7 = fadd double %param_1.7124, %9
  %multiply.881.1 = fmul double %add.343.7, %add.343.7
  %divide.403.1 = fdiv double 1.000000e+00, %multiply.881.1
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.403.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_40(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.647 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.647, 0
  %2 = add i64 %param_2.647, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.647
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6954 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %subtract.76.3 = fsub double 1.000000e+00, %param_1.6954
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.76.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg5) local_unnamed_addr #2 {
entry:
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.596 = load i64, ptr addrspace(1) %arg219, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.596, 0
  %2 = add i64 %param_2.596, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.596
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_5.369 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg525, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_5.36911 = load double, ptr addrspace(1) %param_5.369, align 8, !invariant.load !115
  %6 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.50012 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %subtract.77.13 = fsub double %param_5.36911, %param_4.50012
  %param_1.668 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg117, i64 0, i64 %5
  %param_1.66813 = load i32, ptr addrspace(1) %param_1.668, align 4, !invariant.load !115
  %7 = sitofp i32 %param_1.66813 to double
  %multiply.854.11 = fmul double %subtract.77.13, %7
  %8 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.56914 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %divide.394.7 = fdiv double %multiply.854.11, %param_3.56914
  %multiply.855.3 = fmul double %divide.394.7, %7
  %9 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg015, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.855.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_37(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.513 = load i64, ptr addrspace(1) %arg422, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_4.513, 0
  %2 = add i64 %param_4.513, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.513
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_3.588 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg320, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_3.58811 = load double, ptr addrspace(1) %param_3.588, align 8, !invariant.load !115
  %6 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.63012 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %subtract.77.5 = fsub double %param_3.58811, %param_2.63012
  %param_1.702 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg116, i64 0, i64 %5
  %param_1.70213 = load i32, ptr addrspace(1) %param_1.702, align 4, !invariant.load !115
  %7 = sitofp i32 %param_1.70213 to double
  %multiply.854.3 = fmul double %subtract.77.5, %7
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.854.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.563 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_3.563, 0
  %2 = add i64 %param_3.563, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.563
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.5844 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.6565 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %multiply.851.3 = fmul double %param_2.5844, %param_1.6565
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.851.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5) local_unnamed_addr #2 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.652 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.652, 0
  %2 = add i64 %param_1.652, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.652
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_5.396 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg523, i64 0, i64 %5
  %param_5.3969 = load double, ptr addrspace(1) %param_5.396, align 8, !invariant.load !115
  %6 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.53510 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.853.21 = fmul double %param_5.3969, %param_4.53510
  %compare.265.25 = fcmp ogt double %multiply.853.21, 1.000000e-128
  %7 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.55911 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %8 = select i1 %compare.265.25, double %multiply.853.21, double %param_3.55911
  %9 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.58012 = load double, ptr addrspace(1) %9, align 8, !invariant.load !115
  %multiply.857.9 = fmul double %param_2.58012, %8
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.857.9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.682 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.682, 0
  %2 = add i64 %param_1.682, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.682
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg626, i64 %thread_id_x
  %param_6.2864 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %param_5.399 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg524, i64 0, i64 %5
  %param_5.39910 = load double, ptr addrspace(1) %param_5.399, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.53711 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %multiply.853.35 = fmul double %param_5.39910, %param_4.53711
  %compare.265.41 = fcmp ogt double %multiply.853.35, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.57912 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %9 = select i1 %compare.265.41, double %multiply.853.35, double %param_3.57912
  %10 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.61013 = load double, ptr addrspace(1) %10, align 8, !invariant.load !115
  %multiply.857.25 = fmul double %param_2.61013, %9
  %multiply.864.11 = fmul double %param_6.2864, %multiply.857.25
  %multiply.869.1 = fmul double %multiply.864.11, %multiply.864.11
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.869.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.692 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.692, 0
  %2 = add i64 %param_1.692, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.692
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg626, i64 %thread_id_x
  %param_6.2854 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %param_5.398 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg524, i64 0, i64 %5
  %param_5.39810 = load double, ptr addrspace(1) %param_5.398, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.53611 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %multiply.853.33 = fmul double %param_5.39810, %param_4.53611
  %compare.265.39 = fcmp ogt double %multiply.853.33, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.58412 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %9 = select i1 %compare.265.39, double %multiply.853.33, double %param_3.58412
  %10 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.62013 = load double, ptr addrspace(1) %10, align 8, !invariant.load !115
  %multiply.857.23 = fmul double %param_2.62013, %9
  %multiply.864.9 = fmul double %param_6.2854, %multiply.857.23
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.864.9, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.670 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.670, 0
  %2 = add i64 %param_1.670, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.670
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.6634 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.872.9 = fmul double %param_2.6634, %param_2.6634
  %multiply.873.7 = fmul double %multiply.872.9, 5.000000e-01
  %param_6.290 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg626, i64 0, i64 %5
  %param_6.29010 = load double, ptr addrspace(1) %param_6.290, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.40311 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %multiply.853.7 = fmul double %param_6.29010, %param_5.40311
  %compare.265.27 = fcmp ogt double %multiply.853.7, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.54112 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %9 = select i1 %compare.265.27, double %multiply.853.7, double %param_4.54112
  %10 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.61713 = load double, ptr addrspace(1) %10, align 8, !invariant.load !115
  %multiply.857.11 = fmul double %param_3.61713, %9
  %multiply.874.1 = fmul double %multiply.873.7, %multiply.857.11
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.874.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.719 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.719, 0
  %2 = add i64 %param_1.719, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.719
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg626, i64 %thread_id_x
  %param_6.2884 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %param_5.401 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg524, i64 0, i64 %5
  %param_5.40110 = load double, ptr addrspace(1) %param_5.401, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.53911 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %multiply.853.31 = fmul double %param_5.40110, %param_4.53911
  %compare.265.37 = fcmp ogt double %multiply.853.31, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.61512 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %9 = select i1 %compare.265.37, double %multiply.853.31, double %param_3.61512
  %10 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.65813 = load double, ptr addrspace(1) %10, align 8, !invariant.load !115
  %multiply.857.21 = fmul double %param_2.65813, %9
  %multiply.864.7 = fmul double %param_6.2884, %multiply.857.21
  %multiply.887.3 = fmul double %multiply.864.7, 2.000000e+00
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.887.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_43(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.648 = load i64, ptr addrspace(1) %arg216, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.648, 0
  %2 = add i64 %param_2.648, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.648
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_4.527 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg420, i64 0, i64 %5
  %param_4.5279 = load double, ptr addrspace(1) %param_4.527, align 8, !invariant.load !115
  %6 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.60410 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.853.3 = fmul double %param_4.5279, %param_3.60410
  %compare.265.11 = fcmp ogt double %multiply.853.3, 1.000000e-128
  %7 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.68711 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %8 = select i1 %compare.265.11, double %multiply.853.3, double %param_1.68711
  %9 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store double %8, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_4(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.674 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.674, 0
  %2 = add i64 %param_1.674, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.674
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.6644 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.872.5 = fmul double %param_2.6644, %param_2.6644
  %multiply.873.3 = fmul double %multiply.872.5, 5.000000e-01
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.873.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.656 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.656, 0
  %2 = add i64 %param_2.656, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.656
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6784 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.888.3 = fmul double %param_1.6784, 2.000000e+00
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.888.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_58(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.617 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.617, 0
  %2 = add i64 %param_2.617, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.617
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_1.689 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg112, i64 0, i64 %5
  %param_1.6899 = load double, ptr addrspace(1) %param_1.689, align 8, !invariant.load !115
  %6 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.6899, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.594 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.594, 0
  %2 = add i64 %param_2.594, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.594
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6664 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = sitofp i64 %param_1.6664 to double
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.616 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.616, 0
  %2 = add i64 %param_2.616, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.616
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6884 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.6884, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_48(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.605 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.605, 0
  %2 = add i64 %param_2.605, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.605
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.6774 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.6774, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_exponential_select_fusion(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg8, ptr noalias nocapture align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg11, ptr noalias nocapture align 128 dereferenceable(32) %arg12, ptr noalias nocapture align 128 dereferenceable(32) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg15, ptr noalias nocapture align 128 dereferenceable(32) %arg16, ptr noalias nocapture align 128 dereferenceable(32) %arg17, ptr noalias nocapture align 128 dereferenceable(32) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg23, ptr noalias nocapture align 128 dereferenceable(32) %arg24, ptr noalias nocapture align 128 dereferenceable(32) %arg25, ptr noalias nocapture align 128 dereferenceable(32) %arg26, ptr noalias nocapture align 128 dereferenceable(32) %arg27, ptr noalias nocapture align 128 dereferenceable(32) %arg28, ptr noalias nocapture align 128 dereferenceable(32) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg30, ptr noalias nocapture align 128 dereferenceable(16) %arg31, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg32, ptr noalias nocapture align 128 dereferenceable(32) %arg33, ptr noalias nocapture align 128 dereferenceable(32) %arg34, ptr noalias nocapture align 128 dereferenceable(32) %arg35, ptr noalias nocapture align 128 dereferenceable(32) %arg36, ptr noalias nocapture align 128 dereferenceable(32) %arg37, ptr noalias nocapture align 128 dereferenceable(32) %arg38, ptr noalias nocapture align 128 dereferenceable(32) %arg39, ptr noalias nocapture align 128 dereferenceable(32) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg45) local_unnamed_addr #2 {
entry:
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg2048, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !115
  %4 = getelementptr double, ptr addrspace(1) %arg2150, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !115
  %6 = load i64, ptr addrspace(1) %arg416, align 128, !invariant.load !115
  %7 = icmp slt i64 %6, 0
  %8 = add i64 %6, 192
  %9 = select i1 %7, i64 %8, i64 %6
  %10 = trunc i64 %9 to i32
  %11 = tail call i32 @llvm.smax.i32(i32 %10, i32 0)
  %12 = tail call i32 @llvm.umin.i32(i32 %11, i32 191)
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg314, i64 0, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !115
  %16 = getelementptr double, ptr addrspace(1) %arg1946, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !115
  %18 = getelementptr double, ptr addrspace(1) %arg4190, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !115
  %20 = getelementptr double, ptr addrspace(1) %arg2762, i64 %1
  %21 = load double, ptr addrspace(1) %20, align 8
  %22 = getelementptr double, ptr addrspace(1) %arg2252, i64 %1
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !115
  %24 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg3068, i64 0, i64 %13, i64 %1, i64 0
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !115
  %26 = getelementptr double, ptr addrspace(1) %arg2456, i64 %1
  %27 = load double, ptr addrspace(1) %26, align 8
  %28 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg3272, i64 0, i64 %13
  %29 = load i32, ptr addrspace(1) %28, align 4, !invariant.load !115
  %30 = getelementptr i64, ptr addrspace(1) %arg212, i64 %1
  %31 = load i64, ptr addrspace(1) %30, align 8, !invariant.load !115
  %32 = getelementptr double, ptr addrspace(1) %arg04, i64 %1
  %33 = load double, ptr addrspace(1) %32, align 8
  %34 = getelementptr double, ptr addrspace(1) %arg1538, i64 %1
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !115
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
  %divide.396.1.clone.1 = fdiv double 1.000000e+00, %33
  %.not = icmp eq i64 %31, 0
  %multiply.848.3.clone.1 = fmul double %3, %5
  %multiply.849.5.clone.1 = fmul double %15, %17
  %add.340.3.clone.1 = fadd double %multiply.848.3.clone.1, %multiply.849.5.clone.1
  %multiply.851.9.clone.1 = fmul double %19, %21
  %divide.393.5.clone.1 = fdiv double %multiply.851.9.clone.1, %23
  %subtract.77.11.clone.1 = fsub double %25, %27
  %74 = sitofp i32 %29 to double
  %multiply.854.9.clone.1 = fmul double %subtract.77.11.clone.1, %74
  %divide.394.5.clone.1 = fdiv double %multiply.854.9.clone.1, %21
  %multiply.855.5.clone.1 = fmul double %divide.394.5.clone.1, %74
  %multiply.856.1.clone.1 = fmul double %divide.393.5.clone.1, %multiply.855.5.clone.1
  %add.344.1.clone.1 = fadd double %add.340.3.clone.1, %multiply.856.1.clone.1
  %75 = tail call double @llvm.fabs.f64(double %add.344.1.clone.1)
  %76 = call i1 @llvm.is.fpclass.f64(double %add.344.1.clone.1, i32 504)
  %compare.266.39 = fcmp olt double %75, 1.400000e+01
  %77 = and i1 %76, %compare.266.39
  %multiply.863.3 = fmul double %15, %z.2.i
  %add.350.2 = fadd double %divide.396.1.clone.1, %multiply.863.3
  %divide.399.1 = fdiv double 1.000000e+00, %add.350.2
  %compare.267.15.clone.1 = fcmp ogt double %multiply.863.3, 1.000000e-128
  %78 = getelementptr double, ptr addrspace(1) %arg1436, i64 %1
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !115
  %80 = select i1 %compare.267.15.clone.1, double %multiply.863.3, double %79
  %add.348.5.clone.1 = fadd double %divide.396.1.clone.1, %80
  %divide.397.1.clone.1 = fdiv double 1.000000e+00, %add.348.5.clone.1
  %81 = getelementptr double, ptr addrspace(1) %arg824, i64 %1
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !115
  %83 = getelementptr double, ptr addrspace(1) %arg722, i64 %1
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !115
  %multiply.853.39 = fmul double %15, %84
  %compare.265.45 = fcmp ogt double %multiply.853.39, 1.000000e-128
  %85 = getelementptr double, ptr addrspace(1) %arg620, i64 %1
  %86 = load double, ptr addrspace(1) %85, align 8, !invariant.load !115
  %87 = select i1 %compare.265.45, double %multiply.853.39, double %86
  %88 = getelementptr double, ptr addrspace(1) %arg518, i64 %1
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !115
  %multiply.857.29 = fmul double %89, %87
  %multiply.864.15 = fmul double %82, %multiply.857.29
  %multiply.869.4 = fmul double %multiply.864.15, %multiply.864.15
  %multiply.870.11 = fmul double %multiply.869.4, 5.000000e-01
  %90 = getelementptr double, ptr addrspace(1) %arg2354, i64 %1
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !115
  %add.343.3.clone.1 = fadd double %91, %87
  %multiply.858.1.clone.1 = fmul double %23, %add.343.3.clone.1
  %divide.395.1.clone.1 = fdiv double 1.000000e+00, %multiply.858.1.clone.1
  %subtract.78.1.clone.1 = fsub double %add.344.1.clone.1, %add.340.3.clone.1
  %multiply.859.2.clone.1 = fmul double %subtract.78.1.clone.1, %subtract.78.1.clone.1
  %multiply.860.1.clone.1 = fmul double %multiply.859.2.clone.1, %89
  %add.345.1.clone.1 = fadd double %multiply.860.1.clone.1, %divide.395.1.clone.1
  %add.346.1.clone.1 = fadd double %add.345.1.clone.1, -1.000000e+00
  %multiply.871.5 = fmul double %multiply.869.4, %add.346.1.clone.1
  %add.351.9 = fadd double %multiply.870.11, %multiply.871.5
  %multiply.872.11 = fmul double %82, %82
  %multiply.873.9 = fmul double %multiply.872.11, 5.000000e-01
  %multiply.874.4 = fmul double %multiply.873.9, %multiply.857.29
  %multiply.875.5 = fmul double %multiply.874.4, %add.346.1.clone.1
  %subtract.79.7 = fsub double %add.351.9, %multiply.875.5
  %92 = sitofp i64 %31 to double
  %multiply.876.5 = fmul double %subtract.79.7, %92
  %add.352.3 = fadd double %divide.397.1.clone.1, %multiply.876.5
  %compare.270.5 = fcmp ogt double %add.352.3, 1.000000e-128
  %93 = getelementptr double, ptr addrspace(1) %arg110, i64 %1
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !115
  %95 = select i1 %compare.270.5, double %add.352.3, double %94
  %96 = select i1 %.not, double %divide.399.1, double %95
  %97 = select i1 %77, double %96, double %33
  %98 = getelementptr double, ptr addrspace(1) %arg1130, i64 %1
  %99 = load double, ptr addrspace(1) %98, align 8, !invariant.load !115
  %100 = getelementptr double, ptr addrspace(1) %arg926, i64 %1
  %101 = load double, ptr addrspace(1) %100, align 8
  %multiply.861.3.clone.1 = fmul double %99, %101
  %102 = getelementptr double, ptr addrspace(1) %arg1028, i64 %1
  %103 = load double, ptr addrspace(1) %102, align 8, !invariant.load !115
  %multiply.862.5.clone.1 = fmul double %15, %103
  %add.347.3.clone.1 = fadd double %multiply.861.3.clone.1, %multiply.862.5.clone.1
  %multiply.865.2.clone.1 = fmul double %multiply.864.15, %add.346.1.clone.1
  %multiply.866.9.clone.1 = fmul double %divide.397.1.clone.1, 2.000000e+00
  %divide.398.5.clone.1 = fdiv double 1.000000e+00, %multiply.866.9.clone.1
  %multiply.867.1.clone.1 = fmul double %divide.398.5.clone.1, %multiply.865.2.clone.1
  %multiply.868.1.clone.1 = fmul double %multiply.867.1.clone.1, %92
  %add.349.1.clone.1 = fadd double %add.347.3.clone.1, %multiply.868.1.clone.1
  %104 = select i1 %77, double %add.349.1.clone.1, double %101
  %105 = getelementptr double, ptr addrspace(1) %arg1232, i64 %1
  %106 = load double, ptr addrspace(1) %105, align 8
  %107 = select i1 %77, double %divide.397.1.clone.1, double %106
  %multiply.877.1.clone.1 = fmul double %80, %divide.397.1.clone.1
  %108 = getelementptr double, ptr addrspace(1) %arg1334, i64 %1
  %109 = load double, ptr addrspace(1) %108, align 8
  %110 = select i1 %77, double %multiply.877.1.clone.1, double %109
  %111 = getelementptr double, ptr addrspace(1) %arg1640, i64 %1
  %112 = load double, ptr addrspace(1) %111, align 8
  %113 = select i1 %77, double %divide.396.1.clone.1, double %112
  %114 = getelementptr double, ptr addrspace(1) %arg1742, i64 %1
  %115 = load double, ptr addrspace(1) %114, align 8
  %116 = select i1 %77, double %add.347.3.clone.1, double %115
  %117 = getelementptr double, ptr addrspace(1) %arg1844, i64 %1
  %118 = load double, ptr addrspace(1) %117, align 8
  %119 = select i1 %77, double %add.346.1.clone.1, double %118
  %120 = select i1 %77, double %add.344.1.clone.1, double %5
  %121 = getelementptr double, ptr addrspace(1) %arg2558, i64 %1
  %122 = load double, ptr addrspace(1) %121, align 8
  %123 = select i1 %77, double %27, double %122
  %124 = getelementptr double, ptr addrspace(1) %arg2660, i64 %1
  %125 = load double, ptr addrspace(1) %124, align 8
  %126 = select i1 %77, double %15, double %125
  %127 = getelementptr double, ptr addrspace(1) %arg2864, i64 %1
  %128 = load double, ptr addrspace(1) %127, align 8
  %129 = select i1 %77, double %21, double %128
  %130 = getelementptr double, ptr addrspace(1) %arg2966, i64 %1
  %131 = load double, ptr addrspace(1) %130, align 8
  %132 = select i1 %77, double %25, double %131
  %133 = getelementptr i32, ptr addrspace(1) %arg3170, i64 %1
  %134 = load i32, ptr addrspace(1) %133, align 4
  %135 = select i1 %77, i32 %29, i32 %134
  %136 = getelementptr double, ptr addrspace(1) %arg3374, i64 %1
  %137 = load double, ptr addrspace(1) %136, align 8
  %138 = select i1 %77, double %21, double %137
  %139 = getelementptr double, ptr addrspace(1) %arg3476, i64 %1
  %140 = load double, ptr addrspace(1) %139, align 8
  %141 = select i1 %77, double %divide.394.5.clone.1, double %140
  %142 = getelementptr double, ptr addrspace(1) %arg3578, i64 %1
  %143 = load double, ptr addrspace(1) %142, align 8
  %144 = select i1 %77, double %add.340.3.clone.1, double %143
  %145 = getelementptr double, ptr addrspace(1) %arg3680, i64 %1
  %146 = load double, ptr addrspace(1) %145, align 8
  %147 = select i1 %77, double %89, double %146
  %148 = getelementptr double, ptr addrspace(1) %arg3782, i64 %1
  %149 = load double, ptr addrspace(1) %148, align 8
  %150 = select i1 %77, double %23, double %149
  %151 = getelementptr double, ptr addrspace(1) %arg3884, i64 %1
  %152 = load double, ptr addrspace(1) %151, align 8
  %153 = select i1 %77, double %91, double %152
  %154 = getelementptr double, ptr addrspace(1) %arg3986, i64 %1
  %155 = load double, ptr addrspace(1) %154, align 8
  %156 = select i1 %77, double %multiply.857.29, double %155
  %157 = getelementptr double, ptr addrspace(1) %arg4088, i64 %1
  %158 = load double, ptr addrspace(1) %157, align 8
  %159 = select i1 %77, double %subtract.78.1.clone.1, double %158
  store double %97, ptr addrspace(1) %32, align 8
  store double %104, ptr addrspace(1) %100, align 8
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
  store double %add.346.1.clone.1, ptr addrspace(1) %20, align 8
  %163 = getelementptr double, ptr addrspace(1) %arg4598, i64 %1
  store double %120, ptr addrspace(1) %163, align 8
  store double %123, ptr addrspace(1) %121, align 8
  store double %126, ptr addrspace(1) %124, align 8
  store double %129, ptr addrspace(1) %127, align 8
  store double %132, ptr addrspace(1) %130, align 8
  store i32 %135, ptr addrspace(1) %133, align 4
  store double %138, ptr addrspace(1) %136, align 8
  store double %141, ptr addrspace(1) %139, align 8
  store double %144, ptr addrspace(1) %142, align 8
  store double %147, ptr addrspace(1) %145, align 8
  store double %150, ptr addrspace(1) %148, align 8
  store double %153, ptr addrspace(1) %151, align 8
  store double %156, ptr addrspace(1) %154, align 8
  store double %159, ptr addrspace(1) %157, align 8
  store double %add.344.1.clone.1, ptr addrspace(1) %26, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg9) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.713 = load i64, ptr addrspace(1) %arg121, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.713, 0
  %2 = add i64 %param_1.713, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.713
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg223, i64 %thread_id_x
  %param_2.6504 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg937, i64 %thread_id_x
  %param_9.1135 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %param_8.158 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg835, i64 0, i64 %5
  %param_8.15811 = load double, ptr addrspace(1) %param_8.158, align 8, !invariant.load !115
  %8 = getelementptr double, ptr addrspace(1) %arg733, i64 %thread_id_x
  %param_7.20212 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %multiply.853.27 = fmul double %param_8.15811, %param_7.20212
  %compare.265.33 = fcmp ogt double %multiply.853.27, 1.000000e-128
  %9 = getelementptr double, ptr addrspace(1) %arg631, i64 %thread_id_x
  %param_6.27813 = load double, ptr addrspace(1) %9, align 8, !invariant.load !115
  %10 = select i1 %compare.265.33, double %multiply.853.27, double %param_6.27813
  %11 = getelementptr double, ptr addrspace(1) %arg529, i64 %thread_id_x
  %param_5.38914 = load double, ptr addrspace(1) %11, align 8, !invariant.load !115
  %multiply.857.17 = fmul double %param_5.38914, %10
  %multiply.864.3 = fmul double %param_9.1135, %multiply.857.17
  %multiply.869.6 = fmul double %multiply.864.3, %multiply.864.3
  %multiply.870.13 = fmul double %multiply.869.6, 5.000000e-01
  %12 = getelementptr double, ptr addrspace(1) %arg427, i64 %thread_id_x
  %param_4.52915 = load double, ptr addrspace(1) %12, align 8, !invariant.load !115
  %multiply.871.7 = fmul double %param_4.52915, %multiply.869.6
  %add.351.11 = fadd double %multiply.870.13, %multiply.871.7
  %multiply.872.13 = fmul double %param_9.1135, %param_9.1135
  %multiply.873.11 = fmul double %multiply.872.13, 5.000000e-01
  %multiply.874.6 = fmul double %multiply.873.11, %multiply.857.17
  %multiply.875.7 = fmul double %param_4.52915, %multiply.874.6
  %subtract.79.9 = fsub double %add.351.11, %multiply.875.7
  %13 = getelementptr i64, ptr addrspace(1) %arg325, i64 %thread_id_x
  %param_3.60618 = load i64, ptr addrspace(1) %13, align 8, !invariant.load !115
  %14 = sitofp i64 %param_3.60618 to double
  %multiply.876.7 = fmul double %subtract.79.9, %14
  %add.352.5 = fadd double %param_2.6504, %multiply.876.7
  %compare.270.3 = fcmp ogt double %add.352.5, 1.000000e-128
  %15 = zext i1 %compare.270.3 to i8
  %16 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg019, i64 0, i64 %5, i64 %thread_id_x
  store i8 %15, ptr addrspace(1) %16, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.685 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.685, 0
  %2 = add i64 %param_2.685, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.685
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.7315 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = tail call double @llvm.fabs.f64(double %param_1.7315)
  %8 = call i1 @llvm.is.fpclass.f64(double %param_1.7315, i32 504)
  %compare.266.45 = fcmp olt double %7, 1.400000e+01
  %9 = and i1 %8, %compare.266.45
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.667 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.667, 0
  %2 = add i64 %param_2.667, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.667
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.7254 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = tail call double @llvm.fabs.f64(double %param_1.7254)
  %8 = call i1 @llvm.is.fpclass.f64(double %param_1.7254, i32 504)
  %compare.266.47 = fcmp olt double %7, 1.400000e+01
  %9 = and i1 %8, %compare.266.47
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg7) local_unnamed_addr #2 {
entry:
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.577 = load i64, ptr addrspace(1) %arg219, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.577, 0
  %2 = add i64 %param_2.577, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.577
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg729, i64 %thread_id_x
  %param_7.2064 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %param_6.282 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg627, i64 0, i64 %5
  %param_6.28210 = load double, ptr addrspace(1) %param_6.282, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg525, i64 %thread_id_x
  %param_5.39411 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %multiply.853.37 = fmul double %param_6.28210, %param_5.39411
  %compare.265.43 = fcmp ogt double %multiply.853.37, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.49412 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %9 = select i1 %compare.265.43, double %multiply.853.37, double %param_4.49412
  %10 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.55713 = load double, ptr addrspace(1) %10, align 8, !invariant.load !115
  %multiply.857.27 = fmul double %param_3.55713, %9
  %multiply.864.13 = fmul double %param_7.2064, %multiply.857.27
  %11 = getelementptr double, ptr addrspace(1) %arg117, i64 %thread_id_x
  %param_1.64914 = load double, ptr addrspace(1) %11, align 8, !invariant.load !115
  %multiply.865.1 = fmul double %param_1.64914, %multiply.864.13
  %12 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg015, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.865.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.638 = load i64, ptr addrspace(1) %arg216, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.638, 0
  %2 = add i64 %param_2.638, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.638
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.7084 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %param_4.519 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg420, i64 0, i64 %5
  %param_4.51910 = load double, ptr addrspace(1) %param_4.519, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.59611 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %multiply.863.13 = fmul double %param_4.51910, %param_3.59611
  %add.350.1 = fadd double %param_1.7084, %multiply.863.13
  %multiply.886.1 = fmul double %add.350.1, %add.350.1
  %divide.407.1 = fdiv double 1.000000e+00, %multiply.886.1
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg012, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.407.1, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.659 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_2.659, 0
  %2 = add i64 %param_2.659, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.659
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.7064 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.866.3 = fmul double %param_1.7064, 2.000000e+00
  %multiply.885.1 = fmul double %multiply.866.3, %multiply.866.3
  %divide.406.1 = fdiv double 1.000000e+00, %multiply.885.1
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.406.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.654 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.654, 0
  %2 = add i64 %param_1.654, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.654
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.5824 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %multiply.866.7 = fmul double %param_2.5824, 2.000000e+00
  %divide.398.3 = fdiv double 1.000000e+00, %multiply.866.7
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.398.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.718 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.718, 0
  %2 = add i64 %param_1.718, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.718
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.6574 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.4005 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %8 = getelementptr double, ptr addrspace(1) %arg626, i64 %thread_id_x
  %param_6.2876 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %multiply.848.15 = fmul double %param_5.4005, %param_6.2876
  %param_4.538 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg422, i64 0, i64 %5
  %param_4.53812 = load double, ptr addrspace(1) %param_4.538, align 8, !invariant.load !115
  %9 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.61413 = load double, ptr addrspace(1) %9, align 8, !invariant.load !115
  %multiply.849.17 = fmul double %param_4.53812, %param_3.61413
  %add.340.15 = fadd double %multiply.848.15, %multiply.849.17
  %subtract.78.3 = fsub double %param_2.6574, %add.340.15
  %multiply.884.3 = fmul double %subtract.78.3, 2.000000e+00
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.884.3, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.696 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !115
  %1 = icmp slt i64 %param_1.696, 0
  %2 = add i64 %param_1.696, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.696
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.6244 = load double, ptr addrspace(1) %6, align 8, !invariant.load !115
  %7 = getelementptr double, ptr addrspace(1) %arg524, i64 %thread_id_x
  %param_5.3785 = load double, ptr addrspace(1) %7, align 8, !invariant.load !115
  %8 = getelementptr double, ptr addrspace(1) %arg626, i64 %thread_id_x
  %param_6.2676 = load double, ptr addrspace(1) %8, align 8, !invariant.load !115
  %multiply.848.9 = fmul double %param_5.3785, %param_6.2676
  %param_4.512 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg422, i64 0, i64 %5
  %param_4.51212 = load double, ptr addrspace(1) %param_4.512, align 8, !invariant.load !115
  %9 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.58713 = load double, ptr addrspace(1) %9, align 8, !invariant.load !115
  %multiply.849.11 = fmul double %param_4.51212, %param_3.58713
  %add.340.9 = fadd double %multiply.848.9, %multiply.849.11
  %subtract.78.4 = fsub double %param_2.6244, %add.340.9
  %multiply.859.1 = fmul double %subtract.78.4, %subtract.78.4
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.859.1, ptr addrspace(1) %10, align 8
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
define void @copy_fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg5) local_unnamed_addr #3 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !118
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 200
  br i1 %3, label %concatenate.pivot.4., label %copy_fusion.5.in_bounds-after

copy_fusion.5.in_bounds-after:                    ; preds = %slice1-after, %slice2-true, %entry
  ret void

concatenate.pivot.4.:                             ; preds = %entry
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg03, i64 0, i64 %5, i64 0
  br label %concatenate.3.merge

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %7 = icmp ult i32 %linear_index, 8
  br i1 %7, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  %8 = add nsw i32 %linear_index, -4
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg15, i64 0, i64 %9, i64 0
  br label %concatenate.3.merge

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  %11 = add nsw i32 %linear_index, -8
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg27, i64 0, i64 %12
  br label %concatenate.3.merge

concatenate.3.merge:                              ; preds = %concatenate.pivot.8.2, %concatenate.pivot.4.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %6, %concatenate.pivot.0. ], [ %10, %concatenate.pivot.4.1 ], [ %13, %concatenate.pivot.8.2 ]
  %14 = icmp ult i32 %linear_index, 4
  %15 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !115
  %16 = zext nneg i32 %linear_index to i64
  %17 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg39, i64 0, i64 %16
  br i1 %14, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.3.merge
  %18 = and i32 %linear_index, 252
  %19 = icmp eq i32 %18, 4
  %20 = add nsw i32 %linear_index, -4
  %21 = zext nneg i32 %20 to i64
  %22 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg411, i64 0, i64 %21
  br i1 %19, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %23 = icmp ugt i32 %linear_index, 7
  %24 = add nsw i32 %linear_index, -8
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg513, i64 0, i64 %25
  br i1 %23, label %slice2-true, label %copy_fusion.5.in_bounds-after

slice0-true:                                      ; preds = %concatenate.3.merge
  store double %15, ptr addrspace(1) %17, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double %15, ptr addrspace(1) %22, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double %15, ptr addrspace(1) %26, align 8
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

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109}
!llvm.ident = !{!110}
!nvvmir.version = !{!111}
!llvm.module.flags = !{!112}

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
!14 = !{ptr @loop_divide_exponential_multiply_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_divide_exponential_multiply_fusion, !"reqntidx", i32 4}
!16 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 4}
!18 = !{ptr @loop_divide_exponential_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_divide_exponential_fusion, !"reqntidx", i32 4}
!20 = !{ptr @wrapped_convert, !"kernel", i32 1}
!21 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!22 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!23 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 4}
!24 = !{ptr @loop_compare_multiply_select_fusion, !"kernel", i32 1}
!25 = !{ptr @loop_compare_multiply_select_fusion, !"reqntidx", i32 4}
!26 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!27 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 4}
!28 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!29 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 4}
!30 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!31 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 4}
!32 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!33 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 4}
!34 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!35 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 4}
!36 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!37 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 4}
!38 = !{ptr @loop_dynamic_update_slice_fusion_59, !"kernel", i32 1}
!39 = !{ptr @loop_dynamic_update_slice_fusion_59, !"reqntidx", i32 1}
!40 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!41 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 1}
!42 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!43 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 1}
!44 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!45 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 4}
!46 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!47 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 4}
!48 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!49 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 4}
!50 = !{ptr @loop_dynamic_update_slice_fusion_24, !"kernel", i32 1}
!51 = !{ptr @loop_dynamic_update_slice_fusion_24, !"reqntidx", i32 4}
!52 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!53 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 4}
!54 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!55 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 4}
!56 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!57 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 4}
!58 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!59 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 4}
!60 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!61 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 4}
!62 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!63 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 4}
!64 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!65 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 4}
!66 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!67 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 4}
!68 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!69 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 4}
!70 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!71 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 4}
!72 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!73 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 4}
!74 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!75 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 4}
!76 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!77 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 4}
!78 = !{ptr @loop_dynamic_update_slice_fusion_58, !"kernel", i32 1}
!79 = !{ptr @loop_dynamic_update_slice_fusion_58, !"reqntidx", i32 4}
!80 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 4}
!82 = !{ptr @loop_dynamic_update_slice_fusion_20, !"kernel", i32 1}
!83 = !{ptr @loop_dynamic_update_slice_fusion_20, !"reqntidx", i32 4}
!84 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!85 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 4}
!86 = !{ptr @loop_add_divide_exponential_select_fusion, !"kernel", i32 1}
!87 = !{ptr @loop_add_divide_exponential_select_fusion, !"reqntidx", i32 4}
!88 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 4}
!90 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 4}
!92 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 4}
!94 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 4}
!96 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 4}
!98 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 4}
!100 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 4}
!102 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 4}
!104 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 4}
!106 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!107 = !{ptr @loop_add_fusion, !"reqntidx", i32 1}
!108 = !{ptr @copy_fusion_5, !"kernel", i32 1}
!109 = !{ptr @copy_fusion_5, !"reqntidx", i32 128}
!110 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!111 = !{i32 2, i32 0}
!112 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!113 = !{i32 0, i32 12}
!114 = !{i32 0, i32 128}
!115 = !{}
!116 = !{i32 0, i32 8}
!117 = !{i32 0, i32 4}
!118 = !{i32 0, i32 2}
