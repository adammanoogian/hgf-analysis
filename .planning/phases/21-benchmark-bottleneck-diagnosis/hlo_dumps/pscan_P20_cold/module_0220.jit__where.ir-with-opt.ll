; ModuleID = 'jit__where'
source_filename = "jit__where"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  br i1 %3, label %loop_select_fusion.in_bounds-true, label %loop_select_fusion.in_bounds-after

loop_select_fusion.in_bounds-after:               ; preds = %loop_select_fusion.in_bounds-true, %entry
  ret void

loop_select_fusion.in_bounds-true:                ; preds = %entry
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr i8, ptr addrspace(1) %arg01, i64 %4
  %6 = load i8, ptr addrspace(1) %5, align 1, !invariant.load !7
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !7
  %9 = load double, ptr addrspace(1) %arg25, align 16, !invariant.load !7
  %10 = trunc i8 %6 to i1
  %11 = select i1 %10, double %8, double %9
  %12 = getelementptr double, ptr addrspace(1) %arg37, i64 %4
  store double %11, ptr addrspace(1) %12, align 8
  br label %loop_select_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.in_bounds-after
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_select_fusion, !"reqntidx", i32 1024}
!2 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 1024}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 4}
!6 = !{i32 0, i32 1024}
!7 = !{}
