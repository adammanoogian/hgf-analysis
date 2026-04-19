; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %linear_index = or disjoint i32 %1, %2
  %3 = lshr i32 %linear_index, 2
  %4 = and i32 %2, 3
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %3 to i64
  %7 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr addrspace(1) %arg13, i64 0, i64 0, i64 %5, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !7
  %9 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 %6
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !7
  %multiply.2.1 = fmul double %8, %10
  %11 = zext nneg i32 %linear_index to i64
  %12 = getelementptr double, ptr addrspace(1) %arg25, i64 %11
  store double %multiply.2.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg2) local_unnamed_addr #0 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw i32 %0 to i8
  %3 = udiv i8 %.lhs.trunc, 6
  %4 = lshr i32 %linear_index, 2
  %.lhs.trunc1 = trunc nuw nsw i32 %4 to i16
  %5 = urem i16 %.lhs.trunc1, 192
  %6 = and i32 %2, 3
  %7 = zext nneg i8 %3 to i64
  %8 = zext nneg i32 %6 to i64
  %9 = zext nneg i16 %5 to i64
  %10 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr addrspace(1) %arg03, i64 0, i64 %7, i64 0, i64 %8, i64 %9
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !7
  %12 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg15, i64 0, i64 %8, i64 %9
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !7
  %multiply.3.1 = fmul double %11, %13
  %14 = zext nneg i32 %linear_index to i64
  %15 = getelementptr double, ptr addrspace(1) %arg27, i64 %14
  store double %multiply.3.1, ptr addrspace(1) %15, align 8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 6}
!6 = !{i32 0, i32 128}
!7 = !{}
!8 = !{i32 0, i32 144}
