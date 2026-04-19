; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_15_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@buffer_for_constant_1481_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache2 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache5 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache6 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache7 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache8 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache9 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache10 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache11 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache12 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef
@shared_cache13 = private unnamed_addr addrspace(3) global [2 x [1 x double]] undef

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
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !268
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 980
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
  %10 = getelementptr inbounds [960 x double], ptr addrspace(1) %arg15, i64 0, i64 %9
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
define void @input_concatenate_fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg2) local_unnamed_addr #2 {
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
define void @loop_slice_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg2) local_unnamed_addr #3 {
entry:
  %arg2102 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1100 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg098 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !268
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
define void @loop_multiply_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4608) %arg1) local_unnamed_addr #2 {
entry:
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !272
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 576
  br i1 %3, label %loop_multiply_fusion.1.in_bounds-true, label %loop_multiply_fusion.1.in_bounds-after

loop_multiply_fusion.1.in_bounds-after:           ; preds = %__nv_log1p.exit, %entry
  ret void

loop_multiply_fusion.1.in_bounds-true:            ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 287
  %.urem = add nsw i32 %linear_index, -288
  %.cmp42 = icmp ult i32 %linear_index, 288
  %4 = select i1 %.cmp42, i32 %linear_index, i32 %.urem
  %5 = zext i1 %.cmp to i64
  %6 = getelementptr inbounds [2 x [1 x [2 x i32]]], ptr addrspace(1) %arg044, i64 0, i64 %5, i64 0, i64 0
  %7 = load <2 x i32>, ptr addrspace(1) %6, align 8, !invariant.load !270
  %8 = extractelement <2 x i32> %7, i32 0
  %9 = extractelement <2 x i32> %7, i32 1
  %10 = add i32 %8, %4
  %11 = add nuw nsw i32 %4, 288
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
  %add.4547.5 = fadd double %96, -1.000000e+00
  %multiply.3070.3 = fmul double %add.4547.5, 2.000000e+00
  %add.4548.3 = fadd double %multiply.3070.3, 0xBFEFFFFFFFFFFFFF
  %97 = fcmp ugt double %add.4548.3, 0xBFEFFFFFFFFFFFFF
  %maximum.49.3 = select i1 %97, double %add.4548.3, double 0xBFEFFFFFFFFFFFFF
  %98 = tail call double @llvm.fabs.f64(double %add.4548.3)
  %99 = fcmp oeq double %98, 1.000000e+00
  %compare.1188.3 = and i1 %97, %99
  %100 = fneg double %maximum.49.3
  %multiply.3072.7 = fmul double %maximum.49.3, %100
  %101 = tail call i32 @llvm.nvvm.d2i.hi(double %multiply.3072.7) #13
  %102 = bitcast i32 %101 to float
  %103 = fcmp olt float %102, 0x3FFCAAAAA0000000
  %104 = fcmp ogt float %102, 0xBFFB333320000000
  %or.cond.i = and i1 %103, %104
  br i1 %or.cond.i, label %105, label %122

105:                                              ; preds = %loop_multiply_fusion.1.in_bounds-true
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

122:                                              ; preds = %loop_multiply_fusion.1.in_bounds-true
  %123 = fadd double %multiply.3072.7, 1.000000e+00
  %124 = tail call i32 @llvm.nvvm.d2i.hi(double %123) #13
  %125 = tail call i32 @llvm.nvvm.d2i.lo(double %123) #13
  %126 = icmp slt i32 %124, 1048576
  %127 = fmul double %123, 0x4350000000000000
  %128 = tail call i32 @llvm.nvvm.d2i.lo(double %127) #13
  %129 = tail call i32 @llvm.nvvm.d2i.hi(double %127) #13
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
  %138 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %137) #13
  %139 = icmp ugt i32 %137, 1073127582
  %140 = tail call i32 @llvm.nvvm.d2i.lo(double %138) #13
  %141 = tail call i32 @llvm.nvvm.d2i.hi(double %138) #13
  %142 = add i32 %141, -1048576
  %143 = tail call double @llvm.nvvm.lohi.i2d(i32 %140, i32 %142) #13
  %spec.select = select i1 %139, double %143, double %138
  %144 = zext i1 %139 to i32
  %spec.select43 = add nsw i32 %135, %144
  %145 = fadd double %spec.select, -1.000000e+00
  %146 = fadd double %spec.select, 1.000000e+00
  %147 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %146) #13
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
  %170 = tail call double @llvm.nvvm.lohi.i2d(i32 %169, i32 1127219200) #13
  %171 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
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
  %182 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
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
  %multiply.3073.35 = fmul double %221, %224
  %add.4550.35 = fadd double %219, %multiply.3073.35
  %multiply.3074.33 = fmul double %224, %add.4550.35
  %add.4551.33 = fadd double %217, %multiply.3074.33
  %multiply.3075.31 = fmul double %224, %add.4551.33
  %add.4552.31 = fadd double %215, %multiply.3075.31
  %multiply.3076.29 = fmul double %224, %add.4552.31
  %add.4553.29 = fadd double %213, %multiply.3076.29
  %multiply.3077.27 = fmul double %224, %add.4553.29
  %add.4554.27 = fadd double %211, %multiply.3077.27
  %multiply.3078.25 = fmul double %224, %add.4554.27
  %add.4555.25 = fadd double %209, %multiply.3078.25
  %multiply.3079.23 = fmul double %224, %add.4555.25
  %add.4556.23 = fadd double %207, %multiply.3079.23
  %multiply.3080.21 = fmul double %224, %add.4556.23
  %add.4557.21 = fadd double %205, %multiply.3080.21
  %multiply.3081.19 = fmul double %224, %add.4557.21
  %add.4558.19 = fadd double %203, %multiply.3081.19
  %multiply.3082.17 = fmul double %224, %add.4558.19
  %add.4559.17 = fadd double %201, %multiply.3082.17
  %multiply.3083.15 = fmul double %224, %add.4559.17
  %add.4560.15 = fadd double %199, %multiply.3083.15
  %multiply.3084.13 = fmul double %224, %add.4560.15
  %add.4561.13 = fadd double %197, %multiply.3084.13
  %multiply.3085.11 = fmul double %224, %add.4561.13
  %add.4562.11 = fadd double %195, %multiply.3085.11
  %multiply.3086.9 = fmul double %224, %add.4562.11
  %add.4563.9 = fadd double %193, %multiply.3086.9
  %multiply.3087.7 = fmul double %224, %add.4563.9
  %add.4564.7 = fadd double %191, %multiply.3087.7
  %multiply.3088.5 = fmul double %224, %add.4564.7
  %add.4565.5 = fadd double %189, %multiply.3088.5
  %multiply.3089.3 = fmul double %224, %add.4565.5
  %add.4566.3 = fadd double %187, %multiply.3089.3
  %225 = select i1 %compare.1190.3, double %add.4566.3, double %add.4565.5
  %multiply.3090.3 = fmul double %224, %225
  %add.4567.3 = fadd double %186, %multiply.3090.3
  %226 = select i1 %compare.1190.3, double %add.4567.3, double %add.4565.5
  %multiply.3091.3 = fmul double %224, %226
  %add.4568.3 = fadd double %multiply.3091.3, 0xBF4845769484FCA8
  %227 = select i1 %compare.1189.3, double %add.4568.3, double %226
  %multiply.3092.3 = fmul double %224, %227
  %add.4569.3 = fadd double %multiply.3092.3, 0xBF78B6C33114F909
  %228 = select i1 %compare.1189.3, double %add.4569.3, double %226
  %multiply.3093.3 = fmul double %224, %228
  %add.4570.3 = fadd double %multiply.3093.3, 0x3FCEBD80D9B13E28
  %229 = select i1 %compare.1189.3, double %add.4570.3, double %226
  %multiply.3094.1 = fmul double %224, %229
  %add.4571.1 = fadd double %multiply.3094.1, 0x3FFA755E7C99AE86
  %230 = select i1 %compare.1189.3, double %add.4571.1, double %226
  %.v = select i1 %compare.1188.3, double 0x7FF0000000000000, double %230
  %231 = fmul double %maximum.49.3, %.v
  %multiply.3096.1 = fmul double %231, 0x3FF6A09E667F3BCD
  %232 = zext nneg i32 %linear_index to i64
  %233 = getelementptr double, ptr addrspace(1) %arg146, i64 %232
  store double %multiply.3096.1, ptr addrspace(1) %233, align 8
  br label %loop_multiply_fusion.1.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #4 {
entry:
  %arg163 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg061 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %3 = zext nneg i32 %2 to i64
  %param_0.539618 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %3
  %4 = load <2 x double>, ptr addrspace(1) %param_0.539618, align 16, !invariant.load !270
  %param_0.53961971 = extractelement <2 x double> %4, i32 0
  %param_0.539619.172 = extractelement <2 x double> %4, i32 1
  %multiply.3097.122 = fmul double %param_0.53961971, %param_0.53961971
  %multiply.3097.122.1 = fmul double %param_0.539619.172, %param_0.539619.172
  %add.3969.i50.1 = fadd double %multiply.3097.122, %multiply.3097.122.1
  %5 = shl nuw nsw i32 %thread.id.x, 1
  %6 = or i32 %5, 64
  %7 = zext nneg i32 %6 to i64
  %param_0.539618.157 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %7
  %param_0.539619.158 = load double, ptr addrspace(1) %param_0.539618.157, align 16, !invariant.load !270
  %multiply.3097.122.159 = fmul double %param_0.539619.158, %param_0.539619.158
  %add.3969.i50.160 = fadd double %add.3969.i50.1, %multiply.3097.122.159
  %8 = or i32 %5, 65
  %9 = zext nneg i32 %8 to i64
  %param_0.539618.1.1 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %9
  %param_0.539619.1.1 = load double, ptr addrspace(1) %param_0.539618.1.1, align 8, !invariant.load !270
  %multiply.3097.122.1.1 = fmul double %param_0.539619.1.1, %param_0.539619.1.1
  %add.3969.i50.1.1 = fadd double %add.3969.i50.160, %multiply.3097.122.1.1
  %param_0.539618.266 = getelementptr inbounds i8, ptr addrspace(1) %param_0.539618, i64 1024
  %10 = load <2 x double>, ptr addrspace(1) %param_0.539618.266, align 16, !invariant.load !270
  %param_0.539619.273 = extractelement <2 x double> %10, i32 0
  %param_0.539619.1.274 = extractelement <2 x double> %10, i32 1
  %multiply.3097.122.2 = fmul double %param_0.539619.273, %param_0.539619.273
  %add.3969.i50.2 = fadd double %add.3969.i50.1.1, %multiply.3097.122.2
  %multiply.3097.122.1.2 = fmul double %param_0.539619.1.274, %param_0.539619.1.274
  %add.3969.i50.1.2 = fadd double %add.3969.i50.2, %multiply.3097.122.1.2
  %11 = or i32 %5, 192
  %12 = zext nneg i32 %11 to i64
  %param_0.539618.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %12
  %param_0.539619.3 = load double, ptr addrspace(1) %param_0.539618.3, align 16, !invariant.load !270
  %multiply.3097.122.3 = fmul double %param_0.539619.3, %param_0.539619.3
  %add.3969.i50.3 = fadd double %add.3969.i50.1.2, %multiply.3097.122.3
  %13 = or i32 %5, 193
  %14 = zext nneg i32 %13 to i64
  %param_0.539618.1.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %14
  %param_0.539619.1.3 = load double, ptr addrspace(1) %param_0.539618.1.3, align 8, !invariant.load !270
  %multiply.3097.122.1.3 = fmul double %param_0.539619.1.3, %param_0.539619.1.3
  %add.3969.i50.1.3 = fadd double %add.3969.i50.3, %multiply.3097.122.1.3
  %15 = or disjoint i32 %thread.id.2, 128
  %16 = icmp ult i32 %15, 144
  br i1 %16, label %loop3.loop_header13.preheader.4, label %x_in_tile-after.7

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

loop3.loop_header13.preheader.4:                  ; preds = %entry
  %17 = shl nuw nsw i32 %15, 1
  %18 = zext nneg i32 %17 to i64
  %param_0.539618.4 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %18
  %19 = load <2 x double>, ptr addrspace(1) %param_0.539618.4, align 16, !invariant.load !270
  %param_0.539619.469 = extractelement <2 x double> %19, i32 0
  %param_0.539619.1.470 = extractelement <2 x double> %19, i32 1
  %multiply.3097.122.4 = fmul double %param_0.539619.469, %param_0.539619.469
  %add.3969.i50.4 = fadd double %add.3969.i50.1.3, %multiply.3097.122.4
  %multiply.3097.122.1.4 = fmul double %param_0.539619.1.470, %param_0.539619.1.470
  %add.3969.i50.1.4 = fadd double %add.3969.i50.4, %multiply.3097.122.1.4
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %entry, %loop3.loop_header13.preheader.4
  %partial_reduction_result.2.4 = phi double [ %add.3969.i50.1.3, %entry ], [ %add.3969.i50.1.4, %loop3.loop_header13.preheader.4 ]
  %20 = bitcast double %partial_reduction_result.2.4 to <2 x i32>
  %21 = extractelement <2 x i32> %20, i64 0
  %22 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %21, i32 16, i32 31)
  %23 = insertelement <2 x i32> poison, i32 %22, i64 0
  %24 = extractelement <2 x i32> %20, i64 1
  %25 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %24, i32 16, i32 31)
  %26 = insertelement <2 x i32> %23, i32 %25, i64 1
  %27 = bitcast <2 x i32> %26 to double
  %add.3969.i = fadd double %partial_reduction_result.2.4, %27
  %28 = bitcast double %add.3969.i to <2 x i32>
  %29 = extractelement <2 x i32> %28, i64 0
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 8, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %30, i64 0
  %32 = extractelement <2 x i32> %28, i64 1
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 8, i32 31)
  %34 = insertelement <2 x i32> %31, i32 %33, i64 1
  %35 = bitcast <2 x i32> %34 to double
  %add.3969.i46 = fadd double %add.3969.i, %35
  %36 = bitcast double %add.3969.i46 to <2 x i32>
  %37 = extractelement <2 x i32> %36, i64 0
  %38 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 4, i32 31)
  %39 = insertelement <2 x i32> poison, i32 %38, i64 0
  %40 = extractelement <2 x i32> %36, i64 1
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 4, i32 31)
  %42 = insertelement <2 x i32> %39, i32 %41, i64 1
  %43 = bitcast <2 x i32> %42 to double
  %add.3969.i47 = fadd double %add.3969.i46, %43
  %44 = bitcast double %add.3969.i47 to <2 x i32>
  %45 = extractelement <2 x i32> %44, i64 0
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 2, i32 31)
  %47 = insertelement <2 x i32> poison, i32 %46, i64 0
  %48 = extractelement <2 x i32> %44, i64 1
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 2, i32 31)
  %50 = insertelement <2 x i32> %47, i32 %49, i64 1
  %51 = bitcast <2 x i32> %50 to double
  %add.3969.i48 = fadd double %add.3969.i47, %51
  %52 = bitcast double %add.3969.i48 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 1, i32 31)
  %55 = extractelement <2 x i32> %52, i64 1
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 1, i32 31)
  %57 = icmp eq i32 %thread.id.2, 0
  %58 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %1, i64 0
  %59 = insertelement <2 x i32> poison, i32 %54, i64 0
  %60 = insertelement <2 x i32> %59, i32 %56, i64 1
  %61 = bitcast <2 x i32> %60 to double
  %add.3969.i49 = fadd double %add.3969.i48, %61
  br i1 %57, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %62 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg163, i64 0, i64 %1
  br i1 %62, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i49, ptr addrspace(3) %58, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %58, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

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
define void @wrapped_slice_5(ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %.urem = add nsw i32 %0, -48
  %.cmp1 = icmp ult i32 %0, 48
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [288 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 1920
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_4(ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %.urem = add nsw i32 %0, -48
  %.cmp1 = icmp ult i32 %0, 48
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [288 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 1536
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_3(ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %.urem = add nsw i32 %0, -48
  %.cmp1 = icmp ult i32 %0, 48
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [288 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 1152
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_2(ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %.urem = add nsw i32 %0, -48
  %.cmp1 = icmp ult i32 %0, 48
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [288 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 768
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_1(ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %.urem = add nsw i32 %0, -48
  %.cmp1 = icmp ult i32 %0, 48
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [288 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 384
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !270
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg14, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice(ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #2 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %.urem = add nsw i32 %0, -48
  %.cmp1 = icmp ult i32 %0, 48
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !270
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr double, ptr addrspace(1) %arg14, i64 %6
  store double %5, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_98(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.5811 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.5811, 0
  %4 = add i64 %param_2.5811, 10
  %5 = select i1 %3, i64 %4, i64 %param_2.5811
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 9)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.76585 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr inbounds [10 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.76585, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(46080) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !275
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 5760
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
  %param_2.4289 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.42892 = load i64, ptr addrspace(1) %param_2.4289, align 8, !invariant.load !270
  %6 = icmp slt i64 %param_2.42892, 10
  %param_1.5728 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg113, i64 0, i64 %5
  %param_1.57283 = load i8, ptr addrspace(1) %param_1.5728, align 1, !invariant.load !270
  %param_0.4058 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg011, i64 0, i64 %5
  %param_0.40584 = load i8, ptr addrspace(1) %param_0.4058, align 1, !invariant.load !270
  %7 = or i8 %param_0.40584, %param_1.57283
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
define void @input_concatenate_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(48) %arg2) local_unnamed_addr #2 {
entry:
  %arg2103 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1101 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg099 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !275
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
define void @loop_slice_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(48) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !278
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
define void @loop_select_fusion_7(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg38, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg39, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg40, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg45, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg46, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg47, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg48, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg49, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg50, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg51, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg52, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg53, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg54) local_unnamed_addr #2 {
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
  %.cmp = icmp ugt i32 %0, 47
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
define void @input_reduce_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg6) local_unnamed_addr #4 {
entry:
  %arg6149 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5147 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4145 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3143 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2141 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1139 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0137 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %3 = icmp ult i32 %thread.id.2, 24
  %4 = add nsw i32 %2, -48
  %.sink134 = select i1 %3, i32 %2, i32 %4
  %arg1.sink132 = select i1 %3, ptr addrspace(1) %arg0137, ptr addrspace(1) %arg1139
  %5 = zext nneg i32 %.sink134 to i64
  %param_1.569631 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg1.sink132, i64 0, i64 %1, i64 %5
  %6 = load double, ptr addrspace(1) %param_1.569631, align 16, !invariant.load !270
  %multiply.3060.356 = fmul double %6, %6
  %7 = or disjoint i32 %2, 1
  %8 = add nsw i32 %2, -47
  %.sink136 = select i1 %3, i32 %7, i32 %8
  %9 = zext nneg i32 %.sink136 to i64
  %param_0.403628.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg1.sink132, i64 0, i64 %1, i64 %9
  %10 = load double, ptr addrspace(1) %param_0.403628.1, align 8, !invariant.load !270
  %multiply.3060.356.1 = fmul double %10, %10
  %add.3969.i87.1 = fadd double %multiply.3060.356, %multiply.3060.356.1
  %11 = shl nuw nsw i32 %thread.id.x, 1
  %12 = or i32 %11, 64
  %13 = icmp ult i32 %12, 96
  %.sink = select i1 %13, i32 -48, i32 -96
  %arg1.sink = select i1 %13, ptr addrspace(1) %arg1139, ptr addrspace(1) %arg2141
  %14 = add nsw i32 %12, %.sink
  %15 = zext nneg i32 %14 to i64
  %param_1.569631.1106 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg1.sink, i64 0, i64 %1, i64 %15
  %16 = load double, ptr addrspace(1) %param_1.569631.1106, align 16, !invariant.load !270
  %multiply.3060.356.1111 = fmul double %16, %16
  %add.3969.i87.1112 = fadd double %add.3969.i87.1, %multiply.3060.356.1111
  %17 = or i32 %11, 65
  %18 = icmp ult i32 %17, 96
  %.sink118 = select i1 %18, i32 -48, i32 -96
  %arg1.sink115 = select i1 %18, ptr addrspace(1) %arg1139, ptr addrspace(1) %arg2141
  %19 = add nsw i32 %17, %.sink118
  %20 = zext nneg i32 %19 to i64
  %param_1.569631.1.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg1.sink115, i64 0, i64 %1, i64 %20
  %21 = load double, ptr addrspace(1) %param_1.569631.1.1, align 8, !invariant.load !270
  %multiply.3060.356.1.1 = fmul double %21, %21
  %add.3969.i87.1.1 = fadd double %add.3969.i87.1112, %multiply.3060.356.1.1
  %22 = or disjoint i32 %2, 128
  %23 = icmp ult i32 %22, 144
  %.sink121 = select i1 %23, i32 32, i32 -16
  %arg2.sink = select i1 %23, ptr addrspace(1) %arg2141, ptr addrspace(1) %arg3143
  %24 = add nsw i32 %2, %.sink121
  %25 = zext nneg i32 %24 to i64
  %param_2.425334.2 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg2.sink, i64 0, i64 %1, i64 %25
  %26 = load double, ptr addrspace(1) %param_2.425334.2, align 16, !invariant.load !270
  %multiply.3060.356.2 = fmul double %26, %26
  %add.3969.i87.2 = fadd double %add.3969.i87.1.1, %multiply.3060.356.2
  %.sink125 = select i1 %23, i32 33, i32 -15
  %27 = add nsw i32 %2, %.sink125
  %28 = zext nneg i32 %27 to i64
  %param_2.425334.1.2 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg2.sink, i64 0, i64 %1, i64 %28
  %29 = load double, ptr addrspace(1) %param_2.425334.1.2, align 8, !invariant.load !270
  %multiply.3060.356.1.2 = fmul double %29, %29
  %add.3969.i87.1.2 = fadd double %add.3969.i87.2, %multiply.3060.356.1.2
  %30 = or i32 %11, 192
  %31 = icmp ult i32 %30, 240
  %32 = and i32 %11, 62
  %33 = add nsw i32 %30, -240
  %.sink127 = select i1 %31, i32 %32, i32 %33
  %arg4.sink = select i1 %31, ptr addrspace(1) %arg4145, ptr addrspace(1) %arg5147
  %34 = zext nneg i32 %.sink127 to i64
  %param_4.255540.3 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg4.sink, i64 0, i64 %1, i64 %34
  %35 = load double, ptr addrspace(1) %param_4.255540.3, align 16, !invariant.load !270
  %multiply.3060.356.3 = fmul double %35, %35
  %add.3969.i87.3 = fadd double %add.3969.i87.1.2, %multiply.3060.356.3
  %36 = or i32 %11, 193
  %37 = icmp ult i32 %36, 240
  %.sink131 = select i1 %37, i32 -192, i32 -240
  %arg4.sink128 = select i1 %37, ptr addrspace(1) %arg4145, ptr addrspace(1) %arg5147
  %38 = add nsw i32 %36, %.sink131
  %39 = zext nneg i32 %38 to i64
  %param_4.255540.1.3 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg4.sink128, i64 0, i64 %1, i64 %39
  %40 = load double, ptr addrspace(1) %param_4.255540.1.3, align 8, !invariant.load !270
  %multiply.3060.356.1.3 = fmul double %40, %40
  %add.3969.i87.1.3 = fadd double %add.3969.i87.3, %multiply.3060.356.1.3
  %41 = or disjoint i32 %thread.id.2, 128
  %42 = icmp ult i32 %41, 144
  br i1 %42, label %loop3.loop_header21.preheader.4, label %x_in_tile-after.7

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

loop3.loop_header21.preheader.4:                  ; preds = %entry
  %43 = shl nuw nsw i32 %41, 1
  %44 = add nsw i32 %43, -240
  %45 = zext nneg i32 %44 to i64
  %param_5.197043.4 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg5147, i64 0, i64 %1, i64 %45
  %46 = load <2 x double>, ptr addrspace(1) %param_5.197043.4, align 16, !invariant.load !270
  %47 = extractelement <2 x double> %46, i32 0
  %48 = extractelement <2 x double> %46, i32 1
  %multiply.3060.356.4 = fmul double %47, %47
  %add.3969.i87.4 = fadd double %add.3969.i87.1.3, %multiply.3060.356.4
  %multiply.3060.356.1.4 = fmul double %48, %48
  %add.3969.i87.1.4 = fadd double %add.3969.i87.4, %multiply.3060.356.1.4
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %entry, %loop3.loop_header21.preheader.4
  %partial_reduction_result.2.4 = phi double [ %add.3969.i87.1.3, %entry ], [ %add.3969.i87.1.4, %loop3.loop_header21.preheader.4 ]
  %49 = bitcast double %partial_reduction_result.2.4 to <2 x i32>
  %50 = extractelement <2 x i32> %49, i64 0
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 16, i32 31)
  %52 = insertelement <2 x i32> poison, i32 %51, i64 0
  %53 = extractelement <2 x i32> %49, i64 1
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 16, i32 31)
  %55 = insertelement <2 x i32> %52, i32 %54, i64 1
  %56 = bitcast <2 x i32> %55 to double
  %add.3969.i = fadd double %partial_reduction_result.2.4, %56
  %57 = bitcast double %add.3969.i to <2 x i32>
  %58 = extractelement <2 x i32> %57, i64 0
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 8, i32 31)
  %60 = insertelement <2 x i32> poison, i32 %59, i64 0
  %61 = extractelement <2 x i32> %57, i64 1
  %62 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 8, i32 31)
  %63 = insertelement <2 x i32> %60, i32 %62, i64 1
  %64 = bitcast <2 x i32> %63 to double
  %add.3969.i83 = fadd double %add.3969.i, %64
  %65 = bitcast double %add.3969.i83 to <2 x i32>
  %66 = extractelement <2 x i32> %65, i64 0
  %67 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %66, i32 4, i32 31)
  %68 = insertelement <2 x i32> poison, i32 %67, i64 0
  %69 = extractelement <2 x i32> %65, i64 1
  %70 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %69, i32 4, i32 31)
  %71 = insertelement <2 x i32> %68, i32 %70, i64 1
  %72 = bitcast <2 x i32> %71 to double
  %add.3969.i84 = fadd double %add.3969.i83, %72
  %73 = bitcast double %add.3969.i84 to <2 x i32>
  %74 = extractelement <2 x i32> %73, i64 0
  %75 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %74, i32 2, i32 31)
  %76 = insertelement <2 x i32> poison, i32 %75, i64 0
  %77 = extractelement <2 x i32> %73, i64 1
  %78 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %77, i32 2, i32 31)
  %79 = insertelement <2 x i32> %76, i32 %78, i64 1
  %80 = bitcast <2 x i32> %79 to double
  %add.3969.i85 = fadd double %add.3969.i84, %80
  %81 = bitcast double %add.3969.i85 to <2 x i32>
  %82 = extractelement <2 x i32> %81, i64 0
  %83 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %82, i32 1, i32 31)
  %84 = extractelement <2 x i32> %81, i64 1
  %85 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %84, i32 1, i32 31)
  %86 = icmp eq i32 %thread.id.2, 0
  %87 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 %1, i64 0
  %88 = insertelement <2 x i32> poison, i32 %83, i64 0
  %89 = insertelement <2 x i32> %88, i32 %85, i64 1
  %90 = bitcast <2 x i32> %89 to double
  %add.3969.i86 = fadd double %add.3969.i85, %90
  br i1 %86, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %91 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg6149, i64 0, i64 %1
  br i1 %91, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i86, ptr addrspace(3) %87, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %87, align 8
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
  %param_2.2762 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg216, i64 0, i64 %5
  %param_2.27622 = load i64, ptr addrspace(1) %param_2.2762, align 8, !invariant.load !270
  %param_3.2381 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg318, i64 0, i64 %5
  %param_3.23813 = load i64, ptr addrspace(1) %param_3.2381, align 8, !invariant.load !270
  %6 = icmp slt i64 %param_2.27622, %param_3.23813
  %param_1.3515 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg114, i64 0, i64 %5
  %param_1.35154 = load i8, ptr addrspace(1) %param_1.3515, align 1, !invariant.load !270
  %param_0.2483 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg012, i64 0, i64 %5
  %param_0.24835 = load i8, ptr addrspace(1) %param_0.2483, align 1, !invariant.load !270
  %7 = or i8 %param_0.24835, %param_1.35154
  %8 = trunc i8 %7 to i1
  %9 = xor i1 %8, true
  %10 = and i1 %6, %9
  %11 = zext i1 %10 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg420, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind
define void @input_add_exponential_reduce_select_fusion(ptr noalias nocapture align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg19, ptr noalias nocapture align 128 dereferenceable(768) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg21, ptr noalias nocapture align 128 dereferenceable(768) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg23, ptr noalias nocapture align 128 dereferenceable(768) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg25, ptr noalias nocapture align 128 dereferenceable(768) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg30, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg31, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg32, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg33, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg34, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg35, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg38, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg39, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg40, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg43) local_unnamed_addr #4 {
entry:
  %arg432483 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg422481 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg412479 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg402477 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg392475 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg382473 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg372471 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg362469 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg352467 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg342465 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg332463 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg322461 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg312459 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg302457 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg292455 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg282453 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg272451 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg262449 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg252447 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg242445 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg232443 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg222441 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg212439 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg202437 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg192435 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg182433 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg172431 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg162429 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg152427 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg142425 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg132423 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg122421 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg112419 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg102417 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg92415 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg82413 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg72411 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg62409 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg52407 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg42405 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg32403 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg22401 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg12399 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02397 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_18.14941037 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg182433, i64 0, i64 %1
  %param_1.76981528 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg12399, i64 0, i64 %1
  %param_4.37811530 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg42405, i64 0, i64 %1
  %param_3.49451532 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg32403, i64 0, i64 %1
  %param_2.58621534 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg22401, i64 0, i64 %1
  %2 = zext nneg i32 %thread.id.2 to i64
  %param_5.29991035 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg52407, i64 0, i64 %1, i64 %2
  %param_5.29991036 = load double, ptr addrspace(1) %param_5.29991035, align 8
  %param_18.14941038 = load i64, ptr addrspace(1) %param_18.14941037, align 8, !invariant.load !270
  %3 = sitofp i64 %param_18.14941038 to double
  %multiply.3000.13.clone.11040 = fmul double %3, 0x3F818590FECF82C5
  %param_14.11071055 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg142425, i64 0, i64 %1, i64 %2
  %param_14.11071056 = load double, ptr addrspace(1) %param_14.11071055, align 8, !invariant.load !270
  %multiply.3002.5.clone.11060 = fmul double %3, 0x3F718590FECF82C5
  %param_15.11031061 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg152427, i64 0, i64 %1, i64 %2
  %param_15.11031062 = load double, ptr addrspace(1) %param_15.11031061, align 8, !invariant.load !270
  %multiply.3004.29.clone.11063 = fmul double %multiply.3002.5.clone.11060, %param_15.11031062
  %add.4166.27.clone.11064 = fadd double %param_14.11071056, %multiply.3004.29.clone.11063
  %multiply.3009.13.clone.11120 = fmul double %add.4166.27.clone.11064, 5.000000e-01
  %add.4172.10.clone.11121 = fadd double %multiply.3009.13.clone.11120, %multiply.3009.13.clone.11120
  %multiply.3025.3.clone.11122 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11121
  %add.4191.1.clone.11123 = fadd double %param_5.29991036, %multiply.3025.3.clone.11122
  %add.4192.71125 = fadd double %add.4191.1.clone.11123, -1.000000e+00
  %multiply.3026.51126 = fmul double %add.4192.71125, %add.4192.71125
  %multiply.3027.51128 = fmul double %multiply.3026.51126, 4.000000e+00
  %add.4193.51130 = fadd double %multiply.3027.51128, 0x3FDCE6BB25AA1315
  %multiply.3028.31132 = fmul double %add.4193.51130, 5.000000e-01
  %4 = fsub double 0.000000e+00, %multiply.3028.31132
  %param_19.17301134 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg192435, i64 0, i64 %1, i64 %2
  %param_19.17301135 = load double, ptr addrspace(1) %param_19.17301134, align 8, !invariant.load !270
  %param_6.24481198 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg62409, i64 0, i64 %1, i64 %2
  %param_6.24481199 = load double, ptr addrspace(1) %param_6.24481198, align 8, !invariant.load !270
  %param_7.20681204 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg72411, i64 0, i64 %1, i64 %2
  %param_7.20681205 = load double, ptr addrspace(1) %param_7.20681204, align 8, !invariant.load !270
  %multiply.3008.29.clone.11206 = fmul double %multiply.3002.5.clone.11060, %param_7.20681205
  %add.4171.27.clone.11207 = fadd double %param_6.24481199, %multiply.3008.29.clone.11206
  %multiply.3009.13.clone.11219 = fmul double %add.4171.27.clone.11207, 5.000000e-01
  %add.4172.10.clone.11220 = fadd double %multiply.3009.13.clone.11219, %multiply.3009.13.clone.11219
  %multiply.3021.3.clone.1.clone.11221 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11220
  %add.4186.1.clone.1.clone.11222 = fadd double %param_19.17301135, %multiply.3021.3.clone.1.clone.11221
  %add.4187.7.clone.11224 = fadd double %add.4186.1.clone.1.clone.11222, 6.000000e+00
  %multiply.3022.7.clone.11225 = fmul double %add.4187.7.clone.11224, %add.4187.7.clone.11224
  %multiply.3023.7.clone.11227 = fmul double %multiply.3022.7.clone.11225, 2.500000e-01
  %add.4188.5.clone.11229 = fadd double %multiply.3023.7.clone.11227, 0x4009CB1A63AF7C52
  %multiply.3024.3.clone.11231 = fmul double %add.4188.5.clone.11229, 5.000000e-01
  %5 = fsub double 0.000000e+00, %multiply.3024.3.clone.11231
  %param_21.14631233 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg212439, i64 0, i64 %1, i64 %2
  %param_21.14631234 = load double, ptr addrspace(1) %param_21.14631233, align 8, !invariant.load !270
  %param_8.18841286 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg82413, i64 0, i64 %1, i64 %2
  %param_8.18841287 = load double, ptr addrspace(1) %param_8.18841286, align 8, !invariant.load !270
  %param_9.17021292 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg92415, i64 0, i64 %1, i64 %2
  %param_9.17021293 = load double, ptr addrspace(1) %param_9.17021292, align 8, !invariant.load !270
  %multiply.3007.29.clone.11294 = fmul double %multiply.3002.5.clone.11060, %param_9.17021293
  %add.4169.27.clone.11295 = fadd double %param_8.18841287, %multiply.3007.29.clone.11294
  %multiply.3009.13.clone.11318 = fmul double %add.4169.27.clone.11295, 5.000000e-01
  %add.4172.10.clone.11319 = fadd double %multiply.3009.13.clone.11318, %multiply.3009.13.clone.11318
  %multiply.3010.3.clone.1.clone.11320 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11319
  %add.4173.1.clone.1.clone.11321 = fadd double %param_21.14631234, %multiply.3010.3.clone.1.clone.11320
  %add.4174.7.clone.11323 = fadd double %add.4173.1.clone.1.clone.11321, 4.000000e+00
  %multiply.3011.7.clone.11324 = fmul double %add.4174.7.clone.11323, %add.4174.7.clone.11323
  %multiply.3012.7.clone.11326 = fmul double %multiply.3011.7.clone.11324, 2.500000e-01
  %add.4176.5.clone.11328 = fadd double %multiply.3012.7.clone.11326, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.11330 = fmul double %add.4176.5.clone.11328, 5.000000e-01
  %6 = fsub double 0.000000e+00, %multiply.3013.3.clone.11330
  %param_23.10351332 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg232443, i64 0, i64 %1, i64 %2
  %param_23.10351333 = load double, ptr addrspace(1) %param_23.10351332, align 8, !invariant.load !270
  %param_10.15501374 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg102417, i64 0, i64 %1, i64 %2
  %param_10.15501375 = load double, ptr addrspace(1) %param_10.15501374, align 8, !invariant.load !270
  %param_11.13521380 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg112419, i64 0, i64 %1, i64 %2
  %param_11.13521381 = load double, ptr addrspace(1) %param_11.13521380, align 8, !invariant.load !270
  %multiply.3006.29.clone.11382 = fmul double %multiply.3002.5.clone.11060, %param_11.13521381
  %add.4168.27.clone.11383 = fadd double %param_10.15501375, %multiply.3006.29.clone.11382
  %multiply.3009.13.clone.11417 = fmul double %add.4168.27.clone.11383, 5.000000e-01
  %add.4172.10.clone.11418 = fadd double %multiply.3009.13.clone.11417, %multiply.3009.13.clone.11417
  %multiply.3029.3.clone.1.clone.11419 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11418
  %add.4196.1.clone.1.clone.11420 = fadd double %param_23.10351333, %multiply.3029.3.clone.1.clone.11419
  %add.4197.7.clone.11422 = fadd double %add.4196.1.clone.1.clone.11420, -1.000000e+00
  %multiply.3030.5.clone.11423 = fmul double %add.4197.7.clone.11422, %add.4197.7.clone.11422
  %add.4198.5.clone.11425 = fadd double %multiply.3030.5.clone.11423, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.11427 = fmul double %add.4198.5.clone.11425, 5.000000e-01
  %7 = fsub double 0.000000e+00, %multiply.3031.3.clone.11427
  %param_25.9481429 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg252447, i64 0, i64 %1, i64 %2
  %param_25.9481430 = load double, ptr addrspace(1) %param_25.9481429, align 8, !invariant.load !270
  %param_12.12601460 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg122421, i64 0, i64 %1, i64 %2
  %param_12.12601461 = load double, ptr addrspace(1) %param_12.12601460, align 8, !invariant.load !270
  %param_13.11661466 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg132423, i64 0, i64 %1, i64 %2
  %param_13.11661467 = load double, ptr addrspace(1) %param_13.11661466, align 8, !invariant.load !270
  %multiply.3005.29.clone.11468 = fmul double %multiply.3002.5.clone.11060, %param_13.11661467
  %add.4167.27.clone.11469 = fadd double %param_12.12601461, %multiply.3005.29.clone.11468
  %multiply.3009.13.clone.11514 = fmul double %add.4167.27.clone.11469, 5.000000e-01
  %add.4172.10.clone.11515 = fadd double %multiply.3009.13.clone.11514, %multiply.3009.13.clone.11514
  %multiply.3014.3.clone.1.clone.11516 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11515
  %add.4177.1.clone.1.clone.11517 = fadd double %param_25.9481430, %multiply.3014.3.clone.1.clone.11516
  %add.4178.7.clone.11519 = fadd double %add.4177.1.clone.1.clone.11517, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.11520 = fmul double %add.4178.7.clone.11519, %add.4178.7.clone.11519
  %multiply.3016.7.clone.11522 = fmul double %multiply.3015.7.clone.11520, 0x3FFC71C71C71C71C
  %add.4179.5.clone.11524 = fadd double %multiply.3016.7.clone.11522, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.11526 = fmul double %add.4179.5.clone.11524, 5.000000e-01
  %8 = fsub double 0.000000e+00, %multiply.3017.3.clone.11526
  %param_1.76981529 = load i64, ptr addrspace(1) %param_1.76981528, align 8, !invariant.load !270
  %param_4.37811531 = load i64, ptr addrspace(1) %param_4.37811530, align 8, !invariant.load !270
  %9 = icmp sge i64 %param_1.76981529, %param_4.37811531
  %param_3.49451533 = load i8, ptr addrspace(1) %param_3.49451532, align 1, !invariant.load !270
  %param_2.58621535 = load i8, ptr addrspace(1) %param_2.58621534, align 1, !invariant.load !270
  %10 = or i8 %param_2.58621535, %param_3.49451533
  %11 = trunc i8 %10 to i1
  %.not2316 = or i1 %9, %11
  %12 = icmp eq i64 %param_1.76981529, 0
  %param_0.54121540 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg02397, i64 0, i64 %1, i64 %2
  %param_0.54121541 = load double, ptr addrspace(1) %param_0.54121540, align 8
  %13 = select i1 %12, double %add.4191.1.clone.11123, double %param_0.54121541
  %14 = select i1 %.not2316, double %param_0.54121541, double %13
  %15 = select i1 %.not2316, double %param_5.29991036, double %add.4191.1.clone.11123
  %16 = select i1 %.not2316, double %param_19.17301135, double %add.4186.1.clone.1.clone.11222
  %param_20.17471746 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg202437, i64 0, i64 %1, i64 %2
  %param_20.17471747 = load double, ptr addrspace(1) %param_20.17471746, align 8
  %17 = select i1 %12, double %add.4186.1.clone.1.clone.11222, double %param_20.17471747
  %18 = select i1 %.not2316, double %param_20.17471747, double %17
  %19 = select i1 %.not2316, double %param_21.14631234, double %add.4173.1.clone.1.clone.11321
  %param_22.11881853 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg222441, i64 0, i64 %1, i64 %2
  %param_22.11881854 = load double, ptr addrspace(1) %param_22.11881853, align 8
  %20 = select i1 %12, double %add.4173.1.clone.1.clone.11321, double %param_22.11881854
  %21 = select i1 %.not2316, double %param_22.11881854, double %20
  %22 = select i1 %.not2316, double %param_23.10351333, double %add.4196.1.clone.1.clone.11420
  %param_24.10071960 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg242445, i64 0, i64 %1, i64 %2
  %param_24.10071961 = load double, ptr addrspace(1) %param_24.10071960, align 8
  %23 = select i1 %12, double %add.4196.1.clone.1.clone.11420, double %param_24.10071961
  %24 = select i1 %.not2316, double %param_24.10071961, double %23
  %25 = tail call double @llvm.fma.f64(double %add.4177.1.clone.1.clone.11517, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #13
  %27 = tail call double @llvm.nvvm.add.rn.d(double %25, double 0xC338000000000000) #13
  %28 = tail call double @llvm.fma.f64(double %27, double 0xBFE62E42FEFA39EF, double %add.4177.1.clone.1.clone.11517)
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
  %41 = tail call i32 @llvm.nvvm.d2i.lo(double %40) #13
  %42 = tail call i32 @llvm.nvvm.d2i.hi(double %40) #13
  %43 = shl i32 %26, 20
  %44 = add i32 %42, %43
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 %41, i32 %44) #13
  %46 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4177.1.clone.1.clone.11517) #13
  %47 = bitcast i32 %46 to float
  %48 = tail call float @llvm.nvvm.fabs.f(float %47) #13
  %49 = fcmp olt float %48, 0x4010C46560000000
  br i1 %49, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after2270, %reduction_write_output-true2274
  ret void

thread_in_bounds-after:                           ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  %50 = icmp eq i32 %290, 0
  %51 = bitcast double %partial_reduction_result2.2.1 to <2 x i32>
  %52 = extractelement <2 x i32> %51, i64 0
  %53 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %52, i32 16, i32 31)
  %54 = insertelement <2 x i32> poison, i32 %53, i64 0
  %55 = extractelement <2 x i32> %51, i64 1
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 16, i32 31)
  %57 = insertelement <2 x i32> %54, i32 %56, i64 1
  %58 = bitcast <2 x i32> %57 to double
  %add.3969.i2356 = fadd double %partial_reduction_result2.2.1, %58
  %59 = bitcast double %add.3969.i2356 to <2 x i32>
  %60 = extractelement <2 x i32> %59, i64 0
  %61 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %60, i32 8, i32 31)
  %62 = insertelement <2 x i32> poison, i32 %61, i64 0
  %63 = extractelement <2 x i32> %59, i64 1
  %64 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %63, i32 8, i32 31)
  %65 = insertelement <2 x i32> %62, i32 %64, i64 1
  %66 = bitcast <2 x i32> %65 to double
  %add.3969.i2357 = fadd double %add.3969.i2356, %66
  %67 = bitcast double %add.3969.i2357 to <2 x i32>
  %68 = extractelement <2 x i32> %67, i64 0
  %69 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %68, i32 4, i32 31)
  %70 = insertelement <2 x i32> poison, i32 %69, i64 0
  %71 = extractelement <2 x i32> %67, i64 1
  %72 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %71, i32 4, i32 31)
  %73 = insertelement <2 x i32> %70, i32 %72, i64 1
  %74 = bitcast <2 x i32> %73 to double
  %add.3969.i2358 = fadd double %add.3969.i2357, %74
  %75 = bitcast double %add.3969.i2358 to <2 x i32>
  %76 = extractelement <2 x i32> %75, i64 0
  %77 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %76, i32 2, i32 31)
  %78 = insertelement <2 x i32> poison, i32 %77, i64 0
  %79 = extractelement <2 x i32> %75, i64 1
  %80 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %79, i32 2, i32 31)
  %81 = insertelement <2 x i32> %78, i32 %80, i64 1
  %82 = bitcast <2 x i32> %81 to double
  %add.3969.i2359 = fadd double %add.3969.i2358, %82
  %83 = bitcast double %add.3969.i2359 to <2 x i32>
  %84 = extractelement <2 x i32> %83, i64 0
  %85 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %84, i32 1, i32 31)
  %86 = extractelement <2 x i32> %83, i64 1
  %87 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %86, i32 1, i32 31)
  %88 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache3, i64 0, i64 %1, i64 0
  %89 = insertelement <2 x i32> poison, i32 %85, i64 0
  %90 = insertelement <2 x i32> %89, i32 %87, i64 1
  %91 = bitcast <2 x i32> %90 to double
  %add.3969.i2360 = fadd double %add.3969.i2359, %91
  br i1 %50, label %intra_warp_reduce_write-true2191, label %intra_warp_reduce_write-after2192

thread_in_bounds-after2190:                       ; preds = %intra_warp_reduce_write-after2192, %reduction_write_output-true2196
  %92 = icmp eq i32 %290, 0
  %93 = bitcast double %partial_reduction_result5.2.1 to <2 x i32>
  %94 = extractelement <2 x i32> %93, i64 0
  %95 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %94, i32 16, i32 31)
  %96 = insertelement <2 x i32> poison, i32 %95, i64 0
  %97 = extractelement <2 x i32> %93, i64 1
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 16, i32 31)
  %99 = insertelement <2 x i32> %96, i32 %98, i64 1
  %100 = bitcast <2 x i32> %99 to double
  %add.3969.i2361 = fadd double %partial_reduction_result5.2.1, %100
  %101 = bitcast double %add.3969.i2361 to <2 x i32>
  %102 = extractelement <2 x i32> %101, i64 0
  %103 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %102, i32 8, i32 31)
  %104 = insertelement <2 x i32> poison, i32 %103, i64 0
  %105 = extractelement <2 x i32> %101, i64 1
  %106 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %105, i32 8, i32 31)
  %107 = insertelement <2 x i32> %104, i32 %106, i64 1
  %108 = bitcast <2 x i32> %107 to double
  %add.3969.i2362 = fadd double %add.3969.i2361, %108
  %109 = bitcast double %add.3969.i2362 to <2 x i32>
  %110 = extractelement <2 x i32> %109, i64 0
  %111 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %110, i32 4, i32 31)
  %112 = insertelement <2 x i32> poison, i32 %111, i64 0
  %113 = extractelement <2 x i32> %109, i64 1
  %114 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %113, i32 4, i32 31)
  %115 = insertelement <2 x i32> %112, i32 %114, i64 1
  %116 = bitcast <2 x i32> %115 to double
  %add.3969.i2363 = fadd double %add.3969.i2362, %116
  %117 = bitcast double %add.3969.i2363 to <2 x i32>
  %118 = extractelement <2 x i32> %117, i64 0
  %119 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %118, i32 2, i32 31)
  %120 = insertelement <2 x i32> poison, i32 %119, i64 0
  %121 = extractelement <2 x i32> %117, i64 1
  %122 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %121, i32 2, i32 31)
  %123 = insertelement <2 x i32> %120, i32 %122, i64 1
  %124 = bitcast <2 x i32> %123 to double
  %add.3969.i2364 = fadd double %add.3969.i2363, %124
  %125 = bitcast double %add.3969.i2364 to <2 x i32>
  %126 = extractelement <2 x i32> %125, i64 0
  %127 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %126, i32 1, i32 31)
  %128 = extractelement <2 x i32> %125, i64 1
  %129 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %128, i32 1, i32 31)
  %130 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache4, i64 0, i64 %1, i64 0
  %131 = insertelement <2 x i32> poison, i32 %127, i64 0
  %132 = insertelement <2 x i32> %131, i32 %129, i64 1
  %133 = bitcast <2 x i32> %132 to double
  %add.3969.i2365 = fadd double %add.3969.i2364, %133
  br i1 %92, label %intra_warp_reduce_write-true2217, label %intra_warp_reduce_write-after2218

thread_in_bounds-after2216:                       ; preds = %intra_warp_reduce_write-after2218, %reduction_write_output-true2222
  %134 = icmp eq i32 %290, 0
  %135 = bitcast double %partial_reduction_result8.2.1 to <2 x i32>
  %136 = extractelement <2 x i32> %135, i64 0
  %137 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %136, i32 16, i32 31)
  %138 = insertelement <2 x i32> poison, i32 %137, i64 0
  %139 = extractelement <2 x i32> %135, i64 1
  %140 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %139, i32 16, i32 31)
  %141 = insertelement <2 x i32> %138, i32 %140, i64 1
  %142 = bitcast <2 x i32> %141 to double
  %add.3969.i2366 = fadd double %partial_reduction_result8.2.1, %142
  %143 = bitcast double %add.3969.i2366 to <2 x i32>
  %144 = extractelement <2 x i32> %143, i64 0
  %145 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %144, i32 8, i32 31)
  %146 = insertelement <2 x i32> poison, i32 %145, i64 0
  %147 = extractelement <2 x i32> %143, i64 1
  %148 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %147, i32 8, i32 31)
  %149 = insertelement <2 x i32> %146, i32 %148, i64 1
  %150 = bitcast <2 x i32> %149 to double
  %add.3969.i2367 = fadd double %add.3969.i2366, %150
  %151 = bitcast double %add.3969.i2367 to <2 x i32>
  %152 = extractelement <2 x i32> %151, i64 0
  %153 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %152, i32 4, i32 31)
  %154 = insertelement <2 x i32> poison, i32 %153, i64 0
  %155 = extractelement <2 x i32> %151, i64 1
  %156 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %155, i32 4, i32 31)
  %157 = insertelement <2 x i32> %154, i32 %156, i64 1
  %158 = bitcast <2 x i32> %157 to double
  %add.3969.i2368 = fadd double %add.3969.i2367, %158
  %159 = bitcast double %add.3969.i2368 to <2 x i32>
  %160 = extractelement <2 x i32> %159, i64 0
  %161 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %160, i32 2, i32 31)
  %162 = insertelement <2 x i32> poison, i32 %161, i64 0
  %163 = extractelement <2 x i32> %159, i64 1
  %164 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %163, i32 2, i32 31)
  %165 = insertelement <2 x i32> %162, i32 %164, i64 1
  %166 = bitcast <2 x i32> %165 to double
  %add.3969.i2369 = fadd double %add.3969.i2368, %166
  %167 = bitcast double %add.3969.i2369 to <2 x i32>
  %168 = extractelement <2 x i32> %167, i64 0
  %169 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %168, i32 1, i32 31)
  %170 = extractelement <2 x i32> %167, i64 1
  %171 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %170, i32 1, i32 31)
  %172 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache5, i64 0, i64 %1, i64 0
  %173 = insertelement <2 x i32> poison, i32 %169, i64 0
  %174 = insertelement <2 x i32> %173, i32 %171, i64 1
  %175 = bitcast <2 x i32> %174 to double
  %add.3969.i2370 = fadd double %add.3969.i2369, %175
  br i1 %134, label %intra_warp_reduce_write-true2243, label %intra_warp_reduce_write-after2244

thread_in_bounds-after2242:                       ; preds = %intra_warp_reduce_write-after2244, %reduction_write_output-true2248
  %176 = icmp eq i32 %290, 0
  %177 = bitcast double %partial_reduction_result11.2.1 to <2 x i32>
  %178 = extractelement <2 x i32> %177, i64 0
  %179 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %178, i32 16, i32 31)
  %180 = insertelement <2 x i32> poison, i32 %179, i64 0
  %181 = extractelement <2 x i32> %177, i64 1
  %182 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %181, i32 16, i32 31)
  %183 = insertelement <2 x i32> %180, i32 %182, i64 1
  %184 = bitcast <2 x i32> %183 to double
  %add.3969.i2371 = fadd double %partial_reduction_result11.2.1, %184
  %185 = bitcast double %add.3969.i2371 to <2 x i32>
  %186 = extractelement <2 x i32> %185, i64 0
  %187 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %186, i32 8, i32 31)
  %188 = insertelement <2 x i32> poison, i32 %187, i64 0
  %189 = extractelement <2 x i32> %185, i64 1
  %190 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %189, i32 8, i32 31)
  %191 = insertelement <2 x i32> %188, i32 %190, i64 1
  %192 = bitcast <2 x i32> %191 to double
  %add.3969.i2372 = fadd double %add.3969.i2371, %192
  %193 = bitcast double %add.3969.i2372 to <2 x i32>
  %194 = extractelement <2 x i32> %193, i64 0
  %195 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %194, i32 4, i32 31)
  %196 = insertelement <2 x i32> poison, i32 %195, i64 0
  %197 = extractelement <2 x i32> %193, i64 1
  %198 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %197, i32 4, i32 31)
  %199 = insertelement <2 x i32> %196, i32 %198, i64 1
  %200 = bitcast <2 x i32> %199 to double
  %add.3969.i2373 = fadd double %add.3969.i2372, %200
  %201 = bitcast double %add.3969.i2373 to <2 x i32>
  %202 = extractelement <2 x i32> %201, i64 0
  %203 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %202, i32 2, i32 31)
  %204 = insertelement <2 x i32> poison, i32 %203, i64 0
  %205 = extractelement <2 x i32> %201, i64 1
  %206 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %205, i32 2, i32 31)
  %207 = insertelement <2 x i32> %204, i32 %206, i64 1
  %208 = bitcast <2 x i32> %207 to double
  %add.3969.i2374 = fadd double %add.3969.i2373, %208
  %209 = bitcast double %add.3969.i2374 to <2 x i32>
  %210 = extractelement <2 x i32> %209, i64 0
  %211 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %210, i32 1, i32 31)
  %212 = extractelement <2 x i32> %209, i64 1
  %213 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %212, i32 1, i32 31)
  %214 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache6, i64 0, i64 %1, i64 0
  %215 = insertelement <2 x i32> poison, i32 %211, i64 0
  %216 = insertelement <2 x i32> %215, i32 %213, i64 1
  %217 = bitcast <2 x i32> %216 to double
  %add.3969.i2375 = fadd double %add.3969.i2374, %217
  br i1 %176, label %intra_warp_reduce_write-true2269, label %intra_warp_reduce_write-after2270

x_in_tile-true.1:                                 ; preds = %__nv_exp.exit
  %218 = icmp eq i64 %param_1.76981529, 0
  %219 = zext nneg i32 %361 to i64
  %param_5.29991035.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg52407, i64 0, i64 %1, i64 %219
  %param_5.29991036.1 = load double, ptr addrspace(1) %param_5.29991035.1, align 8
  %param_14.11071055.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg142425, i64 0, i64 %1, i64 %219
  %param_14.11071056.1 = load double, ptr addrspace(1) %param_14.11071055.1, align 8, !invariant.load !270
  %param_15.11031061.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg152427, i64 0, i64 %1, i64 %219
  %param_15.11031062.1 = load double, ptr addrspace(1) %param_15.11031061.1, align 8, !invariant.load !270
  %multiply.3004.29.clone.11063.1 = fmul double %multiply.3002.5.clone.11060, %param_15.11031062.1
  %add.4166.27.clone.11064.1 = fadd double %param_14.11071056.1, %multiply.3004.29.clone.11063.1
  %multiply.3009.13.clone.11120.1 = fmul double %add.4166.27.clone.11064.1, 5.000000e-01
  %add.4172.10.clone.11121.1 = fadd double %multiply.3009.13.clone.11120.1, %multiply.3009.13.clone.11120.1
  %multiply.3025.3.clone.11122.1 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11121.1
  %add.4191.1.clone.11123.1 = fadd double %param_5.29991036.1, %multiply.3025.3.clone.11122.1
  %add.4192.71125.1 = fadd double %add.4191.1.clone.11123.1, -1.000000e+00
  %multiply.3026.51126.1 = fmul double %add.4192.71125.1, %add.4192.71125.1
  %multiply.3027.51128.1 = fmul double %multiply.3026.51126.1, 4.000000e+00
  %add.4193.51130.1 = fadd double %multiply.3027.51128.1, 0x3FDCE6BB25AA1315
  %multiply.3028.31132.1 = fmul double %add.4193.51130.1, 5.000000e-01
  %220 = fsub double %4, %multiply.3028.31132.1
  %param_19.17301134.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg192435, i64 0, i64 %1, i64 %219
  %param_19.17301135.1 = load double, ptr addrspace(1) %param_19.17301134.1, align 8, !invariant.load !270
  %param_6.24481198.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg62409, i64 0, i64 %1, i64 %219
  %param_6.24481199.1 = load double, ptr addrspace(1) %param_6.24481198.1, align 8, !invariant.load !270
  %param_7.20681204.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg72411, i64 0, i64 %1, i64 %219
  %param_7.20681205.1 = load double, ptr addrspace(1) %param_7.20681204.1, align 8, !invariant.load !270
  %multiply.3008.29.clone.11206.1 = fmul double %multiply.3002.5.clone.11060, %param_7.20681205.1
  %add.4171.27.clone.11207.1 = fadd double %param_6.24481199.1, %multiply.3008.29.clone.11206.1
  %multiply.3009.13.clone.11219.1 = fmul double %add.4171.27.clone.11207.1, 5.000000e-01
  %add.4172.10.clone.11220.1 = fadd double %multiply.3009.13.clone.11219.1, %multiply.3009.13.clone.11219.1
  %multiply.3021.3.clone.1.clone.11221.1 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11220.1
  %add.4186.1.clone.1.clone.11222.1 = fadd double %param_19.17301135.1, %multiply.3021.3.clone.1.clone.11221.1
  %add.4187.7.clone.11224.1 = fadd double %add.4186.1.clone.1.clone.11222.1, 6.000000e+00
  %multiply.3022.7.clone.11225.1 = fmul double %add.4187.7.clone.11224.1, %add.4187.7.clone.11224.1
  %multiply.3023.7.clone.11227.1 = fmul double %multiply.3022.7.clone.11225.1, 2.500000e-01
  %add.4188.5.clone.11229.1 = fadd double %multiply.3023.7.clone.11227.1, 0x4009CB1A63AF7C52
  %multiply.3024.3.clone.11231.1 = fmul double %add.4188.5.clone.11229.1, 5.000000e-01
  %221 = fsub double %5, %multiply.3024.3.clone.11231.1
  %param_21.14631233.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg212439, i64 0, i64 %1, i64 %219
  %param_21.14631234.1 = load double, ptr addrspace(1) %param_21.14631233.1, align 8, !invariant.load !270
  %param_8.18841286.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg82413, i64 0, i64 %1, i64 %219
  %param_8.18841287.1 = load double, ptr addrspace(1) %param_8.18841286.1, align 8, !invariant.load !270
  %param_9.17021292.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg92415, i64 0, i64 %1, i64 %219
  %param_9.17021293.1 = load double, ptr addrspace(1) %param_9.17021292.1, align 8, !invariant.load !270
  %multiply.3007.29.clone.11294.1 = fmul double %multiply.3002.5.clone.11060, %param_9.17021293.1
  %add.4169.27.clone.11295.1 = fadd double %param_8.18841287.1, %multiply.3007.29.clone.11294.1
  %multiply.3009.13.clone.11318.1 = fmul double %add.4169.27.clone.11295.1, 5.000000e-01
  %add.4172.10.clone.11319.1 = fadd double %multiply.3009.13.clone.11318.1, %multiply.3009.13.clone.11318.1
  %multiply.3010.3.clone.1.clone.11320.1 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11319.1
  %add.4173.1.clone.1.clone.11321.1 = fadd double %param_21.14631234.1, %multiply.3010.3.clone.1.clone.11320.1
  %add.4174.7.clone.11323.1 = fadd double %add.4173.1.clone.1.clone.11321.1, 4.000000e+00
  %multiply.3011.7.clone.11324.1 = fmul double %add.4174.7.clone.11323.1, %add.4174.7.clone.11323.1
  %multiply.3012.7.clone.11326.1 = fmul double %multiply.3011.7.clone.11324.1, 2.500000e-01
  %add.4176.5.clone.11328.1 = fadd double %multiply.3012.7.clone.11326.1, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.11330.1 = fmul double %add.4176.5.clone.11328.1, 5.000000e-01
  %222 = fsub double %6, %multiply.3013.3.clone.11330.1
  %param_23.10351332.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg232443, i64 0, i64 %1, i64 %219
  %param_23.10351333.1 = load double, ptr addrspace(1) %param_23.10351332.1, align 8, !invariant.load !270
  %param_10.15501374.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg102417, i64 0, i64 %1, i64 %219
  %param_10.15501375.1 = load double, ptr addrspace(1) %param_10.15501374.1, align 8, !invariant.load !270
  %param_11.13521380.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg112419, i64 0, i64 %1, i64 %219
  %param_11.13521381.1 = load double, ptr addrspace(1) %param_11.13521380.1, align 8, !invariant.load !270
  %multiply.3006.29.clone.11382.1 = fmul double %multiply.3002.5.clone.11060, %param_11.13521381.1
  %add.4168.27.clone.11383.1 = fadd double %param_10.15501375.1, %multiply.3006.29.clone.11382.1
  %multiply.3009.13.clone.11417.1 = fmul double %add.4168.27.clone.11383.1, 5.000000e-01
  %add.4172.10.clone.11418.1 = fadd double %multiply.3009.13.clone.11417.1, %multiply.3009.13.clone.11417.1
  %multiply.3029.3.clone.1.clone.11419.1 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11418.1
  %add.4196.1.clone.1.clone.11420.1 = fadd double %param_23.10351333.1, %multiply.3029.3.clone.1.clone.11419.1
  %add.4197.7.clone.11422.1 = fadd double %add.4196.1.clone.1.clone.11420.1, -1.000000e+00
  %multiply.3030.5.clone.11423.1 = fmul double %add.4197.7.clone.11422.1, %add.4197.7.clone.11422.1
  %add.4198.5.clone.11425.1 = fadd double %multiply.3030.5.clone.11423.1, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.11427.1 = fmul double %add.4198.5.clone.11425.1, 5.000000e-01
  %223 = fsub double %7, %multiply.3031.3.clone.11427.1
  %param_25.9481429.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg252447, i64 0, i64 %1, i64 %219
  %param_25.9481430.1 = load double, ptr addrspace(1) %param_25.9481429.1, align 8, !invariant.load !270
  %param_12.12601460.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg122421, i64 0, i64 %1, i64 %219
  %param_12.12601461.1 = load double, ptr addrspace(1) %param_12.12601460.1, align 8, !invariant.load !270
  %param_13.11661466.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg132423, i64 0, i64 %1, i64 %219
  %param_13.11661467.1 = load double, ptr addrspace(1) %param_13.11661466.1, align 8, !invariant.load !270
  %multiply.3005.29.clone.11468.1 = fmul double %multiply.3002.5.clone.11060, %param_13.11661467.1
  %add.4167.27.clone.11469.1 = fadd double %param_12.12601461.1, %multiply.3005.29.clone.11468.1
  %multiply.3009.13.clone.11514.1 = fmul double %add.4167.27.clone.11469.1, 5.000000e-01
  %add.4172.10.clone.11515.1 = fadd double %multiply.3009.13.clone.11514.1, %multiply.3009.13.clone.11514.1
  %multiply.3014.3.clone.1.clone.11516.1 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.11515.1
  %add.4177.1.clone.1.clone.11517.1 = fadd double %param_25.9481430.1, %multiply.3014.3.clone.1.clone.11516.1
  %add.4178.7.clone.11519.1 = fadd double %add.4177.1.clone.1.clone.11517.1, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.11520.1 = fmul double %add.4178.7.clone.11519.1, %add.4178.7.clone.11519.1
  %multiply.3016.7.clone.11522.1 = fmul double %multiply.3015.7.clone.11520.1, 0x3FFC71C71C71C71C
  %add.4179.5.clone.11524.1 = fadd double %multiply.3016.7.clone.11522.1, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.11526.1 = fmul double %add.4179.5.clone.11524.1, 5.000000e-01
  %224 = fsub double %8, %multiply.3017.3.clone.11526.1
  %param_0.54121540.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg02397, i64 0, i64 %1, i64 %219
  %param_0.54121541.1 = load double, ptr addrspace(1) %param_0.54121540.1, align 8
  %225 = select i1 %218, double %add.4191.1.clone.11123.1, double %param_0.54121541.1
  %226 = select i1 %.not2316, double %param_0.54121541.1, double %225
  %227 = select i1 %.not2316, double %param_5.29991036.1, double %add.4191.1.clone.11123.1
  %228 = select i1 %.not2316, double %param_19.17301135.1, double %add.4186.1.clone.1.clone.11222.1
  %param_20.17471746.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg202437, i64 0, i64 %1, i64 %219
  %param_20.17471747.1 = load double, ptr addrspace(1) %param_20.17471746.1, align 8
  %229 = select i1 %218, double %add.4186.1.clone.1.clone.11222.1, double %param_20.17471747.1
  %230 = select i1 %.not2316, double %param_20.17471747.1, double %229
  %231 = select i1 %.not2316, double %param_21.14631234.1, double %add.4173.1.clone.1.clone.11321.1
  %param_22.11881853.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg222441, i64 0, i64 %1, i64 %219
  %param_22.11881854.1 = load double, ptr addrspace(1) %param_22.11881853.1, align 8
  %232 = select i1 %218, double %add.4173.1.clone.1.clone.11321.1, double %param_22.11881854.1
  %233 = select i1 %.not2316, double %param_22.11881854.1, double %232
  %234 = select i1 %.not2316, double %param_23.10351333.1, double %add.4196.1.clone.1.clone.11420.1
  %param_24.10071960.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg242445, i64 0, i64 %1, i64 %219
  %param_24.10071961.1 = load double, ptr addrspace(1) %param_24.10071960.1, align 8
  %235 = select i1 %218, double %add.4196.1.clone.1.clone.11420.1, double %param_24.10071961.1
  %236 = select i1 %.not2316, double %param_24.10071961.1, double %235
  %237 = tail call double @llvm.fma.f64(double %add.4177.1.clone.1.clone.11517.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %238 = tail call i32 @llvm.nvvm.d2i.lo(double %237) #13
  %239 = tail call double @llvm.nvvm.add.rn.d(double %237, double 0xC338000000000000) #13
  %240 = tail call double @llvm.fma.f64(double %239, double 0xBFE62E42FEFA39EF, double %add.4177.1.clone.1.clone.11517.1)
  %241 = tail call double @llvm.fma.f64(double %239, double 0xBC7ABC9E3B39803F, double %240)
  %242 = tail call double @llvm.fma.f64(double %241, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %243 = tail call double @llvm.fma.f64(double %242, double %241, double 0x3EC71DEE62401315)
  %244 = tail call double @llvm.fma.f64(double %243, double %241, double 0x3EFA01997C89EB71)
  %245 = tail call double @llvm.fma.f64(double %244, double %241, double 0x3F2A01A014761F65)
  %246 = tail call double @llvm.fma.f64(double %245, double %241, double 0x3F56C16C1852B7AF)
  %247 = tail call double @llvm.fma.f64(double %246, double %241, double 0x3F81111111122322)
  %248 = tail call double @llvm.fma.f64(double %247, double %241, double 0x3FA55555555502A1)
  %249 = tail call double @llvm.fma.f64(double %248, double %241, double 0x3FC5555555555511)
  %250 = tail call double @llvm.fma.f64(double %249, double %241, double 0x3FE000000000000B)
  %251 = tail call double @llvm.fma.f64(double %250, double %241, double 1.000000e+00)
  %252 = tail call double @llvm.fma.f64(double %251, double %241, double 1.000000e+00)
  %253 = tail call i32 @llvm.nvvm.d2i.lo(double %252) #13
  %254 = tail call i32 @llvm.nvvm.d2i.hi(double %252) #13
  %255 = shl i32 %238, 20
  %256 = add i32 %254, %255
  %257 = tail call double @llvm.nvvm.lohi.i2d(i32 %253, i32 %256) #13
  %258 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4177.1.clone.1.clone.11517.1) #13
  %259 = bitcast i32 %258 to float
  %260 = tail call float @llvm.nvvm.fabs.f(float %259) #13
  %261 = fcmp olt float %260, 0x4010C46560000000
  br i1 %261, label %__nv_exp.exit.1, label %__internal_fast_icmp_abs_lt.exit.i.1

__internal_fast_icmp_abs_lt.exit.i.1:             ; preds = %x_in_tile-true.1
  %262 = fcmp olt double %add.4177.1.clone.1.clone.11517.1, 0.000000e+00
  %263 = fadd double %add.4177.1.clone.1.clone.11517.1, 0x7FF0000000000000
  %z.0.i.1 = select i1 %262, double 0.000000e+00, double %263
  %264 = fcmp olt float %260, 0x4010E90000000000
  br i1 %264, label %265, label %__nv_exp.exit.1

265:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i.1
  %266 = sdiv i32 %238, 2
  %267 = shl i32 %266, 20
  %268 = add i32 %254, %267
  %269 = tail call double @llvm.nvvm.lohi.i2d(i32 %253, i32 %268) #13
  %270 = sub nsw i32 %238, %266
  %271 = shl i32 %270, 20
  %272 = add nsw i32 %271, 1072693248
  %273 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %272) #13
  %274 = fmul double %273, %269
  br label %__nv_exp.exit.1

__nv_exp.exit.1:                                  ; preds = %265, %__internal_fast_icmp_abs_lt.exit.i.1, %x_in_tile-true.1
  %z.2.i.1 = phi double [ %257, %x_in_tile-true.1 ], [ %274, %265 ], [ %z.0.i.1, %__internal_fast_icmp_abs_lt.exit.i.1 ]
  %275 = icmp eq i64 %param_1.76981529, 0
  %276 = select i1 %.not2316, double %param_25.9481430.1, double %add.4177.1.clone.1.clone.11517.1
  %param_26.8392067.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg262449, i64 0, i64 %1, i64 %219
  %param_26.8392068.1 = load double, ptr addrspace(1) %param_26.8392067.1, align 8
  %277 = select i1 %275, double %add.4177.1.clone.1.clone.11517.1, double %param_26.8392068.1
  %278 = select i1 %.not2316, double %param_26.8392068.1, double %277
  %param_27.8172071.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg272451, i64 0, i64 %1, i64 %219
  %param_27.8172072.1 = load double, ptr addrspace(1) %param_27.8172071.1, align 8, !invariant.load !270
  %param_16.12302080.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg162429, i64 0, i64 %1, i64 %219
  %param_16.12302081.1 = load double, ptr addrspace(1) %param_16.12302080.1, align 8, !invariant.load !270
  %param_17.14462086.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg172431, i64 0, i64 %1, i64 %219
  %param_17.14462087.1 = load double, ptr addrspace(1) %param_17.14462086.1, align 8, !invariant.load !270
  %multiply.3003.29.clone.12088.1 = fmul double %multiply.3002.5.clone.11060, %param_17.14462087.1
  %add.4164.27.clone.12089.1 = fadd double %param_16.12302081.1, %multiply.3003.29.clone.12088.1
  %multiply.3009.13.clone.12156.1 = fmul double %add.4164.27.clone.12089.1, 5.000000e-01
  %add.4172.10.clone.12157.1 = fadd double %multiply.3009.13.clone.12156.1, %multiply.3009.13.clone.12156.1
  %multiply.3018.3.clone.12158.1 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.12157.1
  %add.4182.1.clone.12159.1 = fadd double %param_27.8172072.1, %multiply.3018.3.clone.12158.1
  store double %226, ptr addrspace(1) %param_0.54121540.1, align 8
  store double %227, ptr addrspace(1) %param_5.29991035.1, align 8
  %279 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg292455, i64 0, i64 %1, i64 %219
  store double %add.4191.1.clone.11123.1, ptr addrspace(1) %279, align 8
  %280 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg302457, i64 0, i64 %1, i64 %219
  store double %228, ptr addrspace(1) %280, align 8
  store double %230, ptr addrspace(1) %param_20.17471746.1, align 8
  %281 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg322461, i64 0, i64 %1, i64 %219
  store double %add.4186.1.clone.1.clone.11222.1, ptr addrspace(1) %281, align 8
  %282 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg332463, i64 0, i64 %1, i64 %219
  store double %231, ptr addrspace(1) %282, align 8
  store double %233, ptr addrspace(1) %param_22.11881853.1, align 8
  %283 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg352467, i64 0, i64 %1, i64 %219
  store double %add.4173.1.clone.1.clone.11321.1, ptr addrspace(1) %283, align 8
  %284 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg362469, i64 0, i64 %1, i64 %219
  store double %234, ptr addrspace(1) %284, align 8
  store double %236, ptr addrspace(1) %param_24.10071960.1, align 8
  %285 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg382473, i64 0, i64 %1, i64 %219
  store double %add.4196.1.clone.1.clone.11420.1, ptr addrspace(1) %285, align 8
  %286 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg392475, i64 0, i64 %1, i64 %219
  store double %z.2.i.1, ptr addrspace(1) %286, align 8
  %287 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg402477, i64 0, i64 %1, i64 %219
  store double %276, ptr addrspace(1) %287, align 8
  store double %278, ptr addrspace(1) %param_26.8392067.1, align 8
  %288 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg422481, i64 0, i64 %1, i64 %219
  store double %add.4177.1.clone.1.clone.11517.1, ptr addrspace(1) %288, align 8
  %289 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg432483, i64 0, i64 %1, i64 %219
  store double %add.4182.1.clone.12159.1, ptr addrspace(1) %289, align 8
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %__nv_exp.exit.1, %__nv_exp.exit
  %partial_reduction_result5.2.1 = phi double [ %222, %__nv_exp.exit.1 ], [ %6, %__nv_exp.exit ]
  %partial_reduction_result2.2.1 = phi double [ %221, %__nv_exp.exit.1 ], [ %5, %__nv_exp.exit ]
  %partial_reduction_result8.2.1 = phi double [ %223, %__nv_exp.exit.1 ], [ %7, %__nv_exp.exit ]
  %partial_reduction_result.2.1 = phi double [ %220, %__nv_exp.exit.1 ], [ %4, %__nv_exp.exit ]
  %partial_reduction_result11.2.1 = phi double [ %224, %__nv_exp.exit.1 ], [ %8, %__nv_exp.exit ]
  %290 = trunc i64 %2 to i32
  %291 = bitcast double %partial_reduction_result.2.1 to <2 x i32>
  %292 = extractelement <2 x i32> %291, i64 0
  %293 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %292, i32 16, i32 31)
  %294 = insertelement <2 x i32> poison, i32 %293, i64 0
  %295 = extractelement <2 x i32> %291, i64 1
  %296 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %295, i32 16, i32 31)
  %297 = insertelement <2 x i32> %294, i32 %296, i64 1
  %298 = bitcast <2 x i32> %297 to double
  %add.3969.i = fadd double %partial_reduction_result.2.1, %298
  %299 = bitcast double %add.3969.i to <2 x i32>
  %300 = extractelement <2 x i32> %299, i64 0
  %301 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %300, i32 8, i32 31)
  %302 = insertelement <2 x i32> poison, i32 %301, i64 0
  %303 = extractelement <2 x i32> %299, i64 1
  %304 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %303, i32 8, i32 31)
  %305 = insertelement <2 x i32> %302, i32 %304, i64 1
  %306 = bitcast <2 x i32> %305 to double
  %add.3969.i2352 = fadd double %add.3969.i, %306
  %307 = bitcast double %add.3969.i2352 to <2 x i32>
  %308 = extractelement <2 x i32> %307, i64 0
  %309 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %308, i32 4, i32 31)
  %310 = insertelement <2 x i32> poison, i32 %309, i64 0
  %311 = extractelement <2 x i32> %307, i64 1
  %312 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %311, i32 4, i32 31)
  %313 = insertelement <2 x i32> %310, i32 %312, i64 1
  %314 = bitcast <2 x i32> %313 to double
  %add.3969.i2353 = fadd double %add.3969.i2352, %314
  %315 = bitcast double %add.3969.i2353 to <2 x i32>
  %316 = extractelement <2 x i32> %315, i64 0
  %317 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %316, i32 2, i32 31)
  %318 = insertelement <2 x i32> poison, i32 %317, i64 0
  %319 = extractelement <2 x i32> %315, i64 1
  %320 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %319, i32 2, i32 31)
  %321 = insertelement <2 x i32> %318, i32 %320, i64 1
  %322 = bitcast <2 x i32> %321 to double
  %add.3969.i2354 = fadd double %add.3969.i2353, %322
  %323 = bitcast double %add.3969.i2354 to <2 x i32>
  %324 = extractelement <2 x i32> %323, i64 0
  %325 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %324, i32 1, i32 31)
  %326 = extractelement <2 x i32> %323, i64 1
  %327 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %326, i32 1, i32 31)
  %328 = icmp eq i32 %290, 0
  %329 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %1, i64 0
  %330 = insertelement <2 x i32> poison, i32 %325, i64 0
  %331 = insertelement <2 x i32> %330, i32 %327, i64 1
  %332 = bitcast <2 x i32> %331 to double
  %add.3969.i2355 = fadd double %add.3969.i2354, %332
  br i1 %328, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %333 = fcmp olt double %add.4177.1.clone.1.clone.11517, 0.000000e+00
  %334 = fadd double %add.4177.1.clone.1.clone.11517, 0x7FF0000000000000
  %z.0.i = select i1 %333, double 0.000000e+00, double %334
  %335 = fcmp olt float %48, 0x4010E90000000000
  br i1 %335, label %336, label %__nv_exp.exit

336:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %337 = sdiv i32 %26, 2
  %338 = shl i32 %337, 20
  %339 = add i32 %42, %338
  %340 = tail call double @llvm.nvvm.lohi.i2d(i32 %41, i32 %339) #13
  %341 = sub nsw i32 %26, %337
  %342 = shl i32 %341, 20
  %343 = add nsw i32 %342, 1072693248
  %344 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %343) #13
  %345 = fmul double %344, %340
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %336
  %z.2.i = phi double [ %45, %entry ], [ %345, %336 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %346 = icmp eq i64 %param_1.76981529, 0
  %347 = select i1 %.not2316, double %param_25.9481430, double %add.4177.1.clone.1.clone.11517
  %param_26.8392067 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg262449, i64 0, i64 %1, i64 %2
  %param_26.8392068 = load double, ptr addrspace(1) %param_26.8392067, align 8
  %348 = select i1 %346, double %add.4177.1.clone.1.clone.11517, double %param_26.8392068
  %349 = select i1 %.not2316, double %param_26.8392068, double %348
  %param_27.8172071 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg272451, i64 0, i64 %1, i64 %2
  %param_27.8172072 = load double, ptr addrspace(1) %param_27.8172071, align 8, !invariant.load !270
  %param_16.12302080 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg162429, i64 0, i64 %1, i64 %2
  %param_16.12302081 = load double, ptr addrspace(1) %param_16.12302080, align 8, !invariant.load !270
  %param_17.14462086 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg172431, i64 0, i64 %1, i64 %2
  %param_17.14462087 = load double, ptr addrspace(1) %param_17.14462086, align 8, !invariant.load !270
  %multiply.3003.29.clone.12088 = fmul double %multiply.3002.5.clone.11060, %param_17.14462087
  %add.4164.27.clone.12089 = fadd double %param_16.12302081, %multiply.3003.29.clone.12088
  %multiply.3009.13.clone.12156 = fmul double %add.4164.27.clone.12089, 5.000000e-01
  %add.4172.10.clone.12157 = fadd double %multiply.3009.13.clone.12156, %multiply.3009.13.clone.12156
  %multiply.3018.3.clone.12158 = fmul double %multiply.3000.13.clone.11040, %add.4172.10.clone.12157
  %add.4182.1.clone.12159 = fadd double %param_27.8172072, %multiply.3018.3.clone.12158
  store double %14, ptr addrspace(1) %param_0.54121540, align 8
  store double %15, ptr addrspace(1) %param_5.29991035, align 8
  %350 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg292455, i64 0, i64 %1, i64 %2
  store double %add.4191.1.clone.11123, ptr addrspace(1) %350, align 8
  %351 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg302457, i64 0, i64 %1, i64 %2
  store double %16, ptr addrspace(1) %351, align 8
  store double %18, ptr addrspace(1) %param_20.17471746, align 8
  %352 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg322461, i64 0, i64 %1, i64 %2
  store double %add.4186.1.clone.1.clone.11222, ptr addrspace(1) %352, align 8
  %353 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg332463, i64 0, i64 %1, i64 %2
  store double %19, ptr addrspace(1) %353, align 8
  store double %21, ptr addrspace(1) %param_22.11881853, align 8
  %354 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg352467, i64 0, i64 %1, i64 %2
  store double %add.4173.1.clone.1.clone.11321, ptr addrspace(1) %354, align 8
  %355 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg362469, i64 0, i64 %1, i64 %2
  store double %22, ptr addrspace(1) %355, align 8
  store double %24, ptr addrspace(1) %param_24.10071960, align 8
  %356 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg382473, i64 0, i64 %1, i64 %2
  store double %add.4196.1.clone.1.clone.11420, ptr addrspace(1) %356, align 8
  %357 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg392475, i64 0, i64 %1, i64 %2
  store double %z.2.i, ptr addrspace(1) %357, align 8
  %358 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg402477, i64 0, i64 %1, i64 %2
  store double %347, ptr addrspace(1) %358, align 8
  store double %349, ptr addrspace(1) %param_26.8392067, align 8
  %359 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg422481, i64 0, i64 %1, i64 %2
  store double %add.4177.1.clone.1.clone.11517, ptr addrspace(1) %359, align 8
  %360 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg432483, i64 0, i64 %1, i64 %2
  store double %add.4182.1.clone.12159, ptr addrspace(1) %360, align 8
  %361 = or i32 %thread.id.x, 32
  %362 = icmp ult i32 %361, 48
  br i1 %362, label %x_in_tile-true.1, label %x_in_tile-after.15

intra_warp_reduce_write-after:                    ; preds = %x_in_tile-after.15, %intra_warp_reduce_write-true
  %363 = icmp eq i32 %290, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg282453, i64 0, i64 %1
  %364 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %1, i64 %2
  br i1 %363, label %reduction_write_output-true, label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store double %add.3969.i2355, ptr addrspace(3) %329, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %364, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %thread_in_bounds-after

intra_warp_reduce_write-after2192:                ; preds = %intra_warp_reduce_write-true2191, %thread_in_bounds-after
  %365 = icmp eq i32 %290, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address2198 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg312459, i64 0, i64 %1
  %366 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache3, i64 0, i64 %1, i64 %2
  br i1 %365, label %reduction_write_output-true2196, label %thread_in_bounds-after2190

intra_warp_reduce_write-true2191:                 ; preds = %thread_in_bounds-after
  store double %add.3969.i2360, ptr addrspace(3) %88, align 8
  br label %intra_warp_reduce_write-after2192

reduction_write_output-true2196:                  ; preds = %intra_warp_reduce_write-after2192
  %output2199.then.val = load double, ptr addrspace(3) %366, align 8
  store double %output2199.then.val, ptr addrspace(1) %output_element_address2198, align 8
  br label %thread_in_bounds-after2190

intra_warp_reduce_write-after2218:                ; preds = %intra_warp_reduce_write-true2217, %thread_in_bounds-after2190
  %367 = icmp eq i32 %290, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address2224 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg342465, i64 0, i64 %1
  %368 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache4, i64 0, i64 %1, i64 %2
  br i1 %367, label %reduction_write_output-true2222, label %thread_in_bounds-after2216

intra_warp_reduce_write-true2217:                 ; preds = %thread_in_bounds-after2190
  store double %add.3969.i2365, ptr addrspace(3) %130, align 8
  br label %intra_warp_reduce_write-after2218

reduction_write_output-true2222:                  ; preds = %intra_warp_reduce_write-after2218
  %output2225.then.val = load double, ptr addrspace(3) %368, align 8
  store double %output2225.then.val, ptr addrspace(1) %output_element_address2224, align 8
  br label %thread_in_bounds-after2216

intra_warp_reduce_write-after2244:                ; preds = %intra_warp_reduce_write-true2243, %thread_in_bounds-after2216
  %369 = icmp eq i32 %290, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address2250 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg372471, i64 0, i64 %1
  %370 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache5, i64 0, i64 %1, i64 %2
  br i1 %369, label %reduction_write_output-true2248, label %thread_in_bounds-after2242

intra_warp_reduce_write-true2243:                 ; preds = %thread_in_bounds-after2216
  store double %add.3969.i2370, ptr addrspace(3) %172, align 8
  br label %intra_warp_reduce_write-after2244

reduction_write_output-true2248:                  ; preds = %intra_warp_reduce_write-after2244
  %output2251.then.val = load double, ptr addrspace(3) %370, align 8
  store double %output2251.then.val, ptr addrspace(1) %output_element_address2250, align 8
  br label %thread_in_bounds-after2242

intra_warp_reduce_write-after2270:                ; preds = %intra_warp_reduce_write-true2269, %thread_in_bounds-after2242
  %371 = icmp eq i32 %290, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address2276 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg412479, i64 0, i64 %1
  %372 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache6, i64 0, i64 %1, i64 %2
  br i1 %371, label %reduction_write_output-true2274, label %reduce-group-0-after

intra_warp_reduce_write-true2269:                 ; preds = %thread_in_bounds-after2242
  store double %add.3969.i2375, ptr addrspace(3) %214, align 8
  br label %intra_warp_reduce_write-after2270

reduction_write_output-true2274:                  ; preds = %intra_warp_reduce_write-after2270
  %output2277.then.val = load double, ptr addrspace(3) %372, align 8
  store double %output2277.then.val, ptr addrspace(1) %output_element_address2276, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  store double 0.000000e+00, ptr addrspace(1) %4, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr i8, ptr addrspace(1) %arg01, i64 %3
  store i8 0, ptr addrspace(1) %4, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr i8, ptr addrspace(1) %arg01, i64 %3
  store i8 0, ptr addrspace(1) %4, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr i32, ptr addrspace(1) %arg01, i64 %3
  store i32 0, ptr addrspace(1) %4, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !280
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !280
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !281
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
  %param_1.1515 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !270
  %0 = icmp slt i64 %param_1.1515, 0
  %1 = add i64 %param_1.1515, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1515
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
  %param_1.1517 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !270
  %0 = icmp slt i64 %param_1.1517, 0
  %1 = add i64 %param_1.1517, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1517
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg04, i64 0, i64 %4
  store double 1.000000e+00, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp8 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1461 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1461, 0
  %4 = add i64 %param_1.1461, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1461
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.11946 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = icmp ne i64 %param_2.11946, 0
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [1 x [2 x [48 x i8]]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 0, i64 %1, i64 %2
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp7 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1498 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1498, 0
  %4 = add i64 %param_1.1498, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1498
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12315 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = icmp ne i64 %param_2.12315, 0
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp7 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1513 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1513, 0
  %4 = add i64 %param_1.1513, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1513
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12495 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %.not = icmp eq i64 %param_2.12495, 0
  %9 = zext i1 %.not to i8
  %10 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp7 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1507 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1507, 0
  %4 = add i64 %param_1.1507, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1507
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12405 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = icmp ne i64 %param_2.12405, 0
  %10 = zext i1 %9 to i32
  %11 = getelementptr inbounds [192 x [2 x [48 x i32]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store i32 %10, ptr addrspace(1) %11, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_41(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp8 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_2.1216 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1216, 0
  %4 = add i64 %param_2.1216, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1216
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.14835 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2990.1 = fmul double %param_1.14835, %param_1.14835
  %divide.611.1 = fdiv double 1.000000e+00, %multiply.2990.1
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.611.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_4(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1482 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1482, 0
  %4 = add i64 %param_1.1482, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1482
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12515 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2982.5 = fmul double %param_2.12515, %param_2.12515
  %multiply.2984.3 = fmul double %multiply.2982.5, 5.000000e-01
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2984.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1246 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1246, 0
  %4 = add i64 %param_2.1246, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1246
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14865 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2999.3 = fmul double %param_1.14865, 2.000000e+00
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2999.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp5 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp5, i64 %thread_id_x, i64 %.urem
  %param_1.1509 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1509, 0
  %4 = add i64 %param_1.1509, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1509
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double 1.000000e+00, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1229 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1229, 0
  %4 = add i64 %param_2.1229, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1229
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14965 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = sitofp i64 %param_1.14965 to double
  %10 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1230 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1230, 0
  %4 = add i64 %param_2.1230, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1230
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14975 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.14975, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_29(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp8 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1494 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1494, 0
  %4 = add i64 %param_1.1494, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1494
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12275 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2962.2 = fmul double %param_2.12275, %param_2.12275
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2962.2, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_51(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp5 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp5, i64 %thread_id_x, i64 %.urem
  %param_1.1518 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1518, 0
  %4 = add i64 %param_1.1518, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1518
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double 0.000000e+00, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_40(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1220 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1220, 0
  %4 = add i64 %param_2.1220, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1220
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14875 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.14875, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_47(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1203 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_2.1203, 0
  %4 = add i64 %param_2.1203, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1203
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14705 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.14705, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_exponential_select_fusion(ptr noalias nocapture align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg23) local_unnamed_addr #2 {
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
  %.urem = add nsw i32 %0, -48
  %.cmp = icmp ult i32 %0, 48
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
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #13
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #13
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
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #13
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #13
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #13
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %11) #13
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #13
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
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #13
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #13
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
  %57 = tail call i32 @llvm.nvvm.d2i.lo(double %56) #13
  %58 = tail call double @llvm.nvvm.add.rn.d(double %56, double 0xC338000000000000) #13
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
  %72 = tail call i32 @llvm.nvvm.d2i.lo(double %71) #13
  %73 = tail call i32 @llvm.nvvm.d2i.hi(double %71) #13
  %74 = shl i32 %57, 20
  %75 = add i32 %73, %74
  %76 = tail call double @llvm.nvvm.lohi.i2d(i32 %72, i32 %75) #13
  %77 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.3.clone.1) #13
  %78 = bitcast i32 %77 to float
  %79 = tail call float @llvm.nvvm.fabs.f(float %78) #13
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
  %88 = tail call double @llvm.nvvm.lohi.i2d(i32 %72, i32 %87) #13
  %89 = sub nsw i32 %57, %85
  %90 = shl i32 %89, 20
  %91 = add nsw i32 %90, 1072693248
  %92 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %91) #13
  %93 = fmul double %92, %88
  br label %__nv_exp.exit7

__nv_exp.exit7:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i4, %84
  %z.2.i6 = phi double [ %76, %__nv_exp.exit ], [ %93, %84 ], [ %z.0.i5, %__internal_fast_icmp_abs_lt.exit.i4 ]
  %94 = zext nneg i32 %1 to i64
  %95 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg420, i64 0, i64 %94
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !270
  %97 = load i64, ptr addrspace(1) %arg1236, align 128, !invariant.load !270
  %98 = icmp slt i64 %97, 0
  %99 = add i64 %97, 192
  %100 = select i1 %98, i64 %99, i64 %97
  %101 = trunc i64 %100 to i32
  %102 = tail call i32 @llvm.smax.i32(i32 %101, i32 0)
  %103 = tail call i32 @llvm.umin.i32(i32 %102, i32 191)
  %104 = zext nneg i32 %103 to i64
  %105 = getelementptr inbounds [48 x [192 x [1 x double]]], ptr addrspace(1) %arg1134, i64 0, i64 %94, i64 %104, i64 0
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !270
  %107 = getelementptr double, ptr addrspace(1) %arg522, i64 %2
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !270
  %109 = getelementptr double, ptr addrspace(1) %arg624, i64 %2
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg726, i64 %2
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !270
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
  %divide.605.1.clone.1 = fdiv double 1.000000e+00, %110
  %compare.1135.41.clone.1 = fcmp ogt double %z.2.i6, 1.000000e-128
  %151 = select i1 %compare.1135.41.clone.1, double %z.2.i6, double %96
  %divide.600.7.clone.1 = fdiv double 1.000000e+00, %51
  %add.4054.5.clone.1 = fadd double %divide.600.7.clone.1, %151
  %divide.601.1.clone.1 = fdiv double 1.000000e+00, %add.4054.5.clone.1
  %multiply.2966.13 = fmul double %151, %divide.601.1.clone.1
  %multiply.2967.5 = fmul double %108, %multiply.2966.13
  %multiply.2962.15.clone.1 = fmul double %10, %10
  %add.4052.3.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.599.1.clone.1 = fdiv double 1.000000e+00, %add.4052.3.clone.1
  %subtract.222.27.clone.1 = fsub double 1.000000e+00, %divide.599.1.clone.1
  %multiply.2959.23.clone.1 = fmul double %divide.599.1.clone.1, %subtract.222.27.clone.1
  %multiply.2963.19.clone.1 = fmul double %multiply.2962.15.clone.1, %multiply.2959.23.clone.1
  %add.4056.17.clone.1 = fadd double %multiply.2963.19.clone.1, %divide.601.1.clone.1
  %compare.1136.9.clone.1 = fcmp ogt double %add.4056.17.clone.1, 1.000000e-128
  %152 = select i1 %compare.1136.9.clone.1, double %add.4056.17.clone.1, double 0x7FF8000000000000
  %multiply.2968.1.clone.1 = fmul double %add.4054.5.clone.1, %152
  %divide.604.5.clone.1 = fdiv double 1.000000e+00, %multiply.2968.1.clone.1
  %multiply.2960.9.clone.1 = fmul double %10, %multiply.2959.23.clone.1
  %divide.602.5.clone.1 = fdiv double %multiply.2960.9.clone.1, %152
  %subtract.223.9.clone.1 = fsub double %106, %divide.599.1.clone.1
  %divide.603.5.clone.1 = fdiv double %subtract.223.9.clone.1, %multiply.2959.23.clone.1
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
  %multiply.2974.1 = fmul double %multiply.2973.1, %159
  %add.4064.1 = fadd double %add.4059.1, %multiply.2974.1
  %160 = select i1 %155, double %add.4064.1, double %55
  %.not = icmp eq i64 %158, 0
  %add.4066.2.clone.1 = fadd double %divide.605.1.clone.1, %z.2.i10
  %divide.608.3.clone.1 = fdiv double 1.000000e+00, %add.4066.2.clone.1
  %multiply.2975.4.clone.1 = fmul double %multiply.2967.5, %multiply.2967.5
  %multiply.2976.9.clone.1 = fmul double %multiply.2975.4.clone.1, 5.000000e-01
  %multiply.2980.5.clone.1 = fmul double %multiply.2975.4.clone.1, %add.4062.1.clone.1
  %add.4067.7.clone.1 = fadd double %multiply.2976.9.clone.1, %multiply.2980.5.clone.1
  %multiply.2982.11.clone.1 = fmul double %108, %108
  %multiply.2984.9.clone.1 = fmul double %multiply.2982.11.clone.1, 5.000000e-01
  %multiply.2985.4.clone.1 = fmul double %multiply.2966.13, %multiply.2984.9.clone.1
  %multiply.2986.5.clone.1 = fmul double %multiply.2985.4.clone.1, %add.4062.1.clone.1
  %subtract.225.5.clone.1 = fsub double %add.4067.7.clone.1, %multiply.2986.5.clone.1
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
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8) local_unnamed_addr #2 {
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
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp16 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp16, i64 %thread_id_x, i64 %.urem
  %param_1.1510 = load i64, ptr addrspace(1) %arg119, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1510, 0
  %4 = add i64 %param_1.1510, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1510
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg221, i64 %thread_id_x
  %param_2.12435 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg833, i64 %thread_id_x
  %param_8.3706 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %10 = getelementptr double, ptr addrspace(1) %arg629, i64 %thread_id_x
  %param_6.5747 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %compare.1135.37 = fcmp ogt double %param_6.5747, 1.000000e-128
  %param_7.422 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg731, i64 0, i64 %2
  %param_7.42210 = load double, ptr addrspace(1) %param_7.422, align 8, !invariant.load !270
  %11 = select i1 %compare.1135.37, double %param_6.5747, double %param_7.42210
  %12 = getelementptr double, ptr addrspace(1) %arg527, i64 %thread_id_x
  %param_5.73911 = load double, ptr addrspace(1) %12, align 8, !invariant.load !270
  %multiply.2966.29 = fmul double %11, %param_5.73911
  %multiply.2967.17 = fmul double %param_8.3706, %multiply.2966.29
  %multiply.2975.6 = fmul double %multiply.2967.17, %multiply.2967.17
  %multiply.2976.11 = fmul double %multiply.2975.6, 5.000000e-01
  %13 = getelementptr double, ptr addrspace(1) %arg425, i64 %thread_id_x
  %param_4.91112 = load double, ptr addrspace(1) %13, align 8, !invariant.load !270
  %multiply.2980.7 = fmul double %param_4.91112, %multiply.2975.6
  %add.4067.9 = fadd double %multiply.2976.11, %multiply.2980.7
  %multiply.2982.13 = fmul double %param_8.3706, %param_8.3706
  %multiply.2984.11 = fmul double %multiply.2982.13, 5.000000e-01
  %multiply.2985.6 = fmul double %multiply.2984.11, %multiply.2966.29
  %multiply.2986.7 = fmul double %param_4.91112, %multiply.2985.6
  %subtract.225.7 = fsub double %add.4067.9, %multiply.2986.7
  %14 = getelementptr i64, ptr addrspace(1) %arg323, i64 %thread_id_x
  %param_3.114915 = load i64, ptr addrspace(1) %14, align 8, !invariant.load !270
  %15 = sitofp i64 %param_3.114915 to double
  %multiply.2987.7 = fmul double %subtract.225.7, %15
  %add.4068.5 = fadd double %param_2.12435, %multiply.2987.7
  %compare.1142.3 = fcmp ogt double %add.4068.5, 1.000000e-128
  %16 = zext i1 %compare.1142.3 to i8
  %17 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg017, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %16, ptr addrspace(1) %17, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp9 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_1.1464 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1464, 0
  %4 = add i64 %param_1.1464, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1464
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12526 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = tail call double @llvm.fabs.f64(double %param_2.12526)
  %10 = call i1 @llvm.is.fpclass.f64(double %param_2.12526, i32 504)
  %compare.1138.15 = fcmp olt double %9, 1.400000e+01
  %11 = and i1 %10, %compare.1138.15
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds [192 x [1 x [2 x [48 x i8]]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 0, i64 %1, i64 %2
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp8 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1467 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1467, 0
  %4 = add i64 %param_1.1467, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1467
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12545 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = tail call double @llvm.fabs.f64(double %param_2.12545)
  %10 = call i1 @llvm.is.fpclass.f64(double %param_2.12545, i32 504)
  %compare.1138.13 = fcmp olt double %9, 1.400000e+01
  %11 = and i1 %10, %compare.1138.13
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1474 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1474, 0
  %4 = add i64 %param_1.1474, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1474
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12075 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %compare.1139.3 = fcmp ogt double %param_2.12075, 1.000000e-128
  %9 = zext i1 %compare.1139.3 to i8
  %10 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_28(ptr noalias nocapture writeonly align 128 dereferenceable(18432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp12 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1508 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1508, 0
  %4 = add i64 %param_1.1508, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1508
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.12445 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.11506 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %multiply.2962.5 = fmul double %param_3.11506, %param_3.11506
  %10 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.9129 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %subtract.222.7 = fsub double 1.000000e+00, %param_4.9129
  %multiply.2959.3 = fmul double %param_4.9129, %subtract.222.7
  %multiply.2963.9 = fmul double %multiply.2962.5, %multiply.2959.3
  %add.4056.7 = fadd double %param_2.12445, %multiply.2963.9
  %compare.1136.3 = fcmp ogt double %add.4056.7, 1.000000e-128
  %11 = zext i1 %compare.1136.3 to i8
  %12 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %11, ptr addrspace(1) %12, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_35(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp10 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %param_1.1499 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1499, 0
  %4 = add i64 %param_1.1499, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1499
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.9105 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %divide.600.9 = fdiv double 1.000000e+00, %param_4.9105
  %9 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12326 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.43 = fcmp ogt double %param_2.12326, 1.000000e-128
  %param_3.1142 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg317, i64 0, i64 %2
  %param_3.11429 = load double, ptr addrspace(1) %param_3.1142, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.43, double %param_2.12326, double %param_3.11429
  %add.4054.7 = fadd double %divide.600.9, %10
  %multiply.2991.1 = fmul double %add.4054.7, %add.4054.7
  %divide.612.1 = fdiv double 1.000000e+00, %multiply.2991.1
  %11 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.612.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp10 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %param_1.1481 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1481, 0
  %4 = add i64 %param_1.1481, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1481
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12145 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11326 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1139.9 = fcmp ogt double %param_3.11326, 1.000000e-128
  %param_4.899 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg419, i64 0, i64 %2
  %param_4.8999 = load double, ptr addrspace(1) %param_4.899, align 8, !invariant.load !270
  %10 = select i1 %compare.1139.9, double %param_3.11326, double %param_4.8999
  %add.4063.3 = fadd double %param_2.12145, %10
  %multiply.2989.1 = fmul double %add.4063.3, %add.4063.3
  %divide.610.1 = fdiv double 1.000000e+00, %multiply.2989.1
  %11 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.610.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp7 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1506 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1506, 0
  %4 = add i64 %param_1.1506, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1506
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12395 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.11466 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %add.4066.1 = fadd double %param_2.12395, %param_3.11466
  %multiply.2997.1 = fmul double %add.4066.1, %add.4066.1
  %divide.616.1 = fdiv double 1.000000e+00, %multiply.2997.1
  %10 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.616.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6) local_unnamed_addr #2 {
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
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp12 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1465 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1465, 0
  %4 = add i64 %param_1.1465, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1465
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg625, i64 %thread_id_x
  %param_6.5755 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.8936 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.29 = fcmp ogt double %param_4.8936, 1.000000e-128
  %param_5.724 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg523, i64 0, i64 %2
  %param_5.7249 = load double, ptr addrspace(1) %param_5.724, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.29, double %param_4.8936, double %param_5.7249
  %11 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.112210 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.21 = fmul double %10, %param_3.112210
  %multiply.2967.13 = fmul double %param_6.5755, %multiply.2966.21
  %12 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.119811 = load double, ptr addrspace(1) %12, align 8, !invariant.load !270
  %multiply.2971.1 = fmul double %param_2.119811, %multiply.2967.13
  %13 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2971.1, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1488 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1488, 0
  %4 = add i64 %param_1.1488, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1488
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12215 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2972.3 = fmul double %param_2.12215, 2.000000e+00
  %multiply.2996.1 = fmul double %multiply.2972.3, %multiply.2972.3
  %divide.615.1 = fdiv double 1.000000e+00, %multiply.2996.1
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.615.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1463 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1463, 0
  %4 = add i64 %param_1.1463, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1463
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.11965 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2972.7 = fmul double %param_2.11965, 2.000000e+00
  %divide.607.3 = fdiv double 1.000000e+00, %multiply.2972.7
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.607.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5) local_unnamed_addr #2 {
entry:
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp9 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_1.1511 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1511, 0
  %4 = add i64 %param_1.1511, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1511
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12475 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9136 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %10 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7447 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %multiply.2958.9 = fmul double %param_4.9136, %param_5.7447
  %11 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11518 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %add.4051.9 = fadd double %multiply.2958.9, %param_3.11518
  %subtract.224.1 = fsub double %param_2.12475, %add.4051.9
  %multiply.2994.3 = fmul double %subtract.224.1, 2.000000e+00
  %12 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2994.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5) local_unnamed_addr #2 {
entry:
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp9 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_1.1504 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1504, 0
  %4 = add i64 %param_1.1504, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1504
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12375 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9076 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %10 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7367 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %multiply.2958.5 = fmul double %param_4.9076, %param_5.7367
  %11 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11458 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %add.4051.5 = fadd double %multiply.2958.5, %param_3.11458
  %subtract.224.3 = fsub double %param_2.12375, %add.4051.5
  %multiply.2969.1 = fmul double %subtract.224.3, %subtract.224.3
  %12 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2969.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_43(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp9 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_3.1129 = load i64, ptr addrspace(1) %arg316, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_3.1129, 0
  %4 = add i64 %param_3.1129, 192
  %5 = select i1 %3, i64 %4, i64 %param_3.1129
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.14785 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %compare.1139.7 = fcmp ogt double %param_1.14785, 1.000000e-128
  %param_2.1211 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg214, i64 0, i64 %2
  %param_2.12118 = load double, ptr addrspace(1) %param_2.1211, align 8, !invariant.load !270
  %9 = select i1 %compare.1139.7, double %param_1.14785, double %param_2.12118
  %10 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5) local_unnamed_addr #2 {
entry:
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp11 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %param_1.1500 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1500, 0
  %4 = add i64 %param_1.1500, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1500
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7415 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.11436 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.25 = fcmp ogt double %param_3.11436, 1.000000e-128
  %param_4.905 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg420, i64 0, i64 %2
  %param_4.9059 = load double, ptr addrspace(1) %param_4.905, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.25, double %param_3.11436, double %param_4.9059
  %11 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.123310 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.17 = fmul double %10, %param_2.123310
  %multiply.2967.9 = fmul double %param_5.7415, %multiply.2966.17
  %12 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2967.9, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5) local_unnamed_addr #2 {
entry:
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp11 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %param_1.1512 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1512, 0
  %4 = add i64 %param_1.1512, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1512
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7455 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.11526 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.23 = fcmp ogt double %param_3.11526, 1.000000e-128
  %param_4.914 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg420, i64 0, i64 %2
  %param_4.9149 = load double, ptr addrspace(1) %param_4.914, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.23, double %param_3.11526, double %param_4.9149
  %11 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.124810 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.15 = fmul double %10, %param_2.124810
  %multiply.2967.7 = fmul double %param_5.7455, %multiply.2966.15
  %multiply.2998.3 = fmul double %multiply.2967.7, 2.000000e+00
  %12 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2998.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5) local_unnamed_addr #2 {
entry:
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp11 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %param_1.1490 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1490, 0
  %4 = add i64 %param_1.1490, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1490
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7405 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.11386 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.27 = fcmp ogt double %param_3.11386, 1.000000e-128
  %param_4.902 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg420, i64 0, i64 %2
  %param_4.9029 = load double, ptr addrspace(1) %param_4.902, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.27, double %param_3.11386, double %param_4.9029
  %11 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.122310 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.19 = fmul double %10, %param_2.122310
  %multiply.2967.11 = fmul double %param_5.7405, %multiply.2966.19
  %multiply.2975.1 = fmul double %multiply.2967.11, %multiply.2967.11
  %12 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2975.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg4) local_unnamed_addr #2 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp10 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %param_1.1475 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1475, 0
  %4 = add i64 %param_1.1475, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1475
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11275 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %compare.1135.15 = fcmp ogt double %param_3.11275, 1.000000e-128
  %param_4.896 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg419, i64 0, i64 %2
  %param_4.8968 = load double, ptr addrspace(1) %param_4.896, align 8, !invariant.load !270
  %9 = select i1 %compare.1135.15, double %param_3.11275, double %param_4.8968
  %10 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12089 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %multiply.2966.7 = fmul double %9, %param_2.12089
  %11 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2966.7, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg5) local_unnamed_addr #2 {
entry:
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp11 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %param_1.1479 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1479, 0
  %4 = add i64 %param_1.1479, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1479
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.12505 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %multiply.2982.9 = fmul double %param_2.12505, %param_2.12505
  %multiply.2984.7 = fmul double %multiply.2982.9, 5.000000e-01
  %9 = getelementptr double, ptr addrspace(1) %arg420, i64 %thread_id_x
  %param_4.9156 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %compare.1135.17 = fcmp ogt double %param_4.9156, 1.000000e-128
  %param_5.746 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg522, i64 0, i64 %2
  %param_5.7469 = load double, ptr addrspace(1) %param_5.746, align 8, !invariant.load !270
  %10 = select i1 %compare.1135.17, double %param_4.9156, double %param_5.7469
  %11 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.115310 = load double, ptr addrspace(1) %11, align 8, !invariant.load !270
  %multiply.2966.9 = fmul double %10, %param_3.115310
  %multiply.2985.1 = fmul double %multiply.2984.7, %multiply.2966.9
  %12 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2985.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg3) local_unnamed_addr #2 {
entry:
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp18 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp18, i64 %thread_id_x, i64 %.urem
  %param_1.1477 = load i64, ptr addrspace(1) %arg121, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1477, 0
  %4 = add i64 %param_1.1477, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1477
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1128 = getelementptr inbounds [48 x [192 x [1 x double]]], ptr addrspace(1) %arg325, i64 0, i64 %2, i64 %7, i64 0
  %param_3.112812 = load double, ptr addrspace(1) %param_3.1128, align 8, !invariant.load !270
  %8 = getelementptr double, ptr addrspace(1) %arg223, i64 %thread_id_x
  %param_2.121013 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.223.7 = fsub double %param_3.112812, %param_2.121013
  %subtract.222.21 = fsub double 1.000000e+00, %param_2.121013
  %multiply.2959.17 = fmul double %param_2.121013, %subtract.222.21
  %divide.603.3 = fdiv double %subtract.223.7, %multiply.2959.17
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg019, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.603.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp12 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1485 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1485, 0
  %4 = add i64 %param_1.1485, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1485
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.12585 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.11586 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %multiply.2962.27 = fmul double %param_3.11586, %param_3.11586
  %10 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.9229 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %subtract.222.37 = fsub double 1.000000e+00, %param_4.9229
  %multiply.2959.33 = fmul double %param_4.9229, %subtract.222.37
  %multiply.2963.31 = fmul double %multiply.2962.27, %multiply.2959.33
  %add.4056.29 = fadd double %param_2.12585, %multiply.2963.31
  %compare.1136.15 = fcmp ogt double %add.4056.29, 1.000000e-128
  %11 = select i1 %compare.1136.15, double %add.4056.29, double 0x7FF8000000000000
  %12 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %11, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp8 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1501 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1501, 0
  %4 = add i64 %param_1.1501, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1501
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12345 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.222.15 = fsub double 1.000000e+00, %param_2.12345
  %multiply.2959.11 = fmul double %param_2.12345, %subtract.222.15
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2959.11, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_30(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp8 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1460 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1460, 0
  %4 = add i64 %param_1.1460, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1460
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.11935 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.222.13 = fsub double 1.000000e+00, %param_2.11935
  %multiply.2959.9 = fmul double %param_2.11935, %subtract.222.13
  %multiply.2992.1 = fmul double %multiply.2959.9, %multiply.2959.9
  %divide.613.1 = fdiv double 1.000000e+00, %multiply.2992.1
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.613.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4) local_unnamed_addr #2 {
entry:
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp14 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp14, i64 %thread_id_x, i64 %.urem
  %param_1.1484 = load i64, ptr addrspace(1) %arg117, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1484, 0
  %4 = add i64 %param_1.1484, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1484
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.11345 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg219, i64 %thread_id_x
  %param_2.12176 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %subtract.222.25 = fsub double 1.000000e+00, %param_2.12176
  %multiply.2959.21 = fmul double %param_2.12176, %subtract.222.25
  %multiply.2960.7 = fmul double %param_3.11345, %multiply.2959.21
  %10 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.9199 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %multiply.2962.31 = fmul double %param_3.11345, %param_3.11345
  %multiply.2963.35 = fmul double %multiply.2962.31, %multiply.2959.21
  %add.4056.33 = fadd double %param_4.9199, %multiply.2963.35
  %compare.1136.17 = fcmp ogt double %add.4056.33, 1.000000e-128
  %11 = select i1 %compare.1136.17, double %add.4056.33, double 0x7FF8000000000000
  %divide.602.3 = fdiv double %multiply.2960.7, %11
  %12 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.602.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_31(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg3) local_unnamed_addr #2 {
entry:
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp14 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp14, i64 %thread_id_x, i64 %.urem
  %param_1.1458 = load i64, ptr addrspace(1) %arg117, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1458, 0
  %4 = add i64 %param_1.1458, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1458
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1118 = getelementptr inbounds [48 x [192 x [1 x double]]], ptr addrspace(1) %arg321, i64 0, i64 %2, i64 %7, i64 0
  %param_3.111812 = load double, ptr addrspace(1) %param_3.1118, align 8, !invariant.load !270
  %8 = getelementptr double, ptr addrspace(1) %arg219, i64 %thread_id_x
  %param_2.119113 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.223.3 = fsub double %param_3.111812, %param_2.119113
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %7, i64 %1, i64 %2
  store double %subtract.223.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_33(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp6 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1503 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1503, 0
  %4 = add i64 %param_1.1503, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1503
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12365 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %subtract.222.3 = fsub double 1.000000e+00, %param_2.12365
  %9 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %subtract.222.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp12 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1469 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1469, 0
  %4 = add i64 %param_1.1469, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1469
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.12575 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.11576 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %multiply.2962.23 = fmul double %param_3.11576, %param_3.11576
  %10 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.9219 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %subtract.222.35 = fsub double 1.000000e+00, %param_4.9219
  %multiply.2959.31 = fmul double %param_4.9219, %subtract.222.35
  %multiply.2963.27 = fmul double %multiply.2962.23, %multiply.2959.31
  %add.4056.25 = fadd double %param_2.12575, %multiply.2963.27
  %compare.1136.13 = fcmp ogt double %add.4056.25, 1.000000e-128
  %11 = select i1 %compare.1136.13, double %add.4056.25, double 0x7FF8000000000000
  %multiply.2993.1 = fmul double %11, %11
  %divide.614.1 = fdiv double 1.000000e+00, %multiply.2993.1
  %12 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.614.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -48
  %.cmp9 = icmp ult i32 %0, 48
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_1.1480 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !270
  %3 = icmp slt i64 %param_1.1480, 0
  %4 = add i64 %param_1.1480, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1480
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12135 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %9 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11316 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %subtract.222.19 = fsub double 1.000000e+00, %param_3.11316
  %multiply.2959.15 = fmul double %param_3.11316, %subtract.222.19
  %multiply.2960.3 = fmul double %param_2.12135, %multiply.2959.15
  %10 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
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
define void @loop_subtract_fusion(ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg3) local_unnamed_addr #2 {
entry:
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !282
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
  %48 = trunc i64 %3 to i32
  %.lhs.trunc1 = trunc nuw nsw i32 %48 to i16
  %49 = urem i16 %.lhs.trunc1, 48
  %50 = udiv i16 %.lhs.trunc1, 96
  %add.4201.9 = fadd double %z.2.i, 1.000000e+00
  %divide.617.9 = fdiv double 1.000000e+00, %add.4201.9
  %subtract.226.9 = fsub double 1.000000e+00, %divide.617.9
  %51 = zext nneg i16 %50 to i64
  %52 = zext nneg i16 %49 to i64
  %53 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg03, i64 0, i64 %51, i64 %52
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !270
  %multiply.3032.3 = fmul double %54, %subtract.226.9
  %55 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg27, i64 0, i64 %51, i64 %52
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !270
  %multiply.3033.3 = fmul double %divide.617.9, %56
  %subtract.227.1 = fsub double %multiply.3032.3, %multiply.3033.3
  %57 = getelementptr double, ptr addrspace(1) %arg39, i64 %3
  store double %subtract.227.1, ptr addrspace(1) %57, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(36864) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(110592) %arg1) local_unnamed_addr #2 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !283
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %.zext = zext nneg i16 %.decomposed to i32
  %.zext12 = zext nneg i16 %3 to i32
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %7 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg115, i64 0, i64 %5, i64 %6, i64 0, i64 0
  store i32 %.zext12, ptr addrspace(1) %7, align 4
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 4
  store i32 %.zext, ptr addrspace(1) %8, align 4
  %9 = zext nneg i32 %linear_index to i64
  %10 = getelementptr i32, ptr addrspace(1) %arg013, i64 %9
  %11 = load i32, ptr addrspace(1) %10, align 4, !invariant.load !270
  %12 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 8
  store i32 %11, ptr addrspace(1) %12, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  store double 0.000000e+00, ptr addrspace(1) %4, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define void @input_scatter_fusion_2(ptr noalias nocapture align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(110592) %arg1) local_unnamed_addr #8 {
entry:
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !283
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %param_1.1690 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg110, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %param_1.16901 = load i32, ptr addrspace(1) %param_1.1690, align 4, !invariant.load !270
  %7 = icmp ult i32 %param_1.16901, 48
  %param_1.1690212 = getelementptr inbounds i8, ptr addrspace(1) %param_1.1690, i64 4
  %param_1.16903 = load i32, ptr addrspace(1) %param_1.1690212, align 4, !invariant.load !270
  %8 = icmp ult i32 %param_1.16903, 192
  %9 = and i1 %7, %8
  %param_1.1690413 = getelementptr inbounds i8, ptr addrspace(1) %param_1.1690, i64 8
  %param_1.16905 = load i32, ptr addrspace(1) %param_1.1690413, align 4, !invariant.load !270
  %10 = icmp ult i32 %param_1.16905, 2
  %11 = and i1 %9, %10
  %12 = zext nneg i32 %param_1.16901 to i64
  %13 = zext nneg i32 %param_1.16903 to i64
  %14 = zext nneg i32 %param_1.16905 to i64
  %15 = getelementptr inbounds [48 x [192 x [2 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %12, i64 %13, i64 %14
  br i1 %11, label %scatter.in_bounds-true, label %scatter.13.1.in_bounds-after

scatter.13.1.in_bounds-after:                     ; preds = %entry, %scatter.in_bounds-true
  ret void

scatter.in_bounds-true:                           ; preds = %entry
  %16 = atomicrmw fadd ptr addrspace(1) %15, double 1.000000e+00 seq_cst, align 8
  br label %scatter.13.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_transpose(ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg1) local_unnamed_addr #2 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !282
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %linear_index = or disjoint i32 %1, %2
  %.cmp = icmp ugt i32 %0, 71
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 48
  %4 = urem i16 %3, 192
  %5 = mul i16 %3, 48
  %.decomposed = sub i16 %.lhs.trunc, %5
  %6 = zext nneg i16 %.decomposed to i64
  %7 = zext nneg i16 %4 to i64
  %8 = zext i1 %.cmp to i64
  %9 = getelementptr inbounds [48 x [192 x [2 x double]]], ptr addrspace(1) %arg05, i64 0, i64 %6, i64 %7, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %11 = zext nneg i32 %linear_index to i64
  %12 = getelementptr double, ptr addrspace(1) %arg17, i64 %11
  store double %10, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg1) local_unnamed_addr #2 {
entry:
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !283
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 48
  %4 = mul i16 %3, 48
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %7 = getelementptr inbounds [2 x [192 x [48 x double]]], ptr addrspace(1) %arg07, i64 0, i64 0, i64 %5, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !270
  %add.3969.i = fadd double %8, 0.000000e+00
  %9 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 73728
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !270
  %add.3969.i.1 = fadd double %add.3969.i, %10
  %11 = fneg double %add.3969.i.1
  %12 = zext nneg i32 %linear_index to i64
  %13 = getelementptr double, ptr addrspace(1) %arg19, i64 %12
  store double %11, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg5) local_unnamed_addr #2 {
entry:
  %arg5124 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4122 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3120 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2118 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0114 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !282
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 48
  %4 = mul i16 %3, 48
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = and i16 %3, 1
  %6 = udiv i16 %.lhs.trunc, 96
  %7 = zext nneg i16 %6 to i64
  %8 = zext nneg i16 %.decomposed to i64
  %9 = getelementptr [2 x [192 x [48 x double]]], ptr addrspace(1) %arg0114, i64 0, i64 0, i64 %7, i64 %8
  %10 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 73728
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %12 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg1116, i64 0, i64 %7, i64 %8
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !270
  %14 = zext nneg i16 %5 to i64
  %15 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg4122, i64 0, i64 %14, i64 %8
  %16 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg3120, i64 0, i64 %7, i64 %14, i64 %8
  %17 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg2118, i64 0, i64 %14, i64 %8
  %18 = load double, ptr addrspace(1) %15, align 8, !invariant.load !270
  %19 = load double, ptr addrspace(1) %16, align 8, !invariant.load !270
  %multiply.3034.731.1 = fmul double %18, %19
  %20 = load double, ptr addrspace(1) %17, align 8, !invariant.load !270
  %add.4202.532.1 = fadd double %multiply.3034.731.1, %20
  %21 = fcmp ole double %add.4202.532.1, 0.000000e+00
  %maximum.40.i.1 = select i1 %21, double 0.000000e+00, double %add.4202.532.1
  %subtract.228.11 = fsub double 0.000000e+00, %maximum.40.i.1
  %22 = tail call double @llvm.fma.f64(double %subtract.228.11, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %23 = tail call i32 @llvm.nvvm.d2i.lo(double %22) #13
  %24 = tail call double @llvm.nvvm.add.rn.d(double %22, double 0xC338000000000000) #13
  %25 = tail call double @llvm.fma.f64(double %24, double 0xBFE62E42FEFA39EF, double %subtract.228.11)
  %26 = tail call double @llvm.fma.f64(double %24, double 0xBC7ABC9E3B39803F, double %25)
  %27 = tail call double @llvm.fma.f64(double %26, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %28 = tail call double @llvm.fma.f64(double %27, double %26, double 0x3EC71DEE62401315)
  %29 = tail call double @llvm.fma.f64(double %28, double %26, double 0x3EFA01997C89EB71)
  %30 = tail call double @llvm.fma.f64(double %29, double %26, double 0x3F2A01A014761F65)
  %31 = tail call double @llvm.fma.f64(double %30, double %26, double 0x3F56C16C1852B7AF)
  %32 = tail call double @llvm.fma.f64(double %31, double %26, double 0x3F81111111122322)
  %33 = tail call double @llvm.fma.f64(double %32, double %26, double 0x3FA55555555502A1)
  %34 = tail call double @llvm.fma.f64(double %33, double %26, double 0x3FC5555555555511)
  %35 = tail call double @llvm.fma.f64(double %34, double %26, double 0x3FE000000000000B)
  %36 = tail call double @llvm.fma.f64(double %35, double %26, double 1.000000e+00)
  %37 = tail call double @llvm.fma.f64(double %36, double %26, double 1.000000e+00)
  %38 = tail call i32 @llvm.nvvm.d2i.lo(double %37) #13
  %39 = tail call i32 @llvm.nvvm.d2i.hi(double %37) #13
  %40 = shl i32 %23, 20
  %41 = add i32 %39, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %38, i32 %41) #13
  %43 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.11) #13
  %44 = bitcast i32 %43 to float
  %45 = tail call float @llvm.nvvm.fabs.f(float %44) #13
  %46 = fcmp olt float %45, 0x4010C46560000000
  br i1 %46, label %in_bounds-true.1, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %47 = fcmp olt double %subtract.228.11, 0.000000e+00
  %48 = fadd double %subtract.228.11, 0x7FF0000000000000
  %z.0.i = select i1 %47, double 0.000000e+00, double %48
  %49 = fcmp olt float %45, 0x4010E90000000000
  br i1 %49, label %50, label %in_bounds-true.1

50:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %51 = sdiv i32 %23, 2
  %52 = shl i32 %51, 20
  %53 = add i32 %39, %52
  %54 = tail call double @llvm.nvvm.lohi.i2d(i32 %38, i32 %53) #13
  %55 = sub nsw i32 %23, %51
  %56 = shl i32 %55, 20
  %57 = add nsw i32 %56, 1072693248
  %58 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %57) #13
  %59 = fmul double %58, %54
  br label %in_bounds-true.1

in_bounds-true.1:                                 ; preds = %50, %__internal_fast_icmp_abs_lt.exit.i, %entry
  %z.2.i = phi double [ %42, %entry ], [ %59, %50 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %subtract.228.11.1 = fsub double %add.4202.532.1, %maximum.40.i.1
  %60 = tail call double @llvm.fma.f64(double %subtract.228.11.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %61 = tail call i32 @llvm.nvvm.d2i.lo(double %60) #13
  %62 = tail call double @llvm.nvvm.add.rn.d(double %60, double 0xC338000000000000) #13
  %63 = tail call double @llvm.fma.f64(double %62, double 0xBFE62E42FEFA39EF, double %subtract.228.11.1)
  %64 = tail call double @llvm.fma.f64(double %62, double 0xBC7ABC9E3B39803F, double %63)
  %65 = tail call double @llvm.fma.f64(double %64, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %66 = tail call double @llvm.fma.f64(double %65, double %64, double 0x3EC71DEE62401315)
  %67 = tail call double @llvm.fma.f64(double %66, double %64, double 0x3EFA01997C89EB71)
  %68 = tail call double @llvm.fma.f64(double %67, double %64, double 0x3F2A01A014761F65)
  %69 = tail call double @llvm.fma.f64(double %68, double %64, double 0x3F56C16C1852B7AF)
  %70 = tail call double @llvm.fma.f64(double %69, double %64, double 0x3F81111111122322)
  %71 = tail call double @llvm.fma.f64(double %70, double %64, double 0x3FA55555555502A1)
  %72 = tail call double @llvm.fma.f64(double %71, double %64, double 0x3FC5555555555511)
  %73 = tail call double @llvm.fma.f64(double %72, double %64, double 0x3FE000000000000B)
  %74 = tail call double @llvm.fma.f64(double %73, double %64, double 1.000000e+00)
  %75 = tail call double @llvm.fma.f64(double %74, double %64, double 1.000000e+00)
  %76 = tail call i32 @llvm.nvvm.d2i.lo(double %75) #13
  %77 = tail call i32 @llvm.nvvm.d2i.hi(double %75) #13
  %78 = shl i32 %61, 20
  %79 = add i32 %77, %78
  %80 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %79) #13
  %81 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.11.1) #13
  %82 = bitcast i32 %81 to float
  %83 = tail call float @llvm.nvvm.fabs.f(float %82) #13
  %84 = fcmp olt float %83, 0x4010C46560000000
  br i1 %84, label %__nv_exp.exit.1, label %__internal_fast_icmp_abs_lt.exit.i.1

__internal_fast_icmp_abs_lt.exit.i.1:             ; preds = %in_bounds-true.1
  %85 = fcmp olt double %subtract.228.11.1, 0.000000e+00
  %86 = fadd double %subtract.228.11.1, 0x7FF0000000000000
  %z.0.i.1 = select i1 %85, double 0.000000e+00, double %86
  %87 = fcmp olt float %83, 0x4010E90000000000
  br i1 %87, label %88, label %__nv_exp.exit.1

88:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i.1
  %89 = sdiv i32 %61, 2
  %90 = shl i32 %89, 20
  %91 = add i32 %77, %90
  %92 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %91) #13
  %93 = sub nsw i32 %61, %89
  %94 = shl i32 %93, 20
  %95 = add nsw i32 %94, 1072693248
  %96 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %95) #13
  %97 = fmul double %96, %92
  br label %__nv_exp.exit.1

__nv_exp.exit.1:                                  ; preds = %88, %__internal_fast_icmp_abs_lt.exit.i.1, %in_bounds-true.1
  %z.2.i.1 = phi double [ %80, %in_bounds-true.1 ], [ %97, %88 ], [ %z.0.i.1, %__internal_fast_icmp_abs_lt.exit.i.1 ]
  %98 = fcmp olt float %83, 0x4010C46560000000
  br i1 %98, label %__nv_exp.exit94, label %__internal_fast_icmp_abs_lt.exit.i91

__internal_fast_icmp_abs_lt.exit.i91:             ; preds = %__nv_exp.exit.1
  %99 = fcmp olt double %subtract.228.11.1, 0.000000e+00
  %100 = fadd double %subtract.228.11.1, 0x7FF0000000000000
  %z.0.i92 = select i1 %99, double 0.000000e+00, double %100
  %101 = fcmp olt float %83, 0x4010E90000000000
  br i1 %101, label %102, label %__nv_exp.exit94

102:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i91
  %103 = sdiv i32 %61, 2
  %104 = shl i32 %103, 20
  %105 = add i32 %77, %104
  %106 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %105) #13
  %107 = sub nsw i32 %61, %103
  %108 = shl i32 %107, 20
  %109 = add nsw i32 %108, 1072693248
  %110 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %109) #13
  %111 = fmul double %110, %106
  br label %__nv_exp.exit94

__nv_exp.exit94:                                  ; preds = %__nv_exp.exit.1, %__internal_fast_icmp_abs_lt.exit.i91, %102
  %z.2.i93 = phi double [ %80, %__nv_exp.exit.1 ], [ %111, %102 ], [ %z.0.i92, %__internal_fast_icmp_abs_lt.exit.i91 ]
  %add.3969.i = fadd double %z.2.i, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %z.2.i.1
  %divide.618.3 = fdiv double %13, %add.3969.i.1
  %multiply.3035.1 = fmul double %divide.618.3, %z.2.i93
  %add.4204.1 = fadd double %11, %multiply.3035.1
  %112 = zext nneg i32 %linear_index to i64
  %113 = getelementptr double, ptr addrspace(1) %arg5124, i64 %112
  store double %add.4204.1, ptr addrspace(1) %113, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_reduce_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(24) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(110592) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !283
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %7 = getelementptr inbounds [48 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg110, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %8 = load i32, ptr addrspace(1) %7, align 4, !invariant.load !270
  %9 = sext i32 %8 to i64
  %10 = icmp sgt i32 %8, -1
  %11 = load <2 x i64>, ptr addrspace(1) %arg08, align 128, !invariant.load !270
  %12 = extractelement <2 x i64> %11, i32 0
  %13 = extractelement <2 x i64> %11, i32 1
  %14 = icmp sge i64 %12, %9
  %15 = and i1 %10, %14
  %16 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 4
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !270
  %18 = sext i32 %17 to i64
  %19 = icmp sgt i32 %17, -1
  %20 = icmp sge i64 %13, %18
  %21 = and i1 %19, %20
  %22 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 8
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !270
  %24 = sext i32 %23 to i64
  %25 = icmp sgt i32 %23, -1
  %26 = getelementptr inbounds i8, ptr addrspace(1) %arg08, i64 16
  %27 = load i64, ptr addrspace(1) %26, align 16, !invariant.load !270
  %28 = icmp sge i64 %27, %24
  %29 = and i1 %25, %28
  %30 = select i1 %29, i1 %21, i1 false
  %narrow7 = select i1 %30, i1 %15, i1 false
  %31 = zext i1 %narrow7 to i8
  %32 = zext nneg i32 %linear_index to i64
  %33 = getelementptr i8, ptr addrspace(1) %arg212, i64 %32
  store i8 %31, ptr addrspace(1) %33, align 1
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(110592) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(9216) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg12) local_unnamed_addr #4 {
entry:
  %arg12228 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11226 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10224 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9222 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8220 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7218 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6216 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5214 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4212 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3210 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2208 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1206 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0204 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !284
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.2 = shl nuw nsw i32 %block.id.x, 5
  %1 = or disjoint i32 %tile_origin.2, %thread.id.2
  %.lhs.trunc = trunc nuw nsw i32 %1 to i8
  %2 = urem i8 %.lhs.trunc, 48
  %3 = udiv i8 %.lhs.trunc, 48
  %4 = zext nneg i8 %3 to i64
  %5 = zext nneg i8 %2 to i64
  %param_6.2438 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg6216, i64 0, i64 %4, i64 %5
  %param_6.24384 = load double, ptr addrspace(1) %param_6.2438, align 8, !invariant.load !270
  %6 = and i32 %thread.id.x, 1
  %7 = zext i32 %6 to i64
  %8 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %9 = mul nuw nsw i32 %0, 96
  %10 = add nuw nsw i32 %0, -32
  %11 = add i32 %9, %tile_origin.2
  %12 = add i32 %11, %thread.id.2
  %13 = zext nneg i32 %12 to i64
  %14 = lshr i64 %13, 1
  %15 = shl nuw nsw i64 %14, 4
  %16 = shl nuw nsw i64 %7, 3
  %17 = add i64 %15, %16
  %scevgep238 = getelementptr i8, ptr addrspace(1) %arg12228, i64 %17
  %18 = shl nuw nsw i64 %5, 3
  %19 = zext nneg i32 %thread.id.x to i64
  %20 = lshr i64 %19, 5
  %21 = mul nuw nsw i64 %20, 768
  %22 = mul nuw nsw i64 %4, 384
  %23 = add i64 %21, %22
  %scevgep241 = getelementptr i8, ptr addrspace(1) %arg11226, i64 %23
  %scevgep245 = getelementptr i8, ptr addrspace(1) %arg2208, i64 %23
  %24 = trunc i64 %13 to i32
  %25 = udiv i32 %24, 384
  %26 = zext i32 %25 to i64
  %27 = mul nuw nsw i64 %26, 2304
  %28 = lshr i32 %12, 1
  %29 = trunc i32 %28 to i16
  %30 = udiv i16 %29, 192
  %31 = mul nuw nsw i16 %30, 192
  %32 = sub i16 %29, %31
  %33 = zext i16 %32 to i64
  %34 = mul nuw nsw i64 %33, 12
  %35 = add i64 %27, %34
  %36 = add i64 %35, 4
  %scevgep249 = getelementptr i8, ptr addrspace(1) %arg7218, i64 %36
  %scevgep254 = getelementptr i8, ptr addrspace(1) %arg1206, i64 %23
  %scevgep258 = getelementptr i8, ptr addrspace(1) %arg0204, i64 %23
  %37 = mul nuw nsw i64 %20, 384
  %scevgep262 = getelementptr i8, ptr addrspace(1) %arg5214, i64 %37
  %scevgep266 = getelementptr i8, ptr addrspace(1) %arg4212, i64 %37
  %scevgep270 = getelementptr i8, ptr addrspace(1) %arg3210, i64 %23
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %__nv_log.exit
  %lsr.iv271 = phi ptr addrspace(1) [ %scevgep270, %entry ], [ %scevgep272, %__nv_log.exit ]
  %lsr.iv267 = phi ptr addrspace(1) [ %scevgep266, %entry ], [ %scevgep268, %__nv_log.exit ]
  %lsr.iv263 = phi ptr addrspace(1) [ %scevgep262, %entry ], [ %scevgep264, %__nv_log.exit ]
  %lsr.iv259 = phi ptr addrspace(1) [ %scevgep258, %entry ], [ %scevgep260, %__nv_log.exit ]
  %lsr.iv255 = phi ptr addrspace(1) [ %scevgep254, %entry ], [ %scevgep256, %__nv_log.exit ]
  %lsr.iv250 = phi ptr addrspace(1) [ %scevgep249, %entry ], [ %scevgep251, %__nv_log.exit ]
  %lsr.iv246 = phi ptr addrspace(1) [ %scevgep245, %entry ], [ %scevgep247, %__nv_log.exit ]
  %lsr.iv242 = phi ptr addrspace(1) [ %scevgep241, %entry ], [ %scevgep243, %__nv_log.exit ]
  %lsr.iv239 = phi ptr addrspace(1) [ %scevgep238, %entry ], [ %scevgep240, %__nv_log.exit ]
  %lsr.iv236 = phi i64 [ %14, %entry ], [ %lsr.iv.next237, %__nv_log.exit ]
  %lsr.iv = phi i32 [ %10, %entry ], [ %lsr.iv.next, %__nv_log.exit ]
  %partial_reduction_result.0185 = phi double [ 0.000000e+00, %entry ], [ %add.3969.i, %__nv_log.exit ]
  %scevgep257 = getelementptr i8, ptr addrspace(1) %lsr.iv255, i64 %18
  %param_1.34672 = load double, ptr addrspace(1) %scevgep257, align 8, !invariant.load !270
  %scevgep261 = getelementptr i8, ptr addrspace(1) %lsr.iv259, i64 %18
  %param_0.24543 = load double, ptr addrspace(1) %scevgep261, align 8, !invariant.load !270
  %multiply.3048.3 = fmul double %param_1.34672, %param_0.24543
  %add.3969.i = fadd double %partial_reduction_result.0185, %multiply.3048.3
  %multiply.3038.3.clone.1 = fmul double %param_1.34672, %param_6.24384
  %scevgep265 = getelementptr i8, ptr addrspace(1) %lsr.iv263, i64 %18
  %param_5.29917 = load double, ptr addrspace(1) %scevgep265, align 8, !invariant.load !270
  %scevgep269 = getelementptr i8, ptr addrspace(1) %lsr.iv267, i64 %18
  %param_4.37638 = load double, ptr addrspace(1) %scevgep269, align 8, !invariant.load !270
  %38 = fneg double %multiply.3038.3.clone.1
  %39 = fmul double %param_4.37638, %38
  %40 = fmul double %multiply.3038.3.clone.1, %param_5.29917
  %add.4208.1.clone.1 = fsub double %39, %40
  %scevgep273 = getelementptr i8, ptr addrspace(1) %lsr.iv271, i64 %18
  %param_3.49259 = load double, ptr addrspace(1) %scevgep273, align 8, !invariant.load !270
  %41 = fcmp ole double %param_3.49259, -3.000000e+01
  %42 = select i1 %41, double -3.000000e+01, double %param_3.49259
  %43 = fcmp oge double %42, 3.000000e+01
  %44 = select i1 %43, double 3.000000e+01, double %42
  %45 = fneg double %44
  %46 = tail call double @llvm.fma.f64(double %45, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %47 = tail call i32 @llvm.nvvm.d2i.lo(double %46) #13
  %48 = tail call double @llvm.nvvm.add.rn.d(double %46, double 0xC338000000000000) #13
  %49 = tail call double @llvm.fma.f64(double %48, double 0xBFE62E42FEFA39EF, double %45)
  %50 = tail call double @llvm.fma.f64(double %48, double 0xBC7ABC9E3B39803F, double %49)
  %51 = tail call double @llvm.fma.f64(double %50, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %52 = tail call double @llvm.fma.f64(double %51, double %50, double 0x3EC71DEE62401315)
  %53 = tail call double @llvm.fma.f64(double %52, double %50, double 0x3EFA01997C89EB71)
  %54 = tail call double @llvm.fma.f64(double %53, double %50, double 0x3F2A01A014761F65)
  %55 = tail call double @llvm.fma.f64(double %54, double %50, double 0x3F56C16C1852B7AF)
  %56 = tail call double @llvm.fma.f64(double %55, double %50, double 0x3F81111111122322)
  %57 = tail call double @llvm.fma.f64(double %56, double %50, double 0x3FA55555555502A1)
  %58 = tail call double @llvm.fma.f64(double %57, double %50, double 0x3FC5555555555511)
  %59 = tail call double @llvm.fma.f64(double %58, double %50, double 0x3FE000000000000B)
  %60 = tail call double @llvm.fma.f64(double %59, double %50, double 1.000000e+00)
  %61 = tail call double @llvm.fma.f64(double %60, double %50, double 1.000000e+00)
  %62 = tail call i32 @llvm.nvvm.d2i.lo(double %61) #13
  %63 = tail call i32 @llvm.nvvm.d2i.hi(double %61) #13
  %64 = shl i32 %47, 20
  %65 = add i32 %63, %64
  %66 = tail call double @llvm.nvvm.lohi.i2d(i32 %62, i32 %65) #13
  %67 = tail call i32 @llvm.nvvm.d2i.hi(double %45) #13
  %68 = bitcast i32 %67 to float
  %69 = tail call float @llvm.nvvm.fabs.f(float %68) #13
  %70 = fcmp olt float %69, 0x4010C46560000000
  br i1 %70, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %loop1.loop_body
  %71 = fcmp ogt double %44, 0.000000e+00
  %72 = fsub double 0x7FF0000000000000, %44
  %z.0.i = select i1 %71, double 0.000000e+00, double %72
  %73 = fcmp olt float %69, 0x4010E90000000000
  br i1 %73, label %74, label %__nv_exp.exit

74:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %75 = sdiv i32 %47, 2
  %76 = shl i32 %75, 20
  %77 = add i32 %63, %76
  %78 = tail call double @llvm.nvvm.lohi.i2d(i32 %62, i32 %77) #13
  %79 = sub nsw i32 %47, %75
  %80 = shl i32 %79, 20
  %81 = add nsw i32 %80, 1072693248
  %82 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %81) #13
  %83 = fmul double %82, %78
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %loop1.loop_body, %__internal_fast_icmp_abs_lt.exit.i, %74
  %z.2.i = phi double [ %66, %loop1.loop_body ], [ %83, %74 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.4201.3.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.617.7.clone.1 = fdiv double 1.000000e+00, %add.4201.3.clone.1
  %subtract.226.7.clone.1 = fsub double 1.000000e+00, %divide.617.7.clone.1
  %multiply.3041.3.clone.1 = fmul double %divide.617.7.clone.1, %subtract.226.7.clone.1
  %multiply.3042.1.clone.1 = fmul double %add.4208.1.clone.1, %multiply.3041.3.clone.1
  %compare.1151.1.clone.1 = fcmp oeq double %42, %44
  %scevgep248 = getelementptr i8, ptr addrspace(1) %lsr.iv246, i64 %18
  %param_2.585412 = load double, ptr addrspace(1) %scevgep248, align 8, !invariant.load !270
  %84 = select i1 %compare.1151.1.clone.1, double 1.000000e+00, double %param_2.585412
  %compare.1152.3.clone.1 = fcmp oeq double %44, 3.000000e+01
  %85 = select i1 %compare.1152.3.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.619.5.clone.1 = fdiv double %84, %85
  %multiply.3044.3.clone.1 = fmul double %divide.619.5.clone.1, %multiply.3042.1.clone.1
  %compare.1153.1.clone.1 = fcmp oeq double %param_3.49259, %42
  %86 = select i1 %compare.1153.1.clone.1, double 1.000000e+00, double %param_2.585412
  %compare.1154.3.clone.1 = fcmp oeq double %42, -3.000000e+01
  %87 = select i1 %compare.1154.3.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.620.3.clone.1 = fdiv double %86, %87
  %multiply.3045.1.clone.1 = fmul double %divide.620.3.clone.1, %multiply.3044.3.clone.1
  %scevgep = getelementptr i8, ptr addrspace(1) %arg9222, i64 %lsr.iv236
  %param_9.169017 = load i8, ptr addrspace(1) %scevgep, align 1, !invariant.load !270
  %scevgep252 = getelementptr i8, ptr addrspace(1) %lsr.iv250, i64 -4
  %param_7.204818 = load i32, ptr addrspace(1) %scevgep252, align 4, !invariant.load !270
  %narrow = tail call i32 @llvm.smax.i32(i32 %param_7.204818, i32 0)
  %88 = tail call i32 @llvm.umin.i32(i32 %narrow, i32 47)
  %param_7.204820 = load i32, ptr addrspace(1) %lsr.iv250, align 4, !invariant.load !270
  %narrow156 = tail call i32 @llvm.smax.i32(i32 %param_7.204820, i32 0)
  %89 = tail call i32 @llvm.umin.i32(i32 %narrow156, i32 191)
  %scevgep253 = getelementptr i8, ptr addrspace(1) %lsr.iv250, i64 4
  %param_7.204822 = load i32, ptr addrspace(1) %scevgep253, align 4, !invariant.load !270
  %90 = icmp sgt i32 %param_7.204822, 0
  %91 = zext nneg i32 %88 to i64
  br i1 %90, label %in_bounds-true, label %__nv_exp.exit.in_bounds-after_crit_edge

__nv_exp.exit.in_bounds-after_crit_edge:          ; preds = %__nv_exp.exit
  %.pre198 = zext nneg i32 %89 to i64
  %param_6.243857.phi.trans.insert = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg6216, i64 0, i64 %7, i64 %91
  %param_6.243858.1.pre = load double, ptr addrspace(1) %param_6.243857.phi.trans.insert, align 8, !invariant.load !270
  %param_0.245459.phi.trans.insert = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg0204, i64 0, i64 %.pre198, i64 %7, i64 %91
  %param_0.245460.1.pre = load double, ptr addrspace(1) %param_0.245459.phi.trans.insert, align 8, !invariant.load !270
  %param_8.187062.phi.trans.insert = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg8220, i64 0, i64 %7, i64 %91
  %param_8.187063.1.pre = load double, ptr addrspace(1) %param_8.187062.phi.trans.insert, align 8, !invariant.load !270
  %.pre = fmul double %param_6.243858.1.pre, %param_0.245460.1.pre
  %.pre235 = fadd double %.pre, %param_8.187063.1.pre
  br label %in_bounds-after

loop1.loop_exit:                                  ; preds = %__nv_log.exit
  %92 = zext nneg i32 %thread.id.2 to i64
  %93 = zext nneg i32 %0 to i64
  %94 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache7, i64 0, i64 %92, i64 %93
  store double %add.3969.i, ptr addrspace(3) %94, align 8
  tail call void @llvm.nvvm.barrier0()
  %95 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache7, i64 0, i64 %93, i64 %92
  %partial_reduction_result136161162 = load <2 x i32>, ptr addrspace(3) %95, align 8
  %96 = extractelement <2 x i32> %partial_reduction_result136161162, i64 0
  %97 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %96, i32 16, i32 31)
  %98 = insertelement <2 x i32> poison, i32 %97, i64 0
  %99 = extractelement <2 x i32> %partial_reduction_result136161162, i64 1
  %100 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %99, i32 16, i32 31)
  %101 = insertelement <2 x i32> %98, i32 %100, i64 1
  %102 = bitcast <2 x i32> %101 to double
  %103 = bitcast <2 x i32> %partial_reduction_result136161162 to double
  %add.3969.i171 = fadd double %103, %102
  %104 = bitcast double %add.3969.i171 to <2 x i32>
  %105 = extractelement <2 x i32> %104, i64 0
  %106 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %105, i32 8, i32 31)
  %107 = insertelement <2 x i32> poison, i32 %106, i64 0
  %108 = extractelement <2 x i32> %104, i64 1
  %109 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %108, i32 8, i32 31)
  %110 = insertelement <2 x i32> %107, i32 %109, i64 1
  %111 = bitcast <2 x i32> %110 to double
  %add.3969.i172 = fadd double %add.3969.i171, %111
  %112 = bitcast double %add.3969.i172 to <2 x i32>
  %113 = extractelement <2 x i32> %112, i64 0
  %114 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %113, i32 4, i32 31)
  %115 = insertelement <2 x i32> poison, i32 %114, i64 0
  %116 = extractelement <2 x i32> %112, i64 1
  %117 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %116, i32 4, i32 31)
  %118 = insertelement <2 x i32> %115, i32 %117, i64 1
  %119 = bitcast <2 x i32> %118 to double
  %add.3969.i173 = fadd double %add.3969.i172, %119
  %120 = bitcast double %add.3969.i173 to <2 x i32>
  %121 = extractelement <2 x i32> %120, i64 0
  %122 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %121, i32 2, i32 31)
  %123 = insertelement <2 x i32> poison, i32 %122, i64 0
  %124 = extractelement <2 x i32> %120, i64 1
  %125 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %124, i32 2, i32 31)
  %126 = insertelement <2 x i32> %123, i32 %125, i64 1
  %127 = bitcast <2 x i32> %126 to double
  %add.3969.i174 = fadd double %add.3969.i173, %127
  %128 = bitcast double %add.3969.i174 to <2 x i32>
  %129 = extractelement <2 x i32> %128, i64 0
  %130 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %129, i32 1, i32 31)
  %131 = insertelement <2 x i32> poison, i32 %130, i64 0
  %132 = extractelement <2 x i32> %128, i64 1
  %133 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %132, i32 1, i32 31)
  %134 = insertelement <2 x i32> %131, i32 %133, i64 1
  %135 = bitcast <2 x i32> %134 to double
  %add.3969.i175 = fadd double %add.3969.i174, %135
  store double %add.3969.i175, ptr addrspace(3) %95, align 8
  %136 = icmp eq i32 %thread.id.2, 0
  br i1 %136, label %reduction_write_output-true, label %reduce-group-0-after

in_bounds-after:                                  ; preds = %__nv_exp.exit.in_bounds-after_crit_edge, %in_bounds-true
  %add.4202.3.clone.164.1.pre-phi = phi double [ %.pre235, %__nv_exp.exit.in_bounds-after_crit_edge ], [ %add.4202.3.clone.1, %in_bounds-true ]
  %pad_result_addr.0 = phi double [ 0.000000e+00, %__nv_exp.exit.in_bounds-after_crit_edge ], [ %add.4202.3.clone.1, %in_bounds-true ]
  %137 = fcmp ole double %add.4202.3.clone.164.1.pre-phi, 0.000000e+00
  %maximum.40.i.1 = select i1 %137, double 0.000000e+00, double %add.4202.3.clone.164.1.pre-phi
  %subtract.228.9.clone.1132 = fsub double 0.000000e+00, %maximum.40.i.1
  %138 = tail call double @llvm.fma.f64(double %subtract.228.9.clone.1132, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %139 = tail call i32 @llvm.nvvm.d2i.lo(double %138) #13
  %140 = tail call double @llvm.nvvm.add.rn.d(double %138, double 0xC338000000000000) #13
  %141 = tail call double @llvm.fma.f64(double %140, double 0xBFE62E42FEFA39EF, double %subtract.228.9.clone.1132)
  %142 = tail call double @llvm.fma.f64(double %140, double 0xBC7ABC9E3B39803F, double %141)
  %143 = tail call double @llvm.fma.f64(double %142, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %144 = tail call double @llvm.fma.f64(double %143, double %142, double 0x3EC71DEE62401315)
  %145 = tail call double @llvm.fma.f64(double %144, double %142, double 0x3EFA01997C89EB71)
  %146 = tail call double @llvm.fma.f64(double %145, double %142, double 0x3F2A01A014761F65)
  %147 = tail call double @llvm.fma.f64(double %146, double %142, double 0x3F56C16C1852B7AF)
  %148 = tail call double @llvm.fma.f64(double %147, double %142, double 0x3F81111111122322)
  %149 = tail call double @llvm.fma.f64(double %148, double %142, double 0x3FA55555555502A1)
  %150 = tail call double @llvm.fma.f64(double %149, double %142, double 0x3FC5555555555511)
  %151 = tail call double @llvm.fma.f64(double %150, double %142, double 0x3FE000000000000B)
  %152 = tail call double @llvm.fma.f64(double %151, double %142, double 1.000000e+00)
  %153 = tail call double @llvm.fma.f64(double %152, double %142, double 1.000000e+00)
  %154 = tail call i32 @llvm.nvvm.d2i.lo(double %153) #13
  %155 = tail call i32 @llvm.nvvm.d2i.hi(double %153) #13
  %156 = shl i32 %139, 20
  %157 = add i32 %155, %156
  %158 = tail call double @llvm.nvvm.lohi.i2d(i32 %154, i32 %157) #13
  %159 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.9.clone.1132) #13
  %160 = bitcast i32 %159 to float
  %161 = tail call float @llvm.nvvm.fabs.f(float %160) #13
  %162 = fcmp olt float %161, 0x4010C46560000000
  br i1 %162, label %__nv_exp.exit166, label %__internal_fast_icmp_abs_lt.exit.i163

__internal_fast_icmp_abs_lt.exit.i163:            ; preds = %in_bounds-after
  %163 = fcmp olt double %subtract.228.9.clone.1132, 0.000000e+00
  %164 = fadd double %subtract.228.9.clone.1132, 0x7FF0000000000000
  %z.0.i164 = select i1 %163, double 0.000000e+00, double %164
  %165 = fcmp olt float %161, 0x4010E90000000000
  br i1 %165, label %166, label %__nv_exp.exit166

166:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i163
  %167 = sdiv i32 %139, 2
  %168 = shl i32 %167, 20
  %169 = add i32 %155, %168
  %170 = tail call double @llvm.nvvm.lohi.i2d(i32 %154, i32 %169) #13
  %171 = sub nsw i32 %139, %167
  %172 = shl i32 %171, 20
  %173 = add nsw i32 %172, 1072693248
  %174 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %173) #13
  %175 = fmul double %174, %170
  br label %__nv_exp.exit166

__nv_exp.exit166:                                 ; preds = %in_bounds-after, %__internal_fast_icmp_abs_lt.exit.i163, %166
  %z.2.i165 = phi double [ %158, %in_bounds-after ], [ %175, %166 ], [ %z.0.i164, %__internal_fast_icmp_abs_lt.exit.i163 ]
  %add.3969.i177 = fadd double %z.2.i165, 0.000000e+00
  %subtract.228.9.clone.1132.1 = fsub double %add.4202.3.clone.164.1.pre-phi, %maximum.40.i.1
  %176 = tail call double @llvm.fma.f64(double %subtract.228.9.clone.1132.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %177 = tail call i32 @llvm.nvvm.d2i.lo(double %176) #13
  %178 = tail call double @llvm.nvvm.add.rn.d(double %176, double 0xC338000000000000) #13
  %179 = tail call double @llvm.fma.f64(double %178, double 0xBFE62E42FEFA39EF, double %subtract.228.9.clone.1132.1)
  %180 = tail call double @llvm.fma.f64(double %178, double 0xBC7ABC9E3B39803F, double %179)
  %181 = tail call double @llvm.fma.f64(double %180, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %182 = tail call double @llvm.fma.f64(double %181, double %180, double 0x3EC71DEE62401315)
  %183 = tail call double @llvm.fma.f64(double %182, double %180, double 0x3EFA01997C89EB71)
  %184 = tail call double @llvm.fma.f64(double %183, double %180, double 0x3F2A01A014761F65)
  %185 = tail call double @llvm.fma.f64(double %184, double %180, double 0x3F56C16C1852B7AF)
  %186 = tail call double @llvm.fma.f64(double %185, double %180, double 0x3F81111111122322)
  %187 = tail call double @llvm.fma.f64(double %186, double %180, double 0x3FA55555555502A1)
  %188 = tail call double @llvm.fma.f64(double %187, double %180, double 0x3FC5555555555511)
  %189 = tail call double @llvm.fma.f64(double %188, double %180, double 0x3FE000000000000B)
  %190 = tail call double @llvm.fma.f64(double %189, double %180, double 1.000000e+00)
  %191 = tail call double @llvm.fma.f64(double %190, double %180, double 1.000000e+00)
  %192 = tail call i32 @llvm.nvvm.d2i.lo(double %191) #13
  %193 = tail call i32 @llvm.nvvm.d2i.hi(double %191) #13
  %194 = shl i32 %177, 20
  %195 = add i32 %193, %194
  %196 = tail call double @llvm.nvvm.lohi.i2d(i32 %192, i32 %195) #13
  %197 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.9.clone.1132.1) #13
  %198 = bitcast i32 %197 to float
  %199 = tail call float @llvm.nvvm.fabs.f(float %198) #13
  %200 = fcmp olt float %199, 0x4010C46560000000
  br i1 %200, label %__nv_exp.exit166.1, label %__internal_fast_icmp_abs_lt.exit.i163.1

__internal_fast_icmp_abs_lt.exit.i163.1:          ; preds = %__nv_exp.exit166
  %201 = fcmp olt double %subtract.228.9.clone.1132.1, 0.000000e+00
  %202 = fadd double %subtract.228.9.clone.1132.1, 0x7FF0000000000000
  %z.0.i164.1 = select i1 %201, double 0.000000e+00, double %202
  %203 = fcmp olt float %199, 0x4010E90000000000
  br i1 %203, label %204, label %__nv_exp.exit166.1

204:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i163.1
  %205 = sdiv i32 %177, 2
  %206 = shl i32 %205, 20
  %207 = add i32 %193, %206
  %208 = tail call double @llvm.nvvm.lohi.i2d(i32 %192, i32 %207) #13
  %209 = sub nsw i32 %177, %205
  %210 = shl i32 %209, 20
  %211 = add nsw i32 %210, 1072693248
  %212 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %211) #13
  %213 = fmul double %212, %208
  br label %__nv_exp.exit166.1

__nv_exp.exit166.1:                               ; preds = %204, %__internal_fast_icmp_abs_lt.exit.i163.1, %__nv_exp.exit166
  %z.2.i165.1 = phi double [ %196, %__nv_exp.exit166 ], [ %213, %204 ], [ %z.0.i164.1, %__internal_fast_icmp_abs_lt.exit.i163.1 ]
  %add.3969.i177.1 = fadd double %add.3969.i177, %z.2.i165.1
  %subtract.228.9.clone.1 = fsub double %pad_result_addr.0, %maximum.40.i.1
  %214 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3969.i177.1) #13
  %215 = tail call i32 @llvm.nvvm.d2i.lo(double %add.3969.i177.1) #13
  %216 = icmp slt i32 %214, 1048576
  %217 = fmul double %add.3969.i177.1, 0x4350000000000000
  %218 = tail call i32 @llvm.nvvm.d2i.lo(double %217) #13
  %219 = tail call i32 @llvm.nvvm.d2i.hi(double %217) #13
  br i1 %216, label %220, label %221

220:                                              ; preds = %__nv_exp.exit166.1
  br label %221

221:                                              ; preds = %220, %__nv_exp.exit166.1
  %.0.i = phi double [ %217, %220 ], [ %add.3969.i177.1, %__nv_exp.exit166.1 ]
  %ihi.0.i = phi i32 [ %219, %220 ], [ %214, %__nv_exp.exit166.1 ]
  %ilo.0.i = phi i32 [ %218, %220 ], [ %215, %__nv_exp.exit166.1 ]
  %e.0.i = phi i32 [ -1077, %220 ], [ -1023, %__nv_exp.exit166.1 ]
  %222 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %222, 2146435071
  br i1 %or.cond.i, label %223, label %269

223:                                              ; preds = %221
  %224 = lshr i32 %ihi.0.i, 20
  %225 = add nsw i32 %e.0.i, %224
  %226 = and i32 %ihi.0.i, 1048575
  %227 = or disjoint i32 %226, 1072693248
  %228 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %227) #13
  %229 = icmp ugt i32 %227, 1073127582
  %230 = tail call i32 @llvm.nvvm.d2i.lo(double %228) #13
  %231 = tail call i32 @llvm.nvvm.d2i.hi(double %228) #13
  %232 = add i32 %231, -1048576
  %233 = tail call double @llvm.nvvm.lohi.i2d(i32 %230, i32 %232) #13
  %spec.select = select i1 %229, double %233, double %228
  %234 = zext i1 %229 to i32
  %spec.select178 = add nsw i32 %225, %234
  %235 = fadd double %spec.select, -1.000000e+00
  %236 = fadd double %spec.select, 1.000000e+00
  %237 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %236) #13
  %238 = fneg double %236
  %239 = tail call double @llvm.fma.f64(double %238, double %237, double 1.000000e+00)
  %240 = tail call double @llvm.fma.f64(double %239, double %239, double %239)
  %241 = tail call double @llvm.fma.f64(double %240, double %237, double %237)
  %242 = fmul double %235, %241
  %243 = fadd double %242, %242
  %244 = fmul double %243, %243
  %245 = tail call double @llvm.fma.f64(double %244, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %246 = tail call double @llvm.fma.f64(double %245, double %244, double 0x3EF3B2669F02676F)
  %247 = tail call double @llvm.fma.f64(double %246, double %244, double 0x3F1745CBA9AB0956)
  %248 = tail call double @llvm.fma.f64(double %247, double %244, double 0x3F3C71C72D1B5154)
  %249 = tail call double @llvm.fma.f64(double %248, double %244, double 0x3F624924923BE72D)
  %250 = tail call double @llvm.fma.f64(double %249, double %244, double 0x3F8999999999A3C4)
  %251 = tail call double @llvm.fma.f64(double %250, double %244, double 0x3FB5555555555554)
  %252 = fsub double %235, %243
  %253 = fmul double %252, 2.000000e+00
  %254 = fneg double %243
  %255 = tail call double @llvm.fma.f64(double %254, double %235, double %253)
  %256 = fmul double %241, %255
  %257 = fmul double %244, %251
  %258 = tail call double @llvm.fma.f64(double %257, double %243, double %256)
  %259 = xor i32 %spec.select178, -2147483648
  %260 = tail call double @llvm.nvvm.lohi.i2d(i32 %259, i32 1127219200) #13
  %261 = fsub double %260, %8
  %262 = tail call double @llvm.fma.f64(double %261, double 0x3FE62E42FEFA39EF, double %243)
  %263 = fneg double %261
  %264 = tail call double @llvm.fma.f64(double %263, double 0x3FE62E42FEFA39EF, double %262)
  %265 = fsub double %264, %243
  %266 = fsub double %258, %265
  %267 = tail call double @llvm.fma.f64(double %261, double 0x3C7ABC9E3B39803F, double %266)
  %268 = fadd double %262, %267
  br label %__nv_log.exit

269:                                              ; preds = %221
  %270 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %271 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %272 = and i32 %271, 2147483647
  %273 = icmp eq i32 %272, 0
  %q.0.i = select i1 %273, double 0xFFF0000000000000, double %270
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %223, %269
  %q.1.i = phi double [ %268, %223 ], [ %q.0.i, %269 ]
  %subtract.229.3.clone.1 = fsub double %subtract.228.9.clone.1, %q.1.i
  %274 = trunc i8 %param_9.169017 to i1
  %275 = select i1 %274, double %subtract.229.3.clone.1, double 0x7FF8000000000000
  %scevgep244 = getelementptr i8, ptr addrspace(1) %lsr.iv242, i64 %18
  store double %multiply.3045.1.clone.1, ptr addrspace(1) %scevgep244, align 8
  store double %275, ptr addrspace(1) %lsr.iv239, align 8
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %lsr.iv.next237 = add nuw nsw i64 %lsr.iv236, 1536
  %scevgep240 = getelementptr i8, ptr addrspace(1) %lsr.iv239, i64 24576
  %scevgep243 = getelementptr i8, ptr addrspace(1) %lsr.iv242, i64 24576
  %scevgep247 = getelementptr i8, ptr addrspace(1) %lsr.iv246, i64 24576
  %scevgep251 = getelementptr i8, ptr addrspace(1) %lsr.iv250, i64 18432
  %scevgep256 = getelementptr i8, ptr addrspace(1) %lsr.iv255, i64 24576
  %scevgep260 = getelementptr i8, ptr addrspace(1) %lsr.iv259, i64 24576
  %scevgep264 = getelementptr i8, ptr addrspace(1) %lsr.iv263, i64 12288
  %scevgep268 = getelementptr i8, ptr addrspace(1) %lsr.iv267, i64 12288
  %scevgep272 = getelementptr i8, ptr addrspace(1) %lsr.iv271, i64 24576
  %276 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %276, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !285

in_bounds-true:                                   ; preds = %__nv_exp.exit
  %param_6.243834 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg6216, i64 0, i64 %7, i64 %91
  %param_6.243835 = load double, ptr addrspace(1) %param_6.243834, align 8, !invariant.load !270
  %277 = zext nneg i32 %89 to i64
  %param_0.245436 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg0204, i64 0, i64 %277, i64 %7, i64 %91
  %param_0.245437 = load double, ptr addrspace(1) %param_0.245436, align 8, !invariant.load !270
  %multiply.3034.5.clone.1 = fmul double %param_6.243835, %param_0.245437
  %param_8.1870 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg8220, i64 0, i64 %7, i64 %91
  %param_8.187038 = load double, ptr addrspace(1) %param_8.1870, align 8, !invariant.load !270
  %add.4202.3.clone.1 = fadd double %multiply.3034.5.clone.1, %param_8.187038
  br label %in_bounds-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %278 = or disjoint i32 %tile_origin.2, %0
  %279 = udiv i32 %278, 48
  %280 = mul i32 %279, 48
  %.decomposed = sub i32 %278, %280
  %281 = zext nneg i32 %279 to i64
  %282 = zext nneg i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg10224, i64 0, i64 %281, i64 %282
  store double %add.3969.i175, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
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
define void @loop_dynamic_slice_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(96) %arg2) local_unnamed_addr #2 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %.urem = add nsw i32 %0, -48
  %.cmp3 = icmp ult i32 %0, 48
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
  %13 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg04, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !270
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr i8, ptr addrspace(1) %arg28, i64 %15
  store i8 %14, ptr addrspace(1) %16, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg2) local_unnamed_addr #2 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %.urem = add nsw i32 %0, -48
  %.cmp3 = icmp ult i32 %0, 48
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
  %13 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg04, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !270
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg28, i64 %15
  store double %14, ptr addrspace(1) %16, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg28) local_unnamed_addr #2 {
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
  %.cmp = icmp ugt i32 %0, 47
  %.urem = add nsw i32 %0, -48
  %.cmp31 = icmp ult i32 %0, 48
  %1 = select i1 %.cmp31, i32 %0, i32 %.urem
  %2 = load i64, ptr addrspace(1) %arg542, align 128, !invariant.load !270
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
  %13 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg440, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !270
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg032, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !270
  %18 = trunc i8 %14 to i1
  %19 = select i1 %18, double %17, double 0.000000e+00
  %20 = getelementptr double, ptr addrspace(1) %arg2174, i64 %15
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !270
  %22 = select i1 %18, double %21, double 0.000000e+00
  %23 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg2072, i64 0, i64 %10, i64 %11, i64 %12
  %24 = load i8, ptr addrspace(1) %23, align 1, !invariant.load !270
  %25 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg1970, i64 0, i64 %10, i64 %11, i64 %12
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !270
  %27 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg1868, i64 0, i64 %10, i64 %11, i64 %12
  %28 = load i8, ptr addrspace(1) %27, align 1, !invariant.load !270
  %29 = getelementptr inbounds [192 x [2 x [48 x i32]]], ptr addrspace(1) %arg1766, i64 0, i64 %10, i64 %11, i64 %12
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !270
  %31 = icmp eq i32 %30, 1
  %32 = getelementptr double, ptr addrspace(1) %arg1664, i64 %15
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !270
  %34 = trunc i8 %28 to i1
  %35 = select i1 %34, i1 %31, i1 false
  %36 = select i1 %35, i1 %18, i1 false
  %37 = select i1 %36, double %33, double 0.000000e+00
  %38 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg1256, i64 0, i64 %10, i64 %11, i64 %12
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !270
  %multiply.2896.11 = fmul double %39, %37
  %40 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg1562, i64 0, i64 %10, i64 %11, i64 %12
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !270
  %multiply.2898.9 = fmul double %41, %multiply.2896.11
  %42 = fmul double %26, %multiply.2896.11
  %add.3976.7 = fsub double %multiply.2898.9, %42
  %43 = trunc i8 %24 to i1
  %44 = select i1 %43, double %add.3976.7, double 0.000000e+00
  %45 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg1460, i64 0, i64 %10, i64 %11, i64 %12
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !270
  %47 = getelementptr double, ptr addrspace(1) %arg1358, i64 %15
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !270
  %49 = select i1 %18, double %48, double 0.000000e+00
  %multiply.2899.19 = fmul double %39, %49
  %50 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg1154, i64 0, i64 %10, i64 %11, i64 %12
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !270
  %multiply.2900.11 = fmul double %51, %multiply.2899.19
  %multiply.2901.7 = fmul double %46, %multiply.2900.11
  %add.3977.7 = fadd double %44, %multiply.2901.7
  %add.3978.5 = fadd double %22, %add.3977.7
  %52 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg236, i64 0, i64 %10, i64 %11, i64 %12
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !270
  %54 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg338, i64 0, i64 %10, i64 %11, i64 %12
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !270
  %56 = fneg double %add.3978.5
  %57 = fmul double %53, %56
  %58 = fmul double %55, %57
  %add.3979.3 = fadd double %19, %58
  %59 = getelementptr double, ptr addrspace(1) %arg746, i64 %15
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !270
  %61 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg848, i64 0, i64 %10, i64 %11, i64 %12
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !270
  %add.3975.9 = fadd double %60, %62
  %63 = select i1 %18, double %add.3975.9, double 0.000000e+00
  %64 = getelementptr double, ptr addrspace(1) %arg1052, i64 %15
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !270
  %66 = select i1 %18, double %65, double 0.000000e+00
  %multiply.2904.7 = fmul double %55, %add.3978.5
  %67 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg950, i64 0, i64 %10, i64 %11, i64 %12
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !270
  %multiply.2905.7 = fmul double %multiply.2904.7, %68
  %add.3980.5 = fadd double %66, %multiply.2905.7
  %add.3981.9 = fadd double %63, %add.3980.5
  %69 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg644, i64 0, i64 %10, i64 %11, i64 %12
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !270
  %71 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg134, i64 0, i64 %10, i64 %11, i64 %12
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !270
  %73 = fneg double %add.3981.9
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
define void @loop_broadcast_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !281
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !281
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg6) local_unnamed_addr #2 {
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
define void @loop_broadcast_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(96) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg6) local_unnamed_addr #2 {
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
define void @loop_add_select_fusion(ptr noalias nocapture align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg3, ptr noalias nocapture align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg9, ptr noalias nocapture align 128 dereferenceable(768) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg13, ptr noalias nocapture align 128 dereferenceable(768) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg17, ptr noalias nocapture align 128 dereferenceable(768) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg22, ptr noalias nocapture align 128 dereferenceable(768) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg36, ptr noalias nocapture align 128 dereferenceable(768) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg38, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg42, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg43, ptr noalias nocapture align 128 dereferenceable(768) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg45, ptr noalias nocapture align 128 dereferenceable(768) %arg46, ptr noalias nocapture align 128 dereferenceable(768) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg48, ptr noalias nocapture align 128 dereferenceable(768) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg50, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg54, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg55, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg56, ptr noalias nocapture align 128 dereferenceable(768) %arg57, ptr noalias nocapture readnone align 128 dereferenceable(18432) %arg58, ptr noalias nocapture align 128 dereferenceable(768) %arg59, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg60, ptr noalias nocapture align 128 dereferenceable(768) %arg61, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg62, ptr noalias nocapture align 128 dereferenceable(768) %arg63, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg64, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg65, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg66, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg67, ptr noalias nocapture readonly align 128 dereferenceable(18432) %arg68, ptr noalias nocapture align 128 dereferenceable(768) %arg69, ptr noalias nocapture align 128 dereferenceable(768) %arg70, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg71, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg72, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg73, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg74, ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg75, ptr noalias nocapture align 128 dereferenceable(768) %arg76) local_unnamed_addr #2 {
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
  %arg43185 = addrspacecast ptr %arg43 to ptr addrspace(1)
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
  %.urem = add nsw i32 %0, -48
  %.cmp = icmp ult i32 %0, 48
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %.cmp98 = icmp ugt i32 %0, 47
  %2 = load i64, ptr addrspace(1) %arg8115, align 128, !invariant.load !270
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
  %13 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg5109, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !270
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg099, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8
  %18 = trunc i8 %14 to i1
  %19 = select i1 %18, double 0.000000e+00, double %17
  %20 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg3105, i64 0, i64 %10, i64 %11, i64 %12
  %21 = load i8, ptr addrspace(1) %20, align 1, !invariant.load !270
  %22 = getelementptr inbounds [192 x [2 x [48 x i32]]], ptr addrspace(1) %arg7113, i64 0, i64 %10, i64 %11, i64 %12
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !270
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %18, double %17, double 0.000000e+00
  %26 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg6111, i64 0, i64 %10, i64 %11, i64 %12
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !270
  %.neg = fneg double %25
  %28 = select i1 %24, double %.neg, double -0.000000e+00
  %29 = fmul double %27, %28
  %30 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg2103, i64 0, i64 %10, i64 %11, i64 %12
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !270
  %32 = fneg double %29
  %33 = fmul double %31, %32
  %34 = trunc i8 %21 to i1
  %35 = select i1 %34, double %33, double 0.000000e+00
  %36 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg1101, i64 0, i64 %12
  %37 = load double, ptr addrspace(1) %36, align 8, !invariant.load !270
  %add.4024.3 = fadd double %37, %35
  %38 = getelementptr double, ptr addrspace(1) %arg18135, i64 %15
  %39 = load double, ptr addrspace(1) %38, align 8
  %40 = select i1 %18, double %39, double 0.000000e+00
  %41 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg17133, i64 0, i64 %10, i64 %11, i64 %12
  %42 = load i8, ptr addrspace(1) %41, align 1, !invariant.load !270
  %43 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg16131, i64 0, i64 %10, i64 %11, i64 %12
  %44 = load i8, ptr addrspace(1) %43, align 1, !invariant.load !270
  %45 = icmp eq i32 %23, 1
  %46 = trunc i8 %44 to i1
  %47 = select i1 %46, i1 %45, i1 false
  %48 = select i1 %47, double %25, double 0.000000e+00
  %49 = trunc i8 %42 to i1
  %50 = select i1 %49, double %48, double 0.000000e+00
  %51 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg15129, i64 0, i64 %10, i64 %11, i64 %12
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !270
  %53 = getelementptr double, ptr addrspace(1) %arg14127, i64 %15
  %54 = load double, ptr addrspace(1) %53, align 8
  %55 = select i1 %18, double %54, double 0.000000e+00
  %56 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg13125, i64 0, i64 %10, i64 %11, i64 %12
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !270
  %multiply.2899.15 = fmul double %55, %57
  %58 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg12123, i64 0, i64 %10, i64 %11, i64 %12
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !270
  %60 = fneg double %52
  %61 = fmul double %multiply.2899.15, %60
  %62 = fmul double %59, %61
  %multiply.2943.9 = fmul double %62, 2.000000e+00
  %add.4025.9 = fadd double %50, %multiply.2943.9
  %add.4026.7 = fadd double %40, %add.4025.9
  %add.4027.9 = fadd double %37, %add.4026.7
  %63 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg11121, i64 0, i64 %10, i64 %11, i64 %12
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !270
  %65 = getelementptr double, ptr addrspace(1) %arg10119, i64 %15
  %66 = load double, ptr addrspace(1) %65, align 8
  %67 = select i1 %18, double %66, double 0.000000e+00
  %add.4028.9 = fadd double %37, %67
  %multiply.2944.9 = fmul double %64, %add.4028.9
  %add.4029.7 = fadd double %multiply.2944.9, %add.4027.9
  %68 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg9117, i64 0, i64 %10, i64 %11, i64 %12
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !270
  %70 = fneg double %add.4029.7
  %71 = fmul double %69, %70
  %72 = getelementptr double, ptr addrspace(1) %arg4107, i64 %15
  %73 = load double, ptr addrspace(1) %72, align 8
  %74 = select i1 %18, double %73, double 0.000000e+00
  %add.4031.5 = fadd double %37, %74
  %75 = fneg double %add.4031.5
  %76 = fmul double %31, %75
  %77 = fmul double %31, %71
  %add.4032.1 = fsub double %76, %77
  %add.4033.1 = fadd double %add.4024.3, %add.4032.1
  %add.4034.1 = fadd double %19, %add.4033.1
  %78 = getelementptr double, ptr addrspace(1) %arg23145, i64 %15
  %79 = load double, ptr addrspace(1) %78, align 8
  %add.4036.3.clone.1 = fadd double %79, 0.000000e+00
  %80 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg22143, i64 0, i64 %10, i64 %11, i64 %12
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !270
  %multiply.2948.7.clone.1 = fmul double %29, %81
  %82 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg21141, i64 0, i64 %10, i64 %11, i64 %12
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !270
  %multiply.2949.7.clone.1 = fmul double %multiply.2948.7.clone.1, %83
  %84 = select i1 %34, double %multiply.2949.7.clone.1, double 0.000000e+00
  %add.4037.3.clone.1 = fadd double %37, %84
  %85 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg20139, i64 0, i64 %10, i64 %11, i64 %12
  %86 = load i8, ptr addrspace(1) %85, align 1, !invariant.load !270
  %87 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg19137, i64 0, i64 %10, i64 %11, i64 %12
  %88 = load double, ptr addrspace(1) %87, align 8, !invariant.load !270
  %multiply.2950.5.clone.1 = fmul double %add.4028.9, %88
  %add.4038.3.clone.1 = fadd double %71, %multiply.2950.5.clone.1
  %89 = trunc i8 %86 to i1
  %90 = select i1 %89, double %add.4038.3.clone.1, double 0.000000e+00
  %multiply.2951.5.clone.1 = fmul double %83, %90
  %add.4039.3.clone.1 = fadd double %add.4037.3.clone.1, %multiply.2951.5.clone.1
  %add.4041.1.clone.1 = fadd double %add.4036.3.clone.1, %add.4039.3.clone.1
  %91 = select i1 %18, double 0.000000e+00, double %66
  %92 = select i1 %18, double 0.000000e+00, double %73
  %93 = select i1 %18, double 0.000000e+00, double %39
  %94 = getelementptr double, ptr addrspace(1) %arg49197, i64 %15
  %95 = load double, ptr addrspace(1) %94, align 8
  %96 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg50199, i64 0, i64 %10, i64 %11, i64 %12
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !270
  %add.3975.5.clone.1.clone.1 = fadd double %95, %97
  %98 = select i1 %18, double 0.000000e+00, double %add.3975.5.clone.1.clone.1
  %99 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg48195, i64 0, i64 %10, i64 %11, i64 %12
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !270
  %101 = getelementptr double, ptr addrspace(1) %arg47193, i64 %15
  %102 = load double, ptr addrspace(1) %101, align 8
  %103 = select i1 %18, double %102, double 0.000000e+00
  %104 = getelementptr double, ptr addrspace(1) %arg46191, i64 %15
  %105 = load double, ptr addrspace(1) %104, align 8
  %106 = select i1 %18, double %105, double 0.000000e+00
  %107 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg45189, i64 0, i64 %10, i64 %11, i64 %12
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !270
  %109 = getelementptr double, ptr addrspace(1) %arg44187, i64 %15
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = select i1 %18, double %110, double 0.000000e+00
  %112 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg43185, i64 0, i64 %10, i64 %11, i64 %12
  %113 = load double, ptr addrspace(1) %112, align 8, !invariant.load !270
  %multiply.2896.9.clone.1.clone.1 = fmul double %48, %57
  %114 = fneg double %multiply.2896.9.clone.1.clone.1
  %115 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg42183, i64 0, i64 %10, i64 %11, i64 %12
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !270
  %multiply.2898.7.clone.1.clone.1 = fmul double %multiply.2896.9.clone.1.clone.1, %116
  %117 = fmul double %multiply.2896.9.clone.1.clone.1, %113
  %add.3976.5.clone.1.clone.1 = fsub double %multiply.2898.7.clone.1.clone.1, %117
  %118 = select i1 %49, double %add.3976.5.clone.1.clone.1, double 0.000000e+00
  %119 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg41181, i64 0, i64 %10, i64 %11, i64 %12
  %120 = load double, ptr addrspace(1) %119, align 8, !invariant.load !270
  %121 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg40179, i64 0, i64 %10, i64 %11, i64 %12
  %122 = load double, ptr addrspace(1) %121, align 8, !invariant.load !270
  %multiply.2900.9.clone.1.clone.1 = fmul double %multiply.2899.15, %122
  %multiply.2901.5.clone.1.clone.1 = fmul double %120, %multiply.2900.9.clone.1.clone.1
  %add.3977.5.clone.1.clone.1 = fadd double %118, %multiply.2901.5.clone.1.clone.1
  %add.3978.3.clone.1.clone.1 = fadd double %111, %add.3977.5.clone.1.clone.1
  %multiply.2904.5.clone.1.clone.1 = fmul double %108, %add.3978.3.clone.1.clone.1
  %123 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg39177, i64 0, i64 %10, i64 %11, i64 %12
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !270
  %multiply.2905.5.clone.1.clone.1 = fmul double %124, %multiply.2904.5.clone.1.clone.1
  %add.3980.3.clone.1.clone.1 = fadd double %106, %multiply.2905.5.clone.1.clone.1
  %add.3983.7.clone.1.clone.1 = fsub double %103, %add.3980.3.clone.1.clone.1
  %125 = select i1 %18, double %add.3975.5.clone.1.clone.1, double 0.000000e+00
  %add.3981.3.clone.1.clone.1 = fadd double %125, %add.3980.3.clone.1.clone.1
  %add.3984.3.clone.1.clone.1 = fadd double %37, %add.3981.3.clone.1.clone.1
  %add.3985.5.clone.1.clone.1 = fadd double %add.3983.7.clone.1.clone.1, %add.3984.3.clone.1.clone.1
  %126 = getelementptr double, ptr addrspace(1) %arg38175, i64 %15
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !270
  %128 = select i1 %18, double %127, double 0.000000e+00
  %add.3986.11.clone.1.clone.1 = fadd double %37, %128
  %129 = getelementptr double, ptr addrspace(1) %arg37173, i64 %15
  %130 = load double, ptr addrspace(1) %129, align 8
  %131 = select i1 %18, double %130, double 0.000000e+00
  %132 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg36171, i64 0, i64 %10, i64 %11, i64 %12
  %133 = load double, ptr addrspace(1) %132, align 8, !invariant.load !270
  %multiply.2909.7.clone.1.clone.1 = fmul double %133, %add.3981.3.clone.1.clone.1
  %134 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg35169, i64 0, i64 %10
  %135 = load double, ptr addrspace(1) %134, align 8, !invariant.load !270
  %multiply.2910.7.clone.1.clone.1 = fmul double %135, %multiply.2909.7.clone.1.clone.1
  %add.3987.7.clone.1.clone.1 = fadd double %37, %multiply.2910.7.clone.1.clone.1
  %add.3988.5.clone.1.clone.1 = fadd double %131, %add.3987.7.clone.1.clone.1
  %136 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg34167, i64 0, i64 %10, i64 %11, i64 %12
  %137 = load double, ptr addrspace(1) %136, align 8, !invariant.load !270
  %138 = fneg double %add.3988.5.clone.1.clone.1
  %139 = fdiv double %138, %137
  %140 = fmul double %135, %139
  %add.3989.9.clone.1.clone.1 = fadd double %add.3986.11.clone.1.clone.1, %140
  %141 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg33165, i64 0, i64 %10, i64 %11, i64 %12
  %142 = load double, ptr addrspace(1) %141, align 8, !invariant.load !270
  %143 = getelementptr double, ptr addrspace(1) %arg32163, i64 %15
  %144 = load double, ptr addrspace(1) %143, align 8, !invariant.load !270
  %145 = getelementptr double, ptr addrspace(1) %arg31161, i64 %15
  %146 = load double, ptr addrspace(1) %145, align 8, !invariant.load !270
  %147 = fadd double %144, %146
  %add.3990.9.clone.1.clone.1 = select i1 %18, double %147, double 0.000000e+00
  %148 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg30159, i64 0, i64 %10, i64 %11, i64 %12
  %149 = load double, ptr addrspace(1) %148, align 8, !invariant.load !270
  %150 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg29157, i64 0, i64 %10, i64 %11, i64 %12
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !270
  %multiply.2906.3.clone.1.clone.1 = fmul double %add.3981.3.clone.1.clone.1, %151
  %152 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg28155, i64 0, i64 %10, i64 %11, i64 %12
  %153 = load double, ptr addrspace(1) %152, align 8, !invariant.load !270
  %divide.597.3.clone.1.clone.1 = fdiv double %multiply.2906.3.clone.1.clone.1, %153
  %multiply.2912.9.clone.1.clone.1 = fmul double %149, %divide.597.3.clone.1.clone.1
  %154 = getelementptr double, ptr addrspace(1) %arg27153, i64 %15
  %155 = load double, ptr addrspace(1) %154, align 8, !invariant.load !270
  %add.3991.7.clone.1.clone.1 = fadd double %155, %multiply.2912.9.clone.1.clone.1
  %add.3992.7.clone.1.clone.1 = fadd double %add.3990.9.clone.1.clone.1, %add.3991.7.clone.1.clone.1
  %add.3993.5.clone.1.clone.1 = fadd double %37, %add.3992.7.clone.1.clone.1
  %156 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg26151, i64 0, i64 %10, i64 %11, i64 %12
  %157 = load double, ptr addrspace(1) %156, align 8, !invariant.load !270
  %158 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg25149, i64 0, i64 %10, i64 %11, i64 %12
  %159 = load double, ptr addrspace(1) %158, align 8, !invariant.load !270
  %160 = fmul double %157, %138
  %161 = fmul double %160, %159
  %add.3994.5.clone.1.clone.1 = fadd double %161, %add.3993.5.clone.1.clone.1
  %162 = fmul double %142, %add.3994.5.clone.1.clone.1
  %add.3995.7.clone.1.clone.1 = fsub double %add.3989.9.clone.1.clone.1, %162
  %163 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg24147, i64 0, i64 %10, i64 %11, i64 %12
  %164 = load double, ptr addrspace(1) %163, align 8, !invariant.load !270
  %multiply.2916.5.clone.1.clone.1 = fmul double %164, %add.3994.5.clone.1.clone.1
  %add.3996.5.clone.1.clone.1 = fadd double %multiply.2916.5.clone.1.clone.1, %add.3995.7.clone.1.clone.1
  %multiply.2917.3.clone.1.clone.1 = fmul double %137, %add.3996.5.clone.1.clone.1
  %add.3997.3.clone.1.clone.1 = fadd double %add.3985.5.clone.1.clone.1, %multiply.2917.3.clone.1.clone.1
  %multiply.2918.3.clone.1.clone.1 = fmul double %100, %add.3997.3.clone.1.clone.1
  %add.3998.3.clone.1.clone.1 = fadd double %37, %multiply.2918.3.clone.1.clone.1
  %add.3999.1.clone.1.clone.1 = fadd double %98, %add.3998.3.clone.1.clone.1
  %165 = getelementptr double, ptr addrspace(1) %arg57213, i64 %15
  %166 = load double, ptr addrspace(1) %165, align 8
  %add.4042.3.clone.1.clone.1 = fadd double %166, 0.000000e+00
  %167 = getelementptr inbounds [192 x [1 x [2 x [48 x i8]]]], ptr addrspace(1) %arg56211, i64 0, i64 %10, i64 0, i64 %11, i64 %12
  %168 = load i8, ptr addrspace(1) %167, align 1, !invariant.load !270
  %169 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg55209, i64 0, i64 %10, i64 %11, i64 %12
  %170 = load double, ptr addrspace(1) %169, align 8, !invariant.load !270
  %multiply.2920.3.clone.1.clone.1 = fmul double %170, %114
  %171 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg54207, i64 0, i64 %10, i64 %11, i64 %12
  %172 = load double, ptr addrspace(1) %171, align 8, !invariant.load !270
  %multiply.2952.7.clone.1.clone.1 = fmul double %multiply.2920.3.clone.1.clone.1, %172
  %multiply.2953.7.clone.1.clone.1 = fmul double %multiply.2952.7.clone.1.clone.1, 5.000000e-01
  %173 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg53205, i64 0, i64 %10, i64 %11, i64 %12
  %174 = load double, ptr addrspace(1) %173, align 8, !invariant.load !270
  %multiply.2954.5.clone.1.clone.1 = fmul double %174, %multiply.2953.7.clone.1.clone.1
  %multiply.2922.5.clone.1.clone.1 = fmul double %multiply.2896.9.clone.1.clone.1, %170
  %175 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg52203, i64 0, i64 %10, i64 %11, i64 %12
  %176 = load double, ptr addrspace(1) %175, align 8, !invariant.load !270
  %multiply.2923.3.clone.1.clone.1 = fmul double %multiply.2922.5.clone.1.clone.1, %176
  %multiply.2955.7.clone.1.clone.1 = fmul double %172, %multiply.2923.3.clone.1.clone.1
  %add.4043.5.clone.1.clone.1 = fadd double %multiply.2954.5.clone.1.clone.1, %multiply.2955.7.clone.1.clone.1
  %multiply.2925.5.clone.1.clone.1 = fmul double %multiply.2896.9.clone.1.clone.1, 5.000000e-01
  %multiply.2926.3.clone.1.clone.1 = fmul double %multiply.2925.5.clone.1.clone.1, %176
  %multiply.2956.5.clone.1.clone.1 = fmul double %172, %multiply.2926.3.clone.1.clone.1
  %add.4044.3.clone.1.clone.1 = fadd double %multiply.2956.5.clone.1.clone.1, %add.4043.5.clone.1.clone.1
  %177 = trunc i8 %168 to i1
  %178 = select i1 %177, double %add.4044.3.clone.1.clone.1, double 0.000000e+00
  %multiply.2928.3.clone.1.clone.1 = fmul double %multiply.2900.9.clone.1.clone.1, %170
  %multiply.2957.5.clone.1.clone.1 = fmul double %multiply.2928.3.clone.1.clone.1, %172
  %add.4046.3.clone.1.clone.1 = fadd double %multiply.2957.5.clone.1.clone.1, %178
  %179 = getelementptr inbounds [48 x [1 x double]], ptr addrspace(1) %arg51201, i64 0, i64 %12, i64 0
  %180 = load double, ptr addrspace(1) %179, align 8, !invariant.load !270
  %add.4047.3.clone.1.clone.1 = fadd double %180, %add.4046.3.clone.1.clone.1
  %add.4048.1.clone.1.clone.1 = fadd double %add.4042.3.clone.1.clone.1, %add.4047.3.clone.1.clone.1
  %181 = getelementptr double, ptr addrspace(1) %arg59217, i64 %15
  %182 = load double, ptr addrspace(1) %181, align 8
  %183 = select i1 %18, double 0.000000e+00, double %182
  %184 = getelementptr double, ptr addrspace(1) %arg63225, i64 %15
  %185 = load double, ptr addrspace(1) %184, align 8
  %186 = select i1 %18, double 0.000000e+00, double %185
  %187 = getelementptr double, ptr addrspace(1) %arg60219, i64 %15
  %188 = load double, ptr addrspace(1) %187, align 8, !invariant.load !270
  %189 = getelementptr double, ptr addrspace(1) %arg76251, i64 %15
  %190 = load double, ptr addrspace(1) %189, align 8
  %191 = select i1 %18, double %190, double 0.000000e+00
  %192 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg75249, i64 0, i64 %10, i64 %11, i64 %12
  %193 = load double, ptr addrspace(1) %192, align 8, !invariant.load !270
  %multiply.2919.7.clone.1.clone.1 = fmul double %add.3978.3.clone.1.clone.1, %193
  %divide.598.7.clone.1.clone.1 = fdiv double %add.3978.3.clone.1.clone.1, %153
  %add.4000.5.clone.1.clone.1 = fadd double %divide.598.7.clone.1.clone.1, %multiply.2919.7.clone.1.clone.1
  %add.4001.7.clone.1.clone.1 = fadd double %191, %add.4000.5.clone.1.clone.1
  %194 = getelementptr double, ptr addrspace(1) %arg74247, i64 %15
  %195 = load double, ptr addrspace(1) %194, align 8, !invariant.load !270
  %add.4002.5.clone.1.clone.1 = fadd double %195, %add.4001.7.clone.1.clone.1
  %196 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg73245, i64 0, i64 %10, i64 %11, i64 %12
  %197 = load double, ptr addrspace(1) %196, align 8, !invariant.load !270
  %198 = select i1 %18, double %182, double 0.000000e+00
  %199 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg67233, i64 0, i64 %10, i64 %11, i64 %12
  %200 = load double, ptr addrspace(1) %199, align 8, !invariant.load !270
  %multiply.2921.13.clone.1.clone.1 = fmul double %multiply.2920.3.clone.1.clone.1, %200
  %201 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg66231, i64 0, i64 %10, i64 %11, i64 %12
  %202 = load double, ptr addrspace(1) %201, align 8, !invariant.load !270
  %multiply.2924.11.clone.1.clone.1 = fmul double %multiply.2923.3.clone.1.clone.1, %202
  %add.4003.11.clone.1.clone.1 = fadd double %multiply.2921.13.clone.1.clone.1, %multiply.2924.11.clone.1.clone.1
  %multiply.2927.11.clone.1.clone.1 = fmul double %multiply.2926.3.clone.1.clone.1, %202
  %add.4004.9.clone.1.clone.1 = fadd double %multiply.2927.11.clone.1.clone.1, %add.4003.11.clone.1.clone.1
  %203 = select i1 %49, double %add.4004.9.clone.1.clone.1, double 0.000000e+00
  %multiply.2929.9.clone.1.clone.1 = fmul double %multiply.2928.3.clone.1.clone.1, %202
  %add.4005.9.clone.1.clone.1 = fadd double %multiply.2929.9.clone.1.clone.1, %203
  %add.4006.7.clone.1.clone.1 = fadd double %198, %add.4005.9.clone.1.clone.1
  %add.4007.5.clone.1.clone.1 = fadd double %37, %add.4006.7.clone.1.clone.1
  %multiply.2930.5.clone.1.clone.1 = fmul double %197, %add.4007.5.clone.1.clone.1
  %add.4008.3.clone.1.clone.1 = fadd double %add.4002.5.clone.1.clone.1, %multiply.2930.5.clone.1.clone.1
  %204 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg72243, i64 0, i64 %10, i64 %11, i64 %12
  %205 = load double, ptr addrspace(1) %204, align 8, !invariant.load !270
  %206 = fneg double %add.4008.3.clone.1.clone.1
  %207 = fmul double %205, %206
  %208 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg62223, i64 0, i64 %10, i64 %11, i64 %12
  %209 = load double, ptr addrspace(1) %208, align 8, !invariant.load !270
  %210 = getelementptr double, ptr addrspace(1) %arg61221, i64 %15
  %211 = load double, ptr addrspace(1) %210, align 8
  %212 = select i1 %18, double %211, double 0.000000e+00
  %add.4009.5.clone.1.clone.1 = fadd double %37, %212
  %213 = fneg double %add.4009.5.clone.1.clone.1
  %214 = fmul double %209, %213
  %215 = fmul double %209, %207
  %add.4010.1.clone.1.clone.1 = fsub double %214, %215
  %add.4011.1.clone.1.clone.1 = fadd double %188, %add.4010.1.clone.1.clone.1
  %add.4012.1.clone.1.clone.1 = fadd double %186, %add.4011.1.clone.1.clone.1
  %216 = select i1 %18, double 0.000000e+00, double %211
  %217 = getelementptr double, ptr addrspace(1) %arg69237, i64 %15
  %218 = load double, ptr addrspace(1) %217, align 8
  %add.4015.3.clone.1.clone.1 = fadd double %218, 0.000000e+00
  %219 = getelementptr double, ptr addrspace(1) %arg64227, i64 %15
  %220 = load double, ptr addrspace(1) %219, align 8, !invariant.load !270
  %221 = getelementptr inbounds [192 x [2 x [48 x i8]]], ptr addrspace(1) %arg68235, i64 0, i64 %10, i64 %11, i64 %12
  %222 = load i8, ptr addrspace(1) %221, align 1, !invariant.load !270
  %multiply.2935.7.clone.1.clone.1 = fmul double %108, %add.4007.5.clone.1.clone.1
  %add.4016.5.clone.1.clone.1 = fadd double %multiply.2935.7.clone.1.clone.1, %207
  %223 = trunc i8 %222 to i1
  %224 = select i1 %223, double %add.4016.5.clone.1.clone.1, double 0.000000e+00
  %225 = getelementptr inbounds [192 x [2 x [48 x double]]], ptr addrspace(1) %arg65229, i64 0, i64 %10, i64 %11, i64 %12
  %226 = load double, ptr addrspace(1) %225, align 8, !invariant.load !270
  %multiply.2936.5.clone.1.clone.1 = fmul double %226, %224
  %add.4017.1.clone.1.clone.1 = fadd double %220, %multiply.2936.5.clone.1.clone.1
  %add.4018.1.clone.1.clone.1 = fadd double %add.4015.3.clone.1.clone.1, %add.4017.1.clone.1.clone.1
  %227 = select i1 %18, double 0.000000e+00, double %54
  %228 = getelementptr double, ptr addrspace(1) %arg71241, i64 %15
  %229 = load double, ptr addrspace(1) %228, align 8, !invariant.load !270
  %multiply.2937.5.clone.1.clone.1 = fmul double %149, %multiply.2936.5.clone.1.clone.1
  %add.4019.3.clone.1.clone.1 = fadd double %229, %multiply.2937.5.clone.1.clone.1
  %230 = getelementptr double, ptr addrspace(1) %arg70239, i64 %15
  %231 = load double, ptr addrspace(1) %230, align 8
  %232 = select i1 %18, double %231, double 0.000000e+00
  %add.4020.7.clone.1.clone.1 = fadd double %55, %232
  %add.4021.5.clone.1.clone.1 = fadd double %37, %add.4020.7.clone.1.clone.1
  %multiply.2938.3.clone.1.clone.1 = fmul double %100, %add.4021.5.clone.1.clone.1
  %add.4022.1.clone.1.clone.1 = fadd double %multiply.2938.3.clone.1.clone.1, %add.4019.3.clone.1.clone.1
  %add.4023.1.clone.1.clone.1 = fadd double %227, %add.4022.1.clone.1.clone.1
  %233 = select i1 %18, double 0.000000e+00, double %231
  %234 = select i1 %18, double 0.000000e+00, double %105
  %add.4013.1.clone.1 = fadd double %37, %234
  %235 = select i1 %18, double 0.000000e+00, double %110
  %add.4014.1.clone.1 = fadd double %37, %235
  %236 = select i1 %18, double 0.000000e+00, double %190
  %237 = select i1 %18, double 0.000000e+00, double %102
  %238 = select i1 %18, double 0.000000e+00, double %130
  store double %add.4034.1, ptr addrspace(1) %16, align 8
  store double %add.4041.1.clone.1, ptr addrspace(1) %78, align 8
  store double %91, ptr addrspace(1) %65, align 8
  store double %92, ptr addrspace(1) %72, align 8
  store double %93, ptr addrspace(1) %38, align 8
  store double %add.3999.1.clone.1.clone.1, ptr addrspace(1) %94, align 8
  store double %add.4048.1.clone.1.clone.1, ptr addrspace(1) %165, align 8
  store double %183, ptr addrspace(1) %181, align 8
  store double %add.4012.1.clone.1.clone.1, ptr addrspace(1) %184, align 8
  store double %216, ptr addrspace(1) %210, align 8
  store double %add.4018.1.clone.1.clone.1, ptr addrspace(1) %217, align 8
  store double %add.4023.1.clone.1.clone.1, ptr addrspace(1) %53, align 8
  store double %233, ptr addrspace(1) %230, align 8
  store double %add.4013.1.clone.1, ptr addrspace(1) %104, align 8
  store double %add.4014.1.clone.1, ptr addrspace(1) %109, align 8
  store double %236, ptr addrspace(1) %189, align 8
  store double %237, ptr addrspace(1) %101, align 8
  store double %238, ptr addrspace(1) %129, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #4 {
entry:
  %arg135 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg033 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !284
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.2 = shl nuw nsw i32 %block.id.x, 5
  %1 = or disjoint i32 %tile_origin.2, %thread.id.2
  %.lhs.trunc = trunc nuw nsw i32 %1 to i8
  %2 = urem i8 %.lhs.trunc, 48
  %3 = udiv i8 %.lhs.trunc, 48
  %4 = zext nneg i8 %3 to i64
  %5 = zext nneg i8 %2 to i64
  %6 = add nuw nsw i32 %0, -32
  %7 = zext nneg i32 %thread.id.x to i64
  %8 = lshr i64 %7, 5
  %9 = mul nuw nsw i64 %8, 768
  %10 = mul nuw nsw i64 %4, 384
  %11 = add nuw nsw i64 %9, %10
  %12 = shl nuw nsw i64 %5, 3
  %13 = add nuw nsw i64 %11, %12
  %scevgep = getelementptr i8, ptr addrspace(1) %arg033, i64 %13
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %loop1.loop_body
  %lsr.iv37 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep38, %loop1.loop_body ]
  %lsr.iv = phi i32 [ %6, %entry ], [ %lsr.iv.next, %loop1.loop_body ]
  %partial_reduction_result.029 = phi double [ 0.000000e+00, %entry ], [ %add.3969.i, %loop1.loop_body ]
  %param_0.24562 = load double, ptr addrspace(1) %lsr.iv37, align 8, !invariant.load !270
  %add.3969.i = fadd double %partial_reduction_result.029, %param_0.24562
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep38 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 24576
  %14 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %14, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !287

loop1.loop_exit:                                  ; preds = %loop1.loop_body
  %15 = zext nneg i32 %thread.id.2 to i64
  %16 = zext nneg i32 %0 to i64
  %17 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache8, i64 0, i64 %15, i64 %16
  store double %add.3969.i, ptr addrspace(3) %17, align 8
  tail call void @llvm.nvvm.barrier0()
  %18 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache8, i64 0, i64 %16, i64 %15
  %partial_reduction_result31819 = load <2 x i32>, ptr addrspace(3) %18, align 8
  %19 = extractelement <2 x i32> %partial_reduction_result31819, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 16, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %partial_reduction_result31819, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 16, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %26 = bitcast <2 x i32> %partial_reduction_result31819 to double
  %add.3969.i24 = fadd double %26, %25
  %27 = bitcast double %add.3969.i24 to <2 x i32>
  %28 = extractelement <2 x i32> %27, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 8, i32 31)
  %30 = insertelement <2 x i32> poison, i32 %29, i64 0
  %31 = extractelement <2 x i32> %27, i64 1
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %add.3969.i25 = fadd double %add.3969.i24, %34
  %35 = bitcast double %add.3969.i25 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 4, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.3969.i26 = fadd double %add.3969.i25, %42
  %43 = bitcast double %add.3969.i26 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 2, i32 31)
  %46 = insertelement <2 x i32> poison, i32 %45, i64 0
  %47 = extractelement <2 x i32> %43, i64 1
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> %46, i32 %48, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.3969.i27 = fadd double %add.3969.i26, %50
  %51 = bitcast double %add.3969.i27 to <2 x i32>
  %52 = extractelement <2 x i32> %51, i64 0
  %53 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %52, i32 1, i32 31)
  %54 = insertelement <2 x i32> poison, i32 %53, i64 0
  %55 = extractelement <2 x i32> %51, i64 1
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 1, i32 31)
  %57 = insertelement <2 x i32> %54, i32 %56, i64 1
  %58 = bitcast <2 x i32> %57 to double
  %add.3969.i28 = fadd double %add.3969.i27, %58
  store double %add.3969.i28, ptr addrspace(3) %18, align 8
  %59 = icmp eq i32 %thread.id.2, 0
  br i1 %59, label %reduction_write_output-true, label %reduce-group-0-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %60 = or disjoint i32 %tile_origin.2, %0
  %61 = udiv i32 %60, 48
  %62 = mul i32 %61, 48
  %.decomposed = sub i32 %60, %62
  %63 = zext nneg i32 %61 to i64
  %64 = zext nneg i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg135, i64 0, i64 %63, i64 %64
  store double %add.3969.i28, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_concatenate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg32, ptr noalias nocapture writeonly align 128 dereferenceable(4608) %arg33, ptr noalias nocapture writeonly align 128 dereferenceable(4608) %arg34) local_unnamed_addr #2 {
entry:
  %arg34181 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33179 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32177 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31175 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30173 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29171 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28169 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27167 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26165 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25163 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24161 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23159 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22157 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21155 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20153 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19151 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18149 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17147 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16145 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15143 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14141 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13139 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12137 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11135 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10133 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9131 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8129 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7127 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6125 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5123 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4121 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3119 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2117 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0113 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !272
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 288
  %4 = mul i16 %3, 288
  %.decomposed = sub i16 %.lhs.trunc, %4
  %.zext = zext nneg i16 %.decomposed to i32
  %.zext112 = zext nneg i16 %3 to i32
  %5 = icmp ult i32 %linear_index, 576
  br i1 %5, label %concatenate.pivot.144., label %loop_concatenate_fusion.in_bounds-after

loop_concatenate_fusion.in_bounds-after:          ; preds = %concatenate.39.1.clone.1.merge, %entry
  ret void

concatenate.pivot.144.:                           ; preds = %entry
  %6 = icmp ult i16 %.decomposed, 144
  br i1 %6, label %concatenate.pivot.48., label %concatenate.pivot.192.

concatenate.pivot.48.:                            ; preds = %concatenate.pivot.144.
  %7 = icmp ult i16 %.decomposed, 48
  br i1 %7, label %concatenate.pivot.0., label %concatenate.pivot.96.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.48.
  %8 = mul nuw nsw i32 %.zext112, 48
  %9 = zext nneg i16 %3 to i64
  %10 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg31175, i64 0, i64 %9
  %11 = load i64, ptr addrspace(1) %10, align 8, !invariant.load !270
  %12 = icmp eq i64 %11, 0
  %13 = zext nneg i32 %8 to i64
  %14 = getelementptr double, ptr addrspace(1) %arg0113, i64 %13
  %15 = zext nneg i16 %.decomposed to i64
  %16 = getelementptr inbounds double, ptr addrspace(1) %14, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !270
  %18 = getelementptr double, ptr addrspace(1) %arg10133, i64 %13
  %19 = getelementptr inbounds double, ptr addrspace(1) %18, i64 %15
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !270
  %21 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg32177, i64 0, i64 %9
  %22 = load i64, ptr addrspace(1) %21, align 8, !invariant.load !270
  %23 = sitofp i64 %22 to double
  %multiply.3002.11 = fmul double %23, 0x3F718590FECF82C5
  %24 = getelementptr double, ptr addrspace(1) %arg11135, i64 %13
  %25 = getelementptr inbounds double, ptr addrspace(1) %24, i64 %15
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !270
  %multiply.3003.17 = fmul double %26, %multiply.3002.11
  %add.4164.15 = fadd double %20, %multiply.3003.17
  %27 = getelementptr double, ptr addrspace(1) %arg8129, i64 %13
  %28 = getelementptr inbounds double, ptr addrspace(1) %27, i64 %15
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !270
  %30 = getelementptr double, ptr addrspace(1) %arg9131, i64 %13
  %31 = getelementptr inbounds double, ptr addrspace(1) %30, i64 %15
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !270
  %add.4206.19 = fsub double %29, %32
  %multiply.3037.13 = fmul double %multiply.3002.11, %add.4206.19
  %add.4207.11 = fadd double %add.4164.15, %multiply.3037.13
  %add.4229.3 = fadd double %17, %add.4207.11
  %33 = select i1 %12, double %add.4207.11, double %add.4229.3
  br label %concatenate.41.1.merge

concatenate.pivot.96.:                            ; preds = %concatenate.pivot.48.
  %34 = icmp ult i16 %.decomposed, 96
  %35 = mul nuw nsw i32 %.zext112, 48
  %36 = zext nneg i16 %3 to i64
  %37 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg31175, i64 0, i64 %36
  %38 = load i64, ptr addrspace(1) %37, align 8, !invariant.load !270
  %39 = zext nneg i32 %35 to i64
  %40 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg32177, i64 0, i64 %36
  %41 = load i64, ptr addrspace(1) %40, align 8, !invariant.load !270
  %42 = sitofp i64 %41 to double
  %multiply.3002.114 = fmul double %42, 0x3F718590FECF82C5
  br i1 %34, label %concatenate.pivot.48.24, label %concatenate.pivot.96.25

concatenate.pivot.48.24:                          ; preds = %concatenate.pivot.96.
  %43 = icmp eq i64 %38, 0
  %44 = add nsw i32 %.zext, -48
  %45 = getelementptr double, ptr addrspace(1) %arg1115, i64 %39
  %46 = zext nneg i32 %44 to i64
  %47 = getelementptr inbounds double, ptr addrspace(1) %45, i64 %46
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !270
  %49 = getelementptr double, ptr addrspace(1) %arg14141, i64 %39
  %50 = getelementptr inbounds double, ptr addrspace(1) %49, i64 %46
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !270
  %52 = getelementptr double, ptr addrspace(1) %arg15143, i64 %39
  %53 = getelementptr inbounds double, ptr addrspace(1) %52, i64 %46
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !270
  %multiply.3004.17 = fmul double %54, %multiply.3002.114
  %add.4166.15 = fadd double %51, %multiply.3004.17
  %55 = getelementptr double, ptr addrspace(1) %arg13139, i64 %39
  %56 = getelementptr inbounds double, ptr addrspace(1) %55, i64 %46
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !270
  %58 = getelementptr double, ptr addrspace(1) %arg12137, i64 %39
  %59 = getelementptr inbounds double, ptr addrspace(1) %58, i64 %46
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !270
  %add.4192.25 = fadd double %60, -1.000000e+00
  %multiply.3046.21 = fmul double %add.4192.25, 4.000000e+00
  %61 = fsub double %57, %multiply.3046.21
  %multiply.3047.13 = fmul double %multiply.3002.114, %61
  %add.4211.11 = fadd double %add.4166.15, %multiply.3047.13
  %add.4231.3 = fadd double %48, %add.4211.11
  %62 = select i1 %43, double %add.4211.11, double %add.4231.3
  br label %concatenate.41.1.merge

concatenate.pivot.96.25:                          ; preds = %concatenate.pivot.96.
  %63 = icmp eq i64 %38, 0
  %64 = add nsw i32 %.zext, -96
  %65 = getelementptr double, ptr addrspace(1) %arg2117, i64 %39
  %66 = zext nneg i32 %64 to i64
  %67 = getelementptr inbounds double, ptr addrspace(1) %65, i64 %66
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !270
  %69 = getelementptr double, ptr addrspace(1) %arg6125, i64 %39
  %70 = getelementptr inbounds double, ptr addrspace(1) %69, i64 %66
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !270
  %72 = getelementptr double, ptr addrspace(1) %arg7127, i64 %39
  %73 = getelementptr inbounds double, ptr addrspace(1) %72, i64 %66
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !270
  %multiply.3005.17 = fmul double %74, %multiply.3002.114
  %add.4167.15 = fadd double %71, %multiply.3005.17
  %75 = getelementptr double, ptr addrspace(1) %arg29171, i64 %39
  %76 = getelementptr inbounds double, ptr addrspace(1) %75, i64 %66
  %77 = load double, ptr addrspace(1) %76, align 8, !invariant.load !270
  %78 = getelementptr double, ptr addrspace(1) %arg30173, i64 %39
  %79 = getelementptr inbounds double, ptr addrspace(1) %78, i64 %66
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !270
  %multiply.3049.5 = fmul double %77, %80
  %81 = getelementptr double, ptr addrspace(1) %arg28169, i64 %39
  %82 = getelementptr inbounds double, ptr addrspace(1) %81, i64 %66
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !270
  %add.4178.11 = fadd double %83, 0xBFF62E42FEFA39EF
  %multiply.3050.7 = fmul double %add.4178.11, 0x3FFC71C71C71C71C
  %84 = fsub double %multiply.3049.5, %multiply.3050.7
  %multiply.3051.13 = fmul double %multiply.3002.114, %84
  %add.4213.11 = fadd double %add.4167.15, %multiply.3051.13
  %add.4232.3 = fadd double %68, %add.4213.11
  %85 = select i1 %63, double %add.4213.11, double %add.4232.3
  br label %concatenate.41.1.merge

concatenate.pivot.192.:                           ; preds = %concatenate.pivot.144.
  %86 = icmp ult i16 %.decomposed, 192
  %87 = mul nuw nsw i32 %.zext112, 48
  %88 = zext nneg i16 %3 to i64
  %89 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg31175, i64 0, i64 %88
  %90 = load i64, ptr addrspace(1) %89, align 8, !invariant.load !270
  %91 = zext nneg i32 %87 to i64
  br i1 %86, label %concatenate.pivot.144.26, label %concatenate.pivot.240.

concatenate.pivot.144.26:                         ; preds = %concatenate.pivot.192.
  %92 = icmp eq i64 %90, 0
  %93 = add nsw i32 %.zext, -144
  %94 = getelementptr double, ptr addrspace(1) %arg3119, i64 %91
  %95 = zext nneg i32 %93 to i64
  %96 = getelementptr inbounds double, ptr addrspace(1) %94, i64 %95
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !270
  %98 = getelementptr double, ptr addrspace(1) %arg18149, i64 %91
  %99 = getelementptr inbounds double, ptr addrspace(1) %98, i64 %95
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !270
  %101 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg32177, i64 0, i64 %88
  %102 = load i64, ptr addrspace(1) %101, align 8, !invariant.load !270
  %103 = sitofp i64 %102 to double
  %multiply.3002.1113 = fmul double %103, 0x3F718590FECF82C5
  %104 = getelementptr double, ptr addrspace(1) %arg19151, i64 %91
  %105 = getelementptr inbounds double, ptr addrspace(1) %104, i64 %95
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !270
  %multiply.3006.17 = fmul double %106, %multiply.3002.1113
  %add.4168.15 = fadd double %100, %multiply.3006.17
  %107 = getelementptr double, ptr addrspace(1) %arg16145, i64 %91
  %108 = getelementptr inbounds double, ptr addrspace(1) %107, i64 %95
  %109 = load double, ptr addrspace(1) %108, align 8, !invariant.load !270
  %110 = getelementptr double, ptr addrspace(1) %arg17147, i64 %91
  %111 = getelementptr inbounds double, ptr addrspace(1) %110, i64 %95
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !270
  %add.4197.25 = fadd double %112, -1.000000e+00
  %add.4214.19 = fsub double %109, %add.4197.25
  %multiply.3053.13 = fmul double %multiply.3002.1113, %add.4214.19
  %add.4216.11 = fadd double %add.4168.15, %multiply.3053.13
  %add.4233.3 = fadd double %97, %add.4216.11
  %113 = select i1 %92, double %add.4216.11, double %add.4233.3
  br label %concatenate.41.1.merge

concatenate.pivot.240.:                           ; preds = %concatenate.pivot.192.
  %114 = icmp ult i16 %.decomposed, 240
  %115 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg32177, i64 0, i64 %88
  %116 = load i64, ptr addrspace(1) %115, align 8, !invariant.load !270
  %117 = sitofp i64 %116 to double
  %multiply.3002.1118 = fmul double %117, 0x3F718590FECF82C5
  br i1 %114, label %concatenate.pivot.192.27, label %concatenate.pivot.240.28

concatenate.pivot.192.27:                         ; preds = %concatenate.pivot.240.
  %118 = icmp eq i64 %90, 0
  %119 = add nsw i32 %.zext, -192
  %120 = getelementptr double, ptr addrspace(1) %arg4121, i64 %91
  %121 = zext nneg i32 %119 to i64
  %122 = getelementptr inbounds double, ptr addrspace(1) %120, i64 %121
  %123 = load double, ptr addrspace(1) %122, align 8, !invariant.load !270
  %124 = getelementptr double, ptr addrspace(1) %arg22157, i64 %91
  %125 = getelementptr inbounds double, ptr addrspace(1) %124, i64 %121
  %126 = load double, ptr addrspace(1) %125, align 8, !invariant.load !270
  %127 = getelementptr double, ptr addrspace(1) %arg23159, i64 %91
  %128 = getelementptr inbounds double, ptr addrspace(1) %127, i64 %121
  %129 = load double, ptr addrspace(1) %128, align 8, !invariant.load !270
  %multiply.3007.17 = fmul double %129, %multiply.3002.1118
  %add.4169.15 = fadd double %126, %multiply.3007.17
  %130 = getelementptr double, ptr addrspace(1) %arg20153, i64 %91
  %131 = getelementptr inbounds double, ptr addrspace(1) %130, i64 %121
  %132 = load double, ptr addrspace(1) %131, align 8, !invariant.load !270
  %133 = getelementptr double, ptr addrspace(1) %arg21155, i64 %91
  %134 = getelementptr inbounds double, ptr addrspace(1) %133, i64 %121
  %135 = load double, ptr addrspace(1) %134, align 8, !invariant.load !270
  %add.4174.25 = fadd double %135, 4.000000e+00
  %multiply.3054.21 = fmul double %add.4174.25, 2.500000e-01
  %136 = fsub double %132, %multiply.3054.21
  %multiply.3055.13 = fmul double %multiply.3002.1118, %136
  %add.4218.11 = fadd double %add.4169.15, %multiply.3055.13
  %add.4234.3 = fadd double %123, %add.4218.11
  %137 = select i1 %118, double %add.4218.11, double %add.4234.3
  br label %concatenate.41.1.merge

concatenate.pivot.240.28:                         ; preds = %concatenate.pivot.240.
  %138 = icmp eq i64 %90, 0
  %139 = add nsw i32 %.zext, -240
  %140 = getelementptr double, ptr addrspace(1) %arg5123, i64 %91
  %141 = zext nneg i32 %139 to i64
  %142 = getelementptr inbounds double, ptr addrspace(1) %140, i64 %141
  %143 = load double, ptr addrspace(1) %142, align 8, !invariant.load !270
  %144 = getelementptr double, ptr addrspace(1) %arg26165, i64 %91
  %145 = getelementptr inbounds double, ptr addrspace(1) %144, i64 %141
  %146 = load double, ptr addrspace(1) %145, align 8, !invariant.load !270
  %147 = getelementptr double, ptr addrspace(1) %arg27167, i64 %91
  %148 = getelementptr inbounds double, ptr addrspace(1) %147, i64 %141
  %149 = load double, ptr addrspace(1) %148, align 8, !invariant.load !270
  %multiply.3008.17 = fmul double %149, %multiply.3002.1118
  %add.4171.15 = fadd double %146, %multiply.3008.17
  %150 = getelementptr double, ptr addrspace(1) %arg24161, i64 %91
  %151 = getelementptr inbounds double, ptr addrspace(1) %150, i64 %141
  %152 = load double, ptr addrspace(1) %151, align 8, !invariant.load !270
  %153 = getelementptr double, ptr addrspace(1) %arg25163, i64 %91
  %154 = getelementptr inbounds double, ptr addrspace(1) %153, i64 %141
  %155 = load double, ptr addrspace(1) %154, align 8, !invariant.load !270
  %add.4187.25 = fadd double %155, 6.000000e+00
  %multiply.3056.21 = fmul double %add.4187.25, 2.500000e-01
  %156 = fsub double %152, %multiply.3056.21
  %multiply.3057.13 = fmul double %multiply.3002.1118, %156
  %add.4221.11 = fadd double %add.4171.15, %multiply.3057.13
  %add.4236.3 = fadd double %143, %add.4221.11
  %157 = select i1 %138, double %add.4221.11, double %add.4236.3
  br label %concatenate.41.1.merge

concatenate.41.1.merge:                           ; preds = %concatenate.pivot.240.28, %concatenate.pivot.192.27, %concatenate.pivot.144.26, %concatenate.pivot.96.25, %concatenate.pivot.48.24, %concatenate.pivot.0.
  %158 = phi i64 [ %22, %concatenate.pivot.0. ], [ %41, %concatenate.pivot.48.24 ], [ %41, %concatenate.pivot.96.25 ], [ %102, %concatenate.pivot.144.26 ], [ %116, %concatenate.pivot.192.27 ], [ %116, %concatenate.pivot.240.28 ]
  %159 = phi double [ %33, %concatenate.pivot.0. ], [ %62, %concatenate.pivot.48.24 ], [ %85, %concatenate.pivot.96.25 ], [ %113, %concatenate.pivot.144.26 ], [ %137, %concatenate.pivot.192.27 ], [ %157, %concatenate.pivot.240.28 ]
  %160 = icmp ult i16 %.decomposed, 144
  br i1 %160, label %concatenate.pivot.48.100, label %concatenate.pivot.192.105

concatenate.pivot.48.100:                         ; preds = %concatenate.41.1.merge
  %161 = icmp ult i16 %.decomposed, 48
  br i1 %161, label %concatenate.pivot.0.101, label %concatenate.pivot.96.102

concatenate.pivot.0.101:                          ; preds = %concatenate.pivot.48.100
  %162 = mul nuw nsw i32 %.zext112, 48
  %163 = zext nneg i32 %162 to i64
  %164 = getelementptr double, ptr addrspace(1) %arg10133, i64 %163
  %165 = zext nneg i16 %.decomposed to i64
  %166 = getelementptr inbounds double, ptr addrspace(1) %164, i64 %165
  %167 = load double, ptr addrspace(1) %166, align 8, !invariant.load !270
  %168 = sitofp i64 %158 to double
  %multiply.3002.1131 = fmul double %168, 0x3F718590FECF82C5
  %169 = getelementptr double, ptr addrspace(1) %arg11135, i64 %163
  %170 = getelementptr inbounds double, ptr addrspace(1) %169, i64 %165
  %171 = load double, ptr addrspace(1) %170, align 8, !invariant.load !270
  %multiply.3003.1732 = fmul double %171, %multiply.3002.1131
  %add.4164.1533 = fadd double %167, %multiply.3003.1732
  %172 = getelementptr double, ptr addrspace(1) %arg8129, i64 %163
  %173 = getelementptr inbounds double, ptr addrspace(1) %172, i64 %165
  %174 = load double, ptr addrspace(1) %173, align 8, !invariant.load !270
  %175 = getelementptr double, ptr addrspace(1) %arg9131, i64 %163
  %176 = getelementptr inbounds double, ptr addrspace(1) %175, i64 %165
  %177 = load double, ptr addrspace(1) %176, align 8, !invariant.load !270
  %add.4206.1936 = fsub double %174, %177
  %multiply.3037.1337 = fmul double %multiply.3002.1131, %add.4206.1936
  %add.4207.1138 = fadd double %add.4164.1533, %multiply.3037.1337
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.96.102:                         ; preds = %concatenate.pivot.48.100
  %178 = icmp ult i16 %.decomposed, 96
  %179 = mul nuw nsw i32 %.zext112, 48
  %180 = zext nneg i32 %179 to i64
  %181 = sitofp i64 %158 to double
  %multiply.3002.1141 = fmul double %181, 0x3F718590FECF82C5
  br i1 %178, label %concatenate.pivot.48.103, label %concatenate.pivot.96.104

concatenate.pivot.48.103:                         ; preds = %concatenate.pivot.96.102
  %182 = add nsw i32 %.zext, -48
  %183 = getelementptr double, ptr addrspace(1) %arg14141, i64 %180
  %184 = zext nneg i32 %182 to i64
  %185 = getelementptr inbounds double, ptr addrspace(1) %183, i64 %184
  %186 = load double, ptr addrspace(1) %185, align 8, !invariant.load !270
  %187 = getelementptr double, ptr addrspace(1) %arg15143, i64 %180
  %188 = getelementptr inbounds double, ptr addrspace(1) %187, i64 %184
  %189 = load double, ptr addrspace(1) %188, align 8, !invariant.load !270
  %multiply.3004.1742 = fmul double %189, %multiply.3002.1141
  %add.4166.1543 = fadd double %186, %multiply.3004.1742
  %190 = getelementptr double, ptr addrspace(1) %arg13139, i64 %180
  %191 = getelementptr inbounds double, ptr addrspace(1) %190, i64 %184
  %192 = load double, ptr addrspace(1) %191, align 8, !invariant.load !270
  %193 = getelementptr double, ptr addrspace(1) %arg12137, i64 %180
  %194 = getelementptr inbounds double, ptr addrspace(1) %193, i64 %184
  %195 = load double, ptr addrspace(1) %194, align 8, !invariant.load !270
  %add.4192.2545 = fadd double %195, -1.000000e+00
  %multiply.3046.2147 = fmul double %add.4192.2545, 4.000000e+00
  %196 = fsub double %192, %multiply.3046.2147
  %multiply.3047.1349 = fmul double %multiply.3002.1141, %196
  %add.4211.1150 = fadd double %add.4166.1543, %multiply.3047.1349
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.96.104:                         ; preds = %concatenate.pivot.96.102
  %197 = add nsw i32 %.zext, -96
  %198 = getelementptr double, ptr addrspace(1) %arg6125, i64 %180
  %199 = zext nneg i32 %197 to i64
  %200 = getelementptr inbounds double, ptr addrspace(1) %198, i64 %199
  %201 = load double, ptr addrspace(1) %200, align 8, !invariant.load !270
  %202 = getelementptr double, ptr addrspace(1) %arg7127, i64 %180
  %203 = getelementptr inbounds double, ptr addrspace(1) %202, i64 %199
  %204 = load double, ptr addrspace(1) %203, align 8, !invariant.load !270
  %multiply.3005.1754 = fmul double %204, %multiply.3002.1141
  %add.4167.1555 = fadd double %201, %multiply.3005.1754
  %205 = getelementptr double, ptr addrspace(1) %arg29171, i64 %180
  %206 = getelementptr inbounds double, ptr addrspace(1) %205, i64 %199
  %207 = load double, ptr addrspace(1) %206, align 8, !invariant.load !270
  %208 = getelementptr double, ptr addrspace(1) %arg30173, i64 %180
  %209 = getelementptr inbounds double, ptr addrspace(1) %208, i64 %199
  %210 = load double, ptr addrspace(1) %209, align 8, !invariant.load !270
  %multiply.3049.556 = fmul double %207, %210
  %211 = getelementptr double, ptr addrspace(1) %arg28169, i64 %180
  %212 = getelementptr inbounds double, ptr addrspace(1) %211, i64 %199
  %213 = load double, ptr addrspace(1) %212, align 8, !invariant.load !270
  %add.4178.1158 = fadd double %213, 0xBFF62E42FEFA39EF
  %multiply.3050.760 = fmul double %add.4178.1158, 0x3FFC71C71C71C71C
  %214 = fsub double %multiply.3049.556, %multiply.3050.760
  %multiply.3051.1362 = fmul double %multiply.3002.1141, %214
  %add.4213.1163 = fadd double %add.4167.1555, %multiply.3051.1362
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.192.105:                        ; preds = %concatenate.41.1.merge
  %215 = icmp ult i16 %.decomposed, 192
  %216 = mul nuw nsw i32 %.zext112, 48
  %217 = zext nneg i32 %216 to i64
  br i1 %215, label %concatenate.pivot.144.106, label %concatenate.pivot.240.107

concatenate.pivot.144.106:                        ; preds = %concatenate.pivot.192.105
  %218 = add nsw i32 %.zext, -144
  %219 = getelementptr double, ptr addrspace(1) %arg18149, i64 %217
  %220 = zext nneg i32 %218 to i64
  %221 = getelementptr inbounds double, ptr addrspace(1) %219, i64 %220
  %222 = load double, ptr addrspace(1) %221, align 8, !invariant.load !270
  %223 = sitofp i64 %158 to double
  %multiply.3002.1166 = fmul double %223, 0x3F718590FECF82C5
  %224 = getelementptr double, ptr addrspace(1) %arg19151, i64 %217
  %225 = getelementptr inbounds double, ptr addrspace(1) %224, i64 %220
  %226 = load double, ptr addrspace(1) %225, align 8, !invariant.load !270
  %multiply.3006.1767 = fmul double %226, %multiply.3002.1166
  %add.4168.1568 = fadd double %222, %multiply.3006.1767
  %227 = getelementptr double, ptr addrspace(1) %arg16145, i64 %217
  %228 = getelementptr inbounds double, ptr addrspace(1) %227, i64 %220
  %229 = load double, ptr addrspace(1) %228, align 8, !invariant.load !270
  %230 = getelementptr double, ptr addrspace(1) %arg17147, i64 %217
  %231 = getelementptr inbounds double, ptr addrspace(1) %230, i64 %220
  %232 = load double, ptr addrspace(1) %231, align 8, !invariant.load !270
  %add.4197.2570 = fadd double %232, -1.000000e+00
  %add.4214.1972 = fsub double %229, %add.4197.2570
  %multiply.3053.1373 = fmul double %multiply.3002.1166, %add.4214.1972
  %add.4216.1174 = fadd double %add.4168.1568, %multiply.3053.1373
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.240.107:                        ; preds = %concatenate.pivot.192.105
  %233 = icmp ult i16 %.decomposed, 240
  %234 = sitofp i64 %158 to double
  %multiply.3002.1177 = fmul double %234, 0x3F718590FECF82C5
  br i1 %233, label %concatenate.pivot.192.108, label %concatenate.pivot.240.109

concatenate.pivot.192.108:                        ; preds = %concatenate.pivot.240.107
  %235 = add nsw i32 %.zext, -192
  %236 = getelementptr double, ptr addrspace(1) %arg22157, i64 %217
  %237 = zext nneg i32 %235 to i64
  %238 = getelementptr inbounds double, ptr addrspace(1) %236, i64 %237
  %239 = load double, ptr addrspace(1) %238, align 8, !invariant.load !270
  %240 = getelementptr double, ptr addrspace(1) %arg23159, i64 %217
  %241 = getelementptr inbounds double, ptr addrspace(1) %240, i64 %237
  %242 = load double, ptr addrspace(1) %241, align 8, !invariant.load !270
  %multiply.3007.1778 = fmul double %242, %multiply.3002.1177
  %add.4169.1579 = fadd double %239, %multiply.3007.1778
  %243 = getelementptr double, ptr addrspace(1) %arg20153, i64 %217
  %244 = getelementptr inbounds double, ptr addrspace(1) %243, i64 %237
  %245 = load double, ptr addrspace(1) %244, align 8, !invariant.load !270
  %246 = getelementptr double, ptr addrspace(1) %arg21155, i64 %217
  %247 = getelementptr inbounds double, ptr addrspace(1) %246, i64 %237
  %248 = load double, ptr addrspace(1) %247, align 8, !invariant.load !270
  %add.4174.2581 = fadd double %248, 4.000000e+00
  %multiply.3054.2183 = fmul double %add.4174.2581, 2.500000e-01
  %249 = fsub double %245, %multiply.3054.2183
  %multiply.3055.1385 = fmul double %multiply.3002.1177, %249
  %add.4218.1186 = fadd double %add.4169.1579, %multiply.3055.1385
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.240.109:                        ; preds = %concatenate.pivot.240.107
  %250 = add nsw i32 %.zext, -240
  %251 = getelementptr double, ptr addrspace(1) %arg26165, i64 %217
  %252 = zext nneg i32 %250 to i64
  %253 = getelementptr inbounds double, ptr addrspace(1) %251, i64 %252
  %254 = load double, ptr addrspace(1) %253, align 8, !invariant.load !270
  %255 = getelementptr double, ptr addrspace(1) %arg27167, i64 %217
  %256 = getelementptr inbounds double, ptr addrspace(1) %255, i64 %252
  %257 = load double, ptr addrspace(1) %256, align 8, !invariant.load !270
  %multiply.3008.1790 = fmul double %257, %multiply.3002.1177
  %add.4171.1591 = fadd double %254, %multiply.3008.1790
  %258 = getelementptr double, ptr addrspace(1) %arg24161, i64 %217
  %259 = getelementptr inbounds double, ptr addrspace(1) %258, i64 %252
  %260 = load double, ptr addrspace(1) %259, align 8, !invariant.load !270
  %261 = getelementptr double, ptr addrspace(1) %arg25163, i64 %217
  %262 = getelementptr inbounds double, ptr addrspace(1) %261, i64 %252
  %263 = load double, ptr addrspace(1) %262, align 8, !invariant.load !270
  %add.4187.2593 = fadd double %263, 6.000000e+00
  %multiply.3056.2195 = fmul double %add.4187.2593, 2.500000e-01
  %264 = fsub double %260, %multiply.3056.2195
  %multiply.3057.1397 = fmul double %multiply.3002.1177, %264
  %add.4221.1198 = fadd double %add.4171.1591, %multiply.3057.1397
  br label %concatenate.39.1.clone.1.merge

concatenate.39.1.clone.1.merge:                   ; preds = %concatenate.pivot.240.109, %concatenate.pivot.192.108, %concatenate.pivot.144.106, %concatenate.pivot.96.104, %concatenate.pivot.48.103, %concatenate.pivot.0.101
  %265 = phi double [ %add.4207.1138, %concatenate.pivot.0.101 ], [ %add.4211.1150, %concatenate.pivot.48.103 ], [ %add.4213.1163, %concatenate.pivot.96.104 ], [ %add.4216.1174, %concatenate.pivot.144.106 ], [ %add.4218.1186, %concatenate.pivot.192.108 ], [ %add.4221.1198, %concatenate.pivot.240.109 ]
  %266 = zext nneg i32 %linear_index to i64
  %267 = getelementptr double, ptr addrspace(1) %arg33179, i64 %266
  store double %159, ptr addrspace(1) %267, align 8
  %268 = getelementptr double, ptr addrspace(1) %arg34181, i64 %266
  store double %265, ptr addrspace(1) %268, align 8
  br label %loop_concatenate_fusion.in_bounds-after
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define void @loop_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(147456) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg1) local_unnamed_addr #9 {
entry:
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %1 = and i32 %0, 1
  %2 = lshr i32 %0, 1
  %3 = mul nuw nsw i32 %2, 144
  %4 = zext nneg i32 %1 to i64
  br label %reduce.56.1.inner.loop_body.reduction_dim.1

reduce.56.1.inner.loop_body.reduction_dim.1:      ; preds = %reduce.56.1.inner.loop_body.reduction_dim.1, %entry
  %accumulator_0.04 = phi double [ 0.000000e+00, %entry ], [ %add.3969.i.3, %reduce.56.1.inner.loop_body.reduction_dim.1 ]
  %reduce.56.1.inner.invar_address.reduction_dim.1.03 = phi i32 [ 0, %entry ], [ %invar.inc.3, %reduce.56.1.inner.loop_body.reduction_dim.1 ]
  %5 = add i32 %3, %reduce.56.1.inner.invar_address.reduction_dim.1.03
  %.frozen = freeze i32 %5
  %6 = udiv i32 %.frozen, 192
  %7 = mul i32 %6, 192
  %.decomposed = sub i32 %.frozen, %7
  %8 = zext nneg i32 %6 to i64
  %9 = zext nneg i32 %.decomposed to i64
  %10 = getelementptr inbounds [48 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg011, i64 0, i64 %8, i64 %9, i64 0, i64 %4
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %add.3969.i = fadd double %accumulator_0.04, %11
  %12 = add i32 %5, 1
  %.frozen5 = freeze i32 %12
  %13 = udiv i32 %.frozen5, 192
  %14 = mul i32 %13, 192
  %.decomposed6 = sub i32 %.frozen5, %14
  %15 = zext nneg i32 %13 to i64
  %16 = zext nneg i32 %.decomposed6 to i64
  %17 = getelementptr inbounds [48 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg011, i64 0, i64 %15, i64 %16, i64 0, i64 %4
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !270
  %add.3969.i.1 = fadd double %add.3969.i, %18
  %19 = add i32 %5, 2
  %.frozen7 = freeze i32 %19
  %20 = udiv i32 %.frozen7, 192
  %21 = mul i32 %20, 192
  %.decomposed8 = sub i32 %.frozen7, %21
  %22 = zext nneg i32 %20 to i64
  %23 = zext nneg i32 %.decomposed8 to i64
  %24 = getelementptr inbounds [48 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg011, i64 0, i64 %22, i64 %23, i64 0, i64 %4
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !270
  %add.3969.i.2 = fadd double %add.3969.i.1, %25
  %26 = add i32 %5, 3
  %.frozen9 = freeze i32 %26
  %27 = udiv i32 %.frozen9, 192
  %28 = mul i32 %27, 192
  %.decomposed10 = sub i32 %.frozen9, %28
  %29 = zext nneg i32 %27 to i64
  %30 = zext nneg i32 %.decomposed10 to i64
  %31 = getelementptr inbounds [48 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg011, i64 0, i64 %29, i64 %30, i64 0, i64 %4
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !270
  %add.3969.i.3 = fadd double %add.3969.i.2, %32
  %invar.inc.3 = add nuw nsw i32 %reduce.56.1.inner.invar_address.reduction_dim.1.03, 4
  %exitcond.3 = icmp eq i32 %invar.inc.3, 144
  br i1 %exitcond.3, label %reduce.56.1.inner.loop_exit.reduction_dim.1, label %reduce.56.1.inner.loop_body.reduction_dim.1

reduce.56.1.inner.loop_exit.reduction_dim.1:      ; preds = %reduce.56.1.inner.loop_body.reduction_dim.1
  %33 = zext nneg i32 %0 to i64
  %34 = getelementptr double, ptr addrspace(1) %arg113, i64 %33
  store double %add.3969.i.3, ptr addrspace(1) %34, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_select_fusion(ptr noalias nocapture align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture align 128 dereferenceable(768) %arg7, ptr noalias nocapture align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg10, ptr noalias nocapture align 128 dereferenceable(768) %arg11, ptr noalias nocapture align 128 dereferenceable(768) %arg12, ptr noalias nocapture align 128 dereferenceable(768) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg14) local_unnamed_addr #4 {
entry:
  %arg14168 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13166 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12164 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11162 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10160 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9158 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8156 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7154 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6152 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5150 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4148 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3146 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2144 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1142 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0140 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_3.234452 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg3146, i64 0, i64 %1
  %param_6.117254 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg6152, i64 0, i64 %1
  %param_5.145056 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg5150, i64 0, i64 %1
  %param_4.176458 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg4148, i64 0, i64 %1
  %param_10.152079 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg10160, i64 0, i64 %1
  %2 = zext nneg i32 %thread.id.2 to i64
  %param_2.260542 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg2144, i64 0, i64 %1, i64 %2
  %param_2.260543 = load double, ptr addrspace(1) %param_2.260542, align 8, !invariant.load !270
  %multiply.3019.5.clone.146 = fmul double %param_2.260543, %param_2.260543
  %add.4183.5.clone.148 = fadd double %multiply.3019.5.clone.146, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.150 = fmul double %add.4183.5.clone.148, 5.000000e-01
  %3 = fsub double 0.000000e+00, %multiply.3020.3.clone.150
  %param_3.234453 = load i64, ptr addrspace(1) %param_3.234452, align 8, !invariant.load !270
  %param_6.117255 = load i64, ptr addrspace(1) %param_6.117254, align 8, !invariant.load !270
  %4 = icmp sge i64 %param_3.234453, %param_6.117255
  %param_5.145057 = load i8, ptr addrspace(1) %param_5.145056, align 1, !invariant.load !270
  %param_4.176459 = load i8, ptr addrspace(1) %param_4.176458, align 1, !invariant.load !270
  %5 = or i8 %param_4.176459, %param_5.145057
  %6 = trunc i8 %5 to i1
  %.not123 = or i1 %4, %6
  %7 = icmp eq i64 %param_3.234453, 0
  %param_0.144464 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg0140, i64 0, i64 %1, i64 %2
  %param_0.144465 = load double, ptr addrspace(1) %param_0.144464, align 8
  %param_1.337566 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg1142, i64 0, i64 %1, i64 %2
  %param_1.337567 = load double, ptr addrspace(1) %param_1.337566, align 8, !invariant.load !270
  %add.4206.772 = fsub double %param_1.337567, %param_2.260543
  %8 = select i1 %7, double %add.4206.772, double %param_0.144465
  %9 = select i1 %.not123, double %param_0.144465, double %8
  %param_7.203475 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg7154, i64 0, i64 %1, i64 %2
  %param_7.203476 = load double, ptr addrspace(1) %param_7.203475, align 8
  %param_8.185877 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg8156, i64 0, i64 %1, i64 %2
  %param_8.185878 = load double, ptr addrspace(1) %param_8.185877, align 8
  %param_10.152080 = load i64, ptr addrspace(1) %param_10.152079, align 8, !invariant.load !270
  %10 = sitofp i64 %param_10.152080 to double
  %multiply.3002.25.clone.182 = fmul double %10, 0x3F718590FECF82C5
  %param_9.166783 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg9158, i64 0, i64 %1, i64 %2
  %param_9.166784 = load double, ptr addrspace(1) %param_9.166783, align 8, !invariant.load !270
  %multiply.3003.9.clone.185 = fmul double %param_9.166784, %multiply.3002.25.clone.182
  %add.4164.7.clone.186 = fadd double %param_8.185878, %multiply.3003.9.clone.185
  %multiply.3037.5.clone.187 = fmul double %add.4206.772, %multiply.3002.25.clone.182
  %add.4207.3.clone.188 = fadd double %multiply.3037.5.clone.187, %add.4164.7.clone.186
  %11 = select i1 %7, double %add.4207.3.clone.188, double %param_7.203476
  %12 = select i1 %.not123, double %param_7.203476, double %11
  %param_11.133291 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg11162, i64 0, i64 %1, i64 %2
  %param_11.133292 = load double, ptr addrspace(1) %param_11.133291, align 8
  %add.4229.5.clone.193 = fadd double %param_11.133292, %add.4207.3.clone.188
  %13 = select i1 %7, double %add.4207.3.clone.188, double %add.4229.5.clone.193
  %14 = select i1 %.not123, double %param_11.133292, double %13
  %15 = select i1 %.not123, double %param_8.185878, double %add.4207.3.clone.188
  %param_12.129298 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg12164, i64 0, i64 %1, i64 %2
  %param_12.129299 = load double, ptr addrspace(1) %param_12.129298, align 8
  %16 = select i1 %7, double %param_2.260543, double %param_12.129299
  %17 = select i1 %.not123, double %param_12.129299, double %16
  %param_13.1208106 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg13166, i64 0, i64 %1, i64 %2
  %param_13.1208107 = load double, ptr addrspace(1) %param_13.1208106, align 8
  %18 = select i1 %.not123, double %param_13.1208107, double %param_2.260543
  store double %9, ptr addrspace(1) %param_0.144464, align 8
  store double %12, ptr addrspace(1) %param_7.203475, align 8
  store double %14, ptr addrspace(1) %param_11.133291, align 8
  store double %15, ptr addrspace(1) %param_8.185877, align 8
  store double %17, ptr addrspace(1) %param_12.129298, align 8
  store double %18, ptr addrspace(1) %param_13.1208106, align 8
  %19 = or i32 %thread.id.x, 32
  %20 = icmp ult i32 %19, 48
  br i1 %20, label %x_in_tile-true.1, label %x_in_tile-after.15

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

x_in_tile-true.1:                                 ; preds = %entry
  %21 = icmp eq i64 %param_3.234453, 0
  %22 = zext nneg i32 %19 to i64
  %param_2.260542.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg2144, i64 0, i64 %1, i64 %22
  %param_2.260543.1 = load double, ptr addrspace(1) %param_2.260542.1, align 8, !invariant.load !270
  %multiply.3019.5.clone.146.1 = fmul double %param_2.260543.1, %param_2.260543.1
  %add.4183.5.clone.148.1 = fadd double %multiply.3019.5.clone.146.1, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.150.1 = fmul double %add.4183.5.clone.148.1, 5.000000e-01
  %23 = fsub double %3, %multiply.3020.3.clone.150.1
  %param_0.144464.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg0140, i64 0, i64 %1, i64 %22
  %param_0.144465.1 = load double, ptr addrspace(1) %param_0.144464.1, align 8
  %param_1.337566.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg1142, i64 0, i64 %1, i64 %22
  %param_1.337567.1 = load double, ptr addrspace(1) %param_1.337566.1, align 8, !invariant.load !270
  %add.4206.772.1 = fsub double %param_1.337567.1, %param_2.260543.1
  %24 = select i1 %21, double %add.4206.772.1, double %param_0.144465.1
  %25 = select i1 %.not123, double %param_0.144465.1, double %24
  %param_7.203475.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg7154, i64 0, i64 %1, i64 %22
  %param_7.203476.1 = load double, ptr addrspace(1) %param_7.203475.1, align 8
  %param_8.185877.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg8156, i64 0, i64 %1, i64 %22
  %param_8.185878.1 = load double, ptr addrspace(1) %param_8.185877.1, align 8
  %param_9.166783.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg9158, i64 0, i64 %1, i64 %22
  %param_9.166784.1 = load double, ptr addrspace(1) %param_9.166783.1, align 8, !invariant.load !270
  %multiply.3003.9.clone.185.1 = fmul double %param_9.166784.1, %multiply.3002.25.clone.182
  %add.4164.7.clone.186.1 = fadd double %param_8.185878.1, %multiply.3003.9.clone.185.1
  %multiply.3037.5.clone.187.1 = fmul double %add.4206.772.1, %multiply.3002.25.clone.182
  %add.4207.3.clone.188.1 = fadd double %multiply.3037.5.clone.187.1, %add.4164.7.clone.186.1
  %26 = select i1 %21, double %add.4207.3.clone.188.1, double %param_7.203476.1
  %27 = select i1 %.not123, double %param_7.203476.1, double %26
  %param_11.133291.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg11162, i64 0, i64 %1, i64 %22
  %param_11.133292.1 = load double, ptr addrspace(1) %param_11.133291.1, align 8
  %add.4229.5.clone.193.1 = fadd double %param_11.133292.1, %add.4207.3.clone.188.1
  %28 = select i1 %21, double %add.4207.3.clone.188.1, double %add.4229.5.clone.193.1
  %29 = select i1 %.not123, double %param_11.133292.1, double %28
  %30 = select i1 %.not123, double %param_8.185878.1, double %add.4207.3.clone.188.1
  %param_12.129298.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg12164, i64 0, i64 %1, i64 %22
  %param_12.129299.1 = load double, ptr addrspace(1) %param_12.129298.1, align 8
  %31 = select i1 %21, double %param_2.260543.1, double %param_12.129299.1
  %32 = select i1 %.not123, double %param_12.129299.1, double %31
  %param_13.1208106.1 = getelementptr inbounds [2 x [48 x double]], ptr addrspace(1) %arg13166, i64 0, i64 %1, i64 %22
  %param_13.1208107.1 = load double, ptr addrspace(1) %param_13.1208106.1, align 8
  %33 = select i1 %.not123, double %param_13.1208107.1, double %param_2.260543.1
  store double %25, ptr addrspace(1) %param_0.144464.1, align 8
  store double %27, ptr addrspace(1) %param_7.203475.1, align 8
  store double %29, ptr addrspace(1) %param_11.133291.1, align 8
  store double %30, ptr addrspace(1) %param_8.185877.1, align 8
  store double %32, ptr addrspace(1) %param_12.129298.1, align 8
  store double %33, ptr addrspace(1) %param_13.1208106.1, align 8
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.1, %entry
  %partial_reduction_result.2.1 = phi double [ %23, %x_in_tile-true.1 ], [ %3, %entry ]
  %34 = bitcast double %partial_reduction_result.2.1 to <2 x i32>
  %35 = extractelement <2 x i32> %34, i64 0
  %36 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %35, i32 16, i32 31)
  %37 = insertelement <2 x i32> poison, i32 %36, i64 0
  %38 = extractelement <2 x i32> %34, i64 1
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 16, i32 31)
  %40 = insertelement <2 x i32> %37, i32 %39, i64 1
  %41 = bitcast <2 x i32> %40 to double
  %add.3969.i = fadd double %partial_reduction_result.2.1, %41
  %42 = bitcast double %add.3969.i to <2 x i32>
  %43 = extractelement <2 x i32> %42, i64 0
  %44 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 8, i32 31)
  %45 = insertelement <2 x i32> poison, i32 %44, i64 0
  %46 = extractelement <2 x i32> %42, i64 1
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 8, i32 31)
  %48 = insertelement <2 x i32> %45, i32 %47, i64 1
  %49 = bitcast <2 x i32> %48 to double
  %add.3969.i131 = fadd double %add.3969.i, %49
  %50 = bitcast double %add.3969.i131 to <2 x i32>
  %51 = extractelement <2 x i32> %50, i64 0
  %52 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %51, i32 4, i32 31)
  %53 = insertelement <2 x i32> poison, i32 %52, i64 0
  %54 = extractelement <2 x i32> %50, i64 1
  %55 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %54, i32 4, i32 31)
  %56 = insertelement <2 x i32> %53, i32 %55, i64 1
  %57 = bitcast <2 x i32> %56 to double
  %add.3969.i132 = fadd double %add.3969.i131, %57
  %58 = bitcast double %add.3969.i132 to <2 x i32>
  %59 = extractelement <2 x i32> %58, i64 0
  %60 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %59, i32 2, i32 31)
  %61 = insertelement <2 x i32> poison, i32 %60, i64 0
  %62 = extractelement <2 x i32> %58, i64 1
  %63 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %62, i32 2, i32 31)
  %64 = insertelement <2 x i32> %61, i32 %63, i64 1
  %65 = bitcast <2 x i32> %64 to double
  %add.3969.i133 = fadd double %add.3969.i132, %65
  %66 = bitcast double %add.3969.i133 to <2 x i32>
  %67 = extractelement <2 x i32> %66, i64 0
  %68 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %67, i32 1, i32 31)
  %69 = extractelement <2 x i32> %66, i64 1
  %70 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %69, i32 1, i32 31)
  %71 = icmp eq i32 %thread.id.2, 0
  %72 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache9, i64 0, i64 %1, i64 0
  %73 = insertelement <2 x i32> poison, i32 %68, i64 0
  %74 = insertelement <2 x i32> %73, i32 %70, i64 1
  %75 = bitcast <2 x i32> %74 to double
  %add.3969.i134 = fadd double %add.3969.i133, %75
  br i1 %71, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %76 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg14168, i64 0, i64 %1
  br i1 %76, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store double %add.3969.i134, ptr addrspace(3) %72, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %72, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define void @loop_add_compare_convert_select_fusion(ptr noalias nocapture align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture align 128 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture align 128 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg9, ptr noalias nocapture align 128 dereferenceable(16) %arg10, ptr noalias nocapture align 128 dereferenceable(16) %arg11, ptr noalias nocapture align 128 dereferenceable(16) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg19, ptr noalias nocapture align 128 dereferenceable(8) %arg20, ptr noalias nocapture align 128 dereferenceable(8) %arg21, ptr noalias nocapture align 128 dereferenceable(16) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg27) local_unnamed_addr #9 {
entry:
  %arg27170 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26168 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25166 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24164 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23162 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22160 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21158 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20156 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19154 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18152 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17150 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16148 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15146 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14144 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13142 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12140 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11138 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10136 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9134 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8132 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7130 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6128 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5126 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4124 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3122 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2120 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0116 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg1118, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = getelementptr i64, ptr addrspace(1) %arg4124, i64 %1
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !270
  %6 = getelementptr i8, ptr addrspace(1) %arg3122, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !270
  %8 = getelementptr i8, ptr addrspace(1) %arg2120, i64 %1
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !270
  %10 = getelementptr inbounds [2 x [2 x i32]], ptr addrspace(1) %arg9134, i64 0, i64 %1, i64 0
  %11 = load <2 x i32>, ptr addrspace(1) %10, align 8, !invariant.load !270
  %12 = extractelement <2 x i32> %11, i32 0
  %13 = extractelement <2 x i32> %11, i32 1
  %14 = getelementptr double, ptr addrspace(1) %arg8132, i64 %1
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !270
  %16 = getelementptr double, ptr addrspace(1) %arg18152, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !270
  %18 = getelementptr double, ptr addrspace(1) %arg19154, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !270
  %20 = getelementptr double, ptr addrspace(1) %arg17150, i64 %1
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !270
  %22 = getelementptr double, ptr addrspace(1) %arg16148, i64 %1
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !270
  %24 = getelementptr double, ptr addrspace(1) %arg15146, i64 %1
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !270
  %26 = getelementptr double, ptr addrspace(1) %arg14144, i64 %1
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !270
  %28 = shl nuw nsw i64 %1, 3
  %29 = add nuw nsw i64 %28, 64
  %scevgep = getelementptr i8, ptr addrspace(1) %arg13142, i64 %29
  br label %reduce.44.1.clone.1.inner.loop_body.reduction_dim.0

reduce.44.1.clone.1.inner.loop_body.reduction_dim.0: ; preds = %reduce.44.1.clone.1.inner.loop_body.reduction_dim.0, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %reduce.44.1.clone.1.inner.loop_body.reduction_dim.0 ], [ 0, %entry ]
  %accumulator_0.0115 = phi double [ 0.000000e+00, %entry ], [ %add.3969.i.7, %reduce.44.1.clone.1.inner.loop_body.reduction_dim.0 ]
  %scevgep180 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %lsr.iv
  %scevgep181 = getelementptr i8, ptr addrspace(1) %scevgep180, i64 -64
  %30 = load double, ptr addrspace(1) %scevgep181, align 8, !invariant.load !270
  %add.3969.i = fadd double %accumulator_0.0115, %30
  %scevgep184 = getelementptr i8, ptr addrspace(1) %scevgep180, i64 -48
  %31 = load double, ptr addrspace(1) %scevgep184, align 8, !invariant.load !270
  %add.3969.i.1 = fadd double %add.3969.i, %31
  %scevgep186 = getelementptr i8, ptr addrspace(1) %scevgep180, i64 -32
  %32 = load double, ptr addrspace(1) %scevgep186, align 8, !invariant.load !270
  %add.3969.i.2 = fadd double %add.3969.i.1, %32
  %scevgep187 = getelementptr i8, ptr addrspace(1) %scevgep180, i64 -16
  %33 = load double, ptr addrspace(1) %scevgep187, align 8, !invariant.load !270
  %add.3969.i.3 = fadd double %add.3969.i.2, %33
  %34 = load double, ptr addrspace(1) %scevgep180, align 8, !invariant.load !270
  %add.3969.i.4 = fadd double %add.3969.i.3, %34
  %scevgep190 = getelementptr i8, ptr addrspace(1) %scevgep180, i64 16
  %35 = load double, ptr addrspace(1) %scevgep190, align 8, !invariant.load !270
  %add.3969.i.5 = fadd double %add.3969.i.4, %35
  %scevgep189 = getelementptr i8, ptr addrspace(1) %scevgep180, i64 32
  %36 = load double, ptr addrspace(1) %scevgep189, align 8, !invariant.load !270
  %add.3969.i.6 = fadd double %add.3969.i.5, %36
  %scevgep183 = getelementptr i8, ptr addrspace(1) %scevgep180, i64 48
  %37 = load double, ptr addrspace(1) %scevgep183, align 8, !invariant.load !270
  %add.3969.i.7 = fadd double %add.3969.i.6, %37
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 128
  %tmp = trunc i64 %lsr.iv.next to i32
  %exitcond.7 = icmp eq i32 %tmp, 1024
  br i1 %exitcond.7, label %reduce.44.1.clone.1.inner.loop_exit.reduction_dim.0, label %reduce.44.1.clone.1.inner.loop_body.reduction_dim.0

reduce.44.1.clone.1.inner.loop_exit.reduction_dim.0: ; preds = %reduce.44.1.clone.1.inner.loop_body.reduction_dim.0
  %add.4181.1.clone.1 = fadd double %17, %19
  %add.4184.1.clone.1 = fadd double %add.4181.1.clone.1, %21
  %add.4189.1.clone.1 = fadd double %add.4184.1.clone.1, %23
  %add.4194.1.clone.1 = fadd double %add.4189.1.clone.1, %25
  %add.4199.1.clone.1 = fadd double %add.4194.1.clone.1, %27
  %add.4203.1.clone.1 = fadd double %add.4199.1.clone.1, %add.3969.i.7
  %38 = getelementptr double, ptr addrspace(1) %arg6128, i64 %1
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !270
  %multiply.3059.9.clone.1 = fmul double %39, 5.000000e-01
  %add.4222.9.clone.1 = fsub double %multiply.3059.9.clone.1, %add.4203.1.clone.1
  %subtract.230.5.clone.1 = fsub double %15, %add.4222.9.clone.1
  %compare.1155.5.clone.1 = fcmp uno double %subtract.230.5.clone.1, 0.000000e+00
  %40 = select i1 %compare.1155.5.clone.1, double 0xFFF0000000000000, double %subtract.230.5.clone.1
  %41 = getelementptr double, ptr addrspace(1) %arg7130, i64 %1
  %42 = load double, ptr addrspace(1) %41, align 8
  %subtract.231.7.clone.1 = fsub double %40, %42
  %43 = fneg double %subtract.231.7.clone.1
  %44 = tail call double @llvm.fma.f64(double %43, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %45 = tail call i32 @llvm.nvvm.d2i.lo(double %44) #13
  %46 = tail call double @llvm.nvvm.add.rn.d(double %44, double 0xC338000000000000) #13
  %47 = tail call double @llvm.fma.f64(double %46, double 0xBFE62E42FEFA39EF, double %43)
  %48 = tail call double @llvm.fma.f64(double %46, double 0xBC7ABC9E3B39803F, double %47)
  %49 = tail call double @llvm.fma.f64(double %48, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %50 = tail call double @llvm.fma.f64(double %49, double %48, double 0x3EC71DEE62401315)
  %51 = tail call double @llvm.fma.f64(double %50, double %48, double 0x3EFA01997C89EB71)
  %52 = tail call double @llvm.fma.f64(double %51, double %48, double 0x3F2A01A014761F65)
  %53 = tail call double @llvm.fma.f64(double %52, double %48, double 0x3F56C16C1852B7AF)
  %54 = tail call double @llvm.fma.f64(double %53, double %48, double 0x3F81111111122322)
  %55 = tail call double @llvm.fma.f64(double %54, double %48, double 0x3FA55555555502A1)
  %56 = tail call double @llvm.fma.f64(double %55, double %48, double 0x3FC5555555555511)
  %57 = tail call double @llvm.fma.f64(double %56, double %48, double 0x3FE000000000000B)
  %58 = tail call double @llvm.fma.f64(double %57, double %48, double 1.000000e+00)
  %59 = tail call double @llvm.fma.f64(double %58, double %48, double 1.000000e+00)
  %60 = tail call i32 @llvm.nvvm.d2i.lo(double %59) #13
  %61 = tail call i32 @llvm.nvvm.d2i.hi(double %59) #13
  %62 = shl i32 %45, 20
  %63 = add i32 %61, %62
  %64 = tail call double @llvm.nvvm.lohi.i2d(i32 %60, i32 %63) #13
  %65 = tail call i32 @llvm.nvvm.d2i.hi(double %43) #13
  %66 = bitcast i32 %65 to float
  %67 = tail call float @llvm.nvvm.fabs.f(float %66) #13
  %68 = fcmp olt float %67, 0x4010C46560000000
  br i1 %68, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %reduce.44.1.clone.1.inner.loop_exit.reduction_dim.0
  %69 = fcmp ogt double %subtract.231.7.clone.1, 0.000000e+00
  %70 = fsub double 0x7FF0000000000000, %subtract.231.7.clone.1
  %z.0.i = select i1 %69, double 0.000000e+00, double %70
  %71 = fcmp olt float %67, 0x4010E90000000000
  br i1 %71, label %72, label %__nv_exp.exit

72:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %73 = sdiv i32 %45, 2
  %74 = shl i32 %73, 20
  %75 = add i32 %61, %74
  %76 = tail call double @llvm.nvvm.lohi.i2d(i32 %60, i32 %75) #13
  %77 = sub nsw i32 %45, %73
  %78 = shl i32 %77, 20
  %79 = add nsw i32 %78, 1072693248
  %80 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %79) #13
  %81 = fmul double %80, %76
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %reduce.44.1.clone.1.inner.loop_exit.reduction_dim.0, %__internal_fast_icmp_abs_lt.exit.i, %72
  %z.2.i = phi double [ %64, %reduce.44.1.clone.1.inner.loop_exit.reduction_dim.0 ], [ %81, %72 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %82 = getelementptr double, ptr addrspace(1) %arg0116, i64 %1
  %83 = load double, ptr addrspace(1) %82, align 8
  %84 = getelementptr double, ptr addrspace(1) %arg5126, i64 %1
  %85 = load double, ptr addrspace(1) %84, align 8
  %subtract.232.1.clone.1 = fsub double %42, %40
  %86 = tail call double @llvm.fabs.f64(double %subtract.232.1.clone.1)
  %87 = fneg double %86
  %88 = tail call double @llvm.fma.f64(double %87, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %89 = tail call i32 @llvm.nvvm.d2i.lo(double %88) #13
  %90 = tail call double @llvm.nvvm.add.rn.d(double %88, double 0xC338000000000000) #13
  %91 = tail call double @llvm.fma.f64(double %90, double 0xBFE62E42FEFA39EF, double %87)
  %92 = tail call double @llvm.fma.f64(double %90, double 0xBC7ABC9E3B39803F, double %91)
  %93 = tail call double @llvm.fma.f64(double %92, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %94 = tail call double @llvm.fma.f64(double %93, double %92, double 0x3EC71DEE62401315)
  %95 = tail call double @llvm.fma.f64(double %94, double %92, double 0x3EFA01997C89EB71)
  %96 = tail call double @llvm.fma.f64(double %95, double %92, double 0x3F2A01A014761F65)
  %97 = tail call double @llvm.fma.f64(double %96, double %92, double 0x3F56C16C1852B7AF)
  %98 = tail call double @llvm.fma.f64(double %97, double %92, double 0x3F81111111122322)
  %99 = tail call double @llvm.fma.f64(double %98, double %92, double 0x3FA55555555502A1)
  %100 = tail call double @llvm.fma.f64(double %99, double %92, double 0x3FC5555555555511)
  %101 = tail call double @llvm.fma.f64(double %100, double %92, double 0x3FE000000000000B)
  %102 = tail call double @llvm.fma.f64(double %101, double %92, double 1.000000e+00)
  %103 = tail call double @llvm.fma.f64(double %102, double %92, double 1.000000e+00)
  %104 = tail call i32 @llvm.nvvm.d2i.lo(double %103) #13
  %105 = tail call i32 @llvm.nvvm.d2i.hi(double %103) #13
  %106 = shl i32 %89, 20
  %107 = add i32 %105, %106
  %108 = tail call double @llvm.nvvm.lohi.i2d(i32 %104, i32 %107) #13
  %109 = tail call i32 @llvm.nvvm.d2i.hi(double %87) #13
  %110 = bitcast i32 %109 to float
  %111 = tail call float @llvm.nvvm.fabs.f(float %110) #13
  %112 = fcmp olt float %111, 0x4010C46560000000
  br i1 %112, label %__nv_exp.exit106, label %__internal_fast_icmp_abs_lt.exit.i103

__internal_fast_icmp_abs_lt.exit.i103:            ; preds = %__nv_exp.exit
  %113 = fcmp one double %subtract.232.1.clone.1, 0.000000e+00
  %114 = fsub double 0x7FF0000000000000, %86
  %z.0.i104 = select i1 %113, double 0.000000e+00, double %114
  %115 = fcmp olt float %111, 0x4010E90000000000
  br i1 %115, label %116, label %__nv_exp.exit106

116:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i103
  %117 = sdiv i32 %89, 2
  %118 = shl i32 %117, 20
  %119 = add i32 %105, %118
  %120 = tail call double @llvm.nvvm.lohi.i2d(i32 %104, i32 %119) #13
  %121 = sub nsw i32 %89, %117
  %122 = shl i32 %121, 20
  %123 = add nsw i32 %122, 1072693248
  %124 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %123) #13
  %125 = fmul double %124, %120
  br label %__nv_exp.exit106

__nv_exp.exit106:                                 ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i103, %116
  %z.2.i105 = phi double [ %108, %__nv_exp.exit ], [ %125, %116 ], [ %z.0.i104, %__internal_fast_icmp_abs_lt.exit.i103 ]
  %126 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i105) #13
  %127 = bitcast i32 %126 to float
  %128 = fcmp olt float %127, 0x3FFCAAAAA0000000
  %129 = fcmp ogt float %127, 0xBFFB333320000000
  %or.cond.i = and i1 %128, %129
  br i1 %or.cond.i, label %130, label %147

130:                                              ; preds = %__nv_exp.exit106
  %131 = fadd double %z.2.i105, 2.000000e+00
  %132 = fdiv double %z.2.i105, %131
  %133 = fneg double %z.2.i105
  %134 = fmul double %132, %133
  %135 = fadd double %z.2.i105, %134
  %136 = fmul double %135, %135
  %137 = tail call double @llvm.fma.f64(double %136, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %138 = tail call double @llvm.fma.f64(double %137, double %136, double 0x3EF3B9FF890F468C)
  %139 = tail call double @llvm.fma.f64(double %138, double %136, double 0x3F17457EFD51BAF8)
  %140 = tail call double @llvm.fma.f64(double %139, double %136, double 0x3F3C71C8DE3CE825)
  %141 = tail call double @llvm.fma.f64(double %140, double %136, double 0x3F6249248FA4661F)
  %142 = tail call double @llvm.fma.f64(double %141, double %136, double 0x3F899999999D70C4)
  %143 = tail call double @llvm.fma.f64(double %142, double %136, double 0x3FB5555555555462)
  %144 = fmul double %136, %143
  %145 = tail call double @llvm.fma.f64(double %144, double %135, double %134)
  %146 = fadd double %z.2.i105, %145
  br label %__nv_log1p.exit

147:                                              ; preds = %__nv_exp.exit106
  %148 = fadd double %z.2.i105, 1.000000e+00
  %149 = tail call i32 @llvm.nvvm.d2i.hi(double %148) #13
  %150 = tail call i32 @llvm.nvvm.d2i.lo(double %148) #13
  %151 = icmp slt i32 %149, 1048576
  %152 = fmul double %148, 0x4350000000000000
  %153 = tail call i32 @llvm.nvvm.d2i.lo(double %152) #13
  %154 = tail call i32 @llvm.nvvm.d2i.hi(double %152) #13
  br i1 %151, label %155, label %156

155:                                              ; preds = %147
  br label %156

156:                                              ; preds = %155, %147
  %.0.i = phi double [ %152, %155 ], [ %148, %147 ]
  %ihi.i.0.i = phi i32 [ %154, %155 ], [ %149, %147 ]
  %ilo.i.0.i = phi i32 [ %153, %155 ], [ %150, %147 ]
  %e.i.0.i = phi i32 [ -1077, %155 ], [ -1023, %147 ]
  %157 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %157, 2146435071
  br i1 %or.cond2.i, label %158, label %205

158:                                              ; preds = %156
  %159 = lshr i32 %ihi.i.0.i, 20
  %160 = add nsw i32 %e.i.0.i, %159
  %161 = and i32 %ihi.i.0.i, 1048575
  %162 = or disjoint i32 %161, 1072693248
  %163 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %162) #13
  %164 = icmp ugt i32 %162, 1073127582
  %165 = tail call i32 @llvm.nvvm.d2i.lo(double %163) #13
  %166 = tail call i32 @llvm.nvvm.d2i.hi(double %163) #13
  %167 = add i32 %166, -1048576
  %168 = tail call double @llvm.nvvm.lohi.i2d(i32 %165, i32 %167) #13
  %spec.select = select i1 %164, double %168, double %163
  %169 = zext i1 %164 to i32
  %spec.select111 = add nsw i32 %160, %169
  %170 = fadd double %spec.select, -1.000000e+00
  %171 = fadd double %spec.select, 1.000000e+00
  %172 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %171) #13
  %173 = fneg double %171
  %174 = tail call double @llvm.fma.f64(double %173, double %172, double 1.000000e+00)
  %175 = tail call double @llvm.fma.f64(double %174, double %174, double %174)
  %176 = tail call double @llvm.fma.f64(double %175, double %172, double %172)
  %177 = fmul double %170, %176
  %178 = fadd double %177, %177
  %179 = fmul double %178, %178
  %180 = tail call double @llvm.fma.f64(double %179, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %181 = tail call double @llvm.fma.f64(double %180, double %179, double 0x3EF3B2669F02676F)
  %182 = tail call double @llvm.fma.f64(double %181, double %179, double 0x3F1745CBA9AB0956)
  %183 = tail call double @llvm.fma.f64(double %182, double %179, double 0x3F3C71C72D1B5154)
  %184 = tail call double @llvm.fma.f64(double %183, double %179, double 0x3F624924923BE72D)
  %185 = tail call double @llvm.fma.f64(double %184, double %179, double 0x3F8999999999A3C4)
  %186 = tail call double @llvm.fma.f64(double %185, double %179, double 0x3FB5555555555554)
  %187 = fsub double %170, %178
  %188 = fmul double %187, 2.000000e+00
  %189 = fneg double %178
  %190 = tail call double @llvm.fma.f64(double %189, double %170, double %188)
  %191 = fmul double %176, %190
  %192 = fmul double %179, %186
  %193 = tail call double @llvm.fma.f64(double %192, double %178, double %191)
  %194 = xor i32 %spec.select111, -2147483648
  %195 = tail call double @llvm.nvvm.lohi.i2d(i32 %194, i32 1127219200) #13
  %196 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %197 = fsub double %195, %196
  %198 = tail call double @llvm.fma.f64(double %197, double 0x3FE62E42FEFA39EF, double %178)
  %199 = fneg double %197
  %200 = tail call double @llvm.fma.f64(double %199, double 0x3FE62E42FEFA39EF, double %198)
  %201 = fsub double %200, %178
  %202 = fsub double %193, %201
  %203 = tail call double @llvm.fma.f64(double %197, double 0x3C7ABC9E3B39803F, double %202)
  %204 = fadd double %198, %203
  br label %__nv_log1p.exit

205:                                              ; preds = %156
  %206 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %207 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %208 = and i32 %207, 2147483647
  %209 = icmp eq i32 %208, 0
  %q.i.0.i = select i1 %209, double 0xFFF0000000000000, double %206
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %130, %158, %205
  %t.0.i = phi double [ %146, %130 ], [ %204, %158 ], [ %q.i.0.i, %205 ]
  %210 = getelementptr double, ptr addrspace(1) %arg10136, i64 %1
  %211 = load double, ptr addrspace(1) %210, align 8
  %212 = getelementptr double, ptr addrspace(1) %arg11138, i64 %1
  %213 = load double, ptr addrspace(1) %212, align 8
  %214 = getelementptr double, ptr addrspace(1) %arg12140, i64 %1
  %215 = load double, ptr addrspace(1) %214, align 8
  %216 = fcmp ole double %40, 0.000000e+00
  %minimum.8.3.clone.1 = select i1 %216, double %40, double 0.000000e+00
  %subtract.233.1.clone.1 = fsub double %215, %minimum.8.3.clone.1
  %217 = tail call double @llvm.fabs.f64(double %subtract.233.1.clone.1)
  %218 = fneg double %217
  %219 = tail call double @llvm.fma.f64(double %218, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %220 = tail call i32 @llvm.nvvm.d2i.lo(double %219) #13
  %221 = tail call double @llvm.nvvm.add.rn.d(double %219, double 0xC338000000000000) #13
  %222 = tail call double @llvm.fma.f64(double %221, double 0xBFE62E42FEFA39EF, double %218)
  %223 = tail call double @llvm.fma.f64(double %221, double 0xBC7ABC9E3B39803F, double %222)
  %224 = tail call double @llvm.fma.f64(double %223, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %225 = tail call double @llvm.fma.f64(double %224, double %223, double 0x3EC71DEE62401315)
  %226 = tail call double @llvm.fma.f64(double %225, double %223, double 0x3EFA01997C89EB71)
  %227 = tail call double @llvm.fma.f64(double %226, double %223, double 0x3F2A01A014761F65)
  %228 = tail call double @llvm.fma.f64(double %227, double %223, double 0x3F56C16C1852B7AF)
  %229 = tail call double @llvm.fma.f64(double %228, double %223, double 0x3F81111111122322)
  %230 = tail call double @llvm.fma.f64(double %229, double %223, double 0x3FA55555555502A1)
  %231 = tail call double @llvm.fma.f64(double %230, double %223, double 0x3FC5555555555511)
  %232 = tail call double @llvm.fma.f64(double %231, double %223, double 0x3FE000000000000B)
  %233 = tail call double @llvm.fma.f64(double %232, double %223, double 1.000000e+00)
  %234 = tail call double @llvm.fma.f64(double %233, double %223, double 1.000000e+00)
  %235 = tail call i32 @llvm.nvvm.d2i.lo(double %234) #13
  %236 = tail call i32 @llvm.nvvm.d2i.hi(double %234) #13
  %237 = shl i32 %220, 20
  %238 = add i32 %236, %237
  %239 = tail call double @llvm.nvvm.lohi.i2d(i32 %235, i32 %238) #13
  %240 = tail call i32 @llvm.nvvm.d2i.hi(double %218) #13
  %241 = bitcast i32 %240 to float
  %242 = tail call float @llvm.nvvm.fabs.f(float %241) #13
  %243 = fcmp olt float %242, 0x4010C46560000000
  br i1 %243, label %__nv_exp.exit110, label %__internal_fast_icmp_abs_lt.exit.i107

__internal_fast_icmp_abs_lt.exit.i107:            ; preds = %__nv_log1p.exit
  %244 = fcmp one double %subtract.233.1.clone.1, 0.000000e+00
  %245 = fsub double 0x7FF0000000000000, %217
  %z.0.i108 = select i1 %244, double 0.000000e+00, double %245
  %246 = fcmp olt float %242, 0x4010E90000000000
  br i1 %246, label %247, label %__nv_exp.exit110

247:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i107
  %248 = sdiv i32 %220, 2
  %249 = shl i32 %248, 20
  %250 = add i32 %236, %249
  %251 = tail call double @llvm.nvvm.lohi.i2d(i32 %235, i32 %250) #13
  %252 = sub nsw i32 %220, %248
  %253 = shl i32 %252, 20
  %254 = add nsw i32 %253, 1072693248
  %255 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %254) #13
  %256 = fmul double %255, %251
  br label %__nv_exp.exit110

__nv_exp.exit110:                                 ; preds = %__nv_log1p.exit, %__internal_fast_icmp_abs_lt.exit.i107, %247
  %z.2.i109 = phi double [ %239, %__nv_log1p.exit ], [ %256, %247 ], [ %z.0.i108, %__internal_fast_icmp_abs_lt.exit.i107 ]
  %257 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i109) #13
  %258 = bitcast i32 %257 to float
  %259 = fcmp olt float %258, 0x3FFCAAAAA0000000
  %260 = fcmp ogt float %258, 0xBFFB333320000000
  %or.cond.i92 = and i1 %259, %260
  br i1 %or.cond.i92, label %261, label %278

261:                                              ; preds = %__nv_exp.exit110
  %262 = fadd double %z.2.i109, 2.000000e+00
  %263 = fdiv double %z.2.i109, %262
  %264 = fneg double %z.2.i109
  %265 = fmul double %263, %264
  %266 = fadd double %z.2.i109, %265
  %267 = fmul double %266, %266
  %268 = tail call double @llvm.fma.f64(double %267, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %269 = tail call double @llvm.fma.f64(double %268, double %267, double 0x3EF3B9FF890F468C)
  %270 = tail call double @llvm.fma.f64(double %269, double %267, double 0x3F17457EFD51BAF8)
  %271 = tail call double @llvm.fma.f64(double %270, double %267, double 0x3F3C71C8DE3CE825)
  %272 = tail call double @llvm.fma.f64(double %271, double %267, double 0x3F6249248FA4661F)
  %273 = tail call double @llvm.fma.f64(double %272, double %267, double 0x3F899999999D70C4)
  %274 = tail call double @llvm.fma.f64(double %273, double %267, double 0x3FB5555555555462)
  %275 = fmul double %267, %274
  %276 = tail call double @llvm.fma.f64(double %275, double %266, double %265)
  %277 = fadd double %z.2.i109, %276
  br label %__nv_log1p.exit102

278:                                              ; preds = %__nv_exp.exit110
  %279 = fadd double %z.2.i109, 1.000000e+00
  %280 = tail call i32 @llvm.nvvm.d2i.hi(double %279) #13
  %281 = tail call i32 @llvm.nvvm.d2i.lo(double %279) #13
  %282 = icmp slt i32 %280, 1048576
  %283 = fmul double %279, 0x4350000000000000
  %284 = tail call i32 @llvm.nvvm.d2i.lo(double %283) #13
  %285 = tail call i32 @llvm.nvvm.d2i.hi(double %283) #13
  br i1 %282, label %286, label %287

286:                                              ; preds = %278
  br label %287

287:                                              ; preds = %286, %278
  %.0.i93 = phi double [ %283, %286 ], [ %279, %278 ]
  %ihi.i.0.i94 = phi i32 [ %285, %286 ], [ %280, %278 ]
  %ilo.i.0.i95 = phi i32 [ %284, %286 ], [ %281, %278 ]
  %e.i.0.i96 = phi i32 [ -1077, %286 ], [ -1023, %278 ]
  %288 = add i32 %ihi.i.0.i94, -1
  %or.cond2.i97 = icmp ult i32 %288, 2146435071
  br i1 %or.cond2.i97, label %289, label %336

289:                                              ; preds = %287
  %290 = lshr i32 %ihi.i.0.i94, 20
  %291 = add nsw i32 %e.i.0.i96, %290
  %292 = and i32 %ihi.i.0.i94, 1048575
  %293 = or disjoint i32 %292, 1072693248
  %294 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i95, i32 %293) #13
  %295 = icmp ugt i32 %293, 1073127582
  %296 = tail call i32 @llvm.nvvm.d2i.lo(double %294) #13
  %297 = tail call i32 @llvm.nvvm.d2i.hi(double %294) #13
  %298 = add i32 %297, -1048576
  %299 = tail call double @llvm.nvvm.lohi.i2d(i32 %296, i32 %298) #13
  %spec.select112 = select i1 %295, double %299, double %294
  %300 = zext i1 %295 to i32
  %spec.select113 = add nsw i32 %291, %300
  %301 = fadd double %spec.select112, -1.000000e+00
  %302 = fadd double %spec.select112, 1.000000e+00
  %303 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %302) #13
  %304 = fneg double %302
  %305 = tail call double @llvm.fma.f64(double %304, double %303, double 1.000000e+00)
  %306 = tail call double @llvm.fma.f64(double %305, double %305, double %305)
  %307 = tail call double @llvm.fma.f64(double %306, double %303, double %303)
  %308 = fmul double %301, %307
  %309 = fadd double %308, %308
  %310 = fmul double %309, %309
  %311 = tail call double @llvm.fma.f64(double %310, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %312 = tail call double @llvm.fma.f64(double %311, double %310, double 0x3EF3B2669F02676F)
  %313 = tail call double @llvm.fma.f64(double %312, double %310, double 0x3F1745CBA9AB0956)
  %314 = tail call double @llvm.fma.f64(double %313, double %310, double 0x3F3C71C72D1B5154)
  %315 = tail call double @llvm.fma.f64(double %314, double %310, double 0x3F624924923BE72D)
  %316 = tail call double @llvm.fma.f64(double %315, double %310, double 0x3F8999999999A3C4)
  %317 = tail call double @llvm.fma.f64(double %316, double %310, double 0x3FB5555555555554)
  %318 = fsub double %301, %309
  %319 = fmul double %318, 2.000000e+00
  %320 = fneg double %309
  %321 = tail call double @llvm.fma.f64(double %320, double %301, double %319)
  %322 = fmul double %307, %321
  %323 = fmul double %310, %317
  %324 = tail call double @llvm.fma.f64(double %323, double %309, double %322)
  %325 = xor i32 %spec.select113, -2147483648
  %326 = tail call double @llvm.nvvm.lohi.i2d(i32 %325, i32 1127219200) #13
  %327 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %328 = fsub double %326, %327
  %329 = tail call double @llvm.fma.f64(double %328, double 0x3FE62E42FEFA39EF, double %309)
  %330 = fneg double %328
  %331 = tail call double @llvm.fma.f64(double %330, double 0x3FE62E42FEFA39EF, double %329)
  %332 = fsub double %331, %309
  %333 = fsub double %324, %332
  %334 = tail call double @llvm.fma.f64(double %328, double 0x3C7ABC9E3B39803F, double %333)
  %335 = fadd double %329, %334
  br label %__nv_log1p.exit102

336:                                              ; preds = %287
  %337 = tail call double @llvm.fma.f64(double %.0.i93, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %338 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i93) #13
  %339 = and i32 %338, 2147483647
  %340 = icmp eq i32 %339, 0
  %q.i.0.i98 = select i1 %340, double 0xFFF0000000000000, double %337
  br label %__nv_log1p.exit102

__nv_log1p.exit102:                               ; preds = %261, %289, %336
  %t.0.i99 = phi double [ %277, %261 ], [ %335, %289 ], [ %q.i.0.i98, %336 ]
  %341 = fcmp uno double %215, 0.000000e+00
  %342 = fcmp oge double %215, %minimum.8.3.clone.1
  %343 = or i1 %341, %342
  %maximum.44.1.clone.1 = select i1 %343, double %215, double %minimum.8.3.clone.1
  %add.4227.3.clone.1 = fadd double %minimum.8.3.clone.1, %215
  %compare.1159.1.clone.1 = fcmp uno double %subtract.233.1.clone.1, 0.000000e+00
  %344 = icmp sge i64 %3, %5
  %345 = or i8 %9, %7
  %346 = trunc i8 %345 to i1
  %.not91 = or i1 %344, %346
  %compare.1166.3.clone.1 = fcmp olt double %40, -1.000000e+03
  %347 = zext i1 %compare.1166.3.clone.1 to i8
  %348 = select i1 %.not91, i8 %9, i8 %347
  %349 = select i1 %.not91, double %213, double %add.4203.1.clone.1
  %350 = icmp eq i64 %3, 0
  %351 = select i1 %350, double %add.4203.1.clone.1, double %211
  %352 = select i1 %.not91, double %211, double %351
  %compare.1158.1.clone.1 = fcmp uno double %subtract.232.1.clone.1, 0.000000e+00
  %add.4224.3.clone.1 = fadd double %42, %40
  %353 = fcmp uno double %42, 0.000000e+00
  %354 = fcmp oge double %42, %40
  %355 = or i1 %353, %354
  %maximum.43.1.clone.1 = select i1 %355, double %42, double %40
  %add.4226.5.clone.1 = fadd double %maximum.43.1.clone.1, %t.0.i
  %356 = select i1 %compare.1158.1.clone.1, double %add.4224.3.clone.1, double %add.4226.5.clone.1
  %357 = select i1 %350, double %40, double %356
  %358 = select i1 %.not91, double %42, double %357
  %359 = trunc i64 %3 to i32
  %360 = add i32 %13, %359
  %361 = add i32 %360, %12
  %362 = tail call i32 @llvm.fshl.i32(i32 %360, i32 %360, i32 13)
  %363 = xor i32 %361, %362
  %364 = add i32 %363, %361
  %365 = tail call i32 @llvm.fshl.i32(i32 %363, i32 %363, i32 15)
  %366 = xor i32 %364, %365
  %367 = add i32 %366, %364
  %368 = tail call i32 @llvm.fshl.i32(i32 %366, i32 %366, i32 26)
  %369 = xor i32 %367, %368
  %370 = add i32 %369, %367
  %371 = add i32 %370, %13
  %372 = tail call i32 @llvm.fshl.i32(i32 %369, i32 %369, i32 6)
  %373 = xor i32 %370, %372
  %374 = xor i32 %12, %13
  %375 = xor i32 %374, 466688986
  %376 = add i32 %375, 1
  %377 = add i32 %376, %373
  %378 = add i32 %371, %377
  %379 = tail call i32 @llvm.fshl.i32(i32 %377, i32 %377, i32 17)
  %380 = xor i32 %378, %379
  %381 = add i32 %380, %378
  %382 = tail call i32 @llvm.fshl.i32(i32 %380, i32 %380, i32 29)
  %383 = xor i32 %381, %382
  %384 = add i32 %383, %381
  %385 = tail call i32 @llvm.fshl.i32(i32 %383, i32 %383, i32 16)
  %386 = xor i32 %384, %385
  %387 = add i32 %386, %384
  %388 = add i32 %387, %375
  %389 = tail call i32 @llvm.fshl.i32(i32 %386, i32 %386, i32 24)
  %390 = xor i32 %387, %389
  %391 = add i32 %12, 2
  %392 = add i32 %391, %390
  %393 = add i32 %388, %392
  %394 = tail call i32 @llvm.fshl.i32(i32 %392, i32 %392, i32 13)
  %395 = xor i32 %393, %394
  %396 = add i32 %395, %393
  %397 = tail call i32 @llvm.fshl.i32(i32 %395, i32 %395, i32 15)
  %398 = xor i32 %396, %397
  %399 = add i32 %398, %396
  %400 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 26)
  %401 = xor i32 %399, %400
  %402 = add i32 %401, %399
  %403 = add i32 %402, %12
  %404 = tail call i32 @llvm.fshl.i32(i32 %401, i32 %401, i32 6)
  %405 = xor i32 %402, %404
  %406 = add i32 %13, 3
  %407 = add i32 %406, %405
  %408 = add i32 %403, %407
  %409 = tail call i32 @llvm.fshl.i32(i32 %407, i32 %407, i32 17)
  %410 = xor i32 %408, %409
  %411 = add i32 %410, %408
  %412 = tail call i32 @llvm.fshl.i32(i32 %410, i32 %410, i32 29)
  %413 = xor i32 %411, %412
  %414 = add i32 %413, %411
  %415 = tail call i32 @llvm.fshl.i32(i32 %413, i32 %413, i32 16)
  %416 = xor i32 %414, %415
  %417 = add i32 %416, %414
  %418 = add i32 %417, %13
  %419 = tail call i32 @llvm.fshl.i32(i32 %416, i32 %416, i32 24)
  %420 = xor i32 %417, %419
  %421 = add i32 %375, 4
  %422 = add i32 %421, %420
  %423 = add i32 %418, %422
  %424 = tail call i32 @llvm.fshl.i32(i32 %422, i32 %422, i32 13)
  %425 = xor i32 %423, %424
  %426 = add i32 %425, %423
  %427 = tail call i32 @llvm.fshl.i32(i32 %425, i32 %425, i32 15)
  %428 = xor i32 %426, %427
  %429 = add i32 %428, %426
  %430 = tail call i32 @llvm.fshl.i32(i32 %428, i32 %428, i32 26)
  %431 = xor i32 %429, %430
  %432 = add i32 %431, %429
  %433 = add i32 %432, %375
  %434 = tail call i32 @llvm.fshl.i32(i32 %431, i32 %431, i32 6)
  %435 = xor i32 %432, %434
  %436 = add i32 %435, %12
  %437 = add i32 %436, 6
  %438 = add i32 %437, %433
  %439 = tail call i32 @llvm.fshl.i32(i32 %437, i32 %437, i32 13)
  %440 = xor i32 %438, %439
  %441 = add i32 %440, %438
  %442 = tail call i32 @llvm.fshl.i32(i32 %440, i32 %440, i32 15)
  %443 = xor i32 %441, %442
  %444 = add i32 %443, %441
  %445 = tail call i32 @llvm.fshl.i32(i32 %443, i32 %443, i32 26)
  %446 = xor i32 %444, %445
  %447 = add i32 %446, %444
  %448 = add i32 %436, 5
  %449 = add i32 %447, %448
  %450 = tail call i32 @llvm.fshl.i32(i32 %446, i32 %446, i32 6)
  %451 = xor i32 %447, %450
  %452 = xor i32 %433, %448
  %453 = xor i32 %452, 466688986
  %454 = add i32 %453, 1
  %455 = add i32 %454, %451
  %456 = add i32 %449, %455
  %457 = tail call i32 @llvm.fshl.i32(i32 %455, i32 %455, i32 17)
  %458 = xor i32 %456, %457
  %459 = add i32 %458, %456
  %460 = tail call i32 @llvm.fshl.i32(i32 %458, i32 %458, i32 29)
  %461 = xor i32 %459, %460
  %462 = add i32 %461, %459
  %463 = tail call i32 @llvm.fshl.i32(i32 %461, i32 %461, i32 16)
  %464 = xor i32 %462, %463
  %465 = add i32 %464, %462
  %466 = add i32 %465, %453
  %467 = tail call i32 @llvm.fshl.i32(i32 %464, i32 %464, i32 24)
  %468 = xor i32 %465, %467
  %469 = add i32 %433, 2
  %470 = add i32 %469, %468
  %471 = add i32 %466, %470
  %472 = tail call i32 @llvm.fshl.i32(i32 %470, i32 %470, i32 13)
  %473 = xor i32 %471, %472
  %474 = add i32 %473, %471
  %475 = tail call i32 @llvm.fshl.i32(i32 %473, i32 %473, i32 15)
  %476 = xor i32 %474, %475
  %477 = add i32 %476, %474
  %478 = tail call i32 @llvm.fshl.i32(i32 %476, i32 %476, i32 26)
  %479 = xor i32 %477, %478
  %480 = add i32 %479, %477
  %481 = add i32 %480, %433
  %482 = tail call i32 @llvm.fshl.i32(i32 %479, i32 %479, i32 6)
  %483 = xor i32 %480, %482
  %484 = add i32 %436, 8
  %485 = add i32 %484, %483
  %486 = add i32 %481, %485
  %487 = tail call i32 @llvm.fshl.i32(i32 %485, i32 %485, i32 17)
  %488 = xor i32 %486, %487
  %489 = add i32 %488, %486
  %490 = tail call i32 @llvm.fshl.i32(i32 %488, i32 %488, i32 29)
  %491 = xor i32 %489, %490
  %492 = add i32 %491, %489
  %493 = tail call i32 @llvm.fshl.i32(i32 %491, i32 %491, i32 16)
  %494 = xor i32 %492, %493
  %495 = add i32 %494, %492
  %496 = add i32 %495, %448
  %497 = tail call i32 @llvm.fshl.i32(i32 %494, i32 %494, i32 24)
  %498 = xor i32 %495, %497
  %499 = add i32 %453, 4
  %500 = add i32 %499, %498
  %501 = add i32 %496, %500
  %502 = tail call i32 @llvm.fshl.i32(i32 %500, i32 %500, i32 13)
  %503 = xor i32 %501, %502
  %504 = add i32 %503, %501
  %505 = tail call i32 @llvm.fshl.i32(i32 %503, i32 %503, i32 15)
  %506 = xor i32 %504, %505
  %507 = add i32 %506, %504
  %508 = tail call i32 @llvm.fshl.i32(i32 %506, i32 %506, i32 26)
  %509 = xor i32 %507, %508
  %510 = add i32 %509, %507
  %511 = add i32 %510, %453
  %512 = zext i32 %511 to i64
  %513 = shl nuw i64 %512, 32
  %514 = tail call i32 @llvm.fshl.i32(i32 %509, i32 %509, i32 6)
  %515 = xor i32 %510, %514
  %516 = add i32 %433, 5
  %517 = add i32 %516, %515
  %518 = zext i32 %517 to i64
  %519 = or disjoint i64 %513, %518
  %520 = lshr i64 %519, 12
  %521 = or disjoint i64 %520, 4607182418800017408
  %522 = bitcast i64 %521 to double
  %add.4163.7.clone.1 = fadd double %522, -1.000000e+00
  %523 = fcmp ole double %add.4163.7.clone.1, 0.000000e+00
  %maximum.41.7.clone.1 = select i1 %523, double 0.000000e+00, double %add.4163.7.clone.1
  %add.4223.9.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.621.7.clone.1 = fdiv double 1.000000e+00, %add.4223.9.clone.1
  %compare.1156.5.clone.1 = fcmp uge double %maximum.41.7.clone.1, %divide.621.7.clone.1
  %524 = select i1 %compare.1156.5.clone.1, double %85, double %add.4222.9.clone.1
  %525 = select i1 %350, double %add.4222.9.clone.1, double %524
  %526 = select i1 %.not91, double %85, double %525
  %527 = select i1 %compare.1156.5.clone.1, double %83, double %add.4203.1.clone.1
  %528 = select i1 %350, double %add.4203.1.clone.1, double %527
  %529 = select i1 %.not91, double %83, double %528
  %530 = zext i1 %compare.1156.5.clone.1 to i8
  %add.4228.5.clone.1 = fadd double %maximum.44.1.clone.1, %t.0.i99
  %531 = select i1 %compare.1159.1.clone.1, double %add.4227.3.clone.1, double %add.4228.5.clone.1
  %532 = select i1 %350, double %minimum.8.3.clone.1, double %531
  %533 = select i1 %.not91, double %215, double %532
  %534 = ashr i64 %3, 1
  %535 = tail call i64 @llvm.abs.i64(i64 %534, i1 true)
  %536 = tail call range(i64 0, 64) i64 @llvm.ctpop.i64(i64 %535)
  %537 = trunc nuw nsw i64 %536 to i32
  %538 = getelementptr i32, ptr addrspace(1) %arg20156, i64 %1
  %539 = load i32, ptr addrspace(1) %538, align 4
  %540 = select i1 %.not91, i32 %539, i32 %537
  %541 = xor i64 %3, -1
  %542 = add i64 %3, 1
  %543 = and i64 %542, %541
  %544 = add i64 %543, -1
  %545 = sub i64 1, %543
  %546 = icmp slt i64 %544, 0
  %547 = select i1 %546, i64 %545, i64 %544
  %548 = tail call range(i64 0, 65) i64 @llvm.ctpop.i64(i64 %547)
  %549 = trunc nuw nsw i64 %548 to i32
  %550 = sub nsw i32 %537, %549
  %551 = add nsw i32 %550, 1
  %552 = getelementptr i32, ptr addrspace(1) %arg21158, i64 %1
  %553 = load i32, ptr addrspace(1) %552, align 4
  %554 = select i1 %.not91, i32 %553, i32 %551
  %555 = select i1 %.not91, i64 %3, i64 %542
  %556 = getelementptr i64, ptr addrspace(1) %arg22160, i64 %1
  %557 = load i64, ptr addrspace(1) %556, align 8
  %558 = add i64 %557, 1
  %559 = select i1 %350, i64 1, i64 %558
  %560 = select i1 %.not91, i64 %557, i64 %559
  store double %529, ptr addrspace(1) %82, align 8
  store double %526, ptr addrspace(1) %84, align 8
  %561 = getelementptr i8, ptr addrspace(1) %arg23162, i64 %1
  store i8 %530, ptr addrspace(1) %561, align 1
  store double %358, ptr addrspace(1) %41, align 8
  store double %352, ptr addrspace(1) %210, align 8
  store double %349, ptr addrspace(1) %212, align 8
  %562 = getelementptr i8, ptr addrspace(1) %arg24164, i64 %1
  store i8 %348, ptr addrspace(1) %562, align 1
  store double %533, ptr addrspace(1) %214, align 8
  store i32 %540, ptr addrspace(1) %538, align 4
  store i32 %554, ptr addrspace(1) %552, align 4
  %563 = getelementptr i32, ptr addrspace(1) %arg25166, i64 %1
  store i32 %551, ptr addrspace(1) %563, align 4
  %564 = getelementptr i32, ptr addrspace(1) %arg26168, i64 %1
  store i32 %537, ptr addrspace(1) %564, align 4
  %565 = getelementptr i64, ptr addrspace(1) %arg27170, i64 %1
  store i64 %555, ptr addrspace(1) %565, align 8
  store i64 %560, ptr addrspace(1) %556, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_scatter_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(46080) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg231 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg129 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg027 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !272
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 576
  br i1 %3, label %concatenate.pivot.0., label %scatter.14.1.in_bounds-after

scatter.14.1.in_bounds-after:                     ; preds = %concatenate.pivot.0., %scatter.in_bounds-true, %entry
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 287
  %4 = zext i1 %.cmp to i64
  %param_2.174310 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg231, i64 0, i64 %4
  %param_2.174311 = load i32, ptr addrspace(1) %param_2.174310, align 4, !invariant.load !270
  %5 = icmp slt i32 %param_2.174311, 0
  %6 = add i32 %param_2.174311, 10
  %7 = select i1 %5, i32 %6, i32 %param_2.174311
  %8 = icmp ult i32 %7, 10
  br i1 %8, label %scatter.in_bounds-true, label %scatter.14.1.in_bounds-after

scatter.in_bounds-true:                           ; preds = %concatenate.pivot.0.
  %.lhs.trunc24 = trunc nuw nsw i32 %linear_index to i16
  %9 = zext nneg i32 %linear_index to i64
  %10 = getelementptr double, ptr addrspace(1) %arg129, i64 %9
  %11 = zext nneg i32 %7 to i64
  %.urem = add nsw i16 %.lhs.trunc24, -288
  %.cmp26 = icmp ult i32 %linear_index, 288
  %12 = select i1 %.cmp26, i16 %.lhs.trunc24, i16 %.urem
  %13 = zext nneg i16 %12 to i64
  %14 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg027, i64 0, i64 %4, i64 %11, i64 %13
  %param_1.170321 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  store double %param_1.170321, ptr addrspace(1) %14, align 8
  br label %scatter.14.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_1(ptr noalias nocapture align 128 dereferenceable(46080) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg5, ptr noalias nocapture align 128 dereferenceable(46080) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(46080) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(46080) %arg9) local_unnamed_addr #2 {
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
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 2880
  %4 = zext nneg i16 %3 to i64
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
  ret void
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
  %param_1.77 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg113, i64 0, i64 %5
  %param_1.772 = load i32, ptr addrspace(1) %param_1.77, align 4, !invariant.load !270
  %param_2.66 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.663 = load i32, ptr addrspace(1) %param_2.66, align 4, !invariant.load !270
  %6 = icmp sge i32 %param_1.772, %param_2.663
  %param_0.54 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg011, i64 0, i64 %5
  %param_0.544 = load i8, ptr addrspace(1) %param_0.54, align 1, !invariant.load !270
  %7 = trunc i8 %param_0.544 to i1
  %8 = xor i1 %7, true
  %9 = and i1 %6, %8
  %10 = zext i1 %9 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg317, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg6) local_unnamed_addr #4 {
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
  %param_2.60326 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg2704, i64 0, i64 %1
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %param_2.60327 = load i32, ptr addrspace(1) %param_2.60326, align 4, !invariant.load !270
  %3 = icmp slt i32 %param_2.60327, 0
  %4 = add i32 %param_2.60327, 10
  %5 = select i1 %3, i32 %4, i32 %param_2.60327
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 9)
  %8 = zext nneg i32 %7 to i64
  %9 = zext nneg i32 %2 to i64
  %param_0.50301 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %9
  %10 = load <2 x double>, ptr addrspace(1) %param_0.50301, align 16, !invariant.load !270
  %param_0.50302738 = extractelement <2 x double> %10, i32 0
  %param_0.50302.1739 = extractelement <2 x double> %10, i32 1
  %param_3.54303 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %9
  %11 = load <2 x double>, ptr addrspace(1) %param_3.54303, align 16, !invariant.load !270
  %param_3.54304742 = extractelement <2 x double> %11, i32 0
  %param_3.54304.1743 = extractelement <2 x double> %11, i32 1
  %param_4.52359 = getelementptr [2 x [10 x [288 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %9
  %12 = load <2 x double>, ptr addrspace(1) %param_4.52359, align 16, !invariant.load !270
  %param_4.52360746 = extractelement <2 x double> %12, i32 0
  %param_4.52360.1747 = extractelement <2 x double> %12, i32 1
  %subtract.218.7361 = fsub double %param_3.54304742, %param_4.52360746
  %param_1.71416 = getelementptr [2 x [10 x [288 x double]]], ptr addrspace(1) %arg1702, i64 0, i64 %1, i64 %8, i64 %9
  %13 = load <2 x double>, ptr addrspace(1) %param_1.71416, align 16, !invariant.load !270
  %param_1.71417750 = extractelement <2 x double> %13, i32 0
  %param_1.71417.1751 = extractelement <2 x double> %13, i32 1
  %add.3972.9418 = fadd double %subtract.218.7361, %param_1.71417750
  %add.3973.9421 = fadd double %param_0.50302738, %param_1.71417750
  %multiply.2886.7423 = fmul double %add.3973.9421, 5.000000e-01
  %subtract.219.7424 = fsub double %add.3972.9418, %multiply.2886.7423
  %multiply.2888.3425 = fmul double %param_0.50302738, %subtract.219.7424
  %add.3969.i671 = fadd double %multiply.2888.3425, 0.000000e+00
  %multiply.2887.3.clone.1605 = fmul double %param_1.71417750, %subtract.219.7424
  %add.3969.i672 = fadd double %multiply.2887.3.clone.1605, 0.000000e+00
  %subtract.218.7361.1 = fsub double %param_3.54304.1743, %param_4.52360.1747
  %add.3972.9418.1 = fadd double %subtract.218.7361.1, %param_1.71417.1751
  %add.3973.9421.1 = fadd double %param_0.50302.1739, %param_1.71417.1751
  %multiply.2886.7423.1 = fmul double %add.3973.9421.1, 5.000000e-01
  %subtract.219.7424.1 = fsub double %add.3972.9418.1, %multiply.2886.7423.1
  %multiply.2888.3425.1 = fmul double %param_0.50302.1739, %subtract.219.7424.1
  %add.3969.i671.1 = fadd double %add.3969.i671, %multiply.2888.3425.1
  %multiply.2887.3.clone.1605.1 = fmul double %param_1.71417.1751, %subtract.219.7424.1
  %add.3969.i672.1 = fadd double %add.3969.i672, %multiply.2887.3.clone.1605.1
  %14 = shl nuw nsw i32 %thread.id.x, 1
  %15 = or i32 %14, 64
  %16 = zext nneg i32 %15 to i64
  %param_0.50301.1683 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %16
  %param_0.50302.1684 = load double, ptr addrspace(1) %param_0.50301.1683, align 16, !invariant.load !270
  %param_3.54303.1685 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %16
  %param_3.54304.1686 = load double, ptr addrspace(1) %param_3.54303.1685, align 16, !invariant.load !270
  %param_4.52359.1687 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %16
  %param_4.52360.1688 = load double, ptr addrspace(1) %param_4.52359.1687, align 16, !invariant.load !270
  %subtract.218.7361.1689 = fsub double %param_3.54304.1686, %param_4.52360.1688
  %param_1.71416.1690 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg1702, i64 0, i64 %1, i64 %8, i64 %16
  %param_1.71417.1691 = load double, ptr addrspace(1) %param_1.71416.1690, align 16, !invariant.load !270
  %add.3972.9418.1692 = fadd double %subtract.218.7361.1689, %param_1.71417.1691
  %add.3973.9421.1693 = fadd double %param_0.50302.1684, %param_1.71417.1691
  %multiply.2886.7423.1694 = fmul double %add.3973.9421.1693, 5.000000e-01
  %subtract.219.7424.1695 = fsub double %add.3972.9418.1692, %multiply.2886.7423.1694
  %multiply.2888.3425.1696 = fmul double %param_0.50302.1684, %subtract.219.7424.1695
  %add.3969.i671.1697 = fadd double %add.3969.i671.1, %multiply.2888.3425.1696
  %multiply.2887.3.clone.1605.1698 = fmul double %param_1.71417.1691, %subtract.219.7424.1695
  %add.3969.i672.1699 = fadd double %add.3969.i672.1, %multiply.2887.3.clone.1605.1698
  %17 = or i32 %14, 65
  %18 = zext nneg i32 %17 to i64
  %param_0.50301.1.1 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %18
  %param_0.50302.1.1 = load double, ptr addrspace(1) %param_0.50301.1.1, align 8, !invariant.load !270
  %param_3.54303.1.1 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %18
  %param_3.54304.1.1 = load double, ptr addrspace(1) %param_3.54303.1.1, align 8, !invariant.load !270
  %param_4.52359.1.1 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %18
  %param_4.52360.1.1 = load double, ptr addrspace(1) %param_4.52359.1.1, align 8, !invariant.load !270
  %subtract.218.7361.1.1 = fsub double %param_3.54304.1.1, %param_4.52360.1.1
  %param_1.71416.1.1 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg1702, i64 0, i64 %1, i64 %8, i64 %18
  %param_1.71417.1.1 = load double, ptr addrspace(1) %param_1.71416.1.1, align 8, !invariant.load !270
  %add.3972.9418.1.1 = fadd double %subtract.218.7361.1.1, %param_1.71417.1.1
  %add.3973.9421.1.1 = fadd double %param_0.50302.1.1, %param_1.71417.1.1
  %multiply.2886.7423.1.1 = fmul double %add.3973.9421.1.1, 5.000000e-01
  %subtract.219.7424.1.1 = fsub double %add.3972.9418.1.1, %multiply.2886.7423.1.1
  %multiply.2888.3425.1.1 = fmul double %param_0.50302.1.1, %subtract.219.7424.1.1
  %add.3969.i671.1.1 = fadd double %add.3969.i671.1697, %multiply.2888.3425.1.1
  %multiply.2887.3.clone.1605.1.1 = fmul double %param_1.71417.1.1, %subtract.219.7424.1.1
  %add.3969.i672.1.1 = fadd double %add.3969.i672.1699, %multiply.2887.3.clone.1605.1.1
  %param_0.50301.2718 = getelementptr inbounds i8, ptr addrspace(1) %param_0.50301, i64 1024
  %19 = load <2 x double>, ptr addrspace(1) %param_0.50301.2718, align 16, !invariant.load !270
  %param_0.50302.2740 = extractelement <2 x double> %19, i32 0
  %param_0.50302.1.2741 = extractelement <2 x double> %19, i32 1
  %param_3.54303.2719 = getelementptr inbounds i8, ptr addrspace(1) %param_3.54303, i64 1024
  %20 = load <2 x double>, ptr addrspace(1) %param_3.54303.2719, align 16, !invariant.load !270
  %param_3.54304.2744 = extractelement <2 x double> %20, i32 0
  %param_3.54304.1.2745 = extractelement <2 x double> %20, i32 1
  %param_4.52359.2720 = getelementptr inbounds i8, ptr addrspace(1) %param_4.52359, i64 1024
  %21 = load <2 x double>, ptr addrspace(1) %param_4.52359.2720, align 16, !invariant.load !270
  %param_4.52360.2748 = extractelement <2 x double> %21, i32 0
  %param_4.52360.1.2749 = extractelement <2 x double> %21, i32 1
  %subtract.218.7361.2 = fsub double %param_3.54304.2744, %param_4.52360.2748
  %param_1.71416.2721 = getelementptr inbounds i8, ptr addrspace(1) %param_1.71416, i64 1024
  %22 = load <2 x double>, ptr addrspace(1) %param_1.71416.2721, align 16, !invariant.load !270
  %param_1.71417.2752 = extractelement <2 x double> %22, i32 0
  %param_1.71417.1.2753 = extractelement <2 x double> %22, i32 1
  %add.3972.9418.2 = fadd double %subtract.218.7361.2, %param_1.71417.2752
  %add.3973.9421.2 = fadd double %param_0.50302.2740, %param_1.71417.2752
  %multiply.2886.7423.2 = fmul double %add.3973.9421.2, 5.000000e-01
  %subtract.219.7424.2 = fsub double %add.3972.9418.2, %multiply.2886.7423.2
  %multiply.2888.3425.2 = fmul double %param_0.50302.2740, %subtract.219.7424.2
  %add.3969.i671.2 = fadd double %add.3969.i671.1.1, %multiply.2888.3425.2
  %multiply.2887.3.clone.1605.2 = fmul double %param_1.71417.2752, %subtract.219.7424.2
  %add.3969.i672.2 = fadd double %add.3969.i672.1.1, %multiply.2887.3.clone.1605.2
  %subtract.218.7361.1.2 = fsub double %param_3.54304.1.2745, %param_4.52360.1.2749
  %add.3972.9418.1.2 = fadd double %subtract.218.7361.1.2, %param_1.71417.1.2753
  %add.3973.9421.1.2 = fadd double %param_0.50302.1.2741, %param_1.71417.1.2753
  %multiply.2886.7423.1.2 = fmul double %add.3973.9421.1.2, 5.000000e-01
  %subtract.219.7424.1.2 = fsub double %add.3972.9418.1.2, %multiply.2886.7423.1.2
  %multiply.2888.3425.1.2 = fmul double %param_0.50302.1.2741, %subtract.219.7424.1.2
  %add.3969.i671.1.2 = fadd double %add.3969.i671.2, %multiply.2888.3425.1.2
  %multiply.2887.3.clone.1605.1.2 = fmul double %param_1.71417.1.2753, %subtract.219.7424.1.2
  %add.3969.i672.1.2 = fadd double %add.3969.i672.2, %multiply.2887.3.clone.1605.1.2
  %23 = or i32 %14, 192
  %24 = zext nneg i32 %23 to i64
  %param_0.50301.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %24
  %param_0.50302.3 = load double, ptr addrspace(1) %param_0.50301.3, align 16, !invariant.load !270
  %param_3.54303.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %24
  %param_3.54304.3 = load double, ptr addrspace(1) %param_3.54303.3, align 16, !invariant.load !270
  %param_4.52359.3 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %24
  %param_4.52360.3 = load double, ptr addrspace(1) %param_4.52359.3, align 16, !invariant.load !270
  %subtract.218.7361.3 = fsub double %param_3.54304.3, %param_4.52360.3
  %param_1.71416.3 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg1702, i64 0, i64 %1, i64 %8, i64 %24
  %param_1.71417.3 = load double, ptr addrspace(1) %param_1.71416.3, align 16, !invariant.load !270
  %add.3972.9418.3 = fadd double %subtract.218.7361.3, %param_1.71417.3
  %add.3973.9421.3 = fadd double %param_0.50302.3, %param_1.71417.3
  %multiply.2886.7423.3 = fmul double %add.3973.9421.3, 5.000000e-01
  %subtract.219.7424.3 = fsub double %add.3972.9418.3, %multiply.2886.7423.3
  %multiply.2888.3425.3 = fmul double %param_0.50302.3, %subtract.219.7424.3
  %add.3969.i671.3 = fadd double %add.3969.i671.1.2, %multiply.2888.3425.3
  %multiply.2887.3.clone.1605.3 = fmul double %param_1.71417.3, %subtract.219.7424.3
  %add.3969.i672.3 = fadd double %add.3969.i672.1.2, %multiply.2887.3.clone.1605.3
  %25 = or i32 %14, 193
  %26 = zext nneg i32 %25 to i64
  %param_0.50301.1.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %26
  %param_0.50302.1.3 = load double, ptr addrspace(1) %param_0.50301.1.3, align 8, !invariant.load !270
  %param_3.54303.1.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %26
  %param_3.54304.1.3 = load double, ptr addrspace(1) %param_3.54303.1.3, align 8, !invariant.load !270
  %param_4.52359.1.3 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %26
  %param_4.52360.1.3 = load double, ptr addrspace(1) %param_4.52359.1.3, align 8, !invariant.load !270
  %subtract.218.7361.1.3 = fsub double %param_3.54304.1.3, %param_4.52360.1.3
  %param_1.71416.1.3 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg1702, i64 0, i64 %1, i64 %8, i64 %26
  %param_1.71417.1.3 = load double, ptr addrspace(1) %param_1.71416.1.3, align 8, !invariant.load !270
  %add.3972.9418.1.3 = fadd double %subtract.218.7361.1.3, %param_1.71417.1.3
  %add.3973.9421.1.3 = fadd double %param_0.50302.1.3, %param_1.71417.1.3
  %multiply.2886.7423.1.3 = fmul double %add.3973.9421.1.3, 5.000000e-01
  %subtract.219.7424.1.3 = fsub double %add.3972.9418.1.3, %multiply.2886.7423.1.3
  %multiply.2888.3425.1.3 = fmul double %param_0.50302.1.3, %subtract.219.7424.1.3
  %add.3969.i671.1.3 = fadd double %add.3969.i671.3, %multiply.2888.3425.1.3
  %multiply.2887.3.clone.1605.1.3 = fmul double %param_1.71417.1.3, %subtract.219.7424.1.3
  %add.3969.i672.1.3 = fadd double %add.3969.i672.3, %multiply.2887.3.clone.1605.1.3
  %27 = or disjoint i32 %thread.id.2, 128
  %28 = icmp ult i32 %27, 144
  br i1 %28, label %loop3.loop_header296.preheader.4, label %x_in_tile-after.7

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after639, %reduction_write_output-true643
  ret void

thread_in_bounds-after:                           ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  %29 = icmp eq i32 %thread.id.2, 0
  %30 = bitcast double %partial_reduction_result2.2.4 to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 16, i32 31)
  %33 = insertelement <2 x i32> poison, i32 %32, i64 0
  %34 = extractelement <2 x i32> %30, i64 1
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 16, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to double
  %add.3969.i666 = fadd double %partial_reduction_result2.2.4, %37
  %38 = bitcast double %add.3969.i666 to <2 x i32>
  %39 = extractelement <2 x i32> %38, i64 0
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 8, i32 31)
  %41 = insertelement <2 x i32> poison, i32 %40, i64 0
  %42 = extractelement <2 x i32> %38, i64 1
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 8, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 1
  %45 = bitcast <2 x i32> %44 to double
  %add.3969.i667 = fadd double %add.3969.i666, %45
  %46 = bitcast double %add.3969.i667 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 4, i32 31)
  %49 = insertelement <2 x i32> poison, i32 %48, i64 0
  %50 = extractelement <2 x i32> %46, i64 1
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 4, i32 31)
  %52 = insertelement <2 x i32> %49, i32 %51, i64 1
  %53 = bitcast <2 x i32> %52 to double
  %add.3969.i668 = fadd double %add.3969.i667, %53
  %54 = bitcast double %add.3969.i668 to <2 x i32>
  %55 = extractelement <2 x i32> %54, i64 0
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 2, i32 31)
  %57 = insertelement <2 x i32> poison, i32 %56, i64 0
  %58 = extractelement <2 x i32> %54, i64 1
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 2, i32 31)
  %60 = insertelement <2 x i32> %57, i32 %59, i64 1
  %61 = bitcast <2 x i32> %60 to double
  %add.3969.i669 = fadd double %add.3969.i668, %61
  %62 = bitcast double %add.3969.i669 to <2 x i32>
  %63 = extractelement <2 x i32> %62, i64 0
  %64 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %63, i32 1, i32 31)
  %65 = extractelement <2 x i32> %62, i64 1
  %66 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %65, i32 1, i32 31)
  %67 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache11, i64 0, i64 %1, i64 0
  %68 = insertelement <2 x i32> poison, i32 %64, i64 0
  %69 = insertelement <2 x i32> %68, i32 %66, i64 1
  %70 = bitcast <2 x i32> %69 to double
  %add.3969.i670 = fadd double %add.3969.i669, %70
  br i1 %29, label %intra_warp_reduce_write-true638, label %intra_warp_reduce_write-after639

loop3.loop_header296.preheader.4:                 ; preds = %entry
  %71 = shl nuw nsw i32 %27, 1
  %72 = zext nneg i32 %71 to i64
  %param_0.50301.4 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %72
  %73 = load <2 x double>, ptr addrspace(1) %param_0.50301.4, align 16, !invariant.load !270
  %param_0.50302.4730 = extractelement <2 x double> %73, i32 0
  %param_0.50302.1.4731 = extractelement <2 x double> %73, i32 1
  %param_3.54303.4 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %72
  %74 = load <2 x double>, ptr addrspace(1) %param_3.54303.4, align 16, !invariant.load !270
  %param_3.54304.4732 = extractelement <2 x double> %74, i32 0
  %param_3.54304.1.4733 = extractelement <2 x double> %74, i32 1
  %param_4.52359.4 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %72
  %75 = load <2 x double>, ptr addrspace(1) %param_4.52359.4, align 16, !invariant.load !270
  %param_4.52360.4734 = extractelement <2 x double> %75, i32 0
  %param_4.52360.1.4735 = extractelement <2 x double> %75, i32 1
  %subtract.218.7361.4 = fsub double %param_3.54304.4732, %param_4.52360.4734
  %param_1.71416.4 = getelementptr inbounds [2 x [10 x [288 x double]]], ptr addrspace(1) %arg1702, i64 0, i64 %1, i64 %8, i64 %72
  %76 = load <2 x double>, ptr addrspace(1) %param_1.71416.4, align 16, !invariant.load !270
  %param_1.71417.4736 = extractelement <2 x double> %76, i32 0
  %param_1.71417.1.4737 = extractelement <2 x double> %76, i32 1
  %add.3972.9418.4 = fadd double %subtract.218.7361.4, %param_1.71417.4736
  %add.3973.9421.4 = fadd double %param_0.50302.4730, %param_1.71417.4736
  %multiply.2886.7423.4 = fmul double %add.3973.9421.4, 5.000000e-01
  %subtract.219.7424.4 = fsub double %add.3972.9418.4, %multiply.2886.7423.4
  %multiply.2888.3425.4 = fmul double %param_0.50302.4730, %subtract.219.7424.4
  %add.3969.i671.4 = fadd double %add.3969.i671.1.3, %multiply.2888.3425.4
  %multiply.2887.3.clone.1605.4 = fmul double %param_1.71417.4736, %subtract.219.7424.4
  %add.3969.i672.4 = fadd double %add.3969.i672.1.3, %multiply.2887.3.clone.1605.4
  %subtract.218.7361.1.4 = fsub double %param_3.54304.1.4733, %param_4.52360.1.4735
  %add.3972.9418.1.4 = fadd double %subtract.218.7361.1.4, %param_1.71417.1.4737
  %add.3973.9421.1.4 = fadd double %param_0.50302.1.4731, %param_1.71417.1.4737
  %multiply.2886.7423.1.4 = fmul double %add.3973.9421.1.4, 5.000000e-01
  %subtract.219.7424.1.4 = fsub double %add.3972.9418.1.4, %multiply.2886.7423.1.4
  %multiply.2888.3425.1.4 = fmul double %param_0.50302.1.4731, %subtract.219.7424.1.4
  %add.3969.i671.1.4 = fadd double %add.3969.i671.4, %multiply.2888.3425.1.4
  %multiply.2887.3.clone.1605.1.4 = fmul double %param_1.71417.1.4737, %subtract.219.7424.1.4
  %add.3969.i672.1.4 = fadd double %add.3969.i672.4, %multiply.2887.3.clone.1605.1.4
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %entry, %loop3.loop_header296.preheader.4
  %partial_reduction_result.2.4 = phi double [ %add.3969.i671.1.3, %entry ], [ %add.3969.i671.1.4, %loop3.loop_header296.preheader.4 ]
  %partial_reduction_result2.2.4 = phi double [ %add.3969.i672.1.3, %entry ], [ %add.3969.i672.1.4, %loop3.loop_header296.preheader.4 ]
  %77 = bitcast double %partial_reduction_result.2.4 to <2 x i32>
  %78 = extractelement <2 x i32> %77, i64 0
  %79 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %78, i32 16, i32 31)
  %80 = insertelement <2 x i32> poison, i32 %79, i64 0
  %81 = extractelement <2 x i32> %77, i64 1
  %82 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %81, i32 16, i32 31)
  %83 = insertelement <2 x i32> %80, i32 %82, i64 1
  %84 = bitcast <2 x i32> %83 to double
  %add.3969.i = fadd double %partial_reduction_result.2.4, %84
  %85 = bitcast double %add.3969.i to <2 x i32>
  %86 = extractelement <2 x i32> %85, i64 0
  %87 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %86, i32 8, i32 31)
  %88 = insertelement <2 x i32> poison, i32 %87, i64 0
  %89 = extractelement <2 x i32> %85, i64 1
  %90 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %89, i32 8, i32 31)
  %91 = insertelement <2 x i32> %88, i32 %90, i64 1
  %92 = bitcast <2 x i32> %91 to double
  %add.3969.i662 = fadd double %add.3969.i, %92
  %93 = bitcast double %add.3969.i662 to <2 x i32>
  %94 = extractelement <2 x i32> %93, i64 0
  %95 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %94, i32 4, i32 31)
  %96 = insertelement <2 x i32> poison, i32 %95, i64 0
  %97 = extractelement <2 x i32> %93, i64 1
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 4, i32 31)
  %99 = insertelement <2 x i32> %96, i32 %98, i64 1
  %100 = bitcast <2 x i32> %99 to double
  %add.3969.i663 = fadd double %add.3969.i662, %100
  %101 = bitcast double %add.3969.i663 to <2 x i32>
  %102 = extractelement <2 x i32> %101, i64 0
  %103 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %102, i32 2, i32 31)
  %104 = insertelement <2 x i32> poison, i32 %103, i64 0
  %105 = extractelement <2 x i32> %101, i64 1
  %106 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %105, i32 2, i32 31)
  %107 = insertelement <2 x i32> %104, i32 %106, i64 1
  %108 = bitcast <2 x i32> %107 to double
  %add.3969.i664 = fadd double %add.3969.i663, %108
  %109 = bitcast double %add.3969.i664 to <2 x i32>
  %110 = extractelement <2 x i32> %109, i64 0
  %111 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %110, i32 1, i32 31)
  %112 = extractelement <2 x i32> %109, i64 1
  %113 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %112, i32 1, i32 31)
  %114 = icmp eq i32 %thread.id.2, 0
  %115 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache10, i64 0, i64 %1, i64 0
  %116 = insertelement <2 x i32> poison, i32 %111, i64 0
  %117 = insertelement <2 x i32> %116, i32 %113, i64 1
  %118 = bitcast <2 x i32> %117 to double
  %add.3969.i665 = fadd double %add.3969.i664, %118
  br i1 %114, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %x_in_tile-after.7, %intra_warp_reduce_write-true
  %119 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %120 = zext nneg i32 %thread.id.2 to i64
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg5710, i64 0, i64 %1
  %121 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache10, i64 0, i64 %1, i64 %120
  br i1 %119, label %reduction_write_output-true, label %thread_in_bounds-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i665, ptr addrspace(3) %115, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %121, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %thread_in_bounds-after

intra_warp_reduce_write-after639:                 ; preds = %intra_warp_reduce_write-true638, %thread_in_bounds-after
  %122 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address645 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg6712, i64 0, i64 %1
  %123 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache11, i64 0, i64 %1, i64 %120
  br i1 %122, label %reduction_write_output-true643, label %reduce-group-0-after

intra_warp_reduce_write-true638:                  ; preds = %thread_in_bounds-after
  store double %add.3969.i670, ptr addrspace(3) %67, align 8
  br label %intra_warp_reduce_write-after639

reduction_write_output-true643:                   ; preds = %intra_warp_reduce_write-after639
  %output646.then.val = load double, ptr addrspace(3) %123, align 8
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
define void @loop_select_fusion_2(ptr noalias nocapture align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture align 128 dereferenceable(768) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture align 128 dereferenceable(768) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg11, ptr noalias nocapture align 128 dereferenceable(768) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg13, ptr noalias nocapture align 128 dereferenceable(768) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg15, ptr noalias nocapture align 128 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg17, ptr noalias nocapture align 128 dereferenceable(768) %arg18, ptr noalias nocapture align 128 dereferenceable(768) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg20, ptr noalias nocapture align 128 dereferenceable(768) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg22, ptr noalias nocapture align 128 dereferenceable(768) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg25, ptr noalias nocapture align 128 dereferenceable(768) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg27, ptr noalias nocapture align 128 dereferenceable(768) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg29, ptr noalias nocapture align 128 dereferenceable(768) %arg30, ptr noalias nocapture align 128 dereferenceable(768) %arg31, ptr noalias nocapture align 128 dereferenceable(768) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg33, ptr noalias nocapture align 128 dereferenceable(768) %arg34, ptr noalias nocapture align 128 dereferenceable(768) %arg35, ptr noalias nocapture align 128 dereferenceable(768) %arg36, ptr noalias nocapture align 128 dereferenceable(768) %arg37, ptr noalias nocapture align 128 dereferenceable(768) %arg38, ptr noalias nocapture align 128 dereferenceable(768) %arg39, ptr noalias nocapture align 128 dereferenceable(768) %arg40, ptr noalias nocapture align 128 dereferenceable(768) %arg41, ptr noalias nocapture align 128 dereferenceable(768) %arg42, ptr noalias nocapture align 128 dereferenceable(768) %arg43, ptr noalias nocapture align 128 dereferenceable(768) %arg44, ptr noalias nocapture align 128 dereferenceable(768) %arg45, ptr noalias nocapture align 128 dereferenceable(768) %arg46, ptr noalias nocapture align 128 dereferenceable(768) %arg47, ptr noalias nocapture align 128 dereferenceable(768) %arg48, ptr noalias nocapture align 128 dereferenceable(768) %arg49, ptr noalias nocapture align 128 dereferenceable(768) %arg50, ptr noalias nocapture align 128 dereferenceable(768) %arg51, ptr noalias nocapture align 128 dereferenceable(768) %arg52, ptr noalias nocapture align 128 dereferenceable(768) %arg53, ptr noalias nocapture align 128 dereferenceable(768) %arg54, ptr noalias nocapture align 128 dereferenceable(768) %arg55, ptr noalias nocapture align 128 dereferenceable(768) %arg56) local_unnamed_addr #2 {
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
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg416, i64 0, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !270
  %4 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg722, i64 0, i64 %1
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !270
  %6 = icmp sge i64 %3, %5
  %7 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg620, i64 0, i64 %1
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !270
  %9 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg518, i64 0, i64 %1
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !270
  %11 = or i8 %10, %8
  %12 = trunc i8 %11 to i1
  %.not1 = or i1 %6, %12
  %13 = icmp eq i64 %3, 0
  %14 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg110, i64 0, i64 %1
  %15 = load i8, ptr addrspace(1) %14, align 1, !invariant.load !270
  %16 = zext nneg i32 %0 to i64
  %17 = getelementptr double, ptr addrspace(1) %arg02, i64 %16
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = getelementptr double, ptr addrspace(1) %arg212, i64 %16
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !270
  %21 = getelementptr double, ptr addrspace(1) %arg314, i64 %16
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !270
  %add.4187.9 = fadd double %22, 6.000000e+00
  %multiply.3056.5 = fmul double %add.4187.9, 2.500000e-01
  %23 = fsub double %20, %multiply.3056.5
  %24 = trunc i8 %15 to i1
  %25 = select i1 %24, double %18, double %23
  %26 = select i1 %13, double %23, double %25
  %27 = select i1 %.not1, double %18, double %26
  %28 = getelementptr double, ptr addrspace(1) %arg824, i64 %16
  %29 = load double, ptr addrspace(1) %28, align 8
  %30 = getelementptr double, ptr addrspace(1) %arg926, i64 %16
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !270
  %32 = select i1 %24, double %29, double %31
  %33 = select i1 %13, double %31, double %32
  %34 = select i1 %.not1, double %29, double %33
  %35 = getelementptr double, ptr addrspace(1) %arg1028, i64 %16
  %36 = load double, ptr addrspace(1) %35, align 8
  %37 = getelementptr double, ptr addrspace(1) %arg1130, i64 %16
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !270
  %39 = select i1 %24, double %36, double %38
  %40 = select i1 %13, double %38, double %39
  %41 = select i1 %.not1, double %36, double %40
  %42 = getelementptr double, ptr addrspace(1) %arg1232, i64 %16
  %43 = load double, ptr addrspace(1) %42, align 8
  %44 = getelementptr double, ptr addrspace(1) %arg1334, i64 %16
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !270
  %46 = select i1 %24, double %43, double %45
  %47 = select i1 %13, double %45, double %46
  %48 = select i1 %.not1, double %43, double %47
  %49 = getelementptr double, ptr addrspace(1) %arg1436, i64 %16
  %50 = load double, ptr addrspace(1) %49, align 8
  %51 = getelementptr double, ptr addrspace(1) %arg1538, i64 %16
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !270
  %53 = select i1 %24, double %50, double %52
  %54 = select i1 %13, double %52, double %53
  %55 = select i1 %.not1, double %50, double %54
  %56 = getelementptr double, ptr addrspace(1) %arg1640, i64 %16
  %57 = load double, ptr addrspace(1) %56, align 8
  %58 = getelementptr double, ptr addrspace(1) %arg1742, i64 %16
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !270
  %60 = select i1 %24, double %57, double %59
  %61 = select i1 %13, double %59, double %60
  %62 = select i1 %.not1, double %57, double %61
  %63 = getelementptr double, ptr addrspace(1) %arg1844, i64 %16
  %64 = load double, ptr addrspace(1) %63, align 8
  %65 = select i1 %24, double %64, double %22
  %66 = select i1 %13, double %22, double %65
  %67 = select i1 %.not1, double %64, double %66
  %68 = getelementptr double, ptr addrspace(1) %arg1946, i64 %16
  %69 = load double, ptr addrspace(1) %68, align 8
  %70 = getelementptr double, ptr addrspace(1) %arg2048, i64 %16
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !270
  %add.4206.3.clone.1 = fsub double %71, %38
  %72 = select i1 %24, double %69, double %add.4206.3.clone.1
  %73 = select i1 %13, double %add.4206.3.clone.1, double %72
  %74 = select i1 %.not1, double %69, double %73
  %75 = getelementptr double, ptr addrspace(1) %arg2150, i64 %16
  %76 = load double, ptr addrspace(1) %75, align 8
  %77 = getelementptr double, ptr addrspace(1) %arg2252, i64 %16
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !270
  %add.4192.9.clone.1 = fadd double %31, -1.000000e+00
  %multiply.3046.5.clone.1 = fmul double %add.4192.9.clone.1, 4.000000e+00
  %79 = fsub double %78, %multiply.3046.5.clone.1
  %80 = select i1 %24, double %76, double %79
  %81 = select i1 %13, double %79, double %80
  %82 = select i1 %.not1, double %76, double %81
  %83 = getelementptr double, ptr addrspace(1) %arg2354, i64 %16
  %84 = load double, ptr addrspace(1) %83, align 8
  %85 = getelementptr double, ptr addrspace(1) %arg2456, i64 %16
  %86 = load double, ptr addrspace(1) %85, align 8, !invariant.load !270
  %87 = getelementptr double, ptr addrspace(1) %arg2558, i64 %16
  %88 = load double, ptr addrspace(1) %87, align 8, !invariant.load !270
  %multiply.3049.3.clone.1 = fmul double %86, %88
  %add.4178.9.clone.1 = fadd double %45, 0xBFF62E42FEFA39EF
  %multiply.3050.5.clone.1 = fmul double %add.4178.9.clone.1, 0x3FFC71C71C71C71C
  %89 = fsub double %multiply.3049.3.clone.1, %multiply.3050.5.clone.1
  %90 = select i1 %24, double %84, double %89
  %91 = select i1 %13, double %89, double %90
  %92 = select i1 %.not1, double %84, double %91
  %93 = getelementptr double, ptr addrspace(1) %arg2660, i64 %16
  %94 = load double, ptr addrspace(1) %93, align 8
  %95 = getelementptr double, ptr addrspace(1) %arg2762, i64 %16
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !270
  %add.4197.9.clone.1 = fadd double %52, -1.000000e+00
  %add.4214.3.clone.1 = fsub double %96, %add.4197.9.clone.1
  %97 = select i1 %24, double %94, double %add.4214.3.clone.1
  %98 = select i1 %13, double %add.4214.3.clone.1, double %97
  %99 = select i1 %.not1, double %94, double %98
  %100 = getelementptr double, ptr addrspace(1) %arg2864, i64 %16
  %101 = load double, ptr addrspace(1) %100, align 8
  %102 = getelementptr double, ptr addrspace(1) %arg2966, i64 %16
  %103 = load double, ptr addrspace(1) %102, align 8, !invariant.load !270
  %add.4174.9.clone.1 = fadd double %59, 4.000000e+00
  %multiply.3054.5.clone.1 = fmul double %add.4174.9.clone.1, 2.500000e-01
  %104 = fsub double %103, %multiply.3054.5.clone.1
  %105 = select i1 %24, double %101, double %104
  %106 = select i1 %13, double %104, double %105
  %107 = select i1 %.not1, double %101, double %106
  %108 = getelementptr double, ptr addrspace(1) %arg3068, i64 %16
  %109 = load double, ptr addrspace(1) %108, align 8
  %110 = getelementptr double, ptr addrspace(1) %arg3170, i64 %16
  %111 = load double, ptr addrspace(1) %110, align 8
  %112 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg3374, i64 0, i64 %1
  %113 = load i64, ptr addrspace(1) %112, align 8, !invariant.load !270
  %114 = sitofp i64 %113 to double
  %multiply.3002.23.clone.1 = fmul double %114, 0x3F718590FECF82C5
  %115 = getelementptr double, ptr addrspace(1) %arg3272, i64 %16
  %116 = load double, ptr addrspace(1) %115, align 8
  %multiply.3005.15.clone.1 = fmul double %116, %multiply.3002.23.clone.1
  %add.4167.13.clone.1 = fadd double %111, %multiply.3005.15.clone.1
  %multiply.3051.11.clone.1 = fmul double %89, %multiply.3002.23.clone.1
  %add.4213.9.clone.1 = fadd double %multiply.3051.11.clone.1, %add.4167.13.clone.1
  %add.4232.5.clone.1 = fadd double %109, %add.4213.9.clone.1
  %117 = select i1 %13, double %add.4213.9.clone.1, double %add.4232.5.clone.1
  %118 = select i1 %.not1, double %109, double %117
  %119 = getelementptr double, ptr addrspace(1) %arg3476, i64 %16
  %120 = load double, ptr addrspace(1) %119, align 8
  %121 = select i1 %13, double %89, double %120
  %122 = select i1 %.not1, double %120, double %121
  %123 = select i1 %.not1, double %116, double %89
  %124 = getelementptr double, ptr addrspace(1) %arg3578, i64 %16
  %125 = load double, ptr addrspace(1) %124, align 8
  %126 = select i1 %13, double %add.4213.9.clone.1, double %125
  %127 = select i1 %.not1, double %125, double %126
  %128 = select i1 %.not1, double %111, double %add.4213.9.clone.1
  %129 = getelementptr double, ptr addrspace(1) %arg3680, i64 %16
  %130 = load double, ptr addrspace(1) %129, align 8
  %131 = select i1 %.not1, double %130, double %23
  %132 = getelementptr double, ptr addrspace(1) %arg3782, i64 %16
  %133 = load double, ptr addrspace(1) %132, align 8
  %134 = select i1 %13, double %23, double %133
  %135 = select i1 %.not1, double %133, double %134
  %136 = getelementptr double, ptr addrspace(1) %arg3884, i64 %16
  %137 = load double, ptr addrspace(1) %136, align 8
  %138 = getelementptr double, ptr addrspace(1) %arg3986, i64 %16
  %139 = load double, ptr addrspace(1) %138, align 8
  %multiply.3008.9.clone.1 = fmul double %multiply.3002.23.clone.1, %130
  %add.4171.7.clone.1 = fadd double %multiply.3008.9.clone.1, %139
  %multiply.3057.5.clone.1 = fmul double %23, %multiply.3002.23.clone.1
  %add.4221.3.clone.1 = fadd double %multiply.3057.5.clone.1, %add.4171.7.clone.1
  %140 = select i1 %13, double %add.4221.3.clone.1, double %137
  %141 = select i1 %.not1, double %137, double %140
  %142 = getelementptr double, ptr addrspace(1) %arg4088, i64 %16
  %143 = load double, ptr addrspace(1) %142, align 8
  %add.4236.5.clone.1 = fadd double %143, %add.4221.3.clone.1
  %144 = select i1 %13, double %add.4221.3.clone.1, double %add.4236.5.clone.1
  %145 = select i1 %.not1, double %143, double %144
  %146 = select i1 %.not1, double %139, double %add.4221.3.clone.1
  %147 = getelementptr double, ptr addrspace(1) %arg4190, i64 %16
  %148 = load double, ptr addrspace(1) %147, align 8
  %149 = select i1 %.not1, double %148, double %104
  %150 = getelementptr double, ptr addrspace(1) %arg4292, i64 %16
  %151 = load double, ptr addrspace(1) %150, align 8
  %152 = select i1 %13, double %104, double %151
  %153 = select i1 %.not1, double %151, double %152
  %154 = getelementptr double, ptr addrspace(1) %arg4394, i64 %16
  %155 = load double, ptr addrspace(1) %154, align 8
  %156 = getelementptr double, ptr addrspace(1) %arg4496, i64 %16
  %157 = load double, ptr addrspace(1) %156, align 8
  %multiply.3007.9.clone.1 = fmul double %multiply.3002.23.clone.1, %148
  %add.4169.7.clone.1 = fadd double %multiply.3007.9.clone.1, %157
  %multiply.3055.5.clone.1 = fmul double %104, %multiply.3002.23.clone.1
  %add.4218.3.clone.1 = fadd double %multiply.3055.5.clone.1, %add.4169.7.clone.1
  %158 = select i1 %13, double %add.4218.3.clone.1, double %155
  %159 = select i1 %.not1, double %155, double %158
  %160 = getelementptr double, ptr addrspace(1) %arg4598, i64 %16
  %161 = load double, ptr addrspace(1) %160, align 8
  %add.4234.5.clone.1 = fadd double %161, %add.4218.3.clone.1
  %162 = select i1 %13, double %add.4218.3.clone.1, double %add.4234.5.clone.1
  %163 = select i1 %.not1, double %161, double %162
  %164 = select i1 %.not1, double %157, double %add.4218.3.clone.1
  %165 = getelementptr double, ptr addrspace(1) %arg46100, i64 %16
  %166 = load double, ptr addrspace(1) %165, align 8
  %167 = select i1 %.not1, double %166, double %add.4214.3.clone.1
  %168 = getelementptr double, ptr addrspace(1) %arg47102, i64 %16
  %169 = load double, ptr addrspace(1) %168, align 8
  %170 = select i1 %13, double %add.4214.3.clone.1, double %169
  %171 = select i1 %.not1, double %169, double %170
  %172 = getelementptr double, ptr addrspace(1) %arg48104, i64 %16
  %173 = load double, ptr addrspace(1) %172, align 8
  %174 = getelementptr double, ptr addrspace(1) %arg49106, i64 %16
  %175 = load double, ptr addrspace(1) %174, align 8
  %multiply.3006.9.clone.1 = fmul double %multiply.3002.23.clone.1, %166
  %add.4168.7.clone.1 = fadd double %multiply.3006.9.clone.1, %175
  %multiply.3053.5.clone.1 = fmul double %add.4214.3.clone.1, %multiply.3002.23.clone.1
  %add.4216.3.clone.1 = fadd double %multiply.3053.5.clone.1, %add.4168.7.clone.1
  %176 = select i1 %13, double %add.4216.3.clone.1, double %173
  %177 = select i1 %.not1, double %173, double %176
  %178 = getelementptr double, ptr addrspace(1) %arg50108, i64 %16
  %179 = load double, ptr addrspace(1) %178, align 8
  %add.4233.5.clone.1 = fadd double %179, %add.4216.3.clone.1
  %180 = select i1 %13, double %add.4216.3.clone.1, double %add.4233.5.clone.1
  %181 = select i1 %.not1, double %179, double %180
  %182 = select i1 %.not1, double %175, double %add.4216.3.clone.1
  %183 = getelementptr double, ptr addrspace(1) %arg51110, i64 %16
  %184 = load double, ptr addrspace(1) %183, align 8
  %185 = select i1 %.not1, double %184, double %79
  %186 = getelementptr double, ptr addrspace(1) %arg52112, i64 %16
  %187 = load double, ptr addrspace(1) %186, align 8
  %188 = select i1 %13, double %79, double %187
  %189 = select i1 %.not1, double %187, double %188
  %190 = getelementptr double, ptr addrspace(1) %arg53114, i64 %16
  %191 = load double, ptr addrspace(1) %190, align 8
  %192 = getelementptr double, ptr addrspace(1) %arg54116, i64 %16
  %193 = load double, ptr addrspace(1) %192, align 8
  %multiply.3004.9.clone.1 = fmul double %multiply.3002.23.clone.1, %184
  %add.4166.7.clone.1 = fadd double %multiply.3004.9.clone.1, %193
  %multiply.3047.5.clone.1 = fmul double %79, %multiply.3002.23.clone.1
  %add.4211.3.clone.1 = fadd double %multiply.3047.5.clone.1, %add.4166.7.clone.1
  %194 = select i1 %13, double %add.4211.3.clone.1, double %191
  %195 = select i1 %.not1, double %191, double %194
  %196 = getelementptr double, ptr addrspace(1) %arg55118, i64 %16
  %197 = load double, ptr addrspace(1) %196, align 8
  %add.4231.5.clone.1 = fadd double %197, %add.4211.3.clone.1
  %198 = select i1 %13, double %add.4211.3.clone.1, double %add.4231.5.clone.1
  %199 = select i1 %.not1, double %197, double %198
  %200 = select i1 %.not1, double %193, double %add.4211.3.clone.1
  %201 = getelementptr double, ptr addrspace(1) %arg56120, i64 %16
  %202 = load double, ptr addrspace(1) %201, align 8
  %203 = select i1 %.not1, double %202, double %add.4206.3.clone.1
  store double %27, ptr addrspace(1) %17, align 8
  store double %34, ptr addrspace(1) %28, align 8
  store double %41, ptr addrspace(1) %35, align 8
  store double %48, ptr addrspace(1) %42, align 8
  store double %55, ptr addrspace(1) %49, align 8
  store double %62, ptr addrspace(1) %56, align 8
  store double %67, ptr addrspace(1) %63, align 8
  store double %74, ptr addrspace(1) %68, align 8
  store double %82, ptr addrspace(1) %75, align 8
  store double %92, ptr addrspace(1) %83, align 8
  store double %99, ptr addrspace(1) %93, align 8
  store double %107, ptr addrspace(1) %100, align 8
  store double %118, ptr addrspace(1) %108, align 8
  store double %122, ptr addrspace(1) %119, align 8
  store double %123, ptr addrspace(1) %115, align 8
  store double %127, ptr addrspace(1) %124, align 8
  store double %128, ptr addrspace(1) %110, align 8
  store double %131, ptr addrspace(1) %129, align 8
  store double %135, ptr addrspace(1) %132, align 8
  store double %141, ptr addrspace(1) %136, align 8
  store double %145, ptr addrspace(1) %142, align 8
  store double %146, ptr addrspace(1) %138, align 8
  store double %149, ptr addrspace(1) %147, align 8
  store double %153, ptr addrspace(1) %150, align 8
  store double %159, ptr addrspace(1) %154, align 8
  store double %163, ptr addrspace(1) %160, align 8
  store double %164, ptr addrspace(1) %156, align 8
  store double %167, ptr addrspace(1) %165, align 8
  store double %171, ptr addrspace(1) %168, align 8
  store double %177, ptr addrspace(1) %172, align 8
  store double %181, ptr addrspace(1) %178, align 8
  store double %182, ptr addrspace(1) %174, align 8
  store double %185, ptr addrspace(1) %183, align 8
  store double %189, ptr addrspace(1) %186, align 8
  store double %195, ptr addrspace(1) %190, align 8
  store double %199, ptr addrspace(1) %196, align 8
  store double %200, ptr addrspace(1) %192, align 8
  store double %203, ptr addrspace(1) %201, align 8
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
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg10, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg12, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg14, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg16, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(4608) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(4608) %arg38) local_unnamed_addr #10 {
entry:
  %arg38244 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37242 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36240 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35238 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34236 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33234 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32232 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31230 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30228 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29226 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28224 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27222 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26220 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25218 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24216 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23214 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22212 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21210 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20208 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19206 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18204 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg16200 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg14196 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg12192 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg10188 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg8184 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg6180 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5178 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4176 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3174 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2172 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1170 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0168 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !272
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 288
  %4 = mul i16 %3, 288
  %.decomposed = sub i16 %.lhs.trunc, %4
  %.zext = zext nneg i16 %.decomposed to i32
  %.zext142 = zext nneg i16 %3 to i32
  %5 = icmp ult i32 %linear_index, 576
  br i1 %5, label %concatenate.pivot.144., label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %concatenate.44.2.merge118, %entry
  ret void

concatenate.pivot.144.:                           ; preds = %entry
  %6 = icmp ult i16 %.decomposed, 144
  br i1 %6, label %concatenate.pivot.48., label %concatenate.pivot.192.

concatenate.pivot.48.:                            ; preds = %concatenate.pivot.144.
  %7 = icmp ult i16 %.decomposed, 48
  br i1 %7, label %concatenate.pivot.0., label %concatenate.pivot.96.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.48.
  %8 = mul nuw nsw i32 %.zext142, 48
  %9 = zext nneg i16 %3 to i64
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg18204, i64 0, i64 %9
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !270
  %12 = zext nneg i32 %8 to i64
  %13 = getelementptr double, ptr addrspace(1) %arg16200, i64 %12
  %14 = zext nneg i16 %.decomposed to i64
  %15 = getelementptr inbounds double, ptr addrspace(1) %13, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !270
  %17 = trunc i8 %11 to i1
  %18 = getelementptr double, ptr addrspace(1) %arg5178, i64 %12
  %19 = getelementptr inbounds double, ptr addrspace(1) %18, i64 %14
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !270
  %21 = select i1 %17, double %16, double %20
  br label %concatenate.pivot.144.12

concatenate.pivot.96.:                            ; preds = %concatenate.pivot.48.
  %22 = icmp ult i16 %.decomposed, 96
  %23 = mul nuw nsw i32 %.zext142, 48
  %24 = zext nneg i16 %3 to i64
  %25 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg18204, i64 0, i64 %24
  %26 = load i8, ptr addrspace(1) %25, align 1, !invariant.load !270
  %27 = zext nneg i32 %23 to i64
  %28 = trunc i8 %26 to i1
  br i1 %22, label %concatenate.pivot.48.1, label %concatenate.pivot.96.2

concatenate.pivot.48.1:                           ; preds = %concatenate.pivot.96.
  %29 = add nsw i32 %.zext, -48
  %30 = getelementptr double, ptr addrspace(1) %arg14196, i64 %27
  %31 = zext nneg i32 %29 to i64
  %32 = getelementptr inbounds double, ptr addrspace(1) %30, i64 %31
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !270
  %34 = getelementptr double, ptr addrspace(1) %arg4176, i64 %27
  %35 = getelementptr inbounds double, ptr addrspace(1) %34, i64 %31
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !270
  %37 = select i1 %28, double %33, double %36
  br label %concatenate.pivot.144.12

concatenate.pivot.96.2:                           ; preds = %concatenate.pivot.96.
  %38 = add nsw i32 %.zext, -96
  %39 = getelementptr double, ptr addrspace(1) %arg12192, i64 %27
  %40 = zext nneg i32 %38 to i64
  %41 = getelementptr inbounds double, ptr addrspace(1) %39, i64 %40
  %42 = load double, ptr addrspace(1) %41, align 8, !invariant.load !270
  %43 = getelementptr double, ptr addrspace(1) %arg3174, i64 %27
  %44 = getelementptr inbounds double, ptr addrspace(1) %43, i64 %40
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !270
  %46 = select i1 %28, double %42, double %45
  br label %concatenate.pivot.144.12

concatenate.pivot.192.:                           ; preds = %concatenate.pivot.144.
  %47 = icmp ult i16 %.decomposed, 192
  %48 = mul nuw nsw i32 %.zext142, 48
  %49 = zext nneg i16 %3 to i64
  %50 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg18204, i64 0, i64 %49
  %51 = load i8, ptr addrspace(1) %50, align 1, !invariant.load !270
  %52 = zext nneg i32 %48 to i64
  br i1 %47, label %concatenate.pivot.144.3, label %concatenate.pivot.240.

concatenate.pivot.144.3:                          ; preds = %concatenate.pivot.192.
  %53 = add nsw i32 %.zext, -144
  %54 = getelementptr double, ptr addrspace(1) %arg10188, i64 %52
  %55 = zext nneg i32 %53 to i64
  %56 = getelementptr inbounds double, ptr addrspace(1) %54, i64 %55
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !270
  %58 = trunc i8 %51 to i1
  %59 = getelementptr double, ptr addrspace(1) %arg2172, i64 %52
  %60 = getelementptr inbounds double, ptr addrspace(1) %59, i64 %55
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !270
  %62 = select i1 %58, double %57, double %61
  br label %concatenate.pivot.144.12

concatenate.pivot.240.:                           ; preds = %concatenate.pivot.192.
  %63 = icmp ult i16 %.decomposed, 240
  %64 = trunc i8 %51 to i1
  br i1 %63, label %concatenate.pivot.192.4, label %concatenate.pivot.240.5

concatenate.pivot.192.4:                          ; preds = %concatenate.pivot.240.
  %65 = add nsw i32 %.zext, -192
  %66 = getelementptr double, ptr addrspace(1) %arg8184, i64 %52
  %67 = zext nneg i32 %65 to i64
  %68 = getelementptr inbounds double, ptr addrspace(1) %66, i64 %67
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !270
  %70 = getelementptr double, ptr addrspace(1) %arg1170, i64 %52
  %71 = getelementptr inbounds double, ptr addrspace(1) %70, i64 %67
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !270
  %73 = select i1 %64, double %69, double %72
  br label %concatenate.pivot.144.12

concatenate.pivot.240.5:                          ; preds = %concatenate.pivot.240.
  %74 = add nsw i32 %.zext, -240
  %75 = getelementptr double, ptr addrspace(1) %arg6180, i64 %52
  %76 = zext nneg i32 %74 to i64
  %77 = getelementptr inbounds double, ptr addrspace(1) %75, i64 %76
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !270
  %79 = getelementptr double, ptr addrspace(1) %arg0168, i64 %52
  %80 = getelementptr inbounds double, ptr addrspace(1) %79, i64 %76
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !270
  %82 = select i1 %64, double %78, double %81
  br label %concatenate.pivot.144.12

concatenate.pivot.144.12:                         ; preds = %concatenate.pivot.0., %concatenate.pivot.48.1, %concatenate.pivot.96.2, %concatenate.pivot.144.3, %concatenate.pivot.192.4, %concatenate.pivot.240.5
  %.off0 = phi i1 [ %17, %concatenate.pivot.0. ], [ %28, %concatenate.pivot.48.1 ], [ %28, %concatenate.pivot.96.2 ], [ %58, %concatenate.pivot.144.3 ], [ %64, %concatenate.pivot.192.4 ], [ %64, %concatenate.pivot.240.5 ]
  %83 = phi double [ %21, %concatenate.pivot.0. ], [ %37, %concatenate.pivot.48.1 ], [ %46, %concatenate.pivot.96.2 ], [ %62, %concatenate.pivot.144.3 ], [ %73, %concatenate.pivot.192.4 ], [ %82, %concatenate.pivot.240.5 ]
  %84 = icmp ult i16 %.decomposed, 144
  br i1 %84, label %concatenate.pivot.48.13, label %concatenate.pivot.192.18

concatenate.pivot.48.13:                          ; preds = %concatenate.pivot.144.12
  %85 = icmp ult i16 %.decomposed, 48
  br i1 %85, label %concatenate.pivot.0.14, label %concatenate.pivot.96.15

concatenate.pivot.0.14:                           ; preds = %concatenate.pivot.48.13
  %86 = mul nuw nsw i32 %.zext142, 48
  %87 = zext nneg i32 %86 to i64
  %88 = getelementptr double, ptr addrspace(1) %arg36240, i64 %87
  %89 = zext nneg i16 %.decomposed to i64
  %90 = getelementptr inbounds double, ptr addrspace(1) %88, i64 %89
  %91 = getelementptr double, ptr addrspace(1) %arg35238, i64 %87
  %92 = getelementptr inbounds double, ptr addrspace(1) %91, i64 %89
  br label %concatenate.pivot.144.29

concatenate.pivot.96.15:                          ; preds = %concatenate.pivot.48.13
  %93 = icmp ult i16 %.decomposed, 96
  %94 = mul nuw nsw i32 %.zext142, 48
  %95 = zext nneg i32 %94 to i64
  br i1 %93, label %concatenate.pivot.48.16, label %concatenate.pivot.96.17

concatenate.pivot.48.16:                          ; preds = %concatenate.pivot.96.15
  %96 = add nsw i32 %.zext, -48
  %97 = getelementptr double, ptr addrspace(1) %arg34236, i64 %95
  %98 = zext nneg i32 %96 to i64
  %99 = getelementptr inbounds double, ptr addrspace(1) %97, i64 %98
  %100 = getelementptr double, ptr addrspace(1) %arg33234, i64 %95
  %101 = getelementptr inbounds double, ptr addrspace(1) %100, i64 %98
  br label %concatenate.pivot.144.29

concatenate.pivot.96.17:                          ; preds = %concatenate.pivot.96.15
  %102 = add nsw i32 %.zext, -96
  %103 = getelementptr double, ptr addrspace(1) %arg32232, i64 %95
  %104 = zext nneg i32 %102 to i64
  %105 = getelementptr inbounds double, ptr addrspace(1) %103, i64 %104
  %106 = getelementptr double, ptr addrspace(1) %arg31230, i64 %95
  %107 = getelementptr inbounds double, ptr addrspace(1) %106, i64 %104
  br label %concatenate.pivot.144.29

concatenate.pivot.192.18:                         ; preds = %concatenate.pivot.144.12
  %108 = icmp ult i16 %.decomposed, 192
  %109 = mul nuw nsw i32 %.zext142, 48
  %110 = zext nneg i32 %109 to i64
  br i1 %108, label %concatenate.pivot.144.19, label %concatenate.pivot.240.20

concatenate.pivot.144.19:                         ; preds = %concatenate.pivot.192.18
  %111 = add nsw i32 %.zext, -144
  %112 = getelementptr double, ptr addrspace(1) %arg30228, i64 %110
  %113 = zext nneg i32 %111 to i64
  %114 = getelementptr inbounds double, ptr addrspace(1) %112, i64 %113
  %115 = getelementptr double, ptr addrspace(1) %arg29226, i64 %110
  %116 = getelementptr inbounds double, ptr addrspace(1) %115, i64 %113
  br label %concatenate.pivot.144.29

concatenate.pivot.240.20:                         ; preds = %concatenate.pivot.192.18
  %117 = icmp ult i16 %.decomposed, 240
  br i1 %117, label %concatenate.pivot.192.21, label %concatenate.pivot.240.22

concatenate.pivot.192.21:                         ; preds = %concatenate.pivot.240.20
  %118 = add nsw i32 %.zext, -192
  %119 = getelementptr double, ptr addrspace(1) %arg28224, i64 %110
  %120 = zext nneg i32 %118 to i64
  %121 = getelementptr inbounds double, ptr addrspace(1) %119, i64 %120
  %122 = getelementptr double, ptr addrspace(1) %arg27222, i64 %110
  %123 = getelementptr inbounds double, ptr addrspace(1) %122, i64 %120
  br label %concatenate.pivot.144.29

concatenate.pivot.240.22:                         ; preds = %concatenate.pivot.240.20
  %124 = add nsw i32 %.zext, -240
  %125 = getelementptr double, ptr addrspace(1) %arg26220, i64 %110
  %126 = zext nneg i32 %124 to i64
  %127 = getelementptr inbounds double, ptr addrspace(1) %125, i64 %126
  %128 = getelementptr double, ptr addrspace(1) %arg25218, i64 %110
  %129 = getelementptr inbounds double, ptr addrspace(1) %128, i64 %126
  br label %concatenate.pivot.144.29

concatenate.pivot.144.29:                         ; preds = %concatenate.pivot.0.14, %concatenate.pivot.48.16, %concatenate.pivot.96.17, %concatenate.pivot.144.19, %concatenate.pivot.192.21, %concatenate.pivot.240.22
  %.sink149 = phi ptr addrspace(1) [ %92, %concatenate.pivot.0.14 ], [ %101, %concatenate.pivot.48.16 ], [ %107, %concatenate.pivot.96.17 ], [ %116, %concatenate.pivot.144.19 ], [ %123, %concatenate.pivot.192.21 ], [ %129, %concatenate.pivot.240.22 ]
  %.sink.in = phi ptr addrspace(1) [ %90, %concatenate.pivot.0.14 ], [ %99, %concatenate.pivot.48.16 ], [ %105, %concatenate.pivot.96.17 ], [ %114, %concatenate.pivot.144.19 ], [ %121, %concatenate.pivot.192.21 ], [ %127, %concatenate.pivot.240.22 ]
  %130 = icmp ult i16 %.decomposed, 144
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !270
  %131 = load double, ptr addrspace(1) %.sink149, align 8, !invariant.load !270
  %add.4425.11 = fadd double %.sink, %131
  br i1 %130, label %concatenate.pivot.48.30, label %concatenate.pivot.192.35

concatenate.pivot.48.30:                          ; preds = %concatenate.pivot.144.29
  %132 = icmp ult i16 %.decomposed, 48
  br i1 %132, label %concatenate.pivot.0.31, label %concatenate.pivot.96.32

concatenate.pivot.0.31:                           ; preds = %concatenate.pivot.48.30
  %133 = mul nuw nsw i32 %.zext142, 48
  %134 = zext nneg i32 %133 to i64
  %135 = getelementptr double, ptr addrspace(1) %arg24216, i64 %134
  %136 = zext nneg i16 %.decomposed to i64
  %137 = getelementptr inbounds double, ptr addrspace(1) %135, i64 %136
  %138 = getelementptr double, ptr addrspace(1) %arg16200, i64 %134
  %139 = getelementptr inbounds double, ptr addrspace(1) %138, i64 %136
  br label %concatenate.pivot.144.47

concatenate.pivot.96.32:                          ; preds = %concatenate.pivot.48.30
  %140 = icmp ult i16 %.decomposed, 96
  %141 = mul nuw nsw i32 %.zext142, 48
  %142 = zext nneg i32 %141 to i64
  br i1 %140, label %concatenate.pivot.48.33, label %concatenate.pivot.96.34

concatenate.pivot.48.33:                          ; preds = %concatenate.pivot.96.32
  %143 = add nsw i32 %.zext, -48
  %144 = getelementptr double, ptr addrspace(1) %arg23214, i64 %142
  %145 = zext nneg i32 %143 to i64
  %146 = getelementptr inbounds double, ptr addrspace(1) %144, i64 %145
  %147 = getelementptr double, ptr addrspace(1) %arg14196, i64 %142
  %148 = getelementptr inbounds double, ptr addrspace(1) %147, i64 %145
  br label %concatenate.pivot.144.47

concatenate.pivot.96.34:                          ; preds = %concatenate.pivot.96.32
  %149 = add nsw i32 %.zext, -96
  %150 = getelementptr double, ptr addrspace(1) %arg22212, i64 %142
  %151 = zext nneg i32 %149 to i64
  %152 = getelementptr inbounds double, ptr addrspace(1) %150, i64 %151
  %153 = getelementptr double, ptr addrspace(1) %arg12192, i64 %142
  %154 = getelementptr inbounds double, ptr addrspace(1) %153, i64 %151
  br label %concatenate.pivot.144.47

concatenate.pivot.192.35:                         ; preds = %concatenate.pivot.144.29
  %155 = icmp ult i16 %.decomposed, 192
  %156 = mul nuw nsw i32 %.zext142, 48
  %157 = zext nneg i32 %156 to i64
  br i1 %155, label %concatenate.pivot.144.36, label %concatenate.pivot.240.37

concatenate.pivot.144.36:                         ; preds = %concatenate.pivot.192.35
  %158 = add nsw i32 %.zext, -144
  %159 = getelementptr double, ptr addrspace(1) %arg21210, i64 %157
  %160 = zext nneg i32 %158 to i64
  %161 = getelementptr inbounds double, ptr addrspace(1) %159, i64 %160
  %162 = getelementptr double, ptr addrspace(1) %arg10188, i64 %157
  %163 = getelementptr inbounds double, ptr addrspace(1) %162, i64 %160
  br label %concatenate.pivot.144.47

concatenate.pivot.240.37:                         ; preds = %concatenate.pivot.192.35
  %164 = icmp ult i16 %.decomposed, 240
  br i1 %164, label %concatenate.pivot.192.38, label %concatenate.pivot.240.39

concatenate.pivot.192.38:                         ; preds = %concatenate.pivot.240.37
  %165 = add nsw i32 %.zext, -192
  %166 = getelementptr double, ptr addrspace(1) %arg20208, i64 %157
  %167 = zext nneg i32 %165 to i64
  %168 = getelementptr inbounds double, ptr addrspace(1) %166, i64 %167
  %169 = getelementptr double, ptr addrspace(1) %arg8184, i64 %157
  %170 = getelementptr inbounds double, ptr addrspace(1) %169, i64 %167
  br label %concatenate.pivot.144.47

concatenate.pivot.240.39:                         ; preds = %concatenate.pivot.240.37
  %171 = add nsw i32 %.zext, -240
  %172 = getelementptr double, ptr addrspace(1) %arg19206, i64 %157
  %173 = zext nneg i32 %171 to i64
  %174 = getelementptr inbounds double, ptr addrspace(1) %172, i64 %173
  %175 = getelementptr double, ptr addrspace(1) %arg6180, i64 %157
  %176 = getelementptr inbounds double, ptr addrspace(1) %175, i64 %173
  br label %concatenate.pivot.144.47

concatenate.pivot.144.47:                         ; preds = %concatenate.pivot.0.31, %concatenate.pivot.48.33, %concatenate.pivot.96.34, %concatenate.pivot.144.36, %concatenate.pivot.192.38, %concatenate.pivot.240.39
  %.sink152 = phi ptr addrspace(1) [ %139, %concatenate.pivot.0.31 ], [ %148, %concatenate.pivot.48.33 ], [ %154, %concatenate.pivot.96.34 ], [ %163, %concatenate.pivot.144.36 ], [ %170, %concatenate.pivot.192.38 ], [ %176, %concatenate.pivot.240.39 ]
  %.sink150.in = phi ptr addrspace(1) [ %137, %concatenate.pivot.0.31 ], [ %146, %concatenate.pivot.48.33 ], [ %152, %concatenate.pivot.96.34 ], [ %161, %concatenate.pivot.144.36 ], [ %168, %concatenate.pivot.192.38 ], [ %174, %concatenate.pivot.240.39 ]
  %177 = icmp ult i16 %.decomposed, 144
  %.sink150 = load double, ptr addrspace(1) %.sink150.in, align 8, !invariant.load !270
  %178 = load double, ptr addrspace(1) %.sink152, align 8, !invariant.load !270
  %179 = select i1 %.off0, double %.sink150, double %178
  br i1 %177, label %concatenate.pivot.48.48, label %concatenate.pivot.192.53

concatenate.pivot.48.48:                          ; preds = %concatenate.pivot.144.47
  %180 = icmp ult i16 %.decomposed, 48
  br i1 %180, label %concatenate.pivot.0.49, label %concatenate.pivot.96.50

concatenate.pivot.0.49:                           ; preds = %concatenate.pivot.48.48
  %181 = mul nuw nsw i32 %.zext142, 48
  %182 = zext nneg i32 %181 to i64
  %183 = getelementptr double, ptr addrspace(1) %arg16200, i64 %182
  %184 = zext nneg i16 %.decomposed to i64
  %185 = getelementptr inbounds double, ptr addrspace(1) %183, i64 %184
  %186 = getelementptr double, ptr addrspace(1) %arg5178, i64 %182
  %187 = getelementptr inbounds double, ptr addrspace(1) %186, i64 %184
  br label %concatenate.44.2.merge40

concatenate.pivot.96.50:                          ; preds = %concatenate.pivot.48.48
  %188 = icmp ult i16 %.decomposed, 96
  %189 = mul nuw nsw i32 %.zext142, 48
  %190 = zext nneg i32 %189 to i64
  br i1 %188, label %concatenate.pivot.48.51, label %concatenate.pivot.96.52

concatenate.pivot.48.51:                          ; preds = %concatenate.pivot.96.50
  %191 = add nsw i32 %.zext, -48
  %192 = getelementptr double, ptr addrspace(1) %arg14196, i64 %190
  %193 = zext nneg i32 %191 to i64
  %194 = getelementptr inbounds double, ptr addrspace(1) %192, i64 %193
  %195 = getelementptr double, ptr addrspace(1) %arg4176, i64 %190
  %196 = getelementptr inbounds double, ptr addrspace(1) %195, i64 %193
  br label %concatenate.44.2.merge40

concatenate.pivot.96.52:                          ; preds = %concatenate.pivot.96.50
  %197 = add nsw i32 %.zext, -96
  %198 = getelementptr double, ptr addrspace(1) %arg12192, i64 %190
  %199 = zext nneg i32 %197 to i64
  %200 = getelementptr inbounds double, ptr addrspace(1) %198, i64 %199
  %201 = getelementptr double, ptr addrspace(1) %arg3174, i64 %190
  %202 = getelementptr inbounds double, ptr addrspace(1) %201, i64 %199
  br label %concatenate.44.2.merge40

concatenate.pivot.192.53:                         ; preds = %concatenate.pivot.144.47
  %203 = icmp ult i16 %.decomposed, 192
  %204 = mul nuw nsw i32 %.zext142, 48
  %205 = zext nneg i32 %204 to i64
  br i1 %203, label %concatenate.pivot.144.54, label %concatenate.pivot.240.55

concatenate.pivot.144.54:                         ; preds = %concatenate.pivot.192.53
  %206 = add nsw i32 %.zext, -144
  %207 = getelementptr double, ptr addrspace(1) %arg10188, i64 %205
  %208 = zext nneg i32 %206 to i64
  %209 = getelementptr inbounds double, ptr addrspace(1) %207, i64 %208
  %210 = getelementptr double, ptr addrspace(1) %arg2172, i64 %205
  %211 = getelementptr inbounds double, ptr addrspace(1) %210, i64 %208
  br label %concatenate.44.2.merge40

concatenate.pivot.240.55:                         ; preds = %concatenate.pivot.192.53
  %212 = icmp ult i16 %.decomposed, 240
  br i1 %212, label %concatenate.pivot.192.56, label %concatenate.pivot.240.57

concatenate.pivot.192.56:                         ; preds = %concatenate.pivot.240.55
  %213 = add nsw i32 %.zext, -192
  %214 = getelementptr double, ptr addrspace(1) %arg8184, i64 %205
  %215 = zext nneg i32 %213 to i64
  %216 = getelementptr inbounds double, ptr addrspace(1) %214, i64 %215
  %217 = getelementptr double, ptr addrspace(1) %arg1170, i64 %205
  %218 = getelementptr inbounds double, ptr addrspace(1) %217, i64 %215
  br label %concatenate.44.2.merge40

concatenate.pivot.240.57:                         ; preds = %concatenate.pivot.240.55
  %219 = add nsw i32 %.zext, -240
  %220 = getelementptr double, ptr addrspace(1) %arg6180, i64 %205
  %221 = zext nneg i32 %219 to i64
  %222 = getelementptr inbounds double, ptr addrspace(1) %220, i64 %221
  %223 = getelementptr double, ptr addrspace(1) %arg0168, i64 %205
  %224 = getelementptr inbounds double, ptr addrspace(1) %223, i64 %221
  br label %concatenate.44.2.merge40

concatenate.44.2.merge40:                         ; preds = %concatenate.pivot.240.57, %concatenate.pivot.192.56, %concatenate.pivot.144.54, %concatenate.pivot.96.52, %concatenate.pivot.48.51, %concatenate.pivot.0.49
  %.sink155 = phi ptr addrspace(1) [ %224, %concatenate.pivot.240.57 ], [ %218, %concatenate.pivot.192.56 ], [ %211, %concatenate.pivot.144.54 ], [ %202, %concatenate.pivot.96.52 ], [ %196, %concatenate.pivot.48.51 ], [ %187, %concatenate.pivot.0.49 ]
  %.sink153.in = phi ptr addrspace(1) [ %222, %concatenate.pivot.240.57 ], [ %216, %concatenate.pivot.192.56 ], [ %209, %concatenate.pivot.144.54 ], [ %200, %concatenate.pivot.96.52 ], [ %194, %concatenate.pivot.48.51 ], [ %185, %concatenate.pivot.0.49 ]
  %225 = icmp ult i16 %.decomposed, 144
  %.sink153 = load double, ptr addrspace(1) %.sink153.in, align 8, !invariant.load !270
  %226 = load double, ptr addrspace(1) %.sink155, align 8, !invariant.load !270
  %227 = select i1 %.off0, double %.sink153, double %226
  %add.4432.9 = fadd double %179, %227
  %multiply.3067.7 = fmul double %add.4432.9, 5.000000e-01
  %subtract.239.5 = fsub double %add.4425.11, %multiply.3067.7
  %multiply.3068.1 = fmul double %83, %subtract.239.5
  br i1 %225, label %concatenate.pivot.48.66, label %concatenate.pivot.192.71

concatenate.pivot.48.66:                          ; preds = %concatenate.44.2.merge40
  %228 = icmp ult i16 %.decomposed, 48
  br i1 %228, label %concatenate.pivot.0.67, label %concatenate.pivot.96.68

concatenate.pivot.0.67:                           ; preds = %concatenate.pivot.48.66
  %229 = mul nuw nsw i32 %.zext142, 48
  %230 = zext nneg i32 %229 to i64
  %231 = getelementptr double, ptr addrspace(1) %arg24216, i64 %230
  %232 = zext nneg i16 %.decomposed to i64
  %233 = getelementptr inbounds double, ptr addrspace(1) %231, i64 %232
  %234 = getelementptr double, ptr addrspace(1) %arg16200, i64 %230
  %235 = getelementptr inbounds double, ptr addrspace(1) %234, i64 %232
  br label %concatenate.pivot.144.89

concatenate.pivot.96.68:                          ; preds = %concatenate.pivot.48.66
  %236 = icmp ult i16 %.decomposed, 96
  %237 = mul nuw nsw i32 %.zext142, 48
  %238 = zext nneg i32 %237 to i64
  br i1 %236, label %concatenate.pivot.48.69, label %concatenate.pivot.96.70

concatenate.pivot.48.69:                          ; preds = %concatenate.pivot.96.68
  %239 = add nsw i32 %.zext, -48
  %240 = getelementptr double, ptr addrspace(1) %arg23214, i64 %238
  %241 = zext nneg i32 %239 to i64
  %242 = getelementptr inbounds double, ptr addrspace(1) %240, i64 %241
  %243 = getelementptr double, ptr addrspace(1) %arg14196, i64 %238
  %244 = getelementptr inbounds double, ptr addrspace(1) %243, i64 %241
  br label %concatenate.pivot.144.89

concatenate.pivot.96.70:                          ; preds = %concatenate.pivot.96.68
  %245 = add nsw i32 %.zext, -96
  %246 = getelementptr double, ptr addrspace(1) %arg22212, i64 %238
  %247 = zext nneg i32 %245 to i64
  %248 = getelementptr inbounds double, ptr addrspace(1) %246, i64 %247
  %249 = getelementptr double, ptr addrspace(1) %arg12192, i64 %238
  %250 = getelementptr inbounds double, ptr addrspace(1) %249, i64 %247
  br label %concatenate.pivot.144.89

concatenate.pivot.192.71:                         ; preds = %concatenate.44.2.merge40
  %251 = icmp ult i16 %.decomposed, 192
  %252 = mul nuw nsw i32 %.zext142, 48
  %253 = zext nneg i32 %252 to i64
  br i1 %251, label %concatenate.pivot.144.72, label %concatenate.pivot.240.73

concatenate.pivot.144.72:                         ; preds = %concatenate.pivot.192.71
  %254 = add nsw i32 %.zext, -144
  %255 = getelementptr double, ptr addrspace(1) %arg21210, i64 %253
  %256 = zext nneg i32 %254 to i64
  %257 = getelementptr inbounds double, ptr addrspace(1) %255, i64 %256
  %258 = getelementptr double, ptr addrspace(1) %arg10188, i64 %253
  %259 = getelementptr inbounds double, ptr addrspace(1) %258, i64 %256
  br label %concatenate.pivot.144.89

concatenate.pivot.240.73:                         ; preds = %concatenate.pivot.192.71
  %260 = icmp ult i16 %.decomposed, 240
  br i1 %260, label %concatenate.pivot.192.74, label %concatenate.pivot.240.75

concatenate.pivot.192.74:                         ; preds = %concatenate.pivot.240.73
  %261 = add nsw i32 %.zext, -192
  %262 = getelementptr double, ptr addrspace(1) %arg20208, i64 %253
  %263 = zext nneg i32 %261 to i64
  %264 = getelementptr inbounds double, ptr addrspace(1) %262, i64 %263
  %265 = getelementptr double, ptr addrspace(1) %arg8184, i64 %253
  %266 = getelementptr inbounds double, ptr addrspace(1) %265, i64 %263
  br label %concatenate.pivot.144.89

concatenate.pivot.240.75:                         ; preds = %concatenate.pivot.240.73
  %267 = add nsw i32 %.zext, -240
  %268 = getelementptr double, ptr addrspace(1) %arg19206, i64 %253
  %269 = zext nneg i32 %267 to i64
  %270 = getelementptr inbounds double, ptr addrspace(1) %268, i64 %269
  %271 = getelementptr double, ptr addrspace(1) %arg6180, i64 %253
  %272 = getelementptr inbounds double, ptr addrspace(1) %271, i64 %269
  br label %concatenate.pivot.144.89

concatenate.pivot.144.89:                         ; preds = %concatenate.pivot.0.67, %concatenate.pivot.48.69, %concatenate.pivot.96.70, %concatenate.pivot.144.72, %concatenate.pivot.192.74, %concatenate.pivot.240.75
  %.sink158 = phi ptr addrspace(1) [ %235, %concatenate.pivot.0.67 ], [ %244, %concatenate.pivot.48.69 ], [ %250, %concatenate.pivot.96.70 ], [ %259, %concatenate.pivot.144.72 ], [ %266, %concatenate.pivot.192.74 ], [ %272, %concatenate.pivot.240.75 ]
  %.sink156.in = phi ptr addrspace(1) [ %233, %concatenate.pivot.0.67 ], [ %242, %concatenate.pivot.48.69 ], [ %248, %concatenate.pivot.96.70 ], [ %257, %concatenate.pivot.144.72 ], [ %264, %concatenate.pivot.192.74 ], [ %270, %concatenate.pivot.240.75 ]
  %273 = icmp ult i16 %.decomposed, 144
  %.sink156 = load double, ptr addrspace(1) %.sink156.in, align 8, !invariant.load !270
  %274 = load double, ptr addrspace(1) %.sink158, align 8, !invariant.load !270
  %275 = select i1 %.off0, double %.sink156, double %274
  br i1 %273, label %concatenate.pivot.48.90, label %concatenate.pivot.192.95

concatenate.pivot.48.90:                          ; preds = %concatenate.pivot.144.89
  %276 = icmp ult i16 %.decomposed, 48
  br i1 %276, label %concatenate.pivot.0.91, label %concatenate.pivot.96.92

concatenate.pivot.0.91:                           ; preds = %concatenate.pivot.48.90
  %277 = mul nuw nsw i32 %.zext142, 48
  %278 = zext nneg i32 %277 to i64
  %279 = getelementptr double, ptr addrspace(1) %arg36240, i64 %278
  %280 = zext nneg i16 %.decomposed to i64
  %281 = getelementptr inbounds double, ptr addrspace(1) %279, i64 %280
  %282 = getelementptr double, ptr addrspace(1) %arg35238, i64 %278
  %283 = getelementptr inbounds double, ptr addrspace(1) %282, i64 %280
  br label %concatenate.pivot.144.107

concatenate.pivot.96.92:                          ; preds = %concatenate.pivot.48.90
  %284 = icmp ult i16 %.decomposed, 96
  %285 = mul nuw nsw i32 %.zext142, 48
  %286 = zext nneg i32 %285 to i64
  br i1 %284, label %concatenate.pivot.48.93, label %concatenate.pivot.96.94

concatenate.pivot.48.93:                          ; preds = %concatenate.pivot.96.92
  %287 = add nsw i32 %.zext, -48
  %288 = getelementptr double, ptr addrspace(1) %arg34236, i64 %286
  %289 = zext nneg i32 %287 to i64
  %290 = getelementptr inbounds double, ptr addrspace(1) %288, i64 %289
  %291 = getelementptr double, ptr addrspace(1) %arg33234, i64 %286
  %292 = getelementptr inbounds double, ptr addrspace(1) %291, i64 %289
  br label %concatenate.pivot.144.107

concatenate.pivot.96.94:                          ; preds = %concatenate.pivot.96.92
  %293 = add nsw i32 %.zext, -96
  %294 = getelementptr double, ptr addrspace(1) %arg32232, i64 %286
  %295 = zext nneg i32 %293 to i64
  %296 = getelementptr inbounds double, ptr addrspace(1) %294, i64 %295
  %297 = getelementptr double, ptr addrspace(1) %arg31230, i64 %286
  %298 = getelementptr inbounds double, ptr addrspace(1) %297, i64 %295
  br label %concatenate.pivot.144.107

concatenate.pivot.192.95:                         ; preds = %concatenate.pivot.144.89
  %299 = icmp ult i16 %.decomposed, 192
  %300 = mul nuw nsw i32 %.zext142, 48
  %301 = zext nneg i32 %300 to i64
  br i1 %299, label %concatenate.pivot.144.96, label %concatenate.pivot.240.97

concatenate.pivot.144.96:                         ; preds = %concatenate.pivot.192.95
  %302 = add nsw i32 %.zext, -144
  %303 = getelementptr double, ptr addrspace(1) %arg30228, i64 %301
  %304 = zext nneg i32 %302 to i64
  %305 = getelementptr inbounds double, ptr addrspace(1) %303, i64 %304
  %306 = getelementptr double, ptr addrspace(1) %arg29226, i64 %301
  %307 = getelementptr inbounds double, ptr addrspace(1) %306, i64 %304
  br label %concatenate.pivot.144.107

concatenate.pivot.240.97:                         ; preds = %concatenate.pivot.192.95
  %308 = icmp ult i16 %.decomposed, 240
  br i1 %308, label %concatenate.pivot.192.98, label %concatenate.pivot.240.99

concatenate.pivot.192.98:                         ; preds = %concatenate.pivot.240.97
  %309 = add nsw i32 %.zext, -192
  %310 = getelementptr double, ptr addrspace(1) %arg28224, i64 %301
  %311 = zext nneg i32 %309 to i64
  %312 = getelementptr inbounds double, ptr addrspace(1) %310, i64 %311
  %313 = getelementptr double, ptr addrspace(1) %arg27222, i64 %301
  %314 = getelementptr inbounds double, ptr addrspace(1) %313, i64 %311
  br label %concatenate.pivot.144.107

concatenate.pivot.240.99:                         ; preds = %concatenate.pivot.240.97
  %315 = add nsw i32 %.zext, -240
  %316 = getelementptr double, ptr addrspace(1) %arg26220, i64 %301
  %317 = zext nneg i32 %315 to i64
  %318 = getelementptr inbounds double, ptr addrspace(1) %316, i64 %317
  %319 = getelementptr double, ptr addrspace(1) %arg25218, i64 %301
  %320 = getelementptr inbounds double, ptr addrspace(1) %319, i64 %317
  br label %concatenate.pivot.144.107

concatenate.pivot.144.107:                        ; preds = %concatenate.pivot.0.91, %concatenate.pivot.48.93, %concatenate.pivot.96.94, %concatenate.pivot.144.96, %concatenate.pivot.192.98, %concatenate.pivot.240.99
  %.sink161 = phi ptr addrspace(1) [ %283, %concatenate.pivot.0.91 ], [ %292, %concatenate.pivot.48.93 ], [ %298, %concatenate.pivot.96.94 ], [ %307, %concatenate.pivot.144.96 ], [ %314, %concatenate.pivot.192.98 ], [ %320, %concatenate.pivot.240.99 ]
  %.sink159.in = phi ptr addrspace(1) [ %281, %concatenate.pivot.0.91 ], [ %290, %concatenate.pivot.48.93 ], [ %296, %concatenate.pivot.96.94 ], [ %305, %concatenate.pivot.144.96 ], [ %312, %concatenate.pivot.192.98 ], [ %318, %concatenate.pivot.240.99 ]
  %321 = icmp ult i16 %.decomposed, 144
  %.sink159 = load double, ptr addrspace(1) %.sink159.in, align 8, !invariant.load !270
  %322 = load double, ptr addrspace(1) %.sink161, align 8, !invariant.load !270
  %add.4425.1178 = fadd double %.sink159, %322
  br i1 %321, label %concatenate.pivot.48.108, label %concatenate.pivot.192.113

concatenate.pivot.48.108:                         ; preds = %concatenate.pivot.144.107
  %323 = icmp ult i16 %.decomposed, 48
  br i1 %323, label %concatenate.pivot.0.109, label %concatenate.pivot.96.110

concatenate.pivot.0.109:                          ; preds = %concatenate.pivot.48.108
  %324 = mul nuw nsw i32 %.zext142, 48
  %325 = zext nneg i32 %324 to i64
  %326 = getelementptr double, ptr addrspace(1) %arg24216, i64 %325
  %327 = zext nneg i16 %.decomposed to i64
  %328 = getelementptr inbounds double, ptr addrspace(1) %326, i64 %327
  %329 = getelementptr double, ptr addrspace(1) %arg16200, i64 %325
  %330 = getelementptr inbounds double, ptr addrspace(1) %329, i64 %327
  br label %concatenate.pivot.144.125

concatenate.pivot.96.110:                         ; preds = %concatenate.pivot.48.108
  %331 = icmp ult i16 %.decomposed, 96
  %332 = mul nuw nsw i32 %.zext142, 48
  %333 = zext nneg i32 %332 to i64
  br i1 %331, label %concatenate.pivot.48.111, label %concatenate.pivot.96.112

concatenate.pivot.48.111:                         ; preds = %concatenate.pivot.96.110
  %334 = add nsw i32 %.zext, -48
  %335 = getelementptr double, ptr addrspace(1) %arg23214, i64 %333
  %336 = zext nneg i32 %334 to i64
  %337 = getelementptr inbounds double, ptr addrspace(1) %335, i64 %336
  %338 = getelementptr double, ptr addrspace(1) %arg14196, i64 %333
  %339 = getelementptr inbounds double, ptr addrspace(1) %338, i64 %336
  br label %concatenate.pivot.144.125

concatenate.pivot.96.112:                         ; preds = %concatenate.pivot.96.110
  %340 = add nsw i32 %.zext, -96
  %341 = getelementptr double, ptr addrspace(1) %arg22212, i64 %333
  %342 = zext nneg i32 %340 to i64
  %343 = getelementptr inbounds double, ptr addrspace(1) %341, i64 %342
  %344 = getelementptr double, ptr addrspace(1) %arg12192, i64 %333
  %345 = getelementptr inbounds double, ptr addrspace(1) %344, i64 %342
  br label %concatenate.pivot.144.125

concatenate.pivot.192.113:                        ; preds = %concatenate.pivot.144.107
  %346 = icmp ult i16 %.decomposed, 192
  %347 = mul nuw nsw i32 %.zext142, 48
  %348 = zext nneg i32 %347 to i64
  br i1 %346, label %concatenate.pivot.144.114, label %concatenate.pivot.240.115

concatenate.pivot.144.114:                        ; preds = %concatenate.pivot.192.113
  %349 = add nsw i32 %.zext, -144
  %350 = getelementptr double, ptr addrspace(1) %arg21210, i64 %348
  %351 = zext nneg i32 %349 to i64
  %352 = getelementptr inbounds double, ptr addrspace(1) %350, i64 %351
  %353 = getelementptr double, ptr addrspace(1) %arg10188, i64 %348
  %354 = getelementptr inbounds double, ptr addrspace(1) %353, i64 %351
  br label %concatenate.pivot.144.125

concatenate.pivot.240.115:                        ; preds = %concatenate.pivot.192.113
  %355 = icmp ult i16 %.decomposed, 240
  br i1 %355, label %concatenate.pivot.192.116, label %concatenate.pivot.240.117

concatenate.pivot.192.116:                        ; preds = %concatenate.pivot.240.115
  %356 = add nsw i32 %.zext, -192
  %357 = getelementptr double, ptr addrspace(1) %arg20208, i64 %348
  %358 = zext nneg i32 %356 to i64
  %359 = getelementptr inbounds double, ptr addrspace(1) %357, i64 %358
  %360 = getelementptr double, ptr addrspace(1) %arg8184, i64 %348
  %361 = getelementptr inbounds double, ptr addrspace(1) %360, i64 %358
  br label %concatenate.pivot.144.125

concatenate.pivot.240.117:                        ; preds = %concatenate.pivot.240.115
  %362 = add nsw i32 %.zext, -240
  %363 = getelementptr double, ptr addrspace(1) %arg19206, i64 %348
  %364 = zext nneg i32 %362 to i64
  %365 = getelementptr inbounds double, ptr addrspace(1) %363, i64 %364
  %366 = getelementptr double, ptr addrspace(1) %arg6180, i64 %348
  %367 = getelementptr inbounds double, ptr addrspace(1) %366, i64 %364
  br label %concatenate.pivot.144.125

concatenate.pivot.144.125:                        ; preds = %concatenate.pivot.0.109, %concatenate.pivot.48.111, %concatenate.pivot.96.112, %concatenate.pivot.144.114, %concatenate.pivot.192.116, %concatenate.pivot.240.117
  %.sink164 = phi ptr addrspace(1) [ %330, %concatenate.pivot.0.109 ], [ %339, %concatenate.pivot.48.111 ], [ %345, %concatenate.pivot.96.112 ], [ %354, %concatenate.pivot.144.114 ], [ %361, %concatenate.pivot.192.116 ], [ %367, %concatenate.pivot.240.117 ]
  %.sink162.in = phi ptr addrspace(1) [ %328, %concatenate.pivot.0.109 ], [ %337, %concatenate.pivot.48.111 ], [ %343, %concatenate.pivot.96.112 ], [ %352, %concatenate.pivot.144.114 ], [ %359, %concatenate.pivot.192.116 ], [ %365, %concatenate.pivot.240.117 ]
  %368 = icmp ult i16 %.decomposed, 144
  %.sink162 = load double, ptr addrspace(1) %.sink162.in, align 8, !invariant.load !270
  %369 = load double, ptr addrspace(1) %.sink164, align 8, !invariant.load !270
  %370 = select i1 %.off0, double %.sink162, double %369
  br i1 %368, label %concatenate.pivot.48.126, label %concatenate.pivot.192.131

concatenate.pivot.48.126:                         ; preds = %concatenate.pivot.144.125
  %371 = icmp ult i16 %.decomposed, 48
  br i1 %371, label %concatenate.pivot.0.127, label %concatenate.pivot.96.128

concatenate.pivot.0.127:                          ; preds = %concatenate.pivot.48.126
  %372 = mul nuw nsw i32 %.zext142, 48
  %373 = zext nneg i32 %372 to i64
  %374 = getelementptr double, ptr addrspace(1) %arg16200, i64 %373
  %375 = zext nneg i16 %.decomposed to i64
  %376 = getelementptr inbounds double, ptr addrspace(1) %374, i64 %375
  %377 = getelementptr double, ptr addrspace(1) %arg5178, i64 %373
  %378 = getelementptr inbounds double, ptr addrspace(1) %377, i64 %375
  br label %concatenate.44.2.merge118

concatenate.pivot.96.128:                         ; preds = %concatenate.pivot.48.126
  %379 = icmp ult i16 %.decomposed, 96
  %380 = mul nuw nsw i32 %.zext142, 48
  %381 = zext nneg i32 %380 to i64
  br i1 %379, label %concatenate.pivot.48.129, label %concatenate.pivot.96.130

concatenate.pivot.48.129:                         ; preds = %concatenate.pivot.96.128
  %382 = add nsw i32 %.zext, -48
  %383 = getelementptr double, ptr addrspace(1) %arg14196, i64 %381
  %384 = zext nneg i32 %382 to i64
  %385 = getelementptr inbounds double, ptr addrspace(1) %383, i64 %384
  %386 = getelementptr double, ptr addrspace(1) %arg4176, i64 %381
  %387 = getelementptr inbounds double, ptr addrspace(1) %386, i64 %384
  br label %concatenate.44.2.merge118

concatenate.pivot.96.130:                         ; preds = %concatenate.pivot.96.128
  %388 = add nsw i32 %.zext, -96
  %389 = getelementptr double, ptr addrspace(1) %arg12192, i64 %381
  %390 = zext nneg i32 %388 to i64
  %391 = getelementptr inbounds double, ptr addrspace(1) %389, i64 %390
  %392 = getelementptr double, ptr addrspace(1) %arg3174, i64 %381
  %393 = getelementptr inbounds double, ptr addrspace(1) %392, i64 %390
  br label %concatenate.44.2.merge118

concatenate.pivot.192.131:                        ; preds = %concatenate.pivot.144.125
  %394 = icmp ult i16 %.decomposed, 192
  %395 = mul nuw nsw i32 %.zext142, 48
  %396 = zext nneg i32 %395 to i64
  br i1 %394, label %concatenate.pivot.144.132, label %concatenate.pivot.240.133

concatenate.pivot.144.132:                        ; preds = %concatenate.pivot.192.131
  %397 = add nsw i32 %.zext, -144
  %398 = getelementptr double, ptr addrspace(1) %arg10188, i64 %396
  %399 = zext nneg i32 %397 to i64
  %400 = getelementptr inbounds double, ptr addrspace(1) %398, i64 %399
  %401 = getelementptr double, ptr addrspace(1) %arg2172, i64 %396
  %402 = getelementptr inbounds double, ptr addrspace(1) %401, i64 %399
  br label %concatenate.44.2.merge118

concatenate.pivot.240.133:                        ; preds = %concatenate.pivot.192.131
  %403 = icmp ult i16 %.decomposed, 240
  br i1 %403, label %concatenate.pivot.192.134, label %concatenate.pivot.240.135

concatenate.pivot.192.134:                        ; preds = %concatenate.pivot.240.133
  %404 = add nsw i32 %.zext, -192
  %405 = getelementptr double, ptr addrspace(1) %arg8184, i64 %396
  %406 = zext nneg i32 %404 to i64
  %407 = getelementptr inbounds double, ptr addrspace(1) %405, i64 %406
  %408 = getelementptr double, ptr addrspace(1) %arg1170, i64 %396
  %409 = getelementptr inbounds double, ptr addrspace(1) %408, i64 %406
  br label %concatenate.44.2.merge118

concatenate.pivot.240.135:                        ; preds = %concatenate.pivot.240.133
  %410 = add nsw i32 %.zext, -240
  %411 = getelementptr double, ptr addrspace(1) %arg6180, i64 %396
  %412 = zext nneg i32 %410 to i64
  %413 = getelementptr inbounds double, ptr addrspace(1) %411, i64 %412
  %414 = getelementptr double, ptr addrspace(1) %arg0168, i64 %396
  %415 = getelementptr inbounds double, ptr addrspace(1) %414, i64 %412
  br label %concatenate.44.2.merge118

concatenate.44.2.merge118:                        ; preds = %concatenate.pivot.240.135, %concatenate.pivot.192.134, %concatenate.pivot.144.132, %concatenate.pivot.96.130, %concatenate.pivot.48.129, %concatenate.pivot.0.127
  %.sink167 = phi ptr addrspace(1) [ %415, %concatenate.pivot.240.135 ], [ %409, %concatenate.pivot.192.134 ], [ %402, %concatenate.pivot.144.132 ], [ %393, %concatenate.pivot.96.130 ], [ %387, %concatenate.pivot.48.129 ], [ %378, %concatenate.pivot.0.127 ]
  %.sink165.in = phi ptr addrspace(1) [ %413, %concatenate.pivot.240.135 ], [ %407, %concatenate.pivot.192.134 ], [ %400, %concatenate.pivot.144.132 ], [ %391, %concatenate.pivot.96.130 ], [ %385, %concatenate.pivot.48.129 ], [ %376, %concatenate.pivot.0.127 ]
  %.sink165 = load double, ptr addrspace(1) %.sink165.in, align 8, !invariant.load !270
  %416 = load double, ptr addrspace(1) %.sink167, align 8, !invariant.load !270
  %417 = select i1 %.off0, double %.sink165, double %416
  %add.4432.9136 = fadd double %370, %417
  %multiply.3067.7138 = fmul double %add.4432.9136, 5.000000e-01
  %subtract.239.5139 = fsub double %add.4425.1178, %multiply.3067.7138
  %multiply.3069.1.clone.1 = fmul double %275, %subtract.239.5139
  %418 = zext nneg i32 %linear_index to i64
  %419 = getelementptr double, ptr addrspace(1) %arg37242, i64 %418
  store double %multiply.3068.1, ptr addrspace(1) %419, align 8
  %420 = getelementptr double, ptr addrspace(1) %arg38244, i64 %418
  store double %multiply.3069.1.clone.1, ptr addrspace(1) %420, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4608) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg3) local_unnamed_addr #4 {
entry:
  %arg3168 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2166 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1164 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0162 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %block.id.y = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !271
  %trunc = trunc nuw i32 %block.id.y to i1
  %thread.id.x36 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !273
  %0 = lshr i32 %thread.id.x36, 5
  %thread.id.239 = and i32 %thread.id.x36, 31
  %1 = zext nneg i32 %0 to i64
  %2 = shl nuw nsw i32 %thread.id.239, 1
  %3 = zext nneg i32 %2 to i64
  %4 = shl nuw nsw i32 %thread.id.x36, 1
  %5 = or i32 %4, 64
  %6 = zext nneg i32 %5 to i64
  %7 = or i32 %4, 65
  %8 = zext nneg i32 %7 to i64
  %9 = or i32 %4, 192
  %10 = zext nneg i32 %9 to i64
  br i1 %trunc, label %loop1.loop_body48.lr.ph, label %loop1.loop_body.lr.ph

reduce-group-1-after.sink.split:                  ; preds = %intra_warp_reduce_write-after104, %intra_warp_reduce_write-after
  %arg2.sink = phi ptr addrspace(1) [ %arg2166, %intra_warp_reduce_write-after ], [ %arg3168, %intra_warp_reduce_write-after104 ]
  %shared_cache12.sink = phi ptr addrspace(3) [ @shared_cache12, %intra_warp_reduce_write-after ], [ @shared_cache13, %intra_warp_reduce_write-after104 ]
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg2.sink, i64 0, i64 %1
  %11 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) %shared_cache12.sink, i64 0, i64 %1, i64 0
  %output.then.val = load double, ptr addrspace(3) %11, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduce-group-1-after.sink.split, %intra_warp_reduce_write-after, %intra_warp_reduce_write-after104
  ret void

loop1.loop_body.lr.ph:                            ; preds = %entry
  %param_0.403716 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0162, i64 0, i64 %1, i64 %3
  %12 = load <2 x double>, ptr addrspace(1) %param_0.403716, align 16, !invariant.load !270
  %param_0.403717186 = extractelement <2 x double> %12, i32 0
  %param_0.403717.1187 = extractelement <2 x double> %12, i32 1
  %add.3969.i133 = fadd double %param_0.403717186, 0.000000e+00
  %add.3969.i133.1 = fadd double %add.3969.i133, %param_0.403717.1187
  %param_0.403716.1154 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0162, i64 0, i64 %1, i64 %6
  %param_0.403717.1155 = load double, ptr addrspace(1) %param_0.403716.1154, align 16, !invariant.load !270
  %add.3969.i133.1156 = fadd double %add.3969.i133.1, %param_0.403717.1155
  %param_0.403716.1.1 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0162, i64 0, i64 %1, i64 %8
  %param_0.403717.1.1 = load double, ptr addrspace(1) %param_0.403716.1.1, align 8, !invariant.load !270
  %add.3969.i133.1.1 = fadd double %add.3969.i133.1156, %param_0.403717.1.1
  %param_0.403716.2171 = getelementptr inbounds i8, ptr addrspace(1) %param_0.403716, i64 1024
  %13 = load <2 x double>, ptr addrspace(1) %param_0.403716.2171, align 16, !invariant.load !270
  %param_0.403717.2188 = extractelement <2 x double> %13, i32 0
  %param_0.403717.1.2189 = extractelement <2 x double> %13, i32 1
  %add.3969.i133.2 = fadd double %add.3969.i133.1.1, %param_0.403717.2188
  %add.3969.i133.1.2 = fadd double %add.3969.i133.2, %param_0.403717.1.2189
  %param_0.403716.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0162, i64 0, i64 %1, i64 %10
  %param_0.403717.3 = load double, ptr addrspace(1) %param_0.403716.3, align 16, !invariant.load !270
  %add.3969.i133.3 = fadd double %add.3969.i133.1.2, %param_0.403717.3
  %14 = or i32 %4, 193
  %15 = zext nneg i32 %14 to i64
  %param_0.403716.1.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0162, i64 0, i64 %1, i64 %15
  %param_0.403717.1.3 = load double, ptr addrspace(1) %param_0.403716.1.3, align 8, !invariant.load !270
  %add.3969.i133.1.3 = fadd double %add.3969.i133.3, %param_0.403717.1.3
  %16 = or disjoint i32 %thread.id.239, 128
  %17 = icmp ult i32 %16, 144
  %18 = shl nuw nsw i32 %16, 1
  %19 = zext nneg i32 %18 to i64
  %param_0.403716.4 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg0162, i64 0, i64 %1, i64 %19
  br i1 %17, label %loop3.loop_header11.preheader.4, label %x_in_tile-after.7

loop3.loop_header11.preheader.4:                  ; preds = %loop1.loop_body.lr.ph
  %20 = load <2 x double>, ptr addrspace(1) %param_0.403716.4, align 16, !invariant.load !270
  %param_0.403717.4184 = extractelement <2 x double> %20, i32 0
  %param_0.403717.1.4185 = extractelement <2 x double> %20, i32 1
  %add.3969.i133.4 = fadd double %add.3969.i133.1.3, %param_0.403717.4184
  %add.3969.i133.1.4 = fadd double %add.3969.i133.4, %param_0.403717.1.4185
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %loop1.loop_body.lr.ph, %loop3.loop_header11.preheader.4
  %partial_reduction_result.2.4 = phi double [ %add.3969.i133.1.3, %loop1.loop_body.lr.ph ], [ %add.3969.i133.1.4, %loop3.loop_header11.preheader.4 ]
  %21 = bitcast double %partial_reduction_result.2.4 to <2 x i32>
  %22 = extractelement <2 x i32> %21, i64 0
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 16, i32 31)
  %24 = insertelement <2 x i32> poison, i32 %23, i64 0
  %25 = extractelement <2 x i32> %21, i64 1
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 16, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 1
  %28 = bitcast <2 x i32> %27 to double
  %add.3969.i = fadd double %partial_reduction_result.2.4, %28
  %29 = bitcast double %add.3969.i to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 8, i32 31)
  %32 = insertelement <2 x i32> poison, i32 %31, i64 0
  %33 = extractelement <2 x i32> %29, i64 1
  %34 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %33, i32 8, i32 31)
  %35 = insertelement <2 x i32> %32, i32 %34, i64 1
  %36 = bitcast <2 x i32> %35 to double
  %add.3969.i129 = fadd double %add.3969.i, %36
  %37 = bitcast double %add.3969.i129 to <2 x i32>
  %38 = extractelement <2 x i32> %37, i64 0
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 4, i32 31)
  %40 = insertelement <2 x i32> poison, i32 %39, i64 0
  %41 = extractelement <2 x i32> %37, i64 1
  %42 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %41, i32 4, i32 31)
  %43 = insertelement <2 x i32> %40, i32 %42, i64 1
  %44 = bitcast <2 x i32> %43 to double
  %add.3969.i130 = fadd double %add.3969.i129, %44
  %45 = bitcast double %add.3969.i130 to <2 x i32>
  %46 = extractelement <2 x i32> %45, i64 0
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 2, i32 31)
  %48 = insertelement <2 x i32> poison, i32 %47, i64 0
  %49 = extractelement <2 x i32> %45, i64 1
  %50 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %49, i32 2, i32 31)
  %51 = insertelement <2 x i32> %48, i32 %50, i64 1
  %52 = bitcast <2 x i32> %51 to double
  %add.3969.i131 = fadd double %add.3969.i130, %52
  %53 = bitcast double %add.3969.i131 to <2 x i32>
  %54 = extractelement <2 x i32> %53, i64 0
  %55 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %54, i32 1, i32 31)
  %56 = extractelement <2 x i32> %53, i64 1
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 1, i32 31)
  %58 = icmp eq i32 %thread.id.239, 0
  %59 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache12, i64 0, i64 %1, i64 0
  %60 = insertelement <2 x i32> poison, i32 %55, i64 0
  %61 = insertelement <2 x i32> %60, i32 %57, i64 1
  %62 = bitcast <2 x i32> %61 to double
  %add.3969.i132 = fadd double %add.3969.i131, %62
  br i1 %58, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %63 = icmp eq i32 %thread.id.239, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %63, label %reduce-group-1-after.sink.split, label %reduce-group-1-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i132, ptr addrspace(3) %59, align 8
  br label %intra_warp_reduce_write-after

loop1.loop_body48.lr.ph:                          ; preds = %entry
  %param_1.772883 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg1164, i64 0, i64 %1, i64 %3
  %64 = load <2 x double>, ptr addrspace(1) %param_1.772883, align 16, !invariant.load !270
  %param_1.772884180 = extractelement <2 x double> %64, i32 0
  %param_1.772884.1181 = extractelement <2 x double> %64, i32 1
  %add.3969.i139 = fadd double %param_1.772884180, 0.000000e+00
  %add.3969.i139.1 = fadd double %add.3969.i139, %param_1.772884.1181
  %param_1.772883.1157 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg1164, i64 0, i64 %1, i64 %6
  %param_1.772884.1158 = load double, ptr addrspace(1) %param_1.772883.1157, align 16, !invariant.load !270
  %add.3969.i139.1159 = fadd double %add.3969.i139.1, %param_1.772884.1158
  %param_1.772883.1.1 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg1164, i64 0, i64 %1, i64 %8
  %param_1.772884.1.1 = load double, ptr addrspace(1) %param_1.772883.1.1, align 8, !invariant.load !270
  %add.3969.i139.1.1 = fadd double %add.3969.i139.1159, %param_1.772884.1.1
  %param_1.772883.2175 = getelementptr inbounds i8, ptr addrspace(1) %param_1.772883, i64 1024
  %65 = load <2 x double>, ptr addrspace(1) %param_1.772883.2175, align 16, !invariant.load !270
  %param_1.772884.2182 = extractelement <2 x double> %65, i32 0
  %param_1.772884.1.2183 = extractelement <2 x double> %65, i32 1
  %add.3969.i139.2 = fadd double %add.3969.i139.1.1, %param_1.772884.2182
  %add.3969.i139.1.2 = fadd double %add.3969.i139.2, %param_1.772884.1.2183
  %param_1.772883.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg1164, i64 0, i64 %1, i64 %10
  %param_1.772884.3 = load double, ptr addrspace(1) %param_1.772883.3, align 16, !invariant.load !270
  %add.3969.i139.3 = fadd double %add.3969.i139.1.2, %param_1.772884.3
  %66 = or i32 %4, 193
  %67 = zext nneg i32 %66 to i64
  %param_1.772883.1.3 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg1164, i64 0, i64 %1, i64 %67
  %param_1.772884.1.3 = load double, ptr addrspace(1) %param_1.772883.1.3, align 8, !invariant.load !270
  %add.3969.i139.1.3 = fadd double %add.3969.i139.3, %param_1.772884.1.3
  %68 = or disjoint i32 %thread.id.239, 128
  %69 = icmp ult i32 %68, 144
  %70 = shl nuw nsw i32 %68, 1
  %71 = zext nneg i32 %70 to i64
  %param_1.772883.4 = getelementptr inbounds [2 x [288 x double]], ptr addrspace(1) %arg1164, i64 0, i64 %1, i64 %71
  br i1 %69, label %loop3.loop_header78.preheader.4, label %x_in_tile-after76.7

loop3.loop_header78.preheader.4:                  ; preds = %loop1.loop_body48.lr.ph
  %72 = load <2 x double>, ptr addrspace(1) %param_1.772883.4, align 16, !invariant.load !270
  %param_1.772884.4178 = extractelement <2 x double> %72, i32 0
  %param_1.772884.1.4179 = extractelement <2 x double> %72, i32 1
  %add.3969.i139.4 = fadd double %add.3969.i139.1.3, %param_1.772884.4178
  %add.3969.i139.1.4 = fadd double %add.3969.i139.4, %param_1.772884.1.4179
  br label %x_in_tile-after76.7

x_in_tile-after76.7:                              ; preds = %loop1.loop_body48.lr.ph, %loop3.loop_header78.preheader.4
  %partial_reduction_result34.2.4 = phi double [ %add.3969.i139.1.3, %loop1.loop_body48.lr.ph ], [ %add.3969.i139.1.4, %loop3.loop_header78.preheader.4 ]
  %73 = bitcast double %partial_reduction_result34.2.4 to <2 x i32>
  %74 = extractelement <2 x i32> %73, i64 0
  %75 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %74, i32 16, i32 31)
  %76 = insertelement <2 x i32> poison, i32 %75, i64 0
  %77 = extractelement <2 x i32> %73, i64 1
  %78 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %77, i32 16, i32 31)
  %79 = insertelement <2 x i32> %76, i32 %78, i64 1
  %80 = bitcast <2 x i32> %79 to double
  %add.3969.i134 = fadd double %partial_reduction_result34.2.4, %80
  %81 = bitcast double %add.3969.i134 to <2 x i32>
  %82 = extractelement <2 x i32> %81, i64 0
  %83 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %82, i32 8, i32 31)
  %84 = insertelement <2 x i32> poison, i32 %83, i64 0
  %85 = extractelement <2 x i32> %81, i64 1
  %86 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %85, i32 8, i32 31)
  %87 = insertelement <2 x i32> %84, i32 %86, i64 1
  %88 = bitcast <2 x i32> %87 to double
  %add.3969.i135 = fadd double %add.3969.i134, %88
  %89 = bitcast double %add.3969.i135 to <2 x i32>
  %90 = extractelement <2 x i32> %89, i64 0
  %91 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %90, i32 4, i32 31)
  %92 = insertelement <2 x i32> poison, i32 %91, i64 0
  %93 = extractelement <2 x i32> %89, i64 1
  %94 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %93, i32 4, i32 31)
  %95 = insertelement <2 x i32> %92, i32 %94, i64 1
  %96 = bitcast <2 x i32> %95 to double
  %add.3969.i136 = fadd double %add.3969.i135, %96
  %97 = bitcast double %add.3969.i136 to <2 x i32>
  %98 = extractelement <2 x i32> %97, i64 0
  %99 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %98, i32 2, i32 31)
  %100 = insertelement <2 x i32> poison, i32 %99, i64 0
  %101 = extractelement <2 x i32> %97, i64 1
  %102 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %101, i32 2, i32 31)
  %103 = insertelement <2 x i32> %100, i32 %102, i64 1
  %104 = bitcast <2 x i32> %103 to double
  %add.3969.i137 = fadd double %add.3969.i136, %104
  %105 = bitcast double %add.3969.i137 to <2 x i32>
  %106 = extractelement <2 x i32> %105, i64 0
  %107 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %106, i32 1, i32 31)
  %108 = extractelement <2 x i32> %105, i64 1
  %109 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %108, i32 1, i32 31)
  %110 = icmp eq i32 %thread.id.239, 0
  %111 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache13, i64 0, i64 %1, i64 0
  %112 = insertelement <2 x i32> poison, i32 %107, i64 0
  %113 = insertelement <2 x i32> %112, i32 %109, i64 1
  %114 = bitcast <2 x i32> %113 to double
  %add.3969.i138 = fadd double %add.3969.i137, %114
  br i1 %110, label %intra_warp_reduce_write-true103, label %intra_warp_reduce_write-after104

intra_warp_reduce_write-after104:                 ; preds = %intra_warp_reduce_write-true103, %x_in_tile-after76.7
  %115 = icmp eq i32 %thread.id.239, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %115, label %reduce-group-1-after.sink.split, label %reduce-group-1-after

intra_warp_reduce_write-true103:                  ; preds = %x_in_tile-after76.7
  store double %add.3969.i138, ptr addrspace(3) %111, align 8
  br label %intra_warp_reduce_write-after104
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_and_compare_select_fusion(ptr noalias nocapture align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg6, ptr noalias nocapture align 128 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg8, ptr noalias nocapture align 128 dereferenceable(16) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg10, ptr noalias nocapture align 128 dereferenceable(2) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(48) %arg12, ptr noalias nocapture align 128 dereferenceable(16) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg15, ptr noalias nocapture align 128 dereferenceable(16) %arg16, ptr noalias nocapture readnone align 128 dereferenceable(16) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg18, ptr noalias nocapture align 128 dereferenceable(16) %arg19, ptr noalias nocapture align 128 dereferenceable(16) %arg20, ptr noalias nocapture align 128 dereferenceable(16) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg23, ptr noalias nocapture align 128 dereferenceable(8) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg25, ptr noalias nocapture align 128 dereferenceable(8) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg28) local_unnamed_addr #2 {
entry:
  %arg28121 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27119 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26117 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25115 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24113 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23111 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22109 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21107 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20105 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19103 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18101 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1697 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1595 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1493 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1391 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1289 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1187 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1085 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg983 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg881 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg779 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg677 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg575 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg473 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg371 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg269 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg167 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg065 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg20105, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8
  %4 = getelementptr i8, ptr addrspace(1) %arg1187, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1
  %6 = getelementptr i8, ptr addrspace(1) %arg065, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1
  %8 = getelementptr i8, ptr addrspace(1) %arg167, i64 %1
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !270
  %10 = getelementptr double, ptr addrspace(1) %arg371, i64 %1
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !270
  %12 = getelementptr double, ptr addrspace(1) %arg269, i64 %1
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !270
  %14 = getelementptr i8, ptr addrspace(1) %arg677, i64 %1
  %15 = load i8, ptr addrspace(1) %14, align 1, !invariant.load !270
  %16 = getelementptr [2 x [6 x i32]], ptr addrspace(1) %arg1289, i64 0, i64 %1, i64 0
  %17 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 16
  %18 = load <2 x i32>, ptr addrspace(1) %17, align 8, !invariant.load !270
  %19 = extractelement <2 x i32> %18, i32 0
  %20 = extractelement <2 x i32> %18, i32 1
  %21 = getelementptr double, ptr addrspace(1) %arg1085, i64 %1
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !270
  %23 = getelementptr double, ptr addrspace(1) %arg983, i64 %1
  %24 = load double, ptr addrspace(1) %23, align 8
  %subtract.236.5.clone.1 = fsub double %22, %24
  %25 = tail call double @llvm.fma.f64(double %subtract.236.5.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #13
  %27 = tail call double @llvm.nvvm.add.rn.d(double %25, double 0xC338000000000000) #13
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
  %41 = tail call i32 @llvm.nvvm.d2i.lo(double %40) #13
  %42 = tail call i32 @llvm.nvvm.d2i.hi(double %40) #13
  %43 = shl i32 %26, 20
  %44 = add i32 %42, %43
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 %41, i32 %44) #13
  %46 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.236.5.clone.1) #13
  %47 = bitcast i32 %46 to float
  %48 = tail call float @llvm.nvvm.fabs.f(float %47) #13
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
  %57 = tail call double @llvm.nvvm.lohi.i2d(i32 %41, i32 %56) #13
  %58 = sub nsw i32 %26, %54
  %59 = shl i32 %58, 20
  %60 = add nsw i32 %59, 1072693248
  %61 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %60) #13
  %62 = fmul double %61, %57
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %53
  %z.2.i = phi double [ %45, %entry ], [ %62, %53 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %63 = getelementptr double, ptr addrspace(1) %arg473, i64 %1
  %64 = load double, ptr addrspace(1) %63, align 8
  %65 = getelementptr double, ptr addrspace(1) %arg575, i64 %1
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !270
  %67 = getelementptr double, ptr addrspace(1) %arg779, i64 %1
  %68 = load double, ptr addrspace(1) %67, align 8
  %69 = getelementptr double, ptr addrspace(1) %arg881, i64 %1
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !270
  %subtract.237.1.clone.1 = fsub double %24, %22
  %71 = tail call double @llvm.fabs.f64(double %subtract.237.1.clone.1)
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %72, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %74 = tail call i32 @llvm.nvvm.d2i.lo(double %73) #13
  %75 = tail call double @llvm.nvvm.add.rn.d(double %73, double 0xC338000000000000) #13
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
  %89 = tail call i32 @llvm.nvvm.d2i.lo(double %88) #13
  %90 = tail call i32 @llvm.nvvm.d2i.hi(double %88) #13
  %91 = shl i32 %74, 20
  %92 = add i32 %90, %91
  %93 = tail call double @llvm.nvvm.lohi.i2d(i32 %89, i32 %92) #13
  %94 = tail call i32 @llvm.nvvm.d2i.hi(double %72) #13
  %95 = bitcast i32 %94 to float
  %96 = tail call float @llvm.nvvm.fabs.f(float %95) #13
  %97 = fcmp olt float %96, 0x4010C46560000000
  br i1 %97, label %__nv_exp.exit57, label %__internal_fast_icmp_abs_lt.exit.i54

__internal_fast_icmp_abs_lt.exit.i54:             ; preds = %__nv_exp.exit
  %98 = fcmp one double %subtract.237.1.clone.1, 0.000000e+00
  %99 = fsub double 0x7FF0000000000000, %71
  %z.0.i55 = select i1 %98, double 0.000000e+00, double %99
  %100 = fcmp olt float %96, 0x4010E90000000000
  br i1 %100, label %101, label %__nv_exp.exit57

101:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i54
  %102 = sdiv i32 %74, 2
  %103 = shl i32 %102, 20
  %104 = add i32 %90, %103
  %105 = tail call double @llvm.nvvm.lohi.i2d(i32 %89, i32 %104) #13
  %106 = sub nsw i32 %74, %102
  %107 = shl i32 %106, 20
  %108 = add nsw i32 %107, 1072693248
  %109 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %108) #13
  %110 = fmul double %109, %105
  br label %__nv_exp.exit57

__nv_exp.exit57:                                  ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i54, %101
  %z.2.i56 = phi double [ %93, %__nv_exp.exit ], [ %110, %101 ], [ %z.0.i55, %__internal_fast_icmp_abs_lt.exit.i54 ]
  %111 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i56) #13
  %112 = bitcast i32 %111 to float
  %113 = fcmp olt float %112, 0x3FFCAAAAA0000000
  %114 = fcmp ogt float %112, 0xBFFB333320000000
  %or.cond.i = and i1 %113, %114
  br i1 %or.cond.i, label %115, label %132

115:                                              ; preds = %__nv_exp.exit57
  %116 = fadd double %z.2.i56, 2.000000e+00
  %117 = fdiv double %z.2.i56, %116
  %118 = fneg double %z.2.i56
  %119 = fmul double %117, %118
  %120 = fadd double %z.2.i56, %119
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
  %131 = fadd double %z.2.i56, %130
  br label %__nv_log1p.exit

132:                                              ; preds = %__nv_exp.exit57
  %133 = fadd double %z.2.i56, 1.000000e+00
  %134 = tail call i32 @llvm.nvvm.d2i.hi(double %133) #13
  %135 = tail call i32 @llvm.nvvm.d2i.lo(double %133) #13
  %136 = icmp slt i32 %134, 1048576
  %137 = fmul double %133, 0x4350000000000000
  %138 = tail call i32 @llvm.nvvm.d2i.lo(double %137) #13
  %139 = tail call i32 @llvm.nvvm.d2i.hi(double %137) #13
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
  %148 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %147) #13
  %149 = icmp ugt i32 %147, 1073127582
  %150 = tail call i32 @llvm.nvvm.d2i.lo(double %148) #13
  %151 = tail call i32 @llvm.nvvm.d2i.hi(double %148) #13
  %152 = add i32 %151, -1048576
  %153 = tail call double @llvm.nvvm.lohi.i2d(i32 %150, i32 %152) #13
  %spec.select = select i1 %149, double %153, double %148
  %154 = zext i1 %149 to i32
  %spec.select62 = add nsw i32 %145, %154
  %155 = fadd double %spec.select, -1.000000e+00
  %156 = fadd double %spec.select, 1.000000e+00
  %157 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %156) #13
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
  %179 = xor i32 %spec.select62, -2147483648
  %180 = tail call double @llvm.nvvm.lohi.i2d(i32 %179, i32 1127219200) #13
  %181 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
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
  %192 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %193 = and i32 %192, 2147483647
  %194 = icmp eq i32 %193, 0
  %q.i.0.i = select i1 %194, double 0xFFF0000000000000, double %191
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %115, %143, %190
  %t.0.i = phi double [ %131, %115 ], [ %189, %143 ], [ %q.i.0.i, %190 ]
  %195 = getelementptr i8, ptr addrspace(1) %arg1493, i64 %1
  %196 = load i8, ptr addrspace(1) %195, align 1, !invariant.load !270
  %197 = getelementptr i64, ptr addrspace(1) %arg1595, i64 %1
  %198 = load i64, ptr addrspace(1) %197, align 8, !invariant.load !270
  %199 = getelementptr i64, ptr addrspace(1) %arg1391, i64 %1
  %200 = load i64, ptr addrspace(1) %199, align 8
  %201 = getelementptr double, ptr addrspace(1) %arg1697, i64 %1
  %202 = load double, ptr addrspace(1) %201, align 8
  %203 = getelementptr double, ptr addrspace(1) %arg18101, i64 %1
  %204 = load double, ptr addrspace(1) %203, align 8, !invariant.load !270
  %205 = getelementptr double, ptr addrspace(1) %arg19103, i64 %1
  %206 = load double, ptr addrspace(1) %205, align 8
  %207 = getelementptr double, ptr addrspace(1) %arg21107, i64 %1
  %208 = load double, ptr addrspace(1) %207, align 8
  %209 = getelementptr double, ptr addrspace(1) %arg22109, i64 %1
  %210 = load double, ptr addrspace(1) %209, align 8, !invariant.load !270
  %subtract.238.1.clone.1 = fsub double %208, %210
  %211 = tail call double @llvm.fabs.f64(double %subtract.238.1.clone.1)
  %212 = fneg double %211
  %213 = tail call double @llvm.fma.f64(double %212, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %214 = tail call i32 @llvm.nvvm.d2i.lo(double %213) #13
  %215 = tail call double @llvm.nvvm.add.rn.d(double %213, double 0xC338000000000000) #13
  %216 = tail call double @llvm.fma.f64(double %215, double 0xBFE62E42FEFA39EF, double %212)
  %217 = tail call double @llvm.fma.f64(double %215, double 0xBC7ABC9E3B39803F, double %216)
  %218 = tail call double @llvm.fma.f64(double %217, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %219 = tail call double @llvm.fma.f64(double %218, double %217, double 0x3EC71DEE62401315)
  %220 = tail call double @llvm.fma.f64(double %219, double %217, double 0x3EFA01997C89EB71)
  %221 = tail call double @llvm.fma.f64(double %220, double %217, double 0x3F2A01A014761F65)
  %222 = tail call double @llvm.fma.f64(double %221, double %217, double 0x3F56C16C1852B7AF)
  %223 = tail call double @llvm.fma.f64(double %222, double %217, double 0x3F81111111122322)
  %224 = tail call double @llvm.fma.f64(double %223, double %217, double 0x3FA55555555502A1)
  %225 = tail call double @llvm.fma.f64(double %224, double %217, double 0x3FC5555555555511)
  %226 = tail call double @llvm.fma.f64(double %225, double %217, double 0x3FE000000000000B)
  %227 = tail call double @llvm.fma.f64(double %226, double %217, double 1.000000e+00)
  %228 = tail call double @llvm.fma.f64(double %227, double %217, double 1.000000e+00)
  %229 = tail call i32 @llvm.nvvm.d2i.lo(double %228) #13
  %230 = tail call i32 @llvm.nvvm.d2i.hi(double %228) #13
  %231 = shl i32 %214, 20
  %232 = add i32 %230, %231
  %233 = tail call double @llvm.nvvm.lohi.i2d(i32 %229, i32 %232) #13
  %234 = tail call i32 @llvm.nvvm.d2i.hi(double %212) #13
  %235 = bitcast i32 %234 to float
  %236 = tail call float @llvm.nvvm.fabs.f(float %235) #13
  %237 = fcmp olt float %236, 0x4010C46560000000
  br i1 %237, label %__nv_exp.exit61, label %__internal_fast_icmp_abs_lt.exit.i58

__internal_fast_icmp_abs_lt.exit.i58:             ; preds = %__nv_log1p.exit
  %238 = fcmp one double %subtract.238.1.clone.1, 0.000000e+00
  %239 = fsub double 0x7FF0000000000000, %211
  %z.0.i59 = select i1 %238, double 0.000000e+00, double %239
  %240 = fcmp olt float %236, 0x4010E90000000000
  br i1 %240, label %241, label %__nv_exp.exit61

241:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i58
  %242 = sdiv i32 %214, 2
  %243 = shl i32 %242, 20
  %244 = add i32 %230, %243
  %245 = tail call double @llvm.nvvm.lohi.i2d(i32 %229, i32 %244) #13
  %246 = sub nsw i32 %214, %242
  %247 = shl i32 %246, 20
  %248 = add nsw i32 %247, 1072693248
  %249 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %248) #13
  %250 = fmul double %249, %245
  br label %__nv_exp.exit61

__nv_exp.exit61:                                  ; preds = %__nv_log1p.exit, %__internal_fast_icmp_abs_lt.exit.i58, %241
  %z.2.i60 = phi double [ %233, %__nv_log1p.exit ], [ %250, %241 ], [ %z.0.i59, %__internal_fast_icmp_abs_lt.exit.i58 ]
  %251 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i60) #13
  %252 = bitcast i32 %251 to float
  %253 = fcmp olt float %252, 0x3FFCAAAAA0000000
  %254 = fcmp ogt float %252, 0xBFFB333320000000
  %or.cond.i43 = and i1 %253, %254
  br i1 %or.cond.i43, label %255, label %272

255:                                              ; preds = %__nv_exp.exit61
  %256 = fadd double %z.2.i60, 2.000000e+00
  %257 = fdiv double %z.2.i60, %256
  %258 = fneg double %z.2.i60
  %259 = fmul double %257, %258
  %260 = fadd double %z.2.i60, %259
  %261 = fmul double %260, %260
  %262 = tail call double @llvm.fma.f64(double %261, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %263 = tail call double @llvm.fma.f64(double %262, double %261, double 0x3EF3B9FF890F468C)
  %264 = tail call double @llvm.fma.f64(double %263, double %261, double 0x3F17457EFD51BAF8)
  %265 = tail call double @llvm.fma.f64(double %264, double %261, double 0x3F3C71C8DE3CE825)
  %266 = tail call double @llvm.fma.f64(double %265, double %261, double 0x3F6249248FA4661F)
  %267 = tail call double @llvm.fma.f64(double %266, double %261, double 0x3F899999999D70C4)
  %268 = tail call double @llvm.fma.f64(double %267, double %261, double 0x3FB5555555555462)
  %269 = fmul double %261, %268
  %270 = tail call double @llvm.fma.f64(double %269, double %260, double %259)
  %271 = fadd double %z.2.i60, %270
  br label %__nv_log1p.exit53

272:                                              ; preds = %__nv_exp.exit61
  %273 = fadd double %z.2.i60, 1.000000e+00
  %274 = tail call i32 @llvm.nvvm.d2i.hi(double %273) #13
  %275 = tail call i32 @llvm.nvvm.d2i.lo(double %273) #13
  %276 = icmp slt i32 %274, 1048576
  %277 = fmul double %273, 0x4350000000000000
  %278 = tail call i32 @llvm.nvvm.d2i.lo(double %277) #13
  %279 = tail call i32 @llvm.nvvm.d2i.hi(double %277) #13
  br i1 %276, label %280, label %281

280:                                              ; preds = %272
  br label %281

281:                                              ; preds = %280, %272
  %.0.i44 = phi double [ %277, %280 ], [ %273, %272 ]
  %ihi.i.0.i45 = phi i32 [ %279, %280 ], [ %274, %272 ]
  %ilo.i.0.i46 = phi i32 [ %278, %280 ], [ %275, %272 ]
  %e.i.0.i47 = phi i32 [ -1077, %280 ], [ -1023, %272 ]
  %282 = add i32 %ihi.i.0.i45, -1
  %or.cond2.i48 = icmp ult i32 %282, 2146435071
  br i1 %or.cond2.i48, label %283, label %330

283:                                              ; preds = %281
  %284 = lshr i32 %ihi.i.0.i45, 20
  %285 = add nsw i32 %e.i.0.i47, %284
  %286 = and i32 %ihi.i.0.i45, 1048575
  %287 = or disjoint i32 %286, 1072693248
  %288 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i46, i32 %287) #13
  %289 = icmp ugt i32 %287, 1073127582
  %290 = tail call i32 @llvm.nvvm.d2i.lo(double %288) #13
  %291 = tail call i32 @llvm.nvvm.d2i.hi(double %288) #13
  %292 = add i32 %291, -1048576
  %293 = tail call double @llvm.nvvm.lohi.i2d(i32 %290, i32 %292) #13
  %spec.select63 = select i1 %289, double %293, double %288
  %294 = zext i1 %289 to i32
  %spec.select64 = add nsw i32 %285, %294
  %295 = fadd double %spec.select63, -1.000000e+00
  %296 = fadd double %spec.select63, 1.000000e+00
  %297 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %296) #13
  %298 = fneg double %296
  %299 = tail call double @llvm.fma.f64(double %298, double %297, double 1.000000e+00)
  %300 = tail call double @llvm.fma.f64(double %299, double %299, double %299)
  %301 = tail call double @llvm.fma.f64(double %300, double %297, double %297)
  %302 = fmul double %295, %301
  %303 = fadd double %302, %302
  %304 = fmul double %303, %303
  %305 = tail call double @llvm.fma.f64(double %304, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %306 = tail call double @llvm.fma.f64(double %305, double %304, double 0x3EF3B2669F02676F)
  %307 = tail call double @llvm.fma.f64(double %306, double %304, double 0x3F1745CBA9AB0956)
  %308 = tail call double @llvm.fma.f64(double %307, double %304, double 0x3F3C71C72D1B5154)
  %309 = tail call double @llvm.fma.f64(double %308, double %304, double 0x3F624924923BE72D)
  %310 = tail call double @llvm.fma.f64(double %309, double %304, double 0x3F8999999999A3C4)
  %311 = tail call double @llvm.fma.f64(double %310, double %304, double 0x3FB5555555555554)
  %312 = fsub double %295, %303
  %313 = fmul double %312, 2.000000e+00
  %314 = fneg double %303
  %315 = tail call double @llvm.fma.f64(double %314, double %295, double %313)
  %316 = fmul double %301, %315
  %317 = fmul double %304, %311
  %318 = tail call double @llvm.fma.f64(double %317, double %303, double %316)
  %319 = xor i32 %spec.select64, -2147483648
  %320 = tail call double @llvm.nvvm.lohi.i2d(i32 %319, i32 1127219200) #13
  %321 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %322 = fsub double %320, %321
  %323 = tail call double @llvm.fma.f64(double %322, double 0x3FE62E42FEFA39EF, double %303)
  %324 = fneg double %322
  %325 = tail call double @llvm.fma.f64(double %324, double 0x3FE62E42FEFA39EF, double %323)
  %326 = fsub double %325, %303
  %327 = fsub double %318, %326
  %328 = tail call double @llvm.fma.f64(double %322, double 0x3C7ABC9E3B39803F, double %327)
  %329 = fadd double %323, %328
  br label %__nv_log1p.exit53

330:                                              ; preds = %281
  %331 = tail call double @llvm.fma.f64(double %.0.i44, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %332 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i44) #13
  %333 = and i32 %332, 2147483647
  %334 = icmp eq i32 %333, 0
  %q.i.0.i49 = select i1 %334, double 0xFFF0000000000000, double %331
  br label %__nv_log1p.exit53

__nv_log1p.exit53:                                ; preds = %255, %283, %330
  %t.0.i50 = phi double [ %271, %255 ], [ %329, %283 ], [ %q.i.0.i49, %330 ]
  %335 = fcmp uno double %208, 0.000000e+00
  %336 = fcmp oge double %208, %210
  %337 = or i1 %335, %336
  %maximum.48.1.clone.1 = select i1 %337, double %208, double %210
  %add.4423.1.clone.1 = fadd double %208, %210
  %compare.1183.1.clone.1 = fcmp uno double %subtract.238.1.clone.1, 0.000000e+00
  %338 = icmp slt i64 %3, 10
  %339 = or i8 %7, %5
  %340 = trunc i8 %339 to i1
  %341 = xor i1 %340, true
  %342 = and i1 %338, %341
  %343 = zext i1 %342 to i64
  %344 = add i64 %3, %343
  %345 = trunc i8 %196 to i1
  %346 = select i1 %342, i1 %345, i1 false
  %347 = select i1 %346, double %204, double %206
  %348 = select i1 %345, double %202, double %204
  %349 = select i1 %342, double %348, double %202
  %350 = select i1 %342, i64 %198, i64 0
  %351 = add i64 %200, %350
  %352 = select i1 %342, i8 %15, i8 %5
  %353 = or i8 %15, %9
  %354 = icmp eq i8 %353, 0
  %355 = select i1 %342, i1 %354, i1 false
  %compare.1182.1.clone.1 = fcmp uno double %subtract.237.1.clone.1, 0.000000e+00
  %add.4421.3.clone.1 = fadd double %22, %24
  %356 = fcmp uno double %24, 0.000000e+00
  %357 = fcmp oge double %24, %22
  %358 = or i1 %356, %357
  %maximum.47.1.clone.1 = select i1 %358, double %24, double %22
  %add.4422.5.clone.1 = fadd double %maximum.47.1.clone.1, %t.0.i
  %359 = select i1 %compare.1182.1.clone.1, double %add.4421.3.clone.1, double %add.4422.5.clone.1
  %360 = select i1 %355, double %359, double %24
  %361 = add i32 %20, 1
  %362 = add i32 %361, %19
  %363 = tail call i32 @llvm.fshl.i32(i32 %361, i32 %361, i32 13)
  %364 = xor i32 %362, %363
  %365 = add i32 %364, %362
  %366 = tail call i32 @llvm.fshl.i32(i32 %364, i32 %364, i32 15)
  %367 = xor i32 %365, %366
  %368 = add i32 %367, %365
  %369 = tail call i32 @llvm.fshl.i32(i32 %367, i32 %367, i32 26)
  %370 = xor i32 %368, %369
  %371 = add i32 %370, %368
  %372 = add i32 %371, %20
  %373 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 6)
  %374 = xor i32 %371, %373
  %375 = xor i32 %19, %20
  %376 = xor i32 %375, 466688986
  %377 = add i32 %376, 1
  %378 = add i32 %377, %374
  %379 = add i32 %372, %378
  %380 = tail call i32 @llvm.fshl.i32(i32 %378, i32 %378, i32 17)
  %381 = xor i32 %379, %380
  %382 = add i32 %381, %379
  %383 = tail call i32 @llvm.fshl.i32(i32 %381, i32 %381, i32 29)
  %384 = xor i32 %382, %383
  %385 = add i32 %384, %382
  %386 = tail call i32 @llvm.fshl.i32(i32 %384, i32 %384, i32 16)
  %387 = xor i32 %385, %386
  %388 = add i32 %387, %385
  %389 = add i32 %388, %376
  %390 = tail call i32 @llvm.fshl.i32(i32 %387, i32 %387, i32 24)
  %391 = xor i32 %388, %390
  %392 = add i32 %19, 2
  %393 = add i32 %392, %391
  %394 = add i32 %389, %393
  %395 = tail call i32 @llvm.fshl.i32(i32 %393, i32 %393, i32 13)
  %396 = xor i32 %394, %395
  %397 = add i32 %396, %394
  %398 = tail call i32 @llvm.fshl.i32(i32 %396, i32 %396, i32 15)
  %399 = xor i32 %397, %398
  %400 = add i32 %399, %397
  %401 = tail call i32 @llvm.fshl.i32(i32 %399, i32 %399, i32 26)
  %402 = xor i32 %400, %401
  %403 = add i32 %402, %400
  %404 = add i32 %403, %19
  %405 = tail call i32 @llvm.fshl.i32(i32 %402, i32 %402, i32 6)
  %406 = xor i32 %403, %405
  %407 = add i32 %20, 3
  %408 = add i32 %407, %406
  %409 = add i32 %404, %408
  %410 = tail call i32 @llvm.fshl.i32(i32 %408, i32 %408, i32 17)
  %411 = xor i32 %409, %410
  %412 = add i32 %411, %409
  %413 = tail call i32 @llvm.fshl.i32(i32 %411, i32 %411, i32 29)
  %414 = xor i32 %412, %413
  %415 = add i32 %414, %412
  %416 = tail call i32 @llvm.fshl.i32(i32 %414, i32 %414, i32 16)
  %417 = xor i32 %415, %416
  %418 = add i32 %417, %415
  %419 = add i32 %418, %20
  %420 = tail call i32 @llvm.fshl.i32(i32 %417, i32 %417, i32 24)
  %421 = xor i32 %418, %420
  %422 = add i32 %376, 4
  %423 = add i32 %422, %421
  %424 = add i32 %419, %423
  %425 = tail call i32 @llvm.fshl.i32(i32 %423, i32 %423, i32 13)
  %426 = xor i32 %424, %425
  %427 = add i32 %426, %424
  %428 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %426, i32 15)
  %429 = xor i32 %427, %428
  %430 = add i32 %429, %427
  %431 = tail call i32 @llvm.fshl.i32(i32 %429, i32 %429, i32 26)
  %432 = xor i32 %430, %431
  %433 = add i32 %432, %430
  %434 = add i32 %433, %376
  %435 = zext i32 %434 to i64
  %436 = shl nuw i64 %435, 32
  %437 = tail call i32 @llvm.fshl.i32(i32 %432, i32 %432, i32 6)
  %438 = xor i32 %433, %437
  %439 = add i32 %19, 5
  %440 = add i32 %439, %438
  %441 = zext i32 %440 to i64
  %442 = or disjoint i64 %436, %441
  %443 = lshr i64 %442, 12
  %444 = or disjoint i64 %443, 4607182418800017408
  %445 = bitcast i64 %444 to double
  %add.4420.5.clone.1 = fadd double %445, -1.000000e+00
  %446 = fcmp ole double %add.4420.5.clone.1, 0.000000e+00
  %maximum.46.5.clone.1 = select i1 %446, double 0.000000e+00, double %add.4420.5.clone.1
  %447 = fcmp oge double %z.2.i, 1.000000e+00
  %minimum.10.7.clone.1 = select i1 %447, double 1.000000e+00, double %z.2.i
  %compare.1180.5.clone.1 = fcmp uge double %maximum.46.5.clone.1, %minimum.10.7.clone.1
  %448 = select i1 %compare.1180.5.clone.1, double %68, double %70
  %449 = select i1 %355, double %448, double %68
  %450 = select i1 %compare.1180.5.clone.1, double %64, double %66
  %451 = select i1 %355, double %450, double %64
  %452 = zext i1 %compare.1180.5.clone.1 to i8
  %compare.1184.3 = fcmp ole double %11, 0.000000e+00
  %compare.1185.7 = fcmp ole double %13, 0.000000e+00
  %453 = or i1 %compare.1184.3, %compare.1185.7
  %454 = zext i1 %453 to i8
  %455 = or i8 %9, %454
  %456 = select i1 %342, i8 %455, i8 %7
  %457 = zext i1 %342 to i8
  %add.4424.3.clone.1 = fadd double %maximum.48.1.clone.1, %t.0.i50
  %458 = select i1 %compare.1183.1.clone.1, double %add.4423.1.clone.1, double %add.4424.3.clone.1
  %459 = select i1 %342, double %458, double %208
  %460 = getelementptr i32, ptr addrspace(1) %arg23111, i64 %1
  %461 = load i32, ptr addrspace(1) %460, align 4, !invariant.load !270
  %462 = getelementptr i32, ptr addrspace(1) %arg24113, i64 %1
  %463 = load i32, ptr addrspace(1) %462, align 4
  %464 = select i1 %342, i32 %461, i32 %463
  %465 = getelementptr i32, ptr addrspace(1) %arg25115, i64 %1
  %466 = load i32, ptr addrspace(1) %465, align 4, !invariant.load !270
  %467 = getelementptr i32, ptr addrspace(1) %arg26117, i64 %1
  %468 = load i32, ptr addrspace(1) %467, align 4
  %469 = select i1 %342, i32 %466, i32 %468
  store i8 %456, ptr addrspace(1) %6, align 1
  store double %451, ptr addrspace(1) %63, align 8
  store double %449, ptr addrspace(1) %67, align 8
  store double %360, ptr addrspace(1) %23, align 8
  store i8 %352, ptr addrspace(1) %4, align 1
  %470 = getelementptr i8, ptr addrspace(1) %arg27119, i64 %1
  store i8 %452, ptr addrspace(1) %470, align 1
  store i64 %351, ptr addrspace(1) %199, align 8
  store double %349, ptr addrspace(1) %201, align 8
  store double %347, ptr addrspace(1) %205, align 8
  store i64 %344, ptr addrspace(1) %2, align 8
  store double %459, ptr addrspace(1) %207, align 8
  store i32 %464, ptr addrspace(1) %462, align 4
  store i32 %469, ptr addrspace(1) %467, align 4
  %471 = getelementptr i8, ptr addrspace(1) %arg28121, i64 %1
  store i8 %457, ptr addrspace(1) %471, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg0, ptr noalias nocapture align 128 dereferenceable(46080) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg3, ptr noalias nocapture align 128 dereferenceable(46080) %arg4) local_unnamed_addr #2 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !288
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 2880
  %4 = zext nneg i16 %3 to i64
  %5 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg25, i64 0, i64 %4
  %6 = load i8, ptr addrspace(1) %5, align 1, !invariant.load !270
  %7 = zext nneg i32 %linear_index to i64
  %8 = getelementptr double, ptr addrspace(1) %arg01, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !270
  %10 = getelementptr double, ptr addrspace(1) %arg13, i64 %7
  %11 = load double, ptr addrspace(1) %10, align 8
  %12 = trunc i8 %6 to i1
  %13 = select i1 %12, double %9, double %11
  %14 = getelementptr double, ptr addrspace(1) %arg37, i64 %7
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !270
  %16 = getelementptr double, ptr addrspace(1) %arg49, i64 %7
  %17 = load double, ptr addrspace(1) %16, align 8
  %18 = select i1 %12, double %15, double %17
  store double %13, ptr addrspace(1) %10, align 8
  store double %18, ptr addrspace(1) %16, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_6(ptr noalias nocapture align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture align 128 dereferenceable(768) %arg5, ptr noalias nocapture align 128 dereferenceable(768) %arg6, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture align 128 dereferenceable(768) %arg9, ptr noalias nocapture align 128 dereferenceable(768) %arg10, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg12, ptr noalias nocapture align 128 dereferenceable(768) %arg13, ptr noalias nocapture align 128 dereferenceable(768) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg15, ptr noalias nocapture align 128 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg17, ptr noalias nocapture align 128 dereferenceable(768) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg19, ptr noalias nocapture align 128 dereferenceable(768) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg21, ptr noalias nocapture align 128 dereferenceable(768) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg23, ptr noalias nocapture align 128 dereferenceable(768) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg28, ptr noalias nocapture align 128 dereferenceable(768) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg30, ptr noalias nocapture align 128 dereferenceable(768) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg32, ptr noalias nocapture align 128 dereferenceable(768) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg34, ptr noalias nocapture align 128 dereferenceable(768) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg36, ptr noalias nocapture align 128 dereferenceable(768) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg38, ptr noalias nocapture align 128 dereferenceable(768) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg40, ptr noalias nocapture align 128 dereferenceable(768) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg42, ptr noalias nocapture align 128 dereferenceable(768) %arg43, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg44, ptr noalias nocapture align 128 dereferenceable(768) %arg45, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg46, ptr noalias nocapture align 128 dereferenceable(768) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg48, ptr noalias nocapture align 128 dereferenceable(768) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg50) local_unnamed_addr #2 {
entry:
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
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg926 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg416, i64 0, i64 %1
  %3 = load i8, ptr addrspace(1) %2, align 1, !invariant.load !270
  %4 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg314, i64 0, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !270
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr double, ptr addrspace(1) %arg110, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !270
  %9 = trunc i8 %5 to i1
  %10 = getelementptr double, ptr addrspace(1) %arg01, i64 %6
  %11 = load double, ptr addrspace(1) %10, align 8
  %12 = trunc i8 %3 to i1
  %13 = select i1 %12, i1 %9, i1 false
  %14 = select i1 %13, double %8, double %11
  %15 = getelementptr double, ptr addrspace(1) %arg518, i64 %6
  %16 = load double, ptr addrspace(1) %15, align 8
  %17 = select i1 %9, double %16, double %8
  %18 = select i1 %12, double %17, double %16
  %19 = getelementptr double, ptr addrspace(1) %arg620, i64 %6
  %20 = load double, ptr addrspace(1) %19, align 8
  %21 = getelementptr double, ptr addrspace(1) %arg824, i64 %6
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !270
  %23 = select i1 %9, double %20, double %22
  %24 = select i1 %12, double %23, double %20
  %25 = getelementptr double, ptr addrspace(1) %arg926, i64 %6
  %26 = load double, ptr addrspace(1) %25, align 8
  %27 = select i1 %13, double %22, double %26
  %28 = getelementptr double, ptr addrspace(1) %arg1028, i64 %6
  %29 = load double, ptr addrspace(1) %28, align 8
  %30 = getelementptr double, ptr addrspace(1) %arg1232, i64 %6
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !270
  %32 = select i1 %9, double %29, double %31
  %33 = select i1 %12, double %32, double %29
  %34 = getelementptr double, ptr addrspace(1) %arg1334, i64 %6
  %35 = load double, ptr addrspace(1) %34, align 8
  %36 = select i1 %13, double %31, double %35
  %37 = getelementptr double, ptr addrspace(1) %arg1538, i64 %6
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !270
  %39 = getelementptr double, ptr addrspace(1) %arg1436, i64 %6
  %40 = load double, ptr addrspace(1) %39, align 8
  %add.4429.5.clone.1 = fadd double %38, %40
  %41 = select i1 %12, double %add.4429.5.clone.1, double %40
  %42 = getelementptr double, ptr addrspace(1) %arg1742, i64 %6
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !270
  %44 = getelementptr double, ptr addrspace(1) %arg1640, i64 %6
  %45 = load double, ptr addrspace(1) %44, align 8
  %add.4425.5.clone.1 = fadd double %43, %45
  %46 = select i1 %12, double %add.4425.5.clone.1, double %45
  %47 = getelementptr double, ptr addrspace(1) %arg1946, i64 %6
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !270
  %49 = getelementptr double, ptr addrspace(1) %arg1844, i64 %6
  %50 = load double, ptr addrspace(1) %49, align 8
  %add.4426.5.clone.1 = fadd double %48, %50
  %51 = select i1 %12, double %add.4426.5.clone.1, double %50
  %52 = getelementptr double, ptr addrspace(1) %arg2150, i64 %6
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !270
  %54 = getelementptr double, ptr addrspace(1) %arg2048, i64 %6
  %55 = load double, ptr addrspace(1) %54, align 8
  %add.4427.5.clone.1 = fadd double %53, %55
  %56 = select i1 %12, double %add.4427.5.clone.1, double %55
  %57 = getelementptr double, ptr addrspace(1) %arg2354, i64 %6
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !270
  %59 = getelementptr double, ptr addrspace(1) %arg2252, i64 %6
  %60 = load double, ptr addrspace(1) %59, align 8
  %add.4428.5.clone.1 = fadd double %58, %60
  %61 = select i1 %12, double %add.4428.5.clone.1, double %60
  %62 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg2762, i64 0, i64 %1
  %63 = load i8, ptr addrspace(1) %62, align 1, !invariant.load !270
  %64 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg2864, i64 0, i64 %1
  %65 = load i8, ptr addrspace(1) %64, align 1, !invariant.load !270
  %66 = or i8 %65, %63
  %67 = icmp eq i8 %66, 0
  %68 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg2660, i64 0, i64 %1
  %69 = load i8, ptr addrspace(1) %68, align 1, !invariant.load !270
  %70 = getelementptr double, ptr addrspace(1) %arg2456, i64 %6
  %71 = load double, ptr addrspace(1) %70, align 8
  %72 = getelementptr double, ptr addrspace(1) %arg2558, i64 %6
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !270
  %74 = trunc i8 %69 to i1
  %75 = select i1 %74, double %71, double %73
  %76 = select i1 %12, i1 %67, i1 false
  %77 = select i1 %76, double %75, double %71
  %78 = getelementptr double, ptr addrspace(1) %arg2966, i64 %6
  %79 = load double, ptr addrspace(1) %78, align 8
  %80 = getelementptr double, ptr addrspace(1) %arg3068, i64 %6
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !270
  %82 = select i1 %74, double %79, double %81
  %83 = select i1 %76, double %82, double %79
  %84 = getelementptr double, ptr addrspace(1) %arg3170, i64 %6
  %85 = load double, ptr addrspace(1) %84, align 8
  %86 = getelementptr double, ptr addrspace(1) %arg3272, i64 %6
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !270
  %88 = select i1 %74, double %85, double %87
  %89 = select i1 %76, double %88, double %85
  %90 = getelementptr double, ptr addrspace(1) %arg3374, i64 %6
  %91 = load double, ptr addrspace(1) %90, align 8
  %92 = getelementptr double, ptr addrspace(1) %arg3476, i64 %6
  %93 = load double, ptr addrspace(1) %92, align 8, !invariant.load !270
  %94 = select i1 %74, double %91, double %93
  %95 = select i1 %76, double %94, double %91
  %96 = getelementptr double, ptr addrspace(1) %arg3578, i64 %6
  %97 = load double, ptr addrspace(1) %96, align 8
  %98 = getelementptr double, ptr addrspace(1) %arg3680, i64 %6
  %99 = load double, ptr addrspace(1) %98, align 8, !invariant.load !270
  %100 = select i1 %74, double %97, double %99
  %101 = select i1 %76, double %100, double %97
  %102 = getelementptr double, ptr addrspace(1) %arg3782, i64 %6
  %103 = load double, ptr addrspace(1) %102, align 8
  %104 = getelementptr double, ptr addrspace(1) %arg3884, i64 %6
  %105 = load double, ptr addrspace(1) %104, align 8, !invariant.load !270
  %106 = select i1 %74, double %103, double %105
  %107 = select i1 %76, double %106, double %103
  %108 = getelementptr double, ptr addrspace(1) %arg3986, i64 %6
  %109 = load double, ptr addrspace(1) %108, align 8
  %110 = getelementptr double, ptr addrspace(1) %arg4088, i64 %6
  %111 = load double, ptr addrspace(1) %110, align 8, !invariant.load !270
  %112 = select i1 %74, double %109, double %111
  %113 = select i1 %76, double %112, double %109
  %114 = getelementptr double, ptr addrspace(1) %arg4190, i64 %6
  %115 = load double, ptr addrspace(1) %114, align 8
  %116 = getelementptr double, ptr addrspace(1) %arg4292, i64 %6
  %117 = load double, ptr addrspace(1) %116, align 8, !invariant.load !270
  %118 = select i1 %74, double %115, double %117
  %119 = select i1 %76, double %118, double %115
  %120 = getelementptr double, ptr addrspace(1) %arg4394, i64 %6
  %121 = load double, ptr addrspace(1) %120, align 8
  %122 = getelementptr double, ptr addrspace(1) %arg4496, i64 %6
  %123 = load double, ptr addrspace(1) %122, align 8, !invariant.load !270
  %124 = select i1 %74, double %121, double %123
  %125 = select i1 %76, double %124, double %121
  %126 = getelementptr double, ptr addrspace(1) %arg4598, i64 %6
  %127 = load double, ptr addrspace(1) %126, align 8
  %128 = getelementptr double, ptr addrspace(1) %arg46100, i64 %6
  %129 = load double, ptr addrspace(1) %128, align 8, !invariant.load !270
  %130 = select i1 %74, double %127, double %129
  %131 = select i1 %76, double %130, double %127
  %132 = getelementptr double, ptr addrspace(1) %arg47102, i64 %6
  %133 = load double, ptr addrspace(1) %132, align 8
  %134 = getelementptr double, ptr addrspace(1) %arg48104, i64 %6
  %135 = load double, ptr addrspace(1) %134, align 8, !invariant.load !270
  %136 = select i1 %74, double %133, double %135
  %137 = select i1 %76, double %136, double %133
  %138 = getelementptr double, ptr addrspace(1) %arg49106, i64 %6
  %139 = load double, ptr addrspace(1) %138, align 8
  %140 = getelementptr double, ptr addrspace(1) %arg50108, i64 %6
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !270
  %142 = select i1 %74, double %139, double %141
  %143 = select i1 %76, double %142, double %139
  store double %14, ptr addrspace(1) %10, align 8
  store double %18, ptr addrspace(1) %15, align 8
  store double %24, ptr addrspace(1) %19, align 8
  store double %27, ptr addrspace(1) %25, align 8
  store double %33, ptr addrspace(1) %28, align 8
  store double %36, ptr addrspace(1) %34, align 8
  store double %41, ptr addrspace(1) %39, align 8
  store double %46, ptr addrspace(1) %44, align 8
  store double %51, ptr addrspace(1) %49, align 8
  store double %56, ptr addrspace(1) %54, align 8
  store double %61, ptr addrspace(1) %59, align 8
  store double %77, ptr addrspace(1) %70, align 8
  store double %83, ptr addrspace(1) %78, align 8
  store double %89, ptr addrspace(1) %84, align 8
  store double %95, ptr addrspace(1) %90, align 8
  store double %101, ptr addrspace(1) %96, align 8
  store double %107, ptr addrspace(1) %102, align 8
  store double %113, ptr addrspace(1) %108, align 8
  store double %119, ptr addrspace(1) %114, align 8
  store double %125, ptr addrspace(1) %120, align 8
  store double %131, ptr addrspace(1) %126, align 8
  store double %137, ptr addrspace(1) %132, align 8
  store double %143, ptr addrspace(1) %138, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_5(ptr noalias nocapture align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture align 128 dereferenceable(768) %arg5, ptr noalias nocapture align 128 dereferenceable(768) %arg6, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg8, ptr noalias nocapture align 128 dereferenceable(768) %arg9, ptr noalias nocapture align 128 dereferenceable(768) %arg10, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg12, ptr noalias nocapture align 128 dereferenceable(768) %arg13, ptr noalias nocapture align 128 dereferenceable(768) %arg14, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg16, ptr noalias nocapture align 128 dereferenceable(768) %arg17, ptr noalias nocapture align 128 dereferenceable(768) %arg18, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg20, ptr noalias nocapture align 128 dereferenceable(768) %arg21, ptr noalias nocapture align 128 dereferenceable(768) %arg22, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg24, ptr noalias nocapture align 128 dereferenceable(768) %arg25, ptr noalias nocapture align 128 dereferenceable(768) %arg26, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg28, ptr noalias nocapture align 128 dereferenceable(768) %arg29, ptr noalias nocapture align 128 dereferenceable(768) %arg30, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg32, ptr noalias nocapture align 128 dereferenceable(768) %arg33, ptr noalias nocapture align 128 dereferenceable(768) %arg34, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg36, ptr noalias nocapture align 128 dereferenceable(768) %arg37, ptr noalias nocapture align 128 dereferenceable(768) %arg38, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg40, ptr noalias nocapture align 128 dereferenceable(768) %arg41, ptr noalias nocapture align 128 dereferenceable(768) %arg42, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg43, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg44, ptr noalias nocapture align 128 dereferenceable(768) %arg45, ptr noalias nocapture align 128 dereferenceable(768) %arg46, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg48, ptr noalias nocapture align 128 dereferenceable(768) %arg49, ptr noalias nocapture align 128 dereferenceable(768) %arg50, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg52, ptr noalias nocapture align 128 dereferenceable(768) %arg53, ptr noalias nocapture align 128 dereferenceable(768) %arg54, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg55, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg56, ptr noalias nocapture align 128 dereferenceable(768) %arg57, ptr noalias nocapture align 128 dereferenceable(768) %arg58, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg59, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg60, ptr noalias nocapture align 128 dereferenceable(768) %arg61, ptr noalias nocapture align 128 dereferenceable(768) %arg62, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg63) local_unnamed_addr #2 {
entry:
  %arg63134 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62132 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61130 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60128 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg58124 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57122 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56120 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg54116 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53114 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52112 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg50108 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49106 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48104 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg46100 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg4598 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg4496 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg4292 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg4190 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg4088 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg3884 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg3782 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg3680 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3476 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3374 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg3272 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg3068 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2966 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2864 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2660 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2558 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2456 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2252 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2150 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1742 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1436 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1334 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1232 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg926 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %.cmp = icmp ugt i32 %0, 47
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg416, i64 0, i64 %1
  %3 = load i8, ptr addrspace(1) %2, align 1, !invariant.load !270
  %4 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg314, i64 0, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !270
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr double, ptr addrspace(1) %arg110, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !270
  %9 = trunc i8 %5 to i1
  %10 = getelementptr double, ptr addrspace(1) %arg01, i64 %6
  %11 = load double, ptr addrspace(1) %10, align 8
  %12 = trunc i8 %3 to i1
  %13 = select i1 %12, i1 %9, i1 false
  %14 = select i1 %13, double %8, double %11
  %15 = getelementptr double, ptr addrspace(1) %arg518, i64 %6
  %16 = load double, ptr addrspace(1) %15, align 8
  %17 = select i1 %9, double %16, double %8
  %18 = select i1 %12, double %17, double %16
  %19 = getelementptr double, ptr addrspace(1) %arg620, i64 %6
  %20 = load double, ptr addrspace(1) %19, align 8
  %21 = getelementptr double, ptr addrspace(1) %arg824, i64 %6
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !270
  %23 = select i1 %9, double %20, double %22
  %24 = select i1 %12, double %23, double %20
  %25 = getelementptr double, ptr addrspace(1) %arg926, i64 %6
  %26 = load double, ptr addrspace(1) %25, align 8
  %27 = select i1 %13, double %22, double %26
  %28 = getelementptr double, ptr addrspace(1) %arg1028, i64 %6
  %29 = load double, ptr addrspace(1) %28, align 8
  %30 = getelementptr double, ptr addrspace(1) %arg1232, i64 %6
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !270
  %32 = select i1 %9, double %29, double %31
  %33 = select i1 %12, double %32, double %29
  %34 = getelementptr double, ptr addrspace(1) %arg1334, i64 %6
  %35 = load double, ptr addrspace(1) %34, align 8
  %36 = select i1 %13, double %31, double %35
  %37 = getelementptr double, ptr addrspace(1) %arg1436, i64 %6
  %38 = load double, ptr addrspace(1) %37, align 8
  %39 = getelementptr double, ptr addrspace(1) %arg1640, i64 %6
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !270
  %41 = select i1 %9, double %38, double %40
  %42 = select i1 %12, double %41, double %38
  %43 = getelementptr double, ptr addrspace(1) %arg1742, i64 %6
  %44 = load double, ptr addrspace(1) %43, align 8
  %45 = select i1 %13, double %40, double %44
  %46 = getelementptr double, ptr addrspace(1) %arg1844, i64 %6
  %47 = load double, ptr addrspace(1) %46, align 8
  %48 = getelementptr double, ptr addrspace(1) %arg2048, i64 %6
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !270
  %50 = select i1 %9, double %47, double %49
  %51 = select i1 %12, double %50, double %47
  %52 = getelementptr double, ptr addrspace(1) %arg2150, i64 %6
  %53 = load double, ptr addrspace(1) %52, align 8
  %54 = select i1 %13, double %49, double %53
  %55 = getelementptr double, ptr addrspace(1) %arg2252, i64 %6
  %56 = load double, ptr addrspace(1) %55, align 8
  %57 = getelementptr double, ptr addrspace(1) %arg2456, i64 %6
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !270
  %59 = select i1 %9, double %56, double %58
  %60 = select i1 %12, double %59, double %56
  %61 = getelementptr double, ptr addrspace(1) %arg2558, i64 %6
  %62 = load double, ptr addrspace(1) %61, align 8
  %63 = select i1 %13, double %58, double %62
  %64 = getelementptr double, ptr addrspace(1) %arg2660, i64 %6
  %65 = load double, ptr addrspace(1) %64, align 8
  %66 = getelementptr double, ptr addrspace(1) %arg2864, i64 %6
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !270
  %68 = select i1 %9, double %65, double %67
  %69 = select i1 %12, double %68, double %65
  %70 = getelementptr double, ptr addrspace(1) %arg2966, i64 %6
  %71 = load double, ptr addrspace(1) %70, align 8
  %72 = select i1 %13, double %67, double %71
  %73 = getelementptr double, ptr addrspace(1) %arg3068, i64 %6
  %74 = load double, ptr addrspace(1) %73, align 8
  %75 = getelementptr double, ptr addrspace(1) %arg3272, i64 %6
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !270
  %77 = select i1 %9, double %74, double %76
  %78 = select i1 %12, double %77, double %74
  %79 = getelementptr double, ptr addrspace(1) %arg3374, i64 %6
  %80 = load double, ptr addrspace(1) %79, align 8
  %81 = select i1 %13, double %76, double %80
  %82 = getelementptr double, ptr addrspace(1) %arg3476, i64 %6
  %83 = load double, ptr addrspace(1) %82, align 8
  %84 = getelementptr double, ptr addrspace(1) %arg3680, i64 %6
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !270
  %86 = select i1 %9, double %83, double %85
  %87 = select i1 %12, double %86, double %83
  %88 = getelementptr double, ptr addrspace(1) %arg3782, i64 %6
  %89 = load double, ptr addrspace(1) %88, align 8
  %90 = select i1 %13, double %85, double %89
  %91 = getelementptr double, ptr addrspace(1) %arg3884, i64 %6
  %92 = load double, ptr addrspace(1) %91, align 8
  %93 = getelementptr double, ptr addrspace(1) %arg4088, i64 %6
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !270
  %95 = select i1 %9, double %92, double %94
  %96 = select i1 %12, double %95, double %92
  %97 = getelementptr double, ptr addrspace(1) %arg4190, i64 %6
  %98 = load double, ptr addrspace(1) %97, align 8
  %99 = select i1 %13, double %94, double %98
  %100 = getelementptr double, ptr addrspace(1) %arg4292, i64 %6
  %101 = load double, ptr addrspace(1) %100, align 8
  %102 = getelementptr double, ptr addrspace(1) %arg4496, i64 %6
  %103 = load double, ptr addrspace(1) %102, align 8, !invariant.load !270
  %104 = select i1 %9, double %101, double %103
  %105 = select i1 %12, double %104, double %101
  %106 = getelementptr double, ptr addrspace(1) %arg4598, i64 %6
  %107 = load double, ptr addrspace(1) %106, align 8
  %108 = select i1 %13, double %103, double %107
  %109 = getelementptr double, ptr addrspace(1) %arg46100, i64 %6
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg48104, i64 %6
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !270
  %113 = select i1 %9, double %110, double %112
  %114 = select i1 %12, double %113, double %110
  %115 = getelementptr double, ptr addrspace(1) %arg49106, i64 %6
  %116 = load double, ptr addrspace(1) %115, align 8
  %117 = select i1 %13, double %112, double %116
  %118 = getelementptr double, ptr addrspace(1) %arg50108, i64 %6
  %119 = load double, ptr addrspace(1) %118, align 8
  %120 = getelementptr double, ptr addrspace(1) %arg52112, i64 %6
  %121 = load double, ptr addrspace(1) %120, align 8, !invariant.load !270
  %122 = select i1 %9, double %119, double %121
  %123 = select i1 %12, double %122, double %119
  %124 = getelementptr double, ptr addrspace(1) %arg53114, i64 %6
  %125 = load double, ptr addrspace(1) %124, align 8
  %126 = select i1 %13, double %121, double %125
  %127 = getelementptr double, ptr addrspace(1) %arg54116, i64 %6
  %128 = load double, ptr addrspace(1) %127, align 8
  %129 = getelementptr double, ptr addrspace(1) %arg56120, i64 %6
  %130 = load double, ptr addrspace(1) %129, align 8, !invariant.load !270
  %131 = select i1 %9, double %128, double %130
  %132 = select i1 %12, double %131, double %128
  %133 = getelementptr double, ptr addrspace(1) %arg57122, i64 %6
  %134 = load double, ptr addrspace(1) %133, align 8
  %135 = select i1 %13, double %130, double %134
  %136 = getelementptr double, ptr addrspace(1) %arg58124, i64 %6
  %137 = load double, ptr addrspace(1) %136, align 8
  %138 = getelementptr double, ptr addrspace(1) %arg60128, i64 %6
  %139 = load double, ptr addrspace(1) %138, align 8, !invariant.load !270
  %140 = select i1 %9, double %137, double %139
  %141 = select i1 %12, double %140, double %137
  %142 = getelementptr double, ptr addrspace(1) %arg61130, i64 %6
  %143 = load double, ptr addrspace(1) %142, align 8
  %144 = select i1 %13, double %139, double %143
  %145 = getelementptr double, ptr addrspace(1) %arg63134, i64 %6
  %146 = load double, ptr addrspace(1) %145, align 8, !invariant.load !270
  %147 = getelementptr double, ptr addrspace(1) %arg62132, i64 %6
  %148 = load double, ptr addrspace(1) %147, align 8
  %add.4430.5.clone.1 = fadd double %146, %148
  %149 = select i1 %12, double %add.4430.5.clone.1, double %148
  store double %14, ptr addrspace(1) %10, align 8
  store double %18, ptr addrspace(1) %15, align 8
  store double %24, ptr addrspace(1) %19, align 8
  store double %27, ptr addrspace(1) %25, align 8
  store double %33, ptr addrspace(1) %28, align 8
  store double %36, ptr addrspace(1) %34, align 8
  store double %42, ptr addrspace(1) %37, align 8
  store double %45, ptr addrspace(1) %43, align 8
  store double %51, ptr addrspace(1) %46, align 8
  store double %54, ptr addrspace(1) %52, align 8
  store double %60, ptr addrspace(1) %55, align 8
  store double %63, ptr addrspace(1) %61, align 8
  store double %69, ptr addrspace(1) %64, align 8
  store double %72, ptr addrspace(1) %70, align 8
  store double %78, ptr addrspace(1) %73, align 8
  store double %81, ptr addrspace(1) %79, align 8
  store double %87, ptr addrspace(1) %82, align 8
  store double %90, ptr addrspace(1) %88, align 8
  store double %96, ptr addrspace(1) %91, align 8
  store double %99, ptr addrspace(1) %97, align 8
  store double %105, ptr addrspace(1) %100, align 8
  store double %108, ptr addrspace(1) %106, align 8
  store double %114, ptr addrspace(1) %109, align 8
  store double %117, ptr addrspace(1) %115, align 8
  store double %123, ptr addrspace(1) %118, align 8
  store double %126, ptr addrspace(1) %124, align 8
  store double %132, ptr addrspace(1) %127, align 8
  store double %135, ptr addrspace(1) %133, align 8
  store double %141, ptr addrspace(1) %136, align 8
  store double %144, ptr addrspace(1) %142, align 8
  store double %149, ptr addrspace(1) %147, align 8
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
  %param_2.5813 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !270
  %1 = icmp slt i64 %param_2.5813, 0
  %2 = add i64 %param_2.5813, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5813
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.76604 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !270
  %7 = getelementptr inbounds [10 x [2 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %param_1.76604, ptr addrspace(1) %7, align 1
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
  %param_2.5784 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !270
  %1 = icmp slt i64 %param_2.5784, 0
  %2 = add i64 %param_2.5784, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5784
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.76314 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !270
  %7 = getelementptr inbounds [10 x [2 x i64]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i64 %param_1.76314, ptr addrspace(1) %7, align 8
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
  %param_2.5817 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !270
  %1 = icmp slt i64 %param_2.5817, 0
  %2 = add i64 %param_2.5817, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5817
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.76644 = load double, ptr addrspace(1) %6, align 8, !invariant.load !270
  %7 = getelementptr inbounds [10 x [2 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.76644, ptr addrspace(1) %7, align 8
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
  %param_3.4890 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !270
  %1 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.57764 = load double, ptr addrspace(1) %1, align 8, !invariant.load !270
  %2 = tail call double @llvm.fma.f64(double %param_2.57764, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #13
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #13
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_2.57764)
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
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #13
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #13
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #13
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.57764) #13
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #13
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_2.57764, 0.000000e+00
  %28 = fadd double %param_2.57764, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #13
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #13
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_3.4890, 0
  %41 = add i64 %param_3.4890, 10
  %42 = select i1 %40, i64 %41, i64 %param_3.4890
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 9)
  %45 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.76235 = load i64, ptr addrspace(1) %45, align 8, !invariant.load !270
  %46 = sitofp i64 %param_1.76235 to double
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
declare double @llvm.nvvm.rcp.approx.ftz.d(double) #11

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.add.rn.d(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.f(float) #1

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
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none) }
attributes #4 = { norecurse nounwind }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { convergent nocallback nounwind }
attributes #7 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #8 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #10 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #11 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #12 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nounwind }

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
!14 = !{ptr @input_concatenate_fusion_2, !"kernel", i32 1}
!15 = !{ptr @input_concatenate_fusion_2, !"reqntidx", i32 2}
!16 = !{ptr @loop_broadcast_fusion_23, !"kernel", i32 1}
!17 = !{ptr @loop_broadcast_fusion_23, !"reqntidx", i32 2}
!18 = !{ptr @loop_broadcast_fusion_21, !"kernel", i32 1}
!19 = !{ptr @loop_broadcast_fusion_21, !"reqntidx", i32 2}
!20 = !{ptr @loop_slice_fusion_2, !"kernel", i32 1}
!21 = !{ptr @loop_slice_fusion_2, !"reqntidx", i32 8}
!22 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!23 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 128}
!24 = !{ptr @input_reduce_fusion_8, !"kernel", i32 1}
!25 = !{ptr @input_reduce_fusion_8, !"reqntidx", i32 64}
!26 = !{ptr @loop_add_fusion_3, !"kernel", i32 1}
!27 = !{ptr @loop_add_fusion_3, !"reqntidx", i32 2}
!28 = !{ptr @wrapped_slice_5, !"kernel", i32 1}
!29 = !{ptr @wrapped_slice_5, !"reqntidx", i32 96}
!30 = !{ptr @wrapped_slice_4, !"kernel", i32 1}
!31 = !{ptr @wrapped_slice_4, !"reqntidx", i32 96}
!32 = !{ptr @wrapped_slice_3, !"kernel", i32 1}
!33 = !{ptr @wrapped_slice_3, !"reqntidx", i32 96}
!34 = !{ptr @wrapped_slice_2, !"kernel", i32 1}
!35 = !{ptr @wrapped_slice_2, !"reqntidx", i32 96}
!36 = !{ptr @wrapped_slice_1, !"kernel", i32 1}
!37 = !{ptr @wrapped_slice_1, !"reqntidx", i32 96}
!38 = !{ptr @wrapped_slice, !"kernel", i32 1}
!39 = !{ptr @wrapped_slice, !"reqntidx", i32 96}
!40 = !{ptr @loop_dynamic_update_slice_fusion_98, !"kernel", i32 1}
!41 = !{ptr @loop_dynamic_update_slice_fusion_98, !"reqntidx", i32 96}
!42 = !{ptr @loop_broadcast_fusion_22, !"kernel", i32 1}
!43 = !{ptr @loop_broadcast_fusion_22, !"reqntidx", i32 1024}
!44 = !{ptr @input_reduce_fusion_7, !"kernel", i32 1}
!45 = !{ptr @input_reduce_fusion_7, !"reqntidx", i32 32}
!46 = !{ptr @loop_add_fusion_2, !"kernel", i32 1}
!47 = !{ptr @loop_add_fusion_2, !"reqntidx", i32 2}
!48 = !{ptr @input_concatenate_fusion_1, !"kernel", i32 1}
!49 = !{ptr @input_concatenate_fusion_1, !"reqntidx", i32 6}
!50 = !{ptr @loop_slice_fusion_1, !"kernel", i32 1}
!51 = !{ptr @loop_slice_fusion_1, !"reqntidx", i32 4}
!52 = !{ptr @loop_broadcast_compare_select_fusion, !"kernel", i32 1}
!53 = !{ptr @loop_broadcast_compare_select_fusion, !"reqntidx", i32 2}
!54 = !{ptr @loop_select_fusion_7, !"kernel", i32 1}
!55 = !{ptr @loop_select_fusion_7, !"reqntidx", i32 96}
!56 = !{ptr @input_reduce_fusion_5, !"kernel", i32 1}
!57 = !{ptr @input_reduce_fusion_5, !"reqntidx", i32 64}
!58 = !{ptr @loop_add_minimum_select_fusion, !"kernel", i32 1}
!59 = !{ptr @loop_add_minimum_select_fusion, !"reqntidx", i32 2}
!60 = !{ptr @input_reduce_fusion_4, !"kernel", i32 1}
!61 = !{ptr @input_reduce_fusion_4, !"reqntidx", i32 32}
!62 = !{ptr @input_add_exponential_reduce_select_fusion, !"kernel", i32 1}
!63 = !{ptr @input_add_exponential_reduce_select_fusion, !"reqntidx", i32 64}
!64 = !{ptr @loop_broadcast_fusion_14, !"kernel", i32 1}
!65 = !{ptr @loop_broadcast_fusion_14, !"reqntidx", i32 1024}
!66 = !{ptr @loop_broadcast_fusion_13, !"kernel", i32 1}
!67 = !{ptr @loop_broadcast_fusion_13, !"reqntidx", i32 96}
!68 = !{ptr @loop_broadcast_fusion_6, !"kernel", i32 1}
!69 = !{ptr @loop_broadcast_fusion_6, !"reqntidx", i32 1024}
!70 = !{ptr @loop_broadcast_fusion_11, !"kernel", i32 1}
!71 = !{ptr @loop_broadcast_fusion_11, !"reqntidx", i32 96}
!72 = !{ptr @loop_broadcast_fusion_5, !"kernel", i32 1}
!73 = !{ptr @loop_broadcast_fusion_5, !"reqntidx", i32 1024}
!74 = !{ptr @loop_broadcast_fusion_8, !"kernel", i32 1}
!75 = !{ptr @loop_broadcast_fusion_8, !"reqntidx", i32 1024}
!76 = !{ptr @loop_broadcast_fusion_15, !"kernel", i32 1}
!77 = !{ptr @loop_broadcast_fusion_15, !"reqntidx", i32 192}
!78 = !{ptr @loop_broadcast_fusion_10, !"kernel", i32 1}
!79 = !{ptr @loop_broadcast_fusion_10, !"reqntidx", i32 96}
!80 = !{ptr @loop_broadcast_fusion_12, !"kernel", i32 1}
!81 = !{ptr @loop_broadcast_fusion_12, !"reqntidx", i32 96}
!82 = !{ptr @loop_broadcast_fusion_9, !"kernel", i32 1}
!83 = !{ptr @loop_broadcast_fusion_9, !"reqntidx", i32 192}
!84 = !{ptr @loop_broadcast_fusion_18, !"kernel", i32 1}
!85 = !{ptr @loop_broadcast_fusion_18, !"reqntidx", i32 48}
!86 = !{ptr @loop_compare_fusion_1, !"kernel", i32 1}
!87 = !{ptr @loop_compare_fusion_1, !"reqntidx", i32 1}
!88 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 1}
!90 = !{ptr @loop_dynamic_update_slice_fusion_52, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion_52, !"reqntidx", i32 1}
!92 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 96}
!94 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 96}
!96 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 96}
!98 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 96}
!100 = !{ptr @loop_dynamic_update_slice_fusion_41, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_41, !"reqntidx", i32 96}
!102 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 96}
!104 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 96}
!106 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 96}
!108 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 96}
!110 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 96}
!112 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 96}
!114 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 96}
!116 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 96}
!118 = !{ptr @loop_dynamic_update_slice_fusion_47, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_47, !"reqntidx", i32 96}
!120 = !{ptr @loop_add_divide_exponential_select_fusion, !"kernel", i32 1}
!121 = !{ptr @loop_add_divide_exponential_select_fusion, !"reqntidx", i32 96}
!122 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 96}
!124 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!125 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 96}
!126 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 96}
!128 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!129 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 96}
!130 = !{ptr @loop_dynamic_update_slice_fusion_28, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_28, !"reqntidx", i32 96}
!132 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 96}
!134 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 96}
!136 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 96}
!138 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 96}
!140 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 96}
!142 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 96}
!144 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 96}
!146 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 96}
!148 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!149 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 96}
!150 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!151 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 96}
!152 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!153 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 96}
!154 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!155 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 96}
!156 = !{ptr @loop_dynamic_update_slice_fusion_20, !"kernel", i32 1}
!157 = !{ptr @loop_dynamic_update_slice_fusion_20, !"reqntidx", i32 96}
!158 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!159 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 96}
!160 = !{ptr @loop_dynamic_update_slice_fusion_24, !"kernel", i32 1}
!161 = !{ptr @loop_dynamic_update_slice_fusion_24, !"reqntidx", i32 96}
!162 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 96}
!164 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 96}
!166 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 96}
!168 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 96}
!170 = !{ptr @loop_dynamic_update_slice_fusion_31, !"kernel", i32 1}
!171 = !{ptr @loop_dynamic_update_slice_fusion_31, !"reqntidx", i32 96}
!172 = !{ptr @loop_dynamic_update_slice_fusion_33, !"kernel", i32 1}
!173 = !{ptr @loop_dynamic_update_slice_fusion_33, !"reqntidx", i32 96}
!174 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!175 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 96}
!176 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!177 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 96}
!178 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!179 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!180 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!181 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 128}
!182 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!183 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 128}
!184 = !{ptr @loop_broadcast_fusion_16, !"kernel", i32 1}
!185 = !{ptr @loop_broadcast_fusion_16, !"reqntidx", i32 1024}
!186 = !{ptr @input_scatter_fusion_2, !"kernel", i32 1}
!187 = !{ptr @input_scatter_fusion_2, !"reqntidx", i32 128}
!188 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!189 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!190 = !{ptr @loop_reduce_fusion_2, !"kernel", i32 1}
!191 = !{ptr @loop_reduce_fusion_2, !"reqntidx", i32 128}
!192 = !{ptr @loop_slice_fusion, !"kernel", i32 1}
!193 = !{ptr @loop_slice_fusion, !"reqntidx", i32 128}
!194 = !{ptr @loop_reduce_fusion_1, !"kernel", i32 1}
!195 = !{ptr @loop_reduce_fusion_1, !"reqntidx", i32 128}
!196 = !{ptr @input_multiply_reduce_select_fusion, !"kernel", i32 1}
!197 = !{ptr @input_multiply_reduce_select_fusion, !"reqntidx", i32 1024}
!198 = !{ptr @loop_broadcast_fusion_17, !"kernel", i32 1}
!199 = !{ptr @loop_broadcast_fusion_17, !"reqntidx", i32 96}
!200 = !{ptr @loop_dynamic_slice_fusion_2, !"kernel", i32 1}
!201 = !{ptr @loop_dynamic_slice_fusion_2, !"reqntidx", i32 1}
!202 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!203 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!204 = !{ptr @loop_dynamic_slice_fusion_4, !"kernel", i32 1}
!205 = !{ptr @loop_dynamic_slice_fusion_4, !"reqntidx", i32 96}
!206 = !{ptr @loop_dynamic_slice_fusion_3, !"kernel", i32 1}
!207 = !{ptr @loop_dynamic_slice_fusion_3, !"reqntidx", i32 96}
!208 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!209 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 96}
!210 = !{ptr @loop_broadcast_fusion_2, !"kernel", i32 1}
!211 = !{ptr @loop_broadcast_fusion_2, !"reqntidx", i32 48}
!212 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!213 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 48}
!214 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!215 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 96}
!216 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!217 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 96}
!218 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!219 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 96}
!220 = !{ptr @input_reduce_fusion_2, !"kernel", i32 1}
!221 = !{ptr @input_reduce_fusion_2, !"reqntidx", i32 1024}
!222 = !{ptr @loop_concatenate_fusion, !"kernel", i32 1}
!223 = !{ptr @loop_concatenate_fusion, !"reqntidx", i32 128}
!224 = !{ptr @loop_reduce_fusion, !"kernel", i32 1}
!225 = !{ptr @loop_reduce_fusion, !"reqntidx", i32 128}
!226 = !{ptr @input_reduce_select_fusion, !"kernel", i32 1}
!227 = !{ptr @input_reduce_select_fusion, !"reqntidx", i32 64}
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
!241 = !{ptr @loop_select_fusion_2, !"reqntidx", i32 96}
!242 = !{ptr @loop_select_fusion_3, !"kernel", i32 1}
!243 = !{ptr @loop_select_fusion_3, !"reqntidx", i32 2}
!244 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!245 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!246 = !{ptr @input_reduce_fusion_6, !"kernel", i32 1}
!247 = !{ptr @input_reduce_fusion_6, !"reqntidx", i32 64}
!248 = !{ptr @loop_and_compare_select_fusion, !"kernel", i32 1}
!249 = !{ptr @loop_and_compare_select_fusion, !"reqntidx", i32 2}
!250 = !{ptr @loop_select_fusion_4, !"kernel", i32 1}
!251 = !{ptr @loop_select_fusion_4, !"reqntidx", i32 128}
!252 = !{ptr @loop_select_fusion_6, !"kernel", i32 1}
!253 = !{ptr @loop_select_fusion_6, !"reqntidx", i32 96}
!254 = !{ptr @loop_select_fusion_5, !"kernel", i32 1}
!255 = !{ptr @loop_select_fusion_5, !"reqntidx", i32 96}
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
!268 = !{i32 0, i32 8}
!269 = !{i32 0, i32 128}
!270 = !{}
!271 = !{i32 0, i32 2}
!272 = !{i32 0, i32 5}
!273 = !{i32 0, i32 64}
!274 = !{i32 0, i32 96}
!275 = !{i32 0, i32 6}
!276 = !{i32 0, i32 1024}
!277 = !{i32 0, i32 32}
!278 = !{i32 0, i32 4}
!279 = !{i32 0, i32 18}
!280 = !{i32 0, i32 192}
!281 = !{i32 0, i32 48}
!282 = !{i32 0, i32 144}
!283 = !{i32 0, i32 72}
!284 = !{i32 0, i32 3}
!285 = distinct !{!285, !286}
!286 = !{!"llvm.loop.vectorize.enable", i1 false}
!287 = distinct !{!287, !286}
!288 = !{i32 0, i32 45}
