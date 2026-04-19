; ModuleID = 'jit_broadcast_in_dim'
source_filename = "jit_broadcast_in_dim"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_broadcast(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 140
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !6
  %4 = mul nuw nsw i32 %3, 20
  %5 = add nuw nsw i32 %4, %1
  %linear_index = add nuw nsw i32 %5, %2
  %6 = icmp ult i32 %linear_index, 2400
  %7 = zext nneg i32 %linear_index to i64
  %8 = getelementptr double, ptr addrspace(1) %arg13, i64 %7
  %9 = zext nneg i32 %1 to i64
  %10 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg01, i64 0, i64 %9
  br i1 %6, label %wrapped_broadcast.in_bounds-true, label %wrapped_broadcast.in_bounds-after

wrapped_broadcast.in_bounds-after:                ; preds = %wrapped_broadcast.in_bounds-true, %entry
  ret void

wrapped_broadcast.in_bounds-true:                 ; preds = %entry
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !7
  store double %11, ptr addrspace(1) %8, align 8
  br label %wrapped_broadcast.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2}
!llvm.module.flags = !{!3}

!0 = !{ptr @wrapped_broadcast, !"kernel", i32 1}
!1 = !{ptr @wrapped_broadcast, !"reqntidx", i32 20}
!2 = !{ptr @wrapped_broadcast, !"reqntidy", i32 7}
!3 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!4 = !{i32 0, i32 18}
!5 = !{i32 0, i32 20}
!6 = !{i32 0, i32 7}
!7 = !{}
