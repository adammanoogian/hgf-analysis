; ModuleID = 'jit_pad'
source_filename = "jit_pad"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @wrapped_pad(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg2) local_unnamed_addr #0 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = icmp ult i32 %0, 4
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg06, i64 0, i64 0, i64 %2
  %pad_result_addr.0.in = select i1 %1, ptr addrspace(1) %3, ptr addrspace(1) %arg18
  %pad_result_addr.0 = load double, ptr addrspace(1) %pad_result_addr.0.in, align 8, !invariant.load !4
  %4 = getelementptr double, ptr addrspace(1) %arg210, i64 %2
  store double %pad_result_addr.0, ptr addrspace(1) %4, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_pad, !"kernel", i32 1}
!1 = !{ptr @wrapped_pad, !"reqntidx", i32 24}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 24}
!4 = !{}
