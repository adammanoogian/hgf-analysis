; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = and i16 %3, 3
  %5 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = load i64, ptr addrspace(1) %arg17, align 16, !invariant.load !5
  %7 = trunc i64 %6 to i32
  %8 = icmp sgt i32 %7, 0
  %9 = zext nneg i16 %4 to i64
  %10 = zext nneg i16 %.decomposed to i64
  %11 = zext i1 %8 to i64
  %12 = getelementptr inbounds [1 x [4 x [192 x [2 x double]]]], ptr addrspace(1) %arg05, i64 0, i64 0, i64 %9, i64 %10, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !5
  %14 = zext nneg i32 %linear_index to i64
  %15 = getelementptr double, ptr addrspace(1) %arg29, i64 %14
  store double %13, ptr addrspace(1) %15, align 8
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
!3 = !{i32 0, i32 6}
!4 = !{i32 0, i32 128}
!5 = !{}
