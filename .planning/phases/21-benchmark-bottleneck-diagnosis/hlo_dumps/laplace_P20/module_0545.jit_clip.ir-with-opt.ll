; ModuleID = 'jit_clip'
source_filename = "jit_clip"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !7
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %3
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !7
  %multiply.4.3 = fmul double %5, %7
  %8 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !7
  %multiply.5.1 = fmul double %multiply.4.3, %9
  %10 = getelementptr double, ptr addrspace(1) %arg37, i64 %3
  store double %multiply.5.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr double, ptr addrspace(1) %arg19, i64 %4
  %6 = load <2 x double>, ptr addrspace(1) %5, align 16, !invariant.load !7
  %7 = extractelement <2 x double> %6, i32 0
  %8 = extractelement <2 x double> %6, i32 1
  %9 = urem i32 %linear_index_base, 3840
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds double, ptr addrspace(1) %arg211, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 16, !invariant.load !7
  %multiply.7.1 = fmul double %7, %12
  %13 = getelementptr inbounds double, ptr addrspace(1) %arg07, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 16, !invariant.load !7
  %multiply.8.1 = fmul double %multiply.7.1, %14
  %15 = getelementptr double, ptr addrspace(1) %arg313, i64 %4
  %16 = urem i32 %linear_index1, 3840
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds double, ptr addrspace(1) %arg211, i64 %17
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !7
  %multiply.7.11 = fmul double %8, %19
  %20 = getelementptr inbounds double, ptr addrspace(1) %arg07, i64 %17
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !7
  %multiply.8.12 = fmul double %multiply.7.11, %21
  %22 = insertelement <2 x double> poison, double %multiply.8.1, i32 0
  %23 = insertelement <2 x double> %22, double %multiply.8.12, i32 1
  store <2 x double> %23, ptr addrspace(1) %15, align 32
  %24 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 16
  %25 = load <2 x double>, ptr addrspace(1) %24, align 16, !invariant.load !7
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = urem i32 %linear_index2, 3840
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr inbounds double, ptr addrspace(1) %arg211, i64 %29
  %31 = load double, ptr addrspace(1) %30, align 16, !invariant.load !7
  %multiply.7.13 = fmul double %26, %31
  %32 = getelementptr inbounds double, ptr addrspace(1) %arg07, i64 %29
  %33 = load double, ptr addrspace(1) %32, align 16, !invariant.load !7
  %multiply.8.14 = fmul double %multiply.7.13, %33
  %34 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 16
  %35 = urem i32 %linear_index3, 3840
  %36 = zext nneg i32 %35 to i64
  %37 = getelementptr inbounds double, ptr addrspace(1) %arg211, i64 %36
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !7
  %multiply.7.15 = fmul double %27, %38
  %39 = getelementptr inbounds double, ptr addrspace(1) %arg07, i64 %36
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !7
  %multiply.8.16 = fmul double %multiply.7.15, %40
  %41 = insertelement <2 x double> poison, double %multiply.8.14, i32 0
  %42 = insertelement <2 x double> %41, double %multiply.8.16, i32 1
  store <2 x double> %42, ptr addrspace(1) %34, align 16
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 30}
!6 = !{i32 0, i32 128}
!7 = !{}
!8 = !{i32 0, i32 900}
