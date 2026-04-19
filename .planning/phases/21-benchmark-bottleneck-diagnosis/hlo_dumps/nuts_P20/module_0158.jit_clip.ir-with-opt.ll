; ModuleID = 'jit_clip'
source_filename = "jit_clip"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_minimum_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  br i1 %3, label %loop_divide_minimum_fusion.in_bounds-true, label %loop_divide_minimum_fusion.in_bounds-after

loop_divide_minimum_fusion.in_bounds-after:       ; preds = %loop_divide_minimum_fusion.in_bounds-true, %entry
  ret void

loop_divide_minimum_fusion.in_bounds-true:        ; preds = %entry
  %4 = load double, ptr addrspace(1) %arg25, align 16, !invariant.load !5
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr double, ptr addrspace(1) %arg13, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !5
  %8 = fcmp uno double %4, 0.000000e+00
  %9 = fcmp oge double %4, %7
  %10 = or i1 %8, %9
  %maximum.1.3 = select i1 %10, double %4, double %7
  %11 = load double, ptr addrspace(1) %arg01, align 16, !invariant.load !5
  %12 = fcmp uno double %11, 0.000000e+00
  %13 = fcmp ole double %11, %maximum.1.3
  %14 = or i1 %12, %13
  %minimum.1.1.clone.1 = select i1 %14, double %11, double %maximum.1.3
  %compare.6.1 = fcmp oeq double %maximum.1.3, %minimum.1.1.clone.1
  %15 = select i1 %compare.6.1, double 1.000000e+00, double 0.000000e+00
  %compare.7.1 = fcmp oeq double %11, %minimum.1.1.clone.1
  %16 = select i1 %compare.7.1, double 2.000000e+00, double 1.000000e+00
  %divide.3.1 = fdiv double %15, %16
  %compare.4.1.clone.1 = fcmp oeq double %7, %maximum.1.3
  %17 = select i1 %compare.4.1.clone.1, double 1.000000e+00, double 0.000000e+00
  %compare.5.1.clone.1 = fcmp oeq double %4, %maximum.1.3
  %18 = select i1 %compare.5.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.2.1.clone.1 = fdiv double %17, %18
  %19 = getelementptr double, ptr addrspace(1) %arg37, i64 %5
  store double %divide.3.1, ptr addrspace(1) %19, align 8
  %20 = getelementptr double, ptr addrspace(1) %arg49, i64 %5
  store double %minimum.1.1.clone.1, ptr addrspace(1) %20, align 8
  %21 = getelementptr double, ptr addrspace(1) %arg511, i64 %5
  store double %divide.2.1.clone.1, ptr addrspace(1) %21, align 8
  br label %loop_divide_minimum_fusion.in_bounds-after
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
!3 = !{i32 0, i32 4}
!4 = !{i32 0, i32 1024}
!5 = !{}
