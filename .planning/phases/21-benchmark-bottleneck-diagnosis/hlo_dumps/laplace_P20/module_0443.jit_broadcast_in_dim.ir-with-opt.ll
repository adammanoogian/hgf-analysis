; ModuleID = 'jit_broadcast_in_dim'
source_filename = "jit_broadcast_in_dim"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %4 = urem i32 %linear_index_base, 3840
  %5 = zext nneg i32 %4 to i64
  %6 = getelementptr inbounds double, ptr addrspace(1) %arg01, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 16, !invariant.load !5
  %8 = zext nneg i32 %linear_index_base to i64
  %9 = getelementptr double, ptr addrspace(1) %arg13, i64 %8
  %10 = urem i32 %linear_index1, 3840
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds double, ptr addrspace(1) %arg01, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !5
  %14 = insertelement <2 x double> poison, double %7, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  store <2 x double> %15, ptr addrspace(1) %9, align 32
  %16 = urem i32 %linear_index2, 3840
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds double, ptr addrspace(1) %arg01, i64 %17
  %19 = load double, ptr addrspace(1) %18, align 16, !invariant.load !5
  %20 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 16
  %21 = urem i32 %linear_index3, 3840
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds double, ptr addrspace(1) %arg01, i64 %22
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !5
  %25 = insertelement <2 x double> poison, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  store <2 x double> %26, ptr addrspace(1) %20, align 16
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

!0 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 900}
!4 = !{i32 0, i32 128}
!5 = !{}
