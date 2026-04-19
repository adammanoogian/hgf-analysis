; ModuleID = 'jit_iota'
source_filename = "jit_iota"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @wrapped_iota(ptr noalias nocapture writeonly align 128 dereferenceable(4608) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 576
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr i64, ptr addrspace(1) %arg01, i64 %4
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  br i1 %3, label %wrapped_iota.in_bounds-true, label %wrapped_iota.in_bounds-after

wrapped_iota.in_bounds-after:                     ; preds = %wrapped_iota.in_bounds-true, %entry
  ret void

wrapped_iota.in_bounds-true:                      ; preds = %entry
  %6 = udiv i16 %.lhs.trunc, 24
  %7 = zext nneg i16 %6 to i64
  store i64 %7, ptr addrspace(1) %5, align 8
  br label %wrapped_iota.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_iota, !"kernel", i32 1}
!1 = !{ptr @wrapped_iota, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 5}
!4 = !{i32 0, i32 128}
