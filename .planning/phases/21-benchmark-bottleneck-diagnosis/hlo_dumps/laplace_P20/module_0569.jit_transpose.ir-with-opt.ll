; ModuleID = 'jit_transpose'
source_filename = "jit_transpose"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_transpose(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index_base, 2400
  %5 = udiv i32 %linear_index_base, 20
  %.lhs.trunc = trunc nuw nsw i32 %5 to i16
  %6 = urem i16 %.lhs.trunc, 120
  %7 = urem i32 %linear_index3, 20
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %8 = urem i32 %linear_index2, 20
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %9 = urem i32 %linear_index1, 20
  %10 = mul i32 %5, 20
  %.decomposed = sub i32 %linear_index_base, %10
  %11 = zext nneg i16 %6 to i64
  %12 = zext nneg i32 %4 to i64
  %13 = zext nneg i32 %.decomposed to i64
  %14 = getelementptr inbounds [120 x [192 x [1 x [20 x double]]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 0, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 16, !invariant.load !5
  %16 = zext nneg i32 %linear_index_base to i64
  %17 = getelementptr double, ptr addrspace(1) %arg13, i64 %16
  %18 = zext nneg i32 %9 to i64
  %19 = getelementptr inbounds [120 x [192 x [1 x [20 x double]]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 0, i64 %18
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !5
  %21 = insertelement <2 x double> poison, double %15, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  store <2 x double> %22, ptr addrspace(1) %17, align 32
  %23 = zext nneg i32 %8 to i64
  %24 = getelementptr inbounds [120 x [192 x [1 x [20 x double]]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 0, i64 %23
  %25 = load double, ptr addrspace(1) %24, align 16, !invariant.load !5
  %26 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 16
  %27 = zext nneg i32 %7 to i64
  %28 = getelementptr inbounds [120 x [192 x [1 x [20 x double]]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 0, i64 %27
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !5
  %30 = insertelement <2 x double> poison, double %25, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  store <2 x double> %31, ptr addrspace(1) %26, align 16
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

!0 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!1 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 900}
!4 = !{i32 0, i32 128}
!5 = !{}
