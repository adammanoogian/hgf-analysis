; ModuleID = 'jit_beliefs_propagation'
source_filename = "jit_beliefs_propagation"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg2) local_unnamed_addr #0 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = icmp ult i32 %0, 20
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg04, i64 0, i64 %2
  br i1 %1, label %slice0-true, label %slice0-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %slice2-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %4 = add nsw i32 %0, -20
  %5 = icmp ult i32 %4, 20
  %6 = zext nneg i32 %4 to i64
  %7 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg16, i64 0, i64 %6
  br i1 %5, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %8 = icmp ugt i32 %0, 39
  %9 = add nsw i32 %0, -40
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg28, i64 0, i64 %10
  br i1 %8, label %slice2-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %3, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %7, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double 0x7FF8000000000000, ptr addrspace(1) %11, align 8
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 60}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 60}
