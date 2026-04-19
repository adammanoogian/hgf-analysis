; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_150_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion_6(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5) local_unnamed_addr #0 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = icmp ult i32 %0, 4
  br i1 %1, label %concatenate.pivot.0., label %concatenate.pivot.8.

copy_fusion.6.in_bounds-after:                    ; preds = %slice1-after, %slice2-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg03, i64 0, i64 0, i64 %2
  br label %concatenate.merge

concatenate.pivot.8.:                             ; preds = %entry
  %4 = icmp ult i32 %0, 8
  br i1 %4, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  %5 = add nsw i32 %0, -4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg15, i64 0, i64 0, i64 %6
  br label %concatenate.merge

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  %8 = add nsw i32 %0, -8
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [1 x [4 x [1 x double]]], ptr addrspace(1) %arg27, i64 0, i64 0, i64 %9, i64 0
  br label %concatenate.merge

concatenate.merge:                                ; preds = %concatenate.pivot.8.2, %concatenate.pivot.4.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %3, %concatenate.pivot.0. ], [ %7, %concatenate.pivot.4.1 ], [ %10, %concatenate.pivot.8.2 ]
  %11 = icmp ult i32 %0, 4
  %12 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !52
  %13 = zext nneg i32 %0 to i64
  %14 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg39, i64 0, i64 %13
  br i1 %11, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %15 = and i32 %0, 12
  %16 = icmp eq i32 %15, 4
  %17 = add nsw i32 %0, -4
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg411, i64 0, i64 %18
  br i1 %16, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %20 = icmp ugt i32 %0, 7
  %21 = add nsw i32 %0, -8
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg513, i64 0, i64 %22
  br i1 %20, label %slice2-true, label %copy_fusion.6.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  store double %12, ptr addrspace(1) %14, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double %12, ptr addrspace(1) %19, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double %12, ptr addrspace(1) %23, align 8
  br label %copy_fusion.6.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7) local_unnamed_addr #0 {
entry:
  %arg741 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg639 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg537 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg435 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg333 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg231 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg129 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg027 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !53
  %1 = icmp ult i32 %0, 4
  %2 = add nsw i32 %0, -4
  %.sink25 = select i1 %1, i32 %0, i32 %2
  %arg0.sink24 = select i1 %1, ptr addrspace(1) %arg027, ptr addrspace(1) %arg231
  %3 = zext nneg i32 %.sink25 to i64
  %4 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg0.sink24, i64 0, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !52
  %arg3.sink = select i1 %1, ptr addrspace(1) %arg129, ptr addrspace(1) %arg333
  %6 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3.sink, i64 0, i64 %3
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !52
  %8 = zext nneg i32 %0 to i64
  %9 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg129, i64 0, i64 %8
  %10 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg027, i64 0, i64 %8
  %11 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg537, i64 0, i64 %8
  %12 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg435, i64 0, i64 %8
  br i1 %1, label %slice0-true, label %slice1-after

copy_fusion.7.in_bounds-after:                    ; preds = %slice1-after, %slice2-true
  ret void

slice1-after:                                     ; preds = %entry, %slice0-true
  %13 = icmp ugt i32 %0, 3
  %14 = zext nneg i32 %2 to i64
  %15 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg741, i64 0, i64 %14
  %16 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg639, i64 0, i64 %14
  br i1 %13, label %slice2-true, label %copy_fusion.7.in_bounds-after

slice0-true:                                      ; preds = %entry
  %17 = load double, ptr addrspace(1) %9, align 8, !invariant.load !52
  %18 = load double, ptr addrspace(1) %10, align 8, !invariant.load !52
  store double %18, ptr addrspace(1) %12, align 8
  store double %17, ptr addrspace(1) %11, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double %5, ptr addrspace(1) %16, align 8
  store double %7, ptr addrspace(1) %15, align 8
  br label %copy_fusion.7.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !52
  %1 = icmp slt i64 %0, 192
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !52
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  store i64 %4, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_3(ptr noalias nocapture align 128 dereferenceable(8) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128
  %1 = add i64 %0, 1
  store i64 %1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_dynamic_slice(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !52
  %1 = trunc i64 %0 to i32
  %2 = tail call i32 @llvm.smax.i32(i32 %1, i32 0)
  %3 = tail call i32 @llvm.umin.i32(i32 %2, i32 191)
  %4 = zext nneg i32 %3 to i64
  %5 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg01, i64 0, i64 %4
  %6 = load i32, ptr addrspace(1) %5, align 4, !invariant.load !52
  store i32 %6, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_dynamic_slice_1(ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !52
  %1 = trunc i64 %0 to i32
  %2 = tail call i32 @llvm.smax.i32(i32 %1, i32 0)
  %3 = tail call i32 @llvm.umin.i32(i32 %2, i32 191)
  %4 = zext nneg i32 %3 to i64
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !52
  store double %6, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !52
  %2 = trunc i64 %1 to i32
  %3 = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  %4 = tail call i32 @llvm.umin.i32(i32 %3, i32 191)
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 %6
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !52
  %9 = getelementptr i8, ptr addrspace(1) %arg25, i64 %6
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !52
  %2 = trunc i64 %1 to i32
  %3 = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  %4 = tail call i32 @llvm.umin.i32(i32 %3, i32 191)
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !52
  %9 = getelementptr double, ptr addrspace(1) %arg25, i64 %6
  store double %8, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg26) local_unnamed_addr #2 {
entry:
  %arg2674 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2572 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2470 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2368 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2266 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2164 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2062 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1960 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1858 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1756 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1654 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1552 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1450 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1348 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1246 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1144 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1042 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg940 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg838 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg736 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg634 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg532 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg430 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg328 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg226 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg124 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg022 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = load i64, ptr addrspace(1) %arg226, align 128, !invariant.load !52
  %2 = trunc i64 %1 to i32
  %3 = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  %4 = tail call i32 @llvm.umin.i32(i32 %3, i32 191)
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg736, i64 0, i64 %5, i64 %6
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !52
  %9 = getelementptr double, ptr addrspace(1) %arg022, i64 %6
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !52
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, double %10, double 0.000000e+00
  %13 = getelementptr double, ptr addrspace(1) %arg1960, i64 %6
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !52
  %15 = select i1 %11, double %14, double 0.000000e+00
  %16 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1858, i64 0, i64 %5, i64 %6
  %17 = load i8, ptr addrspace(1) %16, align 1, !invariant.load !52
  %18 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1756, i64 0, i64 %5, i64 %6
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !52
  %20 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg2368, i64 0, i64 %5, i64 %6
  %21 = load i8, ptr addrspace(1) %20, align 1, !invariant.load !52
  %22 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg2266, i64 0, i64 %5, i64 %6
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !52
  %24 = icmp eq i32 %23, 1
  %25 = getelementptr double, ptr addrspace(1) %arg2164, i64 %6
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !52
  %27 = trunc i8 %21 to i1
  %28 = select i1 %27, i1 %24, i1 false
  %29 = select i1 %28, i1 %11, i1 false
  %30 = select i1 %29, double %26, double 0.000000e+00
  %31 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2062, i64 0, i64 %5, i64 %6
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !52
  %multiply.1165.1.clone.1 = fmul double %32, %30
  %33 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1654, i64 0, i64 %5, i64 %6
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !52
  %multiply.1168.5.clone.1 = fmul double %34, %multiply.1165.1.clone.1
  %35 = fmul double %19, %multiply.1165.1.clone.1
  %add.682.5.clone.1 = fsub double %multiply.1168.5.clone.1, %35
  %36 = trunc i8 %17 to i1
  %37 = select i1 %36, double %add.682.5.clone.1, double 0.000000e+00
  %38 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1552, i64 0, i64 %5, i64 %6
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !52
  %40 = getelementptr double, ptr addrspace(1) %arg1450, i64 %6
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !52
  %42 = select i1 %11, double %41, double 0.000000e+00
  %43 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1348, i64 0, i64 %5, i64 %6
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !52
  %multiply.1169.27.clone.1 = fmul double %42, %44
  %45 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1246, i64 0, i64 %5, i64 %6
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !52
  %multiply.1170.5.clone.1 = fmul double %multiply.1169.27.clone.1, %46
  %multiply.1171.1.clone.1 = fmul double %39, %multiply.1170.5.clone.1
  %add.683.3.clone.1 = fadd double %37, %multiply.1171.1.clone.1
  %add.684.1.clone.1 = fadd double %15, %add.683.3.clone.1
  %47 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg328, i64 0, i64 %5, i64 %6
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !52
  %49 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg532, i64 0, i64 %5, i64 %6
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !52
  %51 = fneg double %add.684.1.clone.1
  %52 = fmul double %48, %51
  %53 = fmul double %50, %52
  %add.685.3 = fadd double %12, %53
  %54 = getelementptr double, ptr addrspace(1) %arg1042, i64 %6
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !52
  %56 = getelementptr inbounds [192 x [1 x [4 x double]]], ptr addrspace(1) %arg1144, i64 0, i64 %5, i64 0, i64 %6
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !52
  %add.681.9 = fadd double %55, %57
  %58 = select i1 %11, double %add.681.9, double 0.000000e+00
  %59 = getelementptr double, ptr addrspace(1) %arg940, i64 %6
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !52
  %61 = select i1 %11, double %60, double 0.000000e+00
  %multiply.1174.8 = fmul double %50, %add.684.1.clone.1
  %62 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg838, i64 0, i64 %5, i64 %6
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !52
  %multiply.1175.9 = fmul double %multiply.1174.8, %63
  %add.686.9 = fadd double %61, %multiply.1175.9
  %add.687.5 = fadd double %58, %add.686.9
  %64 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg634, i64 0, i64 %5, i64 %6
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !52
  %66 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg430, i64 0, i64 %5, i64 %6
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !52
  %68 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg124, i64 0, i64 %5, i64 %6
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !52
  %70 = fneg double %add.687.5
  %71 = fmul double %65, %70
  %72 = fmul double %67, %71
  %73 = fmul double %69, %72
  %add.688.1 = fadd double %add.685.3, %73
  %74 = getelementptr double, ptr addrspace(1) %arg2470, i64 %6
  store double %add.688.1, ptr addrspace(1) %74, align 8
  %75 = getelementptr double, ptr addrspace(1) %arg2572, i64 %6
  store double %add.684.1.clone.1, ptr addrspace(1) %75, align 8
  %76 = getelementptr double, ptr addrspace(1) %arg2674, i64 %6
  store double %multiply.1165.1.clone.1, ptr addrspace(1) %76, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg27, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg38) local_unnamed_addr #2 {
entry:
  %arg38119 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37117 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36115 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35113 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34111 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33109 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32107 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31105 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30103 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29101 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2899 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2797 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2695 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2593 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2491 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2389 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2287 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2185 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2083 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1981 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1879 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1777 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1675 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1573 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1471 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1369 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1267 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1165 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1063 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg961 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg859 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg757 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg655 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg553 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg451 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg349 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg247 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg145 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg043 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !55
  %1 = lshr i32 %0, 2
  %2 = and i32 %0, 3
  %3 = load i64, ptr addrspace(1) %arg349, align 128, !invariant.load !52
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = zext nneg i32 %2 to i64
  %9 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1777, i64 0, i64 %7, i64 %8
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !52
  %11 = zext nneg i32 %0 to i64
  %12 = getelementptr double, ptr addrspace(1) %arg043, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !52
  %14 = trunc i8 %10 to i1
  %15 = select i1 %14, double %13, double 0.000000e+00
  %16 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg2695, i64 0, i64 %7, i64 %8
  %17 = load i8, ptr addrspace(1) %16, align 1, !invariant.load !52
  %18 = zext nneg i32 %1 to i64
  %19 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg2593, i64 0, i64 %7, i64 %18, i64 %8
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !52
  %21 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg2185, i64 0, i64 0, i64 %8
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !52
  %23 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2491, i64 0, i64 %7, i64 %8
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !52
  %25 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg29101, i64 0, i64 %7, i64 %8
  %26 = load i8, ptr addrspace(1) %25, align 1, !invariant.load !52
  %27 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg2899, i64 0, i64 %7, i64 %8
  %28 = load i32, ptr addrspace(1) %27, align 4, !invariant.load !52
  %29 = icmp eq i32 %28, 1
  %30 = getelementptr double, ptr addrspace(1) %arg2797, i64 %11
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !52
  %32 = trunc i8 %26 to i1
  %33 = select i1 %32, i1 %29, i1 false
  %34 = select i1 %33, i1 %14, i1 false
  %35 = select i1 %34, double %31, double 0.000000e+00
  %36 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2389, i64 0, i64 %7, i64 %8
  %37 = load double, ptr addrspace(1) %36, align 8, !invariant.load !52
  %multiply.1180.25 = fmul double %37, %35
  %38 = fneg double %multiply.1180.25
  %multiply.1181.7 = fmul double %24, %38
  %39 = fmul double %20, %22
  %add.689.11 = fsub double %multiply.1181.7, %39
  %40 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg2287, i64 0, i64 %7, i64 %18, i64 %8
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !52
  %multiply.1182.9 = fmul double %22, %41
  %42 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2083, i64 0, i64 %7, i64 %8
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !52
  %multiply.1183.7 = fmul double %43, %multiply.1180.25
  %add.690.7 = fadd double %multiply.1182.9, %multiply.1183.7
  %add.691.9 = fadd double %add.689.11, %add.690.7
  %44 = trunc i8 %17 to i1
  %45 = select i1 %44, double %add.691.9, double 0.000000e+00
  %46 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg1981, i64 0, i64 %7, i64 %18, i64 %8
  %47 = load double, ptr addrspace(1) %46, align 8, !invariant.load !52
  %48 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg32107, i64 0, i64 0, i64 %8
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !52
  %50 = select i1 %14, double %49, double 0.000000e+00
  %51 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg31105, i64 0, i64 %7, i64 %8
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !52
  %multiply.1169.29 = fmul double %50, %52
  %53 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg33109, i64 0, i64 %7, i64 %8
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !52
  %multiply.1170.7 = fmul double %multiply.1169.29, %54
  %multiply.1184.9 = fmul double %47, %multiply.1170.7
  %55 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1879, i64 0, i64 %7, i64 %8
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !52
  %57 = getelementptr double, ptr addrspace(1) %arg34111, i64 %11
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !52
  %59 = select i1 %14, double %58, double 0.000000e+00
  %multiply.1185.11 = fmul double %52, %59
  %multiply.1187.7 = fmul double %54, %multiply.1185.11
  %60 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg30103, i64 0, i64 %7, i64 %18, i64 %8
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !52
  %multiply.1188.7 = fmul double %multiply.1169.29, %61
  %add.692.5 = fadd double %multiply.1188.7, %multiply.1187.7
  %multiply.1189.7 = fmul double %56, %add.692.5
  %add.693.7 = fadd double %multiply.1184.9, %multiply.1189.7
  %add.695.5 = fadd double %45, %add.693.7
  %62 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1573, i64 0, i64 %7, i64 %8
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !52
  %multiply.1190.11 = fmul double %63, %add.695.5
  %64 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg145, i64 0, i64 0, i64 %8
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !52
  %66 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg553, i64 0, i64 %7, i64 %18, i64 %8
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !52
  %multiply.1192.3 = fmul double %65, %67
  %add.696.9 = fadd double %multiply.1192.3, %multiply.1190.11
  %68 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1675, i64 0, i64 %7, i64 %8
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !52
  %multiply.1193.7 = fmul double %69, %add.696.9
  %multiply.1172.3 = fmul double %63, %65
  %70 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg655, i64 0, i64 %7, i64 %18, i64 %8
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !52
  %multiply.1194.3 = fmul double %multiply.1172.3, %71
  %add.697.5 = fadd double %multiply.1194.3, %multiply.1193.7
  %add.698.3 = fsub double %15, %add.697.5
  %72 = getelementptr double, ptr addrspace(1) %arg961, i64 %11
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !52
  %74 = getelementptr inbounds [192 x [1 x [24 x [4 x double]]]], ptr addrspace(1) %arg859, i64 0, i64 %7, i64 0, i64 %18, i64 %8
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !52
  %add.699.9 = fadd double %73, %75
  %76 = select i1 %14, double %add.699.9, double 0.000000e+00
  %multiply.1195.11 = fmul double %65, %71
  %multiply.1197.7 = fmul double %69, %add.695.5
  %add.700.9 = fadd double %multiply.1195.11, %multiply.1197.7
  %77 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1369, i64 0, i64 %7, i64 %8
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !52
  %multiply.1198.7 = fmul double %add.700.9, %78
  %multiply.1174.1 = fmul double %65, %69
  %79 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg1063, i64 0, i64 %7, i64 %18, i64 %8
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !52
  %multiply.1200.7 = fmul double %multiply.1174.1, %80
  %add.701.5 = fadd double %multiply.1198.7, %multiply.1200.7
  %add.702.5 = fadd double %76, %add.701.5
  %81 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1471, i64 0, i64 %7, i64 %8
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !52
  %multiply.1202.7 = fmul double %82, %add.702.5
  %83 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg36115, i64 0, i64 0, i64 %8
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !52
  %85 = getelementptr inbounds [192 x [1 x [4 x double]]], ptr addrspace(1) %arg37117, i64 0, i64 %7, i64 0, i64 %8
  %86 = load double, ptr addrspace(1) %85, align 8, !invariant.load !52
  %add.681.13 = fadd double %84, %86
  %87 = select i1 %14, double %add.681.13, double 0.000000e+00
  %88 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg35113, i64 0, i64 %8
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !52
  %90 = select i1 %14, double %89, double 0.000000e+00
  %multiply.1175.13 = fmul double %multiply.1174.1, %78
  %add.686.13 = fadd double %multiply.1175.13, %90
  %add.687.9 = fadd double %87, %add.686.13
  %91 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg757, i64 0, i64 %7, i64 %18, i64 %8
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !52
  %multiply.1203.7 = fmul double %92, %add.687.9
  %add.703.5 = fadd double %multiply.1202.7, %multiply.1203.7
  %93 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1267, i64 0, i64 %7, i64 %8
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !52
  %multiply.1205.11 = fmul double %94, %add.703.5
  %multiply.1176.7 = fmul double %82, %add.687.9
  %95 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg451, i64 0, i64 %7, i64 %18, i64 %8
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !52
  %multiply.1206.3 = fmul double %96, %multiply.1176.7
  %add.704.9 = fadd double %multiply.1206.3, %multiply.1205.11
  %97 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1165, i64 0, i64 %7, i64 %8
  %98 = load double, ptr addrspace(1) %97, align 8, !invariant.load !52
  %multiply.1207.7 = fmul double %98, %add.704.9
  %multiply.1177.3 = fmul double %94, %multiply.1176.7
  %99 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg247, i64 0, i64 %7, i64 %18, i64 %8
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !52
  %multiply.1208.3 = fmul double %multiply.1177.3, %100
  %add.705.5 = fadd double %multiply.1208.3, %multiply.1207.7
  %add.706.1 = fsub double %add.698.3, %add.705.5
  %101 = getelementptr double, ptr addrspace(1) %arg38119, i64 %11
  store double %add.706.1, ptr addrspace(1) %101, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_3(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !55
  %1 = lshr i32 %0, 2
  %2 = and i32 %0, 3
  %3 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !52
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = zext nneg i32 %1 to i64
  %9 = zext nneg i32 %2 to i64
  %10 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg02, i64 0, i64 %7, i64 %8, i64 %9
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !52
  %12 = zext nneg i32 %0 to i64
  %13 = getelementptr double, ptr addrspace(1) %arg26, i64 %12
  store double %11, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg8) local_unnamed_addr #2 {
entry:
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !52
  %4 = load double, ptr addrspace(1) %arg49, align 128, !invariant.load !52
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !52
  %7 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !52
  %9 = fneg double %6
  %10 = fmul double %8, %9
  %multiply.1150.5.clone.1 = fmul double %4, %10
  %11 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !52
  %multiply.1151.1.clone.1 = fmul double %12, %multiply.1150.5.clone.1
  %multiply.1152.1 = fmul double %3, %multiply.1151.1.clone.1
  %13 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !52
  %15 = fneg double %10
  %16 = fmul double %14, %15
  %17 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %multiply.1152.1, ptr addrspace(1) %17, align 8
  %18 = getelementptr double, ptr addrspace(1) %arg715, i64 %1
  store double %multiply.1151.1.clone.1, ptr addrspace(1) %18, align 8
  %19 = getelementptr double, ptr addrspace(1) %arg817, i64 %1
  store double %16, ptr addrspace(1) %19, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !55
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg12) local_unnamed_addr #2 {
entry:
  %arg1225 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1123 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1021 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !55
  %1 = and i32 %0, 3
  %2 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !52
  %3 = zext nneg i32 %0 to i64
  %4 = getelementptr double, ptr addrspace(1) %arg613, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !52
  %6 = zext nneg i32 %1 to i64
  %7 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg511, i64 0, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !52
  %multiply.1153.7 = fmul double %5, %8
  %9 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg49, i64 0, i64 0, i64 %6
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !52
  %11 = getelementptr double, ptr addrspace(1) %arg37, i64 %3
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !52
  %multiply.1154.7 = fmul double %10, %12
  %add.676.5 = fadd double %multiply.1153.7, %multiply.1154.7
  %13 = fneg double %add.676.5
  %multiply.1157.3 = fmul double %2, %13
  %14 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg25, i64 0, i64 %6
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !52
  %multiply.1158.3 = fmul double %15, %multiply.1157.3
  %16 = fneg double %10
  %17 = fmul double %8, %16
  %multiply.1150.3 = fmul double %2, %17
  %18 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !52
  %multiply.1159.3 = fmul double %multiply.1150.3, %19
  %add.678.1 = fadd double %multiply.1159.3, %multiply.1158.3
  %20 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg715, i64 0, i64 %6
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !52
  %multiply.1160.1.clone.1 = fmul double %21, %add.678.1
  %22 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg919, i64 0, i64 %6
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !52
  %24 = getelementptr double, ptr addrspace(1) %arg817, i64 %3
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !52
  %multiply.1156.5.clone.1 = fmul double %17, %25
  %26 = fmul double %add.676.5, %23
  %add.677.3.clone.1 = fsub double %multiply.1156.5.clone.1, %26
  %27 = fneg double %add.677.3.clone.1
  %28 = getelementptr double, ptr addrspace(1) %arg1021, i64 %3
  store double %add.678.1, ptr addrspace(1) %28, align 8
  %29 = getelementptr double, ptr addrspace(1) %arg1123, i64 %3
  store double %multiply.1160.1.clone.1, ptr addrspace(1) %29, align 8
  %30 = getelementptr double, ptr addrspace(1) %arg1225, i64 %3
  store double %27, ptr addrspace(1) %30, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !52
  %4 = getelementptr i8, ptr addrspace(1) %arg37, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !52
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !52
  %8 = trunc i8 %5 to i1
  %9 = select i1 %8, double %7, double 0.000000e+00
  %10 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !52
  %multiply.1161.1 = fmul double %9, %10
  %multiply.1162.1 = fmul double %3, %multiply.1161.1
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.1162.1, ptr addrspace(1) %11, align 8
  %12 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %9, ptr addrspace(1) %12, align 8
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !55
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg5) local_unnamed_addr #2 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !55
  %1 = and i32 %0, 3
  %2 = zext nneg i32 %1 to i64
  %3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %arg13, i64 0, i64 %2
  %4 = load i8, ptr addrspace(1) %3, align 1, !invariant.load !52
  %5 = zext nneg i32 %0 to i64
  %6 = getelementptr double, ptr addrspace(1) %arg01, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !52
  %8 = trunc i8 %4 to i1
  %9 = select i1 %8, double %7, double 0.000000e+00
  %10 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg37, i64 0, i64 %2
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !52
  %12 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !52
  %multiply.1163.1.clone.1 = fmul double %9, %12
  %multiply.1164.1.clone.1 = fmul double %11, %multiply.1163.1.clone.1
  %13 = getelementptr double, ptr addrspace(1) %arg49, i64 %5
  store double %9, ptr addrspace(1) %13, align 8
  %14 = getelementptr double, ptr addrspace(1) %arg511, i64 %5
  store double %multiply.1164.1.clone.1, ptr addrspace(1) %14, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg3, ptr noalias nocapture align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg25, ptr noalias nocapture align 128 dereferenceable(32) %arg26, ptr noalias nocapture align 128 dereferenceable(32) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg30, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg31) local_unnamed_addr #2 {
entry:
  %arg3182 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3080 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2978 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2876 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2774 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2672 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2570 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2468 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2366 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2264 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2162 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2060 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1958 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1856 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1754 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1652 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1550 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1448 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1346 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1244 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1142 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1040 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg938 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg836 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg734 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg632 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg530 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg428 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg326 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg224 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg122 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg020 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = load i64, ptr addrspace(1) %arg224, align 128, !invariant.load !52
  %2 = trunc i64 %1 to i32
  %3 = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  %4 = tail call i32 @llvm.umin.i32(i32 %3, i32 191)
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1142, i64 0, i64 %5, i64 %6
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !52
  %9 = getelementptr double, ptr addrspace(1) %arg530, i64 %6
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !52
  %11 = getelementptr inbounds [192 x [1 x [4 x double]]], ptr addrspace(1) %arg632, i64 0, i64 %5, i64 0, i64 %6
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !52
  %add.681.5 = fadd double %10, %12
  %13 = trunc i8 %8 to i1
  %14 = select i1 %13, double 0.000000e+00, double %add.681.5
  %15 = getelementptr double, ptr addrspace(1) %arg020, i64 %6
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !52
  %17 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg326, i64 0, i64 %5, i64 %6
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !52
  %19 = getelementptr double, ptr addrspace(1) %arg428, i64 %6
  %20 = load double, ptr addrspace(1) %19, align 8
  %21 = select i1 %13, double %20, double 0.000000e+00
  %22 = getelementptr double, ptr addrspace(1) %arg734, i64 %6
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !52
  %24 = select i1 %13, double %23, double 0.000000e+00
  %25 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1040, i64 0, i64 %5, i64 %6
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !52
  %27 = getelementptr double, ptr addrspace(1) %arg938, i64 %6
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !52
  %multiply.1174.4 = fmul double %26, %28
  %29 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg836, i64 0, i64 %5, i64 %6
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !52
  %multiply.1175.3 = fmul double %multiply.1174.4, %30
  %add.686.3 = fadd double %24, %multiply.1175.3
  %add.707.3 = fsub double %21, %add.686.3
  %31 = select i1 %13, double %add.681.5, double 0.000000e+00
  %add.687.3 = fadd double %31, %add.686.3
  %add.708.5 = fadd double %16, %add.687.3
  %add.709.3 = fadd double %add.707.3, %add.708.5
  %32 = getelementptr double, ptr addrspace(1) %arg1958, i64 %6
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !52
  %34 = select i1 %13, double %33, double 0.000000e+00
  %add.710.7 = fadd double %16, %34
  %35 = getelementptr double, ptr addrspace(1) %arg1856, i64 %6
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !52
  %37 = select i1 %13, double %36, double 0.000000e+00
  %38 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1754, i64 0, i64 %5, i64 %6
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !52
  %multiply.1210.15 = fmul double %39, %add.687.3
  %40 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1652, i64 0, i64 %5
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !52
  %multiply.1211.15 = fmul double %multiply.1210.15, %41
  %add.711.13 = fadd double %16, %multiply.1211.15
  %add.712.11 = fadd double %37, %add.711.13
  %42 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1550, i64 0, i64 %5, i64 %6
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !52
  %44 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1448, i64 0, i64 %5
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !52
  %46 = fneg double %add.712.11
  %47 = fdiv double %46, %43
  %48 = fmul double %45, %47
  %add.713.9 = fadd double %add.710.7, %48
  %49 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1346, i64 0, i64 %5, i64 %6
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !52
  %51 = getelementptr double, ptr addrspace(1) %arg2774, i64 %6
  %52 = load double, ptr addrspace(1) %51, align 8
  %53 = getelementptr double, ptr addrspace(1) %arg2672, i64 %6
  %54 = load double, ptr addrspace(1) %53, align 8
  %55 = fadd double %52, %54
  %add.714.3.clone.1 = select i1 %13, double %55, double 0.000000e+00
  %56 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2570, i64 0, i64 %5, i64 %6
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !52
  %58 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2468, i64 0, i64 %5, i64 %6
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !52
  %multiply.1176.3.clone.1 = fmul double %add.687.3, %59
  %60 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2366, i64 0, i64 %5, i64 %6
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !52
  %divide.53.3.clone.1 = fdiv double %multiply.1176.3.clone.1, %61
  %multiply.1213.1.clone.1 = fmul double %57, %divide.53.3.clone.1
  %62 = getelementptr double, ptr addrspace(1) %arg2264, i64 %6
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !52
  %add.715.1.clone.1 = fadd double %63, %multiply.1213.1.clone.1
  %add.716.3.clone.1 = fadd double %add.714.3.clone.1, %add.715.1.clone.1
  %add.717.3.clone.1 = fadd double %16, %add.716.3.clone.1
  %64 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2162, i64 0, i64 %5, i64 %6
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !52
  %66 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2060, i64 0, i64 %5, i64 %6
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !52
  %68 = fmul double %65, %46
  %69 = fmul double %68, %67
  %add.718.1.clone.1 = fadd double %69, %add.717.3.clone.1
  %70 = fmul double %50, %add.718.1.clone.1
  %add.719.7 = fsub double %add.713.9, %70
  %71 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1244, i64 0, i64 %5, i64 %6
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !52
  %multiply.1219.5 = fmul double %72, %add.718.1.clone.1
  %add.720.5 = fadd double %multiply.1219.5, %add.719.7
  %73 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg122, i64 0, i64 %5, i64 %6
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !52
  %multiply.1220.5 = fmul double %74, %add.720.5
  %add.721.3 = fadd double %add.709.3, %multiply.1220.5
  %multiply.1221.3 = fmul double %18, %add.721.3
  %add.722.3 = fadd double %16, %multiply.1221.3
  %add.723.1 = fadd double %14, %add.722.3
  %75 = select i1 %13, double 0.000000e+00, double %20
  %76 = select i1 %13, double 0.000000e+00, double %36
  %77 = select i1 %13, double 0.000000e+00, double %54
  %78 = select i1 %13, double 0.000000e+00, double %52
  %79 = select i1 %13, double 0.000000e+00, double %33
  %80 = getelementptr double, ptr addrspace(1) %arg2876, i64 %6
  store double %add.723.1, ptr addrspace(1) %80, align 8
  %81 = getelementptr double, ptr addrspace(1) %arg2978, i64 %6
  store double %add.718.1.clone.1, ptr addrspace(1) %81, align 8
  store double %75, ptr addrspace(1) %19, align 8
  %82 = getelementptr double, ptr addrspace(1) %arg3080, i64 %6
  store double %76, ptr addrspace(1) %82, align 8
  store double %77, ptr addrspace(1) %53, align 8
  store double %78, ptr addrspace(1) %51, align 8
  %83 = getelementptr double, ptr addrspace(1) %arg3182, i64 %6
  store double %79, ptr addrspace(1) %83, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_1(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg13, ptr noalias nocapture align 128 dereferenceable(32) %arg14, ptr noalias nocapture align 128 dereferenceable(32) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg19, ptr noalias nocapture align 128 dereferenceable(32) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg27, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg31, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg32, ptr noalias nocapture align 128 dereferenceable(32) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg35, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg37, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg39, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg41, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg43, ptr noalias nocapture align 128 dereferenceable(32) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg45, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg46, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg47, ptr noalias nocapture align 128 dereferenceable(32) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg49, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg50, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg51, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg53, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg55, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg57, ptr noalias nocapture align 128 dereferenceable(32) %arg58, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg59, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg60, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg61, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg62, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg63, ptr noalias nocapture align 128 dereferenceable(32) %arg64, ptr noalias nocapture readnone align 16 dereferenceable(768) %arg65, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg66, ptr noalias nocapture align 128 dereferenceable(32) %arg67, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg68, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg69, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg70, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg71, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg72, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg73, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg74, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg75) local_unnamed_addr #2 {
entry:
  %arg75200 = addrspacecast ptr %arg75 to ptr addrspace(1)
  %arg74198 = addrspacecast ptr %arg74 to ptr addrspace(1)
  %arg73196 = addrspacecast ptr %arg73 to ptr addrspace(1)
  %arg72194 = addrspacecast ptr %arg72 to ptr addrspace(1)
  %arg71192 = addrspacecast ptr %arg71 to ptr addrspace(1)
  %arg70190 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69188 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68186 = addrspacecast ptr %arg68 to ptr addrspace(1)
  %arg67184 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66182 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg64178 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63176 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62174 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61172 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60170 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59168 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58166 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57164 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56162 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55160 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54158 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53156 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52154 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51152 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50150 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49148 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48146 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47144 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46142 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45140 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44138 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg43136 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg42134 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41132 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40130 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39128 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38126 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37124 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36122 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35120 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34118 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33116 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32114 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31112 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30110 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29108 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28106 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27104 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26102 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25100 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2498 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2396 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2294 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2192 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2090 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1988 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1886 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1784 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1682 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1580 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1478 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1376 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1274 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1172 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1070 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg968 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg866 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg764 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg662 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg560 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg458 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg356 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg254 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg152 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg050 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = load i64, ptr addrspace(1) %arg356, align 128, !invariant.load !52
  %2 = trunc i64 %1 to i32
  %3 = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  %4 = tail call i32 @llvm.umin.i32(i32 %3, i32 191)
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg866, i64 0, i64 %5, i64 %6
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !52
  %9 = getelementptr double, ptr addrspace(1) %arg050, i64 %6
  %10 = load double, ptr addrspace(1) %9, align 8
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, double 0.000000e+00, double %10
  %13 = getelementptr double, ptr addrspace(1) %arg152, i64 %6
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !52
  %15 = getelementptr double, ptr addrspace(1) %arg48146, i64 %6
  %16 = load double, ptr addrspace(1) %15, align 8
  %17 = select i1 %11, double %16, double 0.000000e+00
  %18 = getelementptr double, ptr addrspace(1) %arg45140, i64 %6
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !52
  %20 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg47144, i64 0, i64 %5, i64 %6
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !52
  %multiply.1222.1.clone.1 = fmul double %19, %21
  %22 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg46142, i64 0, i64 %5, i64 %6
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !52
  %divide.54.1.clone.1 = fdiv double %19, %23
  %add.724.1.clone.1 = fadd double %multiply.1222.1.clone.1, %divide.54.1.clone.1
  %add.725.3.clone.1 = fadd double %17, %add.724.1.clone.1
  %24 = getelementptr double, ptr addrspace(1) %arg44138, i64 %6
  %25 = load double, ptr addrspace(1) %24, align 8
  %add.726.1.clone.1 = fadd double %25, %add.725.3.clone.1
  %26 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg43136, i64 0, i64 %5, i64 %6
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !52
  %28 = getelementptr double, ptr addrspace(1) %arg58166, i64 %6
  %29 = load double, ptr addrspace(1) %28, align 8
  %30 = select i1 %11, double %29, double 0.000000e+00
  %31 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg41132, i64 0, i64 %5, i64 %6
  %32 = load i8, ptr addrspace(1) %31, align 1, !invariant.load !52
  %33 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg57164, i64 0, i64 %5, i64 %6
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !52
  %35 = getelementptr double, ptr addrspace(1) %arg53156, i64 %6
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !52
  %37 = fneg double %36
  %38 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg56162, i64 0, i64 %5, i64 %6
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !52
  %multiply.1224.5.clone.1 = fmul double %39, %37
  %multiply.1225.1.clone.1 = fmul double %34, %multiply.1224.5.clone.1
  %40 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg55160, i64 0, i64 %5, i64 %6
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !52
  %multiply.1226.6.clone.1 = fmul double %36, %39
  %42 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg54158, i64 0, i64 %5, i64 %6
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !52
  %multiply.1227.5.clone.1 = fmul double %multiply.1226.6.clone.1, %43
  %multiply.1229.9.clone.1 = fmul double %41, %multiply.1227.5.clone.1
  %add.727.9.clone.1 = fadd double %multiply.1225.1.clone.1, %multiply.1229.9.clone.1
  %multiply.1230.9.clone.1 = fmul double %36, 5.000000e-01
  %44 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg52154, i64 0, i64 %5, i64 %6
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !52
  %multiply.1231.5.clone.1 = fmul double %multiply.1230.9.clone.1, %45
  %multiply.1233.7.clone.1 = fmul double %41, %multiply.1231.5.clone.1
  %add.728.7.clone.1 = fadd double %add.727.9.clone.1, %multiply.1233.7.clone.1
  %46 = trunc i8 %32 to i1
  %47 = select i1 %46, double %add.728.7.clone.1, double 0.000000e+00
  %48 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg51152, i64 0, i64 %5, i64 %6
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !52
  %50 = getelementptr double, ptr addrspace(1) %arg1682, i64 %6
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !52
  %52 = select i1 %11, double %51, double 0.000000e+00
  %53 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg38126, i64 0, i64 %5, i64 %6
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !52
  %multiply.1169.25.clone.1 = fmul double %52, %54
  %55 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg50150, i64 0, i64 %5, i64 %6
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !52
  %multiply.1170.3.clone.1 = fmul double %multiply.1169.25.clone.1, %56
  %57 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg49148, i64 0, i64 %5, i64 %6
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !52
  %multiply.1234.5.clone.1 = fmul double %multiply.1170.3.clone.1, %58
  %multiply.1235.1.clone.1 = fmul double %49, %multiply.1234.5.clone.1
  %add.729.5.clone.1 = fadd double %47, %multiply.1235.1.clone.1
  %add.730.3.clone.1 = fadd double %30, %add.729.5.clone.1
  %59 = getelementptr double, ptr addrspace(1) %arg662, i64 %6
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !52
  %add.731.1.clone.1 = fadd double %60, %add.730.3.clone.1
  %multiply.1236.1.clone.1 = fmul double %27, %add.731.1.clone.1
  %add.732.1.clone.1 = fadd double %add.726.1.clone.1, %multiply.1236.1.clone.1
  %61 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg560, i64 0, i64 %5, i64 %6
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !52
  %63 = fneg double %add.732.1.clone.1
  %64 = fmul double %62, %63
  %65 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg458, i64 0, i64 %5, i64 %6
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !52
  %67 = getelementptr double, ptr addrspace(1) %arg764, i64 %6
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !52
  %69 = select i1 %11, double %68, double 0.000000e+00
  %add.733.5 = fadd double %60, %69
  %70 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg254, i64 0, i64 %5, i64 %6
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !52
  %72 = fneg double %add.733.5
  %73 = fmul double %71, %72
  %74 = fmul double %66, %64
  %add.734.5 = fsub double %73, %74
  %add.735.3 = fadd double %14, %add.734.5
  %add.736.1 = fadd double %12, %add.735.3
  %75 = select i1 %11, double 0.000000e+00, double %68
  %76 = getelementptr double, ptr addrspace(1) %arg1478, i64 %6
  %77 = load double, ptr addrspace(1) %76, align 8
  %add.739.3.clone.1.clone.1 = fadd double %77, 0.000000e+00
  %78 = getelementptr double, ptr addrspace(1) %arg968, i64 %6
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !52
  %80 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1376, i64 0, i64 %5
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !52
  %82 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1274, i64 0, i64 %5, i64 %6
  %83 = load i8, ptr addrspace(1) %82, align 1, !invariant.load !52
  %84 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1172, i64 0, i64 %5, i64 %6
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !52
  %multiply.1241.7.clone.1.clone.1 = fmul double %add.731.1.clone.1, %85
  %add.740.7.clone.1.clone.1 = fadd double %64, %multiply.1241.7.clone.1.clone.1
  %86 = trunc i8 %83 to i1
  %87 = select i1 %86, double %add.740.7.clone.1.clone.1, double 0.000000e+00
  %multiply.1243.5.clone.1.clone.1 = fmul double %81, %87
  %88 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1070, i64 0, i64 %5, i64 %6
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !52
  %multiply.1244.2.clone.1.clone.1 = fmul double %89, %multiply.1243.5.clone.1.clone.1
  %add.741.1.clone.1.clone.1 = fadd double %79, %multiply.1244.2.clone.1.clone.1
  %add.742.1.clone.1.clone.1 = fadd double %add.739.3.clone.1.clone.1, %add.741.1.clone.1.clone.1
  %90 = getelementptr double, ptr addrspace(1) %arg1580, i64 %6
  %91 = load double, ptr addrspace(1) %90, align 8
  %92 = select i1 %11, double 0.000000e+00, double %91
  %93 = select i1 %11, double 0.000000e+00, double %51
  %94 = getelementptr double, ptr addrspace(1) %arg1886, i64 %6
  %95 = load double, ptr addrspace(1) %94, align 8, !invariant.load !52
  %96 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1988, i64 0, i64 %5, i64 %6
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !52
  %multiply.1245.1.clone.1.clone.1.clone.1 = fmul double %97, %multiply.1244.2.clone.1.clone.1
  %add.743.3.clone.1.clone.1.clone.1 = fadd double %95, %multiply.1245.1.clone.1.clone.1.clone.1
  %98 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1784, i64 0, i64 %5, i64 %6
  %99 = load double, ptr addrspace(1) %98, align 8, !invariant.load !52
  %100 = select i1 %11, double %91, double 0.000000e+00
  %add.744.3.clone.1.clone.1.clone.1 = fadd double %52, %100
  %add.745.5.clone.1.clone.1.clone.1 = fadd double %60, %add.744.3.clone.1.clone.1.clone.1
  %multiply.1246.3.clone.1.clone.1.clone.1 = fmul double %99, %add.745.5.clone.1.clone.1.clone.1
  %add.746.3.clone.1.clone.1.clone.1 = fadd double %multiply.1246.3.clone.1.clone.1.clone.1, %add.743.3.clone.1.clone.1.clone.1
  %add.747.1.clone.1.clone.1.clone.1 = fadd double %93, %add.746.3.clone.1.clone.1.clone.1
  %101 = getelementptr double, ptr addrspace(1) %arg2090, i64 %6
  %102 = load double, ptr addrspace(1) %101, align 8
  %103 = select i1 %11, double 0.000000e+00, double %102
  %104 = getelementptr double, ptr addrspace(1) %arg2192, i64 %6
  %105 = load double, ptr addrspace(1) %104, align 8, !invariant.load !52
  %106 = select i1 %11, double 0.000000e+00, double %105
  %107 = getelementptr double, ptr addrspace(1) %arg2294, i64 %6
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !52
  %109 = select i1 %11, double 0.000000e+00, double %108
  %110 = getelementptr double, ptr addrspace(1) %arg33116, i64 %6
  %111 = load double, ptr addrspace(1) %110, align 8
  %add.758.3.clone.1.clone.1 = fadd double %111, 0.000000e+00
  %112 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg32114, i64 0, i64 %5, i64 %6
  %113 = load i8, ptr addrspace(1) %112, align 1, !invariant.load !52
  %114 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg31112, i64 0, i64 %5, i64 %6
  %115 = load double, ptr addrspace(1) %114, align 8, !invariant.load !52
  %116 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg30110, i64 0, i64 %5, i64 %6
  %117 = load i32, ptr addrspace(1) %116, align 4, !invariant.load !52
  %118 = icmp eq i32 %117, 0
  %119 = getelementptr double, ptr addrspace(1) %arg29108, i64 %6
  %120 = load double, ptr addrspace(1) %119, align 8, !invariant.load !52
  %121 = select i1 %11, double %120, double 0.000000e+00
  %122 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg28106, i64 0, i64 %5, i64 %6
  %123 = load double, ptr addrspace(1) %122, align 8, !invariant.load !52
  %.neg = fneg double %121
  %124 = select i1 %118, double %.neg, double -0.000000e+00
  %125 = fmul double %123, %124
  %multiply.1256.5.clone.1.clone.1 = fmul double %115, %125
  %126 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg27104, i64 0, i64 %5, i64 %6
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !52
  %multiply.1257.3.clone.1.clone.1 = fmul double %127, %multiply.1256.5.clone.1.clone.1
  %128 = trunc i8 %113 to i1
  %129 = select i1 %128, double %multiply.1257.3.clone.1.clone.1, double 0.000000e+00
  %add.759.5.clone.1.clone.1 = fadd double %60, %129
  %130 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg26102, i64 0, i64 %5, i64 %6
  %131 = load i8, ptr addrspace(1) %130, align 1, !invariant.load !52
  %132 = select i1 %11, double %102, double 0.000000e+00
  %133 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg40130, i64 0, i64 %5, i64 %6
  %134 = load i8, ptr addrspace(1) %133, align 1, !invariant.load !52
  %135 = icmp eq i32 %117, 1
  %136 = trunc i8 %134 to i1
  %137 = select i1 %46, i1 %136, i1 false
  %138 = select i1 %137, i1 %135, i1 false
  %139 = select i1 %138, double %121, double 0.000000e+00
  %140 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg39128, i64 0, i64 %5, i64 %6
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !52
  %142 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg37124, i64 0, i64 %5, i64 %6
  %143 = load double, ptr addrspace(1) %142, align 8, !invariant.load !52
  %144 = fneg double %141
  %145 = fmul double %multiply.1169.25.clone.1, %144
  %146 = fmul double %145, %143
  %multiply.1251.1.clone.1.clone.1 = fmul double %146, 2.000000e+00
  %add.749.3.clone.1.clone.1 = fadd double %139, %multiply.1251.1.clone.1.clone.1
  %add.750.3.clone.1.clone.1 = fadd double %132, %add.749.3.clone.1.clone.1
  %add.751.3.clone.1.clone.1 = fadd double %60, %add.750.3.clone.1.clone.1
  %147 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg36122, i64 0, i64 %5, i64 %6
  %148 = load double, ptr addrspace(1) %147, align 8, !invariant.load !52
  %149 = select i1 %11, double %105, double 0.000000e+00
  %add.752.5.clone.1.clone.1 = fadd double %60, %149
  %multiply.1252.3.clone.1.clone.1 = fmul double %add.752.5.clone.1.clone.1, %148
  %add.753.1.clone.1.clone.1 = fadd double %multiply.1252.3.clone.1.clone.1, %add.751.3.clone.1.clone.1
  %150 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg25100, i64 0, i64 %5, i64 %6
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !52
  %152 = fneg double %add.753.1.clone.1.clone.1
  %153 = fmul double %151, %152
  %154 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2498, i64 0, i64 %5, i64 %6
  %155 = load double, ptr addrspace(1) %154, align 8, !invariant.load !52
  %multiply.1258.11.clone.1.clone.1 = fmul double %add.752.5.clone.1.clone.1, %155
  %add.760.9.clone.1.clone.1 = fadd double %multiply.1258.11.clone.1.clone.1, %153
  %156 = trunc i8 %131 to i1
  %157 = select i1 %156, double %add.760.9.clone.1.clone.1, double 0.000000e+00
  %multiply.1260.5.clone.1.clone.1 = fmul double %81, %157
  %158 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2396, i64 0, i64 %5, i64 %6
  %159 = load double, ptr addrspace(1) %158, align 8, !invariant.load !52
  %multiply.1261.1.clone.1.clone.1 = fmul double %159, %multiply.1260.5.clone.1.clone.1
  %add.761.3.clone.1.clone.1 = fadd double %add.759.5.clone.1.clone.1, %multiply.1261.1.clone.1.clone.1
  %add.762.1.clone.1.clone.1 = fadd double %add.758.3.clone.1.clone.1, %add.761.3.clone.1.clone.1
  %160 = select i1 %11, double 0.000000e+00, double %120
  %161 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg42134, i64 0, i64 %5, i64 %6
  %162 = load double, ptr addrspace(1) %161, align 8, !invariant.load !52
  %163 = fneg double %125
  %164 = fmul double %162, %163
  %165 = select i1 %128, double %164, double 0.000000e+00
  %add.748.5.clone.1 = fadd double %60, %165
  %166 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg35120, i64 0, i64 %5, i64 %6
  %167 = load double, ptr addrspace(1) %166, align 8, !invariant.load !52
  %168 = select i1 %11, double %108, double 0.000000e+00
  %add.754.5.clone.1 = fadd double %60, %168
  %169 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg34118, i64 0, i64 %5, i64 %6
  %170 = load double, ptr addrspace(1) %169, align 8, !invariant.load !52
  %171 = fneg double %add.754.5.clone.1
  %172 = fmul double %170, %171
  %173 = fmul double %167, %153
  %add.755.3.clone.1 = fsub double %172, %173
  %add.756.3.clone.1 = fadd double %add.748.5.clone.1, %add.755.3.clone.1
  %add.757.1.clone.1 = fadd double %160, %add.756.3.clone.1
  %174 = getelementptr double, ptr addrspace(1) %arg64178, i64 %6
  %175 = load double, ptr addrspace(1) %174, align 8
  %add.763.3.clone.1 = fadd double %175, 0.000000e+00
  %176 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg63176, i64 0, i64 %5, i64 %6, i64 0
  %177 = load i8, ptr addrspace(1) %176, align 1, !invariant.load !52
  %178 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg62174, i64 0, i64 %5, i64 %6
  %179 = load double, ptr addrspace(1) %178, align 8, !invariant.load !52
  %multiply.1262.5.clone.1 = fmul double %multiply.1224.5.clone.1, %179
  %multiply.1263.5.clone.1 = fmul double %multiply.1262.5.clone.1, 5.000000e-01
  %180 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg61172, i64 0, i64 %5, i64 %6
  %181 = load double, ptr addrspace(1) %180, align 8, !invariant.load !52
  %multiply.1264.9.clone.1 = fmul double %181, %multiply.1263.5.clone.1
  %multiply.1266.7.clone.1 = fmul double %multiply.1227.5.clone.1, %179
  %add.764.7.clone.1 = fadd double %multiply.1266.7.clone.1, %multiply.1264.9.clone.1
  %multiply.1267.5.clone.1 = fmul double %multiply.1231.5.clone.1, %179
  %add.765.5.clone.1 = fadd double %multiply.1267.5.clone.1, %add.764.7.clone.1
  %182 = trunc i8 %177 to i1
  %183 = select i1 %182, double %add.765.5.clone.1, double 0.000000e+00
  %184 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg60170, i64 0, i64 %5, i64 %6
  %185 = load double, ptr addrspace(1) %184, align 8, !invariant.load !52
  %multiply.1269.1.clone.1 = fmul double %multiply.1234.5.clone.1, %185
  %add.766.3.clone.1 = fadd double %multiply.1269.1.clone.1, %183
  %186 = getelementptr double, ptr addrspace(1) %arg59168, i64 %6
  %187 = load double, ptr addrspace(1) %186, align 8, !invariant.load !52
  %add.767.3.clone.1 = fadd double %187, %add.766.3.clone.1
  %add.768.1.clone.1 = fadd double %add.763.3.clone.1, %add.767.3.clone.1
  %188 = select i1 %11, double 0.000000e+00, double %29
  %189 = getelementptr double, ptr addrspace(1) %arg66182, i64 %6
  %190 = load double, ptr addrspace(1) %189, align 8, !invariant.load !52
  %191 = select i1 %11, double 0.000000e+00, double %190
  %add.737.1.clone.1 = fadd double %60, %191
  %192 = getelementptr double, ptr addrspace(1) %arg67184, i64 %6
  %193 = load double, ptr addrspace(1) %192, align 8
  %194 = select i1 %11, double 0.000000e+00, double %193
  %add.738.1.clone.1 = fadd double %60, %194
  %195 = select i1 %11, double 0.000000e+00, double %16
  store double %add.736.1, ptr addrspace(1) %9, align 8
  %196 = getelementptr double, ptr addrspace(1) %arg68186, i64 %6
  store double %75, ptr addrspace(1) %196, align 8
  store double %add.742.1.clone.1.clone.1, ptr addrspace(1) %76, align 8
  store double %92, ptr addrspace(1) %90, align 8
  store double %add.747.1.clone.1.clone.1.clone.1, ptr addrspace(1) %24, align 8
  store double %103, ptr addrspace(1) %101, align 8
  %197 = getelementptr double, ptr addrspace(1) %arg69188, i64 %6
  store double %106, ptr addrspace(1) %197, align 8
  %198 = getelementptr double, ptr addrspace(1) %arg70190, i64 %6
  store double %109, ptr addrspace(1) %198, align 8
  store double %add.762.1.clone.1.clone.1, ptr addrspace(1) %110, align 8
  %199 = getelementptr double, ptr addrspace(1) %arg71192, i64 %6
  store double %add.757.1.clone.1, ptr addrspace(1) %199, align 8
  %200 = getelementptr double, ptr addrspace(1) %arg72194, i64 %6
  store double %add.753.1.clone.1.clone.1, ptr addrspace(1) %200, align 8
  %201 = getelementptr double, ptr addrspace(1) %arg73196, i64 %6
  store double %add.732.1.clone.1, ptr addrspace(1) %201, align 8
  %202 = getelementptr double, ptr addrspace(1) %arg74198, i64 %6
  store double %add.731.1.clone.1, ptr addrspace(1) %202, align 8
  store double %add.768.1.clone.1, ptr addrspace(1) %174, align 8
  store double %188, ptr addrspace(1) %28, align 8
  %203 = getelementptr double, ptr addrspace(1) %arg75200, i64 %6
  store double %add.737.1.clone.1, ptr addrspace(1) %203, align 8
  store double %add.738.1.clone.1, ptr addrspace(1) %192, align 8
  store double %195, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg27, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg31, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg35, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg37, ptr noalias nocapture align 128 dereferenceable(768) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg41, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg43, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg45, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg46, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg47, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg48, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg49, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg50, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg51, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg53, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg55, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg57, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg58, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg59, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg60, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg61, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg62, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg63, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg64, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg65, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg66, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg67, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg68, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg69, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg70, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg71, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg72, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg73, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg74, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg75, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg76, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg77, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg78, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg79, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg80, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg81, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg82, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg83, ptr noalias nocapture align 128 dereferenceable(768) %arg84, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg85) local_unnamed_addr #2 {
entry:
  %arg85264 = addrspacecast ptr %arg85 to ptr addrspace(1)
  %arg84262 = addrspacecast ptr %arg84 to ptr addrspace(1)
  %arg83260 = addrspacecast ptr %arg83 to ptr addrspace(1)
  %arg82258 = addrspacecast ptr %arg82 to ptr addrspace(1)
  %arg81256 = addrspacecast ptr %arg81 to ptr addrspace(1)
  %arg80254 = addrspacecast ptr %arg80 to ptr addrspace(1)
  %arg79252 = addrspacecast ptr %arg79 to ptr addrspace(1)
  %arg78250 = addrspacecast ptr %arg78 to ptr addrspace(1)
  %arg77248 = addrspacecast ptr %arg77 to ptr addrspace(1)
  %arg76246 = addrspacecast ptr %arg76 to ptr addrspace(1)
  %arg75244 = addrspacecast ptr %arg75 to ptr addrspace(1)
  %arg74242 = addrspacecast ptr %arg74 to ptr addrspace(1)
  %arg73240 = addrspacecast ptr %arg73 to ptr addrspace(1)
  %arg72238 = addrspacecast ptr %arg72 to ptr addrspace(1)
  %arg71236 = addrspacecast ptr %arg71 to ptr addrspace(1)
  %arg70234 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69232 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68230 = addrspacecast ptr %arg68 to ptr addrspace(1)
  %arg67228 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66226 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg65224 = addrspacecast ptr %arg65 to ptr addrspace(1)
  %arg64222 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63220 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62218 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61216 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60214 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59212 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58210 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57208 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56206 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55204 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54202 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53200 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52198 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51196 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50194 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49192 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48190 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47188 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46186 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45184 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44182 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg43180 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg42178 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41176 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40174 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39172 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38170 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37168 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36166 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35164 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34162 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33160 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32158 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31156 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30154 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29152 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28150 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27148 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26146 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25144 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24142 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23140 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22138 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21136 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20134 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19132 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18130 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17128 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16126 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15124 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14122 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13120 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12118 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11116 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10114 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9112 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8110 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7108 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6106 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5104 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4102 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3100 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg298 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg196 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg094 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !55
  %1 = and i32 %0, 3
  %2 = lshr i32 %0, 2
  %3 = load i64, ptr addrspace(1) %arg298, align 128, !invariant.load !52
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = zext nneg i32 %1 to i64
  %9 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg12118, i64 0, i64 %7, i64 %8
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !52
  %11 = zext nneg i32 %0 to i64
  %12 = getelementptr double, ptr addrspace(1) %arg094, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !52
  %14 = trunc i8 %10 to i1
  %15 = select i1 %14, double 0.000000e+00, double %13
  %16 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg15124, i64 0, i64 %7, i64 %8
  %17 = load i8, ptr addrspace(1) %16, align 1, !invariant.load !52
  %18 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg14122, i64 0, i64 %7, i64 %8
  %19 = load i32, ptr addrspace(1) %18, align 4, !invariant.load !52
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %14, double %13, double 0.000000e+00
  %22 = select i1 %20, double %21, double 0.000000e+00
  %23 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg11116, i64 0, i64 %7, i64 %8
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !52
  %multiply.1343.9 = fmul double %24, %22
  %25 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg13120, i64 0, i64 0, i64 %8
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !52
  %27 = select i1 %20, i1 %14, i1 false
  %28 = select i1 %27, double %26, double 0.000000e+00
  %29 = zext nneg i32 %2 to i64
  %30 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg16126, i64 0, i64 %7, i64 %29, i64 %8
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !52
  %multiply.1344.7 = fmul double %28, %31
  %add.816.7 = fadd double %multiply.1343.9, %multiply.1344.7
  %32 = fneg double %add.816.7
  %33 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg5104, i64 0, i64 %7, i64 %8
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !52
  %35 = fneg double %28
  %36 = fmul double %24, %35
  %37 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg3100, i64 0, i64 %7, i64 %29, i64 %8
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !52
  %multiply.1346.3 = fmul double %36, %38
  %39 = fmul double %34, %add.816.7
  %add.817.9 = fsub double %multiply.1346.3, %39
  %40 = fneg double %add.817.9
  %41 = trunc i8 %17 to i1
  %42 = select i1 %41, double %40, double 0.000000e+00
  %43 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg28150, i64 0, i64 %7, i64 %8
  %44 = load i8, ptr addrspace(1) %43, align 1, !invariant.load !52
  %45 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg27148, i64 0, i64 %7, i64 %8
  %46 = load i8, ptr addrspace(1) %45, align 1, !invariant.load !52
  %47 = icmp eq i32 %19, 1
  %48 = trunc i8 %46 to i1
  %49 = select i1 %48, i1 %47, i1 false
  %50 = select i1 %49, double %21, double 0.000000e+00
  %51 = trunc i8 %44 to i1
  %52 = select i1 %51, double %50, double 0.000000e+00
  %53 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg26146, i64 0, i64 %7, i64 %29, i64 %8
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !52
  %55 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg25144, i64 0, i64 0, i64 %8
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !52
  %57 = select i1 %14, double %56, double 0.000000e+00
  %58 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg23140, i64 0, i64 %7, i64 %8
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !52
  %multiply.1169.23 = fmul double %57, %59
  %multiply.1347.15 = fmul double %54, %multiply.1169.23
  %60 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg21136, i64 0, i64 %7, i64 %8
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !52
  %62 = getelementptr double, ptr addrspace(1) %arg24142, i64 %11
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !52
  %64 = select i1 %14, double %63, double 0.000000e+00
  %multiply.1185.21 = fmul double %59, %64
  %multiply.1348.9 = fmul double %61, %multiply.1185.21
  %add.818.13 = fadd double %multiply.1347.15, %multiply.1348.9
  %65 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg22138, i64 0, i64 %7, i64 %8
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !52
  %multiply.1349.11 = fmul double %66, %add.818.13
  %multiply.1249.11 = fmul double %61, %multiply.1169.23
  %67 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg20134, i64 0, i64 %7, i64 %29, i64 %8
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !52
  %multiply.1350.9 = fmul double %multiply.1249.11, %68
  %add.819.9 = fadd double %multiply.1350.9, %multiply.1349.11
  %multiply.1351.7 = fmul double %add.819.9, 2.000000e+00
  %69 = fsub double %52, %multiply.1351.7
  %70 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg19132, i64 0, i64 %7, i64 %29, i64 %8
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !52
  %72 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg18130, i64 0, i64 %8
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !52
  %74 = select i1 %14, double %73, double 0.000000e+00
  %75 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg9112, i64 0, i64 %8
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !52
  %add.752.13 = fadd double %74, %76
  %multiply.1352.13 = fmul double %71, %add.752.13
  %add.821.11 = fadd double %multiply.1352.13, %69
  %77 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg8110, i64 0, i64 %7, i64 %8
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !52
  %multiply.1353.9 = fmul double %78, %add.821.11
  %79 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg7108, i64 0, i64 0, i64 %8
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !52
  %81 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg17128, i64 0, i64 %7, i64 %29, i64 %8
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !52
  %multiply.1354.7 = fmul double %80, %82
  %add.822.7 = fadd double %multiply.1354.7, %multiply.1353.9
  %83 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg4102, i64 0, i64 %7, i64 %8
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !52
  %85 = fneg double %80
  %86 = fmul double %78, %85
  %87 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg196, i64 0, i64 %7, i64 %29, i64 %8
  %88 = load double, ptr addrspace(1) %87, align 8, !invariant.load !52
  %multiply.1356.3 = fmul double %86, %88
  %89 = fmul double %84, %add.822.7
  %add.823.7 = fsub double %multiply.1356.3, %89
  %90 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg10114, i64 0, i64 %8
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !52
  %92 = select i1 %14, double %91, double 0.000000e+00
  %add.754.3 = fadd double %76, %92
  %93 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg6106, i64 0, i64 %7, i64 %29, i64 %8
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !52
  %95 = fneg double %add.754.3
  %96 = fmul double %94, %95
  %add.824.3 = fsub double %96, %add.823.7
  %add.825.3 = fadd double %42, %add.824.3
  %add.826.1 = fadd double %15, %add.825.3
  %97 = getelementptr double, ptr addrspace(1) %arg38170, i64 %11
  %98 = load double, ptr addrspace(1) %97, align 8
  %add.827.1.clone.1 = fadd double %98, 0.000000e+00
  %99 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg37168, i64 0, i64 %7, i64 %8
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !52
  %multiply.1358.1.clone.1 = fmul double %100, %32
  %101 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg36166, i64 0, i64 %7, i64 %8
  %102 = load double, ptr addrspace(1) %101, align 8, !invariant.load !52
  %multiply.1359.1.clone.1 = fmul double %multiply.1358.1.clone.1, %102
  %multiply.1256.7.clone.1 = fmul double %36, %100
  %103 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg35164, i64 0, i64 %7, i64 %29, i64 %8
  %104 = load double, ptr addrspace(1) %103, align 8, !invariant.load !52
  %multiply.1360.1.clone.1 = fmul double %multiply.1256.7.clone.1, %104
  %add.828.1.clone.1 = fadd double %multiply.1359.1.clone.1, %multiply.1360.1.clone.1
  %105 = select i1 %41, double %add.828.1.clone.1, double 0.000000e+00
  %106 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg34162, i64 0, i64 %7
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !52
  %108 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg33160, i64 0, i64 %7, i64 %8
  %109 = load i8, ptr addrspace(1) %108, align 1, !invariant.load !52
  %110 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg32158, i64 0, i64 %7, i64 %29, i64 %8
  %111 = load double, ptr addrspace(1) %110, align 8, !invariant.load !52
  %multiply.1361.15.clone.1 = fmul double %add.752.13, %111
  %add.829.13.clone.1 = fsub double %multiply.1361.15.clone.1, %add.822.7
  %112 = trunc i8 %109 to i1
  %113 = select i1 %112, double %add.829.13.clone.1, double 0.000000e+00
  %multiply.1362.9.clone.1 = fmul double %107, %113
  %114 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg31156, i64 0, i64 %7, i64 %8
  %115 = load double, ptr addrspace(1) %114, align 8, !invariant.load !52
  %multiply.1363.7.clone.1 = fmul double %115, %multiply.1362.9.clone.1
  %116 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg30154, i64 0, i64 %7, i64 %8
  %117 = load double, ptr addrspace(1) %116, align 8, !invariant.load !52
  %multiply.1258.13.clone.1 = fmul double %add.752.13, %117
  %add.760.11.clone.1 = fadd double %86, %multiply.1258.13.clone.1
  %118 = select i1 %112, double %add.760.11.clone.1, double 0.000000e+00
  %multiply.1260.7.clone.1 = fmul double %107, %118
  %119 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg29152, i64 0, i64 %7, i64 %29, i64 %8
  %120 = load double, ptr addrspace(1) %119, align 8, !invariant.load !52
  %multiply.1364.1.clone.1 = fmul double %120, %multiply.1260.7.clone.1
  %add.830.5.clone.1 = fadd double %multiply.1363.7.clone.1, %multiply.1364.1.clone.1
  %add.831.3.clone.1 = fadd double %105, %add.830.5.clone.1
  %add.832.1.clone.1 = fadd double %add.827.1.clone.1, %add.831.3.clone.1
  %121 = getelementptr double, ptr addrspace(1) %arg84262, i64 %11
  %122 = load double, ptr addrspace(1) %121, align 8
  %123 = getelementptr inbounds [192 x [1 x [24 x [4 x double]]]], ptr addrspace(1) %arg83260, i64 0, i64 %7, i64 0, i64 %29, i64 %8
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !52
  %add.699.3.clone.1 = fadd double %122, %124
  %125 = select i1 %14, double 0.000000e+00, double %add.699.3.clone.1
  %126 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg82258, i64 0, i64 %7, i64 %8
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !52
  %128 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg81256, i64 0, i64 %7, i64 %29, i64 %8
  %129 = load double, ptr addrspace(1) %128, align 8, !invariant.load !52
  %130 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg68230, i64 0, i64 0, i64 %8
  %131 = load double, ptr addrspace(1) %130, align 8, !invariant.load !52
  %multiply.1195.9.clone.1 = fmul double %129, %131
  %132 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg80254, i64 0, i64 %7, i64 %8
  %133 = load double, ptr addrspace(1) %132, align 8, !invariant.load !52
  %134 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg79252, i64 0, i64 %7, i64 %29, i64 %8
  %135 = load double, ptr addrspace(1) %134, align 8, !invariant.load !52
  %136 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg75244, i64 0, i64 0, i64 %8
  %137 = load double, ptr addrspace(1) %136, align 8, !invariant.load !52
  %138 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg78250, i64 0, i64 %7, i64 %8
  %139 = load double, ptr addrspace(1) %138, align 8, !invariant.load !52
  %140 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg77248, i64 0, i64 %7, i64 %8
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !52
  %multiply.1180.23.clone.1 = fmul double %50, %141
  %142 = fneg double %multiply.1180.23.clone.1
  %multiply.1181.5.clone.1 = fmul double %139, %142
  %143 = fmul double %135, %137
  %add.689.9.clone.1 = fsub double %multiply.1181.5.clone.1, %143
  %144 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg76246, i64 0, i64 %7, i64 %29, i64 %8
  %145 = load double, ptr addrspace(1) %144, align 8, !invariant.load !52
  %multiply.1182.7.clone.1 = fmul double %137, %145
  %146 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg74242, i64 0, i64 %7, i64 %8
  %147 = load double, ptr addrspace(1) %146, align 8, !invariant.load !52
  %multiply.1183.5.clone.1 = fmul double %multiply.1180.23.clone.1, %147
  %add.690.5.clone.1 = fadd double %multiply.1182.7.clone.1, %multiply.1183.5.clone.1
  %add.691.7.clone.1 = fadd double %add.689.9.clone.1, %add.690.5.clone.1
  %148 = select i1 %51, double %add.691.7.clone.1, double 0.000000e+00
  %149 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg73240, i64 0, i64 %7, i64 %29, i64 %8
  %150 = load double, ptr addrspace(1) %149, align 8, !invariant.load !52
  %151 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg72238, i64 0, i64 %7, i64 %8
  %152 = load double, ptr addrspace(1) %151, align 8, !invariant.load !52
  %multiply.1170.17.clone.1 = fmul double %multiply.1169.23, %152
  %multiply.1184.7.clone.1 = fmul double %150, %multiply.1170.17.clone.1
  %153 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg71236, i64 0, i64 %7, i64 %8
  %154 = load double, ptr addrspace(1) %153, align 8, !invariant.load !52
  %multiply.1187.13.clone.1 = fmul double %multiply.1185.21, %152
  %155 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg70234, i64 0, i64 %7, i64 %29, i64 %8
  %156 = load double, ptr addrspace(1) %155, align 8, !invariant.load !52
  %multiply.1188.13.clone.1 = fmul double %multiply.1169.23, %156
  %add.692.11.clone.1 = fadd double %multiply.1187.13.clone.1, %multiply.1188.13.clone.1
  %multiply.1189.5.clone.1 = fmul double %154, %add.692.11.clone.1
  %add.693.5.clone.1 = fadd double %multiply.1184.7.clone.1, %multiply.1189.5.clone.1
  %add.695.3.clone.1 = fadd double %148, %add.693.5.clone.1
  %multiply.1197.5.clone.1 = fmul double %133, %add.695.3.clone.1
  %add.700.7.clone.1 = fadd double %multiply.1195.9.clone.1, %multiply.1197.5.clone.1
  %157 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg69232, i64 0, i64 %7, i64 %8
  %158 = load double, ptr addrspace(1) %157, align 8, !invariant.load !52
  %multiply.1198.5.clone.1 = fmul double %158, %add.700.7.clone.1
  %multiply.1174.3.clone.1 = fmul double %131, %133
  %159 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg67228, i64 0, i64 %7, i64 %29, i64 %8
  %160 = load double, ptr addrspace(1) %159, align 8, !invariant.load !52
  %multiply.1200.5.clone.1 = fmul double %multiply.1174.3.clone.1, %160
  %add.701.3.clone.1 = fadd double %multiply.1200.5.clone.1, %multiply.1198.5.clone.1
  %161 = select i1 %14, double %add.699.3.clone.1, double 0.000000e+00
  %add.702.3.clone.1 = fadd double %161, %add.701.3.clone.1
  %add.769.1.clone.1 = fsub double %add.702.3.clone.1, %add.701.3.clone.1
  %162 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg66226, i64 0, i64 %7, i64 %29, i64 %8
  %163 = load double, ptr addrspace(1) %162, align 8, !invariant.load !52
  %164 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg64222, i64 0, i64 0, i64 %8
  %165 = load double, ptr addrspace(1) %164, align 8, !invariant.load !52
  %166 = getelementptr inbounds [192 x [1 x [4 x double]]], ptr addrspace(1) %arg65224, i64 0, i64 %7, i64 0, i64 %8
  %167 = load double, ptr addrspace(1) %166, align 8, !invariant.load !52
  %add.681.15.clone.1 = fadd double %165, %167
  %168 = select i1 %14, double %add.681.15.clone.1, double 0.000000e+00
  %169 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg63220, i64 0, i64 %8
  %170 = load double, ptr addrspace(1) %169, align 8, !invariant.load !52
  %171 = select i1 %14, double %170, double 0.000000e+00
  %multiply.1175.15.clone.1 = fmul double %multiply.1174.3.clone.1, %158
  %add.686.15.clone.1 = fadd double %multiply.1175.15.clone.1, %171
  %add.687.11.clone.1 = fadd double %168, %add.686.15.clone.1
  %multiply.1270.15.clone.1 = fmul double %163, %add.687.11.clone.1
  %172 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg62218, i64 0, i64 %7, i64 %8
  %173 = load double, ptr addrspace(1) %172, align 8, !invariant.load !52
  %multiply.1271.13.clone.1 = fmul double %173, %add.702.3.clone.1
  %add.770.13.clone.1 = fadd double %multiply.1270.15.clone.1, %multiply.1271.13.clone.1
  %174 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg61216, i64 0, i64 %7
  %175 = load double, ptr addrspace(1) %174, align 8, !invariant.load !52
  %multiply.1272.11.clone.1 = fmul double %175, %add.770.13.clone.1
  %176 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg60214, i64 0, i64 %7, i64 %8
  %177 = load double, ptr addrspace(1) %176, align 8, !invariant.load !52
  %divide.55.7.clone.1 = fdiv double %multiply.1272.11.clone.1, %177
  %178 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg59212, i64 0, i64 %7, i64 %29, i64 %8
  %179 = load double, ptr addrspace(1) %178, align 8, !invariant.load !52
  %180 = fneg double %179
  %181 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg58210, i64 0, i64 %8
  %182 = load double, ptr addrspace(1) %181, align 8, !invariant.load !52
  %183 = select i1 %14, double %182, double 0.000000e+00
  %multiply.1210.11.clone.1 = fmul double %173, %add.687.11.clone.1
  %multiply.1211.11.clone.1 = fmul double %175, %multiply.1210.11.clone.1
  %add.711.9.clone.1 = fadd double %76, %multiply.1211.11.clone.1
  %add.712.7.clone.1 = fadd double %183, %add.711.9.clone.1
  %multiply.1274.5.clone.1 = fmul double %add.712.7.clone.1, %180
  %multiply.1275.3.clone.1 = fmul double %177, %177
  %divide.56.3.clone.1 = fdiv double 1.000000e+00, %multiply.1275.3.clone.1
  %multiply.1276.5.clone.1 = fmul double %divide.56.3.clone.1, %multiply.1274.5.clone.1
  %add.771.7.clone.1 = fadd double %divide.55.7.clone.1, %multiply.1276.5.clone.1
  %184 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg57208, i64 0, i64 %7
  %185 = load double, ptr addrspace(1) %184, align 8, !invariant.load !52
  %186 = fneg double %add.771.7.clone.1
  %187 = fmul double %185, %186
  %188 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg56206, i64 0, i64 %7, i64 %29, i64 %8
  %189 = load double, ptr addrspace(1) %188, align 8, !invariant.load !52
  %190 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg40174, i64 0, i64 0, i64 %8
  %191 = load double, ptr addrspace(1) %190, align 8, !invariant.load !52
  %multiply.1278.17.clone.1 = fmul double %189, %191
  %192 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg55204, i64 0, i64 %7, i64 %8
  %193 = load double, ptr addrspace(1) %192, align 8, !invariant.load !52
  %194 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg54202, i64 0, i64 %7, i64 %8
  %195 = load double, ptr addrspace(1) %194, align 8, !invariant.load !52
  %196 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg53200, i64 0, i64 %7, i64 %8
  %197 = load double, ptr addrspace(1) %196, align 8, !invariant.load !52
  %multiply.1202.5.clone.1 = fmul double %add.702.3.clone.1, %197
  %198 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg52198, i64 0, i64 %7, i64 %29, i64 %8
  %199 = load double, ptr addrspace(1) %198, align 8, !invariant.load !52
  %multiply.1203.5.clone.1 = fmul double %add.687.11.clone.1, %199
  %add.703.3.clone.1 = fadd double %multiply.1202.5.clone.1, %multiply.1203.5.clone.1
  %200 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg51196, i64 0, i64 %7, i64 %8
  %201 = load double, ptr addrspace(1) %200, align 8, !invariant.load !52
  %divide.57.9.clone.1 = fdiv double %add.703.3.clone.1, %201
  %202 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg50194, i64 0, i64 %7, i64 %29, i64 %8
  %203 = load double, ptr addrspace(1) %202, align 8, !invariant.load !52
  %204 = fneg double %203
  %multiply.1176.9.clone.1 = fmul double %add.687.11.clone.1, %197
  %multiply.1279.3.clone.1 = fmul double %multiply.1176.9.clone.1, %204
  %multiply.1280.3.clone.1 = fmul double %201, %201
  %divide.58.3.clone.1 = fdiv double 1.000000e+00, %multiply.1280.3.clone.1
  %multiply.1281.3.clone.1 = fmul double %multiply.1279.3.clone.1, %divide.58.3.clone.1
  %add.772.9.clone.1 = fadd double %divide.57.9.clone.1, %multiply.1281.3.clone.1
  %multiply.1282.7.clone.1 = fmul double %195, %add.772.9.clone.1
  %205 = getelementptr double, ptr addrspace(1) %arg49192, i64 %11
  %206 = load double, ptr addrspace(1) %205, align 8, !invariant.load !52
  %add.773.5.clone.1 = fadd double %206, %multiply.1282.7.clone.1
  %207 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg48190, i64 0, i64 %7, i64 %8
  %208 = load double, ptr addrspace(1) %207, align 8, !invariant.load !52
  %multiply.1283.3.clone.1 = fmul double %multiply.1272.11.clone.1, %208
  %209 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg47188, i64 0, i64 %7, i64 %29, i64 %8
  %210 = load double, ptr addrspace(1) %209, align 8, !invariant.load !52
  %multiply.1284.13.clone.1 = fmul double %add.712.7.clone.1, %210
  %add.774.11.clone.1 = fadd double %multiply.1283.3.clone.1, %multiply.1284.13.clone.1
  %211 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg46186, i64 0, i64 %7, i64 %8
  %212 = load double, ptr addrspace(1) %211, align 8, !invariant.load !52
  %multiply.1285.9.clone.1 = fmul double %212, %add.774.11.clone.1
  %multiply.1215.3.clone.1 = fmul double %add.712.7.clone.1, %208
  %213 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg45184, i64 0, i64 %7, i64 %29, i64 %8
  %214 = load double, ptr addrspace(1) %213, align 8, !invariant.load !52
  %multiply.1286.3.clone.1 = fmul double %multiply.1215.3.clone.1, %214
  %add.775.7.clone.1 = fadd double %multiply.1285.9.clone.1, %multiply.1286.3.clone.1
  %add.776.3.clone.1 = fsub double %add.773.5.clone.1, %add.775.7.clone.1
  %multiply.1287.3.clone.1 = fmul double %193, %add.776.3.clone.1
  %add.777.15.clone.1 = fadd double %multiply.1278.17.clone.1, %multiply.1287.3.clone.1
  %add.778.11.clone.1 = fsub double %187, %add.777.15.clone.1
  %215 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg44182, i64 0, i64 %7, i64 %8
  %216 = load double, ptr addrspace(1) %215, align 8, !invariant.load !52
  %multiply.1289.1.clone.1 = fmul double %216, %add.776.3.clone.1
  %217 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg43180, i64 0, i64 %7, i64 %29, i64 %8
  %218 = load double, ptr addrspace(1) %217, align 8, !invariant.load !52
  %multiply.1290.5.clone.1 = fmul double %191, %218
  %add.779.3.clone.1 = fadd double %multiply.1290.5.clone.1, %multiply.1289.1.clone.1
  %add.780.9.clone.1 = fadd double %add.779.3.clone.1, %add.778.11.clone.1
  %219 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg42178, i64 0, i64 %7, i64 %8
  %220 = load double, ptr addrspace(1) %219, align 8, !invariant.load !52
  %multiply.1291.7.clone.1 = fmul double %220, %add.780.9.clone.1
  %221 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg41176, i64 0, i64 %8
  %222 = load double, ptr addrspace(1) %221, align 8, !invariant.load !52
  %223 = select i1 %14, double %222, double 0.000000e+00
  %add.710.5.clone.1 = fadd double %76, %223
  %224 = fneg double %add.712.7.clone.1
  %225 = fdiv double %224, %177
  %226 = fmul double %185, %225
  %add.713.7.clone.1 = fadd double %226, %add.710.5.clone.1
  %227 = fmul double %191, %193
  %add.719.5.clone.1 = fsub double %add.713.7.clone.1, %227
  %multiply.1219.3.clone.1 = fmul double %191, %216
  %add.720.3.clone.1 = fadd double %multiply.1219.3.clone.1, %add.719.5.clone.1
  %228 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg39172, i64 0, i64 %7, i64 %29, i64 %8
  %229 = load double, ptr addrspace(1) %228, align 8, !invariant.load !52
  %multiply.1292.1.clone.1 = fmul double %229, %add.720.3.clone.1
  %add.781.5.clone.1 = fadd double %multiply.1291.7.clone.1, %multiply.1292.1.clone.1
  %add.782.3.clone.1 = fadd double %add.769.1.clone.1, %add.781.5.clone.1
  %multiply.1294.3.clone.1 = fmul double %127, %add.782.3.clone.1
  %add.783.1.clone.1 = fadd double %125, %multiply.1294.3.clone.1
  %230 = getelementptr double, ptr addrspace(1) %arg85264, i64 %11
  store double %add.826.1, ptr addrspace(1) %230, align 8
  store double %add.832.1.clone.1, ptr addrspace(1) %97, align 8
  store double %add.783.1.clone.1, ptr addrspace(1) %121, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_2(ptr noalias nocapture align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg27, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg35, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg37, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg39, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg42, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg43, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg45, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg46, ptr noalias nocapture align 128 dereferenceable(768) %arg47, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg49, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg50, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg51, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg53, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg54, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg55, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg57, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg58, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg59, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg60, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg61, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg62, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg63, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg64, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg65, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg66, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg67, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg68, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg69, ptr noalias nocapture align 128 dereferenceable(768) %arg70, ptr noalias nocapture readnone align 16 dereferenceable(768) %arg71) local_unnamed_addr #2 {
entry:
  %arg70221 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69219 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68217 = addrspacecast ptr %arg68 to ptr addrspace(1)
  %arg67215 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66213 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg65211 = addrspacecast ptr %arg65 to ptr addrspace(1)
  %arg64209 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63207 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62205 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61203 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60201 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59199 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58197 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57195 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56193 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55191 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54189 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53187 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52185 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51183 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50181 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49179 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48177 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47175 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46173 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45171 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44169 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg43167 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg42165 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41163 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40161 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39159 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38157 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37155 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36153 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35151 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34149 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33147 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32145 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31143 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30141 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29139 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28137 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27135 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26133 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25131 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24129 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23127 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22125 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21123 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20121 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19119 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18117 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17115 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16113 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15111 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14109 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13107 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12105 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11103 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10101 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg999 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg897 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg795 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg693 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg591 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg489 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg387 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg285 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg183 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg081 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !55
  %1 = and i32 %0, 3
  %2 = lshr i32 %0, 2
  %3 = load i64, ptr addrspace(1) %arg387, align 128, !invariant.load !52
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = zext nneg i32 %1 to i64
  %9 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg591, i64 0, i64 %7, i64 %8
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !52
  %11 = zext nneg i32 %0 to i64
  %12 = getelementptr double, ptr addrspace(1) %arg081, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8
  %14 = trunc i8 %10 to i1
  %15 = select i1 %14, double 0.000000e+00, double %13
  %16 = getelementptr double, ptr addrspace(1) %arg183, i64 %11
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !52
  %18 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg489, i64 0, i64 %7, i64 %8
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !52
  %20 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg40161, i64 0, i64 %7
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !52
  %22 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg39159, i64 0, i64 %7, i64 %8
  %23 = load i8, ptr addrspace(1) %22, align 1, !invariant.load !52
  %24 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg38157, i64 0, i64 %7, i64 %8
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !52
  %26 = zext nneg i32 %2 to i64
  %27 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg62205, i64 0, i64 %7, i64 %26, i64 %8
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !52
  %29 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg25131, i64 0, i64 0, i64 %8
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !52
  %31 = fneg double %30
  %32 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg61203, i64 0, i64 %7, i64 %8
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !52
  %34 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg34149, i64 0, i64 %7, i64 %8
  %35 = load i8, ptr addrspace(1) %34, align 1, !invariant.load !52
  %36 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg33147, i64 0, i64 %7, i64 %8
  %37 = load i32, ptr addrspace(1) %36, align 4, !invariant.load !52
  %38 = icmp eq i32 %37, 1
  %39 = getelementptr double, ptr addrspace(1) %arg32145, i64 %11
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !52
  %41 = trunc i8 %35 to i1
  %42 = select i1 %41, i1 %38, i1 false
  %43 = select i1 %42, i1 %14, i1 false
  %44 = select i1 %43, double %40, double 0.000000e+00
  %45 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg31143, i64 0, i64 %7, i64 %8
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !52
  %multiply.1180.27.clone.1 = fmul double %46, %44
  %47 = fneg double %multiply.1180.27.clone.1
  %multiply.1181.9.clone.1 = fmul double %33, %47
  %48 = fmul double %28, %30
  %add.689.13.clone.1 = fsub double %multiply.1181.9.clone.1, %48
  %49 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg60201, i64 0, i64 %7, i64 %26, i64 %8
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !52
  %multiply.1182.11.clone.1 = fmul double %30, %50
  %51 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg59199, i64 0, i64 %7, i64 %8
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !52
  %multiply.1183.9.clone.1 = fmul double %52, %multiply.1180.27.clone.1
  %add.690.9.clone.1 = fadd double %multiply.1182.11.clone.1, %multiply.1183.9.clone.1
  %add.691.11.clone.1 = fadd double %add.689.13.clone.1, %add.690.9.clone.1
  %53 = trunc i8 %25 to i1
  %54 = select i1 %53, double %add.691.11.clone.1, double 0.000000e+00
  %55 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg58197, i64 0, i64 %7, i64 %26, i64 %8
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !52
  %57 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg21123, i64 0, i64 0, i64 %8
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !52
  %59 = select i1 %14, double %58, double 0.000000e+00
  %60 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg20121, i64 0, i64 %7, i64 %8
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !52
  %multiply.1169.35.clone.1 = fmul double %59, %61
  %62 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg19119, i64 0, i64 %7, i64 %8
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !52
  %multiply.1170.13.clone.1 = fmul double %multiply.1169.35.clone.1, %63
  %multiply.1184.11.clone.1 = fmul double %56, %multiply.1170.13.clone.1
  %64 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg57195, i64 0, i64 %7, i64 %8
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !52
  %66 = select i1 %14, double %13, double 0.000000e+00
  %multiply.1185.15.clone.1 = fmul double %66, %61
  %multiply.1187.11.clone.1 = fmul double %multiply.1185.15.clone.1, %63
  %67 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg16113, i64 0, i64 %7, i64 %26, i64 %8
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !52
  %multiply.1188.11.clone.1 = fmul double %multiply.1169.35.clone.1, %68
  %add.692.9.clone.1 = fadd double %multiply.1187.11.clone.1, %multiply.1188.11.clone.1
  %multiply.1189.9.clone.1 = fmul double %65, %add.692.9.clone.1
  %add.693.9.clone.1 = fadd double %multiply.1184.11.clone.1, %multiply.1189.9.clone.1
  %add.695.7.clone.1 = fadd double %54, %add.693.9.clone.1
  %69 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg56193, i64 0, i64 %7, i64 %8
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !52
  %multiply.1295.1.clone.1 = fmul double %70, %add.695.7.clone.1
  %71 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg55191, i64 0, i64 0, i64 %8
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !52
  %73 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg54189, i64 0, i64 %7, i64 %26, i64 %8
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !52
  %multiply.1296.1.clone.1 = fmul double %72, %74
  %add.784.1.clone.1 = fadd double %multiply.1296.1.clone.1, %multiply.1295.1.clone.1
  %75 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg53187, i64 0, i64 %7, i64 %8
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !52
  %divide.59.11.clone.1 = fdiv double %add.695.7.clone.1, %76
  %77 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg52185, i64 0, i64 %7, i64 %26, i64 %8
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !52
  %79 = fneg double %78
  %multiply.1297.1.clone.1 = fmul double %72, %79
  %multiply.1280.5.clone.1 = fmul double %76, %76
  %divide.58.5.clone.1 = fdiv double 1.000000e+00, %multiply.1280.5.clone.1
  %multiply.1299.1.clone.1 = fmul double %multiply.1297.1.clone.1, %divide.58.5.clone.1
  %add.785.11.clone.1 = fadd double %divide.59.11.clone.1, %multiply.1299.1.clone.1
  %add.786.9.clone.1 = fadd double %add.784.1.clone.1, %add.785.11.clone.1
  %80 = getelementptr double, ptr addrspace(1) %arg51183, i64 %11
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !52
  %add.787.7.clone.1 = fadd double %81, %add.786.9.clone.1
  %82 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg50181, i64 0, i64 %7, i64 %26, i64 %8
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !52
  %84 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg999, i64 0, i64 0, i64 %8
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !52
  %multiply.1300.1.clone.1 = fmul double %83, %85
  %86 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg49179, i64 0, i64 %7, i64 %8
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !52
  %88 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg37155, i64 0, i64 %7, i64 %26, i64 %8
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !52
  %90 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg36153, i64 0, i64 %7, i64 %8
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !52
  %multiply.1224.7.clone.1 = fmul double %91, %31
  %multiply.1301.15.clone.1 = fmul double %89, %multiply.1224.7.clone.1
  %92 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg35151, i64 0, i64 %7, i64 %8
  %93 = load double, ptr addrspace(1) %92, align 8, !invariant.load !52
  %94 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg30141, i64 0, i64 %7, i64 %26, i64 %8
  %95 = load double, ptr addrspace(1) %94, align 8, !invariant.load !52
  %multiply.1304.7.clone.1 = fmul double %95, %31
  %96 = fmul double %multiply.1180.27.clone.1, %91
  %add.788.5.clone.1 = fsub double %multiply.1304.7.clone.1, %96
  %multiply.1306.7.clone.1 = fmul double %93, %add.788.5.clone.1
  %add.789.13.clone.1 = fadd double %multiply.1301.15.clone.1, %multiply.1306.7.clone.1
  %97 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg29139, i64 0, i64 %7, i64 %26, i64 %8
  %98 = load double, ptr addrspace(1) %97, align 8, !invariant.load !52
  %multiply.1226.8.clone.1 = fmul double %30, %91
  %99 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg28137, i64 0, i64 %7, i64 %8
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !52
  %multiply.1227.7.clone.1 = fmul double %multiply.1226.8.clone.1, %100
  %multiply.1307.9.clone.1 = fmul double %98, %multiply.1227.7.clone.1
  %101 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg27135, i64 0, i64 %7, i64 %8
  %102 = load double, ptr addrspace(1) %101, align 8, !invariant.load !52
  %multiply.1310.11.clone.1 = fmul double %30, %95
  %add.790.9.clone.1 = fadd double %96, %multiply.1310.11.clone.1
  %multiply.1311.7.clone.1 = fmul double %add.790.9.clone.1, %100
  %103 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg26133, i64 0, i64 %7, i64 %26, i64 %8
  %104 = load double, ptr addrspace(1) %103, align 8, !invariant.load !52
  %multiply.1312.7.clone.1 = fmul double %multiply.1226.8.clone.1, %104
  %add.791.5.clone.1 = fadd double %multiply.1311.7.clone.1, %multiply.1312.7.clone.1
  %multiply.1314.7.clone.1 = fmul double %102, %add.791.5.clone.1
  %add.792.7.clone.1 = fadd double %multiply.1307.9.clone.1, %multiply.1314.7.clone.1
  %add.793.11.clone.1 = fadd double %add.789.13.clone.1, %add.792.7.clone.1
  %multiply.1230.11.clone.1 = fmul double %30, 5.000000e-01
  %105 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg24129, i64 0, i64 %7, i64 %8
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !52
  %multiply.1231.7.clone.1 = fmul double %multiply.1230.11.clone.1, %106
  %multiply.1315.5.clone.1 = fmul double %98, %multiply.1231.7.clone.1
  %multiply.1316.7.clone.1 = fmul double %106, 5.000000e-01
  %multiply.1317.7.clone.1 = fmul double %multiply.1180.27.clone.1, %multiply.1316.7.clone.1
  %107 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg23127, i64 0, i64 %7, i64 %26, i64 %8
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !52
  %multiply.1319.7.clone.1 = fmul double %multiply.1230.11.clone.1, %108
  %add.794.5.clone.1 = fadd double %multiply.1317.7.clone.1, %multiply.1319.7.clone.1
  %multiply.1320.9.clone.1 = fmul double %102, %add.794.5.clone.1
  %add.795.7.clone.1 = fadd double %multiply.1315.5.clone.1, %multiply.1320.9.clone.1
  %add.796.9.clone.1 = fadd double %add.793.11.clone.1, %add.795.7.clone.1
  %109 = select i1 %53, double %add.796.9.clone.1, double 0.000000e+00
  %110 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg22125, i64 0, i64 %7, i64 %26, i64 %8
  %111 = load double, ptr addrspace(1) %110, align 8, !invariant.load !52
  %112 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg18117, i64 0, i64 %7, i64 %8
  %113 = load double, ptr addrspace(1) %112, align 8, !invariant.load !52
  %multiply.1234.7.clone.1 = fmul double %multiply.1170.13.clone.1, %113
  %multiply.1322.9.clone.1 = fmul double %111, %multiply.1234.7.clone.1
  %114 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg17115, i64 0, i64 %7, i64 %8
  %115 = load double, ptr addrspace(1) %114, align 8, !invariant.load !52
  %multiply.1323.7.clone.1 = fmul double %add.692.9.clone.1, %113
  %116 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg15111, i64 0, i64 %7, i64 %26, i64 %8
  %117 = load double, ptr addrspace(1) %116, align 8, !invariant.load !52
  %multiply.1324.7.clone.1 = fmul double %multiply.1170.13.clone.1, %117
  %add.797.5.clone.1 = fadd double %multiply.1323.7.clone.1, %multiply.1324.7.clone.1
  %multiply.1325.7.clone.1 = fmul double %115, %add.797.5.clone.1
  %add.798.7.clone.1 = fadd double %multiply.1322.9.clone.1, %multiply.1325.7.clone.1
  %add.799.5.clone.1 = fadd double %109, %add.798.7.clone.1
  %multiply.1327.1.clone.1 = fmul double %87, %add.799.5.clone.1
  %add.800.1.clone.1 = fadd double %multiply.1300.1.clone.1, %multiply.1327.1.clone.1
  %add.801.5.clone.1 = fadd double %add.787.7.clone.1, %add.800.1.clone.1
  %118 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg11103, i64 0, i64 %7, i64 %8
  %119 = load double, ptr addrspace(1) %118, align 8, !invariant.load !52
  %multiply.1328.3.clone.1 = fmul double %119, %add.801.5.clone.1
  %120 = getelementptr inbounds [1 x [4 x double]], ptr addrspace(1) %arg10101, i64 0, i64 0, i64 %8
  %121 = load double, ptr addrspace(1) %120, align 8, !invariant.load !52
  %122 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg48177, i64 0, i64 %7, i64 %26, i64 %8
  %123 = load double, ptr addrspace(1) %122, align 8, !invariant.load !52
  %multiply.1330.1.clone.1 = fmul double %121, %123
  %add.802.1.clone.1 = fadd double %multiply.1330.1.clone.1, %multiply.1328.3.clone.1
  %124 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg14109, i64 0, i64 %7, i64 %8
  %125 = load double, ptr addrspace(1) %124, align 8, !invariant.load !52
  %multiply.1335.13.clone.1 = fmul double %125, %add.799.5.clone.1
  %126 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg13107, i64 0, i64 %7, i64 %26, i64 %8
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !52
  %multiply.1336.3.clone.1 = fmul double %85, %127
  %add.808.11.clone.1 = fadd double %multiply.1335.13.clone.1, %multiply.1336.3.clone.1
  %add.809.9.clone.1 = fsub double %add.808.11.clone.1, %add.802.1.clone.1
  %128 = trunc i8 %23 to i1
  %129 = select i1 %128, double %add.809.9.clone.1, double 0.000000e+00
  %multiply.1337.5.clone.1 = fmul double %21, %129
  %130 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg12105, i64 0, i64 %7, i64 %8
  %131 = load double, ptr addrspace(1) %130, align 8, !invariant.load !52
  %multiply.1338.3.clone.1 = fmul double %131, %multiply.1337.5.clone.1
  %132 = fneg double %121
  %133 = fmul double %119, %132
  %multiply.1241.5.clone.1 = fmul double %85, %125
  %add.740.5.clone.1 = fadd double %133, %multiply.1241.5.clone.1
  %134 = select i1 %128, double %add.740.5.clone.1, double 0.000000e+00
  %multiply.1243.3.clone.1 = fmul double %21, %134
  %135 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg897, i64 0, i64 %7, i64 %26, i64 %8
  %136 = load double, ptr addrspace(1) %135, align 8, !invariant.load !52
  %multiply.1340.3.clone.1 = fmul double %136, %multiply.1243.3.clone.1
  %add.810.1.clone.1 = fadd double %multiply.1340.3.clone.1, %multiply.1338.3.clone.1
  %multiply.1341.3 = fmul double %19, %add.810.1.clone.1
  %add.813.5 = fadd double %17, %multiply.1341.3
  %137 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg285, i64 0, i64 %7, i64 %8
  %138 = load double, ptr addrspace(1) %137, align 8, !invariant.load !52
  %multiply.1342.3 = fmul double %66, %138
  %add.814.3 = fadd double %multiply.1342.3, %add.813.5
  %add.815.1 = fadd double %15, %add.814.3
  %139 = getelementptr double, ptr addrspace(1) %arg795, i64 %11
  %140 = load double, ptr addrspace(1) %139, align 8
  %add.807.3.clone.1 = fadd double %140, 0.000000e+00
  %141 = getelementptr double, ptr addrspace(1) %arg693, i64 %11
  %142 = load double, ptr addrspace(1) %141, align 8, !invariant.load !52
  %add.811.3.clone.1 = fadd double %142, %add.810.1.clone.1
  %add.812.1.clone.1 = fadd double %add.807.3.clone.1, %add.811.3.clone.1
  %143 = getelementptr double, ptr addrspace(1) %arg47175, i64 %11
  %144 = load double, ptr addrspace(1) %143, align 8
  %145 = select i1 %14, double 0.000000e+00, double %144
  %146 = getelementptr double, ptr addrspace(1) %arg46173, i64 %11
  %147 = load double, ptr addrspace(1) %146, align 8, !invariant.load !52
  %148 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg45171, i64 0, i64 %7, i64 %8
  %149 = load double, ptr addrspace(1) %148, align 8, !invariant.load !52
  %150 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg44169, i64 0, i64 %7, i64 %26, i64 %8
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !52
  %multiply.1332.3.clone.1 = fmul double %133, %151
  %152 = fmul double %add.802.1.clone.1, %149
  %add.803.7.clone.1 = fsub double %multiply.1332.3.clone.1, %152
  %153 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg43167, i64 0, i64 %8
  %154 = load double, ptr addrspace(1) %153, align 8, !invariant.load !52
  %155 = select i1 %14, double %154, double 0.000000e+00
  %156 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg42165, i64 0, i64 %8
  %157 = load double, ptr addrspace(1) %156, align 8, !invariant.load !52
  %add.733.3.clone.1 = fadd double %155, %157
  %158 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg41163, i64 0, i64 %7, i64 %26, i64 %8
  %159 = load double, ptr addrspace(1) %158, align 8, !invariant.load !52
  %160 = fneg double %add.733.3.clone.1
  %161 = fmul double %159, %160
  %add.804.3.clone.1 = fsub double %161, %add.803.7.clone.1
  %add.805.3.clone.1 = fadd double %147, %add.804.3.clone.1
  %add.806.1.clone.1 = fadd double %145, %add.805.3.clone.1
  %162 = getelementptr double, ptr addrspace(1) %arg70221, i64 %11
  %163 = load double, ptr addrspace(1) %162, align 8
  %add.833.3.clone.1 = fadd double %163, 0.000000e+00
  %164 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg69219, i64 0, i64 %7, i64 %8, i64 0
  %165 = load i8, ptr addrspace(1) %164, align 1, !invariant.load !52
  %166 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg68217, i64 0, i64 %7, i64 %8
  %167 = load double, ptr addrspace(1) %166, align 8, !invariant.load !52
  %multiply.1365.3.clone.1 = fmul double %add.788.5.clone.1, %167
  %168 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg67215, i64 0, i64 %7, i64 %26, i64 %8
  %169 = load double, ptr addrspace(1) %168, align 8, !invariant.load !52
  %multiply.1366.17.clone.1 = fmul double %multiply.1224.7.clone.1, %169
  %add.834.15.clone.1 = fadd double %multiply.1365.3.clone.1, %multiply.1366.17.clone.1
  %170 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg66213, i64 0, i64 %7, i64 %8
  %171 = load double, ptr addrspace(1) %170, align 8, !invariant.load !52
  %multiply.1367.3.clone.1 = fmul double %171, 5.000000e-01
  %multiply.1368.13.clone.1 = fmul double %add.834.15.clone.1, %multiply.1367.3.clone.1
  %multiply.1262.3.clone.1 = fmul double %multiply.1224.7.clone.1, %167
  %multiply.1263.3.clone.1 = fmul double %multiply.1262.3.clone.1, 5.000000e-01
  %172 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg65211, i64 0, i64 %7, i64 %26, i64 %8
  %173 = load double, ptr addrspace(1) %172, align 8, !invariant.load !52
  %multiply.1369.3.clone.1 = fmul double %multiply.1263.3.clone.1, %173
  %add.836.11.clone.1 = fadd double %multiply.1368.13.clone.1, %multiply.1369.3.clone.1
  %multiply.1370.3.clone.1 = fmul double %add.791.5.clone.1, %167
  %multiply.1371.5.clone.1 = fmul double %multiply.1227.7.clone.1, %169
  %add.837.3.clone.1 = fadd double %multiply.1370.3.clone.1, %multiply.1371.5.clone.1
  %add.838.9.clone.1 = fadd double %add.837.3.clone.1, %add.836.11.clone.1
  %multiply.1372.3.clone.1 = fmul double %add.794.5.clone.1, %167
  %multiply.1373.5.clone.1 = fmul double %multiply.1231.7.clone.1, %169
  %add.839.3.clone.1 = fadd double %multiply.1372.3.clone.1, %multiply.1373.5.clone.1
  %add.840.7.clone.1 = fadd double %add.839.3.clone.1, %add.838.9.clone.1
  %174 = trunc i8 %165 to i1
  %175 = select i1 %174, double %add.840.7.clone.1, double 0.000000e+00
  %176 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg64209, i64 0, i64 %7, i64 %8
  %177 = load double, ptr addrspace(1) %176, align 8, !invariant.load !52
  %multiply.1374.3.clone.1 = fmul double %add.797.5.clone.1, %177
  %178 = getelementptr inbounds [192 x [24 x [4 x double]]], ptr addrspace(1) %arg63207, i64 0, i64 %7, i64 %26, i64 %8
  %179 = load double, ptr addrspace(1) %178, align 8, !invariant.load !52
  %multiply.1375.5.clone.1 = fmul double %multiply.1234.7.clone.1, %179
  %add.841.3.clone.1 = fadd double %multiply.1374.3.clone.1, %multiply.1375.5.clone.1
  %add.842.3.clone.1 = fadd double %add.841.3.clone.1, %175
  %add.843.1.clone.1 = fadd double %add.833.3.clone.1, %add.842.3.clone.1
  store double %add.815.1, ptr addrspace(1) %12, align 8
  store double %add.812.1.clone.1, ptr addrspace(1) %139, align 8
  store double %add.806.1.clone.1, ptr addrspace(1) %143, align 8
  store double %add.843.1.clone.1, ptr addrspace(1) %162, align 8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49}
!llvm.module.flags = !{!50}

!0 = !{ptr @copy_fusion_6, !"kernel", i32 1}
!1 = !{ptr @copy_fusion_6, !"reqntidx", i32 12}
!2 = !{ptr @copy_fusion_7, !"kernel", i32 1}
!3 = !{ptr @copy_fusion_7, !"reqntidx", i32 8}
!4 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!6 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!7 = !{ptr @loop_select_fusion, !"reqntidx", i32 1}
!8 = !{ptr @loop_add_fusion_3, !"kernel", i32 1}
!9 = !{ptr @loop_add_fusion_3, !"reqntidx", i32 1}
!10 = !{ptr @wrapped_dynamic_slice, !"kernel", i32 1}
!11 = !{ptr @wrapped_dynamic_slice, !"reqntidx", i32 1}
!12 = !{ptr @wrapped_dynamic_slice_1, !"kernel", i32 1}
!13 = !{ptr @wrapped_dynamic_slice_1, !"reqntidx", i32 1}
!14 = !{ptr @loop_dynamic_slice_fusion_5, !"kernel", i32 1}
!15 = !{ptr @loop_dynamic_slice_fusion_5, !"reqntidx", i32 4}
!16 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 4}
!18 = !{ptr @loop_add_multiply_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_add_multiply_fusion, !"reqntidx", i32 4}
!20 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!21 = !{ptr @loop_add_fusion, !"reqntidx", i32 96}
!22 = !{ptr @loop_dynamic_slice_fusion_3, !"kernel", i32 1}
!23 = !{ptr @loop_dynamic_slice_fusion_3, !"reqntidx", i32 96}
!24 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!25 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 4}
!26 = !{ptr @loop_broadcast_fusion_2, !"kernel", i32 1}
!27 = !{ptr @loop_broadcast_fusion_2, !"reqntidx", i32 4}
!28 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!29 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 4}
!30 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!31 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 4}
!32 = !{ptr @loop_broadcast_fusion_3, !"kernel", i32 1}
!33 = !{ptr @loop_broadcast_fusion_3, !"reqntidx", i32 96}
!34 = !{ptr @loop_add_multiply_negate_fusion, !"kernel", i32 1}
!35 = !{ptr @loop_add_multiply_negate_fusion, !"reqntidx", i32 96}
!36 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!37 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 4}
!38 = !{ptr @loop_broadcast_fusion_6, !"kernel", i32 1}
!39 = !{ptr @loop_broadcast_fusion_6, !"reqntidx", i32 96}
!40 = !{ptr @loop_multiply_select_fusion, !"kernel", i32 1}
!41 = !{ptr @loop_multiply_select_fusion, !"reqntidx", i32 96}
!42 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!43 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 4}
!44 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!45 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 4}
!46 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!47 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 96}
!48 = !{ptr @loop_add_fusion_2, !"kernel", i32 1}
!49 = !{ptr @loop_add_fusion_2, !"reqntidx", i32 96}
!50 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!51 = !{i32 0, i32 12}
!52 = !{}
!53 = !{i32 0, i32 8}
!54 = !{i32 0, i32 4}
!55 = !{i32 0, i32 96}
