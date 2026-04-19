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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  br i1 %3, label %loop_divide_multiply_fusion.in_bounds-true, label %loop_divide_multiply_fusion.in_bounds-after

loop_divide_multiply_fusion.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

loop_divide_multiply_fusion.in_bounds-true:       ; preds = %entry
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !7
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
  %add.1.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.1.1.clone.1 = fdiv double 1.000000e+00, %add.1.1.clone.1
  %subtract.1.1 = fsub double 1.000000e+00, %divide.1.1.clone.1
  %multiply.1.1 = fmul double %divide.1.1.clone.1, %subtract.1.1
  %46 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  store double %multiply.1.1, ptr addrspace(1) %46, align 8
  %47 = getelementptr double, ptr addrspace(1) %arg25, i64 %4
  store double %divide.1.1.clone.1, ptr addrspace(1) %47, align 8
  br label %loop_divide_multiply_fusion.in_bounds-after
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
!5 = !{i32 0, i32 4}
!6 = !{i32 0, i32 1024}
!7 = !{}
