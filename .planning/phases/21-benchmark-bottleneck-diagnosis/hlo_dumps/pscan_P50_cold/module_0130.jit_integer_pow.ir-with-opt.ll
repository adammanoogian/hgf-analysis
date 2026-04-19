; ModuleID = 'jit_integer_pow'
source_filename = "jit_integer_pow"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_multiply(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg01, align 16, !invariant.load !3
  %multiply.1.1 = fmul double %0, %0
  store double %multiply.1.1, ptr addrspace(1) %arg13, align 128
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_multiply, !"kernel", i32 1}
!1 = !{ptr @wrapped_multiply, !"reqntidx", i32 1}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{}
