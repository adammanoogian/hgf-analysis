; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg3) local_unnamed_addr #0 {
entry:
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %1 = icmp ult i32 %0, 4
  br i1 %1, label %concatenate.pivot.0., label %concatenate.pivot.4.1

copy_fusion.in_bounds-after:                      ; preds = %slice0-after, %slice1-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 0
  br label %concatenate.merge

concatenate.pivot.4.1:                            ; preds = %entry
  %4 = add nsw i32 %0, -4
  %5 = and i32 %0, 3
  %6 = lshr i32 %4, 2
  %7 = zext nneg i32 %6 to i64
  %8 = zext nneg i32 %5 to i64
  %9 = getelementptr inbounds [24 x [4 x [1 x double]]], ptr addrspace(1) %arg14, i64 0, i64 %7, i64 %8, i64 0
  %.pre = zext nneg i32 %0 to i64
  br label %concatenate.merge

concatenate.merge:                                ; preds = %concatenate.pivot.4.1, %concatenate.pivot.0.
  %.pre-phi = phi i64 [ %.pre, %concatenate.pivot.4.1 ], [ %2, %concatenate.pivot.0. ]
  %.in = phi ptr addrspace(1) [ %3, %concatenate.pivot.0. ], [ %9, %concatenate.pivot.4.1 ]
  %10 = icmp ult i32 %0, 4
  %11 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !8
  %12 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg26, i64 0, i64 %.pre-phi
  br i1 %10, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %13 = icmp ugt i32 %0, 3
  %14 = add nsw i32 %0, -4
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr inbounds [96 x double], ptr addrspace(1) %arg38, i64 0, i64 %15
  br i1 %13, label %slice1-true, label %copy_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  store double %11, ptr addrspace(1) %12, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double %11, ptr addrspace(1) %16, align 8
  br label %copy_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !10
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = zext nneg i16 %3 to i64
  %5 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg13, i64 0, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !8
  %7 = zext nneg i32 %linear_index to i64
  %8 = getelementptr double, ptr addrspace(1) %arg01, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !8
  %multiply.3.1 = fmul double %6, %9
  %10 = getelementptr double, ptr addrspace(1) %arg25, i64 %7
  store double %multiply.3.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg4) local_unnamed_addr #2 {
entry:
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !11
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !10
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = and i16 %3, 3
  %5 = zext nneg i16 %3 to i64
  %6 = getelementptr inbounds double, ptr addrspace(1) %arg39, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !8
  %8 = urem i16 %.lhs.trunc, 768
  %9 = zext nneg i16 %8 to i64
  %10 = getelementptr inbounds double, ptr addrspace(1) %arg27, i64 %9
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !8
  %multiply.4.1 = fmul double %7, %11
  %12 = zext nneg i16 %4 to i64
  %13 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg15, i64 0, i64 %12
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !8
  %15 = zext nneg i32 %linear_index to i64
  %16 = getelementptr double, ptr addrspace(1) %arg03, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !8
  %multiply.5.3 = fmul double %14, %17
  %add.1.1 = fadd double %multiply.4.1, %multiply.5.3
  %18 = getelementptr double, ptr addrspace(1) %arg411, i64 %15
  store double %add.1.1, ptr addrspace(1) %18, align 8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}
!llvm.module.flags = !{!6}

!0 = !{ptr @copy_fusion, !"kernel", i32 1}
!1 = !{ptr @copy_fusion, !"reqntidx", i32 100}
!2 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!4 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!6 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!7 = !{i32 0, i32 100}
!8 = !{}
!9 = !{i32 0, i32 6}
!10 = !{i32 0, i32 128}
!11 = !{i32 0, i32 144}
