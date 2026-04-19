; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(7372800) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg2) local_unnamed_addr #0 {
entry:
  %arg235 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg133 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg031 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index_base, 3840
  %5 = udiv i32 %linear_index_base, 192
  %.lhs.trunc = trunc nuw nsw i32 %5 to i16
  %6 = urem i16 %.lhs.trunc, 20
  %7 = urem i32 %linear_index3, 192
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %8 = urem i32 %linear_index2, 192
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %9 = urem i32 %linear_index1, 192
  %10 = mul i32 %5, 192
  %.decomposed = sub i32 %linear_index_base, %10
  %11 = load i64, ptr addrspace(1) %arg133, align 16, !invariant.load !5
  %12 = trunc i64 %11 to i32
  %13 = icmp sgt i32 %12, 0
  %14 = zext nneg i32 %4 to i64
  %15 = zext nneg i16 %6 to i64
  %16 = zext nneg i32 %.decomposed to i64
  %17 = zext i1 %13 to i64
  %18 = getelementptr inbounds [120 x [1 x [20 x [192 x [2 x double]]]]], ptr addrspace(1) %arg031, i64 0, i64 %14, i64 0, i64 %15, i64 %16, i64 %17
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !5
  %20 = zext nneg i32 %linear_index_base to i64
  %21 = getelementptr double, ptr addrspace(1) %arg235, i64 %20
  %22 = zext nneg i32 %9 to i64
  %23 = getelementptr inbounds [120 x [1 x [20 x [192 x [2 x double]]]]], ptr addrspace(1) %arg031, i64 0, i64 %14, i64 0, i64 %15, i64 %22, i64 %17
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !5
  %25 = insertelement <2 x double> poison, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  store <2 x double> %26, ptr addrspace(1) %21, align 32
  %27 = zext nneg i32 %8 to i64
  %28 = getelementptr inbounds [120 x [1 x [20 x [192 x [2 x double]]]]], ptr addrspace(1) %arg031, i64 0, i64 %14, i64 0, i64 %15, i64 %27, i64 %17
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !5
  %30 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 16
  %31 = zext nneg i32 %7 to i64
  %32 = getelementptr inbounds [120 x [1 x [20 x [192 x [2 x double]]]]], ptr addrspace(1) %arg031, i64 0, i64 %14, i64 0, i64 %15, i64 %31, i64 %17
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !5
  %34 = insertelement <2 x double> poison, double %29, i32 0
  %35 = insertelement <2 x double> %34, double %33, i32 1
  store <2 x double> %35, ptr addrspace(1) %30, align 16
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
!3 = !{i32 0, i32 900}
!4 = !{i32 0, i32 128}
!5 = !{}
