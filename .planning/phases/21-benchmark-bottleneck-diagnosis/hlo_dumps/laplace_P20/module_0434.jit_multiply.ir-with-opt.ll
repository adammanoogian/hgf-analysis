; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg3) local_unnamed_addr #0 {
entry:
  %arg310 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2420
  br i1 %3, label %concatenate.pivot.20., label %copy_fusion.in_bounds-after

copy_fusion.in_bounds-after:                      ; preds = %slice0-after, %slice1-true, %entry
  ret void

concatenate.pivot.20.:                            ; preds = %entry
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %concatenate.pivot.0., label %concatenate.pivot.20.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.20.
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg04, i64 0, i64 %5, i64 0
  br label %concatenate.merge

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.20.
  %7 = trunc nuw nsw i32 %linear_index to i16
  %.lhs.trunc = add nsw i16 %7, -20
  %8 = udiv i16 %.lhs.trunc, 20
  %9 = mul i16 %8, 20
  %.decomposed = sub i16 %.lhs.trunc, %9
  %10 = zext nneg i16 %8 to i64
  %11 = zext nneg i16 %.decomposed to i64
  %12 = getelementptr inbounds [120 x [20 x [1 x double]]], ptr addrspace(1) %arg16, i64 0, i64 %10, i64 %11, i64 0
  %.pre = zext nneg i32 %linear_index to i64
  br label %concatenate.merge

concatenate.merge:                                ; preds = %concatenate.pivot.20.1, %concatenate.pivot.0.
  %.pre-phi = phi i64 [ %.pre, %concatenate.pivot.20.1 ], [ %5, %concatenate.pivot.0. ]
  %.in = phi ptr addrspace(1) [ %6, %concatenate.pivot.0. ], [ %12, %concatenate.pivot.20.1 ]
  %13 = icmp ult i32 %linear_index, 20
  %14 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !9
  %15 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg28, i64 0, i64 %.pre-phi
  br i1 %13, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %16 = icmp ugt i32 %linear_index, 19
  %17 = add nsw i32 %linear_index, -20
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds [2400 x double], ptr addrspace(1) %arg310, i64 0, i64 %18
  br i1 %16, label %slice1-true, label %copy_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  store double %14, ptr addrspace(1) %15, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double %14, ptr addrspace(1) %19, align 8
  br label %copy_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = zext nneg i16 %3 to i64
  %5 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg13, i64 0, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !9
  %7 = zext nneg i32 %linear_index to i64
  %8 = getelementptr double, ptr addrspace(1) %arg01, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !9
  %multiply.3.1 = fmul double %6, %9
  %10 = getelementptr double, ptr addrspace(1) %arg25, i64 %7
  store double %multiply.3.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg4) local_unnamed_addr #2 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !11
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %4 = udiv i32 %linear_index_base, 192
  %.lhs.trunc = trunc nuw nsw i32 %4 to i16
  %5 = urem i16 %.lhs.trunc, 20
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %6 = zext nneg i32 %4 to i64
  %7 = getelementptr inbounds double, ptr addrspace(1) %arg316, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !9
  %9 = urem i32 %linear_index_base, 3840
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds double, ptr addrspace(1) %arg214, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 16, !invariant.load !9
  %multiply.4.1 = fmul double %8, %12
  %13 = zext nneg i16 %5 to i64
  %14 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg112, i64 0, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !9
  %16 = zext nneg i32 %linear_index_base to i64
  %17 = getelementptr double, ptr addrspace(1) %arg010, i64 %16
  %18 = load <2 x double>, ptr addrspace(1) %17, align 16, !invariant.load !9
  %19 = extractelement <2 x double> %18, i32 0
  %20 = extractelement <2 x double> %18, i32 1
  %multiply.5.1 = fmul double %15, %19
  %add.1.1 = fadd double %multiply.4.1, %multiply.5.1
  %21 = getelementptr double, ptr addrspace(1) %arg418, i64 %16
  %22 = urem i32 %linear_index1, 3840
  %23 = zext nneg i32 %22 to i64
  %24 = getelementptr inbounds double, ptr addrspace(1) %arg214, i64 %23
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !9
  %multiply.4.11 = fmul double %8, %25
  %multiply.5.12 = fmul double %15, %20
  %add.1.13 = fadd double %multiply.4.11, %multiply.5.12
  %26 = insertelement <2 x double> poison, double %add.1.1, i32 0
  %27 = insertelement <2 x double> %26, double %add.1.13, i32 1
  store <2 x double> %27, ptr addrspace(1) %21, align 32
  %28 = urem i32 %linear_index2, 3840
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr inbounds double, ptr addrspace(1) %arg214, i64 %29
  %31 = load double, ptr addrspace(1) %30, align 16, !invariant.load !9
  %multiply.4.14 = fmul double %8, %31
  %32 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 16
  %33 = load <2 x double>, ptr addrspace(1) %32, align 16, !invariant.load !9
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %multiply.5.15 = fmul double %15, %34
  %add.1.16 = fadd double %multiply.4.14, %multiply.5.15
  %36 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 16
  %37 = urem i32 %linear_index3, 3840
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr inbounds double, ptr addrspace(1) %arg214, i64 %38
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !9
  %multiply.4.17 = fmul double %8, %40
  %multiply.5.18 = fmul double %15, %35
  %add.1.19 = fadd double %multiply.4.17, %multiply.5.18
  %41 = insertelement <2 x double> poison, double %add.1.16, i32 0
  %42 = insertelement <2 x double> %41, double %add.1.19, i32 1
  store <2 x double> %42, ptr addrspace(1) %36, align 16
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}
!llvm.module.flags = !{!6}

!0 = !{ptr @copy_fusion, !"kernel", i32 1}
!1 = !{ptr @copy_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!4 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!6 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!7 = !{i32 0, i32 19}
!8 = !{i32 0, i32 128}
!9 = !{}
!10 = !{i32 0, i32 30}
!11 = !{i32 0, i32 900}
