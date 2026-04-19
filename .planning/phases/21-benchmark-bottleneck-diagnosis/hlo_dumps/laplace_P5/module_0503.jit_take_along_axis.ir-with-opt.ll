; ModuleID = 'jit_take_along_axis'
source_filename = "jit_take_along_axis"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1536
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define void @input_scatter_fusion(ptr noalias nocapture align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(9216) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %param_2.2 = getelementptr inbounds [4 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg213, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %param_2.21 = load i32, ptr addrspace(1) %param_2.2, align 4, !invariant.load !9
  %7 = icmp ult i32 %param_2.21, 4
  %param_2.2215 = getelementptr inbounds i8, ptr addrspace(1) %param_2.2, i64 4
  %param_2.23 = load i32, ptr addrspace(1) %param_2.2215, align 4, !invariant.load !9
  %8 = icmp ult i32 %param_2.23, 192
  %9 = and i1 %7, %8
  %param_2.2416 = getelementptr inbounds i8, ptr addrspace(1) %param_2.2, i64 8
  %param_2.25 = load i32, ptr addrspace(1) %param_2.2416, align 4, !invariant.load !9
  %10 = icmp ult i32 %param_2.25, 2
  %11 = and i1 %9, %10
  %12 = zext nneg i32 %linear_index to i64
  %13 = getelementptr double, ptr addrspace(1) %arg111, i64 %12
  %14 = zext nneg i32 %param_2.21 to i64
  %15 = zext nneg i32 %param_2.23 to i64
  %16 = zext nneg i32 %param_2.25 to i64
  %17 = getelementptr inbounds [4 x [192 x [2 x [1 x double]]]], ptr addrspace(1) %arg09, i64 0, i64 %14, i64 %15, i64 %16, i64 0
  br i1 %11, label %scatter.in_bounds-true, label %scatter.3.1.in_bounds-after

scatter.3.1.in_bounds-after:                      ; preds = %entry, %scatter.in_bounds-true
  ret void

scatter.in_bounds-true:                           ; preds = %entry
  %param_1.16 = load double, ptr addrspace(1) %13, align 8, !invariant.load !9
  %18 = atomicrmw fadd ptr addrspace(1) %17, double %param_1.16 seq_cst, align 8
  br label %scatter.3.1.in_bounds-after
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 1024}
!2 = !{ptr @input_scatter_fusion, !"kernel", i32 1}
!3 = !{ptr @input_scatter_fusion, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 2}
!6 = !{i32 0, i32 1024}
!7 = !{i32 0, i32 6}
!8 = !{i32 0, i32 128}
!9 = !{}
