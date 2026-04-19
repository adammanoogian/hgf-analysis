; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load <2 x double>, ptr addrspace(1) %arg05, align 16, !invariant.load !3
  %1 = extractelement <2 x double> %0, i32 0
  %2 = extractelement <2 x double> %0, i32 1
  %add.1.i = fadd double %1, 0.000000e+00
  %add.1.i.1 = fadd double %add.1.i, %2
  %3 = getelementptr inbounds i8, ptr addrspace(1) %arg05, i64 16
  %4 = load <2 x double>, ptr addrspace(1) %3, align 16, !invariant.load !3
  %5 = extractelement <2 x double> %4, i32 0
  %6 = extractelement <2 x double> %4, i32 1
  %add.1.i.2 = fadd double %add.1.i.1, %5
  %add.1.i.3 = fadd double %add.1.i.2, %6
  %7 = getelementptr inbounds i8, ptr addrspace(1) %arg05, i64 32
  %8 = load <2 x double>, ptr addrspace(1) %7, align 16, !invariant.load !3
  %9 = extractelement <2 x double> %8, i32 0
  %10 = extractelement <2 x double> %8, i32 1
  %add.1.i.4 = fadd double %add.1.i.3, %9
  %add.1.i.5 = fadd double %add.1.i.4, %10
  %11 = getelementptr inbounds i8, ptr addrspace(1) %arg05, i64 48
  %12 = load <2 x double>, ptr addrspace(1) %11, align 16, !invariant.load !3
  %13 = extractelement <2 x double> %12, i32 0
  %14 = extractelement <2 x double> %12, i32 1
  %add.1.i.6 = fadd double %add.1.i.5, %13
  %add.1.i.7 = fadd double %add.1.i.6, %14
  %15 = getelementptr inbounds i8, ptr addrspace(1) %arg05, i64 64
  %16 = load <2 x double>, ptr addrspace(1) %15, align 16, !invariant.load !3
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  %add.1.i.8 = fadd double %add.1.i.7, %17
  %add.1.i.9 = fadd double %add.1.i.8, %18
  %19 = getelementptr inbounds i8, ptr addrspace(1) %arg05, i64 80
  %20 = load <2 x double>, ptr addrspace(1) %19, align 16, !invariant.load !3
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  %add.1.i.10 = fadd double %add.1.i.9, %21
  %add.1.i.11 = fadd double %add.1.i.10, %22
  %23 = getelementptr inbounds i8, ptr addrspace(1) %arg05, i64 96
  %24 = load <2 x double>, ptr addrspace(1) %23, align 16, !invariant.load !3
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %add.1.i.12 = fadd double %add.1.i.11, %25
  %add.1.i.13 = fadd double %add.1.i.12, %26
  %27 = getelementptr inbounds i8, ptr addrspace(1) %arg05, i64 112
  %28 = load <2 x double>, ptr addrspace(1) %27, align 16, !invariant.load !3
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  %add.1.i.14 = fadd double %add.1.i.13, %29
  %add.1.i.15 = fadd double %add.1.i.14, %30
  %31 = getelementptr inbounds i8, ptr addrspace(1) %arg05, i64 128
  %32 = load <2 x double>, ptr addrspace(1) %31, align 16, !invariant.load !3
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %add.1.i.16 = fadd double %add.1.i.15, %33
  %add.1.i.17 = fadd double %add.1.i.16, %34
  %35 = getelementptr inbounds i8, ptr addrspace(1) %arg05, i64 144
  %36 = load <2 x double>, ptr addrspace(1) %35, align 16, !invariant.load !3
  %37 = extractelement <2 x double> %36, i32 0
  %38 = extractelement <2 x double> %36, i32 1
  %add.1.i.18 = fadd double %add.1.i.17, %37
  %add.1.i.19 = fadd double %add.1.i.18, %38
  store double %add.1.i.19, ptr addrspace(1) %arg17, align 128
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @loop_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_reduce_fusion, !"reqntidx", i32 1}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{}
