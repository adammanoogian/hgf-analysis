; ModuleID = 'jit_sigmoid'
source_filename = "jit_sigmoid"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !6
  %4 = fneg double %3
  %5 = tail call double @llvm.fma.f64(double %4, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #3
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #3
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
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #3
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #3
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #3
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %4) #3
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #3
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp ogt double %3, 0.000000e+00
  %31 = fsub double 0x7FF0000000000000, %3
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #3
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #3
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.1.3.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.1.1.clone.1 = fdiv double 1.000000e+00, %add.1.3.clone.1
  %subtract.1.1 = fsub double 1.000000e+00, %divide.1.1.clone.1
  %multiply.1.1 = fmul double %divide.1.1.clone.1, %subtract.1.1
  %43 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %multiply.1.1, ptr addrspace(1) %43, align 8
  %44 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  store double %divide.1.1.clone.1, ptr addrspace(1) %44, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

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

!nvvm.annotations = !{!0, !1}
!llvm.ident = !{!2}
!nvvmir.version = !{!3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_divide_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 768}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 768}
!6 = !{}
