; ModuleID = 'jit__where'
source_filename = "jit__where"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  %3 = load i8, ptr addrspace(1) %2, align 1, !invariant.load !8
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !8
  %6 = load double, ptr addrspace(1) %arg25, align 16, !invariant.load !8
  %7 = trunc i8 %3 to i1
  %8 = select i1 %7, double %5, double %6
  %9 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  store double %8, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !10
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = urem i16 %.lhs.trunc, 768
  %4 = zext nneg i16 %3 to i64
  %5 = getelementptr inbounds i8, ptr addrspace(1) %arg13, i64 %4
  %6 = load i8, ptr addrspace(1) %5, align 1, !invariant.load !8
  %7 = zext nneg i32 %linear_index to i64
  %8 = getelementptr double, ptr addrspace(1) %arg01, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !8
  %10 = trunc i8 %6 to i1
  %11 = select i1 %10, double %9, double 0.000000e+00
  %12 = getelementptr double, ptr addrspace(1) %arg25, i64 %7
  store double %11, ptr addrspace(1) %12, align 8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}
!llvm.module.flags = !{!6}

!0 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!1 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 768}
!2 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 768}
!4 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_select_fusion, !"reqntidx", i32 128}
!6 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!7 = !{i32 0, i32 768}
!8 = !{}
!9 = !{i32 0, i32 144}
!10 = !{i32 0, i32 128}
