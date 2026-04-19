; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_35_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1881_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1880_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1879_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00\00\00\00\F0\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_1878_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1786_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1739_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1738_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1691_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1678_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [1 x [2 x double]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@buffer_for_constant_6721_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_9121_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_9114_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_9113_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(10) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(10) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  %3 = getelementptr i8, ptr addrspace(1) %arg13, i64 %1
  store i8 0, ptr addrspace(1) %3, align 1
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !295
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 0, ptr addrspace(1) %2, align 8
  %3 = getelementptr i64, ptr addrspace(1) %arg13, i64 %1
  store i64 0, ptr addrspace(1) %3, align 8
  %4 = getelementptr i64, ptr addrspace(1) %arg25, i64 %1
  store i64 0, ptr addrspace(1) %4, align 8
  %5 = getelementptr i64, ptr addrspace(1) %arg37, i64 %1
  store i64 0, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !296
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !297
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 290
  br i1 %3, label %concatenate.pivot.10., label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %slice2-true, %entry
  ret void

concatenate.pivot.10.:                            ; preds = %entry
  %4 = icmp ult i32 %linear_index, 10
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg05, i64 0, i64 %5
  br i1 %4, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.pivot.10.
  %7 = add nsw i32 %linear_index, -10
  %8 = icmp ult i32 %7, 40
  %9 = zext nneg i32 %7 to i64
  %10 = getelementptr inbounds [40 x double], ptr addrspace(1) %arg17, i64 0, i64 %9
  br i1 %8, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %11 = icmp ugt i32 %linear_index, 49
  %12 = add nsw i32 %linear_index, -50
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [240 x double], ptr addrspace(1) %arg29, i64 0, i64 %13
  br i1 %11, label %slice2-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.pivot.10.
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %10, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double 0.000000e+00, ptr addrspace(1) %14, align 8
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_transpose(ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !298
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !297
  %linear_index = or disjoint i32 %1, %2
  %3 = lshr i32 %linear_index, 2
  %4 = and i32 %2, 3
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %3 to i64
  %7 = getelementptr inbounds [4 x [192 x i32]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 %6
  %8 = load i32, ptr addrspace(1) %7, align 4, !invariant.load !299
  %9 = zext nneg i32 %linear_index to i64
  %10 = getelementptr i32, ptr addrspace(1) %arg13, i64 %9
  store i32 %8, ptr addrspace(1) %10, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_transpose_1(ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !298
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !297
  %linear_index = or disjoint i32 %1, %2
  %3 = lshr i32 %linear_index, 2
  %4 = and i32 %2, 3
  %5 = zext nneg i32 %4 to i64
  %6 = zext nneg i32 %3 to i64
  %7 = getelementptr inbounds [4 x [192 x float]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 %6
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !299
  %9 = zext nneg i32 %linear_index to i64
  %10 = getelementptr float, ptr addrspace(1) %arg13, i64 %9
  store float %8, ptr addrspace(1) %10, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %1 = icmp slt i64 %0, 10
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_clamp_convert_fusion(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !299
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 10
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 9)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr [10 x [2 x i64]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 0
  %9 = load <2 x i64>, ptr addrspace(1) %8, align 16, !invariant.load !299
  %10 = extractelement <2 x i64> %9, i32 0
  %11 = extractelement <2 x i64> %9, i32 1
  %12 = icmp ne i64 %11, 0
  %13 = zext i1 %12 to i32
  %14 = trunc i64 %10 to i32
  %15 = icmp sgt i32 %14, 0
  %16 = zext i1 %15 to i32
  store i32 %13, ptr addrspace(1) %arg212, align 128
  store i32 %16, ptr addrspace(1) %arg314, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg3173 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2171 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1169 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0167 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !300
  %1 = or disjoint i32 %0, 2
  %2 = load i64, ptr addrspace(1) %arg1169, align 128, !invariant.load !299
  %3 = icmp slt i64 %2, 0
  %4 = add i64 %2, 10
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 9)
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [10 x [2 x i32]], ptr addrspace(1) %arg0167, i64 0, i64 %9, i64 0
  %11 = load <2 x i32>, ptr addrspace(1) %10, align 8, !invariant.load !299
  %12 = extractelement <2 x i32> %11, i32 0
  %13 = extractelement <2 x i32> %11, i32 1
  %14 = add i32 %12, %0
  %15 = add i32 %13, %1
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 13)
  %18 = xor i32 %16, %17
  %19 = add i32 %18, %16
  %20 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %18, i32 15)
  %21 = xor i32 %19, %20
  %22 = add i32 %21, %19
  %23 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %21, i32 26)
  %24 = xor i32 %22, %23
  %25 = add i32 %24, %22
  %26 = add i32 %25, %13
  %27 = tail call i32 @llvm.fshl.i32(i32 %24, i32 %24, i32 6)
  %28 = xor i32 %25, %27
  %29 = xor i32 %12, %13
  %30 = xor i32 %29, 466688986
  %31 = add i32 %30, 1
  %32 = add i32 %31, %28
  %33 = add i32 %26, %32
  %34 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %32, i32 17)
  %35 = xor i32 %33, %34
  %36 = add i32 %35, %33
  %37 = tail call i32 @llvm.fshl.i32(i32 %35, i32 %35, i32 29)
  %38 = xor i32 %36, %37
  %39 = add i32 %38, %36
  %40 = tail call i32 @llvm.fshl.i32(i32 %38, i32 %38, i32 16)
  %41 = xor i32 %39, %40
  %42 = add i32 %41, %39
  %43 = add i32 %42, %30
  %44 = tail call i32 @llvm.fshl.i32(i32 %41, i32 %41, i32 24)
  %45 = xor i32 %42, %44
  %46 = add i32 %12, 2
  %47 = add i32 %46, %45
  %48 = add i32 %43, %47
  %49 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 13)
  %50 = xor i32 %48, %49
  %51 = add i32 %50, %48
  %52 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 15)
  %53 = xor i32 %51, %52
  %54 = add i32 %53, %51
  %55 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %53, i32 26)
  %56 = xor i32 %54, %55
  %57 = add i32 %56, %54
  %58 = add i32 %57, %12
  %59 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 6)
  %60 = xor i32 %57, %59
  %61 = add i32 %13, 3
  %62 = add i32 %61, %60
  %63 = add i32 %58, %62
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 17)
  %65 = xor i32 %63, %64
  %66 = add i32 %65, %63
  %67 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 29)
  %68 = xor i32 %66, %67
  %69 = add i32 %68, %66
  %70 = tail call i32 @llvm.fshl.i32(i32 %68, i32 %68, i32 16)
  %71 = xor i32 %69, %70
  %72 = add i32 %71, %69
  %73 = add i32 %72, %13
  %74 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %71, i32 24)
  %75 = xor i32 %72, %74
  %76 = add i32 %30, 4
  %77 = add i32 %76, %75
  %78 = add i32 %73, %77
  %79 = tail call i32 @llvm.fshl.i32(i32 %77, i32 %77, i32 13)
  %80 = xor i32 %78, %79
  %81 = add i32 %80, %78
  %82 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 15)
  %83 = xor i32 %81, %82
  %84 = add i32 %83, %81
  %85 = tail call i32 @llvm.fshl.i32(i32 %83, i32 %83, i32 26)
  %86 = xor i32 %84, %85
  %87 = add i32 %86, %84
  %88 = tail call i32 @llvm.fshl.i32(i32 %86, i32 %86, i32 6)
  %89 = xor i32 %87, %88
  %90 = add i32 %12, 5
  %91 = add i32 %90, %89
  %92 = add i32 %87, %30
  %93 = zext nneg i32 %0 to i64
  %94 = getelementptr i32, ptr addrspace(1) %arg2171, i64 %93
  store i32 %91, ptr addrspace(1) %94, align 4
  %95 = getelementptr i32, ptr addrspace(1) %arg3173, i64 %93
  store i32 %92, ptr addrspace(1) %95, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg2) local_unnamed_addr #2 {
entry:
  %arg247 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg145 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg043 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg145, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !299
  %4 = load <2 x i32>, ptr addrspace(1) %arg043, align 128, !invariant.load !299
  %5 = extractelement <2 x i32> %4, i32 0
  %6 = extractelement <2 x i32> %4, i32 1
  %7 = add i32 %5, %0
  %8 = add nuw nsw i32 %0, 24
  %9 = add i32 %8, %6
  %10 = add i32 %7, %9
  %11 = tail call i32 @llvm.fshl.i32(i32 %9, i32 %9, i32 13)
  %12 = xor i32 %10, %11
  %13 = add i32 %12, %10
  %14 = tail call i32 @llvm.fshl.i32(i32 %12, i32 %12, i32 15)
  %15 = xor i32 %13, %14
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 26)
  %18 = xor i32 %16, %17
  %19 = add i32 %18, %16
  %20 = add i32 %19, %6
  %21 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %18, i32 6)
  %22 = xor i32 %19, %21
  %23 = xor i32 %5, %6
  %24 = xor i32 %23, 466688986
  %25 = add i32 %24, 1
  %26 = add i32 %25, %22
  %27 = add i32 %20, %26
  %28 = tail call i32 @llvm.fshl.i32(i32 %26, i32 %26, i32 17)
  %29 = xor i32 %27, %28
  %30 = add i32 %29, %27
  %31 = tail call i32 @llvm.fshl.i32(i32 %29, i32 %29, i32 29)
  %32 = xor i32 %30, %31
  %33 = add i32 %32, %30
  %34 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %32, i32 16)
  %35 = xor i32 %33, %34
  %36 = add i32 %35, %33
  %37 = add i32 %36, %24
  %38 = tail call i32 @llvm.fshl.i32(i32 %35, i32 %35, i32 24)
  %39 = xor i32 %36, %38
  %40 = add i32 %5, 2
  %41 = add i32 %40, %39
  %42 = add i32 %37, %41
  %43 = tail call i32 @llvm.fshl.i32(i32 %41, i32 %41, i32 13)
  %44 = xor i32 %42, %43
  %45 = add i32 %44, %42
  %46 = tail call i32 @llvm.fshl.i32(i32 %44, i32 %44, i32 15)
  %47 = xor i32 %45, %46
  %48 = add i32 %47, %45
  %49 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 26)
  %50 = xor i32 %48, %49
  %51 = add i32 %50, %48
  %52 = add i32 %51, %5
  %53 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 6)
  %54 = xor i32 %51, %53
  %55 = add i32 %6, 3
  %56 = add i32 %55, %54
  %57 = add i32 %52, %56
  %58 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 17)
  %59 = xor i32 %57, %58
  %60 = add i32 %59, %57
  %61 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 29)
  %62 = xor i32 %60, %61
  %63 = add i32 %62, %60
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 16)
  %65 = xor i32 %63, %64
  %66 = add i32 %65, %63
  %67 = add i32 %66, %6
  %68 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 24)
  %69 = xor i32 %66, %68
  %70 = add i32 %24, 4
  %71 = add i32 %70, %69
  %72 = add i32 %67, %71
  %73 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %71, i32 13)
  %74 = xor i32 %72, %73
  %75 = add i32 %74, %72
  %76 = tail call i32 @llvm.fshl.i32(i32 %74, i32 %74, i32 15)
  %77 = xor i32 %75, %76
  %78 = add i32 %77, %75
  %79 = tail call i32 @llvm.fshl.i32(i32 %77, i32 %77, i32 26)
  %80 = xor i32 %78, %79
  %81 = add i32 %80, %78
  %82 = add i32 %81, %24
  %83 = zext i32 %82 to i64
  %84 = shl nuw i64 %83, 32
  %85 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 6)
  %86 = xor i32 %81, %85
  %87 = add i32 %5, 5
  %88 = add i32 %87, %86
  %89 = zext i32 %88 to i64
  %90 = or disjoint i64 %84, %89
  %91 = lshr i64 %90, 12
  %92 = or disjoint i64 %91, 4607182418800017408
  %93 = bitcast i64 %92 to double
  %add.4161.7 = fadd double %93, -1.000000e+00
  %multiply.2984.5 = fmul double %add.4161.7, 2.000000e+00
  %add.4162.3 = fadd double %multiply.2984.5, 0xBFEFFFFFFFFFFFFF
  %94 = fcmp ugt double %add.4162.3, 0xBFEFFFFFFFFFFFFF
  %maximum.44.3 = select i1 %94, double %add.4162.3, double 0xBFEFFFFFFFFFFFFF
  %95 = fneg double %maximum.44.3
  %multiply.2986.5 = fmul double %maximum.44.3, %95
  %96 = tail call i32 @llvm.nvvm.d2i.hi(double %multiply.2986.5) #13
  %97 = bitcast i32 %96 to float
  %98 = fcmp olt float %97, 0x3FFCAAAAA0000000
  %99 = fcmp ogt float %97, 0xBFFB333320000000
  %or.cond.i = and i1 %98, %99
  br i1 %or.cond.i, label %100, label %117

100:                                              ; preds = %entry
  %101 = fadd double %multiply.2986.5, 2.000000e+00
  %102 = fdiv double %multiply.2986.5, %101
  %103 = fneg double %multiply.2986.5
  %104 = fmul double %102, %103
  %105 = fadd double %multiply.2986.5, %104
  %106 = fmul double %105, %105
  %107 = tail call double @llvm.fma.f64(double %106, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %108 = tail call double @llvm.fma.f64(double %107, double %106, double 0x3EF3B9FF890F468C)
  %109 = tail call double @llvm.fma.f64(double %108, double %106, double 0x3F17457EFD51BAF8)
  %110 = tail call double @llvm.fma.f64(double %109, double %106, double 0x3F3C71C8DE3CE825)
  %111 = tail call double @llvm.fma.f64(double %110, double %106, double 0x3F6249248FA4661F)
  %112 = tail call double @llvm.fma.f64(double %111, double %106, double 0x3F899999999D70C4)
  %113 = tail call double @llvm.fma.f64(double %112, double %106, double 0x3FB5555555555462)
  %114 = fmul double %106, %113
  %115 = tail call double @llvm.fma.f64(double %114, double %105, double %104)
  %116 = fadd double %multiply.2986.5, %115
  br label %__nv_log1p.exit

117:                                              ; preds = %entry
  %118 = fadd double %multiply.2986.5, 1.000000e+00
  %119 = tail call i32 @llvm.nvvm.d2i.hi(double %118) #13
  %120 = tail call i32 @llvm.nvvm.d2i.lo(double %118) #13
  %121 = icmp slt i32 %119, 1048576
  %122 = fmul double %118, 0x4350000000000000
  %123 = tail call i32 @llvm.nvvm.d2i.lo(double %122) #13
  %124 = tail call i32 @llvm.nvvm.d2i.hi(double %122) #13
  br i1 %121, label %125, label %126

125:                                              ; preds = %117
  br label %126

126:                                              ; preds = %125, %117
  %.0.i = phi double [ %122, %125 ], [ %118, %117 ]
  %ihi.i.0.i = phi i32 [ %124, %125 ], [ %119, %117 ]
  %ilo.i.0.i = phi i32 [ %123, %125 ], [ %120, %117 ]
  %e.i.0.i = phi i32 [ -1077, %125 ], [ -1023, %117 ]
  %127 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %127, 2146435071
  br i1 %or.cond2.i, label %128, label %175

128:                                              ; preds = %126
  %129 = lshr i32 %ihi.i.0.i, 20
  %130 = add nsw i32 %e.i.0.i, %129
  %131 = and i32 %ihi.i.0.i, 1048575
  %132 = or disjoint i32 %131, 1072693248
  %133 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %132) #13
  %134 = icmp ugt i32 %132, 1073127582
  %135 = tail call i32 @llvm.nvvm.d2i.lo(double %133) #13
  %136 = tail call i32 @llvm.nvvm.d2i.hi(double %133) #13
  %137 = add i32 %136, -1048576
  %138 = tail call double @llvm.nvvm.lohi.i2d(i32 %135, i32 %137) #13
  %spec.select = select i1 %134, double %138, double %133
  %139 = zext i1 %134 to i32
  %spec.select42 = add nsw i32 %130, %139
  %140 = fadd double %spec.select, -1.000000e+00
  %141 = fadd double %spec.select, 1.000000e+00
  %142 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %141) #13
  %143 = fneg double %141
  %144 = tail call double @llvm.fma.f64(double %143, double %142, double 1.000000e+00)
  %145 = tail call double @llvm.fma.f64(double %144, double %144, double %144)
  %146 = tail call double @llvm.fma.f64(double %145, double %142, double %142)
  %147 = fmul double %140, %146
  %148 = fadd double %147, %147
  %149 = fmul double %148, %148
  %150 = tail call double @llvm.fma.f64(double %149, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %151 = tail call double @llvm.fma.f64(double %150, double %149, double 0x3EF3B2669F02676F)
  %152 = tail call double @llvm.fma.f64(double %151, double %149, double 0x3F1745CBA9AB0956)
  %153 = tail call double @llvm.fma.f64(double %152, double %149, double 0x3F3C71C72D1B5154)
  %154 = tail call double @llvm.fma.f64(double %153, double %149, double 0x3F624924923BE72D)
  %155 = tail call double @llvm.fma.f64(double %154, double %149, double 0x3F8999999999A3C4)
  %156 = tail call double @llvm.fma.f64(double %155, double %149, double 0x3FB5555555555554)
  %157 = fsub double %140, %148
  %158 = fmul double %157, 2.000000e+00
  %159 = fneg double %148
  %160 = tail call double @llvm.fma.f64(double %159, double %140, double %158)
  %161 = fmul double %146, %160
  %162 = fmul double %149, %156
  %163 = tail call double @llvm.fma.f64(double %162, double %148, double %161)
  %164 = xor i32 %spec.select42, -2147483648
  %165 = tail call double @llvm.nvvm.lohi.i2d(i32 %164, i32 1127219200) #13
  %166 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %167 = fsub double %165, %166
  %168 = tail call double @llvm.fma.f64(double %167, double 0x3FE62E42FEFA39EF, double %148)
  %169 = fneg double %167
  %170 = tail call double @llvm.fma.f64(double %169, double 0x3FE62E42FEFA39EF, double %168)
  %171 = fsub double %170, %148
  %172 = fsub double %163, %171
  %173 = tail call double @llvm.fma.f64(double %167, double 0x3C7ABC9E3B39803F, double %172)
  %174 = fadd double %168, %173
  br label %__nv_log1p.exit

175:                                              ; preds = %126
  %176 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %177 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %178 = and i32 %177, 2147483647
  %179 = icmp eq i32 %178, 0
  %q.i.0.i = select i1 %179, double 0xFFF0000000000000, double %176
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %100, %128, %175
  %t.0.i = phi double [ %116, %100 ], [ %174, %128 ], [ %q.i.0.i, %175 ]
  %180 = fcmp ugt double %add.4162.3, 0xBFEFFFFFFFFFFFFF
  %181 = tail call double @llvm.fabs.f64(double %add.4162.3)
  %182 = fcmp oeq double %181, 1.000000e+00
  %compare.665.3 = and i1 %180, %182
  %183 = tail call double @llvm.nvvm.rsqrt.approx.d(double %3)
  %184 = fneg double %t.0.i
  %compare.666.25 = fcmp ogt double %t.0.i, -6.250000e+00
  %compare.667.15 = fcmp ogt double %t.0.i, -1.600000e+01
  %185 = select i1 %compare.666.25, double 0x3F2879C2A212F024, double 0x4008ABCC380D5A48
  %186 = select i1 %compare.666.25, double 0xBEED1D1F7B8736F6, double 0x3FF0158A6D641D39
  %187 = select i1 %compare.666.25, double 0xBEB6E8A5434AE8A2, double 0x3F75FFCFE5B76AFC
  %188 = select i1 %compare.667.15, double %187, double 0x4013664DDD1AD7FB
  %189 = select i1 %compare.666.25, double 0x3E9C6B4F5D03B787, double 0xBF6EBADABB891BBD
  %190 = select i1 %compare.667.15, double %189, double 0x3FF02A30D1FBA0DC
  %191 = select i1 %compare.666.25, double 0xBE5F36CD6D3D46A9, double 0x3F6468EECA533CF8
  %192 = select i1 %compare.667.15, double %191, double 0xBF222EA5DF04047C
  %193 = select i1 %compare.666.25, double 0xBE31A9E38DC84D60, double 0xBF5BA924132F38B1
  %194 = select i1 %compare.667.15, double %193, double 0xBF2C2F36A8FC5D53
  %195 = select i1 %compare.666.25, double 0x3E120F47CCF46B3C, double 0x3F4F3CC55AD40C25
  %196 = select i1 %compare.667.15, double %195, double 0x3F13EBF4EB00938F
  %197 = select i1 %compare.666.25, double 0xBDCDC583D118A561, double 0xBF37448A89EF8AA3
  %198 = select i1 %compare.667.15, double %197, double 0xBEF4A3497E1E0FAC
  %199 = select i1 %compare.666.25, double 0xBDAC8859C4E5C0AF, double 0x3EF932CD54C8A222
  %200 = select i1 %compare.667.15, double %199, double 0x3ED2FBD29D093D2B
  %201 = select i1 %compare.666.25, double 0x3D872A22C2D77E20, double 0x3F11E684D0B9188A
  %202 = select i1 %compare.667.15, double %201, double 0xBEB0A8D40EA372CC
  %203 = select i1 %compare.666.25, double 0xBD36F2167040D8E2, double 0xBF08CEF1F80281F2
  %204 = select i1 %compare.667.15, double %203, double 0x3E8EBC8BB824CB54
  %205 = select i1 %compare.666.25, double 0xBD26D33EED66C487, double 0x3EEA29A0CACDFB23
  %206 = select i1 %compare.667.15, double %205, double 0xBE722D220FDF9C3E
  %207 = select i1 %compare.666.25, double 0x3CFDE4ACFD9E26BA, double 0x3EC8860CD5D652F6
  %208 = select i1 %compare.667.15, double %207, double 0x3E5F4C20E1334AF8
  %209 = select i1 %compare.666.25, double 0x3C782E11898132E0, double 0xBED0D5DB812B5083
  %210 = select i1 %compare.667.15, double %209, double 0xBE50102E495FB9C0
  %211 = select i1 %compare.666.25, double 0xBCA33689090A6B96, double 0x3EB936388A3790AD
  %212 = select i1 %compare.667.15, double %211, double 0x3E405AC6A8FBA182
  %213 = select i1 %compare.666.25, double 0x3C69BA72CD589B91, double 0x3E5395ABCD554C6C
  %214 = select i1 %compare.667.15, double %213, double 0xBE30468FB24E2F5F
  %215 = select i1 %compare.666.25, double 0x3C37B83EEF0B7C9F, double 0xBE92777453DD3955
  %216 = select i1 %compare.667.15, double %215, double 0x3E19E6BF2DDA45E3
  %217 = select i1 %compare.666.25, double 0xBC08DDF93324D327, double 0x3E785CBE52878635
  %218 = select i1 %compare.667.15, double %217, double 0xBDF18FEEC0E38727
  %219 = select i1 %compare.666.25, double 0xBBB135D2E746E627, double 0x3E23040F87DBD932
  %220 = select i1 %compare.667.15, double %219, double 0xBDBDCEC3A7785389
  %add.4163.5 = fsub double -3.125000e+00, %t.0.i
  %221 = tail call double @llvm.sqrt.f64(double %184)
  %222 = select i1 %compare.667.15, double 3.250000e+00, double 5.000000e+00
  %subtract.241.3 = fsub double %221, %222
  %223 = select i1 %compare.666.25, double %add.4163.5, double %subtract.241.3
  %multiply.2987.5 = fmul double %220, %223
  %add.4164.7 = fadd double %218, %multiply.2987.5
  %multiply.2988.5 = fmul double %223, %add.4164.7
  %add.4165.7 = fadd double %216, %multiply.2988.5
  %multiply.2989.5 = fmul double %223, %add.4165.7
  %add.4166.7 = fadd double %214, %multiply.2989.5
  %multiply.2990.5 = fmul double %223, %add.4166.7
  %add.4167.7 = fadd double %212, %multiply.2990.5
  %multiply.2991.5 = fmul double %223, %add.4167.7
  %add.4168.7 = fadd double %210, %multiply.2991.5
  %multiply.2992.5 = fmul double %223, %add.4168.7
  %add.4169.7 = fadd double %208, %multiply.2992.5
  %multiply.2993.5 = fmul double %223, %add.4169.7
  %add.4170.7 = fadd double %206, %multiply.2993.5
  %multiply.2994.5 = fmul double %223, %add.4170.7
  %add.4171.7 = fadd double %204, %multiply.2994.5
  %multiply.2995.5 = fmul double %223, %add.4171.7
  %add.4172.7 = fadd double %202, %multiply.2995.5
  %multiply.2996.5 = fmul double %223, %add.4172.7
  %add.4173.7 = fadd double %200, %multiply.2996.5
  %multiply.2997.5 = fmul double %223, %add.4173.7
  %add.4174.7 = fadd double %198, %multiply.2997.5
  %multiply.2998.5 = fmul double %223, %add.4174.7
  %add.4175.7 = fadd double %196, %multiply.2998.5
  %multiply.2999.5 = fmul double %223, %add.4175.7
  %add.4176.7 = fadd double %194, %multiply.2999.5
  %multiply.3000.5 = fmul double %223, %add.4176.7
  %add.4177.7 = fadd double %192, %multiply.3000.5
  %multiply.3001.5 = fmul double %223, %add.4177.7
  %add.4178.7 = fadd double %190, %multiply.3001.5
  %multiply.3002.5 = fmul double %223, %add.4178.7
  %add.4179.3 = fadd double %188, %multiply.3002.5
  %multiply.3003.1 = fmul double %223, %add.4179.3
  %add.4180.3 = fadd double %186, %multiply.3003.1
  %224 = select i1 %compare.667.15, double %add.4180.3, double %add.4179.3
  %multiply.3004.1 = fmul double %223, %224
  %add.4181.3 = fadd double %185, %multiply.3004.1
  %225 = select i1 %compare.667.15, double %add.4181.3, double %add.4179.3
  %multiply.3005.1 = fmul double %223, %225
  %add.4182.5 = fadd double %multiply.3005.1, 0xBF4845769484FCA8
  %226 = select i1 %compare.666.25, double %add.4182.5, double %225
  %multiply.3006.5 = fmul double %223, %226
  %add.4183.3 = fadd double %multiply.3006.5, 0xBF78B6C33114F909
  %227 = select i1 %compare.666.25, double %add.4183.3, double %225
  %multiply.3007.1 = fmul double %223, %227
  %add.4184.5 = fadd double %multiply.3007.1, 0x3FCEBD80D9B13E28
  %228 = select i1 %compare.666.25, double %add.4184.5, double %225
  %multiply.3008.5 = fmul double %223, %228
  %add.4185.5 = fadd double %multiply.3008.5, 0x3FFA755E7C99AE86
  %229 = select i1 %compare.666.25, double %add.4185.5, double %225
  %.v = select i1 %compare.665.3, double 0x7FF0000000000000, double %229
  %230 = fmul double %maximum.44.3, %.v
  %multiply.3010.3 = fmul double %230, 0x3FF6A09E667F3BCD
  %multiply.3011.1 = fmul double %183, %multiply.3010.3
  %231 = getelementptr double, ptr addrspace(1) %arg247, i64 %1
  store double %multiply.3011.1, ptr addrspace(1) %231, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_13(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg05, align 128, !invariant.load !299
  %1 = load <2 x double>, ptr addrspace(1) %arg29, align 128, !invariant.load !299
  %2 = extractelement <2 x double> %1, i32 0
  %3 = extractelement <2 x double> %1, i32 1
  %4 = load <2 x double>, ptr addrspace(1) %arg17, align 128, !invariant.load !299
  %5 = extractelement <2 x double> %4, i32 0
  %6 = extractelement <2 x double> %4, i32 1
  %multiply.3012.3 = fmul double %2, %5
  %multiply.3013.3 = fmul double %5, %multiply.3012.3
  %add.3619.i = fadd double %multiply.3013.3, 0.000000e+00
  %multiply.3012.3.1 = fmul double %3, %6
  %multiply.3013.3.1 = fmul double %6, %multiply.3012.3.1
  %add.3619.i.1 = fadd double %add.3619.i, %multiply.3013.3.1
  %7 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 16
  %8 = load <2 x double>, ptr addrspace(1) %7, align 16, !invariant.load !299
  %9 = extractelement <2 x double> %8, i32 0
  %10 = extractelement <2 x double> %8, i32 1
  %11 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 16
  %12 = load <2 x double>, ptr addrspace(1) %11, align 16, !invariant.load !299
  %13 = extractelement <2 x double> %12, i32 0
  %14 = extractelement <2 x double> %12, i32 1
  %multiply.3012.3.2 = fmul double %9, %13
  %multiply.3013.3.2 = fmul double %13, %multiply.3012.3.2
  %add.3619.i.2 = fadd double %add.3619.i.1, %multiply.3013.3.2
  %multiply.3012.3.3 = fmul double %10, %14
  %multiply.3013.3.3 = fmul double %14, %multiply.3012.3.3
  %add.3619.i.3 = fadd double %add.3619.i.2, %multiply.3013.3.3
  %15 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 32
  %16 = load <2 x double>, ptr addrspace(1) %15, align 32, !invariant.load !299
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  %19 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 32
  %20 = load <2 x double>, ptr addrspace(1) %19, align 32, !invariant.load !299
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  %multiply.3012.3.4 = fmul double %17, %21
  %multiply.3013.3.4 = fmul double %21, %multiply.3012.3.4
  %add.3619.i.4 = fadd double %add.3619.i.3, %multiply.3013.3.4
  %multiply.3012.3.5 = fmul double %18, %22
  %multiply.3013.3.5 = fmul double %22, %multiply.3012.3.5
  %add.3619.i.5 = fadd double %add.3619.i.4, %multiply.3013.3.5
  %23 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 48
  %24 = load <2 x double>, ptr addrspace(1) %23, align 16, !invariant.load !299
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 48
  %28 = load <2 x double>, ptr addrspace(1) %27, align 16, !invariant.load !299
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  %multiply.3012.3.6 = fmul double %25, %29
  %multiply.3013.3.6 = fmul double %29, %multiply.3012.3.6
  %add.3619.i.6 = fadd double %add.3619.i.5, %multiply.3013.3.6
  %multiply.3012.3.7 = fmul double %26, %30
  %multiply.3013.3.7 = fmul double %30, %multiply.3012.3.7
  %add.3619.i.7 = fadd double %add.3619.i.6, %multiply.3013.3.7
  %31 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 64
  %32 = load <2 x double>, ptr addrspace(1) %31, align 64, !invariant.load !299
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %35 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 64
  %36 = load <2 x double>, ptr addrspace(1) %35, align 64, !invariant.load !299
  %37 = extractelement <2 x double> %36, i32 0
  %38 = extractelement <2 x double> %36, i32 1
  %multiply.3012.3.8 = fmul double %33, %37
  %multiply.3013.3.8 = fmul double %37, %multiply.3012.3.8
  %add.3619.i.8 = fadd double %add.3619.i.7, %multiply.3013.3.8
  %multiply.3012.3.9 = fmul double %34, %38
  %multiply.3013.3.9 = fmul double %38, %multiply.3012.3.9
  %add.3619.i.9 = fadd double %add.3619.i.8, %multiply.3013.3.9
  %39 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 80
  %40 = load <2 x double>, ptr addrspace(1) %39, align 16, !invariant.load !299
  %41 = extractelement <2 x double> %40, i32 0
  %42 = extractelement <2 x double> %40, i32 1
  %43 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 80
  %44 = load <2 x double>, ptr addrspace(1) %43, align 16, !invariant.load !299
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  %multiply.3012.3.10 = fmul double %41, %45
  %multiply.3013.3.10 = fmul double %45, %multiply.3012.3.10
  %add.3619.i.10 = fadd double %add.3619.i.9, %multiply.3013.3.10
  %multiply.3012.3.11 = fmul double %42, %46
  %multiply.3013.3.11 = fmul double %46, %multiply.3012.3.11
  %add.3619.i.11 = fadd double %add.3619.i.10, %multiply.3013.3.11
  %47 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 96
  %48 = load <2 x double>, ptr addrspace(1) %47, align 32, !invariant.load !299
  %49 = extractelement <2 x double> %48, i32 0
  %50 = extractelement <2 x double> %48, i32 1
  %51 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 96
  %52 = load <2 x double>, ptr addrspace(1) %51, align 32, !invariant.load !299
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %multiply.3012.3.12 = fmul double %49, %53
  %multiply.3013.3.12 = fmul double %53, %multiply.3012.3.12
  %add.3619.i.12 = fadd double %add.3619.i.11, %multiply.3013.3.12
  %multiply.3012.3.13 = fmul double %50, %54
  %multiply.3013.3.13 = fmul double %54, %multiply.3012.3.13
  %add.3619.i.13 = fadd double %add.3619.i.12, %multiply.3013.3.13
  %55 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 112
  %56 = load <2 x double>, ptr addrspace(1) %55, align 16, !invariant.load !299
  %57 = extractelement <2 x double> %56, i32 0
  %58 = extractelement <2 x double> %56, i32 1
  %59 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 112
  %60 = load <2 x double>, ptr addrspace(1) %59, align 16, !invariant.load !299
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %multiply.3012.3.14 = fmul double %57, %61
  %multiply.3013.3.14 = fmul double %61, %multiply.3012.3.14
  %add.3619.i.14 = fadd double %add.3619.i.13, %multiply.3013.3.14
  %multiply.3012.3.15 = fmul double %58, %62
  %multiply.3013.3.15 = fmul double %62, %multiply.3012.3.15
  %add.3619.i.15 = fadd double %add.3619.i.14, %multiply.3013.3.15
  %63 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 128
  %64 = load <2 x double>, ptr addrspace(1) %63, align 128, !invariant.load !299
  %65 = extractelement <2 x double> %64, i32 0
  %66 = extractelement <2 x double> %64, i32 1
  %67 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 128
  %68 = load <2 x double>, ptr addrspace(1) %67, align 128, !invariant.load !299
  %69 = extractelement <2 x double> %68, i32 0
  %70 = extractelement <2 x double> %68, i32 1
  %multiply.3012.3.16 = fmul double %65, %69
  %multiply.3013.3.16 = fmul double %69, %multiply.3012.3.16
  %add.3619.i.16 = fadd double %add.3619.i.15, %multiply.3013.3.16
  %multiply.3012.3.17 = fmul double %66, %70
  %multiply.3013.3.17 = fmul double %70, %multiply.3012.3.17
  %add.3619.i.17 = fadd double %add.3619.i.16, %multiply.3013.3.17
  %71 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 144
  %72 = load <2 x double>, ptr addrspace(1) %71, align 16, !invariant.load !299
  %73 = extractelement <2 x double> %72, i32 0
  %74 = extractelement <2 x double> %72, i32 1
  %75 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 144
  %76 = load <2 x double>, ptr addrspace(1) %75, align 16, !invariant.load !299
  %77 = extractelement <2 x double> %76, i32 0
  %78 = extractelement <2 x double> %76, i32 1
  %multiply.3012.3.18 = fmul double %73, %77
  %multiply.3013.3.18 = fmul double %77, %multiply.3012.3.18
  %add.3619.i.18 = fadd double %add.3619.i.17, %multiply.3013.3.18
  %multiply.3012.3.19 = fmul double %74, %78
  %multiply.3013.3.19 = fmul double %78, %multiply.3012.3.19
  %add.3619.i.19 = fadd double %add.3619.i.18, %multiply.3013.3.19
  %79 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 160
  %80 = load <2 x double>, ptr addrspace(1) %79, align 32, !invariant.load !299
  %81 = extractelement <2 x double> %80, i32 0
  %82 = extractelement <2 x double> %80, i32 1
  %83 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 160
  %84 = load <2 x double>, ptr addrspace(1) %83, align 32, !invariant.load !299
  %85 = extractelement <2 x double> %84, i32 0
  %86 = extractelement <2 x double> %84, i32 1
  %multiply.3012.3.20 = fmul double %81, %85
  %multiply.3013.3.20 = fmul double %85, %multiply.3012.3.20
  %add.3619.i.20 = fadd double %add.3619.i.19, %multiply.3013.3.20
  %multiply.3012.3.21 = fmul double %82, %86
  %multiply.3013.3.21 = fmul double %86, %multiply.3012.3.21
  %add.3619.i.21 = fadd double %add.3619.i.20, %multiply.3013.3.21
  %87 = getelementptr inbounds i8, ptr addrspace(1) %arg29, i64 176
  %88 = load <2 x double>, ptr addrspace(1) %87, align 16, !invariant.load !299
  %89 = extractelement <2 x double> %88, i32 0
  %90 = extractelement <2 x double> %88, i32 1
  %91 = getelementptr inbounds i8, ptr addrspace(1) %arg17, i64 176
  %92 = load <2 x double>, ptr addrspace(1) %91, align 16, !invariant.load !299
  %93 = extractelement <2 x double> %92, i32 0
  %94 = extractelement <2 x double> %92, i32 1
  %multiply.3012.3.22 = fmul double %89, %93
  %multiply.3013.3.22 = fmul double %93, %multiply.3012.3.22
  %add.3619.i.22 = fadd double %add.3619.i.21, %multiply.3013.3.22
  %multiply.3012.3.23 = fmul double %90, %94
  %multiply.3013.3.23 = fmul double %94, %multiply.3012.3.23
  %add.3619.i.23 = fadd double %add.3619.i.22, %multiply.3013.3.23
  %multiply.3014.1 = fmul double %add.3619.i.23, 5.000000e-01
  %add.4186.1 = fsub double %multiply.3014.1, %0
  store double %add.4186.1, ptr addrspace(1) %arg311, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_5(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [24 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 160
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !299
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_4(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [24 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 128
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !299
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_3(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [24 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 96
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !299
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_2(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [24 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 64
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !299
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [24 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !299
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %3, ptr addrspace(1) %4, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_1(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [24 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 32
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !299
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_112(ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.3478 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.3478, 0
  %2 = add i64 %param_2.3478, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.3478
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.44404 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.44404, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !303
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_and_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #2 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg25, align 128, !invariant.load !299
  %1 = icmp slt i64 %0, 10
  %2 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %3 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %4 = or i8 %3, %2
  %5 = trunc i8 %4 to i1
  %6 = xor i1 %5, true
  %7 = and i1 %1, %6
  %8 = zext i1 %7 to i8
  store i8 %8, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg128 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg026 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg026, align 128, !invariant.load !299
  %1 = and i64 %0, 32
  %2 = and i64 %0, 16
  %3 = and i64 %0, 8
  %4 = and i64 %0, 4
  %5 = and i64 %0, 2
  %6 = and i64 %0, 1
  %.not25 = icmp eq i64 %6, 0
  %7 = select i1 %.not25, i64 1, i64 2
  %8 = shl nuw nsw i64 %7, %5
  %9 = shl nuw nsw i64 %8, %4
  %10 = shl nuw nsw i64 %9, %3
  %11 = shl nuw nsw i64 %10, %2
  %12 = shl nuw i64 %11, %1
  store i64 %12, ptr addrspace(1) %arg128, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_11(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #2 {
entry:
  %arg3123 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2121 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0117 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg1119, align 128, !invariant.load !299
  %1 = trunc i64 %0 to i32
  %2 = load <2 x i32>, ptr addrspace(1) %arg0117, align 128, !invariant.load !299
  %3 = extractelement <2 x i32> %2, i32 0
  %4 = extractelement <2 x i32> %2, i32 1
  %5 = add i32 %4, %1
  %6 = add i32 %5, %3
  %7 = tail call i32 @llvm.fshl.i32(i32 %5, i32 %5, i32 13)
  %8 = xor i32 %6, %7
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.fshl.i32(i32 %8, i32 %8, i32 15)
  %11 = xor i32 %9, %10
  %12 = add i32 %11, %9
  %13 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %11, i32 26)
  %14 = xor i32 %12, %13
  %15 = add i32 %14, %12
  %16 = add i32 %15, %4
  %17 = tail call i32 @llvm.fshl.i32(i32 %14, i32 %14, i32 6)
  %18 = xor i32 %15, %17
  %19 = xor i32 %3, %4
  %20 = xor i32 %19, 466688986
  %21 = add i32 %20, 1
  %22 = add i32 %21, %18
  %23 = add i32 %16, %22
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 17)
  %25 = xor i32 %23, %24
  %26 = add i32 %25, %23
  %27 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 29)
  %28 = xor i32 %26, %27
  %29 = add i32 %28, %26
  %30 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 16)
  %31 = xor i32 %29, %30
  %32 = add i32 %31, %29
  %33 = add i32 %32, %20
  %34 = tail call i32 @llvm.fshl.i32(i32 %31, i32 %31, i32 24)
  %35 = xor i32 %32, %34
  %36 = add i32 %3, 2
  %37 = add i32 %36, %35
  %38 = add i32 %33, %37
  %39 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 13)
  %40 = xor i32 %38, %39
  %41 = add i32 %40, %38
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 15)
  %43 = xor i32 %41, %42
  %44 = add i32 %43, %41
  %45 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 26)
  %46 = xor i32 %44, %45
  %47 = add i32 %46, %44
  %48 = add i32 %47, %3
  %49 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 6)
  %50 = xor i32 %47, %49
  %51 = add i32 %4, 3
  %52 = add i32 %51, %50
  %53 = add i32 %48, %52
  %54 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 17)
  %55 = xor i32 %53, %54
  %56 = add i32 %55, %53
  %57 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 29)
  %58 = xor i32 %56, %57
  %59 = add i32 %58, %56
  %60 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 16)
  %61 = xor i32 %59, %60
  %62 = add i32 %61, %59
  %63 = add i32 %62, %4
  %64 = tail call i32 @llvm.fshl.i32(i32 %61, i32 %61, i32 24)
  %65 = xor i32 %62, %64
  %66 = add i32 %20, 4
  %67 = add i32 %66, %65
  %68 = add i32 %63, %67
  %69 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 13)
  %70 = xor i32 %68, %69
  %71 = add i32 %70, %68
  %72 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 15)
  %73 = xor i32 %71, %72
  %74 = add i32 %73, %71
  %75 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 26)
  %76 = xor i32 %74, %75
  %77 = add i32 %76, %74
  %78 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 6)
  %79 = xor i32 %77, %78
  %80 = add i32 %3, 5
  %81 = add i32 %80, %79
  %82 = add i32 %77, %20
  store i32 %81, ptr addrspace(1) %arg2121, align 128
  store i32 %82, ptr addrspace(1) %arg3123, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_12(ptr noalias nocapture align 128 dereferenceable(8) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128
  %1 = add i64 %0, 1
  store i64 %1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(12) %arg2) local_unnamed_addr #2 {
entry:
  %arg242 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg140 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg038 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !296
  %1 = load i32, ptr addrspace(1) %arg140, align 128, !invariant.load !299
  %2 = load i32, ptr addrspace(1) %arg038, align 128, !invariant.load !299
  %3 = add i32 %2, 3
  %4 = add i32 %3, %0
  %5 = add i32 %4, %0
  %6 = add i32 %5, %1
  %7 = tail call i32 @llvm.fshl.i32(i32 %4, i32 %4, i32 13)
  %8 = xor i32 %6, %7
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.fshl.i32(i32 %8, i32 %8, i32 15)
  %11 = xor i32 %9, %10
  %12 = add i32 %11, %9
  %13 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %11, i32 26)
  %14 = xor i32 %12, %13
  %15 = add i32 %14, %12
  %16 = add i32 %15, %2
  %17 = tail call i32 @llvm.fshl.i32(i32 %14, i32 %14, i32 6)
  %18 = xor i32 %15, %17
  %19 = xor i32 %1, %2
  %20 = xor i32 %19, 466688986
  %21 = add i32 %20, 1
  %22 = add i32 %21, %18
  %23 = add i32 %16, %22
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 17)
  %25 = xor i32 %23, %24
  %26 = add i32 %25, %23
  %27 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 29)
  %28 = xor i32 %26, %27
  %29 = add i32 %28, %26
  %30 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 16)
  %31 = xor i32 %29, %30
  %32 = add i32 %31, %29
  %33 = add i32 %32, %20
  %34 = tail call i32 @llvm.fshl.i32(i32 %31, i32 %31, i32 24)
  %35 = xor i32 %32, %34
  %36 = add i32 %1, 2
  %37 = add i32 %36, %35
  %38 = add i32 %33, %37
  %39 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 13)
  %40 = xor i32 %38, %39
  %41 = add i32 %40, %38
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 15)
  %43 = xor i32 %41, %42
  %44 = add i32 %43, %41
  %45 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 26)
  %46 = xor i32 %44, %45
  %47 = add i32 %46, %44
  %48 = add i32 %47, %1
  %49 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 6)
  %50 = xor i32 %47, %49
  %51 = add i32 %3, %50
  %52 = add i32 %48, %51
  %53 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 17)
  %54 = xor i32 %52, %53
  %55 = add i32 %54, %52
  %56 = tail call i32 @llvm.fshl.i32(i32 %54, i32 %54, i32 29)
  %57 = xor i32 %55, %56
  %58 = add i32 %57, %55
  %59 = tail call i32 @llvm.fshl.i32(i32 %57, i32 %57, i32 16)
  %60 = xor i32 %58, %59
  %61 = add i32 %60, %58
  %62 = add i32 %61, %2
  %63 = tail call i32 @llvm.fshl.i32(i32 %60, i32 %60, i32 24)
  %64 = xor i32 %61, %63
  %65 = add i32 %20, 4
  %66 = add i32 %65, %64
  %67 = add i32 %62, %66
  %68 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 13)
  %69 = xor i32 %67, %68
  %70 = add i32 %69, %67
  %71 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 15)
  %72 = xor i32 %70, %71
  %73 = add i32 %72, %70
  %74 = tail call i32 @llvm.fshl.i32(i32 %72, i32 %72, i32 26)
  %75 = xor i32 %73, %74
  %76 = add i32 %73, %20
  %77 = add i32 %76, %75
  %78 = zext nneg i32 %0 to i64
  %79 = getelementptr i32, ptr addrspace(1) %arg242, i64 %78
  store i32 %77, ptr addrspace(1) %79, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(12) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg449 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg347 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg041 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !298
  %1 = and i32 %0, 1
  %2 = icmp ult i32 %0, 3
  br i1 %2, label %concatenate.pivot.0., label %concatenate.pivot.3.40

loop_slice_fusion.in_bounds-after:                ; preds = %slice0-after, %slice1-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %3 = zext nneg i32 %0 to i64
  %4 = getelementptr inbounds [3 x i32], ptr addrspace(1) %arg041, i64 0, i64 %3
  %5 = load i32, ptr addrspace(1) %4, align 4, !invariant.load !299
  br label %concatenate.44.2.merge

concatenate.pivot.3.40:                           ; preds = %entry
  %6 = add nsw i32 %0, -3
  %7 = load i32, ptr addrspace(1) %arg143, align 128, !invariant.load !299
  %8 = add i32 %6, %7
  %9 = load i32, ptr addrspace(1) %arg245, align 128, !invariant.load !299
  %10 = add i32 %9, %0
  %11 = add i32 %8, %10
  %12 = tail call i32 @llvm.fshl.i32(i32 %10, i32 %10, i32 13)
  %13 = xor i32 %11, %12
  %14 = add i32 %13, %11
  %15 = tail call i32 @llvm.fshl.i32(i32 %13, i32 %13, i32 15)
  %16 = xor i32 %14, %15
  %17 = add i32 %16, %14
  %18 = tail call i32 @llvm.fshl.i32(i32 %16, i32 %16, i32 26)
  %19 = xor i32 %17, %18
  %20 = add i32 %19, %17
  %21 = add i32 %20, %9
  %22 = tail call i32 @llvm.fshl.i32(i32 %19, i32 %19, i32 6)
  %23 = xor i32 %20, %22
  %24 = xor i32 %7, %9
  %25 = xor i32 %24, 466688986
  %26 = add i32 %25, 1
  %27 = add i32 %26, %23
  %28 = add i32 %21, %27
  %29 = tail call i32 @llvm.fshl.i32(i32 %27, i32 %27, i32 17)
  %30 = xor i32 %28, %29
  %31 = add i32 %30, %28
  %32 = tail call i32 @llvm.fshl.i32(i32 %30, i32 %30, i32 29)
  %33 = xor i32 %31, %32
  %34 = add i32 %33, %31
  %35 = tail call i32 @llvm.fshl.i32(i32 %33, i32 %33, i32 16)
  %36 = xor i32 %34, %35
  %37 = add i32 %36, %34
  %38 = add i32 %37, %25
  %39 = tail call i32 @llvm.fshl.i32(i32 %36, i32 %36, i32 24)
  %40 = xor i32 %37, %39
  %41 = add i32 %7, 2
  %42 = add i32 %41, %40
  %43 = add i32 %38, %42
  %44 = tail call i32 @llvm.fshl.i32(i32 %42, i32 %42, i32 13)
  %45 = xor i32 %43, %44
  %46 = add i32 %45, %43
  %47 = tail call i32 @llvm.fshl.i32(i32 %45, i32 %45, i32 15)
  %48 = xor i32 %46, %47
  %49 = add i32 %48, %46
  %50 = tail call i32 @llvm.fshl.i32(i32 %48, i32 %48, i32 26)
  %51 = xor i32 %49, %50
  %52 = add i32 %51, %49
  %53 = add i32 %52, %7
  %54 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 6)
  %55 = xor i32 %52, %54
  %56 = add i32 %9, 3
  %57 = add i32 %56, %55
  %58 = add i32 %53, %57
  %59 = tail call i32 @llvm.fshl.i32(i32 %57, i32 %57, i32 17)
  %60 = xor i32 %58, %59
  %61 = add i32 %60, %58
  %62 = tail call i32 @llvm.fshl.i32(i32 %60, i32 %60, i32 29)
  %63 = xor i32 %61, %62
  %64 = add i32 %63, %61
  %65 = tail call i32 @llvm.fshl.i32(i32 %63, i32 %63, i32 16)
  %66 = xor i32 %64, %65
  %67 = add i32 %66, %64
  %68 = add i32 %67, %9
  %69 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 24)
  %70 = xor i32 %67, %69
  %71 = add i32 %25, 4
  %72 = add i32 %71, %70
  %73 = add i32 %68, %72
  %74 = tail call i32 @llvm.fshl.i32(i32 %72, i32 %72, i32 13)
  %75 = xor i32 %73, %74
  %76 = add i32 %75, %73
  %77 = tail call i32 @llvm.fshl.i32(i32 %75, i32 %75, i32 15)
  %78 = xor i32 %76, %77
  %79 = add i32 %78, %76
  %80 = tail call i32 @llvm.fshl.i32(i32 %78, i32 %78, i32 26)
  %81 = xor i32 %79, %80
  %82 = add i32 %81, %79
  %83 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 6)
  %84 = xor i32 %82, %83
  %85 = add i32 %7, 5
  %86 = add i32 %85, %84
  br label %concatenate.44.2.merge

concatenate.44.2.merge:                           ; preds = %concatenate.pivot.3.40, %concatenate.pivot.0.
  %87 = phi i32 [ %5, %concatenate.pivot.0. ], [ %86, %concatenate.pivot.3.40 ]
  %88 = and i32 %0, 6
  %89 = icmp eq i32 %88, 2
  %90 = zext nneg i32 %1 to i64
  %91 = getelementptr inbounds [1 x [2 x i32]], ptr addrspace(1) %arg347, i64 0, i64 0, i64 %90
  br i1 %89, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.44.2.merge
  %92 = icmp ugt i32 %0, 3
  %93 = getelementptr inbounds [1 x [2 x i32]], ptr addrspace(1) %arg449, i64 0, i64 0, i64 %90
  br i1 %92, label %slice1-true, label %loop_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.44.2.merge
  store i32 %87, ptr addrspace(1) %91, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store i32 %87, ptr addrspace(1) %93, align 4
  br label %loop_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(12) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg2212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1210 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0208 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load <2 x i32>, ptr addrspace(1) %arg0208, align 128, !invariant.load !299
  %1 = extractelement <2 x i32> %0, i32 0
  %2 = extractelement <2 x i32> %0, i32 1
  %3 = add i32 %2, %1
  %4 = tail call i32 @llvm.fshl.i32(i32 %2, i32 %2, i32 13)
  %5 = xor i32 %3, %4
  %6 = add i32 %5, %3
  %7 = tail call i32 @llvm.fshl.i32(i32 %5, i32 %5, i32 15)
  %8 = xor i32 %6, %7
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.fshl.i32(i32 %8, i32 %8, i32 26)
  %11 = xor i32 %9, %10
  %12 = add i32 %11, %9
  %13 = add i32 %12, %2
  %14 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %11, i32 6)
  %15 = xor i32 %12, %14
  %16 = xor i32 %1, %2
  %17 = xor i32 %16, 466688986
  %18 = add i32 %17, 1
  %19 = add i32 %18, %15
  %20 = add i32 %13, %19
  %21 = tail call i32 @llvm.fshl.i32(i32 %19, i32 %19, i32 17)
  %22 = xor i32 %20, %21
  %23 = add i32 %22, %20
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 29)
  %25 = xor i32 %23, %24
  %26 = add i32 %25, %23
  %27 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 16)
  %28 = xor i32 %26, %27
  %29 = add i32 %28, %26
  %30 = add i32 %29, %17
  %31 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 24)
  %32 = xor i32 %29, %31
  %33 = add i32 %1, 2
  %34 = add i32 %33, %32
  %35 = add i32 %30, %34
  %36 = tail call i32 @llvm.fshl.i32(i32 %34, i32 %34, i32 13)
  %37 = xor i32 %35, %36
  %38 = add i32 %37, %35
  %39 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 15)
  %40 = xor i32 %38, %39
  %41 = add i32 %40, %38
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 26)
  %43 = xor i32 %41, %42
  %44 = add i32 %43, %41
  %45 = add i32 %44, %1
  %46 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 6)
  %47 = xor i32 %44, %46
  %48 = add i32 %2, 3
  %49 = add i32 %48, %47
  %50 = add i32 %45, %49
  %51 = tail call i32 @llvm.fshl.i32(i32 %49, i32 %49, i32 17)
  %52 = xor i32 %50, %51
  %53 = add i32 %52, %50
  %54 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 29)
  %55 = xor i32 %53, %54
  %56 = add i32 %55, %53
  %57 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 16)
  %58 = xor i32 %56, %57
  %59 = add i32 %58, %56
  %60 = add i32 %59, %2
  %61 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 24)
  %62 = xor i32 %59, %61
  %63 = add i32 %17, 4
  %64 = add i32 %63, %62
  %65 = add i32 %60, %64
  %66 = tail call i32 @llvm.fshl.i32(i32 %64, i32 %64, i32 13)
  %67 = xor i32 %65, %66
  %68 = add i32 %67, %65
  %69 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 15)
  %70 = xor i32 %68, %69
  %71 = add i32 %70, %68
  %72 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 26)
  %73 = xor i32 %71, %72
  %74 = add i32 %71, %17
  %75 = add i32 %74, %73
  %76 = lshr i32 %75, 9
  %77 = or disjoint i32 %76, 1065353216
  %78 = bitcast i32 %77 to float
  %add.4065.1 = fadd float %78, -1.000000e+00
  %79 = tail call float @llvm.maximum.f32(float %add.4065.1, float 0.000000e+00)
  %compare.651.1 = fcmp olt float %79, 5.000000e-01
  %80 = select i1 %compare.651.1, i64 1, i64 -1
  %81 = zext i1 %compare.651.1 to i32
  store i64 %80, ptr addrspace(1) %arg1210, align 128
  store i32 %81, ptr addrspace(1) %arg2212, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_add_minimum_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg11) local_unnamed_addr #3 {
entry:
  %arg1195 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1093 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg991 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg889 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg787 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg685 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg583 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg481 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg379 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg277 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg175 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg073 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg073, align 128, !invariant.load !299
  %1 = load double, ptr addrspace(1) %arg889, align 128, !invariant.load !299
  %2 = load <2 x double>, ptr addrspace(1) %arg175, align 128, !invariant.load !299
  %3 = extractelement <2 x double> %2, i32 0
  %4 = extractelement <2 x double> %2, i32 1
  %5 = load <2 x double>, ptr addrspace(1) %arg277, align 128, !invariant.load !299
  %6 = extractelement <2 x double> %5, i32 0
  %.pre101 = extractelement <2 x double> %5, i32 1
  %multiply.2971.5.clone.1.peel = fmul double %3, %6
  %multiply.2972.3.clone.1.peel = fmul double %6, %multiply.2971.5.clone.1.peel
  %add.3619.i.peel = fadd double %multiply.2972.3.clone.1.peel, 0.000000e+00
  %multiply.2971.5.clone.1.peel25 = fmul double %4, %.pre101
  %multiply.2972.3.clone.1.peel26 = fmul double %.pre101, %multiply.2971.5.clone.1.peel25
  %add.3619.i.peel27 = fadd double %add.3619.i.peel, %multiply.2972.3.clone.1.peel26
  %7 = getelementptr inbounds i8, ptr addrspace(1) %arg175, i64 16
  %8 = load <2 x double>, ptr addrspace(1) %7, align 16, !invariant.load !299
  %9 = extractelement <2 x double> %8, i32 0
  %10 = extractelement <2 x double> %8, i32 1
  %11 = getelementptr inbounds i8, ptr addrspace(1) %arg277, i64 16
  %12 = load <2 x double>, ptr addrspace(1) %11, align 16, !invariant.load !299
  %.pre69102 = extractelement <2 x double> %12, i32 0
  %.pre70103 = extractelement <2 x double> %12, i32 1
  %multiply.2971.5.clone.1.peel44 = fmul double %9, %.pre69102
  %multiply.2972.3.clone.1.peel45 = fmul double %.pre69102, %multiply.2971.5.clone.1.peel44
  %add.3619.i.peel46 = fadd double %add.3619.i.peel27, %multiply.2972.3.clone.1.peel45
  %multiply.2971.5.clone.1.peel63 = fmul double %10, %.pre70103
  %multiply.2972.3.clone.1.peel64 = fmul double %.pre70103, %multiply.2971.5.clone.1.peel63
  %add.3619.i.peel65 = fadd double %add.3619.i.peel46, %multiply.2972.3.clone.1.peel64
  %scevgep = getelementptr i8, ptr addrspace(1) %arg175, i64 40
  br label %reduce.42.1.clone.1.inner.loop_body.reduction_dim.0

reduce.42.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %concatenate.43.8.clone.1.merge.1, %entry
  %lsr.iv98 = phi ptr addrspace(1) [ %scevgep99, %concatenate.43.8.clone.1.merge.1 ], [ %scevgep, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %concatenate.43.8.clone.1.merge.1 ], [ 5, %entry ]
  %accumulator_0.010 = phi double [ %add.3619.i.peel65, %entry ], [ %add.3619.i.1, %concatenate.43.8.clone.1.merge.1 ]
  %13 = add i32 %lsr.iv, -1
  %scevgep100 = getelementptr i8, ptr addrspace(1) %lsr.iv98, i64 -8
  %14 = load double, ptr addrspace(1) %scevgep100, align 16, !invariant.load !299
  %15 = icmp ult i32 %13, 12
  br i1 %15, label %concatenate.pivot.8., label %concatenate.pivot.16.

concatenate.pivot.8.:                             ; preds = %reduce.42.1.clone.1.inner.loop_body.reduction_dim.0
  %16 = icmp ult i32 %13, 8
  %. = select i1 %16, i32 -4, i32 -8
  %arg3.arg4 = select i1 %16, ptr addrspace(1) %arg379, ptr addrspace(1) %arg481
  br label %concatenate.43.8.clone.1.merge

concatenate.pivot.16.:                            ; preds = %reduce.42.1.clone.1.inner.loop_body.reduction_dim.0
  %17 = icmp ult i32 %13, 16
  %18 = icmp ult i32 %13, 20
  %.72 = select i1 %18, i32 -16, i32 -20
  %arg6.arg7 = select i1 %18, ptr addrspace(1) %arg685, ptr addrspace(1) %arg787
  br i1 %17, label %concatenate.43.8.clone.1.merge, label %concatenate.pivot.20.

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  br label %concatenate.43.8.clone.1.merge

concatenate.43.8.clone.1.merge:                   ; preds = %concatenate.pivot.20., %concatenate.pivot.16., %concatenate.pivot.8.
  %.sink = phi i32 [ %., %concatenate.pivot.8. ], [ -12, %concatenate.pivot.16. ], [ %.72, %concatenate.pivot.20. ]
  %arg7.sink = phi ptr addrspace(1) [ %arg3.arg4, %concatenate.pivot.8. ], [ %arg583, %concatenate.pivot.16. ], [ %arg6.arg7, %concatenate.pivot.20. ]
  %19 = icmp ult i32 %13, 12
  %20 = add i32 %.sink, %lsr.iv
  %21 = add i32 %20, -1
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7.sink, i64 0, i64 %22
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !299
  %multiply.2971.5.clone.1 = fmul double %14, %24
  %multiply.2972.3.clone.1 = fmul double %24, %multiply.2971.5.clone.1
  %add.3619.i = fadd double %accumulator_0.010, %multiply.2972.3.clone.1
  %25 = load double, ptr addrspace(1) %lsr.iv98, align 8, !invariant.load !299
  br i1 %19, label %concatenate.pivot.8..1, label %concatenate.pivot.16..1

concatenate.pivot.16..1:                          ; preds = %concatenate.43.8.clone.1.merge
  %26 = icmp ult i32 %13, 16
  %27 = icmp ult i32 %13, 20
  %.72.1 = select i1 %27, i32 -16, i32 -20
  %arg6.arg7.1 = select i1 %27, ptr addrspace(1) %arg685, ptr addrspace(1) %arg787
  br i1 %26, label %concatenate.43.8.clone.1.merge.1, label %concatenate.pivot.20..1

concatenate.pivot.20..1:                          ; preds = %concatenate.pivot.16..1
  br label %concatenate.43.8.clone.1.merge.1

concatenate.pivot.8..1:                           ; preds = %concatenate.43.8.clone.1.merge
  %28 = icmp ult i32 %13, 8
  %..1 = select i1 %28, i32 -4, i32 -8
  %arg3.arg4.1 = select i1 %28, ptr addrspace(1) %arg379, ptr addrspace(1) %arg481
  br label %concatenate.43.8.clone.1.merge.1

concatenate.43.8.clone.1.merge.1:                 ; preds = %concatenate.pivot.8..1, %concatenate.pivot.20..1, %concatenate.pivot.16..1
  %.sink.1 = phi i32 [ %..1, %concatenate.pivot.8..1 ], [ -12, %concatenate.pivot.16..1 ], [ %.72.1, %concatenate.pivot.20..1 ]
  %arg7.sink.1 = phi ptr addrspace(1) [ %arg3.arg4.1, %concatenate.pivot.8..1 ], [ %arg583, %concatenate.pivot.16..1 ], [ %arg6.arg7.1, %concatenate.pivot.20..1 ]
  %29 = add i32 %.sink.1, %lsr.iv
  %30 = zext nneg i32 %29 to i64
  %31 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7.sink.1, i64 0, i64 %30
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !299
  %multiply.2971.5.clone.1.1 = fmul double %25, %32
  %multiply.2972.3.clone.1.1 = fmul double %32, %multiply.2971.5.clone.1.1
  %add.3619.i.1 = fadd double %add.3619.i, %multiply.2972.3.clone.1.1
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 2
  %scevgep99 = getelementptr i8, ptr addrspace(1) %lsr.iv98, i64 16
  %exitcond.1 = icmp eq i32 %lsr.iv.next, 25
  br i1 %exitcond.1, label %reduce.42.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.42.1.clone.1.inner.loop_body.reduction_dim.0, !llvm.loop !304

reduce.42.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %concatenate.43.8.clone.1.merge.1
  %multiply.2973.1.clone.1 = fmul double %add.3619.i.1, 5.000000e-01
  %add.4066.1.clone.1 = fsub double %multiply.2973.1.clone.1, %1
  %subtract.239.1.clone.1 = fsub double %0, %add.4066.1.clone.1
  %compare.653.1.clone.1 = fcmp uno double %subtract.239.1.clone.1, 0.000000e+00
  %33 = select i1 %compare.653.1.clone.1, double 0xFFF0000000000000, double %subtract.239.1.clone.1
  %34 = fcmp ole double %33, 0.000000e+00
  %minimum.9.1 = select i1 %34, double %33, double 0.000000e+00
  store double %minimum.9.1, ptr addrspace(1) %arg991, align 128
  store double %33, ptr addrspace(1) %arg1093, align 128
  store double %add.4066.1.clone.1, ptr addrspace(1) %arg1195, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_and_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg4) local_unnamed_addr #2 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg25, align 128, !invariant.load !299
  %1 = load i64, ptr addrspace(1) %arg37, align 128, !invariant.load !299
  %2 = icmp slt i64 %0, %1
  %3 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %4 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %5 = or i8 %4, %3
  %6 = trunc i8 %5 to i1
  %7 = xor i1 %6, true
  %8 = and i1 %2, %7
  %9 = zext i1 %8 to i8
  store i8 %9, ptr addrspace(1) %arg49, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %1 = icmp eq i64 %0, 0
  %2 = zext i1 %1 to i32
  store i32 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1) local_unnamed_addr #2 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg04, align 128, !invariant.load !299
  %1 = icmp slt i64 %0, 0
  %2 = and i64 %0, 1
  %3 = sub nsw i64 0, %2
  %4 = select i1 %1, i64 %3, i64 %2
  %.lobit = lshr i64 %4, 63
  %5 = and i64 %.lobit, %0
  %6 = add nsw i64 %4, 2
  %7 = trunc nuw i64 %5 to i1
  %8 = select i1 %7, i64 %6, i64 %4
  %9 = icmp eq i64 %8, 0
  %10 = zext i1 %9 to i32
  store i32 %10, ptr addrspace(1) %arg16, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg2252 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1250 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0248 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg1250, align 128, !invariant.load !299
  %1 = trunc i64 %0 to i32
  %2 = load <2 x i32>, ptr addrspace(1) %arg0248, align 128, !invariant.load !299
  %3 = extractelement <2 x i32> %2, i32 0
  %4 = extractelement <2 x i32> %2, i32 1
  %5 = add i32 %4, %1
  %6 = add i32 %5, %3
  %7 = tail call i32 @llvm.fshl.i32(i32 %5, i32 %5, i32 13)
  %8 = xor i32 %6, %7
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.fshl.i32(i32 %8, i32 %8, i32 15)
  %11 = xor i32 %9, %10
  %12 = add i32 %11, %9
  %13 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %11, i32 26)
  %14 = xor i32 %12, %13
  %15 = add i32 %14, %12
  %16 = add i32 %15, %4
  %17 = tail call i32 @llvm.fshl.i32(i32 %14, i32 %14, i32 6)
  %18 = xor i32 %15, %17
  %19 = xor i32 %3, %4
  %20 = xor i32 %19, 466688986
  %21 = add i32 %20, 1
  %22 = add i32 %21, %18
  %23 = add i32 %16, %22
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 17)
  %25 = xor i32 %23, %24
  %26 = add i32 %25, %23
  %27 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 29)
  %28 = xor i32 %26, %27
  %29 = add i32 %28, %26
  %30 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 16)
  %31 = xor i32 %29, %30
  %32 = add i32 %31, %29
  %33 = add i32 %32, %20
  %34 = tail call i32 @llvm.fshl.i32(i32 %31, i32 %31, i32 24)
  %35 = xor i32 %32, %34
  %36 = add i32 %3, 2
  %37 = add i32 %36, %35
  %38 = add i32 %33, %37
  %39 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 13)
  %40 = xor i32 %38, %39
  %41 = add i32 %40, %38
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 15)
  %43 = xor i32 %41, %42
  %44 = add i32 %43, %41
  %45 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 26)
  %46 = xor i32 %44, %45
  %47 = add i32 %46, %44
  %48 = add i32 %47, %3
  %49 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 6)
  %50 = xor i32 %47, %49
  %51 = add i32 %4, 3
  %52 = add i32 %51, %50
  %53 = add i32 %48, %52
  %54 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 17)
  %55 = xor i32 %53, %54
  %56 = add i32 %55, %53
  %57 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 29)
  %58 = xor i32 %56, %57
  %59 = add i32 %58, %56
  %60 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 16)
  %61 = xor i32 %59, %60
  %62 = add i32 %61, %59
  %63 = add i32 %62, %4
  %64 = tail call i32 @llvm.fshl.i32(i32 %61, i32 %61, i32 24)
  %65 = xor i32 %62, %64
  %66 = add i32 %20, 4
  %67 = add i32 %66, %65
  %68 = add i32 %63, %67
  %69 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 13)
  %70 = xor i32 %68, %69
  %71 = add i32 %70, %68
  %72 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 15)
  %73 = xor i32 %71, %72
  %74 = add i32 %73, %71
  %75 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 26)
  %76 = xor i32 %74, %75
  %77 = add i32 %76, %74
  %78 = add i32 %77, %20
  %79 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 6)
  %80 = xor i32 %77, %79
  %81 = add i32 %3, 5
  %82 = add i32 %81, %80
  %83 = insertelement <2 x i32> poison, i32 %78, i32 0
  %84 = insertelement <2 x i32> %83, i32 %82, i32 1
  store <2 x i32> %84, ptr addrspace(1) %arg2252, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_fusion_4(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = load double, ptr addrspace(1) %arg01, align 16, !invariant.load !299
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  store double %1, ptr addrspace(1) %3, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0x7FF8000000000000, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_convert_fusion(ptr noalias nocapture align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg02, align 128
  %1 = ashr i64 %0, 1
  %2 = tail call i64 @llvm.abs.i64(i64 %1, i1 true)
  %3 = tail call range(i64 0, 64) i64 @llvm.ctpop.i64(i64 %2)
  %4 = trunc nuw nsw i64 %3 to i32
  %5 = xor i64 %0, -1
  %6 = add i64 %0, 1
  %7 = and i64 %6, %5
  %8 = add i64 %7, -1
  %9 = sub i64 1, %7
  %10 = icmp slt i64 %8, 0
  %11 = select i1 %10, i64 %9, i64 %8
  %12 = tail call range(i64 0, 65) i64 @llvm.ctpop.i64(i64 %11)
  %13 = trunc nuw nsw i64 %12 to i32
  %14 = add nuw nsw i32 %4, 1
  %15 = sub nsw i32 %14, %13
  store i32 %15, ptr addrspace(1) %arg14, align 128
  store i32 %4, ptr addrspace(1) %arg26, align 128
  store i64 %6, ptr addrspace(1) %arg02, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_concatenate_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg15) local_unnamed_addr #4 {
entry:
  %arg1555 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1453 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1351 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1249 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1147 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1045 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg943 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg841 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg739 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg637 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg535 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg433 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg331 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg229 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg127 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg025 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg025, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !299
  %4 = icmp ult i32 %0, 12
  br i1 %4, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %entry
  %5 = trunc i64 %1 to i32
  %6 = icmp ult i32 %5, 4
  %7 = load i64, ptr addrspace(1) %arg1453, align 128, !invariant.load !299
  %8 = sitofp i64 %7 to double
  %9 = load double, ptr addrspace(1) %arg1351, align 128, !invariant.load !299
  %multiply.2909.21 = fmul double %9, %8
  br i1 %6, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  %10 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg127, i64 0, i64 %1
  %11 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg229, i64 0, i64 %1
  br label %concatenate.39.10.merge

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %12 = trunc i64 %1 to i32
  %13 = icmp ult i32 %12, 8
  br i1 %13, label %concatenate.pivot.4.17, label %concatenate.pivot.8.18

concatenate.pivot.4.17:                           ; preds = %concatenate.pivot.8.
  %14 = trunc i64 %1 to i32
  %15 = add nsw i32 %14, -4
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg331, i64 0, i64 %16
  %18 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg433, i64 0, i64 %16
  br label %concatenate.39.10.merge

concatenate.pivot.8.18:                           ; preds = %concatenate.pivot.8.
  %19 = trunc i64 %1 to i32
  %20 = add nsw i32 %19, -8
  %21 = zext nneg i32 %20 to i64
  %22 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg535, i64 0, i64 %21
  %23 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg637, i64 0, i64 %21
  br label %concatenate.39.10.merge

concatenate.pivot.16.:                            ; preds = %entry
  %24 = trunc i64 %1 to i32
  %25 = icmp ult i32 %24, 16
  br i1 %25, label %concatenate.pivot.12.19, label %concatenate.pivot.20.

concatenate.pivot.12.19:                          ; preds = %concatenate.pivot.16.
  %26 = trunc i64 %1 to i32
  %27 = add nsw i32 %26, -12
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg739, i64 0, i64 %28
  %30 = load i64, ptr addrspace(1) %arg1453, align 128, !invariant.load !299
  %31 = sitofp i64 %30 to double
  %32 = load double, ptr addrspace(1) %arg1351, align 128, !invariant.load !299
  %multiply.2909.218 = fmul double %32, %31
  %33 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg841, i64 0, i64 %28
  br label %concatenate.39.10.merge

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %34 = trunc i64 %1 to i32
  %35 = icmp ult i32 %34, 20
  %36 = load i64, ptr addrspace(1) %arg1453, align 128, !invariant.load !299
  %37 = sitofp i64 %36 to double
  %38 = load double, ptr addrspace(1) %arg1351, align 128, !invariant.load !299
  %multiply.2909.2111 = fmul double %38, %37
  br i1 %35, label %concatenate.pivot.16.20, label %concatenate.pivot.20.21

concatenate.pivot.16.20:                          ; preds = %concatenate.pivot.20.
  %39 = trunc i64 %1 to i32
  %40 = add nsw i32 %39, -16
  %41 = zext nneg i32 %40 to i64
  %42 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg943, i64 0, i64 %41
  %43 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1045, i64 0, i64 %41
  br label %concatenate.39.10.merge

concatenate.pivot.20.21:                          ; preds = %concatenate.pivot.20.
  %44 = trunc i64 %1 to i32
  %45 = add nsw i32 %44, -20
  %46 = zext nneg i32 %45 to i64
  %47 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1147, i64 0, i64 %46
  %48 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1249, i64 0, i64 %46
  br label %concatenate.39.10.merge

concatenate.39.10.merge:                          ; preds = %concatenate.pivot.20.21, %concatenate.pivot.16.20, %concatenate.pivot.12.19, %concatenate.pivot.8.18, %concatenate.pivot.4.17, %concatenate.pivot.0.
  %.sink24 = phi ptr addrspace(1) [ %48, %concatenate.pivot.20.21 ], [ %43, %concatenate.pivot.16.20 ], [ %33, %concatenate.pivot.12.19 ], [ %23, %concatenate.pivot.8.18 ], [ %18, %concatenate.pivot.4.17 ], [ %11, %concatenate.pivot.0. ]
  %multiply.2910.713.sink.in = phi double [ %multiply.2909.2111, %concatenate.pivot.20.21 ], [ %multiply.2909.2111, %concatenate.pivot.16.20 ], [ %multiply.2909.218, %concatenate.pivot.12.19 ], [ %multiply.2909.21, %concatenate.pivot.8.18 ], [ %multiply.2909.21, %concatenate.pivot.4.17 ], [ %multiply.2909.21, %concatenate.pivot.0. ]
  %.sink.in = phi ptr addrspace(1) [ %47, %concatenate.pivot.20.21 ], [ %42, %concatenate.pivot.16.20 ], [ %29, %concatenate.pivot.12.19 ], [ %22, %concatenate.pivot.8.18 ], [ %17, %concatenate.pivot.4.17 ], [ %10, %concatenate.pivot.0. ]
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !299
  %multiply.2910.713.sink = fmul double %multiply.2910.713.sink.in, 5.000000e-01
  %49 = load double, ptr addrspace(1) %.sink24, align 8, !invariant.load !299
  %multiply.2916.5 = fmul double %49, %multiply.2910.713.sink
  %add.3830.5 = fadd double %.sink, %multiply.2916.5
  %multiply.2917.5 = fmul double %3, %add.3830.5
  %multiply.2918.3 = fmul double %multiply.2917.5, 5.000000e-01
  %multiply.2919.5 = fmul double %add.3830.5, 5.000000e-01
  %multiply.2920.3 = fmul double %3, %multiply.2919.5
  %add.3831.1 = fadd double %multiply.2918.3, %multiply.2920.3
  %50 = getelementptr double, ptr addrspace(1) %arg1555, i64 %1
  store double %add.3831.1, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_exponential_fusion(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture align 128 dereferenceable(32) %arg4, ptr noalias nocapture align 128 dereferenceable(32) %arg5, ptr noalias nocapture align 128 dereferenceable(32) %arg6, ptr noalias nocapture align 128 dereferenceable(32) %arg7, ptr noalias nocapture align 128 dereferenceable(32) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg9) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg37, align 128, !invariant.load !299
  %5 = sitofp i64 %4 to double
  %6 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !299
  %multiply.2909.9.clone.1 = fmul double %6, %5
  %7 = getelementptr [24 x double], ptr addrspace(1) %arg13, i64 0, i64 %1
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 64
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %multiply.2921.1.clone.1 = fmul double %multiply.2909.9.clone.1, %9
  %add.3832.1.clone.1 = fadd double %3, %multiply.2921.1.clone.1
  %10 = tail call double @llvm.fma.f64(double %add.3832.1.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #13
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #13
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %add.3832.1.clone.1)
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
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #13
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #13
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #13
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3832.1.clone.1) #13
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #13
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %add.3832.1.clone.1, 0.000000e+00
  %36 = fadd double %add.3832.1.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #13
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #13
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %48 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %49 = load double, ptr addrspace(1) %48, align 8
  %50 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 128
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !299
  %multiply.2922.1.clone.1 = fmul double %multiply.2909.9.clone.1, %51
  %add.3834.1.clone.1 = fadd double %49, %multiply.2922.1.clone.1
  %52 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %53 = load double, ptr addrspace(1) %52, align 8
  %54 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 96
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !299
  %multiply.2923.1.clone.1 = fmul double %multiply.2909.9.clone.1, %55
  %add.3835.1.clone.1 = fadd double %53, %multiply.2923.1.clone.1
  %56 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  %57 = load double, ptr addrspace(1) %56, align 8
  %58 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 160
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !299
  %multiply.2924.1.clone.1 = fmul double %multiply.2909.9.clone.1, %59
  %add.3836.1.clone.1 = fadd double %57, %multiply.2924.1.clone.1
  %60 = getelementptr double, ptr addrspace(1) %arg715, i64 %1
  %61 = load double, ptr addrspace(1) %60, align 8
  %62 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 32
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !299
  %multiply.2925.1.clone.1 = fmul double %multiply.2909.9.clone.1, %63
  %add.3837.1.clone.1 = fadd double %61, %multiply.2925.1.clone.1
  %64 = getelementptr double, ptr addrspace(1) %arg817, i64 %1
  %65 = load double, ptr addrspace(1) %64, align 8
  %66 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %multiply.2929.1.clone.1 = fmul double %multiply.2909.9.clone.1, %66
  %add.3840.1.clone.1 = fadd double %65, %multiply.2929.1.clone.1
  %67 = getelementptr double, ptr addrspace(1) %arg919, i64 %1
  store double %z.2.i, ptr addrspace(1) %67, align 8
  store double %add.3832.1.clone.1, ptr addrspace(1) %2, align 8
  store double %add.3834.1.clone.1, ptr addrspace(1) %48, align 8
  store double %add.3835.1.clone.1, ptr addrspace(1) %52, align 8
  store double %add.3836.1.clone.1, ptr addrspace(1) %56, align 8
  store double %add.3837.1.clone.1, ptr addrspace(1) %60, align 8
  store double %add.3840.1.clone.1, ptr addrspace(1) %64, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !306
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !306
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !307
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !307
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !306
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !306
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !298
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !297
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr i32, ptr addrspace(1) %arg01, i64 %3
  %5 = load i32, ptr addrspace(1) %4, align 4, !invariant.load !299
  %6 = sitofp i32 %5 to double
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  store double %6, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %1 = icmp slt i64 %0, 192
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1417 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1417, 0
  %2 = add i64 %param_2.1417, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1417
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.17285 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = icmp ne i64 %param_1.17285, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1419 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1419, 0
  %2 = add i64 %param_2.1419, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1419
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.17304 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = icmp ne i64 %param_1.17304, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1480 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1480, 0
  %2 = add i64 %param_2.1480, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1480
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.17834 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !299
  %.not = icmp eq i64 %param_1.17834, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_56(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.1786 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !299
  %0 = icmp slt i64 %param_1.1786, 0
  %1 = add i64 %param_1.1786, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1786
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg04, i64 0, i64 %4
  store i32 1, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_55(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.1788 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !299
  %0 = icmp slt i64 %param_1.1788, 0
  %1 = add i64 %param_1.1788, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1788
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg04, i64 0, i64 %4
  store double 1.000000e+00, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1463 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1463, 0
  %2 = add i64 %param_2.1463, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1463
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.17754 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = icmp ne i64 %param_1.17754, 0
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i32 %8, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_44(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1440 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1440, 0
  %2 = add i64 %param_2.1440, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1440
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.17514 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %multiply.2900.1 = fmul double %param_1.17514, %param_1.17514
  %divide.587.1 = fdiv double 1.000000e+00, %multiply.2900.1
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.587.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1750 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1750, 0
  %2 = add i64 %param_1.1750, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1750
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.14794 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %multiply.2893.5 = fmul double %param_2.14794, %param_2.14794
  %multiply.2894.3 = fmul double %multiply.2893.5, 5.000000e-01
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2894.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1476 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1476, 0
  %2 = add i64 %param_2.1476, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1476
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.17544 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %multiply.2908.3 = fmul double %param_1.17544, 2.000000e+00
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2908.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_53(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1764 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1764, 0
  %2 = add i64 %param_1.1764, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1764
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg04, i64 0, i64 %5, i64 %thread_id_x
  store double 1.000000e+00, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1465 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1465, 0
  %2 = add i64 %param_2.1465, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1465
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.17774 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = sitofp i64 %param_1.17774 to double
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1464 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1464, 0
  %2 = add i64 %param_2.1464, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1464
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.17764 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.17764, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_32(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1743 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1743, 0
  %2 = add i64 %param_1.1743, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1743
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.14324 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %multiply.2877.2 = fmul double %param_2.14324, %param_2.14324
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2877.2, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_54(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1793 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1793, 0
  %2 = add i64 %param_1.1793, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1793
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg04, i64 0, i64 %5, i64 %thread_id_x
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1427 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1427, 0
  %2 = add i64 %param_2.1427, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1427
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.17384 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.17384, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_exponential_select_fusion(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg24) local_unnamed_addr #2 {
entry:
  %arg2460 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2358 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2256 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2154 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2052 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1950 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1848 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1746 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1644 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1542 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1440 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1338 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1236 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1134 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1032 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg930 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg828 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg726 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg216, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !299
  %4 = getelementptr double, ptr addrspace(1) %arg828, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !299
  %multiply.2873.3.clone.1 = fmul double %3, %5
  %6 = getelementptr double, ptr addrspace(1) %arg114, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %add.3802.3.clone.1 = fadd double %multiply.2873.3.clone.1, %7
  %8 = getelementptr double, ptr addrspace(1) %arg930, i64 %1
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %10 = fneg double %add.3802.3.clone.1
  %11 = tail call double @llvm.fma.f64(double %10, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #13
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #13
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %10)
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
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #13
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #13
  %29 = shl i32 %12, 20
  %30 = add i32 %28, %29
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %30) #13
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %10) #13
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #13
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %36 = fcmp ogt double %add.3802.3.clone.1, 0.000000e+00
  %37 = fsub double 0x7FF0000000000000, %add.3802.3.clone.1
  %z.0.i = select i1 %36, double 0.000000e+00, double %37
  %38 = fcmp olt float %34, 0x4010E90000000000
  br i1 %38, label %39, label %__nv_exp.exit

39:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %40 = sdiv i32 %12, 2
  %41 = shl i32 %40, 20
  %42 = add i32 %28, %41
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %42) #13
  %44 = sub nsw i32 %12, %40
  %45 = shl i32 %44, 20
  %46 = add nsw i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %46) #13
  %48 = fmul double %47, %43
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %39
  %z.2.i = phi double [ %31, %entry ], [ %48, %39 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %49 = getelementptr double, ptr addrspace(1) %arg1032, i64 %1
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !299
  %51 = getelementptr double, ptr addrspace(1) %arg1338, i64 %1
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !299
  %53 = getelementptr double, ptr addrspace(1) %arg1440, i64 %1
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !299
  %55 = getelementptr double, ptr addrspace(1) %arg012, i64 %1
  %56 = load double, ptr addrspace(1) %55, align 8
  %multiply.2876.5.clone.1 = fmul double %54, %56
  %add.3805.3.clone.1 = fadd double %52, %multiply.2876.5.clone.1
  %57 = tail call double @llvm.fma.f64(double %add.3805.3.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %58 = tail call i32 @llvm.nvvm.d2i.lo(double %57) #13
  %59 = tail call double @llvm.nvvm.add.rn.d(double %57, double 0xC338000000000000) #13
  %60 = tail call double @llvm.fma.f64(double %59, double 0xBFE62E42FEFA39EF, double %add.3805.3.clone.1)
  %61 = tail call double @llvm.fma.f64(double %59, double 0xBC7ABC9E3B39803F, double %60)
  %62 = tail call double @llvm.fma.f64(double %61, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %63 = tail call double @llvm.fma.f64(double %62, double %61, double 0x3EC71DEE62401315)
  %64 = tail call double @llvm.fma.f64(double %63, double %61, double 0x3EFA01997C89EB71)
  %65 = tail call double @llvm.fma.f64(double %64, double %61, double 0x3F2A01A014761F65)
  %66 = tail call double @llvm.fma.f64(double %65, double %61, double 0x3F56C16C1852B7AF)
  %67 = tail call double @llvm.fma.f64(double %66, double %61, double 0x3F81111111122322)
  %68 = tail call double @llvm.fma.f64(double %67, double %61, double 0x3FA55555555502A1)
  %69 = tail call double @llvm.fma.f64(double %68, double %61, double 0x3FC5555555555511)
  %70 = tail call double @llvm.fma.f64(double %69, double %61, double 0x3FE000000000000B)
  %71 = tail call double @llvm.fma.f64(double %70, double %61, double 1.000000e+00)
  %72 = tail call double @llvm.fma.f64(double %71, double %61, double 1.000000e+00)
  %73 = tail call i32 @llvm.nvvm.d2i.lo(double %72) #13
  %74 = tail call i32 @llvm.nvvm.d2i.hi(double %72) #13
  %75 = shl i32 %58, 20
  %76 = add i32 %74, %75
  %77 = tail call double @llvm.nvvm.lohi.i2d(i32 %73, i32 %76) #13
  %78 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.3.clone.1) #13
  %79 = bitcast i32 %78 to float
  %80 = tail call float @llvm.nvvm.fabs.f(float %79) #13
  %81 = fcmp olt float %80, 0x4010C46560000000
  br i1 %81, label %__nv_exp.exit7, label %__internal_fast_icmp_abs_lt.exit.i4

__internal_fast_icmp_abs_lt.exit.i4:              ; preds = %__nv_exp.exit
  %82 = fcmp olt double %add.3805.3.clone.1, 0.000000e+00
  %83 = fadd double %add.3805.3.clone.1, 0x7FF0000000000000
  %z.0.i5 = select i1 %82, double 0.000000e+00, double %83
  %84 = fcmp olt float %80, 0x4010E90000000000
  br i1 %84, label %85, label %__nv_exp.exit7

85:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i4
  %86 = sdiv i32 %58, 2
  %87 = shl i32 %86, 20
  %88 = add i32 %74, %87
  %89 = tail call double @llvm.nvvm.lohi.i2d(i32 %73, i32 %88) #13
  %90 = sub nsw i32 %58, %86
  %91 = shl i32 %90, 20
  %92 = add nsw i32 %91, 1072693248
  %93 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %92) #13
  %94 = fmul double %93, %89
  br label %__nv_exp.exit7

__nv_exp.exit7:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i4, %85
  %z.2.i6 = phi double [ %77, %__nv_exp.exit ], [ %94, %85 ], [ %z.0.i5, %__internal_fast_icmp_abs_lt.exit.i4 ]
  %95 = getelementptr double, ptr addrspace(1) %arg420, i64 %1
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !299
  %97 = load i64, ptr addrspace(1) %arg1236, align 128, !invariant.load !299
  %98 = icmp slt i64 %97, 0
  %99 = add i64 %97, 192
  %100 = select i1 %98, i64 %99, i64 %97
  %101 = trunc i64 %100 to i32
  %102 = tail call i32 @llvm.smax.i32(i32 %101, i32 0)
  %103 = tail call i32 @llvm.umin.i32(i32 %102, i32 191)
  %104 = zext nneg i32 %103 to i64
  %105 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg1134, i64 0, i64 %104, i64 %1, i64 0
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !299
  %107 = getelementptr double, ptr addrspace(1) %arg522, i64 %1
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !299
  %109 = getelementptr double, ptr addrspace(1) %arg624, i64 %1
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg726, i64 %1
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !299
  %113 = tail call double @llvm.fma.f64(double %112, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %114 = tail call i32 @llvm.nvvm.d2i.lo(double %113) #13
  %115 = tail call double @llvm.nvvm.add.rn.d(double %113, double 0xC338000000000000) #13
  %116 = tail call double @llvm.fma.f64(double %115, double 0xBFE62E42FEFA39EF, double %112)
  %117 = tail call double @llvm.fma.f64(double %115, double 0xBC7ABC9E3B39803F, double %116)
  %118 = tail call double @llvm.fma.f64(double %117, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %119 = tail call double @llvm.fma.f64(double %118, double %117, double 0x3EC71DEE62401315)
  %120 = tail call double @llvm.fma.f64(double %119, double %117, double 0x3EFA01997C89EB71)
  %121 = tail call double @llvm.fma.f64(double %120, double %117, double 0x3F2A01A014761F65)
  %122 = tail call double @llvm.fma.f64(double %121, double %117, double 0x3F56C16C1852B7AF)
  %123 = tail call double @llvm.fma.f64(double %122, double %117, double 0x3F81111111122322)
  %124 = tail call double @llvm.fma.f64(double %123, double %117, double 0x3FA55555555502A1)
  %125 = tail call double @llvm.fma.f64(double %124, double %117, double 0x3FC5555555555511)
  %126 = tail call double @llvm.fma.f64(double %125, double %117, double 0x3FE000000000000B)
  %127 = tail call double @llvm.fma.f64(double %126, double %117, double 1.000000e+00)
  %128 = tail call double @llvm.fma.f64(double %127, double %117, double 1.000000e+00)
  %129 = tail call i32 @llvm.nvvm.d2i.lo(double %128) #13
  %130 = tail call i32 @llvm.nvvm.d2i.hi(double %128) #13
  %131 = shl i32 %114, 20
  %132 = add i32 %130, %131
  %133 = tail call double @llvm.nvvm.lohi.i2d(i32 %129, i32 %132) #13
  %134 = tail call i32 @llvm.nvvm.d2i.hi(double %112) #13
  %135 = bitcast i32 %134 to float
  %136 = tail call float @llvm.nvvm.fabs.f(float %135) #13
  %137 = fcmp olt float %136, 0x4010C46560000000
  br i1 %137, label %__nv_exp.exit11, label %__internal_fast_icmp_abs_lt.exit.i8

__internal_fast_icmp_abs_lt.exit.i8:              ; preds = %__nv_exp.exit7
  %138 = fcmp olt double %112, 0.000000e+00
  %139 = fadd double %112, 0x7FF0000000000000
  %z.0.i9 = select i1 %138, double 0.000000e+00, double %139
  %140 = fcmp olt float %136, 0x4010E90000000000
  br i1 %140, label %141, label %__nv_exp.exit11

141:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i8
  %142 = sdiv i32 %114, 2
  %143 = shl i32 %142, 20
  %144 = add i32 %130, %143
  %145 = tail call double @llvm.nvvm.lohi.i2d(i32 %129, i32 %144) #13
  %146 = sub nsw i32 %114, %142
  %147 = shl i32 %146, 20
  %148 = add nsw i32 %147, 1072693248
  %149 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %148) #13
  %150 = fmul double %149, %145
  br label %__nv_exp.exit11

__nv_exp.exit11:                                  ; preds = %__nv_exp.exit7, %__internal_fast_icmp_abs_lt.exit.i8, %141
  %z.2.i10 = phi double [ %133, %__nv_exp.exit7 ], [ %150, %141 ], [ %z.0.i9, %__internal_fast_icmp_abs_lt.exit.i8 ]
  %divide.581.1.clone.1 = fdiv double 1.000000e+00, %110
  %compare.625.43.clone.1 = fcmp ogt double %z.2.i6, 1.000000e-128
  %151 = select i1 %compare.625.43.clone.1, double %z.2.i6, double %96
  %divide.576.5.clone.1 = fdiv double 1.000000e+00, %50
  %add.3806.5.clone.1 = fadd double %divide.576.5.clone.1, %151
  %divide.577.1.clone.1 = fdiv double 1.000000e+00, %add.3806.5.clone.1
  %multiply.2881.13 = fmul double %151, %divide.577.1.clone.1
  %multiply.2882.5 = fmul double %108, %multiply.2881.13
  %multiply.2877.10.clone.1 = fmul double %9, %9
  %add.3804.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.575.1.clone.1 = fdiv double 1.000000e+00, %add.3804.1.clone.1
  %subtract.229.25.clone.1 = fsub double 1.000000e+00, %divide.575.1.clone.1
  %multiply.2874.21.clone.1 = fmul double %divide.575.1.clone.1, %subtract.229.25.clone.1
  %multiply.2878.11.clone.1 = fmul double %multiply.2877.10.clone.1, %multiply.2874.21.clone.1
  %add.3807.9.clone.1 = fadd double %multiply.2878.11.clone.1, %divide.577.1.clone.1
  %compare.626.19.clone.1 = fcmp ogt double %add.3807.9.clone.1, 1.000000e-128
  %152 = select i1 %compare.626.19.clone.1, double %add.3807.9.clone.1, double 0x7FF8000000000000
  %multiply.2883.1.clone.1 = fmul double %add.3806.5.clone.1, %152
  %divide.580.1.clone.1 = fdiv double 1.000000e+00, %multiply.2883.1.clone.1
  %multiply.2875.9.clone.1 = fmul double %9, %multiply.2874.21.clone.1
  %divide.578.5.clone.1 = fdiv double %multiply.2875.9.clone.1, %152
  %subtract.230.9.clone.1 = fsub double %106, %divide.575.1.clone.1
  %divide.579.5.clone.1 = fdiv double %subtract.230.9.clone.1, %multiply.2874.21.clone.1
  %multiply.2879.1.clone.1 = fmul double %divide.579.5.clone.1, %divide.578.5.clone.1
  %add.3810.1.clone.1 = fadd double %add.3802.3.clone.1, %multiply.2879.1.clone.1
  %subtract.231.2.clone.1 = fsub double %add.3810.1.clone.1, %add.3802.3.clone.1
  %multiply.2884.2.clone.1 = fmul double %subtract.231.2.clone.1, %subtract.231.2.clone.1
  %multiply.2885.1.clone.1 = fmul double %divide.577.1.clone.1, %multiply.2884.2.clone.1
  %add.3812.1.clone.1 = fadd double %divide.580.1.clone.1, %multiply.2885.1.clone.1
  %add.3814.1.clone.1 = fadd double %add.3812.1.clone.1, -1.000000e+00
  %multiply.2886.2 = fmul double %multiply.2882.5, %add.3814.1.clone.1
  %multiply.2880.3 = fmul double %3, %56
  %add.3811.3 = fadd double %7, %multiply.2880.3
  %153 = tail call double @llvm.fabs.f64(double %add.3810.1.clone.1)
  %154 = call i1 @llvm.is.fpclass.f64(double %add.3810.1.clone.1, i32 504)
  %compare.628.7 = fcmp olt double %153, 1.400000e+01
  %155 = and i1 %154, %compare.628.7
  %compare.629.11.clone.1 = fcmp ogt double %z.2.i10, 1.000000e-128
  %156 = select i1 %compare.629.11.clone.1, double %z.2.i10, double %96
  %add.3815.5.clone.1 = fadd double %divide.581.1.clone.1, %156
  %divide.582.1.clone.1 = fdiv double 1.000000e+00, %add.3815.5.clone.1
  %multiply.2887.9 = fmul double %divide.582.1.clone.1, 2.000000e+00
  %divide.583.5 = fdiv double 1.000000e+00, %multiply.2887.9
  %multiply.2888.1 = fmul double %multiply.2886.2, %divide.583.5
  %157 = getelementptr i64, ptr addrspace(1) %arg318, i64 %1
  %158 = load i64, ptr addrspace(1) %157, align 8, !invariant.load !299
  %159 = sitofp i64 %158 to double
  %multiply.2889.1 = fmul double %multiply.2888.1, %159
  %add.3816.1 = fadd double %add.3811.3, %multiply.2889.1
  %160 = select i1 %155, double %add.3816.1, double %56
  %.not = icmp eq i64 %158, 0
  %add.3817.2.clone.1 = fadd double %divide.581.1.clone.1, %z.2.i10
  %divide.584.1.clone.1 = fdiv double 1.000000e+00, %add.3817.2.clone.1
  %multiply.2890.4.clone.1 = fmul double %multiply.2882.5, %multiply.2882.5
  %multiply.2891.11.clone.1 = fmul double %multiply.2890.4.clone.1, 5.000000e-01
  %multiply.2892.5.clone.1 = fmul double %multiply.2890.4.clone.1, %add.3814.1.clone.1
  %add.3819.9.clone.1 = fadd double %multiply.2891.11.clone.1, %multiply.2892.5.clone.1
  %multiply.2893.11.clone.1 = fmul double %108, %108
  %multiply.2894.9.clone.1 = fmul double %multiply.2893.11.clone.1, 5.000000e-01
  %multiply.2895.4.clone.1 = fmul double %multiply.2881.13, %multiply.2894.9.clone.1
  %multiply.2896.5.clone.1 = fmul double %multiply.2895.4.clone.1, %add.3814.1.clone.1
  %subtract.232.7.clone.1 = fsub double %add.3819.9.clone.1, %multiply.2896.5.clone.1
  %multiply.2897.5.clone.1 = fmul double %subtract.232.7.clone.1, %159
  %add.3820.3.clone.1 = fadd double %multiply.2897.5.clone.1, %divide.582.1.clone.1
  %compare.632.5.clone.1 = fcmp ogt double %add.3820.3.clone.1, 1.000000e-128
  %161 = select i1 %compare.632.5.clone.1, double %add.3820.3.clone.1, double %96
  %162 = select i1 %.not, double %divide.584.1.clone.1, double %161
  %163 = select i1 %155, double %162, double %110
  %164 = select i1 %155, double %add.3810.1.clone.1, double %5
  %165 = select i1 %155, double %152, double %50
  store double %160, ptr addrspace(1) %55, align 8
  store double %163, ptr addrspace(1) %109, align 8
  %166 = getelementptr double, ptr addrspace(1) %arg1542, i64 %1
  store double %divide.582.1.clone.1, ptr addrspace(1) %166, align 8
  %167 = getelementptr double, ptr addrspace(1) %arg1644, i64 %1
  store double %z.2.i10, ptr addrspace(1) %167, align 8
  %168 = getelementptr double, ptr addrspace(1) %arg1746, i64 %1
  store double %divide.581.1.clone.1, ptr addrspace(1) %168, align 8
  %169 = getelementptr double, ptr addrspace(1) %arg1848, i64 %1
  store double %add.3814.1.clone.1, ptr addrspace(1) %169, align 8
  %170 = getelementptr double, ptr addrspace(1) %arg1950, i64 %1
  store double %164, ptr addrspace(1) %170, align 8
  %171 = getelementptr double, ptr addrspace(1) %arg2052, i64 %1
  store double %165, ptr addrspace(1) %171, align 8
  %172 = getelementptr double, ptr addrspace(1) %arg2154, i64 %1
  store double %add.3810.1.clone.1, ptr addrspace(1) %172, align 8
  %173 = getelementptr double, ptr addrspace(1) %arg2256, i64 %1
  store double %divide.577.1.clone.1, ptr addrspace(1) %173, align 8
  %174 = getelementptr double, ptr addrspace(1) %arg2358, i64 %1
  store double %z.2.i6, ptr addrspace(1) %174, align 8
  %175 = getelementptr double, ptr addrspace(1) %arg2460, i64 %1
  store double %divide.575.1.clone.1, ptr addrspace(1) %175, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_4(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1779 = load i64, ptr addrspace(1) %arg117, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1779, 0
  %2 = add i64 %param_1.1779, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1779
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg219, i64 %thread_id_x
  %param_2.14694 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg831, i64 %thread_id_x
  %param_8.3305 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %8 = getelementptr double, ptr addrspace(1) %arg627, i64 %thread_id_x
  %param_6.5316 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %compare.625.39 = fcmp ogt double %param_6.5316, 1.000000e-128
  %9 = getelementptr double, ptr addrspace(1) %arg729, i64 %thread_id_x
  %param_7.3969 = load double, ptr addrspace(1) %9, align 8, !invariant.load !299
  %10 = select i1 %compare.625.39, double %param_6.5316, double %param_7.3969
  %11 = getelementptr double, ptr addrspace(1) %arg525, i64 %thread_id_x
  %param_5.73110 = load double, ptr addrspace(1) %11, align 8, !invariant.load !299
  %multiply.2881.29 = fmul double %10, %param_5.73110
  %multiply.2882.17 = fmul double %param_8.3305, %multiply.2881.29
  %multiply.2890.6 = fmul double %multiply.2882.17, %multiply.2882.17
  %multiply.2891.13 = fmul double %multiply.2890.6, 5.000000e-01
  %12 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.92911 = load double, ptr addrspace(1) %12, align 8, !invariant.load !299
  %multiply.2892.7 = fmul double %param_4.92911, %multiply.2890.6
  %add.3819.11 = fadd double %multiply.2891.13, %multiply.2892.7
  %multiply.2893.13 = fmul double %param_8.3305, %param_8.3305
  %multiply.2894.11 = fmul double %multiply.2893.13, 5.000000e-01
  %multiply.2895.6 = fmul double %multiply.2894.11, %multiply.2881.29
  %multiply.2896.7 = fmul double %param_4.92911, %multiply.2895.6
  %subtract.232.9 = fsub double %add.3819.11, %multiply.2896.7
  %13 = getelementptr i64, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.118014 = load i64, ptr addrspace(1) %13, align 8, !invariant.load !299
  %14 = sitofp i64 %param_3.118014 to double
  %multiply.2897.7 = fmul double %subtract.232.9, %14
  %add.3820.5 = fadd double %param_2.14694, %multiply.2897.7
  %compare.632.3 = fcmp ogt double %add.3820.5, 1.000000e-128
  %15 = zext i1 %compare.632.3 to i8
  %16 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg015, i64 0, i64 %5, i64 %thread_id_x
  store i8 %15, ptr addrspace(1) %16, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1481 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1481, 0
  %2 = add i64 %param_2.1481, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1481
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.17845 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = tail call double @llvm.fabs.f64(double %param_1.17845)
  %8 = call i1 @llvm.is.fpclass.f64(double %param_1.17845, i32 504)
  %compare.628.13 = fcmp olt double %7, 1.400000e+01
  %9 = and i1 %8, %compare.628.13
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1483 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1483, 0
  %2 = add i64 %param_2.1483, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1483
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.17854 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = tail call double @llvm.fabs.f64(double %param_1.17854)
  %8 = call i1 @llvm.is.fpclass.f64(double %param_1.17854, i32 504)
  %compare.628.11 = fcmp olt double %7, 1.400000e+01
  %9 = and i1 %8, %compare.628.11
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_48(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1470 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.1470, 0
  %2 = add i64 %param_2.1470, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1470
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.17424 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %compare.629.3 = fcmp ogt double %param_1.17424, 1.000000e-128
  %7 = zext i1 %compare.629.3 to i8
  %8 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_31(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1780 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1780, 0
  %2 = add i64 %param_1.1780, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1780
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.14714 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.9305 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %multiply.2877.6 = fmul double %param_4.9305, %param_4.9305
  %8 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11818 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %subtract.229.29 = fsub double 1.000000e+00, %param_3.11818
  %multiply.2874.25 = fmul double %param_3.11818, %subtract.229.29
  %multiply.2878.7 = fmul double %multiply.2877.6, %multiply.2874.25
  %add.3807.5 = fadd double %param_2.14714, %multiply.2878.7
  %compare.626.3 = fcmp ogt double %add.3807.5, 1.000000e-128
  %9 = zext i1 %compare.626.3 to i8
  %10 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_38(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1767 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1767, 0
  %2 = add i64 %param_1.1767, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1767
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.9314 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %divide.576.7 = fdiv double 1.000000e+00, %param_4.9314
  %7 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.14555 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %compare.625.45 = fcmp ogt double %param_2.14555, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.11708 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %9 = select i1 %compare.625.45, double %param_2.14555, double %param_3.11708
  %add.3806.7 = fadd double %divide.576.7, %9
  %multiply.2901.1 = fmul double %add.3806.7, %add.3806.7
  %divide.588.1 = fdiv double 1.000000e+00, %multiply.2901.1
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg09, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.588.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1749 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1749, 0
  %2 = add i64 %param_1.1749, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1749
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.14384 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.11585 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %compare.629.9 = fcmp ogt double %param_3.11585, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.9168 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %9 = select i1 %compare.629.9, double %param_3.11585, double %param_4.9168
  %add.3815.3 = fadd double %param_2.14384, %9
  %multiply.2899.1 = fmul double %add.3815.3, %add.3815.3
  %divide.586.1 = fdiv double 1.000000e+00, %multiply.2899.1
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg09, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.586.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1762 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1762, 0
  %2 = add i64 %param_1.1762, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1762
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.14514 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg312, i64 %thread_id_x
  %param_3.11675 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %add.3817.1 = fadd double %param_2.14514, %param_3.11675
  %multiply.2906.1 = fmul double %add.3817.1, %add.3817.1
  %divide.592.1 = fdiv double 1.000000e+00, %multiply.2906.1
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.592.1, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg623 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1729 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1729, 0
  %2 = add i64 %param_1.1729, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1729
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg623, i64 %thread_id_x
  %param_6.5354 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.9115 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %compare.625.31 = fcmp ogt double %param_4.9115, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7148 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %9 = select i1 %compare.625.31, double %param_4.9115, double %param_5.7148
  %10 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11479 = load double, ptr addrspace(1) %10, align 8, !invariant.load !299
  %multiply.2881.21 = fmul double %9, %param_3.11479
  %multiply.2882.13 = fmul double %param_6.5354, %multiply.2881.21
  %11 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.141810 = load double, ptr addrspace(1) %11, align 8, !invariant.load !299
  %multiply.2886.1 = fmul double %param_2.141810, %multiply.2882.13
  %12 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2886.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1756 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1756, 0
  %2 = add i64 %param_1.1756, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1756
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.14454 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %multiply.2887.3 = fmul double %param_2.14454, 2.000000e+00
  %multiply.2905.1 = fmul double %multiply.2887.3, %multiply.2887.3
  %divide.591.1 = fdiv double 1.000000e+00, %multiply.2905.1
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.591.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1731 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1731, 0
  %2 = add i64 %param_1.1731, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1731
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.14204 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %multiply.2887.7 = fmul double %param_2.14204, 2.000000e+00
  %divide.583.3 = fdiv double 1.000000e+00, %multiply.2887.7
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.583.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5) local_unnamed_addr #2 {
entry:
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1781 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1781, 0
  %2 = add i64 %param_1.1781, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1781
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.14774 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg416, i64 %thread_id_x
  %param_4.9365 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %8 = getelementptr double, ptr addrspace(1) %arg518, i64 %thread_id_x
  %param_5.7396 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %multiply.2873.9 = fmul double %param_4.9365, %param_5.7396
  %9 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.11867 = load double, ptr addrspace(1) %9, align 8, !invariant.load !299
  %add.3802.9 = fadd double %multiply.2873.9, %param_3.11867
  %subtract.231.1 = fsub double %param_2.14774, %add.3802.9
  %multiply.2904.3 = fmul double %subtract.231.1, 2.000000e+00
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2904.3, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5) local_unnamed_addr #2 {
entry:
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1772 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1772, 0
  %2 = add i64 %param_1.1772, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1772
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.14604 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg416, i64 %thread_id_x
  %param_4.9255 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %8 = getelementptr double, ptr addrspace(1) %arg518, i64 %thread_id_x
  %param_5.7276 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %multiply.2873.5 = fmul double %param_4.9255, %param_5.7276
  %9 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.11737 = load double, ptr addrspace(1) %9, align 8, !invariant.load !299
  %add.3802.5 = fadd double %multiply.2873.5, %param_3.11737
  %subtract.231.3 = fsub double %param_2.14604, %add.3802.5
  %multiply.2884.1 = fmul double %subtract.231.3, %subtract.231.3
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2884.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_46(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1179 = load i64, ptr addrspace(1) %arg314, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_3.1179, 0
  %2 = add i64 %param_3.1179, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.1179
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.17464 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %compare.629.7 = fcmp ogt double %param_1.17464, 1.000000e-128
  %7 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.14357 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %8 = select i1 %compare.629.7, double %param_1.17464, double %param_2.14357
  %9 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x
  store double %8, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5) local_unnamed_addr #2 {
entry:
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1768 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1768, 0
  %2 = add i64 %param_1.1768, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1768
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7374 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11715 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %compare.625.27 = fcmp ogt double %param_3.11715, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9238 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %9 = select i1 %compare.625.27, double %param_3.11715, double %param_4.9238
  %10 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.14569 = load double, ptr addrspace(1) %10, align 8, !invariant.load !299
  %multiply.2881.17 = fmul double %9, %param_2.14569
  %multiply.2882.9 = fmul double %param_5.7374, %multiply.2881.17
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2882.9, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5) local_unnamed_addr #2 {
entry:
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1782 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1782, 0
  %2 = add i64 %param_1.1782, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1782
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7404 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11875 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %compare.625.25 = fcmp ogt double %param_3.11875, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9378 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %9 = select i1 %compare.625.25, double %param_3.11875, double %param_4.9378
  %10 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.14789 = load double, ptr addrspace(1) %10, align 8, !invariant.load !299
  %multiply.2881.15 = fmul double %9, %param_2.14789
  %multiply.2882.7 = fmul double %param_5.7404, %multiply.2881.15
  %multiply.2907.3 = fmul double %multiply.2882.7, 2.000000e+00
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2907.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5) local_unnamed_addr #2 {
entry:
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1758 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1758, 0
  %2 = add i64 %param_1.1758, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1758
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7364 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11645 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %compare.625.29 = fcmp ogt double %param_3.11645, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9198 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %9 = select i1 %compare.625.29, double %param_3.11645, double %param_4.9198
  %10 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.14479 = load double, ptr addrspace(1) %10, align 8, !invariant.load !299
  %multiply.2881.19 = fmul double %9, %param_2.14479
  %multiply.2882.11 = fmul double %param_5.7364, %multiply.2881.19
  %multiply.2890.1 = fmul double %multiply.2882.11, %multiply.2882.11
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2890.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1766 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1766, 0
  %2 = add i64 %param_1.1766, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1766
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.11694 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %compare.625.17 = fcmp ogt double %param_3.11694, 1.000000e-128
  %7 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.9217 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %8 = select i1 %compare.625.17, double %param_3.11694, double %param_4.9217
  %9 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.14548 = load double, ptr addrspace(1) %9, align 8, !invariant.load !299
  %multiply.2881.7 = fmul double %8, %param_2.14548
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg09, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2881.7, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5) local_unnamed_addr #2 {
entry:
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1747 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1747, 0
  %2 = add i64 %param_1.1747, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1747
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7414 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %multiply.2893.9 = fmul double %param_5.7414, %param_5.7414
  %multiply.2894.7 = fmul double %multiply.2893.9, 5.000000e-01
  %7 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11565 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %compare.625.19 = fcmp ogt double %param_3.11565, 1.000000e-128
  %8 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9158 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %9 = select i1 %compare.625.19, double %param_3.11565, double %param_4.9158
  %10 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.14369 = load double, ptr addrspace(1) %10, align 8, !invariant.load !299
  %multiply.2881.9 = fmul double %9, %param_2.14369
  %multiply.2895.1 = fmul double %multiply.2894.7, %multiply.2881.9
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2895.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_29(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1789 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1789, 0
  %2 = add i64 %param_1.1789, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1789
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.14854 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.9425 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %multiply.2877.4 = fmul double %param_4.9425, %param_4.9425
  %8 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11918 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %subtract.229.27 = fsub double 1.000000e+00, %param_3.11918
  %multiply.2874.23 = fmul double %param_3.11918, %subtract.229.27
  %multiply.2878.5 = fmul double %multiply.2877.4, %multiply.2874.23
  %add.3807.3 = fadd double %param_2.14854, %multiply.2878.5
  %compare.626.15 = fcmp ogt double %add.3807.3, 1.000000e-128
  %9 = select i1 %compare.626.15, double %add.3807.3, double 0x7FF8000000000000
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3) local_unnamed_addr #2 {
entry:
  %arg323 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg221 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg017 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1745 = load i64, ptr addrspace(1) %arg119, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1745, 0
  %2 = add i64 %param_1.1745, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1745
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_3.1154 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg323, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_3.115411 = load double, ptr addrspace(1) %param_3.1154, align 8, !invariant.load !299
  %6 = getelementptr double, ptr addrspace(1) %arg221, i64 %thread_id_x
  %param_2.143412 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %subtract.230.7 = fsub double %param_3.115411, %param_2.143412
  %subtract.229.19 = fsub double 1.000000e+00, %param_2.143412
  %multiply.2874.15 = fmul double %param_2.143412, %subtract.229.19
  %divide.579.3 = fdiv double %subtract.230.7, %multiply.2874.15
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg017, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.579.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_37(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1769 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1769, 0
  %2 = add i64 %param_1.1769, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1769
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.14574 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %subtract.229.15 = fsub double 1.000000e+00, %param_2.14574
  %multiply.2874.11 = fmul double %param_2.14574, %subtract.229.15
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2874.11, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_33(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1727 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1727, 0
  %2 = add i64 %param_1.1727, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1727
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.14164 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %subtract.229.13 = fsub double 1.000000e+00, %param_2.14164
  %multiply.2874.9 = fmul double %param_2.14164, %subtract.229.13
  %multiply.2902.1 = fmul double %multiply.2874.9, %multiply.2874.9
  %divide.589.1 = fdiv double 1.000000e+00, %multiply.2902.1
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.589.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1752 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1752, 0
  %2 = add i64 %param_1.1752, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1752
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.11954 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.14895 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %subtract.229.23 = fsub double 1.000000e+00, %param_2.14895
  %multiply.2874.19 = fmul double %param_2.14895, %subtract.229.23
  %multiply.2875.7 = fmul double %param_3.11954, %multiply.2874.19
  %8 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.9468 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %multiply.2877.16 = fmul double %param_3.11954, %param_3.11954
  %multiply.2878.17 = fmul double %multiply.2877.16, %multiply.2874.19
  %add.3807.15 = fadd double %param_4.9468, %multiply.2878.17
  %compare.626.17 = fcmp ogt double %add.3807.15, 1.000000e-128
  %9 = select i1 %compare.626.17, double %add.3807.15, double 0x7FF8000000000000
  %divide.578.3 = fdiv double %multiply.2875.7, %9
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.578.3, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1792 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1792, 0
  %2 = add i64 %param_1.1792, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1792
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.14884 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.9455 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %multiply.2877.14 = fmul double %param_4.9455, %param_4.9455
  %8 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11948 = load double, ptr addrspace(1) %8, align 8, !invariant.load !299
  %subtract.229.37 = fsub double 1.000000e+00, %param_3.11948
  %multiply.2874.33 = fmul double %param_3.11948, %subtract.229.37
  %multiply.2878.15 = fmul double %multiply.2877.14, %multiply.2874.33
  %add.3807.13 = fadd double %param_2.14884, %multiply.2878.15
  %compare.626.13 = fcmp ogt double %add.3807.13, 1.000000e-128
  %9 = select i1 %compare.626.13, double %add.3807.13, double 0x7FF8000000000000
  %multiply.2903.1 = fmul double %9, %9
  %divide.590.1 = fdiv double 1.000000e+00, %multiply.2903.1
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.590.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3) local_unnamed_addr #2 {
entry:
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1778 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1778, 0
  %2 = add i64 %param_1.1778, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1778
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_3.1175 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr addrspace(1) %arg319, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_3.117511 = load double, ptr addrspace(1) %param_3.1175, align 8, !invariant.load !299
  %6 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.146612 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %subtract.230.3 = fsub double %param_3.117511, %param_2.146612
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.230.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_36(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1771 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1771, 0
  %2 = add i64 %param_1.1771, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1771
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.14594 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %subtract.229.3 = fsub double 1.000000e+00, %param_2.14594
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.229.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_28(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1748 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_1.1748, 0
  %2 = add i64 %param_1.1748, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1748
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.14374 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.11575 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %subtract.229.17 = fsub double 1.000000e+00, %param_3.11575
  %multiply.2874.13 = fmul double %param_3.11575, %subtract.229.17
  %multiply.2875.3 = fmul double %param_2.14374, %multiply.2874.13
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2875.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_subtract_fusion(ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg3) local_unnamed_addr #2 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !298
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !297
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !299
  %6 = fcmp ole double %5, -3.000000e+01
  %7 = select i1 %6, double -3.000000e+01, double %5
  %8 = fcmp oge double %7, 3.000000e+01
  %.neg = fneg double %7
  %9 = select i1 %8, double -3.000000e+01, double %.neg
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #13
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #13
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
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #13
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #13
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #13
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %9) #13
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #13
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %9, 0.000000e+00
  %36 = fadd double %9, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #13
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #13
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.3839.5 = fadd double %z.2.i, 1.000000e+00
  %divide.593.5 = fdiv double 1.000000e+00, %add.3839.5
  %subtract.233.4 = fsub double 1.000000e+00, %divide.593.5
  %48 = getelementptr float, ptr addrspace(1) %arg25, i64 %3
  %49 = load float, ptr addrspace(1) %48, align 4, !invariant.load !299
  %50 = fpext float %49 to double
  %multiply.2926.3 = fmul double %subtract.233.4, %50
  %51 = getelementptr float, ptr addrspace(1) %arg01, i64 %3
  %52 = load float, ptr addrspace(1) %51, align 4, !invariant.load !299
  %53 = fpext float %52 to double
  %multiply.2927.3 = fmul double %divide.593.5, %53
  %subtract.234.1 = fsub double %multiply.2926.3, %multiply.2927.3
  %54 = getelementptr double, ptr addrspace(1) %arg37, i64 %3
  store double %subtract.234.1, ptr addrspace(1) %54, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_exponential_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg3) local_unnamed_addr #2 {
entry:
  %arg337 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg235 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg133 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg031 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !308
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !297
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = and i32 %1, 3
  %4 = lshr i32 %linear_index, 2
  %.lhs.trunc = trunc nuw nsw i32 %4 to i16
  %5 = urem i16 %.lhs.trunc, 192
  %6 = icmp ugt i32 %0, 5
  %7 = zext nneg i32 %3 to i64
  br i1 %6, label %in_bounds-true, label %entry.in_bounds-after_crit_edge

entry.in_bounds-after_crit_edge:                  ; preds = %entry
  %.pre29 = zext nneg i16 %5 to i64
  %.phi.trans.insert = getelementptr inbounds [4 x double], ptr addrspace(1) %arg235, i64 0, i64 %7
  %.pre = load double, ptr addrspace(1) %.phi.trans.insert, align 8, !invariant.load !299
  %.phi.trans.insert39 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg133, i64 0, i64 %.pre29, i64 %7
  %.pre40 = load double, ptr addrspace(1) %.phi.trans.insert39, align 8, !invariant.load !299
  %.phi.trans.insert41 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg031, i64 0, i64 %7
  %.pre42 = load double, ptr addrspace(1) %.phi.trans.insert41, align 8, !invariant.load !299
  %.pre43 = fmul double %.pre, %.pre40
  %.pre44 = fadd double %.pre43, %.pre42
  br label %in_bounds-after

in_bounds-after:                                  ; preds = %entry.in_bounds-after_crit_edge, %in_bounds-true
  %add.3841.523.1.pre-phi = phi double [ %.pre44, %entry.in_bounds-after_crit_edge ], [ %add.3841.5, %in_bounds-true ]
  %pad_result_addr.0 = phi double [ 0.000000e+00, %entry.in_bounds-after_crit_edge ], [ %add.3841.5, %in_bounds-true ]
  %8 = fcmp ole double %add.3841.523.1.pre-phi, 0.000000e+00
  %maximum.41.i.1 = select i1 %8, double 0.000000e+00, double %add.3841.523.1.pre-phi
  %subtract.235.5 = fsub double %pad_result_addr.0, %maximum.41.i.1
  %9 = tail call double @llvm.fma.f64(double %subtract.235.5, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %10 = tail call i32 @llvm.nvvm.d2i.lo(double %9) #13
  %11 = tail call double @llvm.nvvm.add.rn.d(double %9, double 0xC338000000000000) #13
  %12 = tail call double @llvm.fma.f64(double %11, double 0xBFE62E42FEFA39EF, double %subtract.235.5)
  %13 = tail call double @llvm.fma.f64(double %11, double 0xBC7ABC9E3B39803F, double %12)
  %14 = tail call double @llvm.fma.f64(double %13, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %15 = tail call double @llvm.fma.f64(double %14, double %13, double 0x3EC71DEE62401315)
  %16 = tail call double @llvm.fma.f64(double %15, double %13, double 0x3EFA01997C89EB71)
  %17 = tail call double @llvm.fma.f64(double %16, double %13, double 0x3F2A01A014761F65)
  %18 = tail call double @llvm.fma.f64(double %17, double %13, double 0x3F56C16C1852B7AF)
  %19 = tail call double @llvm.fma.f64(double %18, double %13, double 0x3F81111111122322)
  %20 = tail call double @llvm.fma.f64(double %19, double %13, double 0x3FA55555555502A1)
  %21 = tail call double @llvm.fma.f64(double %20, double %13, double 0x3FC5555555555511)
  %22 = tail call double @llvm.fma.f64(double %21, double %13, double 0x3FE000000000000B)
  %23 = tail call double @llvm.fma.f64(double %22, double %13, double 1.000000e+00)
  %24 = tail call double @llvm.fma.f64(double %23, double %13, double 1.000000e+00)
  %25 = tail call i32 @llvm.nvvm.d2i.lo(double %24) #13
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %24) #13
  %27 = shl i32 %10, 20
  %28 = add i32 %26, %27
  %29 = tail call double @llvm.nvvm.lohi.i2d(i32 %25, i32 %28) #13
  %30 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.235.5) #13
  %31 = bitcast i32 %30 to float
  %32 = tail call float @llvm.nvvm.fabs.f(float %31) #13
  %33 = fcmp olt float %32, 0x4010C46560000000
  br i1 %33, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %in_bounds-after
  %34 = fcmp olt double %subtract.235.5, 0.000000e+00
  %35 = fadd double %subtract.235.5, 0x7FF0000000000000
  %z.0.i = select i1 %34, double 0.000000e+00, double %35
  %36 = fcmp olt float %32, 0x4010E90000000000
  br i1 %36, label %37, label %__nv_exp.exit

37:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %38 = sdiv i32 %10, 2
  %39 = shl i32 %38, 20
  %40 = add i32 %26, %39
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 %25, i32 %40) #13
  %42 = sub nsw i32 %10, %38
  %43 = shl i32 %42, 20
  %44 = add nsw i32 %43, 1072693248
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %44) #13
  %46 = fmul double %45, %41
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %in_bounds-after, %__internal_fast_icmp_abs_lt.exit.i, %37
  %z.2.i = phi double [ %29, %in_bounds-after ], [ %46, %37 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %47 = zext nneg i32 %linear_index to i64
  %48 = getelementptr double, ptr addrspace(1) %arg337, i64 %47
  store double %z.2.i, ptr addrspace(1) %48, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  %49 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg235, i64 0, i64 %7
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !299
  %51 = zext nneg i16 %5 to i64
  %52 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg133, i64 0, i64 %51, i64 %7
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !299
  %multiply.2928.5 = fmul double %50, %53
  %54 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg031, i64 0, i64 %7
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !299
  %add.3841.5 = fadd double %multiply.2928.5, %55
  br label %in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !300
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !309
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1536
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.9.in_bounds-true, label %loop_broadcast_fusion.9.in_bounds-after

loop_broadcast_fusion.9.in_bounds-after:          ; preds = %loop_broadcast_fusion.9.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.9.in_bounds-true:           ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.9.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define void @input_scatter_fusion(ptr noalias nocapture align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg2) local_unnamed_addr #5 {
entry:
  %arg238 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg136 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg034 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !298
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !297
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %param_2.188821 = getelementptr inbounds [4 x [192 x i32]], ptr addrspace(1) %arg238, i64 0, i64 %5, i64 %6
  %param_2.188822 = load i32, ptr addrspace(1) %param_2.188821, align 4, !invariant.load !299
  %7 = lshr i32 %param_2.188822, 30
  %8 = and i32 %7, 2
  %9 = add i32 %8, %param_2.188822
  %10 = icmp ult i32 %9, 2
  %11 = zext nneg i32 %linear_index to i64
  %12 = getelementptr i8, ptr addrspace(1) %arg136, i64 %11
  %13 = zext nneg i32 %9 to i64
  %14 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr addrspace(1) %arg034, i64 0, i64 %5, i64 %6, i64 %13
  br i1 %10, label %scatter.in_bounds-true, label %scatter.7.1.in_bounds-after

scatter.7.1.in_bounds-after:                      ; preds = %entry, %scatter.in_bounds-true
  ret void

scatter.in_bounds-true:                           ; preds = %entry
  %param_1.227530 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !299
  %15 = trunc i8 %param_1.227530 to i1
  %16 = select i1 %15, double 1.000000e+00, double 0.000000e+00
  %17 = atomicrmw fadd ptr addrspace(1) %14, double %16 seq_cst, align 8
  br label %scatter.7.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg1) local_unnamed_addr #2 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !298
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !297
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = and i16 %3, 3
  %6 = zext nneg i16 %5 to i64
  %7 = zext nneg i16 %.decomposed to i64
  %8 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr addrspace(1) %arg115, i64 0, i64 0, i64 0, i64 %6, i64 %7
  store i64 %6, ptr addrspace(1) %8, align 8
  %9 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 6144
  store i64 %7, ptr addrspace(1) %9, align 8
  %10 = zext nneg i32 %linear_index to i64
  %11 = getelementptr i32, ptr addrspace(1) %arg013, i64 %10
  %12 = load i32, ptr addrspace(1) %11, align 4, !invariant.load !299
  %13 = lshr i32 %12, 30
  %14 = and i32 %13, 2
  %15 = add i32 %14, %12
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 12288
  store i64 %16, ptr addrspace(1) %17, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg9) local_unnamed_addr #2 {
entry:
  %arg996 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg894 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg792 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg690 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg588 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg486 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg384 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg282 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg180 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg078 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !298
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !297
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr i8, ptr addrspace(1) %arg078, i64 %5
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !299
  %8 = zext nneg i16 %3 to i64
  %9 = zext nneg i16 %.decomposed to i64
  %10 = getelementptr inbounds [1 x [3 x [4 x [192 x i64]]]], ptr addrspace(1) %arg180, i64 0, i64 0, i64 0, i64 %8, i64 %9
  %11 = load i64, ptr addrspace(1) %10, align 8, !invariant.load !299
  %12 = load <2 x i64>, ptr addrspace(1) %arg384, align 128, !invariant.load !299
  %13 = extractelement <2 x i64> %12, i32 0
  %14 = extractelement <2 x i64> %12, i32 1
  %15 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 6144
  %16 = load i64, ptr addrspace(1) %15, align 8, !invariant.load !299
  %17 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 12288
  %18 = load i64, ptr addrspace(1) %17, align 8, !invariant.load !299
  %19 = getelementptr inbounds i8, ptr addrspace(1) %arg384, i64 16
  %20 = load i64, ptr addrspace(1) %19, align 16, !invariant.load !299
  %21 = tail call i64 @llvm.smax.i64(i64 %11, i64 0)
  %22 = tail call i64 @llvm.umin.i64(i64 %21, i64 3)
  %23 = tail call i64 @llvm.smax.i64(i64 %16, i64 0)
  %24 = tail call i64 @llvm.umin.i64(i64 %23, i64 191)
  %25 = icmp sgt i64 %18, 0
  br i1 %25, label %in_bounds-true, label %entry.in_bounds-after_crit_edge

entry.in_bounds-after_crit_edge:                  ; preds = %entry
  %.phi.trans.insert = getelementptr inbounds [4 x double], ptr addrspace(1) %arg690, i64 0, i64 %22
  %.pre = load double, ptr addrspace(1) %.phi.trans.insert, align 8, !invariant.load !299
  %.phi.trans.insert98 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg588, i64 0, i64 %24, i64 %22
  %.pre99 = load double, ptr addrspace(1) %.phi.trans.insert98, align 8, !invariant.load !299
  %.phi.trans.insert100 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg486, i64 0, i64 %22
  %.pre101 = load double, ptr addrspace(1) %.phi.trans.insert100, align 8, !invariant.load !299
  br label %in_bounds-after

in_bounds-after:                                  ; preds = %entry.in_bounds-after_crit_edge, %in_bounds-true
  %26 = phi double [ %130, %in_bounds-true ], [ %.pre101, %entry.in_bounds-after_crit_edge ]
  %27 = phi double [ %128, %in_bounds-true ], [ %.pre99, %entry.in_bounds-after_crit_edge ]
  %28 = phi double [ %126, %in_bounds-true ], [ %.pre, %entry.in_bounds-after_crit_edge ]
  %pad_result_addr.0 = phi double [ %add.3841.3, %in_bounds-true ], [ 0.000000e+00, %entry.in_bounds-after_crit_edge ]
  %29 = getelementptr inbounds [2 x [192 x [4 x double]]], ptr addrspace(1) %arg282, i64 0, i64 0, i64 %24, i64 %22
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !299
  %add.3619.i = fadd double %30, 0.000000e+00
  %31 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 6144
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !299
  %add.3619.i.1 = fadd double %add.3619.i, %32
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3619.i.1) #13
  %34 = tail call i32 @llvm.nvvm.d2i.lo(double %add.3619.i.1) #13
  %35 = icmp slt i32 %33, 1048576
  %36 = fmul double %add.3619.i.1, 0x4350000000000000
  %37 = tail call i32 @llvm.nvvm.d2i.lo(double %36) #13
  %38 = tail call i32 @llvm.nvvm.d2i.hi(double %36) #13
  br i1 %35, label %39, label %40

39:                                               ; preds = %in_bounds-after
  br label %40

40:                                               ; preds = %39, %in_bounds-after
  %.0.i = phi double [ %36, %39 ], [ %add.3619.i.1, %in_bounds-after ]
  %ihi.0.i = phi i32 [ %38, %39 ], [ %33, %in_bounds-after ]
  %ilo.0.i = phi i32 [ %37, %39 ], [ %34, %in_bounds-after ]
  %e.0.i = phi i32 [ -1077, %39 ], [ -1023, %in_bounds-after ]
  %41 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %41, 2146435071
  br i1 %or.cond.i, label %42, label %89

42:                                               ; preds = %40
  %43 = lshr i32 %ihi.0.i, 20
  %44 = add nsw i32 %e.0.i, %43
  %45 = and i32 %ihi.0.i, 1048575
  %46 = or disjoint i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %46) #13
  %48 = icmp ugt i32 %46, 1073127582
  %49 = tail call i32 @llvm.nvvm.d2i.lo(double %47) #13
  %50 = tail call i32 @llvm.nvvm.d2i.hi(double %47) #13
  %51 = add i32 %50, -1048576
  %52 = tail call double @llvm.nvvm.lohi.i2d(i32 %49, i32 %51) #13
  %spec.select = select i1 %48, double %52, double %47
  %53 = zext i1 %48 to i32
  %spec.select64 = add nsw i32 %44, %53
  %54 = fadd double %spec.select, -1.000000e+00
  %55 = fadd double %spec.select, 1.000000e+00
  %56 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %55) #13
  %57 = fneg double %55
  %58 = tail call double @llvm.fma.f64(double %57, double %56, double 1.000000e+00)
  %59 = tail call double @llvm.fma.f64(double %58, double %58, double %58)
  %60 = tail call double @llvm.fma.f64(double %59, double %56, double %56)
  %61 = fmul double %54, %60
  %62 = fadd double %61, %61
  %63 = fmul double %62, %62
  %64 = tail call double @llvm.fma.f64(double %63, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %65 = tail call double @llvm.fma.f64(double %64, double %63, double 0x3EF3B2669F02676F)
  %66 = tail call double @llvm.fma.f64(double %65, double %63, double 0x3F1745CBA9AB0956)
  %67 = tail call double @llvm.fma.f64(double %66, double %63, double 0x3F3C71C72D1B5154)
  %68 = tail call double @llvm.fma.f64(double %67, double %63, double 0x3F624924923BE72D)
  %69 = tail call double @llvm.fma.f64(double %68, double %63, double 0x3F8999999999A3C4)
  %70 = tail call double @llvm.fma.f64(double %69, double %63, double 0x3FB5555555555554)
  %71 = fsub double %54, %62
  %72 = fmul double %71, 2.000000e+00
  %73 = fneg double %62
  %74 = tail call double @llvm.fma.f64(double %73, double %54, double %72)
  %75 = fmul double %60, %74
  %76 = fmul double %63, %70
  %77 = tail call double @llvm.fma.f64(double %76, double %62, double %75)
  %78 = xor i32 %spec.select64, -2147483648
  %79 = tail call double @llvm.nvvm.lohi.i2d(i32 %78, i32 1127219200) #13
  %80 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %81 = fsub double %79, %80
  %82 = tail call double @llvm.fma.f64(double %81, double 0x3FE62E42FEFA39EF, double %62)
  %83 = fneg double %81
  %84 = tail call double @llvm.fma.f64(double %83, double 0x3FE62E42FEFA39EF, double %82)
  %85 = fsub double %84, %62
  %86 = fsub double %77, %85
  %87 = tail call double @llvm.fma.f64(double %81, double 0x3C7ABC9E3B39803F, double %86)
  %88 = fadd double %82, %87
  br label %__nv_log.exit

89:                                               ; preds = %40
  %90 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %91 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %92 = and i32 %91, 2147483647
  %93 = icmp eq i32 %92, 0
  %q.0.i = select i1 %93, double 0xFFF0000000000000, double %90
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %42, %89
  %q.1.i = phi double [ %88, %42 ], [ %q.0.i, %89 ]
  %94 = trunc i64 %5 to i32
  %multiply.2928.325.1 = fmul double %28, %27
  %add.3841.326.1 = fadd double %multiply.2928.325.1, %26
  %95 = fcmp ole double %add.3841.326.1, 0.000000e+00
  %maximum.41.i.1 = select i1 %95, double 0.000000e+00, double %add.3841.326.1
  %96 = icmp sgt i64 %18, -1
  %97 = icmp sle i64 %18, %20
  %98 = and i1 %96, %97
  %99 = icmp sgt i64 %11, -1
  %100 = icmp sle i64 %11, %13
  %101 = and i1 %99, %100
  %102 = icmp sgt i64 %16, -1
  %103 = icmp sle i64 %16, %14
  %104 = and i1 %102, %103
  %105 = select i1 %98, i1 %104, i1 false
  %106 = select i1 %105, i1 %101, i1 false
  %107 = and i32 %1, 3
  %108 = lshr i32 %94, 2
  %109 = zext nneg i32 %107 to i64
  %110 = zext nneg i32 %108 to i64
  %111 = getelementptr [4 x [192 x [2 x double]]], ptr addrspace(1) %arg792, i64 0, i64 %109, i64 %110, i64 0
  %112 = load <2 x double>, ptr addrspace(1) %111, align 16, !invariant.load !299
  %113 = extractelement <2 x double> %112, i32 0
  %114 = extractelement <2 x double> %112, i32 1
  %115 = getelementptr inbounds [2 x [192 x [4 x double]]], ptr addrspace(1) %arg282, i64 0, i64 0, i64 %110, i64 %109
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !299
  %add.3619.i61 = fadd double %116, 0.000000e+00
  %117 = getelementptr inbounds i8, ptr addrspace(1) %115, i64 6144
  %118 = load double, ptr addrspace(1) %117, align 8, !invariant.load !299
  %add.3619.i61.1 = fadd double %add.3619.i61, %118
  %add.3619.i60 = fadd double %113, 0.000000e+00
  %add.3619.i60.1 = fadd double %add.3619.i60, %114
  %119 = fneg double %add.3619.i60.1
  %120 = trunc i8 %7 to i1
  %subtract.235.11 = fsub double %pad_result_addr.0, %maximum.41.i.1
  %subtract.236.7 = fsub double %subtract.235.11, %q.1.i
  %121 = select i1 %106, double %subtract.236.7, double 0x7FF8000000000000
  %122 = select i1 %120, double %121, double 0.000000e+00
  %divide.594.5.clone.1 = fdiv double %119, %add.3619.i61.1
  %multiply.2930.1.clone.1 = fmul double %divide.594.5.clone.1, %118
  %add.3842.1.clone.1 = fadd double %114, %multiply.2930.1.clone.1
  %123 = getelementptr double, ptr addrspace(1) %arg894, i64 %5
  store double %122, ptr addrspace(1) %123, align 8
  %124 = getelementptr double, ptr addrspace(1) %arg996, i64 %5
  store double %add.3842.1.clone.1, ptr addrspace(1) %124, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  %125 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg690, i64 0, i64 %22
  %126 = load double, ptr addrspace(1) %125, align 8, !invariant.load !299
  %127 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg588, i64 0, i64 %24, i64 %22
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !299
  %multiply.2928.3 = fmul double %126, %128
  %129 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg486, i64 0, i64 %22
  %130 = load double, ptr addrspace(1) %129, align 8, !invariant.load !299
  %add.3841.3 = fadd double %multiply.2928.3, %130
  br label %in_bounds-after
}

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg8) local_unnamed_addr #6 {
entry:
  %arg859 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg757 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg655 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg553 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg451 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg349 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg247 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg145 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg043 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !309
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext i32 %thread.id.2 to i64
  %param_6.1289 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg655, i64 0, i64 %1
  %2 = add nuw nsw i32 %0, -32
  %3 = shl nuw nsw i64 %1, 3
  %4 = zext nneg i32 %thread.id.x to i64
  %5 = lshr i64 %4, 5
  %6 = shl nuw nsw i64 %5, 5
  %scevgep = getelementptr i8, ptr addrspace(1) %arg145, i64 %6
  %scevgep64 = getelementptr i8, ptr addrspace(1) %arg043, i64 %6
  %7 = shl nuw nsw i64 %5, 4
  %8 = shl nuw nsw i64 %1, 2
  %9 = add i64 %7, %8
  %scevgep68 = getelementptr i8, ptr addrspace(1) %arg553, i64 %9
  %scevgep71 = getelementptr i8, ptr addrspace(1) %arg451, i64 %9
  %scevgep74 = getelementptr i8, ptr addrspace(1) %arg349, i64 %6
  %scevgep78 = getelementptr i8, ptr addrspace(1) %arg247, i64 %6
  %scevgep82 = getelementptr i8, ptr addrspace(1) %arg859, i64 %6
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv83 = phi ptr addrspace(1) [ %scevgep82, %entry ], [ %scevgep84, %x_in_tile-after ]
  %lsr.iv79 = phi ptr addrspace(1) [ %scevgep78, %entry ], [ %scevgep80, %x_in_tile-after ]
  %lsr.iv75 = phi ptr addrspace(1) [ %scevgep74, %entry ], [ %scevgep76, %x_in_tile-after ]
  %lsr.iv72 = phi ptr addrspace(1) [ %scevgep71, %entry ], [ %scevgep73, %x_in_tile-after ]
  %lsr.iv69 = phi ptr addrspace(1) [ %scevgep68, %entry ], [ %scevgep70, %x_in_tile-after ]
  %lsr.iv65 = phi ptr addrspace(1) [ %scevgep64, %entry ], [ %scevgep66, %x_in_tile-after ]
  %lsr.iv61 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep62, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %2, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.041 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %10 = trunc i64 %1 to i32
  %11 = icmp ult i32 %10, 4
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %__nv_exp.exit, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3619.i40, %__nv_exp.exit ], [ %partial_reduction_result.041, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep62 = getelementptr i8, ptr addrspace(1) %lsr.iv61, i64 1024
  %scevgep66 = getelementptr i8, ptr addrspace(1) %lsr.iv65, i64 1024
  %scevgep70 = getelementptr i8, ptr addrspace(1) %lsr.iv69, i64 512
  %scevgep73 = getelementptr i8, ptr addrspace(1) %lsr.iv72, i64 512
  %scevgep76 = getelementptr i8, ptr addrspace(1) %lsr.iv75, i64 1024
  %scevgep80 = getelementptr i8, ptr addrspace(1) %lsr.iv79, i64 1024
  %scevgep84 = getelementptr i8, ptr addrspace(1) %lsr.iv83, i64 1024
  %12 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %12, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !310

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %13 = zext nneg i32 %0 to i64
  %14 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %1, i64 %13
  store double %partial_reduction_result.1, ptr addrspace(3) %14, align 8
  tail call void @llvm.nvvm.barrier0()
  %15 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %13, i64 %1
  %partial_reduction_result153031 = load <2 x i32>, ptr addrspace(3) %15, align 8
  %16 = extractelement <2 x i32> %partial_reduction_result153031, i64 0
  %17 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %16, i32 16, i32 31)
  %18 = insertelement <2 x i32> poison, i32 %17, i64 0
  %19 = extractelement <2 x i32> %partial_reduction_result153031, i64 1
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 16, i32 31)
  %21 = insertelement <2 x i32> %18, i32 %20, i64 1
  %22 = bitcast <2 x i32> %21 to double
  %23 = bitcast <2 x i32> %partial_reduction_result153031 to double
  %add.3619.i = fadd double %23, %22
  %24 = bitcast double %add.3619.i to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 8, i32 31)
  %27 = insertelement <2 x i32> poison, i32 %26, i64 0
  %28 = extractelement <2 x i32> %24, i64 1
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 8, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to double
  %add.3619.i36 = fadd double %add.3619.i, %31
  %32 = bitcast double %add.3619.i36 to <2 x i32>
  %33 = extractelement <2 x i32> %32, i64 0
  %34 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %33, i32 4, i32 31)
  %35 = insertelement <2 x i32> poison, i32 %34, i64 0
  %36 = extractelement <2 x i32> %32, i64 1
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 4, i32 31)
  %38 = insertelement <2 x i32> %35, i32 %37, i64 1
  %39 = bitcast <2 x i32> %38 to double
  %add.3619.i37 = fadd double %add.3619.i36, %39
  %40 = bitcast double %add.3619.i37 to <2 x i32>
  %41 = extractelement <2 x i32> %40, i64 0
  %42 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %41, i32 2, i32 31)
  %43 = insertelement <2 x i32> poison, i32 %42, i64 0
  %44 = extractelement <2 x i32> %40, i64 1
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 2, i32 31)
  %46 = insertelement <2 x i32> %43, i32 %45, i64 1
  %47 = bitcast <2 x i32> %46 to double
  %add.3619.i38 = fadd double %add.3619.i37, %47
  %48 = bitcast double %add.3619.i38 to <2 x i32>
  %49 = extractelement <2 x i32> %48, i64 0
  %50 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %49, i32 1, i32 31)
  %51 = insertelement <2 x i32> poison, i32 %50, i64 0
  %52 = extractelement <2 x i32> %48, i64 1
  %53 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %52, i32 1, i32 31)
  %54 = insertelement <2 x i32> %51, i32 %53, i64 1
  %55 = bitcast <2 x i32> %54 to double
  %add.3619.i39 = fadd double %add.3619.i38, %55
  store double %add.3619.i39, ptr addrspace(3) %15, align 8
  %56 = and i32 %thread.id.x, 927
  %57 = icmp eq i32 %56, 0
  %output_element_address = getelementptr inbounds [4 x double], ptr addrspace(1) %arg757, i64 0, i64 %13
  br i1 %57, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %scevgep63 = getelementptr i8, ptr addrspace(1) %lsr.iv61, i64 %3
  %param_1.23042 = load double, ptr addrspace(1) %scevgep63, align 8, !invariant.load !299
  %scevgep67 = getelementptr i8, ptr addrspace(1) %lsr.iv65, i64 %3
  %param_0.16153 = load double, ptr addrspace(1) %scevgep67, align 8, !invariant.load !299
  %multiply.2942.3 = fmul double %param_1.23042, %param_0.16153
  %add.3619.i40 = fadd double %partial_reduction_result.041, %multiply.2942.3
  %param_6.12894 = load double, ptr addrspace(1) %param_6.1289, align 8, !invariant.load !299
  %multiply.2933.3.clone.1 = fmul double %param_1.23042, %param_6.12894
  %param_5.17315 = load float, ptr addrspace(1) %lsr.iv69, align 4, !invariant.load !299
  %58 = fpext float %param_5.17315 to double
  %param_4.21366 = load float, ptr addrspace(1) %lsr.iv72, align 4, !invariant.load !299
  %59 = fpext float %param_4.21366 to double
  %60 = fneg double %multiply.2933.3.clone.1
  %61 = fmul double %60, %59
  %62 = fmul double %multiply.2933.3.clone.1, %58
  %add.3846.7.clone.1 = fsub double %61, %62
  %scevgep77 = getelementptr i8, ptr addrspace(1) %lsr.iv75, i64 %3
  %param_3.27677 = load double, ptr addrspace(1) %scevgep77, align 8, !invariant.load !299
  %63 = fcmp ole double %param_3.27677, -3.000000e+01
  %64 = select i1 %63, double -3.000000e+01, double %param_3.27677
  %65 = fcmp oge double %64, 3.000000e+01
  %66 = select i1 %65, double 3.000000e+01, double %64
  %67 = fneg double %66
  %68 = tail call double @llvm.fma.f64(double %67, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %69 = tail call i32 @llvm.nvvm.d2i.lo(double %68) #13
  %70 = tail call double @llvm.nvvm.add.rn.d(double %68, double 0xC338000000000000) #13
  %71 = tail call double @llvm.fma.f64(double %70, double 0xBFE62E42FEFA39EF, double %67)
  %72 = tail call double @llvm.fma.f64(double %70, double 0xBC7ABC9E3B39803F, double %71)
  %73 = tail call double @llvm.fma.f64(double %72, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %74 = tail call double @llvm.fma.f64(double %73, double %72, double 0x3EC71DEE62401315)
  %75 = tail call double @llvm.fma.f64(double %74, double %72, double 0x3EFA01997C89EB71)
  %76 = tail call double @llvm.fma.f64(double %75, double %72, double 0x3F2A01A014761F65)
  %77 = tail call double @llvm.fma.f64(double %76, double %72, double 0x3F56C16C1852B7AF)
  %78 = tail call double @llvm.fma.f64(double %77, double %72, double 0x3F81111111122322)
  %79 = tail call double @llvm.fma.f64(double %78, double %72, double 0x3FA55555555502A1)
  %80 = tail call double @llvm.fma.f64(double %79, double %72, double 0x3FC5555555555511)
  %81 = tail call double @llvm.fma.f64(double %80, double %72, double 0x3FE000000000000B)
  %82 = tail call double @llvm.fma.f64(double %81, double %72, double 1.000000e+00)
  %83 = tail call double @llvm.fma.f64(double %82, double %72, double 1.000000e+00)
  %84 = tail call i32 @llvm.nvvm.d2i.lo(double %83) #13
  %85 = tail call i32 @llvm.nvvm.d2i.hi(double %83) #13
  %86 = shl i32 %69, 20
  %87 = add i32 %85, %86
  %88 = tail call double @llvm.nvvm.lohi.i2d(i32 %84, i32 %87) #13
  %89 = tail call i32 @llvm.nvvm.d2i.hi(double %67) #13
  %90 = bitcast i32 %89 to float
  %91 = tail call float @llvm.nvvm.fabs.f(float %90) #13
  %92 = fcmp olt float %91, 0x4010C46560000000
  br i1 %92, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %93 = fcmp ogt double %66, 0.000000e+00
  %94 = fsub double 0x7FF0000000000000, %66
  %z.0.i = select i1 %93, double 0.000000e+00, double %94
  %95 = fcmp olt float %91, 0x4010E90000000000
  br i1 %95, label %96, label %__nv_exp.exit

96:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %97 = sdiv i32 %69, 2
  %98 = shl i32 %97, 20
  %99 = add i32 %85, %98
  %100 = tail call double @llvm.nvvm.lohi.i2d(i32 %84, i32 %99) #13
  %101 = sub nsw i32 %69, %97
  %102 = shl i32 %101, 20
  %103 = add nsw i32 %102, 1072693248
  %104 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %103) #13
  %105 = fmul double %104, %100
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %96
  %z.2.i = phi double [ %88, %x_in_tile-true ], [ %105, %96 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.3839.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.593.3.clone.1 = fdiv double 1.000000e+00, %add.3839.1.clone.1
  %subtract.233.1.clone.1 = fsub double 1.000000e+00, %divide.593.3.clone.1
  %multiply.2936.1.clone.1 = fmul double %divide.593.3.clone.1, %subtract.233.1.clone.1
  %multiply.2937.5.clone.1 = fmul double %add.3846.7.clone.1, %multiply.2936.1.clone.1
  %compare.638.3.clone.1 = fcmp oeq double %64, %66
  %scevgep81 = getelementptr i8, ptr addrspace(1) %lsr.iv79, i64 %3
  %param_2.355410 = load double, ptr addrspace(1) %scevgep81, align 8, !invariant.load !299
  %106 = select i1 %compare.638.3.clone.1, double 1.000000e+00, double %param_2.355410
  %compare.639.3.clone.1 = fcmp oeq double %66, 3.000000e+01
  %107 = select i1 %compare.639.3.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.595.5.clone.1 = fdiv double %106, %107
  %multiply.2938.3.clone.1 = fmul double %divide.595.5.clone.1, %multiply.2937.5.clone.1
  %compare.640.3.clone.1 = fcmp oeq double %param_3.27677, %64
  %108 = select i1 %compare.640.3.clone.1, double 1.000000e+00, double %param_2.355410
  %compare.641.3.clone.1 = fcmp oeq double %64, -3.000000e+01
  %109 = select i1 %compare.641.3.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.596.3.clone.1 = fdiv double %108, %109
  %multiply.2939.1.clone.1 = fmul double %divide.596.3.clone.1, %multiply.2938.3.clone.1
  %scevgep85 = getelementptr i8, ptr addrspace(1) %lsr.iv83, i64 %3
  store double %multiply.2939.1.clone.1, ptr addrspace(1) %scevgep85, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i39, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #7

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #8

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #6 {
entry:
  %arg1104 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0102 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %0 = shl nuw nsw i32 %thread.id.x, 1
  %1 = zext nneg i32 %0 to i64
  %param_0.161815 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg0102, i64 0, i64 0, i64 %1
  %2 = load <2 x double>, ptr addrspace(1) %param_0.161815, align 16, !invariant.load !299
  %param_0.161816117 = extractelement <2 x double> %2, i32 0
  %param_0.161816.1118 = extractelement <2 x double> %2, i32 1
  %add.3619.i64 = fadd double %param_0.161816117, 0.000000e+00
  %add.3619.i64.1 = fadd double %add.3619.i64, %param_0.161816.1118
  %3 = or disjoint i32 %thread.id.x, 64
  %4 = shl nuw nsw i32 %3, 1
  %.cmp = icmp ugt i32 %3, 95
  %5 = zext i1 %.cmp to i64
  %.urem = add nsw i32 %4, -192
  %.cmp87 = icmp ult i32 %3, 96
  %6 = select i1 %.cmp87, i32 %4, i32 %.urem
  %7 = zext nneg i32 %6 to i64
  %param_0.161815.184 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg0102, i64 0, i64 %5, i64 %7
  %param_0.161816.185 = load double, ptr addrspace(1) %param_0.161815.184, align 16, !invariant.load !299
  %add.3619.i64.186 = fadd double %add.3619.i64.1, %param_0.161816.185
  %8 = or disjoint i32 %4, 1
  %.urem88 = add nsw i32 %4, -191
  %9 = select i1 %.cmp87, i32 %8, i32 %.urem88
  %10 = zext nneg i32 %9 to i64
  %param_0.161815.1.1 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg0102, i64 0, i64 %5, i64 %10
  %param_0.161816.1.1 = load double, ptr addrspace(1) %param_0.161815.1.1, align 8, !invariant.load !299
  %add.3619.i64.1.1 = fadd double %add.3619.i64.186, %param_0.161816.1.1
  %param_0.161815.2107 = getelementptr inbounds i8, ptr addrspace(1) %param_0.161815, i64 2048
  %11 = load <2 x double>, ptr addrspace(1) %param_0.161815.2107, align 16, !invariant.load !299
  %param_0.161816.2119 = extractelement <2 x double> %11, i32 0
  %param_0.161816.1.2120 = extractelement <2 x double> %11, i32 1
  %add.3619.i64.2 = fadd double %add.3619.i64.1.1, %param_0.161816.2119
  %add.3619.i64.1.2 = fadd double %add.3619.i64.2, %param_0.161816.1.2120
  %12 = trunc nuw nsw i32 %0 to i16
  %.lhs.trunc = or disjoint i16 %12, 384
  %13 = urem i16 %.lhs.trunc, 192
  %14 = zext nneg i16 %13 to i64
  %15 = getelementptr [4 x [192 x double]], ptr addrspace(1) %arg0102, i64 0, i64 0, i64 %14
  %param_0.161815.3109 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 3072
  %16 = load <2 x double>, ptr addrspace(1) %param_0.161815.3109, align 16, !invariant.load !299
  %param_0.161816.3113 = extractelement <2 x double> %16, i32 0
  %param_0.161816.1.3114 = extractelement <2 x double> %16, i32 1
  %add.3619.i64.3 = fadd double %add.3619.i64.1.2, %param_0.161816.3113
  %add.3619.i64.1.3 = fadd double %add.3619.i64.3, %param_0.161816.1.3114
  %17 = or disjoint i32 %thread.id.x, 256
  %18 = shl nuw nsw i32 %17, 1
  %.lhs.trunc92 = trunc nuw nsw i32 %17 to i16
  %19 = udiv i16 %.lhs.trunc92, 96
  %20 = zext nneg i16 %19 to i64
  %.lhs.trunc94 = trunc nuw nsw i32 %18 to i16
  %21 = urem i16 %.lhs.trunc94, 192
  %22 = zext nneg i16 %21 to i64
  %param_0.161815.4 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg0102, i64 0, i64 %20, i64 %22
  %param_0.161816.4 = load double, ptr addrspace(1) %param_0.161815.4, align 16, !invariant.load !299
  %add.3619.i64.4 = fadd double %add.3619.i64.1.3, %param_0.161816.4
  %.lhs.trunc96 = or disjoint i16 %.lhs.trunc94, 1
  %23 = urem i16 %.lhs.trunc96, 192
  %24 = zext nneg i16 %23 to i64
  %param_0.161815.1.4 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg0102, i64 0, i64 %20, i64 %24
  %param_0.161816.1.4 = load double, ptr addrspace(1) %param_0.161815.1.4, align 8, !invariant.load !299
  %add.3619.i64.1.4 = fadd double %add.3619.i64.4, %param_0.161816.1.4
  %.lhs.trunc98 = or disjoint i16 %12, 640
  %25 = urem i16 %.lhs.trunc98, 192
  %26 = zext nneg i16 %25 to i64
  %27 = getelementptr [4 x [192 x double]], ptr addrspace(1) %arg0102, i64 0, i64 0, i64 %26
  %param_0.161815.5111 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 4608
  %28 = load <2 x double>, ptr addrspace(1) %param_0.161815.5111, align 16, !invariant.load !299
  %param_0.161816.5115 = extractelement <2 x double> %28, i32 0
  %param_0.161816.1.5116 = extractelement <2 x double> %28, i32 1
  %add.3619.i64.5 = fadd double %add.3619.i64.1.4, %param_0.161816.5115
  %add.3619.i64.1.5 = fadd double %add.3619.i64.5, %param_0.161816.1.5116
  %lane_id = and i32 %thread.id.x, 31
  %29 = bitcast double %add.3619.i64.1.5 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 16, i32 31)
  %32 = insertelement <2 x i32> poison, i32 %31, i64 0
  %33 = extractelement <2 x i32> %29, i64 1
  %34 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %33, i32 16, i32 31)
  %35 = insertelement <2 x i32> %32, i32 %34, i64 1
  %36 = bitcast <2 x i32> %35 to double
  %add.3619.i = fadd double %add.3619.i64.1.5, %36
  %37 = bitcast double %add.3619.i to <2 x i32>
  %38 = extractelement <2 x i32> %37, i64 0
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 8, i32 31)
  %40 = insertelement <2 x i32> poison, i32 %39, i64 0
  %41 = extractelement <2 x i32> %37, i64 1
  %42 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %41, i32 8, i32 31)
  %43 = insertelement <2 x i32> %40, i32 %42, i64 1
  %44 = bitcast <2 x i32> %43 to double
  %add.3619.i60 = fadd double %add.3619.i, %44
  %45 = bitcast double %add.3619.i60 to <2 x i32>
  %46 = extractelement <2 x i32> %45, i64 0
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 4, i32 31)
  %48 = insertelement <2 x i32> poison, i32 %47, i64 0
  %49 = extractelement <2 x i32> %45, i64 1
  %50 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %49, i32 4, i32 31)
  %51 = insertelement <2 x i32> %48, i32 %50, i64 1
  %52 = bitcast <2 x i32> %51 to double
  %add.3619.i61 = fadd double %add.3619.i60, %52
  %53 = bitcast double %add.3619.i61 to <2 x i32>
  %54 = extractelement <2 x i32> %53, i64 0
  %55 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %54, i32 2, i32 31)
  %56 = insertelement <2 x i32> poison, i32 %55, i64 0
  %57 = extractelement <2 x i32> %53, i64 1
  %58 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %57, i32 2, i32 31)
  %59 = insertelement <2 x i32> %56, i32 %58, i64 1
  %60 = bitcast <2 x i32> %59 to double
  %add.3619.i62 = fadd double %add.3619.i61, %60
  %61 = bitcast double %add.3619.i62 to <2 x i32>
  %62 = extractelement <2 x i32> %61, i64 0
  %63 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %62, i32 1, i32 31)
  %64 = extractelement <2 x i32> %61, i64 1
  %65 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  %66 = icmp eq i32 %lane_id, 0
  br i1 %66, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont, %reduction_write_output-true, %intra_warp_reduce_write-after
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  tail call void @llvm.nvvm.barrier0()
  %67 = icmp ult i32 %thread.id.x, 32
  br i1 %67, label %inter_warp_reduce-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %entry
  %68 = lshr exact i32 %thread.id.x, 5
  %69 = zext nneg i32 %68 to i64
  %70 = getelementptr inbounds [1 x [2 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 0, i64 %69
  %71 = insertelement <2 x i32> poison, i32 %63, i64 0
  %72 = insertelement <2 x i32> %71, i32 %65, i64 1
  %73 = bitcast <2 x i32> %72 to double
  %add.3619.i63 = fadd double %add.3619.i62, %73
  store double %add.3619.i63, ptr addrspace(3) %70, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %74 = zext nneg i32 %lane_id to i64
  %75 = getelementptr inbounds [1 x [2 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 0, i64 %74
  %76 = icmp ult i32 %thread.id.x, 2
  br i1 %76, label %inter_warp_reduce-true.then71, label %inter_warp_reduce-true.cont70

inter_warp_reduce-true.then71:                    ; preds = %inter_warp_reduce-true
  %partial_reduction_result334950.then.val = load <2 x i32>, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont70

inter_warp_reduce-true.cont70:                    ; preds = %inter_warp_reduce-true, %inter_warp_reduce-true.then71
  %partial_reduction_result334950 = phi <2 x i32> [ %partial_reduction_result334950.then.val, %inter_warp_reduce-true.then71 ], [ zeroinitializer, %inter_warp_reduce-true ]
  %77 = icmp ult i32 %thread.id.x, 2
  %78 = extractelement <2 x i32> %partial_reduction_result334950, i64 0
  %79 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %78, i32 16, i32 31)
  %80 = insertelement <2 x i32> poison, i32 %79, i64 0
  %81 = extractelement <2 x i32> %partial_reduction_result334950, i64 1
  %82 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %81, i32 16, i32 31)
  %83 = insertelement <2 x i32> %80, i32 %82, i64 1
  %84 = bitcast <2 x i32> %83 to double
  br i1 %77, label %inter_warp_reduce-true.then, label %inter_warp_reduce-true.cont

inter_warp_reduce-true.then:                      ; preds = %inter_warp_reduce-true.cont70
  %.val54.then.val = load double, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont

inter_warp_reduce-true.cont:                      ; preds = %inter_warp_reduce-true.cont70, %inter_warp_reduce-true.then
  %.val54 = phi double [ %.val54.then.val, %inter_warp_reduce-true.then ], [ 0.000000e+00, %inter_warp_reduce-true.cont70 ]
  %85 = icmp ult i32 %thread.id.x, 2
  %add.3619.i65 = fadd double %.val54, %84
  br i1 %85, label %inter_warp_reduce-true.cont.then79, label %inter_warp_reduce-true.cont.cont78

inter_warp_reduce-true.cont.then79:               ; preds = %inter_warp_reduce-true.cont
  store double %add.3619.i65, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont.cont78

inter_warp_reduce-true.cont.cont78:               ; preds = %inter_warp_reduce-true.cont, %inter_warp_reduce-true.cont.then79
  %initial_value_addr.0 = phi double [ 0.000000e+00, %inter_warp_reduce-true.cont.then79 ], [ %add.3619.i65, %inter_warp_reduce-true.cont ]
  %86 = icmp ult i32 %thread.id.x, 2
  %87 = bitcast double %add.3619.i65 to <2 x i32>
  %88 = extractelement <2 x i32> %87, i64 0
  %89 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %88, i32 8, i32 31)
  %90 = insertelement <2 x i32> poison, i32 %89, i64 0
  %91 = extractelement <2 x i32> %87, i64 1
  %92 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %91, i32 8, i32 31)
  %93 = insertelement <2 x i32> %90, i32 %92, i64 1
  %94 = bitcast <2 x i32> %93 to double
  br i1 %86, label %inter_warp_reduce-true.cont.then, label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.then:                 ; preds = %inter_warp_reduce-true.cont.cont78
  %.val53.then.val = load double, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.cont:                 ; preds = %inter_warp_reduce-true.cont.cont78, %inter_warp_reduce-true.cont.then
  %.val53 = phi double [ %.val53.then.val, %inter_warp_reduce-true.cont.then ], [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont78 ]
  %95 = icmp ult i32 %thread.id.x, 2
  %add.3619.i66 = fadd double %.val53, %94
  br i1 %95, label %inter_warp_reduce-true.cont.cont.then77, label %inter_warp_reduce-true.cont.cont.cont76

inter_warp_reduce-true.cont.cont.then77:          ; preds = %inter_warp_reduce-true.cont.cont
  store double %add.3619.i66, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont.cont.cont76

inter_warp_reduce-true.cont.cont.cont76:          ; preds = %inter_warp_reduce-true.cont.cont, %inter_warp_reduce-true.cont.cont.then77
  %initial_value_addr.1 = phi double [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont.then77 ], [ %add.3619.i66, %inter_warp_reduce-true.cont.cont ]
  %96 = icmp ult i32 %thread.id.x, 2
  %97 = bitcast double %add.3619.i66 to <2 x i32>
  %98 = extractelement <2 x i32> %97, i64 0
  %99 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %98, i32 4, i32 31)
  %100 = insertelement <2 x i32> poison, i32 %99, i64 0
  %101 = extractelement <2 x i32> %97, i64 1
  %102 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %101, i32 4, i32 31)
  %103 = insertelement <2 x i32> %100, i32 %102, i64 1
  %104 = bitcast <2 x i32> %103 to double
  br i1 %96, label %inter_warp_reduce-true.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.then:            ; preds = %inter_warp_reduce-true.cont.cont.cont76
  %.val52.then.val = load double, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont:            ; preds = %inter_warp_reduce-true.cont.cont.cont76, %inter_warp_reduce-true.cont.cont.then
  %.val52 = phi double [ %.val52.then.val, %inter_warp_reduce-true.cont.cont.then ], [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont76 ]
  %105 = icmp ult i32 %thread.id.x, 2
  %add.3619.i67 = fadd double %.val52, %104
  br i1 %105, label %inter_warp_reduce-true.cont.cont.cont.then75, label %inter_warp_reduce-true.cont.cont.cont.cont74

inter_warp_reduce-true.cont.cont.cont.then75:     ; preds = %inter_warp_reduce-true.cont.cont.cont
  store double %add.3619.i67, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont74

inter_warp_reduce-true.cont.cont.cont.cont74:     ; preds = %inter_warp_reduce-true.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.then75
  %initial_value_addr.2 = phi double [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont.then75 ], [ %add.3619.i67, %inter_warp_reduce-true.cont.cont.cont ]
  %106 = icmp ult i32 %thread.id.x, 2
  %107 = bitcast double %add.3619.i67 to <2 x i32>
  %108 = extractelement <2 x i32> %107, i64 0
  %109 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %108, i32 2, i32 31)
  %110 = insertelement <2 x i32> poison, i32 %109, i64 0
  %111 = extractelement <2 x i32> %107, i64 1
  %112 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %111, i32 2, i32 31)
  %113 = insertelement <2 x i32> %110, i32 %112, i64 1
  %114 = bitcast <2 x i32> %113 to double
  br i1 %106, label %inter_warp_reduce-true.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.then:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont74
  %.val51.then.val = load double, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont74, %inter_warp_reduce-true.cont.cont.cont.then
  %.val51 = phi double [ %.val51.then.val, %inter_warp_reduce-true.cont.cont.cont.then ], [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont74 ]
  %115 = icmp ult i32 %thread.id.x, 2
  %add.3619.i68 = fadd double %.val51, %114
  br i1 %115, label %inter_warp_reduce-true.cont.cont.cont.cont.then73, label %inter_warp_reduce-true.cont.cont.cont.cont.cont72

inter_warp_reduce-true.cont.cont.cont.cont.then73: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont
  store double %add.3619.i68, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont72

inter_warp_reduce-true.cont.cont.cont.cont.cont72: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.then73
  %initial_value_addr.3 = phi double [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont.then73 ], [ %add.3619.i68, %inter_warp_reduce-true.cont.cont.cont.cont ]
  %116 = icmp ult i32 %thread.id.x, 2
  %117 = bitcast double %add.3619.i68 to <2 x i32>
  %118 = extractelement <2 x i32> %117, i64 0
  %119 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %118, i32 1, i32 31)
  %120 = insertelement <2 x i32> poison, i32 %119, i64 0
  %121 = extractelement <2 x i32> %117, i64 1
  %122 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %121, i32 1, i32 31)
  %123 = insertelement <2 x i32> %120, i32 %122, i64 1
  %124 = bitcast <2 x i32> %123 to double
  br i1 %116, label %inter_warp_reduce-true.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.then:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont72
  %.val.then.val = load double, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont72, %inter_warp_reduce-true.cont.cont.cont.cont.then
  %.val = phi double [ %.val.then.val, %inter_warp_reduce-true.cont.cont.cont.cont.then ], [ %initial_value_addr.3, %inter_warp_reduce-true.cont.cont.cont.cont.cont72 ]
  %125 = icmp ult i32 %thread.id.x, 2
  %add.3619.i69 = fadd double %.val, %124
  br i1 %125, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont
  store double %add.3619.i69, ptr addrspace(3) %75, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.cont.then
  %126 = icmp eq i32 %thread.id.x, 0
  br i1 %126, label %reduction_write_output-true, label %reduce-group-0-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont
  store double %add.3619.i69, ptr addrspace(1) %arg1104, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_reduce_fusion_3(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg8) local_unnamed_addr #9 {
entry:
  %arg835 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg733 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg631 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg529 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %18, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.3619.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.3619.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.3619.i17 = fadd double %add.3619.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %17 = zext nneg i32 %thread.id.x to i64
  %param_4.2121 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg427, i64 0, i64 %17
  %param_4.21212 = load double, ptr addrspace(1) %param_4.2121, align 8, !invariant.load !299
  %add.3851.5.clone.1 = fadd double %param_4.21212, 0xBFF62E42FEFA39EF
  %multiply.2955.1.clone.1 = fmul double %add.3851.5.clone.1, %add.3851.5.clone.1
  %multiply.2956.1.clone.1 = fmul double %multiply.2955.1.clone.1, 0x3FFC71C71C71C71C
  %add.3867.1.clone.1 = fadd double %multiply.2956.1.clone.1, 0x3FF43340BFCA50EB
  %multiply.2957.1.clone.1 = fmul double %add.3867.1.clone.1, 5.000000e-01
  %18 = fsub double 0.000000e+00, %multiply.2957.1.clone.1
  %param_0.3138 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg019, i64 0, i64 %17
  %param_0.31383 = load double, ptr addrspace(1) %param_0.3138, align 8
  %param_3.2758 = load i64, ptr addrspace(1) %arg325, align 128, !invariant.load !299
  %19 = sitofp i64 %param_3.2758 to double
  %param_2.3548 = load double, ptr addrspace(1) %arg223, align 128, !invariant.load !299
  %multiply.2909.25 = fmul double %param_2.3548, %19
  %multiply.2910.11 = fmul double %multiply.2909.25, 5.000000e-01
  %param_1.4495 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg121, i64 0, i64 %17
  %param_1.44954 = load double, ptr addrspace(1) %param_1.4495, align 8, !invariant.load !299
  %multiply.2913.3 = fmul double %param_1.44954, %multiply.2910.11
  %add.3826.3 = fadd double %param_0.31383, %multiply.2913.3
  %param_5.1712 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg529, i64 0, i64 %17
  %param_5.17125 = load double, ptr addrspace(1) %param_5.1712, align 8, !invariant.load !299
  %param_6.1267 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg631, i64 0, i64 %17
  %param_6.12676 = load double, ptr addrspace(1) %param_6.1267, align 8, !invariant.load !299
  %multiply.2943.1.clone.1 = fmul double %param_5.17125, %param_6.12676
  %multiply.2944.1.clone.1 = fmul double %add.3851.5.clone.1, 0x3FFC71C71C71C71C
  %20 = fsub double %multiply.2943.1.clone.1, %multiply.2944.1.clone.1
  %multiply.2945.1 = fmul double %multiply.2910.11, %20
  %add.3854.1 = fadd double %add.3826.3, %multiply.2945.1
  store double %add.3854.1, ptr addrspace(1) %param_0.3138, align 8
  %21 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg733, i64 0, i64 %17
  store double %20, ptr addrspace(1) %21, align 8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i17, ptr addrspace(1) %arg835, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #6 {
entry:
  %arg133 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg031 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !309
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext i32 %thread.id.2 to i64
  %2 = add nuw nsw i32 %0, -32
  %3 = zext nneg i32 %thread.id.x to i64
  %4 = lshr i64 %3, 5
  %5 = shl nuw nsw i64 %4, 5
  %6 = shl nuw nsw i64 %1, 3
  %7 = add i64 %5, %6
  %scevgep = getelementptr i8, ptr addrspace(1) %arg031, i64 %7
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv35 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep36, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %2, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.029 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %8 = trunc i64 %1 to i32
  %9 = icmp ult i32 %8, 4
  br i1 %9, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3619.i28, %x_in_tile-true ], [ %partial_reduction_result.029, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep36 = getelementptr i8, ptr addrspace(1) %lsr.iv35, i64 1024
  %10 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %10, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !314

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %11 = zext nneg i32 %0 to i64
  %12 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %1, i64 %11
  store double %partial_reduction_result.1, ptr addrspace(3) %12, align 8
  tail call void @llvm.nvvm.barrier0()
  %13 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %11, i64 %1
  %partial_reduction_result31819 = load <2 x i32>, ptr addrspace(3) %13, align 8
  %14 = extractelement <2 x i32> %partial_reduction_result31819, i64 0
  %15 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 16, i32 31)
  %16 = insertelement <2 x i32> poison, i32 %15, i64 0
  %17 = extractelement <2 x i32> %partial_reduction_result31819, i64 1
  %18 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 16, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to double
  %21 = bitcast <2 x i32> %partial_reduction_result31819 to double
  %add.3619.i = fadd double %21, %20
  %22 = bitcast double %add.3619.i to <2 x i32>
  %23 = extractelement <2 x i32> %22, i64 0
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 8, i32 31)
  %25 = insertelement <2 x i32> poison, i32 %24, i64 0
  %26 = extractelement <2 x i32> %22, i64 1
  %27 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 8, i32 31)
  %28 = insertelement <2 x i32> %25, i32 %27, i64 1
  %29 = bitcast <2 x i32> %28 to double
  %add.3619.i24 = fadd double %add.3619.i, %29
  %30 = bitcast double %add.3619.i24 to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 4, i32 31)
  %33 = insertelement <2 x i32> poison, i32 %32, i64 0
  %34 = extractelement <2 x i32> %30, i64 1
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 4, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to double
  %add.3619.i25 = fadd double %add.3619.i24, %37
  %38 = bitcast double %add.3619.i25 to <2 x i32>
  %39 = extractelement <2 x i32> %38, i64 0
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 2, i32 31)
  %41 = insertelement <2 x i32> poison, i32 %40, i64 0
  %42 = extractelement <2 x i32> %38, i64 1
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 2, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 1
  %45 = bitcast <2 x i32> %44 to double
  %add.3619.i26 = fadd double %add.3619.i25, %45
  %46 = bitcast double %add.3619.i26 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 1, i32 31)
  %49 = insertelement <2 x i32> poison, i32 %48, i64 0
  %50 = extractelement <2 x i32> %46, i64 1
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 1, i32 31)
  %52 = insertelement <2 x i32> %49, i32 %51, i64 1
  %53 = bitcast <2 x i32> %52 to double
  %add.3619.i27 = fadd double %add.3619.i26, %53
  store double %add.3619.i27, ptr addrspace(3) %13, align 8
  %54 = and i32 %thread.id.x, 927
  %55 = icmp eq i32 %54, 0
  %output_element_address = getelementptr inbounds [4 x double], ptr addrspace(1) %arg133, i64 0, i64 %11
  br i1 %55, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %param_0.16192 = load double, ptr addrspace(1) %lsr.iv35, align 8, !invariant.load !299
  %add.3619.i28 = fadd double %partial_reduction_result.029, %param_0.16192
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i27, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_reduce_fusion_5(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #9 {
entry:
  %arg634 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg532 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg430 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg328 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg226 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg124 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg022 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %18, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.3619.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.3619.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.3619.i20 = fadd double %add.3619.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %17 = zext nneg i32 %thread.id.x to i64
  %param_5.1718 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg532, i64 0, i64 %17
  %param_5.17182 = load double, ptr addrspace(1) %param_5.1718, align 8, !invariant.load !299
  %multiply.2958.1.clone.1 = fmul double %param_5.17182, %param_5.17182
  %add.3870.1.clone.1 = fadd double %multiply.2958.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.2959.1.clone.1 = fmul double %add.3870.1.clone.1, 5.000000e-01
  %18 = fsub double 0.000000e+00, %multiply.2959.1.clone.1
  %param_0.3140 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg022, i64 0, i64 %17
  %param_0.31405 = load double, ptr addrspace(1) %param_0.3140, align 8
  %param_3.2760 = load i64, ptr addrspace(1) %arg328, align 128, !invariant.load !299
  %19 = sitofp i64 %param_3.2760 to double
  %param_2.3550 = load double, ptr addrspace(1) %arg226, align 128, !invariant.load !299
  %multiply.2909.29 = fmul double %param_2.3550, %19
  %multiply.2910.15 = fmul double %multiply.2909.29, 5.000000e-01
  %param_1.4497 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg124, i64 0, i64 %17
  %param_1.44976 = load double, ptr addrspace(1) %param_1.4497, align 8, !invariant.load !299
  %multiply.2911.5 = fmul double %param_1.44976, %multiply.2910.15
  %add.3822.5 = fadd double %param_0.31405, %multiply.2911.5
  %param_4.2124 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg430, i64 0, i64 %17
  %param_4.21247 = load double, ptr addrspace(1) %param_4.2124, align 8
  %add.3844.1.clone.1 = fsub double %param_4.21247, %param_5.17182
  %multiply.2932.1 = fmul double %multiply.2910.15, %add.3844.1.clone.1
  %add.3845.1 = fadd double %add.3822.5, %multiply.2932.1
  store double %add.3845.1, ptr addrspace(1) %param_0.3140, align 8
  store double %add.3844.1.clone.1, ptr addrspace(1) %param_4.2124, align 8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i20, ptr addrspace(1) %arg634, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !299
  store double %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load i32, ptr addrspace(1) %9, align 4, !invariant.load !299
  store i32 %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !299
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg02, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !299
  %13 = getelementptr i8, ptr addrspace(1) %arg26, i64 %10
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !299
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg02, i64 0, i64 %9, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !299
  %13 = getelementptr double, ptr addrspace(1) %arg26, i64 %10
  store double %12, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg30) local_unnamed_addr #2 {
entry:
  %arg3076 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2974 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2872 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2770 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2668 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2566 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2464 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2362 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2260 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2158 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2056 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1954 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1852 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1750 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1648 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1546 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1444 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1342 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1240 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1138 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1036 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg934 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = load i64, ptr addrspace(1) %arg1036, align 128, !invariant.load !299
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg424, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !299
  %13 = getelementptr double, ptr addrspace(1) %arg016, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !299
  %15 = trunc i8 %12 to i1
  %16 = select i1 %15, double %14, double 0.000000e+00
  %17 = getelementptr double, ptr addrspace(1) %arg2158, i64 %10
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !299
  %19 = select i1 %15, double %18, double 0.000000e+00
  %20 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg2056, i64 0, i64 %9, i64 %10
  %21 = load i8, ptr addrspace(1) %20, align 1, !invariant.load !299
  %22 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1954, i64 0, i64 %9, i64 %10
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !299
  %24 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1852, i64 0, i64 %9, i64 %10
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !299
  %26 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg1750, i64 0, i64 %9, i64 %10
  %27 = load i32, ptr addrspace(1) %26, align 4, !invariant.load !299
  %28 = icmp eq i32 %27, 1
  %29 = getelementptr double, ptr addrspace(1) %arg1648, i64 %10
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !299
  %31 = trunc i8 %25 to i1
  %32 = select i1 %31, i1 %28, i1 false
  %33 = select i1 %32, i1 %15, i1 false
  %34 = select i1 %33, double %30, double 0.000000e+00
  %35 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1240, i64 0, i64 %9, i64 %10
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !299
  %multiply.2798.11 = fmul double %36, %34
  %37 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1546, i64 0, i64 %9, i64 %10
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !299
  %multiply.2800.9 = fmul double %38, %multiply.2798.11
  %39 = fmul double %23, %multiply.2798.11
  %add.3722.7 = fsub double %multiply.2800.9, %39
  %40 = trunc i8 %21 to i1
  %41 = select i1 %40, double %add.3722.7, double 0.000000e+00
  %42 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1444, i64 0, i64 %9, i64 %10
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !299
  %44 = getelementptr double, ptr addrspace(1) %arg1342, i64 %10
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !299
  %46 = select i1 %15, double %45, double 0.000000e+00
  %multiply.2801.17 = fmul double %36, %46
  %47 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1138, i64 0, i64 %9, i64 %10
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !299
  %multiply.2802.13 = fmul double %48, %multiply.2801.17
  %multiply.2803.7 = fmul double %43, %multiply.2802.13
  %add.3723.7 = fadd double %41, %multiply.2803.7
  %add.3724.5 = fadd double %19, %add.3723.7
  %49 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg220, i64 0, i64 %9, i64 %10
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !299
  %51 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg118, i64 0, i64 %9, i64 %10
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !299
  %53 = fneg double %add.3724.5
  %54 = fmul double %50, %53
  %55 = fmul double %52, %54
  %add.3725.3 = fadd double %16, %55
  %56 = getelementptr double, ptr addrspace(1) %arg628, i64 %10
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !299
  %58 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg730, i64 0, i64 %9, i64 %10
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !299
  %add.3721.9 = fadd double %57, %59
  %60 = select i1 %15, double %add.3721.9, double 0.000000e+00
  %61 = getelementptr double, ptr addrspace(1) %arg934, i64 %10
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !299
  %63 = select i1 %15, double %62, double 0.000000e+00
  %multiply.2806.9 = fmul double %52, %add.3724.5
  %64 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg832, i64 0, i64 %9, i64 %10
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !299
  %multiply.2807.7 = fmul double %multiply.2806.9, %65
  %add.3726.5 = fadd double %63, %multiply.2807.7
  %add.3727.5 = fadd double %60, %add.3726.5
  %66 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg526, i64 0, i64 %9, i64 %10
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !299
  %68 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg322, i64 0, i64 %9, i64 %10
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !299
  %70 = fneg double %add.3727.5
  %71 = fmul double %67, %70
  %72 = fmul double %50, %71
  %73 = fmul double %69, %72
  %add.3728.1 = fadd double %add.3725.3, %73
  %74 = getelementptr double, ptr addrspace(1) %arg2260, i64 %10
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !299
  %76 = select i1 %15, double 0.000000e+00, double %75
  %77 = getelementptr double, ptr addrspace(1) %arg2362, i64 %10
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !299
  %79 = select i1 %15, double 0.000000e+00, double %78
  %80 = getelementptr double, ptr addrspace(1) %arg2464, i64 %10
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !299
  %82 = select i1 %15, double 0.000000e+00, double %81
  %83 = getelementptr double, ptr addrspace(1) %arg2566, i64 %10
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !299
  %85 = select i1 %15, double 0.000000e+00, double %84
  %86 = getelementptr double, ptr addrspace(1) %arg2668, i64 %10
  store double %add.3728.1, ptr addrspace(1) %86, align 8
  %87 = getelementptr double, ptr addrspace(1) %arg2770, i64 %10
  store double %76, ptr addrspace(1) %87, align 8
  %88 = getelementptr double, ptr addrspace(1) %arg2872, i64 %10
  store double %79, ptr addrspace(1) %88, align 8
  %89 = getelementptr double, ptr addrspace(1) %arg2974, i64 %10
  store double %82, ptr addrspace(1) %89, align 8
  %90 = getelementptr double, ptr addrspace(1) %arg3076, i64 %10
  store double %85, ptr addrspace(1) %90, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !299
  %4 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !299
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %9 = fneg double %6
  %10 = fmul double %8, %9
  %multiply.2793.1.clone.1 = fmul double %4, %10
  %multiply.2794.1.clone.1 = fmul double %8, %multiply.2793.1.clone.1
  %multiply.2795.1 = fmul double %3, %multiply.2794.1.clone.1
  %11 = fneg double %10
  %12 = fmul double %8, %11
  %13 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.2795.1, ptr addrspace(1) %13, align 8
  %14 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %multiply.2794.1.clone.1, ptr addrspace(1) %14, align 8
  %15 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %12, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !299
  %4 = getelementptr i8, ptr addrspace(1) %arg25, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !299
  %6 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %8 = trunc i8 %5 to i1
  %9 = select i1 %8, double %7, double 0.000000e+00
  %10 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %multiply.2796.1 = fmul double %9, %10
  %multiply.2797.1 = fmul double %3, %multiply.2796.1
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.2797.1, ptr addrspace(1) %11, align 8
  %12 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %9, ptr addrspace(1) %12, align 8
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg9, ptr noalias nocapture align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg13, ptr noalias nocapture align 128 dereferenceable(32) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg17, ptr noalias nocapture align 128 dereferenceable(32) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg22, ptr noalias nocapture align 128 dereferenceable(32) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg36, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg38, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg42, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg43, ptr noalias nocapture align 128 dereferenceable(32) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg45, ptr noalias nocapture align 128 dereferenceable(32) %arg46, ptr noalias nocapture align 128 dereferenceable(32) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg48, ptr noalias nocapture align 128 dereferenceable(32) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg50, ptr noalias nocapture align 128 dereferenceable(32) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg54, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg55, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg56, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg57, ptr noalias nocapture align 128 dereferenceable(32) %arg58, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg59, ptr noalias nocapture align 128 dereferenceable(32) %arg60, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg61, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg62, ptr noalias nocapture align 128 dereferenceable(32) %arg63, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg64, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg65, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg66, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg67, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg68, ptr noalias nocapture align 128 dereferenceable(32) %arg69, ptr noalias nocapture align 128 dereferenceable(32) %arg70, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg71, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg72, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg73, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg74, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg75, ptr noalias nocapture align 128 dereferenceable(32) %arg76, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg77) local_unnamed_addr #2 {
entry:
  %arg77206 = addrspacecast ptr %arg77 to ptr addrspace(1)
  %arg76204 = addrspacecast ptr %arg76 to ptr addrspace(1)
  %arg75202 = addrspacecast ptr %arg75 to ptr addrspace(1)
  %arg74200 = addrspacecast ptr %arg74 to ptr addrspace(1)
  %arg73198 = addrspacecast ptr %arg73 to ptr addrspace(1)
  %arg72196 = addrspacecast ptr %arg72 to ptr addrspace(1)
  %arg71194 = addrspacecast ptr %arg71 to ptr addrspace(1)
  %arg70192 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69190 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68188 = addrspacecast ptr %arg68 to ptr addrspace(1)
  %arg67186 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66184 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg65182 = addrspacecast ptr %arg65 to ptr addrspace(1)
  %arg64180 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63178 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62176 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61174 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60172 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg58168 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57166 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56164 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55162 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54160 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53158 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52156 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51154 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50152 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49150 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48148 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47146 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46144 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45142 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44140 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg43138 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg42136 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41134 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40132 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39130 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38128 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37126 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36124 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35122 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34120 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33118 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32116 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31114 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30112 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29110 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28108 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27106 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26104 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25102 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24100 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2398 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2296 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2194 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2092 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1990 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1888 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1786 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1684 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1582 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1480 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1378 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1276 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1174 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1072 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg970 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg868 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg766 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg664 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg562 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg460 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg358 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg256 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg154 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg052 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = load i64, ptr addrspace(1) %arg868, align 128, !invariant.load !299
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg562, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !299
  %13 = getelementptr double, ptr addrspace(1) %arg052, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8
  %15 = trunc i8 %12 to i1
  %16 = select i1 %15, double 0.000000e+00, double %14
  %17 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg460, i64 0, i64 %9, i64 %10
  %18 = load i8, ptr addrspace(1) %17, align 1, !invariant.load !299
  %19 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg766, i64 0, i64 %9, i64 %10
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !299
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %15, double %14, double 0.000000e+00
  %23 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg664, i64 0, i64 %9, i64 %10
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !299
  %.neg = fneg double %22
  %25 = select i1 %21, double %.neg, double -0.000000e+00
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg358, i64 0, i64 %9, i64 %10
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !299
  %29 = fneg double %26
  %30 = fmul double %28, %29
  %31 = trunc i8 %18 to i1
  %32 = select i1 %31, double %30, double 0.000000e+00
  %33 = getelementptr double, ptr addrspace(1) %arg154, i64 %10
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !299
  %add.3775.5 = fadd double %34, %32
  %35 = getelementptr double, ptr addrspace(1) %arg1888, i64 %10
  %36 = load double, ptr addrspace(1) %35, align 8
  %37 = select i1 %15, double %36, double 0.000000e+00
  %38 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1786, i64 0, i64 %9, i64 %10
  %39 = load i8, ptr addrspace(1) %38, align 1, !invariant.load !299
  %40 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1684, i64 0, i64 %9, i64 %10
  %41 = load i8, ptr addrspace(1) %40, align 1, !invariant.load !299
  %42 = icmp eq i32 %20, 1
  %43 = trunc i8 %41 to i1
  %44 = select i1 %43, i1 %42, i1 false
  %45 = select i1 %44, double %22, double 0.000000e+00
  %46 = trunc i8 %39 to i1
  %47 = select i1 %46, double %45, double 0.000000e+00
  %48 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1582, i64 0, i64 %9, i64 %10
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !299
  %50 = getelementptr double, ptr addrspace(1) %arg1480, i64 %10
  %51 = load double, ptr addrspace(1) %50, align 8
  %52 = select i1 %15, double %51, double 0.000000e+00
  %53 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1378, i64 0, i64 %9, i64 %10
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !299
  %multiply.2801.13 = fmul double %52, %54
  %55 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1276, i64 0, i64 %9, i64 %10
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !299
  %57 = fneg double %49
  %58 = fmul double %multiply.2801.13, %57
  %59 = fmul double %56, %58
  %multiply.2844.9 = fmul double %59, 2.000000e+00
  %add.3776.9 = fadd double %47, %multiply.2844.9
  %add.3777.11 = fadd double %37, %add.3776.9
  %add.3779.9 = fadd double %34, %add.3777.11
  %60 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1174, i64 0, i64 %9, i64 %10
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !299
  %62 = getelementptr double, ptr addrspace(1) %arg1072, i64 %10
  %63 = load double, ptr addrspace(1) %62, align 8
  %64 = select i1 %15, double %63, double 0.000000e+00
  %add.3780.9 = fadd double %34, %64
  %multiply.2851.7 = fmul double %61, %add.3780.9
  %add.3781.7 = fadd double %multiply.2851.7, %add.3779.9
  %65 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg970, i64 0, i64 %9, i64 %10
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !299
  %67 = fneg double %add.3781.7
  %68 = fmul double %66, %67
  %69 = getelementptr double, ptr addrspace(1) %arg256, i64 %10
  %70 = load double, ptr addrspace(1) %69, align 8
  %71 = select i1 %15, double %70, double 0.000000e+00
  %add.3782.11 = fadd double %34, %71
  %72 = fneg double %add.3782.11
  %73 = fmul double %28, %72
  %74 = fmul double %28, %68
  %add.3784.5 = fsub double %73, %74
  %add.3785.3 = fadd double %add.3775.5, %add.3784.5
  %add.3786.1 = fadd double %16, %add.3785.3
  %75 = getelementptr double, ptr addrspace(1) %arg2398, i64 %10
  %76 = load double, ptr addrspace(1) %75, align 8
  %add.3787.3.clone.1 = fadd double %76, 0.000000e+00
  %77 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2296, i64 0, i64 %9, i64 %10
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !299
  %multiply.2860.5.clone.1 = fmul double %26, %78
  %79 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2194, i64 0, i64 %9, i64 %10
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !299
  %multiply.2861.3.clone.1 = fmul double %multiply.2860.5.clone.1, %80
  %81 = select i1 %31, double %multiply.2861.3.clone.1, double 0.000000e+00
  %add.3789.5.clone.1 = fadd double %34, %81
  %82 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg2092, i64 0, i64 %9, i64 %10
  %83 = load i8, ptr addrspace(1) %82, align 1, !invariant.load !299
  %84 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1990, i64 0, i64 %9, i64 %10
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !299
  %multiply.2862.7.clone.1 = fmul double %add.3780.9, %85
  %add.3790.5.clone.1 = fadd double %68, %multiply.2862.7.clone.1
  %86 = trunc i8 %83 to i1
  %87 = select i1 %86, double %add.3790.5.clone.1, double 0.000000e+00
  %multiply.2864.5.clone.1 = fmul double %80, %87
  %add.3791.3.clone.1 = fadd double %add.3789.5.clone.1, %multiply.2864.5.clone.1
  %add.3792.1.clone.1 = fadd double %add.3787.3.clone.1, %add.3791.3.clone.1
  %88 = select i1 %15, double 0.000000e+00, double %63
  %89 = select i1 %15, double 0.000000e+00, double %70
  %90 = select i1 %15, double 0.000000e+00, double %36
  %91 = getelementptr double, ptr addrspace(1) %arg49150, i64 %10
  %92 = load double, ptr addrspace(1) %91, align 8
  %93 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg50152, i64 0, i64 %9, i64 %10
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !299
  %add.3721.5.clone.1.clone.1 = fadd double %92, %94
  %95 = select i1 %15, double 0.000000e+00, double %add.3721.5.clone.1.clone.1
  %96 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg48148, i64 0, i64 %9, i64 %10
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !299
  %98 = getelementptr double, ptr addrspace(1) %arg47146, i64 %10
  %99 = load double, ptr addrspace(1) %98, align 8
  %100 = select i1 %15, double %99, double 0.000000e+00
  %101 = getelementptr double, ptr addrspace(1) %arg46144, i64 %10
  %102 = load double, ptr addrspace(1) %101, align 8
  %103 = select i1 %15, double %102, double 0.000000e+00
  %104 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg45142, i64 0, i64 %9, i64 %10
  %105 = load double, ptr addrspace(1) %104, align 8, !invariant.load !299
  %106 = getelementptr double, ptr addrspace(1) %arg44140, i64 %10
  %107 = load double, ptr addrspace(1) %106, align 8
  %108 = select i1 %15, double %107, double 0.000000e+00
  %109 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg43138, i64 0, i64 %9, i64 %10
  %110 = load double, ptr addrspace(1) %109, align 8, !invariant.load !299
  %multiply.2798.9.clone.1.clone.1 = fmul double %45, %54
  %111 = fneg double %multiply.2798.9.clone.1.clone.1
  %112 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg42136, i64 0, i64 %9, i64 %10
  %113 = load double, ptr addrspace(1) %112, align 8, !invariant.load !299
  %multiply.2800.7.clone.1.clone.1 = fmul double %multiply.2798.9.clone.1.clone.1, %113
  %114 = fmul double %multiply.2798.9.clone.1.clone.1, %110
  %add.3722.5.clone.1.clone.1 = fsub double %multiply.2800.7.clone.1.clone.1, %114
  %115 = select i1 %46, double %add.3722.5.clone.1.clone.1, double 0.000000e+00
  %116 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg41134, i64 0, i64 %9, i64 %10
  %117 = load double, ptr addrspace(1) %116, align 8, !invariant.load !299
  %118 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg40132, i64 0, i64 %9, i64 %10
  %119 = load double, ptr addrspace(1) %118, align 8, !invariant.load !299
  %multiply.2802.11.clone.1.clone.1 = fmul double %multiply.2801.13, %119
  %multiply.2803.5.clone.1.clone.1 = fmul double %117, %multiply.2802.11.clone.1.clone.1
  %add.3723.5.clone.1.clone.1 = fadd double %115, %multiply.2803.5.clone.1.clone.1
  %add.3724.3.clone.1.clone.1 = fadd double %108, %add.3723.5.clone.1.clone.1
  %multiply.2806.7.clone.1.clone.1 = fmul double %105, %add.3724.3.clone.1.clone.1
  %120 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg39130, i64 0, i64 %9, i64 %10
  %121 = load double, ptr addrspace(1) %120, align 8, !invariant.load !299
  %multiply.2807.5.clone.1.clone.1 = fmul double %121, %multiply.2806.7.clone.1.clone.1
  %add.3726.3.clone.1.clone.1 = fadd double %103, %multiply.2807.5.clone.1.clone.1
  %add.3729.7.clone.1.clone.1 = fsub double %100, %add.3726.3.clone.1.clone.1
  %122 = select i1 %15, double %add.3721.5.clone.1.clone.1, double 0.000000e+00
  %add.3727.3.clone.1.clone.1 = fadd double %122, %add.3726.3.clone.1.clone.1
  %add.3730.1.clone.1.clone.1 = fadd double %34, %add.3727.3.clone.1.clone.1
  %add.3731.5.clone.1.clone.1 = fadd double %add.3729.7.clone.1.clone.1, %add.3730.1.clone.1.clone.1
  %123 = getelementptr double, ptr addrspace(1) %arg38128, i64 %10
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !299
  %125 = select i1 %15, double %124, double 0.000000e+00
  %add.3732.9.clone.1.clone.1 = fadd double %34, %125
  %126 = getelementptr double, ptr addrspace(1) %arg37126, i64 %10
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !299
  %128 = select i1 %15, double %127, double 0.000000e+00
  %129 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg36124, i64 0, i64 %9, i64 %10
  %130 = load double, ptr addrspace(1) %129, align 8, !invariant.load !299
  %multiply.2811.7.clone.1.clone.1 = fmul double %130, %add.3727.3.clone.1.clone.1
  %131 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg35122, i64 0, i64 %9
  %132 = load double, ptr addrspace(1) %131, align 8, !invariant.load !299
  %multiply.2812.9.clone.1.clone.1 = fmul double %132, %multiply.2811.7.clone.1.clone.1
  %add.3733.7.clone.1.clone.1 = fadd double %34, %multiply.2812.9.clone.1.clone.1
  %add.3734.5.clone.1.clone.1 = fadd double %128, %add.3733.7.clone.1.clone.1
  %133 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg34120, i64 0, i64 %9, i64 %10
  %134 = load double, ptr addrspace(1) %133, align 8, !invariant.load !299
  %135 = fneg double %add.3734.5.clone.1.clone.1
  %136 = fdiv double %135, %134
  %137 = fmul double %132, %136
  %add.3735.7.clone.1.clone.1 = fadd double %add.3732.9.clone.1.clone.1, %137
  %138 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg33118, i64 0, i64 %9, i64 %10
  %139 = load double, ptr addrspace(1) %138, align 8, !invariant.load !299
  %140 = getelementptr double, ptr addrspace(1) %arg32116, i64 %10
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !299
  %142 = getelementptr double, ptr addrspace(1) %arg31114, i64 %10
  %143 = load double, ptr addrspace(1) %142, align 8, !invariant.load !299
  %144 = fadd double %141, %143
  %add.3736.11.clone.1.clone.1 = select i1 %15, double %144, double 0.000000e+00
  %145 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg30112, i64 0, i64 %9, i64 %10
  %146 = load double, ptr addrspace(1) %145, align 8, !invariant.load !299
  %147 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg29110, i64 0, i64 %9, i64 %10
  %148 = load double, ptr addrspace(1) %147, align 8, !invariant.load !299
  %multiply.2808.3.clone.1.clone.1 = fmul double %add.3727.3.clone.1.clone.1, %148
  %149 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg28108, i64 0, i64 %9, i64 %10
  %150 = load double, ptr addrspace(1) %149, align 8, !invariant.load !299
  %divide.573.11.clone.1.clone.1 = fdiv double %multiply.2808.3.clone.1.clone.1, %150
  %multiply.2814.11.clone.1.clone.1 = fmul double %146, %divide.573.11.clone.1.clone.1
  %151 = getelementptr double, ptr addrspace(1) %arg27106, i64 %10
  %152 = load double, ptr addrspace(1) %151, align 8, !invariant.load !299
  %add.3737.9.clone.1.clone.1 = fadd double %152, %multiply.2814.11.clone.1.clone.1
  %add.3738.9.clone.1.clone.1 = fadd double %add.3736.11.clone.1.clone.1, %add.3737.9.clone.1.clone.1
  %add.3739.7.clone.1.clone.1 = fadd double %34, %add.3738.9.clone.1.clone.1
  %153 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg26104, i64 0, i64 %9, i64 %10
  %154 = load double, ptr addrspace(1) %153, align 8, !invariant.load !299
  %155 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg25102, i64 0, i64 %9, i64 %10
  %156 = load double, ptr addrspace(1) %155, align 8, !invariant.load !299
  %157 = fmul double %154, %135
  %158 = fmul double %157, %156
  %add.3740.5.clone.1.clone.1 = fadd double %158, %add.3739.7.clone.1.clone.1
  %159 = fmul double %139, %add.3740.5.clone.1.clone.1
  %add.3741.5.clone.1.clone.1 = fsub double %add.3735.7.clone.1.clone.1, %159
  %160 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg24100, i64 0, i64 %9, i64 %10
  %161 = load double, ptr addrspace(1) %160, align 8, !invariant.load !299
  %multiply.2818.7.clone.1.clone.1 = fmul double %161, %add.3740.5.clone.1.clone.1
  %add.3742.5.clone.1.clone.1 = fadd double %multiply.2818.7.clone.1.clone.1, %add.3741.5.clone.1.clone.1
  %multiply.2819.3.clone.1.clone.1 = fmul double %134, %add.3742.5.clone.1.clone.1
  %add.3743.3.clone.1.clone.1 = fadd double %add.3731.5.clone.1.clone.1, %multiply.2819.3.clone.1.clone.1
  %multiply.2820.5.clone.1.clone.1 = fmul double %97, %add.3743.3.clone.1.clone.1
  %add.3744.3.clone.1.clone.1 = fadd double %34, %multiply.2820.5.clone.1.clone.1
  %add.3745.1.clone.1.clone.1 = fadd double %95, %add.3744.3.clone.1.clone.1
  %162 = getelementptr double, ptr addrspace(1) %arg51154, i64 %10
  %163 = load double, ptr addrspace(1) %162, align 8
  %164 = select i1 %15, double 0.000000e+00, double %163
  %165 = getelementptr double, ptr addrspace(1) %arg58168, i64 %10
  %166 = load double, ptr addrspace(1) %165, align 8
  %add.3794.3.clone.1.clone.1 = fadd double %166, 0.000000e+00
  %167 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg57166, i64 0, i64 %9, i64 %10, i64 0
  %168 = load i8, ptr addrspace(1) %167, align 1, !invariant.load !299
  %169 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg56164, i64 0, i64 %9, i64 %10
  %170 = load double, ptr addrspace(1) %169, align 8, !invariant.load !299
  %multiply.2822.3.clone.1.clone.1 = fmul double %170, %111
  %171 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg55162, i64 0, i64 %9, i64 %10
  %172 = load double, ptr addrspace(1) %171, align 8, !invariant.load !299
  %multiply.2866.7.clone.1.clone.1 = fmul double %multiply.2822.3.clone.1.clone.1, %172
  %multiply.2868.5.clone.1.clone.1 = fmul double %multiply.2866.7.clone.1.clone.1, 5.000000e-01
  %173 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg54160, i64 0, i64 %9, i64 %10
  %174 = load double, ptr addrspace(1) %173, align 8, !invariant.load !299
  %multiply.2869.3.clone.1.clone.1 = fmul double %174, %multiply.2868.5.clone.1.clone.1
  %multiply.2824.5.clone.1.clone.1 = fmul double %multiply.2798.9.clone.1.clone.1, %170
  %175 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg53158, i64 0, i64 %9, i64 %10
  %176 = load double, ptr addrspace(1) %175, align 8, !invariant.load !299
  %multiply.2825.3.clone.1.clone.1 = fmul double %multiply.2824.5.clone.1.clone.1, %176
  %multiply.2870.5.clone.1.clone.1 = fmul double %172, %multiply.2825.3.clone.1.clone.1
  %add.3795.3.clone.1.clone.1 = fadd double %multiply.2869.3.clone.1.clone.1, %multiply.2870.5.clone.1.clone.1
  %multiply.2827.5.clone.1.clone.1 = fmul double %multiply.2798.9.clone.1.clone.1, 5.000000e-01
  %multiply.2828.3.clone.1.clone.1 = fmul double %multiply.2827.5.clone.1.clone.1, %176
  %multiply.2871.9.clone.1.clone.1 = fmul double %172, %multiply.2828.3.clone.1.clone.1
  %add.3796.7.clone.1.clone.1 = fadd double %multiply.2871.9.clone.1.clone.1, %add.3795.3.clone.1.clone.1
  %177 = trunc i8 %168 to i1
  %178 = select i1 %177, double %add.3796.7.clone.1.clone.1, double 0.000000e+00
  %multiply.2830.3.clone.1.clone.1 = fmul double %multiply.2802.11.clone.1.clone.1, %170
  %multiply.2872.7.clone.1.clone.1 = fmul double %multiply.2830.3.clone.1.clone.1, %172
  %add.3797.5.clone.1.clone.1 = fadd double %multiply.2872.7.clone.1.clone.1, %178
  %179 = getelementptr double, ptr addrspace(1) %arg52156, i64 %10
  %180 = load double, ptr addrspace(1) %179, align 8, !invariant.load !299
  %add.3799.3.clone.1.clone.1 = fadd double %180, %add.3797.5.clone.1.clone.1
  %add.3800.1.clone.1.clone.1 = fadd double %add.3794.3.clone.1.clone.1, %add.3799.3.clone.1.clone.1
  %181 = getelementptr double, ptr addrspace(1) %arg60172, i64 %10
  %182 = load double, ptr addrspace(1) %181, align 8
  %183 = select i1 %15, double 0.000000e+00, double %182
  %184 = getelementptr double, ptr addrspace(1) %arg63178, i64 %10
  %185 = load double, ptr addrspace(1) %184, align 8
  %186 = select i1 %15, double 0.000000e+00, double %185
  %187 = getelementptr double, ptr addrspace(1) %arg61174, i64 %10
  %188 = load double, ptr addrspace(1) %187, align 8, !invariant.load !299
  %189 = getelementptr double, ptr addrspace(1) %arg76204, i64 %10
  %190 = load double, ptr addrspace(1) %189, align 8
  %191 = select i1 %15, double %190, double 0.000000e+00
  %192 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg75202, i64 0, i64 %9, i64 %10
  %193 = load double, ptr addrspace(1) %192, align 8, !invariant.load !299
  %multiply.2821.7.clone.1.clone.1 = fmul double %add.3724.3.clone.1.clone.1, %193
  %divide.574.7.clone.1.clone.1 = fdiv double %add.3724.3.clone.1.clone.1, %150
  %add.3746.5.clone.1.clone.1 = fadd double %divide.574.7.clone.1.clone.1, %multiply.2821.7.clone.1.clone.1
  %add.3747.7.clone.1.clone.1 = fadd double %191, %add.3746.5.clone.1.clone.1
  %194 = getelementptr double, ptr addrspace(1) %arg74200, i64 %10
  %195 = load double, ptr addrspace(1) %194, align 8, !invariant.load !299
  %add.3748.5.clone.1.clone.1 = fadd double %195, %add.3747.7.clone.1.clone.1
  %196 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg73198, i64 0, i64 %9, i64 %10
  %197 = load double, ptr addrspace(1) %196, align 8, !invariant.load !299
  %198 = select i1 %15, double %182, double 0.000000e+00
  %199 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg67186, i64 0, i64 %9, i64 %10
  %200 = load double, ptr addrspace(1) %199, align 8, !invariant.load !299
  %multiply.2823.13.clone.1.clone.1 = fmul double %multiply.2822.3.clone.1.clone.1, %200
  %201 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg66184, i64 0, i64 %9, i64 %10
  %202 = load double, ptr addrspace(1) %201, align 8, !invariant.load !299
  %multiply.2826.7.clone.1.clone.1 = fmul double %multiply.2825.3.clone.1.clone.1, %202
  %add.3749.11.clone.1.clone.1 = fadd double %multiply.2823.13.clone.1.clone.1, %multiply.2826.7.clone.1.clone.1
  %multiply.2829.7.clone.1.clone.1 = fmul double %multiply.2828.3.clone.1.clone.1, %202
  %add.3750.9.clone.1.clone.1 = fadd double %multiply.2829.7.clone.1.clone.1, %add.3749.11.clone.1.clone.1
  %203 = select i1 %46, double %add.3750.9.clone.1.clone.1, double 0.000000e+00
  %multiply.2831.9.clone.1.clone.1 = fmul double %multiply.2830.3.clone.1.clone.1, %202
  %add.3751.7.clone.1.clone.1 = fadd double %multiply.2831.9.clone.1.clone.1, %203
  %add.3752.7.clone.1.clone.1 = fadd double %198, %add.3751.7.clone.1.clone.1
  %add.3754.5.clone.1.clone.1 = fadd double %34, %add.3752.7.clone.1.clone.1
  %multiply.2832.3.clone.1.clone.1 = fmul double %197, %add.3754.5.clone.1.clone.1
  %add.3755.3.clone.1.clone.1 = fadd double %add.3748.5.clone.1.clone.1, %multiply.2832.3.clone.1.clone.1
  %204 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg72196, i64 0, i64 %9, i64 %10
  %205 = load double, ptr addrspace(1) %204, align 8, !invariant.load !299
  %206 = fneg double %add.3755.3.clone.1.clone.1
  %207 = fmul double %205, %206
  %208 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg62176, i64 0, i64 %9, i64 %10
  %209 = load double, ptr addrspace(1) %208, align 8, !invariant.load !299
  %210 = select i1 %15, double %163, double 0.000000e+00
  %add.3756.11.clone.1.clone.1 = fadd double %34, %210
  %211 = fneg double %add.3756.11.clone.1.clone.1
  %212 = fmul double %209, %211
  %213 = fmul double %209, %207
  %add.3757.5.clone.1.clone.1 = fsub double %212, %213
  %add.3759.3.clone.1.clone.1 = fadd double %188, %add.3757.5.clone.1.clone.1
  %add.3760.1.clone.1.clone.1 = fadd double %186, %add.3759.3.clone.1.clone.1
  %214 = getelementptr double, ptr addrspace(1) %arg69190, i64 %10
  %215 = load double, ptr addrspace(1) %214, align 8
  %add.3764.3.clone.1.clone.1 = fadd double %215, 0.000000e+00
  %216 = getelementptr double, ptr addrspace(1) %arg64180, i64 %10
  %217 = load double, ptr addrspace(1) %216, align 8, !invariant.load !299
  %218 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg68188, i64 0, i64 %9, i64 %10
  %219 = load i8, ptr addrspace(1) %218, align 1, !invariant.load !299
  %multiply.2836.11.clone.1.clone.1 = fmul double %105, %add.3754.5.clone.1.clone.1
  %add.3765.9.clone.1.clone.1 = fadd double %multiply.2836.11.clone.1.clone.1, %207
  %220 = trunc i8 %219 to i1
  %221 = select i1 %220, double %add.3765.9.clone.1.clone.1, double 0.000000e+00
  %222 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg65182, i64 0, i64 %9, i64 %10
  %223 = load double, ptr addrspace(1) %222, align 8, !invariant.load !299
  %multiply.2837.5.clone.1.clone.1 = fmul double %223, %221
  %add.3766.1.clone.1.clone.1 = fadd double %217, %multiply.2837.5.clone.1.clone.1
  %add.3767.1.clone.1.clone.1 = fadd double %add.3764.3.clone.1.clone.1, %add.3766.1.clone.1.clone.1
  %224 = select i1 %15, double 0.000000e+00, double %51
  %225 = getelementptr double, ptr addrspace(1) %arg71194, i64 %10
  %226 = load double, ptr addrspace(1) %225, align 8, !invariant.load !299
  %227 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg77206, i64 0, i64 %9, i64 %10
  %228 = load double, ptr addrspace(1) %227, align 8, !invariant.load !299
  %multiply.2838.7.clone.1.clone.1 = fmul double %228, %multiply.2837.5.clone.1.clone.1
  %add.3769.5.clone.1.clone.1 = fadd double %226, %multiply.2838.7.clone.1.clone.1
  %229 = getelementptr double, ptr addrspace(1) %arg70192, i64 %10
  %230 = load double, ptr addrspace(1) %229, align 8
  %231 = select i1 %15, double %230, double 0.000000e+00
  %add.3770.7.clone.1.clone.1 = fadd double %52, %231
  %add.3771.5.clone.1.clone.1 = fadd double %34, %add.3770.7.clone.1.clone.1
  %multiply.2839.3.clone.1.clone.1 = fmul double %97, %add.3771.5.clone.1.clone.1
  %add.3772.3.clone.1.clone.1 = fadd double %multiply.2839.3.clone.1.clone.1, %add.3769.5.clone.1.clone.1
  %add.3774.1.clone.1.clone.1 = fadd double %224, %add.3772.3.clone.1.clone.1
  %232 = select i1 %15, double 0.000000e+00, double %230
  %233 = select i1 %15, double 0.000000e+00, double %107
  %add.3762.1.clone.1 = fadd double %34, %233
  %234 = select i1 %15, double 0.000000e+00, double %102
  %add.3761.1.clone.1 = fadd double %34, %234
  %235 = select i1 %15, double 0.000000e+00, double %190
  %236 = select i1 %15, double 0.000000e+00, double %99
  store double %add.3786.1, ptr addrspace(1) %13, align 8
  store double %add.3792.1.clone.1, ptr addrspace(1) %75, align 8
  store double %88, ptr addrspace(1) %62, align 8
  store double %89, ptr addrspace(1) %69, align 8
  store double %90, ptr addrspace(1) %35, align 8
  store double %add.3745.1.clone.1.clone.1, ptr addrspace(1) %91, align 8
  store double %164, ptr addrspace(1) %162, align 8
  store double %add.3800.1.clone.1.clone.1, ptr addrspace(1) %165, align 8
  store double %183, ptr addrspace(1) %181, align 8
  store double %add.3760.1.clone.1.clone.1, ptr addrspace(1) %184, align 8
  store double %add.3767.1.clone.1.clone.1, ptr addrspace(1) %214, align 8
  store double %add.3774.1.clone.1.clone.1, ptr addrspace(1) %50, align 8
  store double %232, ptr addrspace(1) %229, align 8
  store double %add.3762.1.clone.1, ptr addrspace(1) %106, align 8
  store double %add.3761.1.clone.1, ptr addrspace(1) %101, align 8
  store double %235, ptr addrspace(1) %189, align 8
  store double %236, ptr addrspace(1) %98, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_reduce_fusion_2(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #9 {
entry:
  %arg732 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %18, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.3619.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.3619.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.3619.i16 = fadd double %add.3619.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %17 = zext nneg i32 %thread.id.x to i64
  %param_5.1708 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg528, i64 0, i64 %17
  %param_5.17082 = load double, ptr addrspace(1) %param_5.1708, align 8, !invariant.load !299
  %add.3855.5.clone.1 = fadd double %param_5.17082, -1.000000e+00
  %multiply.2966.1.clone.1 = fmul double %add.3855.5.clone.1, %add.3855.5.clone.1
  %add.3877.1.clone.1 = fadd double %multiply.2966.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.2967.1.clone.1 = fmul double %add.3877.1.clone.1, 5.000000e-01
  %18 = fsub double 0.000000e+00, %multiply.2967.1.clone.1
  %param_0.3137 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg018, i64 0, i64 %17
  %param_0.31373 = load double, ptr addrspace(1) %param_0.3137, align 8
  %param_3.2757 = load i64, ptr addrspace(1) %arg324, align 128, !invariant.load !299
  %19 = sitofp i64 %param_3.2757 to double
  %param_2.3547 = load double, ptr addrspace(1) %arg222, align 128, !invariant.load !299
  %multiply.2909.23 = fmul double %param_2.3547, %19
  %multiply.2910.9 = fmul double %multiply.2909.23, 5.000000e-01
  %param_1.4494 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg120, i64 0, i64 %17
  %param_1.44944 = load double, ptr addrspace(1) %param_1.4494, align 8, !invariant.load !299
  %multiply.2914.3 = fmul double %param_1.44944, %multiply.2910.9
  %add.3827.3 = fadd double %param_0.31373, %multiply.2914.3
  %param_4.2119 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg426, i64 0, i64 %17
  %param_4.21195 = load double, ptr addrspace(1) %param_4.2119, align 8, !invariant.load !299
  %add.3856.1.clone.1 = fsub double %param_4.21195, %add.3855.5.clone.1
  %multiply.2947.1 = fmul double %multiply.2910.9, %add.3856.1.clone.1
  %add.3857.1 = fadd double %add.3827.3, %multiply.2947.1
  store double %add.3857.1, ptr addrspace(1) %param_0.3137, align 8
  %20 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg630, i64 0, i64 %17
  store double %add.3856.1.clone.1, ptr addrspace(1) %20, align 8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i16, ptr addrspace(1) %arg732, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_reduce_fusion_1(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #9 {
entry:
  %arg732 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %18, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.3619.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.3619.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.3619.i16 = fadd double %add.3619.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %17 = zext nneg i32 %thread.id.x to i64
  %param_5.1704 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg528, i64 0, i64 %17
  %param_5.17042 = load double, ptr addrspace(1) %param_5.1704, align 8, !invariant.load !299
  %add.3859.5.clone.1 = fadd double %param_5.17042, 4.000000e+00
  %multiply.2952.1.clone.1 = fmul double %add.3859.5.clone.1, %add.3859.5.clone.1
  %multiply.2953.1.clone.1 = fmul double %multiply.2952.1.clone.1, 2.500000e-01
  %add.3866.1.clone.1 = fadd double %multiply.2953.1.clone.1, 0x4009CB1A63AF7C52
  %multiply.2954.1.clone.1 = fmul double %add.3866.1.clone.1, 5.000000e-01
  %18 = fsub double 0.000000e+00, %multiply.2954.1.clone.1
  %param_0.3136 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg018, i64 0, i64 %17
  %param_0.31363 = load double, ptr addrspace(1) %param_0.3136, align 8
  %param_3.2756 = load i64, ptr addrspace(1) %arg324, align 128, !invariant.load !299
  %19 = sitofp i64 %param_3.2756 to double
  %param_2.3546 = load double, ptr addrspace(1) %arg222, align 128, !invariant.load !299
  %multiply.2909.19 = fmul double %param_2.3546, %19
  %multiply.2910.5 = fmul double %multiply.2909.19, 5.000000e-01
  %param_1.4493 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg120, i64 0, i64 %17
  %param_1.44934 = load double, ptr addrspace(1) %param_1.4493, align 8, !invariant.load !299
  %multiply.2915.3 = fmul double %param_1.44934, %multiply.2910.5
  %add.3829.3 = fadd double %param_0.31363, %multiply.2915.3
  %param_4.2118 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg426, i64 0, i64 %17
  %param_4.21185 = load double, ptr addrspace(1) %param_4.2118, align 8, !invariant.load !299
  %multiply.2948.3.clone.1 = fmul double %add.3859.5.clone.1, 2.500000e-01
  %20 = fsub double %param_4.21185, %multiply.2948.3.clone.1
  %multiply.2949.1 = fmul double %multiply.2910.5, %20
  %add.3861.1 = fadd double %add.3829.3, %multiply.2949.1
  store double %add.3861.1, ptr addrspace(1) %param_0.3136, align 8
  %21 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg630, i64 0, i64 %17
  store double %20, ptr addrspace(1) %21, align 8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i16, ptr addrspace(1) %arg732, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_reduce_fusion_4(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #9 {
entry:
  %arg732 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %18, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.3619.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.3619.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.3619.i16 = fadd double %add.3619.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %17 = zext nneg i32 %thread.id.x to i64
  %param_4.2123 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg426, i64 0, i64 %17
  %param_4.21232 = load double, ptr addrspace(1) %param_4.2123, align 8, !invariant.load !299
  %add.3847.5.clone.1 = fadd double %param_4.21232, -1.000000e+00
  %multiply.2963.1.clone.1 = fmul double %add.3847.5.clone.1, %add.3847.5.clone.1
  %multiply.2964.1.clone.1 = fmul double %multiply.2963.1.clone.1, 4.000000e+00
  %add.3875.1.clone.1 = fadd double %multiply.2964.1.clone.1, 0x3FDCE6BB25AA1315
  %multiply.2965.1.clone.1 = fmul double %add.3875.1.clone.1, 5.000000e-01
  %18 = fsub double 0.000000e+00, %multiply.2965.1.clone.1
  %param_0.3139 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg018, i64 0, i64 %17
  %param_0.31393 = load double, ptr addrspace(1) %param_0.3139, align 8
  %param_3.2759 = load i64, ptr addrspace(1) %arg324, align 128, !invariant.load !299
  %19 = sitofp i64 %param_3.2759 to double
  %param_2.3549 = load double, ptr addrspace(1) %arg222, align 128, !invariant.load !299
  %multiply.2909.27 = fmul double %param_2.3549, %19
  %multiply.2910.13 = fmul double %multiply.2909.27, 5.000000e-01
  %param_1.4496 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg120, i64 0, i64 %17
  %param_1.44964 = load double, ptr addrspace(1) %param_1.4496, align 8, !invariant.load !299
  %multiply.2912.3 = fmul double %param_1.44964, %multiply.2910.13
  %add.3825.3 = fadd double %param_0.31393, %multiply.2912.3
  %param_5.1716 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg528, i64 0, i64 %17, i64 0
  %param_5.17165 = load double, ptr addrspace(1) %param_5.1716, align 8, !invariant.load !299
  %multiply.2940.1.clone.1 = fmul double %add.3847.5.clone.1, 4.000000e+00
  %20 = fsub double %param_5.17165, %multiply.2940.1.clone.1
  %multiply.2941.1 = fmul double %multiply.2910.13, %20
  %add.3850.1 = fadd double %add.3825.3, %multiply.2941.1
  store double %add.3850.1, ptr addrspace(1) %param_0.3139, align 8
  %21 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg630, i64 0, i64 %17
  store double %20, ptr addrspace(1) %21, align 8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i16, ptr addrspace(1) %arg732, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_reduce_fusion(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #9 {
entry:
  %arg732 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %18, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.3619.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.3619.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.3619.i16 = fadd double %add.3619.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %17 = zext nneg i32 %thread.id.x to i64
  %param_5.1701 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg528, i64 0, i64 %17
  %param_5.17012 = load double, ptr addrspace(1) %param_5.1701, align 8, !invariant.load !299
  %add.3862.5.clone.1 = fadd double %param_5.17012, 6.000000e+00
  %multiply.2960.1.clone.1 = fmul double %add.3862.5.clone.1, %add.3862.5.clone.1
  %multiply.2961.1.clone.1 = fmul double %multiply.2960.1.clone.1, 2.500000e-01
  %add.3872.1.clone.1 = fadd double %multiply.2961.1.clone.1, 0x4009CB1A63AF7C52
  %multiply.2962.1.clone.1 = fmul double %add.3872.1.clone.1, 5.000000e-01
  %18 = fsub double 0.000000e+00, %multiply.2962.1.clone.1
  %param_0.3135 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg018, i64 0, i64 %17
  %param_0.31353 = load double, ptr addrspace(1) %param_0.3135, align 8
  %param_3.2755 = load i64, ptr addrspace(1) %arg324, align 128, !invariant.load !299
  %19 = sitofp i64 %param_3.2755 to double
  %param_2.3545 = load double, ptr addrspace(1) %arg222, align 128, !invariant.load !299
  %multiply.2909.17 = fmul double %param_2.3545, %19
  %multiply.2910.3 = fmul double %multiply.2909.17, 5.000000e-01
  %param_1.4492 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg120, i64 0, i64 %17
  %param_1.44924 = load double, ptr addrspace(1) %param_1.4492, align 8, !invariant.load !299
  %multiply.2916.3 = fmul double %param_1.44924, %multiply.2910.3
  %add.3830.3 = fadd double %param_0.31353, %multiply.2916.3
  %param_4.2117 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg426, i64 0, i64 %17
  %param_4.21175 = load double, ptr addrspace(1) %param_4.2117, align 8, !invariant.load !299
  %multiply.2950.3.clone.1 = fmul double %add.3862.5.clone.1, 2.500000e-01
  %20 = fsub double %param_4.21175, %multiply.2950.3.clone.1
  %multiply.2951.1 = fmul double %multiply.2910.3, %20
  %add.3865.1 = fadd double %add.3830.3, %multiply.2951.1
  store double %add.3865.1, ptr addrspace(1) %param_0.3135, align 8
  %21 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg630, i64 0, i64 %17
  store double %20, ptr addrspace(1) %21, align 8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i16, ptr addrspace(1) %arg732, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @wrapped_concatenate(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg6) local_unnamed_addr #4 {
entry:
  %arg619 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg517 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %1 = icmp ult i32 %0, 12
  br i1 %1, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %entry
  %2 = icmp ult i32 %0, 4
  br i1 %2, label %concatenate.40.1.merge, label %concatenate.pivot.8.

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %3 = icmp ult i32 %0, 8
  br i1 %3, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  %4 = add nsw i32 %0, -4
  br label %concatenate.40.1.merge

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  %5 = add nsw i32 %0, -8
  br label %concatenate.40.1.merge

concatenate.pivot.16.:                            ; preds = %entry
  %6 = icmp ult i32 %0, 16
  br i1 %6, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  %7 = add nsw i32 %0, -12
  br label %concatenate.40.1.merge

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %8 = icmp ult i32 %0, 20
  br i1 %8, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  %9 = add nsw i32 %0, -16
  br label %concatenate.40.1.merge

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  %10 = add nsw i32 %0, -20
  br label %concatenate.40.1.merge

concatenate.40.1.merge:                           ; preds = %concatenate.pivot.4., %concatenate.pivot.20.5, %concatenate.pivot.16.4, %concatenate.pivot.12.3, %concatenate.pivot.8.2, %concatenate.pivot.4.1
  %.sink6 = phi i32 [ %10, %concatenate.pivot.20.5 ], [ %9, %concatenate.pivot.16.4 ], [ %7, %concatenate.pivot.12.3 ], [ %5, %concatenate.pivot.8.2 ], [ %4, %concatenate.pivot.4.1 ], [ %0, %concatenate.pivot.4. ]
  %arg5.sink = phi ptr addrspace(1) [ %arg517, %concatenate.pivot.20.5 ], [ %arg415, %concatenate.pivot.16.4 ], [ %arg313, %concatenate.pivot.12.3 ], [ %arg211, %concatenate.pivot.8.2 ], [ %arg19, %concatenate.pivot.4.1 ], [ %arg07, %concatenate.pivot.4. ]
  %11 = zext nneg i32 %.sink6 to i64
  %12 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5.sink, i64 0, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !299
  %14 = zext nneg i32 %0 to i64
  %15 = getelementptr double, ptr addrspace(1) %arg619, i64 %14
  store double %13, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_minimum_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg13) local_unnamed_addr #2 {
entry:
  %arg1338 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1236 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1134 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1032 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg930 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg828 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg726 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg012, align 128, !invariant.load !299
  %1 = load double, ptr addrspace(1) %arg828, align 128, !invariant.load !299
  %2 = load double, ptr addrspace(1) %arg930, align 128, !invariant.load !299
  %3 = load double, ptr addrspace(1) %arg726, align 128, !invariant.load !299
  %4 = load double, ptr addrspace(1) %arg624, align 128, !invariant.load !299
  %5 = load double, ptr addrspace(1) %arg522, align 128, !invariant.load !299
  %6 = load double, ptr addrspace(1) %arg420, align 128, !invariant.load !299
  %7 = load double, ptr addrspace(1) %arg318, align 128, !invariant.load !299
  %8 = load <2 x double>, ptr addrspace(1) %arg216, align 128, !invariant.load !299
  %9 = extractelement <2 x double> %8, i32 0
  %10 = extractelement <2 x double> %8, i32 1
  %11 = load <2 x double>, ptr addrspace(1) %arg114, align 128, !invariant.load !299
  %12 = extractelement <2 x double> %11, i32 0
  %13 = extractelement <2 x double> %11, i32 1
  %multiply.2968.3.clone.1 = fmul double %9, %12
  %multiply.2969.3.clone.1 = fmul double %12, %multiply.2968.3.clone.1
  %add.3619.i = fadd double %multiply.2969.3.clone.1, 0.000000e+00
  %multiply.2968.3.clone.1.1 = fmul double %10, %13
  %multiply.2969.3.clone.1.1 = fmul double %13, %multiply.2968.3.clone.1.1
  %add.3619.i.1 = fadd double %add.3619.i, %multiply.2969.3.clone.1.1
  %14 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 16
  %15 = load <2 x double>, ptr addrspace(1) %14, align 16, !invariant.load !299
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  %18 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 16
  %19 = load <2 x double>, ptr addrspace(1) %18, align 16, !invariant.load !299
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  %multiply.2968.3.clone.1.2 = fmul double %16, %20
  %multiply.2969.3.clone.1.2 = fmul double %20, %multiply.2968.3.clone.1.2
  %add.3619.i.2 = fadd double %add.3619.i.1, %multiply.2969.3.clone.1.2
  %multiply.2968.3.clone.1.3 = fmul double %17, %21
  %multiply.2969.3.clone.1.3 = fmul double %21, %multiply.2968.3.clone.1.3
  %add.3619.i.3 = fadd double %add.3619.i.2, %multiply.2969.3.clone.1.3
  %22 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 32
  %23 = load <2 x double>, ptr addrspace(1) %22, align 32, !invariant.load !299
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %26 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 32
  %27 = load <2 x double>, ptr addrspace(1) %26, align 32, !invariant.load !299
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %multiply.2968.3.clone.1.4 = fmul double %24, %28
  %multiply.2969.3.clone.1.4 = fmul double %28, %multiply.2968.3.clone.1.4
  %add.3619.i.4 = fadd double %add.3619.i.3, %multiply.2969.3.clone.1.4
  %multiply.2968.3.clone.1.5 = fmul double %25, %29
  %multiply.2969.3.clone.1.5 = fmul double %29, %multiply.2968.3.clone.1.5
  %add.3619.i.5 = fadd double %add.3619.i.4, %multiply.2969.3.clone.1.5
  %30 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 48
  %31 = load <2 x double>, ptr addrspace(1) %30, align 16, !invariant.load !299
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %34 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 48
  %35 = load <2 x double>, ptr addrspace(1) %34, align 16, !invariant.load !299
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  %multiply.2968.3.clone.1.6 = fmul double %32, %36
  %multiply.2969.3.clone.1.6 = fmul double %36, %multiply.2968.3.clone.1.6
  %add.3619.i.6 = fadd double %add.3619.i.5, %multiply.2969.3.clone.1.6
  %multiply.2968.3.clone.1.7 = fmul double %33, %37
  %multiply.2969.3.clone.1.7 = fmul double %37, %multiply.2968.3.clone.1.7
  %add.3619.i.7 = fadd double %add.3619.i.6, %multiply.2969.3.clone.1.7
  %38 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 64
  %39 = load <2 x double>, ptr addrspace(1) %38, align 64, !invariant.load !299
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %42 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 64
  %43 = load <2 x double>, ptr addrspace(1) %42, align 64, !invariant.load !299
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %multiply.2968.3.clone.1.8 = fmul double %40, %44
  %multiply.2969.3.clone.1.8 = fmul double %44, %multiply.2968.3.clone.1.8
  %add.3619.i.8 = fadd double %add.3619.i.7, %multiply.2969.3.clone.1.8
  %multiply.2968.3.clone.1.9 = fmul double %41, %45
  %multiply.2969.3.clone.1.9 = fmul double %45, %multiply.2968.3.clone.1.9
  %add.3619.i.9 = fadd double %add.3619.i.8, %multiply.2969.3.clone.1.9
  %46 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 80
  %47 = load <2 x double>, ptr addrspace(1) %46, align 16, !invariant.load !299
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %50 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 80
  %51 = load <2 x double>, ptr addrspace(1) %50, align 16, !invariant.load !299
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %multiply.2968.3.clone.1.10 = fmul double %48, %52
  %multiply.2969.3.clone.1.10 = fmul double %52, %multiply.2968.3.clone.1.10
  %add.3619.i.10 = fadd double %add.3619.i.9, %multiply.2969.3.clone.1.10
  %multiply.2968.3.clone.1.11 = fmul double %49, %53
  %multiply.2969.3.clone.1.11 = fmul double %53, %multiply.2968.3.clone.1.11
  %add.3619.i.11 = fadd double %add.3619.i.10, %multiply.2969.3.clone.1.11
  %54 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 96
  %55 = load <2 x double>, ptr addrspace(1) %54, align 32, !invariant.load !299
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %58 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 96
  %59 = load <2 x double>, ptr addrspace(1) %58, align 32, !invariant.load !299
  %60 = extractelement <2 x double> %59, i32 0
  %61 = extractelement <2 x double> %59, i32 1
  %multiply.2968.3.clone.1.12 = fmul double %56, %60
  %multiply.2969.3.clone.1.12 = fmul double %60, %multiply.2968.3.clone.1.12
  %add.3619.i.12 = fadd double %add.3619.i.11, %multiply.2969.3.clone.1.12
  %multiply.2968.3.clone.1.13 = fmul double %57, %61
  %multiply.2969.3.clone.1.13 = fmul double %61, %multiply.2968.3.clone.1.13
  %add.3619.i.13 = fadd double %add.3619.i.12, %multiply.2969.3.clone.1.13
  %62 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 112
  %63 = load <2 x double>, ptr addrspace(1) %62, align 16, !invariant.load !299
  %64 = extractelement <2 x double> %63, i32 0
  %65 = extractelement <2 x double> %63, i32 1
  %66 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 112
  %67 = load <2 x double>, ptr addrspace(1) %66, align 16, !invariant.load !299
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %multiply.2968.3.clone.1.14 = fmul double %64, %68
  %multiply.2969.3.clone.1.14 = fmul double %68, %multiply.2968.3.clone.1.14
  %add.3619.i.14 = fadd double %add.3619.i.13, %multiply.2969.3.clone.1.14
  %multiply.2968.3.clone.1.15 = fmul double %65, %69
  %multiply.2969.3.clone.1.15 = fmul double %69, %multiply.2968.3.clone.1.15
  %add.3619.i.15 = fadd double %add.3619.i.14, %multiply.2969.3.clone.1.15
  %70 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 128
  %71 = load <2 x double>, ptr addrspace(1) %70, align 128, !invariant.load !299
  %72 = extractelement <2 x double> %71, i32 0
  %73 = extractelement <2 x double> %71, i32 1
  %74 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 128
  %75 = load <2 x double>, ptr addrspace(1) %74, align 128, !invariant.load !299
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %multiply.2968.3.clone.1.16 = fmul double %72, %76
  %multiply.2969.3.clone.1.16 = fmul double %76, %multiply.2968.3.clone.1.16
  %add.3619.i.16 = fadd double %add.3619.i.15, %multiply.2969.3.clone.1.16
  %multiply.2968.3.clone.1.17 = fmul double %73, %77
  %multiply.2969.3.clone.1.17 = fmul double %77, %multiply.2968.3.clone.1.17
  %add.3619.i.17 = fadd double %add.3619.i.16, %multiply.2969.3.clone.1.17
  %78 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 144
  %79 = load <2 x double>, ptr addrspace(1) %78, align 16, !invariant.load !299
  %80 = extractelement <2 x double> %79, i32 0
  %81 = extractelement <2 x double> %79, i32 1
  %82 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 144
  %83 = load <2 x double>, ptr addrspace(1) %82, align 16, !invariant.load !299
  %84 = extractelement <2 x double> %83, i32 0
  %85 = extractelement <2 x double> %83, i32 1
  %multiply.2968.3.clone.1.18 = fmul double %80, %84
  %multiply.2969.3.clone.1.18 = fmul double %84, %multiply.2968.3.clone.1.18
  %add.3619.i.18 = fadd double %add.3619.i.17, %multiply.2969.3.clone.1.18
  %multiply.2968.3.clone.1.19 = fmul double %81, %85
  %multiply.2969.3.clone.1.19 = fmul double %85, %multiply.2968.3.clone.1.19
  %add.3619.i.19 = fadd double %add.3619.i.18, %multiply.2969.3.clone.1.19
  %86 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 160
  %87 = load <2 x double>, ptr addrspace(1) %86, align 32, !invariant.load !299
  %88 = extractelement <2 x double> %87, i32 0
  %89 = extractelement <2 x double> %87, i32 1
  %90 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 160
  %91 = load <2 x double>, ptr addrspace(1) %90, align 32, !invariant.load !299
  %92 = extractelement <2 x double> %91, i32 0
  %93 = extractelement <2 x double> %91, i32 1
  %multiply.2968.3.clone.1.20 = fmul double %88, %92
  %multiply.2969.3.clone.1.20 = fmul double %92, %multiply.2968.3.clone.1.20
  %add.3619.i.20 = fadd double %add.3619.i.19, %multiply.2969.3.clone.1.20
  %multiply.2968.3.clone.1.21 = fmul double %89, %93
  %multiply.2969.3.clone.1.21 = fmul double %93, %multiply.2968.3.clone.1.21
  %add.3619.i.21 = fadd double %add.3619.i.20, %multiply.2969.3.clone.1.21
  %94 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 176
  %95 = load <2 x double>, ptr addrspace(1) %94, align 16, !invariant.load !299
  %96 = extractelement <2 x double> %95, i32 0
  %97 = extractelement <2 x double> %95, i32 1
  %98 = getelementptr inbounds i8, ptr addrspace(1) %arg114, i64 176
  %99 = load <2 x double>, ptr addrspace(1) %98, align 16, !invariant.load !299
  %100 = extractelement <2 x double> %99, i32 0
  %101 = extractelement <2 x double> %99, i32 1
  %multiply.2968.3.clone.1.22 = fmul double %96, %100
  %multiply.2969.3.clone.1.22 = fmul double %100, %multiply.2968.3.clone.1.22
  %add.3619.i.22 = fadd double %add.3619.i.21, %multiply.2969.3.clone.1.22
  %multiply.2968.3.clone.1.23 = fmul double %97, %101
  %multiply.2969.3.clone.1.23 = fmul double %101, %multiply.2968.3.clone.1.23
  %add.3619.i.23 = fadd double %add.3619.i.22, %multiply.2969.3.clone.1.23
  %add.3869.1.clone.1 = fadd double %1, %2
  %add.3871.1.clone.1 = fadd double %add.3869.1.clone.1, %3
  %add.3874.1.clone.1 = fadd double %add.3871.1.clone.1, %4
  %add.3876.1.clone.1 = fadd double %add.3874.1.clone.1, %5
  %add.3879.1.clone.1 = fadd double %add.3876.1.clone.1, %6
  %add.3880.1.clone.1 = fadd double %add.3879.1.clone.1, %7
  %multiply.2970.1.clone.1 = fmul double %add.3619.i.23, 5.000000e-01
  %add.3881.1.clone.1 = fsub double %multiply.2970.1.clone.1, %add.3880.1.clone.1
  %subtract.237.1.clone.1 = fsub double %0, %add.3881.1.clone.1
  %compare.644.1.clone.1 = fcmp uno double %subtract.237.1.clone.1, 0.000000e+00
  %102 = select i1 %compare.644.1.clone.1, double 0xFFF0000000000000, double %subtract.237.1.clone.1
  %103 = fcmp ole double %102, 0.000000e+00
  %minimum.8.1 = select i1 %103, double %102, double 0.000000e+00
  store double %minimum.8.1, ptr addrspace(1) %arg1032, align 128
  store double %102, ptr addrspace(1) %arg1134, align 128
  store double %add.3881.1.clone.1, ptr addrspace(1) %arg1236, align 128
  store double %add.3880.1.clone.1, ptr addrspace(1) %arg1338, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %compare.649.1 = fcmp olt double %0, -1.000000e+03
  %1 = zext i1 %compare.649.1 to i8
  store i8 %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_3(ptr noalias nocapture align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128
  %1 = load double, ptr addrspace(1) %arg14, align 128, !invariant.load !299
  %subtract.224.1 = fsub double %0, %1
  %2 = tail call double @llvm.fabs.f64(double %subtract.224.1)
  %3 = fneg double %2
  %4 = tail call double @llvm.fma.f64(double %3, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #13
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #13
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %3)
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
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #13
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #13
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #13
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %3) #13
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #13
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp one double %subtract.224.1, 0.000000e+00
  %30 = fsub double 0x7FF0000000000000, %2
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #13
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #13
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i) #13
  %43 = bitcast i32 %42 to float
  %44 = fcmp olt float %43, 0x3FFCAAAAA0000000
  %45 = fcmp ogt float %43, 0xBFFB333320000000
  %or.cond.i = and i1 %44, %45
  br i1 %or.cond.i, label %46, label %63

46:                                               ; preds = %__nv_exp.exit
  %47 = fadd double %z.2.i, 2.000000e+00
  %48 = fdiv double %z.2.i, %47
  %49 = fneg double %z.2.i
  %50 = fmul double %48, %49
  %51 = fadd double %z.2.i, %50
  %52 = fmul double %51, %51
  %53 = tail call double @llvm.fma.f64(double %52, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %54 = tail call double @llvm.fma.f64(double %53, double %52, double 0x3EF3B9FF890F468C)
  %55 = tail call double @llvm.fma.f64(double %54, double %52, double 0x3F17457EFD51BAF8)
  %56 = tail call double @llvm.fma.f64(double %55, double %52, double 0x3F3C71C8DE3CE825)
  %57 = tail call double @llvm.fma.f64(double %56, double %52, double 0x3F6249248FA4661F)
  %58 = tail call double @llvm.fma.f64(double %57, double %52, double 0x3F899999999D70C4)
  %59 = tail call double @llvm.fma.f64(double %58, double %52, double 0x3FB5555555555462)
  %60 = fmul double %52, %59
  %61 = tail call double @llvm.fma.f64(double %60, double %51, double %50)
  %62 = fadd double %z.2.i, %61
  br label %__nv_log1p.exit

63:                                               ; preds = %__nv_exp.exit
  %64 = fadd double %z.2.i, 1.000000e+00
  %65 = tail call i32 @llvm.nvvm.d2i.hi(double %64) #13
  %66 = tail call i32 @llvm.nvvm.d2i.lo(double %64) #13
  %67 = icmp slt i32 %65, 1048576
  %68 = fmul double %64, 0x4350000000000000
  %69 = tail call i32 @llvm.nvvm.d2i.lo(double %68) #13
  %70 = tail call i32 @llvm.nvvm.d2i.hi(double %68) #13
  br i1 %67, label %71, label %72

71:                                               ; preds = %63
  br label %72

72:                                               ; preds = %71, %63
  %.0.i = phi double [ %68, %71 ], [ %64, %63 ]
  %ihi.i.0.i = phi i32 [ %70, %71 ], [ %65, %63 ]
  %ilo.i.0.i = phi i32 [ %69, %71 ], [ %66, %63 ]
  %e.i.0.i = phi i32 [ -1077, %71 ], [ -1023, %63 ]
  %73 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %73, 2146435071
  br i1 %or.cond2.i, label %74, label %121

74:                                               ; preds = %72
  %75 = lshr i32 %ihi.i.0.i, 20
  %76 = add nsw i32 %e.i.0.i, %75
  %77 = and i32 %ihi.i.0.i, 1048575
  %78 = or disjoint i32 %77, 1072693248
  %79 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %78) #13
  %80 = icmp ugt i32 %78, 1073127582
  %81 = tail call i32 @llvm.nvvm.d2i.lo(double %79) #13
  %82 = tail call i32 @llvm.nvvm.d2i.hi(double %79) #13
  %83 = add i32 %82, -1048576
  %84 = tail call double @llvm.nvvm.lohi.i2d(i32 %81, i32 %83) #13
  %spec.select = select i1 %80, double %84, double %79
  %85 = zext i1 %80 to i32
  %spec.select1 = add nsw i32 %76, %85
  %86 = fadd double %spec.select, -1.000000e+00
  %87 = fadd double %spec.select, 1.000000e+00
  %88 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %87) #13
  %89 = fneg double %87
  %90 = tail call double @llvm.fma.f64(double %89, double %88, double 1.000000e+00)
  %91 = tail call double @llvm.fma.f64(double %90, double %90, double %90)
  %92 = tail call double @llvm.fma.f64(double %91, double %88, double %88)
  %93 = fmul double %86, %92
  %94 = fadd double %93, %93
  %95 = fmul double %94, %94
  %96 = tail call double @llvm.fma.f64(double %95, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %97 = tail call double @llvm.fma.f64(double %96, double %95, double 0x3EF3B2669F02676F)
  %98 = tail call double @llvm.fma.f64(double %97, double %95, double 0x3F1745CBA9AB0956)
  %99 = tail call double @llvm.fma.f64(double %98, double %95, double 0x3F3C71C72D1B5154)
  %100 = tail call double @llvm.fma.f64(double %99, double %95, double 0x3F624924923BE72D)
  %101 = tail call double @llvm.fma.f64(double %100, double %95, double 0x3F8999999999A3C4)
  %102 = tail call double @llvm.fma.f64(double %101, double %95, double 0x3FB5555555555554)
  %103 = fsub double %86, %94
  %104 = fmul double %103, 2.000000e+00
  %105 = fneg double %94
  %106 = tail call double @llvm.fma.f64(double %105, double %86, double %104)
  %107 = fmul double %92, %106
  %108 = fmul double %95, %102
  %109 = tail call double @llvm.fma.f64(double %108, double %94, double %107)
  %110 = xor i32 %spec.select1, -2147483648
  %111 = tail call double @llvm.nvvm.lohi.i2d(i32 %110, i32 1127219200) #13
  %112 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %113 = fsub double %111, %112
  %114 = tail call double @llvm.fma.f64(double %113, double 0x3FE62E42FEFA39EF, double %94)
  %115 = fneg double %113
  %116 = tail call double @llvm.fma.f64(double %115, double 0x3FE62E42FEFA39EF, double %114)
  %117 = fsub double %116, %94
  %118 = fsub double %109, %117
  %119 = tail call double @llvm.fma.f64(double %113, double 0x3C7ABC9E3B39803F, double %118)
  %120 = fadd double %114, %119
  br label %__nv_log1p.exit

121:                                              ; preds = %72
  %122 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %123 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %124 = and i32 %123, 2147483647
  %125 = icmp eq i32 %124, 0
  %q.i.0.i = select i1 %125, double 0xFFF0000000000000, double %122
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %46, %74, %121
  %t.0.i = phi double [ %62, %46 ], [ %120, %74 ], [ %q.i.0.i, %121 ]
  %126 = fcmp uno double %0, 0.000000e+00
  %127 = fcmp oge double %0, %1
  %128 = or i1 %126, %127
  %maximum.40.1 = select i1 %128, double %0, double %1
  %add.3713.1 = fadd double %0, %1
  %compare.613.1 = fcmp uno double %subtract.224.1, 0.000000e+00
  %add.3714.1 = fadd double %maximum.40.1, %t.0.i
  %129 = select i1 %compare.613.1, double %add.3713.1, double %add.3714.1
  store double %129, ptr addrspace(1) %arg02, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !299
  %1 = load double, ptr addrspace(1) %arg14, align 128, !invariant.load !299
  %subtract.223.1 = fsub double %0, %1
  %2 = tail call double @llvm.fabs.f64(double %subtract.223.1)
  %3 = fneg double %2
  %4 = tail call double @llvm.fma.f64(double %3, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #13
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #13
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %3)
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
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #13
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #13
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #13
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %3) #13
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #13
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp one double %subtract.223.1, 0.000000e+00
  %30 = fsub double 0x7FF0000000000000, %2
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #13
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #13
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i) #13
  %43 = bitcast i32 %42 to float
  %44 = fcmp olt float %43, 0x3FFCAAAAA0000000
  %45 = fcmp ogt float %43, 0xBFFB333320000000
  %or.cond.i = and i1 %44, %45
  br i1 %or.cond.i, label %46, label %63

46:                                               ; preds = %__nv_exp.exit
  %47 = fadd double %z.2.i, 2.000000e+00
  %48 = fdiv double %z.2.i, %47
  %49 = fneg double %z.2.i
  %50 = fmul double %48, %49
  %51 = fadd double %z.2.i, %50
  %52 = fmul double %51, %51
  %53 = tail call double @llvm.fma.f64(double %52, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %54 = tail call double @llvm.fma.f64(double %53, double %52, double 0x3EF3B9FF890F468C)
  %55 = tail call double @llvm.fma.f64(double %54, double %52, double 0x3F17457EFD51BAF8)
  %56 = tail call double @llvm.fma.f64(double %55, double %52, double 0x3F3C71C8DE3CE825)
  %57 = tail call double @llvm.fma.f64(double %56, double %52, double 0x3F6249248FA4661F)
  %58 = tail call double @llvm.fma.f64(double %57, double %52, double 0x3F899999999D70C4)
  %59 = tail call double @llvm.fma.f64(double %58, double %52, double 0x3FB5555555555462)
  %60 = fmul double %52, %59
  %61 = tail call double @llvm.fma.f64(double %60, double %51, double %50)
  %62 = fadd double %z.2.i, %61
  br label %__nv_log1p.exit

63:                                               ; preds = %__nv_exp.exit
  %64 = fadd double %z.2.i, 1.000000e+00
  %65 = tail call i32 @llvm.nvvm.d2i.hi(double %64) #13
  %66 = tail call i32 @llvm.nvvm.d2i.lo(double %64) #13
  %67 = icmp slt i32 %65, 1048576
  %68 = fmul double %64, 0x4350000000000000
  %69 = tail call i32 @llvm.nvvm.d2i.lo(double %68) #13
  %70 = tail call i32 @llvm.nvvm.d2i.hi(double %68) #13
  br i1 %67, label %71, label %72

71:                                               ; preds = %63
  br label %72

72:                                               ; preds = %71, %63
  %.0.i = phi double [ %68, %71 ], [ %64, %63 ]
  %ihi.i.0.i = phi i32 [ %70, %71 ], [ %65, %63 ]
  %ilo.i.0.i = phi i32 [ %69, %71 ], [ %66, %63 ]
  %e.i.0.i = phi i32 [ -1077, %71 ], [ -1023, %63 ]
  %73 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %73, 2146435071
  br i1 %or.cond2.i, label %74, label %121

74:                                               ; preds = %72
  %75 = lshr i32 %ihi.i.0.i, 20
  %76 = add nsw i32 %e.i.0.i, %75
  %77 = and i32 %ihi.i.0.i, 1048575
  %78 = or disjoint i32 %77, 1072693248
  %79 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %78) #13
  %80 = icmp ugt i32 %78, 1073127582
  %81 = tail call i32 @llvm.nvvm.d2i.lo(double %79) #13
  %82 = tail call i32 @llvm.nvvm.d2i.hi(double %79) #13
  %83 = add i32 %82, -1048576
  %84 = tail call double @llvm.nvvm.lohi.i2d(i32 %81, i32 %83) #13
  %spec.select = select i1 %80, double %84, double %79
  %85 = zext i1 %80 to i32
  %spec.select1 = add nsw i32 %76, %85
  %86 = fadd double %spec.select, -1.000000e+00
  %87 = fadd double %spec.select, 1.000000e+00
  %88 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %87) #13
  %89 = fneg double %87
  %90 = tail call double @llvm.fma.f64(double %89, double %88, double 1.000000e+00)
  %91 = tail call double @llvm.fma.f64(double %90, double %90, double %90)
  %92 = tail call double @llvm.fma.f64(double %91, double %88, double %88)
  %93 = fmul double %86, %92
  %94 = fadd double %93, %93
  %95 = fmul double %94, %94
  %96 = tail call double @llvm.fma.f64(double %95, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %97 = tail call double @llvm.fma.f64(double %96, double %95, double 0x3EF3B2669F02676F)
  %98 = tail call double @llvm.fma.f64(double %97, double %95, double 0x3F1745CBA9AB0956)
  %99 = tail call double @llvm.fma.f64(double %98, double %95, double 0x3F3C71C72D1B5154)
  %100 = tail call double @llvm.fma.f64(double %99, double %95, double 0x3F624924923BE72D)
  %101 = tail call double @llvm.fma.f64(double %100, double %95, double 0x3F8999999999A3C4)
  %102 = tail call double @llvm.fma.f64(double %101, double %95, double 0x3FB5555555555554)
  %103 = fsub double %86, %94
  %104 = fmul double %103, 2.000000e+00
  %105 = fneg double %94
  %106 = tail call double @llvm.fma.f64(double %105, double %86, double %104)
  %107 = fmul double %92, %106
  %108 = fmul double %95, %102
  %109 = tail call double @llvm.fma.f64(double %108, double %94, double %107)
  %110 = xor i32 %spec.select1, -2147483648
  %111 = tail call double @llvm.nvvm.lohi.i2d(i32 %110, i32 1127219200) #13
  %112 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %113 = fsub double %111, %112
  %114 = tail call double @llvm.fma.f64(double %113, double 0x3FE62E42FEFA39EF, double %94)
  %115 = fneg double %113
  %116 = tail call double @llvm.fma.f64(double %115, double 0x3FE62E42FEFA39EF, double %114)
  %117 = fsub double %116, %94
  %118 = fsub double %109, %117
  %119 = tail call double @llvm.fma.f64(double %113, double 0x3C7ABC9E3B39803F, double %118)
  %120 = fadd double %114, %119
  br label %__nv_log1p.exit

121:                                              ; preds = %72
  %122 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %123 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %124 = and i32 %123, 2147483647
  %125 = icmp eq i32 %124, 0
  %q.i.0.i = select i1 %125, double 0xFFF0000000000000, double %122
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %46, %74, %121
  %t.0.i = phi double [ %62, %46 ], [ %120, %74 ], [ %q.i.0.i, %121 ]
  %126 = fcmp uno double %0, 0.000000e+00
  %127 = fcmp oge double %0, %1
  %128 = or i1 %126, %127
  %maximum.39.1 = select i1 %128, double %0, double %1
  %add.3711.1 = fadd double %0, %1
  %compare.612.1 = fcmp uno double %subtract.223.1, 0.000000e+00
  %add.3712.1 = fadd double %maximum.39.1, %t.0.i
  %129 = select i1 %compare.612.1, double %add.3711.1, double %add.3712.1
  store double %129, ptr addrspace(1) %arg26, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #2 {
entry:
  %arg3130 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2128 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1126 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0124 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load <2 x i32>, ptr addrspace(1) %arg2128, align 128, !invariant.load !299
  %1 = extractelement <2 x i32> %0, i32 0
  %2 = extractelement <2 x i32> %0, i32 1
  %3 = load double, ptr addrspace(1) %arg0124, align 128, !invariant.load !299
  %4 = load double, ptr addrspace(1) %arg1126, align 128, !invariant.load !299
  %subtract.222.1 = fsub double %3, %4
  %5 = fneg double %subtract.222.1
  %6 = tail call double @llvm.fma.f64(double %5, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %7 = tail call i32 @llvm.nvvm.d2i.lo(double %6) #13
  %8 = tail call double @llvm.nvvm.add.rn.d(double %6, double 0xC338000000000000) #13
  %9 = tail call double @llvm.fma.f64(double %8, double 0xBFE62E42FEFA39EF, double %5)
  %10 = tail call double @llvm.fma.f64(double %8, double 0xBC7ABC9E3B39803F, double %9)
  %11 = tail call double @llvm.fma.f64(double %10, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %12 = tail call double @llvm.fma.f64(double %11, double %10, double 0x3EC71DEE62401315)
  %13 = tail call double @llvm.fma.f64(double %12, double %10, double 0x3EFA01997C89EB71)
  %14 = tail call double @llvm.fma.f64(double %13, double %10, double 0x3F2A01A014761F65)
  %15 = tail call double @llvm.fma.f64(double %14, double %10, double 0x3F56C16C1852B7AF)
  %16 = tail call double @llvm.fma.f64(double %15, double %10, double 0x3F81111111122322)
  %17 = tail call double @llvm.fma.f64(double %16, double %10, double 0x3FA55555555502A1)
  %18 = tail call double @llvm.fma.f64(double %17, double %10, double 0x3FC5555555555511)
  %19 = tail call double @llvm.fma.f64(double %18, double %10, double 0x3FE000000000000B)
  %20 = tail call double @llvm.fma.f64(double %19, double %10, double 1.000000e+00)
  %21 = tail call double @llvm.fma.f64(double %20, double %10, double 1.000000e+00)
  %22 = tail call i32 @llvm.nvvm.d2i.lo(double %21) #13
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %21) #13
  %24 = shl i32 %7, 20
  %25 = add i32 %23, %24
  %26 = tail call double @llvm.nvvm.lohi.i2d(i32 %22, i32 %25) #13
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %5) #13
  %28 = bitcast i32 %27 to float
  %29 = tail call float @llvm.nvvm.fabs.f(float %28) #13
  %30 = fcmp olt float %29, 0x4010C46560000000
  br i1 %30, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %31 = fcmp ogt double %subtract.222.1, 0.000000e+00
  %32 = fsub double 0x7FF0000000000000, %subtract.222.1
  %z.0.i = select i1 %31, double 0.000000e+00, double %32
  %33 = fcmp olt float %29, 0x4010E90000000000
  br i1 %33, label %34, label %__nv_exp.exit

34:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %35 = sdiv i32 %7, 2
  %36 = shl i32 %35, 20
  %37 = add i32 %23, %36
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 %22, i32 %37) #13
  %39 = sub nsw i32 %7, %35
  %40 = shl i32 %39, 20
  %41 = add nsw i32 %40, 1072693248
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %41) #13
  %43 = fmul double %42, %38
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %34
  %z.2.i = phi double [ %26, %entry ], [ %43, %34 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %44 = add i32 %2, 1
  %45 = add i32 %44, %1
  %46 = tail call i32 @llvm.fshl.i32(i32 %44, i32 %44, i32 13)
  %47 = xor i32 %45, %46
  %48 = add i32 %47, %45
  %49 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 15)
  %50 = xor i32 %48, %49
  %51 = add i32 %50, %48
  %52 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 26)
  %53 = xor i32 %51, %52
  %54 = add i32 %53, %51
  %55 = add i32 %54, %2
  %56 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %53, i32 6)
  %57 = xor i32 %54, %56
  %58 = xor i32 %1, %2
  %59 = xor i32 %58, 466688986
  %60 = add i32 %59, 1
  %61 = add i32 %60, %57
  %62 = add i32 %55, %61
  %63 = tail call i32 @llvm.fshl.i32(i32 %61, i32 %61, i32 17)
  %64 = xor i32 %62, %63
  %65 = add i32 %64, %62
  %66 = tail call i32 @llvm.fshl.i32(i32 %64, i32 %64, i32 29)
  %67 = xor i32 %65, %66
  %68 = add i32 %67, %65
  %69 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 16)
  %70 = xor i32 %68, %69
  %71 = add i32 %70, %68
  %72 = add i32 %71, %59
  %73 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 24)
  %74 = xor i32 %71, %73
  %75 = add i32 %1, 2
  %76 = add i32 %75, %74
  %77 = add i32 %72, %76
  %78 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 13)
  %79 = xor i32 %77, %78
  %80 = add i32 %79, %77
  %81 = tail call i32 @llvm.fshl.i32(i32 %79, i32 %79, i32 15)
  %82 = xor i32 %80, %81
  %83 = add i32 %82, %80
  %84 = tail call i32 @llvm.fshl.i32(i32 %82, i32 %82, i32 26)
  %85 = xor i32 %83, %84
  %86 = add i32 %85, %83
  %87 = add i32 %86, %1
  %88 = tail call i32 @llvm.fshl.i32(i32 %85, i32 %85, i32 6)
  %89 = xor i32 %86, %88
  %90 = add i32 %2, 3
  %91 = add i32 %90, %89
  %92 = add i32 %87, %91
  %93 = tail call i32 @llvm.fshl.i32(i32 %91, i32 %91, i32 17)
  %94 = xor i32 %92, %93
  %95 = add i32 %94, %92
  %96 = tail call i32 @llvm.fshl.i32(i32 %94, i32 %94, i32 29)
  %97 = xor i32 %95, %96
  %98 = add i32 %97, %95
  %99 = tail call i32 @llvm.fshl.i32(i32 %97, i32 %97, i32 16)
  %100 = xor i32 %98, %99
  %101 = add i32 %100, %98
  %102 = add i32 %101, %2
  %103 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %100, i32 24)
  %104 = xor i32 %101, %103
  %105 = add i32 %59, 4
  %106 = add i32 %105, %104
  %107 = add i32 %102, %106
  %108 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %106, i32 13)
  %109 = xor i32 %107, %108
  %110 = add i32 %109, %107
  %111 = tail call i32 @llvm.fshl.i32(i32 %109, i32 %109, i32 15)
  %112 = xor i32 %110, %111
  %113 = add i32 %112, %110
  %114 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %112, i32 26)
  %115 = xor i32 %113, %114
  %116 = add i32 %115, %113
  %117 = add i32 %116, %59
  %118 = zext i32 %117 to i64
  %119 = shl nuw i64 %118, 32
  %120 = tail call i32 @llvm.fshl.i32(i32 %115, i32 %115, i32 6)
  %121 = xor i32 %116, %120
  %122 = add i32 %1, 5
  %123 = add i32 %122, %121
  %124 = zext i32 %123 to i64
  %125 = or disjoint i64 %119, %124
  %126 = lshr i64 %125, 12
  %127 = or disjoint i64 %126, 4607182418800017408
  %128 = bitcast i64 %127 to double
  %add.3709.1 = fadd double %128, -1.000000e+00
  %129 = fcmp ole double %add.3709.1, 0.000000e+00
  %maximum.38.1 = select i1 %129, double 0.000000e+00, double %add.3709.1
  %add.3710.3 = fadd double %z.2.i, 1.000000e+00
  %divide.571.3 = fdiv double 1.000000e+00, %add.3710.3
  %compare.611.3 = fcmp olt double %maximum.38.1, %divide.571.3
  %130 = zext i1 %compare.611.3 to i32
  store i32 %130, ptr addrspace(1) %arg3130, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_add(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !299
  %add.3666.1 = fadd double %3, %5
  store double %add.3666.1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg2) local_unnamed_addr #9 {
entry:
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %0 = icmp ult i32 %thread.id.x, 2
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi i8 [ %13, %x_in_tile-true ], [ 1, %entry ]
  %1 = zext nneg i8 %partial_reduction_result.0 to i32
  %2 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %1, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %3 = trunc i32 %2 to i8
  %4 = and i8 %partial_reduction_result.0, %3
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %.not10.not = icmp eq i32 %thread.id.x, 0
  %param_1.299 = load i32, ptr addrspace(1) %arg116, align 128
  %5 = icmp slt i32 %param_1.299, 0
  %6 = add i32 %param_1.299, 10
  %7 = select i1 %5, i32 %6, i32 %param_1.299
  %8 = select i1 %.not10.not, i32 %7, i32 0
  %9 = icmp sgt i32 %8, -1
  %10 = zext nneg i32 %thread.id.x to i64
  %param_0.230 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg014, i64 0, i64 %10
  %param_0.2306 = load i32, ptr addrspace(1) %param_0.230, align 4, !invariant.load !299
  %11 = icmp sge i32 %param_0.2306, %8
  %12 = and i1 %9, %11
  %13 = zext i1 %12 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg218, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture align 128 dereferenceable(1920) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #2 {
entry:
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.148 = load i32, ptr addrspace(1) %arg319, align 128, !invariant.load !299
  %1 = icmp slt i32 %param_3.148, 0
  %2 = add i32 %param_3.148, 10
  %3 = select i1 %1, i32 %2, i32 %param_3.148
  %4 = tail call i32 @llvm.smax.i32(i32 %3, i32 0)
  %5 = tail call i32 @llvm.umin.i32(i32 %4, i32 9)
  %6 = zext nneg i32 %5 to i64
  %param_2.225 = load i8, ptr addrspace(1) %arg217, align 128, !invariant.load !299
  %7 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.2974 = load double, ptr addrspace(1) %7, align 8, !invariant.load !299
  %param_0.225 = getelementptr inbounds [10 x [24 x double]], ptr addrspace(1) %arg013, i64 0, i64 %6, i64 %thread_id_x
  %param_0.22511 = load double, ptr addrspace(1) %param_0.225, align 8
  %8 = trunc i8 %param_2.225 to i1
  %9 = select i1 %8, double %param_1.2974, double %param_0.22511
  store double %9, ptr addrspace(1) %param_0.225, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_and_fusion(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #2 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %1 = load i32, ptr addrspace(1) %arg25, align 128, !invariant.load !299
  %2 = icmp sge i32 %0, %1
  %3 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %4 = trunc i8 %3 to i1
  %5 = xor i1 %4, true
  %6 = and i1 %2, %5
  %7 = zext i1 %6 to i8
  store i8 %7, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg7) local_unnamed_addr #2 {
entry:
  %arg717 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg615 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg03, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !299
  %4 = load i32, ptr addrspace(1) %arg27, align 128, !invariant.load !299
  %5 = icmp slt i32 %4, 0
  %6 = add i32 %4, 10
  %7 = select i1 %5, i32 %6, i32 %4
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 9)
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds [10 x [24 x double]], ptr addrspace(1) %arg15, i64 0, i64 %10, i64 %1
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !299
  %multiply.2786.3 = fmul double %3, %12
  %13 = getelementptr double, ptr addrspace(1) %arg411, i64 %1
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !299
  %15 = getelementptr inbounds [10 x [24 x double]], ptr addrspace(1) %arg513, i64 0, i64 %10, i64 %1
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !299
  %subtract.225.7 = fsub double %14, %16
  %add.3718.7 = fadd double %12, %subtract.225.7
  %17 = getelementptr double, ptr addrspace(1) %arg39, i64 %1
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !299
  %add.3719.7 = fadd double %12, %18
  %multiply.2787.7 = fmul double %add.3719.7, 5.000000e-01
  %subtract.226.5 = fsub double %add.3718.7, %multiply.2787.7
  %multiply.2788.1 = fmul double %multiply.2786.3, %subtract.226.5
  %multiply.2789.1.clone.1 = fmul double %3, %18
  %multiply.2790.1.clone.1 = fmul double %multiply.2789.1.clone.1, %subtract.226.5
  %19 = getelementptr double, ptr addrspace(1) %arg615, i64 %1
  store double %multiply.2788.1, ptr addrspace(1) %19, align 8
  %20 = getelementptr double, ptr addrspace(1) %arg717, i64 %1
  store double %multiply.2790.1.clone.1, ptr addrspace(1) %20, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_7(ptr noalias nocapture align 128 dereferenceable(4) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg01, align 128
  %1 = add i32 %0, -1
  store i32 %1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load <2 x double>, ptr addrspace(1) %arg06, align 128, !invariant.load !299
  %1 = extractelement <2 x double> %0, i32 0
  %2 = extractelement <2 x double> %0, i32 1
  %add.3619.i = fadd double %1, 0.000000e+00
  %add.3619.i.1 = fadd double %add.3619.i, %2
  %3 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 16
  %4 = load <2 x double>, ptr addrspace(1) %3, align 16, !invariant.load !299
  %5 = extractelement <2 x double> %4, i32 0
  %6 = extractelement <2 x double> %4, i32 1
  %add.3619.i.2 = fadd double %add.3619.i.1, %5
  %add.3619.i.3 = fadd double %add.3619.i.2, %6
  %7 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 32
  %8 = load <2 x double>, ptr addrspace(1) %7, align 32, !invariant.load !299
  %9 = extractelement <2 x double> %8, i32 0
  %10 = extractelement <2 x double> %8, i32 1
  %add.3619.i.4 = fadd double %add.3619.i.3, %9
  %add.3619.i.5 = fadd double %add.3619.i.4, %10
  %11 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 48
  %12 = load <2 x double>, ptr addrspace(1) %11, align 16, !invariant.load !299
  %13 = extractelement <2 x double> %12, i32 0
  %14 = extractelement <2 x double> %12, i32 1
  %add.3619.i.6 = fadd double %add.3619.i.5, %13
  %add.3619.i.7 = fadd double %add.3619.i.6, %14
  %15 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 64
  %16 = load <2 x double>, ptr addrspace(1) %15, align 64, !invariant.load !299
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  %add.3619.i.8 = fadd double %add.3619.i.7, %17
  %add.3619.i.9 = fadd double %add.3619.i.8, %18
  %19 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 80
  %20 = load <2 x double>, ptr addrspace(1) %19, align 16, !invariant.load !299
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  %add.3619.i.10 = fadd double %add.3619.i.9, %21
  %add.3619.i.11 = fadd double %add.3619.i.10, %22
  %23 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 96
  %24 = load <2 x double>, ptr addrspace(1) %23, align 32, !invariant.load !299
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %add.3619.i.12 = fadd double %add.3619.i.11, %25
  %add.3619.i.13 = fadd double %add.3619.i.12, %26
  %27 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 112
  %28 = load <2 x double>, ptr addrspace(1) %27, align 16, !invariant.load !299
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  %add.3619.i.14 = fadd double %add.3619.i.13, %29
  %add.3619.i.15 = fadd double %add.3619.i.14, %30
  %31 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 128
  %32 = load <2 x double>, ptr addrspace(1) %31, align 128, !invariant.load !299
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %add.3619.i.16 = fadd double %add.3619.i.15, %33
  %add.3619.i.17 = fadd double %add.3619.i.16, %34
  %35 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 144
  %36 = load <2 x double>, ptr addrspace(1) %35, align 16, !invariant.load !299
  %37 = extractelement <2 x double> %36, i32 0
  %38 = extractelement <2 x double> %36, i32 1
  %add.3619.i.18 = fadd double %add.3619.i.17, %37
  %add.3619.i.19 = fadd double %add.3619.i.18, %38
  %39 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 160
  %40 = load <2 x double>, ptr addrspace(1) %39, align 32, !invariant.load !299
  %41 = extractelement <2 x double> %40, i32 0
  %42 = extractelement <2 x double> %40, i32 1
  %add.3619.i.20 = fadd double %add.3619.i.19, %41
  %add.3619.i.21 = fadd double %add.3619.i.20, %42
  %43 = getelementptr inbounds i8, ptr addrspace(1) %arg06, i64 176
  %44 = load <2 x double>, ptr addrspace(1) %43, align 16, !invariant.load !299
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  %add.3619.i.22 = fadd double %add.3619.i.21, %45
  %add.3619.i.23 = fadd double %add.3619.i.22, %46
  %compare.619.1 = fcmp ole double %add.3619.i.23, 0.000000e+00
  %47 = zext i1 %compare.619.1 to i8
  store i8 %47, ptr addrspace(1) %arg18, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_or_fusion(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load <2 x double>, ptr addrspace(1) %arg18, align 128, !invariant.load !299
  %1 = extractelement <2 x double> %0, i32 0
  %2 = extractelement <2 x double> %0, i32 1
  %add.3619.i = fadd double %1, 0.000000e+00
  %add.3619.i.1 = fadd double %add.3619.i, %2
  %3 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 16
  %4 = load <2 x double>, ptr addrspace(1) %3, align 16, !invariant.load !299
  %5 = extractelement <2 x double> %4, i32 0
  %6 = extractelement <2 x double> %4, i32 1
  %add.3619.i.2 = fadd double %add.3619.i.1, %5
  %add.3619.i.3 = fadd double %add.3619.i.2, %6
  %7 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 32
  %8 = load <2 x double>, ptr addrspace(1) %7, align 32, !invariant.load !299
  %9 = extractelement <2 x double> %8, i32 0
  %10 = extractelement <2 x double> %8, i32 1
  %add.3619.i.4 = fadd double %add.3619.i.3, %9
  %add.3619.i.5 = fadd double %add.3619.i.4, %10
  %11 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 48
  %12 = load <2 x double>, ptr addrspace(1) %11, align 16, !invariant.load !299
  %13 = extractelement <2 x double> %12, i32 0
  %14 = extractelement <2 x double> %12, i32 1
  %add.3619.i.6 = fadd double %add.3619.i.5, %13
  %add.3619.i.7 = fadd double %add.3619.i.6, %14
  %15 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 64
  %16 = load <2 x double>, ptr addrspace(1) %15, align 64, !invariant.load !299
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  %add.3619.i.8 = fadd double %add.3619.i.7, %17
  %add.3619.i.9 = fadd double %add.3619.i.8, %18
  %19 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 80
  %20 = load <2 x double>, ptr addrspace(1) %19, align 16, !invariant.load !299
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  %add.3619.i.10 = fadd double %add.3619.i.9, %21
  %add.3619.i.11 = fadd double %add.3619.i.10, %22
  %23 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 96
  %24 = load <2 x double>, ptr addrspace(1) %23, align 32, !invariant.load !299
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %add.3619.i.12 = fadd double %add.3619.i.11, %25
  %add.3619.i.13 = fadd double %add.3619.i.12, %26
  %27 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 112
  %28 = load <2 x double>, ptr addrspace(1) %27, align 16, !invariant.load !299
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  %add.3619.i.14 = fadd double %add.3619.i.13, %29
  %add.3619.i.15 = fadd double %add.3619.i.14, %30
  %31 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 128
  %32 = load <2 x double>, ptr addrspace(1) %31, align 128, !invariant.load !299
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %add.3619.i.16 = fadd double %add.3619.i.15, %33
  %add.3619.i.17 = fadd double %add.3619.i.16, %34
  %35 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 144
  %36 = load <2 x double>, ptr addrspace(1) %35, align 16, !invariant.load !299
  %37 = extractelement <2 x double> %36, i32 0
  %38 = extractelement <2 x double> %36, i32 1
  %add.3619.i.18 = fadd double %add.3619.i.17, %37
  %add.3619.i.19 = fadd double %add.3619.i.18, %38
  %39 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 160
  %40 = load <2 x double>, ptr addrspace(1) %39, align 32, !invariant.load !299
  %41 = extractelement <2 x double> %40, i32 0
  %42 = extractelement <2 x double> %40, i32 1
  %add.3619.i.20 = fadd double %add.3619.i.19, %41
  %add.3619.i.21 = fadd double %add.3619.i.20, %42
  %43 = getelementptr inbounds i8, ptr addrspace(1) %arg18, i64 176
  %44 = load <2 x double>, ptr addrspace(1) %43, align 16, !invariant.load !299
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  %add.3619.i.22 = fadd double %add.3619.i.21, %45
  %add.3619.i.23 = fadd double %add.3619.i.22, %46
  %compare.618.3 = fcmp ole double %add.3619.i.23, 0.000000e+00
  %47 = zext i1 %compare.618.3 to i8
  %48 = load i8, ptr addrspace(1) %arg06, align 128, !invariant.load !299
  %49 = or i8 %48, %47
  store i8 %49, ptr addrspace(1) %arg210, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %1 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %2 = or i8 %1, %0
  %3 = zext i8 %2 to i32
  store i32 %3, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #2 {
entry:
  %arg3129 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2127 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1125 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0123 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load <2 x i32>, ptr addrspace(1) %arg2127, align 128, !invariant.load !299
  %1 = extractelement <2 x i32> %0, i32 0
  %2 = extractelement <2 x i32> %0, i32 1
  %3 = load double, ptr addrspace(1) %arg0123, align 128, !invariant.load !299
  %4 = load double, ptr addrspace(1) %arg1125, align 128, !invariant.load !299
  %subtract.218.3 = fsub double %3, %4
  %5 = tail call double @llvm.fma.f64(double %subtract.218.3, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #13
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #13
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %subtract.218.3)
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
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #13
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #13
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #13
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.218.3) #13
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #13
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %subtract.218.3, 0.000000e+00
  %31 = fadd double %subtract.218.3, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #13
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #13
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = add i32 %2, 1
  %44 = add i32 %43, %1
  %45 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 13)
  %46 = xor i32 %44, %45
  %47 = add i32 %46, %44
  %48 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 15)
  %49 = xor i32 %47, %48
  %50 = add i32 %49, %47
  %51 = tail call i32 @llvm.fshl.i32(i32 %49, i32 %49, i32 26)
  %52 = xor i32 %50, %51
  %53 = add i32 %52, %50
  %54 = add i32 %53, %2
  %55 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 6)
  %56 = xor i32 %53, %55
  %57 = xor i32 %1, %2
  %58 = xor i32 %57, 466688986
  %59 = add i32 %58, 1
  %60 = add i32 %59, %56
  %61 = add i32 %54, %60
  %62 = tail call i32 @llvm.fshl.i32(i32 %60, i32 %60, i32 17)
  %63 = xor i32 %61, %62
  %64 = add i32 %63, %61
  %65 = tail call i32 @llvm.fshl.i32(i32 %63, i32 %63, i32 29)
  %66 = xor i32 %64, %65
  %67 = add i32 %66, %64
  %68 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 16)
  %69 = xor i32 %67, %68
  %70 = add i32 %69, %67
  %71 = add i32 %70, %58
  %72 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 24)
  %73 = xor i32 %70, %72
  %74 = add i32 %1, 2
  %75 = add i32 %74, %73
  %76 = add i32 %71, %75
  %77 = tail call i32 @llvm.fshl.i32(i32 %75, i32 %75, i32 13)
  %78 = xor i32 %76, %77
  %79 = add i32 %78, %76
  %80 = tail call i32 @llvm.fshl.i32(i32 %78, i32 %78, i32 15)
  %81 = xor i32 %79, %80
  %82 = add i32 %81, %79
  %83 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 26)
  %84 = xor i32 %82, %83
  %85 = add i32 %84, %82
  %86 = add i32 %85, %1
  %87 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 6)
  %88 = xor i32 %85, %87
  %89 = add i32 %2, 3
  %90 = add i32 %89, %88
  %91 = add i32 %86, %90
  %92 = tail call i32 @llvm.fshl.i32(i32 %90, i32 %90, i32 17)
  %93 = xor i32 %91, %92
  %94 = add i32 %93, %91
  %95 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %93, i32 29)
  %96 = xor i32 %94, %95
  %97 = add i32 %96, %94
  %98 = tail call i32 @llvm.fshl.i32(i32 %96, i32 %96, i32 16)
  %99 = xor i32 %97, %98
  %100 = add i32 %99, %97
  %101 = add i32 %100, %2
  %102 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %99, i32 24)
  %103 = xor i32 %100, %102
  %104 = add i32 %58, 4
  %105 = add i32 %104, %103
  %106 = add i32 %101, %105
  %107 = tail call i32 @llvm.fshl.i32(i32 %105, i32 %105, i32 13)
  %108 = xor i32 %106, %107
  %109 = add i32 %108, %106
  %110 = tail call i32 @llvm.fshl.i32(i32 %108, i32 %108, i32 15)
  %111 = xor i32 %109, %110
  %112 = add i32 %111, %109
  %113 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %111, i32 26)
  %114 = xor i32 %112, %113
  %115 = add i32 %114, %112
  %116 = add i32 %115, %58
  %117 = zext i32 %116 to i64
  %118 = shl nuw i64 %117, 32
  %119 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %114, i32 6)
  %120 = xor i32 %115, %119
  %121 = add i32 %1, 5
  %122 = add i32 %121, %120
  %123 = zext i32 %122 to i64
  %124 = or disjoint i64 %118, %123
  %125 = lshr i64 %124, 12
  %126 = or disjoint i64 %125, 4607182418800017408
  %127 = bitcast i64 %126 to double
  %add.3659.3 = fadd double %127, -1.000000e+00
  %128 = fcmp ole double %add.3659.3, 0.000000e+00
  %maximum.34.3 = select i1 %128, double 0.000000e+00, double %add.3659.3
  %129 = fcmp oge double %z.2.i, 1.000000e+00
  %minimum.7.5 = select i1 %129, double 1.000000e+00, double %z.2.i
  %compare.607.3 = fcmp olt double %maximum.34.3, %minimum.7.5
  %130 = zext i1 %compare.607.3 to i32
  store i32 %130, ptr addrspace(1) %arg3129, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_add_12(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %1 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %2 = add i64 %1, %0
  store i64 %2, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_add_11(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !302
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !299
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !299
  %add.4076.1 = fadd double %3, %5
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  store double %add.4076.1, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_multiply_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg20) local_unnamed_addr #4 {
entry:
  %arg20181 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19179 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18177 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17175 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16173 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15171 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14169 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13167 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12165 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11163 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10161 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9159 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8157 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7155 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6153 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5151 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4149 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3147 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2145 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0141 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg0141, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !299
  %4 = icmp ult i32 %0, 12
  br i1 %4, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %entry
  %5 = trunc i64 %1 to i32
  %6 = icmp ult i32 %5, 4
  br i1 %6, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  %7 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1143, i64 0, i64 %1
  br label %concatenate.45.4.merge

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %8 = trunc i64 %1 to i32
  %9 = icmp ult i32 %8, 8
  br i1 %9, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  %10 = trunc i64 %1 to i32
  %11 = add nsw i32 %10, -4
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2145, i64 0, i64 %12
  br label %concatenate.45.4.merge

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  %14 = trunc i64 %1 to i32
  %15 = add nsw i32 %14, -8
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3147, i64 0, i64 %16
  br label %concatenate.45.4.merge

concatenate.pivot.16.:                            ; preds = %entry
  %18 = trunc i64 %1 to i32
  %19 = icmp ult i32 %18, 16
  br i1 %19, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  %20 = trunc i64 %1 to i32
  %21 = add nsw i32 %20, -12
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4149, i64 0, i64 %22
  br label %concatenate.45.4.merge

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %24 = trunc i64 %1 to i32
  %25 = icmp ult i32 %24, 20
  br i1 %25, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  %26 = trunc i64 %1 to i32
  %27 = add nsw i32 %26, -16
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5151, i64 0, i64 %28
  br label %concatenate.45.4.merge

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  %30 = trunc i64 %1 to i32
  %31 = add nsw i32 %30, -20
  %32 = zext nneg i32 %31 to i64
  %33 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg6153, i64 0, i64 %32
  br label %concatenate.45.4.merge

concatenate.45.4.merge:                           ; preds = %concatenate.pivot.20.5, %concatenate.pivot.16.4, %concatenate.pivot.12.3, %concatenate.pivot.8.2, %concatenate.pivot.4.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %7, %concatenate.pivot.0. ], [ %13, %concatenate.pivot.4.1 ], [ %17, %concatenate.pivot.8.2 ], [ %23, %concatenate.pivot.12.3 ], [ %29, %concatenate.pivot.16.4 ], [ %33, %concatenate.pivot.20.5 ]
  %34 = trunc i64 %1 to i32
  %35 = icmp ult i32 %34, 12
  %36 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !299
  br i1 %35, label %concatenate.pivot.4.13, label %concatenate.pivot.16.18

concatenate.pivot.4.13:                           ; preds = %concatenate.45.4.merge
  %37 = trunc i64 %1 to i32
  %38 = icmp ult i32 %37, 4
  br i1 %38, label %concatenate.pivot.0.14, label %concatenate.pivot.8.15

concatenate.pivot.0.14:                           ; preds = %concatenate.pivot.4.13
  %39 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg13167, i64 0, i64 %1
  br label %concatenate.pivot.12.29

concatenate.pivot.8.15:                           ; preds = %concatenate.pivot.4.13
  %40 = trunc i64 %1 to i32
  %41 = icmp ult i32 %40, 8
  br i1 %41, label %concatenate.pivot.4.16, label %concatenate.pivot.8.17

concatenate.pivot.4.16:                           ; preds = %concatenate.pivot.8.15
  %42 = trunc i64 %1 to i32
  %43 = add nsw i32 %42, -4
  %44 = zext nneg i32 %43 to i64
  %45 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg14169, i64 0, i64 %44
  br label %concatenate.pivot.12.29

concatenate.pivot.8.17:                           ; preds = %concatenate.pivot.8.15
  %46 = trunc i64 %1 to i32
  %47 = add nsw i32 %46, -8
  %48 = zext nneg i32 %47 to i64
  %49 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg15171, i64 0, i64 %48
  br label %concatenate.pivot.12.29

concatenate.pivot.16.18:                          ; preds = %concatenate.45.4.merge
  %50 = trunc i64 %1 to i32
  %51 = icmp ult i32 %50, 16
  br i1 %51, label %concatenate.pivot.12.19, label %concatenate.pivot.20.20

concatenate.pivot.12.19:                          ; preds = %concatenate.pivot.16.18
  %52 = trunc i64 %1 to i32
  %53 = add nsw i32 %52, -12
  %54 = zext nneg i32 %53 to i64
  %55 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg16173, i64 0, i64 %54
  br label %concatenate.pivot.12.29

concatenate.pivot.20.20:                          ; preds = %concatenate.pivot.16.18
  %56 = trunc i64 %1 to i32
  %57 = icmp ult i32 %56, 20
  br i1 %57, label %concatenate.pivot.16.21, label %concatenate.pivot.20.22

concatenate.pivot.16.21:                          ; preds = %concatenate.pivot.20.20
  %58 = trunc i64 %1 to i32
  %59 = add nsw i32 %58, -16
  %60 = zext nneg i32 %59 to i64
  %61 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg17175, i64 0, i64 %60
  br label %concatenate.pivot.12.29

concatenate.pivot.20.22:                          ; preds = %concatenate.pivot.20.20
  %62 = trunc i64 %1 to i32
  %63 = add nsw i32 %62, -20
  %64 = zext nneg i32 %63 to i64
  %65 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg18177, i64 0, i64 %64
  br label %concatenate.pivot.12.29

concatenate.pivot.12.29:                          ; preds = %concatenate.pivot.0.14, %concatenate.pivot.4.16, %concatenate.pivot.8.17, %concatenate.pivot.12.19, %concatenate.pivot.16.21, %concatenate.pivot.20.22
  %.in134 = phi ptr addrspace(1) [ %39, %concatenate.pivot.0.14 ], [ %45, %concatenate.pivot.4.16 ], [ %49, %concatenate.pivot.8.17 ], [ %55, %concatenate.pivot.12.19 ], [ %61, %concatenate.pivot.16.21 ], [ %65, %concatenate.pivot.20.22 ]
  %66 = trunc i64 %1 to i32
  %67 = icmp ult i32 %66, 12
  %68 = load double, ptr addrspace(1) %.in134, align 8, !invariant.load !299
  br i1 %67, label %concatenate.pivot.4.30, label %concatenate.pivot.16.35

concatenate.pivot.4.30:                           ; preds = %concatenate.pivot.12.29
  %69 = trunc i64 %1 to i32
  %70 = icmp ult i32 %69, 4
  br i1 %70, label %concatenate.pivot.0.31, label %concatenate.pivot.8.32

concatenate.pivot.0.31:                           ; preds = %concatenate.pivot.4.30
  %71 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7155, i64 0, i64 %1
  br label %concatenate.pivot.12.47

concatenate.pivot.8.32:                           ; preds = %concatenate.pivot.4.30
  %72 = trunc i64 %1 to i32
  %73 = icmp ult i32 %72, 8
  br i1 %73, label %concatenate.pivot.4.33, label %concatenate.pivot.8.34

concatenate.pivot.4.33:                           ; preds = %concatenate.pivot.8.32
  %74 = trunc i64 %1 to i32
  %75 = add nsw i32 %74, -4
  %76 = zext nneg i32 %75 to i64
  %77 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg8157, i64 0, i64 %76
  br label %concatenate.pivot.12.47

concatenate.pivot.8.34:                           ; preds = %concatenate.pivot.8.32
  %78 = trunc i64 %1 to i32
  %79 = add nsw i32 %78, -8
  %80 = zext nneg i32 %79 to i64
  %81 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg9159, i64 0, i64 %80
  br label %concatenate.pivot.12.47

concatenate.pivot.16.35:                          ; preds = %concatenate.pivot.12.29
  %82 = trunc i64 %1 to i32
  %83 = icmp ult i32 %82, 16
  br i1 %83, label %concatenate.pivot.12.36, label %concatenate.pivot.20.37

concatenate.pivot.12.36:                          ; preds = %concatenate.pivot.16.35
  %84 = trunc i64 %1 to i32
  %85 = add nsw i32 %84, -12
  %86 = zext nneg i32 %85 to i64
  %87 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg10161, i64 0, i64 %86
  br label %concatenate.pivot.12.47

concatenate.pivot.20.37:                          ; preds = %concatenate.pivot.16.35
  %88 = trunc i64 %1 to i32
  %89 = icmp ult i32 %88, 20
  br i1 %89, label %concatenate.pivot.16.38, label %concatenate.pivot.20.39

concatenate.pivot.16.38:                          ; preds = %concatenate.pivot.20.37
  %90 = trunc i64 %1 to i32
  %91 = add nsw i32 %90, -16
  %92 = zext nneg i32 %91 to i64
  %93 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg11163, i64 0, i64 %92
  br label %concatenate.pivot.12.47

concatenate.pivot.20.39:                          ; preds = %concatenate.pivot.20.37
  %94 = trunc i64 %1 to i32
  %95 = add nsw i32 %94, -20
  %96 = zext nneg i32 %95 to i64
  %97 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg12165, i64 0, i64 %96
  br label %concatenate.pivot.12.47

concatenate.pivot.12.47:                          ; preds = %concatenate.pivot.0.31, %concatenate.pivot.4.33, %concatenate.pivot.8.34, %concatenate.pivot.12.36, %concatenate.pivot.16.38, %concatenate.pivot.20.39
  %.in135 = phi ptr addrspace(1) [ %71, %concatenate.pivot.0.31 ], [ %77, %concatenate.pivot.4.33 ], [ %81, %concatenate.pivot.8.34 ], [ %87, %concatenate.pivot.12.36 ], [ %93, %concatenate.pivot.16.38 ], [ %97, %concatenate.pivot.20.39 ]
  %98 = trunc i64 %1 to i32
  %99 = icmp ult i32 %98, 12
  %100 = load double, ptr addrspace(1) %.in135, align 8, !invariant.load !299
  br i1 %99, label %concatenate.pivot.4.48, label %concatenate.pivot.16.53

concatenate.pivot.4.48:                           ; preds = %concatenate.pivot.12.47
  %101 = trunc i64 %1 to i32
  %102 = icmp ult i32 %101, 4
  br i1 %102, label %concatenate.pivot.0.49, label %concatenate.pivot.8.50

concatenate.pivot.0.49:                           ; preds = %concatenate.pivot.4.48
  %103 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1143, i64 0, i64 %1
  br label %concatenate.45.4.merge40

concatenate.pivot.8.50:                           ; preds = %concatenate.pivot.4.48
  %104 = trunc i64 %1 to i32
  %105 = icmp ult i32 %104, 8
  br i1 %105, label %concatenate.pivot.4.51, label %concatenate.pivot.8.52

concatenate.pivot.4.51:                           ; preds = %concatenate.pivot.8.50
  %106 = trunc i64 %1 to i32
  %107 = add nsw i32 %106, -4
  %108 = zext nneg i32 %107 to i64
  %109 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2145, i64 0, i64 %108
  br label %concatenate.45.4.merge40

concatenate.pivot.8.52:                           ; preds = %concatenate.pivot.8.50
  %110 = trunc i64 %1 to i32
  %111 = add nsw i32 %110, -8
  %112 = zext nneg i32 %111 to i64
  %113 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3147, i64 0, i64 %112
  br label %concatenate.45.4.merge40

concatenate.pivot.16.53:                          ; preds = %concatenate.pivot.12.47
  %114 = trunc i64 %1 to i32
  %115 = icmp ult i32 %114, 16
  br i1 %115, label %concatenate.pivot.12.54, label %concatenate.pivot.20.55

concatenate.pivot.12.54:                          ; preds = %concatenate.pivot.16.53
  %116 = trunc i64 %1 to i32
  %117 = add nsw i32 %116, -12
  %118 = zext nneg i32 %117 to i64
  %119 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4149, i64 0, i64 %118
  br label %concatenate.45.4.merge40

concatenate.pivot.20.55:                          ; preds = %concatenate.pivot.16.53
  %120 = trunc i64 %1 to i32
  %121 = icmp ult i32 %120, 20
  br i1 %121, label %concatenate.pivot.16.56, label %concatenate.pivot.20.57

concatenate.pivot.16.56:                          ; preds = %concatenate.pivot.20.55
  %122 = trunc i64 %1 to i32
  %123 = add nsw i32 %122, -16
  %124 = zext nneg i32 %123 to i64
  %125 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5151, i64 0, i64 %124
  br label %concatenate.45.4.merge40

concatenate.pivot.20.57:                          ; preds = %concatenate.pivot.20.55
  %126 = trunc i64 %1 to i32
  %127 = add nsw i32 %126, -20
  %128 = zext nneg i32 %127 to i64
  %129 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg6153, i64 0, i64 %128
  br label %concatenate.45.4.merge40

concatenate.45.4.merge40:                         ; preds = %concatenate.pivot.20.57, %concatenate.pivot.16.56, %concatenate.pivot.12.54, %concatenate.pivot.8.52, %concatenate.pivot.4.51, %concatenate.pivot.0.49
  %.in136 = phi ptr addrspace(1) [ %103, %concatenate.pivot.0.49 ], [ %109, %concatenate.pivot.4.51 ], [ %113, %concatenate.pivot.8.52 ], [ %119, %concatenate.pivot.12.54 ], [ %125, %concatenate.pivot.16.56 ], [ %129, %concatenate.pivot.20.57 ]
  %130 = trunc i64 %1 to i32
  %131 = icmp ult i32 %130, 12
  %132 = load double, ptr addrspace(1) %.in136, align 8, !invariant.load !299
  br i1 %131, label %concatenate.pivot.4.66, label %concatenate.pivot.16.71

concatenate.pivot.4.66:                           ; preds = %concatenate.45.4.merge40
  %133 = trunc i64 %1 to i32
  %134 = icmp ult i32 %133, 4
  br i1 %134, label %concatenate.pivot.0.67, label %concatenate.pivot.8.68

concatenate.pivot.0.67:                           ; preds = %concatenate.pivot.4.66
  %135 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7155, i64 0, i64 %1
  br label %concatenate.47.12.merge58

concatenate.pivot.8.68:                           ; preds = %concatenate.pivot.4.66
  %136 = trunc i64 %1 to i32
  %137 = icmp ult i32 %136, 8
  br i1 %137, label %concatenate.pivot.4.69, label %concatenate.pivot.8.70

concatenate.pivot.4.69:                           ; preds = %concatenate.pivot.8.68
  %138 = trunc i64 %1 to i32
  %139 = add nsw i32 %138, -4
  %140 = zext nneg i32 %139 to i64
  %141 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg8157, i64 0, i64 %140
  br label %concatenate.47.12.merge58

concatenate.pivot.8.70:                           ; preds = %concatenate.pivot.8.68
  %142 = trunc i64 %1 to i32
  %143 = add nsw i32 %142, -8
  %144 = zext nneg i32 %143 to i64
  %145 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg9159, i64 0, i64 %144
  br label %concatenate.47.12.merge58

concatenate.pivot.16.71:                          ; preds = %concatenate.45.4.merge40
  %146 = trunc i64 %1 to i32
  %147 = icmp ult i32 %146, 16
  br i1 %147, label %concatenate.pivot.12.72, label %concatenate.pivot.20.73

concatenate.pivot.12.72:                          ; preds = %concatenate.pivot.16.71
  %148 = trunc i64 %1 to i32
  %149 = add nsw i32 %148, -12
  %150 = zext nneg i32 %149 to i64
  %151 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg10161, i64 0, i64 %150
  br label %concatenate.47.12.merge58

concatenate.pivot.20.73:                          ; preds = %concatenate.pivot.16.71
  %152 = trunc i64 %1 to i32
  %153 = icmp ult i32 %152, 20
  br i1 %153, label %concatenate.pivot.16.74, label %concatenate.pivot.20.75

concatenate.pivot.16.74:                          ; preds = %concatenate.pivot.20.73
  %154 = trunc i64 %1 to i32
  %155 = add nsw i32 %154, -16
  %156 = zext nneg i32 %155 to i64
  %157 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg11163, i64 0, i64 %156
  br label %concatenate.47.12.merge58

concatenate.pivot.20.75:                          ; preds = %concatenate.pivot.20.73
  %158 = trunc i64 %1 to i32
  %159 = add nsw i32 %158, -20
  %160 = zext nneg i32 %159 to i64
  %161 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg12165, i64 0, i64 %160
  br label %concatenate.47.12.merge58

concatenate.47.12.merge58:                        ; preds = %concatenate.pivot.20.75, %concatenate.pivot.16.74, %concatenate.pivot.12.72, %concatenate.pivot.8.70, %concatenate.pivot.4.69, %concatenate.pivot.0.67
  %.in137 = phi ptr addrspace(1) [ %135, %concatenate.pivot.0.67 ], [ %141, %concatenate.pivot.4.69 ], [ %145, %concatenate.pivot.8.70 ], [ %151, %concatenate.pivot.12.72 ], [ %157, %concatenate.pivot.16.74 ], [ %161, %concatenate.pivot.20.75 ]
  %162 = trunc i64 %1 to i32
  %163 = icmp ult i32 %162, 12
  %164 = load double, ptr addrspace(1) %.in137, align 8, !invariant.load !299
  br i1 %163, label %concatenate.pivot.4.84, label %concatenate.pivot.16.89

concatenate.pivot.4.84:                           ; preds = %concatenate.47.12.merge58
  %165 = trunc i64 %1 to i32
  %166 = icmp ult i32 %165, 4
  br i1 %166, label %concatenate.pivot.0.85, label %concatenate.pivot.8.86

concatenate.pivot.0.85:                           ; preds = %concatenate.pivot.4.84
  %167 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg13167, i64 0, i64 %1
  br label %concatenate.pivot.12.101

concatenate.pivot.8.86:                           ; preds = %concatenate.pivot.4.84
  %168 = trunc i64 %1 to i32
  %169 = icmp ult i32 %168, 8
  br i1 %169, label %concatenate.pivot.4.87, label %concatenate.pivot.8.88

concatenate.pivot.4.87:                           ; preds = %concatenate.pivot.8.86
  %170 = trunc i64 %1 to i32
  %171 = add nsw i32 %170, -4
  %172 = zext nneg i32 %171 to i64
  %173 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg14169, i64 0, i64 %172
  br label %concatenate.pivot.12.101

concatenate.pivot.8.88:                           ; preds = %concatenate.pivot.8.86
  %174 = trunc i64 %1 to i32
  %175 = add nsw i32 %174, -8
  %176 = zext nneg i32 %175 to i64
  %177 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg15171, i64 0, i64 %176
  br label %concatenate.pivot.12.101

concatenate.pivot.16.89:                          ; preds = %concatenate.47.12.merge58
  %178 = trunc i64 %1 to i32
  %179 = icmp ult i32 %178, 16
  br i1 %179, label %concatenate.pivot.12.90, label %concatenate.pivot.20.91

concatenate.pivot.12.90:                          ; preds = %concatenate.pivot.16.89
  %180 = trunc i64 %1 to i32
  %181 = add nsw i32 %180, -12
  %182 = zext nneg i32 %181 to i64
  %183 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg16173, i64 0, i64 %182
  br label %concatenate.pivot.12.101

concatenate.pivot.20.91:                          ; preds = %concatenate.pivot.16.89
  %184 = trunc i64 %1 to i32
  %185 = icmp ult i32 %184, 20
  br i1 %185, label %concatenate.pivot.16.92, label %concatenate.pivot.20.93

concatenate.pivot.16.92:                          ; preds = %concatenate.pivot.20.91
  %186 = trunc i64 %1 to i32
  %187 = add nsw i32 %186, -16
  %188 = zext nneg i32 %187 to i64
  %189 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg17175, i64 0, i64 %188
  br label %concatenate.pivot.12.101

concatenate.pivot.20.93:                          ; preds = %concatenate.pivot.20.91
  %190 = trunc i64 %1 to i32
  %191 = add nsw i32 %190, -20
  %192 = zext nneg i32 %191 to i64
  %193 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg18177, i64 0, i64 %192
  br label %concatenate.pivot.12.101

concatenate.pivot.12.101:                         ; preds = %concatenate.pivot.0.85, %concatenate.pivot.4.87, %concatenate.pivot.8.88, %concatenate.pivot.12.90, %concatenate.pivot.16.92, %concatenate.pivot.20.93
  %.in138 = phi ptr addrspace(1) [ %167, %concatenate.pivot.0.85 ], [ %173, %concatenate.pivot.4.87 ], [ %177, %concatenate.pivot.8.88 ], [ %183, %concatenate.pivot.12.90 ], [ %189, %concatenate.pivot.16.92 ], [ %193, %concatenate.pivot.20.93 ]
  %194 = trunc i64 %1 to i32
  %195 = icmp ult i32 %194, 12
  %196 = load double, ptr addrspace(1) %.in138, align 8, !invariant.load !299
  br i1 %195, label %concatenate.pivot.4.102, label %concatenate.pivot.16.107

concatenate.pivot.4.102:                          ; preds = %concatenate.pivot.12.101
  %197 = trunc i64 %1 to i32
  %198 = icmp ult i32 %197, 4
  br i1 %198, label %concatenate.pivot.0.103, label %concatenate.pivot.8.104

concatenate.pivot.0.103:                          ; preds = %concatenate.pivot.4.102
  %199 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7155, i64 0, i64 %1
  br label %concatenate.pivot.12.119

concatenate.pivot.8.104:                          ; preds = %concatenate.pivot.4.102
  %200 = trunc i64 %1 to i32
  %201 = icmp ult i32 %200, 8
  br i1 %201, label %concatenate.pivot.4.105, label %concatenate.pivot.8.106

concatenate.pivot.4.105:                          ; preds = %concatenate.pivot.8.104
  %202 = trunc i64 %1 to i32
  %203 = add nsw i32 %202, -4
  %204 = zext nneg i32 %203 to i64
  %205 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg8157, i64 0, i64 %204
  br label %concatenate.pivot.12.119

concatenate.pivot.8.106:                          ; preds = %concatenate.pivot.8.104
  %206 = trunc i64 %1 to i32
  %207 = add nsw i32 %206, -8
  %208 = zext nneg i32 %207 to i64
  %209 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg9159, i64 0, i64 %208
  br label %concatenate.pivot.12.119

concatenate.pivot.16.107:                         ; preds = %concatenate.pivot.12.101
  %210 = trunc i64 %1 to i32
  %211 = icmp ult i32 %210, 16
  br i1 %211, label %concatenate.pivot.12.108, label %concatenate.pivot.20.109

concatenate.pivot.12.108:                         ; preds = %concatenate.pivot.16.107
  %212 = trunc i64 %1 to i32
  %213 = add nsw i32 %212, -12
  %214 = zext nneg i32 %213 to i64
  %215 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg10161, i64 0, i64 %214
  br label %concatenate.pivot.12.119

concatenate.pivot.20.109:                         ; preds = %concatenate.pivot.16.107
  %216 = trunc i64 %1 to i32
  %217 = icmp ult i32 %216, 20
  br i1 %217, label %concatenate.pivot.16.110, label %concatenate.pivot.20.111

concatenate.pivot.16.110:                         ; preds = %concatenate.pivot.20.109
  %218 = trunc i64 %1 to i32
  %219 = add nsw i32 %218, -16
  %220 = zext nneg i32 %219 to i64
  %221 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg11163, i64 0, i64 %220
  br label %concatenate.pivot.12.119

concatenate.pivot.20.111:                         ; preds = %concatenate.pivot.20.109
  %222 = trunc i64 %1 to i32
  %223 = add nsw i32 %222, -20
  %224 = zext nneg i32 %223 to i64
  %225 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg12165, i64 0, i64 %224
  br label %concatenate.pivot.12.119

concatenate.pivot.12.119:                         ; preds = %concatenate.pivot.0.103, %concatenate.pivot.4.105, %concatenate.pivot.8.106, %concatenate.pivot.12.108, %concatenate.pivot.16.110, %concatenate.pivot.20.111
  %.in139 = phi ptr addrspace(1) [ %199, %concatenate.pivot.0.103 ], [ %205, %concatenate.pivot.4.105 ], [ %209, %concatenate.pivot.8.106 ], [ %215, %concatenate.pivot.12.108 ], [ %221, %concatenate.pivot.16.110 ], [ %225, %concatenate.pivot.20.111 ]
  %226 = trunc i64 %1 to i32
  %227 = icmp ult i32 %226, 12
  %228 = load double, ptr addrspace(1) %.in139, align 8, !invariant.load !299
  br i1 %227, label %concatenate.pivot.4.120, label %concatenate.pivot.16.125

concatenate.pivot.4.120:                          ; preds = %concatenate.pivot.12.119
  %229 = trunc i64 %1 to i32
  %230 = icmp ult i32 %229, 4
  br i1 %230, label %concatenate.pivot.0.121, label %concatenate.pivot.8.122

concatenate.pivot.0.121:                          ; preds = %concatenate.pivot.4.120
  %231 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1143, i64 0, i64 %1
  br label %concatenate.45.4.merge112

concatenate.pivot.8.122:                          ; preds = %concatenate.pivot.4.120
  %232 = trunc i64 %1 to i32
  %233 = icmp ult i32 %232, 8
  br i1 %233, label %concatenate.pivot.4.123, label %concatenate.pivot.8.124

concatenate.pivot.4.123:                          ; preds = %concatenate.pivot.8.122
  %234 = trunc i64 %1 to i32
  %235 = add nsw i32 %234, -4
  %236 = zext nneg i32 %235 to i64
  %237 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2145, i64 0, i64 %236
  br label %concatenate.45.4.merge112

concatenate.pivot.8.124:                          ; preds = %concatenate.pivot.8.122
  %238 = trunc i64 %1 to i32
  %239 = add nsw i32 %238, -8
  %240 = zext nneg i32 %239 to i64
  %241 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3147, i64 0, i64 %240
  br label %concatenate.45.4.merge112

concatenate.pivot.16.125:                         ; preds = %concatenate.pivot.12.119
  %242 = trunc i64 %1 to i32
  %243 = icmp ult i32 %242, 16
  br i1 %243, label %concatenate.pivot.12.126, label %concatenate.pivot.20.127

concatenate.pivot.12.126:                         ; preds = %concatenate.pivot.16.125
  %244 = trunc i64 %1 to i32
  %245 = add nsw i32 %244, -12
  %246 = zext nneg i32 %245 to i64
  %247 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4149, i64 0, i64 %246
  br label %concatenate.45.4.merge112

concatenate.pivot.20.127:                         ; preds = %concatenate.pivot.16.125
  %248 = trunc i64 %1 to i32
  %249 = icmp ult i32 %248, 20
  br i1 %249, label %concatenate.pivot.16.128, label %concatenate.pivot.20.129

concatenate.pivot.16.128:                         ; preds = %concatenate.pivot.20.127
  %250 = trunc i64 %1 to i32
  %251 = add nsw i32 %250, -16
  %252 = zext nneg i32 %251 to i64
  %253 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5151, i64 0, i64 %252
  br label %concatenate.45.4.merge112

concatenate.pivot.20.129:                         ; preds = %concatenate.pivot.20.127
  %254 = trunc i64 %1 to i32
  %255 = add nsw i32 %254, -20
  %256 = zext nneg i32 %255 to i64
  %257 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg6153, i64 0, i64 %256
  br label %concatenate.45.4.merge112

concatenate.45.4.merge112:                        ; preds = %concatenate.pivot.20.129, %concatenate.pivot.16.128, %concatenate.pivot.12.126, %concatenate.pivot.8.124, %concatenate.pivot.4.123, %concatenate.pivot.0.121
  %.in140 = phi ptr addrspace(1) [ %231, %concatenate.pivot.0.121 ], [ %237, %concatenate.pivot.4.123 ], [ %241, %concatenate.pivot.8.124 ], [ %247, %concatenate.pivot.12.126 ], [ %253, %concatenate.pivot.16.128 ], [ %257, %concatenate.pivot.20.129 ]
  %multiply.2982.3.clone.1 = fmul double %3, %164
  %multiply.2979.3 = fmul double %3, %36
  %add.4079.9 = fadd double %100, %132
  %multiply.2980.7 = fmul double %add.4079.9, 5.000000e-01
  %subtract.240.5 = fsub double %68, %multiply.2980.7
  %multiply.2981.1 = fmul double %multiply.2979.3, %subtract.240.5
  %258 = load double, ptr addrspace(1) %.in140, align 8, !invariant.load !299
  %add.4079.9130 = fadd double %228, %258
  %multiply.2980.7132 = fmul double %add.4079.9130, 5.000000e-01
  %subtract.240.5133 = fsub double %196, %multiply.2980.7132
  %multiply.2983.1.clone.1 = fmul double %multiply.2982.3.clone.1, %subtract.240.5133
  %259 = getelementptr double, ptr addrspace(1) %arg19179, i64 %1
  store double %multiply.2981.1, ptr addrspace(1) %259, align 8
  %260 = getelementptr double, ptr addrspace(1) %arg20181, i64 %1
  store double %multiply.2983.1.clone.1, ptr addrspace(1) %260, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_or_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i8, ptr addrspace(1) %arg06, align 128, !invariant.load !299
  %1 = load <2 x double>, ptr addrspace(1) %arg210, align 128, !invariant.load !299
  %2 = extractelement <2 x double> %1, i32 0
  %3 = extractelement <2 x double> %1, i32 1
  %add.3619.i = fadd double %2, 0.000000e+00
  %add.3619.i.1 = fadd double %add.3619.i, %3
  %4 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 16
  %5 = load <2 x double>, ptr addrspace(1) %4, align 16, !invariant.load !299
  %6 = extractelement <2 x double> %5, i32 0
  %7 = extractelement <2 x double> %5, i32 1
  %add.3619.i.2 = fadd double %add.3619.i.1, %6
  %add.3619.i.3 = fadd double %add.3619.i.2, %7
  %8 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 32
  %9 = load <2 x double>, ptr addrspace(1) %8, align 32, !invariant.load !299
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  %add.3619.i.4 = fadd double %add.3619.i.3, %10
  %add.3619.i.5 = fadd double %add.3619.i.4, %11
  %12 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 48
  %13 = load <2 x double>, ptr addrspace(1) %12, align 16, !invariant.load !299
  %14 = extractelement <2 x double> %13, i32 0
  %15 = extractelement <2 x double> %13, i32 1
  %add.3619.i.6 = fadd double %add.3619.i.5, %14
  %add.3619.i.7 = fadd double %add.3619.i.6, %15
  %16 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 64
  %17 = load <2 x double>, ptr addrspace(1) %16, align 64, !invariant.load !299
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %add.3619.i.8 = fadd double %add.3619.i.7, %18
  %add.3619.i.9 = fadd double %add.3619.i.8, %19
  %20 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 80
  %21 = load <2 x double>, ptr addrspace(1) %20, align 16, !invariant.load !299
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  %add.3619.i.10 = fadd double %add.3619.i.9, %22
  %add.3619.i.11 = fadd double %add.3619.i.10, %23
  %24 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 96
  %25 = load <2 x double>, ptr addrspace(1) %24, align 32, !invariant.load !299
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %add.3619.i.12 = fadd double %add.3619.i.11, %26
  %add.3619.i.13 = fadd double %add.3619.i.12, %27
  %28 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 112
  %29 = load <2 x double>, ptr addrspace(1) %28, align 16, !invariant.load !299
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %add.3619.i.14 = fadd double %add.3619.i.13, %30
  %add.3619.i.15 = fadd double %add.3619.i.14, %31
  %32 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 128
  %33 = load <2 x double>, ptr addrspace(1) %32, align 128, !invariant.load !299
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %add.3619.i.16 = fadd double %add.3619.i.15, %34
  %add.3619.i.17 = fadd double %add.3619.i.16, %35
  %36 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 144
  %37 = load <2 x double>, ptr addrspace(1) %36, align 16, !invariant.load !299
  %38 = extractelement <2 x double> %37, i32 0
  %39 = extractelement <2 x double> %37, i32 1
  %add.3619.i.18 = fadd double %add.3619.i.17, %38
  %add.3619.i.19 = fadd double %add.3619.i.18, %39
  %40 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 160
  %41 = load <2 x double>, ptr addrspace(1) %40, align 32, !invariant.load !299
  %42 = extractelement <2 x double> %41, i32 0
  %43 = extractelement <2 x double> %41, i32 1
  %add.3619.i.20 = fadd double %add.3619.i.19, %42
  %add.3619.i.21 = fadd double %add.3619.i.20, %43
  %44 = getelementptr inbounds i8, ptr addrspace(1) %arg210, i64 176
  %45 = load <2 x double>, ptr addrspace(1) %44, align 16, !invariant.load !299
  %46 = extractelement <2 x double> %45, i32 0
  %47 = extractelement <2 x double> %45, i32 1
  %add.3619.i.22 = fadd double %add.3619.i.21, %46
  %add.3619.i.23 = fadd double %add.3619.i.22, %47
  %compare.660.5 = fcmp ole double %add.3619.i.23, 0.000000e+00
  %48 = zext i1 %compare.660.5 to i8
  %49 = load i8, ptr addrspace(1) %arg18, align 128, !invariant.load !299
  %50 = or i8 %0, %48
  %51 = or i8 %50, %49
  store i8 %51, ptr addrspace(1) %arg312, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %1 = tail call double @llvm.fma.f64(double %0, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %2 = tail call i32 @llvm.nvvm.d2i.lo(double %1) #13
  %3 = tail call double @llvm.nvvm.add.rn.d(double %1, double 0xC338000000000000) #13
  %4 = tail call double @llvm.fma.f64(double %3, double 0xBFE62E42FEFA39EF, double %0)
  %5 = tail call double @llvm.fma.f64(double %3, double 0xBC7ABC9E3B39803F, double %4)
  %6 = tail call double @llvm.fma.f64(double %5, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %7 = tail call double @llvm.fma.f64(double %6, double %5, double 0x3EC71DEE62401315)
  %8 = tail call double @llvm.fma.f64(double %7, double %5, double 0x3EFA01997C89EB71)
  %9 = tail call double @llvm.fma.f64(double %8, double %5, double 0x3F2A01A014761F65)
  %10 = tail call double @llvm.fma.f64(double %9, double %5, double 0x3F56C16C1852B7AF)
  %11 = tail call double @llvm.fma.f64(double %10, double %5, double 0x3F81111111122322)
  %12 = tail call double @llvm.fma.f64(double %11, double %5, double 0x3FA55555555502A1)
  %13 = tail call double @llvm.fma.f64(double %12, double %5, double 0x3FC5555555555511)
  %14 = tail call double @llvm.fma.f64(double %13, double %5, double 0x3FE000000000000B)
  %15 = tail call double @llvm.fma.f64(double %14, double %5, double 1.000000e+00)
  %16 = tail call double @llvm.fma.f64(double %15, double %5, double 1.000000e+00)
  %17 = tail call i32 @llvm.nvvm.d2i.lo(double %16) #13
  %18 = tail call i32 @llvm.nvvm.d2i.hi(double %16) #13
  %19 = shl i32 %2, 20
  %20 = add i32 %18, %19
  %21 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %20) #13
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %0) #13
  %23 = bitcast i32 %22 to float
  %24 = tail call float @llvm.nvvm.fabs.f(float %23) #13
  %25 = fcmp olt float %24, 0x4010C46560000000
  br i1 %25, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %26 = fcmp olt double %0, 0.000000e+00
  %27 = fadd double %0, 0x7FF0000000000000
  %z.0.i = select i1 %26, double 0.000000e+00, double %27
  %28 = fcmp olt float %24, 0x4010E90000000000
  br i1 %28, label %29, label %__nv_exp.exit

29:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %30 = sdiv i32 %2, 2
  %31 = shl i32 %30, 20
  %32 = add i32 %18, %31
  %33 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %32) #13
  %34 = sub nsw i32 %2, %30
  %35 = shl i32 %34, 20
  %36 = add nsw i32 %35, 1072693248
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %36) #13
  %38 = fmul double %37, %33
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %29
  %z.2.i = phi double [ %21, %entry ], [ %38, %29 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %39 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %40 = sitofp i64 %39 to double
  %divide.597.1 = fdiv double %z.2.i, %40
  store double %divide.597.1, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_110(ptr noalias nocapture writeonly align 128 dereferenceable(10) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.3319 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !299
  %0 = icmp slt i64 %param_2.3319, 0
  %1 = add i64 %param_2.3319, 10
  %2 = select i1 %0, i64 %1, i64 %param_2.3319
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 9)
  %param_1.4292 = load i8, ptr addrspace(1) %arg15, align 128, !invariant.load !299
  %5 = getelementptr inbounds [10 x i8], ptr addrspace(1) %arg03, i64 0, i64 %4
  store i8 %param_1.4292, ptr addrspace(1) %5, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_70(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.3403 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !299
  %0 = icmp slt i64 %param_2.3403, 0
  %1 = add i64 %param_2.3403, 10
  %2 = select i1 %0, i64 %1, i64 %param_2.3403
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 9)
  %param_1.4372 = load i64, ptr addrspace(1) %arg15, align 128, !invariant.load !299
  %5 = getelementptr inbounds [10 x i64], ptr addrspace(1) %arg03, i64 0, i64 %4
  store i64 %param_1.4372, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_68(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.3409 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !299
  %0 = icmp slt i64 %param_2.3409, 0
  %1 = add i64 %param_2.3409, 10
  %2 = select i1 %0, i64 %1, i64 %param_2.3409
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 9)
  %param_1.4376 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !299
  %5 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  store double %param_1.4376, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %1 = add i64 %0, 1
  store i64 %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg25, align 128, !invariant.load !299
  %1 = sitofp i64 %0 to double
  %2 = tail call i32 @llvm.nvvm.d2i.hi(double %1) #13
  %3 = tail call i32 @llvm.nvvm.d2i.hi(double -7.500000e-01) #13
  %4 = and i32 %3, 2146435072
  %5 = tail call double @llvm.fabs.f64(double %1)
  %6 = icmp eq i64 %0, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %entry
  %8 = icmp eq i32 %4, 1073741824
  %thi.0.i = select i1 %8, i32 %2, i32 0
  %9 = icmp slt i32 %3, 0
  %10 = or i32 %thi.0.i, 2146435072
  %thi.1.i = select i1 %9, i32 %10, i32 %thi.0.i
  %11 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %thi.1.i) #13
  br label %15

12:                                               ; preds = %entry
  %13 = icmp slt i32 %2, 0
  %14 = tail call fastcc double @__internal_accurate_pow(double %5)
  %t.1.i = select i1 %13, double 0xFFF8000000000000, double %14
  br label %15

15:                                               ; preds = %12, %7
  %t.2.i = phi double [ %11, %7 ], [ %t.1.i, %12 ]
  %16 = fadd double %1, -7.500000e-01
  %17 = tail call i32 @llvm.nvvm.d2i.hi(double %16) #13
  %18 = and i32 %17, 2146435072
  %19 = icmp eq i32 %18, 2146435072
  br i1 %19, label %20, label %__nv_pow.exit

20:                                               ; preds = %15
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double -7.500000e-01) #13
  %22 = and i32 %3, 2147483647
  %23 = icmp eq i32 %22, 2146435072
  %24 = icmp eq i32 %21, 0
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %__nv_isinfd.exit.i

26:                                               ; preds = %20
  %27 = fcmp ogt double %5, 1.000000e+00
  %thi.2.i = select i1 %27, i32 2146435072, i32 0
  %28 = icmp slt i32 %3, 0
  %29 = xor i32 %thi.2.i, 2146435072
  %thi.3.i = select i1 %28, i32 %29, i32 %thi.2.i
  %30 = icmp eq i64 %0, -1
  %thi.4.i = select i1 %30, i32 1072693248, i32 %thi.3.i
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %thi.4.i) #13
  br label %__nv_pow.exit

__nv_isinfd.exit.i:                               ; preds = %20
  %32 = tail call i32 @llvm.nvvm.d2i.lo(double %1) #13
  %33 = and i32 %2, 2147483647
  %34 = icmp eq i32 %33, 2146435072
  %35 = icmp eq i32 %32, 0
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %__nv_pow.exit

37:                                               ; preds = %__nv_isinfd.exit.i
  %38 = icmp slt i32 %2, 0
  %39 = icmp eq i32 %4, 1073741824
  %.inv.i = icmp slt i32 %3, 0
  %spec.select.i = select i1 %.inv.i, i32 0, i32 2146435072
  %or.cond3.i = select i1 %38, i1 %39, i1 false
  %40 = icmp ne i32 %22, 1071644672
  %or.cond5.i = and i1 %40, %or.cond3.i
  %41 = or disjoint i32 %spec.select.i, -2147483648
  %thi.6.i = select i1 %or.cond5.i, i32 %41, i32 %spec.select.i
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %thi.6.i) #13
  br label %__nv_pow.exit

__nv_pow.exit:                                    ; preds = %15, %26, %__nv_isinfd.exit.i, %37
  %t.6.i = phi double [ %t.2.i, %15 ], [ %31, %26 ], [ %42, %37 ], [ %t.2.i, %__nv_isinfd.exit.i ]
  %43 = icmp eq i64 %0, 1
  %t.7.i = select i1 %43, double 1.000000e+00, double %t.6.i
  %44 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %multiply.2774.1 = fmul double %t.7.i, %44
  %subtract.211.1 = fsub double 1.000000e+00, %t.7.i
  %45 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !299
  %multiply.2775.1 = fmul double %subtract.211.1, %45
  %add.3607.1 = fadd double %multiply.2774.1, %multiply.2775.1
  store double %add.3607.1, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_exponential_subtract_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #2 {
entry:
  %arg614 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !299
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !299
  %2 = sitofp i64 %1 to double
  %3 = tail call double @llvm.sqrt.f64(double %2)
  %multiply.2771.1.clone.1 = fmul double %3, 2.000000e+01
  %4 = add i64 %1, 10
  %5 = sitofp i64 %4 to double
  %divide.563.1.clone.1 = fdiv double 1.000000e+00, %5
  %subtract.208.1.clone.1 = fsub double 1.000000e+00, %divide.563.1.clone.1
  %6 = load double, ptr addrspace(1) %arg38, align 128, !invariant.load !299
  %multiply.2772.1.clone.1 = fmul double %6, %subtract.208.1.clone.1
  %7 = load double, ptr addrspace(1) %arg26, align 128, !invariant.load !299
  %subtract.209.1.clone.1 = fsub double 9.000000e-01, %7
  %divide.564.1.clone.1 = fdiv double %subtract.209.1.clone.1, %5
  %add.3606.1.clone.1 = fadd double %divide.564.1.clone.1, %multiply.2772.1.clone.1
  %multiply.2773.1.clone.1 = fmul double %multiply.2771.1.clone.1, %add.3606.1.clone.1
  %subtract.210.1.clone.1 = fsub double %0, %multiply.2773.1.clone.1
  %8 = tail call double @llvm.fma.f64(double %subtract.210.1.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #13
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #13
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %subtract.210.1.clone.1)
  %12 = tail call double @llvm.fma.f64(double %10, double 0xBC7ABC9E3B39803F, double %11)
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %14 = tail call double @llvm.fma.f64(double %13, double %12, double 0x3EC71DEE62401315)
  %15 = tail call double @llvm.fma.f64(double %14, double %12, double 0x3EFA01997C89EB71)
  %16 = tail call double @llvm.fma.f64(double %15, double %12, double 0x3F2A01A014761F65)
  %17 = tail call double @llvm.fma.f64(double %16, double %12, double 0x3F56C16C1852B7AF)
  %18 = tail call double @llvm.fma.f64(double %17, double %12, double 0x3F81111111122322)
  %19 = tail call double @llvm.fma.f64(double %18, double %12, double 0x3FA55555555502A1)
  %20 = tail call double @llvm.fma.f64(double %19, double %12, double 0x3FC5555555555511)
  %21 = tail call double @llvm.fma.f64(double %20, double %12, double 0x3FE000000000000B)
  %22 = tail call double @llvm.fma.f64(double %21, double %12, double 1.000000e+00)
  %23 = tail call double @llvm.fma.f64(double %22, double %12, double 1.000000e+00)
  %24 = tail call i32 @llvm.nvvm.d2i.lo(double %23) #13
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %23) #13
  %26 = shl i32 %9, 20
  %27 = add i32 %25, %26
  %28 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %27) #13
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.210.1.clone.1) #13
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #13
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %subtract.210.1.clone.1, 0.000000e+00
  %34 = fadd double %subtract.210.1.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %33, double 0.000000e+00, double %34
  %35 = fcmp olt float %31, 0x4010E90000000000
  br i1 %35, label %36, label %__nv_exp.exit

36:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %37 = sdiv i32 %9, 2
  %38 = shl i32 %37, 20
  %39 = add i32 %25, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %39) #13
  %41 = sub nsw i32 %9, %37
  %42 = shl i32 %41, 20
  %43 = add nsw i32 %42, 1072693248
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %43) #13
  %45 = fmul double %44, %40
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %36
  %z.2.i = phi double [ %28, %entry ], [ %45, %36 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  store double %z.2.i, ptr addrspace(1) %arg410, align 128
  store double %subtract.210.1.clone.1, ptr addrspace(1) %arg512, align 128
  store double %add.3606.1.clone.1, ptr addrspace(1) %arg614, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_concatenate_fusion(ptr noalias nocapture align 128 dereferenceable(192) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture align 128 dereferenceable(192) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8) local_unnamed_addr #4 {
entry:
  %arg822 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg720 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg618 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg516 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg414 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg06, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = icmp ult i32 %0, 12
  br i1 %4, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %entry
  %5 = trunc i64 %1 to i32
  %6 = icmp ult i32 %5, 4
  br i1 %6, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  %7 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg18, i64 0, i64 %1
  br label %concatenate.36.8.merge

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %8 = trunc i64 %1 to i32
  %9 = icmp ult i32 %8, 8
  br i1 %9, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  %10 = trunc i64 %1 to i32
  %11 = add nsw i32 %10, -4
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg210, i64 0, i64 %12
  br label %concatenate.36.8.merge

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  %14 = trunc i64 %1 to i32
  %15 = add nsw i32 %14, -8
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg312, i64 0, i64 %16
  br label %concatenate.36.8.merge

concatenate.pivot.16.:                            ; preds = %entry
  %18 = trunc i64 %1 to i32
  %19 = icmp ult i32 %18, 16
  br i1 %19, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  %20 = trunc i64 %1 to i32
  %21 = add nsw i32 %20, -12
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg414, i64 0, i64 %22
  br label %concatenate.36.8.merge

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %24 = trunc i64 %1 to i32
  %25 = icmp ult i32 %24, 20
  br i1 %25, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  %26 = trunc i64 %1 to i32
  %27 = add nsw i32 %26, -16
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg516, i64 0, i64 %28
  br label %concatenate.36.8.merge

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  %30 = trunc i64 %1 to i32
  %31 = add nsw i32 %30, -20
  %32 = zext nneg i32 %31 to i64
  %33 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg618, i64 0, i64 %32
  br label %concatenate.36.8.merge

concatenate.36.8.merge:                           ; preds = %concatenate.pivot.20.5, %concatenate.pivot.16.4, %concatenate.pivot.12.3, %concatenate.pivot.8.2, %concatenate.pivot.4.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %7, %concatenate.pivot.0. ], [ %13, %concatenate.pivot.4.1 ], [ %17, %concatenate.pivot.8.2 ], [ %23, %concatenate.pivot.12.3 ], [ %29, %concatenate.pivot.16.4 ], [ %33, %concatenate.pivot.20.5 ]
  %34 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !299
  %35 = getelementptr double, ptr addrspace(1) %arg720, i64 %1
  %36 = load double, ptr addrspace(1) %35, align 8
  %subtract.216.3 = fsub double %34, %36
  %37 = load i64, ptr addrspace(1) %arg822, align 128, !invariant.load !299
  %38 = sitofp i64 %37 to double
  %divide.567.3.clone.1 = fdiv double %subtract.216.3, %38
  %add.3614.1.clone.1 = fadd double %36, %divide.567.3.clone.1
  %subtract.217.5 = fsub double %34, %add.3614.1.clone.1
  %multiply.2781.3 = fmul double %subtract.216.3, %subtract.217.5
  %add.3615.1 = fadd double %3, %multiply.2781.3
  store double %add.3615.1, ptr addrspace(1) %2, align 8
  store double %add.3614.1.clone.1, ptr addrspace(1) %35, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_exponential_log_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !299
  %1 = tail call double @llvm.fma.f64(double %0, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %2 = tail call i32 @llvm.nvvm.d2i.lo(double %1) #13
  %3 = tail call double @llvm.nvvm.add.rn.d(double %1, double 0xC338000000000000) #13
  %4 = tail call double @llvm.fma.f64(double %3, double 0xBFE62E42FEFA39EF, double %0)
  %5 = tail call double @llvm.fma.f64(double %3, double 0xBC7ABC9E3B39803F, double %4)
  %6 = tail call double @llvm.fma.f64(double %5, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %7 = tail call double @llvm.fma.f64(double %6, double %5, double 0x3EC71DEE62401315)
  %8 = tail call double @llvm.fma.f64(double %7, double %5, double 0x3EFA01997C89EB71)
  %9 = tail call double @llvm.fma.f64(double %8, double %5, double 0x3F2A01A014761F65)
  %10 = tail call double @llvm.fma.f64(double %9, double %5, double 0x3F56C16C1852B7AF)
  %11 = tail call double @llvm.fma.f64(double %10, double %5, double 0x3F81111111122322)
  %12 = tail call double @llvm.fma.f64(double %11, double %5, double 0x3FA55555555502A1)
  %13 = tail call double @llvm.fma.f64(double %12, double %5, double 0x3FC5555555555511)
  %14 = tail call double @llvm.fma.f64(double %13, double %5, double 0x3FE000000000000B)
  %15 = tail call double @llvm.fma.f64(double %14, double %5, double 1.000000e+00)
  %16 = tail call double @llvm.fma.f64(double %15, double %5, double 1.000000e+00)
  %17 = tail call i32 @llvm.nvvm.d2i.lo(double %16) #13
  %18 = tail call i32 @llvm.nvvm.d2i.hi(double %16) #13
  %19 = shl i32 %2, 20
  %20 = add i32 %18, %19
  %21 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %20) #13
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %0) #13
  %23 = bitcast i32 %22 to float
  %24 = tail call float @llvm.nvvm.fabs.f(float %23) #13
  %25 = fcmp olt float %24, 0x4010C46560000000
  br i1 %25, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %26 = fcmp olt double %0, 0.000000e+00
  %27 = fadd double %0, 0x7FF0000000000000
  %z.0.i = select i1 %26, double 0.000000e+00, double %27
  %28 = fcmp olt float %24, 0x4010E90000000000
  br i1 %28, label %29, label %__nv_exp.exit

29:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %30 = sdiv i32 %2, 2
  %31 = shl i32 %30, 20
  %32 = add i32 %18, %31
  %33 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %32) #13
  %34 = sub nsw i32 %2, %30
  %35 = shl i32 %34, 20
  %36 = add nsw i32 %35, 1072693248
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %36) #13
  %38 = fmul double %37, %33
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %29
  %z.2.i = phi double [ %21, %entry ], [ %38, %29 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.2782.1 = fmul double %z.2.i, 1.000000e+01
  %39 = tail call i32 @llvm.nvvm.d2i.hi(double %multiply.2782.1) #13
  %40 = tail call i32 @llvm.nvvm.d2i.lo(double %multiply.2782.1) #13
  %41 = icmp slt i32 %39, 1048576
  %42 = fmul double %multiply.2782.1, 0x4350000000000000
  %43 = tail call i32 @llvm.nvvm.d2i.lo(double %42) #13
  %44 = tail call i32 @llvm.nvvm.d2i.hi(double %42) #13
  br i1 %41, label %45, label %46

45:                                               ; preds = %__nv_exp.exit
  br label %46

46:                                               ; preds = %45, %__nv_exp.exit
  %.0.i = phi double [ %42, %45 ], [ %multiply.2782.1, %__nv_exp.exit ]
  %ihi.0.i = phi i32 [ %44, %45 ], [ %39, %__nv_exp.exit ]
  %ilo.0.i = phi i32 [ %43, %45 ], [ %40, %__nv_exp.exit ]
  %e.0.i = phi i32 [ -1077, %45 ], [ -1023, %__nv_exp.exit ]
  %47 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %47, 2146435071
  br i1 %or.cond.i, label %48, label %95

48:                                               ; preds = %46
  %49 = lshr i32 %ihi.0.i, 20
  %50 = add nsw i32 %e.0.i, %49
  %51 = and i32 %ihi.0.i, 1048575
  %52 = or disjoint i32 %51, 1072693248
  %53 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %52) #13
  %54 = icmp ugt i32 %52, 1073127582
  %55 = tail call i32 @llvm.nvvm.d2i.lo(double %53) #13
  %56 = tail call i32 @llvm.nvvm.d2i.hi(double %53) #13
  %57 = add i32 %56, -1048576
  %58 = tail call double @llvm.nvvm.lohi.i2d(i32 %55, i32 %57) #13
  %spec.select = select i1 %54, double %58, double %53
  %59 = zext i1 %54 to i32
  %spec.select1 = add nsw i32 %50, %59
  %60 = fadd double %spec.select, -1.000000e+00
  %61 = fadd double %spec.select, 1.000000e+00
  %62 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %61) #13
  %63 = fneg double %61
  %64 = tail call double @llvm.fma.f64(double %63, double %62, double 1.000000e+00)
  %65 = tail call double @llvm.fma.f64(double %64, double %64, double %64)
  %66 = tail call double @llvm.fma.f64(double %65, double %62, double %62)
  %67 = fmul double %60, %66
  %68 = fadd double %67, %67
  %69 = fmul double %68, %68
  %70 = tail call double @llvm.fma.f64(double %69, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %71 = tail call double @llvm.fma.f64(double %70, double %69, double 0x3EF3B2669F02676F)
  %72 = tail call double @llvm.fma.f64(double %71, double %69, double 0x3F1745CBA9AB0956)
  %73 = tail call double @llvm.fma.f64(double %72, double %69, double 0x3F3C71C72D1B5154)
  %74 = tail call double @llvm.fma.f64(double %73, double %69, double 0x3F624924923BE72D)
  %75 = tail call double @llvm.fma.f64(double %74, double %69, double 0x3F8999999999A3C4)
  %76 = tail call double @llvm.fma.f64(double %75, double %69, double 0x3FB5555555555554)
  %77 = fsub double %60, %68
  %78 = fmul double %77, 2.000000e+00
  %79 = fneg double %68
  %80 = tail call double @llvm.fma.f64(double %79, double %60, double %78)
  %81 = fmul double %66, %80
  %82 = fmul double %69, %76
  %83 = tail call double @llvm.fma.f64(double %82, double %68, double %81)
  %84 = xor i32 %spec.select1, -2147483648
  %85 = tail call double @llvm.nvvm.lohi.i2d(i32 %84, i32 1127219200) #13
  %86 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %87 = fsub double %85, %86
  %88 = tail call double @llvm.fma.f64(double %87, double 0x3FE62E42FEFA39EF, double %68)
  %89 = fneg double %87
  %90 = tail call double @llvm.fma.f64(double %89, double 0x3FE62E42FEFA39EF, double %88)
  %91 = fsub double %90, %68
  %92 = fsub double %83, %91
  %93 = tail call double @llvm.fma.f64(double %87, double 0x3C7ABC9E3B39803F, double %92)
  %94 = fadd double %88, %93
  br label %__nv_log.exit

95:                                               ; preds = %46
  %96 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %97 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %98 = and i32 %97, 2147483647
  %99 = icmp eq i32 %98, 0
  %q.0.i = select i1 %99, double 0xFFF0000000000000, double %96
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %48, %95
  %q.1.i = phi double [ %94, %48 ], [ %q.0.i, %95 ]
  store double %q.1.i, ptr addrspace(1) %arg14, align 128
  store double %z.2.i, ptr addrspace(1) %arg26, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(192) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %1 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !299
  %2 = sitofp i64 %1 to double
  %3 = add i64 %1, 5
  %4 = sitofp i64 %3 to double
  %divide.568.1 = fdiv double %2, %4
  %5 = zext nneg i32 %0 to i64
  %6 = getelementptr double, ptr addrspace(1) %arg01, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %8 = add i64 %1, -1
  %9 = sitofp i64 %8 to double
  %divide.569.3 = fdiv double %7, %9
  %multiply.2783.3 = fmul double %divide.568.1, %divide.569.3
  %divide.570.1 = fdiv double 5.000000e+00, %4
  %multiply.2785.1 = fmul double %divide.570.1, 1.000000e-03
  %add.3618.1 = fadd double %multiply.2783.3, %multiply.2785.1
  %10 = getelementptr double, ptr addrspace(1) %arg25, i64 %5
  store double %add.3618.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(192) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_60(ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(192) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.3450 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !299
  %1 = icmp slt i64 %param_2.3450, 0
  %2 = add i64 %param_2.3450, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.3450
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.44124 = load double, ptr addrspace(1) %6, align 8, !invariant.load !299
  %7 = getelementptr inbounds [10 x [24 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.44124, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare double @llvm.nvvm.rsqrt.approx.d(double) #10

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.hi(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.lo(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.lohi.i2d(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare double @llvm.nvvm.rcp.approx.ftz.d(double) #10

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.add.rn.d(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.f(float) #1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define internal fastcc double @__internal_accurate_pow(double %a) unnamed_addr #11 {
__internal_log_ext_prec.exit:
  %0 = tail call i32 @llvm.nvvm.d2i.hi(double %a) #13
  %1 = tail call i32 @llvm.nvvm.d2i.lo(double %a) #13
  %2 = lshr i32 %0, 20
  %3 = icmp ult i32 %0, 1048576
  %4 = fmul double %a, 0x4350000000000000
  %5 = tail call i32 @llvm.nvvm.d2i.hi(double %4) #13
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #13
  %7 = lshr i32 %5, 20
  %8 = add nsw i32 %7, -54
  %ilo.i.0 = select i1 %3, i32 %6, i32 %1
  %ihi.i.0 = select i1 %3, i32 %5, i32 %0
  %expo.i.0 = select i1 %3, i32 %8, i32 %2
  %9 = and i32 %ihi.i.0, -2146435073
  %10 = or disjoint i32 %9, 1072693248
  %11 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0, i32 %10) #13
  %12 = icmp ugt i32 %10, 1073127582
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #13
  %14 = tail call i32 @llvm.nvvm.d2i.hi(double %11) #13
  %15 = add i32 %14, -1048576
  %16 = tail call double @llvm.nvvm.lohi.i2d(i32 %13, i32 %15) #13
  %m.i.0 = select i1 %12, double %16, double %11
  %expo.i.1.v = select i1 %12, i32 -1022, i32 -1023
  %expo.i.1 = add nsw i32 %expo.i.1.v, %expo.i.0
  %17 = fadd double %m.i.0, -1.000000e+00
  %18 = fadd double %m.i.0, 1.000000e+00
  %19 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %18) #13
  %20 = fneg double %18
  %21 = tail call double @llvm.fma.f64(double %20, double %19, double 1.000000e+00)
  %22 = tail call double @llvm.fma.f64(double %21, double %21, double %21)
  %23 = tail call double @llvm.fma.f64(double %22, double %19, double %19)
  %24 = fmul double %17, %23
  %25 = fadd double %24, %24
  %26 = fmul double %25, %25
  %27 = tail call double @llvm.fma.f64(double %26, double 0x3EB0F5FF7D2CAFE2, double 0x3ED0F5D241AD3B5A)
  %28 = tail call double @llvm.fma.f64(double %27, double %26, double 0x3EF3B20A75488A3F)
  %29 = tail call double @llvm.fma.f64(double %28, double %26, double 0x3F1745CDE4FAECD5)
  %30 = tail call double @llvm.fma.f64(double %29, double %26, double 0x3F3C71C7258A578B)
  %31 = tail call double @llvm.fma.f64(double %30, double %26, double 0x3F6249249242B910)
  %32 = tail call double @llvm.fma.f64(double %31, double %26, double 0x3F89999999999DFB)
  %33 = fmul double %26, %32
  %34 = fsub double %17, %25
  %35 = fmul double %34, 2.000000e+00
  %36 = fneg double %25
  %37 = tail call double @llvm.fma.f64(double %36, double %17, double %35)
  %38 = fmul double %23, %37
  %39 = fadd double %33, 0x3FB5555555555555
  %40 = fsub double 0x3FB5555555555555, %39
  %41 = fadd double %33, %40
  %42 = fadd double %41, 0xBC46A4CB00B9E7B0
  %43 = fadd double %39, %42
  %44 = fsub double %39, %43
  %45 = fadd double %42, %44
  %46 = tail call double @llvm.nvvm.mul.rn.d(double %25, double %25) #13
  %47 = fneg double %46
  %48 = tail call double @llvm.fma.f64(double %25, double %25, double %47)
  %49 = tail call i32 @llvm.nvvm.d2i.lo(double %38) #13
  %50 = tail call i32 @llvm.nvvm.d2i.hi(double %38) #13
  %51 = add i32 %50, 1048576
  %52 = tail call double @llvm.nvvm.lohi.i2d(i32 %49, i32 %51) #13
  %53 = tail call double @llvm.fma.f64(double %25, double %52, double %48)
  %54 = tail call double @llvm.nvvm.mul.rn.d(double %46, double %25) #13
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %46, double %25, double %55)
  %57 = tail call double @llvm.fma.f64(double %46, double %38, double %56)
  %58 = tail call double @llvm.fma.f64(double %53, double %25, double %57)
  %59 = tail call double @llvm.nvvm.mul.rn.d(double %43, double %54) #13
  %60 = fneg double %59
  %61 = tail call double @llvm.fma.f64(double %43, double %54, double %60)
  %62 = tail call double @llvm.fma.f64(double %43, double %58, double %61)
  %63 = tail call double @llvm.fma.f64(double %45, double %54, double %62)
  %64 = fadd double %59, %63
  %65 = fsub double %59, %64
  %66 = fadd double %63, %65
  %67 = fadd double %25, %64
  %68 = fsub double %25, %67
  %69 = fadd double %64, %68
  %70 = fadd double %66, %69
  %71 = fadd double %38, %70
  %72 = fadd double %67, %71
  %73 = fsub double %67, %72
  %74 = fadd double %71, %73
  %75 = xor i32 %expo.i.1, -2147483648
  %76 = tail call double @llvm.nvvm.lohi.i2d(i32 %75, i32 1127219200) #13
  %77 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %78 = fsub double %76, %77
  %79 = tail call double @llvm.fma.f64(double %78, double 0x3FE62E42FEFA39EF, double %72)
  %80 = fneg double %78
  %81 = tail call double @llvm.fma.f64(double %80, double 0x3FE62E42FEFA39EF, double %79)
  %82 = fsub double %81, %72
  %83 = fsub double %74, %82
  %84 = tail call double @llvm.fma.f64(double %78, double 0x3C7ABC9E3B39803F, double %83)
  %85 = fadd double %79, %84
  %86 = fsub double %79, %85
  %87 = fadd double %84, %86
  %88 = tail call i32 @llvm.nvvm.d2i.hi(double -7.500000e-01) #13
  %89 = tail call i32 @llvm.nvvm.d2i.lo(double -7.500000e-01) #13
  %90 = shl i32 %88, 1
  %91 = icmp ugt i32 %90, -33554433
  %92 = and i32 %88, -15728641
  %spec.select = select i1 %91, i32 %92, i32 %88
  %93 = tail call double @llvm.nvvm.lohi.i2d(i32 %89, i32 %spec.select) #13
  %94 = tail call double @llvm.nvvm.mul.rn.d(double %85, double %93) #13
  %95 = fneg double %94
  %96 = tail call double @llvm.fma.f64(double %85, double %93, double %95)
  %97 = tail call double @llvm.fma.f64(double %87, double %93, double %96)
  %98 = fadd double %94, %97
  %99 = tail call double @llvm.fma.f64(double %98, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %100 = tail call i32 @llvm.nvvm.d2i.lo(double %99) #13
  %101 = tail call double @llvm.nvvm.add.rn.d(double %99, double 0xC338000000000000) #13
  %102 = tail call double @llvm.fma.f64(double %101, double 0xBFE62E42FEFA39EF, double %98)
  %103 = tail call double @llvm.fma.f64(double %101, double 0xBC7ABC9E3B39803F, double %102)
  %104 = tail call double @llvm.fma.f64(double %103, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %105 = tail call double @llvm.fma.f64(double %104, double %103, double 0x3EC71DEE62401315)
  %106 = tail call double @llvm.fma.f64(double %105, double %103, double 0x3EFA01997C89EB71)
  %107 = tail call double @llvm.fma.f64(double %106, double %103, double 0x3F2A01A014761F65)
  %108 = tail call double @llvm.fma.f64(double %107, double %103, double 0x3F56C16C1852B7AF)
  %109 = tail call double @llvm.fma.f64(double %108, double %103, double 0x3F81111111122322)
  %110 = tail call double @llvm.fma.f64(double %109, double %103, double 0x3FA55555555502A1)
  %111 = tail call double @llvm.fma.f64(double %110, double %103, double 0x3FC5555555555511)
  %112 = tail call double @llvm.fma.f64(double %111, double %103, double 0x3FE000000000000B)
  %113 = tail call double @llvm.fma.f64(double %112, double %103, double 1.000000e+00)
  %114 = tail call double @llvm.fma.f64(double %113, double %103, double 1.000000e+00)
  %115 = tail call i32 @llvm.nvvm.d2i.lo(double %114) #13
  %116 = tail call i32 @llvm.nvvm.d2i.hi(double %114) #13
  %117 = shl i32 %100, 20
  %118 = add i32 %116, %117
  %119 = tail call double @llvm.nvvm.lohi.i2d(i32 %115, i32 %118) #13
  %120 = tail call i32 @llvm.nvvm.d2i.hi(double %98) #13
  %121 = bitcast i32 %120 to float
  %122 = tail call float @llvm.nvvm.fabs.f(float %121) #13
  %123 = fcmp olt float %122, 0x4010C46560000000
  br i1 %123, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %__internal_log_ext_prec.exit
  %124 = fcmp olt double %98, 0.000000e+00
  %125 = fadd double %98, 0x7FF0000000000000
  %z.i.0 = select i1 %124, double 0.000000e+00, double %125
  %126 = fcmp olt float %122, 0x4010E90000000000
  br i1 %126, label %127, label %__nv_exp.exit

127:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %128 = sdiv i32 %100, 2
  %129 = shl i32 %128, 20
  %130 = add i32 %116, %129
  %131 = tail call double @llvm.nvvm.lohi.i2d(i32 %115, i32 %130) #13
  %132 = sub nsw i32 %100, %128
  %133 = shl i32 %132, 20
  %134 = add nsw i32 %133, 1072693248
  %135 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %134) #13
  %136 = fmul double %135, %131
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %__internal_log_ext_prec.exit, %127, %__internal_fast_icmp_abs_lt.exit.i
  %z.i.2 = phi double [ %119, %__internal_log_ext_prec.exit ], [ %136, %127 ], [ %z.i.0, %__internal_fast_icmp_abs_lt.exit.i ]
  %137 = fsub double %94, %98
  %138 = fadd double %97, %137
  %139 = tail call i32 @llvm.nvvm.d2i.lo(double %z.i.2) #13
  %140 = tail call i32 @llvm.nvvm.d2i.hi(double %z.i.2) #13
  %141 = and i32 %140, 2147483647
  %142 = icmp eq i32 %141, 2146435072
  %143 = icmp eq i32 %139, 0
  %144 = select i1 %142, i1 %143, i1 false
  %145 = tail call double @llvm.fma.f64(double %z.i.2, double %138, double %z.i.2)
  %tmp.0 = select i1 %144, double %z.i.2, double %145
  ret double %tmp.0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.mul.rn.d(double, double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f64(double, i32 immarg) #12

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #5 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { norecurse nounwind }
attributes #7 = { convergent nocallback nounwind }
attributes #8 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #9 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #10 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #11 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291}
!llvm.ident = !{!292}
!nvvmir.version = !{!293}
!llvm.module.flags = !{!294}

!0 = !{ptr @loop_broadcast_fusion_20, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion_20, !"reqntidx", i32 10}
!2 = !{ptr @loop_broadcast_fusion_19, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion_19, !"reqntidx", i32 10}
!4 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!6 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!7 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!8 = !{ptr @wrapped_transpose_1, !"kernel", i32 1}
!9 = !{ptr @wrapped_transpose_1, !"reqntidx", i32 128}
!10 = !{ptr @loop_compare_fusion_5, !"kernel", i32 1}
!11 = !{ptr @loop_compare_fusion_5, !"reqntidx", i32 1}
!12 = !{ptr @loop_clamp_convert_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_clamp_convert_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_add_slice_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_add_slice_fusion, !"reqntidx", i32 2}
!16 = !{ptr @loop_multiply_fusion_2, !"kernel", i32 1}
!17 = !{ptr @loop_multiply_fusion_2, !"reqntidx", i32 24}
!18 = !{ptr @loop_add_fusion_13, !"kernel", i32 1}
!19 = !{ptr @loop_add_fusion_13, !"reqntidx", i32 1}
!20 = !{ptr @wrapped_slice_5, !"kernel", i32 1}
!21 = !{ptr @wrapped_slice_5, !"reqntidx", i32 4}
!22 = !{ptr @wrapped_slice_4, !"kernel", i32 1}
!23 = !{ptr @wrapped_slice_4, !"reqntidx", i32 4}
!24 = !{ptr @wrapped_slice_3, !"kernel", i32 1}
!25 = !{ptr @wrapped_slice_3, !"reqntidx", i32 4}
!26 = !{ptr @wrapped_slice_2, !"kernel", i32 1}
!27 = !{ptr @wrapped_slice_2, !"reqntidx", i32 4}
!28 = !{ptr @wrapped_slice, !"kernel", i32 1}
!29 = !{ptr @wrapped_slice, !"reqntidx", i32 4}
!30 = !{ptr @wrapped_slice_1, !"kernel", i32 1}
!31 = !{ptr @wrapped_slice_1, !"reqntidx", i32 4}
!32 = !{ptr @loop_dynamic_update_slice_fusion_112, !"kernel", i32 1}
!33 = !{ptr @loop_dynamic_update_slice_fusion_112, !"reqntidx", i32 4}
!34 = !{ptr @loop_broadcast_fusion_18, !"kernel", i32 1}
!35 = !{ptr @loop_broadcast_fusion_18, !"reqntidx", i32 240}
!36 = !{ptr @loop_and_fusion_2, !"kernel", i32 1}
!37 = !{ptr @loop_and_fusion_2, !"reqntidx", i32 1}
!38 = !{ptr @loop_select_fusion_5, !"kernel", i32 1}
!39 = !{ptr @loop_select_fusion_5, !"reqntidx", i32 1}
!40 = !{ptr @loop_add_fusion_11, !"kernel", i32 1}
!41 = !{ptr @loop_add_fusion_11, !"reqntidx", i32 1}
!42 = !{ptr @loop_add_fusion_12, !"kernel", i32 1}
!43 = !{ptr @loop_add_fusion_12, !"reqntidx", i32 1}
!44 = !{ptr @loop_add_fusion_10, !"kernel", i32 1}
!45 = !{ptr @loop_add_fusion_10, !"reqntidx", i32 3}
!46 = !{ptr @loop_slice_fusion, !"kernel", i32 1}
!47 = !{ptr @loop_slice_fusion, !"reqntidx", i32 6}
!48 = !{ptr @loop_convert_select_fusion, !"kernel", i32 1}
!49 = !{ptr @loop_convert_select_fusion, !"reqntidx", i32 1}
!50 = !{ptr @loop_add_minimum_select_fusion_1, !"kernel", i32 1}
!51 = !{ptr @loop_add_minimum_select_fusion_1, !"reqntidx", i32 1}
!52 = !{ptr @loop_and_fusion_1, !"kernel", i32 1}
!53 = !{ptr @loop_and_fusion_1, !"reqntidx", i32 1}
!54 = !{ptr @loop_convert_fusion_4, !"kernel", i32 1}
!55 = !{ptr @loop_convert_fusion_4, !"reqntidx", i32 1}
!56 = !{ptr @loop_convert_fusion_3, !"kernel", i32 1}
!57 = !{ptr @loop_convert_fusion_3, !"reqntidx", i32 1}
!58 = !{ptr @input_concatenate_fusion_1, !"kernel", i32 1}
!59 = !{ptr @input_concatenate_fusion_1, !"reqntidx", i32 1}
!60 = !{ptr @loop_broadcast_fusion_10, !"kernel", i32 1}
!61 = !{ptr @loop_broadcast_fusion_10, !"reqntidx", i32 4}
!62 = !{ptr @loop_broadcast_fusion_14, !"kernel", i32 1}
!63 = !{ptr @loop_broadcast_fusion_14, !"reqntidx", i32 4}
!64 = !{ptr @loop_broadcast_fusion_4, !"kernel", i32 1}
!65 = !{ptr @loop_broadcast_fusion_4, !"reqntidx", i32 4}
!66 = !{ptr @loop_broadcast_fusion_17, !"kernel", i32 1}
!67 = !{ptr @loop_broadcast_fusion_17, !"reqntidx", i32 4}
!68 = !{ptr @loop_broadcast_fusion_13, !"kernel", i32 1}
!69 = !{ptr @loop_broadcast_fusion_13, !"reqntidx", i32 4}
!70 = !{ptr @loop_broadcast_fusion_8, !"kernel", i32 1}
!71 = !{ptr @loop_broadcast_fusion_8, !"reqntidx", i32 4}
!72 = !{ptr @loop_add_convert_fusion, !"kernel", i32 1}
!73 = !{ptr @loop_add_convert_fusion, !"reqntidx", i32 1}
!74 = !{ptr @loop_concatenate_fusion_1, !"kernel", i32 1}
!75 = !{ptr @loop_concatenate_fusion_1, !"reqntidx", i32 24}
!76 = !{ptr @loop_add_exponential_fusion, !"kernel", i32 1}
!77 = !{ptr @loop_add_exponential_fusion, !"reqntidx", i32 4}
!78 = !{ptr @loop_broadcast_fusion_7, !"kernel", i32 1}
!79 = !{ptr @loop_broadcast_fusion_7, !"reqntidx", i32 768}
!80 = !{ptr @loop_broadcast_fusion_6, !"kernel", i32 1}
!81 = !{ptr @loop_broadcast_fusion_6, !"reqntidx", i32 768}
!82 = !{ptr @loop_broadcast_fusion_15, !"kernel", i32 1}
!83 = !{ptr @loop_broadcast_fusion_15, !"reqntidx", i32 192}
!84 = !{ptr @loop_broadcast_fusion_12, !"kernel", i32 1}
!85 = !{ptr @loop_broadcast_fusion_12, !"reqntidx", i32 192}
!86 = !{ptr @loop_broadcast_fusion_16, !"kernel", i32 1}
!87 = !{ptr @loop_broadcast_fusion_16, !"reqntidx", i32 768}
!88 = !{ptr @loop_broadcast_fusion_11, !"kernel", i32 1}
!89 = !{ptr @loop_broadcast_fusion_11, !"reqntidx", i32 768}
!90 = !{ptr @loop_convert_fusion_2, !"kernel", i32 1}
!91 = !{ptr @loop_convert_fusion_2, !"reqntidx", i32 128}
!92 = !{ptr @loop_compare_fusion_2, !"kernel", i32 1}
!93 = !{ptr @loop_compare_fusion_2, !"reqntidx", i32 1}
!94 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 4}
!96 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 4}
!98 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 4}
!100 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 1}
!102 = !{ptr @loop_dynamic_update_slice_fusion_55, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_55, !"reqntidx", i32 1}
!104 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 4}
!106 = !{ptr @loop_dynamic_update_slice_fusion_44, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_44, !"reqntidx", i32 4}
!108 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 4}
!110 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 4}
!112 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 4}
!114 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 4}
!116 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 4}
!118 = !{ptr @loop_dynamic_update_slice_fusion_32, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_32, !"reqntidx", i32 4}
!120 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!121 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 4}
!122 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 4}
!124 = !{ptr @loop_add_divide_exponential_select_fusion, !"kernel", i32 1}
!125 = !{ptr @loop_add_divide_exponential_select_fusion, !"reqntidx", i32 4}
!126 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 4}
!128 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!129 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 4}
!130 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 4}
!132 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 4}
!134 = !{ptr @loop_dynamic_update_slice_fusion_31, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_31, !"reqntidx", i32 4}
!136 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 4}
!138 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 4}
!140 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 4}
!142 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 4}
!144 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 4}
!146 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 4}
!148 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!149 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 4}
!150 = !{ptr @loop_dynamic_update_slice_fusion_24, !"kernel", i32 1}
!151 = !{ptr @loop_dynamic_update_slice_fusion_24, !"reqntidx", i32 4}
!152 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!153 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 4}
!154 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!155 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 4}
!156 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!157 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 4}
!158 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!159 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 4}
!160 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!161 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 4}
!162 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 4}
!164 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 4}
!166 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 4}
!168 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 4}
!170 = !{ptr @loop_dynamic_update_slice_fusion_33, !"kernel", i32 1}
!171 = !{ptr @loop_dynamic_update_slice_fusion_33, !"reqntidx", i32 4}
!172 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!173 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 4}
!174 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!175 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 4}
!176 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!177 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 4}
!178 = !{ptr @loop_dynamic_update_slice_fusion_36, !"kernel", i32 1}
!179 = !{ptr @loop_dynamic_update_slice_fusion_36, !"reqntidx", i32 4}
!180 = !{ptr @loop_dynamic_update_slice_fusion_28, !"kernel", i32 1}
!181 = !{ptr @loop_dynamic_update_slice_fusion_28, !"reqntidx", i32 4}
!182 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!183 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 128}
!184 = !{ptr @loop_exponential_fusion, !"kernel", i32 1}
!185 = !{ptr @loop_exponential_fusion, !"reqntidx", i32 128}
!186 = !{ptr @loop_broadcast_fusion_9, !"kernel", i32 1}
!187 = !{ptr @loop_broadcast_fusion_9, !"reqntidx", i32 1024}
!188 = !{ptr @input_scatter_fusion, !"kernel", i32 1}
!189 = !{ptr @input_scatter_fusion, !"reqntidx", i32 128}
!190 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!191 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 128}
!192 = !{ptr @loop_select_slice_fusion, !"kernel", i32 1}
!193 = !{ptr @loop_select_slice_fusion, !"reqntidx", i32 128}
!194 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!195 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 1024}
!196 = !{ptr @input_reduce_fusion_2, !"kernel", i32 1}
!197 = !{ptr @input_reduce_fusion_2, !"reqntidx", i32 64}
!198 = !{ptr @input_add_reduce_fusion_3, !"kernel", i32 1}
!199 = !{ptr @input_add_reduce_fusion_3, !"reqntidx", i32 32}
!200 = !{ptr @input_reduce_fusion_1, !"kernel", i32 1}
!201 = !{ptr @input_reduce_fusion_1, !"reqntidx", i32 1024}
!202 = !{ptr @input_add_reduce_fusion_5, !"kernel", i32 1}
!203 = !{ptr @input_add_reduce_fusion_5, !"reqntidx", i32 32}
!204 = !{ptr @loop_dynamic_slice_fusion_2, !"kernel", i32 1}
!205 = !{ptr @loop_dynamic_slice_fusion_2, !"reqntidx", i32 1}
!206 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!207 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!208 = !{ptr @loop_dynamic_slice_fusion_4, !"kernel", i32 1}
!209 = !{ptr @loop_dynamic_slice_fusion_4, !"reqntidx", i32 4}
!210 = !{ptr @loop_dynamic_slice_fusion_3, !"kernel", i32 1}
!211 = !{ptr @loop_dynamic_slice_fusion_3, !"reqntidx", i32 4}
!212 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!213 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 4}
!214 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!215 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 4}
!216 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!217 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 4}
!218 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!219 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 4}
!220 = !{ptr @input_add_reduce_fusion_2, !"kernel", i32 1}
!221 = !{ptr @input_add_reduce_fusion_2, !"reqntidx", i32 32}
!222 = !{ptr @input_add_reduce_fusion_1, !"kernel", i32 1}
!223 = !{ptr @input_add_reduce_fusion_1, !"reqntidx", i32 32}
!224 = !{ptr @input_add_reduce_fusion_4, !"kernel", i32 1}
!225 = !{ptr @input_add_reduce_fusion_4, !"reqntidx", i32 32}
!226 = !{ptr @input_add_reduce_fusion, !"kernel", i32 1}
!227 = !{ptr @input_add_reduce_fusion, !"reqntidx", i32 32}
!228 = !{ptr @wrapped_concatenate, !"kernel", i32 1}
!229 = !{ptr @wrapped_concatenate, !"reqntidx", i32 24}
!230 = !{ptr @loop_add_minimum_select_fusion, !"kernel", i32 1}
!231 = !{ptr @loop_add_minimum_select_fusion, !"reqntidx", i32 1}
!232 = !{ptr @loop_compare_fusion_3, !"kernel", i32 1}
!233 = !{ptr @loop_compare_fusion_3, !"reqntidx", i32 1}
!234 = !{ptr @loop_select_fusion_3, !"kernel", i32 1}
!235 = !{ptr @loop_select_fusion_3, !"reqntidx", i32 1}
!236 = !{ptr @loop_select_fusion_4, !"kernel", i32 1}
!237 = !{ptr @loop_select_fusion_4, !"reqntidx", i32 1}
!238 = !{ptr @loop_convert_fusion_1, !"kernel", i32 1}
!239 = !{ptr @loop_convert_fusion_1, !"reqntidx", i32 1}
!240 = !{ptr @wrapped_add, !"kernel", i32 1}
!241 = !{ptr @wrapped_add, !"reqntidx", i32 4}
!242 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!243 = !{ptr @input_reduce_fusion, !"reqntidx", i32 32}
!244 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!245 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 24}
!246 = !{ptr @loop_and_fusion, !"kernel", i32 1}
!247 = !{ptr @loop_and_fusion, !"reqntidx", i32 1}
!248 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!249 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 24}
!250 = !{ptr @loop_add_fusion_7, !"kernel", i32 1}
!251 = !{ptr @loop_add_fusion_7, !"reqntidx", i32 1}
!252 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!253 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!254 = !{ptr @loop_or_fusion, !"kernel", i32 1}
!255 = !{ptr @loop_or_fusion, !"reqntidx", i32 1}
!256 = !{ptr @loop_convert_fusion_5, !"kernel", i32 1}
!257 = !{ptr @loop_convert_fusion_5, !"reqntidx", i32 1}
!258 = !{ptr @loop_convert_fusion, !"kernel", i32 1}
!259 = !{ptr @loop_convert_fusion, !"reqntidx", i32 1}
!260 = !{ptr @wrapped_add_12, !"kernel", i32 1}
!261 = !{ptr @wrapped_add_12, !"reqntidx", i32 1}
!262 = !{ptr @wrapped_add_11, !"kernel", i32 1}
!263 = !{ptr @wrapped_add_11, !"reqntidx", i32 4}
!264 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!265 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 24}
!266 = !{ptr @loop_or_fusion_1, !"kernel", i32 1}
!267 = !{ptr @loop_or_fusion_1, !"reqntidx", i32 1}
!268 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!269 = !{ptr @loop_divide_fusion, !"reqntidx", i32 1}
!270 = !{ptr @loop_dynamic_update_slice_fusion_110, !"kernel", i32 1}
!271 = !{ptr @loop_dynamic_update_slice_fusion_110, !"reqntidx", i32 1}
!272 = !{ptr @loop_dynamic_update_slice_fusion_70, !"kernel", i32 1}
!273 = !{ptr @loop_dynamic_update_slice_fusion_70, !"reqntidx", i32 1}
!274 = !{ptr @loop_dynamic_update_slice_fusion_68, !"kernel", i32 1}
!275 = !{ptr @loop_dynamic_update_slice_fusion_68, !"reqntidx", i32 1}
!276 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!277 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!278 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!279 = !{ptr @loop_add_fusion, !"reqntidx", i32 1}
!280 = !{ptr @loop_add_exponential_subtract_fusion, !"kernel", i32 1}
!281 = !{ptr @loop_add_exponential_subtract_fusion, !"reqntidx", i32 1}
!282 = !{ptr @loop_concatenate_fusion, !"kernel", i32 1}
!283 = !{ptr @loop_concatenate_fusion, !"reqntidx", i32 24}
!284 = !{ptr @loop_exponential_log_fusion, !"kernel", i32 1}
!285 = !{ptr @loop_exponential_log_fusion, !"reqntidx", i32 1}
!286 = !{ptr @loop_add_fusion_5, !"kernel", i32 1}
!287 = !{ptr @loop_add_fusion_5, !"reqntidx", i32 24}
!288 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!289 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 24}
!290 = !{ptr @loop_dynamic_update_slice_fusion_60, !"kernel", i32 1}
!291 = !{ptr @loop_dynamic_update_slice_fusion_60, !"reqntidx", i32 24}
!292 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!293 = !{i32 2, i32 0}
!294 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!295 = !{i32 0, i32 10}
!296 = !{i32 0, i32 3}
!297 = !{i32 0, i32 128}
!298 = !{i32 0, i32 6}
!299 = !{}
!300 = !{i32 0, i32 2}
!301 = !{i32 0, i32 24}
!302 = !{i32 0, i32 4}
!303 = !{i32 0, i32 240}
!304 = distinct !{!304, !305}
!305 = !{!"llvm.loop.peeled.count", i32 4}
!306 = !{i32 0, i32 768}
!307 = !{i32 0, i32 192}
!308 = !{i32 0, i32 12}
!309 = !{i32 0, i32 1024}
!310 = distinct !{!310, !311}
!311 = !{!"llvm.loop.vectorize.enable", i1 false}
!312 = !{i32 0, i32 64}
!313 = !{i32 0, i32 32}
!314 = distinct !{!314, !311}
