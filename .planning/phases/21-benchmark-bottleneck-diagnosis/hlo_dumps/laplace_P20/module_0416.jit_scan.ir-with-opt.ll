; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_63_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !192
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 30
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr inbounds [3840 x i8], ptr addrspace(1) %arg03, i64 0, i64 %4
  br i1 %3, label %slice0-true, label %slice0-after

input_slice_fusion.in_bounds-after:               ; preds = %slice0-after, %slice1-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %6 = icmp ugt i32 %0, 29
  %7 = sext i32 %linear_index to i64
  %8 = getelementptr [3840 x i8], ptr addrspace(1) %arg15, i64 0, i64 %7
  br i1 %6, label %slice1-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %entry
  store i8 0, ptr addrspace(1) %5, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %8, i64 -3840
  store i8 0, ptr addrspace(1) %sunkaddr, align 1
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @copy_fusion_13(ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !192
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %0, 30
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.3840.1

copy_fusion.13.in_bounds-after:                   ; preds = %slice0-after, %slice1-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = zext nneg i16 %4 to i64
  %7 = zext nneg i16 %.decomposed to i64
  %8 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg05, i64 0, i64 %6, i64 %7, i64 0
  br label %concatenate.4.merge

concatenate.pivot.3840.1:                         ; preds = %entry
  %9 = add nsw i32 %linear_index, -3840
  %10 = udiv i32 %9, 20
  %11 = mul i32 %10, 20
  %.decomposed4 = sub i32 %9, %11
  %12 = zext nneg i32 %10 to i64
  %13 = zext nneg i32 %.decomposed4 to i64
  %14 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg05, i64 0, i64 %12, i64 %13, i64 0
  br label %concatenate.4.merge

concatenate.4.merge:                              ; preds = %concatenate.pivot.3840.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %8, %concatenate.pivot.0. ], [ %14, %concatenate.pivot.3840.1 ]
  %15 = icmp ult i32 %0, 30
  %16 = load i8, ptr addrspace(1) %.in, align 1, !invariant.load !194
  %17 = zext nneg i32 %linear_index to i64
  %18 = getelementptr inbounds [3840 x i8], ptr addrspace(1) %arg17, i64 0, i64 %17
  br i1 %15, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.4.merge
  %19 = icmp ugt i32 %0, 29
  %20 = sext i32 %linear_index to i64
  %21 = getelementptr [3840 x i8], ptr addrspace(1) %arg29, i64 0, i64 %20
  br i1 %19, label %slice1-true, label %copy_fusion.13.in_bounds-after

slice0-true:                                      ; preds = %concatenate.4.merge
  store i8 %16, ptr addrspace(1) %18, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %21, i64 -3840
  store i8 %16, ptr addrspace(1) %sunkaddr, align 1
  br label %copy_fusion.13.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(15360) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 4032
  br i1 %3, label %concatenate.1.merge, label %input_slice_fusion.1.in_bounds-after

input_slice_fusion.1.in_bounds-after:             ; preds = %slice0-after, %slice1-true, %entry
  ret void

concatenate.1.merge:                              ; preds = %entry
  %4 = icmp ult i32 %linear_index, 192
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg03, i64 0, i64 %5
  br i1 %4, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.1.merge
  %7 = icmp ugt i32 %linear_index, 191
  %8 = add nsw i32 %linear_index, -192
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [3840 x i32], ptr addrspace(1) %arg15, i64 0, i64 %9
  br i1 %7, label %slice1-true, label %input_slice_fusion.1.in_bounds-after

slice0-true:                                      ; preds = %concatenate.1.merge
  store i32 0, ptr addrspace(1) %6, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store i32 0, ptr addrspace(1) %10, align 4
  br label %input_slice_fusion.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !195
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 4032
  br i1 %3, label %concatenate.2.merge, label %input_slice_fusion.2.in_bounds-after

input_slice_fusion.2.in_bounds-after:             ; preds = %slice0-after, %slice1-true, %entry
  ret void

concatenate.2.merge:                              ; preds = %entry
  %4 = icmp ult i32 %linear_index, 192
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %5
  br i1 %4, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.2.merge
  %7 = icmp ugt i32 %linear_index, 191
  %8 = add nsw i32 %linear_index, -192
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [3840 x double], ptr addrspace(1) %arg15, i64 0, i64 %9
  br i1 %7, label %slice1-true, label %input_slice_fusion.2.in_bounds-after

slice0-true:                                      ; preds = %concatenate.2.merge
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %10, align 8
  br label %input_slice_fusion.2.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg30, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg31, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg32, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg33, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg34, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg35, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg38, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg39, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg40, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg43) local_unnamed_addr #0 {
entry:
  %arg4394 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg4292 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg4190 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg4088 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg3986 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg3884 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg3782 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg3680 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3578 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg3476 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3374 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg3272 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg3170 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3068 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2966 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2864 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2762 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2660 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2558 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2456 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2354 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2252 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2150 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1946 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1742 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1538 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1436 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1334 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1232 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1130 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg926 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg722 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !196
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !197
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr double, ptr addrspace(1) %arg04, i64 %4
  %6 = getelementptr double, ptr addrspace(1) %arg110, i64 %4
  %7 = getelementptr double, ptr addrspace(1) %arg212, i64 %4
  %8 = getelementptr double, ptr addrspace(1) %arg314, i64 %4
  %9 = getelementptr double, ptr addrspace(1) %arg416, i64 %4
  %10 = getelementptr double, ptr addrspace(1) %arg518, i64 %4
  %11 = getelementptr double, ptr addrspace(1) %arg620, i64 %4
  %12 = getelementptr double, ptr addrspace(1) %arg722, i64 %4
  %13 = getelementptr double, ptr addrspace(1) %arg824, i64 %4
  %14 = getelementptr double, ptr addrspace(1) %arg926, i64 %4
  %15 = getelementptr double, ptr addrspace(1) %arg1028, i64 %4
  %16 = getelementptr double, ptr addrspace(1) %arg1130, i64 %4
  %17 = getelementptr double, ptr addrspace(1) %arg1232, i64 %4
  %18 = getelementptr double, ptr addrspace(1) %arg1334, i64 %4
  %19 = getelementptr double, ptr addrspace(1) %arg1436, i64 %4
  %20 = getelementptr double, ptr addrspace(1) %arg1538, i64 %4
  %21 = getelementptr double, ptr addrspace(1) %arg1640, i64 %4
  %22 = getelementptr double, ptr addrspace(1) %arg1742, i64 %4
  %23 = getelementptr double, ptr addrspace(1) %arg1844, i64 %4
  %24 = getelementptr double, ptr addrspace(1) %arg1946, i64 %4
  %25 = getelementptr double, ptr addrspace(1) %arg2048, i64 %4
  %26 = getelementptr double, ptr addrspace(1) %arg2150, i64 %4
  %27 = getelementptr double, ptr addrspace(1) %arg2252, i64 %4
  %28 = getelementptr double, ptr addrspace(1) %arg2354, i64 %4
  %29 = getelementptr double, ptr addrspace(1) %arg2456, i64 %4
  %30 = getelementptr double, ptr addrspace(1) %arg2558, i64 %4
  %31 = getelementptr double, ptr addrspace(1) %arg2660, i64 %4
  %32 = getelementptr double, ptr addrspace(1) %arg2762, i64 %4
  %33 = getelementptr double, ptr addrspace(1) %arg2864, i64 %4
  %34 = getelementptr double, ptr addrspace(1) %arg2966, i64 %4
  %35 = getelementptr double, ptr addrspace(1) %arg3068, i64 %4
  %36 = getelementptr double, ptr addrspace(1) %arg3170, i64 %4
  %37 = getelementptr double, ptr addrspace(1) %arg3272, i64 %4
  %38 = getelementptr double, ptr addrspace(1) %arg3374, i64 %4
  %39 = getelementptr double, ptr addrspace(1) %arg3476, i64 %4
  %40 = getelementptr double, ptr addrspace(1) %arg3578, i64 %4
  %41 = getelementptr double, ptr addrspace(1) %arg3680, i64 %4
  %42 = getelementptr double, ptr addrspace(1) %arg3782, i64 %4
  %43 = getelementptr double, ptr addrspace(1) %arg3884, i64 %4
  %44 = getelementptr double, ptr addrspace(1) %arg3986, i64 %4
  %45 = getelementptr double, ptr addrspace(1) %arg4088, i64 %4
  %46 = getelementptr double, ptr addrspace(1) %arg4190, i64 %4
  %47 = getelementptr double, ptr addrspace(1) %arg4292, i64 %4
  %48 = getelementptr double, ptr addrspace(1) %arg4394, i64 %4
  store <2 x double> zeroinitializer, ptr addrspace(1) %5, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %6, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %7, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %8, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %9, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %10, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %11, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %12, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %13, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %14, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %15, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %16, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %17, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %18, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %19, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %20, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %21, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %22, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %23, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %24, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %25, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %26, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %27, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %28, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %29, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %30, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %31, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %32, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %33, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %34, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %35, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %36, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %37, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %38, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %39, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %40, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %41, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %42, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %43, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %44, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %45, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %46, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %47, align 32
  store <2 x double> zeroinitializer, ptr addrspace(1) %48, align 32
  %49 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 16
  %50 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 16
  %51 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 16
  %52 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 16
  %53 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 16
  %54 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 16
  %55 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 16
  %56 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 16
  %57 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 16
  %58 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 16
  %59 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 16
  %60 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 16
  %61 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 16
  %62 = getelementptr inbounds i8, ptr addrspace(1) %18, i64 16
  %63 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 16
  %64 = getelementptr inbounds i8, ptr addrspace(1) %20, i64 16
  %65 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 16
  %66 = getelementptr inbounds i8, ptr addrspace(1) %22, i64 16
  %67 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 16
  %68 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 16
  %69 = getelementptr inbounds i8, ptr addrspace(1) %25, i64 16
  %70 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 16
  %71 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 16
  %72 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 16
  %73 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 16
  %74 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 16
  %75 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 16
  %76 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 16
  %77 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 16
  %78 = getelementptr inbounds i8, ptr addrspace(1) %34, i64 16
  %79 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 16
  %80 = getelementptr inbounds i8, ptr addrspace(1) %36, i64 16
  %81 = getelementptr inbounds i8, ptr addrspace(1) %37, i64 16
  %82 = getelementptr inbounds i8, ptr addrspace(1) %38, i64 16
  %83 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 16
  %84 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 16
  %85 = getelementptr inbounds i8, ptr addrspace(1) %41, i64 16
  %86 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 16
  %87 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 16
  %88 = getelementptr inbounds i8, ptr addrspace(1) %44, i64 16
  %89 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 16
  %90 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 16
  %91 = getelementptr inbounds i8, ptr addrspace(1) %47, i64 16
  %92 = getelementptr inbounds i8, ptr addrspace(1) %48, i64 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %49, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %50, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %51, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %52, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %53, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %54, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %55, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %56, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %57, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %58, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %59, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %60, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %61, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %62, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %63, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %64, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %65, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %66, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %67, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %68, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %69, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %70, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %71, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %72, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %73, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %74, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %75, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %76, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %77, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %78, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %79, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %80, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %81, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %82, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %83, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %84, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %85, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %86, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %87, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %88, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %89, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %90, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %91, align 16
  store <2 x double> zeroinitializer, ptr addrspace(1) %92, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !194
  %1 = icmp slt i64 %0, 192
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !194
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !194
  store double %9, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #2 {
entry:
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !194
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 192
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 191)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg02, i64 0, i64 %7
  %9 = load i32, ptr addrspace(1) %8, align 4, !invariant.load !194
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i32
  store i32 %9, ptr addrspace(1) %arg26, align 128
  store i32 %11, ptr addrspace(1) %arg38, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg5) local_unnamed_addr #2 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %4 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !194
  %multiply.3498.7.clone.1 = fmul double %3, %5
  %6 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %multiply.3499.9.clone.1 = fmul double %6, %8
  %add.1031.7.clone.1 = fadd double %multiply.3498.7.clone.1, %multiply.3499.9.clone.1
  %9 = fneg double %add.1031.7.clone.1
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #5
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #5
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %9)
  %14 = tail call double @llvm.fma.f64(double %12, double 0xBC7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 0x3EC71DEE62401315)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double 0x3EFA01997C89EB71)
  %18 = tail call double @llvm.fma.f64(double %17, double %14, double 0x3F2A01A014761F65)
  %19 = tail call double @llvm.fma.f64(double %18, double %14, double 0x3F56C16C1852B7AF)
  %20 = tail call double @llvm.fma.f64(double %19, double %14, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %20, double %14, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %21, double %14, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %22, double %14, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %23, double %14, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %24, double %14, double 1.000000e+00)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #5
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #5
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #5
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %9) #5
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #5
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp ogt double %add.1031.7.clone.1, 0.000000e+00
  %36 = fsub double 0x7FF0000000000000, %add.1031.7.clone.1
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #5
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #5
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.1032.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.856.1.clone.1 = fdiv double 1.000000e+00, %add.1032.1.clone.1
  %subtract.145.5 = fsub double 1.000000e+00, %divide.856.1.clone.1
  %multiply.3500.1 = fmul double %divide.856.1.clone.1, %subtract.145.5
  %48 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.3500.1, ptr addrspace(1) %48, align 8
  %49 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %divide.856.1.clone.1, ptr addrspace(1) %49, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg8) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %4 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !194
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %9 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !194
  %multiply.3502.27 = fmul double %8, %10
  %add.1033.25 = fadd double %6, %multiply.3502.27
  %11 = tail call double @llvm.fma.f64(double %add.1033.25, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #5
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #5
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %add.1033.25)
  %15 = tail call double @llvm.fma.f64(double %13, double 0xBC7ABC9E3B39803F, double %14)
  %16 = tail call double @llvm.fma.f64(double %15, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %17 = tail call double @llvm.fma.f64(double %16, double %15, double 0x3EC71DEE62401315)
  %18 = tail call double @llvm.fma.f64(double %17, double %15, double 0x3EFA01997C89EB71)
  %19 = tail call double @llvm.fma.f64(double %18, double %15, double 0x3F2A01A014761F65)
  %20 = tail call double @llvm.fma.f64(double %19, double %15, double 0x3F56C16C1852B7AF)
  %21 = tail call double @llvm.fma.f64(double %20, double %15, double 0x3F81111111122322)
  %22 = tail call double @llvm.fma.f64(double %21, double %15, double 0x3FA55555555502A1)
  %23 = tail call double @llvm.fma.f64(double %22, double %15, double 0x3FC5555555555511)
  %24 = tail call double @llvm.fma.f64(double %23, double %15, double 0x3FE000000000000B)
  %25 = tail call double @llvm.fma.f64(double %24, double %15, double 1.000000e+00)
  %26 = tail call double @llvm.fma.f64(double %25, double %15, double 1.000000e+00)
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #5
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #5
  %29 = shl i32 %12, 20
  %30 = add i32 %28, %29
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %30) #5
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.25) #5
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #5
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %36 = fcmp olt double %add.1033.25, 0.000000e+00
  %37 = fadd double %add.1033.25, 0x7FF0000000000000
  %z.0.i = select i1 %36, double 0.000000e+00, double %37
  %38 = fcmp olt float %34, 0x4010E90000000000
  br i1 %38, label %39, label %__nv_exp.exit

39:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %40 = sdiv i32 %12, 2
  %41 = shl i32 %40, 20
  %42 = add i32 %28, %41
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %42) #5
  %44 = sub nsw i32 %12, %40
  %45 = shl i32 %44, 20
  %46 = add nsw i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %46) #5
  %48 = fmul double %47, %43
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %39
  %z.2.i = phi double [ %31, %entry ], [ %48, %39 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.857.1.clone.1 = fdiv double 1.000000e+00, %3
  %multiply.3503.37 = fmul double %4, %z.2.i
  %compare.375.19 = fcmp ogt double %multiply.3503.37, 1.000000e-128
  %49 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !194
  %51 = select i1 %compare.375.19, double %multiply.3503.37, double %50
  %add.1034.2 = fadd double %divide.857.1.clone.1, %51
  %divide.858.1 = fdiv double 1.000000e+00, %add.1034.2
  %multiply.3508.2.clone.1 = fmul double %3, %3
  %divide.860.1.clone.1 = fdiv double 1.000000e+00, %multiply.3508.2.clone.1
  %52 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %divide.858.1, ptr addrspace(1) %52, align 8
  %53 = getelementptr double, ptr addrspace(1) %arg715, i64 %1
  store double %divide.857.1.clone.1, ptr addrspace(1) %53, align 8
  %54 = getelementptr double, ptr addrspace(1) %arg817, i64 %1
  store double %divide.860.1.clone.1, ptr addrspace(1) %54, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_103(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.1616 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !194
  %0 = icmp slt i64 %param_1.1616, 0
  %1 = add i64 %param_1.1616, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1616
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_2.1372 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg214, i64 0, i64 %4
  %param_2.13728 = load i32, ptr addrspace(1) %param_2.1372, align 4, !invariant.load !194
  %5 = icmp ne i32 %param_2.13728, 0
  %6 = zext i1 %5 to i32
  %7 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg010, i64 0, i64 %4
  store i32 %6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_78(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.1488 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !194
  %0 = icmp slt i64 %param_1.1488, 0
  %1 = add i64 %param_1.1488, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1488
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_2.1349 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg213, i64 0, i64 %4
  %param_2.13498 = load i32, ptr addrspace(1) %param_2.1349, align 4, !invariant.load !194
  %5 = sitofp i32 %param_2.13498 to double
  %6 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg09, i64 0, i64 %4
  store double %5, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_85(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5) local_unnamed_addr #2 {
entry:
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1541 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !194
  %param_2.13574 = load double, ptr addrspace(1) %arg212, align 128, !invariant.load !194
  %1 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.11705 = load double, ptr addrspace(1) %1, align 8, !invariant.load !194
  %2 = getelementptr double, ptr addrspace(1) %arg518, i64 %thread_id_x
  %param_5.8346 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %3 = getelementptr double, ptr addrspace(1) %arg416, i64 %thread_id_x
  %param_4.9487 = load double, ptr addrspace(1) %3, align 8, !invariant.load !194
  %multiply.3502.9 = fmul double %param_5.8346, %param_4.9487
  %add.1033.7 = fadd double %param_3.11705, %multiply.3502.9
  %4 = tail call double @llvm.fma.f64(double %add.1033.7, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #5
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #5
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.1033.7)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #5
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #5
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.7) #5
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #5
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.1033.7, 0.000000e+00
  %30 = fadd double %add.1033.7, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #5
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #5
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_1.1541, 0
  %43 = add i64 %param_1.1541, 192
  %44 = select i1 %42, i64 %43, i64 %param_1.1541
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %multiply.3503.25 = fmul double %param_2.13574, %z.2.i
  %compare.375.7 = fcmp ogt double %multiply.3503.25, 1.000000e-128
  %47 = zext i1 %compare.375.7 to i8
  %48 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg08, i64 0, i64 %46, i64 %thread_id_x
  store i8 %47, ptr addrspace(1) %48, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_93(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1523 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !194
  %param_3.11724 = load double, ptr addrspace(1) %arg312, align 128, !invariant.load !194
  %1 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13585 = load double, ptr addrspace(1) %1, align 8, !invariant.load !194
  %2 = tail call double @llvm.fma.f64(double %param_2.13585, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #5
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #5
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_2.13585)
  %6 = tail call double @llvm.fma.f64(double %4, double 0xBC7ABC9E3B39803F, double %5)
  %7 = tail call double @llvm.fma.f64(double %6, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %8 = tail call double @llvm.fma.f64(double %7, double %6, double 0x3EC71DEE62401315)
  %9 = tail call double @llvm.fma.f64(double %8, double %6, double 0x3EFA01997C89EB71)
  %10 = tail call double @llvm.fma.f64(double %9, double %6, double 0x3F2A01A014761F65)
  %11 = tail call double @llvm.fma.f64(double %10, double %6, double 0x3F56C16C1852B7AF)
  %12 = tail call double @llvm.fma.f64(double %11, double %6, double 0x3F81111111122322)
  %13 = tail call double @llvm.fma.f64(double %12, double %6, double 0x3FA55555555502A1)
  %14 = tail call double @llvm.fma.f64(double %13, double %6, double 0x3FC5555555555511)
  %15 = tail call double @llvm.fma.f64(double %14, double %6, double 0x3FE000000000000B)
  %16 = tail call double @llvm.fma.f64(double %15, double %6, double 1.000000e+00)
  %17 = tail call double @llvm.fma.f64(double %16, double %6, double 1.000000e+00)
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #5
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #5
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #5
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.13585) #5
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #5
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_2.13585, 0.000000e+00
  %28 = fadd double %param_2.13585, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #5
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #5
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_1.1523, 0
  %41 = add i64 %param_1.1523, 192
  %42 = select i1 %40, i64 %41, i64 %param_1.1523
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %multiply.3524.37 = fmul double %param_3.11724, %z.2.i
  %compare.377.7 = fcmp ogt double %multiply.3524.37, 1.000000e-128
  %45 = zext i1 %compare.377.7 to i8
  %46 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %44, i64 %thread_id_x
  store i8 %45, ptr addrspace(1) %46, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg4) local_unnamed_addr #2 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !199
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %2 = mul nuw nsw i32 %0, 140
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !200
  %4 = mul nuw nsw i32 %3, 20
  %5 = add nuw nsw i32 %4, %1
  %linear_index = add nuw nsw i32 %5, %2
  %6 = icmp ult i32 %linear_index, 2400
  br i1 %6, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %7 = zext nneg i32 %1 to i64
  %8 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg37, i64 0, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !194
  %10 = zext nneg i32 %linear_index to i64
  %11 = getelementptr double, ptr addrspace(1) %arg25, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %multiply.3504.19 = fmul double %9, %12
  %13 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg01, i64 0, i64 %7
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !194
  %multiply.3505.19 = fmul double %multiply.3504.19, %14
  %15 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg13, i64 0, i64 %7
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !194
  %subtract.145.3 = fsub double 1.000000e+00, %16
  %multiply.3506.3 = fmul double %multiply.3505.19, %subtract.145.3
  %17 = fmul double %multiply.3505.19, %16
  %add.1035.1 = fsub double %multiply.3506.3, %17
  %18 = getelementptr double, ptr addrspace(1) %arg49, i64 %10
  store double %add.1035.1, ptr addrspace(1) %18, align 8
  br label %loop_add_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg10) local_unnamed_addr #2 {
entry:
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_multiply_fusion.1.in_bounds-true, label %loop_multiply_fusion.1.in_bounds-after

loop_multiply_fusion.1.in_bounds-after:           ; preds = %__nv_exp.exit, %entry
  ret void

loop_multiply_fusion.1.in_bounds-true:            ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = urem i16 %.lhs.trunc, 20
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr double, ptr addrspace(1) %arg13, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %8 = zext nneg i16 %4 to i64
  %9 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !194
  %11 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !194
  %12 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg613, i64 0, i64 %8
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %14 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg49, i64 0, i64 %8, i64 0
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !194
  %16 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg715, i64 0, i64 %8
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !194
  %multiply.3502.33 = fmul double %15, %17
  %add.1033.31 = fadd double %13, %multiply.3502.33
  %18 = tail call double @llvm.fma.f64(double %add.1033.31, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #5
  %20 = tail call double @llvm.nvvm.add.rn.d(double %18, double 0xC338000000000000) #5
  %21 = tail call double @llvm.fma.f64(double %20, double 0xBFE62E42FEFA39EF, double %add.1033.31)
  %22 = tail call double @llvm.fma.f64(double %20, double 0xBC7ABC9E3B39803F, double %21)
  %23 = tail call double @llvm.fma.f64(double %22, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %24 = tail call double @llvm.fma.f64(double %23, double %22, double 0x3EC71DEE62401315)
  %25 = tail call double @llvm.fma.f64(double %24, double %22, double 0x3EFA01997C89EB71)
  %26 = tail call double @llvm.fma.f64(double %25, double %22, double 0x3F2A01A014761F65)
  %27 = tail call double @llvm.fma.f64(double %26, double %22, double 0x3F56C16C1852B7AF)
  %28 = tail call double @llvm.fma.f64(double %27, double %22, double 0x3F81111111122322)
  %29 = tail call double @llvm.fma.f64(double %28, double %22, double 0x3FA55555555502A1)
  %30 = tail call double @llvm.fma.f64(double %29, double %22, double 0x3FC5555555555511)
  %31 = tail call double @llvm.fma.f64(double %30, double %22, double 0x3FE000000000000B)
  %32 = tail call double @llvm.fma.f64(double %31, double %22, double 1.000000e+00)
  %33 = tail call double @llvm.fma.f64(double %32, double %22, double 1.000000e+00)
  %34 = tail call i32 @llvm.nvvm.d2i.lo(double %33) #5
  %35 = tail call i32 @llvm.nvvm.d2i.hi(double %33) #5
  %36 = shl i32 %19, 20
  %37 = add i32 %35, %36
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 %34, i32 %37) #5
  %39 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.31) #5
  %40 = bitcast i32 %39 to float
  %41 = tail call float @llvm.nvvm.fabs.f(float %40) #5
  %42 = fcmp olt float %41, 0x4010C46560000000
  br i1 %42, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %loop_multiply_fusion.1.in_bounds-true
  %43 = fcmp olt double %add.1033.31, 0.000000e+00
  %44 = fadd double %add.1033.31, 0x7FF0000000000000
  %z.0.i = select i1 %43, double 0.000000e+00, double %44
  %45 = fcmp olt float %41, 0x4010E90000000000
  br i1 %45, label %46, label %__nv_exp.exit

46:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %47 = sdiv i32 %19, 2
  %48 = shl i32 %47, 20
  %49 = add i32 %35, %48
  %50 = tail call double @llvm.nvvm.lohi.i2d(i32 %34, i32 %49) #5
  %51 = sub nsw i32 %19, %47
  %52 = shl i32 %51, 20
  %53 = add nsw i32 %52, 1072693248
  %54 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %53) #5
  %55 = fmul double %54, %50
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %loop_multiply_fusion.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %46
  %z.2.i = phi double [ %38, %loop_multiply_fusion.1.in_bounds-true ], [ %55, %46 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3503.45 = fmul double %11, %z.2.i
  %compare.375.25 = fcmp ogt double %multiply.3503.45, 1.000000e-128
  %56 = getelementptr double, ptr addrspace(1) %arg25, i64 %5
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !194
  %58 = getelementptr double, ptr addrspace(1) %arg37, i64 %5
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !194
  %multiply.3510.13 = fmul double %15, %59
  %add.1036.11 = fadd double %57, %multiply.3510.13
  %multiply.3511.9 = fmul double %z.2.i, %add.1036.11
  %multiply.3512.7 = fmul double %11, %multiply.3511.9
  %60 = select i1 %compare.375.25, double %multiply.3512.7, double 0.000000e+00
  %61 = fmul double %7, %10
  %add.1037.5 = fsub double %60, %61
  %62 = fneg double %add.1037.5
  %63 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg817, i64 0, i64 %8
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !194
  %65 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg919, i64 0, i64 %8
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !194
  %67 = select i1 %compare.375.25, double %multiply.3503.45, double %66
  %add.1034.10 = fadd double %64, %67
  %multiply.3513.10 = fmul double %add.1034.10, %add.1034.10
  %divide.861.5 = fdiv double 1.000000e+00, %multiply.3513.10
  %multiply.3514.1 = fmul double %divide.861.5, %62
  %68 = getelementptr double, ptr addrspace(1) %arg1021, i64 %5
  store double %multiply.3514.1, ptr addrspace(1) %68, align 8
  br label %loop_multiply_fusion.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_84(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1284 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1284, 0
  %2 = add i64 %param_2.1284, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1284
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15434 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.15434, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_82(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7) local_unnamed_addr #2 {
entry:
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1549 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !194
  %1 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12904 = load double, ptr addrspace(1) %1, align 8, !invariant.load !194
  %param_4.9185 = load double, ptr addrspace(1) %arg418, align 128, !invariant.load !194
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.8386 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %3 = getelementptr double, ptr addrspace(1) %arg724, i64 %thread_id_x
  %param_7.4547 = load double, ptr addrspace(1) %3, align 8, !invariant.load !194
  %4 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.6088 = load double, ptr addrspace(1) %4, align 8, !invariant.load !194
  %multiply.3502.39 = fmul double %param_7.4547, %param_6.6088
  %add.1033.37 = fadd double %param_5.8386, %multiply.3502.39
  %5 = tail call double @llvm.fma.f64(double %add.1033.37, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #5
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #5
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.1033.37)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #5
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #5
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #5
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.37) #5
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #5
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.1033.37, 0.000000e+00
  %31 = fadd double %add.1033.37, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #5
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #5
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = icmp slt i64 %param_1.1549, 0
  %44 = add i64 %param_1.1549, 192
  %45 = select i1 %43, i64 %44, i64 %param_1.1549
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %multiply.3503.53 = fmul double %param_4.9185, %z.2.i
  %compare.375.31 = fcmp ogt double %multiply.3503.53, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11259 = load double, ptr addrspace(1) %48, align 8, !invariant.load !194
  %49 = select i1 %compare.375.31, double %multiply.3503.53, double %param_3.11259
  %add.1034.8 = fadd double %param_2.12904, %49
  %multiply.3513.8 = fmul double %add.1034.8, %add.1034.8
  %divide.861.3 = fdiv double 1.000000e+00, %multiply.3513.8
  %50 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg010, i64 0, i64 %47, i64 %thread_id_x
  store double %divide.861.3, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_77(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg4) local_unnamed_addr #2 {
entry:
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1134 = load i64, ptr addrspace(1) %arg320, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_3.1134, 0
  %2 = add i64 %param_3.1134, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.1134
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_2.1301 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr addrspace(1) %arg218, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_2.130111 = load double, ptr addrspace(1) %param_2.1301, align 8, !invariant.load !194
  %6 = getelementptr double, ptr addrspace(1) %arg116, i64 %thread_id_x
  %param_1.156012 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %subtract.146.9 = fsub double %param_2.130111, %param_1.156012
  %param_4.923 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg422, i64 0, i64 %5
  %param_4.92313 = load i32, ptr addrspace(1) %param_4.923, align 4, !invariant.load !194
  %7 = sitofp i32 %param_4.92313 to double
  %multiply.3515.7 = fmul double %subtract.146.9, %7
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg014, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3515.7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_80(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1351 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1351, 0
  %2 = add i64 %param_2.1351, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1351
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15534 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %subtract.145.7 = fsub double 1.000000e+00, %param_1.15534
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.145.7, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_76(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1562 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1562, 0
  %2 = add i64 %param_1.1562, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1562
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.13034 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %multiply.3541.8 = fmul double %param_2.13034, %param_2.13034
  %divide.871.3 = fdiv double 1.000000e+00, %multiply.3541.8
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.871.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_67(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1143 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_3.1143, 0
  %2 = add i64 %param_3.1143, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.1143
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13214 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.15805 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %multiply.3501.7 = fmul double %param_2.13214, %param_1.15805
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3501.7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_83(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6) local_unnamed_addr #2 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1545 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !194
  %param_3.11214 = load double, ptr addrspace(1) %arg315, align 128, !invariant.load !194
  %1 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.9515 = load double, ptr addrspace(1) %1, align 8, !invariant.load !194
  %2 = getelementptr double, ptr addrspace(1) %arg621, i64 %thread_id_x
  %param_6.6076 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %3 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.8377 = load double, ptr addrspace(1) %3, align 8, !invariant.load !194
  %multiply.3502.23 = fmul double %param_6.6076, %param_5.8377
  %add.1033.21 = fadd double %param_4.9515, %multiply.3502.23
  %4 = tail call double @llvm.fma.f64(double %add.1033.21, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #5
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #5
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.1033.21)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #5
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #5
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.21) #5
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #5
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.1033.21, 0.000000e+00
  %30 = fadd double %add.1033.21, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #5
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #5
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_1.1545, 0
  %43 = add i64 %param_1.1545, 192
  %44 = select i1 %42, i64 %43, i64 %param_1.1545
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %multiply.3503.33 = fmul double %param_3.11214, %z.2.i
  %compare.375.15 = fcmp ogt double %multiply.3503.33, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12868 = load double, ptr addrspace(1) %47, align 8, !invariant.load !194
  %48 = select i1 %compare.375.15, double %multiply.3503.33, double %param_2.12868
  %49 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg09, i64 0, i64 %46, i64 %thread_id_x
  store double %48, ptr addrspace(1) %49, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_86(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1539 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !194
  %1 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12804 = load double, ptr addrspace(1) %1, align 8, !invariant.load !194
  %2 = getelementptr double, ptr addrspace(1) %arg415, i64 %thread_id_x
  %param_4.9115 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %3 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.11166 = load double, ptr addrspace(1) %3, align 8, !invariant.load !194
  %multiply.3502.11 = fmul double %param_4.9115, %param_3.11166
  %add.1033.9 = fadd double %param_2.12804, %multiply.3502.11
  %4 = tail call double @llvm.fma.f64(double %add.1033.9, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #5
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #5
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.1033.9)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #5
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #5
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #5
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.9) #5
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #5
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.1033.9, 0.000000e+00
  %30 = fadd double %add.1033.9, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #5
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #5
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_1.1539, 0
  %43 = add i64 %param_1.1539, 192
  %44 = select i1 %42, i64 %43, i64 %param_1.1539
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %47 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %46, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_44(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1385 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1385, 0
  %2 = add i64 %param_2.1385, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1385
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.16234 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %multiply.3533.9 = fmul double %param_1.16234, %param_1.16234
  %multiply.3534.7 = fmul double %multiply.3533.9, 5.000000e-01
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3534.7, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1377 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1377, 0
  %2 = add i64 %param_2.1377, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1377
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.16214 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %multiply.3587.3 = fmul double %param_1.16214, 2.000000e+00
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3587.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_102(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1275 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1275, 0
  %2 = add i64 %param_2.1275, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1275
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_1.15344 = load double, ptr addrspace(1) %arg17, align 128, !invariant.load !194
  %6 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.15344, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_54(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1249 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1249, 0
  %2 = add i64 %param_2.1249, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1249
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15084 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = sitofp i64 %param_1.15084 to double
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_60(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1338 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1338, 0
  %2 = add i64 %param_2.1338, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1338
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15974 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.15974, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_88(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1276 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1276, 0
  %2 = add i64 %param_2.1276, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1276
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15354 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.15354, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_91(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1527 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !194
  %param_4.9064 = load double, ptr addrspace(1) %arg415, align 128, !invariant.load !194
  %1 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.11115 = load double, ptr addrspace(1) %1, align 8, !invariant.load !194
  %2 = tail call double @llvm.fma.f64(double %param_3.11115, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #5
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #5
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_3.11115)
  %6 = tail call double @llvm.fma.f64(double %4, double 0xBC7ABC9E3B39803F, double %5)
  %7 = tail call double @llvm.fma.f64(double %6, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %8 = tail call double @llvm.fma.f64(double %7, double %6, double 0x3EC71DEE62401315)
  %9 = tail call double @llvm.fma.f64(double %8, double %6, double 0x3EFA01997C89EB71)
  %10 = tail call double @llvm.fma.f64(double %9, double %6, double 0x3F2A01A014761F65)
  %11 = tail call double @llvm.fma.f64(double %10, double %6, double 0x3F56C16C1852B7AF)
  %12 = tail call double @llvm.fma.f64(double %11, double %6, double 0x3F81111111122322)
  %13 = tail call double @llvm.fma.f64(double %12, double %6, double 0x3FA55555555502A1)
  %14 = tail call double @llvm.fma.f64(double %13, double %6, double 0x3FC5555555555511)
  %15 = tail call double @llvm.fma.f64(double %14, double %6, double 0x3FE000000000000B)
  %16 = tail call double @llvm.fma.f64(double %15, double %6, double 1.000000e+00)
  %17 = tail call double @llvm.fma.f64(double %16, double %6, double 1.000000e+00)
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #5
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #5
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #5
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_3.11115) #5
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #5
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_3.11115, 0.000000e+00
  %28 = fadd double %param_3.11115, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #5
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #5
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_1.1527, 0
  %41 = add i64 %param_1.1527, 192
  %42 = select i1 %40, i64 %41, i64 %param_1.1527
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %multiply.3524.57 = fmul double %param_4.9064, %z.2.i
  %compare.377.27 = fcmp ogt double %multiply.3524.57, 1.000000e-128
  %45 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12686 = load double, ptr addrspace(1) %45, align 8, !invariant.load !194
  %46 = select i1 %compare.377.27, double %multiply.3524.57, double %param_2.12686
  %47 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %44, i64 %thread_id_x
  store double %46, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_94(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1262 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15214 = load double, ptr addrspace(1) %1, align 8, !invariant.load !194
  %2 = tail call double @llvm.fma.f64(double %param_1.15214, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #5
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #5
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_1.15214)
  %6 = tail call double @llvm.fma.f64(double %4, double 0xBC7ABC9E3B39803F, double %5)
  %7 = tail call double @llvm.fma.f64(double %6, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %8 = tail call double @llvm.fma.f64(double %7, double %6, double 0x3EC71DEE62401315)
  %9 = tail call double @llvm.fma.f64(double %8, double %6, double 0x3EFA01997C89EB71)
  %10 = tail call double @llvm.fma.f64(double %9, double %6, double 0x3F2A01A014761F65)
  %11 = tail call double @llvm.fma.f64(double %10, double %6, double 0x3F56C16C1852B7AF)
  %12 = tail call double @llvm.fma.f64(double %11, double %6, double 0x3F81111111122322)
  %13 = tail call double @llvm.fma.f64(double %12, double %6, double 0x3FA55555555502A1)
  %14 = tail call double @llvm.fma.f64(double %13, double %6, double 0x3FC5555555555511)
  %15 = tail call double @llvm.fma.f64(double %14, double %6, double 0x3FE000000000000B)
  %16 = tail call double @llvm.fma.f64(double %15, double %6, double 1.000000e+00)
  %17 = tail call double @llvm.fma.f64(double %16, double %6, double 1.000000e+00)
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #5
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #5
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #5
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.15214) #5
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #5
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_1.15214, 0.000000e+00
  %28 = fadd double %param_1.15214, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #5
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #5
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_2.1262, 0
  %41 = add i64 %param_2.1262, 192
  %42 = select i1 %40, i64 %41, i64 %param_2.1262
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %45 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %44, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %45, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_exponential_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg9) local_unnamed_addr #2 {
entry:
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %4 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !194
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %9 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !194
  %multiply.3478.5.clone.1 = fmul double %8, %10
  %add.1023.3.clone.1 = fadd double %6, %multiply.3478.5.clone.1
  %11 = tail call double @llvm.fma.f64(double %add.1023.3.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #5
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #5
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %add.1023.3.clone.1)
  %15 = tail call double @llvm.fma.f64(double %13, double 0xBC7ABC9E3B39803F, double %14)
  %16 = tail call double @llvm.fma.f64(double %15, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %17 = tail call double @llvm.fma.f64(double %16, double %15, double 0x3EC71DEE62401315)
  %18 = tail call double @llvm.fma.f64(double %17, double %15, double 0x3EFA01997C89EB71)
  %19 = tail call double @llvm.fma.f64(double %18, double %15, double 0x3F2A01A014761F65)
  %20 = tail call double @llvm.fma.f64(double %19, double %15, double 0x3F56C16C1852B7AF)
  %21 = tail call double @llvm.fma.f64(double %20, double %15, double 0x3F81111111122322)
  %22 = tail call double @llvm.fma.f64(double %21, double %15, double 0x3FA55555555502A1)
  %23 = tail call double @llvm.fma.f64(double %22, double %15, double 0x3FC5555555555511)
  %24 = tail call double @llvm.fma.f64(double %23, double %15, double 0x3FE000000000000B)
  %25 = tail call double @llvm.fma.f64(double %24, double %15, double 1.000000e+00)
  %26 = tail call double @llvm.fma.f64(double %25, double %15, double 1.000000e+00)
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #5
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #5
  %29 = shl i32 %12, 20
  %30 = add i32 %28, %29
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %30) #5
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1023.3.clone.1) #5
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #5
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %36 = fcmp olt double %add.1023.3.clone.1, 0.000000e+00
  %37 = fadd double %add.1023.3.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %36, double 0.000000e+00, double %37
  %38 = fcmp olt float %34, 0x4010E90000000000
  br i1 %38, label %39, label %__nv_exp.exit

39:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %40 = sdiv i32 %12, 2
  %41 = shl i32 %40, 20
  %42 = add i32 %28, %41
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %42) #5
  %44 = sub nsw i32 %12, %40
  %45 = shl i32 %44, 20
  %46 = add nsw i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %46) #5
  %48 = fmul double %47, %43
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %39
  %z.2.i = phi double [ %31, %entry ], [ %48, %39 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.850.1.clone.1 = fdiv double 1.000000e+00, %3
  %multiply.3479.1.clone.1 = fmul double %4, %z.2.i
  %add.1024.1.clone.1 = fadd double %divide.850.1.clone.1, %multiply.3479.1.clone.1
  %multiply.3481.2 = fmul double %add.1024.1.clone.1, %add.1024.1.clone.1
  %divide.853.1 = fdiv double 1.000000e+00, %multiply.3481.2
  %divide.851.1.clone.1 = fdiv double 1.000000e+00, %add.1024.1.clone.1
  %multiply.3480.2.clone.1 = fmul double %3, %3
  %divide.852.1.clone.1 = fdiv double 1.000000e+00, %multiply.3480.2.clone.1
  %49 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %divide.853.1, ptr addrspace(1) %49, align 8
  %50 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %divide.851.1.clone.1, ptr addrspace(1) %50, align 8
  %51 = getelementptr double, ptr addrspace(1) %arg715, i64 %1
  store double %add.1024.1.clone.1, ptr addrspace(1) %51, align 8
  %52 = getelementptr double, ptr addrspace(1) %arg817, i64 %1
  store double %z.2.i, ptr addrspace(1) %52, align 8
  %53 = getelementptr double, ptr addrspace(1) %arg919, i64 %1
  store double %divide.852.1.clone.1, ptr addrspace(1) %53, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg13) local_unnamed_addr #2 {
entry:
  %arg1328 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1226 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1124 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1022 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg920 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg818 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg716 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg614 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = urem i16 %.lhs.trunc, 20
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr double, ptr addrspace(1) %arg38, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %8 = zext nneg i16 %4 to i64
  %9 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg26, i64 0, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !194
  %11 = load double, ptr addrspace(1) %arg14, align 128, !invariant.load !194
  %12 = getelementptr double, ptr addrspace(1) %arg716, i64 %5
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %14 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg920, i64 0, i64 %8, i64 0
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !194
  %16 = getelementptr double, ptr addrspace(1) %arg818, i64 %5
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !194
  %multiply.3483.5.clone.1 = fmul double %15, %17
  %add.1025.3.clone.1 = fadd double %13, %multiply.3483.5.clone.1
  %18 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg614, i64 0, i64 %8
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !194
  %multiply.3484.1.clone.1 = fmul double %19, %add.1025.3.clone.1
  %multiply.3485.5 = fmul double %11, %multiply.3484.1.clone.1
  %20 = fmul double %7, %10
  %add.1026.5 = fsub double %multiply.3485.5, %20
  %21 = fneg double %add.1026.5
  %22 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg01, i64 0, i64 %8
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !194
  %multiply.3486.1 = fmul double %23, %21
  %24 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg410, i64 0, i64 %8
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !194
  %multiply.3480.6.clone.1 = fmul double %25, %25
  %multiply.3487.5.clone.1 = fmul double %25, %multiply.3480.6.clone.1
  %divide.854.3.clone.1 = fdiv double 1.000000e+00, %multiply.3487.5.clone.1
  %multiply.3488.3.clone.1 = fmul double %divide.854.3.clone.1, -2.000000e+00
  %multiply.3489.1.clone.1 = fmul double %7, %multiply.3488.3.clone.1
  %26 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg512, i64 0, i64 %8
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !194
  %multiply.3481.6.clone.1 = fmul double %27, %27
  %multiply.3490.5.clone.1 = fmul double %27, %multiply.3481.6.clone.1
  %divide.855.3.clone.1 = fdiv double 1.000000e+00, %multiply.3490.5.clone.1
  %multiply.3491.3.clone.1 = fmul double %divide.855.3.clone.1, -2.000000e+00
  %multiply.3492.1.clone.1 = fmul double %add.1026.5, %multiply.3491.3.clone.1
  %28 = getelementptr double, ptr addrspace(1) %arg1022, i64 %5
  store double %multiply.3486.1, ptr addrspace(1) %28, align 8
  %29 = getelementptr double, ptr addrspace(1) %arg1124, i64 %5
  store double %multiply.3489.1.clone.1, ptr addrspace(1) %29, align 8
  %30 = getelementptr double, ptr addrspace(1) %arg1226, i64 %5
  store double %multiply.3492.1.clone.1, ptr addrspace(1) %30, align 8
  %31 = getelementptr double, ptr addrspace(1) %arg1328, i64 %5
  store double %multiply.3484.1.clone.1, ptr addrspace(1) %31, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_convert(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg01, align 128, !invariant.load !194
  %1 = sitofp i32 %0 to double
  store double %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %4 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !194
  %multiply.3493.6.clone.1 = fmul double %5, %5
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %multiply.3494.9.clone.1 = fmul double %multiply.3493.6.clone.1, %7
  %8 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !194
  %multiply.3495.7.clone.1 = fmul double %multiply.3494.9.clone.1, %8
  %add.1027.5.clone.1 = fadd double %3, %multiply.3495.7.clone.1
  %compare.372.1.clone.1 = fcmp ogt double %add.1027.5.clone.1, 1.000000e-128
  %9 = zext i1 %compare.372.1.clone.1 to i8
  %10 = select i1 %compare.372.1.clone.1, double %add.1027.5.clone.1, double 0x7FF8000000000000
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %10, ptr addrspace(1) %11, align 8
  %12 = getelementptr i8, ptr addrspace(1) %arg511, i64 %1
  store i8 %9, ptr addrspace(1) %12, align 1
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %multiply.3493.6.clone.1, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_broadcast_select_fusion.in_bounds-true, label %loop_broadcast_select_fusion.in_bounds-after

loop_broadcast_select_fusion.in_bounds-after:     ; preds = %loop_broadcast_select_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_select_fusion.in_bounds-true:      ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = urem i16 %.lhs.trunc, 20
  %5 = zext nneg i16 %4 to i64
  %6 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg37, i64 0, i64 %5
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !194
  %8 = zext nneg i32 %linear_index to i64
  %9 = getelementptr double, ptr addrspace(1) %arg01, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !194
  %11 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg49, i64 0, i64 %5, i64 0
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %multiply.3493.2 = fmul double %12, %12
  %13 = getelementptr double, ptr addrspace(1) %arg13, i64 %8
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !194
  %multiply.3496.7 = fmul double %multiply.3493.2, %14
  %15 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !194
  %multiply.3497.5 = fmul double %multiply.3496.7, %15
  %add.1028.3 = fadd double %10, %multiply.3497.5
  %16 = trunc i8 %7 to i1
  %17 = select i1 %16, double %add.1028.3, double 0.000000e+00
  %18 = getelementptr double, ptr addrspace(1) %arg511, i64 %8
  store double %17, ptr addrspace(1) %18, align 8
  %19 = getelementptr double, ptr addrspace(1) %arg613, i64 %8
  store double 0.000000e+00, ptr addrspace(1) %19, align 8
  br label %loop_broadcast_select_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_74(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.873 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !194
  %0 = icmp slt i64 %param_2.873, 0
  %1 = add i64 %param_2.873, 192
  %2 = select i1 %0, i64 %1, i64 %param_2.873
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %param_1.1156 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !194
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  store double %param_1.1156, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_70(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1315 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1315, 0
  %2 = add i64 %param_2.1315, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1315
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15744 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !194
  %7 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %param_1.15744, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index6 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index6, 2400
  br i1 %3, label %dynamic-update-slice.2102.1.in_bounds-true, label %dynamic-update-slice.2102.1.in_bounds-after

dynamic-update-slice.2102.1.in_bounds-after:      ; preds = %dynamic-update-slice.2102.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2102.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index6 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index6 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext8 = zext nneg i16 %.decomposed to i64
  %param_2.1330 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1330, 0
  %7 = add i64 %param_2.1330, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1330
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg111, i64 %linear_index
  %param_1.15895 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %12 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %10, i64 %.zext, i64 %.zext8
  store double %param_1.15895, ptr addrspace(1) %12, align 8
  br label %dynamic-update-slice.2102.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3) local_unnamed_addr #2 {
entry:
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index11 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index11, 2400
  br i1 %3, label %dynamic-update-slice.2107.1.in_bounds-true, label %dynamic-update-slice.2107.1.in_bounds-after

dynamic-update-slice.2107.1.in_bounds-after:      ; preds = %dynamic-update-slice.2107.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2107.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index11 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index11 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext13 = zext nneg i16 %.decomposed to i64
  %param_2.1345 = load i64, ptr addrspace(1) %arg218, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1345, 0
  %7 = add i64 %param_2.1345, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1345
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg116, i64 %linear_index
  %param_1.16045 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_3.1191 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg320, i64 0, i64 %.zext13
  %param_3.11916 = load double, ptr addrspace(1) %param_3.1191, align 8, !invariant.load !194
  %multiply.3545.6 = fmul double %param_3.11916, %param_3.11916
  %multiply.3612.5 = fmul double %param_3.11916, %multiply.3545.6
  %divide.885.3 = fdiv double 1.000000e+00, %multiply.3612.5
  %multiply.3613.3 = fmul double %divide.885.3, -2.000000e+00
  %multiply.3614.1 = fmul double %param_1.16045, %multiply.3613.3
  %12 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg014, i64 0, i64 %10, i64 %.zext, i64 %.zext13
  store double %multiply.3614.1, ptr addrspace(1) %12, align 8
  br label %dynamic-update-slice.2107.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index7 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index7, 2400
  br i1 %3, label %dynamic-update-slice.2106.1.in_bounds-true, label %dynamic-update-slice.2106.1.in_bounds-after

dynamic-update-slice.2106.1.in_bounds-after:      ; preds = %dynamic-update-slice.2106.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2106.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index7 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index7 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext9 = zext nneg i16 %.decomposed to i64
  %param_3.1098 = load i64, ptr addrspace(1) %arg316, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_3.1098, 0
  %7 = add i64 %param_3.1098, 192
  %8 = select i1 %6, i64 %7, i64 %param_3.1098
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_2.1248 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg214, i64 0, i64 %.zext9, i64 0
  %param_2.12485 = load double, ptr addrspace(1) %param_2.1248, align 8, !invariant.load !194
  %11 = getelementptr double, ptr addrspace(1) %arg112, i64 %linear_index
  %param_1.15076 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %multiply.3543.3 = fmul double %param_2.12485, %param_1.15076
  %12 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %10, i64 %.zext, i64 %.zext9
  store double %multiply.3543.3, ptr addrspace(1) %12, align 8
  br label %dynamic-update-slice.2106.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index8 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index8, 2400
  br i1 %3, label %dynamic-update-slice.2098.1.in_bounds-true, label %dynamic-update-slice.2098.1.in_bounds-after

dynamic-update-slice.2098.1.in_bounds-after:      ; preds = %dynamic-update-slice.2098.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2098.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index8 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index8 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext10 = zext nneg i16 %.decomposed to i64
  %param_2.1308 = load i64, ptr addrspace(1) %arg215, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1308, 0
  %7 = add i64 %param_2.1308, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1308
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_4.927 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg419, i64 0, i64 %.zext10
  %param_4.9275 = load double, ptr addrspace(1) %param_4.927, align 8, !invariant.load !194
  %11 = getelementptr double, ptr addrspace(1) %arg317, i64 %linear_index
  %param_3.11406 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_1.1567 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg113, i64 0, i64 %.zext10
  %param_1.15677 = load double, ptr addrspace(1) %param_1.1567, align 8, !invariant.load !194
  %12 = fneg double %param_4.9275
  %13 = fmul double %param_3.11406, %12
  %14 = fmul double %13, %param_1.15677
  %15 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %10, i64 %.zext, i64 %.zext10
  store double %14, ptr addrspace(1) %15, align 8
  br label %dynamic-update-slice.2098.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index8 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index8, 2400
  br i1 %3, label %dynamic-update-slice.2099.1.in_bounds-true, label %dynamic-update-slice.2099.1.in_bounds-after

dynamic-update-slice.2099.1.in_bounds-after:      ; preds = %dynamic-update-slice.2099.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2099.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index8 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index8 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext10 = zext nneg i16 %.decomposed to i64
  %param_2.1295 = load i64, ptr addrspace(1) %arg215, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1295, 0
  %7 = add i64 %param_2.1295, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1295
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_4.920 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg419, i64 0, i64 %.zext10
  %param_4.9205 = load double, ptr addrspace(1) %param_4.920, align 8, !invariant.load !194
  %11 = getelementptr double, ptr addrspace(1) %arg317, i64 %linear_index
  %param_3.11296 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %multiply.3504.5 = fmul double %param_4.9205, %param_3.11296
  %param_1.1554 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg113, i64 0, i64 %.zext10
  %param_1.15547 = load double, ptr addrspace(1) %param_1.1554, align 8, !invariant.load !194
  %multiply.3505.9 = fmul double %multiply.3504.5, %param_1.15547
  %12 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %10, i64 %.zext, i64 %.zext10
  store double %multiply.3505.9, ptr addrspace(1) %12, align 8
  br label %dynamic-update-slice.2099.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg5) local_unnamed_addr #2 {
entry:
  %arg527 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg425 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg323 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg221 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg017 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index14 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index14, 2400
  br i1 %3, label %dynamic-update-slice.2100.1.in_bounds-true, label %dynamic-update-slice.2100.1.in_bounds-after

dynamic-update-slice.2100.1.in_bounds-after:      ; preds = %dynamic-update-slice.2100.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2100.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index14 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index14 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext16 = zext nneg i16 %.decomposed to i64
  %param_2.1263 = load i64, ptr addrspace(1) %arg221, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1263, 0
  %7 = add i64 %param_2.1263, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1263
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_4.902 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg425, i64 0, i64 %.zext16
  %param_4.9025 = load double, ptr addrspace(1) %param_4.902, align 8, !invariant.load !194
  %11 = getelementptr double, ptr addrspace(1) %arg323, i64 %linear_index
  %param_3.11076 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_1.1522 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg119, i64 0, i64 %.zext16
  %param_1.15227 = load double, ptr addrspace(1) %param_1.1522, align 8, !invariant.load !194
  %12 = fneg double %param_4.9025
  %13 = fmul double %param_3.11076, %12
  %14 = fmul double %13, %param_1.15227
  %param_5.799 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg527, i64 0, i64 %10
  %param_5.79913 = load i32, ptr addrspace(1) %param_5.799, align 4, !invariant.load !194
  %15 = sitofp i32 %param_5.79913 to double
  %multiply.3539.3 = fmul double %14, %15
  %16 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg017, i64 0, i64 %10, i64 %.zext, i64 %.zext16
  store double %multiply.3539.3, ptr addrspace(1) %16, align 8
  br label %dynamic-update-slice.2100.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_29(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg11) local_unnamed_addr #2 {
entry:
  %arg1140 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1038 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg936 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg834 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg732 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index15 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index15, 2400
  br i1 %3, label %dynamic-update-slice.2096.1.in_bounds-true, label %dynamic-update-slice.2096.1.in_bounds-after

dynamic-update-slice.2096.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2096.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index15 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index15 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext17 = zext nneg i16 %.decomposed to i64
  %param_3.1152 = load i64, ptr addrspace(1) %arg324, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_3.1152, 0
  %7 = add i64 %param_3.1152, 192
  %8 = select i1 %6, i64 %7, i64 %param_3.1152
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg222, i64 %linear_index
  %param_2.13395 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_1.1598 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg120, i64 0, i64 %.zext17
  %param_1.15986 = load double, ptr addrspace(1) %param_1.1598, align 8, !invariant.load !194
  %param_6.6237 = load double, ptr addrspace(1) %arg630, align 128, !invariant.load !194
  %param_7.472 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg732, i64 0, i64 %.zext17
  %param_7.4728 = load double, ptr addrspace(1) %param_7.472, align 8, !invariant.load !194
  %param_9.296 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg936, i64 0, i64 %.zext17, i64 0
  %param_9.2969 = load double, ptr addrspace(1) %param_9.296, align 8, !invariant.load !194
  %param_8.346 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg834, i64 0, i64 %.zext17
  %param_8.34610 = load double, ptr addrspace(1) %param_8.346, align 8, !invariant.load !194
  %multiply.3502.37 = fmul double %param_9.2969, %param_8.34610
  %add.1033.35 = fadd double %param_7.4728, %multiply.3502.37
  %12 = tail call double @llvm.fma.f64(double %add.1033.35, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #5
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #5
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %add.1033.35)
  %16 = tail call double @llvm.fma.f64(double %14, double 0xBC7ABC9E3B39803F, double %15)
  %17 = tail call double @llvm.fma.f64(double %16, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %18 = tail call double @llvm.fma.f64(double %17, double %16, double 0x3EC71DEE62401315)
  %19 = tail call double @llvm.fma.f64(double %18, double %16, double 0x3EFA01997C89EB71)
  %20 = tail call double @llvm.fma.f64(double %19, double %16, double 0x3F2A01A014761F65)
  %21 = tail call double @llvm.fma.f64(double %20, double %16, double 0x3F56C16C1852B7AF)
  %22 = tail call double @llvm.fma.f64(double %21, double %16, double 0x3F81111111122322)
  %23 = tail call double @llvm.fma.f64(double %22, double %16, double 0x3FA55555555502A1)
  %24 = tail call double @llvm.fma.f64(double %23, double %16, double 0x3FC5555555555511)
  %25 = tail call double @llvm.fma.f64(double %24, double %16, double 0x3FE000000000000B)
  %26 = tail call double @llvm.fma.f64(double %25, double %16, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %16, double 1.000000e+00)
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #5
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #5
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.35) #5
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #5
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2096.1.in_bounds-true
  %37 = fcmp olt double %add.1033.35, 0.000000e+00
  %38 = fadd double %add.1033.35, 0x7FF0000000000000
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #5
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #5
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2096.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %dynamic-update-slice.2096.1.in_bounds-true ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3503.49 = fmul double %param_6.6237, %z.2.i
  %compare.375.29 = fcmp ogt double %multiply.3503.49, 1.000000e-128
  %50 = getelementptr double, ptr addrspace(1) %arg1038, i64 %linear_index
  %param_10.24311 = load double, ptr addrspace(1) %50, align 8, !invariant.load !194
  %51 = getelementptr double, ptr addrspace(1) %arg1140, i64 %linear_index
  %param_11.21112 = load double, ptr addrspace(1) %51, align 8, !invariant.load !194
  %multiply.3510.17 = fmul double %param_9.2969, %param_11.21112
  %add.1036.15 = fadd double %param_10.24311, %multiply.3510.17
  %multiply.3511.13 = fmul double %z.2.i, %add.1036.15
  %multiply.3512.11 = fmul double %param_6.6237, %multiply.3511.13
  %52 = select i1 %compare.375.29, double %multiply.3512.11, double 0.000000e+00
  %53 = fmul double %param_2.13395, %param_1.15986
  %add.1037.3 = fsub double %52, %53
  %param_4.971 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg426, i64 0, i64 %.zext17
  %param_4.97113 = load double, ptr addrspace(1) %param_4.971, align 8, !invariant.load !194
  %param_5.855 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg528, i64 0, i64 %.zext17
  %param_5.85514 = load double, ptr addrspace(1) %param_5.855, align 8, !invariant.load !194
  %54 = select i1 %compare.375.29, double %multiply.3503.49, double %param_5.85514
  %add.1034.6 = fadd double %param_4.97113, %54
  %multiply.3513.6 = fmul double %add.1034.6, %add.1034.6
  %multiply.3606.5 = fmul double %add.1034.6, %multiply.3513.6
  %divide.883.3 = fdiv double 1.000000e+00, %multiply.3606.5
  %multiply.3607.3 = fmul double %divide.883.3, -2.000000e+00
  %multiply.3608.1 = fmul double %add.1037.3, %multiply.3607.3
  %55 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg018, i64 0, i64 %10, i64 %.zext, i64 %.zext17
  store double %multiply.3608.1, ptr addrspace(1) %55, align 8
  br label %dynamic-update-slice.2096.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_32(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #2 {
entry:
  %arg625 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index10 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index10, 2400
  br i1 %3, label %dynamic-update-slice.2093.1.in_bounds-true, label %dynamic-update-slice.2093.1.in_bounds-after

dynamic-update-slice.2093.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2093.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index10 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index10 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext12 = zext nneg i16 %.decomposed to i64
  %param_4.916 = load i64, ptr addrspace(1) %arg421, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_4.916, 0
  %7 = add i64 %param_4.916, 192
  %8 = select i1 %6, i64 %7, i64 %param_4.916
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg115, i64 %linear_index
  %param_1.15465 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_3.1122 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg319, i64 0, i64 %.zext12, i64 0
  %param_3.11226 = load double, ptr addrspace(1) %param_3.1122, align 8, !invariant.load !194
  %12 = getelementptr double, ptr addrspace(1) %arg217, i64 %linear_index
  %param_2.12877 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %multiply.3510.7 = fmul double %param_3.11226, %param_2.12877
  %add.1036.5 = fadd double %param_1.15465, %multiply.3510.7
  %param_5.810 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg523, i64 0, i64 %.zext12
  %param_5.8108 = load double, ptr addrspace(1) %param_5.810, align 8, !invariant.load !194
  %param_6.586 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg625, i64 0, i64 %.zext12
  %param_6.5869 = load double, ptr addrspace(1) %param_6.586, align 8, !invariant.load !194
  %multiply.3502.15 = fmul double %param_3.11226, %param_6.5869
  %add.1033.13 = fadd double %param_5.8108, %multiply.3502.15
  %13 = tail call double @llvm.fma.f64(double %add.1033.13, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %14 = tail call i32 @llvm.nvvm.d2i.lo(double %13) #5
  %15 = tail call double @llvm.nvvm.add.rn.d(double %13, double 0xC338000000000000) #5
  %16 = tail call double @llvm.fma.f64(double %15, double 0xBFE62E42FEFA39EF, double %add.1033.13)
  %17 = tail call double @llvm.fma.f64(double %15, double 0xBC7ABC9E3B39803F, double %16)
  %18 = tail call double @llvm.fma.f64(double %17, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %19 = tail call double @llvm.fma.f64(double %18, double %17, double 0x3EC71DEE62401315)
  %20 = tail call double @llvm.fma.f64(double %19, double %17, double 0x3EFA01997C89EB71)
  %21 = tail call double @llvm.fma.f64(double %20, double %17, double 0x3F2A01A014761F65)
  %22 = tail call double @llvm.fma.f64(double %21, double %17, double 0x3F56C16C1852B7AF)
  %23 = tail call double @llvm.fma.f64(double %22, double %17, double 0x3F81111111122322)
  %24 = tail call double @llvm.fma.f64(double %23, double %17, double 0x3FA55555555502A1)
  %25 = tail call double @llvm.fma.f64(double %24, double %17, double 0x3FC5555555555511)
  %26 = tail call double @llvm.fma.f64(double %25, double %17, double 0x3FE000000000000B)
  %27 = tail call double @llvm.fma.f64(double %26, double %17, double 1.000000e+00)
  %28 = tail call double @llvm.fma.f64(double %27, double %17, double 1.000000e+00)
  %29 = tail call i32 @llvm.nvvm.d2i.lo(double %28) #5
  %30 = tail call i32 @llvm.nvvm.d2i.hi(double %28) #5
  %31 = shl i32 %14, 20
  %32 = add i32 %30, %31
  %33 = tail call double @llvm.nvvm.lohi.i2d(i32 %29, i32 %32) #5
  %34 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.13) #5
  %35 = bitcast i32 %34 to float
  %36 = tail call float @llvm.nvvm.fabs.f(float %35) #5
  %37 = fcmp olt float %36, 0x4010C46560000000
  br i1 %37, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2093.1.in_bounds-true
  %38 = fcmp olt double %add.1033.13, 0.000000e+00
  %39 = fadd double %add.1033.13, 0x7FF0000000000000
  %z.0.i = select i1 %38, double 0.000000e+00, double %39
  %40 = fcmp olt float %36, 0x4010E90000000000
  br i1 %40, label %41, label %__nv_exp.exit

41:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %42 = sdiv i32 %14, 2
  %43 = shl i32 %42, 20
  %44 = add i32 %30, %43
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 %29, i32 %44) #5
  %46 = sub nsw i32 %14, %42
  %47 = shl i32 %46, 20
  %48 = add nsw i32 %47, 1072693248
  %49 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %48) #5
  %50 = fmul double %49, %45
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2093.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %41
  %z.2.i = phi double [ %33, %dynamic-update-slice.2093.1.in_bounds-true ], [ %50, %41 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3511.3 = fmul double %add.1036.5, %z.2.i
  %51 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %10, i64 %.zext, i64 %.zext12
  store double %multiply.3511.3, ptr addrspace(1) %51, align 8
  br label %dynamic-update-slice.2093.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_30(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7) local_unnamed_addr #2 {
entry:
  %arg728 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index11 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index11, 2400
  br i1 %3, label %dynamic-update-slice.2095.1.in_bounds-true, label %dynamic-update-slice.2095.1.in_bounds-after

dynamic-update-slice.2095.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2095.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index11 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index11 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext13 = zext nneg i16 %.decomposed to i64
  %param_1.1514 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_1.1514, 0
  %7 = add i64 %param_1.1514, 192
  %8 = select i1 %6, i64 %7, i64 %param_1.1514
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_5.8545 = load double, ptr addrspace(1) %arg524, align 128, !invariant.load !194
  %param_6.622 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg626, i64 0, i64 %.zext13
  %param_6.6226 = load double, ptr addrspace(1) %param_6.622, align 8, !invariant.load !194
  %param_4.970 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg422, i64 0, i64 %.zext13, i64 0
  %param_4.9707 = load double, ptr addrspace(1) %param_4.970, align 8, !invariant.load !194
  %param_7.470 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg728, i64 0, i64 %.zext13
  %param_7.4708 = load double, ptr addrspace(1) %param_7.470, align 8, !invariant.load !194
  %multiply.3502.35 = fmul double %param_4.9707, %param_7.4708
  %add.1033.33 = fadd double %param_6.6226, %multiply.3502.35
  %11 = tail call double @llvm.fma.f64(double %add.1033.33, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #5
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #5
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %add.1033.33)
  %15 = tail call double @llvm.fma.f64(double %13, double 0xBC7ABC9E3B39803F, double %14)
  %16 = tail call double @llvm.fma.f64(double %15, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %17 = tail call double @llvm.fma.f64(double %16, double %15, double 0x3EC71DEE62401315)
  %18 = tail call double @llvm.fma.f64(double %17, double %15, double 0x3EFA01997C89EB71)
  %19 = tail call double @llvm.fma.f64(double %18, double %15, double 0x3F2A01A014761F65)
  %20 = tail call double @llvm.fma.f64(double %19, double %15, double 0x3F56C16C1852B7AF)
  %21 = tail call double @llvm.fma.f64(double %20, double %15, double 0x3F81111111122322)
  %22 = tail call double @llvm.fma.f64(double %21, double %15, double 0x3FA55555555502A1)
  %23 = tail call double @llvm.fma.f64(double %22, double %15, double 0x3FC5555555555511)
  %24 = tail call double @llvm.fma.f64(double %23, double %15, double 0x3FE000000000000B)
  %25 = tail call double @llvm.fma.f64(double %24, double %15, double 1.000000e+00)
  %26 = tail call double @llvm.fma.f64(double %25, double %15, double 1.000000e+00)
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #5
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #5
  %29 = shl i32 %12, 20
  %30 = add i32 %28, %29
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %30) #5
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.33) #5
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #5
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2095.1.in_bounds-true
  %36 = fcmp olt double %add.1033.33, 0.000000e+00
  %37 = fadd double %add.1033.33, 0x7FF0000000000000
  %z.0.i = select i1 %36, double 0.000000e+00, double %37
  %38 = fcmp olt float %34, 0x4010E90000000000
  br i1 %38, label %39, label %__nv_exp.exit

39:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %40 = sdiv i32 %12, 2
  %41 = shl i32 %40, 20
  %42 = add i32 %28, %41
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %42) #5
  %44 = sub nsw i32 %12, %40
  %45 = shl i32 %44, 20
  %46 = add nsw i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %46) #5
  %48 = fmul double %47, %43
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2095.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %39
  %z.2.i = phi double [ %31, %dynamic-update-slice.2095.1.in_bounds-true ], [ %48, %39 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3503.47 = fmul double %param_5.8545, %z.2.i
  %compare.375.27 = fcmp ogt double %multiply.3503.47, 1.000000e-128
  %49 = getelementptr double, ptr addrspace(1) %arg218, i64 %linear_index
  %param_2.13719 = load double, ptr addrspace(1) %49, align 8, !invariant.load !194
  %50 = getelementptr double, ptr addrspace(1) %arg320, i64 %linear_index
  %param_3.118810 = load double, ptr addrspace(1) %50, align 8, !invariant.load !194
  %multiply.3510.15 = fmul double %param_4.9707, %param_3.118810
  %add.1036.13 = fadd double %param_2.13719, %multiply.3510.15
  %multiply.3511.11 = fmul double %z.2.i, %add.1036.13
  %multiply.3512.9 = fmul double %param_5.8545, %multiply.3511.11
  %51 = select i1 %compare.375.27, double %multiply.3512.9, double 0.000000e+00
  %52 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg014, i64 0, i64 %10, i64 %.zext, i64 %.zext13
  store double %51, ptr addrspace(1) %52, align 8
  br label %dynamic-update-slice.2095.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_98(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index6 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index6, 2400
  br i1 %3, label %dynamic-update-slice.2113.1.in_bounds-true, label %dynamic-update-slice.2113.1.in_bounds-after

dynamic-update-slice.2113.1.in_bounds-after:      ; preds = %dynamic-update-slice.2113.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2113.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index6 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index6 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext8 = zext nneg i16 %.decomposed to i64
  %param_2.1318 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1318, 0
  %7 = add i64 %param_2.1318, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1318
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg111, i64 %linear_index
  %param_1.15775 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %12 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %10, i64 %.zext, i64 %.zext8
  store double %param_1.15775, ptr addrspace(1) %12, align 8
  br label %dynamic-update-slice.2113.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_and_compare_divide_multiply_select_fusion(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg8, ptr noalias nocapture align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg10, ptr noalias nocapture align 128 dereferenceable(160) %arg11, ptr noalias nocapture align 128 dereferenceable(160) %arg12, ptr noalias nocapture align 128 dereferenceable(160) %arg13, ptr noalias nocapture align 128 dereferenceable(160) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg21, ptr noalias nocapture align 128 dereferenceable(160) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg25, ptr noalias nocapture align 128 dereferenceable(160) %arg26, ptr noalias nocapture align 128 dereferenceable(160) %arg27, ptr noalias nocapture align 128 dereferenceable(160) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg29, ptr noalias nocapture align 128 dereferenceable(80) %arg30, ptr noalias nocapture align 128 dereferenceable(160) %arg31, ptr noalias nocapture align 128 dereferenceable(160) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg33, ptr noalias nocapture align 128 dereferenceable(160) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg35, ptr noalias nocapture align 128 dereferenceable(160) %arg36, ptr noalias nocapture align 128 dereferenceable(160) %arg37, ptr noalias nocapture align 128 dereferenceable(160) %arg38, ptr noalias nocapture align 128 dereferenceable(160) %arg39, ptr noalias nocapture align 128 dereferenceable(160) %arg40, ptr noalias nocapture align 128 dereferenceable(160) %arg41, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg45, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg46, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg47, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg48, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg49, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg50, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg51, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg52, ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg53, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg54, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg55, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg56) local_unnamed_addr #2 {
entry:
  %arg56120 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55118 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54116 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53114 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52112 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51110 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50108 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49106 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48104 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47102 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46100 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg4598 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg4496 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg4394 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg4292 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg4190 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg4088 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg3986 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg3884 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg3782 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg3680 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3578 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg3476 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3374 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg3272 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg3170 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3068 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2966 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2864 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2762 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2660 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2558 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2456 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2354 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2252 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2150 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1946 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1742 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1538 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1436 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1334 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1232 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1130 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg926 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg722 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg1946, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %4 = getelementptr double, ptr addrspace(1) %arg2048, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !194
  %6 = load double, ptr addrspace(1) %arg314, align 128, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg1844, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %9 = getelementptr double, ptr addrspace(1) %arg4292, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !194
  %11 = getelementptr double, ptr addrspace(1) %arg3578, i64 %1
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %13 = getelementptr double, ptr addrspace(1) %arg2150, i64 %1
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !194
  %15 = load i64, ptr addrspace(1) %arg1742, align 128, !invariant.load !194
  %16 = icmp slt i64 %15, 0
  %17 = add i64 %15, 192
  %18 = select i1 %16, i64 %17, i64 %15
  %19 = trunc i64 %18 to i32
  %20 = tail call i32 @llvm.smax.i32(i32 %19, i32 0)
  %21 = tail call i32 @llvm.umin.i32(i32 %20, i32 191)
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr addrspace(1) %arg2966, i64 0, i64 %22, i64 %1, i64 0
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !194
  %25 = getelementptr double, ptr addrspace(1) %arg3374, i64 %1
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !194
  %27 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg1640, i64 0, i64 %22
  %28 = load i32, ptr addrspace(1) %27, align 4, !invariant.load !194
  %29 = getelementptr i64, ptr addrspace(1) %arg416, i64 %1
  %30 = load i64, ptr addrspace(1) %29, align 8, !invariant.load !194
  %31 = getelementptr double, ptr addrspace(1) %arg08, i64 %1
  %32 = load double, ptr addrspace(1) %31, align 8
  %33 = getelementptr double, ptr addrspace(1) %arg212, i64 %1
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !194
  %35 = tail call double @llvm.fma.f64(double %34, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %36 = tail call i32 @llvm.nvvm.d2i.lo(double %35) #5
  %37 = tail call double @llvm.nvvm.add.rn.d(double %35, double 0xC338000000000000) #5
  %38 = tail call double @llvm.fma.f64(double %37, double 0xBFE62E42FEFA39EF, double %34)
  %39 = tail call double @llvm.fma.f64(double %37, double 0xBC7ABC9E3B39803F, double %38)
  %40 = tail call double @llvm.fma.f64(double %39, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %41 = tail call double @llvm.fma.f64(double %40, double %39, double 0x3EC71DEE62401315)
  %42 = tail call double @llvm.fma.f64(double %41, double %39, double 0x3EFA01997C89EB71)
  %43 = tail call double @llvm.fma.f64(double %42, double %39, double 0x3F2A01A014761F65)
  %44 = tail call double @llvm.fma.f64(double %43, double %39, double 0x3F56C16C1852B7AF)
  %45 = tail call double @llvm.fma.f64(double %44, double %39, double 0x3F81111111122322)
  %46 = tail call double @llvm.fma.f64(double %45, double %39, double 0x3FA55555555502A1)
  %47 = tail call double @llvm.fma.f64(double %46, double %39, double 0x3FC5555555555511)
  %48 = tail call double @llvm.fma.f64(double %47, double %39, double 0x3FE000000000000B)
  %49 = tail call double @llvm.fma.f64(double %48, double %39, double 1.000000e+00)
  %50 = tail call double @llvm.fma.f64(double %49, double %39, double 1.000000e+00)
  %51 = tail call i32 @llvm.nvvm.d2i.lo(double %50) #5
  %52 = tail call i32 @llvm.nvvm.d2i.hi(double %50) #5
  %53 = shl i32 %36, 20
  %54 = add i32 %52, %53
  %55 = tail call double @llvm.nvvm.lohi.i2d(i32 %51, i32 %54) #5
  %56 = tail call i32 @llvm.nvvm.d2i.hi(double %34) #5
  %57 = bitcast i32 %56 to float
  %58 = tail call float @llvm.nvvm.fabs.f(float %57) #5
  %59 = fcmp olt float %58, 0x4010C46560000000
  br i1 %59, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %60 = fcmp olt double %34, 0.000000e+00
  %61 = fadd double %34, 0x7FF0000000000000
  %z.0.i = select i1 %60, double 0.000000e+00, double %61
  %62 = fcmp olt float %58, 0x4010E90000000000
  br i1 %62, label %63, label %__nv_exp.exit

63:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %64 = sdiv i32 %36, 2
  %65 = shl i32 %64, 20
  %66 = add i32 %52, %65
  %67 = tail call double @llvm.nvvm.lohi.i2d(i32 %51, i32 %66) #5
  %68 = sub nsw i32 %36, %64
  %69 = shl i32 %68, 20
  %70 = add nsw i32 %69, 1072693248
  %71 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %70) #5
  %72 = fmul double %71, %67
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %63
  %z.2.i = phi double [ %55, %entry ], [ %72, %63 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %73 = getelementptr double, ptr addrspace(1) %arg1028, i64 %1
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !194
  %75 = getelementptr double, ptr addrspace(1) %arg518, i64 %1
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !194
  %77 = getelementptr double, ptr addrspace(1) %arg2456, i64 %1
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !194
  %79 = getelementptr double, ptr addrspace(1) %arg2558, i64 %1
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !194
  %81 = getelementptr double, ptr addrspace(1) %arg620, i64 %1
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !194
  %multiply.3502.17.clone.1 = fmul double %80, %82
  %add.1033.15.clone.1 = fadd double %78, %multiply.3502.17.clone.1
  %83 = tail call double @llvm.fma.f64(double %add.1033.15.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %84 = tail call i32 @llvm.nvvm.d2i.lo(double %83) #5
  %85 = tail call double @llvm.nvvm.add.rn.d(double %83, double 0xC338000000000000) #5
  %86 = tail call double @llvm.fma.f64(double %85, double 0xBFE62E42FEFA39EF, double %add.1033.15.clone.1)
  %87 = tail call double @llvm.fma.f64(double %85, double 0xBC7ABC9E3B39803F, double %86)
  %88 = tail call double @llvm.fma.f64(double %87, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %89 = tail call double @llvm.fma.f64(double %88, double %87, double 0x3EC71DEE62401315)
  %90 = tail call double @llvm.fma.f64(double %89, double %87, double 0x3EFA01997C89EB71)
  %91 = tail call double @llvm.fma.f64(double %90, double %87, double 0x3F2A01A014761F65)
  %92 = tail call double @llvm.fma.f64(double %91, double %87, double 0x3F56C16C1852B7AF)
  %93 = tail call double @llvm.fma.f64(double %92, double %87, double 0x3F81111111122322)
  %94 = tail call double @llvm.fma.f64(double %93, double %87, double 0x3FA55555555502A1)
  %95 = tail call double @llvm.fma.f64(double %94, double %87, double 0x3FC5555555555511)
  %96 = tail call double @llvm.fma.f64(double %95, double %87, double 0x3FE000000000000B)
  %97 = tail call double @llvm.fma.f64(double %96, double %87, double 1.000000e+00)
  %98 = tail call double @llvm.fma.f64(double %97, double %87, double 1.000000e+00)
  %99 = tail call i32 @llvm.nvvm.d2i.lo(double %98) #5
  %100 = tail call i32 @llvm.nvvm.d2i.hi(double %98) #5
  %101 = shl i32 %84, 20
  %102 = add i32 %100, %101
  %103 = tail call double @llvm.nvvm.lohi.i2d(i32 %99, i32 %102) #5
  %104 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.15.clone.1) #5
  %105 = bitcast i32 %104 to float
  %106 = tail call float @llvm.nvvm.fabs.f(float %105) #5
  %107 = fcmp olt float %106, 0x4010C46560000000
  br i1 %107, label %__nv_exp.exit7, label %__internal_fast_icmp_abs_lt.exit.i4

__internal_fast_icmp_abs_lt.exit.i4:              ; preds = %__nv_exp.exit
  %108 = fcmp olt double %add.1033.15.clone.1, 0.000000e+00
  %109 = fadd double %add.1033.15.clone.1, 0x7FF0000000000000
  %z.0.i5 = select i1 %108, double 0.000000e+00, double %109
  %110 = fcmp olt float %106, 0x4010E90000000000
  br i1 %110, label %111, label %__nv_exp.exit7

111:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i4
  %112 = sdiv i32 %84, 2
  %113 = shl i32 %112, 20
  %114 = add i32 %100, %113
  %115 = tail call double @llvm.nvvm.lohi.i2d(i32 %99, i32 %114) #5
  %116 = sub nsw i32 %84, %112
  %117 = shl i32 %116, 20
  %118 = add nsw i32 %117, 1072693248
  %119 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %118) #5
  %120 = fmul double %119, %115
  br label %__nv_exp.exit7

__nv_exp.exit7:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i4, %111
  %z.2.i6 = phi double [ %103, %__nv_exp.exit ], [ %120, %111 ], [ %z.0.i5, %__internal_fast_icmp_abs_lt.exit.i4 ]
  %divide.866.1.clone.1 = fdiv double 1.000000e+00, %32
  %multiply.3524.11 = fmul double %6, %z.2.i
  %compare.377.5.clone.1 = fcmp ogt double %multiply.3524.11, 1.000000e-128
  %121 = select i1 %compare.377.5.clone.1, double %multiply.3524.11, double %74
  %add.1042.2.clone.1 = fadd double %divide.866.1.clone.1, %121
  %divide.867.1.clone.1 = fdiv double 1.000000e+00, %add.1042.2.clone.1
  %add.1044.2 = fadd double %divide.866.1.clone.1, %multiply.3524.11
  %divide.869.3 = fdiv double 1.000000e+00, %add.1044.2
  %122 = icmp ne i64 %30, 0
  %123 = zext i1 %122 to i8
  %multiply.3498.11.clone.1 = fmul double %3, %5
  %multiply.3499.13.clone.1 = fmul double %6, %8
  %add.1031.11.clone.1 = fadd double %multiply.3498.11.clone.1, %multiply.3499.13.clone.1
  %multiply.3501.5.clone.1 = fmul double %10, %12
  %divide.862.1.clone.1 = fdiv double %multiply.3501.5.clone.1, %14
  %subtract.146.7.clone.1 = fsub double %24, %26
  %124 = sitofp i32 %28 to double
  %multiply.3515.5.clone.1 = fmul double %subtract.146.7.clone.1, %124
  %divide.863.1.clone.1 = fdiv double %multiply.3515.5.clone.1, %12
  %multiply.3516.9.clone.1 = fmul double %divide.863.1.clone.1, %124
  %multiply.3517.3.clone.1 = fmul double %divide.862.1.clone.1, %multiply.3516.9.clone.1
  %add.1038.3.clone.1 = fadd double %add.1031.11.clone.1, %multiply.3517.3.clone.1
  %125 = tail call double @llvm.fabs.f64(double %add.1038.3.clone.1)
  %126 = call i1 @llvm.is.fpclass.f64(double %add.1038.3.clone.1, i32 504)
  %compare.376.3.clone.1 = fcmp olt double %125, 1.400000e+01
  %127 = and i1 %126, %compare.376.3.clone.1
  %128 = zext i1 %127 to i8
  %multiply.3503.27.clone.1 = fmul double %6, %z.2.i6
  %compare.375.9.clone.1 = fcmp ogt double %multiply.3503.27.clone.1, 1.000000e-128
  %129 = getelementptr double, ptr addrspace(1) %arg2354, i64 %1
  %130 = load double, ptr addrspace(1) %129, align 8, !invariant.load !194
  %131 = select i1 %compare.375.9.clone.1, double %multiply.3503.27.clone.1, double %130
  %132 = getelementptr double, ptr addrspace(1) %arg1538, i64 %1
  %133 = load double, ptr addrspace(1) %132, align 8, !invariant.load !194
  %multiply.3518.1.clone.1 = fmul double %133, %131
  %multiply.3525.35 = fmul double %76, %multiply.3518.1.clone.1
  %multiply.3530.36 = fmul double %multiply.3525.35, %multiply.3525.35
  %multiply.3531.17 = fmul double %multiply.3530.36, 5.000000e-01
  %134 = getelementptr double, ptr addrspace(1) %arg2252, i64 %1
  %135 = load double, ptr addrspace(1) %134, align 8
  %add.1034.3.clone.1 = fadd double %135, %131
  %multiply.3519.1.clone.1 = fmul double %14, %add.1034.3.clone.1
  %divide.864.3.clone.1 = fdiv double 1.000000e+00, %multiply.3519.1.clone.1
  %subtract.147.11.clone.1 = fsub double %add.1038.3.clone.1, %add.1031.11.clone.1
  %multiply.3520.2.clone.1 = fmul double %subtract.147.11.clone.1, %subtract.147.11.clone.1
  %multiply.3521.1.clone.1 = fmul double %multiply.3520.2.clone.1, %133
  %add.1039.3.clone.1 = fadd double %multiply.3521.1.clone.1, %divide.864.3.clone.1
  %add.1040.1.clone.1 = fadd double %add.1039.3.clone.1, -1.000000e+00
  %multiply.3532.17 = fmul double %multiply.3530.36, %add.1040.1.clone.1
  %add.1045.15 = fadd double %multiply.3531.17, %multiply.3532.17
  %multiply.3533.25 = fmul double %76, %76
  %multiply.3534.23 = fmul double %multiply.3533.25, 5.000000e-01
  %multiply.3535.13 = fmul double %multiply.3534.23, %multiply.3518.1.clone.1
  %multiply.3536.13 = fmul double %multiply.3535.13, %add.1040.1.clone.1
  %subtract.148.13 = fsub double %add.1045.15, %multiply.3536.13
  %136 = sitofp i64 %30 to double
  %multiply.3537.11 = fmul double %subtract.148.13, %136
  %add.1046.9 = fadd double %divide.867.1.clone.1, %multiply.3537.11
  %compare.380.5 = fcmp ogt double %add.1046.9, 1.000000e-128
  %137 = getelementptr double, ptr addrspace(1) %arg110, i64 %1
  %138 = load double, ptr addrspace(1) %137, align 8, !invariant.load !194
  %139 = select i1 %compare.380.5, double %add.1046.9, double %138
  %140 = select i1 %122, double %139, double %divide.869.3
  %141 = select i1 %127, double %140, double %32
  %142 = getelementptr double, ptr addrspace(1) %arg824, i64 %1
  %143 = load double, ptr addrspace(1) %142, align 8, !invariant.load !194
  %multiply.3522.3.clone.1 = fmul double %82, %143
  %144 = getelementptr double, ptr addrspace(1) %arg722, i64 %1
  %145 = load double, ptr addrspace(1) %144, align 8, !invariant.load !194
  %multiply.3523.5.clone.1 = fmul double %6, %145
  %add.1041.3.clone.1 = fadd double %multiply.3522.3.clone.1, %multiply.3523.5.clone.1
  %multiply.3526.2.clone.1 = fmul double %multiply.3525.35, %add.1040.1.clone.1
  %multiply.3527.15.clone.1 = fmul double %divide.867.1.clone.1, 2.000000e+00
  %divide.868.5.clone.1 = fdiv double 1.000000e+00, %multiply.3527.15.clone.1
  %multiply.3528.1.clone.1 = fmul double %divide.868.5.clone.1, %multiply.3526.2.clone.1
  %multiply.3529.1.clone.1 = fmul double %multiply.3528.1.clone.1, %136
  %add.1043.1.clone.1 = fadd double %add.1041.3.clone.1, %multiply.3529.1.clone.1
  %146 = select i1 %127, double %add.1043.1.clone.1, double %82
  %multiply.3538.1.clone.1 = fmul double %121, %divide.867.1.clone.1
  %147 = getelementptr double, ptr addrspace(1) %arg926, i64 %1
  %148 = load double, ptr addrspace(1) %147, align 8
  %149 = select i1 %127, double %multiply.3538.1.clone.1, double %148
  %multiply.3571.2.clone.1 = fmul double %multiply.3527.15.clone.1, %multiply.3527.15.clone.1
  %divide.878.1.clone.1 = fdiv double 1.000000e+00, %multiply.3571.2.clone.1
  %150 = getelementptr double, ptr addrspace(1) %arg1130, i64 %1
  %151 = load double, ptr addrspace(1) %150, align 8
  %152 = select i1 %127, double %divide.867.1.clone.1, double %151
  %multiply.3563.2.clone.1 = fmul double %add.1042.2.clone.1, %add.1042.2.clone.1
  %divide.877.1.clone.1 = fdiv double 1.000000e+00, %multiply.3563.2.clone.1
  %153 = getelementptr double, ptr addrspace(1) %arg1232, i64 %1
  %154 = load double, ptr addrspace(1) %153, align 8
  %155 = select i1 %127, double %divide.866.1.clone.1, double %154
  %multiply.3559.4.clone.1 = fmul double %32, %32
  %multiply.3597.3.clone.1 = fmul double %32, %multiply.3559.4.clone.1
  %divide.880.1.clone.1 = fdiv double 1.000000e+00, %multiply.3597.3.clone.1
  %multiply.3598.1.clone.1 = fmul double %divide.880.1.clone.1, -2.000000e+00
  %divide.876.1.clone.1 = fdiv double 1.000000e+00, %multiply.3559.4.clone.1
  %156 = getelementptr double, ptr addrspace(1) %arg1334, i64 %1
  %157 = load double, ptr addrspace(1) %156, align 8
  %158 = select i1 %127, double %add.1041.3.clone.1, double %157
  %159 = getelementptr double, ptr addrspace(1) %arg1436, i64 %1
  %160 = load double, ptr addrspace(1) %159, align 8
  %161 = select i1 %127, double %add.1040.1.clone.1, double %160
  %162 = getelementptr double, ptr addrspace(1) %arg2660, i64 %1
  %163 = load double, ptr addrspace(1) %162, align 8
  %164 = select i1 %127, double %multiply.3518.1.clone.1, double %163
  %165 = getelementptr double, ptr addrspace(1) %arg2762, i64 %1
  %166 = load double, ptr addrspace(1) %165, align 8
  %167 = select i1 %127, double %6, double %166
  %168 = getelementptr double, ptr addrspace(1) %arg2864, i64 %1
  %169 = load double, ptr addrspace(1) %168, align 8
  %170 = select i1 %127, double %24, double %169
  %171 = getelementptr i32, ptr addrspace(1) %arg3068, i64 %1
  %172 = load i32, ptr addrspace(1) %171, align 4
  %173 = select i1 %127, i32 %28, i32 %172
  %174 = getelementptr double, ptr addrspace(1) %arg3170, i64 %1
  %175 = load double, ptr addrspace(1) %174, align 8
  %176 = select i1 %127, double %add.1031.11.clone.1, double %175
  %177 = select i1 %127, double %add.1038.3.clone.1, double %5
  %178 = getelementptr double, ptr addrspace(1) %arg3272, i64 %1
  %179 = load double, ptr addrspace(1) %178, align 8
  %180 = select i1 %127, double %subtract.147.11.clone.1, double %179
  %181 = getelementptr double, ptr addrspace(1) %arg3476, i64 %1
  %182 = load double, ptr addrspace(1) %181, align 8
  %183 = select i1 %127, double %26, double %182
  %184 = getelementptr double, ptr addrspace(1) %arg3680, i64 %1
  %185 = load double, ptr addrspace(1) %184, align 8
  %186 = select i1 %127, double %12, double %185
  %187 = getelementptr double, ptr addrspace(1) %arg3782, i64 %1
  %188 = load double, ptr addrspace(1) %187, align 8
  %189 = select i1 %127, double %12, double %188
  %190 = getelementptr double, ptr addrspace(1) %arg3884, i64 %1
  %191 = load double, ptr addrspace(1) %190, align 8
  %192 = select i1 %127, double %divide.863.1.clone.1, double %191
  %193 = getelementptr double, ptr addrspace(1) %arg3986, i64 %1
  %194 = load double, ptr addrspace(1) %193, align 8
  %195 = select i1 %127, double %133, double %194
  %196 = getelementptr double, ptr addrspace(1) %arg4088, i64 %1
  %197 = load double, ptr addrspace(1) %196, align 8
  %198 = select i1 %127, double %14, double %197
  %199 = getelementptr double, ptr addrspace(1) %arg4190, i64 %1
  %200 = load double, ptr addrspace(1) %199, align 8
  %201 = select i1 %127, double %135, double %200
  %multiply.3545.2.clone.1 = fmul double %14, %14
  %divide.874.1.clone.1 = fdiv double 1.000000e+00, %multiply.3545.2.clone.1
  store double %141, ptr addrspace(1) %31, align 8
  %202 = getelementptr i8, ptr addrspace(1) %arg4394, i64 %1
  store i8 %123, ptr addrspace(1) %202, align 1
  %203 = getelementptr double, ptr addrspace(1) %arg4496, i64 %1
  store double %146, ptr addrspace(1) %203, align 8
  store double %149, ptr addrspace(1) %147, align 8
  %204 = getelementptr double, ptr addrspace(1) %arg4598, i64 %1
  store double %divide.878.1.clone.1, ptr addrspace(1) %204, align 8
  store double %152, ptr addrspace(1) %150, align 8
  %205 = getelementptr double, ptr addrspace(1) %arg46100, i64 %1
  store double %divide.867.1.clone.1, ptr addrspace(1) %205, align 8
  %206 = getelementptr double, ptr addrspace(1) %arg47102, i64 %1
  store double %divide.877.1.clone.1, ptr addrspace(1) %206, align 8
  store double %155, ptr addrspace(1) %153, align 8
  %207 = getelementptr double, ptr addrspace(1) %arg48104, i64 %1
  store double %divide.866.1.clone.1, ptr addrspace(1) %207, align 8
  %208 = getelementptr double, ptr addrspace(1) %arg49106, i64 %1
  store double %multiply.3598.1.clone.1, ptr addrspace(1) %208, align 8
  %209 = getelementptr double, ptr addrspace(1) %arg50108, i64 %1
  store double %divide.876.1.clone.1, ptr addrspace(1) %209, align 8
  store double %158, ptr addrspace(1) %156, align 8
  store double %161, ptr addrspace(1) %159, align 8
  store double %add.1040.1.clone.1, ptr addrspace(1) %134, align 8
  store double %164, ptr addrspace(1) %162, align 8
  %210 = getelementptr double, ptr addrspace(1) %arg51110, i64 %1
  store double %multiply.3518.1.clone.1, ptr addrspace(1) %210, align 8
  store double %167, ptr addrspace(1) %165, align 8
  store double %170, ptr addrspace(1) %168, align 8
  store i32 %173, ptr addrspace(1) %171, align 4
  store double %176, ptr addrspace(1) %174, align 8
  %211 = getelementptr double, ptr addrspace(1) %arg52112, i64 %1
  store double %177, ptr addrspace(1) %211, align 8
  store double %180, ptr addrspace(1) %178, align 8
  store double %183, ptr addrspace(1) %181, align 8
  store double %186, ptr addrspace(1) %184, align 8
  store double %189, ptr addrspace(1) %187, align 8
  store double %192, ptr addrspace(1) %190, align 8
  store double %195, ptr addrspace(1) %193, align 8
  store double %198, ptr addrspace(1) %196, align 8
  store double %201, ptr addrspace(1) %199, align 8
  %212 = getelementptr i8, ptr addrspace(1) %arg53114, i64 %1
  store i8 %128, ptr addrspace(1) %212, align 1
  %213 = getelementptr double, ptr addrspace(1) %arg54116, i64 %1
  store double %divide.863.1.clone.1, ptr addrspace(1) %213, align 8
  %214 = getelementptr double, ptr addrspace(1) %arg55118, i64 %1
  store double %divide.862.1.clone.1, ptr addrspace(1) %214, align 8
  %215 = getelementptr double, ptr addrspace(1) %arg56120, i64 %1
  store double %divide.874.1.clone.1, ptr addrspace(1) %215, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_40(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1343 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1343, 0
  %2 = add i64 %param_2.1343, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1343
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.16025 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !194
  %7 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %param_1.16025, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6) local_unnamed_addr #2 {
entry:
  %arg625 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1587 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1587, 0
  %2 = add i64 %param_1.1587, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1587
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.13564 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg625, i64 %thread_id_x
  %param_6.6385 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %8 = getelementptr double, ptr addrspace(1) %arg523, i64 %thread_id_x
  %param_5.8326 = load double, ptr addrspace(1) %8, align 8, !invariant.load !194
  %multiply.3525.37 = fmul double %param_6.6385, %param_5.8326
  %multiply.3530.40 = fmul double %multiply.3525.37, %multiply.3525.37
  %multiply.3531.19 = fmul double %multiply.3530.40, 5.000000e-01
  %9 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.9467 = load double, ptr addrspace(1) %9, align 8, !invariant.load !194
  %multiply.3532.19 = fmul double %param_4.9467, %multiply.3530.40
  %add.1045.17 = fadd double %multiply.3531.19, %multiply.3532.19
  %multiply.3533.27 = fmul double %param_6.6385, %param_6.6385
  %multiply.3534.25 = fmul double %multiply.3533.27, 5.000000e-01
  %multiply.3535.15 = fmul double %param_5.8326, %multiply.3534.25
  %multiply.3536.15 = fmul double %param_4.9467, %multiply.3535.15
  %subtract.148.15 = fsub double %add.1045.17, %multiply.3536.15
  %10 = getelementptr i64, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.116812 = load i64, ptr addrspace(1) %10, align 8, !invariant.load !194
  %11 = sitofp i64 %param_3.116812 to double
  %multiply.3537.13 = fmul double %subtract.148.15, %11
  %add.1046.11 = fadd double %param_2.13564, %multiply.3537.13
  %compare.380.7 = fcmp ogt double %add.1046.11, 1.000000e-128
  %12 = zext i1 %compare.380.7 to i8
  %13 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_49(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1558 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1558, 0
  %2 = add i64 %param_1.1558, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1558
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.13814 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !194
  %7 = icmp eq i8 %param_2.13814, 1
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_48(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1542 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1542, 0
  %2 = add i64 %param_1.1542, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1542
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13805 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !194
  %7 = icmp eq i8 %param_2.13805, 1
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_52(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1513 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1513, 0
  %2 = add i64 %param_1.1513, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1513
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.13834 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !194
  %7 = icmp eq i8 %param_2.13834, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_51(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1592 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1592, 0
  %2 = add i64 %param_1.1592, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1592
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13825 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !194
  %7 = icmp eq i8 %param_2.13825, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_53(ptr noalias nocapture writeonly align 128 dereferenceable(15360) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1251 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1251, 0
  %2 = add i64 %param_2.1251, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1251
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15104 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !194
  %7 = zext i8 %param_1.15104 to i32
  %8 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i32 %7, ptr addrspace(1) %8, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1532 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !194
  %1 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12734 = load double, ptr addrspace(1) %1, align 8, !invariant.load !194
  %param_4.9095 = load double, ptr addrspace(1) %arg415, align 128, !invariant.load !194
  %2 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.11146 = load double, ptr addrspace(1) %2, align 8, !invariant.load !194
  %3 = tail call double @llvm.fma.f64(double %param_3.11146, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #5
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #5
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %param_3.11146)
  %7 = tail call double @llvm.fma.f64(double %5, double 0xBC7ABC9E3B39803F, double %6)
  %8 = tail call double @llvm.fma.f64(double %7, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %9 = tail call double @llvm.fma.f64(double %8, double %7, double 0x3EC71DEE62401315)
  %10 = tail call double @llvm.fma.f64(double %9, double %7, double 0x3EFA01997C89EB71)
  %11 = tail call double @llvm.fma.f64(double %10, double %7, double 0x3F2A01A014761F65)
  %12 = tail call double @llvm.fma.f64(double %11, double %7, double 0x3F56C16C1852B7AF)
  %13 = tail call double @llvm.fma.f64(double %12, double %7, double 0x3F81111111122322)
  %14 = tail call double @llvm.fma.f64(double %13, double %7, double 0x3FA55555555502A1)
  %15 = tail call double @llvm.fma.f64(double %14, double %7, double 0x3FC5555555555511)
  %16 = tail call double @llvm.fma.f64(double %15, double %7, double 0x3FE000000000000B)
  %17 = tail call double @llvm.fma.f64(double %16, double %7, double 1.000000e+00)
  %18 = tail call double @llvm.fma.f64(double %17, double %7, double 1.000000e+00)
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #5
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #5
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #5
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %param_3.11146) #5
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #5
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %param_3.11146, 0.000000e+00
  %29 = fadd double %param_3.11146, 0x7FF0000000000000
  %z.0.i = select i1 %28, double 0.000000e+00, double %29
  %30 = fcmp olt float %26, 0x4010E90000000000
  br i1 %30, label %31, label %__nv_exp.exit

31:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %32 = sdiv i32 %4, 2
  %33 = shl i32 %32, 20
  %34 = add i32 %20, %33
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #5
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #5
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %41 = icmp slt i64 %param_1.1532, 0
  %42 = add i64 %param_1.1532, 192
  %43 = select i1 %41, i64 %42, i64 %param_1.1532
  %44 = tail call i64 @llvm.smax.i64(i64 %43, i64 0)
  %45 = tail call i64 @llvm.umin.i64(i64 %44, i64 191)
  %multiply.3524.25 = fmul double %param_4.9095, %z.2.i
  %add.1044.5 = fadd double %param_2.12734, %multiply.3524.25
  %multiply.3578.6 = fmul double %add.1044.5, %add.1044.5
  %divide.879.3 = fdiv double 1.000000e+00, %multiply.3578.6
  %46 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %45, i64 %thread_id_x
  store double %divide.879.3, ptr addrspace(1) %46, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_57(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1603 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1603, 0
  %2 = add i64 %param_1.1603, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1603
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.13444 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %multiply.3527.17 = fmul double %param_2.13444, 2.000000e+00
  %divide.868.7 = fdiv double 1.000000e+00, %multiply.3527.17
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.868.7, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_56(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4) local_unnamed_addr #2 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1346 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1346, 0
  %2 = add i64 %param_2.1346, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1346
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg415, i64 %thread_id_x
  %param_4.9384 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.11575 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %multiply.3525.5 = fmul double %param_4.9384, %param_3.11575
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.16056 = load double, ptr addrspace(1) %8, align 8, !invariant.load !194
  %multiply.3526.3 = fmul double %multiply.3525.5, %param_1.16056
  %9 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3526.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_65(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3) local_unnamed_addr #2 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1325 = load i64, ptr addrspace(1) %arg215, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_2.1325, 0
  %2 = add i64 %param_2.1325, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1325
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.15844 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %param_3.1144 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg317, i64 0, i64 %5
  %param_3.114410 = load i32, ptr addrspace(1) %param_3.1144, align 4, !invariant.load !194
  %7 = sitofp i32 %param_3.114410 to double
  %multiply.3516.7 = fmul double %param_1.15844, %7
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3516.7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_62(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg8) local_unnamed_addr #2 {
entry:
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1593 = load i64, ptr addrspace(1) %arg118, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1593, 0
  %2 = add i64 %param_1.1593, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1593
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.6314 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg730, i64 %thread_id_x
  %param_7.4795 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %multiply.3498.21 = fmul double %param_6.6314, %param_7.4795
  %param_5.8626 = load double, ptr addrspace(1) %arg526, align 128, !invariant.load !194
  %8 = getelementptr double, ptr addrspace(1) %arg424, i64 %thread_id_x
  %param_4.9797 = load double, ptr addrspace(1) %8, align 8, !invariant.load !194
  %multiply.3499.23 = fmul double %param_5.8626, %param_4.9797
  %add.1031.21 = fadd double %multiply.3498.21, %multiply.3499.23
  %9 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.13798 = load double, ptr addrspace(1) %9, align 8, !invariant.load !194
  %10 = getelementptr double, ptr addrspace(1) %arg322, i64 %thread_id_x
  %param_3.11999 = load double, ptr addrspace(1) %10, align 8, !invariant.load !194
  %param_8.351 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg832, i64 0, i64 %5
  %param_8.35115 = load i32, ptr addrspace(1) %param_8.351, align 4, !invariant.load !194
  %11 = sitofp i32 %param_8.35115 to double
  %multiply.3516.23 = fmul double %param_3.11999, %11
  %multiply.3517.19 = fmul double %param_2.13798, %multiply.3516.23
  %add.1038.19 = fadd double %add.1031.21, %multiply.3517.19
  %subtract.147.13 = fsub double %add.1038.19, %add.1031.21
  %multiply.3555.3 = fmul double %subtract.147.13, 2.000000e+00
  %12 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg016, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3555.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_63(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg8) local_unnamed_addr #2 {
entry:
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1149 = load i64, ptr addrspace(1) %arg322, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_3.1149, 0
  %2 = add i64 %param_3.1149, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.1149
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.5984 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg730, i64 %thread_id_x
  %param_7.4445 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %multiply.3498.13 = fmul double %param_6.5984, %param_7.4445
  %param_5.8236 = load double, ptr addrspace(1) %arg526, align 128, !invariant.load !194
  %8 = getelementptr double, ptr addrspace(1) %arg424, i64 %thread_id_x
  %param_4.9337 = load double, ptr addrspace(1) %8, align 8, !invariant.load !194
  %multiply.3499.15 = fmul double %param_5.8236, %param_4.9337
  %add.1031.13 = fadd double %multiply.3498.13, %multiply.3499.15
  %9 = getelementptr double, ptr addrspace(1) %arg118, i64 %thread_id_x
  %param_1.15918 = load double, ptr addrspace(1) %9, align 8, !invariant.load !194
  %10 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.13329 = load double, ptr addrspace(1) %10, align 8, !invariant.load !194
  %param_8.324 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg832, i64 0, i64 %5
  %param_8.32415 = load i32, ptr addrspace(1) %param_8.324, align 4, !invariant.load !194
  %11 = sitofp i32 %param_8.32415 to double
  %multiply.3516.13 = fmul double %param_2.13329, %11
  %multiply.3517.9 = fmul double %param_1.15918, %multiply.3516.13
  %add.1038.9 = fadd double %add.1031.13, %multiply.3517.9
  %subtract.147.3 = fsub double %add.1038.9, %add.1031.13
  %multiply.3520.3 = fmul double %subtract.147.3, %subtract.147.3
  %12 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg016, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3520.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_46(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1550 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1550, 0
  %2 = add i64 %param_1.1550, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1550
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg312, i64 %thread_id_x
  %param_3.11264 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.12915 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %multiply.3525.3 = fmul double %param_3.11264, %param_2.12915
  %multiply.3530.4 = fmul double %multiply.3525.3, %multiply.3525.3
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3530.4, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_43(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1571 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1571, 0
  %2 = add i64 %param_1.1571, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1571
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg312, i64 %thread_id_x
  %param_3.12064 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %multiply.3533.15 = fmul double %param_3.12064, %param_3.12064
  %multiply.3534.13 = fmul double %multiply.3533.15, 5.000000e-01
  %7 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13125 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %multiply.3535.7 = fmul double %param_2.13125, %multiply.3534.13
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3535.7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_58(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1601 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1601, 0
  %2 = add i64 %param_1.1601, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1601
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg312, i64 %thread_id_x
  %param_3.11544 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13425 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %multiply.3525.11 = fmul double %param_3.11544, %param_2.13425
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3525.11, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_47(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !198
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1620 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !194
  %1 = icmp slt i64 %param_1.1620, 0
  %2 = add i64 %param_1.1620, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1620
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg312, i64 %thread_id_x
  %param_3.11954 = load double, ptr addrspace(1) %6, align 8, !invariant.load !194
  %7 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13765 = load double, ptr addrspace(1) %7, align 8, !invariant.load !194
  %multiply.3525.19 = fmul double %param_3.11954, %param_2.13765
  %multiply.3582.3 = fmul double %multiply.3525.19, 2.000000e+00
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.3582.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index8 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index8, 2400
  br i1 %3, label %dynamic-update-slice.2119.1.in_bounds-true, label %dynamic-update-slice.2119.1.in_bounds-after

dynamic-update-slice.2119.1.in_bounds-after:      ; preds = %dynamic-update-slice.2119.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2119.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index8 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index8 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext10 = zext nneg i16 %.decomposed to i64
  %param_3.1186 = load i64, ptr addrspace(1) %arg317, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_3.1186, 0
  %7 = add i64 %param_3.1186, 192
  %8 = select i1 %6, i64 %7, i64 %param_3.1186
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_4.981 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg419, i64 0, i64 %.zext10
  %param_4.9815 = load i8, ptr addrspace(1) %param_4.981, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_4.9815, 0
  %12 = getelementptr double, ptr addrspace(1) %arg215, i64 %linear_index
  %param_2.12976 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %13 = select i1 %11, double %param_2.12976, double 0.000000e+00
  %param_1.1556 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg113, i64 0, i64 %.zext10
  %param_1.15567 = load double, ptr addrspace(1) %param_1.1556, align 8, !invariant.load !194
  %multiply.3619.3 = fmul double %13, %param_1.15567
  %14 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %10, i64 %.zext, i64 %.zext10
  store double %multiply.3619.3, ptr addrspace(1) %14, align 8
  br label %dynamic-update-slice.2119.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_38(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index7 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index7, 2400
  br i1 %3, label %dynamic-update-slice.2087.1.in_bounds-true, label %dynamic-update-slice.2087.1.in_bounds-after

dynamic-update-slice.2087.1.in_bounds-after:      ; preds = %dynamic-update-slice.2087.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2087.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index7 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index7 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext9 = zext nneg i16 %.decomposed to i64
  %param_3.1148 = load i64, ptr addrspace(1) %arg316, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_3.1148, 0
  %7 = add i64 %param_3.1148, 192
  %8 = select i1 %6, i64 %7, i64 %param_3.1148
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg112, i64 %linear_index
  %param_1.15905 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_2.1331 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg214, i64 0, i64 %.zext9
  %param_2.13316 = load double, ptr addrspace(1) %param_2.1331, align 8, !invariant.load !194
  %multiply.3599.3 = fmul double %param_1.15905, %param_2.13316
  %12 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %10, i64 %.zext, i64 %.zext9
  store double %multiply.3599.3, ptr addrspace(1) %12, align 8
  br label %dynamic-update-slice.2087.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg8) local_unnamed_addr #2 {
entry:
  %arg831 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index12 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index12, 2400
  br i1 %3, label %dynamic-update-slice.2116.1.in_bounds-true, label %dynamic-update-slice.2116.1.in_bounds-after

dynamic-update-slice.2116.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2116.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index12 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index12 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext14 = zext nneg i16 %.decomposed to i64
  %param_1.1566 = load i64, ptr addrspace(1) %arg117, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_1.1566, 0
  %7 = add i64 %param_1.1566, 192
  %8 = select i1 %6, i64 %7, i64 %param_1.1566
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg831, i64 %linear_index
  %param_8.3505 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_7.477 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg729, i64 0, i64 %.zext14
  %param_7.4776 = load double, ptr addrspace(1) %param_7.477, align 8, !invariant.load !194
  %param_6.6297 = load double, ptr addrspace(1) %arg627, align 128, !invariant.load !194
  %param_5.860 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg525, i64 0, i64 %.zext14
  %param_5.8608 = load double, ptr addrspace(1) %param_5.860, align 8, !invariant.load !194
  %12 = tail call double @llvm.fma.f64(double %param_5.8608, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #5
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #5
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %param_5.8608)
  %16 = tail call double @llvm.fma.f64(double %14, double 0xBC7ABC9E3B39803F, double %15)
  %17 = tail call double @llvm.fma.f64(double %16, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %18 = tail call double @llvm.fma.f64(double %17, double %16, double 0x3EC71DEE62401315)
  %19 = tail call double @llvm.fma.f64(double %18, double %16, double 0x3EFA01997C89EB71)
  %20 = tail call double @llvm.fma.f64(double %19, double %16, double 0x3F2A01A014761F65)
  %21 = tail call double @llvm.fma.f64(double %20, double %16, double 0x3F56C16C1852B7AF)
  %22 = tail call double @llvm.fma.f64(double %21, double %16, double 0x3F81111111122322)
  %23 = tail call double @llvm.fma.f64(double %22, double %16, double 0x3FA55555555502A1)
  %24 = tail call double @llvm.fma.f64(double %23, double %16, double 0x3FC5555555555511)
  %25 = tail call double @llvm.fma.f64(double %24, double %16, double 0x3FE000000000000B)
  %26 = tail call double @llvm.fma.f64(double %25, double %16, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %16, double 1.000000e+00)
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #5
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #5
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %param_5.8608) #5
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #5
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2116.1.in_bounds-true
  %37 = fcmp olt double %param_5.8608, 0.000000e+00
  %38 = fadd double %param_5.8608, 0x7FF0000000000000
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #5
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #5
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2116.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %dynamic-update-slice.2116.1.in_bounds-true ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3524.55 = fmul double %param_6.6297, %z.2.i
  %compare.377.25 = fcmp ogt double %multiply.3524.55, 1.000000e-128
  %50 = getelementptr double, ptr addrspace(1) %arg423, i64 %linear_index
  %param_4.9779 = load double, ptr addrspace(1) %50, align 8, !invariant.load !194
  %multiply.3561.21 = fmul double %z.2.i, %param_4.9779
  %multiply.3562.49 = fmul double %param_6.6297, %multiply.3561.21
  %51 = select i1 %compare.377.25, double %multiply.3562.49, double 0.000000e+00
  %52 = fmul double %param_8.3505, %param_7.4776
  %add.1055.37 = fsub double %51, %52
  %53 = fneg double %add.1055.37
  %param_3.1197 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg321, i64 0, i64 %.zext14
  %param_3.119710 = load double, ptr addrspace(1) %param_3.1197, align 8, !invariant.load !194
  %multiply.3564.29 = fmul double %param_3.119710, %53
  %54 = fmul double %multiply.3564.29, -2.000000e+00
  %param_2.1307 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg219, i64 0, i64 %.zext14
  %param_2.130711 = load double, ptr addrspace(1) %param_2.1307, align 8, !invariant.load !194
  %multiply.3572.3 = fmul double %param_2.130711, %54
  %55 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %10, i64 %.zext, i64 %.zext14
  store double %multiply.3572.3, ptr addrspace(1) %55, align 8
  br label %dynamic-update-slice.2116.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg8) local_unnamed_addr #2 {
entry:
  %arg831 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index12 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index12, 2400
  br i1 %3, label %dynamic-update-slice.2091.1.in_bounds-true, label %dynamic-update-slice.2091.1.in_bounds-after

dynamic-update-slice.2091.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2091.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index12 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index12 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext14 = zext nneg i16 %.decomposed to i64
  %param_2.1368 = load i64, ptr addrspace(1) %arg219, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1368, 0
  %7 = add i64 %param_2.1368, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1368
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg423, i64 %linear_index
  %param_4.9655 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_3.1183 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg321, i64 0, i64 %.zext14
  %param_3.11836 = load double, ptr addrspace(1) %param_3.1183, align 8, !invariant.load !194
  %param_1.16147 = load double, ptr addrspace(1) %arg117, align 128, !invariant.load !194
  %param_6.617 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg627, i64 0, i64 %.zext14
  %param_6.6178 = load double, ptr addrspace(1) %param_6.617, align 8, !invariant.load !194
  %12 = tail call double @llvm.fma.f64(double %param_6.6178, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #5
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #5
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %param_6.6178)
  %16 = tail call double @llvm.fma.f64(double %14, double 0xBC7ABC9E3B39803F, double %15)
  %17 = tail call double @llvm.fma.f64(double %16, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %18 = tail call double @llvm.fma.f64(double %17, double %16, double 0x3EC71DEE62401315)
  %19 = tail call double @llvm.fma.f64(double %18, double %16, double 0x3EFA01997C89EB71)
  %20 = tail call double @llvm.fma.f64(double %19, double %16, double 0x3F2A01A014761F65)
  %21 = tail call double @llvm.fma.f64(double %20, double %16, double 0x3F56C16C1852B7AF)
  %22 = tail call double @llvm.fma.f64(double %21, double %16, double 0x3F81111111122322)
  %23 = tail call double @llvm.fma.f64(double %22, double %16, double 0x3FA55555555502A1)
  %24 = tail call double @llvm.fma.f64(double %23, double %16, double 0x3FC5555555555511)
  %25 = tail call double @llvm.fma.f64(double %24, double %16, double 0x3FE000000000000B)
  %26 = tail call double @llvm.fma.f64(double %25, double %16, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %16, double 1.000000e+00)
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #5
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #5
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %param_6.6178) #5
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #5
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2091.1.in_bounds-true
  %37 = fcmp olt double %param_6.6178, 0.000000e+00
  %38 = fadd double %param_6.6178, 0x7FF0000000000000
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #5
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #5
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2091.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %dynamic-update-slice.2091.1.in_bounds-true ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3524.45 = fmul double %param_1.16147, %z.2.i
  %compare.377.15 = fcmp ogt double %multiply.3524.45, 1.000000e-128
  %50 = getelementptr double, ptr addrspace(1) %arg525, i64 %linear_index
  %param_5.8499 = load double, ptr addrspace(1) %50, align 8, !invariant.load !194
  %multiply.3561.11 = fmul double %z.2.i, %param_5.8499
  %multiply.3562.47 = fmul double %param_1.16147, %multiply.3561.11
  %51 = select i1 %compare.377.15, double %multiply.3562.47, double 0.000000e+00
  %52 = fmul double %param_4.9655, %param_3.11836
  %add.1055.35 = fsub double %51, %52
  %param_7.471 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg729, i64 0, i64 %.zext14
  %param_7.47110 = load double, ptr addrspace(1) %param_7.471, align 8, !invariant.load !194
  %param_8.345 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg831, i64 0, i64 %.zext14
  %param_8.34511 = load double, ptr addrspace(1) %param_8.345, align 8, !invariant.load !194
  %53 = select i1 %compare.377.15, double %multiply.3524.45, double %param_8.34511
  %add.1042.5 = fadd double %param_7.47110, %53
  %multiply.3563.6 = fmul double %add.1042.5, %add.1042.5
  %multiply.3600.5 = fmul double %add.1042.5, %multiply.3563.6
  %divide.881.3 = fdiv double 1.000000e+00, %multiply.3600.5
  %multiply.3601.3 = fmul double %divide.881.3, -2.000000e+00
  %multiply.3602.3 = fmul double %add.1055.35, %multiply.3601.3
  %54 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %10, i64 %.zext, i64 %.zext14
  store double %multiply.3602.3, ptr addrspace(1) %54, align 8
  br label %dynamic-update-slice.2091.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8) local_unnamed_addr #2 {
entry:
  %arg831 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index12 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index12, 2400
  br i1 %3, label %dynamic-update-slice.2121.1.in_bounds-true, label %dynamic-update-slice.2121.1.in_bounds-after

dynamic-update-slice.2121.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2121.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index12 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index12 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext14 = zext nneg i16 %.decomposed to i64
  %param_4.955 = load i64, ptr addrspace(1) %arg423, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_4.955, 0
  %7 = add i64 %param_4.955, 192
  %8 = select i1 %6, i64 %7, i64 %param_4.955
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_5.864 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg525, i64 0, i64 %.zext14
  %param_5.8645 = load i8, ptr addrspace(1) %param_5.864, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_5.8645, 0
  %12 = getelementptr double, ptr addrspace(1) %arg321, i64 %linear_index
  %param_3.11246 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %param_3.11246.neg = fneg double %param_3.11246
  %13 = select i1 %11, double %param_3.11246.neg, double -0.000000e+00
  %param_2.1289 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg219, i64 0, i64 %.zext14
  %param_2.12897 = load double, ptr addrspace(1) %param_2.1289, align 8, !invariant.load !194
  %multiply.3575.5 = fmul double %13, %param_2.12897
  %param_1.15488 = load double, ptr addrspace(1) %arg117, align 128, !invariant.load !194
  %14 = getelementptr double, ptr addrspace(1) %arg729, i64 %linear_index
  %param_7.4829 = load double, ptr addrspace(1) %14, align 8, !invariant.load !194
  %15 = select i1 %11, double %param_7.4829, double 0.000000e+00
  %param_6.635 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg627, i64 0, i64 %.zext14
  %param_6.63510 = load double, ptr addrspace(1) %param_6.635, align 8, !invariant.load !194
  %16 = tail call double @llvm.fma.f64(double %param_6.63510, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %17 = tail call i32 @llvm.nvvm.d2i.lo(double %16) #5
  %18 = tail call double @llvm.nvvm.add.rn.d(double %16, double 0xC338000000000000) #5
  %19 = tail call double @llvm.fma.f64(double %18, double 0xBFE62E42FEFA39EF, double %param_6.63510)
  %20 = tail call double @llvm.fma.f64(double %18, double 0xBC7ABC9E3B39803F, double %19)
  %21 = tail call double @llvm.fma.f64(double %20, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %22 = tail call double @llvm.fma.f64(double %21, double %20, double 0x3EC71DEE62401315)
  %23 = tail call double @llvm.fma.f64(double %22, double %20, double 0x3EFA01997C89EB71)
  %24 = tail call double @llvm.fma.f64(double %23, double %20, double 0x3F2A01A014761F65)
  %25 = tail call double @llvm.fma.f64(double %24, double %20, double 0x3F56C16C1852B7AF)
  %26 = tail call double @llvm.fma.f64(double %25, double %20, double 0x3F81111111122322)
  %27 = tail call double @llvm.fma.f64(double %26, double %20, double 0x3FA55555555502A1)
  %28 = tail call double @llvm.fma.f64(double %27, double %20, double 0x3FC5555555555511)
  %29 = tail call double @llvm.fma.f64(double %28, double %20, double 0x3FE000000000000B)
  %30 = tail call double @llvm.fma.f64(double %29, double %20, double 1.000000e+00)
  %31 = tail call double @llvm.fma.f64(double %30, double %20, double 1.000000e+00)
  %32 = tail call i32 @llvm.nvvm.d2i.lo(double %31) #5
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %31) #5
  %34 = shl i32 %17, 20
  %35 = add i32 %33, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %32, i32 %35) #5
  %37 = tail call i32 @llvm.nvvm.d2i.hi(double %param_6.63510) #5
  %38 = bitcast i32 %37 to float
  %39 = tail call float @llvm.nvvm.fabs.f(float %38) #5
  %40 = fcmp olt float %39, 0x4010C46560000000
  br i1 %40, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2121.1.in_bounds-true
  %41 = fcmp olt double %param_6.63510, 0.000000e+00
  %42 = fadd double %param_6.63510, 0x7FF0000000000000
  %z.0.i = select i1 %41, double 0.000000e+00, double %42
  %43 = fcmp olt float %39, 0x4010E90000000000
  br i1 %43, label %44, label %__nv_exp.exit

44:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %45 = sdiv i32 %17, 2
  %46 = shl i32 %45, 20
  %47 = add i32 %33, %46
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 %32, i32 %47) #5
  %49 = sub nsw i32 %17, %45
  %50 = shl i32 %49, 20
  %51 = add nsw i32 %50, 1072693248
  %52 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %51) #5
  %53 = fmul double %52, %48
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2121.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %44
  %z.2.i = phi double [ %36, %dynamic-update-slice.2121.1.in_bounds-true ], [ %53, %44 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3576.7 = fmul double %15, %z.2.i
  %multiply.3577.13 = fmul double %param_1.15488, %multiply.3576.7
  %add.1061.11 = fadd double %multiply.3575.5, %multiply.3577.13
  %param_8.353 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg831, i64 0, i64 %.zext14
  %param_8.35311 = load double, ptr addrspace(1) %param_8.353, align 8, !invariant.load !194
  %multiply.3524.29 = fmul double %param_1.15488, %z.2.i
  %add.1044.9 = fadd double %param_8.35311, %multiply.3524.29
  %multiply.3578.10 = fmul double %add.1044.9, %add.1044.9
  %multiply.3620.5 = fmul double %add.1044.9, %multiply.3578.10
  %divide.887.3 = fdiv double 1.000000e+00, %multiply.3620.5
  %multiply.3621.3 = fmul double %divide.887.3, -2.000000e+00
  %multiply.3622.3 = fmul double %add.1061.11, %multiply.3621.3
  %54 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %10, i64 %.zext, i64 %.zext14
  store double %multiply.3622.3, ptr addrspace(1) %54, align 8
  br label %dynamic-update-slice.2121.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8) local_unnamed_addr #2 {
entry:
  %arg831 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index12 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index12, 2400
  br i1 %3, label %dynamic-update-slice.2118.1.in_bounds-true, label %dynamic-update-slice.2118.1.in_bounds-after

dynamic-update-slice.2118.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2118.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index12 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index12 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext14 = zext nneg i16 %.decomposed to i64
  %param_3.1174 = load i64, ptr addrspace(1) %arg321, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_3.1174, 0
  %7 = add i64 %param_3.1174, 192
  %8 = select i1 %6, i64 %7, i64 %param_3.1174
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg525, i64 %linear_index
  %param_5.8405 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_4.953 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg423, i64 0, i64 %.zext14
  %param_4.9536 = load double, ptr addrspace(1) %param_4.953, align 8, !invariant.load !194
  %param_2.13607 = load double, ptr addrspace(1) %arg219, align 128, !invariant.load !194
  %param_7.457 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg729, i64 0, i64 %.zext14
  %param_7.4578 = load double, ptr addrspace(1) %param_7.457, align 8, !invariant.load !194
  %12 = tail call double @llvm.fma.f64(double %param_7.4578, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #5
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #5
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %param_7.4578)
  %16 = tail call double @llvm.fma.f64(double %14, double 0xBC7ABC9E3B39803F, double %15)
  %17 = tail call double @llvm.fma.f64(double %16, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %18 = tail call double @llvm.fma.f64(double %17, double %16, double 0x3EC71DEE62401315)
  %19 = tail call double @llvm.fma.f64(double %18, double %16, double 0x3EFA01997C89EB71)
  %20 = tail call double @llvm.fma.f64(double %19, double %16, double 0x3F2A01A014761F65)
  %21 = tail call double @llvm.fma.f64(double %20, double %16, double 0x3F56C16C1852B7AF)
  %22 = tail call double @llvm.fma.f64(double %21, double %16, double 0x3F81111111122322)
  %23 = tail call double @llvm.fma.f64(double %22, double %16, double 0x3FA55555555502A1)
  %24 = tail call double @llvm.fma.f64(double %23, double %16, double 0x3FC5555555555511)
  %25 = tail call double @llvm.fma.f64(double %24, double %16, double 0x3FE000000000000B)
  %26 = tail call double @llvm.fma.f64(double %25, double %16, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %16, double 1.000000e+00)
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #5
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #5
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %param_7.4578) #5
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #5
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2118.1.in_bounds-true
  %37 = fcmp olt double %param_7.4578, 0.000000e+00
  %38 = fadd double %param_7.4578, 0x7FF0000000000000
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #5
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #5
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2118.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %dynamic-update-slice.2118.1.in_bounds-true ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3524.33 = fmul double %param_2.13607, %z.2.i
  %compare.377.3 = fcmp ogt double %multiply.3524.33, 1.000000e-128
  %50 = getelementptr double, ptr addrspace(1) %arg627, i64 %linear_index
  %param_6.6109 = load double, ptr addrspace(1) %50, align 8, !invariant.load !194
  %multiply.3561.19 = fmul double %z.2.i, %param_6.6109
  %multiply.3562.45 = fmul double %param_2.13607, %multiply.3561.19
  %51 = select i1 %compare.377.3, double %multiply.3562.45, double 0.000000e+00
  %52 = fmul double %param_5.8405, %param_4.9536
  %add.1055.33 = fsub double %51, %52
  %53 = fneg double %add.1055.33
  %param_1.1559 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg117, i64 0, i64 %.zext14
  %param_1.155910 = load double, ptr addrspace(1) %param_1.1559, align 8, !invariant.load !194
  %multiply.3564.27 = fmul double %param_1.155910, %53
  %param_8.356 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg831, i64 0, i64 %.zext14
  %param_8.35611 = load double, ptr addrspace(1) %param_8.356, align 8, !invariant.load !194
  %multiply.3527.11 = fmul double %param_8.35611, 2.000000e+00
  %multiply.3571.6 = fmul double %multiply.3527.11, %multiply.3527.11
  %multiply.3616.5 = fmul double %multiply.3527.11, %multiply.3571.6
  %divide.886.3 = fdiv double 1.000000e+00, %multiply.3616.5
  %multiply.3617.3 = fmul double %divide.886.3, -4.000000e+00
  %multiply.3618.3 = fmul double %multiply.3564.27, %multiply.3617.3
  %54 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %10, i64 %.zext, i64 %.zext14
  store double %multiply.3618.3, ptr addrspace(1) %54, align 8
  br label %dynamic-update-slice.2118.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_36(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg7) local_unnamed_addr #2 {
entry:
  %arg728 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index11 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index11, 2400
  br i1 %3, label %dynamic-update-slice.2089.1.in_bounds-true, label %dynamic-update-slice.2089.1.in_bounds-after

dynamic-update-slice.2089.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2089.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index11 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index11 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext13 = zext nneg i16 %.decomposed to i64
  %param_3.1182 = load i64, ptr addrspace(1) %arg320, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_3.1182, 0
  %7 = add i64 %param_3.1182, 192
  %8 = select i1 %6, i64 %7, i64 %param_3.1182
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg524, i64 %linear_index
  %param_5.8485 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_4.964 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg422, i64 0, i64 %.zext13
  %param_4.9646 = load double, ptr addrspace(1) %param_4.964, align 8, !invariant.load !194
  %param_1.15307 = load double, ptr addrspace(1) %arg116, align 128, !invariant.load !194
  %param_7.463 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg728, i64 0, i64 %.zext13
  %param_7.4638 = load double, ptr addrspace(1) %param_7.463, align 8, !invariant.load !194
  %12 = tail call double @llvm.fma.f64(double %param_7.4638, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #5
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #5
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %param_7.4638)
  %16 = tail call double @llvm.fma.f64(double %14, double 0xBC7ABC9E3B39803F, double %15)
  %17 = tail call double @llvm.fma.f64(double %16, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %18 = tail call double @llvm.fma.f64(double %17, double %16, double 0x3EC71DEE62401315)
  %19 = tail call double @llvm.fma.f64(double %18, double %16, double 0x3EFA01997C89EB71)
  %20 = tail call double @llvm.fma.f64(double %19, double %16, double 0x3F2A01A014761F65)
  %21 = tail call double @llvm.fma.f64(double %20, double %16, double 0x3F56C16C1852B7AF)
  %22 = tail call double @llvm.fma.f64(double %21, double %16, double 0x3F81111111122322)
  %23 = tail call double @llvm.fma.f64(double %22, double %16, double 0x3FA55555555502A1)
  %24 = tail call double @llvm.fma.f64(double %23, double %16, double 0x3FC5555555555511)
  %25 = tail call double @llvm.fma.f64(double %24, double %16, double 0x3FE000000000000B)
  %26 = tail call double @llvm.fma.f64(double %25, double %16, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %16, double 1.000000e+00)
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #5
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #5
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %param_7.4638) #5
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #5
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2089.1.in_bounds-true
  %37 = fcmp olt double %param_7.4638, 0.000000e+00
  %38 = fadd double %param_7.4638, 0x7FF0000000000000
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #5
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #5
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2089.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %dynamic-update-slice.2089.1.in_bounds-true ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3524.43 = fmul double %param_1.15307, %z.2.i
  %compare.377.13 = fcmp ogt double %multiply.3524.43, 1.000000e-128
  %50 = getelementptr double, ptr addrspace(1) %arg626, i64 %linear_index
  %param_6.6169 = load double, ptr addrspace(1) %50, align 8, !invariant.load !194
  %multiply.3561.9 = fmul double %z.2.i, %param_6.6169
  %multiply.3562.29 = fmul double %param_1.15307, %multiply.3561.9
  %51 = select i1 %compare.377.13, double %multiply.3562.29, double 0.000000e+00
  %52 = fmul double %param_5.8485, %param_4.9646
  %add.1055.19 = fsub double %51, %52
  %53 = fneg double %add.1055.19
  %param_2.1367 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg218, i64 0, i64 %.zext13
  %param_2.136710 = load double, ptr addrspace(1) %param_2.1367, align 8, !invariant.load !194
  %multiply.3564.13 = fmul double %param_2.136710, %53
  %54 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg014, i64 0, i64 %10, i64 %.zext, i64 %.zext13
  store double %multiply.3564.13, ptr addrspace(1) %54, align 8
  br label %dynamic-update-slice.2089.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion(ptr noalias nocapture align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg13, ptr noalias nocapture align 128 dereferenceable(19200) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg17, ptr noalias nocapture align 128 dereferenceable(19200) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg19, ptr noalias nocapture align 128 dereferenceable(19200) %arg20, ptr noalias nocapture align 128 dereferenceable(19200) %arg21, ptr noalias nocapture align 128 dereferenceable(19200) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg27, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg33, ptr noalias nocapture align 128 dereferenceable(19200) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg35, ptr noalias nocapture align 128 dereferenceable(19200) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg37, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg41, ptr noalias nocapture align 128 dereferenceable(19200) %arg42, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg43, ptr noalias nocapture align 128 dereferenceable(19200) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg45, ptr noalias nocapture align 128 dereferenceable(19200) %arg46, ptr noalias nocapture align 128 dereferenceable(19200) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg49, ptr noalias nocapture align 128 dereferenceable(19200) %arg50, ptr noalias nocapture align 128 dereferenceable(19200) %arg51, ptr noalias nocapture align 128 dereferenceable(19200) %arg52, ptr noalias nocapture align 128 dereferenceable(19200) %arg53, ptr noalias nocapture align 128 dereferenceable(19200) %arg54, ptr noalias nocapture align 128 dereferenceable(19200) %arg55, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg56, ptr noalias nocapture align 128 dereferenceable(19200) %arg57, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg58, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg59, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg60) local_unnamed_addr #2 {
entry:
  %arg60130 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59128 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58126 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57124 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56122 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55120 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54118 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53116 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52114 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51112 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50110 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49108 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48106 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47104 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46102 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45100 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg4498 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg4396 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg4294 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg4192 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg4090 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg3988 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg3886 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg3784 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg3682 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3580 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg3478 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3376 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg3274 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg3172 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3070 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2968 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2866 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2764 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2662 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2560 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2458 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2356 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2254 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2152 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2050 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1948 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1846 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1744 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1642 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1540 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1438 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1336 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1234 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1132 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1030 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg928 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg826 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_add_select_fusion.in_bounds-true, label %loop_add_select_fusion.in_bounds-after

loop_add_select_fusion.in_bounds-after:           ; preds = %__nv_exp.exit9, %entry
  ret void

loop_add_select_fusion.in_bounds-true:            ; preds = %entry
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %4 = urem i16 %.lhs.trunc, 20
  %5 = zext nneg i16 %4 to i64
  %6 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg112, i64 0, i64 %5
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !194
  %8 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg214, i64 0, i64 %5
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !194
  %10 = zext nneg i32 %linear_index to i64
  %11 = getelementptr double, ptr addrspace(1) %arg010, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 8
  %multiply.3558.3 = fmul double %9, %12
  %13 = getelementptr double, ptr addrspace(1) %arg724, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !194
  %15 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg520, i64 0, i64 %5
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !194
  %multiply.3565.11 = fmul double %14, %16
  %17 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg622, i64 0, i64 %5, i64 0
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !194
  %19 = load double, ptr addrspace(1) %arg1234, align 128, !invariant.load !194
  %20 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3988, i64 0, i64 %5
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !194
  %22 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg4192, i64 0, i64 %5, i64 0
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !194
  %24 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4090, i64 0, i64 %5
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !194
  %multiply.3502.31.clone.1 = fmul double %23, %25
  %add.1033.29.clone.1 = fadd double %21, %multiply.3502.31.clone.1
  %26 = tail call double @llvm.fma.f64(double %add.1033.29.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #5
  %28 = tail call double @llvm.nvvm.add.rn.d(double %26, double 0xC338000000000000) #5
  %29 = tail call double @llvm.fma.f64(double %28, double 0xBFE62E42FEFA39EF, double %add.1033.29.clone.1)
  %30 = tail call double @llvm.fma.f64(double %28, double 0xBC7ABC9E3B39803F, double %29)
  %31 = tail call double @llvm.fma.f64(double %30, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %32 = tail call double @llvm.fma.f64(double %31, double %30, double 0x3EC71DEE62401315)
  %33 = tail call double @llvm.fma.f64(double %32, double %30, double 0x3EFA01997C89EB71)
  %34 = tail call double @llvm.fma.f64(double %33, double %30, double 0x3F2A01A014761F65)
  %35 = tail call double @llvm.fma.f64(double %34, double %30, double 0x3F56C16C1852B7AF)
  %36 = tail call double @llvm.fma.f64(double %35, double %30, double 0x3F81111111122322)
  %37 = tail call double @llvm.fma.f64(double %36, double %30, double 0x3FA55555555502A1)
  %38 = tail call double @llvm.fma.f64(double %37, double %30, double 0x3FC5555555555511)
  %39 = tail call double @llvm.fma.f64(double %38, double %30, double 0x3FE000000000000B)
  %40 = tail call double @llvm.fma.f64(double %39, double %30, double 1.000000e+00)
  %41 = tail call double @llvm.fma.f64(double %40, double %30, double 1.000000e+00)
  %42 = tail call i32 @llvm.nvvm.d2i.lo(double %41) #5
  %43 = tail call i32 @llvm.nvvm.d2i.hi(double %41) #5
  %44 = shl i32 %27, 20
  %45 = add i32 %43, %44
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 %42, i32 %45) #5
  %47 = tail call i32 @llvm.nvvm.d2i.hi(double %add.1033.29.clone.1) #5
  %48 = bitcast i32 %47 to float
  %49 = tail call float @llvm.nvvm.fabs.f(float %48) #5
  %50 = fcmp olt float %49, 0x4010C46560000000
  br i1 %50, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %loop_add_select_fusion.in_bounds-true
  %51 = fcmp olt double %add.1033.29.clone.1, 0.000000e+00
  %52 = fadd double %add.1033.29.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %51, double 0.000000e+00, double %52
  %53 = fcmp olt float %49, 0x4010E90000000000
  br i1 %53, label %54, label %__nv_exp.exit

54:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %55 = sdiv i32 %27, 2
  %56 = shl i32 %55, 20
  %57 = add i32 %43, %56
  %58 = tail call double @llvm.nvvm.lohi.i2d(i32 %42, i32 %57) #5
  %59 = sub nsw i32 %27, %55
  %60 = shl i32 %59, 20
  %61 = add nsw i32 %60, 1072693248
  %62 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %61) #5
  %63 = fmul double %62, %58
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %loop_add_select_fusion.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %54
  %z.2.i = phi double [ %46, %loop_add_select_fusion.in_bounds-true ], [ %63, %54 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3503.43.clone.1 = fmul double %19, %z.2.i
  %compare.375.23.clone.1 = fcmp ogt double %multiply.3503.43.clone.1, 1.000000e-128
  %64 = getelementptr double, ptr addrspace(1) %arg3886, i64 %10
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !194
  %multiply.3510.11.clone.1 = fmul double %12, %23
  %add.1036.9.clone.1 = fadd double %multiply.3510.11.clone.1, %65
  %multiply.3511.7.clone.1 = fmul double %z.2.i, %add.1036.9.clone.1
  %multiply.3512.5.clone.1 = fmul double %19, %multiply.3511.7.clone.1
  %66 = select i1 %compare.375.23.clone.1, double %multiply.3512.5.clone.1, double 0.000000e+00
  %67 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3376, i64 0, i64 %5
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !194
  %multiply.3550.3.clone.1 = fmul double %68, %66
  %69 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3784, i64 0, i64 %5
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !194
  %71 = select i1 %compare.375.23.clone.1, double %multiply.3503.43.clone.1, double %70
  %72 = getelementptr double, ptr addrspace(1) %arg2662, i64 %10
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !194
  %multiply.3551.1.clone.1 = fmul double %71, %73
  %add.1051.1.clone.1 = fadd double %multiply.3551.1.clone.1, %multiply.3550.3.clone.1
  %multiply.3566.11 = fmul double %18, %add.1051.1.clone.1
  %add.1057.9 = fadd double %multiply.3565.11, %multiply.3566.11
  %74 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg418, i64 0, i64 %5
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !194
  %multiply.3567.7 = fmul double %75, %add.1057.9
  %multiply.3525.27 = fmul double %16, %18
  %76 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3580, i64 0, i64 %5
  %77 = load double, ptr addrspace(1) %76, align 8, !invariant.load !194
  %divide.875.5.clone.1 = fdiv double %73, %77
  %78 = getelementptr double, ptr addrspace(1) %arg3478, i64 %10
  %79 = load double, ptr addrspace(1) %78, align 8
  %80 = fneg double %79
  %multiply.3552.3.clone.1 = fmul double %68, %80
  %81 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3274, i64 0, i64 %5
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !194
  %multiply.3553.3.clone.1 = fmul double %multiply.3552.3.clone.1, %82
  %add.1052.3.clone.1 = fadd double %divide.875.5.clone.1, %multiply.3553.3.clone.1
  %83 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2560, i64 0, i64 %5
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !194
  %85 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3172, i64 0, i64 %5
  %86 = load double, ptr addrspace(1) %85, align 8, !invariant.load !194
  %multiply.3498.19.clone.1 = fmul double %84, %86
  %87 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3070, i64 0, i64 %5
  %88 = load double, ptr addrspace(1) %87, align 8, !invariant.load !194
  %multiply.3499.21.clone.1 = fmul double %19, %88
  %add.1031.19.clone.1 = fadd double %multiply.3498.19.clone.1, %multiply.3499.21.clone.1
  %89 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2356, i64 0, i64 %5
  %90 = load double, ptr addrspace(1) %89, align 8, !invariant.load !194
  %91 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2764, i64 0, i64 %5
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !194
  %93 = load i64, ptr addrspace(1) %arg2968, align 128, !invariant.load !194
  %94 = icmp slt i64 %93, 0
  %95 = add i64 %93, 192
  %96 = select i1 %94, i64 %95, i64 %93
  %97 = trunc i64 %96 to i32
  %98 = tail call i32 @llvm.smax.i32(i32 %97, i32 0)
  %99 = tail call i32 @llvm.umin.i32(i32 %98, i32 191)
  %100 = zext nneg i32 %99 to i64
  %101 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg2866, i64 0, i64 %100
  %102 = load i32, ptr addrspace(1) %101, align 4, !invariant.load !194
  %103 = sitofp i32 %102 to double
  %multiply.3516.19.clone.1 = fmul double %92, %103
  %multiply.3517.15.clone.1 = fmul double %90, %multiply.3516.19.clone.1
  %add.1038.15.clone.1 = fadd double %add.1031.19.clone.1, %multiply.3517.15.clone.1
  %subtract.147.9.clone.1 = fsub double %add.1038.15.clone.1, %add.1031.19.clone.1
  %multiply.3520.1.clone.1 = fmul double %subtract.147.9.clone.1, %subtract.147.9.clone.1
  %multiply.3554.1.clone.1 = fmul double %73, %multiply.3520.1.clone.1
  %104 = getelementptr double, ptr addrspace(1) %arg2458, i64 %10
  %105 = load double, ptr addrspace(1) %104, align 8, !invariant.load !194
  %multiply.3504.21.clone.1 = fmul double %84, %105
  %106 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg45100, i64 0, i64 %5, i64 0
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !194
  %108 = getelementptr double, ptr addrspace(1) %arg4498, i64 %10
  %109 = load double, ptr addrspace(1) %108, align 8
  %multiply.3543.5.clone.1 = fmul double %107, %109
  %divide.873.3.clone.1 = fdiv double %multiply.3543.5.clone.1, %77
  %110 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4396, i64 0, i64 %5
  %111 = load double, ptr addrspace(1) %110, align 8, !invariant.load !194
  %multiply.3501.3.clone.1 = fmul double %107, %111
  %multiply.3544.3.clone.1 = fmul double %multiply.3501.3.clone.1, %80
  %multiply.3546.3.clone.1 = fmul double %82, %multiply.3544.3.clone.1
  %add.1048.1.clone.1 = fadd double %divide.873.3.clone.1, %multiply.3546.3.clone.1
  %multiply.3547.7.clone.1 = fmul double %multiply.3516.19.clone.1, %add.1048.1.clone.1
  %multiply.3505.23.clone.1 = fmul double %multiply.3504.21.clone.1, %111
  %112 = fneg double %multiply.3505.23.clone.1
  %multiply.3539.5.clone.1 = fmul double %103, %112
  %divide.870.3.clone.1 = fdiv double %multiply.3539.5.clone.1, %111
  %113 = fneg double %109
  %114 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr addrspace(1) %arg49108, i64 0, i64 %100, i64 %5, i64 0
  %115 = load double, ptr addrspace(1) %114, align 8, !invariant.load !194
  %116 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg48106, i64 0, i64 %5
  %117 = load double, ptr addrspace(1) %116, align 8, !invariant.load !194
  %subtract.146.5.clone.1 = fsub double %115, %117
  %multiply.3515.3.clone.1 = fmul double %subtract.146.5.clone.1, %103
  %multiply.3540.1.clone.1 = fmul double %multiply.3515.3.clone.1, %113
  %multiply.3541.10.clone.1 = fmul double %111, %111
  %divide.871.5.clone.1 = fdiv double 1.000000e+00, %multiply.3541.10.clone.1
  %multiply.3542.1.clone.1 = fmul double %divide.871.5.clone.1, %multiply.3540.1.clone.1
  %add.1047.1.clone.1 = fadd double %divide.870.3.clone.1, %multiply.3542.1.clone.1
  %multiply.3548.8.clone.1 = fmul double %add.1047.1.clone.1, %103
  %multiply.3549.9.clone.1 = fmul double %90, %multiply.3548.8.clone.1
  %add.1049.7.clone.1 = fadd double %multiply.3547.7.clone.1, %multiply.3549.9.clone.1
  %add.1050.12.clone.1 = fadd double %multiply.3504.21.clone.1, %add.1049.7.clone.1
  %subtract.149.11.clone.1 = fsub double %add.1050.12.clone.1, %multiply.3504.21.clone.1
  %multiply.3555.5.clone.1 = fmul double %subtract.147.9.clone.1, 2.000000e+00
  %multiply.3556.5.clone.1 = fmul double %multiply.3555.5.clone.1, %subtract.149.11.clone.1
  %multiply.3557.3.clone.1 = fmul double %68, %multiply.3556.5.clone.1
  %add.1053.1.clone.1 = fadd double %multiply.3554.1.clone.1, %multiply.3557.3.clone.1
  %add.1054.1.clone.1 = fadd double %add.1052.3.clone.1, %add.1053.1.clone.1
  %multiply.3568.5 = fmul double %multiply.3525.27, %add.1054.1.clone.1
  %add.1058.5 = fadd double %multiply.3567.7, %multiply.3568.5
  %118 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1540, i64 0, i64 %5
  %119 = load double, ptr addrspace(1) %118, align 8, !invariant.load !194
  %multiply.3527.13 = fmul double %119, 2.000000e+00
  %divide.868.3 = fdiv double 1.000000e+00, %multiply.3527.13
  %multiply.3569.3 = fmul double %divide.868.3, %add.1058.5
  %multiply.3526.1 = fmul double %multiply.3525.27, %75
  %120 = getelementptr double, ptr addrspace(1) %arg1438, i64 %10
  %121 = load double, ptr addrspace(1) %120, align 8
  %122 = fneg double %121
  %123 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1336, i64 0, i64 %5
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !194
  %multiply.3560.21 = fmul double %124, %122
  %125 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1132, i64 0, i64 %5
  %126 = load double, ptr addrspace(1) %125, align 8, !invariant.load !194
  %127 = tail call double @llvm.fma.f64(double %126, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %128 = tail call i32 @llvm.nvvm.d2i.lo(double %127) #5
  %129 = tail call double @llvm.nvvm.add.rn.d(double %127, double 0xC338000000000000) #5
  %130 = tail call double @llvm.fma.f64(double %129, double 0xBFE62E42FEFA39EF, double %126)
  %131 = tail call double @llvm.fma.f64(double %129, double 0xBC7ABC9E3B39803F, double %130)
  %132 = tail call double @llvm.fma.f64(double %131, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %133 = tail call double @llvm.fma.f64(double %132, double %131, double 0x3EC71DEE62401315)
  %134 = tail call double @llvm.fma.f64(double %133, double %131, double 0x3EFA01997C89EB71)
  %135 = tail call double @llvm.fma.f64(double %134, double %131, double 0x3F2A01A014761F65)
  %136 = tail call double @llvm.fma.f64(double %135, double %131, double 0x3F56C16C1852B7AF)
  %137 = tail call double @llvm.fma.f64(double %136, double %131, double 0x3F81111111122322)
  %138 = tail call double @llvm.fma.f64(double %137, double %131, double 0x3FA55555555502A1)
  %139 = tail call double @llvm.fma.f64(double %138, double %131, double 0x3FC5555555555511)
  %140 = tail call double @llvm.fma.f64(double %139, double %131, double 0x3FE000000000000B)
  %141 = tail call double @llvm.fma.f64(double %140, double %131, double 1.000000e+00)
  %142 = tail call double @llvm.fma.f64(double %141, double %131, double 1.000000e+00)
  %143 = tail call i32 @llvm.nvvm.d2i.lo(double %142) #5
  %144 = tail call i32 @llvm.nvvm.d2i.hi(double %142) #5
  %145 = shl i32 %128, 20
  %146 = add i32 %144, %145
  %147 = tail call double @llvm.nvvm.lohi.i2d(i32 %143, i32 %146) #5
  %148 = tail call i32 @llvm.nvvm.d2i.hi(double %126) #5
  %149 = bitcast i32 %148 to float
  %150 = tail call float @llvm.nvvm.fabs.f(float %149) #5
  %151 = fcmp olt float %150, 0x4010C46560000000
  br i1 %151, label %__nv_exp.exit9, label %__internal_fast_icmp_abs_lt.exit.i6

__internal_fast_icmp_abs_lt.exit.i6:              ; preds = %__nv_exp.exit
  %152 = fcmp olt double %126, 0.000000e+00
  %153 = fadd double %126, 0x7FF0000000000000
  %z.0.i7 = select i1 %152, double 0.000000e+00, double %153
  %154 = fcmp olt float %150, 0x4010E90000000000
  br i1 %154, label %155, label %__nv_exp.exit9

155:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i6
  %156 = sdiv i32 %128, 2
  %157 = shl i32 %156, 20
  %158 = add i32 %144, %157
  %159 = tail call double @llvm.nvvm.lohi.i2d(i32 %143, i32 %158) #5
  %160 = sub nsw i32 %128, %156
  %161 = shl i32 %160, 20
  %162 = add nsw i32 %161, 1072693248
  %163 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %162) #5
  %164 = fmul double %163, %159
  br label %__nv_exp.exit9

__nv_exp.exit9:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i6, %155
  %z.2.i8 = phi double [ %147, %__nv_exp.exit ], [ %164, %155 ], [ %z.0.i7, %__internal_fast_icmp_abs_lt.exit.i6 ]
  %multiply.3524.47 = fmul double %19, %z.2.i8
  %compare.377.17 = fcmp ogt double %multiply.3524.47, 1.000000e-128
  %165 = getelementptr double, ptr addrspace(1) %arg1030, i64 %10
  %166 = load double, ptr addrspace(1) %165, align 8, !invariant.load !194
  %multiply.3561.23 = fmul double %z.2.i8, %166
  %multiply.3562.51 = fmul double %19, %multiply.3561.23
  %167 = select i1 %compare.377.17, double %multiply.3562.51, double 0.000000e+00
  %add.1055.39 = fadd double %multiply.3560.21, %167
  %168 = fneg double %add.1055.39
  %169 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg928, i64 0, i64 %5
  %170 = load double, ptr addrspace(1) %169, align 8, !invariant.load !194
  %multiply.3564.31 = fmul double %170, %168
  %171 = fmul double %multiply.3564.31, 2.000000e+00
  %172 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg826, i64 0, i64 %5
  %173 = load double, ptr addrspace(1) %172, align 8, !invariant.load !194
  %multiply.3572.5 = fmul double %173, %171
  %multiply.3573.3 = fmul double %multiply.3526.1, %multiply.3572.5
  %174 = fsub double %multiply.3569.3, %multiply.3573.3
  %175 = getelementptr inbounds [20 x i64], ptr addrspace(1) %arg316, i64 0, i64 %5
  %176 = load i64, ptr addrspace(1) %175, align 8, !invariant.load !194
  %177 = sitofp i64 %176 to double
  %multiply.3574.5 = fmul double %174, %177
  %add.1060.3 = fadd double %multiply.3558.3, %multiply.3574.5
  %178 = trunc i8 %7 to i1
  %179 = select i1 %178, double %add.1060.3, double %12
  %180 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg1744, i64 0, i64 %5
  %181 = load i8, ptr addrspace(1) %180, align 1, !invariant.load !194
  %182 = icmp eq i8 %181, 0
  %183 = select i1 %182, double %122, double -0.000000e+00
  %multiply.3575.3.clone.1 = fmul double %124, %183
  %184 = select i1 %182, double %166, double 0.000000e+00
  %multiply.3576.5.clone.1 = fmul double %z.2.i8, %184
  %multiply.3577.11.clone.1 = fmul double %19, %multiply.3576.5.clone.1
  %add.1061.9.clone.1 = fadd double %multiply.3575.3.clone.1, %multiply.3577.11.clone.1
  %185 = fneg double %add.1061.9.clone.1
  %186 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1642, i64 0, i64 %5
  %187 = load double, ptr addrspace(1) %186, align 8, !invariant.load !194
  %add.1044.7.clone.1 = fadd double %multiply.3524.47, %187
  %multiply.3578.8.clone.1 = fmul double %add.1044.7.clone.1, %add.1044.7.clone.1
  %divide.879.5.clone.1 = fdiv double 1.000000e+00, %multiply.3578.8.clone.1
  %multiply.3579.3.clone.1 = fmul double %divide.879.5.clone.1, %185
  %multiply.3530.32.clone.1 = fmul double %multiply.3525.27, %multiply.3525.27
  %multiply.3531.15.clone.1 = fmul double %multiply.3530.32.clone.1, 5.000000e-01
  %multiply.3532.15.clone.1 = fmul double %multiply.3530.32.clone.1, %75
  %add.1045.13.clone.1 = fadd double %multiply.3531.15.clone.1, %multiply.3532.15.clone.1
  %multiply.3533.23.clone.1 = fmul double %18, %18
  %multiply.3534.21.clone.1 = fmul double %multiply.3533.23.clone.1, 5.000000e-01
  %multiply.3535.11.clone.1 = fmul double %16, %multiply.3534.21.clone.1
  %multiply.3536.11.clone.1 = fmul double %multiply.3535.11.clone.1, %75
  %subtract.148.11.clone.1 = fsub double %add.1045.13.clone.1, %multiply.3536.11.clone.1
  %multiply.3537.9.clone.1 = fmul double %subtract.148.11.clone.1, %177
  %add.1046.7.clone.1 = fadd double %119, %multiply.3537.9.clone.1
  %compare.380.3.clone.1 = fcmp ogt double %add.1046.7.clone.1, 1.000000e-128
  %188 = icmp eq i8 %181, 1
  %189 = select i1 %188, double %multiply.3564.31, double 0.000000e+00
  %190 = select i1 %188, double %14, double 0.000000e+00
  %multiply.3580.9.clone.1 = fmul double %16, %190
  %191 = select i1 %188, double %add.1051.1.clone.1, double 0.000000e+00
  %multiply.3581.9.clone.1 = fmul double %18, %191
  %add.1062.11.clone.1 = fadd double %multiply.3580.9.clone.1, %multiply.3581.9.clone.1
  %multiply.3582.9.clone.1 = fmul double %multiply.3525.27, 2.000000e+00
  %multiply.3583.5.clone.1 = fmul double %multiply.3582.9.clone.1, %add.1062.11.clone.1
  %multiply.3584.3.clone.1 = fmul double %multiply.3583.5.clone.1, 5.000000e-01
  %multiply.3585.5.clone.1 = fmul double %75, %multiply.3583.5.clone.1
  %192 = select i1 %188, double %add.1054.1.clone.1, double 0.000000e+00
  %multiply.3586.9.clone.1 = fmul double %multiply.3530.32.clone.1, %192
  %add.1063.7.clone.1 = fadd double %multiply.3586.9.clone.1, %multiply.3585.5.clone.1
  %add.1064.5.clone.1 = fadd double %multiply.3584.3.clone.1, %add.1063.7.clone.1
  %multiply.3587.11.clone.1 = fmul double %18, 2.000000e+00
  %multiply.3588.13.clone.1 = fmul double %multiply.3587.11.clone.1, %190
  %multiply.3589.7.clone.1 = fmul double %16, 5.000000e-01
  %multiply.3590.7.clone.1 = fmul double %multiply.3589.7.clone.1, %multiply.3588.13.clone.1
  %multiply.3591.5.clone.1 = fmul double %multiply.3534.21.clone.1, %191
  %add.1065.5.clone.1 = fadd double %multiply.3591.5.clone.1, %multiply.3590.7.clone.1
  %multiply.3592.3.clone.1 = fmul double %75, %add.1065.5.clone.1
  %multiply.3593.7.clone.1 = fmul double %multiply.3535.11.clone.1, %192
  %add.1066.5.clone.1 = fadd double %multiply.3593.7.clone.1, %multiply.3592.3.clone.1
  %subtract.150.3.clone.1 = fsub double %add.1064.5.clone.1, %add.1066.5.clone.1
  %multiply.3594.3.clone.1 = fmul double %subtract.150.3.clone.1, %177
  %add.1067.3.clone.1 = fadd double %189, %multiply.3594.3.clone.1
  %193 = select i1 %compare.380.3.clone.1, double %add.1067.3.clone.1, double 0.000000e+00
  %194 = select i1 %182, double %multiply.3579.3.clone.1, double %193
  %195 = select i1 %178, double %194, double %121
  %multiply.3595.5.clone.1 = fmul double %119, %167
  %196 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1948, i64 0, i64 %5
  %197 = load double, ptr addrspace(1) %196, align 8, !invariant.load !194
  %198 = select i1 %compare.377.17, double %multiply.3524.47, double %197
  %multiply.3596.5.clone.1 = fmul double %multiply.3564.31, %198
  %add.1068.3.clone.1 = fadd double %multiply.3595.5.clone.1, %multiply.3596.5.clone.1
  %199 = getelementptr double, ptr addrspace(1) %arg1846, i64 %10
  %200 = load double, ptr addrspace(1) %199, align 8
  %201 = select i1 %178, double %add.1068.3.clone.1, double %200
  %202 = getelementptr double, ptr addrspace(1) %arg2050, i64 %10
  %203 = load double, ptr addrspace(1) %202, align 8
  %204 = select i1 %178, double %multiply.3564.31, double %203
  %205 = getelementptr double, ptr addrspace(1) %arg2152, i64 %10
  %206 = load double, ptr addrspace(1) %205, align 8
  %207 = select i1 %178, double %multiply.3560.21, double %206
  %208 = getelementptr double, ptr addrspace(1) %arg2254, i64 %10
  %209 = load double, ptr addrspace(1) %208, align 8
  %210 = select i1 %178, double %add.1054.1.clone.1, double %209
  %211 = getelementptr double, ptr addrspace(1) %arg3682, i64 %10
  %212 = load double, ptr addrspace(1) %211, align 8
  %213 = select i1 %178, double %add.1051.1.clone.1, double %212
  %214 = select i1 %178, double %add.1050.12.clone.1, double %105
  %215 = getelementptr double, ptr addrspace(1) %arg4294, i64 %10
  %216 = load double, ptr addrspace(1) %215, align 8
  %217 = select i1 %178, double %subtract.149.11.clone.1, double %216
  %218 = getelementptr double, ptr addrspace(1) %arg46102, i64 %10
  %219 = load double, ptr addrspace(1) %218, align 8
  %220 = select i1 %178, double %79, double %219
  %221 = getelementptr double, ptr addrspace(1) %arg47104, i64 %10
  %222 = load double, ptr addrspace(1) %221, align 8
  %223 = select i1 %178, double %add.1047.1.clone.1, double %222
  %224 = getelementptr double, ptr addrspace(1) %arg50110, i64 %10
  %225 = load double, ptr addrspace(1) %224, align 8
  %226 = select i1 %178, double %multiply.3558.3, double %225
  %227 = getelementptr double, ptr addrspace(1) %arg51112, i64 %10
  %228 = load double, ptr addrspace(1) %227, align 8
  %229 = select i1 %178, double %109, double %228
  %230 = getelementptr double, ptr addrspace(1) %arg52114, i64 %10
  %231 = load double, ptr addrspace(1) %230, align 8
  %232 = select i1 %178, double %109, double %231
  %233 = getelementptr double, ptr addrspace(1) %arg53116, i64 %10
  %234 = load double, ptr addrspace(1) %233, align 8
  %235 = select i1 %178, double %multiply.3504.21.clone.1, double %234
  %236 = getelementptr double, ptr addrspace(1) %arg54118, i64 %10
  %237 = load double, ptr addrspace(1) %236, align 8
  %238 = select i1 %178, double %multiply.3505.23.clone.1, double %237
  %239 = fneg double %219
  %240 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg56122, i64 0, i64 %5
  %241 = load double, ptr addrspace(1) %240, align 8, !invariant.load !194
  %multiply.3509.3.clone.1 = fmul double %241, %239
  %242 = getelementptr double, ptr addrspace(1) %arg55120, i64 %10
  %243 = load double, ptr addrspace(1) %242, align 8
  %244 = select i1 %178, double %multiply.3509.3.clone.1, double %243
  %245 = getelementptr double, ptr addrspace(1) %arg57124, i64 %10
  %246 = load double, ptr addrspace(1) %245, align 8
  %247 = select i1 %178, double %73, double %246
  store double %179, ptr addrspace(1) %11, align 8
  store double %195, ptr addrspace(1) %120, align 8
  store double %201, ptr addrspace(1) %199, align 8
  store double %204, ptr addrspace(1) %202, align 8
  store double %207, ptr addrspace(1) %205, align 8
  store double %210, ptr addrspace(1) %208, align 8
  store double %add.1054.1.clone.1, ptr addrspace(1) %78, align 8
  store double %213, ptr addrspace(1) %211, align 8
  %248 = getelementptr double, ptr addrspace(1) %arg58126, i64 %10
  store double %add.1051.1.clone.1, ptr addrspace(1) %248, align 8
  %249 = getelementptr double, ptr addrspace(1) %arg59128, i64 %10
  store double %214, ptr addrspace(1) %249, align 8
  store double %217, ptr addrspace(1) %215, align 8
  %250 = getelementptr double, ptr addrspace(1) %arg60130, i64 %10
  store double %add.1048.1.clone.1, ptr addrspace(1) %250, align 8
  store double %220, ptr addrspace(1) %218, align 8
  store double %223, ptr addrspace(1) %221, align 8
  store double %add.1047.1.clone.1, ptr addrspace(1) %108, align 8
  store double %226, ptr addrspace(1) %224, align 8
  store double %229, ptr addrspace(1) %227, align 8
  store double %232, ptr addrspace(1) %230, align 8
  store double %235, ptr addrspace(1) %233, align 8
  store double %238, ptr addrspace(1) %236, align 8
  store double %244, ptr addrspace(1) %242, align 8
  store double %247, ptr addrspace(1) %245, align 8
  br label %loop_add_select_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg7) local_unnamed_addr #2 {
entry:
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index13 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index13, 2400
  br i1 %3, label %dynamic-update-slice.2117.1.in_bounds-true, label %dynamic-update-slice.2117.1.in_bounds-after

dynamic-update-slice.2117.1.in_bounds-after:      ; preds = %dynamic-update-slice.2117.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2117.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index13 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index13 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext15 = zext nneg i16 %.decomposed to i64
  %param_1.1563 = load i64, ptr addrspace(1) %arg118, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_1.1563, 0
  %7 = add i64 %param_1.1563, 192
  %8 = select i1 %6, i64 %7, i64 %param_1.1563
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg730, i64 %linear_index
  %param_7.4395 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_3.1137 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg322, i64 0, i64 %.zext15
  %param_3.11376 = load double, ptr addrspace(1) %param_3.1137, align 8, !invariant.load !194
  %multiply.3565.9 = fmul double %param_7.4395, %param_3.11376
  %param_4.925 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg424, i64 0, i64 %.zext15, i64 0
  %param_4.9257 = load double, ptr addrspace(1) %param_4.925, align 8, !invariant.load !194
  %12 = getelementptr double, ptr addrspace(1) %arg628, i64 %linear_index
  %param_6.5938 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %multiply.3566.9 = fmul double %param_4.9257, %param_6.5938
  %add.1057.7 = fadd double %multiply.3565.9, %multiply.3566.9
  %param_5.817 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg526, i64 0, i64 %.zext15
  %param_5.8179 = load double, ptr addrspace(1) %param_5.817, align 8, !invariant.load !194
  %multiply.3567.5 = fmul double %param_5.8179, %add.1057.7
  %multiply.3525.25 = fmul double %param_3.11376, %param_4.9257
  %13 = getelementptr double, ptr addrspace(1) %arg220, i64 %linear_index
  %param_2.130412 = load double, ptr addrspace(1) %13, align 8, !invariant.load !194
  %multiply.3568.3 = fmul double %multiply.3525.25, %param_2.130412
  %add.1058.3 = fadd double %multiply.3567.5, %multiply.3568.3
  %14 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg016, i64 0, i64 %10, i64 %.zext, i64 %.zext15
  store double %add.1058.3, ptr addrspace(1) %14, align 8
  br label %dynamic-update-slice.2117.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg11) local_unnamed_addr #2 {
entry:
  %arg1149 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1047 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg945 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg843 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg741 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg639 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg537 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg435 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg333 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg231 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg129 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg027 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index24 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index24, 2400
  br i1 %3, label %dynamic-update-slice.2110.1.in_bounds-true, label %dynamic-update-slice.2110.1.in_bounds-after

dynamic-update-slice.2110.1.in_bounds-after:      ; preds = %dynamic-update-slice.2110.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2110.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index24 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index24 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext26 = zext nneg i16 %.decomposed to i64
  %param_1.1588 = load i64, ptr addrspace(1) %arg129, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_1.1588, 0
  %7 = add i64 %param_1.1588, 192
  %8 = select i1 %6, i64 %7, i64 %param_1.1588
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_3.1147 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg333, i64 0, i64 %.zext26
  %param_3.11475 = load double, ptr addrspace(1) %param_3.1147, align 8, !invariant.load !194
  %11 = getelementptr double, ptr addrspace(1) %arg231, i64 %linear_index
  %param_2.13296 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %multiply.3504.25 = fmul double %param_3.11475, %param_2.13296
  %12 = getelementptr double, ptr addrspace(1) %arg1047, i64 %linear_index
  %param_10.2447 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %param_5.858 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg537, i64 0, i64 %.zext26
  %param_5.8588 = load double, ptr addrspace(1) %param_5.858, align 8, !invariant.load !194
  %param_11.213 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg1149, i64 0, i64 %10
  %param_11.21314 = load i32, ptr addrspace(1) %param_11.213, align 4, !invariant.load !194
  %13 = sitofp i32 %param_11.21314 to double
  %multiply.3516.37 = fmul double %param_5.8588, %13
  %multiply.3547.11 = fmul double %param_10.2447, %multiply.3516.37
  %param_4.975 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg435, i64 0, i64 %.zext26
  %param_4.97515 = load double, ptr addrspace(1) %param_4.975, align 8, !invariant.load !194
  %14 = getelementptr double, ptr addrspace(1) %arg945, i64 %linear_index
  %param_9.29716 = load double, ptr addrspace(1) %14, align 8, !invariant.load !194
  %multiply.3548.12 = fmul double %param_9.29716, %13
  %multiply.3549.13 = fmul double %param_4.97515, %multiply.3548.12
  %add.1049.11 = fadd double %multiply.3547.11, %multiply.3549.13
  %add.1050.10 = fadd double %multiply.3504.25, %add.1049.11
  %subtract.149.9 = fsub double %add.1050.10, %multiply.3504.25
  %param_8.349 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg843, i64 0, i64 %.zext26
  %param_8.34919 = load double, ptr addrspace(1) %param_8.349, align 8, !invariant.load !194
  %multiply.3498.25 = fmul double %param_3.11475, %param_8.34919
  %param_7.47620 = load double, ptr addrspace(1) %arg741, align 128, !invariant.load !194
  %param_6.627 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg639, i64 0, i64 %.zext26
  %param_6.62721 = load double, ptr addrspace(1) %param_6.627, align 8, !invariant.load !194
  %multiply.3499.27 = fmul double %param_7.47620, %param_6.62721
  %add.1031.25 = fadd double %multiply.3498.25, %multiply.3499.27
  %multiply.3517.23 = fmul double %param_4.97515, %multiply.3516.37
  %add.1038.23 = fadd double %multiply.3517.23, %add.1031.25
  %subtract.147.17 = fsub double %add.1038.23, %add.1031.25
  %multiply.3555.7 = fmul double %subtract.147.17, 2.000000e+00
  %multiply.3556.3 = fmul double %subtract.149.9, %multiply.3555.7
  %15 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg027, i64 0, i64 %10, i64 %.zext, i64 %.zext26
  store double %multiply.3556.3, ptr addrspace(1) %15, align 8
  br label %dynamic-update-slice.2110.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg8) local_unnamed_addr #2 {
entry:
  %arg836 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg734 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg632 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg530 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg428 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg326 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg224 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg122 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg020 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index17 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index17, 2400
  br i1 %3, label %dynamic-update-slice.2111.1.in_bounds-true, label %dynamic-update-slice.2111.1.in_bounds-after

dynamic-update-slice.2111.1.in_bounds-after:      ; preds = %dynamic-update-slice.2111.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2111.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index17 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index17 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext19 = zext nneg i16 %.decomposed to i64
  %param_1.1619 = load i64, ptr addrspace(1) %arg122, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_1.1619, 0
  %7 = add i64 %param_1.1619, 192
  %8 = select i1 %6, i64 %7, i64 %param_1.1619
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_3.1194 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg326, i64 0, i64 %.zext19
  %param_3.11945 = load double, ptr addrspace(1) %param_3.1194, align 8, !invariant.load !194
  %11 = getelementptr double, ptr addrspace(1) %arg224, i64 %linear_index
  %param_2.13756 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %multiply.3504.9 = fmul double %param_3.11945, %param_2.13756
  %12 = getelementptr double, ptr addrspace(1) %arg632, i64 %linear_index
  %param_6.6267 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %param_7.475 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg734, i64 0, i64 %.zext19
  %param_7.4758 = load double, ptr addrspace(1) %param_7.475, align 8, !invariant.load !194
  %param_8.348 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg836, i64 0, i64 %10
  %param_8.34814 = load i32, ptr addrspace(1) %param_8.348, align 4, !invariant.load !194
  %13 = sitofp i32 %param_8.34814 to double
  %multiply.3516.31 = fmul double %param_7.4758, %13
  %multiply.3547.5 = fmul double %param_6.6267, %multiply.3516.31
  %param_5.857 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg530, i64 0, i64 %.zext19
  %param_5.85715 = load double, ptr addrspace(1) %param_5.857, align 8, !invariant.load !194
  %14 = getelementptr double, ptr addrspace(1) %arg428, i64 %linear_index
  %param_4.97416 = load double, ptr addrspace(1) %14, align 8, !invariant.load !194
  %multiply.3548.6 = fmul double %param_4.97416, %13
  %multiply.3549.7 = fmul double %param_5.85715, %multiply.3548.6
  %add.1049.5 = fadd double %multiply.3547.5, %multiply.3549.7
  %add.1050.8 = fadd double %multiply.3504.9, %add.1049.5
  %subtract.149.7 = fsub double %add.1050.8, %multiply.3504.9
  %multiply.3615.1 = fmul double %subtract.149.7, 2.000000e+00
  %15 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg020, i64 0, i64 %10, i64 %.zext, i64 %.zext19
  store double %multiply.3615.1, ptr addrspace(1) %15, align 8
  br label %dynamic-update-slice.2111.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3) local_unnamed_addr #2 {
entry:
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index12 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index12, 2400
  br i1 %3, label %dynamic-update-slice.2108.1.in_bounds-true, label %dynamic-update-slice.2108.1.in_bounds-after

dynamic-update-slice.2108.1.in_bounds-after:      ; preds = %dynamic-update-slice.2108.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2108.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index12 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index12 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext14 = zext nneg i16 %.decomposed to i64
  %param_2.1341 = load i64, ptr addrspace(1) %arg219, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1341, 0
  %7 = add i64 %param_2.1341, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1341
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg117, i64 %linear_index
  %param_1.16005 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_3.1153 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg321, i64 0, i64 %10
  %param_3.115311 = load i32, ptr addrspace(1) %param_3.1153, align 4, !invariant.load !194
  %12 = sitofp i32 %param_3.115311 to double
  %multiply.3548.1 = fmul double %param_1.16005, %12
  %13 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %10, i64 %.zext, i64 %.zext14
  store double %multiply.3548.1, ptr addrspace(1) %13, align 8
  br label %dynamic-update-slice.2108.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_35(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index8 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index8, 2400
  br i1 %3, label %dynamic-update-slice.2090.1.in_bounds-true, label %dynamic-update-slice.2090.1.in_bounds-after

dynamic-update-slice.2090.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2090.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index8 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index8 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext10 = zext nneg i16 %.decomposed to i64
  %param_2.1361 = load i64, ptr addrspace(1) %arg215, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1361, 0
  %7 = add i64 %param_2.1361, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1361
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_1.15615 = load double, ptr addrspace(1) %arg113, align 128, !invariant.load !194
  %param_4.954 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg419, i64 0, i64 %.zext10
  %param_4.9546 = load double, ptr addrspace(1) %param_4.954, align 8, !invariant.load !194
  %11 = tail call double @llvm.fma.f64(double %param_4.9546, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #5
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #5
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %param_4.9546)
  %15 = tail call double @llvm.fma.f64(double %13, double 0xBC7ABC9E3B39803F, double %14)
  %16 = tail call double @llvm.fma.f64(double %15, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %17 = tail call double @llvm.fma.f64(double %16, double %15, double 0x3EC71DEE62401315)
  %18 = tail call double @llvm.fma.f64(double %17, double %15, double 0x3EFA01997C89EB71)
  %19 = tail call double @llvm.fma.f64(double %18, double %15, double 0x3F2A01A014761F65)
  %20 = tail call double @llvm.fma.f64(double %19, double %15, double 0x3F56C16C1852B7AF)
  %21 = tail call double @llvm.fma.f64(double %20, double %15, double 0x3F81111111122322)
  %22 = tail call double @llvm.fma.f64(double %21, double %15, double 0x3FA55555555502A1)
  %23 = tail call double @llvm.fma.f64(double %22, double %15, double 0x3FC5555555555511)
  %24 = tail call double @llvm.fma.f64(double %23, double %15, double 0x3FE000000000000B)
  %25 = tail call double @llvm.fma.f64(double %24, double %15, double 1.000000e+00)
  %26 = tail call double @llvm.fma.f64(double %25, double %15, double 1.000000e+00)
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #5
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #5
  %29 = shl i32 %12, 20
  %30 = add i32 %28, %29
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %30) #5
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %param_4.9546) #5
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #5
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2090.1.in_bounds-true
  %36 = fcmp olt double %param_4.9546, 0.000000e+00
  %37 = fadd double %param_4.9546, 0x7FF0000000000000
  %z.0.i = select i1 %36, double 0.000000e+00, double %37
  %38 = fcmp olt float %34, 0x4010E90000000000
  br i1 %38, label %39, label %__nv_exp.exit

39:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %40 = sdiv i32 %12, 2
  %41 = shl i32 %40, 20
  %42 = add i32 %28, %41
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %42) #5
  %44 = sub nsw i32 %12, %40
  %45 = shl i32 %44, 20
  %46 = add nsw i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %46) #5
  %48 = fmul double %47, %43
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2090.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %39
  %z.2.i = phi double [ %31, %dynamic-update-slice.2090.1.in_bounds-true ], [ %48, %39 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3524.39 = fmul double %param_1.15615, %z.2.i
  %compare.377.9 = fcmp ogt double %multiply.3524.39, 1.000000e-128
  %49 = getelementptr double, ptr addrspace(1) %arg317, i64 %linear_index
  %param_3.11757 = load double, ptr addrspace(1) %49, align 8, !invariant.load !194
  %multiply.3561.5 = fmul double %z.2.i, %param_3.11757
  %multiply.3562.9 = fmul double %param_1.15615, %multiply.3561.5
  %50 = select i1 %compare.377.9, double %multiply.3562.9, double 0.000000e+00
  %51 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %10, i64 %.zext, i64 %.zext10
  store double %50, ptr addrspace(1) %51, align 8
  br label %dynamic-update-slice.2090.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index7 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index7, 2400
  br i1 %3, label %dynamic-update-slice.2125.1.in_bounds-true, label %dynamic-update-slice.2125.1.in_bounds-after

dynamic-update-slice.2125.1.in_bounds-after:      ; preds = %dynamic-update-slice.2125.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2125.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index7 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index7 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext9 = zext nneg i16 %.decomposed to i64
  %param_2.1363 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1363, 0
  %7 = add i64 %param_2.1363, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1363
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_3.1200 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg316, i64 0, i64 %.zext9
  %param_3.12005 = load i8, ptr addrspace(1) %param_3.1200, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_3.12005, 1
  %12 = getelementptr double, ptr addrspace(1) %arg112, i64 %linear_index
  %param_1.15286 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %13 = select i1 %11, double %param_1.15286, double 0.000000e+00
  %14 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %10, i64 %.zext, i64 %.zext9
  store double %13, ptr addrspace(1) %14, align 8
  br label %dynamic-update-slice.2125.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index11 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index11, 2400
  br i1 %3, label %dynamic-update-slice.2124.1.in_bounds-true, label %dynamic-update-slice.2124.1.in_bounds-after

dynamic-update-slice.2124.1.in_bounds-after:      ; preds = %dynamic-update-slice.2124.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2124.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index11 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index11 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext13 = zext nneg i16 %.decomposed to i64
  %param_5.856 = load i64, ptr addrspace(1) %arg524, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_5.856, 0
  %7 = add i64 %param_5.856, 192
  %8 = select i1 %6, i64 %7, i64 %param_5.856
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_6.634 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg626, i64 0, i64 %.zext13
  %param_6.6345 = load i8, ptr addrspace(1) %param_6.634, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_6.6345, 1
  %12 = getelementptr double, ptr addrspace(1) %arg320, i64 %linear_index
  %param_3.11926 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %13 = select i1 %11, double %param_3.11926, double 0.000000e+00
  %param_2.1373 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg218, i64 0, i64 %.zext13
  %param_2.13737 = load double, ptr addrspace(1) %param_2.1373, align 8, !invariant.load !194
  %multiply.3580.5 = fmul double %13, %param_2.13737
  %param_1.1617 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg116, i64 0, i64 %.zext13, i64 0
  %param_1.16178 = load double, ptr addrspace(1) %param_1.1617, align 8, !invariant.load !194
  %14 = getelementptr double, ptr addrspace(1) %arg422, i64 %linear_index
  %param_4.9729 = load double, ptr addrspace(1) %14, align 8, !invariant.load !194
  %15 = select i1 %11, double %param_4.9729, double 0.000000e+00
  %multiply.3581.5 = fmul double %param_1.16178, %15
  %add.1062.7 = fadd double %multiply.3580.5, %multiply.3581.5
  %multiply.3623.3 = fmul double %add.1062.7, 2.000000e+00
  %16 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg014, i64 0, i64 %10, i64 %.zext, i64 %.zext13
  store double %multiply.3623.3, ptr addrspace(1) %16, align 8
  br label %dynamic-update-slice.2124.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg6) local_unnamed_addr #2 {
entry:
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index11 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index11, 2400
  br i1 %3, label %dynamic-update-slice.2129.1.in_bounds-true, label %dynamic-update-slice.2129.1.in_bounds-after

dynamic-update-slice.2129.1.in_bounds-after:      ; preds = %dynamic-update-slice.2129.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2129.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index11 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index11 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext13 = zext nneg i16 %.decomposed to i64
  %param_1.1511 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_1.1511, 0
  %7 = add i64 %param_1.1511, 192
  %8 = select i1 %6, i64 %7, i64 %param_1.1511
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_6.637 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg626, i64 0, i64 %.zext13
  %param_6.6375 = load i8, ptr addrspace(1) %param_6.637, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_6.6375, 1
  %12 = getelementptr double, ptr addrspace(1) %arg524, i64 %linear_index
  %param_5.8666 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %13 = select i1 %11, double %param_5.8666, double 0.000000e+00
  %param_3.1204 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg320, i64 0, i64 %.zext13, i64 0
  %param_3.12047 = load double, ptr addrspace(1) %param_3.1204, align 8, !invariant.load !194
  %multiply.3587.9 = fmul double %param_3.12047, 2.000000e+00
  %multiply.3588.11 = fmul double %13, %multiply.3587.9
  %param_4.982 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg422, i64 0, i64 %.zext13
  %param_4.9828 = load double, ptr addrspace(1) %param_4.982, align 8, !invariant.load !194
  %multiply.3589.5 = fmul double %param_4.9828, 5.000000e-01
  %multiply.3590.5 = fmul double %multiply.3588.11, %multiply.3589.5
  %multiply.3533.19 = fmul double %param_3.12047, %param_3.12047
  %multiply.3534.17 = fmul double %multiply.3533.19, 5.000000e-01
  %14 = getelementptr double, ptr addrspace(1) %arg218, i64 %linear_index
  %param_2.12529 = load double, ptr addrspace(1) %14, align 8, !invariant.load !194
  %15 = select i1 %11, double %param_2.12529, double 0.000000e+00
  %multiply.3591.3 = fmul double %multiply.3534.17, %15
  %add.1065.3 = fadd double %multiply.3590.5, %multiply.3591.3
  %16 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg014, i64 0, i64 %10, i64 %.zext, i64 %.zext13
  store double %add.1065.3, ptr addrspace(1) %16, align 8
  br label %dynamic-update-slice.2129.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #2 {
entry:
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index9 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index9, 2400
  br i1 %3, label %dynamic-update-slice.2115.1.in_bounds-true, label %dynamic-update-slice.2115.1.in_bounds-after

dynamic-update-slice.2115.1.in_bounds-after:      ; preds = %dynamic-update-slice.2115.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2115.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index9 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index9 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext11 = zext nneg i16 %.decomposed to i64
  %param_5.819 = load i64, ptr addrspace(1) %arg522, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_5.819, 0
  %7 = add i64 %param_5.819, 192
  %8 = select i1 %6, i64 %7, i64 %param_5.819
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg420, i64 %linear_index
  %param_4.9285 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_3.1141 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg318, i64 0, i64 %.zext11
  %param_3.11416 = load double, ptr addrspace(1) %param_3.1141, align 8, !invariant.load !194
  %multiply.3565.5 = fmul double %param_4.9285, %param_3.11416
  %param_2.1310 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg216, i64 0, i64 %.zext11, i64 0
  %param_2.13107 = load double, ptr addrspace(1) %param_2.1310, align 8, !invariant.load !194
  %12 = getelementptr double, ptr addrspace(1) %arg114, i64 %linear_index
  %param_1.15698 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %multiply.3566.5 = fmul double %param_2.13107, %param_1.15698
  %add.1057.3 = fadd double %multiply.3565.5, %multiply.3566.5
  %13 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %10, i64 %.zext, i64 %.zext11
  store double %add.1057.3, ptr addrspace(1) %13, align 8
  br label %dynamic-update-slice.2115.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg6) local_unnamed_addr #2 {
entry:
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index13 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index13, 2400
  br i1 %3, label %dynamic-update-slice.2126.1.in_bounds-true, label %dynamic-update-slice.2126.1.in_bounds-after

dynamic-update-slice.2126.1.in_bounds-after:      ; preds = %dynamic-update-slice.2126.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2126.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index13 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index13 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext15 = zext nneg i16 %.decomposed to i64
  %param_1.1524 = load i64, ptr addrspace(1) %arg118, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_1.1524, 0
  %7 = add i64 %param_1.1524, 192
  %8 = select i1 %6, i64 %7, i64 %param_1.1524
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_6.632 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg628, i64 0, i64 %.zext15
  %param_6.6325 = load i8, ptr addrspace(1) %param_6.632, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_6.6325, 1
  %12 = getelementptr double, ptr addrspace(1) %arg526, i64 %linear_index
  %param_5.8616 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %13 = select i1 %11, double %param_5.8616, double 0.000000e+00
  %param_2.1378 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg220, i64 0, i64 %.zext15
  %param_2.13787 = load double, ptr addrspace(1) %param_2.1378, align 8, !invariant.load !194
  %multiply.3580.7 = fmul double %13, %param_2.13787
  %param_3.1198 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg322, i64 0, i64 %.zext15, i64 0
  %param_3.11988 = load double, ptr addrspace(1) %param_3.1198, align 8, !invariant.load !194
  %14 = getelementptr double, ptr addrspace(1) %arg424, i64 %linear_index
  %param_4.9789 = load double, ptr addrspace(1) %14, align 8, !invariant.load !194
  %15 = select i1 %11, double %param_4.9789, double 0.000000e+00
  %multiply.3581.7 = fmul double %param_3.11988, %15
  %add.1062.9 = fadd double %multiply.3580.7, %multiply.3581.7
  %multiply.3525.29 = fmul double %param_2.13787, %param_3.11988
  %multiply.3582.7 = fmul double %multiply.3525.29, 2.000000e+00
  %multiply.3583.3 = fmul double %multiply.3582.7, %add.1062.9
  %16 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg016, i64 0, i64 %10, i64 %.zext, i64 %.zext15
  store double %multiply.3583.3, ptr addrspace(1) %16, align 8
  br label %dynamic-update-slice.2126.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_101(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index7 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index7, 2400
  br i1 %3, label %dynamic-update-slice.2127.1.in_bounds-true, label %dynamic-update-slice.2127.1.in_bounds-after

dynamic-update-slice.2127.1.in_bounds-after:      ; preds = %dynamic-update-slice.2127.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2127.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index7 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index7 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext9 = zext nneg i16 %.decomposed to i64
  %param_2.1374 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1374, 0
  %7 = add i64 %param_2.1374, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1374
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_3.1202 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg316, i64 0, i64 %.zext9
  %param_3.12025 = load i8, ptr addrspace(1) %param_3.1202, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_3.12025, 1
  %12 = getelementptr double, ptr addrspace(1) %arg112, i64 %linear_index
  %param_1.16186 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %13 = fmul double %param_1.16186, 2.000000e+00
  %multiply.3624.3 = select i1 %11, double %13, double 0.000000e+00
  %14 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %10, i64 %.zext, i64 %.zext9
  store double %multiply.3624.3, ptr addrspace(1) %14, align 8
  br label %dynamic-update-slice.2127.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_100(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index8 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index8, 2400
  br i1 %3, label %dynamic-update-slice.2128.1.in_bounds-true, label %dynamic-update-slice.2128.1.in_bounds-after

dynamic-update-slice.2128.1.in_bounds-after:      ; preds = %dynamic-update-slice.2128.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2128.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index8 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index8 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext10 = zext nneg i16 %.decomposed to i64
  %param_3.1205 = load i64, ptr addrspace(1) %arg317, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_3.1205, 0
  %7 = add i64 %param_3.1205, 192
  %8 = select i1 %6, i64 %7, i64 %param_3.1205
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_4.983 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg419, i64 0, i64 %.zext10
  %param_4.9835 = load i8, ptr addrspace(1) %param_4.983, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_4.9835, 1
  %12 = getelementptr double, ptr addrspace(1) %arg113, i64 %linear_index
  %param_1.16226 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %13 = select i1 %11, double %param_1.16226, double 0.000000e+00
  %param_2.1384 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg215, i64 0, i64 %.zext10, i64 0
  %param_2.13847 = load double, ptr addrspace(1) %param_2.1384, align 8, !invariant.load !194
  %multiply.3587.5 = fmul double %param_2.13847, 2.000000e+00
  %multiply.3588.9 = fmul double %13, %multiply.3587.5
  %multiply.3625.3 = fmul double %multiply.3588.9, 5.000000e-01
  %14 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %10, i64 %.zext, i64 %.zext10
  store double %multiply.3625.3, ptr addrspace(1) %14, align 8
  br label %dynamic-update-slice.2128.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index8 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index8, 2400
  br i1 %3, label %dynamic-update-slice.2120.1.in_bounds-true, label %dynamic-update-slice.2120.1.in_bounds-after

dynamic-update-slice.2120.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2120.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index8 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index8 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext10 = zext nneg i16 %.decomposed to i64
  %param_1.1552 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_1.1552, 0
  %7 = add i64 %param_1.1552, 192
  %8 = select i1 %6, i64 %7, i64 %param_1.1552
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_4.980 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg419, i64 0, i64 %.zext10
  %param_4.9805 = load i8, ptr addrspace(1) %param_4.980, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_4.9805, 0
  %12 = getelementptr double, ptr addrspace(1) %arg317, i64 %linear_index
  %param_3.11276 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %13 = select i1 %11, double %param_3.11276, double 0.000000e+00
  %param_2.1293 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg215, i64 0, i64 %.zext10
  %param_2.12937 = load double, ptr addrspace(1) %param_2.1293, align 8, !invariant.load !194
  %14 = tail call double @llvm.fma.f64(double %param_2.12937, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %15 = tail call i32 @llvm.nvvm.d2i.lo(double %14) #5
  %16 = tail call double @llvm.nvvm.add.rn.d(double %14, double 0xC338000000000000) #5
  %17 = tail call double @llvm.fma.f64(double %16, double 0xBFE62E42FEFA39EF, double %param_2.12937)
  %18 = tail call double @llvm.fma.f64(double %16, double 0xBC7ABC9E3B39803F, double %17)
  %19 = tail call double @llvm.fma.f64(double %18, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %20 = tail call double @llvm.fma.f64(double %19, double %18, double 0x3EC71DEE62401315)
  %21 = tail call double @llvm.fma.f64(double %20, double %18, double 0x3EFA01997C89EB71)
  %22 = tail call double @llvm.fma.f64(double %21, double %18, double 0x3F2A01A014761F65)
  %23 = tail call double @llvm.fma.f64(double %22, double %18, double 0x3F56C16C1852B7AF)
  %24 = tail call double @llvm.fma.f64(double %23, double %18, double 0x3F81111111122322)
  %25 = tail call double @llvm.fma.f64(double %24, double %18, double 0x3FA55555555502A1)
  %26 = tail call double @llvm.fma.f64(double %25, double %18, double 0x3FC5555555555511)
  %27 = tail call double @llvm.fma.f64(double %26, double %18, double 0x3FE000000000000B)
  %28 = tail call double @llvm.fma.f64(double %27, double %18, double 1.000000e+00)
  %29 = tail call double @llvm.fma.f64(double %28, double %18, double 1.000000e+00)
  %30 = tail call i32 @llvm.nvvm.d2i.lo(double %29) #5
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %29) #5
  %32 = shl i32 %15, 20
  %33 = add i32 %31, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %30, i32 %33) #5
  %35 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.12937) #5
  %36 = bitcast i32 %35 to float
  %37 = tail call float @llvm.nvvm.fabs.f(float %36) #5
  %38 = fcmp olt float %37, 0x4010C46560000000
  br i1 %38, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2120.1.in_bounds-true
  %39 = fcmp olt double %param_2.12937, 0.000000e+00
  %40 = fadd double %param_2.12937, 0x7FF0000000000000
  %z.0.i = select i1 %39, double 0.000000e+00, double %40
  %41 = fcmp olt float %37, 0x4010E90000000000
  br i1 %41, label %42, label %__nv_exp.exit

42:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %43 = sdiv i32 %15, 2
  %44 = shl i32 %43, 20
  %45 = add i32 %31, %44
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 %30, i32 %45) #5
  %47 = sub nsw i32 %15, %43
  %48 = shl i32 %47, 20
  %49 = add nsw i32 %48, 1072693248
  %50 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %49) #5
  %51 = fmul double %50, %46
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2120.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %42
  %z.2.i = phi double [ %34, %dynamic-update-slice.2120.1.in_bounds-true ], [ %51, %42 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3576.3 = fmul double %13, %z.2.i
  %52 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %10, i64 %.zext, i64 %.zext10
  store double %multiply.3576.3, ptr addrspace(1) %52, align 8
  br label %dynamic-update-slice.2120.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_99(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index7 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index7, 2400
  br i1 %3, label %dynamic-update-slice.2123.1.in_bounds-true, label %dynamic-update-slice.2123.1.in_bounds-after

dynamic-update-slice.2123.1.in_bounds-after:      ; preds = %dynamic-update-slice.2123.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.2123.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index7 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index7 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext9 = zext nneg i16 %.decomposed to i64
  %param_2.1369 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_2.1369, 0
  %7 = add i64 %param_2.1369, 192
  %8 = select i1 %6, i64 %7, i64 %param_2.1369
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %param_3.1203 = getelementptr inbounds [20 x i8], ptr addrspace(1) %arg316, i64 0, i64 %.zext9
  %param_3.12035 = load i8, ptr addrspace(1) %param_3.1203, align 1, !invariant.load !194
  %11 = icmp eq i8 %param_3.12035, 1
  %12 = getelementptr double, ptr addrspace(1) %arg112, i64 %linear_index
  %param_1.15406 = load double, ptr addrspace(1) %12, align 8, !invariant.load !194
  %13 = select i1 %11, double %param_1.15406, double 0.000000e+00
  %14 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %10, i64 %.zext, i64 %.zext9
  store double %13, ptr addrspace(1) %14, align 8
  br label %dynamic-update-slice.2123.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_37(ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !201
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index7 = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index7, 2400
  br i1 %3, label %dynamic-update-slice.2088.1.in_bounds-true, label %dynamic-update-slice.2088.1.in_bounds-after

dynamic-update-slice.2088.1.in_bounds-after:      ; preds = %__nv_exp.exit, %entry
  ret void

dynamic-update-slice.2088.1.in_bounds-true:       ; preds = %entry
  %linear_index = zext nneg i32 %linear_index7 to i64
  %.lhs.trunc = trunc nuw nsw i32 %linear_index7 to i16
  %4 = udiv i16 %.lhs.trunc, 20
  %.zext = zext nneg i16 %4 to i64
  %5 = mul i16 %4, 20
  %.decomposed = sub i16 %.lhs.trunc, %5
  %.zext9 = zext nneg i16 %.decomposed to i64
  %param_1.1547 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !194
  %6 = icmp slt i64 %param_1.1547, 0
  %7 = add i64 %param_1.1547, 192
  %8 = select i1 %6, i64 %7, i64 %param_1.1547
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 191)
  %11 = getelementptr double, ptr addrspace(1) %arg214, i64 %linear_index
  %param_2.12885 = load double, ptr addrspace(1) %11, align 8, !invariant.load !194
  %param_3.1123 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg316, i64 0, i64 %.zext9
  %param_3.11236 = load double, ptr addrspace(1) %param_3.1123, align 8, !invariant.load !194
  %12 = tail call double @llvm.fma.f64(double %param_3.11236, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #5
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #5
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %param_3.11236)
  %16 = tail call double @llvm.fma.f64(double %14, double 0xBC7ABC9E3B39803F, double %15)
  %17 = tail call double @llvm.fma.f64(double %16, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %18 = tail call double @llvm.fma.f64(double %17, double %16, double 0x3EC71DEE62401315)
  %19 = tail call double @llvm.fma.f64(double %18, double %16, double 0x3EFA01997C89EB71)
  %20 = tail call double @llvm.fma.f64(double %19, double %16, double 0x3F2A01A014761F65)
  %21 = tail call double @llvm.fma.f64(double %20, double %16, double 0x3F56C16C1852B7AF)
  %22 = tail call double @llvm.fma.f64(double %21, double %16, double 0x3F81111111122322)
  %23 = tail call double @llvm.fma.f64(double %22, double %16, double 0x3FA55555555502A1)
  %24 = tail call double @llvm.fma.f64(double %23, double %16, double 0x3FC5555555555511)
  %25 = tail call double @llvm.fma.f64(double %24, double %16, double 0x3FE000000000000B)
  %26 = tail call double @llvm.fma.f64(double %25, double %16, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %16, double 1.000000e+00)
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #5
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #5
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #5
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %param_3.11236) #5
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #5
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %dynamic-update-slice.2088.1.in_bounds-true
  %37 = fcmp olt double %param_3.11236, 0.000000e+00
  %38 = fadd double %param_3.11236, 0x7FF0000000000000
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #5
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #5
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %dynamic-update-slice.2088.1.in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %dynamic-update-slice.2088.1.in_bounds-true ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3561.3 = fmul double %param_2.12885, %z.2.i
  %50 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %10, i64 %.zext, i64 %.zext9
  store double %multiply.3561.3, ptr addrspace(1) %50, align 8
  br label %dynamic-update-slice.2088.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture align 128 dereferenceable(8) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128
  %1 = add i64 %0, 1
  store i64 %1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @copy_fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg7) local_unnamed_addr #3 {
entry:
  %arg720 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg618 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg516 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg414 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !202
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !193
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2632
  br i1 %3, label %concatenate.pivot.40., label %copy_fusion.7.in_bounds-after

copy_fusion.7.in_bounds-after:                    ; preds = %slice2-after, %slice3-true, %entry
  ret void

concatenate.pivot.40.:                            ; preds = %entry
  %4 = icmp ult i32 %linear_index, 40
  br i1 %4, label %concatenate.pivot.20., label %concatenate.pivot.232.

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.40.
  %5 = icmp ult i32 %linear_index, 20
  br i1 %5, label %concatenate.pivot.0., label %concatenate.pivot.20.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.20.
  %6 = zext nneg i32 %linear_index to i64
  %7 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg06, i64 0, i64 %6, i64 0
  br label %concatenate.3.merge

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.20.
  %8 = add nsw i32 %linear_index, -20
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg18, i64 0, i64 %9, i64 0
  br label %concatenate.3.merge

concatenate.pivot.232.:                           ; preds = %concatenate.pivot.40.
  %11 = icmp ult i32 %linear_index, 232
  br i1 %11, label %concatenate.pivot.40.2, label %concatenate.pivot.232.3

concatenate.pivot.40.2:                           ; preds = %concatenate.pivot.232.
  %12 = add nsw i32 %linear_index, -40
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg210, i64 0, i64 %13
  br label %concatenate.3.merge

concatenate.pivot.232.3:                          ; preds = %concatenate.pivot.232.
  %15 = trunc nuw nsw i32 %linear_index to i16
  %.lhs.trunc = add nsw i16 %15, -232
  %16 = udiv i16 %.lhs.trunc, 20
  %17 = mul i16 %16, 20
  %.decomposed = sub i16 %.lhs.trunc, %17
  %18 = zext nneg i16 %16 to i64
  %19 = zext nneg i16 %.decomposed to i64
  %20 = getelementptr inbounds [120 x [20 x [1 x double]]], ptr addrspace(1) %arg312, i64 0, i64 %18, i64 %19, i64 0
  br label %concatenate.3.merge

concatenate.3.merge:                              ; preds = %concatenate.pivot.232.3, %concatenate.pivot.40.2, %concatenate.pivot.20.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %7, %concatenate.pivot.0. ], [ %10, %concatenate.pivot.20.1 ], [ %14, %concatenate.pivot.40.2 ], [ %20, %concatenate.pivot.232.3 ]
  %21 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !194
  %22 = icmp ult i32 %linear_index, 20
  %23 = zext nneg i32 %linear_index to i64
  %24 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg414, i64 0, i64 %23
  br i1 %22, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.3.merge
  %25 = add nsw i32 %linear_index, -20
  %26 = icmp ult i32 %25, 20
  %27 = zext nneg i32 %25 to i64
  %28 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg516, i64 0, i64 %27
  br i1 %26, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %29 = add nsw i32 %linear_index, -40
  %30 = icmp ult i32 %29, 192
  %31 = zext nneg i32 %29 to i64
  %32 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg618, i64 0, i64 %31
  br i1 %30, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %33 = icmp ugt i32 %linear_index, 231
  %34 = add nsw i32 %linear_index, -232
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds [2400 x double], ptr addrspace(1) %arg720, i64 0, i64 %35
  br i1 %33, label %slice3-true, label %copy_fusion.7.in_bounds-after

slice0-true:                                      ; preds = %concatenate.3.merge
  store double %21, ptr addrspace(1) %24, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double %21, ptr addrspace(1) %28, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double %21, ptr addrspace(1) %32, align 8
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  store double %21, ptr addrspace(1) %36, align 8
  br label %copy_fusion.7.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.lo(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.add.rn.d(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.hi(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.lohi.i2d(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.f(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f64(double, i32 immarg) #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188}
!llvm.ident = !{!189}
!nvvmir.version = !{!190}
!llvm.module.flags = !{!191}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{ptr @copy_fusion_13, !"kernel", i32 1}
!3 = !{ptr @copy_fusion_13, !"reqntidx", i32 128}
!4 = !{ptr @input_slice_fusion_1, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion_1, !"reqntidx", i32 128}
!6 = !{ptr @input_slice_fusion_2, !"kernel", i32 1}
!7 = !{ptr @input_slice_fusion_2, !"reqntidx", i32 128}
!8 = !{ptr @loop_broadcast_fusion_2, !"kernel", i32 1}
!9 = !{ptr @loop_broadcast_fusion_2, !"reqntidx", i32 256}
!10 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!11 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!12 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_convert_dynamic_slice_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_convert_dynamic_slice_fusion, !"reqntidx", i32 1}
!16 = !{ptr @loop_divide_multiply_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 20}
!18 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_divide_fusion, !"reqntidx", i32 20}
!20 = !{ptr @loop_dynamic_update_slice_fusion_103, !"kernel", i32 1}
!21 = !{ptr @loop_dynamic_update_slice_fusion_103, !"reqntidx", i32 1}
!22 = !{ptr @loop_dynamic_update_slice_fusion_78, !"kernel", i32 1}
!23 = !{ptr @loop_dynamic_update_slice_fusion_78, !"reqntidx", i32 1}
!24 = !{ptr @loop_dynamic_update_slice_fusion_85, !"kernel", i32 1}
!25 = !{ptr @loop_dynamic_update_slice_fusion_85, !"reqntidx", i32 20}
!26 = !{ptr @loop_dynamic_update_slice_fusion_93, !"kernel", i32 1}
!27 = !{ptr @loop_dynamic_update_slice_fusion_93, !"reqntidx", i32 20}
!28 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!29 = !{ptr @loop_add_fusion, !"reqntidx", i32 20}
!30 = !{ptr @loop_add_fusion, !"reqntidy", i32 7}
!31 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!32 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 128}
!33 = !{ptr @loop_dynamic_update_slice_fusion_84, !"kernel", i32 1}
!34 = !{ptr @loop_dynamic_update_slice_fusion_84, !"reqntidx", i32 20}
!35 = !{ptr @loop_dynamic_update_slice_fusion_82, !"kernel", i32 1}
!36 = !{ptr @loop_dynamic_update_slice_fusion_82, !"reqntidx", i32 20}
!37 = !{ptr @loop_dynamic_update_slice_fusion_77, !"kernel", i32 1}
!38 = !{ptr @loop_dynamic_update_slice_fusion_77, !"reqntidx", i32 20}
!39 = !{ptr @loop_dynamic_update_slice_fusion_80, !"kernel", i32 1}
!40 = !{ptr @loop_dynamic_update_slice_fusion_80, !"reqntidx", i32 20}
!41 = !{ptr @loop_dynamic_update_slice_fusion_76, !"kernel", i32 1}
!42 = !{ptr @loop_dynamic_update_slice_fusion_76, !"reqntidx", i32 20}
!43 = !{ptr @loop_dynamic_update_slice_fusion_67, !"kernel", i32 1}
!44 = !{ptr @loop_dynamic_update_slice_fusion_67, !"reqntidx", i32 20}
!45 = !{ptr @loop_dynamic_update_slice_fusion_83, !"kernel", i32 1}
!46 = !{ptr @loop_dynamic_update_slice_fusion_83, !"reqntidx", i32 20}
!47 = !{ptr @loop_dynamic_update_slice_fusion_86, !"kernel", i32 1}
!48 = !{ptr @loop_dynamic_update_slice_fusion_86, !"reqntidx", i32 20}
!49 = !{ptr @loop_dynamic_update_slice_fusion_44, !"kernel", i32 1}
!50 = !{ptr @loop_dynamic_update_slice_fusion_44, !"reqntidx", i32 20}
!51 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!52 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 20}
!53 = !{ptr @loop_dynamic_update_slice_fusion_102, !"kernel", i32 1}
!54 = !{ptr @loop_dynamic_update_slice_fusion_102, !"reqntidx", i32 20}
!55 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!56 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 20}
!57 = !{ptr @loop_dynamic_update_slice_fusion_60, !"kernel", i32 1}
!58 = !{ptr @loop_dynamic_update_slice_fusion_60, !"reqntidx", i32 20}
!59 = !{ptr @loop_dynamic_update_slice_fusion_88, !"kernel", i32 1}
!60 = !{ptr @loop_dynamic_update_slice_fusion_88, !"reqntidx", i32 20}
!61 = !{ptr @loop_dynamic_update_slice_fusion_91, !"kernel", i32 1}
!62 = !{ptr @loop_dynamic_update_slice_fusion_91, !"reqntidx", i32 20}
!63 = !{ptr @loop_dynamic_update_slice_fusion_94, !"kernel", i32 1}
!64 = !{ptr @loop_dynamic_update_slice_fusion_94, !"reqntidx", i32 20}
!65 = !{ptr @loop_add_divide_exponential_fusion, !"kernel", i32 1}
!66 = !{ptr @loop_add_divide_exponential_fusion, !"reqntidx", i32 20}
!67 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!68 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!69 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!70 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 20}
!71 = !{ptr @wrapped_convert, !"kernel", i32 1}
!72 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!73 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!74 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 20}
!75 = !{ptr @loop_compare_multiply_select_fusion, !"kernel", i32 1}
!76 = !{ptr @loop_compare_multiply_select_fusion, !"reqntidx", i32 20}
!77 = !{ptr @loop_broadcast_select_fusion, !"kernel", i32 1}
!78 = !{ptr @loop_broadcast_select_fusion, !"reqntidx", i32 128}
!79 = !{ptr @loop_dynamic_update_slice_fusion_74, !"kernel", i32 1}
!80 = !{ptr @loop_dynamic_update_slice_fusion_74, !"reqntidx", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_70, !"kernel", i32 1}
!82 = !{ptr @loop_dynamic_update_slice_fusion_70, !"reqntidx", i32 20}
!83 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!84 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 128}
!85 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!86 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 128}
!87 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!88 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 128}
!89 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!90 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 128}
!91 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!92 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 128}
!93 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!94 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 128}
!95 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!96 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 128}
!97 = !{ptr @loop_dynamic_update_slice_fusion_32, !"kernel", i32 1}
!98 = !{ptr @loop_dynamic_update_slice_fusion_32, !"reqntidx", i32 128}
!99 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!100 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 128}
!101 = !{ptr @loop_dynamic_update_slice_fusion_98, !"kernel", i32 1}
!102 = !{ptr @loop_dynamic_update_slice_fusion_98, !"reqntidx", i32 128}
!103 = !{ptr @loop_add_and_compare_divide_multiply_select_fusion, !"kernel", i32 1}
!104 = !{ptr @loop_add_and_compare_divide_multiply_select_fusion, !"reqntidx", i32 20}
!105 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!106 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 20}
!107 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!108 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 20}
!109 = !{ptr @loop_dynamic_update_slice_fusion_49, !"kernel", i32 1}
!110 = !{ptr @loop_dynamic_update_slice_fusion_49, !"reqntidx", i32 20}
!111 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!112 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 20}
!113 = !{ptr @loop_dynamic_update_slice_fusion_52, !"kernel", i32 1}
!114 = !{ptr @loop_dynamic_update_slice_fusion_52, !"reqntidx", i32 20}
!115 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!116 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 20}
!117 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!118 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 20}
!119 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!120 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 20}
!121 = !{ptr @loop_dynamic_update_slice_fusion_57, !"kernel", i32 1}
!122 = !{ptr @loop_dynamic_update_slice_fusion_57, !"reqntidx", i32 20}
!123 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!124 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 20}
!125 = !{ptr @loop_dynamic_update_slice_fusion_65, !"kernel", i32 1}
!126 = !{ptr @loop_dynamic_update_slice_fusion_65, !"reqntidx", i32 20}
!127 = !{ptr @loop_dynamic_update_slice_fusion_62, !"kernel", i32 1}
!128 = !{ptr @loop_dynamic_update_slice_fusion_62, !"reqntidx", i32 20}
!129 = !{ptr @loop_dynamic_update_slice_fusion_63, !"kernel", i32 1}
!130 = !{ptr @loop_dynamic_update_slice_fusion_63, !"reqntidx", i32 20}
!131 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!132 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 20}
!133 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!134 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 20}
!135 = !{ptr @loop_dynamic_update_slice_fusion_58, !"kernel", i32 1}
!136 = !{ptr @loop_dynamic_update_slice_fusion_58, !"reqntidx", i32 20}
!137 = !{ptr @loop_dynamic_update_slice_fusion_47, !"kernel", i32 1}
!138 = !{ptr @loop_dynamic_update_slice_fusion_47, !"reqntidx", i32 20}
!139 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!140 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 128}
!141 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!142 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 128}
!143 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!144 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 128}
!145 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!146 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 128}
!147 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!148 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 128}
!149 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!150 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 128}
!151 = !{ptr @loop_dynamic_update_slice_fusion_36, !"kernel", i32 1}
!152 = !{ptr @loop_dynamic_update_slice_fusion_36, !"reqntidx", i32 128}
!153 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!154 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 128}
!155 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!156 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 128}
!157 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!158 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 128}
!159 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!160 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 128}
!161 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!162 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 128}
!163 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!164 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 128}
!165 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!166 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 128}
!167 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!168 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 128}
!169 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!170 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 128}
!171 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!172 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 128}
!173 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!174 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 128}
!175 = !{ptr @loop_dynamic_update_slice_fusion_101, !"kernel", i32 1}
!176 = !{ptr @loop_dynamic_update_slice_fusion_101, !"reqntidx", i32 128}
!177 = !{ptr @loop_dynamic_update_slice_fusion_100, !"kernel", i32 1}
!178 = !{ptr @loop_dynamic_update_slice_fusion_100, !"reqntidx", i32 128}
!179 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!180 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 128}
!181 = !{ptr @loop_dynamic_update_slice_fusion_99, !"kernel", i32 1}
!182 = !{ptr @loop_dynamic_update_slice_fusion_99, !"reqntidx", i32 128}
!183 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!184 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 128}
!185 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!186 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!187 = !{ptr @copy_fusion_7, !"kernel", i32 1}
!188 = !{ptr @copy_fusion_7, !"reqntidx", i32 128}
!189 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!190 = !{i32 2, i32 0}
!191 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!192 = !{i32 0, i32 60}
!193 = !{i32 0, i32 128}
!194 = !{}
!195 = !{i32 0, i32 32}
!196 = !{i32 0, i32 450}
!197 = !{i32 0, i32 256}
!198 = !{i32 0, i32 20}
!199 = !{i32 0, i32 18}
!200 = !{i32 0, i32 7}
!201 = !{i32 0, i32 19}
!202 = !{i32 0, i32 21}
