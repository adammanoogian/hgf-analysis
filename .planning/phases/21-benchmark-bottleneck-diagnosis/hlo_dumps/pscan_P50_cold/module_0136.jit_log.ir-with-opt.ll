; ModuleID = 'jit_log'
source_filename = "jit_log"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_log(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 16, !invariant.load !5
  %1 = tail call i32 @llvm.nvvm.d2i.hi(double %0) #4
  %2 = tail call i32 @llvm.nvvm.d2i.lo(double %0) #4
  %3 = icmp slt i32 %1, 1048576
  %4 = fmul double %0, 0x4350000000000000
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #4
  %6 = tail call i32 @llvm.nvvm.d2i.hi(double %4) #4
  br i1 %3, label %7, label %8

7:                                                ; preds = %entry
  br label %8

8:                                                ; preds = %7, %entry
  %.0.i = phi double [ %4, %7 ], [ %0, %entry ]
  %ihi.0.i = phi i32 [ %6, %7 ], [ %1, %entry ]
  %ilo.0.i = phi i32 [ %5, %7 ], [ %2, %entry ]
  %e.0.i = phi i32 [ -1077, %7 ], [ -1023, %entry ]
  %9 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %9, 2146435071
  br i1 %or.cond.i, label %10, label %57

10:                                               ; preds = %8
  %11 = lshr i32 %ihi.0.i, 20
  %12 = add nsw i32 %e.0.i, %11
  %13 = and i32 %ihi.0.i, 1048575
  %14 = or disjoint i32 %13, 1072693248
  %15 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %14) #4
  %16 = icmp ugt i32 %14, 1073127582
  %17 = tail call i32 @llvm.nvvm.d2i.lo(double %15) #4
  %18 = tail call i32 @llvm.nvvm.d2i.hi(double %15) #4
  %19 = add i32 %18, -1048576
  %20 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %19) #4
  %spec.select = select i1 %16, double %20, double %15
  %21 = zext i1 %16 to i32
  %spec.select1 = add nsw i32 %12, %21
  %22 = fadd double %spec.select, -1.000000e+00
  %23 = fadd double %spec.select, 1.000000e+00
  %24 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %23) #4
  %25 = fneg double %23
  %26 = tail call double @llvm.fma.f64(double %25, double %24, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %26, double %26)
  %28 = tail call double @llvm.fma.f64(double %27, double %24, double %24)
  %29 = fmul double %22, %28
  %30 = fadd double %29, %29
  %31 = fmul double %30, %30
  %32 = tail call double @llvm.fma.f64(double %31, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %33 = tail call double @llvm.fma.f64(double %32, double %31, double 0x3EF3B2669F02676F)
  %34 = tail call double @llvm.fma.f64(double %33, double %31, double 0x3F1745CBA9AB0956)
  %35 = tail call double @llvm.fma.f64(double %34, double %31, double 0x3F3C71C72D1B5154)
  %36 = tail call double @llvm.fma.f64(double %35, double %31, double 0x3F624924923BE72D)
  %37 = tail call double @llvm.fma.f64(double %36, double %31, double 0x3F8999999999A3C4)
  %38 = tail call double @llvm.fma.f64(double %37, double %31, double 0x3FB5555555555554)
  %39 = fsub double %22, %30
  %40 = fmul double %39, 2.000000e+00
  %41 = fneg double %30
  %42 = tail call double @llvm.fma.f64(double %41, double %22, double %40)
  %43 = fmul double %28, %42
  %44 = fmul double %31, %38
  %45 = tail call double @llvm.fma.f64(double %44, double %30, double %43)
  %46 = xor i32 %spec.select1, -2147483648
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 %46, i32 1127219200) #4
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #4
  %49 = fsub double %47, %48
  %50 = tail call double @llvm.fma.f64(double %49, double 0x3FE62E42FEFA39EF, double %30)
  %51 = fneg double %49
  %52 = tail call double @llvm.fma.f64(double %51, double 0x3FE62E42FEFA39EF, double %50)
  %53 = fsub double %52, %30
  %54 = fsub double %45, %53
  %55 = tail call double @llvm.fma.f64(double %49, double 0x3C7ABC9E3B39803F, double %54)
  %56 = fadd double %50, %55
  br label %__nv_log.exit

57:                                               ; preds = %8
  %58 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %59 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #4
  %60 = and i32 %59, 2147483647
  %61 = icmp eq i32 %60, 0
  %q.0.i = select i1 %61, double 0xFFF0000000000000, double %58
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %10, %57
  %q.1.i = phi double [ %56, %10 ], [ %q.0.i, %57 ]
  store double %q.1.i, ptr addrspace(1) %arg14, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.hi(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.lo(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.lohi.i2d(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare double @llvm.nvvm.rcp.approx.ftz.d(double) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!nvvm.annotations = !{!0, !1}
!llvm.ident = !{!2}
!nvvmir.version = !{!3}
!llvm.module.flags = !{!4}

!0 = !{ptr @wrapped_log, !"kernel", i32 1}
!1 = !{ptr @wrapped_log, !"reqntidx", i32 1}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{}
