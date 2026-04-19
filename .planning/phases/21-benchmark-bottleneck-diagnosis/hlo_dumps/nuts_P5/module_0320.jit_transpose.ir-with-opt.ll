; ModuleID = 'jit_transpose'
source_filename = "jit_transpose"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_transpose(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #0 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %.cmp = icmp ugt i32 %0, 9
  %.urem = add nsw i32 %0, -10
  %.cmp1 = icmp ult i32 %0, 10
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext nneg i32 %1 to i64
  %3 = zext i1 %.cmp to i64
  %4 = getelementptr inbounds [10 x [2 x i64]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !4
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr i64, ptr addrspace(1) %arg14, i64 %6
  store i64 %5, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!1 = !{ptr @wrapped_transpose, !"reqntidx", i32 20}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 20}
!4 = !{}
