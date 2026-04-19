; ModuleID = 'jit_sigmoid'
source_filename = "jit_sigmoid"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  br i1 %3, label %loop_divide_multiply_fusion.in_bounds-true, label %loop_divide_multiply_fusion.in_bounds-after

loop_divide_multiply_fusion.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

loop_divide_multiply_fusion.in_bounds-true:       ; preds = %entry
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !9
  %7 = fneg double %6
  %8 = tail call double @llvm.fma.f64(double %7, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #3
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #3
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %7)
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
  %24 = tail call i32 @llvm.nvvm.d2i.lo(double %23) #3
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %23) #3
  %26 = shl i32 %9, 20
  %27 = add i32 %25, %26
  %28 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %27) #3
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %7) #3
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #3
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %loop_divide_multiply_fusion.in_bounds-true
  %33 = fcmp ogt double %6, 0.000000e+00
  %34 = fsub double 0x7FF0000000000000, %6
  %z.0.i = select i1 %33, double 0.000000e+00, double %34
  %35 = fcmp olt float %31, 0x4010E90000000000
  br i1 %35, label %36, label %__nv_exp.exit

36:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %37 = sdiv i32 %9, 2
  %38 = shl i32 %37, 20
  %39 = add i32 %25, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %39) #3
  %41 = sub nsw i32 %9, %37
  %42 = shl i32 %41, 20
  %43 = add nsw i32 %42, 1072693248
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %43) #3
  %45 = fmul double %44, %40
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %loop_divide_multiply_fusion.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %36
  %z.2.i = phi double [ %28, %loop_divide_multiply_fusion.in_bounds-true ], [ %45, %36 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.2.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.1.1.clone.1 = fdiv double 1.000000e+00, %add.2.1.clone.1
  %subtract.1.2 = fsub double 1.000000e+00, %divide.1.1.clone.1
  %multiply.4.1 = fmul double %divide.1.1.clone.1, %subtract.1.2
  %46 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  store double %multiply.4.1, ptr addrspace(1) %46, align 8
  %47 = getelementptr double, ptr addrspace(1) %arg25, i64 %4
  store double %divide.1.1.clone.1, ptr addrspace(1) %47, align 8
  br label %loop_divide_multiply_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg4) local_unnamed_addr #0 {
entry:
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr double, ptr addrspace(1) %arg121, i64 %4
  %6 = load <2 x double>, ptr addrspace(1) %5, align 16, !invariant.load !9
  %7 = extractelement <2 x double> %6, i32 0
  %8 = extractelement <2 x double> %6, i32 1
  %9 = urem i32 %linear_index_base, 3840
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds double, ptr addrspace(1) %arg223, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 32, !invariant.load !9
  %multiply.5.1.clone.1 = fmul double %7, %12
  %13 = getelementptr inbounds double, ptr addrspace(1) %arg019, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 32, !invariant.load !9
  %subtract.1.1 = fsub double 1.000000e+00, %14
  %multiply.6.1 = fmul double %multiply.5.1.clone.1, %subtract.1.1
  %15 = fmul double %multiply.5.1.clone.1, %14
  %add.3.1 = fsub double %multiply.6.1, %15
  %16 = getelementptr double, ptr addrspace(1) %arg325, i64 %4
  %17 = getelementptr double, ptr addrspace(1) %arg427, i64 %4
  %18 = urem i32 %linear_index1, 3840
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds double, ptr addrspace(1) %arg223, i64 %19
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !9
  %multiply.5.1.clone.11 = fmul double %8, %21
  %22 = getelementptr inbounds double, ptr addrspace(1) %arg019, i64 %19
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !9
  %subtract.1.13 = fsub double 1.000000e+00, %23
  %multiply.6.14 = fmul double %multiply.5.1.clone.11, %subtract.1.13
  %24 = fmul double %multiply.5.1.clone.11, %23
  %add.3.16 = fsub double %multiply.6.14, %24
  %25 = insertelement <2 x double> poison, double %add.3.1, i32 0
  %26 = insertelement <2 x double> %25, double %add.3.16, i32 1
  store <2 x double> %26, ptr addrspace(1) %16, align 32
  %27 = insertelement <2 x double> poison, double %multiply.5.1.clone.1, i32 0
  %28 = insertelement <2 x double> %27, double %multiply.5.1.clone.11, i32 1
  store <2 x double> %28, ptr addrspace(1) %17, align 32
  %29 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 16
  %30 = load <2 x double>, ptr addrspace(1) %29, align 16, !invariant.load !9
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = urem i32 %linear_index2, 3840
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr inbounds double, ptr addrspace(1) %arg223, i64 %34
  %36 = load double, ptr addrspace(1) %35, align 16, !invariant.load !9
  %multiply.5.1.clone.17 = fmul double %31, %36
  %37 = getelementptr inbounds double, ptr addrspace(1) %arg019, i64 %34
  %38 = load double, ptr addrspace(1) %37, align 16, !invariant.load !9
  %subtract.1.19 = fsub double 1.000000e+00, %38
  %multiply.6.110 = fmul double %multiply.5.1.clone.17, %subtract.1.19
  %39 = fmul double %multiply.5.1.clone.17, %38
  %add.3.112 = fsub double %multiply.6.110, %39
  %40 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 16
  %41 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 16
  %42 = urem i32 %linear_index3, 3840
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds double, ptr addrspace(1) %arg223, i64 %43
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !9
  %multiply.5.1.clone.113 = fmul double %32, %45
  %46 = getelementptr inbounds double, ptr addrspace(1) %arg019, i64 %43
  %47 = load double, ptr addrspace(1) %46, align 8, !invariant.load !9
  %subtract.1.115 = fsub double 1.000000e+00, %47
  %multiply.6.116 = fmul double %multiply.5.1.clone.113, %subtract.1.115
  %48 = fmul double %multiply.5.1.clone.113, %47
  %add.3.118 = fsub double %multiply.6.116, %48
  %49 = insertelement <2 x double> poison, double %add.3.112, i32 0
  %50 = insertelement <2 x double> %49, double %add.3.118, i32 1
  store <2 x double> %50, ptr addrspace(1) %40, align 16
  %51 = insertelement <2 x double> poison, double %multiply.5.1.clone.17, i32 0
  %52 = insertelement <2 x double> %51, double %multiply.5.1.clone.113, i32 1
  store <2 x double> %52, ptr addrspace(1) %41, align 16
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
declare double @llvm.fma.f64(double, double, double) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.ident = !{!4}
!nvvmir.version = !{!5}
!llvm.module.flags = !{!6}

!0 = !{ptr @loop_divide_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 1024}
!2 = !{ptr @loop_add_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_multiply_fusion, !"reqntidx", i32 128}
!4 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!5 = !{i32 2, i32 0}
!6 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!7 = !{i32 0, i32 4}
!8 = !{i32 0, i32 1024}
!9 = !{}
!10 = !{i32 0, i32 900}
!11 = !{i32 0, i32 128}
