; ModuleID = 'jit_clip'
source_filename = "jit_clip"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_minimum_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %linear_index = or disjoint i32 %1, %2
  %3 = load double, ptr addrspace(1) %arg25, align 16, !invariant.load !5
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !5
  %7 = fcmp uno double %3, 0.000000e+00
  %8 = fcmp oge double %3, %6
  %9 = or i1 %7, %8
  %maximum.1.3 = select i1 %9, double %3, double %6
  %10 = load double, ptr addrspace(1) %arg01, align 16, !invariant.load !5
  %11 = fcmp uno double %10, 0.000000e+00
  %12 = fcmp ole double %10, %maximum.1.3
  %13 = or i1 %11, %12
  %minimum.1.1.clone.1 = select i1 %13, double %10, double %maximum.1.3
  %compare.6.1 = fcmp oeq double %maximum.1.3, %minimum.1.1.clone.1
  %14 = select i1 %compare.6.1, double 1.000000e+00, double 0.000000e+00
  %compare.7.1 = fcmp oeq double %10, %minimum.1.1.clone.1
  %15 = select i1 %compare.7.1, double 2.000000e+00, double 1.000000e+00
  %divide.3.1 = fdiv double %14, %15
  %compare.4.1.clone.1 = fcmp oeq double %6, %maximum.1.3
  %16 = select i1 %compare.4.1.clone.1, double 1.000000e+00, double 0.000000e+00
  %compare.5.1.clone.1 = fcmp oeq double %3, %maximum.1.3
  %17 = select i1 %compare.5.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.2.1.clone.1 = fdiv double %16, %17
  %18 = getelementptr double, ptr addrspace(1) %arg37, i64 %4
  store double %divide.3.1, ptr addrspace(1) %18, align 8
  %19 = getelementptr double, ptr addrspace(1) %arg49, i64 %4
  store double %minimum.1.1.clone.1, ptr addrspace(1) %19, align 8
  %20 = getelementptr double, ptr addrspace(1) %arg511, i64 %4
  store double %divide.2.1.clone.1, ptr addrspace(1) %20, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @loop_divide_minimum_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_divide_minimum_fusion, !"reqntidx", i32 1024}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 9}
!4 = !{i32 0, i32 1024}
!5 = !{}
