; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #0 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = load i64, ptr addrspace(1) %arg16, align 16, !invariant.load !5
  %6 = trunc i64 %5 to i32
  %7 = icmp sgt i32 %6, 0
  %8 = zext nneg i16 %3 to i64
  %9 = zext nneg i16 %.decomposed to i64
  %10 = zext i1 %7 to i64
  %11 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr addrspace(1) %arg04, i64 0, i64 %8, i64 %9, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !5
  %13 = zext nneg i32 %linear_index to i64
  %14 = getelementptr double, ptr addrspace(1) %arg28, i64 %13
  store double %12, ptr addrspace(1) %14, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 30}
!4 = !{i32 0, i32 128}
!5 = !{}
