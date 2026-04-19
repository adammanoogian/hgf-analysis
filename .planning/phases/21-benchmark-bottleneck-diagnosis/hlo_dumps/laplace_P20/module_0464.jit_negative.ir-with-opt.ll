; ModuleID = 'jit_negative'
source_filename = "jit_negative"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none)
define void @input_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(960) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(960) %arg3) local_unnamed_addr #0 {
entry:
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = icmp eq i32 %0, 0
  %2 = add nsw i32 %0, -1
  %3 = zext nneg i32 %2 to i64
  %4 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg15, i64 0, i64 %3
  %.sink2 = select i1 %1, ptr addrspace(1) %arg03, ptr addrspace(1) %4
  %5 = load double, ptr addrspace(1) %.sink2, align 8, !invariant.load !4
  %6 = fneg double %5
  %7 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg39, i64 0, i64 %3
  %arg2.sink = select i1 %1, ptr addrspace(1) %arg27, ptr addrspace(1) %7
  store double %6, ptr addrspace(1) %arg2.sink, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 121}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 121}
!4 = !{}
