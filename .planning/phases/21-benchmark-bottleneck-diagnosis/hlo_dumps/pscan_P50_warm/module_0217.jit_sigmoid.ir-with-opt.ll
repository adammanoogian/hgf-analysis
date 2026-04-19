; ModuleID = 'jit_sigmoid'
source_filename = "jit_sigmoid"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !7
  %6 = fneg double %5
  %7 = tail call double @llvm.fma.f64(double %6, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %8 = tail call i32 @llvm.nvvm.d2i.lo(double %7) #3
  %9 = tail call double @llvm.nvvm.add.rn.d(double %7, double 0xC338000000000000) #3
  %10 = tail call double @llvm.fma.f64(double %9, double 0xBFE62E42FEFA39EF, double %6)
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
  %23 = tail call i32 @llvm.nvvm.d2i.lo(double %22) #3
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %22) #3
  %25 = shl i32 %8, 20
  %26 = add i32 %24, %25
  %27 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %26) #3
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %6) #3
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.fabs.f(float %29) #3
  %31 = fcmp olt float %30, 0x4010C46560000000
  br i1 %31, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %32 = fcmp ogt double %5, 0.000000e+00
  %33 = fsub double 0x7FF0000000000000, %5
  %z.0.i = select i1 %32, double 0.000000e+00, double %33
  %34 = fcmp olt float %30, 0x4010E90000000000
  br i1 %34, label %35, label %__nv_exp.exit

35:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %36 = sdiv i32 %8, 2
  %37 = shl i32 %36, 20
  %38 = add i32 %24, %37
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %38) #3
  %40 = sub nsw i32 %8, %36
  %41 = shl i32 %40, 20
  %42 = add nsw i32 %41, 1072693248
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %42) #3
  %44 = fmul double %43, %39
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %35
  %z.2.i = phi double [ %27, %entry ], [ %44, %35 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.1.3.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.1.1.clone.1 = fdiv double 1.000000e+00, %add.1.3.clone.1
  %subtract.1.1 = fsub double 1.000000e+00, %divide.1.1.clone.1
  %multiply.1.1 = fmul double %divide.1.1.clone.1, %subtract.1.1
  %45 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  store double %multiply.1.1, ptr addrspace(1) %45, align 8
  %46 = getelementptr double, ptr addrspace(1) %arg25, i64 %3
  store double %divide.1.1.clone.1, ptr addrspace(1) %46, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

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
!1 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 1024}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 9}
!6 = !{i32 0, i32 1024}
!7 = !{}
