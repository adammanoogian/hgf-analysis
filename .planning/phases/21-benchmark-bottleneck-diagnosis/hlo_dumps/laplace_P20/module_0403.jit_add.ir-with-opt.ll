; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none)
define void @input_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(960) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(960) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(960) %arg5) local_unnamed_addr #0 {
entry:
  %arg514 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg412 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg310 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = icmp eq i32 %0, 0
  %2 = add nsw i32 %0, -1
  %3 = zext nneg i32 %2 to i64
  %4 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg28, i64 0, i64 %3
  %5 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg310, i64 0, i64 %3
  %.sink3 = select i1 %1, ptr addrspace(1) %arg16, ptr addrspace(1) %5
  %.sink.in = select i1 %1, ptr addrspace(1) %arg04, ptr addrspace(1) %4
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !4
  %6 = load double, ptr addrspace(1) %.sink3, align 8, !invariant.load !4
  %add.3.2 = fadd double %.sink, %6
  %7 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg514, i64 0, i64 %3
  %arg4.sink = select i1 %1, ptr addrspace(1) %arg412, ptr addrspace(1) %7
  store double %add.3.2, ptr addrspace(1) %arg4.sink, align 8
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
