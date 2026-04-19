; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = load i64, ptr addrspace(1) %arg13, align 16, !invariant.load !4
  %2 = trunc i64 %1 to i32
  %3 = icmp sgt i32 %2, 0
  %4 = zext i1 %3 to i64
  %5 = zext nneg i32 %0 to i64
  %6 = getelementptr inbounds [2 x [2 x i32]], ptr addrspace(1) %arg01, i64 0, i64 %4, i64 %5
  %7 = load i32, ptr addrspace(1) %6, align 4, !invariant.load !4
  %8 = getelementptr i32, ptr addrspace(1) %arg25, i64 %5
  store i32 %7, ptr addrspace(1) %8, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 2}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 2}
!4 = !{}
