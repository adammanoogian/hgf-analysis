; ModuleID = 'jit__where'
source_filename = "jit__where"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  br i1 %3, label %loop_select_fusion.1.in_bounds-true, label %loop_select_fusion.1.in_bounds-after

loop_select_fusion.1.in_bounds-after:             ; preds = %loop_select_fusion.1.in_bounds-true, %entry
  ret void

loop_select_fusion.1.in_bounds-true:              ; preds = %entry
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr i8, ptr addrspace(1) %arg01, i64 %4
  %6 = load i8, ptr addrspace(1) %5, align 1, !invariant.load !9
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !9
  %9 = load double, ptr addrspace(1) %arg25, align 16, !invariant.load !9
  %10 = trunc i8 %6 to i1
  %11 = select i1 %10, double %8, double %9
  %12 = getelementptr double, ptr addrspace(1) %arg37, i64 %4
  store double %11, ptr addrspace(1) %12, align 8
  br label %loop_select_fusion.1.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg2) local_unnamed_addr #0 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %4 = urem i32 %linear_index_base, 3840
  %5 = zext nneg i32 %4 to i64
  %6 = getelementptr inbounds i8, ptr addrspace(1) %arg16, i64 %5
  %7 = load i8, ptr addrspace(1) %6, align 4, !invariant.load !9
  %8 = zext nneg i32 %linear_index_base to i64
  %9 = getelementptr double, ptr addrspace(1) %arg04, i64 %8
  %10 = load <2 x double>, ptr addrspace(1) %9, align 16, !invariant.load !9
  %11 = extractelement <2 x double> %10, i32 0
  %12 = extractelement <2 x double> %10, i32 1
  %13 = trunc i8 %7 to i1
  %14 = select i1 %13, double %11, double 0.000000e+00
  %15 = getelementptr double, ptr addrspace(1) %arg28, i64 %8
  %16 = urem i32 %linear_index1, 3840
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds i8, ptr addrspace(1) %arg16, i64 %17
  %19 = load i8, ptr addrspace(1) %18, align 1, !invariant.load !9
  %20 = trunc i8 %19 to i1
  %21 = select i1 %20, double %12, double 0.000000e+00
  %22 = insertelement <2 x double> poison, double %14, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  store <2 x double> %23, ptr addrspace(1) %15, align 32
  %24 = urem i32 %linear_index2, 3840
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr addrspace(1) %arg16, i64 %25
  %27 = load i8, ptr addrspace(1) %26, align 2, !invariant.load !9
  %28 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 16
  %29 = load <2 x double>, ptr addrspace(1) %28, align 16, !invariant.load !9
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = trunc i8 %27 to i1
  %33 = select i1 %32, double %30, double 0.000000e+00
  %34 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 16
  %35 = urem i32 %linear_index3, 3840
  %36 = zext nneg i32 %35 to i64
  %37 = getelementptr inbounds i8, ptr addrspace(1) %arg16, i64 %36
  %38 = load i8, ptr addrspace(1) %37, align 1, !invariant.load !9
  %39 = trunc i8 %38 to i1
  %40 = select i1 %39, double %31, double 0.000000e+00
  %41 = insertelement <2 x double> poison, double %33, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  store <2 x double> %42, ptr addrspace(1) %34, align 16
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}
!llvm.module.flags = !{!6}

!0 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!1 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 1024}
!2 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 1024}
!4 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_select_fusion, !"reqntidx", i32 128}
!6 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!7 = !{i32 0, i32 4}
!8 = !{i32 0, i32 1024}
!9 = !{}
!10 = !{i32 0, i32 900}
!11 = !{i32 0, i32 128}
