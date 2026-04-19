; ModuleID = 'jit_broadcast_in_dim'
source_filename = "jit_broadcast_in_dim"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_broadcast(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  br i1 %3, label %wrapped_broadcast.in_bounds-true, label %wrapped_broadcast.in_bounds-after

wrapped_broadcast.in_bounds-after:                ; preds = %wrapped_broadcast.in_bounds-true, %entry
  ret void

wrapped_broadcast.in_bounds-true:                 ; preds = %entry
  %6 = load double, ptr addrspace(1) %arg01, align 16, !invariant.load !5
  store double %6, ptr addrspace(1) %5, align 8
  br label %wrapped_broadcast.in_bounds-after
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
!1 = !{ptr @wrapped_broadcast, !"reqntidx", i32 1024}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 4}
!4 = !{i32 0, i32 1024}
!5 = !{}
