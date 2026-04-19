; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_150_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion_6(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg5) local_unnamed_addr #0 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = icmp ult i32 %0, 20
  br i1 %1, label %concatenate.pivot.0., label %concatenate.pivot.40.

copy_fusion.6.in_bounds-after:                    ; preds = %slice1-after, %slice2-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg03, i64 0, i64 0, i64 %2
  br label %concatenate.merge

concatenate.pivot.40.:                            ; preds = %entry
  %4 = icmp ult i32 %0, 40
  br i1 %4, label %concatenate.pivot.20.1, label %concatenate.pivot.40.2

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.40.
  %5 = add nsw i32 %0, -20
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg15, i64 0, i64 0, i64 %6
  br label %concatenate.merge

concatenate.pivot.40.2:                           ; preds = %concatenate.pivot.40.
  %8 = add nsw i32 %0, -40
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [1 x [20 x [1 x double]]], ptr addrspace(1) %arg27, i64 0, i64 0, i64 %9, i64 0
  br label %concatenate.merge

concatenate.merge:                                ; preds = %concatenate.pivot.40.2, %concatenate.pivot.20.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %3, %concatenate.pivot.0. ], [ %7, %concatenate.pivot.20.1 ], [ %10, %concatenate.pivot.40.2 ]
  %11 = icmp ult i32 %0, 20
  %12 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !52
  %13 = zext nneg i32 %0 to i64
  %14 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg39, i64 0, i64 %13
  br i1 %11, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %15 = add nsw i32 %0, -20
  %16 = icmp ult i32 %15, 20
  %17 = zext nneg i32 %15 to i64
  %18 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg411, i64 0, i64 %17
  br i1 %16, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %19 = icmp ugt i32 %0, 39
  %20 = add nsw i32 %0, -40
  %21 = zext nneg i32 %20 to i64
  %22 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg513, i64 0, i64 %21
  br i1 %19, label %slice2-true, label %copy_fusion.6.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  store double %12, ptr addrspace(1) %14, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double %12, ptr addrspace(1) %18, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double %12, ptr addrspace(1) %22, align 8
  br label %copy_fusion.6.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg7) local_unnamed_addr #0 {
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
  %1 = icmp ult i32 %0, 20
  %2 = add nsw i32 %0, -20
  %.sink25 = select i1 %1, i32 %0, i32 %2
  %arg0.sink24 = select i1 %1, ptr addrspace(1) %arg027, ptr addrspace(1) %arg231
  %3 = zext nneg i32 %.sink25 to i64
  %4 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg0.sink24, i64 0, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !52
  %arg3.sink = select i1 %1, ptr addrspace(1) %arg129, ptr addrspace(1) %arg333
  %6 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3.sink, i64 0, i64 %3
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !52
  %8 = zext nneg i32 %0 to i64
  %9 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg129, i64 0, i64 %8
  %10 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg027, i64 0, i64 %8
  %11 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg537, i64 0, i64 %8
  %12 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg435, i64 0, i64 %8
  br i1 %1, label %slice0-true, label %slice1-after

copy_fusion.7.in_bounds-after:                    ; preds = %slice1-after, %slice2-true
  ret void

slice1-after:                                     ; preds = %entry, %slice0-true
  %13 = icmp ugt i32 %0, 19
  %14 = zext nneg i32 %2 to i64
  %15 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg741, i64 0, i64 %14
  %16 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg639, i64 0, i64 %14
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
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg2) local_unnamed_addr #2 {
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
  %7 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 %6
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !52
  %9 = getelementptr i8, ptr addrspace(1) %arg25, i64 %6
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg2) local_unnamed_addr #2 {
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
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !52
  %9 = getelementptr double, ptr addrspace(1) %arg25, i64 %6
  store double %8, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg28) local_unnamed_addr #2 {
entry:
  %arg2878 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2776 = addrspacecast ptr %arg27 to ptr addrspace(1)
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
  %7 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg634, i64 0, i64 %5, i64 %6
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !52
  %9 = getelementptr double, ptr addrspace(1) %arg022, i64 %6
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !52
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, double %10, double 0.000000e+00
  %13 = getelementptr double, ptr addrspace(1) %arg1960, i64 %6
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !52
  %15 = select i1 %11, double %14, double 0.000000e+00
  %16 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg1858, i64 0, i64 %5, i64 %6
  %17 = load i8, ptr addrspace(1) %16, align 1, !invariant.load !52
  %18 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1756, i64 0, i64 %5, i64 %6
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !52
  %20 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg2368, i64 0, i64 %5, i64 %6
  %21 = load i8, ptr addrspace(1) %20, align 1, !invariant.load !52
  %22 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg2266, i64 0, i64 %5, i64 %6
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !52
  %24 = icmp eq i32 %23, 1
  %25 = getelementptr double, ptr addrspace(1) %arg2164, i64 %6
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !52
  %27 = trunc i8 %21 to i1
  %28 = select i1 %27, i1 %24, i1 false
  %29 = select i1 %28, i1 %11, i1 false
  %30 = select i1 %29, double %26, double 0.000000e+00
  %31 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2062, i64 0, i64 %5, i64 %6
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !52
  %multiply.1165.1.clone.1 = fmul double %32, %30
  %33 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1654, i64 0, i64 %5, i64 %6
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !52
  %multiply.1168.1.clone.1 = fmul double %34, %multiply.1165.1.clone.1
  %35 = fmul double %19, %multiply.1165.1.clone.1
  %add.682.1.clone.1 = fsub double %multiply.1168.1.clone.1, %35
  %36 = trunc i8 %17 to i1
  %37 = select i1 %36, double %add.682.1.clone.1, double 0.000000e+00
  %38 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1552, i64 0, i64 %5, i64 %6
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !52
  %40 = getelementptr double, ptr addrspace(1) %arg1450, i64 %6
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !52
  %42 = select i1 %11, double %41, double 0.000000e+00
  %43 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1348, i64 0, i64 %5, i64 %6
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !52
  %multiply.1169.15.clone.1 = fmul double %42, %44
  %45 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1246, i64 0, i64 %5, i64 %6
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !52
  %multiply.1170.5.clone.1 = fmul double %multiply.1169.15.clone.1, %46
  %multiply.1171.1.clone.1 = fmul double %39, %multiply.1170.5.clone.1
  %add.683.3.clone.1 = fadd double %37, %multiply.1171.1.clone.1
  %add.684.1.clone.1 = fadd double %15, %add.683.3.clone.1
  %47 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg430, i64 0, i64 %5, i64 %6
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !52
  %49 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg328, i64 0, i64 %5, i64 %6
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !52
  %51 = fneg double %add.684.1.clone.1
  %52 = fmul double %48, %51
  %53 = fmul double %50, %52
  %add.685.3 = fadd double %12, %53
  %54 = getelementptr double, ptr addrspace(1) %arg1042, i64 %6
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !52
  %56 = getelementptr inbounds [192 x [1 x [20 x double]]], ptr addrspace(1) %arg1144, i64 0, i64 %5, i64 0, i64 %6
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !52
  %add.681.9 = fadd double %55, %57
  %58 = select i1 %11, double %add.681.9, double 0.000000e+00
  %59 = getelementptr double, ptr addrspace(1) %arg940, i64 %6
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !52
  %61 = select i1 %11, double %60, double 0.000000e+00
  %multiply.1174.13 = fmul double %50, %add.684.1.clone.1
  %62 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg838, i64 0, i64 %5, i64 %6
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !52
  %multiply.1175.9 = fmul double %multiply.1174.13, %63
  %add.686.9 = fadd double %61, %multiply.1175.9
  %add.687.5 = fadd double %58, %add.686.9
  %64 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg736, i64 0, i64 %5, i64 %6
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !52
  %66 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg532, i64 0, i64 %5, i64 %6
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !52
  %68 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg124, i64 0, i64 %5, i64 %6
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !52
  %70 = fneg double %add.687.5
  %71 = fmul double %65, %70
  %72 = fmul double %67, %71
  %73 = fmul double %69, %72
  %add.688.1 = fadd double %add.685.3, %73
  %74 = getelementptr double, ptr addrspace(1) %arg2470, i64 %6
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !52
  %76 = select i1 %11, double 0.000000e+00, double %75
  %77 = getelementptr double, ptr addrspace(1) %arg2572, i64 %6
  store double %add.688.1, ptr addrspace(1) %77, align 8
  %78 = getelementptr double, ptr addrspace(1) %arg2674, i64 %6
  store double %add.684.1.clone.1, ptr addrspace(1) %78, align 8
  %79 = getelementptr double, ptr addrspace(1) %arg2776, i64 %6
  store double %multiply.1165.1.clone.1, ptr addrspace(1) %79, align 8
  %80 = getelementptr double, ptr addrspace(1) %arg2878, i64 %6
  store double %76, ptr addrspace(1) %80, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg31, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg35, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg36, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg38) local_unnamed_addr #2 {
entry:
  %arg38121 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37119 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36117 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35115 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34113 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33111 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32109 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31107 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30105 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29103 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28101 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2799 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2697 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2595 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2493 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2391 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2289 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2187 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2085 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1983 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1881 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1779 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1677 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1575 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1473 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1371 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1269 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1167 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1065 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg963 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg861 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg759 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg657 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg555 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg453 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg351 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg249 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg147 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg045 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_add_fusion.2.in_bounds-true, label %loop_add_fusion.2.in_bounds-after

loop_add_fusion.2.in_bounds-after:                ; preds = %loop_add_fusion.2.in_bounds-true, %entry
  ret void

loop_add_fusion.2.in_bounds-true:                 ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = load i64, ptr addrspace(1) %arg351, align 128, !invariant.load !52
  %7 = trunc i64 %6 to i32
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 191)
  %10 = zext nneg i32 %9 to i64
  %11 = zext nneg i16 %.decomposed to i64
  %12 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg1779, i64 0, i64 %10, i64 %11
  %13 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !52
  %14 = zext nneg i32 %linear_index to i64
  %15 = getelementptr double, ptr addrspace(1) %arg045, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !52
  %17 = trunc i8 %13 to i1
  %18 = select i1 %17, double %16, double 0.000000e+00
  %19 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg33111, i64 0, i64 %10, i64 %11
  %20 = load i8, ptr addrspace(1) %19, align 1, !invariant.load !52
  %21 = zext nneg i16 %4 to i64
  %22 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg32109, i64 0, i64 %10, i64 %21, i64 %11
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !52
  %24 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg2595, i64 0, i64 0, i64 %11
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !52
  %26 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg31107, i64 0, i64 %10, i64 %11
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !52
  %28 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg30105, i64 0, i64 %10, i64 %11
  %29 = load i8, ptr addrspace(1) %28, align 1, !invariant.load !52
  %30 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg29103, i64 0, i64 %10, i64 %11
  %31 = load i32, ptr addrspace(1) %30, align 4, !invariant.load !52
  %32 = icmp eq i32 %31, 1
  %33 = getelementptr double, ptr addrspace(1) %arg28101, i64 %14
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !52
  %35 = trunc i8 %29 to i1
  %36 = select i1 %35, i1 %32, i1 false
  %37 = select i1 %36, i1 %17, i1 false
  %38 = select i1 %37, double %34, double 0.000000e+00
  %39 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2799, i64 0, i64 %10, i64 %11
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !52
  %multiply.1180.45 = fmul double %40, %38
  %41 = fneg double %multiply.1180.45
  %multiply.1181.7 = fmul double %27, %41
  %42 = fmul double %23, %25
  %add.689.9 = fsub double %multiply.1181.7, %42
  %43 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg2697, i64 0, i64 %10, i64 %21, i64 %11
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !52
  %multiply.1182.9 = fmul double %25, %44
  %45 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2493, i64 0, i64 %10, i64 %11
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !52
  %multiply.1183.9 = fmul double %46, %multiply.1180.45
  %add.690.7 = fadd double %multiply.1182.9, %multiply.1183.9
  %add.691.7 = fadd double %add.689.9, %add.690.7
  %47 = trunc i8 %20 to i1
  %48 = select i1 %47, double %add.691.7, double 0.000000e+00
  %49 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg2391, i64 0, i64 %10, i64 %21, i64 %11
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !52
  %51 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg37119, i64 0, i64 0, i64 %11
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !52
  %53 = select i1 %17, double %52, double 0.000000e+00
  %54 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2085, i64 0, i64 %10, i64 %11
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !52
  %multiply.1169.11 = fmul double %53, %55
  %56 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1983, i64 0, i64 %10, i64 %11
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !52
  %multiply.1170.19 = fmul double %multiply.1169.11, %57
  %multiply.1184.9 = fmul double %50, %multiply.1170.19
  %58 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2289, i64 0, i64 %10, i64 %11
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !52
  %60 = getelementptr double, ptr addrspace(1) %arg2187, i64 %14
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !52
  %62 = select i1 %17, double %61, double 0.000000e+00
  %multiply.1185.37 = fmul double %55, %62
  %multiply.1187.19 = fmul double %57, %multiply.1185.37
  %63 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg1881, i64 0, i64 %10, i64 %21, i64 %11
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !52
  %multiply.1188.15 = fmul double %multiply.1169.11, %64
  %add.692.17 = fadd double %multiply.1188.15, %multiply.1187.19
  %multiply.1189.7 = fmul double %59, %add.692.17
  %add.693.7 = fadd double %multiply.1184.9, %multiply.1189.7
  %add.695.5 = fadd double %48, %add.693.7
  %65 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1575, i64 0, i64 %10, i64 %11
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !52
  %multiply.1190.5 = fmul double %66, %add.695.5
  %67 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg147, i64 0, i64 0, i64 %11
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !52
  %69 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg657, i64 0, i64 %10, i64 %21, i64 %11
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !52
  %multiply.1192.5 = fmul double %68, %70
  %add.696.3 = fadd double %multiply.1192.5, %multiply.1190.5
  %71 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1677, i64 0, i64 %10, i64 %11
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !52
  %multiply.1193.7 = fmul double %72, %add.696.3
  %multiply.1172.3 = fmul double %66, %68
  %73 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg555, i64 0, i64 %10, i64 %21, i64 %11
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !52
  %multiply.1194.3 = fmul double %multiply.1172.3, %74
  %add.697.5 = fadd double %multiply.1194.3, %multiply.1193.7
  %add.698.3 = fsub double %18, %add.697.5
  %75 = getelementptr double, ptr addrspace(1) %arg1065, i64 %14
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !52
  %77 = getelementptr inbounds [192 x [1 x [120 x [20 x double]]]], ptr addrspace(1) %arg963, i64 0, i64 %10, i64 0, i64 %21, i64 %11
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !52
  %add.699.15 = fadd double %76, %78
  %79 = select i1 %17, double %add.699.15, double 0.000000e+00
  %multiply.1195.9 = fmul double %68, %74
  %multiply.1197.33 = fmul double %72, %add.695.5
  %add.700.31 = fadd double %multiply.1195.9, %multiply.1197.33
  %80 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1473, i64 0, i64 %10, i64 %11
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !52
  %multiply.1198.29 = fmul double %add.700.31, %81
  %multiply.1174.3 = fmul double %68, %72
  %82 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg861, i64 0, i64 %10, i64 %21, i64 %11
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !52
  %multiply.1200.9 = fmul double %multiply.1174.3, %83
  %add.701.27 = fadd double %multiply.1198.29, %multiply.1200.9
  %add.702.21 = fadd double %79, %add.701.27
  %84 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1371, i64 0, i64 %10, i64 %11
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !52
  %multiply.1202.7 = fmul double %85, %add.702.21
  %86 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg35115, i64 0, i64 0, i64 %11
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !52
  %88 = getelementptr inbounds [192 x [1 x [20 x double]]], ptr addrspace(1) %arg36117, i64 0, i64 %10, i64 0, i64 %11
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !52
  %add.681.13 = fadd double %87, %89
  %90 = select i1 %17, double %add.681.13, double 0.000000e+00
  %91 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg34113, i64 0, i64 %11
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !52
  %93 = select i1 %17, double %92, double 0.000000e+00
  %multiply.1175.13 = fmul double %multiply.1174.3, %81
  %add.686.13 = fadd double %multiply.1175.13, %93
  %add.687.9 = fadd double %90, %add.686.13
  %94 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg759, i64 0, i64 %10, i64 %21, i64 %11
  %95 = load double, ptr addrspace(1) %94, align 8, !invariant.load !52
  %multiply.1203.7 = fmul double %95, %add.687.9
  %add.703.5 = fadd double %multiply.1202.7, %multiply.1203.7
  %96 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1269, i64 0, i64 %10, i64 %11
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !52
  %multiply.1205.3 = fmul double %97, %add.703.5
  %multiply.1176.7 = fmul double %85, %add.687.9
  %98 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg453, i64 0, i64 %10, i64 %21, i64 %11
  %99 = load double, ptr addrspace(1) %98, align 8, !invariant.load !52
  %multiply.1206.11 = fmul double %99, %multiply.1176.7
  %add.704.9 = fadd double %multiply.1206.11, %multiply.1205.3
  %100 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1167, i64 0, i64 %10, i64 %11
  %101 = load double, ptr addrspace(1) %100, align 8, !invariant.load !52
  %multiply.1207.7 = fmul double %101, %add.704.9
  %multiply.1177.3 = fmul double %97, %multiply.1176.7
  %102 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg249, i64 0, i64 %10, i64 %21, i64 %11
  %103 = load double, ptr addrspace(1) %102, align 8, !invariant.load !52
  %multiply.1208.3 = fmul double %multiply.1177.3, %103
  %add.705.5 = fadd double %multiply.1208.3, %multiply.1207.7
  %add.706.1 = fsub double %add.698.3, %add.705.5
  %104 = getelementptr double, ptr addrspace(1) %arg38121, i64 %14
  store double %add.706.1, ptr addrspace(1) %104, align 8
  br label %loop_add_fusion.2.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_3(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg2) local_unnamed_addr #2 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_dynamic_slice_fusion.3.in_bounds-true, label %loop_dynamic_slice_fusion.3.in_bounds-after

loop_dynamic_slice_fusion.3.in_bounds-after:      ; preds = %loop_dynamic_slice_fusion.3.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.3.in_bounds-true:       ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !52
  %7 = trunc i64 %6 to i32
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 191)
  %10 = zext nneg i32 %9 to i64
  %11 = zext nneg i16 %4 to i64
  %12 = zext nneg i16 %.decomposed to i64
  %13 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg04, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !52
  %15 = zext nneg i32 %linear_index to i64
  %16 = getelementptr double, ptr addrspace(1) %arg28, i64 %15
  store double %14, ptr addrspace(1) %16, align 8
  br label %loop_dynamic_slice_fusion.3.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg8) local_unnamed_addr #2 {
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
define void @loop_broadcast_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !58
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.3.in_bounds-true, label %loop_broadcast_fusion.3.in_bounds-after

loop_broadcast_fusion.3.in_bounds-after:          ; preds = %loop_broadcast_fusion.3.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.3.in_bounds-true:           ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.3.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg12) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_add_multiply_negate_fusion.in_bounds-true, label %loop_add_multiply_negate_fusion.in_bounds-after

loop_add_multiply_negate_fusion.in_bounds-after:  ; preds = %loop_add_multiply_negate_fusion.in_bounds-true, %entry
  ret void

loop_add_multiply_negate_fusion.in_bounds-true:   ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = urem i16 %.lhs.trunc, 20
  %5 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !52
  %6 = zext nneg i32 %linear_index to i64
  %7 = getelementptr double, ptr addrspace(1) %arg613, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !52
  %9 = zext nneg i16 %4 to i64
  %10 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg511, i64 0, i64 %9
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !52
  %multiply.1153.5 = fmul double %8, %11
  %12 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg49, i64 0, i64 0, i64 %9
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !52
  %14 = getelementptr double, ptr addrspace(1) %arg37, i64 %6
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !52
  %multiply.1154.5 = fmul double %13, %15
  %add.676.5 = fadd double %multiply.1153.5, %multiply.1154.5
  %16 = fneg double %add.676.5
  %multiply.1157.1 = fmul double %5, %16
  %17 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg25, i64 0, i64 %9
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !52
  %multiply.1158.1 = fmul double %18, %multiply.1157.1
  %19 = fneg double %13
  %20 = fmul double %11, %19
  %multiply.1150.3 = fmul double %5, %20
  %21 = getelementptr double, ptr addrspace(1) %arg01, i64 %6
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !52
  %multiply.1159.1 = fmul double %multiply.1150.3, %22
  %add.678.1 = fadd double %multiply.1159.1, %multiply.1158.1
  %23 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg715, i64 0, i64 %9
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !52
  %multiply.1160.1.clone.1 = fmul double %24, %add.678.1
  %25 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg919, i64 0, i64 %9
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !52
  %27 = getelementptr double, ptr addrspace(1) %arg817, i64 %6
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !52
  %multiply.1156.3.clone.1 = fmul double %20, %28
  %29 = fmul double %add.676.5, %26
  %add.677.3.clone.1 = fsub double %multiply.1156.3.clone.1, %29
  %30 = fneg double %add.677.3.clone.1
  %31 = getelementptr double, ptr addrspace(1) %arg1021, i64 %6
  store double %add.678.1, ptr addrspace(1) %31, align 8
  %32 = getelementptr double, ptr addrspace(1) %arg1123, i64 %6
  store double %multiply.1160.1.clone.1, ptr addrspace(1) %32, align 8
  %33 = getelementptr double, ptr addrspace(1) %arg1225, i64 %6
  store double %30, ptr addrspace(1) %33, align 8
  br label %loop_add_multiply_negate_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #2 {
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
define void @loop_broadcast_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg0) local_unnamed_addr #3 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !58
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.6.in_bounds-true, label %loop_broadcast_fusion.6.in_bounds-after

loop_broadcast_fusion.6.in_bounds-after:          ; preds = %loop_broadcast_fusion.6.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.6.in_bounds-true:           ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.6.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg5) local_unnamed_addr #2 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_multiply_select_fusion.in_bounds-true, label %loop_multiply_select_fusion.in_bounds-after

loop_multiply_select_fusion.in_bounds-after:      ; preds = %loop_multiply_select_fusion.in_bounds-true, %entry
  ret void

loop_multiply_select_fusion.in_bounds-true:       ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = urem i16 %.lhs.trunc, 20
  %5 = zext nneg i16 %4 to i64
  %6 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg13, i64 0, i64 %5
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !52
  %8 = zext nneg i32 %linear_index to i64
  %9 = getelementptr double, ptr addrspace(1) %arg01, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !52
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, double %10, double 0.000000e+00
  %13 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg37, i64 0, i64 %5
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !52
  %15 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !52
  %multiply.1163.1.clone.1 = fmul double %12, %15
  %multiply.1164.1.clone.1 = fmul double %14, %multiply.1163.1.clone.1
  %16 = getelementptr double, ptr addrspace(1) %arg49, i64 %8
  store double %12, ptr addrspace(1) %16, align 8
  %17 = getelementptr double, ptr addrspace(1) %arg511, i64 %8
  store double %multiply.1164.1.clone.1, ptr addrspace(1) %17, align 8
  br label %loop_multiply_select_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg25, ptr noalias nocapture align 128 dereferenceable(160) %arg26, ptr noalias nocapture align 128 dereferenceable(160) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg30) local_unnamed_addr #2 {
entry:
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
  %1 = load i64, ptr addrspace(1) %arg326, align 128, !invariant.load !52
  %2 = trunc i64 %1 to i32
  %3 = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  %4 = tail call i32 @llvm.umin.i32(i32 %3, i32 191)
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg1142, i64 0, i64 %5, i64 %6
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !52
  %9 = getelementptr double, ptr addrspace(1) %arg530, i64 %6
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !52
  %11 = getelementptr inbounds [192 x [1 x [20 x double]]], ptr addrspace(1) %arg632, i64 0, i64 %5, i64 0, i64 %6
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !52
  %add.681.5 = fadd double %10, %12
  %13 = trunc i8 %8 to i1
  %14 = select i1 %13, double 0.000000e+00, double %add.681.5
  %15 = getelementptr double, ptr addrspace(1) %arg020, i64 %6
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !52
  %17 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg428, i64 0, i64 %5, i64 %6
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !52
  %19 = getelementptr double, ptr addrspace(1) %arg122, i64 %6
  %20 = load double, ptr addrspace(1) %19, align 8
  %21 = select i1 %13, double %20, double 0.000000e+00
  %22 = getelementptr double, ptr addrspace(1) %arg836, i64 %6
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !52
  %24 = select i1 %13, double %23, double 0.000000e+00
  %25 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1040, i64 0, i64 %5, i64 %6
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !52
  %27 = getelementptr double, ptr addrspace(1) %arg938, i64 %6
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !52
  %multiply.1174.9 = fmul double %26, %28
  %29 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg734, i64 0, i64 %5, i64 %6
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !52
  %multiply.1175.3 = fmul double %multiply.1174.9, %30
  %add.686.3 = fadd double %24, %multiply.1175.3
  %add.707.3 = fsub double %21, %add.686.3
  %31 = select i1 %13, double %add.681.5, double 0.000000e+00
  %add.687.3 = fadd double %31, %add.686.3
  %add.708.11 = fadd double %16, %add.687.3
  %add.709.9 = fadd double %add.707.3, %add.708.11
  %32 = getelementptr double, ptr addrspace(1) %arg1958, i64 %6
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !52
  %34 = select i1 %13, double %33, double 0.000000e+00
  %add.710.11 = fadd double %16, %34
  %35 = getelementptr double, ptr addrspace(1) %arg1856, i64 %6
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !52
  %37 = select i1 %13, double %36, double 0.000000e+00
  %38 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1754, i64 0, i64 %5, i64 %6
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !52
  %multiply.1210.11 = fmul double %39, %add.687.3
  %40 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1652, i64 0, i64 %5
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !52
  %multiply.1211.13 = fmul double %multiply.1210.11, %41
  %add.711.13 = fadd double %16, %multiply.1211.13
  %add.712.11 = fadd double %37, %add.711.13
  %42 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1550, i64 0, i64 %5, i64 %6
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !52
  %44 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1448, i64 0, i64 %5
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !52
  %46 = fneg double %add.712.11
  %47 = fdiv double %46, %43
  %48 = fmul double %45, %47
  %add.713.9 = fadd double %add.710.11, %48
  %49 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1346, i64 0, i64 %5, i64 %6
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !52
  %51 = getelementptr double, ptr addrspace(1) %arg2774, i64 %6
  %52 = load double, ptr addrspace(1) %51, align 8
  %53 = getelementptr double, ptr addrspace(1) %arg2672, i64 %6
  %54 = load double, ptr addrspace(1) %53, align 8
  %55 = fadd double %52, %54
  %add.714.1.clone.1 = select i1 %13, double %55, double 0.000000e+00
  %56 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2570, i64 0, i64 %5, i64 %6
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !52
  %58 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2468, i64 0, i64 %5, i64 %6
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !52
  %multiply.1176.3.clone.1 = fmul double %add.687.3, %59
  %60 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2366, i64 0, i64 %5, i64 %6
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !52
  %divide.53.11.clone.1 = fdiv double %multiply.1176.3.clone.1, %61
  %multiply.1213.9.clone.1 = fmul double %57, %divide.53.11.clone.1
  %62 = getelementptr double, ptr addrspace(1) %arg2264, i64 %6
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !52
  %add.715.7.clone.1 = fadd double %63, %multiply.1213.9.clone.1
  %add.716.5.clone.1 = fadd double %add.714.1.clone.1, %add.715.7.clone.1
  %add.717.3.clone.1 = fadd double %16, %add.716.5.clone.1
  %64 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2162, i64 0, i64 %5, i64 %6
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !52
  %66 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2060, i64 0, i64 %5, i64 %6
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !52
  %68 = fmul double %65, %46
  %69 = fmul double %68, %67
  %add.718.1.clone.1 = fadd double %69, %add.717.3.clone.1
  %70 = fmul double %50, %add.718.1.clone.1
  %add.719.7 = fsub double %add.713.9, %70
  %71 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1244, i64 0, i64 %5, i64 %6
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !52
  %multiply.1219.5 = fmul double %72, %add.718.1.clone.1
  %add.720.5 = fadd double %multiply.1219.5, %add.719.7
  %73 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg224, i64 0, i64 %5, i64 %6
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !52
  %multiply.1220.1 = fmul double %74, %add.720.5
  %add.721.7 = fadd double %add.709.9, %multiply.1220.1
  %multiply.1221.5 = fmul double %18, %add.721.7
  %add.722.3 = fadd double %16, %multiply.1221.5
  %add.723.1 = fadd double %14, %add.722.3
  %75 = select i1 %13, double 0.000000e+00, double %20
  %76 = select i1 %13, double 0.000000e+00, double %36
  %77 = select i1 %13, double 0.000000e+00, double %54
  %78 = select i1 %13, double 0.000000e+00, double %52
  %79 = getelementptr double, ptr addrspace(1) %arg2876, i64 %6
  store double %add.723.1, ptr addrspace(1) %79, align 8
  %80 = getelementptr double, ptr addrspace(1) %arg2978, i64 %6
  store double %add.718.1.clone.1, ptr addrspace(1) %80, align 8
  store double %75, ptr addrspace(1) %19, align 8
  %81 = getelementptr double, ptr addrspace(1) %arg3080, i64 %6
  store double %76, ptr addrspace(1) %81, align 8
  store double %77, ptr addrspace(1) %53, align 8
  store double %78, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg13, ptr noalias nocapture align 128 dereferenceable(160) %arg14, ptr noalias nocapture align 128 dereferenceable(160) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg19, ptr noalias nocapture align 128 dereferenceable(160) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg27, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg31, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg32, ptr noalias nocapture align 128 dereferenceable(160) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg35, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg37, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg39, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg41, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg43, ptr noalias nocapture align 128 dereferenceable(160) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg45, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg46, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg47, ptr noalias nocapture align 128 dereferenceable(160) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg49, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg50, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg51, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg53, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg55, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg57, ptr noalias nocapture align 128 dereferenceable(160) %arg58, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg59, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg60, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg61, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg62, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg63, ptr noalias nocapture align 128 dereferenceable(160) %arg64, ptr noalias nocapture readnone align 16 dereferenceable(3840) %arg65, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg66, ptr noalias nocapture align 128 dereferenceable(160) %arg67, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg68, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg69, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg70, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg71, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg72, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg73, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg74, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg75) local_unnamed_addr #2 {
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
  %7 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg662, i64 0, i64 %5, i64 %6
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !52
  %9 = getelementptr double, ptr addrspace(1) %arg152, i64 %6
  %10 = load double, ptr addrspace(1) %9, align 8
  %11 = trunc i8 %8 to i1
  %12 = select i1 %11, double 0.000000e+00, double %10
  %13 = getelementptr double, ptr addrspace(1) %arg050, i64 %6
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !52
  %15 = getelementptr double, ptr addrspace(1) %arg48146, i64 %6
  %16 = load double, ptr addrspace(1) %15, align 8
  %17 = select i1 %11, double %16, double 0.000000e+00
  %18 = getelementptr double, ptr addrspace(1) %arg45140, i64 %6
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !52
  %20 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg47144, i64 0, i64 %5, i64 %6
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !52
  %multiply.1222.1.clone.1 = fmul double %19, %21
  %22 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg46142, i64 0, i64 %5, i64 %6
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !52
  %divide.54.9.clone.1 = fdiv double %19, %23
  %add.724.7.clone.1 = fadd double %multiply.1222.1.clone.1, %divide.54.9.clone.1
  %add.725.5.clone.1 = fadd double %17, %add.724.7.clone.1
  %24 = getelementptr double, ptr addrspace(1) %arg44138, i64 %6
  %25 = load double, ptr addrspace(1) %24, align 8
  %add.726.3.clone.1 = fadd double %25, %add.725.5.clone.1
  %26 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg43136, i64 0, i64 %5, i64 %6
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !52
  %28 = getelementptr double, ptr addrspace(1) %arg58166, i64 %6
  %29 = load double, ptr addrspace(1) %28, align 8
  %30 = select i1 %11, double %29, double 0.000000e+00
  %31 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg41132, i64 0, i64 %5, i64 %6
  %32 = load i8, ptr addrspace(1) %31, align 1, !invariant.load !52
  %33 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg57164, i64 0, i64 %5, i64 %6
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !52
  %35 = getelementptr double, ptr addrspace(1) %arg53156, i64 %6
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !52
  %37 = fneg double %36
  %38 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg56162, i64 0, i64 %5, i64 %6
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !52
  %multiply.1224.5.clone.1 = fmul double %39, %37
  %multiply.1225.1.clone.1 = fmul double %34, %multiply.1224.5.clone.1
  %40 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg55160, i64 0, i64 %5, i64 %6
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !52
  %multiply.1226.9.clone.1 = fmul double %36, %39
  %42 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg54158, i64 0, i64 %5, i64 %6
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !52
  %multiply.1227.5.clone.1 = fmul double %multiply.1226.9.clone.1, %43
  %multiply.1229.1.clone.1 = fmul double %41, %multiply.1227.5.clone.1
  %add.727.1.clone.1 = fadd double %multiply.1225.1.clone.1, %multiply.1229.1.clone.1
  %multiply.1230.9.clone.1 = fmul double %36, 5.000000e-01
  %44 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg52154, i64 0, i64 %5, i64 %6
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !52
  %multiply.1231.5.clone.1 = fmul double %multiply.1230.9.clone.1, %45
  %multiply.1233.1.clone.1 = fmul double %41, %multiply.1231.5.clone.1
  %add.728.1.clone.1 = fadd double %add.727.1.clone.1, %multiply.1233.1.clone.1
  %46 = trunc i8 %32 to i1
  %47 = select i1 %46, double %add.728.1.clone.1, double 0.000000e+00
  %48 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg51152, i64 0, i64 %5, i64 %6
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !52
  %50 = getelementptr double, ptr addrspace(1) %arg1682, i64 %6
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !52
  %52 = select i1 %11, double %51, double 0.000000e+00
  %53 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg38126, i64 0, i64 %5, i64 %6
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !52
  %multiply.1169.13.clone.1 = fmul double %52, %54
  %55 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg50150, i64 0, i64 %5, i64 %6
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !52
  %multiply.1170.3.clone.1 = fmul double %multiply.1169.13.clone.1, %56
  %57 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg49148, i64 0, i64 %5, i64 %6
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !52
  %multiply.1234.5.clone.1 = fmul double %multiply.1170.3.clone.1, %58
  %multiply.1235.1.clone.1 = fmul double %49, %multiply.1234.5.clone.1
  %add.729.3.clone.1 = fadd double %47, %multiply.1235.1.clone.1
  %add.730.3.clone.1 = fadd double %30, %add.729.3.clone.1
  %59 = getelementptr double, ptr addrspace(1) %arg764, i64 %6
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !52
  %add.731.1.clone.1 = fadd double %60, %add.730.3.clone.1
  %multiply.1236.1.clone.1 = fmul double %27, %add.731.1.clone.1
  %add.732.1.clone.1 = fadd double %add.726.3.clone.1, %multiply.1236.1.clone.1
  %61 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg560, i64 0, i64 %5, i64 %6
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !52
  %63 = fneg double %add.732.1.clone.1
  %64 = fmul double %62, %63
  %65 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg458, i64 0, i64 %5, i64 %6
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !52
  %67 = getelementptr double, ptr addrspace(1) %arg866, i64 %6
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !52
  %69 = select i1 %11, double %68, double 0.000000e+00
  %add.733.5 = fadd double %60, %69
  %70 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg254, i64 0, i64 %5, i64 %6
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
  %82 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg1274, i64 0, i64 %5, i64 %6
  %83 = load i8, ptr addrspace(1) %82, align 1, !invariant.load !52
  %84 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1172, i64 0, i64 %5, i64 %6
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !52
  %multiply.1241.5.clone.1.clone.1 = fmul double %add.731.1.clone.1, %85
  %add.740.5.clone.1.clone.1 = fadd double %64, %multiply.1241.5.clone.1.clone.1
  %86 = trunc i8 %83 to i1
  %87 = select i1 %86, double %add.740.5.clone.1.clone.1, double 0.000000e+00
  %multiply.1243.5.clone.1.clone.1 = fmul double %81, %87
  %88 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1070, i64 0, i64 %5, i64 %6
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !52
  %multiply.1244.5.clone.1.clone.1 = fmul double %89, %multiply.1243.5.clone.1.clone.1
  %add.741.1.clone.1.clone.1 = fadd double %79, %multiply.1244.5.clone.1.clone.1
  %add.742.1.clone.1.clone.1 = fadd double %add.739.3.clone.1.clone.1, %add.741.1.clone.1.clone.1
  %90 = getelementptr double, ptr addrspace(1) %arg1580, i64 %6
  %91 = load double, ptr addrspace(1) %90, align 8
  %92 = select i1 %11, double 0.000000e+00, double %91
  %93 = select i1 %11, double 0.000000e+00, double %51
  %94 = getelementptr double, ptr addrspace(1) %arg1886, i64 %6
  %95 = load double, ptr addrspace(1) %94, align 8, !invariant.load !52
  %96 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1988, i64 0, i64 %5, i64 %6
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !52
  %multiply.1245.1.clone.1.clone.1.clone.1 = fmul double %97, %multiply.1244.5.clone.1.clone.1
  %add.743.1.clone.1.clone.1.clone.1 = fadd double %95, %multiply.1245.1.clone.1.clone.1.clone.1
  %98 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1784, i64 0, i64 %5, i64 %6
  %99 = load double, ptr addrspace(1) %98, align 8, !invariant.load !52
  %100 = select i1 %11, double %91, double 0.000000e+00
  %add.744.3.clone.1.clone.1.clone.1 = fadd double %52, %100
  %add.745.7.clone.1.clone.1.clone.1 = fadd double %60, %add.744.3.clone.1.clone.1.clone.1
  %multiply.1246.5.clone.1.clone.1.clone.1 = fmul double %99, %add.745.7.clone.1.clone.1.clone.1
  %add.746.3.clone.1.clone.1.clone.1 = fadd double %multiply.1246.5.clone.1.clone.1.clone.1, %add.743.1.clone.1.clone.1.clone.1
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
  %112 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg32114, i64 0, i64 %5, i64 %6
  %113 = load i8, ptr addrspace(1) %112, align 1, !invariant.load !52
  %114 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg31112, i64 0, i64 %5, i64 %6
  %115 = load double, ptr addrspace(1) %114, align 8, !invariant.load !52
  %116 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg30110, i64 0, i64 %5, i64 %6
  %117 = load i32, ptr addrspace(1) %116, align 4, !invariant.load !52
  %118 = icmp eq i32 %117, 0
  %119 = getelementptr double, ptr addrspace(1) %arg29108, i64 %6
  %120 = load double, ptr addrspace(1) %119, align 8, !invariant.load !52
  %121 = select i1 %11, double %120, double 0.000000e+00
  %122 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg28106, i64 0, i64 %5, i64 %6
  %123 = load double, ptr addrspace(1) %122, align 8, !invariant.load !52
  %.neg = fneg double %121
  %124 = select i1 %118, double %.neg, double -0.000000e+00
  %125 = fmul double %123, %124
  %multiply.1256.5.clone.1.clone.1 = fmul double %115, %125
  %126 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg27104, i64 0, i64 %5, i64 %6
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !52
  %multiply.1257.1.clone.1.clone.1 = fmul double %127, %multiply.1256.5.clone.1.clone.1
  %128 = trunc i8 %113 to i1
  %129 = select i1 %128, double %multiply.1257.1.clone.1.clone.1, double 0.000000e+00
  %add.759.5.clone.1.clone.1 = fadd double %60, %129
  %130 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg26102, i64 0, i64 %5, i64 %6
  %131 = load i8, ptr addrspace(1) %130, align 1, !invariant.load !52
  %132 = select i1 %11, double %102, double 0.000000e+00
  %133 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg40130, i64 0, i64 %5, i64 %6
  %134 = load i8, ptr addrspace(1) %133, align 1, !invariant.load !52
  %135 = icmp eq i32 %117, 1
  %136 = trunc i8 %134 to i1
  %137 = select i1 %46, i1 %136, i1 false
  %138 = select i1 %137, i1 %135, i1 false
  %139 = select i1 %138, double %121, double 0.000000e+00
  %140 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg39128, i64 0, i64 %5, i64 %6
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !52
  %142 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg37124, i64 0, i64 %5, i64 %6
  %143 = load double, ptr addrspace(1) %142, align 8, !invariant.load !52
  %144 = fneg double %141
  %145 = fmul double %multiply.1169.13.clone.1, %144
  %146 = fmul double %145, %143
  %multiply.1251.1.clone.1.clone.1 = fmul double %146, 2.000000e+00
  %add.749.3.clone.1.clone.1 = fadd double %139, %multiply.1251.1.clone.1.clone.1
  %add.750.3.clone.1.clone.1 = fadd double %132, %add.749.3.clone.1.clone.1
  %add.751.3.clone.1.clone.1 = fadd double %60, %add.750.3.clone.1.clone.1
  %147 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg36122, i64 0, i64 %5, i64 %6
  %148 = load double, ptr addrspace(1) %147, align 8, !invariant.load !52
  %149 = select i1 %11, double %105, double 0.000000e+00
  %add.752.5.clone.1.clone.1 = fadd double %60, %149
  %multiply.1252.3.clone.1.clone.1 = fmul double %add.752.5.clone.1.clone.1, %148
  %add.753.1.clone.1.clone.1 = fadd double %multiply.1252.3.clone.1.clone.1, %add.751.3.clone.1.clone.1
  %150 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg25100, i64 0, i64 %5, i64 %6
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !52
  %152 = fneg double %add.753.1.clone.1.clone.1
  %153 = fmul double %151, %152
  %154 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2498, i64 0, i64 %5, i64 %6
  %155 = load double, ptr addrspace(1) %154, align 8, !invariant.load !52
  %multiply.1258.11.clone.1.clone.1 = fmul double %add.752.5.clone.1.clone.1, %155
  %add.760.9.clone.1.clone.1 = fadd double %multiply.1258.11.clone.1.clone.1, %153
  %156 = trunc i8 %131 to i1
  %157 = select i1 %156, double %add.760.9.clone.1.clone.1, double 0.000000e+00
  %multiply.1260.5.clone.1.clone.1 = fmul double %81, %157
  %158 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2396, i64 0, i64 %5, i64 %6
  %159 = load double, ptr addrspace(1) %158, align 8, !invariant.load !52
  %multiply.1261.1.clone.1.clone.1 = fmul double %159, %multiply.1260.5.clone.1.clone.1
  %add.761.3.clone.1.clone.1 = fadd double %add.759.5.clone.1.clone.1, %multiply.1261.1.clone.1.clone.1
  %add.762.1.clone.1.clone.1 = fadd double %add.758.3.clone.1.clone.1, %add.761.3.clone.1.clone.1
  %160 = select i1 %11, double 0.000000e+00, double %120
  %161 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg42134, i64 0, i64 %5, i64 %6
  %162 = load double, ptr addrspace(1) %161, align 8, !invariant.load !52
  %163 = fneg double %125
  %164 = fmul double %162, %163
  %165 = select i1 %128, double %164, double 0.000000e+00
  %add.748.5.clone.1 = fadd double %60, %165
  %166 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg35120, i64 0, i64 %5, i64 %6
  %167 = load double, ptr addrspace(1) %166, align 8, !invariant.load !52
  %168 = select i1 %11, double %108, double 0.000000e+00
  %add.754.5.clone.1 = fadd double %60, %168
  %169 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg34118, i64 0, i64 %5, i64 %6
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
  %176 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg63176, i64 0, i64 %5, i64 %6, i64 0
  %177 = load i8, ptr addrspace(1) %176, align 1, !invariant.load !52
  %178 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg62174, i64 0, i64 %5, i64 %6
  %179 = load double, ptr addrspace(1) %178, align 8, !invariant.load !52
  %multiply.1262.5.clone.1 = fmul double %multiply.1224.5.clone.1, %179
  %multiply.1263.5.clone.1 = fmul double %multiply.1262.5.clone.1, 5.000000e-01
  %180 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg61172, i64 0, i64 %5, i64 %6
  %181 = load double, ptr addrspace(1) %180, align 8, !invariant.load !52
  %multiply.1264.1.clone.1 = fmul double %181, %multiply.1263.5.clone.1
  %multiply.1266.1.clone.1 = fmul double %multiply.1227.5.clone.1, %179
  %add.764.1.clone.1 = fadd double %multiply.1266.1.clone.1, %multiply.1264.1.clone.1
  %multiply.1267.1.clone.1 = fmul double %multiply.1231.5.clone.1, %179
  %add.765.1.clone.1 = fadd double %multiply.1267.1.clone.1, %add.764.1.clone.1
  %182 = trunc i8 %177 to i1
  %183 = select i1 %182, double %add.765.1.clone.1, double 0.000000e+00
  %184 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg60170, i64 0, i64 %5, i64 %6
  %185 = load double, ptr addrspace(1) %184, align 8, !invariant.load !52
  %multiply.1269.1.clone.1 = fmul double %multiply.1234.5.clone.1, %185
  %add.766.5.clone.1 = fadd double %multiply.1269.1.clone.1, %183
  %186 = getelementptr double, ptr addrspace(1) %arg59168, i64 %6
  %187 = load double, ptr addrspace(1) %186, align 8, !invariant.load !52
  %add.767.3.clone.1 = fadd double %187, %add.766.5.clone.1
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
define void @loop_add_fusion(ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg31, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg35, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg37, ptr noalias nocapture align 128 dereferenceable(19200) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg41, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg43, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg45, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg46, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg47, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg48, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg49, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg50, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg51, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg53, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg55, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg57, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg58, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg59, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg60, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg61, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg62, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg63, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg64, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg65, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg66, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg67, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg68, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg69, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg70, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg71, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg72, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg73, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg74, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg75, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg76, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg77, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg78, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg79, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg80, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg81, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg82, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg83, ptr noalias nocapture align 128 dereferenceable(19200) %arg84, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg85) local_unnamed_addr #2 {
entry:
  %arg85266 = addrspacecast ptr %arg85 to ptr addrspace(1)
  %arg84264 = addrspacecast ptr %arg84 to ptr addrspace(1)
  %arg83262 = addrspacecast ptr %arg83 to ptr addrspace(1)
  %arg82260 = addrspacecast ptr %arg82 to ptr addrspace(1)
  %arg81258 = addrspacecast ptr %arg81 to ptr addrspace(1)
  %arg80256 = addrspacecast ptr %arg80 to ptr addrspace(1)
  %arg79254 = addrspacecast ptr %arg79 to ptr addrspace(1)
  %arg78252 = addrspacecast ptr %arg78 to ptr addrspace(1)
  %arg77250 = addrspacecast ptr %arg77 to ptr addrspace(1)
  %arg76248 = addrspacecast ptr %arg76 to ptr addrspace(1)
  %arg75246 = addrspacecast ptr %arg75 to ptr addrspace(1)
  %arg74244 = addrspacecast ptr %arg74 to ptr addrspace(1)
  %arg73242 = addrspacecast ptr %arg73 to ptr addrspace(1)
  %arg72240 = addrspacecast ptr %arg72 to ptr addrspace(1)
  %arg71238 = addrspacecast ptr %arg71 to ptr addrspace(1)
  %arg70236 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69234 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68232 = addrspacecast ptr %arg68 to ptr addrspace(1)
  %arg67230 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66228 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg65226 = addrspacecast ptr %arg65 to ptr addrspace(1)
  %arg64224 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63222 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62220 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61218 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60216 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59214 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58212 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57210 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56208 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55206 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54204 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53202 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52200 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51198 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50196 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49194 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48192 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47190 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46188 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45186 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44184 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg43182 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg42180 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41178 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40176 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39174 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38172 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37170 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36168 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35166 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34164 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33162 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32160 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31158 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30156 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29154 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28152 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27150 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26148 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25146 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24144 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23142 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22140 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21138 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20136 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19134 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18132 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17130 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16128 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15126 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14124 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13122 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12120 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11118 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10116 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9114 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8112 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7110 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6108 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5106 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4104 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3102 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2100 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg198 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg096 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = load i64, ptr addrspace(1) %arg2100, align 128, !invariant.load !52
  %7 = trunc i64 %6 to i32
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 191)
  %10 = zext nneg i32 %9 to i64
  %11 = zext nneg i16 %.decomposed to i64
  %12 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg10116, i64 0, i64 %10, i64 %11
  %13 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !52
  %14 = zext nneg i32 %linear_index to i64
  %15 = getelementptr double, ptr addrspace(1) %arg096, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !52
  %17 = trunc i8 %13 to i1
  %18 = select i1 %17, double 0.000000e+00, double %16
  %19 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg7110, i64 0, i64 %10, i64 %11
  %20 = load i8, ptr addrspace(1) %19, align 1, !invariant.load !52
  %21 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg15126, i64 0, i64 %10, i64 %11
  %22 = load i32, ptr addrspace(1) %21, align 4, !invariant.load !52
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %17, double %16, double 0.000000e+00
  %25 = select i1 %23, double %24, double 0.000000e+00
  %26 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg16128, i64 0, i64 %10, i64 %11
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !52
  %multiply.1343.9 = fmul double %27, %25
  %28 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg14124, i64 0, i64 0, i64 %11
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !52
  %30 = select i1 %23, i1 %17, i1 false
  %31 = select i1 %30, double %29, double 0.000000e+00
  %32 = zext nneg i16 %4 to i64
  %33 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg13122, i64 0, i64 %10, i64 %32, i64 %11
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !52
  %multiply.1344.7 = fmul double %31, %34
  %add.816.7 = fadd double %multiply.1343.9, %multiply.1344.7
  %35 = fneg double %add.816.7
  %36 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg6108, i64 0, i64 %10, i64 %11
  %37 = load double, ptr addrspace(1) %36, align 8, !invariant.load !52
  %38 = fneg double %31
  %39 = fmul double %27, %38
  %40 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg4104, i64 0, i64 %10, i64 %32, i64 %11
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !52
  %multiply.1346.5 = fmul double %39, %41
  %42 = fmul double %37, %add.816.7
  %add.817.7 = fsub double %multiply.1346.5, %42
  %43 = fneg double %add.817.7
  %44 = trunc i8 %20 to i1
  %45 = select i1 %44, double %43, double 0.000000e+00
  %46 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg27150, i64 0, i64 %10, i64 %11
  %47 = load i8, ptr addrspace(1) %46, align 1, !invariant.load !52
  %48 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg26148, i64 0, i64 %10, i64 %11
  %49 = load i8, ptr addrspace(1) %48, align 1, !invariant.load !52
  %50 = icmp eq i32 %22, 1
  %51 = trunc i8 %49 to i1
  %52 = select i1 %51, i1 %50, i1 false
  %53 = select i1 %52, double %24, double 0.000000e+00
  %54 = trunc i8 %47 to i1
  %55 = select i1 %54, double %53, double 0.000000e+00
  %56 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg25146, i64 0, i64 %10, i64 %32, i64 %11
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !52
  %58 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg28152, i64 0, i64 0, i64 %11
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !52
  %60 = select i1 %17, double %59, double 0.000000e+00
  %61 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg23142, i64 0, i64 %10, i64 %11
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !52
  %multiply.1169.9 = fmul double %60, %62
  %multiply.1347.7 = fmul double %57, %multiply.1169.9
  %63 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg21138, i64 0, i64 %10, i64 %11
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !52
  %65 = getelementptr double, ptr addrspace(1) %arg24144, i64 %14
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !52
  %67 = select i1 %17, double %66, double 0.000000e+00
  %multiply.1185.33 = fmul double %62, %67
  %multiply.1348.15 = fmul double %64, %multiply.1185.33
  %add.818.13 = fadd double %multiply.1347.7, %multiply.1348.15
  %68 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg22140, i64 0, i64 %10, i64 %11
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !52
  %multiply.1349.11 = fmul double %69, %add.818.13
  %multiply.1249.9 = fmul double %64, %multiply.1169.9
  %70 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg20136, i64 0, i64 %10, i64 %32, i64 %11
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !52
  %multiply.1350.9 = fmul double %multiply.1249.9, %71
  %add.819.9 = fadd double %multiply.1350.9, %multiply.1349.11
  %multiply.1351.7 = fmul double %add.819.9, 2.000000e+00
  %72 = fsub double %55, %multiply.1351.7
  %73 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg19134, i64 0, i64 %10, i64 %32, i64 %11
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !52
  %75 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg18132, i64 0, i64 %11
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !52
  %77 = select i1 %17, double %76, double 0.000000e+00
  %78 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg11118, i64 0, i64 %11
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !52
  %add.752.17 = fadd double %77, %79
  %multiply.1352.7 = fmul double %74, %add.752.17
  %add.821.11 = fadd double %multiply.1352.7, %72
  %80 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg9114, i64 0, i64 %10, i64 %11
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !52
  %multiply.1353.9 = fmul double %81, %add.821.11
  %82 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg8112, i64 0, i64 0, i64 %11
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !52
  %84 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg17130, i64 0, i64 %10, i64 %32, i64 %11
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !52
  %multiply.1354.7 = fmul double %83, %85
  %add.822.7 = fadd double %multiply.1354.7, %multiply.1353.9
  %86 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg5106, i64 0, i64 %10, i64 %11
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !52
  %88 = fneg double %83
  %89 = fmul double %81, %88
  %90 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg3102, i64 0, i64 %10, i64 %32, i64 %11
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !52
  %multiply.1356.5 = fmul double %89, %91
  %92 = fmul double %87, %add.822.7
  %add.823.7 = fsub double %multiply.1356.5, %92
  %93 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg12120, i64 0, i64 %11
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !52
  %95 = select i1 %17, double %94, double 0.000000e+00
  %add.754.3 = fadd double %79, %95
  %96 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg198, i64 0, i64 %10, i64 %32, i64 %11
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !52
  %98 = fneg double %add.754.3
  %99 = fmul double %97, %98
  %add.824.3 = fsub double %99, %add.823.7
  %add.825.3 = fadd double %45, %add.824.3
  %add.826.1 = fadd double %18, %add.825.3
  %100 = getelementptr double, ptr addrspace(1) %arg38172, i64 %14
  %101 = load double, ptr addrspace(1) %100, align 8
  %add.827.3.clone.1 = fadd double %101, 0.000000e+00
  %102 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg37170, i64 0, i64 %10, i64 %11
  %103 = load double, ptr addrspace(1) %102, align 8, !invariant.load !52
  %multiply.1358.9.clone.1 = fmul double %103, %35
  %104 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg36168, i64 0, i64 %10, i64 %11
  %105 = load double, ptr addrspace(1) %104, align 8, !invariant.load !52
  %multiply.1359.7.clone.1 = fmul double %multiply.1358.9.clone.1, %105
  %multiply.1256.3.clone.1 = fmul double %39, %103
  %106 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg35166, i64 0, i64 %10, i64 %32, i64 %11
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !52
  %multiply.1360.5.clone.1 = fmul double %multiply.1256.3.clone.1, %107
  %add.828.5.clone.1 = fadd double %multiply.1359.7.clone.1, %multiply.1360.5.clone.1
  %108 = select i1 %44, double %add.828.5.clone.1, double 0.000000e+00
  %109 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg34164, i64 0, i64 %10
  %110 = load double, ptr addrspace(1) %109, align 8, !invariant.load !52
  %111 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg33162, i64 0, i64 %10, i64 %11
  %112 = load i8, ptr addrspace(1) %111, align 1, !invariant.load !52
  %113 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg32160, i64 0, i64 %10, i64 %32, i64 %11
  %114 = load double, ptr addrspace(1) %113, align 8, !invariant.load !52
  %multiply.1361.7.clone.1 = fmul double %add.752.17, %114
  %add.829.5.clone.1 = fsub double %multiply.1361.7.clone.1, %add.822.7
  %115 = trunc i8 %112 to i1
  %116 = select i1 %115, double %add.829.5.clone.1, double 0.000000e+00
  %multiply.1362.9.clone.1 = fmul double %110, %116
  %117 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg31158, i64 0, i64 %10, i64 %11
  %118 = load double, ptr addrspace(1) %117, align 8, !invariant.load !52
  %multiply.1363.7.clone.1 = fmul double %118, %multiply.1362.9.clone.1
  %119 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg30156, i64 0, i64 %10, i64 %11
  %120 = load double, ptr addrspace(1) %119, align 8, !invariant.load !52
  %multiply.1258.9.clone.1 = fmul double %add.752.17, %120
  %add.760.7.clone.1 = fadd double %89, %multiply.1258.9.clone.1
  %121 = select i1 %115, double %add.760.7.clone.1, double 0.000000e+00
  %multiply.1260.3.clone.1 = fmul double %110, %121
  %122 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg29154, i64 0, i64 %10, i64 %32, i64 %11
  %123 = load double, ptr addrspace(1) %122, align 8, !invariant.load !52
  %multiply.1364.7.clone.1 = fmul double %123, %multiply.1260.3.clone.1
  %add.830.5.clone.1 = fadd double %multiply.1363.7.clone.1, %multiply.1364.7.clone.1
  %add.831.3.clone.1 = fadd double %108, %add.830.5.clone.1
  %add.832.1.clone.1 = fadd double %add.827.3.clone.1, %add.831.3.clone.1
  %124 = getelementptr double, ptr addrspace(1) %arg84264, i64 %14
  %125 = load double, ptr addrspace(1) %124, align 8
  %126 = getelementptr inbounds [192 x [1 x [120 x [20 x double]]]], ptr addrspace(1) %arg83262, i64 0, i64 %10, i64 0, i64 %32, i64 %11
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !52
  %add.699.7.clone.1 = fadd double %125, %127
  %128 = select i1 %17, double 0.000000e+00, double %add.699.7.clone.1
  %129 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg82260, i64 0, i64 %10, i64 %11
  %130 = load double, ptr addrspace(1) %129, align 8, !invariant.load !52
  %131 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg81258, i64 0, i64 %10, i64 %32, i64 %11
  %132 = load double, ptr addrspace(1) %131, align 8, !invariant.load !52
  %133 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg68232, i64 0, i64 0, i64 %11
  %134 = load double, ptr addrspace(1) %133, align 8, !invariant.load !52
  %multiply.1195.3.clone.1 = fmul double %132, %134
  %135 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg80256, i64 0, i64 %10, i64 %11
  %136 = load double, ptr addrspace(1) %135, align 8, !invariant.load !52
  %137 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg79254, i64 0, i64 %10, i64 %32, i64 %11
  %138 = load double, ptr addrspace(1) %137, align 8, !invariant.load !52
  %139 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg75246, i64 0, i64 0, i64 %11
  %140 = load double, ptr addrspace(1) %139, align 8, !invariant.load !52
  %141 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg78252, i64 0, i64 %10, i64 %11
  %142 = load double, ptr addrspace(1) %141, align 8, !invariant.load !52
  %143 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg77250, i64 0, i64 %10, i64 %11
  %144 = load double, ptr addrspace(1) %143, align 8, !invariant.load !52
  %multiply.1180.41.clone.1 = fmul double %53, %144
  %145 = fneg double %multiply.1180.41.clone.1
  %multiply.1181.5.clone.1 = fmul double %142, %145
  %146 = fmul double %138, %140
  %add.689.7.clone.1 = fsub double %multiply.1181.5.clone.1, %146
  %147 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg76248, i64 0, i64 %10, i64 %32, i64 %11
  %148 = load double, ptr addrspace(1) %147, align 8, !invariant.load !52
  %multiply.1182.7.clone.1 = fmul double %140, %148
  %149 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg74244, i64 0, i64 %10, i64 %11
  %150 = load double, ptr addrspace(1) %149, align 8, !invariant.load !52
  %multiply.1183.7.clone.1 = fmul double %multiply.1180.41.clone.1, %150
  %add.690.5.clone.1 = fadd double %multiply.1182.7.clone.1, %multiply.1183.7.clone.1
  %add.691.5.clone.1 = fadd double %add.689.7.clone.1, %add.690.5.clone.1
  %151 = select i1 %54, double %add.691.5.clone.1, double 0.000000e+00
  %152 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg73242, i64 0, i64 %10, i64 %32, i64 %11
  %153 = load double, ptr addrspace(1) %152, align 8, !invariant.load !52
  %154 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg72240, i64 0, i64 %10, i64 %11
  %155 = load double, ptr addrspace(1) %154, align 8, !invariant.load !52
  %multiply.1170.17.clone.1 = fmul double %multiply.1169.9, %155
  %multiply.1184.7.clone.1 = fmul double %153, %multiply.1170.17.clone.1
  %156 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg71238, i64 0, i64 %10, i64 %11
  %157 = load double, ptr addrspace(1) %156, align 8, !invariant.load !52
  %multiply.1187.17.clone.1 = fmul double %multiply.1185.33, %155
  %158 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg70236, i64 0, i64 %10, i64 %32, i64 %11
  %159 = load double, ptr addrspace(1) %158, align 8, !invariant.load !52
  %multiply.1188.13.clone.1 = fmul double %multiply.1169.9, %159
  %add.692.15.clone.1 = fadd double %multiply.1187.17.clone.1, %multiply.1188.13.clone.1
  %multiply.1189.5.clone.1 = fmul double %157, %add.692.15.clone.1
  %add.693.5.clone.1 = fadd double %multiply.1184.7.clone.1, %multiply.1189.5.clone.1
  %add.695.3.clone.1 = fadd double %151, %add.693.5.clone.1
  %multiply.1197.25.clone.1 = fmul double %136, %add.695.3.clone.1
  %add.700.23.clone.1 = fadd double %multiply.1195.3.clone.1, %multiply.1197.25.clone.1
  %160 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg69234, i64 0, i64 %10, i64 %11
  %161 = load double, ptr addrspace(1) %160, align 8, !invariant.load !52
  %multiply.1198.21.clone.1 = fmul double %161, %add.700.23.clone.1
  %multiply.1174.7.clone.1 = fmul double %134, %136
  %162 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg67230, i64 0, i64 %10, i64 %32, i64 %11
  %163 = load double, ptr addrspace(1) %162, align 8, !invariant.load !52
  %multiply.1200.3.clone.1 = fmul double %multiply.1174.7.clone.1, %163
  %add.701.19.clone.1 = fadd double %multiply.1200.3.clone.1, %multiply.1198.21.clone.1
  %164 = select i1 %17, double %add.699.7.clone.1, double 0.000000e+00
  %add.702.13.clone.1 = fadd double %164, %add.701.19.clone.1
  %add.769.7.clone.1 = fsub double %add.702.13.clone.1, %add.701.19.clone.1
  %165 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg66228, i64 0, i64 %10, i64 %32, i64 %11
  %166 = load double, ptr addrspace(1) %165, align 8, !invariant.load !52
  %167 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg64224, i64 0, i64 0, i64 %11
  %168 = load double, ptr addrspace(1) %167, align 8, !invariant.load !52
  %169 = getelementptr inbounds [192 x [1 x [20 x double]]], ptr addrspace(1) %arg65226, i64 0, i64 %10, i64 0, i64 %11
  %170 = load double, ptr addrspace(1) %169, align 8, !invariant.load !52
  %add.681.15.clone.1 = fadd double %168, %170
  %171 = select i1 %17, double %add.681.15.clone.1, double 0.000000e+00
  %172 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg63222, i64 0, i64 %11
  %173 = load double, ptr addrspace(1) %172, align 8, !invariant.load !52
  %174 = select i1 %17, double %173, double 0.000000e+00
  %multiply.1175.15.clone.1 = fmul double %multiply.1174.7.clone.1, %161
  %add.686.15.clone.1 = fadd double %multiply.1175.15.clone.1, %174
  %add.687.11.clone.1 = fadd double %171, %add.686.15.clone.1
  %multiply.1270.7.clone.1 = fmul double %166, %add.687.11.clone.1
  %175 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg62220, i64 0, i64 %10, i64 %11
  %176 = load double, ptr addrspace(1) %175, align 8, !invariant.load !52
  %multiply.1271.3.clone.1 = fmul double %176, %add.702.13.clone.1
  %add.770.5.clone.1 = fadd double %multiply.1270.7.clone.1, %multiply.1271.3.clone.1
  %177 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg61218, i64 0, i64 %10
  %178 = load double, ptr addrspace(1) %177, align 8, !invariant.load !52
  %multiply.1272.3.clone.1 = fmul double %178, %add.770.5.clone.1
  %179 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg60216, i64 0, i64 %10, i64 %11
  %180 = load double, ptr addrspace(1) %179, align 8, !invariant.load !52
  %divide.55.9.clone.1 = fdiv double %multiply.1272.3.clone.1, %180
  %181 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg59214, i64 0, i64 %10, i64 %32, i64 %11
  %182 = load double, ptr addrspace(1) %181, align 8, !invariant.load !52
  %183 = fneg double %182
  %184 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg58212, i64 0, i64 %11
  %185 = load double, ptr addrspace(1) %184, align 8, !invariant.load !52
  %186 = select i1 %17, double %185, double 0.000000e+00
  %multiply.1210.7.clone.1 = fmul double %176, %add.687.11.clone.1
  %multiply.1211.9.clone.1 = fmul double %178, %multiply.1210.7.clone.1
  %add.711.9.clone.1 = fadd double %79, %multiply.1211.9.clone.1
  %add.712.7.clone.1 = fadd double %186, %add.711.9.clone.1
  %multiply.1274.3.clone.1 = fmul double %add.712.7.clone.1, %183
  %multiply.1275.5.clone.1 = fmul double %180, %180
  %divide.56.3.clone.1 = fdiv double 1.000000e+00, %multiply.1275.5.clone.1
  %multiply.1276.5.clone.1 = fmul double %divide.56.3.clone.1, %multiply.1274.3.clone.1
  %add.771.7.clone.1 = fadd double %divide.55.9.clone.1, %multiply.1276.5.clone.1
  %187 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg57210, i64 0, i64 %10
  %188 = load double, ptr addrspace(1) %187, align 8, !invariant.load !52
  %189 = fneg double %add.771.7.clone.1
  %190 = fmul double %188, %189
  %191 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg56208, i64 0, i64 %10, i64 %32, i64 %11
  %192 = load double, ptr addrspace(1) %191, align 8, !invariant.load !52
  %193 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg40176, i64 0, i64 0, i64 %11
  %194 = load double, ptr addrspace(1) %193, align 8, !invariant.load !52
  %multiply.1278.7.clone.1 = fmul double %192, %194
  %195 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg55206, i64 0, i64 %10, i64 %11
  %196 = load double, ptr addrspace(1) %195, align 8, !invariant.load !52
  %197 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg54204, i64 0, i64 %10, i64 %11
  %198 = load double, ptr addrspace(1) %197, align 8, !invariant.load !52
  %199 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg53202, i64 0, i64 %10, i64 %11
  %200 = load double, ptr addrspace(1) %199, align 8, !invariant.load !52
  %multiply.1202.9.clone.1 = fmul double %add.702.13.clone.1, %200
  %201 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg52200, i64 0, i64 %10, i64 %32, i64 %11
  %202 = load double, ptr addrspace(1) %201, align 8, !invariant.load !52
  %multiply.1203.9.clone.1 = fmul double %add.687.11.clone.1, %202
  %add.703.7.clone.1 = fadd double %multiply.1202.9.clone.1, %multiply.1203.9.clone.1
  %203 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg51198, i64 0, i64 %10, i64 %11
  %204 = load double, ptr addrspace(1) %203, align 8, !invariant.load !52
  %divide.57.7.clone.1 = fdiv double %add.703.7.clone.1, %204
  %205 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg50196, i64 0, i64 %10, i64 %32, i64 %11
  %206 = load double, ptr addrspace(1) %205, align 8, !invariant.load !52
  %207 = fneg double %206
  %multiply.1176.9.clone.1 = fmul double %add.687.11.clone.1, %200
  %multiply.1279.5.clone.1 = fmul double %multiply.1176.9.clone.1, %207
  %multiply.1280.5.clone.1 = fmul double %204, %204
  %divide.58.3.clone.1 = fdiv double 1.000000e+00, %multiply.1280.5.clone.1
  %multiply.1281.5.clone.1 = fmul double %multiply.1279.5.clone.1, %divide.58.3.clone.1
  %add.772.5.clone.1 = fadd double %divide.57.7.clone.1, %multiply.1281.5.clone.1
  %multiply.1282.3.clone.1 = fmul double %198, %add.772.5.clone.1
  %208 = getelementptr double, ptr addrspace(1) %arg49194, i64 %14
  %209 = load double, ptr addrspace(1) %208, align 8, !invariant.load !52
  %add.773.11.clone.1 = fadd double %209, %multiply.1282.3.clone.1
  %210 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg48192, i64 0, i64 %10, i64 %11
  %211 = load double, ptr addrspace(1) %210, align 8, !invariant.load !52
  %multiply.1283.3.clone.1 = fmul double %multiply.1272.3.clone.1, %211
  %212 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg47190, i64 0, i64 %10, i64 %32, i64 %11
  %213 = load double, ptr addrspace(1) %212, align 8, !invariant.load !52
  %multiply.1284.11.clone.1 = fmul double %add.712.7.clone.1, %213
  %add.774.9.clone.1 = fadd double %multiply.1283.3.clone.1, %multiply.1284.11.clone.1
  %214 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg46188, i64 0, i64 %10, i64 %11
  %215 = load double, ptr addrspace(1) %214, align 8, !invariant.load !52
  %multiply.1285.7.clone.1 = fmul double %215, %add.774.9.clone.1
  %multiply.1215.3.clone.1 = fmul double %add.712.7.clone.1, %211
  %216 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg45186, i64 0, i64 %10, i64 %32, i64 %11
  %217 = load double, ptr addrspace(1) %216, align 8, !invariant.load !52
  %multiply.1286.3.clone.1 = fmul double %multiply.1215.3.clone.1, %217
  %add.775.5.clone.1 = fadd double %multiply.1285.7.clone.1, %multiply.1286.3.clone.1
  %add.776.9.clone.1 = fsub double %add.773.11.clone.1, %add.775.5.clone.1
  %multiply.1287.3.clone.1 = fmul double %196, %add.776.9.clone.1
  %add.777.5.clone.1 = fadd double %multiply.1278.7.clone.1, %multiply.1287.3.clone.1
  %add.778.3.clone.1 = fsub double %190, %add.777.5.clone.1
  %218 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg44184, i64 0, i64 %10, i64 %11
  %219 = load double, ptr addrspace(1) %218, align 8, !invariant.load !52
  %multiply.1289.3.clone.1 = fmul double %219, %add.776.9.clone.1
  %220 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg43182, i64 0, i64 %10, i64 %32, i64 %11
  %221 = load double, ptr addrspace(1) %220, align 8, !invariant.load !52
  %multiply.1290.11.clone.1 = fmul double %194, %221
  %add.779.9.clone.1 = fadd double %multiply.1290.11.clone.1, %multiply.1289.3.clone.1
  %add.780.7.clone.1 = fadd double %add.779.9.clone.1, %add.778.3.clone.1
  %222 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg42180, i64 0, i64 %10, i64 %11
  %223 = load double, ptr addrspace(1) %222, align 8, !invariant.load !52
  %multiply.1291.5.clone.1 = fmul double %223, %add.780.7.clone.1
  %224 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg41178, i64 0, i64 %11
  %225 = load double, ptr addrspace(1) %224, align 8, !invariant.load !52
  %226 = select i1 %17, double %225, double 0.000000e+00
  %add.710.9.clone.1 = fadd double %79, %226
  %227 = fneg double %add.712.7.clone.1
  %228 = fdiv double %227, %180
  %229 = fmul double %188, %228
  %add.713.7.clone.1 = fadd double %229, %add.710.9.clone.1
  %230 = fmul double %194, %196
  %add.719.5.clone.1 = fsub double %add.713.7.clone.1, %230
  %multiply.1219.3.clone.1 = fmul double %194, %219
  %add.720.3.clone.1 = fadd double %multiply.1219.3.clone.1, %add.719.5.clone.1
  %231 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg39174, i64 0, i64 %10, i64 %32, i64 %11
  %232 = load double, ptr addrspace(1) %231, align 8, !invariant.load !52
  %multiply.1292.3.clone.1 = fmul double %232, %add.720.3.clone.1
  %add.781.3.clone.1 = fadd double %multiply.1291.5.clone.1, %multiply.1292.3.clone.1
  %add.782.5.clone.1 = fadd double %add.769.7.clone.1, %add.781.3.clone.1
  %multiply.1294.3.clone.1 = fmul double %130, %add.782.5.clone.1
  %add.783.1.clone.1 = fadd double %128, %multiply.1294.3.clone.1
  %233 = getelementptr double, ptr addrspace(1) %arg85266, i64 %14
  store double %add.826.1, ptr addrspace(1) %233, align 8
  store double %add.832.1.clone.1, ptr addrspace(1) %100, align 8
  store double %add.783.1.clone.1, ptr addrspace(1) %124, align 8
  br label %loop_add_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg6, ptr noalias nocapture align 128 dereferenceable(19200) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg27, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg35, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg37, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg39, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg42, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg43, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg45, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg46, ptr noalias nocapture align 128 dereferenceable(19200) %arg47, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg49, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg50, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg51, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg53, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg54, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg55, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg57, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg58, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg59, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg60, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg61, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg62, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg63, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg64, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg65, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg66, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg67, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg68, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg69, ptr noalias nocapture align 128 dereferenceable(19200) %arg70, ptr noalias nocapture readnone align 16 dereferenceable(3840) %arg71) local_unnamed_addr #2 {
entry:
  %arg70223 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69221 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68219 = addrspacecast ptr %arg68 to ptr addrspace(1)
  %arg67217 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66215 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg65213 = addrspacecast ptr %arg65 to ptr addrspace(1)
  %arg64211 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63209 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62207 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61205 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60203 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59201 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58199 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57197 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56195 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55193 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54191 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53189 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52187 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51185 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50183 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49181 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48179 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47177 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46175 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45173 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44171 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg43169 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg42167 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41165 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40163 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39161 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38159 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37157 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36155 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35153 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34151 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33149 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32147 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31145 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30143 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29141 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28139 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27137 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26135 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25133 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24131 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23129 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22127 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21125 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20123 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19121 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18119 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17117 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16115 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15113 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14111 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13109 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12107 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11105 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10103 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9101 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg899 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg797 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg695 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg593 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg491 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg389 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg287 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg185 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg083 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_add_fusion.1.in_bounds-true, label %loop_add_fusion.1.in_bounds-after

loop_add_fusion.1.in_bounds-after:                ; preds = %loop_add_fusion.1.in_bounds-true, %entry
  ret void

loop_add_fusion.1.in_bounds-true:                 ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = load i64, ptr addrspace(1) %arg389, align 128, !invariant.load !52
  %7 = trunc i64 %6 to i32
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 191)
  %10 = zext nneg i32 %9 to i64
  %11 = zext nneg i16 %.decomposed to i64
  %12 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg593, i64 0, i64 %10, i64 %11
  %13 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !52
  %14 = zext nneg i32 %linear_index to i64
  %15 = getelementptr double, ptr addrspace(1) %arg083, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8
  %17 = trunc i8 %13 to i1
  %18 = select i1 %17, double 0.000000e+00, double %16
  %19 = getelementptr double, ptr addrspace(1) %arg185, i64 %14
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !52
  %21 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg491, i64 0, i64 %10, i64 %11
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !52
  %23 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg40163, i64 0, i64 %10
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !52
  %25 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg39161, i64 0, i64 %10, i64 %11
  %26 = load i8, ptr addrspace(1) %25, align 1, !invariant.load !52
  %27 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg38159, i64 0, i64 %10, i64 %11
  %28 = load i8, ptr addrspace(1) %27, align 1, !invariant.load !52
  %29 = zext nneg i16 %4 to i64
  %30 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg62207, i64 0, i64 %10, i64 %29, i64 %11
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !52
  %32 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg25133, i64 0, i64 0, i64 %11
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !52
  %34 = fneg double %33
  %35 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg61205, i64 0, i64 %10, i64 %11
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !52
  %37 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg34151, i64 0, i64 %10, i64 %11
  %38 = load i8, ptr addrspace(1) %37, align 1, !invariant.load !52
  %39 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg33149, i64 0, i64 %10, i64 %11
  %40 = load i32, ptr addrspace(1) %39, align 4, !invariant.load !52
  %41 = icmp eq i32 %40, 1
  %42 = getelementptr double, ptr addrspace(1) %arg32147, i64 %14
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !52
  %44 = trunc i8 %38 to i1
  %45 = select i1 %44, i1 %41, i1 false
  %46 = select i1 %45, i1 %17, i1 false
  %47 = select i1 %46, double %43, double 0.000000e+00
  %48 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg31145, i64 0, i64 %10, i64 %11
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !52
  %multiply.1180.49.clone.1 = fmul double %49, %47
  %50 = fneg double %multiply.1180.49.clone.1
  %multiply.1181.9.clone.1 = fmul double %36, %50
  %51 = fmul double %31, %33
  %add.689.11.clone.1 = fsub double %multiply.1181.9.clone.1, %51
  %52 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg60203, i64 0, i64 %10, i64 %29, i64 %11
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !52
  %multiply.1182.11.clone.1 = fmul double %33, %53
  %54 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg59201, i64 0, i64 %10, i64 %11
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !52
  %multiply.1183.11.clone.1 = fmul double %55, %multiply.1180.49.clone.1
  %add.690.9.clone.1 = fadd double %multiply.1182.11.clone.1, %multiply.1183.11.clone.1
  %add.691.9.clone.1 = fadd double %add.689.11.clone.1, %add.690.9.clone.1
  %56 = trunc i8 %28 to i1
  %57 = select i1 %56, double %add.691.9.clone.1, double 0.000000e+00
  %58 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg58199, i64 0, i64 %10, i64 %29, i64 %11
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !52
  %60 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg21125, i64 0, i64 0, i64 %11
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !52
  %62 = select i1 %17, double %61, double 0.000000e+00
  %63 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg20123, i64 0, i64 %10, i64 %11
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !52
  %multiply.1169.17.clone.1 = fmul double %62, %64
  %65 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg19121, i64 0, i64 %10, i64 %11
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !52
  %multiply.1170.21.clone.1 = fmul double %multiply.1169.17.clone.1, %66
  %multiply.1184.11.clone.1 = fmul double %59, %multiply.1170.21.clone.1
  %67 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg57197, i64 0, i64 %10, i64 %11
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !52
  %69 = select i1 %17, double %16, double 0.000000e+00
  %multiply.1185.39.clone.1 = fmul double %69, %64
  %multiply.1187.21.clone.1 = fmul double %multiply.1185.39.clone.1, %66
  %70 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg16115, i64 0, i64 %10, i64 %29, i64 %11
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !52
  %multiply.1188.17.clone.1 = fmul double %multiply.1169.17.clone.1, %71
  %add.692.19.clone.1 = fadd double %multiply.1187.21.clone.1, %multiply.1188.17.clone.1
  %multiply.1189.9.clone.1 = fmul double %68, %add.692.19.clone.1
  %add.693.9.clone.1 = fadd double %multiply.1184.11.clone.1, %multiply.1189.9.clone.1
  %add.695.7.clone.1 = fadd double %57, %add.693.9.clone.1
  %72 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg56195, i64 0, i64 %10, i64 %11
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !52
  %multiply.1295.3.clone.1 = fmul double %73, %add.695.7.clone.1
  %74 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg55193, i64 0, i64 0, i64 %11
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !52
  %76 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg54191, i64 0, i64 %10, i64 %29, i64 %11
  %77 = load double, ptr addrspace(1) %76, align 8, !invariant.load !52
  %multiply.1296.3.clone.1 = fmul double %75, %77
  %add.784.3.clone.1 = fadd double %multiply.1296.3.clone.1, %multiply.1295.3.clone.1
  %78 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg53189, i64 0, i64 %10, i64 %11
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !52
  %divide.59.7.clone.1 = fdiv double %add.695.7.clone.1, %79
  %80 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg52187, i64 0, i64 %10, i64 %29, i64 %11
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !52
  %82 = fneg double %81
  %multiply.1297.3.clone.1 = fmul double %75, %82
  %multiply.1280.7.clone.1 = fmul double %79, %79
  %divide.58.5.clone.1 = fdiv double 1.000000e+00, %multiply.1280.7.clone.1
  %multiply.1299.3.clone.1 = fmul double %multiply.1297.3.clone.1, %divide.58.5.clone.1
  %add.785.5.clone.1 = fadd double %divide.59.7.clone.1, %multiply.1299.3.clone.1
  %add.786.3.clone.1 = fadd double %add.784.3.clone.1, %add.785.5.clone.1
  %83 = getelementptr double, ptr addrspace(1) %arg51185, i64 %14
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !52
  %add.787.9.clone.1 = fadd double %84, %add.786.3.clone.1
  %85 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg50183, i64 0, i64 %10, i64 %29, i64 %11
  %86 = load double, ptr addrspace(1) %85, align 8, !invariant.load !52
  %87 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg9101, i64 0, i64 0, i64 %11
  %88 = load double, ptr addrspace(1) %87, align 8, !invariant.load !52
  %multiply.1300.5.clone.1 = fmul double %86, %88
  %89 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg49181, i64 0, i64 %10, i64 %11
  %90 = load double, ptr addrspace(1) %89, align 8, !invariant.load !52
  %91 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg37157, i64 0, i64 %10, i64 %29, i64 %11
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !52
  %93 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg36155, i64 0, i64 %10, i64 %11
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !52
  %multiply.1224.7.clone.1 = fmul double %94, %34
  %multiply.1301.11.clone.1 = fmul double %92, %multiply.1224.7.clone.1
  %95 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg35153, i64 0, i64 %10, i64 %11
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !52
  %97 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg30143, i64 0, i64 %10, i64 %29, i64 %11
  %98 = load double, ptr addrspace(1) %97, align 8, !invariant.load !52
  %multiply.1304.7.clone.1 = fmul double %98, %34
  %99 = fmul double %multiply.1180.49.clone.1, %94
  %add.788.5.clone.1 = fsub double %multiply.1304.7.clone.1, %99
  %multiply.1306.11.clone.1 = fmul double %96, %add.788.5.clone.1
  %add.789.9.clone.1 = fadd double %multiply.1301.11.clone.1, %multiply.1306.11.clone.1
  %100 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg29141, i64 0, i64 %10, i64 %29, i64 %11
  %101 = load double, ptr addrspace(1) %100, align 8, !invariant.load !52
  %multiply.1226.11.clone.1 = fmul double %33, %94
  %102 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg28139, i64 0, i64 %10, i64 %11
  %103 = load double, ptr addrspace(1) %102, align 8, !invariant.load !52
  %multiply.1227.7.clone.1 = fmul double %multiply.1226.11.clone.1, %103
  %multiply.1307.9.clone.1 = fmul double %101, %multiply.1227.7.clone.1
  %104 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg27137, i64 0, i64 %10, i64 %11
  %105 = load double, ptr addrspace(1) %104, align 8, !invariant.load !52
  %multiply.1310.7.clone.1 = fmul double %33, %98
  %add.790.9.clone.1 = fadd double %99, %multiply.1310.7.clone.1
  %multiply.1311.7.clone.1 = fmul double %add.790.9.clone.1, %103
  %106 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg26135, i64 0, i64 %10, i64 %29, i64 %11
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !52
  %multiply.1312.7.clone.1 = fmul double %multiply.1226.11.clone.1, %107
  %add.791.5.clone.1 = fadd double %multiply.1311.7.clone.1, %multiply.1312.7.clone.1
  %multiply.1314.7.clone.1 = fmul double %105, %add.791.5.clone.1
  %add.792.7.clone.1 = fadd double %multiply.1307.9.clone.1, %multiply.1314.7.clone.1
  %add.793.7.clone.1 = fadd double %add.789.9.clone.1, %add.792.7.clone.1
  %multiply.1230.11.clone.1 = fmul double %33, 5.000000e-01
  %108 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg24131, i64 0, i64 %10, i64 %11
  %109 = load double, ptr addrspace(1) %108, align 8, !invariant.load !52
  %multiply.1231.7.clone.1 = fmul double %multiply.1230.11.clone.1, %109
  %multiply.1315.11.clone.1 = fmul double %101, %multiply.1231.7.clone.1
  %multiply.1316.7.clone.1 = fmul double %109, 5.000000e-01
  %multiply.1317.7.clone.1 = fmul double %multiply.1180.49.clone.1, %multiply.1316.7.clone.1
  %110 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg23129, i64 0, i64 %10, i64 %29, i64 %11
  %111 = load double, ptr addrspace(1) %110, align 8, !invariant.load !52
  %multiply.1319.5.clone.1 = fmul double %multiply.1230.11.clone.1, %111
  %add.794.5.clone.1 = fadd double %multiply.1317.7.clone.1, %multiply.1319.5.clone.1
  %multiply.1320.7.clone.1 = fmul double %105, %add.794.5.clone.1
  %add.795.9.clone.1 = fadd double %multiply.1315.11.clone.1, %multiply.1320.7.clone.1
  %add.796.7.clone.1 = fadd double %add.793.7.clone.1, %add.795.9.clone.1
  %112 = select i1 %56, double %add.796.7.clone.1, double 0.000000e+00
  %113 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg22127, i64 0, i64 %10, i64 %29, i64 %11
  %114 = load double, ptr addrspace(1) %113, align 8, !invariant.load !52
  %115 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg18119, i64 0, i64 %10, i64 %11
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !52
  %multiply.1234.7.clone.1 = fmul double %multiply.1170.21.clone.1, %116
  %multiply.1322.9.clone.1 = fmul double %114, %multiply.1234.7.clone.1
  %117 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg17117, i64 0, i64 %10, i64 %11
  %118 = load double, ptr addrspace(1) %117, align 8, !invariant.load !52
  %multiply.1323.3.clone.1 = fmul double %add.692.19.clone.1, %116
  %119 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg15113, i64 0, i64 %10, i64 %29, i64 %11
  %120 = load double, ptr addrspace(1) %119, align 8, !invariant.load !52
  %multiply.1324.19.clone.1 = fmul double %multiply.1170.21.clone.1, %120
  %add.797.17.clone.1 = fadd double %multiply.1323.3.clone.1, %multiply.1324.19.clone.1
  %multiply.1325.9.clone.1 = fmul double %118, %add.797.17.clone.1
  %add.798.7.clone.1 = fadd double %multiply.1322.9.clone.1, %multiply.1325.9.clone.1
  %add.799.5.clone.1 = fadd double %112, %add.798.7.clone.1
  %multiply.1327.3.clone.1 = fmul double %90, %add.799.5.clone.1
  %add.800.3.clone.1 = fadd double %multiply.1300.5.clone.1, %multiply.1327.3.clone.1
  %add.801.7.clone.1 = fadd double %add.787.9.clone.1, %add.800.3.clone.1
  %121 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg11105, i64 0, i64 %10, i64 %11
  %122 = load double, ptr addrspace(1) %121, align 8, !invariant.load !52
  %multiply.1328.5.clone.1 = fmul double %122, %add.801.7.clone.1
  %123 = getelementptr inbounds [1 x [20 x double]], ptr addrspace(1) %arg10103, i64 0, i64 0, i64 %11
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !52
  %125 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg48179, i64 0, i64 %10, i64 %29, i64 %11
  %126 = load double, ptr addrspace(1) %125, align 8, !invariant.load !52
  %multiply.1330.3.clone.1 = fmul double %124, %126
  %add.802.3.clone.1 = fadd double %multiply.1330.3.clone.1, %multiply.1328.5.clone.1
  %127 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg14111, i64 0, i64 %10, i64 %11
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !52
  %multiply.1335.3.clone.1 = fmul double %128, %add.799.5.clone.1
  %129 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg13109, i64 0, i64 %10, i64 %29, i64 %11
  %130 = load double, ptr addrspace(1) %129, align 8, !invariant.load !52
  %multiply.1336.7.clone.1 = fmul double %88, %130
  %add.808.5.clone.1 = fadd double %multiply.1335.3.clone.1, %multiply.1336.7.clone.1
  %add.809.3.clone.1 = fsub double %add.808.5.clone.1, %add.802.3.clone.1
  %131 = trunc i8 %26 to i1
  %132 = select i1 %131, double %add.809.3.clone.1, double 0.000000e+00
  %multiply.1337.5.clone.1 = fmul double %24, %132
  %133 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg12107, i64 0, i64 %10, i64 %11
  %134 = load double, ptr addrspace(1) %133, align 8, !invariant.load !52
  %multiply.1338.3.clone.1 = fmul double %134, %multiply.1337.5.clone.1
  %135 = fneg double %124
  %136 = fmul double %122, %135
  %multiply.1241.3.clone.1 = fmul double %88, %128
  %add.740.3.clone.1 = fadd double %136, %multiply.1241.3.clone.1
  %137 = select i1 %131, double %add.740.3.clone.1, double 0.000000e+00
  %multiply.1243.3.clone.1 = fmul double %24, %137
  %138 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg899, i64 0, i64 %10, i64 %29, i64 %11
  %139 = load double, ptr addrspace(1) %138, align 8, !invariant.load !52
  %multiply.1340.3.clone.1 = fmul double %139, %multiply.1243.3.clone.1
  %add.810.1.clone.1 = fadd double %multiply.1340.3.clone.1, %multiply.1338.3.clone.1
  %multiply.1341.5 = fmul double %22, %add.810.1.clone.1
  %add.813.5 = fadd double %20, %multiply.1341.5
  %140 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg287, i64 0, i64 %10, i64 %11
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !52
  %multiply.1342.3 = fmul double %69, %141
  %add.814.3 = fadd double %multiply.1342.3, %add.813.5
  %add.815.1 = fadd double %18, %add.814.3
  %142 = getelementptr double, ptr addrspace(1) %arg797, i64 %14
  %143 = load double, ptr addrspace(1) %142, align 8
  %add.807.3.clone.1 = fadd double %143, 0.000000e+00
  %144 = getelementptr double, ptr addrspace(1) %arg695, i64 %14
  %145 = load double, ptr addrspace(1) %144, align 8, !invariant.load !52
  %add.811.3.clone.1 = fadd double %145, %add.810.1.clone.1
  %add.812.1.clone.1 = fadd double %add.807.3.clone.1, %add.811.3.clone.1
  %146 = getelementptr double, ptr addrspace(1) %arg47177, i64 %14
  %147 = load double, ptr addrspace(1) %146, align 8
  %148 = select i1 %17, double 0.000000e+00, double %147
  %149 = getelementptr double, ptr addrspace(1) %arg46175, i64 %14
  %150 = load double, ptr addrspace(1) %149, align 8, !invariant.load !52
  %151 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg45173, i64 0, i64 %10, i64 %11
  %152 = load double, ptr addrspace(1) %151, align 8, !invariant.load !52
  %153 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg44171, i64 0, i64 %10, i64 %29, i64 %11
  %154 = load double, ptr addrspace(1) %153, align 8, !invariant.load !52
  %multiply.1332.5.clone.1 = fmul double %136, %154
  %155 = fmul double %add.802.3.clone.1, %152
  %add.803.7.clone.1 = fsub double %multiply.1332.5.clone.1, %155
  %156 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg43169, i64 0, i64 %11
  %157 = load double, ptr addrspace(1) %156, align 8, !invariant.load !52
  %158 = select i1 %17, double %157, double 0.000000e+00
  %159 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg42167, i64 0, i64 %11
  %160 = load double, ptr addrspace(1) %159, align 8, !invariant.load !52
  %add.733.3.clone.1 = fadd double %158, %160
  %161 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg41165, i64 0, i64 %10, i64 %29, i64 %11
  %162 = load double, ptr addrspace(1) %161, align 8, !invariant.load !52
  %163 = fneg double %add.733.3.clone.1
  %164 = fmul double %162, %163
  %add.804.3.clone.1 = fsub double %164, %add.803.7.clone.1
  %add.805.3.clone.1 = fadd double %150, %add.804.3.clone.1
  %add.806.1.clone.1 = fadd double %148, %add.805.3.clone.1
  %165 = getelementptr double, ptr addrspace(1) %arg70223, i64 %14
  %166 = load double, ptr addrspace(1) %165, align 8
  %add.833.3.clone.1 = fadd double %166, 0.000000e+00
  %167 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg69221, i64 0, i64 %10, i64 %11, i64 0
  %168 = load i8, ptr addrspace(1) %167, align 1, !invariant.load !52
  %169 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg68219, i64 0, i64 %10, i64 %11
  %170 = load double, ptr addrspace(1) %169, align 8, !invariant.load !52
  %multiply.1365.3.clone.1 = fmul double %add.788.5.clone.1, %170
  %171 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg67217, i64 0, i64 %10, i64 %29, i64 %11
  %172 = load double, ptr addrspace(1) %171, align 8, !invariant.load !52
  %multiply.1366.9.clone.1 = fmul double %multiply.1224.7.clone.1, %172
  %add.834.7.clone.1 = fadd double %multiply.1365.3.clone.1, %multiply.1366.9.clone.1
  %173 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg66215, i64 0, i64 %10, i64 %11
  %174 = load double, ptr addrspace(1) %173, align 8, !invariant.load !52
  %multiply.1367.3.clone.1 = fmul double %174, 5.000000e-01
  %multiply.1368.5.clone.1 = fmul double %add.834.7.clone.1, %multiply.1367.3.clone.1
  %multiply.1262.3.clone.1 = fmul double %multiply.1224.7.clone.1, %170
  %multiply.1263.3.clone.1 = fmul double %multiply.1262.3.clone.1, 5.000000e-01
  %175 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg65213, i64 0, i64 %10, i64 %29, i64 %11
  %176 = load double, ptr addrspace(1) %175, align 8, !invariant.load !52
  %multiply.1369.5.clone.1 = fmul double %multiply.1263.3.clone.1, %176
  %add.836.3.clone.1 = fadd double %multiply.1368.5.clone.1, %multiply.1369.5.clone.1
  %multiply.1370.3.clone.1 = fmul double %add.791.5.clone.1, %170
  %multiply.1371.7.clone.1 = fmul double %multiply.1227.7.clone.1, %172
  %add.837.5.clone.1 = fadd double %multiply.1370.3.clone.1, %multiply.1371.7.clone.1
  %add.838.3.clone.1 = fadd double %add.837.5.clone.1, %add.836.3.clone.1
  %multiply.1372.3.clone.1 = fmul double %add.794.5.clone.1, %170
  %multiply.1373.5.clone.1 = fmul double %multiply.1231.7.clone.1, %172
  %add.839.3.clone.1 = fadd double %multiply.1372.3.clone.1, %multiply.1373.5.clone.1
  %add.840.1.clone.1 = fadd double %add.839.3.clone.1, %add.838.3.clone.1
  %177 = trunc i8 %168 to i1
  %178 = select i1 %177, double %add.840.1.clone.1, double 0.000000e+00
  %179 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg64211, i64 0, i64 %10, i64 %11
  %180 = load double, ptr addrspace(1) %179, align 8, !invariant.load !52
  %multiply.1374.5.clone.1 = fmul double %add.797.17.clone.1, %180
  %181 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg63209, i64 0, i64 %10, i64 %29, i64 %11
  %182 = load double, ptr addrspace(1) %181, align 8, !invariant.load !52
  %multiply.1375.5.clone.1 = fmul double %multiply.1234.7.clone.1, %182
  %add.841.3.clone.1 = fadd double %multiply.1374.5.clone.1, %multiply.1375.5.clone.1
  %add.842.1.clone.1 = fadd double %add.841.3.clone.1, %178
  %add.843.1.clone.1 = fadd double %add.833.3.clone.1, %add.842.1.clone.1
  store double %add.815.1, ptr addrspace(1) %15, align 8
  store double %add.812.1.clone.1, ptr addrspace(1) %142, align 8
  store double %add.806.1.clone.1, ptr addrspace(1) %146, align 8
  store double %add.843.1.clone.1, ptr addrspace(1) %165, align 8
  br label %loop_add_fusion.1.in_bounds-after
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
!1 = !{ptr @copy_fusion_6, !"reqntidx", i32 60}
!2 = !{ptr @copy_fusion_7, !"kernel", i32 1}
!3 = !{ptr @copy_fusion_7, !"reqntidx", i32 40}
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
!14 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 20}
!16 = !{ptr @loop_dynamic_slice_fusion_2, !"kernel", i32 1}
!17 = !{ptr @loop_dynamic_slice_fusion_2, !"reqntidx", i32 20}
!18 = !{ptr @loop_add_multiply_select_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_add_multiply_select_fusion, !"reqntidx", i32 20}
!20 = !{ptr @loop_add_fusion_2, !"kernel", i32 1}
!21 = !{ptr @loop_add_fusion_2, !"reqntidx", i32 128}
!22 = !{ptr @loop_dynamic_slice_fusion_3, !"kernel", i32 1}
!23 = !{ptr @loop_dynamic_slice_fusion_3, !"reqntidx", i32 128}
!24 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!25 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 20}
!26 = !{ptr @loop_broadcast_fusion_2, !"kernel", i32 1}
!27 = !{ptr @loop_broadcast_fusion_2, !"reqntidx", i32 20}
!28 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!29 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 20}
!30 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!31 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 20}
!32 = !{ptr @loop_broadcast_fusion_3, !"kernel", i32 1}
!33 = !{ptr @loop_broadcast_fusion_3, !"reqntidx", i32 1024}
!34 = !{ptr @loop_add_multiply_negate_fusion, !"kernel", i32 1}
!35 = !{ptr @loop_add_multiply_negate_fusion, !"reqntidx", i32 128}
!36 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!37 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 20}
!38 = !{ptr @loop_broadcast_fusion_6, !"kernel", i32 1}
!39 = !{ptr @loop_broadcast_fusion_6, !"reqntidx", i32 1024}
!40 = !{ptr @loop_multiply_select_fusion, !"kernel", i32 1}
!41 = !{ptr @loop_multiply_select_fusion, !"reqntidx", i32 128}
!42 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!43 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 20}
!44 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!45 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 20}
!46 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!47 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!48 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!49 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 128}
!50 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!51 = !{i32 0, i32 60}
!52 = !{}
!53 = !{i32 0, i32 40}
!54 = !{i32 0, i32 20}
!55 = !{i32 0, i32 19}
!56 = !{i32 0, i32 128}
!57 = !{i32 0, i32 3}
!58 = !{i32 0, i32 1024}
