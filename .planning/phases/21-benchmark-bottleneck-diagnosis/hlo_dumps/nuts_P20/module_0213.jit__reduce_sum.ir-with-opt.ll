; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_broadcast(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = zext nneg i16 %3 to i64
  %5 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg01, i64 0, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !5
  %7 = zext nneg i32 %linear_index to i64
  %8 = getelementptr double, ptr addrspace(1) %arg13, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_broadcast, !"kernel", i32 1}
!1 = !{ptr @wrapped_broadcast, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 30}
!4 = !{i32 0, i32 128}
!5 = !{}
