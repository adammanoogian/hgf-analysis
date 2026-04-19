; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg02, align 16, !invariant.load !25
  %1 = icmp ne i64 %0, 0
  %2 = zext i1 %1 to i32
  store i32 %2, ptr addrspace(1) %arg14, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 16, !invariant.load !25
  %1 = icmp ne i64 %0, 0
  %2 = zext i1 %1 to i32
  store i32 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #0 {
entry:
  %arg614 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg410, align 16, !invariant.load !25
  %1 = load double, ptr addrspace(1) %arg38, align 16, !invariant.load !25
  %2 = load double, ptr addrspace(1) %arg02, align 16, !invariant.load !25
  %3 = load double, ptr addrspace(1) %arg26, align 16, !invariant.load !25
  %4 = load double, ptr addrspace(1) %arg14, align 16, !invariant.load !25
  %multiply.192.9 = fmul double %3, %4
  %add.79.7 = fadd double %2, %multiply.192.9
  %5 = tail call double @llvm.fma.f64(double %add.79.7, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #4
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #4
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.79.7)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #4
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #4
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #4
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.79.7) #4
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #4
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.79.7, 0.000000e+00
  %31 = fadd double %add.79.7, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #4
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #4
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.82.1.clone.1 = fdiv double 1.000000e+00, %0
  %multiply.193.3 = fmul double %1, %z.2.i
  %compare.31.6 = fcmp ogt double %multiply.193.3, 1.000000e-128
  %43 = select i1 %compare.31.6, double %multiply.193.3, double 0x7FF8000000000000
  %add.80.5 = fadd double %divide.82.1.clone.1, %43
  %divide.83.1 = fdiv double 1.000000e+00, %add.80.5
  store double %divide.83.1, ptr addrspace(1) %arg512, align 128
  store double %divide.82.1.clone.1, ptr addrspace(1) %arg614, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion_8(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !26
  %arg0.val = load double, ptr addrspace(1) %arg03, align 16
  %arg1.val = load double, ptr addrspace(1) %arg15, align 16
  switch i32 %0, label %slice1-after [
    i32 0, label %slice1-after.sink.split
    i32 1, label %slice1-true
  ]

copy_fusion.8.in_bounds-after:                    ; preds = %slice1-after, %slice2-true
  ret void

slice1-after.sink.split:                          ; preds = %entry, %slice1-true
  %arg2.sink = phi ptr addrspace(1) [ %arg39, %slice1-true ], [ %arg27, %entry ]
  store double %arg0.val, ptr addrspace(1) %arg2.sink, align 128
  br label %slice1-after

slice1-after:                                     ; preds = %slice1-after.sink.split, %entry
  %1 = icmp ugt i32 %0, 1
  br i1 %1, label %slice2-true, label %copy_fusion.8.in_bounds-after

slice1-true:                                      ; preds = %entry
  br label %slice1-after.sink.split

slice2-true:                                      ; preds = %slice1-after
  store double %arg1.val, ptr addrspace(1) %arg411, align 128
  br label %copy_fusion.8.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #0 {
entry:
  %arg615 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg27, align 16, !invariant.load !25
  %1 = load double, ptr addrspace(1) %arg39, align 16, !invariant.load !25
  %multiply.188.1.clone.1 = fmul double %0, %1
  %2 = load double, ptr addrspace(1) %arg15, align 16, !invariant.load !25
  %3 = load double, ptr addrspace(1) %arg03, align 16, !invariant.load !25
  %multiply.189.3.clone.1 = fmul double %2, %3
  %add.77.1.clone.1 = fadd double %multiply.188.1.clone.1, %multiply.189.3.clone.1
  %4 = fneg double %add.77.1.clone.1
  %5 = tail call double @llvm.fma.f64(double %4, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #4
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #4
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %4)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #4
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #4
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #4
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %4) #4
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #4
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp ogt double %add.77.1.clone.1, 0.000000e+00
  %31 = fsub double 0x7FF0000000000000, %add.77.1.clone.1
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #4
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #4
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.78.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.79.1.clone.1 = fdiv double 1.000000e+00, %add.78.1.clone.1
  %subtract.24.1 = fsub double 1.000000e+00, %divide.79.1.clone.1
  %multiply.190.1 = fmul double %divide.79.1.clone.1, %subtract.24.1
  store double %multiply.190.1, ptr addrspace(1) %arg411, align 128
  store double %divide.79.1.clone.1, ptr addrspace(1) %arg513, align 128
  store double %add.77.1.clone.1, ptr addrspace(1) %arg615, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg410, align 16, !invariant.load !25
  %1 = load double, ptr addrspace(1) %arg02, align 16, !invariant.load !25
  %2 = load double, ptr addrspace(1) %arg14, align 16, !invariant.load !25
  %3 = load double, ptr addrspace(1) %arg38, align 16, !invariant.load !25
  %4 = load double, ptr addrspace(1) %arg26, align 16, !invariant.load !25
  %multiply.173.11 = fmul double %3, %4
  %add.71.9 = fadd double %2, %multiply.173.11
  %5 = tail call double @llvm.fma.f64(double %add.71.9, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #4
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #4
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.71.9)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #4
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #4
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #4
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.71.9) #4
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #4
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.71.9, 0.000000e+00
  %31 = fadd double %add.71.9, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #4
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #4
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.75.1 = fdiv double 1.000000e+00, %0
  %multiply.174.5 = fmul double %1, %z.2.i
  %add.72.3 = fadd double %divide.75.1, %multiply.174.5
  %divide.76.1 = fdiv double 1.000000e+00, %add.72.3
  store double %divide.76.1, ptr addrspace(1) %arg512, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !25
  %1 = load double, ptr addrspace(1) %arg37, align 16, !invariant.load !25
  %multiply.175.3 = fmul double %1, %1
  %2 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !25
  %multiply.176.7 = fmul double %multiply.175.3, %2
  %3 = load i64, ptr addrspace(1) %arg13, align 16, !invariant.load !25
  %4 = sitofp i64 %3 to double
  %multiply.177.5 = fmul double %multiply.176.7, %4
  %add.73.3 = fadd double %0, %multiply.177.5
  %compare.29.1 = fcmp ogt double %add.73.3, 1.000000e-128
  %5 = select i1 %compare.29.1, double %add.73.3, double 0x7FF8000000000000
  store double %5, ptr addrspace(1) %arg49, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_multiply_subtract_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg27) local_unnamed_addr #0 {
entry:
  %arg2764 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2662 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2560 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2458 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2356 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2254 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2152 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2050 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1948 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1846 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1744 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1642 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1540 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1438 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1336 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1234 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1132 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1030 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg928 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg826 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg622, align 16, !invariant.load !25
  %1 = load double, ptr addrspace(1) %arg724, align 16, !invariant.load !25
  %2 = load double, ptr addrspace(1) %arg316, align 16, !invariant.load !25
  %3 = load double, ptr addrspace(1) %arg520, align 16, !invariant.load !25
  %4 = load double, ptr addrspace(1) %arg010, align 16, !invariant.load !25
  %5 = load double, ptr addrspace(1) %arg1132, align 16, !invariant.load !25
  %6 = load double, ptr addrspace(1) %arg1234, align 16, !invariant.load !25
  %multiply.192.11.clone.1 = fmul double %1, %6
  %add.79.9.clone.1 = fadd double %5, %multiply.192.11.clone.1
  %7 = tail call double @llvm.fma.f64(double %add.79.9.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %8 = tail call i32 @llvm.nvvm.d2i.lo(double %7) #4
  %9 = tail call double @llvm.nvvm.add.rn.d(double %7, double 0xC338000000000000) #4
  %10 = tail call double @llvm.fma.f64(double %9, double 0xBFE62E42FEFA39EF, double %add.79.9.clone.1)
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
  %23 = tail call i32 @llvm.nvvm.d2i.lo(double %22) #4
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %22) #4
  %25 = shl i32 %8, 20
  %26 = add i32 %24, %25
  %27 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %26) #4
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %add.79.9.clone.1) #4
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.fabs.f(float %29) #4
  %31 = fcmp olt float %30, 0x4010C46560000000
  br i1 %31, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %32 = fcmp olt double %add.79.9.clone.1, 0.000000e+00
  %33 = fadd double %add.79.9.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %32, double 0.000000e+00, double %33
  %34 = fcmp olt float %30, 0x4010E90000000000
  br i1 %34, label %35, label %__nv_exp.exit

35:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %36 = sdiv i32 %8, 2
  %37 = shl i32 %36, 20
  %38 = add i32 %24, %37
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %38) #4
  %40 = sub nsw i32 %8, %36
  %41 = shl i32 %40, 20
  %42 = add nsw i32 %41, 1072693248
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %42) #4
  %44 = fmul double %43, %39
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %35
  %z.2.i = phi double [ %27, %entry ], [ %44, %35 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %45 = load double, ptr addrspace(1) %arg826, align 128, !invariant.load !25
  %46 = load double, ptr addrspace(1) %arg1030, align 128, !invariant.load !25
  %47 = load double, ptr addrspace(1) %arg928, align 128, !invariant.load !25
  %48 = load double, ptr addrspace(1) %arg1336, align 128, !invariant.load !25
  %49 = load double, ptr addrspace(1) %arg1642, align 16, !invariant.load !25
  %50 = load double, ptr addrspace(1) %arg1540, align 128, !invariant.load !25
  %51 = load double, ptr addrspace(1) %arg1846, align 16, !invariant.load !25
  %52 = load double, ptr addrspace(1) %arg1744, align 128, !invariant.load !25
  %53 = load i64, ptr addrspace(1) %arg1438, align 16, !invariant.load !25
  %54 = load double, ptr addrspace(1) %arg418, align 16, !invariant.load !25
  %55 = load double, ptr addrspace(1) %arg214, align 16, !invariant.load !25
  %56 = tail call double @llvm.fma.f64(double %55, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %57 = tail call i32 @llvm.nvvm.d2i.lo(double %56) #4
  %58 = tail call double @llvm.nvvm.add.rn.d(double %56, double 0xC338000000000000) #4
  %59 = tail call double @llvm.fma.f64(double %58, double 0xBFE62E42FEFA39EF, double %55)
  %60 = tail call double @llvm.fma.f64(double %58, double 0xBC7ABC9E3B39803F, double %59)
  %61 = tail call double @llvm.fma.f64(double %60, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %62 = tail call double @llvm.fma.f64(double %61, double %60, double 0x3EC71DEE62401315)
  %63 = tail call double @llvm.fma.f64(double %62, double %60, double 0x3EFA01997C89EB71)
  %64 = tail call double @llvm.fma.f64(double %63, double %60, double 0x3F2A01A014761F65)
  %65 = tail call double @llvm.fma.f64(double %64, double %60, double 0x3F56C16C1852B7AF)
  %66 = tail call double @llvm.fma.f64(double %65, double %60, double 0x3F81111111122322)
  %67 = tail call double @llvm.fma.f64(double %66, double %60, double 0x3FA55555555502A1)
  %68 = tail call double @llvm.fma.f64(double %67, double %60, double 0x3FC5555555555511)
  %69 = tail call double @llvm.fma.f64(double %68, double %60, double 0x3FE000000000000B)
  %70 = tail call double @llvm.fma.f64(double %69, double %60, double 1.000000e+00)
  %71 = tail call double @llvm.fma.f64(double %70, double %60, double 1.000000e+00)
  %72 = tail call i32 @llvm.nvvm.d2i.lo(double %71) #4
  %73 = tail call i32 @llvm.nvvm.d2i.hi(double %71) #4
  %74 = shl i32 %57, 20
  %75 = add i32 %73, %74
  %76 = tail call double @llvm.nvvm.lohi.i2d(i32 %72, i32 %75) #4
  %77 = tail call i32 @llvm.nvvm.d2i.hi(double %55) #4
  %78 = bitcast i32 %77 to float
  %79 = tail call float @llvm.nvvm.fabs.f(float %78) #4
  %80 = fcmp olt float %79, 0x4010C46560000000
  br i1 %80, label %__nv_exp.exit9, label %__internal_fast_icmp_abs_lt.exit.i6

__internal_fast_icmp_abs_lt.exit.i6:              ; preds = %__nv_exp.exit
  %81 = fcmp olt double %55, 0.000000e+00
  %82 = fadd double %55, 0x7FF0000000000000
  %z.0.i7 = select i1 %81, double 0.000000e+00, double %82
  %83 = fcmp olt float %79, 0x4010E90000000000
  br i1 %83, label %84, label %__nv_exp.exit9

84:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i6
  %85 = sdiv i32 %57, 2
  %86 = shl i32 %85, 20
  %87 = add i32 %73, %86
  %88 = tail call double @llvm.nvvm.lohi.i2d(i32 %72, i32 %87) #4
  %89 = sub nsw i32 %57, %85
  %90 = shl i32 %89, 20
  %91 = add nsw i32 %90, 1072693248
  %92 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %91) #4
  %93 = fmul double %92, %88
  br label %__nv_exp.exit9

__nv_exp.exit9:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i6, %84
  %z.2.i8 = phi double [ %76, %__nv_exp.exit ], [ %93, %84 ], [ %z.0.i7, %__internal_fast_icmp_abs_lt.exit.i6 ]
  %divide.86.1.clone.1 = fdiv double 1.000000e+00, %54
  %multiply.193.5.clone.1 = fmul double %2, %z.2.i
  %compare.31.2.clone.1 = fcmp ogt double %multiply.193.5.clone.1, 1.000000e-128
  %94 = select i1 %compare.31.2.clone.1, double %multiply.193.5.clone.1, double 0x7FF8000000000000
  %multiply.199.1.clone.1 = fmul double %45, %94
  %multiply.207.9 = fmul double %4, %multiply.199.1.clone.1
  %add.80.3.clone.1 = fadd double %46, %94
  %multiply.200.1.clone.1 = fmul double %47, %add.80.3.clone.1
  %divide.85.1.clone.1 = fdiv double 1.000000e+00, %multiply.200.1.clone.1
  %multiply.194.7.clone.1 = fmul double %49, %50
  %divide.84.5.clone.1 = fdiv double %multiply.194.7.clone.1, %47
  %subtract.25.5.clone.1 = fsub double %51, %52
  %95 = sitofp i64 %53 to double
  %multiply.191.3.clone.1 = fmul double %subtract.25.5.clone.1, %95
  %divide.80.1.clone.1 = fdiv double %multiply.191.3.clone.1, %50
  %multiply.195.1.clone.1 = fmul double %divide.80.1.clone.1, %95
  %multiply.196.3.clone.1 = fmul double %divide.84.5.clone.1, %multiply.195.1.clone.1
  %add.81.1.clone.1 = fadd double %48, %multiply.196.3.clone.1
  %subtract.26.1 = fsub double %add.81.1.clone.1, %48
  %multiply.202.1.clone.1 = fmul double %subtract.26.1, %subtract.26.1
  %multiply.203.1.clone.1 = fmul double %45, %multiply.202.1.clone.1
  %add.82.1.clone.1 = fadd double %divide.85.1.clone.1, %multiply.203.1.clone.1
  %add.83.1.clone.1 = fadd double %add.82.1.clone.1, -1.000000e+00
  %multiply.208.7 = fmul double %multiply.207.9, %add.83.1.clone.1
  %multiply.204.1.clone.1 = fmul double %0, %1
  %multiply.205.3.clone.1 = fmul double %2, %3
  %add.84.1.clone.1 = fadd double %multiply.204.1.clone.1, %multiply.205.3.clone.1
  %multiply.206.3.clone.1 = fmul double %2, %z.2.i8
  %compare.33.1.clone.1 = fcmp ogt double %multiply.206.3.clone.1, 1.000000e-128
  %96 = select i1 %compare.33.1.clone.1, double %multiply.206.3.clone.1, double 0x7FF8000000000000
  %add.85.1.clone.1 = fadd double %divide.86.1.clone.1, %96
  %divide.87.1.clone.1 = fdiv double 1.000000e+00, %add.85.1.clone.1
  %multiply.209.1 = fmul double %divide.87.1.clone.1, 2.000000e+00
  %divide.88.1 = fdiv double 1.000000e+00, %multiply.209.1
  %multiply.210.5 = fmul double %multiply.208.7, %divide.88.1
  %97 = load i64, ptr addrspace(1) %arg112, align 16, !invariant.load !25
  %98 = sitofp i64 %97 to double
  %multiply.211.3 = fmul double %multiply.210.5, %98
  %add.86.1 = fadd double %add.84.1.clone.1, %multiply.211.3
  store double %add.86.1, ptr addrspace(1) %arg1948, align 128
  store double %divide.87.1.clone.1, ptr addrspace(1) %arg2050, align 128
  store double %divide.86.1.clone.1, ptr addrspace(1) %arg2152, align 128
  store double %add.84.1.clone.1, ptr addrspace(1) %arg2254, align 128
  store double %add.83.1.clone.1, ptr addrspace(1) %arg2356, align 128
  store double %subtract.26.1, ptr addrspace(1) %arg2458, align 128
  store double %multiply.199.1.clone.1, ptr addrspace(1) %arg2560, align 128
  store double %add.81.1.clone.1, ptr addrspace(1) %arg2662, align 128
  store double %divide.80.1.clone.1, ptr addrspace(1) %arg2764, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg25, align 16, !invariant.load !25
  %1 = load double, ptr addrspace(1) %arg13, align 16, !invariant.load !25
  %2 = tail call double @llvm.fma.f64(double %1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #4
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #4
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %1)
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
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #4
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #4
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #4
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %1) #4
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #4
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %1, 0.000000e+00
  %28 = fadd double %1, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #4
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #4
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.206.5 = fmul double %0, %z.2.i
  %compare.33.2 = fcmp ogt double %multiply.206.5, 1.000000e-128
  %40 = select i1 %compare.33.2, double %multiply.206.5, double 0x7FF8000000000000
  %41 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !25
  %multiply.212.1 = fmul double %41, %40
  store double %multiply.212.1, ptr addrspace(1) %arg37, align 128
  store double %multiply.212.1, ptr addrspace(1) %arg49, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #0 {
entry:
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg26, align 16, !invariant.load !25
  %1 = load double, ptr addrspace(1) %arg02, align 16, !invariant.load !25
  %2 = load double, ptr addrspace(1) %arg14, align 16, !invariant.load !25
  %3 = tail call double @llvm.fma.f64(double %2, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #4
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #4
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
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #4
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #4
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #4
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %2) #4
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #4
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
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #4
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #4
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.77.1 = fdiv double 1.000000e+00, %0
  %multiply.178.1 = fmul double %1, %z.2.i
  %add.74.1 = fadd double %divide.77.1, %multiply.178.1
  %divide.78.1 = fdiv double 1.000000e+00, %add.74.1
  store double %divide.78.1, ptr addrspace(1) %arg38, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !25
  %1 = load double, ptr addrspace(1) %arg410, align 16, !invariant.load !25
  %2 = load double, ptr addrspace(1) %arg38, align 128, !invariant.load !25
  %multiply.179.5 = fmul double %1, %2
  %multiply.180.3 = fmul double %multiply.179.5, %multiply.179.5
  %multiply.181.3 = fmul double %multiply.180.3, 5.000000e-01
  %3 = load double, ptr addrspace(1) %arg26, align 128, !invariant.load !25
  %multiply.182.3 = fmul double %3, %multiply.180.3
  %add.75.3 = fadd double %multiply.181.3, %multiply.182.3
  %multiply.183.15 = fmul double %1, %1
  %multiply.184.13 = fmul double %multiply.183.15, 5.000000e-01
  %multiply.185.11 = fmul double %2, %multiply.184.13
  %multiply.186.9 = fmul double %3, %multiply.185.11
  %subtract.23.7 = fsub double %add.75.3, %multiply.186.9
  %4 = load i64, ptr addrspace(1) %arg14, align 16, !invariant.load !25
  %5 = sitofp i64 %4 to double
  %multiply.187.5 = fmul double %subtract.23.7, %5
  %add.76.3 = fadd double %0, %multiply.187.5
  %compare.30.1 = fcmp ogt double %add.76.3, 1.000000e-128
  %6 = select i1 %compare.30.1, double %add.76.3, double 0x7FF8000000000000
  store double %6, ptr addrspace(1) %arg512, align 128
  ret void
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
declare double @llvm.fma.f64(double, double, double) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}
!nvvmir.version = !{!23}
!llvm.module.flags = !{!24}

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
!22 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!23 = !{i32 2, i32 0}
!24 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!25 = !{}
!26 = !{i32 0, i32 3}
