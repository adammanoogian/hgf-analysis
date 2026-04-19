; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_15_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@buffer_for_constant_1481_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache2 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache5 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache6 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache7 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache8 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache9 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !267
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
define void @loop_broadcast_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !267
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 0, ptr addrspace(1) %2, align 8
  %3 = getelementptr i64, ptr addrspace(1) %arg13, i64 %1
  store i64 0, ptr addrspace(1) %3, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(3200) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !268
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 420
  br i1 %3, label %concatenate.49.merge, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice0-after, %slice1-true, %entry
  ret void

concatenate.49.merge:                             ; preds = %entry
  %4 = icmp ult i32 %linear_index, 20
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg03, i64 0, i64 %5
  br i1 %4, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.49.merge
  %7 = icmp ugt i32 %linear_index, 19
  %8 = add nsw i32 %linear_index, -20
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [400 x double], ptr addrspace(1) %arg15, i64 0, i64 %9
  br i1 %7, label %slice1-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.49.merge
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %10, align 8
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !270
  %1 = icmp slt i64 %0, 10
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 0, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg2) local_unnamed_addr #2 {
entry:
  %arg2114 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0110 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = load i64, ptr addrspace(1) %arg1112, align 128, !invariant.load !270
  %2 = icmp slt i64 %1, 0
  %3 = add i64 %1, 10
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 9)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [10 x [2 x i32]], ptr addrspace(1) %arg0110, i64 0, i64 %8, i64 0
  %10 = load <2 x i32>, ptr addrspace(1) %9, align 8, !invariant.load !270
  %11 = extractelement <2 x i32> %10, i32 0
  %12 = extractelement <2 x i32> %10, i32 1
  %13 = add i32 %11, %0
  %14 = or disjoint i32 %0, 2
  %15 = add i32 %12, %14
  %16 = add i32 %13, %15
  %17 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 13)
  %18 = xor i32 %16, %17
  %19 = add i32 %18, %16
  %20 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %18, i32 15)
  %21 = xor i32 %19, %20
  %22 = add i32 %21, %19
  %23 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %21, i32 26)
  %24 = xor i32 %22, %23
  %25 = add i32 %24, %22
  %26 = add i32 %25, %12
  %27 = tail call i32 @llvm.fshl.i32(i32 %24, i32 %24, i32 6)
  %28 = xor i32 %25, %27
  %29 = xor i32 %11, %12
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
  %46 = add i32 %11, 2
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
  %58 = add i32 %57, %11
  %59 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 6)
  %60 = xor i32 %57, %59
  %61 = add i32 %12, 3
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
  %73 = add i32 %72, %12
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
  %88 = add i32 %87, %30
  %89 = zext nneg i32 %0 to i64
  %90 = getelementptr inbounds [4 x i32], ptr addrspace(1) %arg2114, i64 0, i64 %89
  store i32 %88, ptr addrspace(1) %90, align 4
  %91 = tail call i32 @llvm.fshl.i32(i32 %86, i32 %86, i32 6)
  %92 = xor i32 %87, %91
  %93 = add i32 %11, 5
  %94 = add i32 %93, %92
  %95 = getelementptr inbounds i8, ptr addrspace(1) %90, i64 8
  store i32 %94, ptr addrspace(1) %95, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0xFFF0000000000000, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none)
define void @loop_slice_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg2) local_unnamed_addr #3 {
entry:
  %arg2102 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1100 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg098 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !272
  %1 = lshr i32 %0, 2
  %urem = and i32 %0, 3
  %2 = icmp ult i32 %urem, 2
  br i1 %2, label %concatenate.pivot.0., label %concatenate.pivot.2.93

concatenate.pivot.0.:                             ; preds = %entry
  %3 = shl nuw nsw i32 %1, 1
  %4 = zext nneg i32 %3 to i64
  %5 = getelementptr inbounds [4 x i32], ptr addrspace(1) %arg098, i64 0, i64 %4
  %6 = load <2 x i32>, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = extractelement <2 x i32> %6, i32 0
  %8 = extractelement <2 x i32> %6, i32 1
  %9 = add i32 %7, %urem
  %10 = or disjoint i32 %urem, 2
  %11 = add i32 %8, %10
  %12 = add i32 %9, %11
  %13 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %11, i32 13)
  %14 = xor i32 %12, %13
  %15 = add i32 %14, %12
  %16 = tail call i32 @llvm.fshl.i32(i32 %14, i32 %14, i32 15)
  %17 = xor i32 %15, %16
  %18 = add i32 %17, %15
  %19 = tail call i32 @llvm.fshl.i32(i32 %17, i32 %17, i32 26)
  %20 = xor i32 %18, %19
  %21 = add i32 %20, %18
  %22 = add i32 %21, %8
  %23 = tail call i32 @llvm.fshl.i32(i32 %20, i32 %20, i32 6)
  %24 = xor i32 %21, %23
  %25 = xor i32 %7, %8
  %26 = xor i32 %25, 466688986
  %27 = add i32 %26, 1
  %28 = add i32 %27, %24
  %29 = add i32 %22, %28
  %30 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 17)
  %31 = xor i32 %29, %30
  %32 = add i32 %31, %29
  %33 = tail call i32 @llvm.fshl.i32(i32 %31, i32 %31, i32 29)
  %34 = xor i32 %32, %33
  %35 = add i32 %34, %32
  %36 = tail call i32 @llvm.fshl.i32(i32 %34, i32 %34, i32 16)
  %37 = xor i32 %35, %36
  %38 = add i32 %37, %35
  %39 = add i32 %38, %26
  %40 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 24)
  %41 = xor i32 %38, %40
  %42 = add i32 %7, 2
  %43 = add i32 %42, %41
  %44 = add i32 %39, %43
  %45 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 13)
  %46 = xor i32 %44, %45
  %47 = add i32 %46, %44
  %48 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 15)
  %49 = xor i32 %47, %48
  %50 = add i32 %49, %47
  %51 = tail call i32 @llvm.fshl.i32(i32 %49, i32 %49, i32 26)
  %52 = xor i32 %50, %51
  %53 = add i32 %52, %50
  %54 = add i32 %53, %7
  %55 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 6)
  %56 = xor i32 %53, %55
  %57 = add i32 %8, 3
  %58 = add i32 %57, %56
  %59 = add i32 %54, %58
  %60 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 17)
  %61 = xor i32 %59, %60
  %62 = add i32 %61, %59
  %63 = tail call i32 @llvm.fshl.i32(i32 %61, i32 %61, i32 29)
  %64 = xor i32 %62, %63
  %65 = add i32 %64, %62
  %66 = tail call i32 @llvm.fshl.i32(i32 %64, i32 %64, i32 16)
  %67 = xor i32 %65, %66
  %68 = add i32 %67, %65
  %69 = add i32 %68, %8
  %70 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 24)
  %71 = xor i32 %68, %70
  %72 = add i32 %26, 4
  %73 = add i32 %72, %71
  %74 = add i32 %69, %73
  %75 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 13)
  %76 = xor i32 %74, %75
  %77 = add i32 %76, %74
  %78 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 15)
  %79 = xor i32 %77, %78
  %80 = add i32 %79, %77
  %81 = tail call i32 @llvm.fshl.i32(i32 %79, i32 %79, i32 26)
  %82 = xor i32 %80, %81
  %83 = add i32 %80, %26
  %84 = add i32 %83, %82
  br label %concatenate.48.3.merge

concatenate.pivot.2.93:                           ; preds = %entry
  %85 = add nsw i32 %urem, -2
  %86 = shl nuw nsw i32 %1, 1
  %87 = zext nneg i32 %86 to i64
  %88 = getelementptr inbounds [4 x i32], ptr addrspace(1) %arg098, i64 0, i64 %87
  %89 = load <2 x i32>, ptr addrspace(1) %88, align 8, !invariant.load !270
  %90 = extractelement <2 x i32> %89, i32 0
  %91 = extractelement <2 x i32> %89, i32 1
  %92 = add i32 %85, %90
  %93 = add i32 %91, %urem
  %94 = add i32 %92, %93
  %95 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %93, i32 13)
  %96 = xor i32 %94, %95
  %97 = add i32 %96, %94
  %98 = tail call i32 @llvm.fshl.i32(i32 %96, i32 %96, i32 15)
  %99 = xor i32 %97, %98
  %100 = add i32 %99, %97
  %101 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %99, i32 26)
  %102 = xor i32 %100, %101
  %103 = add i32 %102, %100
  %104 = add i32 %103, %91
  %105 = tail call i32 @llvm.fshl.i32(i32 %102, i32 %102, i32 6)
  %106 = xor i32 %103, %105
  %107 = xor i32 %90, %91
  %108 = xor i32 %107, 466688986
  %109 = add i32 %108, 1
  %110 = add i32 %109, %106
  %111 = add i32 %104, %110
  %112 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %110, i32 17)
  %113 = xor i32 %111, %112
  %114 = add i32 %113, %111
  %115 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %113, i32 29)
  %116 = xor i32 %114, %115
  %117 = add i32 %116, %114
  %118 = tail call i32 @llvm.fshl.i32(i32 %116, i32 %116, i32 16)
  %119 = xor i32 %117, %118
  %120 = add i32 %119, %117
  %121 = add i32 %120, %108
  %122 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %119, i32 24)
  %123 = xor i32 %120, %122
  %124 = add i32 %90, 2
  %125 = add i32 %124, %123
  %126 = add i32 %121, %125
  %127 = tail call i32 @llvm.fshl.i32(i32 %125, i32 %125, i32 13)
  %128 = xor i32 %126, %127
  %129 = add i32 %128, %126
  %130 = tail call i32 @llvm.fshl.i32(i32 %128, i32 %128, i32 15)
  %131 = xor i32 %129, %130
  %132 = add i32 %131, %129
  %133 = tail call i32 @llvm.fshl.i32(i32 %131, i32 %131, i32 26)
  %134 = xor i32 %132, %133
  %135 = add i32 %134, %132
  %136 = add i32 %135, %90
  %137 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %134, i32 6)
  %138 = xor i32 %135, %137
  %139 = add i32 %91, 3
  %140 = add i32 %139, %138
  %141 = add i32 %136, %140
  %142 = tail call i32 @llvm.fshl.i32(i32 %140, i32 %140, i32 17)
  %143 = xor i32 %141, %142
  %144 = add i32 %143, %141
  %145 = tail call i32 @llvm.fshl.i32(i32 %143, i32 %143, i32 29)
  %146 = xor i32 %144, %145
  %147 = add i32 %146, %144
  %148 = tail call i32 @llvm.fshl.i32(i32 %146, i32 %146, i32 16)
  %149 = xor i32 %147, %148
  %150 = add i32 %149, %147
  %151 = add i32 %150, %91
  %152 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 24)
  %153 = xor i32 %150, %152
  %154 = add i32 %108, 4
  %155 = add i32 %154, %153
  %156 = add i32 %151, %155
  %157 = tail call i32 @llvm.fshl.i32(i32 %155, i32 %155, i32 13)
  %158 = xor i32 %156, %157
  %159 = add i32 %158, %156
  %160 = tail call i32 @llvm.fshl.i32(i32 %158, i32 %158, i32 15)
  %161 = xor i32 %159, %160
  %162 = add i32 %161, %159
  %163 = tail call i32 @llvm.fshl.i32(i32 %161, i32 %161, i32 26)
  %164 = xor i32 %162, %163
  %165 = add i32 %164, %162
  %166 = tail call i32 @llvm.fshl.i32(i32 %164, i32 %164, i32 6)
  %167 = xor i32 %165, %166
  %168 = add i32 %90, 5
  %169 = add i32 %168, %167
  br label %concatenate.48.3.merge

concatenate.48.3.merge:                           ; preds = %concatenate.pivot.2.93, %concatenate.pivot.0.
  %170 = phi i32 [ %84, %concatenate.pivot.0. ], [ %169, %concatenate.pivot.2.93 ]
  %171 = and i32 %0, 1
  %172 = and i32 %0, 2
  %cond = icmp eq i32 %172, 0
  %arg2.arg1 = select i1 %cond, ptr addrspace(1) %arg2102, ptr addrspace(1) %arg1100
  %173 = zext nneg i32 %1 to i64
  %174 = zext nneg i32 %171 to i64
  %175 = getelementptr inbounds [2 x [1 x [2 x i32]]], ptr addrspace(1) %arg2.arg1, i64 0, i64 %173, i64 0, i64 %174
  store i32 %170, ptr addrspace(1) %175, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg1) local_unnamed_addr #2 {
entry:
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !271
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 240
  br i1 %3, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %__nv_log1p.exit, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 119
  %.urem = add nsw i32 %linear_index, -120
  %.cmp42 = icmp ult i32 %linear_index, 120
  %4 = select i1 %.cmp42, i32 %linear_index, i32 %.urem
  %5 = zext i1 %.cmp to i64
  %6 = getelementptr inbounds [2 x [1 x [2 x i32]]], ptr addrspace(1) %arg044, i64 0, i64 %5, i64 0, i64 0
  %7 = load <2 x i32>, ptr addrspace(1) %6, align 8, !invariant.load !270
  %8 = extractelement <2 x i32> %7, i32 0
  %9 = extractelement <2 x i32> %7, i32 1
  %10 = add i32 %8, %4
  %11 = add nuw nsw i32 %4, 120
  %12 = add i32 %11, %9
  %13 = add i32 %10, %12
  %14 = tail call i32 @llvm.fshl.i32(i32 %12, i32 %12, i32 13)
  %15 = xor i32 %13, %14
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 15)
  %18 = xor i32 %16, %17
  %19 = add i32 %18, %16
  %20 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %18, i32 26)
  %21 = xor i32 %19, %20
  %22 = add i32 %21, %19
  %23 = add i32 %22, %9
  %24 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %21, i32 6)
  %25 = xor i32 %22, %24
  %26 = xor i32 %8, %9
  %27 = xor i32 %26, 466688986
  %28 = add i32 %27, 1
  %29 = add i32 %28, %25
  %30 = add i32 %23, %29
  %31 = tail call i32 @llvm.fshl.i32(i32 %29, i32 %29, i32 17)
  %32 = xor i32 %30, %31
  %33 = add i32 %32, %30
  %34 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %32, i32 29)
  %35 = xor i32 %33, %34
  %36 = add i32 %35, %33
  %37 = tail call i32 @llvm.fshl.i32(i32 %35, i32 %35, i32 16)
  %38 = xor i32 %36, %37
  %39 = add i32 %38, %36
  %40 = add i32 %39, %27
  %41 = tail call i32 @llvm.fshl.i32(i32 %38, i32 %38, i32 24)
  %42 = xor i32 %39, %41
  %43 = add i32 %8, 2
  %44 = add i32 %43, %42
  %45 = add i32 %40, %44
  %46 = tail call i32 @llvm.fshl.i32(i32 %44, i32 %44, i32 13)
  %47 = xor i32 %45, %46
  %48 = add i32 %47, %45
  %49 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 15)
  %50 = xor i32 %48, %49
  %51 = add i32 %50, %48
  %52 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 26)
  %53 = xor i32 %51, %52
  %54 = add i32 %53, %51
  %55 = add i32 %54, %8
  %56 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %53, i32 6)
  %57 = xor i32 %54, %56
  %58 = add i32 %9, 3
  %59 = add i32 %58, %57
  %60 = add i32 %55, %59
  %61 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 17)
  %62 = xor i32 %60, %61
  %63 = add i32 %62, %60
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 29)
  %65 = xor i32 %63, %64
  %66 = add i32 %65, %63
  %67 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 16)
  %68 = xor i32 %66, %67
  %69 = add i32 %68, %66
  %70 = add i32 %69, %9
  %71 = tail call i32 @llvm.fshl.i32(i32 %68, i32 %68, i32 24)
  %72 = xor i32 %69, %71
  %73 = add i32 %27, 4
  %74 = add i32 %73, %72
  %75 = add i32 %70, %74
  %76 = tail call i32 @llvm.fshl.i32(i32 %74, i32 %74, i32 13)
  %77 = xor i32 %75, %76
  %78 = add i32 %77, %75
  %79 = tail call i32 @llvm.fshl.i32(i32 %77, i32 %77, i32 15)
  %80 = xor i32 %78, %79
  %81 = add i32 %80, %78
  %82 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 26)
  %83 = xor i32 %81, %82
  %84 = add i32 %83, %81
  %85 = add i32 %84, %27
  %86 = zext i32 %85 to i64
  %87 = shl nuw i64 %86, 32
  %88 = tail call i32 @llvm.fshl.i32(i32 %83, i32 %83, i32 6)
  %89 = xor i32 %84, %88
  %90 = add i32 %8, 5
  %91 = add i32 %90, %89
  %92 = zext i32 %91 to i64
  %93 = or disjoint i64 %87, %92
  %94 = lshr i64 %93, 12
  %95 = or disjoint i64 %94, 4607182418800017408
  %96 = bitcast i64 %95 to double
  %add.4547.7 = fadd double %96, -1.000000e+00
  %multiply.3070.5 = fmul double %add.4547.7, 2.000000e+00
  %add.4548.3 = fadd double %multiply.3070.5, 0xBFEFFFFFFFFFFFFF
  %97 = fcmp ugt double %add.4548.3, 0xBFEFFFFFFFFFFFFF
  %maximum.49.3 = select i1 %97, double %add.4548.3, double 0xBFEFFFFFFFFFFFFF
  %98 = tail call double @llvm.fabs.f64(double %add.4548.3)
  %99 = fcmp oeq double %98, 1.000000e+00
  %compare.1188.3 = and i1 %97, %99
  %100 = fneg double %maximum.49.3
  %multiply.3072.7 = fmul double %maximum.49.3, %100
  %101 = tail call i32 @llvm.nvvm.d2i.hi(double %multiply.3072.7) #12
  %102 = bitcast i32 %101 to float
  %103 = fcmp olt float %102, 0x3FFCAAAAA0000000
  %104 = fcmp ogt float %102, 0xBFFB333320000000
  %or.cond.i = and i1 %103, %104
  br i1 %or.cond.i, label %105, label %122

105:                                              ; preds = %loop_multiply_fusion.in_bounds-true
  %106 = fadd double %multiply.3072.7, 2.000000e+00
  %107 = fdiv double %multiply.3072.7, %106
  %108 = fneg double %multiply.3072.7
  %109 = fmul double %107, %108
  %110 = fadd double %multiply.3072.7, %109
  %111 = fmul double %110, %110
  %112 = tail call double @llvm.fma.f64(double %111, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %113 = tail call double @llvm.fma.f64(double %112, double %111, double 0x3EF3B9FF890F468C)
  %114 = tail call double @llvm.fma.f64(double %113, double %111, double 0x3F17457EFD51BAF8)
  %115 = tail call double @llvm.fma.f64(double %114, double %111, double 0x3F3C71C8DE3CE825)
  %116 = tail call double @llvm.fma.f64(double %115, double %111, double 0x3F6249248FA4661F)
  %117 = tail call double @llvm.fma.f64(double %116, double %111, double 0x3F899999999D70C4)
  %118 = tail call double @llvm.fma.f64(double %117, double %111, double 0x3FB5555555555462)
  %119 = fmul double %111, %118
  %120 = tail call double @llvm.fma.f64(double %119, double %110, double %109)
  %121 = fadd double %multiply.3072.7, %120
  br label %__nv_log1p.exit

122:                                              ; preds = %loop_multiply_fusion.in_bounds-true
  %123 = fadd double %multiply.3072.7, 1.000000e+00
  %124 = tail call i32 @llvm.nvvm.d2i.hi(double %123) #12
  %125 = tail call i32 @llvm.nvvm.d2i.lo(double %123) #12
  %126 = icmp slt i32 %124, 1048576
  %127 = fmul double %123, 0x4350000000000000
  %128 = tail call i32 @llvm.nvvm.d2i.lo(double %127) #12
  %129 = tail call i32 @llvm.nvvm.d2i.hi(double %127) #12
  br i1 %126, label %130, label %131

130:                                              ; preds = %122
  br label %131

131:                                              ; preds = %130, %122
  %.0.i = phi double [ %127, %130 ], [ %123, %122 ]
  %ihi.i.0.i = phi i32 [ %129, %130 ], [ %124, %122 ]
  %ilo.i.0.i = phi i32 [ %128, %130 ], [ %125, %122 ]
  %e.i.0.i = phi i32 [ -1077, %130 ], [ -1023, %122 ]
  %132 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %132, 2146435071
  br i1 %or.cond2.i, label %133, label %180

133:                                              ; preds = %131
  %134 = lshr i32 %ihi.i.0.i, 20
  %135 = add nsw i32 %e.i.0.i, %134
  %136 = and i32 %ihi.i.0.i, 1048575
  %137 = or disjoint i32 %136, 1072693248
  %138 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %137) #12
  %139 = icmp ugt i32 %137, 1073127582
  %140 = tail call i32 @llvm.nvvm.d2i.lo(double %138) #12
  %141 = tail call i32 @llvm.nvvm.d2i.hi(double %138) #12
  %142 = add i32 %141, -1048576
  %143 = tail call double @llvm.nvvm.lohi.i2d(i32 %140, i32 %142) #12
  %spec.select = select i1 %139, double %143, double %138
  %144 = zext i1 %139 to i32
  %spec.select43 = add nsw i32 %135, %144
  %145 = fadd double %spec.select, -1.000000e+00
  %146 = fadd double %spec.select, 1.000000e+00
  %147 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %146) #12
  %148 = fneg double %146
  %149 = tail call double @llvm.fma.f64(double %148, double %147, double 1.000000e+00)
  %150 = tail call double @llvm.fma.f64(double %149, double %149, double %149)
  %151 = tail call double @llvm.fma.f64(double %150, double %147, double %147)
  %152 = fmul double %145, %151
  %153 = fadd double %152, %152
  %154 = fmul double %153, %153
  %155 = tail call double @llvm.fma.f64(double %154, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %156 = tail call double @llvm.fma.f64(double %155, double %154, double 0x3EF3B2669F02676F)
  %157 = tail call double @llvm.fma.f64(double %156, double %154, double 0x3F1745CBA9AB0956)
  %158 = tail call double @llvm.fma.f64(double %157, double %154, double 0x3F3C71C72D1B5154)
  %159 = tail call double @llvm.fma.f64(double %158, double %154, double 0x3F624924923BE72D)
  %160 = tail call double @llvm.fma.f64(double %159, double %154, double 0x3F8999999999A3C4)
  %161 = tail call double @llvm.fma.f64(double %160, double %154, double 0x3FB5555555555554)
  %162 = fsub double %145, %153
  %163 = fmul double %162, 2.000000e+00
  %164 = fneg double %153
  %165 = tail call double @llvm.fma.f64(double %164, double %145, double %163)
  %166 = fmul double %151, %165
  %167 = fmul double %154, %161
  %168 = tail call double @llvm.fma.f64(double %167, double %153, double %166)
  %169 = xor i32 %spec.select43, -2147483648
  %170 = tail call double @llvm.nvvm.lohi.i2d(i32 %169, i32 1127219200) #12
  %171 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %172 = fsub double %170, %171
  %173 = tail call double @llvm.fma.f64(double %172, double 0x3FE62E42FEFA39EF, double %153)
  %174 = fneg double %172
  %175 = tail call double @llvm.fma.f64(double %174, double 0x3FE62E42FEFA39EF, double %173)
  %176 = fsub double %175, %153
  %177 = fsub double %168, %176
  %178 = tail call double @llvm.fma.f64(double %172, double 0x3C7ABC9E3B39803F, double %177)
  %179 = fadd double %173, %178
  br label %__nv_log1p.exit

180:                                              ; preds = %131
  %181 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %182 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %183 = and i32 %182, 2147483647
  %184 = icmp eq i32 %183, 0
  %q.i.0.i = select i1 %184, double 0xFFF0000000000000, double %181
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %105, %133, %180
  %t.0.i = phi double [ %121, %105 ], [ %179, %133 ], [ %q.i.0.i, %180 ]
  %185 = fneg double %t.0.i
  %compare.1189.3 = fcmp ogt double %t.0.i, -6.250000e+00
  %compare.1190.3 = fcmp ogt double %t.0.i, -1.600000e+01
  %186 = select i1 %compare.1189.3, double 0x3F2879C2A212F024, double 0x4008ABCC380D5A48
  %187 = select i1 %compare.1189.3, double 0xBEED1D1F7B8736F6, double 0x3FF0158A6D641D39
  %188 = select i1 %compare.1189.3, double 0xBEB6E8A5434AE8A2, double 0x3F75FFCFE5B76AFC
  %189 = select i1 %compare.1190.3, double %188, double 0x4013664DDD1AD7FB
  %190 = select i1 %compare.1189.3, double 0x3E9C6B4F5D03B787, double 0xBF6EBADABB891BBD
  %191 = select i1 %compare.1190.3, double %190, double 0x3FF02A30D1FBA0DC
  %192 = select i1 %compare.1189.3, double 0xBE5F36CD6D3D46A9, double 0x3F6468EECA533CF8
  %193 = select i1 %compare.1190.3, double %192, double 0xBF222EA5DF04047C
  %194 = select i1 %compare.1189.3, double 0xBE31A9E38DC84D60, double 0xBF5BA924132F38B1
  %195 = select i1 %compare.1190.3, double %194, double 0xBF2C2F36A8FC5D53
  %196 = select i1 %compare.1189.3, double 0x3E120F47CCF46B3C, double 0x3F4F3CC55AD40C25
  %197 = select i1 %compare.1190.3, double %196, double 0x3F13EBF4EB00938F
  %198 = select i1 %compare.1189.3, double 0xBDCDC583D118A561, double 0xBF37448A89EF8AA3
  %199 = select i1 %compare.1190.3, double %198, double 0xBEF4A3497E1E0FAC
  %200 = select i1 %compare.1189.3, double 0xBDAC8859C4E5C0AF, double 0x3EF932CD54C8A222
  %201 = select i1 %compare.1190.3, double %200, double 0x3ED2FBD29D093D2B
  %202 = select i1 %compare.1189.3, double 0x3D872A22C2D77E20, double 0x3F11E684D0B9188A
  %203 = select i1 %compare.1190.3, double %202, double 0xBEB0A8D40EA372CC
  %204 = select i1 %compare.1189.3, double 0xBD36F2167040D8E2, double 0xBF08CEF1F80281F2
  %205 = select i1 %compare.1190.3, double %204, double 0x3E8EBC8BB824CB54
  %206 = select i1 %compare.1189.3, double 0xBD26D33EED66C487, double 0x3EEA29A0CACDFB23
  %207 = select i1 %compare.1190.3, double %206, double 0xBE722D220FDF9C3E
  %208 = select i1 %compare.1189.3, double 0x3CFDE4ACFD9E26BA, double 0x3EC8860CD5D652F6
  %209 = select i1 %compare.1190.3, double %208, double 0x3E5F4C20E1334AF8
  %210 = select i1 %compare.1189.3, double 0x3C782E11898132E0, double 0xBED0D5DB812B5083
  %211 = select i1 %compare.1190.3, double %210, double 0xBE50102E495FB9C0
  %212 = select i1 %compare.1189.3, double 0xBCA33689090A6B96, double 0x3EB936388A3790AD
  %213 = select i1 %compare.1190.3, double %212, double 0x3E405AC6A8FBA182
  %214 = select i1 %compare.1189.3, double 0x3C69BA72CD589B91, double 0x3E5395ABCD554C6C
  %215 = select i1 %compare.1190.3, double %214, double 0xBE30468FB24E2F5F
  %216 = select i1 %compare.1189.3, double 0x3C37B83EEF0B7C9F, double 0xBE92777453DD3955
  %217 = select i1 %compare.1190.3, double %216, double 0x3E19E6BF2DDA45E3
  %218 = select i1 %compare.1189.3, double 0xBC08DDF93324D327, double 0x3E785CBE52878635
  %219 = select i1 %compare.1190.3, double %218, double 0xBDF18FEEC0E38727
  %220 = select i1 %compare.1189.3, double 0xBBB135D2E746E627, double 0x3E23040F87DBD932
  %221 = select i1 %compare.1190.3, double %220, double 0xBDBDCEC3A7785389
  %add.4549.3 = fsub double -3.125000e+00, %t.0.i
  %222 = tail call double @llvm.sqrt.f64(double %185)
  %223 = select i1 %compare.1190.3, double 3.250000e+00, double 5.000000e+00
  %subtract.240.3 = fsub double %222, %223
  %224 = select i1 %compare.1189.3, double %add.4549.3, double %subtract.240.3
  %multiply.3073.65 = fmul double %221, %224
  %add.4550.63 = fadd double %219, %multiply.3073.65
  %multiply.3074.61 = fmul double %224, %add.4550.63
  %add.4551.59 = fadd double %217, %multiply.3074.61
  %multiply.3075.57 = fmul double %224, %add.4551.59
  %add.4552.55 = fadd double %215, %multiply.3075.57
  %multiply.3076.53 = fmul double %224, %add.4552.55
  %add.4553.51 = fadd double %213, %multiply.3076.53
  %multiply.3077.49 = fmul double %224, %add.4553.51
  %add.4554.47 = fadd double %211, %multiply.3077.49
  %multiply.3078.45 = fmul double %224, %add.4554.47
  %add.4555.43 = fadd double %209, %multiply.3078.45
  %multiply.3079.41 = fmul double %224, %add.4555.43
  %add.4556.39 = fadd double %207, %multiply.3079.41
  %multiply.3080.37 = fmul double %224, %add.4556.39
  %add.4557.35 = fadd double %205, %multiply.3080.37
  %multiply.3081.33 = fmul double %224, %add.4557.35
  %add.4558.31 = fadd double %203, %multiply.3081.33
  %multiply.3082.29 = fmul double %224, %add.4558.31
  %add.4559.27 = fadd double %201, %multiply.3082.29
  %multiply.3083.25 = fmul double %224, %add.4559.27
  %add.4560.23 = fadd double %199, %multiply.3083.25
  %multiply.3084.21 = fmul double %224, %add.4560.23
  %add.4561.19 = fadd double %197, %multiply.3084.21
  %multiply.3085.17 = fmul double %224, %add.4561.19
  %add.4562.15 = fadd double %195, %multiply.3085.17
  %multiply.3086.13 = fmul double %224, %add.4562.15
  %add.4563.11 = fadd double %193, %multiply.3086.13
  %multiply.3087.9 = fmul double %224, %add.4563.11
  %add.4564.7 = fadd double %191, %multiply.3087.9
  %multiply.3088.5 = fmul double %224, %add.4564.7
  %add.4565.5 = fadd double %189, %multiply.3088.5
  %multiply.3089.3 = fmul double %224, %add.4565.5
  %add.4566.3 = fadd double %187, %multiply.3089.3
  %225 = select i1 %compare.1190.3, double %add.4566.3, double %add.4565.5
  %multiply.3090.3 = fmul double %224, %225
  %add.4567.3 = fadd double %186, %multiply.3090.3
  %226 = select i1 %compare.1190.3, double %add.4567.3, double %add.4565.5
  %multiply.3091.1 = fmul double %224, %226
  %add.4568.3 = fadd double %multiply.3091.1, 0xBF4845769484FCA8
  %227 = select i1 %compare.1189.3, double %add.4568.3, double %226
  %multiply.3092.3 = fmul double %224, %227
  %add.4569.3 = fadd double %multiply.3092.3, 0xBF78B6C33114F909
  %228 = select i1 %compare.1189.3, double %add.4569.3, double %226
  %multiply.3093.3 = fmul double %224, %228
  %add.4570.3 = fadd double %multiply.3093.3, 0x3FCEBD80D9B13E28
  %229 = select i1 %compare.1189.3, double %add.4570.3, double %226
  %multiply.3094.1 = fmul double %224, %229
  %add.4571.3 = fadd double %multiply.3094.1, 0x3FFA755E7C99AE86
  %230 = select i1 %compare.1189.3, double %add.4571.3, double %226
  %.v = select i1 %compare.1188.3, double 0x7FF0000000000000, double %230
  %231 = fmul double %maximum.49.3, %.v
  %multiply.3096.1 = fmul double %231, 0x3FF6A09E667F3BCD
  %232 = zext nneg i32 %linear_index to i64
  %233 = getelementptr double, ptr addrspace(1) %arg146, i64 %232
  store double %multiply.3096.1, ptr addrspace(1) %233, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #4 {
entry:
  %arg163 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg061 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %3 = zext nneg i32 %2 to i64
  %param_0.531118 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %3
  %4 = load <2 x double>, ptr addrspace(1) %param_0.531118, align 16, !invariant.load !270
  %param_0.53111969 = extractelement <2 x double> %4, i32 0
  %param_0.531119.170 = extractelement <2 x double> %4, i32 1
  %multiply.3097.122 = fmul double %param_0.53111969, %param_0.53111969
  %multiply.3097.122.1 = fmul double %param_0.531119.170, %param_0.531119.170
  %add.3969.i50.1 = fadd double %multiply.3097.122, %multiply.3097.122.1
  %5 = or i32 %thread.id.x, 32
  %6 = icmp ult i32 %5, 60
  br i1 %6, label %loop3.loop_header13.preheader.1, label %x_in_tile-after.7

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

loop3.loop_header13.preheader.1:                  ; preds = %entry
  %7 = shl nuw nsw i32 %5, 1
  %8 = zext nneg i32 %7 to i64
  %param_0.531118.157 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %8
  %9 = load <2 x double>, ptr addrspace(1) %param_0.531118.157, align 16, !invariant.load !270
  %param_0.531119.15867 = extractelement <2 x double> %9, i32 0
  %param_0.531119.1.168 = extractelement <2 x double> %9, i32 1
  %multiply.3097.122.159 = fmul double %param_0.531119.15867, %param_0.531119.15867
  %add.3969.i50.160 = fadd double %add.3969.i50.1, %multiply.3097.122.159
  %multiply.3097.122.1.1 = fmul double %param_0.531119.1.168, %param_0.531119.1.168
  %add.3969.i50.1.1 = fadd double %add.3969.i50.160, %multiply.3097.122.1.1
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %loop3.loop_header13.preheader.1, %entry
  %partial_reduction_result.2.1 = phi double [ %add.3969.i50.1, %entry ], [ %add.3969.i50.1.1, %loop3.loop_header13.preheader.1 ]
  %10 = bitcast double %partial_reduction_result.2.1 to <2 x i32>
  %11 = extractelement <2 x i32> %10, i64 0
  %12 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %11, i32 16, i32 31)
  %13 = insertelement <2 x i32> poison, i32 %12, i64 0
  %14 = extractelement <2 x i32> %10, i64 1
  %15 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 16, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 1
  %17 = bitcast <2 x i32> %16 to double
  %add.3969.i = fadd double %partial_reduction_result.2.1, %17
  %18 = bitcast double %add.3969.i to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 8, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 8, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.3969.i46 = fadd double %add.3969.i, %25
  %26 = bitcast double %add.3969.i46 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 4, i32 31)
  %29 = insertelement <2 x i32> poison, i32 %28, i64 0
  %30 = extractelement <2 x i32> %26, i64 1
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 4, i32 31)
  %32 = insertelement <2 x i32> %29, i32 %31, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.3969.i47 = fadd double %add.3969.i46, %33
  %34 = bitcast double %add.3969.i47 to <2 x i32>
  %35 = extractelement <2 x i32> %34, i64 0
  %36 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %35, i32 2, i32 31)
  %37 = insertelement <2 x i32> poison, i32 %36, i64 0
  %38 = extractelement <2 x i32> %34, i64 1
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 2, i32 31)
  %40 = insertelement <2 x i32> %37, i32 %39, i64 1
  %41 = bitcast <2 x i32> %40 to double
  %add.3969.i48 = fadd double %add.3969.i47, %41
  %42 = bitcast double %add.3969.i48 to <2 x i32>
  %43 = extractelement <2 x i32> %42, i64 0
  %44 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 1, i32 31)
  %45 = extractelement <2 x i32> %42, i64 1
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 1, i32 31)
  %47 = icmp eq i32 %thread.id.2, 0
  %48 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %1, i64 0
  %49 = insertelement <2 x i32> poison, i32 %44, i64 0
  %50 = insertelement <2 x i32> %49, i32 %46, i64 1
  %51 = bitcast <2 x i32> %50 to double
  %add.3969.i49 = fadd double %add.3969.i48, %51
  br i1 %47, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %52 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg163, i64 0, i64 %1
  br i1 %52, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i49, ptr addrspace(3) %48, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %48, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #5

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #6

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_3(ptr noalias nocapture align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8
  %multiply.3098.1 = fmul double %5, 5.000000e-01
  %add.4572.1 = fsub double %multiply.3098.1, %3
  store double %add.4572.1, ptr addrspace(1) %4, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_5(ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 800
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_4(ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 640
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_3(ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 480
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_2(ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 320
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_1(ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 160
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice(ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !270
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr double, ptr addrspace(1) %arg14, i64 %6
  store double %5, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_98(ptr noalias nocapture writeonly align 128 dereferenceable(3200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.5795 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.5795, 0
  %4 = add i64 %param_2.5795, 10
  %5 = select i1 %3, i64 %4, i64 %param_2.5795
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 9)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.75625 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr inbounds [10 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.75625, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !275
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.22.in_bounds-true, label %loop_broadcast_fusion.22.in_bounds-after

loop_broadcast_fusion.22.in_bounds-after:         ; preds = %loop_broadcast_fusion.22.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.22.in_bounds-true:          ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.22.in_bounds-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_7(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #7 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %0 = icmp ult i32 %thread.id.x, 2
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi i8 [ %11, %x_in_tile-true ], [ 0, %entry ]
  %1 = zext nneg i8 %partial_reduction_result.0 to i32
  %2 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %1, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %3 = trunc i32 %2 to i8
  %4 = or i8 %partial_reduction_result.0, %3
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %5 = zext nneg i32 %thread.id.x to i64
  %param_2.4469 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.44692 = load i64, ptr addrspace(1) %param_2.4469, align 8, !invariant.load !270
  %6 = icmp slt i64 %param_2.44692, 10
  %param_1.5826 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg113, i64 0, i64 %5
  %param_1.58263 = load i8, ptr addrspace(1) %param_1.5826, align 1, !invariant.load !270
  %param_0.4123 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg011, i64 0, i64 %5
  %param_0.41234 = load i8, ptr addrspace(1) %param_0.4123, align 1, !invariant.load !270
  %7 = or i8 %param_0.41234, %param_1.58263
  %8 = trunc i8 %7 to i1
  %9 = xor i1 %8, true
  %10 = and i1 %6, %9
  %11 = zext i1 %10 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg317, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg347 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg041 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg143, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = trunc i64 %3 to i32
  %5 = getelementptr inbounds [2 x [2 x i32]], ptr addrspace(1) %arg041, i64 0, i64 %1, i64 0
  %6 = load <2 x i32>, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = extractelement <2 x i32> %6, i32 0
  %8 = extractelement <2 x i32> %6, i32 1
  %9 = add i32 %8, %4
  %10 = add i32 %9, %7
  %11 = tail call i32 @llvm.fshl.i32(i32 %9, i32 %9, i32 13)
  %12 = xor i32 %10, %11
  %13 = add i32 %12, %10
  %14 = tail call i32 @llvm.fshl.i32(i32 %12, i32 %12, i32 15)
  %15 = xor i32 %13, %14
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 26)
  %18 = xor i32 %16, %17
  %19 = add i32 %18, %16
  %20 = add i32 %19, %8
  %21 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %18, i32 6)
  %22 = xor i32 %19, %21
  %23 = xor i32 %7, %8
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
  %40 = add i32 %7, 2
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
  %52 = add i32 %51, %7
  %53 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 6)
  %54 = xor i32 %51, %53
  %55 = add i32 %8, 3
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
  %67 = add i32 %66, %8
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
  %82 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 6)
  %83 = xor i32 %81, %82
  %84 = add i32 %7, 5
  %85 = add i32 %84, %83
  %86 = add i32 %81, %24
  %87 = getelementptr i32, ptr addrspace(1) %arg245, i64 %1
  store i32 %85, ptr addrspace(1) %87, align 4
  %88 = getelementptr i32, ptr addrspace(1) %arg347, i64 %1
  store i32 %86, ptr addrspace(1) %88, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(48) %arg2) local_unnamed_addr #2 {
entry:
  %arg2103 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1101 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg099 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !278
  %.urem = add nsw i32 %0, -3
  %.cmp = icmp ult i32 %0, 3
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %.cmp98 = icmp ugt i32 %0, 2
  %2 = zext i1 %.cmp98 to i64
  %3 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg099, i64 0, i64 %2, i64 0
  %4 = load i32, ptr addrspace(1) %3, align 4, !invariant.load !270
  %5 = add i32 %4, %1
  %6 = add nuw nsw i32 %1, 3
  %7 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg1101, i64 0, i64 %2, i64 0
  %8 = load i32, ptr addrspace(1) %7, align 4, !invariant.load !270
  %9 = add i32 %8, %6
  %10 = add i32 %5, %9
  %11 = tail call i32 @llvm.fshl.i32(i32 %9, i32 %9, i32 13)
  %12 = xor i32 %10, %11
  %13 = add i32 %12, %10
  %14 = tail call i32 @llvm.fshl.i32(i32 %12, i32 %12, i32 15)
  %15 = xor i32 %13, %14
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 26)
  %18 = xor i32 %16, %17
  %19 = add i32 %18, %16
  %20 = add i32 %19, %8
  %21 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %18, i32 6)
  %22 = xor i32 %19, %21
  %23 = xor i32 %4, %8
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
  %40 = add i32 %4, 2
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
  %52 = add i32 %51, %4
  %53 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 6)
  %54 = xor i32 %51, %53
  %55 = add i32 %8, 3
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
  %67 = add i32 %66, %8
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
  %83 = zext nneg i32 %1 to i64
  %84 = getelementptr inbounds [2 x [6 x i32]], ptr addrspace(1) %arg2103, i64 0, i64 %2, i64 %83
  store i32 %82, ptr addrspace(1) %84, align 4
  %85 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 6)
  %86 = xor i32 %81, %85
  %87 = add i32 %4, 5
  %88 = add i32 %87, %86
  %89 = getelementptr inbounds i8, ptr addrspace(1) %84, i64 12
  store i32 %88, ptr addrspace(1) %89, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(48) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !268
  %1 = lshr i32 %0, 1
  %2 = or i32 %0, 2
  %3 = zext nneg i32 %1 to i64
  %4 = zext nneg i32 %2 to i64
  %5 = getelementptr inbounds [2 x [6 x i32]], ptr addrspace(1) %arg01, i64 0, i64 %3, i64 %4
  %6 = load i32, ptr addrspace(1) %5, align 4, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr i32, ptr addrspace(1) %arg13, i64 %7
  store i32 %6, ptr addrspace(1) %8, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_compare_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(48) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg5) local_unnamed_addr #2 {
entry:
  %arg5123 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4121 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3119 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2117 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0113 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [2 x [6 x i32]], ptr addrspace(1) %arg0113, i64 0, i64 %1, i64 0
  %3 = load <2 x i32>, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = extractelement <2 x i32> %3, i32 0
  %5 = extractelement <2 x i32> %3, i32 1
  %6 = add i32 %5, %4
  %7 = tail call i32 @llvm.fshl.i32(i32 %5, i32 %5, i32 13)
  %8 = xor i32 %6, %7
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.fshl.i32(i32 %8, i32 %8, i32 15)
  %11 = xor i32 %9, %10
  %12 = add i32 %11, %9
  %13 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %11, i32 26)
  %14 = xor i32 %12, %13
  %15 = add i32 %14, %12
  %16 = add i32 %15, %5
  %17 = tail call i32 @llvm.fshl.i32(i32 %14, i32 %14, i32 6)
  %18 = xor i32 %15, %17
  %19 = xor i32 %4, %5
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
  %36 = add i32 %4, 2
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
  %48 = add i32 %47, %4
  %49 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 6)
  %50 = xor i32 %47, %49
  %51 = add i32 %5, 3
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
  %63 = add i32 %62, %5
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
  %77 = add i32 %74, %20
  %78 = add i32 %77, %76
  %79 = lshr i32 %78, 9
  %80 = or disjoint i32 %79, 1065353216
  %81 = bitcast i32 %80 to float
  %add.4378.5 = fadd float %81, -1.000000e+00
  %82 = tail call float @llvm.maximum.f32(float %add.4378.5, float 0.000000e+00)
  %compare.1169.3 = fcmp uge float %82, 5.000000e-01
  %83 = select i1 %compare.1169.3, i64 -1, i64 1
  %84 = zext i1 %compare.1169.3 to i8
  %85 = getelementptr i64, ptr addrspace(1) %arg1115, i64 %1
  %86 = load i64, ptr addrspace(1) %85, align 8, !invariant.load !270
  %87 = and i64 %86, 32
  %88 = and i64 %86, 16
  %89 = and i64 %86, 8
  %90 = and i64 %86, 4
  %91 = and i64 %86, 2
  %92 = and i64 %86, 1
  %.not112 = icmp eq i64 %92, 0
  %93 = select i1 %.not112, i64 1, i64 2
  %94 = shl nuw nsw i64 %93, %91
  %95 = shl nuw nsw i64 %94, %90
  %96 = shl nuw nsw i64 %95, %89
  %97 = shl nuw nsw i64 %96, %88
  %98 = shl nuw i64 %97, %87
  %99 = getelementptr i64, ptr addrspace(1) %arg2117, i64 %1
  store i64 %83, ptr addrspace(1) %99, align 8
  %100 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg3119, i64 0, i64 %1
  store i8 %84, ptr addrspace(1) %100, align 1
  %101 = getelementptr i64, ptr addrspace(1) %arg4121, i64 %1
  store i64 %98, ptr addrspace(1) %101, align 8
  %102 = getelementptr i64, ptr addrspace(1) %arg5123, i64 %1
  store i64 0, ptr addrspace(1) %102, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_7(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg38, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg39, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg40, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg45, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg46, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg47, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg48, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg49, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg50, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg51, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg52, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg53, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg54) local_unnamed_addr #2 {
entry:
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
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg212, i64 0, i64 %1
  %3 = load i8, ptr addrspace(1) %2, align 1, !invariant.load !270
  %4 = zext nneg i32 %0 to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = getelementptr double, ptr addrspace(1) %arg110, i64 %4
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !270
  %9 = trunc i8 %3 to i1
  %10 = select i1 %9, double %6, double %8
  %11 = getelementptr double, ptr addrspace(1) %arg314, i64 %4
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %13 = getelementptr double, ptr addrspace(1) %arg416, i64 %4
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !270
  %15 = select i1 %9, double %12, double %14
  %16 = getelementptr double, ptr addrspace(1) %arg518, i64 %4
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !270
  %18 = getelementptr double, ptr addrspace(1) %arg620, i64 %4
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !270
  %20 = select i1 %9, double %17, double %19
  %21 = getelementptr double, ptr addrspace(1) %arg722, i64 %4
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !270
  %23 = getelementptr double, ptr addrspace(1) %arg824, i64 %4
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !270
  %25 = select i1 %9, double %22, double %24
  %26 = getelementptr double, ptr addrspace(1) %arg926, i64 %4
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !270
  %28 = getelementptr double, ptr addrspace(1) %arg1028, i64 %4
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !270
  %30 = select i1 %9, double %27, double %29
  %31 = getelementptr double, ptr addrspace(1) %arg1130, i64 %4
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !270
  %33 = getelementptr double, ptr addrspace(1) %arg1232, i64 %4
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !270
  %35 = select i1 %9, double %32, double %34
  %36 = getelementptr double, ptr addrspace(1) %arg1334, i64 %4
  %37 = load double, ptr addrspace(1) %36, align 8, !invariant.load !270
  %38 = getelementptr double, ptr addrspace(1) %arg1436, i64 %4
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !270
  %40 = select i1 %9, double %37, double %39
  %41 = getelementptr double, ptr addrspace(1) %arg1538, i64 %4
  %42 = load double, ptr addrspace(1) %41, align 8, !invariant.load !270
  %43 = getelementptr double, ptr addrspace(1) %arg1640, i64 %4
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !270
  %45 = select i1 %9, double %42, double %44
  %46 = getelementptr double, ptr addrspace(1) %arg1742, i64 %4
  %47 = load double, ptr addrspace(1) %46, align 8, !invariant.load !270
  %48 = getelementptr double, ptr addrspace(1) %arg1844, i64 %4
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !270
  %50 = select i1 %9, double %47, double %49
  %51 = getelementptr double, ptr addrspace(1) %arg1946, i64 %4
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !270
  %53 = getelementptr double, ptr addrspace(1) %arg2048, i64 %4
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !270
  %55 = select i1 %9, double %52, double %54
  %56 = getelementptr double, ptr addrspace(1) %arg2150, i64 %4
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !270
  %58 = getelementptr double, ptr addrspace(1) %arg2252, i64 %4
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !270
  %60 = select i1 %9, double %57, double %59
  %61 = getelementptr double, ptr addrspace(1) %arg2354, i64 %4
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !270
  %63 = getelementptr double, ptr addrspace(1) %arg2456, i64 %4
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !270
  %65 = select i1 %9, double %62, double %64
  %66 = getelementptr double, ptr addrspace(1) %arg2558, i64 %4
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !270
  %68 = getelementptr double, ptr addrspace(1) %arg2660, i64 %4
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !270
  %70 = select i1 %9, double %67, double %69
  %71 = getelementptr double, ptr addrspace(1) %arg2762, i64 %4
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !270
  %73 = getelementptr double, ptr addrspace(1) %arg2864, i64 %4
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !270
  %75 = select i1 %9, double %72, double %74
  %76 = getelementptr double, ptr addrspace(1) %arg2966, i64 %4
  %77 = load double, ptr addrspace(1) %76, align 8, !invariant.load !270
  %78 = getelementptr double, ptr addrspace(1) %arg3068, i64 %4
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !270
  %80 = select i1 %9, double %77, double %79
  %81 = getelementptr double, ptr addrspace(1) %arg3170, i64 %4
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !270
  %83 = getelementptr double, ptr addrspace(1) %arg3272, i64 %4
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !270
  %85 = select i1 %9, double %82, double %84
  %86 = getelementptr double, ptr addrspace(1) %arg3374, i64 %4
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !270
  %88 = getelementptr double, ptr addrspace(1) %arg3476, i64 %4
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !270
  %90 = select i1 %9, double %87, double %89
  %91 = getelementptr double, ptr addrspace(1) %arg3578, i64 %4
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !270
  %93 = getelementptr double, ptr addrspace(1) %arg3680, i64 %4
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !270
  %95 = select i1 %9, double %92, double %94
  %96 = getelementptr double, ptr addrspace(1) %arg3782, i64 %4
  store double %10, ptr addrspace(1) %96, align 8
  %97 = getelementptr double, ptr addrspace(1) %arg3884, i64 %4
  store double %15, ptr addrspace(1) %97, align 8
  %98 = getelementptr double, ptr addrspace(1) %arg3986, i64 %4
  store double %20, ptr addrspace(1) %98, align 8
  %99 = getelementptr double, ptr addrspace(1) %arg4088, i64 %4
  store double %25, ptr addrspace(1) %99, align 8
  %100 = getelementptr double, ptr addrspace(1) %arg4190, i64 %4
  store double %30, ptr addrspace(1) %100, align 8
  %101 = getelementptr double, ptr addrspace(1) %arg4292, i64 %4
  store double %35, ptr addrspace(1) %101, align 8
  %102 = getelementptr double, ptr addrspace(1) %arg4394, i64 %4
  store double %40, ptr addrspace(1) %102, align 8
  %103 = getelementptr double, ptr addrspace(1) %arg4496, i64 %4
  store double %45, ptr addrspace(1) %103, align 8
  %104 = getelementptr double, ptr addrspace(1) %arg4598, i64 %4
  store double %50, ptr addrspace(1) %104, align 8
  %105 = getelementptr double, ptr addrspace(1) %arg46100, i64 %4
  store double %55, ptr addrspace(1) %105, align 8
  %106 = getelementptr double, ptr addrspace(1) %arg47102, i64 %4
  store double %60, ptr addrspace(1) %106, align 8
  %107 = getelementptr double, ptr addrspace(1) %arg48104, i64 %4
  store double %65, ptr addrspace(1) %107, align 8
  %108 = getelementptr double, ptr addrspace(1) %arg49106, i64 %4
  store double %70, ptr addrspace(1) %108, align 8
  %109 = getelementptr double, ptr addrspace(1) %arg50108, i64 %4
  store double %75, ptr addrspace(1) %109, align 8
  %110 = getelementptr double, ptr addrspace(1) %arg51110, i64 %4
  store double %80, ptr addrspace(1) %110, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg52112, i64 %4
  store double %85, ptr addrspace(1) %111, align 8
  %112 = getelementptr double, ptr addrspace(1) %arg53114, i64 %4
  store double %90, ptr addrspace(1) %112, align 8
  %113 = getelementptr double, ptr addrspace(1) %arg54116, i64 %4
  store double %95, ptr addrspace(1) %113, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg6) local_unnamed_addr #4 {
entry:
  %arg6128 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5126 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4124 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3122 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2120 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0116 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %3 = icmp ult i32 %thread.id.2, 30
  br i1 %3, label %concatenate.pivot.20.46, label %concatenate.pivot.60.52

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

loop3.loop_header21.preheader.1:                  ; preds = %concatenate.43.1.merge26.1
  %4 = shl nuw nsw i32 %81, 1
  %5 = icmp ult i32 %81, 40
  br i1 %5, label %concatenate.pivot.60.52.1101, label %concatenate.pivot.100.53.195

concatenate.pivot.100.53.195:                     ; preds = %loop3.loop_header21.preheader.1
  %6 = icmp ult i32 %81, 50
  br i1 %6, label %concatenate.pivot.80.54.199, label %concatenate.pivot.100.55.197

concatenate.pivot.100.55.197:                     ; preds = %concatenate.pivot.100.53.195
  %7 = sext i32 %4 to i64
  %8 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg5126, i64 0, i64 %1, i64 %7
  %param_5.212643.196130 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 -800
  br label %concatenate.43.1.merge26.1113

concatenate.pivot.80.54.199:                      ; preds = %concatenate.pivot.100.53.195
  %9 = add nsw i32 %4, -80
  %10 = zext nneg i32 %9 to i64
  %param_4.262140.198 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4124, i64 0, i64 %1, i64 %10
  br label %concatenate.43.1.merge26.1113

concatenate.pivot.60.52.1101:                     ; preds = %loop3.loop_header21.preheader.1
  %11 = add nsw i32 %4, -60
  %12 = zext nneg i32 %11 to i64
  %param_3.370337.1100 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg3122, i64 0, i64 %1, i64 %12
  br label %concatenate.43.1.merge26.1113

concatenate.43.1.merge26.1113:                    ; preds = %concatenate.pivot.60.52.1101, %concatenate.pivot.80.54.199, %concatenate.pivot.100.55.197
  %.in.1110 = phi ptr addrspace(1) [ %param_3.370337.1100, %concatenate.pivot.60.52.1101 ], [ %param_4.262140.198, %concatenate.pivot.80.54.199 ], [ %param_5.212643.196130, %concatenate.pivot.100.55.197 ]
  %13 = icmp ult i32 %81, 40
  %14 = load double, ptr addrspace(1) %.in.1110, align 8, !invariant.load !270
  %multiply.3060.156.1111 = fmul double %14, %14
  %add.3969.i87.1112 = fadd double %add.3969.i87.1, %multiply.3060.156.1111
  br i1 %13, label %concatenate.pivot.60.52.1.1, label %concatenate.pivot.100.53.1.1

concatenate.pivot.100.53.1.1:                     ; preds = %concatenate.43.1.merge26.1113
  %15 = icmp ult i32 %81, 50
  br i1 %15, label %concatenate.pivot.80.54.1.1, label %concatenate.pivot.100.55.1.1

concatenate.pivot.100.55.1.1:                     ; preds = %concatenate.pivot.100.53.1.1
  %16 = sext i32 %4 to i64
  %17 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg5126, i64 0, i64 %1, i64 %16
  %param_5.212643.1.1131 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 -792
  br label %concatenate.43.1.merge26.1.1

concatenate.pivot.80.54.1.1:                      ; preds = %concatenate.pivot.100.53.1.1
  %18 = add nsw i32 %4, -79
  %19 = zext nneg i32 %18 to i64
  %param_4.262140.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4124, i64 0, i64 %1, i64 %19
  br label %concatenate.43.1.merge26.1.1

concatenate.pivot.60.52.1.1:                      ; preds = %concatenate.43.1.merge26.1113
  %20 = add nsw i32 %4, -59
  %21 = zext nneg i32 %20 to i64
  %param_3.370337.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg3122, i64 0, i64 %1, i64 %21
  br label %concatenate.43.1.merge26.1.1

concatenate.43.1.merge26.1.1:                     ; preds = %concatenate.pivot.60.52.1.1, %concatenate.pivot.80.54.1.1, %concatenate.pivot.100.55.1.1
  %.in.1.1 = phi ptr addrspace(1) [ %param_3.370337.1.1, %concatenate.pivot.60.52.1.1 ], [ %param_4.262140.1.1, %concatenate.pivot.80.54.1.1 ], [ %param_5.212643.1.1131, %concatenate.pivot.100.55.1.1 ]
  %22 = load double, ptr addrspace(1) %.in.1.1, align 8, !invariant.load !270
  %multiply.3060.156.1.1 = fmul double %22, %22
  %add.3969.i87.1.1 = fadd double %add.3969.i87.1112, %multiply.3060.156.1.1
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %concatenate.43.1.merge26.1.1, %concatenate.43.1.merge26.1
  %partial_reduction_result.2.1 = phi double [ %add.3969.i87.1, %concatenate.43.1.merge26.1 ], [ %add.3969.i87.1.1, %concatenate.43.1.merge26.1.1 ]
  %23 = bitcast double %partial_reduction_result.2.1 to <2 x i32>
  %24 = extractelement <2 x i32> %23, i64 0
  %25 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %24, i32 16, i32 31)
  %26 = insertelement <2 x i32> poison, i32 %25, i64 0
  %27 = extractelement <2 x i32> %23, i64 1
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 16, i32 31)
  %29 = insertelement <2 x i32> %26, i32 %28, i64 1
  %30 = bitcast <2 x i32> %29 to double
  %add.3969.i = fadd double %partial_reduction_result.2.1, %30
  %31 = bitcast double %add.3969.i to <2 x i32>
  %32 = extractelement <2 x i32> %31, i64 0
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 8, i32 31)
  %34 = insertelement <2 x i32> poison, i32 %33, i64 0
  %35 = extractelement <2 x i32> %31, i64 1
  %36 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %35, i32 8, i32 31)
  %37 = insertelement <2 x i32> %34, i32 %36, i64 1
  %38 = bitcast <2 x i32> %37 to double
  %add.3969.i83 = fadd double %add.3969.i, %38
  %39 = bitcast double %add.3969.i83 to <2 x i32>
  %40 = extractelement <2 x i32> %39, i64 0
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 4, i32 31)
  %42 = insertelement <2 x i32> poison, i32 %41, i64 0
  %43 = extractelement <2 x i32> %39, i64 1
  %44 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 4, i32 31)
  %45 = insertelement <2 x i32> %42, i32 %44, i64 1
  %46 = bitcast <2 x i32> %45 to double
  %add.3969.i84 = fadd double %add.3969.i83, %46
  %47 = bitcast double %add.3969.i84 to <2 x i32>
  %48 = extractelement <2 x i32> %47, i64 0
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 2, i32 31)
  %50 = insertelement <2 x i32> poison, i32 %49, i64 0
  %51 = extractelement <2 x i32> %47, i64 1
  %52 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %51, i32 2, i32 31)
  %53 = insertelement <2 x i32> %50, i32 %52, i64 1
  %54 = bitcast <2 x i32> %53 to double
  %add.3969.i85 = fadd double %add.3969.i84, %54
  %55 = bitcast double %add.3969.i85 to <2 x i32>
  %56 = extractelement <2 x i32> %55, i64 0
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 1, i32 31)
  %58 = extractelement <2 x i32> %55, i64 1
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 1, i32 31)
  %60 = icmp eq i32 %thread.id.2, 0
  %61 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 %1, i64 0
  %62 = insertelement <2 x i32> poison, i32 %57, i64 0
  %63 = insertelement <2 x i32> %62, i32 %59, i64 1
  %64 = bitcast <2 x i32> %63 to double
  %add.3969.i86 = fadd double %add.3969.i85, %64
  br i1 %60, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

concatenate.pivot.20.46:                          ; preds = %entry
  %65 = icmp ult i32 %thread.id.2, 10
  br i1 %65, label %concatenate.43.1.merge26, label %concatenate.pivot.40.48

concatenate.pivot.40.48:                          ; preds = %concatenate.pivot.20.46
  %66 = icmp ult i32 %thread.id.2, 20
  br i1 %66, label %concatenate.pivot.20.49, label %concatenate.pivot.40.50

concatenate.pivot.20.49:                          ; preds = %concatenate.pivot.40.48
  %67 = add nsw i32 %2, -20
  br label %concatenate.43.1.merge26

concatenate.pivot.40.50:                          ; preds = %concatenate.pivot.40.48
  %68 = add nsw i32 %2, -40
  br label %concatenate.43.1.merge26

concatenate.pivot.60.52:                          ; preds = %entry
  %69 = add nsw i32 %2, -60
  br label %concatenate.43.1.merge26

concatenate.43.1.merge26:                         ; preds = %concatenate.pivot.20.46, %concatenate.pivot.60.52, %concatenate.pivot.40.50, %concatenate.pivot.20.49
  %.sink114 = phi i32 [ %69, %concatenate.pivot.60.52 ], [ %68, %concatenate.pivot.40.50 ], [ %67, %concatenate.pivot.20.49 ], [ %2, %concatenate.pivot.20.46 ]
  %arg3.sink = phi ptr addrspace(1) [ %arg3122, %concatenate.pivot.60.52 ], [ %arg2120, %concatenate.pivot.40.50 ], [ %arg1118, %concatenate.pivot.20.49 ], [ %arg0116, %concatenate.pivot.20.46 ]
  %70 = icmp ult i32 %thread.id.2, 30
  %71 = zext nneg i32 %.sink114 to i64
  %param_3.370337 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg3.sink, i64 0, i64 %1, i64 %71
  %72 = load double, ptr addrspace(1) %param_3.370337, align 8, !invariant.load !270
  %multiply.3060.156 = fmul double %72, %72
  br i1 %70, label %concatenate.pivot.20.46.1, label %concatenate.pivot.60.52.1

concatenate.pivot.60.52.1:                        ; preds = %concatenate.43.1.merge26
  %73 = add nsw i32 %2, -59
  br label %concatenate.43.1.merge26.1

concatenate.pivot.20.46.1:                        ; preds = %concatenate.43.1.merge26
  %74 = or disjoint i32 %2, 1
  %75 = icmp ult i32 %thread.id.2, 10
  br i1 %75, label %concatenate.43.1.merge26.1, label %concatenate.pivot.40.48.1

concatenate.pivot.40.48.1:                        ; preds = %concatenate.pivot.20.46.1
  %76 = icmp ult i32 %thread.id.2, 20
  br i1 %76, label %concatenate.pivot.20.49.1, label %concatenate.pivot.40.50.1

concatenate.pivot.40.50.1:                        ; preds = %concatenate.pivot.40.48.1
  %77 = add nsw i32 %2, -39
  br label %concatenate.43.1.merge26.1

concatenate.pivot.20.49.1:                        ; preds = %concatenate.pivot.40.48.1
  %78 = add nsw i32 %2, -19
  br label %concatenate.43.1.merge26.1

concatenate.43.1.merge26.1:                       ; preds = %concatenate.pivot.20.46.1, %concatenate.pivot.20.49.1, %concatenate.pivot.40.50.1, %concatenate.pivot.60.52.1
  %.sink115 = phi i32 [ %78, %concatenate.pivot.20.49.1 ], [ %77, %concatenate.pivot.40.50.1 ], [ %73, %concatenate.pivot.60.52.1 ], [ %74, %concatenate.pivot.20.46.1 ]
  %arg0.sink = phi ptr addrspace(1) [ %arg1118, %concatenate.pivot.20.49.1 ], [ %arg2120, %concatenate.pivot.40.50.1 ], [ %arg3122, %concatenate.pivot.60.52.1 ], [ %arg0116, %concatenate.pivot.20.46.1 ]
  %79 = zext nneg i32 %.sink115 to i64
  %param_0.410028.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg0.sink, i64 0, i64 %1, i64 %79
  %80 = load double, ptr addrspace(1) %param_0.410028.1, align 8, !invariant.load !270
  %multiply.3060.156.1 = fmul double %80, %80
  %add.3969.i87.1 = fadd double %multiply.3060.156, %multiply.3060.156.1
  %81 = or i32 %thread.id.x, 32
  %82 = icmp ult i32 %81, 60
  br i1 %82, label %loop3.loop_header21.preheader.1, label %x_in_tile-after.7

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %83 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg6128, i64 0, i64 %1
  br i1 %83, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i86, ptr addrspace(3) %61, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %61, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_minimum_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg8) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = getelementptr i8, ptr addrspace(1) %arg25, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !270
  %6 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !270
  %8 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %10 = trunc i8 %5 to i1
  %11 = select i1 %10, double %7, double %9
  %12 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !270
  %multiply.3061.1.clone.1 = fmul double %13, 5.000000e-01
  %add.4379.1.clone.1 = fsub double %multiply.3061.1.clone.1, %11
  %subtract.235.1.clone.1 = fsub double %3, %add.4379.1.clone.1
  %compare.1172.1.clone.1 = fcmp uno double %subtract.235.1.clone.1, 0.000000e+00
  %14 = select i1 %compare.1172.1.clone.1, double 0xFFF0000000000000, double %subtract.235.1.clone.1
  %15 = fcmp ole double %14, 0.000000e+00
  %minimum.9.1 = select i1 %15, double %14, double 0.000000e+00
  %16 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %minimum.9.1, ptr addrspace(1) %16, align 8
  %17 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %14, ptr addrspace(1) %17, align 8
  %18 = getelementptr double, ptr addrspace(1) %arg715, i64 %1
  store double %add.4379.1.clone.1, ptr addrspace(1) %18, align 8
  %19 = getelementptr double, ptr addrspace(1) %arg817, i64 %1
  store double %11, ptr addrspace(1) %19, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg4) local_unnamed_addr #7 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %0 = icmp ult i32 %thread.id.x, 2
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi i8 [ %11, %x_in_tile-true ], [ 0, %entry ]
  %1 = zext nneg i8 %partial_reduction_result.0 to i32
  %2 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %1, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %3 = trunc i32 %2 to i8
  %4 = or i8 %partial_reduction_result.0, %3
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %5 = zext nneg i32 %thread.id.x to i64
  %param_2.2846 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg216, i64 0, i64 %5
  %param_2.28462 = load i64, ptr addrspace(1) %param_2.2846, align 8, !invariant.load !270
  %param_3.2445 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg318, i64 0, i64 %5
  %param_3.24453 = load i64, ptr addrspace(1) %param_3.2445, align 8, !invariant.load !270
  %6 = icmp slt i64 %param_2.28462, %param_3.24453
  %param_1.3532 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg114, i64 0, i64 %5
  %param_1.35324 = load i8, ptr addrspace(1) %param_1.3532, align 1, !invariant.load !270
  %param_0.2462 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg012, i64 0, i64 %5
  %param_0.24625 = load i8, ptr addrspace(1) %param_0.2462, align 1, !invariant.load !270
  %7 = or i8 %param_0.24625, %param_1.35324
  %8 = trunc i8 %7 to i1
  %9 = xor i1 %8, true
  %10 = and i1 %6, %9
  %11 = zext i1 %10 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg420, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_concatenate_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg13) local_unnamed_addr #8 {
entry:
  %arg1347 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1245 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1143 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1041 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg939 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg837 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg735 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg633 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg531 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg429 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg327 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg225 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg123 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg021 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !271
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw i32 %linear_index to i8
  %3 = udiv i8 %.lhs.trunc, 120
  %4 = mul i8 %3, 120
  %.decomposed = sub i8 %.lhs.trunc, %4
  %.zext = zext nneg i8 %.decomposed to i32
  %.zext18 = zext nneg i8 %3 to i32
  %5 = icmp ult i32 %linear_index, 240
  br i1 %5, label %loop_concatenate_fusion.1.in_bounds-true, label %loop_concatenate_fusion.1.in_bounds-after

loop_concatenate_fusion.1.in_bounds-after:        ; preds = %concatenate.37.1.merge, %entry
  ret void

loop_concatenate_fusion.1.in_bounds-true:         ; preds = %entry
  %6 = icmp ult i8 %.decomposed, 60
  br i1 %6, label %concatenate.pivot.20., label %concatenate.pivot.80.

concatenate.pivot.20.:                            ; preds = %loop_concatenate_fusion.1.in_bounds-true
  %7 = icmp ult i8 %.decomposed, 20
  br i1 %7, label %concatenate.pivot.0., label %concatenate.pivot.40.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.20.
  %8 = mul nuw nsw i32 %.zext18, 20
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr double, ptr addrspace(1) %arg225, i64 %9
  %11 = zext nneg i8 %.decomposed to i64
  %12 = getelementptr inbounds double, ptr addrspace(1) %10, i64 %11
  %13 = zext nneg i8 %3 to i64
  %14 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1245, i64 0, i64 %13
  %15 = load i64, ptr addrspace(1) %14, align 8, !invariant.load !270
  %16 = getelementptr double, ptr addrspace(1) %arg327, i64 %9
  %17 = getelementptr inbounds double, ptr addrspace(1) %16, i64 %11
  br label %concatenate.37.1.merge

concatenate.pivot.40.:                            ; preds = %concatenate.pivot.20.
  %18 = icmp ult i8 %.decomposed, 40
  %19 = mul nuw nsw i32 %.zext18, 20
  %20 = zext nneg i32 %19 to i64
  %21 = zext nneg i8 %3 to i64
  %22 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1245, i64 0, i64 %21
  %23 = load i64, ptr addrspace(1) %22, align 8, !invariant.load !270
  br i1 %18, label %concatenate.pivot.20.11, label %concatenate.pivot.40.12

concatenate.pivot.20.11:                          ; preds = %concatenate.pivot.40.
  %24 = add nsw i32 %.zext, -20
  %25 = getelementptr double, ptr addrspace(1) %arg021, i64 %20
  %26 = zext nneg i32 %24 to i64
  %27 = getelementptr inbounds double, ptr addrspace(1) %25, i64 %26
  %28 = getelementptr double, ptr addrspace(1) %arg123, i64 %20
  %29 = getelementptr inbounds double, ptr addrspace(1) %28, i64 %26
  br label %concatenate.37.1.merge

concatenate.pivot.40.12:                          ; preds = %concatenate.pivot.40.
  %30 = add nsw i32 %.zext, -40
  %31 = getelementptr double, ptr addrspace(1) %arg429, i64 %20
  %32 = zext nneg i32 %30 to i64
  %33 = getelementptr inbounds double, ptr addrspace(1) %31, i64 %32
  %34 = getelementptr double, ptr addrspace(1) %arg531, i64 %20
  %35 = getelementptr inbounds double, ptr addrspace(1) %34, i64 %32
  br label %concatenate.37.1.merge

concatenate.pivot.80.:                            ; preds = %loop_concatenate_fusion.1.in_bounds-true
  %36 = icmp ult i8 %.decomposed, 80
  %37 = mul nuw nsw i32 %.zext18, 20
  %38 = zext nneg i32 %37 to i64
  br i1 %36, label %concatenate.pivot.60.13, label %concatenate.pivot.100.

concatenate.pivot.60.13:                          ; preds = %concatenate.pivot.80.
  %39 = add nsw i32 %.zext, -60
  %40 = getelementptr double, ptr addrspace(1) %arg633, i64 %38
  %41 = zext nneg i32 %39 to i64
  %42 = getelementptr inbounds double, ptr addrspace(1) %40, i64 %41
  %43 = zext nneg i8 %3 to i64
  %44 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1245, i64 0, i64 %43
  %45 = load i64, ptr addrspace(1) %44, align 8, !invariant.load !270
  %46 = getelementptr double, ptr addrspace(1) %arg735, i64 %38
  %47 = getelementptr inbounds double, ptr addrspace(1) %46, i64 %41
  br label %concatenate.37.1.merge

concatenate.pivot.100.:                           ; preds = %concatenate.pivot.80.
  %48 = icmp ult i8 %.decomposed, 100
  %49 = zext nneg i8 %3 to i64
  %50 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1245, i64 0, i64 %49
  %51 = load i64, ptr addrspace(1) %50, align 8, !invariant.load !270
  br i1 %48, label %concatenate.pivot.80.14, label %concatenate.pivot.100.15

concatenate.pivot.80.14:                          ; preds = %concatenate.pivot.100.
  %52 = add nsw i32 %.zext, -80
  %53 = getelementptr double, ptr addrspace(1) %arg837, i64 %38
  %54 = zext nneg i32 %52 to i64
  %55 = getelementptr inbounds double, ptr addrspace(1) %53, i64 %54
  %56 = getelementptr double, ptr addrspace(1) %arg939, i64 %38
  %57 = getelementptr inbounds double, ptr addrspace(1) %56, i64 %54
  br label %concatenate.37.1.merge

concatenate.pivot.100.15:                         ; preds = %concatenate.pivot.100.
  %58 = add nsw i32 %.zext, -100
  %59 = getelementptr double, ptr addrspace(1) %arg1041, i64 %38
  %60 = zext nneg i32 %58 to i64
  %61 = getelementptr inbounds double, ptr addrspace(1) %59, i64 %60
  %62 = getelementptr double, ptr addrspace(1) %arg1143, i64 %38
  %63 = getelementptr inbounds double, ptr addrspace(1) %62, i64 %60
  br label %concatenate.37.1.merge

concatenate.37.1.merge:                           ; preds = %concatenate.pivot.100.15, %concatenate.pivot.80.14, %concatenate.pivot.60.13, %concatenate.pivot.40.12, %concatenate.pivot.20.11, %concatenate.pivot.0.
  %.sink20 = phi ptr addrspace(1) [ %63, %concatenate.pivot.100.15 ], [ %57, %concatenate.pivot.80.14 ], [ %47, %concatenate.pivot.60.13 ], [ %35, %concatenate.pivot.40.12 ], [ %29, %concatenate.pivot.20.11 ], [ %17, %concatenate.pivot.0. ]
  %multiply.3002.58.sink.in.in = phi i64 [ %51, %concatenate.pivot.100.15 ], [ %51, %concatenate.pivot.80.14 ], [ %45, %concatenate.pivot.60.13 ], [ %23, %concatenate.pivot.40.12 ], [ %23, %concatenate.pivot.20.11 ], [ %15, %concatenate.pivot.0. ]
  %.sink.in = phi ptr addrspace(1) [ %61, %concatenate.pivot.100.15 ], [ %55, %concatenate.pivot.80.14 ], [ %42, %concatenate.pivot.60.13 ], [ %33, %concatenate.pivot.40.12 ], [ %27, %concatenate.pivot.20.11 ], [ %12, %concatenate.pivot.0. ]
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !270
  %multiply.3002.58.sink.in = sitofp i64 %multiply.3002.58.sink.in.in to double
  %multiply.3002.58.sink = fmul double %multiply.3002.58.sink.in, 0x3F786F8FA34E82C5
  %64 = load double, ptr addrspace(1) %.sink20, align 8, !invariant.load !270
  %multiply.3008.7 = fmul double %64, %multiply.3002.58.sink
  %add.4171.5 = fadd double %.sink, %multiply.3008.7
  %multiply.3009.1 = fmul double %add.4171.5, 5.000000e-01
  %65 = zext nneg i32 %linear_index to i64
  %66 = getelementptr double, ptr addrspace(1) %arg1347, i64 %65
  store double %multiply.3009.1, ptr addrspace(1) %66, align 8
  br label %loop_concatenate_fusion.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_exponential_multiply_select_fusion(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture align 128 dereferenceable(320) %arg8, ptr noalias nocapture align 128 dereferenceable(320) %arg9, ptr noalias nocapture align 128 dereferenceable(320) %arg10, ptr noalias nocapture align 128 dereferenceable(320) %arg11, ptr noalias nocapture align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg27) local_unnamed_addr #2 {
entry:
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
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp6 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp6, i32 %0, i32 %.urem
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg518, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8
  %5 = zext i1 %.cmp to i64
  %6 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg722, i64 0, i64 %5
  %7 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !270
  %8 = sitofp i64 %7 to double
  %multiply.3000.3.clone.1 = fmul double %8, 0x3F886F8FA34E82C5
  %9 = zext nneg i32 %1 to i64
  %10 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg620, i64 0, i64 %5, i64 %9
  %11 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 480
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %13 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg110, i64 0, i64 %5
  %14 = load i64, ptr addrspace(1) %13, align 8, !invariant.load !270
  %15 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg416, i64 0, i64 %5
  %16 = load i64, ptr addrspace(1) %15, align 8, !invariant.load !270
  %17 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg314, i64 0, i64 %5
  %18 = load i8, ptr addrspace(1) %17, align 1, !invariant.load !270
  %19 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg212, i64 0, i64 %5
  %20 = load i8, ptr addrspace(1) %19, align 1, !invariant.load !270
  %21 = getelementptr double, ptr addrspace(1) %arg07, i64 %2
  %22 = load double, ptr addrspace(1) %21, align 8
  %23 = getelementptr double, ptr addrspace(1) %arg824, i64 %2
  %24 = load double, ptr addrspace(1) %23, align 8
  %25 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 640
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !270
  %27 = getelementptr double, ptr addrspace(1) %arg926, i64 %2
  %28 = load double, ptr addrspace(1) %27, align 8
  %29 = getelementptr double, ptr addrspace(1) %arg1028, i64 %2
  %30 = load double, ptr addrspace(1) %29, align 8
  %31 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 800
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !270
  %33 = getelementptr double, ptr addrspace(1) %arg1130, i64 %2
  %34 = load double, ptr addrspace(1) %33, align 8
  %35 = getelementptr double, ptr addrspace(1) %arg1232, i64 %2
  %36 = load double, ptr addrspace(1) %35, align 8
  %37 = getelementptr double, ptr addrspace(1) %arg1334, i64 %2
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !270
  %39 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 160
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !270
  %41 = getelementptr double, ptr addrspace(1) %arg1436, i64 %2
  %42 = load double, ptr addrspace(1) %41, align 8
  %43 = getelementptr double, ptr addrspace(1) %arg1538, i64 %2
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !270
  %45 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 320
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !270
  %add.4172.6.clone.14 = fadd double %46, %46
  %multiply.3014.11.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.14
  %add.4177.9.clone.1.clone.1 = fadd double %44, %multiply.3014.11.clone.1.clone.1
  %47 = tail call double @llvm.fma.f64(double %add.4177.9.clone.1.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %48 = tail call i32 @llvm.nvvm.d2i.lo(double %47) #12
  %49 = tail call double @llvm.nvvm.add.rn.d(double %47, double 0xC338000000000000) #12
  %50 = tail call double @llvm.fma.f64(double %49, double 0xBFE62E42FEFA39EF, double %add.4177.9.clone.1.clone.1)
  %51 = tail call double @llvm.fma.f64(double %49, double 0xBC7ABC9E3B39803F, double %50)
  %52 = tail call double @llvm.fma.f64(double %51, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %53 = tail call double @llvm.fma.f64(double %52, double %51, double 0x3EC71DEE62401315)
  %54 = tail call double @llvm.fma.f64(double %53, double %51, double 0x3EFA01997C89EB71)
  %55 = tail call double @llvm.fma.f64(double %54, double %51, double 0x3F2A01A014761F65)
  %56 = tail call double @llvm.fma.f64(double %55, double %51, double 0x3F56C16C1852B7AF)
  %57 = tail call double @llvm.fma.f64(double %56, double %51, double 0x3F81111111122322)
  %58 = tail call double @llvm.fma.f64(double %57, double %51, double 0x3FA55555555502A1)
  %59 = tail call double @llvm.fma.f64(double %58, double %51, double 0x3FC5555555555511)
  %60 = tail call double @llvm.fma.f64(double %59, double %51, double 0x3FE000000000000B)
  %61 = tail call double @llvm.fma.f64(double %60, double %51, double 1.000000e+00)
  %62 = tail call double @llvm.fma.f64(double %61, double %51, double 1.000000e+00)
  %63 = tail call i32 @llvm.nvvm.d2i.lo(double %62) #12
  %64 = tail call i32 @llvm.nvvm.d2i.hi(double %62) #12
  %65 = shl i32 %48, 20
  %66 = add i32 %64, %65
  %67 = tail call double @llvm.nvvm.lohi.i2d(i32 %63, i32 %66) #12
  %68 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4177.9.clone.1.clone.1) #12
  %69 = bitcast i32 %68 to float
  %70 = tail call float @llvm.nvvm.fabs.f(float %69) #12
  %71 = fcmp olt float %70, 0x4010C46560000000
  br i1 %71, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %72 = fcmp olt double %add.4177.9.clone.1.clone.1, 0.000000e+00
  %73 = fadd double %add.4177.9.clone.1.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %72, double 0.000000e+00, double %73
  %74 = fcmp olt float %70, 0x4010E90000000000
  br i1 %74, label %75, label %__nv_exp.exit

75:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %76 = sdiv i32 %48, 2
  %77 = shl i32 %76, 20
  %78 = add i32 %64, %77
  %79 = tail call double @llvm.nvvm.lohi.i2d(i32 %63, i32 %78) #12
  %80 = sub nsw i32 %48, %76
  %81 = shl i32 %80, 20
  %82 = add nsw i32 %81, 1072693248
  %83 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %82) #12
  %84 = fmul double %83, %79
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %75
  %z.2.i = phi double [ %67, %entry ], [ %84, %75 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.4178.5.clone.1.clone.1 = fadd double %add.4177.9.clone.1.clone.1, 0xBFF62E42FEFA39EF
  %multiply.3015.1.clone.1.clone.1 = fmul double %add.4178.5.clone.1.clone.1, %add.4178.5.clone.1.clone.1
  %multiply.3016.5.clone.1.clone.1 = fmul double %multiply.3015.1.clone.1.clone.1, 0x3FFC71C71C71C71C
  %add.4179.3.clone.1.clone.1 = fadd double %multiply.3016.5.clone.1.clone.1, 0x3FF43340BFCA50EB
  %multiply.3017.1.clone.1.clone.1 = fmul double %add.4179.3.clone.1.clone.1, -5.000000e-01
  %85 = icmp sge i64 %14, %16
  %86 = or i8 %20, %18
  %87 = trunc i8 %86 to i1
  %.not5 = or i1 %85, %87
  %88 = icmp eq i64 %14, 0
  %89 = select i1 %88, double %add.4177.9.clone.1.clone.1, double %42
  %90 = select i1 %.not5, double %42, double %89
  %add.4172.6.clone.13 = fadd double %40, %40
  %multiply.3025.9.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.13
  %add.4191.7.clone.1.clone.1 = fadd double %38, %multiply.3025.9.clone.1.clone.1
  %91 = select i1 %.not5, double %38, double %add.4191.7.clone.1.clone.1
  %add.4192.5.clone.1.clone.1 = fadd double %add.4191.7.clone.1.clone.1, -1.000000e+00
  %multiply.3026.1.clone.1.clone.1 = fmul double %add.4192.5.clone.1.clone.1, %add.4192.5.clone.1.clone.1
  %multiply.3027.3.clone.1.clone.1 = fmul double %multiply.3026.1.clone.1.clone.1, 4.000000e+00
  %add.4193.3.clone.1.clone.1 = fadd double %multiply.3027.3.clone.1.clone.1, 0x3FDCE6BB25AA1315
  %multiply.3028.1.clone.1.clone.1 = fmul double %add.4193.3.clone.1.clone.1, -5.000000e-01
  %92 = select i1 %88, double %add.4191.7.clone.1.clone.1, double %36
  %93 = select i1 %.not5, double %36, double %92
  %add.4172.6.clone.12 = fadd double %32, %32
  %multiply.3021.3.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.12
  %add.4186.1.clone.1.clone.1 = fadd double %30, %multiply.3021.3.clone.1.clone.1
  %add.4187.5.clone.1 = fadd double %add.4186.1.clone.1.clone.1, 6.000000e+00
  %multiply.3022.1.clone.1 = fmul double %add.4187.5.clone.1, %add.4187.5.clone.1
  %multiply.3023.5.clone.1 = fmul double %multiply.3022.1.clone.1, 2.500000e-01
  %add.4188.3.clone.1 = fadd double %multiply.3023.5.clone.1, 0x4009CB1A63AF7C52
  %multiply.3024.1.clone.1 = fmul double %add.4188.3.clone.1, -5.000000e-01
  %94 = select i1 %88, double %add.4186.1.clone.1.clone.1, double %34
  %95 = select i1 %.not5, double %34, double %94
  %96 = select i1 %.not5, double %30, double %add.4186.1.clone.1.clone.1
  %add.4172.6.clone.11 = fadd double %26, %26
  %multiply.3010.3.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.11
  %add.4173.1.clone.1.clone.1 = fadd double %24, %multiply.3010.3.clone.1.clone.1
  %add.4174.5.clone.1 = fadd double %add.4173.1.clone.1.clone.1, 4.000000e+00
  %multiply.3011.1.clone.1 = fmul double %add.4174.5.clone.1, %add.4174.5.clone.1
  %multiply.3012.5.clone.1 = fmul double %multiply.3011.1.clone.1, 2.500000e-01
  %add.4176.3.clone.1 = fadd double %multiply.3012.5.clone.1, 0x4009CB1A63AF7C52
  %multiply.3013.1.clone.1 = fmul double %add.4176.3.clone.1, -5.000000e-01
  %97 = select i1 %88, double %add.4173.1.clone.1.clone.1, double %28
  %98 = select i1 %.not5, double %28, double %97
  %99 = select i1 %.not5, double %24, double %add.4173.1.clone.1.clone.1
  %add.4172.6.clone.1 = fadd double %12, %12
  %multiply.3029.3.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.1
  %add.4196.1.clone.1 = fadd double %4, %multiply.3029.3.clone.1
  %100 = select i1 %.not5, double %4, double %add.4196.1.clone.1
  %101 = select i1 %88, double %add.4196.1.clone.1, double %22
  %102 = select i1 %.not5, double %22, double %101
  %add.4197.5 = fadd double %add.4196.1.clone.1, -1.000000e+00
  %multiply.3030.1 = fmul double %add.4197.5, %add.4197.5
  %add.4198.3 = fadd double %multiply.3030.1, 0x3FFD67F1C864BEB4
  %multiply.3031.1 = fmul double %add.4198.3, -5.000000e-01
  %103 = select i1 %.not5, double %44, double %add.4177.9.clone.1.clone.1
  %104 = getelementptr double, ptr addrspace(1) %arg1640, i64 %2
  store double %multiply.3031.1, ptr addrspace(1) %104, align 8
  store double %102, ptr addrspace(1) %21, align 8
  store double %100, ptr addrspace(1) %3, align 8
  %105 = getelementptr double, ptr addrspace(1) %arg1742, i64 %2
  store double %add.4196.1.clone.1, ptr addrspace(1) %105, align 8
  store double %99, ptr addrspace(1) %23, align 8
  store double %98, ptr addrspace(1) %27, align 8
  %106 = getelementptr double, ptr addrspace(1) %arg1844, i64 %2
  store double %multiply.3013.1.clone.1, ptr addrspace(1) %106, align 8
  %107 = getelementptr double, ptr addrspace(1) %arg1946, i64 %2
  store double %add.4173.1.clone.1.clone.1, ptr addrspace(1) %107, align 8
  store double %96, ptr addrspace(1) %29, align 8
  store double %95, ptr addrspace(1) %33, align 8
  %108 = getelementptr double, ptr addrspace(1) %arg2048, i64 %2
  store double %multiply.3024.1.clone.1, ptr addrspace(1) %108, align 8
  %109 = getelementptr double, ptr addrspace(1) %arg2150, i64 %2
  store double %add.4186.1.clone.1.clone.1, ptr addrspace(1) %109, align 8
  store double %93, ptr addrspace(1) %35, align 8
  %110 = getelementptr double, ptr addrspace(1) %arg2252, i64 %2
  store double %multiply.3028.1.clone.1.clone.1, ptr addrspace(1) %110, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg2354, i64 %2
  store double %91, ptr addrspace(1) %111, align 8
  %112 = getelementptr double, ptr addrspace(1) %arg2456, i64 %2
  store double %add.4191.7.clone.1.clone.1, ptr addrspace(1) %112, align 8
  store double %90, ptr addrspace(1) %41, align 8
  %113 = getelementptr double, ptr addrspace(1) %arg2558, i64 %2
  store double %multiply.3017.1.clone.1.clone.1, ptr addrspace(1) %113, align 8
  %114 = getelementptr double, ptr addrspace(1) %arg2660, i64 %2
  store double %z.2.i, ptr addrspace(1) %114, align 8
  %115 = getelementptr double, ptr addrspace(1) %arg2762, i64 %2
  store double %103, ptr addrspace(1) %115, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !272
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 7680
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.14.in_bounds-true, label %loop_broadcast_fusion.14.in_bounds-after

loop_broadcast_fusion.14.in_bounds-after:         ; preds = %loop_broadcast_fusion.14.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.14.in_bounds-true:          ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.14.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !272
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 7680
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr i8, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.6.in_bounds-true, label %loop_broadcast_fusion.6.in_bounds-after

loop_broadcast_fusion.6.in_bounds-after:          ; preds = %loop_broadcast_fusion.6.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.6.in_bounds-true:           ; preds = %entry
  store i8 0, ptr addrspace(1) %5, align 1
  br label %loop_broadcast_fusion.6.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !272
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 7680
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr i8, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.5.in_bounds-true, label %loop_broadcast_fusion.5.in_bounds-after

loop_broadcast_fusion.5.in_bounds-after:          ; preds = %loop_broadcast_fusion.5.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.5.in_bounds-true:           ; preds = %entry
  store i8 0, ptr addrspace(1) %5, align 1
  br label %loop_broadcast_fusion.5.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !272
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 7680
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr i32, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.8.in_bounds-true, label %loop_broadcast_fusion.8.in_bounds-after

loop_broadcast_fusion.8.in_bounds-after:          ; preds = %loop_broadcast_fusion.8.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.8.in_bounds-true:           ; preds = %entry
  store i32 0, ptr addrspace(1) %5, align 4
  br label %loop_broadcast_fusion.8.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !267
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0x7FF8000000000000, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !270
  %1 = icmp slt i64 %0, 192
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_53(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.1560 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !270
  %0 = icmp slt i64 %param_1.1560, 0
  %1 = add i64 %param_1.1560, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1560
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg04, i64 0, i64 %4
  store i32 1, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_52(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.1562 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !270
  %0 = icmp slt i64 %param_1.1562, 0
  %1 = add i64 %param_1.1562, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1562
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg04, i64 0, i64 %4
  store double 1.000000e+00, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1507 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1507, 0
  %4 = add i64 %param_1.1507, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1507
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12506 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = icmp ne i64 %param_2.12506, 0
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [1 x [2 x [20 x i8]]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 0, i64 %1, i64 %2
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp7 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1544 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1544, 0
  %4 = add i64 %param_1.1544, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1544
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12875 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = icmp ne i64 %param_2.12875, 0
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp7 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1559 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1559, 0
  %4 = add i64 %param_1.1559, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1559
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.13065 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %.not = icmp eq i64 %param_2.13065, 0
  %9 = zext i1 %.not to i8
  %10 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp7 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1553 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1553, 0
  %4 = add i64 %param_1.1553, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1553
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12965 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = icmp ne i64 %param_2.12965, 0
  %10 = zext i1 %9 to i32
  %11 = getelementptr inbounds [192 x [2 x [20 x i32]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store i32 %10, ptr addrspace(1) %11, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_41(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_2.1272 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1272, 0
  %4 = add i64 %param_2.1272, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1272
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.15295 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2990.1 = fmul double %param_1.15295, %param_1.15295
  %divide.611.1 = fdiv double 1.000000e+00, %multiply.2990.1
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.611.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_4(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1528 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1528, 0
  %4 = add i64 %param_1.1528, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1528
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.13075 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2982.5 = fmul double %param_2.13075, %param_2.13075
  %multiply.2984.3 = fmul double %multiply.2982.5, 5.000000e-01
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2984.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1303 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1303, 0
  %4 = add i64 %param_2.1303, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1303
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15325 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2999.3 = fmul double %param_1.15325, 2.000000e+00
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2999.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp5 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp5, i64 %thread_id_x, i64 %.urem
  %param_1.1555 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1555, 0
  %4 = add i64 %param_1.1555, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1555
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double 1.000000e+00, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1285 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1285, 0
  %4 = add i64 %param_2.1285, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1285
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15425 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = sitofp i64 %param_1.15425 to double
  %10 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1286 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1286, 0
  %4 = add i64 %param_2.1286, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1286
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15435 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.15435, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_29(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1540 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1540, 0
  %4 = add i64 %param_1.1540, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1540
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12835 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2962.2 = fmul double %param_2.12835, %param_2.12835
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2962.2, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_51(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp5 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp5, i64 %thread_id_x, i64 %.urem
  %param_1.1565 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1565, 0
  %4 = add i64 %param_1.1565, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1565
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double 0.000000e+00, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_40(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1276 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1276, 0
  %4 = add i64 %param_2.1276, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1276
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15335 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.15335, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_47(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1259 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1259, 0
  %4 = add i64 %param_2.1259, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1259
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15165 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.15165, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_exponential_select_fusion(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg23) local_unnamed_addr #2 {
entry:
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.urem = add nsw i32 %0, -20
  %.cmp = icmp ult i32 %0, 20
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg318, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !270
  %5 = getelementptr double, ptr addrspace(1) %arg828, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %multiply.2958.3.clone.1 = fmul double %4, %6
  %7 = getelementptr double, ptr addrspace(1) %arg216, i64 %2
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !270
  %add.4051.3.clone.1 = fadd double %multiply.2958.3.clone.1, %8
  %9 = getelementptr double, ptr addrspace(1) %arg930, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %11 = fneg double %add.4051.3.clone.1
  %12 = tail call double @llvm.fma.f64(double %11, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #12
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #12
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %11)
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
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #12
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #12
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #12
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %11) #12
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #12
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %37 = fcmp ogt double %add.4051.3.clone.1, 0.000000e+00
  %38 = fsub double 0x7FF0000000000000, %add.4051.3.clone.1
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #12
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #12
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %entry ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %50 = getelementptr double, ptr addrspace(1) %arg1032, i64 %2
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !270
  %52 = getelementptr double, ptr addrspace(1) %arg1338, i64 %2
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !270
  %54 = getelementptr double, ptr addrspace(1) %arg012, i64 %2
  %55 = load double, ptr addrspace(1) %54, align 8
  %multiply.2961.5.clone.1 = fmul double %10, %55
  %add.4053.3.clone.1 = fadd double %53, %multiply.2961.5.clone.1
  %56 = tail call double @llvm.fma.f64(double %add.4053.3.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %57 = tail call i32 @llvm.nvvm.d2i.lo(double %56) #12
  %58 = tail call double @llvm.nvvm.add.rn.d(double %56, double 0xC338000000000000) #12
  %59 = tail call double @llvm.fma.f64(double %58, double 0xBFE62E42FEFA39EF, double %add.4053.3.clone.1)
  %60 = tail call double @llvm.fma.f64(double %58, double 0xBC7ABC9E3B39803F, double %59)
  %61 = tail call double @llvm.fma.f64(double %60, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %62 = tail call double @llvm.fma.f64(double %61, double %60, double 0x3EC71DEE62401315)
  %63 = tail call double @llvm.fma.f64(double %62, double %60, double 0x3EFA01997C89EB71)
  %64 = tail call double @llvm.fma.f64(double %63, double %60, double 0x3F2A01A014761F65)
  %65 = tail call double @llvm.fma.f64(double %64, double %60, double 0x3F56C16C1852B7AF)
  %66 = tail call double @llvm.fma.f64(double %65, double %60, double 0x3F81111111122322)
  %67 = tail call double @llvm.fma.f64(double %66, double %60, double 0x3FA55555555502A1)
  %68 = tail call double @llvm.fma.f64(double %67, double %60, double 0x3FC5555555555511)
  %69 = tail call double @llvm.fma.f64(double %68, double %60, double 0x3FE000000000000B)
  %70 = tail call double @llvm.fma.f64(double %69, double %60, double 1.000000e+00)
  %71 = tail call double @llvm.fma.f64(double %70, double %60, double 1.000000e+00)
  %72 = tail call i32 @llvm.nvvm.d2i.lo(double %71) #12
  %73 = tail call i32 @llvm.nvvm.d2i.hi(double %71) #12
  %74 = shl i32 %57, 20
  %75 = add i32 %73, %74
  %76 = tail call double @llvm.nvvm.lohi.i2d(i32 %72, i32 %75) #12
  %77 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.3.clone.1) #12
  %78 = bitcast i32 %77 to float
  %79 = tail call float @llvm.nvvm.fabs.f(float %78) #12
  %80 = fcmp olt float %79, 0x4010C46560000000
  br i1 %80, label %__nv_exp.exit7, label %__internal_fast_icmp_abs_lt.exit.i4

__internal_fast_icmp_abs_lt.exit.i4:              ; preds = %__nv_exp.exit
  %81 = fcmp olt double %add.4053.3.clone.1, 0.000000e+00
  %82 = fadd double %add.4053.3.clone.1, 0x7FF0000000000000
  %z.0.i5 = select i1 %81, double 0.000000e+00, double %82
  %83 = fcmp olt float %79, 0x4010E90000000000
  br i1 %83, label %84, label %__nv_exp.exit7

84:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i4
  %85 = sdiv i32 %57, 2
  %86 = shl i32 %85, 20
  %87 = add i32 %73, %86
  %88 = tail call double @llvm.nvvm.lohi.i2d(i32 %72, i32 %87) #12
  %89 = sub nsw i32 %57, %85
  %90 = shl i32 %89, 20
  %91 = add nsw i32 %90, 1072693248
  %92 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %91) #12
  %93 = fmul double %92, %88
  br label %__nv_exp.exit7

__nv_exp.exit7:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i4, %84
  %z.2.i6 = phi double [ %76, %__nv_exp.exit ], [ %93, %84 ], [ %z.0.i5, %__internal_fast_icmp_abs_lt.exit.i4 ]
  %94 = zext nneg i32 %1 to i64
  %95 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg420, i64 0, i64 %94
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !270
  %97 = load i64, ptr addrspace(1) %arg1236, align 128, !invariant.load !270
  %98 = icmp slt i64 %97, 0
  %99 = add i64 %97, 192
  %100 = select i1 %98, i64 %99, i64 %97
  %101 = trunc i64 %100 to i32
  %102 = tail call i32 @llvm.smax.i32(i32 %101, i32 0)
  %103 = tail call i32 @llvm.umin.i32(i32 %102, i32 191)
  %104 = zext nneg i32 %103 to i64
  %105 = getelementptr inbounds [20 x [192 x [1 x double]]], ptr addrspace(1) %arg1134, i64 0, i64 %94, i64 %104, i64 0
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !270
  %107 = getelementptr double, ptr addrspace(1) %arg522, i64 %2
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !270
  %109 = getelementptr double, ptr addrspace(1) %arg624, i64 %2
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg726, i64 %2
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !270
  %113 = tail call double @llvm.fma.f64(double %112, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %114 = tail call i32 @llvm.nvvm.d2i.lo(double %113) #12
  %115 = tail call double @llvm.nvvm.add.rn.d(double %113, double 0xC338000000000000) #12
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
  %129 = tail call i32 @llvm.nvvm.d2i.lo(double %128) #12
  %130 = tail call i32 @llvm.nvvm.d2i.hi(double %128) #12
  %131 = shl i32 %114, 20
  %132 = add i32 %130, %131
  %133 = tail call double @llvm.nvvm.lohi.i2d(i32 %129, i32 %132) #12
  %134 = tail call i32 @llvm.nvvm.d2i.hi(double %112) #12
  %135 = bitcast i32 %134 to float
  %136 = tail call float @llvm.nvvm.fabs.f(float %135) #12
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
  %145 = tail call double @llvm.nvvm.lohi.i2d(i32 %129, i32 %144) #12
  %146 = sub nsw i32 %114, %142
  %147 = shl i32 %146, 20
  %148 = add nsw i32 %147, 1072693248
  %149 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %148) #12
  %150 = fmul double %149, %145
  br label %__nv_exp.exit11

__nv_exp.exit11:                                  ; preds = %__nv_exp.exit7, %__internal_fast_icmp_abs_lt.exit.i8, %141
  %z.2.i10 = phi double [ %133, %__nv_exp.exit7 ], [ %150, %141 ], [ %z.0.i9, %__internal_fast_icmp_abs_lt.exit.i8 ]
  %divide.605.1.clone.1 = fdiv double 1.000000e+00, %110
  %compare.1135.41.clone.1 = fcmp ogt double %z.2.i6, 1.000000e-128
  %151 = select i1 %compare.1135.41.clone.1, double %z.2.i6, double %96
  %divide.600.7.clone.1 = fdiv double 1.000000e+00, %51
  %add.4054.5.clone.1 = fadd double %divide.600.7.clone.1, %151
  %divide.601.1.clone.1 = fdiv double 1.000000e+00, %add.4054.5.clone.1
  %multiply.2966.13 = fmul double %151, %divide.601.1.clone.1
  %multiply.2967.5 = fmul double %108, %multiply.2966.13
  %multiply.2962.18.clone.1 = fmul double %10, %10
  %add.4052.3.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.599.1.clone.1 = fdiv double 1.000000e+00, %add.4052.3.clone.1
  %subtract.222.41.clone.1 = fsub double 1.000000e+00, %divide.599.1.clone.1
  %multiply.2959.37.clone.1 = fmul double %divide.599.1.clone.1, %subtract.222.41.clone.1
  %multiply.2963.19.clone.1 = fmul double %multiply.2962.18.clone.1, %multiply.2959.37.clone.1
  %add.4056.17.clone.1 = fadd double %multiply.2963.19.clone.1, %divide.601.1.clone.1
  %compare.1136.17.clone.1 = fcmp ogt double %add.4056.17.clone.1, 1.000000e-128
  %152 = select i1 %compare.1136.17.clone.1, double %add.4056.17.clone.1, double 0x7FF8000000000000
  %multiply.2968.1.clone.1 = fmul double %add.4054.5.clone.1, %152
  %divide.604.5.clone.1 = fdiv double 1.000000e+00, %multiply.2968.1.clone.1
  %multiply.2960.9.clone.1 = fmul double %10, %multiply.2959.37.clone.1
  %divide.602.5.clone.1 = fdiv double %multiply.2960.9.clone.1, %152
  %subtract.223.9.clone.1 = fsub double %106, %divide.599.1.clone.1
  %divide.603.5.clone.1 = fdiv double %subtract.223.9.clone.1, %multiply.2959.37.clone.1
  %multiply.2964.1.clone.1 = fmul double %divide.603.5.clone.1, %divide.602.5.clone.1
  %add.4058.1.clone.1 = fadd double %add.4051.3.clone.1, %multiply.2964.1.clone.1
  %subtract.224.2.clone.1 = fsub double %add.4058.1.clone.1, %add.4051.3.clone.1
  %multiply.2969.2.clone.1 = fmul double %subtract.224.2.clone.1, %subtract.224.2.clone.1
  %multiply.2970.1.clone.1 = fmul double %divide.601.1.clone.1, %multiply.2969.2.clone.1
  %add.4061.3.clone.1 = fadd double %divide.604.5.clone.1, %multiply.2970.1.clone.1
  %add.4062.1.clone.1 = fadd double %add.4061.3.clone.1, -1.000000e+00
  %multiply.2971.2 = fmul double %multiply.2967.5, %add.4062.1.clone.1
  %multiply.2965.1 = fmul double %4, %55
  %add.4059.1 = fadd double %8, %multiply.2965.1
  %153 = tail call double @llvm.fabs.f64(double %add.4058.1.clone.1)
  %154 = call i1 @llvm.is.fpclass.f64(double %add.4058.1.clone.1, i32 504)
  %compare.1138.9 = fcmp olt double %153, 1.400000e+01
  %155 = and i1 %154, %compare.1138.9
  %compare.1139.11.clone.1 = fcmp ogt double %z.2.i10, 1.000000e-128
  %156 = select i1 %compare.1139.11.clone.1, double %z.2.i10, double %96
  %add.4063.5.clone.1 = fadd double %divide.605.1.clone.1, %156
  %divide.606.1.clone.1 = fdiv double 1.000000e+00, %add.4063.5.clone.1
  %multiply.2972.9 = fmul double %divide.606.1.clone.1, 2.000000e+00
  %divide.607.5 = fdiv double 1.000000e+00, %multiply.2972.9
  %multiply.2973.1 = fmul double %multiply.2971.2, %divide.607.5
  %157 = getelementptr i64, ptr addrspace(1) %arg114, i64 %2
  %158 = load i64, ptr addrspace(1) %157, align 8, !invariant.load !270
  %159 = sitofp i64 %158 to double
  %multiply.2974.3 = fmul double %multiply.2973.1, %159
  %add.4064.1 = fadd double %add.4059.1, %multiply.2974.3
  %160 = select i1 %155, double %add.4064.1, double %55
  %.not = icmp eq i64 %158, 0
  %add.4066.2.clone.1 = fadd double %divide.605.1.clone.1, %z.2.i10
  %divide.608.3.clone.1 = fdiv double 1.000000e+00, %add.4066.2.clone.1
  %multiply.2975.4.clone.1 = fmul double %multiply.2967.5, %multiply.2967.5
  %multiply.2976.9.clone.1 = fmul double %multiply.2975.4.clone.1, 5.000000e-01
  %multiply.2980.3.clone.1 = fmul double %multiply.2975.4.clone.1, %add.4062.1.clone.1
  %add.4067.7.clone.1 = fadd double %multiply.2976.9.clone.1, %multiply.2980.3.clone.1
  %multiply.2982.11.clone.1 = fmul double %108, %108
  %multiply.2984.9.clone.1 = fmul double %multiply.2982.11.clone.1, 5.000000e-01
  %multiply.2985.4.clone.1 = fmul double %multiply.2966.13, %multiply.2984.9.clone.1
  %multiply.2986.3.clone.1 = fmul double %multiply.2985.4.clone.1, %add.4062.1.clone.1
  %subtract.225.5.clone.1 = fsub double %add.4067.7.clone.1, %multiply.2986.3.clone.1
  %multiply.2987.5.clone.1 = fmul double %subtract.225.5.clone.1, %159
  %add.4068.3.clone.1 = fadd double %multiply.2987.5.clone.1, %divide.606.1.clone.1
  %compare.1142.5.clone.1 = fcmp ogt double %add.4068.3.clone.1, 1.000000e-128
  %161 = select i1 %compare.1142.5.clone.1, double %add.4068.3.clone.1, double %96
  %162 = select i1 %.not, double %divide.608.3.clone.1, double %161
  %163 = select i1 %155, double %162, double %110
  %164 = select i1 %155, double %add.4058.1.clone.1, double %6
  %165 = select i1 %155, double %152, double %51
  store double %160, ptr addrspace(1) %54, align 8
  store double %163, ptr addrspace(1) %109, align 8
  %166 = getelementptr double, ptr addrspace(1) %arg1440, i64 %2
  store double %divide.606.1.clone.1, ptr addrspace(1) %166, align 8
  %167 = getelementptr double, ptr addrspace(1) %arg1542, i64 %2
  store double %z.2.i10, ptr addrspace(1) %167, align 8
  %168 = getelementptr double, ptr addrspace(1) %arg1644, i64 %2
  store double %divide.605.1.clone.1, ptr addrspace(1) %168, align 8
  %169 = getelementptr double, ptr addrspace(1) %arg1746, i64 %2
  store double %add.4062.1.clone.1, ptr addrspace(1) %169, align 8
  %170 = getelementptr double, ptr addrspace(1) %arg1848, i64 %2
  store double %164, ptr addrspace(1) %170, align 8
  %171 = getelementptr double, ptr addrspace(1) %arg1950, i64 %2
  store double %165, ptr addrspace(1) %171, align 8
  %172 = getelementptr double, ptr addrspace(1) %arg2052, i64 %2
  store double %add.4058.1.clone.1, ptr addrspace(1) %172, align 8
  %173 = getelementptr double, ptr addrspace(1) %arg2154, i64 %2
  store double %divide.601.1.clone.1, ptr addrspace(1) %173, align 8
  %174 = getelementptr double, ptr addrspace(1) %arg2256, i64 %2
  store double %z.2.i6, ptr addrspace(1) %174, align 8
  %175 = getelementptr double, ptr addrspace(1) %arg2358, i64 %2
  store double %divide.599.1.clone.1, ptr addrspace(1) %175, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8) local_unnamed_addr #2 {
entry:
  %arg833 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg731 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg629 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg527 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg425 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg323 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg221 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg017 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp16 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp16, i64 %thread_id_x, i64 %.urem
  %param_1.1556 = load i64, ptr addrspace(1) %arg119, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1556, 0
  %4 = add i64 %param_1.1556, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1556
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg221, i64 %thread_id_x
  %param_2.12995 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg833, i64 %thread_id_x
  %param_8.3536 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %10 = getelementptr double, ptr addrspace(1) %arg629, i64 %thread_id_x
  %param_6.5437 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %compare.1135.37 = fcmp ogt double %param_6.5437, 1.000000e-128
  %param_7.398 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg731, i64 0, i64 %2
  %param_7.39810 = load double, ptr addrspace(1) %param_7.398, align 8, !invariant.load !270
  %11 = select i1 %compare.1135.37, double %param_6.5437, double %param_7.39810
  %12 = getelementptr double, ptr addrspace(1) %arg527, i64 %thread_id_x
  %param_5.70011 = load double, ptr addrspace(1) %12, align 8, !invariant.load !270
  %multiply.2966.29 = fmul double %11, %param_5.70011
  %multiply.2967.17 = fmul double %param_8.3536, %multiply.2966.29
  %multiply.2975.6 = fmul double %multiply.2967.17, %multiply.2967.17
  %multiply.2976.11 = fmul double %multiply.2975.6, 5.000000e-01
  %13 = getelementptr double, ptr addrspace(1) %arg425, i64 %thread_id_x
  %param_4.84412 = load double, ptr addrspace(1) %13, align 8, !invariant.load !270
  %multiply.2980.5 = fmul double %param_4.84412, %multiply.2975.6
  %add.4067.9 = fadd double %multiply.2976.11, %multiply.2980.5
  %multiply.2982.13 = fmul double %param_8.3536, %param_8.3536
  %multiply.2984.11 = fmul double %multiply.2982.13, 5.000000e-01
  %multiply.2985.6 = fmul double %multiply.2984.11, %multiply.2966.29
  %multiply.2986.5 = fmul double %param_4.84412, %multiply.2985.6
  %subtract.225.7 = fsub double %add.4067.9, %multiply.2986.5
  %14 = getelementptr i64, ptr addrspace(1) %arg323, i64 %thread_id_x
  %param_3.116115 = load i64, ptr addrspace(1) %14, align 8, !invariant.load !270
  %15 = sitofp i64 %param_3.116115 to double
  %multiply.2987.7 = fmul double %subtract.225.7, %15
  %add.4068.5 = fadd double %param_2.12995, %multiply.2987.7
  %compare.1142.3 = fcmp ogt double %add.4068.5, 1.000000e-128
  %16 = zext i1 %compare.1142.3 to i8
  %17 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg017, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %16, ptr addrspace(1) %17, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp9 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_1.1510 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1510, 0
  %4 = add i64 %param_1.1510, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1510
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.13086 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = tail call double @llvm.fabs.f64(double %param_2.13086)
  %10 = call i1 @llvm.is.fpclass.f64(double %param_2.13086, i32 504)
  %compare.1138.15 = fcmp olt double %9, 1.400000e+01
  %11 = and i1 %10, %compare.1138.15
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds [192 x [1 x [2 x [20 x i8]]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 0, i64 %1, i64 %2
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1513 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1513, 0
  %4 = add i64 %param_1.1513, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1513
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.13105 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = tail call double @llvm.fabs.f64(double %param_2.13105)
  %10 = call i1 @llvm.is.fpclass.f64(double %param_2.13105, i32 504)
  %compare.1138.13 = fcmp olt double %9, 1.400000e+01
  %11 = and i1 %10, %compare.1138.13
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1520 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1520, 0
  %4 = add i64 %param_1.1520, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1520
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12635 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %compare.1139.3 = fcmp ogt double %param_2.12635, 1.000000e-128
  %9 = zext i1 %compare.1139.3 to i8
  %10 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_28(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp12 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1554 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1554, 0
  %4 = add i64 %param_1.1554, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1554
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.13005 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.8456 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %multiply.2962.6 = fmul double %param_4.8456, %param_4.8456
  %10 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.11629 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %subtract.222.21 = fsub double 1.000000e+00, %param_3.11629
  %multiply.2959.17 = fmul double %param_3.11629, %subtract.222.21
  %multiply.2963.7 = fmul double %multiply.2962.6, %multiply.2959.17
  %add.4056.5 = fadd double %param_2.13005, %multiply.2963.7
  %compare.1136.3 = fcmp ogt double %add.4056.5, 1.000000e-128
  %11 = zext i1 %compare.1136.3 to i8
  %12 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %11, ptr addrspace(1) %12, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_35(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp10 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %param_1.1545 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1545, 0
  %4 = add i64 %param_1.1545, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1545
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.8425 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %divide.600.9 = fdiv double 1.000000e+00, %param_4.8425
  %9 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12886 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.43 = fcmp ogt double %param_2.12886, 1.000000e-128
  %param_3.1153 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg317, i64 0, i64 %2
  %param_3.11539 = load double, ptr addrspace(1) %param_3.1153, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.43, double %param_2.12886, double %param_3.11539
  %add.4054.7 = fadd double %divide.600.9, %10
  %multiply.2991.1 = fmul double %add.4054.7, %add.4054.7
  %divide.612.1 = fdiv double 1.000000e+00, %multiply.2991.1
  %11 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.612.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp10 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %param_1.1527 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1527, 0
  %4 = add i64 %param_1.1527, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1527
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12705 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11436 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1139.9 = fcmp ogt double %param_3.11436, 1.000000e-128
  %param_4.831 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg419, i64 0, i64 %2
  %param_4.8319 = load double, ptr addrspace(1) %param_4.831, align 8, !invariant.load !270
  %10 = select i1 %compare.1139.9, double %param_3.11436, double %param_4.8319
  %add.4063.3 = fadd double %param_2.12705, %10
  %multiply.2989.1 = fmul double %add.4063.3, %add.4063.3
  %divide.610.1 = fdiv double 1.000000e+00, %multiply.2989.1
  %11 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.610.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp7 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1552 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1552, 0
  %4 = add i64 %param_1.1552, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1552
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12955 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.11576 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %add.4066.1 = fadd double %param_2.12955, %param_3.11576
  %multiply.2997.1 = fmul double %add.4066.1, %add.4066.1
  %divide.616.1 = fdiv double 1.000000e+00, %multiply.2997.1
  %10 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.616.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg625 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp12 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1511 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1511, 0
  %4 = add i64 %param_1.1511, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1511
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg625, i64 %thread_id_x
  %param_6.5475 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.8256 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.29 = fcmp ogt double %param_4.8256, 1.000000e-128
  %param_5.684 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg523, i64 0, i64 %2
  %param_5.6849 = load double, ptr addrspace(1) %param_5.684, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.29, double %param_4.8256, double %param_5.6849
  %11 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.113310 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.21 = fmul double %10, %param_3.113310
  %multiply.2967.13 = fmul double %param_6.5475, %multiply.2966.21
  %12 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.125411 = load double, ptr addrspace(1) %12, align 8, !invariant.load !270
  %multiply.2971.1 = fmul double %param_2.125411, %multiply.2967.13
  %13 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2971.1, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1534 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1534, 0
  %4 = add i64 %param_1.1534, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1534
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12775 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2972.3 = fmul double %param_2.12775, 2.000000e+00
  %multiply.2996.1 = fmul double %multiply.2972.3, %multiply.2972.3
  %divide.615.1 = fdiv double 1.000000e+00, %multiply.2996.1
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.615.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1509 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1509, 0
  %4 = add i64 %param_1.1509, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1509
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12525 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2972.7 = fmul double %param_2.12525, 2.000000e+00
  %divide.607.3 = fdiv double 1.000000e+00, %multiply.2972.7
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.607.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5) local_unnamed_addr #2 {
entry:
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp9 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_1.1557 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1557, 0
  %4 = add i64 %param_1.1557, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1557
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.13045 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.8506 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %10 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7087 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %multiply.2958.9 = fmul double %param_4.8506, %param_5.7087
  %11 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11678 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %add.4051.9 = fadd double %multiply.2958.9, %param_3.11678
  %subtract.224.1 = fsub double %param_2.13045, %add.4051.9
  %multiply.2994.3 = fmul double %subtract.224.1, 2.000000e+00
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2994.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5) local_unnamed_addr #2 {
entry:
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp9 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_1.1550 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1550, 0
  %4 = add i64 %param_1.1550, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1550
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12935 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.8396 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %10 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.6967 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %multiply.2958.5 = fmul double %param_4.8396, %param_5.6967
  %11 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11568 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %add.4051.5 = fadd double %multiply.2958.5, %param_3.11568
  %subtract.224.3 = fsub double %param_2.12935, %add.4051.5
  %multiply.2969.1 = fmul double %subtract.224.3, %subtract.224.3
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2969.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_43(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp9 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_3.1140 = load i64, ptr addrspace(1) %arg316, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_3.1140, 0
  %4 = add i64 %param_3.1140, 192
  %5 = select i1 %3, i64 %4, i64 %param_3.1140
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.15245 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %compare.1139.7 = fcmp ogt double %param_1.15245, 1.000000e-128
  %param_2.1267 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg214, i64 0, i64 %2
  %param_2.12678 = load double, ptr addrspace(1) %param_2.1267, align 8, !invariant.load !270
  %9 = select i1 %compare.1139.7, double %param_1.15245, double %param_2.12678
  %10 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5) local_unnamed_addr #2 {
entry:
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp11 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %param_1.1546 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1546, 0
  %4 = add i64 %param_1.1546, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1546
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7065 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.11546 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.25 = fcmp ogt double %param_3.11546, 1.000000e-128
  %param_4.837 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg420, i64 0, i64 %2
  %param_4.8379 = load double, ptr addrspace(1) %param_4.837, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.25, double %param_3.11546, double %param_4.8379
  %11 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.128910 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.17 = fmul double %10, %param_2.128910
  %multiply.2967.9 = fmul double %param_5.7065, %multiply.2966.17
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2967.9, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5) local_unnamed_addr #2 {
entry:
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp11 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %param_1.1558 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1558, 0
  %4 = add i64 %param_1.1558, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1558
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7095 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.11686 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.23 = fcmp ogt double %param_3.11686, 1.000000e-128
  %param_4.851 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg420, i64 0, i64 %2
  %param_4.8519 = load double, ptr addrspace(1) %param_4.851, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.23, double %param_3.11686, double %param_4.8519
  %11 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.130510 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.15 = fmul double %10, %param_2.130510
  %multiply.2967.7 = fmul double %param_5.7095, %multiply.2966.15
  %multiply.2998.3 = fmul double %multiply.2967.7, 2.000000e+00
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2998.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5) local_unnamed_addr #2 {
entry:
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp11 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %param_1.1536 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1536, 0
  %4 = add i64 %param_1.1536, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1536
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7055 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.11496 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.27 = fcmp ogt double %param_3.11496, 1.000000e-128
  %param_4.834 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg420, i64 0, i64 %2
  %param_4.8349 = load double, ptr addrspace(1) %param_4.834, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.27, double %param_3.11496, double %param_4.8349
  %11 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.127910 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.19 = fmul double %10, %param_2.127910
  %multiply.2967.11 = fmul double %param_5.7055, %multiply.2966.19
  %multiply.2975.1 = fmul double %multiply.2967.11, %multiply.2967.11
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2975.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp10 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %param_1.1521 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1521, 0
  %4 = add i64 %param_1.1521, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1521
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11385 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %compare.1135.15 = fcmp ogt double %param_3.11385, 1.000000e-128
  %param_4.828 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg419, i64 0, i64 %2
  %param_4.8288 = load double, ptr addrspace(1) %param_4.828, align 8, !invariant.load !270
  %9 = select i1 %compare.1135.15, double %param_3.11385, double %param_4.8288
  %10 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12649 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %multiply.2966.7 = fmul double %9, %param_2.12649
  %11 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2966.7, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5) local_unnamed_addr #2 {
entry:
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp11 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %param_1.1525 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1525, 0
  %4 = add i64 %param_1.1525, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1525
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7105 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2982.9 = fmul double %param_5.7105, %param_5.7105
  %multiply.2984.7 = fmul double %multiply.2982.9, 5.000000e-01
  %9 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.11416 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.17 = fcmp ogt double %param_3.11416, 1.000000e-128
  %param_4.830 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg420, i64 0, i64 %2
  %param_4.8309 = load double, ptr addrspace(1) %param_4.830, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.17, double %param_3.11416, double %param_4.8309
  %11 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.126810 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.9 = fmul double %10, %param_2.126810
  %multiply.2985.1 = fmul double %multiply.2984.7, %multiply.2966.9
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2985.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp12 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1531 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1531, 0
  %4 = add i64 %param_1.1531, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1531
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.13125 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.8556 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %multiply.2962.4 = fmul double %param_4.8556, %param_4.8556
  %10 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.11719 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %subtract.222.19 = fsub double 1.000000e+00, %param_3.11719
  %multiply.2959.15 = fmul double %param_3.11719, %subtract.222.19
  %multiply.2963.5 = fmul double %multiply.2962.4, %multiply.2959.15
  %add.4056.3 = fadd double %param_2.13125, %multiply.2963.5
  %compare.1136.5 = fcmp ogt double %add.4056.3, 1.000000e-128
  %11 = select i1 %compare.1136.5, double %add.4056.3, double 0x7FF8000000000000
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %11, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1547 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1547, 0
  %4 = add i64 %param_1.1547, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1547
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12905 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.222.15 = fsub double 1.000000e+00, %param_2.12905
  %multiply.2959.11 = fmul double %param_2.12905, %subtract.222.15
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2959.11, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_30(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1506 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1506, 0
  %4 = add i64 %param_1.1506, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1506
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12495 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.222.13 = fsub double 1.000000e+00, %param_2.12495
  %multiply.2959.9 = fmul double %param_2.12495, %subtract.222.13
  %multiply.2992.1 = fmul double %multiply.2959.9, %multiply.2959.9
  %divide.613.1 = fdiv double 1.000000e+00, %multiply.2992.1
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.613.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4) local_unnamed_addr #2 {
entry:
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp14 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp14, i64 %thread_id_x, i64 %.urem
  %param_1.1530 = load i64, ptr addrspace(1) %arg117, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1530, 0
  %4 = add i64 %param_1.1530, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1530
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.8595 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.11756 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %subtract.222.37 = fsub double 1.000000e+00, %param_3.11756
  %multiply.2959.33 = fmul double %param_3.11756, %subtract.222.37
  %multiply.2960.7 = fmul double %param_4.8595, %multiply.2959.33
  %10 = getelementptr double, ptr addrspace(1) %arg219, i64 %thread_id_x
  %param_2.13169 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %multiply.2962.16 = fmul double %param_4.8595, %param_4.8595
  %multiply.2963.17 = fmul double %multiply.2962.16, %multiply.2959.33
  %add.4056.15 = fadd double %param_2.13169, %multiply.2963.17
  %compare.1136.15 = fcmp ogt double %add.4056.15, 1.000000e-128
  %11 = select i1 %compare.1136.15, double %add.4056.15, double 0x7FF8000000000000
  %divide.602.3 = fdiv double %multiply.2960.7, %11
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.602.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp12 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1515 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1515, 0
  %4 = add i64 %param_1.1515, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1515
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.13155 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.8586 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %multiply.2962.14 = fmul double %param_4.8586, %param_4.8586
  %10 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.11749 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %subtract.222.29 = fsub double 1.000000e+00, %param_3.11749
  %multiply.2959.25 = fmul double %param_3.11749, %subtract.222.29
  %multiply.2963.15 = fmul double %multiply.2962.14, %multiply.2959.25
  %add.4056.13 = fadd double %param_2.13155, %multiply.2963.15
  %compare.1136.13 = fcmp ogt double %add.4056.13, 1.000000e-128
  %11 = select i1 %compare.1136.13, double %add.4056.13, double 0x7FF8000000000000
  %multiply.2993.1 = fmul double %11, %11
  %divide.614.1 = fdiv double 1.000000e+00, %multiply.2993.1
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.614.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_31(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg3) local_unnamed_addr #2 {
entry:
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp14 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp14, i64 %thread_id_x, i64 %.urem
  %param_1.1504 = load i64, ptr addrspace(1) %arg117, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1504, 0
  %4 = add i64 %param_1.1504, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1504
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1129 = getelementptr inbounds [20 x [192 x [1 x double]]], ptr addrspace(1) %arg321, i64 0, i64 %2, i64 %7, i64 0
  %param_3.112912 = load double, ptr addrspace(1) %param_3.1129, align 8, !invariant.load !270
  %8 = getelementptr double, ptr addrspace(1) %arg219, i64 %thread_id_x
  %param_2.124713 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.223.3 = fsub double %param_3.112912, %param_2.124713
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %7, i64 %1, i64 %2
  store double %subtract.223.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_33(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1549 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1549, 0
  %4 = add i64 %param_1.1549, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1549
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12925 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.222.3 = fsub double 1.000000e+00, %param_2.12925
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %subtract.222.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg3) local_unnamed_addr #2 {
entry:
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp18 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp18, i64 %thread_id_x, i64 %.urem
  %param_1.1523 = load i64, ptr addrspace(1) %arg121, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1523, 0
  %4 = add i64 %param_1.1523, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1523
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1139 = getelementptr inbounds [20 x [192 x [1 x double]]], ptr addrspace(1) %arg325, i64 0, i64 %2, i64 %7, i64 0
  %param_3.113912 = load double, ptr addrspace(1) %param_3.1139, align 8, !invariant.load !270
  %8 = getelementptr double, ptr addrspace(1) %arg223, i64 %thread_id_x
  %param_2.126613 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.223.7 = fsub double %param_3.113912, %param_2.126613
  %subtract.222.31 = fsub double 1.000000e+00, %param_2.126613
  %multiply.2959.27 = fmul double %param_2.126613, %subtract.222.31
  %divide.603.3 = fdiv double %subtract.223.7, %multiply.2959.27
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg019, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.603.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp9 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_1.1526 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1526, 0
  %4 = add i64 %param_1.1526, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1526
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12695 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11426 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %subtract.222.17 = fsub double 1.000000e+00, %param_3.11426
  %multiply.2959.13 = fmul double %param_3.11426, %subtract.222.17
  %multiply.2960.3 = fmul double %param_2.12695, %multiply.2959.13
  %10 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2960.3, ptr addrspace(1) %10, align 8
  ret void
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_subtract_fusion(ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg3) local_unnamed_addr #2 {
entry:
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !280
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg15, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !270
  %6 = fcmp ole double %5, -3.000000e+01
  %7 = select i1 %6, double -3.000000e+01, double %5
  %8 = fcmp oge double %7, 3.000000e+01
  %.neg = fneg double %7
  %9 = select i1 %8, double -3.000000e+01, double %.neg
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #12
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #12
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
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #12
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #12
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #12
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %9) #12
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #12
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
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #12
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #12
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %48 = trunc i64 %3 to i32
  %.lhs.trunc1 = trunc nuw nsw i32 %48 to i16
  %49 = urem i16 %.lhs.trunc1, 20
  %50 = udiv i16 %.lhs.trunc1, 40
  %add.4201.3 = fadd double %z.2.i, 1.000000e+00
  %divide.617.2 = fdiv double 1.000000e+00, %add.4201.3
  %subtract.226.2 = fsub double 1.000000e+00, %divide.617.2
  %51 = zext nneg i16 %50 to i64
  %52 = zext nneg i16 %49 to i64
  %53 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg03, i64 0, i64 %51, i64 %52
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !270
  %multiply.3032.3 = fmul double %54, %subtract.226.2
  %55 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg27, i64 0, i64 %51, i64 %52
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !270
  %multiply.3033.3 = fmul double %divide.617.2, %56
  %subtract.227.1 = fsub double %multiply.3032.3, %multiply.3033.3
  %57 = getelementptr double, ptr addrspace(1) %arg39, i64 %3
  store double %subtract.227.1, ptr addrspace(1) %57, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_exponential_fusion(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(122880) %arg5) local_unnamed_addr #2 {
entry:
  %arg560 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg458 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg356 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg254 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg152 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg050 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !281
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 20
  %4 = mul i16 %3, 20
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = and i16 %3, 1
  %6 = udiv i16 %.lhs.trunc, 40
  %7 = urem i16 %6, 192
  %8 = icmp ugt i32 %0, 59
  %9 = zext nneg i16 %5 to i64
  %10 = zext nneg i16 %.decomposed to i64
  br i1 %8, label %in_bounds-true, label %entry.in_bounds-after_crit_edge

entry.in_bounds-after_crit_edge:                  ; preds = %entry
  %.pre48 = zext nneg i16 %7 to i64
  %.phi.trans.insert = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg152, i64 0, i64 %9, i64 %10
  %.pre = load double, ptr addrspace(1) %.phi.trans.insert, align 8, !invariant.load !270
  %.phi.trans.insert62 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg050, i64 0, i64 %.pre48, i64 %9, i64 %10
  %.pre63 = load double, ptr addrspace(1) %.phi.trans.insert62, align 8, !invariant.load !270
  %.phi.trans.insert64 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg254, i64 0, i64 %9, i64 %10
  %.pre65 = load double, ptr addrspace(1) %.phi.trans.insert64, align 8, !invariant.load !270
  %.phi.trans.insert66 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg458, i64 0, i64 %9
  %.pre67 = load i64, ptr addrspace(1) %.phi.trans.insert66, align 8, !invariant.load !270
  %.phi.trans.insert68 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg356, i64 0, i64 %9, i64 %10
  %.pre69 = load double, ptr addrspace(1) %.phi.trans.insert68, align 8, !invariant.load !270
  %.pre70 = fmul double %.pre, %.pre63
  %.pre71 = sitofp i64 %.pre67 to double
  %.pre72 = fmul double %.pre71, 0x3F886F8FA34E82C5
  %.pre73 = fadd double %.pre69, %.pre69
  %.pre74 = fmul double %.pre72, %.pre73
  %.pre75 = fadd double %.pre65, %.pre74
  %.pre76 = fadd double %.pre70, %.pre75
  br label %in_bounds-after

in_bounds-after:                                  ; preds = %entry.in_bounds-after_crit_edge, %in_bounds-true
  %add.4202.334.1.pre-phi = phi double [ %.pre76, %entry.in_bounds-after_crit_edge ], [ %add.4202.3, %in_bounds-true ]
  %pad_result_addr.0 = phi double [ 0.000000e+00, %entry.in_bounds-after_crit_edge ], [ %add.4202.3, %in_bounds-true ]
  %11 = fcmp ole double %add.4202.334.1.pre-phi, 0.000000e+00
  %maximum.40.i.1 = select i1 %11, double 0.000000e+00, double %add.4202.334.1.pre-phi
  %subtract.228.3 = fsub double %pad_result_addr.0, %maximum.40.i.1
  %12 = tail call double @llvm.fma.f64(double %subtract.228.3, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #12
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #12
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %subtract.228.3)
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
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #12
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #12
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #12
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.3) #12
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #12
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %in_bounds-after
  %37 = fcmp olt double %subtract.228.3, 0.000000e+00
  %38 = fadd double %subtract.228.3, 0x7FF0000000000000
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #12
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #12
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %in_bounds-after, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %in_bounds-after ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %50 = zext nneg i32 %linear_index to i64
  %51 = getelementptr double, ptr addrspace(1) %arg560, i64 %50
  store double %z.2.i, ptr addrspace(1) %51, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  %52 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg152, i64 0, i64 %9, i64 %10
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !270
  %54 = zext nneg i16 %7 to i64
  %55 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg050, i64 0, i64 %54, i64 %9, i64 %10
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !270
  %multiply.3034.5 = fmul double %53, %56
  %57 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg254, i64 0, i64 %9, i64 %10
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !270
  %59 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg458, i64 0, i64 %9
  %60 = load i64, ptr addrspace(1) %59, align 8, !invariant.load !270
  %61 = sitofp i64 %60 to double
  %multiply.3000.77 = fmul double %61, 0x3F886F8FA34E82C5
  %62 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg356, i64 0, i64 %9, i64 %10
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !270
  %add.4172.70 = fadd double %63, %63
  %multiply.3018.15 = fmul double %multiply.3000.77, %add.4172.70
  %add.4182.13 = fadd double %58, %multiply.3018.15
  %add.4202.3 = fadd double %multiply.3034.5, %add.4182.13
  br label %in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !272
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 7680
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.16.in_bounds-true, label %loop_broadcast_fusion.16.in_bounds-after

loop_broadcast_fusion.16.in_bounds-after:         ; preds = %loop_broadcast_fusion.16.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.16.in_bounds-true:          ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.16.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define void @input_scatter_fusion_2(ptr noalias nocapture align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg1) local_unnamed_addr #9 {
entry:
  %arg130 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg028 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !282
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %param_1.172419 = getelementptr inbounds [20 x [192 x [1 x [1 x i32]]]], ptr addrspace(1) %arg130, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %param_1.172420 = load i32, ptr addrspace(1) %param_1.172419, align 4, !invariant.load !270
  %7 = icmp ult i32 %param_1.172420, 2
  %8 = zext nneg i32 %param_1.172420 to i64
  %9 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr addrspace(1) %arg028, i64 0, i64 %5, i64 %6, i64 %8
  br i1 %7, label %scatter.in_bounds-true, label %scatter.13.1.in_bounds-after

scatter.13.1.in_bounds-after:                     ; preds = %entry, %scatter.in_bounds-true
  ret void

scatter.in_bounds-true:                           ; preds = %entry
  %10 = atomicrmw fadd ptr addrspace(1) %9, double 1.000000e+00 seq_cst, align 8
  br label %scatter.13.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_concatenate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(11520) %arg2) local_unnamed_addr #2 {
entry:
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !282
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = load <2 x i64>, ptr addrspace(1) %arg117, align 128, !invariant.load !270
  %7 = extractelement <2 x i64> %6, i32 0
  %8 = extractelement <2 x i64> %6, i32 1
  %9 = icmp sge i64 %7, %5
  %10 = zext i1 %9 to i8
  %11 = zext nneg i16 %.decomposed to i64
  %12 = getelementptr inbounds [20 x [192 x [1 x [3 x i8]]]], ptr addrspace(1) %arg219, i64 0, i64 %5, i64 %11, i64 0, i64 0
  store i8 %10, ptr addrspace(1) %12, align 1
  %13 = icmp sge i64 %8, %11
  %14 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 1
  %15 = zext nneg i32 %linear_index to i64
  %16 = getelementptr i32, ptr addrspace(1) %arg015, i64 %15
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !270
  %18 = sext i32 %17 to i64
  %19 = icmp sgt i32 %17, -1
  %20 = getelementptr inbounds i8, ptr addrspace(1) %arg117, i64 16
  %21 = load i64, ptr addrspace(1) %20, align 16, !invariant.load !270
  %22 = icmp sge i64 %21, %18
  %23 = and i1 %19, %22
  %24 = insertelement <2 x i1> poison, i1 %13, i64 0
  %25 = insertelement <2 x i1> %24, i1 %23, i64 1
  %26 = zext <2 x i1> %25 to <2 x i8>
  store <2 x i8> %26, ptr addrspace(1) %14, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(122880) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(11520) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg10) local_unnamed_addr #2 {
entry:
  %arg10149 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9147 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8145 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7143 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6141 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5139 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4137 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3135 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2133 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1131 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0129 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !280
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 20
  %4 = mul i16 %3, 20
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = udiv i16 %.lhs.trunc, 40
  %6 = zext nneg i16 %.decomposed to i64
  %7 = zext nneg i16 %5 to i64
  %8 = getelementptr [20 x [192 x [2 x double]]], ptr addrspace(1) %arg1131, i64 0, i64 %6, i64 %7, i64 0
  %9 = load <2 x double>, ptr addrspace(1) %8, align 16, !invariant.load !270
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  %12 = and i16 %3, 1
  %13 = zext nneg i16 %12 to i64
  %14 = getelementptr inbounds [2 x [192 x [2 x [20 x double]]]], ptr addrspace(1) %arg0129, i64 0, i64 0, i64 %7, i64 %13, i64 %6
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !270
  %16 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 61440
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !270
  %18 = lshr i32 %linear_index, 1
  %.lhs.trunc102 = trunc nuw nsw i32 %18 to i16
  %19 = urem i16 %.lhs.trunc102, 192
  %.lhs.trunc104 = trunc nuw nsw i32 %2 to i16
  %20 = udiv i16 %.lhs.trunc104, 384
  %21 = zext nneg i16 %20 to i64
  %22 = zext nneg i16 %19 to i64
  %23 = getelementptr inbounds [20 x [192 x [1 x [3 x i8]]]], ptr addrspace(1) %arg8145, i64 0, i64 %21, i64 %22, i64 0, i64 0
  %24 = load i8, ptr addrspace(1) %23, align 1, !invariant.load !270
  %25 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 1
  %26 = load i8, ptr addrspace(1) %25, align 1, !invariant.load !270
  %27 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 2
  %28 = load i8, ptr addrspace(1) %27, align 1, !invariant.load !270
  %29 = and i32 %1, 1
  %narrow107 = mul nuw nsw i16 %20, 192
  %narrow108 = add nuw nsw i16 %19, %narrow107
  %narrow108.frozen = freeze i16 %narrow108
  %30 = udiv i16 %narrow108.frozen, 192
  %31 = icmp ugt i16 %narrow108, 3647
  %narrow127 = select i1 %31, i16 19, i16 %30
  %32 = mul i16 %30, 192
  %.decomposed128 = sub i16 %narrow108.frozen, %32
  %33 = zext nneg i16 %30 to i64
  %34 = zext nneg i16 %.decomposed128 to i64
  %35 = getelementptr inbounds [20 x [192 x [1 x [1 x i32]]]], ptr addrspace(1) %arg2133, i64 0, i64 %33, i64 %34, i64 0, i64 0
  %36 = load i32, ptr addrspace(1) %35, align 4, !invariant.load !270
  %37 = icmp sgt i32 %36, 0
  %38 = zext nneg i32 %29 to i64
  %39 = zext nneg i16 %narrow127 to i64
  br i1 %37, label %in_bounds-true, label %entry.in_bounds-after_crit_edge

entry.in_bounds-after_crit_edge:                  ; preds = %entry
  %.phi.trans.insert = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7143, i64 0, i64 %38, i64 %39
  %.pre = load double, ptr addrspace(1) %.phi.trans.insert, align 8, !invariant.load !270
  %.phi.trans.insert151 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg6141, i64 0, i64 %34, i64 %38, i64 %39
  %.pre152 = load double, ptr addrspace(1) %.phi.trans.insert151, align 8, !invariant.load !270
  %.phi.trans.insert153 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg3135, i64 0, i64 %38, i64 %39
  %.pre154 = load double, ptr addrspace(1) %.phi.trans.insert153, align 8, !invariant.load !270
  %.phi.trans.insert155 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg5139, i64 0, i64 %38
  %.pre156 = load i64, ptr addrspace(1) %.phi.trans.insert155, align 8, !invariant.load !270
  %.phi.trans.insert157 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg4137, i64 0, i64 %38, i64 %39
  %.pre158 = load double, ptr addrspace(1) %.phi.trans.insert157, align 8, !invariant.load !270
  br label %in_bounds-after

in_bounds-after:                                  ; preds = %entry.in_bounds-after_crit_edge, %in_bounds-true
  %40 = phi double [ %130, %in_bounds-true ], [ %.pre158, %entry.in_bounds-after_crit_edge ]
  %41 = phi i64 [ %127, %in_bounds-true ], [ %.pre156, %entry.in_bounds-after_crit_edge ]
  %42 = phi double [ %125, %in_bounds-true ], [ %.pre154, %entry.in_bounds-after_crit_edge ]
  %43 = phi double [ %123, %in_bounds-true ], [ %.pre152, %entry.in_bounds-after_crit_edge ]
  %44 = phi double [ %121, %in_bounds-true ], [ %.pre, %entry.in_bounds-after_crit_edge ]
  %pad_result_addr.0 = phi double [ %add.4202.5.clone.1, %in_bounds-true ], [ 0.000000e+00, %entry.in_bounds-after_crit_edge ]
  %45 = getelementptr inbounds [2 x [192 x [2 x [20 x double]]]], ptr addrspace(1) %arg0129, i64 0, i64 0, i64 %34, i64 %38, i64 %39
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !270
  %add.3969.i97 = fadd double %46, 0.000000e+00
  %47 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 61440
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !270
  %add.3969.i97.1 = fadd double %add.3969.i97, %48
  %49 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3969.i97.1) #12
  %50 = tail call i32 @llvm.nvvm.d2i.lo(double %add.3969.i97.1) #12
  %51 = icmp slt i32 %49, 1048576
  %52 = fmul double %add.3969.i97.1, 0x4350000000000000
  %53 = tail call i32 @llvm.nvvm.d2i.lo(double %52) #12
  %54 = tail call i32 @llvm.nvvm.d2i.hi(double %52) #12
  br i1 %51, label %55, label %56

55:                                               ; preds = %in_bounds-after
  br label %56

56:                                               ; preds = %55, %in_bounds-after
  %.0.i = phi double [ %52, %55 ], [ %add.3969.i97.1, %in_bounds-after ]
  %ihi.0.i = phi i32 [ %54, %55 ], [ %49, %in_bounds-after ]
  %ilo.0.i = phi i32 [ %53, %55 ], [ %50, %in_bounds-after ]
  %e.0.i = phi i32 [ -1077, %55 ], [ -1023, %in_bounds-after ]
  %57 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %57, 2146435071
  br i1 %or.cond.i, label %58, label %105

58:                                               ; preds = %56
  %59 = lshr i32 %ihi.0.i, 20
  %60 = add nsw i32 %e.0.i, %59
  %61 = and i32 %ihi.0.i, 1048575
  %62 = or disjoint i32 %61, 1072693248
  %63 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %62) #12
  %64 = icmp ugt i32 %62, 1073127582
  %65 = tail call i32 @llvm.nvvm.d2i.lo(double %63) #12
  %66 = tail call i32 @llvm.nvvm.d2i.hi(double %63) #12
  %67 = add i32 %66, -1048576
  %68 = tail call double @llvm.nvvm.lohi.i2d(i32 %65, i32 %67) #12
  %spec.select = select i1 %64, double %68, double %63
  %69 = zext i1 %64 to i32
  %spec.select106 = add nsw i32 %60, %69
  %70 = fadd double %spec.select, -1.000000e+00
  %71 = fadd double %spec.select, 1.000000e+00
  %72 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %71) #12
  %73 = fneg double %71
  %74 = tail call double @llvm.fma.f64(double %73, double %72, double 1.000000e+00)
  %75 = tail call double @llvm.fma.f64(double %74, double %74, double %74)
  %76 = tail call double @llvm.fma.f64(double %75, double %72, double %72)
  %77 = fmul double %70, %76
  %78 = fadd double %77, %77
  %79 = fmul double %78, %78
  %80 = tail call double @llvm.fma.f64(double %79, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %81 = tail call double @llvm.fma.f64(double %80, double %79, double 0x3EF3B2669F02676F)
  %82 = tail call double @llvm.fma.f64(double %81, double %79, double 0x3F1745CBA9AB0956)
  %83 = tail call double @llvm.fma.f64(double %82, double %79, double 0x3F3C71C72D1B5154)
  %84 = tail call double @llvm.fma.f64(double %83, double %79, double 0x3F624924923BE72D)
  %85 = tail call double @llvm.fma.f64(double %84, double %79, double 0x3F8999999999A3C4)
  %86 = tail call double @llvm.fma.f64(double %85, double %79, double 0x3FB5555555555554)
  %87 = fsub double %70, %78
  %88 = fmul double %87, 2.000000e+00
  %89 = fneg double %78
  %90 = tail call double @llvm.fma.f64(double %89, double %70, double %88)
  %91 = fmul double %76, %90
  %92 = fmul double %79, %86
  %93 = tail call double @llvm.fma.f64(double %92, double %78, double %91)
  %94 = xor i32 %spec.select106, -2147483648
  %95 = tail call double @llvm.nvvm.lohi.i2d(i32 %94, i32 1127219200) #12
  %96 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %97 = fsub double %95, %96
  %98 = tail call double @llvm.fma.f64(double %97, double 0x3FE62E42FEFA39EF, double %78)
  %99 = fneg double %97
  %100 = tail call double @llvm.fma.f64(double %99, double 0x3FE62E42FEFA39EF, double %98)
  %101 = fsub double %100, %78
  %102 = fsub double %93, %101
  %103 = tail call double @llvm.fma.f64(double %97, double 0x3C7ABC9E3B39803F, double %102)
  %104 = fadd double %98, %103
  br label %__nv_log.exit

105:                                              ; preds = %56
  %106 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %107 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %108 = and i32 %107, 2147483647
  %109 = icmp eq i32 %108, 0
  %q.0.i = select i1 %109, double 0xFFF0000000000000, double %106
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %58, %105
  %q.1.i = phi double [ %104, %58 ], [ %q.0.i, %105 ]
  %multiply.3034.7.clone.163.1 = fmul double %44, %43
  %110 = sitofp i64 %41 to double
  %multiply.3000.67.clone.165.1 = fmul double %110, 0x3F886F8FA34E82C5
  %add.4172.60.clone.166.1 = fadd double %40, %40
  %multiply.3018.5.clone.167.1 = fmul double %multiply.3000.67.clone.165.1, %add.4172.60.clone.166.1
  %add.4182.3.clone.168.1 = fadd double %42, %multiply.3018.5.clone.167.1
  %add.4202.5.clone.169.1 = fadd double %multiply.3034.7.clone.163.1, %add.4182.3.clone.168.1
  %111 = fcmp ole double %add.4202.5.clone.169.1, 0.000000e+00
  %maximum.40.i.1 = select i1 %111, double 0.000000e+00, double %add.4202.5.clone.169.1
  %add.3969.i = fadd double %10, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %11
  %add.3969.i96 = fadd double %15, 0.000000e+00
  %add.3969.i96.1 = fadd double %add.3969.i96, %17
  %112 = and i8 %26, %24
  %113 = and i8 %28, %112
  %subtract.228.9.clone.1 = fsub double %pad_result_addr.0, %maximum.40.i.1
  %114 = fneg double %add.3969.i.1
  %divide.618.3 = fdiv double %114, %add.3969.i96.1
  %multiply.3035.1 = fmul double %divide.618.3, %17
  %add.4204.1 = fadd double %11, %multiply.3035.1
  %subtract.229.5.clone.1 = fsub double %subtract.228.9.clone.1, %q.1.i
  %115 = trunc i8 %113 to i1
  %116 = select i1 %115, double %subtract.229.5.clone.1, double 0x7FF8000000000000
  %117 = zext nneg i32 %linear_index to i64
  %118 = getelementptr double, ptr addrspace(1) %arg9147, i64 %117
  store double %add.4204.1, ptr addrspace(1) %118, align 8
  %119 = getelementptr double, ptr addrspace(1) %arg10149, i64 %117
  store double %116, ptr addrspace(1) %119, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  %120 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7143, i64 0, i64 %38, i64 %39
  %121 = load double, ptr addrspace(1) %120, align 8, !invariant.load !270
  %122 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg6141, i64 0, i64 %34, i64 %38, i64 %39
  %123 = load double, ptr addrspace(1) %122, align 8, !invariant.load !270
  %multiply.3034.7.clone.1 = fmul double %121, %123
  %124 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg3135, i64 0, i64 %38, i64 %39
  %125 = load double, ptr addrspace(1) %124, align 8, !invariant.load !270
  %126 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg5139, i64 0, i64 %38
  %127 = load i64, ptr addrspace(1) %126, align 8, !invariant.load !270
  %128 = sitofp i64 %127 to double
  %multiply.3000.67.clone.1 = fmul double %128, 0x3F886F8FA34E82C5
  %129 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg4137, i64 0, i64 %38, i64 %39
  %130 = load double, ptr addrspace(1) %129, align 8, !invariant.load !270
  %add.4172.60.clone.1 = fadd double %130, %130
  %multiply.3018.5.clone.1 = fmul double %multiply.3000.67.clone.1, %add.4172.60.clone.1
  %add.4182.3.clone.1 = fadd double %125, %multiply.3018.5.clone.1
  %add.4202.5.clone.1 = fadd double %multiply.3034.7.clone.1, %add.4182.3.clone.1
  br label %in_bounds-after
}

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg8) local_unnamed_addr #4 {
entry:
  %arg864 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg762 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg660 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg558 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg456 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg354 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg252 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg150 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg048 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !271
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %.not = icmp eq i32 %block.id.x, 0
  %tile_bound.2 = select i1 %.not, i32 32, i32 8
  %tile_origin.2 = shl nuw nsw i32 %block.id.x, 5
  %1 = or disjoint i32 %tile_origin.2, %thread.id.2
  %.lhs.trunc = trunc nuw nsw i32 %1 to i8
  %2 = urem i8 %.lhs.trunc, 20
  %3 = udiv i8 %.lhs.trunc, 20
  %4 = zext nneg i8 %3 to i64
  %5 = zext nneg i8 %2 to i64
  %param_6.2479 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg660, i64 0, i64 %4, i64 %5
  %6 = add nuw nsw i32 %0, -32
  %7 = trunc i32 %block.id.x to i8
  %8 = shl nuw nsw i8 %7, 5
  %9 = trunc i32 %thread.id.x to i5
  %10 = zext i5 %9 to i8
  %11 = add i8 %8, %10
  %12 = udiv i8 %11, 20
  %13 = mul nuw nsw i8 %12, 20
  %14 = sub i8 %11, %13
  %15 = zext i8 %14 to i64
  %16 = shl nuw nsw i64 %15, 3
  %17 = zext nneg i32 %thread.id.x to i64
  %18 = lshr i64 %17, 5
  %19 = mul nuw nsw i64 %18, 320
  %20 = zext nneg i8 %11 to i64
  %21 = trunc i64 %20 to i32
  %22 = udiv i32 %21, 20
  %23 = zext i32 %22 to i64
  %24 = mul nuw nsw i64 %23, 160
  %25 = add i64 %19, %24
  %scevgep = getelementptr i8, ptr addrspace(1) %arg150, i64 %25
  %scevgep69 = getelementptr i8, ptr addrspace(1) %arg048, i64 %25
  %26 = mul nuw nsw i64 %18, 160
  %scevgep73 = getelementptr i8, ptr addrspace(1) %arg558, i64 %26
  %scevgep77 = getelementptr i8, ptr addrspace(1) %arg456, i64 %26
  %scevgep81 = getelementptr i8, ptr addrspace(1) %arg354, i64 %25
  %scevgep85 = getelementptr i8, ptr addrspace(1) %arg252, i64 %25
  %scevgep89 = getelementptr i8, ptr addrspace(1) %arg864, i64 %25
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv90 = phi ptr addrspace(1) [ %scevgep89, %entry ], [ %scevgep91, %x_in_tile-after ]
  %lsr.iv86 = phi ptr addrspace(1) [ %scevgep85, %entry ], [ %scevgep87, %x_in_tile-after ]
  %lsr.iv82 = phi ptr addrspace(1) [ %scevgep81, %entry ], [ %scevgep83, %x_in_tile-after ]
  %lsr.iv78 = phi ptr addrspace(1) [ %scevgep77, %entry ], [ %scevgep79, %x_in_tile-after ]
  %lsr.iv74 = phi ptr addrspace(1) [ %scevgep73, %entry ], [ %scevgep75, %x_in_tile-after ]
  %lsr.iv70 = phi ptr addrspace(1) [ %scevgep69, %entry ], [ %scevgep71, %x_in_tile-after ]
  %lsr.iv66 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep67, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %6, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.044 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %27 = icmp ult i32 %thread.id.2, %tile_bound.2
  br i1 %27, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %__nv_exp.exit, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3969.i43, %__nv_exp.exit ], [ %partial_reduction_result.044, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep67 = getelementptr i8, ptr addrspace(1) %lsr.iv66, i64 10240
  %scevgep71 = getelementptr i8, ptr addrspace(1) %lsr.iv70, i64 10240
  %scevgep75 = getelementptr i8, ptr addrspace(1) %lsr.iv74, i64 5120
  %scevgep79 = getelementptr i8, ptr addrspace(1) %lsr.iv78, i64 5120
  %scevgep83 = getelementptr i8, ptr addrspace(1) %lsr.iv82, i64 10240
  %scevgep87 = getelementptr i8, ptr addrspace(1) %lsr.iv86, i64 10240
  %scevgep91 = getelementptr i8, ptr addrspace(1) %lsr.iv90, i64 10240
  %28 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %28, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !283

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %29 = zext nneg i32 %thread.id.2 to i64
  %30 = zext nneg i32 %0 to i64
  %31 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %29, i64 %30
  store double %partial_reduction_result.1, ptr addrspace(3) %31, align 8
  tail call void @llvm.nvvm.barrier0()
  %32 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %30, i64 %29
  %partial_reduction_result173334 = load <2 x i32>, ptr addrspace(3) %32, align 8
  %33 = extractelement <2 x i32> %partial_reduction_result173334, i64 0
  %34 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %33, i32 16, i32 31)
  %35 = insertelement <2 x i32> poison, i32 %34, i64 0
  %36 = extractelement <2 x i32> %partial_reduction_result173334, i64 1
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 16, i32 31)
  %38 = insertelement <2 x i32> %35, i32 %37, i64 1
  %39 = bitcast <2 x i32> %38 to double
  %40 = bitcast <2 x i32> %partial_reduction_result173334 to double
  %add.3969.i = fadd double %40, %39
  %41 = bitcast double %add.3969.i to <2 x i32>
  %42 = extractelement <2 x i32> %41, i64 0
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 8, i32 31)
  %44 = insertelement <2 x i32> poison, i32 %43, i64 0
  %45 = extractelement <2 x i32> %41, i64 1
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 8, i32 31)
  %47 = insertelement <2 x i32> %44, i32 %46, i64 1
  %48 = bitcast <2 x i32> %47 to double
  %add.3969.i39 = fadd double %add.3969.i, %48
  %49 = bitcast double %add.3969.i39 to <2 x i32>
  %50 = extractelement <2 x i32> %49, i64 0
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 4, i32 31)
  %52 = insertelement <2 x i32> poison, i32 %51, i64 0
  %53 = extractelement <2 x i32> %49, i64 1
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 4, i32 31)
  %55 = insertelement <2 x i32> %52, i32 %54, i64 1
  %56 = bitcast <2 x i32> %55 to double
  %add.3969.i40 = fadd double %add.3969.i39, %56
  %57 = bitcast double %add.3969.i40 to <2 x i32>
  %58 = extractelement <2 x i32> %57, i64 0
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 2, i32 31)
  %60 = insertelement <2 x i32> poison, i32 %59, i64 0
  %61 = extractelement <2 x i32> %57, i64 1
  %62 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 2, i32 31)
  %63 = insertelement <2 x i32> %60, i32 %62, i64 1
  %64 = bitcast <2 x i32> %63 to double
  %add.3969.i41 = fadd double %add.3969.i40, %64
  %65 = bitcast double %add.3969.i41 to <2 x i32>
  %66 = extractelement <2 x i32> %65, i64 0
  %67 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %66, i32 1, i32 31)
  %68 = insertelement <2 x i32> poison, i32 %67, i64 0
  %69 = extractelement <2 x i32> %65, i64 1
  %70 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %69, i32 1, i32 31)
  %71 = insertelement <2 x i32> %68, i32 %70, i64 1
  %72 = bitcast <2 x i32> %71 to double
  %add.3969.i42 = fadd double %add.3969.i41, %72
  store double %add.3969.i42, ptr addrspace(3) %32, align 8
  %73 = icmp ult i32 %0, %tile_bound.2
  %74 = icmp eq i32 %thread.id.2, 0
  %75 = and i1 %74, %73
  br i1 %75, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %scevgep68 = getelementptr i8, ptr addrspace(1) %lsr.iv66, i64 %16
  %param_1.34892 = load double, ptr addrspace(1) %scevgep68, align 8, !invariant.load !270
  %scevgep72 = getelementptr i8, ptr addrspace(1) %lsr.iv70, i64 %16
  %param_0.24283 = load double, ptr addrspace(1) %scevgep72, align 8, !invariant.load !270
  %multiply.3048.3 = fmul double %param_1.34892, %param_0.24283
  %add.3969.i43 = fadd double %partial_reduction_result.044, %multiply.3048.3
  %param_6.24794 = load double, ptr addrspace(1) %param_6.2479, align 8, !invariant.load !270
  %multiply.3038.3.clone.1 = fmul double %param_1.34892, %param_6.24794
  %scevgep76 = getelementptr i8, ptr addrspace(1) %lsr.iv74, i64 %16
  %param_5.30227 = load double, ptr addrspace(1) %scevgep76, align 8, !invariant.load !270
  %scevgep80 = getelementptr i8, ptr addrspace(1) %lsr.iv78, i64 %16
  %param_4.36558 = load double, ptr addrspace(1) %scevgep80, align 8, !invariant.load !270
  %76 = fneg double %multiply.3038.3.clone.1
  %77 = fmul double %param_4.36558, %76
  %78 = fmul double %multiply.3038.3.clone.1, %param_5.30227
  %add.4208.7.clone.1 = fsub double %77, %78
  %scevgep84 = getelementptr i8, ptr addrspace(1) %lsr.iv82, i64 %16
  %param_3.49549 = load double, ptr addrspace(1) %scevgep84, align 8, !invariant.load !270
  %79 = fcmp ole double %param_3.49549, -3.000000e+01
  %80 = select i1 %79, double -3.000000e+01, double %param_3.49549
  %81 = fcmp oge double %80, 3.000000e+01
  %82 = select i1 %81, double 3.000000e+01, double %80
  %83 = fneg double %82
  %84 = tail call double @llvm.fma.f64(double %83, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %85 = tail call i32 @llvm.nvvm.d2i.lo(double %84) #12
  %86 = tail call double @llvm.nvvm.add.rn.d(double %84, double 0xC338000000000000) #12
  %87 = tail call double @llvm.fma.f64(double %86, double 0xBFE62E42FEFA39EF, double %83)
  %88 = tail call double @llvm.fma.f64(double %86, double 0xBC7ABC9E3B39803F, double %87)
  %89 = tail call double @llvm.fma.f64(double %88, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %90 = tail call double @llvm.fma.f64(double %89, double %88, double 0x3EC71DEE62401315)
  %91 = tail call double @llvm.fma.f64(double %90, double %88, double 0x3EFA01997C89EB71)
  %92 = tail call double @llvm.fma.f64(double %91, double %88, double 0x3F2A01A014761F65)
  %93 = tail call double @llvm.fma.f64(double %92, double %88, double 0x3F56C16C1852B7AF)
  %94 = tail call double @llvm.fma.f64(double %93, double %88, double 0x3F81111111122322)
  %95 = tail call double @llvm.fma.f64(double %94, double %88, double 0x3FA55555555502A1)
  %96 = tail call double @llvm.fma.f64(double %95, double %88, double 0x3FC5555555555511)
  %97 = tail call double @llvm.fma.f64(double %96, double %88, double 0x3FE000000000000B)
  %98 = tail call double @llvm.fma.f64(double %97, double %88, double 1.000000e+00)
  %99 = tail call double @llvm.fma.f64(double %98, double %88, double 1.000000e+00)
  %100 = tail call i32 @llvm.nvvm.d2i.lo(double %99) #12
  %101 = tail call i32 @llvm.nvvm.d2i.hi(double %99) #12
  %102 = shl i32 %85, 20
  %103 = add i32 %101, %102
  %104 = tail call double @llvm.nvvm.lohi.i2d(i32 %100, i32 %103) #12
  %105 = tail call i32 @llvm.nvvm.d2i.hi(double %83) #12
  %106 = bitcast i32 %105 to float
  %107 = tail call float @llvm.nvvm.fabs.f(float %106) #12
  %108 = fcmp olt float %107, 0x4010C46560000000
  br i1 %108, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %109 = fcmp ogt double %82, 0.000000e+00
  %110 = fsub double 0x7FF0000000000000, %82
  %z.0.i = select i1 %109, double 0.000000e+00, double %110
  %111 = fcmp olt float %107, 0x4010E90000000000
  br i1 %111, label %112, label %__nv_exp.exit

112:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %113 = sdiv i32 %85, 2
  %114 = shl i32 %113, 20
  %115 = add i32 %101, %114
  %116 = tail call double @llvm.nvvm.lohi.i2d(i32 %100, i32 %115) #12
  %117 = sub nsw i32 %85, %113
  %118 = shl i32 %117, 20
  %119 = add nsw i32 %118, 1072693248
  %120 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %119) #12
  %121 = fmul double %120, %116
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %112
  %z.2.i = phi double [ %104, %x_in_tile-true ], [ %121, %112 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.4201.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.617.3.clone.1 = fdiv double 1.000000e+00, %add.4201.1.clone.1
  %subtract.226.1.clone.1 = fsub double 1.000000e+00, %divide.617.3.clone.1
  %multiply.3041.1.clone.1 = fmul double %divide.617.3.clone.1, %subtract.226.1.clone.1
  %multiply.3042.5.clone.1 = fmul double %add.4208.7.clone.1, %multiply.3041.1.clone.1
  %compare.1151.1.clone.1 = fcmp oeq double %80, %82
  %scevgep88 = getelementptr i8, ptr addrspace(1) %lsr.iv86, i64 %16
  %param_2.584312 = load double, ptr addrspace(1) %scevgep88, align 8, !invariant.load !270
  %122 = select i1 %compare.1151.1.clone.1, double 1.000000e+00, double %param_2.584312
  %compare.1152.1.clone.1 = fcmp oeq double %82, 3.000000e+01
  %123 = select i1 %compare.1152.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.619.5.clone.1 = fdiv double %122, %123
  %multiply.3044.3.clone.1 = fmul double %divide.619.5.clone.1, %multiply.3042.5.clone.1
  %compare.1153.1.clone.1 = fcmp oeq double %param_3.49549, %80
  %124 = select i1 %compare.1153.1.clone.1, double 1.000000e+00, double %param_2.584312
  %compare.1154.1.clone.1 = fcmp oeq double %80, -3.000000e+01
  %125 = select i1 %compare.1154.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.620.3.clone.1 = fdiv double %124, %125
  %multiply.3045.1.clone.1 = fmul double %divide.620.3.clone.1, %multiply.3044.3.clone.1
  %scevgep92 = getelementptr i8, ptr addrspace(1) %lsr.iv90, i64 %16
  store double %multiply.3045.1.clone.1, ptr addrspace(1) %scevgep92, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %126 = or disjoint i32 %tile_origin.2, %0
  %127 = udiv i32 %126, 20
  %128 = mul i32 %127, 20
  %.decomposed = sub i32 %126, %128
  %129 = zext nneg i32 %127 to i64
  %130 = zext nneg i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg762, i64 0, i64 %129, i64 %130
  store double %add.3969.i42, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !270
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  store double %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !270
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load i32, ptr addrspace(1) %9, align 4, !invariant.load !270
  store i32 %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(40) %arg2) local_unnamed_addr #2 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp3 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp3, i32 %0, i32 %.urem
  %2 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !270
  %3 = sub i64 191, %2
  %4 = icmp slt i64 %3, 0
  %5 = sub i64 383, %2
  %6 = select i1 %4, i64 %5, i64 %3
  %7 = trunc i64 %6 to i32
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 191)
  %10 = zext nneg i32 %9 to i64
  %11 = zext i1 %.cmp to i64
  %12 = zext nneg i32 %1 to i64
  %13 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg04, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !270
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr i8, ptr addrspace(1) %arg28, i64 %15
  store i8 %14, ptr addrspace(1) %16, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp3 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp3, i32 %0, i32 %.urem
  %2 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !270
  %3 = sub i64 191, %2
  %4 = icmp slt i64 %3, 0
  %5 = sub i64 383, %2
  %6 = select i1 %4, i64 %5, i64 %3
  %7 = trunc i64 %6 to i32
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 191)
  %10 = zext nneg i32 %9 to i64
  %11 = zext i1 %.cmp to i64
  %12 = zext nneg i32 %1 to i64
  %13 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg04, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !270
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg28, i64 %15
  store double %14, ptr addrspace(1) %16, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg28) local_unnamed_addr #2 {
entry:
  %arg2888 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2786 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2684 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2582 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2480 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2378 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2276 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2174 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2072 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1970 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1868 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1766 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1664 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1562 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1460 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1358 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1256 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1154 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1052 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg950 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg848 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg746 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg644 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg542 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg440 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg338 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg236 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg134 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg032 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp31 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp31, i32 %0, i32 %.urem
  %2 = load i64, ptr addrspace(1) %arg848, align 128, !invariant.load !270
  %3 = sub i64 191, %2
  %4 = icmp slt i64 %3, 0
  %5 = sub i64 383, %2
  %6 = select i1 %4, i64 %5, i64 %3
  %7 = trunc i64 %6 to i32
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 191)
  %10 = zext nneg i32 %9 to i64
  %11 = zext i1 %.cmp to i64
  %12 = zext nneg i32 %1 to i64
  %13 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg440, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !270
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg236, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !270
  %18 = trunc i8 %14 to i1
  %19 = select i1 %18, double %17, double 0.000000e+00
  %20 = getelementptr double, ptr addrspace(1) %arg2174, i64 %15
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !270
  %22 = select i1 %18, double %21, double 0.000000e+00
  %23 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg2072, i64 0, i64 %10, i64 %11, i64 %12
  %24 = load i8, ptr addrspace(1) %23, align 1, !invariant.load !270
  %25 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1970, i64 0, i64 %10, i64 %11, i64 %12
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !270
  %27 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg1868, i64 0, i64 %10, i64 %11, i64 %12
  %28 = load i8, ptr addrspace(1) %27, align 1, !invariant.load !270
  %29 = getelementptr inbounds [192 x [2 x [20 x i32]]], ptr addrspace(1) %arg1766, i64 0, i64 %10, i64 %11, i64 %12
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !270
  %31 = icmp eq i32 %30, 1
  %32 = getelementptr double, ptr addrspace(1) %arg1664, i64 %15
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !270
  %34 = trunc i8 %28 to i1
  %35 = select i1 %34, i1 %31, i1 false
  %36 = select i1 %35, i1 %18, i1 false
  %37 = select i1 %36, double %33, double 0.000000e+00
  %38 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1256, i64 0, i64 %10, i64 %11, i64 %12
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !270
  %multiply.2896.11 = fmul double %39, %37
  %40 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1562, i64 0, i64 %10, i64 %11, i64 %12
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !270
  %multiply.2898.7 = fmul double %41, %multiply.2896.11
  %42 = fmul double %26, %multiply.2896.11
  %add.3976.7 = fsub double %multiply.2898.7, %42
  %43 = trunc i8 %24 to i1
  %44 = select i1 %43, double %add.3976.7, double 0.000000e+00
  %45 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1460, i64 0, i64 %10, i64 %11, i64 %12
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !270
  %47 = getelementptr double, ptr addrspace(1) %arg1358, i64 %15
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !270
  %49 = select i1 %18, double %48, double 0.000000e+00
  %multiply.2899.17 = fmul double %39, %49
  %50 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1154, i64 0, i64 %10, i64 %11, i64 %12
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !270
  %multiply.2900.13 = fmul double %51, %multiply.2899.17
  %multiply.2901.7 = fmul double %46, %multiply.2900.13
  %add.3977.7 = fadd double %44, %multiply.2901.7
  %add.3978.5 = fadd double %22, %add.3977.7
  %52 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg338, i64 0, i64 %10, i64 %11, i64 %12
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !270
  %54 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg134, i64 0, i64 %10, i64 %11, i64 %12
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !270
  %56 = fneg double %add.3978.5
  %57 = fmul double %53, %56
  %58 = fmul double %55, %57
  %add.3979.3 = fadd double %19, %58
  %59 = getelementptr double, ptr addrspace(1) %arg644, i64 %15
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !270
  %61 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg746, i64 0, i64 %10, i64 %11, i64 %12
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !270
  %add.3975.3 = fadd double %60, %62
  %63 = select i1 %18, double %add.3975.3, double 0.000000e+00
  %64 = getelementptr double, ptr addrspace(1) %arg1052, i64 %15
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !270
  %66 = select i1 %18, double %65, double 0.000000e+00
  %multiply.2904.9 = fmul double %55, %add.3978.5
  %67 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg950, i64 0, i64 %10, i64 %11, i64 %12
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !270
  %multiply.2905.7 = fmul double %multiply.2904.9, %68
  %add.3980.5 = fadd double %66, %multiply.2905.7
  %add.3981.5 = fadd double %63, %add.3980.5
  %69 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg542, i64 0, i64 %10, i64 %11, i64 %12
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !270
  %71 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg032, i64 0, i64 %10, i64 %11, i64 %12
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !270
  %73 = fneg double %add.3981.5
  %74 = fmul double %70, %73
  %75 = fmul double %53, %74
  %76 = fmul double %72, %75
  %add.3982.1 = fadd double %add.3979.3, %76
  %77 = getelementptr double, ptr addrspace(1) %arg2276, i64 %15
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !270
  %79 = select i1 %18, double 0.000000e+00, double %78
  %80 = getelementptr double, ptr addrspace(1) %arg2378, i64 %15
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !270
  %82 = select i1 %18, double 0.000000e+00, double %81
  %83 = getelementptr double, ptr addrspace(1) %arg2480, i64 %15
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !270
  %85 = select i1 %18, double 0.000000e+00, double %84
  %86 = getelementptr double, ptr addrspace(1) %arg2582, i64 %15
  store double %add.3982.1, ptr addrspace(1) %86, align 8
  %87 = getelementptr double, ptr addrspace(1) %arg2684, i64 %15
  store double %79, ptr addrspace(1) %87, align 8
  %88 = getelementptr double, ptr addrspace(1) %arg2786, i64 %15
  store double %82, ptr addrspace(1) %88, align 8
  %89 = getelementptr double, ptr addrspace(1) %arg2888, i64 %15
  store double %85, ptr addrspace(1) %89, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !267
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !267
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !270
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !270
  %9 = fneg double %6
  %10 = fmul double %8, %9
  %multiply.2891.3.clone.1 = fmul double %4, %10
  %multiply.2892.1.clone.1 = fmul double %8, %multiply.2891.3.clone.1
  %multiply.2893.1 = fmul double %3, %multiply.2892.1.clone.1
  %11 = fneg double %10
  %12 = fmul double %8, %11
  %13 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.2893.1, ptr addrspace(1) %13, align 8
  %14 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %multiply.2892.1.clone.1, ptr addrspace(1) %14, align 8
  %15 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %12, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(40) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = getelementptr i8, ptr addrspace(1) %arg25, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !270
  %6 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !270
  %8 = trunc i8 %5 to i1
  %9 = select i1 %8, double %7, double 0.000000e+00
  %10 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !270
  %multiply.2894.3 = fmul double %9, %10
  %multiply.2895.1 = fmul double %3, %multiply.2894.3
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.2895.1, ptr addrspace(1) %11, align 8
  %12 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %9, ptr addrspace(1) %12, align 8
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg8, ptr noalias nocapture align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg13, ptr noalias nocapture align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg18, ptr noalias nocapture align 128 dereferenceable(320) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture align 128 dereferenceable(320) %arg23, ptr noalias nocapture align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg26, ptr noalias nocapture align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg35, ptr noalias nocapture align 128 dereferenceable(320) %arg36, ptr noalias nocapture align 128 dereferenceable(320) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg38, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg41, ptr noalias nocapture align 128 dereferenceable(320) %arg42, ptr noalias nocapture readnone align 128 dereferenceable(7680) %arg43, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg45, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg46, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg48, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg50, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg54, ptr noalias nocapture align 128 dereferenceable(320) %arg55, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg56, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg57, ptr noalias nocapture align 128 dereferenceable(320) %arg58, ptr noalias nocapture align 128 dereferenceable(320) %arg59, ptr noalias nocapture align 128 dereferenceable(320) %arg60, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg61, ptr noalias nocapture align 128 dereferenceable(320) %arg62, ptr noalias nocapture align 128 dereferenceable(320) %arg63, ptr noalias nocapture align 128 dereferenceable(320) %arg64, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg65, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg66, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg67, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg68, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg69, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg70, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg71, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg72, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg73, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg74, ptr noalias nocapture align 128 dereferenceable(320) %arg75, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg76) local_unnamed_addr #2 {
entry:
  %arg76251 = addrspacecast ptr %arg76 to ptr addrspace(1)
  %arg75249 = addrspacecast ptr %arg75 to ptr addrspace(1)
  %arg74247 = addrspacecast ptr %arg74 to ptr addrspace(1)
  %arg73245 = addrspacecast ptr %arg73 to ptr addrspace(1)
  %arg72243 = addrspacecast ptr %arg72 to ptr addrspace(1)
  %arg71241 = addrspacecast ptr %arg71 to ptr addrspace(1)
  %arg70239 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69237 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68235 = addrspacecast ptr %arg68 to ptr addrspace(1)
  %arg67233 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66231 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg65229 = addrspacecast ptr %arg65 to ptr addrspace(1)
  %arg64227 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63225 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62223 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61221 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60219 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59217 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58215 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57213 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56211 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55209 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54207 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53205 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52203 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51201 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50199 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49197 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48195 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47193 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46191 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45189 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44187 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg42183 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41181 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40179 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39177 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38175 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37173 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36171 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35169 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34167 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33165 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32163 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31161 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30159 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29157 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28155 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27153 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26151 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25149 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24147 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23145 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22143 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21141 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20139 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19137 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18135 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17133 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16131 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15129 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14127 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13125 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12123 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11121 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10119 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9117 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8115 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7113 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6111 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5109 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4107 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3105 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2103 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1101 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg099 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.urem = add nsw i32 %0, -20
  %.cmp = icmp ult i32 %0, 20
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %.cmp98 = icmp ugt i32 %0, 19
  %2 = load i64, ptr addrspace(1) %arg2103, align 128, !invariant.load !270
  %3 = sub i64 191, %2
  %4 = icmp slt i64 %3, 0
  %5 = sub i64 383, %2
  %6 = select i1 %4, i64 %5, i64 %3
  %7 = trunc i64 %6 to i32
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 191)
  %10 = zext nneg i32 %9 to i64
  %11 = zext i1 %.cmp98 to i64
  %12 = zext nneg i32 %1 to i64
  %13 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg1101, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !270
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg099, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8
  %18 = trunc i8 %14 to i1
  %19 = select i1 %18, double 0.000000e+00, double %17
  %20 = getelementptr double, ptr addrspace(1) %arg9117, i64 %15
  %21 = load double, ptr addrspace(1) %20, align 8
  %22 = select i1 %18, double 0.000000e+00, double %21
  %23 = getelementptr double, ptr addrspace(1) %arg4107, i64 %15
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !270
  %25 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg21141, i64 0, i64 %10, i64 %11, i64 %12
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !270
  %27 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg20139, i64 0, i64 %10, i64 %11, i64 %12
  %28 = load i8, ptr addrspace(1) %27, align 1, !invariant.load !270
  %29 = getelementptr double, ptr addrspace(1) %arg37173, i64 %15
  %30 = load double, ptr addrspace(1) %29, align 8
  %31 = select i1 %18, double %30, double 0.000000e+00
  %32 = getelementptr double, ptr addrspace(1) %arg36171, i64 %15
  %33 = load double, ptr addrspace(1) %32, align 8
  %34 = select i1 %18, double %33, double 0.000000e+00
  %35 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg18135, i64 0, i64 %10, i64 %11, i64 %12
  %36 = load i8, ptr addrspace(1) %35, align 1, !invariant.load !270
  %37 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg35169, i64 0, i64 %10, i64 %11, i64 %12
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !270
  %39 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg16131, i64 0, i64 %10, i64 %11, i64 %12
  %40 = load i8, ptr addrspace(1) %39, align 1, !invariant.load !270
  %41 = getelementptr inbounds [192 x [2 x [20 x i32]]], ptr addrspace(1) %arg15129, i64 0, i64 %10, i64 %11, i64 %12
  %42 = load i32, ptr addrspace(1) %41, align 4, !invariant.load !270
  %43 = icmp eq i32 %42, 1
  %44 = getelementptr double, ptr addrspace(1) %arg14127, i64 %15
  %45 = load double, ptr addrspace(1) %44, align 8
  %46 = select i1 %18, double %45, double 0.000000e+00
  %47 = trunc i8 %40 to i1
  %48 = select i1 %47, i1 %43, i1 false
  %49 = select i1 %48, double %46, double 0.000000e+00
  %50 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg13125, i64 0, i64 %10, i64 %11, i64 %12
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !270
  %multiply.2896.13.clone.1 = fmul double %51, %49
  %52 = fneg double %multiply.2896.13.clone.1
  %53 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg34167, i64 0, i64 %10, i64 %11, i64 %12
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !270
  %multiply.2898.9.clone.1 = fmul double %54, %multiply.2896.13.clone.1
  %55 = fmul double %38, %multiply.2896.13.clone.1
  %add.3976.9.clone.1 = fsub double %multiply.2898.9.clone.1, %55
  %56 = trunc i8 %36 to i1
  %57 = select i1 %56, double %add.3976.9.clone.1, double 0.000000e+00
  %58 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg33165, i64 0, i64 %10, i64 %11, i64 %12
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !270
  %60 = select i1 %18, double %21, double 0.000000e+00
  %multiply.2899.19.clone.1 = fmul double %60, %51
  %61 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg8115, i64 0, i64 %10, i64 %11, i64 %12
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !270
  %multiply.2900.15.clone.1 = fmul double %multiply.2899.19.clone.1, %62
  %multiply.2901.9.clone.1 = fmul double %59, %multiply.2900.15.clone.1
  %add.3977.9.clone.1 = fadd double %57, %multiply.2901.9.clone.1
  %add.3978.7.clone.1 = fadd double %34, %add.3977.9.clone.1
  %63 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg32163, i64 0, i64 %10, i64 %11, i64 %12
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !270
  %multiply.2919.5.clone.1 = fmul double %64, %add.3978.7.clone.1
  %65 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg31161, i64 0, i64 %10, i64 %11, i64 %12
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !270
  %divide.598.5.clone.1 = fdiv double %add.3978.7.clone.1, %66
  %add.4000.3.clone.1 = fadd double %multiply.2919.5.clone.1, %divide.598.5.clone.1
  %add.4001.7.clone.1 = fadd double %31, %add.4000.3.clone.1
  %67 = getelementptr double, ptr addrspace(1) %arg30159, i64 %15
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !270
  %add.4002.5.clone.1 = fadd double %68, %add.4001.7.clone.1
  %69 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg29157, i64 0, i64 %10, i64 %11, i64 %12
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !270
  %71 = getelementptr double, ptr addrspace(1) %arg19137, i64 %15
  %72 = load double, ptr addrspace(1) %71, align 8
  %73 = select i1 %18, double %72, double 0.000000e+00
  %74 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg17133, i64 0, i64 %10, i64 %11, i64 %12
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !270
  %76 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg12123, i64 0, i64 %10, i64 %11, i64 %12
  %77 = load double, ptr addrspace(1) %76, align 8, !invariant.load !270
  %multiply.2920.9.clone.1 = fmul double %77, %52
  %multiply.2921.11.clone.1 = fmul double %75, %multiply.2920.9.clone.1
  %78 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg11121, i64 0, i64 %10, i64 %11, i64 %12
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !270
  %multiply.2922.11.clone.1 = fmul double %multiply.2896.13.clone.1, %77
  %80 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg10119, i64 0, i64 %10, i64 %11, i64 %12
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !270
  %multiply.2923.9.clone.1 = fmul double %multiply.2922.11.clone.1, %81
  %multiply.2924.7.clone.1 = fmul double %79, %multiply.2923.9.clone.1
  %add.4003.9.clone.1 = fadd double %multiply.2921.11.clone.1, %multiply.2924.7.clone.1
  %multiply.2925.11.clone.1 = fmul double %multiply.2896.13.clone.1, 5.000000e-01
  %multiply.2926.9.clone.1 = fmul double %multiply.2925.11.clone.1, %81
  %multiply.2927.7.clone.1 = fmul double %79, %multiply.2926.9.clone.1
  %add.4004.7.clone.1 = fadd double %multiply.2927.7.clone.1, %add.4003.9.clone.1
  %82 = select i1 %56, double %add.4004.7.clone.1, double 0.000000e+00
  %multiply.2928.9.clone.1 = fmul double %multiply.2900.15.clone.1, %77
  %multiply.2929.7.clone.1 = fmul double %79, %multiply.2928.9.clone.1
  %add.4005.9.clone.1 = fadd double %multiply.2929.7.clone.1, %82
  %add.4006.7.clone.1 = fadd double %73, %add.4005.9.clone.1
  %83 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg7113, i64 0, i64 %12
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !270
  %add.4007.5.clone.1 = fadd double %84, %add.4006.7.clone.1
  %multiply.2930.3.clone.1 = fmul double %70, %add.4007.5.clone.1
  %add.4008.3.clone.1 = fadd double %add.4002.5.clone.1, %multiply.2930.3.clone.1
  %85 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg28155, i64 0, i64 %10, i64 %11, i64 %12
  %86 = load double, ptr addrspace(1) %85, align 8, !invariant.load !270
  %87 = fneg double %add.4008.3.clone.1
  %88 = fmul double %86, %87
  %89 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg6111, i64 0, i64 %10, i64 %11, i64 %12
  %90 = load double, ptr addrspace(1) %89, align 8, !invariant.load !270
  %multiply.2935.7.clone.1 = fmul double %90, %add.4007.5.clone.1
  %add.4016.5.clone.1 = fadd double %multiply.2935.7.clone.1, %88
  %91 = trunc i8 %28 to i1
  %92 = select i1 %91, double %add.4016.5.clone.1, double 0.000000e+00
  %93 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg5109, i64 0, i64 %10, i64 %11, i64 %12
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !270
  %multiply.2936.3.clone.1 = fmul double %94, %92
  %multiply.2937.5.clone.1 = fmul double %26, %multiply.2936.3.clone.1
  %add.4019.3.clone.1 = fadd double %24, %multiply.2937.5.clone.1
  %95 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg3105, i64 0, i64 %10, i64 %11, i64 %12
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !270
  %97 = select i1 %18, double %17, double 0.000000e+00
  %add.4020.3.clone.1 = fadd double %97, %60
  %add.4021.7.clone.1 = fadd double %add.4020.3.clone.1, %84
  %multiply.2938.5.clone.1 = fmul double %add.4021.7.clone.1, %96
  %add.4022.3.clone.1 = fadd double %multiply.2938.5.clone.1, %add.4019.3.clone.1
  %add.4023.1.clone.1 = fadd double %22, %add.4022.3.clone.1
  %98 = getelementptr double, ptr addrspace(1) %arg23145, i64 %15
  %99 = load double, ptr addrspace(1) %98, align 8
  %add.4015.3.clone.1 = fadd double %99, 0.000000e+00
  %100 = getelementptr double, ptr addrspace(1) %arg22143, i64 %15
  %101 = load double, ptr addrspace(1) %100, align 8, !invariant.load !270
  %add.4017.1.clone.1 = fadd double %101, %multiply.2936.3.clone.1
  %add.4018.1.clone.1 = fadd double %add.4015.3.clone.1, %add.4017.1.clone.1
  %102 = getelementptr double, ptr addrspace(1) %arg24147, i64 %15
  %103 = load double, ptr addrspace(1) %102, align 8
  %104 = select i1 %18, double 0.000000e+00, double %103
  %105 = getelementptr double, ptr addrspace(1) %arg27153, i64 %15
  %106 = load double, ptr addrspace(1) %105, align 8
  %107 = select i1 %18, double 0.000000e+00, double %106
  %108 = getelementptr double, ptr addrspace(1) %arg25149, i64 %15
  %109 = load double, ptr addrspace(1) %108, align 8, !invariant.load !270
  %110 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg26151, i64 0, i64 %10, i64 %11, i64 %12
  %111 = load double, ptr addrspace(1) %110, align 8, !invariant.load !270
  %112 = select i1 %18, double %103, double 0.000000e+00
  %add.4009.3.clone.1 = fadd double %84, %112
  %113 = fneg double %add.4009.3.clone.1
  %114 = fmul double %111, %113
  %115 = fmul double %88, %111
  %add.4010.5.clone.1 = fsub double %114, %115
  %add.4011.3.clone.1 = fadd double %109, %add.4010.5.clone.1
  %add.4012.1.clone.1 = fadd double %107, %add.4011.3.clone.1
  %116 = select i1 %18, double 0.000000e+00, double %72
  %117 = getelementptr double, ptr addrspace(1) %arg42183, i64 %15
  %118 = load double, ptr addrspace(1) %117, align 8
  %add.4042.3.clone.1 = fadd double %118, 0.000000e+00
  %119 = getelementptr inbounds [192 x [1 x [2 x [20 x i8]]]], ptr addrspace(1) %arg41181, i64 0, i64 %10, i64 0, i64 %11, i64 %12
  %120 = load i8, ptr addrspace(1) %119, align 1, !invariant.load !270
  %121 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg40179, i64 0, i64 %10, i64 %11, i64 %12
  %122 = load double, ptr addrspace(1) %121, align 8, !invariant.load !270
  %multiply.2952.7.clone.1 = fmul double %multiply.2920.9.clone.1, %122
  %multiply.2953.7.clone.1 = fmul double %multiply.2952.7.clone.1, 5.000000e-01
  %123 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg39177, i64 0, i64 %10, i64 %11, i64 %12
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !270
  %multiply.2954.5.clone.1 = fmul double %124, %multiply.2953.7.clone.1
  %multiply.2955.7.clone.1 = fmul double %multiply.2923.9.clone.1, %122
  %add.4043.5.clone.1 = fadd double %multiply.2955.7.clone.1, %multiply.2954.5.clone.1
  %multiply.2956.7.clone.1 = fmul double %multiply.2926.9.clone.1, %122
  %add.4044.5.clone.1 = fadd double %multiply.2956.7.clone.1, %add.4043.5.clone.1
  %125 = trunc i8 %120 to i1
  %126 = select i1 %125, double %add.4044.5.clone.1, double 0.000000e+00
  %multiply.2957.5.clone.1 = fmul double %multiply.2928.9.clone.1, %122
  %add.4046.3.clone.1 = fadd double %multiply.2957.5.clone.1, %126
  %127 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg38175, i64 0, i64 %12, i64 0
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !270
  %add.4047.3.clone.1 = fadd double %128, %add.4046.3.clone.1
  %add.4048.1.clone.1 = fadd double %add.4042.3.clone.1, %add.4047.3.clone.1
  %129 = getelementptr double, ptr addrspace(1) %arg60219, i64 %15
  %130 = load double, ptr addrspace(1) %129, align 8
  %131 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg61221, i64 0, i64 %10, i64 %11, i64 %12
  %132 = load double, ptr addrspace(1) %131, align 8, !invariant.load !270
  %add.3975.5.clone.1 = fadd double %130, %132
  %133 = select i1 %18, double 0.000000e+00, double %add.3975.5.clone.1
  %134 = getelementptr double, ptr addrspace(1) %arg59217, i64 %15
  %135 = load double, ptr addrspace(1) %134, align 8
  %136 = select i1 %18, double %135, double 0.000000e+00
  %137 = getelementptr double, ptr addrspace(1) %arg58215, i64 %15
  %138 = load double, ptr addrspace(1) %137, align 8
  %139 = select i1 %18, double %138, double 0.000000e+00
  %multiply.2904.7.clone.1 = fmul double %add.3978.7.clone.1, %90
  %140 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg57213, i64 0, i64 %10, i64 %11, i64 %12
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !270
  %multiply.2905.5.clone.1 = fmul double %multiply.2904.7.clone.1, %141
  %add.3980.3.clone.1 = fadd double %139, %multiply.2905.5.clone.1
  %add.3983.3.clone.1 = fsub double %136, %add.3980.3.clone.1
  %142 = select i1 %18, double %add.3975.5.clone.1, double 0.000000e+00
  %add.3981.3.clone.1 = fadd double %142, %add.3980.3.clone.1
  %add.3984.9.clone.1 = fadd double %84, %add.3981.3.clone.1
  %add.3985.7.clone.1 = fadd double %add.3983.3.clone.1, %add.3984.9.clone.1
  %143 = getelementptr double, ptr addrspace(1) %arg56211, i64 %15
  %144 = load double, ptr addrspace(1) %143, align 8, !invariant.load !270
  %145 = select i1 %18, double %144, double 0.000000e+00
  %add.3986.5.clone.1 = fadd double %84, %145
  %146 = getelementptr double, ptr addrspace(1) %arg55209, i64 %15
  %147 = load double, ptr addrspace(1) %146, align 8
  %148 = select i1 %18, double %147, double 0.000000e+00
  %149 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg54207, i64 0, i64 %10, i64 %11, i64 %12
  %150 = load double, ptr addrspace(1) %149, align 8, !invariant.load !270
  %multiply.2909.7.clone.1 = fmul double %150, %add.3981.3.clone.1
  %151 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg53205, i64 0, i64 %10
  %152 = load double, ptr addrspace(1) %151, align 8, !invariant.load !270
  %multiply.2910.7.clone.1 = fmul double %multiply.2909.7.clone.1, %152
  %add.3987.7.clone.1 = fadd double %84, %multiply.2910.7.clone.1
  %add.3988.5.clone.1 = fadd double %148, %add.3987.7.clone.1
  %153 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg52203, i64 0, i64 %10, i64 %11, i64 %12
  %154 = load double, ptr addrspace(1) %153, align 8, !invariant.load !270
  %155 = fneg double %add.3988.5.clone.1
  %156 = fdiv double %155, %154
  %157 = fmul double %152, %156
  %add.3989.5.clone.1 = fadd double %add.3986.5.clone.1, %157
  %158 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg51201, i64 0, i64 %10, i64 %11, i64 %12
  %159 = load double, ptr addrspace(1) %158, align 8, !invariant.load !270
  %160 = getelementptr double, ptr addrspace(1) %arg50199, i64 %15
  %161 = load double, ptr addrspace(1) %160, align 8, !invariant.load !270
  %162 = getelementptr double, ptr addrspace(1) %arg49197, i64 %15
  %163 = load double, ptr addrspace(1) %162, align 8, !invariant.load !270
  %164 = fadd double %161, %163
  %add.3990.9.clone.1 = select i1 %18, double %164, double 0.000000e+00
  %165 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg48195, i64 0, i64 %10, i64 %11, i64 %12
  %166 = load double, ptr addrspace(1) %165, align 8, !invariant.load !270
  %multiply.2906.3.clone.1 = fmul double %add.3981.3.clone.1, %166
  %divide.597.7.clone.1 = fdiv double %multiply.2906.3.clone.1, %66
  %multiply.2912.9.clone.1 = fmul double %26, %divide.597.7.clone.1
  %167 = getelementptr double, ptr addrspace(1) %arg47193, i64 %15
  %168 = load double, ptr addrspace(1) %167, align 8, !invariant.load !270
  %add.3991.7.clone.1 = fadd double %168, %multiply.2912.9.clone.1
  %add.3992.7.clone.1 = fadd double %add.3990.9.clone.1, %add.3991.7.clone.1
  %add.3993.7.clone.1 = fadd double %84, %add.3992.7.clone.1
  %169 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg46191, i64 0, i64 %10, i64 %11, i64 %12
  %170 = load double, ptr addrspace(1) %169, align 8, !invariant.load !270
  %171 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg45189, i64 0, i64 %10, i64 %11, i64 %12
  %172 = load double, ptr addrspace(1) %171, align 8, !invariant.load !270
  %173 = fmul double %170, %155
  %174 = fmul double %173, %172
  %add.3994.5.clone.1 = fadd double %174, %add.3993.7.clone.1
  %175 = fmul double %159, %add.3994.5.clone.1
  %add.3995.7.clone.1 = fsub double %add.3989.5.clone.1, %175
  %176 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg44187, i64 0, i64 %10, i64 %11, i64 %12
  %177 = load double, ptr addrspace(1) %176, align 8, !invariant.load !270
  %multiply.2916.5.clone.1 = fmul double %177, %add.3994.5.clone.1
  %add.3996.5.clone.1 = fadd double %multiply.2916.5.clone.1, %add.3995.7.clone.1
  %multiply.2917.3.clone.1 = fmul double %154, %add.3996.5.clone.1
  %add.3997.5.clone.1 = fadd double %add.3985.7.clone.1, %multiply.2917.3.clone.1
  %multiply.2918.3.clone.1 = fmul double %96, %add.3997.5.clone.1
  %add.3998.3.clone.1 = fadd double %84, %multiply.2918.3.clone.1
  %add.3999.1.clone.1 = fadd double %133, %add.3998.3.clone.1
  %178 = getelementptr double, ptr addrspace(1) %arg62223, i64 %15
  %179 = load double, ptr addrspace(1) %178, align 8
  %180 = select i1 %18, double 0.000000e+00, double %179
  %181 = getelementptr double, ptr addrspace(1) %arg63225, i64 %15
  %182 = load double, ptr addrspace(1) %181, align 8
  %183 = select i1 %18, double 0.000000e+00, double %182
  %184 = getelementptr double, ptr addrspace(1) %arg64227, i64 %15
  %185 = load double, ptr addrspace(1) %184, align 8
  %186 = select i1 %18, double 0.000000e+00, double %185
  %187 = getelementptr double, ptr addrspace(1) %arg75249, i64 %15
  %188 = load double, ptr addrspace(1) %187, align 8
  %add.4036.3.clone.1.clone.1 = fadd double %188, 0.000000e+00
  %189 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg74247, i64 0, i64 %10, i64 %11, i64 %12
  %190 = load i8, ptr addrspace(1) %189, align 1, !invariant.load !270
  %191 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg73245, i64 0, i64 %10, i64 %11, i64 %12
  %192 = load double, ptr addrspace(1) %191, align 8, !invariant.load !270
  %193 = icmp eq i32 %42, 0
  %194 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg72243, i64 0, i64 %10, i64 %11, i64 %12
  %195 = load double, ptr addrspace(1) %194, align 8, !invariant.load !270
  %.neg = fneg double %46
  %196 = select i1 %193, double %.neg, double -0.000000e+00
  %197 = fmul double %196, %195
  %multiply.2948.5.clone.1.clone.1 = fmul double %192, %197
  %198 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg71241, i64 0, i64 %10, i64 %11, i64 %12
  %199 = load double, ptr addrspace(1) %198, align 8, !invariant.load !270
  %multiply.2949.3.clone.1.clone.1 = fmul double %199, %multiply.2948.5.clone.1.clone.1
  %200 = trunc i8 %190 to i1
  %201 = select i1 %200, double %multiply.2949.3.clone.1.clone.1, double 0.000000e+00
  %add.4037.5.clone.1.clone.1 = fadd double %84, %201
  %202 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg70239, i64 0, i64 %10, i64 %11, i64 %12
  %203 = load i8, ptr addrspace(1) %202, align 1, !invariant.load !270
  %204 = select i1 %18, double %179, double 0.000000e+00
  %205 = select i1 %56, double %49, double 0.000000e+00
  %206 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg69237, i64 0, i64 %10, i64 %11, i64 %12
  %207 = load double, ptr addrspace(1) %206, align 8, !invariant.load !270
  %208 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg68235, i64 0, i64 %10, i64 %11, i64 %12
  %209 = load double, ptr addrspace(1) %208, align 8, !invariant.load !270
  %210 = fneg double %207
  %211 = fmul double %multiply.2899.19.clone.1, %210
  %212 = fmul double %211, %209
  %multiply.2943.9.clone.1.clone.1 = fmul double %212, 2.000000e+00
  %add.4025.7.clone.1.clone.1 = fadd double %205, %multiply.2943.9.clone.1.clone.1
  %add.4026.5.clone.1.clone.1 = fadd double %204, %add.4025.7.clone.1.clone.1
  %add.4027.7.clone.1.clone.1 = fadd double %84, %add.4026.5.clone.1.clone.1
  %213 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg67233, i64 0, i64 %10, i64 %11, i64 %12
  %214 = load double, ptr addrspace(1) %213, align 8, !invariant.load !270
  %215 = select i1 %18, double %185, double 0.000000e+00
  %add.4028.7.clone.1.clone.1 = fadd double %84, %215
  %multiply.2944.5.clone.1.clone.1 = fmul double %add.4028.7.clone.1.clone.1, %214
  %add.4029.5.clone.1.clone.1 = fadd double %multiply.2944.5.clone.1.clone.1, %add.4027.7.clone.1.clone.1
  %216 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg66231, i64 0, i64 %10, i64 %11, i64 %12
  %217 = load double, ptr addrspace(1) %216, align 8, !invariant.load !270
  %218 = fneg double %add.4029.5.clone.1.clone.1
  %219 = fmul double %217, %218
  %220 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg65229, i64 0, i64 %10, i64 %11, i64 %12
  %221 = load double, ptr addrspace(1) %220, align 8, !invariant.load !270
  %multiply.2950.5.clone.1.clone.1 = fmul double %add.4028.7.clone.1.clone.1, %221
  %add.4038.3.clone.1.clone.1 = fadd double %multiply.2950.5.clone.1.clone.1, %219
  %222 = trunc i8 %203 to i1
  %223 = select i1 %222, double %add.4038.3.clone.1.clone.1, double 0.000000e+00
  %multiply.2951.3.clone.1.clone.1 = fmul double %199, %223
  %add.4039.3.clone.1.clone.1 = fadd double %add.4037.5.clone.1.clone.1, %multiply.2951.3.clone.1.clone.1
  %add.4041.1.clone.1.clone.1 = fadd double %add.4036.3.clone.1.clone.1, %add.4039.3.clone.1.clone.1
  %224 = select i1 %18, double 0.000000e+00, double %45
  %225 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg76251, i64 0, i64 %10, i64 %11, i64 %12
  %226 = load double, ptr addrspace(1) %225, align 8, !invariant.load !270
  %227 = fneg double %197
  %228 = fmul double %226, %227
  %229 = select i1 %200, double %228, double 0.000000e+00
  %add.4024.3.clone.1 = fadd double %84, %229
  %230 = select i1 %18, double %182, double 0.000000e+00
  %add.4031.3.clone.1 = fadd double %84, %230
  %231 = fneg double %add.4031.3.clone.1
  %232 = fmul double %226, %231
  %233 = fmul double %226, %219
  %add.4032.5.clone.1 = fsub double %232, %233
  %add.4033.3.clone.1 = fadd double %add.4024.3.clone.1, %add.4032.5.clone.1
  %add.4034.1.clone.1 = fadd double %224, %add.4033.3.clone.1
  %234 = select i1 %18, double 0.000000e+00, double %138
  %add.4013.1.clone.1 = fadd double %84, %234
  %235 = select i1 %18, double 0.000000e+00, double %33
  %add.4014.1.clone.1 = fadd double %235, %84
  %236 = select i1 %18, double 0.000000e+00, double %30
  %237 = select i1 %18, double 0.000000e+00, double %135
  %238 = select i1 %18, double 0.000000e+00, double %147
  store double %19, ptr addrspace(1) %16, align 8
  store double %add.4023.1.clone.1, ptr addrspace(1) %20, align 8
  store double %add.4018.1.clone.1, ptr addrspace(1) %98, align 8
  store double %104, ptr addrspace(1) %102, align 8
  store double %add.4012.1.clone.1, ptr addrspace(1) %105, align 8
  store double %116, ptr addrspace(1) %71, align 8
  store double %add.4048.1.clone.1, ptr addrspace(1) %117, align 8
  store double %add.3999.1.clone.1, ptr addrspace(1) %129, align 8
  store double %180, ptr addrspace(1) %178, align 8
  store double %183, ptr addrspace(1) %181, align 8
  store double %186, ptr addrspace(1) %184, align 8
  store double %add.4041.1.clone.1.clone.1, ptr addrspace(1) %187, align 8
  store double %add.4034.1.clone.1, ptr addrspace(1) %44, align 8
  store double %add.4013.1.clone.1, ptr addrspace(1) %137, align 8
  store double %add.4014.1.clone.1, ptr addrspace(1) %32, align 8
  store double %236, ptr addrspace(1) %29, align 8
  store double %237, ptr addrspace(1) %134, align 8
  store double %238, ptr addrspace(1) %146, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg1) local_unnamed_addr #4 {
entry:
  %arg136 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg034 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !271
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %.not = icmp eq i32 %block.id.x, 0
  %tile_bound.2 = select i1 %.not, i32 32, i32 8
  %tile_origin.2 = shl nuw nsw i32 %block.id.x, 5
  %1 = add nuw nsw i32 %0, -32
  %2 = zext nneg i32 %thread.id.x to i64
  %3 = lshr i64 %2, 5
  %4 = mul nuw nsw i64 %3, 320
  %5 = trunc i32 %block.id.x to i8
  %6 = shl nuw nsw i8 %5, 5
  %7 = trunc i32 %thread.id.x to i5
  %8 = zext i5 %7 to i8
  %9 = add i8 %6, %8
  %10 = zext nneg i8 %9 to i64
  %11 = trunc i64 %10 to i32
  %12 = udiv i32 %11, 20
  %13 = zext i32 %12 to i64
  %14 = mul nuw nsw i64 %13, 160
  %15 = add i64 %4, %14
  %16 = udiv i8 %9, 20
  %17 = mul nuw nsw i8 %16, 20
  %18 = sub i8 %9, %17
  %19 = zext i8 %18 to i64
  %20 = shl nuw nsw i64 %19, 3
  %21 = add i64 %15, %20
  %scevgep = getelementptr i8, ptr addrspace(1) %arg034, i64 %21
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv38 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep39, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %1, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.030 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %22 = icmp ult i32 %thread.id.2, %tile_bound.2
  br i1 %22, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3969.i29, %x_in_tile-true ], [ %partial_reduction_result.030, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv38, i64 10240
  %23 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %23, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !285

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %24 = zext nneg i32 %thread.id.2 to i64
  %25 = zext nneg i32 %0 to i64
  %26 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache3, i64 0, i64 %24, i64 %25
  store double %partial_reduction_result.1, ptr addrspace(3) %26, align 8
  tail call void @llvm.nvvm.barrier0()
  %27 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache3, i64 0, i64 %25, i64 %24
  %partial_reduction_result31920 = load <2 x i32>, ptr addrspace(3) %27, align 8
  %28 = extractelement <2 x i32> %partial_reduction_result31920, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 16, i32 31)
  %30 = insertelement <2 x i32> poison, i32 %29, i64 0
  %31 = extractelement <2 x i32> %partial_reduction_result31920, i64 1
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 16, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %35 = bitcast <2 x i32> %partial_reduction_result31920 to double
  %add.3969.i = fadd double %35, %34
  %36 = bitcast double %add.3969.i to <2 x i32>
  %37 = extractelement <2 x i32> %36, i64 0
  %38 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 8, i32 31)
  %39 = insertelement <2 x i32> poison, i32 %38, i64 0
  %40 = extractelement <2 x i32> %36, i64 1
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 8, i32 31)
  %42 = insertelement <2 x i32> %39, i32 %41, i64 1
  %43 = bitcast <2 x i32> %42 to double
  %add.3969.i25 = fadd double %add.3969.i, %43
  %44 = bitcast double %add.3969.i25 to <2 x i32>
  %45 = extractelement <2 x i32> %44, i64 0
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 4, i32 31)
  %47 = insertelement <2 x i32> poison, i32 %46, i64 0
  %48 = extractelement <2 x i32> %44, i64 1
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 4, i32 31)
  %50 = insertelement <2 x i32> %47, i32 %49, i64 1
  %51 = bitcast <2 x i32> %50 to double
  %add.3969.i26 = fadd double %add.3969.i25, %51
  %52 = bitcast double %add.3969.i26 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 2, i32 31)
  %55 = insertelement <2 x i32> poison, i32 %54, i64 0
  %56 = extractelement <2 x i32> %52, i64 1
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 1
  %59 = bitcast <2 x i32> %58 to double
  %add.3969.i27 = fadd double %add.3969.i26, %59
  %60 = bitcast double %add.3969.i27 to <2 x i32>
  %61 = extractelement <2 x i32> %60, i64 0
  %62 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 1, i32 31)
  %63 = insertelement <2 x i32> poison, i32 %62, i64 0
  %64 = extractelement <2 x i32> %60, i64 1
  %65 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  %66 = insertelement <2 x i32> %63, i32 %65, i64 1
  %67 = bitcast <2 x i32> %66 to double
  %add.3969.i28 = fadd double %add.3969.i27, %67
  store double %add.3969.i28, ptr addrspace(3) %27, align 8
  %68 = icmp ult i32 %0, %tile_bound.2
  %69 = icmp eq i32 %thread.id.2, 0
  %70 = and i1 %69, %68
  br i1 %70, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %param_0.24302 = load double, ptr addrspace(1) %lsr.iv38, align 8, !invariant.load !270
  %add.3969.i29 = fadd double %partial_reduction_result.030, %param_0.24302
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %71 = or disjoint i32 %tile_origin.2, %0
  %72 = udiv i32 %71, 20
  %73 = mul i32 %72, 20
  %.decomposed = sub i32 %71, %73
  %74 = zext nneg i32 %72 to i64
  %75 = zext nneg i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg136, i64 0, i64 %74, i64 %75
  store double %add.3969.i28, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind
define void @input_concatenate_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg33, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg34, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg35, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg36) local_unnamed_addr #4 {
entry:
  %arg361139 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg351137 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg341135 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg331133 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg321131 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg311129 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg301127 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg291125 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg281123 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg271121 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg261119 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg251117 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg241115 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg231113 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg221111 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg211109 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg201107 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg191105 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg181103 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg171101 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg161099 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg151097 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg141095 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg131093 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg121091 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg111089 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg101087 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg91085 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg81083 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg71081 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg61079 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg51077 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg41075 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg31073 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg21071 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg11069 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01067 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_26.830595 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg261119, i64 0, i64 %1
  %param_33.315972 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg331133, i64 0, i64 %1
  %2 = shl nuw nsw i32 %thread.id.2, 1
  br label %loop3.loop_body450

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

x_in_tile-after:                                  ; preds = %concatenate.41.1.clone.1.merge798
  %3 = or i32 %thread.id.x, 32
  %4 = icmp ult i32 %3, 60
  br i1 %4, label %loop3.loop_header449.preheader.1, label %x_in_tile-after.7

loop3.loop_header449.preheader.1:                 ; preds = %x_in_tile-after
  %5 = shl nuw nsw i32 %3, 1
  %6 = icmp ult i32 %3, 40
  br i1 %6, label %concatenate.pivot.60.621.1, label %concatenate.pivot.100.622.1

concatenate.pivot.100.622.1:                      ; preds = %loop3.loop_header449.preheader.1
  %7 = icmp ult i32 %3, 50
  %8 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1576.1 = fmul double %8, 0x3F786F8FA34E82C5
  br i1 %7, label %concatenate.pivot.80.623.1, label %concatenate.pivot.100.624.1

concatenate.pivot.100.624.1:                      ; preds = %concatenate.pivot.100.622.1
  %9 = sext i32 %5 to i64
  %10 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg21071, i64 0, i64 %1, i64 %9
  %param_2.5839593.11141 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 -800
  %param_2.5839594.1 = load double, ptr addrspace(1) %param_2.5839593.11141, align 16, !invariant.load !270
  %11 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg31073, i64 0, i64 %1, i64 %9
  %param_3.4947599.11142 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 -800
  %param_3.4947600.1 = load double, ptr addrspace(1) %param_3.4947599.11142, align 16, !invariant.load !270
  %multiply.3008.11.clone.1601.1 = fmul double %param_3.4947600.1, %multiply.3002.19.clone.1576.1
  %add.4171.9.clone.1602.1 = fadd double %param_2.5839594.1, %multiply.3008.11.clone.1601.1
  %12 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg01067, i64 0, i64 %1, i64 %9
  %param_0.5328603.11143 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 -800
  %param_0.5328604.1 = load double, ptr addrspace(1) %param_0.5328603.11143, align 16, !invariant.load !270
  %13 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg11069, i64 0, i64 %1, i64 %9
  %param_1.7600605.11144 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 -800
  %param_1.7600606.1 = load double, ptr addrspace(1) %param_1.7600605.11144, align 16, !invariant.load !270
  %add.4187.17.clone.1608.1 = fadd double %param_1.7600606.1, 6.000000e+00
  %multiply.3056.15.clone.1610.1 = fmul double %add.4187.17.clone.1608.1, 2.500000e-01
  %14 = fsub double %param_0.5328604.1, %multiply.3056.15.clone.1610.1
  %multiply.3057.7.clone.1612.1 = fmul double %multiply.3002.19.clone.1576.1, %14
  %add.4221.5.clone.1613.1 = fadd double %add.4171.9.clone.1602.1, %multiply.3057.7.clone.1612.1
  br label %concatenate.39.1.clone.1.merge454.1

concatenate.pivot.80.623.1:                       ; preds = %concatenate.pivot.100.622.1
  %15 = add nsw i32 %5, -80
  %16 = zext nneg i32 %15 to i64
  %param_6.2464571.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg61079, i64 0, i64 %1, i64 %16
  %param_6.2464572.1 = load double, ptr addrspace(1) %param_6.2464571.1, align 16, !invariant.load !270
  %param_7.2165577.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg71081, i64 0, i64 %1, i64 %16
  %param_7.2165578.1 = load double, ptr addrspace(1) %param_7.2165577.1, align 16, !invariant.load !270
  %multiply.3007.11.clone.1579.1 = fmul double %param_7.2165578.1, %multiply.3002.19.clone.1576.1
  %add.4169.9.clone.1580.1 = fadd double %param_6.2464572.1, %multiply.3007.11.clone.1579.1
  %param_4.3643581.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg41075, i64 0, i64 %1, i64 %16
  %param_4.3643582.1 = load double, ptr addrspace(1) %param_4.3643581.1, align 16, !invariant.load !270
  %param_5.3009583.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg51077, i64 0, i64 %1, i64 %16
  %param_5.3009584.1 = load double, ptr addrspace(1) %param_5.3009583.1, align 16, !invariant.load !270
  %add.4174.17.clone.1586.1 = fadd double %param_5.3009584.1, 4.000000e+00
  %multiply.3054.15.clone.1588.1 = fmul double %add.4174.17.clone.1586.1, 2.500000e-01
  %17 = fsub double %param_4.3643582.1, %multiply.3054.15.clone.1588.1
  %multiply.3055.7.clone.1590.1 = fmul double %multiply.3002.19.clone.1576.1, %17
  %add.4218.5.clone.1591.1 = fadd double %add.4169.9.clone.1580.1, %multiply.3055.7.clone.1590.1
  br label %concatenate.39.1.clone.1.merge454.1

concatenate.pivot.60.621.1:                       ; preds = %loop3.loop_header449.preheader.1
  %18 = add nsw i32 %5, -60
  %19 = zext nneg i32 %18 to i64
  %param_10.1580550.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg101087, i64 0, i64 %1, i64 %19
  %param_10.1580551.1 = load double, ptr addrspace(1) %param_10.1580550.1, align 16, !invariant.load !270
  %20 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1555.1 = fmul double %20, 0x3F786F8FA34E82C5
  %param_11.1438556.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg111089, i64 0, i64 %1, i64 %19
  %param_11.1438557.1 = load double, ptr addrspace(1) %param_11.1438556.1, align 16, !invariant.load !270
  %multiply.3006.11.clone.1558.1 = fmul double %param_11.1438557.1, %multiply.3002.19.clone.1555.1
  %add.4168.9.clone.1559.1 = fadd double %param_10.1580551.1, %multiply.3006.11.clone.1558.1
  %param_8.1922560.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg81083, i64 0, i64 %1, i64 %19
  %param_8.1922561.1 = load double, ptr addrspace(1) %param_8.1922560.1, align 16, !invariant.load !270
  %param_9.1742562.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg91085, i64 0, i64 %1, i64 %19
  %param_9.1742563.1 = load double, ptr addrspace(1) %param_9.1742562.1, align 16, !invariant.load !270
  %add.4197.17.clone.1565.1 = fadd double %param_9.1742563.1, -1.000000e+00
  %add.4214.13.clone.1567.1 = fsub double %param_8.1922561.1, %add.4197.17.clone.1565.1
  %multiply.3053.7.clone.1568.1 = fmul double %multiply.3002.19.clone.1555.1, %add.4214.13.clone.1567.1
  %add.4216.5.clone.1569.1 = fadd double %add.4168.9.clone.1559.1, %multiply.3053.7.clone.1568.1
  br label %concatenate.39.1.clone.1.merge454.1

concatenate.39.1.clone.1.merge454.1:              ; preds = %concatenate.pivot.60.621.1, %concatenate.pivot.80.623.1, %concatenate.pivot.100.624.1
  %21 = phi double [ %add.4216.5.clone.1569.1, %concatenate.pivot.60.621.1 ], [ %add.4218.5.clone.1591.1, %concatenate.pivot.80.623.1 ], [ %add.4221.5.clone.1613.1, %concatenate.pivot.100.624.1 ]
  %22 = icmp ult i32 %3, 40
  %multiply.3058.1625.1 = fmul double %21, %21
  %add.3969.i1044.1 = fadd double %add.3969.i1044, %multiply.3058.1625.1
  br i1 %22, label %concatenate.pivot.60.794.1, label %concatenate.pivot.100.795.1

concatenate.pivot.100.795.1:                      ; preds = %concatenate.39.1.clone.1.merge454.1
  %23 = icmp ult i32 %3, 50
  %24 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1749.1 = fmul double %24, 0x3F786F8FA34E82C5
  br i1 %23, label %concatenate.pivot.80.796.1, label %concatenate.pivot.100.797.1

concatenate.pivot.100.797.1:                      ; preds = %concatenate.pivot.100.795.1
  %25 = sext i32 %5 to i64
  %26 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg21071, i64 0, i64 %1, i64 %25
  %param_2.5839766.11145 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 -800
  %param_2.5839767.1 = load double, ptr addrspace(1) %param_2.5839766.11145, align 16, !invariant.load !270
  %27 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg31073, i64 0, i64 %1, i64 %25
  %param_3.4947772.11146 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 -800
  %param_3.4947773.1 = load double, ptr addrspace(1) %param_3.4947772.11146, align 16, !invariant.load !270
  %multiply.3008.11.clone.1774.1 = fmul double %param_3.4947773.1, %multiply.3002.19.clone.1749.1
  %add.4171.9.clone.1775.1 = fadd double %param_2.5839767.1, %multiply.3008.11.clone.1774.1
  %28 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg01067, i64 0, i64 %1, i64 %25
  %param_0.5328776.11147 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 -800
  %param_0.5328777.1 = load double, ptr addrspace(1) %param_0.5328776.11147, align 16, !invariant.load !270
  %29 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg11069, i64 0, i64 %1, i64 %25
  %param_1.7600778.11148 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 -800
  %param_1.7600779.1 = load double, ptr addrspace(1) %param_1.7600778.11148, align 16, !invariant.load !270
  %add.4187.17.clone.1781.1 = fadd double %param_1.7600779.1, 6.000000e+00
  %multiply.3056.15.clone.1783.1 = fmul double %add.4187.17.clone.1781.1, 2.500000e-01
  %30 = fsub double %param_0.5328777.1, %multiply.3056.15.clone.1783.1
  %multiply.3057.7.clone.1785.1 = fmul double %multiply.3002.19.clone.1749.1, %30
  %add.4221.5.clone.1786.1 = fadd double %add.4171.9.clone.1775.1, %multiply.3057.7.clone.1785.1
  br label %concatenate.pivot.80.1006.1

concatenate.pivot.80.796.1:                       ; preds = %concatenate.pivot.100.795.1
  %31 = add nsw i32 %5, -80
  %32 = zext nneg i32 %31 to i64
  %param_6.2464744.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg61079, i64 0, i64 %1, i64 %32
  %param_6.2464745.1 = load double, ptr addrspace(1) %param_6.2464744.1, align 16, !invariant.load !270
  %param_7.2165750.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg71081, i64 0, i64 %1, i64 %32
  %param_7.2165751.1 = load double, ptr addrspace(1) %param_7.2165750.1, align 16, !invariant.load !270
  %multiply.3007.11.clone.1752.1 = fmul double %param_7.2165751.1, %multiply.3002.19.clone.1749.1
  %add.4169.9.clone.1753.1 = fadd double %param_6.2464745.1, %multiply.3007.11.clone.1752.1
  %param_4.3643754.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg41075, i64 0, i64 %1, i64 %32
  %param_4.3643755.1 = load double, ptr addrspace(1) %param_4.3643754.1, align 16, !invariant.load !270
  %param_5.3009756.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg51077, i64 0, i64 %1, i64 %32
  %param_5.3009757.1 = load double, ptr addrspace(1) %param_5.3009756.1, align 16, !invariant.load !270
  %add.4174.17.clone.1759.1 = fadd double %param_5.3009757.1, 4.000000e+00
  %multiply.3054.15.clone.1761.1 = fmul double %add.4174.17.clone.1759.1, 2.500000e-01
  %33 = fsub double %param_4.3643755.1, %multiply.3054.15.clone.1761.1
  %multiply.3055.7.clone.1763.1 = fmul double %multiply.3002.19.clone.1749.1, %33
  %add.4218.5.clone.1764.1 = fadd double %add.4169.9.clone.1753.1, %multiply.3055.7.clone.1763.1
  br label %concatenate.pivot.80.1006.1

concatenate.pivot.60.794.1:                       ; preds = %concatenate.39.1.clone.1.merge454.1
  %34 = add nsw i32 %5, -60
  %35 = zext nneg i32 %34 to i64
  %param_10.1580723.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg101087, i64 0, i64 %1, i64 %35
  %param_10.1580724.1 = load double, ptr addrspace(1) %param_10.1580723.1, align 16, !invariant.load !270
  %36 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1728.1 = fmul double %36, 0x3F786F8FA34E82C5
  %param_11.1438729.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg111089, i64 0, i64 %1, i64 %35
  %param_11.1438730.1 = load double, ptr addrspace(1) %param_11.1438729.1, align 16, !invariant.load !270
  %multiply.3006.11.clone.1731.1 = fmul double %param_11.1438730.1, %multiply.3002.19.clone.1728.1
  %add.4168.9.clone.1732.1 = fadd double %param_10.1580724.1, %multiply.3006.11.clone.1731.1
  %param_8.1922733.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg81083, i64 0, i64 %1, i64 %35
  %param_8.1922734.1 = load double, ptr addrspace(1) %param_8.1922733.1, align 16, !invariant.load !270
  %param_9.1742735.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg91085, i64 0, i64 %1, i64 %35
  %param_9.1742736.1 = load double, ptr addrspace(1) %param_9.1742735.1, align 16, !invariant.load !270
  %add.4197.17.clone.1738.1 = fadd double %param_9.1742736.1, -1.000000e+00
  %add.4214.13.clone.1740.1 = fsub double %param_8.1922734.1, %add.4197.17.clone.1738.1
  %multiply.3053.7.clone.1741.1 = fmul double %multiply.3002.19.clone.1728.1, %add.4214.13.clone.1740.1
  %add.4216.5.clone.1742.1 = fadd double %add.4168.9.clone.1732.1, %multiply.3053.7.clone.1741.1
  br label %concatenate.pivot.80.1006.1

concatenate.pivot.80.1006.1:                      ; preds = %concatenate.pivot.100.797.1, %concatenate.pivot.80.796.1, %concatenate.pivot.60.794.1
  %37 = phi double [ %add.4216.5.clone.1742.1, %concatenate.pivot.60.794.1 ], [ %add.4218.5.clone.1764.1, %concatenate.pivot.80.796.1 ], [ %add.4221.5.clone.1786.1, %concatenate.pivot.100.797.1 ]
  %38 = icmp ult i32 %3, 40
  br i1 %38, label %concatenate.pivot.60.1007.1, label %concatenate.pivot.100.1008.1

concatenate.pivot.100.1008.1:                     ; preds = %concatenate.pivot.80.1006.1
  %39 = icmp ult i32 %3, 50
  %40 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1954.1 = fmul double %40, 0x3F786F8FA34E82C5
  br i1 %39, label %concatenate.pivot.80.1009.1, label %concatenate.pivot.100.1010.1

concatenate.pivot.100.1010.1:                     ; preds = %concatenate.pivot.100.1008.1
  %41 = icmp eq i64 %param_33.315916.1, 0
  %42 = sext i32 %5 to i64
  %43 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg271121, i64 0, i64 %1, i64 %42
  %param_27.770976.11149 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 -800
  %param_27.770977.1 = load double, ptr addrspace(1) %param_27.770976.11149, align 16, !invariant.load !270
  %44 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg21071, i64 0, i64 %1, i64 %42
  %param_2.5839978.11150 = getelementptr inbounds i8, ptr addrspace(1) %44, i64 -800
  %param_2.5839979.1 = load double, ptr addrspace(1) %param_2.5839978.11150, align 16, !invariant.load !270
  %45 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg31073, i64 0, i64 %1, i64 %42
  %param_3.4947984.11151 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 -800
  %param_3.4947985.1 = load double, ptr addrspace(1) %param_3.4947984.11151, align 16, !invariant.load !270
  %multiply.3008.11.clone.1986.1 = fmul double %param_3.4947985.1, %multiply.3002.19.clone.1954.1
  %add.4171.9.clone.1987.1 = fadd double %param_2.5839979.1, %multiply.3008.11.clone.1986.1
  %46 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg01067, i64 0, i64 %1, i64 %42
  %param_0.5328988.11152 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 -800
  %param_0.5328989.1 = load double, ptr addrspace(1) %param_0.5328988.11152, align 16, !invariant.load !270
  %47 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg11069, i64 0, i64 %1, i64 %42
  %param_1.7600990.11153 = getelementptr inbounds i8, ptr addrspace(1) %47, i64 -800
  %param_1.7600991.1 = load double, ptr addrspace(1) %param_1.7600990.11153, align 16, !invariant.load !270
  %add.4187.17.clone.1993.1 = fadd double %param_1.7600991.1, 6.000000e+00
  %multiply.3056.15.clone.1995.1 = fmul double %add.4187.17.clone.1993.1, 2.500000e-01
  %48 = fsub double %param_0.5328989.1, %multiply.3056.15.clone.1995.1
  %multiply.3057.7.clone.1997.1 = fmul double %multiply.3002.19.clone.1954.1, %48
  %add.4221.5.clone.1998.1 = fadd double %add.4171.9.clone.1987.1, %multiply.3057.7.clone.1997.1
  %add.4236.3.clone.1999.1 = fadd double %param_27.770977.1, %add.4221.5.clone.1998.1
  %49 = select i1 %41, double %add.4221.5.clone.1998.1, double %add.4236.3.clone.1999.1
  br label %concatenate.41.1.clone.1.merge798.1

concatenate.pivot.80.1009.1:                      ; preds = %concatenate.pivot.100.1008.1
  %50 = icmp eq i64 %param_33.315916.1, 0
  %51 = add nsw i32 %5, -80
  %52 = zext nneg i32 %51 to i64
  %param_28.686947.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg281123, i64 0, i64 %1, i64 %52
  %param_28.686948.1 = load double, ptr addrspace(1) %param_28.686947.1, align 16, !invariant.load !270
  %param_6.2464949.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg61079, i64 0, i64 %1, i64 %52
  %param_6.2464950.1 = load double, ptr addrspace(1) %param_6.2464949.1, align 16, !invariant.load !270
  %param_7.2165955.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg71081, i64 0, i64 %1, i64 %52
  %param_7.2165956.1 = load double, ptr addrspace(1) %param_7.2165955.1, align 16, !invariant.load !270
  %multiply.3007.11.clone.1957.1 = fmul double %param_7.2165956.1, %multiply.3002.19.clone.1954.1
  %add.4169.9.clone.1958.1 = fadd double %param_6.2464950.1, %multiply.3007.11.clone.1957.1
  %param_4.3643959.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg41075, i64 0, i64 %1, i64 %52
  %param_4.3643960.1 = load double, ptr addrspace(1) %param_4.3643959.1, align 16, !invariant.load !270
  %param_5.3009961.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg51077, i64 0, i64 %1, i64 %52
  %param_5.3009962.1 = load double, ptr addrspace(1) %param_5.3009961.1, align 16, !invariant.load !270
  %add.4174.17.clone.1964.1 = fadd double %param_5.3009962.1, 4.000000e+00
  %multiply.3054.15.clone.1966.1 = fmul double %add.4174.17.clone.1964.1, 2.500000e-01
  %53 = fsub double %param_4.3643960.1, %multiply.3054.15.clone.1966.1
  %multiply.3055.7.clone.1968.1 = fmul double %multiply.3002.19.clone.1954.1, %53
  %add.4218.5.clone.1969.1 = fadd double %add.4169.9.clone.1958.1, %multiply.3055.7.clone.1968.1
  %add.4234.3.clone.1970.1 = fadd double %param_28.686948.1, %add.4218.5.clone.1969.1
  %54 = select i1 %50, double %add.4218.5.clone.1969.1, double %add.4234.3.clone.1970.1
  br label %concatenate.41.1.clone.1.merge798.1

concatenate.pivot.60.1007.1:                      ; preds = %concatenate.pivot.80.1006.1
  %55 = icmp eq i64 %param_33.315916.1, 0
  %56 = add nsw i32 %5, -60
  %57 = zext nneg i32 %56 to i64
  %param_29.617919.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg291125, i64 0, i64 %1, i64 %57
  %param_29.617920.1 = load double, ptr addrspace(1) %param_29.617919.1, align 16, !invariant.load !270
  %param_10.1580921.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg101087, i64 0, i64 %1, i64 %57
  %param_10.1580922.1 = load double, ptr addrspace(1) %param_10.1580921.1, align 16, !invariant.load !270
  %58 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1926.1 = fmul double %58, 0x3F786F8FA34E82C5
  %param_11.1438927.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg111089, i64 0, i64 %1, i64 %57
  %param_11.1438928.1 = load double, ptr addrspace(1) %param_11.1438927.1, align 16, !invariant.load !270
  %multiply.3006.11.clone.1929.1 = fmul double %param_11.1438928.1, %multiply.3002.19.clone.1926.1
  %add.4168.9.clone.1930.1 = fadd double %param_10.1580922.1, %multiply.3006.11.clone.1929.1
  %param_8.1922931.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg81083, i64 0, i64 %1, i64 %57
  %param_8.1922932.1 = load double, ptr addrspace(1) %param_8.1922931.1, align 16, !invariant.load !270
  %param_9.1742933.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg91085, i64 0, i64 %1, i64 %57
  %param_9.1742934.1 = load double, ptr addrspace(1) %param_9.1742933.1, align 16, !invariant.load !270
  %add.4197.17.clone.1936.1 = fadd double %param_9.1742934.1, -1.000000e+00
  %add.4214.13.clone.1938.1 = fsub double %param_8.1922932.1, %add.4197.17.clone.1936.1
  %multiply.3053.7.clone.1939.1 = fmul double %multiply.3002.19.clone.1926.1, %add.4214.13.clone.1938.1
  %add.4216.5.clone.1940.1 = fadd double %add.4168.9.clone.1930.1, %multiply.3053.7.clone.1939.1
  %add.4233.3.clone.1941.1 = fadd double %param_29.617920.1, %add.4216.5.clone.1940.1
  %59 = select i1 %55, double %add.4216.5.clone.1940.1, double %add.4233.3.clone.1941.1
  br label %concatenate.41.1.clone.1.merge798.1

concatenate.41.1.clone.1.merge798.1:              ; preds = %concatenate.pivot.60.1007.1, %concatenate.pivot.80.1009.1, %concatenate.pivot.100.1010.1
  %60 = phi double [ %59, %concatenate.pivot.60.1007.1 ], [ %54, %concatenate.pivot.80.1009.1 ], [ %49, %concatenate.pivot.100.1010.1 ]
  %61 = icmp ult i32 %3, 40
  %62 = zext nneg i32 %5 to i64
  %63 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg351137, i64 0, i64 %1, i64 %62
  store double %37, ptr addrspace(1) %63, align 16
  %64 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg361139, i64 0, i64 %1, i64 %62
  store double %60, ptr addrspace(1) %64, align 16
  br i1 %61, label %concatenate.pivot.60.621.1.1, label %concatenate.pivot.100.622.1.1

concatenate.pivot.100.622.1.1:                    ; preds = %concatenate.41.1.clone.1.merge798.1
  %65 = icmp ult i32 %3, 50
  %66 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1576.1.1 = fmul double %66, 0x3F786F8FA34E82C5
  br i1 %65, label %concatenate.pivot.80.623.1.1, label %concatenate.pivot.100.624.1.1

concatenate.pivot.100.624.1.1:                    ; preds = %concatenate.pivot.100.622.1.1
  %67 = sext i32 %5 to i64
  %68 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg21071, i64 0, i64 %1, i64 %67
  %param_2.5839593.1.11154 = getelementptr inbounds i8, ptr addrspace(1) %68, i64 -792
  %param_2.5839594.1.1 = load double, ptr addrspace(1) %param_2.5839593.1.11154, align 8, !invariant.load !270
  %69 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg31073, i64 0, i64 %1, i64 %67
  %param_3.4947599.1.11155 = getelementptr inbounds i8, ptr addrspace(1) %69, i64 -792
  %param_3.4947600.1.1 = load double, ptr addrspace(1) %param_3.4947599.1.11155, align 8, !invariant.load !270
  %multiply.3008.11.clone.1601.1.1 = fmul double %param_3.4947600.1.1, %multiply.3002.19.clone.1576.1.1
  %add.4171.9.clone.1602.1.1 = fadd double %param_2.5839594.1.1, %multiply.3008.11.clone.1601.1.1
  %70 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg01067, i64 0, i64 %1, i64 %67
  %param_0.5328603.1.11156 = getelementptr inbounds i8, ptr addrspace(1) %70, i64 -792
  %param_0.5328604.1.1 = load double, ptr addrspace(1) %param_0.5328603.1.11156, align 8, !invariant.load !270
  %71 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg11069, i64 0, i64 %1, i64 %67
  %param_1.7600605.1.11157 = getelementptr inbounds i8, ptr addrspace(1) %71, i64 -792
  %param_1.7600606.1.1 = load double, ptr addrspace(1) %param_1.7600605.1.11157, align 8, !invariant.load !270
  %add.4187.17.clone.1608.1.1 = fadd double %param_1.7600606.1.1, 6.000000e+00
  %multiply.3056.15.clone.1610.1.1 = fmul double %add.4187.17.clone.1608.1.1, 2.500000e-01
  %72 = fsub double %param_0.5328604.1.1, %multiply.3056.15.clone.1610.1.1
  %multiply.3057.7.clone.1612.1.1 = fmul double %multiply.3002.19.clone.1576.1.1, %72
  %add.4221.5.clone.1613.1.1 = fadd double %add.4171.9.clone.1602.1.1, %multiply.3057.7.clone.1612.1.1
  br label %concatenate.39.1.clone.1.merge454.1.1

concatenate.pivot.80.623.1.1:                     ; preds = %concatenate.pivot.100.622.1.1
  %73 = add nsw i32 %5, -79
  %74 = zext nneg i32 %73 to i64
  %param_6.2464571.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg61079, i64 0, i64 %1, i64 %74
  %param_6.2464572.1.1 = load double, ptr addrspace(1) %param_6.2464571.1.1, align 8, !invariant.load !270
  %param_7.2165577.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg71081, i64 0, i64 %1, i64 %74
  %param_7.2165578.1.1 = load double, ptr addrspace(1) %param_7.2165577.1.1, align 8, !invariant.load !270
  %multiply.3007.11.clone.1579.1.1 = fmul double %param_7.2165578.1.1, %multiply.3002.19.clone.1576.1.1
  %add.4169.9.clone.1580.1.1 = fadd double %param_6.2464572.1.1, %multiply.3007.11.clone.1579.1.1
  %param_4.3643581.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg41075, i64 0, i64 %1, i64 %74
  %param_4.3643582.1.1 = load double, ptr addrspace(1) %param_4.3643581.1.1, align 8, !invariant.load !270
  %param_5.3009583.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg51077, i64 0, i64 %1, i64 %74
  %param_5.3009584.1.1 = load double, ptr addrspace(1) %param_5.3009583.1.1, align 8, !invariant.load !270
  %add.4174.17.clone.1586.1.1 = fadd double %param_5.3009584.1.1, 4.000000e+00
  %multiply.3054.15.clone.1588.1.1 = fmul double %add.4174.17.clone.1586.1.1, 2.500000e-01
  %75 = fsub double %param_4.3643582.1.1, %multiply.3054.15.clone.1588.1.1
  %multiply.3055.7.clone.1590.1.1 = fmul double %multiply.3002.19.clone.1576.1.1, %75
  %add.4218.5.clone.1591.1.1 = fadd double %add.4169.9.clone.1580.1.1, %multiply.3055.7.clone.1590.1.1
  br label %concatenate.39.1.clone.1.merge454.1.1

concatenate.pivot.60.621.1.1:                     ; preds = %concatenate.41.1.clone.1.merge798.1
  %76 = add nsw i32 %5, -59
  %77 = zext nneg i32 %76 to i64
  %param_10.1580550.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg101087, i64 0, i64 %1, i64 %77
  %param_10.1580551.1.1 = load double, ptr addrspace(1) %param_10.1580550.1.1, align 8, !invariant.load !270
  %78 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1555.1.1 = fmul double %78, 0x3F786F8FA34E82C5
  %param_11.1438556.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg111089, i64 0, i64 %1, i64 %77
  %param_11.1438557.1.1 = load double, ptr addrspace(1) %param_11.1438556.1.1, align 8, !invariant.load !270
  %multiply.3006.11.clone.1558.1.1 = fmul double %param_11.1438557.1.1, %multiply.3002.19.clone.1555.1.1
  %add.4168.9.clone.1559.1.1 = fadd double %param_10.1580551.1.1, %multiply.3006.11.clone.1558.1.1
  %param_8.1922560.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg81083, i64 0, i64 %1, i64 %77
  %param_8.1922561.1.1 = load double, ptr addrspace(1) %param_8.1922560.1.1, align 8, !invariant.load !270
  %param_9.1742562.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg91085, i64 0, i64 %1, i64 %77
  %param_9.1742563.1.1 = load double, ptr addrspace(1) %param_9.1742562.1.1, align 8, !invariant.load !270
  %add.4197.17.clone.1565.1.1 = fadd double %param_9.1742563.1.1, -1.000000e+00
  %add.4214.13.clone.1567.1.1 = fsub double %param_8.1922561.1.1, %add.4197.17.clone.1565.1.1
  %multiply.3053.7.clone.1568.1.1 = fmul double %multiply.3002.19.clone.1555.1.1, %add.4214.13.clone.1567.1.1
  %add.4216.5.clone.1569.1.1 = fadd double %add.4168.9.clone.1559.1.1, %multiply.3053.7.clone.1568.1.1
  br label %concatenate.39.1.clone.1.merge454.1.1

concatenate.39.1.clone.1.merge454.1.1:            ; preds = %concatenate.pivot.60.621.1.1, %concatenate.pivot.80.623.1.1, %concatenate.pivot.100.624.1.1
  %79 = phi double [ %add.4216.5.clone.1569.1.1, %concatenate.pivot.60.621.1.1 ], [ %add.4218.5.clone.1591.1.1, %concatenate.pivot.80.623.1.1 ], [ %add.4221.5.clone.1613.1.1, %concatenate.pivot.100.624.1.1 ]
  %80 = icmp ult i32 %3, 40
  %multiply.3058.1625.1.1 = fmul double %79, %79
  %add.3969.i1044.1.1 = fadd double %add.3969.i1044.1, %multiply.3058.1625.1.1
  br i1 %80, label %concatenate.pivot.60.794.1.1, label %concatenate.pivot.100.795.1.1

concatenate.pivot.100.795.1.1:                    ; preds = %concatenate.39.1.clone.1.merge454.1.1
  %81 = icmp ult i32 %3, 50
  %82 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1749.1.1 = fmul double %82, 0x3F786F8FA34E82C5
  br i1 %81, label %concatenate.pivot.80.796.1.1, label %concatenate.pivot.100.797.1.1

concatenate.pivot.100.797.1.1:                    ; preds = %concatenate.pivot.100.795.1.1
  %83 = sext i32 %5 to i64
  %84 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg21071, i64 0, i64 %1, i64 %83
  %param_2.5839766.1.11158 = getelementptr inbounds i8, ptr addrspace(1) %84, i64 -792
  %param_2.5839767.1.1 = load double, ptr addrspace(1) %param_2.5839766.1.11158, align 8, !invariant.load !270
  %85 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg31073, i64 0, i64 %1, i64 %83
  %param_3.4947772.1.11159 = getelementptr inbounds i8, ptr addrspace(1) %85, i64 -792
  %param_3.4947773.1.1 = load double, ptr addrspace(1) %param_3.4947772.1.11159, align 8, !invariant.load !270
  %multiply.3008.11.clone.1774.1.1 = fmul double %param_3.4947773.1.1, %multiply.3002.19.clone.1749.1.1
  %add.4171.9.clone.1775.1.1 = fadd double %param_2.5839767.1.1, %multiply.3008.11.clone.1774.1.1
  %86 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg01067, i64 0, i64 %1, i64 %83
  %param_0.5328776.1.11160 = getelementptr inbounds i8, ptr addrspace(1) %86, i64 -792
  %param_0.5328777.1.1 = load double, ptr addrspace(1) %param_0.5328776.1.11160, align 8, !invariant.load !270
  %87 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg11069, i64 0, i64 %1, i64 %83
  %param_1.7600778.1.11161 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 -792
  %param_1.7600779.1.1 = load double, ptr addrspace(1) %param_1.7600778.1.11161, align 8, !invariant.load !270
  %add.4187.17.clone.1781.1.1 = fadd double %param_1.7600779.1.1, 6.000000e+00
  %multiply.3056.15.clone.1783.1.1 = fmul double %add.4187.17.clone.1781.1.1, 2.500000e-01
  %88 = fsub double %param_0.5328777.1.1, %multiply.3056.15.clone.1783.1.1
  %multiply.3057.7.clone.1785.1.1 = fmul double %multiply.3002.19.clone.1749.1.1, %88
  %add.4221.5.clone.1786.1.1 = fadd double %add.4171.9.clone.1775.1.1, %multiply.3057.7.clone.1785.1.1
  br label %concatenate.pivot.80.1006.1.1

concatenate.pivot.80.796.1.1:                     ; preds = %concatenate.pivot.100.795.1.1
  %89 = add nsw i32 %5, -79
  %90 = zext nneg i32 %89 to i64
  %param_6.2464744.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg61079, i64 0, i64 %1, i64 %90
  %param_6.2464745.1.1 = load double, ptr addrspace(1) %param_6.2464744.1.1, align 8, !invariant.load !270
  %param_7.2165750.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg71081, i64 0, i64 %1, i64 %90
  %param_7.2165751.1.1 = load double, ptr addrspace(1) %param_7.2165750.1.1, align 8, !invariant.load !270
  %multiply.3007.11.clone.1752.1.1 = fmul double %param_7.2165751.1.1, %multiply.3002.19.clone.1749.1.1
  %add.4169.9.clone.1753.1.1 = fadd double %param_6.2464745.1.1, %multiply.3007.11.clone.1752.1.1
  %param_4.3643754.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg41075, i64 0, i64 %1, i64 %90
  %param_4.3643755.1.1 = load double, ptr addrspace(1) %param_4.3643754.1.1, align 8, !invariant.load !270
  %param_5.3009756.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg51077, i64 0, i64 %1, i64 %90
  %param_5.3009757.1.1 = load double, ptr addrspace(1) %param_5.3009756.1.1, align 8, !invariant.load !270
  %add.4174.17.clone.1759.1.1 = fadd double %param_5.3009757.1.1, 4.000000e+00
  %multiply.3054.15.clone.1761.1.1 = fmul double %add.4174.17.clone.1759.1.1, 2.500000e-01
  %91 = fsub double %param_4.3643755.1.1, %multiply.3054.15.clone.1761.1.1
  %multiply.3055.7.clone.1763.1.1 = fmul double %multiply.3002.19.clone.1749.1.1, %91
  %add.4218.5.clone.1764.1.1 = fadd double %add.4169.9.clone.1753.1.1, %multiply.3055.7.clone.1763.1.1
  br label %concatenate.pivot.80.1006.1.1

concatenate.pivot.60.794.1.1:                     ; preds = %concatenate.39.1.clone.1.merge454.1.1
  %92 = add nsw i32 %5, -59
  %93 = zext nneg i32 %92 to i64
  %param_10.1580723.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg101087, i64 0, i64 %1, i64 %93
  %param_10.1580724.1.1 = load double, ptr addrspace(1) %param_10.1580723.1.1, align 8, !invariant.load !270
  %94 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1728.1.1 = fmul double %94, 0x3F786F8FA34E82C5
  %param_11.1438729.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg111089, i64 0, i64 %1, i64 %93
  %param_11.1438730.1.1 = load double, ptr addrspace(1) %param_11.1438729.1.1, align 8, !invariant.load !270
  %multiply.3006.11.clone.1731.1.1 = fmul double %param_11.1438730.1.1, %multiply.3002.19.clone.1728.1.1
  %add.4168.9.clone.1732.1.1 = fadd double %param_10.1580724.1.1, %multiply.3006.11.clone.1731.1.1
  %param_8.1922733.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg81083, i64 0, i64 %1, i64 %93
  %param_8.1922734.1.1 = load double, ptr addrspace(1) %param_8.1922733.1.1, align 8, !invariant.load !270
  %param_9.1742735.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg91085, i64 0, i64 %1, i64 %93
  %param_9.1742736.1.1 = load double, ptr addrspace(1) %param_9.1742735.1.1, align 8, !invariant.load !270
  %add.4197.17.clone.1738.1.1 = fadd double %param_9.1742736.1.1, -1.000000e+00
  %add.4214.13.clone.1740.1.1 = fsub double %param_8.1922734.1.1, %add.4197.17.clone.1738.1.1
  %multiply.3053.7.clone.1741.1.1 = fmul double %multiply.3002.19.clone.1728.1.1, %add.4214.13.clone.1740.1.1
  %add.4216.5.clone.1742.1.1 = fadd double %add.4168.9.clone.1732.1.1, %multiply.3053.7.clone.1741.1.1
  br label %concatenate.pivot.80.1006.1.1

concatenate.pivot.80.1006.1.1:                    ; preds = %concatenate.pivot.100.797.1.1, %concatenate.pivot.80.796.1.1, %concatenate.pivot.60.794.1.1
  %95 = phi double [ %add.4216.5.clone.1742.1.1, %concatenate.pivot.60.794.1.1 ], [ %add.4218.5.clone.1764.1.1, %concatenate.pivot.80.796.1.1 ], [ %add.4221.5.clone.1786.1.1, %concatenate.pivot.100.797.1.1 ]
  %96 = icmp ult i32 %3, 40
  br i1 %96, label %concatenate.pivot.60.1007.1.1, label %concatenate.pivot.100.1008.1.1

concatenate.pivot.100.1008.1.1:                   ; preds = %concatenate.pivot.80.1006.1.1
  %97 = icmp ult i32 %3, 50
  %98 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1954.1.1 = fmul double %98, 0x3F786F8FA34E82C5
  br i1 %97, label %concatenate.pivot.80.1009.1.1, label %concatenate.pivot.100.1010.1.1

concatenate.pivot.100.1010.1.1:                   ; preds = %concatenate.pivot.100.1008.1.1
  %99 = icmp eq i64 %param_33.315916.1, 0
  %100 = sext i32 %5 to i64
  %101 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg271121, i64 0, i64 %1, i64 %100
  %param_27.770976.1.11162 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 -792
  %param_27.770977.1.1 = load double, ptr addrspace(1) %param_27.770976.1.11162, align 8, !invariant.load !270
  %102 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg21071, i64 0, i64 %1, i64 %100
  %param_2.5839978.1.11163 = getelementptr inbounds i8, ptr addrspace(1) %102, i64 -792
  %param_2.5839979.1.1 = load double, ptr addrspace(1) %param_2.5839978.1.11163, align 8, !invariant.load !270
  %103 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg31073, i64 0, i64 %1, i64 %100
  %param_3.4947984.1.11164 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 -792
  %param_3.4947985.1.1 = load double, ptr addrspace(1) %param_3.4947984.1.11164, align 8, !invariant.load !270
  %multiply.3008.11.clone.1986.1.1 = fmul double %param_3.4947985.1.1, %multiply.3002.19.clone.1954.1.1
  %add.4171.9.clone.1987.1.1 = fadd double %param_2.5839979.1.1, %multiply.3008.11.clone.1986.1.1
  %104 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg01067, i64 0, i64 %1, i64 %100
  %param_0.5328988.1.11165 = getelementptr inbounds i8, ptr addrspace(1) %104, i64 -792
  %param_0.5328989.1.1 = load double, ptr addrspace(1) %param_0.5328988.1.11165, align 8, !invariant.load !270
  %105 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg11069, i64 0, i64 %1, i64 %100
  %param_1.7600990.1.11166 = getelementptr inbounds i8, ptr addrspace(1) %105, i64 -792
  %param_1.7600991.1.1 = load double, ptr addrspace(1) %param_1.7600990.1.11166, align 8, !invariant.load !270
  %add.4187.17.clone.1993.1.1 = fadd double %param_1.7600991.1.1, 6.000000e+00
  %multiply.3056.15.clone.1995.1.1 = fmul double %add.4187.17.clone.1993.1.1, 2.500000e-01
  %106 = fsub double %param_0.5328989.1.1, %multiply.3056.15.clone.1995.1.1
  %multiply.3057.7.clone.1997.1.1 = fmul double %multiply.3002.19.clone.1954.1.1, %106
  %add.4221.5.clone.1998.1.1 = fadd double %add.4171.9.clone.1987.1.1, %multiply.3057.7.clone.1997.1.1
  %add.4236.3.clone.1999.1.1 = fadd double %param_27.770977.1.1, %add.4221.5.clone.1998.1.1
  %107 = select i1 %99, double %add.4221.5.clone.1998.1.1, double %add.4236.3.clone.1999.1.1
  br label %concatenate.41.1.clone.1.merge798.1.1

concatenate.pivot.80.1009.1.1:                    ; preds = %concatenate.pivot.100.1008.1.1
  %108 = icmp eq i64 %param_33.315916.1, 0
  %109 = add nsw i32 %5, -79
  %110 = zext nneg i32 %109 to i64
  %param_28.686947.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg281123, i64 0, i64 %1, i64 %110
  %param_28.686948.1.1 = load double, ptr addrspace(1) %param_28.686947.1.1, align 8, !invariant.load !270
  %param_6.2464949.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg61079, i64 0, i64 %1, i64 %110
  %param_6.2464950.1.1 = load double, ptr addrspace(1) %param_6.2464949.1.1, align 8, !invariant.load !270
  %param_7.2165955.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg71081, i64 0, i64 %1, i64 %110
  %param_7.2165956.1.1 = load double, ptr addrspace(1) %param_7.2165955.1.1, align 8, !invariant.load !270
  %multiply.3007.11.clone.1957.1.1 = fmul double %param_7.2165956.1.1, %multiply.3002.19.clone.1954.1.1
  %add.4169.9.clone.1958.1.1 = fadd double %param_6.2464950.1.1, %multiply.3007.11.clone.1957.1.1
  %param_4.3643959.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg41075, i64 0, i64 %1, i64 %110
  %param_4.3643960.1.1 = load double, ptr addrspace(1) %param_4.3643959.1.1, align 8, !invariant.load !270
  %param_5.3009961.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg51077, i64 0, i64 %1, i64 %110
  %param_5.3009962.1.1 = load double, ptr addrspace(1) %param_5.3009961.1.1, align 8, !invariant.load !270
  %add.4174.17.clone.1964.1.1 = fadd double %param_5.3009962.1.1, 4.000000e+00
  %multiply.3054.15.clone.1966.1.1 = fmul double %add.4174.17.clone.1964.1.1, 2.500000e-01
  %111 = fsub double %param_4.3643960.1.1, %multiply.3054.15.clone.1966.1.1
  %multiply.3055.7.clone.1968.1.1 = fmul double %multiply.3002.19.clone.1954.1.1, %111
  %add.4218.5.clone.1969.1.1 = fadd double %add.4169.9.clone.1958.1.1, %multiply.3055.7.clone.1968.1.1
  %add.4234.3.clone.1970.1.1 = fadd double %param_28.686948.1.1, %add.4218.5.clone.1969.1.1
  %112 = select i1 %108, double %add.4218.5.clone.1969.1.1, double %add.4234.3.clone.1970.1.1
  br label %concatenate.41.1.clone.1.merge798.1.1

concatenate.pivot.60.1007.1.1:                    ; preds = %concatenate.pivot.80.1006.1.1
  %113 = icmp eq i64 %param_33.315916.1, 0
  %114 = add nsw i32 %5, -59
  %115 = zext nneg i32 %114 to i64
  %param_29.617919.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg291125, i64 0, i64 %1, i64 %115
  %param_29.617920.1.1 = load double, ptr addrspace(1) %param_29.617919.1.1, align 8, !invariant.load !270
  %param_10.1580921.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg101087, i64 0, i64 %1, i64 %115
  %param_10.1580922.1.1 = load double, ptr addrspace(1) %param_10.1580921.1.1, align 8, !invariant.load !270
  %116 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1926.1.1 = fmul double %116, 0x3F786F8FA34E82C5
  %param_11.1438927.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg111089, i64 0, i64 %1, i64 %115
  %param_11.1438928.1.1 = load double, ptr addrspace(1) %param_11.1438927.1.1, align 8, !invariant.load !270
  %multiply.3006.11.clone.1929.1.1 = fmul double %param_11.1438928.1.1, %multiply.3002.19.clone.1926.1.1
  %add.4168.9.clone.1930.1.1 = fadd double %param_10.1580922.1.1, %multiply.3006.11.clone.1929.1.1
  %param_8.1922931.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg81083, i64 0, i64 %1, i64 %115
  %param_8.1922932.1.1 = load double, ptr addrspace(1) %param_8.1922931.1.1, align 8, !invariant.load !270
  %param_9.1742933.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg91085, i64 0, i64 %1, i64 %115
  %param_9.1742934.1.1 = load double, ptr addrspace(1) %param_9.1742933.1.1, align 8, !invariant.load !270
  %add.4197.17.clone.1936.1.1 = fadd double %param_9.1742934.1.1, -1.000000e+00
  %add.4214.13.clone.1938.1.1 = fsub double %param_8.1922932.1.1, %add.4197.17.clone.1936.1.1
  %multiply.3053.7.clone.1939.1.1 = fmul double %multiply.3002.19.clone.1926.1.1, %add.4214.13.clone.1938.1.1
  %add.4216.5.clone.1940.1.1 = fadd double %add.4168.9.clone.1930.1.1, %multiply.3053.7.clone.1939.1.1
  %add.4233.3.clone.1941.1.1 = fadd double %param_29.617920.1.1, %add.4216.5.clone.1940.1.1
  %117 = select i1 %113, double %add.4216.5.clone.1940.1.1, double %add.4233.3.clone.1941.1.1
  br label %concatenate.41.1.clone.1.merge798.1.1

concatenate.41.1.clone.1.merge798.1.1:            ; preds = %concatenate.pivot.60.1007.1.1, %concatenate.pivot.80.1009.1.1, %concatenate.pivot.100.1010.1.1
  %118 = phi double [ %117, %concatenate.pivot.60.1007.1.1 ], [ %112, %concatenate.pivot.80.1009.1.1 ], [ %107, %concatenate.pivot.100.1010.1.1 ]
  %119 = getelementptr inbounds i8, ptr addrspace(1) %63, i64 8
  store double %95, ptr addrspace(1) %119, align 8
  %120 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 8
  store double %118, ptr addrspace(1) %120, align 8
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %concatenate.41.1.clone.1.merge798.1.1, %x_in_tile-after
  %partial_reduction_result.2.1 = phi double [ %add.3969.i1044, %x_in_tile-after ], [ %add.3969.i1044.1.1, %concatenate.41.1.clone.1.merge798.1.1 ]
  %121 = bitcast double %partial_reduction_result.2.1 to <2 x i32>
  %122 = extractelement <2 x i32> %121, i64 0
  %123 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %122, i32 16, i32 31)
  %124 = insertelement <2 x i32> poison, i32 %123, i64 0
  %125 = extractelement <2 x i32> %121, i64 1
  %126 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %125, i32 16, i32 31)
  %127 = insertelement <2 x i32> %124, i32 %126, i64 1
  %128 = bitcast <2 x i32> %127 to double
  %add.3969.i = fadd double %partial_reduction_result.2.1, %128
  %129 = bitcast double %add.3969.i to <2 x i32>
  %130 = extractelement <2 x i32> %129, i64 0
  %131 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %130, i32 8, i32 31)
  %132 = insertelement <2 x i32> poison, i32 %131, i64 0
  %133 = extractelement <2 x i32> %129, i64 1
  %134 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %133, i32 8, i32 31)
  %135 = insertelement <2 x i32> %132, i32 %134, i64 1
  %136 = bitcast <2 x i32> %135 to double
  %add.3969.i1040 = fadd double %add.3969.i, %136
  %137 = bitcast double %add.3969.i1040 to <2 x i32>
  %138 = extractelement <2 x i32> %137, i64 0
  %139 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %138, i32 4, i32 31)
  %140 = insertelement <2 x i32> poison, i32 %139, i64 0
  %141 = extractelement <2 x i32> %137, i64 1
  %142 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %141, i32 4, i32 31)
  %143 = insertelement <2 x i32> %140, i32 %142, i64 1
  %144 = bitcast <2 x i32> %143 to double
  %add.3969.i1041 = fadd double %add.3969.i1040, %144
  %145 = bitcast double %add.3969.i1041 to <2 x i32>
  %146 = extractelement <2 x i32> %145, i64 0
  %147 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %146, i32 2, i32 31)
  %148 = insertelement <2 x i32> poison, i32 %147, i64 0
  %149 = extractelement <2 x i32> %145, i64 1
  %150 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %149, i32 2, i32 31)
  %151 = insertelement <2 x i32> %148, i32 %150, i64 1
  %152 = bitcast <2 x i32> %151 to double
  %add.3969.i1042 = fadd double %add.3969.i1041, %152
  %153 = bitcast double %add.3969.i1042 to <2 x i32>
  %154 = extractelement <2 x i32> %153, i64 0
  %155 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %154, i32 1, i32 31)
  %156 = extractelement <2 x i32> %153, i64 1
  %157 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %156, i32 1, i32 31)
  %158 = icmp eq i32 %thread.id.2, 0
  %159 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache4, i64 0, i64 %1, i64 0
  %160 = insertelement <2 x i32> poison, i32 %155, i64 0
  %161 = insertelement <2 x i32> %160, i32 %157, i64 1
  %162 = bitcast <2 x i32> %161 to double
  %add.3969.i1043 = fadd double %add.3969.i1042, %162
  br i1 %158, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

loop3.loop_body450:                               ; preds = %entry, %concatenate.41.1.clone.1.merge798
  %.not = phi i1 [ true, %entry ], [ false, %concatenate.41.1.clone.1.merge798 ]
  %loop3.invar_address451.01046 = phi i32 [ 0, %entry ], [ 1, %concatenate.41.1.clone.1.merge798 ]
  %partial_reduction_result.31045 = phi double [ 0.000000e+00, %entry ], [ %add.3969.i1044, %concatenate.41.1.clone.1.merge798 ]
  %163 = icmp ult i32 %thread.id.2, 30
  %164 = or disjoint i32 %loop3.invar_address451.01046, %2
  br i1 %163, label %concatenate.pivot.20.615, label %concatenate.pivot.60.621

concatenate.pivot.20.615:                         ; preds = %loop3.loop_body450
  %165 = icmp ult i32 %thread.id.2, 10
  br i1 %165, label %concatenate.pivot.0.616, label %concatenate.pivot.40.617

concatenate.pivot.0.616:                          ; preds = %concatenate.pivot.20.615
  %166 = zext nneg i32 %164 to i64
  %param_24.1077456 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg241115, i64 0, i64 %1, i64 %166
  %param_24.1077457 = load double, ptr addrspace(1) %param_24.1077456, align 8, !invariant.load !270
  %param_26.830459 = load i64, ptr addrspace(1) %param_26.830595, align 8, !invariant.load !270
  %167 = sitofp i64 %param_26.830459 to double
  %multiply.3002.19.clone.1461 = fmul double %167, 0x3F786F8FA34E82C5
  %param_25.1004462 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg251117, i64 0, i64 %1, i64 %166
  %param_25.1004463 = load double, ptr addrspace(1) %param_25.1004462, align 8, !invariant.load !270
  %multiply.3003.11.clone.1464 = fmul double %param_25.1004463, %multiply.3002.19.clone.1461
  %add.4164.9.clone.1465 = fadd double %param_24.1077457, %multiply.3003.11.clone.1464
  %param_21.1549466 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg211109, i64 0, i64 %1, i64 %166
  %param_21.1549467 = load double, ptr addrspace(1) %param_21.1549466, align 8, !invariant.load !270
  %param_22.1270468 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg221111, i64 0, i64 %1, i64 %166
  %param_22.1270469 = load double, ptr addrspace(1) %param_22.1270468, align 8, !invariant.load !270
  %multiply.3000.89.clone.1471 = fmul double %167, 0x3F886F8FA34E82C5
  %param_23.1081472 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg231113, i64 0, i64 %1, i64 %166
  %param_23.1081473 = load double, ptr addrspace(1) %param_23.1081472, align 8, !invariant.load !270
  %add.4172.82.clone.1476 = fadd double %param_23.1081473, %param_23.1081473
  %multiply.3018.27.clone.1477 = fmul double %multiply.3000.89.clone.1471, %add.4172.82.clone.1476
  %add.4182.25.clone.1478 = fadd double %param_22.1270469, %multiply.3018.27.clone.1477
  %add.4206.13.clone.1481 = fsub double %param_21.1549467, %add.4182.25.clone.1478
  %multiply.3037.7.clone.1482 = fmul double %multiply.3002.19.clone.1461, %add.4206.13.clone.1481
  %add.4207.5.clone.1483 = fadd double %add.4164.9.clone.1465, %multiply.3037.7.clone.1482
  br label %concatenate.39.1.clone.1.merge454

concatenate.pivot.40.617:                         ; preds = %concatenate.pivot.20.615
  %168 = icmp ult i32 %thread.id.2, 20
  %param_26.830488 = load i64, ptr addrspace(1) %param_26.830595, align 8, !invariant.load !270
  %169 = sitofp i64 %param_26.830488 to double
  %multiply.3002.19.clone.1490 = fmul double %169, 0x3F786F8FA34E82C5
  br i1 %168, label %concatenate.pivot.20.618, label %concatenate.pivot.40.619

concatenate.pivot.20.618:                         ; preds = %concatenate.pivot.40.617
  %170 = add nsw i32 %164, -20
  %171 = zext nneg i32 %170 to i64
  %param_19.1793485 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg191105, i64 0, i64 %1, i64 %171
  %param_19.1793486 = load double, ptr addrspace(1) %param_19.1793485, align 8, !invariant.load !270
  %param_20.1822491 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg201107, i64 0, i64 %1, i64 %171
  %param_20.1822492 = load double, ptr addrspace(1) %param_20.1822491, align 8, !invariant.load !270
  %multiply.3004.11.clone.1493 = fmul double %param_20.1822492, %multiply.3002.19.clone.1490
  %add.4166.9.clone.1494 = fadd double %param_19.1793486, %multiply.3004.11.clone.1493
  %param_18.1618495 = getelementptr inbounds [1 x [2 x [20 x double]]], ptr addrspace(1) %arg181103, i64 0, i64 0, i64 %1, i64 %171
  %param_18.1618496 = load double, ptr addrspace(1) %param_18.1618495, align 8, !invariant.load !270
  %param_17.1509497 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg171101, i64 0, i64 %1, i64 %171
  %param_17.1509498 = load double, ptr addrspace(1) %param_17.1509497, align 8, !invariant.load !270
  %multiply.3000.89.clone.1500 = fmul double %169, 0x3F886F8FA34E82C5
  %172 = zext nneg i32 %164 to i64
  %param_23.1081501 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg231113, i64 0, i64 %1, i64 %172
  %param_23.1081502 = load double, ptr addrspace(1) %param_23.1081501, align 8, !invariant.load !270
  %add.4172.82.clone.1505 = fadd double %param_23.1081502, %param_23.1081502
  %multiply.3025.23.clone.1506 = fmul double %multiply.3000.89.clone.1500, %add.4172.82.clone.1505
  %add.4191.21.clone.1507 = fadd double %param_17.1509498, %multiply.3025.23.clone.1506
  %add.4192.17.clone.1509 = fadd double %add.4191.21.clone.1507, -1.000000e+00
  %multiply.3046.15.clone.1511 = fmul double %add.4192.17.clone.1509, 4.000000e+00
  %173 = fsub double %param_18.1618496, %multiply.3046.15.clone.1511
  %multiply.3047.7.clone.1513 = fmul double %multiply.3002.19.clone.1490, %173
  %add.4211.5.clone.1514 = fadd double %add.4166.9.clone.1494, %multiply.3047.7.clone.1513
  br label %concatenate.39.1.clone.1.merge454

concatenate.pivot.40.619:                         ; preds = %concatenate.pivot.40.617
  %174 = add nsw i32 %164, -40
  %175 = zext nneg i32 %174 to i64
  %param_15.1185516 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg151097, i64 0, i64 %1, i64 %175
  %param_15.1185517 = load double, ptr addrspace(1) %param_15.1185516, align 8, !invariant.load !270
  %param_16.1273522 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg161099, i64 0, i64 %1, i64 %175
  %param_16.1273523 = load double, ptr addrspace(1) %param_16.1273522, align 8, !invariant.load !270
  %multiply.3005.11.clone.1524 = fmul double %param_16.1273523, %multiply.3002.19.clone.1490
  %add.4167.9.clone.1525 = fadd double %param_15.1185517, %multiply.3005.11.clone.1524
  %param_13.1253526 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg131093, i64 0, i64 %1, i64 %175
  %param_13.1253527 = load double, ptr addrspace(1) %param_13.1253526, align 8, !invariant.load !270
  %param_14.1175528 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg141095, i64 0, i64 %1, i64 %175
  %param_14.1175529 = load double, ptr addrspace(1) %param_14.1175528, align 8, !invariant.load !270
  %multiply.3049.13.clone.1530 = fmul double %param_13.1253527, %param_14.1175529
  %param_12.1370531 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg121091, i64 0, i64 %1, i64 %175
  %param_12.1370532 = load double, ptr addrspace(1) %param_12.1370531, align 8, !invariant.load !270
  %multiply.3000.89.clone.1534 = fmul double %169, 0x3F886F8FA34E82C5
  %176 = zext nneg i32 %164 to i64
  %param_23.1081535 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg231113, i64 0, i64 %1, i64 %176
  %param_23.1081536 = load double, ptr addrspace(1) %param_23.1081535, align 8, !invariant.load !270
  %add.4172.82.clone.1539 = fadd double %param_23.1081536, %param_23.1081536
  %multiply.3014.27.clone.1540 = fmul double %multiply.3000.89.clone.1534, %add.4172.82.clone.1539
  %add.4177.25.clone.1541 = fadd double %param_12.1370532, %multiply.3014.27.clone.1540
  %add.4178.17.clone.1543 = fadd double %add.4177.25.clone.1541, 0xBFF62E42FEFA39EF
  %multiply.3050.15.clone.1545 = fmul double %add.4178.17.clone.1543, 0x3FFC71C71C71C71C
  %177 = fsub double %multiply.3049.13.clone.1530, %multiply.3050.15.clone.1545
  %multiply.3051.7.clone.1547 = fmul double %multiply.3002.19.clone.1490, %177
  %add.4213.5.clone.1548 = fadd double %add.4167.9.clone.1525, %multiply.3051.7.clone.1547
  br label %concatenate.39.1.clone.1.merge454

concatenate.pivot.60.621:                         ; preds = %loop3.loop_body450
  %178 = add nsw i32 %164, -60
  %179 = zext nneg i32 %178 to i64
  %param_10.1580550 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg101087, i64 0, i64 %1, i64 %179
  %param_10.1580551 = load double, ptr addrspace(1) %param_10.1580550, align 8, !invariant.load !270
  %param_26.830553 = load i64, ptr addrspace(1) %param_26.830595, align 8, !invariant.load !270
  %180 = sitofp i64 %param_26.830553 to double
  %multiply.3002.19.clone.1555 = fmul double %180, 0x3F786F8FA34E82C5
  %param_11.1438556 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg111089, i64 0, i64 %1, i64 %179
  %param_11.1438557 = load double, ptr addrspace(1) %param_11.1438556, align 8, !invariant.load !270
  %multiply.3006.11.clone.1558 = fmul double %param_11.1438557, %multiply.3002.19.clone.1555
  %add.4168.9.clone.1559 = fadd double %param_10.1580551, %multiply.3006.11.clone.1558
  %param_8.1922560 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg81083, i64 0, i64 %1, i64 %179
  %param_8.1922561 = load double, ptr addrspace(1) %param_8.1922560, align 8, !invariant.load !270
  %param_9.1742562 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg91085, i64 0, i64 %1, i64 %179
  %param_9.1742563 = load double, ptr addrspace(1) %param_9.1742562, align 8, !invariant.load !270
  %add.4197.17.clone.1565 = fadd double %param_9.1742563, -1.000000e+00
  %add.4214.13.clone.1567 = fsub double %param_8.1922561, %add.4197.17.clone.1565
  %multiply.3053.7.clone.1568 = fmul double %multiply.3002.19.clone.1555, %add.4214.13.clone.1567
  %add.4216.5.clone.1569 = fadd double %add.4168.9.clone.1559, %multiply.3053.7.clone.1568
  br label %concatenate.39.1.clone.1.merge454

concatenate.39.1.clone.1.merge454:                ; preds = %concatenate.pivot.60.621, %concatenate.pivot.40.619, %concatenate.pivot.20.618, %concatenate.pivot.0.616
  %param_26.830553.1 = phi i64 [ %param_26.830459, %concatenate.pivot.0.616 ], [ %param_26.830488, %concatenate.pivot.20.618 ], [ %param_26.830488, %concatenate.pivot.40.619 ], [ %param_26.830553, %concatenate.pivot.60.621 ]
  %181 = phi double [ %add.4207.5.clone.1483, %concatenate.pivot.0.616 ], [ %add.4211.5.clone.1514, %concatenate.pivot.20.618 ], [ %add.4213.5.clone.1548, %concatenate.pivot.40.619 ], [ %add.4216.5.clone.1569, %concatenate.pivot.60.621 ]
  %182 = icmp ult i32 %thread.id.2, 30
  %multiply.3058.1625 = fmul double %181, %181
  %add.3969.i1044 = fadd double %partial_reduction_result.31045, %multiply.3058.1625
  br i1 %182, label %concatenate.pivot.20.788, label %concatenate.pivot.60.794

concatenate.pivot.20.788:                         ; preds = %concatenate.39.1.clone.1.merge454
  %183 = icmp ult i32 %thread.id.2, 10
  br i1 %183, label %concatenate.pivot.0.789, label %concatenate.pivot.40.790

concatenate.pivot.0.789:                          ; preds = %concatenate.pivot.20.788
  %184 = zext nneg i32 %164 to i64
  %param_24.1077629 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg241115, i64 0, i64 %1, i64 %184
  %param_24.1077630 = load double, ptr addrspace(1) %param_24.1077629, align 8, !invariant.load !270
  %185 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1634 = fmul double %185, 0x3F786F8FA34E82C5
  %param_25.1004635 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg251117, i64 0, i64 %1, i64 %184
  %param_25.1004636 = load double, ptr addrspace(1) %param_25.1004635, align 8, !invariant.load !270
  %multiply.3003.11.clone.1637 = fmul double %param_25.1004636, %multiply.3002.19.clone.1634
  %add.4164.9.clone.1638 = fadd double %param_24.1077630, %multiply.3003.11.clone.1637
  %param_21.1549639 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg211109, i64 0, i64 %1, i64 %184
  %param_21.1549640 = load double, ptr addrspace(1) %param_21.1549639, align 8, !invariant.load !270
  %param_22.1270641 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg221111, i64 0, i64 %1, i64 %184
  %param_22.1270642 = load double, ptr addrspace(1) %param_22.1270641, align 8, !invariant.load !270
  %multiply.3000.89.clone.1644 = fmul double %185, 0x3F886F8FA34E82C5
  %param_23.1081645 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg231113, i64 0, i64 %1, i64 %184
  %param_23.1081646 = load double, ptr addrspace(1) %param_23.1081645, align 8, !invariant.load !270
  %add.4172.82.clone.1649 = fadd double %param_23.1081646, %param_23.1081646
  %multiply.3018.27.clone.1650 = fmul double %multiply.3000.89.clone.1644, %add.4172.82.clone.1649
  %add.4182.25.clone.1651 = fadd double %param_22.1270642, %multiply.3018.27.clone.1650
  %add.4206.13.clone.1654 = fsub double %param_21.1549640, %add.4182.25.clone.1651
  %multiply.3037.7.clone.1655 = fmul double %multiply.3002.19.clone.1634, %add.4206.13.clone.1654
  %add.4207.5.clone.1656 = fadd double %add.4164.9.clone.1638, %multiply.3037.7.clone.1655
  br label %concatenate.39.1.clone.1.merge627

concatenate.pivot.40.790:                         ; preds = %concatenate.pivot.20.788
  %186 = icmp ult i32 %thread.id.2, 20
  %187 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1663 = fmul double %187, 0x3F786F8FA34E82C5
  br i1 %186, label %concatenate.pivot.20.791, label %concatenate.pivot.40.792

concatenate.pivot.20.791:                         ; preds = %concatenate.pivot.40.790
  %188 = add nsw i32 %164, -20
  %189 = zext nneg i32 %188 to i64
  %param_19.1793658 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg191105, i64 0, i64 %1, i64 %189
  %param_19.1793659 = load double, ptr addrspace(1) %param_19.1793658, align 8, !invariant.load !270
  %param_20.1822664 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg201107, i64 0, i64 %1, i64 %189
  %param_20.1822665 = load double, ptr addrspace(1) %param_20.1822664, align 8, !invariant.load !270
  %multiply.3004.11.clone.1666 = fmul double %param_20.1822665, %multiply.3002.19.clone.1663
  %add.4166.9.clone.1667 = fadd double %param_19.1793659, %multiply.3004.11.clone.1666
  %param_18.1618668 = getelementptr inbounds [1 x [2 x [20 x double]]], ptr addrspace(1) %arg181103, i64 0, i64 0, i64 %1, i64 %189
  %param_18.1618669 = load double, ptr addrspace(1) %param_18.1618668, align 8, !invariant.load !270
  %param_17.1509670 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg171101, i64 0, i64 %1, i64 %189
  %param_17.1509671 = load double, ptr addrspace(1) %param_17.1509670, align 8, !invariant.load !270
  %multiply.3000.89.clone.1673 = fmul double %187, 0x3F886F8FA34E82C5
  %190 = zext nneg i32 %164 to i64
  %param_23.1081674 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg231113, i64 0, i64 %1, i64 %190
  %param_23.1081675 = load double, ptr addrspace(1) %param_23.1081674, align 8, !invariant.load !270
  %add.4172.82.clone.1678 = fadd double %param_23.1081675, %param_23.1081675
  %multiply.3025.23.clone.1679 = fmul double %multiply.3000.89.clone.1673, %add.4172.82.clone.1678
  %add.4191.21.clone.1680 = fadd double %param_17.1509671, %multiply.3025.23.clone.1679
  %add.4192.17.clone.1682 = fadd double %add.4191.21.clone.1680, -1.000000e+00
  %multiply.3046.15.clone.1684 = fmul double %add.4192.17.clone.1682, 4.000000e+00
  %191 = fsub double %param_18.1618669, %multiply.3046.15.clone.1684
  %multiply.3047.7.clone.1686 = fmul double %multiply.3002.19.clone.1663, %191
  %add.4211.5.clone.1687 = fadd double %add.4166.9.clone.1667, %multiply.3047.7.clone.1686
  br label %concatenate.39.1.clone.1.merge627

concatenate.pivot.40.792:                         ; preds = %concatenate.pivot.40.790
  %192 = add nsw i32 %164, -40
  %193 = zext nneg i32 %192 to i64
  %param_15.1185689 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg151097, i64 0, i64 %1, i64 %193
  %param_15.1185690 = load double, ptr addrspace(1) %param_15.1185689, align 8, !invariant.load !270
  %param_16.1273695 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg161099, i64 0, i64 %1, i64 %193
  %param_16.1273696 = load double, ptr addrspace(1) %param_16.1273695, align 8, !invariant.load !270
  %multiply.3005.11.clone.1697 = fmul double %param_16.1273696, %multiply.3002.19.clone.1663
  %add.4167.9.clone.1698 = fadd double %param_15.1185690, %multiply.3005.11.clone.1697
  %param_13.1253699 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg131093, i64 0, i64 %1, i64 %193
  %param_13.1253700 = load double, ptr addrspace(1) %param_13.1253699, align 8, !invariant.load !270
  %param_14.1175701 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg141095, i64 0, i64 %1, i64 %193
  %param_14.1175702 = load double, ptr addrspace(1) %param_14.1175701, align 8, !invariant.load !270
  %multiply.3049.13.clone.1703 = fmul double %param_13.1253700, %param_14.1175702
  %param_12.1370704 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg121091, i64 0, i64 %1, i64 %193
  %param_12.1370705 = load double, ptr addrspace(1) %param_12.1370704, align 8, !invariant.load !270
  %multiply.3000.89.clone.1707 = fmul double %187, 0x3F886F8FA34E82C5
  %194 = zext nneg i32 %164 to i64
  %param_23.1081708 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg231113, i64 0, i64 %1, i64 %194
  %param_23.1081709 = load double, ptr addrspace(1) %param_23.1081708, align 8, !invariant.load !270
  %add.4172.82.clone.1712 = fadd double %param_23.1081709, %param_23.1081709
  %multiply.3014.27.clone.1713 = fmul double %multiply.3000.89.clone.1707, %add.4172.82.clone.1712
  %add.4177.25.clone.1714 = fadd double %param_12.1370705, %multiply.3014.27.clone.1713
  %add.4178.17.clone.1716 = fadd double %add.4177.25.clone.1714, 0xBFF62E42FEFA39EF
  %multiply.3050.15.clone.1718 = fmul double %add.4178.17.clone.1716, 0x3FFC71C71C71C71C
  %195 = fsub double %multiply.3049.13.clone.1703, %multiply.3050.15.clone.1718
  %multiply.3051.7.clone.1720 = fmul double %multiply.3002.19.clone.1663, %195
  %add.4213.5.clone.1721 = fadd double %add.4167.9.clone.1698, %multiply.3051.7.clone.1720
  br label %concatenate.39.1.clone.1.merge627

concatenate.pivot.60.794:                         ; preds = %concatenate.39.1.clone.1.merge454
  %196 = add nsw i32 %164, -60
  %197 = zext nneg i32 %196 to i64
  %param_10.1580723 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg101087, i64 0, i64 %1, i64 %197
  %param_10.1580724 = load double, ptr addrspace(1) %param_10.1580723, align 8, !invariant.load !270
  %198 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1728 = fmul double %198, 0x3F786F8FA34E82C5
  %param_11.1438729 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg111089, i64 0, i64 %1, i64 %197
  %param_11.1438730 = load double, ptr addrspace(1) %param_11.1438729, align 8, !invariant.load !270
  %multiply.3006.11.clone.1731 = fmul double %param_11.1438730, %multiply.3002.19.clone.1728
  %add.4168.9.clone.1732 = fadd double %param_10.1580724, %multiply.3006.11.clone.1731
  %param_8.1922733 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg81083, i64 0, i64 %1, i64 %197
  %param_8.1922734 = load double, ptr addrspace(1) %param_8.1922733, align 8, !invariant.load !270
  %param_9.1742735 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg91085, i64 0, i64 %1, i64 %197
  %param_9.1742736 = load double, ptr addrspace(1) %param_9.1742735, align 8, !invariant.load !270
  %add.4197.17.clone.1738 = fadd double %param_9.1742736, -1.000000e+00
  %add.4214.13.clone.1740 = fsub double %param_8.1922734, %add.4197.17.clone.1738
  %multiply.3053.7.clone.1741 = fmul double %multiply.3002.19.clone.1728, %add.4214.13.clone.1740
  %add.4216.5.clone.1742 = fadd double %add.4168.9.clone.1732, %multiply.3053.7.clone.1741
  br label %concatenate.39.1.clone.1.merge627

concatenate.39.1.clone.1.merge627:                ; preds = %concatenate.pivot.60.794, %concatenate.pivot.40.792, %concatenate.pivot.20.791, %concatenate.pivot.0.789
  %199 = phi double [ %add.4207.5.clone.1656, %concatenate.pivot.0.789 ], [ %add.4211.5.clone.1687, %concatenate.pivot.20.791 ], [ %add.4213.5.clone.1721, %concatenate.pivot.40.792 ], [ %add.4216.5.clone.1742, %concatenate.pivot.60.794 ]
  %200 = icmp ult i32 %thread.id.2, 30
  br i1 %200, label %concatenate.pivot.20.1001, label %concatenate.pivot.60.1007

concatenate.pivot.20.1001:                        ; preds = %concatenate.39.1.clone.1.merge627
  %201 = icmp ult i32 %thread.id.2, 10
  br i1 %201, label %concatenate.pivot.0.1002, label %concatenate.pivot.40.1003

concatenate.pivot.0.1002:                         ; preds = %concatenate.pivot.20.1001
  %param_33.315801 = load i64, ptr addrspace(1) %param_33.315972, align 8, !invariant.load !270
  %202 = icmp eq i64 %param_33.315801, 0
  %203 = zext nneg i32 %164 to i64
  %param_32.326804 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg321131, i64 0, i64 %1, i64 %203
  %param_32.326805 = load double, ptr addrspace(1) %param_32.326804, align 8, !invariant.load !270
  %param_24.1077806 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg241115, i64 0, i64 %1, i64 %203
  %param_24.1077807 = load double, ptr addrspace(1) %param_24.1077806, align 8, !invariant.load !270
  %204 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1811 = fmul double %204, 0x3F786F8FA34E82C5
  %param_25.1004812 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg251117, i64 0, i64 %1, i64 %203
  %param_25.1004813 = load double, ptr addrspace(1) %param_25.1004812, align 8, !invariant.load !270
  %multiply.3003.11.clone.1814 = fmul double %param_25.1004813, %multiply.3002.19.clone.1811
  %add.4164.9.clone.1815 = fadd double %param_24.1077807, %multiply.3003.11.clone.1814
  %param_21.1549816 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg211109, i64 0, i64 %1, i64 %203
  %param_21.1549817 = load double, ptr addrspace(1) %param_21.1549816, align 8, !invariant.load !270
  %param_22.1270818 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg221111, i64 0, i64 %1, i64 %203
  %param_22.1270819 = load double, ptr addrspace(1) %param_22.1270818, align 8, !invariant.load !270
  %multiply.3000.89.clone.1821 = fmul double %204, 0x3F886F8FA34E82C5
  %param_23.1081822 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg231113, i64 0, i64 %1, i64 %203
  %param_23.1081823 = load double, ptr addrspace(1) %param_23.1081822, align 8, !invariant.load !270
  %add.4172.82.clone.1826 = fadd double %param_23.1081823, %param_23.1081823
  %multiply.3018.27.clone.1827 = fmul double %multiply.3000.89.clone.1821, %add.4172.82.clone.1826
  %add.4182.25.clone.1828 = fadd double %param_22.1270819, %multiply.3018.27.clone.1827
  %add.4206.13.clone.1831 = fsub double %param_21.1549817, %add.4182.25.clone.1828
  %multiply.3037.7.clone.1832 = fmul double %multiply.3002.19.clone.1811, %add.4206.13.clone.1831
  %add.4207.5.clone.1833 = fadd double %add.4164.9.clone.1815, %multiply.3037.7.clone.1832
  %add.4229.3.clone.1834 = fadd double %param_32.326805, %add.4207.5.clone.1833
  %205 = select i1 %202, double %add.4207.5.clone.1833, double %add.4229.3.clone.1834
  br label %concatenate.41.1.clone.1.merge798

concatenate.pivot.40.1003:                        ; preds = %concatenate.pivot.20.1001
  %206 = icmp ult i32 %thread.id.2, 20
  %param_33.315837 = load i64, ptr addrspace(1) %param_33.315972, align 8, !invariant.load !270
  %207 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1847 = fmul double %207, 0x3F786F8FA34E82C5
  br i1 %206, label %concatenate.pivot.20.1004, label %concatenate.pivot.40.1005

concatenate.pivot.20.1004:                        ; preds = %concatenate.pivot.40.1003
  %208 = icmp eq i64 %param_33.315837, 0
  %209 = add nsw i32 %164, -20
  %210 = zext nneg i32 %209 to i64
  %param_31.409840 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg311129, i64 0, i64 %1, i64 %210
  %param_31.409841 = load double, ptr addrspace(1) %param_31.409840, align 8, !invariant.load !270
  %param_19.1793842 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg191105, i64 0, i64 %1, i64 %210
  %param_19.1793843 = load double, ptr addrspace(1) %param_19.1793842, align 8, !invariant.load !270
  %param_20.1822848 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg201107, i64 0, i64 %1, i64 %210
  %param_20.1822849 = load double, ptr addrspace(1) %param_20.1822848, align 8, !invariant.load !270
  %multiply.3004.11.clone.1850 = fmul double %param_20.1822849, %multiply.3002.19.clone.1847
  %add.4166.9.clone.1851 = fadd double %param_19.1793843, %multiply.3004.11.clone.1850
  %param_18.1618852 = getelementptr inbounds [1 x [2 x [20 x double]]], ptr addrspace(1) %arg181103, i64 0, i64 0, i64 %1, i64 %210
  %param_18.1618853 = load double, ptr addrspace(1) %param_18.1618852, align 8, !invariant.load !270
  %param_17.1509854 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg171101, i64 0, i64 %1, i64 %210
  %param_17.1509855 = load double, ptr addrspace(1) %param_17.1509854, align 8, !invariant.load !270
  %multiply.3000.89.clone.1857 = fmul double %207, 0x3F886F8FA34E82C5
  %211 = zext nneg i32 %164 to i64
  %param_23.1081858 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg231113, i64 0, i64 %1, i64 %211
  %param_23.1081859 = load double, ptr addrspace(1) %param_23.1081858, align 8, !invariant.load !270
  %add.4172.82.clone.1862 = fadd double %param_23.1081859, %param_23.1081859
  %multiply.3025.23.clone.1863 = fmul double %multiply.3000.89.clone.1857, %add.4172.82.clone.1862
  %add.4191.21.clone.1864 = fadd double %param_17.1509855, %multiply.3025.23.clone.1863
  %add.4192.17.clone.1866 = fadd double %add.4191.21.clone.1864, -1.000000e+00
  %multiply.3046.15.clone.1868 = fmul double %add.4192.17.clone.1866, 4.000000e+00
  %212 = fsub double %param_18.1618853, %multiply.3046.15.clone.1868
  %multiply.3047.7.clone.1870 = fmul double %multiply.3002.19.clone.1847, %212
  %add.4211.5.clone.1871 = fadd double %add.4166.9.clone.1851, %multiply.3047.7.clone.1870
  %add.4231.3.clone.1872 = fadd double %param_31.409841, %add.4211.5.clone.1871
  %213 = select i1 %208, double %add.4211.5.clone.1871, double %add.4231.3.clone.1872
  br label %concatenate.41.1.clone.1.merge798

concatenate.pivot.40.1005:                        ; preds = %concatenate.pivot.40.1003
  %214 = icmp eq i64 %param_33.315837, 0
  %215 = add nsw i32 %164, -40
  %216 = zext nneg i32 %215 to i64
  %param_30.524878 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg301127, i64 0, i64 %1, i64 %216
  %param_30.524879 = load double, ptr addrspace(1) %param_30.524878, align 8, !invariant.load !270
  %param_15.1185880 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg151097, i64 0, i64 %1, i64 %216
  %param_15.1185881 = load double, ptr addrspace(1) %param_15.1185880, align 8, !invariant.load !270
  %param_16.1273886 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg161099, i64 0, i64 %1, i64 %216
  %param_16.1273887 = load double, ptr addrspace(1) %param_16.1273886, align 8, !invariant.load !270
  %multiply.3005.11.clone.1888 = fmul double %param_16.1273887, %multiply.3002.19.clone.1847
  %add.4167.9.clone.1889 = fadd double %param_15.1185881, %multiply.3005.11.clone.1888
  %param_13.1253890 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg131093, i64 0, i64 %1, i64 %216
  %param_13.1253891 = load double, ptr addrspace(1) %param_13.1253890, align 8, !invariant.load !270
  %param_14.1175892 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg141095, i64 0, i64 %1, i64 %216
  %param_14.1175893 = load double, ptr addrspace(1) %param_14.1175892, align 8, !invariant.load !270
  %multiply.3049.13.clone.1894 = fmul double %param_13.1253891, %param_14.1175893
  %param_12.1370895 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg121091, i64 0, i64 %1, i64 %216
  %param_12.1370896 = load double, ptr addrspace(1) %param_12.1370895, align 8, !invariant.load !270
  %multiply.3000.89.clone.1898 = fmul double %207, 0x3F886F8FA34E82C5
  %217 = zext nneg i32 %164 to i64
  %param_23.1081899 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg231113, i64 0, i64 %1, i64 %217
  %param_23.1081900 = load double, ptr addrspace(1) %param_23.1081899, align 8, !invariant.load !270
  %add.4172.82.clone.1903 = fadd double %param_23.1081900, %param_23.1081900
  %multiply.3014.27.clone.1904 = fmul double %multiply.3000.89.clone.1898, %add.4172.82.clone.1903
  %add.4177.25.clone.1905 = fadd double %param_12.1370896, %multiply.3014.27.clone.1904
  %add.4178.17.clone.1907 = fadd double %add.4177.25.clone.1905, 0xBFF62E42FEFA39EF
  %multiply.3050.15.clone.1909 = fmul double %add.4178.17.clone.1907, 0x3FFC71C71C71C71C
  %218 = fsub double %multiply.3049.13.clone.1894, %multiply.3050.15.clone.1909
  %multiply.3051.7.clone.1911 = fmul double %multiply.3002.19.clone.1847, %218
  %add.4213.5.clone.1912 = fadd double %add.4167.9.clone.1889, %multiply.3051.7.clone.1911
  %add.4232.3.clone.1913 = fadd double %param_30.524879, %add.4213.5.clone.1912
  %219 = select i1 %214, double %add.4213.5.clone.1912, double %add.4232.3.clone.1913
  br label %concatenate.41.1.clone.1.merge798

concatenate.pivot.60.1007:                        ; preds = %concatenate.39.1.clone.1.merge627
  %220 = add nsw i32 %164, -60
  %param_33.315916 = load i64, ptr addrspace(1) %param_33.315972, align 8, !invariant.load !270
  %221 = icmp eq i64 %param_33.315916, 0
  %222 = zext nneg i32 %220 to i64
  %param_29.617919 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg291125, i64 0, i64 %1, i64 %222
  %param_29.617920 = load double, ptr addrspace(1) %param_29.617919, align 8, !invariant.load !270
  %param_10.1580921 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg101087, i64 0, i64 %1, i64 %222
  %param_10.1580922 = load double, ptr addrspace(1) %param_10.1580921, align 8, !invariant.load !270
  %223 = sitofp i64 %param_26.830553.1 to double
  %multiply.3002.19.clone.1926 = fmul double %223, 0x3F786F8FA34E82C5
  %param_11.1438927 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg111089, i64 0, i64 %1, i64 %222
  %param_11.1438928 = load double, ptr addrspace(1) %param_11.1438927, align 8, !invariant.load !270
  %multiply.3006.11.clone.1929 = fmul double %param_11.1438928, %multiply.3002.19.clone.1926
  %add.4168.9.clone.1930 = fadd double %param_10.1580922, %multiply.3006.11.clone.1929
  %param_8.1922931 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg81083, i64 0, i64 %1, i64 %222
  %param_8.1922932 = load double, ptr addrspace(1) %param_8.1922931, align 8, !invariant.load !270
  %param_9.1742933 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg91085, i64 0, i64 %1, i64 %222
  %param_9.1742934 = load double, ptr addrspace(1) %param_9.1742933, align 8, !invariant.load !270
  %add.4197.17.clone.1936 = fadd double %param_9.1742934, -1.000000e+00
  %add.4214.13.clone.1938 = fsub double %param_8.1922932, %add.4197.17.clone.1936
  %multiply.3053.7.clone.1939 = fmul double %multiply.3002.19.clone.1926, %add.4214.13.clone.1938
  %add.4216.5.clone.1940 = fadd double %add.4168.9.clone.1930, %multiply.3053.7.clone.1939
  %add.4233.3.clone.1941 = fadd double %param_29.617920, %add.4216.5.clone.1940
  %224 = select i1 %221, double %add.4216.5.clone.1940, double %add.4233.3.clone.1941
  %.pre = zext nneg i32 %164 to i64
  br label %concatenate.41.1.clone.1.merge798

concatenate.41.1.clone.1.merge798:                ; preds = %concatenate.pivot.60.1007, %concatenate.pivot.40.1005, %concatenate.pivot.20.1004, %concatenate.pivot.0.1002
  %.pre-phi = phi i64 [ %.pre, %concatenate.pivot.60.1007 ], [ %217, %concatenate.pivot.40.1005 ], [ %211, %concatenate.pivot.20.1004 ], [ %203, %concatenate.pivot.0.1002 ]
  %param_33.315916.1 = phi i64 [ %param_33.315801, %concatenate.pivot.0.1002 ], [ %param_33.315837, %concatenate.pivot.20.1004 ], [ %param_33.315837, %concatenate.pivot.40.1005 ], [ %param_33.315916, %concatenate.pivot.60.1007 ]
  %225 = phi double [ %205, %concatenate.pivot.0.1002 ], [ %213, %concatenate.pivot.20.1004 ], [ %219, %concatenate.pivot.40.1005 ], [ %224, %concatenate.pivot.60.1007 ]
  %226 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg351137, i64 0, i64 %1, i64 %.pre-phi
  store double %199, ptr addrspace(1) %226, align 8
  %227 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg361139, i64 0, i64 %1, i64 %.pre-phi
  store double %225, ptr addrspace(1) %227, align 8
  br i1 %.not, label %loop3.loop_body450, label %x_in_tile-after, !llvm.loop !286

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %228 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg341135, i64 0, i64 %1
  br i1 %228, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i1043, ptr addrspace(3) %159, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %159, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_select_fusion(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg8, ptr noalias nocapture align 128 dereferenceable(320) %arg9, ptr noalias nocapture align 128 dereferenceable(320) %arg10, ptr noalias nocapture align 128 dereferenceable(320) %arg11, ptr noalias nocapture align 128 dereferenceable(320) %arg12, ptr noalias nocapture align 128 dereferenceable(320) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg14) local_unnamed_addr #2 {
entry:
  %arg1431 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1329 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1227 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1125 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1023 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg921 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg819 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg717 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg615 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp2 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp2, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg411, i64 0, i64 %2
  %4 = load i64, ptr addrspace(1) %3, align 8, !invariant.load !270
  %5 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg513, i64 0, i64 %2
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = icmp sge i64 %4, %6
  %8 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg39, i64 0, i64 %2
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !270
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg27, i64 0, i64 %2
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !270
  %12 = or i8 %11, %9
  %13 = trunc i8 %12 to i1
  %.not1 = or i1 %7, %13
  %14 = zext nneg i32 %0 to i64
  %15 = getelementptr double, ptr addrspace(1) %arg15, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !270
  %17 = getelementptr double, ptr addrspace(1) %arg615, i64 %14
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !270
  %19 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg819, i64 0, i64 %2
  %20 = load i64, ptr addrspace(1) %19, align 8, !invariant.load !270
  %21 = sitofp i64 %20 to double
  %multiply.3000.75 = fmul double %21, 0x3F886F8FA34E82C5
  %22 = zext nneg i32 %1 to i64
  %23 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg717, i64 0, i64 %2, i64 %22
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !270
  %add.4172.68 = fadd double %24, %24
  %multiply.3018.13 = fmul double %multiply.3000.75, %add.4172.68
  %add.4182.11 = fadd double %18, %multiply.3018.13
  %add.4206.9 = fsub double %16, %add.4182.11
  %25 = getelementptr double, ptr addrspace(1) %arg03, i64 %14
  %26 = load double, ptr addrspace(1) %25, align 8
  %27 = select i1 %.not1, double %26, double %add.4206.9
  %28 = icmp eq i64 %4, 0
  %29 = getelementptr double, ptr addrspace(1) %arg921, i64 %14
  %30 = load double, ptr addrspace(1) %29, align 8
  %31 = getelementptr double, ptr addrspace(1) %arg1023, i64 %14
  %32 = load double, ptr addrspace(1) %31, align 8
  %multiply.3002.15.clone.1 = fmul double %21, 0x3F786F8FA34E82C5
  %multiply.3003.15.clone.1 = fmul double %multiply.3002.15.clone.1, %26
  %add.4164.13.clone.1 = fadd double %multiply.3003.15.clone.1, %32
  %multiply.3037.11.clone.1 = fmul double %multiply.3002.15.clone.1, %add.4206.9
  %add.4207.9.clone.1 = fadd double %add.4164.13.clone.1, %multiply.3037.11.clone.1
  %add.4229.5.clone.1 = fadd double %30, %add.4207.9.clone.1
  %33 = select i1 %28, double %add.4207.9.clone.1, double %add.4229.5.clone.1
  %34 = select i1 %.not1, double %30, double %33
  %35 = getelementptr double, ptr addrspace(1) %arg1125, i64 %14
  %36 = load double, ptr addrspace(1) %35, align 8
  %37 = select i1 %28, double %add.4206.9, double %36
  %38 = select i1 %.not1, double %36, double %37
  %39 = getelementptr double, ptr addrspace(1) %arg1227, i64 %14
  %40 = load double, ptr addrspace(1) %39, align 8
  %41 = select i1 %28, double %add.4207.9.clone.1, double %40
  %42 = select i1 %.not1, double %40, double %41
  %43 = select i1 %.not1, double %32, double %add.4207.9.clone.1
  %multiply.3019.1.clone.1 = fmul double %add.4182.11, %add.4182.11
  %add.4183.3.clone.1 = fadd double %multiply.3019.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.3020.1.clone.1 = fmul double %add.4183.3.clone.1, -5.000000e-01
  %44 = getelementptr double, ptr addrspace(1) %arg1329, i64 %14
  %45 = load double, ptr addrspace(1) %44, align 8
  %46 = select i1 %28, double %add.4182.11, double %45
  %47 = select i1 %.not1, double %45, double %46
  store double %27, ptr addrspace(1) %25, align 8
  store double %34, ptr addrspace(1) %29, align 8
  store double %38, ptr addrspace(1) %35, align 8
  store double %42, ptr addrspace(1) %39, align 8
  store double %43, ptr addrspace(1) %31, align 8
  %48 = getelementptr double, ptr addrspace(1) %arg1431, i64 %14
  store double %multiply.3020.1.clone.1, ptr addrspace(1) %48, align 8
  store double %47, ptr addrspace(1) %44, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #4 {
entry:
  %arg138 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg036 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %thread.id.2 to i64
  %2 = trunc i32 %0 to i16
  %3 = add nuw nsw i32 %0, -128
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %x_in_tile-after.3, %entry
  %lsr.iv40 = phi i32 [ %lsr.iv.next41, %x_in_tile-after.3 ], [ %3, %entry ]
  %lsr.iv = phi i16 [ %lsr.iv.next, %x_in_tile-after.3 ], [ %2, %entry ]
  %partial_reduction_result.031 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1.3, %x_in_tile-after.3 ]
  %4 = trunc i64 %1 to i32
  %5 = icmp ult i32 %4, 2
  br i1 %5, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3969.i28, %x_in_tile-true ], [ %partial_reduction_result.031, %loop1.loop_body ]
  %6 = trunc i64 %1 to i32
  %7 = icmp ult i32 %6, 2
  br i1 %7, label %x_in_tile-true.1, label %x_in_tile-after.1

x_in_tile-true.1:                                 ; preds = %x_in_tile-after
  %8 = add i16 %lsr.iv, 32
  %.lhs.trunc.1.frozen = freeze i16 %8
  %9 = udiv i16 %.lhs.trunc.1.frozen, 192
  %10 = mul i16 %9, 192
  %.decomposed = sub i16 %.lhs.trunc.1.frozen, %10
  %11 = zext nneg i16 %9 to i64
  %12 = zext nneg i16 %.decomposed to i64
  %param_0.2431.1 = getelementptr inbounds [20 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %11, i64 %12, i64 0, i64 %1
  %param_0.24312.1 = load double, ptr addrspace(1) %param_0.2431.1, align 8, !invariant.load !270
  %add.3969.i28.1 = fadd double %partial_reduction_result.1, %param_0.24312.1
  br label %x_in_tile-after.1

x_in_tile-after.1:                                ; preds = %x_in_tile-true.1, %x_in_tile-after
  %partial_reduction_result.1.1 = phi double [ %add.3969.i28.1, %x_in_tile-true.1 ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %13 = trunc i64 %1 to i32
  %14 = icmp ult i32 %13, 2
  br i1 %14, label %x_in_tile-true.2, label %x_in_tile-after.2

x_in_tile-true.2:                                 ; preds = %x_in_tile-after.1
  %15 = add i16 %lsr.iv, 64
  %.lhs.trunc.2.frozen = freeze i16 %15
  %16 = udiv i16 %.lhs.trunc.2.frozen, 192
  %17 = mul i16 %16, 192
  %.decomposed33 = sub i16 %.lhs.trunc.2.frozen, %17
  %18 = zext nneg i16 %16 to i64
  %19 = zext nneg i16 %.decomposed33 to i64
  %param_0.2431.2 = getelementptr inbounds [20 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %18, i64 %19, i64 0, i64 %1
  %param_0.24312.2 = load double, ptr addrspace(1) %param_0.2431.2, align 8, !invariant.load !270
  %add.3969.i28.2 = fadd double %partial_reduction_result.1.1, %param_0.24312.2
  br label %x_in_tile-after.2

x_in_tile-after.2:                                ; preds = %x_in_tile-true.2, %x_in_tile-after.1
  %partial_reduction_result.1.2 = phi double [ %add.3969.i28.2, %x_in_tile-true.2 ], [ %partial_reduction_result.1.1, %x_in_tile-after.1 ]
  %20 = trunc i64 %1 to i32
  %21 = icmp ult i32 %20, 2
  br i1 %21, label %x_in_tile-true.3, label %x_in_tile-after.3

x_in_tile-true.3:                                 ; preds = %x_in_tile-after.2
  %22 = add i16 %lsr.iv, 96
  %.lhs.trunc.3.frozen = freeze i16 %22
  %23 = udiv i16 %.lhs.trunc.3.frozen, 192
  %24 = mul i16 %23, 192
  %.decomposed34 = sub i16 %.lhs.trunc.3.frozen, %24
  %25 = zext nneg i16 %23 to i64
  %26 = zext nneg i16 %.decomposed34 to i64
  %param_0.2431.3 = getelementptr inbounds [20 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %25, i64 %26, i64 0, i64 %1
  %param_0.24312.3 = load double, ptr addrspace(1) %param_0.2431.3, align 8, !invariant.load !270
  %add.3969.i28.3 = fadd double %partial_reduction_result.1.2, %param_0.24312.3
  br label %x_in_tile-after.3

x_in_tile-after.3:                                ; preds = %x_in_tile-true.3, %x_in_tile-after.2
  %partial_reduction_result.1.3 = phi double [ %add.3969.i28.3, %x_in_tile-true.3 ], [ %partial_reduction_result.1.2, %x_in_tile-after.2 ]
  %lsr.iv.next = add nuw nsw i16 %lsr.iv, 128
  %lsr.iv.next41 = add nsw i32 %lsr.iv40, 128
  %27 = icmp ugt i32 %lsr.iv.next41, 3711
  br i1 %27, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !287

loop1.loop_exit:                                  ; preds = %x_in_tile-after.3
  %28 = zext nneg i32 %0 to i64
  %29 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache5, i64 0, i64 %1, i64 %28
  store double %partial_reduction_result.1.3, ptr addrspace(3) %29, align 8
  tail call void @llvm.nvvm.barrier0()
  %30 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache5, i64 0, i64 %28, i64 %1
  %partial_reduction_result31819 = load <2 x i32>, ptr addrspace(3) %30, align 8
  %31 = extractelement <2 x i32> %partial_reduction_result31819, i64 0
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 16, i32 31)
  %33 = insertelement <2 x i32> poison, i32 %32, i64 0
  %34 = extractelement <2 x i32> %partial_reduction_result31819, i64 1
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 16, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to double
  %38 = bitcast <2 x i32> %partial_reduction_result31819 to double
  %add.3969.i = fadd double %38, %37
  %39 = bitcast double %add.3969.i to <2 x i32>
  %40 = extractelement <2 x i32> %39, i64 0
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 8, i32 31)
  %42 = insertelement <2 x i32> poison, i32 %41, i64 0
  %43 = extractelement <2 x i32> %39, i64 1
  %44 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 8, i32 31)
  %45 = insertelement <2 x i32> %42, i32 %44, i64 1
  %46 = bitcast <2 x i32> %45 to double
  %add.3969.i24 = fadd double %add.3969.i, %46
  %47 = bitcast double %add.3969.i24 to <2 x i32>
  %48 = extractelement <2 x i32> %47, i64 0
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 4, i32 31)
  %50 = insertelement <2 x i32> poison, i32 %49, i64 0
  %51 = extractelement <2 x i32> %47, i64 1
  %52 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %51, i32 4, i32 31)
  %53 = insertelement <2 x i32> %50, i32 %52, i64 1
  %54 = bitcast <2 x i32> %53 to double
  %add.3969.i25 = fadd double %add.3969.i24, %54
  %55 = bitcast double %add.3969.i25 to <2 x i32>
  %56 = extractelement <2 x i32> %55, i64 0
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> poison, i32 %57, i64 0
  %59 = extractelement <2 x i32> %55, i64 1
  %60 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %59, i32 2, i32 31)
  %61 = insertelement <2 x i32> %58, i32 %60, i64 1
  %62 = bitcast <2 x i32> %61 to double
  %add.3969.i26 = fadd double %add.3969.i25, %62
  %63 = bitcast double %add.3969.i26 to <2 x i32>
  %64 = extractelement <2 x i32> %63, i64 0
  %65 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  %66 = insertelement <2 x i32> poison, i32 %65, i64 0
  %67 = extractelement <2 x i32> %63, i64 1
  %68 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %67, i32 1, i32 31)
  %69 = insertelement <2 x i32> %66, i32 %68, i64 1
  %70 = bitcast <2 x i32> %69 to double
  %add.3969.i27 = fadd double %add.3969.i26, %70
  store double %add.3969.i27, ptr addrspace(3) %30, align 8
  %71 = and i32 %thread.id.x, 991
  %72 = icmp eq i32 %71, 0
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg138, i64 0, i64 %28
  br i1 %72, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %.lhs.trunc.frozen = freeze i16 %lsr.iv
  %73 = udiv i16 %.lhs.trunc.frozen, 192
  %74 = mul i16 %73, 192
  %.decomposed35 = sub i16 %.lhs.trunc.frozen, %74
  %75 = zext nneg i16 %73 to i64
  %76 = zext nneg i16 %.decomposed35 to i64
  %param_0.2431 = getelementptr inbounds [20 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %75, i64 %76, i64 0, i64 %1
  %param_0.24312 = load double, ptr addrspace(1) %param_0.2431, align 8, !invariant.load !270
  %add.3969.i28 = fadd double %partial_reduction_result.031, %param_0.24312
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3969.i27, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #2 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %1, i64 0
  %3 = load <2 x double>, ptr addrspace(1) %2, align 32, !invariant.load !270
  %4 = extractelement <2 x double> %3, i32 0
  %5 = extractelement <2 x double> %3, i32 1
  %add.3969.i = fadd double %4, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %5
  %6 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 16
  %7 = load <2 x double>, ptr addrspace(1) %6, align 16, !invariant.load !270
  %8 = extractelement <2 x double> %7, i32 0
  %9 = extractelement <2 x double> %7, i32 1
  %add.3969.i.2 = fadd double %add.3969.i.1, %8
  %add.3969.i.3 = fadd double %add.3969.i.2, %9
  %10 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 32
  %11 = load <2 x double>, ptr addrspace(1) %10, align 32, !invariant.load !270
  %12 = extractelement <2 x double> %11, i32 0
  %13 = extractelement <2 x double> %11, i32 1
  %add.3969.i.4 = fadd double %add.3969.i.3, %12
  %add.3969.i.5 = fadd double %add.3969.i.4, %13
  %14 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 48
  %15 = load <2 x double>, ptr addrspace(1) %14, align 16, !invariant.load !270
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  %add.3969.i.6 = fadd double %add.3969.i.5, %16
  %add.3969.i.7 = fadd double %add.3969.i.6, %17
  %18 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 64
  %19 = load <2 x double>, ptr addrspace(1) %18, align 32, !invariant.load !270
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  %add.3969.i.8 = fadd double %add.3969.i.7, %20
  %add.3969.i.9 = fadd double %add.3969.i.8, %21
  %22 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 80
  %23 = load <2 x double>, ptr addrspace(1) %22, align 16, !invariant.load !270
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %add.3969.i.10 = fadd double %add.3969.i.9, %24
  %add.3969.i.11 = fadd double %add.3969.i.10, %25
  %26 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 96
  %27 = load <2 x double>, ptr addrspace(1) %26, align 32, !invariant.load !270
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %add.3969.i.12 = fadd double %add.3969.i.11, %28
  %add.3969.i.13 = fadd double %add.3969.i.12, %29
  %30 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 112
  %31 = load <2 x double>, ptr addrspace(1) %30, align 16, !invariant.load !270
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %add.3969.i.14 = fadd double %add.3969.i.13, %32
  %add.3969.i.15 = fadd double %add.3969.i.14, %33
  %34 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 128
  %35 = load <2 x double>, ptr addrspace(1) %34, align 32, !invariant.load !270
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  %add.3969.i.16 = fadd double %add.3969.i.15, %36
  %add.3969.i.17 = fadd double %add.3969.i.16, %37
  %38 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 144
  %39 = load <2 x double>, ptr addrspace(1) %38, align 16, !invariant.load !270
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %add.3969.i.18 = fadd double %add.3969.i.17, %40
  %add.3969.i.19 = fadd double %add.3969.i.18, %41
  %42 = getelementptr double, ptr addrspace(1) %arg17, i64 %1
  store double %add.3969.i.19, ptr addrspace(1) %42, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_compare_convert_select_fusion(ptr noalias nocapture align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture align 128 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture align 128 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg9, ptr noalias nocapture align 128 dereferenceable(16) %arg10, ptr noalias nocapture align 128 dereferenceable(16) %arg11, ptr noalias nocapture align 128 dereferenceable(16) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture align 128 dereferenceable(8) %arg20, ptr noalias nocapture align 128 dereferenceable(8) %arg21, ptr noalias nocapture align 128 dereferenceable(16) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg27) local_unnamed_addr #2 {
entry:
  %arg27200 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26198 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25196 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24194 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23192 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22190 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21188 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20186 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19184 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18182 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17180 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16178 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15176 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14174 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13172 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12170 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11168 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10166 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9164 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8162 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7160 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6158 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5156 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4154 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3152 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2150 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0146 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg1148, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = getelementptr i64, ptr addrspace(1) %arg4154, i64 %1
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !270
  %6 = getelementptr i8, ptr addrspace(1) %arg3152, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !270
  %8 = getelementptr i8, ptr addrspace(1) %arg2150, i64 %1
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !270
  %10 = getelementptr inbounds [2 x [2 x i32]], ptr addrspace(1) %arg9164, i64 0, i64 %1, i64 0
  %11 = load <2 x i32>, ptr addrspace(1) %10, align 8, !invariant.load !270
  %12 = extractelement <2 x i32> %11, i32 0
  %13 = extractelement <2 x i32> %11, i32 1
  %14 = getelementptr double, ptr addrspace(1) %arg8162, i64 %1
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !270
  %16 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg18182, i64 0, i64 %1, i64 0
  %17 = load <2 x double>, ptr addrspace(1) %16, align 32, !invariant.load !270
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %20 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 16
  %21 = load <2 x double>, ptr addrspace(1) %20, align 16, !invariant.load !270
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  %24 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 32
  %25 = load <2 x double>, ptr addrspace(1) %24, align 32, !invariant.load !270
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 48
  %29 = load <2 x double>, ptr addrspace(1) %28, align 16, !invariant.load !270
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 64
  %33 = load <2 x double>, ptr addrspace(1) %32, align 32, !invariant.load !270
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %36 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 80
  %37 = load <2 x double>, ptr addrspace(1) %36, align 16, !invariant.load !270
  %38 = extractelement <2 x double> %37, i32 0
  %39 = extractelement <2 x double> %37, i32 1
  %40 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 96
  %41 = load <2 x double>, ptr addrspace(1) %40, align 32, !invariant.load !270
  %42 = extractelement <2 x double> %41, i32 0
  %43 = extractelement <2 x double> %41, i32 1
  %44 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 112
  %45 = load <2 x double>, ptr addrspace(1) %44, align 16, !invariant.load !270
  %46 = extractelement <2 x double> %45, i32 0
  %47 = extractelement <2 x double> %45, i32 1
  %48 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 128
  %49 = load <2 x double>, ptr addrspace(1) %48, align 32, !invariant.load !270
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  %52 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 144
  %53 = load <2 x double>, ptr addrspace(1) %52, align 16, !invariant.load !270
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg17180, i64 0, i64 %1, i64 0
  %57 = load <2 x double>, ptr addrspace(1) %56, align 32, !invariant.load !270
  %58 = extractelement <2 x double> %57, i32 0
  %59 = extractelement <2 x double> %57, i32 1
  %60 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 16
  %61 = load <2 x double>, ptr addrspace(1) %60, align 16, !invariant.load !270
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 32
  %65 = load <2 x double>, ptr addrspace(1) %64, align 32, !invariant.load !270
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 1
  %68 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 48
  %69 = load <2 x double>, ptr addrspace(1) %68, align 16, !invariant.load !270
  %70 = extractelement <2 x double> %69, i32 0
  %71 = extractelement <2 x double> %69, i32 1
  %72 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 64
  %73 = load <2 x double>, ptr addrspace(1) %72, align 32, !invariant.load !270
  %74 = extractelement <2 x double> %73, i32 0
  %75 = extractelement <2 x double> %73, i32 1
  %76 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 80
  %77 = load <2 x double>, ptr addrspace(1) %76, align 16, !invariant.load !270
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %80 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 96
  %81 = load <2 x double>, ptr addrspace(1) %80, align 32, !invariant.load !270
  %82 = extractelement <2 x double> %81, i32 0
  %83 = extractelement <2 x double> %81, i32 1
  %84 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 112
  %85 = load <2 x double>, ptr addrspace(1) %84, align 16, !invariant.load !270
  %86 = extractelement <2 x double> %85, i32 0
  %87 = extractelement <2 x double> %85, i32 1
  %88 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 128
  %89 = load <2 x double>, ptr addrspace(1) %88, align 32, !invariant.load !270
  %90 = extractelement <2 x double> %89, i32 0
  %91 = extractelement <2 x double> %89, i32 1
  %92 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 144
  %93 = load <2 x double>, ptr addrspace(1) %92, align 16, !invariant.load !270
  %94 = extractelement <2 x double> %93, i32 0
  %95 = extractelement <2 x double> %93, i32 1
  %add.3969.i = fadd double %18, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %19
  %add.3969.i.2 = fadd double %add.3969.i.1, %22
  %add.3969.i.3 = fadd double %add.3969.i.2, %23
  %add.3969.i.4 = fadd double %add.3969.i.3, %26
  %add.3969.i.5 = fadd double %add.3969.i.4, %27
  %add.3969.i.6 = fadd double %add.3969.i.5, %30
  %add.3969.i.7 = fadd double %add.3969.i.6, %31
  %add.3969.i.8 = fadd double %add.3969.i.7, %34
  %add.3969.i.9 = fadd double %add.3969.i.8, %35
  %add.3969.i.10 = fadd double %add.3969.i.9, %38
  %add.3969.i.11 = fadd double %add.3969.i.10, %39
  %add.3969.i.12 = fadd double %add.3969.i.11, %42
  %add.3969.i.13 = fadd double %add.3969.i.12, %43
  %add.3969.i.14 = fadd double %add.3969.i.13, %46
  %add.3969.i.15 = fadd double %add.3969.i.14, %47
  %add.3969.i.16 = fadd double %add.3969.i.15, %50
  %add.3969.i.17 = fadd double %add.3969.i.16, %51
  %add.3969.i.18 = fadd double %add.3969.i.17, %54
  %add.3969.i.19 = fadd double %add.3969.i.18, %55
  %96 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg19184, i64 0, i64 %1, i64 0
  %97 = load <2 x double>, ptr addrspace(1) %96, align 32, !invariant.load !270
  %98 = extractelement <2 x double> %97, i32 0
  %99 = extractelement <2 x double> %97, i32 1
  %100 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 16
  %101 = load <2 x double>, ptr addrspace(1) %100, align 16, !invariant.load !270
  %102 = extractelement <2 x double> %101, i32 0
  %103 = extractelement <2 x double> %101, i32 1
  %104 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 32
  %105 = load <2 x double>, ptr addrspace(1) %104, align 32, !invariant.load !270
  %106 = extractelement <2 x double> %105, i32 0
  %107 = extractelement <2 x double> %105, i32 1
  %108 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 48
  %109 = load <2 x double>, ptr addrspace(1) %108, align 16, !invariant.load !270
  %110 = extractelement <2 x double> %109, i32 0
  %111 = extractelement <2 x double> %109, i32 1
  %112 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 64
  %113 = load <2 x double>, ptr addrspace(1) %112, align 32, !invariant.load !270
  %114 = extractelement <2 x double> %113, i32 0
  %115 = extractelement <2 x double> %113, i32 1
  %116 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 80
  %117 = load <2 x double>, ptr addrspace(1) %116, align 16, !invariant.load !270
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  %120 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 96
  %121 = load <2 x double>, ptr addrspace(1) %120, align 32, !invariant.load !270
  %122 = extractelement <2 x double> %121, i32 0
  %123 = extractelement <2 x double> %121, i32 1
  %124 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 112
  %125 = load <2 x double>, ptr addrspace(1) %124, align 16, !invariant.load !270
  %126 = extractelement <2 x double> %125, i32 0
  %127 = extractelement <2 x double> %125, i32 1
  %128 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 128
  %129 = load <2 x double>, ptr addrspace(1) %128, align 32, !invariant.load !270
  %130 = extractelement <2 x double> %129, i32 0
  %131 = extractelement <2 x double> %129, i32 1
  %132 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 144
  %133 = load <2 x double>, ptr addrspace(1) %132, align 16, !invariant.load !270
  %134 = extractelement <2 x double> %133, i32 0
  %135 = extractelement <2 x double> %133, i32 1
  %add.3969.i132 = fadd double %58, 0.000000e+00
  %add.3969.i132.1 = fadd double %add.3969.i132, %59
  %add.3969.i132.2 = fadd double %add.3969.i132.1, %62
  %add.3969.i132.3 = fadd double %add.3969.i132.2, %63
  %add.3969.i132.4 = fadd double %add.3969.i132.3, %66
  %add.3969.i132.5 = fadd double %add.3969.i132.4, %67
  %add.3969.i132.6 = fadd double %add.3969.i132.5, %70
  %add.3969.i132.7 = fadd double %add.3969.i132.6, %71
  %add.3969.i132.8 = fadd double %add.3969.i132.7, %74
  %add.3969.i132.9 = fadd double %add.3969.i132.8, %75
  %add.3969.i132.10 = fadd double %add.3969.i132.9, %78
  %add.3969.i132.11 = fadd double %add.3969.i132.10, %79
  %add.3969.i132.12 = fadd double %add.3969.i132.11, %82
  %add.3969.i132.13 = fadd double %add.3969.i132.12, %83
  %add.3969.i132.14 = fadd double %add.3969.i132.13, %86
  %add.3969.i132.15 = fadd double %add.3969.i132.14, %87
  %add.3969.i132.16 = fadd double %add.3969.i132.15, %90
  %add.3969.i132.17 = fadd double %add.3969.i132.16, %91
  %add.3969.i132.18 = fadd double %add.3969.i132.17, %94
  %add.3969.i132.19 = fadd double %add.3969.i132.18, %95
  %add.4181.1.clone.1 = fadd double %add.3969.i.19, %add.3969.i132.19
  %136 = getelementptr double, ptr addrspace(1) %arg16178, i64 %1
  %137 = load double, ptr addrspace(1) %136, align 8, !invariant.load !270
  %138 = getelementptr double, ptr addrspace(1) %arg15176, i64 %1
  %139 = load double, ptr addrspace(1) %138, align 8, !invariant.load !270
  %140 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg14174, i64 0, i64 %1, i64 0
  %141 = load <2 x double>, ptr addrspace(1) %140, align 32, !invariant.load !270
  %142 = extractelement <2 x double> %141, i32 0
  %143 = extractelement <2 x double> %141, i32 1
  %add.3969.i134 = fadd double %142, 0.000000e+00
  %add.3969.i134.1 = fadd double %add.3969.i134, %143
  %144 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 16
  %145 = load <2 x double>, ptr addrspace(1) %144, align 16, !invariant.load !270
  %146 = extractelement <2 x double> %145, i32 0
  %147 = extractelement <2 x double> %145, i32 1
  %add.3969.i134.2 = fadd double %add.3969.i134.1, %146
  %add.3969.i134.3 = fadd double %add.3969.i134.2, %147
  %148 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 32
  %149 = load <2 x double>, ptr addrspace(1) %148, align 32, !invariant.load !270
  %150 = extractelement <2 x double> %149, i32 0
  %151 = extractelement <2 x double> %149, i32 1
  %add.3969.i134.4 = fadd double %add.3969.i134.3, %150
  %add.3969.i134.5 = fadd double %add.3969.i134.4, %151
  %152 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 48
  %153 = load <2 x double>, ptr addrspace(1) %152, align 16, !invariant.load !270
  %154 = extractelement <2 x double> %153, i32 0
  %155 = extractelement <2 x double> %153, i32 1
  %add.3969.i134.6 = fadd double %add.3969.i134.5, %154
  %add.3969.i134.7 = fadd double %add.3969.i134.6, %155
  %156 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 64
  %157 = load <2 x double>, ptr addrspace(1) %156, align 32, !invariant.load !270
  %158 = extractelement <2 x double> %157, i32 0
  %159 = extractelement <2 x double> %157, i32 1
  %add.3969.i134.8 = fadd double %add.3969.i134.7, %158
  %add.3969.i134.9 = fadd double %add.3969.i134.8, %159
  %160 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 80
  %161 = load <2 x double>, ptr addrspace(1) %160, align 16, !invariant.load !270
  %162 = extractelement <2 x double> %161, i32 0
  %163 = extractelement <2 x double> %161, i32 1
  %add.3969.i134.10 = fadd double %add.3969.i134.9, %162
  %add.3969.i134.11 = fadd double %add.3969.i134.10, %163
  %164 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 96
  %165 = load <2 x double>, ptr addrspace(1) %164, align 32, !invariant.load !270
  %166 = extractelement <2 x double> %165, i32 0
  %167 = extractelement <2 x double> %165, i32 1
  %add.3969.i134.12 = fadd double %add.3969.i134.11, %166
  %add.3969.i134.13 = fadd double %add.3969.i134.12, %167
  %168 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 112
  %169 = load <2 x double>, ptr addrspace(1) %168, align 16, !invariant.load !270
  %170 = extractelement <2 x double> %169, i32 0
  %171 = extractelement <2 x double> %169, i32 1
  %add.3969.i134.14 = fadd double %add.3969.i134.13, %170
  %add.3969.i134.15 = fadd double %add.3969.i134.14, %171
  %172 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 128
  %173 = load <2 x double>, ptr addrspace(1) %172, align 32, !invariant.load !270
  %174 = extractelement <2 x double> %173, i32 0
  %175 = extractelement <2 x double> %173, i32 1
  %add.3969.i134.16 = fadd double %add.3969.i134.15, %174
  %add.3969.i134.17 = fadd double %add.3969.i134.16, %175
  %176 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 144
  %177 = load <2 x double>, ptr addrspace(1) %176, align 16, !invariant.load !270
  %178 = extractelement <2 x double> %177, i32 0
  %179 = extractelement <2 x double> %177, i32 1
  %add.3969.i134.18 = fadd double %add.3969.i134.17, %178
  %add.3969.i134.19 = fadd double %add.3969.i134.18, %179
  %add.3969.i133 = fadd double %98, 0.000000e+00
  %add.3969.i133.1 = fadd double %add.3969.i133, %99
  %add.3969.i133.2 = fadd double %add.3969.i133.1, %102
  %add.3969.i133.3 = fadd double %add.3969.i133.2, %103
  %add.3969.i133.4 = fadd double %add.3969.i133.3, %106
  %add.3969.i133.5 = fadd double %add.3969.i133.4, %107
  %add.3969.i133.6 = fadd double %add.3969.i133.5, %110
  %add.3969.i133.7 = fadd double %add.3969.i133.6, %111
  %add.3969.i133.8 = fadd double %add.3969.i133.7, %114
  %add.3969.i133.9 = fadd double %add.3969.i133.8, %115
  %add.3969.i133.10 = fadd double %add.3969.i133.9, %118
  %add.3969.i133.11 = fadd double %add.3969.i133.10, %119
  %add.3969.i133.12 = fadd double %add.3969.i133.11, %122
  %add.3969.i133.13 = fadd double %add.3969.i133.12, %123
  %add.3969.i133.14 = fadd double %add.3969.i133.13, %126
  %add.3969.i133.15 = fadd double %add.3969.i133.14, %127
  %add.3969.i133.16 = fadd double %add.3969.i133.15, %130
  %add.3969.i133.17 = fadd double %add.3969.i133.16, %131
  %add.3969.i133.18 = fadd double %add.3969.i133.17, %134
  %add.3969.i133.19 = fadd double %add.3969.i133.18, %135
  %add.4184.1.clone.1 = fadd double %add.4181.1.clone.1, %add.3969.i133.19
  %add.4189.1.clone.1 = fadd double %add.4184.1.clone.1, %137
  %add.4194.1.clone.1 = fadd double %add.4189.1.clone.1, %139
  %add.4199.1.clone.1 = fadd double %add.4194.1.clone.1, %add.3969.i134.19
  %180 = getelementptr double, ptr addrspace(1) %arg13172, i64 %1
  %181 = load double, ptr addrspace(1) %180, align 8, !invariant.load !270
  %add.4203.1.clone.1 = fadd double %add.4199.1.clone.1, %181
  %182 = getelementptr double, ptr addrspace(1) %arg6158, i64 %1
  %183 = load double, ptr addrspace(1) %182, align 8, !invariant.load !270
  %multiply.3059.9.clone.1 = fmul double %183, 5.000000e-01
  %add.4222.9.clone.1 = fsub double %multiply.3059.9.clone.1, %add.4203.1.clone.1
  %subtract.230.5.clone.1 = fsub double %15, %add.4222.9.clone.1
  %compare.1155.5.clone.1 = fcmp uno double %subtract.230.5.clone.1, 0.000000e+00
  %184 = select i1 %compare.1155.5.clone.1, double 0xFFF0000000000000, double %subtract.230.5.clone.1
  %185 = getelementptr double, ptr addrspace(1) %arg7160, i64 %1
  %186 = load double, ptr addrspace(1) %185, align 8
  %subtract.231.7.clone.1 = fsub double %184, %186
  %187 = fneg double %subtract.231.7.clone.1
  %188 = tail call double @llvm.fma.f64(double %187, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %189 = tail call i32 @llvm.nvvm.d2i.lo(double %188) #12
  %190 = tail call double @llvm.nvvm.add.rn.d(double %188, double 0xC338000000000000) #12
  %191 = tail call double @llvm.fma.f64(double %190, double 0xBFE62E42FEFA39EF, double %187)
  %192 = tail call double @llvm.fma.f64(double %190, double 0xBC7ABC9E3B39803F, double %191)
  %193 = tail call double @llvm.fma.f64(double %192, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %194 = tail call double @llvm.fma.f64(double %193, double %192, double 0x3EC71DEE62401315)
  %195 = tail call double @llvm.fma.f64(double %194, double %192, double 0x3EFA01997C89EB71)
  %196 = tail call double @llvm.fma.f64(double %195, double %192, double 0x3F2A01A014761F65)
  %197 = tail call double @llvm.fma.f64(double %196, double %192, double 0x3F56C16C1852B7AF)
  %198 = tail call double @llvm.fma.f64(double %197, double %192, double 0x3F81111111122322)
  %199 = tail call double @llvm.fma.f64(double %198, double %192, double 0x3FA55555555502A1)
  %200 = tail call double @llvm.fma.f64(double %199, double %192, double 0x3FC5555555555511)
  %201 = tail call double @llvm.fma.f64(double %200, double %192, double 0x3FE000000000000B)
  %202 = tail call double @llvm.fma.f64(double %201, double %192, double 1.000000e+00)
  %203 = tail call double @llvm.fma.f64(double %202, double %192, double 1.000000e+00)
  %204 = tail call i32 @llvm.nvvm.d2i.lo(double %203) #12
  %205 = tail call i32 @llvm.nvvm.d2i.hi(double %203) #12
  %206 = shl i32 %189, 20
  %207 = add i32 %205, %206
  %208 = tail call double @llvm.nvvm.lohi.i2d(i32 %204, i32 %207) #12
  %209 = tail call i32 @llvm.nvvm.d2i.hi(double %187) #12
  %210 = bitcast i32 %209 to float
  %211 = tail call float @llvm.nvvm.fabs.f(float %210) #12
  %212 = fcmp olt float %211, 0x4010C46560000000
  br i1 %212, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %213 = fcmp ogt double %subtract.231.7.clone.1, 0.000000e+00
  %214 = fsub double 0x7FF0000000000000, %subtract.231.7.clone.1
  %z.0.i = select i1 %213, double 0.000000e+00, double %214
  %215 = fcmp olt float %211, 0x4010E90000000000
  br i1 %215, label %216, label %__nv_exp.exit

216:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %217 = sdiv i32 %189, 2
  %218 = shl i32 %217, 20
  %219 = add i32 %205, %218
  %220 = tail call double @llvm.nvvm.lohi.i2d(i32 %204, i32 %219) #12
  %221 = sub nsw i32 %189, %217
  %222 = shl i32 %221, 20
  %223 = add nsw i32 %222, 1072693248
  %224 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %223) #12
  %225 = fmul double %224, %220
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %216
  %z.2.i = phi double [ %208, %entry ], [ %225, %216 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %226 = getelementptr double, ptr addrspace(1) %arg0146, i64 %1
  %227 = load double, ptr addrspace(1) %226, align 8
  %228 = getelementptr double, ptr addrspace(1) %arg5156, i64 %1
  %229 = load double, ptr addrspace(1) %228, align 8
  %subtract.232.1.clone.1 = fsub double %186, %184
  %230 = tail call double @llvm.fabs.f64(double %subtract.232.1.clone.1)
  %231 = fneg double %230
  %232 = tail call double @llvm.fma.f64(double %231, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %233 = tail call i32 @llvm.nvvm.d2i.lo(double %232) #12
  %234 = tail call double @llvm.nvvm.add.rn.d(double %232, double 0xC338000000000000) #12
  %235 = tail call double @llvm.fma.f64(double %234, double 0xBFE62E42FEFA39EF, double %231)
  %236 = tail call double @llvm.fma.f64(double %234, double 0xBC7ABC9E3B39803F, double %235)
  %237 = tail call double @llvm.fma.f64(double %236, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %238 = tail call double @llvm.fma.f64(double %237, double %236, double 0x3EC71DEE62401315)
  %239 = tail call double @llvm.fma.f64(double %238, double %236, double 0x3EFA01997C89EB71)
  %240 = tail call double @llvm.fma.f64(double %239, double %236, double 0x3F2A01A014761F65)
  %241 = tail call double @llvm.fma.f64(double %240, double %236, double 0x3F56C16C1852B7AF)
  %242 = tail call double @llvm.fma.f64(double %241, double %236, double 0x3F81111111122322)
  %243 = tail call double @llvm.fma.f64(double %242, double %236, double 0x3FA55555555502A1)
  %244 = tail call double @llvm.fma.f64(double %243, double %236, double 0x3FC5555555555511)
  %245 = tail call double @llvm.fma.f64(double %244, double %236, double 0x3FE000000000000B)
  %246 = tail call double @llvm.fma.f64(double %245, double %236, double 1.000000e+00)
  %247 = tail call double @llvm.fma.f64(double %246, double %236, double 1.000000e+00)
  %248 = tail call i32 @llvm.nvvm.d2i.lo(double %247) #12
  %249 = tail call i32 @llvm.nvvm.d2i.hi(double %247) #12
  %250 = shl i32 %233, 20
  %251 = add i32 %249, %250
  %252 = tail call double @llvm.nvvm.lohi.i2d(i32 %248, i32 %251) #12
  %253 = tail call i32 @llvm.nvvm.d2i.hi(double %231) #12
  %254 = bitcast i32 %253 to float
  %255 = tail call float @llvm.nvvm.fabs.f(float %254) #12
  %256 = fcmp olt float %255, 0x4010C46560000000
  br i1 %256, label %__nv_exp.exit127, label %__internal_fast_icmp_abs_lt.exit.i124

__internal_fast_icmp_abs_lt.exit.i124:            ; preds = %__nv_exp.exit
  %257 = fcmp one double %subtract.232.1.clone.1, 0.000000e+00
  %258 = fsub double 0x7FF0000000000000, %230
  %z.0.i125 = select i1 %257, double 0.000000e+00, double %258
  %259 = fcmp olt float %255, 0x4010E90000000000
  br i1 %259, label %260, label %__nv_exp.exit127

260:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i124
  %261 = sdiv i32 %233, 2
  %262 = shl i32 %261, 20
  %263 = add i32 %249, %262
  %264 = tail call double @llvm.nvvm.lohi.i2d(i32 %248, i32 %263) #12
  %265 = sub nsw i32 %233, %261
  %266 = shl i32 %265, 20
  %267 = add nsw i32 %266, 1072693248
  %268 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %267) #12
  %269 = fmul double %268, %264
  br label %__nv_exp.exit127

__nv_exp.exit127:                                 ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i124, %260
  %z.2.i126 = phi double [ %252, %__nv_exp.exit ], [ %269, %260 ], [ %z.0.i125, %__internal_fast_icmp_abs_lt.exit.i124 ]
  %270 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i126) #12
  %271 = bitcast i32 %270 to float
  %272 = fcmp olt float %271, 0x3FFCAAAAA0000000
  %273 = fcmp ogt float %271, 0xBFFB333320000000
  %or.cond.i = and i1 %272, %273
  br i1 %or.cond.i, label %274, label %291

274:                                              ; preds = %__nv_exp.exit127
  %275 = fadd double %z.2.i126, 2.000000e+00
  %276 = fdiv double %z.2.i126, %275
  %277 = fneg double %z.2.i126
  %278 = fmul double %276, %277
  %279 = fadd double %z.2.i126, %278
  %280 = fmul double %279, %279
  %281 = tail call double @llvm.fma.f64(double %280, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %282 = tail call double @llvm.fma.f64(double %281, double %280, double 0x3EF3B9FF890F468C)
  %283 = tail call double @llvm.fma.f64(double %282, double %280, double 0x3F17457EFD51BAF8)
  %284 = tail call double @llvm.fma.f64(double %283, double %280, double 0x3F3C71C8DE3CE825)
  %285 = tail call double @llvm.fma.f64(double %284, double %280, double 0x3F6249248FA4661F)
  %286 = tail call double @llvm.fma.f64(double %285, double %280, double 0x3F899999999D70C4)
  %287 = tail call double @llvm.fma.f64(double %286, double %280, double 0x3FB5555555555462)
  %288 = fmul double %280, %287
  %289 = tail call double @llvm.fma.f64(double %288, double %279, double %278)
  %290 = fadd double %z.2.i126, %289
  br label %__nv_log1p.exit

291:                                              ; preds = %__nv_exp.exit127
  %292 = fadd double %z.2.i126, 1.000000e+00
  %293 = tail call i32 @llvm.nvvm.d2i.hi(double %292) #12
  %294 = tail call i32 @llvm.nvvm.d2i.lo(double %292) #12
  %295 = icmp slt i32 %293, 1048576
  %296 = fmul double %292, 0x4350000000000000
  %297 = tail call i32 @llvm.nvvm.d2i.lo(double %296) #12
  %298 = tail call i32 @llvm.nvvm.d2i.hi(double %296) #12
  br i1 %295, label %299, label %300

299:                                              ; preds = %291
  br label %300

300:                                              ; preds = %299, %291
  %.0.i = phi double [ %296, %299 ], [ %292, %291 ]
  %ihi.i.0.i = phi i32 [ %298, %299 ], [ %293, %291 ]
  %ilo.i.0.i = phi i32 [ %297, %299 ], [ %294, %291 ]
  %e.i.0.i = phi i32 [ -1077, %299 ], [ -1023, %291 ]
  %301 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %301, 2146435071
  br i1 %or.cond2.i, label %302, label %349

302:                                              ; preds = %300
  %303 = lshr i32 %ihi.i.0.i, 20
  %304 = add nsw i32 %e.i.0.i, %303
  %305 = and i32 %ihi.i.0.i, 1048575
  %306 = or disjoint i32 %305, 1072693248
  %307 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %306) #12
  %308 = icmp ugt i32 %306, 1073127582
  %309 = tail call i32 @llvm.nvvm.d2i.lo(double %307) #12
  %310 = tail call i32 @llvm.nvvm.d2i.hi(double %307) #12
  %311 = add i32 %310, -1048576
  %312 = tail call double @llvm.nvvm.lohi.i2d(i32 %309, i32 %311) #12
  %spec.select = select i1 %308, double %312, double %307
  %313 = zext i1 %308 to i32
  %spec.select135 = add nsw i32 %304, %313
  %314 = fadd double %spec.select, -1.000000e+00
  %315 = fadd double %spec.select, 1.000000e+00
  %316 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %315) #12
  %317 = fneg double %315
  %318 = tail call double @llvm.fma.f64(double %317, double %316, double 1.000000e+00)
  %319 = tail call double @llvm.fma.f64(double %318, double %318, double %318)
  %320 = tail call double @llvm.fma.f64(double %319, double %316, double %316)
  %321 = fmul double %314, %320
  %322 = fadd double %321, %321
  %323 = fmul double %322, %322
  %324 = tail call double @llvm.fma.f64(double %323, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %325 = tail call double @llvm.fma.f64(double %324, double %323, double 0x3EF3B2669F02676F)
  %326 = tail call double @llvm.fma.f64(double %325, double %323, double 0x3F1745CBA9AB0956)
  %327 = tail call double @llvm.fma.f64(double %326, double %323, double 0x3F3C71C72D1B5154)
  %328 = tail call double @llvm.fma.f64(double %327, double %323, double 0x3F624924923BE72D)
  %329 = tail call double @llvm.fma.f64(double %328, double %323, double 0x3F8999999999A3C4)
  %330 = tail call double @llvm.fma.f64(double %329, double %323, double 0x3FB5555555555554)
  %331 = fsub double %314, %322
  %332 = fmul double %331, 2.000000e+00
  %333 = fneg double %322
  %334 = tail call double @llvm.fma.f64(double %333, double %314, double %332)
  %335 = fmul double %320, %334
  %336 = fmul double %323, %330
  %337 = tail call double @llvm.fma.f64(double %336, double %322, double %335)
  %338 = xor i32 %spec.select135, -2147483648
  %339 = tail call double @llvm.nvvm.lohi.i2d(i32 %338, i32 1127219200) #12
  %340 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %341 = fsub double %339, %340
  %342 = tail call double @llvm.fma.f64(double %341, double 0x3FE62E42FEFA39EF, double %322)
  %343 = fneg double %341
  %344 = tail call double @llvm.fma.f64(double %343, double 0x3FE62E42FEFA39EF, double %342)
  %345 = fsub double %344, %322
  %346 = fsub double %337, %345
  %347 = tail call double @llvm.fma.f64(double %341, double 0x3C7ABC9E3B39803F, double %346)
  %348 = fadd double %342, %347
  br label %__nv_log1p.exit

349:                                              ; preds = %300
  %350 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %351 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %352 = and i32 %351, 2147483647
  %353 = icmp eq i32 %352, 0
  %q.i.0.i = select i1 %353, double 0xFFF0000000000000, double %350
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %274, %302, %349
  %t.0.i = phi double [ %290, %274 ], [ %348, %302 ], [ %q.i.0.i, %349 ]
  %354 = getelementptr double, ptr addrspace(1) %arg10166, i64 %1
  %355 = load double, ptr addrspace(1) %354, align 8
  %356 = getelementptr double, ptr addrspace(1) %arg11168, i64 %1
  %357 = load double, ptr addrspace(1) %356, align 8
  %358 = getelementptr double, ptr addrspace(1) %arg12170, i64 %1
  %359 = load double, ptr addrspace(1) %358, align 8
  %360 = fcmp ole double %184, 0.000000e+00
  %minimum.8.3.clone.1 = select i1 %360, double %184, double 0.000000e+00
  %subtract.233.1.clone.1 = fsub double %359, %minimum.8.3.clone.1
  %361 = tail call double @llvm.fabs.f64(double %subtract.233.1.clone.1)
  %362 = fneg double %361
  %363 = tail call double @llvm.fma.f64(double %362, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %364 = tail call i32 @llvm.nvvm.d2i.lo(double %363) #12
  %365 = tail call double @llvm.nvvm.add.rn.d(double %363, double 0xC338000000000000) #12
  %366 = tail call double @llvm.fma.f64(double %365, double 0xBFE62E42FEFA39EF, double %362)
  %367 = tail call double @llvm.fma.f64(double %365, double 0xBC7ABC9E3B39803F, double %366)
  %368 = tail call double @llvm.fma.f64(double %367, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %369 = tail call double @llvm.fma.f64(double %368, double %367, double 0x3EC71DEE62401315)
  %370 = tail call double @llvm.fma.f64(double %369, double %367, double 0x3EFA01997C89EB71)
  %371 = tail call double @llvm.fma.f64(double %370, double %367, double 0x3F2A01A014761F65)
  %372 = tail call double @llvm.fma.f64(double %371, double %367, double 0x3F56C16C1852B7AF)
  %373 = tail call double @llvm.fma.f64(double %372, double %367, double 0x3F81111111122322)
  %374 = tail call double @llvm.fma.f64(double %373, double %367, double 0x3FA55555555502A1)
  %375 = tail call double @llvm.fma.f64(double %374, double %367, double 0x3FC5555555555511)
  %376 = tail call double @llvm.fma.f64(double %375, double %367, double 0x3FE000000000000B)
  %377 = tail call double @llvm.fma.f64(double %376, double %367, double 1.000000e+00)
  %378 = tail call double @llvm.fma.f64(double %377, double %367, double 1.000000e+00)
  %379 = tail call i32 @llvm.nvvm.d2i.lo(double %378) #12
  %380 = tail call i32 @llvm.nvvm.d2i.hi(double %378) #12
  %381 = shl i32 %364, 20
  %382 = add i32 %380, %381
  %383 = tail call double @llvm.nvvm.lohi.i2d(i32 %379, i32 %382) #12
  %384 = tail call i32 @llvm.nvvm.d2i.hi(double %362) #12
  %385 = bitcast i32 %384 to float
  %386 = tail call float @llvm.nvvm.fabs.f(float %385) #12
  %387 = fcmp olt float %386, 0x4010C46560000000
  br i1 %387, label %__nv_exp.exit131, label %__internal_fast_icmp_abs_lt.exit.i128

__internal_fast_icmp_abs_lt.exit.i128:            ; preds = %__nv_log1p.exit
  %388 = fcmp one double %subtract.233.1.clone.1, 0.000000e+00
  %389 = fsub double 0x7FF0000000000000, %361
  %z.0.i129 = select i1 %388, double 0.000000e+00, double %389
  %390 = fcmp olt float %386, 0x4010E90000000000
  br i1 %390, label %391, label %__nv_exp.exit131

391:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i128
  %392 = sdiv i32 %364, 2
  %393 = shl i32 %392, 20
  %394 = add i32 %380, %393
  %395 = tail call double @llvm.nvvm.lohi.i2d(i32 %379, i32 %394) #12
  %396 = sub nsw i32 %364, %392
  %397 = shl i32 %396, 20
  %398 = add nsw i32 %397, 1072693248
  %399 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %398) #12
  %400 = fmul double %399, %395
  br label %__nv_exp.exit131

__nv_exp.exit131:                                 ; preds = %__nv_log1p.exit, %__internal_fast_icmp_abs_lt.exit.i128, %391
  %z.2.i130 = phi double [ %383, %__nv_log1p.exit ], [ %400, %391 ], [ %z.0.i129, %__internal_fast_icmp_abs_lt.exit.i128 ]
  %401 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i130) #12
  %402 = bitcast i32 %401 to float
  %403 = fcmp olt float %402, 0x3FFCAAAAA0000000
  %404 = fcmp ogt float %402, 0xBFFB333320000000
  %or.cond.i113 = and i1 %403, %404
  br i1 %or.cond.i113, label %405, label %422

405:                                              ; preds = %__nv_exp.exit131
  %406 = fadd double %z.2.i130, 2.000000e+00
  %407 = fdiv double %z.2.i130, %406
  %408 = fneg double %z.2.i130
  %409 = fmul double %407, %408
  %410 = fadd double %z.2.i130, %409
  %411 = fmul double %410, %410
  %412 = tail call double @llvm.fma.f64(double %411, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %413 = tail call double @llvm.fma.f64(double %412, double %411, double 0x3EF3B9FF890F468C)
  %414 = tail call double @llvm.fma.f64(double %413, double %411, double 0x3F17457EFD51BAF8)
  %415 = tail call double @llvm.fma.f64(double %414, double %411, double 0x3F3C71C8DE3CE825)
  %416 = tail call double @llvm.fma.f64(double %415, double %411, double 0x3F6249248FA4661F)
  %417 = tail call double @llvm.fma.f64(double %416, double %411, double 0x3F899999999D70C4)
  %418 = tail call double @llvm.fma.f64(double %417, double %411, double 0x3FB5555555555462)
  %419 = fmul double %411, %418
  %420 = tail call double @llvm.fma.f64(double %419, double %410, double %409)
  %421 = fadd double %z.2.i130, %420
  br label %__nv_log1p.exit123

422:                                              ; preds = %__nv_exp.exit131
  %423 = fadd double %z.2.i130, 1.000000e+00
  %424 = tail call i32 @llvm.nvvm.d2i.hi(double %423) #12
  %425 = tail call i32 @llvm.nvvm.d2i.lo(double %423) #12
  %426 = icmp slt i32 %424, 1048576
  %427 = fmul double %423, 0x4350000000000000
  %428 = tail call i32 @llvm.nvvm.d2i.lo(double %427) #12
  %429 = tail call i32 @llvm.nvvm.d2i.hi(double %427) #12
  br i1 %426, label %430, label %431

430:                                              ; preds = %422
  br label %431

431:                                              ; preds = %430, %422
  %.0.i114 = phi double [ %427, %430 ], [ %423, %422 ]
  %ihi.i.0.i115 = phi i32 [ %429, %430 ], [ %424, %422 ]
  %ilo.i.0.i116 = phi i32 [ %428, %430 ], [ %425, %422 ]
  %e.i.0.i117 = phi i32 [ -1077, %430 ], [ -1023, %422 ]
  %432 = add i32 %ihi.i.0.i115, -1
  %or.cond2.i118 = icmp ult i32 %432, 2146435071
  br i1 %or.cond2.i118, label %433, label %480

433:                                              ; preds = %431
  %434 = lshr i32 %ihi.i.0.i115, 20
  %435 = add nsw i32 %e.i.0.i117, %434
  %436 = and i32 %ihi.i.0.i115, 1048575
  %437 = or disjoint i32 %436, 1072693248
  %438 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i116, i32 %437) #12
  %439 = icmp ugt i32 %437, 1073127582
  %440 = tail call i32 @llvm.nvvm.d2i.lo(double %438) #12
  %441 = tail call i32 @llvm.nvvm.d2i.hi(double %438) #12
  %442 = add i32 %441, -1048576
  %443 = tail call double @llvm.nvvm.lohi.i2d(i32 %440, i32 %442) #12
  %spec.select136 = select i1 %439, double %443, double %438
  %444 = zext i1 %439 to i32
  %spec.select137 = add nsw i32 %435, %444
  %445 = fadd double %spec.select136, -1.000000e+00
  %446 = fadd double %spec.select136, 1.000000e+00
  %447 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %446) #12
  %448 = fneg double %446
  %449 = tail call double @llvm.fma.f64(double %448, double %447, double 1.000000e+00)
  %450 = tail call double @llvm.fma.f64(double %449, double %449, double %449)
  %451 = tail call double @llvm.fma.f64(double %450, double %447, double %447)
  %452 = fmul double %445, %451
  %453 = fadd double %452, %452
  %454 = fmul double %453, %453
  %455 = tail call double @llvm.fma.f64(double %454, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %456 = tail call double @llvm.fma.f64(double %455, double %454, double 0x3EF3B2669F02676F)
  %457 = tail call double @llvm.fma.f64(double %456, double %454, double 0x3F1745CBA9AB0956)
  %458 = tail call double @llvm.fma.f64(double %457, double %454, double 0x3F3C71C72D1B5154)
  %459 = tail call double @llvm.fma.f64(double %458, double %454, double 0x3F624924923BE72D)
  %460 = tail call double @llvm.fma.f64(double %459, double %454, double 0x3F8999999999A3C4)
  %461 = tail call double @llvm.fma.f64(double %460, double %454, double 0x3FB5555555555554)
  %462 = fsub double %445, %453
  %463 = fmul double %462, 2.000000e+00
  %464 = fneg double %453
  %465 = tail call double @llvm.fma.f64(double %464, double %445, double %463)
  %466 = fmul double %451, %465
  %467 = fmul double %454, %461
  %468 = tail call double @llvm.fma.f64(double %467, double %453, double %466)
  %469 = xor i32 %spec.select137, -2147483648
  %470 = tail call double @llvm.nvvm.lohi.i2d(i32 %469, i32 1127219200) #12
  %471 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %472 = fsub double %470, %471
  %473 = tail call double @llvm.fma.f64(double %472, double 0x3FE62E42FEFA39EF, double %453)
  %474 = fneg double %472
  %475 = tail call double @llvm.fma.f64(double %474, double 0x3FE62E42FEFA39EF, double %473)
  %476 = fsub double %475, %453
  %477 = fsub double %468, %476
  %478 = tail call double @llvm.fma.f64(double %472, double 0x3C7ABC9E3B39803F, double %477)
  %479 = fadd double %473, %478
  br label %__nv_log1p.exit123

480:                                              ; preds = %431
  %481 = tail call double @llvm.fma.f64(double %.0.i114, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %482 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i114) #12
  %483 = and i32 %482, 2147483647
  %484 = icmp eq i32 %483, 0
  %q.i.0.i119 = select i1 %484, double 0xFFF0000000000000, double %481
  br label %__nv_log1p.exit123

__nv_log1p.exit123:                               ; preds = %405, %433, %480
  %t.0.i120 = phi double [ %421, %405 ], [ %479, %433 ], [ %q.i.0.i119, %480 ]
  %485 = fcmp uno double %359, 0.000000e+00
  %486 = fcmp oge double %359, %minimum.8.3.clone.1
  %487 = or i1 %485, %486
  %maximum.44.1.clone.1 = select i1 %487, double %359, double %minimum.8.3.clone.1
  %add.4227.3.clone.1 = fadd double %minimum.8.3.clone.1, %359
  %compare.1159.1.clone.1 = fcmp uno double %subtract.233.1.clone.1, 0.000000e+00
  %488 = icmp sge i64 %3, %5
  %489 = or i8 %9, %7
  %490 = trunc i8 %489 to i1
  %.not112 = or i1 %488, %490
  %compare.1166.3.clone.1 = fcmp olt double %184, -1.000000e+03
  %491 = zext i1 %compare.1166.3.clone.1 to i8
  %492 = select i1 %.not112, i8 %9, i8 %491
  %493 = select i1 %.not112, double %357, double %add.4203.1.clone.1
  %494 = icmp eq i64 %3, 0
  %495 = select i1 %494, double %add.4203.1.clone.1, double %355
  %496 = select i1 %.not112, double %355, double %495
  %compare.1158.1.clone.1 = fcmp uno double %subtract.232.1.clone.1, 0.000000e+00
  %add.4224.3.clone.1 = fadd double %186, %184
  %497 = fcmp uno double %186, 0.000000e+00
  %498 = fcmp oge double %186, %184
  %499 = or i1 %497, %498
  %maximum.43.1.clone.1 = select i1 %499, double %186, double %184
  %add.4226.5.clone.1 = fadd double %maximum.43.1.clone.1, %t.0.i
  %500 = select i1 %compare.1158.1.clone.1, double %add.4224.3.clone.1, double %add.4226.5.clone.1
  %501 = select i1 %494, double %184, double %500
  %502 = select i1 %.not112, double %186, double %501
  %503 = trunc i64 %3 to i32
  %504 = add i32 %13, %503
  %505 = add i32 %504, %12
  %506 = tail call i32 @llvm.fshl.i32(i32 %504, i32 %504, i32 13)
  %507 = xor i32 %505, %506
  %508 = add i32 %507, %505
  %509 = tail call i32 @llvm.fshl.i32(i32 %507, i32 %507, i32 15)
  %510 = xor i32 %508, %509
  %511 = add i32 %510, %508
  %512 = tail call i32 @llvm.fshl.i32(i32 %510, i32 %510, i32 26)
  %513 = xor i32 %511, %512
  %514 = add i32 %513, %511
  %515 = add i32 %514, %13
  %516 = tail call i32 @llvm.fshl.i32(i32 %513, i32 %513, i32 6)
  %517 = xor i32 %514, %516
  %518 = xor i32 %12, %13
  %519 = xor i32 %518, 466688986
  %520 = add i32 %519, 1
  %521 = add i32 %520, %517
  %522 = add i32 %515, %521
  %523 = tail call i32 @llvm.fshl.i32(i32 %521, i32 %521, i32 17)
  %524 = xor i32 %522, %523
  %525 = add i32 %524, %522
  %526 = tail call i32 @llvm.fshl.i32(i32 %524, i32 %524, i32 29)
  %527 = xor i32 %525, %526
  %528 = add i32 %527, %525
  %529 = tail call i32 @llvm.fshl.i32(i32 %527, i32 %527, i32 16)
  %530 = xor i32 %528, %529
  %531 = add i32 %530, %528
  %532 = add i32 %531, %519
  %533 = tail call i32 @llvm.fshl.i32(i32 %530, i32 %530, i32 24)
  %534 = xor i32 %531, %533
  %535 = add i32 %12, 2
  %536 = add i32 %535, %534
  %537 = add i32 %532, %536
  %538 = tail call i32 @llvm.fshl.i32(i32 %536, i32 %536, i32 13)
  %539 = xor i32 %537, %538
  %540 = add i32 %539, %537
  %541 = tail call i32 @llvm.fshl.i32(i32 %539, i32 %539, i32 15)
  %542 = xor i32 %540, %541
  %543 = add i32 %542, %540
  %544 = tail call i32 @llvm.fshl.i32(i32 %542, i32 %542, i32 26)
  %545 = xor i32 %543, %544
  %546 = add i32 %545, %543
  %547 = add i32 %546, %12
  %548 = tail call i32 @llvm.fshl.i32(i32 %545, i32 %545, i32 6)
  %549 = xor i32 %546, %548
  %550 = add i32 %13, 3
  %551 = add i32 %550, %549
  %552 = add i32 %547, %551
  %553 = tail call i32 @llvm.fshl.i32(i32 %551, i32 %551, i32 17)
  %554 = xor i32 %552, %553
  %555 = add i32 %554, %552
  %556 = tail call i32 @llvm.fshl.i32(i32 %554, i32 %554, i32 29)
  %557 = xor i32 %555, %556
  %558 = add i32 %557, %555
  %559 = tail call i32 @llvm.fshl.i32(i32 %557, i32 %557, i32 16)
  %560 = xor i32 %558, %559
  %561 = add i32 %560, %558
  %562 = add i32 %561, %13
  %563 = tail call i32 @llvm.fshl.i32(i32 %560, i32 %560, i32 24)
  %564 = xor i32 %561, %563
  %565 = add i32 %519, 4
  %566 = add i32 %565, %564
  %567 = add i32 %562, %566
  %568 = tail call i32 @llvm.fshl.i32(i32 %566, i32 %566, i32 13)
  %569 = xor i32 %567, %568
  %570 = add i32 %569, %567
  %571 = tail call i32 @llvm.fshl.i32(i32 %569, i32 %569, i32 15)
  %572 = xor i32 %570, %571
  %573 = add i32 %572, %570
  %574 = tail call i32 @llvm.fshl.i32(i32 %572, i32 %572, i32 26)
  %575 = xor i32 %573, %574
  %576 = add i32 %575, %573
  %577 = add i32 %576, %519
  %578 = tail call i32 @llvm.fshl.i32(i32 %575, i32 %575, i32 6)
  %579 = xor i32 %576, %578
  %580 = add i32 %579, %12
  %581 = add i32 %580, 6
  %582 = add i32 %581, %577
  %583 = tail call i32 @llvm.fshl.i32(i32 %581, i32 %581, i32 13)
  %584 = xor i32 %582, %583
  %585 = add i32 %584, %582
  %586 = tail call i32 @llvm.fshl.i32(i32 %584, i32 %584, i32 15)
  %587 = xor i32 %585, %586
  %588 = add i32 %587, %585
  %589 = tail call i32 @llvm.fshl.i32(i32 %587, i32 %587, i32 26)
  %590 = xor i32 %588, %589
  %591 = add i32 %590, %588
  %592 = add i32 %580, 5
  %593 = add i32 %591, %592
  %594 = tail call i32 @llvm.fshl.i32(i32 %590, i32 %590, i32 6)
  %595 = xor i32 %591, %594
  %596 = xor i32 %577, %592
  %597 = xor i32 %596, 466688986
  %598 = add i32 %597, 1
  %599 = add i32 %598, %595
  %600 = add i32 %593, %599
  %601 = tail call i32 @llvm.fshl.i32(i32 %599, i32 %599, i32 17)
  %602 = xor i32 %600, %601
  %603 = add i32 %602, %600
  %604 = tail call i32 @llvm.fshl.i32(i32 %602, i32 %602, i32 29)
  %605 = xor i32 %603, %604
  %606 = add i32 %605, %603
  %607 = tail call i32 @llvm.fshl.i32(i32 %605, i32 %605, i32 16)
  %608 = xor i32 %606, %607
  %609 = add i32 %608, %606
  %610 = add i32 %609, %597
  %611 = tail call i32 @llvm.fshl.i32(i32 %608, i32 %608, i32 24)
  %612 = xor i32 %609, %611
  %613 = add i32 %577, 2
  %614 = add i32 %613, %612
  %615 = add i32 %610, %614
  %616 = tail call i32 @llvm.fshl.i32(i32 %614, i32 %614, i32 13)
  %617 = xor i32 %615, %616
  %618 = add i32 %617, %615
  %619 = tail call i32 @llvm.fshl.i32(i32 %617, i32 %617, i32 15)
  %620 = xor i32 %618, %619
  %621 = add i32 %620, %618
  %622 = tail call i32 @llvm.fshl.i32(i32 %620, i32 %620, i32 26)
  %623 = xor i32 %621, %622
  %624 = add i32 %623, %621
  %625 = add i32 %624, %577
  %626 = tail call i32 @llvm.fshl.i32(i32 %623, i32 %623, i32 6)
  %627 = xor i32 %624, %626
  %628 = add i32 %580, 8
  %629 = add i32 %628, %627
  %630 = add i32 %625, %629
  %631 = tail call i32 @llvm.fshl.i32(i32 %629, i32 %629, i32 17)
  %632 = xor i32 %630, %631
  %633 = add i32 %632, %630
  %634 = tail call i32 @llvm.fshl.i32(i32 %632, i32 %632, i32 29)
  %635 = xor i32 %633, %634
  %636 = add i32 %635, %633
  %637 = tail call i32 @llvm.fshl.i32(i32 %635, i32 %635, i32 16)
  %638 = xor i32 %636, %637
  %639 = add i32 %638, %636
  %640 = add i32 %639, %592
  %641 = tail call i32 @llvm.fshl.i32(i32 %638, i32 %638, i32 24)
  %642 = xor i32 %639, %641
  %643 = add i32 %597, 4
  %644 = add i32 %643, %642
  %645 = add i32 %640, %644
  %646 = tail call i32 @llvm.fshl.i32(i32 %644, i32 %644, i32 13)
  %647 = xor i32 %645, %646
  %648 = add i32 %647, %645
  %649 = tail call i32 @llvm.fshl.i32(i32 %647, i32 %647, i32 15)
  %650 = xor i32 %648, %649
  %651 = add i32 %650, %648
  %652 = tail call i32 @llvm.fshl.i32(i32 %650, i32 %650, i32 26)
  %653 = xor i32 %651, %652
  %654 = add i32 %653, %651
  %655 = add i32 %654, %597
  %656 = zext i32 %655 to i64
  %657 = shl nuw i64 %656, 32
  %658 = tail call i32 @llvm.fshl.i32(i32 %653, i32 %653, i32 6)
  %659 = xor i32 %654, %658
  %660 = add i32 %577, 5
  %661 = add i32 %660, %659
  %662 = zext i32 %661 to i64
  %663 = or disjoint i64 %657, %662
  %664 = lshr i64 %663, 12
  %665 = or disjoint i64 %664, 4607182418800017408
  %666 = bitcast i64 %665 to double
  %add.4163.7.clone.1 = fadd double %666, -1.000000e+00
  %667 = fcmp ole double %add.4163.7.clone.1, 0.000000e+00
  %maximum.41.7.clone.1 = select i1 %667, double 0.000000e+00, double %add.4163.7.clone.1
  %add.4223.9.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.621.7.clone.1 = fdiv double 1.000000e+00, %add.4223.9.clone.1
  %compare.1156.5.clone.1 = fcmp uge double %maximum.41.7.clone.1, %divide.621.7.clone.1
  %668 = select i1 %compare.1156.5.clone.1, double %229, double %add.4222.9.clone.1
  %669 = select i1 %494, double %add.4222.9.clone.1, double %668
  %670 = select i1 %.not112, double %229, double %669
  %671 = select i1 %compare.1156.5.clone.1, double %227, double %add.4203.1.clone.1
  %672 = select i1 %494, double %add.4203.1.clone.1, double %671
  %673 = select i1 %.not112, double %227, double %672
  %674 = zext i1 %compare.1156.5.clone.1 to i8
  %add.4228.5.clone.1 = fadd double %maximum.44.1.clone.1, %t.0.i120
  %675 = select i1 %compare.1159.1.clone.1, double %add.4227.3.clone.1, double %add.4228.5.clone.1
  %676 = select i1 %494, double %minimum.8.3.clone.1, double %675
  %677 = select i1 %.not112, double %359, double %676
  %678 = ashr i64 %3, 1
  %679 = tail call i64 @llvm.abs.i64(i64 %678, i1 true)
  %680 = tail call range(i64 0, 64) i64 @llvm.ctpop.i64(i64 %679)
  %681 = trunc nuw nsw i64 %680 to i32
  %682 = getelementptr i32, ptr addrspace(1) %arg20186, i64 %1
  %683 = load i32, ptr addrspace(1) %682, align 4
  %684 = select i1 %.not112, i32 %683, i32 %681
  %685 = xor i64 %3, -1
  %686 = add i64 %3, 1
  %687 = and i64 %686, %685
  %688 = add i64 %687, -1
  %689 = sub i64 1, %687
  %690 = icmp slt i64 %688, 0
  %691 = select i1 %690, i64 %689, i64 %688
  %692 = tail call range(i64 0, 65) i64 @llvm.ctpop.i64(i64 %691)
  %693 = trunc nuw nsw i64 %692 to i32
  %694 = sub nsw i32 %681, %693
  %695 = add nsw i32 %694, 1
  %696 = getelementptr i32, ptr addrspace(1) %arg21188, i64 %1
  %697 = load i32, ptr addrspace(1) %696, align 4
  %698 = select i1 %.not112, i32 %697, i32 %695
  %699 = select i1 %.not112, i64 %3, i64 %686
  %700 = getelementptr i64, ptr addrspace(1) %arg22190, i64 %1
  %701 = load i64, ptr addrspace(1) %700, align 8
  %702 = add i64 %701, 1
  %703 = select i1 %494, i64 1, i64 %702
  %704 = select i1 %.not112, i64 %701, i64 %703
  store double %673, ptr addrspace(1) %226, align 8
  store double %670, ptr addrspace(1) %228, align 8
  %705 = getelementptr i8, ptr addrspace(1) %arg23192, i64 %1
  store i8 %674, ptr addrspace(1) %705, align 1
  store double %502, ptr addrspace(1) %185, align 8
  store double %496, ptr addrspace(1) %354, align 8
  store double %493, ptr addrspace(1) %356, align 8
  %706 = getelementptr i8, ptr addrspace(1) %arg24194, i64 %1
  store i8 %492, ptr addrspace(1) %706, align 1
  store double %677, ptr addrspace(1) %358, align 8
  store i32 %684, ptr addrspace(1) %682, align 4
  store i32 %698, ptr addrspace(1) %696, align 4
  %707 = getelementptr i32, ptr addrspace(1) %arg25196, i64 %1
  store i32 %695, ptr addrspace(1) %707, align 4
  %708 = getelementptr i32, ptr addrspace(1) %arg26198, i64 %1
  store i32 %681, ptr addrspace(1) %708, align 4
  %709 = getelementptr i64, ptr addrspace(1) %arg27200, i64 %1
  store i64 %699, ptr addrspace(1) %709, align 8
  store i64 %704, ptr addrspace(1) %700, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_scatter_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg231 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg129 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg027 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !271
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 240
  br i1 %3, label %concatenate.pivot.0., label %scatter.14.1.in_bounds-after

scatter.14.1.in_bounds-after:                     ; preds = %concatenate.pivot.0., %scatter.in_bounds-true, %entry
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 119
  %4 = zext i1 %.cmp to i64
  %param_2.166510 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg231, i64 0, i64 %4
  %param_2.166511 = load i32, ptr addrspace(1) %param_2.166510, align 4, !invariant.load !270
  %5 = icmp slt i32 %param_2.166511, 0
  %6 = add i32 %param_2.166511, 10
  %7 = select i1 %5, i32 %6, i32 %param_2.166511
  %8 = icmp ult i32 %7, 10
  br i1 %8, label %scatter.in_bounds-true, label %scatter.14.1.in_bounds-after

scatter.in_bounds-true:                           ; preds = %concatenate.pivot.0.
  %.lhs.trunc24 = trunc nuw i32 %linear_index to i8
  %9 = zext nneg i32 %linear_index to i64
  %10 = getelementptr double, ptr addrspace(1) %arg129, i64 %9
  %11 = zext nneg i32 %7 to i64
  %.urem = add i8 %.lhs.trunc24, -120
  %.cmp26 = icmp ult i32 %linear_index, 120
  %12 = select i1 %.cmp26, i8 %.lhs.trunc24, i8 %.urem
  %13 = zext nneg i8 %12 to i64
  %14 = getelementptr inbounds [2 x [10 x [120 x double]]], ptr addrspace(1) %arg027, i64 0, i64 %4, i64 %11, i64 %13
  %param_1.171021 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  store double %param_1.171021, ptr addrspace(1) %14, align 8
  br label %scatter.14.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_1(ptr noalias nocapture align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg5, ptr noalias nocapture align 128 dereferenceable(19200) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg9) local_unnamed_addr #2 {
entry:
  %arg920 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg818 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg716 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg614 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !288
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_select_fusion.1.in_bounds-true, label %loop_select_fusion.1.in_bounds-after

loop_select_fusion.1.in_bounds-after:             ; preds = %loop_select_fusion.1.in_bounds-true, %entry
  ret void

loop_select_fusion.1.in_bounds-true:              ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 1199
  %4 = zext i1 %.cmp to i64
  %5 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg38, i64 0, i64 %4
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg410, i64 0, i64 %4
  %8 = load i64, ptr addrspace(1) %7, align 8, !invariant.load !270
  %9 = icmp sge i64 %6, %8
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg26, i64 0, i64 %4
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !270
  %12 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg14, i64 0, i64 %4
  %13 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !270
  %14 = or i8 %13, %11
  %15 = trunc i8 %14 to i1
  %.not1 = or i1 %9, %15
  %16 = icmp slt i64 %6, 0
  %17 = and i64 %6, 1
  %18 = sub nsw i64 0, %17
  %19 = select i1 %16, i64 %18, i64 %17
  %.lobit = lshr i64 %19, 63
  %20 = and i64 %.lobit, %6
  %21 = add nsw i64 %19, 2
  %22 = trunc nuw i64 %20 to i1
  %23 = select i1 %22, i64 %21, i64 %19
  %24 = icmp eq i64 %23, 0
  %25 = zext nneg i32 %linear_index to i64
  %26 = getelementptr double, ptr addrspace(1) %arg02, i64 %25
  %27 = load double, ptr addrspace(1) %26, align 8
  %28 = getelementptr double, ptr addrspace(1) %arg512, i64 %25
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !270
  %30 = select i1 %24, double %29, double %27
  %31 = select i1 %.not1, double %27, double %30
  %32 = getelementptr double, ptr addrspace(1) %arg614, i64 %25
  %33 = load double, ptr addrspace(1) %32, align 8
  %34 = getelementptr double, ptr addrspace(1) %arg716, i64 %25
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !270
  %36 = select i1 %24, double %35, double %33
  %37 = select i1 %.not1, double %33, double %36
  store double %31, ptr addrspace(1) %26, align 8
  %38 = getelementptr double, ptr addrspace(1) %arg818, i64 %25
  store double %30, ptr addrspace(1) %38, align 8
  store double %37, ptr addrspace(1) %32, align 8
  %39 = getelementptr double, ptr addrspace(1) %arg920, i64 %25
  store double %36, ptr addrspace(1) %39, align 8
  br label %loop_select_fusion.1.in_bounds-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #7 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %0 = icmp ult i32 %thread.id.x, 2
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi i8 [ %10, %x_in_tile-true ], [ 0, %entry ]
  %1 = zext nneg i8 %partial_reduction_result.0 to i32
  %2 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %1, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %3 = trunc i32 %2 to i8
  %4 = or i8 %partial_reduction_result.0, %3
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %5 = zext nneg i32 %thread.id.x to i64
  %param_1.70 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg113, i64 0, i64 %5
  %param_1.702 = load i32, ptr addrspace(1) %param_1.70, align 4, !invariant.load !270
  %param_2.64 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.643 = load i32, ptr addrspace(1) %param_2.64, align 4, !invariant.load !270
  %6 = icmp sge i32 %param_1.702, %param_2.643
  %param_0.47 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg011, i64 0, i64 %5
  %param_0.474 = load i8, ptr addrspace(1) %param_0.47, align 1, !invariant.load !270
  %7 = trunc i8 %param_0.474 to i1
  %8 = xor i1 %7, true
  %9 = and i1 %6, %8
  %10 = zext i1 %9 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg317, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg6) local_unnamed_addr #4 {
entry:
  %arg6712 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5710 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4708 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3706 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2704 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1702 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0700 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_1.64322 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg1702, i64 0, i64 %1
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %param_1.64323 = load i32, ptr addrspace(1) %param_1.64322, align 4, !invariant.load !270
  %3 = icmp slt i32 %param_1.64323, 0
  %4 = add i32 %param_1.64323, 10
  %5 = select i1 %3, i32 %4, i32 %param_1.64323
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 9)
  %8 = zext nneg i32 %7 to i64
  %9 = zext nneg i32 %2 to i64
  %param_0.43355 = getelementptr inbounds [2 x [10 x [120 x double]]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %8, i64 %9
  %10 = load <2 x double>, ptr addrspace(1) %param_0.43355, align 16, !invariant.load !270
  %param_0.43356730 = extractelement <2 x double> %10, i32 0
  %param_0.43356.1731 = extractelement <2 x double> %10, i32 1
  %param_3.49357 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %9
  %11 = load <2 x double>, ptr addrspace(1) %param_3.49357, align 16, !invariant.load !270
  %param_3.49358732 = extractelement <2 x double> %11, i32 0
  %param_3.49358.1733 = extractelement <2 x double> %11, i32 1
  %param_4.43413 = getelementptr inbounds [2 x [10 x [120 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %9
  %12 = load <2 x double>, ptr addrspace(1) %param_4.43413, align 16, !invariant.load !270
  %param_4.43414734 = extractelement <2 x double> %12, i32 0
  %param_4.43414.1735 = extractelement <2 x double> %12, i32 1
  %subtract.218.7415 = fsub double %param_3.49358732, %param_4.43414734
  %add.3972.7472 = fadd double %param_0.43356730, %subtract.218.7415
  %param_2.58473 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg2704, i64 0, i64 %1, i64 %9
  %13 = load <2 x double>, ptr addrspace(1) %param_2.58473, align 16, !invariant.load !270
  %param_2.58474736 = extractelement <2 x double> %13, i32 0
  %param_2.58474.1737 = extractelement <2 x double> %13, i32 1
  %add.3973.9475 = fadd double %param_0.43356730, %param_2.58474736
  %multiply.2886.7477 = fmul double %add.3973.9475, 5.000000e-01
  %subtract.219.5478 = fsub double %add.3972.7472, %multiply.2886.7477
  %multiply.2887.3479 = fmul double %param_0.43356730, %subtract.219.5478
  %add.3969.i671 = fadd double %multiply.2887.3479, 0.000000e+00
  %multiply.2888.1.clone.1605 = fmul double %param_2.58474736, %subtract.219.5478
  %add.3969.i672 = fadd double %multiply.2888.1.clone.1605, 0.000000e+00
  %subtract.218.7415.1 = fsub double %param_3.49358.1733, %param_4.43414.1735
  %add.3972.7472.1 = fadd double %param_0.43356.1731, %subtract.218.7415.1
  %add.3973.9475.1 = fadd double %param_0.43356.1731, %param_2.58474.1737
  %multiply.2886.7477.1 = fmul double %add.3973.9475.1, 5.000000e-01
  %subtract.219.5478.1 = fsub double %add.3972.7472.1, %multiply.2886.7477.1
  %multiply.2887.3479.1 = fmul double %param_0.43356.1731, %subtract.219.5478.1
  %add.3969.i671.1 = fadd double %add.3969.i671, %multiply.2887.3479.1
  %multiply.2888.1.clone.1605.1 = fmul double %param_2.58474.1737, %subtract.219.5478.1
  %add.3969.i672.1 = fadd double %add.3969.i672, %multiply.2888.1.clone.1605.1
  %14 = or i32 %thread.id.x, 32
  %15 = icmp ult i32 %14, 60
  br i1 %15, label %loop3.loop_header296.preheader.1, label %x_in_tile-after.7

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after639, %reduction_write_output-true643
  ret void

thread_in_bounds-after:                           ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  %16 = icmp eq i32 %thread.id.2, 0
  %17 = bitcast double %partial_reduction_result2.2.1 to <2 x i32>
  %18 = extractelement <2 x i32> %17, i64 0
  %19 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %18, i32 16, i32 31)
  %20 = insertelement <2 x i32> poison, i32 %19, i64 0
  %21 = extractelement <2 x i32> %17, i64 1
  %22 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %21, i32 16, i32 31)
  %23 = insertelement <2 x i32> %20, i32 %22, i64 1
  %24 = bitcast <2 x i32> %23 to double
  %add.3969.i666 = fadd double %partial_reduction_result2.2.1, %24
  %25 = bitcast double %add.3969.i666 to <2 x i32>
  %26 = extractelement <2 x i32> %25, i64 0
  %27 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 8, i32 31)
  %28 = insertelement <2 x i32> poison, i32 %27, i64 0
  %29 = extractelement <2 x i32> %25, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 8, i32 31)
  %31 = insertelement <2 x i32> %28, i32 %30, i64 1
  %32 = bitcast <2 x i32> %31 to double
  %add.3969.i667 = fadd double %add.3969.i666, %32
  %33 = bitcast double %add.3969.i667 to <2 x i32>
  %34 = extractelement <2 x i32> %33, i64 0
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 4, i32 31)
  %36 = insertelement <2 x i32> poison, i32 %35, i64 0
  %37 = extractelement <2 x i32> %33, i64 1
  %38 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 4, i32 31)
  %39 = insertelement <2 x i32> %36, i32 %38, i64 1
  %40 = bitcast <2 x i32> %39 to double
  %add.3969.i668 = fadd double %add.3969.i667, %40
  %41 = bitcast double %add.3969.i668 to <2 x i32>
  %42 = extractelement <2 x i32> %41, i64 0
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 2, i32 31)
  %44 = insertelement <2 x i32> poison, i32 %43, i64 0
  %45 = extractelement <2 x i32> %41, i64 1
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 2, i32 31)
  %47 = insertelement <2 x i32> %44, i32 %46, i64 1
  %48 = bitcast <2 x i32> %47 to double
  %add.3969.i669 = fadd double %add.3969.i668, %48
  %49 = bitcast double %add.3969.i669 to <2 x i32>
  %50 = extractelement <2 x i32> %49, i64 0
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 1, i32 31)
  %52 = extractelement <2 x i32> %49, i64 1
  %53 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %52, i32 1, i32 31)
  %54 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache7, i64 0, i64 %1, i64 0
  %55 = insertelement <2 x i32> poison, i32 %51, i64 0
  %56 = insertelement <2 x i32> %55, i32 %53, i64 1
  %57 = bitcast <2 x i32> %56 to double
  %add.3969.i670 = fadd double %add.3969.i669, %57
  br i1 %16, label %intra_warp_reduce_write-true638, label %intra_warp_reduce_write-after639

loop3.loop_header296.preheader.1:                 ; preds = %entry
  %58 = shl nuw nsw i32 %14, 1
  %59 = zext nneg i32 %58 to i64
  %param_0.43355.1683 = getelementptr inbounds [2 x [10 x [120 x double]]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %8, i64 %59
  %60 = load <2 x double>, ptr addrspace(1) %param_0.43355.1683, align 16, !invariant.load !270
  %param_0.43356.1684722 = extractelement <2 x double> %60, i32 0
  %param_0.43356.1.1723 = extractelement <2 x double> %60, i32 1
  %param_3.49357.1685 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %59
  %61 = load <2 x double>, ptr addrspace(1) %param_3.49357.1685, align 16, !invariant.load !270
  %param_3.49358.1686724 = extractelement <2 x double> %61, i32 0
  %param_3.49358.1.1725 = extractelement <2 x double> %61, i32 1
  %param_4.43413.1687 = getelementptr inbounds [2 x [10 x [120 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %59
  %62 = load <2 x double>, ptr addrspace(1) %param_4.43413.1687, align 16, !invariant.load !270
  %param_4.43414.1688726 = extractelement <2 x double> %62, i32 0
  %param_4.43414.1.1727 = extractelement <2 x double> %62, i32 1
  %subtract.218.7415.1689 = fsub double %param_3.49358.1686724, %param_4.43414.1688726
  %add.3972.7472.1690 = fadd double %param_0.43356.1684722, %subtract.218.7415.1689
  %param_2.58473.1691 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg2704, i64 0, i64 %1, i64 %59
  %63 = load <2 x double>, ptr addrspace(1) %param_2.58473.1691, align 16, !invariant.load !270
  %param_2.58474.1692728 = extractelement <2 x double> %63, i32 0
  %param_2.58474.1.1729 = extractelement <2 x double> %63, i32 1
  %add.3973.9475.1693 = fadd double %param_0.43356.1684722, %param_2.58474.1692728
  %multiply.2886.7477.1694 = fmul double %add.3973.9475.1693, 5.000000e-01
  %subtract.219.5478.1695 = fsub double %add.3972.7472.1690, %multiply.2886.7477.1694
  %multiply.2887.3479.1696 = fmul double %param_0.43356.1684722, %subtract.219.5478.1695
  %add.3969.i671.1697 = fadd double %add.3969.i671.1, %multiply.2887.3479.1696
  %multiply.2888.1.clone.1605.1698 = fmul double %param_2.58474.1692728, %subtract.219.5478.1695
  %add.3969.i672.1699 = fadd double %add.3969.i672.1, %multiply.2888.1.clone.1605.1698
  %subtract.218.7415.1.1 = fsub double %param_3.49358.1.1725, %param_4.43414.1.1727
  %add.3972.7472.1.1 = fadd double %param_0.43356.1.1723, %subtract.218.7415.1.1
  %add.3973.9475.1.1 = fadd double %param_0.43356.1.1723, %param_2.58474.1.1729
  %multiply.2886.7477.1.1 = fmul double %add.3973.9475.1.1, 5.000000e-01
  %subtract.219.5478.1.1 = fsub double %add.3972.7472.1.1, %multiply.2886.7477.1.1
  %multiply.2887.3479.1.1 = fmul double %param_0.43356.1.1723, %subtract.219.5478.1.1
  %add.3969.i671.1.1 = fadd double %add.3969.i671.1697, %multiply.2887.3479.1.1
  %multiply.2888.1.clone.1605.1.1 = fmul double %param_2.58474.1.1729, %subtract.219.5478.1.1
  %add.3969.i672.1.1 = fadd double %add.3969.i672.1699, %multiply.2888.1.clone.1605.1.1
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %loop3.loop_header296.preheader.1, %entry
  %partial_reduction_result.2.1 = phi double [ %add.3969.i671.1, %entry ], [ %add.3969.i671.1.1, %loop3.loop_header296.preheader.1 ]
  %partial_reduction_result2.2.1 = phi double [ %add.3969.i672.1, %entry ], [ %add.3969.i672.1.1, %loop3.loop_header296.preheader.1 ]
  %64 = bitcast double %partial_reduction_result.2.1 to <2 x i32>
  %65 = extractelement <2 x i32> %64, i64 0
  %66 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %65, i32 16, i32 31)
  %67 = insertelement <2 x i32> poison, i32 %66, i64 0
  %68 = extractelement <2 x i32> %64, i64 1
  %69 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %68, i32 16, i32 31)
  %70 = insertelement <2 x i32> %67, i32 %69, i64 1
  %71 = bitcast <2 x i32> %70 to double
  %add.3969.i = fadd double %partial_reduction_result.2.1, %71
  %72 = bitcast double %add.3969.i to <2 x i32>
  %73 = extractelement <2 x i32> %72, i64 0
  %74 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 8, i32 31)
  %75 = insertelement <2 x i32> poison, i32 %74, i64 0
  %76 = extractelement <2 x i32> %72, i64 1
  %77 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %76, i32 8, i32 31)
  %78 = insertelement <2 x i32> %75, i32 %77, i64 1
  %79 = bitcast <2 x i32> %78 to double
  %add.3969.i662 = fadd double %add.3969.i, %79
  %80 = bitcast double %add.3969.i662 to <2 x i32>
  %81 = extractelement <2 x i32> %80, i64 0
  %82 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %81, i32 4, i32 31)
  %83 = insertelement <2 x i32> poison, i32 %82, i64 0
  %84 = extractelement <2 x i32> %80, i64 1
  %85 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %84, i32 4, i32 31)
  %86 = insertelement <2 x i32> %83, i32 %85, i64 1
  %87 = bitcast <2 x i32> %86 to double
  %add.3969.i663 = fadd double %add.3969.i662, %87
  %88 = bitcast double %add.3969.i663 to <2 x i32>
  %89 = extractelement <2 x i32> %88, i64 0
  %90 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %89, i32 2, i32 31)
  %91 = insertelement <2 x i32> poison, i32 %90, i64 0
  %92 = extractelement <2 x i32> %88, i64 1
  %93 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %92, i32 2, i32 31)
  %94 = insertelement <2 x i32> %91, i32 %93, i64 1
  %95 = bitcast <2 x i32> %94 to double
  %add.3969.i664 = fadd double %add.3969.i663, %95
  %96 = bitcast double %add.3969.i664 to <2 x i32>
  %97 = extractelement <2 x i32> %96, i64 0
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 1, i32 31)
  %99 = extractelement <2 x i32> %96, i64 1
  %100 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %99, i32 1, i32 31)
  %101 = icmp eq i32 %thread.id.2, 0
  %102 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache6, i64 0, i64 %1, i64 0
  %103 = insertelement <2 x i32> poison, i32 %98, i64 0
  %104 = insertelement <2 x i32> %103, i32 %100, i64 1
  %105 = bitcast <2 x i32> %104 to double
  %add.3969.i665 = fadd double %add.3969.i664, %105
  br i1 %101, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %x_in_tile-after.7, %intra_warp_reduce_write-true
  %106 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %107 = zext nneg i32 %thread.id.2 to i64
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg5710, i64 0, i64 %1
  %108 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache6, i64 0, i64 %1, i64 %107
  br i1 %106, label %reduction_write_output-true, label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i665, ptr addrspace(3) %102, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %108, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %thread_in_bounds-after

intra_warp_reduce_write-after639:                 ; preds = %intra_warp_reduce_write-true638, %thread_in_bounds-after
  %109 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address645 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg6712, i64 0, i64 %1
  %110 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache7, i64 0, i64 %1, i64 %107
  br i1 %109, label %reduction_write_output-true643, label %reduce-group-0-after

intra_warp_reduce_write-true638:                  ; preds = %thread_in_bounds-after
  store double %add.3969.i670, ptr addrspace(3) %54, align 8
  br label %intra_warp_reduce_write-after639

reduction_write_output-true643:                   ; preds = %intra_warp_reduce_write-after639
  %output646.then.val = load double, ptr addrspace(3) %110, align 8
  store double %output646.then.val, ptr addrspace(1) %output_element_address645, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg38, i64 %1
  %3 = load i32, ptr addrspace(1) %2, align 4
  %4 = getelementptr i32, ptr addrspace(1) %arg410, i64 %1
  %5 = load i32, ptr addrspace(1) %4, align 4, !invariant.load !270
  %6 = icmp slt i32 %3, %5
  %7 = getelementptr i8, ptr addrspace(1) %arg02, i64 %1
  %8 = load i8, ptr addrspace(1) %7, align 1
  %9 = trunc i8 %8 to i1
  %.not1 = or i1 %6, %9
  %10 = getelementptr double, ptr addrspace(1) %arg26, i64 %1
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %compare.1128.3 = fcmp ole double %11, 0.000000e+00
  %12 = getelementptr double, ptr addrspace(1) %arg14, i64 %1
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !270
  %compare.1129.5 = fcmp ole double %13, 0.000000e+00
  %14 = or i1 %compare.1128.3, %compare.1129.5
  %15 = zext i1 %14 to i8
  %16 = select i1 %.not1, i8 %8, i8 %15
  %not..not1 = xor i1 %.not1, true
  %17 = sext i1 %not..not1 to i32
  %18 = add i32 %3, %17
  store i8 %16, ptr addrspace(1) %7, align 1
  store i32 %18, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_2(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg11, ptr noalias nocapture align 128 dereferenceable(320) %arg12, ptr noalias nocapture align 128 dereferenceable(320) %arg13, ptr noalias nocapture align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture align 128 dereferenceable(320) %arg20, ptr noalias nocapture align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture align 128 dereferenceable(320) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture align 128 dereferenceable(320) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture align 128 dereferenceable(320) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg29, ptr noalias nocapture align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture align 128 dereferenceable(320) %arg32, ptr noalias nocapture align 128 dereferenceable(320) %arg33, ptr noalias nocapture align 128 dereferenceable(320) %arg34, ptr noalias nocapture align 128 dereferenceable(320) %arg35, ptr noalias nocapture align 128 dereferenceable(320) %arg36, ptr noalias nocapture align 128 dereferenceable(320) %arg37, ptr noalias nocapture align 128 dereferenceable(320) %arg38, ptr noalias nocapture align 128 dereferenceable(320) %arg39, ptr noalias nocapture align 128 dereferenceable(320) %arg40, ptr noalias nocapture align 128 dereferenceable(320) %arg41, ptr noalias nocapture align 128 dereferenceable(320) %arg42, ptr noalias nocapture align 128 dereferenceable(320) %arg43, ptr noalias nocapture align 128 dereferenceable(320) %arg44, ptr noalias nocapture align 128 dereferenceable(320) %arg45, ptr noalias nocapture align 128 dereferenceable(320) %arg46, ptr noalias nocapture align 128 dereferenceable(320) %arg47, ptr noalias nocapture align 128 dereferenceable(320) %arg48, ptr noalias nocapture align 128 dereferenceable(320) %arg49, ptr noalias nocapture align 128 dereferenceable(320) %arg50, ptr noalias nocapture align 128 dereferenceable(320) %arg51, ptr noalias nocapture align 128 dereferenceable(320) %arg52, ptr noalias nocapture align 128 dereferenceable(320) %arg53, ptr noalias nocapture align 128 dereferenceable(320) %arg54, ptr noalias nocapture align 128 dereferenceable(320) %arg55, ptr noalias nocapture align 128 dereferenceable(320) %arg56) local_unnamed_addr #2 {
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
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp4 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp4, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg416, i64 0, i64 %2
  %4 = load i64, ptr addrspace(1) %3, align 8, !invariant.load !270
  %5 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg722, i64 0, i64 %2
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = icmp sge i64 %4, %6
  %8 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg620, i64 0, i64 %2
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !270
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg518, i64 0, i64 %2
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !270
  %12 = or i8 %11, %9
  %13 = trunc i8 %12 to i1
  %.not3 = or i1 %7, %13
  %14 = icmp eq i64 %4, 0
  %15 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg110, i64 0, i64 %2
  %16 = load i8, ptr addrspace(1) %15, align 1, !invariant.load !270
  %17 = zext nneg i32 %0 to i64
  %18 = getelementptr double, ptr addrspace(1) %arg05, i64 %17
  %19 = load double, ptr addrspace(1) %18, align 8
  %20 = getelementptr double, ptr addrspace(1) %arg212, i64 %17
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !270
  %22 = getelementptr double, ptr addrspace(1) %arg314, i64 %17
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !270
  %add.4187.7 = fadd double %23, 6.000000e+00
  %multiply.3056.5 = fmul double %add.4187.7, 2.500000e-01
  %24 = fsub double %21, %multiply.3056.5
  %25 = trunc i8 %16 to i1
  %26 = select i1 %25, double %19, double %24
  %27 = select i1 %14, double %24, double %26
  %28 = select i1 %.not3, double %19, double %27
  %29 = getelementptr double, ptr addrspace(1) %arg824, i64 %17
  %30 = load double, ptr addrspace(1) %29, align 8
  %31 = getelementptr double, ptr addrspace(1) %arg926, i64 %17
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !270
  %33 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1130, i64 0, i64 %2
  %34 = load i64, ptr addrspace(1) %33, align 8, !invariant.load !270
  %35 = sitofp i64 %34 to double
  %multiply.3000.27.clone.1 = fmul double %35, 0x3F886F8FA34E82C5
  %36 = zext nneg i32 %1 to i64
  %37 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg1028, i64 0, i64 %2, i64 %36
  %38 = getelementptr inbounds i8, ptr addrspace(1) %37, i64 160
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !270
  %add.4172.20.clone.1 = fadd double %39, %39
  %multiply.3025.5.clone.1 = fmul double %multiply.3000.27.clone.1, %add.4172.20.clone.1
  %add.4191.3.clone.1 = fadd double %32, %multiply.3025.5.clone.1
  %40 = select i1 %25, double %30, double %add.4191.3.clone.1
  %41 = select i1 %14, double %add.4191.3.clone.1, double %40
  %42 = select i1 %.not3, double %30, double %41
  %43 = getelementptr double, ptr addrspace(1) %arg1232, i64 %17
  %44 = load double, ptr addrspace(1) %43, align 8
  %45 = getelementptr double, ptr addrspace(1) %arg1334, i64 %17
  %46 = load double, ptr addrspace(1) %45, align 8
  %47 = load double, ptr addrspace(1) %37, align 8, !invariant.load !270
  %add.4172.20.clone.11 = fadd double %47, %47
  %multiply.3018.9.clone.1 = fmul double %multiply.3000.27.clone.1, %add.4172.20.clone.11
  %add.4182.7.clone.1 = fadd double %46, %multiply.3018.9.clone.1
  %48 = select i1 %25, double %44, double %add.4182.7.clone.1
  %49 = select i1 %14, double %add.4182.7.clone.1, double %48
  %50 = select i1 %.not3, double %44, double %49
  %51 = getelementptr double, ptr addrspace(1) %arg1436, i64 %17
  %52 = load double, ptr addrspace(1) %51, align 8
  %53 = getelementptr double, ptr addrspace(1) %arg1538, i64 %17
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !270
  %55 = getelementptr inbounds i8, ptr addrspace(1) %37, i64 320
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !270
  %add.4172.20.clone.12 = fadd double %56, %56
  %multiply.3014.9.clone.1 = fmul double %multiply.3000.27.clone.1, %add.4172.20.clone.12
  %add.4177.7.clone.1 = fadd double %54, %multiply.3014.9.clone.1
  %57 = select i1 %25, double %52, double %add.4177.7.clone.1
  %58 = select i1 %14, double %add.4177.7.clone.1, double %57
  %59 = select i1 %.not3, double %52, double %58
  %60 = getelementptr double, ptr addrspace(1) %arg1640, i64 %17
  %61 = load double, ptr addrspace(1) %60, align 8
  %62 = getelementptr double, ptr addrspace(1) %arg1742, i64 %17
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !270
  %64 = select i1 %25, double %61, double %63
  %65 = select i1 %14, double %63, double %64
  %66 = select i1 %.not3, double %61, double %65
  %67 = getelementptr double, ptr addrspace(1) %arg1844, i64 %17
  %68 = load double, ptr addrspace(1) %67, align 8
  %69 = getelementptr double, ptr addrspace(1) %arg1946, i64 %17
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !270
  %71 = select i1 %25, double %68, double %70
  %72 = select i1 %14, double %70, double %71
  %73 = select i1 %.not3, double %68, double %72
  %74 = getelementptr double, ptr addrspace(1) %arg2048, i64 %17
  %75 = load double, ptr addrspace(1) %74, align 8
  %76 = select i1 %25, double %75, double %23
  %77 = select i1 %14, double %23, double %76
  %78 = select i1 %.not3, double %75, double %77
  %79 = getelementptr double, ptr addrspace(1) %arg2150, i64 %17
  %80 = load double, ptr addrspace(1) %79, align 8
  %81 = getelementptr double, ptr addrspace(1) %arg2252, i64 %17
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !270
  %add.4206.3.clone.1 = fsub double %82, %add.4182.7.clone.1
  %83 = select i1 %25, double %80, double %add.4206.3.clone.1
  %84 = select i1 %14, double %add.4206.3.clone.1, double %83
  %85 = select i1 %.not3, double %80, double %84
  %86 = getelementptr double, ptr addrspace(1) %arg2354, i64 %17
  %87 = load double, ptr addrspace(1) %86, align 8
  %88 = getelementptr double, ptr addrspace(1) %arg2456, i64 %17
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !270
  %add.4192.7.clone.1 = fadd double %add.4191.3.clone.1, -1.000000e+00
  %multiply.3046.5.clone.1 = fmul double %add.4192.7.clone.1, 4.000000e+00
  %90 = fsub double %89, %multiply.3046.5.clone.1
  %91 = select i1 %25, double %87, double %90
  %92 = select i1 %14, double %90, double %91
  %93 = select i1 %.not3, double %87, double %92
  %94 = getelementptr double, ptr addrspace(1) %arg2558, i64 %17
  %95 = load double, ptr addrspace(1) %94, align 8
  %96 = getelementptr double, ptr addrspace(1) %arg2660, i64 %17
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !270
  %98 = getelementptr double, ptr addrspace(1) %arg2762, i64 %17
  %99 = load double, ptr addrspace(1) %98, align 8, !invariant.load !270
  %multiply.3049.3.clone.1 = fmul double %97, %99
  %add.4178.7.clone.1 = fadd double %add.4177.7.clone.1, 0xBFF62E42FEFA39EF
  %multiply.3050.5.clone.1 = fmul double %add.4178.7.clone.1, 0x3FFC71C71C71C71C
  %100 = fsub double %multiply.3049.3.clone.1, %multiply.3050.5.clone.1
  %101 = select i1 %25, double %95, double %100
  %102 = select i1 %14, double %100, double %101
  %103 = select i1 %.not3, double %95, double %102
  %104 = getelementptr double, ptr addrspace(1) %arg2864, i64 %17
  %105 = load double, ptr addrspace(1) %104, align 8
  %106 = getelementptr double, ptr addrspace(1) %arg2966, i64 %17
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !270
  %add.4197.7.clone.1 = fadd double %63, -1.000000e+00
  %add.4214.3.clone.1 = fsub double %107, %add.4197.7.clone.1
  %108 = select i1 %25, double %105, double %add.4214.3.clone.1
  %109 = select i1 %14, double %add.4214.3.clone.1, double %108
  %110 = select i1 %.not3, double %105, double %109
  %111 = getelementptr double, ptr addrspace(1) %arg3068, i64 %17
  %112 = load double, ptr addrspace(1) %111, align 8
  %113 = getelementptr double, ptr addrspace(1) %arg3170, i64 %17
  %114 = load double, ptr addrspace(1) %113, align 8, !invariant.load !270
  %add.4174.7.clone.1 = fadd double %70, 4.000000e+00
  %multiply.3054.5.clone.1 = fmul double %add.4174.7.clone.1, 2.500000e-01
  %115 = fsub double %114, %multiply.3054.5.clone.1
  %116 = select i1 %25, double %112, double %115
  %117 = select i1 %14, double %115, double %116
  %118 = select i1 %.not3, double %112, double %117
  %119 = getelementptr double, ptr addrspace(1) %arg3272, i64 %17
  %120 = load double, ptr addrspace(1) %119, align 8
  %121 = getelementptr double, ptr addrspace(1) %arg3374, i64 %17
  %122 = load double, ptr addrspace(1) %121, align 8
  %multiply.3002.23.clone.1 = fmul double %35, 0x3F786F8FA34E82C5
  %123 = getelementptr double, ptr addrspace(1) %arg3476, i64 %17
  %124 = load double, ptr addrspace(1) %123, align 8
  %multiply.3005.15.clone.1 = fmul double %multiply.3002.23.clone.1, %124
  %add.4167.13.clone.1 = fadd double %122, %multiply.3005.15.clone.1
  %multiply.3051.11.clone.1 = fmul double %multiply.3002.23.clone.1, %100
  %add.4213.9.clone.1 = fadd double %multiply.3051.11.clone.1, %add.4167.13.clone.1
  %add.4232.5.clone.1 = fadd double %120, %add.4213.9.clone.1
  %125 = select i1 %14, double %add.4213.9.clone.1, double %add.4232.5.clone.1
  %126 = select i1 %.not3, double %120, double %125
  %127 = getelementptr double, ptr addrspace(1) %arg3578, i64 %17
  %128 = load double, ptr addrspace(1) %127, align 8
  %129 = select i1 %14, double %100, double %128
  %130 = select i1 %.not3, double %128, double %129
  %131 = select i1 %.not3, double %124, double %100
  %132 = getelementptr double, ptr addrspace(1) %arg3680, i64 %17
  %133 = load double, ptr addrspace(1) %132, align 8
  %134 = select i1 %14, double %add.4213.9.clone.1, double %133
  %135 = select i1 %.not3, double %133, double %134
  %136 = select i1 %.not3, double %122, double %add.4213.9.clone.1
  %137 = getelementptr double, ptr addrspace(1) %arg3782, i64 %17
  %138 = load double, ptr addrspace(1) %137, align 8
  %139 = select i1 %.not3, double %138, double %add.4214.3.clone.1
  %140 = getelementptr double, ptr addrspace(1) %arg3884, i64 %17
  %141 = load double, ptr addrspace(1) %140, align 8
  %142 = getelementptr double, ptr addrspace(1) %arg3986, i64 %17
  %143 = load double, ptr addrspace(1) %142, align 8
  %multiply.3006.15.clone.1 = fmul double %multiply.3002.23.clone.1, %138
  %add.4168.13.clone.1 = fadd double %multiply.3006.15.clone.1, %143
  %multiply.3053.11.clone.1 = fmul double %multiply.3002.23.clone.1, %add.4214.3.clone.1
  %add.4216.9.clone.1 = fadd double %multiply.3053.11.clone.1, %add.4168.13.clone.1
  %add.4233.5.clone.1 = fadd double %141, %add.4216.9.clone.1
  %144 = select i1 %14, double %add.4216.9.clone.1, double %add.4233.5.clone.1
  %145 = select i1 %.not3, double %141, double %144
  %146 = getelementptr double, ptr addrspace(1) %arg4088, i64 %17
  %147 = load double, ptr addrspace(1) %146, align 8
  %148 = select i1 %14, double %add.4214.3.clone.1, double %147
  %149 = select i1 %.not3, double %147, double %148
  %150 = getelementptr double, ptr addrspace(1) %arg4190, i64 %17
  %151 = load double, ptr addrspace(1) %150, align 8
  %152 = select i1 %14, double %add.4216.9.clone.1, double %151
  %153 = select i1 %.not3, double %151, double %152
  %154 = select i1 %.not3, double %143, double %add.4216.9.clone.1
  %155 = getelementptr double, ptr addrspace(1) %arg4292, i64 %17
  %156 = load double, ptr addrspace(1) %155, align 8
  %157 = select i1 %.not3, double %156, double %24
  %158 = getelementptr double, ptr addrspace(1) %arg4394, i64 %17
  %159 = load double, ptr addrspace(1) %158, align 8
  %160 = getelementptr double, ptr addrspace(1) %arg4496, i64 %17
  %161 = load double, ptr addrspace(1) %160, align 8
  %multiply.3008.15.clone.1 = fmul double %multiply.3002.23.clone.1, %156
  %add.4171.13.clone.1 = fadd double %multiply.3008.15.clone.1, %161
  %multiply.3057.11.clone.1 = fmul double %24, %multiply.3002.23.clone.1
  %add.4221.9.clone.1 = fadd double %multiply.3057.11.clone.1, %add.4171.13.clone.1
  %add.4236.5.clone.1 = fadd double %159, %add.4221.9.clone.1
  %162 = select i1 %14, double %add.4221.9.clone.1, double %add.4236.5.clone.1
  %163 = select i1 %.not3, double %159, double %162
  %164 = getelementptr double, ptr addrspace(1) %arg4598, i64 %17
  %165 = load double, ptr addrspace(1) %164, align 8
  %166 = select i1 %14, double %24, double %165
  %167 = select i1 %.not3, double %165, double %166
  %168 = getelementptr double, ptr addrspace(1) %arg46100, i64 %17
  %169 = load double, ptr addrspace(1) %168, align 8
  %170 = select i1 %14, double %add.4221.9.clone.1, double %169
  %171 = select i1 %.not3, double %169, double %170
  %172 = select i1 %.not3, double %161, double %add.4221.9.clone.1
  %173 = getelementptr double, ptr addrspace(1) %arg47102, i64 %17
  %174 = load double, ptr addrspace(1) %173, align 8
  %175 = select i1 %.not3, double %174, double %115
  %176 = getelementptr double, ptr addrspace(1) %arg48104, i64 %17
  %177 = load double, ptr addrspace(1) %176, align 8
  %178 = getelementptr double, ptr addrspace(1) %arg49106, i64 %17
  %179 = load double, ptr addrspace(1) %178, align 8
  %multiply.3007.15.clone.1 = fmul double %multiply.3002.23.clone.1, %174
  %add.4169.13.clone.1 = fadd double %multiply.3007.15.clone.1, %179
  %multiply.3055.11.clone.1 = fmul double %multiply.3002.23.clone.1, %115
  %add.4218.9.clone.1 = fadd double %multiply.3055.11.clone.1, %add.4169.13.clone.1
  %add.4234.5.clone.1 = fadd double %177, %add.4218.9.clone.1
  %180 = select i1 %14, double %add.4218.9.clone.1, double %add.4234.5.clone.1
  %181 = select i1 %.not3, double %177, double %180
  %182 = getelementptr double, ptr addrspace(1) %arg50108, i64 %17
  %183 = load double, ptr addrspace(1) %182, align 8
  %184 = select i1 %14, double %115, double %183
  %185 = select i1 %.not3, double %183, double %184
  %186 = getelementptr double, ptr addrspace(1) %arg51110, i64 %17
  %187 = load double, ptr addrspace(1) %186, align 8
  %188 = select i1 %14, double %add.4218.9.clone.1, double %187
  %189 = select i1 %.not3, double %187, double %188
  %190 = select i1 %.not3, double %179, double %add.4218.9.clone.1
  %191 = getelementptr double, ptr addrspace(1) %arg52112, i64 %17
  %192 = load double, ptr addrspace(1) %191, align 8
  %193 = select i1 %.not3, double %192, double %90
  %194 = getelementptr double, ptr addrspace(1) %arg53114, i64 %17
  %195 = load double, ptr addrspace(1) %194, align 8
  %196 = getelementptr double, ptr addrspace(1) %arg54116, i64 %17
  %197 = load double, ptr addrspace(1) %196, align 8
  %multiply.3004.15.clone.1 = fmul double %multiply.3002.23.clone.1, %192
  %add.4166.13.clone.1 = fadd double %multiply.3004.15.clone.1, %197
  %multiply.3047.11.clone.1 = fmul double %multiply.3002.23.clone.1, %90
  %add.4211.9.clone.1 = fadd double %multiply.3047.11.clone.1, %add.4166.13.clone.1
  %add.4231.5.clone.1 = fadd double %195, %add.4211.9.clone.1
  %198 = select i1 %14, double %add.4211.9.clone.1, double %add.4231.5.clone.1
  %199 = select i1 %.not3, double %195, double %198
  %200 = getelementptr double, ptr addrspace(1) %arg55118, i64 %17
  %201 = load double, ptr addrspace(1) %200, align 8
  %202 = select i1 %14, double %90, double %201
  %203 = select i1 %.not3, double %201, double %202
  %204 = getelementptr double, ptr addrspace(1) %arg56120, i64 %17
  %205 = load double, ptr addrspace(1) %204, align 8
  %206 = select i1 %14, double %add.4211.9.clone.1, double %205
  %207 = select i1 %.not3, double %205, double %206
  %208 = select i1 %.not3, double %197, double %add.4211.9.clone.1
  %209 = select i1 %.not3, double %46, double %add.4182.7.clone.1
  store double %28, ptr addrspace(1) %18, align 8
  store double %42, ptr addrspace(1) %29, align 8
  store double %50, ptr addrspace(1) %43, align 8
  store double %59, ptr addrspace(1) %51, align 8
  store double %66, ptr addrspace(1) %60, align 8
  store double %73, ptr addrspace(1) %67, align 8
  store double %78, ptr addrspace(1) %74, align 8
  store double %85, ptr addrspace(1) %79, align 8
  store double %93, ptr addrspace(1) %86, align 8
  store double %103, ptr addrspace(1) %94, align 8
  store double %110, ptr addrspace(1) %104, align 8
  store double %118, ptr addrspace(1) %111, align 8
  store double %126, ptr addrspace(1) %119, align 8
  store double %130, ptr addrspace(1) %127, align 8
  store double %131, ptr addrspace(1) %123, align 8
  store double %135, ptr addrspace(1) %132, align 8
  store double %136, ptr addrspace(1) %121, align 8
  store double %139, ptr addrspace(1) %137, align 8
  store double %145, ptr addrspace(1) %140, align 8
  store double %149, ptr addrspace(1) %146, align 8
  store double %153, ptr addrspace(1) %150, align 8
  store double %154, ptr addrspace(1) %142, align 8
  store double %157, ptr addrspace(1) %155, align 8
  store double %163, ptr addrspace(1) %158, align 8
  store double %167, ptr addrspace(1) %164, align 8
  store double %171, ptr addrspace(1) %168, align 8
  store double %172, ptr addrspace(1) %160, align 8
  store double %175, ptr addrspace(1) %173, align 8
  store double %181, ptr addrspace(1) %176, align 8
  store double %185, ptr addrspace(1) %182, align 8
  store double %189, ptr addrspace(1) %186, align 8
  store double %190, ptr addrspace(1) %178, align 8
  store double %193, ptr addrspace(1) %191, align 8
  store double %199, ptr addrspace(1) %194, align 8
  store double %203, ptr addrspace(1) %200, align 8
  store double %207, ptr addrspace(1) %204, align 8
  store double %208, ptr addrspace(1) %196, align 8
  store double %209, ptr addrspace(1) %45, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4) local_unnamed_addr #2 {
entry:
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg38, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = getelementptr i64, ptr addrspace(1) %arg410, i64 %1
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !270
  %6 = icmp sge i64 %3, %5
  %7 = getelementptr i8, ptr addrspace(1) %arg14, i64 %1
  %8 = load i8, ptr addrspace(1) %7, align 1
  %9 = getelementptr i8, ptr addrspace(1) %arg26, i64 %1
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !270
  %11 = or i8 %10, %8
  %12 = trunc i8 %11 to i1
  %.not1 = or i1 %6, %12
  %13 = getelementptr i8, ptr addrspace(1) %arg02, i64 %1
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !270
  %15 = select i1 %.not1, i8 %8, i8 %14
  store i8 %15, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_subtract_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg29, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg37) local_unnamed_addr #8 {
entry:
  %arg37127 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36125 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35123 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34121 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33119 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32117 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31115 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg29111 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28109 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg26105 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25103 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2399 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2297 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2093 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1991 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1787 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1685 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1481 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1379 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1277 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1175 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1073 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg971 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg869 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg767 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg665 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg563 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg461 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg359 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg257 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg155 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg053 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !271
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw i32 %linear_index to i8
  %3 = udiv i8 %.lhs.trunc, 120
  %4 = mul i8 %3, 120
  %.decomposed = sub i8 %.lhs.trunc, %4
  %.zext = zext nneg i8 %.decomposed to i32
  %.zext42 = zext nneg i8 %3 to i32
  %5 = icmp ult i32 %linear_index, 240
  br i1 %5, label %concatenate.pivot.60., label %loop_subtract_fusion.1.in_bounds-after

loop_subtract_fusion.1.in_bounds-after:           ; preds = %concatenate.44.3.merge, %entry
  ret void

concatenate.pivot.60.:                            ; preds = %entry
  %6 = icmp ult i8 %.decomposed, 60
  br i1 %6, label %concatenate.pivot.20., label %concatenate.pivot.80.

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.60.
  %7 = icmp ult i8 %.decomposed, 20
  br i1 %7, label %concatenate.pivot.0., label %concatenate.pivot.40.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.20.
  %8 = mul nuw nsw i32 %.zext42, 20
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr double, ptr addrspace(1) %arg155, i64 %9
  %11 = zext nneg i8 %.decomposed to i64
  %12 = getelementptr inbounds double, ptr addrspace(1) %10, i64 %11
  %13 = getelementptr double, ptr addrspace(1) %arg053, i64 %9
  %14 = getelementptr inbounds double, ptr addrspace(1) %13, i64 %11
  br label %concatenate.pivot.60.12

concatenate.pivot.40.:                            ; preds = %concatenate.pivot.20.
  %15 = icmp ult i8 %.decomposed, 40
  %16 = mul nuw nsw i32 %.zext42, 20
  %17 = zext nneg i32 %16 to i64
  br i1 %15, label %concatenate.pivot.20.1, label %concatenate.pivot.40.2

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.40.
  %18 = add nsw i32 %.zext, -20
  %19 = getelementptr double, ptr addrspace(1) %arg359, i64 %17
  %20 = zext nneg i32 %18 to i64
  %21 = getelementptr inbounds double, ptr addrspace(1) %19, i64 %20
  %22 = getelementptr double, ptr addrspace(1) %arg257, i64 %17
  %23 = getelementptr inbounds double, ptr addrspace(1) %22, i64 %20
  br label %concatenate.pivot.60.12

concatenate.pivot.40.2:                           ; preds = %concatenate.pivot.40.
  %24 = add nsw i32 %.zext, -40
  %25 = getelementptr double, ptr addrspace(1) %arg563, i64 %17
  %26 = zext nneg i32 %24 to i64
  %27 = getelementptr inbounds double, ptr addrspace(1) %25, i64 %26
  %28 = getelementptr double, ptr addrspace(1) %arg461, i64 %17
  %29 = getelementptr inbounds double, ptr addrspace(1) %28, i64 %26
  br label %concatenate.pivot.60.12

concatenate.pivot.80.:                            ; preds = %concatenate.pivot.60.
  %30 = icmp ult i8 %.decomposed, 80
  %31 = mul nuw nsw i32 %.zext42, 20
  %32 = zext nneg i32 %31 to i64
  br i1 %30, label %concatenate.pivot.60.3, label %concatenate.pivot.100.

concatenate.pivot.60.3:                           ; preds = %concatenate.pivot.80.
  %33 = add nsw i32 %.zext, -60
  %34 = getelementptr double, ptr addrspace(1) %arg767, i64 %32
  %35 = zext nneg i32 %33 to i64
  %36 = getelementptr inbounds double, ptr addrspace(1) %34, i64 %35
  %37 = getelementptr double, ptr addrspace(1) %arg665, i64 %32
  %38 = getelementptr inbounds double, ptr addrspace(1) %37, i64 %35
  br label %concatenate.pivot.60.12

concatenate.pivot.100.:                           ; preds = %concatenate.pivot.80.
  %39 = icmp ult i8 %.decomposed, 100
  br i1 %39, label %concatenate.pivot.80.4, label %concatenate.pivot.100.5

concatenate.pivot.80.4:                           ; preds = %concatenate.pivot.100.
  %40 = add nsw i32 %.zext, -80
  %41 = getelementptr double, ptr addrspace(1) %arg971, i64 %32
  %42 = zext nneg i32 %40 to i64
  %43 = getelementptr inbounds double, ptr addrspace(1) %41, i64 %42
  %44 = getelementptr double, ptr addrspace(1) %arg869, i64 %32
  %45 = getelementptr inbounds double, ptr addrspace(1) %44, i64 %42
  br label %concatenate.pivot.60.12

concatenate.pivot.100.5:                          ; preds = %concatenate.pivot.100.
  %46 = add nsw i32 %.zext, -100
  %47 = getelementptr double, ptr addrspace(1) %arg1175, i64 %32
  %48 = zext nneg i32 %46 to i64
  %49 = getelementptr inbounds double, ptr addrspace(1) %47, i64 %48
  %50 = getelementptr double, ptr addrspace(1) %arg1073, i64 %32
  %51 = getelementptr inbounds double, ptr addrspace(1) %50, i64 %48
  br label %concatenate.pivot.60.12

concatenate.pivot.60.12:                          ; preds = %concatenate.pivot.0., %concatenate.pivot.20.1, %concatenate.pivot.40.2, %concatenate.pivot.60.3, %concatenate.pivot.80.4, %concatenate.pivot.100.5
  %.sink49 = phi ptr addrspace(1) [ %14, %concatenate.pivot.0. ], [ %23, %concatenate.pivot.20.1 ], [ %29, %concatenate.pivot.40.2 ], [ %38, %concatenate.pivot.60.3 ], [ %45, %concatenate.pivot.80.4 ], [ %51, %concatenate.pivot.100.5 ]
  %.sink.in = phi ptr addrspace(1) [ %12, %concatenate.pivot.0. ], [ %21, %concatenate.pivot.20.1 ], [ %27, %concatenate.pivot.40.2 ], [ %36, %concatenate.pivot.60.3 ], [ %43, %concatenate.pivot.80.4 ], [ %49, %concatenate.pivot.100.5 ]
  %52 = icmp ult i8 %.decomposed, 60
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !270
  %53 = load double, ptr addrspace(1) %.sink49, align 8, !invariant.load !270
  %add.4425.3 = fadd double %.sink, %53
  br i1 %52, label %concatenate.pivot.20.13, label %concatenate.pivot.80.18

concatenate.pivot.20.13:                          ; preds = %concatenate.pivot.60.12
  %54 = icmp ult i8 %.decomposed, 20
  br i1 %54, label %concatenate.pivot.0.14, label %concatenate.pivot.40.15

concatenate.pivot.0.14:                           ; preds = %concatenate.pivot.20.13
  %55 = mul nuw nsw i32 %.zext42, 20
  %56 = zext nneg i8 %3 to i64
  %57 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg1277, i64 0, i64 %56
  %58 = load i8, ptr addrspace(1) %57, align 1, !invariant.load !270
  %59 = zext nneg i32 %55 to i64
  %60 = getelementptr double, ptr addrspace(1) %arg36125, i64 %59
  %61 = zext nneg i8 %.decomposed to i64
  %62 = getelementptr inbounds double, ptr addrspace(1) %60, i64 %61
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !270
  %64 = getelementptr double, ptr addrspace(1) %arg29111, i64 %59
  %65 = getelementptr inbounds double, ptr addrspace(1) %64, i64 %61
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !270
  %67 = trunc i8 %58 to i1
  %68 = select i1 %67, double %63, double %66
  br label %concatenate.pivot.60.29

concatenate.pivot.40.15:                          ; preds = %concatenate.pivot.20.13
  %69 = icmp ult i8 %.decomposed, 40
  %70 = mul nuw nsw i32 %.zext42, 20
  %71 = zext nneg i8 %3 to i64
  %72 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg1277, i64 0, i64 %71
  %73 = load i8, ptr addrspace(1) %72, align 1, !invariant.load !270
  %74 = zext nneg i32 %70 to i64
  %75 = trunc i8 %73 to i1
  br i1 %69, label %concatenate.pivot.20.16, label %concatenate.pivot.40.17

concatenate.pivot.20.16:                          ; preds = %concatenate.pivot.40.15
  %76 = add nsw i32 %.zext, -20
  %77 = getelementptr double, ptr addrspace(1) %arg35123, i64 %74
  %78 = zext nneg i32 %76 to i64
  %79 = getelementptr inbounds double, ptr addrspace(1) %77, i64 %78
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !270
  %81 = getelementptr double, ptr addrspace(1) %arg26105, i64 %74
  %82 = getelementptr inbounds double, ptr addrspace(1) %81, i64 %78
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !270
  %84 = select i1 %75, double %80, double %83
  br label %concatenate.pivot.60.29

concatenate.pivot.40.17:                          ; preds = %concatenate.pivot.40.15
  %85 = add nsw i32 %.zext, -40
  %86 = getelementptr double, ptr addrspace(1) %arg34121, i64 %74
  %87 = zext nneg i32 %85 to i64
  %88 = getelementptr inbounds double, ptr addrspace(1) %86, i64 %87
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !270
  %90 = getelementptr double, ptr addrspace(1) %arg2399, i64 %74
  %91 = getelementptr inbounds double, ptr addrspace(1) %90, i64 %87
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !270
  %93 = select i1 %75, double %89, double %92
  br label %concatenate.pivot.60.29

concatenate.pivot.80.18:                          ; preds = %concatenate.pivot.60.12
  %94 = icmp ult i8 %.decomposed, 80
  %95 = mul nuw nsw i32 %.zext42, 20
  %96 = zext nneg i8 %3 to i64
  %97 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg1277, i64 0, i64 %96
  %98 = load i8, ptr addrspace(1) %97, align 1, !invariant.load !270
  %99 = zext nneg i32 %95 to i64
  br i1 %94, label %concatenate.pivot.60.19, label %concatenate.pivot.100.20

concatenate.pivot.60.19:                          ; preds = %concatenate.pivot.80.18
  %100 = add nsw i32 %.zext, -60
  %101 = getelementptr double, ptr addrspace(1) %arg33119, i64 %99
  %102 = zext nneg i32 %100 to i64
  %103 = getelementptr inbounds double, ptr addrspace(1) %101, i64 %102
  %104 = load double, ptr addrspace(1) %103, align 8, !invariant.load !270
  %105 = getelementptr double, ptr addrspace(1) %arg2093, i64 %99
  %106 = getelementptr inbounds double, ptr addrspace(1) %105, i64 %102
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !270
  %108 = trunc i8 %98 to i1
  %109 = select i1 %108, double %104, double %107
  br label %concatenate.pivot.60.29

concatenate.pivot.100.20:                         ; preds = %concatenate.pivot.80.18
  %110 = icmp ult i8 %.decomposed, 100
  %111 = trunc i8 %98 to i1
  br i1 %110, label %concatenate.pivot.80.21, label %concatenate.pivot.100.22

concatenate.pivot.80.21:                          ; preds = %concatenate.pivot.100.20
  %112 = add nsw i32 %.zext, -80
  %113 = getelementptr double, ptr addrspace(1) %arg32117, i64 %99
  %114 = zext nneg i32 %112 to i64
  %115 = getelementptr inbounds double, ptr addrspace(1) %113, i64 %114
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !270
  %117 = getelementptr double, ptr addrspace(1) %arg1787, i64 %99
  %118 = getelementptr inbounds double, ptr addrspace(1) %117, i64 %114
  %119 = load double, ptr addrspace(1) %118, align 8, !invariant.load !270
  %120 = select i1 %111, double %116, double %119
  br label %concatenate.pivot.60.29

concatenate.pivot.100.22:                         ; preds = %concatenate.pivot.100.20
  %121 = add nsw i32 %.zext, -100
  %122 = getelementptr double, ptr addrspace(1) %arg31115, i64 %99
  %123 = zext nneg i32 %121 to i64
  %124 = getelementptr inbounds double, ptr addrspace(1) %122, i64 %123
  %125 = load double, ptr addrspace(1) %124, align 8, !invariant.load !270
  %126 = getelementptr double, ptr addrspace(1) %arg1481, i64 %99
  %127 = getelementptr inbounds double, ptr addrspace(1) %126, i64 %123
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !270
  %129 = select i1 %111, double %125, double %128
  br label %concatenate.pivot.60.29

concatenate.pivot.60.29:                          ; preds = %concatenate.pivot.0.14, %concatenate.pivot.20.16, %concatenate.pivot.40.17, %concatenate.pivot.60.19, %concatenate.pivot.80.21, %concatenate.pivot.100.22
  %.off0 = phi i1 [ %67, %concatenate.pivot.0.14 ], [ %75, %concatenate.pivot.20.16 ], [ %75, %concatenate.pivot.40.17 ], [ %108, %concatenate.pivot.60.19 ], [ %111, %concatenate.pivot.80.21 ], [ %111, %concatenate.pivot.100.22 ]
  %130 = phi double [ %68, %concatenate.pivot.0.14 ], [ %84, %concatenate.pivot.20.16 ], [ %93, %concatenate.pivot.40.17 ], [ %109, %concatenate.pivot.60.19 ], [ %120, %concatenate.pivot.80.21 ], [ %129, %concatenate.pivot.100.22 ]
  %131 = icmp ult i8 %.decomposed, 60
  br i1 %131, label %concatenate.pivot.20.30, label %concatenate.pivot.80.35

concatenate.pivot.20.30:                          ; preds = %concatenate.pivot.60.29
  %132 = icmp ult i8 %.decomposed, 20
  br i1 %132, label %concatenate.pivot.0.31, label %concatenate.pivot.40.32

concatenate.pivot.0.31:                           ; preds = %concatenate.pivot.20.30
  %133 = mul nuw nsw i32 %.zext42, 20
  %134 = zext nneg i32 %133 to i64
  %135 = getelementptr double, ptr addrspace(1) %arg29111, i64 %134
  %136 = zext nneg i8 %.decomposed to i64
  %137 = getelementptr inbounds double, ptr addrspace(1) %135, i64 %136
  %138 = getelementptr double, ptr addrspace(1) %arg28109, i64 %134
  %139 = getelementptr inbounds double, ptr addrspace(1) %138, i64 %136
  br label %concatenate.44.3.merge

concatenate.pivot.40.32:                          ; preds = %concatenate.pivot.20.30
  %140 = icmp ult i8 %.decomposed, 40
  %141 = mul nuw nsw i32 %.zext42, 20
  %142 = zext nneg i32 %141 to i64
  br i1 %140, label %concatenate.pivot.20.33, label %concatenate.pivot.40.34

concatenate.pivot.20.33:                          ; preds = %concatenate.pivot.40.32
  %143 = add nsw i32 %.zext, -20
  %144 = getelementptr double, ptr addrspace(1) %arg26105, i64 %142
  %145 = zext nneg i32 %143 to i64
  %146 = getelementptr inbounds double, ptr addrspace(1) %144, i64 %145
  %147 = getelementptr double, ptr addrspace(1) %arg25103, i64 %142
  %148 = getelementptr inbounds double, ptr addrspace(1) %147, i64 %145
  br label %concatenate.44.3.merge

concatenate.pivot.40.34:                          ; preds = %concatenate.pivot.40.32
  %149 = add nsw i32 %.zext, -40
  %150 = getelementptr double, ptr addrspace(1) %arg2399, i64 %142
  %151 = zext nneg i32 %149 to i64
  %152 = getelementptr inbounds double, ptr addrspace(1) %150, i64 %151
  %153 = getelementptr double, ptr addrspace(1) %arg2297, i64 %142
  %154 = getelementptr inbounds double, ptr addrspace(1) %153, i64 %151
  br label %concatenate.44.3.merge

concatenate.pivot.80.35:                          ; preds = %concatenate.pivot.60.29
  %155 = icmp ult i8 %.decomposed, 80
  %156 = mul nuw nsw i32 %.zext42, 20
  %157 = zext nneg i32 %156 to i64
  br i1 %155, label %concatenate.pivot.60.36, label %concatenate.pivot.100.37

concatenate.pivot.60.36:                          ; preds = %concatenate.pivot.80.35
  %158 = add nsw i32 %.zext, -60
  %159 = getelementptr double, ptr addrspace(1) %arg2093, i64 %157
  %160 = zext nneg i32 %158 to i64
  %161 = getelementptr inbounds double, ptr addrspace(1) %159, i64 %160
  %162 = getelementptr double, ptr addrspace(1) %arg1991, i64 %157
  %163 = getelementptr inbounds double, ptr addrspace(1) %162, i64 %160
  br label %concatenate.44.3.merge

concatenate.pivot.100.37:                         ; preds = %concatenate.pivot.80.35
  %164 = icmp ult i8 %.decomposed, 100
  br i1 %164, label %concatenate.pivot.80.38, label %concatenate.pivot.100.39

concatenate.pivot.80.38:                          ; preds = %concatenate.pivot.100.37
  %165 = add nsw i32 %.zext, -80
  %166 = getelementptr double, ptr addrspace(1) %arg1787, i64 %157
  %167 = zext nneg i32 %165 to i64
  %168 = getelementptr inbounds double, ptr addrspace(1) %166, i64 %167
  %169 = getelementptr double, ptr addrspace(1) %arg1685, i64 %157
  %170 = getelementptr inbounds double, ptr addrspace(1) %169, i64 %167
  br label %concatenate.44.3.merge

concatenate.pivot.100.39:                         ; preds = %concatenate.pivot.100.37
  %171 = add nsw i32 %.zext, -100
  %172 = getelementptr double, ptr addrspace(1) %arg1481, i64 %157
  %173 = zext nneg i32 %171 to i64
  %174 = getelementptr inbounds double, ptr addrspace(1) %172, i64 %173
  %175 = getelementptr double, ptr addrspace(1) %arg1379, i64 %157
  %176 = getelementptr inbounds double, ptr addrspace(1) %175, i64 %173
  br label %concatenate.44.3.merge

concatenate.44.3.merge:                           ; preds = %concatenate.pivot.100.39, %concatenate.pivot.80.38, %concatenate.pivot.60.36, %concatenate.pivot.40.34, %concatenate.pivot.20.33, %concatenate.pivot.0.31
  %.sink52 = phi ptr addrspace(1) [ %176, %concatenate.pivot.100.39 ], [ %170, %concatenate.pivot.80.38 ], [ %163, %concatenate.pivot.60.36 ], [ %154, %concatenate.pivot.40.34 ], [ %148, %concatenate.pivot.20.33 ], [ %139, %concatenate.pivot.0.31 ]
  %.sink50.in = phi ptr addrspace(1) [ %174, %concatenate.pivot.100.39 ], [ %168, %concatenate.pivot.80.38 ], [ %161, %concatenate.pivot.60.36 ], [ %152, %concatenate.pivot.40.34 ], [ %146, %concatenate.pivot.20.33 ], [ %137, %concatenate.pivot.0.31 ]
  %.sink50 = load double, ptr addrspace(1) %.sink50.in, align 8, !invariant.load !270
  %177 = load double, ptr addrspace(1) %.sink52, align 8, !invariant.load !270
  %178 = select i1 %.off0, double %.sink50, double %177
  %add.4432.1 = fadd double %130, %178
  %multiply.3067.1 = fmul double %add.4432.1, 5.000000e-01
  %subtract.239.1 = fsub double %add.4425.3, %multiply.3067.1
  %179 = zext nneg i32 %linear_index to i64
  %180 = getelementptr double, ptr addrspace(1) %arg37127, i64 %179
  store double %subtract.239.1, ptr addrspace(1) %180, align 8
  br label %loop_subtract_fusion.1.in_bounds-after
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg27) local_unnamed_addr #4 {
entry:
  %arg27494 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26492 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25490 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24488 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23486 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22484 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21482 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20480 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19478 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18476 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg16472 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15470 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg13466 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12464 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg10460 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9458 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg7454 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6452 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg4448 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3446 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg1442 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0440 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_19.707162 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg19478, i64 0, i64 %1
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %3 = icmp ult i32 %thread.id.2, 30
  br i1 %3, label %concatenate.pivot.20.171, label %concatenate.pivot.60.177

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after287, %reduction_write_output-true291
  ret void

thread_in_bounds-after:                           ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  %4 = icmp eq i32 %thread.id.2, 0
  %5 = bitcast double %partial_reduction_result2.2.1 to <2 x i32>
  %6 = extractelement <2 x i32> %5, i64 0
  %7 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %6, i32 16, i32 31)
  %8 = insertelement <2 x i32> poison, i32 %7, i64 0
  %9 = extractelement <2 x i32> %5, i64 1
  %10 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %9, i32 16, i32 31)
  %11 = insertelement <2 x i32> %8, i32 %10, i64 1
  %12 = bitcast <2 x i32> %11 to double
  %add.3969.i319 = fadd double %partial_reduction_result2.2.1, %12
  %13 = bitcast double %add.3969.i319 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 8, i32 31)
  %16 = insertelement <2 x i32> poison, i32 %15, i64 0
  %17 = extractelement <2 x i32> %13, i64 1
  %18 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 8, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to double
  %add.3969.i320 = fadd double %add.3969.i319, %20
  %21 = bitcast double %add.3969.i320 to <2 x i32>
  %22 = extractelement <2 x i32> %21, i64 0
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 4, i32 31)
  %24 = insertelement <2 x i32> poison, i32 %23, i64 0
  %25 = extractelement <2 x i32> %21, i64 1
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 4, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 1
  %28 = bitcast <2 x i32> %27 to double
  %add.3969.i321 = fadd double %add.3969.i320, %28
  %29 = bitcast double %add.3969.i321 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 2, i32 31)
  %32 = insertelement <2 x i32> poison, i32 %31, i64 0
  %33 = extractelement <2 x i32> %29, i64 1
  %34 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %33, i32 2, i32 31)
  %35 = insertelement <2 x i32> %32, i32 %34, i64 1
  %36 = bitcast <2 x i32> %35 to double
  %add.3969.i322 = fadd double %add.3969.i321, %36
  %37 = bitcast double %add.3969.i322 to <2 x i32>
  %38 = extractelement <2 x i32> %37, i64 0
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 1, i32 31)
  %40 = extractelement <2 x i32> %37, i64 1
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 1, i32 31)
  %42 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache9, i64 0, i64 %1, i64 0
  %43 = insertelement <2 x i32> poison, i32 %39, i64 0
  %44 = insertelement <2 x i32> %43, i32 %41, i64 1
  %45 = bitcast <2 x i32> %44 to double
  %add.3969.i323 = fadd double %add.3969.i322, %45
  br i1 %4, label %intra_warp_reduce_write-true286, label %intra_warp_reduce_write-after287

loop3.loop_header110.preheader.1:                 ; preds = %concatenate.44.5.clone.1.merge185.1
  %46 = shl nuw nsw i32 %184, 1
  %47 = icmp ult i32 %184, 40
  br i1 %47, label %concatenate.pivot.60.177.1355, label %concatenate.pivot.100.178.1337

concatenate.pivot.100.178.1337:                   ; preds = %loop3.loop_header110.preheader.1
  %48 = icmp ult i32 %184, 50
  %49 = trunc i8 %param_19.707145.1350 to i1
  br i1 %48, label %concatenate.pivot.80.179.1349, label %concatenate.pivot.100.180.1343

concatenate.pivot.100.180.1343:                   ; preds = %concatenate.pivot.100.178.1337
  %50 = sext i32 %46 to i64
  %51 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1442, i64 0, i64 %1, i64 %50
  %param_1.5793164.1339496 = getelementptr inbounds i8, ptr addrspace(1) %51, i64 -800
  %param_1.5793165.1340 = load double, ptr addrspace(1) %param_1.5793164.1339496, align 16, !invariant.load !270
  %52 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3446, i64 0, i64 %1, i64 %50
  %param_3.3704168.1341497 = getelementptr inbounds i8, ptr addrspace(1) %52, i64 -800
  %param_3.3704169.1342 = load double, ptr addrspace(1) %param_3.3704168.1341497, align 16, !invariant.load !270
  %53 = select i1 %49, double %param_1.5793165.1340, double %param_3.3704169.1342
  br label %concatenate.46.3.merge115.1380

concatenate.pivot.80.179.1349:                    ; preds = %concatenate.pivot.100.178.1337
  %54 = add nsw i32 %46, -80
  %55 = zext nneg i32 %54 to i64
  %param_4.2622155.1345 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4448, i64 0, i64 %1, i64 %55
  %param_4.2622156.1346 = load double, ptr addrspace(1) %param_4.2622155.1345, align 16, !invariant.load !270
  %param_6.1705159.1347 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6452, i64 0, i64 %1, i64 %55
  %param_6.1705160.1348 = load double, ptr addrspace(1) %param_6.1705159.1347, align 16, !invariant.load !270
  %56 = select i1 %49, double %param_4.2622156.1346, double %param_6.1705160.1348
  br label %concatenate.46.3.merge115.1380

concatenate.pivot.60.177.1355:                    ; preds = %loop3.loop_header110.preheader.1
  %57 = add nsw i32 %46, -60
  %58 = zext nneg i32 %57 to i64
  %param_7.1419146.1351 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7454, i64 0, i64 %1, i64 %58
  %param_7.1419147.1352 = load double, ptr addrspace(1) %param_7.1419146.1351, align 16, !invariant.load !270
  %param_9.1028150.1353 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9458, i64 0, i64 %1, i64 %58
  %param_9.1028151.1354 = load double, ptr addrspace(1) %param_9.1028150.1353, align 16, !invariant.load !270
  %59 = trunc i8 %param_19.707145.1350 to i1
  %60 = select i1 %59, double %param_7.1419147.1352, double %param_9.1028151.1354
  br label %concatenate.46.3.merge115.1380

concatenate.46.3.merge115.1380:                   ; preds = %concatenate.pivot.60.177.1355, %concatenate.pivot.80.179.1349, %concatenate.pivot.100.180.1343
  %param_19.707188.1.1.off0 = phi i1 [ %59, %concatenate.pivot.60.177.1355 ], [ %49, %concatenate.pivot.80.179.1349 ], [ %49, %concatenate.pivot.100.180.1343 ]
  %61 = phi double [ %60, %concatenate.pivot.60.177.1355 ], [ %56, %concatenate.pivot.80.179.1349 ], [ %53, %concatenate.pivot.100.180.1343 ]
  %62 = icmp ult i32 %184, 40
  %63 = zext nneg i32 %46 to i64
  %param_0.4101181.1376 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg0440, i64 0, i64 %1, i64 %63
  %param_0.4101182.1377 = load double, ptr addrspace(1) %param_0.4101181.1376, align 16, !invariant.load !270
  %multiply.3069.1183.1378 = fmul double %61, %param_0.4101182.1377
  %add.3969.i324.1379 = fadd double %add.3969.i324.1, %multiply.3069.1183.1378
  br i1 %62, label %concatenate.pivot.60.247.1400, label %concatenate.pivot.100.248.1382

concatenate.pivot.100.248.1382:                   ; preds = %concatenate.46.3.merge115.1380
  %64 = icmp ult i32 %184, 50
  br i1 %64, label %concatenate.pivot.80.249.1394, label %concatenate.pivot.100.250.1388

concatenate.pivot.100.250.1388:                   ; preds = %concatenate.pivot.100.248.1382
  %65 = sext i32 %46 to i64
  %66 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3446, i64 0, i64 %1, i64 %65
  %param_3.3704234.1384498 = getelementptr inbounds i8, ptr addrspace(1) %66, i64 -800
  %67 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg20480, i64 0, i64 %1, i64 %65
  %param_20.1830238.1386499 = getelementptr inbounds i8, ptr addrspace(1) %67, i64 -800
  br label %concatenate.44.5.clone.1.merge185.1423

concatenate.pivot.80.249.1394:                    ; preds = %concatenate.pivot.100.248.1382
  %68 = add nsw i32 %46, -80
  %69 = zext nneg i32 %68 to i64
  %param_6.1705225.1390 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6452, i64 0, i64 %1, i64 %69
  %param_21.1558229.1392 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg21482, i64 0, i64 %1, i64 %69
  br label %concatenate.44.5.clone.1.merge185.1423

concatenate.pivot.60.247.1400:                    ; preds = %concatenate.46.3.merge115.1380
  %70 = add nsw i32 %46, -60
  %71 = zext nneg i32 %70 to i64
  %param_9.1028216.1396 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9458, i64 0, i64 %1, i64 %71
  %param_22.1287220.1398 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg22484, i64 0, i64 %1, i64 %71
  br label %concatenate.44.5.clone.1.merge185.1423

concatenate.44.5.clone.1.merge185.1423:           ; preds = %concatenate.pivot.60.247.1400, %concatenate.pivot.80.249.1394, %concatenate.pivot.100.250.1388
  %param_22.1287220.1398.sink = phi ptr addrspace(1) [ %param_22.1287220.1398, %concatenate.pivot.60.247.1400 ], [ %param_21.1558229.1392, %concatenate.pivot.80.249.1394 ], [ %param_20.1830238.1386499, %concatenate.pivot.100.250.1388 ]
  %param_9.1028217.1397.sink.in = phi ptr addrspace(1) [ %param_9.1028216.1396, %concatenate.pivot.60.247.1400 ], [ %param_6.1705225.1390, %concatenate.pivot.80.249.1394 ], [ %param_3.3704234.1384498, %concatenate.pivot.100.250.1388 ]
  %72 = icmp ult i32 %184, 40
  %param_9.1028217.1397.sink = load double, ptr addrspace(1) %param_9.1028217.1397.sink.in, align 8, !invariant.load !270
  %param_22.1287221.1399 = load double, ptr addrspace(1) %param_22.1287220.1398.sink, align 8, !invariant.load !270
  %73 = select i1 %param_19.707188.1.1.off0, double %param_9.1028217.1397.sink, double %param_22.1287221.1399
  %multiply.3068.1.clone.1253.1421 = fmul double %param_0.4101182.1377, %73
  %add.3969.i325.1422 = fadd double %add.3969.i325.1, %multiply.3068.1.clone.1253.1421
  br i1 %72, label %concatenate.pivot.60.177.1.1, label %concatenate.pivot.100.178.1.1

concatenate.pivot.100.178.1.1:                    ; preds = %concatenate.44.5.clone.1.merge185.1423
  %74 = icmp ult i32 %184, 50
  br i1 %74, label %concatenate.pivot.80.179.1.1, label %concatenate.pivot.100.180.1.1

concatenate.pivot.100.180.1.1:                    ; preds = %concatenate.pivot.100.178.1.1
  %75 = sext i32 %46 to i64
  %76 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1442, i64 0, i64 %1, i64 %75
  %param_1.5793164.1.1500 = getelementptr inbounds i8, ptr addrspace(1) %76, i64 -792
  %77 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3446, i64 0, i64 %1, i64 %75
  %param_3.3704168.1.1501 = getelementptr inbounds i8, ptr addrspace(1) %77, i64 -792
  br label %concatenate.46.3.merge115.1.1

concatenate.pivot.80.179.1.1:                     ; preds = %concatenate.pivot.100.178.1.1
  %78 = add nsw i32 %46, -79
  %79 = zext nneg i32 %78 to i64
  %param_4.2622155.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4448, i64 0, i64 %1, i64 %79
  %param_6.1705159.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6452, i64 0, i64 %1, i64 %79
  br label %concatenate.46.3.merge115.1.1

concatenate.pivot.60.177.1.1:                     ; preds = %concatenate.44.5.clone.1.merge185.1423
  %80 = add nsw i32 %46, -59
  %81 = zext nneg i32 %80 to i64
  %param_7.1419146.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7454, i64 0, i64 %1, i64 %81
  %param_9.1028150.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9458, i64 0, i64 %1, i64 %81
  br label %concatenate.46.3.merge115.1.1

concatenate.46.3.merge115.1.1:                    ; preds = %concatenate.pivot.60.177.1.1, %concatenate.pivot.80.179.1.1, %concatenate.pivot.100.180.1.1
  %param_9.1028150.1.1.sink = phi ptr addrspace(1) [ %param_9.1028150.1.1, %concatenate.pivot.60.177.1.1 ], [ %param_6.1705159.1.1, %concatenate.pivot.80.179.1.1 ], [ %param_3.3704168.1.1501, %concatenate.pivot.100.180.1.1 ]
  %param_7.1419147.1.1.sink.in = phi ptr addrspace(1) [ %param_7.1419146.1.1, %concatenate.pivot.60.177.1.1 ], [ %param_4.2622155.1.1, %concatenate.pivot.80.179.1.1 ], [ %param_1.5793164.1.1500, %concatenate.pivot.100.180.1.1 ]
  %82 = icmp ult i32 %184, 40
  %param_7.1419147.1.1.sink = load double, ptr addrspace(1) %param_7.1419147.1.1.sink.in, align 8, !invariant.load !270
  %param_9.1028151.1.1 = load double, ptr addrspace(1) %param_9.1028150.1.1.sink, align 8, !invariant.load !270
  %83 = select i1 %param_19.707188.1.1.off0, double %param_7.1419147.1.1.sink, double %param_9.1028151.1.1
  %param_0.4101181.1.1502 = getelementptr inbounds i8, ptr addrspace(1) %param_0.4101181.1376, i64 8
  %param_0.4101182.1.1 = load double, ptr addrspace(1) %param_0.4101181.1.1502, align 8, !invariant.load !270
  %multiply.3069.1183.1.1 = fmul double %83, %param_0.4101182.1.1
  %add.3969.i324.1.1 = fadd double %add.3969.i324.1379, %multiply.3069.1183.1.1
  br i1 %82, label %concatenate.pivot.60.247.1.1, label %concatenate.pivot.100.248.1.1

concatenate.pivot.100.248.1.1:                    ; preds = %concatenate.46.3.merge115.1.1
  %84 = icmp ult i32 %184, 50
  br i1 %84, label %concatenate.pivot.80.249.1.1, label %concatenate.pivot.100.250.1.1

concatenate.pivot.100.250.1.1:                    ; preds = %concatenate.pivot.100.248.1.1
  %85 = sext i32 %46 to i64
  %86 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3446, i64 0, i64 %1, i64 %85
  %param_3.3704234.1.1503 = getelementptr inbounds i8, ptr addrspace(1) %86, i64 -792
  %87 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg20480, i64 0, i64 %1, i64 %85
  %param_20.1830238.1.1504 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 -792
  br label %concatenate.44.5.clone.1.merge185.1.1

concatenate.pivot.80.249.1.1:                     ; preds = %concatenate.pivot.100.248.1.1
  %88 = add nsw i32 %46, -79
  %89 = zext nneg i32 %88 to i64
  %param_6.1705225.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6452, i64 0, i64 %1, i64 %89
  %param_21.1558229.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg21482, i64 0, i64 %1, i64 %89
  br label %concatenate.44.5.clone.1.merge185.1.1

concatenate.pivot.60.247.1.1:                     ; preds = %concatenate.46.3.merge115.1.1
  %90 = add nsw i32 %46, -59
  %91 = zext nneg i32 %90 to i64
  %param_9.1028216.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9458, i64 0, i64 %1, i64 %91
  %param_22.1287220.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg22484, i64 0, i64 %1, i64 %91
  br label %concatenate.44.5.clone.1.merge185.1.1

concatenate.44.5.clone.1.merge185.1.1:            ; preds = %concatenate.pivot.60.247.1.1, %concatenate.pivot.80.249.1.1, %concatenate.pivot.100.250.1.1
  %param_22.1287220.1.1.sink = phi ptr addrspace(1) [ %param_22.1287220.1.1, %concatenate.pivot.60.247.1.1 ], [ %param_21.1558229.1.1, %concatenate.pivot.80.249.1.1 ], [ %param_20.1830238.1.1504, %concatenate.pivot.100.250.1.1 ]
  %param_9.1028217.1.1.sink.in = phi ptr addrspace(1) [ %param_9.1028216.1.1, %concatenate.pivot.60.247.1.1 ], [ %param_6.1705225.1.1, %concatenate.pivot.80.249.1.1 ], [ %param_3.3704234.1.1503, %concatenate.pivot.100.250.1.1 ]
  %param_9.1028217.1.1.sink = load double, ptr addrspace(1) %param_9.1028217.1.1.sink.in, align 8, !invariant.load !270
  %param_22.1287221.1.1 = load double, ptr addrspace(1) %param_22.1287220.1.1.sink, align 8, !invariant.load !270
  %92 = select i1 %param_19.707188.1.1.off0, double %param_9.1028217.1.1.sink, double %param_22.1287221.1.1
  %multiply.3068.1.clone.1253.1.1 = fmul double %param_0.4101182.1.1, %92
  %add.3969.i325.1.1 = fadd double %add.3969.i325.1422, %multiply.3068.1.clone.1253.1.1
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %concatenate.44.5.clone.1.merge185.1.1, %concatenate.44.5.clone.1.merge185.1
  %partial_reduction_result.2.1 = phi double [ %add.3969.i324.1, %concatenate.44.5.clone.1.merge185.1 ], [ %add.3969.i324.1.1, %concatenate.44.5.clone.1.merge185.1.1 ]
  %partial_reduction_result2.2.1 = phi double [ %add.3969.i325.1, %concatenate.44.5.clone.1.merge185.1 ], [ %add.3969.i325.1.1, %concatenate.44.5.clone.1.merge185.1.1 ]
  %93 = bitcast double %partial_reduction_result.2.1 to <2 x i32>
  %94 = extractelement <2 x i32> %93, i64 0
  %95 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %94, i32 16, i32 31)
  %96 = insertelement <2 x i32> poison, i32 %95, i64 0
  %97 = extractelement <2 x i32> %93, i64 1
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 16, i32 31)
  %99 = insertelement <2 x i32> %96, i32 %98, i64 1
  %100 = bitcast <2 x i32> %99 to double
  %add.3969.i = fadd double %partial_reduction_result.2.1, %100
  %101 = bitcast double %add.3969.i to <2 x i32>
  %102 = extractelement <2 x i32> %101, i64 0
  %103 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %102, i32 8, i32 31)
  %104 = insertelement <2 x i32> poison, i32 %103, i64 0
  %105 = extractelement <2 x i32> %101, i64 1
  %106 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %105, i32 8, i32 31)
  %107 = insertelement <2 x i32> %104, i32 %106, i64 1
  %108 = bitcast <2 x i32> %107 to double
  %add.3969.i315 = fadd double %add.3969.i, %108
  %109 = bitcast double %add.3969.i315 to <2 x i32>
  %110 = extractelement <2 x i32> %109, i64 0
  %111 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %110, i32 4, i32 31)
  %112 = insertelement <2 x i32> poison, i32 %111, i64 0
  %113 = extractelement <2 x i32> %109, i64 1
  %114 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %113, i32 4, i32 31)
  %115 = insertelement <2 x i32> %112, i32 %114, i64 1
  %116 = bitcast <2 x i32> %115 to double
  %add.3969.i316 = fadd double %add.3969.i315, %116
  %117 = bitcast double %add.3969.i316 to <2 x i32>
  %118 = extractelement <2 x i32> %117, i64 0
  %119 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %118, i32 2, i32 31)
  %120 = insertelement <2 x i32> poison, i32 %119, i64 0
  %121 = extractelement <2 x i32> %117, i64 1
  %122 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %121, i32 2, i32 31)
  %123 = insertelement <2 x i32> %120, i32 %122, i64 1
  %124 = bitcast <2 x i32> %123 to double
  %add.3969.i317 = fadd double %add.3969.i316, %124
  %125 = bitcast double %add.3969.i317 to <2 x i32>
  %126 = extractelement <2 x i32> %125, i64 0
  %127 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %126, i32 1, i32 31)
  %128 = extractelement <2 x i32> %125, i64 1
  %129 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %128, i32 1, i32 31)
  %130 = icmp eq i32 %thread.id.2, 0
  %131 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache8, i64 0, i64 %1, i64 0
  %132 = insertelement <2 x i32> poison, i32 %127, i64 0
  %133 = insertelement <2 x i32> %132, i32 %129, i64 1
  %134 = bitcast <2 x i32> %133 to double
  %add.3969.i318 = fadd double %add.3969.i317, %134
  br i1 %130, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

concatenate.pivot.20.171:                         ; preds = %entry
  %135 = icmp ult i32 %thread.id.2, 10
  br i1 %135, label %concatenate.pivot.0.172, label %concatenate.pivot.40.173

concatenate.pivot.0.172:                          ; preds = %concatenate.pivot.20.171
  %param_19.707118 = load i8, ptr addrspace(1) %param_19.707162, align 1, !invariant.load !270
  %136 = zext nneg i32 %2 to i64
  %param_16.492119 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg16472, i64 0, i64 %1, i64 %136
  %param_16.492120 = load double, ptr addrspace(1) %param_16.492119, align 16, !invariant.load !270
  %param_18.673123 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg18476, i64 0, i64 %1, i64 %136
  %param_18.673124 = load double, ptr addrspace(1) %param_18.673123, align 16, !invariant.load !270
  %137 = trunc i8 %param_19.707118 to i1
  %138 = select i1 %137, double %param_16.492120, double %param_18.673124
  br label %concatenate.46.3.merge115

concatenate.pivot.40.173:                         ; preds = %concatenate.pivot.20.171
  %139 = icmp ult i32 %thread.id.2, 20
  %param_19.707127 = load i8, ptr addrspace(1) %param_19.707162, align 1, !invariant.load !270
  %140 = trunc i8 %param_19.707127 to i1
  br i1 %139, label %concatenate.pivot.20.174, label %concatenate.pivot.40.175

concatenate.pivot.20.174:                         ; preds = %concatenate.pivot.40.173
  %141 = add nsw i32 %2, -20
  %142 = zext nneg i32 %141 to i64
  %param_13.584128 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg13466, i64 0, i64 %1, i64 %142
  %param_13.584129 = load double, ptr addrspace(1) %param_13.584128, align 16, !invariant.load !270
  %param_15.469132 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg15470, i64 0, i64 %1, i64 %142
  %param_15.469133 = load double, ptr addrspace(1) %param_15.469132, align 16, !invariant.load !270
  %143 = select i1 %140, double %param_13.584129, double %param_15.469133
  br label %concatenate.46.3.merge115

concatenate.pivot.40.175:                         ; preds = %concatenate.pivot.40.173
  %144 = add nsw i32 %2, -40
  %145 = zext nneg i32 %144 to i64
  %param_10.886137 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10460, i64 0, i64 %1, i64 %145
  %param_10.886138 = load double, ptr addrspace(1) %param_10.886137, align 16, !invariant.load !270
  %param_12.662141 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg12464, i64 0, i64 %1, i64 %145
  %param_12.662142 = load double, ptr addrspace(1) %param_12.662141, align 16, !invariant.load !270
  %146 = select i1 %140, double %param_10.886138, double %param_12.662142
  br label %concatenate.46.3.merge115

concatenate.pivot.60.177:                         ; preds = %entry
  %147 = add nsw i32 %2, -60
  %param_19.707145 = load i8, ptr addrspace(1) %param_19.707162, align 1, !invariant.load !270
  %148 = zext nneg i32 %147 to i64
  %param_7.1419146 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7454, i64 0, i64 %1, i64 %148
  %param_7.1419147 = load double, ptr addrspace(1) %param_7.1419146, align 16, !invariant.load !270
  %param_9.1028150 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9458, i64 0, i64 %1, i64 %148
  %param_9.1028151 = load double, ptr addrspace(1) %param_9.1028150, align 16, !invariant.load !270
  %149 = trunc i8 %param_19.707145 to i1
  %150 = select i1 %149, double %param_7.1419147, double %param_9.1028151
  br label %concatenate.46.3.merge115

concatenate.46.3.merge115:                        ; preds = %concatenate.pivot.60.177, %concatenate.pivot.40.175, %concatenate.pivot.20.174, %concatenate.pivot.0.172
  %param_19.707145.1350 = phi i8 [ %param_19.707118, %concatenate.pivot.0.172 ], [ %param_19.707127, %concatenate.pivot.20.174 ], [ %param_19.707127, %concatenate.pivot.40.175 ], [ %param_19.707145, %concatenate.pivot.60.177 ]
  %param_19.707188.1.off0 = phi i1 [ %137, %concatenate.pivot.0.172 ], [ %140, %concatenate.pivot.20.174 ], [ %140, %concatenate.pivot.40.175 ], [ %149, %concatenate.pivot.60.177 ]
  %151 = phi double [ %138, %concatenate.pivot.0.172 ], [ %143, %concatenate.pivot.20.174 ], [ %146, %concatenate.pivot.40.175 ], [ %150, %concatenate.pivot.60.177 ]
  %152 = icmp ult i32 %thread.id.2, 30
  %153 = zext nneg i32 %2 to i64
  %param_0.4101181 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg0440, i64 0, i64 %1, i64 %153
  %param_0.4101182 = load double, ptr addrspace(1) %param_0.4101181, align 16, !invariant.load !270
  %multiply.3069.1183 = fmul double %151, %param_0.4101182
  %add.3969.i324 = fadd double %multiply.3069.1183, 0.000000e+00
  br i1 %152, label %concatenate.pivot.20.241, label %concatenate.pivot.60.247

concatenate.pivot.20.241:                         ; preds = %concatenate.46.3.merge115
  %154 = icmp ult i32 %thread.id.2, 10
  br i1 %154, label %concatenate.pivot.0.242, label %concatenate.pivot.40.243

concatenate.pivot.0.242:                          ; preds = %concatenate.pivot.20.241
  %param_18.673189 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg18476, i64 0, i64 %1, i64 %153
  %param_25.1024193 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg25490, i64 0, i64 %1, i64 %153
  br label %concatenate.44.5.clone.1.merge185

concatenate.pivot.40.243:                         ; preds = %concatenate.pivot.20.241
  %155 = icmp ult i32 %thread.id.2, 20
  br i1 %155, label %concatenate.pivot.20.244, label %concatenate.pivot.40.245

concatenate.pivot.20.244:                         ; preds = %concatenate.pivot.40.243
  %156 = add nsw i32 %2, -20
  %157 = zext nneg i32 %156 to i64
  %param_15.469198 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg15470, i64 0, i64 %1, i64 %157
  %param_24.1101202 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg24488, i64 0, i64 %1, i64 %157
  br label %concatenate.44.5.clone.1.merge185

concatenate.pivot.40.245:                         ; preds = %concatenate.pivot.40.243
  %158 = add nsw i32 %2, -40
  %159 = zext nneg i32 %158 to i64
  %param_12.662207 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg12464, i64 0, i64 %1, i64 %159
  %param_23.1108211 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg23486, i64 0, i64 %1, i64 %159
  br label %concatenate.44.5.clone.1.merge185

concatenate.pivot.60.247:                         ; preds = %concatenate.46.3.merge115
  %160 = add nsw i32 %2, -60
  %161 = zext nneg i32 %160 to i64
  %param_9.1028216 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9458, i64 0, i64 %1, i64 %161
  %param_22.1287220 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg22484, i64 0, i64 %1, i64 %161
  br label %concatenate.44.5.clone.1.merge185

concatenate.44.5.clone.1.merge185:                ; preds = %concatenate.pivot.60.247, %concatenate.pivot.40.245, %concatenate.pivot.20.244, %concatenate.pivot.0.242
  %param_22.1287220.sink = phi ptr addrspace(1) [ %param_22.1287220, %concatenate.pivot.60.247 ], [ %param_23.1108211, %concatenate.pivot.40.245 ], [ %param_24.1101202, %concatenate.pivot.20.244 ], [ %param_25.1024193, %concatenate.pivot.0.242 ]
  %param_9.1028217.sink.in = phi ptr addrspace(1) [ %param_9.1028216, %concatenate.pivot.60.247 ], [ %param_12.662207, %concatenate.pivot.40.245 ], [ %param_15.469198, %concatenate.pivot.20.244 ], [ %param_18.673189, %concatenate.pivot.0.242 ]
  %162 = icmp ult i32 %thread.id.2, 30
  %param_9.1028217.sink = load double, ptr addrspace(1) %param_9.1028217.sink.in, align 8, !invariant.load !270
  %param_22.1287221 = load double, ptr addrspace(1) %param_22.1287220.sink, align 8, !invariant.load !270
  %163 = select i1 %param_19.707188.1.off0, double %param_9.1028217.sink, double %param_22.1287221
  %multiply.3068.1.clone.1253 = fmul double %param_0.4101182, %163
  %add.3969.i325 = fadd double %multiply.3068.1.clone.1253, 0.000000e+00
  %164 = or disjoint i32 %2, 1
  br i1 %162, label %concatenate.pivot.20.171.1, label %concatenate.pivot.60.177.1

concatenate.pivot.60.177.1:                       ; preds = %concatenate.44.5.clone.1.merge185
  %165 = add nsw i32 %2, -59
  br label %concatenate.46.3.merge115.1

concatenate.pivot.20.171.1:                       ; preds = %concatenate.44.5.clone.1.merge185
  %166 = icmp ult i32 %thread.id.2, 10
  br i1 %166, label %concatenate.46.3.merge115.1, label %concatenate.pivot.40.173.1

concatenate.pivot.40.173.1:                       ; preds = %concatenate.pivot.20.171.1
  %167 = icmp ult i32 %thread.id.2, 20
  br i1 %167, label %concatenate.pivot.20.174.1, label %concatenate.pivot.40.175.1

concatenate.pivot.40.175.1:                       ; preds = %concatenate.pivot.40.173.1
  %168 = add nsw i32 %2, -39
  br label %concatenate.46.3.merge115.1

concatenate.pivot.20.174.1:                       ; preds = %concatenate.pivot.40.173.1
  %169 = add nsw i32 %2, -19
  br label %concatenate.46.3.merge115.1

concatenate.46.3.merge115.1:                      ; preds = %concatenate.pivot.20.171.1, %concatenate.pivot.20.174.1, %concatenate.pivot.40.175.1, %concatenate.pivot.60.177.1
  %.sink439 = phi i32 [ %169, %concatenate.pivot.20.174.1 ], [ %168, %concatenate.pivot.40.175.1 ], [ %165, %concatenate.pivot.60.177.1 ], [ %164, %concatenate.pivot.20.171.1 ]
  %arg16.sink = phi ptr addrspace(1) [ %arg13466, %concatenate.pivot.20.174.1 ], [ %arg10460, %concatenate.pivot.40.175.1 ], [ %arg7454, %concatenate.pivot.60.177.1 ], [ %arg16472, %concatenate.pivot.20.171.1 ]
  %arg18.sink = phi ptr addrspace(1) [ %arg15470, %concatenate.pivot.20.174.1 ], [ %arg12464, %concatenate.pivot.40.175.1 ], [ %arg9458, %concatenate.pivot.60.177.1 ], [ %arg18476, %concatenate.pivot.20.171.1 ]
  %170 = icmp ult i32 %thread.id.2, 30
  %171 = zext nneg i32 %.sink439 to i64
  %param_16.492119.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg16.sink, i64 0, i64 %1, i64 %171
  %param_16.492120.1 = load double, ptr addrspace(1) %param_16.492119.1, align 8, !invariant.load !270
  %param_18.673123.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg18.sink, i64 0, i64 %1, i64 %171
  %param_18.673124.1 = load double, ptr addrspace(1) %param_18.673123.1, align 8, !invariant.load !270
  %172 = select i1 %param_19.707188.1.off0, double %param_16.492120.1, double %param_18.673124.1
  %param_0.4101181.1505 = getelementptr inbounds i8, ptr addrspace(1) %param_0.4101181, i64 8
  %param_0.4101182.1 = load double, ptr addrspace(1) %param_0.4101181.1505, align 8, !invariant.load !270
  %multiply.3069.1183.1 = fmul double %172, %param_0.4101182.1
  %add.3969.i324.1 = fadd double %add.3969.i324, %multiply.3069.1183.1
  br i1 %170, label %concatenate.pivot.20.241.1, label %concatenate.pivot.60.247.1

concatenate.pivot.60.247.1:                       ; preds = %concatenate.46.3.merge115.1
  %173 = add nsw i32 %2, -59
  %174 = zext nneg i32 %173 to i64
  %param_9.1028216.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9458, i64 0, i64 %1, i64 %174
  %param_22.1287220.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg22484, i64 0, i64 %1, i64 %174
  br label %concatenate.44.5.clone.1.merge185.1

concatenate.pivot.20.241.1:                       ; preds = %concatenate.46.3.merge115.1
  %175 = icmp ult i32 %thread.id.2, 10
  br i1 %175, label %concatenate.pivot.0.242.1, label %concatenate.pivot.40.243.1

concatenate.pivot.40.243.1:                       ; preds = %concatenate.pivot.20.241.1
  %176 = icmp ult i32 %thread.id.2, 20
  br i1 %176, label %concatenate.pivot.20.244.1, label %concatenate.pivot.40.245.1

concatenate.pivot.40.245.1:                       ; preds = %concatenate.pivot.40.243.1
  %177 = add nsw i32 %2, -39
  %178 = zext nneg i32 %177 to i64
  %param_12.662207.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg12464, i64 0, i64 %1, i64 %178
  %param_23.1108211.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg23486, i64 0, i64 %1, i64 %178
  br label %concatenate.44.5.clone.1.merge185.1

concatenate.pivot.20.244.1:                       ; preds = %concatenate.pivot.40.243.1
  %179 = add nsw i32 %2, -19
  %180 = zext nneg i32 %179 to i64
  %param_15.469198.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg15470, i64 0, i64 %1, i64 %180
  %param_24.1101202.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg24488, i64 0, i64 %1, i64 %180
  br label %concatenate.44.5.clone.1.merge185.1

concatenate.pivot.0.242.1:                        ; preds = %concatenate.pivot.20.241.1
  %181 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg18476, i64 0, i64 %1, i64 %153
  %param_18.673189.1506 = getelementptr inbounds i8, ptr addrspace(1) %181, i64 8
  %182 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg25490, i64 0, i64 %1, i64 %153
  %param_25.1024193.1507 = getelementptr inbounds i8, ptr addrspace(1) %182, i64 8
  br label %concatenate.44.5.clone.1.merge185.1

concatenate.44.5.clone.1.merge185.1:              ; preds = %concatenate.pivot.0.242.1, %concatenate.pivot.20.244.1, %concatenate.pivot.40.245.1, %concatenate.pivot.60.247.1
  %param_25.1024193.1.sink = phi ptr addrspace(1) [ %param_25.1024193.1507, %concatenate.pivot.0.242.1 ], [ %param_24.1101202.1, %concatenate.pivot.20.244.1 ], [ %param_23.1108211.1, %concatenate.pivot.40.245.1 ], [ %param_22.1287220.1, %concatenate.pivot.60.247.1 ]
  %param_18.673190.1.sink.in = phi ptr addrspace(1) [ %param_18.673189.1506, %concatenate.pivot.0.242.1 ], [ %param_15.469198.1, %concatenate.pivot.20.244.1 ], [ %param_12.662207.1, %concatenate.pivot.40.245.1 ], [ %param_9.1028216.1, %concatenate.pivot.60.247.1 ]
  %param_18.673190.1.sink = load double, ptr addrspace(1) %param_18.673190.1.sink.in, align 8, !invariant.load !270
  %param_25.1024194.1 = load double, ptr addrspace(1) %param_25.1024193.1.sink, align 8, !invariant.load !270
  %183 = select i1 %param_19.707188.1.off0, double %param_18.673190.1.sink, double %param_25.1024194.1
  %multiply.3068.1.clone.1253.1 = fmul double %param_0.4101182.1, %183
  %add.3969.i325.1 = fadd double %add.3969.i325, %multiply.3068.1.clone.1253.1
  %184 = or i32 %thread.id.x, 32
  %185 = icmp ult i32 %184, 60
  br i1 %185, label %loop3.loop_header110.preheader.1, label %x_in_tile-after.7

intra_warp_reduce_write-after:                    ; preds = %x_in_tile-after.7, %intra_warp_reduce_write-true
  %186 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %187 = zext nneg i32 %thread.id.2 to i64
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg26492, i64 0, i64 %1
  %188 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache8, i64 0, i64 %1, i64 %187
  br i1 %186, label %reduction_write_output-true, label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i318, ptr addrspace(3) %131, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %188, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %thread_in_bounds-after

intra_warp_reduce_write-after287:                 ; preds = %intra_warp_reduce_write-true286, %thread_in_bounds-after
  %189 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address293 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg27494, i64 0, i64 %1
  %190 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache9, i64 0, i64 %1, i64 %187
  br i1 %189, label %reduction_write_output-true291, label %reduce-group-0-after

intra_warp_reduce_write-true286:                  ; preds = %thread_in_bounds-after
  store double %add.3969.i323, ptr addrspace(3) %42, align 8
  br label %intra_warp_reduce_write-after287

reduction_write_output-true291:                   ; preds = %intra_warp_reduce_write-after287
  %output294.then.val = load double, ptr addrspace(3) %190, align 8
  store double %output294.then.val, ptr addrspace(1) %output_element_address293, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_5(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture align 128 dereferenceable(320) %arg7, ptr noalias nocapture align 128 dereferenceable(320) %arg8, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture align 128 dereferenceable(320) %arg11, ptr noalias nocapture align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg14, ptr noalias nocapture align 128 dereferenceable(320) %arg15, ptr noalias nocapture align 128 dereferenceable(320) %arg16, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture align 128 dereferenceable(320) %arg19, ptr noalias nocapture align 128 dereferenceable(320) %arg20, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture align 128 dereferenceable(320) %arg23, ptr noalias nocapture align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg26, ptr noalias nocapture align 128 dereferenceable(320) %arg27, ptr noalias nocapture align 128 dereferenceable(320) %arg28, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg30, ptr noalias nocapture align 128 dereferenceable(320) %arg31, ptr noalias nocapture align 128 dereferenceable(320) %arg32, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg34, ptr noalias nocapture align 128 dereferenceable(320) %arg35, ptr noalias nocapture align 128 dereferenceable(320) %arg36, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg37, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg38, ptr noalias nocapture align 128 dereferenceable(320) %arg39, ptr noalias nocapture align 128 dereferenceable(320) %arg40, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg42, ptr noalias nocapture align 128 dereferenceable(320) %arg43, ptr noalias nocapture align 128 dereferenceable(320) %arg44, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg45, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg46, ptr noalias nocapture align 128 dereferenceable(320) %arg47, ptr noalias nocapture align 128 dereferenceable(320) %arg48, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg49, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg50, ptr noalias nocapture align 128 dereferenceable(320) %arg51, ptr noalias nocapture align 128 dereferenceable(320) %arg52, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg54, ptr noalias nocapture align 128 dereferenceable(320) %arg55, ptr noalias nocapture align 128 dereferenceable(320) %arg56, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg57, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg58, ptr noalias nocapture align 128 dereferenceable(320) %arg59, ptr noalias nocapture align 128 dereferenceable(320) %arg60, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg61, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg62, ptr noalias nocapture align 128 dereferenceable(320) %arg63) local_unnamed_addr #2 {
entry:
  %arg63134 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg61130 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60128 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59126 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58124 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg56120 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55118 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54116 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg52112 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51110 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg49106 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48104 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47102 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46100 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg4496 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg4394 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg4292 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg4088 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg3986 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg3782 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg3680 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3578 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg3476 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3272 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg3170 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3068 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2864 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2762 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2558 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2456 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2354 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2252 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1946 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1538 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1334 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1232 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1130 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg722 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg620, i64 0, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = icmp sgt i64 %3, 9
  %5 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg518, i64 0, i64 %1
  %6 = load i8, ptr addrspace(1) %5, align 1, !invariant.load !270
  %7 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg416, i64 0, i64 %1
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !270
  %9 = or i8 %8, %6
  %10 = trunc i8 %9 to i1
  %.not1 = or i1 %4, %10
  %11 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg314, i64 0, i64 %1
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !270
  %13 = zext nneg i32 %0 to i64
  %14 = getelementptr double, ptr addrspace(1) %arg110, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !270
  %16 = trunc i8 %12 to i1
  %17 = getelementptr double, ptr addrspace(1) %arg02, i64 %13
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = select i1 %16, double %15, double %18
  %20 = select i1 %.not1, double %18, double %19
  %21 = getelementptr double, ptr addrspace(1) %arg722, i64 %13
  %22 = load double, ptr addrspace(1) %21, align 8
  %23 = select i1 %.not1, i1 true, i1 %16
  %24 = select i1 %23, double %22, double %15
  %25 = getelementptr double, ptr addrspace(1) %arg824, i64 %13
  %26 = load double, ptr addrspace(1) %25, align 8
  %27 = getelementptr double, ptr addrspace(1) %arg1028, i64 %13
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !270
  %29 = select i1 %23, double %26, double %28
  %30 = getelementptr double, ptr addrspace(1) %arg1130, i64 %13
  %31 = load double, ptr addrspace(1) %30, align 8
  %32 = select i1 %16, double %28, double %31
  %33 = select i1 %.not1, double %31, double %32
  %34 = getelementptr double, ptr addrspace(1) %arg1334, i64 %13
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !270
  %36 = getelementptr double, ptr addrspace(1) %arg1232, i64 %13
  %37 = load double, ptr addrspace(1) %36, align 8
  %38 = select i1 %16, double %35, double %37
  %39 = select i1 %.not1, double %37, double %38
  %40 = getelementptr double, ptr addrspace(1) %arg1538, i64 %13
  %41 = load double, ptr addrspace(1) %40, align 8
  %42 = select i1 %23, double %41, double %35
  %43 = getelementptr double, ptr addrspace(1) %arg1640, i64 %13
  %44 = load double, ptr addrspace(1) %43, align 8
  %45 = getelementptr double, ptr addrspace(1) %arg1844, i64 %13
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !270
  %47 = select i1 %23, double %44, double %46
  %48 = getelementptr double, ptr addrspace(1) %arg1946, i64 %13
  %49 = load double, ptr addrspace(1) %48, align 8
  %50 = select i1 %16, double %46, double %49
  %51 = select i1 %.not1, double %49, double %50
  %52 = getelementptr double, ptr addrspace(1) %arg2048, i64 %13
  %53 = load double, ptr addrspace(1) %52, align 8
  %54 = getelementptr double, ptr addrspace(1) %arg2252, i64 %13
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !270
  %56 = select i1 %23, double %53, double %55
  %57 = getelementptr double, ptr addrspace(1) %arg2354, i64 %13
  %58 = load double, ptr addrspace(1) %57, align 8
  %59 = select i1 %16, double %55, double %58
  %60 = select i1 %.not1, double %58, double %59
  %61 = getelementptr double, ptr addrspace(1) %arg2558, i64 %13
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !270
  %63 = getelementptr double, ptr addrspace(1) %arg2456, i64 %13
  %64 = load double, ptr addrspace(1) %63, align 8
  %65 = select i1 %16, double %62, double %64
  %66 = select i1 %.not1, double %64, double %65
  %67 = getelementptr double, ptr addrspace(1) %arg2762, i64 %13
  %68 = load double, ptr addrspace(1) %67, align 8
  %69 = select i1 %23, double %68, double %62
  %70 = getelementptr double, ptr addrspace(1) %arg2864, i64 %13
  %71 = load double, ptr addrspace(1) %70, align 8
  %72 = getelementptr double, ptr addrspace(1) %arg3068, i64 %13
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !270
  %74 = select i1 %23, double %71, double %73
  %75 = getelementptr double, ptr addrspace(1) %arg3170, i64 %13
  %76 = load double, ptr addrspace(1) %75, align 8
  %77 = select i1 %16, double %73, double %76
  %78 = select i1 %.not1, double %76, double %77
  %79 = getelementptr double, ptr addrspace(1) %arg3272, i64 %13
  %80 = load double, ptr addrspace(1) %79, align 8
  %81 = getelementptr double, ptr addrspace(1) %arg3476, i64 %13
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !270
  %83 = select i1 %23, double %80, double %82
  %84 = getelementptr double, ptr addrspace(1) %arg3578, i64 %13
  %85 = load double, ptr addrspace(1) %84, align 8
  %86 = select i1 %16, double %82, double %85
  %87 = select i1 %.not1, double %85, double %86
  %88 = getelementptr double, ptr addrspace(1) %arg3782, i64 %13
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !270
  %90 = getelementptr double, ptr addrspace(1) %arg3680, i64 %13
  %91 = load double, ptr addrspace(1) %90, align 8
  %92 = select i1 %16, double %89, double %91
  %93 = select i1 %.not1, double %91, double %92
  %94 = getelementptr double, ptr addrspace(1) %arg3986, i64 %13
  %95 = load double, ptr addrspace(1) %94, align 8
  %96 = select i1 %23, double %95, double %89
  %97 = getelementptr double, ptr addrspace(1) %arg4088, i64 %13
  %98 = load double, ptr addrspace(1) %97, align 8
  %99 = getelementptr double, ptr addrspace(1) %arg4292, i64 %13
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !270
  %101 = select i1 %23, double %98, double %100
  %102 = getelementptr double, ptr addrspace(1) %arg4394, i64 %13
  %103 = load double, ptr addrspace(1) %102, align 8
  %104 = select i1 %16, double %100, double %103
  %105 = select i1 %.not1, double %103, double %104
  %106 = getelementptr double, ptr addrspace(1) %arg4496, i64 %13
  %107 = load double, ptr addrspace(1) %106, align 8
  %108 = getelementptr double, ptr addrspace(1) %arg46100, i64 %13
  %109 = load double, ptr addrspace(1) %108, align 8, !invariant.load !270
  %110 = select i1 %23, double %107, double %109
  %111 = getelementptr double, ptr addrspace(1) %arg47102, i64 %13
  %112 = load double, ptr addrspace(1) %111, align 8
  %113 = select i1 %16, double %109, double %112
  %114 = select i1 %.not1, double %112, double %113
  %115 = getelementptr double, ptr addrspace(1) %arg49106, i64 %13
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !270
  %117 = getelementptr double, ptr addrspace(1) %arg48104, i64 %13
  %118 = load double, ptr addrspace(1) %117, align 8
  %119 = select i1 %16, double %116, double %118
  %120 = select i1 %.not1, double %118, double %119
  %121 = getelementptr double, ptr addrspace(1) %arg51110, i64 %13
  %122 = load double, ptr addrspace(1) %121, align 8
  %123 = select i1 %23, double %122, double %116
  %124 = getelementptr double, ptr addrspace(1) %arg52112, i64 %13
  %125 = load double, ptr addrspace(1) %124, align 8
  %126 = getelementptr double, ptr addrspace(1) %arg54116, i64 %13
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !270
  %128 = select i1 %23, double %125, double %127
  %129 = getelementptr double, ptr addrspace(1) %arg55118, i64 %13
  %130 = load double, ptr addrspace(1) %129, align 8
  %131 = select i1 %16, double %127, double %130
  %132 = select i1 %.not1, double %130, double %131
  %133 = getelementptr double, ptr addrspace(1) %arg56120, i64 %13
  %134 = load double, ptr addrspace(1) %133, align 8
  %135 = getelementptr double, ptr addrspace(1) %arg58124, i64 %13
  %136 = load double, ptr addrspace(1) %135, align 8, !invariant.load !270
  %137 = select i1 %23, double %134, double %136
  %138 = getelementptr double, ptr addrspace(1) %arg59126, i64 %13
  %139 = load double, ptr addrspace(1) %138, align 8
  %140 = select i1 %16, double %136, double %139
  %141 = select i1 %.not1, double %139, double %140
  %142 = getelementptr double, ptr addrspace(1) %arg61130, i64 %13
  %143 = load double, ptr addrspace(1) %142, align 8, !invariant.load !270
  %144 = getelementptr double, ptr addrspace(1) %arg60128, i64 %13
  %145 = load double, ptr addrspace(1) %144, align 8
  %146 = select i1 %16, double %143, double %145
  %147 = select i1 %.not1, double %145, double %146
  %148 = getelementptr double, ptr addrspace(1) %arg63134, i64 %13
  %149 = load double, ptr addrspace(1) %148, align 8
  %150 = select i1 %23, double %149, double %143
  store double %20, ptr addrspace(1) %17, align 8
  store double %24, ptr addrspace(1) %21, align 8
  store double %29, ptr addrspace(1) %25, align 8
  store double %33, ptr addrspace(1) %30, align 8
  store double %39, ptr addrspace(1) %36, align 8
  store double %42, ptr addrspace(1) %40, align 8
  store double %47, ptr addrspace(1) %43, align 8
  store double %51, ptr addrspace(1) %48, align 8
  store double %56, ptr addrspace(1) %52, align 8
  store double %60, ptr addrspace(1) %57, align 8
  store double %66, ptr addrspace(1) %63, align 8
  store double %69, ptr addrspace(1) %67, align 8
  store double %74, ptr addrspace(1) %70, align 8
  store double %78, ptr addrspace(1) %75, align 8
  store double %83, ptr addrspace(1) %79, align 8
  store double %87, ptr addrspace(1) %84, align 8
  store double %93, ptr addrspace(1) %90, align 8
  store double %96, ptr addrspace(1) %94, align 8
  store double %101, ptr addrspace(1) %97, align 8
  store double %105, ptr addrspace(1) %102, align 8
  store double %110, ptr addrspace(1) %106, align 8
  store double %114, ptr addrspace(1) %111, align 8
  store double %120, ptr addrspace(1) %117, align 8
  store double %123, ptr addrspace(1) %121, align 8
  store double %128, ptr addrspace(1) %124, align 8
  store double %132, ptr addrspace(1) %129, align 8
  store double %137, ptr addrspace(1) %133, align 8
  store double %141, ptr addrspace(1) %138, align 8
  store double %147, ptr addrspace(1) %144, align 8
  store double %150, ptr addrspace(1) %148, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg0, ptr noalias nocapture align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg5, ptr noalias nocapture align 128 dereferenceable(19200) %arg6) local_unnamed_addr #2 {
entry:
  %arg614 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !288
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_select_fusion.4.in_bounds-true, label %loop_select_fusion.4.in_bounds-after

loop_select_fusion.4.in_bounds-after:             ; preds = %loop_select_fusion.4.in_bounds-true, %entry
  ret void

loop_select_fusion.4.in_bounds-true:              ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 1199
  %4 = zext i1 %.cmp to i64
  %5 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg410, i64 0, i64 %4
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = icmp sgt i64 %6, 9
  %8 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg38, i64 0, i64 %4
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !270
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg26, i64 0, i64 %4
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !270
  %12 = or i8 %11, %9
  %13 = trunc i8 %12 to i1
  %.not1 = or i1 %7, %13
  %14 = zext nneg i32 %linear_index to i64
  %15 = getelementptr double, ptr addrspace(1) %arg02, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !270
  %17 = getelementptr double, ptr addrspace(1) %arg14, i64 %14
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = select i1 %.not1, double %18, double %16
  %20 = getelementptr double, ptr addrspace(1) %arg512, i64 %14
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !270
  %22 = getelementptr double, ptr addrspace(1) %arg614, i64 %14
  %23 = load double, ptr addrspace(1) %22, align 8
  %24 = select i1 %.not1, double %23, double %21
  store double %19, ptr addrspace(1) %17, align 8
  store double %24, ptr addrspace(1) %22, align 8
  br label %loop_select_fusion.4.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture align 128 dereferenceable(16) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg8, ptr noalias nocapture align 128 dereferenceable(16) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg10, ptr noalias nocapture align 128 dereferenceable(16) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(48) %arg13, ptr noalias nocapture align 128 dereferenceable(16) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg16, ptr noalias nocapture align 128 dereferenceable(16) %arg17, ptr noalias nocapture readnone align 128 dereferenceable(16) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg19, ptr noalias nocapture align 128 dereferenceable(16) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture align 128 dereferenceable(8) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg23, ptr noalias nocapture align 128 dereferenceable(8) %arg24, ptr noalias nocapture align 128 dereferenceable(16) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg30) local_unnamed_addr #2 {
entry:
  %arg30126 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29124 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28122 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27120 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26118 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25116 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24114 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23112 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22110 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21108 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20106 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19104 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg17100 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1698 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1596 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1494 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1392 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1290 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1188 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1086 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg984 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg882 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg780 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg678 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg576 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg474 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg372 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg270 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg168 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg066 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg576, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = getelementptr i8, ptr addrspace(1) %arg474, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !270
  %6 = getelementptr i8, ptr addrspace(1) %arg066, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !270
  %8 = getelementptr i8, ptr addrspace(1) %arg168, i64 %1
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !270
  %10 = getelementptr double, ptr addrspace(1) %arg372, i64 %1
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %12 = getelementptr double, ptr addrspace(1) %arg270, i64 %1
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !270
  %14 = getelementptr i8, ptr addrspace(1) %arg882, i64 %1
  %15 = load i8, ptr addrspace(1) %14, align 1, !invariant.load !270
  %16 = getelementptr [2 x [6 x i32]], ptr addrspace(1) %arg1392, i64 0, i64 %1, i64 0
  %17 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 16
  %18 = load <2 x i32>, ptr addrspace(1) %17, align 8, !invariant.load !270
  %19 = extractelement <2 x i32> %18, i32 0
  %20 = extractelement <2 x i32> %18, i32 1
  %21 = getelementptr double, ptr addrspace(1) %arg1290, i64 %1
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !270
  %23 = getelementptr double, ptr addrspace(1) %arg1188, i64 %1
  %24 = load double, ptr addrspace(1) %23, align 8
  %subtract.236.5.clone.1 = fsub double %22, %24
  %25 = tail call double @llvm.fma.f64(double %subtract.236.5.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #12
  %27 = tail call double @llvm.nvvm.add.rn.d(double %25, double 0xC338000000000000) #12
  %28 = tail call double @llvm.fma.f64(double %27, double 0xBFE62E42FEFA39EF, double %subtract.236.5.clone.1)
  %29 = tail call double @llvm.fma.f64(double %27, double 0xBC7ABC9E3B39803F, double %28)
  %30 = tail call double @llvm.fma.f64(double %29, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %31 = tail call double @llvm.fma.f64(double %30, double %29, double 0x3EC71DEE62401315)
  %32 = tail call double @llvm.fma.f64(double %31, double %29, double 0x3EFA01997C89EB71)
  %33 = tail call double @llvm.fma.f64(double %32, double %29, double 0x3F2A01A014761F65)
  %34 = tail call double @llvm.fma.f64(double %33, double %29, double 0x3F56C16C1852B7AF)
  %35 = tail call double @llvm.fma.f64(double %34, double %29, double 0x3F81111111122322)
  %36 = tail call double @llvm.fma.f64(double %35, double %29, double 0x3FA55555555502A1)
  %37 = tail call double @llvm.fma.f64(double %36, double %29, double 0x3FC5555555555511)
  %38 = tail call double @llvm.fma.f64(double %37, double %29, double 0x3FE000000000000B)
  %39 = tail call double @llvm.fma.f64(double %38, double %29, double 1.000000e+00)
  %40 = tail call double @llvm.fma.f64(double %39, double %29, double 1.000000e+00)
  %41 = tail call i32 @llvm.nvvm.d2i.lo(double %40) #12
  %42 = tail call i32 @llvm.nvvm.d2i.hi(double %40) #12
  %43 = shl i32 %26, 20
  %44 = add i32 %42, %43
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 %41, i32 %44) #12
  %46 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.236.5.clone.1) #12
  %47 = bitcast i32 %46 to float
  %48 = tail call float @llvm.nvvm.fabs.f(float %47) #12
  %49 = fcmp olt float %48, 0x4010C46560000000
  br i1 %49, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %50 = fcmp olt double %subtract.236.5.clone.1, 0.000000e+00
  %51 = fadd double %subtract.236.5.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %50, double 0.000000e+00, double %51
  %52 = fcmp olt float %48, 0x4010E90000000000
  br i1 %52, label %53, label %__nv_exp.exit

53:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %54 = sdiv i32 %26, 2
  %55 = shl i32 %54, 20
  %56 = add i32 %42, %55
  %57 = tail call double @llvm.nvvm.lohi.i2d(i32 %41, i32 %56) #12
  %58 = sub nsw i32 %26, %54
  %59 = shl i32 %58, 20
  %60 = add nsw i32 %59, 1072693248
  %61 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %60) #12
  %62 = fmul double %61, %57
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %53
  %z.2.i = phi double [ %45, %entry ], [ %62, %53 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %63 = getelementptr double, ptr addrspace(1) %arg678, i64 %1
  %64 = load double, ptr addrspace(1) %63, align 8
  %65 = getelementptr double, ptr addrspace(1) %arg780, i64 %1
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !270
  %67 = getelementptr double, ptr addrspace(1) %arg984, i64 %1
  %68 = load double, ptr addrspace(1) %67, align 8
  %69 = getelementptr double, ptr addrspace(1) %arg1086, i64 %1
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !270
  %subtract.237.1.clone.1 = fsub double %24, %22
  %71 = tail call double @llvm.fabs.f64(double %subtract.237.1.clone.1)
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %72, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %74 = tail call i32 @llvm.nvvm.d2i.lo(double %73) #12
  %75 = tail call double @llvm.nvvm.add.rn.d(double %73, double 0xC338000000000000) #12
  %76 = tail call double @llvm.fma.f64(double %75, double 0xBFE62E42FEFA39EF, double %72)
  %77 = tail call double @llvm.fma.f64(double %75, double 0xBC7ABC9E3B39803F, double %76)
  %78 = tail call double @llvm.fma.f64(double %77, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %79 = tail call double @llvm.fma.f64(double %78, double %77, double 0x3EC71DEE62401315)
  %80 = tail call double @llvm.fma.f64(double %79, double %77, double 0x3EFA01997C89EB71)
  %81 = tail call double @llvm.fma.f64(double %80, double %77, double 0x3F2A01A014761F65)
  %82 = tail call double @llvm.fma.f64(double %81, double %77, double 0x3F56C16C1852B7AF)
  %83 = tail call double @llvm.fma.f64(double %82, double %77, double 0x3F81111111122322)
  %84 = tail call double @llvm.fma.f64(double %83, double %77, double 0x3FA55555555502A1)
  %85 = tail call double @llvm.fma.f64(double %84, double %77, double 0x3FC5555555555511)
  %86 = tail call double @llvm.fma.f64(double %85, double %77, double 0x3FE000000000000B)
  %87 = tail call double @llvm.fma.f64(double %86, double %77, double 1.000000e+00)
  %88 = tail call double @llvm.fma.f64(double %87, double %77, double 1.000000e+00)
  %89 = tail call i32 @llvm.nvvm.d2i.lo(double %88) #12
  %90 = tail call i32 @llvm.nvvm.d2i.hi(double %88) #12
  %91 = shl i32 %74, 20
  %92 = add i32 %90, %91
  %93 = tail call double @llvm.nvvm.lohi.i2d(i32 %89, i32 %92) #12
  %94 = tail call i32 @llvm.nvvm.d2i.hi(double %72) #12
  %95 = bitcast i32 %94 to float
  %96 = tail call float @llvm.nvvm.fabs.f(float %95) #12
  %97 = fcmp olt float %96, 0x4010C46560000000
  br i1 %97, label %__nv_exp.exit58, label %__internal_fast_icmp_abs_lt.exit.i55

__internal_fast_icmp_abs_lt.exit.i55:             ; preds = %__nv_exp.exit
  %98 = fcmp one double %subtract.237.1.clone.1, 0.000000e+00
  %99 = fsub double 0x7FF0000000000000, %71
  %z.0.i56 = select i1 %98, double 0.000000e+00, double %99
  %100 = fcmp olt float %96, 0x4010E90000000000
  br i1 %100, label %101, label %__nv_exp.exit58

101:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i55
  %102 = sdiv i32 %74, 2
  %103 = shl i32 %102, 20
  %104 = add i32 %90, %103
  %105 = tail call double @llvm.nvvm.lohi.i2d(i32 %89, i32 %104) #12
  %106 = sub nsw i32 %74, %102
  %107 = shl i32 %106, 20
  %108 = add nsw i32 %107, 1072693248
  %109 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %108) #12
  %110 = fmul double %109, %105
  br label %__nv_exp.exit58

__nv_exp.exit58:                                  ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i55, %101
  %z.2.i57 = phi double [ %93, %__nv_exp.exit ], [ %110, %101 ], [ %z.0.i56, %__internal_fast_icmp_abs_lt.exit.i55 ]
  %111 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i57) #12
  %112 = bitcast i32 %111 to float
  %113 = fcmp olt float %112, 0x3FFCAAAAA0000000
  %114 = fcmp ogt float %112, 0xBFFB333320000000
  %or.cond.i = and i1 %113, %114
  br i1 %or.cond.i, label %115, label %132

115:                                              ; preds = %__nv_exp.exit58
  %116 = fadd double %z.2.i57, 2.000000e+00
  %117 = fdiv double %z.2.i57, %116
  %118 = fneg double %z.2.i57
  %119 = fmul double %117, %118
  %120 = fadd double %z.2.i57, %119
  %121 = fmul double %120, %120
  %122 = tail call double @llvm.fma.f64(double %121, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %123 = tail call double @llvm.fma.f64(double %122, double %121, double 0x3EF3B9FF890F468C)
  %124 = tail call double @llvm.fma.f64(double %123, double %121, double 0x3F17457EFD51BAF8)
  %125 = tail call double @llvm.fma.f64(double %124, double %121, double 0x3F3C71C8DE3CE825)
  %126 = tail call double @llvm.fma.f64(double %125, double %121, double 0x3F6249248FA4661F)
  %127 = tail call double @llvm.fma.f64(double %126, double %121, double 0x3F899999999D70C4)
  %128 = tail call double @llvm.fma.f64(double %127, double %121, double 0x3FB5555555555462)
  %129 = fmul double %121, %128
  %130 = tail call double @llvm.fma.f64(double %129, double %120, double %119)
  %131 = fadd double %z.2.i57, %130
  br label %__nv_log1p.exit

132:                                              ; preds = %__nv_exp.exit58
  %133 = fadd double %z.2.i57, 1.000000e+00
  %134 = tail call i32 @llvm.nvvm.d2i.hi(double %133) #12
  %135 = tail call i32 @llvm.nvvm.d2i.lo(double %133) #12
  %136 = icmp slt i32 %134, 1048576
  %137 = fmul double %133, 0x4350000000000000
  %138 = tail call i32 @llvm.nvvm.d2i.lo(double %137) #12
  %139 = tail call i32 @llvm.nvvm.d2i.hi(double %137) #12
  br i1 %136, label %140, label %141

140:                                              ; preds = %132
  br label %141

141:                                              ; preds = %140, %132
  %.0.i = phi double [ %137, %140 ], [ %133, %132 ]
  %ihi.i.0.i = phi i32 [ %139, %140 ], [ %134, %132 ]
  %ilo.i.0.i = phi i32 [ %138, %140 ], [ %135, %132 ]
  %e.i.0.i = phi i32 [ -1077, %140 ], [ -1023, %132 ]
  %142 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %142, 2146435071
  br i1 %or.cond2.i, label %143, label %190

143:                                              ; preds = %141
  %144 = lshr i32 %ihi.i.0.i, 20
  %145 = add nsw i32 %e.i.0.i, %144
  %146 = and i32 %ihi.i.0.i, 1048575
  %147 = or disjoint i32 %146, 1072693248
  %148 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %147) #12
  %149 = icmp ugt i32 %147, 1073127582
  %150 = tail call i32 @llvm.nvvm.d2i.lo(double %148) #12
  %151 = tail call i32 @llvm.nvvm.d2i.hi(double %148) #12
  %152 = add i32 %151, -1048576
  %153 = tail call double @llvm.nvvm.lohi.i2d(i32 %150, i32 %152) #12
  %spec.select = select i1 %149, double %153, double %148
  %154 = zext i1 %149 to i32
  %spec.select63 = add nsw i32 %145, %154
  %155 = fadd double %spec.select, -1.000000e+00
  %156 = fadd double %spec.select, 1.000000e+00
  %157 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %156) #12
  %158 = fneg double %156
  %159 = tail call double @llvm.fma.f64(double %158, double %157, double 1.000000e+00)
  %160 = tail call double @llvm.fma.f64(double %159, double %159, double %159)
  %161 = tail call double @llvm.fma.f64(double %160, double %157, double %157)
  %162 = fmul double %155, %161
  %163 = fadd double %162, %162
  %164 = fmul double %163, %163
  %165 = tail call double @llvm.fma.f64(double %164, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %166 = tail call double @llvm.fma.f64(double %165, double %164, double 0x3EF3B2669F02676F)
  %167 = tail call double @llvm.fma.f64(double %166, double %164, double 0x3F1745CBA9AB0956)
  %168 = tail call double @llvm.fma.f64(double %167, double %164, double 0x3F3C71C72D1B5154)
  %169 = tail call double @llvm.fma.f64(double %168, double %164, double 0x3F624924923BE72D)
  %170 = tail call double @llvm.fma.f64(double %169, double %164, double 0x3F8999999999A3C4)
  %171 = tail call double @llvm.fma.f64(double %170, double %164, double 0x3FB5555555555554)
  %172 = fsub double %155, %163
  %173 = fmul double %172, 2.000000e+00
  %174 = fneg double %163
  %175 = tail call double @llvm.fma.f64(double %174, double %155, double %173)
  %176 = fmul double %161, %175
  %177 = fmul double %164, %171
  %178 = tail call double @llvm.fma.f64(double %177, double %163, double %176)
  %179 = xor i32 %spec.select63, -2147483648
  %180 = tail call double @llvm.nvvm.lohi.i2d(i32 %179, i32 1127219200) #12
  %181 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %182 = fsub double %180, %181
  %183 = tail call double @llvm.fma.f64(double %182, double 0x3FE62E42FEFA39EF, double %163)
  %184 = fneg double %182
  %185 = tail call double @llvm.fma.f64(double %184, double 0x3FE62E42FEFA39EF, double %183)
  %186 = fsub double %185, %163
  %187 = fsub double %178, %186
  %188 = tail call double @llvm.fma.f64(double %182, double 0x3C7ABC9E3B39803F, double %187)
  %189 = fadd double %183, %188
  br label %__nv_log1p.exit

190:                                              ; preds = %141
  %191 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %192 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %193 = and i32 %192, 2147483647
  %194 = icmp eq i32 %193, 0
  %q.i.0.i = select i1 %194, double 0xFFF0000000000000, double %191
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %115, %143, %190
  %t.0.i = phi double [ %131, %115 ], [ %189, %143 ], [ %q.i.0.i, %190 ]
  %195 = getelementptr i8, ptr addrspace(1) %arg1596, i64 %1
  %196 = load i8, ptr addrspace(1) %195, align 1, !invariant.load !270
  %197 = getelementptr i64, ptr addrspace(1) %arg1698, i64 %1
  %198 = load i64, ptr addrspace(1) %197, align 8, !invariant.load !270
  %199 = getelementptr i64, ptr addrspace(1) %arg1494, i64 %1
  %200 = load i64, ptr addrspace(1) %199, align 8
  %201 = getelementptr double, ptr addrspace(1) %arg17100, i64 %1
  %202 = load double, ptr addrspace(1) %201, align 8
  %203 = getelementptr double, ptr addrspace(1) %arg19104, i64 %1
  %204 = load double, ptr addrspace(1) %203, align 8, !invariant.load !270
  %205 = getelementptr double, ptr addrspace(1) %arg20106, i64 %1
  %206 = load double, ptr addrspace(1) %205, align 8
  %207 = getelementptr i32, ptr addrspace(1) %arg21108, i64 %1
  %208 = load i32, ptr addrspace(1) %207, align 4, !invariant.load !270
  %209 = getelementptr i32, ptr addrspace(1) %arg22110, i64 %1
  %210 = load i32, ptr addrspace(1) %209, align 4
  %211 = getelementptr i32, ptr addrspace(1) %arg23112, i64 %1
  %212 = load i32, ptr addrspace(1) %211, align 4, !invariant.load !270
  %213 = getelementptr i32, ptr addrspace(1) %arg24114, i64 %1
  %214 = load i32, ptr addrspace(1) %213, align 4
  %215 = getelementptr double, ptr addrspace(1) %arg25116, i64 %1
  %216 = load double, ptr addrspace(1) %215, align 8
  %217 = getelementptr double, ptr addrspace(1) %arg26118, i64 %1
  %218 = load double, ptr addrspace(1) %217, align 8, !invariant.load !270
  %subtract.238.1.clone.1 = fsub double %216, %218
  %219 = tail call double @llvm.fabs.f64(double %subtract.238.1.clone.1)
  %220 = fneg double %219
  %221 = tail call double @llvm.fma.f64(double %220, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %222 = tail call i32 @llvm.nvvm.d2i.lo(double %221) #12
  %223 = tail call double @llvm.nvvm.add.rn.d(double %221, double 0xC338000000000000) #12
  %224 = tail call double @llvm.fma.f64(double %223, double 0xBFE62E42FEFA39EF, double %220)
  %225 = tail call double @llvm.fma.f64(double %223, double 0xBC7ABC9E3B39803F, double %224)
  %226 = tail call double @llvm.fma.f64(double %225, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %227 = tail call double @llvm.fma.f64(double %226, double %225, double 0x3EC71DEE62401315)
  %228 = tail call double @llvm.fma.f64(double %227, double %225, double 0x3EFA01997C89EB71)
  %229 = tail call double @llvm.fma.f64(double %228, double %225, double 0x3F2A01A014761F65)
  %230 = tail call double @llvm.fma.f64(double %229, double %225, double 0x3F56C16C1852B7AF)
  %231 = tail call double @llvm.fma.f64(double %230, double %225, double 0x3F81111111122322)
  %232 = tail call double @llvm.fma.f64(double %231, double %225, double 0x3FA55555555502A1)
  %233 = tail call double @llvm.fma.f64(double %232, double %225, double 0x3FC5555555555511)
  %234 = tail call double @llvm.fma.f64(double %233, double %225, double 0x3FE000000000000B)
  %235 = tail call double @llvm.fma.f64(double %234, double %225, double 1.000000e+00)
  %236 = tail call double @llvm.fma.f64(double %235, double %225, double 1.000000e+00)
  %237 = tail call i32 @llvm.nvvm.d2i.lo(double %236) #12
  %238 = tail call i32 @llvm.nvvm.d2i.hi(double %236) #12
  %239 = shl i32 %222, 20
  %240 = add i32 %238, %239
  %241 = tail call double @llvm.nvvm.lohi.i2d(i32 %237, i32 %240) #12
  %242 = tail call i32 @llvm.nvvm.d2i.hi(double %220) #12
  %243 = bitcast i32 %242 to float
  %244 = tail call float @llvm.nvvm.fabs.f(float %243) #12
  %245 = fcmp olt float %244, 0x4010C46560000000
  br i1 %245, label %__nv_exp.exit62, label %__internal_fast_icmp_abs_lt.exit.i59

__internal_fast_icmp_abs_lt.exit.i59:             ; preds = %__nv_log1p.exit
  %246 = fcmp one double %subtract.238.1.clone.1, 0.000000e+00
  %247 = fsub double 0x7FF0000000000000, %219
  %z.0.i60 = select i1 %246, double 0.000000e+00, double %247
  %248 = fcmp olt float %244, 0x4010E90000000000
  br i1 %248, label %249, label %__nv_exp.exit62

249:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i59
  %250 = sdiv i32 %222, 2
  %251 = shl i32 %250, 20
  %252 = add i32 %238, %251
  %253 = tail call double @llvm.nvvm.lohi.i2d(i32 %237, i32 %252) #12
  %254 = sub nsw i32 %222, %250
  %255 = shl i32 %254, 20
  %256 = add nsw i32 %255, 1072693248
  %257 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %256) #12
  %258 = fmul double %257, %253
  br label %__nv_exp.exit62

__nv_exp.exit62:                                  ; preds = %__nv_log1p.exit, %__internal_fast_icmp_abs_lt.exit.i59, %249
  %z.2.i61 = phi double [ %241, %__nv_log1p.exit ], [ %258, %249 ], [ %z.0.i60, %__internal_fast_icmp_abs_lt.exit.i59 ]
  %259 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i61) #12
  %260 = bitcast i32 %259 to float
  %261 = fcmp olt float %260, 0x3FFCAAAAA0000000
  %262 = fcmp ogt float %260, 0xBFFB333320000000
  %or.cond.i44 = and i1 %261, %262
  br i1 %or.cond.i44, label %263, label %280

263:                                              ; preds = %__nv_exp.exit62
  %264 = fadd double %z.2.i61, 2.000000e+00
  %265 = fdiv double %z.2.i61, %264
  %266 = fneg double %z.2.i61
  %267 = fmul double %265, %266
  %268 = fadd double %z.2.i61, %267
  %269 = fmul double %268, %268
  %270 = tail call double @llvm.fma.f64(double %269, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %271 = tail call double @llvm.fma.f64(double %270, double %269, double 0x3EF3B9FF890F468C)
  %272 = tail call double @llvm.fma.f64(double %271, double %269, double 0x3F17457EFD51BAF8)
  %273 = tail call double @llvm.fma.f64(double %272, double %269, double 0x3F3C71C8DE3CE825)
  %274 = tail call double @llvm.fma.f64(double %273, double %269, double 0x3F6249248FA4661F)
  %275 = tail call double @llvm.fma.f64(double %274, double %269, double 0x3F899999999D70C4)
  %276 = tail call double @llvm.fma.f64(double %275, double %269, double 0x3FB5555555555462)
  %277 = fmul double %269, %276
  %278 = tail call double @llvm.fma.f64(double %277, double %268, double %267)
  %279 = fadd double %z.2.i61, %278
  br label %__nv_log1p.exit54

280:                                              ; preds = %__nv_exp.exit62
  %281 = fadd double %z.2.i61, 1.000000e+00
  %282 = tail call i32 @llvm.nvvm.d2i.hi(double %281) #12
  %283 = tail call i32 @llvm.nvvm.d2i.lo(double %281) #12
  %284 = icmp slt i32 %282, 1048576
  %285 = fmul double %281, 0x4350000000000000
  %286 = tail call i32 @llvm.nvvm.d2i.lo(double %285) #12
  %287 = tail call i32 @llvm.nvvm.d2i.hi(double %285) #12
  br i1 %284, label %288, label %289

288:                                              ; preds = %280
  br label %289

289:                                              ; preds = %288, %280
  %.0.i45 = phi double [ %285, %288 ], [ %281, %280 ]
  %ihi.i.0.i46 = phi i32 [ %287, %288 ], [ %282, %280 ]
  %ilo.i.0.i47 = phi i32 [ %286, %288 ], [ %283, %280 ]
  %e.i.0.i48 = phi i32 [ -1077, %288 ], [ -1023, %280 ]
  %290 = add i32 %ihi.i.0.i46, -1
  %or.cond2.i49 = icmp ult i32 %290, 2146435071
  br i1 %or.cond2.i49, label %291, label %338

291:                                              ; preds = %289
  %292 = lshr i32 %ihi.i.0.i46, 20
  %293 = add nsw i32 %e.i.0.i48, %292
  %294 = and i32 %ihi.i.0.i46, 1048575
  %295 = or disjoint i32 %294, 1072693248
  %296 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i47, i32 %295) #12
  %297 = icmp ugt i32 %295, 1073127582
  %298 = tail call i32 @llvm.nvvm.d2i.lo(double %296) #12
  %299 = tail call i32 @llvm.nvvm.d2i.hi(double %296) #12
  %300 = add i32 %299, -1048576
  %301 = tail call double @llvm.nvvm.lohi.i2d(i32 %298, i32 %300) #12
  %spec.select64 = select i1 %297, double %301, double %296
  %302 = zext i1 %297 to i32
  %spec.select65 = add nsw i32 %293, %302
  %303 = fadd double %spec.select64, -1.000000e+00
  %304 = fadd double %spec.select64, 1.000000e+00
  %305 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %304) #12
  %306 = fneg double %304
  %307 = tail call double @llvm.fma.f64(double %306, double %305, double 1.000000e+00)
  %308 = tail call double @llvm.fma.f64(double %307, double %307, double %307)
  %309 = tail call double @llvm.fma.f64(double %308, double %305, double %305)
  %310 = fmul double %303, %309
  %311 = fadd double %310, %310
  %312 = fmul double %311, %311
  %313 = tail call double @llvm.fma.f64(double %312, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %314 = tail call double @llvm.fma.f64(double %313, double %312, double 0x3EF3B2669F02676F)
  %315 = tail call double @llvm.fma.f64(double %314, double %312, double 0x3F1745CBA9AB0956)
  %316 = tail call double @llvm.fma.f64(double %315, double %312, double 0x3F3C71C72D1B5154)
  %317 = tail call double @llvm.fma.f64(double %316, double %312, double 0x3F624924923BE72D)
  %318 = tail call double @llvm.fma.f64(double %317, double %312, double 0x3F8999999999A3C4)
  %319 = tail call double @llvm.fma.f64(double %318, double %312, double 0x3FB5555555555554)
  %320 = fsub double %303, %311
  %321 = fmul double %320, 2.000000e+00
  %322 = fneg double %311
  %323 = tail call double @llvm.fma.f64(double %322, double %303, double %321)
  %324 = fmul double %309, %323
  %325 = fmul double %312, %319
  %326 = tail call double @llvm.fma.f64(double %325, double %311, double %324)
  %327 = xor i32 %spec.select65, -2147483648
  %328 = tail call double @llvm.nvvm.lohi.i2d(i32 %327, i32 1127219200) #12
  %329 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %330 = fsub double %328, %329
  %331 = tail call double @llvm.fma.f64(double %330, double 0x3FE62E42FEFA39EF, double %311)
  %332 = fneg double %330
  %333 = tail call double @llvm.fma.f64(double %332, double 0x3FE62E42FEFA39EF, double %331)
  %334 = fsub double %333, %311
  %335 = fsub double %326, %334
  %336 = tail call double @llvm.fma.f64(double %330, double 0x3C7ABC9E3B39803F, double %335)
  %337 = fadd double %331, %336
  br label %__nv_log1p.exit54

338:                                              ; preds = %289
  %339 = tail call double @llvm.fma.f64(double %.0.i45, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %340 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i45) #12
  %341 = and i32 %340, 2147483647
  %342 = icmp eq i32 %341, 0
  %q.i.0.i50 = select i1 %342, double 0xFFF0000000000000, double %339
  br label %__nv_log1p.exit54

__nv_log1p.exit54:                                ; preds = %263, %291, %338
  %t.0.i51 = phi double [ %279, %263 ], [ %337, %291 ], [ %q.i.0.i50, %338 ]
  %343 = fcmp uno double %216, 0.000000e+00
  %344 = fcmp oge double %216, %218
  %345 = or i1 %343, %344
  %maximum.48.1.clone.1 = select i1 %345, double %216, double %218
  %add.4423.1.clone.1 = fadd double %216, %218
  %compare.1183.1.clone.1 = fcmp uno double %subtract.238.1.clone.1, 0.000000e+00
  %346 = icmp sgt i64 %3, 9
  %347 = or i8 %7, %5
  %348 = trunc i8 %347 to i1
  %.not43 = or i1 %346, %348
  %349 = select i1 %.not43, i32 %214, i32 %212
  %not..not43 = xor i1 %.not43, true
  %350 = zext i1 %not..not43 to i64
  %351 = add i64 %3, %350
  %352 = select i1 %.not43, i32 %210, i32 %208
  %353 = trunc i8 %196 to i1
  %354 = select i1 %353, double %204, double %206
  %355 = select i1 %.not43, double %206, double %354
  %356 = select i1 %.not43, i1 true, i1 %353
  %357 = select i1 %356, double %202, double %204
  %358 = select i1 %.not43, i64 0, i64 %198
  %359 = add i64 %200, %358
  %360 = select i1 %.not43, i8 %5, i8 %15
  %361 = or i8 %15, %9
  %362 = icmp eq i8 %361, 0
  %compare.1182.1.clone.1 = fcmp uno double %subtract.237.1.clone.1, 0.000000e+00
  %add.4421.3.clone.1 = fadd double %22, %24
  %363 = fcmp uno double %24, 0.000000e+00
  %364 = fcmp oge double %24, %22
  %365 = or i1 %363, %364
  %maximum.47.1.clone.1 = select i1 %365, double %24, double %22
  %add.4422.5.clone.1 = fadd double %maximum.47.1.clone.1, %t.0.i
  %366 = select i1 %compare.1182.1.clone.1, double %add.4421.3.clone.1, double %add.4422.5.clone.1
  %367 = select i1 %362, double %366, double %24
  %368 = select i1 %.not43, double %24, double %367
  %369 = add i32 %20, 1
  %370 = add i32 %369, %19
  %371 = tail call i32 @llvm.fshl.i32(i32 %369, i32 %369, i32 13)
  %372 = xor i32 %370, %371
  %373 = add i32 %372, %370
  %374 = tail call i32 @llvm.fshl.i32(i32 %372, i32 %372, i32 15)
  %375 = xor i32 %373, %374
  %376 = add i32 %375, %373
  %377 = tail call i32 @llvm.fshl.i32(i32 %375, i32 %375, i32 26)
  %378 = xor i32 %376, %377
  %379 = add i32 %378, %376
  %380 = add i32 %379, %20
  %381 = tail call i32 @llvm.fshl.i32(i32 %378, i32 %378, i32 6)
  %382 = xor i32 %379, %381
  %383 = xor i32 %19, %20
  %384 = xor i32 %383, 466688986
  %385 = add i32 %384, 1
  %386 = add i32 %385, %382
  %387 = add i32 %380, %386
  %388 = tail call i32 @llvm.fshl.i32(i32 %386, i32 %386, i32 17)
  %389 = xor i32 %387, %388
  %390 = add i32 %389, %387
  %391 = tail call i32 @llvm.fshl.i32(i32 %389, i32 %389, i32 29)
  %392 = xor i32 %390, %391
  %393 = add i32 %392, %390
  %394 = tail call i32 @llvm.fshl.i32(i32 %392, i32 %392, i32 16)
  %395 = xor i32 %393, %394
  %396 = add i32 %395, %393
  %397 = add i32 %396, %384
  %398 = tail call i32 @llvm.fshl.i32(i32 %395, i32 %395, i32 24)
  %399 = xor i32 %396, %398
  %400 = add i32 %19, 2
  %401 = add i32 %400, %399
  %402 = add i32 %397, %401
  %403 = tail call i32 @llvm.fshl.i32(i32 %401, i32 %401, i32 13)
  %404 = xor i32 %402, %403
  %405 = add i32 %404, %402
  %406 = tail call i32 @llvm.fshl.i32(i32 %404, i32 %404, i32 15)
  %407 = xor i32 %405, %406
  %408 = add i32 %407, %405
  %409 = tail call i32 @llvm.fshl.i32(i32 %407, i32 %407, i32 26)
  %410 = xor i32 %408, %409
  %411 = add i32 %410, %408
  %412 = add i32 %411, %19
  %413 = tail call i32 @llvm.fshl.i32(i32 %410, i32 %410, i32 6)
  %414 = xor i32 %411, %413
  %415 = add i32 %20, 3
  %416 = add i32 %415, %414
  %417 = add i32 %412, %416
  %418 = tail call i32 @llvm.fshl.i32(i32 %416, i32 %416, i32 17)
  %419 = xor i32 %417, %418
  %420 = add i32 %419, %417
  %421 = tail call i32 @llvm.fshl.i32(i32 %419, i32 %419, i32 29)
  %422 = xor i32 %420, %421
  %423 = add i32 %422, %420
  %424 = tail call i32 @llvm.fshl.i32(i32 %422, i32 %422, i32 16)
  %425 = xor i32 %423, %424
  %426 = add i32 %425, %423
  %427 = add i32 %426, %20
  %428 = tail call i32 @llvm.fshl.i32(i32 %425, i32 %425, i32 24)
  %429 = xor i32 %426, %428
  %430 = add i32 %384, 4
  %431 = add i32 %430, %429
  %432 = add i32 %427, %431
  %433 = tail call i32 @llvm.fshl.i32(i32 %431, i32 %431, i32 13)
  %434 = xor i32 %432, %433
  %435 = add i32 %434, %432
  %436 = tail call i32 @llvm.fshl.i32(i32 %434, i32 %434, i32 15)
  %437 = xor i32 %435, %436
  %438 = add i32 %437, %435
  %439 = tail call i32 @llvm.fshl.i32(i32 %437, i32 %437, i32 26)
  %440 = xor i32 %438, %439
  %441 = add i32 %440, %438
  %442 = add i32 %441, %384
  %443 = zext i32 %442 to i64
  %444 = shl nuw i64 %443, 32
  %445 = tail call i32 @llvm.fshl.i32(i32 %440, i32 %440, i32 6)
  %446 = xor i32 %441, %445
  %447 = add i32 %19, 5
  %448 = add i32 %447, %446
  %449 = zext i32 %448 to i64
  %450 = or disjoint i64 %444, %449
  %451 = lshr i64 %450, 12
  %452 = or disjoint i64 %451, 4607182418800017408
  %453 = bitcast i64 %452 to double
  %add.4420.5.clone.1 = fadd double %453, -1.000000e+00
  %454 = fcmp ole double %add.4420.5.clone.1, 0.000000e+00
  %maximum.46.5.clone.1 = select i1 %454, double 0.000000e+00, double %add.4420.5.clone.1
  %455 = fcmp oge double %z.2.i, 1.000000e+00
  %minimum.10.7.clone.1 = select i1 %455, double 1.000000e+00, double %z.2.i
  %compare.1180.5.clone.1 = fcmp uge double %maximum.46.5.clone.1, %minimum.10.7.clone.1
  %456 = select i1 %compare.1180.5.clone.1, double %68, double %70
  %457 = select i1 %362, double %456, double %68
  %458 = select i1 %.not43, double %68, double %457
  %459 = select i1 %compare.1180.5.clone.1, double %64, double %66
  %460 = select i1 %362, double %459, double %64
  %461 = select i1 %.not43, double %64, double %460
  %462 = zext i1 %compare.1180.5.clone.1 to i8
  %compare.1184.3 = fcmp ole double %11, 0.000000e+00
  %compare.1185.7 = fcmp ole double %13, 0.000000e+00
  %463 = or i1 %compare.1184.3, %compare.1185.7
  %464 = zext i1 %463 to i8
  %465 = or i8 %9, %464
  %466 = select i1 %.not43, i8 %7, i8 %465
  %add.4424.3.clone.1 = fadd double %maximum.48.1.clone.1, %t.0.i51
  %467 = select i1 %compare.1183.1.clone.1, double %add.4423.1.clone.1, double %add.4424.3.clone.1
  %468 = select i1 %.not43, double %216, double %467
  %469 = getelementptr i8, ptr addrspace(1) %arg27120, i64 %1
  store i8 %466, ptr addrspace(1) %469, align 1
  store double %461, ptr addrspace(1) %63, align 8
  store double %458, ptr addrspace(1) %67, align 8
  store double %368, ptr addrspace(1) %23, align 8
  %470 = getelementptr i8, ptr addrspace(1) %arg28122, i64 %1
  store i8 %360, ptr addrspace(1) %470, align 1
  %471 = getelementptr i8, ptr addrspace(1) %arg29124, i64 %1
  store i8 %462, ptr addrspace(1) %471, align 1
  store i64 %359, ptr addrspace(1) %199, align 8
  store double %357, ptr addrspace(1) %201, align 8
  store double %355, ptr addrspace(1) %205, align 8
  store i32 %352, ptr addrspace(1) %209, align 4
  %472 = getelementptr i64, ptr addrspace(1) %arg30126, i64 %1
  store i64 %351, ptr addrspace(1) %472, align 8
  store i32 %349, ptr addrspace(1) %213, align 4
  store double %468, ptr addrspace(1) %215, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_6(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture align 128 dereferenceable(320) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture align 128 dereferenceable(320) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture align 128 dereferenceable(320) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg29, ptr noalias nocapture align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg32, ptr noalias nocapture align 128 dereferenceable(320) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg34, ptr noalias nocapture align 128 dereferenceable(320) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg36, ptr noalias nocapture align 128 dereferenceable(320) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg38, ptr noalias nocapture align 128 dereferenceable(320) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg40, ptr noalias nocapture align 128 dereferenceable(320) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg42, ptr noalias nocapture align 128 dereferenceable(320) %arg43, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg44, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg45, ptr noalias nocapture align 128 dereferenceable(320) %arg46, ptr noalias nocapture align 128 dereferenceable(320) %arg47, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg48, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg49, ptr noalias nocapture align 128 dereferenceable(320) %arg50, ptr noalias nocapture align 128 dereferenceable(320) %arg51, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg53, ptr noalias nocapture align 128 dereferenceable(320) %arg54) local_unnamed_addr #2 {
entry:
  %arg54116 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53114 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg51110 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50108 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49106 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg47102 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46100 = addrspacecast ptr %arg46 to ptr addrspace(1)
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
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg722, i64 0, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = icmp sgt i64 %3, 9
  %5 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg620, i64 0, i64 %1
  %6 = load i8, ptr addrspace(1) %5, align 1, !invariant.load !270
  %7 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg518, i64 0, i64 %1
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !270
  %9 = or i8 %8, %6
  %10 = trunc i8 %9 to i1
  %.not1 = or i1 %4, %10
  %11 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg314, i64 0, i64 %1
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !270
  %13 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg416, i64 0, i64 %1
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !270
  %15 = or i8 %14, %12
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg212, i64 0, i64 %1
  %18 = load i8, ptr addrspace(1) %17, align 1, !invariant.load !270
  %19 = zext nneg i32 %0 to i64
  %20 = getelementptr double, ptr addrspace(1) %arg02, i64 %19
  %21 = load double, ptr addrspace(1) %20, align 8
  %22 = getelementptr double, ptr addrspace(1) %arg110, i64 %19
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !270
  %24 = trunc i8 %18 to i1
  %25 = select i1 %24, double %21, double %23
  %26 = select i1 %16, double %25, double %21
  %27 = select i1 %.not1, double %21, double %26
  %28 = getelementptr double, ptr addrspace(1) %arg824, i64 %19
  %29 = load double, ptr addrspace(1) %28, align 8
  %30 = getelementptr double, ptr addrspace(1) %arg926, i64 %19
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !270
  %32 = select i1 %24, double %29, double %31
  %33 = select i1 %16, double %32, double %29
  %34 = select i1 %.not1, double %29, double %33
  %35 = getelementptr double, ptr addrspace(1) %arg1028, i64 %19
  %36 = load double, ptr addrspace(1) %35, align 8
  %37 = getelementptr double, ptr addrspace(1) %arg1130, i64 %19
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !270
  %39 = select i1 %24, double %36, double %38
  %40 = select i1 %16, double %39, double %36
  %41 = select i1 %.not1, double %36, double %40
  %42 = getelementptr double, ptr addrspace(1) %arg1232, i64 %19
  %43 = load double, ptr addrspace(1) %42, align 8
  %44 = getelementptr double, ptr addrspace(1) %arg1334, i64 %19
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !270
  %46 = select i1 %24, double %43, double %45
  %47 = select i1 %16, double %46, double %43
  %48 = select i1 %.not1, double %43, double %47
  %49 = getelementptr double, ptr addrspace(1) %arg1436, i64 %19
  %50 = load double, ptr addrspace(1) %49, align 8
  %51 = getelementptr double, ptr addrspace(1) %arg1538, i64 %19
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !270
  %53 = select i1 %24, double %50, double %52
  %54 = select i1 %16, double %53, double %50
  %55 = select i1 %.not1, double %50, double %54
  %56 = getelementptr double, ptr addrspace(1) %arg1640, i64 %19
  %57 = load double, ptr addrspace(1) %56, align 8
  %58 = getelementptr double, ptr addrspace(1) %arg1742, i64 %19
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !270
  %60 = select i1 %24, double %57, double %59
  %61 = select i1 %16, double %60, double %57
  %62 = select i1 %.not1, double %57, double %61
  %63 = getelementptr double, ptr addrspace(1) %arg1844, i64 %19
  %64 = load double, ptr addrspace(1) %63, align 8
  %65 = getelementptr double, ptr addrspace(1) %arg1946, i64 %19
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !270
  %67 = select i1 %24, double %64, double %66
  %68 = select i1 %16, double %67, double %64
  %69 = select i1 %.not1, double %64, double %68
  %70 = getelementptr double, ptr addrspace(1) %arg2048, i64 %19
  %71 = load double, ptr addrspace(1) %70, align 8
  %72 = getelementptr double, ptr addrspace(1) %arg2150, i64 %19
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !270
  %74 = select i1 %24, double %71, double %73
  %75 = select i1 %16, double %74, double %71
  %76 = select i1 %.not1, double %71, double %75
  %77 = getelementptr double, ptr addrspace(1) %arg2252, i64 %19
  %78 = load double, ptr addrspace(1) %77, align 8
  %79 = getelementptr double, ptr addrspace(1) %arg2354, i64 %19
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !270
  %81 = select i1 %24, double %78, double %80
  %82 = select i1 %16, double %81, double %78
  %83 = select i1 %.not1, double %78, double %82
  %84 = getelementptr double, ptr addrspace(1) %arg2456, i64 %19
  %85 = load double, ptr addrspace(1) %84, align 8
  %86 = getelementptr double, ptr addrspace(1) %arg2558, i64 %19
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !270
  %88 = select i1 %24, double %85, double %87
  %89 = select i1 %16, double %88, double %85
  %90 = select i1 %.not1, double %85, double %89
  %91 = getelementptr double, ptr addrspace(1) %arg2660, i64 %19
  %92 = load double, ptr addrspace(1) %91, align 8
  %93 = getelementptr double, ptr addrspace(1) %arg2762, i64 %19
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !270
  %95 = select i1 %24, double %92, double %94
  %96 = select i1 %16, double %95, double %92
  %97 = select i1 %.not1, double %92, double %96
  %98 = getelementptr double, ptr addrspace(1) %arg2864, i64 %19
  %99 = load double, ptr addrspace(1) %98, align 8
  %100 = getelementptr double, ptr addrspace(1) %arg2966, i64 %19
  %101 = load double, ptr addrspace(1) %100, align 8, !invariant.load !270
  %102 = select i1 %24, double %99, double %101
  %103 = select i1 %16, double %102, double %99
  %104 = select i1 %.not1, double %99, double %103
  %105 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg3272, i64 0, i64 %1
  %106 = load i8, ptr addrspace(1) %105, align 1, !invariant.load !270
  %107 = getelementptr double, ptr addrspace(1) %arg3170, i64 %19
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !270
  %109 = getelementptr double, ptr addrspace(1) %arg3068, i64 %19
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = trunc i8 %106 to i1
  %add.4429.5.clone.1.clone.1 = fadd double %108, %110
  %112 = select i1 %.not1, double %110, double %add.4429.5.clone.1.clone.1
  %113 = getelementptr double, ptr addrspace(1) %arg3476, i64 %19
  %114 = load double, ptr addrspace(1) %113, align 8, !invariant.load !270
  %115 = getelementptr double, ptr addrspace(1) %arg3374, i64 %19
  %116 = load double, ptr addrspace(1) %115, align 8
  %add.4428.5.clone.1.clone.1 = fadd double %114, %116
  %117 = select i1 %.not1, double %116, double %add.4428.5.clone.1.clone.1
  %118 = getelementptr double, ptr addrspace(1) %arg3680, i64 %19
  %119 = load double, ptr addrspace(1) %118, align 8, !invariant.load !270
  %120 = getelementptr double, ptr addrspace(1) %arg3578, i64 %19
  %121 = load double, ptr addrspace(1) %120, align 8
  %add.4430.5.clone.1.clone.1 = fadd double %119, %121
  %122 = select i1 %.not1, double %121, double %add.4430.5.clone.1.clone.1
  %123 = getelementptr double, ptr addrspace(1) %arg3884, i64 %19
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !270
  %125 = getelementptr double, ptr addrspace(1) %arg3782, i64 %19
  %126 = load double, ptr addrspace(1) %125, align 8
  %add.4425.5.clone.1.clone.1 = fadd double %124, %126
  %127 = select i1 %.not1, double %126, double %add.4425.5.clone.1.clone.1
  %128 = getelementptr double, ptr addrspace(1) %arg4088, i64 %19
  %129 = load double, ptr addrspace(1) %128, align 8, !invariant.load !270
  %130 = getelementptr double, ptr addrspace(1) %arg3986, i64 %19
  %131 = load double, ptr addrspace(1) %130, align 8
  %add.4426.5.clone.1.clone.1 = fadd double %129, %131
  %132 = select i1 %.not1, double %131, double %add.4426.5.clone.1.clone.1
  %133 = getelementptr double, ptr addrspace(1) %arg4292, i64 %19
  %134 = load double, ptr addrspace(1) %133, align 8, !invariant.load !270
  %135 = getelementptr double, ptr addrspace(1) %arg4190, i64 %19
  %136 = load double, ptr addrspace(1) %135, align 8
  %add.4427.5.clone.1.clone.1 = fadd double %134, %136
  %137 = select i1 %.not1, double %136, double %add.4427.5.clone.1.clone.1
  %138 = getelementptr double, ptr addrspace(1) %arg4496, i64 %19
  %139 = load double, ptr addrspace(1) %138, align 8, !invariant.load !270
  %140 = getelementptr double, ptr addrspace(1) %arg4394, i64 %19
  %141 = load double, ptr addrspace(1) %140, align 8
  %142 = select i1 %111, double %139, double %141
  %143 = select i1 %.not1, double %141, double %142
  %144 = getelementptr double, ptr addrspace(1) %arg46100, i64 %19
  %145 = load double, ptr addrspace(1) %144, align 8
  %146 = select i1 %.not1, i1 true, i1 %111
  %147 = select i1 %146, double %145, double %139
  %148 = getelementptr double, ptr addrspace(1) %arg47102, i64 %19
  %149 = load double, ptr addrspace(1) %148, align 8
  %150 = getelementptr double, ptr addrspace(1) %arg49106, i64 %19
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !270
  %152 = select i1 %146, double %149, double %151
  %153 = getelementptr double, ptr addrspace(1) %arg50108, i64 %19
  %154 = load double, ptr addrspace(1) %153, align 8
  %155 = select i1 %111, double %151, double %154
  %156 = select i1 %.not1, double %154, double %155
  %157 = getelementptr double, ptr addrspace(1) %arg51110, i64 %19
  %158 = load double, ptr addrspace(1) %157, align 8
  %159 = getelementptr double, ptr addrspace(1) %arg53114, i64 %19
  %160 = load double, ptr addrspace(1) %159, align 8, !invariant.load !270
  %161 = select i1 %146, double %158, double %160
  %162 = getelementptr double, ptr addrspace(1) %arg54116, i64 %19
  %163 = load double, ptr addrspace(1) %162, align 8
  %164 = select i1 %111, double %160, double %163
  %165 = select i1 %.not1, double %163, double %164
  store double %27, ptr addrspace(1) %20, align 8
  store double %34, ptr addrspace(1) %28, align 8
  store double %41, ptr addrspace(1) %35, align 8
  store double %48, ptr addrspace(1) %42, align 8
  store double %55, ptr addrspace(1) %49, align 8
  store double %62, ptr addrspace(1) %56, align 8
  store double %69, ptr addrspace(1) %63, align 8
  store double %76, ptr addrspace(1) %70, align 8
  store double %83, ptr addrspace(1) %77, align 8
  store double %90, ptr addrspace(1) %84, align 8
  store double %97, ptr addrspace(1) %91, align 8
  store double %104, ptr addrspace(1) %98, align 8
  store double %112, ptr addrspace(1) %109, align 8
  store double %117, ptr addrspace(1) %115, align 8
  store double %122, ptr addrspace(1) %120, align 8
  store double %127, ptr addrspace(1) %125, align 8
  store double %132, ptr addrspace(1) %130, align 8
  store double %137, ptr addrspace(1) %135, align 8
  store double %143, ptr addrspace(1) %140, align 8
  store double %147, ptr addrspace(1) %144, align 8
  store double %152, ptr addrspace(1) %148, align 8
  store double %156, ptr addrspace(1) %153, align 8
  store double %161, ptr addrspace(1) %157, align 8
  store double %165, ptr addrspace(1) %162, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_97(ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.5797 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !270
  %1 = icmp slt i64 %param_2.5797, 0
  %2 = add i64 %param_2.5797, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5797
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.75644 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !270
  %7 = getelementptr inbounds [10 x [2 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %param_1.75644, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_56(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.5768 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !270
  %1 = icmp slt i64 %param_2.5768, 0
  %2 = add i64 %param_2.5768, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5768
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.75354 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !270
  %7 = getelementptr inbounds [10 x [2 x i64]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i64 %param_1.75354, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_95(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.5801 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !270
  %1 = icmp slt i64 %param_2.5801, 0
  %2 = add i64 %param_2.5801, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5801
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.75684 = load double, ptr addrspace(1) %6, align 8, !invariant.load !270
  %7 = getelementptr inbounds [10 x [2 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.75684, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_54(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.4913 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !270
  %1 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.57604 = load double, ptr addrspace(1) %1, align 8, !invariant.load !270
  %2 = tail call double @llvm.fma.f64(double %param_2.57604, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #12
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #12
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_2.57604)
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
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #12
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #12
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #12
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.57604) #12
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #12
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_2.57604, 0.000000e+00
  %28 = fadd double %param_2.57604, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #12
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #12
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_3.4913, 0
  %41 = add i64 %param_3.4913, 10
  %42 = select i1 %40, i64 %41, i64 %param_3.4913
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 9)
  %45 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.75275 = load i64, ptr addrspace(1) %45, align 8, !invariant.load !270
  %46 = sitofp i64 %param_1.75275 to double
  %divide.622.1 = fdiv double %z.2.i, %46
  %47 = getelementptr inbounds [10 x [2 x double]], ptr addrspace(1) %arg06, i64 0, i64 %44, i64 %thread_id_x
  store double %divide.622.1, ptr addrspace(1) %47, align 8
  ret void
}

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

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f64(double, i32 immarg) #11

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none) }
attributes #4 = { norecurse nounwind }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { convergent nocallback nounwind }
attributes #7 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #8 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #9 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #11 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263}
!llvm.ident = !{!264}
!nvvmir.version = !{!265}
!llvm.module.flags = !{!266}

!0 = !{ptr @loop_broadcast_fusion_27, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion_27, !"reqntidx", i32 20}
!2 = !{ptr @loop_broadcast_fusion_26, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion_26, !"reqntidx", i32 20}
!4 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!6 = !{ptr @loop_compare_fusion_2, !"kernel", i32 1}
!7 = !{ptr @loop_compare_fusion_2, !"reqntidx", i32 1}
!8 = !{ptr @loop_broadcast_fusion_25, !"kernel", i32 1}
!9 = !{ptr @loop_broadcast_fusion_25, !"reqntidx", i32 2}
!10 = !{ptr @loop_broadcast_fusion_24, !"kernel", i32 1}
!11 = !{ptr @loop_broadcast_fusion_24, !"reqntidx", i32 2}
!12 = !{ptr @loop_broadcast_fusion_20, !"kernel", i32 1}
!13 = !{ptr @loop_broadcast_fusion_20, !"reqntidx", i32 2}
!14 = !{ptr @input_concatenate_fusion_1, !"kernel", i32 1}
!15 = !{ptr @input_concatenate_fusion_1, !"reqntidx", i32 2}
!16 = !{ptr @loop_broadcast_fusion_23, !"kernel", i32 1}
!17 = !{ptr @loop_broadcast_fusion_23, !"reqntidx", i32 2}
!18 = !{ptr @loop_broadcast_fusion_21, !"kernel", i32 1}
!19 = !{ptr @loop_broadcast_fusion_21, !"reqntidx", i32 2}
!20 = !{ptr @loop_slice_fusion_1, !"kernel", i32 1}
!21 = !{ptr @loop_slice_fusion_1, !"reqntidx", i32 8}
!22 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!23 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!24 = !{ptr @input_reduce_fusion_8, !"kernel", i32 1}
!25 = !{ptr @input_reduce_fusion_8, !"reqntidx", i32 64}
!26 = !{ptr @loop_add_fusion_3, !"kernel", i32 1}
!27 = !{ptr @loop_add_fusion_3, !"reqntidx", i32 2}
!28 = !{ptr @wrapped_slice_5, !"kernel", i32 1}
!29 = !{ptr @wrapped_slice_5, !"reqntidx", i32 40}
!30 = !{ptr @wrapped_slice_4, !"kernel", i32 1}
!31 = !{ptr @wrapped_slice_4, !"reqntidx", i32 40}
!32 = !{ptr @wrapped_slice_3, !"kernel", i32 1}
!33 = !{ptr @wrapped_slice_3, !"reqntidx", i32 40}
!34 = !{ptr @wrapped_slice_2, !"kernel", i32 1}
!35 = !{ptr @wrapped_slice_2, !"reqntidx", i32 40}
!36 = !{ptr @wrapped_slice_1, !"kernel", i32 1}
!37 = !{ptr @wrapped_slice_1, !"reqntidx", i32 40}
!38 = !{ptr @wrapped_slice, !"kernel", i32 1}
!39 = !{ptr @wrapped_slice, !"reqntidx", i32 40}
!40 = !{ptr @loop_dynamic_update_slice_fusion_98, !"kernel", i32 1}
!41 = !{ptr @loop_dynamic_update_slice_fusion_98, !"reqntidx", i32 40}
!42 = !{ptr @loop_broadcast_fusion_22, !"kernel", i32 1}
!43 = !{ptr @loop_broadcast_fusion_22, !"reqntidx", i32 1024}
!44 = !{ptr @input_reduce_fusion_7, !"kernel", i32 1}
!45 = !{ptr @input_reduce_fusion_7, !"reqntidx", i32 32}
!46 = !{ptr @loop_add_fusion_2, !"kernel", i32 1}
!47 = !{ptr @loop_add_fusion_2, !"reqntidx", i32 2}
!48 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!49 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 6}
!50 = !{ptr @loop_slice_fusion, !"kernel", i32 1}
!51 = !{ptr @loop_slice_fusion, !"reqntidx", i32 4}
!52 = !{ptr @loop_broadcast_compare_select_fusion, !"kernel", i32 1}
!53 = !{ptr @loop_broadcast_compare_select_fusion, !"reqntidx", i32 2}
!54 = !{ptr @loop_select_fusion_7, !"kernel", i32 1}
!55 = !{ptr @loop_select_fusion_7, !"reqntidx", i32 40}
!56 = !{ptr @input_reduce_fusion_5, !"kernel", i32 1}
!57 = !{ptr @input_reduce_fusion_5, !"reqntidx", i32 64}
!58 = !{ptr @loop_add_minimum_select_fusion, !"kernel", i32 1}
!59 = !{ptr @loop_add_minimum_select_fusion, !"reqntidx", i32 2}
!60 = !{ptr @input_reduce_fusion_4, !"kernel", i32 1}
!61 = !{ptr @input_reduce_fusion_4, !"reqntidx", i32 32}
!62 = !{ptr @loop_concatenate_fusion_1, !"kernel", i32 1}
!63 = !{ptr @loop_concatenate_fusion_1, !"reqntidx", i32 128}
!64 = !{ptr @loop_add_exponential_multiply_select_fusion, !"kernel", i32 1}
!65 = !{ptr @loop_add_exponential_multiply_select_fusion, !"reqntidx", i32 40}
!66 = !{ptr @loop_broadcast_fusion_14, !"kernel", i32 1}
!67 = !{ptr @loop_broadcast_fusion_14, !"reqntidx", i32 1024}
!68 = !{ptr @loop_broadcast_fusion_13, !"kernel", i32 1}
!69 = !{ptr @loop_broadcast_fusion_13, !"reqntidx", i32 40}
!70 = !{ptr @loop_broadcast_fusion_6, !"kernel", i32 1}
!71 = !{ptr @loop_broadcast_fusion_6, !"reqntidx", i32 1024}
!72 = !{ptr @loop_broadcast_fusion_11, !"kernel", i32 1}
!73 = !{ptr @loop_broadcast_fusion_11, !"reqntidx", i32 40}
!74 = !{ptr @loop_broadcast_fusion_5, !"kernel", i32 1}
!75 = !{ptr @loop_broadcast_fusion_5, !"reqntidx", i32 1024}
!76 = !{ptr @loop_broadcast_fusion_8, !"kernel", i32 1}
!77 = !{ptr @loop_broadcast_fusion_8, !"reqntidx", i32 1024}
!78 = !{ptr @loop_broadcast_fusion_15, !"kernel", i32 1}
!79 = !{ptr @loop_broadcast_fusion_15, !"reqntidx", i32 192}
!80 = !{ptr @loop_broadcast_fusion_9, !"kernel", i32 1}
!81 = !{ptr @loop_broadcast_fusion_9, !"reqntidx", i32 192}
!82 = !{ptr @loop_broadcast_fusion_10, !"kernel", i32 1}
!83 = !{ptr @loop_broadcast_fusion_10, !"reqntidx", i32 40}
!84 = !{ptr @loop_broadcast_fusion_12, !"kernel", i32 1}
!85 = !{ptr @loop_broadcast_fusion_12, !"reqntidx", i32 40}
!86 = !{ptr @loop_broadcast_fusion_18, !"kernel", i32 1}
!87 = !{ptr @loop_broadcast_fusion_18, !"reqntidx", i32 20}
!88 = !{ptr @loop_compare_fusion_1, !"kernel", i32 1}
!89 = !{ptr @loop_compare_fusion_1, !"reqntidx", i32 1}
!90 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 1}
!92 = !{ptr @loop_dynamic_update_slice_fusion_52, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_52, !"reqntidx", i32 1}
!94 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 40}
!96 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 40}
!98 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 40}
!100 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 40}
!102 = !{ptr @loop_dynamic_update_slice_fusion_41, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_41, !"reqntidx", i32 40}
!104 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 40}
!106 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 40}
!108 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 40}
!110 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 40}
!112 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 40}
!114 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 40}
!116 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 40}
!118 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 40}
!120 = !{ptr @loop_dynamic_update_slice_fusion_47, !"kernel", i32 1}
!121 = !{ptr @loop_dynamic_update_slice_fusion_47, !"reqntidx", i32 40}
!122 = !{ptr @loop_add_divide_exponential_select_fusion, !"kernel", i32 1}
!123 = !{ptr @loop_add_divide_exponential_select_fusion, !"reqntidx", i32 40}
!124 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!125 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 40}
!126 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 40}
!128 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!129 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 40}
!130 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 40}
!132 = !{ptr @loop_dynamic_update_slice_fusion_28, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_28, !"reqntidx", i32 40}
!134 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 40}
!136 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 40}
!138 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 40}
!140 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 40}
!142 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 40}
!144 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 40}
!146 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 40}
!148 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!149 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 40}
!150 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!151 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 40}
!152 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!153 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 40}
!154 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!155 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 40}
!156 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!157 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 40}
!158 = !{ptr @loop_dynamic_update_slice_fusion_20, !"kernel", i32 1}
!159 = !{ptr @loop_dynamic_update_slice_fusion_20, !"reqntidx", i32 40}
!160 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!161 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 40}
!162 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 40}
!164 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 40}
!166 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 40}
!168 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 40}
!170 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!171 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 40}
!172 = !{ptr @loop_dynamic_update_slice_fusion_31, !"kernel", i32 1}
!173 = !{ptr @loop_dynamic_update_slice_fusion_31, !"reqntidx", i32 40}
!174 = !{ptr @loop_dynamic_update_slice_fusion_33, !"kernel", i32 1}
!175 = !{ptr @loop_dynamic_update_slice_fusion_33, !"reqntidx", i32 40}
!176 = !{ptr @loop_dynamic_update_slice_fusion_24, !"kernel", i32 1}
!177 = !{ptr @loop_dynamic_update_slice_fusion_24, !"reqntidx", i32 40}
!178 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!179 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 40}
!180 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!181 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!182 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!183 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 128}
!184 = !{ptr @loop_exponential_fusion, !"kernel", i32 1}
!185 = !{ptr @loop_exponential_fusion, !"reqntidx", i32 128}
!186 = !{ptr @loop_broadcast_fusion_16, !"kernel", i32 1}
!187 = !{ptr @loop_broadcast_fusion_16, !"reqntidx", i32 1024}
!188 = !{ptr @input_scatter_fusion_2, !"kernel", i32 1}
!189 = !{ptr @input_scatter_fusion_2, !"reqntidx", i32 128}
!190 = !{ptr @loop_concatenate_fusion, !"kernel", i32 1}
!191 = !{ptr @loop_concatenate_fusion, !"reqntidx", i32 128}
!192 = !{ptr @loop_select_slice_fusion, !"kernel", i32 1}
!193 = !{ptr @loop_select_slice_fusion, !"reqntidx", i32 128}
!194 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!195 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 1024}
!196 = !{ptr @loop_broadcast_fusion_17, !"kernel", i32 1}
!197 = !{ptr @loop_broadcast_fusion_17, !"reqntidx", i32 40}
!198 = !{ptr @loop_dynamic_slice_fusion_2, !"kernel", i32 1}
!199 = !{ptr @loop_dynamic_slice_fusion_2, !"reqntidx", i32 1}
!200 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!201 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!202 = !{ptr @loop_dynamic_slice_fusion_4, !"kernel", i32 1}
!203 = !{ptr @loop_dynamic_slice_fusion_4, !"reqntidx", i32 40}
!204 = !{ptr @loop_dynamic_slice_fusion_3, !"kernel", i32 1}
!205 = !{ptr @loop_dynamic_slice_fusion_3, !"reqntidx", i32 40}
!206 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!207 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 40}
!208 = !{ptr @loop_broadcast_fusion_2, !"kernel", i32 1}
!209 = !{ptr @loop_broadcast_fusion_2, !"reqntidx", i32 20}
!210 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!211 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 20}
!212 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!213 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 40}
!214 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!215 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 40}
!216 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!217 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 40}
!218 = !{ptr @input_reduce_fusion_2, !"kernel", i32 1}
!219 = !{ptr @input_reduce_fusion_2, !"reqntidx", i32 1024}
!220 = !{ptr @input_concatenate_reduce_fusion, !"kernel", i32 1}
!221 = !{ptr @input_concatenate_reduce_fusion, !"reqntidx", i32 64}
!222 = !{ptr @loop_multiply_select_fusion, !"kernel", i32 1}
!223 = !{ptr @loop_multiply_select_fusion, !"reqntidx", i32 40}
!224 = !{ptr @input_reduce_fusion_3, !"kernel", i32 1}
!225 = !{ptr @input_reduce_fusion_3, !"reqntidx", i32 1024}
!226 = !{ptr @loop_reduce_fusion, !"kernel", i32 1}
!227 = !{ptr @loop_reduce_fusion, !"reqntidx", i32 2}
!228 = !{ptr @loop_add_compare_convert_select_fusion, !"kernel", i32 1}
!229 = !{ptr @loop_add_compare_convert_select_fusion, !"reqntidx", i32 2}
!230 = !{ptr @input_scatter_fusion_1, !"kernel", i32 1}
!231 = !{ptr @input_scatter_fusion_1, !"reqntidx", i32 128}
!232 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!233 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 128}
!234 = !{ptr @input_reduce_fusion_1, !"kernel", i32 1}
!235 = !{ptr @input_reduce_fusion_1, !"reqntidx", i32 32}
!236 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!237 = !{ptr @input_reduce_fusion, !"reqntidx", i32 64}
!238 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!239 = !{ptr @loop_select_fusion, !"reqntidx", i32 2}
!240 = !{ptr @loop_select_fusion_2, !"kernel", i32 1}
!241 = !{ptr @loop_select_fusion_2, !"reqntidx", i32 40}
!242 = !{ptr @loop_select_fusion_3, !"kernel", i32 1}
!243 = !{ptr @loop_select_fusion_3, !"reqntidx", i32 2}
!244 = !{ptr @loop_subtract_fusion_1, !"kernel", i32 1}
!245 = !{ptr @loop_subtract_fusion_1, !"reqntidx", i32 128}
!246 = !{ptr @input_reduce_fusion_6, !"kernel", i32 1}
!247 = !{ptr @input_reduce_fusion_6, !"reqntidx", i32 64}
!248 = !{ptr @loop_select_fusion_5, !"kernel", i32 1}
!249 = !{ptr @loop_select_fusion_5, !"reqntidx", i32 40}
!250 = !{ptr @loop_select_fusion_4, !"kernel", i32 1}
!251 = !{ptr @loop_select_fusion_4, !"reqntidx", i32 128}
!252 = !{ptr @loop_compare_select_fusion, !"kernel", i32 1}
!253 = !{ptr @loop_compare_select_fusion, !"reqntidx", i32 2}
!254 = !{ptr @loop_select_fusion_6, !"kernel", i32 1}
!255 = !{ptr @loop_select_fusion_6, !"reqntidx", i32 40}
!256 = !{ptr @loop_dynamic_update_slice_fusion_97, !"kernel", i32 1}
!257 = !{ptr @loop_dynamic_update_slice_fusion_97, !"reqntidx", i32 2}
!258 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!259 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 2}
!260 = !{ptr @loop_dynamic_update_slice_fusion_95, !"kernel", i32 1}
!261 = !{ptr @loop_dynamic_update_slice_fusion_95, !"reqntidx", i32 2}
!262 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!263 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 2}
!264 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!265 = !{i32 2, i32 0}
!266 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!267 = !{i32 0, i32 20}
!268 = !{i32 0, i32 4}
!269 = !{i32 0, i32 128}
!270 = !{}
!271 = !{i32 0, i32 2}
!272 = !{i32 0, i32 8}
!273 = !{i32 0, i32 64}
!274 = !{i32 0, i32 40}
!275 = !{i32 0, i32 3}
!276 = !{i32 0, i32 1024}
!277 = !{i32 0, i32 32}
!278 = !{i32 0, i32 6}
!279 = !{i32 0, i32 192}
!280 = !{i32 0, i32 60}
!281 = !{i32 0, i32 120}
!282 = !{i32 0, i32 30}
!283 = distinct !{!283, !284}
!284 = !{!"llvm.loop.vectorize.enable", i1 false}
!285 = distinct !{!285, !284}
!286 = distinct !{!286, !284}
!287 = distinct !{!287, !284}
!288 = !{i32 0, i32 19}
