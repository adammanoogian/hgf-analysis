; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_add(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg2) local_unnamed_addr #0 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr double, ptr addrspace(1) %arg04, i64 %4
  %6 = load <2 x double>, ptr addrspace(1) %5, align 16, !invariant.load !5
  %7 = extractelement <2 x double> %6, i32 0
  %8 = extractelement <2 x double> %6, i32 1
  %9 = getelementptr double, ptr addrspace(1) %arg16, i64 %4
  %10 = load <2 x double>, ptr addrspace(1) %9, align 16, !invariant.load !5
  %11 = extractelement <2 x double> %10, i32 0
  %12 = extractelement <2 x double> %10, i32 1
  %add.1.1 = fadd double %7, %11
  %13 = getelementptr double, ptr addrspace(1) %arg28, i64 %4
  %add.1.11 = fadd double %8, %12
  %14 = insertelement <2 x double> poison, double %add.1.1, i32 0
  %15 = insertelement <2 x double> %14, double %add.1.11, i32 1
  store <2 x double> %15, ptr addrspace(1) %13, align 32
  %16 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 16
  %17 = load <2 x double>, ptr addrspace(1) %16, align 16, !invariant.load !5
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %20 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 16
  %21 = load <2 x double>, ptr addrspace(1) %20, align 16, !invariant.load !5
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  %add.1.12 = fadd double %18, %22
  %24 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 16
  %add.1.13 = fadd double %19, %23
  %25 = insertelement <2 x double> poison, double %add.1.12, i32 0
  %26 = insertelement <2 x double> %25, double %add.1.13, i32 1
  store <2 x double> %26, ptr addrspace(1) %24, align 16
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

!0 = !{ptr @wrapped_add, !"kernel", i32 1}
!1 = !{ptr @wrapped_add, !"reqntidx", i32 256}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 256}
!4 = !{i32 0, i32 450}
!5 = !{}
