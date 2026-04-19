; ModuleID = 'jit_exp'
source_filename = "jit_exp"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_exponential(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !6
  %4 = tail call double @llvm.fma.f64(double %3, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #3
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #3
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %3)
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
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #3
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #3
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #3
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %3) #3
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #3
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %3, 0.000000e+00
  %30 = fadd double %3, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #3
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #3
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %z.2.i, ptr addrspace(1) %42, align 8
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

!0 = !{ptr @wrapped_exponential, !"kernel", i32 1}
!1 = !{ptr @wrapped_exponential, !"reqntidx", i32 4}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 4}
!6 = !{}
