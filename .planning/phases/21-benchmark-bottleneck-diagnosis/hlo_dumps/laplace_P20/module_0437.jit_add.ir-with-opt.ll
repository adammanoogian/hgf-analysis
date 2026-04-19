; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !7
  %7 = zext nneg i16 %3 to i64
  %8 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg13, i64 0, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !7
  %add.2.1 = fadd double %6, %9
  %10 = getelementptr double, ptr addrspace(1) %arg25, i64 %4
  store double %add.2.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg2) local_unnamed_addr #0 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %4 = udiv i32 %linear_index_base, 192
  %5 = zext nneg i32 %linear_index_base to i64
  %6 = getelementptr double, ptr addrspace(1) %arg04, i64 %5
  %7 = load <2 x double>, ptr addrspace(1) %6, align 16, !invariant.load !7
  %8 = extractelement <2 x double> %7, i32 0
  %9 = extractelement <2 x double> %7, i32 1
  %10 = zext nneg i32 %4 to i64
  %11 = getelementptr inbounds double, ptr addrspace(1) %arg16, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !7
  %add.3.1 = fadd double %8, %12
  %13 = getelementptr double, ptr addrspace(1) %arg28, i64 %5
  %add.3.11 = fadd double %12, %9
  %14 = insertelement <2 x double> poison, double %add.3.1, i32 0
  %15 = insertelement <2 x double> %14, double %add.3.11, i32 1
  store <2 x double> %15, ptr addrspace(1) %13, align 32
  %16 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 16
  %17 = load <2 x double>, ptr addrspace(1) %16, align 16, !invariant.load !7
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %add.3.12 = fadd double %12, %18
  %20 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 16
  %add.3.13 = fadd double %12, %19
  %21 = insertelement <2 x double> poison, double %add.3.12, i32 0
  %22 = insertelement <2 x double> %21, double %add.3.13, i32 1
  store <2 x double> %22, ptr addrspace(1) %20, align 16
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!1 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 128}
!2 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 30}
!6 = !{i32 0, i32 128}
!7 = !{}
!8 = !{i32 0, i32 900}
