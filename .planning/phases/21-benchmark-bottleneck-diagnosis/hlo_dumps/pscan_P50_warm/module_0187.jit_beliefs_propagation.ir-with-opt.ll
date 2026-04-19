; ModuleID = 'jit_beliefs_propagation'
source_filename = "jit_beliefs_propagation"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg2) local_unnamed_addr #0 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 144
  br i1 %3, label %concatenate.pivot.48., label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %slice2-true, %entry
  ret void

concatenate.pivot.48.:                            ; preds = %entry
  %4 = icmp ult i32 %linear_index, 48
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg04, i64 0, i64 %5
  br i1 %4, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.pivot.48.
  %7 = add nsw i32 %linear_index, -48
  %8 = icmp ult i32 %7, 48
  %9 = zext nneg i32 %7 to i64
  %10 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg16, i64 0, i64 %9
  br i1 %8, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %11 = icmp ugt i32 %linear_index, 95
  %12 = add nsw i32 %linear_index, -96
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg28, i64 0, i64 %13
  br i1 %11, label %slice2-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.pivot.48.
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %10, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double 0x7FF8000000000000, ptr addrspace(1) %14, align 8
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 2}
!4 = !{i32 0, i32 128}
