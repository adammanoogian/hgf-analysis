; ModuleID = 'jit_beliefs_propagation'
source_filename = "jit_beliefs_propagation"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #0 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = icmp ult i32 %0, 4
  %2 = icmp ult i32 %0, 8
  %. = select i1 %2, double 0.000000e+00, double 0x7FF8000000000000
  %3 = zext nneg i32 %0 to i64
  %4 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg04, i64 0, i64 %3
  br i1 %1, label %slice0-true, label %slice0-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %slice2-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %5 = and i32 %0, 12
  %6 = icmp eq i32 %5, 4
  %7 = add nsw i32 %0, -4
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg16, i64 0, i64 %8
  br i1 %6, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %10 = icmp ugt i32 %0, 7
  %11 = add nsw i32 %0, -8
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg28, i64 0, i64 %12
  br i1 %10, label %slice2-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %4, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double %., ptr addrspace(1) %9, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double 0x7FF8000000000000, ptr addrspace(1) %13, align 8
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 12}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 12}
