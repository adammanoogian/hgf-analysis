; ModuleID = 'jit__unstack'
source_filename = "jit__unstack"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_2(ptr noalias nocapture readonly align 16 dereferenceable(24) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [3 x [2 x i32]], ptr addrspace(1) %arg01, i64 0, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 16
  %4 = load i32, ptr addrspace(1) %3, align 4, !invariant.load !8
  %5 = getelementptr i32, ptr addrspace(1) %arg13, i64 %1
  store i32 %4, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_1(ptr noalias nocapture readonly align 16 dereferenceable(24) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [3 x [2 x i32]], ptr addrspace(1) %arg01, i64 0, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 8
  %4 = load i32, ptr addrspace(1) %3, align 4, !invariant.load !8
  %5 = getelementptr i32, ptr addrspace(1) %arg13, i64 %1
  store i32 %4, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice(ptr noalias nocapture readonly align 16 dereferenceable(24) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [3 x [2 x i32]], ptr addrspace(1) %arg01, i64 0, i64 0, i64 %1
  %3 = load i32, ptr addrspace(1) %2, align 4, !invariant.load !8
  %4 = getelementptr i32, ptr addrspace(1) %arg13, i64 %1
  store i32 %3, ptr addrspace(1) %4, align 4
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}
!llvm.module.flags = !{!6}

!0 = !{ptr @wrapped_slice_2, !"kernel", i32 1}
!1 = !{ptr @wrapped_slice_2, !"reqntidx", i32 2}
!2 = !{ptr @wrapped_slice_1, !"kernel", i32 1}
!3 = !{ptr @wrapped_slice_1, !"reqntidx", i32 2}
!4 = !{ptr @wrapped_slice, !"kernel", i32 1}
!5 = !{ptr @wrapped_slice, !"reqntidx", i32 2}
!6 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!7 = !{i32 0, i32 2}
!8 = !{}
