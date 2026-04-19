; ModuleID = 'jit_sigmoid'
source_filename = "jit_sigmoid"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !7
  %6 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !7
  %multiply.4.1 = fmul double %5, %7
  %8 = getelementptr double, ptr addrspace(1) %arg25, i64 %3
  store double %multiply.4.1, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg4) local_unnamed_addr #0 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr double, ptr addrspace(1) %arg214, i64 %4
  %6 = load <2 x double>, ptr addrspace(1) %5, align 16, !invariant.load !7
  %7 = extractelement <2 x double> %6, i32 0
  %8 = extractelement <2 x double> %6, i32 1
  %9 = urem i32 %linear_index_base, 3840
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds double, ptr addrspace(1) %arg316, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 16, !invariant.load !7
  %multiply.5.1 = fmul double %7, %12
  %13 = getelementptr inbounds double, ptr addrspace(1) %arg112, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 16, !invariant.load !7
  %15 = getelementptr double, ptr addrspace(1) %arg010, i64 %4
  %16 = load <2 x double>, ptr addrspace(1) %15, align 16, !invariant.load !7
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  %multiply.6.3 = fmul double %14, %17
  %add.1.1 = fadd double %multiply.5.1, %multiply.6.3
  %19 = getelementptr double, ptr addrspace(1) %arg418, i64 %4
  %20 = urem i32 %linear_index1, 3840
  %21 = zext nneg i32 %20 to i64
  %22 = getelementptr inbounds double, ptr addrspace(1) %arg316, i64 %21
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !7
  %multiply.5.11 = fmul double %8, %23
  %24 = getelementptr inbounds double, ptr addrspace(1) %arg112, i64 %21
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !7
  %multiply.6.32 = fmul double %25, %18
  %add.1.13 = fadd double %multiply.5.11, %multiply.6.32
  %26 = insertelement <2 x double> poison, double %add.1.1, i32 0
  %27 = insertelement <2 x double> %26, double %add.1.13, i32 1
  store <2 x double> %27, ptr addrspace(1) %19, align 32
  %28 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 16
  %29 = load <2 x double>, ptr addrspace(1) %28, align 16, !invariant.load !7
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = urem i32 %linear_index2, 3840
  %33 = zext nneg i32 %32 to i64
  %34 = getelementptr inbounds double, ptr addrspace(1) %arg316, i64 %33
  %35 = load double, ptr addrspace(1) %34, align 16, !invariant.load !7
  %multiply.5.14 = fmul double %30, %35
  %36 = getelementptr inbounds double, ptr addrspace(1) %arg112, i64 %33
  %37 = load double, ptr addrspace(1) %36, align 16, !invariant.load !7
  %38 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 16
  %39 = load <2 x double>, ptr addrspace(1) %38, align 16, !invariant.load !7
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %multiply.6.35 = fmul double %37, %40
  %add.1.16 = fadd double %multiply.5.14, %multiply.6.35
  %42 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 16
  %43 = urem i32 %linear_index3, 3840
  %44 = zext nneg i32 %43 to i64
  %45 = getelementptr inbounds double, ptr addrspace(1) %arg316, i64 %44
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !7
  %multiply.5.17 = fmul double %31, %46
  %47 = getelementptr inbounds double, ptr addrspace(1) %arg112, i64 %44
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !7
  %multiply.6.38 = fmul double %48, %41
  %add.1.19 = fadd double %multiply.5.17, %multiply.6.38
  %49 = insertelement <2 x double> poison, double %add.1.16, i32 0
  %50 = insertelement <2 x double> %49, double %add.1.19, i32 1
  store <2 x double> %50, ptr addrspace(1) %42, align 16
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 30}
!6 = !{i32 0, i32 128}
!7 = !{}
!8 = !{i32 0, i32 900}
