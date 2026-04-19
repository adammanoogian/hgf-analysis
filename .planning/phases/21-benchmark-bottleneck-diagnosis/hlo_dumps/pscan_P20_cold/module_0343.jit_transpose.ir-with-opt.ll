; ModuleID = 'jit_transpose'
source_filename = "jit_transpose"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_transpose(ptr noalias nocapture readonly align 16 dereferenceable(3200) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3200) %arg1) local_unnamed_addr #0 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 400
  br i1 %3, label %wrapped_transpose.in_bounds-true, label %wrapped_transpose.in_bounds-after

wrapped_transpose.in_bounds-after:                ; preds = %wrapped_transpose.in_bounds-true, %entry
  ret void

wrapped_transpose.in_bounds-true:                 ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 199
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i32
  %.urem = add nsw i32 %.zext, -10
  %.cmp1 = icmp ult i32 %linear_index, 200
  %5 = select i1 %.cmp1, i32 %.zext, i32 %.urem
  %6 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %6
  %7 = zext nneg i32 %5 to i64
  %8 = zext i1 %.cmp to i64
  %9 = zext nneg i16 %.decomposed to i64
  %10 = getelementptr inbounds [10 x [2 x [20 x double]]], ptr addrspace(1) %arg04, i64 0, i64 %7, i64 %8, i64 %9
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !5
  %12 = zext nneg i32 %linear_index to i64
  %13 = getelementptr double, ptr addrspace(1) %arg16, i64 %12
  store double %11, ptr addrspace(1) %13, align 8
  br label %wrapped_transpose.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!1 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 4}
!4 = !{i32 0, i32 128}
!5 = !{}
