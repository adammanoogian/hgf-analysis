; ModuleID = 'jit_exp'
source_filename = "jit_exp"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_exponential(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg01, align 16, !invariant.load !5
  %1 = tail call double @llvm.fma.f64(double %0, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %2 = tail call i32 @llvm.nvvm.d2i.lo(double %1) #3
  %3 = tail call double @llvm.nvvm.add.rn.d(double %1, double 0xC338000000000000) #3
  %4 = tail call double @llvm.fma.f64(double %3, double 0xBFE62E42FEFA39EF, double %0)
  %5 = tail call double @llvm.fma.f64(double %3, double 0xBC7ABC9E3B39803F, double %4)
  %6 = tail call double @llvm.fma.f64(double %5, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %7 = tail call double @llvm.fma.f64(double %6, double %5, double 0x3EC71DEE62401315)
  %8 = tail call double @llvm.fma.f64(double %7, double %5, double 0x3EFA01997C89EB71)
  %9 = tail call double @llvm.fma.f64(double %8, double %5, double 0x3F2A01A014761F65)
  %10 = tail call double @llvm.fma.f64(double %9, double %5, double 0x3F56C16C1852B7AF)
  %11 = tail call double @llvm.fma.f64(double %10, double %5, double 0x3F81111111122322)
  %12 = tail call double @llvm.fma.f64(double %11, double %5, double 0x3FA55555555502A1)
  %13 = tail call double @llvm.fma.f64(double %12, double %5, double 0x3FC5555555555511)
  %14 = tail call double @llvm.fma.f64(double %13, double %5, double 0x3FE000000000000B)
  %15 = tail call double @llvm.fma.f64(double %14, double %5, double 1.000000e+00)
  %16 = tail call double @llvm.fma.f64(double %15, double %5, double 1.000000e+00)
  %17 = tail call i32 @llvm.nvvm.d2i.lo(double %16) #3
  %18 = tail call i32 @llvm.nvvm.d2i.hi(double %16) #3
  %19 = shl i32 %2, 20
  %20 = add i32 %18, %19
  %21 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %20) #3
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %0) #3
  %23 = bitcast i32 %22 to float
  %24 = tail call float @llvm.nvvm.fabs.f(float %23) #3
  %25 = fcmp olt float %24, 0x4010C46560000000
  br i1 %25, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %26 = fcmp olt double %0, 0.000000e+00
  %27 = fadd double %0, 0x7FF0000000000000
  %z.0.i = select i1 %26, double 0.000000e+00, double %27
  %28 = fcmp olt float %24, 0x4010E90000000000
  br i1 %28, label %29, label %__nv_exp.exit

29:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %30 = sdiv i32 %2, 2
  %31 = shl i32 %30, 20
  %32 = add i32 %18, %31
  %33 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %32) #3
  %34 = sub nsw i32 %2, %30
  %35 = shl i32 %34, 20
  %36 = add nsw i32 %35, 1072693248
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %36) #3
  %38 = fmul double %37, %33
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %29
  %z.2.i = phi double [ %21, %entry ], [ %38, %29 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  store double %z.2.i, ptr addrspace(1) %arg13, align 128
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

!nvvm.annotations = !{!0, !1}
!llvm.ident = !{!2}
!nvvmir.version = !{!3}
!llvm.module.flags = !{!4}

!0 = !{ptr @wrapped_exponential, !"kernel", i32 1}
!1 = !{ptr @wrapped_exponential, !"reqntidx", i32 1}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{}
