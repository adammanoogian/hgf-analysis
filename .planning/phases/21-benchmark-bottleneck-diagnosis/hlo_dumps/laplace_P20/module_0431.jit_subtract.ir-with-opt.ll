; ModuleID = 'jit_subtract'
source_filename = "jit_subtract"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_subtract(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %4
  %6 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  %7 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %wrapped_subtract.in_bounds-true, label %wrapped_subtract.in_bounds-after

wrapped_subtract.in_bounds-after:                 ; preds = %wrapped_subtract.in_bounds-true, %entry
  ret void

wrapped_subtract.in_bounds-true:                  ; preds = %entry
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !7
  %9 = load double, ptr addrspace(1) %6, align 8, !invariant.load !7
  %subtract.2.1 = fsub double %8, %9
  store double %subtract.2.1, ptr addrspace(1) %5, align 8
  br label %wrapped_subtract.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_subtract_1(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg2) local_unnamed_addr #0 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr double, ptr addrspace(1) %arg04, i64 %4
  %6 = load <2 x double>, ptr addrspace(1) %5, align 16, !invariant.load !7
  %7 = extractelement <2 x double> %6, i32 0
  %8 = extractelement <2 x double> %6, i32 1
  %9 = getelementptr double, ptr addrspace(1) %arg16, i64 %4
  %10 = load <2 x double>, ptr addrspace(1) %9, align 16, !invariant.load !7
  %11 = extractelement <2 x double> %10, i32 0
  %12 = extractelement <2 x double> %10, i32 1
  %subtract.3.1 = fsub double %7, %11
  %13 = getelementptr double, ptr addrspace(1) %arg28, i64 %4
  %subtract.3.11 = fsub double %8, %12
  %14 = insertelement <2 x double> poison, double %subtract.3.1, i32 0
  %15 = insertelement <2 x double> %14, double %subtract.3.11, i32 1
  store <2 x double> %15, ptr addrspace(1) %13, align 32
  %16 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 16
  %17 = load <2 x double>, ptr addrspace(1) %16, align 16, !invariant.load !7
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %20 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 16
  %21 = load <2 x double>, ptr addrspace(1) %20, align 16, !invariant.load !7
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  %subtract.3.12 = fsub double %18, %22
  %24 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 16
  %subtract.3.13 = fsub double %19, %23
  %25 = insertelement <2 x double> poison, double %subtract.3.12, i32 0
  %26 = insertelement <2 x double> %25, double %subtract.3.13, i32 1
  store <2 x double> %26, ptr addrspace(1) %24, align 16
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @wrapped_subtract, !"kernel", i32 1}
!1 = !{ptr @wrapped_subtract, !"reqntidx", i32 1024}
!2 = !{ptr @wrapped_subtract_1, !"kernel", i32 1}
!3 = !{ptr @wrapped_subtract_1, !"reqntidx", i32 256}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 4}
!6 = !{i32 0, i32 1024}
!7 = !{}
!8 = !{i32 0, i32 256}
!9 = !{i32 0, i32 450}
