; ModuleID = 'jit_concatenate'
source_filename = "jit_concatenate"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @wrapped_concatenate(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg6) local_unnamed_addr #0 {
entry:
  %arg619 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg517 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = icmp ult i32 %0, 12
  br i1 %1, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %entry
  %2 = icmp ult i32 %0, 4
  br i1 %2, label %concatenate.1.1.merge, label %concatenate.pivot.8.

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %3 = icmp ult i32 %0, 8
  br i1 %3, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  %4 = add nsw i32 %0, -4
  br label %concatenate.1.1.merge

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  %5 = add nsw i32 %0, -8
  br label %concatenate.1.1.merge

concatenate.pivot.16.:                            ; preds = %entry
  %6 = icmp ult i32 %0, 16
  br i1 %6, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  %7 = add nsw i32 %0, -12
  br label %concatenate.1.1.merge

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %8 = icmp ult i32 %0, 20
  br i1 %8, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  %9 = add nsw i32 %0, -16
  br label %concatenate.1.1.merge

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  %10 = add nsw i32 %0, -20
  br label %concatenate.1.1.merge

concatenate.1.1.merge:                            ; preds = %concatenate.pivot.4., %concatenate.pivot.20.5, %concatenate.pivot.16.4, %concatenate.pivot.12.3, %concatenate.pivot.8.2, %concatenate.pivot.4.1
  %.sink6 = phi i32 [ %10, %concatenate.pivot.20.5 ], [ %9, %concatenate.pivot.16.4 ], [ %7, %concatenate.pivot.12.3 ], [ %5, %concatenate.pivot.8.2 ], [ %4, %concatenate.pivot.4.1 ], [ %0, %concatenate.pivot.4. ]
  %arg5.sink = phi ptr addrspace(1) [ %arg517, %concatenate.pivot.20.5 ], [ %arg415, %concatenate.pivot.16.4 ], [ %arg313, %concatenate.pivot.12.3 ], [ %arg211, %concatenate.pivot.8.2 ], [ %arg19, %concatenate.pivot.4.1 ], [ %arg07, %concatenate.pivot.4. ]
  %11 = zext nneg i32 %.sink6 to i64
  %12 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5.sink, i64 0, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !4
  %14 = zext nneg i32 %0 to i64
  %15 = getelementptr double, ptr addrspace(1) %arg619, i64 %14
  store double %13, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_concatenate, !"kernel", i32 1}
!1 = !{ptr @wrapped_concatenate, !"reqntidx", i32 24}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 24}
!4 = !{}
