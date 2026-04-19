; ModuleID = 'jit_concatenate'
source_filename = "jit_concatenate"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_concatenate(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(294912) %arg2) local_unnamed_addr #0 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = and i16 %3, 3
  %.lhs.trunc8 = trunc nuw i32 %0 to i8
  %6 = udiv i8 %.lhs.trunc8, 6
  %7 = zext nneg i32 %linear_index to i64
  %8 = getelementptr double, ptr addrspace(1) %arg010, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !5
  %10 = zext nneg i8 %6 to i64
  %11 = zext nneg i16 %5 to i64
  %12 = zext nneg i16 %.decomposed to i64
  %13 = getelementptr inbounds [24 x [4 x [192 x [2 x double]]]], ptr addrspace(1) %arg214, i64 0, i64 %10, i64 %11, i64 %12, i64 0
  %14 = getelementptr double, ptr addrspace(1) %arg112, i64 %7
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !5
  %16 = insertelement <2 x double> poison, double %9, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  store <2 x double> %17, ptr addrspace(1) %13, align 16
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

!0 = !{ptr @wrapped_concatenate, !"kernel", i32 1}
!1 = !{ptr @wrapped_concatenate, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 144}
!4 = !{i32 0, i32 128}
!5 = !{}
