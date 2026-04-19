; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_25_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !38
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 192
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  br i1 %3, label %slice0-true, label %slice0-after

input_slice_fusion.in_bounds-after:               ; preds = %slice0-after, %slice1-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %6 = icmp ugt i32 %linear_index, 191
  %7 = add nsw i32 %linear_index, -192
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg15, i64 0, i64 %8
  br i1 %6, label %slice1-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %9, align 8
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 0, ptr addrspace(1) %2, align 8
  %3 = getelementptr i64, ptr addrspace(1) %arg13, i64 %1
  store i64 0, ptr addrspace(1) %3, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !40
  %1 = icmp slt i64 %0, 192
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #2 {
entry:
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !40
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x i64], ptr addrspace(1) %arg02, i64 0, i64 %7
  %9 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !40
  %10 = icmp ne i64 %9, 0
  %11 = zext i1 %10 to i32
  store i64 %9, ptr addrspace(1) %arg26, align 128
  store i32 %11, ptr addrspace(1) %arg38, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_dynamic_slice_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg13) local_unnamed_addr #2 {
entry:
  %arg1335 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1233 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1131 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1029 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg927 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg825 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg723 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg315, align 16, !invariant.load !40
  %1 = load double, ptr addrspace(1) %arg417, align 128, !invariant.load !40
  %multiply.69.1.clone.1 = fmul double %0, %1
  %2 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !40
  %3 = icmp slt i64 %2, 0
  %4 = add i64 %2, 192
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg111, i64 0, i64 %9
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !40
  %12 = load double, ptr addrspace(1) %arg09, align 16, !invariant.load !40
  %multiply.70.3.clone.1 = fmul double %11, %12
  %add.35.1.clone.1 = fadd double %multiply.69.1.clone.1, %multiply.70.3.clone.1
  %13 = fneg double %add.35.1.clone.1
  %14 = tail call double @llvm.fma.f64(double %13, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %15 = tail call i32 @llvm.nvvm.d2i.lo(double %14) #5
  %16 = tail call double @llvm.nvvm.add.rn.d(double %14, double 0xC338000000000000) #5
  %17 = tail call double @llvm.fma.f64(double %16, double 0xBFE62E42FEFA39EF, double %13)
  %18 = tail call double @llvm.fma.f64(double %16, double 0xBC7ABC9E3B39803F, double %17)
  %19 = tail call double @llvm.fma.f64(double %18, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %20 = tail call double @llvm.fma.f64(double %19, double %18, double 0x3EC71DEE62401315)
  %21 = tail call double @llvm.fma.f64(double %20, double %18, double 0x3EFA01997C89EB71)
  %22 = tail call double @llvm.fma.f64(double %21, double %18, double 0x3F2A01A014761F65)
  %23 = tail call double @llvm.fma.f64(double %22, double %18, double 0x3F56C16C1852B7AF)
  %24 = tail call double @llvm.fma.f64(double %23, double %18, double 0x3F81111111122322)
  %25 = tail call double @llvm.fma.f64(double %24, double %18, double 0x3FA55555555502A1)
  %26 = tail call double @llvm.fma.f64(double %25, double %18, double 0x3FC5555555555511)
  %27 = tail call double @llvm.fma.f64(double %26, double %18, double 0x3FE000000000000B)
  %28 = tail call double @llvm.fma.f64(double %27, double %18, double 1.000000e+00)
  %29 = tail call double @llvm.fma.f64(double %28, double %18, double 1.000000e+00)
  %30 = tail call i32 @llvm.nvvm.d2i.lo(double %29) #5
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %29) #5
  %32 = shl i32 %15, 20
  %33 = add i32 %31, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %30, i32 %33) #5
  %35 = tail call i32 @llvm.nvvm.d2i.hi(double %13) #5
  %36 = bitcast i32 %35 to float
  %37 = tail call float @llvm.nvvm.fabs.f(float %36) #5
  %38 = fcmp olt float %37, 0x4010C46560000000
  br i1 %38, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %39 = fcmp ogt double %add.35.1.clone.1, 0.000000e+00
  %40 = fsub double 0x7FF0000000000000, %add.35.1.clone.1
  %z.0.i = select i1 %39, double 0.000000e+00, double %40
  %41 = fcmp olt float %37, 0x4010E90000000000
  br i1 %41, label %42, label %__nv_exp.exit

42:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %43 = sdiv i32 %15, 2
  %44 = shl i32 %43, 20
  %45 = add i32 %31, %44
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 %30, i32 %45) #5
  %47 = sub nsw i32 %15, %43
  %48 = shl i32 %47, 20
  %49 = add nsw i32 %48, 1072693248
  %50 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %49) #5
  %51 = fmul double %50, %46
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %42
  %z.2.i = phi double [ %34, %entry ], [ %51, %42 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %52 = load double, ptr addrspace(1) %arg519, align 16, !invariant.load !40
  %53 = tail call double @llvm.fma.f64(double %52, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %54 = tail call i32 @llvm.nvvm.d2i.lo(double %53) #5
  %55 = tail call double @llvm.nvvm.add.rn.d(double %53, double 0xC338000000000000) #5
  %56 = tail call double @llvm.fma.f64(double %55, double 0xBFE62E42FEFA39EF, double %52)
  %57 = tail call double @llvm.fma.f64(double %55, double 0xBC7ABC9E3B39803F, double %56)
  %58 = tail call double @llvm.fma.f64(double %57, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %59 = tail call double @llvm.fma.f64(double %58, double %57, double 0x3EC71DEE62401315)
  %60 = tail call double @llvm.fma.f64(double %59, double %57, double 0x3EFA01997C89EB71)
  %61 = tail call double @llvm.fma.f64(double %60, double %57, double 0x3F2A01A014761F65)
  %62 = tail call double @llvm.fma.f64(double %61, double %57, double 0x3F56C16C1852B7AF)
  %63 = tail call double @llvm.fma.f64(double %62, double %57, double 0x3F81111111122322)
  %64 = tail call double @llvm.fma.f64(double %63, double %57, double 0x3FA55555555502A1)
  %65 = tail call double @llvm.fma.f64(double %64, double %57, double 0x3FC5555555555511)
  %66 = tail call double @llvm.fma.f64(double %65, double %57, double 0x3FE000000000000B)
  %67 = tail call double @llvm.fma.f64(double %66, double %57, double 1.000000e+00)
  %68 = tail call double @llvm.fma.f64(double %67, double %57, double 1.000000e+00)
  %69 = tail call i32 @llvm.nvvm.d2i.lo(double %68) #5
  %70 = tail call i32 @llvm.nvvm.d2i.hi(double %68) #5
  %71 = shl i32 %54, 20
  %72 = add i32 %70, %71
  %73 = tail call double @llvm.nvvm.lohi.i2d(i32 %69, i32 %72) #5
  %74 = tail call i32 @llvm.nvvm.d2i.hi(double %52) #5
  %75 = bitcast i32 %74 to float
  %76 = tail call float @llvm.nvvm.fabs.f(float %75) #5
  %77 = fcmp olt float %76, 0x4010C46560000000
  br i1 %77, label %__nv_exp.exit8, label %__internal_fast_icmp_abs_lt.exit.i5

__internal_fast_icmp_abs_lt.exit.i5:              ; preds = %__nv_exp.exit
  %78 = fcmp olt double %52, 0.000000e+00
  %79 = fadd double %52, 0x7FF0000000000000
  %z.0.i6 = select i1 %78, double 0.000000e+00, double %79
  %80 = fcmp olt float %76, 0x4010E90000000000
  br i1 %80, label %81, label %__nv_exp.exit8

81:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i5
  %82 = sdiv i32 %54, 2
  %83 = shl i32 %82, 20
  %84 = add i32 %70, %83
  %85 = tail call double @llvm.nvvm.lohi.i2d(i32 %69, i32 %84) #5
  %86 = sub nsw i32 %54, %82
  %87 = shl i32 %86, 20
  %88 = add nsw i32 %87, 1072693248
  %89 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %88) #5
  %90 = fmul double %89, %85
  br label %__nv_exp.exit8

__nv_exp.exit8:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i5, %81
  %z.2.i7 = phi double [ %73, %__nv_exp.exit ], [ %90, %81 ], [ %z.0.i6, %__internal_fast_icmp_abs_lt.exit.i5 ]
  %add.36.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.37.1.clone.1 = fdiv double 1.000000e+00, %add.36.1.clone.1
  %subtract.11.1 = fsub double 1.000000e+00, %divide.37.1.clone.1
  %multiply.71.1 = fmul double %divide.37.1.clone.1, %subtract.11.1
  %multiply.73.5.clone.1 = fmul double %11, %z.2.i7
  %compare.20.3.clone.1 = fcmp ogt double %multiply.73.5.clone.1, 1.000000e-128
  %91 = select i1 %compare.20.3.clone.1, double %multiply.73.5.clone.1, double 0x7FF8000000000000
  %92 = load double, ptr addrspace(1) %arg621, align 128, !invariant.load !40
  %divide.39.1.clone.1.clone.1 = fdiv double 1.000000e+00, %92
  %add.37.1.clone.1.clone.1 = fadd double %divide.39.1.clone.1.clone.1, %91
  %divide.40.1.clone.1.clone.1 = fdiv double 1.000000e+00, %add.37.1.clone.1.clone.1
  %multiply.77.1.clone.1 = fmul double %91, %divide.40.1.clone.1.clone.1
  store double %multiply.71.1, ptr addrspace(1) %arg723, align 128
  store double %divide.37.1.clone.1, ptr addrspace(1) %arg825, align 128
  store double %add.35.1.clone.1, ptr addrspace(1) %arg927, align 128
  store double %multiply.77.1.clone.1, ptr addrspace(1) %arg1029, align 128
  store double %divide.40.1.clone.1.clone.1, ptr addrspace(1) %arg1131, align 128
  store double %divide.39.1.clone.1.clone.1, ptr addrspace(1) %arg1233, align 128
  store double %11, ptr addrspace(1) %arg1335, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg26, align 128
  %1 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !40
  %2 = load double, ptr addrspace(1) %arg14, align 16, !invariant.load !40
  %3 = tail call double @llvm.fma.f64(double %2, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #5
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #5
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %2)
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
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %2) #5
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #5
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %2, 0.000000e+00
  %29 = fadd double %2, 0x7FF0000000000000
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
  %divide.35.1 = fdiv double 1.000000e+00, %0
  %multiply.65.1 = fmul double %1, %z.2.i
  %add.31.1 = fadd double %divide.35.1, %multiply.65.1
  %divide.36.1 = fdiv double 1.000000e+00, %add.31.1
  store double %divide.36.1, ptr addrspace(1) %arg26, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !40
  %1 = load double, ptr addrspace(1) %arg37, align 16, !invariant.load !40
  %multiply.66.1 = fmul double %1, %1
  %2 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !40
  %multiply.67.7 = fmul double %multiply.66.1, %2
  %3 = load i64, ptr addrspace(1) %arg25, align 128, !invariant.load !40
  %4 = sitofp i64 %3 to double
  %multiply.68.5 = fmul double %multiply.67.7, %4
  %add.32.3 = fadd double %0, %multiply.68.5
  %compare.18.1 = fcmp ogt double %add.32.3, 1.000000e-128
  %5 = select i1 %compare.18.1, double %add.32.3, double 0x7FF8000000000000
  store double %5, ptr addrspace(1) %arg49, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_dynamic_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg10) local_unnamed_addr #2 {
entry:
  %arg1022 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg920 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg818 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg716 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg614 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !40
  %1 = load double, ptr addrspace(1) %arg38, align 16, !invariant.load !40
  %2 = load double, ptr addrspace(1) %arg26, align 128, !invariant.load !40
  %multiply.74.7 = fmul double %1, %2
  %3 = load double, ptr addrspace(1) %arg14, align 128, !invariant.load !40
  %divide.41.5 = fdiv double %multiply.74.7, %3
  %4 = load i64, ptr addrspace(1) %arg512, align 128, !invariant.load !40
  %5 = icmp slt i64 %4, 0
  %6 = add i64 %4, 192
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc i64 %7 to i32
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 191)
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds [192 x [1 x double]], ptr addrspace(1) %arg716, i64 0, i64 %11, i64 0
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !40
  %14 = load double, ptr addrspace(1) %arg614, align 128, !invariant.load !40
  %subtract.12.5.clone.1 = fsub double %13, %14
  %15 = getelementptr inbounds [192 x i64], ptr addrspace(1) %arg410, i64 0, i64 %11
  %16 = load i64, ptr addrspace(1) %15, align 8, !invariant.load !40
  %17 = sitofp i64 %16 to double
  %multiply.72.3.clone.1 = fmul double %subtract.12.5.clone.1, %17
  %divide.38.1.clone.1 = fdiv double %multiply.72.3.clone.1, %2
  %multiply.75.1 = fmul double %divide.38.1.clone.1, %17
  %multiply.76.3 = fmul double %divide.41.5, %multiply.75.1
  %add.38.1 = fadd double %0, %multiply.76.3
  store double %add.38.1, ptr addrspace(1) %arg818, align 128
  store double %divide.38.1.clone.1, ptr addrspace(1) %arg920, align 128
  store double %13, ptr addrspace(1) %arg1022, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.148 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !40
  %0 = icmp slt i64 %param_2.148, 0
  %1 = add i64 %param_2.148, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.148
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.160 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !40
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  store double %param_1.160, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.177 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !40
  %0 = icmp slt i64 %param_2.177, 0
  %1 = add i64 %param_2.177, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.177
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.1804 = load double, ptr addrspace(1) %arg17, align 16, !invariant.load !40
  %5 = getelementptr inbounds [192 x [1 x double]], ptr addrspace(1) %arg05, i64 0, i64 %4, i64 0
  store double %param_1.1804, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.103 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !40
  %0 = icmp slt i64 %param_2.103, 0
  %1 = add i64 %param_2.103, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.103
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.125 = load double, ptr addrspace(1) %arg15, align 16, !invariant.load !40
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  store double %param_1.125, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.151 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !40
  %0 = icmp slt i64 %param_2.151, 0
  %1 = add i64 %param_2.151, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.151
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.162 = load i64, ptr addrspace(1) %arg15, align 16, !invariant.load !40
  %5 = getelementptr inbounds [192 x i64], ptr addrspace(1) %arg03, i64 0, i64 %4
  store i64 %param_1.162, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.129 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !40
  %0 = icmp slt i64 %param_2.129, 0
  %1 = add i64 %param_2.129, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.129
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.146 = getelementptr inbounds [192 x i64], ptr addrspace(1) %arg111, i64 0, i64 %4
  %param_1.1468 = load i64, ptr addrspace(1) %param_1.146, align 8, !invariant.load !40
  %5 = getelementptr inbounds [192 x i64], ptr addrspace(1) %arg09, i64 0, i64 %4
  store i64 %param_1.1468, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.179 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !40
  %0 = icmp slt i64 %param_2.179, 0
  %1 = add i64 %param_2.179, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.179
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.144 = getelementptr inbounds [192 x [1 x double]], ptr addrspace(1) %arg112, i64 0, i64 %4, i64 0
  %param_1.1449 = load double, ptr addrspace(1) %param_1.144, align 8, !invariant.load !40
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg010, i64 0, i64 %4
  store double %param_1.1449, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.118 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !40
  %0 = icmp slt i64 %param_2.118, 0
  %1 = add i64 %param_2.118, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.118
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.138 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg111, i64 0, i64 %4
  %param_1.1388 = load double, ptr addrspace(1) %param_1.138, align 8, !invariant.load !40
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg09, i64 0, i64 %4
  store double %param_1.1388, ptr addrspace(1) %5, align 8
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none)
define void @copy_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg5) local_unnamed_addr #3 {
entry:
  %arg514 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg412 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg310 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !41
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !38
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 194
  br i1 %3, label %concatenate.pivot.1., label %copy_fusion.1.in_bounds-after

copy_fusion.1.in_bounds-after:                    ; preds = %slice1-after, %slice2-true, %entry
  ret void

concatenate.pivot.1.:                             ; preds = %entry
  %trunc = trunc nuw i32 %linear_index to i8
  %4 = zext i8 %trunc to i16
  switch i16 %4, label %concatenate.pivot.2.2 [
    i16 0, label %concatenate.1.merge
    i16 1, label %concatenate.pivot.1.1
  ]

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  br label %concatenate.1.merge

concatenate.pivot.2.2:                            ; preds = %concatenate.pivot.1.
  %5 = add nsw i32 %linear_index, -2
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg28, i64 0, i64 %6
  br label %concatenate.1.merge

concatenate.1.merge:                              ; preds = %concatenate.pivot.1., %concatenate.pivot.2.2, %concatenate.pivot.1.1
  %.in = phi ptr addrspace(1) [ %arg16, %concatenate.pivot.1.1 ], [ %7, %concatenate.pivot.2.2 ], [ %arg04, %concatenate.pivot.1. ]
  %8 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !40
  %9 = zext i8 %trunc to i16
  switch i16 %9, label %slice1-after [
    i16 0, label %slice1-after.sink.split
    i16 1, label %slice1-true
  ]

slice1-after.sink.split:                          ; preds = %concatenate.1.merge, %slice1-true
  %arg3.sink = phi ptr addrspace(1) [ %arg412, %slice1-true ], [ %arg310, %concatenate.1.merge ]
  store double %8, ptr addrspace(1) %arg3.sink, align 128
  br label %slice1-after

slice1-after:                                     ; preds = %slice1-after.sink.split, %concatenate.1.merge
  %10 = icmp ugt i32 %linear_index, 1
  %11 = add nsw i32 %linear_index, -2
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg514, i64 0, i64 %12
  br i1 %10, label %slice2-true, label %copy_fusion.1.in_bounds-after

slice1-true:                                      ; preds = %concatenate.1.merge
  br label %slice1-after.sink.split

slice2-true:                                      ; preds = %slice1-after
  store double %8, ptr addrspace(1) %13, align 8
  br label %copy_fusion.1.in_bounds-after
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33}
!llvm.ident = !{!34}
!nvvmir.version = !{!35}
!llvm.module.flags = !{!36}

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
!34 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!35 = !{i32 2, i32 0}
!36 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!37 = !{i32 0, i32 3}
!38 = !{i32 0, i32 128}
!39 = !{i32 0, i32 192}
!40 = !{}
!41 = !{i32 0, i32 2}
