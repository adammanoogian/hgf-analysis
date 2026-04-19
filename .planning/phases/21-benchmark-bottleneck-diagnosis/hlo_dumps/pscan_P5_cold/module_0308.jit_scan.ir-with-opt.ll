; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_15_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1481_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !261
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !261
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 0, ptr addrspace(1) %2, align 8
  %3 = getelementptr i64, ptr addrspace(1) %arg13, i64 %1
  store i64 0, ptr addrspace(1) %3, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(640) %arg1) local_unnamed_addr #0 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !262
  %1 = icmp ult i32 %0, 20
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg03, i64 0, i64 %2
  br i1 %1, label %slice0-true, label %slice0-after

input_slice_fusion.in_bounds-after:               ; preds = %slice0-after, %slice1-true
  ret void

slice0-after:                                     ; preds = %slice0-true, %entry
  %4 = icmp ugt i32 %0, 19
  %5 = add nsw i32 %0, -20
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr inbounds [80 x double], ptr addrspace(1) %arg15, i64 0, i64 %6
  br i1 %4, label %slice1-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %3, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %7, align 8
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !263
  %1 = icmp slt i64 %0, 10
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = load i64, ptr addrspace(1) %arg1112, align 128, !invariant.load !263
  %2 = icmp slt i64 %1, 0
  %3 = add i64 %1, 10
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 9)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [10 x [2 x i32]], ptr addrspace(1) %arg0110, i64 0, i64 %8, i64 0
  %10 = load <2 x i32>, ptr addrspace(1) %9, align 8, !invariant.load !263
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0xFFF0000000000000, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %urem = and i32 %0, 3
  %2 = icmp ult i32 %urem, 2
  br i1 %2, label %concatenate.pivot.0., label %concatenate.pivot.2.93

concatenate.pivot.0.:                             ; preds = %entry
  %3 = shl nuw nsw i32 %1, 1
  %4 = zext nneg i32 %3 to i64
  %5 = getelementptr inbounds [4 x i32], ptr addrspace(1) %arg098, i64 0, i64 %4
  %6 = load <2 x i32>, ptr addrspace(1) %5, align 8, !invariant.load !263
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
  %89 = load <2 x i32>, ptr addrspace(1) %88, align 8, !invariant.load !263
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
define void @loop_multiply_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg1) local_unnamed_addr #2 {
entry:
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !266
  %.cmp = icmp ugt i32 %0, 23
  %.urem = add nsw i32 %0, -24
  %.cmp42 = icmp ult i32 %0, 24
  %1 = select i1 %.cmp42, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = getelementptr inbounds [2 x [1 x [2 x i32]]], ptr addrspace(1) %arg044, i64 0, i64 %2, i64 0, i64 0
  %4 = load <2 x i32>, ptr addrspace(1) %3, align 8, !invariant.load !263
  %5 = extractelement <2 x i32> %4, i32 0
  %6 = extractelement <2 x i32> %4, i32 1
  %7 = add i32 %5, %1
  %8 = add nuw nsw i32 %1, 24
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
  %add.4547.7 = fadd double %93, -1.000000e+00
  %multiply.3070.5 = fmul double %add.4547.7, 2.000000e+00
  %add.4548.3 = fadd double %multiply.3070.5, 0xBFEFFFFFFFFFFFFF
  %94 = fcmp ugt double %add.4548.3, 0xBFEFFFFFFFFFFFFF
  %maximum.49.3 = select i1 %94, double %add.4548.3, double 0xBFEFFFFFFFFFFFFF
  %95 = fneg double %maximum.49.3
  %multiply.3072.5 = fmul double %maximum.49.3, %95
  %96 = tail call i32 @llvm.nvvm.d2i.hi(double %multiply.3072.5) #12
  %97 = bitcast i32 %96 to float
  %98 = fcmp olt float %97, 0x3FFCAAAAA0000000
  %99 = fcmp ogt float %97, 0xBFFB333320000000
  %or.cond.i = and i1 %98, %99
  br i1 %or.cond.i, label %100, label %117

100:                                              ; preds = %entry
  %101 = fadd double %multiply.3072.5, 2.000000e+00
  %102 = fdiv double %multiply.3072.5, %101
  %103 = fneg double %multiply.3072.5
  %104 = fmul double %102, %103
  %105 = fadd double %multiply.3072.5, %104
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
  %116 = fadd double %multiply.3072.5, %115
  br label %__nv_log1p.exit

117:                                              ; preds = %entry
  %118 = fadd double %multiply.3072.5, 1.000000e+00
  %119 = tail call i32 @llvm.nvvm.d2i.hi(double %118) #12
  %120 = tail call i32 @llvm.nvvm.d2i.lo(double %118) #12
  %121 = icmp slt i32 %119, 1048576
  %122 = fmul double %118, 0x4350000000000000
  %123 = tail call i32 @llvm.nvvm.d2i.lo(double %122) #12
  %124 = tail call i32 @llvm.nvvm.d2i.hi(double %122) #12
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
  %133 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %132) #12
  %134 = icmp ugt i32 %132, 1073127582
  %135 = tail call i32 @llvm.nvvm.d2i.lo(double %133) #12
  %136 = tail call i32 @llvm.nvvm.d2i.hi(double %133) #12
  %137 = add i32 %136, -1048576
  %138 = tail call double @llvm.nvvm.lohi.i2d(i32 %135, i32 %137) #12
  %spec.select = select i1 %134, double %138, double %133
  %139 = zext i1 %134 to i32
  %spec.select43 = add nsw i32 %130, %139
  %140 = fadd double %spec.select, -1.000000e+00
  %141 = fadd double %spec.select, 1.000000e+00
  %142 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %141) #12
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
  %164 = xor i32 %spec.select43, -2147483648
  %165 = tail call double @llvm.nvvm.lohi.i2d(i32 %164, i32 1127219200) #12
  %166 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
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
  %177 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %178 = and i32 %177, 2147483647
  %179 = icmp eq i32 %178, 0
  %q.i.0.i = select i1 %179, double 0xFFF0000000000000, double %176
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %100, %128, %175
  %t.0.i = phi double [ %116, %100 ], [ %174, %128 ], [ %q.i.0.i, %175 ]
  %180 = fcmp ugt double %add.4548.3, 0xBFEFFFFFFFFFFFFF
  %181 = tail call double @llvm.fabs.f64(double %add.4548.3)
  %182 = fcmp oeq double %181, 1.000000e+00
  %compare.1188.1 = and i1 %180, %182
  %183 = fneg double %t.0.i
  %compare.1189.13 = fcmp ogt double %t.0.i, -6.250000e+00
  %compare.1190.9 = fcmp ogt double %t.0.i, -1.600000e+01
  %184 = select i1 %compare.1189.13, double 0x3F2879C2A212F024, double 0x4008ABCC380D5A48
  %185 = select i1 %compare.1189.13, double 0xBEED1D1F7B8736F6, double 0x3FF0158A6D641D39
  %186 = select i1 %compare.1189.13, double 0xBEB6E8A5434AE8A2, double 0x3F75FFCFE5B76AFC
  %187 = select i1 %compare.1190.9, double %186, double 0x4013664DDD1AD7FB
  %188 = select i1 %compare.1189.13, double 0x3E9C6B4F5D03B787, double 0xBF6EBADABB891BBD
  %189 = select i1 %compare.1190.9, double %188, double 0x3FF02A30D1FBA0DC
  %190 = select i1 %compare.1189.13, double 0xBE5F36CD6D3D46A9, double 0x3F6468EECA533CF8
  %191 = select i1 %compare.1190.9, double %190, double 0xBF222EA5DF04047C
  %192 = select i1 %compare.1189.13, double 0xBE31A9E38DC84D60, double 0xBF5BA924132F38B1
  %193 = select i1 %compare.1190.9, double %192, double 0xBF2C2F36A8FC5D53
  %194 = select i1 %compare.1189.13, double 0x3E120F47CCF46B3C, double 0x3F4F3CC55AD40C25
  %195 = select i1 %compare.1190.9, double %194, double 0x3F13EBF4EB00938F
  %196 = select i1 %compare.1189.13, double 0xBDCDC583D118A561, double 0xBF37448A89EF8AA3
  %197 = select i1 %compare.1190.9, double %196, double 0xBEF4A3497E1E0FAC
  %198 = select i1 %compare.1189.13, double 0xBDAC8859C4E5C0AF, double 0x3EF932CD54C8A222
  %199 = select i1 %compare.1190.9, double %198, double 0x3ED2FBD29D093D2B
  %200 = select i1 %compare.1189.13, double 0x3D872A22C2D77E20, double 0x3F11E684D0B9188A
  %201 = select i1 %compare.1190.9, double %200, double 0xBEB0A8D40EA372CC
  %202 = select i1 %compare.1189.13, double 0xBD36F2167040D8E2, double 0xBF08CEF1F80281F2
  %203 = select i1 %compare.1190.9, double %202, double 0x3E8EBC8BB824CB54
  %204 = select i1 %compare.1189.13, double 0xBD26D33EED66C487, double 0x3EEA29A0CACDFB23
  %205 = select i1 %compare.1190.9, double %204, double 0xBE722D220FDF9C3E
  %206 = select i1 %compare.1189.13, double 0x3CFDE4ACFD9E26BA, double 0x3EC8860CD5D652F6
  %207 = select i1 %compare.1190.9, double %206, double 0x3E5F4C20E1334AF8
  %208 = select i1 %compare.1189.13, double 0x3C782E11898132E0, double 0xBED0D5DB812B5083
  %209 = select i1 %compare.1190.9, double %208, double 0xBE50102E495FB9C0
  %210 = select i1 %compare.1189.13, double 0xBCA33689090A6B96, double 0x3EB936388A3790AD
  %211 = select i1 %compare.1190.9, double %210, double 0x3E405AC6A8FBA182
  %212 = select i1 %compare.1189.13, double 0x3C69BA72CD589B91, double 0x3E5395ABCD554C6C
  %213 = select i1 %compare.1190.9, double %212, double 0xBE30468FB24E2F5F
  %214 = select i1 %compare.1189.13, double 0x3C37B83EEF0B7C9F, double 0xBE92777453DD3955
  %215 = select i1 %compare.1190.9, double %214, double 0x3E19E6BF2DDA45E3
  %216 = select i1 %compare.1189.13, double 0xBC08DDF93324D327, double 0x3E785CBE52878635
  %217 = select i1 %compare.1190.9, double %216, double 0xBDF18FEEC0E38727
  %218 = select i1 %compare.1189.13, double 0xBBB135D2E746E627, double 0x3E23040F87DBD932
  %219 = select i1 %compare.1190.9, double %218, double 0xBDBDCEC3A7785389
  %add.4549.5 = fsub double -3.125000e+00, %t.0.i
  %220 = tail call double @llvm.sqrt.f64(double %183)
  %221 = select i1 %compare.1190.9, double 3.250000e+00, double 5.000000e+00
  %subtract.240.3 = fsub double %220, %221
  %222 = select i1 %compare.1189.13, double %add.4549.5, double %subtract.240.3
  %multiply.3073.7 = fmul double %219, %222
  %add.4550.9 = fadd double %217, %multiply.3073.7
  %multiply.3074.7 = fmul double %222, %add.4550.9
  %add.4551.9 = fadd double %215, %multiply.3074.7
  %multiply.3075.7 = fmul double %222, %add.4551.9
  %add.4552.9 = fadd double %213, %multiply.3075.7
  %multiply.3076.7 = fmul double %222, %add.4552.9
  %add.4553.9 = fadd double %211, %multiply.3076.7
  %multiply.3077.7 = fmul double %222, %add.4553.9
  %add.4554.9 = fadd double %209, %multiply.3077.7
  %multiply.3078.7 = fmul double %222, %add.4554.9
  %add.4555.9 = fadd double %207, %multiply.3078.7
  %multiply.3079.7 = fmul double %222, %add.4555.9
  %add.4556.9 = fadd double %205, %multiply.3079.7
  %multiply.3080.7 = fmul double %222, %add.4556.9
  %add.4557.9 = fadd double %203, %multiply.3080.7
  %multiply.3081.7 = fmul double %222, %add.4557.9
  %add.4558.9 = fadd double %201, %multiply.3081.7
  %multiply.3082.7 = fmul double %222, %add.4558.9
  %add.4559.9 = fadd double %199, %multiply.3082.7
  %multiply.3083.7 = fmul double %222, %add.4559.9
  %add.4560.9 = fadd double %197, %multiply.3083.7
  %multiply.3084.7 = fmul double %222, %add.4560.9
  %add.4561.9 = fadd double %195, %multiply.3084.7
  %multiply.3085.7 = fmul double %222, %add.4561.9
  %add.4562.9 = fadd double %193, %multiply.3085.7
  %multiply.3086.7 = fmul double %222, %add.4562.9
  %add.4563.9 = fadd double %191, %multiply.3086.7
  %multiply.3087.7 = fmul double %222, %add.4563.9
  %add.4564.9 = fadd double %189, %multiply.3087.7
  %multiply.3088.7 = fmul double %222, %add.4564.9
  %add.4565.7 = fadd double %187, %multiply.3088.7
  %multiply.3089.5 = fmul double %222, %add.4565.7
  %add.4566.7 = fadd double %185, %multiply.3089.5
  %223 = select i1 %compare.1190.9, double %add.4566.7, double %add.4565.7
  %multiply.3090.7 = fmul double %222, %223
  %add.4567.5 = fadd double %184, %multiply.3090.7
  %224 = select i1 %compare.1190.9, double %add.4567.5, double %add.4565.7
  %multiply.3091.3 = fmul double %222, %224
  %add.4568.5 = fadd double %multiply.3091.3, 0xBF4845769484FCA8
  %225 = select i1 %compare.1189.13, double %add.4568.5, double %224
  %multiply.3092.5 = fmul double %222, %225
  %add.4569.3 = fadd double %multiply.3092.5, 0xBF78B6C33114F909
  %226 = select i1 %compare.1189.13, double %add.4569.3, double %224
  %multiply.3093.1 = fmul double %222, %226
  %add.4570.5 = fadd double %multiply.3093.1, 0x3FCEBD80D9B13E28
  %227 = select i1 %compare.1189.13, double %add.4570.5, double %224
  %multiply.3094.5 = fmul double %222, %227
  %add.4571.5 = fadd double %multiply.3094.5, 0x3FFA755E7C99AE86
  %228 = select i1 %compare.1189.13, double %add.4571.5, double %224
  %.v = select i1 %compare.1188.1, double 0x7FF0000000000000, double %228
  %229 = fmul double %maximum.49.3, %.v
  %multiply.3096.1 = fmul double %229, 0x3FF6A09E667F3BCD
  %230 = zext nneg i32 %0 to i64
  %231 = getelementptr double, ptr addrspace(1) %arg146, i64 %230
  store double %multiply.3096.1, ptr addrspace(1) %231, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg05, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !263
  %4 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg17, i64 0, i64 %1, i64 0
  %5 = load <2 x double>, ptr addrspace(1) %4, align 64, !invariant.load !263
  %6 = extractelement <2 x double> %5, i32 0
  %7 = extractelement <2 x double> %5, i32 1
  %multiply.3097.1 = fmul double %6, %6
  %multiply.3097.1.1 = fmul double %7, %7
  %add.3969.i.1 = fadd double %multiply.3097.1, %multiply.3097.1.1
  %8 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 16
  %9 = load <2 x double>, ptr addrspace(1) %8, align 16, !invariant.load !263
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  %multiply.3097.1.2 = fmul double %10, %10
  %add.3969.i.2 = fadd double %add.3969.i.1, %multiply.3097.1.2
  %multiply.3097.1.3 = fmul double %11, %11
  %add.3969.i.3 = fadd double %add.3969.i.2, %multiply.3097.1.3
  %12 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 32
  %13 = load <2 x double>, ptr addrspace(1) %12, align 32, !invariant.load !263
  %14 = extractelement <2 x double> %13, i32 0
  %15 = extractelement <2 x double> %13, i32 1
  %multiply.3097.1.4 = fmul double %14, %14
  %add.3969.i.4 = fadd double %add.3969.i.3, %multiply.3097.1.4
  %multiply.3097.1.5 = fmul double %15, %15
  %add.3969.i.5 = fadd double %add.3969.i.4, %multiply.3097.1.5
  %16 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 48
  %17 = load <2 x double>, ptr addrspace(1) %16, align 16, !invariant.load !263
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %multiply.3097.1.6 = fmul double %18, %18
  %add.3969.i.6 = fadd double %add.3969.i.5, %multiply.3097.1.6
  %multiply.3097.1.7 = fmul double %19, %19
  %add.3969.i.7 = fadd double %add.3969.i.6, %multiply.3097.1.7
  %20 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 64
  %21 = load <2 x double>, ptr addrspace(1) %20, align 64, !invariant.load !263
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  %multiply.3097.1.8 = fmul double %22, %22
  %add.3969.i.8 = fadd double %add.3969.i.7, %multiply.3097.1.8
  %multiply.3097.1.9 = fmul double %23, %23
  %add.3969.i.9 = fadd double %add.3969.i.8, %multiply.3097.1.9
  %24 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 80
  %25 = load <2 x double>, ptr addrspace(1) %24, align 16, !invariant.load !263
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %multiply.3097.1.10 = fmul double %26, %26
  %add.3969.i.10 = fadd double %add.3969.i.9, %multiply.3097.1.10
  %multiply.3097.1.11 = fmul double %27, %27
  %add.3969.i.11 = fadd double %add.3969.i.10, %multiply.3097.1.11
  %28 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 96
  %29 = load <2 x double>, ptr addrspace(1) %28, align 32, !invariant.load !263
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %multiply.3097.1.12 = fmul double %30, %30
  %add.3969.i.12 = fadd double %add.3969.i.11, %multiply.3097.1.12
  %multiply.3097.1.13 = fmul double %31, %31
  %add.3969.i.13 = fadd double %add.3969.i.12, %multiply.3097.1.13
  %32 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 112
  %33 = load <2 x double>, ptr addrspace(1) %32, align 16, !invariant.load !263
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %multiply.3097.1.14 = fmul double %34, %34
  %add.3969.i.14 = fadd double %add.3969.i.13, %multiply.3097.1.14
  %multiply.3097.1.15 = fmul double %35, %35
  %add.3969.i.15 = fadd double %add.3969.i.14, %multiply.3097.1.15
  %36 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 128
  %37 = load <2 x double>, ptr addrspace(1) %36, align 64, !invariant.load !263
  %38 = extractelement <2 x double> %37, i32 0
  %39 = extractelement <2 x double> %37, i32 1
  %multiply.3097.1.16 = fmul double %38, %38
  %add.3969.i.16 = fadd double %add.3969.i.15, %multiply.3097.1.16
  %multiply.3097.1.17 = fmul double %39, %39
  %add.3969.i.17 = fadd double %add.3969.i.16, %multiply.3097.1.17
  %40 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 144
  %41 = load <2 x double>, ptr addrspace(1) %40, align 16, !invariant.load !263
  %42 = extractelement <2 x double> %41, i32 0
  %43 = extractelement <2 x double> %41, i32 1
  %multiply.3097.1.18 = fmul double %42, %42
  %add.3969.i.18 = fadd double %add.3969.i.17, %multiply.3097.1.18
  %multiply.3097.1.19 = fmul double %43, %43
  %add.3969.i.19 = fadd double %add.3969.i.18, %multiply.3097.1.19
  %44 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 160
  %45 = load <2 x double>, ptr addrspace(1) %44, align 32, !invariant.load !263
  %46 = extractelement <2 x double> %45, i32 0
  %47 = extractelement <2 x double> %45, i32 1
  %multiply.3097.1.20 = fmul double %46, %46
  %add.3969.i.20 = fadd double %add.3969.i.19, %multiply.3097.1.20
  %multiply.3097.1.21 = fmul double %47, %47
  %add.3969.i.21 = fadd double %add.3969.i.20, %multiply.3097.1.21
  %48 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 176
  %49 = load <2 x double>, ptr addrspace(1) %48, align 16, !invariant.load !263
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  %multiply.3097.1.22 = fmul double %50, %50
  %add.3969.i.22 = fadd double %add.3969.i.21, %multiply.3097.1.22
  %multiply.3097.1.23 = fmul double %51, %51
  %add.3969.i.23 = fadd double %add.3969.i.22, %multiply.3097.1.23
  %multiply.3098.1 = fmul double %add.3969.i.23, 5.000000e-01
  %add.4572.1 = fsub double %multiply.3098.1, %3
  %52 = getelementptr double, ptr addrspace(1) %arg29, i64 %1
  store double %add.4572.1, ptr addrspace(1) %52, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_5(ptr noalias nocapture readonly align 128 dereferenceable(384) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = or i32 %0, 20
  %3 = zext nneg i32 %1 to i64
  %4 = zext nneg i32 %2 to i64
  %5 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg01, i64 0, i64 %3, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !263
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg13, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_4(ptr noalias nocapture readonly align 128 dereferenceable(384) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = and i32 %0, 3
  %3 = zext nneg i32 %1 to i64
  %4 = zext nneg i32 %2 to i64
  %5 = getelementptr [2 x [24 x double]], ptr addrspace(1) %arg01, i64 0, i64 %3, i64 %4
  %6 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 128
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !263
  %8 = zext nneg i32 %0 to i64
  %9 = getelementptr double, ptr addrspace(1) %arg13, i64 %8
  store double %7, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_3(ptr noalias nocapture readonly align 128 dereferenceable(384) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = or i32 %0, 12
  %3 = zext nneg i32 %1 to i64
  %4 = zext nneg i32 %2 to i64
  %5 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg01, i64 0, i64 %3, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !263
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg13, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_2(ptr noalias nocapture readonly align 128 dereferenceable(384) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = and i32 %0, 3
  %3 = zext nneg i32 %1 to i64
  %4 = zext nneg i32 %2 to i64
  %5 = getelementptr [2 x [24 x double]], ptr addrspace(1) %arg01, i64 0, i64 %3, i64 %4
  %6 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 64
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !263
  %8 = zext nneg i32 %0 to i64
  %9 = getelementptr double, ptr addrspace(1) %arg13, i64 %8
  store double %7, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_1(ptr noalias nocapture readonly align 128 dereferenceable(384) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = or i32 %0, 4
  %3 = zext nneg i32 %1 to i64
  %4 = zext nneg i32 %2 to i64
  %5 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg01, i64 0, i64 %3, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !263
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg13, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice(ptr noalias nocapture readonly align 128 dereferenceable(384) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = and i32 %0, 3
  %3 = zext nneg i32 %1 to i64
  %4 = zext nneg i32 %2 to i64
  %5 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg01, i64 0, i64 %3, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !263
  %7 = zext nneg i32 %0 to i64
  %8 = getelementptr double, ptr addrspace(1) %arg13, i64 %7
  store double %6, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_98(ptr noalias nocapture writeonly align 128 dereferenceable(640) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.5755 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.5755, 0
  %4 = add i64 %param_2.5755, 10
  %5 = select i1 %3, i64 %4, i64 %param_2.5755
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 9)
  %8 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.74915 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr inbounds [10 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.74915, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !267
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #4 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !268
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
  %param_2.4453 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.44532 = load i64, ptr addrspace(1) %param_2.4453, align 8, !invariant.load !263
  %6 = icmp slt i64 %param_2.44532, 10
  %param_1.5682 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg113, i64 0, i64 %5
  %param_1.56823 = load i8, ptr addrspace(1) %param_1.5682, align 1, !invariant.load !263
  %param_0.4053 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg011, i64 0, i64 %5
  %param_0.40534 = load i8, ptr addrspace(1) %param_0.4053, align 1, !invariant.load !263
  %7 = or i8 %param_0.40534, %param_1.56823
  %8 = trunc i8 %7 to i1
  %9 = xor i1 %8, true
  %10 = and i1 %6, %9
  %11 = zext i1 %10 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg317, align 128
  br label %reduce-group-0-after
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg347 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg041 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg143, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !263
  %4 = trunc i64 %3 to i32
  %5 = getelementptr inbounds [2 x [2 x i32]], ptr addrspace(1) %arg041, i64 0, i64 %1, i64 0
  %6 = load <2 x i32>, ptr addrspace(1) %5, align 8, !invariant.load !263
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !269
  %.urem = add nsw i32 %0, -3
  %.cmp = icmp ult i32 %0, 3
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %.cmp98 = icmp ugt i32 %0, 2
  %2 = zext i1 %.cmp98 to i64
  %3 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg099, i64 0, i64 %2, i64 0
  %4 = load i32, ptr addrspace(1) %3, align 4, !invariant.load !263
  %5 = add i32 %4, %1
  %6 = add nuw nsw i32 %1, 3
  %7 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg1101, i64 0, i64 %2, i64 0
  %8 = load i32, ptr addrspace(1) %7, align 4, !invariant.load !263
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !270
  %1 = lshr i32 %0, 1
  %2 = or i32 %0, 2
  %3 = zext nneg i32 %1 to i64
  %4 = zext nneg i32 %2 to i64
  %5 = getelementptr inbounds [2 x [6 x i32]], ptr addrspace(1) %arg01, i64 0, i64 %3, i64 %4
  %6 = load i32, ptr addrspace(1) %5, align 4, !invariant.load !263
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [2 x [6 x i32]], ptr addrspace(1) %arg0113, i64 0, i64 %1, i64 0
  %3 = load <2 x i32>, ptr addrspace(1) %2, align 8, !invariant.load !263
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
  %86 = load i64, ptr addrspace(1) %85, align 8, !invariant.load !263
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
define void @loop_select_fusion_7(ptr noalias nocapture readonly align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg38, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg39, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg40, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg45, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg46, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg47, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg48, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg49, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg50, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg51, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg52, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg53, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg54) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = zext nneg i32 %1 to i64
  %3 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg212, i64 0, i64 %2
  %4 = load i8, ptr addrspace(1) %3, align 1, !invariant.load !263
  %5 = zext nneg i32 %0 to i64
  %6 = getelementptr double, ptr addrspace(1) %arg01, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !263
  %8 = getelementptr double, ptr addrspace(1) %arg110, i64 %5
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %10 = trunc i8 %4 to i1
  %11 = select i1 %10, double %7, double %9
  %12 = getelementptr double, ptr addrspace(1) %arg314, i64 %5
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !263
  %14 = getelementptr double, ptr addrspace(1) %arg416, i64 %5
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !263
  %16 = select i1 %10, double %13, double %15
  %17 = getelementptr double, ptr addrspace(1) %arg518, i64 %5
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !263
  %19 = getelementptr double, ptr addrspace(1) %arg620, i64 %5
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !263
  %21 = select i1 %10, double %18, double %20
  %22 = getelementptr double, ptr addrspace(1) %arg722, i64 %5
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !263
  %24 = getelementptr double, ptr addrspace(1) %arg824, i64 %5
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !263
  %26 = select i1 %10, double %23, double %25
  %27 = getelementptr double, ptr addrspace(1) %arg926, i64 %5
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !263
  %29 = getelementptr double, ptr addrspace(1) %arg1028, i64 %5
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !263
  %31 = select i1 %10, double %28, double %30
  %32 = getelementptr double, ptr addrspace(1) %arg1130, i64 %5
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !263
  %34 = getelementptr double, ptr addrspace(1) %arg1232, i64 %5
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !263
  %36 = select i1 %10, double %33, double %35
  %37 = getelementptr double, ptr addrspace(1) %arg1334, i64 %5
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !263
  %39 = getelementptr double, ptr addrspace(1) %arg1436, i64 %5
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !263
  %41 = select i1 %10, double %38, double %40
  %42 = getelementptr double, ptr addrspace(1) %arg1538, i64 %5
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !263
  %44 = getelementptr double, ptr addrspace(1) %arg1640, i64 %5
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !263
  %46 = select i1 %10, double %43, double %45
  %47 = getelementptr double, ptr addrspace(1) %arg1742, i64 %5
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !263
  %49 = getelementptr double, ptr addrspace(1) %arg1844, i64 %5
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !263
  %51 = select i1 %10, double %48, double %50
  %52 = getelementptr double, ptr addrspace(1) %arg1946, i64 %5
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !263
  %54 = getelementptr double, ptr addrspace(1) %arg2048, i64 %5
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !263
  %56 = select i1 %10, double %53, double %55
  %57 = getelementptr double, ptr addrspace(1) %arg2150, i64 %5
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !263
  %59 = getelementptr double, ptr addrspace(1) %arg2252, i64 %5
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !263
  %61 = select i1 %10, double %58, double %60
  %62 = getelementptr double, ptr addrspace(1) %arg2354, i64 %5
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !263
  %64 = getelementptr double, ptr addrspace(1) %arg2456, i64 %5
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !263
  %66 = select i1 %10, double %63, double %65
  %67 = getelementptr double, ptr addrspace(1) %arg2558, i64 %5
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !263
  %69 = getelementptr double, ptr addrspace(1) %arg2660, i64 %5
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !263
  %71 = select i1 %10, double %68, double %70
  %72 = getelementptr double, ptr addrspace(1) %arg2762, i64 %5
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !263
  %74 = getelementptr double, ptr addrspace(1) %arg2864, i64 %5
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !263
  %76 = select i1 %10, double %73, double %75
  %77 = getelementptr double, ptr addrspace(1) %arg2966, i64 %5
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !263
  %79 = getelementptr double, ptr addrspace(1) %arg3068, i64 %5
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !263
  %81 = select i1 %10, double %78, double %80
  %82 = getelementptr double, ptr addrspace(1) %arg3170, i64 %5
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !263
  %84 = getelementptr double, ptr addrspace(1) %arg3272, i64 %5
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !263
  %86 = select i1 %10, double %83, double %85
  %87 = getelementptr double, ptr addrspace(1) %arg3374, i64 %5
  %88 = load double, ptr addrspace(1) %87, align 8, !invariant.load !263
  %89 = getelementptr double, ptr addrspace(1) %arg3476, i64 %5
  %90 = load double, ptr addrspace(1) %89, align 8, !invariant.load !263
  %91 = select i1 %10, double %88, double %90
  %92 = getelementptr double, ptr addrspace(1) %arg3578, i64 %5
  %93 = load double, ptr addrspace(1) %92, align 8, !invariant.load !263
  %94 = getelementptr double, ptr addrspace(1) %arg3680, i64 %5
  %95 = load double, ptr addrspace(1) %94, align 8, !invariant.load !263
  %96 = select i1 %10, double %93, double %95
  %97 = getelementptr double, ptr addrspace(1) %arg3782, i64 %5
  store double %11, ptr addrspace(1) %97, align 8
  %98 = getelementptr double, ptr addrspace(1) %arg3884, i64 %5
  store double %16, ptr addrspace(1) %98, align 8
  %99 = getelementptr double, ptr addrspace(1) %arg3986, i64 %5
  store double %21, ptr addrspace(1) %99, align 8
  %100 = getelementptr double, ptr addrspace(1) %arg4088, i64 %5
  store double %26, ptr addrspace(1) %100, align 8
  %101 = getelementptr double, ptr addrspace(1) %arg4190, i64 %5
  store double %31, ptr addrspace(1) %101, align 8
  %102 = getelementptr double, ptr addrspace(1) %arg4292, i64 %5
  store double %36, ptr addrspace(1) %102, align 8
  %103 = getelementptr double, ptr addrspace(1) %arg4394, i64 %5
  store double %41, ptr addrspace(1) %103, align 8
  %104 = getelementptr double, ptr addrspace(1) %arg4496, i64 %5
  store double %46, ptr addrspace(1) %104, align 8
  %105 = getelementptr double, ptr addrspace(1) %arg4598, i64 %5
  store double %51, ptr addrspace(1) %105, align 8
  %106 = getelementptr double, ptr addrspace(1) %arg46100, i64 %5
  store double %56, ptr addrspace(1) %106, align 8
  %107 = getelementptr double, ptr addrspace(1) %arg47102, i64 %5
  store double %61, ptr addrspace(1) %107, align 8
  %108 = getelementptr double, ptr addrspace(1) %arg48104, i64 %5
  store double %66, ptr addrspace(1) %108, align 8
  %109 = getelementptr double, ptr addrspace(1) %arg49106, i64 %5
  store double %71, ptr addrspace(1) %109, align 8
  %110 = getelementptr double, ptr addrspace(1) %arg50108, i64 %5
  store double %76, ptr addrspace(1) %110, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg51110, i64 %5
  store double %81, ptr addrspace(1) %111, align 8
  %112 = getelementptr double, ptr addrspace(1) %arg52112, i64 %5
  store double %86, ptr addrspace(1) %112, align 8
  %113 = getelementptr double, ptr addrspace(1) %arg53114, i64 %5
  store double %91, ptr addrspace(1) %113, align 8
  %114 = getelementptr double, ptr addrspace(1) %arg54116, i64 %5
  store double %96, ptr addrspace(1) %114, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_concatenate_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg6) local_unnamed_addr #6 {
entry:
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !266
  %.urem = add nsw i32 %0, -24
  %.cmp = icmp ult i32 %0, 24
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %2 = icmp ult i32 %1, 12
  %3 = zext nneg i32 %1 to i64
  br i1 %2, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %entry
  %4 = trunc i64 %3 to i32
  %5 = icmp ult i32 %4, 4
  br i1 %5, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  %.cmp6 = icmp ugt i32 %0, 23
  %6 = select i1 %.cmp6, i64 4, i64 0
  %7 = getelementptr double, ptr addrspace(1) %arg012, i64 %6
  %8 = getelementptr inbounds double, ptr addrspace(1) %7, i64 %3
  br label %concatenate.43.1.merge

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %9 = trunc i64 %3 to i32
  %10 = icmp ult i32 %9, 8
  %.cmp7 = icmp ugt i32 %0, 23
  %11 = select i1 %.cmp7, i64 4, i64 0
  br i1 %10, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  %12 = getelementptr double, ptr addrspace(1) %arg114, i64 %11
  %13 = getelementptr double, ptr addrspace(1) %12, i64 %3
  %14 = getelementptr i8, ptr addrspace(1) %13, i64 -32
  br label %concatenate.43.1.merge

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  %15 = getelementptr double, ptr addrspace(1) %arg216, i64 %11
  %16 = getelementptr double, ptr addrspace(1) %15, i64 %3
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 -64
  br label %concatenate.43.1.merge

concatenate.pivot.16.:                            ; preds = %entry
  %18 = trunc i64 %3 to i32
  %19 = icmp ult i32 %18, 16
  br i1 %19, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  %.cmp9 = icmp ugt i32 %0, 23
  %20 = select i1 %.cmp9, i64 4, i64 0
  %21 = getelementptr double, ptr addrspace(1) %arg318, i64 %20
  %22 = getelementptr double, ptr addrspace(1) %21, i64 %3
  %23 = getelementptr i8, ptr addrspace(1) %22, i64 -96
  br label %concatenate.43.1.merge

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %24 = trunc i64 %3 to i32
  %25 = icmp ult i32 %24, 20
  %.cmp10 = icmp ugt i32 %0, 23
  %26 = select i1 %.cmp10, i64 4, i64 0
  br i1 %25, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  %27 = getelementptr double, ptr addrspace(1) %arg420, i64 %26
  %28 = getelementptr double, ptr addrspace(1) %27, i64 %3
  %29 = getelementptr i8, ptr addrspace(1) %28, i64 -128
  br label %concatenate.43.1.merge

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  %30 = getelementptr double, ptr addrspace(1) %arg522, i64 %26
  %31 = getelementptr double, ptr addrspace(1) %30, i64 %3
  %32 = getelementptr i8, ptr addrspace(1) %31, i64 -160
  br label %concatenate.43.1.merge

concatenate.43.1.merge:                           ; preds = %concatenate.pivot.20.5, %concatenate.pivot.16.4, %concatenate.pivot.12.3, %concatenate.pivot.8.2, %concatenate.pivot.4.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %8, %concatenate.pivot.0. ], [ %14, %concatenate.pivot.4.1 ], [ %17, %concatenate.pivot.8.2 ], [ %23, %concatenate.pivot.12.3 ], [ %29, %concatenate.pivot.16.4 ], [ %32, %concatenate.pivot.20.5 ]
  %33 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !263
  %multiply.3060.1 = fmul double %33, %33
  %34 = zext nneg i32 %0 to i64
  %35 = getelementptr double, ptr addrspace(1) %arg624, i64 %34
  store double %multiply.3060.1, ptr addrspace(1) %35, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_minimum_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg8) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg06, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !263
  %4 = getelementptr i8, ptr addrspace(1) %arg210, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !263
  %6 = getelementptr double, ptr addrspace(1) %arg312, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !263
  %8 = getelementptr double, ptr addrspace(1) %arg414, i64 %1
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %10 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg18, i64 0, i64 %1, i64 0
  %11 = load <2 x double>, ptr addrspace(1) %10, align 64, !invariant.load !263
  %12 = extractelement <2 x double> %11, i32 0
  %13 = extractelement <2 x double> %11, i32 1
  %add.3969.i = fadd double %12, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %13
  %14 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 16
  %15 = load <2 x double>, ptr addrspace(1) %14, align 16, !invariant.load !263
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  %add.3969.i.2 = fadd double %add.3969.i.1, %16
  %add.3969.i.3 = fadd double %add.3969.i.2, %17
  %18 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 32
  %19 = load <2 x double>, ptr addrspace(1) %18, align 32, !invariant.load !263
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  %add.3969.i.4 = fadd double %add.3969.i.3, %20
  %add.3969.i.5 = fadd double %add.3969.i.4, %21
  %22 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 48
  %23 = load <2 x double>, ptr addrspace(1) %22, align 16, !invariant.load !263
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %add.3969.i.6 = fadd double %add.3969.i.5, %24
  %add.3969.i.7 = fadd double %add.3969.i.6, %25
  %26 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 64
  %27 = load <2 x double>, ptr addrspace(1) %26, align 64, !invariant.load !263
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %add.3969.i.8 = fadd double %add.3969.i.7, %28
  %add.3969.i.9 = fadd double %add.3969.i.8, %29
  %30 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 80
  %31 = load <2 x double>, ptr addrspace(1) %30, align 16, !invariant.load !263
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %add.3969.i.10 = fadd double %add.3969.i.9, %32
  %add.3969.i.11 = fadd double %add.3969.i.10, %33
  %34 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 96
  %35 = load <2 x double>, ptr addrspace(1) %34, align 32, !invariant.load !263
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  %add.3969.i.12 = fadd double %add.3969.i.11, %36
  %add.3969.i.13 = fadd double %add.3969.i.12, %37
  %38 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 112
  %39 = load <2 x double>, ptr addrspace(1) %38, align 16, !invariant.load !263
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %add.3969.i.14 = fadd double %add.3969.i.13, %40
  %add.3969.i.15 = fadd double %add.3969.i.14, %41
  %42 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 128
  %43 = load <2 x double>, ptr addrspace(1) %42, align 64, !invariant.load !263
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %add.3969.i.16 = fadd double %add.3969.i.15, %44
  %add.3969.i.17 = fadd double %add.3969.i.16, %45
  %46 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 144
  %47 = load <2 x double>, ptr addrspace(1) %46, align 16, !invariant.load !263
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %add.3969.i.18 = fadd double %add.3969.i.17, %48
  %add.3969.i.19 = fadd double %add.3969.i.18, %49
  %50 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 160
  %51 = load <2 x double>, ptr addrspace(1) %50, align 32, !invariant.load !263
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %add.3969.i.20 = fadd double %add.3969.i.19, %52
  %add.3969.i.21 = fadd double %add.3969.i.20, %53
  %54 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 176
  %55 = load <2 x double>, ptr addrspace(1) %54, align 16, !invariant.load !263
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %add.3969.i.22 = fadd double %add.3969.i.21, %56
  %add.3969.i.23 = fadd double %add.3969.i.22, %57
  %58 = trunc i8 %5 to i1
  %59 = select i1 %58, double %7, double %9
  %multiply.3061.1.clone.1 = fmul double %add.3969.i.23, 5.000000e-01
  %add.4379.1.clone.1 = fsub double %multiply.3061.1.clone.1, %59
  %subtract.235.1.clone.1 = fsub double %3, %add.4379.1.clone.1
  %compare.1172.1.clone.1 = fcmp uno double %subtract.235.1.clone.1, 0.000000e+00
  %60 = select i1 %compare.1172.1.clone.1, double 0xFFF0000000000000, double %subtract.235.1.clone.1
  %61 = fcmp ole double %60, 0.000000e+00
  %minimum.9.1 = select i1 %61, double %60, double 0.000000e+00
  %62 = getelementptr double, ptr addrspace(1) %arg516, i64 %1
  store double %minimum.9.1, ptr addrspace(1) %62, align 8
  %63 = getelementptr double, ptr addrspace(1) %arg618, i64 %1
  store double %60, ptr addrspace(1) %63, align 8
  %64 = getelementptr double, ptr addrspace(1) %arg720, i64 %1
  store double %add.4379.1.clone.1, ptr addrspace(1) %64, align 8
  %65 = getelementptr double, ptr addrspace(1) %arg822, i64 %1
  store double %59, ptr addrspace(1) %65, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg4) local_unnamed_addr #4 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !268
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
  %param_2.2818 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg216, i64 0, i64 %5
  %param_2.28182 = load i64, ptr addrspace(1) %param_2.2818, align 8, !invariant.load !263
  %param_3.2294 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg318, i64 0, i64 %5
  %param_3.22943 = load i64, ptr addrspace(1) %param_3.2294, align 8, !invariant.load !263
  %6 = icmp slt i64 %param_2.28182, %param_3.22943
  %param_1.3376 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg114, i64 0, i64 %5
  %param_1.33764 = load i8, ptr addrspace(1) %param_1.3376, align 1, !invariant.load !263
  %param_0.2383 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg012, i64 0, i64 %5
  %param_0.23835 = load i8, ptr addrspace(1) %param_0.2383, align 1, !invariant.load !263
  %7 = or i8 %param_0.23835, %param_1.33764
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
define void @loop_concatenate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg13) local_unnamed_addr #6 {
entry:
  %arg1345 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1243 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1141 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1039 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg937 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg835 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg733 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg631 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg529 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !266
  %.urem = add nsw i32 %0, -24
  %.cmp = icmp ult i32 %0, 24
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %2 = icmp ult i32 %1, 12
  br i1 %2, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %entry
  %3 = icmp ult i32 %1, 4
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  %4 = icmp ugt i32 %0, 23
  %5 = select i1 %4, i64 4, i64 0
  %6 = getelementptr double, ptr addrspace(1) %arg019, i64 %5
  %7 = zext nneg i32 %1 to i64
  %8 = getelementptr inbounds double, ptr addrspace(1) %6, i64 %7
  %9 = zext i1 %4 to i64
  %10 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1243, i64 0, i64 %9
  %11 = load i64, ptr addrspace(1) %10, align 8, !invariant.load !263
  %12 = getelementptr double, ptr addrspace(1) %arg121, i64 %5
  %13 = getelementptr inbounds double, ptr addrspace(1) %12, i64 %7
  br label %concatenate.37.1.merge

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %14 = icmp ugt i32 %0, 23
  %15 = icmp ult i32 %1, 8
  %16 = select i1 %14, i64 4, i64 0
  %17 = zext i1 %14 to i64
  %18 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1243, i64 0, i64 %17
  %19 = load i64, ptr addrspace(1) %18, align 8, !invariant.load !263
  br i1 %15, label %concatenate.pivot.4.11, label %concatenate.pivot.8.12

concatenate.pivot.4.11:                           ; preds = %concatenate.pivot.8.
  %20 = add nsw i32 %1, -4
  %21 = getelementptr double, ptr addrspace(1) %arg223, i64 %16
  %22 = zext nneg i32 %20 to i64
  %23 = getelementptr inbounds double, ptr addrspace(1) %21, i64 %22
  %24 = getelementptr double, ptr addrspace(1) %arg325, i64 %16
  %25 = getelementptr inbounds double, ptr addrspace(1) %24, i64 %22
  br label %concatenate.37.1.merge

concatenate.pivot.8.12:                           ; preds = %concatenate.pivot.8.
  %26 = add nsw i32 %1, -8
  %27 = getelementptr double, ptr addrspace(1) %arg427, i64 %16
  %28 = zext nneg i32 %26 to i64
  %29 = getelementptr inbounds double, ptr addrspace(1) %27, i64 %28
  %30 = getelementptr double, ptr addrspace(1) %arg529, i64 %16
  %31 = getelementptr inbounds double, ptr addrspace(1) %30, i64 %28
  br label %concatenate.37.1.merge

concatenate.pivot.16.:                            ; preds = %entry
  %32 = icmp ugt i32 %0, 23
  %33 = icmp ult i32 %1, 16
  %34 = select i1 %32, i64 4, i64 0
  br i1 %33, label %concatenate.pivot.12.13, label %concatenate.pivot.20.

concatenate.pivot.12.13:                          ; preds = %concatenate.pivot.16.
  %35 = icmp ugt i32 %0, 23
  %36 = add nsw i32 %1, -12
  %37 = getelementptr double, ptr addrspace(1) %arg631, i64 %34
  %38 = zext nneg i32 %36 to i64
  %39 = getelementptr inbounds double, ptr addrspace(1) %37, i64 %38
  %40 = zext i1 %35 to i64
  %41 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1243, i64 0, i64 %40
  %42 = load i64, ptr addrspace(1) %41, align 8, !invariant.load !263
  %43 = getelementptr double, ptr addrspace(1) %arg733, i64 %34
  %44 = getelementptr inbounds double, ptr addrspace(1) %43, i64 %38
  br label %concatenate.37.1.merge

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %45 = icmp ugt i32 %0, 23
  %46 = icmp ult i32 %1, 20
  %47 = zext i1 %45 to i64
  %48 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1243, i64 0, i64 %47
  %49 = load i64, ptr addrspace(1) %48, align 8, !invariant.load !263
  br i1 %46, label %concatenate.pivot.16.14, label %concatenate.pivot.20.15

concatenate.pivot.16.14:                          ; preds = %concatenate.pivot.20.
  %50 = add nsw i32 %1, -16
  %51 = getelementptr double, ptr addrspace(1) %arg835, i64 %34
  %52 = zext nneg i32 %50 to i64
  %53 = getelementptr inbounds double, ptr addrspace(1) %51, i64 %52
  %54 = getelementptr double, ptr addrspace(1) %arg937, i64 %34
  %55 = getelementptr inbounds double, ptr addrspace(1) %54, i64 %52
  br label %concatenate.37.1.merge

concatenate.pivot.20.15:                          ; preds = %concatenate.pivot.20.
  %56 = add nsw i32 %1, -20
  %57 = getelementptr double, ptr addrspace(1) %arg1039, i64 %34
  %58 = zext nneg i32 %56 to i64
  %59 = getelementptr inbounds double, ptr addrspace(1) %57, i64 %58
  %60 = getelementptr double, ptr addrspace(1) %arg1141, i64 %34
  %61 = getelementptr inbounds double, ptr addrspace(1) %60, i64 %58
  br label %concatenate.37.1.merge

concatenate.37.1.merge:                           ; preds = %concatenate.pivot.20.15, %concatenate.pivot.16.14, %concatenate.pivot.12.13, %concatenate.pivot.8.12, %concatenate.pivot.4.11, %concatenate.pivot.0.
  %.sink18 = phi ptr addrspace(1) [ %61, %concatenate.pivot.20.15 ], [ %55, %concatenate.pivot.16.14 ], [ %44, %concatenate.pivot.12.13 ], [ %31, %concatenate.pivot.8.12 ], [ %25, %concatenate.pivot.4.11 ], [ %13, %concatenate.pivot.0. ]
  %multiply.3002.78.sink.in.in = phi i64 [ %49, %concatenate.pivot.20.15 ], [ %49, %concatenate.pivot.16.14 ], [ %42, %concatenate.pivot.12.13 ], [ %19, %concatenate.pivot.8.12 ], [ %19, %concatenate.pivot.4.11 ], [ %11, %concatenate.pivot.0. ]
  %.sink.in = phi ptr addrspace(1) [ %59, %concatenate.pivot.20.15 ], [ %53, %concatenate.pivot.16.14 ], [ %39, %concatenate.pivot.12.13 ], [ %29, %concatenate.pivot.8.12 ], [ %23, %concatenate.pivot.4.11 ], [ %8, %concatenate.pivot.0. ]
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !263
  %multiply.3002.78.sink.in = sitofp i64 %multiply.3002.78.sink.in.in to double
  %multiply.3002.78.sink = fmul double %multiply.3002.78.sink.in, 0x3F9EEC9242B3CA9C
  %62 = load double, ptr addrspace(1) %.sink18, align 8, !invariant.load !263
  %multiply.3008.5 = fmul double %62, %multiply.3002.78.sink
  %add.4171.5 = fadd double %.sink, %multiply.3008.5
  %multiply.3009.1 = fmul double %add.4171.5, 5.000000e-01
  %63 = zext nneg i32 %0 to i64
  %64 = getelementptr double, ptr addrspace(1) %arg1345, i64 %63
  store double %multiply.3009.1, ptr addrspace(1) %64, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_exponential_reduce_select_fusion(ptr noalias nocapture align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture align 128 dereferenceable(64) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg8, ptr noalias nocapture align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg10, ptr noalias nocapture align 128 dereferenceable(64) %arg11, ptr noalias nocapture align 128 dereferenceable(64) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg13, ptr noalias nocapture align 128 dereferenceable(64) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg30) local_unnamed_addr #4 {
entry:
  %arg30256 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29254 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28252 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27250 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26248 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25246 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24244 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23242 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22240 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21238 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20236 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19234 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18232 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17230 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16228 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15226 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14224 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13222 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12220 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11218 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10216 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9214 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8212 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7210 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6208 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5206 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4204 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3202 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2200 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1198 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0196 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !268
  %0 = lshr i32 %thread.id.x, 2
  %1 = icmp ugt i32 %thread.id.x, 7
  br i1 %1, label %entry.loop1.loop_exit_crit_edge, label %loop1.loop_body.lr.ph

entry.loop1.loop_exit_crit_edge:                  ; preds = %entry
  %.pre = zext nneg i32 %0 to i64
  br label %loop1.loop_exit

loop1.loop_body.lr.ph:                            ; preds = %entry
  %thread.id.2 = and i32 %thread.id.x, 3
  %2 = zext nneg i32 %thread.id.2 to i64
  %3 = or i32 %thread.id.x, 12
  %4 = zext nneg i32 %3 to i64
  %5 = or i32 %thread.id.x, 20
  %6 = zext nneg i32 %5 to i64
  %7 = or i32 %thread.id.x, 4
  %8 = zext nneg i32 %7 to i64
  %9 = zext nneg i32 %0 to i64
  %param_5.2867 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg5206, i64 0, i64 %9, i64 %2
  %param_5.286714 = load double, ptr addrspace(1) %param_5.2867, align 8
  %param_7.1888 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg7210, i64 0, i64 %9
  %param_7.188815 = load i64, ptr addrspace(1) %param_7.1888, align 8, !invariant.load !263
  %10 = sitofp i64 %param_7.188815 to double
  %multiply.3000.3.clone.1 = fmul double %10, 0x3FAEEC9242B3CA9C
  %param_6.2254 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg6208, i64 0, i64 %9, i64 %4
  %param_6.225416 = load double, ptr addrspace(1) %param_6.2254, align 8, !invariant.load !263
  %add.4172.6.clone.1 = fadd double %param_6.225416, %param_6.225416
  %multiply.3029.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.1
  %add.4196.1.clone.1 = fadd double %param_5.286714, %multiply.3029.1.clone.1
  %add.4197.5 = fadd double %add.4196.1.clone.1, -1.000000e+00
  %multiply.3030.1 = fmul double %add.4197.5, %add.4197.5
  %add.4198.1 = fadd double %multiply.3030.1, 0x3FFD67F1C864BEB4
  %multiply.3031.1 = fmul double %add.4198.1, 5.000000e-01
  %11 = fsub double 0.000000e+00, %multiply.3031.1
  %param_8.1584 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg8212, i64 0, i64 %9, i64 %2
  %param_8.158419 = load double, ptr addrspace(1) %param_8.1584, align 8, !invariant.load !263
  %12 = getelementptr [2 x [24 x double]], ptr addrspace(1) %arg6208, i64 0, i64 %9, i64 %2
  %param_6.225420258 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 128
  %param_6.225421 = load double, ptr addrspace(1) %param_6.225420258, align 8, !invariant.load !263
  %add.4172.6.clone.124 = fadd double %param_6.225421, %param_6.225421
  %multiply.3010.1.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.124
  %add.4173.1.clone.1.clone.1 = fadd double %param_8.158419, %multiply.3010.1.clone.1.clone.1
  %add.4174.5.clone.1 = fadd double %add.4173.1.clone.1.clone.1, 4.000000e+00
  %multiply.3011.1.clone.1 = fmul double %add.4174.5.clone.1, %add.4174.5.clone.1
  %multiply.3012.1.clone.1 = fmul double %multiply.3011.1.clone.1, 2.500000e-01
  %add.4176.1.clone.1 = fadd double %multiply.3012.1.clone.1, 0x4009CB1A63AF7C52
  %multiply.3013.1.clone.1 = fmul double %add.4176.1.clone.1, 5.000000e-01
  %13 = fsub double 0.000000e+00, %multiply.3013.1.clone.1
  %param_10.1244 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg10216, i64 0, i64 %9, i64 %2
  %param_10.124426 = load double, ptr addrspace(1) %param_10.1244, align 8, !invariant.load !263
  %param_6.225427 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg6208, i64 0, i64 %9, i64 %6
  %param_6.225428 = load double, ptr addrspace(1) %param_6.225427, align 8, !invariant.load !263
  %add.4172.6.clone.131 = fadd double %param_6.225428, %param_6.225428
  %multiply.3021.1.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.131
  %add.4186.1.clone.1.clone.1 = fadd double %param_10.124426, %multiply.3021.1.clone.1.clone.1
  %add.4187.5.clone.1 = fadd double %add.4186.1.clone.1.clone.1, 6.000000e+00
  %multiply.3022.1.clone.1 = fmul double %add.4187.5.clone.1, %add.4187.5.clone.1
  %multiply.3023.1.clone.1 = fmul double %multiply.3022.1.clone.1, 2.500000e-01
  %add.4188.1.clone.1 = fadd double %multiply.3023.1.clone.1, 0x4009CB1A63AF7C52
  %multiply.3024.1.clone.1 = fmul double %add.4188.1.clone.1, 5.000000e-01
  %14 = fsub double 0.000000e+00, %multiply.3024.1.clone.1
  %param_13.956 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg13222, i64 0, i64 %9, i64 %2
  %param_13.95633 = load double, ptr addrspace(1) %param_13.956, align 8, !invariant.load !263
  %param_6.225434 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg6208, i64 0, i64 %9, i64 %8
  %param_6.225435 = load double, ptr addrspace(1) %param_6.225434, align 8, !invariant.load !263
  %add.4172.6.clone.138 = fadd double %param_6.225435, %param_6.225435
  %multiply.3025.7.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.138
  %add.4191.7.clone.1.clone.1 = fadd double %param_13.95633, %multiply.3025.7.clone.1.clone.1
  %add.4192.5.clone.1.clone.1 = fadd double %add.4191.7.clone.1.clone.1, -1.000000e+00
  %multiply.3026.1.clone.1.clone.1 = fmul double %add.4192.5.clone.1.clone.1, %add.4192.5.clone.1.clone.1
  %multiply.3027.1.clone.1.clone.1 = fmul double %multiply.3026.1.clone.1.clone.1, 4.000000e+00
  %add.4193.1.clone.1.clone.1 = fadd double %multiply.3027.1.clone.1.clone.1, 0x3FDCE6BB25AA1315
  %multiply.3028.1.clone.1.clone.1 = fmul double %add.4193.1.clone.1.clone.1, 5.000000e-01
  %15 = fsub double 0.000000e+00, %multiply.3028.1.clone.1.clone.1
  %param_15.874 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg15226, i64 0, i64 %9, i64 %2
  %param_15.87440 = load double, ptr addrspace(1) %param_15.874, align 8, !invariant.load !263
  %param_6.225441259 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 64
  %param_6.225442 = load double, ptr addrspace(1) %param_6.225441259, align 8, !invariant.load !263
  %add.4172.6.clone.145 = fadd double %param_6.225442, %param_6.225442
  %multiply.3014.9.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.145
  %add.4177.9.clone.1.clone.1 = fadd double %param_15.87440, %multiply.3014.9.clone.1.clone.1
  %add.4178.5.clone.1.clone.1 = fadd double %add.4177.9.clone.1.clone.1, 0xBFF62E42FEFA39EF
  %multiply.3015.1.clone.1.clone.1 = fmul double %add.4178.5.clone.1.clone.1, %add.4178.5.clone.1.clone.1
  %multiply.3016.1.clone.1.clone.1 = fmul double %multiply.3015.1.clone.1.clone.1, 0x3FFC71C71C71C71C
  %add.4179.1.clone.1.clone.1 = fadd double %multiply.3016.1.clone.1.clone.1, 0x3FF43340BFCA50EB
  %multiply.3017.1.clone.1.clone.1 = fmul double %add.4179.1.clone.1.clone.1, 5.000000e-01
  %16 = fsub double 0.000000e+00, %multiply.3017.1.clone.1.clone.1
  %param_1.7533 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1198, i64 0, i64 %9
  %param_1.753347 = load i64, ptr addrspace(1) %param_1.7533, align 8, !invariant.load !263
  %param_4.3606 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg4204, i64 0, i64 %9
  %param_4.360648 = load i64, ptr addrspace(1) %param_4.3606, align 8, !invariant.load !263
  %17 = icmp sge i64 %param_1.753347, %param_4.360648
  %param_3.4748 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg3202, i64 0, i64 %9
  %param_3.474849 = load i8, ptr addrspace(1) %param_3.4748, align 1, !invariant.load !263
  %param_2.5811 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg2200, i64 0, i64 %9
  %param_2.581150 = load i8, ptr addrspace(1) %param_2.5811, align 1, !invariant.load !263
  %18 = or i8 %param_2.581150, %param_3.474849
  %19 = trunc i8 %18 to i1
  %.not147 = or i1 %17, %19
  %20 = icmp eq i64 %param_1.753347, 0
  %param_0.5331 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg0196, i64 0, i64 %9, i64 %2
  %param_0.533153 = load double, ptr addrspace(1) %param_0.5331, align 8
  %21 = select i1 %20, double %add.4196.1.clone.1, double %param_0.533153
  %22 = select i1 %.not147, double %param_0.533153, double %21
  %23 = select i1 %.not147, double %param_5.286714, double %add.4196.1.clone.1
  %24 = select i1 %.not147, double %param_8.158419, double %add.4173.1.clone.1.clone.1
  %param_9.1397 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg9214, i64 0, i64 %9, i64 %2
  %param_9.139760 = load double, ptr addrspace(1) %param_9.1397, align 8
  %25 = select i1 %20, double %add.4173.1.clone.1.clone.1, double %param_9.139760
  %26 = select i1 %.not147, double %param_9.139760, double %25
  %27 = select i1 %.not147, double %param_10.124426, double %add.4186.1.clone.1.clone.1
  %param_11.1086 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg11218, i64 0, i64 %9, i64 %2
  %param_11.108665 = load double, ptr addrspace(1) %param_11.1086, align 8
  %28 = select i1 %20, double %add.4186.1.clone.1.clone.1, double %param_11.108665
  %29 = select i1 %.not147, double %param_11.108665, double %28
  %param_12.1025 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg12220, i64 0, i64 %9, i64 %2
  %param_12.102568 = load double, ptr addrspace(1) %param_12.1025, align 8
  %30 = select i1 %20, double %add.4191.7.clone.1.clone.1, double %param_12.102568
  %31 = select i1 %.not147, double %param_12.102568, double %30
  %32 = select i1 %.not147, double %param_13.95633, double %add.4191.7.clone.1.clone.1
  %param_14.872 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg14224, i64 0, i64 %9, i64 %2
  %param_14.87273 = load double, ptr addrspace(1) %param_14.872, align 8
  %33 = select i1 %20, double %add.4177.9.clone.1.clone.1, double %param_14.87273
  %34 = select i1 %.not147, double %param_14.87273, double %33
  %35 = tail call double @llvm.fma.f64(double %add.4177.9.clone.1.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %36 = tail call i32 @llvm.nvvm.d2i.lo(double %35) #12
  %37 = tail call double @llvm.nvvm.add.rn.d(double %35, double 0xC338000000000000) #12
  %38 = tail call double @llvm.fma.f64(double %37, double 0xBFE62E42FEFA39EF, double %add.4177.9.clone.1.clone.1)
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
  %51 = tail call i32 @llvm.nvvm.d2i.lo(double %50) #12
  %52 = tail call i32 @llvm.nvvm.d2i.hi(double %50) #12
  %53 = shl i32 %36, 20
  %54 = add i32 %52, %53
  %55 = tail call double @llvm.nvvm.lohi.i2d(i32 %51, i32 %54) #12
  %56 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4177.9.clone.1.clone.1) #12
  %57 = bitcast i32 %56 to float
  %58 = tail call float @llvm.nvvm.fabs.f(float %57) #12
  %59 = fcmp olt float %58, 0x4010C46560000000
  br i1 %59, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

reduce-group-0-after:                             ; preds = %reduction_write_output-true131, %thread_in_bounds-after118
  ret void

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %loop1.loop_body.lr.ph
  %60 = fcmp olt double %add.4177.9.clone.1.clone.1, 0.000000e+00
  %61 = fadd double %add.4177.9.clone.1.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %60, double 0.000000e+00, double %61
  %62 = fcmp olt float %58, 0x4010E90000000000
  br i1 %62, label %63, label %__nv_exp.exit

63:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %64 = sdiv i32 %36, 2
  %65 = shl i32 %64, 20
  %66 = add i32 %52, %65
  %67 = tail call double @llvm.nvvm.lohi.i2d(i32 %51, i32 %66) #12
  %68 = sub nsw i32 %36, %64
  %69 = shl i32 %68, 20
  %70 = add nsw i32 %69, 1072693248
  %71 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %70) #12
  %72 = fmul double %71, %67
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %loop1.loop_body.lr.ph, %__internal_fast_icmp_abs_lt.exit.i, %63
  %z.2.i = phi double [ %55, %loop1.loop_body.lr.ph ], [ %72, %63 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %param_16.968 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg16228, i64 0, i64 %9, i64 %2
  %param_16.96876 = load double, ptr addrspace(1) %param_16.968, align 8, !invariant.load !263
  %param_6.225478 = load double, ptr addrspace(1) %12, align 8, !invariant.load !263
  %add.4172.6.clone.181 = fadd double %param_6.225478, %param_6.225478
  %multiply.3018.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.6.clone.181
  %add.4182.1.clone.1 = fadd double %param_16.96876, %multiply.3018.1.clone.1
  store double %22, ptr addrspace(1) %param_0.5331, align 8
  store double %23, ptr addrspace(1) %param_5.2867, align 8
  %73 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg18232, i64 0, i64 %9, i64 %2
  store double %add.4196.1.clone.1, ptr addrspace(1) %73, align 8
  %74 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg19234, i64 0, i64 %9, i64 %2
  store double %24, ptr addrspace(1) %74, align 8
  store double %26, ptr addrspace(1) %param_9.1397, align 8
  %75 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg21238, i64 0, i64 %9, i64 %2
  store double %add.4173.1.clone.1.clone.1, ptr addrspace(1) %75, align 8
  %76 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg22240, i64 0, i64 %9, i64 %2
  store double %27, ptr addrspace(1) %76, align 8
  store double %29, ptr addrspace(1) %param_11.1086, align 8
  %77 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg24244, i64 0, i64 %9, i64 %2
  store double %add.4186.1.clone.1.clone.1, ptr addrspace(1) %77, align 8
  store double %31, ptr addrspace(1) %param_12.1025, align 8
  %78 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg27250, i64 0, i64 %9, i64 %2
  store double %add.4191.7.clone.1.clone.1, ptr addrspace(1) %78, align 8
  %79 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg26248, i64 0, i64 %9, i64 %2
  store double %32, ptr addrspace(1) %79, align 8
  store double %34, ptr addrspace(1) %param_14.872, align 8
  %80 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg29254, i64 0, i64 %9, i64 %2
  store double %z.2.i, ptr addrspace(1) %80, align 8
  %81 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg30256, i64 0, i64 %9, i64 %2
  store double %add.4182.1.clone.1, ptr addrspace(1) %81, align 8
  br label %loop1.loop_exit

loop1.loop_exit:                                  ; preds = %entry.loop1.loop_exit_crit_edge, %__nv_exp.exit
  %.pre-phi = phi i64 [ %.pre, %entry.loop1.loop_exit_crit_edge ], [ %9, %__nv_exp.exit ]
  %partial_reduction_result5.0.lcssa = phi double [ 0.000000e+00, %entry.loop1.loop_exit_crit_edge ], [ %14, %__nv_exp.exit ]
  %partial_reduction_result2.0.lcssa = phi double [ 0.000000e+00, %entry.loop1.loop_exit_crit_edge ], [ %13, %__nv_exp.exit ]
  %partial_reduction_result8.0.lcssa = phi double [ 0.000000e+00, %entry.loop1.loop_exit_crit_edge ], [ %15, %__nv_exp.exit ]
  %partial_reduction_result.0.lcssa = phi double [ 0.000000e+00, %entry.loop1.loop_exit_crit_edge ], [ %11, %__nv_exp.exit ]
  %partial_reduction_result11.0.lcssa = phi double [ 0.000000e+00, %entry.loop1.loop_exit_crit_edge ], [ %16, %__nv_exp.exit ]
  %82 = bitcast double %partial_reduction_result.0.lcssa to <2 x i32>
  %83 = extractelement <2 x i32> %82, i64 0
  %84 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %83, i32 2, i32 31)
  %85 = insertelement <2 x i32> poison, i32 %84, i64 0
  %86 = extractelement <2 x i32> %82, i64 1
  %87 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %86, i32 2, i32 31)
  %88 = insertelement <2 x i32> %85, i32 %87, i64 1
  %89 = bitcast <2 x i32> %88 to double
  %add.3969.i172 = fadd double %partial_reduction_result.0.lcssa, %89
  %90 = bitcast double %add.3969.i172 to <2 x i32>
  %91 = extractelement <2 x i32> %90, i64 0
  %92 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %91, i32 1, i32 31)
  %93 = extractelement <2 x i32> %90, i64 1
  %94 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %93, i32 1, i32 31)
  %95 = and i32 %thread.id.x, 27
  %or.cond = icmp eq i32 %95, 0
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg17230, i64 0, i64 %.pre-phi
  %96 = insertelement <2 x i32> poison, i32 %92, i64 0
  %97 = insertelement <2 x i32> %96, i32 %94, i64 1
  %98 = bitcast <2 x i32> %97 to double
  %add.3969.i173 = fadd double %add.3969.i172, %98
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %99 = icmp eq i32 %95, 0
  %100 = bitcast double %partial_reduction_result2.0.lcssa to <2 x i32>
  %101 = extractelement <2 x i32> %100, i64 0
  %102 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %101, i32 2, i32 31)
  %103 = insertelement <2 x i32> poison, i32 %102, i64 0
  %104 = extractelement <2 x i32> %100, i64 1
  %105 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %104, i32 2, i32 31)
  %106 = insertelement <2 x i32> %103, i32 %105, i64 1
  %107 = bitcast <2 x i32> %106 to double
  %add.3969.i174 = fadd double %partial_reduction_result2.0.lcssa, %107
  %108 = bitcast double %add.3969.i174 to <2 x i32>
  %109 = extractelement <2 x i32> %108, i64 0
  %110 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %109, i32 1, i32 31)
  %111 = extractelement <2 x i32> %108, i64 1
  %112 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %111, i32 1, i32 31)
  %output_element_address97 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg20236, i64 0, i64 %.pre-phi
  %113 = insertelement <2 x i32> poison, i32 %110, i64 0
  %114 = insertelement <2 x i32> %113, i32 %112, i64 1
  %115 = bitcast <2 x i32> %114 to double
  %add.3969.i175 = fadd double %add.3969.i174, %115
  br i1 %99, label %reduction_write_output-true95, label %thread_in_bounds-after94

thread_in_bounds-after94:                         ; preds = %reduction_write_output-true95, %thread_in_bounds-after
  %116 = icmp eq i32 %95, 0
  %117 = bitcast double %partial_reduction_result5.0.lcssa to <2 x i32>
  %118 = extractelement <2 x i32> %117, i64 0
  %119 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %118, i32 2, i32 31)
  %120 = insertelement <2 x i32> poison, i32 %119, i64 0
  %121 = extractelement <2 x i32> %117, i64 1
  %122 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %121, i32 2, i32 31)
  %123 = insertelement <2 x i32> %120, i32 %122, i64 1
  %124 = bitcast <2 x i32> %123 to double
  %add.3969.i176 = fadd double %partial_reduction_result5.0.lcssa, %124
  %125 = bitcast double %add.3969.i176 to <2 x i32>
  %126 = extractelement <2 x i32> %125, i64 0
  %127 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %126, i32 1, i32 31)
  %128 = extractelement <2 x i32> %125, i64 1
  %129 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %128, i32 1, i32 31)
  %output_element_address109 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg23242, i64 0, i64 %.pre-phi
  %130 = insertelement <2 x i32> poison, i32 %127, i64 0
  %131 = insertelement <2 x i32> %130, i32 %129, i64 1
  %132 = bitcast <2 x i32> %131 to double
  %add.3969.i177 = fadd double %add.3969.i176, %132
  br i1 %116, label %reduction_write_output-true107, label %thread_in_bounds-after106

thread_in_bounds-after106:                        ; preds = %reduction_write_output-true107, %thread_in_bounds-after94
  %133 = icmp eq i32 %95, 0
  %134 = bitcast double %partial_reduction_result8.0.lcssa to <2 x i32>
  %135 = extractelement <2 x i32> %134, i64 0
  %136 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %135, i32 2, i32 31)
  %137 = insertelement <2 x i32> poison, i32 %136, i64 0
  %138 = extractelement <2 x i32> %134, i64 1
  %139 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %138, i32 2, i32 31)
  %140 = insertelement <2 x i32> %137, i32 %139, i64 1
  %141 = bitcast <2 x i32> %140 to double
  %add.3969.i178 = fadd double %partial_reduction_result8.0.lcssa, %141
  %142 = bitcast double %add.3969.i178 to <2 x i32>
  %143 = extractelement <2 x i32> %142, i64 0
  %144 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %143, i32 1, i32 31)
  %145 = extractelement <2 x i32> %142, i64 1
  %146 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %145, i32 1, i32 31)
  %output_element_address121 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg25246, i64 0, i64 %.pre-phi
  %147 = insertelement <2 x i32> poison, i32 %144, i64 0
  %148 = insertelement <2 x i32> %147, i32 %146, i64 1
  %149 = bitcast <2 x i32> %148 to double
  %add.3969.i179 = fadd double %add.3969.i178, %149
  br i1 %133, label %reduction_write_output-true119, label %thread_in_bounds-after118

thread_in_bounds-after118:                        ; preds = %reduction_write_output-true119, %thread_in_bounds-after106
  %150 = icmp eq i32 %95, 0
  %151 = bitcast double %partial_reduction_result11.0.lcssa to <2 x i32>
  %152 = extractelement <2 x i32> %151, i64 0
  %153 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %152, i32 2, i32 31)
  %154 = insertelement <2 x i32> poison, i32 %153, i64 0
  %155 = extractelement <2 x i32> %151, i64 1
  %156 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %155, i32 2, i32 31)
  %157 = insertelement <2 x i32> %154, i32 %156, i64 1
  %158 = bitcast <2 x i32> %157 to double
  %add.3969.i180 = fadd double %partial_reduction_result11.0.lcssa, %158
  %159 = bitcast double %add.3969.i180 to <2 x i32>
  %160 = extractelement <2 x i32> %159, i64 0
  %161 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %160, i32 1, i32 31)
  %162 = extractelement <2 x i32> %159, i64 1
  %163 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %162, i32 1, i32 31)
  %output_element_address133 = getelementptr inbounds [2 x double], ptr addrspace(1) %arg28252, i64 0, i64 %.pre-phi
  %164 = insertelement <2 x i32> poison, i32 %161, i64 0
  %165 = insertelement <2 x i32> %164, i32 %163, i64 1
  %166 = bitcast <2 x i32> %165 to double
  %add.3969.i181 = fadd double %add.3969.i180, %166
  br i1 %150, label %reduction_write_output-true131, label %reduce-group-0-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3969.i173, ptr addrspace(1) %output_element_address, align 8
  br label %thread_in_bounds-after

reduction_write_output-true95:                    ; preds = %thread_in_bounds-after
  store double %add.3969.i175, ptr addrspace(1) %output_element_address97, align 8
  br label %thread_in_bounds-after94

reduction_write_output-true107:                   ; preds = %thread_in_bounds-after94
  store double %add.3969.i177, ptr addrspace(1) %output_element_address109, align 8
  br label %thread_in_bounds-after106

reduction_write_output-true119:                   ; preds = %thread_in_bounds-after106
  store double %add.3969.i179, ptr addrspace(1) %output_element_address121, align 8
  br label %thread_in_bounds-after118

reduction_write_output-true131:                   ; preds = %thread_in_bounds-after118
  store double %add.3969.i181, ptr addrspace(1) %output_element_address133, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !264
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1536
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
define void @loop_broadcast_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !264
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1536
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
define void @loop_broadcast_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !264
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1536
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
define void @loop_broadcast_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !264
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1536
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !272
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !272
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !270
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0x7FF8000000000000, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #2 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !263
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
  %param_1.1516 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !263
  %0 = icmp slt i64 %param_1.1516, 0
  %1 = add i64 %param_1.1516, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1516
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg04, i64 0, i64 %4
  store i32 1, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1239 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1239, 0
  %4 = add i64 %param_2.1239, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1239
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.14606 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = icmp ne i64 %param_1.14606, 0
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [1 x [2 x [4 x i8]]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 0, i64 %1, i64 %2
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1276 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1276, 0
  %4 = add i64 %param_2.1276, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1276
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14975 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = icmp ne i64 %param_1.14975, 0
  %10 = zext i1 %9 to i8
  %11 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %10, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1299 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1299, 0
  %4 = add i64 %param_2.1299, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1299
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15135 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !263
  %.not = icmp eq i64 %param_1.15135, 0
  %9 = zext i1 %.not to i8
  %10 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_52(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.1518 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !263
  %0 = icmp slt i64 %param_1.1518, 0
  %1 = add i64 %param_1.1518, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1518
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg04, i64 0, i64 %4
  store double 1.000000e+00, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1285 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1285, 0
  %4 = add i64 %param_2.1285, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1285
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15065 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = icmp ne i64 %param_1.15065, 0
  %10 = zext i1 %9 to i32
  %11 = getelementptr inbounds [192 x [2 x [4 x i32]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store i32 %10, ptr addrspace(1) %11, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_41(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1261 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1261, 0
  %4 = add i64 %param_2.1261, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1261
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.14825 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %multiply.2990.1 = fmul double %param_1.14825, %param_1.14825
  %divide.611.1 = fdiv double 1.000000e+00, %multiply.2990.1
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.611.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_4(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1481 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1481, 0
  %4 = add i64 %param_1.1481, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1481
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13005 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %multiply.2982.5 = fmul double %param_2.13005, %param_2.13005
  %multiply.2984.3 = fmul double %multiply.2982.5, 5.000000e-01
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2984.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1296 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1296, 0
  %4 = add i64 %param_2.1296, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1296
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.14855 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %multiply.2999.3 = fmul double %param_1.14855, 2.000000e+00
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2999.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1508 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1508, 0
  %4 = add i64 %param_1.1508, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1508
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg05, i64 0, i64 %7, i64 %1, i64 %2
  store double 1.000000e+00, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1274 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1274, 0
  %4 = add i64 %param_2.1274, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1274
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.14955 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = sitofp i64 %param_1.14955 to double
  %10 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1275 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1275, 0
  %4 = add i64 %param_2.1275, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1275
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.14965 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.14965, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_29(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1493 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1493, 0
  %4 = add i64 %param_1.1493, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1493
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12725 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %multiply.2962.2 = fmul double %param_2.12725, %param_2.12725
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2962.2, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_51(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1523 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1523, 0
  %4 = add i64 %param_1.1523, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1523
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg05, i64 0, i64 %7, i64 %1, i64 %2
  store double 0.000000e+00, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_40(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1265 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1265, 0
  %4 = add i64 %param_2.1265, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1265
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.14865 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.14865, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_47(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1248 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1248, 0
  %4 = add i64 %param_2.1248, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1248
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.14695 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.14695, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_exponential_select_fusion(ptr noalias nocapture align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5, ptr noalias nocapture align 128 dereferenceable(64) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg23) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = and i32 %0, 3
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg216, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !263
  %5 = getelementptr double, ptr addrspace(1) %arg828, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !263
  %multiply.2958.3.clone.1 = fmul double %4, %6
  %7 = getelementptr double, ptr addrspace(1) %arg114, i64 %2
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !263
  %add.4051.3.clone.1 = fadd double %multiply.2958.3.clone.1, %8
  %9 = getelementptr double, ptr addrspace(1) %arg930, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
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
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !263
  %52 = getelementptr double, ptr addrspace(1) %arg1338, i64 %2
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !263
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
  %95 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg420, i64 0, i64 %94
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !263
  %97 = load i64, ptr addrspace(1) %arg1236, align 128, !invariant.load !263
  %98 = icmp slt i64 %97, 0
  %99 = add i64 %97, 192
  %100 = select i1 %98, i64 %99, i64 %97
  %101 = trunc i64 %100 to i32
  %102 = tail call i32 @llvm.smax.i32(i32 %101, i32 0)
  %103 = tail call i32 @llvm.umin.i32(i32 %102, i32 191)
  %104 = zext nneg i32 %103 to i64
  %105 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg1134, i64 0, i64 %94, i64 %104, i64 0
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !263
  %107 = getelementptr double, ptr addrspace(1) %arg522, i64 %2
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !263
  %109 = getelementptr double, ptr addrspace(1) %arg624, i64 %2
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg726, i64 %2
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !263
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
  %compare.1135.43.clone.1 = fcmp ogt double %z.2.i6, 1.000000e-128
  %151 = select i1 %compare.1135.43.clone.1, double %z.2.i6, double %96
  %divide.600.5.clone.1 = fdiv double 1.000000e+00, %51
  %add.4054.5.clone.1 = fadd double %divide.600.5.clone.1, %151
  %divide.601.1.clone.1 = fdiv double 1.000000e+00, %add.4054.5.clone.1
  %multiply.2966.13 = fmul double %151, %divide.601.1.clone.1
  %multiply.2967.5 = fmul double %108, %multiply.2966.13
  %multiply.2962.10.clone.1 = fmul double %10, %10
  %add.4052.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.599.1.clone.1 = fdiv double 1.000000e+00, %add.4052.1.clone.1
  %subtract.222.25.clone.1 = fsub double 1.000000e+00, %divide.599.1.clone.1
  %multiply.2959.21.clone.1 = fmul double %divide.599.1.clone.1, %subtract.222.25.clone.1
  %multiply.2963.11.clone.1 = fmul double %multiply.2962.10.clone.1, %multiply.2959.21.clone.1
  %add.4056.9.clone.1 = fadd double %multiply.2963.11.clone.1, %divide.601.1.clone.1
  %compare.1136.19.clone.1 = fcmp ogt double %add.4056.9.clone.1, 1.000000e-128
  %152 = select i1 %compare.1136.19.clone.1, double %add.4056.9.clone.1, double 0x7FF8000000000000
  %multiply.2968.3.clone.1 = fmul double %add.4054.5.clone.1, %152
  %divide.604.3.clone.1 = fdiv double 1.000000e+00, %multiply.2968.3.clone.1
  %multiply.2960.9.clone.1 = fmul double %10, %multiply.2959.21.clone.1
  %divide.602.5.clone.1 = fdiv double %multiply.2960.9.clone.1, %152
  %subtract.223.9.clone.1 = fsub double %106, %divide.599.1.clone.1
  %divide.603.5.clone.1 = fdiv double %subtract.223.9.clone.1, %multiply.2959.21.clone.1
  %multiply.2964.1.clone.1 = fmul double %divide.603.5.clone.1, %divide.602.5.clone.1
  %add.4058.1.clone.1 = fadd double %add.4051.3.clone.1, %multiply.2964.1.clone.1
  %subtract.224.2.clone.1 = fsub double %add.4058.1.clone.1, %add.4051.3.clone.1
  %multiply.2969.2.clone.1 = fmul double %subtract.224.2.clone.1, %subtract.224.2.clone.1
  %multiply.2970.1.clone.1 = fmul double %divide.601.1.clone.1, %multiply.2969.2.clone.1
  %add.4061.1.clone.1 = fadd double %divide.604.3.clone.1, %multiply.2970.1.clone.1
  %add.4062.1.clone.1 = fadd double %add.4061.1.clone.1, -1.000000e+00
  %multiply.2971.2 = fmul double %multiply.2967.5, %add.4062.1.clone.1
  %multiply.2965.3 = fmul double %4, %55
  %add.4059.3 = fadd double %8, %multiply.2965.3
  %153 = tail call double @llvm.fabs.f64(double %add.4058.1.clone.1)
  %154 = call i1 @llvm.is.fpclass.f64(double %add.4058.1.clone.1, i32 504)
  %compare.1138.7 = fcmp olt double %153, 1.400000e+01
  %155 = and i1 %154, %compare.1138.7
  %compare.1139.13.clone.1 = fcmp ogt double %z.2.i10, 1.000000e-128
  %156 = select i1 %compare.1139.13.clone.1, double %z.2.i10, double %96
  %add.4063.5.clone.1 = fadd double %divide.605.1.clone.1, %156
  %divide.606.1.clone.1 = fdiv double 1.000000e+00, %add.4063.5.clone.1
  %multiply.2972.9 = fmul double %divide.606.1.clone.1, 2.000000e+00
  %divide.607.5 = fdiv double 1.000000e+00, %multiply.2972.9
  %multiply.2973.3 = fmul double %multiply.2971.2, %divide.607.5
  %157 = getelementptr i64, ptr addrspace(1) %arg318, i64 %2
  %158 = load i64, ptr addrspace(1) %157, align 8, !invariant.load !263
  %159 = sitofp i64 %158 to double
  %multiply.2974.3 = fmul double %multiply.2973.3, %159
  %add.4064.1 = fadd double %add.4059.3, %multiply.2974.3
  %160 = select i1 %155, double %add.4064.1, double %55
  %.not = icmp eq i64 %158, 0
  %add.4066.2.clone.1 = fadd double %divide.605.1.clone.1, %z.2.i10
  %divide.608.1.clone.1 = fdiv double 1.000000e+00, %add.4066.2.clone.1
  %multiply.2975.4.clone.1 = fmul double %multiply.2967.5, %multiply.2967.5
  %multiply.2976.7.clone.1 = fmul double %multiply.2975.4.clone.1, 5.000000e-01
  %multiply.2980.5.clone.1 = fmul double %multiply.2975.4.clone.1, %add.4062.1.clone.1
  %add.4067.5.clone.1 = fadd double %multiply.2976.7.clone.1, %multiply.2980.5.clone.1
  %multiply.2982.11.clone.1 = fmul double %108, %108
  %multiply.2984.9.clone.1 = fmul double %multiply.2982.11.clone.1, 5.000000e-01
  %multiply.2985.4.clone.1 = fmul double %multiply.2966.13, %multiply.2984.9.clone.1
  %multiply.2986.5.clone.1 = fmul double %multiply.2985.4.clone.1, %add.4062.1.clone.1
  %subtract.225.5.clone.1 = fsub double %add.4067.5.clone.1, %multiply.2986.5.clone.1
  %multiply.2987.3.clone.1 = fmul double %subtract.225.5.clone.1, %159
  %add.4068.3.clone.1 = fadd double %multiply.2987.3.clone.1, %divide.606.1.clone.1
  %compare.1142.5.clone.1 = fcmp ogt double %add.4068.3.clone.1, 1.000000e-128
  %161 = select i1 %compare.1142.5.clone.1, double %add.4068.3.clone.1, double %96
  %162 = select i1 %.not, double %divide.608.1.clone.1, double %161
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
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg8) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1509 = load i64, ptr addrspace(1) %arg118, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1509, 0
  %4 = add i64 %param_1.1509, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1509
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg220, i64 %thread_id_x
  %param_2.12895 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg832, i64 %thread_id_x
  %param_8.3706 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %10 = getelementptr double, ptr addrspace(1) %arg628, i64 %thread_id_x
  %param_6.5827 = load double, ptr addrspace(1) %10, align 8, !invariant.load !263
  %compare.1135.39 = fcmp ogt double %param_6.5827, 1.000000e-128
  %param_7.454 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg730, i64 0, i64 %2
  %param_7.45410 = load double, ptr addrspace(1) %param_7.454, align 8, !invariant.load !263
  %11 = select i1 %compare.1135.39, double %param_6.5827, double %param_7.45410
  %12 = getelementptr double, ptr addrspace(1) %arg526, i64 %thread_id_x
  %param_5.70411 = load double, ptr addrspace(1) %12, align 8, !invariant.load !263
  %multiply.2966.29 = fmul double %11, %param_5.70411
  %multiply.2967.17 = fmul double %param_8.3706, %multiply.2966.29
  %multiply.2975.6 = fmul double %multiply.2967.17, %multiply.2967.17
  %multiply.2976.9 = fmul double %multiply.2975.6, 5.000000e-01
  %13 = getelementptr double, ptr addrspace(1) %arg424, i64 %thread_id_x
  %param_4.85912 = load double, ptr addrspace(1) %13, align 8, !invariant.load !263
  %multiply.2980.7 = fmul double %param_4.85912, %multiply.2975.6
  %add.4067.7 = fadd double %multiply.2976.9, %multiply.2980.7
  %multiply.2982.13 = fmul double %param_8.3706, %param_8.3706
  %multiply.2984.11 = fmul double %multiply.2982.13, 5.000000e-01
  %multiply.2985.6 = fmul double %multiply.2984.11, %multiply.2966.29
  %multiply.2986.7 = fmul double %param_4.85912, %multiply.2985.6
  %subtract.225.7 = fsub double %add.4067.7, %multiply.2986.7
  %14 = getelementptr i64, ptr addrspace(1) %arg322, i64 %thread_id_x
  %param_3.103815 = load i64, ptr addrspace(1) %14, align 8, !invariant.load !263
  %15 = sitofp i64 %param_3.103815 to double
  %multiply.2987.5 = fmul double %subtract.225.7, %15
  %add.4068.5 = fadd double %param_2.12895, %multiply.2987.5
  %compare.1142.3 = fcmp ogt double %add.4068.5, 1.000000e-128
  %16 = zext i1 %compare.1142.3 to i8
  %17 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg016, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %16, ptr addrspace(1) %17, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1301 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1301, 0
  %4 = add i64 %param_2.1301, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1301
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.15146 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = tail call double @llvm.fabs.f64(double %param_1.15146)
  %10 = call i1 @llvm.is.fpclass.f64(double %param_1.15146, i32 504)
  %compare.1138.13 = fcmp olt double %9, 1.400000e+01
  %11 = and i1 %10, %compare.1138.13
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds [192 x [1 x [2 x [4 x i8]]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 0, i64 %1, i64 %2
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1303 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1303, 0
  %4 = add i64 %param_2.1303, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1303
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.15155 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = tail call double @llvm.fabs.f64(double %param_1.15155)
  %10 = call i1 @llvm.is.fpclass.f64(double %param_1.15155, i32 504)
  %compare.1138.11 = fcmp olt double %9, 1.400000e+01
  %11 = and i1 %10, %compare.1138.11
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_2.1290 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_2.1290, 0
  %4 = add i64 %param_2.1290, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1290
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.14735 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %compare.1139.3 = fcmp ogt double %param_1.14735, 1.000000e-128
  %9 = zext i1 %compare.1139.3 to i8
  %10 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_28(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1510 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1510, 0
  %4 = add i64 %param_1.1510, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1510
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.12915 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg420, i64 %thread_id_x
  %param_4.8606 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %multiply.2962.6 = fmul double %param_4.8606, %param_4.8606
  %10 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.10399 = load double, ptr addrspace(1) %10, align 8, !invariant.load !263
  %subtract.222.29 = fsub double 1.000000e+00, %param_3.10399
  %multiply.2959.25 = fmul double %param_3.10399, %subtract.222.29
  %multiply.2963.7 = fmul double %multiply.2962.6, %multiply.2959.25
  %add.4056.5 = fadd double %param_2.12915, %multiply.2963.7
  %compare.1136.3 = fcmp ogt double %add.4056.5, 1.000000e-128
  %11 = zext i1 %compare.1136.3 to i8
  %12 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %11, ptr addrspace(1) %12, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_35(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4) local_unnamed_addr #2 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1498 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1498, 0
  %4 = add i64 %param_1.1498, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1498
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.8615 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %divide.600.7 = fdiv double 1.000000e+00, %param_4.8615
  %9 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12776 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %compare.1135.45 = fcmp ogt double %param_2.12776, 1.000000e-128
  %param_3.1029 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg316, i64 0, i64 %2
  %param_3.10299 = load double, ptr addrspace(1) %param_3.1029, align 8, !invariant.load !263
  %10 = select i1 %compare.1135.45, double %param_2.12776, double %param_3.10299
  %add.4054.7 = fadd double %divide.600.7, %10
  %multiply.2991.1 = fmul double %add.4054.7, %add.4054.7
  %divide.612.1 = fdiv double 1.000000e+00, %multiply.2991.1
  %11 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.612.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1480 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1480, 0
  %4 = add i64 %param_1.1480, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1480
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12595 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.10196 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %compare.1139.11 = fcmp ogt double %param_3.10196, 1.000000e-128
  %param_4.847 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg418, i64 0, i64 %2
  %param_4.8479 = load double, ptr addrspace(1) %param_4.847, align 8, !invariant.load !263
  %10 = select i1 %compare.1139.11, double %param_3.10196, double %param_4.8479
  %add.4063.3 = fadd double %param_2.12595, %10
  %multiply.2989.1 = fmul double %add.4063.3, %add.4063.3
  %divide.610.1 = fdiv double 1.000000e+00, %multiply.2989.1
  %11 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.610.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3) local_unnamed_addr #2 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1505 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1505, 0
  %4 = add i64 %param_1.1505, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1505
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12845 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.10336 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %add.4066.1 = fadd double %param_2.12845, %param_3.10336
  %multiply.2997.1 = fmul double %add.4066.1, %add.4066.1
  %divide.616.1 = fdiv double 1.000000e+00, %multiply.2997.1
  %10 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.616.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg6) local_unnamed_addr #2 {
entry:
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1464 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1464, 0
  %4 = add i64 %param_1.1464, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1464
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg624, i64 %thread_id_x
  %param_6.5865 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg420, i64 %thread_id_x
  %param_4.8416 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %compare.1135.31 = fcmp ogt double %param_4.8416, 1.000000e-128
  %param_5.688 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg522, i64 0, i64 %2
  %param_5.6889 = load double, ptr addrspace(1) %param_5.688, align 8, !invariant.load !263
  %10 = select i1 %compare.1135.31, double %param_4.8416, double %param_5.6889
  %11 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.100910 = load double, ptr addrspace(1) %11, align 8, !invariant.load !263
  %multiply.2966.21 = fmul double %10, %param_3.100910
  %multiply.2967.13 = fmul double %param_6.5865, %multiply.2966.21
  %12 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.124311 = load double, ptr addrspace(1) %12, align 8, !invariant.load !263
  %multiply.2971.1 = fmul double %param_2.124311, %multiply.2967.13
  %13 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2971.1, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1487 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1487, 0
  %4 = add i64 %param_1.1487, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1487
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.12665 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %multiply.2972.3 = fmul double %param_2.12665, 2.000000e+00
  %multiply.2996.1 = fmul double %multiply.2972.3, %multiply.2972.3
  %divide.615.1 = fdiv double 1.000000e+00, %multiply.2996.1
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.615.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1462 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1462, 0
  %4 = add i64 %param_1.1462, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1462
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.12415 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %multiply.2972.7 = fmul double %param_2.12415, 2.000000e+00
  %divide.607.3 = fdiv double 1.000000e+00, %multiply.2972.7
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.607.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5) local_unnamed_addr #2 {
entry:
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1511 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1511, 0
  %4 = add i64 %param_1.1511, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1511
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12975 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.8666 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %10 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.7127 = load double, ptr addrspace(1) %10, align 8, !invariant.load !263
  %multiply.2958.9 = fmul double %param_4.8666, %param_5.7127
  %11 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.10458 = load double, ptr addrspace(1) %11, align 8, !invariant.load !263
  %add.4051.9 = fadd double %multiply.2958.9, %param_3.10458
  %subtract.224.1 = fsub double %param_2.12975, %add.4051.9
  %multiply.2994.3 = fmul double %subtract.224.1, 2.000000e+00
  %12 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2994.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5) local_unnamed_addr #2 {
entry:
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1503 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1503, 0
  %4 = add i64 %param_1.1503, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1503
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12825 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.8556 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %10 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.7007 = load double, ptr addrspace(1) %10, align 8, !invariant.load !263
  %multiply.2958.5 = fmul double %param_4.8556, %param_5.7007
  %11 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.10328 = load double, ptr addrspace(1) %11, align 8, !invariant.load !263
  %add.4051.5 = fadd double %multiply.2958.5, %param_3.10328
  %subtract.224.3 = fsub double %param_2.12825, %add.4051.5
  %multiply.2969.1 = fmul double %subtract.224.3, %subtract.224.3
  %12 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2969.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_43(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_3.1040 = load i64, ptr addrspace(1) %arg315, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_3.1040, 0
  %4 = add i64 %param_3.1040, 192
  %5 = select i1 %3, i64 %4, i64 %param_3.1040
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.14775 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %compare.1139.7 = fcmp ogt double %param_1.14775, 1.000000e-128
  %param_2.1256 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg213, i64 0, i64 %2
  %param_2.12568 = load double, ptr addrspace(1) %param_2.1256, align 8, !invariant.load !263
  %9 = select i1 %compare.1139.7, double %param_1.14775, double %param_2.12568
  %10 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5) local_unnamed_addr #2 {
entry:
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1499 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1499, 0
  %4 = add i64 %param_1.1499, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1499
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7105 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.10306 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %compare.1135.27 = fcmp ogt double %param_3.10306, 1.000000e-128
  %param_4.853 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg419, i64 0, i64 %2
  %param_4.8539 = load double, ptr addrspace(1) %param_4.853, align 8, !invariant.load !263
  %10 = select i1 %compare.1135.27, double %param_3.10306, double %param_4.8539
  %11 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.127810 = load double, ptr addrspace(1) %11, align 8, !invariant.load !263
  %multiply.2966.17 = fmul double %10, %param_2.127810
  %multiply.2967.9 = fmul double %param_5.7105, %multiply.2966.17
  %12 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2967.9, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5) local_unnamed_addr #2 {
entry:
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1512 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1512, 0
  %4 = add i64 %param_1.1512, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1512
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7135 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.10466 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %compare.1135.25 = fcmp ogt double %param_3.10466, 1.000000e-128
  %param_4.867 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg419, i64 0, i64 %2
  %param_4.8679 = load double, ptr addrspace(1) %param_4.867, align 8, !invariant.load !263
  %10 = select i1 %compare.1135.25, double %param_3.10466, double %param_4.8679
  %11 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.129810 = load double, ptr addrspace(1) %11, align 8, !invariant.load !263
  %multiply.2966.15 = fmul double %10, %param_2.129810
  %multiply.2967.7 = fmul double %param_5.7135, %multiply.2966.15
  %multiply.2998.3 = fmul double %multiply.2967.7, 2.000000e+00
  %12 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2998.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5) local_unnamed_addr #2 {
entry:
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1489 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1489, 0
  %4 = add i64 %param_1.1489, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1489
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7095 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.10256 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %compare.1135.29 = fcmp ogt double %param_3.10256, 1.000000e-128
  %param_4.850 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg419, i64 0, i64 %2
  %param_4.8509 = load double, ptr addrspace(1) %param_4.850, align 8, !invariant.load !263
  %10 = select i1 %compare.1135.29, double %param_3.10256, double %param_4.8509
  %11 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.126810 = load double, ptr addrspace(1) %11, align 8, !invariant.load !263
  %multiply.2966.19 = fmul double %10, %param_2.126810
  %multiply.2967.11 = fmul double %param_5.7095, %multiply.2966.19
  %multiply.2975.1 = fmul double %multiply.2967.11, %multiply.2967.11
  %12 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2975.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #2 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1474 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1474, 0
  %4 = add i64 %param_1.1474, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1474
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.10145 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %compare.1135.17 = fcmp ogt double %param_3.10145, 1.000000e-128
  %param_4.844 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg418, i64 0, i64 %2
  %param_4.8448 = load double, ptr addrspace(1) %param_4.844, align 8, !invariant.load !263
  %9 = select i1 %compare.1135.17, double %param_3.10145, double %param_4.8448
  %10 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.12539 = load double, ptr addrspace(1) %10, align 8, !invariant.load !263
  %multiply.2966.7 = fmul double %9, %param_2.12539
  %11 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2966.7, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5) local_unnamed_addr #2 {
entry:
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1478 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1478, 0
  %4 = add i64 %param_1.1478, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1478
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7145 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %multiply.2982.9 = fmul double %param_5.7145, %param_5.7145
  %multiply.2984.7 = fmul double %multiply.2982.9, 5.000000e-01
  %9 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.10176 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %compare.1135.19 = fcmp ogt double %param_3.10176, 1.000000e-128
  %param_4.846 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg419, i64 0, i64 %2
  %param_4.8469 = load double, ptr addrspace(1) %param_4.846, align 8, !invariant.load !263
  %10 = select i1 %compare.1135.19, double %param_3.10176, double %param_4.8469
  %11 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.125710 = load double, ptr addrspace(1) %11, align 8, !invariant.load !263
  %multiply.2966.9 = fmul double %10, %param_2.125710
  %multiply.2985.1 = fmul double %multiply.2984.7, %multiply.2966.9
  %12 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2985.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1519 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1519, 0
  %4 = add i64 %param_1.1519, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1519
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.13055 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg420, i64 %thread_id_x
  %param_4.8726 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %multiply.2962.4 = fmul double %param_4.8726, %param_4.8726
  %10 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.10509 = load double, ptr addrspace(1) %10, align 8, !invariant.load !263
  %subtract.222.27 = fsub double 1.000000e+00, %param_3.10509
  %multiply.2959.23 = fmul double %param_3.10509, %subtract.222.27
  %multiply.2963.5 = fmul double %multiply.2962.4, %multiply.2959.23
  %add.4056.3 = fadd double %param_2.13055, %multiply.2963.5
  %compare.1136.15 = fcmp ogt double %add.4056.3, 1.000000e-128
  %11 = select i1 %compare.1136.15, double %add.4056.3, double 0x7FF8000000000000
  %12 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %11, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3) local_unnamed_addr #2 {
entry:
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1476 = load i64, ptr addrspace(1) %arg120, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1476, 0
  %4 = add i64 %param_1.1476, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1476
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1015 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg324, i64 0, i64 %2, i64 %7, i64 0
  %param_3.101512 = load double, ptr addrspace(1) %param_3.1015, align 8, !invariant.load !263
  %8 = getelementptr double, ptr addrspace(1) %arg222, i64 %thread_id_x
  %param_2.125513 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %subtract.223.7 = fsub double %param_3.101512, %param_2.125513
  %subtract.222.19 = fsub double 1.000000e+00, %param_2.125513
  %multiply.2959.15 = fmul double %param_2.125513, %subtract.222.19
  %divide.603.3 = fdiv double %subtract.223.7, %multiply.2959.15
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg018, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.603.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1500 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1500, 0
  %4 = add i64 %param_1.1500, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1500
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12795 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %subtract.222.15 = fsub double 1.000000e+00, %param_2.12795
  %multiply.2959.11 = fmul double %param_2.12795, %subtract.222.15
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2959.11, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_30(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1459 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1459, 0
  %4 = add i64 %param_1.1459, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1459
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12385 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %subtract.222.13 = fsub double 1.000000e+00, %param_2.12385
  %multiply.2959.9 = fmul double %param_2.12385, %subtract.222.13
  %multiply.2992.1 = fmul double %multiply.2959.9, %multiply.2959.9
  %divide.613.1 = fdiv double 1.000000e+00, %multiply.2992.1
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.613.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4) local_unnamed_addr #2 {
entry:
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1483 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1483, 0
  %4 = add i64 %param_1.1483, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1483
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg320, i64 %thread_id_x
  %param_3.10545 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.13096 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %subtract.222.23 = fsub double 1.000000e+00, %param_2.13096
  %multiply.2959.19 = fmul double %param_2.13096, %subtract.222.23
  %multiply.2960.7 = fmul double %param_3.10545, %multiply.2959.19
  %10 = getelementptr double, ptr addrspace(1) %arg422, i64 %thread_id_x
  %param_4.8769 = load double, ptr addrspace(1) %10, align 8, !invariant.load !263
  %multiply.2962.16 = fmul double %param_3.10545, %param_3.10545
  %multiply.2963.17 = fmul double %multiply.2962.16, %multiply.2959.19
  %add.4056.15 = fadd double %param_4.8769, %multiply.2963.17
  %compare.1136.17 = fcmp ogt double %add.4056.15, 1.000000e-128
  %11 = select i1 %compare.1136.17, double %add.4056.15, double 0x7FF8000000000000
  %divide.602.3 = fdiv double %multiply.2960.7, %11
  %12 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg014, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.602.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1522 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1522, 0
  %4 = add i64 %param_1.1522, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1522
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.13085 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg420, i64 %thread_id_x
  %param_4.8756 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %multiply.2962.14 = fmul double %param_4.8756, %param_4.8756
  %10 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.10539 = load double, ptr addrspace(1) %10, align 8, !invariant.load !263
  %subtract.222.37 = fsub double 1.000000e+00, %param_3.10539
  %multiply.2959.33 = fmul double %param_3.10539, %subtract.222.37
  %multiply.2963.15 = fmul double %multiply.2962.14, %multiply.2959.33
  %add.4056.13 = fadd double %param_2.13085, %multiply.2963.15
  %compare.1136.13 = fcmp ogt double %add.4056.13, 1.000000e-128
  %11 = select i1 %compare.1136.13, double %add.4056.13, double 0x7FF8000000000000
  %multiply.2993.1 = fmul double %11, %11
  %divide.614.1 = fdiv double 1.000000e+00, %multiply.2993.1
  %12 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.614.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_31(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3) local_unnamed_addr #2 {
entry:
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1457 = load i64, ptr addrspace(1) %arg116, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1457, 0
  %4 = add i64 %param_1.1457, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1457
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_3.1005 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg320, i64 0, i64 %2, i64 %7, i64 0
  %param_3.100512 = load double, ptr addrspace(1) %param_3.1005, align 8, !invariant.load !263
  %8 = getelementptr double, ptr addrspace(1) %arg218, i64 %thread_id_x
  %param_2.123613 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %subtract.223.3 = fsub double %param_3.100512, %param_2.123613
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg014, i64 0, i64 %7, i64 %1, i64 %2
  store double %subtract.223.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_33(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2) local_unnamed_addr #2 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1502 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1502, 0
  %4 = add i64 %param_1.1502, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1502
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.12815 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %subtract.222.3 = fsub double 1.000000e+00, %param_2.12815
  %9 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg06, i64 0, i64 %7, i64 %1, i64 %2
  store double %subtract.222.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3) local_unnamed_addr #2 {
entry:
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %thread_id_x = zext nneg i32 %0 to i64
  %1 = lshr i64 %thread_id_x, 2
  %2 = and i64 %thread_id_x, 3
  %param_1.1479 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !263
  %3 = icmp slt i64 %param_1.1479, 0
  %4 = add i64 %param_1.1479, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1479
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12585 = load double, ptr addrspace(1) %8, align 8, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.10186 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  %subtract.222.17 = fsub double 1.000000e+00, %param_3.10186
  %multiply.2959.13 = fmul double %param_3.10186, %subtract.222.17
  %multiply.2960.3 = fmul double %param_2.12585, %multiply.2959.13
  %10 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
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
define void @loop_subtract_fusion(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg3) local_unnamed_addr #2 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !273
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !263
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
  %49 = and i32 %2, 3
  %50 = lshr i32 %48, 3
  %add.4201.3 = fadd double %z.2.i, 1.000000e+00
  %divide.617.2 = fdiv double 1.000000e+00, %add.4201.3
  %subtract.226.2 = fsub double 1.000000e+00, %divide.617.2
  %51 = zext nneg i32 %50 to i64
  %52 = zext nneg i32 %49 to i64
  %53 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg01, i64 0, i64 %51, i64 %52
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !263
  %multiply.3032.3 = fmul double %54, %subtract.226.2
  %55 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg25, i64 0, i64 %51, i64 %52
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !263
  %multiply.3033.3 = fmul double %divide.617.2, %56
  %subtract.227.1 = fsub double %multiply.3032.3, %multiply.3033.3
  %57 = getelementptr double, ptr addrspace(1) %arg37, i64 %3
  store double %subtract.227.1, ptr addrspace(1) %57, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_exponential_fusion(ptr noalias nocapture readonly align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(24576) %arg3) local_unnamed_addr #2 {
entry:
  %arg345 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg243 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg141 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg039 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !275
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = and i32 %1, 3
  %4 = lshr i32 %1, 2
  %5 = and i32 %4, 1
  %6 = lshr i32 %linear_index, 3
  %.lhs.trunc = trunc nuw nsw i32 %6 to i16
  %7 = urem i16 %.lhs.trunc, 192
  %8 = icmp ugt i32 %0, 11
  %9 = zext nneg i32 %5 to i64
  %10 = zext nneg i32 %3 to i64
  br i1 %8, label %in_bounds-true, label %entry.in_bounds-after_crit_edge

entry.in_bounds-after_crit_edge:                  ; preds = %entry
  %.pre37 = zext nneg i16 %7 to i64
  %.phi.trans.insert = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg243, i64 0, i64 %9, i64 %10
  %.pre = load double, ptr addrspace(1) %.phi.trans.insert, align 8, !invariant.load !263
  %.phi.trans.insert47 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg141, i64 0, i64 %.pre37, i64 %9, i64 %10
  %.pre48 = load double, ptr addrspace(1) %.phi.trans.insert47, align 8, !invariant.load !263
  %.phi.trans.insert49 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg039, i64 0, i64 %9, i64 %10
  %.pre50 = load double, ptr addrspace(1) %.phi.trans.insert49, align 8, !invariant.load !263
  %.pre51 = fmul double %.pre, %.pre48
  %.pre52 = fadd double %.pre51, %.pre50
  br label %in_bounds-after

in_bounds-after:                                  ; preds = %entry.in_bounds-after_crit_edge, %in_bounds-true
  %add.4202.329.1.pre-phi = phi double [ %.pre52, %entry.in_bounds-after_crit_edge ], [ %add.4202.3, %in_bounds-true ]
  %pad_result_addr.0 = phi double [ 0.000000e+00, %entry.in_bounds-after_crit_edge ], [ %add.4202.3, %in_bounds-true ]
  %11 = fcmp ole double %add.4202.329.1.pre-phi, 0.000000e+00
  %maximum.40.i.1 = select i1 %11, double 0.000000e+00, double %add.4202.329.1.pre-phi
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
  %51 = getelementptr double, ptr addrspace(1) %arg345, i64 %50
  store double %z.2.i, ptr addrspace(1) %51, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  %52 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg243, i64 0, i64 %9, i64 %10
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !263
  %54 = zext nneg i16 %7 to i64
  %55 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg141, i64 0, i64 %54, i64 %9, i64 %10
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !263
  %multiply.3034.5 = fmul double %53, %56
  %57 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg039, i64 0, i64 %9, i64 %10
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !263
  %add.4202.3 = fadd double %multiply.3034.5, %58
  br label %in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !264
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1536
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
define void @input_scatter_fusion_2(ptr noalias nocapture align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg1) local_unnamed_addr #7 {
entry:
  %arg130 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg028 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !269
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %param_1.333119 = getelementptr inbounds [4 x [192 x [1 x [1 x i32]]]], ptr addrspace(1) %arg130, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %param_1.333120 = load i32, ptr addrspace(1) %param_1.333119, align 4, !invariant.load !263
  %7 = icmp ult i32 %param_1.333120, 2
  %8 = zext nneg i32 %param_1.333120 to i64
  %9 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr addrspace(1) %arg028, i64 0, i64 %5, i64 %6, i64 %8
  br i1 %7, label %scatter.in_bounds-true, label %scatter.13.1.in_bounds-after

scatter.13.1.in_bounds-after:                     ; preds = %entry, %scatter.in_bounds-true
  ret void

scatter.in_bounds-true:                           ; preds = %entry
  %10 = atomicrmw fadd ptr addrspace(1) %9, double 1.000000e+00 seq_cst, align 8
  br label %scatter.13.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(24576) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg8) local_unnamed_addr #2 {
entry:
  %arg8140 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7138 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6136 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5134 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4132 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3130 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2128 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1126 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0124 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !273
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = and i32 %1, 3
  %4 = lshr i32 %1, 2
  %5 = lshr i32 %linear_index, 3
  %6 = zext nneg i32 %3 to i64
  %7 = zext nneg i32 %5 to i64
  %8 = getelementptr [4 x [192 x [2 x double]]], ptr addrspace(1) %arg1126, i64 0, i64 %6, i64 %7, i64 0
  %9 = load <2 x double>, ptr addrspace(1) %8, align 16, !invariant.load !263
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  %12 = and i32 %4, 1
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [2 x [192 x [2 x [4 x double]]]], ptr addrspace(1) %arg0124, i64 0, i64 0, i64 %7, i64 %13, i64 %6
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !263
  %16 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 12288
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !263
  %18 = lshr i32 %linear_index, 1
  %.lhs.trunc = trunc nuw nsw i32 %18 to i16
  %19 = urem i16 %.lhs.trunc, 192
  %.zext = zext nneg i16 %19 to i32
  %.lhs.trunc118 = trunc nuw nsw i32 %0 to i8
  %20 = udiv i8 %.lhs.trunc118, 3
  %.zext119 = zext nneg i8 %20 to i32
  %21 = zext nneg i8 %20 to i64
  %22 = zext nneg i16 %19 to i64
  %23 = getelementptr inbounds [4 x [192 x [1 x [1 x i32]]]], ptr addrspace(1) %arg6136, i64 0, i64 %21, i64 %22, i64 0, i64 0
  %24 = load <2 x i64>, ptr addrspace(1) %arg5134, align 128, !invariant.load !263
  %25 = extractelement <2 x i64> %24, i32 0
  %26 = extractelement <2 x i64> %24, i32 1
  %27 = load i32, ptr addrspace(1) %23, align 4, !invariant.load !263
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, ptr addrspace(1) %arg5134, i64 16
  %30 = load i64, ptr addrspace(1) %29, align 16, !invariant.load !263
  %31 = and i32 %1, 1
  %32 = mul nuw nsw i32 %.zext119, 192
  %33 = add nuw nsw i32 %32, %.zext
  %.lhs.trunc120 = trunc nuw nsw i32 %33 to i16
  %34 = udiv i16 %.lhs.trunc120, 192
  %.zext121 = zext nneg i16 %34 to i64
  %35 = icmp ugt i32 %33, 575
  %narrow = select i1 %35, i64 3, i64 %.zext121
  %36 = urem i16 %.lhs.trunc120, 192
  %37 = zext nneg i16 %36 to i64
  %38 = getelementptr inbounds [4 x [192 x [1 x [1 x i32]]]], ptr addrspace(1) %arg6136, i64 0, i64 %.zext121, i64 %37, i64 0, i64 0
  %39 = load i32, ptr addrspace(1) %38, align 4, !invariant.load !263
  %40 = icmp sgt i32 %39, 0
  %41 = zext nneg i32 %31 to i64
  br i1 %40, label %in_bounds-true, label %entry.in_bounds-after_crit_edge

entry.in_bounds-after_crit_edge:                  ; preds = %entry
  %.phi.trans.insert = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg4132, i64 0, i64 %41, i64 %narrow
  %.pre = load double, ptr addrspace(1) %.phi.trans.insert, align 8, !invariant.load !263
  %.phi.trans.insert142 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg3130, i64 0, i64 %37, i64 %41, i64 %narrow
  %.pre143 = load double, ptr addrspace(1) %.phi.trans.insert142, align 8, !invariant.load !263
  %.phi.trans.insert144 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg2128, i64 0, i64 %41, i64 %narrow
  %.pre145 = load double, ptr addrspace(1) %.phi.trans.insert144, align 8, !invariant.load !263
  br label %in_bounds-after

in_bounds-after:                                  ; preds = %entry.in_bounds-after_crit_edge, %in_bounds-true
  %42 = phi double [ %129, %in_bounds-true ], [ %.pre145, %entry.in_bounds-after_crit_edge ]
  %43 = phi double [ %127, %in_bounds-true ], [ %.pre143, %entry.in_bounds-after_crit_edge ]
  %44 = phi double [ %125, %in_bounds-true ], [ %.pre, %entry.in_bounds-after_crit_edge ]
  %pad_result_addr.0 = phi double [ %add.4202.5.clone.1, %in_bounds-true ], [ 0.000000e+00, %entry.in_bounds-after_crit_edge ]
  %45 = getelementptr inbounds [2 x [192 x [2 x [4 x double]]]], ptr addrspace(1) %arg0124, i64 0, i64 0, i64 %37, i64 %41, i64 %narrow
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !263
  %add.3969.i101 = fadd double %46, 0.000000e+00
  %47 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 12288
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !263
  %add.3969.i101.1 = fadd double %add.3969.i101, %48
  %49 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3969.i101.1) #12
  %50 = tail call i32 @llvm.nvvm.d2i.lo(double %add.3969.i101.1) #12
  %51 = icmp slt i32 %49, 1048576
  %52 = fmul double %add.3969.i101.1, 0x4350000000000000
  %53 = tail call i32 @llvm.nvvm.d2i.lo(double %52) #12
  %54 = tail call i32 @llvm.nvvm.d2i.hi(double %52) #12
  br i1 %51, label %55, label %56

55:                                               ; preds = %in_bounds-after
  br label %56

56:                                               ; preds = %55, %in_bounds-after
  %.0.i = phi double [ %52, %55 ], [ %add.3969.i101.1, %in_bounds-after ]
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
  %spec.select102 = add nsw i32 %60, %69
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
  %94 = xor i32 %spec.select102, -2147483648
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
  %110 = trunc i64 %28 to i32
  %multiply.3034.7.clone.172.1 = fmul double %44, %43
  %add.4202.5.clone.173.1 = fadd double %multiply.3034.7.clone.172.1, %42
  %111 = fcmp ole double %add.4202.5.clone.173.1, 0.000000e+00
  %maximum.40.i.1 = select i1 %111, double 0.000000e+00, double %add.4202.5.clone.173.1
  %add.3969.i = fadd double %10, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %11
  %add.3969.i100 = fadd double %15, 0.000000e+00
  %add.3969.i100.1 = fadd double %add.3969.i100, %17
  %112 = icmp sgt i32 %110, -1
  %113 = icmp sge i64 %30, %28
  %114 = and i1 %112, %113
  %115 = icmp sge i64 %25, %21
  %116 = icmp sge i64 %26, %22
  %117 = select i1 %114, i1 %116, i1 false
  %118 = select i1 %117, i1 %115, i1 false
  %subtract.228.9.clone.1 = fsub double %pad_result_addr.0, %maximum.40.i.1
  %119 = fneg double %add.3969.i.1
  %divide.618.3 = fdiv double %119, %add.3969.i100.1
  %multiply.3035.1 = fmul double %divide.618.3, %17
  %add.4204.1 = fadd double %11, %multiply.3035.1
  %subtract.229.5.clone.1 = fsub double %subtract.228.9.clone.1, %q.1.i
  %120 = select i1 %118, double %subtract.229.5.clone.1, double 0x7FF8000000000000
  %121 = zext nneg i32 %linear_index to i64
  %122 = getelementptr double, ptr addrspace(1) %arg7138, i64 %121
  store double %add.4204.1, ptr addrspace(1) %122, align 8
  %123 = getelementptr double, ptr addrspace(1) %arg8140, i64 %121
  store double %120, ptr addrspace(1) %123, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  %124 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg4132, i64 0, i64 %41, i64 %narrow
  %125 = load double, ptr addrspace(1) %124, align 8, !invariant.load !263
  %126 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg3130, i64 0, i64 %37, i64 %41, i64 %narrow
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !263
  %multiply.3034.7.clone.1 = fmul double %125, %127
  %128 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg2128, i64 0, i64 %41, i64 %narrow
  %129 = load double, ptr addrspace(1) %128, align 8, !invariant.load !263
  %add.4202.5.clone.1 = fadd double %multiply.3034.7.clone.1, %129
  br label %in_bounds-after
}

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg8) local_unnamed_addr #8 {
entry:
  %arg861 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg759 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg657 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg555 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg453 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg351 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg249 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg147 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg045 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = and i32 %thread.id.x, 3
  %2 = lshr i32 %thread.id.2, 2
  %3 = zext i32 %2 to i64
  %4 = zext i32 %1 to i64
  %param_6.2217 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg657, i64 0, i64 %3, i64 %4
  %5 = add nuw nsw i32 %0, -32
  %6 = shl nuw nsw i64 %4, 3
  %7 = zext nneg i32 %thread.id.x to i64
  %8 = lshr i64 %7, 5
  %9 = shl nuw nsw i64 %8, 6
  %10 = shl nuw nsw i64 %3, 5
  %11 = add i64 %9, %10
  %scevgep = getelementptr i8, ptr addrspace(1) %arg147, i64 %11
  %scevgep66 = getelementptr i8, ptr addrspace(1) %arg045, i64 %11
  %12 = shl nuw nsw i64 %8, 5
  %scevgep70 = getelementptr i8, ptr addrspace(1) %arg555, i64 %12
  %scevgep74 = getelementptr i8, ptr addrspace(1) %arg453, i64 %12
  %scevgep78 = getelementptr i8, ptr addrspace(1) %arg351, i64 %11
  %scevgep82 = getelementptr i8, ptr addrspace(1) %arg249, i64 %11
  %scevgep86 = getelementptr i8, ptr addrspace(1) %arg861, i64 %11
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv87 = phi ptr addrspace(1) [ %scevgep86, %entry ], [ %scevgep88, %x_in_tile-after ]
  %lsr.iv83 = phi ptr addrspace(1) [ %scevgep82, %entry ], [ %scevgep84, %x_in_tile-after ]
  %lsr.iv79 = phi ptr addrspace(1) [ %scevgep78, %entry ], [ %scevgep80, %x_in_tile-after ]
  %lsr.iv75 = phi ptr addrspace(1) [ %scevgep74, %entry ], [ %scevgep76, %x_in_tile-after ]
  %lsr.iv71 = phi ptr addrspace(1) [ %scevgep70, %entry ], [ %scevgep72, %x_in_tile-after ]
  %lsr.iv67 = phi ptr addrspace(1) [ %scevgep66, %entry ], [ %scevgep68, %x_in_tile-after ]
  %lsr.iv63 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep64, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %5, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.043 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %13 = icmp ult i32 %thread.id.2, 8
  br i1 %13, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %__nv_exp.exit, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3969.i42, %__nv_exp.exit ], [ %partial_reduction_result.043, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep64 = getelementptr i8, ptr addrspace(1) %lsr.iv63, i64 2048
  %scevgep68 = getelementptr i8, ptr addrspace(1) %lsr.iv67, i64 2048
  %scevgep72 = getelementptr i8, ptr addrspace(1) %lsr.iv71, i64 1024
  %scevgep76 = getelementptr i8, ptr addrspace(1) %lsr.iv75, i64 1024
  %scevgep80 = getelementptr i8, ptr addrspace(1) %lsr.iv79, i64 2048
  %scevgep84 = getelementptr i8, ptr addrspace(1) %lsr.iv83, i64 2048
  %scevgep88 = getelementptr i8, ptr addrspace(1) %lsr.iv87, i64 2048
  %14 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %14, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !276

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %15 = zext nneg i32 %thread.id.2 to i64
  %16 = zext nneg i32 %0 to i64
  %17 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %15, i64 %16
  store double %partial_reduction_result.1, ptr addrspace(3) %17, align 8
  tail call void @llvm.nvvm.barrier0()
  %18 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %16, i64 %15
  %partial_reduction_result173233 = load <2 x i32>, ptr addrspace(3) %18, align 8
  %19 = extractelement <2 x i32> %partial_reduction_result173233, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 16, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %partial_reduction_result173233, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 16, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %26 = bitcast <2 x i32> %partial_reduction_result173233 to double
  %add.3969.i = fadd double %26, %25
  %27 = bitcast double %add.3969.i to <2 x i32>
  %28 = extractelement <2 x i32> %27, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 8, i32 31)
  %30 = insertelement <2 x i32> poison, i32 %29, i64 0
  %31 = extractelement <2 x i32> %27, i64 1
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %add.3969.i38 = fadd double %add.3969.i, %34
  %35 = bitcast double %add.3969.i38 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 4, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.3969.i39 = fadd double %add.3969.i38, %42
  %43 = bitcast double %add.3969.i39 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 2, i32 31)
  %46 = insertelement <2 x i32> poison, i32 %45, i64 0
  %47 = extractelement <2 x i32> %43, i64 1
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> %46, i32 %48, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.3969.i40 = fadd double %add.3969.i39, %50
  %51 = bitcast double %add.3969.i40 to <2 x i32>
  %52 = extractelement <2 x i32> %51, i64 0
  %53 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %52, i32 1, i32 31)
  %54 = insertelement <2 x i32> poison, i32 %53, i64 0
  %55 = extractelement <2 x i32> %51, i64 1
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 1, i32 31)
  %57 = insertelement <2 x i32> %54, i32 %56, i64 1
  %58 = bitcast <2 x i32> %57 to double
  %add.3969.i41 = fadd double %add.3969.i40, %58
  store double %add.3969.i41, ptr addrspace(3) %18, align 8
  %59 = and i32 %thread.id.x, 799
  %60 = icmp eq i32 %59, 0
  %61 = lshr i32 %thread.id.x, 7
  %62 = zext nneg i32 %61 to i64
  %63 = and i32 %0, 3
  %64 = zext nneg i32 %63 to i64
  %output_element_address = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg759, i64 0, i64 %62, i64 %64
  br i1 %60, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %scevgep65 = getelementptr i8, ptr addrspace(1) %lsr.iv63, i64 %6
  %param_1.33372 = load double, ptr addrspace(1) %scevgep65, align 8, !invariant.load !263
  %scevgep69 = getelementptr i8, ptr addrspace(1) %lsr.iv67, i64 %6
  %param_0.23533 = load double, ptr addrspace(1) %scevgep69, align 8, !invariant.load !263
  %multiply.3048.3 = fmul double %param_1.33372, %param_0.23533
  %add.3969.i42 = fadd double %partial_reduction_result.043, %multiply.3048.3
  %param_6.22174 = load double, ptr addrspace(1) %param_6.2217, align 8, !invariant.load !263
  %multiply.3038.3.clone.1 = fmul double %param_1.33372, %param_6.22174
  %scevgep73 = getelementptr i8, ptr addrspace(1) %lsr.iv71, i64 %6
  %param_5.28317 = load double, ptr addrspace(1) %scevgep73, align 8, !invariant.load !263
  %scevgep77 = getelementptr i8, ptr addrspace(1) %lsr.iv75, i64 %6
  %param_4.35508 = load double, ptr addrspace(1) %scevgep77, align 8, !invariant.load !263
  %65 = fneg double %multiply.3038.3.clone.1
  %66 = fmul double %param_4.35508, %65
  %67 = fmul double %multiply.3038.3.clone.1, %param_5.28317
  %add.4208.7.clone.1 = fsub double %66, %67
  %scevgep81 = getelementptr i8, ptr addrspace(1) %lsr.iv79, i64 %6
  %param_3.47069 = load double, ptr addrspace(1) %scevgep81, align 8, !invariant.load !263
  %68 = fcmp ole double %param_3.47069, -3.000000e+01
  %69 = select i1 %68, double -3.000000e+01, double %param_3.47069
  %70 = fcmp oge double %69, 3.000000e+01
  %71 = select i1 %70, double 3.000000e+01, double %69
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
  br i1 %97, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %98 = fcmp ogt double %71, 0.000000e+00
  %99 = fsub double 0x7FF0000000000000, %71
  %z.0.i = select i1 %98, double 0.000000e+00, double %99
  %100 = fcmp olt float %96, 0x4010E90000000000
  br i1 %100, label %101, label %__nv_exp.exit

101:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %102 = sdiv i32 %74, 2
  %103 = shl i32 %102, 20
  %104 = add i32 %90, %103
  %105 = tail call double @llvm.nvvm.lohi.i2d(i32 %89, i32 %104) #12
  %106 = sub nsw i32 %74, %102
  %107 = shl i32 %106, 20
  %108 = add nsw i32 %107, 1072693248
  %109 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %108) #12
  %110 = fmul double %109, %105
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %101
  %z.2.i = phi double [ %93, %x_in_tile-true ], [ %110, %101 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.4201.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.617.3.clone.1 = fdiv double 1.000000e+00, %add.4201.1.clone.1
  %subtract.226.1.clone.1 = fsub double 1.000000e+00, %divide.617.3.clone.1
  %multiply.3041.1.clone.1 = fmul double %divide.617.3.clone.1, %subtract.226.1.clone.1
  %multiply.3042.5.clone.1 = fmul double %add.4208.7.clone.1, %multiply.3041.1.clone.1
  %compare.1151.1.clone.1 = fcmp oeq double %69, %71
  %scevgep85 = getelementptr i8, ptr addrspace(1) %lsr.iv83, i64 %6
  %param_2.580012 = load double, ptr addrspace(1) %scevgep85, align 8, !invariant.load !263
  %111 = select i1 %compare.1151.1.clone.1, double 1.000000e+00, double %param_2.580012
  %compare.1152.1.clone.1 = fcmp oeq double %71, 3.000000e+01
  %112 = select i1 %compare.1152.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.619.5.clone.1 = fdiv double %111, %112
  %multiply.3044.3.clone.1 = fmul double %divide.619.5.clone.1, %multiply.3042.5.clone.1
  %compare.1153.1.clone.1 = fcmp oeq double %param_3.47069, %69
  %113 = select i1 %compare.1153.1.clone.1, double 1.000000e+00, double %param_2.580012
  %compare.1154.1.clone.1 = fcmp oeq double %69, -3.000000e+01
  %114 = select i1 %compare.1154.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.620.3.clone.1 = fdiv double %113, %114
  %multiply.3045.1.clone.1 = fmul double %divide.620.3.clone.1, %multiply.3044.3.clone.1
  %scevgep89 = getelementptr i8, ptr addrspace(1) %lsr.iv87, i64 %6
  store double %multiply.3045.1.clone.1, ptr addrspace(1) %scevgep89, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3969.i41, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #9

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
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
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !263
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !263
  store double %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !263
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load i32, ptr addrspace(1) %9, align 4, !invariant.load !263
  store i32 %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = and i32 %0, 3
  %3 = load i64, ptr addrspace(1) %arg15, align 128, !invariant.load !263
  %4 = sub i64 191, %3
  %5 = icmp slt i64 %4, 0
  %6 = sub i64 383, %3
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc i64 %7 to i32
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 191)
  %11 = zext nneg i32 %10 to i64
  %12 = zext nneg i32 %1 to i64
  %13 = zext nneg i32 %2 to i64
  %14 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg03, i64 0, i64 %11, i64 %12, i64 %13
  %15 = load i8, ptr addrspace(1) %14, align 1, !invariant.load !263
  %16 = zext nneg i32 %0 to i64
  %17 = getelementptr i8, ptr addrspace(1) %arg27, i64 %16
  store i8 %15, ptr addrspace(1) %17, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg2) local_unnamed_addr #2 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = and i32 %0, 3
  %3 = load i64, ptr addrspace(1) %arg15, align 128, !invariant.load !263
  %4 = sub i64 191, %3
  %5 = icmp slt i64 %4, 0
  %6 = sub i64 383, %3
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc i64 %7 to i32
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 191)
  %11 = zext nneg i32 %10 to i64
  %12 = zext nneg i32 %1 to i64
  %13 = zext nneg i32 %2 to i64
  %14 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg03, i64 0, i64 %11, i64 %12, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !263
  %16 = zext nneg i32 %0 to i64
  %17 = getelementptr double, ptr addrspace(1) %arg27, i64 %16
  store double %15, ptr addrspace(1) %17, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg28) local_unnamed_addr #2 {
entry:
  %arg2887 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2785 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2683 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2581 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2479 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2377 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2275 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2173 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2071 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1969 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1867 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1765 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1663 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1561 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1459 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1357 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1255 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1153 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1051 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg949 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg847 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg745 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg643 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg541 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg439 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg337 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg235 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg133 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg031 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = and i32 %0, 3
  %3 = load i64, ptr addrspace(1) %arg847, align 128, !invariant.load !263
  %4 = sub i64 191, %3
  %5 = icmp slt i64 %4, 0
  %6 = sub i64 383, %3
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc i64 %7 to i32
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 191)
  %11 = zext nneg i32 %10 to i64
  %12 = zext nneg i32 %1 to i64
  %13 = zext nneg i32 %2 to i64
  %14 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg439, i64 0, i64 %11, i64 %12, i64 %13
  %15 = load i8, ptr addrspace(1) %14, align 1, !invariant.load !263
  %16 = zext nneg i32 %0 to i64
  %17 = getelementptr double, ptr addrspace(1) %arg031, i64 %16
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !263
  %19 = trunc i8 %15 to i1
  %20 = select i1 %19, double %18, double 0.000000e+00
  %21 = getelementptr double, ptr addrspace(1) %arg2173, i64 %16
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !263
  %23 = select i1 %19, double %22, double 0.000000e+00
  %24 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg2071, i64 0, i64 %11, i64 %12, i64 %13
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !263
  %26 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg1969, i64 0, i64 %11, i64 %12, i64 %13
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !263
  %28 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg1867, i64 0, i64 %11, i64 %12, i64 %13
  %29 = load i8, ptr addrspace(1) %28, align 1, !invariant.load !263
  %30 = getelementptr inbounds [192 x [2 x [4 x i32]]], ptr addrspace(1) %arg1765, i64 0, i64 %11, i64 %12, i64 %13
  %31 = load i32, ptr addrspace(1) %30, align 4, !invariant.load !263
  %32 = icmp eq i32 %31, 1
  %33 = getelementptr double, ptr addrspace(1) %arg1663, i64 %16
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !263
  %35 = trunc i8 %29 to i1
  %36 = select i1 %35, i1 %32, i1 false
  %37 = select i1 %36, i1 %19, i1 false
  %38 = select i1 %37, double %34, double 0.000000e+00
  %39 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg1255, i64 0, i64 %11, i64 %12, i64 %13
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !263
  %multiply.2896.11 = fmul double %40, %38
  %41 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg1561, i64 0, i64 %11, i64 %12, i64 %13
  %42 = load double, ptr addrspace(1) %41, align 8, !invariant.load !263
  %multiply.2898.7 = fmul double %42, %multiply.2896.11
  %43 = fmul double %27, %multiply.2896.11
  %add.3976.9 = fsub double %multiply.2898.7, %43
  %44 = trunc i8 %25 to i1
  %45 = select i1 %44, double %add.3976.9, double 0.000000e+00
  %46 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg1459, i64 0, i64 %11, i64 %12, i64 %13
  %47 = load double, ptr addrspace(1) %46, align 8, !invariant.load !263
  %48 = getelementptr double, ptr addrspace(1) %arg1357, i64 %16
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !263
  %50 = select i1 %19, double %49, double 0.000000e+00
  %multiply.2899.17 = fmul double %40, %50
  %51 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg1153, i64 0, i64 %11, i64 %12, i64 %13
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !263
  %multiply.2900.13 = fmul double %52, %multiply.2899.17
  %multiply.2901.7 = fmul double %47, %multiply.2900.13
  %add.3977.7 = fadd double %45, %multiply.2901.7
  %add.3978.5 = fadd double %23, %add.3977.7
  %53 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg337, i64 0, i64 %11, i64 %12, i64 %13
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !263
  %55 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg235, i64 0, i64 %11, i64 %12, i64 %13
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !263
  %57 = fneg double %add.3978.5
  %58 = fmul double %54, %57
  %59 = fmul double %56, %58
  %add.3979.3 = fadd double %20, %59
  %60 = getelementptr double, ptr addrspace(1) %arg643, i64 %16
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !263
  %62 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg745, i64 0, i64 %11, i64 %12, i64 %13
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !263
  %add.3975.9 = fadd double %61, %63
  %64 = select i1 %19, double %add.3975.9, double 0.000000e+00
  %65 = getelementptr double, ptr addrspace(1) %arg1051, i64 %16
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !263
  %67 = select i1 %19, double %66, double 0.000000e+00
  %multiply.2904.9 = fmul double %56, %add.3978.5
  %68 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg949, i64 0, i64 %11, i64 %12, i64 %13
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !263
  %multiply.2905.7 = fmul double %multiply.2904.9, %69
  %add.3980.5 = fadd double %67, %multiply.2905.7
  %add.3981.5 = fadd double %64, %add.3980.5
  %70 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg541, i64 0, i64 %11, i64 %12, i64 %13
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !263
  %72 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg133, i64 0, i64 %11, i64 %12, i64 %13
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !263
  %74 = fneg double %add.3981.5
  %75 = fmul double %71, %74
  %76 = fmul double %54, %75
  %77 = fmul double %73, %76
  %add.3982.1 = fadd double %add.3979.3, %77
  %78 = getelementptr double, ptr addrspace(1) %arg2275, i64 %16
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !263
  %80 = select i1 %19, double 0.000000e+00, double %79
  %81 = getelementptr double, ptr addrspace(1) %arg2377, i64 %16
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !263
  %83 = select i1 %19, double 0.000000e+00, double %82
  %84 = getelementptr double, ptr addrspace(1) %arg2479, i64 %16
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !263
  %86 = select i1 %19, double 0.000000e+00, double %85
  %87 = getelementptr double, ptr addrspace(1) %arg2581, i64 %16
  store double %add.3982.1, ptr addrspace(1) %87, align 8
  %88 = getelementptr double, ptr addrspace(1) %arg2683, i64 %16
  store double %80, ptr addrspace(1) %88, align 8
  %89 = getelementptr double, ptr addrspace(1) %arg2785, i64 %16
  store double %83, ptr addrspace(1) %89, align 8
  %90 = getelementptr double, ptr addrspace(1) %arg2887, i64 %16
  store double %86, ptr addrspace(1) %90, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !270
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !270
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !263
  %4 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !263
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !263
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !263
  %9 = fneg double %6
  %10 = fmul double %8, %9
  %multiply.2891.1.clone.1 = fmul double %4, %10
  %multiply.2892.1.clone.1 = fmul double %8, %multiply.2891.1.clone.1
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
define void @loop_broadcast_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !263
  %4 = getelementptr i8, ptr addrspace(1) %arg25, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !263
  %6 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !263
  %8 = trunc i8 %5 to i1
  %9 = select i1 %8, double %7, double 0.000000e+00
  %10 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !263
  %multiply.2894.1 = fmul double %9, %10
  %multiply.2895.1 = fmul double %3, %multiply.2894.1
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.2895.1, ptr addrspace(1) %11, align 8
  %12 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %9, ptr addrspace(1) %12, align 8
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion(ptr noalias nocapture align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg8, ptr noalias nocapture align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg13, ptr noalias nocapture align 128 dereferenceable(64) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg18, ptr noalias nocapture align 128 dereferenceable(64) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg22, ptr noalias nocapture align 128 dereferenceable(64) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg24, ptr noalias nocapture align 128 dereferenceable(64) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg26, ptr noalias nocapture align 128 dereferenceable(64) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg35, ptr noalias nocapture align 128 dereferenceable(64) %arg36, ptr noalias nocapture align 128 dereferenceable(64) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg38, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg41, ptr noalias nocapture align 128 dereferenceable(64) %arg42, ptr noalias nocapture readnone align 128 dereferenceable(1536) %arg43, ptr noalias nocapture align 128 dereferenceable(64) %arg44, ptr noalias nocapture align 128 dereferenceable(64) %arg45, ptr noalias nocapture align 128 dereferenceable(64) %arg46, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg48, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg50, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg54, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg55, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg56, ptr noalias nocapture align 128 dereferenceable(64) %arg57, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg58, ptr noalias nocapture align 128 dereferenceable(64) %arg59, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg60, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg61, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg62, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg63, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg64, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg65, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg66, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg67, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg68, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg69, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg70, ptr noalias nocapture align 128 dereferenceable(64) %arg71, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg72, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg73, ptr noalias nocapture align 128 dereferenceable(64) %arg74, ptr noalias nocapture align 128 dereferenceable(64) %arg75, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg76) local_unnamed_addr #2 {
entry:
  %arg76250 = addrspacecast ptr %arg76 to ptr addrspace(1)
  %arg75248 = addrspacecast ptr %arg75 to ptr addrspace(1)
  %arg74246 = addrspacecast ptr %arg74 to ptr addrspace(1)
  %arg73244 = addrspacecast ptr %arg73 to ptr addrspace(1)
  %arg72242 = addrspacecast ptr %arg72 to ptr addrspace(1)
  %arg71240 = addrspacecast ptr %arg71 to ptr addrspace(1)
  %arg70238 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69236 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68234 = addrspacecast ptr %arg68 to ptr addrspace(1)
  %arg67232 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66230 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg65228 = addrspacecast ptr %arg65 to ptr addrspace(1)
  %arg64226 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63224 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62222 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61220 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60218 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59216 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58214 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57212 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56210 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55208 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54206 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53204 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52202 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51200 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50198 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49196 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48194 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47192 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46190 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45188 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44186 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg42182 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41180 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40178 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39176 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38174 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37172 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36170 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35168 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34166 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33164 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32162 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31160 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30158 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29156 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28154 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27152 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26150 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25148 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24146 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23144 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22142 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21140 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20138 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19136 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18134 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17132 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16130 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15128 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14126 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13124 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12122 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11120 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10118 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9116 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8114 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7112 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6110 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5108 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4106 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3104 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2102 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1100 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg098 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = and i32 %0, 3
  %2 = lshr i32 %0, 2
  %3 = load i64, ptr addrspace(1) %arg2102, align 128, !invariant.load !263
  %4 = sub i64 191, %3
  %5 = icmp slt i64 %4, 0
  %6 = sub i64 383, %3
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc i64 %7 to i32
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 191)
  %11 = zext nneg i32 %10 to i64
  %12 = zext nneg i32 %2 to i64
  %13 = zext nneg i32 %1 to i64
  %14 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg1100, i64 0, i64 %11, i64 %12, i64 %13
  %15 = load i8, ptr addrspace(1) %14, align 1, !invariant.load !263
  %16 = zext nneg i32 %0 to i64
  %17 = getelementptr double, ptr addrspace(1) %arg098, i64 %16
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = trunc i8 %15 to i1
  %20 = select i1 %19, double 0.000000e+00, double %18
  %21 = getelementptr double, ptr addrspace(1) %arg9116, i64 %16
  %22 = load double, ptr addrspace(1) %21, align 8
  %23 = select i1 %19, double 0.000000e+00, double %22
  %24 = getelementptr double, ptr addrspace(1) %arg4106, i64 %16
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !263
  %26 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg21140, i64 0, i64 %11, i64 %12, i64 %13
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !263
  %28 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg20138, i64 0, i64 %11, i64 %12, i64 %13
  %29 = load i8, ptr addrspace(1) %28, align 1, !invariant.load !263
  %30 = getelementptr double, ptr addrspace(1) %arg37172, i64 %16
  %31 = load double, ptr addrspace(1) %30, align 8
  %32 = select i1 %19, double %31, double 0.000000e+00
  %33 = getelementptr double, ptr addrspace(1) %arg36170, i64 %16
  %34 = load double, ptr addrspace(1) %33, align 8
  %35 = select i1 %19, double %34, double 0.000000e+00
  %36 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg18134, i64 0, i64 %11, i64 %12, i64 %13
  %37 = load i8, ptr addrspace(1) %36, align 1, !invariant.load !263
  %38 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg35168, i64 0, i64 %11, i64 %12, i64 %13
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !263
  %40 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg16130, i64 0, i64 %11, i64 %12, i64 %13
  %41 = load i8, ptr addrspace(1) %40, align 1, !invariant.load !263
  %42 = getelementptr inbounds [192 x [2 x [4 x i32]]], ptr addrspace(1) %arg15128, i64 0, i64 %11, i64 %12, i64 %13
  %43 = load i32, ptr addrspace(1) %42, align 4, !invariant.load !263
  %44 = icmp eq i32 %43, 1
  %45 = getelementptr double, ptr addrspace(1) %arg14126, i64 %16
  %46 = load double, ptr addrspace(1) %45, align 8
  %47 = select i1 %19, double %46, double 0.000000e+00
  %48 = trunc i8 %41 to i1
  %49 = select i1 %48, i1 %44, i1 false
  %50 = select i1 %49, double %47, double 0.000000e+00
  %51 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg13124, i64 0, i64 %11, i64 %12, i64 %13
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !263
  %multiply.2896.13.clone.1 = fmul double %52, %50
  %53 = fneg double %multiply.2896.13.clone.1
  %54 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg34166, i64 0, i64 %11, i64 %12, i64 %13
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !263
  %multiply.2898.9.clone.1 = fmul double %55, %multiply.2896.13.clone.1
  %56 = fmul double %39, %multiply.2896.13.clone.1
  %add.3976.11.clone.1 = fsub double %multiply.2898.9.clone.1, %56
  %57 = trunc i8 %37 to i1
  %58 = select i1 %57, double %add.3976.11.clone.1, double 0.000000e+00
  %59 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg33164, i64 0, i64 %11, i64 %12, i64 %13
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !263
  %61 = select i1 %19, double %22, double 0.000000e+00
  %multiply.2899.19.clone.1 = fmul double %61, %52
  %62 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg8114, i64 0, i64 %11, i64 %12, i64 %13
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !263
  %multiply.2900.15.clone.1 = fmul double %multiply.2899.19.clone.1, %63
  %multiply.2901.9.clone.1 = fmul double %60, %multiply.2900.15.clone.1
  %add.3977.9.clone.1 = fadd double %58, %multiply.2901.9.clone.1
  %add.3978.7.clone.1 = fadd double %35, %add.3977.9.clone.1
  %64 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg32162, i64 0, i64 %11, i64 %12, i64 %13
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !263
  %multiply.2919.5.clone.1 = fmul double %65, %add.3978.7.clone.1
  %66 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg31160, i64 0, i64 %11, i64 %12, i64 %13
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !263
  %divide.598.5.clone.1 = fdiv double %add.3978.7.clone.1, %67
  %add.4000.3.clone.1 = fadd double %multiply.2919.5.clone.1, %divide.598.5.clone.1
  %add.4001.3.clone.1 = fadd double %32, %add.4000.3.clone.1
  %68 = getelementptr double, ptr addrspace(1) %arg30158, i64 %16
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !263
  %add.4002.1.clone.1 = fadd double %69, %add.4001.3.clone.1
  %70 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg29156, i64 0, i64 %11, i64 %12, i64 %13
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !263
  %72 = getelementptr double, ptr addrspace(1) %arg19136, i64 %16
  %73 = load double, ptr addrspace(1) %72, align 8
  %74 = select i1 %19, double %73, double 0.000000e+00
  %75 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg17132, i64 0, i64 %11, i64 %12, i64 %13
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !263
  %77 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg12122, i64 0, i64 %11, i64 %12, i64 %13
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !263
  %multiply.2920.9.clone.1 = fmul double %78, %53
  %multiply.2921.13.clone.1 = fmul double %76, %multiply.2920.9.clone.1
  %79 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg11120, i64 0, i64 %11, i64 %12, i64 %13
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !263
  %multiply.2922.11.clone.1 = fmul double %multiply.2896.13.clone.1, %78
  %81 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg10118, i64 0, i64 %11, i64 %12, i64 %13
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !263
  %multiply.2923.9.clone.1 = fmul double %multiply.2922.11.clone.1, %82
  %multiply.2924.7.clone.1 = fmul double %80, %multiply.2923.9.clone.1
  %add.4003.11.clone.1 = fadd double %multiply.2921.13.clone.1, %multiply.2924.7.clone.1
  %multiply.2925.11.clone.1 = fmul double %multiply.2896.13.clone.1, 5.000000e-01
  %multiply.2926.9.clone.1 = fmul double %multiply.2925.11.clone.1, %82
  %multiply.2927.13.clone.1 = fmul double %80, %multiply.2926.9.clone.1
  %add.4004.11.clone.1 = fadd double %multiply.2927.13.clone.1, %add.4003.11.clone.1
  %83 = select i1 %57, double %add.4004.11.clone.1, double 0.000000e+00
  %multiply.2928.9.clone.1 = fmul double %multiply.2900.15.clone.1, %78
  %multiply.2929.7.clone.1 = fmul double %80, %multiply.2928.9.clone.1
  %add.4005.9.clone.1 = fadd double %multiply.2929.7.clone.1, %83
  %add.4006.7.clone.1 = fadd double %74, %add.4005.9.clone.1
  %84 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7112, i64 0, i64 %13
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !263
  %add.4007.5.clone.1 = fadd double %85, %add.4006.7.clone.1
  %multiply.2930.5.clone.1 = fmul double %71, %add.4007.5.clone.1
  %add.4008.3.clone.1 = fadd double %add.4002.1.clone.1, %multiply.2930.5.clone.1
  %86 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg28154, i64 0, i64 %11, i64 %12, i64 %13
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !263
  %88 = fneg double %add.4008.3.clone.1
  %89 = fmul double %87, %88
  %90 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg6110, i64 0, i64 %11, i64 %12, i64 %13
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !263
  %multiply.2935.7.clone.1 = fmul double %91, %add.4007.5.clone.1
  %add.4016.5.clone.1 = fadd double %multiply.2935.7.clone.1, %89
  %92 = trunc i8 %29 to i1
  %93 = select i1 %92, double %add.4016.5.clone.1, double 0.000000e+00
  %94 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg5108, i64 0, i64 %11, i64 %12, i64 %13
  %95 = load double, ptr addrspace(1) %94, align 8, !invariant.load !263
  %multiply.2936.3.clone.1 = fmul double %95, %93
  %multiply.2937.7.clone.1 = fmul double %27, %multiply.2936.3.clone.1
  %add.4019.5.clone.1 = fadd double %25, %multiply.2937.7.clone.1
  %96 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg3104, i64 0, i64 %11, i64 %12, i64 %13
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !263
  %98 = select i1 %19, double %18, double 0.000000e+00
  %add.4020.3.clone.1 = fadd double %98, %61
  %add.4021.5.clone.1 = fadd double %add.4020.3.clone.1, %85
  %multiply.2938.5.clone.1 = fmul double %add.4021.5.clone.1, %97
  %add.4022.3.clone.1 = fadd double %multiply.2938.5.clone.1, %add.4019.5.clone.1
  %add.4023.1.clone.1 = fadd double %23, %add.4022.3.clone.1
  %99 = getelementptr double, ptr addrspace(1) %arg23144, i64 %16
  %100 = load double, ptr addrspace(1) %99, align 8
  %add.4015.3.clone.1 = fadd double %100, 0.000000e+00
  %101 = getelementptr double, ptr addrspace(1) %arg22142, i64 %16
  %102 = load double, ptr addrspace(1) %101, align 8, !invariant.load !263
  %add.4017.1.clone.1 = fadd double %102, %multiply.2936.3.clone.1
  %add.4018.1.clone.1 = fadd double %add.4015.3.clone.1, %add.4017.1.clone.1
  %103 = getelementptr double, ptr addrspace(1) %arg27152, i64 %16
  %104 = load double, ptr addrspace(1) %103, align 8
  %105 = select i1 %19, double 0.000000e+00, double %104
  %106 = getelementptr double, ptr addrspace(1) %arg24146, i64 %16
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !263
  %108 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg26150, i64 0, i64 %11, i64 %12, i64 %13
  %109 = load double, ptr addrspace(1) %108, align 8, !invariant.load !263
  %110 = getelementptr double, ptr addrspace(1) %arg25148, i64 %16
  %111 = load double, ptr addrspace(1) %110, align 8
  %112 = select i1 %19, double %111, double 0.000000e+00
  %add.4009.3.clone.1 = fadd double %85, %112
  %113 = fneg double %add.4009.3.clone.1
  %114 = fmul double %109, %113
  %115 = fmul double %109, %89
  %add.4010.5.clone.1 = fsub double %114, %115
  %add.4011.3.clone.1 = fadd double %107, %add.4010.5.clone.1
  %add.4012.1.clone.1 = fadd double %105, %add.4011.3.clone.1
  %116 = select i1 %19, double 0.000000e+00, double %73
  %117 = getelementptr double, ptr addrspace(1) %arg42182, i64 %16
  %118 = load double, ptr addrspace(1) %117, align 8
  %add.4042.3.clone.1 = fadd double %118, 0.000000e+00
  %119 = getelementptr inbounds [192 x [1 x [2 x [4 x i8]]]], ptr addrspace(1) %arg41180, i64 0, i64 %11, i64 0, i64 %12, i64 %13
  %120 = load i8, ptr addrspace(1) %119, align 1, !invariant.load !263
  %121 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg40178, i64 0, i64 %11, i64 %12, i64 %13
  %122 = load double, ptr addrspace(1) %121, align 8, !invariant.load !263
  %multiply.2952.13.clone.1 = fmul double %multiply.2920.9.clone.1, %122
  %multiply.2953.11.clone.1 = fmul double %multiply.2952.13.clone.1, 5.000000e-01
  %123 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg39176, i64 0, i64 %11, i64 %12, i64 %13
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !263
  %multiply.2954.9.clone.1 = fmul double %124, %multiply.2953.11.clone.1
  %multiply.2955.9.clone.1 = fmul double %multiply.2923.9.clone.1, %122
  %add.4043.7.clone.1 = fadd double %multiply.2955.9.clone.1, %multiply.2954.9.clone.1
  %multiply.2956.7.clone.1 = fmul double %multiply.2926.9.clone.1, %122
  %add.4044.5.clone.1 = fadd double %multiply.2956.7.clone.1, %add.4043.7.clone.1
  %125 = trunc i8 %120 to i1
  %126 = select i1 %125, double %add.4044.5.clone.1, double 0.000000e+00
  %multiply.2957.5.clone.1 = fmul double %multiply.2928.9.clone.1, %122
  %add.4046.3.clone.1 = fadd double %multiply.2957.5.clone.1, %126
  %127 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg38174, i64 0, i64 %13, i64 0
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !263
  %add.4047.3.clone.1 = fadd double %128, %add.4046.3.clone.1
  %add.4048.1.clone.1 = fadd double %add.4042.3.clone.1, %add.4047.3.clone.1
  %129 = select i1 %19, double 0.000000e+00, double %111
  %130 = getelementptr double, ptr addrspace(1) %arg44186, i64 %16
  %131 = load double, ptr addrspace(1) %130, align 8
  %132 = select i1 %19, double 0.000000e+00, double %131
  %133 = getelementptr double, ptr addrspace(1) %arg45188, i64 %16
  %134 = load double, ptr addrspace(1) %133, align 8
  %135 = select i1 %19, double 0.000000e+00, double %134
  %136 = getelementptr double, ptr addrspace(1) %arg46190, i64 %16
  %137 = load double, ptr addrspace(1) %136, align 8
  %138 = select i1 %19, double 0.000000e+00, double %137
  %139 = getelementptr double, ptr addrspace(1) %arg57212, i64 %16
  %140 = load double, ptr addrspace(1) %139, align 8
  %add.4036.3.clone.1.clone.1 = fadd double %140, 0.000000e+00
  %141 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg56210, i64 0, i64 %11, i64 %12, i64 %13
  %142 = load i8, ptr addrspace(1) %141, align 1, !invariant.load !263
  %143 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg55208, i64 0, i64 %11, i64 %12, i64 %13
  %144 = load double, ptr addrspace(1) %143, align 8, !invariant.load !263
  %145 = icmp eq i32 %43, 0
  %146 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg54206, i64 0, i64 %11, i64 %12, i64 %13
  %147 = load double, ptr addrspace(1) %146, align 8, !invariant.load !263
  %.neg = fneg double %47
  %148 = select i1 %145, double %.neg, double -0.000000e+00
  %149 = fmul double %148, %147
  %multiply.2948.5.clone.1.clone.1 = fmul double %144, %149
  %150 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg53204, i64 0, i64 %11, i64 %12, i64 %13
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !263
  %multiply.2949.3.clone.1.clone.1 = fmul double %151, %multiply.2948.5.clone.1.clone.1
  %152 = trunc i8 %142 to i1
  %153 = select i1 %152, double %multiply.2949.3.clone.1.clone.1, double 0.000000e+00
  %add.4037.3.clone.1.clone.1 = fadd double %85, %153
  %154 = getelementptr inbounds [192 x [2 x [4 x i8]]], ptr addrspace(1) %arg52202, i64 0, i64 %11, i64 %12, i64 %13
  %155 = load i8, ptr addrspace(1) %154, align 1, !invariant.load !263
  %156 = select i1 %19, double %131, double 0.000000e+00
  %157 = select i1 %57, double %50, double 0.000000e+00
  %158 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg51200, i64 0, i64 %11, i64 %12, i64 %13
  %159 = load double, ptr addrspace(1) %158, align 8, !invariant.load !263
  %160 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg50198, i64 0, i64 %11, i64 %12, i64 %13
  %161 = load double, ptr addrspace(1) %160, align 8, !invariant.load !263
  %162 = fneg double %159
  %163 = fmul double %multiply.2899.19.clone.1, %162
  %164 = fmul double %163, %161
  %multiply.2943.15.clone.1.clone.1 = fmul double %164, 2.000000e+00
  %add.4025.13.clone.1.clone.1 = fadd double %157, %multiply.2943.15.clone.1.clone.1
  %add.4026.11.clone.1.clone.1 = fadd double %156, %add.4025.13.clone.1.clone.1
  %add.4027.9.clone.1.clone.1 = fadd double %85, %add.4026.11.clone.1.clone.1
  %165 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg49196, i64 0, i64 %11, i64 %12, i64 %13
  %166 = load double, ptr addrspace(1) %165, align 8, !invariant.load !263
  %167 = select i1 %19, double %137, double 0.000000e+00
  %add.4028.7.clone.1.clone.1 = fadd double %85, %167
  %multiply.2944.5.clone.1.clone.1 = fmul double %add.4028.7.clone.1.clone.1, %166
  %add.4029.7.clone.1.clone.1 = fadd double %multiply.2944.5.clone.1.clone.1, %add.4027.9.clone.1.clone.1
  %168 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg48194, i64 0, i64 %11, i64 %12, i64 %13
  %169 = load double, ptr addrspace(1) %168, align 8, !invariant.load !263
  %170 = fneg double %add.4029.7.clone.1.clone.1
  %171 = fmul double %169, %170
  %172 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg47192, i64 0, i64 %11, i64 %12, i64 %13
  %173 = load double, ptr addrspace(1) %172, align 8, !invariant.load !263
  %multiply.2950.9.clone.1.clone.1 = fmul double %add.4028.7.clone.1.clone.1, %173
  %add.4038.7.clone.1.clone.1 = fadd double %multiply.2950.9.clone.1.clone.1, %171
  %174 = trunc i8 %155 to i1
  %175 = select i1 %174, double %add.4038.7.clone.1.clone.1, double 0.000000e+00
  %multiply.2951.5.clone.1.clone.1 = fmul double %151, %175
  %add.4039.3.clone.1.clone.1 = fadd double %add.4037.3.clone.1.clone.1, %multiply.2951.5.clone.1.clone.1
  %add.4041.1.clone.1.clone.1 = fadd double %add.4036.3.clone.1.clone.1, %add.4039.3.clone.1.clone.1
  %176 = select i1 %19, double 0.000000e+00, double %46
  %177 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg58214, i64 0, i64 %11, i64 %12, i64 %13
  %178 = load double, ptr addrspace(1) %177, align 8, !invariant.load !263
  %179 = fneg double %149
  %180 = fmul double %178, %179
  %181 = select i1 %152, double %180, double 0.000000e+00
  %add.4024.3.clone.1 = fadd double %85, %181
  %182 = select i1 %19, double %134, double 0.000000e+00
  %add.4031.3.clone.1 = fadd double %85, %182
  %183 = fneg double %add.4031.3.clone.1
  %184 = fmul double %178, %183
  %185 = fmul double %178, %171
  %add.4032.5.clone.1 = fsub double %184, %185
  %add.4033.3.clone.1 = fadd double %add.4024.3.clone.1, %add.4032.5.clone.1
  %add.4034.1.clone.1 = fadd double %176, %add.4033.3.clone.1
  %186 = getelementptr double, ptr addrspace(1) %arg59216, i64 %16
  %187 = load double, ptr addrspace(1) %186, align 8
  %188 = select i1 %19, double 0.000000e+00, double %187
  %add.4013.1.clone.1 = fadd double %85, %188
  %189 = select i1 %19, double 0.000000e+00, double %34
  %add.4014.1.clone.1 = fadd double %189, %85
  %190 = getelementptr double, ptr addrspace(1) %arg75248, i64 %16
  %191 = load double, ptr addrspace(1) %190, align 8
  %192 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg76250, i64 0, i64 %11, i64 %12, i64 %13
  %193 = load double, ptr addrspace(1) %192, align 8, !invariant.load !263
  %add.3975.5.clone.1 = fadd double %191, %193
  %194 = select i1 %19, double 0.000000e+00, double %add.3975.5.clone.1
  %195 = getelementptr double, ptr addrspace(1) %arg74246, i64 %16
  %196 = load double, ptr addrspace(1) %195, align 8
  %197 = select i1 %19, double %196, double 0.000000e+00
  %198 = select i1 %19, double %187, double 0.000000e+00
  %multiply.2904.7.clone.1 = fmul double %add.3978.7.clone.1, %91
  %199 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg73244, i64 0, i64 %11, i64 %12, i64 %13
  %200 = load double, ptr addrspace(1) %199, align 8, !invariant.load !263
  %multiply.2905.5.clone.1 = fmul double %multiply.2904.7.clone.1, %200
  %add.3980.3.clone.1 = fadd double %198, %multiply.2905.5.clone.1
  %add.3983.3.clone.1 = fsub double %197, %add.3980.3.clone.1
  %201 = select i1 %19, double %add.3975.5.clone.1, double 0.000000e+00
  %add.3981.3.clone.1 = fadd double %201, %add.3980.3.clone.1
  %add.3984.1.clone.1 = fadd double %85, %add.3981.3.clone.1
  %add.3985.1.clone.1 = fadd double %add.3983.3.clone.1, %add.3984.1.clone.1
  %202 = getelementptr double, ptr addrspace(1) %arg72242, i64 %16
  %203 = load double, ptr addrspace(1) %202, align 8, !invariant.load !263
  %204 = select i1 %19, double %203, double 0.000000e+00
  %add.3986.9.clone.1 = fadd double %85, %204
  %205 = getelementptr double, ptr addrspace(1) %arg71240, i64 %16
  %206 = load double, ptr addrspace(1) %205, align 8
  %207 = select i1 %19, double %206, double 0.000000e+00
  %208 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg70238, i64 0, i64 %11, i64 %12, i64 %13
  %209 = load double, ptr addrspace(1) %208, align 8, !invariant.load !263
  %multiply.2909.3.clone.1 = fmul double %209, %add.3981.3.clone.1
  %210 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg69236, i64 0, i64 %11
  %211 = load double, ptr addrspace(1) %210, align 8, !invariant.load !263
  %multiply.2910.5.clone.1 = fmul double %multiply.2909.3.clone.1, %211
  %add.3987.3.clone.1 = fadd double %85, %multiply.2910.5.clone.1
  %add.3988.3.clone.1 = fadd double %207, %add.3987.3.clone.1
  %212 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg68234, i64 0, i64 %11, i64 %12, i64 %13
  %213 = load double, ptr addrspace(1) %212, align 8, !invariant.load !263
  %214 = fneg double %add.3988.3.clone.1
  %215 = fdiv double %214, %213
  %216 = fmul double %211, %215
  %add.3989.13.clone.1 = fadd double %add.3986.9.clone.1, %216
  %217 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg67232, i64 0, i64 %11, i64 %12, i64 %13
  %218 = load double, ptr addrspace(1) %217, align 8, !invariant.load !263
  %219 = getelementptr double, ptr addrspace(1) %arg66230, i64 %16
  %220 = load double, ptr addrspace(1) %219, align 8, !invariant.load !263
  %221 = getelementptr double, ptr addrspace(1) %arg65228, i64 %16
  %222 = load double, ptr addrspace(1) %221, align 8, !invariant.load !263
  %223 = fadd double %220, %222
  %add.3990.3.clone.1 = select i1 %19, double %223, double 0.000000e+00
  %224 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg64226, i64 0, i64 %11, i64 %12, i64 %13
  %225 = load double, ptr addrspace(1) %224, align 8, !invariant.load !263
  %multiply.2906.3.clone.1 = fmul double %add.3981.3.clone.1, %225
  %divide.597.3.clone.1 = fdiv double %multiply.2906.3.clone.1, %67
  %multiply.2912.5.clone.1 = fmul double %27, %divide.597.3.clone.1
  %226 = getelementptr double, ptr addrspace(1) %arg63224, i64 %16
  %227 = load double, ptr addrspace(1) %226, align 8, !invariant.load !263
  %add.3991.3.clone.1 = fadd double %227, %multiply.2912.5.clone.1
  %add.3992.1.clone.1 = fadd double %add.3990.3.clone.1, %add.3991.3.clone.1
  %add.3993.1.clone.1 = fadd double %85, %add.3992.1.clone.1
  %228 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg62222, i64 0, i64 %11, i64 %12, i64 %13
  %229 = load double, ptr addrspace(1) %228, align 8, !invariant.load !263
  %230 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg61220, i64 0, i64 %11, i64 %12, i64 %13
  %231 = load double, ptr addrspace(1) %230, align 8, !invariant.load !263
  %232 = fmul double %229, %214
  %233 = fmul double %232, %231
  %add.3994.7.clone.1 = fadd double %233, %add.3993.1.clone.1
  %234 = fmul double %218, %add.3994.7.clone.1
  %add.3995.11.clone.1 = fsub double %add.3989.13.clone.1, %234
  %235 = getelementptr inbounds [192 x [2 x [4 x double]]], ptr addrspace(1) %arg60218, i64 0, i64 %11, i64 %12, i64 %13
  %236 = load double, ptr addrspace(1) %235, align 8, !invariant.load !263
  %multiply.2916.7.clone.1 = fmul double %236, %add.3994.7.clone.1
  %add.3996.9.clone.1 = fadd double %multiply.2916.7.clone.1, %add.3995.11.clone.1
  %multiply.2917.7.clone.1 = fmul double %213, %add.3996.9.clone.1
  %add.3997.5.clone.1 = fadd double %add.3985.1.clone.1, %multiply.2917.7.clone.1
  %multiply.2918.5.clone.1 = fmul double %97, %add.3997.5.clone.1
  %add.3998.3.clone.1 = fadd double %85, %multiply.2918.5.clone.1
  %add.3999.1.clone.1 = fadd double %194, %add.3998.3.clone.1
  %237 = select i1 %19, double 0.000000e+00, double %31
  %238 = select i1 %19, double 0.000000e+00, double %196
  %239 = select i1 %19, double 0.000000e+00, double %206
  store double %20, ptr addrspace(1) %17, align 8
  store double %add.4023.1.clone.1, ptr addrspace(1) %21, align 8
  store double %add.4018.1.clone.1, ptr addrspace(1) %99, align 8
  store double %add.4012.1.clone.1, ptr addrspace(1) %103, align 8
  store double %116, ptr addrspace(1) %72, align 8
  store double %add.4048.1.clone.1, ptr addrspace(1) %117, align 8
  store double %129, ptr addrspace(1) %110, align 8
  store double %132, ptr addrspace(1) %130, align 8
  store double %135, ptr addrspace(1) %133, align 8
  store double %138, ptr addrspace(1) %136, align 8
  store double %add.4041.1.clone.1.clone.1, ptr addrspace(1) %139, align 8
  store double %add.4034.1.clone.1, ptr addrspace(1) %45, align 8
  store double %add.4013.1.clone.1, ptr addrspace(1) %186, align 8
  store double %add.4014.1.clone.1, ptr addrspace(1) %33, align 8
  store double %add.3999.1.clone.1, ptr addrspace(1) %190, align 8
  store double %237, ptr addrspace(1) %30, align 8
  store double %238, ptr addrspace(1) %195, align 8
  store double %239, ptr addrspace(1) %205, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg1) local_unnamed_addr #8 {
entry:
  %arg133 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg031 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = lshr i32 %thread.id.2, 2
  %2 = zext i32 %1 to i64
  %3 = and i32 %thread.id.x, 3
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i32 %0, -32
  %6 = zext nneg i32 %thread.id.x to i64
  %7 = lshr i64 %6, 5
  %8 = shl nuw nsw i64 %7, 6
  %9 = shl nuw nsw i64 %2, 5
  %10 = add i64 %8, %9
  %11 = shl nuw nsw i64 %4, 3
  %12 = add i64 %10, %11
  %scevgep = getelementptr i8, ptr addrspace(1) %arg031, i64 %12
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv35 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep36, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %5, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.029 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %13 = icmp ult i32 %thread.id.2, 8
  br i1 %13, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3969.i28, %x_in_tile-true ], [ %partial_reduction_result.029, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep36 = getelementptr i8, ptr addrspace(1) %lsr.iv35, i64 2048
  %14 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %14, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !278

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %15 = zext nneg i32 %thread.id.2 to i64
  %16 = zext nneg i32 %0 to i64
  %17 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 %15, i64 %16
  store double %partial_reduction_result.1, ptr addrspace(3) %17, align 8
  tail call void @llvm.nvvm.barrier0()
  %18 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 %16, i64 %15
  %partial_reduction_result31819 = load <2 x i32>, ptr addrspace(3) %18, align 8
  %19 = extractelement <2 x i32> %partial_reduction_result31819, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 16, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %partial_reduction_result31819, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 16, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %26 = bitcast <2 x i32> %partial_reduction_result31819 to double
  %add.3969.i = fadd double %26, %25
  %27 = bitcast double %add.3969.i to <2 x i32>
  %28 = extractelement <2 x i32> %27, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 8, i32 31)
  %30 = insertelement <2 x i32> poison, i32 %29, i64 0
  %31 = extractelement <2 x i32> %27, i64 1
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %add.3969.i24 = fadd double %add.3969.i, %34
  %35 = bitcast double %add.3969.i24 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 4, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.3969.i25 = fadd double %add.3969.i24, %42
  %43 = bitcast double %add.3969.i25 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 2, i32 31)
  %46 = insertelement <2 x i32> poison, i32 %45, i64 0
  %47 = extractelement <2 x i32> %43, i64 1
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> %46, i32 %48, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.3969.i26 = fadd double %add.3969.i25, %50
  %51 = bitcast double %add.3969.i26 to <2 x i32>
  %52 = extractelement <2 x i32> %51, i64 0
  %53 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %52, i32 1, i32 31)
  %54 = insertelement <2 x i32> poison, i32 %53, i64 0
  %55 = extractelement <2 x i32> %51, i64 1
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 1, i32 31)
  %57 = insertelement <2 x i32> %54, i32 %56, i64 1
  %58 = bitcast <2 x i32> %57 to double
  %add.3969.i27 = fadd double %add.3969.i26, %58
  store double %add.3969.i27, ptr addrspace(3) %18, align 8
  %59 = and i32 %thread.id.x, 799
  %60 = icmp eq i32 %59, 0
  %61 = lshr i32 %thread.id.x, 7
  %62 = zext nneg i32 %61 to i64
  %63 = and i32 %0, 3
  %64 = zext nneg i32 %63 to i64
  %output_element_address = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg133, i64 0, i64 %62, i64 %64
  br i1 %60, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %param_0.23552 = load double, ptr addrspace(1) %lsr.iv35, align 8, !invariant.load !263
  %add.3969.i28 = fadd double %partial_reduction_result.029, %param_0.23552
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3969.i27, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_concatenate_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg33, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg34, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg35) local_unnamed_addr #2 {
entry:
  %arg35194 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34192 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33190 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32188 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31186 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30184 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29182 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28180 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27178 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26176 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25174 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24172 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23170 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22168 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21166 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20164 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19162 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18160 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17158 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16156 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15154 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14152 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13150 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12148 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11146 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10144 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9142 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8140 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7138 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6136 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5134 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4132 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3130 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2128 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1126 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0124 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !266
  %.urem = add nsw i32 %0, -24
  %.cmp = icmp ult i32 %0, 24
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %2 = icmp ult i32 %1, 12
  br i1 %2, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %entry
  %3 = icmp ult i32 %1, 4
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  %4 = icmp ugt i32 %0, 23
  %5 = select i1 %4, i64 4, i64 0
  %6 = zext i1 %4 to i64
  %7 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg6136, i64 0, i64 %6
  %8 = load i64, ptr addrspace(1) %7, align 8, !invariant.load !263
  %9 = icmp eq i64 %8, 0
  %10 = getelementptr double, ptr addrspace(1) %arg0124, i64 %5
  %11 = zext nneg i32 %1 to i64
  %12 = getelementptr inbounds double, ptr addrspace(1) %10, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !263
  %14 = getelementptr double, ptr addrspace(1) %arg11146, i64 %5
  %15 = getelementptr inbounds double, ptr addrspace(1) %14, i64 %11
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !263
  %17 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg30184, i64 0, i64 %6
  %18 = load i64, ptr addrspace(1) %17, align 8, !invariant.load !263
  %19 = sitofp i64 %18 to double
  %multiply.3002.11 = fmul double %19, 0x3F9EEC9242B3CA9C
  %20 = getelementptr double, ptr addrspace(1) %arg12148, i64 %5
  %21 = getelementptr inbounds double, ptr addrspace(1) %20, i64 %11
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !263
  %multiply.3003.15 = fmul double %22, %multiply.3002.11
  %add.4164.15 = fadd double %16, %multiply.3003.15
  %23 = getelementptr double, ptr addrspace(1) %arg9142, i64 %5
  %24 = getelementptr inbounds double, ptr addrspace(1) %23, i64 %11
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !263
  %26 = getelementptr double, ptr addrspace(1) %arg10144, i64 %5
  %27 = getelementptr inbounds double, ptr addrspace(1) %26, i64 %11
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !263
  %add.4206.19 = fsub double %25, %28
  %multiply.3037.11 = fmul double %multiply.3002.11, %add.4206.19
  %add.4207.11 = fadd double %add.4164.15, %multiply.3037.11
  %add.4229.3 = fadd double %13, %add.4207.11
  %29 = select i1 %9, double %add.4207.11, double %add.4229.3
  br label %concatenate.41.1.merge

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %30 = icmp ugt i32 %0, 23
  %31 = icmp ult i32 %1, 8
  %32 = select i1 %30, i64 4, i64 0
  %33 = zext i1 %30 to i64
  %34 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg6136, i64 0, i64 %33
  %35 = load i64, ptr addrspace(1) %34, align 8, !invariant.load !263
  %36 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg30184, i64 0, i64 %33
  %37 = load i64, ptr addrspace(1) %36, align 8, !invariant.load !263
  %38 = sitofp i64 %37 to double
  %multiply.3002.114 = fmul double %38, 0x3F9EEC9242B3CA9C
  br i1 %31, label %concatenate.pivot.4.27, label %concatenate.pivot.8.28

concatenate.pivot.4.27:                           ; preds = %concatenate.pivot.8.
  %39 = icmp eq i64 %35, 0
  %40 = add nsw i32 %1, -4
  %41 = getelementptr double, ptr addrspace(1) %arg1126, i64 %32
  %42 = zext nneg i32 %40 to i64
  %43 = getelementptr inbounds double, ptr addrspace(1) %41, i64 %42
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !263
  %45 = getelementptr double, ptr addrspace(1) %arg14152, i64 %32
  %46 = getelementptr inbounds double, ptr addrspace(1) %45, i64 %42
  %47 = load double, ptr addrspace(1) %46, align 8, !invariant.load !263
  %48 = getelementptr double, ptr addrspace(1) %arg15154, i64 %32
  %49 = getelementptr inbounds double, ptr addrspace(1) %48, i64 %42
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !263
  %multiply.3004.15 = fmul double %50, %multiply.3002.114
  %add.4166.15 = fadd double %47, %multiply.3004.15
  %51 = getelementptr double, ptr addrspace(1) %arg13150, i64 %32
  %52 = getelementptr inbounds double, ptr addrspace(1) %51, i64 %42
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !263
  %54 = getelementptr double, ptr addrspace(1) %arg28180, i64 %32
  %55 = getelementptr inbounds double, ptr addrspace(1) %54, i64 %42
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !263
  %multiply.3000.39 = fmul double %38, 0x3FAEEC9242B3CA9C
  %57 = zext nneg i32 %1 to i64
  %58 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg29182, i64 0, i64 %33, i64 %57
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !263
  %add.4172.32 = fadd double %59, %59
  %multiply.3025.15 = fmul double %multiply.3000.39, %add.4172.32
  %add.4191.15 = fadd double %56, %multiply.3025.15
  %add.4192.23 = fadd double %add.4191.15, -1.000000e+00
  %multiply.3046.19 = fmul double %add.4192.23, 4.000000e+00
  %60 = fsub double %53, %multiply.3046.19
  %multiply.3047.11 = fmul double %multiply.3002.114, %60
  %add.4211.11 = fadd double %add.4166.15, %multiply.3047.11
  %add.4231.3 = fadd double %44, %add.4211.11
  %61 = select i1 %39, double %add.4211.11, double %add.4231.3
  br label %concatenate.41.1.merge

concatenate.pivot.8.28:                           ; preds = %concatenate.pivot.8.
  %62 = icmp eq i64 %35, 0
  %63 = add nsw i32 %1, -8
  %64 = getelementptr double, ptr addrspace(1) %arg2128, i64 %32
  %65 = zext nneg i32 %63 to i64
  %66 = getelementptr inbounds double, ptr addrspace(1) %64, i64 %65
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !263
  %68 = getelementptr double, ptr addrspace(1) %arg7138, i64 %32
  %69 = getelementptr inbounds double, ptr addrspace(1) %68, i64 %65
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !263
  %71 = getelementptr double, ptr addrspace(1) %arg8140, i64 %32
  %72 = getelementptr inbounds double, ptr addrspace(1) %71, i64 %65
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !263
  %multiply.3005.15 = fmul double %73, %multiply.3002.114
  %add.4167.15 = fadd double %70, %multiply.3005.15
  %74 = getelementptr double, ptr addrspace(1) %arg32188, i64 %32
  %75 = getelementptr inbounds double, ptr addrspace(1) %74, i64 %65
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !263
  %77 = getelementptr double, ptr addrspace(1) %arg33190, i64 %32
  %78 = getelementptr inbounds double, ptr addrspace(1) %77, i64 %65
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !263
  %multiply.3049.5 = fmul double %76, %79
  %80 = getelementptr double, ptr addrspace(1) %arg31186, i64 %32
  %81 = getelementptr inbounds double, ptr addrspace(1) %80, i64 %65
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !263
  %multiply.3000.3911 = fmul double %38, 0x3FAEEC9242B3CA9C
  %83 = zext nneg i32 %1 to i64
  %84 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg29182, i64 0, i64 %33, i64 %83
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !263
  %add.4172.3212 = fadd double %85, %85
  %multiply.3014.17 = fmul double %multiply.3000.3911, %add.4172.3212
  %add.4177.17 = fadd double %82, %multiply.3014.17
  %add.4178.9 = fadd double %add.4177.17, 0xBFF62E42FEFA39EF
  %multiply.3050.5 = fmul double %add.4178.9, 0x3FFC71C71C71C71C
  %86 = fsub double %multiply.3049.5, %multiply.3050.5
  %multiply.3051.11 = fmul double %multiply.3002.114, %86
  %add.4213.11 = fadd double %add.4167.15, %multiply.3051.11
  %add.4232.3 = fadd double %67, %add.4213.11
  %87 = select i1 %62, double %add.4213.11, double %add.4232.3
  br label %concatenate.41.1.merge

concatenate.pivot.16.:                            ; preds = %entry
  %88 = icmp ugt i32 %0, 23
  %89 = icmp ult i32 %1, 16
  %90 = select i1 %88, i64 4, i64 0
  %91 = zext i1 %88 to i64
  %92 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg6136, i64 0, i64 %91
  %93 = load i64, ptr addrspace(1) %92, align 8, !invariant.load !263
  br i1 %89, label %concatenate.pivot.12.29, label %concatenate.pivot.20.

concatenate.pivot.12.29:                          ; preds = %concatenate.pivot.16.
  %94 = icmp eq i64 %93, 0
  %95 = add nsw i32 %1, -12
  %96 = getelementptr double, ptr addrspace(1) %arg3130, i64 %90
  %97 = zext nneg i32 %95 to i64
  %98 = getelementptr inbounds double, ptr addrspace(1) %96, i64 %97
  %99 = load double, ptr addrspace(1) %98, align 8, !invariant.load !263
  %100 = getelementptr double, ptr addrspace(1) %arg18160, i64 %90
  %101 = getelementptr inbounds double, ptr addrspace(1) %100, i64 %97
  %102 = load double, ptr addrspace(1) %101, align 8, !invariant.load !263
  %103 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg30184, i64 0, i64 %91
  %104 = load i64, ptr addrspace(1) %103, align 8, !invariant.load !263
  %105 = sitofp i64 %104 to double
  %multiply.3002.1116 = fmul double %105, 0x3F9EEC9242B3CA9C
  %106 = getelementptr double, ptr addrspace(1) %arg19162, i64 %90
  %107 = getelementptr inbounds double, ptr addrspace(1) %106, i64 %97
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !263
  %multiply.3006.15 = fmul double %108, %multiply.3002.1116
  %add.4168.15 = fadd double %102, %multiply.3006.15
  %109 = getelementptr double, ptr addrspace(1) %arg16156, i64 %90
  %110 = getelementptr inbounds double, ptr addrspace(1) %109, i64 %97
  %111 = load double, ptr addrspace(1) %110, align 8, !invariant.load !263
  %112 = getelementptr double, ptr addrspace(1) %arg17158, i64 %90
  %113 = getelementptr inbounds double, ptr addrspace(1) %112, i64 %97
  %114 = load double, ptr addrspace(1) %113, align 8, !invariant.load !263
  %add.4197.23 = fadd double %114, -1.000000e+00
  %add.4214.19 = fsub double %111, %add.4197.23
  %multiply.3053.11 = fmul double %multiply.3002.1116, %add.4214.19
  %add.4216.11 = fadd double %add.4168.15, %multiply.3053.11
  %add.4233.3 = fadd double %99, %add.4216.11
  %115 = select i1 %94, double %add.4216.11, double %add.4233.3
  br label %concatenate.41.1.merge

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %116 = icmp ult i32 %1, 20
  %117 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg30184, i64 0, i64 %91
  %118 = load i64, ptr addrspace(1) %117, align 8, !invariant.load !263
  %119 = sitofp i64 %118 to double
  %multiply.3002.1121 = fmul double %119, 0x3F9EEC9242B3CA9C
  br i1 %116, label %concatenate.pivot.16.30, label %concatenate.pivot.20.31

concatenate.pivot.16.30:                          ; preds = %concatenate.pivot.20.
  %120 = icmp eq i64 %93, 0
  %121 = add nsw i32 %1, -16
  %122 = getelementptr double, ptr addrspace(1) %arg4132, i64 %90
  %123 = zext nneg i32 %121 to i64
  %124 = getelementptr inbounds double, ptr addrspace(1) %122, i64 %123
  %125 = load double, ptr addrspace(1) %124, align 8, !invariant.load !263
  %126 = getelementptr double, ptr addrspace(1) %arg22168, i64 %90
  %127 = getelementptr inbounds double, ptr addrspace(1) %126, i64 %123
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !263
  %129 = getelementptr double, ptr addrspace(1) %arg23170, i64 %90
  %130 = getelementptr inbounds double, ptr addrspace(1) %129, i64 %123
  %131 = load double, ptr addrspace(1) %130, align 8, !invariant.load !263
  %multiply.3007.15 = fmul double %131, %multiply.3002.1121
  %add.4169.15 = fadd double %128, %multiply.3007.15
  %132 = getelementptr double, ptr addrspace(1) %arg20164, i64 %90
  %133 = getelementptr inbounds double, ptr addrspace(1) %132, i64 %123
  %134 = load double, ptr addrspace(1) %133, align 8, !invariant.load !263
  %135 = getelementptr double, ptr addrspace(1) %arg21166, i64 %90
  %136 = getelementptr inbounds double, ptr addrspace(1) %135, i64 %123
  %137 = load double, ptr addrspace(1) %136, align 8, !invariant.load !263
  %add.4174.23 = fadd double %137, 4.000000e+00
  %multiply.3054.21 = fmul double %add.4174.23, 2.500000e-01
  %138 = fsub double %134, %multiply.3054.21
  %multiply.3055.11 = fmul double %multiply.3002.1121, %138
  %add.4218.11 = fadd double %add.4169.15, %multiply.3055.11
  %add.4234.3 = fadd double %125, %add.4218.11
  %139 = select i1 %120, double %add.4218.11, double %add.4234.3
  br label %concatenate.41.1.merge

concatenate.pivot.20.31:                          ; preds = %concatenate.pivot.20.
  %140 = icmp eq i64 %93, 0
  %141 = add nsw i32 %1, -20
  %142 = getelementptr double, ptr addrspace(1) %arg5134, i64 %90
  %143 = zext nneg i32 %141 to i64
  %144 = getelementptr inbounds double, ptr addrspace(1) %142, i64 %143
  %145 = load double, ptr addrspace(1) %144, align 8, !invariant.load !263
  %146 = getelementptr double, ptr addrspace(1) %arg26176, i64 %90
  %147 = getelementptr inbounds double, ptr addrspace(1) %146, i64 %143
  %148 = load double, ptr addrspace(1) %147, align 8, !invariant.load !263
  %149 = getelementptr double, ptr addrspace(1) %arg27178, i64 %90
  %150 = getelementptr inbounds double, ptr addrspace(1) %149, i64 %143
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !263
  %multiply.3008.15 = fmul double %151, %multiply.3002.1121
  %add.4171.15 = fadd double %148, %multiply.3008.15
  %152 = getelementptr double, ptr addrspace(1) %arg24172, i64 %90
  %153 = getelementptr inbounds double, ptr addrspace(1) %152, i64 %143
  %154 = load double, ptr addrspace(1) %153, align 8, !invariant.load !263
  %155 = getelementptr double, ptr addrspace(1) %arg25174, i64 %90
  %156 = getelementptr inbounds double, ptr addrspace(1) %155, i64 %143
  %157 = load double, ptr addrspace(1) %156, align 8, !invariant.load !263
  %add.4187.23 = fadd double %157, 6.000000e+00
  %multiply.3056.21 = fmul double %add.4187.23, 2.500000e-01
  %158 = fsub double %154, %multiply.3056.21
  %multiply.3057.11 = fmul double %multiply.3002.1121, %158
  %add.4221.11 = fadd double %add.4171.15, %multiply.3057.11
  %add.4236.3 = fadd double %145, %add.4221.11
  %159 = select i1 %140, double %add.4221.11, double %add.4236.3
  br label %concatenate.41.1.merge

concatenate.41.1.merge:                           ; preds = %concatenate.pivot.20.31, %concatenate.pivot.16.30, %concatenate.pivot.12.29, %concatenate.pivot.8.28, %concatenate.pivot.4.27, %concatenate.pivot.0.
  %160 = phi i64 [ %18, %concatenate.pivot.0. ], [ %37, %concatenate.pivot.4.27 ], [ %37, %concatenate.pivot.8.28 ], [ %104, %concatenate.pivot.12.29 ], [ %118, %concatenate.pivot.16.30 ], [ %118, %concatenate.pivot.20.31 ]
  %161 = phi double [ %29, %concatenate.pivot.0. ], [ %61, %concatenate.pivot.4.27 ], [ %87, %concatenate.pivot.8.28 ], [ %115, %concatenate.pivot.12.29 ], [ %139, %concatenate.pivot.16.30 ], [ %159, %concatenate.pivot.20.31 ]
  %162 = icmp ult i32 %1, 12
  br i1 %162, label %concatenate.pivot.4.113, label %concatenate.pivot.16.118

concatenate.pivot.4.113:                          ; preds = %concatenate.41.1.merge
  %163 = icmp ult i32 %1, 4
  br i1 %163, label %concatenate.pivot.0.114, label %concatenate.pivot.8.115

concatenate.pivot.0.114:                          ; preds = %concatenate.pivot.4.113
  %164 = icmp ugt i32 %0, 23
  %165 = select i1 %164, i64 4, i64 0
  %166 = getelementptr double, ptr addrspace(1) %arg11146, i64 %165
  %167 = zext nneg i32 %1 to i64
  %168 = getelementptr inbounds double, ptr addrspace(1) %166, i64 %167
  %169 = load double, ptr addrspace(1) %168, align 8, !invariant.load !263
  %170 = sitofp i64 %160 to double
  %multiply.3002.1134 = fmul double %170, 0x3F9EEC9242B3CA9C
  %171 = getelementptr double, ptr addrspace(1) %arg12148, i64 %165
  %172 = getelementptr inbounds double, ptr addrspace(1) %171, i64 %167
  %173 = load double, ptr addrspace(1) %172, align 8, !invariant.load !263
  %multiply.3003.1535 = fmul double %173, %multiply.3002.1134
  %add.4164.1536 = fadd double %169, %multiply.3003.1535
  %174 = getelementptr double, ptr addrspace(1) %arg9142, i64 %165
  %175 = getelementptr inbounds double, ptr addrspace(1) %174, i64 %167
  %176 = load double, ptr addrspace(1) %175, align 8, !invariant.load !263
  %177 = getelementptr double, ptr addrspace(1) %arg10144, i64 %165
  %178 = getelementptr inbounds double, ptr addrspace(1) %177, i64 %167
  %179 = load double, ptr addrspace(1) %178, align 8, !invariant.load !263
  %add.4206.1939 = fsub double %176, %179
  %multiply.3037.1140 = fmul double %multiply.3002.1134, %add.4206.1939
  %add.4207.1141 = fadd double %add.4164.1536, %multiply.3037.1140
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.8.115:                          ; preds = %concatenate.pivot.4.113
  %180 = icmp ugt i32 %0, 23
  %181 = icmp ult i32 %1, 8
  %182 = select i1 %180, i64 4, i64 0
  %183 = zext i1 %180 to i64
  %184 = sitofp i64 %160 to double
  %multiply.3002.1144 = fmul double %184, 0x3F9EEC9242B3CA9C
  br i1 %181, label %concatenate.pivot.4.116, label %concatenate.pivot.8.117

concatenate.pivot.4.116:                          ; preds = %concatenate.pivot.8.115
  %185 = add nsw i32 %1, -4
  %186 = getelementptr double, ptr addrspace(1) %arg14152, i64 %182
  %187 = zext nneg i32 %185 to i64
  %188 = getelementptr inbounds double, ptr addrspace(1) %186, i64 %187
  %189 = load double, ptr addrspace(1) %188, align 8, !invariant.load !263
  %190 = getelementptr double, ptr addrspace(1) %arg15154, i64 %182
  %191 = getelementptr inbounds double, ptr addrspace(1) %190, i64 %187
  %192 = load double, ptr addrspace(1) %191, align 8, !invariant.load !263
  %multiply.3004.1545 = fmul double %192, %multiply.3002.1144
  %add.4166.1546 = fadd double %189, %multiply.3004.1545
  %193 = getelementptr double, ptr addrspace(1) %arg13150, i64 %182
  %194 = getelementptr inbounds double, ptr addrspace(1) %193, i64 %187
  %195 = load double, ptr addrspace(1) %194, align 8, !invariant.load !263
  %196 = getelementptr double, ptr addrspace(1) %arg28180, i64 %182
  %197 = getelementptr inbounds double, ptr addrspace(1) %196, i64 %187
  %198 = load double, ptr addrspace(1) %197, align 8, !invariant.load !263
  %multiply.3000.3948 = fmul double %184, 0x3FAEEC9242B3CA9C
  %199 = zext nneg i32 %1 to i64
  %200 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg29182, i64 0, i64 %183, i64 %199
  %201 = load double, ptr addrspace(1) %200, align 8, !invariant.load !263
  %add.4172.3249 = fadd double %201, %201
  %multiply.3025.1550 = fmul double %multiply.3000.3948, %add.4172.3249
  %add.4191.1551 = fadd double %198, %multiply.3025.1550
  %add.4192.2353 = fadd double %add.4191.1551, -1.000000e+00
  %multiply.3046.1955 = fmul double %add.4192.2353, 4.000000e+00
  %202 = fsub double %195, %multiply.3046.1955
  %multiply.3047.1157 = fmul double %multiply.3002.1144, %202
  %add.4211.1158 = fadd double %add.4166.1546, %multiply.3047.1157
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.8.117:                          ; preds = %concatenate.pivot.8.115
  %203 = add nsw i32 %1, -8
  %204 = getelementptr double, ptr addrspace(1) %arg7138, i64 %182
  %205 = zext nneg i32 %203 to i64
  %206 = getelementptr inbounds double, ptr addrspace(1) %204, i64 %205
  %207 = load double, ptr addrspace(1) %206, align 8, !invariant.load !263
  %208 = getelementptr double, ptr addrspace(1) %arg8140, i64 %182
  %209 = getelementptr inbounds double, ptr addrspace(1) %208, i64 %205
  %210 = load double, ptr addrspace(1) %209, align 8, !invariant.load !263
  %multiply.3005.1562 = fmul double %210, %multiply.3002.1144
  %add.4167.1563 = fadd double %207, %multiply.3005.1562
  %211 = getelementptr double, ptr addrspace(1) %arg32188, i64 %182
  %212 = getelementptr inbounds double, ptr addrspace(1) %211, i64 %205
  %213 = load double, ptr addrspace(1) %212, align 8, !invariant.load !263
  %214 = getelementptr double, ptr addrspace(1) %arg33190, i64 %182
  %215 = getelementptr inbounds double, ptr addrspace(1) %214, i64 %205
  %216 = load double, ptr addrspace(1) %215, align 8, !invariant.load !263
  %multiply.3049.564 = fmul double %213, %216
  %217 = getelementptr double, ptr addrspace(1) %arg31186, i64 %182
  %218 = getelementptr inbounds double, ptr addrspace(1) %217, i64 %205
  %219 = load double, ptr addrspace(1) %218, align 8, !invariant.load !263
  %multiply.3000.3966 = fmul double %184, 0x3FAEEC9242B3CA9C
  %220 = zext nneg i32 %1 to i64
  %221 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg29182, i64 0, i64 %183, i64 %220
  %222 = load double, ptr addrspace(1) %221, align 8, !invariant.load !263
  %add.4172.3267 = fadd double %222, %222
  %multiply.3014.1768 = fmul double %multiply.3000.3966, %add.4172.3267
  %add.4177.1769 = fadd double %219, %multiply.3014.1768
  %add.4178.971 = fadd double %add.4177.1769, 0xBFF62E42FEFA39EF
  %multiply.3050.573 = fmul double %add.4178.971, 0x3FFC71C71C71C71C
  %223 = fsub double %multiply.3049.564, %multiply.3050.573
  %multiply.3051.1175 = fmul double %multiply.3002.1144, %223
  %add.4213.1176 = fadd double %add.4167.1563, %multiply.3051.1175
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.16.118:                         ; preds = %concatenate.41.1.merge
  %224 = icmp ugt i32 %0, 23
  %225 = icmp ult i32 %1, 16
  %226 = select i1 %224, i64 4, i64 0
  br i1 %225, label %concatenate.pivot.12.119, label %concatenate.pivot.20.120

concatenate.pivot.12.119:                         ; preds = %concatenate.pivot.16.118
  %227 = add nsw i32 %1, -12
  %228 = getelementptr double, ptr addrspace(1) %arg18160, i64 %226
  %229 = zext nneg i32 %227 to i64
  %230 = getelementptr inbounds double, ptr addrspace(1) %228, i64 %229
  %231 = load double, ptr addrspace(1) %230, align 8, !invariant.load !263
  %232 = sitofp i64 %160 to double
  %multiply.3002.1179 = fmul double %232, 0x3F9EEC9242B3CA9C
  %233 = getelementptr double, ptr addrspace(1) %arg19162, i64 %226
  %234 = getelementptr inbounds double, ptr addrspace(1) %233, i64 %229
  %235 = load double, ptr addrspace(1) %234, align 8, !invariant.load !263
  %multiply.3006.1580 = fmul double %235, %multiply.3002.1179
  %add.4168.1581 = fadd double %231, %multiply.3006.1580
  %236 = getelementptr double, ptr addrspace(1) %arg16156, i64 %226
  %237 = getelementptr inbounds double, ptr addrspace(1) %236, i64 %229
  %238 = load double, ptr addrspace(1) %237, align 8, !invariant.load !263
  %239 = getelementptr double, ptr addrspace(1) %arg17158, i64 %226
  %240 = getelementptr inbounds double, ptr addrspace(1) %239, i64 %229
  %241 = load double, ptr addrspace(1) %240, align 8, !invariant.load !263
  %add.4197.2383 = fadd double %241, -1.000000e+00
  %add.4214.1985 = fsub double %238, %add.4197.2383
  %multiply.3053.1186 = fmul double %multiply.3002.1179, %add.4214.1985
  %add.4216.1187 = fadd double %add.4168.1581, %multiply.3053.1186
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.20.120:                         ; preds = %concatenate.pivot.16.118
  %242 = icmp ult i32 %1, 20
  %243 = sitofp i64 %160 to double
  %multiply.3002.1190 = fmul double %243, 0x3F9EEC9242B3CA9C
  br i1 %242, label %concatenate.pivot.16.121, label %concatenate.pivot.20.122

concatenate.pivot.16.121:                         ; preds = %concatenate.pivot.20.120
  %244 = add nsw i32 %1, -16
  %245 = getelementptr double, ptr addrspace(1) %arg22168, i64 %226
  %246 = zext nneg i32 %244 to i64
  %247 = getelementptr inbounds double, ptr addrspace(1) %245, i64 %246
  %248 = load double, ptr addrspace(1) %247, align 8, !invariant.load !263
  %249 = getelementptr double, ptr addrspace(1) %arg23170, i64 %226
  %250 = getelementptr inbounds double, ptr addrspace(1) %249, i64 %246
  %251 = load double, ptr addrspace(1) %250, align 8, !invariant.load !263
  %multiply.3007.1591 = fmul double %251, %multiply.3002.1190
  %add.4169.1592 = fadd double %248, %multiply.3007.1591
  %252 = getelementptr double, ptr addrspace(1) %arg20164, i64 %226
  %253 = getelementptr inbounds double, ptr addrspace(1) %252, i64 %246
  %254 = load double, ptr addrspace(1) %253, align 8, !invariant.load !263
  %255 = getelementptr double, ptr addrspace(1) %arg21166, i64 %226
  %256 = getelementptr inbounds double, ptr addrspace(1) %255, i64 %246
  %257 = load double, ptr addrspace(1) %256, align 8, !invariant.load !263
  %add.4174.2394 = fadd double %257, 4.000000e+00
  %multiply.3054.2196 = fmul double %add.4174.2394, 2.500000e-01
  %258 = fsub double %254, %multiply.3054.2196
  %multiply.3055.1198 = fmul double %multiply.3002.1190, %258
  %add.4218.1199 = fadd double %add.4169.1592, %multiply.3055.1198
  br label %concatenate.39.1.clone.1.merge

concatenate.pivot.20.122:                         ; preds = %concatenate.pivot.20.120
  %259 = add nsw i32 %1, -20
  %260 = getelementptr double, ptr addrspace(1) %arg26176, i64 %226
  %261 = zext nneg i32 %259 to i64
  %262 = getelementptr inbounds double, ptr addrspace(1) %260, i64 %261
  %263 = load double, ptr addrspace(1) %262, align 8, !invariant.load !263
  %264 = getelementptr double, ptr addrspace(1) %arg27178, i64 %226
  %265 = getelementptr inbounds double, ptr addrspace(1) %264, i64 %261
  %266 = load double, ptr addrspace(1) %265, align 8, !invariant.load !263
  %multiply.3008.15103 = fmul double %266, %multiply.3002.1190
  %add.4171.15104 = fadd double %263, %multiply.3008.15103
  %267 = getelementptr double, ptr addrspace(1) %arg24172, i64 %226
  %268 = getelementptr inbounds double, ptr addrspace(1) %267, i64 %261
  %269 = load double, ptr addrspace(1) %268, align 8, !invariant.load !263
  %270 = getelementptr double, ptr addrspace(1) %arg25174, i64 %226
  %271 = getelementptr inbounds double, ptr addrspace(1) %270, i64 %261
  %272 = load double, ptr addrspace(1) %271, align 8, !invariant.load !263
  %add.4187.23106 = fadd double %272, 6.000000e+00
  %multiply.3056.21108 = fmul double %add.4187.23106, 2.500000e-01
  %273 = fsub double %269, %multiply.3056.21108
  %multiply.3057.11110 = fmul double %multiply.3002.1190, %273
  %add.4221.11111 = fadd double %add.4171.15104, %multiply.3057.11110
  br label %concatenate.39.1.clone.1.merge

concatenate.39.1.clone.1.merge:                   ; preds = %concatenate.pivot.20.122, %concatenate.pivot.16.121, %concatenate.pivot.12.119, %concatenate.pivot.8.117, %concatenate.pivot.4.116, %concatenate.pivot.0.114
  %274 = phi double [ %add.4207.1141, %concatenate.pivot.0.114 ], [ %add.4211.1158, %concatenate.pivot.4.116 ], [ %add.4213.1176, %concatenate.pivot.8.117 ], [ %add.4216.1187, %concatenate.pivot.12.119 ], [ %add.4218.1199, %concatenate.pivot.16.121 ], [ %add.4221.11111, %concatenate.pivot.20.122 ]
  %275 = zext nneg i32 %0 to i64
  %276 = getelementptr double, ptr addrspace(1) %arg34192, i64 %275
  store double %161, ptr addrspace(1) %276, align 8
  %277 = getelementptr double, ptr addrspace(1) %arg35194, i64 %275
  store double %274, ptr addrspace(1) %277, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_select_fusion(ptr noalias nocapture align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture align 128 dereferenceable(64) %arg7, ptr noalias nocapture align 128 dereferenceable(64) %arg8, ptr noalias nocapture align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg10, ptr noalias nocapture align 128 dereferenceable(64) %arg11, ptr noalias nocapture align 128 dereferenceable(64) %arg12, ptr noalias nocapture align 128 dereferenceable(64) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg14) local_unnamed_addr #4 {
entry:
  %arg1484 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1382 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1280 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1178 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1076 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg974 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg872 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg770 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg668 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg566 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg464 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg362 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg260 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg158 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg056 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !268
  %0 = lshr i32 %thread.id.x, 2
  %1 = icmp ugt i32 %thread.id.x, 7
  br i1 %1, label %entry.loop1.loop_exit_crit_edge, label %loop1.loop_body.lr.ph

entry.loop1.loop_exit_crit_edge:                  ; preds = %entry
  %.pre = zext nneg i32 %0 to i64
  br label %loop1.loop_exit

loop1.loop_body.lr.ph:                            ; preds = %entry
  %thread.id.2 = and i32 %thread.id.x, 3
  %2 = zext nneg i32 %thread.id.2 to i64
  %3 = zext nneg i32 %0 to i64
  %param_2.2572 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg260, i64 0, i64 %3, i64 %2
  %param_2.25722 = load double, ptr addrspace(1) %param_2.2572, align 8, !invariant.load !263
  %multiply.3019.1.clone.1 = fmul double %param_2.25722, %param_2.25722
  %add.4183.1.clone.1 = fadd double %multiply.3019.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.3020.1.clone.1 = fmul double %add.4183.1.clone.1, 5.000000e-01
  %4 = fsub double 0.000000e+00, %multiply.3020.1.clone.1
  %param_5.1388 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg566, i64 0, i64 %3
  %param_5.13885 = load i64, ptr addrspace(1) %param_5.1388, align 8, !invariant.load !263
  %param_6.1147 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg668, i64 0, i64 %3
  %param_6.11476 = load i64, ptr addrspace(1) %param_6.1147, align 8, !invariant.load !263
  %5 = icmp sge i64 %param_5.13885, %param_6.11476
  %param_4.1725 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg464, i64 0, i64 %3
  %param_4.17257 = load i8, ptr addrspace(1) %param_4.1725, align 1, !invariant.load !263
  %param_3.2282 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg362, i64 0, i64 %3
  %param_3.22828 = load i8, ptr addrspace(1) %param_3.2282, align 1, !invariant.load !263
  %6 = or i8 %param_3.22828, %param_4.17257
  %7 = trunc i8 %6 to i1
  %.not46 = or i1 %5, %7
  %param_1.3168 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg158, i64 0, i64 %3, i64 %2
  %param_1.31689 = load double, ptr addrspace(1) %param_1.3168, align 8, !invariant.load !263
  %add.4206.9 = fsub double %param_1.31689, %param_2.25722
  %param_0.2119 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg056, i64 0, i64 %3, i64 %2
  %param_0.211912 = load double, ptr addrspace(1) %param_0.2119, align 8
  %8 = select i1 %.not46, double %param_0.211912, double %add.4206.9
  %9 = icmp eq i64 %param_5.13885, 0
  %param_7.1829 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg770, i64 0, i64 %3, i64 %2
  %param_7.182915 = load double, ptr addrspace(1) %param_7.1829, align 8
  %10 = select i1 %9, double %add.4206.9, double %param_7.182915
  %11 = select i1 %.not46, double %param_7.182915, double %10
  %param_8.1543 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg872, i64 0, i64 %3, i64 %2
  %param_8.154318 = load double, ptr addrspace(1) %param_8.1543, align 8
  %param_9.1375 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg974, i64 0, i64 %3, i64 %2
  %param_9.137519 = load double, ptr addrspace(1) %param_9.1375, align 8
  %param_10.1218 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1076, i64 0, i64 %3
  %param_10.121820 = load i64, ptr addrspace(1) %param_10.1218, align 8, !invariant.load !263
  %12 = sitofp i64 %param_10.121820 to double
  %multiply.3002.25.clone.1 = fmul double %12, 0x3F9EEC9242B3CA9C
  %multiply.3003.7.clone.1 = fmul double %param_0.211912, %multiply.3002.25.clone.1
  %add.4164.7.clone.1 = fadd double %param_9.137519, %multiply.3003.7.clone.1
  %multiply.3037.3.clone.1 = fmul double %add.4206.9, %multiply.3002.25.clone.1
  %add.4207.3.clone.1 = fadd double %multiply.3037.3.clone.1, %add.4164.7.clone.1
  %13 = select i1 %9, double %add.4207.3.clone.1, double %param_8.154318
  %14 = select i1 %.not46, double %param_8.154318, double %13
  %param_11.1061 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg1178, i64 0, i64 %3, i64 %2
  %param_11.106125 = load double, ptr addrspace(1) %param_11.1061, align 8
  %add.4229.5.clone.1 = fadd double %param_11.106125, %add.4207.3.clone.1
  %15 = select i1 %9, double %add.4207.3.clone.1, double %add.4229.5.clone.1
  %16 = select i1 %.not46, double %param_11.106125, double %15
  %17 = select i1 %.not46, double %param_9.137519, double %add.4207.3.clone.1
  %param_12.997 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg1280, i64 0, i64 %3, i64 %2
  %param_12.99730 = load double, ptr addrspace(1) %param_12.997, align 8
  %18 = select i1 %9, double %param_2.25722, double %param_12.99730
  %19 = select i1 %.not46, double %param_12.99730, double %18
  %param_13.933 = getelementptr inbounds [2 x [4 x double]], ptr addrspace(1) %arg1382, i64 0, i64 %3, i64 %2
  %param_13.93337 = load double, ptr addrspace(1) %param_13.933, align 8
  %20 = select i1 %.not46, double %param_13.93337, double %param_2.25722
  store double %8, ptr addrspace(1) %param_0.2119, align 8
  store double %11, ptr addrspace(1) %param_7.1829, align 8
  store double %14, ptr addrspace(1) %param_8.1543, align 8
  store double %16, ptr addrspace(1) %param_11.1061, align 8
  store double %17, ptr addrspace(1) %param_9.1375, align 8
  store double %19, ptr addrspace(1) %param_12.997, align 8
  store double %20, ptr addrspace(1) %param_13.933, align 8
  br label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %entry.loop1.loop_exit_crit_edge, %loop1.loop_body.lr.ph
  %.pre-phi = phi i64 [ %.pre, %entry.loop1.loop_exit_crit_edge ], [ %3, %loop1.loop_body.lr.ph ]
  %partial_reduction_result.0.lcssa = phi double [ 0.000000e+00, %entry.loop1.loop_exit_crit_edge ], [ %4, %loop1.loop_body.lr.ph ]
  %21 = bitcast double %partial_reduction_result.0.lcssa to <2 x i32>
  %22 = extractelement <2 x i32> %21, i64 0
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> poison, i32 %23, i64 0
  %25 = extractelement <2 x i32> %21, i64 1
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 2, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 1
  %28 = bitcast <2 x i32> %27 to double
  %add.3969.i52 = fadd double %partial_reduction_result.0.lcssa, %28
  %29 = bitcast double %add.3969.i52 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 1, i32 31)
  %32 = extractelement <2 x i32> %29, i64 1
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 1, i32 31)
  %34 = and i32 %thread.id.x, 27
  %or.cond = icmp eq i32 %34, 0
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg1484, i64 0, i64 %.pre-phi
  %35 = insertelement <2 x i32> poison, i32 %31, i64 0
  %36 = insertelement <2 x i32> %35, i32 %33, i64 1
  %37 = bitcast <2 x i32> %36 to double
  %add.3969.i53 = fadd double %add.3969.i52, %37
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3969.i53, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #8 {
entry:
  %arg138 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg036 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !271
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
  %param_0.2357.1 = getelementptr inbounds [4 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %11, i64 %12, i64 0, i64 %1
  %param_0.23572.1 = load double, ptr addrspace(1) %param_0.2357.1, align 8, !invariant.load !263
  %add.3969.i28.1 = fadd double %partial_reduction_result.1, %param_0.23572.1
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
  %param_0.2357.2 = getelementptr inbounds [4 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %18, i64 %19, i64 0, i64 %1
  %param_0.23572.2 = load double, ptr addrspace(1) %param_0.2357.2, align 8, !invariant.load !263
  %add.3969.i28.2 = fadd double %partial_reduction_result.1.1, %param_0.23572.2
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
  %param_0.2357.3 = getelementptr inbounds [4 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %25, i64 %26, i64 0, i64 %1
  %param_0.23572.3 = load double, ptr addrspace(1) %param_0.2357.3, align 8, !invariant.load !263
  %add.3969.i28.3 = fadd double %partial_reduction_result.1.2, %param_0.23572.3
  br label %x_in_tile-after.3

x_in_tile-after.3:                                ; preds = %x_in_tile-true.3, %x_in_tile-after.2
  %partial_reduction_result.1.3 = phi double [ %add.3969.i28.3, %x_in_tile-true.3 ], [ %partial_reduction_result.1.2, %x_in_tile-after.2 ]
  %lsr.iv.next = add nuw nsw i16 %lsr.iv, 128
  %lsr.iv.next41 = add nsw i32 %lsr.iv40, 128
  %27 = icmp ugt i32 %lsr.iv.next41, 639
  br i1 %27, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !279

loop1.loop_exit:                                  ; preds = %x_in_tile-after.3
  %28 = zext nneg i32 %0 to i64
  %29 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %1, i64 %28
  store double %partial_reduction_result.1.3, ptr addrspace(3) %29, align 8
  tail call void @llvm.nvvm.barrier0()
  %30 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %28, i64 %1
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
  %param_0.2357 = getelementptr inbounds [4 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %75, i64 %76, i64 0, i64 %1
  %param_0.23572 = load double, ptr addrspace(1) %param_0.2357, align 8, !invariant.load !263
  %add.3969.i28 = fadd double %partial_reduction_result.031, %param_0.23572
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3969.i27, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_compare_convert_select_fusion(ptr noalias nocapture align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg11, ptr noalias nocapture align 128 dereferenceable(16) %arg12, ptr noalias nocapture align 128 dereferenceable(16) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg15, ptr noalias nocapture align 128 dereferenceable(16) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg17, ptr noalias nocapture align 128 dereferenceable(16) %arg18, ptr noalias nocapture align 128 dereferenceable(16) %arg19, ptr noalias nocapture align 128 dereferenceable(8) %arg20, ptr noalias nocapture align 128 dereferenceable(8) %arg21, ptr noalias nocapture align 128 dereferenceable(16) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg27) local_unnamed_addr #2 {
entry:
  %arg27176 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26174 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25172 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24170 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23168 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22166 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21164 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20162 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19160 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18158 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17156 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16154 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15152 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14150 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13148 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12146 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11144 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10142 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9140 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8138 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7136 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6134 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5132 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4130 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3128 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2126 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1124 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0122 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg1124, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !263
  %4 = getelementptr i64, ptr addrspace(1) %arg4130, i64 %1
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !263
  %6 = getelementptr i8, ptr addrspace(1) %arg3128, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !263
  %8 = getelementptr i8, ptr addrspace(1) %arg2126, i64 %1
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !263
  %10 = getelementptr inbounds [2 x [2 x i32]], ptr addrspace(1) %arg15152, i64 0, i64 %1, i64 0
  %11 = load <2 x i32>, ptr addrspace(1) %10, align 8, !invariant.load !263
  %12 = extractelement <2 x i32> %11, i32 0
  %13 = extractelement <2 x i32> %11, i32 1
  %14 = getelementptr double, ptr addrspace(1) %arg14150, i64 %1
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !263
  %16 = getelementptr double, ptr addrspace(1) %arg10142, i64 %1
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !263
  %18 = getelementptr double, ptr addrspace(1) %arg11144, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !263
  %20 = getelementptr double, ptr addrspace(1) %arg9140, i64 %1
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !263
  %22 = getelementptr double, ptr addrspace(1) %arg8138, i64 %1
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !263
  %24 = getelementptr double, ptr addrspace(1) %arg7136, i64 %1
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !263
  %26 = getelementptr double, ptr addrspace(1) %arg6134, i64 %1
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !263
  %28 = getelementptr double, ptr addrspace(1) %arg5132, i64 %1
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !263
  %30 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg17156, i64 0, i64 %1, i64 0
  %31 = load <2 x double>, ptr addrspace(1) %30, align 64, !invariant.load !263
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %multiply.3058.1.clone.1 = fmul double %32, %32
  %multiply.3058.1.clone.1.1 = fmul double %33, %33
  %add.3969.i.1 = fadd double %multiply.3058.1.clone.1, %multiply.3058.1.clone.1.1
  %34 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 16
  %35 = load <2 x double>, ptr addrspace(1) %34, align 16, !invariant.load !263
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  %multiply.3058.1.clone.1.2 = fmul double %36, %36
  %add.3969.i.2 = fadd double %add.3969.i.1, %multiply.3058.1.clone.1.2
  %multiply.3058.1.clone.1.3 = fmul double %37, %37
  %add.3969.i.3 = fadd double %add.3969.i.2, %multiply.3058.1.clone.1.3
  %38 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 32
  %39 = load <2 x double>, ptr addrspace(1) %38, align 32, !invariant.load !263
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %multiply.3058.1.clone.1.4 = fmul double %40, %40
  %add.3969.i.4 = fadd double %add.3969.i.3, %multiply.3058.1.clone.1.4
  %multiply.3058.1.clone.1.5 = fmul double %41, %41
  %add.3969.i.5 = fadd double %add.3969.i.4, %multiply.3058.1.clone.1.5
  %42 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 48
  %43 = load <2 x double>, ptr addrspace(1) %42, align 16, !invariant.load !263
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %multiply.3058.1.clone.1.6 = fmul double %44, %44
  %add.3969.i.6 = fadd double %add.3969.i.5, %multiply.3058.1.clone.1.6
  %multiply.3058.1.clone.1.7 = fmul double %45, %45
  %add.3969.i.7 = fadd double %add.3969.i.6, %multiply.3058.1.clone.1.7
  %46 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 64
  %47 = load <2 x double>, ptr addrspace(1) %46, align 64, !invariant.load !263
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %multiply.3058.1.clone.1.8 = fmul double %48, %48
  %add.3969.i.8 = fadd double %add.3969.i.7, %multiply.3058.1.clone.1.8
  %multiply.3058.1.clone.1.9 = fmul double %49, %49
  %add.3969.i.9 = fadd double %add.3969.i.8, %multiply.3058.1.clone.1.9
  %50 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 80
  %51 = load <2 x double>, ptr addrspace(1) %50, align 16, !invariant.load !263
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %multiply.3058.1.clone.1.10 = fmul double %52, %52
  %add.3969.i.10 = fadd double %add.3969.i.9, %multiply.3058.1.clone.1.10
  %multiply.3058.1.clone.1.11 = fmul double %53, %53
  %add.3969.i.11 = fadd double %add.3969.i.10, %multiply.3058.1.clone.1.11
  %54 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 96
  %55 = load <2 x double>, ptr addrspace(1) %54, align 32, !invariant.load !263
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %multiply.3058.1.clone.1.12 = fmul double %56, %56
  %add.3969.i.12 = fadd double %add.3969.i.11, %multiply.3058.1.clone.1.12
  %multiply.3058.1.clone.1.13 = fmul double %57, %57
  %add.3969.i.13 = fadd double %add.3969.i.12, %multiply.3058.1.clone.1.13
  %58 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 112
  %59 = load <2 x double>, ptr addrspace(1) %58, align 16, !invariant.load !263
  %60 = extractelement <2 x double> %59, i32 0
  %61 = extractelement <2 x double> %59, i32 1
  %multiply.3058.1.clone.1.14 = fmul double %60, %60
  %add.3969.i.14 = fadd double %add.3969.i.13, %multiply.3058.1.clone.1.14
  %multiply.3058.1.clone.1.15 = fmul double %61, %61
  %add.3969.i.15 = fadd double %add.3969.i.14, %multiply.3058.1.clone.1.15
  %62 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 128
  %63 = load <2 x double>, ptr addrspace(1) %62, align 64, !invariant.load !263
  %64 = extractelement <2 x double> %63, i32 0
  %65 = extractelement <2 x double> %63, i32 1
  %multiply.3058.1.clone.1.16 = fmul double %64, %64
  %add.3969.i.16 = fadd double %add.3969.i.15, %multiply.3058.1.clone.1.16
  %multiply.3058.1.clone.1.17 = fmul double %65, %65
  %add.3969.i.17 = fadd double %add.3969.i.16, %multiply.3058.1.clone.1.17
  %66 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 144
  %67 = load <2 x double>, ptr addrspace(1) %66, align 16, !invariant.load !263
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %multiply.3058.1.clone.1.18 = fmul double %68, %68
  %add.3969.i.18 = fadd double %add.3969.i.17, %multiply.3058.1.clone.1.18
  %multiply.3058.1.clone.1.19 = fmul double %69, %69
  %add.3969.i.19 = fadd double %add.3969.i.18, %multiply.3058.1.clone.1.19
  %70 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 160
  %71 = load <2 x double>, ptr addrspace(1) %70, align 32, !invariant.load !263
  %72 = extractelement <2 x double> %71, i32 0
  %73 = extractelement <2 x double> %71, i32 1
  %multiply.3058.1.clone.1.20 = fmul double %72, %72
  %add.3969.i.20 = fadd double %add.3969.i.19, %multiply.3058.1.clone.1.20
  %multiply.3058.1.clone.1.21 = fmul double %73, %73
  %add.3969.i.21 = fadd double %add.3969.i.20, %multiply.3058.1.clone.1.21
  %74 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 176
  %75 = load <2 x double>, ptr addrspace(1) %74, align 16, !invariant.load !263
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %multiply.3058.1.clone.1.22 = fmul double %76, %76
  %add.3969.i.22 = fadd double %add.3969.i.21, %multiply.3058.1.clone.1.22
  %multiply.3058.1.clone.1.23 = fmul double %77, %77
  %add.3969.i.23 = fadd double %add.3969.i.22, %multiply.3058.1.clone.1.23
  %add.4181.5.clone.1 = fadd double %17, %19
  %add.4184.5.clone.1 = fadd double %add.4181.5.clone.1, %21
  %add.4189.5.clone.1 = fadd double %add.4184.5.clone.1, %23
  %add.4194.5.clone.1 = fadd double %add.4189.5.clone.1, %25
  %add.4199.5.clone.1 = fadd double %add.4194.5.clone.1, %27
  %add.4203.5.clone.1 = fadd double %add.4199.5.clone.1, %29
  %multiply.3059.1.clone.1 = fmul double %add.3969.i.23, 5.000000e-01
  %add.4222.1.clone.1 = fsub double %multiply.3059.1.clone.1, %add.4203.5.clone.1
  %subtract.230.5.clone.1 = fsub double %15, %add.4222.1.clone.1
  %compare.1155.5.clone.1 = fcmp uno double %subtract.230.5.clone.1, 0.000000e+00
  %78 = select i1 %compare.1155.5.clone.1, double 0xFFF0000000000000, double %subtract.230.5.clone.1
  %79 = getelementptr double, ptr addrspace(1) %arg13148, i64 %1
  %80 = load double, ptr addrspace(1) %79, align 8
  %subtract.231.7.clone.1 = fsub double %78, %80
  %81 = fneg double %subtract.231.7.clone.1
  %82 = tail call double @llvm.fma.f64(double %81, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %83 = tail call i32 @llvm.nvvm.d2i.lo(double %82) #12
  %84 = tail call double @llvm.nvvm.add.rn.d(double %82, double 0xC338000000000000) #12
  %85 = tail call double @llvm.fma.f64(double %84, double 0xBFE62E42FEFA39EF, double %81)
  %86 = tail call double @llvm.fma.f64(double %84, double 0xBC7ABC9E3B39803F, double %85)
  %87 = tail call double @llvm.fma.f64(double %86, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %88 = tail call double @llvm.fma.f64(double %87, double %86, double 0x3EC71DEE62401315)
  %89 = tail call double @llvm.fma.f64(double %88, double %86, double 0x3EFA01997C89EB71)
  %90 = tail call double @llvm.fma.f64(double %89, double %86, double 0x3F2A01A014761F65)
  %91 = tail call double @llvm.fma.f64(double %90, double %86, double 0x3F56C16C1852B7AF)
  %92 = tail call double @llvm.fma.f64(double %91, double %86, double 0x3F81111111122322)
  %93 = tail call double @llvm.fma.f64(double %92, double %86, double 0x3FA55555555502A1)
  %94 = tail call double @llvm.fma.f64(double %93, double %86, double 0x3FC5555555555511)
  %95 = tail call double @llvm.fma.f64(double %94, double %86, double 0x3FE000000000000B)
  %96 = tail call double @llvm.fma.f64(double %95, double %86, double 1.000000e+00)
  %97 = tail call double @llvm.fma.f64(double %96, double %86, double 1.000000e+00)
  %98 = tail call i32 @llvm.nvvm.d2i.lo(double %97) #12
  %99 = tail call i32 @llvm.nvvm.d2i.hi(double %97) #12
  %100 = shl i32 %83, 20
  %101 = add i32 %99, %100
  %102 = tail call double @llvm.nvvm.lohi.i2d(i32 %98, i32 %101) #12
  %103 = tail call i32 @llvm.nvvm.d2i.hi(double %81) #12
  %104 = bitcast i32 %103 to float
  %105 = tail call float @llvm.nvvm.fabs.f(float %104) #12
  %106 = fcmp olt float %105, 0x4010C46560000000
  br i1 %106, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %107 = fcmp ogt double %subtract.231.7.clone.1, 0.000000e+00
  %108 = fsub double 0x7FF0000000000000, %subtract.231.7.clone.1
  %z.0.i = select i1 %107, double 0.000000e+00, double %108
  %109 = fcmp olt float %105, 0x4010E90000000000
  br i1 %109, label %110, label %__nv_exp.exit

110:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %111 = sdiv i32 %83, 2
  %112 = shl i32 %111, 20
  %113 = add i32 %99, %112
  %114 = tail call double @llvm.nvvm.lohi.i2d(i32 %98, i32 %113) #12
  %115 = sub nsw i32 %83, %111
  %116 = shl i32 %115, 20
  %117 = add nsw i32 %116, 1072693248
  %118 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %117) #12
  %119 = fmul double %118, %114
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %110
  %z.2.i = phi double [ %102, %entry ], [ %119, %110 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %120 = getelementptr double, ptr addrspace(1) %arg0122, i64 %1
  %121 = load double, ptr addrspace(1) %120, align 8
  %122 = getelementptr double, ptr addrspace(1) %arg12146, i64 %1
  %123 = load double, ptr addrspace(1) %122, align 8
  %subtract.232.1.clone.1 = fsub double %80, %78
  %124 = tail call double @llvm.fabs.f64(double %subtract.232.1.clone.1)
  %125 = fneg double %124
  %126 = tail call double @llvm.fma.f64(double %125, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %127 = tail call i32 @llvm.nvvm.d2i.lo(double %126) #12
  %128 = tail call double @llvm.nvvm.add.rn.d(double %126, double 0xC338000000000000) #12
  %129 = tail call double @llvm.fma.f64(double %128, double 0xBFE62E42FEFA39EF, double %125)
  %130 = tail call double @llvm.fma.f64(double %128, double 0xBC7ABC9E3B39803F, double %129)
  %131 = tail call double @llvm.fma.f64(double %130, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %132 = tail call double @llvm.fma.f64(double %131, double %130, double 0x3EC71DEE62401315)
  %133 = tail call double @llvm.fma.f64(double %132, double %130, double 0x3EFA01997C89EB71)
  %134 = tail call double @llvm.fma.f64(double %133, double %130, double 0x3F2A01A014761F65)
  %135 = tail call double @llvm.fma.f64(double %134, double %130, double 0x3F56C16C1852B7AF)
  %136 = tail call double @llvm.fma.f64(double %135, double %130, double 0x3F81111111122322)
  %137 = tail call double @llvm.fma.f64(double %136, double %130, double 0x3FA55555555502A1)
  %138 = tail call double @llvm.fma.f64(double %137, double %130, double 0x3FC5555555555511)
  %139 = tail call double @llvm.fma.f64(double %138, double %130, double 0x3FE000000000000B)
  %140 = tail call double @llvm.fma.f64(double %139, double %130, double 1.000000e+00)
  %141 = tail call double @llvm.fma.f64(double %140, double %130, double 1.000000e+00)
  %142 = tail call i32 @llvm.nvvm.d2i.lo(double %141) #12
  %143 = tail call i32 @llvm.nvvm.d2i.hi(double %141) #12
  %144 = shl i32 %127, 20
  %145 = add i32 %143, %144
  %146 = tail call double @llvm.nvvm.lohi.i2d(i32 %142, i32 %145) #12
  %147 = tail call i32 @llvm.nvvm.d2i.hi(double %125) #12
  %148 = bitcast i32 %147 to float
  %149 = tail call float @llvm.nvvm.fabs.f(float %148) #12
  %150 = fcmp olt float %149, 0x4010C46560000000
  br i1 %150, label %__nv_exp.exit112, label %__internal_fast_icmp_abs_lt.exit.i109

__internal_fast_icmp_abs_lt.exit.i109:            ; preds = %__nv_exp.exit
  %151 = fcmp one double %subtract.232.1.clone.1, 0.000000e+00
  %152 = fsub double 0x7FF0000000000000, %124
  %z.0.i110 = select i1 %151, double 0.000000e+00, double %152
  %153 = fcmp olt float %149, 0x4010E90000000000
  br i1 %153, label %154, label %__nv_exp.exit112

154:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i109
  %155 = sdiv i32 %127, 2
  %156 = shl i32 %155, 20
  %157 = add i32 %143, %156
  %158 = tail call double @llvm.nvvm.lohi.i2d(i32 %142, i32 %157) #12
  %159 = sub nsw i32 %127, %155
  %160 = shl i32 %159, 20
  %161 = add nsw i32 %160, 1072693248
  %162 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %161) #12
  %163 = fmul double %162, %158
  br label %__nv_exp.exit112

__nv_exp.exit112:                                 ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i109, %154
  %z.2.i111 = phi double [ %146, %__nv_exp.exit ], [ %163, %154 ], [ %z.0.i110, %__internal_fast_icmp_abs_lt.exit.i109 ]
  %164 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i111) #12
  %165 = bitcast i32 %164 to float
  %166 = fcmp olt float %165, 0x3FFCAAAAA0000000
  %167 = fcmp ogt float %165, 0xBFFB333320000000
  %or.cond.i = and i1 %166, %167
  br i1 %or.cond.i, label %168, label %185

168:                                              ; preds = %__nv_exp.exit112
  %169 = fadd double %z.2.i111, 2.000000e+00
  %170 = fdiv double %z.2.i111, %169
  %171 = fneg double %z.2.i111
  %172 = fmul double %170, %171
  %173 = fadd double %z.2.i111, %172
  %174 = fmul double %173, %173
  %175 = tail call double @llvm.fma.f64(double %174, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %176 = tail call double @llvm.fma.f64(double %175, double %174, double 0x3EF3B9FF890F468C)
  %177 = tail call double @llvm.fma.f64(double %176, double %174, double 0x3F17457EFD51BAF8)
  %178 = tail call double @llvm.fma.f64(double %177, double %174, double 0x3F3C71C8DE3CE825)
  %179 = tail call double @llvm.fma.f64(double %178, double %174, double 0x3F6249248FA4661F)
  %180 = tail call double @llvm.fma.f64(double %179, double %174, double 0x3F899999999D70C4)
  %181 = tail call double @llvm.fma.f64(double %180, double %174, double 0x3FB5555555555462)
  %182 = fmul double %174, %181
  %183 = tail call double @llvm.fma.f64(double %182, double %173, double %172)
  %184 = fadd double %z.2.i111, %183
  br label %__nv_log1p.exit

185:                                              ; preds = %__nv_exp.exit112
  %186 = fadd double %z.2.i111, 1.000000e+00
  %187 = tail call i32 @llvm.nvvm.d2i.hi(double %186) #12
  %188 = tail call i32 @llvm.nvvm.d2i.lo(double %186) #12
  %189 = icmp slt i32 %187, 1048576
  %190 = fmul double %186, 0x4350000000000000
  %191 = tail call i32 @llvm.nvvm.d2i.lo(double %190) #12
  %192 = tail call i32 @llvm.nvvm.d2i.hi(double %190) #12
  br i1 %189, label %193, label %194

193:                                              ; preds = %185
  br label %194

194:                                              ; preds = %193, %185
  %.0.i = phi double [ %190, %193 ], [ %186, %185 ]
  %ihi.i.0.i = phi i32 [ %192, %193 ], [ %187, %185 ]
  %ilo.i.0.i = phi i32 [ %191, %193 ], [ %188, %185 ]
  %e.i.0.i = phi i32 [ -1077, %193 ], [ -1023, %185 ]
  %195 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %195, 2146435071
  br i1 %or.cond2.i, label %196, label %243

196:                                              ; preds = %194
  %197 = lshr i32 %ihi.i.0.i, 20
  %198 = add nsw i32 %e.i.0.i, %197
  %199 = and i32 %ihi.i.0.i, 1048575
  %200 = or disjoint i32 %199, 1072693248
  %201 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %200) #12
  %202 = icmp ugt i32 %200, 1073127582
  %203 = tail call i32 @llvm.nvvm.d2i.lo(double %201) #12
  %204 = tail call i32 @llvm.nvvm.d2i.hi(double %201) #12
  %205 = add i32 %204, -1048576
  %206 = tail call double @llvm.nvvm.lohi.i2d(i32 %203, i32 %205) #12
  %spec.select = select i1 %202, double %206, double %201
  %207 = zext i1 %202 to i32
  %spec.select117 = add nsw i32 %198, %207
  %208 = fadd double %spec.select, -1.000000e+00
  %209 = fadd double %spec.select, 1.000000e+00
  %210 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %209) #12
  %211 = fneg double %209
  %212 = tail call double @llvm.fma.f64(double %211, double %210, double 1.000000e+00)
  %213 = tail call double @llvm.fma.f64(double %212, double %212, double %212)
  %214 = tail call double @llvm.fma.f64(double %213, double %210, double %210)
  %215 = fmul double %208, %214
  %216 = fadd double %215, %215
  %217 = fmul double %216, %216
  %218 = tail call double @llvm.fma.f64(double %217, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %219 = tail call double @llvm.fma.f64(double %218, double %217, double 0x3EF3B2669F02676F)
  %220 = tail call double @llvm.fma.f64(double %219, double %217, double 0x3F1745CBA9AB0956)
  %221 = tail call double @llvm.fma.f64(double %220, double %217, double 0x3F3C71C72D1B5154)
  %222 = tail call double @llvm.fma.f64(double %221, double %217, double 0x3F624924923BE72D)
  %223 = tail call double @llvm.fma.f64(double %222, double %217, double 0x3F8999999999A3C4)
  %224 = tail call double @llvm.fma.f64(double %223, double %217, double 0x3FB5555555555554)
  %225 = fsub double %208, %216
  %226 = fmul double %225, 2.000000e+00
  %227 = fneg double %216
  %228 = tail call double @llvm.fma.f64(double %227, double %208, double %226)
  %229 = fmul double %214, %228
  %230 = fmul double %217, %224
  %231 = tail call double @llvm.fma.f64(double %230, double %216, double %229)
  %232 = xor i32 %spec.select117, -2147483648
  %233 = tail call double @llvm.nvvm.lohi.i2d(i32 %232, i32 1127219200) #12
  %234 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %235 = fsub double %233, %234
  %236 = tail call double @llvm.fma.f64(double %235, double 0x3FE62E42FEFA39EF, double %216)
  %237 = fneg double %235
  %238 = tail call double @llvm.fma.f64(double %237, double 0x3FE62E42FEFA39EF, double %236)
  %239 = fsub double %238, %216
  %240 = fsub double %231, %239
  %241 = tail call double @llvm.fma.f64(double %235, double 0x3C7ABC9E3B39803F, double %240)
  %242 = fadd double %236, %241
  br label %__nv_log1p.exit

243:                                              ; preds = %194
  %244 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %245 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %246 = and i32 %245, 2147483647
  %247 = icmp eq i32 %246, 0
  %q.i.0.i = select i1 %247, double 0xFFF0000000000000, double %244
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %168, %196, %243
  %t.0.i = phi double [ %184, %168 ], [ %242, %196 ], [ %q.i.0.i, %243 ]
  %248 = getelementptr double, ptr addrspace(1) %arg16154, i64 %1
  %249 = load double, ptr addrspace(1) %248, align 8
  %250 = fcmp ole double %78, 0.000000e+00
  %minimum.8.3.clone.1 = select i1 %250, double %78, double 0.000000e+00
  %subtract.233.1.clone.1 = fsub double %249, %minimum.8.3.clone.1
  %251 = tail call double @llvm.fabs.f64(double %subtract.233.1.clone.1)
  %252 = fneg double %251
  %253 = tail call double @llvm.fma.f64(double %252, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %254 = tail call i32 @llvm.nvvm.d2i.lo(double %253) #12
  %255 = tail call double @llvm.nvvm.add.rn.d(double %253, double 0xC338000000000000) #12
  %256 = tail call double @llvm.fma.f64(double %255, double 0xBFE62E42FEFA39EF, double %252)
  %257 = tail call double @llvm.fma.f64(double %255, double 0xBC7ABC9E3B39803F, double %256)
  %258 = tail call double @llvm.fma.f64(double %257, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %259 = tail call double @llvm.fma.f64(double %258, double %257, double 0x3EC71DEE62401315)
  %260 = tail call double @llvm.fma.f64(double %259, double %257, double 0x3EFA01997C89EB71)
  %261 = tail call double @llvm.fma.f64(double %260, double %257, double 0x3F2A01A014761F65)
  %262 = tail call double @llvm.fma.f64(double %261, double %257, double 0x3F56C16C1852B7AF)
  %263 = tail call double @llvm.fma.f64(double %262, double %257, double 0x3F81111111122322)
  %264 = tail call double @llvm.fma.f64(double %263, double %257, double 0x3FA55555555502A1)
  %265 = tail call double @llvm.fma.f64(double %264, double %257, double 0x3FC5555555555511)
  %266 = tail call double @llvm.fma.f64(double %265, double %257, double 0x3FE000000000000B)
  %267 = tail call double @llvm.fma.f64(double %266, double %257, double 1.000000e+00)
  %268 = tail call double @llvm.fma.f64(double %267, double %257, double 1.000000e+00)
  %269 = tail call i32 @llvm.nvvm.d2i.lo(double %268) #12
  %270 = tail call i32 @llvm.nvvm.d2i.hi(double %268) #12
  %271 = shl i32 %254, 20
  %272 = add i32 %270, %271
  %273 = tail call double @llvm.nvvm.lohi.i2d(i32 %269, i32 %272) #12
  %274 = tail call i32 @llvm.nvvm.d2i.hi(double %252) #12
  %275 = bitcast i32 %274 to float
  %276 = tail call float @llvm.nvvm.fabs.f(float %275) #12
  %277 = fcmp olt float %276, 0x4010C46560000000
  br i1 %277, label %__nv_exp.exit116, label %__internal_fast_icmp_abs_lt.exit.i113

__internal_fast_icmp_abs_lt.exit.i113:            ; preds = %__nv_log1p.exit
  %278 = fcmp one double %subtract.233.1.clone.1, 0.000000e+00
  %279 = fsub double 0x7FF0000000000000, %251
  %z.0.i114 = select i1 %278, double 0.000000e+00, double %279
  %280 = fcmp olt float %276, 0x4010E90000000000
  br i1 %280, label %281, label %__nv_exp.exit116

281:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i113
  %282 = sdiv i32 %254, 2
  %283 = shl i32 %282, 20
  %284 = add i32 %270, %283
  %285 = tail call double @llvm.nvvm.lohi.i2d(i32 %269, i32 %284) #12
  %286 = sub nsw i32 %254, %282
  %287 = shl i32 %286, 20
  %288 = add nsw i32 %287, 1072693248
  %289 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %288) #12
  %290 = fmul double %289, %285
  br label %__nv_exp.exit116

__nv_exp.exit116:                                 ; preds = %__nv_log1p.exit, %__internal_fast_icmp_abs_lt.exit.i113, %281
  %z.2.i115 = phi double [ %273, %__nv_log1p.exit ], [ %290, %281 ], [ %z.0.i114, %__internal_fast_icmp_abs_lt.exit.i113 ]
  %291 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i115) #12
  %292 = bitcast i32 %291 to float
  %293 = fcmp olt float %292, 0x3FFCAAAAA0000000
  %294 = fcmp ogt float %292, 0xBFFB333320000000
  %or.cond.i98 = and i1 %293, %294
  br i1 %or.cond.i98, label %295, label %312

295:                                              ; preds = %__nv_exp.exit116
  %296 = fadd double %z.2.i115, 2.000000e+00
  %297 = fdiv double %z.2.i115, %296
  %298 = fneg double %z.2.i115
  %299 = fmul double %297, %298
  %300 = fadd double %z.2.i115, %299
  %301 = fmul double %300, %300
  %302 = tail call double @llvm.fma.f64(double %301, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %303 = tail call double @llvm.fma.f64(double %302, double %301, double 0x3EF3B9FF890F468C)
  %304 = tail call double @llvm.fma.f64(double %303, double %301, double 0x3F17457EFD51BAF8)
  %305 = tail call double @llvm.fma.f64(double %304, double %301, double 0x3F3C71C8DE3CE825)
  %306 = tail call double @llvm.fma.f64(double %305, double %301, double 0x3F6249248FA4661F)
  %307 = tail call double @llvm.fma.f64(double %306, double %301, double 0x3F899999999D70C4)
  %308 = tail call double @llvm.fma.f64(double %307, double %301, double 0x3FB5555555555462)
  %309 = fmul double %301, %308
  %310 = tail call double @llvm.fma.f64(double %309, double %300, double %299)
  %311 = fadd double %z.2.i115, %310
  br label %__nv_log1p.exit108

312:                                              ; preds = %__nv_exp.exit116
  %313 = fadd double %z.2.i115, 1.000000e+00
  %314 = tail call i32 @llvm.nvvm.d2i.hi(double %313) #12
  %315 = tail call i32 @llvm.nvvm.d2i.lo(double %313) #12
  %316 = icmp slt i32 %314, 1048576
  %317 = fmul double %313, 0x4350000000000000
  %318 = tail call i32 @llvm.nvvm.d2i.lo(double %317) #12
  %319 = tail call i32 @llvm.nvvm.d2i.hi(double %317) #12
  br i1 %316, label %320, label %321

320:                                              ; preds = %312
  br label %321

321:                                              ; preds = %320, %312
  %.0.i99 = phi double [ %317, %320 ], [ %313, %312 ]
  %ihi.i.0.i100 = phi i32 [ %319, %320 ], [ %314, %312 ]
  %ilo.i.0.i101 = phi i32 [ %318, %320 ], [ %315, %312 ]
  %e.i.0.i102 = phi i32 [ -1077, %320 ], [ -1023, %312 ]
  %322 = add i32 %ihi.i.0.i100, -1
  %or.cond2.i103 = icmp ult i32 %322, 2146435071
  br i1 %or.cond2.i103, label %323, label %370

323:                                              ; preds = %321
  %324 = lshr i32 %ihi.i.0.i100, 20
  %325 = add nsw i32 %e.i.0.i102, %324
  %326 = and i32 %ihi.i.0.i100, 1048575
  %327 = or disjoint i32 %326, 1072693248
  %328 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i101, i32 %327) #12
  %329 = icmp ugt i32 %327, 1073127582
  %330 = tail call i32 @llvm.nvvm.d2i.lo(double %328) #12
  %331 = tail call i32 @llvm.nvvm.d2i.hi(double %328) #12
  %332 = add i32 %331, -1048576
  %333 = tail call double @llvm.nvvm.lohi.i2d(i32 %330, i32 %332) #12
  %spec.select118 = select i1 %329, double %333, double %328
  %334 = zext i1 %329 to i32
  %spec.select119 = add nsw i32 %325, %334
  %335 = fadd double %spec.select118, -1.000000e+00
  %336 = fadd double %spec.select118, 1.000000e+00
  %337 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %336) #12
  %338 = fneg double %336
  %339 = tail call double @llvm.fma.f64(double %338, double %337, double 1.000000e+00)
  %340 = tail call double @llvm.fma.f64(double %339, double %339, double %339)
  %341 = tail call double @llvm.fma.f64(double %340, double %337, double %337)
  %342 = fmul double %335, %341
  %343 = fadd double %342, %342
  %344 = fmul double %343, %343
  %345 = tail call double @llvm.fma.f64(double %344, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %346 = tail call double @llvm.fma.f64(double %345, double %344, double 0x3EF3B2669F02676F)
  %347 = tail call double @llvm.fma.f64(double %346, double %344, double 0x3F1745CBA9AB0956)
  %348 = tail call double @llvm.fma.f64(double %347, double %344, double 0x3F3C71C72D1B5154)
  %349 = tail call double @llvm.fma.f64(double %348, double %344, double 0x3F624924923BE72D)
  %350 = tail call double @llvm.fma.f64(double %349, double %344, double 0x3F8999999999A3C4)
  %351 = tail call double @llvm.fma.f64(double %350, double %344, double 0x3FB5555555555554)
  %352 = fsub double %335, %343
  %353 = fmul double %352, 2.000000e+00
  %354 = fneg double %343
  %355 = tail call double @llvm.fma.f64(double %354, double %335, double %353)
  %356 = fmul double %341, %355
  %357 = fmul double %344, %351
  %358 = tail call double @llvm.fma.f64(double %357, double %343, double %356)
  %359 = xor i32 %spec.select119, -2147483648
  %360 = tail call double @llvm.nvvm.lohi.i2d(i32 %359, i32 1127219200) #12
  %361 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %362 = fsub double %360, %361
  %363 = tail call double @llvm.fma.f64(double %362, double 0x3FE62E42FEFA39EF, double %343)
  %364 = fneg double %362
  %365 = tail call double @llvm.fma.f64(double %364, double 0x3FE62E42FEFA39EF, double %363)
  %366 = fsub double %365, %343
  %367 = fsub double %358, %366
  %368 = tail call double @llvm.fma.f64(double %362, double 0x3C7ABC9E3B39803F, double %367)
  %369 = fadd double %363, %368
  br label %__nv_log1p.exit108

370:                                              ; preds = %321
  %371 = tail call double @llvm.fma.f64(double %.0.i99, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %372 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i99) #12
  %373 = and i32 %372, 2147483647
  %374 = icmp eq i32 %373, 0
  %q.i.0.i104 = select i1 %374, double 0xFFF0000000000000, double %371
  br label %__nv_log1p.exit108

__nv_log1p.exit108:                               ; preds = %295, %323, %370
  %t.0.i105 = phi double [ %311, %295 ], [ %369, %323 ], [ %q.i.0.i104, %370 ]
  %375 = fcmp uno double %249, 0.000000e+00
  %376 = fcmp oge double %249, %minimum.8.3.clone.1
  %377 = or i1 %375, %376
  %maximum.44.1.clone.1 = select i1 %377, double %249, double %minimum.8.3.clone.1
  %add.4227.3.clone.1 = fadd double %minimum.8.3.clone.1, %249
  %compare.1159.1.clone.1 = fcmp uno double %subtract.233.1.clone.1, 0.000000e+00
  %378 = icmp sge i64 %3, %5
  %379 = or i8 %9, %7
  %380 = trunc i8 %379 to i1
  %.not97 = or i1 %378, %380
  %381 = icmp eq i64 %3, 0
  %compare.1158.1.clone.1 = fcmp uno double %subtract.232.1.clone.1, 0.000000e+00
  %add.4224.3.clone.1 = fadd double %78, %80
  %382 = fcmp uno double %80, 0.000000e+00
  %383 = fcmp oge double %80, %78
  %384 = or i1 %382, %383
  %maximum.43.1.clone.1 = select i1 %384, double %80, double %78
  %add.4226.5.clone.1 = fadd double %maximum.43.1.clone.1, %t.0.i
  %385 = select i1 %compare.1158.1.clone.1, double %add.4224.3.clone.1, double %add.4226.5.clone.1
  %386 = select i1 %381, double %78, double %385
  %387 = select i1 %.not97, double %80, double %386
  %388 = trunc i64 %3 to i32
  %389 = add i32 %13, %388
  %390 = add i32 %389, %12
  %391 = tail call i32 @llvm.fshl.i32(i32 %389, i32 %389, i32 13)
  %392 = xor i32 %390, %391
  %393 = add i32 %392, %390
  %394 = tail call i32 @llvm.fshl.i32(i32 %392, i32 %392, i32 15)
  %395 = xor i32 %393, %394
  %396 = add i32 %395, %393
  %397 = tail call i32 @llvm.fshl.i32(i32 %395, i32 %395, i32 26)
  %398 = xor i32 %396, %397
  %399 = add i32 %398, %396
  %400 = add i32 %399, %13
  %401 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 6)
  %402 = xor i32 %399, %401
  %403 = xor i32 %12, %13
  %404 = xor i32 %403, 466688986
  %405 = add i32 %404, 1
  %406 = add i32 %405, %402
  %407 = add i32 %400, %406
  %408 = tail call i32 @llvm.fshl.i32(i32 %406, i32 %406, i32 17)
  %409 = xor i32 %407, %408
  %410 = add i32 %409, %407
  %411 = tail call i32 @llvm.fshl.i32(i32 %409, i32 %409, i32 29)
  %412 = xor i32 %410, %411
  %413 = add i32 %412, %410
  %414 = tail call i32 @llvm.fshl.i32(i32 %412, i32 %412, i32 16)
  %415 = xor i32 %413, %414
  %416 = add i32 %415, %413
  %417 = add i32 %416, %404
  %418 = tail call i32 @llvm.fshl.i32(i32 %415, i32 %415, i32 24)
  %419 = xor i32 %416, %418
  %420 = add i32 %12, 2
  %421 = add i32 %420, %419
  %422 = add i32 %417, %421
  %423 = tail call i32 @llvm.fshl.i32(i32 %421, i32 %421, i32 13)
  %424 = xor i32 %422, %423
  %425 = add i32 %424, %422
  %426 = tail call i32 @llvm.fshl.i32(i32 %424, i32 %424, i32 15)
  %427 = xor i32 %425, %426
  %428 = add i32 %427, %425
  %429 = tail call i32 @llvm.fshl.i32(i32 %427, i32 %427, i32 26)
  %430 = xor i32 %428, %429
  %431 = add i32 %430, %428
  %432 = add i32 %431, %12
  %433 = tail call i32 @llvm.fshl.i32(i32 %430, i32 %430, i32 6)
  %434 = xor i32 %431, %433
  %435 = add i32 %13, 3
  %436 = add i32 %435, %434
  %437 = add i32 %432, %436
  %438 = tail call i32 @llvm.fshl.i32(i32 %436, i32 %436, i32 17)
  %439 = xor i32 %437, %438
  %440 = add i32 %439, %437
  %441 = tail call i32 @llvm.fshl.i32(i32 %439, i32 %439, i32 29)
  %442 = xor i32 %440, %441
  %443 = add i32 %442, %440
  %444 = tail call i32 @llvm.fshl.i32(i32 %442, i32 %442, i32 16)
  %445 = xor i32 %443, %444
  %446 = add i32 %445, %443
  %447 = add i32 %446, %13
  %448 = tail call i32 @llvm.fshl.i32(i32 %445, i32 %445, i32 24)
  %449 = xor i32 %446, %448
  %450 = add i32 %404, 4
  %451 = add i32 %450, %449
  %452 = add i32 %447, %451
  %453 = tail call i32 @llvm.fshl.i32(i32 %451, i32 %451, i32 13)
  %454 = xor i32 %452, %453
  %455 = add i32 %454, %452
  %456 = tail call i32 @llvm.fshl.i32(i32 %454, i32 %454, i32 15)
  %457 = xor i32 %455, %456
  %458 = add i32 %457, %455
  %459 = tail call i32 @llvm.fshl.i32(i32 %457, i32 %457, i32 26)
  %460 = xor i32 %458, %459
  %461 = add i32 %460, %458
  %462 = add i32 %461, %404
  %463 = tail call i32 @llvm.fshl.i32(i32 %460, i32 %460, i32 6)
  %464 = xor i32 %461, %463
  %465 = add i32 %464, %12
  %466 = add i32 %465, 6
  %467 = add i32 %466, %462
  %468 = tail call i32 @llvm.fshl.i32(i32 %466, i32 %466, i32 13)
  %469 = xor i32 %467, %468
  %470 = add i32 %469, %467
  %471 = tail call i32 @llvm.fshl.i32(i32 %469, i32 %469, i32 15)
  %472 = xor i32 %470, %471
  %473 = add i32 %472, %470
  %474 = tail call i32 @llvm.fshl.i32(i32 %472, i32 %472, i32 26)
  %475 = xor i32 %473, %474
  %476 = add i32 %475, %473
  %477 = add i32 %465, 5
  %478 = add i32 %476, %477
  %479 = tail call i32 @llvm.fshl.i32(i32 %475, i32 %475, i32 6)
  %480 = xor i32 %476, %479
  %481 = xor i32 %462, %477
  %482 = xor i32 %481, 466688986
  %483 = add i32 %482, 1
  %484 = add i32 %483, %480
  %485 = add i32 %478, %484
  %486 = tail call i32 @llvm.fshl.i32(i32 %484, i32 %484, i32 17)
  %487 = xor i32 %485, %486
  %488 = add i32 %487, %485
  %489 = tail call i32 @llvm.fshl.i32(i32 %487, i32 %487, i32 29)
  %490 = xor i32 %488, %489
  %491 = add i32 %490, %488
  %492 = tail call i32 @llvm.fshl.i32(i32 %490, i32 %490, i32 16)
  %493 = xor i32 %491, %492
  %494 = add i32 %493, %491
  %495 = add i32 %494, %482
  %496 = tail call i32 @llvm.fshl.i32(i32 %493, i32 %493, i32 24)
  %497 = xor i32 %494, %496
  %498 = add i32 %462, 2
  %499 = add i32 %498, %497
  %500 = add i32 %495, %499
  %501 = tail call i32 @llvm.fshl.i32(i32 %499, i32 %499, i32 13)
  %502 = xor i32 %500, %501
  %503 = add i32 %502, %500
  %504 = tail call i32 @llvm.fshl.i32(i32 %502, i32 %502, i32 15)
  %505 = xor i32 %503, %504
  %506 = add i32 %505, %503
  %507 = tail call i32 @llvm.fshl.i32(i32 %505, i32 %505, i32 26)
  %508 = xor i32 %506, %507
  %509 = add i32 %508, %506
  %510 = add i32 %509, %462
  %511 = tail call i32 @llvm.fshl.i32(i32 %508, i32 %508, i32 6)
  %512 = xor i32 %509, %511
  %513 = add i32 %465, 8
  %514 = add i32 %513, %512
  %515 = add i32 %510, %514
  %516 = tail call i32 @llvm.fshl.i32(i32 %514, i32 %514, i32 17)
  %517 = xor i32 %515, %516
  %518 = add i32 %517, %515
  %519 = tail call i32 @llvm.fshl.i32(i32 %517, i32 %517, i32 29)
  %520 = xor i32 %518, %519
  %521 = add i32 %520, %518
  %522 = tail call i32 @llvm.fshl.i32(i32 %520, i32 %520, i32 16)
  %523 = xor i32 %521, %522
  %524 = add i32 %523, %521
  %525 = add i32 %524, %477
  %526 = tail call i32 @llvm.fshl.i32(i32 %523, i32 %523, i32 24)
  %527 = xor i32 %524, %526
  %528 = add i32 %482, 4
  %529 = add i32 %528, %527
  %530 = add i32 %525, %529
  %531 = tail call i32 @llvm.fshl.i32(i32 %529, i32 %529, i32 13)
  %532 = xor i32 %530, %531
  %533 = add i32 %532, %530
  %534 = tail call i32 @llvm.fshl.i32(i32 %532, i32 %532, i32 15)
  %535 = xor i32 %533, %534
  %536 = add i32 %535, %533
  %537 = tail call i32 @llvm.fshl.i32(i32 %535, i32 %535, i32 26)
  %538 = xor i32 %536, %537
  %539 = add i32 %538, %536
  %540 = add i32 %539, %482
  %541 = zext i32 %540 to i64
  %542 = shl nuw i64 %541, 32
  %543 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 6)
  %544 = xor i32 %539, %543
  %545 = add i32 %462, 5
  %546 = add i32 %545, %544
  %547 = zext i32 %546 to i64
  %548 = or disjoint i64 %542, %547
  %549 = lshr i64 %548, 12
  %550 = or disjoint i64 %549, 4607182418800017408
  %551 = bitcast i64 %550 to double
  %add.4163.7.clone.1 = fadd double %551, -1.000000e+00
  %552 = fcmp ole double %add.4163.7.clone.1, 0.000000e+00
  %maximum.41.7.clone.1 = select i1 %552, double 0.000000e+00, double %add.4163.7.clone.1
  %add.4223.9.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.621.7.clone.1 = fdiv double 1.000000e+00, %add.4223.9.clone.1
  %compare.1156.5.clone.1 = fcmp uge double %maximum.41.7.clone.1, %divide.621.7.clone.1
  %553 = select i1 %compare.1156.5.clone.1, double %123, double %add.4222.1.clone.1
  %554 = select i1 %381, double %add.4222.1.clone.1, double %553
  %555 = select i1 %.not97, double %123, double %554
  %556 = select i1 %compare.1156.5.clone.1, double %121, double %add.4203.5.clone.1
  %557 = select i1 %381, double %add.4203.5.clone.1, double %556
  %558 = select i1 %.not97, double %121, double %557
  %559 = zext i1 %compare.1156.5.clone.1 to i8
  %add.4228.5.clone.1 = fadd double %maximum.44.1.clone.1, %t.0.i105
  %560 = select i1 %compare.1159.1.clone.1, double %add.4227.3.clone.1, double %add.4228.5.clone.1
  %561 = select i1 %381, double %minimum.8.3.clone.1, double %560
  %562 = select i1 %.not97, double %249, double %561
  %compare.1166.3.clone.1 = fcmp olt double %78, -1.000000e+03
  %563 = zext i1 %compare.1166.3.clone.1 to i8
  %564 = select i1 %.not97, i8 %9, i8 %563
  %565 = getelementptr double, ptr addrspace(1) %arg18158, i64 %1
  %566 = load double, ptr addrspace(1) %565, align 8
  %567 = select i1 %.not97, double %566, double %add.4203.5.clone.1
  %568 = getelementptr double, ptr addrspace(1) %arg19160, i64 %1
  %569 = load double, ptr addrspace(1) %568, align 8
  %570 = select i1 %381, double %add.4203.5.clone.1, double %569
  %571 = select i1 %.not97, double %569, double %570
  %572 = ashr i64 %3, 1
  %573 = tail call i64 @llvm.abs.i64(i64 %572, i1 true)
  %574 = tail call range(i64 0, 64) i64 @llvm.ctpop.i64(i64 %573)
  %575 = trunc nuw nsw i64 %574 to i32
  %576 = getelementptr i32, ptr addrspace(1) %arg20162, i64 %1
  %577 = load i32, ptr addrspace(1) %576, align 4
  %578 = select i1 %.not97, i32 %577, i32 %575
  %579 = xor i64 %3, -1
  %580 = add i64 %3, 1
  %581 = and i64 %580, %579
  %582 = add i64 %581, -1
  %583 = sub i64 1, %581
  %584 = icmp slt i64 %582, 0
  %585 = select i1 %584, i64 %583, i64 %582
  %586 = tail call range(i64 0, 65) i64 @llvm.ctpop.i64(i64 %585)
  %587 = trunc nuw nsw i64 %586 to i32
  %588 = sub nsw i32 %575, %587
  %589 = add nsw i32 %588, 1
  %590 = getelementptr i32, ptr addrspace(1) %arg21164, i64 %1
  %591 = load i32, ptr addrspace(1) %590, align 4
  %592 = select i1 %.not97, i32 %591, i32 %589
  %593 = select i1 %.not97, i64 %3, i64 %580
  %594 = getelementptr i64, ptr addrspace(1) %arg22166, i64 %1
  %595 = load i64, ptr addrspace(1) %594, align 8
  %596 = add i64 %595, 1
  %597 = select i1 %381, i64 1, i64 %596
  %598 = select i1 %.not97, i64 %595, i64 %597
  store double %558, ptr addrspace(1) %120, align 8
  store double %555, ptr addrspace(1) %122, align 8
  %599 = getelementptr i8, ptr addrspace(1) %arg23168, i64 %1
  store i8 %559, ptr addrspace(1) %599, align 1
  store double %387, ptr addrspace(1) %79, align 8
  store double %562, ptr addrspace(1) %248, align 8
  %600 = getelementptr i8, ptr addrspace(1) %arg24170, i64 %1
  store i8 %564, ptr addrspace(1) %600, align 1
  store double %567, ptr addrspace(1) %565, align 8
  store double %571, ptr addrspace(1) %568, align 8
  store i32 %578, ptr addrspace(1) %576, align 4
  store i32 %592, ptr addrspace(1) %590, align 4
  %601 = getelementptr i32, ptr addrspace(1) %arg25172, i64 %1
  store i32 %589, ptr addrspace(1) %601, align 4
  %602 = getelementptr i32, ptr addrspace(1) %arg26174, i64 %1
  store i32 %575, ptr addrspace(1) %602, align 4
  %603 = getelementptr i64, ptr addrspace(1) %arg27176, i64 %1
  store i64 %593, ptr addrspace(1) %603, align 8
  store i64 %598, ptr addrspace(1) %594, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_scatter_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg228 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg126 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg024 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !266
  %.cmp23 = icmp ugt i32 %0, 23
  %1 = zext i1 %.cmp23 to i64
  %param_2.157510 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg228, i64 0, i64 %1
  %param_2.157511 = load i32, ptr addrspace(1) %param_2.157510, align 4, !invariant.load !263
  %2 = icmp slt i32 %param_2.157511, 0
  %3 = add i32 %param_2.157511, 10
  %4 = select i1 %2, i32 %3, i32 %param_2.157511
  %5 = icmp ult i32 %4, 10
  br i1 %5, label %scatter.in_bounds-true, label %scatter.14.1.in_bounds-after

scatter.14.1.in_bounds-after:                     ; preds = %entry, %scatter.in_bounds-true
  ret void

scatter.in_bounds-true:                           ; preds = %entry
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr double, ptr addrspace(1) %arg126, i64 %6
  %8 = zext nneg i32 %4 to i64
  %.cmp = icmp ult i32 %0, 24
  %.urem = add nsw i32 %0, -24
  %9 = select i1 %.cmp, i32 %0, i32 %.urem
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds [2 x [10 x [24 x double]]], ptr addrspace(1) %arg024, i64 0, i64 %1, i64 %8, i64 %10
  %param_1.159421 = load double, ptr addrspace(1) %7, align 8, !invariant.load !263
  store double %param_1.159421, ptr addrspace(1) %11, align 8
  br label %scatter.14.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_1(ptr noalias nocapture align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg5, ptr noalias nocapture align 128 dereferenceable(3840) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg9) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !270
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 480
  br i1 %3, label %loop_select_fusion.1.in_bounds-true, label %loop_select_fusion.1.in_bounds-after

loop_select_fusion.1.in_bounds-after:             ; preds = %loop_select_fusion.1.in_bounds-true, %entry
  ret void

loop_select_fusion.1.in_bounds-true:              ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 239
  %4 = zext i1 %.cmp to i64
  %5 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg38, i64 0, i64 %4
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !263
  %7 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg410, i64 0, i64 %4
  %8 = load i64, ptr addrspace(1) %7, align 8, !invariant.load !263
  %9 = icmp sge i64 %6, %8
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg26, i64 0, i64 %4
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !263
  %12 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg14, i64 0, i64 %4
  %13 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !263
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
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !263
  %30 = select i1 %24, double %29, double %27
  %31 = select i1 %.not1, double %27, double %30
  %32 = getelementptr double, ptr addrspace(1) %arg614, i64 %25
  %33 = load double, ptr addrspace(1) %32, align 8
  %34 = getelementptr double, ptr addrspace(1) %arg716, i64 %25
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !263
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
define void @input_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #4 {
entry:
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !268
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
  %param_1.66 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg113, i64 0, i64 %5
  %param_1.662 = load i32, ptr addrspace(1) %param_1.66, align 4, !invariant.load !263
  %param_2.56 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.563 = load i32, ptr addrspace(1) %param_2.56, align 4, !invariant.load !263
  %6 = icmp sge i32 %param_1.662, %param_2.563
  %param_0.41 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg011, i64 0, i64 %5
  %param_0.414 = load i8, ptr addrspace(1) %param_0.41, align 1, !invariant.load !263
  %7 = trunc i8 %param_0.414 to i1
  %8 = xor i1 %7, true
  %9 = and i1 %6, %8
  %10 = zext i1 %9 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg317, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg6) local_unnamed_addr #2 {
entry:
  %arg6113 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5111 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4109 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3107 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2105 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1103 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0101 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !266
  %.cmp = icmp ugt i32 %0, 23
  %.urem = add nsw i32 %0, -24
  %.cmp100 = icmp ult i32 %0, 24
  %1 = select i1 %.cmp100, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg1103, i64 0, i64 %2
  %4 = load i32, ptr addrspace(1) %3, align 4, !invariant.load !263
  %5 = icmp slt i32 %4, 0
  %6 = add i32 %4, 10
  %7 = select i1 %5, i32 %6, i32 %4
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 0)
  %9 = tail call i32 @llvm.umin.i32(i32 %8, i32 9)
  %10 = zext nneg i32 %9 to i64
  %11 = zext nneg i32 %1 to i64
  %12 = getelementptr inbounds [2 x [10 x [24 x double]]], ptr addrspace(1) %arg0101, i64 0, i64 %2, i64 %10, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !263
  %14 = zext nneg i32 %0 to i64
  %15 = getelementptr double, ptr addrspace(1) %arg3107, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !263
  %17 = getelementptr inbounds [2 x [10 x [24 x double]]], ptr addrspace(1) %arg4109, i64 0, i64 %2, i64 %10, i64 %11
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !263
  %subtract.218.7 = fsub double %16, %18
  %add.3972.7 = fadd double %13, %subtract.218.7
  %19 = getelementptr double, ptr addrspace(1) %arg2105, i64 %14
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !263
  %add.3973.7 = fadd double %13, %20
  %multiply.2886.7 = fmul double %add.3973.7, 5.000000e-01
  %subtract.219.5 = fsub double %add.3972.7, %multiply.2886.7
  %multiply.2887.1 = fmul double %13, %subtract.219.5
  %multiply.2888.1.clone.1 = fmul double %20, %subtract.219.5
  %21 = getelementptr double, ptr addrspace(1) %arg5111, i64 %14
  store double %multiply.2887.1, ptr addrspace(1) %21, align 8
  %22 = getelementptr double, ptr addrspace(1) %arg6113, i64 %14
  store double %multiply.2888.1.clone.1, ptr addrspace(1) %22, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion(ptr noalias nocapture readonly align 128 dereferenceable(384) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg1) local_unnamed_addr #2 {
entry:
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg06, i64 0, i64 %1, i64 0
  %3 = load <2 x double>, ptr addrspace(1) %2, align 64, !invariant.load !263
  %4 = extractelement <2 x double> %3, i32 0
  %5 = extractelement <2 x double> %3, i32 1
  %add.3969.i = fadd double %4, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %5
  %6 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 16
  %7 = load <2 x double>, ptr addrspace(1) %6, align 16, !invariant.load !263
  %8 = extractelement <2 x double> %7, i32 0
  %9 = extractelement <2 x double> %7, i32 1
  %add.3969.i.2 = fadd double %add.3969.i.1, %8
  %add.3969.i.3 = fadd double %add.3969.i.2, %9
  %10 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 32
  %11 = load <2 x double>, ptr addrspace(1) %10, align 32, !invariant.load !263
  %12 = extractelement <2 x double> %11, i32 0
  %13 = extractelement <2 x double> %11, i32 1
  %add.3969.i.4 = fadd double %add.3969.i.3, %12
  %add.3969.i.5 = fadd double %add.3969.i.4, %13
  %14 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 48
  %15 = load <2 x double>, ptr addrspace(1) %14, align 16, !invariant.load !263
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  %add.3969.i.6 = fadd double %add.3969.i.5, %16
  %add.3969.i.7 = fadd double %add.3969.i.6, %17
  %18 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 64
  %19 = load <2 x double>, ptr addrspace(1) %18, align 64, !invariant.load !263
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  %add.3969.i.8 = fadd double %add.3969.i.7, %20
  %add.3969.i.9 = fadd double %add.3969.i.8, %21
  %22 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 80
  %23 = load <2 x double>, ptr addrspace(1) %22, align 16, !invariant.load !263
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %add.3969.i.10 = fadd double %add.3969.i.9, %24
  %add.3969.i.11 = fadd double %add.3969.i.10, %25
  %26 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 96
  %27 = load <2 x double>, ptr addrspace(1) %26, align 32, !invariant.load !263
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %add.3969.i.12 = fadd double %add.3969.i.11, %28
  %add.3969.i.13 = fadd double %add.3969.i.12, %29
  %30 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 112
  %31 = load <2 x double>, ptr addrspace(1) %30, align 16, !invariant.load !263
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %add.3969.i.14 = fadd double %add.3969.i.13, %32
  %add.3969.i.15 = fadd double %add.3969.i.14, %33
  %34 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 128
  %35 = load <2 x double>, ptr addrspace(1) %34, align 64, !invariant.load !263
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  %add.3969.i.16 = fadd double %add.3969.i.15, %36
  %add.3969.i.17 = fadd double %add.3969.i.16, %37
  %38 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 144
  %39 = load <2 x double>, ptr addrspace(1) %38, align 16, !invariant.load !263
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %add.3969.i.18 = fadd double %add.3969.i.17, %40
  %add.3969.i.19 = fadd double %add.3969.i.18, %41
  %42 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 160
  %43 = load <2 x double>, ptr addrspace(1) %42, align 32, !invariant.load !263
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %add.3969.i.20 = fadd double %add.3969.i.19, %44
  %add.3969.i.21 = fadd double %add.3969.i.20, %45
  %46 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 176
  %47 = load <2 x double>, ptr addrspace(1) %46, align 16, !invariant.load !263
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %add.3969.i.22 = fadd double %add.3969.i.21, %48
  %add.3969.i.23 = fadd double %add.3969.i.22, %49
  %compare.1128.1 = fcmp ole double %add.3969.i.23, 0.000000e+00
  %50 = zext i1 %compare.1128.1 to i8
  %51 = getelementptr i8, ptr addrspace(1) %arg18, i64 %1
  store i8 %50, ptr addrspace(1) %51, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg2, ptr noalias nocapture align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #2 {
entry:
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg314, i64 %1
  %3 = load i32, ptr addrspace(1) %2, align 4
  %4 = getelementptr i32, ptr addrspace(1) %arg416, i64 %1
  %5 = load i32, ptr addrspace(1) %4, align 4, !invariant.load !263
  %6 = getelementptr i8, ptr addrspace(1) %arg08, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1
  %8 = getelementptr i8, ptr addrspace(1) %arg110, i64 %1
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !263
  %10 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg212, i64 0, i64 %1, i64 0
  %11 = load <2 x double>, ptr addrspace(1) %10, align 64, !invariant.load !263
  %12 = extractelement <2 x double> %11, i32 0
  %13 = extractelement <2 x double> %11, i32 1
  %add.3969.i = fadd double %12, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %13
  %14 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 16
  %15 = load <2 x double>, ptr addrspace(1) %14, align 16, !invariant.load !263
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  %add.3969.i.2 = fadd double %add.3969.i.1, %16
  %add.3969.i.3 = fadd double %add.3969.i.2, %17
  %18 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 32
  %19 = load <2 x double>, ptr addrspace(1) %18, align 32, !invariant.load !263
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  %add.3969.i.4 = fadd double %add.3969.i.3, %20
  %add.3969.i.5 = fadd double %add.3969.i.4, %21
  %22 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 48
  %23 = load <2 x double>, ptr addrspace(1) %22, align 16, !invariant.load !263
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %add.3969.i.6 = fadd double %add.3969.i.5, %24
  %add.3969.i.7 = fadd double %add.3969.i.6, %25
  %26 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 64
  %27 = load <2 x double>, ptr addrspace(1) %26, align 64, !invariant.load !263
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %add.3969.i.8 = fadd double %add.3969.i.7, %28
  %add.3969.i.9 = fadd double %add.3969.i.8, %29
  %30 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 80
  %31 = load <2 x double>, ptr addrspace(1) %30, align 16, !invariant.load !263
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %add.3969.i.10 = fadd double %add.3969.i.9, %32
  %add.3969.i.11 = fadd double %add.3969.i.10, %33
  %34 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 96
  %35 = load <2 x double>, ptr addrspace(1) %34, align 32, !invariant.load !263
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  %add.3969.i.12 = fadd double %add.3969.i.11, %36
  %add.3969.i.13 = fadd double %add.3969.i.12, %37
  %38 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 112
  %39 = load <2 x double>, ptr addrspace(1) %38, align 16, !invariant.load !263
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %add.3969.i.14 = fadd double %add.3969.i.13, %40
  %add.3969.i.15 = fadd double %add.3969.i.14, %41
  %42 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 128
  %43 = load <2 x double>, ptr addrspace(1) %42, align 64, !invariant.load !263
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %add.3969.i.16 = fadd double %add.3969.i.15, %44
  %add.3969.i.17 = fadd double %add.3969.i.16, %45
  %46 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 144
  %47 = load <2 x double>, ptr addrspace(1) %46, align 16, !invariant.load !263
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %add.3969.i.18 = fadd double %add.3969.i.17, %48
  %add.3969.i.19 = fadd double %add.3969.i.18, %49
  %50 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 160
  %51 = load <2 x double>, ptr addrspace(1) %50, align 32, !invariant.load !263
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %add.3969.i.20 = fadd double %add.3969.i.19, %52
  %add.3969.i.21 = fadd double %add.3969.i.20, %53
  %54 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 176
  %55 = load <2 x double>, ptr addrspace(1) %54, align 16, !invariant.load !263
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %add.3969.i.22 = fadd double %add.3969.i.21, %56
  %add.3969.i.23 = fadd double %add.3969.i.22, %57
  %58 = icmp slt i32 %3, %5
  %59 = trunc i8 %7 to i1
  %.not4 = or i1 %58, %59
  %compare.1129.5 = fcmp ole double %add.3969.i.23, 0.000000e+00
  %60 = zext i1 %compare.1129.5 to i8
  %61 = or i8 %9, %60
  %62 = select i1 %.not4, i8 %7, i8 %61
  %not..not5 = xor i1 %.not4, true
  %63 = sext i1 %not..not5 to i32
  %64 = add i32 %3, %63
  store i8 %62, ptr addrspace(1) %6, align 1
  store i32 %64, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_2(ptr noalias nocapture align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture align 128 dereferenceable(64) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg11, ptr noalias nocapture align 128 dereferenceable(64) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg13, ptr noalias nocapture align 128 dereferenceable(64) %arg14, ptr noalias nocapture align 128 dereferenceable(64) %arg15, ptr noalias nocapture align 128 dereferenceable(64) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg17, ptr noalias nocapture align 128 dereferenceable(64) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg19, ptr noalias nocapture align 128 dereferenceable(64) %arg20, ptr noalias nocapture align 128 dereferenceable(64) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg22, ptr noalias nocapture align 128 dereferenceable(64) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg24, ptr noalias nocapture align 128 dereferenceable(64) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg27, ptr noalias nocapture align 128 dereferenceable(64) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg29, ptr noalias nocapture align 128 dereferenceable(64) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg31, ptr noalias nocapture align 128 dereferenceable(64) %arg32, ptr noalias nocapture align 128 dereferenceable(64) %arg33, ptr noalias nocapture align 128 dereferenceable(64) %arg34, ptr noalias nocapture align 128 dereferenceable(64) %arg35, ptr noalias nocapture align 128 dereferenceable(64) %arg36, ptr noalias nocapture align 128 dereferenceable(64) %arg37, ptr noalias nocapture align 128 dereferenceable(64) %arg38, ptr noalias nocapture align 128 dereferenceable(64) %arg39, ptr noalias nocapture align 128 dereferenceable(64) %arg40, ptr noalias nocapture align 128 dereferenceable(64) %arg41, ptr noalias nocapture align 128 dereferenceable(64) %arg42, ptr noalias nocapture align 128 dereferenceable(64) %arg43, ptr noalias nocapture align 128 dereferenceable(64) %arg44, ptr noalias nocapture align 128 dereferenceable(64) %arg45, ptr noalias nocapture align 128 dereferenceable(64) %arg46, ptr noalias nocapture align 128 dereferenceable(64) %arg47, ptr noalias nocapture align 128 dereferenceable(64) %arg48, ptr noalias nocapture align 128 dereferenceable(64) %arg49, ptr noalias nocapture align 128 dereferenceable(64) %arg50, ptr noalias nocapture align 128 dereferenceable(64) %arg51, ptr noalias nocapture align 128 dereferenceable(64) %arg52, ptr noalias nocapture align 128 dereferenceable(64) %arg53, ptr noalias nocapture align 128 dereferenceable(64) %arg54, ptr noalias nocapture align 128 dereferenceable(64) %arg55, ptr noalias nocapture align 128 dereferenceable(64) %arg56) local_unnamed_addr #2 {
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
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = and i32 %0, 3
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg212, i64 0, i64 %3
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !263
  %6 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg722, i64 0, i64 %3
  %7 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !263
  %8 = icmp sge i64 %5, %7
  %9 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg620, i64 0, i64 %3
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !263
  %11 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg518, i64 0, i64 %3
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !263
  %13 = or i8 %12, %10
  %14 = trunc i8 %13 to i1
  %.not2 = or i1 %8, %14
  %15 = icmp eq i64 %5, 0
  %16 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg110, i64 0, i64 %3
  %17 = load i8, ptr addrspace(1) %16, align 1, !invariant.load !263
  %18 = zext nneg i32 %0 to i64
  %19 = getelementptr double, ptr addrspace(1) %arg03, i64 %18
  %20 = load double, ptr addrspace(1) %19, align 8
  %21 = getelementptr double, ptr addrspace(1) %arg314, i64 %18
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !263
  %23 = getelementptr double, ptr addrspace(1) %arg416, i64 %18
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !263
  %add.4187.7 = fadd double %24, 6.000000e+00
  %multiply.3056.5 = fmul double %add.4187.7, 2.500000e-01
  %25 = fsub double %22, %multiply.3056.5
  %26 = trunc i8 %17 to i1
  %27 = select i1 %26, double %20, double %25
  %28 = select i1 %15, double %25, double %27
  %29 = select i1 %.not2, double %20, double %28
  %30 = getelementptr double, ptr addrspace(1) %arg824, i64 %18
  %31 = load double, ptr addrspace(1) %30, align 8
  %32 = getelementptr double, ptr addrspace(1) %arg926, i64 %18
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !263
  %34 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1130, i64 0, i64 %3
  %35 = load i64, ptr addrspace(1) %34, align 8, !invariant.load !263
  %36 = sitofp i64 %35 to double
  %multiply.3000.27.clone.1 = fmul double %36, 0x3FAEEC9242B3CA9C
  %37 = or i32 %0, 4
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg1028, i64 0, i64 %3, i64 %38
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !263
  %add.4172.20.clone.1 = fadd double %40, %40
  %multiply.3025.3.clone.1 = fmul double %multiply.3000.27.clone.1, %add.4172.20.clone.1
  %add.4191.3.clone.1 = fadd double %33, %multiply.3025.3.clone.1
  %41 = select i1 %26, double %31, double %add.4191.3.clone.1
  %42 = select i1 %15, double %add.4191.3.clone.1, double %41
  %43 = select i1 %.not2, double %31, double %42
  %44 = getelementptr double, ptr addrspace(1) %arg1232, i64 %18
  %45 = load double, ptr addrspace(1) %44, align 8
  %46 = getelementptr double, ptr addrspace(1) %arg1334, i64 %18
  %47 = load double, ptr addrspace(1) %46, align 8, !invariant.load !263
  %48 = select i1 %26, double %45, double %47
  %49 = select i1 %15, double %47, double %48
  %50 = select i1 %.not2, double %45, double %49
  %51 = getelementptr double, ptr addrspace(1) %arg1436, i64 %18
  %52 = load double, ptr addrspace(1) %51, align 8
  %53 = getelementptr double, ptr addrspace(1) %arg1538, i64 %18
  %54 = load double, ptr addrspace(1) %53, align 8
  %55 = zext nneg i32 %2 to i64
  %56 = getelementptr [2 x [24 x double]], ptr addrspace(1) %arg1028, i64 0, i64 %3, i64 %55
  %57 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 64
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !263
  %add.4172.20.clone.11 = fadd double %58, %58
  %multiply.3014.7.clone.1 = fmul double %multiply.3000.27.clone.1, %add.4172.20.clone.11
  %add.4177.7.clone.1 = fadd double %54, %multiply.3014.7.clone.1
  %59 = select i1 %26, double %52, double %add.4177.7.clone.1
  %60 = select i1 %15, double %add.4177.7.clone.1, double %59
  %61 = select i1 %.not2, double %52, double %60
  %62 = getelementptr double, ptr addrspace(1) %arg1640, i64 %18
  %63 = load double, ptr addrspace(1) %62, align 8
  %64 = getelementptr double, ptr addrspace(1) %arg1742, i64 %18
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !263
  %66 = select i1 %26, double %63, double %65
  %67 = select i1 %15, double %65, double %66
  %68 = select i1 %.not2, double %63, double %67
  %69 = getelementptr double, ptr addrspace(1) %arg1844, i64 %18
  %70 = load double, ptr addrspace(1) %69, align 8
  %71 = getelementptr double, ptr addrspace(1) %arg1946, i64 %18
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !263
  %73 = select i1 %26, double %70, double %72
  %74 = select i1 %15, double %72, double %73
  %75 = select i1 %.not2, double %70, double %74
  %76 = getelementptr double, ptr addrspace(1) %arg2048, i64 %18
  %77 = load double, ptr addrspace(1) %76, align 8
  %78 = select i1 %26, double %77, double %24
  %79 = select i1 %15, double %24, double %78
  %80 = select i1 %.not2, double %77, double %79
  %81 = getelementptr double, ptr addrspace(1) %arg2150, i64 %18
  %82 = load double, ptr addrspace(1) %81, align 8
  %83 = getelementptr double, ptr addrspace(1) %arg2252, i64 %18
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !263
  %add.4206.3.clone.1 = fsub double %84, %47
  %85 = select i1 %26, double %82, double %add.4206.3.clone.1
  %86 = select i1 %15, double %add.4206.3.clone.1, double %85
  %87 = select i1 %.not2, double %82, double %86
  %88 = getelementptr double, ptr addrspace(1) %arg2354, i64 %18
  %89 = load double, ptr addrspace(1) %88, align 8
  %90 = getelementptr double, ptr addrspace(1) %arg2456, i64 %18
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !263
  %add.4192.7.clone.1 = fadd double %add.4191.3.clone.1, -1.000000e+00
  %multiply.3046.3.clone.1 = fmul double %add.4192.7.clone.1, 4.000000e+00
  %92 = fsub double %91, %multiply.3046.3.clone.1
  %93 = select i1 %26, double %89, double %92
  %94 = select i1 %15, double %92, double %93
  %95 = select i1 %.not2, double %89, double %94
  %96 = getelementptr double, ptr addrspace(1) %arg2558, i64 %18
  %97 = load double, ptr addrspace(1) %96, align 8
  %98 = getelementptr double, ptr addrspace(1) %arg2660, i64 %18
  %99 = load double, ptr addrspace(1) %98, align 8, !invariant.load !263
  %100 = getelementptr double, ptr addrspace(1) %arg2762, i64 %18
  %101 = load double, ptr addrspace(1) %100, align 8, !invariant.load !263
  %multiply.3049.3.clone.1 = fmul double %99, %101
  %add.4178.7.clone.1 = fadd double %add.4177.7.clone.1, 0xBFF62E42FEFA39EF
  %multiply.3050.3.clone.1 = fmul double %add.4178.7.clone.1, 0x3FFC71C71C71C71C
  %102 = fsub double %multiply.3049.3.clone.1, %multiply.3050.3.clone.1
  %103 = select i1 %26, double %97, double %102
  %104 = select i1 %15, double %102, double %103
  %105 = select i1 %.not2, double %97, double %104
  %106 = getelementptr double, ptr addrspace(1) %arg2864, i64 %18
  %107 = load double, ptr addrspace(1) %106, align 8
  %108 = getelementptr double, ptr addrspace(1) %arg2966, i64 %18
  %109 = load double, ptr addrspace(1) %108, align 8, !invariant.load !263
  %add.4197.7.clone.1 = fadd double %65, -1.000000e+00
  %add.4214.3.clone.1 = fsub double %109, %add.4197.7.clone.1
  %110 = select i1 %26, double %107, double %add.4214.3.clone.1
  %111 = select i1 %15, double %add.4214.3.clone.1, double %110
  %112 = select i1 %.not2, double %107, double %111
  %113 = getelementptr double, ptr addrspace(1) %arg3068, i64 %18
  %114 = load double, ptr addrspace(1) %113, align 8
  %115 = getelementptr double, ptr addrspace(1) %arg3170, i64 %18
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !263
  %add.4174.7.clone.1 = fadd double %72, 4.000000e+00
  %multiply.3054.5.clone.1 = fmul double %add.4174.7.clone.1, 2.500000e-01
  %117 = fsub double %116, %multiply.3054.5.clone.1
  %118 = select i1 %26, double %114, double %117
  %119 = select i1 %15, double %117, double %118
  %120 = select i1 %.not2, double %114, double %119
  %121 = getelementptr double, ptr addrspace(1) %arg3272, i64 %18
  %122 = load double, ptr addrspace(1) %121, align 8
  %123 = getelementptr double, ptr addrspace(1) %arg3374, i64 %18
  %124 = load double, ptr addrspace(1) %123, align 8
  %multiply.3002.23.clone.1 = fmul double %36, 0x3F9EEC9242B3CA9C
  %125 = getelementptr double, ptr addrspace(1) %arg3476, i64 %18
  %126 = load double, ptr addrspace(1) %125, align 8
  %multiply.3005.13.clone.1 = fmul double %multiply.3002.23.clone.1, %126
  %add.4167.13.clone.1 = fadd double %124, %multiply.3005.13.clone.1
  %multiply.3051.9.clone.1 = fmul double %multiply.3002.23.clone.1, %102
  %add.4213.9.clone.1 = fadd double %multiply.3051.9.clone.1, %add.4167.13.clone.1
  %add.4232.5.clone.1 = fadd double %122, %add.4213.9.clone.1
  %127 = select i1 %15, double %add.4213.9.clone.1, double %add.4232.5.clone.1
  %128 = select i1 %.not2, double %122, double %127
  %129 = getelementptr double, ptr addrspace(1) %arg3578, i64 %18
  %130 = load double, ptr addrspace(1) %129, align 8
  %131 = select i1 %15, double %102, double %130
  %132 = select i1 %.not2, double %130, double %131
  %133 = select i1 %.not2, double %126, double %102
  %134 = getelementptr double, ptr addrspace(1) %arg3680, i64 %18
  %135 = load double, ptr addrspace(1) %134, align 8
  %136 = select i1 %15, double %add.4213.9.clone.1, double %135
  %137 = select i1 %.not2, double %135, double %136
  %138 = select i1 %.not2, double %124, double %add.4213.9.clone.1
  %139 = getelementptr double, ptr addrspace(1) %arg3782, i64 %18
  %140 = load double, ptr addrspace(1) %139, align 8
  %141 = select i1 %.not2, double %140, double %25
  %142 = getelementptr double, ptr addrspace(1) %arg3884, i64 %18
  %143 = load double, ptr addrspace(1) %142, align 8
  %144 = select i1 %15, double %25, double %143
  %145 = select i1 %.not2, double %143, double %144
  %146 = getelementptr double, ptr addrspace(1) %arg3986, i64 %18
  %147 = load double, ptr addrspace(1) %146, align 8
  %148 = getelementptr double, ptr addrspace(1) %arg4088, i64 %18
  %149 = load double, ptr addrspace(1) %148, align 8
  %multiply.3008.7.clone.1 = fmul double %multiply.3002.23.clone.1, %140
  %add.4171.7.clone.1 = fadd double %multiply.3008.7.clone.1, %149
  %multiply.3057.3.clone.1 = fmul double %25, %multiply.3002.23.clone.1
  %add.4221.3.clone.1 = fadd double %multiply.3057.3.clone.1, %add.4171.7.clone.1
  %150 = select i1 %15, double %add.4221.3.clone.1, double %147
  %151 = select i1 %.not2, double %147, double %150
  %152 = getelementptr double, ptr addrspace(1) %arg4190, i64 %18
  %153 = load double, ptr addrspace(1) %152, align 8
  %add.4236.5.clone.1 = fadd double %153, %add.4221.3.clone.1
  %154 = select i1 %15, double %add.4221.3.clone.1, double %add.4236.5.clone.1
  %155 = select i1 %.not2, double %153, double %154
  %156 = select i1 %.not2, double %149, double %add.4221.3.clone.1
  %157 = getelementptr double, ptr addrspace(1) %arg4292, i64 %18
  %158 = load double, ptr addrspace(1) %157, align 8
  %159 = select i1 %.not2, double %158, double %117
  %160 = getelementptr double, ptr addrspace(1) %arg4394, i64 %18
  %161 = load double, ptr addrspace(1) %160, align 8
  %162 = select i1 %15, double %117, double %161
  %163 = select i1 %.not2, double %161, double %162
  %164 = getelementptr double, ptr addrspace(1) %arg4496, i64 %18
  %165 = load double, ptr addrspace(1) %164, align 8
  %166 = getelementptr double, ptr addrspace(1) %arg4598, i64 %18
  %167 = load double, ptr addrspace(1) %166, align 8
  %multiply.3007.7.clone.1 = fmul double %multiply.3002.23.clone.1, %158
  %add.4169.7.clone.1 = fadd double %multiply.3007.7.clone.1, %167
  %multiply.3055.3.clone.1 = fmul double %multiply.3002.23.clone.1, %117
  %add.4218.3.clone.1 = fadd double %multiply.3055.3.clone.1, %add.4169.7.clone.1
  %168 = select i1 %15, double %add.4218.3.clone.1, double %165
  %169 = select i1 %.not2, double %165, double %168
  %170 = getelementptr double, ptr addrspace(1) %arg46100, i64 %18
  %171 = load double, ptr addrspace(1) %170, align 8
  %add.4234.5.clone.1 = fadd double %171, %add.4218.3.clone.1
  %172 = select i1 %15, double %add.4218.3.clone.1, double %add.4234.5.clone.1
  %173 = select i1 %.not2, double %171, double %172
  %174 = select i1 %.not2, double %167, double %add.4218.3.clone.1
  %175 = getelementptr double, ptr addrspace(1) %arg47102, i64 %18
  %176 = load double, ptr addrspace(1) %175, align 8
  %177 = select i1 %.not2, double %176, double %add.4214.3.clone.1
  %178 = getelementptr double, ptr addrspace(1) %arg48104, i64 %18
  %179 = load double, ptr addrspace(1) %178, align 8
  %180 = select i1 %15, double %add.4214.3.clone.1, double %179
  %181 = select i1 %.not2, double %179, double %180
  %182 = getelementptr double, ptr addrspace(1) %arg49106, i64 %18
  %183 = load double, ptr addrspace(1) %182, align 8
  %184 = getelementptr double, ptr addrspace(1) %arg50108, i64 %18
  %185 = load double, ptr addrspace(1) %184, align 8
  %multiply.3006.7.clone.1 = fmul double %multiply.3002.23.clone.1, %176
  %add.4168.7.clone.1 = fadd double %multiply.3006.7.clone.1, %185
  %multiply.3053.3.clone.1 = fmul double %multiply.3002.23.clone.1, %add.4214.3.clone.1
  %add.4216.3.clone.1 = fadd double %multiply.3053.3.clone.1, %add.4168.7.clone.1
  %186 = select i1 %15, double %add.4216.3.clone.1, double %183
  %187 = select i1 %.not2, double %183, double %186
  %188 = getelementptr double, ptr addrspace(1) %arg51110, i64 %18
  %189 = load double, ptr addrspace(1) %188, align 8
  %add.4233.5.clone.1 = fadd double %189, %add.4216.3.clone.1
  %190 = select i1 %15, double %add.4216.3.clone.1, double %add.4233.5.clone.1
  %191 = select i1 %.not2, double %189, double %190
  %192 = select i1 %.not2, double %185, double %add.4216.3.clone.1
  %193 = getelementptr double, ptr addrspace(1) %arg52112, i64 %18
  %194 = load double, ptr addrspace(1) %193, align 8
  %195 = select i1 %.not2, double %194, double %92
  %196 = getelementptr double, ptr addrspace(1) %arg53114, i64 %18
  %197 = load double, ptr addrspace(1) %196, align 8
  %198 = select i1 %15, double %92, double %197
  %199 = select i1 %.not2, double %197, double %198
  %200 = getelementptr double, ptr addrspace(1) %arg54116, i64 %18
  %201 = load double, ptr addrspace(1) %200, align 8
  %202 = getelementptr double, ptr addrspace(1) %arg55118, i64 %18
  %203 = load double, ptr addrspace(1) %202, align 8
  %multiply.3004.7.clone.1 = fmul double %multiply.3002.23.clone.1, %194
  %add.4166.7.clone.1 = fadd double %multiply.3004.7.clone.1, %203
  %multiply.3047.3.clone.1 = fmul double %multiply.3002.23.clone.1, %92
  %add.4211.3.clone.1 = fadd double %multiply.3047.3.clone.1, %add.4166.7.clone.1
  %204 = select i1 %15, double %add.4211.3.clone.1, double %201
  %205 = select i1 %.not2, double %201, double %204
  %206 = getelementptr double, ptr addrspace(1) %arg56120, i64 %18
  %207 = load double, ptr addrspace(1) %206, align 8
  %add.4231.5.clone.1 = fadd double %207, %add.4211.3.clone.1
  %208 = select i1 %15, double %add.4211.3.clone.1, double %add.4231.5.clone.1
  %209 = select i1 %.not2, double %207, double %208
  %210 = select i1 %.not2, double %203, double %add.4211.3.clone.1
  %211 = select i1 %.not2, double %54, double %add.4177.7.clone.1
  store double %29, ptr addrspace(1) %19, align 8
  store double %43, ptr addrspace(1) %30, align 8
  store double %50, ptr addrspace(1) %44, align 8
  store double %61, ptr addrspace(1) %51, align 8
  store double %68, ptr addrspace(1) %62, align 8
  store double %75, ptr addrspace(1) %69, align 8
  store double %80, ptr addrspace(1) %76, align 8
  store double %87, ptr addrspace(1) %81, align 8
  store double %95, ptr addrspace(1) %88, align 8
  store double %105, ptr addrspace(1) %96, align 8
  store double %112, ptr addrspace(1) %106, align 8
  store double %120, ptr addrspace(1) %113, align 8
  store double %128, ptr addrspace(1) %121, align 8
  store double %132, ptr addrspace(1) %129, align 8
  store double %133, ptr addrspace(1) %125, align 8
  store double %137, ptr addrspace(1) %134, align 8
  store double %138, ptr addrspace(1) %123, align 8
  store double %141, ptr addrspace(1) %139, align 8
  store double %145, ptr addrspace(1) %142, align 8
  store double %151, ptr addrspace(1) %146, align 8
  store double %155, ptr addrspace(1) %152, align 8
  store double %156, ptr addrspace(1) %148, align 8
  store double %159, ptr addrspace(1) %157, align 8
  store double %163, ptr addrspace(1) %160, align 8
  store double %169, ptr addrspace(1) %164, align 8
  store double %173, ptr addrspace(1) %170, align 8
  store double %174, ptr addrspace(1) %166, align 8
  store double %177, ptr addrspace(1) %175, align 8
  store double %181, ptr addrspace(1) %178, align 8
  store double %187, ptr addrspace(1) %182, align 8
  store double %191, ptr addrspace(1) %188, align 8
  store double %192, ptr addrspace(1) %184, align 8
  store double %195, ptr addrspace(1) %193, align 8
  store double %199, ptr addrspace(1) %196, align 8
  store double %205, ptr addrspace(1) %200, align 8
  store double %209, ptr addrspace(1) %206, align 8
  store double %210, ptr addrspace(1) %202, align 8
  store double %211, ptr addrspace(1) %53, align 8
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg38, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !263
  %4 = getelementptr i64, ptr addrspace(1) %arg410, i64 %1
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !263
  %6 = icmp sge i64 %3, %5
  %7 = getelementptr i8, ptr addrspace(1) %arg14, i64 %1
  %8 = load i8, ptr addrspace(1) %7, align 1
  %9 = getelementptr i8, ptr addrspace(1) %arg26, i64 %1
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !263
  %11 = or i8 %10, %8
  %12 = trunc i8 %11 to i1
  %.not1 = or i1 %6, %12
  %13 = getelementptr i8, ptr addrspace(1) %arg02, i64 %1
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !263
  %15 = select i1 %.not1, i8 %8, i8 %14
  store i8 %15, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_multiply_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg4, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg7, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg10, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg13, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg16, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg38) local_unnamed_addr #6 {
entry:
  %arg38242 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37240 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36238 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35236 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34234 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33232 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32230 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31228 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30226 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29224 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28222 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27220 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26218 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25216 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24214 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23212 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22210 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21208 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20206 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19204 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18202 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg16198 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15196 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg13192 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12190 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg10186 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9184 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg7180 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6178 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg4174 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3172 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg1168 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0166 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !266
  %.urem = add nsw i32 %0, -24
  %.cmp = icmp ult i32 %0, 24
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %2 = icmp ult i32 %1, 12
  br i1 %2, label %concatenate.pivot.4., label %concatenate.pivot.16.

concatenate.pivot.4.:                             ; preds = %entry
  %3 = icmp ult i32 %1, 4
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  %4 = icmp ugt i32 %0, 23
  %5 = select i1 %4, i64 4, i64 0
  %6 = zext i1 %4 to i64
  %7 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg18202, i64 0, i64 %6
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !263
  %9 = getelementptr double, ptr addrspace(1) %arg16198, i64 %5
  %10 = zext nneg i32 %1 to i64
  %11 = getelementptr inbounds double, ptr addrspace(1) %9, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !263
  %13 = trunc i8 %8 to i1
  %14 = getelementptr double, ptr addrspace(1) %arg15196, i64 %5
  %15 = getelementptr inbounds double, ptr addrspace(1) %14, i64 %10
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !263
  %17 = select i1 %13, double %12, double %16
  br label %concatenate.pivot.12.12

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %18 = icmp ugt i32 %0, 23
  %19 = icmp ult i32 %1, 8
  %20 = select i1 %18, i64 4, i64 0
  %21 = zext i1 %18 to i64
  %22 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg18202, i64 0, i64 %21
  %23 = load i8, ptr addrspace(1) %22, align 1, !invariant.load !263
  %24 = trunc i8 %23 to i1
  br i1 %19, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  %25 = add nsw i32 %1, -4
  %26 = getelementptr double, ptr addrspace(1) %arg13192, i64 %20
  %27 = zext nneg i32 %25 to i64
  %28 = getelementptr inbounds double, ptr addrspace(1) %26, i64 %27
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !263
  %30 = getelementptr double, ptr addrspace(1) %arg12190, i64 %20
  %31 = getelementptr inbounds double, ptr addrspace(1) %30, i64 %27
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !263
  %33 = select i1 %24, double %29, double %32
  br label %concatenate.pivot.12.12

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  %34 = add nsw i32 %1, -8
  %35 = getelementptr double, ptr addrspace(1) %arg10186, i64 %20
  %36 = zext nneg i32 %34 to i64
  %37 = getelementptr inbounds double, ptr addrspace(1) %35, i64 %36
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !263
  %39 = getelementptr double, ptr addrspace(1) %arg9184, i64 %20
  %40 = getelementptr inbounds double, ptr addrspace(1) %39, i64 %36
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !263
  %42 = select i1 %24, double %38, double %41
  br label %concatenate.pivot.12.12

concatenate.pivot.16.:                            ; preds = %entry
  %43 = icmp ugt i32 %0, 23
  %44 = icmp ult i32 %1, 16
  %45 = select i1 %43, i64 4, i64 0
  %46 = zext i1 %43 to i64
  %47 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg18202, i64 0, i64 %46
  %48 = load i8, ptr addrspace(1) %47, align 1, !invariant.load !263
  br i1 %44, label %concatenate.pivot.12.3, label %concatenate.pivot.20.

concatenate.pivot.12.3:                           ; preds = %concatenate.pivot.16.
  %49 = add nsw i32 %1, -12
  %50 = getelementptr double, ptr addrspace(1) %arg7180, i64 %45
  %51 = zext nneg i32 %49 to i64
  %52 = getelementptr inbounds double, ptr addrspace(1) %50, i64 %51
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !263
  %54 = trunc i8 %48 to i1
  %55 = getelementptr double, ptr addrspace(1) %arg6178, i64 %45
  %56 = getelementptr inbounds double, ptr addrspace(1) %55, i64 %51
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !263
  %58 = select i1 %54, double %53, double %57
  br label %concatenate.pivot.12.12

concatenate.pivot.20.:                            ; preds = %concatenate.pivot.16.
  %59 = icmp ult i32 %1, 20
  %60 = trunc i8 %48 to i1
  br i1 %59, label %concatenate.pivot.16.4, label %concatenate.pivot.20.5

concatenate.pivot.16.4:                           ; preds = %concatenate.pivot.20.
  %61 = add nsw i32 %1, -16
  %62 = getelementptr double, ptr addrspace(1) %arg4174, i64 %45
  %63 = zext nneg i32 %61 to i64
  %64 = getelementptr inbounds double, ptr addrspace(1) %62, i64 %63
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !263
  %66 = getelementptr double, ptr addrspace(1) %arg3172, i64 %45
  %67 = getelementptr inbounds double, ptr addrspace(1) %66, i64 %63
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !263
  %69 = select i1 %60, double %65, double %68
  br label %concatenate.pivot.12.12

concatenate.pivot.20.5:                           ; preds = %concatenate.pivot.20.
  %70 = add nsw i32 %1, -20
  %71 = getelementptr double, ptr addrspace(1) %arg1168, i64 %45
  %72 = zext nneg i32 %70 to i64
  %73 = getelementptr inbounds double, ptr addrspace(1) %71, i64 %72
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !263
  %75 = getelementptr double, ptr addrspace(1) %arg0166, i64 %45
  %76 = getelementptr inbounds double, ptr addrspace(1) %75, i64 %72
  %77 = load double, ptr addrspace(1) %76, align 8, !invariant.load !263
  %78 = select i1 %60, double %74, double %77
  br label %concatenate.pivot.12.12

concatenate.pivot.12.12:                          ; preds = %concatenate.pivot.0., %concatenate.pivot.4.1, %concatenate.pivot.8.2, %concatenate.pivot.12.3, %concatenate.pivot.16.4, %concatenate.pivot.20.5
  %.off0 = phi i1 [ %13, %concatenate.pivot.0. ], [ %24, %concatenate.pivot.4.1 ], [ %24, %concatenate.pivot.8.2 ], [ %54, %concatenate.pivot.12.3 ], [ %60, %concatenate.pivot.16.4 ], [ %60, %concatenate.pivot.20.5 ]
  %79 = phi double [ %17, %concatenate.pivot.0. ], [ %33, %concatenate.pivot.4.1 ], [ %42, %concatenate.pivot.8.2 ], [ %58, %concatenate.pivot.12.3 ], [ %69, %concatenate.pivot.16.4 ], [ %78, %concatenate.pivot.20.5 ]
  %80 = icmp ult i32 %1, 12
  br i1 %80, label %concatenate.pivot.4.13, label %concatenate.pivot.16.18

concatenate.pivot.4.13:                           ; preds = %concatenate.pivot.12.12
  %81 = icmp ult i32 %1, 4
  br i1 %81, label %concatenate.pivot.0.14, label %concatenate.pivot.8.15

concatenate.pivot.0.14:                           ; preds = %concatenate.pivot.4.13
  %82 = icmp ugt i32 %0, 23
  %83 = select i1 %82, i64 4, i64 0
  %84 = getelementptr double, ptr addrspace(1) %arg36238, i64 %83
  %85 = zext nneg i32 %1 to i64
  %86 = getelementptr inbounds double, ptr addrspace(1) %84, i64 %85
  %87 = getelementptr double, ptr addrspace(1) %arg35236, i64 %83
  %88 = getelementptr inbounds double, ptr addrspace(1) %87, i64 %85
  br label %concatenate.pivot.12.29

concatenate.pivot.8.15:                           ; preds = %concatenate.pivot.4.13
  %89 = icmp ugt i32 %0, 23
  %90 = icmp ult i32 %1, 8
  %91 = select i1 %89, i64 4, i64 0
  br i1 %90, label %concatenate.pivot.4.16, label %concatenate.pivot.8.17

concatenate.pivot.4.16:                           ; preds = %concatenate.pivot.8.15
  %92 = add nsw i32 %1, -4
  %93 = getelementptr double, ptr addrspace(1) %arg34234, i64 %91
  %94 = zext nneg i32 %92 to i64
  %95 = getelementptr inbounds double, ptr addrspace(1) %93, i64 %94
  %96 = getelementptr double, ptr addrspace(1) %arg33232, i64 %91
  %97 = getelementptr inbounds double, ptr addrspace(1) %96, i64 %94
  br label %concatenate.pivot.12.29

concatenate.pivot.8.17:                           ; preds = %concatenate.pivot.8.15
  %98 = add nsw i32 %1, -8
  %99 = getelementptr double, ptr addrspace(1) %arg32230, i64 %91
  %100 = zext nneg i32 %98 to i64
  %101 = getelementptr inbounds double, ptr addrspace(1) %99, i64 %100
  %102 = getelementptr double, ptr addrspace(1) %arg31228, i64 %91
  %103 = getelementptr inbounds double, ptr addrspace(1) %102, i64 %100
  br label %concatenate.pivot.12.29

concatenate.pivot.16.18:                          ; preds = %concatenate.pivot.12.12
  %104 = icmp ugt i32 %0, 23
  %105 = icmp ult i32 %1, 16
  %106 = select i1 %104, i64 4, i64 0
  br i1 %105, label %concatenate.pivot.12.19, label %concatenate.pivot.20.20

concatenate.pivot.12.19:                          ; preds = %concatenate.pivot.16.18
  %107 = add nsw i32 %1, -12
  %108 = getelementptr double, ptr addrspace(1) %arg30226, i64 %106
  %109 = zext nneg i32 %107 to i64
  %110 = getelementptr inbounds double, ptr addrspace(1) %108, i64 %109
  %111 = getelementptr double, ptr addrspace(1) %arg29224, i64 %106
  %112 = getelementptr inbounds double, ptr addrspace(1) %111, i64 %109
  br label %concatenate.pivot.12.29

concatenate.pivot.20.20:                          ; preds = %concatenate.pivot.16.18
  %113 = icmp ult i32 %1, 20
  br i1 %113, label %concatenate.pivot.16.21, label %concatenate.pivot.20.22

concatenate.pivot.16.21:                          ; preds = %concatenate.pivot.20.20
  %114 = add nsw i32 %1, -16
  %115 = getelementptr double, ptr addrspace(1) %arg28222, i64 %106
  %116 = zext nneg i32 %114 to i64
  %117 = getelementptr inbounds double, ptr addrspace(1) %115, i64 %116
  %118 = getelementptr double, ptr addrspace(1) %arg27220, i64 %106
  %119 = getelementptr inbounds double, ptr addrspace(1) %118, i64 %116
  br label %concatenate.pivot.12.29

concatenate.pivot.20.22:                          ; preds = %concatenate.pivot.20.20
  %120 = add nsw i32 %1, -20
  %121 = getelementptr double, ptr addrspace(1) %arg26218, i64 %106
  %122 = zext nneg i32 %120 to i64
  %123 = getelementptr inbounds double, ptr addrspace(1) %121, i64 %122
  %124 = getelementptr double, ptr addrspace(1) %arg25216, i64 %106
  %125 = getelementptr inbounds double, ptr addrspace(1) %124, i64 %122
  br label %concatenate.pivot.12.29

concatenate.pivot.12.29:                          ; preds = %concatenate.pivot.0.14, %concatenate.pivot.4.16, %concatenate.pivot.8.17, %concatenate.pivot.12.19, %concatenate.pivot.16.21, %concatenate.pivot.20.22
  %.sink147 = phi ptr addrspace(1) [ %88, %concatenate.pivot.0.14 ], [ %97, %concatenate.pivot.4.16 ], [ %103, %concatenate.pivot.8.17 ], [ %112, %concatenate.pivot.12.19 ], [ %119, %concatenate.pivot.16.21 ], [ %125, %concatenate.pivot.20.22 ]
  %.sink.in = phi ptr addrspace(1) [ %86, %concatenate.pivot.0.14 ], [ %95, %concatenate.pivot.4.16 ], [ %101, %concatenate.pivot.8.17 ], [ %110, %concatenate.pivot.12.19 ], [ %117, %concatenate.pivot.16.21 ], [ %123, %concatenate.pivot.20.22 ]
  %126 = icmp ult i32 %1, 12
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !263
  %127 = load double, ptr addrspace(1) %.sink147, align 8, !invariant.load !263
  br i1 %126, label %concatenate.pivot.4.30, label %concatenate.pivot.16.35

concatenate.pivot.4.30:                           ; preds = %concatenate.pivot.12.29
  %128 = icmp ult i32 %1, 4
  br i1 %128, label %concatenate.pivot.0.31, label %concatenate.pivot.8.32

concatenate.pivot.0.31:                           ; preds = %concatenate.pivot.4.30
  %129 = icmp ugt i32 %0, 23
  %130 = select i1 %129, i64 4, i64 0
  %131 = getelementptr double, ptr addrspace(1) %arg24214, i64 %130
  %132 = zext nneg i32 %1 to i64
  %133 = getelementptr inbounds double, ptr addrspace(1) %131, i64 %132
  %134 = getelementptr double, ptr addrspace(1) %arg16198, i64 %130
  %135 = getelementptr inbounds double, ptr addrspace(1) %134, i64 %132
  br label %concatenate.pivot.12.47

concatenate.pivot.8.32:                           ; preds = %concatenate.pivot.4.30
  %136 = icmp ugt i32 %0, 23
  %137 = icmp ult i32 %1, 8
  %138 = select i1 %136, i64 4, i64 0
  br i1 %137, label %concatenate.pivot.4.33, label %concatenate.pivot.8.34

concatenate.pivot.4.33:                           ; preds = %concatenate.pivot.8.32
  %139 = add nsw i32 %1, -4
  %140 = getelementptr double, ptr addrspace(1) %arg23212, i64 %138
  %141 = zext nneg i32 %139 to i64
  %142 = getelementptr inbounds double, ptr addrspace(1) %140, i64 %141
  %143 = getelementptr double, ptr addrspace(1) %arg13192, i64 %138
  %144 = getelementptr inbounds double, ptr addrspace(1) %143, i64 %141
  br label %concatenate.pivot.12.47

concatenate.pivot.8.34:                           ; preds = %concatenate.pivot.8.32
  %145 = add nsw i32 %1, -8
  %146 = getelementptr double, ptr addrspace(1) %arg22210, i64 %138
  %147 = zext nneg i32 %145 to i64
  %148 = getelementptr inbounds double, ptr addrspace(1) %146, i64 %147
  %149 = getelementptr double, ptr addrspace(1) %arg10186, i64 %138
  %150 = getelementptr inbounds double, ptr addrspace(1) %149, i64 %147
  br label %concatenate.pivot.12.47

concatenate.pivot.16.35:                          ; preds = %concatenate.pivot.12.29
  %151 = icmp ugt i32 %0, 23
  %152 = icmp ult i32 %1, 16
  %153 = select i1 %151, i64 4, i64 0
  br i1 %152, label %concatenate.pivot.12.36, label %concatenate.pivot.20.37

concatenate.pivot.12.36:                          ; preds = %concatenate.pivot.16.35
  %154 = add nsw i32 %1, -12
  %155 = getelementptr double, ptr addrspace(1) %arg21208, i64 %153
  %156 = zext nneg i32 %154 to i64
  %157 = getelementptr inbounds double, ptr addrspace(1) %155, i64 %156
  %158 = getelementptr double, ptr addrspace(1) %arg7180, i64 %153
  %159 = getelementptr inbounds double, ptr addrspace(1) %158, i64 %156
  br label %concatenate.pivot.12.47

concatenate.pivot.20.37:                          ; preds = %concatenate.pivot.16.35
  %160 = icmp ult i32 %1, 20
  br i1 %160, label %concatenate.pivot.16.38, label %concatenate.pivot.20.39

concatenate.pivot.16.38:                          ; preds = %concatenate.pivot.20.37
  %161 = add nsw i32 %1, -16
  %162 = getelementptr double, ptr addrspace(1) %arg20206, i64 %153
  %163 = zext nneg i32 %161 to i64
  %164 = getelementptr inbounds double, ptr addrspace(1) %162, i64 %163
  %165 = getelementptr double, ptr addrspace(1) %arg4174, i64 %153
  %166 = getelementptr inbounds double, ptr addrspace(1) %165, i64 %163
  br label %concatenate.pivot.12.47

concatenate.pivot.20.39:                          ; preds = %concatenate.pivot.20.37
  %167 = add nsw i32 %1, -20
  %168 = getelementptr double, ptr addrspace(1) %arg19204, i64 %153
  %169 = zext nneg i32 %167 to i64
  %170 = getelementptr inbounds double, ptr addrspace(1) %168, i64 %169
  %171 = getelementptr double, ptr addrspace(1) %arg1168, i64 %153
  %172 = getelementptr inbounds double, ptr addrspace(1) %171, i64 %169
  br label %concatenate.pivot.12.47

concatenate.pivot.12.47:                          ; preds = %concatenate.pivot.0.31, %concatenate.pivot.4.33, %concatenate.pivot.8.34, %concatenate.pivot.12.36, %concatenate.pivot.16.38, %concatenate.pivot.20.39
  %.sink150 = phi ptr addrspace(1) [ %135, %concatenate.pivot.0.31 ], [ %144, %concatenate.pivot.4.33 ], [ %150, %concatenate.pivot.8.34 ], [ %159, %concatenate.pivot.12.36 ], [ %166, %concatenate.pivot.16.38 ], [ %172, %concatenate.pivot.20.39 ]
  %.sink148.in = phi ptr addrspace(1) [ %133, %concatenate.pivot.0.31 ], [ %142, %concatenate.pivot.4.33 ], [ %148, %concatenate.pivot.8.34 ], [ %157, %concatenate.pivot.12.36 ], [ %164, %concatenate.pivot.16.38 ], [ %170, %concatenate.pivot.20.39 ]
  %173 = icmp ult i32 %1, 12
  %.sink148 = load double, ptr addrspace(1) %.sink148.in, align 8, !invariant.load !263
  %174 = load double, ptr addrspace(1) %.sink150, align 8, !invariant.load !263
  br i1 %173, label %concatenate.pivot.4.48, label %concatenate.pivot.16.53

concatenate.pivot.4.48:                           ; preds = %concatenate.pivot.12.47
  %175 = icmp ult i32 %1, 4
  br i1 %175, label %concatenate.pivot.0.49, label %concatenate.pivot.8.50

concatenate.pivot.0.49:                           ; preds = %concatenate.pivot.4.48
  %176 = icmp ugt i32 %0, 23
  %177 = select i1 %176, i64 4, i64 0
  %178 = getelementptr double, ptr addrspace(1) %arg16198, i64 %177
  %179 = zext nneg i32 %1 to i64
  %180 = getelementptr inbounds double, ptr addrspace(1) %178, i64 %179
  %181 = getelementptr double, ptr addrspace(1) %arg15196, i64 %177
  %182 = getelementptr inbounds double, ptr addrspace(1) %181, i64 %179
  br label %concatenate.44.5.merge40

concatenate.pivot.8.50:                           ; preds = %concatenate.pivot.4.48
  %183 = icmp ugt i32 %0, 23
  %184 = icmp ult i32 %1, 8
  %185 = select i1 %183, i64 4, i64 0
  br i1 %184, label %concatenate.pivot.4.51, label %concatenate.pivot.8.52

concatenate.pivot.4.51:                           ; preds = %concatenate.pivot.8.50
  %186 = add nsw i32 %1, -4
  %187 = getelementptr double, ptr addrspace(1) %arg13192, i64 %185
  %188 = zext nneg i32 %186 to i64
  %189 = getelementptr inbounds double, ptr addrspace(1) %187, i64 %188
  %190 = getelementptr double, ptr addrspace(1) %arg12190, i64 %185
  %191 = getelementptr inbounds double, ptr addrspace(1) %190, i64 %188
  br label %concatenate.44.5.merge40

concatenate.pivot.8.52:                           ; preds = %concatenate.pivot.8.50
  %192 = add nsw i32 %1, -8
  %193 = getelementptr double, ptr addrspace(1) %arg10186, i64 %185
  %194 = zext nneg i32 %192 to i64
  %195 = getelementptr inbounds double, ptr addrspace(1) %193, i64 %194
  %196 = getelementptr double, ptr addrspace(1) %arg9184, i64 %185
  %197 = getelementptr inbounds double, ptr addrspace(1) %196, i64 %194
  br label %concatenate.44.5.merge40

concatenate.pivot.16.53:                          ; preds = %concatenate.pivot.12.47
  %198 = icmp ugt i32 %0, 23
  %199 = icmp ult i32 %1, 16
  %200 = select i1 %198, i64 4, i64 0
  br i1 %199, label %concatenate.pivot.12.54, label %concatenate.pivot.20.55

concatenate.pivot.12.54:                          ; preds = %concatenate.pivot.16.53
  %201 = add nsw i32 %1, -12
  %202 = getelementptr double, ptr addrspace(1) %arg7180, i64 %200
  %203 = zext nneg i32 %201 to i64
  %204 = getelementptr inbounds double, ptr addrspace(1) %202, i64 %203
  %205 = getelementptr double, ptr addrspace(1) %arg6178, i64 %200
  %206 = getelementptr inbounds double, ptr addrspace(1) %205, i64 %203
  br label %concatenate.44.5.merge40

concatenate.pivot.20.55:                          ; preds = %concatenate.pivot.16.53
  %207 = icmp ult i32 %1, 20
  br i1 %207, label %concatenate.pivot.16.56, label %concatenate.pivot.20.57

concatenate.pivot.16.56:                          ; preds = %concatenate.pivot.20.55
  %208 = add nsw i32 %1, -16
  %209 = getelementptr double, ptr addrspace(1) %arg4174, i64 %200
  %210 = zext nneg i32 %208 to i64
  %211 = getelementptr inbounds double, ptr addrspace(1) %209, i64 %210
  %212 = getelementptr double, ptr addrspace(1) %arg3172, i64 %200
  %213 = getelementptr inbounds double, ptr addrspace(1) %212, i64 %210
  br label %concatenate.44.5.merge40

concatenate.pivot.20.57:                          ; preds = %concatenate.pivot.20.55
  %214 = add nsw i32 %1, -20
  %215 = getelementptr double, ptr addrspace(1) %arg1168, i64 %200
  %216 = zext nneg i32 %214 to i64
  %217 = getelementptr inbounds double, ptr addrspace(1) %215, i64 %216
  %218 = getelementptr double, ptr addrspace(1) %arg0166, i64 %200
  %219 = getelementptr inbounds double, ptr addrspace(1) %218, i64 %216
  br label %concatenate.44.5.merge40

concatenate.44.5.merge40:                         ; preds = %concatenate.pivot.20.57, %concatenate.pivot.16.56, %concatenate.pivot.12.54, %concatenate.pivot.8.52, %concatenate.pivot.4.51, %concatenate.pivot.0.49
  %.sink153 = phi ptr addrspace(1) [ %219, %concatenate.pivot.20.57 ], [ %213, %concatenate.pivot.16.56 ], [ %206, %concatenate.pivot.12.54 ], [ %197, %concatenate.pivot.8.52 ], [ %191, %concatenate.pivot.4.51 ], [ %182, %concatenate.pivot.0.49 ]
  %.sink151.in = phi ptr addrspace(1) [ %217, %concatenate.pivot.20.57 ], [ %211, %concatenate.pivot.16.56 ], [ %204, %concatenate.pivot.12.54 ], [ %195, %concatenate.pivot.8.52 ], [ %189, %concatenate.pivot.4.51 ], [ %180, %concatenate.pivot.0.49 ]
  %220 = icmp ult i32 %1, 12
  %.sink151 = load double, ptr addrspace(1) %.sink151.in, align 8, !invariant.load !263
  %221 = load double, ptr addrspace(1) %.sink153, align 8, !invariant.load !263
  br i1 %220, label %concatenate.pivot.4.66, label %concatenate.pivot.16.71

concatenate.pivot.4.66:                           ; preds = %concatenate.44.5.merge40
  %222 = icmp ult i32 %1, 4
  br i1 %222, label %concatenate.pivot.0.67, label %concatenate.pivot.8.68

concatenate.pivot.0.67:                           ; preds = %concatenate.pivot.4.66
  %223 = icmp ugt i32 %0, 23
  %224 = select i1 %223, i64 4, i64 0
  %225 = getelementptr double, ptr addrspace(1) %arg24214, i64 %224
  %226 = zext nneg i32 %1 to i64
  %227 = getelementptr inbounds double, ptr addrspace(1) %225, i64 %226
  %228 = getelementptr double, ptr addrspace(1) %arg16198, i64 %224
  %229 = getelementptr inbounds double, ptr addrspace(1) %228, i64 %226
  br label %concatenate.pivot.12.89

concatenate.pivot.8.68:                           ; preds = %concatenate.pivot.4.66
  %230 = icmp ugt i32 %0, 23
  %231 = icmp ult i32 %1, 8
  %232 = select i1 %230, i64 4, i64 0
  br i1 %231, label %concatenate.pivot.4.69, label %concatenate.pivot.8.70

concatenate.pivot.4.69:                           ; preds = %concatenate.pivot.8.68
  %233 = add nsw i32 %1, -4
  %234 = getelementptr double, ptr addrspace(1) %arg23212, i64 %232
  %235 = zext nneg i32 %233 to i64
  %236 = getelementptr inbounds double, ptr addrspace(1) %234, i64 %235
  %237 = getelementptr double, ptr addrspace(1) %arg13192, i64 %232
  %238 = getelementptr inbounds double, ptr addrspace(1) %237, i64 %235
  br label %concatenate.pivot.12.89

concatenate.pivot.8.70:                           ; preds = %concatenate.pivot.8.68
  %239 = add nsw i32 %1, -8
  %240 = getelementptr double, ptr addrspace(1) %arg22210, i64 %232
  %241 = zext nneg i32 %239 to i64
  %242 = getelementptr inbounds double, ptr addrspace(1) %240, i64 %241
  %243 = getelementptr double, ptr addrspace(1) %arg10186, i64 %232
  %244 = getelementptr inbounds double, ptr addrspace(1) %243, i64 %241
  br label %concatenate.pivot.12.89

concatenate.pivot.16.71:                          ; preds = %concatenate.44.5.merge40
  %245 = icmp ugt i32 %0, 23
  %246 = icmp ult i32 %1, 16
  %247 = select i1 %245, i64 4, i64 0
  br i1 %246, label %concatenate.pivot.12.72, label %concatenate.pivot.20.73

concatenate.pivot.12.72:                          ; preds = %concatenate.pivot.16.71
  %248 = add nsw i32 %1, -12
  %249 = getelementptr double, ptr addrspace(1) %arg21208, i64 %247
  %250 = zext nneg i32 %248 to i64
  %251 = getelementptr inbounds double, ptr addrspace(1) %249, i64 %250
  %252 = getelementptr double, ptr addrspace(1) %arg7180, i64 %247
  %253 = getelementptr inbounds double, ptr addrspace(1) %252, i64 %250
  br label %concatenate.pivot.12.89

concatenate.pivot.20.73:                          ; preds = %concatenate.pivot.16.71
  %254 = icmp ult i32 %1, 20
  br i1 %254, label %concatenate.pivot.16.74, label %concatenate.pivot.20.75

concatenate.pivot.16.74:                          ; preds = %concatenate.pivot.20.73
  %255 = add nsw i32 %1, -16
  %256 = getelementptr double, ptr addrspace(1) %arg20206, i64 %247
  %257 = zext nneg i32 %255 to i64
  %258 = getelementptr inbounds double, ptr addrspace(1) %256, i64 %257
  %259 = getelementptr double, ptr addrspace(1) %arg4174, i64 %247
  %260 = getelementptr inbounds double, ptr addrspace(1) %259, i64 %257
  br label %concatenate.pivot.12.89

concatenate.pivot.20.75:                          ; preds = %concatenate.pivot.20.73
  %261 = add nsw i32 %1, -20
  %262 = getelementptr double, ptr addrspace(1) %arg19204, i64 %247
  %263 = zext nneg i32 %261 to i64
  %264 = getelementptr inbounds double, ptr addrspace(1) %262, i64 %263
  %265 = getelementptr double, ptr addrspace(1) %arg1168, i64 %247
  %266 = getelementptr inbounds double, ptr addrspace(1) %265, i64 %263
  br label %concatenate.pivot.12.89

concatenate.pivot.12.89:                          ; preds = %concatenate.pivot.0.67, %concatenate.pivot.4.69, %concatenate.pivot.8.70, %concatenate.pivot.12.72, %concatenate.pivot.16.74, %concatenate.pivot.20.75
  %.sink156 = phi ptr addrspace(1) [ %229, %concatenate.pivot.0.67 ], [ %238, %concatenate.pivot.4.69 ], [ %244, %concatenate.pivot.8.70 ], [ %253, %concatenate.pivot.12.72 ], [ %260, %concatenate.pivot.16.74 ], [ %266, %concatenate.pivot.20.75 ]
  %.sink154.in = phi ptr addrspace(1) [ %227, %concatenate.pivot.0.67 ], [ %236, %concatenate.pivot.4.69 ], [ %242, %concatenate.pivot.8.70 ], [ %251, %concatenate.pivot.12.72 ], [ %258, %concatenate.pivot.16.74 ], [ %264, %concatenate.pivot.20.75 ]
  %267 = icmp ult i32 %1, 12
  %.sink154 = load double, ptr addrspace(1) %.sink154.in, align 8, !invariant.load !263
  %268 = load double, ptr addrspace(1) %.sink156, align 8, !invariant.load !263
  br i1 %267, label %concatenate.pivot.4.90, label %concatenate.pivot.16.95

concatenate.pivot.4.90:                           ; preds = %concatenate.pivot.12.89
  %269 = icmp ult i32 %1, 4
  br i1 %269, label %concatenate.pivot.0.91, label %concatenate.pivot.8.92

concatenate.pivot.0.91:                           ; preds = %concatenate.pivot.4.90
  %270 = icmp ugt i32 %0, 23
  %271 = select i1 %270, i64 4, i64 0
  %272 = getelementptr double, ptr addrspace(1) %arg36238, i64 %271
  %273 = zext nneg i32 %1 to i64
  %274 = getelementptr inbounds double, ptr addrspace(1) %272, i64 %273
  %275 = getelementptr double, ptr addrspace(1) %arg35236, i64 %271
  %276 = getelementptr inbounds double, ptr addrspace(1) %275, i64 %273
  br label %concatenate.pivot.12.107

concatenate.pivot.8.92:                           ; preds = %concatenate.pivot.4.90
  %277 = icmp ugt i32 %0, 23
  %278 = icmp ult i32 %1, 8
  %279 = select i1 %277, i64 4, i64 0
  br i1 %278, label %concatenate.pivot.4.93, label %concatenate.pivot.8.94

concatenate.pivot.4.93:                           ; preds = %concatenate.pivot.8.92
  %280 = add nsw i32 %1, -4
  %281 = getelementptr double, ptr addrspace(1) %arg34234, i64 %279
  %282 = zext nneg i32 %280 to i64
  %283 = getelementptr inbounds double, ptr addrspace(1) %281, i64 %282
  %284 = getelementptr double, ptr addrspace(1) %arg33232, i64 %279
  %285 = getelementptr inbounds double, ptr addrspace(1) %284, i64 %282
  br label %concatenate.pivot.12.107

concatenate.pivot.8.94:                           ; preds = %concatenate.pivot.8.92
  %286 = add nsw i32 %1, -8
  %287 = getelementptr double, ptr addrspace(1) %arg32230, i64 %279
  %288 = zext nneg i32 %286 to i64
  %289 = getelementptr inbounds double, ptr addrspace(1) %287, i64 %288
  %290 = getelementptr double, ptr addrspace(1) %arg31228, i64 %279
  %291 = getelementptr inbounds double, ptr addrspace(1) %290, i64 %288
  br label %concatenate.pivot.12.107

concatenate.pivot.16.95:                          ; preds = %concatenate.pivot.12.89
  %292 = icmp ugt i32 %0, 23
  %293 = icmp ult i32 %1, 16
  %294 = select i1 %292, i64 4, i64 0
  br i1 %293, label %concatenate.pivot.12.96, label %concatenate.pivot.20.97

concatenate.pivot.12.96:                          ; preds = %concatenate.pivot.16.95
  %295 = add nsw i32 %1, -12
  %296 = getelementptr double, ptr addrspace(1) %arg30226, i64 %294
  %297 = zext nneg i32 %295 to i64
  %298 = getelementptr inbounds double, ptr addrspace(1) %296, i64 %297
  %299 = getelementptr double, ptr addrspace(1) %arg29224, i64 %294
  %300 = getelementptr inbounds double, ptr addrspace(1) %299, i64 %297
  br label %concatenate.pivot.12.107

concatenate.pivot.20.97:                          ; preds = %concatenate.pivot.16.95
  %301 = icmp ult i32 %1, 20
  br i1 %301, label %concatenate.pivot.16.98, label %concatenate.pivot.20.99

concatenate.pivot.16.98:                          ; preds = %concatenate.pivot.20.97
  %302 = add nsw i32 %1, -16
  %303 = getelementptr double, ptr addrspace(1) %arg28222, i64 %294
  %304 = zext nneg i32 %302 to i64
  %305 = getelementptr inbounds double, ptr addrspace(1) %303, i64 %304
  %306 = getelementptr double, ptr addrspace(1) %arg27220, i64 %294
  %307 = getelementptr inbounds double, ptr addrspace(1) %306, i64 %304
  br label %concatenate.pivot.12.107

concatenate.pivot.20.99:                          ; preds = %concatenate.pivot.20.97
  %308 = add nsw i32 %1, -20
  %309 = getelementptr double, ptr addrspace(1) %arg26218, i64 %294
  %310 = zext nneg i32 %308 to i64
  %311 = getelementptr inbounds double, ptr addrspace(1) %309, i64 %310
  %312 = getelementptr double, ptr addrspace(1) %arg25216, i64 %294
  %313 = getelementptr inbounds double, ptr addrspace(1) %312, i64 %310
  br label %concatenate.pivot.12.107

concatenate.pivot.12.107:                         ; preds = %concatenate.pivot.0.91, %concatenate.pivot.4.93, %concatenate.pivot.8.94, %concatenate.pivot.12.96, %concatenate.pivot.16.98, %concatenate.pivot.20.99
  %.sink159 = phi ptr addrspace(1) [ %276, %concatenate.pivot.0.91 ], [ %285, %concatenate.pivot.4.93 ], [ %291, %concatenate.pivot.8.94 ], [ %300, %concatenate.pivot.12.96 ], [ %307, %concatenate.pivot.16.98 ], [ %313, %concatenate.pivot.20.99 ]
  %.sink157.in = phi ptr addrspace(1) [ %274, %concatenate.pivot.0.91 ], [ %283, %concatenate.pivot.4.93 ], [ %289, %concatenate.pivot.8.94 ], [ %298, %concatenate.pivot.12.96 ], [ %305, %concatenate.pivot.16.98 ], [ %311, %concatenate.pivot.20.99 ]
  %314 = icmp ult i32 %1, 12
  %.sink157 = load double, ptr addrspace(1) %.sink157.in, align 8, !invariant.load !263
  %315 = load double, ptr addrspace(1) %.sink159, align 8, !invariant.load !263
  br i1 %314, label %concatenate.pivot.4.108, label %concatenate.pivot.16.113

concatenate.pivot.4.108:                          ; preds = %concatenate.pivot.12.107
  %316 = icmp ult i32 %1, 4
  br i1 %316, label %concatenate.pivot.0.109, label %concatenate.pivot.8.110

concatenate.pivot.0.109:                          ; preds = %concatenate.pivot.4.108
  %317 = icmp ugt i32 %0, 23
  %318 = select i1 %317, i64 4, i64 0
  %319 = getelementptr double, ptr addrspace(1) %arg24214, i64 %318
  %320 = zext nneg i32 %1 to i64
  %321 = getelementptr inbounds double, ptr addrspace(1) %319, i64 %320
  %322 = getelementptr double, ptr addrspace(1) %arg16198, i64 %318
  %323 = getelementptr inbounds double, ptr addrspace(1) %322, i64 %320
  br label %concatenate.pivot.12.125

concatenate.pivot.8.110:                          ; preds = %concatenate.pivot.4.108
  %324 = icmp ugt i32 %0, 23
  %325 = icmp ult i32 %1, 8
  %326 = select i1 %324, i64 4, i64 0
  br i1 %325, label %concatenate.pivot.4.111, label %concatenate.pivot.8.112

concatenate.pivot.4.111:                          ; preds = %concatenate.pivot.8.110
  %327 = add nsw i32 %1, -4
  %328 = getelementptr double, ptr addrspace(1) %arg23212, i64 %326
  %329 = zext nneg i32 %327 to i64
  %330 = getelementptr inbounds double, ptr addrspace(1) %328, i64 %329
  %331 = getelementptr double, ptr addrspace(1) %arg13192, i64 %326
  %332 = getelementptr inbounds double, ptr addrspace(1) %331, i64 %329
  br label %concatenate.pivot.12.125

concatenate.pivot.8.112:                          ; preds = %concatenate.pivot.8.110
  %333 = add nsw i32 %1, -8
  %334 = getelementptr double, ptr addrspace(1) %arg22210, i64 %326
  %335 = zext nneg i32 %333 to i64
  %336 = getelementptr inbounds double, ptr addrspace(1) %334, i64 %335
  %337 = getelementptr double, ptr addrspace(1) %arg10186, i64 %326
  %338 = getelementptr inbounds double, ptr addrspace(1) %337, i64 %335
  br label %concatenate.pivot.12.125

concatenate.pivot.16.113:                         ; preds = %concatenate.pivot.12.107
  %339 = icmp ugt i32 %0, 23
  %340 = icmp ult i32 %1, 16
  %341 = select i1 %339, i64 4, i64 0
  br i1 %340, label %concatenate.pivot.12.114, label %concatenate.pivot.20.115

concatenate.pivot.12.114:                         ; preds = %concatenate.pivot.16.113
  %342 = add nsw i32 %1, -12
  %343 = getelementptr double, ptr addrspace(1) %arg21208, i64 %341
  %344 = zext nneg i32 %342 to i64
  %345 = getelementptr inbounds double, ptr addrspace(1) %343, i64 %344
  %346 = getelementptr double, ptr addrspace(1) %arg7180, i64 %341
  %347 = getelementptr inbounds double, ptr addrspace(1) %346, i64 %344
  br label %concatenate.pivot.12.125

concatenate.pivot.20.115:                         ; preds = %concatenate.pivot.16.113
  %348 = icmp ult i32 %1, 20
  br i1 %348, label %concatenate.pivot.16.116, label %concatenate.pivot.20.117

concatenate.pivot.16.116:                         ; preds = %concatenate.pivot.20.115
  %349 = add nsw i32 %1, -16
  %350 = getelementptr double, ptr addrspace(1) %arg20206, i64 %341
  %351 = zext nneg i32 %349 to i64
  %352 = getelementptr inbounds double, ptr addrspace(1) %350, i64 %351
  %353 = getelementptr double, ptr addrspace(1) %arg4174, i64 %341
  %354 = getelementptr inbounds double, ptr addrspace(1) %353, i64 %351
  br label %concatenate.pivot.12.125

concatenate.pivot.20.117:                         ; preds = %concatenate.pivot.20.115
  %355 = add nsw i32 %1, -20
  %356 = getelementptr double, ptr addrspace(1) %arg19204, i64 %341
  %357 = zext nneg i32 %355 to i64
  %358 = getelementptr inbounds double, ptr addrspace(1) %356, i64 %357
  %359 = getelementptr double, ptr addrspace(1) %arg1168, i64 %341
  %360 = getelementptr inbounds double, ptr addrspace(1) %359, i64 %357
  br label %concatenate.pivot.12.125

concatenate.pivot.12.125:                         ; preds = %concatenate.pivot.0.109, %concatenate.pivot.4.111, %concatenate.pivot.8.112, %concatenate.pivot.12.114, %concatenate.pivot.16.116, %concatenate.pivot.20.117
  %.sink162 = phi ptr addrspace(1) [ %323, %concatenate.pivot.0.109 ], [ %332, %concatenate.pivot.4.111 ], [ %338, %concatenate.pivot.8.112 ], [ %347, %concatenate.pivot.12.114 ], [ %354, %concatenate.pivot.16.116 ], [ %360, %concatenate.pivot.20.117 ]
  %.sink160.in = phi ptr addrspace(1) [ %321, %concatenate.pivot.0.109 ], [ %330, %concatenate.pivot.4.111 ], [ %336, %concatenate.pivot.8.112 ], [ %345, %concatenate.pivot.12.114 ], [ %352, %concatenate.pivot.16.116 ], [ %358, %concatenate.pivot.20.117 ]
  %361 = icmp ult i32 %1, 12
  %.sink160 = load double, ptr addrspace(1) %.sink160.in, align 8, !invariant.load !263
  %362 = load double, ptr addrspace(1) %.sink162, align 8, !invariant.load !263
  br i1 %361, label %concatenate.pivot.4.126, label %concatenate.pivot.16.131

concatenate.pivot.4.126:                          ; preds = %concatenate.pivot.12.125
  %363 = icmp ult i32 %1, 4
  br i1 %363, label %concatenate.pivot.0.127, label %concatenate.pivot.8.128

concatenate.pivot.0.127:                          ; preds = %concatenate.pivot.4.126
  %364 = icmp ugt i32 %0, 23
  %365 = select i1 %364, i64 4, i64 0
  %366 = getelementptr double, ptr addrspace(1) %arg16198, i64 %365
  %367 = zext nneg i32 %1 to i64
  %368 = getelementptr inbounds double, ptr addrspace(1) %366, i64 %367
  %369 = getelementptr double, ptr addrspace(1) %arg15196, i64 %365
  %370 = getelementptr inbounds double, ptr addrspace(1) %369, i64 %367
  br label %concatenate.44.5.merge118

concatenate.pivot.8.128:                          ; preds = %concatenate.pivot.4.126
  %371 = icmp ugt i32 %0, 23
  %372 = icmp ult i32 %1, 8
  %373 = select i1 %371, i64 4, i64 0
  br i1 %372, label %concatenate.pivot.4.129, label %concatenate.pivot.8.130

concatenate.pivot.4.129:                          ; preds = %concatenate.pivot.8.128
  %374 = add nsw i32 %1, -4
  %375 = getelementptr double, ptr addrspace(1) %arg13192, i64 %373
  %376 = zext nneg i32 %374 to i64
  %377 = getelementptr inbounds double, ptr addrspace(1) %375, i64 %376
  %378 = getelementptr double, ptr addrspace(1) %arg12190, i64 %373
  %379 = getelementptr inbounds double, ptr addrspace(1) %378, i64 %376
  br label %concatenate.44.5.merge118

concatenate.pivot.8.130:                          ; preds = %concatenate.pivot.8.128
  %380 = add nsw i32 %1, -8
  %381 = getelementptr double, ptr addrspace(1) %arg10186, i64 %373
  %382 = zext nneg i32 %380 to i64
  %383 = getelementptr inbounds double, ptr addrspace(1) %381, i64 %382
  %384 = getelementptr double, ptr addrspace(1) %arg9184, i64 %373
  %385 = getelementptr inbounds double, ptr addrspace(1) %384, i64 %382
  br label %concatenate.44.5.merge118

concatenate.pivot.16.131:                         ; preds = %concatenate.pivot.12.125
  %386 = icmp ugt i32 %0, 23
  %387 = icmp ult i32 %1, 16
  %388 = select i1 %386, i64 4, i64 0
  br i1 %387, label %concatenate.pivot.12.132, label %concatenate.pivot.20.133

concatenate.pivot.12.132:                         ; preds = %concatenate.pivot.16.131
  %389 = add nsw i32 %1, -12
  %390 = getelementptr double, ptr addrspace(1) %arg7180, i64 %388
  %391 = zext nneg i32 %389 to i64
  %392 = getelementptr inbounds double, ptr addrspace(1) %390, i64 %391
  %393 = getelementptr double, ptr addrspace(1) %arg6178, i64 %388
  %394 = getelementptr inbounds double, ptr addrspace(1) %393, i64 %391
  br label %concatenate.44.5.merge118

concatenate.pivot.20.133:                         ; preds = %concatenate.pivot.16.131
  %395 = icmp ult i32 %1, 20
  br i1 %395, label %concatenate.pivot.16.134, label %concatenate.pivot.20.135

concatenate.pivot.16.134:                         ; preds = %concatenate.pivot.20.133
  %396 = add nsw i32 %1, -16
  %397 = getelementptr double, ptr addrspace(1) %arg4174, i64 %388
  %398 = zext nneg i32 %396 to i64
  %399 = getelementptr inbounds double, ptr addrspace(1) %397, i64 %398
  %400 = getelementptr double, ptr addrspace(1) %arg3172, i64 %388
  %401 = getelementptr inbounds double, ptr addrspace(1) %400, i64 %398
  br label %concatenate.44.5.merge118

concatenate.pivot.20.135:                         ; preds = %concatenate.pivot.20.133
  %402 = add nsw i32 %1, -20
  %403 = getelementptr double, ptr addrspace(1) %arg1168, i64 %388
  %404 = zext nneg i32 %402 to i64
  %405 = getelementptr inbounds double, ptr addrspace(1) %403, i64 %404
  %406 = getelementptr double, ptr addrspace(1) %arg0166, i64 %388
  %407 = getelementptr inbounds double, ptr addrspace(1) %406, i64 %404
  br label %concatenate.44.5.merge118

concatenate.44.5.merge118:                        ; preds = %concatenate.pivot.20.135, %concatenate.pivot.16.134, %concatenate.pivot.12.132, %concatenate.pivot.8.130, %concatenate.pivot.4.129, %concatenate.pivot.0.127
  %.sink165 = phi ptr addrspace(1) [ %407, %concatenate.pivot.20.135 ], [ %401, %concatenate.pivot.16.134 ], [ %394, %concatenate.pivot.12.132 ], [ %385, %concatenate.pivot.8.130 ], [ %379, %concatenate.pivot.4.129 ], [ %370, %concatenate.pivot.0.127 ]
  %.sink163.in = phi ptr addrspace(1) [ %405, %concatenate.pivot.20.135 ], [ %399, %concatenate.pivot.16.134 ], [ %392, %concatenate.pivot.12.132 ], [ %383, %concatenate.pivot.8.130 ], [ %377, %concatenate.pivot.4.129 ], [ %368, %concatenate.pivot.0.127 ]
  %.sink163 = load double, ptr addrspace(1) %.sink163.in, align 8, !invariant.load !263
  %408 = select i1 %.off0, double %.sink160, double %362
  %add.4425.978 = fadd double %.sink157, %315
  %409 = select i1 %.off0, double %.sink154, double %268
  %410 = select i1 %.off0, double %.sink151, double %221
  %411 = select i1 %.off0, double %.sink148, double %174
  %add.4425.9 = fadd double %.sink, %127
  %412 = load double, ptr addrspace(1) %.sink165, align 8, !invariant.load !263
  %413 = select i1 %.off0, double %.sink163, double %412
  %add.4432.5 = fadd double %411, %410
  %multiply.3067.7 = fmul double %add.4432.5, 5.000000e-01
  %subtract.239.5 = fsub double %add.4425.9, %multiply.3067.7
  %multiply.3068.1 = fmul double %79, %subtract.239.5
  %add.4432.5136 = fadd double %408, %413
  %multiply.3067.7138 = fmul double %add.4432.5136, 5.000000e-01
  %subtract.239.5139 = fsub double %add.4425.978, %multiply.3067.7138
  %multiply.3069.1.clone.1 = fmul double %409, %subtract.239.5139
  %414 = zext nneg i32 %0 to i64
  %415 = getelementptr double, ptr addrspace(1) %arg37240, i64 %414
  store double %multiply.3068.1, ptr addrspace(1) %415, align 8
  %416 = getelementptr double, ptr addrspace(1) %arg38242, i64 %414
  store double %multiply.3069.1.clone.1, ptr addrspace(1) %416, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_5(ptr noalias nocapture align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture align 128 dereferenceable(64) %arg7, ptr noalias nocapture align 128 dereferenceable(64) %arg8, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg10, ptr noalias nocapture align 128 dereferenceable(64) %arg11, ptr noalias nocapture align 128 dereferenceable(64) %arg12, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg14, ptr noalias nocapture align 128 dereferenceable(64) %arg15, ptr noalias nocapture align 128 dereferenceable(64) %arg16, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg18, ptr noalias nocapture align 128 dereferenceable(64) %arg19, ptr noalias nocapture align 128 dereferenceable(64) %arg20, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg22, ptr noalias nocapture align 128 dereferenceable(64) %arg23, ptr noalias nocapture align 128 dereferenceable(64) %arg24, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg26, ptr noalias nocapture align 128 dereferenceable(64) %arg27, ptr noalias nocapture align 128 dereferenceable(64) %arg28, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg30, ptr noalias nocapture align 128 dereferenceable(64) %arg31, ptr noalias nocapture align 128 dereferenceable(64) %arg32, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg34, ptr noalias nocapture align 128 dereferenceable(64) %arg35, ptr noalias nocapture align 128 dereferenceable(64) %arg36, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg38, ptr noalias nocapture align 128 dereferenceable(64) %arg39, ptr noalias nocapture align 128 dereferenceable(64) %arg40, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg42, ptr noalias nocapture align 128 dereferenceable(64) %arg43, ptr noalias nocapture align 128 dereferenceable(64) %arg44, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg45, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg46, ptr noalias nocapture align 128 dereferenceable(64) %arg47, ptr noalias nocapture align 128 dereferenceable(64) %arg48, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg50, ptr noalias nocapture align 128 dereferenceable(64) %arg51, ptr noalias nocapture align 128 dereferenceable(64) %arg52, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg54, ptr noalias nocapture align 128 dereferenceable(64) %arg55, ptr noalias nocapture align 128 dereferenceable(64) %arg56, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg57, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg58, ptr noalias nocapture align 128 dereferenceable(64) %arg59, ptr noalias nocapture align 128 dereferenceable(64) %arg60, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg61, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg62, ptr noalias nocapture align 128 dereferenceable(64) %arg63) local_unnamed_addr #2 {
entry:
  %arg63134 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62132 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg60128 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59126 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58124 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg56120 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55118 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54116 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg52112 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51110 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50108 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg48104 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47102 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46100 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg4496 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg4394 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg4292 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg4088 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg3986 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg3884 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg3680 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3578 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg3476 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3272 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg3170 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3068 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2864 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2762 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2660 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2456 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2354 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2252 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1946 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1538 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1436 = addrspacecast ptr %arg14 to ptr addrspace(1)
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = zext nneg i32 %1 to i64
  %3 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg620, i64 0, i64 %2
  %4 = load i64, ptr addrspace(1) %3, align 8, !invariant.load !263
  %5 = icmp sgt i64 %4, 9
  %6 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg518, i64 0, i64 %2
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !263
  %8 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg416, i64 0, i64 %2
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !263
  %10 = or i8 %9, %7
  %11 = trunc i8 %10 to i1
  %.not1 = or i1 %5, %11
  %12 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg314, i64 0, i64 %2
  %13 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !263
  %14 = zext nneg i32 %0 to i64
  %15 = getelementptr double, ptr addrspace(1) %arg110, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !263
  %17 = trunc i8 %13 to i1
  %18 = getelementptr double, ptr addrspace(1) %arg02, i64 %14
  %19 = load double, ptr addrspace(1) %18, align 8
  %20 = select i1 %17, double %16, double %19
  %21 = select i1 %.not1, double %19, double %20
  %22 = getelementptr double, ptr addrspace(1) %arg722, i64 %14
  %23 = load double, ptr addrspace(1) %22, align 8
  %24 = select i1 %.not1, i1 true, i1 %17
  %25 = select i1 %24, double %23, double %16
  %26 = getelementptr double, ptr addrspace(1) %arg824, i64 %14
  %27 = load double, ptr addrspace(1) %26, align 8
  %28 = getelementptr double, ptr addrspace(1) %arg1028, i64 %14
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !263
  %30 = select i1 %24, double %27, double %29
  %31 = getelementptr double, ptr addrspace(1) %arg1130, i64 %14
  %32 = load double, ptr addrspace(1) %31, align 8
  %33 = select i1 %17, double %29, double %32
  %34 = select i1 %.not1, double %32, double %33
  %35 = getelementptr double, ptr addrspace(1) %arg1232, i64 %14
  %36 = load double, ptr addrspace(1) %35, align 8
  %37 = getelementptr double, ptr addrspace(1) %arg1436, i64 %14
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !263
  %39 = select i1 %24, double %36, double %38
  %40 = getelementptr double, ptr addrspace(1) %arg1538, i64 %14
  %41 = load double, ptr addrspace(1) %40, align 8
  %42 = select i1 %17, double %38, double %41
  %43 = select i1 %.not1, double %41, double %42
  %44 = getelementptr double, ptr addrspace(1) %arg1640, i64 %14
  %45 = load double, ptr addrspace(1) %44, align 8
  %46 = getelementptr double, ptr addrspace(1) %arg1844, i64 %14
  %47 = load double, ptr addrspace(1) %46, align 8, !invariant.load !263
  %48 = select i1 %24, double %45, double %47
  %49 = getelementptr double, ptr addrspace(1) %arg1946, i64 %14
  %50 = load double, ptr addrspace(1) %49, align 8
  %51 = select i1 %17, double %47, double %50
  %52 = select i1 %.not1, double %50, double %51
  %53 = getelementptr double, ptr addrspace(1) %arg2048, i64 %14
  %54 = load double, ptr addrspace(1) %53, align 8
  %55 = getelementptr double, ptr addrspace(1) %arg2252, i64 %14
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !263
  %57 = select i1 %24, double %54, double %56
  %58 = getelementptr double, ptr addrspace(1) %arg2354, i64 %14
  %59 = load double, ptr addrspace(1) %58, align 8
  %60 = select i1 %17, double %56, double %59
  %61 = select i1 %.not1, double %59, double %60
  %62 = getelementptr double, ptr addrspace(1) %arg2456, i64 %14
  %63 = load double, ptr addrspace(1) %62, align 8
  %64 = getelementptr double, ptr addrspace(1) %arg2660, i64 %14
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !263
  %66 = select i1 %24, double %63, double %65
  %67 = getelementptr double, ptr addrspace(1) %arg2762, i64 %14
  %68 = load double, ptr addrspace(1) %67, align 8
  %69 = select i1 %17, double %65, double %68
  %70 = select i1 %.not1, double %68, double %69
  %71 = getelementptr double, ptr addrspace(1) %arg2864, i64 %14
  %72 = load double, ptr addrspace(1) %71, align 8
  %73 = getelementptr double, ptr addrspace(1) %arg3068, i64 %14
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !263
  %75 = select i1 %24, double %72, double %74
  %76 = getelementptr double, ptr addrspace(1) %arg3170, i64 %14
  %77 = load double, ptr addrspace(1) %76, align 8
  %78 = select i1 %17, double %74, double %77
  %79 = select i1 %.not1, double %77, double %78
  %80 = getelementptr double, ptr addrspace(1) %arg3272, i64 %14
  %81 = load double, ptr addrspace(1) %80, align 8
  %82 = getelementptr double, ptr addrspace(1) %arg3476, i64 %14
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !263
  %84 = select i1 %24, double %81, double %83
  %85 = getelementptr double, ptr addrspace(1) %arg3578, i64 %14
  %86 = load double, ptr addrspace(1) %85, align 8
  %87 = select i1 %17, double %83, double %86
  %88 = select i1 %.not1, double %86, double %87
  %89 = getelementptr double, ptr addrspace(1) %arg3680, i64 %14
  %90 = load double, ptr addrspace(1) %89, align 8
  %91 = getelementptr double, ptr addrspace(1) %arg3884, i64 %14
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !263
  %93 = select i1 %24, double %90, double %92
  %94 = getelementptr double, ptr addrspace(1) %arg3986, i64 %14
  %95 = load double, ptr addrspace(1) %94, align 8
  %96 = select i1 %17, double %92, double %95
  %97 = select i1 %.not1, double %95, double %96
  %98 = getelementptr double, ptr addrspace(1) %arg4088, i64 %14
  %99 = load double, ptr addrspace(1) %98, align 8
  %100 = getelementptr double, ptr addrspace(1) %arg4292, i64 %14
  %101 = load double, ptr addrspace(1) %100, align 8, !invariant.load !263
  %102 = select i1 %24, double %99, double %101
  %103 = getelementptr double, ptr addrspace(1) %arg4394, i64 %14
  %104 = load double, ptr addrspace(1) %103, align 8
  %105 = select i1 %17, double %101, double %104
  %106 = select i1 %.not1, double %104, double %105
  %107 = getelementptr double, ptr addrspace(1) %arg4496, i64 %14
  %108 = load double, ptr addrspace(1) %107, align 8
  %109 = getelementptr double, ptr addrspace(1) %arg46100, i64 %14
  %110 = load double, ptr addrspace(1) %109, align 8, !invariant.load !263
  %111 = select i1 %24, double %108, double %110
  %112 = getelementptr double, ptr addrspace(1) %arg47102, i64 %14
  %113 = load double, ptr addrspace(1) %112, align 8
  %114 = select i1 %17, double %110, double %113
  %115 = select i1 %.not1, double %113, double %114
  %116 = getelementptr double, ptr addrspace(1) %arg48104, i64 %14
  %117 = load double, ptr addrspace(1) %116, align 8
  %118 = getelementptr double, ptr addrspace(1) %arg50108, i64 %14
  %119 = load double, ptr addrspace(1) %118, align 8, !invariant.load !263
  %120 = select i1 %24, double %117, double %119
  %121 = getelementptr double, ptr addrspace(1) %arg51110, i64 %14
  %122 = load double, ptr addrspace(1) %121, align 8
  %123 = select i1 %17, double %119, double %122
  %124 = select i1 %.not1, double %122, double %123
  %125 = getelementptr double, ptr addrspace(1) %arg52112, i64 %14
  %126 = load double, ptr addrspace(1) %125, align 8
  %127 = getelementptr double, ptr addrspace(1) %arg54116, i64 %14
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !263
  %129 = select i1 %24, double %126, double %128
  %130 = getelementptr double, ptr addrspace(1) %arg55118, i64 %14
  %131 = load double, ptr addrspace(1) %130, align 8
  %132 = select i1 %17, double %128, double %131
  %133 = select i1 %.not1, double %131, double %132
  %134 = getelementptr double, ptr addrspace(1) %arg56120, i64 %14
  %135 = load double, ptr addrspace(1) %134, align 8
  %136 = getelementptr double, ptr addrspace(1) %arg58124, i64 %14
  %137 = load double, ptr addrspace(1) %136, align 8, !invariant.load !263
  %138 = select i1 %24, double %135, double %137
  %139 = getelementptr double, ptr addrspace(1) %arg59126, i64 %14
  %140 = load double, ptr addrspace(1) %139, align 8
  %141 = select i1 %17, double %137, double %140
  %142 = select i1 %.not1, double %140, double %141
  %143 = getelementptr double, ptr addrspace(1) %arg60128, i64 %14
  %144 = load double, ptr addrspace(1) %143, align 8
  %145 = getelementptr double, ptr addrspace(1) %arg62132, i64 %14
  %146 = load double, ptr addrspace(1) %145, align 8, !invariant.load !263
  %147 = select i1 %24, double %144, double %146
  %148 = getelementptr double, ptr addrspace(1) %arg63134, i64 %14
  %149 = load double, ptr addrspace(1) %148, align 8
  %150 = select i1 %17, double %146, double %149
  %151 = select i1 %.not1, double %149, double %150
  store double %21, ptr addrspace(1) %18, align 8
  store double %25, ptr addrspace(1) %22, align 8
  store double %30, ptr addrspace(1) %26, align 8
  store double %34, ptr addrspace(1) %31, align 8
  store double %39, ptr addrspace(1) %35, align 8
  store double %43, ptr addrspace(1) %40, align 8
  store double %48, ptr addrspace(1) %44, align 8
  store double %52, ptr addrspace(1) %49, align 8
  store double %57, ptr addrspace(1) %53, align 8
  store double %61, ptr addrspace(1) %58, align 8
  store double %66, ptr addrspace(1) %62, align 8
  store double %70, ptr addrspace(1) %67, align 8
  store double %75, ptr addrspace(1) %71, align 8
  store double %79, ptr addrspace(1) %76, align 8
  store double %84, ptr addrspace(1) %80, align 8
  store double %88, ptr addrspace(1) %85, align 8
  store double %93, ptr addrspace(1) %89, align 8
  store double %97, ptr addrspace(1) %94, align 8
  store double %102, ptr addrspace(1) %98, align 8
  store double %106, ptr addrspace(1) %103, align 8
  store double %111, ptr addrspace(1) %107, align 8
  store double %115, ptr addrspace(1) %112, align 8
  store double %120, ptr addrspace(1) %116, align 8
  store double %124, ptr addrspace(1) %121, align 8
  store double %129, ptr addrspace(1) %125, align 8
  store double %133, ptr addrspace(1) %130, align 8
  store double %138, ptr addrspace(1) %134, align 8
  store double %142, ptr addrspace(1) %139, align 8
  store double %147, ptr addrspace(1) %143, align 8
  store double %151, ptr addrspace(1) %148, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture align 128 dereferenceable(3840) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg5, ptr noalias nocapture align 128 dereferenceable(3840) %arg6) local_unnamed_addr #2 {
entry:
  %arg614 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !270
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !274
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 480
  br i1 %3, label %loop_select_fusion.4.in_bounds-true, label %loop_select_fusion.4.in_bounds-after

loop_select_fusion.4.in_bounds-after:             ; preds = %loop_select_fusion.4.in_bounds-true, %entry
  ret void

loop_select_fusion.4.in_bounds-true:              ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 239
  %4 = zext i1 %.cmp to i64
  %5 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg410, i64 0, i64 %4
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !263
  %7 = icmp sgt i64 %6, 9
  %8 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg38, i64 0, i64 %4
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !263
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg26, i64 0, i64 %4
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !263
  %12 = or i8 %11, %9
  %13 = trunc i8 %12 to i1
  %.not1 = or i1 %7, %13
  %14 = zext nneg i32 %linear_index to i64
  %15 = getelementptr double, ptr addrspace(1) %arg02, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !263
  %17 = getelementptr double, ptr addrspace(1) %arg14, i64 %14
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = select i1 %.not1, double %18, double %16
  %20 = getelementptr double, ptr addrspace(1) %arg512, i64 %14
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !263
  %22 = getelementptr double, ptr addrspace(1) %arg614, i64 %14
  %23 = load double, ptr addrspace(1) %22, align 8
  %24 = select i1 %.not1, double %23, double %21
  store double %19, ptr addrspace(1) %17, align 8
  store double %24, ptr addrspace(1) %22, align 8
  br label %loop_select_fusion.4.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture align 128 dereferenceable(16) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg8, ptr noalias nocapture align 128 dereferenceable(16) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg10, ptr noalias nocapture align 128 dereferenceable(16) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(48) %arg13, ptr noalias nocapture align 128 dereferenceable(16) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg16, ptr noalias nocapture align 128 dereferenceable(16) %arg17, ptr noalias nocapture readnone align 128 dereferenceable(16) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg19, ptr noalias nocapture align 128 dereferenceable(16) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture align 128 dereferenceable(8) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg23, ptr noalias nocapture align 128 dereferenceable(8) %arg24, ptr noalias nocapture align 128 dereferenceable(16) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg30) local_unnamed_addr #2 {
entry:
  %arg30132 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29130 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28128 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27126 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26124 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25122 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24120 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23118 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22116 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21114 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20112 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19110 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg17106 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16104 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15102 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14100 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1398 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1296 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1194 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1092 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg990 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg888 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg786 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg684 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg582 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg480 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg378 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg276 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg174 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg072 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg582, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !263
  %4 = getelementptr i8, ptr addrspace(1) %arg480, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !263
  %6 = getelementptr i8, ptr addrspace(1) %arg072, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !263
  %8 = getelementptr i8, ptr addrspace(1) %arg174, i64 %1
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !263
  %10 = getelementptr i8, ptr addrspace(1) %arg276, i64 %1
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !263
  %12 = getelementptr inbounds [2 x [24 x double]], ptr addrspace(1) %arg378, i64 0, i64 %1, i64 0
  %13 = load <2 x double>, ptr addrspace(1) %12, align 64, !invariant.load !263
  %14 = extractelement <2 x double> %13, i32 0
  %15 = extractelement <2 x double> %13, i32 1
  %16 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 16
  %17 = load <2 x double>, ptr addrspace(1) %16, align 16, !invariant.load !263
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %20 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 32
  %21 = load <2 x double>, ptr addrspace(1) %20, align 32, !invariant.load !263
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  %24 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 48
  %25 = load <2 x double>, ptr addrspace(1) %24, align 16, !invariant.load !263
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 64
  %29 = load <2 x double>, ptr addrspace(1) %28, align 64, !invariant.load !263
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 80
  %33 = load <2 x double>, ptr addrspace(1) %32, align 16, !invariant.load !263
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %36 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 96
  %37 = load <2 x double>, ptr addrspace(1) %36, align 32, !invariant.load !263
  %38 = extractelement <2 x double> %37, i32 0
  %39 = extractelement <2 x double> %37, i32 1
  %40 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 112
  %41 = load <2 x double>, ptr addrspace(1) %40, align 16, !invariant.load !263
  %42 = extractelement <2 x double> %41, i32 0
  %43 = extractelement <2 x double> %41, i32 1
  %44 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 128
  %45 = load <2 x double>, ptr addrspace(1) %44, align 64, !invariant.load !263
  %46 = extractelement <2 x double> %45, i32 0
  %47 = extractelement <2 x double> %45, i32 1
  %48 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 144
  %49 = load <2 x double>, ptr addrspace(1) %48, align 16, !invariant.load !263
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  %52 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 160
  %53 = load <2 x double>, ptr addrspace(1) %52, align 32, !invariant.load !263
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 176
  %57 = load <2 x double>, ptr addrspace(1) %56, align 16, !invariant.load !263
  %58 = extractelement <2 x double> %57, i32 0
  %59 = extractelement <2 x double> %57, i32 1
  %60 = getelementptr i8, ptr addrspace(1) %arg888, i64 %1
  %61 = load i8, ptr addrspace(1) %60, align 1, !invariant.load !263
  %62 = getelementptr [2 x [6 x i32]], ptr addrspace(1) %arg1398, i64 0, i64 %1, i64 0
  %63 = getelementptr inbounds i8, ptr addrspace(1) %62, i64 16
  %64 = load <2 x i32>, ptr addrspace(1) %63, align 8, !invariant.load !263
  %65 = extractelement <2 x i32> %64, i32 0
  %66 = extractelement <2 x i32> %64, i32 1
  %67 = getelementptr double, ptr addrspace(1) %arg1296, i64 %1
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !263
  %69 = getelementptr double, ptr addrspace(1) %arg1194, i64 %1
  %70 = load double, ptr addrspace(1) %69, align 8
  %subtract.236.5.clone.1 = fsub double %68, %70
  %71 = tail call double @llvm.fma.f64(double %subtract.236.5.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %72 = tail call i32 @llvm.nvvm.d2i.lo(double %71) #12
  %73 = tail call double @llvm.nvvm.add.rn.d(double %71, double 0xC338000000000000) #12
  %74 = tail call double @llvm.fma.f64(double %73, double 0xBFE62E42FEFA39EF, double %subtract.236.5.clone.1)
  %75 = tail call double @llvm.fma.f64(double %73, double 0xBC7ABC9E3B39803F, double %74)
  %76 = tail call double @llvm.fma.f64(double %75, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %77 = tail call double @llvm.fma.f64(double %76, double %75, double 0x3EC71DEE62401315)
  %78 = tail call double @llvm.fma.f64(double %77, double %75, double 0x3EFA01997C89EB71)
  %79 = tail call double @llvm.fma.f64(double %78, double %75, double 0x3F2A01A014761F65)
  %80 = tail call double @llvm.fma.f64(double %79, double %75, double 0x3F56C16C1852B7AF)
  %81 = tail call double @llvm.fma.f64(double %80, double %75, double 0x3F81111111122322)
  %82 = tail call double @llvm.fma.f64(double %81, double %75, double 0x3FA55555555502A1)
  %83 = tail call double @llvm.fma.f64(double %82, double %75, double 0x3FC5555555555511)
  %84 = tail call double @llvm.fma.f64(double %83, double %75, double 0x3FE000000000000B)
  %85 = tail call double @llvm.fma.f64(double %84, double %75, double 1.000000e+00)
  %86 = tail call double @llvm.fma.f64(double %85, double %75, double 1.000000e+00)
  %87 = tail call i32 @llvm.nvvm.d2i.lo(double %86) #12
  %88 = tail call i32 @llvm.nvvm.d2i.hi(double %86) #12
  %89 = shl i32 %72, 20
  %90 = add i32 %88, %89
  %91 = tail call double @llvm.nvvm.lohi.i2d(i32 %87, i32 %90) #12
  %92 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.236.5.clone.1) #12
  %93 = bitcast i32 %92 to float
  %94 = tail call float @llvm.nvvm.fabs.f(float %93) #12
  %95 = fcmp olt float %94, 0x4010C46560000000
  br i1 %95, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %96 = fcmp olt double %subtract.236.5.clone.1, 0.000000e+00
  %97 = fadd double %subtract.236.5.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %96, double 0.000000e+00, double %97
  %98 = fcmp olt float %94, 0x4010E90000000000
  br i1 %98, label %99, label %__nv_exp.exit

99:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %100 = sdiv i32 %72, 2
  %101 = shl i32 %100, 20
  %102 = add i32 %88, %101
  %103 = tail call double @llvm.nvvm.lohi.i2d(i32 %87, i32 %102) #12
  %104 = sub nsw i32 %72, %100
  %105 = shl i32 %104, 20
  %106 = add nsw i32 %105, 1072693248
  %107 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %106) #12
  %108 = fmul double %107, %103
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %99
  %z.2.i = phi double [ %91, %entry ], [ %108, %99 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %109 = getelementptr double, ptr addrspace(1) %arg684, i64 %1
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg786, i64 %1
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !263
  %113 = getelementptr double, ptr addrspace(1) %arg990, i64 %1
  %114 = load double, ptr addrspace(1) %113, align 8
  %115 = getelementptr double, ptr addrspace(1) %arg1092, i64 %1
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !263
  %subtract.237.1.clone.1 = fsub double %70, %68
  %117 = tail call double @llvm.fabs.f64(double %subtract.237.1.clone.1)
  %118 = fneg double %117
  %119 = tail call double @llvm.fma.f64(double %118, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %120 = tail call i32 @llvm.nvvm.d2i.lo(double %119) #12
  %121 = tail call double @llvm.nvvm.add.rn.d(double %119, double 0xC338000000000000) #12
  %122 = tail call double @llvm.fma.f64(double %121, double 0xBFE62E42FEFA39EF, double %118)
  %123 = tail call double @llvm.fma.f64(double %121, double 0xBC7ABC9E3B39803F, double %122)
  %124 = tail call double @llvm.fma.f64(double %123, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %125 = tail call double @llvm.fma.f64(double %124, double %123, double 0x3EC71DEE62401315)
  %126 = tail call double @llvm.fma.f64(double %125, double %123, double 0x3EFA01997C89EB71)
  %127 = tail call double @llvm.fma.f64(double %126, double %123, double 0x3F2A01A014761F65)
  %128 = tail call double @llvm.fma.f64(double %127, double %123, double 0x3F56C16C1852B7AF)
  %129 = tail call double @llvm.fma.f64(double %128, double %123, double 0x3F81111111122322)
  %130 = tail call double @llvm.fma.f64(double %129, double %123, double 0x3FA55555555502A1)
  %131 = tail call double @llvm.fma.f64(double %130, double %123, double 0x3FC5555555555511)
  %132 = tail call double @llvm.fma.f64(double %131, double %123, double 0x3FE000000000000B)
  %133 = tail call double @llvm.fma.f64(double %132, double %123, double 1.000000e+00)
  %134 = tail call double @llvm.fma.f64(double %133, double %123, double 1.000000e+00)
  %135 = tail call i32 @llvm.nvvm.d2i.lo(double %134) #12
  %136 = tail call i32 @llvm.nvvm.d2i.hi(double %134) #12
  %137 = shl i32 %120, 20
  %138 = add i32 %136, %137
  %139 = tail call double @llvm.nvvm.lohi.i2d(i32 %135, i32 %138) #12
  %140 = tail call i32 @llvm.nvvm.d2i.hi(double %118) #12
  %141 = bitcast i32 %140 to float
  %142 = tail call float @llvm.nvvm.fabs.f(float %141) #12
  %143 = fcmp olt float %142, 0x4010C46560000000
  br i1 %143, label %__nv_exp.exit62, label %__internal_fast_icmp_abs_lt.exit.i59

__internal_fast_icmp_abs_lt.exit.i59:             ; preds = %__nv_exp.exit
  %144 = fcmp one double %subtract.237.1.clone.1, 0.000000e+00
  %145 = fsub double 0x7FF0000000000000, %117
  %z.0.i60 = select i1 %144, double 0.000000e+00, double %145
  %146 = fcmp olt float %142, 0x4010E90000000000
  br i1 %146, label %147, label %__nv_exp.exit62

147:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i59
  %148 = sdiv i32 %120, 2
  %149 = shl i32 %148, 20
  %150 = add i32 %136, %149
  %151 = tail call double @llvm.nvvm.lohi.i2d(i32 %135, i32 %150) #12
  %152 = sub nsw i32 %120, %148
  %153 = shl i32 %152, 20
  %154 = add nsw i32 %153, 1072693248
  %155 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %154) #12
  %156 = fmul double %155, %151
  br label %__nv_exp.exit62

__nv_exp.exit62:                                  ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i59, %147
  %z.2.i61 = phi double [ %139, %__nv_exp.exit ], [ %156, %147 ], [ %z.0.i60, %__internal_fast_icmp_abs_lt.exit.i59 ]
  %157 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i61) #12
  %158 = bitcast i32 %157 to float
  %159 = fcmp olt float %158, 0x3FFCAAAAA0000000
  %160 = fcmp ogt float %158, 0xBFFB333320000000
  %or.cond.i = and i1 %159, %160
  br i1 %or.cond.i, label %161, label %178

161:                                              ; preds = %__nv_exp.exit62
  %162 = fadd double %z.2.i61, 2.000000e+00
  %163 = fdiv double %z.2.i61, %162
  %164 = fneg double %z.2.i61
  %165 = fmul double %163, %164
  %166 = fadd double %z.2.i61, %165
  %167 = fmul double %166, %166
  %168 = tail call double @llvm.fma.f64(double %167, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %169 = tail call double @llvm.fma.f64(double %168, double %167, double 0x3EF3B9FF890F468C)
  %170 = tail call double @llvm.fma.f64(double %169, double %167, double 0x3F17457EFD51BAF8)
  %171 = tail call double @llvm.fma.f64(double %170, double %167, double 0x3F3C71C8DE3CE825)
  %172 = tail call double @llvm.fma.f64(double %171, double %167, double 0x3F6249248FA4661F)
  %173 = tail call double @llvm.fma.f64(double %172, double %167, double 0x3F899999999D70C4)
  %174 = tail call double @llvm.fma.f64(double %173, double %167, double 0x3FB5555555555462)
  %175 = fmul double %167, %174
  %176 = tail call double @llvm.fma.f64(double %175, double %166, double %165)
  %177 = fadd double %z.2.i61, %176
  br label %__nv_log1p.exit

178:                                              ; preds = %__nv_exp.exit62
  %179 = fadd double %z.2.i61, 1.000000e+00
  %180 = tail call i32 @llvm.nvvm.d2i.hi(double %179) #12
  %181 = tail call i32 @llvm.nvvm.d2i.lo(double %179) #12
  %182 = icmp slt i32 %180, 1048576
  %183 = fmul double %179, 0x4350000000000000
  %184 = tail call i32 @llvm.nvvm.d2i.lo(double %183) #12
  %185 = tail call i32 @llvm.nvvm.d2i.hi(double %183) #12
  br i1 %182, label %186, label %187

186:                                              ; preds = %178
  br label %187

187:                                              ; preds = %186, %178
  %.0.i = phi double [ %183, %186 ], [ %179, %178 ]
  %ihi.i.0.i = phi i32 [ %185, %186 ], [ %180, %178 ]
  %ilo.i.0.i = phi i32 [ %184, %186 ], [ %181, %178 ]
  %e.i.0.i = phi i32 [ -1077, %186 ], [ -1023, %178 ]
  %188 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %188, 2146435071
  br i1 %or.cond2.i, label %189, label %236

189:                                              ; preds = %187
  %190 = lshr i32 %ihi.i.0.i, 20
  %191 = add nsw i32 %e.i.0.i, %190
  %192 = and i32 %ihi.i.0.i, 1048575
  %193 = or disjoint i32 %192, 1072693248
  %194 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %193) #12
  %195 = icmp ugt i32 %193, 1073127582
  %196 = tail call i32 @llvm.nvvm.d2i.lo(double %194) #12
  %197 = tail call i32 @llvm.nvvm.d2i.hi(double %194) #12
  %198 = add i32 %197, -1048576
  %199 = tail call double @llvm.nvvm.lohi.i2d(i32 %196, i32 %198) #12
  %spec.select = select i1 %195, double %199, double %194
  %200 = zext i1 %195 to i32
  %spec.select67 = add nsw i32 %191, %200
  %201 = fadd double %spec.select, -1.000000e+00
  %202 = fadd double %spec.select, 1.000000e+00
  %203 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %202) #12
  %204 = fneg double %202
  %205 = tail call double @llvm.fma.f64(double %204, double %203, double 1.000000e+00)
  %206 = tail call double @llvm.fma.f64(double %205, double %205, double %205)
  %207 = tail call double @llvm.fma.f64(double %206, double %203, double %203)
  %208 = fmul double %201, %207
  %209 = fadd double %208, %208
  %210 = fmul double %209, %209
  %211 = tail call double @llvm.fma.f64(double %210, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %212 = tail call double @llvm.fma.f64(double %211, double %210, double 0x3EF3B2669F02676F)
  %213 = tail call double @llvm.fma.f64(double %212, double %210, double 0x3F1745CBA9AB0956)
  %214 = tail call double @llvm.fma.f64(double %213, double %210, double 0x3F3C71C72D1B5154)
  %215 = tail call double @llvm.fma.f64(double %214, double %210, double 0x3F624924923BE72D)
  %216 = tail call double @llvm.fma.f64(double %215, double %210, double 0x3F8999999999A3C4)
  %217 = tail call double @llvm.fma.f64(double %216, double %210, double 0x3FB5555555555554)
  %218 = fsub double %201, %209
  %219 = fmul double %218, 2.000000e+00
  %220 = fneg double %209
  %221 = tail call double @llvm.fma.f64(double %220, double %201, double %219)
  %222 = fmul double %207, %221
  %223 = fmul double %210, %217
  %224 = tail call double @llvm.fma.f64(double %223, double %209, double %222)
  %225 = xor i32 %spec.select67, -2147483648
  %226 = tail call double @llvm.nvvm.lohi.i2d(i32 %225, i32 1127219200) #12
  %227 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %228 = fsub double %226, %227
  %229 = tail call double @llvm.fma.f64(double %228, double 0x3FE62E42FEFA39EF, double %209)
  %230 = fneg double %228
  %231 = tail call double @llvm.fma.f64(double %230, double 0x3FE62E42FEFA39EF, double %229)
  %232 = fsub double %231, %209
  %233 = fsub double %224, %232
  %234 = tail call double @llvm.fma.f64(double %228, double 0x3C7ABC9E3B39803F, double %233)
  %235 = fadd double %229, %234
  br label %__nv_log1p.exit

236:                                              ; preds = %187
  %237 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %238 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %239 = and i32 %238, 2147483647
  %240 = icmp eq i32 %239, 0
  %q.i.0.i = select i1 %240, double 0xFFF0000000000000, double %237
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %161, %189, %236
  %t.0.i = phi double [ %177, %161 ], [ %235, %189 ], [ %q.i.0.i, %236 ]
  %241 = getelementptr i8, ptr addrspace(1) %arg15102, i64 %1
  %242 = load i8, ptr addrspace(1) %241, align 1, !invariant.load !263
  %243 = getelementptr i64, ptr addrspace(1) %arg16104, i64 %1
  %244 = load i64, ptr addrspace(1) %243, align 8, !invariant.load !263
  %245 = getelementptr i64, ptr addrspace(1) %arg14100, i64 %1
  %246 = load i64, ptr addrspace(1) %245, align 8
  %247 = getelementptr double, ptr addrspace(1) %arg17106, i64 %1
  %248 = load double, ptr addrspace(1) %247, align 8
  %249 = getelementptr double, ptr addrspace(1) %arg19110, i64 %1
  %250 = load double, ptr addrspace(1) %249, align 8, !invariant.load !263
  %251 = getelementptr double, ptr addrspace(1) %arg20112, i64 %1
  %252 = load double, ptr addrspace(1) %251, align 8
  %253 = getelementptr i32, ptr addrspace(1) %arg21114, i64 %1
  %254 = load i32, ptr addrspace(1) %253, align 4, !invariant.load !263
  %255 = getelementptr i32, ptr addrspace(1) %arg22116, i64 %1
  %256 = load i32, ptr addrspace(1) %255, align 4
  %257 = getelementptr i32, ptr addrspace(1) %arg23118, i64 %1
  %258 = load i32, ptr addrspace(1) %257, align 4, !invariant.load !263
  %259 = getelementptr i32, ptr addrspace(1) %arg24120, i64 %1
  %260 = load i32, ptr addrspace(1) %259, align 4
  %261 = getelementptr double, ptr addrspace(1) %arg25122, i64 %1
  %262 = load double, ptr addrspace(1) %261, align 8
  %263 = getelementptr double, ptr addrspace(1) %arg26124, i64 %1
  %264 = load double, ptr addrspace(1) %263, align 8, !invariant.load !263
  %subtract.238.1.clone.1 = fsub double %262, %264
  %265 = tail call double @llvm.fabs.f64(double %subtract.238.1.clone.1)
  %266 = fneg double %265
  %267 = tail call double @llvm.fma.f64(double %266, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %268 = tail call i32 @llvm.nvvm.d2i.lo(double %267) #12
  %269 = tail call double @llvm.nvvm.add.rn.d(double %267, double 0xC338000000000000) #12
  %270 = tail call double @llvm.fma.f64(double %269, double 0xBFE62E42FEFA39EF, double %266)
  %271 = tail call double @llvm.fma.f64(double %269, double 0xBC7ABC9E3B39803F, double %270)
  %272 = tail call double @llvm.fma.f64(double %271, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %273 = tail call double @llvm.fma.f64(double %272, double %271, double 0x3EC71DEE62401315)
  %274 = tail call double @llvm.fma.f64(double %273, double %271, double 0x3EFA01997C89EB71)
  %275 = tail call double @llvm.fma.f64(double %274, double %271, double 0x3F2A01A014761F65)
  %276 = tail call double @llvm.fma.f64(double %275, double %271, double 0x3F56C16C1852B7AF)
  %277 = tail call double @llvm.fma.f64(double %276, double %271, double 0x3F81111111122322)
  %278 = tail call double @llvm.fma.f64(double %277, double %271, double 0x3FA55555555502A1)
  %279 = tail call double @llvm.fma.f64(double %278, double %271, double 0x3FC5555555555511)
  %280 = tail call double @llvm.fma.f64(double %279, double %271, double 0x3FE000000000000B)
  %281 = tail call double @llvm.fma.f64(double %280, double %271, double 1.000000e+00)
  %282 = tail call double @llvm.fma.f64(double %281, double %271, double 1.000000e+00)
  %283 = tail call i32 @llvm.nvvm.d2i.lo(double %282) #12
  %284 = tail call i32 @llvm.nvvm.d2i.hi(double %282) #12
  %285 = shl i32 %268, 20
  %286 = add i32 %284, %285
  %287 = tail call double @llvm.nvvm.lohi.i2d(i32 %283, i32 %286) #12
  %288 = tail call i32 @llvm.nvvm.d2i.hi(double %266) #12
  %289 = bitcast i32 %288 to float
  %290 = tail call float @llvm.nvvm.fabs.f(float %289) #12
  %291 = fcmp olt float %290, 0x4010C46560000000
  br i1 %291, label %__nv_exp.exit66, label %__internal_fast_icmp_abs_lt.exit.i63

__internal_fast_icmp_abs_lt.exit.i63:             ; preds = %__nv_log1p.exit
  %292 = fcmp one double %subtract.238.1.clone.1, 0.000000e+00
  %293 = fsub double 0x7FF0000000000000, %265
  %z.0.i64 = select i1 %292, double 0.000000e+00, double %293
  %294 = fcmp olt float %290, 0x4010E90000000000
  br i1 %294, label %295, label %__nv_exp.exit66

295:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i63
  %296 = sdiv i32 %268, 2
  %297 = shl i32 %296, 20
  %298 = add i32 %284, %297
  %299 = tail call double @llvm.nvvm.lohi.i2d(i32 %283, i32 %298) #12
  %300 = sub nsw i32 %268, %296
  %301 = shl i32 %300, 20
  %302 = add nsw i32 %301, 1072693248
  %303 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %302) #12
  %304 = fmul double %303, %299
  br label %__nv_exp.exit66

__nv_exp.exit66:                                  ; preds = %__nv_log1p.exit, %__internal_fast_icmp_abs_lt.exit.i63, %295
  %z.2.i65 = phi double [ %287, %__nv_log1p.exit ], [ %304, %295 ], [ %z.0.i64, %__internal_fast_icmp_abs_lt.exit.i63 ]
  %305 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i65) #12
  %306 = bitcast i32 %305 to float
  %307 = fcmp olt float %306, 0x3FFCAAAAA0000000
  %308 = fcmp ogt float %306, 0xBFFB333320000000
  %or.cond.i48 = and i1 %307, %308
  br i1 %or.cond.i48, label %309, label %326

309:                                              ; preds = %__nv_exp.exit66
  %310 = fadd double %z.2.i65, 2.000000e+00
  %311 = fdiv double %z.2.i65, %310
  %312 = fneg double %z.2.i65
  %313 = fmul double %311, %312
  %314 = fadd double %z.2.i65, %313
  %315 = fmul double %314, %314
  %316 = tail call double @llvm.fma.f64(double %315, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %317 = tail call double @llvm.fma.f64(double %316, double %315, double 0x3EF3B9FF890F468C)
  %318 = tail call double @llvm.fma.f64(double %317, double %315, double 0x3F17457EFD51BAF8)
  %319 = tail call double @llvm.fma.f64(double %318, double %315, double 0x3F3C71C8DE3CE825)
  %320 = tail call double @llvm.fma.f64(double %319, double %315, double 0x3F6249248FA4661F)
  %321 = tail call double @llvm.fma.f64(double %320, double %315, double 0x3F899999999D70C4)
  %322 = tail call double @llvm.fma.f64(double %321, double %315, double 0x3FB5555555555462)
  %323 = fmul double %315, %322
  %324 = tail call double @llvm.fma.f64(double %323, double %314, double %313)
  %325 = fadd double %z.2.i65, %324
  br label %__nv_log1p.exit58

326:                                              ; preds = %__nv_exp.exit66
  %327 = fadd double %z.2.i65, 1.000000e+00
  %328 = tail call i32 @llvm.nvvm.d2i.hi(double %327) #12
  %329 = tail call i32 @llvm.nvvm.d2i.lo(double %327) #12
  %330 = icmp slt i32 %328, 1048576
  %331 = fmul double %327, 0x4350000000000000
  %332 = tail call i32 @llvm.nvvm.d2i.lo(double %331) #12
  %333 = tail call i32 @llvm.nvvm.d2i.hi(double %331) #12
  br i1 %330, label %334, label %335

334:                                              ; preds = %326
  br label %335

335:                                              ; preds = %334, %326
  %.0.i49 = phi double [ %331, %334 ], [ %327, %326 ]
  %ihi.i.0.i50 = phi i32 [ %333, %334 ], [ %328, %326 ]
  %ilo.i.0.i51 = phi i32 [ %332, %334 ], [ %329, %326 ]
  %e.i.0.i52 = phi i32 [ -1077, %334 ], [ -1023, %326 ]
  %336 = add i32 %ihi.i.0.i50, -1
  %or.cond2.i53 = icmp ult i32 %336, 2146435071
  br i1 %or.cond2.i53, label %337, label %384

337:                                              ; preds = %335
  %338 = lshr i32 %ihi.i.0.i50, 20
  %339 = add nsw i32 %e.i.0.i52, %338
  %340 = and i32 %ihi.i.0.i50, 1048575
  %341 = or disjoint i32 %340, 1072693248
  %342 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i51, i32 %341) #12
  %343 = icmp ugt i32 %341, 1073127582
  %344 = tail call i32 @llvm.nvvm.d2i.lo(double %342) #12
  %345 = tail call i32 @llvm.nvvm.d2i.hi(double %342) #12
  %346 = add i32 %345, -1048576
  %347 = tail call double @llvm.nvvm.lohi.i2d(i32 %344, i32 %346) #12
  %spec.select68 = select i1 %343, double %347, double %342
  %348 = zext i1 %343 to i32
  %spec.select69 = add nsw i32 %339, %348
  %349 = fadd double %spec.select68, -1.000000e+00
  %350 = fadd double %spec.select68, 1.000000e+00
  %351 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %350) #12
  %352 = fneg double %350
  %353 = tail call double @llvm.fma.f64(double %352, double %351, double 1.000000e+00)
  %354 = tail call double @llvm.fma.f64(double %353, double %353, double %353)
  %355 = tail call double @llvm.fma.f64(double %354, double %351, double %351)
  %356 = fmul double %349, %355
  %357 = fadd double %356, %356
  %358 = fmul double %357, %357
  %359 = tail call double @llvm.fma.f64(double %358, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %360 = tail call double @llvm.fma.f64(double %359, double %358, double 0x3EF3B2669F02676F)
  %361 = tail call double @llvm.fma.f64(double %360, double %358, double 0x3F1745CBA9AB0956)
  %362 = tail call double @llvm.fma.f64(double %361, double %358, double 0x3F3C71C72D1B5154)
  %363 = tail call double @llvm.fma.f64(double %362, double %358, double 0x3F624924923BE72D)
  %364 = tail call double @llvm.fma.f64(double %363, double %358, double 0x3F8999999999A3C4)
  %365 = tail call double @llvm.fma.f64(double %364, double %358, double 0x3FB5555555555554)
  %366 = fsub double %349, %357
  %367 = fmul double %366, 2.000000e+00
  %368 = fneg double %357
  %369 = tail call double @llvm.fma.f64(double %368, double %349, double %367)
  %370 = fmul double %355, %369
  %371 = fmul double %358, %365
  %372 = tail call double @llvm.fma.f64(double %371, double %357, double %370)
  %373 = xor i32 %spec.select69, -2147483648
  %374 = tail call double @llvm.nvvm.lohi.i2d(i32 %373, i32 1127219200) #12
  %375 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %376 = fsub double %374, %375
  %377 = tail call double @llvm.fma.f64(double %376, double 0x3FE62E42FEFA39EF, double %357)
  %378 = fneg double %376
  %379 = tail call double @llvm.fma.f64(double %378, double 0x3FE62E42FEFA39EF, double %377)
  %380 = fsub double %379, %357
  %381 = fsub double %372, %380
  %382 = tail call double @llvm.fma.f64(double %376, double 0x3C7ABC9E3B39803F, double %381)
  %383 = fadd double %377, %382
  br label %__nv_log1p.exit58

384:                                              ; preds = %335
  %385 = tail call double @llvm.fma.f64(double %.0.i49, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %386 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i49) #12
  %387 = and i32 %386, 2147483647
  %388 = icmp eq i32 %387, 0
  %q.i.0.i54 = select i1 %388, double 0xFFF0000000000000, double %385
  br label %__nv_log1p.exit58

__nv_log1p.exit58:                                ; preds = %309, %337, %384
  %t.0.i55 = phi double [ %325, %309 ], [ %383, %337 ], [ %q.i.0.i54, %384 ]
  %add.3969.i = fadd double %14, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %15
  %add.3969.i.2 = fadd double %add.3969.i.1, %18
  %add.3969.i.3 = fadd double %add.3969.i.2, %19
  %add.3969.i.4 = fadd double %add.3969.i.3, %22
  %add.3969.i.5 = fadd double %add.3969.i.4, %23
  %add.3969.i.6 = fadd double %add.3969.i.5, %26
  %add.3969.i.7 = fadd double %add.3969.i.6, %27
  %add.3969.i.8 = fadd double %add.3969.i.7, %30
  %add.3969.i.9 = fadd double %add.3969.i.8, %31
  %add.3969.i.10 = fadd double %add.3969.i.9, %34
  %add.3969.i.11 = fadd double %add.3969.i.10, %35
  %add.3969.i.12 = fadd double %add.3969.i.11, %38
  %add.3969.i.13 = fadd double %add.3969.i.12, %39
  %add.3969.i.14 = fadd double %add.3969.i.13, %42
  %add.3969.i.15 = fadd double %add.3969.i.14, %43
  %add.3969.i.16 = fadd double %add.3969.i.15, %46
  %add.3969.i.17 = fadd double %add.3969.i.16, %47
  %add.3969.i.18 = fadd double %add.3969.i.17, %50
  %add.3969.i.19 = fadd double %add.3969.i.18, %51
  %add.3969.i.20 = fadd double %add.3969.i.19, %54
  %add.3969.i.21 = fadd double %add.3969.i.20, %55
  %add.3969.i.22 = fadd double %add.3969.i.21, %58
  %add.3969.i.23 = fadd double %add.3969.i.22, %59
  %389 = fcmp uno double %262, 0.000000e+00
  %390 = fcmp oge double %262, %264
  %391 = or i1 %389, %390
  %maximum.48.1.clone.1 = select i1 %391, double %262, double %264
  %add.4423.1.clone.1 = fadd double %262, %264
  %compare.1183.1.clone.1 = fcmp uno double %subtract.238.1.clone.1, 0.000000e+00
  %392 = icmp sgt i64 %3, 9
  %393 = or i8 %7, %5
  %394 = trunc i8 %393 to i1
  %.not47 = or i1 %392, %394
  %395 = select i1 %.not47, i32 %260, i32 %258
  %not..not47 = xor i1 %.not47, true
  %396 = zext i1 %not..not47 to i64
  %397 = add i64 %3, %396
  %398 = select i1 %.not47, i32 %256, i32 %254
  %399 = trunc i8 %242 to i1
  %400 = select i1 %399, double %250, double %252
  %401 = select i1 %.not47, double %252, double %400
  %402 = select i1 %.not47, i1 true, i1 %399
  %403 = select i1 %402, double %248, double %250
  %404 = select i1 %.not47, i64 0, i64 %244
  %405 = add i64 %246, %404
  %406 = select i1 %.not47, i8 %5, i8 %61
  %407 = or i8 %61, %9
  %408 = icmp eq i8 %407, 0
  %compare.1182.1.clone.1 = fcmp uno double %subtract.237.1.clone.1, 0.000000e+00
  %add.4421.3.clone.1 = fadd double %68, %70
  %409 = fcmp uno double %70, 0.000000e+00
  %410 = fcmp oge double %70, %68
  %411 = or i1 %409, %410
  %maximum.47.1.clone.1 = select i1 %411, double %70, double %68
  %add.4422.5.clone.1 = fadd double %maximum.47.1.clone.1, %t.0.i
  %412 = select i1 %compare.1182.1.clone.1, double %add.4421.3.clone.1, double %add.4422.5.clone.1
  %413 = select i1 %408, double %412, double %70
  %414 = select i1 %.not47, double %70, double %413
  %415 = add i32 %66, 1
  %416 = add i32 %415, %65
  %417 = tail call i32 @llvm.fshl.i32(i32 %415, i32 %415, i32 13)
  %418 = xor i32 %416, %417
  %419 = add i32 %418, %416
  %420 = tail call i32 @llvm.fshl.i32(i32 %418, i32 %418, i32 15)
  %421 = xor i32 %419, %420
  %422 = add i32 %421, %419
  %423 = tail call i32 @llvm.fshl.i32(i32 %421, i32 %421, i32 26)
  %424 = xor i32 %422, %423
  %425 = add i32 %424, %422
  %426 = add i32 %425, %66
  %427 = tail call i32 @llvm.fshl.i32(i32 %424, i32 %424, i32 6)
  %428 = xor i32 %425, %427
  %429 = xor i32 %65, %66
  %430 = xor i32 %429, 466688986
  %431 = add i32 %430, 1
  %432 = add i32 %431, %428
  %433 = add i32 %426, %432
  %434 = tail call i32 @llvm.fshl.i32(i32 %432, i32 %432, i32 17)
  %435 = xor i32 %433, %434
  %436 = add i32 %435, %433
  %437 = tail call i32 @llvm.fshl.i32(i32 %435, i32 %435, i32 29)
  %438 = xor i32 %436, %437
  %439 = add i32 %438, %436
  %440 = tail call i32 @llvm.fshl.i32(i32 %438, i32 %438, i32 16)
  %441 = xor i32 %439, %440
  %442 = add i32 %441, %439
  %443 = add i32 %442, %430
  %444 = tail call i32 @llvm.fshl.i32(i32 %441, i32 %441, i32 24)
  %445 = xor i32 %442, %444
  %446 = add i32 %65, 2
  %447 = add i32 %446, %445
  %448 = add i32 %443, %447
  %449 = tail call i32 @llvm.fshl.i32(i32 %447, i32 %447, i32 13)
  %450 = xor i32 %448, %449
  %451 = add i32 %450, %448
  %452 = tail call i32 @llvm.fshl.i32(i32 %450, i32 %450, i32 15)
  %453 = xor i32 %451, %452
  %454 = add i32 %453, %451
  %455 = tail call i32 @llvm.fshl.i32(i32 %453, i32 %453, i32 26)
  %456 = xor i32 %454, %455
  %457 = add i32 %456, %454
  %458 = add i32 %457, %65
  %459 = tail call i32 @llvm.fshl.i32(i32 %456, i32 %456, i32 6)
  %460 = xor i32 %457, %459
  %461 = add i32 %66, 3
  %462 = add i32 %461, %460
  %463 = add i32 %458, %462
  %464 = tail call i32 @llvm.fshl.i32(i32 %462, i32 %462, i32 17)
  %465 = xor i32 %463, %464
  %466 = add i32 %465, %463
  %467 = tail call i32 @llvm.fshl.i32(i32 %465, i32 %465, i32 29)
  %468 = xor i32 %466, %467
  %469 = add i32 %468, %466
  %470 = tail call i32 @llvm.fshl.i32(i32 %468, i32 %468, i32 16)
  %471 = xor i32 %469, %470
  %472 = add i32 %471, %469
  %473 = add i32 %472, %66
  %474 = tail call i32 @llvm.fshl.i32(i32 %471, i32 %471, i32 24)
  %475 = xor i32 %472, %474
  %476 = add i32 %430, 4
  %477 = add i32 %476, %475
  %478 = add i32 %473, %477
  %479 = tail call i32 @llvm.fshl.i32(i32 %477, i32 %477, i32 13)
  %480 = xor i32 %478, %479
  %481 = add i32 %480, %478
  %482 = tail call i32 @llvm.fshl.i32(i32 %480, i32 %480, i32 15)
  %483 = xor i32 %481, %482
  %484 = add i32 %483, %481
  %485 = tail call i32 @llvm.fshl.i32(i32 %483, i32 %483, i32 26)
  %486 = xor i32 %484, %485
  %487 = add i32 %486, %484
  %488 = add i32 %487, %430
  %489 = zext i32 %488 to i64
  %490 = shl nuw i64 %489, 32
  %491 = tail call i32 @llvm.fshl.i32(i32 %486, i32 %486, i32 6)
  %492 = xor i32 %487, %491
  %493 = add i32 %65, 5
  %494 = add i32 %493, %492
  %495 = zext i32 %494 to i64
  %496 = or disjoint i64 %490, %495
  %497 = lshr i64 %496, 12
  %498 = or disjoint i64 %497, 4607182418800017408
  %499 = bitcast i64 %498 to double
  %add.4420.5.clone.1 = fadd double %499, -1.000000e+00
  %500 = fcmp ole double %add.4420.5.clone.1, 0.000000e+00
  %maximum.46.5.clone.1 = select i1 %500, double 0.000000e+00, double %add.4420.5.clone.1
  %501 = fcmp oge double %z.2.i, 1.000000e+00
  %minimum.10.7.clone.1 = select i1 %501, double 1.000000e+00, double %z.2.i
  %compare.1180.5.clone.1 = fcmp uge double %maximum.46.5.clone.1, %minimum.10.7.clone.1
  %502 = select i1 %compare.1180.5.clone.1, double %114, double %116
  %503 = select i1 %408, double %502, double %114
  %504 = select i1 %.not47, double %114, double %503
  %505 = select i1 %compare.1180.5.clone.1, double %110, double %112
  %506 = select i1 %408, double %505, double %110
  %507 = select i1 %.not47, double %110, double %506
  %508 = zext i1 %compare.1180.5.clone.1 to i8
  %compare.1185.7 = fcmp ole double %add.3969.i.23, 0.000000e+00
  %509 = zext i1 %compare.1185.7 to i8
  %510 = or i8 %11, %509
  %511 = or i8 %510, %9
  %512 = select i1 %.not47, i8 %7, i8 %511
  %add.4424.3.clone.1 = fadd double %maximum.48.1.clone.1, %t.0.i55
  %513 = select i1 %compare.1183.1.clone.1, double %add.4423.1.clone.1, double %add.4424.3.clone.1
  %514 = select i1 %.not47, double %262, double %513
  %515 = getelementptr i8, ptr addrspace(1) %arg27126, i64 %1
  store i8 %512, ptr addrspace(1) %515, align 1
  store double %507, ptr addrspace(1) %109, align 8
  store double %504, ptr addrspace(1) %113, align 8
  store double %414, ptr addrspace(1) %69, align 8
  %516 = getelementptr i8, ptr addrspace(1) %arg28128, i64 %1
  store i8 %406, ptr addrspace(1) %516, align 1
  %517 = getelementptr i8, ptr addrspace(1) %arg29130, i64 %1
  store i8 %508, ptr addrspace(1) %517, align 1
  store i64 %405, ptr addrspace(1) %245, align 8
  store double %403, ptr addrspace(1) %247, align 8
  store double %401, ptr addrspace(1) %251, align 8
  store i32 %398, ptr addrspace(1) %255, align 4
  %518 = getelementptr i64, ptr addrspace(1) %arg30132, i64 %1
  store i64 %397, ptr addrspace(1) %518, align 8
  store i32 %395, ptr addrspace(1) %259, align 4
  store double %514, ptr addrspace(1) %261, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_6(ptr noalias nocapture align 128 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg1, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture align 128 dereferenceable(64) %arg7, ptr noalias nocapture align 128 dereferenceable(64) %arg8, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg10, ptr noalias nocapture align 128 dereferenceable(64) %arg11, ptr noalias nocapture align 128 dereferenceable(64) %arg12, ptr noalias nocapture readnone align 128 dereferenceable(64) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg14, ptr noalias nocapture align 128 dereferenceable(64) %arg15, ptr noalias nocapture align 128 dereferenceable(64) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg17, ptr noalias nocapture align 128 dereferenceable(64) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg19, ptr noalias nocapture align 128 dereferenceable(64) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg21, ptr noalias nocapture align 128 dereferenceable(64) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg23, ptr noalias nocapture align 128 dereferenceable(64) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg25, ptr noalias nocapture align 128 dereferenceable(64) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg27, ptr noalias nocapture align 128 dereferenceable(64) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg32, ptr noalias nocapture align 128 dereferenceable(64) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg34, ptr noalias nocapture align 128 dereferenceable(64) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg36, ptr noalias nocapture align 128 dereferenceable(64) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg38, ptr noalias nocapture align 128 dereferenceable(64) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg40, ptr noalias nocapture align 128 dereferenceable(64) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg42, ptr noalias nocapture align 128 dereferenceable(64) %arg43, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg44, ptr noalias nocapture align 128 dereferenceable(64) %arg45, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg46, ptr noalias nocapture align 128 dereferenceable(64) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg48, ptr noalias nocapture align 128 dereferenceable(64) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg50, ptr noalias nocapture align 128 dereferenceable(64) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg52, ptr noalias nocapture align 128 dereferenceable(64) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(64) %arg54) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !265
  %1 = lshr i32 %0, 2
  %2 = zext nneg i32 %1 to i64
  %3 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg620, i64 0, i64 %2
  %4 = load i64, ptr addrspace(1) %3, align 8, !invariant.load !263
  %5 = icmp sgt i64 %4, 9
  %6 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg518, i64 0, i64 %2
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !263
  %8 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg416, i64 0, i64 %2
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !263
  %10 = or i8 %9, %7
  %11 = trunc i8 %10 to i1
  %.not1 = or i1 %5, %11
  %12 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg314, i64 0, i64 %2
  %13 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !263
  %14 = zext nneg i32 %0 to i64
  %15 = getelementptr double, ptr addrspace(1) %arg110, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !263
  %17 = trunc i8 %13 to i1
  %18 = getelementptr double, ptr addrspace(1) %arg02, i64 %14
  %19 = load double, ptr addrspace(1) %18, align 8
  %20 = select i1 %17, double %16, double %19
  %21 = select i1 %.not1, double %19, double %20
  %22 = getelementptr double, ptr addrspace(1) %arg722, i64 %14
  %23 = load double, ptr addrspace(1) %22, align 8
  %24 = select i1 %.not1, i1 true, i1 %17
  %25 = select i1 %24, double %23, double %16
  %26 = getelementptr double, ptr addrspace(1) %arg824, i64 %14
  %27 = load double, ptr addrspace(1) %26, align 8
  %28 = getelementptr double, ptr addrspace(1) %arg1028, i64 %14
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !263
  %30 = select i1 %24, double %27, double %29
  %31 = getelementptr double, ptr addrspace(1) %arg1130, i64 %14
  %32 = load double, ptr addrspace(1) %31, align 8
  %33 = select i1 %17, double %29, double %32
  %34 = select i1 %.not1, double %32, double %33
  %35 = getelementptr double, ptr addrspace(1) %arg1232, i64 %14
  %36 = load double, ptr addrspace(1) %35, align 8
  %37 = getelementptr double, ptr addrspace(1) %arg1436, i64 %14
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !263
  %39 = select i1 %24, double %36, double %38
  %40 = getelementptr double, ptr addrspace(1) %arg1538, i64 %14
  %41 = load double, ptr addrspace(1) %40, align 8
  %42 = select i1 %17, double %38, double %41
  %43 = select i1 %.not1, double %41, double %42
  %44 = getelementptr double, ptr addrspace(1) %arg1742, i64 %14
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !263
  %46 = getelementptr double, ptr addrspace(1) %arg1640, i64 %14
  %47 = load double, ptr addrspace(1) %46, align 8
  %add.4426.5.clone.1 = fadd double %45, %47
  %48 = select i1 %.not1, double %47, double %add.4426.5.clone.1
  %49 = getelementptr double, ptr addrspace(1) %arg1946, i64 %14
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !263
  %51 = getelementptr double, ptr addrspace(1) %arg1844, i64 %14
  %52 = load double, ptr addrspace(1) %51, align 8
  %add.4425.5.clone.1 = fadd double %50, %52
  %53 = select i1 %.not1, double %52, double %add.4425.5.clone.1
  %54 = getelementptr double, ptr addrspace(1) %arg2150, i64 %14
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !263
  %56 = getelementptr double, ptr addrspace(1) %arg2048, i64 %14
  %57 = load double, ptr addrspace(1) %56, align 8
  %add.4430.5.clone.1 = fadd double %55, %57
  %58 = select i1 %.not1, double %57, double %add.4430.5.clone.1
  %59 = getelementptr double, ptr addrspace(1) %arg2354, i64 %14
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !263
  %61 = getelementptr double, ptr addrspace(1) %arg2252, i64 %14
  %62 = load double, ptr addrspace(1) %61, align 8
  %add.4429.5.clone.1 = fadd double %60, %62
  %63 = select i1 %.not1, double %62, double %add.4429.5.clone.1
  %64 = getelementptr double, ptr addrspace(1) %arg2558, i64 %14
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !263
  %66 = getelementptr double, ptr addrspace(1) %arg2456, i64 %14
  %67 = load double, ptr addrspace(1) %66, align 8
  %add.4427.5.clone.1 = fadd double %65, %67
  %68 = select i1 %.not1, double %67, double %add.4427.5.clone.1
  %69 = getelementptr double, ptr addrspace(1) %arg2762, i64 %14
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !263
  %71 = getelementptr double, ptr addrspace(1) %arg2660, i64 %14
  %72 = load double, ptr addrspace(1) %71, align 8
  %add.4428.5.clone.1 = fadd double %70, %72
  %73 = select i1 %.not1, double %72, double %add.4428.5.clone.1
  %74 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg3170, i64 0, i64 %2
  %75 = load i8, ptr addrspace(1) %74, align 1, !invariant.load !263
  %76 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg3272, i64 0, i64 %2
  %77 = load i8, ptr addrspace(1) %76, align 1, !invariant.load !263
  %78 = or i8 %77, %75
  %79 = icmp eq i8 %78, 0
  %80 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg3068, i64 0, i64 %2
  %81 = load i8, ptr addrspace(1) %80, align 1, !invariant.load !263
  %82 = getelementptr double, ptr addrspace(1) %arg2864, i64 %14
  %83 = load double, ptr addrspace(1) %82, align 8
  %84 = getelementptr double, ptr addrspace(1) %arg2966, i64 %14
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !263
  %86 = trunc i8 %81 to i1
  %87 = select i1 %86, double %83, double %85
  %88 = select i1 %79, double %87, double %83
  %89 = select i1 %.not1, double %83, double %88
  %90 = getelementptr double, ptr addrspace(1) %arg3374, i64 %14
  %91 = load double, ptr addrspace(1) %90, align 8
  %92 = getelementptr double, ptr addrspace(1) %arg3476, i64 %14
  %93 = load double, ptr addrspace(1) %92, align 8, !invariant.load !263
  %94 = select i1 %86, double %91, double %93
  %95 = select i1 %79, double %94, double %91
  %96 = select i1 %.not1, double %91, double %95
  %97 = getelementptr double, ptr addrspace(1) %arg3578, i64 %14
  %98 = load double, ptr addrspace(1) %97, align 8
  %99 = getelementptr double, ptr addrspace(1) %arg3680, i64 %14
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !263
  %101 = select i1 %86, double %98, double %100
  %102 = select i1 %79, double %101, double %98
  %103 = select i1 %.not1, double %98, double %102
  %104 = getelementptr double, ptr addrspace(1) %arg3782, i64 %14
  %105 = load double, ptr addrspace(1) %104, align 8
  %106 = getelementptr double, ptr addrspace(1) %arg3884, i64 %14
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !263
  %108 = select i1 %86, double %105, double %107
  %109 = select i1 %79, double %108, double %105
  %110 = select i1 %.not1, double %105, double %109
  %111 = getelementptr double, ptr addrspace(1) %arg3986, i64 %14
  %112 = load double, ptr addrspace(1) %111, align 8
  %113 = getelementptr double, ptr addrspace(1) %arg4088, i64 %14
  %114 = load double, ptr addrspace(1) %113, align 8, !invariant.load !263
  %115 = select i1 %86, double %112, double %114
  %116 = select i1 %79, double %115, double %112
  %117 = select i1 %.not1, double %112, double %116
  %118 = getelementptr double, ptr addrspace(1) %arg4190, i64 %14
  %119 = load double, ptr addrspace(1) %118, align 8
  %120 = getelementptr double, ptr addrspace(1) %arg4292, i64 %14
  %121 = load double, ptr addrspace(1) %120, align 8, !invariant.load !263
  %122 = select i1 %86, double %119, double %121
  %123 = select i1 %79, double %122, double %119
  %124 = select i1 %.not1, double %119, double %123
  %125 = getelementptr double, ptr addrspace(1) %arg4394, i64 %14
  %126 = load double, ptr addrspace(1) %125, align 8
  %127 = getelementptr double, ptr addrspace(1) %arg4496, i64 %14
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !263
  %129 = select i1 %86, double %126, double %128
  %130 = select i1 %79, double %129, double %126
  %131 = select i1 %.not1, double %126, double %130
  %132 = getelementptr double, ptr addrspace(1) %arg4598, i64 %14
  %133 = load double, ptr addrspace(1) %132, align 8
  %134 = getelementptr double, ptr addrspace(1) %arg46100, i64 %14
  %135 = load double, ptr addrspace(1) %134, align 8, !invariant.load !263
  %136 = select i1 %86, double %133, double %135
  %137 = select i1 %79, double %136, double %133
  %138 = select i1 %.not1, double %133, double %137
  %139 = getelementptr double, ptr addrspace(1) %arg47102, i64 %14
  %140 = load double, ptr addrspace(1) %139, align 8
  %141 = getelementptr double, ptr addrspace(1) %arg48104, i64 %14
  %142 = load double, ptr addrspace(1) %141, align 8, !invariant.load !263
  %143 = select i1 %86, double %140, double %142
  %144 = select i1 %79, double %143, double %140
  %145 = select i1 %.not1, double %140, double %144
  %146 = getelementptr double, ptr addrspace(1) %arg49106, i64 %14
  %147 = load double, ptr addrspace(1) %146, align 8
  %148 = getelementptr double, ptr addrspace(1) %arg50108, i64 %14
  %149 = load double, ptr addrspace(1) %148, align 8, !invariant.load !263
  %150 = select i1 %86, double %147, double %149
  %151 = select i1 %79, double %150, double %147
  %152 = select i1 %.not1, double %147, double %151
  %153 = getelementptr double, ptr addrspace(1) %arg51110, i64 %14
  %154 = load double, ptr addrspace(1) %153, align 8
  %155 = getelementptr double, ptr addrspace(1) %arg52112, i64 %14
  %156 = load double, ptr addrspace(1) %155, align 8, !invariant.load !263
  %157 = select i1 %86, double %154, double %156
  %158 = select i1 %79, double %157, double %154
  %159 = select i1 %.not1, double %154, double %158
  %160 = getelementptr double, ptr addrspace(1) %arg53114, i64 %14
  %161 = load double, ptr addrspace(1) %160, align 8
  %162 = getelementptr double, ptr addrspace(1) %arg54116, i64 %14
  %163 = load double, ptr addrspace(1) %162, align 8, !invariant.load !263
  %164 = select i1 %86, double %161, double %163
  %165 = select i1 %79, double %164, double %161
  %166 = select i1 %.not1, double %161, double %165
  store double %21, ptr addrspace(1) %18, align 8
  store double %25, ptr addrspace(1) %22, align 8
  store double %30, ptr addrspace(1) %26, align 8
  store double %34, ptr addrspace(1) %31, align 8
  store double %39, ptr addrspace(1) %35, align 8
  store double %43, ptr addrspace(1) %40, align 8
  store double %48, ptr addrspace(1) %46, align 8
  store double %53, ptr addrspace(1) %51, align 8
  store double %58, ptr addrspace(1) %56, align 8
  store double %63, ptr addrspace(1) %61, align 8
  store double %68, ptr addrspace(1) %66, align 8
  store double %73, ptr addrspace(1) %71, align 8
  store double %89, ptr addrspace(1) %82, align 8
  store double %96, ptr addrspace(1) %90, align 8
  store double %103, ptr addrspace(1) %97, align 8
  store double %110, ptr addrspace(1) %104, align 8
  store double %117, ptr addrspace(1) %111, align 8
  store double %124, ptr addrspace(1) %118, align 8
  store double %131, ptr addrspace(1) %125, align 8
  store double %138, ptr addrspace(1) %132, align 8
  store double %145, ptr addrspace(1) %139, align 8
  store double %152, ptr addrspace(1) %146, align 8
  store double %159, ptr addrspace(1) %153, align 8
  store double %166, ptr addrspace(1) %160, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_97(ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.5757 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !263
  %1 = icmp slt i64 %param_2.5757, 0
  %2 = add i64 %param_2.5757, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5757
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.74934 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !263
  %7 = getelementptr inbounds [10 x [2 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %param_1.74934, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_56(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.5728 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !263
  %1 = icmp slt i64 %param_2.5728, 0
  %2 = add i64 %param_2.5728, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5728
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.74644 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !263
  %7 = getelementptr inbounds [10 x [2 x i64]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i64 %param_1.74644, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_95(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.5761 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !263
  %1 = icmp slt i64 %param_2.5761, 0
  %2 = add i64 %param_2.5761, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5761
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.74974 = load double, ptr addrspace(1) %6, align 8, !invariant.load !263
  %7 = getelementptr inbounds [10 x [2 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.74974, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_54(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !264
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.4669 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !263
  %1 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.57204 = load double, ptr addrspace(1) %1, align 8, !invariant.load !263
  %2 = tail call double @llvm.fma.f64(double %param_2.57204, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #12
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #12
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_2.57204)
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
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.57204) #12
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #12
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_2.57204, 0.000000e+00
  %28 = fadd double %param_2.57204, 0x7FF0000000000000
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
  %40 = icmp slt i64 %param_3.4669, 0
  %41 = add i64 %param_3.4669, 10
  %42 = select i1 %40, i64 %41, i64 %param_3.4669
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 9)
  %45 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.74565 = load i64, ptr addrspace(1) %45, align 8, !invariant.load !263
  %46 = sitofp i64 %param_1.74565 to double
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
attributes #4 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #7 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { norecurse nounwind }
attributes #9 = { convergent nocallback nounwind }
attributes #10 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #11 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257}
!llvm.ident = !{!258}
!nvvmir.version = !{!259}
!llvm.module.flags = !{!260}

!0 = !{ptr @loop_broadcast_fusion_27, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion_27, !"reqntidx", i32 20}
!2 = !{ptr @loop_broadcast_fusion_26, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion_26, !"reqntidx", i32 20}
!4 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion, !"reqntidx", i32 100}
!6 = !{ptr @loop_compare_fusion_4, !"kernel", i32 1}
!7 = !{ptr @loop_compare_fusion_4, !"reqntidx", i32 1}
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
!22 = !{ptr @loop_multiply_fusion_2, !"kernel", i32 1}
!23 = !{ptr @loop_multiply_fusion_2, !"reqntidx", i32 48}
!24 = !{ptr @loop_add_fusion_3, !"kernel", i32 1}
!25 = !{ptr @loop_add_fusion_3, !"reqntidx", i32 2}
!26 = !{ptr @wrapped_slice_5, !"kernel", i32 1}
!27 = !{ptr @wrapped_slice_5, !"reqntidx", i32 8}
!28 = !{ptr @wrapped_slice_4, !"kernel", i32 1}
!29 = !{ptr @wrapped_slice_4, !"reqntidx", i32 8}
!30 = !{ptr @wrapped_slice_3, !"kernel", i32 1}
!31 = !{ptr @wrapped_slice_3, !"reqntidx", i32 8}
!32 = !{ptr @wrapped_slice_2, !"kernel", i32 1}
!33 = !{ptr @wrapped_slice_2, !"reqntidx", i32 8}
!34 = !{ptr @wrapped_slice_1, !"kernel", i32 1}
!35 = !{ptr @wrapped_slice_1, !"reqntidx", i32 8}
!36 = !{ptr @wrapped_slice, !"kernel", i32 1}
!37 = !{ptr @wrapped_slice, !"reqntidx", i32 8}
!38 = !{ptr @loop_dynamic_update_slice_fusion_98, !"kernel", i32 1}
!39 = !{ptr @loop_dynamic_update_slice_fusion_98, !"reqntidx", i32 8}
!40 = !{ptr @loop_broadcast_fusion_22, !"kernel", i32 1}
!41 = !{ptr @loop_broadcast_fusion_22, !"reqntidx", i32 480}
!42 = !{ptr @input_reduce_fusion_4, !"kernel", i32 1}
!43 = !{ptr @input_reduce_fusion_4, !"reqntidx", i32 32}
!44 = !{ptr @loop_add_fusion_2, !"kernel", i32 1}
!45 = !{ptr @loop_add_fusion_2, !"reqntidx", i32 2}
!46 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!47 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 6}
!48 = !{ptr @loop_slice_fusion, !"kernel", i32 1}
!49 = !{ptr @loop_slice_fusion, !"reqntidx", i32 4}
!50 = !{ptr @loop_broadcast_compare_select_fusion, !"kernel", i32 1}
!51 = !{ptr @loop_broadcast_compare_select_fusion, !"reqntidx", i32 2}
!52 = !{ptr @loop_select_fusion_7, !"kernel", i32 1}
!53 = !{ptr @loop_select_fusion_7, !"reqntidx", i32 8}
!54 = !{ptr @loop_concatenate_fusion_2, !"kernel", i32 1}
!55 = !{ptr @loop_concatenate_fusion_2, !"reqntidx", i32 48}
!56 = !{ptr @loop_add_minimum_select_fusion, !"kernel", i32 1}
!57 = !{ptr @loop_add_minimum_select_fusion, !"reqntidx", i32 2}
!58 = !{ptr @input_reduce_fusion_3, !"kernel", i32 1}
!59 = !{ptr @input_reduce_fusion_3, !"reqntidx", i32 32}
!60 = !{ptr @loop_concatenate_fusion, !"kernel", i32 1}
!61 = !{ptr @loop_concatenate_fusion, !"reqntidx", i32 48}
!62 = !{ptr @input_add_exponential_reduce_select_fusion, !"kernel", i32 1}
!63 = !{ptr @input_add_exponential_reduce_select_fusion, !"reqntidx", i32 32}
!64 = !{ptr @loop_broadcast_fusion_14, !"kernel", i32 1}
!65 = !{ptr @loop_broadcast_fusion_14, !"reqntidx", i32 1024}
!66 = !{ptr @loop_broadcast_fusion_13, !"kernel", i32 1}
!67 = !{ptr @loop_broadcast_fusion_13, !"reqntidx", i32 8}
!68 = !{ptr @loop_broadcast_fusion_6, !"kernel", i32 1}
!69 = !{ptr @loop_broadcast_fusion_6, !"reqntidx", i32 1024}
!70 = !{ptr @loop_broadcast_fusion_11, !"kernel", i32 1}
!71 = !{ptr @loop_broadcast_fusion_11, !"reqntidx", i32 8}
!72 = !{ptr @loop_broadcast_fusion_5, !"kernel", i32 1}
!73 = !{ptr @loop_broadcast_fusion_5, !"reqntidx", i32 1024}
!74 = !{ptr @loop_broadcast_fusion_8, !"kernel", i32 1}
!75 = !{ptr @loop_broadcast_fusion_8, !"reqntidx", i32 1024}
!76 = !{ptr @loop_broadcast_fusion_15, !"kernel", i32 1}
!77 = !{ptr @loop_broadcast_fusion_15, !"reqntidx", i32 192}
!78 = !{ptr @loop_broadcast_fusion_9, !"kernel", i32 1}
!79 = !{ptr @loop_broadcast_fusion_9, !"reqntidx", i32 192}
!80 = !{ptr @loop_broadcast_fusion_10, !"kernel", i32 1}
!81 = !{ptr @loop_broadcast_fusion_10, !"reqntidx", i32 8}
!82 = !{ptr @loop_broadcast_fusion_12, !"kernel", i32 1}
!83 = !{ptr @loop_broadcast_fusion_12, !"reqntidx", i32 8}
!84 = !{ptr @loop_broadcast_fusion_18, !"kernel", i32 1}
!85 = !{ptr @loop_broadcast_fusion_18, !"reqntidx", i32 4}
!86 = !{ptr @loop_compare_fusion_2, !"kernel", i32 1}
!87 = !{ptr @loop_compare_fusion_2, !"reqntidx", i32 1}
!88 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 1}
!90 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 8}
!92 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 8}
!94 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 8}
!96 = !{ptr @loop_dynamic_update_slice_fusion_52, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_52, !"reqntidx", i32 1}
!98 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 8}
!100 = !{ptr @loop_dynamic_update_slice_fusion_41, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_41, !"reqntidx", i32 8}
!102 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 8}
!104 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 8}
!106 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 8}
!108 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 8}
!110 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 8}
!112 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 8}
!114 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 8}
!116 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 8}
!118 = !{ptr @loop_dynamic_update_slice_fusion_47, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_47, !"reqntidx", i32 8}
!120 = !{ptr @loop_add_divide_exponential_select_fusion, !"kernel", i32 1}
!121 = !{ptr @loop_add_divide_exponential_select_fusion, !"reqntidx", i32 8}
!122 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 8}
!124 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!125 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 8}
!126 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 8}
!128 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!129 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 8}
!130 = !{ptr @loop_dynamic_update_slice_fusion_28, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_28, !"reqntidx", i32 8}
!132 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 8}
!134 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 8}
!136 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 8}
!138 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 8}
!140 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 8}
!142 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 8}
!144 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 8}
!146 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 8}
!148 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!149 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 8}
!150 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!151 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 8}
!152 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!153 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 8}
!154 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!155 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 8}
!156 = !{ptr @loop_dynamic_update_slice_fusion_20, !"kernel", i32 1}
!157 = !{ptr @loop_dynamic_update_slice_fusion_20, !"reqntidx", i32 8}
!158 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!159 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 8}
!160 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!161 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 8}
!162 = !{ptr @loop_dynamic_update_slice_fusion_24, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_update_slice_fusion_24, !"reqntidx", i32 8}
!164 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 8}
!166 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 8}
!168 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 8}
!170 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!171 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 8}
!172 = !{ptr @loop_dynamic_update_slice_fusion_31, !"kernel", i32 1}
!173 = !{ptr @loop_dynamic_update_slice_fusion_31, !"reqntidx", i32 8}
!174 = !{ptr @loop_dynamic_update_slice_fusion_33, !"kernel", i32 1}
!175 = !{ptr @loop_dynamic_update_slice_fusion_33, !"reqntidx", i32 8}
!176 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!177 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 8}
!178 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!179 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!180 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!181 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 128}
!182 = !{ptr @loop_exponential_fusion, !"kernel", i32 1}
!183 = !{ptr @loop_exponential_fusion, !"reqntidx", i32 128}
!184 = !{ptr @loop_broadcast_fusion_16, !"kernel", i32 1}
!185 = !{ptr @loop_broadcast_fusion_16, !"reqntidx", i32 1024}
!186 = !{ptr @input_scatter_fusion_2, !"kernel", i32 1}
!187 = !{ptr @input_scatter_fusion_2, !"reqntidx", i32 128}
!188 = !{ptr @loop_select_slice_fusion, !"kernel", i32 1}
!189 = !{ptr @loop_select_slice_fusion, !"reqntidx", i32 128}
!190 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!191 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 1024}
!192 = !{ptr @loop_broadcast_fusion_17, !"kernel", i32 1}
!193 = !{ptr @loop_broadcast_fusion_17, !"reqntidx", i32 8}
!194 = !{ptr @loop_dynamic_slice_fusion_2, !"kernel", i32 1}
!195 = !{ptr @loop_dynamic_slice_fusion_2, !"reqntidx", i32 1}
!196 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!197 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!198 = !{ptr @loop_dynamic_slice_fusion_4, !"kernel", i32 1}
!199 = !{ptr @loop_dynamic_slice_fusion_4, !"reqntidx", i32 8}
!200 = !{ptr @loop_dynamic_slice_fusion_3, !"kernel", i32 1}
!201 = !{ptr @loop_dynamic_slice_fusion_3, !"reqntidx", i32 8}
!202 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!203 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 8}
!204 = !{ptr @loop_broadcast_fusion_2, !"kernel", i32 1}
!205 = !{ptr @loop_broadcast_fusion_2, !"reqntidx", i32 4}
!206 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!207 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 4}
!208 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!209 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 8}
!210 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!211 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 8}
!212 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!213 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 8}
!214 = !{ptr @input_reduce_fusion_1, !"kernel", i32 1}
!215 = !{ptr @input_reduce_fusion_1, !"reqntidx", i32 1024}
!216 = !{ptr @loop_concatenate_fusion_1, !"kernel", i32 1}
!217 = !{ptr @loop_concatenate_fusion_1, !"reqntidx", i32 48}
!218 = !{ptr @input_reduce_select_fusion, !"kernel", i32 1}
!219 = !{ptr @input_reduce_select_fusion, !"reqntidx", i32 32}
!220 = !{ptr @input_reduce_fusion_2, !"kernel", i32 1}
!221 = !{ptr @input_reduce_fusion_2, !"reqntidx", i32 1024}
!222 = !{ptr @loop_add_compare_convert_select_fusion, !"kernel", i32 1}
!223 = !{ptr @loop_add_compare_convert_select_fusion, !"reqntidx", i32 2}
!224 = !{ptr @input_scatter_fusion_1, !"kernel", i32 1}
!225 = !{ptr @input_scatter_fusion_1, !"reqntidx", i32 48}
!226 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!227 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 128}
!228 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!229 = !{ptr @input_reduce_fusion, !"reqntidx", i32 32}
!230 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!231 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 48}
!232 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!233 = !{ptr @loop_compare_fusion, !"reqntidx", i32 2}
!234 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!235 = !{ptr @loop_select_fusion, !"reqntidx", i32 2}
!236 = !{ptr @loop_select_fusion_2, !"kernel", i32 1}
!237 = !{ptr @loop_select_fusion_2, !"reqntidx", i32 8}
!238 = !{ptr @loop_select_fusion_3, !"kernel", i32 1}
!239 = !{ptr @loop_select_fusion_3, !"reqntidx", i32 2}
!240 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!241 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 48}
!242 = !{ptr @loop_select_fusion_5, !"kernel", i32 1}
!243 = !{ptr @loop_select_fusion_5, !"reqntidx", i32 8}
!244 = !{ptr @loop_select_fusion_4, !"kernel", i32 1}
!245 = !{ptr @loop_select_fusion_4, !"reqntidx", i32 128}
!246 = !{ptr @loop_compare_select_fusion, !"kernel", i32 1}
!247 = !{ptr @loop_compare_select_fusion, !"reqntidx", i32 2}
!248 = !{ptr @loop_select_fusion_6, !"kernel", i32 1}
!249 = !{ptr @loop_select_fusion_6, !"reqntidx", i32 8}
!250 = !{ptr @loop_dynamic_update_slice_fusion_97, !"kernel", i32 1}
!251 = !{ptr @loop_dynamic_update_slice_fusion_97, !"reqntidx", i32 2}
!252 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!253 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 2}
!254 = !{ptr @loop_dynamic_update_slice_fusion_95, !"kernel", i32 1}
!255 = !{ptr @loop_dynamic_update_slice_fusion_95, !"reqntidx", i32 2}
!256 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!257 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 2}
!258 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!259 = !{i32 2, i32 0}
!260 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!261 = !{i32 0, i32 20}
!262 = !{i32 0, i32 100}
!263 = !{}
!264 = !{i32 0, i32 2}
!265 = !{i32 0, i32 8}
!266 = !{i32 0, i32 48}
!267 = !{i32 0, i32 480}
!268 = !{i32 0, i32 32}
!269 = !{i32 0, i32 6}
!270 = !{i32 0, i32 4}
!271 = !{i32 0, i32 1024}
!272 = !{i32 0, i32 192}
!273 = !{i32 0, i32 12}
!274 = !{i32 0, i32 128}
!275 = !{i32 0, i32 24}
!276 = distinct !{!276, !277}
!277 = !{!"llvm.loop.vectorize.enable", i1 false}
!278 = distinct !{!278, !277}
!279 = distinct !{!279, !277}
