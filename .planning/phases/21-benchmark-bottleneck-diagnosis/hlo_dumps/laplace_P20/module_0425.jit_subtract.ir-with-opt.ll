; ModuleID = 'jit_subtract'
source_filename = "jit_subtract"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_subtract_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #0 {
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
  %6 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_subtract_fusion.in_bounds-true, label %loop_subtract_fusion.in_bounds-after

loop_subtract_fusion.in_bounds-after:             ; preds = %loop_subtract_fusion.in_bounds-true, %entry
  ret void

loop_subtract_fusion.in_bounds-true:              ; preds = %entry
  %7 = load double, ptr addrspace(1) %arg13, align 16, !invariant.load !7
  %8 = load double, ptr addrspace(1) %6, align 8, !invariant.load !7
  %subtract.1.1 = fsub double %7, %8
  store double %subtract.1.1, ptr addrspace(1) %5, align 8
  br label %loop_subtract_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_negate(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  %6 = load <2 x double>, ptr addrspace(1) %5, align 16, !invariant.load !7
  %7 = extractelement <2 x double> %6, i32 0
  %8 = extractelement <2 x double> %6, i32 1
  %9 = fneg double %7
  %10 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  %11 = fneg double %8
  %12 = insertelement <2 x double> poison, double %9, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  store <2 x double> %13, ptr addrspace(1) %10, align 32
  %14 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 16
  %15 = load <2 x double>, ptr addrspace(1) %14, align 16, !invariant.load !7
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  %18 = fneg double %16
  %19 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 16
  %20 = fneg double %17
  %21 = insertelement <2 x double> poison, double %18, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  store <2 x double> %22, ptr addrspace(1) %19, align 16
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 1024}
!2 = !{ptr @wrapped_negate, !"kernel", i32 1}
!3 = !{ptr @wrapped_negate, !"reqntidx", i32 256}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 4}
!6 = !{i32 0, i32 1024}
!7 = !{}
!8 = !{i32 0, i32 256}
!9 = !{i32 0, i32 450}
