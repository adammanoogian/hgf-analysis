; ModuleID = 'jit_broadcast_in_dim'
source_filename = "jit_broadcast_in_dim"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_broadcast(ptr noalias nocapture readonly align 16 dereferenceable(4) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = load i32, ptr addrspace(1) %arg01, align 16, !invariant.load !4
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr i32, ptr addrspace(1) %arg13, i64 %2
  store i32 %1, ptr addrspace(1) %3, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_broadcast, !"kernel", i32 1}
!1 = !{ptr @wrapped_broadcast, !"reqntidx", i32 48}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 48}
!4 = !{}
