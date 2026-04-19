; ModuleID = 'jit__where'
source_filename = "jit__where"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_select(ptr noalias nocapture readonly align 16 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i8, ptr addrspace(1) %arg01, align 16, !invariant.load !3
  %1 = load i32, ptr addrspace(1) %arg13, align 16, !invariant.load !3
  %2 = load i32, ptr addrspace(1) %arg25, align 16, !invariant.load !3
  %3 = trunc i8 %0 to i1
  %4 = select i1 %3, i32 %1, i32 %2
  store i32 %4, ptr addrspace(1) %arg37, align 128
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_select, !"kernel", i32 1}
!1 = !{ptr @wrapped_select, !"reqntidx", i32 1}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{}
